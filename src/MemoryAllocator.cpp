#include "../h/memoryAllocator.h"
#include "../lib/console.h"

void *MemoryAllocator::mem_alloc( size_t size ){
    /* 
        adds one block to store size of allocated memory, so that it can be used by the MemoryAllocator:free function
        this data is stored in a FreeMemorySegment object for convenience sake
    */
    size ++; 
    /// creates it only on first call of the function, thus the head can only be initialised once
    static bool headInitialised = false;
    if(!headInitialised){
        head = (FreeMemorySegment*)((uint64)HEAP_START_ADDR);
        head->prevSegment = nullptr;
        head->nextSegment = nullptr;
        head->segmentSize = ((size_t)( (uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR ) - sizeof(MemoryAllocator) ) / MEM_BLOCK_SIZE;
        headInitialised = true;
    }
    void* returnValue = nullptr;
    for(FreeMemorySegment* currentSegment = head; currentSegment != nullptr; currentSegment = currentSegment->nextSegment){
        /// not enough space, skip to the next one
        if(currentSegment->segmentSize < size)
            continue;
        returnValue = currentSegment;
        /// currentSegment has the exact number of memory blocks we need
        if(currentSegment->segmentSize == size){
            /// if it has a previous segment (i.e. is not the head) set its next segment to the current segments next segment
            if(currentSegment->prevSegment)
                currentSegment->prevSegment->nextSegment = currentSegment->nextSegment;
            /// if it is the head, simply make the next segment the head
            else head = currentSegment->nextSegment;
            /// if it has a next segment (i.e. not the tail) set its previous segment to the current segments previous segment
            if(currentSegment->nextSegment)
                currentSegment->nextSegment->prevSegment = currentSegment->prevSegment;
            /// the above lines will unlink the currentSegment from the linked list
            
            /// set the segments size to the number of memory blocks used for allocation so that the memory can be freed later
            currentSegment->segmentSize = size;
            /// exit for loop
            break;
        }
        /*
            currentSegment has more memory available than we need, so we create a newSegment at the location immediately after
            the memory space we will use for allocation, this will hold information on the remaining free memory from currentSegment
        */
        FreeMemorySegment* newSegment = (FreeMemorySegment*)((uint64*)((uint64)currentSegment + size*MEM_BLOCK_SIZE));
        /// almost the same as in the if statement above, we unlink the currentSegment from the list, but now we link newSegment in its "place"
        if(currentSegment->prevSegment)
            currentSegment->prevSegment->nextSegment = newSegment;
        else
            head = newSegment;
        if(currentSegment->nextSegment)
            currentSegment->nextSegment->prevSegment = newSegment;
        /// set newSegment previous and next segments, effectively linking it inplace of the currentSegment
        newSegment->prevSegment = currentSegment->prevSegment;
        newSegment->nextSegment = currentSegment->nextSegment;
        /// set newSegment segmentSize to how much memory is left over after the allocation
        newSegment->segmentSize = currentSegment->segmentSize - size;
        /// set the segments size to the number of memory blocks used for allocation so that the memory can be freed later
        currentSegment->segmentSize = size;
        /// exit for loop
        break;
    }
    /// if no memory could be allocated, return nullptr 
    if(!returnValue)
        return nullptr;
    /*
        added MEM_BLOCK_SIZE to the address, as the first memory block at the returnValue address is used to store the FreeMemorySegment struct
        which holds data on allocated memory size for the MemoryAllocator::free function, added MEM_BLOCK_SIZE and not sizeof(FreeMemorySegment)
        so that the value will be aligned to blocks of MEM_BLOCK_SIZE bytes
    */
    return (uint64*)((uint64)returnValue + MEM_BLOCK_SIZE);
}

MemoryAllocator& MemoryAllocator::getInstance() {
    /// only instantiated on first use 
    /// guarantees it will be destroyed
    static MemoryAllocator instance;
    return instance;
}

void MemoryAllocator::attemptMerge( FreeMemorySegment *segment ) {
    /// if the end of current segment and beggining of next segment do not align, they cannot be merged
    if((uint64)segment->nextSegment != (uint64)segment + segment->segmentSize*MEM_BLOCK_SIZE)
        return;
    /// sums the segment sizes
    segment->segmentSize += segment->nextSegment->segmentSize;
    /// unlinks the next segment from the linked list
    segment->nextSegment = segment->nextSegment->nextSegment;
    if(segment->nextSegment) segment->nextSegment->prevSegment = segment;
}

int MemoryAllocator::mem_free( void *address ) {
    /// if the given address is outside the allowed range, return -1 indicating an error
    if((uint64)address >= (uint64)HEAP_END_ADDR || (uint64)address < (uint64)HEAP_START_ADDR)
        return -1;
    /// searches for a FreeMemorySegment directly preceding the given address
    FreeMemorySegment* previousSegment = nullptr;
    if(head)
        for(previousSegment = head; previousSegment->nextSegment != nullptr && (uint64)previousSegment->nextSegment < (uint64)address; previousSegment = previousSegment->nextSegment);
    
    /// creates the new segment at the exact location the FreeMemSegment was left after mem_alloc, meaning the size is still in the segment
    FreeMemorySegment* newSegment = (FreeMemorySegment*)((uint64)address - MEM_BLOCK_SIZE);
    __putc('0' + newSegment->segmentSize);
    /*
        previousSegment will remain nullptr if, and only if: 
            1) head is nullptr (meaning all data is allocated, newly created segment will become the head, and only segment)
            2) head is greater than address (all data before address is allocated, newly created segment will become the head)
    */
    /// links the newSegment into the list
    newSegment->prevSegment = previousSegment;
    if(previousSegment){
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