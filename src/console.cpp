#include "../h/console.h"
#include "../h/syscall_c.hpp"

char* Console::outBuffer = (char*)mem_alloc(sizeof(char) * BUFFER_SIZE);
char* Console::inBuffer = (char*)mem_alloc(sizeof(char) * BUFFER_SIZE);
int Console::inBufferIndex = -1;
int Console::outBufferIndex = -1;

char Console::read(){
    if(inBufferIndex < 0)return -1;
    return inBuffer[inBufferIndex--];
}

void Console::write(char c){
    outBuffer[outBufferIndex++] = c;
}


void Console::console_handler(){
    // if(outBuffer == nullptr){
    //     outBuffer = (char*)mem_alloc(sizeof(char) * BUFFER_SIZE);
    //     outBufferIndex = -1;
    // }

    // if(inBuffer == nullptr){
    //     inBuffer = (char*)mem_alloc(sizeof(char) * BUFFER_SIZE);
    //     inBufferIndex = -1;
    // }

    while(((*(char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT )&& inBufferIndex < BUFFER_SIZE){
        inBuffer[inBufferIndex++] = (char)CONSOLE_RX_DATA;
    }

    while(((*(char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && outBufferIndex>=0){
        (*(char*)CONSOLE_TX_DATA) = outBuffer[outBufferIndex--];
    }

}
