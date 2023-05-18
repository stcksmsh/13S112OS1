#include "../h/syscall_c.h"
#include "../lib/console.h"
#include "../h/riscv.hpp"
#include "../h/userMain.hpp"
#include "../h/tcb.hpp"
#include "../h/MemoryAllocator.hpp"

// #include "../h/printing.hpp"





void main() {
    __asm__ volatile ("csrw stvec, %[supTrap]" : : [supTrap] "r"(&supervisorTrap));
    TCB* thread;
    thread_create(&thread, nullptr, nullptr);
    TCB::running=thread;
    changeUser();
    userMain();
    while(Scheduler::get())thread_dispatch();

    MemoryAllocator::getInstance().mem_free(thread);
}

