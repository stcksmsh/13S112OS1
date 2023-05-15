#ifndef MEM_ALLOCATOR_HEADERFILE
#define MEM_ALLOCATOR_HEADERFILE
#include "../lib/hw.h"
struct FreeMem{
    FreeMem* next;
    FreeMem* prev;
    size_t size;
};
class MemAlloc {
    FreeMem *head=nullptr;
    void tryToJoin(FreeMem* cur);
public:
    static MemAlloc& getInstance();
    void *mem_alloc(size_t sz);
    int mem_free(void* adr);

};
#endif
