#include "../h/syscall_cpp.hpp"
#include "assert.h"

void* operator new(size_t size){

#ifdef PARANOID
	void* ptr = mem_alloc(size);
	assert(ptr != nullptr);
	return ptr;
#else
	return mem_alloc(size);
#endif
}

void operator delete(void* chunk){

#ifdef PARANOID
	assert(mem_free(chunk) == 0);
#else
	mem_free(chunk);
#endif
}

void *operator new[](size_t size){

#ifdef PARANOID
	void* ptr = mem_alloc(size);
	assert(ptr != nullptr);
	return ptr;
#else
    return mem_alloc(size);
#endif
}

void operator delete[](void* chunk){

#ifdef PARANOID
	assert(mem_free(chunk) == 0);
#else
    mem_free(chunk);
#endif
}

void cppThreadWrapper(void* arg) {
	Thread* thread = static_cast<Thread*>(arg);
	thread->run();
}

Thread::Thread(void (* body)(void*), void* arg){

	this->body = body;
	this->arg = arg;
	this->myHandle = nullptr;
}

Thread::Thread(){

	this->myHandle = nullptr;
	this->body = nullptr;
	this->arg  = nullptr;
}

Thread::~Thread(){
}

int Thread::start(){

    void (*code)(void*) = ((this->body== nullptr)?cppThreadWrapper:this->body);
	void* argument = ((this->body== nullptr)?this:this->arg);
	return thread_create(&myHandle, code, argument);
}
void Thread::join(){
	thread_join(myHandle);
}

void Thread::dispatch(){

	thread_dispatch();
}

int Thread::sleep(time_t t){

    return time_sleep(t);
}

Semaphore::Semaphore(unsigned int init){
#ifdef PARANOID
	assert(sem_open(&myHandle, init) == 0);
#else
	sem_open(&myHandle, init);
#endif
}

Semaphore::~Semaphore(){
#ifdef PARANOID
	assert(sem_close(myHandle) == 0);
#else
	sem_close(myHandle);
#endif
}

int Semaphore::wait(){
	return sem_wait(myHandle);
}

int Semaphore::signal(){

	return sem_signal(this->myHandle);
}

char Console::getc(){

	return ::getc();
}

void Console::putc(char c){
	::putc(c);
}


PeriodicThread::PeriodicThread(time_t period):Thread(){
	this->period = period;
	this->active = false;
}

void PeriodicThread::terminate(){
	this->active = false;
}

void PeriodicThread::run(){
	this->active = true;
	while (this->active) {
		this->periodicActivation();
		Thread::sleep(this->period);
	}
}