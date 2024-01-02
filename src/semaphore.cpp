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

#include "semaphore.h"
#include "syscalls_c.h"
#include "sched.h"

void _sem::open(_sem** pSem, unsigned init){
    (*pSem)->blockHead = nullptr;
    (*pSem)->blockTail = nullptr;
    (*pSem)->value = init;
}

void _sem::close(sem_t pSem){
    while(pSem->blockHead != nullptr){
        pSem->blockHead->pThread->setClosed(true);
        mem_free(pSem->blockHead);
        pSem->blockHead = pSem->blockHead->pNext;
    }
}

void _sem::wait(sem_t pSem){
    pSem->value--;
    if(pSem->value < 0){
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
        pNewBlock->pThread = _thread::currentThread;
        pNewBlock->pThread->setBlocked(true);
        pNewBlock->pNext = nullptr;
        if(pSem->blockHead == nullptr){
            pSem->blockHead = pNewBlock;
            pSem->blockTail = pNewBlock;
        }else{
            pSem->blockTail->pNext = pNewBlock;
            pSem->blockTail = pNewBlock;
        }
        _thread::dispatch();
    }
}

void _sem::signal(sem_t pSem){
    pSem->value++;
    if(pSem->value <= 0){
        blockedThreadList* pUnblock = pSem->blockHead;
        pSem->blockHead = pSem->blockHead->pNext;
        if(pSem->blockHead == nullptr){
            pSem->blockTail = nullptr;
        }
        pUnblock->pThread->setBlocked(false);
        Scheduler::put(pUnblock->pThread);
        mem_free(pUnblock);
    }
}