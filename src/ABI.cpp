#include "../lib/console.h"
#include "../h/console.hpp"
#include "../h/ABI.hpp"
#include "../h/memoryAllocator.hpp"
#include "../h/thread.hpp"
#include "../h/sem.hpp"

#include "../lib/console.h"


inline uint64 ABI::sstatusRead()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    return sstatus;
}

inline void ABI::sstatusWrite(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
}

inline void ABI::sipBitClear(uint64 bit)
{
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"((uint64)1<<bit));
}

inline void ABI::sstatusBitClear(uint64 bit)
{
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"((uint64)1<<bit));

}

inline void ABI::disableInterrupt(){
    __asm__ volatile ("csrs sstatus, %0" : : "r"(1 << 5));
}

inline void ABI::enableInterrupt(){
    __asm__ volatile ("csrs sstatus, %0" : : "r"(1 << 5));
}


void ABI::trapHandler() {/// address to return to (in case of c/cpp syscalls is in ra)
    uint64 scause;
    __asm__ volatile("csrr %0,scause": "=r"(scause));
    uint64 volatile sstatus = sstatusRead();
    uint64 volatile  sepc;
    __asm__ volatile ("csrr %0, sepc" : "=r" (sepc));
    // User and Supervisor syscalls
    if (scause == 0x0000000000000009UL || scause == 0x0000000000000008UL)
    {
        uint64 callID;
        __asm__ volatile("mv %0, a0" : "=r"(callID));
        // malloc
        if (callID == 0x01) {
            uint64 size;
            /// fetch requested size, in number of memory blocks
            __asm__ volatile("mv %0, a1" : "=r"(size));
            /// give return value
            void *returnValue = MemoryAllocator::getInstance().mem_alloc(size);
            __asm__ volatile ("mv a0, %0" : : "r"((uint64)returnValue));
        }
        // free
        else if (callID == 0x02) {
            uint64 address;
            __asm__ volatile("mv %0, a1" : "=r"(address));
            int returnValue = MemoryAllocator::getInstance().mem_free((void*)address);
            __asm__ volatile ("mv a0, %0" : : "r"((uint64)returnValue));


        }
        /// thread_create
        else if(callID==0x11){
            uint64 handle;
            __asm__ volatile ("mv %0, a1" : "=r"(handle));
            uint64 start_routine;
            __asm__ volatile ("mv %0, a2" : "=r"(start_routine));
            uint64 arg;
            __asm__ volatile("mv %0, a3" : "=r"(arg));
            uint64* stack_space=(uint64*)MemoryAllocator::getInstance().mem_alloc((DEFAULT_STACK_SIZE+ MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
            thread::create((thread_t*)handle, (thread::func)start_routine, (void*)arg, (void*)stack_space);
            uint64 retVal=0;
            if(handle == 0)retVal=-1;
            __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(retVal));
        }
        // //exit
        else if(callID==0x12){
            uint64 retVal = thread::running->exit();
            __asm__ volatile ("mv a0, %0" :: "r"(retVal));
        }
        // //dispatch
        else if(callID==0x13){
            thread::dispatch();
        }
        // join
        else if(callID==0x14){
            uint64 handle;
            __asm__ volatile ("mv %0, a1" : "=r"(handle));
            ((thread_t)handle)->joinTo();/// joins current thread onto the given thread
        }
        //sem open
        else if(callID==0x21){
            uint64 handle;
            __asm__ volatile ("mv %0, a1" : "=r"(handle));
            uint64 init;
            __asm__ volatile ("mv %0, a2" : "=r"(init));
            sem::sem_open((sem_t*)handle,init);
            uint64 returnValue=0;
            if((sem_t)handle == nullptr)returnValue=-1;
            __asm__ volatile ("mv a0, %0" : : "r"(returnValue));


        }
        //sem close
        else if(callID==0x22){
            uint64 handle;
            __asm__ volatile ("mv %0, a1" : "=r"(handle));
            int returnValue=sem::sem_close((sem_t)handle);
            __asm__ volatile ("mv a0, %0" : : "r"(returnValue));
        }
        //sem wait
        else if(callID==0x23){
            uint64 handle;
            __asm__ volatile ("mv %0, a1" : "=r"(handle));
            int returnValue=sem::sem_wait((sem_t)handle);
            __asm__ volatile ("mv a0, %0" : : "r"(returnValue));

        }
        //sem signal
        else if(callID==0x24){
            uint64 handle;
            __asm__ volatile ("mv %0, a1" : "=r"(handle));
            int returnValue=sem::sem_signal((sem_t)handle);
            __asm__ volatile ("mv a0, %0" : : "r"(returnValue));
        }
        //change to user mode
        else if(callID==0x25){
            sstatusWrite(sstatus);    __asm__ volatile ("csrs sie, 1"); /// sets bit 1 of sie, enables interrupts

            sstatusBitClear(8); /// clears SPP (sets desired mode to User) 
            __asm__ volatile ("csrw sepc, %0" : : "r" (sepc + 4));
            sipBitClear(1); /// clears SSIP (there exists an interrupt request)
            return;
        }
        /// user test
        else if(callID==0x26){
            if(scause == 0x8)putc('u');
            if(scause == 0x9)putc('s');
            sstatusWrite(sstatus);
            __asm__ volatile ("csrw sepc, %0" : : "r" (sepc + 4));
            sipBitClear(1); /// clears SSIP (there exists an interrupt request)
            return;
        }
        //sleep
        else if(callID == 0x31){
            time_t duration;
            __asm__ volatile ("mv %0, a1" : "=r"(duration));
            int returnValue = threadSleepHandler::sleep(duration);
            __asm__ volatile ("mv a0, %0" : : "r"(returnValue));
        }
        //getc
        else if(callID==0x41){
            // char ch = Console::read();
            // if(ch >= 32 && ch <= 127)Console::write(ch);
            char ch = __getc();
            if(ch >= 32 && ch <= 127)__putc(ch);
            __asm__ volatile ("mv a0, %0" : : "r"(ch));
        }
        //putc
        else if(callID==0x42){
            uint64 ch;
            __asm__ volatile ("mv %0, a1" : "=r"(ch));
            // Console::write(ch);
            __putc(ch);
        }
        __asm__ volatile ("csrw sepc, %0" : : "r" (sepc + 4));
        sstatusWrite(sstatus);
        sipBitClear(1);
    }
    else if (scause == 0x1000000000000001UL)
    {
        __putc('X');
        /// Timer
        /// first we increment the thread::time variable
        threadSleepHandler::timeIncrement();
        /// next we wake the sleeping threads;
        threadSleepHandler::wake();
        /// and finally we test for preemption
        if(!thread::running->live())thread::dispatch();
        __asm__ volatile ("csrw sepc, %0" : : "r" (sepc));
        sstatusWrite(sstatus);
        sipBitClear(1);
    }
    else if (scause== 0x8000000000000009UL)
    {   
        int irq = plic_claim();
        if(irq == CONSOLE_IRQ){
            Console::console_handler();
        }
        plic_complete(irq);
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        // console_handler();
    }
}
