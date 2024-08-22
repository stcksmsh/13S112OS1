/**
 * @file sched.h
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief the scheduler class
 * @version 0.1
 * @date 2024-01-02
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef SCHED_H
#define SCHED_H

#include "types.h"
#include "attributes.h"

#define SCHED_MAX_THREADS 32

class _thread;
typedef _thread* thread_t;

/// @brief the scheduler class
class Scheduler{
public:

    /// @brief the scheduler constructor
    Scheduler();

    /// @brief the scheduler put function
    static void put(thread_t thread);

    static thread_t get();

    /// @brief check if the scheduler is empty
    /// @return true if the scheduler is empty
    static bool isEmpty();

    static int getCount();

private:

    /// @brief the threads in the scheduler (queue)
    thread_t threads[SCHED_MAX_THREADS];

    /// @brief the head of the queue
    int head;
    /// @brief the tail of the queue
    int tail;
    
    static Scheduler* singleton;
};

#endif // SCHED_H