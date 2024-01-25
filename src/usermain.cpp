#include "syscalls_c.h"
#include "usermain.h"
#include "thread.h"
#include "sem.h"
#include "sched.h"
#include "assert.h"

sem_t sem1;
sem_t sem2;

void thread_test_1(void* args){
    putc('1');
    putc('s');
    time_sleep(30);
    putc('1');
    sem_signal(sem1);
    putc('S');
}

void thread_test_2(void* args){
    putc('2');
    putc('s');
    time_sleep(100);
    putc('2');
    putc('S');
    // while(1);
    sem_signal(sem2);
}

void usermain(void* arg){
    putc('0');
    thread_t t1, t2;
    sem_open(&sem1, 0);
    sem_open(&sem2, 0);
    thread_create(&t1, thread_test_1, 0);
    thread_create(&t2, thread_test_2, 0);
    sem_wait(sem1);
    putc('3');
    // thread_join(t2);
    // if(getc() == 'a')putc('x');
    putc('4');
    // thread_join(t1);
    // thread_dispatch();
    // thread_dispatch();
    sem_wait(sem2);
    putc('5');
}