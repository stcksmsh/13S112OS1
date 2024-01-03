/**
 * @file thread.h
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief the thread class
 * @version 0.1
 * @date 2024-01-02
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef THREAD_H
#define THREAD_H

#include "types.h"
#include "attributes.h"

/// @brief the thread class
class _thread{
    using func = void (*)(void*);
public:

    static int create(_thread** thread, func function, void* arg, void* stack, bool start = true);

    int exit();

    static void dispatch();

    void join(_thread* thread);

    static _thread* currentThread;

    void setBlocked(bool blocked);

    void setClosed(bool blocked);

    void setSleeping(bool sleeping);
    
    uint32 ID;

private:
    _thread(func function, void* arg);

    static void wrapper();


    struct contextWrapper{
        uint64 pc = 0, sp = 0;
        uint64 s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11;///general purpose registers
        uint64 sstatus;
    } context;
    /// @brief joined threads
    struct ThreadJoinList{
        _thread* thread;
        ThreadJoinList* next;
    }PACKED* joinHead;
    /// @brief time left to run
    time_t timeLeft;
    /// @brief start of the stack
    void* stackStart;
    /// @brief the thread ID
    /// @brief flags
    uint32  closed: 1,
            blocked: 1,
            sleeping: 1,
            finished: 1,
            reserved: 28;
    /// @brief the function to run
    func function;
    /// @brief the argument to pass to the function
    void* arg;
    static uint32 nextID;

    static void contextSwitch(contextWrapper* oldContext, contextWrapper* newContext);

};

typedef _thread* thread_t;


#endif // THREAD_H