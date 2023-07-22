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
    // putc('0');
    // __asm__ volatile ("csrs sstatus, %0" : :  "r"(1 << 1)); // sets bit 1 of sstatus
    putc('1');
    changeUser();
    putc('2');
    thread_t out, main, prog;
    thread_create(&main, nullptr, nullptr);
    putc('3');
    thread::running = Scheduler::get();
    thread_create(&out, Console::outThread, nullptr);
    putc('4');
    Scheduler::setCore(out, main);
    putc('5');
    thread_create(&prog, usermainWrapper, nullptr);
    putc('6');
    do{
        while(!Scheduler::isEmpty())thread_dispatch();
    }while(!Scheduler::isEmpty() || !threadSleepHandler::allAwake());
    Console::stop();
}