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
                /// some putc is needed, i don't know why, please help
                putc('\0'); /// removing this line causes everything to break
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
            case 0x31: /// time_sleep
                returnVal = Timer::getInstance().sleep(a1);
                break;
            case 0x41:
                // returnVal = __getc();
                returnVal = Console::getc();
                break;
            case 0x42:
                // __putc(a1);
                Console::putc(a1);
                break;
                // switch user mode
            case 0xff:
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
                return;
        }
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
        putc('\n');
        putc('E');
        putc('r');
        putc('r');
        putc('o');
        putc('r');
        putc(':');
        putc(' ');
        putc('i');
        putc('l');
        putc('l');
        putc('e');
        putc('g');
        putc('a');
        putc('l');
        putc(' ');
        putc('r');
        putc('e');
        putc('a');
        putc('d');
        putc('!');
        uint64 pc;
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
        putc('\n');
        putc('P');
        putc('C');
        putc(':');
        putc(' ');
        putc('0');
        putc('x');
        for(int i = 15; i >= 0; i--){
            uint64 tmp = (pc >> (i * 4)) & 0xF;
            if(tmp < 10){
                putc('0' + tmp);
            }else{
                putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
        putc('\n');
        putc('E');
        putc('r');
        putc('r');
        putc('o');
        putc('r');
        putc(':');
        putc(' ');
        putc('i');
        putc('l');
        putc('l');
        putc('e');
        putc('g');
        putc('a');
        putc('l');
        putc(' ');
        putc('w');
        putc('r');
        putc('i');
        putc('t');
        putc('e');
        putc('!');
        uint64 pc;
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
        putc('\n');
        putc('P');
        putc('C');
        putc(':');
        putc(' ');
        putc('0');
        putc('x');
        for(int i = 15; i >= 0; i--){
            uint64 tmp = (pc >> (i * 4)) & 0xF;
            if(tmp < 10){
                putc('0' + tmp);
            }else{
                putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
        putc('t');
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    {   
        int irq = plic_claim();
        if(irq == CONSOLE_IRQ)Console::inputHandler();
        plic_complete(irq);
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
}