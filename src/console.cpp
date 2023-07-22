#include "../h/console.hpp"
#include "../h/syscall_c.h"

// Console::consoleBuffer(int i){

// }

Console::consoleBuffer::consoleBuffer(int size){
    this->size = size;
    first = 0;
    last = 0;
    buff = (char*)mem_alloc(sizeof(char) * size);
}

char Console::consoleBuffer::get(){
    if(isEmpty())return EOF;
    char ret = buff[first++];
    first %= size;
    return ret;
}

void Console::consoleBuffer::put(char ch){
    if(isFull())return;
    buff[last++] = ch;
    last %= size;
}

bool Console::consoleBuffer::isEmpty(){
    return first == last;
}

bool Console::consoleBuffer::isFull(){
    return ( last + 1 ) % size == first;
}

Console::Console():inBuffer(BUFFER_SIZE), outBuffer(BUFFER_SIZE){
    running = true;
    sem_open(&readSem, 0);
}


void Console::stop(){
    getInstance()->running = false;
}


char Console::read(){
    sem_wait(getInstance()->readSem);
    return getInstance()->inBuffer.get();
}

void Console::write(char ch){
    getInstance()->outBuffer.put(ch);
}

void Console::outThread(void* arg){
    Console *c = getInstance();
    do{
        while((((char*)CONSOLE_STATUS)[0] & CONSOLE_TX_STATUS_BIT) > 0 && !c->outBuffer.isEmpty())((char*)CONSOLE_TX_DATA)[0] = c->outBuffer.get();
        thread_dispatch();
    }while(c->running || !c->outBuffer.isEmpty());
}

Console* Console::getInstance(){
    static Console instance;
    return &instance;
}

void Console::console_handler(){
    Console *c = getInstance();
    while((((char*)CONSOLE_STATUS)[0] & CONSOLE_RX_STATUS_BIT) > 0 && !c->inBuffer.isFull()){
        __putc('c');
        c->inBuffer.put(((char*)CONSOLE_RX_DATA)[0]);
        sem_signal(c->readSem);
    }
}
