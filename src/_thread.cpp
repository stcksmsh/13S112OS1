#include "../h/_thread.h"


_thread::~_thread(){
    MemoryAllocator::getInstance().mem_free(stack_space);
}

bool _thread::isFinished() const{
    return finished;
}

int _thread::create( thread_t* handle, func start_routine, void*  arg, uint64* stack_space){
    _thread *newThread = (_thread*)MemoryAllocator::getInstance().mem_alloc((sizeof(_thread)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    newThread->start_routine = start_routine;
    newThread->arg = arg;
    if(newThread == nullptr || start_routine == nullptr)stack_space = nullptr;
    newThread->stack_space = stack_space;
    newThread->blocked = newThread->closed = newThread->finished = false;
    newThread->context = _thread::contextWrapper{(uint64) &wrapper,\
    stack_space!=nullptr?(uint64)stack_space[DEFAULT_STACK_SIZE]:0};
    *handle = newThread;
    
    return 0;
}

void _thread::wrapper(){
    running->start_routine(running->arg);
    exit();
}

int _thread::exit(){
    running->setFinished(true);
    dispatch();
}