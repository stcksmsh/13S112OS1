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

    // /// @brief the scheduler singleton
    // static Scheduler* getInstance();

    /// @brief check if the scheduler is empty
    /// @return true if the scheduler is empty
    static bool isEmpty();

private:

    struct ThreadList{
        thread_t thread;
        ThreadList* next;
    }PACKED* head, *tail;

    static Scheduler* singleton;
};

#endif // SCHED_H