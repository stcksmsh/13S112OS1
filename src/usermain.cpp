#include "../h/console.h"
#include "../h/syscall_c.hpp"

void usermain(){
    char* s = (char*)mem_alloc(13);
    s[0] = 'H';
    s[1] = 'e';
    s[2] = 'l';
    s[3] = 'l';
    s[4] = 'o';
    s[5] = ' ';
    s[6] = 'w';
    s[7] = 'o';
    s[8] = 'r';
    s[9] = 'l';
    s[10] = 'd';
    s[11] = '!';
    s[11] = '\n';
    printf(s);
}