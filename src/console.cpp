/**
 * @file console.h
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief implementation of the console class used for I/O
 * @version 0.1
 * @date 2024-01-25
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#include "console.h"
#include "syscall_c.h"
#include "assert.h"

Console* Console::instance = 0;

Console::Console(){
    assert(instance == 0);
    instance = this;
}

Console::~Console(){
    sem_close(inSem);
}

void Console::init(){
    sem_open(&inSem, 0);
}

Console& Console::getInstance(){
    assert(instance != 0);
    return *instance;
}

void Console::consoleBuffer::put(char c){
    buffer[tail] = c;
    tail = (tail + 1) % BUFFER_SIZE;
    size++;
}

char Console::consoleBuffer::get(){
    char c = buffer[head];
    head = (head + 1) % BUFFER_SIZE;
    size--;
    return c;
}

bool Console::consoleBuffer::isEmpty(){
    return size == 0;
}

bool Console::consoleBuffer::isFull(){
    return size == BUFFER_SIZE;
}

void Console::putc(char c){
    instance->outBuffer.put(c);
}

char Console::getc(){
    sem_wait(instance->inSem);
    return instance->inBuffer.get();
}

void Console::outputHandler(){
    while(!instance->outBuffer.isEmpty()){
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
            (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
        }
    }
}

void Console::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
        char ch =(*(char*)CONSOLE_RX_DATA);
        instance->inBuffer.put(ch);
        sem_signal(instance->inSem);
    }
}