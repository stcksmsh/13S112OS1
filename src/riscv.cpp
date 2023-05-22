#include "../lib/console.h"
<<<<<<< HEAD:src/riscv.cpp
#include "../h/riscv.h"
// #include "../h/tcb.hpp"
=======
#include "../h/ABI.h"
>>>>>>> 0c010e2 (Added initial thread ABI files, testing follows...):src/ABI.cpp
#include "../h/memoryAllocator.h"
// #include "../h/tcb.hpp"
// #include "../h/Sem.h"

<<<<<<< HEAD:src/riscv.cpp
void Riscv::popSppSpie() {

        __asm__ volatile("csrw sepc, ra");
        __asm__ volatile("sret");


}

void Riscv::handleSupervisorTrap() {
    uint64 scauseVar;
    uint64 reg3;
    __asm__ volatile ("mv %[rarg], a3" : [rarg]"=r"(reg3));
    __asm__ volatile("csrr %[ime],scause":[ime] "=r"(scauseVar));

    //sistemski poziv
    if (scauseVar == (0x09) || scauseVar == 0x08)
=======
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


void ABI::trapHandler() {
    uint64 scause;
    __asm__ volatile("csrr %0,scause": "=r"(scause));

    // User and Supervisor syscalls
    if (scause == 0x0000000000000009UL || scause == 0x0000000000000008UL)
>>>>>>> 0c010e2 (Added initial thread ABI files, testing follows...):src/ABI.cpp
    {
        uint64 volatile  sepc;
        __asm__ volatile ("csrr %0, sepc" : "=r" (sepc));
        uint64 x;
<<<<<<< HEAD:src/riscv.cpp
        uint64 volatile sstatus = r_sstatus();
        __asm__ volatile("mv %[rx], a0" : [rx]"=r"(x));
        //malloc
        if (x == 0x01) {
            uint64 ar;
            __asm__ volatile("mv %[ry], a1" : [ry]"=r"(ar));
            //zovi funciju
            void *ret = MemoryAllocator::getInstance().mem_alloc(ar);
            __asm__ volatile ("mv a0, %[addr]" : : [addr]"r"(ret));

        }//free
        else if (x == 0x02) {
            uint64 tmp2;
            __asm__ volatile("mv %[rz], a1" : [rz]"=r"(tmp2));
            void *argT = (void *) tmp2;
            uint ret = MemoryAllocator::getInstance().mem_free(argT);
            __asm__ volatile ("mv a0, %[addrt]" : : [addrt]"r"(ret));
=======
        uint64 volatile sstatus = sstatusRead();
        __asm__ volatile("mv %0, a0" : "=r"(x));
        __putc('0' + ((sstatus & (1<<8))>>8));
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
>>>>>>> 0c010e2 (Added initial thread ABI files, testing follows...):src/ABI.cpp


        }
        // following 2 LINES MISSING WHERE 3rd argument is required
        // uint64 reg3;
        // __asm__ volatile ("mv %0, a3" : "=r"(reg3));
        //
        //thread_create
        // else if(x==0x11){
        //     uint64 thandle;
        //     __asm__ volatile ("mv %[handle], a1" : [handle]"=r"(thandle));
        //     TCB** handle=(TCB**)thandle;
        //     uint64 startR;
        //     __asm__ volatile ("mv %[rs], a2" : [rs]"=r"(startR));
        //     TCB::Body funct=(TCB::Body)startR;
        //     void* arg=
        //     uint64* stack=(uint64*)MemoryAllocator::getInstance().mem_alloc((DEFAULT_STACK_SIZE+ MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
        //     TCB::createThread(funct,handle,arg,stack);
        //     uint64 retVal=0;
        //     if(handle== nullptr)retVal=-1;
        //     __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(retVal));

        // }
        // //exit
        // else if(x==0x12){
        //     TCB::running->setFinished(true);
        //     TCB::dispatch();
        // }
        // //dispatch
        // else if(x==0x13){
        //     TCB::dispatch();

        // }
        // else if(x==0x14){
        //     uint64 thandle;
        //     __asm__ volatile ("mv %[handle], a1" : [handle]"=r"(thandle));
        //     TCB** handle=(TCB**)thandle;
        //     uint64 startR;
        //     __asm__ volatile ("mv %[rs], a2" : [rs]"=r"(startR));
        //     TCB::Body funct=(TCB::Body)startR;
        //     void* arg=(void*)reg3;
        //     uint64* stack=(uint64*)MemoryAllocator::getInstance().mem_alloc((DEFAULT_STACK_SIZE+ MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
        //     TCB::createCPPThread(funct,handle,arg,stack);
        //     uint64 retVal=0;
        //     if(handle== nullptr)retVal=-1;
        //     __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(retVal));

        // }
        // //sem open
        // else if(x==0x21){
        //     uint64 h;
        //     __asm__ volatile ("mv %[handle], a1" : [handle]"=r"(h));
        //     Sem** handle=(Sem**)h;
        //     uint64 init;
        //     __asm__ volatile ("mv %[in], a2" : [in]"=r"(init));
        //     Sem::openSem(handle,init);
        //     uint64 returnValue=0;
        //     if(handle== nullptr)returnValue=-1;
        //     __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(returnValue));


        // }
        // //sem close
        // else if(x==0x22){
        //     uint64 h;
        //     __asm__ volatile ("mv %[handle], a1" : [handle]"=r"(h));
        //     Sem* handle=(Sem*)h;
        //     int returnValue=Sem::closeSem(handle);
        //     __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(returnValue));
        // }
        // //sem wait
        // else if(x==0x23){
        //     uint64 h;
        //     __asm__ volatile ("mv %[handle], a1" : [handle]"=r"(h));
        //     Sem* handle=(Sem*)h;
        //     int returnValue=Sem::semWait(handle);
        //     __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(returnValue));

        // }
        // //sem signal
        // else if(x==0x24){
        //     uint64 h;
        //     __asm__ volatile ("mv %[handle], a1" : [handle]"=r"(h));
        //     Sem* handle=(Sem*)h;
<<<<<<< HEAD:src/riscv.cpp
        //     int ret=Sem::semSignal(handle);
        //     __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
        // }
    //change to user mode
=======
        //     int returnValue=Sem::semSignal(handle);
        //     __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(returnValue));
        // }//change to user mode
>>>>>>> 0c010e2 (Added initial thread ABI files, testing follows...):src/ABI.cpp
        else if(x==0x25){
            sstatusWrite(sstatus);
            sstatusBitClear(8); /// clears SPP (sets desired mode to User) 
            __asm__ volatile ("csrw sepc, %0" : : "r" (sepc + 4));
            sipBitClear(1); /// clears SSIP (there exists an interrupt request)
            return;
        }//getc
        else if(x==0x41){
            char c=__getc();
            __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(c));
        }
        //putc
        else if(x==0x42){
            uint64 ch;
            __asm__ volatile ("mv %[handle], a1" : [handle]"=r"(ch));
            __putc(ch);
        }

        sstatusWrite(sstatus);
        __asm__ volatile ("csrw sepc, %0" : : "r" (sepc + 4));
        sipBitClear(8);
    }
    else if (scauseVar == 0x8000000000000001UL)
    {

        sipBitClear(8);

    }
    else if (scauseVar== 0x8000000000000009UL)
    {
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    }
    else
    {
        // unexpected trap cause
    }

}
