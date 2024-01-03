/**
 * @file timer.h
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief timer class, used to handle thread sleep
 * @version 0.1
 * @date 2024-01-02
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef TIMER_H
#define TIMER_H

#include "thread.h"

struct threadSleepWrapper{
    thread_t thread;
    time_t wakeUpTime;
    threadSleepWrapper* next;
};

class Timer {
public:
    static Timer& getInstance();
    int sleep(time_t);
    void tick();
    bool noSleepingThreads();
    Timer();
    ~Timer();
private:
    static Timer* instance;
    threadSleepWrapper* sleepingHead;
    time_t time;
};


#endif // TIMER_H