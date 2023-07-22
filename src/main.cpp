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
    __putc('0');
    // changeUser();
    __putc('1');
    thread_t out, main, prog;
    thread_create(&main, nullptr, nullptr);
    __putc('2');
    thread::running = Scheduler::get();
    __putc('3');
    thread_create(&out, Console::outThread, nullptr);
    __putc('4');
    Scheduler::setCore(out, main);
    __putc('5');
    thread_create(&prog, usermainWrapper, nullptr);
    __putc('6');
    do{
        while(!Scheduler::isEmpty())thread_dispatch();
    }while(!Scheduler::isEmpty() || !threadSleepHandler::allAwake());
    Console::stop();
}