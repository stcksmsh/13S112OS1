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
#include "consoleManager.h"

#include "../test_h/userMain.h"


extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
 
void Kernel::initialise(){
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));

    
    /// initialise the heap manager
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );

    /// initialise the console
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

    /// enable software interrupts    
    __asm__ volatile ("csrs sie, %0" :: "r"(1<<1));
    /// enable external hardware interrupts
    __asm__ volatile ("csrs sie, %0" :: "r"(1<<9));

    /// enable software interrupts
    __asm__ volatile ("csrs sstatus, %0" :: "r"(1<<1));


    thread_t userThread;
    thread_create(&userThread, test, 0);
    // thread_create(&userThread, usermain, 0);
    do{
        ConsoleManager::outputHandler();
        thread_dispatch();
    }while(!(Scheduler::isEmpty() && Timer::getInstance().noSleepingThreads() && ConsoleManager::finished()));
    // }while(true);

    return EXIT_SUCCESS;
}
