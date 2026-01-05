 #include <pmm.h>
 #include <memlayout.h>
 #include <list.h>
 #include <string.h>
 #include <slub.h>

// Simplified SLUB allocator on top of page allocator.
// Each kmem_cache manages slabs of objects with fixed size and alignment.
// Slab is one or more contiguous pages carved into objects.

#ifndef SLUB_MAX_PARTIAL
#define SLUB_MAX_PARTIAL 64
#endif

typedef struct slab {
    struct Page *head_page;     // first page of this slab
    struct obj_hdr *free_list;  // single-linked list of free objects (header contains next+slab)
    size_t inuse;               // number of allocated objects
    size_t total;               // total objects in this slab
    list_entry_t link;          // link in cache lists
} slab_t;

typedef struct obj_hdr {
    struct obj_hdr *next;
    slab_t *slab;
} obj_hdr_t;

struct kmem_cache {
    const char *name;
    size_t size;
    size_t align;
    size_t objs_per_slab;       // computed by slab size and object size
    size_t slab_pages;          // number of pages per slab
    list_entry_t partial;       // slabs with free objects
    list_entry_t full;          // full slabs
    list_entry_t empty;         // empty slabs (optional)
    struct Page *meta_page;     // backing page for this cache descriptor
};

static inline size_t round_up(size_t x, size_t a) { return (x + a - 1) / a * a; }

static void slab_build_freelist(slab_t *s, struct kmem_cache *cache, void *mem) {
    s->free_list = NULL;
    s->inuse = 0;
    size_t obj_payload = round_up(cache->size, cache->align);
    size_t stride = round_up(sizeof(obj_hdr_t), cache->align) + obj_payload;
    // available bytes exclude the slab header placed at the beginning
    size_t header_off = (size_t)((uintptr_t)mem - (uintptr_t)s);
    size_t bytes = cache->slab_pages * PGSIZE;
    size_t avail = (bytes > header_off) ? (bytes - header_off) : 0;
    size_t total = (avail / stride);
    s->total = total;
    char *p = (char *)mem;
    for (size_t i = 0; i < total; ++i) {
        obj_hdr_t *hdr = (obj_hdr_t *)p;
        hdr->slab = s;
        hdr->next = s->free_list;
        s->free_list = hdr;
        p += stride;
    }
}

void slub_init(void) {
    // nothing global for now
}

// helper: list entry -> slab
#define le2slab(le) to_struct((le), slab_t, link)

struct kmem_cache *kmem_cache_create(const char *name, size_t size, size_t align) {
    if (align == 0) align = sizeof(void *);
    struct Page *meta_pg = alloc_page();
    if (!meta_pg) return NULL;
    void *kmem = (void *)(page2pa(meta_pg) + va_pa_offset);
    struct kmem_cache *cache = (struct kmem_cache *)kmem;
    memset(cache, 0, sizeof(*cache));
    cache->name = name;
    cache->size = size;
    cache->align = align;
    cache->meta_page = meta_pg;
    list_init(&cache->partial);
    list_init(&cache->full);
    list_init(&cache->empty);

    // policy: 1 page per slab for small objects; else grow to next power-of-two pages to ensure alignment
    size_t objsz = round_up(size, align);
    size_t objs = PGSIZE / objsz;
    size_t pages = 1;
    if (objs == 0) {
        // pick minimal power-of-two pages to fit at least one object
        size_t need = (objsz + PGSIZE - 1) / PGSIZE;
        // next power-of-two
        pages = 1;
        while (pages < need) pages <<= 1;
        objs = (pages * PGSIZE) / objsz;
    }
    cache->slab_pages = pages;
    cache->objs_per_slab = objs;
    return cache;
}

void kmem_cache_destroy(struct kmem_cache *cache) {
    // free all remaining slabs in lists
    list_entry_t *le;
    while (!list_empty(&cache->partial)) {
        le = list_next(&cache->partial);
        slab_t *s = le2slab(le);
        list_del(le);
        free_pages(s->head_page, cache->slab_pages);
    }
    while (!list_empty(&cache->full)) {
        le = list_next(&cache->full);
        slab_t *s = le2slab(le);
        list_del(le);
        free_pages(s->head_page, cache->slab_pages);
    }
    while (!list_empty(&cache->empty)) {
        le = list_next(&cache->empty);
        slab_t *s = le2slab(le);
        list_del(le);
        // pages may have been released on becoming empty; free again is safe only if tracked.
        // Here we assume we moved empty slabs without releasing pages in free(); keep it consistent.
        free_pages(s->head_page, cache->slab_pages);
    }
    // free cache descriptor backing page
    free_page(cache->meta_page);
}

