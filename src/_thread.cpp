#include "../h/_thread.h"
#include "../lib/console.h"

thread_t _thread::running = nullptr;

_thread::~_thread(){
    MemoryAllocator::getInstance().mem_free(stack_space);
}

int _thread::create( thread_t* handle, func start_routine, void*  arg, void* stack_space){
    _thread *newThread = (_thread*)MemoryAllocator::getInstance().mem_alloc((sizeof(_thread)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    newThread->start_routine = start_routine;
    newThread->arg = arg;
    if(newThread == nullptr || start_routine == nullptr)stack_space = nullptr;
    newThread->stack_space = (uint64*)stack_space;
    newThread->blocked = newThread->closed = newThread->finished = false;
    newThread->context.pc = (uint64) wrapper;
    newThread->context.sp = (uint64)(newThread->stack_space!=nullptr?newThread->stack_space[DEFAULT_STACK_SIZE]:0);
    *handle = newThread;
    Scheduler::put(newThread);
    return 0;
}

void _thread::wrapper(){
    running->start_routine(running->arg);
    exit();
}

int _thread::exit(){
    running->finished = true;
    dispatch();
    return 0;
}

void _thread::dispatch(){
    __putc('s');
    if(running->finished && running->blocked)Scheduler::put(running);
    thread_t oldThread = running;
    running = Scheduler::get();
    switchContext(oldThread==nullptr?contextWrapper():oldThread->context, running->context);
}