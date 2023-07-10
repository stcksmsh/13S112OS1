#include "../h/syscall_c.h"
#include "../h/usermain.hpp"

void usermain(){
    int *arr;
    arr = (int*)mem_alloc(sizeof(int) * 1000);
    putc('1');
    putc('\n');
    for(int i = 0; i < 1000; i ++){
        putc('2');
        arr[i] = i;
        putc('\n');
    }
    putc('3');
    putc('\n');

    for(int i = 0; i < 100; i ++){
        putc('0' + arr[i]%10);
        putc(' ');
    }
    putc('4');
    putc('\n');

}