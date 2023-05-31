#include "../h/scheduler.hpp"

Scheduler::Element* Scheduler::head = nullptr;
Scheduler::Element* Scheduler::tail = nullptr;

int mem_free(void*);
void* mem_alloc(size_t);

void Scheduler::put(thread_t thread){
    if(tail == nullptr){
        head = tail = (Element*)mem_alloc(sizeof(Element));
        head->next = nullptr;
        head->thread = thread;
        return;
    }
    tail = tail->next = (Element*)mem_alloc(sizeof(Element));
    tail->next = nullptr;
    tail->thread = thread;
}

thread_t Scheduler::get(){
    if(head == nullptr) return nullptr;
    Scheduler::Element* element = head;
    thread_t thread = element->thread;
    head = head->next;
    if(head == nullptr) tail = nullptr;
    // mem_free(element);
    return thread;
}

bool Scheduler::isEmpty(){
    return head==nullptr;
}