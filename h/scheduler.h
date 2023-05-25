#ifndef SCHEDULERHEADERFILE
#define SCHEDULERHEADERFILE

#include "memoryAllocator.h"

class thread;
typedef thread* thread_t;


class Scheduler{
private:
    static struct Element{
        thread_t thread;
        Element* next;
    } *head , *tail;
public:
    static thread_t get();
    static void put(thread_t);
    static bool isEmpty();

};

#endif