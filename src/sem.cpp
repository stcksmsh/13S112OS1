#include "../h/sem.h"
#include "../h/syscall_c.hpp"


void sem::sem_open(sem_t* handle, unsigned init){
    *handle = (sem_t)mem_alloc(sizeof(sem));
    (*handle)->value = init;
    (*handle)->head = (*handle)->tail = nullptr;
}


int sem::sem_close(sem_t handle){
    sem::blockedList *node = handle->head, *previous = nullptr;
    while(node){
        node->thread->setFinished(false);
        node->thread->setClosed(true);
        Scheduler::put(node->thread);
        mem_free(previous);
        previous = node;
        node = node->next;
    }
    return 0;
}


int sem::sem_wait(sem_t id){
    if(id->value-- <= 0){
        sem::blockedList *node = (sem::blockedList*)mem_alloc(sizeof(sem::blockedList));
        node->next = nullptr;
        node->thread = thread::running;
        if(id->tail == nullptr){
            id->head = id->tail = node;
        }else{
            id->tail->next = node;
            id->tail = node;
        }
        putc(',');
        thread::running->setBlocked(true);
        thread_dispatch();
        if(thread::running->wasClosed())return -1;
    }
    return 0;
}

int sem::sem_signal(sem_t id){
    putc('.');
    if(id == nullptr)return -1;
    putc('.');
    if(id->value++ < 0){
    putc('.');
        id->head->thread->setBlocked(false);
    putc('.');
        putc('.');
    putc('.');
        Scheduler::put(id->head->thread);
    putc('.');
        sem::blockedList *tmp = id->head;
    putc('.');
        id->head = id->head->next;
    putc('.');
        mem_free(tmp);
    putc('.');
    }
    putc('.');
    return 0;
}