static slab_t *slab_new(struct kmem_cache *cache) {
    struct Page *pg = alloc_pages(cache->slab_pages);
    if (!pg) return NULL;
    // map to kernel virtual address
    uintptr_t pa = page2pa(pg);
    void *mem = (void *)(pa + va_pa_offset);

    slab_t *s = (slab_t *)mem;
    // place header at the first bytes of the slab, then objects after header rounded up
    size_t header = round_up(sizeof(slab_t), cache->align);
    slab_build_freelist(s, cache, (char *)mem + header);
    s->head_page = pg;

    list_add(&cache->partial, &(s->link));
    return s;
}

void *kmem_cache_alloc(struct kmem_cache *cache) {
    // try partial first
    list_entry_t *le = &cache->partial;
    if (list_empty(le)) {
        slab_t *s = slab_new(cache);
        if (!s) return NULL;
    }
    le = list_next(le);
    slab_t *s = le2slab(le);
    obj_hdr_t *hdr = s->free_list;
    if (!hdr) return NULL; // should not happen for partial
    s->free_list = hdr->next;
    s->inuse++;
    if (s->inuse == s->total) {
        list_del(&(s->link));
        list_add(&cache->full, &(s->link));
    }
    return (void *)(hdr + 1);
}

void kmem_cache_free(struct kmem_cache *cache, void *obj) {
    obj_hdr_t *hdr = ((obj_hdr_t *)obj) - 1;
    slab_t *s = hdr->slab;
    hdr->next = s->free_list;
    s->free_list = hdr;
    if (s->inuse == s->total) {
        // moved from full to partial
        list_del(&(s->link));
        list_add(&cache->partial, &(s->link));
    }
    s->inuse--;
    if (s->inuse == 0) {
        // move to empty；此处选择不立即释放页，保留到 destroy 或策略回收
        list_del(&(s->link));
        list_add(&cache->empty, &(s->link));
    }
}

// ---- Test helpers (only used in selftest within this file) ----
static size_t list_length(list_entry_t *head) {
    size_t n = 0; list_entry_t *le = head;
    while ((le = list_next(le)) != head) ++n;
    return n;
}

static void verify_cache(struct kmem_cache *c) {
    // Invariants: for each slab, 0 <= inuse <= total; free_list length == total - inuse
    // And slabs distributed across lists correctly by inuse==0 or ==total
    list_entry_t *le;
    // partial
    le = &c->partial;
    while ((le = list_next(le)) != &c->partial) {
        slab_t *s = le2slab(le);
        size_t freecnt = 0; obj_hdr_t *h = s->free_list; while (h) { ++freecnt; h = h->next; }
        assert(s->inuse <= s->total);
        assert(freecnt + s->inuse == s->total);
        assert(s->inuse > 0 && s->inuse < s->total);
    }
    // full
    le = &c->full;
    while ((le = list_next(le)) != &c->full) {
        slab_t *s = le2slab(le);
        assert(s->inuse == s->total);
        assert(s->free_list == NULL);
    }
    // empty
    le = &c->empty;
    while ((le = list_next(le)) != &c->empty) {
        slab_t *s = le2slab(le);
        size_t freecnt = 0; obj_hdr_t *h = s->free_list; while (h) { ++freecnt; h = h->next; }
        assert(s->inuse == 0);
        assert(freecnt == s->total);
    }
}

void slub_selftest(void) {
    // Basic caches
    struct kmem_cache *c32 = kmem_cache_create("c32", 32, 8);
    struct kmem_cache *c128 = kmem_cache_create("c128", 128, 16);
    // Multi-page slab cache
    struct kmem_cache *c6k = kmem_cache_create("c6k", 6000, 16);

    // Case 1: fill >1 slab, free all, check lists
    size_t n1 = c32->objs_per_slab * 2 + 10;
    void **a = (void **)alloc_pages(1); // temp array storage in one page
    assert(a != NULL);
    for (size_t i = 0; i < n1; ++i) {
        a[i] = kmem_cache_alloc(c32);
        assert(a[i] != NULL);
        memset(a[i], 0xA5, 32);
    }
    verify_cache(c32);
    // free in alternating pattern
    for (size_t i = 0; i < n1; i += 2) kmem_cache_free(c32, a[i]);
    verify_cache(c32);
    for (size_t i = 1; i < n1; i += 2) kmem_cache_free(c32, a[i]);
    verify_cache(c32);

    // Case 2: different size cache
    size_t n2 = c128->objs_per_slab + 5;
    for (size_t i = 0; i < n2; ++i) {
        void *p = kmem_cache_alloc(c128); assert(p); memset(p, 0x5A, 128); kmem_cache_free(c128, p);
    }
    verify_cache(c128);

    // Case 3: multi-page slabs
    size_t n3 = c6k->objs_per_slab * 3;
    for (size_t i = 0; i < n3; ++i) {
        void *p = kmem_cache_alloc(c6k); assert(p); memset(p, 0xCC, 6000);
        if ((i & 1) == 0) kmem_cache_free(c6k, p); // free half immediately
    }
    verify_cache(c6k);

    // Cleanup
    kmem_cache_destroy(c32);
    kmem_cache_destroy(c128);
    kmem_cache_destroy(c6k);
}
