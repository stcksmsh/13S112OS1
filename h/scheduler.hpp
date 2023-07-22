#ifndef SCHEDULERHEADERFILE
#define SCHEDULERHEADERFILE

#include "../h/syscall_c.h"

class thread;
typedef thread* thread_t;


class Scheduler{
private:
    static struct Element{
        thread_t thread;
        Element* next;
    } *head , *tail;
    static thread_t out, main;
public:
    static void setCore(thread_t, thread_t);
    static thread_t get();
    static void put(thread_t);
    static bool isEmpty();

};

#endif