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
#include "syscall_c.h"
#include "thread.h"
#include "sem.h"
#include "sched.h"
#include "usermain.h"
#include "console.h"

#include "../test_h/userMain.h"


extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
 
void Kernel::initialise(){
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));

    
    /// initialise the heap manager
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );
    console.getInstance().init();
    return;
}

void test(void* arg){
    userMain();
}

Kernel::EXIT_CODE Kernel::run(){

    thread_t kernelThread;
    
    thread_create(&kernelThread, 0, 0);
    _thread::currentThread = Scheduler::get();
    
    /// change to user mode
    __asm__ volatile ("li a0, 0xff");
    __asm__ volatile ("ecall");

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    /// NOW WE ARE IN USER MODE

    thread_t userThread;
    // thread_create(&userThread, test, 0);
    thread_create(&userThread, usermain, 0);
    do{
        // putc('K');
        Console::outputHandler();
        // putc('K');
        thread_dispatch();
        // putc('K');
    }while(!(Scheduler::isEmpty() && Timer::getInstance().noSleepingThreads()));

    return EXIT_SUCCESS;
}
