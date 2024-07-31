/**
 * @file semaphore.cpp
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief implementation of the _sem class
 * @version 0.1
 * @date 2024-01-02
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#include "sem.h"
#include "assert.h"
#include "sched.h"
#include "heapManager.h"
#include "thread.h"

#include "consoleManager.h"


void _sem::open(_sem** handle, unsigned init){
    (*handle) = (sem_t)HeapManager::getInstance().heapAllocate((sizeof(_sem) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    (*handle)->blockHead = 0;
    (*handle)->blockTail = 0;
    (*handle)->value = init;
}

void _sem::close(sem_t id){
    while(id->blockHead != 0){
        id->blockHead->pThread->setClosed(true);
        HeapManager::getInstance().heapFree(id->blockHead);
        id->blockHead = id->blockHead->pNext;
    }
}

void _sem::wait(sem_t id){
    if(--id->value < 0){
        blockedThreadList* pNewBlock = (blockedThreadList*)HeapManager::getInstance().heapAllocate((sizeof(blockedThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
        pNewBlock->pThread = _thread::currentThread;
        pNewBlock->pNext = 0;
        if(id->blockHead == 0){
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
            id->blockTail = pNewBlock;
        }
        _thread::currentThread->setBlocked(true);
        _thread::dispatch();
    }

}

void _sem::signal(sem_t id){
    if(++id->value <= 0){
        
        blockedThreadList* pUnblock = id->blockHead;
        id->blockHead = id->blockHead->pNext;
        if(id->blockHead == 0){
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
        HeapManager::getInstance().heapFree(pUnblock);
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    }
}

int _sem::trywait(sem_t id){
    if(id->value <= 0){
        return 0;
    }else{
        id->value--;
        return 1;
    }
}