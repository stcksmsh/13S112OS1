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
#include "syscalls_c.h"

Scheduler* Scheduler::singleton = nullptr;

Scheduler::Scheduler(){
    assert(singleton == nullptr);
    singleton = this;
    head = nullptr;
    tail = nullptr;
}

// Scheduler* Scheduler::getInstance(){
//     return singleton;
// }

bool Scheduler::isEmpty(){
    return singleton->head == nullptr;
}

void Scheduler::put(thread_t thread){
    if(singleton->head == nullptr){
        singleton->head = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = nullptr;
        singleton->tail = singleton->head;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->tail->next->thread = thread;
        singleton->tail->next->next = nullptr;
        singleton->tail = singleton->tail->next;
    }
}

thread_t Scheduler::get(){    
    if(singleton->head == nullptr){
        return nullptr;
    }
    thread_t thread = singleton->head->thread;
    ThreadList* tmp = singleton->head;
    singleton->head = singleton->head->next;
    mem_free(tmp);
    return thread;
}