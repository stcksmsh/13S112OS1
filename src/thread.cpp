/**
 * @file thread.cpp
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief the thread class implementation
 * @version 0.1
 * @date 2024-01-02
 * 
 * @copyright Copyright (c) 2024
 * 
 */


#include "thread.h"
#include "assert.h"
#include "sched.h"
#include "syscalls_c.h"

thread_t _thread::currentThread = nullptr;
uint32 _thread::nextID = 0;

_thread::_thread(func function, void* arg){
    function = function;
    arg = arg;
    ID = nextID++;
    closed = 0;
    blocked = 0;
    sleeping = 0;
    finished = 0;
    reserved = 0;
    joinHead = nullptr;
    timeLeft = 0;
    stackStart = 0;
    
    context.s0 = 0;
    context.s1 = 0;
    context.s2 = 0;
    context.s3 = 0;
    context.s4 = 0;
    context.s5 = 0;
    context.s6 = 0;
    context.s7 = 0;
    context.s8 = 0;
    context.s9 = 0;
    context.s10 = 0;
    context.s11 = 0;

    context.sstatus = 0;
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
}

void popSppSpie(){
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

void _thread::wrapper(){
    popSppSpie();
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    // putc('u');
    ThreadJoinList* current = joinHead;
    while(current != nullptr){
        thread_t thread = current->thread;
        Scheduler::put(thread);
        ThreadJoinList* next = current->next;
        mem_free(current);
        current = next;
    }
}

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    *thread = (thread_t)mem_alloc(sizeof(_thread));
    
    (*thread)->function = function;
    (*thread)->arg = arg;
    (*thread)->ID = nextID++;
    (*thread)->closed = false;
    (*thread)->blocked = false;
    (*thread)->sleeping = false;
    (*thread)->finished = false;
    (*thread)->reserved = 0;
    (*thread)->joinHead = nullptr;
    (*thread)->joinTail = nullptr;
    (*thread)->timeLeft = 0;
    (*thread)->stackStart = 0;

    (*thread)->context.s0 = 0;
    (*thread)->context.s1 = 0;
    (*thread)->context.s2 = 0;
    (*thread)->context.s3 = 0;
    (*thread)->context.s4 = 0;
    (*thread)->context.s5 = 0;
    (*thread)->context.s6 = 0;
    (*thread)->context.s7 = 0;
    (*thread)->context.s8 = 0;
    (*thread)->context.s9 = 0;
    (*thread)->context.s10 = 0;
    (*thread)->context.s11 = 0;

    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;

    (*thread)->stackStart = stack;
    if(start){
        Scheduler::put(*thread);
    }
    return 0;
}

void _thread::join(thread_t thread){
    /// cannot join to a finished or closed thread
    if(thread->finished || thread->closed){
        return;
    }
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    this->blocked = true;
    newJoin->thread = this;
    newJoin->next = nullptr;
    if(thread->joinHead == nullptr){
        thread->joinHead = newJoin;
        thread->joinTail = newJoin;
    }else{
        thread->joinTail->next = newJoin;
        thread->joinTail = newJoin;
    }
    // Scheduler::remove(this);
    dispatch();
}

int _thread::exit(){
    if(currentThread->closed){
        return -1;
    }
    if(currentThread->blocked){
        return -2;
    }
    if(currentThread->sleeping){
        return -3;
    }
    currentThread->finished = 1;
    dispatch();
    return 0;
}

void _thread::setBlocked(bool blocked){
    this->blocked = blocked;
}

void _thread::setClosed(bool closed){
    this->closed = closed;
}

void _thread::setSleeping(bool sleeping){
    this->sleeping = sleeping;
}

void _thread::dispatch(){
    _thread* oldThread = currentThread;
    if(oldThread != nullptr && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
            Scheduler::put(oldThread);
    }   
    // while(newThread != nullptr && (newThread->closed || newThread->blocked || newThread->sleeping || newThread->finished)){
    //     newThread = Scheduler::get();
    // }
    // if(newThread == nullptr){
    //     return;
    // }
    currentThread =  Scheduler::get();
    if(currentThread == nullptr){
        return;
    }
    contextSwitch(oldThread == nullptr?nullptr:&oldThread->context, &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    if(oldContext != nullptr){

        __asm__ volatile ("mv %0, sp" : "=r"(oldContext->sp));
        __asm__ volatile ("mv %0, ra" : "=r"(oldContext->pc));

        __asm__ volatile ("mv %0, s0" : "=r"(oldContext->s0));
        __asm__ volatile ("mv %0, s1" : "=r"(oldContext->s1));
        __asm__ volatile ("mv %0, s2" : "=r"(oldContext->s2));
        __asm__ volatile ("mv %0, s3" : "=r"(oldContext->s3));
        __asm__ volatile ("mv %0, s4" : "=r"(oldContext->s4));
        __asm__ volatile ("mv %0, s5" : "=r"(oldContext->s5));
        __asm__ volatile ("mv %0, s6" : "=r"(oldContext->s6));
        __asm__ volatile ("mv %0, s7" : "=r"(oldContext->s7));
        __asm__ volatile ("mv %0, s8" : "=r"(oldContext->s8));
        __asm__ volatile ("mv %0, s9" : "=r"(oldContext->s9));
        __asm__ volatile ("mv %0, s10" : "=r"(oldContext->s10));
        __asm__ volatile ("mv %0, s11" : "=r"(oldContext->s11));

        __asm__ volatile ("csrr s0, sstatus");
        __asm__ volatile ("mv %0, s0" : "=r"(oldContext->sstatus));

    }
    if(newContext->sp != 0){
        __asm__ volatile ("mv sp, %0" :: "r"(newContext->sp));
    }

    
    __asm__ volatile ("mv s0, %0" :: "r"(newContext->sstatus));
    __asm__ volatile ("csrw sstatus, s0");

    __asm__ volatile ("mv s0, %0" :: "r"(newContext->s0));
    __asm__ volatile ("mv s1, %0" :: "r"(newContext->s1));
    __asm__ volatile ("mv s2, %0" :: "r"(newContext->s2));
    __asm__ volatile ("mv s3, %0" :: "r"(newContext->s3));
    __asm__ volatile ("mv s4, %0" :: "r"(newContext->s4));
    __asm__ volatile ("mv s5, %0" :: "r"(newContext->s5));
    __asm__ volatile ("mv s6, %0" :: "r"(newContext->s6));
    __asm__ volatile ("mv s7, %0" :: "r"(newContext->s7));
    __asm__ volatile ("mv s8, %0" :: "r"(newContext->s8));
    __asm__ volatile ("mv s9, %0" :: "r"(newContext->s9));
    __asm__ volatile ("mv s10, %0" :: "r"(newContext->s10));
    __asm__ volatile ("mv s11, %0" :: "r"(newContext->s11));

    __asm__ volatile ("mv ra, %0" :: "r"(newContext->pc));
    return;
}
