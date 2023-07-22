#include "../h/syscall_c.h"
#include "../h/thread.hpp"
#include "../h/sem.hpp"
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
    testUser();
    thread_t out, main, prog;
    thread_create(&main, nullptr, nullptr);
    thread::running = Scheduler::get();
    thread_create(&out, Console::outThread, nullptr);
    thread_create(&prog, usermainWrapper, nullptr);
    do{
        while(!Scheduler::isEmpty())thread_dispatch();
    }while(!threadSleepHandler::allAwake() || !Scheduler::isEmpty() || !threadSleepHandler::allAwake());
    Console::stop();
}