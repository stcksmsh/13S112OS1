#include "../h/syscall_c.hpp"
#include "../h/thread.h"
#include "../h/memoryAllocator.h"
#include "../h/usermain.h"
#include "../lib/console.h"
extern "C" void trap();

void usermainWrapper(void* arg){
    usermain();
}

void main(){
    __asm__ volatile ("csrw stvec, %0" : :  "r"(&trap)); // sets the syscall routine
    uint64 sstatus;
    __asm__ volatile ("csrr %0, sstatus" : "=r"(sstatus));
    sstatus |= 1<<5; // set the bit for hardware interrupts to true
    __asm__ volatile ("csrw sstatus, %0" : : "r"(sstatus)); 
    __asm__ volatile ("csrw sie, %0" : : "r"(1<<1));// allows for software interrupts

    changeUser();
    thread_t handle;
    thread_create(&handle, nullptr, nullptr);//    <-------------------
    thread_create(&handle, usermainWrapper, nullptr);//                    |
    thread::running = Scheduler::get(); // the nullptr nullptr one  ---
    while(!Scheduler::isEmpty())
        thread_dispatch();
}