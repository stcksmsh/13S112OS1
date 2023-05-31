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
    
    static void sem_open(sem**, unsigned);

    static int sem_close(sem*);

    static int sem_wait(sem*);

    static int sem_signal(sem*);

};

typedef sem* sem_t;

#endif