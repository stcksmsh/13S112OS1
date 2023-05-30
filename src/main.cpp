#include "../h/syscall_c.hpp"
#include "../h/thread.h"
#include "../h/memoryAllocator.h"
#include "../h/usermain.h"
#include "../lib/console.h"
extern "C" void trap();


uint64 SHITASS = 0;

void usermainWrapper(void* arg){
    usermain();
}

void main(){
    __asm__ volatile ("csrw stvec, %0" : :  "r"(&trap)); // sets the syscall routine
    changeUser();
    uint64 sie;
    __asm__ volatile("csrr %0,sie" : "=r"(sie));
    __asm__ volatile("csrw sie, %0" : : "r"(sie | 1)); // sets bit 1 of sie, allowing software interrupts
    // to allow the timer, I tried doing it with csrs, but for some reason it did not work...
    // while(true){};
    thread_t handle;
    thread_create(&handle, nullptr, nullptr);//    <-------------------
    thread_create(&handle, usermainWrapper, nullptr);//                    |
    thread::running = Scheduler::get(); // the nullptr nullptr one  ---
    while(!Scheduler::isEmpty())
        thread_dispatch();
}