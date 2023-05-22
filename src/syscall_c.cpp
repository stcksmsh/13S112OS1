#include "../h/syscall_c.hpp"


void* mem_alloc(size_t size){
    size = (size+ MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    __asm__ volatile("li a0, 0x1"); /// syscall code
    __asm__ volatile ("mv a1,%0" : "r" (size)); /// size in blocks
    __asm__ volatile ("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue)); /// get address
    return (void*) returnValue;

}

int mem_free(void* address){
    __asm__ volatile ("mv a1,%0" : "r" (address));
    __asm__ volatile("li a0, 0x2");
    __asm__ volatile ("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    return (int)returnValue;
}

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    void* arguments=arg;
    __asm__ volatile("mv a3,%0":"r" (arguments));
    void(*sr)(void*)=start_routine;
    __asm__ volatile("mv a2,%0": "r" (sr));
    thread_t* h=handle;
    __asm__ volatile("mv a1,%0": "r" (h));
    __asm__ volatile("li a0,0x11");
    __asm__ volatile("ecall");
    int ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

void thread_dispatch() {
    __asm__ volatile("li a0,0x13");
    __asm__ volatile("ecall");
    return;
}

int thread_exit() {
    __asm__ volatile("li a0,0x12");
    __asm__ volatile("ecall");
    return 0;
}

int sem_open(sem_t *handle, unsigned int init) {
    unsigned int in=init;
    __asm__ volatile("mv a2,%[init]"::[init]"r"(in));
    sem_t* h=handle;
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(h));
    __asm__ volatile("li a0,0x21");
    __asm__ volatile("ecall");
    int ret;
    __asm__ volatile("mv %[ret], a0" : [ret]"=r" (ret));
    return ret;
}

int sem_close(sem_t handle) {
    sem_t h=handle;
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(h));
    __asm__ volatile("li a0,0x22");
    __asm__ volatile("ecall");
    int ret;
    __asm__ volatile("mv %[ret], a0" : [ret]"=r" (ret));
    return ret;
}

int sem_wait(sem_t id) {
    sem_t h=id;
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(h));
    __asm__ volatile("li a0,0x23");
    __asm__ volatile("ecall");
    int ret;
    __asm__ volatile("mv %[ret], a0" : [ret]"=r" (ret));
    return ret;
}

int sem_signal(sem_t id) {
    sem_t h=id;
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(h));
    __asm__ volatile("li a0,0x24");
    __asm__ volatile("ecall");
    int ret;
    __asm__ volatile("mv %[ret], a0" : [ret]"=r" (ret));
    return ret;
}
char getc()
{
    __asm__ volatile("li a0,0x41");
    __asm__ volatile("ecall");
    int ret;
    __asm__ volatile("mv %[ret], a0" : [ret]"=r" (ret));
    return ret;
}
void putc(char c)
{
    char zh=c;
    __asm__ volatile("mv a1,%[handle]"::[handle]"r"(zh));
    __asm__ volatile("li a0,0x42");
    __asm__ volatile("ecall");
}

void changeUser() {
    __asm__ volatile("li a0,0x25");
    __asm__ volatile("ecall");
    return;

}


char getc(){
    return __getc();
}

void putc(char ch){
    __putc(ch);
}