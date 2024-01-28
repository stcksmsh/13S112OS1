/**
 * @file consoleManager.h
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief implementation of the console class used for I/O
 * @version 0.1
 * @date 2024-01-25
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#include "consoleManager.h"
#include "syscall_c.h"
#include "assert.h"

ConsoleManager* ConsoleManager::instance = 0;

ConsoleManager::ConsoleManager(){
    assert(instance == 0);
    instance = this;
}

ConsoleManager::~ConsoleManager(){
    sem_close(inSem);
}

void ConsoleManager::init(){
    sem_open(&inSem, 0);
    waitingThreads = 0;
}

ConsoleManager& ConsoleManager::getInstance(){
    assert(instance != 0);
    return *instance;
}

void ConsoleManager::consoleBuffer::put(char c){
    buffer[tail] = c;
    tail = (tail + 1) % BUFFER_SIZE;
    size++;
}

char ConsoleManager::consoleBuffer::get(){
    char c = buffer[head];
    head = (head + 1) % BUFFER_SIZE;
    size--;
    return c;
}

bool ConsoleManager::consoleBuffer::isEmpty(){
    return size == 0;
}

bool ConsoleManager::consoleBuffer::isFull(){
    return size == BUFFER_SIZE;
}

void ConsoleManager::putc(char c){
    instance->outBuffer.put(c);
}

char ConsoleManager::getc(){
    instance->waitingThreads++;
    sem_wait(instance->inSem);
    instance->waitingThreads--;
    return instance->inBuffer.get();
}

bool ConsoleManager::finished(){
    return instance->outBuffer.isEmpty() && instance->waitingThreads == 0;
}

void ConsoleManager::outputHandler(){
    // while(!instance->outBuffer.isEmpty()){
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
            (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
        }
    // }
}

void ConsoleManager::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
        char ch =(*(char*)CONSOLE_RX_DATA);
        instance->inBuffer.put(ch);
        sem_signal(instance->inSem);
    }
}