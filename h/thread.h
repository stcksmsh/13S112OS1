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

    /// @brief exit from current thread
    /// @return whether the exit was successful
    static int exit();

    /// @brief dispatch current thread
    static void dispatch();

    /// @brief joins this thread onto the given thread
    /// @param thread thread to join onto
    void join(_thread* thread);

    /// @brief currently running thread (monoprocessor system)
    static _thread* currentThread;

    /// @brief set thread blocked state
    /// @param blocked new state
    void setBlocked(bool blocked);

    /// @brief set thread closed state
    /// @param closed new state
    void setClosed(bool closed);

    /// @brief set thread sleeping state
    /// @param sleeping new state
    void setSleeping(bool sleeping);
    
    /// @brief reduce time left to run, and if it reaches 0, dispatch
    /// @return 0 if successful, -1 if thread is blocked, -2 if thread is closed, -3 if thread is sleeping, -4 if thread is finished
    int tick();
    uint32 ID;

private:
    _thread(func function, void* arg);

    static void wrapper();

    void unJoin();

    struct contextWrapper{
        uint64 pc = 0, sp = 0;
        uint64 s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11;///general purpose registers
        uint64 sstatus;
    } context;
    /// @brief joined threads
    struct ThreadJoinList{
        _thread* thread;
        ThreadJoinList* next;
    }PACKED* joinHead, *joinTail;
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
            kernel: 1,
            reserved: 28;
    /// @brief the function to run
    func function;
    /// @brief the argument to pass to the function
    void* arg;
    static uint32 nextID;

    static void contextSwitch(contextWrapper* oldContext, contextWrapper* newContext);

    friend class Scheduler;
    friend class Timer;
    friend class Kernel;

};

typedef _thread* thread_t;


#endif // THREAD_H