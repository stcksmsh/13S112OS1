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
#include "syscall_c.h"

#include "consoleManager.h"

Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    assert(singleton == 0);
    singleton = this;
    head = 0;
    tail = 0;
}

bool Scheduler::isEmpty(){
    if(singleton->head == singleton->tail){
        return true;
    }
    return false;
}

void Scheduler::put(thread_t thread){
    Scheduler* scheduler = singleton;
    scheduler->threads[scheduler->tail] = thread;
    scheduler->tail = (scheduler->tail + 1) % SCHED_MAX_THREADS;
    assert(scheduler->tail != scheduler->head);
}

thread_t Scheduler::get(){    
    if(isEmpty()){
        return 0;
    }
    Scheduler* scheduler = singleton;
    thread_t thread = scheduler->threads[scheduler->head];
    scheduler->head = (scheduler->head + 1) % SCHED_MAX_THREADS;
    return thread;
}

int Scheduler::getCount(){
    int count = 0;
    if(singleton->head <= singleton->tail){
        count = singleton->tail - singleton->head;
    }else{
        count = SCHED_MAX_THREADS - singleton->head + singleton->tail;
    }
    return count;
}