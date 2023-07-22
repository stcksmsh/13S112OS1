#include "../h/scheduler.hpp"

Scheduler::Element* Scheduler::head = nullptr;
Scheduler::Element* Scheduler::tail = nullptr;
thread_t Scheduler::out = nullptr;
thread_t Scheduler::main = nullptr;

void Scheduler::put(thread_t thread){
    if(tail == nullptr){
        head = tail = (Element*)mem_alloc(sizeof(Element));
        head->next = nullptr;
        head->thread = thread;
    }else{
        tail = tail->next = (Element*)mem_alloc(sizeof(Element));
        tail->next = nullptr;
        tail->thread = thread;
    }
}

void Scheduler::setCore(thread_t o, thread_t m){
    out = o;
    main = m;
}

thread_t Scheduler::get(){
    if(head == nullptr) return nullptr;
    Scheduler::Element* element = head;
    thread_t thread = element->thread;
    head = head->next;
    if(head == nullptr) tail = nullptr;
    mem_free(element);
    return thread;
}

bool Scheduler::isEmpty(){
    Element* elem = head;
    int cnt = 0;
    while(elem != nullptr && cnt < 2){
        cnt ++;
        elem = elem->next;
    }
    return cnt < 2;
}

void Scheduler::printCount(){
    Element* elem = head;
    int cnt = 0;
    while(elem != nullptr){
        cnt ++;
        elem = elem->next;
    }
    __putc('\n');
    do{
        __putc('0' + cnt%10);
        cnt /= 10;
    }while(cnt > 0);
}