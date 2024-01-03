/**
 * @file kernel.h
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief the kernel class
 * @version 0.1
 * @date 2023-12-31
 * 
 * @copyright Copyright (c) 2023
 * 
 */
#ifndef KERNEL_H
#define KERNEL_H

#include "types.h"
#include "attributes.h"
#include "heapManager.h"
#include "sched.h"
#include "timer.h"

class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
        /// @brief exit codes
        enum EXIT_CODE{
            EXIT_SUCCESS,
            EXIT_FAILURE
        };
        /// @brief runs the kernel
        EXIT_CODE run();
        /// @brief initialises the kernel
        void initialise();
    private:
        /// @brief the heap manager
        HeapManager heapManager;
        /// @brief the scheduler
        Scheduler scheduler;
        /// @brief the timer
        Timer timer;
};

#endif // KERNEL_H