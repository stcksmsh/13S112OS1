#include "../h/syscall_c.hpp"
#include "../h/thread.h"
#include "../h/memoryAllocator.h"
#include "../h/usermain.h"

extern "C" void trap();


uint64 SHITASS = 0;

void usermainWrapper(void* arg){
    usermain();
}

void main(){
    __asm__ volatile ("csrw stvec, %0" : :  "r"(&trap));
    changeUser();
    for(int i = 0; i < 2147483646; i ++){
        int k = 0;
        k = k * 13;
        k = k / 13;
        k = k * 13;
        k = k / 13;
        k = k * 13;
    }
    return;
    thread_t handle;
    thread_create(&handle, nullptr, nullptr);//    <-------------------
    thread_create(&handle, usermainWrapper, nullptr);//                    |
    thread::running = Scheduler::get(); // the nullptr nullptr one  ---
    while(!Scheduler::isEmpty())
        thread_dispatch();
}