#ifndef SYSCALLCPPHEADERFILE
#define SYSCALLCPPHEADERFILE

#include "syscall_c.h"
void *  operator new (size_t);
void  operator delete (void * );

class Thread {
public:
    Thread (void ( * body)(void * ), void *  arg);
    virtual ~Thread ();
    int start ();
    void join();
    static void dispatch ();
    static int sleep (time_t);
    static void wrapper(void *);
protected:
    Thread ();
    virtual void run () {}

private:
    thread_t handle;
};
class Semaphore {
public:
    Semaphore (unsigned init = 1);
    virtual ~Semaphore ();
    int wait ();
    int signal ();
private:
    sem_t handle;
};
class PeriodicThread : public Thread {
public:
    void terminate ();
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    virtual void run() override;
private:
    time_t period;
};
class Console {
public:
    static char getc ();
    static void putc(char);
};
#endif