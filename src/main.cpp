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

/// @brief first function to be called
void main(){
    Kernel kernel = Kernel();
    kernel.initialise();
    Kernel::EXIT_CODE exitCode = kernel.run();
    if(exitCode == Kernel::EXIT_FAILURE){
        while(1){} /// infinite loop
    }
}