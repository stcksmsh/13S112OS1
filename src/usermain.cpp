#include "../h/syscall_c.hpp"
#include "../h/usermain.h"

void bullshit(void* arg){
    putc(' ');
    putc(' ');
    putc('B');
    putc('u');
    putc('l');
    putc('l');
    putc('s');
    putc('h');
    putc('i');
    putc('t');
    putc('!');
    putc('\n');
    thread_exit();
}

void usermain(){
    thread_t handle;
    thread_create(&handle, bullshit, nullptr);
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
    thread_join(handle);
    putc('H');
    putc('o');
    putc('w');
    putc(' ');
    putc('d');
    putc('a');
    putc('r');
    putc('e');
    putc(' ');
    putc('y');
    putc('o');
    putc('u');
    putc('!');
    putc('?');
    putc('\n');



    int* arr = (int*)mem_alloc(4);
    mem_free(arr);
}