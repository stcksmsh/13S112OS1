#ifndef CONSOLEHEADERFILE
#define CONSOLEHEADERFILE

#include "syscall_c.hpp"
#include "memoryAllocator.hpp"

#define BUFFER_SIZE 100

class Console{
    char* outBuffer = nullptr;
    int outBufferIndex = -1;
    
    char* inBuffer = nullptr;
    int inBufferIndex = -1; 
public:

    static Console* getIntance();
    
    static void console_handler();
    
    static char read();

    static void write(char);
};

#endif