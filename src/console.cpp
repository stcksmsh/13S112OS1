#include "../h/console.hpp"
#include "../h/syscall_c.hpp"

char Console::read(){
    Console *c = getIntance();
    if(c->inBufferIndex < 0)return -1;
    return c->inBuffer[c->inBufferIndex--];
}

void Console::write(char ch){
    Console *c = getIntance();
    if(c->inBufferIndex == BUFFER_SIZE);
    c->outBuffer[++c->outBufferIndex] = ch;
}

Console* Console::getIntance(){
    static Console instance;
    if(instance.outBuffer == nullptr){
        instance.outBuffer = (char*)MemoryAllocator::getInstance().mem_alloc((sizeof(char) * BUFFER_SIZE + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE);
        instance.inBuffer = (char*)MemoryAllocator::getInstance().mem_alloc((sizeof(char) * BUFFER_SIZE + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE);
    }
    return &instance;
}

void Console::console_handler(){
    Console *c = getIntance();
    while(((*(char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT )&& c->inBufferIndex < BUFFER_SIZE){
        c->inBuffer[c->inBufferIndex++] = *((char*)CONSOLE_RX_DATA);
        c->inBufferIndex ++;
    }
    if(c->outBufferIndex>=0)putc('x');
    while(((int)(*(char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) == CONSOLE_TX_STATUS_BIT && c->outBufferIndex>=0){
        *((char*)CONSOLE_TX_DATA) = c->outBuffer[c->outBufferIndex];
        c->outBufferIndex --;
    }
}
