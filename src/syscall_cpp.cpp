#include "../h/syscall_cpp.hpp"
#include "../h/thread.hpp"
#include "../h/scheduler.hpp"

void *  operator new(size_t size){
    size = (size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    __asm__ volatile ("mv a1,%0" : : "r" (size)); /// size in blocks
    __asm__ volatile("li a0, 0x1"); /// syscall code
    __asm__ volatile ("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue)); /// get address
    return (void*) returnValue;
}

void operator delete(void* address){
    __asm__ volatile ("mv a1,%0" : : "r" (address));
    __asm__ volatile("li a0, 0x2");
    __asm__ volatile ("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
}

Thread::Thread(void ( * body)(void * ), void *  arg){
    handle = nullptr;
    thread_createCPP(&handle, body, arg);
}

Thread::~Thread(){
    handle->setFinished(true);
    delete handle;
}

int Thread::start(){
    Scheduler::put(handle);
    return 0;
}

void Thread::join(){
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    __asm__ volatile("li a0, 0x14");
    __asm__ volatile("ecall");
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t duration){
    return (int)thread_sleep(duration);
}

Thread::Thread() {
    thread_create(&handle, Thread::wrapper, (void*)this);
}

void Thread::wrapper(void *thread) {
    ((Thread*)thread)->run();
}

Semaphore::Semaphore(unsigned init) {
    sem_open(&handle, init);
}

Semaphore::~Semaphore() {
    sem_close(handle);
}

int Semaphore::wait() {
    return sem_wait(handle);
}

int Semaphore::signal() {
    return sem_signal(handle);
}

PeriodicThread::PeriodicThread(time_t period) : Thread(){
    this->period = period;
}

void PeriodicThread::run(){
    while(true){
        periodicActivation();
        sleep(period);
    }
}

char Console::getc()
{
    return getc();
}

void Console::putc(char c)
{
    putc(c);
}