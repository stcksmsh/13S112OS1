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

    /// change to user mode

    uint64 sstatus;
    /// get the current sstatus
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    /// set the SPP bit to 0
    sstatus &= ~(1 << 8);
    /// write the new sstatus
    __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    
    /// NOW WE ARE IN USER MODE
    
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
    
    thread_create(&test, usermain, 0);
    putc('k');
    putc('e');
    putc('r');
    putc('n');
    putc('e');
    putc('l');
    putc('\n');
    int loop = 0;
    do{
        thread_dispatch();
        loop++;
    }while(!Scheduler::isEmpty() && loop < 4);
    // }while(!Scheduler::isEmpty() || !Timer::getInstance().noSleepingThreads());

    putc('m');
    putc('a');
    putc('i');
    putc('n');
    putc('\n');
    while(1){}
    return EXIT_SUCCESS;
}
