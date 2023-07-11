#include "../h/memoryAllocator.hpp"

void *MemoryAllocator::mem_alloc( size_t size ){
    static bool headInitialised = false;
    if(!headInitialised){
        headInitialised = true;
        head = (FreeMemorySegment*)((uint64)HEAP_START_ADDR);
        head->prevSegment = nullptr;
        head->nextSegment = nullptr;
        head->segmentSize = ((size_t)( (uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR ) - sizeof(MemoryAllocator) ) / MEM_BLOCK_SIZE;
    }
    FreeMemorySegment* freeSegment = head;
    while(freeSegment != nullptr && freeSegment->segmentSize < size)freeSegment = freeSegment->nextSegment;
    if(freeSegment == nullptr || freeSegment->segmentSize < size)return nullptr;
    if(freeSegment->segmentSize == size){
        if(freeSegment->prevSegment) freeSegment->prevSegment->nextSegment = freeSegment->nextSegment;
        else head = freeSegment->nextSegment;
        if(freeSegment->nextSegment != nullptr) freeSegment->nextSegment->prevSegment = freeSegment->prevSegment;
        return (void*)((uint64)freeSegment + MEM_BLOCK_SIZE);
    }
    FreeMemorySegment* newSegment = (FreeMemorySegment*)((uint64)freeSegment + size * MEM_BLOCK_SIZE + MEM_BLOCK_SIZE);
    newSegment->segmentSize = freeSegment->segmentSize - size;
    newSegment->prevSegment = freeSegment->prevSegment;
    newSegment->nextSegment = freeSegment->nextSegment;
    
    if(newSegment->nextSegment != nullptr) newSegment->nextSegment->prevSegment = newSegment;
    if(newSegment->prevSegment != nullptr) newSegment->prevSegment->nextSegment = newSegment;
    else head = newSegment;
    freeSegment->segmentSize = size;
    return (void*)((uint64)freeSegment + MEM_BLOCK_SIZE);
}

MemoryAllocator& MemoryAllocator::getInstance() {
    static MemoryAllocator instance;
    return instance;
}

void MemoryAllocator::attemptMerge( FreeMemorySegment *segment ) {
    if((uint64)segment->nextSegment != (uint64)segment + (segment->segmentSize + 1)*MEM_BLOCK_SIZE)
        return;
    segment->segmentSize += segment->nextSegment->segmentSize;
    segment->nextSegment = segment->nextSegment->nextSegment;
    if(segment->nextSegment) segment->nextSegment->prevSegment = segment;
}

int MemoryAllocator::numberOfSegments(){
    int count = 0;
    FreeMemorySegment *segment = head;
    while(segment){
        count ++;
        segment = segment->nextSegment;
    }
    return count;
}

int MemoryAllocator::mem_free( void *address ) {
    if((uint64)address >= (uint64)HEAP_END_ADDR || (uint64)address < (uint64)HEAP_START_ADDR)
        return -1;
    FreeMemorySegment* previousSegment = nullptr;
    if(head && head->nextSegment < address){
        previousSegment = head;
        while(previousSegment->nextSegment != nullptr && previousSegment->nextSegment < address)
            previousSegment = previousSegment->nextSegment;
    }

    FreeMemorySegment* newSegment = (FreeMemorySegment*)((uint64)address - MEM_BLOCK_SIZE);
    newSegment->prevSegment = previousSegment;
    if(previousSegment){
        if(previousSegment->nextSegment)
            previousSegment->nextSegment->prevSegment = newSegment;
        newSegment->nextSegment = previousSegment->nextSegment;
        previousSegment->nextSegment = newSegment;
    }else{
        newSegment->nextSegment = head;
        head = newSegment;
    }
    if(previousSegment)attemptMerge(previousSegment);
    attemptMerge(newSegment);
    return 0;
}