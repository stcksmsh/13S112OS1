#ifndef _syscall_cpp
#define _syscall_cpp
#include "syscall_c.h"

void* operator new(size_t);
void operator delete(void*);

void *operator new[](size_t);
void operator delete[](void*);

class Thread
{
 	friend void cppThreadWrapper(void*);
 public:
	Thread(void (* body)(void*), void* arg);
	virtual ~Thread();
	int start();
	void join();
	static void dispatch();
	static int sleep(time_t);
 protected:
	Thread();
	virtual void run(){}
 private:
	thread_t myHandle;
	void (* body)(void*);
	void* arg;
};

class Semaphore
{
 public:
	Semaphore(unsigned init = 1);
	virtual ~Semaphore();
	int wait();
	int signal();
 private:
	sem_t myHandle;
};

class PeriodicThread : public Thread
{
 public:
	void terminate();
 protected:
	PeriodicThread(time_t period);
	void run() override;
	virtual void periodicActivation(){}
 private:
	time_t period;
	bool active;
};
class Console
{
 public:
	static char getc();
	static void putc(char);
};
#endif