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
#include "sched.h"
#include "assert.h"
#include "thread.h"

#include "syscall_c.h"


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
    time += 1;
    while(sleepingHead != 0 && sleepingHead->wakeUpTime <= time){
        sleepingHead->thread->setSleeping(false);
        Scheduler::put(sleepingHead->thread);
        threadSleepWrapper* next = sleepingHead->next;
        mem_free(sleepingHead);
        sleepingHead = next;
    }
}

int Timer::sleep(time_t timeToSleep){

    thread_t thread = _thread::currentThread;
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)mem_alloc(sizeof(threadSleepWrapper));
    newSleepingThread->thread = thread;
    newSleepingThread->wakeUpTime = time + timeToSleep;
    newSleepingThread->next = 0;
    if(sleepingHead == 0){
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
            current = current->next;
        }
        if(current->wakeUpTime > newSleepingThread->wakeUpTime){
            sleepingHead = newSleepingThread;
            newSleepingThread->next = current;
        }else{
            newSleepingThread->next = current->next;
            current->next = newSleepingThread;
        }
    }
    thread->setSleeping(true);
    _thread::dispatch();
    return 0;
}

bool Timer::noSleepingThreads(){
    return sleepingHead == 0;
}

time_t Timer::getTime(){
    return time;
}