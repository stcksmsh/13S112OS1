#include "../h/syscall_c.hpp"
#include "../h/thread.h"

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
}

void doFunc(uint64 address){
    __asm__ volatile ("mv ra, %0" : : "r"(address));
    return;
}

void main(){
    __asm__ volatile ("csrw stvec, %0" : :  "r"(&trap));
    thread_t handle;
    doFunc((uint64)helloWorld);
    thread_create(&handle, helloWorld, nullptr);
    thread::running = Scheduler::get();
    if(thread::running != handle)
        putc('X');
    return;
    thread::wrapper();
    while(!Scheduler::isEmpty()){
        thread_dispatch();
        putc('a');
    }
    putc('.');
}