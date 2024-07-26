/**
 * @file syscall_cpp.h
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief contains the C++ API for the system calls
 * @version 0.1
 * @date 2024-01-28
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef _syscall_cpp
#define _syscall_cpp

#include "syscall_c.h"

void* operator new (size_t);

void  operator delete (void*);

class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();
    int start ();
    void join();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
    thread_t myHandle;
private:
    void (*body)(void*);
    void* arg;

    friend void threadRun(void*);
};

class Semaphore {
public:
    Semaphore (unsigned init = 1);
    virtual ~Semaphore ();
    int wait ();
    int signal ();
    int trywait ();
    int timedwait (time_t);
private:
    sem_t myHandle;
};

class PeriodicThread : public Thread {
public:
    void terminate ();
protected:
    void run () override;
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
private:
    time_t period;
    bool active;
};

class Console {
public:
    static char getc ();
    static void putc (char);
};
#endif