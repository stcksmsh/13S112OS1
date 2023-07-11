#ifndef _THREADHEADERFILE
#define _THREADHEADERFILE

#include "memoryAllocator.hpp"
#include "scheduler.hpp"
#include "syscall_c.h"

class threadSleepHandler{
    time_t time = 0;
    struct sleepList{
        thread *handle;
        time_t wakeTime;
        sleepList *next;
    } *sleepHead = nullptr;

public:

    static void increment();

    static bool isEmpty();

    static threadSleepHandler *getInstance();

    static int sleep(time_t);

    static void wake();
};

class thread{
    friend class threadSleepHandler;
    friend class Scheduler;
public:
    /// @brief total time the kernel has been running for (in timer units)
    struct joinList{
        thread *handle;
        joinList *next;
    } *joinHead = nullptr, *joinTail = nullptr;

    void joinTo();

    ~thread();


    using func = void (*)(void*);

    static int create( thread**, func, void*, void*);

    static int exit();

    static thread *running;

    static void dispatch();

    static void wrapper();

    func start_routine;

    void setBlocked(bool);

    void setFinished(bool);
    
    void setClosed(bool);
    
    bool wasClosed();

    static bool zzzz();

    bool live();//reduces time remaining by one and returns whether it has "died" or not
private:
    // friend class ABI;
    // friend class Semaphore;

    struct contextWrapper{
        uint64 pc = 0, sp = 0;
        uint64 s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11;///general purpose registers
    };

    func body;
    time_t timeLeftToRun;
    bool closed;
    bool blocked;
    bool sleeping;
    time_t timeLeftToSleep;
    void* arg;
    uint64 *stack_space;
    contextWrapper context;
    bool finished;




    static void switchContext(contextWrapper*, contextWrapper*);
};



typedef thread* thread_t;
#endif