#include "../h/syscall_c.h"


void* mem_alloc(size_t size){
    size = (size+ MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    __asm__ volatile ("mv a1,%0" : : "r" (size)); /// size in blocks
    __asm__ volatile("li a0, 0x1"); /// syscall code
    __asm__ volatile ("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue)); /// get address
    return (void*) returnValue;

}


int mem_free(void* address){
    __asm__ volatile ("mv a1,%0" : : "r" (address));
    __asm__ volatile("li a0, 0x2");
    __asm__ volatile ("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    return (int)returnValue;
}

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    void* arguments=arg;
    __asm__ volatile("mv a3,%0" : : "r" (arguments));
    void(*sr)(void*)=start_routine;
    __asm__ volatile("mv a2,%0" : : "r" (sr));
    thread_t* h=handle;
    __asm__ volatile("mv a1,%0" : : "r" (h));
    __asm__ volatile("li a0,0x11");
    __asm__ volatile("ecall");
    int returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    return returnValue;
}


int thread_exit() {
    __asm__ volatile("li a0,0x12");
    __asm__ volatile("ecall");
    return 0;
}

int thread_sleep(time_t duration){
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    __asm__ volatile("li a0, 0x31");
    __asm__ volatile("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    return (int)returnValue;
}

void thread_dispatch() {
    ///the PC to return to is currently in ra, and will stay there during the syscall, as ecall puts pc into sepc and not ra
    __asm__ volatile("li a0,0x13");
    __asm__ volatile("ecall");
}


void thread_join (thread_t handle){
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    __asm__ volatile("li a0, 0x14");
    __asm__ volatile("ecall");
}


int sem_open(sem_t *handle, unsigned int init) {
    unsigned int in=init;
    __asm__ volatile("mv a2,%[init]"::[init]"r"(in));
    sem_t* h=handle;
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(h));
    __asm__ volatile("li a0,0x21");
    __asm__ volatile("ecall");
    int returnValue;
    __asm__ volatile("mv %[returnValue], a0" : [returnValue]"=r" (returnValue));
    return returnValue;
}

int sem_close(sem_t handle) {
    sem_t h=handle;
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(h));
    __asm__ volatile("li a0,0x22");
    __asm__ volatile("ecall");
    int returnValue;
    __asm__ volatile("mv %[returnValue], a0" : [returnValue]"=r" (returnValue));
    return returnValue;
}

int sem_wait(sem_t id) {
    sem_t h=id;
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(h));
    __asm__ volatile("li a0,0x23");
    __asm__ volatile("ecall");
    int returnValue;
    __asm__ volatile("mv %[returnValue], a0" : [returnValue]"=r" (returnValue));
    return returnValue;
}

int sem_signal(sem_t id) {
    sem_t h=id;
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(h));
    __asm__ volatile("li a0,0x24");
    __asm__ volatile("ecall");
    int returnValue;
    __asm__ volatile("mv %[returnValue], a0" : [returnValue]"=r" (returnValue));
    return returnValue;
}
char getc()
{
    __asm__ volatile("li a0,0x41");
    __asm__ volatile("ecall");
    int returnValue;
    __asm__ volatile("mv %[returnValue], a0" : [returnValue]"=r" (returnValue));
    return returnValue;
}
void putc(char c)
{
    __asm__ volatile("mv a1,%0"::"r"(c));
    __asm__ volatile("li a0,0x42");
    __asm__ volatile("ecall");
}

void changeUser() {
    __asm__ volatile("li a0,0x25");
    __asm__ volatile("ecall");
    return;

}