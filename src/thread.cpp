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
    *handle = newThread;
    Scheduler::put(newThread);
    return 0;
}

void thread::wrapper(){
    __putc('w');
    running->start_routine(running->arg);
    exit();
}

int thread::exit(){
    running->finished = true;
    dispatch(0);
    return 0;
}

void thread::dispatch(uint64 ar){
    thread_t oldThread = running;
    if(running!=nullptr && running->finished && running->blocked)Scheduler::put(running);
    running = Scheduler::get();
    __putc('d');
    switchContext(oldThread==nullptr?nullptr:&(oldThread->context), &(running->context), ar);
}

void thread::switchContext(contextWrapper *oldContext, contextWrapper *newContext, uint64 ar){
    /*
        sd ra, 0 * 8(a0)
        sd sp, 1 * 8(a0)

        ld ra, 0 * 8(a1)
        ld sp, 1 * 8(a1)
    */
    if(oldContext != nullptr){
    oldContext->pc = ar;
    // __asm__ volatile ("mv %0, sp" : "=r"(oldContext->sp));
    }
    if(newContext == nullptr){__putc('X');}
    // __asm__ volatile ("mv sp, %0" :: "r"(newContext->sp));
    __asm__ volatile ("ld ra, 0(a1)");
    return;
}
