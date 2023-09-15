#ifndef _THREADHEADERFILE
#define _THREADHEADERFILE

#include "memoryAllocator.hpp"
#include "scheduler.hpp"
#include "syscall_c.h"

class threadSleepHandler{
    struct sleepList{
        thread *handle;
        time_t wakeTime;
        sleepList *next;
    } *sleepHead;

public:

    threadSleepHandler() : sleepHead(nullptr){};

    static void sleepDecrement();

    static bool allAwake();

    static threadSleepHandler& getInstance();

    static int sleep(time_t);

    static time_t getTime();

    static void wake();
};

class thread{
    friend class threadSleepHandler;
    friend class Scheduler;
public:

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

    bool live();//reduces time remaining by one and returns whether it has "died" or not
private:
    struct joinList{
        thread *handle;
        joinList *next;
    } *joinHead = nullptr, *joinTail = nullptr;
    struct contextWrapper{
        uint64 pc = 0, sp = 0;
        uint64 s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11;///general purpose registers
        uint64 sstatus;
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