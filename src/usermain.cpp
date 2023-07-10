#include "../h/syscall_c.h"
#include "../h/usermain.hpp"

void usermain(){
    int *arr;
    arr = (int*)mem_alloc(sizeof(int) * 10000);
    putc('1');
    putc('\n');
    for(int i = 0; i < 10000; i ++){
        putc('2');
        arr[i] = i;
        putc('\n');
    }
    putc('3');
    putc('\n');
    int cnt = 0;
    for(int i = 0; i < 10000; i ++){
        if(arr[i] == i)cnt ++;
    }
    while(cnt > 0){
        putc('0' + cnt%10);
        cnt /= 10;
    }
    putc('\n');

}