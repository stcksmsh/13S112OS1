#include "../h/syscall_c.h"
#include "../h/thread.hpp"
#include "../h/sem.hpp"
#include "../h/console.hpp"

#include "../h/usermain.hpp"
#include "../test_h/userMain.hpp"

extern "C" void trap();

bool mainEnd = false;

void usermainWrapper(void* arg){
    // private tests
    // usermain();
    // public tests
    userMain();
    mainEnd = true;
}

void main(){
    __asm__ volatile ("csrw stvec, %0" : :  "r"(&trap)); // sets the syscall routine
    changeUser();
    putc('x');
    thread_t out, main, prog;
    thread_create(&main, nullptr, nullptr);
    thread::running = Scheduler::get();
    thread_create(&out, Console::outThread, nullptr);
    thread_create(&prog, usermainWrapper, nullptr);
    do{
        // for(int i = 0; i < 10000; i ++){}
        // while(!Scheduler::isEmpty()){
        // thread_dispatch();
        // }
    }while(!mainEnd);
    Console::stop();
    thread_dispatch();
}