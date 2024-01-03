/**
 * @file timer.cpp
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief implementation of the timer class
 * @version 0.1
 * @date 2024-01-02
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#include "timer.h"
#include "syscalls_c.h"
#include "sched.h"
#include "assert.h"

Timer* Timer::instance = nullptr;

Timer::Timer(){
    assert(instance == nullptr);
    instance = this;
    sleepingHead = nullptr;
    time = 0;
}

Timer::~Timer(){
    threadSleepWrapper* current = sleepingHead;
    while(current != nullptr){
        threadSleepWrapper* next = current->next;
        mem_free(current);
        current = next;
    }
}

Timer& Timer::getInstance(){
    assert(instance != nullptr);
    return *instance;
}

void Timer::tick(){
    putc('t');
    time += 1;
    threadSleepWrapper* current = sleepingHead;
    while(current != nullptr){
        if(current->wakeUpTime <= time){
            current->thread->setSleeping(false);
            Scheduler::put(current->thread);
            threadSleepWrapper* next = current->next;
            mem_free(current);
            current = next;
        }else{
            break;
        }
    }
}

int Timer::sleep(time_t timeToSleep){
    thread_t thread = _thread::currentThread;
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)mem_alloc(sizeof(threadSleepWrapper));
    newSleepingThread->thread = thread;
    newSleepingThread->wakeUpTime = time + timeToSleep;
    newSleepingThread->next = nullptr;

    if(sleepingHead == nullptr){
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != nullptr && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
            current = current->next;
        }
        newSleepingThread->next = current->next;
        current->next = newSleepingThread;
    }
    thread->setSleeping(true);
    putc('s');
    thread_dispatch();
    return 0;
}

bool Timer::noSleepingThreads(){
    return sleepingHead == nullptr;
}