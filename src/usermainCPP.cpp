#include "usermain.h"
#include "syscall_cpp.h"
#include "usermain.h"
#include "assert.h"


Semaphore *sem1cpp, *sem2cpp;

char ccpp;

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
    ccpp = 't';
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
}