#include "../h/syscall_c.hpp"
#include "../h/thread.h"

extern "C" void trap();
uint64 address = 0;

void doFunc();

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

void doFunc(){
    uint64 ra;
    __asm__ volatile ("mv %0, ra" : "=r"(ra));
    __asm__ volatile ("mv ra, %0" : : "r"(address));
    address = ra + 4;
    return;
}

void main(){
    __asm__ volatile ("csrw stvec, %0" : :  "r"(&trap));
    uint64 sp = 0;
    __asm__ volatile ("mv %0, sp" : "=r"(sp));
    __asm__ volatile ("mv sp, %0" :: "r"(sp));
    putc('E');
    return;
    thread_t handle;
    address = (uint64)helloWorld;
    // doFunc();
    thread_create(&handle, nullptr, nullptr);
    thread_create(&handle, helloWorld, nullptr);
    thread::running = Scheduler::get();
    while(!Scheduler::isEmpty()){
        thread_dispatch();
        putc('a');
    }
    putc('.');
}