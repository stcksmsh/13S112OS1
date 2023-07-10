#include "../h/syscall_c.h"
#include "../h/usermain.hpp"

void usermain(){
    int **arr;
    arr = (int**)mem_alloc(sizeof(int*) * 100);
    for(int i = 0; i < 100; i ++){
        arr[i] = (int*)mem_alloc(sizeof(int) * 100);
        for(int j = 0; j < 100; j ++){
            arr[i][j] = i*100+j;
        }
    }

    for(int i = 0; i < 100; i ++){
        for(int j = 0; j < 100; j ++){
            putc('0' + arr[i][j]%10);
        }
        putc('\n');
    }

}