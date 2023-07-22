#include "../h/syscall_cpp.hpp"
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
    __asm__ volatile("li a4,1");
    void* arguments=arg;
    __asm__ volatile("mv a3,%0" : : "r" (arguments));
    __asm__ volatile("mv a2,%0" : : "r" (body));
    __asm__ volatile("mv a1,%0" : : "r" (&myHandle));
    __asm__ volatile("li a0,0x11");
    __asm__ volatile("ecall");
    int returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
}


Thread::~Thread(){
    __asm__ volatile("li a0, 0x12"); //thread exit
    __asm__ volatile("ecall");
}

Thread::Thread(){
    
}

int Thread::start(){
    Scheduler::put(myHandle);
    return 0;
}


void Thread::join(){
    __asm__ volatile("mv a1, %0" : : "r"((uint64)myHandle));
    __asm__ volatile("li a0, 0x14");
    __asm__ volatile("ecall");
}


void Thread::dispatch() {
    ///the PC to return to is currently in ra, and will stay there during the syscall, as ecall puts pc into sepc and not ra
    __asm__ volatile("li a0,0x13");
    __asm__ volatile("ecall");
}


int Thread::sleep(time_t duration){
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    __asm__ volatile("li a0, 0x31");
    __asm__ volatile("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    return (int)returnValue;
}


Semaphore::Semaphore(unsigned init) {
    unsigned int in=init;
    __asm__ volatile("mv a2,%[init]"::[init]"r"(in));
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(&myHandle));
    __asm__ volatile("li a0,0x21");
    __asm__ volatile("ecall");
    int returnValue;
    __asm__ volatile("mv %[returnValue], a0" : [returnValue]"=r" (returnValue));
}

Semaphore::~Semaphore() {
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(myHandle));
    __asm__ volatile("li a0,0x22");
    __asm__ volatile("ecall");
}

int Semaphore::wait() {
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(myHandle));
    __asm__ volatile("li a0,0x23");
    __asm__ volatile("ecall");
    int returnValue;
    __asm__ volatile("mv %[returnValue], a0" : [returnValue]"=r" (returnValue));
    return returnValue;
}

int Semaphore::signal() {
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(myHandle));
    __asm__ volatile("li a0,0x24");
    __asm__ volatile("ecall");
    int returnValue;
    __asm__ volatile("mv %[returnValue], a0" : [returnValue]"=r" (returnValue));
    return returnValue;
}

PeriodicThread::PeriodicThread(time_t period){
    this->period = period;
}

char Console::getc()
{
    __asm__ volatile("li a0,0x41");
    __asm__ volatile("ecall");
    int returnValue;
    __asm__ volatile("mv %[returnValue], a0" : [returnValue]"=r" (returnValue));
    return returnValue;
}

void Console::putc(char c)
{
    __asm__ volatile("mv a1,%0"::"r"(c));
    __asm__ volatile("li a0,0x42");
    __asm__ volatile("ecall");
}