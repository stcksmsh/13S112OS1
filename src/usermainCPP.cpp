#include "usermain.h"
#include "syscall_cpp.h"
#include "usermain.h"
#include "assert.h"
#include "heapManager.h"

Semaphore *sem1cpp, *sem2cpp;


char ccpp;


void memTestcpp(){
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
    int** matrix = new int*[n];
    for(int i = 0; i < n; i++){
        matrix[i] = new int[k];
        for(int j = 0; j < k; j++){
            matrix[i][j] = i * k + j;
        }
    }
    for(int i = 0; i < n; i++){
        for(int j = 0; j < k; j++){
            assert(matrix[i][j] == i * k + j);
        }
        delete[] matrix[i];
    }
    delete[] matrix;
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



void thread_test_1cpp(void* args){
    putc('1');
    putc('s');
    if(ccpp == 't')Thread::sleep(100);
    putc('1');
    if(ccpp == 's')sem1cpp->signal();
    putc('S');
}

void thread_test_2cpp(void* args){
    putc('2');
    putc('s');
    if(ccpp == 't')Thread::sleep(50);
    putc('2');
    if(ccpp == 's')sem2cpp->signal();
    putc('S');
}


void usermainCPP(void* arg){
    ccpp = 's';
    if(ccpp == 'm'){
        memTestcpp();
        memTestcpp();
        memTestcpp();
        return;
    }
    memTestcpp();
    putc('0');
    Thread *t1, *t2;
    t1 = new Thread(thread_test_1cpp, 0);
    t2 = new Thread(thread_test_2cpp, 0);
    if(ccpp == 's'){
        sem1cpp = new Semaphore(0);
        sem2cpp = new Semaphore(0);
    }
    t1->start();
    t2->start();
    if(ccpp == 's')sem1cpp->wait();
    putc('3');
    if(ccpp == 't')t2->join();
    putc('4');
    if(ccpp == 't')t1->join();
    if(ccpp == 's')sem2cpp->wait();
    putc('5');
    if(ccpp == 's')t2->join();
    if(ccpp == 's')t1->join();
    putc('\n');
    memTestcpp();
}