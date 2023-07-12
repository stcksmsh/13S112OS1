#include "../h/syscall_c.h"
#include "../h/usermain.hpp"
#include "../h/memoryAllocator.hpp"

sem_t sem1, sem2;

void thread_test_1(void* args){
    putc('1');
    sem_signal(sem1);
}
void thread_test_2(void* args){
    putc('2');
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
    sem_wait(sem2);
    putc('3');
}