#include "../h/thread.h"
#include "../lib/console.h"

thread_t thread::running = nullptr;

thread::~thread(){
    MemoryAllocator::getInstance().mem_free(stack_space);
}

int thread::create( thread_t* handle, func start_routine, void*  arg, void* stack_space){
    thread_t newThread = (thread_t)MemoryAllocator::getInstance().mem_alloc((sizeof(thread)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    newThread->start_routine = start_routine;
    newThread->arg = arg;
    if(newThread == nullptr || start_routine == nullptr)stack_space = nullptr;
    newThread->stack_space = (uint64*)stack_space;
    newThread->blocked = newThread->closed = newThread->finished = false;
    newThread->context.pc = (uint64)wrapper;
    newThread->context.sp = (newThread->stack_space!=0?(uint64)newThread->stack_space + DEFAULT_STACK_SIZE:0);
    for(int i = 0;i < 12;i ++)newThread->context.s[i] = 0;
    *handle = newThread;
    Scheduler::put(newThread);
    return 0;
}

void thread::wrapper(){
    running->start_routine(running->arg);
    exit();
}

int thread::exit(){
    running->finished = true;
    // MemoryAllocator::getInstance().mem_free(running->stack_space);
    dispatch();
    return 0;
}

void thread::dispatch(){
    thread_t oldThread = running;
    if(oldThread!=nullptr && !oldThread->finished && !oldThread->blocked)Scheduler::put(running);
    running = Scheduler::get();
    switchContext(oldThread==nullptr?nullptr:&(oldThread->context), &(running->context));
    return;
}

void thread::switchContext(contextWrapper *oldContext, contextWrapper *newContext){
    /*
        sd ra, 0 * 8(a0)
        sd sp, 1 * 8(a0)

        ld ra, 0 * 8(a1)
        ld sp, 1 * 8(a1)
    */
    if(oldContext != nullptr){
    // oldContext->pc = pc;
    __asm__ volatile ("sd sp, 8(a0)");
    __asm__ volatile ("sd ra, 0(a0)");
    // __asm__ volatile("mv %0, s0" : "=r"(oldContext->s[0]));
    // __asm__ volatile("mv %0, s1" : "=r"(oldContext->s[1]));
    // __asm__ volatile("mv %0, s2" : "=r"(oldContext->s[2]));
    // __asm__ volatile("mv %0, s3" : "=r"(oldContext->s[3]));
    // __asm__ volatile("mv %0, s4" : "=r"(oldContext->s[4]));
    // __asm__ volatile("mv %0, s5" : "=r"(oldContext->s[5]));
    // __asm__ volatile("mv %0, s6" : "=r"(oldContext->s[6]));
    // __asm__ volatile("mv %0, s7" : "=r"(oldContext->s[7]));
    // __asm__ volatile("mv %0, s8" : "=r"(oldContext->s[8]));
    // __asm__ volatile("mv %0, s9" : "=r"(oldContext->s[9]));
    // __asm__ volatile("mv %0, s10" : "=r"(oldContext->s[10]));
    // __asm__ volatile("mv %0, s11" : "=r"(oldContext->s[11]));
    }
    __asm__ volatile ("ld sp, 8(a1)");
    __asm__ volatile ("ld ra, 0(a1)");
    // __asm__ volatile("mv s0, %0" :: "r"(oldContext->s[0]));
    // __asm__ volatile("mv s1, %0" :: "r"(oldContext->s[1]));
    // __asm__ volatile("mv s2, %0" :: "r"(oldContext->s[2]));
    // __asm__ volatile("mv s3, %0" :: "r"(oldContext->s[3]));
    // __asm__ volatile("mv s4, %0" :: "r"(oldContext->s[4]));
    // __asm__ volatile("mv s5, %0" :: "r"(oldContext->s[5]));
    // __asm__ volatile("mv s6, %0" :: "r"(oldContext->s[6]));
    // __asm__ volatile("mv s7, %0" :: "r"(oldContext->s[7]));
    // __asm__ volatile("mv s8, %0" :: "r"(oldContext->s[8]));
    // __asm__ volatile("mv s9, %0" :: "r"(oldContext->s[9]));
    // __asm__ volatile("mv s1, %0" :: "r"(oldContext->s[10]));
    // __asm__ volatile("mv s1, %0" :: "r"(oldContext->s[11]));
    return;
}
