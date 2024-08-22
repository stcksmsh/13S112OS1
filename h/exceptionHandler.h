#ifndef EXCEPTIONHANDLER_H
#define EXCEPTIONHANDLER_H

#define SAVE_DATA(call) \
        uint64 sepc, sstatus; \
        __asm__ volatile ("csrr %0, sepc" : "=r"(sepc)); \
        __asm__ volatile ("csrr %0, sstatus" : "=r"(sstatus)); \
        call \
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc)); \
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));

#include "types.h"

enum INTERRUPT_CAUSE: uint64{
	SYSCALL_USER = 0x0000000000000008UL,
	SYSCALL_KERNEL = 0x0000000000000009UL,
    ILLEGAL_INSTRUCTION = 0x0000000000000002UL,
	ILLEGAL_READ_ADDRESS = 0x0000000000000005UL,
	ILLEGAL_WRITE_ADDRESS = 0x0000000000000007UL,
    TIMER = 0x8000000000000001UL,
    KEYBOARD = 0x8000000000000009UL,
};



#endif // EXCEPTIONHANDLER_H