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
#include "heapManager.h"
#include "syscall_c.h"

#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    function = function;
    arg = arg;
    ID = nextID++;
    closed = 0;
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    reserved = 0;
    joinHead = 0;
    timeLeft = DEFAULT_TIME_SLICE;
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

void _thread::popSppSpie(){
    __asm__ volatile ("csrw sepc, ra");
    if(!currentThread->kernel){
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    }
    __asm__ volatile ("sret");
}

void _thread::wrapper(){
    popSppSpie();
    currentThread->function(currentThread->arg);
    thread_exit();
}

void _thread::unJoin(){
    ThreadJoinList* current = joinHead;
    while(current != 0){
        thread_t thread = current->thread;
        thread->blocked = false;
        Scheduler::put(thread);
        ThreadJoinList* next = current->next;
        mem_free(current);
        current = next;
    }
}

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    if(*thread == 0){
        return -1;
    }
    (*thread)->function = function;
    (*thread)->arg = arg;
    (*thread)->ID = nextID++;
    (*thread)->closed = false;
    (*thread)->blocked = false;
    (*thread)->sleeping = false;
    (*thread)->finished = false;
    (*thread)->kernel = (function == 0);
    (*thread)->reserved = 0;
    (*thread)->joinHead = 0;
    (*thread)->joinTail = 0;
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
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
    newJoin->next = 0;
    if(thread->joinHead == 0){
        thread->joinHead = newJoin;
        thread->joinTail = newJoin;
    }else{
        thread->joinTail->next = newJoin;
        thread->joinTail = newJoin;
    }
    dispatch();
}

int _thread::tick(){
    if(currentThread->blocked){
        return -1;
    }
    if(currentThread->closed){
        return -2;
    }
    if(currentThread->sleeping){
        return -3;
    }
    if(currentThread->finished){
        return -4;
    }
    timeLeft --;
    if(timeLeft == 0){
        dispatch();
    }
    return 0;
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
    currentThread->unJoin();
    currentThread->finished = 1;
    mem_free(reinterpret_cast<void*>(reinterpret_cast<uint64>(currentThread->stackStart) - DEFAULT_STACK_SIZE));
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
    thread_t oldThread = currentThread;
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
        Scheduler::put(oldThread);
    }
    do{
        currentThread =  Scheduler::get();
        if(currentThread == oldThread)return;
    }while(currentThread->closed || currentThread->blocked || currentThread->sleeping || currentThread->finished); /// If the thread is closed, blocked, sleeping or finished while it is in sched queue, we discard it
    contextSwitch(&(oldThread->context), &(currentThread->context));
}
