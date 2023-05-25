#ifndef _THREADHEADERFILE
#define _THREADHEADERFILE

#include "memoryAllocator.h"
#include "scheduler.h"

class thread{
public:
    ~thread();

    using func = void (*)(void*);

    static int create( thread**, func, void*, void*);

    static int exit();

    // static void yield();

    static thread *running;

    static void dispatch();

    static void wrapper();
private:

    // friend class ABI;
    // friend class Semaphore;

    struct contextWrapper{
        uint64 pc = 0, sp = 0;
    };

    bool blocked;
    bool closed;
    func start_routine;
    void* arg;
    uint64 *stack_space;
    contextWrapper context;
    bool finished;




    static void switchContext(contextWrapper*, contextWrapper*);
};



typedef thread* thread_t;
#endif