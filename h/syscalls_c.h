/**
 * @file syscalls_c.h
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief function declarations for the syscalls
 * @version 0.1
 * @date 2024-01-01
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#ifndef SYSCALLC_H
#define SYSCALLC_H

#include "types.h"


void* mem_alloc ( size_t nSize );

int mem_free ( void* pAddress );


class _thread;
typedef _thread* thread_t;

int thread_create ( thread_t*, void(*)(void*), void* );

// int thread_createCPP ( thread_t*, void(*)(void*), void* );

int thread_exit ();

void thread_dispatch ();

// void thread_join ( thread_t );

int thread_sleep( time_t );

// void testUser();

class _sem;
typedef _sem* sem_t;

int sem_open ( sem_t*, unsigned );

int sem_close ( sem_t );

int sem_wait ( sem_t );

int sem_signal ( sem_t );

char getc();

void putc( char chr );

#endif // SYSCALLC_H