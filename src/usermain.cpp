#include "../h/syscall_c.h"
#include "../h/usermain.hpp"
#include "../h/thread.hpp"

sem_t sem1, sem2;

void thread_test_1(void* args){
    putc('1');
    putc('s');
    thread_sleep(100);
    putc('1');
    putc('S');
    sem_signal(sem1);
}
void thread_test_2(void* args){
    // for(int i = 0;i < 1000000000; i ++){} /// busy wait
    putc('2');
    putc('s');
    thread_sleep(20);
    putc('2');
    putc('S');
    sem_signal(sem2);
}

void usermain(){
    thread_t t1, t2;
    putc('0');
    sem_open(&sem1, 0);
    sem_open(&sem2, 0);
    thread_create(&t1, thread_test_1, nullptr);
    thread_create(&t2, thread_test_2, nullptr);
    sem_wait(sem1);
    putc('3');
    sem_wait(sem2);
    putc('4');
}