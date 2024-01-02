/**
 * @file semaphore.h
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief the semaphore class
 * @version 0.1
 * @date 2024-01-02
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#ifndef SEMAPHORE_H
#define SEMAPHORE_H


#include "types.h"
#include "thread.h"

class _sem{

public:

    static void open(_sem**, unsigned);

    static void close(_sem*);

    static void wait(_sem*);

    static void signal(_sem*);

private:

    struct blockedThreadList{
        thread_t pThread;
        blockedThreadList* pNext;
    } *blockHead, *blockTail;

    int value;

};

typedef _sem* sem_t;

#endif // SEMAPHORE_H