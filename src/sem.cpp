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
#include "syscalls_c.h"
#include "assert.h"
#include "sched.h"
#include "console.h"

void _sem::open(_sem** handle, unsigned init){
    (*handle) = (sem_t)mem_alloc(sizeof(_sem));
    (*handle)->blockHead = 0;
    (*handle)->blockTail = 0;
    (*handle)->value = init;
}

void _sem::close(sem_t id){
    while(id->blockHead != 0){
        id->blockHead->pThread->setClosed(true);
        mem_free(id->blockHead);
        id->blockHead = id->blockHead->pNext;
    }
}

void _sem::wait(sem_t id){
    id->value--;
    if(id->value < 0){
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
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
        // _thread::dispatch();
        thread_dispatch();
    }
}

void _sem::signal(sem_t id){
    id->value++;
    if(id->value <= 0){
        blockedThreadList* pUnblock = id->blockHead;
        id->blockHead = id->blockHead->pNext;
        if(id->blockHead == 0){
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
        mem_free(pUnblock);
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    }
}