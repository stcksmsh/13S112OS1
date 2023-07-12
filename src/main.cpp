#include "../h/syscall_c.h"
#include "../h/thread.hpp"
#include "../h/memoryAllocator.hpp"
#include "../h/usermain.hpp"
#include "../test_h/userMain.hpp"
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
    thread_t handle;
    thread_create(&handle, nullptr, nullptr);// <----------------------7
    thread::running = Scheduler::get(); // the nullptr nullptr one -------------/
    if(thread::running != handle)putc('e');

    thread_create(&handle, usermainWrapper, nullptr);
    do{
        while(!Scheduler::isEmpty()){
            putc('.');
            thread_dispatch();
        }
    }while(!Scheduler::isEmpty()  || !threadSleepHandler::isEmpty());
    putc('\n');
    putc('E');
    putc('n');
    putc('d');
    putc('.');
    putc('.');
    putc('.');
}