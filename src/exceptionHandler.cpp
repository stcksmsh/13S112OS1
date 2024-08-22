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
#include "consoleManager.h"
#include "thread.h"
#include "sem.h"
#include "timer.h"
#include "assert.h"


extern "C" void exceptionHandler(){
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    __asm__ volatile("mv %0, a0" : "=r"(a0));

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));


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
                /// some ConsoleManager::putc is needed, i don't know why, please help
                ConsoleManager::putc('\0'); /// removing this line causes everything to break
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
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
            case 0x25: /// sem_timedwait

                break;
            case 0x26: /// sem_trywait
                returnVal = _sem::trywait((sem_t)a1);
                break;
            case 0x31: /// time_sleep
                returnVal = Timer::getInstance().sleep(a1);
                break;
            case 0x41:
                // returnVal = __getc
                returnVal = ConsoleManager::getc();
                // returnVal = __getc();
                break;
            case 0x42:
                // ConsoleManager::putc(a1);
                ConsoleManager::putc(a1);
                break;
        }
        __asm__ volatile("csrw scause, %0" :: "r"(scause));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
        ConsoleManager::putc('\n');
        ConsoleManager::putc('E');
        ConsoleManager::putc('r');
        ConsoleManager::putc('r');
        ConsoleManager::putc('o');
        ConsoleManager::putc('r');
        ConsoleManager::putc(':');
        ConsoleManager::putc(' ');
        ConsoleManager::putc('i');
        ConsoleManager::putc('l');
        ConsoleManager::putc('l');
        ConsoleManager::putc('e');
        ConsoleManager::putc('g');
        ConsoleManager::putc('a');
        ConsoleManager::putc('l');
        ConsoleManager::putc(' ');
        ConsoleManager::putc('r');
        ConsoleManager::putc('e');
        ConsoleManager::putc('a');
        ConsoleManager::putc('d');
        ConsoleManager::putc('!');
        ConsoleManager::putc('\n');
        ConsoleManager::putc('P');
        ConsoleManager::putc('C');
        ConsoleManager::putc(':');
        ConsoleManager::putc(' ');
        ConsoleManager::putc('0');
        ConsoleManager::putc('x');
        for(int i = 15; i >= 0; i--){
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
            if(tmp < 10){
                ConsoleManager::putc('0' + tmp);
            }else{
                ConsoleManager::putc('A' + tmp - 10);
            }
        }
        ConsoleManager::putc('\n');
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
        ConsoleManager::putc('\n');
        ConsoleManager::putc('E');
        ConsoleManager::putc('r');
        ConsoleManager::putc('r');
        ConsoleManager::putc('o');
        ConsoleManager::putc('r');
        ConsoleManager::putc(':');
        ConsoleManager::putc(' ');
        ConsoleManager::putc('i');
        ConsoleManager::putc('l');
        ConsoleManager::putc('l');
        ConsoleManager::putc('e');
        ConsoleManager::putc('g');
        ConsoleManager::putc('a');
        ConsoleManager::putc('l');
        ConsoleManager::putc(' ');
        ConsoleManager::putc('w');
        ConsoleManager::putc('r');
        ConsoleManager::putc('i');
        ConsoleManager::putc('t');
        ConsoleManager::putc('e');
        ConsoleManager::putc('!');
        ConsoleManager::putc('\n');
        ConsoleManager::putc('P');
        ConsoleManager::putc('C');
        ConsoleManager::putc(':');
        ConsoleManager::putc(' ');
        ConsoleManager::putc('0');
        ConsoleManager::putc('x');
        for(int i = 15; i >= 0; i--){
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
            if(tmp < 10){
                ConsoleManager::putc('0' + tmp);
            }else{
                ConsoleManager::putc('A' + tmp - 10);
            }
        }
        ConsoleManager::putc('\n');
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    {   
        int irq = plic_claim();
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
        plic_complete(irq);
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 9));
    }
}