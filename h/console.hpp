#ifndef CONSOLEHEADERFILE
#define CONSOLEHEADERFILE

#include "syscall_c.h"
#include "memoryAllocator.hpp"

#define BUFFER_SIZE 100

const int EOF = -1;
class Console{
public:
    class consoleBuffer{
        char *buff;
        int first, last, size;
    public:
        consoleBuffer(int);
        void put(char);
        char get();
        bool isEmpty();
        bool isFull();
    };
    Console();

    static Console* getInstance();
    
    static void console_handler();

    static void outThread(void* arg);
    
    static char read();

    static void stop();

    static void write(char);

    static bool noWait();
private:
    int getcWaitCount;
    sem_t readSem;
    bool running;
    consoleBuffer inBuffer, outBuffer;
};

#endif