/**
 * @file assert.cpp
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief implementation of the assert_failed function
 * @version 0.1
 * @date 2024-01-01
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char* file, int line ){
    putc('\n');
    putc('A');
    putc('s');
    putc('s');
    putc('e');
    putc('r');
    putc('t');
    putc('i');
    putc('o');
    putc('n');
    putc(' ');
    putc('f');
    putc('a');
    putc('i');
    putc('l');
    putc('e');
    putc('d');
    putc(' ');
    putc('i');
    putc('n');
    putc(' ');
    putc('f');
    putc('i');
    putc('l');
    putc('e');
    putc(':');
    putc(' ');
    while(*file != 0){
        putc(*file);
        file++;
    }
    putc('\n');
    putc('l');
    putc('i');
    putc('n');
    putc('e');
    putc(':');
    putc(' ');
    char buffer[20];
    int i = 0;
    while(line != 0){
        buffer[i] = line % 10 + '0';
        line /= 10;
        i++;
    }
    while(i != 0){
        i--;
        putc(buffer[i]);
    }
    putc('\n');
    while(1);

}
