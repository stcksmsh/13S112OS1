#ifndef CONSOLEHEADERFILE
#define CONSOLEHEADERFILE

#include "syscall_c.hpp"

#define BUFFER_SIZE 100

class Console{
    char* outBuffer = (char*)mem_alloc(sizeof(char)*BUFFER_SIZE);
    int outBufferIndex = -1;
    
    char* inBuffer = (char*)mem_alloc(sizeof(char)*BUFFER_SIZE);
    int inBufferIndex = -1; 
public:

    static Console* getIntance();
    
    static void console_handler();
    
    static char read();

    static void write(char);
};

#endif