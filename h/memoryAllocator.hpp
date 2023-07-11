//
// Created by os on 8/6/22.
//

#ifndef PROJECT_BASE_V1_1_MEMALLOCATOR_H
#define PROJECT_BASE_V1_1_MEMALLOCATOR_H
#include "../lib/hw.h"
struct FreeMemorySegment{
    FreeMemorySegment* next;
    FreeMemorySegment* prev;
    size_t size;
};
class MemoryAllocator {
    FreeMemorySegment *head=nullptr;
    void tryToJoin(FreeMemorySegment* cur);
public:
    static MemoryAllocator& getInstance();
    void *mem_alloc(size_t sz);
    int mem_free(void* adr);

};
#endif //PROJECT_BASE_V1_1_MEMALLOCATOR_H
