#include "../h/syscall_c.hpp"
#include "../h/thread.h"
#include "../h/memoryAllocator.h"

extern "C" void trap();

uint64 SHITASS = 0;

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
    putc('Y');
    putc('e');
    putc('a');
    putc('h');
    putc('\n');
    thread_exit();
}


void helloToo(void* arg = nullptr){
    putc('H');
    putc('e');
    putc('l');
    putc('l');
    putc('o');
    putc(' ');
    putc('t');
    putc('o');
    putc(' ');
    putc('y');
    putc('o');
    putc('u');
    putc(' ');
    putc('t');
    putc('o');
    putc('o');
    putc('\n');
    thread_exit();
}

void main(){
    __asm__ volatile ("csrw stvec, %0" : :  "r"(&trap));
    thread_t handle;
    thread_create(&handle, helloWorld, nullptr);
    thread_create(&handle, helloToo, nullptr);
    changeUser();
    thread_dispatch();
}