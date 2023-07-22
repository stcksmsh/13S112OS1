#include "../h/sem.hpp"
#include "../h/syscall_c.h"

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
    id->value = id->value - 1;
    if(id->value < 0){
        sem::blockedList *node = (sem::blockedList*)mem_alloc(sizeof(sem::blockedList));
        node->next = nullptr;
        node->thread = thread::running;
        if(id->tail == nullptr){
            id->head = id->tail = node;
        }else{
            id->tail->next = node;
            id->tail = node;
        }
        thread::running->setBlocked(true);
        thread_dispatch();
        if(thread::running->wasClosed()) return -1;
    }
    return 0;
}

int sem::sem_signal(sem_t id){
    if(id == nullptr)return -1;
    if(id->value < 0 && id->head != nullptr){
        id->head->thread->setBlocked(false);
        Scheduler::put(id->head->thread);
        sem::blockedList *tmp = id->head;
        id->head = id->head->next;
        mem_free(tmp);
    }
    id->value++;
    return 0;
}