#include "../h/riscv.h"
#include "../lib/console.h"

void main(){
    __asm__ volatile ("csrw stvec, %[vector]" : : [vector] "r"(&supervisorTrap));
    // __asm__ volatile ("write")
    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("ecall");
}