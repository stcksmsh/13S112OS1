#include "syscalls_c.h"
#include "usermain.h"
#include "thread.h"
#include "sem.h"
#include "sched.h"
#include "assert.h"

sem_t sem1;
// sem_t sem2;

void thread_test_1(void* args){
    putc('1');
    putc('s');
    time_sleep(30);
    putc('1');
    sem_signal(sem1);
    putc('S');
    putc('\n');
    putc('c');
    putc('n');
    putc('t');
    putc(':');
    putc(' ');

    int cnt = Scheduler::getCount();
    putc('0' + cnt);
    putc('\n');
    thread_t t1 = Scheduler::get();
    int id = t1->ID;
    putc('i');
    putc('d');
    putc(':');
    putc(' ');
    putc('0' + id);
    putc('\n');
    thread_t t2 = Scheduler::get();
    id = t2->ID;
    putc('i');
    putc('d');
    putc(':');
    putc(' ');
    putc('0' + id);
    putc('\n');
    cnt = Scheduler::getCount();
    putc('c');
    putc('n');
    putc('t');
    putc(':');
    putc(' ');
    putc('0' + cnt);
    putc('\n');
    Scheduler::put(t2);
    putc('x');
    Scheduler::put(t1);
    putc('x');
    cnt = Scheduler::getCount();
    putc('\n');
    putc('c');
    putc('n');
    putc('t');
    putc(':');
    putc(' ');
    putc('0' + cnt);
    putc('\n');
    // assert(false);
}

void thread_test_2(void* args){
    putc('2');
    putc('s');
    // time_sleep(25);
    putc('2');
    putc('S');
    // sem_signal(sem2);
}

void usermain(void* arg){
    putc('0');
    thread_t t1, t2;
    sem_open(&sem1, 0);
    // sem_open(&sem2, 0);
    thread_create(&t1, thread_test_1, 0);
    thread_create(&t2, thread_test_2, 0);
    sem_wait(sem1);
    putc('3');
    thread_join(t2);
    // if(getc() == 'a')putc('x');
    putc('4');
    // thread_join(t1);
    // thread_dispatch();
    // thread_dispatch();
    // sem_wait(sem2);
    putc('5');
}