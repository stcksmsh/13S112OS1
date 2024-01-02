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
#include "hw.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    assert(instance == 0);
    instance = this;
}

HeapManager::~HeapManager(){
    
}

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    m_pHead->pNext = 0;
    m_pHead->pPrev = 0;
    m_pTail = m_pHead;
}

size_t HeapManager::getHeapFreeMemory(){
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
        pCurrent = pCurrent->pNext;
    }
    return nFreeMemory;
}

void* HeapManager::heapAllocate(size_t nSize){
    HeapFreeSectionHeader* pCurrent = m_pHead;
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
            /// + 1 because we need to store the header, and we don't want to split the block to keep alignment
            if(pCurrent->nSize > nSize + 1){
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
                pNew->nSize = pCurrent->nSize - nSize - 1;
                pNew->pNext = pCurrent->pNext;
                pNew->pPrev = pCurrent;
                if(pCurrent->pNext != 0){
                    pCurrent->pNext->pPrev = pNew;
                }
                pCurrent->pNext = pNew;
                pCurrent->nSize = nSize;
            }
            if(pCurrent == m_pHead){
                m_pHead = pCurrent->pNext;
            }
            if(pCurrent == m_pTail){
                m_pTail = pCurrent->pPrev;
            }
            if(pCurrent->pPrev != 0){
                pCurrent->pPrev->pNext = pCurrent->pNext;
            }
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    }
    return 0;
}

int HeapManager::heapFree(void* pAddress){
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pAddress) - MEM_BLOCK_SIZE);
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    HeapFreeSectionHeader* pInsert = m_pHead;
    while(pInsert != 0 && pInsert < pFree){
        assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
        pInsert = pInsert->pNext;
    }
    if(pInsert == 0){
        pFree->pPrev = m_pTail;
        pFree->pNext = 0;
        m_pTail->pNext = pFree;
        m_pTail = pFree;
    }else{
        pFree->pPrev = pInsert->pPrev;
        pFree->pNext = pInsert;
        if(pInsert->pPrev != 0){
            pInsert->pPrev->pNext = pFree;
        }
        pInsert->pPrev = pFree;
    }
    if(!pFree->pPrev){
        m_pHead = pFree;
    }
    if(!pFree->pNext){
        m_pTail = pFree;
    }

    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uintptr_t>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree)){
        pFree->pPrev->nSize += pFree->nSize + 1;
        pFree->pPrev->pNext = pFree->pNext;
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree->pPrev;
        }else{
            m_pTail = pFree->pPrev;
        }
        pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uintptr_t>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree->pNext)){
        pFree->nSize += pFree->pNext->nSize + 1;
        pFree->pNext = pFree->pNext->pNext;
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree;
        }else{
            m_pTail = pFree;
        }
    }
    return 0;
}
