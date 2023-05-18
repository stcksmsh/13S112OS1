#include "../h/c_syscalls.h"
#include "../h/memoryAllocator.h"


void* mem_alloc(size_t size){
    return MemoryAllocator::getInstance().mem_alloc(size);;
}

int mem_free(void* address){
    return MemoryAllocator::getInstance().mem_free(address);
}



char getc(){
    return __getc();
}

void putc(char ch){
    __putc(ch);
}