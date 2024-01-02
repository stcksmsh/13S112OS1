/**
 * @file trap.cpp
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief implementation of the trap method
 * @version 0.1
 * @date 2023-12-31
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "heapManager.h"
#include "console.h"
#include "thread.h"
#include "semaphore.h"


extern "C" void exceptionHandler(){

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));

    uint64 a0 = 0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    uint64 returnVal = 0;
    /// check if the exception was a syscall
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){
        switch(a0){
            case 0x1: /// mem_alloc
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
                break;
            case 0x2: /// mem_free
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
                break;
            case 0x11: /// thread_create
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4, true);
                break;
            case 0x12: /// thread_exit
                returnVal = _thread::currentThread->exit();
                break;
            case 0x13: /// thread_dispatch
                _thread::dispatch();
                break;
            case 0x22: /// sem_open
                _sem::open((sem_t*)a1, unsigned(a2));
                break;
            case 0x23: /// sem_close
                _sem::close((sem_t)a1);
                break;
            case 0x24: /// sem_wait
                _sem::wait((sem_t)a1);
                break;
            case 0x25: /// sem_signal
                _sem::signal((sem_t)a1);
                break;
            case 0x41:
                returnVal = __getc();
                break;
            case 0x42:
                __putc(a1);
                break;
        }
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc + 4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, 0x2");
    }
}