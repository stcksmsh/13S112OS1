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
    arr = (int**)mem_alloc(sizeof(int*) * 100);
    // putc('1');
    // putc('\n');
    segPrint();
    for(int i = 0; i < 100; i ++){
        putc('2');
        arr[i] = (int*)mem_alloc(sizeof(int) * 100);
        segPrint();
        for(int j = 0; j < 100 ; j++){
            arr[i][j] = 100*i + j;
        }
    }
    // putc('3');
    // putc('\n');
    int cnt = 0;
    for(int i = 0; i < 100; i ++){
        for(int j = 0; j < 100; j ++){
            if(arr[i][j] == 100*i+j)cnt++;
        }
    }
    while(cnt > 0){
        putc('0' + cnt%10);
        cnt /= 10;
    }
    // putc('\n');

}