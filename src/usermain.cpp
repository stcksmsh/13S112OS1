#include "../h/syscall_c.hpp"
#include "../h/usermain.hpp"

sem_t semaphore;

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
    sem_signal(semaphore);
}


void usermain(){
    thread_t handle;
    thread_create(&handle, bullshit, nullptr);
    sem_open(&semaphore, 0);
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
    thread_sleep(100);
    // sem_wait(semaphore);
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
}