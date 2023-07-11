#include "../h/memoryAllocator.hpp"
#include "../lib/console.h"

void *MemoryAllocator::mem_alloc( size_t size ){
    /// creates it only on first call of the function, thus the head can only be initialised once
    if(head == nullptr){
        head = (FreeMemorySegment*)((uint64)HEAP_START_ADDR);
        head->prevSegment = nullptr;
        head->nextSegment = nullptr;
        head->segmentSize = ((size_t)( (uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR ) - sizeof(MemoryAllocator) ) / MEM_BLOCK_SIZE;
    }
    FreeMemorySegment* freeSegment = head;
    /// search for segment with enough space
    while(freeSegment != nullptr && freeSegment->segmentSize < size)freeSegment = freeSegment->nextSegment;
    /// not enough space found, cant allocate
    if(freeSegment == nullptr || freeSegment->segmentSize < size)return nullptr;

    /// in case of perfect fit
    if(freeSegment->segmentSize == size){
        if(freeSegment->prevSegment != nullptr){
            freeSegment->prevSegment->nextSegment = freeSegment->nextSegment;
        }else{
            head = freeSegment->nextSegment;
        }

        if(freeSegment->nextSegment != nullptr){
            freeSegment->nextSegment->prevSegment = freeSegment->prevSegment;
        }

        return (void*)freeSegment;
    }

    /// not a perfect fit, must merge the remaining memory with the previous / following segment
    FreeMemorySegment* newSegment = (FreeMemorySegment*)((uint64)freeSegment + size + 1);
    newSegment->segmentSize = freeSegment->segmentSize - size;
    newSegment->prevSegment = freeSegment->prevSegment;
    newSegment->nextSegment = freeSegment->nextSegment;
    
    if(newSegment->nextSegment != nullptr){
        newSegment->nextSegment->prevSegment = newSegment;
        /// attempts to merge newSegments and the one after it
        attemptMerge(newSegment);
    }

    if(newSegment->prevSegment != nullptr){
        newSegment->prevSegment->nextSegment = newSegment;
        attemptMerge(newSegment->prevSegment);
    }else{
        head = newSegment;
    }
    
    freeSegment->segmentSize = size;

    return (void*)((uint64)freeSegment + MEM_BLOCK_SIZE);

}

MemoryAllocator& MemoryAllocator::getInstance() {
    /// only instantiated on first use 
    /// guarantees it will be destroyed
    static MemoryAllocator instance;
    return instance;
}

void MemoryAllocator::attemptMerge( FreeMemorySegment *segment ) {
    /// if the end of current segment and beggining of next segment do not align, they cannot be merged
    if((uint64)segment->nextSegment != (uint64)segment + (segment->segmentSize + 1)*MEM_BLOCK_SIZE)
        return;
    /// sums the segment sizes
    segment->segmentSize += segment->nextSegment->segmentSize;
    /// unlinks the next segment from the linked list
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
    /// if the given address is outside the allowed range, return -1 indicating an error
    if((uint64)address >= (uint64)HEAP_END_ADDR || (uint64)address < (uint64)HEAP_START_ADDR)
        return -1;
    /// searches for a FreeMemorySegment directly preceding the given address
    FreeMemorySegment* previousSegment = nullptr;
    if(head && head->nextSegment < address){
        previousSegment = head;
        while(previousSegment->nextSegment != nullptr && previousSegment->nextSegment < address)
            previousSegment = previousSegment->nextSegment;
    }

    /// creates the new segment at the exact location the FreeMemorySegment sturct was left during the mem_alloc
    FreeMemorySegment* newSegment = (FreeMemorySegment*)((uint64)address - MEM_BLOCK_SIZE);
    /*
        previousSegment will remain nullptr if, and only if: 
            1) head is nullptr (meaning all data is allocated, newly created segment will become the head, and only segment)
            2) head is greater than address (all data before address is allocated, newly created segment will become the head)
    */
    /// links the newSegment into the list
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
    /// attempts to merge with adjacent segments, if they exist
    if(previousSegment)attemptMerge(previousSegment);
    attemptMerge(newSegment);
    /// successfully freed memory
    return 0;
}