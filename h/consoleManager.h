/**
 * @file consoleManager.h
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

#define BUFFER_SIZE 512

class ConsoleManager{
public:

    ConsoleManager();

    ~ConsoleManager();

    void init();

    static void putc(char c);

    static char getc();

    static ConsoleManager& getInstance();

    static void outputHandler();

    static void inputHandler();

    static bool finished();

private:

    static ConsoleManager* instance;
    
    struct consoleBuffer{
    public:
        consoleBuffer(): head(0), tail(0), size(0){}
        ~consoleBuffer();
        void init();
        void put(char);
        char get();
        bool isEmpty();
        bool isFull();
    private:
        sem_t sem;
        char buffer[BUFFER_SIZE];
        size_t head;
        size_t tail;
        size_t size;
    } inBuffer, outBuffer;

    int waitingThreads;
};

#endif // CONSOLE_H