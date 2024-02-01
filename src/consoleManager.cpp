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
#include "sem.h"
#include "assert.h"
#include "syscall_c.h"

ConsoleManager* ConsoleManager::instance = 0;

ConsoleManager::ConsoleManager(){
    assert(instance == 0);
    instance = this;
}

ConsoleManager::~ConsoleManager(){
}

void ConsoleManager::init(){
    inBuffer.init();
    outBuffer.init();
    waitingThreads = 0;
}

ConsoleManager& ConsoleManager::getInstance(){
    assert(instance != 0);
    return *instance;
}

ConsoleManager::consoleBuffer::~consoleBuffer(){
    sem_close(sem);
}

void ConsoleManager::consoleBuffer::init(){
    _sem::open(&sem, 0);
}

void ConsoleManager::consoleBuffer::put(char c){
    buffer[tail] = c;
    tail = (tail + 1) % BUFFER_SIZE;
    size++;
    sem_signal(sem);
}

char ConsoleManager::consoleBuffer::get(){
    sem_wait(sem);
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
    char c = instance->inBuffer.get();
    instance->waitingThreads--;
    return c;
}

bool ConsoleManager::finished(){
    return instance->outBuffer.isEmpty() && instance->waitingThreads == 0;
}

void ConsoleManager::outputHandler(){
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
        (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
    }
}

void ConsoleManager::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
        char ch =(*(char*)CONSOLE_RX_DATA);
        instance->inBuffer.put(ch);
    }
}