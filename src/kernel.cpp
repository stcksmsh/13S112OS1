/**
 * @file kernel.cpp
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief implementation of the kernel class
 * @version 0.1
 * @date 2023-12-31
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "kernel.h"
#include "types.h"
#include "assert.h"
#include "syscalls_c.h"
#include "thread.h"
#include "sem.h"
#include "sched.h"
#include "usermain.h"

#include "console.h"

extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
 
void Kernel::initialise(){
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));

    
    /// initialise the heap manager
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );

    return;
}

// sem_t sem = 0;

void testFunc(void* arg){
    putc('t');
    putc('e');
    putc('s');
    putc('t');

    // sem_wait(sem);
    // thread_dispatch();
    // thread_dispatch();
    thread_dispatch();

    // time_sleep(10);
    putc(' ');

    putc('t');
    putc('h');
    putc('r');
    putc('e');
    putc('a');
    putc('d');
    putc('\n');
}

Kernel::EXIT_CODE Kernel::run(){

    thread_t t, test;
    
    thread_create(&t, 0, 0);
    _thread::currentThread = Scheduler::get();
    
    /// change to user mode
    __asm__ volatile ("li a0, 0xff");
    __asm__ volatile ("ecall");
    
    putc('u');
    putc('s');
    putc('e');
    putc('r');
    putc('\n');

    
    /// NOW WE ARE IN USER MODE
    
    
    thread_create(&test, usermain, 0);
    putc('k');
    putc('e');
    putc('r');
    putc('n');
    putc('e');
    putc('l');
    putc('\n');
    do{
        thread_dispatch();
    // }while(!Scheduler::isEmpty());
    // }while(!Scheduler::isEmpty() || !Timer::getInstance().noSleepingThreads());
    }while(true);

    putc('m');
    putc('a');
    putc('i');
    putc('n');
    putc('\n');
    // while(1){}
    return EXIT_SUCCESS;
}
