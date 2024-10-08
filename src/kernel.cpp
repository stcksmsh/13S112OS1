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

#include "userMain.hpp"


extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
 
void Kernel::initialise(){
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"((uint64)trap));

    
    /// initialise the heap manager
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );

    /// initialise the console
    console.getInstance().init();

    return;
}

void test(void* arg){
    // usermain(arg);       /// This is my c api test
    // usermainCPP(arg);    /// This is my c++ api test 
    // for(int i = 0; i < 7; i++){
        userMain();             /// This is the public test
    // }
}


void consoleConsumer(void* arg){
    ConsoleManager::outputHandler();
}

void switchToUserMode() __attribute__((naked));
void switchToUserMode(){
    __asm__ volatile ("csrc sstatus, %0" :: "r"(1<<8));
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

Kernel::EXIT_CODE Kernel::run(){

    thread_t kernelThread;
    
    thread_create(&kernelThread, 0, 0);
    _thread::currentThread = Scheduler::get();

    thread_t consoleThread;
    thread_create(&consoleThread, consoleConsumer, 0);

    switchToUserMode();

    thread_t userThread;
    thread_create(&userThread, test, 0);
    while(!ConsoleManager::getInstance().finished() || !Timer::getInstance().noSleepingThreads() || !Scheduler::isEmpty()){
        thread_dispatch();
    }

    return EXIT_SUCCESS;
}
