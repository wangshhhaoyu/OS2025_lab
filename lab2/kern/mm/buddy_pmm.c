// A Buddy System page-frame allocator built on uCore's pmm_manager API.
// Block size is in units of pages. Each order k manages blocks of size (1<<k) pages.
// We store block size in pages in Page.property for free block heads, and set PG_property.

#include <pmm.h>
#include <list.h>
#include <string.h>
#include <stdio.h>

#ifndef MAX_BUDDY_ORDER
// 2^20 pages = 4Gi pages; practical DRAM smaller. Clamp runtime to npage.
#define MAX_BUDDY_ORDER 20
#endif

typedef struct {
    list_entry_t freelist[MAX_BUDDY_ORDER + 1]; // per-order free lists
    size_t nblocks[MAX_BUDDY_ORDER + 1];        // number of free blocks per order
    int max_order;                               // runtime max order bound
} buddy_area_t;

static buddy_area_t buddy;

static inline size_t order_size(int order) { return ((size_t)1) << order; }

// Return page index in absolute PPN space (pages[] base + nbase offset)
static inline size_t page_index(struct Page *p) {
    return (size_t)(p - pages + nbase);
}

static inline int ilog2_floor(size_t x) {
    int l = -1;
    while (x) { x >>= 1; ++l; }
    return (l < 0) ? 0 : l;
}

static inline int ilog2_ceil(size_t x) {
    if (x <= 1) return (x == 0) ? 0 : 0;
    int f = ilog2_floor(x - 1);
    return f + 1;
}

// count trailing zeros for positive x
static inline int ctz_size_t(size_t x) {
    if (x == 0) return buddy.max_order; // treat as fully aligned (won't usually happen for DRAM base)
    int c = 0;
    while ((x & 1) == 0) { x >>= 1; ++c; }
    return c;
}

static inline void flist_init(void) {
    for (int i = 0; i <= MAX_BUDDY_ORDER; ++i) {
        list_init(&buddy.freelist[i]);
        buddy.nblocks[i] = 0;
    }
}

static inline void push_block(int order, struct Page *head) {
    head->property = order_size(order); // store block size in pages for readability
    SetPageProperty(head);
    list_add(&buddy.freelist[order], &(head->page_link));
    buddy.nblocks[order] += 1;
}

static inline void remove_block(int order, struct Page *head) {
    list_del(&(head->page_link));
    buddy.nblocks[order] -= 1;
}

static inline struct Page *pop_block(int order) {
    list_entry_t *le = list_next(&buddy.freelist[order]);
    if (le == &buddy.freelist[order]) return NULL;
    struct Page *p = le2page(le, page_link);
    remove_block(order, p);
    return p;
}

static inline int find_block_in_order(int order, struct Page *target) {
    // return 1 if found (and remove it), else 0
    list_entry_t *le = &buddy.freelist[order];
    while ((le = list_next(le)) != &buddy.freelist[order]) {
        struct Page *p = le2page(le, page_link);
        if (p == target) {
            remove_block(order, p);
            ClearPageProperty(p);
            return 1;
        }
    }
    return 0;
}

// simple LCG random helper used by tests
static inline unsigned long rnd_lcg(unsigned long *seed) {
    *seed = (*seed) * 1664525UL + 1013904223UL;
    return *seed;
}

static void buddy_init(void) {
    flist_init();
    // runtime bound: cannot exceed both MAX_BUDDY_ORDER and the physical span
    int max_by_npage = ilog2_floor(npage > 0 ? npage : 1);
    buddy.max_order = max_by_npage < MAX_BUDDY_ORDER ? max_by_npage : MAX_BUDDY_ORDER;
}

static void buddy_init_memmap(struct Page *base, size_t n) {
    assert(n > 0);
    // at this point, npage has been set; upgrade max_order using current free span n
    int max_by_n = ilog2_floor(n);
    int new_max = max_by_n < MAX_BUDDY_ORDER ? max_by_n : MAX_BUDDY_ORDER;
    if (new_max > buddy.max_order) buddy.max_order = new_max;
    // clear per-page flags before inserting blocks
    struct Page *p = base;
    for (; p != base + n; ++p) {
        assert(PageReserved(p));
        p->flags = 0;
        p->property = 0;
        set_page_ref(p, 0);
    }

    // segment [base, base+n) into aligned power-of-two blocks
    struct Page *cur = base;
    size_t remain = n;
    while (remain > 0) {
        size_t idx = page_index(cur);
        int align_ord = ctz_size_t(idx);               // alignment constraint by address
        int size_ord = ilog2_floor(remain);            // bound by remaining length
        int ord = align_ord < size_ord ? align_ord : size_ord;
        if (ord > buddy.max_order) ord = buddy.max_order;
        push_block(ord, cur);
        cur += order_size(ord);
        remain -= order_size(ord);
    }
}

