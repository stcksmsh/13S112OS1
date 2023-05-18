#include "../h/ABI.h"
#include "../lib/console.h"

void main(){
    __asm__ volatile ("csrw stvec, %[vector]" : : [vector] "r"(&supervisorTrap));
    // __asm__ volatile ("write")
    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"('H'));
    __asm__ volatile ("ecall");

    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"('e'));
    __asm__ volatile ("ecall");

    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"('l'));
    __asm__ volatile ("ecall");

    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"('l'));
    __asm__ volatile ("ecall");

    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"('o'));
    __asm__ volatile ("ecall");

    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"(' '));
    __asm__ volatile ("ecall");

    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"('w'));
    __asm__ volatile ("ecall");

    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"('o'));
    __asm__ volatile ("ecall");

    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"('r'));
    __asm__ volatile ("ecall");

    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"('l'));
    __asm__ volatile ("ecall");

    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"('d'));
    __asm__ volatile ("ecall");

    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"('!'));
    __asm__ volatile ("ecall");

    __asm__ volatile ("mv a0, %[call]" : : [call] "r"(0x42));
    __asm__ volatile ("mv a1, %[ch]" : : [ch] "r"('\n'));
    __asm__ volatile ("ecall");
}