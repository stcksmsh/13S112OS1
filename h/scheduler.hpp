#pragma once


class TCB;
struct Elem
{
    TCB *data;
    Elem *next;

};

class Scheduler
{
private:
    static Elem* head;
    static Elem* tail;
public:
    static TCB *get();

    static void put(TCB *ccb);

};


 //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_SCHEDULER_HPP