static struct Page *buddy_alloc_pages(size_t n) {
    assert(n > 0);
    // round up to next power-of-two pages
    int need_ord = ilog2_ceil(n);
    if (need_ord > buddy.max_order) return NULL;

    // find first non-empty order >= need_ord
    int o = need_ord;
    while (o <= buddy.max_order && list_empty(&buddy.freelist[o])) {
        ++o;
    }
    if (o > buddy.max_order) return NULL; // out of memory

    // take one block from order o and split down to need_ord
    struct Page *blk = pop_block(o);
    while (o > need_ord) {
        o -= 1;
        struct Page *right = blk + order_size(o);
        // push the right buddy into order o
        push_block(o, right);
        // keep left half in blk to continue splitting
    }
    // mark allocated block: clear property flag
    ClearPageProperty(blk);
    // per-page ref/flags for allocated range are not set here; upper layers may set refs on map
    return blk;
}

static void buddy_free_pages(struct Page *base, size_t n) {
    assert(n > 0);
    // reset pages state like default_free_pages does
    struct Page *p = base;
    for (; p != base + n; ++p) {
        assert(!PageReserved(p) && !PageProperty(p));
        p->flags = 0;
        set_page_ref(p, 0);
    }

    // free in power-of-two aligned chunks, coalescing with buddy on-the-fly
    struct Page *cur = base;
    size_t remain = n;
    while (remain > 0) {
        size_t idx = page_index(cur);
        int align_ord = ctz_size_t(idx);
        int size_ord = ilog2_floor(remain);
        int ord = align_ord < size_ord ? align_ord : size_ord;
        if (ord > buddy.max_order) ord = buddy.max_order;

        // start with inserting current block at ord, then try to coalesce upward
        struct Page *blk = cur;
        int co_ord = ord;

        // attempt to merge with buddy repeatedly
        for (;;) {
            size_t blk_idx = page_index(blk);
            size_t buddy_idx = blk_idx ^ order_size(co_ord);
            struct Page *buddy_blk = blk + (buddy_idx - blk_idx);

            // buddy must be free block head in same order
            int merged = 0;
            // first, try to remove buddy from freelist[co_ord]
            if (PageProperty(buddy_blk) && buddy_blk->property == order_size(co_ord)) {
                if (find_block_in_order(co_ord, buddy_blk)) {
                    // choose new head as lower address
                    if (buddy_blk < blk) blk = buddy_blk;
                    // promote order
                    co_ord += 1;
                    if (co_ord > buddy.max_order) {
                        // cannot promote further
                        break;
                    }
                    merged = 1;
                    // continue try to merge at higher order
                    continue;
                }
            }
            if (!merged) {
                // couldn't merge; put current blk into freelist at co_ord
                push_block(co_ord, blk);
                break;
            }
        }

        cur += order_size(ord);
        remain -= order_size(ord);
    }
}

static size_t buddy_nr_free_pages(void) {
    size_t total = 0;
    for (int o = 0; o <= buddy.max_order; ++o) {
        total += buddy.nblocks[o] * order_size(o);
    }
    return total;
}

static void dump_buddy_state(const char *tag) {
    cprintf("[buddy] %s: max_order=%d total_free=%lu pages\n", tag, buddy.max_order, (unsigned long)buddy_nr_free_pages());
    for (int o = 0; o <= buddy.max_order; ++o) {
        size_t cnt = buddy.nblocks[o];
        if (cnt != 0) {
            cprintf("  order %2d: blocks=%lu pages=%lu\n", o, (unsigned long)cnt, (unsigned long)(cnt * order_size(o)));
        }
    }
}

// verify free-list invariants across all orders
static void verify_invariants(void) {
    size_t counted = 0;
    for (int o = 0; o <= buddy.max_order; ++o) {
        size_t blocks = 0;
        list_entry_t *le = &buddy.freelist[o];
        while ((le = list_next(le)) != &buddy.freelist[o]) {
            struct Page *p = le2page(le, page_link);
            assert(PageProperty(p));
            assert(p->property == order_size(o));
            blocks += 1;
            counted += order_size(o);
        }
        assert(blocks == buddy.nblocks[o]);
    }
    assert(counted == buddy_nr_free_pages());
}

