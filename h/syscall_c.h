#ifndef SYSCALLCHEADERFILE
#define SYSCALLCHEADERFILE

#include "../lib/hw.h"
#include "../lib/console.h"

void* mem_alloc ( size_t );

int mem_free ( void* );


class thread;
typedef thread* thread_t;

int thread_create ( thread_t*, void(*)(void*), void* );

int thread_exit ();

void thread_dispatch ();

void thread_join ( thread_t );

int thread_sleep( time_t );



class sem;
typedef sem* sem_t;

int sem_open ( sem_t*, unsigned );

int sem_close ( sem_t );

int sem_wait ( sem_t );

int sem_signal ( sem_t );


char getc();

void putc( char );


void changeUser();
#endif