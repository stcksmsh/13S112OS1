#include "../h/thread.h"
#include "../lib/console.h"

thread_t thread::running = nullptr;

thread::~thread(){
    MemoryAllocator::getInstance().mem_free(stack_space);
}

void thread::setBlocked(bool blocked){
    this->blocked = blocked;
}

bool thread::live(){
    timeLeftToRun = timeLeftToRun - 1;
    return timeLeftToRun > 0;
}

void thread::setFinished(bool finished){
    this->finished = finished;
}

void thread::setClosed(bool closed){
    this->closed = closed;
}

bool thread::wasClosed(){
    return closed;
}

void thread::joinTo(){/// thread1.join() is the same as invoking thread_join(thread1)
    joinList *node = (joinList*)MemoryAllocator::getInstance().mem_alloc((sizeof(joinList) + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE);
    node->handle = running;
    node->next = nullptr;
    if(tail == nullptr){
        head = tail = node;
    }else{
        tail->next = node;
        tail = node;
    }
    running->setBlocked(true);
    dispatch();
}

int thread::create( thread_t* handle, func start_routine, void*  arg, void* stack_space){
    thread_t newThread = (thread_t)MemoryAllocator::getInstance().mem_alloc((sizeof(thread)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    newThread->start_routine = start_routine;
    newThread->arg = arg;
    if(newThread == nullptr || start_routine == nullptr)stack_space = nullptr;
    newThread->stack_space = (uint64*)stack_space;
    newThread->timeLeftToRun = DEFAULT_TIME_SLICE;
    newThread->blocked = newThread->closed = newThread->finished = newThread->sleeping =false;
    newThread->context.pc = (uint64)wrapper;
    newThread->context.sp = (newThread->stack_space!=0?(uint64)newThread->stack_space + DEFAULT_STACK_SIZE:0);
    newThread->head = newThread->tail = nullptr;
    *handle = newThread;
    Scheduler::put(newThread);
    if(start_routine == nullptr)
        newThread->context.pc = 0;
    return 0;
}

int thread::sleep(time_t duration){
    // sleeping = true;
    // timeLeftToSleep = duration;
    // dispatch();
}

void thread::wrapper(){
    running->start_routine(running->arg);
    exit();
}

int thread::exit(){
    running->setFinished(true);
    thread::joinList *previous = nullptr;
    while(running->head != nullptr){
        
        previous = running->head;
        running->head = previous->next;

        previous->handle->setBlocked(false);
        Scheduler::put(previous->handle);
        // MemoryAllocator::getInstance().mem_free(previous);
    }
    // MemoryAllocator::getInstance().mem_free(running->stack_space);
    dispatch();
    return 0;
}


void thread::dispatch(){
    thread_t oldThread = running;
    if(oldThread!=nullptr && !oldThread->finished && !oldThread->blocked && !oldThread->sleeping)Scheduler::put(running);
    running->timeLeftToRun = DEFAULT_TIME_SLICE;
    running = Scheduler::get();
    switchContext(oldThread==nullptr?nullptr:&(oldThread->context), &(running->context));
    return;
}

void thread::switchContext(contextWrapper *oldContext, contextWrapper *newContext){
    if(oldContext != nullptr){
    // oldContext->pc = pc;
    __asm__ volatile ("sd ra, 0 * 8(a0)");
    __asm__ volatile ("sd sp, 1 * 8(a0)");

    __asm__ volatile ("sd s0, 2 * 8(a0)");
    __asm__ volatile ("sd s1, 3 * 8(a0)");
    __asm__ volatile ("sd s2, 4 * 8(a0)");
    __asm__ volatile ("sd s3, 5 * 8(a0)");
    __asm__ volatile ("sd s4, 6 * 8(a0)");
    __asm__ volatile ("sd s5, 7 * 8(a0)");
    __asm__ volatile ("sd s6, 8 * 8(a0)");
    __asm__ volatile ("sd s7, 9 * 8(a0)");
    __asm__ volatile ("sd s8, 10 * 8(a0)");
    __asm__ volatile ("sd s9, 11 * 8(a0)");
    __asm__ volatile ("sd s10, 12 * 8(a0)");
    __asm__ volatile ("sd s11, 13 * 8(a0)");
    }
    if(newContext->sp != 0)
        __asm__ volatile ("ld sp, 8(a1)");
    __asm__ volatile ("ld ra, 0(a1)");
    __asm__ volatile ("ld s0, 2 * 8(a1)");
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    return;
}
