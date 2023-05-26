#ifndef CONSOLEHEADERFILE
#define CONSOLEHEADERFILE

#include "../lib/hw.h"
#include "../lib/console.h"

void printf(char* text){
    while(*text!='\0'){
        __putc(text[0]);
        text++;
    }
}

#endif