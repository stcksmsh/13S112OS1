
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00009117          	auipc	sp,0x9
    80000004:	30013103          	ld	sp,768(sp) # 80009300 <_GLOBAL_OFFSET_TABLE_+0x38>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	7e5040ef          	jal	ra,80005000 <start>

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
    8000107c:	4e0030ef          	jal	ra,8000455c <exceptionHandler>


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

Timer* Timer::instance = 0;

Timer::Timer(){
    80001100:	fe010113          	addi	sp,sp,-32
    80001104:	00113c23          	sd	ra,24(sp)
    80001108:	00813823          	sd	s0,16(sp)
    8000110c:	00913423          	sd	s1,8(sp)
    80001110:	02010413          	addi	s0,sp,32
    80001114:	00050493          	mv	s1,a0
    assert(instance == 0);
    80001118:	00008797          	auipc	a5,0x8
    8000111c:	2587b783          	ld	a5,600(a5) # 80009370 <_ZN5Timer8instanceE>
    80001120:	02079463          	bnez	a5,80001148 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80001124:	00008797          	auipc	a5,0x8
    80001128:	2497b623          	sd	s1,588(a5) # 80009370 <_ZN5Timer8instanceE>
    sleepingHead = 0;
    8000112c:	0004b023          	sd	zero,0(s1)
    time = 0;
    80001130:	0004b423          	sd	zero,8(s1)
}
    80001134:	01813083          	ld	ra,24(sp)
    80001138:	01013403          	ld	s0,16(sp)
    8000113c:	00813483          	ld	s1,8(sp)
    80001140:	02010113          	addi	sp,sp,32
    80001144:	00008067          	ret
    assert(instance == 0);
    80001148:	00007697          	auipc	a3,0x7
    8000114c:	ed868693          	addi	a3,a3,-296 # 80008020 <CONSOLE_STATUS+0x10>
    80001150:	01400613          	li	a2,20
    80001154:	00007597          	auipc	a1,0x7
    80001158:	edc58593          	addi	a1,a1,-292 # 80008030 <CONSOLE_STATUS+0x20>
    8000115c:	00007517          	auipc	a0,0x7
    80001160:	ee450513          	addi	a0,a0,-284 # 80008040 <CONSOLE_STATUS+0x30>
    80001164:	00001097          	auipc	ra,0x1
    80001168:	9d8080e7          	jalr	-1576(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    8000116c:	fb9ff06f          	j	80001124 <_ZN5TimerC1Ev+0x24>

0000000080001170 <_ZN5TimerD1Ev>:

Timer::~Timer(){
    threadSleepWrapper* current = sleepingHead;
    80001170:	00053503          	ld	a0,0(a0)
    while(current != 0){
    80001174:	04050063          	beqz	a0,800011b4 <_ZN5TimerD1Ev+0x44>
Timer::~Timer(){
    80001178:	fe010113          	addi	sp,sp,-32
    8000117c:	00113c23          	sd	ra,24(sp)
    80001180:	00813823          	sd	s0,16(sp)
    80001184:	00913423          	sd	s1,8(sp)
    80001188:	02010413          	addi	s0,sp,32
        threadSleepWrapper* next = current->next;
    8000118c:	01053483          	ld	s1,16(a0)
        mem_free(current);
    80001190:	00000097          	auipc	ra,0x0
    80001194:	24c080e7          	jalr	588(ra) # 800013dc <_Z8mem_freePv>
        current = next;
    80001198:	00048513          	mv	a0,s1
    while(current != 0){
    8000119c:	fe0498e3          	bnez	s1,8000118c <_ZN5TimerD1Ev+0x1c>
    }
}
    800011a0:	01813083          	ld	ra,24(sp)
    800011a4:	01013403          	ld	s0,16(sp)
    800011a8:	00813483          	ld	s1,8(sp)
    800011ac:	02010113          	addi	sp,sp,32
    800011b0:	00008067          	ret
    800011b4:	00008067          	ret

00000000800011b8 <_ZN5Timer11getInstanceEv>:

Timer& Timer::getInstance(){
    assert(instance != 0);
    800011b8:	00008797          	auipc	a5,0x8
    800011bc:	1b87b783          	ld	a5,440(a5) # 80009370 <_ZN5Timer8instanceE>
    800011c0:	00078863          	beqz	a5,800011d0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800011c4:	00008517          	auipc	a0,0x8
    800011c8:	1ac53503          	ld	a0,428(a0) # 80009370 <_ZN5Timer8instanceE>
    800011cc:	00008067          	ret
Timer& Timer::getInstance(){
    800011d0:	ff010113          	addi	sp,sp,-16
    800011d4:	00113423          	sd	ra,8(sp)
    800011d8:	00813023          	sd	s0,0(sp)
    800011dc:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    800011e0:	00007697          	auipc	a3,0x7
    800011e4:	e7068693          	addi	a3,a3,-400 # 80008050 <CONSOLE_STATUS+0x40>
    800011e8:	02400613          	li	a2,36
    800011ec:	00007597          	auipc	a1,0x7
    800011f0:	e4458593          	addi	a1,a1,-444 # 80008030 <CONSOLE_STATUS+0x20>
    800011f4:	00007517          	auipc	a0,0x7
    800011f8:	e8450513          	addi	a0,a0,-380 # 80008078 <CONSOLE_STATUS+0x68>
    800011fc:	00001097          	auipc	ra,0x1
    80001200:	940080e7          	jalr	-1728(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
}
    80001204:	00008517          	auipc	a0,0x8
    80001208:	16c53503          	ld	a0,364(a0) # 80009370 <_ZN5Timer8instanceE>
    8000120c:	00813083          	ld	ra,8(sp)
    80001210:	00013403          	ld	s0,0(sp)
    80001214:	01010113          	addi	sp,sp,16
    80001218:	00008067          	ret

000000008000121c <_ZN5Timer4tickEv>:

void Timer::tick(){
    8000121c:	fd010113          	addi	sp,sp,-48
    80001220:	02113423          	sd	ra,40(sp)
    80001224:	02813023          	sd	s0,32(sp)
    80001228:	00913c23          	sd	s1,24(sp)
    8000122c:	01213823          	sd	s2,16(sp)
    80001230:	01313423          	sd	s3,8(sp)
    80001234:	03010413          	addi	s0,sp,48
    80001238:	00050913          	mv	s2,a0
    time += 1;
    8000123c:	00853783          	ld	a5,8(a0)
    80001240:	00178793          	addi	a5,a5,1
    80001244:	00f53423          	sd	a5,8(a0)
    // if(time % 10 == 0){
    //     putc('t');
    // }
    threadSleepWrapper* current = sleepingHead;
    80001248:	00053483          	ld	s1,0(a0)
    8000124c:	0180006f          	j	80001264 <_ZN5Timer4tickEv+0x48>
        if(current->wakeUpTime <= time){
            current->thread->setSleeping(false);
            Scheduler::put(current->thread);
            threadSleepWrapper* next = current->next;
            if(current == sleepingHead){
                sleepingHead = next;
    80001250:	01393023          	sd	s3,0(s2)
            }
            mem_free(current);
    80001254:	00048513          	mv	a0,s1
    80001258:	00000097          	auipc	ra,0x0
    8000125c:	184080e7          	jalr	388(ra) # 800013dc <_Z8mem_freePv>
            current = next;
    80001260:	00098493          	mv	s1,s3
    while(current != 0){
    80001264:	02048e63          	beqz	s1,800012a0 <_ZN5Timer4tickEv+0x84>
        if(current->wakeUpTime <= time){
    80001268:	0084b703          	ld	a4,8(s1)
    8000126c:	00893783          	ld	a5,8(s2)
    80001270:	02e7e863          	bltu	a5,a4,800012a0 <_ZN5Timer4tickEv+0x84>
            current->thread->setSleeping(false);
    80001274:	00000593          	li	a1,0
    80001278:	0004b503          	ld	a0,0(s1)
    8000127c:	00002097          	auipc	ra,0x2
    80001280:	e44080e7          	jalr	-444(ra) # 800030c0 <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    80001284:	0004b503          	ld	a0,0(s1)
    80001288:	00004097          	auipc	ra,0x4
    8000128c:	9e4080e7          	jalr	-1564(ra) # 80004c6c <_ZN9Scheduler3putEP7_thread>
            threadSleepWrapper* next = current->next;
    80001290:	0104b983          	ld	s3,16(s1)
            if(current == sleepingHead){
    80001294:	00093783          	ld	a5,0(s2)
    80001298:	fa979ee3          	bne	a5,s1,80001254 <_ZN5Timer4tickEv+0x38>
    8000129c:	fb5ff06f          	j	80001250 <_ZN5Timer4tickEv+0x34>
        }else{
            break;
        }
    }
}
    800012a0:	02813083          	ld	ra,40(sp)
    800012a4:	02013403          	ld	s0,32(sp)
    800012a8:	01813483          	ld	s1,24(sp)
    800012ac:	01013903          	ld	s2,16(sp)
    800012b0:	00813983          	ld	s3,8(sp)
    800012b4:	03010113          	addi	sp,sp,48
    800012b8:	00008067          	ret

00000000800012bc <_ZN5Timer5sleepEm>:

int Timer::sleep(time_t timeToSleep){
    800012bc:	fd010113          	addi	sp,sp,-48
    800012c0:	02113423          	sd	ra,40(sp)
    800012c4:	02813023          	sd	s0,32(sp)
    800012c8:	00913c23          	sd	s1,24(sp)
    800012cc:	01213823          	sd	s2,16(sp)
    800012d0:	01313423          	sd	s3,8(sp)
    800012d4:	03010413          	addi	s0,sp,48
    800012d8:	00050493          	mv	s1,a0
    800012dc:	00058913          	mv	s2,a1
    thread_t thread = _thread::currentThread;
    800012e0:	00008797          	auipc	a5,0x8
    800012e4:	0407b783          	ld	a5,64(a5) # 80009320 <_GLOBAL_OFFSET_TABLE_+0x58>
    800012e8:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)mem_alloc(sizeof(threadSleepWrapper));
    800012ec:	01800513          	li	a0,24
    800012f0:	00000097          	auipc	ra,0x0
    800012f4:	0bc080e7          	jalr	188(ra) # 800013ac <_Z9mem_allocm>
    newSleepingThread->thread = thread;
    800012f8:	01353023          	sd	s3,0(a0)
    newSleepingThread->wakeUpTime = time + timeToSleep;
    800012fc:	0084b783          	ld	a5,8(s1)
    80001300:	012785b3          	add	a1,a5,s2
    80001304:	00b53423          	sd	a1,8(a0)
    newSleepingThread->next = 0;
    80001308:	00053823          	sd	zero,16(a0)

    if(sleepingHead == 0){
    8000130c:	0004b783          	ld	a5,0(s1)
    80001310:	04078c63          	beqz	a5,80001368 <_ZN5Timer5sleepEm+0xac>
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
    80001314:	00078693          	mv	a3,a5
    80001318:	0107b783          	ld	a5,16(a5)
    8000131c:	00078663          	beqz	a5,80001328 <_ZN5Timer5sleepEm+0x6c>
    80001320:	0087b703          	ld	a4,8(a5)
    80001324:	feb768e3          	bltu	a4,a1,80001314 <_ZN5Timer5sleepEm+0x58>
            current = current->next;
        }
        newSleepingThread->next = current->next;
    80001328:	00f53823          	sd	a5,16(a0)
        current->next = newSleepingThread;
    8000132c:	00a6b823          	sd	a0,16(a3)
    }
    thread->setSleeping(true);
    80001330:	00100593          	li	a1,1
    80001334:	00098513          	mv	a0,s3
    80001338:	00002097          	auipc	ra,0x2
    8000133c:	d88080e7          	jalr	-632(ra) # 800030c0 <_ZN7_thread11setSleepingEb>
    thread_dispatch();
    80001340:	00000097          	auipc	ra,0x0
    80001344:	164080e7          	jalr	356(ra) # 800014a4 <_Z15thread_dispatchv>
    return 0;
}
    80001348:	00000513          	li	a0,0
    8000134c:	02813083          	ld	ra,40(sp)
    80001350:	02013403          	ld	s0,32(sp)
    80001354:	01813483          	ld	s1,24(sp)
    80001358:	01013903          	ld	s2,16(sp)
    8000135c:	00813983          	ld	s3,8(sp)
    80001360:	03010113          	addi	sp,sp,48
    80001364:	00008067          	ret
        sleepingHead = newSleepingThread;
    80001368:	00a4b023          	sd	a0,0(s1)
    8000136c:	fc5ff06f          	j	80001330 <_ZN5Timer5sleepEm+0x74>

0000000080001370 <_ZN5Timer17noSleepingThreadsEv>:

bool Timer::noSleepingThreads(){
    80001370:	ff010113          	addi	sp,sp,-16
    80001374:	00813423          	sd	s0,8(sp)
    80001378:	01010413          	addi	s0,sp,16
    return sleepingHead == 0;
    8000137c:	00053503          	ld	a0,0(a0)
}
    80001380:	00153513          	seqz	a0,a0
    80001384:	00813403          	ld	s0,8(sp)
    80001388:	01010113          	addi	sp,sp,16
    8000138c:	00008067          	ret

0000000080001390 <_ZN5Timer7getTimeEv>:

time_t Timer::getTime(){
    80001390:	ff010113          	addi	sp,sp,-16
    80001394:	00813423          	sd	s0,8(sp)
    80001398:	01010413          	addi	s0,sp,16
    return time;
    8000139c:	00853503          	ld	a0,8(a0)
    800013a0:	00813403          	ld	s0,8(sp)
    800013a4:	01010113          	addi	sp,sp,16
    800013a8:	00008067          	ret

00000000800013ac <_Z9mem_allocm>:
 */

#include "syscalls_c.h"
#include "console.h"

void* mem_alloc ( size_t nSize ){
    800013ac:	ff010113          	addi	sp,sp,-16
    800013b0:	00813423          	sd	s0,8(sp)
    800013b4:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    800013b8:	03f50513          	addi	a0,a0,63
    800013bc:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    800013c0:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    800013c4:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    800013c8:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    800013cc:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    800013d0:	00813403          	ld	s0,8(sp)
    800013d4:	01010113          	addi	sp,sp,16
    800013d8:	00008067          	ret

00000000800013dc <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    800013dc:	ff010113          	addi	sp,sp,-16
    800013e0:	00813423          	sd	s0,8(sp)
    800013e4:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    800013e8:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    800013ec:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    800013f0:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    800013f4:	00050513          	mv	a0,a0
    return nResult;

}
    800013f8:	0005051b          	sext.w	a0,a0
    800013fc:	00813403          	ld	s0,8(sp)
    80001400:	01010113          	addi	sp,sp,16
    80001404:	00008067          	ret

0000000080001408 <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg ) {
    80001408:	fd010113          	addi	sp,sp,-48
    8000140c:	02113423          	sd	ra,40(sp)
    80001410:	02813023          	sd	s0,32(sp)
    80001414:	00913c23          	sd	s1,24(sp)
    80001418:	01213823          	sd	s2,16(sp)
    8000141c:	01313423          	sd	s3,8(sp)
    80001420:	03010413          	addi	s0,sp,48
    80001424:	00050493          	mv	s1,a0
    80001428:	00058913          	mv	s2,a1
    8000142c:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80001430:	00001537          	lui	a0,0x1
    80001434:	00000097          	auipc	ra,0x0
    80001438:	f78080e7          	jalr	-136(ra) # 800013ac <_Z9mem_allocm>
    /// now we move the pointer up, since SP points to the first free location, and grows down
    __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space + DEFAULT_STACK_SIZE));
    8000143c:	000017b7          	lui	a5,0x1
    80001440:	00f50533          	add	a0,a0,a5
    80001444:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    80001448:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    8000144c:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    80001450:	00048593          	mv	a1,s1
    __asm__ volatile("li a0,0x11");
    80001454:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    80001458:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    8000145c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001460:	0005051b          	sext.w	a0,a0
    80001464:	02813083          	ld	ra,40(sp)
    80001468:	02013403          	ld	s0,32(sp)
    8000146c:	01813483          	ld	s1,24(sp)
    80001470:	01013903          	ld	s2,16(sp)
    80001474:	00813983          	ld	s3,8(sp)
    80001478:	03010113          	addi	sp,sp,48
    8000147c:	00008067          	ret

0000000080001480 <_Z11thread_exitv>:

// int thread_createCPP ( thread_t*, void(*)(void*), void* );

int thread_exit (){
    80001480:	ff010113          	addi	sp,sp,-16
    80001484:	00813423          	sd	s0,8(sp)
    80001488:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    8000148c:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80001490:	00000073          	ecall
    return 0;
}
    80001494:	00000513          	li	a0,0
    80001498:	00813403          	ld	s0,8(sp)
    8000149c:	01010113          	addi	sp,sp,16
    800014a0:	00008067          	ret

00000000800014a4 <_Z15thread_dispatchv>:

void thread_dispatch () {
    800014a4:	ff010113          	addi	sp,sp,-16
    800014a8:	00813423          	sd	s0,8(sp)
    800014ac:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    800014b0:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    800014b4:	00000073          	ecall
}
    800014b8:	00813403          	ld	s0,8(sp)
    800014bc:	01010113          	addi	sp,sp,16
    800014c0:	00008067          	ret

00000000800014c4 <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    800014c4:	ff010113          	addi	sp,sp,-16
    800014c8:	00813423          	sd	s0,8(sp)
    800014cc:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    800014d0:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    800014d4:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    800014d8:	00000073          	ecall
}
    800014dc:	00813403          	ld	s0,8(sp)
    800014e0:	01010113          	addi	sp,sp,16
    800014e4:	00008067          	ret

00000000800014e8 <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    800014e8:	ff010113          	addi	sp,sp,-16
    800014ec:	00813423          	sd	s0,8(sp)
    800014f0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    800014f4:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    800014f8:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    800014fc:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001500:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001504:	0005051b          	sext.w	a0,a0
    80001508:	00813403          	ld	s0,8(sp)
    8000150c:	01010113          	addi	sp,sp,16
    80001510:	00008067          	ret

0000000080001514 <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    80001514:	ff010113          	addi	sp,sp,-16
    80001518:	00813423          	sd	s0,8(sp)
    8000151c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    80001520:	02059593          	slli	a1,a1,0x20
    80001524:	0205d593          	srli	a1,a1,0x20
    80001528:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    8000152c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    80001530:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    80001534:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001538:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    8000153c:	0005051b          	sext.w	a0,a0
    80001540:	00813403          	ld	s0,8(sp)
    80001544:	01010113          	addi	sp,sp,16
    80001548:	00008067          	ret

000000008000154c <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    8000154c:	ff010113          	addi	sp,sp,-16
    80001550:	00813423          	sd	s0,8(sp)
    80001554:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001558:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    8000155c:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    80001560:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001564:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001568:	0005051b          	sext.w	a0,a0
    8000156c:	00813403          	ld	s0,8(sp)
    80001570:	01010113          	addi	sp,sp,16
    80001574:	00008067          	ret

0000000080001578 <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    80001578:	ff010113          	addi	sp,sp,-16
    8000157c:	00813423          	sd	s0,8(sp)
    80001580:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001584:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    80001588:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    8000158c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001590:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001594:	0005051b          	sext.w	a0,a0
    80001598:	00813403          	ld	s0,8(sp)
    8000159c:	01010113          	addi	sp,sp,16
    800015a0:	00008067          	ret

00000000800015a4 <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    800015a4:	ff010113          	addi	sp,sp,-16
    800015a8:	00813423          	sd	s0,8(sp)
    800015ac:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800015b0:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    800015b4:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    800015b8:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800015bc:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800015c0:	0005051b          	sext.w	a0,a0
    800015c4:	00813403          	ld	s0,8(sp)
    800015c8:	01010113          	addi	sp,sp,16
    800015cc:	00008067          	ret

00000000800015d0 <_Z4getcv>:

char getc() {
    800015d0:	ff010113          	addi	sp,sp,-16
    800015d4:	00813423          	sd	s0,8(sp)
    800015d8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    800015dc:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    800015e0:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    800015e4:	00050513          	mv	a0,a0
    return chr;
}
    800015e8:	0ff57513          	andi	a0,a0,255
    800015ec:	00813403          	ld	s0,8(sp)
    800015f0:	01010113          	addi	sp,sp,16
    800015f4:	00008067          	ret

00000000800015f8 <_Z4putcc>:

#include "console.h"

void putc(char chr ) {
    800015f8:	ff010113          	addi	sp,sp,-16
    800015fc:	00813423          	sd	s0,8(sp)
    80001600:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    80001604:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    80001608:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    8000160c:	00000073          	ecall
    80001610:	00813403          	ld	s0,8(sp)
    80001614:	01010113          	addi	sp,sp,16
    80001618:	00008067          	ret

000000008000161c <_ZN4_sem4openEPPS_j>:
#include "syscalls_c.h"
#include "assert.h"
#include "sched.h"
#include "console.h"

void _sem::open(_sem** handle, unsigned init){
    8000161c:	fe010113          	addi	sp,sp,-32
    80001620:	00113c23          	sd	ra,24(sp)
    80001624:	00813823          	sd	s0,16(sp)
    80001628:	00913423          	sd	s1,8(sp)
    8000162c:	01213023          	sd	s2,0(sp)
    80001630:	02010413          	addi	s0,sp,32
    80001634:	00050493          	mv	s1,a0
    80001638:	00058913          	mv	s2,a1
    (*handle) = (sem_t)mem_alloc(sizeof(_sem));
    8000163c:	01800513          	li	a0,24
    80001640:	00000097          	auipc	ra,0x0
    80001644:	d6c080e7          	jalr	-660(ra) # 800013ac <_Z9mem_allocm>
    80001648:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    8000164c:	00053023          	sd	zero,0(a0) # 1000 <_entry-0x7ffff000>
    (*handle)->blockTail = 0;
    80001650:	0004b783          	ld	a5,0(s1)
    80001654:	0007b423          	sd	zero,8(a5) # 1008 <_entry-0x7fffeff8>
    (*handle)->value = init;
    80001658:	0004b783          	ld	a5,0(s1)
    8000165c:	0127a823          	sw	s2,16(a5)
}
    80001660:	01813083          	ld	ra,24(sp)
    80001664:	01013403          	ld	s0,16(sp)
    80001668:	00813483          	ld	s1,8(sp)
    8000166c:	00013903          	ld	s2,0(sp)
    80001670:	02010113          	addi	sp,sp,32
    80001674:	00008067          	ret

0000000080001678 <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    80001678:	fe010113          	addi	sp,sp,-32
    8000167c:	00113c23          	sd	ra,24(sp)
    80001680:	00813823          	sd	s0,16(sp)
    80001684:	00913423          	sd	s1,8(sp)
    80001688:	02010413          	addi	s0,sp,32
    8000168c:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    80001690:	0004b783          	ld	a5,0(s1)
    80001694:	02078863          	beqz	a5,800016c4 <_ZN4_sem5closeEPS_+0x4c>
        id->blockHead->pThread->setClosed(true);
    80001698:	00100593          	li	a1,1
    8000169c:	0007b503          	ld	a0,0(a5)
    800016a0:	00002097          	auipc	ra,0x2
    800016a4:	9f4080e7          	jalr	-1548(ra) # 80003094 <_ZN7_thread9setClosedEb>
        mem_free(id->blockHead);
    800016a8:	0004b503          	ld	a0,0(s1)
    800016ac:	00000097          	auipc	ra,0x0
    800016b0:	d30080e7          	jalr	-720(ra) # 800013dc <_Z8mem_freePv>
        id->blockHead = id->blockHead->pNext;
    800016b4:	0004b783          	ld	a5,0(s1)
    800016b8:	0087b783          	ld	a5,8(a5)
    800016bc:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    800016c0:	fd1ff06f          	j	80001690 <_ZN4_sem5closeEPS_+0x18>
    }
}
    800016c4:	01813083          	ld	ra,24(sp)
    800016c8:	01013403          	ld	s0,16(sp)
    800016cc:	00813483          	ld	s1,8(sp)
    800016d0:	02010113          	addi	sp,sp,32
    800016d4:	00008067          	ret

00000000800016d8 <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    800016d8:	01052783          	lw	a5,16(a0)
    800016dc:	fff7879b          	addiw	a5,a5,-1
    800016e0:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    800016e4:	02079713          	slli	a4,a5,0x20
    800016e8:	00074463          	bltz	a4,800016f0 <_ZN4_sem4waitEPS_+0x18>
    800016ec:	00008067          	ret
void _sem::wait(sem_t id){
    800016f0:	fe010113          	addi	sp,sp,-32
    800016f4:	00113c23          	sd	ra,24(sp)
    800016f8:	00813823          	sd	s0,16(sp)
    800016fc:	00913423          	sd	s1,8(sp)
    80001700:	02010413          	addi	s0,sp,32
    80001704:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    80001708:	01000513          	li	a0,16
    8000170c:	00000097          	auipc	ra,0x0
    80001710:	ca0080e7          	jalr	-864(ra) # 800013ac <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    80001714:	00008797          	auipc	a5,0x8
    80001718:	c0c7b783          	ld	a5,-1012(a5) # 80009320 <_GLOBAL_OFFSET_TABLE_+0x58>
    8000171c:	0007b783          	ld	a5,0(a5)
    80001720:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    80001724:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    80001728:	0004b783          	ld	a5,0(s1)
    8000172c:	04078263          	beqz	a5,80001770 <_ZN4_sem4waitEPS_+0x98>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    80001730:	0084b783          	ld	a5,8(s1)
    80001734:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    80001738:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    8000173c:	00100593          	li	a1,1
    80001740:	00008797          	auipc	a5,0x8
    80001744:	be07b783          	ld	a5,-1056(a5) # 80009320 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001748:	0007b503          	ld	a0,0(a5)
    8000174c:	00002097          	auipc	ra,0x2
    80001750:	918080e7          	jalr	-1768(ra) # 80003064 <_ZN7_thread10setBlockedEb>
        thread_dispatch();
    80001754:	00000097          	auipc	ra,0x0
    80001758:	d50080e7          	jalr	-688(ra) # 800014a4 <_Z15thread_dispatchv>
    }
}
    8000175c:	01813083          	ld	ra,24(sp)
    80001760:	01013403          	ld	s0,16(sp)
    80001764:	00813483          	ld	s1,8(sp)
    80001768:	02010113          	addi	sp,sp,32
    8000176c:	00008067          	ret
            id->blockHead = pNewBlock;
    80001770:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    80001774:	00a4b423          	sd	a0,8(s1)
    80001778:	fc5ff06f          	j	8000173c <_ZN4_sem4waitEPS_+0x64>

000000008000177c <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    8000177c:	01052783          	lw	a5,16(a0)
    80001780:	0017879b          	addiw	a5,a5,1
    80001784:	0007871b          	sext.w	a4,a5
    80001788:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    8000178c:	00e05463          	blez	a4,80001794 <_ZN4_sem6signalEPS_+0x18>
    80001790:	00008067          	ret
void _sem::signal(sem_t id){
    80001794:	fe010113          	addi	sp,sp,-32
    80001798:	00113c23          	sd	ra,24(sp)
    8000179c:	00813823          	sd	s0,16(sp)
    800017a0:	00913423          	sd	s1,8(sp)
    800017a4:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    800017a8:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    800017ac:	0084b783          	ld	a5,8(s1)
    800017b0:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    800017b4:	04078063          	beqz	a5,800017f4 <_ZN4_sem6signalEPS_+0x78>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    800017b8:	00000593          	li	a1,0
    800017bc:	0004b503          	ld	a0,0(s1)
    800017c0:	00002097          	auipc	ra,0x2
    800017c4:	8a4080e7          	jalr	-1884(ra) # 80003064 <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    800017c8:	00048513          	mv	a0,s1
    800017cc:	00000097          	auipc	ra,0x0
    800017d0:	c10080e7          	jalr	-1008(ra) # 800013dc <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    800017d4:	0004b503          	ld	a0,0(s1)
    800017d8:	00003097          	auipc	ra,0x3
    800017dc:	494080e7          	jalr	1172(ra) # 80004c6c <_ZN9Scheduler3putEP7_thread>
    }
    800017e0:	01813083          	ld	ra,24(sp)
    800017e4:	01013403          	ld	s0,16(sp)
    800017e8:	00813483          	ld	s1,8(sp)
    800017ec:	02010113          	addi	sp,sp,32
    800017f0:	00008067          	ret
            id->blockTail = 0;
    800017f4:	00053423          	sd	zero,8(a0)
    800017f8:	fc1ff06f          	j	800017b8 <_ZN4_sem6signalEPS_+0x3c>

00000000800017fc <main>:
#include "assert.h"
#include "syscalls_c.h"
#include "console.h"

/// @brief first function to be called
void main(){
    800017fc:	eb010113          	addi	sp,sp,-336
    80001800:	14113423          	sd	ra,328(sp)
    80001804:	14813023          	sd	s0,320(sp)
    80001808:	12913c23          	sd	s1,312(sp)
    8000180c:	15010413          	addi	s0,sp,336
    Kernel kernel = Kernel();
    80001810:	eb040493          	addi	s1,s0,-336
    80001814:	00048513          	mv	a0,s1
    80001818:	00001097          	auipc	ra,0x1
    8000181c:	940080e7          	jalr	-1728(ra) # 80002158 <_ZN6KernelC1Ev>
    kernel.initialise();
    80001820:	00048513          	mv	a0,s1
    80001824:	00001097          	auipc	ra,0x1
    80001828:	a24080e7          	jalr	-1500(ra) # 80002248 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    8000182c:	00048513          	mv	a0,s1
    80001830:	00001097          	auipc	ra,0x1
    80001834:	b30080e7          	jalr	-1232(ra) # 80002360 <_ZN6Kernel3runEv>
    80001838:	00050493          	mv	s1,a0
    putc('\n');
    8000183c:	00a00513          	li	a0,10
    80001840:	00000097          	auipc	ra,0x0
    80001844:	db8080e7          	jalr	-584(ra) # 800015f8 <_Z4putcc>
    putc('-');
    80001848:	02d00513          	li	a0,45
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	dac080e7          	jalr	-596(ra) # 800015f8 <_Z4putcc>
    putc('-');
    80001854:	02d00513          	li	a0,45
    80001858:	00000097          	auipc	ra,0x0
    8000185c:	da0080e7          	jalr	-608(ra) # 800015f8 <_Z4putcc>
    putc('-');
    80001860:	02d00513          	li	a0,45
    80001864:	00000097          	auipc	ra,0x0
    80001868:	d94080e7          	jalr	-620(ra) # 800015f8 <_Z4putcc>
    putc('-');
    8000186c:	02d00513          	li	a0,45
    80001870:	00000097          	auipc	ra,0x0
    80001874:	d88080e7          	jalr	-632(ra) # 800015f8 <_Z4putcc>
    putc('-');
    80001878:	02d00513          	li	a0,45
    8000187c:	00000097          	auipc	ra,0x0
    80001880:	d7c080e7          	jalr	-644(ra) # 800015f8 <_Z4putcc>
    putc('-');
    80001884:	02d00513          	li	a0,45
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	d70080e7          	jalr	-656(ra) # 800015f8 <_Z4putcc>
    putc('-');
    80001890:	02d00513          	li	a0,45
    80001894:	00000097          	auipc	ra,0x0
    80001898:	d64080e7          	jalr	-668(ra) # 800015f8 <_Z4putcc>
    putc('-');
    8000189c:	02d00513          	li	a0,45
    800018a0:	00000097          	auipc	ra,0x0
    800018a4:	d58080e7          	jalr	-680(ra) # 800015f8 <_Z4putcc>
    putc('-');
    800018a8:	02d00513          	li	a0,45
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	d4c080e7          	jalr	-692(ra) # 800015f8 <_Z4putcc>
    putc('-');
    800018b4:	02d00513          	li	a0,45
    800018b8:	00000097          	auipc	ra,0x0
    800018bc:	d40080e7          	jalr	-704(ra) # 800015f8 <_Z4putcc>
    putc('-');
    800018c0:	02d00513          	li	a0,45
    800018c4:	00000097          	auipc	ra,0x0
    800018c8:	d34080e7          	jalr	-716(ra) # 800015f8 <_Z4putcc>
    putc('-');
    800018cc:	02d00513          	li	a0,45
    800018d0:	00000097          	auipc	ra,0x0
    800018d4:	d28080e7          	jalr	-728(ra) # 800015f8 <_Z4putcc>
    putc('-');
    800018d8:	02d00513          	li	a0,45
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	d1c080e7          	jalr	-740(ra) # 800015f8 <_Z4putcc>
    putc('-');
    800018e4:	02d00513          	li	a0,45
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	d10080e7          	jalr	-752(ra) # 800015f8 <_Z4putcc>
    putc('-');
    800018f0:	02d00513          	li	a0,45
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	d04080e7          	jalr	-764(ra) # 800015f8 <_Z4putcc>
    putc('-');
    800018fc:	02d00513          	li	a0,45
    80001900:	00000097          	auipc	ra,0x0
    80001904:	cf8080e7          	jalr	-776(ra) # 800015f8 <_Z4putcc>
    putc('-');
    80001908:	02d00513          	li	a0,45
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	cec080e7          	jalr	-788(ra) # 800015f8 <_Z4putcc>
    putc('-');
    80001914:	02d00513          	li	a0,45
    80001918:	00000097          	auipc	ra,0x0
    8000191c:	ce0080e7          	jalr	-800(ra) # 800015f8 <_Z4putcc>
    putc('-');
    80001920:	02d00513          	li	a0,45
    80001924:	00000097          	auipc	ra,0x0
    80001928:	cd4080e7          	jalr	-812(ra) # 800015f8 <_Z4putcc>
    putc('-');
    8000192c:	02d00513          	li	a0,45
    80001930:	00000097          	auipc	ra,0x0
    80001934:	cc8080e7          	jalr	-824(ra) # 800015f8 <_Z4putcc>
    putc('\n');
    80001938:	00a00513          	li	a0,10
    8000193c:	00000097          	auipc	ra,0x0
    80001940:	cbc080e7          	jalr	-836(ra) # 800015f8 <_Z4putcc>
    putc('\n');
    80001944:	00a00513          	li	a0,10
    80001948:	00000097          	auipc	ra,0x0
    8000194c:	cb0080e7          	jalr	-848(ra) # 800015f8 <_Z4putcc>
    putc('K');
    80001950:	04b00513          	li	a0,75
    80001954:	00000097          	auipc	ra,0x0
    80001958:	ca4080e7          	jalr	-860(ra) # 800015f8 <_Z4putcc>
    putc('e');
    8000195c:	06500513          	li	a0,101
    80001960:	00000097          	auipc	ra,0x0
    80001964:	c98080e7          	jalr	-872(ra) # 800015f8 <_Z4putcc>
    putc('r');
    80001968:	07200513          	li	a0,114
    8000196c:	00000097          	auipc	ra,0x0
    80001970:	c8c080e7          	jalr	-884(ra) # 800015f8 <_Z4putcc>
    putc('n');
    80001974:	06e00513          	li	a0,110
    80001978:	00000097          	auipc	ra,0x0
    8000197c:	c80080e7          	jalr	-896(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80001980:	06500513          	li	a0,101
    80001984:	00000097          	auipc	ra,0x0
    80001988:	c74080e7          	jalr	-908(ra) # 800015f8 <_Z4putcc>
    putc('l');
    8000198c:	06c00513          	li	a0,108
    80001990:	00000097          	auipc	ra,0x0
    80001994:	c68080e7          	jalr	-920(ra) # 800015f8 <_Z4putcc>
    putc(' ');
    80001998:	02000513          	li	a0,32
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	c5c080e7          	jalr	-932(ra) # 800015f8 <_Z4putcc>
    putc('e');
    800019a4:	06500513          	li	a0,101
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	c50080e7          	jalr	-944(ra) # 800015f8 <_Z4putcc>
    putc('x');
    800019b0:	07800513          	li	a0,120
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	c44080e7          	jalr	-956(ra) # 800015f8 <_Z4putcc>
    putc('i');
    800019bc:	06900513          	li	a0,105
    800019c0:	00000097          	auipc	ra,0x0
    800019c4:	c38080e7          	jalr	-968(ra) # 800015f8 <_Z4putcc>
    putc('t');
    800019c8:	07400513          	li	a0,116
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	c2c080e7          	jalr	-980(ra) # 800015f8 <_Z4putcc>
    putc('e');
    800019d4:	06500513          	li	a0,101
    800019d8:	00000097          	auipc	ra,0x0
    800019dc:	c20080e7          	jalr	-992(ra) # 800015f8 <_Z4putcc>
    putc('d');
    800019e0:	06400513          	li	a0,100
    800019e4:	00000097          	auipc	ra,0x0
    800019e8:	c14080e7          	jalr	-1004(ra) # 800015f8 <_Z4putcc>
    putc(' ');
    800019ec:	02000513          	li	a0,32
    800019f0:	00000097          	auipc	ra,0x0
    800019f4:	c08080e7          	jalr	-1016(ra) # 800015f8 <_Z4putcc>
    putc('w');
    800019f8:	07700513          	li	a0,119
    800019fc:	00000097          	auipc	ra,0x0
    80001a00:	bfc080e7          	jalr	-1028(ra) # 800015f8 <_Z4putcc>
    putc('i');
    80001a04:	06900513          	li	a0,105
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	bf0080e7          	jalr	-1040(ra) # 800015f8 <_Z4putcc>
    putc('t');
    80001a10:	07400513          	li	a0,116
    80001a14:	00000097          	auipc	ra,0x0
    80001a18:	be4080e7          	jalr	-1052(ra) # 800015f8 <_Z4putcc>
    putc('h');
    80001a1c:	06800513          	li	a0,104
    80001a20:	00000097          	auipc	ra,0x0
    80001a24:	bd8080e7          	jalr	-1064(ra) # 800015f8 <_Z4putcc>
    putc(' ');
    80001a28:	02000513          	li	a0,32
    80001a2c:	00000097          	auipc	ra,0x0
    80001a30:	bcc080e7          	jalr	-1076(ra) # 800015f8 <_Z4putcc>
    putc('c');
    80001a34:	06300513          	li	a0,99
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	bc0080e7          	jalr	-1088(ra) # 800015f8 <_Z4putcc>
    putc('o');
    80001a40:	06f00513          	li	a0,111
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	bb4080e7          	jalr	-1100(ra) # 800015f8 <_Z4putcc>
    putc('d');
    80001a4c:	06400513          	li	a0,100
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	ba8080e7          	jalr	-1112(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80001a58:	06500513          	li	a0,101
    80001a5c:	00000097          	auipc	ra,0x0
    80001a60:	b9c080e7          	jalr	-1124(ra) # 800015f8 <_Z4putcc>
    putc(':');
    80001a64:	03a00513          	li	a0,58
    80001a68:	00000097          	auipc	ra,0x0
    80001a6c:	b90080e7          	jalr	-1136(ra) # 800015f8 <_Z4putcc>
    switch(exitCode){
    80001a70:	00048e63          	beqz	s1,80001a8c <main+0x290>
    80001a74:	00100793          	li	a5,1
    80001a78:	02f48263          	beq	s1,a5,80001a9c <main+0x2a0>
            break;
        case Kernel::EXIT_FAILURE:
            putc('1');
            break;
        default:
            putc('2');
    80001a7c:	03200513          	li	a0,50
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	b78080e7          	jalr	-1160(ra) # 800015f8 <_Z4putcc>
    80001a88:	0200006f          	j	80001aa8 <main+0x2ac>
            putc('0');
    80001a8c:	03000513          	li	a0,48
    80001a90:	00000097          	auipc	ra,0x0
    80001a94:	b68080e7          	jalr	-1176(ra) # 800015f8 <_Z4putcc>
    80001a98:	0100006f          	j	80001aa8 <main+0x2ac>
            putc('1');
    80001a9c:	03100513          	li	a0,49
    80001aa0:	00000097          	auipc	ra,0x0
    80001aa4:	b58080e7          	jalr	-1192(ra) # 800015f8 <_Z4putcc>
            break;
    }
    putc('\n');
    80001aa8:	00a00513          	li	a0,10
    80001aac:	00000097          	auipc	ra,0x0
    80001ab0:	b4c080e7          	jalr	-1204(ra) # 800015f8 <_Z4putcc>
    Console::outputHandler();
    80001ab4:	00000097          	auipc	ra,0x0
    80001ab8:	568080e7          	jalr	1384(ra) # 8000201c <_ZN7Console13outputHandlerEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001abc:	02049863          	bnez	s1,80001aec <main+0x2f0>
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    80001ac0:	ec840513          	addi	a0,s0,-312
    80001ac4:	fffff097          	auipc	ra,0xfffff
    80001ac8:	6ac080e7          	jalr	1708(ra) # 80001170 <_ZN5TimerD1Ev>
    80001acc:	eb040513          	addi	a0,s0,-336
    80001ad0:	00001097          	auipc	ra,0x1
    80001ad4:	7c8080e7          	jalr	1992(ra) # 80003298 <_ZN11HeapManagerD1Ev>
    80001ad8:	14813083          	ld	ra,328(sp)
    80001adc:	14013403          	ld	s0,320(sp)
    80001ae0:	13813483          	ld	s1,312(sp)
    80001ae4:	15010113          	addi	sp,sp,336
    80001ae8:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001aec:	00006697          	auipc	a3,0x6
    80001af0:	59c68693          	addi	a3,a3,1436 # 80008088 <CONSOLE_STATUS+0x78>
    80001af4:	05200613          	li	a2,82
    80001af8:	00006597          	auipc	a1,0x6
    80001afc:	5a058593          	addi	a1,a1,1440 # 80008098 <CONSOLE_STATUS+0x88>
    80001b00:	00006517          	auipc	a0,0x6
    80001b04:	5a850513          	addi	a0,a0,1448 # 800080a8 <CONSOLE_STATUS+0x98>
    80001b08:	00000097          	auipc	ra,0x0
    80001b0c:	034080e7          	jalr	52(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    80001b10:	fb1ff06f          	j	80001ac0 <main+0x2c4>
    80001b14:	00050493          	mv	s1,a0
    80001b18:	ec840513          	addi	a0,s0,-312
    80001b1c:	fffff097          	auipc	ra,0xfffff
    80001b20:	654080e7          	jalr	1620(ra) # 80001170 <_ZN5TimerD1Ev>
    80001b24:	eb040513          	addi	a0,s0,-336
    80001b28:	00001097          	auipc	ra,0x1
    80001b2c:	770080e7          	jalr	1904(ra) # 80003298 <_ZN11HeapManagerD1Ev>
    80001b30:	00048513          	mv	a0,s1
    80001b34:	00009097          	auipc	ra,0x9
    80001b38:	944080e7          	jalr	-1724(ra) # 8000a478 <_Unwind_Resume>

0000000080001b3c <_Z13assert_failedPKcS0_jS0_>:
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    80001b3c:	fb010113          	addi	sp,sp,-80
    80001b40:	04113423          	sd	ra,72(sp)
    80001b44:	04813023          	sd	s0,64(sp)
    80001b48:	02913c23          	sd	s1,56(sp)
    80001b4c:	03213823          	sd	s2,48(sp)
    80001b50:	03313423          	sd	s3,40(sp)
    80001b54:	03413023          	sd	s4,32(sp)
    80001b58:	05010413          	addi	s0,sp,80
    80001b5c:	00050993          	mv	s3,a0
    80001b60:	00058493          	mv	s1,a1
    80001b64:	00060913          	mv	s2,a2
    80001b68:	00068a13          	mv	s4,a3
    putc('\n');
    80001b6c:	00a00513          	li	a0,10
    80001b70:	00000097          	auipc	ra,0x0
    80001b74:	a88080e7          	jalr	-1400(ra) # 800015f8 <_Z4putcc>
    putc('A');
    80001b78:	04100513          	li	a0,65
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	a7c080e7          	jalr	-1412(ra) # 800015f8 <_Z4putcc>
    putc('s');
    80001b84:	07300513          	li	a0,115
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	a70080e7          	jalr	-1424(ra) # 800015f8 <_Z4putcc>
    putc('s');
    80001b90:	07300513          	li	a0,115
    80001b94:	00000097          	auipc	ra,0x0
    80001b98:	a64080e7          	jalr	-1436(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80001b9c:	06500513          	li	a0,101
    80001ba0:	00000097          	auipc	ra,0x0
    80001ba4:	a58080e7          	jalr	-1448(ra) # 800015f8 <_Z4putcc>
    putc('r');
    80001ba8:	07200513          	li	a0,114
    80001bac:	00000097          	auipc	ra,0x0
    80001bb0:	a4c080e7          	jalr	-1460(ra) # 800015f8 <_Z4putcc>
    putc('t');
    80001bb4:	07400513          	li	a0,116
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	a40080e7          	jalr	-1472(ra) # 800015f8 <_Z4putcc>
    putc('i');
    80001bc0:	06900513          	li	a0,105
    80001bc4:	00000097          	auipc	ra,0x0
    80001bc8:	a34080e7          	jalr	-1484(ra) # 800015f8 <_Z4putcc>
    putc('o');
    80001bcc:	06f00513          	li	a0,111
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	a28080e7          	jalr	-1496(ra) # 800015f8 <_Z4putcc>
    putc('n');
    80001bd8:	06e00513          	li	a0,110
    80001bdc:	00000097          	auipc	ra,0x0
    80001be0:	a1c080e7          	jalr	-1508(ra) # 800015f8 <_Z4putcc>
    putc(' ');
    80001be4:	02000513          	li	a0,32
    80001be8:	00000097          	auipc	ra,0x0
    80001bec:	a10080e7          	jalr	-1520(ra) # 800015f8 <_Z4putcc>
    putc('\'');
    80001bf0:	02700513          	li	a0,39
    80001bf4:	00000097          	auipc	ra,0x0
    80001bf8:	a04080e7          	jalr	-1532(ra) # 800015f8 <_Z4putcc>
    while(*__assertion != 0){
    80001bfc:	0009c503          	lbu	a0,0(s3)
    80001c00:	00050a63          	beqz	a0,80001c14 <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    80001c04:	00000097          	auipc	ra,0x0
    80001c08:	9f4080e7          	jalr	-1548(ra) # 800015f8 <_Z4putcc>
        __assertion++;
    80001c0c:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    80001c10:	fedff06f          	j	80001bfc <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    80001c14:	02700513          	li	a0,39
    80001c18:	00000097          	auipc	ra,0x0
    80001c1c:	9e0080e7          	jalr	-1568(ra) # 800015f8 <_Z4putcc>
    putc(' ');
    80001c20:	02000513          	li	a0,32
    80001c24:	00000097          	auipc	ra,0x0
    80001c28:	9d4080e7          	jalr	-1580(ra) # 800015f8 <_Z4putcc>
    putc('f');
    80001c2c:	06600513          	li	a0,102
    80001c30:	00000097          	auipc	ra,0x0
    80001c34:	9c8080e7          	jalr	-1592(ra) # 800015f8 <_Z4putcc>
    putc('a');
    80001c38:	06100513          	li	a0,97
    80001c3c:	00000097          	auipc	ra,0x0
    80001c40:	9bc080e7          	jalr	-1604(ra) # 800015f8 <_Z4putcc>
    putc('i');
    80001c44:	06900513          	li	a0,105
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	9b0080e7          	jalr	-1616(ra) # 800015f8 <_Z4putcc>
    putc('l');
    80001c50:	06c00513          	li	a0,108
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	9a4080e7          	jalr	-1628(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80001c5c:	06500513          	li	a0,101
    80001c60:	00000097          	auipc	ra,0x0
    80001c64:	998080e7          	jalr	-1640(ra) # 800015f8 <_Z4putcc>
    putc('d');
    80001c68:	06400513          	li	a0,100
    80001c6c:	00000097          	auipc	ra,0x0
    80001c70:	98c080e7          	jalr	-1652(ra) # 800015f8 <_Z4putcc>
    putc(' ');
    80001c74:	02000513          	li	a0,32
    80001c78:	00000097          	auipc	ra,0x0
    80001c7c:	980080e7          	jalr	-1664(ra) # 800015f8 <_Z4putcc>
    putc('i');
    80001c80:	06900513          	li	a0,105
    80001c84:	00000097          	auipc	ra,0x0
    80001c88:	974080e7          	jalr	-1676(ra) # 800015f8 <_Z4putcc>
    putc('n');
    80001c8c:	06e00513          	li	a0,110
    80001c90:	00000097          	auipc	ra,0x0
    80001c94:	968080e7          	jalr	-1688(ra) # 800015f8 <_Z4putcc>
    putc(' ');
    80001c98:	02000513          	li	a0,32
    80001c9c:	00000097          	auipc	ra,0x0
    80001ca0:	95c080e7          	jalr	-1700(ra) # 800015f8 <_Z4putcc>
    putc('f');
    80001ca4:	06600513          	li	a0,102
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	950080e7          	jalr	-1712(ra) # 800015f8 <_Z4putcc>
    putc('i');
    80001cb0:	06900513          	li	a0,105
    80001cb4:	00000097          	auipc	ra,0x0
    80001cb8:	944080e7          	jalr	-1724(ra) # 800015f8 <_Z4putcc>
    putc('l');
    80001cbc:	06c00513          	li	a0,108
    80001cc0:	00000097          	auipc	ra,0x0
    80001cc4:	938080e7          	jalr	-1736(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80001cc8:	06500513          	li	a0,101
    80001ccc:	00000097          	auipc	ra,0x0
    80001cd0:	92c080e7          	jalr	-1748(ra) # 800015f8 <_Z4putcc>
    putc(':');
    80001cd4:	03a00513          	li	a0,58
    80001cd8:	00000097          	auipc	ra,0x0
    80001cdc:	920080e7          	jalr	-1760(ra) # 800015f8 <_Z4putcc>
    putc(' ');
    80001ce0:	02000513          	li	a0,32
    80001ce4:	00000097          	auipc	ra,0x0
    80001ce8:	914080e7          	jalr	-1772(ra) # 800015f8 <_Z4putcc>
    while(*__file != 0){
    80001cec:	0004c503          	lbu	a0,0(s1)
    80001cf0:	00050a63          	beqz	a0,80001d04 <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    80001cf4:	00000097          	auipc	ra,0x0
    80001cf8:	904080e7          	jalr	-1788(ra) # 800015f8 <_Z4putcc>
        __file++;
    80001cfc:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80001d00:	fedff06f          	j	80001cec <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    80001d04:	00a00513          	li	a0,10
    80001d08:	00000097          	auipc	ra,0x0
    80001d0c:	8f0080e7          	jalr	-1808(ra) # 800015f8 <_Z4putcc>
    putc('l');
    80001d10:	06c00513          	li	a0,108
    80001d14:	00000097          	auipc	ra,0x0
    80001d18:	8e4080e7          	jalr	-1820(ra) # 800015f8 <_Z4putcc>
    putc('i');
    80001d1c:	06900513          	li	a0,105
    80001d20:	00000097          	auipc	ra,0x0
    80001d24:	8d8080e7          	jalr	-1832(ra) # 800015f8 <_Z4putcc>
    putc('n');
    80001d28:	06e00513          	li	a0,110
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	8cc080e7          	jalr	-1844(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80001d34:	06500513          	li	a0,101
    80001d38:	00000097          	auipc	ra,0x0
    80001d3c:	8c0080e7          	jalr	-1856(ra) # 800015f8 <_Z4putcc>
    putc(':');
    80001d40:	03a00513          	li	a0,58
    80001d44:	00000097          	auipc	ra,0x0
    80001d48:	8b4080e7          	jalr	-1868(ra) # 800015f8 <_Z4putcc>
    putc(' ');
    80001d4c:	02000513          	li	a0,32
    80001d50:	00000097          	auipc	ra,0x0
    80001d54:	8a8080e7          	jalr	-1880(ra) # 800015f8 <_Z4putcc>
    char buffer[20];
    int i = 0;
    80001d58:	00000493          	li	s1,0
    while(__line != 0){
    80001d5c:	02090463          	beqz	s2,80001d84 <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80001d60:	00a00713          	li	a4,10
    80001d64:	02e977bb          	remuw	a5,s2,a4
    80001d68:	0307879b          	addiw	a5,a5,48
    80001d6c:	fd040693          	addi	a3,s0,-48
    80001d70:	009686b3          	add	a3,a3,s1
    80001d74:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    80001d78:	02e9593b          	divuw	s2,s2,a4
        i++;
    80001d7c:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    80001d80:	fddff06f          	j	80001d5c <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    80001d84:	02048063          	beqz	s1,80001da4 <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    80001d88:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80001d8c:	fd040793          	addi	a5,s0,-48
    80001d90:	009787b3          	add	a5,a5,s1
    80001d94:	fe87c503          	lbu	a0,-24(a5)
    80001d98:	00000097          	auipc	ra,0x0
    80001d9c:	860080e7          	jalr	-1952(ra) # 800015f8 <_Z4putcc>
    80001da0:	fe5ff06f          	j	80001d84 <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80001da4:	00a00513          	li	a0,10
    80001da8:	00000097          	auipc	ra,0x0
    80001dac:	850080e7          	jalr	-1968(ra) # 800015f8 <_Z4putcc>
    putc('f');
    80001db0:	06600513          	li	a0,102
    80001db4:	00000097          	auipc	ra,0x0
    80001db8:	844080e7          	jalr	-1980(ra) # 800015f8 <_Z4putcc>
    putc('u');
    80001dbc:	07500513          	li	a0,117
    80001dc0:	00000097          	auipc	ra,0x0
    80001dc4:	838080e7          	jalr	-1992(ra) # 800015f8 <_Z4putcc>
    putc('n');
    80001dc8:	06e00513          	li	a0,110
    80001dcc:	00000097          	auipc	ra,0x0
    80001dd0:	82c080e7          	jalr	-2004(ra) # 800015f8 <_Z4putcc>
    putc('c');
    80001dd4:	06300513          	li	a0,99
    80001dd8:	00000097          	auipc	ra,0x0
    80001ddc:	820080e7          	jalr	-2016(ra) # 800015f8 <_Z4putcc>
    putc('t');
    80001de0:	07400513          	li	a0,116
    80001de4:	00000097          	auipc	ra,0x0
    80001de8:	814080e7          	jalr	-2028(ra) # 800015f8 <_Z4putcc>
    putc('i');
    80001dec:	06900513          	li	a0,105
    80001df0:	00000097          	auipc	ra,0x0
    80001df4:	808080e7          	jalr	-2040(ra) # 800015f8 <_Z4putcc>
    putc('o');
    80001df8:	06f00513          	li	a0,111
    80001dfc:	fffff097          	auipc	ra,0xfffff
    80001e00:	7fc080e7          	jalr	2044(ra) # 800015f8 <_Z4putcc>
    putc('n');
    80001e04:	06e00513          	li	a0,110
    80001e08:	fffff097          	auipc	ra,0xfffff
    80001e0c:	7f0080e7          	jalr	2032(ra) # 800015f8 <_Z4putcc>
    putc(':');
    80001e10:	03a00513          	li	a0,58
    80001e14:	fffff097          	auipc	ra,0xfffff
    80001e18:	7e4080e7          	jalr	2020(ra) # 800015f8 <_Z4putcc>
    putc(' ');
    80001e1c:	02000513          	li	a0,32
    80001e20:	fffff097          	auipc	ra,0xfffff
    80001e24:	7d8080e7          	jalr	2008(ra) # 800015f8 <_Z4putcc>
    putc('\'');
    80001e28:	02700513          	li	a0,39
    80001e2c:	fffff097          	auipc	ra,0xfffff
    80001e30:	7cc080e7          	jalr	1996(ra) # 800015f8 <_Z4putcc>
    while(*__function != 0){
    80001e34:	000a4503          	lbu	a0,0(s4)
    80001e38:	00050a63          	beqz	a0,80001e4c <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    80001e3c:	fffff097          	auipc	ra,0xfffff
    80001e40:	7bc080e7          	jalr	1980(ra) # 800015f8 <_Z4putcc>
        __function ++;
    80001e44:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80001e48:	fedff06f          	j	80001e34 <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    80001e4c:	02700513          	li	a0,39
    80001e50:	fffff097          	auipc	ra,0xfffff
    80001e54:	7a8080e7          	jalr	1960(ra) # 800015f8 <_Z4putcc>
    putc('\n');
    80001e58:	00a00513          	li	a0,10
    80001e5c:	fffff097          	auipc	ra,0xfffff
    80001e60:	79c080e7          	jalr	1948(ra) # 800015f8 <_Z4putcc>
    while(1);
    80001e64:	0000006f          	j	80001e64 <_Z13assert_failedPKcS0_jS0_+0x328>

0000000080001e68 <_ZN7Console11getInstanceEv>:

Console* Console::instance = 0;


Console& Console::getInstance(){
    assert(instance != 0);
    80001e68:	00007797          	auipc	a5,0x7
    80001e6c:	5107b783          	ld	a5,1296(a5) # 80009378 <_ZN7Console8instanceE>
    80001e70:	00078863          	beqz	a5,80001e80 <_ZN7Console11getInstanceEv+0x18>
    return *instance;
}
    80001e74:	00007517          	auipc	a0,0x7
    80001e78:	50453503          	ld	a0,1284(a0) # 80009378 <_ZN7Console8instanceE>
    80001e7c:	00008067          	ret
Console& Console::getInstance(){
    80001e80:	ff010113          	addi	sp,sp,-16
    80001e84:	00113423          	sd	ra,8(sp)
    80001e88:	00813023          	sd	s0,0(sp)
    80001e8c:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80001e90:	00006697          	auipc	a3,0x6
    80001e94:	24068693          	addi	a3,a3,576 # 800080d0 <CONSOLE_STATUS+0xc0>
    80001e98:	01400613          	li	a2,20
    80001e9c:	00006597          	auipc	a1,0x6
    80001ea0:	25c58593          	addi	a1,a1,604 # 800080f8 <CONSOLE_STATUS+0xe8>
    80001ea4:	00006517          	auipc	a0,0x6
    80001ea8:	1d450513          	addi	a0,a0,468 # 80008078 <CONSOLE_STATUS+0x68>
    80001eac:	00000097          	auipc	ra,0x0
    80001eb0:	c90080e7          	jalr	-880(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
}
    80001eb4:	00007517          	auipc	a0,0x7
    80001eb8:	4c453503          	ld	a0,1220(a0) # 80009378 <_ZN7Console8instanceE>
    80001ebc:	00813083          	ld	ra,8(sp)
    80001ec0:	00013403          	ld	s0,0(sp)
    80001ec4:	01010113          	addi	sp,sp,16
    80001ec8:	00008067          	ret

0000000080001ecc <_ZN7Console13consoleBuffer3putEc>:

void Console::consoleBuffer::put(char c){
    80001ecc:	ff010113          	addi	sp,sp,-16
    80001ed0:	00813423          	sd	s0,8(sp)
    80001ed4:	01010413          	addi	s0,sp,16
    buffer[tail] = c;
    80001ed8:	07053783          	ld	a5,112(a0)
    80001edc:	00f50733          	add	a4,a0,a5
    80001ee0:	00b70023          	sb	a1,0(a4)
    tail = (tail + 1) % BUFFER_SIZE;
    80001ee4:	00178793          	addi	a5,a5,1
    80001ee8:	06400713          	li	a4,100
    80001eec:	02e7f7b3          	remu	a5,a5,a4
    80001ef0:	06f53823          	sd	a5,112(a0)
    size++;
    80001ef4:	07853783          	ld	a5,120(a0)
    80001ef8:	00178793          	addi	a5,a5,1
    80001efc:	06f53c23          	sd	a5,120(a0)
}
    80001f00:	00813403          	ld	s0,8(sp)
    80001f04:	01010113          	addi	sp,sp,16
    80001f08:	00008067          	ret

0000000080001f0c <_ZN7Console13consoleBuffer3getEv>:

char Console::consoleBuffer::get(){
    80001f0c:	ff010113          	addi	sp,sp,-16
    80001f10:	00813423          	sd	s0,8(sp)
    80001f14:	01010413          	addi	s0,sp,16
    80001f18:	00050793          	mv	a5,a0
    char c = buffer[head];
    80001f1c:	06853703          	ld	a4,104(a0)
    80001f20:	00e506b3          	add	a3,a0,a4
    80001f24:	0006c503          	lbu	a0,0(a3)
    head = (head + 1) % BUFFER_SIZE;
    80001f28:	00170713          	addi	a4,a4,1
    80001f2c:	06400693          	li	a3,100
    80001f30:	02d77733          	remu	a4,a4,a3
    80001f34:	06e7b423          	sd	a4,104(a5)
    size--;
    80001f38:	0787b703          	ld	a4,120(a5)
    80001f3c:	fff70713          	addi	a4,a4,-1
    80001f40:	06e7bc23          	sd	a4,120(a5)
    return c;
}
    80001f44:	00813403          	ld	s0,8(sp)
    80001f48:	01010113          	addi	sp,sp,16
    80001f4c:	00008067          	ret

0000000080001f50 <_ZN7Console13consoleBuffer7isEmptyEv>:

bool Console::consoleBuffer::isEmpty(){
    80001f50:	ff010113          	addi	sp,sp,-16
    80001f54:	00813423          	sd	s0,8(sp)
    80001f58:	01010413          	addi	s0,sp,16
    return size == 0;
    80001f5c:	07853503          	ld	a0,120(a0)
}
    80001f60:	00153513          	seqz	a0,a0
    80001f64:	00813403          	ld	s0,8(sp)
    80001f68:	01010113          	addi	sp,sp,16
    80001f6c:	00008067          	ret

0000000080001f70 <_ZN7Console13consoleBuffer6isFullEv>:

bool Console::consoleBuffer::isFull(){
    80001f70:	ff010113          	addi	sp,sp,-16
    80001f74:	00813423          	sd	s0,8(sp)
    80001f78:	01010413          	addi	s0,sp,16
    return size == BUFFER_SIZE;
    80001f7c:	07853503          	ld	a0,120(a0)
    80001f80:	f9c50513          	addi	a0,a0,-100
}
    80001f84:	00153513          	seqz	a0,a0
    80001f88:	00813403          	ld	s0,8(sp)
    80001f8c:	01010113          	addi	sp,sp,16
    80001f90:	00008067          	ret

0000000080001f94 <_ZN7Console4putcEc>:

void Console::putc(char c){
    80001f94:	ff010113          	addi	sp,sp,-16
    80001f98:	00113423          	sd	ra,8(sp)
    80001f9c:	00813023          	sd	s0,0(sp)
    80001fa0:	01010413          	addi	s0,sp,16
    80001fa4:	00050593          	mv	a1,a0
    instance->outBuffer.put(c);
    80001fa8:	00007517          	auipc	a0,0x7
    80001fac:	3d053503          	ld	a0,976(a0) # 80009378 <_ZN7Console8instanceE>
    80001fb0:	08850513          	addi	a0,a0,136
    80001fb4:	00000097          	auipc	ra,0x0
    80001fb8:	f18080e7          	jalr	-232(ra) # 80001ecc <_ZN7Console13consoleBuffer3putEc>
}
    80001fbc:	00813083          	ld	ra,8(sp)
    80001fc0:	00013403          	ld	s0,0(sp)
    80001fc4:	01010113          	addi	sp,sp,16
    80001fc8:	00008067          	ret

0000000080001fcc <_ZN7Console4getcEv>:

char Console::getc(){
    80001fcc:	fe010113          	addi	sp,sp,-32
    80001fd0:	00113c23          	sd	ra,24(sp)
    80001fd4:	00813823          	sd	s0,16(sp)
    80001fd8:	00913423          	sd	s1,8(sp)
    80001fdc:	02010413          	addi	s0,sp,32
    sem_wait(instance->inSem);
    80001fe0:	00007497          	auipc	s1,0x7
    80001fe4:	39848493          	addi	s1,s1,920 # 80009378 <_ZN7Console8instanceE>
    80001fe8:	0004b783          	ld	a5,0(s1)
    80001fec:	0007b503          	ld	a0,0(a5)
    80001ff0:	fffff097          	auipc	ra,0xfffff
    80001ff4:	588080e7          	jalr	1416(ra) # 80001578 <_Z8sem_waitP4_sem>
    return instance->inBuffer.get();
    80001ff8:	0004b503          	ld	a0,0(s1)
    80001ffc:	00850513          	addi	a0,a0,8
    80002000:	00000097          	auipc	ra,0x0
    80002004:	f0c080e7          	jalr	-244(ra) # 80001f0c <_ZN7Console13consoleBuffer3getEv>
}
    80002008:	01813083          	ld	ra,24(sp)
    8000200c:	01013403          	ld	s0,16(sp)
    80002010:	00813483          	ld	s1,8(sp)
    80002014:	02010113          	addi	sp,sp,32
    80002018:	00008067          	ret

000000008000201c <_ZN7Console13outputHandlerEv>:

void Console::outputHandler(){
    8000201c:	fe010113          	addi	sp,sp,-32
    80002020:	00113c23          	sd	ra,24(sp)
    80002024:	00813823          	sd	s0,16(sp)
    80002028:	00913423          	sd	s1,8(sp)
    8000202c:	01213023          	sd	s2,0(sp)
    80002030:	02010413          	addi	s0,sp,32
    80002034:	00c0006f          	j	80002040 <_ZN7Console13outputHandlerEv+0x24>
    while(!instance->outBuffer.isEmpty()){
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
            (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
        }
        thread_dispatch();
    80002038:	fffff097          	auipc	ra,0xfffff
    8000203c:	46c080e7          	jalr	1132(ra) # 800014a4 <_Z15thread_dispatchv>
    while(!instance->outBuffer.isEmpty()){
    80002040:	00007517          	auipc	a0,0x7
    80002044:	33853503          	ld	a0,824(a0) # 80009378 <_ZN7Console8instanceE>
    80002048:	08850513          	addi	a0,a0,136
    8000204c:	00000097          	auipc	ra,0x0
    80002050:	f04080e7          	jalr	-252(ra) # 80001f50 <_ZN7Console13consoleBuffer7isEmptyEv>
    80002054:	04051c63          	bnez	a0,800020ac <_ZN7Console13outputHandlerEv+0x90>
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
    80002058:	00007797          	auipc	a5,0x7
    8000205c:	2807b783          	ld	a5,640(a5) # 800092d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002060:	0007b783          	ld	a5,0(a5)
    80002064:	0007c783          	lbu	a5,0(a5)
    80002068:	0207f793          	andi	a5,a5,32
    8000206c:	fc0786e3          	beqz	a5,80002038 <_ZN7Console13outputHandlerEv+0x1c>
    80002070:	00007497          	auipc	s1,0x7
    80002074:	3084b483          	ld	s1,776(s1) # 80009378 <_ZN7Console8instanceE>
    80002078:	08848493          	addi	s1,s1,136
    8000207c:	00048513          	mv	a0,s1
    80002080:	00000097          	auipc	ra,0x0
    80002084:	ed0080e7          	jalr	-304(ra) # 80001f50 <_ZN7Console13consoleBuffer7isEmptyEv>
    80002088:	fa0518e3          	bnez	a0,80002038 <_ZN7Console13outputHandlerEv+0x1c>
            (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
    8000208c:	00007797          	auipc	a5,0x7
    80002090:	2647b783          	ld	a5,612(a5) # 800092f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002094:	0007b903          	ld	s2,0(a5)
    80002098:	00048513          	mv	a0,s1
    8000209c:	00000097          	auipc	ra,0x0
    800020a0:	e70080e7          	jalr	-400(ra) # 80001f0c <_ZN7Console13consoleBuffer3getEv>
    800020a4:	00a90023          	sb	a0,0(s2)
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
    800020a8:	fb1ff06f          	j	80002058 <_ZN7Console13outputHandlerEv+0x3c>
    }
}
    800020ac:	01813083          	ld	ra,24(sp)
    800020b0:	01013403          	ld	s0,16(sp)
    800020b4:	00813483          	ld	s1,8(sp)
    800020b8:	00013903          	ld	s2,0(sp)
    800020bc:	02010113          	addi	sp,sp,32
    800020c0:	00008067          	ret

00000000800020c4 <_ZN7Console12inputHandlerEv>:

void Console::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    800020c4:	00007797          	auipc	a5,0x7
    800020c8:	2147b783          	ld	a5,532(a5) # 800092d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800020cc:	0007b783          	ld	a5,0(a5)
    800020d0:	0007c783          	lbu	a5,0(a5)
    800020d4:	0017f793          	andi	a5,a5,1
    800020d8:	06078e63          	beqz	a5,80002154 <_ZN7Console12inputHandlerEv+0x90>
void Console::inputHandler(){
    800020dc:	fe010113          	addi	sp,sp,-32
    800020e0:	00113c23          	sd	ra,24(sp)
    800020e4:	00813823          	sd	s0,16(sp)
    800020e8:	00913423          	sd	s1,8(sp)
    800020ec:	02010413          	addi	s0,sp,32
        char ch =(*(char*)CONSOLE_RX_DATA);
    800020f0:	00007797          	auipc	a5,0x7
    800020f4:	1e07b783          	ld	a5,480(a5) # 800092d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800020f8:	0007b783          	ld	a5,0(a5)
        instance->inBuffer.put(ch);
    800020fc:	00007497          	auipc	s1,0x7
    80002100:	27c48493          	addi	s1,s1,636 # 80009378 <_ZN7Console8instanceE>
    80002104:	0004b503          	ld	a0,0(s1)
    80002108:	0007c583          	lbu	a1,0(a5)
    8000210c:	00850513          	addi	a0,a0,8
    80002110:	00000097          	auipc	ra,0x0
    80002114:	dbc080e7          	jalr	-580(ra) # 80001ecc <_ZN7Console13consoleBuffer3putEc>
        sem_signal(instance->inSem);
    80002118:	0004b783          	ld	a5,0(s1)
    8000211c:	0007b503          	ld	a0,0(a5)
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	484080e7          	jalr	1156(ra) # 800015a4 <_Z10sem_signalP4_sem>
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80002128:	00007797          	auipc	a5,0x7
    8000212c:	1b07b783          	ld	a5,432(a5) # 800092d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002130:	0007b783          	ld	a5,0(a5)
    80002134:	0007c783          	lbu	a5,0(a5)
    80002138:	0017f793          	andi	a5,a5,1
    8000213c:	fa079ae3          	bnez	a5,800020f0 <_ZN7Console12inputHandlerEv+0x2c>
    }
    80002140:	01813083          	ld	ra,24(sp)
    80002144:	01013403          	ld	s0,16(sp)
    80002148:	00813483          	ld	s1,8(sp)
    8000214c:	02010113          	addi	sp,sp,32
    80002150:	00008067          	ret
    80002154:	00008067          	ret

0000000080002158 <_ZN6KernelC1Ev>:
#include "console.h"


extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80002158:	fd010113          	addi	sp,sp,-48
    8000215c:	02113423          	sd	ra,40(sp)
    80002160:	02813023          	sd	s0,32(sp)
    80002164:	00913c23          	sd	s1,24(sp)
    80002168:	01213823          	sd	s2,16(sp)
    8000216c:	01313423          	sd	s3,8(sp)
    80002170:	03010413          	addi	s0,sp,48
    80002174:	00050913          	mv	s2,a0
    80002178:	00001097          	auipc	ra,0x1
    8000217c:	0b8080e7          	jalr	184(ra) # 80003230 <_ZN11HeapManagerC1Ev>
    80002180:	00890513          	addi	a0,s2,8
    80002184:	00003097          	auipc	ra,0x3
    80002188:	a50080e7          	jalr	-1456(ra) # 80004bd4 <_ZN9SchedulerC1Ev>
    8000218c:	01890993          	addi	s3,s2,24
    80002190:	00098513          	mv	a0,s3
    80002194:	fffff097          	auipc	ra,0xfffff
    80002198:	f6c080e7          	jalr	-148(ra) # 80001100 <_ZN5TimerC1Ev>
    8000219c:	02890493          	addi	s1,s2,40
    
    sem_t inSem;

    struct consoleBuffer{
    public:
        consoleBuffer(): head(0), tail(0), size(0){}
    800021a0:	0604b823          	sd	zero,112(s1)
    800021a4:	0604bc23          	sd	zero,120(s1)
    800021a8:	0804b023          	sd	zero,128(s1)
    800021ac:	0e04b823          	sd	zero,240(s1)
    800021b0:	0e04bc23          	sd	zero,248(s1)
    800021b4:	1004b023          	sd	zero,256(s1)
        assert(instance == 0);
    800021b8:	00007797          	auipc	a5,0x7
    800021bc:	1507b783          	ld	a5,336(a5) # 80009308 <_GLOBAL_OFFSET_TABLE_+0x40>
    800021c0:	0007b783          	ld	a5,0(a5)
    800021c4:	02079663          	bnez	a5,800021f0 <_ZN6KernelC1Ev+0x98>
        instance = this;
    800021c8:	00007797          	auipc	a5,0x7
    800021cc:	1407b783          	ld	a5,320(a5) # 80009308 <_GLOBAL_OFFSET_TABLE_+0x40>
    800021d0:	0097b023          	sd	s1,0(a5)
    800021d4:	02813083          	ld	ra,40(sp)
    800021d8:	02013403          	ld	s0,32(sp)
    800021dc:	01813483          	ld	s1,24(sp)
    800021e0:	01013903          	ld	s2,16(sp)
    800021e4:	00813983          	ld	s3,8(sp)
    800021e8:	03010113          	addi	sp,sp,48
    800021ec:	00008067          	ret
        assert(instance == 0);
    800021f0:	00006697          	auipc	a3,0x6
    800021f4:	f1868693          	addi	a3,a3,-232 # 80008108 <CONSOLE_STATUS+0xf8>
    800021f8:	01a00613          	li	a2,26
    800021fc:	00006597          	auipc	a1,0x6
    80002200:	f2458593          	addi	a1,a1,-220 # 80008120 <CONSOLE_STATUS+0x110>
    80002204:	00006517          	auipc	a0,0x6
    80002208:	e3c50513          	addi	a0,a0,-452 # 80008040 <CONSOLE_STATUS+0x30>
    8000220c:	00000097          	auipc	ra,0x0
    80002210:	930080e7          	jalr	-1744(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    80002214:	fb5ff06f          	j	800021c8 <_ZN6KernelC1Ev+0x70>
    80002218:	00050493          	mv	s1,a0
    8000221c:	00098513          	mv	a0,s3
    80002220:	fffff097          	auipc	ra,0xfffff
    80002224:	f50080e7          	jalr	-176(ra) # 80001170 <_ZN5TimerD1Ev>
    80002228:	00090513          	mv	a0,s2
    8000222c:	00001097          	auipc	ra,0x1
    80002230:	06c080e7          	jalr	108(ra) # 80003298 <_ZN11HeapManagerD1Ev>
    80002234:	00048513          	mv	a0,s1
    80002238:	00008097          	auipc	ra,0x8
    8000223c:	240080e7          	jalr	576(ra) # 8000a478 <_Unwind_Resume>
    80002240:	00050493          	mv	s1,a0
    80002244:	fe5ff06f          	j	80002228 <_ZN6KernelC1Ev+0xd0>

0000000080002248 <_ZN6Kernel10initialiseEv>:
 
void Kernel::initialise(){
    80002248:	ff010113          	addi	sp,sp,-16
    8000224c:	00113423          	sd	ra,8(sp)
    80002250:	00813023          	sd	s0,0(sp)
    80002254:	01010413          	addi	s0,sp,16
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80002258:	00007797          	auipc	a5,0x7
    8000225c:	0b87b783          	ld	a5,184(a5) # 80009310 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002260:	10579073          	csrw	stvec,a5

    
    /// initialise the heap manager
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );
    80002264:	00007797          	auipc	a5,0x7
    80002268:	0b47b783          	ld	a5,180(a5) # 80009318 <_GLOBAL_OFFSET_TABLE_+0x50>
    8000226c:	0007b603          	ld	a2,0(a5)
    80002270:	00007797          	auipc	a5,0x7
    80002274:	0707b783          	ld	a5,112(a5) # 800092e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002278:	0007b583          	ld	a1,0(a5)
    8000227c:	00001097          	auipc	ra,0x1
    80002280:	034080e7          	jalr	52(ra) # 800032b0 <_ZN11HeapManager4initEmm>
    console.getInstance().init();
    80002284:	00000097          	auipc	ra,0x0
    80002288:	be4080e7          	jalr	-1052(ra) # 80001e68 <_ZN7Console11getInstanceEv>
        sem_open(&inSem, 0);
    8000228c:	00000593          	li	a1,0
    80002290:	fffff097          	auipc	ra,0xfffff
    80002294:	284080e7          	jalr	644(ra) # 80001514 <_Z8sem_openPP4_semj>
    return;
}
    80002298:	00813083          	ld	ra,8(sp)
    8000229c:	00013403          	ld	s0,0(sp)
    800022a0:	01010113          	addi	sp,sp,16
    800022a4:	00008067          	ret

00000000800022a8 <_Z8testFuncPv>:

// sem_t sem = 0;

void testFunc(void* arg){
    800022a8:	ff010113          	addi	sp,sp,-16
    800022ac:	00113423          	sd	ra,8(sp)
    800022b0:	00813023          	sd	s0,0(sp)
    800022b4:	01010413          	addi	s0,sp,16
    putc('t');
    800022b8:	07400513          	li	a0,116
    800022bc:	fffff097          	auipc	ra,0xfffff
    800022c0:	33c080e7          	jalr	828(ra) # 800015f8 <_Z4putcc>
    putc('e');
    800022c4:	06500513          	li	a0,101
    800022c8:	fffff097          	auipc	ra,0xfffff
    800022cc:	330080e7          	jalr	816(ra) # 800015f8 <_Z4putcc>
    putc('s');
    800022d0:	07300513          	li	a0,115
    800022d4:	fffff097          	auipc	ra,0xfffff
    800022d8:	324080e7          	jalr	804(ra) # 800015f8 <_Z4putcc>
    putc('t');
    800022dc:	07400513          	li	a0,116
    800022e0:	fffff097          	auipc	ra,0xfffff
    800022e4:	318080e7          	jalr	792(ra) # 800015f8 <_Z4putcc>

    // sem_wait(sem);
    // thread_dispatch();
    // thread_dispatch();
    thread_dispatch();
    800022e8:	fffff097          	auipc	ra,0xfffff
    800022ec:	1bc080e7          	jalr	444(ra) # 800014a4 <_Z15thread_dispatchv>

    // time_sleep(10);
    putc(' ');
    800022f0:	02000513          	li	a0,32
    800022f4:	fffff097          	auipc	ra,0xfffff
    800022f8:	304080e7          	jalr	772(ra) # 800015f8 <_Z4putcc>

    putc('t');
    800022fc:	07400513          	li	a0,116
    80002300:	fffff097          	auipc	ra,0xfffff
    80002304:	2f8080e7          	jalr	760(ra) # 800015f8 <_Z4putcc>
    putc('h');
    80002308:	06800513          	li	a0,104
    8000230c:	fffff097          	auipc	ra,0xfffff
    80002310:	2ec080e7          	jalr	748(ra) # 800015f8 <_Z4putcc>
    putc('r');
    80002314:	07200513          	li	a0,114
    80002318:	fffff097          	auipc	ra,0xfffff
    8000231c:	2e0080e7          	jalr	736(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80002320:	06500513          	li	a0,101
    80002324:	fffff097          	auipc	ra,0xfffff
    80002328:	2d4080e7          	jalr	724(ra) # 800015f8 <_Z4putcc>
    putc('a');
    8000232c:	06100513          	li	a0,97
    80002330:	fffff097          	auipc	ra,0xfffff
    80002334:	2c8080e7          	jalr	712(ra) # 800015f8 <_Z4putcc>
    putc('d');
    80002338:	06400513          	li	a0,100
    8000233c:	fffff097          	auipc	ra,0xfffff
    80002340:	2bc080e7          	jalr	700(ra) # 800015f8 <_Z4putcc>
    putc('\n');
    80002344:	00a00513          	li	a0,10
    80002348:	fffff097          	auipc	ra,0xfffff
    8000234c:	2b0080e7          	jalr	688(ra) # 800015f8 <_Z4putcc>
}
    80002350:	00813083          	ld	ra,8(sp)
    80002354:	00013403          	ld	s0,0(sp)
    80002358:	01010113          	addi	sp,sp,16
    8000235c:	00008067          	ret

0000000080002360 <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    80002360:	fe010113          	addi	sp,sp,-32
    80002364:	00113c23          	sd	ra,24(sp)
    80002368:	00813823          	sd	s0,16(sp)
    8000236c:	02010413          	addi	s0,sp,32

    thread_t t, test;
    
    thread_create(&t, 0, 0);
    80002370:	00000613          	li	a2,0
    80002374:	00000593          	li	a1,0
    80002378:	fe840513          	addi	a0,s0,-24
    8000237c:	fffff097          	auipc	ra,0xfffff
    80002380:	08c080e7          	jalr	140(ra) # 80001408 <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80002384:	00003097          	auipc	ra,0x3
    80002388:	ad8080e7          	jalr	-1320(ra) # 80004e5c <_ZN9Scheduler3getEv>
    8000238c:	00007797          	auipc	a5,0x7
    80002390:	f947b783          	ld	a5,-108(a5) # 80009320 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002394:	00a7b023          	sd	a0,0(a5)
    
    /// change to user mode
    __asm__ volatile ("li a0, 0xff");
    80002398:	0ff00513          	li	a0,255
    __asm__ volatile ("ecall");
    8000239c:	00000073          	ecall
    /// NOW WE ARE IN USER MODE
    
    
    thread_create(&test, usermain, 0);
    800023a0:	00000613          	li	a2,0
    800023a4:	00007597          	auipc	a1,0x7
    800023a8:	f445b583          	ld	a1,-188(a1) # 800092e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800023ac:	fe040513          	addi	a0,s0,-32
    800023b0:	fffff097          	auipc	ra,0xfffff
    800023b4:	058080e7          	jalr	88(ra) # 80001408 <_Z13thread_createPP7_threadPFvPvES2_>
    do{
        Console::outputHandler();
    800023b8:	00000097          	auipc	ra,0x0
    800023bc:	c64080e7          	jalr	-924(ra) # 8000201c <_ZN7Console13outputHandlerEv>
        thread_dispatch();
    800023c0:	fffff097          	auipc	ra,0xfffff
    800023c4:	0e4080e7          	jalr	228(ra) # 800014a4 <_Z15thread_dispatchv>
    }while(!Scheduler::isEmpty() || !Timer::getInstance().noSleepingThreads());
    800023c8:	00003097          	auipc	ra,0x3
    800023cc:	87c080e7          	jalr	-1924(ra) # 80004c44 <_ZN9Scheduler7isEmptyEv>
    800023d0:	fe0504e3          	beqz	a0,800023b8 <_ZN6Kernel3runEv+0x58>
    800023d4:	fffff097          	auipc	ra,0xfffff
    800023d8:	de4080e7          	jalr	-540(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    800023dc:	fffff097          	auipc	ra,0xfffff
    800023e0:	f94080e7          	jalr	-108(ra) # 80001370 <_ZN5Timer17noSleepingThreadsEv>
    800023e4:	fc050ae3          	beqz	a0,800023b8 <_ZN6Kernel3runEv+0x58>

    return EXIT_SUCCESS;
}
    800023e8:	00000513          	li	a0,0
    800023ec:	01813083          	ld	ra,24(sp)
    800023f0:	01013403          	ld	s0,16(sp)
    800023f4:	02010113          	addi	sp,sp,32
    800023f8:	00008067          	ret

00000000800023fc <_Z13thread_test_1Pv>:
#include "assert.h"

sem_t sem1;
sem_t sem2;

void thread_test_1(void* args){
    800023fc:	ff010113          	addi	sp,sp,-16
    80002400:	00113423          	sd	ra,8(sp)
    80002404:	00813023          	sd	s0,0(sp)
    80002408:	01010413          	addi	s0,sp,16
    putc('1');
    8000240c:	03100513          	li	a0,49
    80002410:	fffff097          	auipc	ra,0xfffff
    80002414:	1e8080e7          	jalr	488(ra) # 800015f8 <_Z4putcc>
    putc('s');
    80002418:	07300513          	li	a0,115
    8000241c:	fffff097          	auipc	ra,0xfffff
    80002420:	1dc080e7          	jalr	476(ra) # 800015f8 <_Z4putcc>
    time_sleep(30);
    80002424:	01e00513          	li	a0,30
    80002428:	fffff097          	auipc	ra,0xfffff
    8000242c:	0c0080e7          	jalr	192(ra) # 800014e8 <_Z10time_sleepm>
    putc('1');
    80002430:	03100513          	li	a0,49
    80002434:	fffff097          	auipc	ra,0xfffff
    80002438:	1c4080e7          	jalr	452(ra) # 800015f8 <_Z4putcc>
    sem_signal(sem1);
    8000243c:	00007517          	auipc	a0,0x7
    80002440:	f4453503          	ld	a0,-188(a0) # 80009380 <sem1>
    80002444:	fffff097          	auipc	ra,0xfffff
    80002448:	160080e7          	jalr	352(ra) # 800015a4 <_Z10sem_signalP4_sem>
    putc('S');
    8000244c:	05300513          	li	a0,83
    80002450:	fffff097          	auipc	ra,0xfffff
    80002454:	1a8080e7          	jalr	424(ra) # 800015f8 <_Z4putcc>
}
    80002458:	00813083          	ld	ra,8(sp)
    8000245c:	00013403          	ld	s0,0(sp)
    80002460:	01010113          	addi	sp,sp,16
    80002464:	00008067          	ret

0000000080002468 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80002468:	ff010113          	addi	sp,sp,-16
    8000246c:	00113423          	sd	ra,8(sp)
    80002470:	00813023          	sd	s0,0(sp)
    80002474:	01010413          	addi	s0,sp,16
    putc('2');
    80002478:	03200513          	li	a0,50
    8000247c:	fffff097          	auipc	ra,0xfffff
    80002480:	17c080e7          	jalr	380(ra) # 800015f8 <_Z4putcc>
    putc('s');
    80002484:	07300513          	li	a0,115
    80002488:	fffff097          	auipc	ra,0xfffff
    8000248c:	170080e7          	jalr	368(ra) # 800015f8 <_Z4putcc>
    time_sleep(60);
    80002490:	03c00513          	li	a0,60
    80002494:	fffff097          	auipc	ra,0xfffff
    80002498:	054080e7          	jalr	84(ra) # 800014e8 <_Z10time_sleepm>
    putc('2');
    8000249c:	03200513          	li	a0,50
    800024a0:	fffff097          	auipc	ra,0xfffff
    800024a4:	158080e7          	jalr	344(ra) # 800015f8 <_Z4putcc>
    putc('S');
    800024a8:	05300513          	li	a0,83
    800024ac:	fffff097          	auipc	ra,0xfffff
    800024b0:	14c080e7          	jalr	332(ra) # 800015f8 <_Z4putcc>
    sem_signal(sem2);
    800024b4:	00007517          	auipc	a0,0x7
    800024b8:	ed453503          	ld	a0,-300(a0) # 80009388 <sem2>
    800024bc:	fffff097          	auipc	ra,0xfffff
    800024c0:	0e8080e7          	jalr	232(ra) # 800015a4 <_Z10sem_signalP4_sem>
    for(int i = 0; i < 1 << 20; i++){
    800024c4:	00000793          	li	a5,0
    800024c8:	00100737          	lui	a4,0x100
    800024cc:	00e7d863          	bge	a5,a4,800024dc <_Z13thread_test_2Pv+0x74>
        __asm__ volatile("nop");
    800024d0:	00000013          	nop
    for(int i = 0; i < 1 << 20; i++){
    800024d4:	0017879b          	addiw	a5,a5,1
    800024d8:	ff1ff06f          	j	800024c8 <_Z13thread_test_2Pv+0x60>
    }
}
    800024dc:	00813083          	ld	ra,8(sp)
    800024e0:	00013403          	ld	s0,0(sp)
    800024e4:	01010113          	addi	sp,sp,16
    800024e8:	00008067          	ret

00000000800024ec <_Z7memTestv>:

void memTest(){
    800024ec:	fd010113          	addi	sp,sp,-48
    800024f0:	02113423          	sd	ra,40(sp)
    800024f4:	02813023          	sd	s0,32(sp)
    800024f8:	00913c23          	sd	s1,24(sp)
    800024fc:	01213823          	sd	s2,16(sp)
    80002500:	01313423          	sd	s3,8(sp)
    80002504:	01413023          	sd	s4,0(sp)
    80002508:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    8000250c:	00007797          	auipc	a5,0x7
    80002510:	dec7b783          	ld	a5,-532(a5) # 800092f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002514:	0007b503          	ld	a0,0(a5)
    80002518:	00001097          	auipc	ra,0x1
    8000251c:	ebc080e7          	jalr	-324(ra) # 800033d4 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002520:	00050993          	mv	s3,a0
    putc('F');
    80002524:	04600513          	li	a0,70
    80002528:	fffff097          	auipc	ra,0xfffff
    8000252c:	0d0080e7          	jalr	208(ra) # 800015f8 <_Z4putcc>
    putc('r');
    80002530:	07200513          	li	a0,114
    80002534:	fffff097          	auipc	ra,0xfffff
    80002538:	0c4080e7          	jalr	196(ra) # 800015f8 <_Z4putcc>
    putc('e');
    8000253c:	06500513          	li	a0,101
    80002540:	fffff097          	auipc	ra,0xfffff
    80002544:	0b8080e7          	jalr	184(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80002548:	06500513          	li	a0,101
    8000254c:	fffff097          	auipc	ra,0xfffff
    80002550:	0ac080e7          	jalr	172(ra) # 800015f8 <_Z4putcc>
    putc(' ');
    80002554:	02000513          	li	a0,32
    80002558:	fffff097          	auipc	ra,0xfffff
    8000255c:	0a0080e7          	jalr	160(ra) # 800015f8 <_Z4putcc>
    putc('m');
    80002560:	06d00513          	li	a0,109
    80002564:	fffff097          	auipc	ra,0xfffff
    80002568:	094080e7          	jalr	148(ra) # 800015f8 <_Z4putcc>
    putc('e');
    8000256c:	06500513          	li	a0,101
    80002570:	fffff097          	auipc	ra,0xfffff
    80002574:	088080e7          	jalr	136(ra) # 800015f8 <_Z4putcc>
    putc('m');
    80002578:	06d00513          	li	a0,109
    8000257c:	fffff097          	auipc	ra,0xfffff
    80002580:	07c080e7          	jalr	124(ra) # 800015f8 <_Z4putcc>
    putc('o');
    80002584:	06f00513          	li	a0,111
    80002588:	fffff097          	auipc	ra,0xfffff
    8000258c:	070080e7          	jalr	112(ra) # 800015f8 <_Z4putcc>
    putc('r');
    80002590:	07200513          	li	a0,114
    80002594:	fffff097          	auipc	ra,0xfffff
    80002598:	064080e7          	jalr	100(ra) # 800015f8 <_Z4putcc>
    putc('y');
    8000259c:	07900513          	li	a0,121
    800025a0:	fffff097          	auipc	ra,0xfffff
    800025a4:	058080e7          	jalr	88(ra) # 800015f8 <_Z4putcc>
    putc(':');
    800025a8:	03a00513          	li	a0,58
    800025ac:	fffff097          	auipc	ra,0xfffff
    800025b0:	04c080e7          	jalr	76(ra) # 800015f8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800025b4:	00f00493          	li	s1,15
    800025b8:	0140006f          	j	800025cc <_Z7memTestv+0xe0>
        int digit = (freeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    800025bc:	05750513          	addi	a0,a0,87
    800025c0:	fffff097          	auipc	ra,0xfffff
    800025c4:	038080e7          	jalr	56(ra) # 800015f8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800025c8:	fff4849b          	addiw	s1,s1,-1
    800025cc:	0204c463          	bltz	s1,800025f4 <_Z7memTestv+0x108>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    800025d0:	0024951b          	slliw	a0,s1,0x2
    800025d4:	00a9d533          	srl	a0,s3,a0
    800025d8:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800025dc:	00900793          	li	a5,9
    800025e0:	fca7cee3          	blt	a5,a0,800025bc <_Z7memTestv+0xd0>
            putc('0' + digit);
    800025e4:	03050513          	addi	a0,a0,48
    800025e8:	fffff097          	auipc	ra,0xfffff
    800025ec:	010080e7          	jalr	16(ra) # 800015f8 <_Z4putcc>
    800025f0:	fd9ff06f          	j	800025c8 <_Z7memTestv+0xdc>
        }
    }
    putc('\n');
    800025f4:	00a00513          	li	a0,10
    800025f8:	fffff097          	auipc	ra,0xfffff
    800025fc:	000080e7          	jalr	ra # 800015f8 <_Z4putcc>
    int n = 100;
    int k = 100;
    int** matrix = (int**)mem_alloc(sizeof(int*) * n);
    80002600:	32000513          	li	a0,800
    80002604:	fffff097          	auipc	ra,0xfffff
    80002608:	da8080e7          	jalr	-600(ra) # 800013ac <_Z9mem_allocm>
    8000260c:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    80002610:	00000493          	li	s1,0
    80002614:	0080006f          	j	8000261c <_Z7memTestv+0x130>
    80002618:	0014849b          	addiw	s1,s1,1
    8000261c:	06300793          	li	a5,99
    80002620:	0497c663          	blt	a5,s1,8000266c <_Z7memTestv+0x180>
        matrix[i] = (int*)mem_alloc(sizeof(int) * k);
    80002624:	00349a13          	slli	s4,s1,0x3
    80002628:	01490a33          	add	s4,s2,s4
    8000262c:	19000513          	li	a0,400
    80002630:	fffff097          	auipc	ra,0xfffff
    80002634:	d7c080e7          	jalr	-644(ra) # 800013ac <_Z9mem_allocm>
    80002638:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    8000263c:	00000713          	li	a4,0
    80002640:	06300793          	li	a5,99
    80002644:	fce7cae3          	blt	a5,a4,80002618 <_Z7memTestv+0x12c>
            matrix[i][j] = i * k + j;
    80002648:	06400793          	li	a5,100
    8000264c:	029787bb          	mulw	a5,a5,s1
    80002650:	000a3683          	ld	a3,0(s4)
    80002654:	00271613          	slli	a2,a4,0x2
    80002658:	00c686b3          	add	a3,a3,a2
    8000265c:	00e787bb          	addw	a5,a5,a4
    80002660:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80002664:	0017071b          	addiw	a4,a4,1
    80002668:	fd9ff06f          	j	80002640 <_Z7memTestv+0x154>
        }
    }
    for(int i = 0; i < n; i++){
    8000266c:	00000a13          	li	s4,0
    80002670:	0780006f          	j	800026e8 <_Z7memTestv+0x1fc>
        for(int j = 0; j < k; j++){
    80002674:	0014849b          	addiw	s1,s1,1
    80002678:	06300793          	li	a5,99
    8000267c:	0497ca63          	blt	a5,s1,800026d0 <_Z7memTestv+0x1e4>
            assert(matrix[i][j] == i * k + j);
    80002680:	003a1793          	slli	a5,s4,0x3
    80002684:	00f907b3          	add	a5,s2,a5
    80002688:	0007b783          	ld	a5,0(a5)
    8000268c:	00249713          	slli	a4,s1,0x2
    80002690:	00e787b3          	add	a5,a5,a4
    80002694:	0007a703          	lw	a4,0(a5)
    80002698:	06400793          	li	a5,100
    8000269c:	034787bb          	mulw	a5,a5,s4
    800026a0:	009787bb          	addw	a5,a5,s1
    800026a4:	fcf708e3          	beq	a4,a5,80002674 <_Z7memTestv+0x188>
    800026a8:	00006697          	auipc	a3,0x6
    800026ac:	a8868693          	addi	a3,a3,-1400 # 80008130 <CONSOLE_STATUS+0x120>
    800026b0:	04300613          	li	a2,67
    800026b4:	00006597          	auipc	a1,0x6
    800026b8:	a8c58593          	addi	a1,a1,-1396 # 80008140 <CONSOLE_STATUS+0x130>
    800026bc:	00006517          	auipc	a0,0x6
    800026c0:	a9c50513          	addi	a0,a0,-1380 # 80008158 <CONSOLE_STATUS+0x148>
    800026c4:	fffff097          	auipc	ra,0xfffff
    800026c8:	478080e7          	jalr	1144(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    800026cc:	fa9ff06f          	j	80002674 <_Z7memTestv+0x188>
        }
        mem_free(matrix[i]);
    800026d0:	003a1793          	slli	a5,s4,0x3
    800026d4:	00f907b3          	add	a5,s2,a5
    800026d8:	0007b503          	ld	a0,0(a5)
    800026dc:	fffff097          	auipc	ra,0xfffff
    800026e0:	d00080e7          	jalr	-768(ra) # 800013dc <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    800026e4:	001a0a1b          	addiw	s4,s4,1
    800026e8:	06300793          	li	a5,99
    800026ec:	0147c663          	blt	a5,s4,800026f8 <_Z7memTestv+0x20c>
        for(int j = 0; j < k; j++){
    800026f0:	00000493          	li	s1,0
    800026f4:	f85ff06f          	j	80002678 <_Z7memTestv+0x18c>
    }
    mem_free(matrix);
    800026f8:	00090513          	mv	a0,s2
    800026fc:	fffff097          	auipc	ra,0xfffff
    80002700:	ce0080e7          	jalr	-800(ra) # 800013dc <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002704:	00007797          	auipc	a5,0x7
    80002708:	bf47b783          	ld	a5,-1036(a5) # 800092f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000270c:	0007b503          	ld	a0,0(a5)
    80002710:	00001097          	auipc	ra,0x1
    80002714:	cc4080e7          	jalr	-828(ra) # 800033d4 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002718:	00050493          	mv	s1,a0
    putc('F');
    8000271c:	04600513          	li	a0,70
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	ed8080e7          	jalr	-296(ra) # 800015f8 <_Z4putcc>
    putc('r');
    80002728:	07200513          	li	a0,114
    8000272c:	fffff097          	auipc	ra,0xfffff
    80002730:	ecc080e7          	jalr	-308(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80002734:	06500513          	li	a0,101
    80002738:	fffff097          	auipc	ra,0xfffff
    8000273c:	ec0080e7          	jalr	-320(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80002740:	06500513          	li	a0,101
    80002744:	fffff097          	auipc	ra,0xfffff
    80002748:	eb4080e7          	jalr	-332(ra) # 800015f8 <_Z4putcc>
    putc(' ');
    8000274c:	02000513          	li	a0,32
    80002750:	fffff097          	auipc	ra,0xfffff
    80002754:	ea8080e7          	jalr	-344(ra) # 800015f8 <_Z4putcc>
    putc('m');
    80002758:	06d00513          	li	a0,109
    8000275c:	fffff097          	auipc	ra,0xfffff
    80002760:	e9c080e7          	jalr	-356(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80002764:	06500513          	li	a0,101
    80002768:	fffff097          	auipc	ra,0xfffff
    8000276c:	e90080e7          	jalr	-368(ra) # 800015f8 <_Z4putcc>
    putc('m');
    80002770:	06d00513          	li	a0,109
    80002774:	fffff097          	auipc	ra,0xfffff
    80002778:	e84080e7          	jalr	-380(ra) # 800015f8 <_Z4putcc>
    putc('o');
    8000277c:	06f00513          	li	a0,111
    80002780:	fffff097          	auipc	ra,0xfffff
    80002784:	e78080e7          	jalr	-392(ra) # 800015f8 <_Z4putcc>
    putc('r');
    80002788:	07200513          	li	a0,114
    8000278c:	fffff097          	auipc	ra,0xfffff
    80002790:	e6c080e7          	jalr	-404(ra) # 800015f8 <_Z4putcc>
    putc('y');
    80002794:	07900513          	li	a0,121
    80002798:	fffff097          	auipc	ra,0xfffff
    8000279c:	e60080e7          	jalr	-416(ra) # 800015f8 <_Z4putcc>
    putc(':');
    800027a0:	03a00513          	li	a0,58
    800027a4:	fffff097          	auipc	ra,0xfffff
    800027a8:	e54080e7          	jalr	-428(ra) # 800015f8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800027ac:	00f00913          	li	s2,15
    800027b0:	0140006f          	j	800027c4 <_Z7memTestv+0x2d8>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    800027b4:	05750513          	addi	a0,a0,87
    800027b8:	fffff097          	auipc	ra,0xfffff
    800027bc:	e40080e7          	jalr	-448(ra) # 800015f8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800027c0:	fff9091b          	addiw	s2,s2,-1
    800027c4:	02094463          	bltz	s2,800027ec <_Z7memTestv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    800027c8:	0029151b          	slliw	a0,s2,0x2
    800027cc:	00a4d533          	srl	a0,s1,a0
    800027d0:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800027d4:	00900793          	li	a5,9
    800027d8:	fca7cee3          	blt	a5,a0,800027b4 <_Z7memTestv+0x2c8>
            putc('0' + digit);
    800027dc:	03050513          	addi	a0,a0,48
    800027e0:	fffff097          	auipc	ra,0xfffff
    800027e4:	e18080e7          	jalr	-488(ra) # 800015f8 <_Z4putcc>
    800027e8:	fd9ff06f          	j	800027c0 <_Z7memTestv+0x2d4>
        }
    }
    putc('\n');
    800027ec:	00a00513          	li	a0,10
    800027f0:	fffff097          	auipc	ra,0xfffff
    800027f4:	e08080e7          	jalr	-504(ra) # 800015f8 <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    800027f8:	409989b3          	sub	s3,s3,s1
    putc('D');
    800027fc:	04400513          	li	a0,68
    80002800:	fffff097          	auipc	ra,0xfffff
    80002804:	df8080e7          	jalr	-520(ra) # 800015f8 <_Z4putcc>
    putc('i');
    80002808:	06900513          	li	a0,105
    8000280c:	fffff097          	auipc	ra,0xfffff
    80002810:	dec080e7          	jalr	-532(ra) # 800015f8 <_Z4putcc>
    putc('f');
    80002814:	06600513          	li	a0,102
    80002818:	fffff097          	auipc	ra,0xfffff
    8000281c:	de0080e7          	jalr	-544(ra) # 800015f8 <_Z4putcc>
    putc('f');
    80002820:	06600513          	li	a0,102
    80002824:	fffff097          	auipc	ra,0xfffff
    80002828:	dd4080e7          	jalr	-556(ra) # 800015f8 <_Z4putcc>
    putc('e');
    8000282c:	06500513          	li	a0,101
    80002830:	fffff097          	auipc	ra,0xfffff
    80002834:	dc8080e7          	jalr	-568(ra) # 800015f8 <_Z4putcc>
    putc('r');
    80002838:	07200513          	li	a0,114
    8000283c:	fffff097          	auipc	ra,0xfffff
    80002840:	dbc080e7          	jalr	-580(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80002844:	06500513          	li	a0,101
    80002848:	fffff097          	auipc	ra,0xfffff
    8000284c:	db0080e7          	jalr	-592(ra) # 800015f8 <_Z4putcc>
    putc('n');
    80002850:	06e00513          	li	a0,110
    80002854:	fffff097          	auipc	ra,0xfffff
    80002858:	da4080e7          	jalr	-604(ra) # 800015f8 <_Z4putcc>
    putc('c');
    8000285c:	06300513          	li	a0,99
    80002860:	fffff097          	auipc	ra,0xfffff
    80002864:	d98080e7          	jalr	-616(ra) # 800015f8 <_Z4putcc>
    putc('e');
    80002868:	06500513          	li	a0,101
    8000286c:	fffff097          	auipc	ra,0xfffff
    80002870:	d8c080e7          	jalr	-628(ra) # 800015f8 <_Z4putcc>
    putc(':');
    80002874:	03a00513          	li	a0,58
    80002878:	fffff097          	auipc	ra,0xfffff
    8000287c:	d80080e7          	jalr	-640(ra) # 800015f8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002880:	00f00493          	li	s1,15
    80002884:	0140006f          	j	80002898 <_Z7memTestv+0x3ac>
        int digit = (difference >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002888:	05750513          	addi	a0,a0,87
    8000288c:	fffff097          	auipc	ra,0xfffff
    80002890:	d6c080e7          	jalr	-660(ra) # 800015f8 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002894:	fff4849b          	addiw	s1,s1,-1
    80002898:	0204c463          	bltz	s1,800028c0 <_Z7memTestv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    8000289c:	0024951b          	slliw	a0,s1,0x2
    800028a0:	00a9d533          	srl	a0,s3,a0
    800028a4:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800028a8:	00900793          	li	a5,9
    800028ac:	fca7cee3          	blt	a5,a0,80002888 <_Z7memTestv+0x39c>
            putc('0' + digit);
    800028b0:	03050513          	addi	a0,a0,48
    800028b4:	fffff097          	auipc	ra,0xfffff
    800028b8:	d44080e7          	jalr	-700(ra) # 800015f8 <_Z4putcc>
    800028bc:	fd9ff06f          	j	80002894 <_Z7memTestv+0x3a8>
        }
    }
    putc('\n');
    800028c0:	00a00513          	li	a0,10
    800028c4:	fffff097          	auipc	ra,0xfffff
    800028c8:	d34080e7          	jalr	-716(ra) # 800015f8 <_Z4putcc>
    putc('\n');
    800028cc:	00a00513          	li	a0,10
    800028d0:	fffff097          	auipc	ra,0xfffff
    800028d4:	d28080e7          	jalr	-728(ra) # 800015f8 <_Z4putcc>
    putc('\n');
    800028d8:	00a00513          	li	a0,10
    800028dc:	fffff097          	auipc	ra,0xfffff
    800028e0:	d1c080e7          	jalr	-740(ra) # 800015f8 <_Z4putcc>
}
    800028e4:	02813083          	ld	ra,40(sp)
    800028e8:	02013403          	ld	s0,32(sp)
    800028ec:	01813483          	ld	s1,24(sp)
    800028f0:	01013903          	ld	s2,16(sp)
    800028f4:	00813983          	ld	s3,8(sp)
    800028f8:	00013a03          	ld	s4,0(sp)
    800028fc:	03010113          	addi	sp,sp,48
    80002900:	00008067          	ret

0000000080002904 <_Z8usermainPv>:

void usermain(void* arg){
    80002904:	fd010113          	addi	sp,sp,-48
    80002908:	02113423          	sd	ra,40(sp)
    8000290c:	02813023          	sd	s0,32(sp)
    80002910:	00913c23          	sd	s1,24(sp)
    80002914:	03010413          	addi	s0,sp,48
    memTest();    
    80002918:	00000097          	auipc	ra,0x0
    8000291c:	bd4080e7          	jalr	-1068(ra) # 800024ec <_Z7memTestv>
    putc('0');
    80002920:	03000513          	li	a0,48
    80002924:	fffff097          	auipc	ra,0xfffff
    80002928:	cd4080e7          	jalr	-812(ra) # 800015f8 <_Z4putcc>
    thread_t t1, t2;
    sem_open(&sem1, 0);
    8000292c:	00007497          	auipc	s1,0x7
    80002930:	a5448493          	addi	s1,s1,-1452 # 80009380 <sem1>
    80002934:	00000593          	li	a1,0
    80002938:	00048513          	mv	a0,s1
    8000293c:	fffff097          	auipc	ra,0xfffff
    80002940:	bd8080e7          	jalr	-1064(ra) # 80001514 <_Z8sem_openPP4_semj>
    sem_open(&sem2, 0);
    80002944:	00000593          	li	a1,0
    80002948:	00007517          	auipc	a0,0x7
    8000294c:	a4050513          	addi	a0,a0,-1472 # 80009388 <sem2>
    80002950:	fffff097          	auipc	ra,0xfffff
    80002954:	bc4080e7          	jalr	-1084(ra) # 80001514 <_Z8sem_openPP4_semj>
    thread_create(&t1, thread_test_1, 0);
    80002958:	00000613          	li	a2,0
    8000295c:	00000597          	auipc	a1,0x0
    80002960:	aa058593          	addi	a1,a1,-1376 # 800023fc <_Z13thread_test_1Pv>
    80002964:	fd840513          	addi	a0,s0,-40
    80002968:	fffff097          	auipc	ra,0xfffff
    8000296c:	aa0080e7          	jalr	-1376(ra) # 80001408 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002970:	00000613          	li	a2,0
    80002974:	00000597          	auipc	a1,0x0
    80002978:	af458593          	addi	a1,a1,-1292 # 80002468 <_Z13thread_test_2Pv>
    8000297c:	fd040513          	addi	a0,s0,-48
    80002980:	fffff097          	auipc	ra,0xfffff
    80002984:	a88080e7          	jalr	-1400(ra) # 80001408 <_Z13thread_createPP7_threadPFvPvES2_>
    sem_wait(sem1);
    80002988:	0004b503          	ld	a0,0(s1)
    8000298c:	fffff097          	auipc	ra,0xfffff
    80002990:	bec080e7          	jalr	-1044(ra) # 80001578 <_Z8sem_waitP4_sem>
    putc('3');
    80002994:	03300513          	li	a0,51
    80002998:	fffff097          	auipc	ra,0xfffff
    8000299c:	c60080e7          	jalr	-928(ra) # 800015f8 <_Z4putcc>
    // thread_join(t2);
    // if(getc() == 'a')putc('x');
    putc('4');
    800029a0:	03400513          	li	a0,52
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	c54080e7          	jalr	-940(ra) # 800015f8 <_Z4putcc>
    thread_join(t1);
    800029ac:	fd843503          	ld	a0,-40(s0)
    800029b0:	fffff097          	auipc	ra,0xfffff
    800029b4:	b14080e7          	jalr	-1260(ra) # 800014c4 <_Z11thread_joinP7_thread>
    // thread_dispatch();
    // thread_dispatch();
    sem_wait(sem2);
    800029b8:	0084b503          	ld	a0,8(s1)
    800029bc:	fffff097          	auipc	ra,0xfffff
    800029c0:	bbc080e7          	jalr	-1092(ra) # 80001578 <_Z8sem_waitP4_sem>
    putc('5');
    800029c4:	03500513          	li	a0,53
    800029c8:	fffff097          	auipc	ra,0xfffff
    800029cc:	c30080e7          	jalr	-976(ra) # 800015f8 <_Z4putcc>
    sem_close(sem1);
    800029d0:	0004b503          	ld	a0,0(s1)
    800029d4:	fffff097          	auipc	ra,0xfffff
    800029d8:	b78080e7          	jalr	-1160(ra) # 8000154c <_Z9sem_closeP4_sem>
    sem_close(sem2);
    800029dc:	0084b503          	ld	a0,8(s1)
    800029e0:	fffff097          	auipc	ra,0xfffff
    800029e4:	b6c080e7          	jalr	-1172(ra) # 8000154c <_Z9sem_closeP4_sem>


    putc('\n');
    800029e8:	00a00513          	li	a0,10
    800029ec:	fffff097          	auipc	ra,0xfffff
    800029f0:	c0c080e7          	jalr	-1012(ra) # 800015f8 <_Z4putcc>
    800029f4:	02813083          	ld	ra,40(sp)
    800029f8:	02013403          	ld	s0,32(sp)
    800029fc:	01813483          	ld	s1,24(sp)
    80002a00:	03010113          	addi	sp,sp,48
    80002a04:	00008067          	ret

0000000080002a08 <_ZN7_threadC1EPFvPvES0_>:
#include "syscalls_c.h"
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    80002a08:	ff010113          	addi	sp,sp,-16
    80002a0c:	00813423          	sd	s0,8(sp)
    80002a10:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80002a14:	00053023          	sd	zero,0(a0)
    80002a18:	00053423          	sd	zero,8(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80002a1c:	00007717          	auipc	a4,0x7
    80002a20:	97470713          	addi	a4,a4,-1676 # 80009390 <_ZN7_thread6nextIDE>
    80002a24:	00072783          	lw	a5,0(a4)
    80002a28:	0017869b          	addiw	a3,a5,1
    80002a2c:	00d72023          	sw	a3,0(a4)
    80002a30:	08f52c23          	sw	a5,152(a0)
    closed = 0;
    80002a34:	09c52783          	lw	a5,156(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002a38:	0015b593          	seqz	a1,a1
    80002a3c:	0045959b          	slliw	a1,a1,0x4
    80002a40:	fe07f793          	andi	a5,a5,-32
    80002a44:	00b7e7b3          	or	a5,a5,a1
    80002a48:	08f52e23          	sw	a5,156(a0)
    reserved = 0;
    80002a4c:	0a052783          	lw	a5,160(a0)
    80002a50:	f0000737          	lui	a4,0xf0000
    80002a54:	00e7f7b3          	and	a5,a5,a4
    80002a58:	0af52023          	sw	a5,160(a0)
    joinHead = 0;
    80002a5c:	06053c23          	sd	zero,120(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    80002a60:	00200793          	li	a5,2
    80002a64:	08f53423          	sd	a5,136(a0)
    stackStart = 0;
    80002a68:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    80002a6c:	00053823          	sd	zero,16(a0)
    context.s1 = 0;
    80002a70:	00053c23          	sd	zero,24(a0)
    context.s2 = 0;
    80002a74:	02053023          	sd	zero,32(a0)
    context.s3 = 0;
    80002a78:	02053423          	sd	zero,40(a0)
    context.s4 = 0;
    80002a7c:	02053823          	sd	zero,48(a0)
    context.s5 = 0;
    80002a80:	02053c23          	sd	zero,56(a0)
    context.s6 = 0;
    80002a84:	04053023          	sd	zero,64(a0)
    context.s7 = 0;
    80002a88:	04053423          	sd	zero,72(a0)
    context.s8 = 0;
    80002a8c:	04053823          	sd	zero,80(a0)
    context.s9 = 0;
    80002a90:	04053c23          	sd	zero,88(a0)
    context.s10 = 0;
    80002a94:	06053023          	sd	zero,96(a0)
    context.s11 = 0;
    80002a98:	06053423          	sd	zero,104(a0)

    context.sstatus = 0;
    80002a9c:	06053823          	sd	zero,112(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002aa0:	00000797          	auipc	a5,0x0
    80002aa4:	55878793          	addi	a5,a5,1368 # 80002ff8 <_ZN7_thread7wrapperEv>
    80002aa8:	00f53023          	sd	a5,0(a0)
}
    80002aac:	00813403          	ld	s0,8(sp)
    80002ab0:	01010113          	addi	sp,sp,16
    80002ab4:	00008067          	ret

0000000080002ab8 <_Z10popSppSpieb>:

void popSppSpie(bool kernel = false){
    80002ab8:	ff010113          	addi	sp,sp,-16
    80002abc:	00813423          	sd	s0,8(sp)
    80002ac0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002ac4:	14109073          	csrw	sepc,ra
    if(kernel){
    80002ac8:	00050e63          	beqz	a0,80002ae4 <_Z10popSppSpieb+0x2c>
        __asm__ volatile ("csrs sstatus, %0" :: "r" (1 << 8));
    80002acc:	10000793          	li	a5,256
    80002ad0:	1007a073          	csrs	sstatus,a5
    }else{
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    }
    __asm__ volatile ("sret");
    80002ad4:	10200073          	sret
}
    80002ad8:	00813403          	ld	s0,8(sp)
    80002adc:	01010113          	addi	sp,sp,16
    80002ae0:	00008067          	ret
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002ae4:	10000793          	li	a5,256
    80002ae8:	1007b073          	csrc	sstatus,a5
    80002aec:	fe9ff06f          	j	80002ad4 <_Z10popSppSpieb+0x1c>

0000000080002af0 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002af0:	fe010113          	addi	sp,sp,-32
    80002af4:	00113c23          	sd	ra,24(sp)
    80002af8:	00813823          	sd	s0,16(sp)
    80002afc:	00913423          	sd	s1,8(sp)
    80002b00:	01213023          	sd	s2,0(sp)
    80002b04:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80002b08:	07853483          	ld	s1,120(a0)
    while(current != 0){
    80002b0c:	0c048e63          	beqz	s1,80002be8 <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    80002b10:	0004c503          	lbu	a0,0(s1)
    80002b14:	0014c783          	lbu	a5,1(s1)
    80002b18:	00879793          	slli	a5,a5,0x8
    80002b1c:	00a7e7b3          	or	a5,a5,a0
    80002b20:	0024c503          	lbu	a0,2(s1)
    80002b24:	01051513          	slli	a0,a0,0x10
    80002b28:	00f567b3          	or	a5,a0,a5
    80002b2c:	0034c503          	lbu	a0,3(s1)
    80002b30:	01851513          	slli	a0,a0,0x18
    80002b34:	00f56533          	or	a0,a0,a5
    80002b38:	0044c783          	lbu	a5,4(s1)
    80002b3c:	02079793          	slli	a5,a5,0x20
    80002b40:	00a7e533          	or	a0,a5,a0
    80002b44:	0054c783          	lbu	a5,5(s1)
    80002b48:	02879793          	slli	a5,a5,0x28
    80002b4c:	00a7e7b3          	or	a5,a5,a0
    80002b50:	0064c503          	lbu	a0,6(s1)
    80002b54:	03051513          	slli	a0,a0,0x30
    80002b58:	00f567b3          	or	a5,a0,a5
    80002b5c:	0074c503          	lbu	a0,7(s1)
    80002b60:	03851513          	slli	a0,a0,0x38
    80002b64:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80002b68:	09c52783          	lw	a5,156(a0)
    80002b6c:	ffd7f793          	andi	a5,a5,-3
    80002b70:	08f52e23          	sw	a5,156(a0)
        Scheduler::put(thread);
    80002b74:	00002097          	auipc	ra,0x2
    80002b78:	0f8080e7          	jalr	248(ra) # 80004c6c <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80002b7c:	0084c903          	lbu	s2,8(s1)
    80002b80:	0094c783          	lbu	a5,9(s1)
    80002b84:	00879793          	slli	a5,a5,0x8
    80002b88:	0127e7b3          	or	a5,a5,s2
    80002b8c:	00a4c903          	lbu	s2,10(s1)
    80002b90:	01091913          	slli	s2,s2,0x10
    80002b94:	00f967b3          	or	a5,s2,a5
    80002b98:	00b4c903          	lbu	s2,11(s1)
    80002b9c:	01891913          	slli	s2,s2,0x18
    80002ba0:	00f96933          	or	s2,s2,a5
    80002ba4:	00c4c783          	lbu	a5,12(s1)
    80002ba8:	02079793          	slli	a5,a5,0x20
    80002bac:	0127e933          	or	s2,a5,s2
    80002bb0:	00d4c783          	lbu	a5,13(s1)
    80002bb4:	02879793          	slli	a5,a5,0x28
    80002bb8:	0127e7b3          	or	a5,a5,s2
    80002bbc:	00e4c903          	lbu	s2,14(s1)
    80002bc0:	03091913          	slli	s2,s2,0x30
    80002bc4:	00f967b3          	or	a5,s2,a5
    80002bc8:	00f4c903          	lbu	s2,15(s1)
    80002bcc:	03891913          	slli	s2,s2,0x38
    80002bd0:	00f96933          	or	s2,s2,a5
        mem_free(current);
    80002bd4:	00048513          	mv	a0,s1
    80002bd8:	fffff097          	auipc	ra,0xfffff
    80002bdc:	804080e7          	jalr	-2044(ra) # 800013dc <_Z8mem_freePv>
        current = next;
    80002be0:	00090493          	mv	s1,s2
    while(current != 0){
    80002be4:	f29ff06f          	j	80002b0c <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80002be8:	01813083          	ld	ra,24(sp)
    80002bec:	01013403          	ld	s0,16(sp)
    80002bf0:	00813483          	ld	s1,8(sp)
    80002bf4:	00013903          	ld	s2,0(sp)
    80002bf8:	02010113          	addi	sp,sp,32
    80002bfc:	00008067          	ret

0000000080002c00 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80002c00:	fc010113          	addi	sp,sp,-64
    80002c04:	02113c23          	sd	ra,56(sp)
    80002c08:	02813823          	sd	s0,48(sp)
    80002c0c:	02913423          	sd	s1,40(sp)
    80002c10:	03213023          	sd	s2,32(sp)
    80002c14:	01313c23          	sd	s3,24(sp)
    80002c18:	01413823          	sd	s4,16(sp)
    80002c1c:	01513423          	sd	s5,8(sp)
    80002c20:	04010413          	addi	s0,sp,64
    80002c24:	00050493          	mv	s1,a0
    80002c28:	00058913          	mv	s2,a1
    80002c2c:	00060a93          	mv	s5,a2
    80002c30:	00068993          	mv	s3,a3
    80002c34:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    80002c38:	0b800513          	li	a0,184
    80002c3c:	ffffe097          	auipc	ra,0xffffe
    80002c40:	770080e7          	jalr	1904(ra) # 800013ac <_Z9mem_allocm>
    80002c44:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80002c48:	18050063          	beqz	a0,80002dc8 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    80002c4c:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    80002c50:	0004b783          	ld	a5,0(s1)
    80002c54:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80002c58:	00006717          	auipc	a4,0x6
    80002c5c:	73870713          	addi	a4,a4,1848 # 80009390 <_ZN7_thread6nextIDE>
    80002c60:	00072783          	lw	a5,0(a4)
    80002c64:	0017869b          	addiw	a3,a5,1
    80002c68:	00d72023          	sw	a3,0(a4)
    80002c6c:	0004b703          	ld	a4,0(s1)
    80002c70:	08f72c23          	sw	a5,152(a4)
    (*thread)->closed = false;
    80002c74:	0004b703          	ld	a4,0(s1)
    80002c78:	09c72783          	lw	a5,156(a4)
    80002c7c:	ffe7f793          	andi	a5,a5,-2
    80002c80:	08f72e23          	sw	a5,156(a4)
    (*thread)->blocked = false;
    80002c84:	0004b703          	ld	a4,0(s1)
    80002c88:	09c72783          	lw	a5,156(a4)
    80002c8c:	ffd7f793          	andi	a5,a5,-3
    80002c90:	08f72e23          	sw	a5,156(a4)
    (*thread)->sleeping = false;
    80002c94:	0004b703          	ld	a4,0(s1)
    80002c98:	09c72783          	lw	a5,156(a4)
    80002c9c:	ffb7f793          	andi	a5,a5,-5
    80002ca0:	08f72e23          	sw	a5,156(a4)
    (*thread)->finished = false;
    80002ca4:	0004b703          	ld	a4,0(s1)
    80002ca8:	09c72783          	lw	a5,156(a4)
    80002cac:	ff77f793          	andi	a5,a5,-9
    80002cb0:	08f72e23          	sw	a5,156(a4)
    (*thread)->kernel = (function == 0);
    80002cb4:	0004b703          	ld	a4,0(s1)
    80002cb8:	00193913          	seqz	s2,s2
    80002cbc:	0049191b          	slliw	s2,s2,0x4
    80002cc0:	09c72783          	lw	a5,156(a4)
    80002cc4:	fef7f793          	andi	a5,a5,-17
    80002cc8:	0127e933          	or	s2,a5,s2
    80002ccc:	09272e23          	sw	s2,156(a4)
    (*thread)->reserved = 0;
    80002cd0:	0004b703          	ld	a4,0(s1)
    80002cd4:	0a072783          	lw	a5,160(a4)
    80002cd8:	f00006b7          	lui	a3,0xf0000
    80002cdc:	00d7f7b3          	and	a5,a5,a3
    80002ce0:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = 0;
    80002ce4:	0004b783          	ld	a5,0(s1)
    80002ce8:	0607bc23          	sd	zero,120(a5)
    (*thread)->joinTail = 0;
    80002cec:	0004b783          	ld	a5,0(s1)
    80002cf0:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    80002cf4:	0004b783          	ld	a5,0(s1)
    80002cf8:	00200713          	li	a4,2
    80002cfc:	08e7b423          	sd	a4,136(a5)
    (*thread)->stackStart = 0;
    80002d00:	0004b783          	ld	a5,0(s1)
    80002d04:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    80002d08:	0004b783          	ld	a5,0(s1)
    80002d0c:	0007b823          	sd	zero,16(a5)
    (*thread)->context.s1 = 0;
    80002d10:	0004b783          	ld	a5,0(s1)
    80002d14:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s2 = 0;
    80002d18:	0004b783          	ld	a5,0(s1)
    80002d1c:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s3 = 0;
    80002d20:	0004b783          	ld	a5,0(s1)
    80002d24:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s4 = 0;
    80002d28:	0004b783          	ld	a5,0(s1)
    80002d2c:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s5 = 0;
    80002d30:	0004b783          	ld	a5,0(s1)
    80002d34:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s6 = 0;
    80002d38:	0004b783          	ld	a5,0(s1)
    80002d3c:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s7 = 0;
    80002d40:	0004b783          	ld	a5,0(s1)
    80002d44:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s8 = 0;
    80002d48:	0004b783          	ld	a5,0(s1)
    80002d4c:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s9 = 0;
    80002d50:	0004b783          	ld	a5,0(s1)
    80002d54:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s10 = 0;
    80002d58:	0004b783          	ld	a5,0(s1)
    80002d5c:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s11 = 0;
    80002d60:	0004b783          	ld	a5,0(s1)
    80002d64:	0607b423          	sd	zero,104(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80002d68:	0004b783          	ld	a5,0(s1)
    80002d6c:	0137b423          	sd	s3,8(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80002d70:	0004b783          	ld	a5,0(s1)
    80002d74:	00000717          	auipc	a4,0x0
    80002d78:	28470713          	addi	a4,a4,644 # 80002ff8 <_ZN7_thread7wrapperEv>
    80002d7c:	00e7b023          	sd	a4,0(a5)

    (*thread)->stackStart = stack;
    80002d80:	0004b783          	ld	a5,0(s1)
    80002d84:	0937b823          	sd	s3,144(a5)
    if(start){
    80002d88:	020a1663          	bnez	s4,80002db4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    80002d8c:	00000513          	li	a0,0
}
    80002d90:	03813083          	ld	ra,56(sp)
    80002d94:	03013403          	ld	s0,48(sp)
    80002d98:	02813483          	ld	s1,40(sp)
    80002d9c:	02013903          	ld	s2,32(sp)
    80002da0:	01813983          	ld	s3,24(sp)
    80002da4:	01013a03          	ld	s4,16(sp)
    80002da8:	00813a83          	ld	s5,8(sp)
    80002dac:	04010113          	addi	sp,sp,64
    80002db0:	00008067          	ret
        Scheduler::put(*thread);
    80002db4:	0004b503          	ld	a0,0(s1)
    80002db8:	00002097          	auipc	ra,0x2
    80002dbc:	eb4080e7          	jalr	-332(ra) # 80004c6c <_ZN9Scheduler3putEP7_thread>
    return 0;
    80002dc0:	00000513          	li	a0,0
    80002dc4:	fcdff06f          	j	80002d90 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    80002dc8:	fff00513          	li	a0,-1
    80002dcc:	fc5ff06f          	j	80002d90 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

0000000080002dd0 <_ZN7_thread4joinEPS_>:

void _thread::join(thread_t thread){
    /// cannot join to a finished or closed thread
    if(thread->finished || thread->closed){
    80002dd0:	0985b783          	ld	a5,152(a1)
    80002dd4:	00900713          	li	a4,9
    80002dd8:	02071713          	slli	a4,a4,0x20
    80002ddc:	00e7f7b3          	and	a5,a5,a4
    80002de0:	00078463          	beqz	a5,80002de8 <_ZN7_thread4joinEPS_+0x18>
    80002de4:	00008067          	ret
void _thread::join(thread_t thread){
    80002de8:	fe010113          	addi	sp,sp,-32
    80002dec:	00113c23          	sd	ra,24(sp)
    80002df0:	00813823          	sd	s0,16(sp)
    80002df4:	00913423          	sd	s1,8(sp)
    80002df8:	01213023          	sd	s2,0(sp)
    80002dfc:	02010413          	addi	s0,sp,32
    80002e00:	00050493          	mv	s1,a0
    80002e04:	00058913          	mv	s2,a1
        return;
    }
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    80002e08:	01000513          	li	a0,16
    80002e0c:	ffffe097          	auipc	ra,0xffffe
    80002e10:	5a0080e7          	jalr	1440(ra) # 800013ac <_Z9mem_allocm>
    this->blocked = true;
    80002e14:	09c4a703          	lw	a4,156(s1)
    80002e18:	00276713          	ori	a4,a4,2
    80002e1c:	08e4ae23          	sw	a4,156(s1)
    newJoin->thread = this;
    80002e20:	00950023          	sb	s1,0(a0)
    80002e24:	0084d713          	srli	a4,s1,0x8
    80002e28:	00e500a3          	sb	a4,1(a0)
    80002e2c:	0104d713          	srli	a4,s1,0x10
    80002e30:	00e50123          	sb	a4,2(a0)
    80002e34:	0184d71b          	srliw	a4,s1,0x18
    80002e38:	00e501a3          	sb	a4,3(a0)
    80002e3c:	0204d713          	srli	a4,s1,0x20
    80002e40:	00e50223          	sb	a4,4(a0)
    80002e44:	0284d713          	srli	a4,s1,0x28
    80002e48:	00e502a3          	sb	a4,5(a0)
    80002e4c:	0304d713          	srli	a4,s1,0x30
    80002e50:	00e50323          	sb	a4,6(a0)
    80002e54:	0384d493          	srli	s1,s1,0x38
    80002e58:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80002e5c:	00050423          	sb	zero,8(a0)
    80002e60:	000504a3          	sb	zero,9(a0)
    80002e64:	00050523          	sb	zero,10(a0)
    80002e68:	000505a3          	sb	zero,11(a0)
    80002e6c:	00050623          	sb	zero,12(a0)
    80002e70:	000506a3          	sb	zero,13(a0)
    80002e74:	00050723          	sb	zero,14(a0)
    80002e78:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    80002e7c:	07893703          	ld	a4,120(s2)
    80002e80:	06070463          	beqz	a4,80002ee8 <_ZN7_thread4joinEPS_+0x118>
        thread->joinHead = newJoin;
        thread->joinTail = newJoin;
    }else{
        thread->joinTail->next = newJoin;
    80002e84:	08093703          	ld	a4,128(s2)
    80002e88:	00a70423          	sb	a0,8(a4)
    80002e8c:	00855693          	srli	a3,a0,0x8
    80002e90:	00d704a3          	sb	a3,9(a4)
    80002e94:	01055693          	srli	a3,a0,0x10
    80002e98:	00d70523          	sb	a3,10(a4)
    80002e9c:	0185569b          	srliw	a3,a0,0x18
    80002ea0:	00d705a3          	sb	a3,11(a4)
    80002ea4:	02055693          	srli	a3,a0,0x20
    80002ea8:	00d70623          	sb	a3,12(a4)
    80002eac:	02855693          	srli	a3,a0,0x28
    80002eb0:	00d706a3          	sb	a3,13(a4)
    80002eb4:	03055693          	srli	a3,a0,0x30
    80002eb8:	00d70723          	sb	a3,14(a4)
    80002ebc:	03855693          	srli	a3,a0,0x38
    80002ec0:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    80002ec4:	08a93023          	sd	a0,128(s2)
    }
    thread_dispatch();
    80002ec8:	ffffe097          	auipc	ra,0xffffe
    80002ecc:	5dc080e7          	jalr	1500(ra) # 800014a4 <_Z15thread_dispatchv>
}
    80002ed0:	01813083          	ld	ra,24(sp)
    80002ed4:	01013403          	ld	s0,16(sp)
    80002ed8:	00813483          	ld	s1,8(sp)
    80002edc:	00013903          	ld	s2,0(sp)
    80002ee0:	02010113          	addi	sp,sp,32
    80002ee4:	00008067          	ret
        thread->joinHead = newJoin;
    80002ee8:	06a93c23          	sd	a0,120(s2)
        thread->joinTail = newJoin;
    80002eec:	08a93023          	sd	a0,128(s2)
    80002ef0:	fd9ff06f          	j	80002ec8 <_ZN7_thread4joinEPS_+0xf8>

0000000080002ef4 <_ZN7_thread4tickEv>:

int _thread::tick(){
    if(currentThread->blocked){
    80002ef4:	00006797          	auipc	a5,0x6
    80002ef8:	4a47b783          	ld	a5,1188(a5) # 80009398 <_ZN7_thread13currentThreadE>
    80002efc:	09c7a783          	lw	a5,156(a5)
    80002f00:	0027f713          	andi	a4,a5,2
    80002f04:	06071063          	bnez	a4,80002f64 <_ZN7_thread4tickEv+0x70>
        return -1;
    }
    if(currentThread->closed){
    80002f08:	0017f713          	andi	a4,a5,1
    80002f0c:	06071063          	bnez	a4,80002f6c <_ZN7_thread4tickEv+0x78>
        return -2;
    }
    if(currentThread->sleeping){
    80002f10:	0047f713          	andi	a4,a5,4
    80002f14:	06071063          	bnez	a4,80002f74 <_ZN7_thread4tickEv+0x80>
        return -3;
    }
    if(currentThread->finished){
    80002f18:	0087f793          	andi	a5,a5,8
    80002f1c:	06079063          	bnez	a5,80002f7c <_ZN7_thread4tickEv+0x88>
        return -4;
    }
    timeLeft --;
    80002f20:	08853783          	ld	a5,136(a0)
    80002f24:	fff78793          	addi	a5,a5,-1
    80002f28:	08f53423          	sd	a5,136(a0)
    if(timeLeft == 0){
    80002f2c:	00078663          	beqz	a5,80002f38 <_ZN7_thread4tickEv+0x44>
        thread_dispatch();
    }
    return 0;
    80002f30:	00000513          	li	a0,0
}
    80002f34:	00008067          	ret
int _thread::tick(){
    80002f38:	ff010113          	addi	sp,sp,-16
    80002f3c:	00113423          	sd	ra,8(sp)
    80002f40:	00813023          	sd	s0,0(sp)
    80002f44:	01010413          	addi	s0,sp,16
        thread_dispatch();
    80002f48:	ffffe097          	auipc	ra,0xffffe
    80002f4c:	55c080e7          	jalr	1372(ra) # 800014a4 <_Z15thread_dispatchv>
    return 0;
    80002f50:	00000513          	li	a0,0
}
    80002f54:	00813083          	ld	ra,8(sp)
    80002f58:	00013403          	ld	s0,0(sp)
    80002f5c:	01010113          	addi	sp,sp,16
    80002f60:	00008067          	ret
        return -1;
    80002f64:	fff00513          	li	a0,-1
    80002f68:	00008067          	ret
        return -2;
    80002f6c:	ffe00513          	li	a0,-2
    80002f70:	00008067          	ret
        return -3;
    80002f74:	ffd00513          	li	a0,-3
    80002f78:	00008067          	ret
        return -4;
    80002f7c:	ffc00513          	li	a0,-4
    80002f80:	00008067          	ret

0000000080002f84 <_ZN7_thread4exitEv>:

int _thread::exit(){
    if(currentThread->closed){
    80002f84:	00006717          	auipc	a4,0x6
    80002f88:	41473703          	ld	a4,1044(a4) # 80009398 <_ZN7_thread13currentThreadE>
    80002f8c:	09c72783          	lw	a5,156(a4)
    80002f90:	0017f693          	andi	a3,a5,1
    80002f94:	04069663          	bnez	a3,80002fe0 <_ZN7_thread4exitEv+0x5c>
        return -1;
    }
    if(currentThread->blocked){
    80002f98:	0027f693          	andi	a3,a5,2
    80002f9c:	04069663          	bnez	a3,80002fe8 <_ZN7_thread4exitEv+0x64>
        return -2;
    }
    if(currentThread->sleeping){
    80002fa0:	0047f793          	andi	a5,a5,4
    80002fa4:	04079663          	bnez	a5,80002ff0 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    80002fa8:	ff010113          	addi	sp,sp,-16
    80002fac:	00113423          	sd	ra,8(sp)
    80002fb0:	00813023          	sd	s0,0(sp)
    80002fb4:	01010413          	addi	s0,sp,16
        return -3;
    }
    currentThread->finished = 1;
    80002fb8:	09c72783          	lw	a5,156(a4)
    80002fbc:	0087e793          	ori	a5,a5,8
    80002fc0:	08f72e23          	sw	a5,156(a4)
    thread_dispatch();
    80002fc4:	ffffe097          	auipc	ra,0xffffe
    80002fc8:	4e0080e7          	jalr	1248(ra) # 800014a4 <_Z15thread_dispatchv>
    return 0;
    80002fcc:	00000513          	li	a0,0
}
    80002fd0:	00813083          	ld	ra,8(sp)
    80002fd4:	00013403          	ld	s0,0(sp)
    80002fd8:	01010113          	addi	sp,sp,16
    80002fdc:	00008067          	ret
        return -1;
    80002fe0:	fff00513          	li	a0,-1
    80002fe4:	00008067          	ret
        return -2;
    80002fe8:	ffe00513          	li	a0,-2
    80002fec:	00008067          	ret
        return -3;
    80002ff0:	ffd00513          	li	a0,-3
}
    80002ff4:	00008067          	ret

0000000080002ff8 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80002ff8:	fe010113          	addi	sp,sp,-32
    80002ffc:	00113c23          	sd	ra,24(sp)
    80003000:	00813823          	sd	s0,16(sp)
    80003004:	00913423          	sd	s1,8(sp)
    80003008:	02010413          	addi	s0,sp,32
    popSppSpie(currentThread->kernel);
    8000300c:	00006497          	auipc	s1,0x6
    80003010:	38448493          	addi	s1,s1,900 # 80009390 <_ZN7_thread6nextIDE>
    80003014:	0084b783          	ld	a5,8(s1)
    80003018:	09c7a503          	lw	a0,156(a5)
    8000301c:	4045551b          	sraiw	a0,a0,0x4
    80003020:	00157513          	andi	a0,a0,1
    80003024:	00000097          	auipc	ra,0x0
    80003028:	a94080e7          	jalr	-1388(ra) # 80002ab8 <_Z10popSppSpieb>
    currentThread->function(currentThread->arg);
    8000302c:	0084b783          	ld	a5,8(s1)
    80003030:	0a87b703          	ld	a4,168(a5)
    80003034:	0b07b503          	ld	a0,176(a5)
    80003038:	000700e7          	jalr	a4
    currentThread->unJoin();
    8000303c:	0084b503          	ld	a0,8(s1)
    80003040:	00000097          	auipc	ra,0x0
    80003044:	ab0080e7          	jalr	-1360(ra) # 80002af0 <_ZN7_thread6unJoinEv>
    exit();
    80003048:	00000097          	auipc	ra,0x0
    8000304c:	f3c080e7          	jalr	-196(ra) # 80002f84 <_ZN7_thread4exitEv>
}
    80003050:	01813083          	ld	ra,24(sp)
    80003054:	01013403          	ld	s0,16(sp)
    80003058:	00813483          	ld	s1,8(sp)
    8000305c:	02010113          	addi	sp,sp,32
    80003060:	00008067          	ret

0000000080003064 <_ZN7_thread10setBlockedEb>:

void _thread::setBlocked(bool blocked){
    80003064:	ff010113          	addi	sp,sp,-16
    80003068:	00813423          	sd	s0,8(sp)
    8000306c:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80003070:	0015f593          	andi	a1,a1,1
    80003074:	0015979b          	slliw	a5,a1,0x1
    80003078:	09c52583          	lw	a1,156(a0)
    8000307c:	ffd5f593          	andi	a1,a1,-3
    80003080:	00f5e5b3          	or	a1,a1,a5
    80003084:	08b52e23          	sw	a1,156(a0)
}
    80003088:	00813403          	ld	s0,8(sp)
    8000308c:	01010113          	addi	sp,sp,16
    80003090:	00008067          	ret

0000000080003094 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80003094:	ff010113          	addi	sp,sp,-16
    80003098:	00813423          	sd	s0,8(sp)
    8000309c:	01010413          	addi	s0,sp,16
    this->closed = closed;
    800030a0:	0015f793          	andi	a5,a1,1
    800030a4:	09c52583          	lw	a1,156(a0)
    800030a8:	ffe5f593          	andi	a1,a1,-2
    800030ac:	00f5e5b3          	or	a1,a1,a5
    800030b0:	08b52e23          	sw	a1,156(a0)
}
    800030b4:	00813403          	ld	s0,8(sp)
    800030b8:	01010113          	addi	sp,sp,16
    800030bc:	00008067          	ret

00000000800030c0 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    800030c0:	ff010113          	addi	sp,sp,-16
    800030c4:	00813423          	sd	s0,8(sp)
    800030c8:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    800030cc:	0015f593          	andi	a1,a1,1
    800030d0:	0025979b          	slliw	a5,a1,0x2
    800030d4:	09c52583          	lw	a1,156(a0)
    800030d8:	ffb5f593          	andi	a1,a1,-5
    800030dc:	00f5e5b3          	or	a1,a1,a5
    800030e0:	08b52e23          	sw	a1,156(a0)
}
    800030e4:	00813403          	ld	s0,8(sp)
    800030e8:	01010113          	addi	sp,sp,16
    800030ec:	00008067          	ret

00000000800030f0 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
        Scheduler::put(oldThread);
    }
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    800030f0:	ff010113          	addi	sp,sp,-16
    800030f4:	00813423          	sd	s0,8(sp)
    800030f8:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    800030fc:	04050263          	beqz	a0,80003140 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    80003100:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    80003104:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    80003108:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    8000310c:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    80003110:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    80003114:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    80003118:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    8000311c:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    80003120:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    80003124:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    80003128:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    8000312c:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    80003130:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    80003134:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80003138:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    8000313c:	06853823          	sd	s0,112(a0)
    }
    
    
    if(newContext->sp != 0){
    80003140:	0085b783          	ld	a5,8(a1)
    80003144:	00078463          	beqz	a5,8000314c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    80003148:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    8000314c:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    80003150:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    80003154:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80003158:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    8000315c:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80003160:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80003164:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80003168:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    8000316c:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80003170:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80003174:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    80003178:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    8000317c:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    80003180:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    80003184:	0685bd83          	ld	s11,104(a1)

    return;

}
    80003188:	00813403          	ld	s0,8(sp)
    8000318c:	01010113          	addi	sp,sp,16
    80003190:	00008067          	ret

0000000080003194 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80003194:	fe010113          	addi	sp,sp,-32
    80003198:	00113c23          	sd	ra,24(sp)
    8000319c:	00813823          	sd	s0,16(sp)
    800031a0:	00913423          	sd	s1,8(sp)
    800031a4:	01213023          	sd	s2,0(sp)
    800031a8:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    800031ac:	00006917          	auipc	s2,0x6
    800031b0:	1e490913          	addi	s2,s2,484 # 80009390 <_ZN7_thread6nextIDE>
    800031b4:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    800031b8:	00002097          	auipc	ra,0x2
    800031bc:	ca4080e7          	jalr	-860(ra) # 80004e5c <_ZN9Scheduler3getEv>
    800031c0:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    800031c4:	00200793          	li	a5,2
    800031c8:	08f4b423          	sd	a5,136(s1)
    if(currentThread == 0){
    800031cc:	04050463          	beqz	a0,80003214 <_ZN7_thread8dispatchEv+0x80>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    800031d0:	00048c63          	beqz	s1,800031e8 <_ZN7_thread8dispatchEv+0x54>
    800031d4:	0984b783          	ld	a5,152(s1)
    800031d8:	00f00713          	li	a4,15
    800031dc:	02071713          	slli	a4,a4,0x20
    800031e0:	00e7f7b3          	and	a5,a5,a4
    800031e4:	02078e63          	beqz	a5,80003220 <_ZN7_thread8dispatchEv+0x8c>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    800031e8:	00006597          	auipc	a1,0x6
    800031ec:	1b05b583          	ld	a1,432(a1) # 80009398 <_ZN7_thread13currentThreadE>
    800031f0:	00048513          	mv	a0,s1
    800031f4:	00000097          	auipc	ra,0x0
    800031f8:	efc080e7          	jalr	-260(ra) # 800030f0 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    800031fc:	01813083          	ld	ra,24(sp)
    80003200:	01013403          	ld	s0,16(sp)
    80003204:	00813483          	ld	s1,8(sp)
    80003208:	00013903          	ld	s2,0(sp)
    8000320c:	02010113          	addi	sp,sp,32
    80003210:	00008067          	ret
        currentThread = oldThread;
    80003214:	00006797          	auipc	a5,0x6
    80003218:	1897b223          	sd	s1,388(a5) # 80009398 <_ZN7_thread13currentThreadE>
        return;
    8000321c:	fe1ff06f          	j	800031fc <_ZN7_thread8dispatchEv+0x68>
        Scheduler::put(oldThread);
    80003220:	00048513          	mv	a0,s1
    80003224:	00002097          	auipc	ra,0x2
    80003228:	a48080e7          	jalr	-1464(ra) # 80004c6c <_ZN9Scheduler3putEP7_thread>
    8000322c:	fbdff06f          	j	800031e8 <_ZN7_thread8dispatchEv+0x54>

0000000080003230 <_ZN11HeapManagerC1Ev>:
#include "heapManager.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80003230:	fe010113          	addi	sp,sp,-32
    80003234:	00113c23          	sd	ra,24(sp)
    80003238:	00813823          	sd	s0,16(sp)
    8000323c:	00913423          	sd	s1,8(sp)
    80003240:	02010413          	addi	s0,sp,32
    80003244:	00050493          	mv	s1,a0
    assert(instance == 0);
    80003248:	00006797          	auipc	a5,0x6
    8000324c:	1587b783          	ld	a5,344(a5) # 800093a0 <_ZN11HeapManager8instanceE>
    80003250:	02079063          	bnez	a5,80003270 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80003254:	00006797          	auipc	a5,0x6
    80003258:	1497b623          	sd	s1,332(a5) # 800093a0 <_ZN11HeapManager8instanceE>
}
    8000325c:	01813083          	ld	ra,24(sp)
    80003260:	01013403          	ld	s0,16(sp)
    80003264:	00813483          	ld	s1,8(sp)
    80003268:	02010113          	addi	sp,sp,32
    8000326c:	00008067          	ret
    assert(instance == 0);
    80003270:	00005697          	auipc	a3,0x5
    80003274:	f0868693          	addi	a3,a3,-248 # 80008178 <CONSOLE_STATUS+0x168>
    80003278:	01200613          	li	a2,18
    8000327c:	00005597          	auipc	a1,0x5
    80003280:	f1c58593          	addi	a1,a1,-228 # 80008198 <CONSOLE_STATUS+0x188>
    80003284:	00005517          	auipc	a0,0x5
    80003288:	dbc50513          	addi	a0,a0,-580 # 80008040 <CONSOLE_STATUS+0x30>
    8000328c:	fffff097          	auipc	ra,0xfffff
    80003290:	8b0080e7          	jalr	-1872(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    80003294:	fc1ff06f          	j	80003254 <_ZN11HeapManagerC1Ev+0x24>

0000000080003298 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80003298:	ff010113          	addi	sp,sp,-16
    8000329c:	00813423          	sd	s0,8(sp)
    800032a0:	01010413          	addi	s0,sp,16
    
}
    800032a4:	00813403          	ld	s0,8(sp)
    800032a8:	01010113          	addi	sp,sp,16
    800032ac:	00008067          	ret

00000000800032b0 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uint64 nStart, size_t nEnd){
    800032b0:	fd010113          	addi	sp,sp,-48
    800032b4:	02113423          	sd	ra,40(sp)
    800032b8:	02813023          	sd	s0,32(sp)
    800032bc:	00913c23          	sd	s1,24(sp)
    800032c0:	01213823          	sd	s2,16(sp)
    800032c4:	01313423          	sd	s3,8(sp)
    800032c8:	03010413          	addi	s0,sp,48
    800032cc:	00050993          	mv	s3,a0
    800032d0:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    800032d4:	40b604b3          	sub	s1,a2,a1
    800032d8:	0414b793          	sltiu	a5,s1,65
    800032dc:	0c079863          	bnez	a5,800033ac <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    800032e0:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    800032e4:	fde00793          	li	a5,-34
    800032e8:	00f90c23          	sb	a5,24(s2)
    800032ec:	fc000713          	li	a4,-64
    800032f0:	00e90ca3          	sb	a4,25(s2)
    800032f4:	fad00713          	li	a4,-83
    800032f8:	00e90d23          	sb	a4,26(s2)
    800032fc:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    80003300:	0064d613          	srli	a2,s1,0x6
    80003304:	0009b783          	ld	a5,0(s3)
    80003308:	fff60613          	addi	a2,a2,-1
    8000330c:	00c78823          	sb	a2,16(a5)
    80003310:	00865713          	srli	a4,a2,0x8
    80003314:	00e788a3          	sb	a4,17(a5)
    80003318:	01065713          	srli	a4,a2,0x10
    8000331c:	00e78923          	sb	a4,18(a5)
    80003320:	0186571b          	srliw	a4,a2,0x18
    80003324:	00e789a3          	sb	a4,19(a5)
    80003328:	02065713          	srli	a4,a2,0x20
    8000332c:	00e78a23          	sb	a4,20(a5)
    80003330:	02865713          	srli	a4,a2,0x28
    80003334:	00e78aa3          	sb	a4,21(a5)
    80003338:	03065713          	srli	a4,a2,0x30
    8000333c:	00e78b23          	sb	a4,22(a5)
    80003340:	03865613          	srli	a2,a2,0x38
    80003344:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80003348:	0009b783          	ld	a5,0(s3)
    8000334c:	00078023          	sb	zero,0(a5)
    80003350:	000780a3          	sb	zero,1(a5)
    80003354:	00078123          	sb	zero,2(a5)
    80003358:	000781a3          	sb	zero,3(a5)
    8000335c:	00078223          	sb	zero,4(a5)
    80003360:	000782a3          	sb	zero,5(a5)
    80003364:	00078323          	sb	zero,6(a5)
    80003368:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    8000336c:	0009b783          	ld	a5,0(s3)
    80003370:	00078423          	sb	zero,8(a5)
    80003374:	000784a3          	sb	zero,9(a5)
    80003378:	00078523          	sb	zero,10(a5)
    8000337c:	000785a3          	sb	zero,11(a5)
    80003380:	00078623          	sb	zero,12(a5)
    80003384:	000786a3          	sb	zero,13(a5)
    80003388:	00078723          	sb	zero,14(a5)
    8000338c:	000787a3          	sb	zero,15(a5)
}
    80003390:	02813083          	ld	ra,40(sp)
    80003394:	02013403          	ld	s0,32(sp)
    80003398:	01813483          	ld	s1,24(sp)
    8000339c:	01013903          	ld	s2,16(sp)
    800033a0:	00813983          	ld	s3,8(sp)
    800033a4:	03010113          	addi	sp,sp,48
    800033a8:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    800033ac:	00005697          	auipc	a3,0x5
    800033b0:	e0468693          	addi	a3,a3,-508 # 800081b0 <CONSOLE_STATUS+0x1a0>
    800033b4:	01b00613          	li	a2,27
    800033b8:	00005597          	auipc	a1,0x5
    800033bc:	de058593          	addi	a1,a1,-544 # 80008198 <CONSOLE_STATUS+0x188>
    800033c0:	00005517          	auipc	a0,0x5
    800033c4:	e1850513          	addi	a0,a0,-488 # 800081d8 <CONSOLE_STATUS+0x1c8>
    800033c8:	ffffe097          	auipc	ra,0xffffe
    800033cc:	774080e7          	jalr	1908(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    800033d0:	f11ff06f          	j	800032e0 <_ZN11HeapManager4initEmm+0x30>

00000000800033d4 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    800033d4:	fe010113          	addi	sp,sp,-32
    800033d8:	00113c23          	sd	ra,24(sp)
    800033dc:	00813823          	sd	s0,16(sp)
    800033e0:	00913423          	sd	s1,8(sp)
    800033e4:	01213023          	sd	s2,0(sp)
    800033e8:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    800033ec:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    800033f0:	00000913          	li	s2,0
    800033f4:	0b80006f          	j	800034ac <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    800033f8:	0104c783          	lbu	a5,16(s1)
    800033fc:	0114c703          	lbu	a4,17(s1)
    80003400:	00871713          	slli	a4,a4,0x8
    80003404:	00f76733          	or	a4,a4,a5
    80003408:	0124c783          	lbu	a5,18(s1)
    8000340c:	01079793          	slli	a5,a5,0x10
    80003410:	00e7e733          	or	a4,a5,a4
    80003414:	0134c783          	lbu	a5,19(s1)
    80003418:	01879793          	slli	a5,a5,0x18
    8000341c:	00e7e7b3          	or	a5,a5,a4
    80003420:	0144c703          	lbu	a4,20(s1)
    80003424:	02071713          	slli	a4,a4,0x20
    80003428:	00f767b3          	or	a5,a4,a5
    8000342c:	0154c703          	lbu	a4,21(s1)
    80003430:	02871713          	slli	a4,a4,0x28
    80003434:	00f76733          	or	a4,a4,a5
    80003438:	0164c783          	lbu	a5,22(s1)
    8000343c:	03079793          	slli	a5,a5,0x30
    80003440:	00e7e733          	or	a4,a5,a4
    80003444:	0174c783          	lbu	a5,23(s1)
    80003448:	03879793          	slli	a5,a5,0x38
    8000344c:	00e7e7b3          	or	a5,a5,a4
    80003450:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80003454:	0004c703          	lbu	a4,0(s1)
    80003458:	0014c783          	lbu	a5,1(s1)
    8000345c:	00879793          	slli	a5,a5,0x8
    80003460:	00e7e733          	or	a4,a5,a4
    80003464:	0024c783          	lbu	a5,2(s1)
    80003468:	01079793          	slli	a5,a5,0x10
    8000346c:	00e7e7b3          	or	a5,a5,a4
    80003470:	0034c703          	lbu	a4,3(s1)
    80003474:	01871713          	slli	a4,a4,0x18
    80003478:	00f767b3          	or	a5,a4,a5
    8000347c:	0044c703          	lbu	a4,4(s1)
    80003480:	02071713          	slli	a4,a4,0x20
    80003484:	00f76733          	or	a4,a4,a5
    80003488:	0054c783          	lbu	a5,5(s1)
    8000348c:	02879793          	slli	a5,a5,0x28
    80003490:	00e7e733          	or	a4,a5,a4
    80003494:	0064c783          	lbu	a5,6(s1)
    80003498:	03079793          	slli	a5,a5,0x30
    8000349c:	00e7e7b3          	or	a5,a5,a4
    800034a0:	0074c483          	lbu	s1,7(s1)
    800034a4:	03849493          	slli	s1,s1,0x38
    800034a8:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    800034ac:	06048263          	beqz	s1,80003510 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    800034b0:	0184c783          	lbu	a5,24(s1)
    800034b4:	0194c703          	lbu	a4,25(s1)
    800034b8:	00871713          	slli	a4,a4,0x8
    800034bc:	00f76733          	or	a4,a4,a5
    800034c0:	01a4c783          	lbu	a5,26(s1)
    800034c4:	01079793          	slli	a5,a5,0x10
    800034c8:	00e7e733          	or	a4,a5,a4
    800034cc:	01b4c783          	lbu	a5,27(s1)
    800034d0:	01879793          	slli	a5,a5,0x18
    800034d4:	00e7e7b3          	or	a5,a5,a4
    800034d8:	0007879b          	sext.w	a5,a5
    800034dc:	deadc737          	lui	a4,0xdeadc
    800034e0:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead1ace>
    800034e4:	f0e78ae3          	beq	a5,a4,800033f8 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    800034e8:	00005697          	auipc	a3,0x5
    800034ec:	d1068693          	addi	a3,a3,-752 # 800081f8 <CONSOLE_STATUS+0x1e8>
    800034f0:	02800613          	li	a2,40
    800034f4:	00005597          	auipc	a1,0x5
    800034f8:	ca458593          	addi	a1,a1,-860 # 80008198 <CONSOLE_STATUS+0x188>
    800034fc:	00005517          	auipc	a0,0x5
    80003500:	d2450513          	addi	a0,a0,-732 # 80008220 <CONSOLE_STATUS+0x210>
    80003504:	ffffe097          	auipc	ra,0xffffe
    80003508:	638080e7          	jalr	1592(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    8000350c:	eedff06f          	j	800033f8 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80003510:	00090513          	mv	a0,s2
    80003514:	01813083          	ld	ra,24(sp)
    80003518:	01013403          	ld	s0,16(sp)
    8000351c:	00813483          	ld	s1,8(sp)
    80003520:	00013903          	ld	s2,0(sp)
    80003524:	02010113          	addi	sp,sp,32
    80003528:	00008067          	ret

000000008000352c <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    8000352c:	fd010113          	addi	sp,sp,-48
    80003530:	02113423          	sd	ra,40(sp)
    80003534:	02813023          	sd	s0,32(sp)
    80003538:	00913c23          	sd	s1,24(sp)
    8000353c:	01213823          	sd	s2,16(sp)
    80003540:	01313423          	sd	s3,8(sp)
    80003544:	03010413          	addi	s0,sp,48
    80003548:	00050993          	mv	s3,a0
    8000354c:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003550:	00053483          	ld	s1,0(a0)
    80003554:	0b80006f          	j	8000360c <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80003558:	0104c783          	lbu	a5,16(s1)
    8000355c:	0114c703          	lbu	a4,17(s1)
    80003560:	00871713          	slli	a4,a4,0x8
    80003564:	00f76733          	or	a4,a4,a5
    80003568:	0124c783          	lbu	a5,18(s1)
    8000356c:	01079793          	slli	a5,a5,0x10
    80003570:	00e7e733          	or	a4,a5,a4
    80003574:	0134c783          	lbu	a5,19(s1)
    80003578:	01879793          	slli	a5,a5,0x18
    8000357c:	00e7e7b3          	or	a5,a5,a4
    80003580:	0144c703          	lbu	a4,20(s1)
    80003584:	02071713          	slli	a4,a4,0x20
    80003588:	00f767b3          	or	a5,a4,a5
    8000358c:	0154c703          	lbu	a4,21(s1)
    80003590:	02871713          	slli	a4,a4,0x28
    80003594:	00f76733          	or	a4,a4,a5
    80003598:	0164c783          	lbu	a5,22(s1)
    8000359c:	03079793          	slli	a5,a5,0x30
    800035a0:	00e7e733          	or	a4,a5,a4
    800035a4:	0174c783          	lbu	a5,23(s1)
    800035a8:	03879793          	slli	a5,a5,0x38
    800035ac:	00e7e7b3          	or	a5,a5,a4
    800035b0:	0d27f063          	bgeu	a5,s2,80003670 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    800035b4:	0004c703          	lbu	a4,0(s1)
    800035b8:	0014c783          	lbu	a5,1(s1)
    800035bc:	00879793          	slli	a5,a5,0x8
    800035c0:	00e7e733          	or	a4,a5,a4
    800035c4:	0024c783          	lbu	a5,2(s1)
    800035c8:	01079793          	slli	a5,a5,0x10
    800035cc:	00e7e7b3          	or	a5,a5,a4
    800035d0:	0034c703          	lbu	a4,3(s1)
    800035d4:	01871713          	slli	a4,a4,0x18
    800035d8:	00f767b3          	or	a5,a4,a5
    800035dc:	0044c703          	lbu	a4,4(s1)
    800035e0:	02071713          	slli	a4,a4,0x20
    800035e4:	00f76733          	or	a4,a4,a5
    800035e8:	0054c783          	lbu	a5,5(s1)
    800035ec:	02879793          	slli	a5,a5,0x28
    800035f0:	00e7e733          	or	a4,a5,a4
    800035f4:	0064c783          	lbu	a5,6(s1)
    800035f8:	03079793          	slli	a5,a5,0x30
    800035fc:	00e7e7b3          	or	a5,a5,a4
    80003600:	0074c483          	lbu	s1,7(s1)
    80003604:	03849493          	slli	s1,s1,0x38
    80003608:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    8000360c:	4e048c63          	beqz	s1,80003b04 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003610:	0184c783          	lbu	a5,24(s1)
    80003614:	0194c703          	lbu	a4,25(s1)
    80003618:	00871713          	slli	a4,a4,0x8
    8000361c:	00f76733          	or	a4,a4,a5
    80003620:	01a4c783          	lbu	a5,26(s1)
    80003624:	01079793          	slli	a5,a5,0x10
    80003628:	00e7e733          	or	a4,a5,a4
    8000362c:	01b4c783          	lbu	a5,27(s1)
    80003630:	01879793          	slli	a5,a5,0x18
    80003634:	00e7e7b3          	or	a5,a5,a4
    80003638:	0007879b          	sext.w	a5,a5
    8000363c:	deadc737          	lui	a4,0xdeadc
    80003640:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead1ace>
    80003644:	f0e78ae3          	beq	a5,a4,80003558 <_ZN11HeapManager12heapAllocateEm+0x2c>
    80003648:	00005697          	auipc	a3,0x5
    8000364c:	c0068693          	addi	a3,a3,-1024 # 80008248 <CONSOLE_STATUS+0x238>
    80003650:	03200613          	li	a2,50
    80003654:	00005597          	auipc	a1,0x5
    80003658:	b4458593          	addi	a1,a1,-1212 # 80008198 <CONSOLE_STATUS+0x188>
    8000365c:	00005517          	auipc	a0,0x5
    80003660:	bc450513          	addi	a0,a0,-1084 # 80008220 <CONSOLE_STATUS+0x210>
    80003664:	ffffe097          	auipc	ra,0xffffe
    80003668:	4d8080e7          	jalr	1240(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    8000366c:	eedff06f          	j	80003558 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80003670:	00190713          	addi	a4,s2,1
    80003674:	2af77263          	bgeu	a4,a5,80003918 <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80003678:	00671793          	slli	a5,a4,0x6
    8000367c:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80003680:	fde00713          	li	a4,-34
    80003684:	00e78c23          	sb	a4,24(a5)
    80003688:	fc000693          	li	a3,-64
    8000368c:	00d78ca3          	sb	a3,25(a5)
    80003690:	fad00693          	li	a3,-83
    80003694:	00d78d23          	sb	a3,26(a5)
    80003698:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    8000369c:	0104c703          	lbu	a4,16(s1)
    800036a0:	0114c683          	lbu	a3,17(s1)
    800036a4:	00869693          	slli	a3,a3,0x8
    800036a8:	00e6e6b3          	or	a3,a3,a4
    800036ac:	0124c703          	lbu	a4,18(s1)
    800036b0:	01071713          	slli	a4,a4,0x10
    800036b4:	00d766b3          	or	a3,a4,a3
    800036b8:	0134c703          	lbu	a4,19(s1)
    800036bc:	01871713          	slli	a4,a4,0x18
    800036c0:	00d76733          	or	a4,a4,a3
    800036c4:	0144c683          	lbu	a3,20(s1)
    800036c8:	02069693          	slli	a3,a3,0x20
    800036cc:	00e6e733          	or	a4,a3,a4
    800036d0:	0154c683          	lbu	a3,21(s1)
    800036d4:	02869693          	slli	a3,a3,0x28
    800036d8:	00e6e6b3          	or	a3,a3,a4
    800036dc:	0164c703          	lbu	a4,22(s1)
    800036e0:	03071713          	slli	a4,a4,0x30
    800036e4:	00d766b3          	or	a3,a4,a3
    800036e8:	0174c703          	lbu	a4,23(s1)
    800036ec:	03871713          	slli	a4,a4,0x38
    800036f0:	00d76733          	or	a4,a4,a3
    800036f4:	41270733          	sub	a4,a4,s2
    800036f8:	fff70713          	addi	a4,a4,-1
    800036fc:	00e78823          	sb	a4,16(a5)
    80003700:	00875693          	srli	a3,a4,0x8
    80003704:	00d788a3          	sb	a3,17(a5)
    80003708:	01075693          	srli	a3,a4,0x10
    8000370c:	00d78923          	sb	a3,18(a5)
    80003710:	0187569b          	srliw	a3,a4,0x18
    80003714:	00d789a3          	sb	a3,19(a5)
    80003718:	02075693          	srli	a3,a4,0x20
    8000371c:	00d78a23          	sb	a3,20(a5)
    80003720:	02875693          	srli	a3,a4,0x28
    80003724:	00d78aa3          	sb	a3,21(a5)
    80003728:	03075693          	srli	a3,a4,0x30
    8000372c:	00d78b23          	sb	a3,22(a5)
    80003730:	03875713          	srli	a4,a4,0x38
    80003734:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80003738:	0004c703          	lbu	a4,0(s1)
    8000373c:	0014c683          	lbu	a3,1(s1)
    80003740:	00869693          	slli	a3,a3,0x8
    80003744:	00e6e733          	or	a4,a3,a4
    80003748:	0024c683          	lbu	a3,2(s1)
    8000374c:	01069693          	slli	a3,a3,0x10
    80003750:	00e6e6b3          	or	a3,a3,a4
    80003754:	0034c703          	lbu	a4,3(s1)
    80003758:	01871713          	slli	a4,a4,0x18
    8000375c:	00d766b3          	or	a3,a4,a3
    80003760:	0044c703          	lbu	a4,4(s1)
    80003764:	02071713          	slli	a4,a4,0x20
    80003768:	00d76733          	or	a4,a4,a3
    8000376c:	0054c683          	lbu	a3,5(s1)
    80003770:	02869693          	slli	a3,a3,0x28
    80003774:	00e6e733          	or	a4,a3,a4
    80003778:	0064c683          	lbu	a3,6(s1)
    8000377c:	03069693          	slli	a3,a3,0x30
    80003780:	00e6e6b3          	or	a3,a3,a4
    80003784:	0074c703          	lbu	a4,7(s1)
    80003788:	03871713          	slli	a4,a4,0x38
    8000378c:	00d76733          	or	a4,a4,a3
    80003790:	00d78023          	sb	a3,0(a5)
    80003794:	00875693          	srli	a3,a4,0x8
    80003798:	00d780a3          	sb	a3,1(a5)
    8000379c:	01075693          	srli	a3,a4,0x10
    800037a0:	00d78123          	sb	a3,2(a5)
    800037a4:	0187569b          	srliw	a3,a4,0x18
    800037a8:	00d781a3          	sb	a3,3(a5)
    800037ac:	02075693          	srli	a3,a4,0x20
    800037b0:	00d78223          	sb	a3,4(a5)
    800037b4:	02875693          	srli	a3,a4,0x28
    800037b8:	00d782a3          	sb	a3,5(a5)
    800037bc:	03075693          	srli	a3,a4,0x30
    800037c0:	00d78323          	sb	a3,6(a5)
    800037c4:	03875713          	srli	a4,a4,0x38
    800037c8:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    800037cc:	00978423          	sb	s1,8(a5)
    800037d0:	0084d713          	srli	a4,s1,0x8
    800037d4:	00e784a3          	sb	a4,9(a5)
    800037d8:	0104d713          	srli	a4,s1,0x10
    800037dc:	00e78523          	sb	a4,10(a5)
    800037e0:	0184d71b          	srliw	a4,s1,0x18
    800037e4:	00e785a3          	sb	a4,11(a5)
    800037e8:	0204d713          	srli	a4,s1,0x20
    800037ec:	00e78623          	sb	a4,12(a5)
    800037f0:	0284d713          	srli	a4,s1,0x28
    800037f4:	00e786a3          	sb	a4,13(a5)
    800037f8:	0304d713          	srli	a4,s1,0x30
    800037fc:	00e78723          	sb	a4,14(a5)
    80003800:	0384d713          	srli	a4,s1,0x38
    80003804:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    80003808:	0004c703          	lbu	a4,0(s1)
    8000380c:	0014c683          	lbu	a3,1(s1)
    80003810:	00869693          	slli	a3,a3,0x8
    80003814:	00e6e6b3          	or	a3,a3,a4
    80003818:	0024c703          	lbu	a4,2(s1)
    8000381c:	01071713          	slli	a4,a4,0x10
    80003820:	00d766b3          	or	a3,a4,a3
    80003824:	0034c703          	lbu	a4,3(s1)
    80003828:	01871713          	slli	a4,a4,0x18
    8000382c:	00d76733          	or	a4,a4,a3
    80003830:	0044c683          	lbu	a3,4(s1)
    80003834:	02069693          	slli	a3,a3,0x20
    80003838:	00e6e733          	or	a4,a3,a4
    8000383c:	0054c683          	lbu	a3,5(s1)
    80003840:	02869693          	slli	a3,a3,0x28
    80003844:	00e6e6b3          	or	a3,a3,a4
    80003848:	0064c703          	lbu	a4,6(s1)
    8000384c:	03071713          	slli	a4,a4,0x30
    80003850:	00d766b3          	or	a3,a4,a3
    80003854:	0074c703          	lbu	a4,7(s1)
    80003858:	03871713          	slli	a4,a4,0x38
    8000385c:	00d76733          	or	a4,a4,a3
    80003860:	04070063          	beqz	a4,800038a0 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003864:	00f70423          	sb	a5,8(a4)
    80003868:	0087d693          	srli	a3,a5,0x8
    8000386c:	00d704a3          	sb	a3,9(a4)
    80003870:	0107d693          	srli	a3,a5,0x10
    80003874:	00d70523          	sb	a3,10(a4)
    80003878:	0187d69b          	srliw	a3,a5,0x18
    8000387c:	00d705a3          	sb	a3,11(a4)
    80003880:	0207d693          	srli	a3,a5,0x20
    80003884:	00d70623          	sb	a3,12(a4)
    80003888:	0287d693          	srli	a3,a5,0x28
    8000388c:	00d706a3          	sb	a3,13(a4)
    80003890:	0307d693          	srli	a3,a5,0x30
    80003894:	00d70723          	sb	a3,14(a4)
    80003898:	0387d693          	srli	a3,a5,0x38
    8000389c:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    800038a0:	00f48023          	sb	a5,0(s1)
    800038a4:	0087d713          	srli	a4,a5,0x8
    800038a8:	00e480a3          	sb	a4,1(s1)
    800038ac:	0107d713          	srli	a4,a5,0x10
    800038b0:	00e48123          	sb	a4,2(s1)
    800038b4:	0187d71b          	srliw	a4,a5,0x18
    800038b8:	00e481a3          	sb	a4,3(s1)
    800038bc:	0207d713          	srli	a4,a5,0x20
    800038c0:	00e48223          	sb	a4,4(s1)
    800038c4:	0287d713          	srli	a4,a5,0x28
    800038c8:	00e482a3          	sb	a4,5(s1)
    800038cc:	0307d713          	srli	a4,a5,0x30
    800038d0:	00e48323          	sb	a4,6(s1)
    800038d4:	0387d793          	srli	a5,a5,0x38
    800038d8:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    800038dc:	01248823          	sb	s2,16(s1)
    800038e0:	00895793          	srli	a5,s2,0x8
    800038e4:	00f488a3          	sb	a5,17(s1)
    800038e8:	01095793          	srli	a5,s2,0x10
    800038ec:	00f48923          	sb	a5,18(s1)
    800038f0:	0189579b          	srliw	a5,s2,0x18
    800038f4:	00f489a3          	sb	a5,19(s1)
    800038f8:	02095793          	srli	a5,s2,0x20
    800038fc:	00f48a23          	sb	a5,20(s1)
    80003900:	02895793          	srli	a5,s2,0x28
    80003904:	00f48aa3          	sb	a5,21(s1)
    80003908:	03095793          	srli	a5,s2,0x30
    8000390c:	00f48b23          	sb	a5,22(s1)
    80003910:	03895913          	srli	s2,s2,0x38
    80003914:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80003918:	0009b783          	ld	a5,0(s3)
    8000391c:	20978463          	beq	a5,s1,80003b24 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80003920:	0084c783          	lbu	a5,8(s1)
    80003924:	0094c703          	lbu	a4,9(s1)
    80003928:	00871713          	slli	a4,a4,0x8
    8000392c:	00f76733          	or	a4,a4,a5
    80003930:	00a4c783          	lbu	a5,10(s1)
    80003934:	01079793          	slli	a5,a5,0x10
    80003938:	00e7e733          	or	a4,a5,a4
    8000393c:	00b4c783          	lbu	a5,11(s1)
    80003940:	01879793          	slli	a5,a5,0x18
    80003944:	00e7e7b3          	or	a5,a5,a4
    80003948:	00c4c703          	lbu	a4,12(s1)
    8000394c:	02071713          	slli	a4,a4,0x20
    80003950:	00f767b3          	or	a5,a4,a5
    80003954:	00d4c703          	lbu	a4,13(s1)
    80003958:	02871713          	slli	a4,a4,0x28
    8000395c:	00f76733          	or	a4,a4,a5
    80003960:	00e4c783          	lbu	a5,14(s1)
    80003964:	03079793          	slli	a5,a5,0x30
    80003968:	00e7e733          	or	a4,a5,a4
    8000396c:	00f4c783          	lbu	a5,15(s1)
    80003970:	03879793          	slli	a5,a5,0x38
    80003974:	00e7e7b3          	or	a5,a5,a4
    80003978:	08078c63          	beqz	a5,80003a10 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    8000397c:	0004c703          	lbu	a4,0(s1)
    80003980:	0014c683          	lbu	a3,1(s1)
    80003984:	00869693          	slli	a3,a3,0x8
    80003988:	00e6e733          	or	a4,a3,a4
    8000398c:	0024c683          	lbu	a3,2(s1)
    80003990:	01069693          	slli	a3,a3,0x10
    80003994:	00e6e6b3          	or	a3,a3,a4
    80003998:	0034c703          	lbu	a4,3(s1)
    8000399c:	01871713          	slli	a4,a4,0x18
    800039a0:	00d766b3          	or	a3,a4,a3
    800039a4:	0044c703          	lbu	a4,4(s1)
    800039a8:	02071713          	slli	a4,a4,0x20
    800039ac:	00d76733          	or	a4,a4,a3
    800039b0:	0054c683          	lbu	a3,5(s1)
    800039b4:	02869693          	slli	a3,a3,0x28
    800039b8:	00e6e733          	or	a4,a3,a4
    800039bc:	0064c683          	lbu	a3,6(s1)
    800039c0:	03069693          	slli	a3,a3,0x30
    800039c4:	00e6e6b3          	or	a3,a3,a4
    800039c8:	0074c703          	lbu	a4,7(s1)
    800039cc:	03871713          	slli	a4,a4,0x38
    800039d0:	00d76733          	or	a4,a4,a3
    800039d4:	00d78023          	sb	a3,0(a5)
    800039d8:	00875693          	srli	a3,a4,0x8
    800039dc:	00d780a3          	sb	a3,1(a5)
    800039e0:	01075693          	srli	a3,a4,0x10
    800039e4:	00d78123          	sb	a3,2(a5)
    800039e8:	0187569b          	srliw	a3,a4,0x18
    800039ec:	00d781a3          	sb	a3,3(a5)
    800039f0:	02075693          	srli	a3,a4,0x20
    800039f4:	00d78223          	sb	a3,4(a5)
    800039f8:	02875693          	srli	a3,a4,0x28
    800039fc:	00d782a3          	sb	a3,5(a5)
    80003a00:	03075693          	srli	a3,a4,0x30
    80003a04:	00d78323          	sb	a3,6(a5)
    80003a08:	03875713          	srli	a4,a4,0x38
    80003a0c:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003a10:	0004c783          	lbu	a5,0(s1)
    80003a14:	0014c703          	lbu	a4,1(s1)
    80003a18:	00871713          	slli	a4,a4,0x8
    80003a1c:	00f76733          	or	a4,a4,a5
    80003a20:	0024c783          	lbu	a5,2(s1)
    80003a24:	01079793          	slli	a5,a5,0x10
    80003a28:	00e7e733          	or	a4,a5,a4
    80003a2c:	0034c783          	lbu	a5,3(s1)
    80003a30:	01879793          	slli	a5,a5,0x18
    80003a34:	00e7e7b3          	or	a5,a5,a4
    80003a38:	0044c703          	lbu	a4,4(s1)
    80003a3c:	02071713          	slli	a4,a4,0x20
    80003a40:	00f767b3          	or	a5,a4,a5
    80003a44:	0054c703          	lbu	a4,5(s1)
    80003a48:	02871713          	slli	a4,a4,0x28
    80003a4c:	00f76733          	or	a4,a4,a5
    80003a50:	0064c783          	lbu	a5,6(s1)
    80003a54:	03079793          	slli	a5,a5,0x30
    80003a58:	00e7e733          	or	a4,a5,a4
    80003a5c:	0074c783          	lbu	a5,7(s1)
    80003a60:	03879793          	slli	a5,a5,0x38
    80003a64:	00e7e7b3          	or	a5,a5,a4
    80003a68:	08078c63          	beqz	a5,80003b00 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003a6c:	0084c703          	lbu	a4,8(s1)
    80003a70:	0094c683          	lbu	a3,9(s1)
    80003a74:	00869693          	slli	a3,a3,0x8
    80003a78:	00e6e733          	or	a4,a3,a4
    80003a7c:	00a4c683          	lbu	a3,10(s1)
    80003a80:	01069693          	slli	a3,a3,0x10
    80003a84:	00e6e6b3          	or	a3,a3,a4
    80003a88:	00b4c703          	lbu	a4,11(s1)
    80003a8c:	01871713          	slli	a4,a4,0x18
    80003a90:	00d766b3          	or	a3,a4,a3
    80003a94:	00c4c703          	lbu	a4,12(s1)
    80003a98:	02071713          	slli	a4,a4,0x20
    80003a9c:	00d76733          	or	a4,a4,a3
    80003aa0:	00d4c683          	lbu	a3,13(s1)
    80003aa4:	02869693          	slli	a3,a3,0x28
    80003aa8:	00e6e733          	or	a4,a3,a4
    80003aac:	00e4c683          	lbu	a3,14(s1)
    80003ab0:	03069693          	slli	a3,a3,0x30
    80003ab4:	00e6e6b3          	or	a3,a3,a4
    80003ab8:	00f4c703          	lbu	a4,15(s1)
    80003abc:	03871713          	slli	a4,a4,0x38
    80003ac0:	00d76733          	or	a4,a4,a3
    80003ac4:	00d78423          	sb	a3,8(a5)
    80003ac8:	00875693          	srli	a3,a4,0x8
    80003acc:	00d784a3          	sb	a3,9(a5)
    80003ad0:	01075693          	srli	a3,a4,0x10
    80003ad4:	00d78523          	sb	a3,10(a5)
    80003ad8:	0187569b          	srliw	a3,a4,0x18
    80003adc:	00d785a3          	sb	a3,11(a5)
    80003ae0:	02075693          	srli	a3,a4,0x20
    80003ae4:	00d78623          	sb	a3,12(a5)
    80003ae8:	02875693          	srli	a3,a4,0x28
    80003aec:	00d786a3          	sb	a3,13(a5)
    80003af0:	03075693          	srli	a3,a4,0x30
    80003af4:	00d78723          	sb	a3,14(a5)
    80003af8:	03875713          	srli	a4,a4,0x38
    80003afc:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    80003b00:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80003b04:	00048513          	mv	a0,s1
    80003b08:	02813083          	ld	ra,40(sp)
    80003b0c:	02013403          	ld	s0,32(sp)
    80003b10:	01813483          	ld	s1,24(sp)
    80003b14:	01013903          	ld	s2,16(sp)
    80003b18:	00813983          	ld	s3,8(sp)
    80003b1c:	03010113          	addi	sp,sp,48
    80003b20:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80003b24:	0004c703          	lbu	a4,0(s1)
    80003b28:	0014c783          	lbu	a5,1(s1)
    80003b2c:	00879793          	slli	a5,a5,0x8
    80003b30:	00e7e7b3          	or	a5,a5,a4
    80003b34:	0024c703          	lbu	a4,2(s1)
    80003b38:	01071713          	slli	a4,a4,0x10
    80003b3c:	00f76733          	or	a4,a4,a5
    80003b40:	0034c783          	lbu	a5,3(s1)
    80003b44:	01879793          	slli	a5,a5,0x18
    80003b48:	00e7e733          	or	a4,a5,a4
    80003b4c:	0044c783          	lbu	a5,4(s1)
    80003b50:	02079793          	slli	a5,a5,0x20
    80003b54:	00e7e7b3          	or	a5,a5,a4
    80003b58:	0054c703          	lbu	a4,5(s1)
    80003b5c:	02871713          	slli	a4,a4,0x28
    80003b60:	00f76733          	or	a4,a4,a5
    80003b64:	0064c783          	lbu	a5,6(s1)
    80003b68:	03079793          	slli	a5,a5,0x30
    80003b6c:	00e7e733          	or	a4,a5,a4
    80003b70:	0074c783          	lbu	a5,7(s1)
    80003b74:	03879793          	slli	a5,a5,0x38
    80003b78:	00e7e7b3          	or	a5,a5,a4
    80003b7c:	00f9b023          	sd	a5,0(s3)
    80003b80:	da1ff06f          	j	80003920 <_ZN11HeapManager12heapAllocateEm+0x3f4>

0000000080003b84 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003b84:	fc010113          	addi	sp,sp,-64
    80003b88:	02113c23          	sd	ra,56(sp)
    80003b8c:	02813823          	sd	s0,48(sp)
    80003b90:	02913423          	sd	s1,40(sp)
    80003b94:	03213023          	sd	s2,32(sp)
    80003b98:	01313c23          	sd	s3,24(sp)
    80003b9c:	01413823          	sd	s4,16(sp)
    80003ba0:	01513423          	sd	s5,8(sp)
    80003ba4:	04010413          	addi	s0,sp,64
    80003ba8:	00050a93          	mv	s5,a0
    80003bac:	00058a13          	mv	s4,a1
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pAddress) - MEM_BLOCK_SIZE);
    80003bb0:	fc058913          	addi	s2,a1,-64
    80003bb4:	00090993          	mv	s3,s2
    
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003bb8:	01894783          	lbu	a5,24(s2)
    80003bbc:	01994703          	lbu	a4,25(s2)
    80003bc0:	00871713          	slli	a4,a4,0x8
    80003bc4:	00f76733          	or	a4,a4,a5
    80003bc8:	01a94783          	lbu	a5,26(s2)
    80003bcc:	01079793          	slli	a5,a5,0x10
    80003bd0:	00e7e733          	or	a4,a5,a4
    80003bd4:	01b94783          	lbu	a5,27(s2)
    80003bd8:	01879793          	slli	a5,a5,0x18
    80003bdc:	00e7e7b3          	or	a5,a5,a4
    80003be0:	0007879b          	sext.w	a5,a5
    80003be4:	deadc737          	lui	a4,0xdeadc
    80003be8:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead1ace>
    80003bec:	28e79c63          	bne	a5,a4,80003e84 <_ZN11HeapManager8heapFreeEPv+0x300>
    HeapFreeSectionHeader* pInsert = m_pHead;
    80003bf0:	000ab483          	ld	s1,0(s5)

    if(pInsert == 0 || pInsert->pNext >= pAddress){
    80003bf4:	06048063          	beqz	s1,80003c54 <_ZN11HeapManager8heapFreeEPv+0xd0>
    80003bf8:	0004c783          	lbu	a5,0(s1)
    80003bfc:	0014c703          	lbu	a4,1(s1)
    80003c00:	00871713          	slli	a4,a4,0x8
    80003c04:	00f76733          	or	a4,a4,a5
    80003c08:	0024c783          	lbu	a5,2(s1)
    80003c0c:	01079793          	slli	a5,a5,0x10
    80003c10:	00e7e733          	or	a4,a5,a4
    80003c14:	0034c783          	lbu	a5,3(s1)
    80003c18:	01879793          	slli	a5,a5,0x18
    80003c1c:	00e7e7b3          	or	a5,a5,a4
    80003c20:	0044c703          	lbu	a4,4(s1)
    80003c24:	02071713          	slli	a4,a4,0x20
    80003c28:	00f767b3          	or	a5,a4,a5
    80003c2c:	0054c703          	lbu	a4,5(s1)
    80003c30:	02871713          	slli	a4,a4,0x28
    80003c34:	00f76733          	or	a4,a4,a5
    80003c38:	0064c783          	lbu	a5,6(s1)
    80003c3c:	03079793          	slli	a5,a5,0x30
    80003c40:	00e7e733          	or	a4,a5,a4
    80003c44:	0074c783          	lbu	a5,7(s1)
    80003c48:	03879793          	slli	a5,a5,0x38
    80003c4c:	00e7e7b3          	or	a5,a5,a4
    80003c50:	2b47ea63          	bltu	a5,s4,80003f04 <_ZN11HeapManager8heapFreeEPv+0x380>
        pFree->pNext = m_pHead;
    80003c54:	fc9a0023          	sb	s1,-64(s4)
    80003c58:	0084d793          	srli	a5,s1,0x8
    80003c5c:	00f900a3          	sb	a5,1(s2)
    80003c60:	0104d793          	srli	a5,s1,0x10
    80003c64:	00f90123          	sb	a5,2(s2)
    80003c68:	0184d79b          	srliw	a5,s1,0x18
    80003c6c:	00f901a3          	sb	a5,3(s2)
    80003c70:	0204d793          	srli	a5,s1,0x20
    80003c74:	00f90223          	sb	a5,4(s2)
    80003c78:	0284d793          	srli	a5,s1,0x28
    80003c7c:	00f902a3          	sb	a5,5(s2)
    80003c80:	0304d793          	srli	a5,s1,0x30
    80003c84:	00f90323          	sb	a5,6(s2)
    80003c88:	0384d493          	srli	s1,s1,0x38
    80003c8c:	009903a3          	sb	s1,7(s2)
        m_pHead->pPrev = pFree;
    80003c90:	000ab783          	ld	a5,0(s5)
    80003c94:	01278423          	sb	s2,8(a5)
    80003c98:	00895713          	srli	a4,s2,0x8
    80003c9c:	00e784a3          	sb	a4,9(a5)
    80003ca0:	01095713          	srli	a4,s2,0x10
    80003ca4:	00e78523          	sb	a4,10(a5)
    80003ca8:	0189571b          	srliw	a4,s2,0x18
    80003cac:	00e785a3          	sb	a4,11(a5)
    80003cb0:	02095713          	srli	a4,s2,0x20
    80003cb4:	00e78623          	sb	a4,12(a5)
    80003cb8:	02895713          	srli	a4,s2,0x28
    80003cbc:	00e786a3          	sb	a4,13(a5)
    80003cc0:	03095713          	srli	a4,s2,0x30
    80003cc4:	00e78723          	sb	a4,14(a5)
    80003cc8:	03895713          	srli	a4,s2,0x38
    80003ccc:	00e787a3          	sb	a4,15(a5)
        m_pHead = pFree;
    80003cd0:	012ab023          	sd	s2,0(s5)
    }



    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uint64>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uint64>(pFree)){
    80003cd4:	00894783          	lbu	a5,8(s2)
    80003cd8:	00994703          	lbu	a4,9(s2)
    80003cdc:	00871713          	slli	a4,a4,0x8
    80003ce0:	00f76733          	or	a4,a4,a5
    80003ce4:	00a94783          	lbu	a5,10(s2)
    80003ce8:	01079793          	slli	a5,a5,0x10
    80003cec:	00e7e733          	or	a4,a5,a4
    80003cf0:	00b94783          	lbu	a5,11(s2)
    80003cf4:	01879793          	slli	a5,a5,0x18
    80003cf8:	00e7e7b3          	or	a5,a5,a4
    80003cfc:	00c94703          	lbu	a4,12(s2)
    80003d00:	02071713          	slli	a4,a4,0x20
    80003d04:	00f767b3          	or	a5,a4,a5
    80003d08:	00d94703          	lbu	a4,13(s2)
    80003d0c:	02871713          	slli	a4,a4,0x28
    80003d10:	00f76733          	or	a4,a4,a5
    80003d14:	00e94783          	lbu	a5,14(s2)
    80003d18:	03079793          	slli	a5,a5,0x30
    80003d1c:	00e7e733          	or	a4,a5,a4
    80003d20:	00f94783          	lbu	a5,15(s2)
    80003d24:	03879793          	slli	a5,a5,0x38
    80003d28:	00e7e7b3          	or	a5,a5,a4
    80003d2c:	06078663          	beqz	a5,80003d98 <_ZN11HeapManager8heapFreeEPv+0x214>
    80003d30:	0107c703          	lbu	a4,16(a5)
    80003d34:	0117c683          	lbu	a3,17(a5)
    80003d38:	00869693          	slli	a3,a3,0x8
    80003d3c:	00e6e6b3          	or	a3,a3,a4
    80003d40:	0127c703          	lbu	a4,18(a5)
    80003d44:	01071713          	slli	a4,a4,0x10
    80003d48:	00d766b3          	or	a3,a4,a3
    80003d4c:	0137c703          	lbu	a4,19(a5)
    80003d50:	01871713          	slli	a4,a4,0x18
    80003d54:	00d76733          	or	a4,a4,a3
    80003d58:	0147c683          	lbu	a3,20(a5)
    80003d5c:	02069693          	slli	a3,a3,0x20
    80003d60:	00e6e733          	or	a4,a3,a4
    80003d64:	0157c683          	lbu	a3,21(a5)
    80003d68:	02869693          	slli	a3,a3,0x28
    80003d6c:	00e6e6b3          	or	a3,a3,a4
    80003d70:	0167c703          	lbu	a4,22(a5)
    80003d74:	03071713          	slli	a4,a4,0x30
    80003d78:	00d766b3          	or	a3,a4,a3
    80003d7c:	0177c703          	lbu	a4,23(a5)
    80003d80:	03871713          	slli	a4,a4,0x38
    80003d84:	00d76733          	or	a4,a4,a3
    80003d88:	00170693          	addi	a3,a4,1
    80003d8c:	00669693          	slli	a3,a3,0x6
    80003d90:	00d786b3          	add	a3,a5,a3
    80003d94:	38d90063          	beq	s2,a3,80004114 <_ZN11HeapManager8heapFreeEPv+0x590>
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree->pPrev;
        }pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uint64>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uint64>(pFree->pNext)){
    80003d98:	0009c783          	lbu	a5,0(s3)
    80003d9c:	0019c703          	lbu	a4,1(s3)
    80003da0:	00871713          	slli	a4,a4,0x8
    80003da4:	00f76733          	or	a4,a4,a5
    80003da8:	0029c783          	lbu	a5,2(s3)
    80003dac:	01079793          	slli	a5,a5,0x10
    80003db0:	00e7e733          	or	a4,a5,a4
    80003db4:	0039c783          	lbu	a5,3(s3)
    80003db8:	01879793          	slli	a5,a5,0x18
    80003dbc:	00e7e7b3          	or	a5,a5,a4
    80003dc0:	0049c703          	lbu	a4,4(s3)
    80003dc4:	02071713          	slli	a4,a4,0x20
    80003dc8:	00f767b3          	or	a5,a4,a5
    80003dcc:	0059c703          	lbu	a4,5(s3)
    80003dd0:	02871713          	slli	a4,a4,0x28
    80003dd4:	00f76733          	or	a4,a4,a5
    80003dd8:	0069c783          	lbu	a5,6(s3)
    80003ddc:	03079793          	slli	a5,a5,0x30
    80003de0:	00e7e733          	or	a4,a5,a4
    80003de4:	0079c783          	lbu	a5,7(s3)
    80003de8:	03879793          	slli	a5,a5,0x38
    80003dec:	00e7e7b3          	or	a5,a5,a4
    80003df0:	06078663          	beqz	a5,80003e5c <_ZN11HeapManager8heapFreeEPv+0x2d8>
    80003df4:	0109c703          	lbu	a4,16(s3)
    80003df8:	0119c683          	lbu	a3,17(s3)
    80003dfc:	00869693          	slli	a3,a3,0x8
    80003e00:	00e6e6b3          	or	a3,a3,a4
    80003e04:	0129c703          	lbu	a4,18(s3)
    80003e08:	01071713          	slli	a4,a4,0x10
    80003e0c:	00d766b3          	or	a3,a4,a3
    80003e10:	0139c703          	lbu	a4,19(s3)
    80003e14:	01871713          	slli	a4,a4,0x18
    80003e18:	00d76733          	or	a4,a4,a3
    80003e1c:	0149c683          	lbu	a3,20(s3)
    80003e20:	02069693          	slli	a3,a3,0x20
    80003e24:	00e6e733          	or	a4,a3,a4
    80003e28:	0159c683          	lbu	a3,21(s3)
    80003e2c:	02869693          	slli	a3,a3,0x28
    80003e30:	00e6e6b3          	or	a3,a3,a4
    80003e34:	0169c703          	lbu	a4,22(s3)
    80003e38:	03071713          	slli	a4,a4,0x30
    80003e3c:	00d766b3          	or	a3,a4,a3
    80003e40:	0179c703          	lbu	a4,23(s3)
    80003e44:	03871713          	slli	a4,a4,0x38
    80003e48:	00d76733          	or	a4,a4,a3
    80003e4c:	00170693          	addi	a3,a4,1
    80003e50:	00669693          	slli	a3,a3,0x6
    80003e54:	00d986b3          	add	a3,s3,a3
    80003e58:	58f68863          	beq	a3,a5,800043e8 <_ZN11HeapManager8heapFreeEPv+0x864>
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree;
        }
    }
    return 0;
}
    80003e5c:	00000513          	li	a0,0
    80003e60:	03813083          	ld	ra,56(sp)
    80003e64:	03013403          	ld	s0,48(sp)
    80003e68:	02813483          	ld	s1,40(sp)
    80003e6c:	02013903          	ld	s2,32(sp)
    80003e70:	01813983          	ld	s3,24(sp)
    80003e74:	01013a03          	ld	s4,16(sp)
    80003e78:	00813a83          	ld	s5,8(sp)
    80003e7c:	04010113          	addi	sp,sp,64
    80003e80:	00008067          	ret
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003e84:	00004697          	auipc	a3,0x4
    80003e88:	3ec68693          	addi	a3,a3,1004 # 80008270 <CONSOLE_STATUS+0x260>
    80003e8c:	05400613          	li	a2,84
    80003e90:	00004597          	auipc	a1,0x4
    80003e94:	30858593          	addi	a1,a1,776 # 80008198 <CONSOLE_STATUS+0x188>
    80003e98:	00004517          	auipc	a0,0x4
    80003e9c:	40050513          	addi	a0,a0,1024 # 80008298 <CONSOLE_STATUS+0x288>
    80003ea0:	ffffe097          	auipc	ra,0xffffe
    80003ea4:	c9c080e7          	jalr	-868(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    80003ea8:	d49ff06f          	j	80003bf0 <_ZN11HeapManager8heapFreeEPv+0x6c>
            pInsert = pInsert->pNext;
    80003eac:	0004c703          	lbu	a4,0(s1)
    80003eb0:	0014c783          	lbu	a5,1(s1)
    80003eb4:	00879793          	slli	a5,a5,0x8
    80003eb8:	00e7e733          	or	a4,a5,a4
    80003ebc:	0024c783          	lbu	a5,2(s1)
    80003ec0:	01079793          	slli	a5,a5,0x10
    80003ec4:	00e7e7b3          	or	a5,a5,a4
    80003ec8:	0034c703          	lbu	a4,3(s1)
    80003ecc:	01871713          	slli	a4,a4,0x18
    80003ed0:	00f767b3          	or	a5,a4,a5
    80003ed4:	0044c703          	lbu	a4,4(s1)
    80003ed8:	02071713          	slli	a4,a4,0x20
    80003edc:	00f76733          	or	a4,a4,a5
    80003ee0:	0054c783          	lbu	a5,5(s1)
    80003ee4:	02879793          	slli	a5,a5,0x28
    80003ee8:	00e7e733          	or	a4,a5,a4
    80003eec:	0064c783          	lbu	a5,6(s1)
    80003ef0:	03079793          	slli	a5,a5,0x30
    80003ef4:	00e7e7b3          	or	a5,a5,a4
    80003ef8:	0074c483          	lbu	s1,7(s1)
    80003efc:	03849493          	slli	s1,s1,0x38
    80003f00:	00f4e4b3          	or	s1,s1,a5
        while(pInsert->pNext != 0 && pInsert->pNext < pAddress){
    80003f04:	0004c783          	lbu	a5,0(s1)
    80003f08:	0014c703          	lbu	a4,1(s1)
    80003f0c:	00871713          	slli	a4,a4,0x8
    80003f10:	00f76733          	or	a4,a4,a5
    80003f14:	0024c783          	lbu	a5,2(s1)
    80003f18:	01079793          	slli	a5,a5,0x10
    80003f1c:	00e7e733          	or	a4,a5,a4
    80003f20:	0034c783          	lbu	a5,3(s1)
    80003f24:	01879793          	slli	a5,a5,0x18
    80003f28:	00e7e7b3          	or	a5,a5,a4
    80003f2c:	0044c703          	lbu	a4,4(s1)
    80003f30:	02071713          	slli	a4,a4,0x20
    80003f34:	00f767b3          	or	a5,a4,a5
    80003f38:	0054c703          	lbu	a4,5(s1)
    80003f3c:	02871713          	slli	a4,a4,0x28
    80003f40:	00f76733          	or	a4,a4,a5
    80003f44:	0064c783          	lbu	a5,6(s1)
    80003f48:	03079793          	slli	a5,a5,0x30
    80003f4c:	00e7e733          	or	a4,a5,a4
    80003f50:	0074c783          	lbu	a5,7(s1)
    80003f54:	03879793          	slli	a5,a5,0x38
    80003f58:	00e7e7b3          	or	a5,a5,a4
    80003f5c:	06078463          	beqz	a5,80003fc4 <_ZN11HeapManager8heapFreeEPv+0x440>
    80003f60:	0747f263          	bgeu	a5,s4,80003fc4 <_ZN11HeapManager8heapFreeEPv+0x440>
            assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    80003f64:	0184c783          	lbu	a5,24(s1)
    80003f68:	0194c703          	lbu	a4,25(s1)
    80003f6c:	00871713          	slli	a4,a4,0x8
    80003f70:	00f76733          	or	a4,a4,a5
    80003f74:	01a4c783          	lbu	a5,26(s1)
    80003f78:	01079793          	slli	a5,a5,0x10
    80003f7c:	00e7e733          	or	a4,a5,a4
    80003f80:	01b4c783          	lbu	a5,27(s1)
    80003f84:	01879793          	slli	a5,a5,0x18
    80003f88:	00e7e7b3          	or	a5,a5,a4
    80003f8c:	0007879b          	sext.w	a5,a5
    80003f90:	deadc737          	lui	a4,0xdeadc
    80003f94:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead1ace>
    80003f98:	f0e78ae3          	beq	a5,a4,80003eac <_ZN11HeapManager8heapFreeEPv+0x328>
    80003f9c:	00004697          	auipc	a3,0x4
    80003fa0:	2d468693          	addi	a3,a3,724 # 80008270 <CONSOLE_STATUS+0x260>
    80003fa4:	05d00613          	li	a2,93
    80003fa8:	00004597          	auipc	a1,0x4
    80003fac:	1f058593          	addi	a1,a1,496 # 80008198 <CONSOLE_STATUS+0x188>
    80003fb0:	00004517          	auipc	a0,0x4
    80003fb4:	31050513          	addi	a0,a0,784 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80003fb8:	ffffe097          	auipc	ra,0xffffe
    80003fbc:	b84080e7          	jalr	-1148(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    80003fc0:	eedff06f          	j	80003eac <_ZN11HeapManager8heapFreeEPv+0x328>
        pFree->pNext = pInsert->pNext;
    80003fc4:	fcfa0023          	sb	a5,-64(s4)
    80003fc8:	0087d713          	srli	a4,a5,0x8
    80003fcc:	00e900a3          	sb	a4,1(s2)
    80003fd0:	0107d713          	srli	a4,a5,0x10
    80003fd4:	00e90123          	sb	a4,2(s2)
    80003fd8:	0187d71b          	srliw	a4,a5,0x18
    80003fdc:	00e901a3          	sb	a4,3(s2)
    80003fe0:	0207d713          	srli	a4,a5,0x20
    80003fe4:	00e90223          	sb	a4,4(s2)
    80003fe8:	0287d713          	srli	a4,a5,0x28
    80003fec:	00e902a3          	sb	a4,5(s2)
    80003ff0:	0307d713          	srli	a4,a5,0x30
    80003ff4:	00e90323          	sb	a4,6(s2)
    80003ff8:	0387d793          	srli	a5,a5,0x38
    80003ffc:	00f903a3          	sb	a5,7(s2)
        pFree->pPrev = pInsert;
    80004000:	00990423          	sb	s1,8(s2)
    80004004:	0084d793          	srli	a5,s1,0x8
    80004008:	00f904a3          	sb	a5,9(s2)
    8000400c:	0104d793          	srli	a5,s1,0x10
    80004010:	00f90523          	sb	a5,10(s2)
    80004014:	0184d79b          	srliw	a5,s1,0x18
    80004018:	00f905a3          	sb	a5,11(s2)
    8000401c:	0204d793          	srli	a5,s1,0x20
    80004020:	00f90623          	sb	a5,12(s2)
    80004024:	0284d793          	srli	a5,s1,0x28
    80004028:	00f906a3          	sb	a5,13(s2)
    8000402c:	0304d793          	srli	a5,s1,0x30
    80004030:	00f90723          	sb	a5,14(s2)
    80004034:	0384d793          	srli	a5,s1,0x38
    80004038:	00f907a3          	sb	a5,15(s2)
        if(pInsert->pNext != 0){
    8000403c:	0004c783          	lbu	a5,0(s1)
    80004040:	0014c703          	lbu	a4,1(s1)
    80004044:	00871713          	slli	a4,a4,0x8
    80004048:	00f76733          	or	a4,a4,a5
    8000404c:	0024c783          	lbu	a5,2(s1)
    80004050:	01079793          	slli	a5,a5,0x10
    80004054:	00e7e733          	or	a4,a5,a4
    80004058:	0034c783          	lbu	a5,3(s1)
    8000405c:	01879793          	slli	a5,a5,0x18
    80004060:	00e7e7b3          	or	a5,a5,a4
    80004064:	0044c703          	lbu	a4,4(s1)
    80004068:	02071713          	slli	a4,a4,0x20
    8000406c:	00f767b3          	or	a5,a4,a5
    80004070:	0054c703          	lbu	a4,5(s1)
    80004074:	02871713          	slli	a4,a4,0x28
    80004078:	00f76733          	or	a4,a4,a5
    8000407c:	0064c783          	lbu	a5,6(s1)
    80004080:	03079793          	slli	a5,a5,0x30
    80004084:	00e7e733          	or	a4,a5,a4
    80004088:	0074c783          	lbu	a5,7(s1)
    8000408c:	03879793          	slli	a5,a5,0x38
    80004090:	00e7e7b3          	or	a5,a5,a4
    80004094:	04078063          	beqz	a5,800040d4 <_ZN11HeapManager8heapFreeEPv+0x550>
            pInsert->pNext->pPrev = pFree;
    80004098:	01278423          	sb	s2,8(a5)
    8000409c:	00895713          	srli	a4,s2,0x8
    800040a0:	00e784a3          	sb	a4,9(a5)
    800040a4:	01095713          	srli	a4,s2,0x10
    800040a8:	00e78523          	sb	a4,10(a5)
    800040ac:	0189571b          	srliw	a4,s2,0x18
    800040b0:	00e785a3          	sb	a4,11(a5)
    800040b4:	02095713          	srli	a4,s2,0x20
    800040b8:	00e78623          	sb	a4,12(a5)
    800040bc:	02895713          	srli	a4,s2,0x28
    800040c0:	00e786a3          	sb	a4,13(a5)
    800040c4:	03095713          	srli	a4,s2,0x30
    800040c8:	00e78723          	sb	a4,14(a5)
    800040cc:	03895713          	srli	a4,s2,0x38
    800040d0:	00e787a3          	sb	a4,15(a5)
        pInsert->pNext = pFree;
    800040d4:	01248023          	sb	s2,0(s1)
    800040d8:	00895793          	srli	a5,s2,0x8
    800040dc:	00f480a3          	sb	a5,1(s1)
    800040e0:	01095793          	srli	a5,s2,0x10
    800040e4:	00f48123          	sb	a5,2(s1)
    800040e8:	0189579b          	srliw	a5,s2,0x18
    800040ec:	00f481a3          	sb	a5,3(s1)
    800040f0:	02095793          	srli	a5,s2,0x20
    800040f4:	00f48223          	sb	a5,4(s1)
    800040f8:	02895793          	srli	a5,s2,0x28
    800040fc:	00f482a3          	sb	a5,5(s1)
    80004100:	03095793          	srli	a5,s2,0x30
    80004104:	00f48323          	sb	a5,6(s1)
    80004108:	03895793          	srli	a5,s2,0x38
    8000410c:	00f483a3          	sb	a5,7(s1)
    80004110:	bc5ff06f          	j	80003cd4 <_ZN11HeapManager8heapFreeEPv+0x150>
        pFree->pPrev->nSize += pFree->nSize + 1;
    80004114:	01094683          	lbu	a3,16(s2)
    80004118:	01194603          	lbu	a2,17(s2)
    8000411c:	00861613          	slli	a2,a2,0x8
    80004120:	00d66633          	or	a2,a2,a3
    80004124:	01294683          	lbu	a3,18(s2)
    80004128:	01069693          	slli	a3,a3,0x10
    8000412c:	00c6e633          	or	a2,a3,a2
    80004130:	01394683          	lbu	a3,19(s2)
    80004134:	01869693          	slli	a3,a3,0x18
    80004138:	00c6e6b3          	or	a3,a3,a2
    8000413c:	01494603          	lbu	a2,20(s2)
    80004140:	02061613          	slli	a2,a2,0x20
    80004144:	00d666b3          	or	a3,a2,a3
    80004148:	01594603          	lbu	a2,21(s2)
    8000414c:	02861613          	slli	a2,a2,0x28
    80004150:	00d66633          	or	a2,a2,a3
    80004154:	01694683          	lbu	a3,22(s2)
    80004158:	03069693          	slli	a3,a3,0x30
    8000415c:	00c6e633          	or	a2,a3,a2
    80004160:	01794683          	lbu	a3,23(s2)
    80004164:	03869693          	slli	a3,a3,0x38
    80004168:	00c6e6b3          	or	a3,a3,a2
    8000416c:	00d70733          	add	a4,a4,a3
    80004170:	00170713          	addi	a4,a4,1
    80004174:	00e78823          	sb	a4,16(a5)
    80004178:	00875693          	srli	a3,a4,0x8
    8000417c:	00d788a3          	sb	a3,17(a5)
    80004180:	01075693          	srli	a3,a4,0x10
    80004184:	00d78923          	sb	a3,18(a5)
    80004188:	0187569b          	srliw	a3,a4,0x18
    8000418c:	00d789a3          	sb	a3,19(a5)
    80004190:	02075693          	srli	a3,a4,0x20
    80004194:	00d78a23          	sb	a3,20(a5)
    80004198:	02875693          	srli	a3,a4,0x28
    8000419c:	00d78aa3          	sb	a3,21(a5)
    800041a0:	03075693          	srli	a3,a4,0x30
    800041a4:	00d78b23          	sb	a3,22(a5)
    800041a8:	03875713          	srli	a4,a4,0x38
    800041ac:	00e78ba3          	sb	a4,23(a5)
        pFree->pPrev->pNext = pFree->pNext;
    800041b0:	00894703          	lbu	a4,8(s2)
    800041b4:	00994783          	lbu	a5,9(s2)
    800041b8:	00879793          	slli	a5,a5,0x8
    800041bc:	00e7e7b3          	or	a5,a5,a4
    800041c0:	00a94703          	lbu	a4,10(s2)
    800041c4:	01071713          	slli	a4,a4,0x10
    800041c8:	00f767b3          	or	a5,a4,a5
    800041cc:	00b94703          	lbu	a4,11(s2)
    800041d0:	01871713          	slli	a4,a4,0x18
    800041d4:	00f76733          	or	a4,a4,a5
    800041d8:	00c94783          	lbu	a5,12(s2)
    800041dc:	02079793          	slli	a5,a5,0x20
    800041e0:	00e7e733          	or	a4,a5,a4
    800041e4:	00d94783          	lbu	a5,13(s2)
    800041e8:	02879793          	slli	a5,a5,0x28
    800041ec:	00e7e7b3          	or	a5,a5,a4
    800041f0:	00e94703          	lbu	a4,14(s2)
    800041f4:	03071713          	slli	a4,a4,0x30
    800041f8:	00f767b3          	or	a5,a4,a5
    800041fc:	00f94703          	lbu	a4,15(s2)
    80004200:	03871713          	slli	a4,a4,0x38
    80004204:	00f76733          	or	a4,a4,a5
    80004208:	fc0a4783          	lbu	a5,-64(s4)
    8000420c:	00194683          	lbu	a3,1(s2)
    80004210:	00869693          	slli	a3,a3,0x8
    80004214:	00f6e7b3          	or	a5,a3,a5
    80004218:	00294683          	lbu	a3,2(s2)
    8000421c:	01069693          	slli	a3,a3,0x10
    80004220:	00f6e6b3          	or	a3,a3,a5
    80004224:	00394783          	lbu	a5,3(s2)
    80004228:	01879793          	slli	a5,a5,0x18
    8000422c:	00d7e6b3          	or	a3,a5,a3
    80004230:	00494783          	lbu	a5,4(s2)
    80004234:	02079793          	slli	a5,a5,0x20
    80004238:	00d7e7b3          	or	a5,a5,a3
    8000423c:	00594683          	lbu	a3,5(s2)
    80004240:	02869693          	slli	a3,a3,0x28
    80004244:	00f6e7b3          	or	a5,a3,a5
    80004248:	00694683          	lbu	a3,6(s2)
    8000424c:	03069693          	slli	a3,a3,0x30
    80004250:	00f6e6b3          	or	a3,a3,a5
    80004254:	00794783          	lbu	a5,7(s2)
    80004258:	03879793          	slli	a5,a5,0x38
    8000425c:	00d7e7b3          	or	a5,a5,a3
    80004260:	00d70023          	sb	a3,0(a4)
    80004264:	0087d693          	srli	a3,a5,0x8
    80004268:	00d700a3          	sb	a3,1(a4)
    8000426c:	0107d693          	srli	a3,a5,0x10
    80004270:	00d70123          	sb	a3,2(a4)
    80004274:	0187d69b          	srliw	a3,a5,0x18
    80004278:	00d701a3          	sb	a3,3(a4)
    8000427c:	0207d693          	srli	a3,a5,0x20
    80004280:	00d70223          	sb	a3,4(a4)
    80004284:	0287d693          	srli	a3,a5,0x28
    80004288:	00d702a3          	sb	a3,5(a4)
    8000428c:	0307d693          	srli	a3,a5,0x30
    80004290:	00d70323          	sb	a3,6(a4)
    80004294:	0387d793          	srli	a5,a5,0x38
    80004298:	00f703a3          	sb	a5,7(a4)
        if(pFree->pNext != 0){
    8000429c:	fc0a4783          	lbu	a5,-64(s4)
    800042a0:	00194703          	lbu	a4,1(s2)
    800042a4:	00871713          	slli	a4,a4,0x8
    800042a8:	00f76733          	or	a4,a4,a5
    800042ac:	00294783          	lbu	a5,2(s2)
    800042b0:	01079793          	slli	a5,a5,0x10
    800042b4:	00e7e733          	or	a4,a5,a4
    800042b8:	00394783          	lbu	a5,3(s2)
    800042bc:	01879793          	slli	a5,a5,0x18
    800042c0:	00e7e7b3          	or	a5,a5,a4
    800042c4:	00494703          	lbu	a4,4(s2)
    800042c8:	02071713          	slli	a4,a4,0x20
    800042cc:	00f767b3          	or	a5,a4,a5
    800042d0:	00594703          	lbu	a4,5(s2)
    800042d4:	02871713          	slli	a4,a4,0x28
    800042d8:	00f76733          	or	a4,a4,a5
    800042dc:	00694783          	lbu	a5,6(s2)
    800042e0:	03079793          	slli	a5,a5,0x30
    800042e4:	00e7e733          	or	a4,a5,a4
    800042e8:	00794783          	lbu	a5,7(s2)
    800042ec:	03879793          	slli	a5,a5,0x38
    800042f0:	00e7e7b3          	or	a5,a5,a4
    800042f4:	08078c63          	beqz	a5,8000438c <_ZN11HeapManager8heapFreeEPv+0x808>
            pFree->pNext->pPrev = pFree->pPrev;
    800042f8:	00894703          	lbu	a4,8(s2)
    800042fc:	00994683          	lbu	a3,9(s2)
    80004300:	00869693          	slli	a3,a3,0x8
    80004304:	00e6e733          	or	a4,a3,a4
    80004308:	00a94683          	lbu	a3,10(s2)
    8000430c:	01069693          	slli	a3,a3,0x10
    80004310:	00e6e6b3          	or	a3,a3,a4
    80004314:	00b94703          	lbu	a4,11(s2)
    80004318:	01871713          	slli	a4,a4,0x18
    8000431c:	00d766b3          	or	a3,a4,a3
    80004320:	00c94703          	lbu	a4,12(s2)
    80004324:	02071713          	slli	a4,a4,0x20
    80004328:	00d76733          	or	a4,a4,a3
    8000432c:	00d94683          	lbu	a3,13(s2)
    80004330:	02869693          	slli	a3,a3,0x28
    80004334:	00e6e733          	or	a4,a3,a4
    80004338:	00e94683          	lbu	a3,14(s2)
    8000433c:	03069693          	slli	a3,a3,0x30
    80004340:	00e6e6b3          	or	a3,a3,a4
    80004344:	00f94703          	lbu	a4,15(s2)
    80004348:	03871713          	slli	a4,a4,0x38
    8000434c:	00d76733          	or	a4,a4,a3
    80004350:	00d78423          	sb	a3,8(a5)
    80004354:	00875693          	srli	a3,a4,0x8
    80004358:	00d784a3          	sb	a3,9(a5)
    8000435c:	01075693          	srli	a3,a4,0x10
    80004360:	00d78523          	sb	a3,10(a5)
    80004364:	0187569b          	srliw	a3,a4,0x18
    80004368:	00d785a3          	sb	a3,11(a5)
    8000436c:	02075693          	srli	a3,a4,0x20
    80004370:	00d78623          	sb	a3,12(a5)
    80004374:	02875693          	srli	a3,a4,0x28
    80004378:	00d786a3          	sb	a3,13(a5)
    8000437c:	03075693          	srli	a3,a4,0x30
    80004380:	00d78723          	sb	a3,14(a5)
    80004384:	03875713          	srli	a4,a4,0x38
    80004388:	00e787a3          	sb	a4,15(a5)
        }pFree = pFree->pPrev;
    8000438c:	00894983          	lbu	s3,8(s2)
    80004390:	00994783          	lbu	a5,9(s2)
    80004394:	00879793          	slli	a5,a5,0x8
    80004398:	0137e7b3          	or	a5,a5,s3
    8000439c:	00a94983          	lbu	s3,10(s2)
    800043a0:	01099993          	slli	s3,s3,0x10
    800043a4:	00f9e7b3          	or	a5,s3,a5
    800043a8:	00b94983          	lbu	s3,11(s2)
    800043ac:	01899993          	slli	s3,s3,0x18
    800043b0:	00f9e9b3          	or	s3,s3,a5
    800043b4:	00c94783          	lbu	a5,12(s2)
    800043b8:	02079793          	slli	a5,a5,0x20
    800043bc:	0137e9b3          	or	s3,a5,s3
    800043c0:	00d94783          	lbu	a5,13(s2)
    800043c4:	02879793          	slli	a5,a5,0x28
    800043c8:	0137e7b3          	or	a5,a5,s3
    800043cc:	00e94983          	lbu	s3,14(s2)
    800043d0:	03099993          	slli	s3,s3,0x30
    800043d4:	00f9e7b3          	or	a5,s3,a5
    800043d8:	00f94983          	lbu	s3,15(s2)
    800043dc:	03899993          	slli	s3,s3,0x38
    800043e0:	00f9e9b3          	or	s3,s3,a5
    800043e4:	9b5ff06f          	j	80003d98 <_ZN11HeapManager8heapFreeEPv+0x214>
        pFree->nSize += pFree->pNext->nSize + 1;
    800043e8:	0107c683          	lbu	a3,16(a5)
    800043ec:	0117c603          	lbu	a2,17(a5)
    800043f0:	00861613          	slli	a2,a2,0x8
    800043f4:	00d66633          	or	a2,a2,a3
    800043f8:	0127c683          	lbu	a3,18(a5)
    800043fc:	01069693          	slli	a3,a3,0x10
    80004400:	00c6e633          	or	a2,a3,a2
    80004404:	0137c683          	lbu	a3,19(a5)
    80004408:	01869693          	slli	a3,a3,0x18
    8000440c:	00c6e6b3          	or	a3,a3,a2
    80004410:	0147c603          	lbu	a2,20(a5)
    80004414:	02061613          	slli	a2,a2,0x20
    80004418:	00d666b3          	or	a3,a2,a3
    8000441c:	0157c603          	lbu	a2,21(a5)
    80004420:	02861613          	slli	a2,a2,0x28
    80004424:	00d66633          	or	a2,a2,a3
    80004428:	0167c683          	lbu	a3,22(a5)
    8000442c:	03069693          	slli	a3,a3,0x30
    80004430:	00c6e633          	or	a2,a3,a2
    80004434:	0177c683          	lbu	a3,23(a5)
    80004438:	03869693          	slli	a3,a3,0x38
    8000443c:	00c6e6b3          	or	a3,a3,a2
    80004440:	00d70733          	add	a4,a4,a3
    80004444:	00170713          	addi	a4,a4,1
    80004448:	00e98823          	sb	a4,16(s3)
    8000444c:	00875693          	srli	a3,a4,0x8
    80004450:	00d988a3          	sb	a3,17(s3)
    80004454:	01075693          	srli	a3,a4,0x10
    80004458:	00d98923          	sb	a3,18(s3)
    8000445c:	0187569b          	srliw	a3,a4,0x18
    80004460:	00d989a3          	sb	a3,19(s3)
    80004464:	02075693          	srli	a3,a4,0x20
    80004468:	00d98a23          	sb	a3,20(s3)
    8000446c:	02875693          	srli	a3,a4,0x28
    80004470:	00d98aa3          	sb	a3,21(s3)
    80004474:	03075693          	srli	a3,a4,0x30
    80004478:	00d98b23          	sb	a3,22(s3)
    8000447c:	03875713          	srli	a4,a4,0x38
    80004480:	00e98ba3          	sb	a4,23(s3)
        pFree->pNext = pFree->pNext->pNext;
    80004484:	0007c683          	lbu	a3,0(a5)
    80004488:	0017c703          	lbu	a4,1(a5)
    8000448c:	00871713          	slli	a4,a4,0x8
    80004490:	00d766b3          	or	a3,a4,a3
    80004494:	0027c703          	lbu	a4,2(a5)
    80004498:	01071713          	slli	a4,a4,0x10
    8000449c:	00d76733          	or	a4,a4,a3
    800044a0:	0037c683          	lbu	a3,3(a5)
    800044a4:	01869693          	slli	a3,a3,0x18
    800044a8:	00e6e733          	or	a4,a3,a4
    800044ac:	0047c683          	lbu	a3,4(a5)
    800044b0:	02069693          	slli	a3,a3,0x20
    800044b4:	00e6e6b3          	or	a3,a3,a4
    800044b8:	0057c703          	lbu	a4,5(a5)
    800044bc:	02871713          	slli	a4,a4,0x28
    800044c0:	00d766b3          	or	a3,a4,a3
    800044c4:	0067c703          	lbu	a4,6(a5)
    800044c8:	03071713          	slli	a4,a4,0x30
    800044cc:	00d76733          	or	a4,a4,a3
    800044d0:	0077c783          	lbu	a5,7(a5)
    800044d4:	03879793          	slli	a5,a5,0x38
    800044d8:	00e7e7b3          	or	a5,a5,a4
    800044dc:	00e98023          	sb	a4,0(s3)
    800044e0:	0087d713          	srli	a4,a5,0x8
    800044e4:	00e980a3          	sb	a4,1(s3)
    800044e8:	0107d713          	srli	a4,a5,0x10
    800044ec:	00e98123          	sb	a4,2(s3)
    800044f0:	0187d71b          	srliw	a4,a5,0x18
    800044f4:	00e981a3          	sb	a4,3(s3)
    800044f8:	0207d713          	srli	a4,a5,0x20
    800044fc:	00e98223          	sb	a4,4(s3)
    80004500:	0287d713          	srli	a4,a5,0x28
    80004504:	00e982a3          	sb	a4,5(s3)
    80004508:	0307d713          	srli	a4,a5,0x30
    8000450c:	00e98323          	sb	a4,6(s3)
    80004510:	0387d713          	srli	a4,a5,0x38
    80004514:	00e983a3          	sb	a4,7(s3)
        if(pFree->pNext != 0){
    80004518:	940782e3          	beqz	a5,80003e5c <_ZN11HeapManager8heapFreeEPv+0x2d8>
            pFree->pNext->pPrev = pFree;
    8000451c:	01378423          	sb	s3,8(a5)
    80004520:	0089d713          	srli	a4,s3,0x8
    80004524:	00e784a3          	sb	a4,9(a5)
    80004528:	0109d713          	srli	a4,s3,0x10
    8000452c:	00e78523          	sb	a4,10(a5)
    80004530:	0189d71b          	srliw	a4,s3,0x18
    80004534:	00e785a3          	sb	a4,11(a5)
    80004538:	0209d713          	srli	a4,s3,0x20
    8000453c:	00e78623          	sb	a4,12(a5)
    80004540:	0289d713          	srli	a4,s3,0x28
    80004544:	00e786a3          	sb	a4,13(a5)
    80004548:	0309d713          	srli	a4,s3,0x30
    8000454c:	00e78723          	sb	a4,14(a5)
    80004550:	0389d993          	srli	s3,s3,0x38
    80004554:	013787a3          	sb	s3,15(a5)
    80004558:	905ff06f          	j	80003e5c <_ZN11HeapManager8heapFreeEPv+0x2d8>

000000008000455c <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"
#include "assert.h"

extern "C" void exceptionHandler(){
    8000455c:	fc010113          	addi	sp,sp,-64
    80004560:	02113c23          	sd	ra,56(sp)
    80004564:	02813823          	sd	s0,48(sp)
    80004568:	02913423          	sd	s1,40(sp)
    8000456c:	03213023          	sd	s2,32(sp)
    80004570:	01313c23          	sd	s3,24(sp)
    80004574:	01413823          	sd	s4,16(sp)
    80004578:	01513423          	sd	s5,8(sp)
    8000457c:	01613023          	sd	s6,0(sp)
    80004580:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    80004584:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    80004588:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    8000458c:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    80004590:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80004594:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80004598:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    8000459c:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    800045a0:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    800045a4:	ff870613          	addi	a2,a4,-8
    800045a8:	00100693          	li	a3,1
    800045ac:	04c6fc63          	bgeu	a3,a2,80004604 <exceptionHandler+0xa8>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    800045b0:	00500793          	li	a5,5
    800045b4:	22f70663          	beq	a4,a5,800047e0 <exceptionHandler+0x284>
                putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    800045b8:	00700793          	li	a5,7
    800045bc:	3ef70063          	beq	a4,a5,8000499c <exceptionHandler+0x440>
                putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    800045c0:	fff00793          	li	a5,-1
    800045c4:	03f79793          	slli	a5,a5,0x3f
    800045c8:	00178793          	addi	a5,a5,1
    800045cc:	58f70c63          	beq	a4,a5,80004b64 <exceptionHandler+0x608>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    800045d0:	fff00793          	li	a5,-1
    800045d4:	03f79793          	slli	a5,a5,0x3f
    800045d8:	00978793          	addi	a5,a5,9
    800045dc:	0af71063          	bne	a4,a5,8000467c <exceptionHandler+0x120>
    {   
        int irq = plic_claim();
    800045e0:	00001097          	auipc	ra,0x1
    800045e4:	274080e7          	jalr	628(ra) # 80005854 <plic_claim>
    800045e8:	00050493          	mv	s1,a0
        if(irq == CONSOLE_IRQ)Console::inputHandler();
    800045ec:	00a00793          	li	a5,10
    800045f0:	5cf50c63          	beq	a0,a5,80004bc8 <exceptionHandler+0x66c>
        plic_complete(irq);
    800045f4:	00048513          	mv	a0,s1
    800045f8:	00001097          	auipc	ra,0x1
    800045fc:	294080e7          	jalr	660(ra) # 8000588c <plic_complete>
    80004600:	07c0006f          	j	8000467c <exceptionHandler+0x120>
        switch(a0){
    80004604:	04200713          	li	a4,66
    80004608:	02f76463          	bltu	a4,a5,80004630 <exceptionHandler+0xd4>
    8000460c:	1c078263          	beqz	a5,800047d0 <exceptionHandler+0x274>
    80004610:	1cf76463          	bltu	a4,a5,800047d8 <exceptionHandler+0x27c>
    80004614:	00279793          	slli	a5,a5,0x2
    80004618:	00004717          	auipc	a4,0x4
    8000461c:	d3470713          	addi	a4,a4,-716 # 8000834c <CONSOLE_STATUS+0x33c>
    80004620:	00e787b3          	add	a5,a5,a4
    80004624:	0007a783          	lw	a5,0(a5)
    80004628:	00e787b3          	add	a5,a5,a4
    8000462c:	00078067          	jr	a5
    80004630:	0ff00713          	li	a4,255
    80004634:	02e79663          	bne	a5,a4,80004660 <exceptionHandler+0x104>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80004638:	00000793          	li	a5,0
    8000463c:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80004640:	00448493          	addi	s1,s1,4
    80004644:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004648:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    8000464c:	10000793          	li	a5,256
    80004650:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80004654:	00200793          	li	a5,2
    80004658:	1447b073          	csrc	sip,a5
                return;
    8000465c:	0200006f          	j	8000467c <exceptionHandler+0x120>
        switch(a0){
    80004660:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80004664:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80004668:	00448493          	addi	s1,s1,4
    8000466c:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004670:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80004674:	00200793          	li	a5,2
    80004678:	1447b073          	csrc	sip,a5
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    8000467c:	03813083          	ld	ra,56(sp)
    80004680:	03013403          	ld	s0,48(sp)
    80004684:	02813483          	ld	s1,40(sp)
    80004688:	02013903          	ld	s2,32(sp)
    8000468c:	01813983          	ld	s3,24(sp)
    80004690:	01013a03          	ld	s4,16(sp)
    80004694:	00813a83          	ld	s5,8(sp)
    80004698:	00013b03          	ld	s6,0(sp)
    8000469c:	04010113          	addi	sp,sp,64
    800046a0:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    800046a4:	00098593          	mv	a1,s3
    800046a8:	00005797          	auipc	a5,0x5
    800046ac:	c507b783          	ld	a5,-944(a5) # 800092f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800046b0:	0007b503          	ld	a0,0(a5)
    800046b4:	fffff097          	auipc	ra,0xfffff
    800046b8:	e78080e7          	jalr	-392(ra) # 8000352c <_ZN11HeapManager12heapAllocateEm>
                break;
    800046bc:	fa9ff06f          	j	80004664 <exceptionHandler+0x108>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    800046c0:	00098593          	mv	a1,s3
    800046c4:	00005797          	auipc	a5,0x5
    800046c8:	c347b783          	ld	a5,-972(a5) # 800092f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800046cc:	0007b503          	ld	a0,0(a5)
    800046d0:	fffff097          	auipc	ra,0xfffff
    800046d4:	4b4080e7          	jalr	1204(ra) # 80003b84 <_ZN11HeapManager8heapFreeEPv>
                break;
    800046d8:	f8dff06f          	j	80004664 <exceptionHandler+0x108>
                putc('\0'); /// removing this line causes everything to break
    800046dc:	00000513          	li	a0,0
    800046e0:	ffffd097          	auipc	ra,0xffffd
    800046e4:	f18080e7          	jalr	-232(ra) # 800015f8 <_Z4putcc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    800046e8:	00100713          	li	a4,1
    800046ec:	000b0693          	mv	a3,s6
    800046f0:	000a8613          	mv	a2,s5
    800046f4:	000a0593          	mv	a1,s4
    800046f8:	00098513          	mv	a0,s3
    800046fc:	ffffe097          	auipc	ra,0xffffe
    80004700:	504080e7          	jalr	1284(ra) # 80002c00 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80004704:	f61ff06f          	j	80004664 <exceptionHandler+0x108>
                returnVal = _thread::currentThread->exit();
    80004708:	fffff097          	auipc	ra,0xfffff
    8000470c:	87c080e7          	jalr	-1924(ra) # 80002f84 <_ZN7_thread4exitEv>
                break;
    80004710:	f55ff06f          	j	80004664 <exceptionHandler+0x108>
                _thread::dispatch();
    80004714:	fffff097          	auipc	ra,0xfffff
    80004718:	a80080e7          	jalr	-1408(ra) # 80003194 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    8000471c:	00000513          	li	a0,0
                break;
    80004720:	f45ff06f          	j	80004664 <exceptionHandler+0x108>
                _thread::currentThread->join((thread_t)a1);
    80004724:	00098593          	mv	a1,s3
    80004728:	00005797          	auipc	a5,0x5
    8000472c:	bf87b783          	ld	a5,-1032(a5) # 80009320 <_GLOBAL_OFFSET_TABLE_+0x58>
    80004730:	0007b503          	ld	a0,0(a5)
    80004734:	ffffe097          	auipc	ra,0xffffe
    80004738:	69c080e7          	jalr	1692(ra) # 80002dd0 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    8000473c:	00000513          	li	a0,0
                break;
    80004740:	f25ff06f          	j	80004664 <exceptionHandler+0x108>
                _sem::open((sem_t*)a1, unsigned(a2));
    80004744:	000a059b          	sext.w	a1,s4
    80004748:	00098513          	mv	a0,s3
    8000474c:	ffffd097          	auipc	ra,0xffffd
    80004750:	ed0080e7          	jalr	-304(ra) # 8000161c <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80004754:	00000513          	li	a0,0
                break;
    80004758:	f0dff06f          	j	80004664 <exceptionHandler+0x108>
                _sem::close((sem_t)a1);
    8000475c:	00098513          	mv	a0,s3
    80004760:	ffffd097          	auipc	ra,0xffffd
    80004764:	f18080e7          	jalr	-232(ra) # 80001678 <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80004768:	00000513          	li	a0,0
                break;
    8000476c:	ef9ff06f          	j	80004664 <exceptionHandler+0x108>
                _sem::wait((sem_t)a1);
    80004770:	00098513          	mv	a0,s3
    80004774:	ffffd097          	auipc	ra,0xffffd
    80004778:	f64080e7          	jalr	-156(ra) # 800016d8 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    8000477c:	00000513          	li	a0,0
                break;
    80004780:	ee5ff06f          	j	80004664 <exceptionHandler+0x108>
                _sem::signal((sem_t)a1);
    80004784:	00098513          	mv	a0,s3
    80004788:	ffffd097          	auipc	ra,0xffffd
    8000478c:	ff4080e7          	jalr	-12(ra) # 8000177c <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80004790:	00000513          	li	a0,0
                break;
    80004794:	ed1ff06f          	j	80004664 <exceptionHandler+0x108>
                returnVal = Timer::getInstance().sleep(a1);
    80004798:	ffffd097          	auipc	ra,0xffffd
    8000479c:	a20080e7          	jalr	-1504(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    800047a0:	00098593          	mv	a1,s3
    800047a4:	ffffd097          	auipc	ra,0xffffd
    800047a8:	b18080e7          	jalr	-1256(ra) # 800012bc <_ZN5Timer5sleepEm>
                break;
    800047ac:	eb9ff06f          	j	80004664 <exceptionHandler+0x108>
                returnVal = Console::getc();
    800047b0:	ffffe097          	auipc	ra,0xffffe
    800047b4:	81c080e7          	jalr	-2020(ra) # 80001fcc <_ZN7Console4getcEv>
                break;
    800047b8:	eadff06f          	j	80004664 <exceptionHandler+0x108>
                Console::putc(a1);
    800047bc:	0ff9f513          	andi	a0,s3,255
    800047c0:	ffffd097          	auipc	ra,0xffffd
    800047c4:	7d4080e7          	jalr	2004(ra) # 80001f94 <_ZN7Console4putcEc>
    uint64 returnVal = 0;
    800047c8:	00000513          	li	a0,0
                break;
    800047cc:	e99ff06f          	j	80004664 <exceptionHandler+0x108>
        switch(a0){
    800047d0:	00000513          	li	a0,0
    800047d4:	e91ff06f          	j	80004664 <exceptionHandler+0x108>
    800047d8:	00000513          	li	a0,0
    800047dc:	e89ff06f          	j	80004664 <exceptionHandler+0x108>
        putc('\n');
    800047e0:	00a00513          	li	a0,10
    800047e4:	ffffd097          	auipc	ra,0xffffd
    800047e8:	e14080e7          	jalr	-492(ra) # 800015f8 <_Z4putcc>
        putc('E');
    800047ec:	04500513          	li	a0,69
    800047f0:	ffffd097          	auipc	ra,0xffffd
    800047f4:	e08080e7          	jalr	-504(ra) # 800015f8 <_Z4putcc>
        putc('r');
    800047f8:	07200513          	li	a0,114
    800047fc:	ffffd097          	auipc	ra,0xffffd
    80004800:	dfc080e7          	jalr	-516(ra) # 800015f8 <_Z4putcc>
        putc('r');
    80004804:	07200513          	li	a0,114
    80004808:	ffffd097          	auipc	ra,0xffffd
    8000480c:	df0080e7          	jalr	-528(ra) # 800015f8 <_Z4putcc>
        putc('o');
    80004810:	06f00513          	li	a0,111
    80004814:	ffffd097          	auipc	ra,0xffffd
    80004818:	de4080e7          	jalr	-540(ra) # 800015f8 <_Z4putcc>
        putc('r');
    8000481c:	07200513          	li	a0,114
    80004820:	ffffd097          	auipc	ra,0xffffd
    80004824:	dd8080e7          	jalr	-552(ra) # 800015f8 <_Z4putcc>
        putc(':');
    80004828:	03a00513          	li	a0,58
    8000482c:	ffffd097          	auipc	ra,0xffffd
    80004830:	dcc080e7          	jalr	-564(ra) # 800015f8 <_Z4putcc>
        putc(' ');
    80004834:	02000513          	li	a0,32
    80004838:	ffffd097          	auipc	ra,0xffffd
    8000483c:	dc0080e7          	jalr	-576(ra) # 800015f8 <_Z4putcc>
        putc('i');
    80004840:	06900513          	li	a0,105
    80004844:	ffffd097          	auipc	ra,0xffffd
    80004848:	db4080e7          	jalr	-588(ra) # 800015f8 <_Z4putcc>
        putc('l');
    8000484c:	06c00513          	li	a0,108
    80004850:	ffffd097          	auipc	ra,0xffffd
    80004854:	da8080e7          	jalr	-600(ra) # 800015f8 <_Z4putcc>
        putc('l');
    80004858:	06c00513          	li	a0,108
    8000485c:	ffffd097          	auipc	ra,0xffffd
    80004860:	d9c080e7          	jalr	-612(ra) # 800015f8 <_Z4putcc>
        putc('e');
    80004864:	06500513          	li	a0,101
    80004868:	ffffd097          	auipc	ra,0xffffd
    8000486c:	d90080e7          	jalr	-624(ra) # 800015f8 <_Z4putcc>
        putc('g');
    80004870:	06700513          	li	a0,103
    80004874:	ffffd097          	auipc	ra,0xffffd
    80004878:	d84080e7          	jalr	-636(ra) # 800015f8 <_Z4putcc>
        putc('a');
    8000487c:	06100513          	li	a0,97
    80004880:	ffffd097          	auipc	ra,0xffffd
    80004884:	d78080e7          	jalr	-648(ra) # 800015f8 <_Z4putcc>
        putc('l');
    80004888:	06c00513          	li	a0,108
    8000488c:	ffffd097          	auipc	ra,0xffffd
    80004890:	d6c080e7          	jalr	-660(ra) # 800015f8 <_Z4putcc>
        putc(' ');
    80004894:	02000513          	li	a0,32
    80004898:	ffffd097          	auipc	ra,0xffffd
    8000489c:	d60080e7          	jalr	-672(ra) # 800015f8 <_Z4putcc>
        putc('r');
    800048a0:	07200513          	li	a0,114
    800048a4:	ffffd097          	auipc	ra,0xffffd
    800048a8:	d54080e7          	jalr	-684(ra) # 800015f8 <_Z4putcc>
        putc('e');
    800048ac:	06500513          	li	a0,101
    800048b0:	ffffd097          	auipc	ra,0xffffd
    800048b4:	d48080e7          	jalr	-696(ra) # 800015f8 <_Z4putcc>
        putc('a');
    800048b8:	06100513          	li	a0,97
    800048bc:	ffffd097          	auipc	ra,0xffffd
    800048c0:	d3c080e7          	jalr	-708(ra) # 800015f8 <_Z4putcc>
        putc('d');
    800048c4:	06400513          	li	a0,100
    800048c8:	ffffd097          	auipc	ra,0xffffd
    800048cc:	d30080e7          	jalr	-720(ra) # 800015f8 <_Z4putcc>
        putc('!');
    800048d0:	02100513          	li	a0,33
    800048d4:	ffffd097          	auipc	ra,0xffffd
    800048d8:	d24080e7          	jalr	-732(ra) # 800015f8 <_Z4putcc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    800048dc:	14102973          	csrr	s2,sepc
        putc('\n');
    800048e0:	00a00513          	li	a0,10
    800048e4:	ffffd097          	auipc	ra,0xffffd
    800048e8:	d14080e7          	jalr	-748(ra) # 800015f8 <_Z4putcc>
        putc('P');
    800048ec:	05000513          	li	a0,80
    800048f0:	ffffd097          	auipc	ra,0xffffd
    800048f4:	d08080e7          	jalr	-760(ra) # 800015f8 <_Z4putcc>
        putc('C');
    800048f8:	04300513          	li	a0,67
    800048fc:	ffffd097          	auipc	ra,0xffffd
    80004900:	cfc080e7          	jalr	-772(ra) # 800015f8 <_Z4putcc>
        putc(':');
    80004904:	03a00513          	li	a0,58
    80004908:	ffffd097          	auipc	ra,0xffffd
    8000490c:	cf0080e7          	jalr	-784(ra) # 800015f8 <_Z4putcc>
        putc(' ');
    80004910:	02000513          	li	a0,32
    80004914:	ffffd097          	auipc	ra,0xffffd
    80004918:	ce4080e7          	jalr	-796(ra) # 800015f8 <_Z4putcc>
        putc('0');
    8000491c:	03000513          	li	a0,48
    80004920:	ffffd097          	auipc	ra,0xffffd
    80004924:	cd8080e7          	jalr	-808(ra) # 800015f8 <_Z4putcc>
        putc('x');
    80004928:	07800513          	li	a0,120
    8000492c:	ffffd097          	auipc	ra,0xffffd
    80004930:	ccc080e7          	jalr	-820(ra) # 800015f8 <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004934:	00f00493          	li	s1,15
    80004938:	0140006f          	j	8000494c <exceptionHandler+0x3f0>
                putc('A' + tmp - 10);
    8000493c:	03750513          	addi	a0,a0,55
    80004940:	ffffd097          	auipc	ra,0xffffd
    80004944:	cb8080e7          	jalr	-840(ra) # 800015f8 <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004948:	fff4849b          	addiw	s1,s1,-1
    8000494c:	0204c463          	bltz	s1,80004974 <exceptionHandler+0x418>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    80004950:	0024951b          	slliw	a0,s1,0x2
    80004954:	00a95533          	srl	a0,s2,a0
    80004958:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    8000495c:	00900793          	li	a5,9
    80004960:	fca7eee3          	bltu	a5,a0,8000493c <exceptionHandler+0x3e0>
                putc('0' + tmp);
    80004964:	03050513          	addi	a0,a0,48
    80004968:	ffffd097          	auipc	ra,0xffffd
    8000496c:	c90080e7          	jalr	-880(ra) # 800015f8 <_Z4putcc>
    80004970:	fd9ff06f          	j	80004948 <exceptionHandler+0x3ec>
        assert(false);
    80004974:	00004697          	auipc	a3,0x4
    80004978:	97468693          	addi	a3,a3,-1676 # 800082e8 <CONSOLE_STATUS+0x2d8>
    8000497c:	08800613          	li	a2,136
    80004980:	00004597          	auipc	a1,0x4
    80004984:	98058593          	addi	a1,a1,-1664 # 80008300 <CONSOLE_STATUS+0x2f0>
    80004988:	00004517          	auipc	a0,0x4
    8000498c:	99850513          	addi	a0,a0,-1640 # 80008320 <CONSOLE_STATUS+0x310>
    80004990:	ffffd097          	auipc	ra,0xffffd
    80004994:	1ac080e7          	jalr	428(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    80004998:	ce5ff06f          	j	8000467c <exceptionHandler+0x120>
        putc('\n');
    8000499c:	00a00513          	li	a0,10
    800049a0:	ffffd097          	auipc	ra,0xffffd
    800049a4:	c58080e7          	jalr	-936(ra) # 800015f8 <_Z4putcc>
        putc('E');
    800049a8:	04500513          	li	a0,69
    800049ac:	ffffd097          	auipc	ra,0xffffd
    800049b0:	c4c080e7          	jalr	-948(ra) # 800015f8 <_Z4putcc>
        putc('r');
    800049b4:	07200513          	li	a0,114
    800049b8:	ffffd097          	auipc	ra,0xffffd
    800049bc:	c40080e7          	jalr	-960(ra) # 800015f8 <_Z4putcc>
        putc('r');
    800049c0:	07200513          	li	a0,114
    800049c4:	ffffd097          	auipc	ra,0xffffd
    800049c8:	c34080e7          	jalr	-972(ra) # 800015f8 <_Z4putcc>
        putc('o');
    800049cc:	06f00513          	li	a0,111
    800049d0:	ffffd097          	auipc	ra,0xffffd
    800049d4:	c28080e7          	jalr	-984(ra) # 800015f8 <_Z4putcc>
        putc('r');
    800049d8:	07200513          	li	a0,114
    800049dc:	ffffd097          	auipc	ra,0xffffd
    800049e0:	c1c080e7          	jalr	-996(ra) # 800015f8 <_Z4putcc>
        putc(':');
    800049e4:	03a00513          	li	a0,58
    800049e8:	ffffd097          	auipc	ra,0xffffd
    800049ec:	c10080e7          	jalr	-1008(ra) # 800015f8 <_Z4putcc>
        putc(' ');
    800049f0:	02000513          	li	a0,32
    800049f4:	ffffd097          	auipc	ra,0xffffd
    800049f8:	c04080e7          	jalr	-1020(ra) # 800015f8 <_Z4putcc>
        putc('i');
    800049fc:	06900513          	li	a0,105
    80004a00:	ffffd097          	auipc	ra,0xffffd
    80004a04:	bf8080e7          	jalr	-1032(ra) # 800015f8 <_Z4putcc>
        putc('l');
    80004a08:	06c00513          	li	a0,108
    80004a0c:	ffffd097          	auipc	ra,0xffffd
    80004a10:	bec080e7          	jalr	-1044(ra) # 800015f8 <_Z4putcc>
        putc('l');
    80004a14:	06c00513          	li	a0,108
    80004a18:	ffffd097          	auipc	ra,0xffffd
    80004a1c:	be0080e7          	jalr	-1056(ra) # 800015f8 <_Z4putcc>
        putc('e');
    80004a20:	06500513          	li	a0,101
    80004a24:	ffffd097          	auipc	ra,0xffffd
    80004a28:	bd4080e7          	jalr	-1068(ra) # 800015f8 <_Z4putcc>
        putc('g');
    80004a2c:	06700513          	li	a0,103
    80004a30:	ffffd097          	auipc	ra,0xffffd
    80004a34:	bc8080e7          	jalr	-1080(ra) # 800015f8 <_Z4putcc>
        putc('a');
    80004a38:	06100513          	li	a0,97
    80004a3c:	ffffd097          	auipc	ra,0xffffd
    80004a40:	bbc080e7          	jalr	-1092(ra) # 800015f8 <_Z4putcc>
        putc('l');
    80004a44:	06c00513          	li	a0,108
    80004a48:	ffffd097          	auipc	ra,0xffffd
    80004a4c:	bb0080e7          	jalr	-1104(ra) # 800015f8 <_Z4putcc>
        putc(' ');
    80004a50:	02000513          	li	a0,32
    80004a54:	ffffd097          	auipc	ra,0xffffd
    80004a58:	ba4080e7          	jalr	-1116(ra) # 800015f8 <_Z4putcc>
        putc('w');
    80004a5c:	07700513          	li	a0,119
    80004a60:	ffffd097          	auipc	ra,0xffffd
    80004a64:	b98080e7          	jalr	-1128(ra) # 800015f8 <_Z4putcc>
        putc('r');
    80004a68:	07200513          	li	a0,114
    80004a6c:	ffffd097          	auipc	ra,0xffffd
    80004a70:	b8c080e7          	jalr	-1140(ra) # 800015f8 <_Z4putcc>
        putc('i');
    80004a74:	06900513          	li	a0,105
    80004a78:	ffffd097          	auipc	ra,0xffffd
    80004a7c:	b80080e7          	jalr	-1152(ra) # 800015f8 <_Z4putcc>
        putc('t');
    80004a80:	07400513          	li	a0,116
    80004a84:	ffffd097          	auipc	ra,0xffffd
    80004a88:	b74080e7          	jalr	-1164(ra) # 800015f8 <_Z4putcc>
        putc('e');
    80004a8c:	06500513          	li	a0,101
    80004a90:	ffffd097          	auipc	ra,0xffffd
    80004a94:	b68080e7          	jalr	-1176(ra) # 800015f8 <_Z4putcc>
        putc('!');
    80004a98:	02100513          	li	a0,33
    80004a9c:	ffffd097          	auipc	ra,0xffffd
    80004aa0:	b5c080e7          	jalr	-1188(ra) # 800015f8 <_Z4putcc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80004aa4:	14102973          	csrr	s2,sepc
        putc('\n');
    80004aa8:	00a00513          	li	a0,10
    80004aac:	ffffd097          	auipc	ra,0xffffd
    80004ab0:	b4c080e7          	jalr	-1204(ra) # 800015f8 <_Z4putcc>
        putc('P');
    80004ab4:	05000513          	li	a0,80
    80004ab8:	ffffd097          	auipc	ra,0xffffd
    80004abc:	b40080e7          	jalr	-1216(ra) # 800015f8 <_Z4putcc>
        putc('C');
    80004ac0:	04300513          	li	a0,67
    80004ac4:	ffffd097          	auipc	ra,0xffffd
    80004ac8:	b34080e7          	jalr	-1228(ra) # 800015f8 <_Z4putcc>
        putc(':');
    80004acc:	03a00513          	li	a0,58
    80004ad0:	ffffd097          	auipc	ra,0xffffd
    80004ad4:	b28080e7          	jalr	-1240(ra) # 800015f8 <_Z4putcc>
        putc(' ');
    80004ad8:	02000513          	li	a0,32
    80004adc:	ffffd097          	auipc	ra,0xffffd
    80004ae0:	b1c080e7          	jalr	-1252(ra) # 800015f8 <_Z4putcc>
        putc('0');
    80004ae4:	03000513          	li	a0,48
    80004ae8:	ffffd097          	auipc	ra,0xffffd
    80004aec:	b10080e7          	jalr	-1264(ra) # 800015f8 <_Z4putcc>
        putc('x');
    80004af0:	07800513          	li	a0,120
    80004af4:	ffffd097          	auipc	ra,0xffffd
    80004af8:	b04080e7          	jalr	-1276(ra) # 800015f8 <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004afc:	00f00493          	li	s1,15
    80004b00:	0140006f          	j	80004b14 <exceptionHandler+0x5b8>
                putc('A' + tmp - 10);
    80004b04:	03750513          	addi	a0,a0,55
    80004b08:	ffffd097          	auipc	ra,0xffffd
    80004b0c:	af0080e7          	jalr	-1296(ra) # 800015f8 <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004b10:	fff4849b          	addiw	s1,s1,-1
    80004b14:	0204c463          	bltz	s1,80004b3c <exceptionHandler+0x5e0>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    80004b18:	0024951b          	slliw	a0,s1,0x2
    80004b1c:	00a95533          	srl	a0,s2,a0
    80004b20:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004b24:	00900793          	li	a5,9
    80004b28:	fca7eee3          	bltu	a5,a0,80004b04 <exceptionHandler+0x5a8>
                putc('0' + tmp);
    80004b2c:	03050513          	addi	a0,a0,48
    80004b30:	ffffd097          	auipc	ra,0xffffd
    80004b34:	ac8080e7          	jalr	-1336(ra) # 800015f8 <_Z4putcc>
    80004b38:	fd9ff06f          	j	80004b10 <exceptionHandler+0x5b4>
        assert(false);
    80004b3c:	00003697          	auipc	a3,0x3
    80004b40:	7ac68693          	addi	a3,a3,1964 # 800082e8 <CONSOLE_STATUS+0x2d8>
    80004b44:	0b200613          	li	a2,178
    80004b48:	00003597          	auipc	a1,0x3
    80004b4c:	7b858593          	addi	a1,a1,1976 # 80008300 <CONSOLE_STATUS+0x2f0>
    80004b50:	00003517          	auipc	a0,0x3
    80004b54:	7d050513          	addi	a0,a0,2000 # 80008320 <CONSOLE_STATUS+0x310>
    80004b58:	ffffd097          	auipc	ra,0xffffd
    80004b5c:	fe4080e7          	jalr	-28(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    80004b60:	b1dff06f          	j	8000467c <exceptionHandler+0x120>
        Timer::getInstance().tick();
    80004b64:	ffffc097          	auipc	ra,0xffffc
    80004b68:	654080e7          	jalr	1620(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    80004b6c:	ffffc097          	auipc	ra,0xffffc
    80004b70:	6b0080e7          	jalr	1712(ra) # 8000121c <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    80004b74:	00004797          	auipc	a5,0x4
    80004b78:	7ac7b783          	ld	a5,1964(a5) # 80009320 <_GLOBAL_OFFSET_TABLE_+0x58>
    80004b7c:	0007b503          	ld	a0,0(a5)
    80004b80:	ffffe097          	auipc	ra,0xffffe
    80004b84:	374080e7          	jalr	884(ra) # 80002ef4 <_ZN7_thread4tickEv>
    80004b88:	00051c63          	bnez	a0,80004ba0 <exceptionHandler+0x644>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80004b8c:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004b90:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80004b94:	00200793          	li	a5,2
    80004b98:	1447b073          	csrc	sip,a5
    80004b9c:	ae1ff06f          	j	8000467c <exceptionHandler+0x120>
        assert(_thread::currentThread->tick() == 0);
    80004ba0:	00003697          	auipc	a3,0x3
    80004ba4:	74868693          	addi	a3,a3,1864 # 800082e8 <CONSOLE_STATUS+0x2d8>
    80004ba8:	0b600613          	li	a2,182
    80004bac:	00003597          	auipc	a1,0x3
    80004bb0:	75458593          	addi	a1,a1,1876 # 80008300 <CONSOLE_STATUS+0x2f0>
    80004bb4:	00003517          	auipc	a0,0x3
    80004bb8:	77450513          	addi	a0,a0,1908 # 80008328 <CONSOLE_STATUS+0x318>
    80004bbc:	ffffd097          	auipc	ra,0xffffd
    80004bc0:	f80080e7          	jalr	-128(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    80004bc4:	fc9ff06f          	j	80004b8c <exceptionHandler+0x630>
        if(irq == CONSOLE_IRQ)Console::inputHandler();
    80004bc8:	ffffd097          	auipc	ra,0xffffd
    80004bcc:	4fc080e7          	jalr	1276(ra) # 800020c4 <_ZN7Console12inputHandlerEv>
    80004bd0:	a25ff06f          	j	800045f4 <exceptionHandler+0x98>

0000000080004bd4 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80004bd4:	fe010113          	addi	sp,sp,-32
    80004bd8:	00113c23          	sd	ra,24(sp)
    80004bdc:	00813823          	sd	s0,16(sp)
    80004be0:	00913423          	sd	s1,8(sp)
    80004be4:	02010413          	addi	s0,sp,32
    80004be8:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80004bec:	00004797          	auipc	a5,0x4
    80004bf0:	7bc7b783          	ld	a5,1980(a5) # 800093a8 <_ZN9Scheduler9singletonE>
    80004bf4:	02079463          	bnez	a5,80004c1c <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80004bf8:	00004797          	auipc	a5,0x4
    80004bfc:	7a97b823          	sd	s1,1968(a5) # 800093a8 <_ZN9Scheduler9singletonE>
    head = 0;
    80004c00:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80004c04:	0004b423          	sd	zero,8(s1)
}
    80004c08:	01813083          	ld	ra,24(sp)
    80004c0c:	01013403          	ld	s0,16(sp)
    80004c10:	00813483          	ld	s1,8(sp)
    80004c14:	02010113          	addi	sp,sp,32
    80004c18:	00008067          	ret
    assert(singleton == 0);
    80004c1c:	00004697          	auipc	a3,0x4
    80004c20:	83c68693          	addi	a3,a3,-1988 # 80008458 <CONSOLE_STATUS+0x448>
    80004c24:	01800613          	li	a2,24
    80004c28:	00004597          	auipc	a1,0x4
    80004c2c:	84858593          	addi	a1,a1,-1976 # 80008470 <CONSOLE_STATUS+0x460>
    80004c30:	00004517          	auipc	a0,0x4
    80004c34:	85050513          	addi	a0,a0,-1968 # 80008480 <CONSOLE_STATUS+0x470>
    80004c38:	ffffd097          	auipc	ra,0xffffd
    80004c3c:	f04080e7          	jalr	-252(ra) # 80001b3c <_Z13assert_failedPKcS0_jS0_>
    80004c40:	fb9ff06f          	j	80004bf8 <_ZN9SchedulerC1Ev+0x24>

0000000080004c44 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80004c44:	ff010113          	addi	sp,sp,-16
    80004c48:	00813423          	sd	s0,8(sp)
    80004c4c:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80004c50:	00004797          	auipc	a5,0x4
    80004c54:	7587b783          	ld	a5,1880(a5) # 800093a8 <_ZN9Scheduler9singletonE>
    80004c58:	0007b503          	ld	a0,0(a5)
}
    80004c5c:	00153513          	seqz	a0,a0
    80004c60:	00813403          	ld	s0,8(sp)
    80004c64:	01010113          	addi	sp,sp,16
    80004c68:	00008067          	ret

0000000080004c6c <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80004c6c:	fe010113          	addi	sp,sp,-32
    80004c70:	00113c23          	sd	ra,24(sp)
    80004c74:	00813823          	sd	s0,16(sp)
    80004c78:	00913423          	sd	s1,8(sp)
    80004c7c:	01213023          	sd	s2,0(sp)
    80004c80:	02010413          	addi	s0,sp,32
    80004c84:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80004c88:	00004917          	auipc	s2,0x4
    80004c8c:	72093903          	ld	s2,1824(s2) # 800093a8 <_ZN9Scheduler9singletonE>
    80004c90:	00093783          	ld	a5,0(s2)
    80004c94:	12078c63          	beqz	a5,80004dcc <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80004c98:	00893903          	ld	s2,8(s2)
    80004c9c:	01000513          	li	a0,16
    80004ca0:	ffffc097          	auipc	ra,0xffffc
    80004ca4:	70c080e7          	jalr	1804(ra) # 800013ac <_Z9mem_allocm>
    80004ca8:	00a90423          	sb	a0,8(s2)
    80004cac:	00855793          	srli	a5,a0,0x8
    80004cb0:	00f904a3          	sb	a5,9(s2)
    80004cb4:	01055793          	srli	a5,a0,0x10
    80004cb8:	00f90523          	sb	a5,10(s2)
    80004cbc:	0185579b          	srliw	a5,a0,0x18
    80004cc0:	00f905a3          	sb	a5,11(s2)
    80004cc4:	02055793          	srli	a5,a0,0x20
    80004cc8:	00f90623          	sb	a5,12(s2)
    80004ccc:	02855793          	srli	a5,a0,0x28
    80004cd0:	00f906a3          	sb	a5,13(s2)
    80004cd4:	03055793          	srli	a5,a0,0x30
    80004cd8:	00f90723          	sb	a5,14(s2)
    80004cdc:	03855513          	srli	a0,a0,0x38
    80004ce0:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80004ce4:	00004617          	auipc	a2,0x4
    80004ce8:	6c460613          	addi	a2,a2,1732 # 800093a8 <_ZN9Scheduler9singletonE>
    80004cec:	00063583          	ld	a1,0(a2)
    80004cf0:	0085b703          	ld	a4,8(a1)
    80004cf4:	00874783          	lbu	a5,8(a4)
    80004cf8:	00974683          	lbu	a3,9(a4)
    80004cfc:	00869693          	slli	a3,a3,0x8
    80004d00:	00f6e6b3          	or	a3,a3,a5
    80004d04:	00a74783          	lbu	a5,10(a4)
    80004d08:	01079793          	slli	a5,a5,0x10
    80004d0c:	00d7e6b3          	or	a3,a5,a3
    80004d10:	00b74783          	lbu	a5,11(a4)
    80004d14:	01879793          	slli	a5,a5,0x18
    80004d18:	00d7e7b3          	or	a5,a5,a3
    80004d1c:	00c74683          	lbu	a3,12(a4)
    80004d20:	02069693          	slli	a3,a3,0x20
    80004d24:	00f6e7b3          	or	a5,a3,a5
    80004d28:	00d74683          	lbu	a3,13(a4)
    80004d2c:	02869693          	slli	a3,a3,0x28
    80004d30:	00f6e6b3          	or	a3,a3,a5
    80004d34:	00e74783          	lbu	a5,14(a4)
    80004d38:	03079793          	slli	a5,a5,0x30
    80004d3c:	00d7e6b3          	or	a3,a5,a3
    80004d40:	00f74783          	lbu	a5,15(a4)
    80004d44:	03879793          	slli	a5,a5,0x38
    80004d48:	00d7e7b3          	or	a5,a5,a3
    80004d4c:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80004d50:	00978023          	sb	s1,0(a5)
    80004d54:	0084d713          	srli	a4,s1,0x8
    80004d58:	00e780a3          	sb	a4,1(a5)
    80004d5c:	0104d713          	srli	a4,s1,0x10
    80004d60:	00e78123          	sb	a4,2(a5)
    80004d64:	0184d71b          	srliw	a4,s1,0x18
    80004d68:	00e781a3          	sb	a4,3(a5)
    80004d6c:	0204d713          	srli	a4,s1,0x20
    80004d70:	00e78223          	sb	a4,4(a5)
    80004d74:	0284d713          	srli	a4,s1,0x28
    80004d78:	00e782a3          	sb	a4,5(a5)
    80004d7c:	0304d713          	srli	a4,s1,0x30
    80004d80:	00e78323          	sb	a4,6(a5)
    80004d84:	0384d493          	srli	s1,s1,0x38
    80004d88:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80004d8c:	00063783          	ld	a5,0(a2)
    80004d90:	0087b783          	ld	a5,8(a5)
    80004d94:	00078423          	sb	zero,8(a5)
    80004d98:	000784a3          	sb	zero,9(a5)
    80004d9c:	00078523          	sb	zero,10(a5)
    80004da0:	000785a3          	sb	zero,11(a5)
    80004da4:	00078623          	sb	zero,12(a5)
    80004da8:	000786a3          	sb	zero,13(a5)
    80004dac:	00078723          	sb	zero,14(a5)
    80004db0:	000787a3          	sb	zero,15(a5)
    }
}
    80004db4:	01813083          	ld	ra,24(sp)
    80004db8:	01013403          	ld	s0,16(sp)
    80004dbc:	00813483          	ld	s1,8(sp)
    80004dc0:	00013903          	ld	s2,0(sp)
    80004dc4:	02010113          	addi	sp,sp,32
    80004dc8:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80004dcc:	01000513          	li	a0,16
    80004dd0:	ffffc097          	auipc	ra,0xffffc
    80004dd4:	5dc080e7          	jalr	1500(ra) # 800013ac <_Z9mem_allocm>
    80004dd8:	00a93423          	sd	a0,8(s2)
    80004ddc:	00004717          	auipc	a4,0x4
    80004de0:	5cc70713          	addi	a4,a4,1484 # 800093a8 <_ZN9Scheduler9singletonE>
    80004de4:	00073783          	ld	a5,0(a4)
    80004de8:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80004dec:	00073783          	ld	a5,0(a4)
    80004df0:	0007b783          	ld	a5,0(a5)
    80004df4:	00978023          	sb	s1,0(a5)
    80004df8:	0084d693          	srli	a3,s1,0x8
    80004dfc:	00d780a3          	sb	a3,1(a5)
    80004e00:	0104d693          	srli	a3,s1,0x10
    80004e04:	00d78123          	sb	a3,2(a5)
    80004e08:	0184d69b          	srliw	a3,s1,0x18
    80004e0c:	00d781a3          	sb	a3,3(a5)
    80004e10:	0204d693          	srli	a3,s1,0x20
    80004e14:	00d78223          	sb	a3,4(a5)
    80004e18:	0284d693          	srli	a3,s1,0x28
    80004e1c:	00d782a3          	sb	a3,5(a5)
    80004e20:	0304d693          	srli	a3,s1,0x30
    80004e24:	00d78323          	sb	a3,6(a5)
    80004e28:	0384d493          	srli	s1,s1,0x38
    80004e2c:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80004e30:	00073783          	ld	a5,0(a4)
    80004e34:	0007b783          	ld	a5,0(a5)
    80004e38:	00078423          	sb	zero,8(a5)
    80004e3c:	000784a3          	sb	zero,9(a5)
    80004e40:	00078523          	sb	zero,10(a5)
    80004e44:	000785a3          	sb	zero,11(a5)
    80004e48:	00078623          	sb	zero,12(a5)
    80004e4c:	000786a3          	sb	zero,13(a5)
    80004e50:	00078723          	sb	zero,14(a5)
    80004e54:	000787a3          	sb	zero,15(a5)
    80004e58:	f5dff06f          	j	80004db4 <_ZN9Scheduler3putEP7_thread+0x148>

0000000080004e5c <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80004e5c:	fe010113          	addi	sp,sp,-32
    80004e60:	00113c23          	sd	ra,24(sp)
    80004e64:	00813823          	sd	s0,16(sp)
    80004e68:	00913423          	sd	s1,8(sp)
    80004e6c:	02010413          	addi	s0,sp,32
    ThreadList* tmp = singleton->head;
    80004e70:	00004697          	auipc	a3,0x4
    80004e74:	5386b683          	ld	a3,1336(a3) # 800093a8 <_ZN9Scheduler9singletonE>
    80004e78:	0006b503          	ld	a0,0(a3)
    if(tmp == 0){
    80004e7c:	0e050863          	beqz	a0,80004f6c <_ZN9Scheduler3getEv+0x110>
        return 0;
    }
    thread_t thread = tmp->thread;
    80004e80:	00054483          	lbu	s1,0(a0)
    80004e84:	00154783          	lbu	a5,1(a0)
    80004e88:	00879793          	slli	a5,a5,0x8
    80004e8c:	0097e7b3          	or	a5,a5,s1
    80004e90:	00254483          	lbu	s1,2(a0)
    80004e94:	01049493          	slli	s1,s1,0x10
    80004e98:	00f4e7b3          	or	a5,s1,a5
    80004e9c:	00354483          	lbu	s1,3(a0)
    80004ea0:	01849493          	slli	s1,s1,0x18
    80004ea4:	00f4e4b3          	or	s1,s1,a5
    80004ea8:	00454783          	lbu	a5,4(a0)
    80004eac:	02079793          	slli	a5,a5,0x20
    80004eb0:	0097e4b3          	or	s1,a5,s1
    80004eb4:	00554783          	lbu	a5,5(a0)
    80004eb8:	02879793          	slli	a5,a5,0x28
    80004ebc:	0097e7b3          	or	a5,a5,s1
    80004ec0:	00654483          	lbu	s1,6(a0)
    80004ec4:	03049493          	slli	s1,s1,0x30
    80004ec8:	00f4e7b3          	or	a5,s1,a5
    80004ecc:	00754483          	lbu	s1,7(a0)
    80004ed0:	03849493          	slli	s1,s1,0x38
    80004ed4:	00f4e4b3          	or	s1,s1,a5
    singleton->head = tmp->next;
    80004ed8:	00854783          	lbu	a5,8(a0)
    80004edc:	00954703          	lbu	a4,9(a0)
    80004ee0:	00871713          	slli	a4,a4,0x8
    80004ee4:	00f76733          	or	a4,a4,a5
    80004ee8:	00a54783          	lbu	a5,10(a0)
    80004eec:	01079793          	slli	a5,a5,0x10
    80004ef0:	00e7e733          	or	a4,a5,a4
    80004ef4:	00b54783          	lbu	a5,11(a0)
    80004ef8:	01879793          	slli	a5,a5,0x18
    80004efc:	00e7e7b3          	or	a5,a5,a4
    80004f00:	00c54703          	lbu	a4,12(a0)
    80004f04:	02071713          	slli	a4,a4,0x20
    80004f08:	00f767b3          	or	a5,a4,a5
    80004f0c:	00d54703          	lbu	a4,13(a0)
    80004f10:	02871713          	slli	a4,a4,0x28
    80004f14:	00f76733          	or	a4,a4,a5
    80004f18:	00e54783          	lbu	a5,14(a0)
    80004f1c:	03079793          	slli	a5,a5,0x30
    80004f20:	00e7e733          	or	a4,a5,a4
    80004f24:	00f54783          	lbu	a5,15(a0)
    80004f28:	03879793          	slli	a5,a5,0x38
    80004f2c:	00e7e7b3          	or	a5,a5,a4
    80004f30:	00f6b023          	sd	a5,0(a3)
    if(singleton->head == 0){
    80004f34:	00004797          	auipc	a5,0x4
    80004f38:	4747b783          	ld	a5,1140(a5) # 800093a8 <_ZN9Scheduler9singletonE>
    80004f3c:	0007b703          	ld	a4,0(a5)
    80004f40:	02070263          	beqz	a4,80004f64 <_ZN9Scheduler3getEv+0x108>
        singleton->tail = 0;
    }
    mem_free(tmp);
    80004f44:	ffffc097          	auipc	ra,0xffffc
    80004f48:	498080e7          	jalr	1176(ra) # 800013dc <_Z8mem_freePv>
    return thread;
}
    80004f4c:	00048513          	mv	a0,s1
    80004f50:	01813083          	ld	ra,24(sp)
    80004f54:	01013403          	ld	s0,16(sp)
    80004f58:	00813483          	ld	s1,8(sp)
    80004f5c:	02010113          	addi	sp,sp,32
    80004f60:	00008067          	ret
        singleton->tail = 0;
    80004f64:	0007b423          	sd	zero,8(a5)
    80004f68:	fddff06f          	j	80004f44 <_ZN9Scheduler3getEv+0xe8>
        return 0;
    80004f6c:	00050493          	mv	s1,a0
    80004f70:	fddff06f          	j	80004f4c <_ZN9Scheduler3getEv+0xf0>

0000000080004f74 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80004f74:	ff010113          	addi	sp,sp,-16
    80004f78:	00813423          	sd	s0,8(sp)
    80004f7c:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80004f80:	00004797          	auipc	a5,0x4
    80004f84:	4287b783          	ld	a5,1064(a5) # 800093a8 <_ZN9Scheduler9singletonE>
    80004f88:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80004f8c:	00000513          	li	a0,0
    while(tmp != 0){
    80004f90:	06078263          	beqz	a5,80004ff4 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80004f94:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80004f98:	0087c683          	lbu	a3,8(a5)
    80004f9c:	0097c703          	lbu	a4,9(a5)
    80004fa0:	00871713          	slli	a4,a4,0x8
    80004fa4:	00d766b3          	or	a3,a4,a3
    80004fa8:	00a7c703          	lbu	a4,10(a5)
    80004fac:	01071713          	slli	a4,a4,0x10
    80004fb0:	00d76733          	or	a4,a4,a3
    80004fb4:	00b7c683          	lbu	a3,11(a5)
    80004fb8:	01869693          	slli	a3,a3,0x18
    80004fbc:	00e6e733          	or	a4,a3,a4
    80004fc0:	00c7c683          	lbu	a3,12(a5)
    80004fc4:	02069693          	slli	a3,a3,0x20
    80004fc8:	00e6e6b3          	or	a3,a3,a4
    80004fcc:	00d7c703          	lbu	a4,13(a5)
    80004fd0:	02871713          	slli	a4,a4,0x28
    80004fd4:	00d766b3          	or	a3,a4,a3
    80004fd8:	00e7c703          	lbu	a4,14(a5)
    80004fdc:	03071713          	slli	a4,a4,0x30
    80004fe0:	00d76733          	or	a4,a4,a3
    80004fe4:	00f7c783          	lbu	a5,15(a5)
    80004fe8:	03879793          	slli	a5,a5,0x38
    80004fec:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80004ff0:	fa1ff06f          	j	80004f90 <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80004ff4:	00813403          	ld	s0,8(sp)
    80004ff8:	01010113          	addi	sp,sp,16
    80004ffc:	00008067          	ret

0000000080005000 <start>:
    80005000:	ff010113          	addi	sp,sp,-16
    80005004:	00813423          	sd	s0,8(sp)
    80005008:	01010413          	addi	s0,sp,16
    8000500c:	300027f3          	csrr	a5,mstatus
    80005010:	ffffe737          	lui	a4,0xffffe
    80005014:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff41ef>
    80005018:	00e7f7b3          	and	a5,a5,a4
    8000501c:	00001737          	lui	a4,0x1
    80005020:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80005024:	00e7e7b3          	or	a5,a5,a4
    80005028:	30079073          	csrw	mstatus,a5
    8000502c:	00000797          	auipc	a5,0x0
    80005030:	16078793          	addi	a5,a5,352 # 8000518c <system_main>
    80005034:	34179073          	csrw	mepc,a5
    80005038:	00000793          	li	a5,0
    8000503c:	18079073          	csrw	satp,a5
    80005040:	000107b7          	lui	a5,0x10
    80005044:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005048:	30279073          	csrw	medeleg,a5
    8000504c:	30379073          	csrw	mideleg,a5
    80005050:	104027f3          	csrr	a5,sie
    80005054:	2227e793          	ori	a5,a5,546
    80005058:	10479073          	csrw	sie,a5
    8000505c:	fff00793          	li	a5,-1
    80005060:	00a7d793          	srli	a5,a5,0xa
    80005064:	3b079073          	csrw	pmpaddr0,a5
    80005068:	00f00793          	li	a5,15
    8000506c:	3a079073          	csrw	pmpcfg0,a5
    80005070:	f14027f3          	csrr	a5,mhartid
    80005074:	0200c737          	lui	a4,0x200c
    80005078:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000507c:	0007869b          	sext.w	a3,a5
    80005080:	00269713          	slli	a4,a3,0x2
    80005084:	000f4637          	lui	a2,0xf4
    80005088:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000508c:	00d70733          	add	a4,a4,a3
    80005090:	0037979b          	slliw	a5,a5,0x3
    80005094:	020046b7          	lui	a3,0x2004
    80005098:	00d787b3          	add	a5,a5,a3
    8000509c:	00c585b3          	add	a1,a1,a2
    800050a0:	00371693          	slli	a3,a4,0x3
    800050a4:	00004717          	auipc	a4,0x4
    800050a8:	30c70713          	addi	a4,a4,780 # 800093b0 <timer_scratch>
    800050ac:	00b7b023          	sd	a1,0(a5)
    800050b0:	00d70733          	add	a4,a4,a3
    800050b4:	00f73c23          	sd	a5,24(a4)
    800050b8:	02c73023          	sd	a2,32(a4)
    800050bc:	34071073          	csrw	mscratch,a4
    800050c0:	00000797          	auipc	a5,0x0
    800050c4:	6e078793          	addi	a5,a5,1760 # 800057a0 <timervec>
    800050c8:	30579073          	csrw	mtvec,a5
    800050cc:	300027f3          	csrr	a5,mstatus
    800050d0:	0087e793          	ori	a5,a5,8
    800050d4:	30079073          	csrw	mstatus,a5
    800050d8:	304027f3          	csrr	a5,mie
    800050dc:	0807e793          	ori	a5,a5,128
    800050e0:	30479073          	csrw	mie,a5
    800050e4:	f14027f3          	csrr	a5,mhartid
    800050e8:	0007879b          	sext.w	a5,a5
    800050ec:	00078213          	mv	tp,a5
    800050f0:	30200073          	mret
    800050f4:	00813403          	ld	s0,8(sp)
    800050f8:	01010113          	addi	sp,sp,16
    800050fc:	00008067          	ret

0000000080005100 <timerinit>:
    80005100:	ff010113          	addi	sp,sp,-16
    80005104:	00813423          	sd	s0,8(sp)
    80005108:	01010413          	addi	s0,sp,16
    8000510c:	f14027f3          	csrr	a5,mhartid
    80005110:	0200c737          	lui	a4,0x200c
    80005114:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005118:	0007869b          	sext.w	a3,a5
    8000511c:	00269713          	slli	a4,a3,0x2
    80005120:	000f4637          	lui	a2,0xf4
    80005124:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005128:	00d70733          	add	a4,a4,a3
    8000512c:	0037979b          	slliw	a5,a5,0x3
    80005130:	020046b7          	lui	a3,0x2004
    80005134:	00d787b3          	add	a5,a5,a3
    80005138:	00c585b3          	add	a1,a1,a2
    8000513c:	00371693          	slli	a3,a4,0x3
    80005140:	00004717          	auipc	a4,0x4
    80005144:	27070713          	addi	a4,a4,624 # 800093b0 <timer_scratch>
    80005148:	00b7b023          	sd	a1,0(a5)
    8000514c:	00d70733          	add	a4,a4,a3
    80005150:	00f73c23          	sd	a5,24(a4)
    80005154:	02c73023          	sd	a2,32(a4)
    80005158:	34071073          	csrw	mscratch,a4
    8000515c:	00000797          	auipc	a5,0x0
    80005160:	64478793          	addi	a5,a5,1604 # 800057a0 <timervec>
    80005164:	30579073          	csrw	mtvec,a5
    80005168:	300027f3          	csrr	a5,mstatus
    8000516c:	0087e793          	ori	a5,a5,8
    80005170:	30079073          	csrw	mstatus,a5
    80005174:	304027f3          	csrr	a5,mie
    80005178:	0807e793          	ori	a5,a5,128
    8000517c:	30479073          	csrw	mie,a5
    80005180:	00813403          	ld	s0,8(sp)
    80005184:	01010113          	addi	sp,sp,16
    80005188:	00008067          	ret

000000008000518c <system_main>:
    8000518c:	fe010113          	addi	sp,sp,-32
    80005190:	00813823          	sd	s0,16(sp)
    80005194:	00913423          	sd	s1,8(sp)
    80005198:	00113c23          	sd	ra,24(sp)
    8000519c:	02010413          	addi	s0,sp,32
    800051a0:	00000097          	auipc	ra,0x0
    800051a4:	0c4080e7          	jalr	196(ra) # 80005264 <cpuid>
    800051a8:	00004497          	auipc	s1,0x4
    800051ac:	19848493          	addi	s1,s1,408 # 80009340 <started>
    800051b0:	02050263          	beqz	a0,800051d4 <system_main+0x48>
    800051b4:	0004a783          	lw	a5,0(s1)
    800051b8:	0007879b          	sext.w	a5,a5
    800051bc:	fe078ce3          	beqz	a5,800051b4 <system_main+0x28>
    800051c0:	0ff0000f          	fence
    800051c4:	00003517          	auipc	a0,0x3
    800051c8:	2fc50513          	addi	a0,a0,764 # 800084c0 <CONSOLE_STATUS+0x4b0>
    800051cc:	00001097          	auipc	ra,0x1
    800051d0:	a70080e7          	jalr	-1424(ra) # 80005c3c <panic>
    800051d4:	00001097          	auipc	ra,0x1
    800051d8:	9c4080e7          	jalr	-1596(ra) # 80005b98 <consoleinit>
    800051dc:	00001097          	auipc	ra,0x1
    800051e0:	150080e7          	jalr	336(ra) # 8000632c <printfinit>
    800051e4:	00003517          	auipc	a0,0x3
    800051e8:	3bc50513          	addi	a0,a0,956 # 800085a0 <CONSOLE_STATUS+0x590>
    800051ec:	00001097          	auipc	ra,0x1
    800051f0:	aac080e7          	jalr	-1364(ra) # 80005c98 <__printf>
    800051f4:	00003517          	auipc	a0,0x3
    800051f8:	29c50513          	addi	a0,a0,668 # 80008490 <CONSOLE_STATUS+0x480>
    800051fc:	00001097          	auipc	ra,0x1
    80005200:	a9c080e7          	jalr	-1380(ra) # 80005c98 <__printf>
    80005204:	00003517          	auipc	a0,0x3
    80005208:	39c50513          	addi	a0,a0,924 # 800085a0 <CONSOLE_STATUS+0x590>
    8000520c:	00001097          	auipc	ra,0x1
    80005210:	a8c080e7          	jalr	-1396(ra) # 80005c98 <__printf>
    80005214:	00001097          	auipc	ra,0x1
    80005218:	4a4080e7          	jalr	1188(ra) # 800066b8 <kinit>
    8000521c:	00000097          	auipc	ra,0x0
    80005220:	148080e7          	jalr	328(ra) # 80005364 <trapinit>
    80005224:	00000097          	auipc	ra,0x0
    80005228:	16c080e7          	jalr	364(ra) # 80005390 <trapinithart>
    8000522c:	00000097          	auipc	ra,0x0
    80005230:	5b4080e7          	jalr	1460(ra) # 800057e0 <plicinit>
    80005234:	00000097          	auipc	ra,0x0
    80005238:	5d4080e7          	jalr	1492(ra) # 80005808 <plicinithart>
    8000523c:	00000097          	auipc	ra,0x0
    80005240:	078080e7          	jalr	120(ra) # 800052b4 <userinit>
    80005244:	0ff0000f          	fence
    80005248:	00100793          	li	a5,1
    8000524c:	00003517          	auipc	a0,0x3
    80005250:	25c50513          	addi	a0,a0,604 # 800084a8 <CONSOLE_STATUS+0x498>
    80005254:	00f4a023          	sw	a5,0(s1)
    80005258:	00001097          	auipc	ra,0x1
    8000525c:	a40080e7          	jalr	-1472(ra) # 80005c98 <__printf>
    80005260:	0000006f          	j	80005260 <system_main+0xd4>

0000000080005264 <cpuid>:
    80005264:	ff010113          	addi	sp,sp,-16
    80005268:	00813423          	sd	s0,8(sp)
    8000526c:	01010413          	addi	s0,sp,16
    80005270:	00020513          	mv	a0,tp
    80005274:	00813403          	ld	s0,8(sp)
    80005278:	0005051b          	sext.w	a0,a0
    8000527c:	01010113          	addi	sp,sp,16
    80005280:	00008067          	ret

0000000080005284 <mycpu>:
    80005284:	ff010113          	addi	sp,sp,-16
    80005288:	00813423          	sd	s0,8(sp)
    8000528c:	01010413          	addi	s0,sp,16
    80005290:	00020793          	mv	a5,tp
    80005294:	00813403          	ld	s0,8(sp)
    80005298:	0007879b          	sext.w	a5,a5
    8000529c:	00779793          	slli	a5,a5,0x7
    800052a0:	00005517          	auipc	a0,0x5
    800052a4:	14050513          	addi	a0,a0,320 # 8000a3e0 <cpus>
    800052a8:	00f50533          	add	a0,a0,a5
    800052ac:	01010113          	addi	sp,sp,16
    800052b0:	00008067          	ret

00000000800052b4 <userinit>:
    800052b4:	ff010113          	addi	sp,sp,-16
    800052b8:	00813423          	sd	s0,8(sp)
    800052bc:	01010413          	addi	s0,sp,16
    800052c0:	00813403          	ld	s0,8(sp)
    800052c4:	01010113          	addi	sp,sp,16
    800052c8:	ffffc317          	auipc	t1,0xffffc
    800052cc:	53430067          	jr	1332(t1) # 800017fc <main>

00000000800052d0 <either_copyout>:
    800052d0:	ff010113          	addi	sp,sp,-16
    800052d4:	00813023          	sd	s0,0(sp)
    800052d8:	00113423          	sd	ra,8(sp)
    800052dc:	01010413          	addi	s0,sp,16
    800052e0:	02051663          	bnez	a0,8000530c <either_copyout+0x3c>
    800052e4:	00058513          	mv	a0,a1
    800052e8:	00060593          	mv	a1,a2
    800052ec:	0006861b          	sext.w	a2,a3
    800052f0:	00002097          	auipc	ra,0x2
    800052f4:	c54080e7          	jalr	-940(ra) # 80006f44 <__memmove>
    800052f8:	00813083          	ld	ra,8(sp)
    800052fc:	00013403          	ld	s0,0(sp)
    80005300:	00000513          	li	a0,0
    80005304:	01010113          	addi	sp,sp,16
    80005308:	00008067          	ret
    8000530c:	00003517          	auipc	a0,0x3
    80005310:	1dc50513          	addi	a0,a0,476 # 800084e8 <CONSOLE_STATUS+0x4d8>
    80005314:	00001097          	auipc	ra,0x1
    80005318:	928080e7          	jalr	-1752(ra) # 80005c3c <panic>

000000008000531c <either_copyin>:
    8000531c:	ff010113          	addi	sp,sp,-16
    80005320:	00813023          	sd	s0,0(sp)
    80005324:	00113423          	sd	ra,8(sp)
    80005328:	01010413          	addi	s0,sp,16
    8000532c:	02059463          	bnez	a1,80005354 <either_copyin+0x38>
    80005330:	00060593          	mv	a1,a2
    80005334:	0006861b          	sext.w	a2,a3
    80005338:	00002097          	auipc	ra,0x2
    8000533c:	c0c080e7          	jalr	-1012(ra) # 80006f44 <__memmove>
    80005340:	00813083          	ld	ra,8(sp)
    80005344:	00013403          	ld	s0,0(sp)
    80005348:	00000513          	li	a0,0
    8000534c:	01010113          	addi	sp,sp,16
    80005350:	00008067          	ret
    80005354:	00003517          	auipc	a0,0x3
    80005358:	1bc50513          	addi	a0,a0,444 # 80008510 <CONSOLE_STATUS+0x500>
    8000535c:	00001097          	auipc	ra,0x1
    80005360:	8e0080e7          	jalr	-1824(ra) # 80005c3c <panic>

0000000080005364 <trapinit>:
    80005364:	ff010113          	addi	sp,sp,-16
    80005368:	00813423          	sd	s0,8(sp)
    8000536c:	01010413          	addi	s0,sp,16
    80005370:	00813403          	ld	s0,8(sp)
    80005374:	00003597          	auipc	a1,0x3
    80005378:	1c458593          	addi	a1,a1,452 # 80008538 <CONSOLE_STATUS+0x528>
    8000537c:	00005517          	auipc	a0,0x5
    80005380:	0e450513          	addi	a0,a0,228 # 8000a460 <tickslock>
    80005384:	01010113          	addi	sp,sp,16
    80005388:	00001317          	auipc	t1,0x1
    8000538c:	5c030067          	jr	1472(t1) # 80006948 <initlock>

0000000080005390 <trapinithart>:
    80005390:	ff010113          	addi	sp,sp,-16
    80005394:	00813423          	sd	s0,8(sp)
    80005398:	01010413          	addi	s0,sp,16
    8000539c:	00000797          	auipc	a5,0x0
    800053a0:	2f478793          	addi	a5,a5,756 # 80005690 <kernelvec>
    800053a4:	10579073          	csrw	stvec,a5
    800053a8:	00813403          	ld	s0,8(sp)
    800053ac:	01010113          	addi	sp,sp,16
    800053b0:	00008067          	ret

00000000800053b4 <usertrap>:
    800053b4:	ff010113          	addi	sp,sp,-16
    800053b8:	00813423          	sd	s0,8(sp)
    800053bc:	01010413          	addi	s0,sp,16
    800053c0:	00813403          	ld	s0,8(sp)
    800053c4:	01010113          	addi	sp,sp,16
    800053c8:	00008067          	ret

00000000800053cc <usertrapret>:
    800053cc:	ff010113          	addi	sp,sp,-16
    800053d0:	00813423          	sd	s0,8(sp)
    800053d4:	01010413          	addi	s0,sp,16
    800053d8:	00813403          	ld	s0,8(sp)
    800053dc:	01010113          	addi	sp,sp,16
    800053e0:	00008067          	ret

00000000800053e4 <kerneltrap>:
    800053e4:	fe010113          	addi	sp,sp,-32
    800053e8:	00813823          	sd	s0,16(sp)
    800053ec:	00113c23          	sd	ra,24(sp)
    800053f0:	00913423          	sd	s1,8(sp)
    800053f4:	02010413          	addi	s0,sp,32
    800053f8:	142025f3          	csrr	a1,scause
    800053fc:	100027f3          	csrr	a5,sstatus
    80005400:	0027f793          	andi	a5,a5,2
    80005404:	10079c63          	bnez	a5,8000551c <kerneltrap+0x138>
    80005408:	142027f3          	csrr	a5,scause
    8000540c:	0207ce63          	bltz	a5,80005448 <kerneltrap+0x64>
    80005410:	00003517          	auipc	a0,0x3
    80005414:	17050513          	addi	a0,a0,368 # 80008580 <CONSOLE_STATUS+0x570>
    80005418:	00001097          	auipc	ra,0x1
    8000541c:	880080e7          	jalr	-1920(ra) # 80005c98 <__printf>
    80005420:	141025f3          	csrr	a1,sepc
    80005424:	14302673          	csrr	a2,stval
    80005428:	00003517          	auipc	a0,0x3
    8000542c:	16850513          	addi	a0,a0,360 # 80008590 <CONSOLE_STATUS+0x580>
    80005430:	00001097          	auipc	ra,0x1
    80005434:	868080e7          	jalr	-1944(ra) # 80005c98 <__printf>
    80005438:	00003517          	auipc	a0,0x3
    8000543c:	17050513          	addi	a0,a0,368 # 800085a8 <CONSOLE_STATUS+0x598>
    80005440:	00000097          	auipc	ra,0x0
    80005444:	7fc080e7          	jalr	2044(ra) # 80005c3c <panic>
    80005448:	0ff7f713          	andi	a4,a5,255
    8000544c:	00900693          	li	a3,9
    80005450:	04d70063          	beq	a4,a3,80005490 <kerneltrap+0xac>
    80005454:	fff00713          	li	a4,-1
    80005458:	03f71713          	slli	a4,a4,0x3f
    8000545c:	00170713          	addi	a4,a4,1
    80005460:	fae798e3          	bne	a5,a4,80005410 <kerneltrap+0x2c>
    80005464:	00000097          	auipc	ra,0x0
    80005468:	e00080e7          	jalr	-512(ra) # 80005264 <cpuid>
    8000546c:	06050663          	beqz	a0,800054d8 <kerneltrap+0xf4>
    80005470:	144027f3          	csrr	a5,sip
    80005474:	ffd7f793          	andi	a5,a5,-3
    80005478:	14479073          	csrw	sip,a5
    8000547c:	01813083          	ld	ra,24(sp)
    80005480:	01013403          	ld	s0,16(sp)
    80005484:	00813483          	ld	s1,8(sp)
    80005488:	02010113          	addi	sp,sp,32
    8000548c:	00008067          	ret
    80005490:	00000097          	auipc	ra,0x0
    80005494:	3c4080e7          	jalr	964(ra) # 80005854 <plic_claim>
    80005498:	00a00793          	li	a5,10
    8000549c:	00050493          	mv	s1,a0
    800054a0:	06f50863          	beq	a0,a5,80005510 <kerneltrap+0x12c>
    800054a4:	fc050ce3          	beqz	a0,8000547c <kerneltrap+0x98>
    800054a8:	00050593          	mv	a1,a0
    800054ac:	00003517          	auipc	a0,0x3
    800054b0:	0b450513          	addi	a0,a0,180 # 80008560 <CONSOLE_STATUS+0x550>
    800054b4:	00000097          	auipc	ra,0x0
    800054b8:	7e4080e7          	jalr	2020(ra) # 80005c98 <__printf>
    800054bc:	01013403          	ld	s0,16(sp)
    800054c0:	01813083          	ld	ra,24(sp)
    800054c4:	00048513          	mv	a0,s1
    800054c8:	00813483          	ld	s1,8(sp)
    800054cc:	02010113          	addi	sp,sp,32
    800054d0:	00000317          	auipc	t1,0x0
    800054d4:	3bc30067          	jr	956(t1) # 8000588c <plic_complete>
    800054d8:	00005517          	auipc	a0,0x5
    800054dc:	f8850513          	addi	a0,a0,-120 # 8000a460 <tickslock>
    800054e0:	00001097          	auipc	ra,0x1
    800054e4:	48c080e7          	jalr	1164(ra) # 8000696c <acquire>
    800054e8:	00004717          	auipc	a4,0x4
    800054ec:	e5c70713          	addi	a4,a4,-420 # 80009344 <ticks>
    800054f0:	00072783          	lw	a5,0(a4)
    800054f4:	00005517          	auipc	a0,0x5
    800054f8:	f6c50513          	addi	a0,a0,-148 # 8000a460 <tickslock>
    800054fc:	0017879b          	addiw	a5,a5,1
    80005500:	00f72023          	sw	a5,0(a4)
    80005504:	00001097          	auipc	ra,0x1
    80005508:	534080e7          	jalr	1332(ra) # 80006a38 <release>
    8000550c:	f65ff06f          	j	80005470 <kerneltrap+0x8c>
    80005510:	00001097          	auipc	ra,0x1
    80005514:	090080e7          	jalr	144(ra) # 800065a0 <uartintr>
    80005518:	fa5ff06f          	j	800054bc <kerneltrap+0xd8>
    8000551c:	00003517          	auipc	a0,0x3
    80005520:	02450513          	addi	a0,a0,36 # 80008540 <CONSOLE_STATUS+0x530>
    80005524:	00000097          	auipc	ra,0x0
    80005528:	718080e7          	jalr	1816(ra) # 80005c3c <panic>

000000008000552c <clockintr>:
    8000552c:	fe010113          	addi	sp,sp,-32
    80005530:	00813823          	sd	s0,16(sp)
    80005534:	00913423          	sd	s1,8(sp)
    80005538:	00113c23          	sd	ra,24(sp)
    8000553c:	02010413          	addi	s0,sp,32
    80005540:	00005497          	auipc	s1,0x5
    80005544:	f2048493          	addi	s1,s1,-224 # 8000a460 <tickslock>
    80005548:	00048513          	mv	a0,s1
    8000554c:	00001097          	auipc	ra,0x1
    80005550:	420080e7          	jalr	1056(ra) # 8000696c <acquire>
    80005554:	00004717          	auipc	a4,0x4
    80005558:	df070713          	addi	a4,a4,-528 # 80009344 <ticks>
    8000555c:	00072783          	lw	a5,0(a4)
    80005560:	01013403          	ld	s0,16(sp)
    80005564:	01813083          	ld	ra,24(sp)
    80005568:	00048513          	mv	a0,s1
    8000556c:	0017879b          	addiw	a5,a5,1
    80005570:	00813483          	ld	s1,8(sp)
    80005574:	00f72023          	sw	a5,0(a4)
    80005578:	02010113          	addi	sp,sp,32
    8000557c:	00001317          	auipc	t1,0x1
    80005580:	4bc30067          	jr	1212(t1) # 80006a38 <release>

0000000080005584 <devintr>:
    80005584:	142027f3          	csrr	a5,scause
    80005588:	00000513          	li	a0,0
    8000558c:	0007c463          	bltz	a5,80005594 <devintr+0x10>
    80005590:	00008067          	ret
    80005594:	fe010113          	addi	sp,sp,-32
    80005598:	00813823          	sd	s0,16(sp)
    8000559c:	00113c23          	sd	ra,24(sp)
    800055a0:	00913423          	sd	s1,8(sp)
    800055a4:	02010413          	addi	s0,sp,32
    800055a8:	0ff7f713          	andi	a4,a5,255
    800055ac:	00900693          	li	a3,9
    800055b0:	04d70c63          	beq	a4,a3,80005608 <devintr+0x84>
    800055b4:	fff00713          	li	a4,-1
    800055b8:	03f71713          	slli	a4,a4,0x3f
    800055bc:	00170713          	addi	a4,a4,1
    800055c0:	00e78c63          	beq	a5,a4,800055d8 <devintr+0x54>
    800055c4:	01813083          	ld	ra,24(sp)
    800055c8:	01013403          	ld	s0,16(sp)
    800055cc:	00813483          	ld	s1,8(sp)
    800055d0:	02010113          	addi	sp,sp,32
    800055d4:	00008067          	ret
    800055d8:	00000097          	auipc	ra,0x0
    800055dc:	c8c080e7          	jalr	-884(ra) # 80005264 <cpuid>
    800055e0:	06050663          	beqz	a0,8000564c <devintr+0xc8>
    800055e4:	144027f3          	csrr	a5,sip
    800055e8:	ffd7f793          	andi	a5,a5,-3
    800055ec:	14479073          	csrw	sip,a5
    800055f0:	01813083          	ld	ra,24(sp)
    800055f4:	01013403          	ld	s0,16(sp)
    800055f8:	00813483          	ld	s1,8(sp)
    800055fc:	00200513          	li	a0,2
    80005600:	02010113          	addi	sp,sp,32
    80005604:	00008067          	ret
    80005608:	00000097          	auipc	ra,0x0
    8000560c:	24c080e7          	jalr	588(ra) # 80005854 <plic_claim>
    80005610:	00a00793          	li	a5,10
    80005614:	00050493          	mv	s1,a0
    80005618:	06f50663          	beq	a0,a5,80005684 <devintr+0x100>
    8000561c:	00100513          	li	a0,1
    80005620:	fa0482e3          	beqz	s1,800055c4 <devintr+0x40>
    80005624:	00048593          	mv	a1,s1
    80005628:	00003517          	auipc	a0,0x3
    8000562c:	f3850513          	addi	a0,a0,-200 # 80008560 <CONSOLE_STATUS+0x550>
    80005630:	00000097          	auipc	ra,0x0
    80005634:	668080e7          	jalr	1640(ra) # 80005c98 <__printf>
    80005638:	00048513          	mv	a0,s1
    8000563c:	00000097          	auipc	ra,0x0
    80005640:	250080e7          	jalr	592(ra) # 8000588c <plic_complete>
    80005644:	00100513          	li	a0,1
    80005648:	f7dff06f          	j	800055c4 <devintr+0x40>
    8000564c:	00005517          	auipc	a0,0x5
    80005650:	e1450513          	addi	a0,a0,-492 # 8000a460 <tickslock>
    80005654:	00001097          	auipc	ra,0x1
    80005658:	318080e7          	jalr	792(ra) # 8000696c <acquire>
    8000565c:	00004717          	auipc	a4,0x4
    80005660:	ce870713          	addi	a4,a4,-792 # 80009344 <ticks>
    80005664:	00072783          	lw	a5,0(a4)
    80005668:	00005517          	auipc	a0,0x5
    8000566c:	df850513          	addi	a0,a0,-520 # 8000a460 <tickslock>
    80005670:	0017879b          	addiw	a5,a5,1
    80005674:	00f72023          	sw	a5,0(a4)
    80005678:	00001097          	auipc	ra,0x1
    8000567c:	3c0080e7          	jalr	960(ra) # 80006a38 <release>
    80005680:	f65ff06f          	j	800055e4 <devintr+0x60>
    80005684:	00001097          	auipc	ra,0x1
    80005688:	f1c080e7          	jalr	-228(ra) # 800065a0 <uartintr>
    8000568c:	fadff06f          	j	80005638 <devintr+0xb4>

0000000080005690 <kernelvec>:
    80005690:	f0010113          	addi	sp,sp,-256
    80005694:	00113023          	sd	ra,0(sp)
    80005698:	00213423          	sd	sp,8(sp)
    8000569c:	00313823          	sd	gp,16(sp)
    800056a0:	00413c23          	sd	tp,24(sp)
    800056a4:	02513023          	sd	t0,32(sp)
    800056a8:	02613423          	sd	t1,40(sp)
    800056ac:	02713823          	sd	t2,48(sp)
    800056b0:	02813c23          	sd	s0,56(sp)
    800056b4:	04913023          	sd	s1,64(sp)
    800056b8:	04a13423          	sd	a0,72(sp)
    800056bc:	04b13823          	sd	a1,80(sp)
    800056c0:	04c13c23          	sd	a2,88(sp)
    800056c4:	06d13023          	sd	a3,96(sp)
    800056c8:	06e13423          	sd	a4,104(sp)
    800056cc:	06f13823          	sd	a5,112(sp)
    800056d0:	07013c23          	sd	a6,120(sp)
    800056d4:	09113023          	sd	a7,128(sp)
    800056d8:	09213423          	sd	s2,136(sp)
    800056dc:	09313823          	sd	s3,144(sp)
    800056e0:	09413c23          	sd	s4,152(sp)
    800056e4:	0b513023          	sd	s5,160(sp)
    800056e8:	0b613423          	sd	s6,168(sp)
    800056ec:	0b713823          	sd	s7,176(sp)
    800056f0:	0b813c23          	sd	s8,184(sp)
    800056f4:	0d913023          	sd	s9,192(sp)
    800056f8:	0da13423          	sd	s10,200(sp)
    800056fc:	0db13823          	sd	s11,208(sp)
    80005700:	0dc13c23          	sd	t3,216(sp)
    80005704:	0fd13023          	sd	t4,224(sp)
    80005708:	0fe13423          	sd	t5,232(sp)
    8000570c:	0ff13823          	sd	t6,240(sp)
    80005710:	cd5ff0ef          	jal	ra,800053e4 <kerneltrap>
    80005714:	00013083          	ld	ra,0(sp)
    80005718:	00813103          	ld	sp,8(sp)
    8000571c:	01013183          	ld	gp,16(sp)
    80005720:	02013283          	ld	t0,32(sp)
    80005724:	02813303          	ld	t1,40(sp)
    80005728:	03013383          	ld	t2,48(sp)
    8000572c:	03813403          	ld	s0,56(sp)
    80005730:	04013483          	ld	s1,64(sp)
    80005734:	04813503          	ld	a0,72(sp)
    80005738:	05013583          	ld	a1,80(sp)
    8000573c:	05813603          	ld	a2,88(sp)
    80005740:	06013683          	ld	a3,96(sp)
    80005744:	06813703          	ld	a4,104(sp)
    80005748:	07013783          	ld	a5,112(sp)
    8000574c:	07813803          	ld	a6,120(sp)
    80005750:	08013883          	ld	a7,128(sp)
    80005754:	08813903          	ld	s2,136(sp)
    80005758:	09013983          	ld	s3,144(sp)
    8000575c:	09813a03          	ld	s4,152(sp)
    80005760:	0a013a83          	ld	s5,160(sp)
    80005764:	0a813b03          	ld	s6,168(sp)
    80005768:	0b013b83          	ld	s7,176(sp)
    8000576c:	0b813c03          	ld	s8,184(sp)
    80005770:	0c013c83          	ld	s9,192(sp)
    80005774:	0c813d03          	ld	s10,200(sp)
    80005778:	0d013d83          	ld	s11,208(sp)
    8000577c:	0d813e03          	ld	t3,216(sp)
    80005780:	0e013e83          	ld	t4,224(sp)
    80005784:	0e813f03          	ld	t5,232(sp)
    80005788:	0f013f83          	ld	t6,240(sp)
    8000578c:	10010113          	addi	sp,sp,256
    80005790:	10200073          	sret
    80005794:	00000013          	nop
    80005798:	00000013          	nop
    8000579c:	00000013          	nop

00000000800057a0 <timervec>:
    800057a0:	34051573          	csrrw	a0,mscratch,a0
    800057a4:	00b53023          	sd	a1,0(a0)
    800057a8:	00c53423          	sd	a2,8(a0)
    800057ac:	00d53823          	sd	a3,16(a0)
    800057b0:	01853583          	ld	a1,24(a0)
    800057b4:	02053603          	ld	a2,32(a0)
    800057b8:	0005b683          	ld	a3,0(a1)
    800057bc:	00c686b3          	add	a3,a3,a2
    800057c0:	00d5b023          	sd	a3,0(a1)
    800057c4:	00200593          	li	a1,2
    800057c8:	14459073          	csrw	sip,a1
    800057cc:	01053683          	ld	a3,16(a0)
    800057d0:	00853603          	ld	a2,8(a0)
    800057d4:	00053583          	ld	a1,0(a0)
    800057d8:	34051573          	csrrw	a0,mscratch,a0
    800057dc:	30200073          	mret

00000000800057e0 <plicinit>:
    800057e0:	ff010113          	addi	sp,sp,-16
    800057e4:	00813423          	sd	s0,8(sp)
    800057e8:	01010413          	addi	s0,sp,16
    800057ec:	00813403          	ld	s0,8(sp)
    800057f0:	0c0007b7          	lui	a5,0xc000
    800057f4:	00100713          	li	a4,1
    800057f8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800057fc:	00e7a223          	sw	a4,4(a5)
    80005800:	01010113          	addi	sp,sp,16
    80005804:	00008067          	ret

0000000080005808 <plicinithart>:
    80005808:	ff010113          	addi	sp,sp,-16
    8000580c:	00813023          	sd	s0,0(sp)
    80005810:	00113423          	sd	ra,8(sp)
    80005814:	01010413          	addi	s0,sp,16
    80005818:	00000097          	auipc	ra,0x0
    8000581c:	a4c080e7          	jalr	-1460(ra) # 80005264 <cpuid>
    80005820:	0085171b          	slliw	a4,a0,0x8
    80005824:	0c0027b7          	lui	a5,0xc002
    80005828:	00e787b3          	add	a5,a5,a4
    8000582c:	40200713          	li	a4,1026
    80005830:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005834:	00813083          	ld	ra,8(sp)
    80005838:	00013403          	ld	s0,0(sp)
    8000583c:	00d5151b          	slliw	a0,a0,0xd
    80005840:	0c2017b7          	lui	a5,0xc201
    80005844:	00a78533          	add	a0,a5,a0
    80005848:	00052023          	sw	zero,0(a0)
    8000584c:	01010113          	addi	sp,sp,16
    80005850:	00008067          	ret

0000000080005854 <plic_claim>:
    80005854:	ff010113          	addi	sp,sp,-16
    80005858:	00813023          	sd	s0,0(sp)
    8000585c:	00113423          	sd	ra,8(sp)
    80005860:	01010413          	addi	s0,sp,16
    80005864:	00000097          	auipc	ra,0x0
    80005868:	a00080e7          	jalr	-1536(ra) # 80005264 <cpuid>
    8000586c:	00813083          	ld	ra,8(sp)
    80005870:	00013403          	ld	s0,0(sp)
    80005874:	00d5151b          	slliw	a0,a0,0xd
    80005878:	0c2017b7          	lui	a5,0xc201
    8000587c:	00a78533          	add	a0,a5,a0
    80005880:	00452503          	lw	a0,4(a0)
    80005884:	01010113          	addi	sp,sp,16
    80005888:	00008067          	ret

000000008000588c <plic_complete>:
    8000588c:	fe010113          	addi	sp,sp,-32
    80005890:	00813823          	sd	s0,16(sp)
    80005894:	00913423          	sd	s1,8(sp)
    80005898:	00113c23          	sd	ra,24(sp)
    8000589c:	02010413          	addi	s0,sp,32
    800058a0:	00050493          	mv	s1,a0
    800058a4:	00000097          	auipc	ra,0x0
    800058a8:	9c0080e7          	jalr	-1600(ra) # 80005264 <cpuid>
    800058ac:	01813083          	ld	ra,24(sp)
    800058b0:	01013403          	ld	s0,16(sp)
    800058b4:	00d5179b          	slliw	a5,a0,0xd
    800058b8:	0c201737          	lui	a4,0xc201
    800058bc:	00f707b3          	add	a5,a4,a5
    800058c0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800058c4:	00813483          	ld	s1,8(sp)
    800058c8:	02010113          	addi	sp,sp,32
    800058cc:	00008067          	ret

00000000800058d0 <consolewrite>:
    800058d0:	fb010113          	addi	sp,sp,-80
    800058d4:	04813023          	sd	s0,64(sp)
    800058d8:	04113423          	sd	ra,72(sp)
    800058dc:	02913c23          	sd	s1,56(sp)
    800058e0:	03213823          	sd	s2,48(sp)
    800058e4:	03313423          	sd	s3,40(sp)
    800058e8:	03413023          	sd	s4,32(sp)
    800058ec:	01513c23          	sd	s5,24(sp)
    800058f0:	05010413          	addi	s0,sp,80
    800058f4:	06c05c63          	blez	a2,8000596c <consolewrite+0x9c>
    800058f8:	00060993          	mv	s3,a2
    800058fc:	00050a13          	mv	s4,a0
    80005900:	00058493          	mv	s1,a1
    80005904:	00000913          	li	s2,0
    80005908:	fff00a93          	li	s5,-1
    8000590c:	01c0006f          	j	80005928 <consolewrite+0x58>
    80005910:	fbf44503          	lbu	a0,-65(s0)
    80005914:	0019091b          	addiw	s2,s2,1
    80005918:	00148493          	addi	s1,s1,1
    8000591c:	00001097          	auipc	ra,0x1
    80005920:	a9c080e7          	jalr	-1380(ra) # 800063b8 <uartputc>
    80005924:	03298063          	beq	s3,s2,80005944 <consolewrite+0x74>
    80005928:	00048613          	mv	a2,s1
    8000592c:	00100693          	li	a3,1
    80005930:	000a0593          	mv	a1,s4
    80005934:	fbf40513          	addi	a0,s0,-65
    80005938:	00000097          	auipc	ra,0x0
    8000593c:	9e4080e7          	jalr	-1564(ra) # 8000531c <either_copyin>
    80005940:	fd5518e3          	bne	a0,s5,80005910 <consolewrite+0x40>
    80005944:	04813083          	ld	ra,72(sp)
    80005948:	04013403          	ld	s0,64(sp)
    8000594c:	03813483          	ld	s1,56(sp)
    80005950:	02813983          	ld	s3,40(sp)
    80005954:	02013a03          	ld	s4,32(sp)
    80005958:	01813a83          	ld	s5,24(sp)
    8000595c:	00090513          	mv	a0,s2
    80005960:	03013903          	ld	s2,48(sp)
    80005964:	05010113          	addi	sp,sp,80
    80005968:	00008067          	ret
    8000596c:	00000913          	li	s2,0
    80005970:	fd5ff06f          	j	80005944 <consolewrite+0x74>

0000000080005974 <consoleread>:
    80005974:	f9010113          	addi	sp,sp,-112
    80005978:	06813023          	sd	s0,96(sp)
    8000597c:	04913c23          	sd	s1,88(sp)
    80005980:	05213823          	sd	s2,80(sp)
    80005984:	05313423          	sd	s3,72(sp)
    80005988:	05413023          	sd	s4,64(sp)
    8000598c:	03513c23          	sd	s5,56(sp)
    80005990:	03613823          	sd	s6,48(sp)
    80005994:	03713423          	sd	s7,40(sp)
    80005998:	03813023          	sd	s8,32(sp)
    8000599c:	06113423          	sd	ra,104(sp)
    800059a0:	01913c23          	sd	s9,24(sp)
    800059a4:	07010413          	addi	s0,sp,112
    800059a8:	00060b93          	mv	s7,a2
    800059ac:	00050913          	mv	s2,a0
    800059b0:	00058c13          	mv	s8,a1
    800059b4:	00060b1b          	sext.w	s6,a2
    800059b8:	00005497          	auipc	s1,0x5
    800059bc:	ad048493          	addi	s1,s1,-1328 # 8000a488 <cons>
    800059c0:	00400993          	li	s3,4
    800059c4:	fff00a13          	li	s4,-1
    800059c8:	00a00a93          	li	s5,10
    800059cc:	05705e63          	blez	s7,80005a28 <consoleread+0xb4>
    800059d0:	09c4a703          	lw	a4,156(s1)
    800059d4:	0984a783          	lw	a5,152(s1)
    800059d8:	0007071b          	sext.w	a4,a4
    800059dc:	08e78463          	beq	a5,a4,80005a64 <consoleread+0xf0>
    800059e0:	07f7f713          	andi	a4,a5,127
    800059e4:	00e48733          	add	a4,s1,a4
    800059e8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800059ec:	0017869b          	addiw	a3,a5,1
    800059f0:	08d4ac23          	sw	a3,152(s1)
    800059f4:	00070c9b          	sext.w	s9,a4
    800059f8:	0b370663          	beq	a4,s3,80005aa4 <consoleread+0x130>
    800059fc:	00100693          	li	a3,1
    80005a00:	f9f40613          	addi	a2,s0,-97
    80005a04:	000c0593          	mv	a1,s8
    80005a08:	00090513          	mv	a0,s2
    80005a0c:	f8e40fa3          	sb	a4,-97(s0)
    80005a10:	00000097          	auipc	ra,0x0
    80005a14:	8c0080e7          	jalr	-1856(ra) # 800052d0 <either_copyout>
    80005a18:	01450863          	beq	a0,s4,80005a28 <consoleread+0xb4>
    80005a1c:	001c0c13          	addi	s8,s8,1
    80005a20:	fffb8b9b          	addiw	s7,s7,-1
    80005a24:	fb5c94e3          	bne	s9,s5,800059cc <consoleread+0x58>
    80005a28:	000b851b          	sext.w	a0,s7
    80005a2c:	06813083          	ld	ra,104(sp)
    80005a30:	06013403          	ld	s0,96(sp)
    80005a34:	05813483          	ld	s1,88(sp)
    80005a38:	05013903          	ld	s2,80(sp)
    80005a3c:	04813983          	ld	s3,72(sp)
    80005a40:	04013a03          	ld	s4,64(sp)
    80005a44:	03813a83          	ld	s5,56(sp)
    80005a48:	02813b83          	ld	s7,40(sp)
    80005a4c:	02013c03          	ld	s8,32(sp)
    80005a50:	01813c83          	ld	s9,24(sp)
    80005a54:	40ab053b          	subw	a0,s6,a0
    80005a58:	03013b03          	ld	s6,48(sp)
    80005a5c:	07010113          	addi	sp,sp,112
    80005a60:	00008067          	ret
    80005a64:	00001097          	auipc	ra,0x1
    80005a68:	1d8080e7          	jalr	472(ra) # 80006c3c <push_on>
    80005a6c:	0984a703          	lw	a4,152(s1)
    80005a70:	09c4a783          	lw	a5,156(s1)
    80005a74:	0007879b          	sext.w	a5,a5
    80005a78:	fef70ce3          	beq	a4,a5,80005a70 <consoleread+0xfc>
    80005a7c:	00001097          	auipc	ra,0x1
    80005a80:	234080e7          	jalr	564(ra) # 80006cb0 <pop_on>
    80005a84:	0984a783          	lw	a5,152(s1)
    80005a88:	07f7f713          	andi	a4,a5,127
    80005a8c:	00e48733          	add	a4,s1,a4
    80005a90:	01874703          	lbu	a4,24(a4)
    80005a94:	0017869b          	addiw	a3,a5,1
    80005a98:	08d4ac23          	sw	a3,152(s1)
    80005a9c:	00070c9b          	sext.w	s9,a4
    80005aa0:	f5371ee3          	bne	a4,s3,800059fc <consoleread+0x88>
    80005aa4:	000b851b          	sext.w	a0,s7
    80005aa8:	f96bf2e3          	bgeu	s7,s6,80005a2c <consoleread+0xb8>
    80005aac:	08f4ac23          	sw	a5,152(s1)
    80005ab0:	f7dff06f          	j	80005a2c <consoleread+0xb8>

0000000080005ab4 <consputc>:
    80005ab4:	10000793          	li	a5,256
    80005ab8:	00f50663          	beq	a0,a5,80005ac4 <consputc+0x10>
    80005abc:	00001317          	auipc	t1,0x1
    80005ac0:	9f430067          	jr	-1548(t1) # 800064b0 <uartputc_sync>
    80005ac4:	ff010113          	addi	sp,sp,-16
    80005ac8:	00113423          	sd	ra,8(sp)
    80005acc:	00813023          	sd	s0,0(sp)
    80005ad0:	01010413          	addi	s0,sp,16
    80005ad4:	00800513          	li	a0,8
    80005ad8:	00001097          	auipc	ra,0x1
    80005adc:	9d8080e7          	jalr	-1576(ra) # 800064b0 <uartputc_sync>
    80005ae0:	02000513          	li	a0,32
    80005ae4:	00001097          	auipc	ra,0x1
    80005ae8:	9cc080e7          	jalr	-1588(ra) # 800064b0 <uartputc_sync>
    80005aec:	00013403          	ld	s0,0(sp)
    80005af0:	00813083          	ld	ra,8(sp)
    80005af4:	00800513          	li	a0,8
    80005af8:	01010113          	addi	sp,sp,16
    80005afc:	00001317          	auipc	t1,0x1
    80005b00:	9b430067          	jr	-1612(t1) # 800064b0 <uartputc_sync>

0000000080005b04 <consoleintr>:
    80005b04:	fe010113          	addi	sp,sp,-32
    80005b08:	00813823          	sd	s0,16(sp)
    80005b0c:	00913423          	sd	s1,8(sp)
    80005b10:	01213023          	sd	s2,0(sp)
    80005b14:	00113c23          	sd	ra,24(sp)
    80005b18:	02010413          	addi	s0,sp,32
    80005b1c:	00005917          	auipc	s2,0x5
    80005b20:	96c90913          	addi	s2,s2,-1684 # 8000a488 <cons>
    80005b24:	00050493          	mv	s1,a0
    80005b28:	00090513          	mv	a0,s2
    80005b2c:	00001097          	auipc	ra,0x1
    80005b30:	e40080e7          	jalr	-448(ra) # 8000696c <acquire>
    80005b34:	02048c63          	beqz	s1,80005b6c <consoleintr+0x68>
    80005b38:	0a092783          	lw	a5,160(s2)
    80005b3c:	09892703          	lw	a4,152(s2)
    80005b40:	07f00693          	li	a3,127
    80005b44:	40e7873b          	subw	a4,a5,a4
    80005b48:	02e6e263          	bltu	a3,a4,80005b6c <consoleintr+0x68>
    80005b4c:	00d00713          	li	a4,13
    80005b50:	04e48063          	beq	s1,a4,80005b90 <consoleintr+0x8c>
    80005b54:	07f7f713          	andi	a4,a5,127
    80005b58:	00e90733          	add	a4,s2,a4
    80005b5c:	0017879b          	addiw	a5,a5,1
    80005b60:	0af92023          	sw	a5,160(s2)
    80005b64:	00970c23          	sb	s1,24(a4)
    80005b68:	08f92e23          	sw	a5,156(s2)
    80005b6c:	01013403          	ld	s0,16(sp)
    80005b70:	01813083          	ld	ra,24(sp)
    80005b74:	00813483          	ld	s1,8(sp)
    80005b78:	00013903          	ld	s2,0(sp)
    80005b7c:	00005517          	auipc	a0,0x5
    80005b80:	90c50513          	addi	a0,a0,-1780 # 8000a488 <cons>
    80005b84:	02010113          	addi	sp,sp,32
    80005b88:	00001317          	auipc	t1,0x1
    80005b8c:	eb030067          	jr	-336(t1) # 80006a38 <release>
    80005b90:	00a00493          	li	s1,10
    80005b94:	fc1ff06f          	j	80005b54 <consoleintr+0x50>

0000000080005b98 <consoleinit>:
    80005b98:	fe010113          	addi	sp,sp,-32
    80005b9c:	00113c23          	sd	ra,24(sp)
    80005ba0:	00813823          	sd	s0,16(sp)
    80005ba4:	00913423          	sd	s1,8(sp)
    80005ba8:	02010413          	addi	s0,sp,32
    80005bac:	00005497          	auipc	s1,0x5
    80005bb0:	8dc48493          	addi	s1,s1,-1828 # 8000a488 <cons>
    80005bb4:	00048513          	mv	a0,s1
    80005bb8:	00003597          	auipc	a1,0x3
    80005bbc:	a0058593          	addi	a1,a1,-1536 # 800085b8 <CONSOLE_STATUS+0x5a8>
    80005bc0:	00001097          	auipc	ra,0x1
    80005bc4:	d88080e7          	jalr	-632(ra) # 80006948 <initlock>
    80005bc8:	00000097          	auipc	ra,0x0
    80005bcc:	7ac080e7          	jalr	1964(ra) # 80006374 <uartinit>
    80005bd0:	01813083          	ld	ra,24(sp)
    80005bd4:	01013403          	ld	s0,16(sp)
    80005bd8:	00000797          	auipc	a5,0x0
    80005bdc:	d9c78793          	addi	a5,a5,-612 # 80005974 <consoleread>
    80005be0:	0af4bc23          	sd	a5,184(s1)
    80005be4:	00000797          	auipc	a5,0x0
    80005be8:	cec78793          	addi	a5,a5,-788 # 800058d0 <consolewrite>
    80005bec:	0cf4b023          	sd	a5,192(s1)
    80005bf0:	00813483          	ld	s1,8(sp)
    80005bf4:	02010113          	addi	sp,sp,32
    80005bf8:	00008067          	ret

0000000080005bfc <console_read>:
    80005bfc:	ff010113          	addi	sp,sp,-16
    80005c00:	00813423          	sd	s0,8(sp)
    80005c04:	01010413          	addi	s0,sp,16
    80005c08:	00813403          	ld	s0,8(sp)
    80005c0c:	00005317          	auipc	t1,0x5
    80005c10:	93433303          	ld	t1,-1740(t1) # 8000a540 <devsw+0x10>
    80005c14:	01010113          	addi	sp,sp,16
    80005c18:	00030067          	jr	t1

0000000080005c1c <console_write>:
    80005c1c:	ff010113          	addi	sp,sp,-16
    80005c20:	00813423          	sd	s0,8(sp)
    80005c24:	01010413          	addi	s0,sp,16
    80005c28:	00813403          	ld	s0,8(sp)
    80005c2c:	00005317          	auipc	t1,0x5
    80005c30:	91c33303          	ld	t1,-1764(t1) # 8000a548 <devsw+0x18>
    80005c34:	01010113          	addi	sp,sp,16
    80005c38:	00030067          	jr	t1

0000000080005c3c <panic>:
    80005c3c:	fe010113          	addi	sp,sp,-32
    80005c40:	00113c23          	sd	ra,24(sp)
    80005c44:	00813823          	sd	s0,16(sp)
    80005c48:	00913423          	sd	s1,8(sp)
    80005c4c:	02010413          	addi	s0,sp,32
    80005c50:	00050493          	mv	s1,a0
    80005c54:	00003517          	auipc	a0,0x3
    80005c58:	96c50513          	addi	a0,a0,-1684 # 800085c0 <CONSOLE_STATUS+0x5b0>
    80005c5c:	00005797          	auipc	a5,0x5
    80005c60:	9807a623          	sw	zero,-1652(a5) # 8000a5e8 <pr+0x18>
    80005c64:	00000097          	auipc	ra,0x0
    80005c68:	034080e7          	jalr	52(ra) # 80005c98 <__printf>
    80005c6c:	00048513          	mv	a0,s1
    80005c70:	00000097          	auipc	ra,0x0
    80005c74:	028080e7          	jalr	40(ra) # 80005c98 <__printf>
    80005c78:	00003517          	auipc	a0,0x3
    80005c7c:	92850513          	addi	a0,a0,-1752 # 800085a0 <CONSOLE_STATUS+0x590>
    80005c80:	00000097          	auipc	ra,0x0
    80005c84:	018080e7          	jalr	24(ra) # 80005c98 <__printf>
    80005c88:	00100793          	li	a5,1
    80005c8c:	00003717          	auipc	a4,0x3
    80005c90:	6af72e23          	sw	a5,1724(a4) # 80009348 <panicked>
    80005c94:	0000006f          	j	80005c94 <panic+0x58>

0000000080005c98 <__printf>:
    80005c98:	f3010113          	addi	sp,sp,-208
    80005c9c:	08813023          	sd	s0,128(sp)
    80005ca0:	07313423          	sd	s3,104(sp)
    80005ca4:	09010413          	addi	s0,sp,144
    80005ca8:	05813023          	sd	s8,64(sp)
    80005cac:	08113423          	sd	ra,136(sp)
    80005cb0:	06913c23          	sd	s1,120(sp)
    80005cb4:	07213823          	sd	s2,112(sp)
    80005cb8:	07413023          	sd	s4,96(sp)
    80005cbc:	05513c23          	sd	s5,88(sp)
    80005cc0:	05613823          	sd	s6,80(sp)
    80005cc4:	05713423          	sd	s7,72(sp)
    80005cc8:	03913c23          	sd	s9,56(sp)
    80005ccc:	03a13823          	sd	s10,48(sp)
    80005cd0:	03b13423          	sd	s11,40(sp)
    80005cd4:	00005317          	auipc	t1,0x5
    80005cd8:	8fc30313          	addi	t1,t1,-1796 # 8000a5d0 <pr>
    80005cdc:	01832c03          	lw	s8,24(t1)
    80005ce0:	00b43423          	sd	a1,8(s0)
    80005ce4:	00c43823          	sd	a2,16(s0)
    80005ce8:	00d43c23          	sd	a3,24(s0)
    80005cec:	02e43023          	sd	a4,32(s0)
    80005cf0:	02f43423          	sd	a5,40(s0)
    80005cf4:	03043823          	sd	a6,48(s0)
    80005cf8:	03143c23          	sd	a7,56(s0)
    80005cfc:	00050993          	mv	s3,a0
    80005d00:	4a0c1663          	bnez	s8,800061ac <__printf+0x514>
    80005d04:	60098c63          	beqz	s3,8000631c <__printf+0x684>
    80005d08:	0009c503          	lbu	a0,0(s3)
    80005d0c:	00840793          	addi	a5,s0,8
    80005d10:	f6f43c23          	sd	a5,-136(s0)
    80005d14:	00000493          	li	s1,0
    80005d18:	22050063          	beqz	a0,80005f38 <__printf+0x2a0>
    80005d1c:	00002a37          	lui	s4,0x2
    80005d20:	00018ab7          	lui	s5,0x18
    80005d24:	000f4b37          	lui	s6,0xf4
    80005d28:	00989bb7          	lui	s7,0x989
    80005d2c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005d30:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005d34:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005d38:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005d3c:	00148c9b          	addiw	s9,s1,1
    80005d40:	02500793          	li	a5,37
    80005d44:	01998933          	add	s2,s3,s9
    80005d48:	38f51263          	bne	a0,a5,800060cc <__printf+0x434>
    80005d4c:	00094783          	lbu	a5,0(s2)
    80005d50:	00078c9b          	sext.w	s9,a5
    80005d54:	1e078263          	beqz	a5,80005f38 <__printf+0x2a0>
    80005d58:	0024849b          	addiw	s1,s1,2
    80005d5c:	07000713          	li	a4,112
    80005d60:	00998933          	add	s2,s3,s1
    80005d64:	38e78a63          	beq	a5,a4,800060f8 <__printf+0x460>
    80005d68:	20f76863          	bltu	a4,a5,80005f78 <__printf+0x2e0>
    80005d6c:	42a78863          	beq	a5,a0,8000619c <__printf+0x504>
    80005d70:	06400713          	li	a4,100
    80005d74:	40e79663          	bne	a5,a4,80006180 <__printf+0x4e8>
    80005d78:	f7843783          	ld	a5,-136(s0)
    80005d7c:	0007a603          	lw	a2,0(a5)
    80005d80:	00878793          	addi	a5,a5,8
    80005d84:	f6f43c23          	sd	a5,-136(s0)
    80005d88:	42064a63          	bltz	a2,800061bc <__printf+0x524>
    80005d8c:	00a00713          	li	a4,10
    80005d90:	02e677bb          	remuw	a5,a2,a4
    80005d94:	00003d97          	auipc	s11,0x3
    80005d98:	854d8d93          	addi	s11,s11,-1964 # 800085e8 <digits>
    80005d9c:	00900593          	li	a1,9
    80005da0:	0006051b          	sext.w	a0,a2
    80005da4:	00000c93          	li	s9,0
    80005da8:	02079793          	slli	a5,a5,0x20
    80005dac:	0207d793          	srli	a5,a5,0x20
    80005db0:	00fd87b3          	add	a5,s11,a5
    80005db4:	0007c783          	lbu	a5,0(a5)
    80005db8:	02e656bb          	divuw	a3,a2,a4
    80005dbc:	f8f40023          	sb	a5,-128(s0)
    80005dc0:	14c5d863          	bge	a1,a2,80005f10 <__printf+0x278>
    80005dc4:	06300593          	li	a1,99
    80005dc8:	00100c93          	li	s9,1
    80005dcc:	02e6f7bb          	remuw	a5,a3,a4
    80005dd0:	02079793          	slli	a5,a5,0x20
    80005dd4:	0207d793          	srli	a5,a5,0x20
    80005dd8:	00fd87b3          	add	a5,s11,a5
    80005ddc:	0007c783          	lbu	a5,0(a5)
    80005de0:	02e6d73b          	divuw	a4,a3,a4
    80005de4:	f8f400a3          	sb	a5,-127(s0)
    80005de8:	12a5f463          	bgeu	a1,a0,80005f10 <__printf+0x278>
    80005dec:	00a00693          	li	a3,10
    80005df0:	00900593          	li	a1,9
    80005df4:	02d777bb          	remuw	a5,a4,a3
    80005df8:	02079793          	slli	a5,a5,0x20
    80005dfc:	0207d793          	srli	a5,a5,0x20
    80005e00:	00fd87b3          	add	a5,s11,a5
    80005e04:	0007c503          	lbu	a0,0(a5)
    80005e08:	02d757bb          	divuw	a5,a4,a3
    80005e0c:	f8a40123          	sb	a0,-126(s0)
    80005e10:	48e5f263          	bgeu	a1,a4,80006294 <__printf+0x5fc>
    80005e14:	06300513          	li	a0,99
    80005e18:	02d7f5bb          	remuw	a1,a5,a3
    80005e1c:	02059593          	slli	a1,a1,0x20
    80005e20:	0205d593          	srli	a1,a1,0x20
    80005e24:	00bd85b3          	add	a1,s11,a1
    80005e28:	0005c583          	lbu	a1,0(a1)
    80005e2c:	02d7d7bb          	divuw	a5,a5,a3
    80005e30:	f8b401a3          	sb	a1,-125(s0)
    80005e34:	48e57263          	bgeu	a0,a4,800062b8 <__printf+0x620>
    80005e38:	3e700513          	li	a0,999
    80005e3c:	02d7f5bb          	remuw	a1,a5,a3
    80005e40:	02059593          	slli	a1,a1,0x20
    80005e44:	0205d593          	srli	a1,a1,0x20
    80005e48:	00bd85b3          	add	a1,s11,a1
    80005e4c:	0005c583          	lbu	a1,0(a1)
    80005e50:	02d7d7bb          	divuw	a5,a5,a3
    80005e54:	f8b40223          	sb	a1,-124(s0)
    80005e58:	46e57663          	bgeu	a0,a4,800062c4 <__printf+0x62c>
    80005e5c:	02d7f5bb          	remuw	a1,a5,a3
    80005e60:	02059593          	slli	a1,a1,0x20
    80005e64:	0205d593          	srli	a1,a1,0x20
    80005e68:	00bd85b3          	add	a1,s11,a1
    80005e6c:	0005c583          	lbu	a1,0(a1)
    80005e70:	02d7d7bb          	divuw	a5,a5,a3
    80005e74:	f8b402a3          	sb	a1,-123(s0)
    80005e78:	46ea7863          	bgeu	s4,a4,800062e8 <__printf+0x650>
    80005e7c:	02d7f5bb          	remuw	a1,a5,a3
    80005e80:	02059593          	slli	a1,a1,0x20
    80005e84:	0205d593          	srli	a1,a1,0x20
    80005e88:	00bd85b3          	add	a1,s11,a1
    80005e8c:	0005c583          	lbu	a1,0(a1)
    80005e90:	02d7d7bb          	divuw	a5,a5,a3
    80005e94:	f8b40323          	sb	a1,-122(s0)
    80005e98:	3eeaf863          	bgeu	s5,a4,80006288 <__printf+0x5f0>
    80005e9c:	02d7f5bb          	remuw	a1,a5,a3
    80005ea0:	02059593          	slli	a1,a1,0x20
    80005ea4:	0205d593          	srli	a1,a1,0x20
    80005ea8:	00bd85b3          	add	a1,s11,a1
    80005eac:	0005c583          	lbu	a1,0(a1)
    80005eb0:	02d7d7bb          	divuw	a5,a5,a3
    80005eb4:	f8b403a3          	sb	a1,-121(s0)
    80005eb8:	42eb7e63          	bgeu	s6,a4,800062f4 <__printf+0x65c>
    80005ebc:	02d7f5bb          	remuw	a1,a5,a3
    80005ec0:	02059593          	slli	a1,a1,0x20
    80005ec4:	0205d593          	srli	a1,a1,0x20
    80005ec8:	00bd85b3          	add	a1,s11,a1
    80005ecc:	0005c583          	lbu	a1,0(a1)
    80005ed0:	02d7d7bb          	divuw	a5,a5,a3
    80005ed4:	f8b40423          	sb	a1,-120(s0)
    80005ed8:	42ebfc63          	bgeu	s7,a4,80006310 <__printf+0x678>
    80005edc:	02079793          	slli	a5,a5,0x20
    80005ee0:	0207d793          	srli	a5,a5,0x20
    80005ee4:	00fd8db3          	add	s11,s11,a5
    80005ee8:	000dc703          	lbu	a4,0(s11)
    80005eec:	00a00793          	li	a5,10
    80005ef0:	00900c93          	li	s9,9
    80005ef4:	f8e404a3          	sb	a4,-119(s0)
    80005ef8:	00065c63          	bgez	a2,80005f10 <__printf+0x278>
    80005efc:	f9040713          	addi	a4,s0,-112
    80005f00:	00f70733          	add	a4,a4,a5
    80005f04:	02d00693          	li	a3,45
    80005f08:	fed70823          	sb	a3,-16(a4)
    80005f0c:	00078c93          	mv	s9,a5
    80005f10:	f8040793          	addi	a5,s0,-128
    80005f14:	01978cb3          	add	s9,a5,s9
    80005f18:	f7f40d13          	addi	s10,s0,-129
    80005f1c:	000cc503          	lbu	a0,0(s9)
    80005f20:	fffc8c93          	addi	s9,s9,-1
    80005f24:	00000097          	auipc	ra,0x0
    80005f28:	b90080e7          	jalr	-1136(ra) # 80005ab4 <consputc>
    80005f2c:	ffac98e3          	bne	s9,s10,80005f1c <__printf+0x284>
    80005f30:	00094503          	lbu	a0,0(s2)
    80005f34:	e00514e3          	bnez	a0,80005d3c <__printf+0xa4>
    80005f38:	1a0c1663          	bnez	s8,800060e4 <__printf+0x44c>
    80005f3c:	08813083          	ld	ra,136(sp)
    80005f40:	08013403          	ld	s0,128(sp)
    80005f44:	07813483          	ld	s1,120(sp)
    80005f48:	07013903          	ld	s2,112(sp)
    80005f4c:	06813983          	ld	s3,104(sp)
    80005f50:	06013a03          	ld	s4,96(sp)
    80005f54:	05813a83          	ld	s5,88(sp)
    80005f58:	05013b03          	ld	s6,80(sp)
    80005f5c:	04813b83          	ld	s7,72(sp)
    80005f60:	04013c03          	ld	s8,64(sp)
    80005f64:	03813c83          	ld	s9,56(sp)
    80005f68:	03013d03          	ld	s10,48(sp)
    80005f6c:	02813d83          	ld	s11,40(sp)
    80005f70:	0d010113          	addi	sp,sp,208
    80005f74:	00008067          	ret
    80005f78:	07300713          	li	a4,115
    80005f7c:	1ce78a63          	beq	a5,a4,80006150 <__printf+0x4b8>
    80005f80:	07800713          	li	a4,120
    80005f84:	1ee79e63          	bne	a5,a4,80006180 <__printf+0x4e8>
    80005f88:	f7843783          	ld	a5,-136(s0)
    80005f8c:	0007a703          	lw	a4,0(a5)
    80005f90:	00878793          	addi	a5,a5,8
    80005f94:	f6f43c23          	sd	a5,-136(s0)
    80005f98:	28074263          	bltz	a4,8000621c <__printf+0x584>
    80005f9c:	00002d97          	auipc	s11,0x2
    80005fa0:	64cd8d93          	addi	s11,s11,1612 # 800085e8 <digits>
    80005fa4:	00f77793          	andi	a5,a4,15
    80005fa8:	00fd87b3          	add	a5,s11,a5
    80005fac:	0007c683          	lbu	a3,0(a5)
    80005fb0:	00f00613          	li	a2,15
    80005fb4:	0007079b          	sext.w	a5,a4
    80005fb8:	f8d40023          	sb	a3,-128(s0)
    80005fbc:	0047559b          	srliw	a1,a4,0x4
    80005fc0:	0047569b          	srliw	a3,a4,0x4
    80005fc4:	00000c93          	li	s9,0
    80005fc8:	0ee65063          	bge	a2,a4,800060a8 <__printf+0x410>
    80005fcc:	00f6f693          	andi	a3,a3,15
    80005fd0:	00dd86b3          	add	a3,s11,a3
    80005fd4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005fd8:	0087d79b          	srliw	a5,a5,0x8
    80005fdc:	00100c93          	li	s9,1
    80005fe0:	f8d400a3          	sb	a3,-127(s0)
    80005fe4:	0cb67263          	bgeu	a2,a1,800060a8 <__printf+0x410>
    80005fe8:	00f7f693          	andi	a3,a5,15
    80005fec:	00dd86b3          	add	a3,s11,a3
    80005ff0:	0006c583          	lbu	a1,0(a3)
    80005ff4:	00f00613          	li	a2,15
    80005ff8:	0047d69b          	srliw	a3,a5,0x4
    80005ffc:	f8b40123          	sb	a1,-126(s0)
    80006000:	0047d593          	srli	a1,a5,0x4
    80006004:	28f67e63          	bgeu	a2,a5,800062a0 <__printf+0x608>
    80006008:	00f6f693          	andi	a3,a3,15
    8000600c:	00dd86b3          	add	a3,s11,a3
    80006010:	0006c503          	lbu	a0,0(a3)
    80006014:	0087d813          	srli	a6,a5,0x8
    80006018:	0087d69b          	srliw	a3,a5,0x8
    8000601c:	f8a401a3          	sb	a0,-125(s0)
    80006020:	28b67663          	bgeu	a2,a1,800062ac <__printf+0x614>
    80006024:	00f6f693          	andi	a3,a3,15
    80006028:	00dd86b3          	add	a3,s11,a3
    8000602c:	0006c583          	lbu	a1,0(a3)
    80006030:	00c7d513          	srli	a0,a5,0xc
    80006034:	00c7d69b          	srliw	a3,a5,0xc
    80006038:	f8b40223          	sb	a1,-124(s0)
    8000603c:	29067a63          	bgeu	a2,a6,800062d0 <__printf+0x638>
    80006040:	00f6f693          	andi	a3,a3,15
    80006044:	00dd86b3          	add	a3,s11,a3
    80006048:	0006c583          	lbu	a1,0(a3)
    8000604c:	0107d813          	srli	a6,a5,0x10
    80006050:	0107d69b          	srliw	a3,a5,0x10
    80006054:	f8b402a3          	sb	a1,-123(s0)
    80006058:	28a67263          	bgeu	a2,a0,800062dc <__printf+0x644>
    8000605c:	00f6f693          	andi	a3,a3,15
    80006060:	00dd86b3          	add	a3,s11,a3
    80006064:	0006c683          	lbu	a3,0(a3)
    80006068:	0147d79b          	srliw	a5,a5,0x14
    8000606c:	f8d40323          	sb	a3,-122(s0)
    80006070:	21067663          	bgeu	a2,a6,8000627c <__printf+0x5e4>
    80006074:	02079793          	slli	a5,a5,0x20
    80006078:	0207d793          	srli	a5,a5,0x20
    8000607c:	00fd8db3          	add	s11,s11,a5
    80006080:	000dc683          	lbu	a3,0(s11)
    80006084:	00800793          	li	a5,8
    80006088:	00700c93          	li	s9,7
    8000608c:	f8d403a3          	sb	a3,-121(s0)
    80006090:	00075c63          	bgez	a4,800060a8 <__printf+0x410>
    80006094:	f9040713          	addi	a4,s0,-112
    80006098:	00f70733          	add	a4,a4,a5
    8000609c:	02d00693          	li	a3,45
    800060a0:	fed70823          	sb	a3,-16(a4)
    800060a4:	00078c93          	mv	s9,a5
    800060a8:	f8040793          	addi	a5,s0,-128
    800060ac:	01978cb3          	add	s9,a5,s9
    800060b0:	f7f40d13          	addi	s10,s0,-129
    800060b4:	000cc503          	lbu	a0,0(s9)
    800060b8:	fffc8c93          	addi	s9,s9,-1
    800060bc:	00000097          	auipc	ra,0x0
    800060c0:	9f8080e7          	jalr	-1544(ra) # 80005ab4 <consputc>
    800060c4:	ff9d18e3          	bne	s10,s9,800060b4 <__printf+0x41c>
    800060c8:	0100006f          	j	800060d8 <__printf+0x440>
    800060cc:	00000097          	auipc	ra,0x0
    800060d0:	9e8080e7          	jalr	-1560(ra) # 80005ab4 <consputc>
    800060d4:	000c8493          	mv	s1,s9
    800060d8:	00094503          	lbu	a0,0(s2)
    800060dc:	c60510e3          	bnez	a0,80005d3c <__printf+0xa4>
    800060e0:	e40c0ee3          	beqz	s8,80005f3c <__printf+0x2a4>
    800060e4:	00004517          	auipc	a0,0x4
    800060e8:	4ec50513          	addi	a0,a0,1260 # 8000a5d0 <pr>
    800060ec:	00001097          	auipc	ra,0x1
    800060f0:	94c080e7          	jalr	-1716(ra) # 80006a38 <release>
    800060f4:	e49ff06f          	j	80005f3c <__printf+0x2a4>
    800060f8:	f7843783          	ld	a5,-136(s0)
    800060fc:	03000513          	li	a0,48
    80006100:	01000d13          	li	s10,16
    80006104:	00878713          	addi	a4,a5,8
    80006108:	0007bc83          	ld	s9,0(a5)
    8000610c:	f6e43c23          	sd	a4,-136(s0)
    80006110:	00000097          	auipc	ra,0x0
    80006114:	9a4080e7          	jalr	-1628(ra) # 80005ab4 <consputc>
    80006118:	07800513          	li	a0,120
    8000611c:	00000097          	auipc	ra,0x0
    80006120:	998080e7          	jalr	-1640(ra) # 80005ab4 <consputc>
    80006124:	00002d97          	auipc	s11,0x2
    80006128:	4c4d8d93          	addi	s11,s11,1220 # 800085e8 <digits>
    8000612c:	03ccd793          	srli	a5,s9,0x3c
    80006130:	00fd87b3          	add	a5,s11,a5
    80006134:	0007c503          	lbu	a0,0(a5)
    80006138:	fffd0d1b          	addiw	s10,s10,-1
    8000613c:	004c9c93          	slli	s9,s9,0x4
    80006140:	00000097          	auipc	ra,0x0
    80006144:	974080e7          	jalr	-1676(ra) # 80005ab4 <consputc>
    80006148:	fe0d12e3          	bnez	s10,8000612c <__printf+0x494>
    8000614c:	f8dff06f          	j	800060d8 <__printf+0x440>
    80006150:	f7843783          	ld	a5,-136(s0)
    80006154:	0007bc83          	ld	s9,0(a5)
    80006158:	00878793          	addi	a5,a5,8
    8000615c:	f6f43c23          	sd	a5,-136(s0)
    80006160:	000c9a63          	bnez	s9,80006174 <__printf+0x4dc>
    80006164:	1080006f          	j	8000626c <__printf+0x5d4>
    80006168:	001c8c93          	addi	s9,s9,1
    8000616c:	00000097          	auipc	ra,0x0
    80006170:	948080e7          	jalr	-1720(ra) # 80005ab4 <consputc>
    80006174:	000cc503          	lbu	a0,0(s9)
    80006178:	fe0518e3          	bnez	a0,80006168 <__printf+0x4d0>
    8000617c:	f5dff06f          	j	800060d8 <__printf+0x440>
    80006180:	02500513          	li	a0,37
    80006184:	00000097          	auipc	ra,0x0
    80006188:	930080e7          	jalr	-1744(ra) # 80005ab4 <consputc>
    8000618c:	000c8513          	mv	a0,s9
    80006190:	00000097          	auipc	ra,0x0
    80006194:	924080e7          	jalr	-1756(ra) # 80005ab4 <consputc>
    80006198:	f41ff06f          	j	800060d8 <__printf+0x440>
    8000619c:	02500513          	li	a0,37
    800061a0:	00000097          	auipc	ra,0x0
    800061a4:	914080e7          	jalr	-1772(ra) # 80005ab4 <consputc>
    800061a8:	f31ff06f          	j	800060d8 <__printf+0x440>
    800061ac:	00030513          	mv	a0,t1
    800061b0:	00000097          	auipc	ra,0x0
    800061b4:	7bc080e7          	jalr	1980(ra) # 8000696c <acquire>
    800061b8:	b4dff06f          	j	80005d04 <__printf+0x6c>
    800061bc:	40c0053b          	negw	a0,a2
    800061c0:	00a00713          	li	a4,10
    800061c4:	02e576bb          	remuw	a3,a0,a4
    800061c8:	00002d97          	auipc	s11,0x2
    800061cc:	420d8d93          	addi	s11,s11,1056 # 800085e8 <digits>
    800061d0:	ff700593          	li	a1,-9
    800061d4:	02069693          	slli	a3,a3,0x20
    800061d8:	0206d693          	srli	a3,a3,0x20
    800061dc:	00dd86b3          	add	a3,s11,a3
    800061e0:	0006c683          	lbu	a3,0(a3)
    800061e4:	02e557bb          	divuw	a5,a0,a4
    800061e8:	f8d40023          	sb	a3,-128(s0)
    800061ec:	10b65e63          	bge	a2,a1,80006308 <__printf+0x670>
    800061f0:	06300593          	li	a1,99
    800061f4:	02e7f6bb          	remuw	a3,a5,a4
    800061f8:	02069693          	slli	a3,a3,0x20
    800061fc:	0206d693          	srli	a3,a3,0x20
    80006200:	00dd86b3          	add	a3,s11,a3
    80006204:	0006c683          	lbu	a3,0(a3)
    80006208:	02e7d73b          	divuw	a4,a5,a4
    8000620c:	00200793          	li	a5,2
    80006210:	f8d400a3          	sb	a3,-127(s0)
    80006214:	bca5ece3          	bltu	a1,a0,80005dec <__printf+0x154>
    80006218:	ce5ff06f          	j	80005efc <__printf+0x264>
    8000621c:	40e007bb          	negw	a5,a4
    80006220:	00002d97          	auipc	s11,0x2
    80006224:	3c8d8d93          	addi	s11,s11,968 # 800085e8 <digits>
    80006228:	00f7f693          	andi	a3,a5,15
    8000622c:	00dd86b3          	add	a3,s11,a3
    80006230:	0006c583          	lbu	a1,0(a3)
    80006234:	ff100613          	li	a2,-15
    80006238:	0047d69b          	srliw	a3,a5,0x4
    8000623c:	f8b40023          	sb	a1,-128(s0)
    80006240:	0047d59b          	srliw	a1,a5,0x4
    80006244:	0ac75e63          	bge	a4,a2,80006300 <__printf+0x668>
    80006248:	00f6f693          	andi	a3,a3,15
    8000624c:	00dd86b3          	add	a3,s11,a3
    80006250:	0006c603          	lbu	a2,0(a3)
    80006254:	00f00693          	li	a3,15
    80006258:	0087d79b          	srliw	a5,a5,0x8
    8000625c:	f8c400a3          	sb	a2,-127(s0)
    80006260:	d8b6e4e3          	bltu	a3,a1,80005fe8 <__printf+0x350>
    80006264:	00200793          	li	a5,2
    80006268:	e2dff06f          	j	80006094 <__printf+0x3fc>
    8000626c:	00002c97          	auipc	s9,0x2
    80006270:	35cc8c93          	addi	s9,s9,860 # 800085c8 <CONSOLE_STATUS+0x5b8>
    80006274:	02800513          	li	a0,40
    80006278:	ef1ff06f          	j	80006168 <__printf+0x4d0>
    8000627c:	00700793          	li	a5,7
    80006280:	00600c93          	li	s9,6
    80006284:	e0dff06f          	j	80006090 <__printf+0x3f8>
    80006288:	00700793          	li	a5,7
    8000628c:	00600c93          	li	s9,6
    80006290:	c69ff06f          	j	80005ef8 <__printf+0x260>
    80006294:	00300793          	li	a5,3
    80006298:	00200c93          	li	s9,2
    8000629c:	c5dff06f          	j	80005ef8 <__printf+0x260>
    800062a0:	00300793          	li	a5,3
    800062a4:	00200c93          	li	s9,2
    800062a8:	de9ff06f          	j	80006090 <__printf+0x3f8>
    800062ac:	00400793          	li	a5,4
    800062b0:	00300c93          	li	s9,3
    800062b4:	dddff06f          	j	80006090 <__printf+0x3f8>
    800062b8:	00400793          	li	a5,4
    800062bc:	00300c93          	li	s9,3
    800062c0:	c39ff06f          	j	80005ef8 <__printf+0x260>
    800062c4:	00500793          	li	a5,5
    800062c8:	00400c93          	li	s9,4
    800062cc:	c2dff06f          	j	80005ef8 <__printf+0x260>
    800062d0:	00500793          	li	a5,5
    800062d4:	00400c93          	li	s9,4
    800062d8:	db9ff06f          	j	80006090 <__printf+0x3f8>
    800062dc:	00600793          	li	a5,6
    800062e0:	00500c93          	li	s9,5
    800062e4:	dadff06f          	j	80006090 <__printf+0x3f8>
    800062e8:	00600793          	li	a5,6
    800062ec:	00500c93          	li	s9,5
    800062f0:	c09ff06f          	j	80005ef8 <__printf+0x260>
    800062f4:	00800793          	li	a5,8
    800062f8:	00700c93          	li	s9,7
    800062fc:	bfdff06f          	j	80005ef8 <__printf+0x260>
    80006300:	00100793          	li	a5,1
    80006304:	d91ff06f          	j	80006094 <__printf+0x3fc>
    80006308:	00100793          	li	a5,1
    8000630c:	bf1ff06f          	j	80005efc <__printf+0x264>
    80006310:	00900793          	li	a5,9
    80006314:	00800c93          	li	s9,8
    80006318:	be1ff06f          	j	80005ef8 <__printf+0x260>
    8000631c:	00002517          	auipc	a0,0x2
    80006320:	2b450513          	addi	a0,a0,692 # 800085d0 <CONSOLE_STATUS+0x5c0>
    80006324:	00000097          	auipc	ra,0x0
    80006328:	918080e7          	jalr	-1768(ra) # 80005c3c <panic>

000000008000632c <printfinit>:
    8000632c:	fe010113          	addi	sp,sp,-32
    80006330:	00813823          	sd	s0,16(sp)
    80006334:	00913423          	sd	s1,8(sp)
    80006338:	00113c23          	sd	ra,24(sp)
    8000633c:	02010413          	addi	s0,sp,32
    80006340:	00004497          	auipc	s1,0x4
    80006344:	29048493          	addi	s1,s1,656 # 8000a5d0 <pr>
    80006348:	00048513          	mv	a0,s1
    8000634c:	00002597          	auipc	a1,0x2
    80006350:	29458593          	addi	a1,a1,660 # 800085e0 <CONSOLE_STATUS+0x5d0>
    80006354:	00000097          	auipc	ra,0x0
    80006358:	5f4080e7          	jalr	1524(ra) # 80006948 <initlock>
    8000635c:	01813083          	ld	ra,24(sp)
    80006360:	01013403          	ld	s0,16(sp)
    80006364:	0004ac23          	sw	zero,24(s1)
    80006368:	00813483          	ld	s1,8(sp)
    8000636c:	02010113          	addi	sp,sp,32
    80006370:	00008067          	ret

0000000080006374 <uartinit>:
    80006374:	ff010113          	addi	sp,sp,-16
    80006378:	00813423          	sd	s0,8(sp)
    8000637c:	01010413          	addi	s0,sp,16
    80006380:	100007b7          	lui	a5,0x10000
    80006384:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006388:	f8000713          	li	a4,-128
    8000638c:	00e781a3          	sb	a4,3(a5)
    80006390:	00300713          	li	a4,3
    80006394:	00e78023          	sb	a4,0(a5)
    80006398:	000780a3          	sb	zero,1(a5)
    8000639c:	00e781a3          	sb	a4,3(a5)
    800063a0:	00700693          	li	a3,7
    800063a4:	00d78123          	sb	a3,2(a5)
    800063a8:	00e780a3          	sb	a4,1(a5)
    800063ac:	00813403          	ld	s0,8(sp)
    800063b0:	01010113          	addi	sp,sp,16
    800063b4:	00008067          	ret

00000000800063b8 <uartputc>:
    800063b8:	00003797          	auipc	a5,0x3
    800063bc:	f907a783          	lw	a5,-112(a5) # 80009348 <panicked>
    800063c0:	00078463          	beqz	a5,800063c8 <uartputc+0x10>
    800063c4:	0000006f          	j	800063c4 <uartputc+0xc>
    800063c8:	fd010113          	addi	sp,sp,-48
    800063cc:	02813023          	sd	s0,32(sp)
    800063d0:	00913c23          	sd	s1,24(sp)
    800063d4:	01213823          	sd	s2,16(sp)
    800063d8:	01313423          	sd	s3,8(sp)
    800063dc:	02113423          	sd	ra,40(sp)
    800063e0:	03010413          	addi	s0,sp,48
    800063e4:	00003917          	auipc	s2,0x3
    800063e8:	f6c90913          	addi	s2,s2,-148 # 80009350 <uart_tx_r>
    800063ec:	00093783          	ld	a5,0(s2)
    800063f0:	00003497          	auipc	s1,0x3
    800063f4:	f6848493          	addi	s1,s1,-152 # 80009358 <uart_tx_w>
    800063f8:	0004b703          	ld	a4,0(s1)
    800063fc:	02078693          	addi	a3,a5,32
    80006400:	00050993          	mv	s3,a0
    80006404:	02e69c63          	bne	a3,a4,8000643c <uartputc+0x84>
    80006408:	00001097          	auipc	ra,0x1
    8000640c:	834080e7          	jalr	-1996(ra) # 80006c3c <push_on>
    80006410:	00093783          	ld	a5,0(s2)
    80006414:	0004b703          	ld	a4,0(s1)
    80006418:	02078793          	addi	a5,a5,32
    8000641c:	00e79463          	bne	a5,a4,80006424 <uartputc+0x6c>
    80006420:	0000006f          	j	80006420 <uartputc+0x68>
    80006424:	00001097          	auipc	ra,0x1
    80006428:	88c080e7          	jalr	-1908(ra) # 80006cb0 <pop_on>
    8000642c:	00093783          	ld	a5,0(s2)
    80006430:	0004b703          	ld	a4,0(s1)
    80006434:	02078693          	addi	a3,a5,32
    80006438:	fce688e3          	beq	a3,a4,80006408 <uartputc+0x50>
    8000643c:	01f77693          	andi	a3,a4,31
    80006440:	00004597          	auipc	a1,0x4
    80006444:	1b058593          	addi	a1,a1,432 # 8000a5f0 <uart_tx_buf>
    80006448:	00d586b3          	add	a3,a1,a3
    8000644c:	00170713          	addi	a4,a4,1
    80006450:	01368023          	sb	s3,0(a3)
    80006454:	00e4b023          	sd	a4,0(s1)
    80006458:	10000637          	lui	a2,0x10000
    8000645c:	02f71063          	bne	a4,a5,8000647c <uartputc+0xc4>
    80006460:	0340006f          	j	80006494 <uartputc+0xdc>
    80006464:	00074703          	lbu	a4,0(a4)
    80006468:	00f93023          	sd	a5,0(s2)
    8000646c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006470:	00093783          	ld	a5,0(s2)
    80006474:	0004b703          	ld	a4,0(s1)
    80006478:	00f70e63          	beq	a4,a5,80006494 <uartputc+0xdc>
    8000647c:	00564683          	lbu	a3,5(a2)
    80006480:	01f7f713          	andi	a4,a5,31
    80006484:	00e58733          	add	a4,a1,a4
    80006488:	0206f693          	andi	a3,a3,32
    8000648c:	00178793          	addi	a5,a5,1
    80006490:	fc069ae3          	bnez	a3,80006464 <uartputc+0xac>
    80006494:	02813083          	ld	ra,40(sp)
    80006498:	02013403          	ld	s0,32(sp)
    8000649c:	01813483          	ld	s1,24(sp)
    800064a0:	01013903          	ld	s2,16(sp)
    800064a4:	00813983          	ld	s3,8(sp)
    800064a8:	03010113          	addi	sp,sp,48
    800064ac:	00008067          	ret

00000000800064b0 <uartputc_sync>:
    800064b0:	ff010113          	addi	sp,sp,-16
    800064b4:	00813423          	sd	s0,8(sp)
    800064b8:	01010413          	addi	s0,sp,16
    800064bc:	00003717          	auipc	a4,0x3
    800064c0:	e8c72703          	lw	a4,-372(a4) # 80009348 <panicked>
    800064c4:	02071663          	bnez	a4,800064f0 <uartputc_sync+0x40>
    800064c8:	00050793          	mv	a5,a0
    800064cc:	100006b7          	lui	a3,0x10000
    800064d0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800064d4:	02077713          	andi	a4,a4,32
    800064d8:	fe070ce3          	beqz	a4,800064d0 <uartputc_sync+0x20>
    800064dc:	0ff7f793          	andi	a5,a5,255
    800064e0:	00f68023          	sb	a5,0(a3)
    800064e4:	00813403          	ld	s0,8(sp)
    800064e8:	01010113          	addi	sp,sp,16
    800064ec:	00008067          	ret
    800064f0:	0000006f          	j	800064f0 <uartputc_sync+0x40>

00000000800064f4 <uartstart>:
    800064f4:	ff010113          	addi	sp,sp,-16
    800064f8:	00813423          	sd	s0,8(sp)
    800064fc:	01010413          	addi	s0,sp,16
    80006500:	00003617          	auipc	a2,0x3
    80006504:	e5060613          	addi	a2,a2,-432 # 80009350 <uart_tx_r>
    80006508:	00003517          	auipc	a0,0x3
    8000650c:	e5050513          	addi	a0,a0,-432 # 80009358 <uart_tx_w>
    80006510:	00063783          	ld	a5,0(a2)
    80006514:	00053703          	ld	a4,0(a0)
    80006518:	04f70263          	beq	a4,a5,8000655c <uartstart+0x68>
    8000651c:	100005b7          	lui	a1,0x10000
    80006520:	00004817          	auipc	a6,0x4
    80006524:	0d080813          	addi	a6,a6,208 # 8000a5f0 <uart_tx_buf>
    80006528:	01c0006f          	j	80006544 <uartstart+0x50>
    8000652c:	0006c703          	lbu	a4,0(a3)
    80006530:	00f63023          	sd	a5,0(a2)
    80006534:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006538:	00063783          	ld	a5,0(a2)
    8000653c:	00053703          	ld	a4,0(a0)
    80006540:	00f70e63          	beq	a4,a5,8000655c <uartstart+0x68>
    80006544:	01f7f713          	andi	a4,a5,31
    80006548:	00e806b3          	add	a3,a6,a4
    8000654c:	0055c703          	lbu	a4,5(a1)
    80006550:	00178793          	addi	a5,a5,1
    80006554:	02077713          	andi	a4,a4,32
    80006558:	fc071ae3          	bnez	a4,8000652c <uartstart+0x38>
    8000655c:	00813403          	ld	s0,8(sp)
    80006560:	01010113          	addi	sp,sp,16
    80006564:	00008067          	ret

0000000080006568 <uartgetc>:
    80006568:	ff010113          	addi	sp,sp,-16
    8000656c:	00813423          	sd	s0,8(sp)
    80006570:	01010413          	addi	s0,sp,16
    80006574:	10000737          	lui	a4,0x10000
    80006578:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000657c:	0017f793          	andi	a5,a5,1
    80006580:	00078c63          	beqz	a5,80006598 <uartgetc+0x30>
    80006584:	00074503          	lbu	a0,0(a4)
    80006588:	0ff57513          	andi	a0,a0,255
    8000658c:	00813403          	ld	s0,8(sp)
    80006590:	01010113          	addi	sp,sp,16
    80006594:	00008067          	ret
    80006598:	fff00513          	li	a0,-1
    8000659c:	ff1ff06f          	j	8000658c <uartgetc+0x24>

00000000800065a0 <uartintr>:
    800065a0:	100007b7          	lui	a5,0x10000
    800065a4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800065a8:	0017f793          	andi	a5,a5,1
    800065ac:	0a078463          	beqz	a5,80006654 <uartintr+0xb4>
    800065b0:	fe010113          	addi	sp,sp,-32
    800065b4:	00813823          	sd	s0,16(sp)
    800065b8:	00913423          	sd	s1,8(sp)
    800065bc:	00113c23          	sd	ra,24(sp)
    800065c0:	02010413          	addi	s0,sp,32
    800065c4:	100004b7          	lui	s1,0x10000
    800065c8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800065cc:	0ff57513          	andi	a0,a0,255
    800065d0:	fffff097          	auipc	ra,0xfffff
    800065d4:	534080e7          	jalr	1332(ra) # 80005b04 <consoleintr>
    800065d8:	0054c783          	lbu	a5,5(s1)
    800065dc:	0017f793          	andi	a5,a5,1
    800065e0:	fe0794e3          	bnez	a5,800065c8 <uartintr+0x28>
    800065e4:	00003617          	auipc	a2,0x3
    800065e8:	d6c60613          	addi	a2,a2,-660 # 80009350 <uart_tx_r>
    800065ec:	00003517          	auipc	a0,0x3
    800065f0:	d6c50513          	addi	a0,a0,-660 # 80009358 <uart_tx_w>
    800065f4:	00063783          	ld	a5,0(a2)
    800065f8:	00053703          	ld	a4,0(a0)
    800065fc:	04f70263          	beq	a4,a5,80006640 <uartintr+0xa0>
    80006600:	100005b7          	lui	a1,0x10000
    80006604:	00004817          	auipc	a6,0x4
    80006608:	fec80813          	addi	a6,a6,-20 # 8000a5f0 <uart_tx_buf>
    8000660c:	01c0006f          	j	80006628 <uartintr+0x88>
    80006610:	0006c703          	lbu	a4,0(a3)
    80006614:	00f63023          	sd	a5,0(a2)
    80006618:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000661c:	00063783          	ld	a5,0(a2)
    80006620:	00053703          	ld	a4,0(a0)
    80006624:	00f70e63          	beq	a4,a5,80006640 <uartintr+0xa0>
    80006628:	01f7f713          	andi	a4,a5,31
    8000662c:	00e806b3          	add	a3,a6,a4
    80006630:	0055c703          	lbu	a4,5(a1)
    80006634:	00178793          	addi	a5,a5,1
    80006638:	02077713          	andi	a4,a4,32
    8000663c:	fc071ae3          	bnez	a4,80006610 <uartintr+0x70>
    80006640:	01813083          	ld	ra,24(sp)
    80006644:	01013403          	ld	s0,16(sp)
    80006648:	00813483          	ld	s1,8(sp)
    8000664c:	02010113          	addi	sp,sp,32
    80006650:	00008067          	ret
    80006654:	00003617          	auipc	a2,0x3
    80006658:	cfc60613          	addi	a2,a2,-772 # 80009350 <uart_tx_r>
    8000665c:	00003517          	auipc	a0,0x3
    80006660:	cfc50513          	addi	a0,a0,-772 # 80009358 <uart_tx_w>
    80006664:	00063783          	ld	a5,0(a2)
    80006668:	00053703          	ld	a4,0(a0)
    8000666c:	04f70263          	beq	a4,a5,800066b0 <uartintr+0x110>
    80006670:	100005b7          	lui	a1,0x10000
    80006674:	00004817          	auipc	a6,0x4
    80006678:	f7c80813          	addi	a6,a6,-132 # 8000a5f0 <uart_tx_buf>
    8000667c:	01c0006f          	j	80006698 <uartintr+0xf8>
    80006680:	0006c703          	lbu	a4,0(a3)
    80006684:	00f63023          	sd	a5,0(a2)
    80006688:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000668c:	00063783          	ld	a5,0(a2)
    80006690:	00053703          	ld	a4,0(a0)
    80006694:	02f70063          	beq	a4,a5,800066b4 <uartintr+0x114>
    80006698:	01f7f713          	andi	a4,a5,31
    8000669c:	00e806b3          	add	a3,a6,a4
    800066a0:	0055c703          	lbu	a4,5(a1)
    800066a4:	00178793          	addi	a5,a5,1
    800066a8:	02077713          	andi	a4,a4,32
    800066ac:	fc071ae3          	bnez	a4,80006680 <uartintr+0xe0>
    800066b0:	00008067          	ret
    800066b4:	00008067          	ret

00000000800066b8 <kinit>:
    800066b8:	fc010113          	addi	sp,sp,-64
    800066bc:	02913423          	sd	s1,40(sp)
    800066c0:	fffff7b7          	lui	a5,0xfffff
    800066c4:	00005497          	auipc	s1,0x5
    800066c8:	f4b48493          	addi	s1,s1,-181 # 8000b60f <end+0xfff>
    800066cc:	02813823          	sd	s0,48(sp)
    800066d0:	01313c23          	sd	s3,24(sp)
    800066d4:	00f4f4b3          	and	s1,s1,a5
    800066d8:	02113c23          	sd	ra,56(sp)
    800066dc:	03213023          	sd	s2,32(sp)
    800066e0:	01413823          	sd	s4,16(sp)
    800066e4:	01513423          	sd	s5,8(sp)
    800066e8:	04010413          	addi	s0,sp,64
    800066ec:	000017b7          	lui	a5,0x1
    800066f0:	01100993          	li	s3,17
    800066f4:	00f487b3          	add	a5,s1,a5
    800066f8:	01b99993          	slli	s3,s3,0x1b
    800066fc:	06f9e063          	bltu	s3,a5,8000675c <kinit+0xa4>
    80006700:	00004a97          	auipc	s5,0x4
    80006704:	f10a8a93          	addi	s5,s5,-240 # 8000a610 <end>
    80006708:	0754ec63          	bltu	s1,s5,80006780 <kinit+0xc8>
    8000670c:	0734fa63          	bgeu	s1,s3,80006780 <kinit+0xc8>
    80006710:	00088a37          	lui	s4,0x88
    80006714:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006718:	00003917          	auipc	s2,0x3
    8000671c:	c4890913          	addi	s2,s2,-952 # 80009360 <kmem>
    80006720:	00ca1a13          	slli	s4,s4,0xc
    80006724:	0140006f          	j	80006738 <kinit+0x80>
    80006728:	000017b7          	lui	a5,0x1
    8000672c:	00f484b3          	add	s1,s1,a5
    80006730:	0554e863          	bltu	s1,s5,80006780 <kinit+0xc8>
    80006734:	0534f663          	bgeu	s1,s3,80006780 <kinit+0xc8>
    80006738:	00001637          	lui	a2,0x1
    8000673c:	00100593          	li	a1,1
    80006740:	00048513          	mv	a0,s1
    80006744:	00000097          	auipc	ra,0x0
    80006748:	5e4080e7          	jalr	1508(ra) # 80006d28 <__memset>
    8000674c:	00093783          	ld	a5,0(s2)
    80006750:	00f4b023          	sd	a5,0(s1)
    80006754:	00993023          	sd	s1,0(s2)
    80006758:	fd4498e3          	bne	s1,s4,80006728 <kinit+0x70>
    8000675c:	03813083          	ld	ra,56(sp)
    80006760:	03013403          	ld	s0,48(sp)
    80006764:	02813483          	ld	s1,40(sp)
    80006768:	02013903          	ld	s2,32(sp)
    8000676c:	01813983          	ld	s3,24(sp)
    80006770:	01013a03          	ld	s4,16(sp)
    80006774:	00813a83          	ld	s5,8(sp)
    80006778:	04010113          	addi	sp,sp,64
    8000677c:	00008067          	ret
    80006780:	00002517          	auipc	a0,0x2
    80006784:	e8050513          	addi	a0,a0,-384 # 80008600 <digits+0x18>
    80006788:	fffff097          	auipc	ra,0xfffff
    8000678c:	4b4080e7          	jalr	1204(ra) # 80005c3c <panic>

0000000080006790 <freerange>:
    80006790:	fc010113          	addi	sp,sp,-64
    80006794:	000017b7          	lui	a5,0x1
    80006798:	02913423          	sd	s1,40(sp)
    8000679c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800067a0:	009504b3          	add	s1,a0,s1
    800067a4:	fffff537          	lui	a0,0xfffff
    800067a8:	02813823          	sd	s0,48(sp)
    800067ac:	02113c23          	sd	ra,56(sp)
    800067b0:	03213023          	sd	s2,32(sp)
    800067b4:	01313c23          	sd	s3,24(sp)
    800067b8:	01413823          	sd	s4,16(sp)
    800067bc:	01513423          	sd	s5,8(sp)
    800067c0:	01613023          	sd	s6,0(sp)
    800067c4:	04010413          	addi	s0,sp,64
    800067c8:	00a4f4b3          	and	s1,s1,a0
    800067cc:	00f487b3          	add	a5,s1,a5
    800067d0:	06f5e463          	bltu	a1,a5,80006838 <freerange+0xa8>
    800067d4:	00004a97          	auipc	s5,0x4
    800067d8:	e3ca8a93          	addi	s5,s5,-452 # 8000a610 <end>
    800067dc:	0954e263          	bltu	s1,s5,80006860 <freerange+0xd0>
    800067e0:	01100993          	li	s3,17
    800067e4:	01b99993          	slli	s3,s3,0x1b
    800067e8:	0734fc63          	bgeu	s1,s3,80006860 <freerange+0xd0>
    800067ec:	00058a13          	mv	s4,a1
    800067f0:	00003917          	auipc	s2,0x3
    800067f4:	b7090913          	addi	s2,s2,-1168 # 80009360 <kmem>
    800067f8:	00002b37          	lui	s6,0x2
    800067fc:	0140006f          	j	80006810 <freerange+0x80>
    80006800:	000017b7          	lui	a5,0x1
    80006804:	00f484b3          	add	s1,s1,a5
    80006808:	0554ec63          	bltu	s1,s5,80006860 <freerange+0xd0>
    8000680c:	0534fa63          	bgeu	s1,s3,80006860 <freerange+0xd0>
    80006810:	00001637          	lui	a2,0x1
    80006814:	00100593          	li	a1,1
    80006818:	00048513          	mv	a0,s1
    8000681c:	00000097          	auipc	ra,0x0
    80006820:	50c080e7          	jalr	1292(ra) # 80006d28 <__memset>
    80006824:	00093703          	ld	a4,0(s2)
    80006828:	016487b3          	add	a5,s1,s6
    8000682c:	00e4b023          	sd	a4,0(s1)
    80006830:	00993023          	sd	s1,0(s2)
    80006834:	fcfa76e3          	bgeu	s4,a5,80006800 <freerange+0x70>
    80006838:	03813083          	ld	ra,56(sp)
    8000683c:	03013403          	ld	s0,48(sp)
    80006840:	02813483          	ld	s1,40(sp)
    80006844:	02013903          	ld	s2,32(sp)
    80006848:	01813983          	ld	s3,24(sp)
    8000684c:	01013a03          	ld	s4,16(sp)
    80006850:	00813a83          	ld	s5,8(sp)
    80006854:	00013b03          	ld	s6,0(sp)
    80006858:	04010113          	addi	sp,sp,64
    8000685c:	00008067          	ret
    80006860:	00002517          	auipc	a0,0x2
    80006864:	da050513          	addi	a0,a0,-608 # 80008600 <digits+0x18>
    80006868:	fffff097          	auipc	ra,0xfffff
    8000686c:	3d4080e7          	jalr	980(ra) # 80005c3c <panic>

0000000080006870 <kfree>:
    80006870:	fe010113          	addi	sp,sp,-32
    80006874:	00813823          	sd	s0,16(sp)
    80006878:	00113c23          	sd	ra,24(sp)
    8000687c:	00913423          	sd	s1,8(sp)
    80006880:	02010413          	addi	s0,sp,32
    80006884:	03451793          	slli	a5,a0,0x34
    80006888:	04079c63          	bnez	a5,800068e0 <kfree+0x70>
    8000688c:	00004797          	auipc	a5,0x4
    80006890:	d8478793          	addi	a5,a5,-636 # 8000a610 <end>
    80006894:	00050493          	mv	s1,a0
    80006898:	04f56463          	bltu	a0,a5,800068e0 <kfree+0x70>
    8000689c:	01100793          	li	a5,17
    800068a0:	01b79793          	slli	a5,a5,0x1b
    800068a4:	02f57e63          	bgeu	a0,a5,800068e0 <kfree+0x70>
    800068a8:	00001637          	lui	a2,0x1
    800068ac:	00100593          	li	a1,1
    800068b0:	00000097          	auipc	ra,0x0
    800068b4:	478080e7          	jalr	1144(ra) # 80006d28 <__memset>
    800068b8:	00003797          	auipc	a5,0x3
    800068bc:	aa878793          	addi	a5,a5,-1368 # 80009360 <kmem>
    800068c0:	0007b703          	ld	a4,0(a5)
    800068c4:	01813083          	ld	ra,24(sp)
    800068c8:	01013403          	ld	s0,16(sp)
    800068cc:	00e4b023          	sd	a4,0(s1)
    800068d0:	0097b023          	sd	s1,0(a5)
    800068d4:	00813483          	ld	s1,8(sp)
    800068d8:	02010113          	addi	sp,sp,32
    800068dc:	00008067          	ret
    800068e0:	00002517          	auipc	a0,0x2
    800068e4:	d2050513          	addi	a0,a0,-736 # 80008600 <digits+0x18>
    800068e8:	fffff097          	auipc	ra,0xfffff
    800068ec:	354080e7          	jalr	852(ra) # 80005c3c <panic>

00000000800068f0 <kalloc>:
    800068f0:	fe010113          	addi	sp,sp,-32
    800068f4:	00813823          	sd	s0,16(sp)
    800068f8:	00913423          	sd	s1,8(sp)
    800068fc:	00113c23          	sd	ra,24(sp)
    80006900:	02010413          	addi	s0,sp,32
    80006904:	00003797          	auipc	a5,0x3
    80006908:	a5c78793          	addi	a5,a5,-1444 # 80009360 <kmem>
    8000690c:	0007b483          	ld	s1,0(a5)
    80006910:	02048063          	beqz	s1,80006930 <kalloc+0x40>
    80006914:	0004b703          	ld	a4,0(s1)
    80006918:	00001637          	lui	a2,0x1
    8000691c:	00500593          	li	a1,5
    80006920:	00048513          	mv	a0,s1
    80006924:	00e7b023          	sd	a4,0(a5)
    80006928:	00000097          	auipc	ra,0x0
    8000692c:	400080e7          	jalr	1024(ra) # 80006d28 <__memset>
    80006930:	01813083          	ld	ra,24(sp)
    80006934:	01013403          	ld	s0,16(sp)
    80006938:	00048513          	mv	a0,s1
    8000693c:	00813483          	ld	s1,8(sp)
    80006940:	02010113          	addi	sp,sp,32
    80006944:	00008067          	ret

0000000080006948 <initlock>:
    80006948:	ff010113          	addi	sp,sp,-16
    8000694c:	00813423          	sd	s0,8(sp)
    80006950:	01010413          	addi	s0,sp,16
    80006954:	00813403          	ld	s0,8(sp)
    80006958:	00b53423          	sd	a1,8(a0)
    8000695c:	00052023          	sw	zero,0(a0)
    80006960:	00053823          	sd	zero,16(a0)
    80006964:	01010113          	addi	sp,sp,16
    80006968:	00008067          	ret

000000008000696c <acquire>:
    8000696c:	fe010113          	addi	sp,sp,-32
    80006970:	00813823          	sd	s0,16(sp)
    80006974:	00913423          	sd	s1,8(sp)
    80006978:	00113c23          	sd	ra,24(sp)
    8000697c:	01213023          	sd	s2,0(sp)
    80006980:	02010413          	addi	s0,sp,32
    80006984:	00050493          	mv	s1,a0
    80006988:	10002973          	csrr	s2,sstatus
    8000698c:	100027f3          	csrr	a5,sstatus
    80006990:	ffd7f793          	andi	a5,a5,-3
    80006994:	10079073          	csrw	sstatus,a5
    80006998:	fffff097          	auipc	ra,0xfffff
    8000699c:	8ec080e7          	jalr	-1812(ra) # 80005284 <mycpu>
    800069a0:	07852783          	lw	a5,120(a0)
    800069a4:	06078e63          	beqz	a5,80006a20 <acquire+0xb4>
    800069a8:	fffff097          	auipc	ra,0xfffff
    800069ac:	8dc080e7          	jalr	-1828(ra) # 80005284 <mycpu>
    800069b0:	07852783          	lw	a5,120(a0)
    800069b4:	0004a703          	lw	a4,0(s1)
    800069b8:	0017879b          	addiw	a5,a5,1
    800069bc:	06f52c23          	sw	a5,120(a0)
    800069c0:	04071063          	bnez	a4,80006a00 <acquire+0x94>
    800069c4:	00100713          	li	a4,1
    800069c8:	00070793          	mv	a5,a4
    800069cc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800069d0:	0007879b          	sext.w	a5,a5
    800069d4:	fe079ae3          	bnez	a5,800069c8 <acquire+0x5c>
    800069d8:	0ff0000f          	fence
    800069dc:	fffff097          	auipc	ra,0xfffff
    800069e0:	8a8080e7          	jalr	-1880(ra) # 80005284 <mycpu>
    800069e4:	01813083          	ld	ra,24(sp)
    800069e8:	01013403          	ld	s0,16(sp)
    800069ec:	00a4b823          	sd	a0,16(s1)
    800069f0:	00013903          	ld	s2,0(sp)
    800069f4:	00813483          	ld	s1,8(sp)
    800069f8:	02010113          	addi	sp,sp,32
    800069fc:	00008067          	ret
    80006a00:	0104b903          	ld	s2,16(s1)
    80006a04:	fffff097          	auipc	ra,0xfffff
    80006a08:	880080e7          	jalr	-1920(ra) # 80005284 <mycpu>
    80006a0c:	faa91ce3          	bne	s2,a0,800069c4 <acquire+0x58>
    80006a10:	00002517          	auipc	a0,0x2
    80006a14:	bf850513          	addi	a0,a0,-1032 # 80008608 <digits+0x20>
    80006a18:	fffff097          	auipc	ra,0xfffff
    80006a1c:	224080e7          	jalr	548(ra) # 80005c3c <panic>
    80006a20:	00195913          	srli	s2,s2,0x1
    80006a24:	fffff097          	auipc	ra,0xfffff
    80006a28:	860080e7          	jalr	-1952(ra) # 80005284 <mycpu>
    80006a2c:	00197913          	andi	s2,s2,1
    80006a30:	07252e23          	sw	s2,124(a0)
    80006a34:	f75ff06f          	j	800069a8 <acquire+0x3c>

0000000080006a38 <release>:
    80006a38:	fe010113          	addi	sp,sp,-32
    80006a3c:	00813823          	sd	s0,16(sp)
    80006a40:	00113c23          	sd	ra,24(sp)
    80006a44:	00913423          	sd	s1,8(sp)
    80006a48:	01213023          	sd	s2,0(sp)
    80006a4c:	02010413          	addi	s0,sp,32
    80006a50:	00052783          	lw	a5,0(a0)
    80006a54:	00079a63          	bnez	a5,80006a68 <release+0x30>
    80006a58:	00002517          	auipc	a0,0x2
    80006a5c:	bb850513          	addi	a0,a0,-1096 # 80008610 <digits+0x28>
    80006a60:	fffff097          	auipc	ra,0xfffff
    80006a64:	1dc080e7          	jalr	476(ra) # 80005c3c <panic>
    80006a68:	01053903          	ld	s2,16(a0)
    80006a6c:	00050493          	mv	s1,a0
    80006a70:	fffff097          	auipc	ra,0xfffff
    80006a74:	814080e7          	jalr	-2028(ra) # 80005284 <mycpu>
    80006a78:	fea910e3          	bne	s2,a0,80006a58 <release+0x20>
    80006a7c:	0004b823          	sd	zero,16(s1)
    80006a80:	0ff0000f          	fence
    80006a84:	0f50000f          	fence	iorw,ow
    80006a88:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006a8c:	ffffe097          	auipc	ra,0xffffe
    80006a90:	7f8080e7          	jalr	2040(ra) # 80005284 <mycpu>
    80006a94:	100027f3          	csrr	a5,sstatus
    80006a98:	0027f793          	andi	a5,a5,2
    80006a9c:	04079a63          	bnez	a5,80006af0 <release+0xb8>
    80006aa0:	07852783          	lw	a5,120(a0)
    80006aa4:	02f05e63          	blez	a5,80006ae0 <release+0xa8>
    80006aa8:	fff7871b          	addiw	a4,a5,-1
    80006aac:	06e52c23          	sw	a4,120(a0)
    80006ab0:	00071c63          	bnez	a4,80006ac8 <release+0x90>
    80006ab4:	07c52783          	lw	a5,124(a0)
    80006ab8:	00078863          	beqz	a5,80006ac8 <release+0x90>
    80006abc:	100027f3          	csrr	a5,sstatus
    80006ac0:	0027e793          	ori	a5,a5,2
    80006ac4:	10079073          	csrw	sstatus,a5
    80006ac8:	01813083          	ld	ra,24(sp)
    80006acc:	01013403          	ld	s0,16(sp)
    80006ad0:	00813483          	ld	s1,8(sp)
    80006ad4:	00013903          	ld	s2,0(sp)
    80006ad8:	02010113          	addi	sp,sp,32
    80006adc:	00008067          	ret
    80006ae0:	00002517          	auipc	a0,0x2
    80006ae4:	b5050513          	addi	a0,a0,-1200 # 80008630 <digits+0x48>
    80006ae8:	fffff097          	auipc	ra,0xfffff
    80006aec:	154080e7          	jalr	340(ra) # 80005c3c <panic>
    80006af0:	00002517          	auipc	a0,0x2
    80006af4:	b2850513          	addi	a0,a0,-1240 # 80008618 <digits+0x30>
    80006af8:	fffff097          	auipc	ra,0xfffff
    80006afc:	144080e7          	jalr	324(ra) # 80005c3c <panic>

0000000080006b00 <holding>:
    80006b00:	00052783          	lw	a5,0(a0)
    80006b04:	00079663          	bnez	a5,80006b10 <holding+0x10>
    80006b08:	00000513          	li	a0,0
    80006b0c:	00008067          	ret
    80006b10:	fe010113          	addi	sp,sp,-32
    80006b14:	00813823          	sd	s0,16(sp)
    80006b18:	00913423          	sd	s1,8(sp)
    80006b1c:	00113c23          	sd	ra,24(sp)
    80006b20:	02010413          	addi	s0,sp,32
    80006b24:	01053483          	ld	s1,16(a0)
    80006b28:	ffffe097          	auipc	ra,0xffffe
    80006b2c:	75c080e7          	jalr	1884(ra) # 80005284 <mycpu>
    80006b30:	01813083          	ld	ra,24(sp)
    80006b34:	01013403          	ld	s0,16(sp)
    80006b38:	40a48533          	sub	a0,s1,a0
    80006b3c:	00153513          	seqz	a0,a0
    80006b40:	00813483          	ld	s1,8(sp)
    80006b44:	02010113          	addi	sp,sp,32
    80006b48:	00008067          	ret

0000000080006b4c <push_off>:
    80006b4c:	fe010113          	addi	sp,sp,-32
    80006b50:	00813823          	sd	s0,16(sp)
    80006b54:	00113c23          	sd	ra,24(sp)
    80006b58:	00913423          	sd	s1,8(sp)
    80006b5c:	02010413          	addi	s0,sp,32
    80006b60:	100024f3          	csrr	s1,sstatus
    80006b64:	100027f3          	csrr	a5,sstatus
    80006b68:	ffd7f793          	andi	a5,a5,-3
    80006b6c:	10079073          	csrw	sstatus,a5
    80006b70:	ffffe097          	auipc	ra,0xffffe
    80006b74:	714080e7          	jalr	1812(ra) # 80005284 <mycpu>
    80006b78:	07852783          	lw	a5,120(a0)
    80006b7c:	02078663          	beqz	a5,80006ba8 <push_off+0x5c>
    80006b80:	ffffe097          	auipc	ra,0xffffe
    80006b84:	704080e7          	jalr	1796(ra) # 80005284 <mycpu>
    80006b88:	07852783          	lw	a5,120(a0)
    80006b8c:	01813083          	ld	ra,24(sp)
    80006b90:	01013403          	ld	s0,16(sp)
    80006b94:	0017879b          	addiw	a5,a5,1
    80006b98:	06f52c23          	sw	a5,120(a0)
    80006b9c:	00813483          	ld	s1,8(sp)
    80006ba0:	02010113          	addi	sp,sp,32
    80006ba4:	00008067          	ret
    80006ba8:	0014d493          	srli	s1,s1,0x1
    80006bac:	ffffe097          	auipc	ra,0xffffe
    80006bb0:	6d8080e7          	jalr	1752(ra) # 80005284 <mycpu>
    80006bb4:	0014f493          	andi	s1,s1,1
    80006bb8:	06952e23          	sw	s1,124(a0)
    80006bbc:	fc5ff06f          	j	80006b80 <push_off+0x34>

0000000080006bc0 <pop_off>:
    80006bc0:	ff010113          	addi	sp,sp,-16
    80006bc4:	00813023          	sd	s0,0(sp)
    80006bc8:	00113423          	sd	ra,8(sp)
    80006bcc:	01010413          	addi	s0,sp,16
    80006bd0:	ffffe097          	auipc	ra,0xffffe
    80006bd4:	6b4080e7          	jalr	1716(ra) # 80005284 <mycpu>
    80006bd8:	100027f3          	csrr	a5,sstatus
    80006bdc:	0027f793          	andi	a5,a5,2
    80006be0:	04079663          	bnez	a5,80006c2c <pop_off+0x6c>
    80006be4:	07852783          	lw	a5,120(a0)
    80006be8:	02f05a63          	blez	a5,80006c1c <pop_off+0x5c>
    80006bec:	fff7871b          	addiw	a4,a5,-1
    80006bf0:	06e52c23          	sw	a4,120(a0)
    80006bf4:	00071c63          	bnez	a4,80006c0c <pop_off+0x4c>
    80006bf8:	07c52783          	lw	a5,124(a0)
    80006bfc:	00078863          	beqz	a5,80006c0c <pop_off+0x4c>
    80006c00:	100027f3          	csrr	a5,sstatus
    80006c04:	0027e793          	ori	a5,a5,2
    80006c08:	10079073          	csrw	sstatus,a5
    80006c0c:	00813083          	ld	ra,8(sp)
    80006c10:	00013403          	ld	s0,0(sp)
    80006c14:	01010113          	addi	sp,sp,16
    80006c18:	00008067          	ret
    80006c1c:	00002517          	auipc	a0,0x2
    80006c20:	a1450513          	addi	a0,a0,-1516 # 80008630 <digits+0x48>
    80006c24:	fffff097          	auipc	ra,0xfffff
    80006c28:	018080e7          	jalr	24(ra) # 80005c3c <panic>
    80006c2c:	00002517          	auipc	a0,0x2
    80006c30:	9ec50513          	addi	a0,a0,-1556 # 80008618 <digits+0x30>
    80006c34:	fffff097          	auipc	ra,0xfffff
    80006c38:	008080e7          	jalr	8(ra) # 80005c3c <panic>

0000000080006c3c <push_on>:
    80006c3c:	fe010113          	addi	sp,sp,-32
    80006c40:	00813823          	sd	s0,16(sp)
    80006c44:	00113c23          	sd	ra,24(sp)
    80006c48:	00913423          	sd	s1,8(sp)
    80006c4c:	02010413          	addi	s0,sp,32
    80006c50:	100024f3          	csrr	s1,sstatus
    80006c54:	100027f3          	csrr	a5,sstatus
    80006c58:	0027e793          	ori	a5,a5,2
    80006c5c:	10079073          	csrw	sstatus,a5
    80006c60:	ffffe097          	auipc	ra,0xffffe
    80006c64:	624080e7          	jalr	1572(ra) # 80005284 <mycpu>
    80006c68:	07852783          	lw	a5,120(a0)
    80006c6c:	02078663          	beqz	a5,80006c98 <push_on+0x5c>
    80006c70:	ffffe097          	auipc	ra,0xffffe
    80006c74:	614080e7          	jalr	1556(ra) # 80005284 <mycpu>
    80006c78:	07852783          	lw	a5,120(a0)
    80006c7c:	01813083          	ld	ra,24(sp)
    80006c80:	01013403          	ld	s0,16(sp)
    80006c84:	0017879b          	addiw	a5,a5,1
    80006c88:	06f52c23          	sw	a5,120(a0)
    80006c8c:	00813483          	ld	s1,8(sp)
    80006c90:	02010113          	addi	sp,sp,32
    80006c94:	00008067          	ret
    80006c98:	0014d493          	srli	s1,s1,0x1
    80006c9c:	ffffe097          	auipc	ra,0xffffe
    80006ca0:	5e8080e7          	jalr	1512(ra) # 80005284 <mycpu>
    80006ca4:	0014f493          	andi	s1,s1,1
    80006ca8:	06952e23          	sw	s1,124(a0)
    80006cac:	fc5ff06f          	j	80006c70 <push_on+0x34>

0000000080006cb0 <pop_on>:
    80006cb0:	ff010113          	addi	sp,sp,-16
    80006cb4:	00813023          	sd	s0,0(sp)
    80006cb8:	00113423          	sd	ra,8(sp)
    80006cbc:	01010413          	addi	s0,sp,16
    80006cc0:	ffffe097          	auipc	ra,0xffffe
    80006cc4:	5c4080e7          	jalr	1476(ra) # 80005284 <mycpu>
    80006cc8:	100027f3          	csrr	a5,sstatus
    80006ccc:	0027f793          	andi	a5,a5,2
    80006cd0:	04078463          	beqz	a5,80006d18 <pop_on+0x68>
    80006cd4:	07852783          	lw	a5,120(a0)
    80006cd8:	02f05863          	blez	a5,80006d08 <pop_on+0x58>
    80006cdc:	fff7879b          	addiw	a5,a5,-1
    80006ce0:	06f52c23          	sw	a5,120(a0)
    80006ce4:	07853783          	ld	a5,120(a0)
    80006ce8:	00079863          	bnez	a5,80006cf8 <pop_on+0x48>
    80006cec:	100027f3          	csrr	a5,sstatus
    80006cf0:	ffd7f793          	andi	a5,a5,-3
    80006cf4:	10079073          	csrw	sstatus,a5
    80006cf8:	00813083          	ld	ra,8(sp)
    80006cfc:	00013403          	ld	s0,0(sp)
    80006d00:	01010113          	addi	sp,sp,16
    80006d04:	00008067          	ret
    80006d08:	00002517          	auipc	a0,0x2
    80006d0c:	95050513          	addi	a0,a0,-1712 # 80008658 <digits+0x70>
    80006d10:	fffff097          	auipc	ra,0xfffff
    80006d14:	f2c080e7          	jalr	-212(ra) # 80005c3c <panic>
    80006d18:	00002517          	auipc	a0,0x2
    80006d1c:	92050513          	addi	a0,a0,-1760 # 80008638 <digits+0x50>
    80006d20:	fffff097          	auipc	ra,0xfffff
    80006d24:	f1c080e7          	jalr	-228(ra) # 80005c3c <panic>

0000000080006d28 <__memset>:
    80006d28:	ff010113          	addi	sp,sp,-16
    80006d2c:	00813423          	sd	s0,8(sp)
    80006d30:	01010413          	addi	s0,sp,16
    80006d34:	1a060e63          	beqz	a2,80006ef0 <__memset+0x1c8>
    80006d38:	40a007b3          	neg	a5,a0
    80006d3c:	0077f793          	andi	a5,a5,7
    80006d40:	00778693          	addi	a3,a5,7
    80006d44:	00b00813          	li	a6,11
    80006d48:	0ff5f593          	andi	a1,a1,255
    80006d4c:	fff6071b          	addiw	a4,a2,-1
    80006d50:	1b06e663          	bltu	a3,a6,80006efc <__memset+0x1d4>
    80006d54:	1cd76463          	bltu	a4,a3,80006f1c <__memset+0x1f4>
    80006d58:	1a078e63          	beqz	a5,80006f14 <__memset+0x1ec>
    80006d5c:	00b50023          	sb	a1,0(a0)
    80006d60:	00100713          	li	a4,1
    80006d64:	1ae78463          	beq	a5,a4,80006f0c <__memset+0x1e4>
    80006d68:	00b500a3          	sb	a1,1(a0)
    80006d6c:	00200713          	li	a4,2
    80006d70:	1ae78a63          	beq	a5,a4,80006f24 <__memset+0x1fc>
    80006d74:	00b50123          	sb	a1,2(a0)
    80006d78:	00300713          	li	a4,3
    80006d7c:	18e78463          	beq	a5,a4,80006f04 <__memset+0x1dc>
    80006d80:	00b501a3          	sb	a1,3(a0)
    80006d84:	00400713          	li	a4,4
    80006d88:	1ae78263          	beq	a5,a4,80006f2c <__memset+0x204>
    80006d8c:	00b50223          	sb	a1,4(a0)
    80006d90:	00500713          	li	a4,5
    80006d94:	1ae78063          	beq	a5,a4,80006f34 <__memset+0x20c>
    80006d98:	00b502a3          	sb	a1,5(a0)
    80006d9c:	00700713          	li	a4,7
    80006da0:	18e79e63          	bne	a5,a4,80006f3c <__memset+0x214>
    80006da4:	00b50323          	sb	a1,6(a0)
    80006da8:	00700e93          	li	t4,7
    80006dac:	00859713          	slli	a4,a1,0x8
    80006db0:	00e5e733          	or	a4,a1,a4
    80006db4:	01059e13          	slli	t3,a1,0x10
    80006db8:	01c76e33          	or	t3,a4,t3
    80006dbc:	01859313          	slli	t1,a1,0x18
    80006dc0:	006e6333          	or	t1,t3,t1
    80006dc4:	02059893          	slli	a7,a1,0x20
    80006dc8:	40f60e3b          	subw	t3,a2,a5
    80006dcc:	011368b3          	or	a7,t1,a7
    80006dd0:	02859813          	slli	a6,a1,0x28
    80006dd4:	0108e833          	or	a6,a7,a6
    80006dd8:	03059693          	slli	a3,a1,0x30
    80006ddc:	003e589b          	srliw	a7,t3,0x3
    80006de0:	00d866b3          	or	a3,a6,a3
    80006de4:	03859713          	slli	a4,a1,0x38
    80006de8:	00389813          	slli	a6,a7,0x3
    80006dec:	00f507b3          	add	a5,a0,a5
    80006df0:	00e6e733          	or	a4,a3,a4
    80006df4:	000e089b          	sext.w	a7,t3
    80006df8:	00f806b3          	add	a3,a6,a5
    80006dfc:	00e7b023          	sd	a4,0(a5)
    80006e00:	00878793          	addi	a5,a5,8
    80006e04:	fed79ce3          	bne	a5,a3,80006dfc <__memset+0xd4>
    80006e08:	ff8e7793          	andi	a5,t3,-8
    80006e0c:	0007871b          	sext.w	a4,a5
    80006e10:	01d787bb          	addw	a5,a5,t4
    80006e14:	0ce88e63          	beq	a7,a4,80006ef0 <__memset+0x1c8>
    80006e18:	00f50733          	add	a4,a0,a5
    80006e1c:	00b70023          	sb	a1,0(a4)
    80006e20:	0017871b          	addiw	a4,a5,1
    80006e24:	0cc77663          	bgeu	a4,a2,80006ef0 <__memset+0x1c8>
    80006e28:	00e50733          	add	a4,a0,a4
    80006e2c:	00b70023          	sb	a1,0(a4)
    80006e30:	0027871b          	addiw	a4,a5,2
    80006e34:	0ac77e63          	bgeu	a4,a2,80006ef0 <__memset+0x1c8>
    80006e38:	00e50733          	add	a4,a0,a4
    80006e3c:	00b70023          	sb	a1,0(a4)
    80006e40:	0037871b          	addiw	a4,a5,3
    80006e44:	0ac77663          	bgeu	a4,a2,80006ef0 <__memset+0x1c8>
    80006e48:	00e50733          	add	a4,a0,a4
    80006e4c:	00b70023          	sb	a1,0(a4)
    80006e50:	0047871b          	addiw	a4,a5,4
    80006e54:	08c77e63          	bgeu	a4,a2,80006ef0 <__memset+0x1c8>
    80006e58:	00e50733          	add	a4,a0,a4
    80006e5c:	00b70023          	sb	a1,0(a4)
    80006e60:	0057871b          	addiw	a4,a5,5
    80006e64:	08c77663          	bgeu	a4,a2,80006ef0 <__memset+0x1c8>
    80006e68:	00e50733          	add	a4,a0,a4
    80006e6c:	00b70023          	sb	a1,0(a4)
    80006e70:	0067871b          	addiw	a4,a5,6
    80006e74:	06c77e63          	bgeu	a4,a2,80006ef0 <__memset+0x1c8>
    80006e78:	00e50733          	add	a4,a0,a4
    80006e7c:	00b70023          	sb	a1,0(a4)
    80006e80:	0077871b          	addiw	a4,a5,7
    80006e84:	06c77663          	bgeu	a4,a2,80006ef0 <__memset+0x1c8>
    80006e88:	00e50733          	add	a4,a0,a4
    80006e8c:	00b70023          	sb	a1,0(a4)
    80006e90:	0087871b          	addiw	a4,a5,8
    80006e94:	04c77e63          	bgeu	a4,a2,80006ef0 <__memset+0x1c8>
    80006e98:	00e50733          	add	a4,a0,a4
    80006e9c:	00b70023          	sb	a1,0(a4)
    80006ea0:	0097871b          	addiw	a4,a5,9
    80006ea4:	04c77663          	bgeu	a4,a2,80006ef0 <__memset+0x1c8>
    80006ea8:	00e50733          	add	a4,a0,a4
    80006eac:	00b70023          	sb	a1,0(a4)
    80006eb0:	00a7871b          	addiw	a4,a5,10
    80006eb4:	02c77e63          	bgeu	a4,a2,80006ef0 <__memset+0x1c8>
    80006eb8:	00e50733          	add	a4,a0,a4
    80006ebc:	00b70023          	sb	a1,0(a4)
    80006ec0:	00b7871b          	addiw	a4,a5,11
    80006ec4:	02c77663          	bgeu	a4,a2,80006ef0 <__memset+0x1c8>
    80006ec8:	00e50733          	add	a4,a0,a4
    80006ecc:	00b70023          	sb	a1,0(a4)
    80006ed0:	00c7871b          	addiw	a4,a5,12
    80006ed4:	00c77e63          	bgeu	a4,a2,80006ef0 <__memset+0x1c8>
    80006ed8:	00e50733          	add	a4,a0,a4
    80006edc:	00b70023          	sb	a1,0(a4)
    80006ee0:	00d7879b          	addiw	a5,a5,13
    80006ee4:	00c7f663          	bgeu	a5,a2,80006ef0 <__memset+0x1c8>
    80006ee8:	00f507b3          	add	a5,a0,a5
    80006eec:	00b78023          	sb	a1,0(a5)
    80006ef0:	00813403          	ld	s0,8(sp)
    80006ef4:	01010113          	addi	sp,sp,16
    80006ef8:	00008067          	ret
    80006efc:	00b00693          	li	a3,11
    80006f00:	e55ff06f          	j	80006d54 <__memset+0x2c>
    80006f04:	00300e93          	li	t4,3
    80006f08:	ea5ff06f          	j	80006dac <__memset+0x84>
    80006f0c:	00100e93          	li	t4,1
    80006f10:	e9dff06f          	j	80006dac <__memset+0x84>
    80006f14:	00000e93          	li	t4,0
    80006f18:	e95ff06f          	j	80006dac <__memset+0x84>
    80006f1c:	00000793          	li	a5,0
    80006f20:	ef9ff06f          	j	80006e18 <__memset+0xf0>
    80006f24:	00200e93          	li	t4,2
    80006f28:	e85ff06f          	j	80006dac <__memset+0x84>
    80006f2c:	00400e93          	li	t4,4
    80006f30:	e7dff06f          	j	80006dac <__memset+0x84>
    80006f34:	00500e93          	li	t4,5
    80006f38:	e75ff06f          	j	80006dac <__memset+0x84>
    80006f3c:	00600e93          	li	t4,6
    80006f40:	e6dff06f          	j	80006dac <__memset+0x84>

0000000080006f44 <__memmove>:
    80006f44:	ff010113          	addi	sp,sp,-16
    80006f48:	00813423          	sd	s0,8(sp)
    80006f4c:	01010413          	addi	s0,sp,16
    80006f50:	0e060863          	beqz	a2,80007040 <__memmove+0xfc>
    80006f54:	fff6069b          	addiw	a3,a2,-1
    80006f58:	0006881b          	sext.w	a6,a3
    80006f5c:	0ea5e863          	bltu	a1,a0,8000704c <__memmove+0x108>
    80006f60:	00758713          	addi	a4,a1,7
    80006f64:	00a5e7b3          	or	a5,a1,a0
    80006f68:	40a70733          	sub	a4,a4,a0
    80006f6c:	0077f793          	andi	a5,a5,7
    80006f70:	00f73713          	sltiu	a4,a4,15
    80006f74:	00174713          	xori	a4,a4,1
    80006f78:	0017b793          	seqz	a5,a5
    80006f7c:	00e7f7b3          	and	a5,a5,a4
    80006f80:	10078863          	beqz	a5,80007090 <__memmove+0x14c>
    80006f84:	00900793          	li	a5,9
    80006f88:	1107f463          	bgeu	a5,a6,80007090 <__memmove+0x14c>
    80006f8c:	0036581b          	srliw	a6,a2,0x3
    80006f90:	fff8081b          	addiw	a6,a6,-1
    80006f94:	02081813          	slli	a6,a6,0x20
    80006f98:	01d85893          	srli	a7,a6,0x1d
    80006f9c:	00858813          	addi	a6,a1,8
    80006fa0:	00058793          	mv	a5,a1
    80006fa4:	00050713          	mv	a4,a0
    80006fa8:	01088833          	add	a6,a7,a6
    80006fac:	0007b883          	ld	a7,0(a5)
    80006fb0:	00878793          	addi	a5,a5,8
    80006fb4:	00870713          	addi	a4,a4,8
    80006fb8:	ff173c23          	sd	a7,-8(a4)
    80006fbc:	ff0798e3          	bne	a5,a6,80006fac <__memmove+0x68>
    80006fc0:	ff867713          	andi	a4,a2,-8
    80006fc4:	02071793          	slli	a5,a4,0x20
    80006fc8:	0207d793          	srli	a5,a5,0x20
    80006fcc:	00f585b3          	add	a1,a1,a5
    80006fd0:	40e686bb          	subw	a3,a3,a4
    80006fd4:	00f507b3          	add	a5,a0,a5
    80006fd8:	06e60463          	beq	a2,a4,80007040 <__memmove+0xfc>
    80006fdc:	0005c703          	lbu	a4,0(a1)
    80006fe0:	00e78023          	sb	a4,0(a5)
    80006fe4:	04068e63          	beqz	a3,80007040 <__memmove+0xfc>
    80006fe8:	0015c603          	lbu	a2,1(a1)
    80006fec:	00100713          	li	a4,1
    80006ff0:	00c780a3          	sb	a2,1(a5)
    80006ff4:	04e68663          	beq	a3,a4,80007040 <__memmove+0xfc>
    80006ff8:	0025c603          	lbu	a2,2(a1)
    80006ffc:	00200713          	li	a4,2
    80007000:	00c78123          	sb	a2,2(a5)
    80007004:	02e68e63          	beq	a3,a4,80007040 <__memmove+0xfc>
    80007008:	0035c603          	lbu	a2,3(a1)
    8000700c:	00300713          	li	a4,3
    80007010:	00c781a3          	sb	a2,3(a5)
    80007014:	02e68663          	beq	a3,a4,80007040 <__memmove+0xfc>
    80007018:	0045c603          	lbu	a2,4(a1)
    8000701c:	00400713          	li	a4,4
    80007020:	00c78223          	sb	a2,4(a5)
    80007024:	00e68e63          	beq	a3,a4,80007040 <__memmove+0xfc>
    80007028:	0055c603          	lbu	a2,5(a1)
    8000702c:	00500713          	li	a4,5
    80007030:	00c782a3          	sb	a2,5(a5)
    80007034:	00e68663          	beq	a3,a4,80007040 <__memmove+0xfc>
    80007038:	0065c703          	lbu	a4,6(a1)
    8000703c:	00e78323          	sb	a4,6(a5)
    80007040:	00813403          	ld	s0,8(sp)
    80007044:	01010113          	addi	sp,sp,16
    80007048:	00008067          	ret
    8000704c:	02061713          	slli	a4,a2,0x20
    80007050:	02075713          	srli	a4,a4,0x20
    80007054:	00e587b3          	add	a5,a1,a4
    80007058:	f0f574e3          	bgeu	a0,a5,80006f60 <__memmove+0x1c>
    8000705c:	02069613          	slli	a2,a3,0x20
    80007060:	02065613          	srli	a2,a2,0x20
    80007064:	fff64613          	not	a2,a2
    80007068:	00e50733          	add	a4,a0,a4
    8000706c:	00c78633          	add	a2,a5,a2
    80007070:	fff7c683          	lbu	a3,-1(a5)
    80007074:	fff78793          	addi	a5,a5,-1
    80007078:	fff70713          	addi	a4,a4,-1
    8000707c:	00d70023          	sb	a3,0(a4)
    80007080:	fec798e3          	bne	a5,a2,80007070 <__memmove+0x12c>
    80007084:	00813403          	ld	s0,8(sp)
    80007088:	01010113          	addi	sp,sp,16
    8000708c:	00008067          	ret
    80007090:	02069713          	slli	a4,a3,0x20
    80007094:	02075713          	srli	a4,a4,0x20
    80007098:	00170713          	addi	a4,a4,1
    8000709c:	00e50733          	add	a4,a0,a4
    800070a0:	00050793          	mv	a5,a0
    800070a4:	0005c683          	lbu	a3,0(a1)
    800070a8:	00178793          	addi	a5,a5,1
    800070ac:	00158593          	addi	a1,a1,1
    800070b0:	fed78fa3          	sb	a3,-1(a5)
    800070b4:	fee798e3          	bne	a5,a4,800070a4 <__memmove+0x160>
    800070b8:	f89ff06f          	j	80007040 <__memmove+0xfc>
	...
