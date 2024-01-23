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
#include "sem.h"
#include "timer.h"
#include "assert.h"


extern "C" void exceptionHandler(){
    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));

    uint64 a0 = 0;
    __asm__ volatile("mv %0, a0" : "=r"(a0));

    uint64 a1, a2, a3, a4;
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    __asm__ volatile("mv %0, a4" : "=r"(a4));

    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
        switch(a0){
            case 0x1: /// mem_alloc
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
                break;
            case 0x2: /// mem_free
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
                break;
            case 0x11: /// thread_create
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)((uint64)HeapManager::getInstance().heapAllocate(DEFAULT_STACK_SIZE / MEM_BLOCK_SIZE) + DEFAULT_STACK_SIZE - 1));
                // returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
                break;
            case 0x12: /// thread_exit
                returnVal = _thread::currentThread->exit();
                break;
            case 0x13: /// thread_dispatch
                _thread::dispatch();
                break;
            case 0x14: /// thread_join
                _thread::currentThread->join((thread_t)a1);
                break;
            case 0x21: /// sem_open
                _sem::open((sem_t*)a1, unsigned(a2));
                break;
            case 0x22: /// sem_close
                _sem::close((sem_t)a1);
                break;
            case 0x23: /// sem_wait
                _sem::wait((sem_t)a1);
                break;
            case 0x24: /// sem_signal
                _sem::signal((sem_t)a1);
                break;
            case 0x31: /// time_sleep
                returnVal = Timer::getInstance().sleep(a1);
                break;
            case 0x41:
                returnVal = __getc();
                break;
            case 0x42:
                __putc(a1);
                break;
        }
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, 0x2");
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
        __putc('\n');
        __putc('E');
        __putc('r');
        __putc('r');
        __putc('o');
        __putc('r');
        __putc(':');
        __putc(' ');
        __putc('i');
        __putc('l');
        __putc('l');
        __putc('e');
        __putc('g');
        __putc('a');
        __putc('l');
        __putc(' ');
        __putc('r');
        __putc('e');
        __putc('a');
        __putc('d');
        __putc('!');
        uint64 pc;
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
        __putc('\n');
        __putc('P');
        __putc('C');
        __putc(':');
        __putc(' ');
        __putc('0');
        __putc('x');
        for(int i = 15; i >= 0; i--){
            uint64 tmp = (pc >> (i * 4)) & 0xF;
            if(tmp < 10){
                __putc('0' + tmp);
            }else{
                __putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
        __putc('\n');
        __putc('E');
        __putc('r');
        __putc('r');
        __putc('o');
        __putc('r');
        __putc(':');
        __putc(' ');
        __putc('i');
        __putc('l');
        __putc('l');
        __putc('e');
        __putc('g');
        __putc('a');
        __putc('l');
        __putc(' ');
        __putc('w');
        __putc('r');
        __putc('i');
        __putc('t');
        __putc('e');
        __putc('!');
        uint64 pc;
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
        __putc('\n');
        __putc('P');
        __putc('C');
        __putc(':');
        __putc(' ');
        __putc('0');
        __putc('x');
        for(int i = 15; i >= 0; i--){
            uint64 tmp = (pc >> (i * 4)) & 0xF;
            if(tmp < 10){
                __putc('0' + tmp);
            }else{
                __putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    // else if(scause == 0x8000000000000001UL){    /// timer
    //     Timer::getInstance().tick();
    //     __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    //     __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    //     __asm__ volatile("csrc sip, 0x2");
    // }
}