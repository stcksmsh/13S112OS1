#include "../h/syscall_c.h"
#include "../h/usermain.hpp"
#include "../h/thread.hpp"

sem_t sem1;
// sem_t sem2;

void printInt(int i){
    int zeroCount = 0;
    if(i % 10 == 0){
        zeroCount = 1;
        i /= 10;
    }
    while(i % 10 == 0 && i > 0){
        zeroCount ++;
        i /= 10;
    }
    int reverse = 0;
    while( i > 0 ){
        reverse = reverse * 10 + i % 10;
        i /= 10;
    }
    i = reverse;
    while( i > 0 ){
        putc('0' + i % 10);
        i /= 10;
    }
    for(int i = 0;i < zeroCount; i ++)putc('0');
}


void thread_test_1(void* args){
    putc('1');
    putc('s');
    thread_sleep(50);
    putc('1');
    putc('S');
    sem_signal(sem1);
}
void thread_test_2(void* args){
    // for(int i = 0;i < 1000000000; i ++){} /// busy wait
    putc('2');
    putc('s');
    thread_sleep(25);
    putc('2');
    putc('S');
    // sem_signal(sem2);
}

void usermain(){
    thread_t t1, t2;
    sem_open(&sem1, 0);
    // sem_open(&sem2, 0);
    thread_create(&t1, thread_test_1, nullptr);
    thread_create(&t2, thread_test_2, nullptr);
    putc('0');
    // // sem_wait(sem2);
    thread_join(t2);
    putc('3');
    thread_join(t1);
    putc('4');
    if(getc() == 'a')putc('x');
    putc('5');
    sem_wait(sem1);
}