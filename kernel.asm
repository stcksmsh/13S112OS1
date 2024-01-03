
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	d3013103          	ld	sp,-720(sp) # 80006d30 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	5f1030ef          	jal	ra,80003e0c <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <trap>:
.global trap
.align 4

trap:

    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00113423          	sd	ra,8(sp)
    80001008:	00213823          	sd	sp,16(sp)
    8000100c:	00313c23          	sd	gp,24(sp)
    80001010:	02413023          	sd	tp,32(sp)
    80001014:	02513423          	sd	t0,40(sp)
    80001018:	02613823          	sd	t1,48(sp)
    8000101c:	02713c23          	sd	t2,56(sp)
    80001020:	04813023          	sd	s0,64(sp)
    80001024:	04913423          	sd	s1,72(sp)
    80001028:	04b13c23          	sd	a1,88(sp)
    8000102c:	06c13023          	sd	a2,96(sp)
    80001030:	06d13423          	sd	a3,104(sp)
    80001034:	06e13823          	sd	a4,112(sp)
    80001038:	06f13c23          	sd	a5,120(sp)
    8000103c:	09013023          	sd	a6,128(sp)
    80001040:	09113423          	sd	a7,136(sp)
    80001044:	09213823          	sd	s2,144(sp)
    80001048:	09313c23          	sd	s3,152(sp)
    8000104c:	0b413023          	sd	s4,160(sp)
    80001050:	0b513423          	sd	s5,168(sp)
    80001054:	0b613823          	sd	s6,176(sp)
    80001058:	0b713c23          	sd	s7,184(sp)
    8000105c:	0d813023          	sd	s8,192(sp)
    80001060:	0d913423          	sd	s9,200(sp)
    80001064:	0da13823          	sd	s10,208(sp)
    80001068:	0db13c23          	sd	s11,216(sp)
    8000106c:	0fc13023          	sd	t3,224(sp)
    80001070:	0fd13423          	sd	t4,232(sp)
    80001074:	0fe13823          	sd	t5,240(sp)
    80001078:	0ff13c23          	sd	t6,248(sp)

    call exceptionHandler
    8000107c:	798020ef          	jal	ra,80003814 <exceptionHandler>


    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    80001080:	00813083          	ld	ra,8(sp)
    80001084:	01013103          	ld	sp,16(sp)
    80001088:	01813183          	ld	gp,24(sp)
    8000108c:	02013203          	ld	tp,32(sp)
    80001090:	02813283          	ld	t0,40(sp)
    80001094:	03013303          	ld	t1,48(sp)
    80001098:	03813383          	ld	t2,56(sp)
    8000109c:	04013403          	ld	s0,64(sp)
    800010a0:	04813483          	ld	s1,72(sp)
    800010a4:	05813583          	ld	a1,88(sp)
    800010a8:	06013603          	ld	a2,96(sp)
    800010ac:	06813683          	ld	a3,104(sp)
    800010b0:	07013703          	ld	a4,112(sp)
    800010b4:	07813783          	ld	a5,120(sp)
    800010b8:	08013803          	ld	a6,128(sp)
    800010bc:	08813883          	ld	a7,136(sp)
    800010c0:	09013903          	ld	s2,144(sp)
    800010c4:	09813983          	ld	s3,152(sp)
    800010c8:	0a013a03          	ld	s4,160(sp)
    800010cc:	0a813a83          	ld	s5,168(sp)
    800010d0:	0b013b03          	ld	s6,176(sp)
    800010d4:	0b813b83          	ld	s7,184(sp)
    800010d8:	0c013c03          	ld	s8,192(sp)
    800010dc:	0c813c83          	ld	s9,200(sp)
    800010e0:	0d013d03          	ld	s10,208(sp)
    800010e4:	0d813d83          	ld	s11,216(sp)
    800010e8:	0e013e03          	ld	t3,224(sp)
    800010ec:	0e813e83          	ld	t4,232(sp)
    800010f0:	0f013f03          	ld	t5,240(sp)
    800010f4:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    800010f8:	10010113          	addi	sp,sp,256
    800010fc:	10200073          	sret

0000000080001100 <_ZN5TimerC1Ev>:
#include "sched.h"
#include "assert.h"

Timer* Timer::instance = nullptr;

Timer::Timer(){
    80001100:	fe010113          	addi	sp,sp,-32
    80001104:	00113c23          	sd	ra,24(sp)
    80001108:	00813823          	sd	s0,16(sp)
    8000110c:	00913423          	sd	s1,8(sp)
    80001110:	02010413          	addi	s0,sp,32
    80001114:	00050493          	mv	s1,a0
    assert(instance == nullptr);
    80001118:	00006797          	auipc	a5,0x6
    8000111c:	c787b783          	ld	a5,-904(a5) # 80006d90 <_ZN5Timer8instanceE>
    80001120:	02079463          	bnez	a5,80001148 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80001124:	00006797          	auipc	a5,0x6
    80001128:	c697b623          	sd	s1,-916(a5) # 80006d90 <_ZN5Timer8instanceE>
    sleepingHead = nullptr;
    8000112c:	0004b023          	sd	zero,0(s1)
    time = 0;
    80001130:	0004b423          	sd	zero,8(s1)
}
    80001134:	01813083          	ld	ra,24(sp)
    80001138:	01013403          	ld	s0,16(sp)
    8000113c:	00813483          	ld	s1,8(sp)
    80001140:	02010113          	addi	sp,sp,32
    80001144:	00008067          	ret
    assert(instance == nullptr);
    80001148:	01400593          	li	a1,20
    8000114c:	00005517          	auipc	a0,0x5
    80001150:	ed450513          	addi	a0,a0,-300 # 80006020 <CONSOLE_STATUS+0x10>
    80001154:	00000097          	auipc	ra,0x0
    80001158:	6b0080e7          	jalr	1712(ra) # 80001804 <_Z13assert_failedPKci>
    8000115c:	fc9ff06f          	j	80001124 <_ZN5TimerC1Ev+0x24>

0000000080001160 <_ZN5TimerD1Ev>:

Timer::~Timer(){
    threadSleepWrapper* current = sleepingHead;
    80001160:	00053503          	ld	a0,0(a0)
    while(current != nullptr){
    80001164:	04050063          	beqz	a0,800011a4 <_ZN5TimerD1Ev+0x44>
Timer::~Timer(){
    80001168:	fe010113          	addi	sp,sp,-32
    8000116c:	00113c23          	sd	ra,24(sp)
    80001170:	00813823          	sd	s0,16(sp)
    80001174:	00913423          	sd	s1,8(sp)
    80001178:	02010413          	addi	s0,sp,32
        threadSleepWrapper* next = current->next;
    8000117c:	01053483          	ld	s1,16(a0)
        mem_free(current);
    80001180:	00000097          	auipc	ra,0x0
    80001184:	228080e7          	jalr	552(ra) # 800013a8 <_Z8mem_freePv>
        current = next;
    80001188:	00048513          	mv	a0,s1
    while(current != nullptr){
    8000118c:	fe0498e3          	bnez	s1,8000117c <_ZN5TimerD1Ev+0x1c>
    }
}
    80001190:	01813083          	ld	ra,24(sp)
    80001194:	01013403          	ld	s0,16(sp)
    80001198:	00813483          	ld	s1,8(sp)
    8000119c:	02010113          	addi	sp,sp,32
    800011a0:	00008067          	ret
    800011a4:	00008067          	ret

00000000800011a8 <_ZN5Timer11getInstanceEv>:

Timer& Timer::getInstance(){
    assert(instance != nullptr);
    800011a8:	00006797          	auipc	a5,0x6
    800011ac:	be87b783          	ld	a5,-1048(a5) # 80006d90 <_ZN5Timer8instanceE>
    800011b0:	00078863          	beqz	a5,800011c0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800011b4:	00006517          	auipc	a0,0x6
    800011b8:	bdc53503          	ld	a0,-1060(a0) # 80006d90 <_ZN5Timer8instanceE>
    800011bc:	00008067          	ret
Timer& Timer::getInstance(){
    800011c0:	ff010113          	addi	sp,sp,-16
    800011c4:	00113423          	sd	ra,8(sp)
    800011c8:	00813023          	sd	s0,0(sp)
    800011cc:	01010413          	addi	s0,sp,16
    assert(instance != nullptr);
    800011d0:	02400593          	li	a1,36
    800011d4:	00005517          	auipc	a0,0x5
    800011d8:	e4c50513          	addi	a0,a0,-436 # 80006020 <CONSOLE_STATUS+0x10>
    800011dc:	00000097          	auipc	ra,0x0
    800011e0:	628080e7          	jalr	1576(ra) # 80001804 <_Z13assert_failedPKci>
}
    800011e4:	00006517          	auipc	a0,0x6
    800011e8:	bac53503          	ld	a0,-1108(a0) # 80006d90 <_ZN5Timer8instanceE>
    800011ec:	00813083          	ld	ra,8(sp)
    800011f0:	00013403          	ld	s0,0(sp)
    800011f4:	01010113          	addi	sp,sp,16
    800011f8:	00008067          	ret

00000000800011fc <_ZN5Timer4tickEv>:

void Timer::tick(){
    800011fc:	fd010113          	addi	sp,sp,-48
    80001200:	02113423          	sd	ra,40(sp)
    80001204:	02813023          	sd	s0,32(sp)
    80001208:	00913c23          	sd	s1,24(sp)
    8000120c:	01213823          	sd	s2,16(sp)
    80001210:	01313423          	sd	s3,8(sp)
    80001214:	03010413          	addi	s0,sp,48
    80001218:	00050993          	mv	s3,a0
    putc('t');
    8000121c:	07400513          	li	a0,116
    80001220:	00000097          	auipc	ra,0x0
    80001224:	360080e7          	jalr	864(ra) # 80001580 <_Z4putcc>
    time += 1;
    80001228:	0089b783          	ld	a5,8(s3)
    8000122c:	00178793          	addi	a5,a5,1
    80001230:	00f9b423          	sd	a5,8(s3)
    threadSleepWrapper* current = sleepingHead;
    80001234:	0009b483          	ld	s1,0(s3)
    while(current != nullptr){
    80001238:	04048263          	beqz	s1,8000127c <_ZN5Timer4tickEv+0x80>
        if(current->wakeUpTime <= time){
    8000123c:	0084b703          	ld	a4,8(s1)
    80001240:	0089b783          	ld	a5,8(s3)
    80001244:	02e7ec63          	bltu	a5,a4,8000127c <_ZN5Timer4tickEv+0x80>
            current->thread->setSleeping(false);
    80001248:	00000593          	li	a1,0
    8000124c:	0004b503          	ld	a0,0(s1)
    80001250:	00001097          	auipc	ra,0x1
    80001254:	ddc080e7          	jalr	-548(ra) # 8000202c <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    80001258:	0004b503          	ld	a0,0(s1)
    8000125c:	00003097          	auipc	ra,0x3
    80001260:	834080e7          	jalr	-1996(ra) # 80003a90 <_ZN9Scheduler3putEP7_thread>
            threadSleepWrapper* next = current->next;
    80001264:	0104b903          	ld	s2,16(s1)
            mem_free(current);
    80001268:	00048513          	mv	a0,s1
    8000126c:	00000097          	auipc	ra,0x0
    80001270:	13c080e7          	jalr	316(ra) # 800013a8 <_Z8mem_freePv>
            current = next;
    80001274:	00090493          	mv	s1,s2
    while(current != nullptr){
    80001278:	fc1ff06f          	j	80001238 <_ZN5Timer4tickEv+0x3c>
        }else{
            break;
        }
    }
}
    8000127c:	02813083          	ld	ra,40(sp)
    80001280:	02013403          	ld	s0,32(sp)
    80001284:	01813483          	ld	s1,24(sp)
    80001288:	01013903          	ld	s2,16(sp)
    8000128c:	00813983          	ld	s3,8(sp)
    80001290:	03010113          	addi	sp,sp,48
    80001294:	00008067          	ret

0000000080001298 <_ZN5Timer5sleepEm>:

int Timer::sleep(time_t timeToSleep){
    80001298:	fd010113          	addi	sp,sp,-48
    8000129c:	02113423          	sd	ra,40(sp)
    800012a0:	02813023          	sd	s0,32(sp)
    800012a4:	00913c23          	sd	s1,24(sp)
    800012a8:	01213823          	sd	s2,16(sp)
    800012ac:	01313423          	sd	s3,8(sp)
    800012b0:	03010413          	addi	s0,sp,48
    800012b4:	00050493          	mv	s1,a0
    800012b8:	00058913          	mv	s2,a1
    thread_t thread = _thread::currentThread;
    800012bc:	00006797          	auipc	a5,0x6
    800012c0:	a8c7b783          	ld	a5,-1396(a5) # 80006d48 <_GLOBAL_OFFSET_TABLE_+0x30>
    800012c4:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)mem_alloc(sizeof(threadSleepWrapper));
    800012c8:	01800513          	li	a0,24
    800012cc:	00000097          	auipc	ra,0x0
    800012d0:	0ac080e7          	jalr	172(ra) # 80001378 <_Z9mem_allocm>
    newSleepingThread->thread = thread;
    800012d4:	01353023          	sd	s3,0(a0)
    newSleepingThread->wakeUpTime = time + timeToSleep;
    800012d8:	0084b783          	ld	a5,8(s1)
    800012dc:	012785b3          	add	a1,a5,s2
    800012e0:	00b53423          	sd	a1,8(a0)
    newSleepingThread->next = nullptr;
    800012e4:	00053823          	sd	zero,16(a0)

    if(sleepingHead == nullptr){
    800012e8:	0004b783          	ld	a5,0(s1)
    800012ec:	06078263          	beqz	a5,80001350 <_ZN5Timer5sleepEm+0xb8>
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != nullptr && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
    800012f0:	00078693          	mv	a3,a5
    800012f4:	0107b783          	ld	a5,16(a5)
    800012f8:	00078663          	beqz	a5,80001304 <_ZN5Timer5sleepEm+0x6c>
    800012fc:	0087b703          	ld	a4,8(a5)
    80001300:	feb768e3          	bltu	a4,a1,800012f0 <_ZN5Timer5sleepEm+0x58>
            current = current->next;
        }
        newSleepingThread->next = current->next;
    80001304:	00f53823          	sd	a5,16(a0)
        current->next = newSleepingThread;
    80001308:	00a6b823          	sd	a0,16(a3)
    }
    thread->setSleeping(true);
    8000130c:	00100593          	li	a1,1
    80001310:	00098513          	mv	a0,s3
    80001314:	00001097          	auipc	ra,0x1
    80001318:	d18080e7          	jalr	-744(ra) # 8000202c <_ZN7_thread11setSleepingEb>
    putc('s');
    8000131c:	07300513          	li	a0,115
    80001320:	00000097          	auipc	ra,0x0
    80001324:	260080e7          	jalr	608(ra) # 80001580 <_Z4putcc>
    thread_dispatch();
    80001328:	00000097          	auipc	ra,0x0
    8000132c:	104080e7          	jalr	260(ra) # 8000142c <_Z15thread_dispatchv>
    return 0;
}
    80001330:	00000513          	li	a0,0
    80001334:	02813083          	ld	ra,40(sp)
    80001338:	02013403          	ld	s0,32(sp)
    8000133c:	01813483          	ld	s1,24(sp)
    80001340:	01013903          	ld	s2,16(sp)
    80001344:	00813983          	ld	s3,8(sp)
    80001348:	03010113          	addi	sp,sp,48
    8000134c:	00008067          	ret
        sleepingHead = newSleepingThread;
    80001350:	00a4b023          	sd	a0,0(s1)
    80001354:	fb9ff06f          	j	8000130c <_ZN5Timer5sleepEm+0x74>

0000000080001358 <_ZN5Timer17noSleepingThreadsEv>:

bool Timer::noSleepingThreads(){
    80001358:	ff010113          	addi	sp,sp,-16
    8000135c:	00813423          	sd	s0,8(sp)
    80001360:	01010413          	addi	s0,sp,16
    return sleepingHead == nullptr;
    80001364:	00053503          	ld	a0,0(a0)
    80001368:	00153513          	seqz	a0,a0
    8000136c:	00813403          	ld	s0,8(sp)
    80001370:	01010113          	addi	sp,sp,16
    80001374:	00008067          	ret

0000000080001378 <_Z9mem_allocm>:
 */

#include "heapManager.h"
#include "syscalls_c.h"

void* mem_alloc ( size_t nSize ){
    80001378:	ff010113          	addi	sp,sp,-16
    8000137c:	00813423          	sd	s0,8(sp)
    80001380:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001384:	03f50513          	addi	a0,a0,63
    80001388:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    8000138c:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    80001390:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    80001394:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    80001398:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    8000139c:	00813403          	ld	s0,8(sp)
    800013a0:	01010113          	addi	sp,sp,16
    800013a4:	00008067          	ret

00000000800013a8 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    800013a8:	ff010113          	addi	sp,sp,-16
    800013ac:	00813423          	sd	s0,8(sp)
    800013b0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    800013b4:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    800013b8:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    800013bc:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    800013c0:	00050513          	mv	a0,a0
    return nResult;

}
    800013c4:	0005051b          	sext.w	a0,a0
    800013c8:	00813403          	ld	s0,8(sp)
    800013cc:	01010113          	addi	sp,sp,16
    800013d0:	00008067          	ret

00000000800013d4 <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg) {
    800013d4:	ff010113          	addi	sp,sp,-16
    800013d8:	00813423          	sd	s0,8(sp)
    800013dc:	01010413          	addi	s0,sp,16
    // void* stack_space = (void*)((uint64)HeapManager::getInstance().heapAllocate(DEFAULT_STACK_SIZE / MEM_BLOCK_SIZE) + DEFAULT_STACK_SIZE - 1);
    // __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space));
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    800013e0:	00060693          	mv	a3,a2
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    800013e4:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    800013e8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x11");
    800013ec:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    800013f0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800013f4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800013f8:	0005051b          	sext.w	a0,a0
    800013fc:	00813403          	ld	s0,8(sp)
    80001400:	01010113          	addi	sp,sp,16
    80001404:	00008067          	ret

0000000080001408 <_Z11thread_exitv>:

// int thread_createCPP ( thread_t*, void(*)(void*), void* );

int thread_exit (){
    80001408:	ff010113          	addi	sp,sp,-16
    8000140c:	00813423          	sd	s0,8(sp)
    80001410:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    80001414:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80001418:	00000073          	ecall
    return 0;
}
    8000141c:	00000513          	li	a0,0
    80001420:	00813403          	ld	s0,8(sp)
    80001424:	01010113          	addi	sp,sp,16
    80001428:	00008067          	ret

000000008000142c <_Z15thread_dispatchv>:

void thread_dispatch () {
    8000142c:	ff010113          	addi	sp,sp,-16
    80001430:	00813423          	sd	s0,8(sp)
    80001434:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    80001438:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    8000143c:	00000073          	ecall
}
    80001440:	00813403          	ld	s0,8(sp)
    80001444:	01010113          	addi	sp,sp,16
    80001448:	00008067          	ret

000000008000144c <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle){
    8000144c:	ff010113          	addi	sp,sp,-16
    80001450:	00813423          	sd	s0,8(sp)
    80001454:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    80001458:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    8000145c:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    80001460:	00000073          	ecall
}
    80001464:	00813403          	ld	s0,8(sp)
    80001468:	01010113          	addi	sp,sp,16
    8000146c:	00008067          	ret

0000000080001470 <_Z10time_sleepm>:

int time_sleep( time_t duration){
    80001470:	ff010113          	addi	sp,sp,-16
    80001474:	00813423          	sd	s0,8(sp)
    80001478:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    8000147c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    80001480:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001484:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001488:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    8000148c:	0005051b          	sext.w	a0,a0
    80001490:	00813403          	ld	s0,8(sp)
    80001494:	01010113          	addi	sp,sp,16
    80001498:	00008067          	ret

000000008000149c <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init) {
    8000149c:	ff010113          	addi	sp,sp,-16
    800014a0:	00813423          	sd	s0,8(sp)
    800014a4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    800014a8:	02059593          	slli	a1,a1,0x20
    800014ac:	0205d593          	srli	a1,a1,0x20
    800014b0:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    800014b4:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    800014b8:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    800014bc:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800014c0:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800014c4:	0005051b          	sext.w	a0,a0
    800014c8:	00813403          	ld	s0,8(sp)
    800014cc:	01010113          	addi	sp,sp,16
    800014d0:	00008067          	ret

00000000800014d4 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle) {
    800014d4:	ff010113          	addi	sp,sp,-16
    800014d8:	00813423          	sd	s0,8(sp)
    800014dc:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800014e0:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    800014e4:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    800014e8:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800014ec:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800014f0:	0005051b          	sext.w	a0,a0
    800014f4:	00813403          	ld	s0,8(sp)
    800014f8:	01010113          	addi	sp,sp,16
    800014fc:	00008067          	ret

0000000080001500 <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle) {
    80001500:	ff010113          	addi	sp,sp,-16
    80001504:	00813423          	sd	s0,8(sp)
    80001508:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    8000150c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    80001510:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001514:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001518:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    8000151c:	0005051b          	sext.w	a0,a0
    80001520:	00813403          	ld	s0,8(sp)
    80001524:	01010113          	addi	sp,sp,16
    80001528:	00008067          	ret

000000008000152c <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle) {
    8000152c:	ff010113          	addi	sp,sp,-16
    80001530:	00813423          	sd	s0,8(sp)
    80001534:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001538:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    8000153c:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    80001540:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001544:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001548:	0005051b          	sext.w	a0,a0
    8000154c:	00813403          	ld	s0,8(sp)
    80001550:	01010113          	addi	sp,sp,16
    80001554:	00008067          	ret

0000000080001558 <_Z4getcv>:

char getc(){
    80001558:	ff010113          	addi	sp,sp,-16
    8000155c:	00813423          	sd	s0,8(sp)
    80001560:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    80001564:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    80001568:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    8000156c:	00050513          	mv	a0,a0
    return chr;
}
    80001570:	0ff57513          	andi	a0,a0,255
    80001574:	00813403          	ld	s0,8(sp)
    80001578:	01010113          	addi	sp,sp,16
    8000157c:	00008067          	ret

0000000080001580 <_Z4putcc>:

#include "console.h"

void putc(char chr)
{
    80001580:	ff010113          	addi	sp,sp,-16
    80001584:	00813423          	sd	s0,8(sp)
    80001588:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    8000158c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    80001590:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80001594:	00000073          	ecall
    80001598:	00813403          	ld	s0,8(sp)
    8000159c:	01010113          	addi	sp,sp,16
    800015a0:	00008067          	ret

00000000800015a4 <_ZN4_sem4openEPPS_j>:
#include "sem.h"
#include "syscalls_c.h"
#include "assert.h"
#include "sched.h"

void _sem::open(_sem** handle, unsigned init){
    800015a4:	ff010113          	addi	sp,sp,-16
    800015a8:	00813423          	sd	s0,8(sp)
    800015ac:	01010413          	addi	s0,sp,16
    (*handle)->blockHead = nullptr;
    800015b0:	00053783          	ld	a5,0(a0)
    800015b4:	0007b023          	sd	zero,0(a5)
    (*handle)->blockTail = nullptr;
    800015b8:	00053783          	ld	a5,0(a0)
    800015bc:	0007b423          	sd	zero,8(a5)
    (*handle)->value = init;
    800015c0:	00053783          	ld	a5,0(a0)
    800015c4:	00b7a823          	sw	a1,16(a5)
}
    800015c8:	00813403          	ld	s0,8(sp)
    800015cc:	01010113          	addi	sp,sp,16
    800015d0:	00008067          	ret

00000000800015d4 <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    800015d4:	fe010113          	addi	sp,sp,-32
    800015d8:	00113c23          	sd	ra,24(sp)
    800015dc:	00813823          	sd	s0,16(sp)
    800015e0:	00913423          	sd	s1,8(sp)
    800015e4:	02010413          	addi	s0,sp,32
    800015e8:	00050493          	mv	s1,a0
    while(id->blockHead != nullptr){
    800015ec:	0004b783          	ld	a5,0(s1)
    800015f0:	02078863          	beqz	a5,80001620 <_ZN4_sem5closeEPS_+0x4c>
        id->blockHead->pThread->setClosed(true);
    800015f4:	00100593          	li	a1,1
    800015f8:	0007b503          	ld	a0,0(a5)
    800015fc:	00001097          	auipc	ra,0x1
    80001600:	a04080e7          	jalr	-1532(ra) # 80002000 <_ZN7_thread9setClosedEb>
        mem_free(id->blockHead);
    80001604:	0004b503          	ld	a0,0(s1)
    80001608:	00000097          	auipc	ra,0x0
    8000160c:	da0080e7          	jalr	-608(ra) # 800013a8 <_Z8mem_freePv>
        id->blockHead = id->blockHead->pNext;
    80001610:	0004b783          	ld	a5,0(s1)
    80001614:	0087b783          	ld	a5,8(a5)
    80001618:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != nullptr){
    8000161c:	fd1ff06f          	j	800015ec <_ZN4_sem5closeEPS_+0x18>
    }
}
    80001620:	01813083          	ld	ra,24(sp)
    80001624:	01013403          	ld	s0,16(sp)
    80001628:	00813483          	ld	s1,8(sp)
    8000162c:	02010113          	addi	sp,sp,32
    80001630:	00008067          	ret

0000000080001634 <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    80001634:	01052783          	lw	a5,16(a0)
    80001638:	fff7879b          	addiw	a5,a5,-1
    8000163c:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    80001640:	02079713          	slli	a4,a5,0x20
    80001644:	00074463          	bltz	a4,8000164c <_ZN4_sem4waitEPS_+0x18>
    80001648:	00008067          	ret
void _sem::wait(sem_t id){
    8000164c:	fe010113          	addi	sp,sp,-32
    80001650:	00113c23          	sd	ra,24(sp)
    80001654:	00813823          	sd	s0,16(sp)
    80001658:	00913423          	sd	s1,8(sp)
    8000165c:	02010413          	addi	s0,sp,32
    80001660:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    80001664:	01000513          	li	a0,16
    80001668:	00000097          	auipc	ra,0x0
    8000166c:	d10080e7          	jalr	-752(ra) # 80001378 <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    80001670:	00005797          	auipc	a5,0x5
    80001674:	6d87b783          	ld	a5,1752(a5) # 80006d48 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001678:	0007b783          	ld	a5,0(a5)
    8000167c:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = nullptr;
    80001680:	00053423          	sd	zero,8(a0)
        if(id->blockHead == nullptr){
    80001684:	0004b783          	ld	a5,0(s1)
    80001688:	04078263          	beqz	a5,800016cc <_ZN4_sem4waitEPS_+0x98>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    8000168c:	0084b783          	ld	a5,8(s1)
    80001690:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    80001694:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    80001698:	00100593          	li	a1,1
    8000169c:	00005797          	auipc	a5,0x5
    800016a0:	6ac7b783          	ld	a5,1708(a5) # 80006d48 <_GLOBAL_OFFSET_TABLE_+0x30>
    800016a4:	0007b503          	ld	a0,0(a5)
    800016a8:	00001097          	auipc	ra,0x1
    800016ac:	928080e7          	jalr	-1752(ra) # 80001fd0 <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    800016b0:	00001097          	auipc	ra,0x1
    800016b4:	ac4080e7          	jalr	-1340(ra) # 80002174 <_ZN7_thread8dispatchEv>
    }
}
    800016b8:	01813083          	ld	ra,24(sp)
    800016bc:	01013403          	ld	s0,16(sp)
    800016c0:	00813483          	ld	s1,8(sp)
    800016c4:	02010113          	addi	sp,sp,32
    800016c8:	00008067          	ret
            id->blockHead = pNewBlock;
    800016cc:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    800016d0:	00a4b423          	sd	a0,8(s1)
    800016d4:	fc5ff06f          	j	80001698 <_ZN4_sem4waitEPS_+0x64>

00000000800016d8 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    800016d8:	01052783          	lw	a5,16(a0)
    800016dc:	0017879b          	addiw	a5,a5,1
    800016e0:	0007871b          	sext.w	a4,a5
    800016e4:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    800016e8:	00e05463          	blez	a4,800016f0 <_ZN4_sem6signalEPS_+0x18>
    800016ec:	00008067          	ret
void _sem::signal(sem_t id){
    800016f0:	fe010113          	addi	sp,sp,-32
    800016f4:	00113c23          	sd	ra,24(sp)
    800016f8:	00813823          	sd	s0,16(sp)
    800016fc:	00913423          	sd	s1,8(sp)
    80001700:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    80001704:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    80001708:	0084b783          	ld	a5,8(s1)
    8000170c:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == nullptr){
    80001710:	04078063          	beqz	a5,80001750 <_ZN4_sem6signalEPS_+0x78>
            id->blockTail = nullptr;
        }
        pUnblock->pThread->setBlocked(false);
    80001714:	00000593          	li	a1,0
    80001718:	0004b503          	ld	a0,0(s1)
    8000171c:	00001097          	auipc	ra,0x1
    80001720:	8b4080e7          	jalr	-1868(ra) # 80001fd0 <_ZN7_thread10setBlockedEb>
        Scheduler::put(pUnblock->pThread);
    80001724:	0004b503          	ld	a0,0(s1)
    80001728:	00002097          	auipc	ra,0x2
    8000172c:	368080e7          	jalr	872(ra) # 80003a90 <_ZN9Scheduler3putEP7_thread>
        mem_free(pUnblock);
    80001730:	00048513          	mv	a0,s1
    80001734:	00000097          	auipc	ra,0x0
    80001738:	c74080e7          	jalr	-908(ra) # 800013a8 <_Z8mem_freePv>
    }
    8000173c:	01813083          	ld	ra,24(sp)
    80001740:	01013403          	ld	s0,16(sp)
    80001744:	00813483          	ld	s1,8(sp)
    80001748:	02010113          	addi	sp,sp,32
    8000174c:	00008067          	ret
            id->blockTail = nullptr;
    80001750:	00053423          	sd	zero,8(a0)
    80001754:	fc1ff06f          	j	80001714 <_ZN4_sem6signalEPS_+0x3c>

0000000080001758 <main>:

#include "kernel.h"
#include "assert.h"

/// @brief first function to be called
void main(){
    80001758:	fb010113          	addi	sp,sp,-80
    8000175c:	04113423          	sd	ra,72(sp)
    80001760:	04813023          	sd	s0,64(sp)
    80001764:	02913c23          	sd	s1,56(sp)
    80001768:	05010413          	addi	s0,sp,80
    Kernel kernel = Kernel();
    8000176c:	fb040493          	addi	s1,s0,-80
    80001770:	00048513          	mv	a0,s1
    80001774:	00000097          	auipc	ra,0x0
    80001778:	36c080e7          	jalr	876(ra) # 80001ae0 <_ZN6KernelC1Ev>
    kernel.initialise();
    8000177c:	00048513          	mv	a0,s1
    80001780:	00000097          	auipc	ra,0x0
    80001784:	3d4080e7          	jalr	980(ra) # 80001b54 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    80001788:	00048513          	mv	a0,s1
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	420080e7          	jalr	1056(ra) # 80001bac <_ZN6Kernel3runEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001794:	02051863          	bnez	a0,800017c4 <main+0x6c>
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    80001798:	fd040513          	addi	a0,s0,-48
    8000179c:	00000097          	auipc	ra,0x0
    800017a0:	9c4080e7          	jalr	-1596(ra) # 80001160 <_ZN5TimerD1Ev>
    800017a4:	fb040513          	addi	a0,s0,-80
    800017a8:	00001097          	auipc	ra,0x1
    800017ac:	c8c080e7          	jalr	-884(ra) # 80002434 <_ZN11HeapManagerD1Ev>
    800017b0:	04813083          	ld	ra,72(sp)
    800017b4:	04013403          	ld	s0,64(sp)
    800017b8:	03813483          	ld	s1,56(sp)
    800017bc:	05010113          	addi	sp,sp,80
    800017c0:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    800017c4:	01400593          	li	a1,20
    800017c8:	00005517          	auipc	a0,0x5
    800017cc:	86850513          	addi	a0,a0,-1944 # 80006030 <CONSOLE_STATUS+0x20>
    800017d0:	00000097          	auipc	ra,0x0
    800017d4:	034080e7          	jalr	52(ra) # 80001804 <_Z13assert_failedPKci>
    800017d8:	fc1ff06f          	j	80001798 <main+0x40>
    800017dc:	00050493          	mv	s1,a0
    800017e0:	fd040513          	addi	a0,s0,-48
    800017e4:	00000097          	auipc	ra,0x0
    800017e8:	97c080e7          	jalr	-1668(ra) # 80001160 <_ZN5TimerD1Ev>
    800017ec:	fb040513          	addi	a0,s0,-80
    800017f0:	00001097          	auipc	ra,0x1
    800017f4:	c44080e7          	jalr	-956(ra) # 80002434 <_ZN11HeapManagerD1Ev>
    800017f8:	00048513          	mv	a0,s1
    800017fc:	00006097          	auipc	ra,0x6
    80001800:	68c080e7          	jalr	1676(ra) # 80007e88 <_Unwind_Resume>

0000000080001804 <_Z13assert_failedPKci>:
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char* file, int line ){
    80001804:	fc010113          	addi	sp,sp,-64
    80001808:	02113c23          	sd	ra,56(sp)
    8000180c:	02813823          	sd	s0,48(sp)
    80001810:	02913423          	sd	s1,40(sp)
    80001814:	03213023          	sd	s2,32(sp)
    80001818:	04010413          	addi	s0,sp,64
    8000181c:	00050493          	mv	s1,a0
    80001820:	00058913          	mv	s2,a1
    putc('\n');
    80001824:	00a00513          	li	a0,10
    80001828:	00000097          	auipc	ra,0x0
    8000182c:	d58080e7          	jalr	-680(ra) # 80001580 <_Z4putcc>
    putc('A');
    80001830:	04100513          	li	a0,65
    80001834:	00000097          	auipc	ra,0x0
    80001838:	d4c080e7          	jalr	-692(ra) # 80001580 <_Z4putcc>
    putc('s');
    8000183c:	07300513          	li	a0,115
    80001840:	00000097          	auipc	ra,0x0
    80001844:	d40080e7          	jalr	-704(ra) # 80001580 <_Z4putcc>
    putc('s');
    80001848:	07300513          	li	a0,115
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	d34080e7          	jalr	-716(ra) # 80001580 <_Z4putcc>
    putc('e');
    80001854:	06500513          	li	a0,101
    80001858:	00000097          	auipc	ra,0x0
    8000185c:	d28080e7          	jalr	-728(ra) # 80001580 <_Z4putcc>
    putc('r');
    80001860:	07200513          	li	a0,114
    80001864:	00000097          	auipc	ra,0x0
    80001868:	d1c080e7          	jalr	-740(ra) # 80001580 <_Z4putcc>
    putc('t');
    8000186c:	07400513          	li	a0,116
    80001870:	00000097          	auipc	ra,0x0
    80001874:	d10080e7          	jalr	-752(ra) # 80001580 <_Z4putcc>
    putc('i');
    80001878:	06900513          	li	a0,105
    8000187c:	00000097          	auipc	ra,0x0
    80001880:	d04080e7          	jalr	-764(ra) # 80001580 <_Z4putcc>
    putc('o');
    80001884:	06f00513          	li	a0,111
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	cf8080e7          	jalr	-776(ra) # 80001580 <_Z4putcc>
    putc('n');
    80001890:	06e00513          	li	a0,110
    80001894:	00000097          	auipc	ra,0x0
    80001898:	cec080e7          	jalr	-788(ra) # 80001580 <_Z4putcc>
    putc(' ');
    8000189c:	02000513          	li	a0,32
    800018a0:	00000097          	auipc	ra,0x0
    800018a4:	ce0080e7          	jalr	-800(ra) # 80001580 <_Z4putcc>
    putc('f');
    800018a8:	06600513          	li	a0,102
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	cd4080e7          	jalr	-812(ra) # 80001580 <_Z4putcc>
    putc('a');
    800018b4:	06100513          	li	a0,97
    800018b8:	00000097          	auipc	ra,0x0
    800018bc:	cc8080e7          	jalr	-824(ra) # 80001580 <_Z4putcc>
    putc('i');
    800018c0:	06900513          	li	a0,105
    800018c4:	00000097          	auipc	ra,0x0
    800018c8:	cbc080e7          	jalr	-836(ra) # 80001580 <_Z4putcc>
    putc('l');
    800018cc:	06c00513          	li	a0,108
    800018d0:	00000097          	auipc	ra,0x0
    800018d4:	cb0080e7          	jalr	-848(ra) # 80001580 <_Z4putcc>
    putc('e');
    800018d8:	06500513          	li	a0,101
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	ca4080e7          	jalr	-860(ra) # 80001580 <_Z4putcc>
    putc('d');
    800018e4:	06400513          	li	a0,100
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	c98080e7          	jalr	-872(ra) # 80001580 <_Z4putcc>
    putc(' ');
    800018f0:	02000513          	li	a0,32
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	c8c080e7          	jalr	-884(ra) # 80001580 <_Z4putcc>
    putc('i');
    800018fc:	06900513          	li	a0,105
    80001900:	00000097          	auipc	ra,0x0
    80001904:	c80080e7          	jalr	-896(ra) # 80001580 <_Z4putcc>
    putc('n');
    80001908:	06e00513          	li	a0,110
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	c74080e7          	jalr	-908(ra) # 80001580 <_Z4putcc>
    putc(' ');
    80001914:	02000513          	li	a0,32
    80001918:	00000097          	auipc	ra,0x0
    8000191c:	c68080e7          	jalr	-920(ra) # 80001580 <_Z4putcc>
    putc('f');
    80001920:	06600513          	li	a0,102
    80001924:	00000097          	auipc	ra,0x0
    80001928:	c5c080e7          	jalr	-932(ra) # 80001580 <_Z4putcc>
    putc('i');
    8000192c:	06900513          	li	a0,105
    80001930:	00000097          	auipc	ra,0x0
    80001934:	c50080e7          	jalr	-944(ra) # 80001580 <_Z4putcc>
    putc('l');
    80001938:	06c00513          	li	a0,108
    8000193c:	00000097          	auipc	ra,0x0
    80001940:	c44080e7          	jalr	-956(ra) # 80001580 <_Z4putcc>
    putc('e');
    80001944:	06500513          	li	a0,101
    80001948:	00000097          	auipc	ra,0x0
    8000194c:	c38080e7          	jalr	-968(ra) # 80001580 <_Z4putcc>
    putc(':');
    80001950:	03a00513          	li	a0,58
    80001954:	00000097          	auipc	ra,0x0
    80001958:	c2c080e7          	jalr	-980(ra) # 80001580 <_Z4putcc>
    putc(' ');
    8000195c:	02000513          	li	a0,32
    80001960:	00000097          	auipc	ra,0x0
    80001964:	c20080e7          	jalr	-992(ra) # 80001580 <_Z4putcc>
    while(*file != 0){
    80001968:	0004c503          	lbu	a0,0(s1)
    8000196c:	00050a63          	beqz	a0,80001980 <_Z13assert_failedPKci+0x17c>
        putc(*file);
    80001970:	00000097          	auipc	ra,0x0
    80001974:	c10080e7          	jalr	-1008(ra) # 80001580 <_Z4putcc>
        file++;
    80001978:	00148493          	addi	s1,s1,1
    while(*file != 0){
    8000197c:	fedff06f          	j	80001968 <_Z13assert_failedPKci+0x164>
    }
    putc('\n');
    80001980:	00a00513          	li	a0,10
    80001984:	00000097          	auipc	ra,0x0
    80001988:	bfc080e7          	jalr	-1028(ra) # 80001580 <_Z4putcc>
    putc('l');
    8000198c:	06c00513          	li	a0,108
    80001990:	00000097          	auipc	ra,0x0
    80001994:	bf0080e7          	jalr	-1040(ra) # 80001580 <_Z4putcc>
    putc('i');
    80001998:	06900513          	li	a0,105
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	be4080e7          	jalr	-1052(ra) # 80001580 <_Z4putcc>
    putc('n');
    800019a4:	06e00513          	li	a0,110
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	bd8080e7          	jalr	-1064(ra) # 80001580 <_Z4putcc>
    putc('e');
    800019b0:	06500513          	li	a0,101
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	bcc080e7          	jalr	-1076(ra) # 80001580 <_Z4putcc>
    putc(':');
    800019bc:	03a00513          	li	a0,58
    800019c0:	00000097          	auipc	ra,0x0
    800019c4:	bc0080e7          	jalr	-1088(ra) # 80001580 <_Z4putcc>
    putc(' ');
    800019c8:	02000513          	li	a0,32
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	bb4080e7          	jalr	-1100(ra) # 80001580 <_Z4putcc>
    char buffer[20];
    int i = 0;
    800019d4:	00000493          	li	s1,0
    while(line != 0){
    800019d8:	02090463          	beqz	s2,80001a00 <_Z13assert_failedPKci+0x1fc>
        buffer[i] = line % 10 + '0';
    800019dc:	00a00713          	li	a4,10
    800019e0:	02e967bb          	remw	a5,s2,a4
    800019e4:	0307879b          	addiw	a5,a5,48
    800019e8:	fe040693          	addi	a3,s0,-32
    800019ec:	009686b3          	add	a3,a3,s1
    800019f0:	fef68423          	sb	a5,-24(a3)
        line /= 10;
    800019f4:	02e9493b          	divw	s2,s2,a4
        i++;
    800019f8:	0014849b          	addiw	s1,s1,1
    while(line != 0){
    800019fc:	fddff06f          	j	800019d8 <_Z13assert_failedPKci+0x1d4>
    }
    while(i != 0){
    80001a00:	02048063          	beqz	s1,80001a20 <_Z13assert_failedPKci+0x21c>
        i--;
    80001a04:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80001a08:	fe040793          	addi	a5,s0,-32
    80001a0c:	009787b3          	add	a5,a5,s1
    80001a10:	fe87c503          	lbu	a0,-24(a5)
    80001a14:	00000097          	auipc	ra,0x0
    80001a18:	b6c080e7          	jalr	-1172(ra) # 80001580 <_Z4putcc>
    80001a1c:	fe5ff06f          	j	80001a00 <_Z13assert_failedPKci+0x1fc>
    }
    putc('\n');
    80001a20:	00a00513          	li	a0,10
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	b5c080e7          	jalr	-1188(ra) # 80001580 <_Z4putcc>
    while(1);
    80001a2c:	0000006f          	j	80001a2c <_Z13assert_failedPKci+0x228>

0000000080001a30 <_Z8testFuncPv>:
    return;
}

// sem_t sem = nullptr;

void testFunc(void* arg){
    80001a30:	ff010113          	addi	sp,sp,-16
    80001a34:	00113423          	sd	ra,8(sp)
    80001a38:	00813023          	sd	s0,0(sp)
    80001a3c:	01010413          	addi	s0,sp,16
    putc('t');
    80001a40:	07400513          	li	a0,116
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	b3c080e7          	jalr	-1220(ra) # 80001580 <_Z4putcc>
    putc('e');
    80001a4c:	06500513          	li	a0,101
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	b30080e7          	jalr	-1232(ra) # 80001580 <_Z4putcc>
    putc('s');
    80001a58:	07300513          	li	a0,115
    80001a5c:	00000097          	auipc	ra,0x0
    80001a60:	b24080e7          	jalr	-1244(ra) # 80001580 <_Z4putcc>
    putc('t');
    80001a64:	07400513          	li	a0,116
    80001a68:	00000097          	auipc	ra,0x0
    80001a6c:	b18080e7          	jalr	-1256(ra) # 80001580 <_Z4putcc>
    // sem_wait(sem);
    // thread_dispatch();
    // thread_dispatch();
    // thread_dispatch();

    putc(' ');
    80001a70:	02000513          	li	a0,32
    80001a74:	00000097          	auipc	ra,0x0
    80001a78:	b0c080e7          	jalr	-1268(ra) # 80001580 <_Z4putcc>
    // time_sleep(100);

    putc('t');
    80001a7c:	07400513          	li	a0,116
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	b00080e7          	jalr	-1280(ra) # 80001580 <_Z4putcc>
    putc('h');
    80001a88:	06800513          	li	a0,104
    80001a8c:	00000097          	auipc	ra,0x0
    80001a90:	af4080e7          	jalr	-1292(ra) # 80001580 <_Z4putcc>
    putc('r');
    80001a94:	07200513          	li	a0,114
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	ae8080e7          	jalr	-1304(ra) # 80001580 <_Z4putcc>
    putc('e');
    80001aa0:	06500513          	li	a0,101
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	adc080e7          	jalr	-1316(ra) # 80001580 <_Z4putcc>
    putc('a');
    80001aac:	06100513          	li	a0,97
    80001ab0:	00000097          	auipc	ra,0x0
    80001ab4:	ad0080e7          	jalr	-1328(ra) # 80001580 <_Z4putcc>
    putc('d');
    80001ab8:	06400513          	li	a0,100
    80001abc:	00000097          	auipc	ra,0x0
    80001ac0:	ac4080e7          	jalr	-1340(ra) # 80001580 <_Z4putcc>
    putc('\n');
    80001ac4:	00a00513          	li	a0,10
    80001ac8:	00000097          	auipc	ra,0x0
    80001acc:	ab8080e7          	jalr	-1352(ra) # 80001580 <_Z4putcc>
}
    80001ad0:	00813083          	ld	ra,8(sp)
    80001ad4:	00013403          	ld	s0,0(sp)
    80001ad8:	01010113          	addi	sp,sp,16
    80001adc:	00008067          	ret

0000000080001ae0 <_ZN6KernelC1Ev>:
Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80001ae0:	fe010113          	addi	sp,sp,-32
    80001ae4:	00113c23          	sd	ra,24(sp)
    80001ae8:	00813823          	sd	s0,16(sp)
    80001aec:	00913423          	sd	s1,8(sp)
    80001af0:	01213023          	sd	s2,0(sp)
    80001af4:	02010413          	addi	s0,sp,32
    80001af8:	00050493          	mv	s1,a0
    80001afc:	00001097          	auipc	ra,0x1
    80001b00:	8e0080e7          	jalr	-1824(ra) # 800023dc <_ZN11HeapManagerC1Ev>
    80001b04:	01048513          	addi	a0,s1,16
    80001b08:	00002097          	auipc	ra,0x2
    80001b0c:	f00080e7          	jalr	-256(ra) # 80003a08 <_ZN9SchedulerC1Ev>
    80001b10:	02048513          	addi	a0,s1,32
    80001b14:	fffff097          	auipc	ra,0xfffff
    80001b18:	5ec080e7          	jalr	1516(ra) # 80001100 <_ZN5TimerC1Ev>
    80001b1c:	0200006f          	j	80001b3c <_ZN6KernelC1Ev+0x5c>
    80001b20:	00050913          	mv	s2,a0
    80001b24:	00048513          	mv	a0,s1
    80001b28:	00001097          	auipc	ra,0x1
    80001b2c:	90c080e7          	jalr	-1780(ra) # 80002434 <_ZN11HeapManagerD1Ev>
    80001b30:	00090513          	mv	a0,s2
    80001b34:	00006097          	auipc	ra,0x6
    80001b38:	354080e7          	jalr	852(ra) # 80007e88 <_Unwind_Resume>
    80001b3c:	01813083          	ld	ra,24(sp)
    80001b40:	01013403          	ld	s0,16(sp)
    80001b44:	00813483          	ld	s1,8(sp)
    80001b48:	00013903          	ld	s2,0(sp)
    80001b4c:	02010113          	addi	sp,sp,32
    80001b50:	00008067          	ret

0000000080001b54 <_ZN6Kernel10initialiseEv>:
void Kernel::initialise(){
    80001b54:	ff010113          	addi	sp,sp,-16
    80001b58:	00113423          	sd	ra,8(sp)
    80001b5c:	00813023          	sd	s0,0(sp)
    80001b60:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80001b64:	00005797          	auipc	a5,0x5
    80001b68:	1d47b783          	ld	a5,468(a5) # 80006d38 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001b6c:	10579073          	csrw	stvec,a5
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80001b70:	100027f3          	csrr	a5,sstatus
    sstatus &= ~(1 << 8);
    80001b74:	eff7f793          	andi	a5,a5,-257
    __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80001b78:	10079073          	csrw	sstatus,a5
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );
    80001b7c:	00005797          	auipc	a5,0x5
    80001b80:	1c47b783          	ld	a5,452(a5) # 80006d40 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001b84:	0007b603          	ld	a2,0(a5)
    80001b88:	00005797          	auipc	a5,0x5
    80001b8c:	1987b783          	ld	a5,408(a5) # 80006d20 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001b90:	0007b583          	ld	a1,0(a5)
    80001b94:	00001097          	auipc	ra,0x1
    80001b98:	8b8080e7          	jalr	-1864(ra) # 8000244c <_ZN11HeapManager4initEmm>
}
    80001b9c:	00813083          	ld	ra,8(sp)
    80001ba0:	00013403          	ld	s0,0(sp)
    80001ba4:	01010113          	addi	sp,sp,16
    80001ba8:	00008067          	ret

0000000080001bac <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    80001bac:	fe010113          	addi	sp,sp,-32
    80001bb0:	00113c23          	sd	ra,24(sp)
    80001bb4:	00813823          	sd	s0,16(sp)
    80001bb8:	02010413          	addi	s0,sp,32
    
    thread_t t = (thread_t)mem_alloc(sizeof(_thread));
    80001bbc:	0b800513          	li	a0,184
    80001bc0:	fffff097          	auipc	ra,0xfffff
    80001bc4:	7b8080e7          	jalr	1976(ra) # 80001378 <_Z9mem_allocm>
    80001bc8:	fea43423          	sd	a0,-24(s0)
    
    // _thread::create(&t, nullptr, nullptr, nullptr, false);
    // _thread::currentThread = t;

    thread_create(&t, nullptr, nullptr);
    80001bcc:	00000613          	li	a2,0
    80001bd0:	00000593          	li	a1,0
    80001bd4:	fe840513          	addi	a0,s0,-24
    80001bd8:	fffff097          	auipc	ra,0xfffff
    80001bdc:	7fc080e7          	jalr	2044(ra) # 800013d4 <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80001be0:	00002097          	auipc	ra,0x2
    80001be4:	0a0080e7          	jalr	160(ra) # 80003c80 <_ZN9Scheduler3getEv>
    80001be8:	00005797          	auipc	a5,0x5
    80001bec:	1607b783          	ld	a5,352(a5) # 80006d48 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001bf0:	00a7b023          	sd	a0,0(a5)

    thread_t test = (thread_t)mem_alloc(sizeof(_thread));
    80001bf4:	0b800513          	li	a0,184
    80001bf8:	fffff097          	auipc	ra,0xfffff
    80001bfc:	780080e7          	jalr	1920(ra) # 80001378 <_Z9mem_allocm>
    80001c00:	fea43023          	sd	a0,-32(s0)
    
    // _thread::create(&test, testFunc, nullptr, nullptr);
    thread_create(&test, testFunc, nullptr);
    80001c04:	00000613          	li	a2,0
    80001c08:	00000597          	auipc	a1,0x0
    80001c0c:	e2858593          	addi	a1,a1,-472 # 80001a30 <_Z8testFuncPv>
    80001c10:	fe040513          	addi	a0,s0,-32
    80001c14:	fffff097          	auipc	ra,0xfffff
    80001c18:	7c0080e7          	jalr	1984(ra) # 800013d4 <_Z13thread_createPP7_threadPFvPvES2_>
    // sem = (sem_t)mem_alloc(sizeof(_sem));
    // sem_open(&sem, 0);


    thread_join(test);
    80001c1c:	fe043503          	ld	a0,-32(s0)
    80001c20:	00000097          	auipc	ra,0x0
    80001c24:	82c080e7          	jalr	-2004(ra) # 8000144c <_Z11thread_joinP7_thread>
    //     putc('0' + cnt);
    //     cnt /= 10;
    // }while(cnt > 0);

    do{
        thread_dispatch();
    80001c28:	00000097          	auipc	ra,0x0
    80001c2c:	804080e7          	jalr	-2044(ra) # 8000142c <_Z15thread_dispatchv>
    }while(!Scheduler::isEmpty());
    80001c30:	00002097          	auipc	ra,0x2
    80001c34:	e38080e7          	jalr	-456(ra) # 80003a68 <_ZN9Scheduler7isEmptyEv>
    80001c38:	fe0508e3          	beqz	a0,80001c28 <_ZN6Kernel3runEv+0x7c>

    putc('m');
    80001c3c:	06d00513          	li	a0,109
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	940080e7          	jalr	-1728(ra) # 80001580 <_Z4putcc>
    putc('a');
    80001c48:	06100513          	li	a0,97
    80001c4c:	00000097          	auipc	ra,0x0
    80001c50:	934080e7          	jalr	-1740(ra) # 80001580 <_Z4putcc>
    putc('i');
    80001c54:	06900513          	li	a0,105
    80001c58:	00000097          	auipc	ra,0x0
    80001c5c:	928080e7          	jalr	-1752(ra) # 80001580 <_Z4putcc>
    putc('n');
    80001c60:	06e00513          	li	a0,110
    80001c64:	00000097          	auipc	ra,0x0
    80001c68:	91c080e7          	jalr	-1764(ra) # 80001580 <_Z4putcc>
    putc('\n');
    80001c6c:	00a00513          	li	a0,10
    80001c70:	00000097          	auipc	ra,0x0
    80001c74:	910080e7          	jalr	-1776(ra) # 80001580 <_Z4putcc>
    
    return EXIT_SUCCESS;
    80001c78:	00000513          	li	a0,0
    80001c7c:	01813083          	ld	ra,24(sp)
    80001c80:	01013403          	ld	s0,16(sp)
    80001c84:	02010113          	addi	sp,sp,32
    80001c88:	00008067          	ret

0000000080001c8c <_ZN7_threadC1EPFvPvES0_>:
#include "syscalls_c.h"

thread_t _thread::currentThread = nullptr;
uint32 _thread::nextID = 0;

_thread::_thread(func function, void* arg){
    80001c8c:	ff010113          	addi	sp,sp,-16
    80001c90:	00813423          	sd	s0,8(sp)
    80001c94:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80001c98:	00053823          	sd	zero,16(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80001c9c:	00005717          	auipc	a4,0x5
    80001ca0:	0fc70713          	addi	a4,a4,252 # 80006d98 <_ZN7_thread6nextIDE>
    80001ca4:	00072783          	lw	a5,0(a4)
    80001ca8:	0017869b          	addiw	a3,a5,1
    80001cac:	00d72023          	sw	a3,0(a4)
    80001cb0:	00f52023          	sw	a5,0(a0)
    closed = 0;
    blocked = 0;
    sleeping = 0;
    finished = 0;
    reserved = 0;
    80001cb4:	0a052023          	sw	zero,160(a0)
    joinHead = nullptr;
    80001cb8:	08053023          	sd	zero,128(a0)
    timeLeft = 0;
    80001cbc:	08053823          	sd	zero,144(a0)
    stackStart = 0;
    80001cc0:	08053c23          	sd	zero,152(a0)
    
    context.s0 = 0;
    80001cc4:	00053c23          	sd	zero,24(a0)
    context.s1 = 0;
    80001cc8:	02053023          	sd	zero,32(a0)
    context.s2 = 0;
    80001ccc:	02053423          	sd	zero,40(a0)
    context.s3 = 0;
    80001cd0:	02053823          	sd	zero,48(a0)
    context.s4 = 0;
    80001cd4:	02053c23          	sd	zero,56(a0)
    context.s5 = 0;
    80001cd8:	04053023          	sd	zero,64(a0)
    context.s6 = 0;
    80001cdc:	04053423          	sd	zero,72(a0)
    context.s7 = 0;
    80001ce0:	04053823          	sd	zero,80(a0)
    context.s8 = 0;
    80001ce4:	04053c23          	sd	zero,88(a0)
    context.s9 = 0;
    80001ce8:	06053023          	sd	zero,96(a0)
    context.s10 = 0;
    80001cec:	06053423          	sd	zero,104(a0)
    context.s11 = 0;
    80001cf0:	06053823          	sd	zero,112(a0)

    context.sstatus = 0;
    80001cf4:	06053c23          	sd	zero,120(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80001cf8:	00000797          	auipc	a5,0x0
    80001cfc:	68878793          	addi	a5,a5,1672 # 80002380 <_ZN7_thread7wrapperEv>
    80001d00:	00f53423          	sd	a5,8(a0)
}
    80001d04:	00813403          	ld	s0,8(sp)
    80001d08:	01010113          	addi	sp,sp,16
    80001d0c:	00008067          	ret

0000000080001d10 <_Z10popSppSpiev>:

void popSppSpie(){
    80001d10:	ff010113          	addi	sp,sp,-16
    80001d14:	00813423          	sd	s0,8(sp)
    80001d18:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001d1c:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001d20:	10200073          	sret
}
    80001d24:	00813403          	ld	s0,8(sp)
    80001d28:	01010113          	addi	sp,sp,16
    80001d2c:	00008067          	ret

0000000080001d30 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80001d30:	fe010113          	addi	sp,sp,-32
    80001d34:	00113c23          	sd	ra,24(sp)
    80001d38:	00813823          	sd	s0,16(sp)
    80001d3c:	00913423          	sd	s1,8(sp)
    80001d40:	01213023          	sd	s2,0(sp)
    80001d44:	02010413          	addi	s0,sp,32
    // putc('u');
    ThreadJoinList* current = joinHead;
    80001d48:	08053483          	ld	s1,128(a0)
    while(current != nullptr){
    80001d4c:	0c048863          	beqz	s1,80001e1c <_ZN7_thread6unJoinEv+0xec>
        thread_t thread = current->thread;
    80001d50:	0004c783          	lbu	a5,0(s1)
    80001d54:	0014c503          	lbu	a0,1(s1)
    80001d58:	00851513          	slli	a0,a0,0x8
    80001d5c:	00f56533          	or	a0,a0,a5
    80001d60:	0024c783          	lbu	a5,2(s1)
    80001d64:	01079793          	slli	a5,a5,0x10
    80001d68:	00a7e7b3          	or	a5,a5,a0
    80001d6c:	0034c503          	lbu	a0,3(s1)
    80001d70:	01851513          	slli	a0,a0,0x18
    80001d74:	00f56533          	or	a0,a0,a5
    80001d78:	0044c783          	lbu	a5,4(s1)
    80001d7c:	02079793          	slli	a5,a5,0x20
    80001d80:	00a7e7b3          	or	a5,a5,a0
    80001d84:	0054c503          	lbu	a0,5(s1)
    80001d88:	02851513          	slli	a0,a0,0x28
    80001d8c:	00f56533          	or	a0,a0,a5
    80001d90:	0064c783          	lbu	a5,6(s1)
    80001d94:	03079793          	slli	a5,a5,0x30
    80001d98:	00a7e7b3          	or	a5,a5,a0
    80001d9c:	0074c503          	lbu	a0,7(s1)
    80001da0:	03851513          	slli	a0,a0,0x38
        Scheduler::put(thread);
    80001da4:	00f56533          	or	a0,a0,a5
    80001da8:	00002097          	auipc	ra,0x2
    80001dac:	ce8080e7          	jalr	-792(ra) # 80003a90 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80001db0:	0084c903          	lbu	s2,8(s1)
    80001db4:	0094c783          	lbu	a5,9(s1)
    80001db8:	00879793          	slli	a5,a5,0x8
    80001dbc:	0127e7b3          	or	a5,a5,s2
    80001dc0:	00a4c903          	lbu	s2,10(s1)
    80001dc4:	01091913          	slli	s2,s2,0x10
    80001dc8:	00f967b3          	or	a5,s2,a5
    80001dcc:	00b4c903          	lbu	s2,11(s1)
    80001dd0:	01891913          	slli	s2,s2,0x18
    80001dd4:	00f96933          	or	s2,s2,a5
    80001dd8:	00c4c783          	lbu	a5,12(s1)
    80001ddc:	02079793          	slli	a5,a5,0x20
    80001de0:	0127e933          	or	s2,a5,s2
    80001de4:	00d4c783          	lbu	a5,13(s1)
    80001de8:	02879793          	slli	a5,a5,0x28
    80001dec:	0127e7b3          	or	a5,a5,s2
    80001df0:	00e4c903          	lbu	s2,14(s1)
    80001df4:	03091913          	slli	s2,s2,0x30
    80001df8:	00f967b3          	or	a5,s2,a5
    80001dfc:	00f4c903          	lbu	s2,15(s1)
    80001e00:	03891913          	slli	s2,s2,0x38
    80001e04:	00f96933          	or	s2,s2,a5
        mem_free(current);
    80001e08:	00048513          	mv	a0,s1
    80001e0c:	fffff097          	auipc	ra,0xfffff
    80001e10:	59c080e7          	jalr	1436(ra) # 800013a8 <_Z8mem_freePv>
        current = next;
    80001e14:	00090493          	mv	s1,s2
    while(current != nullptr){
    80001e18:	f35ff06f          	j	80001d4c <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80001e1c:	01813083          	ld	ra,24(sp)
    80001e20:	01013403          	ld	s0,16(sp)
    80001e24:	00813483          	ld	s1,8(sp)
    80001e28:	00013903          	ld	s2,0(sp)
    80001e2c:	02010113          	addi	sp,sp,32
    80001e30:	00008067          	ret

0000000080001e34 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80001e34:	fc010113          	addi	sp,sp,-64
    80001e38:	02113c23          	sd	ra,56(sp)
    80001e3c:	02813823          	sd	s0,48(sp)
    80001e40:	02913423          	sd	s1,40(sp)
    80001e44:	03213023          	sd	s2,32(sp)
    80001e48:	01313c23          	sd	s3,24(sp)
    80001e4c:	01413823          	sd	s4,16(sp)
    80001e50:	01513423          	sd	s5,8(sp)
    80001e54:	04010413          	addi	s0,sp,64
    80001e58:	00050493          	mv	s1,a0
    80001e5c:	00058a93          	mv	s5,a1
    80001e60:	00060a13          	mv	s4,a2
    80001e64:	00068913          	mv	s2,a3
    80001e68:	00070993          	mv	s3,a4
    *thread = (thread_t)mem_alloc(sizeof(_thread));
    80001e6c:	0b800513          	li	a0,184
    80001e70:	fffff097          	auipc	ra,0xfffff
    80001e74:	508080e7          	jalr	1288(ra) # 80001378 <_Z9mem_allocm>
    80001e78:	00a4b023          	sd	a0,0(s1)
    
    (*thread)->function = function;
    80001e7c:	0b553423          	sd	s5,168(a0)
    (*thread)->arg = arg;
    80001e80:	0004b783          	ld	a5,0(s1)
    80001e84:	0b47b823          	sd	s4,176(a5)
    (*thread)->ID = nextID++;
    80001e88:	00005717          	auipc	a4,0x5
    80001e8c:	f1070713          	addi	a4,a4,-240 # 80006d98 <_ZN7_thread6nextIDE>
    80001e90:	00072783          	lw	a5,0(a4)
    80001e94:	0017869b          	addiw	a3,a5,1
    80001e98:	00d72023          	sw	a3,0(a4)
    80001e9c:	0004b703          	ld	a4,0(s1)
    80001ea0:	00f72023          	sw	a5,0(a4)
    (*thread)->closed = false;
    80001ea4:	0004b703          	ld	a4,0(s1)
    80001ea8:	0a072783          	lw	a5,160(a4)
    80001eac:	ffe7f793          	andi	a5,a5,-2
    80001eb0:	0af72023          	sw	a5,160(a4)
    (*thread)->blocked = false;
    80001eb4:	0004b703          	ld	a4,0(s1)
    80001eb8:	0a072783          	lw	a5,160(a4)
    80001ebc:	ffd7f793          	andi	a5,a5,-3
    80001ec0:	0af72023          	sw	a5,160(a4)
    (*thread)->sleeping = false;
    80001ec4:	0004b703          	ld	a4,0(s1)
    80001ec8:	0a072783          	lw	a5,160(a4)
    80001ecc:	ffb7f793          	andi	a5,a5,-5
    80001ed0:	0af72023          	sw	a5,160(a4)
    (*thread)->finished = false;
    80001ed4:	0004b703          	ld	a4,0(s1)
    80001ed8:	0a072783          	lw	a5,160(a4)
    80001edc:	ff77f793          	andi	a5,a5,-9
    80001ee0:	0af72023          	sw	a5,160(a4)
    (*thread)->reserved = 0;
    80001ee4:	0004b703          	ld	a4,0(s1)
    80001ee8:	0a072783          	lw	a5,160(a4)
    80001eec:	00f7f793          	andi	a5,a5,15
    80001ef0:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = nullptr;
    80001ef4:	0004b783          	ld	a5,0(s1)
    80001ef8:	0807b023          	sd	zero,128(a5)
    (*thread)->joinTail = nullptr;
    80001efc:	0004b783          	ld	a5,0(s1)
    80001f00:	0807b423          	sd	zero,136(a5)
    (*thread)->timeLeft = 0;
    80001f04:	0004b783          	ld	a5,0(s1)
    80001f08:	0807b823          	sd	zero,144(a5)
    (*thread)->stackStart = 0;
    80001f0c:	0004b783          	ld	a5,0(s1)
    80001f10:	0807bc23          	sd	zero,152(a5)

    (*thread)->context.s0 = 0;
    80001f14:	0004b783          	ld	a5,0(s1)
    80001f18:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s1 = 0;
    80001f1c:	0004b783          	ld	a5,0(s1)
    80001f20:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s2 = 0;
    80001f24:	0004b783          	ld	a5,0(s1)
    80001f28:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s3 = 0;
    80001f2c:	0004b783          	ld	a5,0(s1)
    80001f30:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s4 = 0;
    80001f34:	0004b783          	ld	a5,0(s1)
    80001f38:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s5 = 0;
    80001f3c:	0004b783          	ld	a5,0(s1)
    80001f40:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s6 = 0;
    80001f44:	0004b783          	ld	a5,0(s1)
    80001f48:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s7 = 0;
    80001f4c:	0004b783          	ld	a5,0(s1)
    80001f50:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s8 = 0;
    80001f54:	0004b783          	ld	a5,0(s1)
    80001f58:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s9 = 0;
    80001f5c:	0004b783          	ld	a5,0(s1)
    80001f60:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s10 = 0;
    80001f64:	0004b783          	ld	a5,0(s1)
    80001f68:	0607b423          	sd	zero,104(a5)
    (*thread)->context.s11 = 0;
    80001f6c:	0004b783          	ld	a5,0(s1)
    80001f70:	0607b823          	sd	zero,112(a5)

    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80001f74:	0004b783          	ld	a5,0(s1)
    80001f78:	0127b823          	sd	s2,16(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80001f7c:	0004b783          	ld	a5,0(s1)
    80001f80:	00000717          	auipc	a4,0x0
    80001f84:	40070713          	addi	a4,a4,1024 # 80002380 <_ZN7_thread7wrapperEv>
    80001f88:	00e7b423          	sd	a4,8(a5)

    (*thread)->stackStart = stack;
    80001f8c:	0004b783          	ld	a5,0(s1)
    80001f90:	0927bc23          	sd	s2,152(a5)
    if(start){
    80001f94:	02099663          	bnez	s3,80001fc0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x18c>
        Scheduler::put(*thread);
    }
    return 0;
}
    80001f98:	00000513          	li	a0,0
    80001f9c:	03813083          	ld	ra,56(sp)
    80001fa0:	03013403          	ld	s0,48(sp)
    80001fa4:	02813483          	ld	s1,40(sp)
    80001fa8:	02013903          	ld	s2,32(sp)
    80001fac:	01813983          	ld	s3,24(sp)
    80001fb0:	01013a03          	ld	s4,16(sp)
    80001fb4:	00813a83          	ld	s5,8(sp)
    80001fb8:	04010113          	addi	sp,sp,64
    80001fbc:	00008067          	ret
        Scheduler::put(*thread);
    80001fc0:	0004b503          	ld	a0,0(s1)
    80001fc4:	00002097          	auipc	ra,0x2
    80001fc8:	acc080e7          	jalr	-1332(ra) # 80003a90 <_ZN9Scheduler3putEP7_thread>
    80001fcc:	fcdff06f          	j	80001f98 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x164>

0000000080001fd0 <_ZN7_thread10setBlockedEb>:
    currentThread->finished = 1;
    dispatch();
    return 0;
}

void _thread::setBlocked(bool blocked){
    80001fd0:	ff010113          	addi	sp,sp,-16
    80001fd4:	00813423          	sd	s0,8(sp)
    80001fd8:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80001fdc:	0015f593          	andi	a1,a1,1
    80001fe0:	0015979b          	slliw	a5,a1,0x1
    80001fe4:	0a052583          	lw	a1,160(a0)
    80001fe8:	ffd5f593          	andi	a1,a1,-3
    80001fec:	00f5e5b3          	or	a1,a1,a5
    80001ff0:	0ab52023          	sw	a1,160(a0)
}
    80001ff4:	00813403          	ld	s0,8(sp)
    80001ff8:	01010113          	addi	sp,sp,16
    80001ffc:	00008067          	ret

0000000080002000 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80002000:	ff010113          	addi	sp,sp,-16
    80002004:	00813423          	sd	s0,8(sp)
    80002008:	01010413          	addi	s0,sp,16
    this->closed = closed;
    8000200c:	0015f793          	andi	a5,a1,1
    80002010:	0a052583          	lw	a1,160(a0)
    80002014:	ffe5f593          	andi	a1,a1,-2
    80002018:	00f5e5b3          	or	a1,a1,a5
    8000201c:	0ab52023          	sw	a1,160(a0)
}
    80002020:	00813403          	ld	s0,8(sp)
    80002024:	01010113          	addi	sp,sp,16
    80002028:	00008067          	ret

000000008000202c <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    8000202c:	ff010113          	addi	sp,sp,-16
    80002030:	00813423          	sd	s0,8(sp)
    80002034:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    80002038:	0015f593          	andi	a1,a1,1
    8000203c:	0025979b          	slliw	a5,a1,0x2
    80002040:	0a052583          	lw	a1,160(a0)
    80002044:	ffb5f593          	andi	a1,a1,-5
    80002048:	00f5e5b3          	or	a1,a1,a5
    8000204c:	0ab52023          	sw	a1,160(a0)
}
    80002050:	00813403          	ld	s0,8(sp)
    80002054:	01010113          	addi	sp,sp,16
    80002058:	00008067          	ret

000000008000205c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
        return;
    }
    contextSwitch(oldThread == nullptr?nullptr:&oldThread->context, &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    8000205c:	ff010113          	addi	sp,sp,-16
    80002060:	00813423          	sd	s0,8(sp)
    80002064:	01010413          	addi	s0,sp,16
    if(oldContext != nullptr){
    80002068:	08050063          	beqz	a0,800020e8 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x8c>

        __asm__ volatile ("mv %0, sp" : "=r"(oldContext->sp));
    8000206c:	00010793          	mv	a5,sp
    80002070:	00f53423          	sd	a5,8(a0)
        __asm__ volatile ("mv %0, ra" : "=r"(oldContext->pc));
    80002074:	00008793          	mv	a5,ra
    80002078:	00f53023          	sd	a5,0(a0)

        __asm__ volatile ("mv %0, s0" : "=r"(oldContext->s0));
    8000207c:	00040793          	mv	a5,s0
    80002080:	00f53823          	sd	a5,16(a0)
        __asm__ volatile ("mv %0, s1" : "=r"(oldContext->s1));
    80002084:	00048793          	mv	a5,s1
    80002088:	00f53c23          	sd	a5,24(a0)
        __asm__ volatile ("mv %0, s2" : "=r"(oldContext->s2));
    8000208c:	00090793          	mv	a5,s2
    80002090:	02f53023          	sd	a5,32(a0)
        __asm__ volatile ("mv %0, s3" : "=r"(oldContext->s3));
    80002094:	00098793          	mv	a5,s3
    80002098:	02f53423          	sd	a5,40(a0)
        __asm__ volatile ("mv %0, s4" : "=r"(oldContext->s4));
    8000209c:	000a0793          	mv	a5,s4
    800020a0:	02f53823          	sd	a5,48(a0)
        __asm__ volatile ("mv %0, s5" : "=r"(oldContext->s5));
    800020a4:	000a8793          	mv	a5,s5
    800020a8:	02f53c23          	sd	a5,56(a0)
        __asm__ volatile ("mv %0, s6" : "=r"(oldContext->s6));
    800020ac:	000b0793          	mv	a5,s6
    800020b0:	04f53023          	sd	a5,64(a0)
        __asm__ volatile ("mv %0, s7" : "=r"(oldContext->s7));
    800020b4:	000b8793          	mv	a5,s7
    800020b8:	04f53423          	sd	a5,72(a0)
        __asm__ volatile ("mv %0, s8" : "=r"(oldContext->s8));
    800020bc:	000c0793          	mv	a5,s8
    800020c0:	04f53823          	sd	a5,80(a0)
        __asm__ volatile ("mv %0, s9" : "=r"(oldContext->s9));
    800020c4:	000c8793          	mv	a5,s9
    800020c8:	04f53c23          	sd	a5,88(a0)
        __asm__ volatile ("mv %0, s10" : "=r"(oldContext->s10));
    800020cc:	000d0793          	mv	a5,s10
    800020d0:	06f53023          	sd	a5,96(a0)
        __asm__ volatile ("mv %0, s11" : "=r"(oldContext->s11));
    800020d4:	000d8793          	mv	a5,s11
    800020d8:	06f53423          	sd	a5,104(a0)

        __asm__ volatile ("csrr s0, sstatus");
    800020dc:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("mv %0, s0" : "=r"(oldContext->sstatus));
    800020e0:	00040793          	mv	a5,s0
    800020e4:	06f53823          	sd	a5,112(a0)

    }
    if(newContext->sp != 0){
    800020e8:	0085b783          	ld	a5,8(a1)
    800020ec:	00078463          	beqz	a5,800020f4 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x98>
        __asm__ volatile ("mv sp, %0" :: "r"(newContext->sp));
    800020f0:	00078113          	mv	sp,a5
    }

    
    __asm__ volatile ("mv s0, %0" :: "r"(newContext->sstatus));
    800020f4:	0705b783          	ld	a5,112(a1)
    800020f8:	00078413          	mv	s0,a5
    __asm__ volatile ("csrw sstatus, s0");
    800020fc:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("mv s0, %0" :: "r"(newContext->s0));
    80002100:	0105b783          	ld	a5,16(a1)
    80002104:	00078413          	mv	s0,a5
    __asm__ volatile ("mv s1, %0" :: "r"(newContext->s1));
    80002108:	0185b783          	ld	a5,24(a1)
    8000210c:	00078493          	mv	s1,a5
    __asm__ volatile ("mv s2, %0" :: "r"(newContext->s2));
    80002110:	0205b783          	ld	a5,32(a1)
    80002114:	00078913          	mv	s2,a5
    __asm__ volatile ("mv s3, %0" :: "r"(newContext->s3));
    80002118:	0285b783          	ld	a5,40(a1)
    8000211c:	00078993          	mv	s3,a5
    __asm__ volatile ("mv s4, %0" :: "r"(newContext->s4));
    80002120:	0305b783          	ld	a5,48(a1)
    80002124:	00078a13          	mv	s4,a5
    __asm__ volatile ("mv s5, %0" :: "r"(newContext->s5));
    80002128:	0385b783          	ld	a5,56(a1)
    8000212c:	00078a93          	mv	s5,a5
    __asm__ volatile ("mv s6, %0" :: "r"(newContext->s6));
    80002130:	0405b783          	ld	a5,64(a1)
    80002134:	00078b13          	mv	s6,a5
    __asm__ volatile ("mv s7, %0" :: "r"(newContext->s7));
    80002138:	0485b783          	ld	a5,72(a1)
    8000213c:	00078b93          	mv	s7,a5
    __asm__ volatile ("mv s8, %0" :: "r"(newContext->s8));
    80002140:	0505b783          	ld	a5,80(a1)
    80002144:	00078c13          	mv	s8,a5
    __asm__ volatile ("mv s9, %0" :: "r"(newContext->s9));
    80002148:	0585b783          	ld	a5,88(a1)
    8000214c:	00078c93          	mv	s9,a5
    __asm__ volatile ("mv s10, %0" :: "r"(newContext->s10));
    80002150:	0605b783          	ld	a5,96(a1)
    80002154:	00078d13          	mv	s10,a5
    __asm__ volatile ("mv s11, %0" :: "r"(newContext->s11));
    80002158:	0685b783          	ld	a5,104(a1)
    8000215c:	00078d93          	mv	s11,a5

    __asm__ volatile ("mv ra, %0" :: "r"(newContext->pc));
    80002160:	0005b783          	ld	a5,0(a1)
    80002164:	00078093          	mv	ra,a5
    return;
}
    80002168:	00813403          	ld	s0,8(sp)
    8000216c:	01010113          	addi	sp,sp,16
    80002170:	00008067          	ret

0000000080002174 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80002174:	fe010113          	addi	sp,sp,-32
    80002178:	00113c23          	sd	ra,24(sp)
    8000217c:	00813823          	sd	s0,16(sp)
    80002180:	00913423          	sd	s1,8(sp)
    80002184:	02010413          	addi	s0,sp,32
    _thread* oldThread = currentThread;
    80002188:	00005497          	auipc	s1,0x5
    8000218c:	c184b483          	ld	s1,-1000(s1) # 80006da0 <_ZN7_thread13currentThreadE>
    if(oldThread != nullptr && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80002190:	00048863          	beqz	s1,800021a0 <_ZN7_thread8dispatchEv+0x2c>
    80002194:	0a04b783          	ld	a5,160(s1)
    80002198:	00f7f793          	andi	a5,a5,15
    8000219c:	04078263          	beqz	a5,800021e0 <_ZN7_thread8dispatchEv+0x6c>
    currentThread =  Scheduler::get();
    800021a0:	00002097          	auipc	ra,0x2
    800021a4:	ae0080e7          	jalr	-1312(ra) # 80003c80 <_ZN9Scheduler3getEv>
    800021a8:	00005797          	auipc	a5,0x5
    800021ac:	bea7bc23          	sd	a0,-1032(a5) # 80006da0 <_ZN7_thread13currentThreadE>
    if(currentThread == nullptr){
    800021b0:	00050e63          	beqz	a0,800021cc <_ZN7_thread8dispatchEv+0x58>
    contextSwitch(oldThread == nullptr?nullptr:&oldThread->context, &(currentThread->context));
    800021b4:	00048463          	beqz	s1,800021bc <_ZN7_thread8dispatchEv+0x48>
    800021b8:	00848493          	addi	s1,s1,8
    800021bc:	00850593          	addi	a1,a0,8
    800021c0:	00048513          	mv	a0,s1
    800021c4:	00000097          	auipc	ra,0x0
    800021c8:	e98080e7          	jalr	-360(ra) # 8000205c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    800021cc:	01813083          	ld	ra,24(sp)
    800021d0:	01013403          	ld	s0,16(sp)
    800021d4:	00813483          	ld	s1,8(sp)
    800021d8:	02010113          	addi	sp,sp,32
    800021dc:	00008067          	ret
            Scheduler::put(oldThread);
    800021e0:	00048513          	mv	a0,s1
    800021e4:	00002097          	auipc	ra,0x2
    800021e8:	8ac080e7          	jalr	-1876(ra) # 80003a90 <_ZN9Scheduler3putEP7_thread>
    800021ec:	fb5ff06f          	j	800021a0 <_ZN7_thread8dispatchEv+0x2c>

00000000800021f0 <_ZN7_thread4joinEPS_>:
    if(thread->finished || thread->closed){
    800021f0:	0a05b783          	ld	a5,160(a1)
    800021f4:	0097f793          	andi	a5,a5,9
    800021f8:	00078463          	beqz	a5,80002200 <_ZN7_thread4joinEPS_+0x10>
    800021fc:	00008067          	ret
void _thread::join(thread_t thread){
    80002200:	fe010113          	addi	sp,sp,-32
    80002204:	00113c23          	sd	ra,24(sp)
    80002208:	00813823          	sd	s0,16(sp)
    8000220c:	00913423          	sd	s1,8(sp)
    80002210:	01213023          	sd	s2,0(sp)
    80002214:	02010413          	addi	s0,sp,32
    80002218:	00050493          	mv	s1,a0
    8000221c:	00058913          	mv	s2,a1
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    80002220:	01000513          	li	a0,16
    80002224:	fffff097          	auipc	ra,0xfffff
    80002228:	154080e7          	jalr	340(ra) # 80001378 <_Z9mem_allocm>
    this->blocked = true;
    8000222c:	0a04a703          	lw	a4,160(s1)
    80002230:	00276713          	ori	a4,a4,2
    80002234:	0ae4a023          	sw	a4,160(s1)
    newJoin->thread = this;
    80002238:	00950023          	sb	s1,0(a0)
    8000223c:	0084d713          	srli	a4,s1,0x8
    80002240:	00e500a3          	sb	a4,1(a0)
    80002244:	0104d713          	srli	a4,s1,0x10
    80002248:	00e50123          	sb	a4,2(a0)
    8000224c:	0184d71b          	srliw	a4,s1,0x18
    80002250:	00e501a3          	sb	a4,3(a0)
    80002254:	0204d713          	srli	a4,s1,0x20
    80002258:	00e50223          	sb	a4,4(a0)
    8000225c:	0284d713          	srli	a4,s1,0x28
    80002260:	00e502a3          	sb	a4,5(a0)
    80002264:	0304d713          	srli	a4,s1,0x30
    80002268:	00e50323          	sb	a4,6(a0)
    8000226c:	0384d493          	srli	s1,s1,0x38
    80002270:	009503a3          	sb	s1,7(a0)
    newJoin->next = nullptr;
    80002274:	00050423          	sb	zero,8(a0)
    80002278:	000504a3          	sb	zero,9(a0)
    8000227c:	00050523          	sb	zero,10(a0)
    80002280:	000505a3          	sb	zero,11(a0)
    80002284:	00050623          	sb	zero,12(a0)
    80002288:	000506a3          	sb	zero,13(a0)
    8000228c:	00050723          	sb	zero,14(a0)
    80002290:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == nullptr){
    80002294:	08093703          	ld	a4,128(s2)
    80002298:	06070463          	beqz	a4,80002300 <_ZN7_thread4joinEPS_+0x110>
        thread->joinTail->next = newJoin;
    8000229c:	08893703          	ld	a4,136(s2)
    800022a0:	00a70423          	sb	a0,8(a4)
    800022a4:	00855693          	srli	a3,a0,0x8
    800022a8:	00d704a3          	sb	a3,9(a4)
    800022ac:	01055693          	srli	a3,a0,0x10
    800022b0:	00d70523          	sb	a3,10(a4)
    800022b4:	0185569b          	srliw	a3,a0,0x18
    800022b8:	00d705a3          	sb	a3,11(a4)
    800022bc:	02055693          	srli	a3,a0,0x20
    800022c0:	00d70623          	sb	a3,12(a4)
    800022c4:	02855693          	srli	a3,a0,0x28
    800022c8:	00d706a3          	sb	a3,13(a4)
    800022cc:	03055693          	srli	a3,a0,0x30
    800022d0:	00d70723          	sb	a3,14(a4)
    800022d4:	03855693          	srli	a3,a0,0x38
    800022d8:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    800022dc:	08a93423          	sd	a0,136(s2)
    dispatch();
    800022e0:	00000097          	auipc	ra,0x0
    800022e4:	e94080e7          	jalr	-364(ra) # 80002174 <_ZN7_thread8dispatchEv>
}
    800022e8:	01813083          	ld	ra,24(sp)
    800022ec:	01013403          	ld	s0,16(sp)
    800022f0:	00813483          	ld	s1,8(sp)
    800022f4:	00013903          	ld	s2,0(sp)
    800022f8:	02010113          	addi	sp,sp,32
    800022fc:	00008067          	ret
        thread->joinHead = newJoin;
    80002300:	08a93023          	sd	a0,128(s2)
        thread->joinTail = newJoin;
    80002304:	08a93423          	sd	a0,136(s2)
    80002308:	fd9ff06f          	j	800022e0 <_ZN7_thread4joinEPS_+0xf0>

000000008000230c <_ZN7_thread4exitEv>:
    if(currentThread->closed){
    8000230c:	00005717          	auipc	a4,0x5
    80002310:	a9473703          	ld	a4,-1388(a4) # 80006da0 <_ZN7_thread13currentThreadE>
    80002314:	0a072783          	lw	a5,160(a4)
    80002318:	0017f693          	andi	a3,a5,1
    8000231c:	04069663          	bnez	a3,80002368 <_ZN7_thread4exitEv+0x5c>
    if(currentThread->blocked){
    80002320:	0027f693          	andi	a3,a5,2
    80002324:	04069663          	bnez	a3,80002370 <_ZN7_thread4exitEv+0x64>
    if(currentThread->sleeping){
    80002328:	0047f793          	andi	a5,a5,4
    8000232c:	04079663          	bnez	a5,80002378 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    80002330:	ff010113          	addi	sp,sp,-16
    80002334:	00113423          	sd	ra,8(sp)
    80002338:	00813023          	sd	s0,0(sp)
    8000233c:	01010413          	addi	s0,sp,16
    currentThread->finished = 1;
    80002340:	0a072783          	lw	a5,160(a4)
    80002344:	0087e793          	ori	a5,a5,8
    80002348:	0af72023          	sw	a5,160(a4)
    dispatch();
    8000234c:	00000097          	auipc	ra,0x0
    80002350:	e28080e7          	jalr	-472(ra) # 80002174 <_ZN7_thread8dispatchEv>
    return 0;
    80002354:	00000513          	li	a0,0
}
    80002358:	00813083          	ld	ra,8(sp)
    8000235c:	00013403          	ld	s0,0(sp)
    80002360:	01010113          	addi	sp,sp,16
    80002364:	00008067          	ret
        return -1;
    80002368:	fff00513          	li	a0,-1
    8000236c:	00008067          	ret
        return -2;
    80002370:	ffe00513          	li	a0,-2
    80002374:	00008067          	ret
        return -3;
    80002378:	ffd00513          	li	a0,-3
}
    8000237c:	00008067          	ret

0000000080002380 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80002380:	fe010113          	addi	sp,sp,-32
    80002384:	00113c23          	sd	ra,24(sp)
    80002388:	00813823          	sd	s0,16(sp)
    8000238c:	00913423          	sd	s1,8(sp)
    80002390:	02010413          	addi	s0,sp,32
    popSppSpie();
    80002394:	00000097          	auipc	ra,0x0
    80002398:	97c080e7          	jalr	-1668(ra) # 80001d10 <_Z10popSppSpiev>
    currentThread->function(currentThread->arg);
    8000239c:	00005497          	auipc	s1,0x5
    800023a0:	9fc48493          	addi	s1,s1,-1540 # 80006d98 <_ZN7_thread6nextIDE>
    800023a4:	0084b783          	ld	a5,8(s1)
    800023a8:	0a87b703          	ld	a4,168(a5)
    800023ac:	0b07b503          	ld	a0,176(a5)
    800023b0:	000700e7          	jalr	a4
    currentThread->unJoin();
    800023b4:	0084b503          	ld	a0,8(s1)
    800023b8:	00000097          	auipc	ra,0x0
    800023bc:	978080e7          	jalr	-1672(ra) # 80001d30 <_ZN7_thread6unJoinEv>
    exit();
    800023c0:	00000097          	auipc	ra,0x0
    800023c4:	f4c080e7          	jalr	-180(ra) # 8000230c <_ZN7_thread4exitEv>
}
    800023c8:	01813083          	ld	ra,24(sp)
    800023cc:	01013403          	ld	s0,16(sp)
    800023d0:	00813483          	ld	s1,8(sp)
    800023d4:	02010113          	addi	sp,sp,32
    800023d8:	00008067          	ret

00000000800023dc <_ZN11HeapManagerC1Ev>:
#include "heapManager.h"
#include "hw.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    800023dc:	fe010113          	addi	sp,sp,-32
    800023e0:	00113c23          	sd	ra,24(sp)
    800023e4:	00813823          	sd	s0,16(sp)
    800023e8:	00913423          	sd	s1,8(sp)
    800023ec:	02010413          	addi	s0,sp,32
    800023f0:	00050493          	mv	s1,a0
    assert(instance == 0);
    800023f4:	00005797          	auipc	a5,0x5
    800023f8:	9b47b783          	ld	a5,-1612(a5) # 80006da8 <_ZN11HeapManager8instanceE>
    800023fc:	02079063          	bnez	a5,8000241c <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80002400:	00005797          	auipc	a5,0x5
    80002404:	9a97b423          	sd	s1,-1624(a5) # 80006da8 <_ZN11HeapManager8instanceE>
}
    80002408:	01813083          	ld	ra,24(sp)
    8000240c:	01013403          	ld	s0,16(sp)
    80002410:	00813483          	ld	s1,8(sp)
    80002414:	02010113          	addi	sp,sp,32
    80002418:	00008067          	ret
    assert(instance == 0);
    8000241c:	01200593          	li	a1,18
    80002420:	00004517          	auipc	a0,0x4
    80002424:	c2050513          	addi	a0,a0,-992 # 80006040 <CONSOLE_STATUS+0x30>
    80002428:	fffff097          	auipc	ra,0xfffff
    8000242c:	3dc080e7          	jalr	988(ra) # 80001804 <_Z13assert_failedPKci>
    80002430:	fd1ff06f          	j	80002400 <_ZN11HeapManagerC1Ev+0x24>

0000000080002434 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80002434:	ff010113          	addi	sp,sp,-16
    80002438:	00813423          	sd	s0,8(sp)
    8000243c:	01010413          	addi	s0,sp,16
    
}
    80002440:	00813403          	ld	s0,8(sp)
    80002444:	01010113          	addi	sp,sp,16
    80002448:	00008067          	ret

000000008000244c <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    8000244c:	fd010113          	addi	sp,sp,-48
    80002450:	02113423          	sd	ra,40(sp)
    80002454:	02813023          	sd	s0,32(sp)
    80002458:	00913c23          	sd	s1,24(sp)
    8000245c:	01213823          	sd	s2,16(sp)
    80002460:	01313423          	sd	s3,8(sp)
    80002464:	03010413          	addi	s0,sp,48
    80002468:	00050913          	mv	s2,a0
    8000246c:	00058993          	mv	s3,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002470:	40b604b3          	sub	s1,a2,a1
    80002474:	0414b793          	sltiu	a5,s1,65
    80002478:	0c079c63          	bnez	a5,80002550 <_ZN11HeapManager4initEmm+0x104>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    8000247c:	01393023          	sd	s3,0(s2)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80002480:	fde00793          	li	a5,-34
    80002484:	00f98c23          	sb	a5,24(s3)
    80002488:	fc000713          	li	a4,-64
    8000248c:	00e98ca3          	sb	a4,25(s3)
    80002490:	fad00713          	li	a4,-83
    80002494:	00e98d23          	sb	a4,26(s3)
    80002498:	00f98da3          	sb	a5,27(s3)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    8000249c:	0064d613          	srli	a2,s1,0x6
    800024a0:	00093783          	ld	a5,0(s2)
    800024a4:	fff60613          	addi	a2,a2,-1
    800024a8:	00c78823          	sb	a2,16(a5)
    800024ac:	00865713          	srli	a4,a2,0x8
    800024b0:	00e788a3          	sb	a4,17(a5)
    800024b4:	01065713          	srli	a4,a2,0x10
    800024b8:	00e78923          	sb	a4,18(a5)
    800024bc:	0186571b          	srliw	a4,a2,0x18
    800024c0:	00e789a3          	sb	a4,19(a5)
    800024c4:	02065713          	srli	a4,a2,0x20
    800024c8:	00e78a23          	sb	a4,20(a5)
    800024cc:	02865713          	srli	a4,a2,0x28
    800024d0:	00e78aa3          	sb	a4,21(a5)
    800024d4:	03065713          	srli	a4,a2,0x30
    800024d8:	00e78b23          	sb	a4,22(a5)
    800024dc:	03865613          	srli	a2,a2,0x38
    800024e0:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    800024e4:	00093783          	ld	a5,0(s2)
    800024e8:	00078023          	sb	zero,0(a5)
    800024ec:	000780a3          	sb	zero,1(a5)
    800024f0:	00078123          	sb	zero,2(a5)
    800024f4:	000781a3          	sb	zero,3(a5)
    800024f8:	00078223          	sb	zero,4(a5)
    800024fc:	000782a3          	sb	zero,5(a5)
    80002500:	00078323          	sb	zero,6(a5)
    80002504:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80002508:	00093783          	ld	a5,0(s2)
    8000250c:	00078423          	sb	zero,8(a5)
    80002510:	000784a3          	sb	zero,9(a5)
    80002514:	00078523          	sb	zero,10(a5)
    80002518:	000785a3          	sb	zero,11(a5)
    8000251c:	00078623          	sb	zero,12(a5)
    80002520:	000786a3          	sb	zero,13(a5)
    80002524:	00078723          	sb	zero,14(a5)
    80002528:	000787a3          	sb	zero,15(a5)
    m_pTail = m_pHead;
    8000252c:	00093783          	ld	a5,0(s2)
    80002530:	00f93423          	sd	a5,8(s2)
}
    80002534:	02813083          	ld	ra,40(sp)
    80002538:	02013403          	ld	s0,32(sp)
    8000253c:	01813483          	ld	s1,24(sp)
    80002540:	01013903          	ld	s2,16(sp)
    80002544:	00813983          	ld	s3,8(sp)
    80002548:	03010113          	addi	sp,sp,48
    8000254c:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002550:	01b00593          	li	a1,27
    80002554:	00004517          	auipc	a0,0x4
    80002558:	aec50513          	addi	a0,a0,-1300 # 80006040 <CONSOLE_STATUS+0x30>
    8000255c:	fffff097          	auipc	ra,0xfffff
    80002560:	2a8080e7          	jalr	680(ra) # 80001804 <_Z13assert_failedPKci>
    80002564:	f19ff06f          	j	8000247c <_ZN11HeapManager4initEmm+0x30>

0000000080002568 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80002568:	fe010113          	addi	sp,sp,-32
    8000256c:	00113c23          	sd	ra,24(sp)
    80002570:	00813823          	sd	s0,16(sp)
    80002574:	00913423          	sd	s1,8(sp)
    80002578:	01213023          	sd	s2,0(sp)
    8000257c:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002580:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80002584:	00000913          	li	s2,0
    80002588:	0b80006f          	j	80002640 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    8000258c:	0104c783          	lbu	a5,16(s1)
    80002590:	0114c703          	lbu	a4,17(s1)
    80002594:	00871713          	slli	a4,a4,0x8
    80002598:	00f76733          	or	a4,a4,a5
    8000259c:	0124c783          	lbu	a5,18(s1)
    800025a0:	01079793          	slli	a5,a5,0x10
    800025a4:	00e7e733          	or	a4,a5,a4
    800025a8:	0134c783          	lbu	a5,19(s1)
    800025ac:	01879793          	slli	a5,a5,0x18
    800025b0:	00e7e7b3          	or	a5,a5,a4
    800025b4:	0144c703          	lbu	a4,20(s1)
    800025b8:	02071713          	slli	a4,a4,0x20
    800025bc:	00f767b3          	or	a5,a4,a5
    800025c0:	0154c703          	lbu	a4,21(s1)
    800025c4:	02871713          	slli	a4,a4,0x28
    800025c8:	00f76733          	or	a4,a4,a5
    800025cc:	0164c783          	lbu	a5,22(s1)
    800025d0:	03079793          	slli	a5,a5,0x30
    800025d4:	00e7e733          	or	a4,a5,a4
    800025d8:	0174c783          	lbu	a5,23(s1)
    800025dc:	03879793          	slli	a5,a5,0x38
    800025e0:	00e7e7b3          	or	a5,a5,a4
    800025e4:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    800025e8:	0004c703          	lbu	a4,0(s1)
    800025ec:	0014c783          	lbu	a5,1(s1)
    800025f0:	00879793          	slli	a5,a5,0x8
    800025f4:	00e7e733          	or	a4,a5,a4
    800025f8:	0024c783          	lbu	a5,2(s1)
    800025fc:	01079793          	slli	a5,a5,0x10
    80002600:	00e7e7b3          	or	a5,a5,a4
    80002604:	0034c703          	lbu	a4,3(s1)
    80002608:	01871713          	slli	a4,a4,0x18
    8000260c:	00f767b3          	or	a5,a4,a5
    80002610:	0044c703          	lbu	a4,4(s1)
    80002614:	02071713          	slli	a4,a4,0x20
    80002618:	00f76733          	or	a4,a4,a5
    8000261c:	0054c783          	lbu	a5,5(s1)
    80002620:	02879793          	slli	a5,a5,0x28
    80002624:	00e7e733          	or	a4,a5,a4
    80002628:	0064c783          	lbu	a5,6(s1)
    8000262c:	03079793          	slli	a5,a5,0x30
    80002630:	00e7e7b3          	or	a5,a5,a4
    80002634:	0074c483          	lbu	s1,7(s1)
    80002638:	03849493          	slli	s1,s1,0x38
    8000263c:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002640:	04048a63          	beqz	s1,80002694 <_ZN11HeapManager17getHeapFreeMemoryEv+0x12c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002644:	0184c783          	lbu	a5,24(s1)
    80002648:	0194c703          	lbu	a4,25(s1)
    8000264c:	00871713          	slli	a4,a4,0x8
    80002650:	00f76733          	or	a4,a4,a5
    80002654:	01a4c783          	lbu	a5,26(s1)
    80002658:	01079793          	slli	a5,a5,0x10
    8000265c:	00e7e733          	or	a4,a5,a4
    80002660:	01b4c783          	lbu	a5,27(s1)
    80002664:	01879793          	slli	a5,a5,0x18
    80002668:	00e7e7b3          	or	a5,a5,a4
    8000266c:	0007879b          	sext.w	a5,a5
    80002670:	deadc737          	lui	a4,0xdeadc
    80002674:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead40be>
    80002678:	f0e78ae3          	beq	a5,a4,8000258c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    8000267c:	02900593          	li	a1,41
    80002680:	00004517          	auipc	a0,0x4
    80002684:	9c050513          	addi	a0,a0,-1600 # 80006040 <CONSOLE_STATUS+0x30>
    80002688:	fffff097          	auipc	ra,0xfffff
    8000268c:	17c080e7          	jalr	380(ra) # 80001804 <_Z13assert_failedPKci>
    80002690:	efdff06f          	j	8000258c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80002694:	00090513          	mv	a0,s2
    80002698:	01813083          	ld	ra,24(sp)
    8000269c:	01013403          	ld	s0,16(sp)
    800026a0:	00813483          	ld	s1,8(sp)
    800026a4:	00013903          	ld	s2,0(sp)
    800026a8:	02010113          	addi	sp,sp,32
    800026ac:	00008067          	ret

00000000800026b0 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    800026b0:	fd010113          	addi	sp,sp,-48
    800026b4:	02113423          	sd	ra,40(sp)
    800026b8:	02813023          	sd	s0,32(sp)
    800026bc:	00913c23          	sd	s1,24(sp)
    800026c0:	01213823          	sd	s2,16(sp)
    800026c4:	01313423          	sd	s3,8(sp)
    800026c8:	03010413          	addi	s0,sp,48
    800026cc:	00050993          	mv	s3,a0
    800026d0:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    800026d4:	00053483          	ld	s1,0(a0)
    800026d8:	0b80006f          	j	80002790 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    800026dc:	0104c783          	lbu	a5,16(s1)
    800026e0:	0114c703          	lbu	a4,17(s1)
    800026e4:	00871713          	slli	a4,a4,0x8
    800026e8:	00f76733          	or	a4,a4,a5
    800026ec:	0124c783          	lbu	a5,18(s1)
    800026f0:	01079793          	slli	a5,a5,0x10
    800026f4:	00e7e733          	or	a4,a5,a4
    800026f8:	0134c783          	lbu	a5,19(s1)
    800026fc:	01879793          	slli	a5,a5,0x18
    80002700:	00e7e7b3          	or	a5,a5,a4
    80002704:	0144c703          	lbu	a4,20(s1)
    80002708:	02071713          	slli	a4,a4,0x20
    8000270c:	00f767b3          	or	a5,a4,a5
    80002710:	0154c703          	lbu	a4,21(s1)
    80002714:	02871713          	slli	a4,a4,0x28
    80002718:	00f76733          	or	a4,a4,a5
    8000271c:	0164c783          	lbu	a5,22(s1)
    80002720:	03079793          	slli	a5,a5,0x30
    80002724:	00e7e733          	or	a4,a5,a4
    80002728:	0174c783          	lbu	a5,23(s1)
    8000272c:	03879793          	slli	a5,a5,0x38
    80002730:	00e7e7b3          	or	a5,a5,a4
    80002734:	0b27f863          	bgeu	a5,s2,800027e4 <_ZN11HeapManager12heapAllocateEm+0x134>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80002738:	0004c703          	lbu	a4,0(s1)
    8000273c:	0014c783          	lbu	a5,1(s1)
    80002740:	00879793          	slli	a5,a5,0x8
    80002744:	00e7e733          	or	a4,a5,a4
    80002748:	0024c783          	lbu	a5,2(s1)
    8000274c:	01079793          	slli	a5,a5,0x10
    80002750:	00e7e7b3          	or	a5,a5,a4
    80002754:	0034c703          	lbu	a4,3(s1)
    80002758:	01871713          	slli	a4,a4,0x18
    8000275c:	00f767b3          	or	a5,a4,a5
    80002760:	0044c703          	lbu	a4,4(s1)
    80002764:	02071713          	slli	a4,a4,0x20
    80002768:	00f76733          	or	a4,a4,a5
    8000276c:	0054c783          	lbu	a5,5(s1)
    80002770:	02879793          	slli	a5,a5,0x28
    80002774:	00e7e733          	or	a4,a5,a4
    80002778:	0064c783          	lbu	a5,6(s1)
    8000277c:	03079793          	slli	a5,a5,0x30
    80002780:	00e7e7b3          	or	a5,a5,a4
    80002784:	0074c483          	lbu	s1,7(s1)
    80002788:	03849493          	slli	s1,s1,0x38
    8000278c:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002790:	4e048863          	beqz	s1,80002c80 <_ZN11HeapManager12heapAllocateEm+0x5d0>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002794:	0184c783          	lbu	a5,24(s1)
    80002798:	0194c703          	lbu	a4,25(s1)
    8000279c:	00871713          	slli	a4,a4,0x8
    800027a0:	00f76733          	or	a4,a4,a5
    800027a4:	01a4c783          	lbu	a5,26(s1)
    800027a8:	01079793          	slli	a5,a5,0x10
    800027ac:	00e7e733          	or	a4,a5,a4
    800027b0:	01b4c783          	lbu	a5,27(s1)
    800027b4:	01879793          	slli	a5,a5,0x18
    800027b8:	00e7e7b3          	or	a5,a5,a4
    800027bc:	0007879b          	sext.w	a5,a5
    800027c0:	deadc737          	lui	a4,0xdeadc
    800027c4:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead40be>
    800027c8:	f0e78ae3          	beq	a5,a4,800026dc <_ZN11HeapManager12heapAllocateEm+0x2c>
    800027cc:	03300593          	li	a1,51
    800027d0:	00004517          	auipc	a0,0x4
    800027d4:	87050513          	addi	a0,a0,-1936 # 80006040 <CONSOLE_STATUS+0x30>
    800027d8:	fffff097          	auipc	ra,0xfffff
    800027dc:	02c080e7          	jalr	44(ra) # 80001804 <_Z13assert_failedPKci>
    800027e0:	efdff06f          	j	800026dc <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    800027e4:	00190713          	addi	a4,s2,1
    800027e8:	2af77263          	bgeu	a4,a5,80002a8c <_ZN11HeapManager12heapAllocateEm+0x3dc>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    800027ec:	00671793          	slli	a5,a4,0x6
    800027f0:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    800027f4:	fde00713          	li	a4,-34
    800027f8:	00e78c23          	sb	a4,24(a5)
    800027fc:	fc000693          	li	a3,-64
    80002800:	00d78ca3          	sb	a3,25(a5)
    80002804:	fad00693          	li	a3,-83
    80002808:	00d78d23          	sb	a3,26(a5)
    8000280c:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80002810:	0104c703          	lbu	a4,16(s1)
    80002814:	0114c683          	lbu	a3,17(s1)
    80002818:	00869693          	slli	a3,a3,0x8
    8000281c:	00e6e6b3          	or	a3,a3,a4
    80002820:	0124c703          	lbu	a4,18(s1)
    80002824:	01071713          	slli	a4,a4,0x10
    80002828:	00d766b3          	or	a3,a4,a3
    8000282c:	0134c703          	lbu	a4,19(s1)
    80002830:	01871713          	slli	a4,a4,0x18
    80002834:	00d76733          	or	a4,a4,a3
    80002838:	0144c683          	lbu	a3,20(s1)
    8000283c:	02069693          	slli	a3,a3,0x20
    80002840:	00e6e733          	or	a4,a3,a4
    80002844:	0154c683          	lbu	a3,21(s1)
    80002848:	02869693          	slli	a3,a3,0x28
    8000284c:	00e6e6b3          	or	a3,a3,a4
    80002850:	0164c703          	lbu	a4,22(s1)
    80002854:	03071713          	slli	a4,a4,0x30
    80002858:	00d766b3          	or	a3,a4,a3
    8000285c:	0174c703          	lbu	a4,23(s1)
    80002860:	03871713          	slli	a4,a4,0x38
    80002864:	00d76733          	or	a4,a4,a3
    80002868:	41270733          	sub	a4,a4,s2
    8000286c:	fff70713          	addi	a4,a4,-1
    80002870:	00e78823          	sb	a4,16(a5)
    80002874:	00875693          	srli	a3,a4,0x8
    80002878:	00d788a3          	sb	a3,17(a5)
    8000287c:	01075693          	srli	a3,a4,0x10
    80002880:	00d78923          	sb	a3,18(a5)
    80002884:	0187569b          	srliw	a3,a4,0x18
    80002888:	00d789a3          	sb	a3,19(a5)
    8000288c:	02075693          	srli	a3,a4,0x20
    80002890:	00d78a23          	sb	a3,20(a5)
    80002894:	02875693          	srli	a3,a4,0x28
    80002898:	00d78aa3          	sb	a3,21(a5)
    8000289c:	03075693          	srli	a3,a4,0x30
    800028a0:	00d78b23          	sb	a3,22(a5)
    800028a4:	03875713          	srli	a4,a4,0x38
    800028a8:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    800028ac:	0004c703          	lbu	a4,0(s1)
    800028b0:	0014c683          	lbu	a3,1(s1)
    800028b4:	00869693          	slli	a3,a3,0x8
    800028b8:	00e6e733          	or	a4,a3,a4
    800028bc:	0024c683          	lbu	a3,2(s1)
    800028c0:	01069693          	slli	a3,a3,0x10
    800028c4:	00e6e6b3          	or	a3,a3,a4
    800028c8:	0034c703          	lbu	a4,3(s1)
    800028cc:	01871713          	slli	a4,a4,0x18
    800028d0:	00d766b3          	or	a3,a4,a3
    800028d4:	0044c703          	lbu	a4,4(s1)
    800028d8:	02071713          	slli	a4,a4,0x20
    800028dc:	00d76733          	or	a4,a4,a3
    800028e0:	0054c683          	lbu	a3,5(s1)
    800028e4:	02869693          	slli	a3,a3,0x28
    800028e8:	00e6e733          	or	a4,a3,a4
    800028ec:	0064c683          	lbu	a3,6(s1)
    800028f0:	03069693          	slli	a3,a3,0x30
    800028f4:	00e6e6b3          	or	a3,a3,a4
    800028f8:	0074c703          	lbu	a4,7(s1)
    800028fc:	03871713          	slli	a4,a4,0x38
    80002900:	00d76733          	or	a4,a4,a3
    80002904:	00d78023          	sb	a3,0(a5)
    80002908:	00875693          	srli	a3,a4,0x8
    8000290c:	00d780a3          	sb	a3,1(a5)
    80002910:	01075693          	srli	a3,a4,0x10
    80002914:	00d78123          	sb	a3,2(a5)
    80002918:	0187569b          	srliw	a3,a4,0x18
    8000291c:	00d781a3          	sb	a3,3(a5)
    80002920:	02075693          	srli	a3,a4,0x20
    80002924:	00d78223          	sb	a3,4(a5)
    80002928:	02875693          	srli	a3,a4,0x28
    8000292c:	00d782a3          	sb	a3,5(a5)
    80002930:	03075693          	srli	a3,a4,0x30
    80002934:	00d78323          	sb	a3,6(a5)
    80002938:	03875713          	srli	a4,a4,0x38
    8000293c:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80002940:	00978423          	sb	s1,8(a5)
    80002944:	0084d713          	srli	a4,s1,0x8
    80002948:	00e784a3          	sb	a4,9(a5)
    8000294c:	0104d713          	srli	a4,s1,0x10
    80002950:	00e78523          	sb	a4,10(a5)
    80002954:	0184d71b          	srliw	a4,s1,0x18
    80002958:	00e785a3          	sb	a4,11(a5)
    8000295c:	0204d713          	srli	a4,s1,0x20
    80002960:	00e78623          	sb	a4,12(a5)
    80002964:	0284d713          	srli	a4,s1,0x28
    80002968:	00e786a3          	sb	a4,13(a5)
    8000296c:	0304d713          	srli	a4,s1,0x30
    80002970:	00e78723          	sb	a4,14(a5)
    80002974:	0384d713          	srli	a4,s1,0x38
    80002978:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    8000297c:	0004c703          	lbu	a4,0(s1)
    80002980:	0014c683          	lbu	a3,1(s1)
    80002984:	00869693          	slli	a3,a3,0x8
    80002988:	00e6e6b3          	or	a3,a3,a4
    8000298c:	0024c703          	lbu	a4,2(s1)
    80002990:	01071713          	slli	a4,a4,0x10
    80002994:	00d766b3          	or	a3,a4,a3
    80002998:	0034c703          	lbu	a4,3(s1)
    8000299c:	01871713          	slli	a4,a4,0x18
    800029a0:	00d76733          	or	a4,a4,a3
    800029a4:	0044c683          	lbu	a3,4(s1)
    800029a8:	02069693          	slli	a3,a3,0x20
    800029ac:	00e6e733          	or	a4,a3,a4
    800029b0:	0054c683          	lbu	a3,5(s1)
    800029b4:	02869693          	slli	a3,a3,0x28
    800029b8:	00e6e6b3          	or	a3,a3,a4
    800029bc:	0064c703          	lbu	a4,6(s1)
    800029c0:	03071713          	slli	a4,a4,0x30
    800029c4:	00d766b3          	or	a3,a4,a3
    800029c8:	0074c703          	lbu	a4,7(s1)
    800029cc:	03871713          	slli	a4,a4,0x38
    800029d0:	00d76733          	or	a4,a4,a3
    800029d4:	04070063          	beqz	a4,80002a14 <_ZN11HeapManager12heapAllocateEm+0x364>
                    pCurrent->pNext->pPrev = pNew;
    800029d8:	00f70423          	sb	a5,8(a4)
    800029dc:	0087d693          	srli	a3,a5,0x8
    800029e0:	00d704a3          	sb	a3,9(a4)
    800029e4:	0107d693          	srli	a3,a5,0x10
    800029e8:	00d70523          	sb	a3,10(a4)
    800029ec:	0187d69b          	srliw	a3,a5,0x18
    800029f0:	00d705a3          	sb	a3,11(a4)
    800029f4:	0207d693          	srli	a3,a5,0x20
    800029f8:	00d70623          	sb	a3,12(a4)
    800029fc:	0287d693          	srli	a3,a5,0x28
    80002a00:	00d706a3          	sb	a3,13(a4)
    80002a04:	0307d693          	srli	a3,a5,0x30
    80002a08:	00d70723          	sb	a3,14(a4)
    80002a0c:	0387d693          	srli	a3,a5,0x38
    80002a10:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80002a14:	00f48023          	sb	a5,0(s1)
    80002a18:	0087d713          	srli	a4,a5,0x8
    80002a1c:	00e480a3          	sb	a4,1(s1)
    80002a20:	0107d713          	srli	a4,a5,0x10
    80002a24:	00e48123          	sb	a4,2(s1)
    80002a28:	0187d71b          	srliw	a4,a5,0x18
    80002a2c:	00e481a3          	sb	a4,3(s1)
    80002a30:	0207d713          	srli	a4,a5,0x20
    80002a34:	00e48223          	sb	a4,4(s1)
    80002a38:	0287d713          	srli	a4,a5,0x28
    80002a3c:	00e482a3          	sb	a4,5(s1)
    80002a40:	0307d713          	srli	a4,a5,0x30
    80002a44:	00e48323          	sb	a4,6(s1)
    80002a48:	0387d793          	srli	a5,a5,0x38
    80002a4c:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80002a50:	01248823          	sb	s2,16(s1)
    80002a54:	00895793          	srli	a5,s2,0x8
    80002a58:	00f488a3          	sb	a5,17(s1)
    80002a5c:	01095793          	srli	a5,s2,0x10
    80002a60:	00f48923          	sb	a5,18(s1)
    80002a64:	0189579b          	srliw	a5,s2,0x18
    80002a68:	00f489a3          	sb	a5,19(s1)
    80002a6c:	02095793          	srli	a5,s2,0x20
    80002a70:	00f48a23          	sb	a5,20(s1)
    80002a74:	02895793          	srli	a5,s2,0x28
    80002a78:	00f48aa3          	sb	a5,21(s1)
    80002a7c:	03095793          	srli	a5,s2,0x30
    80002a80:	00f48b23          	sb	a5,22(s1)
    80002a84:	03895913          	srli	s2,s2,0x38
    80002a88:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80002a8c:	0009b783          	ld	a5,0(s3)
    80002a90:	20978863          	beq	a5,s1,80002ca0 <_ZN11HeapManager12heapAllocateEm+0x5f0>
            if(pCurrent == m_pTail){
    80002a94:	0089b783          	ld	a5,8(s3)
    80002a98:	26978463          	beq	a5,s1,80002d00 <_ZN11HeapManager12heapAllocateEm+0x650>
            if(pCurrent->pPrev != 0){
    80002a9c:	0084c783          	lbu	a5,8(s1)
    80002aa0:	0094c703          	lbu	a4,9(s1)
    80002aa4:	00871713          	slli	a4,a4,0x8
    80002aa8:	00f76733          	or	a4,a4,a5
    80002aac:	00a4c783          	lbu	a5,10(s1)
    80002ab0:	01079793          	slli	a5,a5,0x10
    80002ab4:	00e7e733          	or	a4,a5,a4
    80002ab8:	00b4c783          	lbu	a5,11(s1)
    80002abc:	01879793          	slli	a5,a5,0x18
    80002ac0:	00e7e7b3          	or	a5,a5,a4
    80002ac4:	00c4c703          	lbu	a4,12(s1)
    80002ac8:	02071713          	slli	a4,a4,0x20
    80002acc:	00f767b3          	or	a5,a4,a5
    80002ad0:	00d4c703          	lbu	a4,13(s1)
    80002ad4:	02871713          	slli	a4,a4,0x28
    80002ad8:	00f76733          	or	a4,a4,a5
    80002adc:	00e4c783          	lbu	a5,14(s1)
    80002ae0:	03079793          	slli	a5,a5,0x30
    80002ae4:	00e7e733          	or	a4,a5,a4
    80002ae8:	00f4c783          	lbu	a5,15(s1)
    80002aec:	03879793          	slli	a5,a5,0x38
    80002af0:	00e7e7b3          	or	a5,a5,a4
    80002af4:	08078c63          	beqz	a5,80002b8c <_ZN11HeapManager12heapAllocateEm+0x4dc>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80002af8:	0004c703          	lbu	a4,0(s1)
    80002afc:	0014c683          	lbu	a3,1(s1)
    80002b00:	00869693          	slli	a3,a3,0x8
    80002b04:	00e6e733          	or	a4,a3,a4
    80002b08:	0024c683          	lbu	a3,2(s1)
    80002b0c:	01069693          	slli	a3,a3,0x10
    80002b10:	00e6e6b3          	or	a3,a3,a4
    80002b14:	0034c703          	lbu	a4,3(s1)
    80002b18:	01871713          	slli	a4,a4,0x18
    80002b1c:	00d766b3          	or	a3,a4,a3
    80002b20:	0044c703          	lbu	a4,4(s1)
    80002b24:	02071713          	slli	a4,a4,0x20
    80002b28:	00d76733          	or	a4,a4,a3
    80002b2c:	0054c683          	lbu	a3,5(s1)
    80002b30:	02869693          	slli	a3,a3,0x28
    80002b34:	00e6e733          	or	a4,a3,a4
    80002b38:	0064c683          	lbu	a3,6(s1)
    80002b3c:	03069693          	slli	a3,a3,0x30
    80002b40:	00e6e6b3          	or	a3,a3,a4
    80002b44:	0074c703          	lbu	a4,7(s1)
    80002b48:	03871713          	slli	a4,a4,0x38
    80002b4c:	00d76733          	or	a4,a4,a3
    80002b50:	00d78023          	sb	a3,0(a5)
    80002b54:	00875693          	srli	a3,a4,0x8
    80002b58:	00d780a3          	sb	a3,1(a5)
    80002b5c:	01075693          	srli	a3,a4,0x10
    80002b60:	00d78123          	sb	a3,2(a5)
    80002b64:	0187569b          	srliw	a3,a4,0x18
    80002b68:	00d781a3          	sb	a3,3(a5)
    80002b6c:	02075693          	srli	a3,a4,0x20
    80002b70:	00d78223          	sb	a3,4(a5)
    80002b74:	02875693          	srli	a3,a4,0x28
    80002b78:	00d782a3          	sb	a3,5(a5)
    80002b7c:	03075693          	srli	a3,a4,0x30
    80002b80:	00d78323          	sb	a3,6(a5)
    80002b84:	03875713          	srli	a4,a4,0x38
    80002b88:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80002b8c:	0004c783          	lbu	a5,0(s1)
    80002b90:	0014c703          	lbu	a4,1(s1)
    80002b94:	00871713          	slli	a4,a4,0x8
    80002b98:	00f76733          	or	a4,a4,a5
    80002b9c:	0024c783          	lbu	a5,2(s1)
    80002ba0:	01079793          	slli	a5,a5,0x10
    80002ba4:	00e7e733          	or	a4,a5,a4
    80002ba8:	0034c783          	lbu	a5,3(s1)
    80002bac:	01879793          	slli	a5,a5,0x18
    80002bb0:	00e7e7b3          	or	a5,a5,a4
    80002bb4:	0044c703          	lbu	a4,4(s1)
    80002bb8:	02071713          	slli	a4,a4,0x20
    80002bbc:	00f767b3          	or	a5,a4,a5
    80002bc0:	0054c703          	lbu	a4,5(s1)
    80002bc4:	02871713          	slli	a4,a4,0x28
    80002bc8:	00f76733          	or	a4,a4,a5
    80002bcc:	0064c783          	lbu	a5,6(s1)
    80002bd0:	03079793          	slli	a5,a5,0x30
    80002bd4:	00e7e733          	or	a4,a5,a4
    80002bd8:	0074c783          	lbu	a5,7(s1)
    80002bdc:	03879793          	slli	a5,a5,0x38
    80002be0:	00e7e7b3          	or	a5,a5,a4
    80002be4:	08078c63          	beqz	a5,80002c7c <_ZN11HeapManager12heapAllocateEm+0x5cc>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80002be8:	0084c703          	lbu	a4,8(s1)
    80002bec:	0094c683          	lbu	a3,9(s1)
    80002bf0:	00869693          	slli	a3,a3,0x8
    80002bf4:	00e6e733          	or	a4,a3,a4
    80002bf8:	00a4c683          	lbu	a3,10(s1)
    80002bfc:	01069693          	slli	a3,a3,0x10
    80002c00:	00e6e6b3          	or	a3,a3,a4
    80002c04:	00b4c703          	lbu	a4,11(s1)
    80002c08:	01871713          	slli	a4,a4,0x18
    80002c0c:	00d766b3          	or	a3,a4,a3
    80002c10:	00c4c703          	lbu	a4,12(s1)
    80002c14:	02071713          	slli	a4,a4,0x20
    80002c18:	00d76733          	or	a4,a4,a3
    80002c1c:	00d4c683          	lbu	a3,13(s1)
    80002c20:	02869693          	slli	a3,a3,0x28
    80002c24:	00e6e733          	or	a4,a3,a4
    80002c28:	00e4c683          	lbu	a3,14(s1)
    80002c2c:	03069693          	slli	a3,a3,0x30
    80002c30:	00e6e6b3          	or	a3,a3,a4
    80002c34:	00f4c703          	lbu	a4,15(s1)
    80002c38:	03871713          	slli	a4,a4,0x38
    80002c3c:	00d76733          	or	a4,a4,a3
    80002c40:	00d78423          	sb	a3,8(a5)
    80002c44:	00875693          	srli	a3,a4,0x8
    80002c48:	00d784a3          	sb	a3,9(a5)
    80002c4c:	01075693          	srli	a3,a4,0x10
    80002c50:	00d78523          	sb	a3,10(a5)
    80002c54:	0187569b          	srliw	a3,a4,0x18
    80002c58:	00d785a3          	sb	a3,11(a5)
    80002c5c:	02075693          	srli	a3,a4,0x20
    80002c60:	00d78623          	sb	a3,12(a5)
    80002c64:	02875693          	srli	a3,a4,0x28
    80002c68:	00d786a3          	sb	a3,13(a5)
    80002c6c:	03075693          	srli	a3,a4,0x30
    80002c70:	00d78723          	sb	a3,14(a5)
    80002c74:	03875713          	srli	a4,a4,0x38
    80002c78:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    80002c7c:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80002c80:	00048513          	mv	a0,s1
    80002c84:	02813083          	ld	ra,40(sp)
    80002c88:	02013403          	ld	s0,32(sp)
    80002c8c:	01813483          	ld	s1,24(sp)
    80002c90:	01013903          	ld	s2,16(sp)
    80002c94:	00813983          	ld	s3,8(sp)
    80002c98:	03010113          	addi	sp,sp,48
    80002c9c:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80002ca0:	0004c703          	lbu	a4,0(s1)
    80002ca4:	0014c783          	lbu	a5,1(s1)
    80002ca8:	00879793          	slli	a5,a5,0x8
    80002cac:	00e7e7b3          	or	a5,a5,a4
    80002cb0:	0024c703          	lbu	a4,2(s1)
    80002cb4:	01071713          	slli	a4,a4,0x10
    80002cb8:	00f76733          	or	a4,a4,a5
    80002cbc:	0034c783          	lbu	a5,3(s1)
    80002cc0:	01879793          	slli	a5,a5,0x18
    80002cc4:	00e7e733          	or	a4,a5,a4
    80002cc8:	0044c783          	lbu	a5,4(s1)
    80002ccc:	02079793          	slli	a5,a5,0x20
    80002cd0:	00e7e7b3          	or	a5,a5,a4
    80002cd4:	0054c703          	lbu	a4,5(s1)
    80002cd8:	02871713          	slli	a4,a4,0x28
    80002cdc:	00f76733          	or	a4,a4,a5
    80002ce0:	0064c783          	lbu	a5,6(s1)
    80002ce4:	03079793          	slli	a5,a5,0x30
    80002ce8:	00e7e733          	or	a4,a5,a4
    80002cec:	0074c783          	lbu	a5,7(s1)
    80002cf0:	03879793          	slli	a5,a5,0x38
    80002cf4:	00e7e7b3          	or	a5,a5,a4
    80002cf8:	00f9b023          	sd	a5,0(s3)
    80002cfc:	d99ff06f          	j	80002a94 <_ZN11HeapManager12heapAllocateEm+0x3e4>
                m_pTail = pCurrent->pPrev;
    80002d00:	0084c703          	lbu	a4,8(s1)
    80002d04:	0094c783          	lbu	a5,9(s1)
    80002d08:	00879793          	slli	a5,a5,0x8
    80002d0c:	00e7e7b3          	or	a5,a5,a4
    80002d10:	00a4c703          	lbu	a4,10(s1)
    80002d14:	01071713          	slli	a4,a4,0x10
    80002d18:	00f76733          	or	a4,a4,a5
    80002d1c:	00b4c783          	lbu	a5,11(s1)
    80002d20:	01879793          	slli	a5,a5,0x18
    80002d24:	00e7e733          	or	a4,a5,a4
    80002d28:	00c4c783          	lbu	a5,12(s1)
    80002d2c:	02079793          	slli	a5,a5,0x20
    80002d30:	00e7e7b3          	or	a5,a5,a4
    80002d34:	00d4c703          	lbu	a4,13(s1)
    80002d38:	02871713          	slli	a4,a4,0x28
    80002d3c:	00f76733          	or	a4,a4,a5
    80002d40:	00e4c783          	lbu	a5,14(s1)
    80002d44:	03079793          	slli	a5,a5,0x30
    80002d48:	00e7e733          	or	a4,a5,a4
    80002d4c:	00f4c783          	lbu	a5,15(s1)
    80002d50:	03879793          	slli	a5,a5,0x38
    80002d54:	00e7e7b3          	or	a5,a5,a4
    80002d58:	00f9b423          	sd	a5,8(s3)
    80002d5c:	d41ff06f          	j	80002a9c <_ZN11HeapManager12heapAllocateEm+0x3ec>

0000000080002d60 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80002d60:	fc010113          	addi	sp,sp,-64
    80002d64:	02113c23          	sd	ra,56(sp)
    80002d68:	02813823          	sd	s0,48(sp)
    80002d6c:	02913423          	sd	s1,40(sp)
    80002d70:	03213023          	sd	s2,32(sp)
    80002d74:	01313c23          	sd	s3,24(sp)
    80002d78:	01413823          	sd	s4,16(sp)
    80002d7c:	01513423          	sd	s5,8(sp)
    80002d80:	04010413          	addi	s0,sp,64
    80002d84:	00050a93          	mv	s5,a0
    80002d88:	00058a13          	mv	s4,a1
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pAddress) - MEM_BLOCK_SIZE);
    80002d8c:	fc058913          	addi	s2,a1,-64
    80002d90:	00090993          	mv	s3,s2
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80002d94:	01894783          	lbu	a5,24(s2)
    80002d98:	01994703          	lbu	a4,25(s2)
    80002d9c:	00871713          	slli	a4,a4,0x8
    80002da0:	00f76733          	or	a4,a4,a5
    80002da4:	01a94783          	lbu	a5,26(s2)
    80002da8:	01079793          	slli	a5,a5,0x10
    80002dac:	00e7e733          	or	a4,a5,a4
    80002db0:	01b94783          	lbu	a5,27(s2)
    80002db4:	01879793          	slli	a5,a5,0x18
    80002db8:	00e7e7b3          	or	a5,a5,a4
    80002dbc:	0007879b          	sext.w	a5,a5
    80002dc0:	deadc737          	lui	a4,0xdeadc
    80002dc4:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead40be>
    80002dc8:	00e79663          	bne	a5,a4,80002dd4 <_ZN11HeapManager8heapFreeEPv+0x74>
    HeapFreeSectionHeader* pInsert = m_pHead;
    80002dcc:	000ab483          	ld	s1,0(s5)
    80002dd0:	0740006f          	j	80002e44 <_ZN11HeapManager8heapFreeEPv+0xe4>
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80002dd4:	05700593          	li	a1,87
    80002dd8:	00003517          	auipc	a0,0x3
    80002ddc:	26850513          	addi	a0,a0,616 # 80006040 <CONSOLE_STATUS+0x30>
    80002de0:	fffff097          	auipc	ra,0xfffff
    80002de4:	a24080e7          	jalr	-1500(ra) # 80001804 <_Z13assert_failedPKci>
    80002de8:	fe5ff06f          	j	80002dcc <_ZN11HeapManager8heapFreeEPv+0x6c>
    while(pInsert != 0 && pInsert < pFree){
        assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
        pInsert = pInsert->pNext;
    80002dec:	0004c703          	lbu	a4,0(s1)
    80002df0:	0014c783          	lbu	a5,1(s1)
    80002df4:	00879793          	slli	a5,a5,0x8
    80002df8:	00e7e733          	or	a4,a5,a4
    80002dfc:	0024c783          	lbu	a5,2(s1)
    80002e00:	01079793          	slli	a5,a5,0x10
    80002e04:	00e7e7b3          	or	a5,a5,a4
    80002e08:	0034c703          	lbu	a4,3(s1)
    80002e0c:	01871713          	slli	a4,a4,0x18
    80002e10:	00f767b3          	or	a5,a4,a5
    80002e14:	0044c703          	lbu	a4,4(s1)
    80002e18:	02071713          	slli	a4,a4,0x20
    80002e1c:	00f76733          	or	a4,a4,a5
    80002e20:	0054c783          	lbu	a5,5(s1)
    80002e24:	02879793          	slli	a5,a5,0x28
    80002e28:	00e7e733          	or	a4,a5,a4
    80002e2c:	0064c783          	lbu	a5,6(s1)
    80002e30:	03079793          	slli	a5,a5,0x30
    80002e34:	00e7e7b3          	or	a5,a5,a4
    80002e38:	0074c483          	lbu	s1,7(s1)
    80002e3c:	03849493          	slli	s1,s1,0x38
    80002e40:	00f4e4b3          	or	s1,s1,a5
    while(pInsert != 0 && pInsert < pFree){
    80002e44:	04048c63          	beqz	s1,80002e9c <_ZN11HeapManager8heapFreeEPv+0x13c>
    80002e48:	0534fa63          	bgeu	s1,s3,80002e9c <_ZN11HeapManager8heapFreeEPv+0x13c>
        assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    80002e4c:	0184c783          	lbu	a5,24(s1)
    80002e50:	0194c703          	lbu	a4,25(s1)
    80002e54:	00871713          	slli	a4,a4,0x8
    80002e58:	00f76733          	or	a4,a4,a5
    80002e5c:	01a4c783          	lbu	a5,26(s1)
    80002e60:	01079793          	slli	a5,a5,0x10
    80002e64:	00e7e733          	or	a4,a5,a4
    80002e68:	01b4c783          	lbu	a5,27(s1)
    80002e6c:	01879793          	slli	a5,a5,0x18
    80002e70:	00e7e7b3          	or	a5,a5,a4
    80002e74:	0007879b          	sext.w	a5,a5
    80002e78:	deadc737          	lui	a4,0xdeadc
    80002e7c:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead40be>
    80002e80:	f6e786e3          	beq	a5,a4,80002dec <_ZN11HeapManager8heapFreeEPv+0x8c>
    80002e84:	05a00593          	li	a1,90
    80002e88:	00003517          	auipc	a0,0x3
    80002e8c:	1b850513          	addi	a0,a0,440 # 80006040 <CONSOLE_STATUS+0x30>
    80002e90:	fffff097          	auipc	ra,0xfffff
    80002e94:	974080e7          	jalr	-1676(ra) # 80001804 <_Z13assert_failedPKci>
    80002e98:	f55ff06f          	j	80002dec <_ZN11HeapManager8heapFreeEPv+0x8c>
    }
    if(pInsert == 0){
    80002e9c:	40048863          	beqz	s1,800032ac <_ZN11HeapManager8heapFreeEPv+0x54c>
        pFree->pPrev = m_pTail;
        pFree->pNext = 0;
        m_pTail->pNext = pFree;
        m_pTail = pFree;
    }else{
        pFree->pPrev = pInsert->pPrev;
    80002ea0:	0084c783          	lbu	a5,8(s1)
    80002ea4:	0094c703          	lbu	a4,9(s1)
    80002ea8:	00871713          	slli	a4,a4,0x8
    80002eac:	00f767b3          	or	a5,a4,a5
    80002eb0:	00a4c703          	lbu	a4,10(s1)
    80002eb4:	01071713          	slli	a4,a4,0x10
    80002eb8:	00f76733          	or	a4,a4,a5
    80002ebc:	00b4c783          	lbu	a5,11(s1)
    80002ec0:	01879793          	slli	a5,a5,0x18
    80002ec4:	00e7e733          	or	a4,a5,a4
    80002ec8:	00c4c783          	lbu	a5,12(s1)
    80002ecc:	02079793          	slli	a5,a5,0x20
    80002ed0:	00e7e7b3          	or	a5,a5,a4
    80002ed4:	00d4c703          	lbu	a4,13(s1)
    80002ed8:	02871713          	slli	a4,a4,0x28
    80002edc:	00f767b3          	or	a5,a4,a5
    80002ee0:	00e4c703          	lbu	a4,14(s1)
    80002ee4:	03071713          	slli	a4,a4,0x30
    80002ee8:	00f76733          	or	a4,a4,a5
    80002eec:	00f4c783          	lbu	a5,15(s1)
    80002ef0:	03879793          	slli	a5,a5,0x38
    80002ef4:	00e7e7b3          	or	a5,a5,a4
    80002ef8:	00e90423          	sb	a4,8(s2)
    80002efc:	0087d713          	srli	a4,a5,0x8
    80002f00:	00e904a3          	sb	a4,9(s2)
    80002f04:	0107d713          	srli	a4,a5,0x10
    80002f08:	00e90523          	sb	a4,10(s2)
    80002f0c:	0187d71b          	srliw	a4,a5,0x18
    80002f10:	00e905a3          	sb	a4,11(s2)
    80002f14:	0207d713          	srli	a4,a5,0x20
    80002f18:	00e90623          	sb	a4,12(s2)
    80002f1c:	0287d713          	srli	a4,a5,0x28
    80002f20:	00e906a3          	sb	a4,13(s2)
    80002f24:	0307d713          	srli	a4,a5,0x30
    80002f28:	00e90723          	sb	a4,14(s2)
    80002f2c:	0387d793          	srli	a5,a5,0x38
    80002f30:	00f907a3          	sb	a5,15(s2)
        pFree->pNext = pInsert;
    80002f34:	fc9a0023          	sb	s1,-64(s4)
    80002f38:	0084d793          	srli	a5,s1,0x8
    80002f3c:	00f900a3          	sb	a5,1(s2)
    80002f40:	0104d793          	srli	a5,s1,0x10
    80002f44:	00f90123          	sb	a5,2(s2)
    80002f48:	0184d79b          	srliw	a5,s1,0x18
    80002f4c:	00f901a3          	sb	a5,3(s2)
    80002f50:	0204d793          	srli	a5,s1,0x20
    80002f54:	00f90223          	sb	a5,4(s2)
    80002f58:	0284d793          	srli	a5,s1,0x28
    80002f5c:	00f902a3          	sb	a5,5(s2)
    80002f60:	0304d793          	srli	a5,s1,0x30
    80002f64:	00f90323          	sb	a5,6(s2)
    80002f68:	0384d793          	srli	a5,s1,0x38
    80002f6c:	00f903a3          	sb	a5,7(s2)
        if(pInsert->pPrev != 0){
    80002f70:	0084c783          	lbu	a5,8(s1)
    80002f74:	0094c703          	lbu	a4,9(s1)
    80002f78:	00871713          	slli	a4,a4,0x8
    80002f7c:	00f76733          	or	a4,a4,a5
    80002f80:	00a4c783          	lbu	a5,10(s1)
    80002f84:	01079793          	slli	a5,a5,0x10
    80002f88:	00e7e733          	or	a4,a5,a4
    80002f8c:	00b4c783          	lbu	a5,11(s1)
    80002f90:	01879793          	slli	a5,a5,0x18
    80002f94:	00e7e7b3          	or	a5,a5,a4
    80002f98:	00c4c703          	lbu	a4,12(s1)
    80002f9c:	02071713          	slli	a4,a4,0x20
    80002fa0:	00f767b3          	or	a5,a4,a5
    80002fa4:	00d4c703          	lbu	a4,13(s1)
    80002fa8:	02871713          	slli	a4,a4,0x28
    80002fac:	00f76733          	or	a4,a4,a5
    80002fb0:	00e4c783          	lbu	a5,14(s1)
    80002fb4:	03079793          	slli	a5,a5,0x30
    80002fb8:	00e7e733          	or	a4,a5,a4
    80002fbc:	00f4c783          	lbu	a5,15(s1)
    80002fc0:	03879793          	slli	a5,a5,0x38
    80002fc4:	00e7e7b3          	or	a5,a5,a4
    80002fc8:	04078063          	beqz	a5,80003008 <_ZN11HeapManager8heapFreeEPv+0x2a8>
            pInsert->pPrev->pNext = pFree;
    80002fcc:	01278023          	sb	s2,0(a5)
    80002fd0:	00895713          	srli	a4,s2,0x8
    80002fd4:	00e780a3          	sb	a4,1(a5)
    80002fd8:	01095713          	srli	a4,s2,0x10
    80002fdc:	00e78123          	sb	a4,2(a5)
    80002fe0:	0189571b          	srliw	a4,s2,0x18
    80002fe4:	00e781a3          	sb	a4,3(a5)
    80002fe8:	02095713          	srli	a4,s2,0x20
    80002fec:	00e78223          	sb	a4,4(a5)
    80002ff0:	02895713          	srli	a4,s2,0x28
    80002ff4:	00e782a3          	sb	a4,5(a5)
    80002ff8:	03095713          	srli	a4,s2,0x30
    80002ffc:	00e78323          	sb	a4,6(a5)
    80003000:	03895713          	srli	a4,s2,0x38
    80003004:	00e783a3          	sb	a4,7(a5)
        }
        pInsert->pPrev = pFree;
    80003008:	01248423          	sb	s2,8(s1)
    8000300c:	00895793          	srli	a5,s2,0x8
    80003010:	00f484a3          	sb	a5,9(s1)
    80003014:	01095793          	srli	a5,s2,0x10
    80003018:	00f48523          	sb	a5,10(s1)
    8000301c:	0189579b          	srliw	a5,s2,0x18
    80003020:	00f485a3          	sb	a5,11(s1)
    80003024:	02095793          	srli	a5,s2,0x20
    80003028:	00f48623          	sb	a5,12(s1)
    8000302c:	02895793          	srli	a5,s2,0x28
    80003030:	00f486a3          	sb	a5,13(s1)
    80003034:	03095793          	srli	a5,s2,0x30
    80003038:	00f48723          	sb	a5,14(s1)
    8000303c:	03895793          	srli	a5,s2,0x38
    80003040:	00f487a3          	sb	a5,15(s1)
    }
    if(!pFree->pPrev){
    80003044:	00894783          	lbu	a5,8(s2)
    80003048:	00994703          	lbu	a4,9(s2)
    8000304c:	00871713          	slli	a4,a4,0x8
    80003050:	00f76733          	or	a4,a4,a5
    80003054:	00a94783          	lbu	a5,10(s2)
    80003058:	01079793          	slli	a5,a5,0x10
    8000305c:	00e7e733          	or	a4,a5,a4
    80003060:	00b94783          	lbu	a5,11(s2)
    80003064:	01879793          	slli	a5,a5,0x18
    80003068:	00e7e7b3          	or	a5,a5,a4
    8000306c:	00c94703          	lbu	a4,12(s2)
    80003070:	02071713          	slli	a4,a4,0x20
    80003074:	00f767b3          	or	a5,a4,a5
    80003078:	00d94703          	lbu	a4,13(s2)
    8000307c:	02871713          	slli	a4,a4,0x28
    80003080:	00f76733          	or	a4,a4,a5
    80003084:	00e94783          	lbu	a5,14(s2)
    80003088:	03079793          	slli	a5,a5,0x30
    8000308c:	00e7e733          	or	a4,a5,a4
    80003090:	00f94783          	lbu	a5,15(s2)
    80003094:	03879793          	slli	a5,a5,0x38
    80003098:	00e7e7b3          	or	a5,a5,a4
    8000309c:	2a078c63          	beqz	a5,80003354 <_ZN11HeapManager8heapFreeEPv+0x5f4>
        m_pHead = pFree;
    }
    if(!pFree->pNext){
    800030a0:	fc0a4783          	lbu	a5,-64(s4)
    800030a4:	00194703          	lbu	a4,1(s2)
    800030a8:	00871713          	slli	a4,a4,0x8
    800030ac:	00f76733          	or	a4,a4,a5
    800030b0:	00294783          	lbu	a5,2(s2)
    800030b4:	01079793          	slli	a5,a5,0x10
    800030b8:	00e7e733          	or	a4,a5,a4
    800030bc:	00394783          	lbu	a5,3(s2)
    800030c0:	01879793          	slli	a5,a5,0x18
    800030c4:	00e7e7b3          	or	a5,a5,a4
    800030c8:	00494703          	lbu	a4,4(s2)
    800030cc:	02071713          	slli	a4,a4,0x20
    800030d0:	00f767b3          	or	a5,a4,a5
    800030d4:	00594703          	lbu	a4,5(s2)
    800030d8:	02871713          	slli	a4,a4,0x28
    800030dc:	00f76733          	or	a4,a4,a5
    800030e0:	00694783          	lbu	a5,6(s2)
    800030e4:	03079793          	slli	a5,a5,0x30
    800030e8:	00e7e733          	or	a4,a5,a4
    800030ec:	00794783          	lbu	a5,7(s2)
    800030f0:	03879793          	slli	a5,a5,0x38
    800030f4:	00e7e7b3          	or	a5,a5,a4
    800030f8:	26078263          	beqz	a5,8000335c <_ZN11HeapManager8heapFreeEPv+0x5fc>
        m_pTail = pFree;
    }

    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uintptr_t>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree)){
    800030fc:	00894783          	lbu	a5,8(s2)
    80003100:	00994703          	lbu	a4,9(s2)
    80003104:	00871713          	slli	a4,a4,0x8
    80003108:	00f76733          	or	a4,a4,a5
    8000310c:	00a94783          	lbu	a5,10(s2)
    80003110:	01079793          	slli	a5,a5,0x10
    80003114:	00e7e733          	or	a4,a5,a4
    80003118:	00b94783          	lbu	a5,11(s2)
    8000311c:	01879793          	slli	a5,a5,0x18
    80003120:	00e7e7b3          	or	a5,a5,a4
    80003124:	00c94703          	lbu	a4,12(s2)
    80003128:	02071713          	slli	a4,a4,0x20
    8000312c:	00f767b3          	or	a5,a4,a5
    80003130:	00d94703          	lbu	a4,13(s2)
    80003134:	02871713          	slli	a4,a4,0x28
    80003138:	00f76733          	or	a4,a4,a5
    8000313c:	00e94783          	lbu	a5,14(s2)
    80003140:	03079793          	slli	a5,a5,0x30
    80003144:	00e7e733          	or	a4,a5,a4
    80003148:	00f94783          	lbu	a5,15(s2)
    8000314c:	03879793          	slli	a5,a5,0x38
    80003150:	00e7e7b3          	or	a5,a5,a4
    80003154:	06078663          	beqz	a5,800031c0 <_ZN11HeapManager8heapFreeEPv+0x460>
    80003158:	0107c703          	lbu	a4,16(a5)
    8000315c:	0117c683          	lbu	a3,17(a5)
    80003160:	00869693          	slli	a3,a3,0x8
    80003164:	00e6e6b3          	or	a3,a3,a4
    80003168:	0127c703          	lbu	a4,18(a5)
    8000316c:	01071713          	slli	a4,a4,0x10
    80003170:	00d766b3          	or	a3,a4,a3
    80003174:	0137c703          	lbu	a4,19(a5)
    80003178:	01871713          	slli	a4,a4,0x18
    8000317c:	00d76733          	or	a4,a4,a3
    80003180:	0147c683          	lbu	a3,20(a5)
    80003184:	02069693          	slli	a3,a3,0x20
    80003188:	00e6e733          	or	a4,a3,a4
    8000318c:	0157c683          	lbu	a3,21(a5)
    80003190:	02869693          	slli	a3,a3,0x28
    80003194:	00e6e6b3          	or	a3,a3,a4
    80003198:	0167c703          	lbu	a4,22(a5)
    8000319c:	03071713          	slli	a4,a4,0x30
    800031a0:	00d766b3          	or	a3,a4,a3
    800031a4:	0177c703          	lbu	a4,23(a5)
    800031a8:	03871713          	slli	a4,a4,0x38
    800031ac:	00d76733          	or	a4,a4,a3
    800031b0:	00170693          	addi	a3,a4,1
    800031b4:	00669693          	slli	a3,a3,0x6
    800031b8:	00d786b3          	add	a3,a5,a3
    800031bc:	1ad90463          	beq	s2,a3,80003364 <_ZN11HeapManager8heapFreeEPv+0x604>
            m_pTail = pFree->pPrev;
        }
        pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uintptr_t>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree->pNext)){
    800031c0:	0009c783          	lbu	a5,0(s3)
    800031c4:	0019c703          	lbu	a4,1(s3)
    800031c8:	00871713          	slli	a4,a4,0x8
    800031cc:	00f76733          	or	a4,a4,a5
    800031d0:	0029c783          	lbu	a5,2(s3)
    800031d4:	01079793          	slli	a5,a5,0x10
    800031d8:	00e7e733          	or	a4,a5,a4
    800031dc:	0039c783          	lbu	a5,3(s3)
    800031e0:	01879793          	slli	a5,a5,0x18
    800031e4:	00e7e7b3          	or	a5,a5,a4
    800031e8:	0049c703          	lbu	a4,4(s3)
    800031ec:	02071713          	slli	a4,a4,0x20
    800031f0:	00f767b3          	or	a5,a4,a5
    800031f4:	0059c703          	lbu	a4,5(s3)
    800031f8:	02871713          	slli	a4,a4,0x28
    800031fc:	00f76733          	or	a4,a4,a5
    80003200:	0069c783          	lbu	a5,6(s3)
    80003204:	03079793          	slli	a5,a5,0x30
    80003208:	00e7e733          	or	a4,a5,a4
    8000320c:	0079c783          	lbu	a5,7(s3)
    80003210:	03879793          	slli	a5,a5,0x38
    80003214:	00e7e7b3          	or	a5,a5,a4
    80003218:	06078663          	beqz	a5,80003284 <_ZN11HeapManager8heapFreeEPv+0x524>
    8000321c:	0109c703          	lbu	a4,16(s3)
    80003220:	0119c683          	lbu	a3,17(s3)
    80003224:	00869693          	slli	a3,a3,0x8
    80003228:	00e6e6b3          	or	a3,a3,a4
    8000322c:	0129c703          	lbu	a4,18(s3)
    80003230:	01071713          	slli	a4,a4,0x10
    80003234:	00d766b3          	or	a3,a4,a3
    80003238:	0139c703          	lbu	a4,19(s3)
    8000323c:	01871713          	slli	a4,a4,0x18
    80003240:	00d76733          	or	a4,a4,a3
    80003244:	0149c683          	lbu	a3,20(s3)
    80003248:	02069693          	slli	a3,a3,0x20
    8000324c:	00e6e733          	or	a4,a3,a4
    80003250:	0159c683          	lbu	a3,21(s3)
    80003254:	02869693          	slli	a3,a3,0x28
    80003258:	00e6e6b3          	or	a3,a3,a4
    8000325c:	0169c703          	lbu	a4,22(s3)
    80003260:	03071713          	slli	a4,a4,0x30
    80003264:	00d766b3          	or	a3,a4,a3
    80003268:	0179c703          	lbu	a4,23(s3)
    8000326c:	03871713          	slli	a4,a4,0x38
    80003270:	00d76733          	or	a4,a4,a3
    80003274:	00170693          	addi	a3,a4,1
    80003278:	00669693          	slli	a3,a3,0x6
    8000327c:	00d986b3          	add	a3,s3,a3
    80003280:	40f68c63          	beq	a3,a5,80003698 <_ZN11HeapManager8heapFreeEPv+0x938>
        }else{
            m_pTail = pFree;
        }
    }
    return 0;
}
    80003284:	00000513          	li	a0,0
    80003288:	03813083          	ld	ra,56(sp)
    8000328c:	03013403          	ld	s0,48(sp)
    80003290:	02813483          	ld	s1,40(sp)
    80003294:	02013903          	ld	s2,32(sp)
    80003298:	01813983          	ld	s3,24(sp)
    8000329c:	01013a03          	ld	s4,16(sp)
    800032a0:	00813a83          	ld	s5,8(sp)
    800032a4:	04010113          	addi	sp,sp,64
    800032a8:	00008067          	ret
        pFree->pPrev = m_pTail;
    800032ac:	008ab783          	ld	a5,8(s5)
    800032b0:	00f90423          	sb	a5,8(s2)
    800032b4:	0087d713          	srli	a4,a5,0x8
    800032b8:	00e904a3          	sb	a4,9(s2)
    800032bc:	0107d713          	srli	a4,a5,0x10
    800032c0:	00e90523          	sb	a4,10(s2)
    800032c4:	0187d71b          	srliw	a4,a5,0x18
    800032c8:	00e905a3          	sb	a4,11(s2)
    800032cc:	0207d713          	srli	a4,a5,0x20
    800032d0:	00e90623          	sb	a4,12(s2)
    800032d4:	0287d713          	srli	a4,a5,0x28
    800032d8:	00e906a3          	sb	a4,13(s2)
    800032dc:	0307d713          	srli	a4,a5,0x30
    800032e0:	00e90723          	sb	a4,14(s2)
    800032e4:	0387d793          	srli	a5,a5,0x38
    800032e8:	00f907a3          	sb	a5,15(s2)
        pFree->pNext = 0;
    800032ec:	fc0a0023          	sb	zero,-64(s4)
    800032f0:	000900a3          	sb	zero,1(s2)
    800032f4:	00090123          	sb	zero,2(s2)
    800032f8:	000901a3          	sb	zero,3(s2)
    800032fc:	00090223          	sb	zero,4(s2)
    80003300:	000902a3          	sb	zero,5(s2)
    80003304:	00090323          	sb	zero,6(s2)
    80003308:	000903a3          	sb	zero,7(s2)
        m_pTail->pNext = pFree;
    8000330c:	008ab783          	ld	a5,8(s5)
    80003310:	01278023          	sb	s2,0(a5)
    80003314:	00895713          	srli	a4,s2,0x8
    80003318:	00e780a3          	sb	a4,1(a5)
    8000331c:	01095713          	srli	a4,s2,0x10
    80003320:	00e78123          	sb	a4,2(a5)
    80003324:	0189571b          	srliw	a4,s2,0x18
    80003328:	00e781a3          	sb	a4,3(a5)
    8000332c:	02095713          	srli	a4,s2,0x20
    80003330:	00e78223          	sb	a4,4(a5)
    80003334:	02895713          	srli	a4,s2,0x28
    80003338:	00e782a3          	sb	a4,5(a5)
    8000333c:	03095713          	srli	a4,s2,0x30
    80003340:	00e78323          	sb	a4,6(a5)
    80003344:	03895713          	srli	a4,s2,0x38
    80003348:	00e783a3          	sb	a4,7(a5)
        m_pTail = pFree;
    8000334c:	012ab423          	sd	s2,8(s5)
    80003350:	cf5ff06f          	j	80003044 <_ZN11HeapManager8heapFreeEPv+0x2e4>
        m_pHead = pFree;
    80003354:	012ab023          	sd	s2,0(s5)
    80003358:	d49ff06f          	j	800030a0 <_ZN11HeapManager8heapFreeEPv+0x340>
        m_pTail = pFree;
    8000335c:	012ab423          	sd	s2,8(s5)
    80003360:	d9dff06f          	j	800030fc <_ZN11HeapManager8heapFreeEPv+0x39c>
        pFree->pPrev->nSize += pFree->nSize + 1;
    80003364:	01094683          	lbu	a3,16(s2)
    80003368:	01194603          	lbu	a2,17(s2)
    8000336c:	00861613          	slli	a2,a2,0x8
    80003370:	00d66633          	or	a2,a2,a3
    80003374:	01294683          	lbu	a3,18(s2)
    80003378:	01069693          	slli	a3,a3,0x10
    8000337c:	00c6e633          	or	a2,a3,a2
    80003380:	01394683          	lbu	a3,19(s2)
    80003384:	01869693          	slli	a3,a3,0x18
    80003388:	00c6e6b3          	or	a3,a3,a2
    8000338c:	01494603          	lbu	a2,20(s2)
    80003390:	02061613          	slli	a2,a2,0x20
    80003394:	00d666b3          	or	a3,a2,a3
    80003398:	01594603          	lbu	a2,21(s2)
    8000339c:	02861613          	slli	a2,a2,0x28
    800033a0:	00d66633          	or	a2,a2,a3
    800033a4:	01694683          	lbu	a3,22(s2)
    800033a8:	03069693          	slli	a3,a3,0x30
    800033ac:	00c6e633          	or	a2,a3,a2
    800033b0:	01794683          	lbu	a3,23(s2)
    800033b4:	03869693          	slli	a3,a3,0x38
    800033b8:	00c6e6b3          	or	a3,a3,a2
    800033bc:	00d70733          	add	a4,a4,a3
    800033c0:	00170713          	addi	a4,a4,1
    800033c4:	00e78823          	sb	a4,16(a5)
    800033c8:	00875693          	srli	a3,a4,0x8
    800033cc:	00d788a3          	sb	a3,17(a5)
    800033d0:	01075693          	srli	a3,a4,0x10
    800033d4:	00d78923          	sb	a3,18(a5)
    800033d8:	0187569b          	srliw	a3,a4,0x18
    800033dc:	00d789a3          	sb	a3,19(a5)
    800033e0:	02075693          	srli	a3,a4,0x20
    800033e4:	00d78a23          	sb	a3,20(a5)
    800033e8:	02875693          	srli	a3,a4,0x28
    800033ec:	00d78aa3          	sb	a3,21(a5)
    800033f0:	03075693          	srli	a3,a4,0x30
    800033f4:	00d78b23          	sb	a3,22(a5)
    800033f8:	03875713          	srli	a4,a4,0x38
    800033fc:	00e78ba3          	sb	a4,23(a5)
        pFree->pPrev->pNext = pFree->pNext;
    80003400:	00894703          	lbu	a4,8(s2)
    80003404:	00994783          	lbu	a5,9(s2)
    80003408:	00879793          	slli	a5,a5,0x8
    8000340c:	00e7e7b3          	or	a5,a5,a4
    80003410:	00a94703          	lbu	a4,10(s2)
    80003414:	01071713          	slli	a4,a4,0x10
    80003418:	00f767b3          	or	a5,a4,a5
    8000341c:	00b94703          	lbu	a4,11(s2)
    80003420:	01871713          	slli	a4,a4,0x18
    80003424:	00f76733          	or	a4,a4,a5
    80003428:	00c94783          	lbu	a5,12(s2)
    8000342c:	02079793          	slli	a5,a5,0x20
    80003430:	00e7e733          	or	a4,a5,a4
    80003434:	00d94783          	lbu	a5,13(s2)
    80003438:	02879793          	slli	a5,a5,0x28
    8000343c:	00e7e7b3          	or	a5,a5,a4
    80003440:	00e94703          	lbu	a4,14(s2)
    80003444:	03071713          	slli	a4,a4,0x30
    80003448:	00f767b3          	or	a5,a4,a5
    8000344c:	00f94703          	lbu	a4,15(s2)
    80003450:	03871713          	slli	a4,a4,0x38
    80003454:	00f76733          	or	a4,a4,a5
    80003458:	fc0a4783          	lbu	a5,-64(s4)
    8000345c:	00194683          	lbu	a3,1(s2)
    80003460:	00869693          	slli	a3,a3,0x8
    80003464:	00f6e7b3          	or	a5,a3,a5
    80003468:	00294683          	lbu	a3,2(s2)
    8000346c:	01069693          	slli	a3,a3,0x10
    80003470:	00f6e6b3          	or	a3,a3,a5
    80003474:	00394783          	lbu	a5,3(s2)
    80003478:	01879793          	slli	a5,a5,0x18
    8000347c:	00d7e6b3          	or	a3,a5,a3
    80003480:	00494783          	lbu	a5,4(s2)
    80003484:	02079793          	slli	a5,a5,0x20
    80003488:	00d7e7b3          	or	a5,a5,a3
    8000348c:	00594683          	lbu	a3,5(s2)
    80003490:	02869693          	slli	a3,a3,0x28
    80003494:	00f6e7b3          	or	a5,a3,a5
    80003498:	00694683          	lbu	a3,6(s2)
    8000349c:	03069693          	slli	a3,a3,0x30
    800034a0:	00f6e6b3          	or	a3,a3,a5
    800034a4:	00794783          	lbu	a5,7(s2)
    800034a8:	03879793          	slli	a5,a5,0x38
    800034ac:	00d7e7b3          	or	a5,a5,a3
    800034b0:	00d70023          	sb	a3,0(a4)
    800034b4:	0087d693          	srli	a3,a5,0x8
    800034b8:	00d700a3          	sb	a3,1(a4)
    800034bc:	0107d693          	srli	a3,a5,0x10
    800034c0:	00d70123          	sb	a3,2(a4)
    800034c4:	0187d69b          	srliw	a3,a5,0x18
    800034c8:	00d701a3          	sb	a3,3(a4)
    800034cc:	0207d693          	srli	a3,a5,0x20
    800034d0:	00d70223          	sb	a3,4(a4)
    800034d4:	0287d693          	srli	a3,a5,0x28
    800034d8:	00d702a3          	sb	a3,5(a4)
    800034dc:	0307d693          	srli	a3,a5,0x30
    800034e0:	00d70323          	sb	a3,6(a4)
    800034e4:	0387d793          	srli	a5,a5,0x38
    800034e8:	00f703a3          	sb	a5,7(a4)
        if(pFree->pNext != 0){
    800034ec:	fc0a4783          	lbu	a5,-64(s4)
    800034f0:	00194703          	lbu	a4,1(s2)
    800034f4:	00871713          	slli	a4,a4,0x8
    800034f8:	00f76733          	or	a4,a4,a5
    800034fc:	00294783          	lbu	a5,2(s2)
    80003500:	01079793          	slli	a5,a5,0x10
    80003504:	00e7e733          	or	a4,a5,a4
    80003508:	00394783          	lbu	a5,3(s2)
    8000350c:	01879793          	slli	a5,a5,0x18
    80003510:	00e7e7b3          	or	a5,a5,a4
    80003514:	00494703          	lbu	a4,4(s2)
    80003518:	02071713          	slli	a4,a4,0x20
    8000351c:	00f767b3          	or	a5,a4,a5
    80003520:	00594703          	lbu	a4,5(s2)
    80003524:	02871713          	slli	a4,a4,0x28
    80003528:	00f76733          	or	a4,a4,a5
    8000352c:	00694783          	lbu	a5,6(s2)
    80003530:	03079793          	slli	a5,a5,0x30
    80003534:	00e7e733          	or	a4,a5,a4
    80003538:	00794783          	lbu	a5,7(s2)
    8000353c:	03879793          	slli	a5,a5,0x38
    80003540:	00e7e7b3          	or	a5,a5,a4
    80003544:	0e078a63          	beqz	a5,80003638 <_ZN11HeapManager8heapFreeEPv+0x8d8>
            pFree->pNext->pPrev = pFree->pPrev;
    80003548:	00894703          	lbu	a4,8(s2)
    8000354c:	00994683          	lbu	a3,9(s2)
    80003550:	00869693          	slli	a3,a3,0x8
    80003554:	00e6e733          	or	a4,a3,a4
    80003558:	00a94683          	lbu	a3,10(s2)
    8000355c:	01069693          	slli	a3,a3,0x10
    80003560:	00e6e6b3          	or	a3,a3,a4
    80003564:	00b94703          	lbu	a4,11(s2)
    80003568:	01871713          	slli	a4,a4,0x18
    8000356c:	00d766b3          	or	a3,a4,a3
    80003570:	00c94703          	lbu	a4,12(s2)
    80003574:	02071713          	slli	a4,a4,0x20
    80003578:	00d76733          	or	a4,a4,a3
    8000357c:	00d94683          	lbu	a3,13(s2)
    80003580:	02869693          	slli	a3,a3,0x28
    80003584:	00e6e733          	or	a4,a3,a4
    80003588:	00e94683          	lbu	a3,14(s2)
    8000358c:	03069693          	slli	a3,a3,0x30
    80003590:	00e6e6b3          	or	a3,a3,a4
    80003594:	00f94703          	lbu	a4,15(s2)
    80003598:	03871713          	slli	a4,a4,0x38
    8000359c:	00d76733          	or	a4,a4,a3
    800035a0:	00d78423          	sb	a3,8(a5)
    800035a4:	00875693          	srli	a3,a4,0x8
    800035a8:	00d784a3          	sb	a3,9(a5)
    800035ac:	01075693          	srli	a3,a4,0x10
    800035b0:	00d78523          	sb	a3,10(a5)
    800035b4:	0187569b          	srliw	a3,a4,0x18
    800035b8:	00d785a3          	sb	a3,11(a5)
    800035bc:	02075693          	srli	a3,a4,0x20
    800035c0:	00d78623          	sb	a3,12(a5)
    800035c4:	02875693          	srli	a3,a4,0x28
    800035c8:	00d786a3          	sb	a3,13(a5)
    800035cc:	03075693          	srli	a3,a4,0x30
    800035d0:	00d78723          	sb	a3,14(a5)
    800035d4:	03875713          	srli	a4,a4,0x38
    800035d8:	00e787a3          	sb	a4,15(a5)
        pFree = pFree->pPrev;
    800035dc:	00894983          	lbu	s3,8(s2)
    800035e0:	00994783          	lbu	a5,9(s2)
    800035e4:	00879793          	slli	a5,a5,0x8
    800035e8:	0137e7b3          	or	a5,a5,s3
    800035ec:	00a94983          	lbu	s3,10(s2)
    800035f0:	01099993          	slli	s3,s3,0x10
    800035f4:	00f9e7b3          	or	a5,s3,a5
    800035f8:	00b94983          	lbu	s3,11(s2)
    800035fc:	01899993          	slli	s3,s3,0x18
    80003600:	00f9e9b3          	or	s3,s3,a5
    80003604:	00c94783          	lbu	a5,12(s2)
    80003608:	02079793          	slli	a5,a5,0x20
    8000360c:	0137e9b3          	or	s3,a5,s3
    80003610:	00d94783          	lbu	a5,13(s2)
    80003614:	02879793          	slli	a5,a5,0x28
    80003618:	0137e7b3          	or	a5,a5,s3
    8000361c:	00e94983          	lbu	s3,14(s2)
    80003620:	03099993          	slli	s3,s3,0x30
    80003624:	00f9e7b3          	or	a5,s3,a5
    80003628:	00f94983          	lbu	s3,15(s2)
    8000362c:	03899993          	slli	s3,s3,0x38
    80003630:	00f9e9b3          	or	s3,s3,a5
    80003634:	b8dff06f          	j	800031c0 <_ZN11HeapManager8heapFreeEPv+0x460>
            m_pTail = pFree->pPrev;
    80003638:	00894703          	lbu	a4,8(s2)
    8000363c:	00994783          	lbu	a5,9(s2)
    80003640:	00879793          	slli	a5,a5,0x8
    80003644:	00e7e7b3          	or	a5,a5,a4
    80003648:	00a94703          	lbu	a4,10(s2)
    8000364c:	01071713          	slli	a4,a4,0x10
    80003650:	00f76733          	or	a4,a4,a5
    80003654:	00b94783          	lbu	a5,11(s2)
    80003658:	01879793          	slli	a5,a5,0x18
    8000365c:	00e7e733          	or	a4,a5,a4
    80003660:	00c94783          	lbu	a5,12(s2)
    80003664:	02079793          	slli	a5,a5,0x20
    80003668:	00e7e7b3          	or	a5,a5,a4
    8000366c:	00d94703          	lbu	a4,13(s2)
    80003670:	02871713          	slli	a4,a4,0x28
    80003674:	00f76733          	or	a4,a4,a5
    80003678:	00e94783          	lbu	a5,14(s2)
    8000367c:	03079793          	slli	a5,a5,0x30
    80003680:	00e7e733          	or	a4,a5,a4
    80003684:	00f94783          	lbu	a5,15(s2)
    80003688:	03879793          	slli	a5,a5,0x38
    8000368c:	00e7e7b3          	or	a5,a5,a4
    80003690:	00fab423          	sd	a5,8(s5)
    80003694:	f49ff06f          	j	800035dc <_ZN11HeapManager8heapFreeEPv+0x87c>
        pFree->nSize += pFree->pNext->nSize + 1;
    80003698:	0107c683          	lbu	a3,16(a5)
    8000369c:	0117c603          	lbu	a2,17(a5)
    800036a0:	00861613          	slli	a2,a2,0x8
    800036a4:	00d66633          	or	a2,a2,a3
    800036a8:	0127c683          	lbu	a3,18(a5)
    800036ac:	01069693          	slli	a3,a3,0x10
    800036b0:	00c6e633          	or	a2,a3,a2
    800036b4:	0137c683          	lbu	a3,19(a5)
    800036b8:	01869693          	slli	a3,a3,0x18
    800036bc:	00c6e6b3          	or	a3,a3,a2
    800036c0:	0147c603          	lbu	a2,20(a5)
    800036c4:	02061613          	slli	a2,a2,0x20
    800036c8:	00d666b3          	or	a3,a2,a3
    800036cc:	0157c603          	lbu	a2,21(a5)
    800036d0:	02861613          	slli	a2,a2,0x28
    800036d4:	00d66633          	or	a2,a2,a3
    800036d8:	0167c683          	lbu	a3,22(a5)
    800036dc:	03069693          	slli	a3,a3,0x30
    800036e0:	00c6e633          	or	a2,a3,a2
    800036e4:	0177c683          	lbu	a3,23(a5)
    800036e8:	03869693          	slli	a3,a3,0x38
    800036ec:	00c6e6b3          	or	a3,a3,a2
    800036f0:	00d70733          	add	a4,a4,a3
    800036f4:	00170713          	addi	a4,a4,1
    800036f8:	00e98823          	sb	a4,16(s3)
    800036fc:	00875693          	srli	a3,a4,0x8
    80003700:	00d988a3          	sb	a3,17(s3)
    80003704:	01075693          	srli	a3,a4,0x10
    80003708:	00d98923          	sb	a3,18(s3)
    8000370c:	0187569b          	srliw	a3,a4,0x18
    80003710:	00d989a3          	sb	a3,19(s3)
    80003714:	02075693          	srli	a3,a4,0x20
    80003718:	00d98a23          	sb	a3,20(s3)
    8000371c:	02875693          	srli	a3,a4,0x28
    80003720:	00d98aa3          	sb	a3,21(s3)
    80003724:	03075693          	srli	a3,a4,0x30
    80003728:	00d98b23          	sb	a3,22(s3)
    8000372c:	03875713          	srli	a4,a4,0x38
    80003730:	00e98ba3          	sb	a4,23(s3)
        pFree->pNext = pFree->pNext->pNext;
    80003734:	0007c683          	lbu	a3,0(a5)
    80003738:	0017c703          	lbu	a4,1(a5)
    8000373c:	00871713          	slli	a4,a4,0x8
    80003740:	00d766b3          	or	a3,a4,a3
    80003744:	0027c703          	lbu	a4,2(a5)
    80003748:	01071713          	slli	a4,a4,0x10
    8000374c:	00d76733          	or	a4,a4,a3
    80003750:	0037c683          	lbu	a3,3(a5)
    80003754:	01869693          	slli	a3,a3,0x18
    80003758:	00e6e733          	or	a4,a3,a4
    8000375c:	0047c683          	lbu	a3,4(a5)
    80003760:	02069693          	slli	a3,a3,0x20
    80003764:	00e6e6b3          	or	a3,a3,a4
    80003768:	0057c703          	lbu	a4,5(a5)
    8000376c:	02871713          	slli	a4,a4,0x28
    80003770:	00d766b3          	or	a3,a4,a3
    80003774:	0067c703          	lbu	a4,6(a5)
    80003778:	03071713          	slli	a4,a4,0x30
    8000377c:	00d76733          	or	a4,a4,a3
    80003780:	0077c783          	lbu	a5,7(a5)
    80003784:	03879793          	slli	a5,a5,0x38
    80003788:	00e7e7b3          	or	a5,a5,a4
    8000378c:	00e98023          	sb	a4,0(s3)
    80003790:	0087d713          	srli	a4,a5,0x8
    80003794:	00e980a3          	sb	a4,1(s3)
    80003798:	0107d713          	srli	a4,a5,0x10
    8000379c:	00e98123          	sb	a4,2(s3)
    800037a0:	0187d71b          	srliw	a4,a5,0x18
    800037a4:	00e981a3          	sb	a4,3(s3)
    800037a8:	0207d713          	srli	a4,a5,0x20
    800037ac:	00e98223          	sb	a4,4(s3)
    800037b0:	0287d713          	srli	a4,a5,0x28
    800037b4:	00e982a3          	sb	a4,5(s3)
    800037b8:	0307d713          	srli	a4,a5,0x30
    800037bc:	00e98323          	sb	a4,6(s3)
    800037c0:	0387d713          	srli	a4,a5,0x38
    800037c4:	00e983a3          	sb	a4,7(s3)
        if(pFree->pNext != 0){
    800037c8:	04078263          	beqz	a5,8000380c <_ZN11HeapManager8heapFreeEPv+0xaac>
            pFree->pNext->pPrev = pFree;
    800037cc:	01378423          	sb	s3,8(a5)
    800037d0:	0089d713          	srli	a4,s3,0x8
    800037d4:	00e784a3          	sb	a4,9(a5)
    800037d8:	0109d713          	srli	a4,s3,0x10
    800037dc:	00e78523          	sb	a4,10(a5)
    800037e0:	0189d71b          	srliw	a4,s3,0x18
    800037e4:	00e785a3          	sb	a4,11(a5)
    800037e8:	0209d713          	srli	a4,s3,0x20
    800037ec:	00e78623          	sb	a4,12(a5)
    800037f0:	0289d713          	srli	a4,s3,0x28
    800037f4:	00e786a3          	sb	a4,13(a5)
    800037f8:	0309d713          	srli	a4,s3,0x30
    800037fc:	00e78723          	sb	a4,14(a5)
    80003800:	0389d993          	srli	s3,s3,0x38
    80003804:	013787a3          	sb	s3,15(a5)
    80003808:	a7dff06f          	j	80003284 <_ZN11HeapManager8heapFreeEPv+0x524>
            m_pTail = pFree;
    8000380c:	013ab423          	sd	s3,8(s5)
    80003810:	a75ff06f          	j	80003284 <_ZN11HeapManager8heapFreeEPv+0x524>

0000000080003814 <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"


extern "C" void exceptionHandler(){
    80003814:	fc010113          	addi	sp,sp,-64
    80003818:	02113c23          	sd	ra,56(sp)
    8000381c:	02813823          	sd	s0,48(sp)
    80003820:	02913423          	sd	s1,40(sp)
    80003824:	03213023          	sd	s2,32(sp)
    80003828:	01313c23          	sd	s3,24(sp)
    8000382c:	01413823          	sd	s4,16(sp)
    80003830:	01513423          	sd	s5,8(sp)
    80003834:	04010413          	addi	s0,sp,64

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80003838:	142027f3          	csrr	a5,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    8000383c:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80003840:	141024f3          	csrr	s1,sepc

    uint64 a0 = 0;
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80003844:	00050713          	mv	a4,a0
    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80003848:	ff878793          	addi	a5,a5,-8
    8000384c:	00100693          	li	a3,1
    80003850:	02f6f463          	bgeu	a3,a5,80003878 <exceptionHandler+0x64>
    //     Timer::getInstance().tick();
    //     __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    //     __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    //     __asm__ volatile("csrc sip, 0x2");
    // }
    80003854:	03813083          	ld	ra,56(sp)
    80003858:	03013403          	ld	s0,48(sp)
    8000385c:	02813483          	ld	s1,40(sp)
    80003860:	02013903          	ld	s2,32(sp)
    80003864:	01813983          	ld	s3,24(sp)
    80003868:	01013a03          	ld	s4,16(sp)
    8000386c:	00813a83          	ld	s5,8(sp)
    80003870:	04010113          	addi	sp,sp,64
    80003874:	00008067          	ret
        __asm__ volatile("mv %0, a1" : "=r"(a1));
    80003878:	00058993          	mv	s3,a1
        __asm__ volatile("mv %0, a2" : "=r"(a2));
    8000387c:	00060a13          	mv	s4,a2
        __asm__ volatile("mv %0, a3" : "=r"(a3));
    80003880:	00068a93          	mv	s5,a3
        __asm__ volatile("mv %0, a4" : "=r"(a4));
    80003884:	00070793          	mv	a5,a4
        switch(a0){
    80003888:	04200793          	li	a5,66
    8000388c:	16e7e063          	bltu	a5,a4,800039ec <exceptionHandler+0x1d8>
    80003890:	00271713          	slli	a4,a4,0x2
    80003894:	00002697          	auipc	a3,0x2
    80003898:	7c068693          	addi	a3,a3,1984 # 80006054 <CONSOLE_STATUS+0x44>
    8000389c:	00d70733          	add	a4,a4,a3
    800038a0:	00072783          	lw	a5,0(a4)
    800038a4:	00d787b3          	add	a5,a5,a3
    800038a8:	00078067          	jr	a5
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    800038ac:	00098593          	mv	a1,s3
    800038b0:	00003797          	auipc	a5,0x3
    800038b4:	4787b783          	ld	a5,1144(a5) # 80006d28 <_GLOBAL_OFFSET_TABLE_+0x10>
    800038b8:	0007b503          	ld	a0,0(a5)
    800038bc:	fffff097          	auipc	ra,0xfffff
    800038c0:	df4080e7          	jalr	-524(ra) # 800026b0 <_ZN11HeapManager12heapAllocateEm>
                break;
    800038c4:	12c0006f          	j	800039f0 <exceptionHandler+0x1dc>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    800038c8:	00098593          	mv	a1,s3
    800038cc:	00003797          	auipc	a5,0x3
    800038d0:	45c7b783          	ld	a5,1116(a5) # 80006d28 <_GLOBAL_OFFSET_TABLE_+0x10>
    800038d4:	0007b503          	ld	a0,0(a5)
    800038d8:	fffff097          	auipc	ra,0xfffff
    800038dc:	488080e7          	jalr	1160(ra) # 80002d60 <_ZN11HeapManager8heapFreeEPv>
                break;
    800038e0:	1100006f          	j	800039f0 <exceptionHandler+0x1dc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)((uint64)HeapManager::getInstance().heapAllocate(DEFAULT_STACK_SIZE / MEM_BLOCK_SIZE) + DEFAULT_STACK_SIZE - 1));
    800038e4:	04000593          	li	a1,64
    800038e8:	00003797          	auipc	a5,0x3
    800038ec:	4407b783          	ld	a5,1088(a5) # 80006d28 <_GLOBAL_OFFSET_TABLE_+0x10>
    800038f0:	0007b503          	ld	a0,0(a5)
    800038f4:	fffff097          	auipc	ra,0xfffff
    800038f8:	dbc080e7          	jalr	-580(ra) # 800026b0 <_ZN11HeapManager12heapAllocateEm>
    800038fc:	00100713          	li	a4,1
    80003900:	000017b7          	lui	a5,0x1
    80003904:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80003908:	00f506b3          	add	a3,a0,a5
    8000390c:	000a8613          	mv	a2,s5
    80003910:	000a0593          	mv	a1,s4
    80003914:	00098513          	mv	a0,s3
    80003918:	ffffe097          	auipc	ra,0xffffe
    8000391c:	51c080e7          	jalr	1308(ra) # 80001e34 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80003920:	0d00006f          	j	800039f0 <exceptionHandler+0x1dc>
                returnVal = _thread::currentThread->exit();
    80003924:	fffff097          	auipc	ra,0xfffff
    80003928:	9e8080e7          	jalr	-1560(ra) # 8000230c <_ZN7_thread4exitEv>
                break;
    8000392c:	0c40006f          	j	800039f0 <exceptionHandler+0x1dc>
                _thread::dispatch();
    80003930:	fffff097          	auipc	ra,0xfffff
    80003934:	844080e7          	jalr	-1980(ra) # 80002174 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80003938:	00000513          	li	a0,0
                break;
    8000393c:	0b40006f          	j	800039f0 <exceptionHandler+0x1dc>
                _thread::currentThread->join((thread_t)a1);
    80003940:	00098593          	mv	a1,s3
    80003944:	00003797          	auipc	a5,0x3
    80003948:	4047b783          	ld	a5,1028(a5) # 80006d48 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000394c:	0007b503          	ld	a0,0(a5)
    80003950:	fffff097          	auipc	ra,0xfffff
    80003954:	8a0080e7          	jalr	-1888(ra) # 800021f0 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80003958:	00000513          	li	a0,0
                break;
    8000395c:	0940006f          	j	800039f0 <exceptionHandler+0x1dc>
                _sem::open((sem_t*)a1, unsigned(a2));
    80003960:	000a059b          	sext.w	a1,s4
    80003964:	00098513          	mv	a0,s3
    80003968:	ffffe097          	auipc	ra,0xffffe
    8000396c:	c3c080e7          	jalr	-964(ra) # 800015a4 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80003970:	00000513          	li	a0,0
                break;
    80003974:	07c0006f          	j	800039f0 <exceptionHandler+0x1dc>
                _sem::close((sem_t)a1);
    80003978:	00098513          	mv	a0,s3
    8000397c:	ffffe097          	auipc	ra,0xffffe
    80003980:	c58080e7          	jalr	-936(ra) # 800015d4 <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80003984:	00000513          	li	a0,0
                break;
    80003988:	0680006f          	j	800039f0 <exceptionHandler+0x1dc>
                _sem::wait((sem_t)a1);
    8000398c:	00098513          	mv	a0,s3
    80003990:	ffffe097          	auipc	ra,0xffffe
    80003994:	ca4080e7          	jalr	-860(ra) # 80001634 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    80003998:	00000513          	li	a0,0
                break;
    8000399c:	0540006f          	j	800039f0 <exceptionHandler+0x1dc>
                _sem::signal((sem_t)a1);
    800039a0:	00098513          	mv	a0,s3
    800039a4:	ffffe097          	auipc	ra,0xffffe
    800039a8:	d34080e7          	jalr	-716(ra) # 800016d8 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    800039ac:	00000513          	li	a0,0
                break;
    800039b0:	0400006f          	j	800039f0 <exceptionHandler+0x1dc>
                returnVal = Timer::getInstance().sleep(a1);
    800039b4:	ffffd097          	auipc	ra,0xffffd
    800039b8:	7f4080e7          	jalr	2036(ra) # 800011a8 <_ZN5Timer11getInstanceEv>
    800039bc:	00098593          	mv	a1,s3
    800039c0:	ffffe097          	auipc	ra,0xffffe
    800039c4:	8d8080e7          	jalr	-1832(ra) # 80001298 <_ZN5Timer5sleepEm>
                break;
    800039c8:	0280006f          	j	800039f0 <exceptionHandler+0x1dc>
                returnVal = __getc();
    800039cc:	00002097          	auipc	ra,0x2
    800039d0:	53c080e7          	jalr	1340(ra) # 80005f08 <__getc>
                break;
    800039d4:	01c0006f          	j	800039f0 <exceptionHandler+0x1dc>
                __putc(a1);
    800039d8:	0ff9f513          	andi	a0,s3,255
    800039dc:	00002097          	auipc	ra,0x2
    800039e0:	4f0080e7          	jalr	1264(ra) # 80005ecc <__putc>
    uint64 returnVal = 0;
    800039e4:	00000513          	li	a0,0
                break;
    800039e8:	0080006f          	j	800039f0 <exceptionHandler+0x1dc>
        __asm__ volatile("mv %0, a4" : "=r"(a4));
    800039ec:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800039f0:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800039f4:	00448493          	addi	s1,s1,4
    800039f8:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800039fc:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, 0x2");
    80003a00:	14417073          	csrci	sip,2
    80003a04:	e51ff06f          	j	80003854 <exceptionHandler+0x40>

0000000080003a08 <_ZN9SchedulerC1Ev>:
#include "assert.h"
#include "syscalls_c.h"

Scheduler* Scheduler::singleton = nullptr;

Scheduler::Scheduler(){
    80003a08:	fe010113          	addi	sp,sp,-32
    80003a0c:	00113c23          	sd	ra,24(sp)
    80003a10:	00813823          	sd	s0,16(sp)
    80003a14:	00913423          	sd	s1,8(sp)
    80003a18:	02010413          	addi	s0,sp,32
    80003a1c:	00050493          	mv	s1,a0
    assert(singleton == nullptr);
    80003a20:	00003797          	auipc	a5,0x3
    80003a24:	3907b783          	ld	a5,912(a5) # 80006db0 <_ZN9Scheduler9singletonE>
    80003a28:	02079463          	bnez	a5,80003a50 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80003a2c:	00003797          	auipc	a5,0x3
    80003a30:	3897b223          	sd	s1,900(a5) # 80006db0 <_ZN9Scheduler9singletonE>
    head = nullptr;
    80003a34:	0004b023          	sd	zero,0(s1)
    tail = nullptr;
    80003a38:	0004b423          	sd	zero,8(s1)
}
    80003a3c:	01813083          	ld	ra,24(sp)
    80003a40:	01013403          	ld	s0,16(sp)
    80003a44:	00813483          	ld	s1,8(sp)
    80003a48:	02010113          	addi	sp,sp,32
    80003a4c:	00008067          	ret
    assert(singleton == nullptr);
    80003a50:	01300593          	li	a1,19
    80003a54:	00002517          	auipc	a0,0x2
    80003a58:	70c50513          	addi	a0,a0,1804 # 80006160 <CONSOLE_STATUS+0x150>
    80003a5c:	ffffe097          	auipc	ra,0xffffe
    80003a60:	da8080e7          	jalr	-600(ra) # 80001804 <_Z13assert_failedPKci>
    80003a64:	fc9ff06f          	j	80003a2c <_ZN9SchedulerC1Ev+0x24>

0000000080003a68 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80003a68:	ff010113          	addi	sp,sp,-16
    80003a6c:	00813423          	sd	s0,8(sp)
    80003a70:	01010413          	addi	s0,sp,16
    return singleton->head == nullptr;
    80003a74:	00003797          	auipc	a5,0x3
    80003a78:	33c7b783          	ld	a5,828(a5) # 80006db0 <_ZN9Scheduler9singletonE>
    80003a7c:	0007b503          	ld	a0,0(a5)
}
    80003a80:	00153513          	seqz	a0,a0
    80003a84:	00813403          	ld	s0,8(sp)
    80003a88:	01010113          	addi	sp,sp,16
    80003a8c:	00008067          	ret

0000000080003a90 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80003a90:	fe010113          	addi	sp,sp,-32
    80003a94:	00113c23          	sd	ra,24(sp)
    80003a98:	00813823          	sd	s0,16(sp)
    80003a9c:	00913423          	sd	s1,8(sp)
    80003aa0:	01213023          	sd	s2,0(sp)
    80003aa4:	02010413          	addi	s0,sp,32
    80003aa8:	00050493          	mv	s1,a0
    if(singleton->head == nullptr){
    80003aac:	00003917          	auipc	s2,0x3
    80003ab0:	30493903          	ld	s2,772(s2) # 80006db0 <_ZN9Scheduler9singletonE>
    80003ab4:	00093783          	ld	a5,0(s2)
    80003ab8:	12078c63          	beqz	a5,80003bf0 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = nullptr;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003abc:	00893903          	ld	s2,8(s2)
    80003ac0:	01000513          	li	a0,16
    80003ac4:	ffffe097          	auipc	ra,0xffffe
    80003ac8:	8b4080e7          	jalr	-1868(ra) # 80001378 <_Z9mem_allocm>
    80003acc:	00a90423          	sb	a0,8(s2)
    80003ad0:	00855793          	srli	a5,a0,0x8
    80003ad4:	00f904a3          	sb	a5,9(s2)
    80003ad8:	01055793          	srli	a5,a0,0x10
    80003adc:	00f90523          	sb	a5,10(s2)
    80003ae0:	0185579b          	srliw	a5,a0,0x18
    80003ae4:	00f905a3          	sb	a5,11(s2)
    80003ae8:	02055793          	srli	a5,a0,0x20
    80003aec:	00f90623          	sb	a5,12(s2)
    80003af0:	02855793          	srli	a5,a0,0x28
    80003af4:	00f906a3          	sb	a5,13(s2)
    80003af8:	03055793          	srli	a5,a0,0x30
    80003afc:	00f90723          	sb	a5,14(s2)
    80003b00:	03855513          	srli	a0,a0,0x38
    80003b04:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80003b08:	00003617          	auipc	a2,0x3
    80003b0c:	2a860613          	addi	a2,a2,680 # 80006db0 <_ZN9Scheduler9singletonE>
    80003b10:	00063583          	ld	a1,0(a2)
    80003b14:	0085b703          	ld	a4,8(a1)
    80003b18:	00874783          	lbu	a5,8(a4)
    80003b1c:	00974683          	lbu	a3,9(a4)
    80003b20:	00869693          	slli	a3,a3,0x8
    80003b24:	00f6e6b3          	or	a3,a3,a5
    80003b28:	00a74783          	lbu	a5,10(a4)
    80003b2c:	01079793          	slli	a5,a5,0x10
    80003b30:	00d7e6b3          	or	a3,a5,a3
    80003b34:	00b74783          	lbu	a5,11(a4)
    80003b38:	01879793          	slli	a5,a5,0x18
    80003b3c:	00d7e7b3          	or	a5,a5,a3
    80003b40:	00c74683          	lbu	a3,12(a4)
    80003b44:	02069693          	slli	a3,a3,0x20
    80003b48:	00f6e7b3          	or	a5,a3,a5
    80003b4c:	00d74683          	lbu	a3,13(a4)
    80003b50:	02869693          	slli	a3,a3,0x28
    80003b54:	00f6e6b3          	or	a3,a3,a5
    80003b58:	00e74783          	lbu	a5,14(a4)
    80003b5c:	03079793          	slli	a5,a5,0x30
    80003b60:	00d7e6b3          	or	a3,a5,a3
    80003b64:	00f74783          	lbu	a5,15(a4)
    80003b68:	03879793          	slli	a5,a5,0x38
    80003b6c:	00d7e7b3          	or	a5,a5,a3
    80003b70:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80003b74:	00978023          	sb	s1,0(a5)
    80003b78:	0084d713          	srli	a4,s1,0x8
    80003b7c:	00e780a3          	sb	a4,1(a5)
    80003b80:	0104d713          	srli	a4,s1,0x10
    80003b84:	00e78123          	sb	a4,2(a5)
    80003b88:	0184d71b          	srliw	a4,s1,0x18
    80003b8c:	00e781a3          	sb	a4,3(a5)
    80003b90:	0204d713          	srli	a4,s1,0x20
    80003b94:	00e78223          	sb	a4,4(a5)
    80003b98:	0284d713          	srli	a4,s1,0x28
    80003b9c:	00e782a3          	sb	a4,5(a5)
    80003ba0:	0304d713          	srli	a4,s1,0x30
    80003ba4:	00e78323          	sb	a4,6(a5)
    80003ba8:	0384d493          	srli	s1,s1,0x38
    80003bac:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = nullptr;
    80003bb0:	00063783          	ld	a5,0(a2)
    80003bb4:	0087b783          	ld	a5,8(a5)
    80003bb8:	00078423          	sb	zero,8(a5)
    80003bbc:	000784a3          	sb	zero,9(a5)
    80003bc0:	00078523          	sb	zero,10(a5)
    80003bc4:	000785a3          	sb	zero,11(a5)
    80003bc8:	00078623          	sb	zero,12(a5)
    80003bcc:	000786a3          	sb	zero,13(a5)
    80003bd0:	00078723          	sb	zero,14(a5)
    80003bd4:	000787a3          	sb	zero,15(a5)
    }
}
    80003bd8:	01813083          	ld	ra,24(sp)
    80003bdc:	01013403          	ld	s0,16(sp)
    80003be0:	00813483          	ld	s1,8(sp)
    80003be4:	00013903          	ld	s2,0(sp)
    80003be8:	02010113          	addi	sp,sp,32
    80003bec:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003bf0:	01000513          	li	a0,16
    80003bf4:	ffffd097          	auipc	ra,0xffffd
    80003bf8:	784080e7          	jalr	1924(ra) # 80001378 <_Z9mem_allocm>
    80003bfc:	00a93423          	sd	a0,8(s2)
    80003c00:	00003717          	auipc	a4,0x3
    80003c04:	1b070713          	addi	a4,a4,432 # 80006db0 <_ZN9Scheduler9singletonE>
    80003c08:	00073783          	ld	a5,0(a4)
    80003c0c:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80003c10:	00073783          	ld	a5,0(a4)
    80003c14:	0007b783          	ld	a5,0(a5)
    80003c18:	00978023          	sb	s1,0(a5)
    80003c1c:	0084d693          	srli	a3,s1,0x8
    80003c20:	00d780a3          	sb	a3,1(a5)
    80003c24:	0104d693          	srli	a3,s1,0x10
    80003c28:	00d78123          	sb	a3,2(a5)
    80003c2c:	0184d69b          	srliw	a3,s1,0x18
    80003c30:	00d781a3          	sb	a3,3(a5)
    80003c34:	0204d693          	srli	a3,s1,0x20
    80003c38:	00d78223          	sb	a3,4(a5)
    80003c3c:	0284d693          	srli	a3,s1,0x28
    80003c40:	00d782a3          	sb	a3,5(a5)
    80003c44:	0304d693          	srli	a3,s1,0x30
    80003c48:	00d78323          	sb	a3,6(a5)
    80003c4c:	0384d493          	srli	s1,s1,0x38
    80003c50:	009783a3          	sb	s1,7(a5)
        singleton->head->next = nullptr;
    80003c54:	00073783          	ld	a5,0(a4)
    80003c58:	0007b783          	ld	a5,0(a5)
    80003c5c:	00078423          	sb	zero,8(a5)
    80003c60:	000784a3          	sb	zero,9(a5)
    80003c64:	00078523          	sb	zero,10(a5)
    80003c68:	000785a3          	sb	zero,11(a5)
    80003c6c:	00078623          	sb	zero,12(a5)
    80003c70:	000786a3          	sb	zero,13(a5)
    80003c74:	00078723          	sb	zero,14(a5)
    80003c78:	000787a3          	sb	zero,15(a5)
    80003c7c:	f5dff06f          	j	80003bd8 <_ZN9Scheduler3putEP7_thread+0x148>

0000000080003c80 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80003c80:	fe010113          	addi	sp,sp,-32
    80003c84:	00113c23          	sd	ra,24(sp)
    80003c88:	00813823          	sd	s0,16(sp)
    80003c8c:	00913423          	sd	s1,8(sp)
    80003c90:	02010413          	addi	s0,sp,32
    ThreadList* tmp = singleton->head;
    80003c94:	00003697          	auipc	a3,0x3
    80003c98:	11c6b683          	ld	a3,284(a3) # 80006db0 <_ZN9Scheduler9singletonE>
    80003c9c:	0006b503          	ld	a0,0(a3)
    if(tmp == nullptr){
    80003ca0:	0c050c63          	beqz	a0,80003d78 <_ZN9Scheduler3getEv+0xf8>
        return nullptr;
    }
    thread_t thread = tmp->thread;
    80003ca4:	00054483          	lbu	s1,0(a0)
    80003ca8:	00154783          	lbu	a5,1(a0)
    80003cac:	00879793          	slli	a5,a5,0x8
    80003cb0:	0097e7b3          	or	a5,a5,s1
    80003cb4:	00254483          	lbu	s1,2(a0)
    80003cb8:	01049493          	slli	s1,s1,0x10
    80003cbc:	00f4e7b3          	or	a5,s1,a5
    80003cc0:	00354483          	lbu	s1,3(a0)
    80003cc4:	01849493          	slli	s1,s1,0x18
    80003cc8:	00f4e4b3          	or	s1,s1,a5
    80003ccc:	00454783          	lbu	a5,4(a0)
    80003cd0:	02079793          	slli	a5,a5,0x20
    80003cd4:	0097e4b3          	or	s1,a5,s1
    80003cd8:	00554783          	lbu	a5,5(a0)
    80003cdc:	02879793          	slli	a5,a5,0x28
    80003ce0:	0097e7b3          	or	a5,a5,s1
    80003ce4:	00654483          	lbu	s1,6(a0)
    80003ce8:	03049493          	slli	s1,s1,0x30
    80003cec:	00f4e7b3          	or	a5,s1,a5
    80003cf0:	00754483          	lbu	s1,7(a0)
    80003cf4:	03849493          	slli	s1,s1,0x38
    80003cf8:	00f4e4b3          	or	s1,s1,a5
    singleton->head = tmp->next;
    80003cfc:	00854783          	lbu	a5,8(a0)
    80003d00:	00954703          	lbu	a4,9(a0)
    80003d04:	00871713          	slli	a4,a4,0x8
    80003d08:	00f76733          	or	a4,a4,a5
    80003d0c:	00a54783          	lbu	a5,10(a0)
    80003d10:	01079793          	slli	a5,a5,0x10
    80003d14:	00e7e733          	or	a4,a5,a4
    80003d18:	00b54783          	lbu	a5,11(a0)
    80003d1c:	01879793          	slli	a5,a5,0x18
    80003d20:	00e7e7b3          	or	a5,a5,a4
    80003d24:	00c54703          	lbu	a4,12(a0)
    80003d28:	02071713          	slli	a4,a4,0x20
    80003d2c:	00f767b3          	or	a5,a4,a5
    80003d30:	00d54703          	lbu	a4,13(a0)
    80003d34:	02871713          	slli	a4,a4,0x28
    80003d38:	00f76733          	or	a4,a4,a5
    80003d3c:	00e54783          	lbu	a5,14(a0)
    80003d40:	03079793          	slli	a5,a5,0x30
    80003d44:	00e7e733          	or	a4,a5,a4
    80003d48:	00f54783          	lbu	a5,15(a0)
    80003d4c:	03879793          	slli	a5,a5,0x38
    80003d50:	00e7e7b3          	or	a5,a5,a4
    80003d54:	00f6b023          	sd	a5,0(a3)
    mem_free(tmp);
    80003d58:	ffffd097          	auipc	ra,0xffffd
    80003d5c:	650080e7          	jalr	1616(ra) # 800013a8 <_Z8mem_freePv>
    return thread;
}
    80003d60:	00048513          	mv	a0,s1
    80003d64:	01813083          	ld	ra,24(sp)
    80003d68:	01013403          	ld	s0,16(sp)
    80003d6c:	00813483          	ld	s1,8(sp)
    80003d70:	02010113          	addi	sp,sp,32
    80003d74:	00008067          	ret
        return nullptr;
    80003d78:	00050493          	mv	s1,a0
    80003d7c:	fe5ff06f          	j	80003d60 <_ZN9Scheduler3getEv+0xe0>

0000000080003d80 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80003d80:	ff010113          	addi	sp,sp,-16
    80003d84:	00813423          	sd	s0,8(sp)
    80003d88:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80003d8c:	00003797          	auipc	a5,0x3
    80003d90:	0247b783          	ld	a5,36(a5) # 80006db0 <_ZN9Scheduler9singletonE>
    80003d94:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80003d98:	00000513          	li	a0,0
    while(tmp != nullptr){
    80003d9c:	06078263          	beqz	a5,80003e00 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80003da0:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80003da4:	0087c683          	lbu	a3,8(a5)
    80003da8:	0097c703          	lbu	a4,9(a5)
    80003dac:	00871713          	slli	a4,a4,0x8
    80003db0:	00d766b3          	or	a3,a4,a3
    80003db4:	00a7c703          	lbu	a4,10(a5)
    80003db8:	01071713          	slli	a4,a4,0x10
    80003dbc:	00d76733          	or	a4,a4,a3
    80003dc0:	00b7c683          	lbu	a3,11(a5)
    80003dc4:	01869693          	slli	a3,a3,0x18
    80003dc8:	00e6e733          	or	a4,a3,a4
    80003dcc:	00c7c683          	lbu	a3,12(a5)
    80003dd0:	02069693          	slli	a3,a3,0x20
    80003dd4:	00e6e6b3          	or	a3,a3,a4
    80003dd8:	00d7c703          	lbu	a4,13(a5)
    80003ddc:	02871713          	slli	a4,a4,0x28
    80003de0:	00d766b3          	or	a3,a4,a3
    80003de4:	00e7c703          	lbu	a4,14(a5)
    80003de8:	03071713          	slli	a4,a4,0x30
    80003dec:	00d76733          	or	a4,a4,a3
    80003df0:	00f7c783          	lbu	a5,15(a5)
    80003df4:	03879793          	slli	a5,a5,0x38
    80003df8:	00e7e7b3          	or	a5,a5,a4
    while(tmp != nullptr){
    80003dfc:	fa1ff06f          	j	80003d9c <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80003e00:	00813403          	ld	s0,8(sp)
    80003e04:	01010113          	addi	sp,sp,16
    80003e08:	00008067          	ret

0000000080003e0c <start>:
    80003e0c:	ff010113          	addi	sp,sp,-16
    80003e10:	00813423          	sd	s0,8(sp)
    80003e14:	01010413          	addi	s0,sp,16
    80003e18:	300027f3          	csrr	a5,mstatus
    80003e1c:	ffffe737          	lui	a4,0xffffe
    80003e20:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff67df>
    80003e24:	00e7f7b3          	and	a5,a5,a4
    80003e28:	00001737          	lui	a4,0x1
    80003e2c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003e30:	00e7e7b3          	or	a5,a5,a4
    80003e34:	30079073          	csrw	mstatus,a5
    80003e38:	00000797          	auipc	a5,0x0
    80003e3c:	16078793          	addi	a5,a5,352 # 80003f98 <system_main>
    80003e40:	34179073          	csrw	mepc,a5
    80003e44:	00000793          	li	a5,0
    80003e48:	18079073          	csrw	satp,a5
    80003e4c:	000107b7          	lui	a5,0x10
    80003e50:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003e54:	30279073          	csrw	medeleg,a5
    80003e58:	30379073          	csrw	mideleg,a5
    80003e5c:	104027f3          	csrr	a5,sie
    80003e60:	2227e793          	ori	a5,a5,546
    80003e64:	10479073          	csrw	sie,a5
    80003e68:	fff00793          	li	a5,-1
    80003e6c:	00a7d793          	srli	a5,a5,0xa
    80003e70:	3b079073          	csrw	pmpaddr0,a5
    80003e74:	00f00793          	li	a5,15
    80003e78:	3a079073          	csrw	pmpcfg0,a5
    80003e7c:	f14027f3          	csrr	a5,mhartid
    80003e80:	0200c737          	lui	a4,0x200c
    80003e84:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003e88:	0007869b          	sext.w	a3,a5
    80003e8c:	00269713          	slli	a4,a3,0x2
    80003e90:	000f4637          	lui	a2,0xf4
    80003e94:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003e98:	00d70733          	add	a4,a4,a3
    80003e9c:	0037979b          	slliw	a5,a5,0x3
    80003ea0:	020046b7          	lui	a3,0x2004
    80003ea4:	00d787b3          	add	a5,a5,a3
    80003ea8:	00c585b3          	add	a1,a1,a2
    80003eac:	00371693          	slli	a3,a4,0x3
    80003eb0:	00003717          	auipc	a4,0x3
    80003eb4:	f1070713          	addi	a4,a4,-240 # 80006dc0 <timer_scratch>
    80003eb8:	00b7b023          	sd	a1,0(a5)
    80003ebc:	00d70733          	add	a4,a4,a3
    80003ec0:	00f73c23          	sd	a5,24(a4)
    80003ec4:	02c73023          	sd	a2,32(a4)
    80003ec8:	34071073          	csrw	mscratch,a4
    80003ecc:	00000797          	auipc	a5,0x0
    80003ed0:	6e478793          	addi	a5,a5,1764 # 800045b0 <timervec>
    80003ed4:	30579073          	csrw	mtvec,a5
    80003ed8:	300027f3          	csrr	a5,mstatus
    80003edc:	0087e793          	ori	a5,a5,8
    80003ee0:	30079073          	csrw	mstatus,a5
    80003ee4:	304027f3          	csrr	a5,mie
    80003ee8:	0807e793          	ori	a5,a5,128
    80003eec:	30479073          	csrw	mie,a5
    80003ef0:	f14027f3          	csrr	a5,mhartid
    80003ef4:	0007879b          	sext.w	a5,a5
    80003ef8:	00078213          	mv	tp,a5
    80003efc:	30200073          	mret
    80003f00:	00813403          	ld	s0,8(sp)
    80003f04:	01010113          	addi	sp,sp,16
    80003f08:	00008067          	ret

0000000080003f0c <timerinit>:
    80003f0c:	ff010113          	addi	sp,sp,-16
    80003f10:	00813423          	sd	s0,8(sp)
    80003f14:	01010413          	addi	s0,sp,16
    80003f18:	f14027f3          	csrr	a5,mhartid
    80003f1c:	0200c737          	lui	a4,0x200c
    80003f20:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003f24:	0007869b          	sext.w	a3,a5
    80003f28:	00269713          	slli	a4,a3,0x2
    80003f2c:	000f4637          	lui	a2,0xf4
    80003f30:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003f34:	00d70733          	add	a4,a4,a3
    80003f38:	0037979b          	slliw	a5,a5,0x3
    80003f3c:	020046b7          	lui	a3,0x2004
    80003f40:	00d787b3          	add	a5,a5,a3
    80003f44:	00c585b3          	add	a1,a1,a2
    80003f48:	00371693          	slli	a3,a4,0x3
    80003f4c:	00003717          	auipc	a4,0x3
    80003f50:	e7470713          	addi	a4,a4,-396 # 80006dc0 <timer_scratch>
    80003f54:	00b7b023          	sd	a1,0(a5)
    80003f58:	00d70733          	add	a4,a4,a3
    80003f5c:	00f73c23          	sd	a5,24(a4)
    80003f60:	02c73023          	sd	a2,32(a4)
    80003f64:	34071073          	csrw	mscratch,a4
    80003f68:	00000797          	auipc	a5,0x0
    80003f6c:	64878793          	addi	a5,a5,1608 # 800045b0 <timervec>
    80003f70:	30579073          	csrw	mtvec,a5
    80003f74:	300027f3          	csrr	a5,mstatus
    80003f78:	0087e793          	ori	a5,a5,8
    80003f7c:	30079073          	csrw	mstatus,a5
    80003f80:	304027f3          	csrr	a5,mie
    80003f84:	0807e793          	ori	a5,a5,128
    80003f88:	30479073          	csrw	mie,a5
    80003f8c:	00813403          	ld	s0,8(sp)
    80003f90:	01010113          	addi	sp,sp,16
    80003f94:	00008067          	ret

0000000080003f98 <system_main>:
    80003f98:	fe010113          	addi	sp,sp,-32
    80003f9c:	00813823          	sd	s0,16(sp)
    80003fa0:	00913423          	sd	s1,8(sp)
    80003fa4:	00113c23          	sd	ra,24(sp)
    80003fa8:	02010413          	addi	s0,sp,32
    80003fac:	00000097          	auipc	ra,0x0
    80003fb0:	0c4080e7          	jalr	196(ra) # 80004070 <cpuid>
    80003fb4:	00003497          	auipc	s1,0x3
    80003fb8:	dac48493          	addi	s1,s1,-596 # 80006d60 <started>
    80003fbc:	02050263          	beqz	a0,80003fe0 <system_main+0x48>
    80003fc0:	0004a783          	lw	a5,0(s1)
    80003fc4:	0007879b          	sext.w	a5,a5
    80003fc8:	fe078ce3          	beqz	a5,80003fc0 <system_main+0x28>
    80003fcc:	0ff0000f          	fence
    80003fd0:	00002517          	auipc	a0,0x2
    80003fd4:	1d050513          	addi	a0,a0,464 # 800061a0 <CONSOLE_STATUS+0x190>
    80003fd8:	00001097          	auipc	ra,0x1
    80003fdc:	a74080e7          	jalr	-1420(ra) # 80004a4c <panic>
    80003fe0:	00001097          	auipc	ra,0x1
    80003fe4:	9c8080e7          	jalr	-1592(ra) # 800049a8 <consoleinit>
    80003fe8:	00001097          	auipc	ra,0x1
    80003fec:	154080e7          	jalr	340(ra) # 8000513c <printfinit>
    80003ff0:	00002517          	auipc	a0,0x2
    80003ff4:	29050513          	addi	a0,a0,656 # 80006280 <CONSOLE_STATUS+0x270>
    80003ff8:	00001097          	auipc	ra,0x1
    80003ffc:	ab0080e7          	jalr	-1360(ra) # 80004aa8 <__printf>
    80004000:	00002517          	auipc	a0,0x2
    80004004:	17050513          	addi	a0,a0,368 # 80006170 <CONSOLE_STATUS+0x160>
    80004008:	00001097          	auipc	ra,0x1
    8000400c:	aa0080e7          	jalr	-1376(ra) # 80004aa8 <__printf>
    80004010:	00002517          	auipc	a0,0x2
    80004014:	27050513          	addi	a0,a0,624 # 80006280 <CONSOLE_STATUS+0x270>
    80004018:	00001097          	auipc	ra,0x1
    8000401c:	a90080e7          	jalr	-1392(ra) # 80004aa8 <__printf>
    80004020:	00001097          	auipc	ra,0x1
    80004024:	4a8080e7          	jalr	1192(ra) # 800054c8 <kinit>
    80004028:	00000097          	auipc	ra,0x0
    8000402c:	148080e7          	jalr	328(ra) # 80004170 <trapinit>
    80004030:	00000097          	auipc	ra,0x0
    80004034:	16c080e7          	jalr	364(ra) # 8000419c <trapinithart>
    80004038:	00000097          	auipc	ra,0x0
    8000403c:	5b8080e7          	jalr	1464(ra) # 800045f0 <plicinit>
    80004040:	00000097          	auipc	ra,0x0
    80004044:	5d8080e7          	jalr	1496(ra) # 80004618 <plicinithart>
    80004048:	00000097          	auipc	ra,0x0
    8000404c:	078080e7          	jalr	120(ra) # 800040c0 <userinit>
    80004050:	0ff0000f          	fence
    80004054:	00100793          	li	a5,1
    80004058:	00002517          	auipc	a0,0x2
    8000405c:	13050513          	addi	a0,a0,304 # 80006188 <CONSOLE_STATUS+0x178>
    80004060:	00f4a023          	sw	a5,0(s1)
    80004064:	00001097          	auipc	ra,0x1
    80004068:	a44080e7          	jalr	-1468(ra) # 80004aa8 <__printf>
    8000406c:	0000006f          	j	8000406c <system_main+0xd4>

0000000080004070 <cpuid>:
    80004070:	ff010113          	addi	sp,sp,-16
    80004074:	00813423          	sd	s0,8(sp)
    80004078:	01010413          	addi	s0,sp,16
    8000407c:	00020513          	mv	a0,tp
    80004080:	00813403          	ld	s0,8(sp)
    80004084:	0005051b          	sext.w	a0,a0
    80004088:	01010113          	addi	sp,sp,16
    8000408c:	00008067          	ret

0000000080004090 <mycpu>:
    80004090:	ff010113          	addi	sp,sp,-16
    80004094:	00813423          	sd	s0,8(sp)
    80004098:	01010413          	addi	s0,sp,16
    8000409c:	00020793          	mv	a5,tp
    800040a0:	00813403          	ld	s0,8(sp)
    800040a4:	0007879b          	sext.w	a5,a5
    800040a8:	00779793          	slli	a5,a5,0x7
    800040ac:	00004517          	auipc	a0,0x4
    800040b0:	d4450513          	addi	a0,a0,-700 # 80007df0 <cpus>
    800040b4:	00f50533          	add	a0,a0,a5
    800040b8:	01010113          	addi	sp,sp,16
    800040bc:	00008067          	ret

00000000800040c0 <userinit>:
    800040c0:	ff010113          	addi	sp,sp,-16
    800040c4:	00813423          	sd	s0,8(sp)
    800040c8:	01010413          	addi	s0,sp,16
    800040cc:	00813403          	ld	s0,8(sp)
    800040d0:	01010113          	addi	sp,sp,16
    800040d4:	ffffd317          	auipc	t1,0xffffd
    800040d8:	68430067          	jr	1668(t1) # 80001758 <main>

00000000800040dc <either_copyout>:
    800040dc:	ff010113          	addi	sp,sp,-16
    800040e0:	00813023          	sd	s0,0(sp)
    800040e4:	00113423          	sd	ra,8(sp)
    800040e8:	01010413          	addi	s0,sp,16
    800040ec:	02051663          	bnez	a0,80004118 <either_copyout+0x3c>
    800040f0:	00058513          	mv	a0,a1
    800040f4:	00060593          	mv	a1,a2
    800040f8:	0006861b          	sext.w	a2,a3
    800040fc:	00002097          	auipc	ra,0x2
    80004100:	c58080e7          	jalr	-936(ra) # 80005d54 <__memmove>
    80004104:	00813083          	ld	ra,8(sp)
    80004108:	00013403          	ld	s0,0(sp)
    8000410c:	00000513          	li	a0,0
    80004110:	01010113          	addi	sp,sp,16
    80004114:	00008067          	ret
    80004118:	00002517          	auipc	a0,0x2
    8000411c:	0b050513          	addi	a0,a0,176 # 800061c8 <CONSOLE_STATUS+0x1b8>
    80004120:	00001097          	auipc	ra,0x1
    80004124:	92c080e7          	jalr	-1748(ra) # 80004a4c <panic>

0000000080004128 <either_copyin>:
    80004128:	ff010113          	addi	sp,sp,-16
    8000412c:	00813023          	sd	s0,0(sp)
    80004130:	00113423          	sd	ra,8(sp)
    80004134:	01010413          	addi	s0,sp,16
    80004138:	02059463          	bnez	a1,80004160 <either_copyin+0x38>
    8000413c:	00060593          	mv	a1,a2
    80004140:	0006861b          	sext.w	a2,a3
    80004144:	00002097          	auipc	ra,0x2
    80004148:	c10080e7          	jalr	-1008(ra) # 80005d54 <__memmove>
    8000414c:	00813083          	ld	ra,8(sp)
    80004150:	00013403          	ld	s0,0(sp)
    80004154:	00000513          	li	a0,0
    80004158:	01010113          	addi	sp,sp,16
    8000415c:	00008067          	ret
    80004160:	00002517          	auipc	a0,0x2
    80004164:	09050513          	addi	a0,a0,144 # 800061f0 <CONSOLE_STATUS+0x1e0>
    80004168:	00001097          	auipc	ra,0x1
    8000416c:	8e4080e7          	jalr	-1820(ra) # 80004a4c <panic>

0000000080004170 <trapinit>:
    80004170:	ff010113          	addi	sp,sp,-16
    80004174:	00813423          	sd	s0,8(sp)
    80004178:	01010413          	addi	s0,sp,16
    8000417c:	00813403          	ld	s0,8(sp)
    80004180:	00002597          	auipc	a1,0x2
    80004184:	09858593          	addi	a1,a1,152 # 80006218 <CONSOLE_STATUS+0x208>
    80004188:	00004517          	auipc	a0,0x4
    8000418c:	ce850513          	addi	a0,a0,-792 # 80007e70 <tickslock>
    80004190:	01010113          	addi	sp,sp,16
    80004194:	00001317          	auipc	t1,0x1
    80004198:	5c430067          	jr	1476(t1) # 80005758 <initlock>

000000008000419c <trapinithart>:
    8000419c:	ff010113          	addi	sp,sp,-16
    800041a0:	00813423          	sd	s0,8(sp)
    800041a4:	01010413          	addi	s0,sp,16
    800041a8:	00000797          	auipc	a5,0x0
    800041ac:	2f878793          	addi	a5,a5,760 # 800044a0 <kernelvec>
    800041b0:	10579073          	csrw	stvec,a5
    800041b4:	00813403          	ld	s0,8(sp)
    800041b8:	01010113          	addi	sp,sp,16
    800041bc:	00008067          	ret

00000000800041c0 <usertrap>:
    800041c0:	ff010113          	addi	sp,sp,-16
    800041c4:	00813423          	sd	s0,8(sp)
    800041c8:	01010413          	addi	s0,sp,16
    800041cc:	00813403          	ld	s0,8(sp)
    800041d0:	01010113          	addi	sp,sp,16
    800041d4:	00008067          	ret

00000000800041d8 <usertrapret>:
    800041d8:	ff010113          	addi	sp,sp,-16
    800041dc:	00813423          	sd	s0,8(sp)
    800041e0:	01010413          	addi	s0,sp,16
    800041e4:	00813403          	ld	s0,8(sp)
    800041e8:	01010113          	addi	sp,sp,16
    800041ec:	00008067          	ret

00000000800041f0 <kerneltrap>:
    800041f0:	fe010113          	addi	sp,sp,-32
    800041f4:	00813823          	sd	s0,16(sp)
    800041f8:	00113c23          	sd	ra,24(sp)
    800041fc:	00913423          	sd	s1,8(sp)
    80004200:	02010413          	addi	s0,sp,32
    80004204:	142025f3          	csrr	a1,scause
    80004208:	100027f3          	csrr	a5,sstatus
    8000420c:	0027f793          	andi	a5,a5,2
    80004210:	10079c63          	bnez	a5,80004328 <kerneltrap+0x138>
    80004214:	142027f3          	csrr	a5,scause
    80004218:	0207ce63          	bltz	a5,80004254 <kerneltrap+0x64>
    8000421c:	00002517          	auipc	a0,0x2
    80004220:	04450513          	addi	a0,a0,68 # 80006260 <CONSOLE_STATUS+0x250>
    80004224:	00001097          	auipc	ra,0x1
    80004228:	884080e7          	jalr	-1916(ra) # 80004aa8 <__printf>
    8000422c:	141025f3          	csrr	a1,sepc
    80004230:	14302673          	csrr	a2,stval
    80004234:	00002517          	auipc	a0,0x2
    80004238:	03c50513          	addi	a0,a0,60 # 80006270 <CONSOLE_STATUS+0x260>
    8000423c:	00001097          	auipc	ra,0x1
    80004240:	86c080e7          	jalr	-1940(ra) # 80004aa8 <__printf>
    80004244:	00002517          	auipc	a0,0x2
    80004248:	04450513          	addi	a0,a0,68 # 80006288 <CONSOLE_STATUS+0x278>
    8000424c:	00001097          	auipc	ra,0x1
    80004250:	800080e7          	jalr	-2048(ra) # 80004a4c <panic>
    80004254:	0ff7f713          	andi	a4,a5,255
    80004258:	00900693          	li	a3,9
    8000425c:	04d70063          	beq	a4,a3,8000429c <kerneltrap+0xac>
    80004260:	fff00713          	li	a4,-1
    80004264:	03f71713          	slli	a4,a4,0x3f
    80004268:	00170713          	addi	a4,a4,1
    8000426c:	fae798e3          	bne	a5,a4,8000421c <kerneltrap+0x2c>
    80004270:	00000097          	auipc	ra,0x0
    80004274:	e00080e7          	jalr	-512(ra) # 80004070 <cpuid>
    80004278:	06050663          	beqz	a0,800042e4 <kerneltrap+0xf4>
    8000427c:	144027f3          	csrr	a5,sip
    80004280:	ffd7f793          	andi	a5,a5,-3
    80004284:	14479073          	csrw	sip,a5
    80004288:	01813083          	ld	ra,24(sp)
    8000428c:	01013403          	ld	s0,16(sp)
    80004290:	00813483          	ld	s1,8(sp)
    80004294:	02010113          	addi	sp,sp,32
    80004298:	00008067          	ret
    8000429c:	00000097          	auipc	ra,0x0
    800042a0:	3c8080e7          	jalr	968(ra) # 80004664 <plic_claim>
    800042a4:	00a00793          	li	a5,10
    800042a8:	00050493          	mv	s1,a0
    800042ac:	06f50863          	beq	a0,a5,8000431c <kerneltrap+0x12c>
    800042b0:	fc050ce3          	beqz	a0,80004288 <kerneltrap+0x98>
    800042b4:	00050593          	mv	a1,a0
    800042b8:	00002517          	auipc	a0,0x2
    800042bc:	f8850513          	addi	a0,a0,-120 # 80006240 <CONSOLE_STATUS+0x230>
    800042c0:	00000097          	auipc	ra,0x0
    800042c4:	7e8080e7          	jalr	2024(ra) # 80004aa8 <__printf>
    800042c8:	01013403          	ld	s0,16(sp)
    800042cc:	01813083          	ld	ra,24(sp)
    800042d0:	00048513          	mv	a0,s1
    800042d4:	00813483          	ld	s1,8(sp)
    800042d8:	02010113          	addi	sp,sp,32
    800042dc:	00000317          	auipc	t1,0x0
    800042e0:	3c030067          	jr	960(t1) # 8000469c <plic_complete>
    800042e4:	00004517          	auipc	a0,0x4
    800042e8:	b8c50513          	addi	a0,a0,-1140 # 80007e70 <tickslock>
    800042ec:	00001097          	auipc	ra,0x1
    800042f0:	490080e7          	jalr	1168(ra) # 8000577c <acquire>
    800042f4:	00003717          	auipc	a4,0x3
    800042f8:	a7070713          	addi	a4,a4,-1424 # 80006d64 <ticks>
    800042fc:	00072783          	lw	a5,0(a4)
    80004300:	00004517          	auipc	a0,0x4
    80004304:	b7050513          	addi	a0,a0,-1168 # 80007e70 <tickslock>
    80004308:	0017879b          	addiw	a5,a5,1
    8000430c:	00f72023          	sw	a5,0(a4)
    80004310:	00001097          	auipc	ra,0x1
    80004314:	538080e7          	jalr	1336(ra) # 80005848 <release>
    80004318:	f65ff06f          	j	8000427c <kerneltrap+0x8c>
    8000431c:	00001097          	auipc	ra,0x1
    80004320:	094080e7          	jalr	148(ra) # 800053b0 <uartintr>
    80004324:	fa5ff06f          	j	800042c8 <kerneltrap+0xd8>
    80004328:	00002517          	auipc	a0,0x2
    8000432c:	ef850513          	addi	a0,a0,-264 # 80006220 <CONSOLE_STATUS+0x210>
    80004330:	00000097          	auipc	ra,0x0
    80004334:	71c080e7          	jalr	1820(ra) # 80004a4c <panic>

0000000080004338 <clockintr>:
    80004338:	fe010113          	addi	sp,sp,-32
    8000433c:	00813823          	sd	s0,16(sp)
    80004340:	00913423          	sd	s1,8(sp)
    80004344:	00113c23          	sd	ra,24(sp)
    80004348:	02010413          	addi	s0,sp,32
    8000434c:	00004497          	auipc	s1,0x4
    80004350:	b2448493          	addi	s1,s1,-1244 # 80007e70 <tickslock>
    80004354:	00048513          	mv	a0,s1
    80004358:	00001097          	auipc	ra,0x1
    8000435c:	424080e7          	jalr	1060(ra) # 8000577c <acquire>
    80004360:	00003717          	auipc	a4,0x3
    80004364:	a0470713          	addi	a4,a4,-1532 # 80006d64 <ticks>
    80004368:	00072783          	lw	a5,0(a4)
    8000436c:	01013403          	ld	s0,16(sp)
    80004370:	01813083          	ld	ra,24(sp)
    80004374:	00048513          	mv	a0,s1
    80004378:	0017879b          	addiw	a5,a5,1
    8000437c:	00813483          	ld	s1,8(sp)
    80004380:	00f72023          	sw	a5,0(a4)
    80004384:	02010113          	addi	sp,sp,32
    80004388:	00001317          	auipc	t1,0x1
    8000438c:	4c030067          	jr	1216(t1) # 80005848 <release>

0000000080004390 <devintr>:
    80004390:	142027f3          	csrr	a5,scause
    80004394:	00000513          	li	a0,0
    80004398:	0007c463          	bltz	a5,800043a0 <devintr+0x10>
    8000439c:	00008067          	ret
    800043a0:	fe010113          	addi	sp,sp,-32
    800043a4:	00813823          	sd	s0,16(sp)
    800043a8:	00113c23          	sd	ra,24(sp)
    800043ac:	00913423          	sd	s1,8(sp)
    800043b0:	02010413          	addi	s0,sp,32
    800043b4:	0ff7f713          	andi	a4,a5,255
    800043b8:	00900693          	li	a3,9
    800043bc:	04d70c63          	beq	a4,a3,80004414 <devintr+0x84>
    800043c0:	fff00713          	li	a4,-1
    800043c4:	03f71713          	slli	a4,a4,0x3f
    800043c8:	00170713          	addi	a4,a4,1
    800043cc:	00e78c63          	beq	a5,a4,800043e4 <devintr+0x54>
    800043d0:	01813083          	ld	ra,24(sp)
    800043d4:	01013403          	ld	s0,16(sp)
    800043d8:	00813483          	ld	s1,8(sp)
    800043dc:	02010113          	addi	sp,sp,32
    800043e0:	00008067          	ret
    800043e4:	00000097          	auipc	ra,0x0
    800043e8:	c8c080e7          	jalr	-884(ra) # 80004070 <cpuid>
    800043ec:	06050663          	beqz	a0,80004458 <devintr+0xc8>
    800043f0:	144027f3          	csrr	a5,sip
    800043f4:	ffd7f793          	andi	a5,a5,-3
    800043f8:	14479073          	csrw	sip,a5
    800043fc:	01813083          	ld	ra,24(sp)
    80004400:	01013403          	ld	s0,16(sp)
    80004404:	00813483          	ld	s1,8(sp)
    80004408:	00200513          	li	a0,2
    8000440c:	02010113          	addi	sp,sp,32
    80004410:	00008067          	ret
    80004414:	00000097          	auipc	ra,0x0
    80004418:	250080e7          	jalr	592(ra) # 80004664 <plic_claim>
    8000441c:	00a00793          	li	a5,10
    80004420:	00050493          	mv	s1,a0
    80004424:	06f50663          	beq	a0,a5,80004490 <devintr+0x100>
    80004428:	00100513          	li	a0,1
    8000442c:	fa0482e3          	beqz	s1,800043d0 <devintr+0x40>
    80004430:	00048593          	mv	a1,s1
    80004434:	00002517          	auipc	a0,0x2
    80004438:	e0c50513          	addi	a0,a0,-500 # 80006240 <CONSOLE_STATUS+0x230>
    8000443c:	00000097          	auipc	ra,0x0
    80004440:	66c080e7          	jalr	1644(ra) # 80004aa8 <__printf>
    80004444:	00048513          	mv	a0,s1
    80004448:	00000097          	auipc	ra,0x0
    8000444c:	254080e7          	jalr	596(ra) # 8000469c <plic_complete>
    80004450:	00100513          	li	a0,1
    80004454:	f7dff06f          	j	800043d0 <devintr+0x40>
    80004458:	00004517          	auipc	a0,0x4
    8000445c:	a1850513          	addi	a0,a0,-1512 # 80007e70 <tickslock>
    80004460:	00001097          	auipc	ra,0x1
    80004464:	31c080e7          	jalr	796(ra) # 8000577c <acquire>
    80004468:	00003717          	auipc	a4,0x3
    8000446c:	8fc70713          	addi	a4,a4,-1796 # 80006d64 <ticks>
    80004470:	00072783          	lw	a5,0(a4)
    80004474:	00004517          	auipc	a0,0x4
    80004478:	9fc50513          	addi	a0,a0,-1540 # 80007e70 <tickslock>
    8000447c:	0017879b          	addiw	a5,a5,1
    80004480:	00f72023          	sw	a5,0(a4)
    80004484:	00001097          	auipc	ra,0x1
    80004488:	3c4080e7          	jalr	964(ra) # 80005848 <release>
    8000448c:	f65ff06f          	j	800043f0 <devintr+0x60>
    80004490:	00001097          	auipc	ra,0x1
    80004494:	f20080e7          	jalr	-224(ra) # 800053b0 <uartintr>
    80004498:	fadff06f          	j	80004444 <devintr+0xb4>
    8000449c:	0000                	unimp
	...

00000000800044a0 <kernelvec>:
    800044a0:	f0010113          	addi	sp,sp,-256
    800044a4:	00113023          	sd	ra,0(sp)
    800044a8:	00213423          	sd	sp,8(sp)
    800044ac:	00313823          	sd	gp,16(sp)
    800044b0:	00413c23          	sd	tp,24(sp)
    800044b4:	02513023          	sd	t0,32(sp)
    800044b8:	02613423          	sd	t1,40(sp)
    800044bc:	02713823          	sd	t2,48(sp)
    800044c0:	02813c23          	sd	s0,56(sp)
    800044c4:	04913023          	sd	s1,64(sp)
    800044c8:	04a13423          	sd	a0,72(sp)
    800044cc:	04b13823          	sd	a1,80(sp)
    800044d0:	04c13c23          	sd	a2,88(sp)
    800044d4:	06d13023          	sd	a3,96(sp)
    800044d8:	06e13423          	sd	a4,104(sp)
    800044dc:	06f13823          	sd	a5,112(sp)
    800044e0:	07013c23          	sd	a6,120(sp)
    800044e4:	09113023          	sd	a7,128(sp)
    800044e8:	09213423          	sd	s2,136(sp)
    800044ec:	09313823          	sd	s3,144(sp)
    800044f0:	09413c23          	sd	s4,152(sp)
    800044f4:	0b513023          	sd	s5,160(sp)
    800044f8:	0b613423          	sd	s6,168(sp)
    800044fc:	0b713823          	sd	s7,176(sp)
    80004500:	0b813c23          	sd	s8,184(sp)
    80004504:	0d913023          	sd	s9,192(sp)
    80004508:	0da13423          	sd	s10,200(sp)
    8000450c:	0db13823          	sd	s11,208(sp)
    80004510:	0dc13c23          	sd	t3,216(sp)
    80004514:	0fd13023          	sd	t4,224(sp)
    80004518:	0fe13423          	sd	t5,232(sp)
    8000451c:	0ff13823          	sd	t6,240(sp)
    80004520:	cd1ff0ef          	jal	ra,800041f0 <kerneltrap>
    80004524:	00013083          	ld	ra,0(sp)
    80004528:	00813103          	ld	sp,8(sp)
    8000452c:	01013183          	ld	gp,16(sp)
    80004530:	02013283          	ld	t0,32(sp)
    80004534:	02813303          	ld	t1,40(sp)
    80004538:	03013383          	ld	t2,48(sp)
    8000453c:	03813403          	ld	s0,56(sp)
    80004540:	04013483          	ld	s1,64(sp)
    80004544:	04813503          	ld	a0,72(sp)
    80004548:	05013583          	ld	a1,80(sp)
    8000454c:	05813603          	ld	a2,88(sp)
    80004550:	06013683          	ld	a3,96(sp)
    80004554:	06813703          	ld	a4,104(sp)
    80004558:	07013783          	ld	a5,112(sp)
    8000455c:	07813803          	ld	a6,120(sp)
    80004560:	08013883          	ld	a7,128(sp)
    80004564:	08813903          	ld	s2,136(sp)
    80004568:	09013983          	ld	s3,144(sp)
    8000456c:	09813a03          	ld	s4,152(sp)
    80004570:	0a013a83          	ld	s5,160(sp)
    80004574:	0a813b03          	ld	s6,168(sp)
    80004578:	0b013b83          	ld	s7,176(sp)
    8000457c:	0b813c03          	ld	s8,184(sp)
    80004580:	0c013c83          	ld	s9,192(sp)
    80004584:	0c813d03          	ld	s10,200(sp)
    80004588:	0d013d83          	ld	s11,208(sp)
    8000458c:	0d813e03          	ld	t3,216(sp)
    80004590:	0e013e83          	ld	t4,224(sp)
    80004594:	0e813f03          	ld	t5,232(sp)
    80004598:	0f013f83          	ld	t6,240(sp)
    8000459c:	10010113          	addi	sp,sp,256
    800045a0:	10200073          	sret
    800045a4:	00000013          	nop
    800045a8:	00000013          	nop
    800045ac:	00000013          	nop

00000000800045b0 <timervec>:
    800045b0:	34051573          	csrrw	a0,mscratch,a0
    800045b4:	00b53023          	sd	a1,0(a0)
    800045b8:	00c53423          	sd	a2,8(a0)
    800045bc:	00d53823          	sd	a3,16(a0)
    800045c0:	01853583          	ld	a1,24(a0)
    800045c4:	02053603          	ld	a2,32(a0)
    800045c8:	0005b683          	ld	a3,0(a1)
    800045cc:	00c686b3          	add	a3,a3,a2
    800045d0:	00d5b023          	sd	a3,0(a1)
    800045d4:	00200593          	li	a1,2
    800045d8:	14459073          	csrw	sip,a1
    800045dc:	01053683          	ld	a3,16(a0)
    800045e0:	00853603          	ld	a2,8(a0)
    800045e4:	00053583          	ld	a1,0(a0)
    800045e8:	34051573          	csrrw	a0,mscratch,a0
    800045ec:	30200073          	mret

00000000800045f0 <plicinit>:
    800045f0:	ff010113          	addi	sp,sp,-16
    800045f4:	00813423          	sd	s0,8(sp)
    800045f8:	01010413          	addi	s0,sp,16
    800045fc:	00813403          	ld	s0,8(sp)
    80004600:	0c0007b7          	lui	a5,0xc000
    80004604:	00100713          	li	a4,1
    80004608:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000460c:	00e7a223          	sw	a4,4(a5)
    80004610:	01010113          	addi	sp,sp,16
    80004614:	00008067          	ret

0000000080004618 <plicinithart>:
    80004618:	ff010113          	addi	sp,sp,-16
    8000461c:	00813023          	sd	s0,0(sp)
    80004620:	00113423          	sd	ra,8(sp)
    80004624:	01010413          	addi	s0,sp,16
    80004628:	00000097          	auipc	ra,0x0
    8000462c:	a48080e7          	jalr	-1464(ra) # 80004070 <cpuid>
    80004630:	0085171b          	slliw	a4,a0,0x8
    80004634:	0c0027b7          	lui	a5,0xc002
    80004638:	00e787b3          	add	a5,a5,a4
    8000463c:	40200713          	li	a4,1026
    80004640:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80004644:	00813083          	ld	ra,8(sp)
    80004648:	00013403          	ld	s0,0(sp)
    8000464c:	00d5151b          	slliw	a0,a0,0xd
    80004650:	0c2017b7          	lui	a5,0xc201
    80004654:	00a78533          	add	a0,a5,a0
    80004658:	00052023          	sw	zero,0(a0)
    8000465c:	01010113          	addi	sp,sp,16
    80004660:	00008067          	ret

0000000080004664 <plic_claim>:
    80004664:	ff010113          	addi	sp,sp,-16
    80004668:	00813023          	sd	s0,0(sp)
    8000466c:	00113423          	sd	ra,8(sp)
    80004670:	01010413          	addi	s0,sp,16
    80004674:	00000097          	auipc	ra,0x0
    80004678:	9fc080e7          	jalr	-1540(ra) # 80004070 <cpuid>
    8000467c:	00813083          	ld	ra,8(sp)
    80004680:	00013403          	ld	s0,0(sp)
    80004684:	00d5151b          	slliw	a0,a0,0xd
    80004688:	0c2017b7          	lui	a5,0xc201
    8000468c:	00a78533          	add	a0,a5,a0
    80004690:	00452503          	lw	a0,4(a0)
    80004694:	01010113          	addi	sp,sp,16
    80004698:	00008067          	ret

000000008000469c <plic_complete>:
    8000469c:	fe010113          	addi	sp,sp,-32
    800046a0:	00813823          	sd	s0,16(sp)
    800046a4:	00913423          	sd	s1,8(sp)
    800046a8:	00113c23          	sd	ra,24(sp)
    800046ac:	02010413          	addi	s0,sp,32
    800046b0:	00050493          	mv	s1,a0
    800046b4:	00000097          	auipc	ra,0x0
    800046b8:	9bc080e7          	jalr	-1604(ra) # 80004070 <cpuid>
    800046bc:	01813083          	ld	ra,24(sp)
    800046c0:	01013403          	ld	s0,16(sp)
    800046c4:	00d5179b          	slliw	a5,a0,0xd
    800046c8:	0c201737          	lui	a4,0xc201
    800046cc:	00f707b3          	add	a5,a4,a5
    800046d0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800046d4:	00813483          	ld	s1,8(sp)
    800046d8:	02010113          	addi	sp,sp,32
    800046dc:	00008067          	ret

00000000800046e0 <consolewrite>:
    800046e0:	fb010113          	addi	sp,sp,-80
    800046e4:	04813023          	sd	s0,64(sp)
    800046e8:	04113423          	sd	ra,72(sp)
    800046ec:	02913c23          	sd	s1,56(sp)
    800046f0:	03213823          	sd	s2,48(sp)
    800046f4:	03313423          	sd	s3,40(sp)
    800046f8:	03413023          	sd	s4,32(sp)
    800046fc:	01513c23          	sd	s5,24(sp)
    80004700:	05010413          	addi	s0,sp,80
    80004704:	06c05c63          	blez	a2,8000477c <consolewrite+0x9c>
    80004708:	00060993          	mv	s3,a2
    8000470c:	00050a13          	mv	s4,a0
    80004710:	00058493          	mv	s1,a1
    80004714:	00000913          	li	s2,0
    80004718:	fff00a93          	li	s5,-1
    8000471c:	01c0006f          	j	80004738 <consolewrite+0x58>
    80004720:	fbf44503          	lbu	a0,-65(s0)
    80004724:	0019091b          	addiw	s2,s2,1
    80004728:	00148493          	addi	s1,s1,1
    8000472c:	00001097          	auipc	ra,0x1
    80004730:	a9c080e7          	jalr	-1380(ra) # 800051c8 <uartputc>
    80004734:	03298063          	beq	s3,s2,80004754 <consolewrite+0x74>
    80004738:	00048613          	mv	a2,s1
    8000473c:	00100693          	li	a3,1
    80004740:	000a0593          	mv	a1,s4
    80004744:	fbf40513          	addi	a0,s0,-65
    80004748:	00000097          	auipc	ra,0x0
    8000474c:	9e0080e7          	jalr	-1568(ra) # 80004128 <either_copyin>
    80004750:	fd5518e3          	bne	a0,s5,80004720 <consolewrite+0x40>
    80004754:	04813083          	ld	ra,72(sp)
    80004758:	04013403          	ld	s0,64(sp)
    8000475c:	03813483          	ld	s1,56(sp)
    80004760:	02813983          	ld	s3,40(sp)
    80004764:	02013a03          	ld	s4,32(sp)
    80004768:	01813a83          	ld	s5,24(sp)
    8000476c:	00090513          	mv	a0,s2
    80004770:	03013903          	ld	s2,48(sp)
    80004774:	05010113          	addi	sp,sp,80
    80004778:	00008067          	ret
    8000477c:	00000913          	li	s2,0
    80004780:	fd5ff06f          	j	80004754 <consolewrite+0x74>

0000000080004784 <consoleread>:
    80004784:	f9010113          	addi	sp,sp,-112
    80004788:	06813023          	sd	s0,96(sp)
    8000478c:	04913c23          	sd	s1,88(sp)
    80004790:	05213823          	sd	s2,80(sp)
    80004794:	05313423          	sd	s3,72(sp)
    80004798:	05413023          	sd	s4,64(sp)
    8000479c:	03513c23          	sd	s5,56(sp)
    800047a0:	03613823          	sd	s6,48(sp)
    800047a4:	03713423          	sd	s7,40(sp)
    800047a8:	03813023          	sd	s8,32(sp)
    800047ac:	06113423          	sd	ra,104(sp)
    800047b0:	01913c23          	sd	s9,24(sp)
    800047b4:	07010413          	addi	s0,sp,112
    800047b8:	00060b93          	mv	s7,a2
    800047bc:	00050913          	mv	s2,a0
    800047c0:	00058c13          	mv	s8,a1
    800047c4:	00060b1b          	sext.w	s6,a2
    800047c8:	00003497          	auipc	s1,0x3
    800047cc:	6d048493          	addi	s1,s1,1744 # 80007e98 <cons>
    800047d0:	00400993          	li	s3,4
    800047d4:	fff00a13          	li	s4,-1
    800047d8:	00a00a93          	li	s5,10
    800047dc:	05705e63          	blez	s7,80004838 <consoleread+0xb4>
    800047e0:	09c4a703          	lw	a4,156(s1)
    800047e4:	0984a783          	lw	a5,152(s1)
    800047e8:	0007071b          	sext.w	a4,a4
    800047ec:	08e78463          	beq	a5,a4,80004874 <consoleread+0xf0>
    800047f0:	07f7f713          	andi	a4,a5,127
    800047f4:	00e48733          	add	a4,s1,a4
    800047f8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800047fc:	0017869b          	addiw	a3,a5,1
    80004800:	08d4ac23          	sw	a3,152(s1)
    80004804:	00070c9b          	sext.w	s9,a4
    80004808:	0b370663          	beq	a4,s3,800048b4 <consoleread+0x130>
    8000480c:	00100693          	li	a3,1
    80004810:	f9f40613          	addi	a2,s0,-97
    80004814:	000c0593          	mv	a1,s8
    80004818:	00090513          	mv	a0,s2
    8000481c:	f8e40fa3          	sb	a4,-97(s0)
    80004820:	00000097          	auipc	ra,0x0
    80004824:	8bc080e7          	jalr	-1860(ra) # 800040dc <either_copyout>
    80004828:	01450863          	beq	a0,s4,80004838 <consoleread+0xb4>
    8000482c:	001c0c13          	addi	s8,s8,1
    80004830:	fffb8b9b          	addiw	s7,s7,-1
    80004834:	fb5c94e3          	bne	s9,s5,800047dc <consoleread+0x58>
    80004838:	000b851b          	sext.w	a0,s7
    8000483c:	06813083          	ld	ra,104(sp)
    80004840:	06013403          	ld	s0,96(sp)
    80004844:	05813483          	ld	s1,88(sp)
    80004848:	05013903          	ld	s2,80(sp)
    8000484c:	04813983          	ld	s3,72(sp)
    80004850:	04013a03          	ld	s4,64(sp)
    80004854:	03813a83          	ld	s5,56(sp)
    80004858:	02813b83          	ld	s7,40(sp)
    8000485c:	02013c03          	ld	s8,32(sp)
    80004860:	01813c83          	ld	s9,24(sp)
    80004864:	40ab053b          	subw	a0,s6,a0
    80004868:	03013b03          	ld	s6,48(sp)
    8000486c:	07010113          	addi	sp,sp,112
    80004870:	00008067          	ret
    80004874:	00001097          	auipc	ra,0x1
    80004878:	1d8080e7          	jalr	472(ra) # 80005a4c <push_on>
    8000487c:	0984a703          	lw	a4,152(s1)
    80004880:	09c4a783          	lw	a5,156(s1)
    80004884:	0007879b          	sext.w	a5,a5
    80004888:	fef70ce3          	beq	a4,a5,80004880 <consoleread+0xfc>
    8000488c:	00001097          	auipc	ra,0x1
    80004890:	234080e7          	jalr	564(ra) # 80005ac0 <pop_on>
    80004894:	0984a783          	lw	a5,152(s1)
    80004898:	07f7f713          	andi	a4,a5,127
    8000489c:	00e48733          	add	a4,s1,a4
    800048a0:	01874703          	lbu	a4,24(a4)
    800048a4:	0017869b          	addiw	a3,a5,1
    800048a8:	08d4ac23          	sw	a3,152(s1)
    800048ac:	00070c9b          	sext.w	s9,a4
    800048b0:	f5371ee3          	bne	a4,s3,8000480c <consoleread+0x88>
    800048b4:	000b851b          	sext.w	a0,s7
    800048b8:	f96bf2e3          	bgeu	s7,s6,8000483c <consoleread+0xb8>
    800048bc:	08f4ac23          	sw	a5,152(s1)
    800048c0:	f7dff06f          	j	8000483c <consoleread+0xb8>

00000000800048c4 <consputc>:
    800048c4:	10000793          	li	a5,256
    800048c8:	00f50663          	beq	a0,a5,800048d4 <consputc+0x10>
    800048cc:	00001317          	auipc	t1,0x1
    800048d0:	9f430067          	jr	-1548(t1) # 800052c0 <uartputc_sync>
    800048d4:	ff010113          	addi	sp,sp,-16
    800048d8:	00113423          	sd	ra,8(sp)
    800048dc:	00813023          	sd	s0,0(sp)
    800048e0:	01010413          	addi	s0,sp,16
    800048e4:	00800513          	li	a0,8
    800048e8:	00001097          	auipc	ra,0x1
    800048ec:	9d8080e7          	jalr	-1576(ra) # 800052c0 <uartputc_sync>
    800048f0:	02000513          	li	a0,32
    800048f4:	00001097          	auipc	ra,0x1
    800048f8:	9cc080e7          	jalr	-1588(ra) # 800052c0 <uartputc_sync>
    800048fc:	00013403          	ld	s0,0(sp)
    80004900:	00813083          	ld	ra,8(sp)
    80004904:	00800513          	li	a0,8
    80004908:	01010113          	addi	sp,sp,16
    8000490c:	00001317          	auipc	t1,0x1
    80004910:	9b430067          	jr	-1612(t1) # 800052c0 <uartputc_sync>

0000000080004914 <consoleintr>:
    80004914:	fe010113          	addi	sp,sp,-32
    80004918:	00813823          	sd	s0,16(sp)
    8000491c:	00913423          	sd	s1,8(sp)
    80004920:	01213023          	sd	s2,0(sp)
    80004924:	00113c23          	sd	ra,24(sp)
    80004928:	02010413          	addi	s0,sp,32
    8000492c:	00003917          	auipc	s2,0x3
    80004930:	56c90913          	addi	s2,s2,1388 # 80007e98 <cons>
    80004934:	00050493          	mv	s1,a0
    80004938:	00090513          	mv	a0,s2
    8000493c:	00001097          	auipc	ra,0x1
    80004940:	e40080e7          	jalr	-448(ra) # 8000577c <acquire>
    80004944:	02048c63          	beqz	s1,8000497c <consoleintr+0x68>
    80004948:	0a092783          	lw	a5,160(s2)
    8000494c:	09892703          	lw	a4,152(s2)
    80004950:	07f00693          	li	a3,127
    80004954:	40e7873b          	subw	a4,a5,a4
    80004958:	02e6e263          	bltu	a3,a4,8000497c <consoleintr+0x68>
    8000495c:	00d00713          	li	a4,13
    80004960:	04e48063          	beq	s1,a4,800049a0 <consoleintr+0x8c>
    80004964:	07f7f713          	andi	a4,a5,127
    80004968:	00e90733          	add	a4,s2,a4
    8000496c:	0017879b          	addiw	a5,a5,1
    80004970:	0af92023          	sw	a5,160(s2)
    80004974:	00970c23          	sb	s1,24(a4)
    80004978:	08f92e23          	sw	a5,156(s2)
    8000497c:	01013403          	ld	s0,16(sp)
    80004980:	01813083          	ld	ra,24(sp)
    80004984:	00813483          	ld	s1,8(sp)
    80004988:	00013903          	ld	s2,0(sp)
    8000498c:	00003517          	auipc	a0,0x3
    80004990:	50c50513          	addi	a0,a0,1292 # 80007e98 <cons>
    80004994:	02010113          	addi	sp,sp,32
    80004998:	00001317          	auipc	t1,0x1
    8000499c:	eb030067          	jr	-336(t1) # 80005848 <release>
    800049a0:	00a00493          	li	s1,10
    800049a4:	fc1ff06f          	j	80004964 <consoleintr+0x50>

00000000800049a8 <consoleinit>:
    800049a8:	fe010113          	addi	sp,sp,-32
    800049ac:	00113c23          	sd	ra,24(sp)
    800049b0:	00813823          	sd	s0,16(sp)
    800049b4:	00913423          	sd	s1,8(sp)
    800049b8:	02010413          	addi	s0,sp,32
    800049bc:	00003497          	auipc	s1,0x3
    800049c0:	4dc48493          	addi	s1,s1,1244 # 80007e98 <cons>
    800049c4:	00048513          	mv	a0,s1
    800049c8:	00002597          	auipc	a1,0x2
    800049cc:	8d058593          	addi	a1,a1,-1840 # 80006298 <CONSOLE_STATUS+0x288>
    800049d0:	00001097          	auipc	ra,0x1
    800049d4:	d88080e7          	jalr	-632(ra) # 80005758 <initlock>
    800049d8:	00000097          	auipc	ra,0x0
    800049dc:	7ac080e7          	jalr	1964(ra) # 80005184 <uartinit>
    800049e0:	01813083          	ld	ra,24(sp)
    800049e4:	01013403          	ld	s0,16(sp)
    800049e8:	00000797          	auipc	a5,0x0
    800049ec:	d9c78793          	addi	a5,a5,-612 # 80004784 <consoleread>
    800049f0:	0af4bc23          	sd	a5,184(s1)
    800049f4:	00000797          	auipc	a5,0x0
    800049f8:	cec78793          	addi	a5,a5,-788 # 800046e0 <consolewrite>
    800049fc:	0cf4b023          	sd	a5,192(s1)
    80004a00:	00813483          	ld	s1,8(sp)
    80004a04:	02010113          	addi	sp,sp,32
    80004a08:	00008067          	ret

0000000080004a0c <console_read>:
    80004a0c:	ff010113          	addi	sp,sp,-16
    80004a10:	00813423          	sd	s0,8(sp)
    80004a14:	01010413          	addi	s0,sp,16
    80004a18:	00813403          	ld	s0,8(sp)
    80004a1c:	00003317          	auipc	t1,0x3
    80004a20:	53433303          	ld	t1,1332(t1) # 80007f50 <devsw+0x10>
    80004a24:	01010113          	addi	sp,sp,16
    80004a28:	00030067          	jr	t1

0000000080004a2c <console_write>:
    80004a2c:	ff010113          	addi	sp,sp,-16
    80004a30:	00813423          	sd	s0,8(sp)
    80004a34:	01010413          	addi	s0,sp,16
    80004a38:	00813403          	ld	s0,8(sp)
    80004a3c:	00003317          	auipc	t1,0x3
    80004a40:	51c33303          	ld	t1,1308(t1) # 80007f58 <devsw+0x18>
    80004a44:	01010113          	addi	sp,sp,16
    80004a48:	00030067          	jr	t1

0000000080004a4c <panic>:
    80004a4c:	fe010113          	addi	sp,sp,-32
    80004a50:	00113c23          	sd	ra,24(sp)
    80004a54:	00813823          	sd	s0,16(sp)
    80004a58:	00913423          	sd	s1,8(sp)
    80004a5c:	02010413          	addi	s0,sp,32
    80004a60:	00050493          	mv	s1,a0
    80004a64:	00002517          	auipc	a0,0x2
    80004a68:	83c50513          	addi	a0,a0,-1988 # 800062a0 <CONSOLE_STATUS+0x290>
    80004a6c:	00003797          	auipc	a5,0x3
    80004a70:	5807a623          	sw	zero,1420(a5) # 80007ff8 <pr+0x18>
    80004a74:	00000097          	auipc	ra,0x0
    80004a78:	034080e7          	jalr	52(ra) # 80004aa8 <__printf>
    80004a7c:	00048513          	mv	a0,s1
    80004a80:	00000097          	auipc	ra,0x0
    80004a84:	028080e7          	jalr	40(ra) # 80004aa8 <__printf>
    80004a88:	00001517          	auipc	a0,0x1
    80004a8c:	7f850513          	addi	a0,a0,2040 # 80006280 <CONSOLE_STATUS+0x270>
    80004a90:	00000097          	auipc	ra,0x0
    80004a94:	018080e7          	jalr	24(ra) # 80004aa8 <__printf>
    80004a98:	00100793          	li	a5,1
    80004a9c:	00002717          	auipc	a4,0x2
    80004aa0:	2cf72623          	sw	a5,716(a4) # 80006d68 <panicked>
    80004aa4:	0000006f          	j	80004aa4 <panic+0x58>

0000000080004aa8 <__printf>:
    80004aa8:	f3010113          	addi	sp,sp,-208
    80004aac:	08813023          	sd	s0,128(sp)
    80004ab0:	07313423          	sd	s3,104(sp)
    80004ab4:	09010413          	addi	s0,sp,144
    80004ab8:	05813023          	sd	s8,64(sp)
    80004abc:	08113423          	sd	ra,136(sp)
    80004ac0:	06913c23          	sd	s1,120(sp)
    80004ac4:	07213823          	sd	s2,112(sp)
    80004ac8:	07413023          	sd	s4,96(sp)
    80004acc:	05513c23          	sd	s5,88(sp)
    80004ad0:	05613823          	sd	s6,80(sp)
    80004ad4:	05713423          	sd	s7,72(sp)
    80004ad8:	03913c23          	sd	s9,56(sp)
    80004adc:	03a13823          	sd	s10,48(sp)
    80004ae0:	03b13423          	sd	s11,40(sp)
    80004ae4:	00003317          	auipc	t1,0x3
    80004ae8:	4fc30313          	addi	t1,t1,1276 # 80007fe0 <pr>
    80004aec:	01832c03          	lw	s8,24(t1)
    80004af0:	00b43423          	sd	a1,8(s0)
    80004af4:	00c43823          	sd	a2,16(s0)
    80004af8:	00d43c23          	sd	a3,24(s0)
    80004afc:	02e43023          	sd	a4,32(s0)
    80004b00:	02f43423          	sd	a5,40(s0)
    80004b04:	03043823          	sd	a6,48(s0)
    80004b08:	03143c23          	sd	a7,56(s0)
    80004b0c:	00050993          	mv	s3,a0
    80004b10:	4a0c1663          	bnez	s8,80004fbc <__printf+0x514>
    80004b14:	60098c63          	beqz	s3,8000512c <__printf+0x684>
    80004b18:	0009c503          	lbu	a0,0(s3)
    80004b1c:	00840793          	addi	a5,s0,8
    80004b20:	f6f43c23          	sd	a5,-136(s0)
    80004b24:	00000493          	li	s1,0
    80004b28:	22050063          	beqz	a0,80004d48 <__printf+0x2a0>
    80004b2c:	00002a37          	lui	s4,0x2
    80004b30:	00018ab7          	lui	s5,0x18
    80004b34:	000f4b37          	lui	s6,0xf4
    80004b38:	00989bb7          	lui	s7,0x989
    80004b3c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004b40:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004b44:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004b48:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80004b4c:	00148c9b          	addiw	s9,s1,1
    80004b50:	02500793          	li	a5,37
    80004b54:	01998933          	add	s2,s3,s9
    80004b58:	38f51263          	bne	a0,a5,80004edc <__printf+0x434>
    80004b5c:	00094783          	lbu	a5,0(s2)
    80004b60:	00078c9b          	sext.w	s9,a5
    80004b64:	1e078263          	beqz	a5,80004d48 <__printf+0x2a0>
    80004b68:	0024849b          	addiw	s1,s1,2
    80004b6c:	07000713          	li	a4,112
    80004b70:	00998933          	add	s2,s3,s1
    80004b74:	38e78a63          	beq	a5,a4,80004f08 <__printf+0x460>
    80004b78:	20f76863          	bltu	a4,a5,80004d88 <__printf+0x2e0>
    80004b7c:	42a78863          	beq	a5,a0,80004fac <__printf+0x504>
    80004b80:	06400713          	li	a4,100
    80004b84:	40e79663          	bne	a5,a4,80004f90 <__printf+0x4e8>
    80004b88:	f7843783          	ld	a5,-136(s0)
    80004b8c:	0007a603          	lw	a2,0(a5)
    80004b90:	00878793          	addi	a5,a5,8
    80004b94:	f6f43c23          	sd	a5,-136(s0)
    80004b98:	42064a63          	bltz	a2,80004fcc <__printf+0x524>
    80004b9c:	00a00713          	li	a4,10
    80004ba0:	02e677bb          	remuw	a5,a2,a4
    80004ba4:	00001d97          	auipc	s11,0x1
    80004ba8:	724d8d93          	addi	s11,s11,1828 # 800062c8 <digits>
    80004bac:	00900593          	li	a1,9
    80004bb0:	0006051b          	sext.w	a0,a2
    80004bb4:	00000c93          	li	s9,0
    80004bb8:	02079793          	slli	a5,a5,0x20
    80004bbc:	0207d793          	srli	a5,a5,0x20
    80004bc0:	00fd87b3          	add	a5,s11,a5
    80004bc4:	0007c783          	lbu	a5,0(a5)
    80004bc8:	02e656bb          	divuw	a3,a2,a4
    80004bcc:	f8f40023          	sb	a5,-128(s0)
    80004bd0:	14c5d863          	bge	a1,a2,80004d20 <__printf+0x278>
    80004bd4:	06300593          	li	a1,99
    80004bd8:	00100c93          	li	s9,1
    80004bdc:	02e6f7bb          	remuw	a5,a3,a4
    80004be0:	02079793          	slli	a5,a5,0x20
    80004be4:	0207d793          	srli	a5,a5,0x20
    80004be8:	00fd87b3          	add	a5,s11,a5
    80004bec:	0007c783          	lbu	a5,0(a5)
    80004bf0:	02e6d73b          	divuw	a4,a3,a4
    80004bf4:	f8f400a3          	sb	a5,-127(s0)
    80004bf8:	12a5f463          	bgeu	a1,a0,80004d20 <__printf+0x278>
    80004bfc:	00a00693          	li	a3,10
    80004c00:	00900593          	li	a1,9
    80004c04:	02d777bb          	remuw	a5,a4,a3
    80004c08:	02079793          	slli	a5,a5,0x20
    80004c0c:	0207d793          	srli	a5,a5,0x20
    80004c10:	00fd87b3          	add	a5,s11,a5
    80004c14:	0007c503          	lbu	a0,0(a5)
    80004c18:	02d757bb          	divuw	a5,a4,a3
    80004c1c:	f8a40123          	sb	a0,-126(s0)
    80004c20:	48e5f263          	bgeu	a1,a4,800050a4 <__printf+0x5fc>
    80004c24:	06300513          	li	a0,99
    80004c28:	02d7f5bb          	remuw	a1,a5,a3
    80004c2c:	02059593          	slli	a1,a1,0x20
    80004c30:	0205d593          	srli	a1,a1,0x20
    80004c34:	00bd85b3          	add	a1,s11,a1
    80004c38:	0005c583          	lbu	a1,0(a1)
    80004c3c:	02d7d7bb          	divuw	a5,a5,a3
    80004c40:	f8b401a3          	sb	a1,-125(s0)
    80004c44:	48e57263          	bgeu	a0,a4,800050c8 <__printf+0x620>
    80004c48:	3e700513          	li	a0,999
    80004c4c:	02d7f5bb          	remuw	a1,a5,a3
    80004c50:	02059593          	slli	a1,a1,0x20
    80004c54:	0205d593          	srli	a1,a1,0x20
    80004c58:	00bd85b3          	add	a1,s11,a1
    80004c5c:	0005c583          	lbu	a1,0(a1)
    80004c60:	02d7d7bb          	divuw	a5,a5,a3
    80004c64:	f8b40223          	sb	a1,-124(s0)
    80004c68:	46e57663          	bgeu	a0,a4,800050d4 <__printf+0x62c>
    80004c6c:	02d7f5bb          	remuw	a1,a5,a3
    80004c70:	02059593          	slli	a1,a1,0x20
    80004c74:	0205d593          	srli	a1,a1,0x20
    80004c78:	00bd85b3          	add	a1,s11,a1
    80004c7c:	0005c583          	lbu	a1,0(a1)
    80004c80:	02d7d7bb          	divuw	a5,a5,a3
    80004c84:	f8b402a3          	sb	a1,-123(s0)
    80004c88:	46ea7863          	bgeu	s4,a4,800050f8 <__printf+0x650>
    80004c8c:	02d7f5bb          	remuw	a1,a5,a3
    80004c90:	02059593          	slli	a1,a1,0x20
    80004c94:	0205d593          	srli	a1,a1,0x20
    80004c98:	00bd85b3          	add	a1,s11,a1
    80004c9c:	0005c583          	lbu	a1,0(a1)
    80004ca0:	02d7d7bb          	divuw	a5,a5,a3
    80004ca4:	f8b40323          	sb	a1,-122(s0)
    80004ca8:	3eeaf863          	bgeu	s5,a4,80005098 <__printf+0x5f0>
    80004cac:	02d7f5bb          	remuw	a1,a5,a3
    80004cb0:	02059593          	slli	a1,a1,0x20
    80004cb4:	0205d593          	srli	a1,a1,0x20
    80004cb8:	00bd85b3          	add	a1,s11,a1
    80004cbc:	0005c583          	lbu	a1,0(a1)
    80004cc0:	02d7d7bb          	divuw	a5,a5,a3
    80004cc4:	f8b403a3          	sb	a1,-121(s0)
    80004cc8:	42eb7e63          	bgeu	s6,a4,80005104 <__printf+0x65c>
    80004ccc:	02d7f5bb          	remuw	a1,a5,a3
    80004cd0:	02059593          	slli	a1,a1,0x20
    80004cd4:	0205d593          	srli	a1,a1,0x20
    80004cd8:	00bd85b3          	add	a1,s11,a1
    80004cdc:	0005c583          	lbu	a1,0(a1)
    80004ce0:	02d7d7bb          	divuw	a5,a5,a3
    80004ce4:	f8b40423          	sb	a1,-120(s0)
    80004ce8:	42ebfc63          	bgeu	s7,a4,80005120 <__printf+0x678>
    80004cec:	02079793          	slli	a5,a5,0x20
    80004cf0:	0207d793          	srli	a5,a5,0x20
    80004cf4:	00fd8db3          	add	s11,s11,a5
    80004cf8:	000dc703          	lbu	a4,0(s11)
    80004cfc:	00a00793          	li	a5,10
    80004d00:	00900c93          	li	s9,9
    80004d04:	f8e404a3          	sb	a4,-119(s0)
    80004d08:	00065c63          	bgez	a2,80004d20 <__printf+0x278>
    80004d0c:	f9040713          	addi	a4,s0,-112
    80004d10:	00f70733          	add	a4,a4,a5
    80004d14:	02d00693          	li	a3,45
    80004d18:	fed70823          	sb	a3,-16(a4)
    80004d1c:	00078c93          	mv	s9,a5
    80004d20:	f8040793          	addi	a5,s0,-128
    80004d24:	01978cb3          	add	s9,a5,s9
    80004d28:	f7f40d13          	addi	s10,s0,-129
    80004d2c:	000cc503          	lbu	a0,0(s9)
    80004d30:	fffc8c93          	addi	s9,s9,-1
    80004d34:	00000097          	auipc	ra,0x0
    80004d38:	b90080e7          	jalr	-1136(ra) # 800048c4 <consputc>
    80004d3c:	ffac98e3          	bne	s9,s10,80004d2c <__printf+0x284>
    80004d40:	00094503          	lbu	a0,0(s2)
    80004d44:	e00514e3          	bnez	a0,80004b4c <__printf+0xa4>
    80004d48:	1a0c1663          	bnez	s8,80004ef4 <__printf+0x44c>
    80004d4c:	08813083          	ld	ra,136(sp)
    80004d50:	08013403          	ld	s0,128(sp)
    80004d54:	07813483          	ld	s1,120(sp)
    80004d58:	07013903          	ld	s2,112(sp)
    80004d5c:	06813983          	ld	s3,104(sp)
    80004d60:	06013a03          	ld	s4,96(sp)
    80004d64:	05813a83          	ld	s5,88(sp)
    80004d68:	05013b03          	ld	s6,80(sp)
    80004d6c:	04813b83          	ld	s7,72(sp)
    80004d70:	04013c03          	ld	s8,64(sp)
    80004d74:	03813c83          	ld	s9,56(sp)
    80004d78:	03013d03          	ld	s10,48(sp)
    80004d7c:	02813d83          	ld	s11,40(sp)
    80004d80:	0d010113          	addi	sp,sp,208
    80004d84:	00008067          	ret
    80004d88:	07300713          	li	a4,115
    80004d8c:	1ce78a63          	beq	a5,a4,80004f60 <__printf+0x4b8>
    80004d90:	07800713          	li	a4,120
    80004d94:	1ee79e63          	bne	a5,a4,80004f90 <__printf+0x4e8>
    80004d98:	f7843783          	ld	a5,-136(s0)
    80004d9c:	0007a703          	lw	a4,0(a5)
    80004da0:	00878793          	addi	a5,a5,8
    80004da4:	f6f43c23          	sd	a5,-136(s0)
    80004da8:	28074263          	bltz	a4,8000502c <__printf+0x584>
    80004dac:	00001d97          	auipc	s11,0x1
    80004db0:	51cd8d93          	addi	s11,s11,1308 # 800062c8 <digits>
    80004db4:	00f77793          	andi	a5,a4,15
    80004db8:	00fd87b3          	add	a5,s11,a5
    80004dbc:	0007c683          	lbu	a3,0(a5)
    80004dc0:	00f00613          	li	a2,15
    80004dc4:	0007079b          	sext.w	a5,a4
    80004dc8:	f8d40023          	sb	a3,-128(s0)
    80004dcc:	0047559b          	srliw	a1,a4,0x4
    80004dd0:	0047569b          	srliw	a3,a4,0x4
    80004dd4:	00000c93          	li	s9,0
    80004dd8:	0ee65063          	bge	a2,a4,80004eb8 <__printf+0x410>
    80004ddc:	00f6f693          	andi	a3,a3,15
    80004de0:	00dd86b3          	add	a3,s11,a3
    80004de4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004de8:	0087d79b          	srliw	a5,a5,0x8
    80004dec:	00100c93          	li	s9,1
    80004df0:	f8d400a3          	sb	a3,-127(s0)
    80004df4:	0cb67263          	bgeu	a2,a1,80004eb8 <__printf+0x410>
    80004df8:	00f7f693          	andi	a3,a5,15
    80004dfc:	00dd86b3          	add	a3,s11,a3
    80004e00:	0006c583          	lbu	a1,0(a3)
    80004e04:	00f00613          	li	a2,15
    80004e08:	0047d69b          	srliw	a3,a5,0x4
    80004e0c:	f8b40123          	sb	a1,-126(s0)
    80004e10:	0047d593          	srli	a1,a5,0x4
    80004e14:	28f67e63          	bgeu	a2,a5,800050b0 <__printf+0x608>
    80004e18:	00f6f693          	andi	a3,a3,15
    80004e1c:	00dd86b3          	add	a3,s11,a3
    80004e20:	0006c503          	lbu	a0,0(a3)
    80004e24:	0087d813          	srli	a6,a5,0x8
    80004e28:	0087d69b          	srliw	a3,a5,0x8
    80004e2c:	f8a401a3          	sb	a0,-125(s0)
    80004e30:	28b67663          	bgeu	a2,a1,800050bc <__printf+0x614>
    80004e34:	00f6f693          	andi	a3,a3,15
    80004e38:	00dd86b3          	add	a3,s11,a3
    80004e3c:	0006c583          	lbu	a1,0(a3)
    80004e40:	00c7d513          	srli	a0,a5,0xc
    80004e44:	00c7d69b          	srliw	a3,a5,0xc
    80004e48:	f8b40223          	sb	a1,-124(s0)
    80004e4c:	29067a63          	bgeu	a2,a6,800050e0 <__printf+0x638>
    80004e50:	00f6f693          	andi	a3,a3,15
    80004e54:	00dd86b3          	add	a3,s11,a3
    80004e58:	0006c583          	lbu	a1,0(a3)
    80004e5c:	0107d813          	srli	a6,a5,0x10
    80004e60:	0107d69b          	srliw	a3,a5,0x10
    80004e64:	f8b402a3          	sb	a1,-123(s0)
    80004e68:	28a67263          	bgeu	a2,a0,800050ec <__printf+0x644>
    80004e6c:	00f6f693          	andi	a3,a3,15
    80004e70:	00dd86b3          	add	a3,s11,a3
    80004e74:	0006c683          	lbu	a3,0(a3)
    80004e78:	0147d79b          	srliw	a5,a5,0x14
    80004e7c:	f8d40323          	sb	a3,-122(s0)
    80004e80:	21067663          	bgeu	a2,a6,8000508c <__printf+0x5e4>
    80004e84:	02079793          	slli	a5,a5,0x20
    80004e88:	0207d793          	srli	a5,a5,0x20
    80004e8c:	00fd8db3          	add	s11,s11,a5
    80004e90:	000dc683          	lbu	a3,0(s11)
    80004e94:	00800793          	li	a5,8
    80004e98:	00700c93          	li	s9,7
    80004e9c:	f8d403a3          	sb	a3,-121(s0)
    80004ea0:	00075c63          	bgez	a4,80004eb8 <__printf+0x410>
    80004ea4:	f9040713          	addi	a4,s0,-112
    80004ea8:	00f70733          	add	a4,a4,a5
    80004eac:	02d00693          	li	a3,45
    80004eb0:	fed70823          	sb	a3,-16(a4)
    80004eb4:	00078c93          	mv	s9,a5
    80004eb8:	f8040793          	addi	a5,s0,-128
    80004ebc:	01978cb3          	add	s9,a5,s9
    80004ec0:	f7f40d13          	addi	s10,s0,-129
    80004ec4:	000cc503          	lbu	a0,0(s9)
    80004ec8:	fffc8c93          	addi	s9,s9,-1
    80004ecc:	00000097          	auipc	ra,0x0
    80004ed0:	9f8080e7          	jalr	-1544(ra) # 800048c4 <consputc>
    80004ed4:	ff9d18e3          	bne	s10,s9,80004ec4 <__printf+0x41c>
    80004ed8:	0100006f          	j	80004ee8 <__printf+0x440>
    80004edc:	00000097          	auipc	ra,0x0
    80004ee0:	9e8080e7          	jalr	-1560(ra) # 800048c4 <consputc>
    80004ee4:	000c8493          	mv	s1,s9
    80004ee8:	00094503          	lbu	a0,0(s2)
    80004eec:	c60510e3          	bnez	a0,80004b4c <__printf+0xa4>
    80004ef0:	e40c0ee3          	beqz	s8,80004d4c <__printf+0x2a4>
    80004ef4:	00003517          	auipc	a0,0x3
    80004ef8:	0ec50513          	addi	a0,a0,236 # 80007fe0 <pr>
    80004efc:	00001097          	auipc	ra,0x1
    80004f00:	94c080e7          	jalr	-1716(ra) # 80005848 <release>
    80004f04:	e49ff06f          	j	80004d4c <__printf+0x2a4>
    80004f08:	f7843783          	ld	a5,-136(s0)
    80004f0c:	03000513          	li	a0,48
    80004f10:	01000d13          	li	s10,16
    80004f14:	00878713          	addi	a4,a5,8
    80004f18:	0007bc83          	ld	s9,0(a5)
    80004f1c:	f6e43c23          	sd	a4,-136(s0)
    80004f20:	00000097          	auipc	ra,0x0
    80004f24:	9a4080e7          	jalr	-1628(ra) # 800048c4 <consputc>
    80004f28:	07800513          	li	a0,120
    80004f2c:	00000097          	auipc	ra,0x0
    80004f30:	998080e7          	jalr	-1640(ra) # 800048c4 <consputc>
    80004f34:	00001d97          	auipc	s11,0x1
    80004f38:	394d8d93          	addi	s11,s11,916 # 800062c8 <digits>
    80004f3c:	03ccd793          	srli	a5,s9,0x3c
    80004f40:	00fd87b3          	add	a5,s11,a5
    80004f44:	0007c503          	lbu	a0,0(a5)
    80004f48:	fffd0d1b          	addiw	s10,s10,-1
    80004f4c:	004c9c93          	slli	s9,s9,0x4
    80004f50:	00000097          	auipc	ra,0x0
    80004f54:	974080e7          	jalr	-1676(ra) # 800048c4 <consputc>
    80004f58:	fe0d12e3          	bnez	s10,80004f3c <__printf+0x494>
    80004f5c:	f8dff06f          	j	80004ee8 <__printf+0x440>
    80004f60:	f7843783          	ld	a5,-136(s0)
    80004f64:	0007bc83          	ld	s9,0(a5)
    80004f68:	00878793          	addi	a5,a5,8
    80004f6c:	f6f43c23          	sd	a5,-136(s0)
    80004f70:	000c9a63          	bnez	s9,80004f84 <__printf+0x4dc>
    80004f74:	1080006f          	j	8000507c <__printf+0x5d4>
    80004f78:	001c8c93          	addi	s9,s9,1
    80004f7c:	00000097          	auipc	ra,0x0
    80004f80:	948080e7          	jalr	-1720(ra) # 800048c4 <consputc>
    80004f84:	000cc503          	lbu	a0,0(s9)
    80004f88:	fe0518e3          	bnez	a0,80004f78 <__printf+0x4d0>
    80004f8c:	f5dff06f          	j	80004ee8 <__printf+0x440>
    80004f90:	02500513          	li	a0,37
    80004f94:	00000097          	auipc	ra,0x0
    80004f98:	930080e7          	jalr	-1744(ra) # 800048c4 <consputc>
    80004f9c:	000c8513          	mv	a0,s9
    80004fa0:	00000097          	auipc	ra,0x0
    80004fa4:	924080e7          	jalr	-1756(ra) # 800048c4 <consputc>
    80004fa8:	f41ff06f          	j	80004ee8 <__printf+0x440>
    80004fac:	02500513          	li	a0,37
    80004fb0:	00000097          	auipc	ra,0x0
    80004fb4:	914080e7          	jalr	-1772(ra) # 800048c4 <consputc>
    80004fb8:	f31ff06f          	j	80004ee8 <__printf+0x440>
    80004fbc:	00030513          	mv	a0,t1
    80004fc0:	00000097          	auipc	ra,0x0
    80004fc4:	7bc080e7          	jalr	1980(ra) # 8000577c <acquire>
    80004fc8:	b4dff06f          	j	80004b14 <__printf+0x6c>
    80004fcc:	40c0053b          	negw	a0,a2
    80004fd0:	00a00713          	li	a4,10
    80004fd4:	02e576bb          	remuw	a3,a0,a4
    80004fd8:	00001d97          	auipc	s11,0x1
    80004fdc:	2f0d8d93          	addi	s11,s11,752 # 800062c8 <digits>
    80004fe0:	ff700593          	li	a1,-9
    80004fe4:	02069693          	slli	a3,a3,0x20
    80004fe8:	0206d693          	srli	a3,a3,0x20
    80004fec:	00dd86b3          	add	a3,s11,a3
    80004ff0:	0006c683          	lbu	a3,0(a3)
    80004ff4:	02e557bb          	divuw	a5,a0,a4
    80004ff8:	f8d40023          	sb	a3,-128(s0)
    80004ffc:	10b65e63          	bge	a2,a1,80005118 <__printf+0x670>
    80005000:	06300593          	li	a1,99
    80005004:	02e7f6bb          	remuw	a3,a5,a4
    80005008:	02069693          	slli	a3,a3,0x20
    8000500c:	0206d693          	srli	a3,a3,0x20
    80005010:	00dd86b3          	add	a3,s11,a3
    80005014:	0006c683          	lbu	a3,0(a3)
    80005018:	02e7d73b          	divuw	a4,a5,a4
    8000501c:	00200793          	li	a5,2
    80005020:	f8d400a3          	sb	a3,-127(s0)
    80005024:	bca5ece3          	bltu	a1,a0,80004bfc <__printf+0x154>
    80005028:	ce5ff06f          	j	80004d0c <__printf+0x264>
    8000502c:	40e007bb          	negw	a5,a4
    80005030:	00001d97          	auipc	s11,0x1
    80005034:	298d8d93          	addi	s11,s11,664 # 800062c8 <digits>
    80005038:	00f7f693          	andi	a3,a5,15
    8000503c:	00dd86b3          	add	a3,s11,a3
    80005040:	0006c583          	lbu	a1,0(a3)
    80005044:	ff100613          	li	a2,-15
    80005048:	0047d69b          	srliw	a3,a5,0x4
    8000504c:	f8b40023          	sb	a1,-128(s0)
    80005050:	0047d59b          	srliw	a1,a5,0x4
    80005054:	0ac75e63          	bge	a4,a2,80005110 <__printf+0x668>
    80005058:	00f6f693          	andi	a3,a3,15
    8000505c:	00dd86b3          	add	a3,s11,a3
    80005060:	0006c603          	lbu	a2,0(a3)
    80005064:	00f00693          	li	a3,15
    80005068:	0087d79b          	srliw	a5,a5,0x8
    8000506c:	f8c400a3          	sb	a2,-127(s0)
    80005070:	d8b6e4e3          	bltu	a3,a1,80004df8 <__printf+0x350>
    80005074:	00200793          	li	a5,2
    80005078:	e2dff06f          	j	80004ea4 <__printf+0x3fc>
    8000507c:	00001c97          	auipc	s9,0x1
    80005080:	22cc8c93          	addi	s9,s9,556 # 800062a8 <CONSOLE_STATUS+0x298>
    80005084:	02800513          	li	a0,40
    80005088:	ef1ff06f          	j	80004f78 <__printf+0x4d0>
    8000508c:	00700793          	li	a5,7
    80005090:	00600c93          	li	s9,6
    80005094:	e0dff06f          	j	80004ea0 <__printf+0x3f8>
    80005098:	00700793          	li	a5,7
    8000509c:	00600c93          	li	s9,6
    800050a0:	c69ff06f          	j	80004d08 <__printf+0x260>
    800050a4:	00300793          	li	a5,3
    800050a8:	00200c93          	li	s9,2
    800050ac:	c5dff06f          	j	80004d08 <__printf+0x260>
    800050b0:	00300793          	li	a5,3
    800050b4:	00200c93          	li	s9,2
    800050b8:	de9ff06f          	j	80004ea0 <__printf+0x3f8>
    800050bc:	00400793          	li	a5,4
    800050c0:	00300c93          	li	s9,3
    800050c4:	dddff06f          	j	80004ea0 <__printf+0x3f8>
    800050c8:	00400793          	li	a5,4
    800050cc:	00300c93          	li	s9,3
    800050d0:	c39ff06f          	j	80004d08 <__printf+0x260>
    800050d4:	00500793          	li	a5,5
    800050d8:	00400c93          	li	s9,4
    800050dc:	c2dff06f          	j	80004d08 <__printf+0x260>
    800050e0:	00500793          	li	a5,5
    800050e4:	00400c93          	li	s9,4
    800050e8:	db9ff06f          	j	80004ea0 <__printf+0x3f8>
    800050ec:	00600793          	li	a5,6
    800050f0:	00500c93          	li	s9,5
    800050f4:	dadff06f          	j	80004ea0 <__printf+0x3f8>
    800050f8:	00600793          	li	a5,6
    800050fc:	00500c93          	li	s9,5
    80005100:	c09ff06f          	j	80004d08 <__printf+0x260>
    80005104:	00800793          	li	a5,8
    80005108:	00700c93          	li	s9,7
    8000510c:	bfdff06f          	j	80004d08 <__printf+0x260>
    80005110:	00100793          	li	a5,1
    80005114:	d91ff06f          	j	80004ea4 <__printf+0x3fc>
    80005118:	00100793          	li	a5,1
    8000511c:	bf1ff06f          	j	80004d0c <__printf+0x264>
    80005120:	00900793          	li	a5,9
    80005124:	00800c93          	li	s9,8
    80005128:	be1ff06f          	j	80004d08 <__printf+0x260>
    8000512c:	00001517          	auipc	a0,0x1
    80005130:	18450513          	addi	a0,a0,388 # 800062b0 <CONSOLE_STATUS+0x2a0>
    80005134:	00000097          	auipc	ra,0x0
    80005138:	918080e7          	jalr	-1768(ra) # 80004a4c <panic>

000000008000513c <printfinit>:
    8000513c:	fe010113          	addi	sp,sp,-32
    80005140:	00813823          	sd	s0,16(sp)
    80005144:	00913423          	sd	s1,8(sp)
    80005148:	00113c23          	sd	ra,24(sp)
    8000514c:	02010413          	addi	s0,sp,32
    80005150:	00003497          	auipc	s1,0x3
    80005154:	e9048493          	addi	s1,s1,-368 # 80007fe0 <pr>
    80005158:	00048513          	mv	a0,s1
    8000515c:	00001597          	auipc	a1,0x1
    80005160:	16458593          	addi	a1,a1,356 # 800062c0 <CONSOLE_STATUS+0x2b0>
    80005164:	00000097          	auipc	ra,0x0
    80005168:	5f4080e7          	jalr	1524(ra) # 80005758 <initlock>
    8000516c:	01813083          	ld	ra,24(sp)
    80005170:	01013403          	ld	s0,16(sp)
    80005174:	0004ac23          	sw	zero,24(s1)
    80005178:	00813483          	ld	s1,8(sp)
    8000517c:	02010113          	addi	sp,sp,32
    80005180:	00008067          	ret

0000000080005184 <uartinit>:
    80005184:	ff010113          	addi	sp,sp,-16
    80005188:	00813423          	sd	s0,8(sp)
    8000518c:	01010413          	addi	s0,sp,16
    80005190:	100007b7          	lui	a5,0x10000
    80005194:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80005198:	f8000713          	li	a4,-128
    8000519c:	00e781a3          	sb	a4,3(a5)
    800051a0:	00300713          	li	a4,3
    800051a4:	00e78023          	sb	a4,0(a5)
    800051a8:	000780a3          	sb	zero,1(a5)
    800051ac:	00e781a3          	sb	a4,3(a5)
    800051b0:	00700693          	li	a3,7
    800051b4:	00d78123          	sb	a3,2(a5)
    800051b8:	00e780a3          	sb	a4,1(a5)
    800051bc:	00813403          	ld	s0,8(sp)
    800051c0:	01010113          	addi	sp,sp,16
    800051c4:	00008067          	ret

00000000800051c8 <uartputc>:
    800051c8:	00002797          	auipc	a5,0x2
    800051cc:	ba07a783          	lw	a5,-1120(a5) # 80006d68 <panicked>
    800051d0:	00078463          	beqz	a5,800051d8 <uartputc+0x10>
    800051d4:	0000006f          	j	800051d4 <uartputc+0xc>
    800051d8:	fd010113          	addi	sp,sp,-48
    800051dc:	02813023          	sd	s0,32(sp)
    800051e0:	00913c23          	sd	s1,24(sp)
    800051e4:	01213823          	sd	s2,16(sp)
    800051e8:	01313423          	sd	s3,8(sp)
    800051ec:	02113423          	sd	ra,40(sp)
    800051f0:	03010413          	addi	s0,sp,48
    800051f4:	00002917          	auipc	s2,0x2
    800051f8:	b7c90913          	addi	s2,s2,-1156 # 80006d70 <uart_tx_r>
    800051fc:	00093783          	ld	a5,0(s2)
    80005200:	00002497          	auipc	s1,0x2
    80005204:	b7848493          	addi	s1,s1,-1160 # 80006d78 <uart_tx_w>
    80005208:	0004b703          	ld	a4,0(s1)
    8000520c:	02078693          	addi	a3,a5,32
    80005210:	00050993          	mv	s3,a0
    80005214:	02e69c63          	bne	a3,a4,8000524c <uartputc+0x84>
    80005218:	00001097          	auipc	ra,0x1
    8000521c:	834080e7          	jalr	-1996(ra) # 80005a4c <push_on>
    80005220:	00093783          	ld	a5,0(s2)
    80005224:	0004b703          	ld	a4,0(s1)
    80005228:	02078793          	addi	a5,a5,32
    8000522c:	00e79463          	bne	a5,a4,80005234 <uartputc+0x6c>
    80005230:	0000006f          	j	80005230 <uartputc+0x68>
    80005234:	00001097          	auipc	ra,0x1
    80005238:	88c080e7          	jalr	-1908(ra) # 80005ac0 <pop_on>
    8000523c:	00093783          	ld	a5,0(s2)
    80005240:	0004b703          	ld	a4,0(s1)
    80005244:	02078693          	addi	a3,a5,32
    80005248:	fce688e3          	beq	a3,a4,80005218 <uartputc+0x50>
    8000524c:	01f77693          	andi	a3,a4,31
    80005250:	00003597          	auipc	a1,0x3
    80005254:	db058593          	addi	a1,a1,-592 # 80008000 <uart_tx_buf>
    80005258:	00d586b3          	add	a3,a1,a3
    8000525c:	00170713          	addi	a4,a4,1
    80005260:	01368023          	sb	s3,0(a3)
    80005264:	00e4b023          	sd	a4,0(s1)
    80005268:	10000637          	lui	a2,0x10000
    8000526c:	02f71063          	bne	a4,a5,8000528c <uartputc+0xc4>
    80005270:	0340006f          	j	800052a4 <uartputc+0xdc>
    80005274:	00074703          	lbu	a4,0(a4)
    80005278:	00f93023          	sd	a5,0(s2)
    8000527c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80005280:	00093783          	ld	a5,0(s2)
    80005284:	0004b703          	ld	a4,0(s1)
    80005288:	00f70e63          	beq	a4,a5,800052a4 <uartputc+0xdc>
    8000528c:	00564683          	lbu	a3,5(a2)
    80005290:	01f7f713          	andi	a4,a5,31
    80005294:	00e58733          	add	a4,a1,a4
    80005298:	0206f693          	andi	a3,a3,32
    8000529c:	00178793          	addi	a5,a5,1
    800052a0:	fc069ae3          	bnez	a3,80005274 <uartputc+0xac>
    800052a4:	02813083          	ld	ra,40(sp)
    800052a8:	02013403          	ld	s0,32(sp)
    800052ac:	01813483          	ld	s1,24(sp)
    800052b0:	01013903          	ld	s2,16(sp)
    800052b4:	00813983          	ld	s3,8(sp)
    800052b8:	03010113          	addi	sp,sp,48
    800052bc:	00008067          	ret

00000000800052c0 <uartputc_sync>:
    800052c0:	ff010113          	addi	sp,sp,-16
    800052c4:	00813423          	sd	s0,8(sp)
    800052c8:	01010413          	addi	s0,sp,16
    800052cc:	00002717          	auipc	a4,0x2
    800052d0:	a9c72703          	lw	a4,-1380(a4) # 80006d68 <panicked>
    800052d4:	02071663          	bnez	a4,80005300 <uartputc_sync+0x40>
    800052d8:	00050793          	mv	a5,a0
    800052dc:	100006b7          	lui	a3,0x10000
    800052e0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800052e4:	02077713          	andi	a4,a4,32
    800052e8:	fe070ce3          	beqz	a4,800052e0 <uartputc_sync+0x20>
    800052ec:	0ff7f793          	andi	a5,a5,255
    800052f0:	00f68023          	sb	a5,0(a3)
    800052f4:	00813403          	ld	s0,8(sp)
    800052f8:	01010113          	addi	sp,sp,16
    800052fc:	00008067          	ret
    80005300:	0000006f          	j	80005300 <uartputc_sync+0x40>

0000000080005304 <uartstart>:
    80005304:	ff010113          	addi	sp,sp,-16
    80005308:	00813423          	sd	s0,8(sp)
    8000530c:	01010413          	addi	s0,sp,16
    80005310:	00002617          	auipc	a2,0x2
    80005314:	a6060613          	addi	a2,a2,-1440 # 80006d70 <uart_tx_r>
    80005318:	00002517          	auipc	a0,0x2
    8000531c:	a6050513          	addi	a0,a0,-1440 # 80006d78 <uart_tx_w>
    80005320:	00063783          	ld	a5,0(a2)
    80005324:	00053703          	ld	a4,0(a0)
    80005328:	04f70263          	beq	a4,a5,8000536c <uartstart+0x68>
    8000532c:	100005b7          	lui	a1,0x10000
    80005330:	00003817          	auipc	a6,0x3
    80005334:	cd080813          	addi	a6,a6,-816 # 80008000 <uart_tx_buf>
    80005338:	01c0006f          	j	80005354 <uartstart+0x50>
    8000533c:	0006c703          	lbu	a4,0(a3)
    80005340:	00f63023          	sd	a5,0(a2)
    80005344:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005348:	00063783          	ld	a5,0(a2)
    8000534c:	00053703          	ld	a4,0(a0)
    80005350:	00f70e63          	beq	a4,a5,8000536c <uartstart+0x68>
    80005354:	01f7f713          	andi	a4,a5,31
    80005358:	00e806b3          	add	a3,a6,a4
    8000535c:	0055c703          	lbu	a4,5(a1)
    80005360:	00178793          	addi	a5,a5,1
    80005364:	02077713          	andi	a4,a4,32
    80005368:	fc071ae3          	bnez	a4,8000533c <uartstart+0x38>
    8000536c:	00813403          	ld	s0,8(sp)
    80005370:	01010113          	addi	sp,sp,16
    80005374:	00008067          	ret

0000000080005378 <uartgetc>:
    80005378:	ff010113          	addi	sp,sp,-16
    8000537c:	00813423          	sd	s0,8(sp)
    80005380:	01010413          	addi	s0,sp,16
    80005384:	10000737          	lui	a4,0x10000
    80005388:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000538c:	0017f793          	andi	a5,a5,1
    80005390:	00078c63          	beqz	a5,800053a8 <uartgetc+0x30>
    80005394:	00074503          	lbu	a0,0(a4)
    80005398:	0ff57513          	andi	a0,a0,255
    8000539c:	00813403          	ld	s0,8(sp)
    800053a0:	01010113          	addi	sp,sp,16
    800053a4:	00008067          	ret
    800053a8:	fff00513          	li	a0,-1
    800053ac:	ff1ff06f          	j	8000539c <uartgetc+0x24>

00000000800053b0 <uartintr>:
    800053b0:	100007b7          	lui	a5,0x10000
    800053b4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800053b8:	0017f793          	andi	a5,a5,1
    800053bc:	0a078463          	beqz	a5,80005464 <uartintr+0xb4>
    800053c0:	fe010113          	addi	sp,sp,-32
    800053c4:	00813823          	sd	s0,16(sp)
    800053c8:	00913423          	sd	s1,8(sp)
    800053cc:	00113c23          	sd	ra,24(sp)
    800053d0:	02010413          	addi	s0,sp,32
    800053d4:	100004b7          	lui	s1,0x10000
    800053d8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800053dc:	0ff57513          	andi	a0,a0,255
    800053e0:	fffff097          	auipc	ra,0xfffff
    800053e4:	534080e7          	jalr	1332(ra) # 80004914 <consoleintr>
    800053e8:	0054c783          	lbu	a5,5(s1)
    800053ec:	0017f793          	andi	a5,a5,1
    800053f0:	fe0794e3          	bnez	a5,800053d8 <uartintr+0x28>
    800053f4:	00002617          	auipc	a2,0x2
    800053f8:	97c60613          	addi	a2,a2,-1668 # 80006d70 <uart_tx_r>
    800053fc:	00002517          	auipc	a0,0x2
    80005400:	97c50513          	addi	a0,a0,-1668 # 80006d78 <uart_tx_w>
    80005404:	00063783          	ld	a5,0(a2)
    80005408:	00053703          	ld	a4,0(a0)
    8000540c:	04f70263          	beq	a4,a5,80005450 <uartintr+0xa0>
    80005410:	100005b7          	lui	a1,0x10000
    80005414:	00003817          	auipc	a6,0x3
    80005418:	bec80813          	addi	a6,a6,-1044 # 80008000 <uart_tx_buf>
    8000541c:	01c0006f          	j	80005438 <uartintr+0x88>
    80005420:	0006c703          	lbu	a4,0(a3)
    80005424:	00f63023          	sd	a5,0(a2)
    80005428:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000542c:	00063783          	ld	a5,0(a2)
    80005430:	00053703          	ld	a4,0(a0)
    80005434:	00f70e63          	beq	a4,a5,80005450 <uartintr+0xa0>
    80005438:	01f7f713          	andi	a4,a5,31
    8000543c:	00e806b3          	add	a3,a6,a4
    80005440:	0055c703          	lbu	a4,5(a1)
    80005444:	00178793          	addi	a5,a5,1
    80005448:	02077713          	andi	a4,a4,32
    8000544c:	fc071ae3          	bnez	a4,80005420 <uartintr+0x70>
    80005450:	01813083          	ld	ra,24(sp)
    80005454:	01013403          	ld	s0,16(sp)
    80005458:	00813483          	ld	s1,8(sp)
    8000545c:	02010113          	addi	sp,sp,32
    80005460:	00008067          	ret
    80005464:	00002617          	auipc	a2,0x2
    80005468:	90c60613          	addi	a2,a2,-1780 # 80006d70 <uart_tx_r>
    8000546c:	00002517          	auipc	a0,0x2
    80005470:	90c50513          	addi	a0,a0,-1780 # 80006d78 <uart_tx_w>
    80005474:	00063783          	ld	a5,0(a2)
    80005478:	00053703          	ld	a4,0(a0)
    8000547c:	04f70263          	beq	a4,a5,800054c0 <uartintr+0x110>
    80005480:	100005b7          	lui	a1,0x10000
    80005484:	00003817          	auipc	a6,0x3
    80005488:	b7c80813          	addi	a6,a6,-1156 # 80008000 <uart_tx_buf>
    8000548c:	01c0006f          	j	800054a8 <uartintr+0xf8>
    80005490:	0006c703          	lbu	a4,0(a3)
    80005494:	00f63023          	sd	a5,0(a2)
    80005498:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000549c:	00063783          	ld	a5,0(a2)
    800054a0:	00053703          	ld	a4,0(a0)
    800054a4:	02f70063          	beq	a4,a5,800054c4 <uartintr+0x114>
    800054a8:	01f7f713          	andi	a4,a5,31
    800054ac:	00e806b3          	add	a3,a6,a4
    800054b0:	0055c703          	lbu	a4,5(a1)
    800054b4:	00178793          	addi	a5,a5,1
    800054b8:	02077713          	andi	a4,a4,32
    800054bc:	fc071ae3          	bnez	a4,80005490 <uartintr+0xe0>
    800054c0:	00008067          	ret
    800054c4:	00008067          	ret

00000000800054c8 <kinit>:
    800054c8:	fc010113          	addi	sp,sp,-64
    800054cc:	02913423          	sd	s1,40(sp)
    800054d0:	fffff7b7          	lui	a5,0xfffff
    800054d4:	00004497          	auipc	s1,0x4
    800054d8:	b4b48493          	addi	s1,s1,-1205 # 8000901f <end+0xfff>
    800054dc:	02813823          	sd	s0,48(sp)
    800054e0:	01313c23          	sd	s3,24(sp)
    800054e4:	00f4f4b3          	and	s1,s1,a5
    800054e8:	02113c23          	sd	ra,56(sp)
    800054ec:	03213023          	sd	s2,32(sp)
    800054f0:	01413823          	sd	s4,16(sp)
    800054f4:	01513423          	sd	s5,8(sp)
    800054f8:	04010413          	addi	s0,sp,64
    800054fc:	000017b7          	lui	a5,0x1
    80005500:	01100993          	li	s3,17
    80005504:	00f487b3          	add	a5,s1,a5
    80005508:	01b99993          	slli	s3,s3,0x1b
    8000550c:	06f9e063          	bltu	s3,a5,8000556c <kinit+0xa4>
    80005510:	00003a97          	auipc	s5,0x3
    80005514:	b10a8a93          	addi	s5,s5,-1264 # 80008020 <end>
    80005518:	0754ec63          	bltu	s1,s5,80005590 <kinit+0xc8>
    8000551c:	0734fa63          	bgeu	s1,s3,80005590 <kinit+0xc8>
    80005520:	00088a37          	lui	s4,0x88
    80005524:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80005528:	00002917          	auipc	s2,0x2
    8000552c:	85890913          	addi	s2,s2,-1960 # 80006d80 <kmem>
    80005530:	00ca1a13          	slli	s4,s4,0xc
    80005534:	0140006f          	j	80005548 <kinit+0x80>
    80005538:	000017b7          	lui	a5,0x1
    8000553c:	00f484b3          	add	s1,s1,a5
    80005540:	0554e863          	bltu	s1,s5,80005590 <kinit+0xc8>
    80005544:	0534f663          	bgeu	s1,s3,80005590 <kinit+0xc8>
    80005548:	00001637          	lui	a2,0x1
    8000554c:	00100593          	li	a1,1
    80005550:	00048513          	mv	a0,s1
    80005554:	00000097          	auipc	ra,0x0
    80005558:	5e4080e7          	jalr	1508(ra) # 80005b38 <__memset>
    8000555c:	00093783          	ld	a5,0(s2)
    80005560:	00f4b023          	sd	a5,0(s1)
    80005564:	00993023          	sd	s1,0(s2)
    80005568:	fd4498e3          	bne	s1,s4,80005538 <kinit+0x70>
    8000556c:	03813083          	ld	ra,56(sp)
    80005570:	03013403          	ld	s0,48(sp)
    80005574:	02813483          	ld	s1,40(sp)
    80005578:	02013903          	ld	s2,32(sp)
    8000557c:	01813983          	ld	s3,24(sp)
    80005580:	01013a03          	ld	s4,16(sp)
    80005584:	00813a83          	ld	s5,8(sp)
    80005588:	04010113          	addi	sp,sp,64
    8000558c:	00008067          	ret
    80005590:	00001517          	auipc	a0,0x1
    80005594:	d5050513          	addi	a0,a0,-688 # 800062e0 <digits+0x18>
    80005598:	fffff097          	auipc	ra,0xfffff
    8000559c:	4b4080e7          	jalr	1204(ra) # 80004a4c <panic>

00000000800055a0 <freerange>:
    800055a0:	fc010113          	addi	sp,sp,-64
    800055a4:	000017b7          	lui	a5,0x1
    800055a8:	02913423          	sd	s1,40(sp)
    800055ac:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800055b0:	009504b3          	add	s1,a0,s1
    800055b4:	fffff537          	lui	a0,0xfffff
    800055b8:	02813823          	sd	s0,48(sp)
    800055bc:	02113c23          	sd	ra,56(sp)
    800055c0:	03213023          	sd	s2,32(sp)
    800055c4:	01313c23          	sd	s3,24(sp)
    800055c8:	01413823          	sd	s4,16(sp)
    800055cc:	01513423          	sd	s5,8(sp)
    800055d0:	01613023          	sd	s6,0(sp)
    800055d4:	04010413          	addi	s0,sp,64
    800055d8:	00a4f4b3          	and	s1,s1,a0
    800055dc:	00f487b3          	add	a5,s1,a5
    800055e0:	06f5e463          	bltu	a1,a5,80005648 <freerange+0xa8>
    800055e4:	00003a97          	auipc	s5,0x3
    800055e8:	a3ca8a93          	addi	s5,s5,-1476 # 80008020 <end>
    800055ec:	0954e263          	bltu	s1,s5,80005670 <freerange+0xd0>
    800055f0:	01100993          	li	s3,17
    800055f4:	01b99993          	slli	s3,s3,0x1b
    800055f8:	0734fc63          	bgeu	s1,s3,80005670 <freerange+0xd0>
    800055fc:	00058a13          	mv	s4,a1
    80005600:	00001917          	auipc	s2,0x1
    80005604:	78090913          	addi	s2,s2,1920 # 80006d80 <kmem>
    80005608:	00002b37          	lui	s6,0x2
    8000560c:	0140006f          	j	80005620 <freerange+0x80>
    80005610:	000017b7          	lui	a5,0x1
    80005614:	00f484b3          	add	s1,s1,a5
    80005618:	0554ec63          	bltu	s1,s5,80005670 <freerange+0xd0>
    8000561c:	0534fa63          	bgeu	s1,s3,80005670 <freerange+0xd0>
    80005620:	00001637          	lui	a2,0x1
    80005624:	00100593          	li	a1,1
    80005628:	00048513          	mv	a0,s1
    8000562c:	00000097          	auipc	ra,0x0
    80005630:	50c080e7          	jalr	1292(ra) # 80005b38 <__memset>
    80005634:	00093703          	ld	a4,0(s2)
    80005638:	016487b3          	add	a5,s1,s6
    8000563c:	00e4b023          	sd	a4,0(s1)
    80005640:	00993023          	sd	s1,0(s2)
    80005644:	fcfa76e3          	bgeu	s4,a5,80005610 <freerange+0x70>
    80005648:	03813083          	ld	ra,56(sp)
    8000564c:	03013403          	ld	s0,48(sp)
    80005650:	02813483          	ld	s1,40(sp)
    80005654:	02013903          	ld	s2,32(sp)
    80005658:	01813983          	ld	s3,24(sp)
    8000565c:	01013a03          	ld	s4,16(sp)
    80005660:	00813a83          	ld	s5,8(sp)
    80005664:	00013b03          	ld	s6,0(sp)
    80005668:	04010113          	addi	sp,sp,64
    8000566c:	00008067          	ret
    80005670:	00001517          	auipc	a0,0x1
    80005674:	c7050513          	addi	a0,a0,-912 # 800062e0 <digits+0x18>
    80005678:	fffff097          	auipc	ra,0xfffff
    8000567c:	3d4080e7          	jalr	980(ra) # 80004a4c <panic>

0000000080005680 <kfree>:
    80005680:	fe010113          	addi	sp,sp,-32
    80005684:	00813823          	sd	s0,16(sp)
    80005688:	00113c23          	sd	ra,24(sp)
    8000568c:	00913423          	sd	s1,8(sp)
    80005690:	02010413          	addi	s0,sp,32
    80005694:	03451793          	slli	a5,a0,0x34
    80005698:	04079c63          	bnez	a5,800056f0 <kfree+0x70>
    8000569c:	00003797          	auipc	a5,0x3
    800056a0:	98478793          	addi	a5,a5,-1660 # 80008020 <end>
    800056a4:	00050493          	mv	s1,a0
    800056a8:	04f56463          	bltu	a0,a5,800056f0 <kfree+0x70>
    800056ac:	01100793          	li	a5,17
    800056b0:	01b79793          	slli	a5,a5,0x1b
    800056b4:	02f57e63          	bgeu	a0,a5,800056f0 <kfree+0x70>
    800056b8:	00001637          	lui	a2,0x1
    800056bc:	00100593          	li	a1,1
    800056c0:	00000097          	auipc	ra,0x0
    800056c4:	478080e7          	jalr	1144(ra) # 80005b38 <__memset>
    800056c8:	00001797          	auipc	a5,0x1
    800056cc:	6b878793          	addi	a5,a5,1720 # 80006d80 <kmem>
    800056d0:	0007b703          	ld	a4,0(a5)
    800056d4:	01813083          	ld	ra,24(sp)
    800056d8:	01013403          	ld	s0,16(sp)
    800056dc:	00e4b023          	sd	a4,0(s1)
    800056e0:	0097b023          	sd	s1,0(a5)
    800056e4:	00813483          	ld	s1,8(sp)
    800056e8:	02010113          	addi	sp,sp,32
    800056ec:	00008067          	ret
    800056f0:	00001517          	auipc	a0,0x1
    800056f4:	bf050513          	addi	a0,a0,-1040 # 800062e0 <digits+0x18>
    800056f8:	fffff097          	auipc	ra,0xfffff
    800056fc:	354080e7          	jalr	852(ra) # 80004a4c <panic>

0000000080005700 <kalloc>:
    80005700:	fe010113          	addi	sp,sp,-32
    80005704:	00813823          	sd	s0,16(sp)
    80005708:	00913423          	sd	s1,8(sp)
    8000570c:	00113c23          	sd	ra,24(sp)
    80005710:	02010413          	addi	s0,sp,32
    80005714:	00001797          	auipc	a5,0x1
    80005718:	66c78793          	addi	a5,a5,1644 # 80006d80 <kmem>
    8000571c:	0007b483          	ld	s1,0(a5)
    80005720:	02048063          	beqz	s1,80005740 <kalloc+0x40>
    80005724:	0004b703          	ld	a4,0(s1)
    80005728:	00001637          	lui	a2,0x1
    8000572c:	00500593          	li	a1,5
    80005730:	00048513          	mv	a0,s1
    80005734:	00e7b023          	sd	a4,0(a5)
    80005738:	00000097          	auipc	ra,0x0
    8000573c:	400080e7          	jalr	1024(ra) # 80005b38 <__memset>
    80005740:	01813083          	ld	ra,24(sp)
    80005744:	01013403          	ld	s0,16(sp)
    80005748:	00048513          	mv	a0,s1
    8000574c:	00813483          	ld	s1,8(sp)
    80005750:	02010113          	addi	sp,sp,32
    80005754:	00008067          	ret

0000000080005758 <initlock>:
    80005758:	ff010113          	addi	sp,sp,-16
    8000575c:	00813423          	sd	s0,8(sp)
    80005760:	01010413          	addi	s0,sp,16
    80005764:	00813403          	ld	s0,8(sp)
    80005768:	00b53423          	sd	a1,8(a0)
    8000576c:	00052023          	sw	zero,0(a0)
    80005770:	00053823          	sd	zero,16(a0)
    80005774:	01010113          	addi	sp,sp,16
    80005778:	00008067          	ret

000000008000577c <acquire>:
    8000577c:	fe010113          	addi	sp,sp,-32
    80005780:	00813823          	sd	s0,16(sp)
    80005784:	00913423          	sd	s1,8(sp)
    80005788:	00113c23          	sd	ra,24(sp)
    8000578c:	01213023          	sd	s2,0(sp)
    80005790:	02010413          	addi	s0,sp,32
    80005794:	00050493          	mv	s1,a0
    80005798:	10002973          	csrr	s2,sstatus
    8000579c:	100027f3          	csrr	a5,sstatus
    800057a0:	ffd7f793          	andi	a5,a5,-3
    800057a4:	10079073          	csrw	sstatus,a5
    800057a8:	fffff097          	auipc	ra,0xfffff
    800057ac:	8e8080e7          	jalr	-1816(ra) # 80004090 <mycpu>
    800057b0:	07852783          	lw	a5,120(a0)
    800057b4:	06078e63          	beqz	a5,80005830 <acquire+0xb4>
    800057b8:	fffff097          	auipc	ra,0xfffff
    800057bc:	8d8080e7          	jalr	-1832(ra) # 80004090 <mycpu>
    800057c0:	07852783          	lw	a5,120(a0)
    800057c4:	0004a703          	lw	a4,0(s1)
    800057c8:	0017879b          	addiw	a5,a5,1
    800057cc:	06f52c23          	sw	a5,120(a0)
    800057d0:	04071063          	bnez	a4,80005810 <acquire+0x94>
    800057d4:	00100713          	li	a4,1
    800057d8:	00070793          	mv	a5,a4
    800057dc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800057e0:	0007879b          	sext.w	a5,a5
    800057e4:	fe079ae3          	bnez	a5,800057d8 <acquire+0x5c>
    800057e8:	0ff0000f          	fence
    800057ec:	fffff097          	auipc	ra,0xfffff
    800057f0:	8a4080e7          	jalr	-1884(ra) # 80004090 <mycpu>
    800057f4:	01813083          	ld	ra,24(sp)
    800057f8:	01013403          	ld	s0,16(sp)
    800057fc:	00a4b823          	sd	a0,16(s1)
    80005800:	00013903          	ld	s2,0(sp)
    80005804:	00813483          	ld	s1,8(sp)
    80005808:	02010113          	addi	sp,sp,32
    8000580c:	00008067          	ret
    80005810:	0104b903          	ld	s2,16(s1)
    80005814:	fffff097          	auipc	ra,0xfffff
    80005818:	87c080e7          	jalr	-1924(ra) # 80004090 <mycpu>
    8000581c:	faa91ce3          	bne	s2,a0,800057d4 <acquire+0x58>
    80005820:	00001517          	auipc	a0,0x1
    80005824:	ac850513          	addi	a0,a0,-1336 # 800062e8 <digits+0x20>
    80005828:	fffff097          	auipc	ra,0xfffff
    8000582c:	224080e7          	jalr	548(ra) # 80004a4c <panic>
    80005830:	00195913          	srli	s2,s2,0x1
    80005834:	fffff097          	auipc	ra,0xfffff
    80005838:	85c080e7          	jalr	-1956(ra) # 80004090 <mycpu>
    8000583c:	00197913          	andi	s2,s2,1
    80005840:	07252e23          	sw	s2,124(a0)
    80005844:	f75ff06f          	j	800057b8 <acquire+0x3c>

0000000080005848 <release>:
    80005848:	fe010113          	addi	sp,sp,-32
    8000584c:	00813823          	sd	s0,16(sp)
    80005850:	00113c23          	sd	ra,24(sp)
    80005854:	00913423          	sd	s1,8(sp)
    80005858:	01213023          	sd	s2,0(sp)
    8000585c:	02010413          	addi	s0,sp,32
    80005860:	00052783          	lw	a5,0(a0)
    80005864:	00079a63          	bnez	a5,80005878 <release+0x30>
    80005868:	00001517          	auipc	a0,0x1
    8000586c:	a8850513          	addi	a0,a0,-1400 # 800062f0 <digits+0x28>
    80005870:	fffff097          	auipc	ra,0xfffff
    80005874:	1dc080e7          	jalr	476(ra) # 80004a4c <panic>
    80005878:	01053903          	ld	s2,16(a0)
    8000587c:	00050493          	mv	s1,a0
    80005880:	fffff097          	auipc	ra,0xfffff
    80005884:	810080e7          	jalr	-2032(ra) # 80004090 <mycpu>
    80005888:	fea910e3          	bne	s2,a0,80005868 <release+0x20>
    8000588c:	0004b823          	sd	zero,16(s1)
    80005890:	0ff0000f          	fence
    80005894:	0f50000f          	fence	iorw,ow
    80005898:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000589c:	ffffe097          	auipc	ra,0xffffe
    800058a0:	7f4080e7          	jalr	2036(ra) # 80004090 <mycpu>
    800058a4:	100027f3          	csrr	a5,sstatus
    800058a8:	0027f793          	andi	a5,a5,2
    800058ac:	04079a63          	bnez	a5,80005900 <release+0xb8>
    800058b0:	07852783          	lw	a5,120(a0)
    800058b4:	02f05e63          	blez	a5,800058f0 <release+0xa8>
    800058b8:	fff7871b          	addiw	a4,a5,-1
    800058bc:	06e52c23          	sw	a4,120(a0)
    800058c0:	00071c63          	bnez	a4,800058d8 <release+0x90>
    800058c4:	07c52783          	lw	a5,124(a0)
    800058c8:	00078863          	beqz	a5,800058d8 <release+0x90>
    800058cc:	100027f3          	csrr	a5,sstatus
    800058d0:	0027e793          	ori	a5,a5,2
    800058d4:	10079073          	csrw	sstatus,a5
    800058d8:	01813083          	ld	ra,24(sp)
    800058dc:	01013403          	ld	s0,16(sp)
    800058e0:	00813483          	ld	s1,8(sp)
    800058e4:	00013903          	ld	s2,0(sp)
    800058e8:	02010113          	addi	sp,sp,32
    800058ec:	00008067          	ret
    800058f0:	00001517          	auipc	a0,0x1
    800058f4:	a2050513          	addi	a0,a0,-1504 # 80006310 <digits+0x48>
    800058f8:	fffff097          	auipc	ra,0xfffff
    800058fc:	154080e7          	jalr	340(ra) # 80004a4c <panic>
    80005900:	00001517          	auipc	a0,0x1
    80005904:	9f850513          	addi	a0,a0,-1544 # 800062f8 <digits+0x30>
    80005908:	fffff097          	auipc	ra,0xfffff
    8000590c:	144080e7          	jalr	324(ra) # 80004a4c <panic>

0000000080005910 <holding>:
    80005910:	00052783          	lw	a5,0(a0)
    80005914:	00079663          	bnez	a5,80005920 <holding+0x10>
    80005918:	00000513          	li	a0,0
    8000591c:	00008067          	ret
    80005920:	fe010113          	addi	sp,sp,-32
    80005924:	00813823          	sd	s0,16(sp)
    80005928:	00913423          	sd	s1,8(sp)
    8000592c:	00113c23          	sd	ra,24(sp)
    80005930:	02010413          	addi	s0,sp,32
    80005934:	01053483          	ld	s1,16(a0)
    80005938:	ffffe097          	auipc	ra,0xffffe
    8000593c:	758080e7          	jalr	1880(ra) # 80004090 <mycpu>
    80005940:	01813083          	ld	ra,24(sp)
    80005944:	01013403          	ld	s0,16(sp)
    80005948:	40a48533          	sub	a0,s1,a0
    8000594c:	00153513          	seqz	a0,a0
    80005950:	00813483          	ld	s1,8(sp)
    80005954:	02010113          	addi	sp,sp,32
    80005958:	00008067          	ret

000000008000595c <push_off>:
    8000595c:	fe010113          	addi	sp,sp,-32
    80005960:	00813823          	sd	s0,16(sp)
    80005964:	00113c23          	sd	ra,24(sp)
    80005968:	00913423          	sd	s1,8(sp)
    8000596c:	02010413          	addi	s0,sp,32
    80005970:	100024f3          	csrr	s1,sstatus
    80005974:	100027f3          	csrr	a5,sstatus
    80005978:	ffd7f793          	andi	a5,a5,-3
    8000597c:	10079073          	csrw	sstatus,a5
    80005980:	ffffe097          	auipc	ra,0xffffe
    80005984:	710080e7          	jalr	1808(ra) # 80004090 <mycpu>
    80005988:	07852783          	lw	a5,120(a0)
    8000598c:	02078663          	beqz	a5,800059b8 <push_off+0x5c>
    80005990:	ffffe097          	auipc	ra,0xffffe
    80005994:	700080e7          	jalr	1792(ra) # 80004090 <mycpu>
    80005998:	07852783          	lw	a5,120(a0)
    8000599c:	01813083          	ld	ra,24(sp)
    800059a0:	01013403          	ld	s0,16(sp)
    800059a4:	0017879b          	addiw	a5,a5,1
    800059a8:	06f52c23          	sw	a5,120(a0)
    800059ac:	00813483          	ld	s1,8(sp)
    800059b0:	02010113          	addi	sp,sp,32
    800059b4:	00008067          	ret
    800059b8:	0014d493          	srli	s1,s1,0x1
    800059bc:	ffffe097          	auipc	ra,0xffffe
    800059c0:	6d4080e7          	jalr	1748(ra) # 80004090 <mycpu>
    800059c4:	0014f493          	andi	s1,s1,1
    800059c8:	06952e23          	sw	s1,124(a0)
    800059cc:	fc5ff06f          	j	80005990 <push_off+0x34>

00000000800059d0 <pop_off>:
    800059d0:	ff010113          	addi	sp,sp,-16
    800059d4:	00813023          	sd	s0,0(sp)
    800059d8:	00113423          	sd	ra,8(sp)
    800059dc:	01010413          	addi	s0,sp,16
    800059e0:	ffffe097          	auipc	ra,0xffffe
    800059e4:	6b0080e7          	jalr	1712(ra) # 80004090 <mycpu>
    800059e8:	100027f3          	csrr	a5,sstatus
    800059ec:	0027f793          	andi	a5,a5,2
    800059f0:	04079663          	bnez	a5,80005a3c <pop_off+0x6c>
    800059f4:	07852783          	lw	a5,120(a0)
    800059f8:	02f05a63          	blez	a5,80005a2c <pop_off+0x5c>
    800059fc:	fff7871b          	addiw	a4,a5,-1
    80005a00:	06e52c23          	sw	a4,120(a0)
    80005a04:	00071c63          	bnez	a4,80005a1c <pop_off+0x4c>
    80005a08:	07c52783          	lw	a5,124(a0)
    80005a0c:	00078863          	beqz	a5,80005a1c <pop_off+0x4c>
    80005a10:	100027f3          	csrr	a5,sstatus
    80005a14:	0027e793          	ori	a5,a5,2
    80005a18:	10079073          	csrw	sstatus,a5
    80005a1c:	00813083          	ld	ra,8(sp)
    80005a20:	00013403          	ld	s0,0(sp)
    80005a24:	01010113          	addi	sp,sp,16
    80005a28:	00008067          	ret
    80005a2c:	00001517          	auipc	a0,0x1
    80005a30:	8e450513          	addi	a0,a0,-1820 # 80006310 <digits+0x48>
    80005a34:	fffff097          	auipc	ra,0xfffff
    80005a38:	018080e7          	jalr	24(ra) # 80004a4c <panic>
    80005a3c:	00001517          	auipc	a0,0x1
    80005a40:	8bc50513          	addi	a0,a0,-1860 # 800062f8 <digits+0x30>
    80005a44:	fffff097          	auipc	ra,0xfffff
    80005a48:	008080e7          	jalr	8(ra) # 80004a4c <panic>

0000000080005a4c <push_on>:
    80005a4c:	fe010113          	addi	sp,sp,-32
    80005a50:	00813823          	sd	s0,16(sp)
    80005a54:	00113c23          	sd	ra,24(sp)
    80005a58:	00913423          	sd	s1,8(sp)
    80005a5c:	02010413          	addi	s0,sp,32
    80005a60:	100024f3          	csrr	s1,sstatus
    80005a64:	100027f3          	csrr	a5,sstatus
    80005a68:	0027e793          	ori	a5,a5,2
    80005a6c:	10079073          	csrw	sstatus,a5
    80005a70:	ffffe097          	auipc	ra,0xffffe
    80005a74:	620080e7          	jalr	1568(ra) # 80004090 <mycpu>
    80005a78:	07852783          	lw	a5,120(a0)
    80005a7c:	02078663          	beqz	a5,80005aa8 <push_on+0x5c>
    80005a80:	ffffe097          	auipc	ra,0xffffe
    80005a84:	610080e7          	jalr	1552(ra) # 80004090 <mycpu>
    80005a88:	07852783          	lw	a5,120(a0)
    80005a8c:	01813083          	ld	ra,24(sp)
    80005a90:	01013403          	ld	s0,16(sp)
    80005a94:	0017879b          	addiw	a5,a5,1
    80005a98:	06f52c23          	sw	a5,120(a0)
    80005a9c:	00813483          	ld	s1,8(sp)
    80005aa0:	02010113          	addi	sp,sp,32
    80005aa4:	00008067          	ret
    80005aa8:	0014d493          	srli	s1,s1,0x1
    80005aac:	ffffe097          	auipc	ra,0xffffe
    80005ab0:	5e4080e7          	jalr	1508(ra) # 80004090 <mycpu>
    80005ab4:	0014f493          	andi	s1,s1,1
    80005ab8:	06952e23          	sw	s1,124(a0)
    80005abc:	fc5ff06f          	j	80005a80 <push_on+0x34>

0000000080005ac0 <pop_on>:
    80005ac0:	ff010113          	addi	sp,sp,-16
    80005ac4:	00813023          	sd	s0,0(sp)
    80005ac8:	00113423          	sd	ra,8(sp)
    80005acc:	01010413          	addi	s0,sp,16
    80005ad0:	ffffe097          	auipc	ra,0xffffe
    80005ad4:	5c0080e7          	jalr	1472(ra) # 80004090 <mycpu>
    80005ad8:	100027f3          	csrr	a5,sstatus
    80005adc:	0027f793          	andi	a5,a5,2
    80005ae0:	04078463          	beqz	a5,80005b28 <pop_on+0x68>
    80005ae4:	07852783          	lw	a5,120(a0)
    80005ae8:	02f05863          	blez	a5,80005b18 <pop_on+0x58>
    80005aec:	fff7879b          	addiw	a5,a5,-1
    80005af0:	06f52c23          	sw	a5,120(a0)
    80005af4:	07853783          	ld	a5,120(a0)
    80005af8:	00079863          	bnez	a5,80005b08 <pop_on+0x48>
    80005afc:	100027f3          	csrr	a5,sstatus
    80005b00:	ffd7f793          	andi	a5,a5,-3
    80005b04:	10079073          	csrw	sstatus,a5
    80005b08:	00813083          	ld	ra,8(sp)
    80005b0c:	00013403          	ld	s0,0(sp)
    80005b10:	01010113          	addi	sp,sp,16
    80005b14:	00008067          	ret
    80005b18:	00001517          	auipc	a0,0x1
    80005b1c:	82050513          	addi	a0,a0,-2016 # 80006338 <digits+0x70>
    80005b20:	fffff097          	auipc	ra,0xfffff
    80005b24:	f2c080e7          	jalr	-212(ra) # 80004a4c <panic>
    80005b28:	00000517          	auipc	a0,0x0
    80005b2c:	7f050513          	addi	a0,a0,2032 # 80006318 <digits+0x50>
    80005b30:	fffff097          	auipc	ra,0xfffff
    80005b34:	f1c080e7          	jalr	-228(ra) # 80004a4c <panic>

0000000080005b38 <__memset>:
    80005b38:	ff010113          	addi	sp,sp,-16
    80005b3c:	00813423          	sd	s0,8(sp)
    80005b40:	01010413          	addi	s0,sp,16
    80005b44:	1a060e63          	beqz	a2,80005d00 <__memset+0x1c8>
    80005b48:	40a007b3          	neg	a5,a0
    80005b4c:	0077f793          	andi	a5,a5,7
    80005b50:	00778693          	addi	a3,a5,7
    80005b54:	00b00813          	li	a6,11
    80005b58:	0ff5f593          	andi	a1,a1,255
    80005b5c:	fff6071b          	addiw	a4,a2,-1
    80005b60:	1b06e663          	bltu	a3,a6,80005d0c <__memset+0x1d4>
    80005b64:	1cd76463          	bltu	a4,a3,80005d2c <__memset+0x1f4>
    80005b68:	1a078e63          	beqz	a5,80005d24 <__memset+0x1ec>
    80005b6c:	00b50023          	sb	a1,0(a0)
    80005b70:	00100713          	li	a4,1
    80005b74:	1ae78463          	beq	a5,a4,80005d1c <__memset+0x1e4>
    80005b78:	00b500a3          	sb	a1,1(a0)
    80005b7c:	00200713          	li	a4,2
    80005b80:	1ae78a63          	beq	a5,a4,80005d34 <__memset+0x1fc>
    80005b84:	00b50123          	sb	a1,2(a0)
    80005b88:	00300713          	li	a4,3
    80005b8c:	18e78463          	beq	a5,a4,80005d14 <__memset+0x1dc>
    80005b90:	00b501a3          	sb	a1,3(a0)
    80005b94:	00400713          	li	a4,4
    80005b98:	1ae78263          	beq	a5,a4,80005d3c <__memset+0x204>
    80005b9c:	00b50223          	sb	a1,4(a0)
    80005ba0:	00500713          	li	a4,5
    80005ba4:	1ae78063          	beq	a5,a4,80005d44 <__memset+0x20c>
    80005ba8:	00b502a3          	sb	a1,5(a0)
    80005bac:	00700713          	li	a4,7
    80005bb0:	18e79e63          	bne	a5,a4,80005d4c <__memset+0x214>
    80005bb4:	00b50323          	sb	a1,6(a0)
    80005bb8:	00700e93          	li	t4,7
    80005bbc:	00859713          	slli	a4,a1,0x8
    80005bc0:	00e5e733          	or	a4,a1,a4
    80005bc4:	01059e13          	slli	t3,a1,0x10
    80005bc8:	01c76e33          	or	t3,a4,t3
    80005bcc:	01859313          	slli	t1,a1,0x18
    80005bd0:	006e6333          	or	t1,t3,t1
    80005bd4:	02059893          	slli	a7,a1,0x20
    80005bd8:	40f60e3b          	subw	t3,a2,a5
    80005bdc:	011368b3          	or	a7,t1,a7
    80005be0:	02859813          	slli	a6,a1,0x28
    80005be4:	0108e833          	or	a6,a7,a6
    80005be8:	03059693          	slli	a3,a1,0x30
    80005bec:	003e589b          	srliw	a7,t3,0x3
    80005bf0:	00d866b3          	or	a3,a6,a3
    80005bf4:	03859713          	slli	a4,a1,0x38
    80005bf8:	00389813          	slli	a6,a7,0x3
    80005bfc:	00f507b3          	add	a5,a0,a5
    80005c00:	00e6e733          	or	a4,a3,a4
    80005c04:	000e089b          	sext.w	a7,t3
    80005c08:	00f806b3          	add	a3,a6,a5
    80005c0c:	00e7b023          	sd	a4,0(a5)
    80005c10:	00878793          	addi	a5,a5,8
    80005c14:	fed79ce3          	bne	a5,a3,80005c0c <__memset+0xd4>
    80005c18:	ff8e7793          	andi	a5,t3,-8
    80005c1c:	0007871b          	sext.w	a4,a5
    80005c20:	01d787bb          	addw	a5,a5,t4
    80005c24:	0ce88e63          	beq	a7,a4,80005d00 <__memset+0x1c8>
    80005c28:	00f50733          	add	a4,a0,a5
    80005c2c:	00b70023          	sb	a1,0(a4)
    80005c30:	0017871b          	addiw	a4,a5,1
    80005c34:	0cc77663          	bgeu	a4,a2,80005d00 <__memset+0x1c8>
    80005c38:	00e50733          	add	a4,a0,a4
    80005c3c:	00b70023          	sb	a1,0(a4)
    80005c40:	0027871b          	addiw	a4,a5,2
    80005c44:	0ac77e63          	bgeu	a4,a2,80005d00 <__memset+0x1c8>
    80005c48:	00e50733          	add	a4,a0,a4
    80005c4c:	00b70023          	sb	a1,0(a4)
    80005c50:	0037871b          	addiw	a4,a5,3
    80005c54:	0ac77663          	bgeu	a4,a2,80005d00 <__memset+0x1c8>
    80005c58:	00e50733          	add	a4,a0,a4
    80005c5c:	00b70023          	sb	a1,0(a4)
    80005c60:	0047871b          	addiw	a4,a5,4
    80005c64:	08c77e63          	bgeu	a4,a2,80005d00 <__memset+0x1c8>
    80005c68:	00e50733          	add	a4,a0,a4
    80005c6c:	00b70023          	sb	a1,0(a4)
    80005c70:	0057871b          	addiw	a4,a5,5
    80005c74:	08c77663          	bgeu	a4,a2,80005d00 <__memset+0x1c8>
    80005c78:	00e50733          	add	a4,a0,a4
    80005c7c:	00b70023          	sb	a1,0(a4)
    80005c80:	0067871b          	addiw	a4,a5,6
    80005c84:	06c77e63          	bgeu	a4,a2,80005d00 <__memset+0x1c8>
    80005c88:	00e50733          	add	a4,a0,a4
    80005c8c:	00b70023          	sb	a1,0(a4)
    80005c90:	0077871b          	addiw	a4,a5,7
    80005c94:	06c77663          	bgeu	a4,a2,80005d00 <__memset+0x1c8>
    80005c98:	00e50733          	add	a4,a0,a4
    80005c9c:	00b70023          	sb	a1,0(a4)
    80005ca0:	0087871b          	addiw	a4,a5,8
    80005ca4:	04c77e63          	bgeu	a4,a2,80005d00 <__memset+0x1c8>
    80005ca8:	00e50733          	add	a4,a0,a4
    80005cac:	00b70023          	sb	a1,0(a4)
    80005cb0:	0097871b          	addiw	a4,a5,9
    80005cb4:	04c77663          	bgeu	a4,a2,80005d00 <__memset+0x1c8>
    80005cb8:	00e50733          	add	a4,a0,a4
    80005cbc:	00b70023          	sb	a1,0(a4)
    80005cc0:	00a7871b          	addiw	a4,a5,10
    80005cc4:	02c77e63          	bgeu	a4,a2,80005d00 <__memset+0x1c8>
    80005cc8:	00e50733          	add	a4,a0,a4
    80005ccc:	00b70023          	sb	a1,0(a4)
    80005cd0:	00b7871b          	addiw	a4,a5,11
    80005cd4:	02c77663          	bgeu	a4,a2,80005d00 <__memset+0x1c8>
    80005cd8:	00e50733          	add	a4,a0,a4
    80005cdc:	00b70023          	sb	a1,0(a4)
    80005ce0:	00c7871b          	addiw	a4,a5,12
    80005ce4:	00c77e63          	bgeu	a4,a2,80005d00 <__memset+0x1c8>
    80005ce8:	00e50733          	add	a4,a0,a4
    80005cec:	00b70023          	sb	a1,0(a4)
    80005cf0:	00d7879b          	addiw	a5,a5,13
    80005cf4:	00c7f663          	bgeu	a5,a2,80005d00 <__memset+0x1c8>
    80005cf8:	00f507b3          	add	a5,a0,a5
    80005cfc:	00b78023          	sb	a1,0(a5)
    80005d00:	00813403          	ld	s0,8(sp)
    80005d04:	01010113          	addi	sp,sp,16
    80005d08:	00008067          	ret
    80005d0c:	00b00693          	li	a3,11
    80005d10:	e55ff06f          	j	80005b64 <__memset+0x2c>
    80005d14:	00300e93          	li	t4,3
    80005d18:	ea5ff06f          	j	80005bbc <__memset+0x84>
    80005d1c:	00100e93          	li	t4,1
    80005d20:	e9dff06f          	j	80005bbc <__memset+0x84>
    80005d24:	00000e93          	li	t4,0
    80005d28:	e95ff06f          	j	80005bbc <__memset+0x84>
    80005d2c:	00000793          	li	a5,0
    80005d30:	ef9ff06f          	j	80005c28 <__memset+0xf0>
    80005d34:	00200e93          	li	t4,2
    80005d38:	e85ff06f          	j	80005bbc <__memset+0x84>
    80005d3c:	00400e93          	li	t4,4
    80005d40:	e7dff06f          	j	80005bbc <__memset+0x84>
    80005d44:	00500e93          	li	t4,5
    80005d48:	e75ff06f          	j	80005bbc <__memset+0x84>
    80005d4c:	00600e93          	li	t4,6
    80005d50:	e6dff06f          	j	80005bbc <__memset+0x84>

0000000080005d54 <__memmove>:
    80005d54:	ff010113          	addi	sp,sp,-16
    80005d58:	00813423          	sd	s0,8(sp)
    80005d5c:	01010413          	addi	s0,sp,16
    80005d60:	0e060863          	beqz	a2,80005e50 <__memmove+0xfc>
    80005d64:	fff6069b          	addiw	a3,a2,-1
    80005d68:	0006881b          	sext.w	a6,a3
    80005d6c:	0ea5e863          	bltu	a1,a0,80005e5c <__memmove+0x108>
    80005d70:	00758713          	addi	a4,a1,7
    80005d74:	00a5e7b3          	or	a5,a1,a0
    80005d78:	40a70733          	sub	a4,a4,a0
    80005d7c:	0077f793          	andi	a5,a5,7
    80005d80:	00f73713          	sltiu	a4,a4,15
    80005d84:	00174713          	xori	a4,a4,1
    80005d88:	0017b793          	seqz	a5,a5
    80005d8c:	00e7f7b3          	and	a5,a5,a4
    80005d90:	10078863          	beqz	a5,80005ea0 <__memmove+0x14c>
    80005d94:	00900793          	li	a5,9
    80005d98:	1107f463          	bgeu	a5,a6,80005ea0 <__memmove+0x14c>
    80005d9c:	0036581b          	srliw	a6,a2,0x3
    80005da0:	fff8081b          	addiw	a6,a6,-1
    80005da4:	02081813          	slli	a6,a6,0x20
    80005da8:	01d85893          	srli	a7,a6,0x1d
    80005dac:	00858813          	addi	a6,a1,8
    80005db0:	00058793          	mv	a5,a1
    80005db4:	00050713          	mv	a4,a0
    80005db8:	01088833          	add	a6,a7,a6
    80005dbc:	0007b883          	ld	a7,0(a5)
    80005dc0:	00878793          	addi	a5,a5,8
    80005dc4:	00870713          	addi	a4,a4,8
    80005dc8:	ff173c23          	sd	a7,-8(a4)
    80005dcc:	ff0798e3          	bne	a5,a6,80005dbc <__memmove+0x68>
    80005dd0:	ff867713          	andi	a4,a2,-8
    80005dd4:	02071793          	slli	a5,a4,0x20
    80005dd8:	0207d793          	srli	a5,a5,0x20
    80005ddc:	00f585b3          	add	a1,a1,a5
    80005de0:	40e686bb          	subw	a3,a3,a4
    80005de4:	00f507b3          	add	a5,a0,a5
    80005de8:	06e60463          	beq	a2,a4,80005e50 <__memmove+0xfc>
    80005dec:	0005c703          	lbu	a4,0(a1)
    80005df0:	00e78023          	sb	a4,0(a5)
    80005df4:	04068e63          	beqz	a3,80005e50 <__memmove+0xfc>
    80005df8:	0015c603          	lbu	a2,1(a1)
    80005dfc:	00100713          	li	a4,1
    80005e00:	00c780a3          	sb	a2,1(a5)
    80005e04:	04e68663          	beq	a3,a4,80005e50 <__memmove+0xfc>
    80005e08:	0025c603          	lbu	a2,2(a1)
    80005e0c:	00200713          	li	a4,2
    80005e10:	00c78123          	sb	a2,2(a5)
    80005e14:	02e68e63          	beq	a3,a4,80005e50 <__memmove+0xfc>
    80005e18:	0035c603          	lbu	a2,3(a1)
    80005e1c:	00300713          	li	a4,3
    80005e20:	00c781a3          	sb	a2,3(a5)
    80005e24:	02e68663          	beq	a3,a4,80005e50 <__memmove+0xfc>
    80005e28:	0045c603          	lbu	a2,4(a1)
    80005e2c:	00400713          	li	a4,4
    80005e30:	00c78223          	sb	a2,4(a5)
    80005e34:	00e68e63          	beq	a3,a4,80005e50 <__memmove+0xfc>
    80005e38:	0055c603          	lbu	a2,5(a1)
    80005e3c:	00500713          	li	a4,5
    80005e40:	00c782a3          	sb	a2,5(a5)
    80005e44:	00e68663          	beq	a3,a4,80005e50 <__memmove+0xfc>
    80005e48:	0065c703          	lbu	a4,6(a1)
    80005e4c:	00e78323          	sb	a4,6(a5)
    80005e50:	00813403          	ld	s0,8(sp)
    80005e54:	01010113          	addi	sp,sp,16
    80005e58:	00008067          	ret
    80005e5c:	02061713          	slli	a4,a2,0x20
    80005e60:	02075713          	srli	a4,a4,0x20
    80005e64:	00e587b3          	add	a5,a1,a4
    80005e68:	f0f574e3          	bgeu	a0,a5,80005d70 <__memmove+0x1c>
    80005e6c:	02069613          	slli	a2,a3,0x20
    80005e70:	02065613          	srli	a2,a2,0x20
    80005e74:	fff64613          	not	a2,a2
    80005e78:	00e50733          	add	a4,a0,a4
    80005e7c:	00c78633          	add	a2,a5,a2
    80005e80:	fff7c683          	lbu	a3,-1(a5)
    80005e84:	fff78793          	addi	a5,a5,-1
    80005e88:	fff70713          	addi	a4,a4,-1
    80005e8c:	00d70023          	sb	a3,0(a4)
    80005e90:	fec798e3          	bne	a5,a2,80005e80 <__memmove+0x12c>
    80005e94:	00813403          	ld	s0,8(sp)
    80005e98:	01010113          	addi	sp,sp,16
    80005e9c:	00008067          	ret
    80005ea0:	02069713          	slli	a4,a3,0x20
    80005ea4:	02075713          	srli	a4,a4,0x20
    80005ea8:	00170713          	addi	a4,a4,1
    80005eac:	00e50733          	add	a4,a0,a4
    80005eb0:	00050793          	mv	a5,a0
    80005eb4:	0005c683          	lbu	a3,0(a1)
    80005eb8:	00178793          	addi	a5,a5,1
    80005ebc:	00158593          	addi	a1,a1,1
    80005ec0:	fed78fa3          	sb	a3,-1(a5)
    80005ec4:	fee798e3          	bne	a5,a4,80005eb4 <__memmove+0x160>
    80005ec8:	f89ff06f          	j	80005e50 <__memmove+0xfc>

0000000080005ecc <__putc>:
    80005ecc:	fe010113          	addi	sp,sp,-32
    80005ed0:	00813823          	sd	s0,16(sp)
    80005ed4:	00113c23          	sd	ra,24(sp)
    80005ed8:	02010413          	addi	s0,sp,32
    80005edc:	00050793          	mv	a5,a0
    80005ee0:	fef40593          	addi	a1,s0,-17
    80005ee4:	00100613          	li	a2,1
    80005ee8:	00000513          	li	a0,0
    80005eec:	fef407a3          	sb	a5,-17(s0)
    80005ef0:	fffff097          	auipc	ra,0xfffff
    80005ef4:	b3c080e7          	jalr	-1220(ra) # 80004a2c <console_write>
    80005ef8:	01813083          	ld	ra,24(sp)
    80005efc:	01013403          	ld	s0,16(sp)
    80005f00:	02010113          	addi	sp,sp,32
    80005f04:	00008067          	ret

0000000080005f08 <__getc>:
    80005f08:	fe010113          	addi	sp,sp,-32
    80005f0c:	00813823          	sd	s0,16(sp)
    80005f10:	00113c23          	sd	ra,24(sp)
    80005f14:	02010413          	addi	s0,sp,32
    80005f18:	fe840593          	addi	a1,s0,-24
    80005f1c:	00100613          	li	a2,1
    80005f20:	00000513          	li	a0,0
    80005f24:	fffff097          	auipc	ra,0xfffff
    80005f28:	ae8080e7          	jalr	-1304(ra) # 80004a0c <console_read>
    80005f2c:	fe844503          	lbu	a0,-24(s0)
    80005f30:	01813083          	ld	ra,24(sp)
    80005f34:	01013403          	ld	s0,16(sp)
    80005f38:	02010113          	addi	sp,sp,32
    80005f3c:	00008067          	ret

0000000080005f40 <console_handler>:
    80005f40:	fe010113          	addi	sp,sp,-32
    80005f44:	00813823          	sd	s0,16(sp)
    80005f48:	00113c23          	sd	ra,24(sp)
    80005f4c:	00913423          	sd	s1,8(sp)
    80005f50:	02010413          	addi	s0,sp,32
    80005f54:	14202773          	csrr	a4,scause
    80005f58:	100027f3          	csrr	a5,sstatus
    80005f5c:	0027f793          	andi	a5,a5,2
    80005f60:	06079e63          	bnez	a5,80005fdc <console_handler+0x9c>
    80005f64:	00074c63          	bltz	a4,80005f7c <console_handler+0x3c>
    80005f68:	01813083          	ld	ra,24(sp)
    80005f6c:	01013403          	ld	s0,16(sp)
    80005f70:	00813483          	ld	s1,8(sp)
    80005f74:	02010113          	addi	sp,sp,32
    80005f78:	00008067          	ret
    80005f7c:	0ff77713          	andi	a4,a4,255
    80005f80:	00900793          	li	a5,9
    80005f84:	fef712e3          	bne	a4,a5,80005f68 <console_handler+0x28>
    80005f88:	ffffe097          	auipc	ra,0xffffe
    80005f8c:	6dc080e7          	jalr	1756(ra) # 80004664 <plic_claim>
    80005f90:	00a00793          	li	a5,10
    80005f94:	00050493          	mv	s1,a0
    80005f98:	02f50c63          	beq	a0,a5,80005fd0 <console_handler+0x90>
    80005f9c:	fc0506e3          	beqz	a0,80005f68 <console_handler+0x28>
    80005fa0:	00050593          	mv	a1,a0
    80005fa4:	00000517          	auipc	a0,0x0
    80005fa8:	29c50513          	addi	a0,a0,668 # 80006240 <CONSOLE_STATUS+0x230>
    80005fac:	fffff097          	auipc	ra,0xfffff
    80005fb0:	afc080e7          	jalr	-1284(ra) # 80004aa8 <__printf>
    80005fb4:	01013403          	ld	s0,16(sp)
    80005fb8:	01813083          	ld	ra,24(sp)
    80005fbc:	00048513          	mv	a0,s1
    80005fc0:	00813483          	ld	s1,8(sp)
    80005fc4:	02010113          	addi	sp,sp,32
    80005fc8:	ffffe317          	auipc	t1,0xffffe
    80005fcc:	6d430067          	jr	1748(t1) # 8000469c <plic_complete>
    80005fd0:	fffff097          	auipc	ra,0xfffff
    80005fd4:	3e0080e7          	jalr	992(ra) # 800053b0 <uartintr>
    80005fd8:	fddff06f          	j	80005fb4 <console_handler+0x74>
    80005fdc:	00000517          	auipc	a0,0x0
    80005fe0:	36450513          	addi	a0,a0,868 # 80006340 <digits+0x78>
    80005fe4:	fffff097          	auipc	ra,0xfffff
    80005fe8:	a68080e7          	jalr	-1432(ra) # 80004a4c <panic>
	...
