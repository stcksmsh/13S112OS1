#include "../h/console.hpp"
#include "../h/syscall_c.h"

Console::consoleBuffer::consoleBuffer(int size){
    this->size = size;
    first = 0;
    last = 0;
    buff = (char*)mem_alloc(sizeof(char) * size);
    sem_open(&notEmpty, 0);
}

char Console::consoleBuffer::get(){
    if(isEmpty())sem_wait(notEmpty);
    char ret = buff[first++];
    first %= size;
    return ret;
}

void Console::consoleBuffer::put(char ch){
    if(isFull())return;
    buff[last++] = ch;
    last %= size;
    sem_signal(notEmpty);
}

bool Console::consoleBuffer::isEmpty(){
    return first == last;
}

bool Console::consoleBuffer::isFull(){
    return ( last + 1 ) % size == first;
}

Console::Console():inBuffer(BUFFER_SIZE), outBuffer(BUFFER_SIZE){
    running = true;
}


void Console::stop(){
    getInstance()->running = false;
}


char Console::read(){
    Console *c = getInstance();
    return c->inBuffer.get();
}

void Console::write(char ch){
    getInstance()->outBuffer.put(ch);
}

void Console::outThread(void* arg){
    Console *c = getInstance();
    do{
        while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
            (*(char*)CONSOLE_TX_DATA) = c->outBuffer.get();
        }
        thread_dispatch();
    }while(c->running || !c->outBuffer.isEmpty());
}

Console* Console::getInstance(){
    static Console instance;
    return &instance;
}

void Console::console_handler(){
    Console *c = getInstance();
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT){
        char ch =(*(char*)CONSOLE_RX_DATA);
        c->inBuffer.put(ch);
    }
}