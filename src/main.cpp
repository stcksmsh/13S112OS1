/**
 * @file main.cpp
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief initialisation of the kernel
 * @version 0.1
 * @date 2023-12-31
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "kernel.h"
#include "assert.h"
#include "syscalls_c.h"
#include "console.h"

/// @brief first function to be called
void main(){
    Kernel kernel = Kernel();
    kernel.initialise();
    Kernel::EXIT_CODE exitCode = kernel.run();
    putc('\n');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('-');
    putc('\n');
    putc('\n');
    putc('K');
    putc('e');
    putc('r');
    putc('n');
    putc('e');
    putc('l');
    putc(' ');
    putc('e');
    putc('x');
    putc('i');
    putc('t');
    putc('e');
    putc('d');
    putc(' ');
    putc('w');
    putc('i');
    putc('t');
    putc('h');
    putc(' ');
    putc('c');
    putc('o');
    putc('d');
    putc('e');
    putc(':');
    switch(exitCode){
        case Kernel::EXIT_SUCCESS:
            putc('0');
            break;
        case Kernel::EXIT_FAILURE:
            putc('1');
            break;
        default:
            putc('2');
            break;
    }
    putc('\n');
    Console::outputHandler();
    assert(exitCode == Kernel::EXIT_SUCCESS);
}