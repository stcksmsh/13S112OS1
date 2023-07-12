#include "../h/syscall_c.h"
#include "../h/usermain.hpp"
#include "../h/memoryAllocator.hpp"

sem_t sem1, sem2;

void thread_test_1(void* args){
    putc('1');
    // thread_sleep(500);
    sem_signal(sem1);
}
void thread_test_2(void* args){
    putc('2');
    for(int i = 0;i < 1000000; i ++){
        i += 1;
        i -= 1;
        i += 1;
        i -= 1;
        i += 1;
        i -= 1;
        i += 1;
        i -= 1;
        i += 1;
        i -= 1;
    } /// busy waitgi
    // thread_sleep(1000);
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