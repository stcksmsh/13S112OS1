#ifndef CONSOLEHEADERFILE
#define CONSOLEHEADERFILE

#include "syscall_c.hpp"

#define BUFFER_SIZE 100

class Console{
    char* outBuffer;
    int outBufferIndex;
    
    char* inBuffer;
    int inBufferIndex; 
public:

    
    static void console_handler();
    
    static char read();

    static void write(char);
};

#endif