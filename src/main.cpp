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

/// @brief first function to be called
void main(){
    Kernel kernel = Kernel();
    kernel.initialise();
    Kernel::EXIT_CODE exitCode = kernel.run();
    assert(exitCode == Kernel::EXIT_SUCCESS);
}