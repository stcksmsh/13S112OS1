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

void popSppSpie(bool kernel = false){
    __asm__ volatile ("csrw sepc, ra");
    // if(kernel){
    //     __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    // }
    __asm__ volatile ("sret");
}

void _thread::wrapper(){
    popSppSpie(currentThread->kernel);
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
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
    __putc('j');
    __putc('0' + thread->ID);
    __putc('\n');
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
    thread_t oldThread = currentThread;

    currentThread =  Scheduler::get();
    if(currentThread == nullptr){
        currentThread = oldThread;
        return;
    }
    
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
            Scheduler::put(oldThread);
    }
    // while(newThread != 0 && (newThread->closed || newThread->blocked || newThread->sleeping || newThread->finished)){
    //     newThread = Scheduler::get();
    // }
    // if(newThread == 0){
    //     return;
    // }
    __putc('d');
    if(oldThread != 0){
        __putc('0' + oldThread->ID);
    }
    __putc('0' + currentThread->ID);
    __putc('\n');
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    __putc('.');
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){


    if(oldContext != 0){
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
        __asm__ volatile ("sd sp, 1 * 8(a0)");

        __asm__ volatile ("sd s0, 2 * 8(a0)");
        __asm__ volatile ("sd s1, 3 * 8(a0)");
        __asm__ volatile ("sd s2, 4 * 8(a0)");
        __asm__ volatile ("sd s3, 5 * 8(a0)");
        __asm__ volatile ("sd s4, 6 * 8(a0)");
        __asm__ volatile ("sd s5, 7 * 8(a0)");
        __asm__ volatile ("sd s6, 8 * 8(a0)");
        __asm__ volatile ("sd s7, 9 * 8(a0)");
        __asm__ volatile ("sd s8, 10 * 8(a0)");
        __asm__ volatile ("sd s9, 11 * 8(a0)");
        __asm__ volatile ("sd s10, 12 * 8(a0)");
        __asm__ volatile ("sd s11, 13 * 8(a0)");
        
        __asm__ volatile("csrr s0, sstatus");
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    }
    
    // uint64 ra = newContext->pc;
    // __putc('\n');
    // for(int i = 15; i >= 0 ; i --){
    //     int digit = (ra >> (i * 4)) & 0xf;
    //     if(digit < 10){
    //         __putc('0' + digit);
    //     }else{
    //         __putc('a' + digit - 10);
    //     }
    // }
    // __putc('\n');
    
    if(newContext->sp != 0){
        __asm__ volatile ("ld sp, 8(a1)");
    }
    __asm__ volatile ("ld ra, 0(a1)");

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    __asm__ volatile("csrw sstatus, s0");

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    __asm__ volatile ("ld s11, 13 * 8(a1)");

    return;

}
