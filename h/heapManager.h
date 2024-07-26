/**
 * @file heapAllocator.h
 * @author stcksmsh (stcksmsh@gmail.com)
 * @brief class for heap management, used in MemoryManager
 * @version 0.1
 * @date 2023-12-16
 * 
 * @copyright Copyright (c) 2023
 * 
 */
#ifndef HEAPMANAGER_H
#define HEAPMANAGER_H

#include "types.h"
#include "attributes.h"

class HeapManager{

public:
    HeapManager();

    ~HeapManager();

    /// @brief initialize the heap
    /// @param nStart start address of the heap
    /// @param nEnd end address of the heap
    void init(uint64 nStart, size_t nEnd);

    /// @brief get the amount of free memory in the heap
    /// @return number of free blocks in the heap
    size_t getHeapFreeMemory();

    /// @brief allocates memory from the heap in blocks
    /// @param nSize number of blocks to allocate
    /// @return pointer to the allocated memory
    void* heapAllocate(size_t nSize);

    /// @brief frees memory from the heap
    /// @param pAddress address of the memory to free
    /// @return 0 if successful, -1 otherwise
    int heapFree(void* pAddress);

    /// @brief returns the singleton instance
    static HeapManager& getInstance(){
        return *instance;
    }

private:
    /// @brief header of a free section in the heap
    struct HeapFreeSectionHeader{
        /// @brief pointer to the next free section
        HeapFreeSectionHeader* pNext;
        /// @brief pointer to the previous free section
        HeapFreeSectionHeader* pPrev;
        /// @brief size of the free block in memory blocks
        size_t nSize;
        /// @brief magic number to check if the block is valid
        uint32 u32Magic;
    #define HEAP_BLOCK_MAGIC	0x1c0ffee1
    }PACKED;

    /// @brief pointer to the first free section in the heap
    HeapFreeSectionHeader* m_pHead;

    /// @brief singleton instance
    static HeapManager* instance;
};




#endif  // HEAPMANAGER_H