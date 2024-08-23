/**
 * @file HeapManager.cpp
 * @author stcksmsh (stcksmsh@gmail.com)
 * @brief implementation of the HeapManager class
 * @version 0.1
 * @date 2023-12-16
 * 
 * @copyright Copyright (c) 2023
 * 
 */
#include "assert.h"
#include "heapManager.h"
#include "consoleManager.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    assert(instance == 0);
    instance = this;
}

HeapManager::~HeapManager(){
    
}

void HeapManager::init(uint64 nStart, size_t nEnd){
    /// Align the start address
    #ifdef PARANOID
        assert(nEnd - nStart > MEM_BLOCK_SIZE);
    #endif
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    m_pHead->pNext = 0;
    m_pHead->pPrev = 0;
}

size_t HeapManager::getHeapFreeMemory(){
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    while(pCurrent != 0){
        #ifdef PARANOID
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        #endif
        nFreeMemory += pCurrent->nSize;
        pCurrent = pCurrent->pNext;
    }
    return nFreeMemory;
}

void* HeapManager::heapAllocate(size_t nSize){
    HeapFreeSectionHeader* pCurrent = m_pHead;
    while(pCurrent != 0){
        #ifdef PARANOID
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        #endif
        if(pCurrent->nSize > nSize + 1){
            HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
            pNew->nSize = pCurrent->nSize - nSize - 1;
            pNew->pNext = pCurrent->pNext;
            pNew->pPrev = pCurrent->pPrev;
            pNew->u32Magic = HEAP_BLOCK_MAGIC;
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pNew;
            }
            if(pCurrent->pPrev != 0){
                pCurrent->pPrev->pNext = pNew;
            }
            if(pCurrent == m_pHead){
                m_pHead = pNew;
            }
            pCurrent->nSize = nSize;
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }else if(pCurrent->nSize >= nSize){
            if(pCurrent->pPrev != 0){
                pCurrent->pPrev->pNext = pCurrent->pNext;
            }
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            if(pCurrent == m_pHead){
                m_pHead = pCurrent->pNext;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    }
    assert(0);
    return 0;
}

int HeapManager::heapFree(void* pAddress){
    if(pAddress == nullptr){
        return -1;
    }
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pAddress) - MEM_BLOCK_SIZE);
    
    #ifdef PARANOID
        assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    #endif
    HeapFreeSectionHeader* pInsert = m_pHead;

    if(pInsert == 0 || pInsert >= pAddress){
        pFree->pNext = pInsert;
        pInsert->pPrev = pFree;
        m_pHead = pFree;
    }else{
        while(pInsert->pNext != 0 && pInsert->pNext < pAddress){
            #ifdef PARANOID
                assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
            #endif
            pInsert = pInsert->pNext;
        }

        pFree->pNext = pInsert->pNext;
        pFree->pPrev = pInsert;
        if(pInsert->pNext != 0){
            pInsert->pNext->pPrev = pFree;
        }
        pInsert->pNext = pFree;
    }

    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uint64>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uint64>(pFree)){
        pFree->pPrev->nSize += pFree->nSize + 1;
        pFree->pPrev->pNext = pFree->pNext;
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree->pPrev;
        }
        pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uint64>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uint64>(pFree->pNext)){
        pFree->nSize += pFree->pNext->nSize + 1;
        pFree->pNext = pFree->pNext->pNext;
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree;
        }
    }
    return 0;
}
