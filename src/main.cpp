#include "../h/syscall_c.h"
#include "../h/thread.hpp"
#include "../h/memoryAllocator.hpp"
#include "../h/usermain.hpp"
#include "../h/userMain.hpp"
#include "../lib/console.h"
#include "../h/console.hpp"
extern "C" void trap();

void usermainWrapper(void* arg){
    // private tests
    usermain();
    // public tests
    // userMain();
}

void main(){
    __asm__ volatile ("csrw stvec, %0" : :  "r"(&trap)); // sets the syscall routine
    changeUser();
    putc('0');
    putc('\n');
    thread_t handle;
    thread_create(&handle, nullptr, nullptr);// <----------------------7
    thread::running = Scheduler::get(); // the nullptr nullptr one ---/2
    thread_create(&handle, usermainWrapper, nullptr);
    while(!Scheduler::isEmpty()){
        thread_dispatch();
    }
}