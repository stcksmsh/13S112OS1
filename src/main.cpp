#include "../h/syscall_c.hpp"
#include "../h/thread.h"
#include "../h/memoryAllocator.h"

extern "C" void trap();

extern "C" void userMain();

uint64 SHITASS = 0;

void userMainWrapper(void* arg){
    userMain();
}


void main(){
    __asm__ volatile ("csrw stvec, %0" : :  "r"(&trap));
    thread_t handle;
    thread_create(&handle, nullptr, nullptr);//    <-------------------
    thread_create(&handle, userMainWrapper, nullptr);//                    |
    thread::running = Scheduler::get(); // the nullptr nullptr one  ---
    changeUser();
    while(!Scheduler::isEmpty())
        thread_dispatch();
}