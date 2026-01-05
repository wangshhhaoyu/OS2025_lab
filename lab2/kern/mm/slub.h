#ifndef __KERN_MM_SLUB_H__
#define __KERN_MM_SLUB_H__

#include <defs.h>
#include <list.h>

struct kmem_cache;

void slub_init(void);
struct kmem_cache *kmem_cache_create(const char *name, size_t size, size_t align);
void kmem_cache_destroy(struct kmem_cache *cache);
void *kmem_cache_alloc(struct kmem_cache *cache);
void kmem_cache_free(struct kmem_cache *cache, void *obj);

// Optional self-test
void slub_selftest(void);

#endif /* !__KERN_MM_SLUB_H__ */
