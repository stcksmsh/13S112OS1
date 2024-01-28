/**
 * @file console.h
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief definition of the console class used for I/O
 * @version 0.1
 * @date 2024-01-25
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#ifndef CONSOLE_H
#define CONSOLE_H

#include "types.h"
#include "sem.h"
#include "syscall_c.h"

#define BUFFER_SIZE 4096

class Console{
public:

    Console();

    ~Console();

    void init();

    static void putc(char c);

    static char getc();

    static Console& getInstance();

    static void outputHandler();

    static void inputHandler();

private:

    static Console* instance;
    
    sem_t inSem;

    struct consoleBuffer{
    public:
        consoleBuffer(): head(0), tail(0), size(0){}
        
        void put(char);
        char get();
        bool isEmpty();
        bool isFull();
    private:
        char buffer[BUFFER_SIZE];
        size_t head;
        size_t tail;
        size_t size;
    } inBuffer, outBuffer;
};

#endif // CONSOLE_H