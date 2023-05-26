#include "../h/syscall_c.hpp"
#include "../h/thread.h"
#include "../h/memoryAllocator.h"

extern "C" void trap();


void helloWorld(void* arg = nullptr){
    putc('H');
    putc('e');
    putc('l');
    putc('l');
    putc('o');
    putc(' ');
    putc('w');
    putc('o');
    putc('r');
    putc('l');
    putc('d');
    putc('!');
    putc('\n');
    thread_exit();
}

void main(){
    __asm__ volatile ("csrw stvec, %0" : :  "r"(&trap));
    thread_t handle;
    // thread_create(&handle, nullptr, nullptr);
    thread_create(&handle, helloWorld, nullptr);
    // thread::running = Scheduler::get();
    __putc('m');
    thread_dispatch();
    __putc('a');
    return;
    while(!Scheduler::isEmpty()){
        thread_dispatch();
        putc('a');
    }
    putc('.');
}