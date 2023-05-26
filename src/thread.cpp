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
    newThread->context.pc = (uint64)thread::wrapper;
    newThread->context.sp = (uint64)(newThread->stack_space!=nullptr?newThread->stack_space[DEFAULT_STACK_SIZE]:0);
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
    return 0;
}

void thread::dispatch(uint64 ar){
    thread_t oldThread = running;
    if(running!=nullptr && running->finished && running->blocked)Scheduler::put(running);
    running = Scheduler::get();
    switchContext(oldThread==nullptr?nullptr:&(oldThread->context), &(running->context), ar);
}

void thread::switchContext(contextWrapper *oldContext, contextWrapper *newContext, uint64 ar){
    /*
        sd ra, 0 * 8(a0)
        sd sp, 1 * 8(a0)

        ld ra, 0 * 8(a1)
        ld sp, 1 * 8(a1)
    */

   oldContext->pc = ar;
   __asm__ volatile ("mv %0, sp" : "=r"(oldContext->sp));
    if(newContext == nullptr){__putc('X');}
   __asm__ volatile ("mv ra, %0" :: "r"(newContext->pc));
    __putc('e');
    __putc('n');
    __putc('d');
    __putc('\n');
   __asm__ volatile ("mv sp, %0" :: "r"(newContext->sp));
    return;
}
