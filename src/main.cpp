#include "../h/syscall_c.hpp"

extern "C" void trap();

void helloWorld(void* arg){
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

void main(){
    __asm__ volatile ("csrw stvec, %[vector]" : : [vector] "r"(&trap));
    thread_t handle;
    thread_create(&handle, helloWorld, nullptr);
}