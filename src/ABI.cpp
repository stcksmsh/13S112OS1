#include "../lib/console.h"
#include "../h/ABI.h"
#include "../h/memoryAllocator.h"
#include "../h/thread.h"
#include "../h/sem.h"

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

void ABI::trapHandler() {/// address to return to (in case of c/cpp syscalls is in ra)
    uint64 scause;
    __asm__ volatile("csrr %0,scause": "=r"(scause));
    // User and Supervisor syscalls
    if (scause == 0x0000000000000009UL || scause == 0x0000000000000008UL)
    {
        uint64 volatile  sepc;
        __asm__ volatile ("csrr %0, sepc" : "=r" (sepc));
        uint64 x;
        uint64 volatile sstatus = sstatusRead();
        __asm__ volatile("mv %0, a0" : "=r"(x));
        // malloc
        if (x == 0x01) {
            uint64 size;
            /// fetch requested size, in number of memory blocks
            __asm__ volatile("mv %0, a1" : "=r"(size));
            /// give return value
            void *returnValue = MemoryAllocator::getInstance().mem_alloc(size);
            __asm__ volatile ("mv a0, %0" : : "r"((uint64)returnValue));
        }
        // free
        else if (x == 0x02) {
            uint64 address;
            __asm__ volatile("mv %0, a1" : "=r"(address));
            int returnValue = MemoryAllocator::getInstance().mem_free((void*)address);
            __asm__ volatile ("mv a0, %0" : : "r"((uint64)returnValue));


        }
        /// thread_create
        else if(x==0x11){
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
        else if(x==0x12){
            uint64 retVal = thread::running->exit();
            __asm__ volatile ("mv a0, %0" :: "r"(retVal));
        }
        // //dispatch
        else if(x==0x13){
            thread::dispatch();
        }
        // join
        else if(x==0x14){
            uint64 handle;
            __asm__ volatile ("mv %0, a1" : "=r"(handle));
            ((thread_t)handle)->joinTo();/// joins current thread onto the given thread
        }
        //sem open
        else if(x==0x21){
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
        else if(x==0x22){
            uint64 handle;
            __asm__ volatile ("mv %0, a1" : "=r"(handle));
            int returnValue=sem::sem_close((sem_t)handle);
            __asm__ volatile ("mv a0, %0" : : "r"(returnValue));
        }
        //sem wait
        else if(x==0x23){
            uint64 handle;
            __asm__ volatile ("mv %0, a1" : "=r"(handle));
            int returnValue=sem::sem_wait((sem_t)handle);
            __asm__ volatile ("mv a0, %0" : : "r"(returnValue));

        }
        //sem signal
        else if(x==0x24){
            uint64 handle;
            __asm__ volatile ("mv %0, a1" : "=r"(handle));
            int returnValue=sem::sem_signal((sem_t)handle);
            __asm__ volatile ("mv a0, %0" : : "r"(returnValue));
        }
        //change to user mode
        else if(x==0x25){
            sstatusWrite(sstatus);
            sstatusBitClear(8); /// clears SPP (sets desired mode to User) 
            __asm__ volatile ("csrw sepc, %0" : : "r" (sepc + 4));
            sipBitClear(1); /// clears SSIP (there exists an interrupt request)
            return;
        }//getc
        else if(x==0x41){
            char c=__getc();
            __asm__ volatile ("mv a0, %0" : : "r"(c));
        }
        //putc
        else if(x==0x42){
            uint64 ch;
            __asm__ volatile ("mv %0, a1" : "=r"(ch));
            __putc(ch);
        }

        sstatusWrite(sstatus);
        __asm__ volatile ("csrw sepc, %0" : : "r" (sepc + 4));
        sipBitClear(1);
    }
    else if (scause == 0x8000000000000001UL)
    {
        __putc('*');
        if(!thread::running->live()){/// it has run for longer than its alloted time slice
            thread::dispatch();
        }
        sipBitClear(1);

    }
    else if (scause== 0x8000000000000009UL)
    {
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    }
    else
    {
        // unexpected trap cause
    }

}
