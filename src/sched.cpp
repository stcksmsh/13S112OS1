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
#include "syscall_c.h"
#include "console.h"
#include "thread.h"

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
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->tail = singleton->tail->next;
        singleton->tail->thread = thread;
        singleton->tail->next = 0;
    }
}

thread_t Scheduler::get(){    
    ThreadList* tmp = singleton->head;
    if(tmp == 0){
        return 0;
    }
    thread_t thread = tmp->thread;
    singleton->head = tmp->next;
    if(singleton->head == 0){
        singleton->tail = 0;
    }
    mem_free(tmp);
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