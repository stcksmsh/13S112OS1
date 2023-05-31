#ifndef _THREADHEADERFILE
#define _THREADHEADERFILE

#include "memoryAllocator.h"
#include "scheduler.h"
#include "syscall_c.hpp"

class thread{
public:
    /// @brief total time the kernel has been running for (in timer units)
    static time_t time;
    struct joinList{
        thread *handle;
        joinList *next;
    } *joinHead, *joinTail;

    static struct sleepList{
        thread *handle;
        time_t wakeTime;
        sleepList *next;
    } *sleepHead;

    void joinTo();

    ~thread();

    static int sleep(time_t);

    static void wake();

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