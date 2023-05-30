#ifndef CONSOLEHEADERFILE
#define CONSOLEHEADERFILE

#include "syscall_c.hpp"

#define BUFFER_SIZE 100

class Console{
    static char* outBuffer;
    static int outBufferIndex;
    
    static char* inBuffer;
    static int inBufferIndex; 
public:
    static void console_handler();
    
    static char read();

    static void write(char);
};

#endif