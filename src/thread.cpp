#include "../h/thread.h"
#include "../lib/console.h"

thread_t thread::running = nullptr;
time_t thread::time = 0;
thread::sleepList *thread::sleepHead = nullptr;

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
    if(joinTail == nullptr){
        joinHead = joinTail = node;
    }else{
        joinTail->next = node;
        joinTail = node;
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
    newThread->joinHead = newThread->joinTail = nullptr;
    *handle = newThread;
    Scheduler::put(newThread);
    if(start_routine == nullptr)
        newThread->context.pc = 0;
    return 0;
}

void thread::wrapper(){
    running->start_routine(running->arg);
    exit();
}

int thread::exit(){
    running->setFinished(true);
    thread::joinList *previous = nullptr;
    while(running->joinHead != nullptr){
        
        previous = running->joinHead;
        running->joinHead = previous->next;

        previous->handle->setBlocked(false);
        Scheduler::put(previous->handle);
        // MemoryAllocator::getInstance().mem_free(previous);
    }
    // MemoryAllocator::getInstance().mem_free(running->stack_space);
    dispatch();
    return 0;
}

int thread::sleep(time_t duration){
    if(running == nullptr)return -1;
    running->sleeping = true;
    sleepList *node = (sleepList*)MemoryAllocator::getInstance().mem_alloc((sizeof(sleepList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    node->handle = running;
    node->wakeTime = time + duration;
    __putc('\n');
    __putc('0' + node->wakeTime/100);
    __putc('0' + node->wakeTime/10);
    __putc('0' + node->wakeTime/100);
    sleepList *insertAfter = sleepHead;
    while(insertAfter && insertAfter->next && insertAfter->next->wakeTime <= node->wakeTime){
        insertAfter = insertAfter->next;
    }
    if(insertAfter == nullptr){
        sleepHead = node;
        node -> next = nullptr;
    }else if(insertAfter->next == nullptr){
        insertAfter->next = node;
        node->next = nullptr;
    }else{
        node->next = insertAfter->next;
        insertAfter->next = node;
    }
    dispatch();
    return 0;
}

void thread::wake(){
    if(sleepHead == nullptr || sleepHead->wakeTime < time)
        return;
    while(sleepHead != nullptr && sleepHead->wakeTime >= time){
        sleepHead->handle->sleeping = false;
        Scheduler::put(sleepHead->handle);
        // sleepList *node = sleepHead;
        sleepHead = sleepHead->next;
        // MemoryAllocator::getInstance().mem_free(node);
    }
}

void thread::dispatch(){
    thread_t oldThread = running;
    if(Scheduler::isEmpty())return;
    if(oldThread!=nullptr && !oldThread->finished && !oldThread->blocked && !oldThread->sleeping)Scheduler::put(running);
    running->timeLeftToRun = DEFAULT_TIME_SLICE;
    running = Scheduler::get();
    if(running->start_routine == nullptr){
        thread_t newThread = Scheduler::get();
        Scheduler::put(running);
        running = newThread;
    }

    switchContext(oldThread==nullptr?nullptr:&(oldThread->context), &(running->context));
    return;
}

// void thread::dispatch(){
//     thread_t oldThread = running;
//     if(oldThread!=nullptr && oldThread->start_routine!=nullptr && !oldThread->finished && !oldThread->blocked && !oldThread->sleeping)Scheduler::put(running);
//     running->timeLeftToRun = DEFAULT_TIME_SLICE;
//     running = Scheduler::get();
    // if(running->start_routine == nullptr){ /// the running thread the void main() thread
    //     thread_t newThread = nullptr;
    //     do{/// if there are no more threads in scheduler, and sleeping ones exist, loop until one wakes, and then replace running with it
    //         thread_t newThread = Scheduler::get();
    //         if(newThread != nullptr){
    //             Scheduler::put(running);
    //             running = newThread;
    //         }else if(sleepHead == nullptr){ /// there are no sleeping threads, we may exit to MAIN
    //             break;
    //         }
    //     }while (newThread == nullptr);
    // }
//     switchContext(oldThread==nullptr?nullptr:&(oldThread->context), &(running->context));
//     return;
// }

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
