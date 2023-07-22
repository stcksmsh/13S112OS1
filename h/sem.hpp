#ifndef SEMHEADERFILE
#define SEMHEADERFILE

#include "thread.hpp"

class sem{
    struct blockedList{
        thread_t thread;
        blockedList* next = nullptr;
    } *head, *tail;
    
    int value;


public:
    static int waitCount;
    
    static void sem_open(sem**, unsigned);

    static int sem_close(sem*);

    static int sem_wait(sem*);

    static int sem_signal(sem*);

    static bool isEmpty();

};

typedef sem* sem_t;

#endif