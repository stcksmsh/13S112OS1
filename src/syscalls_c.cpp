/**
 * @file syscalls_c.cpp
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief function declarations for the syscalls
 * @version 0.1
 * @date 2024-01-01
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#include "syscalls_c.h"

void* mem_alloc ( size_t nSize ){
    nSize = (nSize + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1);
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    __asm__ volatile ("li a0, 0x1");
    __asm__ volatile ("ecall");
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    return (void*)pAddress;
}

int mem_free ( void* pAddress ){
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    __asm__ volatile ("li a0, 0x2");
    __asm__ volatile ("ecall");
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    return nResult;

}


int thread_create ( thread_t* handle, void(*function)(void*), void* arg) {
    // void* stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    // uint64 stack_start = (uint64)stack_space + DEFAULT_STACK_SIZE -1;
    // __asm__ volatile ("mv a4, %0" : : "r"(stack_start));
    // __asm__ volatile ("mv a4, %0" : : "r"((uint64)nullptr));
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    __asm__ volatile("li a0,0x11");
    __asm__ volatile("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    return (int)returnValue;
}

// int thread_createCPP ( thread_t*, void(*)(void*), void* );

int thread_exit (){
    __asm__ volatile("li a0,0x12");
    __asm__ volatile("ecall");
    return 0;
}

void thread_dispatch () {
    __asm__ volatile("li a0,0x13");
    __asm__ volatile("ecall");
}

// void thread_join ( thread_t );

// int thread_sleep( time_t );

int sem_open ( sem_t* handle, unsigned init) {
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    __asm__ volatile("li a0,0x21");
    __asm__ volatile("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    return (int)returnValue;
}

int sem_close ( sem_t handle) {
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    __asm__ volatile("li a0,0x22");
    __asm__ volatile("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    return (int)returnValue;
}

int sem_wait ( sem_t handle) {
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    __asm__ volatile("li a0,0x23");
    __asm__ volatile("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    return (int)returnValue;
}

int sem_signal ( sem_t handle) {
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    __asm__ volatile("li a0,0x24");
    __asm__ volatile("ecall");
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    return (int)returnValue;
}

char getc(){
    __asm__ volatile ("li a0, 0x41");
    __asm__ volatile ("ecall");
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    return chr;
}

#include "console.h"

void putc(char chr)
{
    __asm__ volatile("mv a1,%0"::"r"(chr));
    __asm__ volatile("li a0,0x42");
    __asm__ volatile("ecall");
}