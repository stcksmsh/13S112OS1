#include "../h/syscall_c.h"
#include "../h/usermain.hpp"
#include "../h/memoryAllocator.hpp"

void segPrint(){
    int sgmntcnt = MemoryAllocator::getInstance().numberOfSegments();
    while(sgmntcnt > 0){
        putc('0' + sgmntcnt%10);
        sgmntcnt/=10;
    }
    putc('\n');
}

void usermain(){
    int **arr;
    int size = 10;
    putc('1');
    putc('\n');
    arr = (int**)mem_alloc(sizeof(int*) * size);
    arr[1] = (int*)mem_alloc(sizeof(int) * size);
    putc('1');
    putc('\n');
    for(int i = 0; i < size; i ++){
        putc('2');
        putc('\n');
        arr[i] = (int*)mem_alloc(sizeof(int) * size);
        putc('2');
        putc('\n');
        for(int j = 0; j < size ; j++){
            arr[i][j] = size*i + j;
        }
    }
    putc('3');
    putc('\n');
    int cnt = 0;
    for(int i = 0; i < size; i ++){
        for(int j = 0; j < size; j ++){
            if(arr[i][j] == size*i+j)cnt++;
        }
    }
    while(cnt > 0){
        putc('0' + cnt%10);
        cnt /= 10;
    }
    // putc('\n');

}