static void buddy_basic_check(void) {
    // Minimal sanity test: allocate several sizes and verify capacity accounting and basic coalescing.
    size_t before = buddy_nr_free_pages();
    dump_buddy_state("begin basic_check");
    struct Page *a = buddy_alloc_pages(1);
    assert(a != NULL);
    cprintf("[buddy] allocated a(1 page)\n");
    struct Page *b = buddy_alloc_pages(2);
    if (b == NULL) {
        cprintf("[buddy] alloc b(2 pages) failed\n");
        dump_buddy_state("after a, before b");
        // try to allocate highest order once to trigger split path for diagnostics
        for (int o = buddy.max_order; o > 1; --o) {
            if (!list_empty(&buddy.freelist[o])) {
                cprintf("[buddy] diagnostic: found non-empty order %d before b allocation\n", o);
                break;
            }
        }
    }
    assert(b != NULL);
    cprintf("[buddy] allocated b(2 pages)\n");
    struct Page *c = buddy_alloc_pages(3); // rounded to 4
    assert(c != NULL);
    cprintf("[buddy] allocated c(3->4 pages)\n");
    size_t used = 1 + 2 + 4; // in pages
    assert(buddy_nr_free_pages() + used == before);

    buddy_free_pages(a, 1);
    buddy_free_pages(b, 2);
    buddy_free_pages(c, 4); // free rounded allocation size to restore full capacity
    assert(buddy_nr_free_pages() == before);
    dump_buddy_state("end basic_check");
}

static void buddy_check(void) {
    verify_invariants();
    buddy_basic_check();
    verify_invariants();

    // Test 1: split-down and exact free restore for multiple orders
    size_t baseline = buddy_nr_free_pages();
    for (int o = 0; o <= buddy.max_order; ++o) {
        size_t need = order_size(o);
        struct Page *p = buddy_alloc_pages(need);
        if (p == NULL) continue; // not enough memory for this order currently
        // pages allocated should be aligned to need boundary in PPN index
        assert((page_index(p) & (need - 1)) == 0);
        buddy_free_pages(p, need);
        assert(buddy_nr_free_pages() == baseline);
        verify_invariants();
    }

    // Test 2: coalesce across two buddies (allocate 2 blocks of same order and free)
    for (int o = 0; o < buddy.max_order; ++o) {
        size_t sz = order_size(o);
        struct Page *a = buddy_alloc_pages(sz);
        if (!a) continue;
        struct Page *b = buddy_alloc_pages(sz);
        if (!b) { buddy_free_pages(a, sz); continue; }
        // The two blocks may or may not be buddies; freeing both should not leak
        size_t before = buddy_nr_free_pages();
        buddy_free_pages(a, sz);
        buddy_free_pages(b, sz);
        assert(buddy_nr_free_pages() == before + sz + sz);
        verify_invariants();
    }

    // Test 3: exhaust at an order then free back
    for (int o = 0; o <= buddy.max_order; ++o) {
        struct Page *vec[128];
        int cnt = 0;
        size_t sz = order_size(o);
        size_t before = buddy_nr_free_pages();
        while (cnt < 128) {
            struct Page *p = buddy_alloc_pages(sz);
            if (!p) break;
            vec[cnt++] = p;
        }
        for (int i = 0; i < cnt; ++i) buddy_free_pages(vec[i], sz);
        assert(buddy_nr_free_pages() == before);
        verify_invariants();
    }

    // Test 4: randomized small stress and overlap check
    // Track up to N allocations; ensure address ranges do not overlap
    struct { struct Page *p; size_t idx, len; } rec[256];
    int rc = 0;
    size_t start_free = buddy_nr_free_pages();
    unsigned long seed = 1234567;
    for (int step = 0; step < 500; ++step) {
        if ((rnd_lcg(&seed) & 3) != 0 && rc < 256) {
            // alloc: choose random order up to min(6, max_order)
            int omax = buddy.max_order < 6 ? buddy.max_order : 6;
            int o = (int)(rnd_lcg(&seed) % (omax + 1));
            size_t need = order_size(o);
            struct Page *p = buddy_alloc_pages(need);
            if (!p) continue;
            size_t idx = page_index(p);
            // overlap check
            for (int i = 0; i < rc; ++i) {
                size_t a0 = rec[i].idx, a1 = rec[i].idx + rec[i].len;
                size_t b0 = idx, b1 = idx + need;
                assert(!(b0 < a1 && a0 < b1));
            }
            rec[rc].p = p;
            rec[rc].idx = idx;
            rec[rc].len = need;
            rc++;
        } else if (rc > 0) {
            // free random one
            int k = (int)(rnd_lcg(&seed) % rc);
            buddy_free_pages(rec[k].p, rec[k].len);
            rec[k] = rec[rc - 1];
            rc--;
        }
    }
    // free remaining
    while (rc > 0) { rc--; buddy_free_pages(rec[rc].p, rec[rc].len); }
    assert(buddy_nr_free_pages() >= start_free);
    verify_invariants();
}

const struct pmm_manager buddy_pmm_manager = {
    .name = "buddy_pmm_manager",
    .init = buddy_init,
    .init_memmap = buddy_init_memmap,
    .alloc_pages = buddy_alloc_pages,
    .free_pages = buddy_free_pages,
    .nr_free_pages = buddy_nr_free_pages,
    .check = buddy_check,
};

