#pragma once
#include "tcb.hpp"
struct Blocked{
    TCB* thread;
    Blocked* next=nullptr;
};

class Sem {
    int init;

    friend class Riscv;

    Blocked* head;
    Blocked* tail;

    TCB* getThread();

    void puThread(TCB* thread);

    static Sem* createSem(unsigned init);
public:
    static void openSem(Sem** handle,unsigned init);

    static int closeSem(Sem* handle);

    static int semWait(Sem* handle);

    static int semSignal(Sem* handle);



};


 //VASKOZABATA_SEM_H
