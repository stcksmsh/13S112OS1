#ifndef SCHEDULERHEADERFILE
#define SCHEDULERHEADERFILE

#include "memoryAllocator.hpp"

class thread{
    friend class Scheduler;
private:
    void (*body)(void*);
};
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