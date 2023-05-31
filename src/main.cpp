#include "../h/syscall_c.hpp"
#include "../h/thread.h"
#include "../h/memoryAllocator.h"
#include "../h/usermain.h"
#include "../lib/console.h"
extern "C" void trap();

void usermainWrapper(void* arg){
    usermain();
}


void main(){
    __asm__ volatile ("csrw stvec, %0" : :  "r"(&trap)); // sets the syscall routine
    changeUser();
    thread_t handle;
    thread_create(&handle, nullptr, nullptr);// <----------------------7
    thread_create(&handle, usermainWrapper, nullptr);//               /
    thread::running = Scheduler::get(); // the nullptr nullptr one --/
    while((thread::sleepHead != nullptr) || (!Scheduler::isEmpty())){
        thread_dispatch();
    }
    uint64 t = thread::time;
    __putc('0' + t/1000);
    __putc('0' + (t/100)%10);
    __putc('0' + (t/10)%10);
    __putc('0' + t%10);

}