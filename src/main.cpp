//
// Created by os on 8/6/22.
//
#include "../h/syscall_c.h"
#include "../lib/console.h"
#include "../h/riscv.hpp"
#include "../h/userMain.hpp"
#include "../h/tcb.hpp"
#include "../h/MemAllocator.h"

// #include "../h/printing.hpp"





void main() {
    __asm__ volatile ("csrw stvec, %[supTrap]" : : [supTrap] "r"(&supervisorTrap));
    TCB* thread;
    thread_create(&thread, nullptr, nullptr);
    TCB::running=thread;
    changeUser();
    userMain();
    while(Scheduler::get())thread_dispatch();

    MemAlloc::getInstance().mem_free(thread);
}

