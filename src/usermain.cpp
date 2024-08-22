#include "syscall_c.h"
#include "heapManager.h"
#include "usermain.h"
#include "thread.h"
#include "sem.h"
#include "sched.h"
#include "assert.h"


void memTest(){
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    putc('F');
    putc('r');
    putc('e');
    putc('e');
    putc(' ');
    putc('m');
    putc('e');
    putc('m');
    putc('o');
    putc('r');
    putc('y');
    putc(':');
    for(int i=15; i >= 0;i--){
        int digit = (freeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
        }
    }

    putc('\n');
    int n = 100;
    int k = 100;
    int** matrix = (int**)mem_alloc(n * sizeof(int*));
    for(int i = 0; i < n; i++){
        matrix[i] = (int*)mem_alloc(k * sizeof(int));
        for(int j = 0; j < k; j++){
            matrix[i][j] = i * k + j;
        }
    }
    for(int i = 0; i < n; i++){
        for(int j = 0; j < k; j++){
            assert(matrix[i][j] == i * k + j);
        }
        mem_free(matrix[i]);
    }
    mem_free(matrix);
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    putc('F');
    putc('r');
    putc('e');
    putc('e');
    putc(' ');
    putc('m');
    putc('e');
    putc('m');
    putc('o');
    putc('r');
    putc('y');
    putc(':');
    for(int i=15; i >= 0;i--){
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
        }
    }
    putc('\n');
    uint64 difference = freeMemory - newFreeMemory;
    putc('D');
    putc('i');
    putc('f');
    putc('f');
    putc('e');
    putc('r');
    putc('e');
    putc('n');
    putc('c');
    putc('e');
    putc(':');
    for(int i=15; i >= 0;i--){
        int digit = (difference >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
        }
    }
    putc('\n');
    putc('\n');
    putc('\n');
}

sem_t sem1, sem2;

char c;

void thread_test_1(void* args){
    putc('1');
    putc('s');
    if(c == 't')time_sleep(60);
    putc('1');
    if(c == 's')sem_signal(sem1);
    putc('S');
}

void thread_test_2(void* args){
    putc('2');
    putc('s');
    if(c == 't')time_sleep(30);
    putc('2');
    if(c == 's')sem_signal(sem2);
    putc('S');
}


void usermain(void* arg){
    c = 's';
    if(c == 'm'){
        memTest();
        return;
    }
    putc('0');
    thread_t t1, t2;
    if(c == 's'){
        sem_open(&sem1, 0);
        sem_open(&sem2, 0);
    }
    thread_create(&t1, thread_test_1, 0);
    thread_create(&t2, thread_test_2, 0);
    if(c == 's')sem_wait(sem1);
    putc('3');
    if(c == 't')thread_join(t2);
    putc('4');
    if(c == 't')thread_join(t1);
    if(c == 's')sem_wait(sem2);
    putc('5');
    if(c == 's')sem_close(sem1);
    if(c == 's')sem_close(sem2);
}