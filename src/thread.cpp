#include "../h/thread.hpp"
#include "../h/ABI.hpp"

thread_t thread::running = nullptr;

threadSleepHandler& threadSleepHandler::getInstance(){
    static threadSleepHandler instance;
    return instance;
}

bool threadSleepHandler::allAwake(){
    return (threadSleepHandler::getInstance().sleepHead==nullptr);
}


int threadSleepHandler::sleep(time_t duration){
    sleepList *node = (sleepList*)mem_alloc(sizeof(sleepList));
    node->handle = thread::running;
    node->wakeTime = duration;
    node->next = nullptr;
    sleepList *insertAfter = getInstance().sleepHead;
    if(insertAfter == nullptr){
        putc('X');
        getInstance().sleepHead = node;
    }else if(insertAfter->wakeTime > node->wakeTime){
        getInstance().sleepHead = node;
        node->next = insertAfter;
    }else{
        while(insertAfter != nullptr && insertAfter->next != nullptr && insertAfter->wakeTime + insertAfter->next->wakeTime >= node->wakeTime){
            node->wakeTime -= insertAfter->wakeTime;
            insertAfter = insertAfter->next;
        }
        node->next = insertAfter->next;
        insertAfter->next = node;
        node->wakeTime -= insertAfter->wakeTime;
        if(node->next)node->next->wakeTime -= node->wakeTime;
    }
    node->handle->sleeping = true;
    thread::dispatch();
    return 0;
}

void threadSleepHandler::sleepDecrement(){
    sleepList *node = getInstance().sleepHead;
    if(node)node->wakeTime--;
}

void threadSleepHandler::wake(){
    sleepList *head = getInstance().sleepHead;
    if(head)putc('.');
    while(head && head->wakeTime == 0){
        sleepList *tmp = head;
        head = head->next;
        mem_free(tmp);
    }
    getInstance().sleepHead = head;
}

thread::~thread(){
    mem_free(stack_space);
}

void thread::setBlocked(bool blocked){
    this->blocked = blocked;
}

bool thread::live(){
    return (--timeLeftToRun) > 0;
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

void thread::joinTo(){/// thread1.joinTo() is the same as invoking thread_join(thread1)w
    if(finished || closed) return; /// cannot join to a thread that exited, or was closed
    joinList *node = (joinList*)mem_alloc(sizeof(joinList));
    node->handle = running;
    node->next = nullptr;
    if(joinTail == nullptr){
        joinHead = node;
        joinTail = node;
    }else{
        joinTail->next = node;
        joinTail = node;
    }
    running->blocked = true;
    dispatch();
}

int thread::create( thread_t* handle, func start_routine, void*  arg, void* stack_space){
    *handle = (thread_t)MemoryAllocator::getInstance().mem_alloc((sizeof(thread)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    thread_t newThread = *handle;
    newThread->start_routine = start_routine;
    newThread->arg = arg;
    if(newThread == nullptr || start_routine == nullptr)stack_space = nullptr;
    newThread->stack_space = (uint64*)stack_space;
    newThread->timeLeftToRun = DEFAULT_TIME_SLICE;
    newThread->blocked = false;
    newThread->closed = false;
    newThread->finished = false;
    newThread->sleeping =false;
    newThread->context.pc = (uint64)wrapper;
    newThread->body = start_routine;
    newThread->context.sp = (newThread->stack_space!=0?(uint64)newThread->stack_space + DEFAULT_STACK_SIZE:0);
    newThread->joinHead = nullptr;
    newThread->joinTail = nullptr;
    Scheduler::put(newThread);
    if(start_routine == nullptr)
        newThread->context.pc = 0;
    *handle = newThread;
    return 0;
}

void thread::wrapper(){
    ABI::popSppSpie();
    running->start_routine(running->arg);
    running->finished = true;
    thread::joinList *previous = nullptr;
    while(running->joinHead != nullptr){
        previous = running->joinHead;
        running->joinHead = running->joinHead->next;
        if(!running->closed){
            previous->handle->blocked = false;
            Scheduler::put(previous->handle);
        }
        mem_free(previous);
    }
    mem_free(running->stack_space);
    __asm__ volatile ("ecall");
}

int thread::exit(){
    running->finished = true;
    thread::joinList *previous = nullptr;
    while(running->joinHead != nullptr){
        previous = running->joinHead;
        running->joinHead = running->joinHead->next;
        if(!running->closed){
            previous->handle->blocked = false;
            Scheduler::put(previous->handle);
        }
        mem_free(previous);
    }
    mem_free(running->stack_space);
    return 0;
}

void thread::dispatch(){
    thread_t oldThread = running;
    if(Scheduler::isEmpty())return;
    if(oldThread!=nullptr && !oldThread->closed && !oldThread->finished && !oldThread->blocked && !oldThread->sleeping){
        Scheduler::put(oldThread);
    }
    if(oldThread != nullptr)oldThread->timeLeftToRun = DEFAULT_TIME_SLICE;
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
    __asm__ volatile ("sd s11, 13 * 8(a0)");
    
    __asm__ volatile("csrr s0, sstatus");
    __asm__ volatile ("sd s0, 14 * 8(a0)");
    }
    if(newContext->sp != 0)
    __asm__ volatile ("ld sp, 8(a1)");
    __asm__ volatile ("ld ra, 0(a1)");

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    __asm__ volatile("csrw sstatus, s0");

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
