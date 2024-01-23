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

Timer* Timer::instance = 0;

Timer::Timer(){
    assert(instance == 0);
    instance = this;
    sleepingHead = 0;
    time = 0;
}

Timer::~Timer(){
    threadSleepWrapper* current = sleepingHead;
    while(current != 0){
        threadSleepWrapper* next = current->next;
        mem_free(current);
        current = next;
    }
}

Timer& Timer::getInstance(){
    assert(instance != 0);
    return *instance;
}

void Timer::tick(){
    if(time % 10 == 0){
        putc('t');
    }
    time += 1;
    threadSleepWrapper* current = sleepingHead;
    while(current != 0){
        if(current->wakeUpTime <= time){
            putc('w');
            current->thread->setSleeping(false);
            Scheduler::put(current->thread);
            threadSleepWrapper* next = current->next;
            if(current == sleepingHead){
                sleepingHead = next;
            }
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
    newSleepingThread->next = 0;

    time_t w = newSleepingThread->wakeUpTime;
    putc('w');
    while(w > 0){
        putc('0' + w % 10);
        w /= 10;
    }
    putc('\n');

    if(sleepingHead == 0){
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
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
    return sleepingHead == 0;
}