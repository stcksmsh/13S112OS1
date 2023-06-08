#include "../h/syscall_c.hpp"
#include "../h/thread.hpp"
#include "../h/memoryAllocator.hpp"
#include "../h/usermain.hpp"
#include "../lib/console.h"
#include "../h/console.hpp"
extern "C" void trap();

void usermainWrapper(void* arg){
    usermain();
}

void main(){
    __asm__ volatile ("csrw stvec, %0" : :  "r"(&trap)); // sets the syscall routine
    changeUser();
    thread_t handle;
    thread_create(&handle, nullptr, nullptr);// <----------------------7
    thread::running = Scheduler::get(); // the nullptr nullptr one ---/
    thread_create(&handle, usermainWrapper, nullptr);
    do{
        while(!Scheduler::isEmpty()){
            thread_dispatch();
        }
    }
    while(!threadSleepHandler::isEmpty() && !Scheduler::isEmpty());
    putc('\n');
    putc('E');
    putc('n');
    putc('d');
    putc('.');
    putc('\n');
}