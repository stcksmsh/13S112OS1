#ifndef MEMORYALLOCATORHEADERFILE
#define MEMORYALLOCATORHEADERFILE

#include "../lib/hw.h"
struct FreeMemorySegment{
    FreeMemorySegment* prevSegment;
    FreeMemorySegment* nextSegment;
    size_t segmentSize;
};
class MemoryAllocator {
public:
    static MemoryAllocator& getInstance();
private:
    MemoryAllocator(){};
    MemoryAllocator( MemoryAllocator const& ) = delete;
    MemoryAllocator& operator=( MemoryAllocator const& ) = delete;
    FreeMemorySegment *head = nullptr;
    void attemptMerge( FreeMemorySegment* );
public:
    void *mem_alloc( size_t );
    int mem_free( void* );
    int numberOfSegments();
};

#endif