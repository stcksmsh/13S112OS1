#include "../h/syscall_c.hpp"

extern "C" void trap();

=======
#include "../h/syscall_c.hpp"

extern "C" void trap();

>>>>>>> 0c010e2 (Added initial thread ABI files, testing follows...)
void main(){
    __asm__ volatile ("csrw stvec, %[vector]" : : [vector] "r"(&trap));

    putc('H');
    putc('e');
    putc('l');
    putc('l');
    putc('o');
    putc(' ');
    putc('w');
    putc('o');
    putc('r');
    putc('l');
    putc('d');
    putc('!');
    putc('\n');
}