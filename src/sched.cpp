/**
 * @file sched.cpp
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief implementation of the scheduler class
 * @version 0.1
 * @date 2024-01-02
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#include "sched.h"
#include "assert.h"
#include "heapManager.h"
#include "consoleManager.h"
#include "thread.h"

#include "consoleManager.h"

Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    assert(singleton == 0);
    singleton = this;
    head = 0;
    tail = 0;
}

bool Scheduler::isEmpty(){
    return singleton->head == 0;
}

void Scheduler::put(thread_t thread){
    if(singleton->head == 0){
        singleton->head = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
        singleton->tail = singleton->head;
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
        singleton->tail = singleton->tail->next;
        singleton->tail->thread = thread;
        singleton->tail->next = 0;
    }
}

thread_t Scheduler::get(){    
    if(singleton->head == 0){
        return 0;
    }
    ThreadList* tmp = singleton->head;
    singleton->head = singleton->head->next;
    if(singleton->head == 0){
        singleton->tail = 0;
    }
    thread_t thread = tmp->thread;
    HeapManager::getInstance().heapFree(tmp);
    return thread;
}

int Scheduler::getCount(){
    int count = 0;
    ThreadList* tmp = singleton->head;
    while(tmp != 0){
        count++;
        tmp = tmp->next;
    }
    return count;
}