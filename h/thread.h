#ifndef _THREADHEADERFILE
#define _THREADHEADERFILE

#include "memoryAllocator.h"
#include "scheduler.h"
#include "syscall_c.hpp"

class thread{
public:
    struct joinList{
        thread *handle;
        joinList *next;
    } *head, *tail;

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


private:
    // friend class ABI;
    // friend class Semaphore;

    struct contextWrapper{
        uint64 pc = 0, sp = 0;
        uint64 s[12]; ///general purpose registers
    };

    bool closed;
    bool blocked;
    void* arg;
    uint64 *stack_space;
    contextWrapper context;
    bool finished;




    static void switchContext(contextWrapper*, contextWrapper*);
};



typedef thread* thread_t;
#endif