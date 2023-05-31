#ifndef MEMORYALLOCATORHEADERFILE
#define MEMORYALLOCATORHEADERFILE

#include "../lib/hw.hpp"
/// @brief data structure which represents the continuous segments of unused memory, in a doubly linked list format, ordered by starting address 
struct FreeMemorySegment{
    /// @brief pointer to previous free segment
    struct FreeMemorySegment* prevSegment;
    /// @brief pointer to next free segment
    struct FreeMemorySegment* nextSegment;
    /// @brief size of the free memory segment in MEM_BLOCK_SIZE byte units
    size_t segmentSize;
};
/// @brief singleton class used for memory (de)allocation
class MemoryAllocator {
public:
    /// @brief returns the singleton instance
    /// @return the instance in question
    static MemoryAllocator& getInstance();
private:
    /// @brief empty constructor
    MemoryAllocator(){};
    /// @brief deleted copy constructor to avoid singleton instance copies
    MemoryAllocator( MemoryAllocator const& ) = delete;
    /// @brief deleted copy assignment operator to avoid singleton instance copies
    MemoryAllocator& operator=( MemoryAllocator const& ) = delete;
    /// @brief head of the doubly linked list described above
    FreeMemorySegment *head;
    /// @brief attempts to merge two successive segments
    /// @param FreeMemorySegment* the segment to attempt to merge with the next
    void attemptMerge( FreeMemorySegment* );
public:
    /// @brief allocates memory
    /// @param size_t number of memory blocks to allocate
    /// @return pointer to the newly allocated memory if successful, and nullptr if not
    void *mem_alloc( size_t );
    /// @brief frees memory previously allocated with MemoryAllocator::mem_alloc
    /// @param  void* the return value of MemoryAllocator::mem_alloc
    /// @return 0 if successful, and an error code if not
    int mem_free( void* );

};

#endif