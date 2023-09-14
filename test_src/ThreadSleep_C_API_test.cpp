#include "../h/syscall_c.h"

#include "../test_h/printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    time_t sleep_time = *((time_t *) arg);
    putc('\n');
    printInt(sleep_time);
    putc('\n');
    int i = 6;
    while (--i > 0) {

        printString("Hello ");
        printInt(sleep_time);
        printString(" !\n");
        thread_sleep(sleep_time);
    }
    finished[sleep_time/10-1] = true;
}

void testSleeping() {
    printString("Starting...\n");
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    thread_t sleepyThread[sleepy_thread_count];

    printString("Creating threads: ");
    for (int i = 0; i < sleepy_thread_count; i++) {
        printInt(i);
        printString(" ");
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    }
    printString("\nSuccesfully created all threads, now waiting for them to end");
    while (!(finished[0] && finished[1])) {}
}
