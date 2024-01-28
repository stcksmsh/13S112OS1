/**
 * @file syscall.cpp.cpp
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief implementation of the C++ API for the system calls
 * @version 0.1
 * @date 2024-01-28
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#include "syscall_cpp.h"
#include "syscall_c.h"
#include "sched.h"
#include "thread.h"
#include "sem.h"

void* operator new (size_t nSize){
    return mem_alloc(nSize);
}

void  operator delete (void* pAddress){
    mem_free(pAddress);
}

Thread::Thread (void (*body)(void*), void* arg): body(body), arg(arg){
    this->body = body;
    this->arg = arg;
}

Thread::~Thread (){
    mem_free(myHandle);
}

int Thread::start (){
    return thread_create(&myHandle, body, arg);
}

void Thread::join(){
    thread_join(myHandle);
}

void Thread::dispatch (){
    thread_dispatch();
}

int Thread::sleep (time_t time){
    return time_sleep(time);
}

void threadRun(void* arg){
    Thread* thread = (Thread*)arg;
    thread->run();
}

Thread::Thread (){
    body = &threadRun;
    arg = this;
}



Semaphore::Semaphore (unsigned init){
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore (){
    sem_close(myHandle);
}

int Semaphore::wait (){
    return sem_wait(myHandle);
}

int Semaphore::signal (){
    return sem_signal(myHandle);
}

void PeriodicThread::terminate (){
    /// @todo implement this
}

PeriodicThread::PeriodicThread (time_t period): period(period){
    this->period = period;
    active = true;
}

void PeriodicThread::run (){
    while(1){
        periodicActivation();
        sleep(period);
    }
}



void Console::putc (char c){
    putc(c);
}

char Console::getc (){
    return getc();
}