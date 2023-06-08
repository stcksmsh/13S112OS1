#include "../h/syscall_c.hpp"
#include "../h/usermain.hpp"
#include "../h/thread.hpp"

// sem_t semaphore;

thread_t handle = nullptr;

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
    if(handle == thread::running)__putc('x');
    // sem_signal(semaphore);
    // putc('X');
    // thread_sleep(1000);
    // putc('X');
}


void usermain(){
    thread_create(&handle, bullshit, nullptr);
    // sem_open(&semaphore, 0);
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
    // thread_sleep(50);
    thread_join(handle);
    // sem_wait(semaphore);
    putc('H');
    putc('o');
    // thread_sleep(10);
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