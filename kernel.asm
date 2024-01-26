
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00008117          	auipc	sp,0x8
    80000004:	25013103          	ld	sp,592(sp) # 80008250 <_GLOBAL_OFFSET_TABLE_+0x38>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	648040ef          	jal	ra,80004664 <start>

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
    8000107c:	345020ef          	jal	ra,80003bc0 <exceptionHandler>


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
    80001118:	00007797          	auipc	a5,0x7
    8000111c:	1a87b783          	ld	a5,424(a5) # 800082c0 <_ZN5Timer8instanceE>
    80001120:	02079463          	bnez	a5,80001148 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80001124:	00007797          	auipc	a5,0x7
    80001128:	1897be23          	sd	s1,412(a5) # 800082c0 <_ZN5Timer8instanceE>
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
    80001148:	00006697          	auipc	a3,0x6
    8000114c:	ed868693          	addi	a3,a3,-296 # 80007020 <CONSOLE_STATUS+0x10>
    80001150:	01400613          	li	a2,20
    80001154:	00006597          	auipc	a1,0x6
    80001158:	edc58593          	addi	a1,a1,-292 # 80007030 <CONSOLE_STATUS+0x20>
    8000115c:	00006517          	auipc	a0,0x6
    80001160:	ee450513          	addi	a0,a0,-284 # 80007040 <CONSOLE_STATUS+0x30>
    80001164:	00001097          	auipc	ra,0x1
    80001168:	9bc080e7          	jalr	-1604(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
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
    80001194:	230080e7          	jalr	560(ra) # 800013c0 <_Z8mem_freePv>
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
    800011b8:	00007797          	auipc	a5,0x7
    800011bc:	1087b783          	ld	a5,264(a5) # 800082c0 <_ZN5Timer8instanceE>
    800011c0:	00078863          	beqz	a5,800011d0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800011c4:	00007517          	auipc	a0,0x7
    800011c8:	0fc53503          	ld	a0,252(a0) # 800082c0 <_ZN5Timer8instanceE>
    800011cc:	00008067          	ret
Timer& Timer::getInstance(){
    800011d0:	ff010113          	addi	sp,sp,-16
    800011d4:	00113423          	sd	ra,8(sp)
    800011d8:	00813023          	sd	s0,0(sp)
    800011dc:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    800011e0:	00006697          	auipc	a3,0x6
    800011e4:	e7068693          	addi	a3,a3,-400 # 80007050 <CONSOLE_STATUS+0x40>
    800011e8:	02400613          	li	a2,36
    800011ec:	00006597          	auipc	a1,0x6
    800011f0:	e4458593          	addi	a1,a1,-444 # 80007030 <CONSOLE_STATUS+0x20>
    800011f4:	00006517          	auipc	a0,0x6
    800011f8:	e8450513          	addi	a0,a0,-380 # 80007078 <CONSOLE_STATUS+0x68>
    800011fc:	00001097          	auipc	ra,0x1
    80001200:	924080e7          	jalr	-1756(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
}
    80001204:	00007517          	auipc	a0,0x7
    80001208:	0bc53503          	ld	a0,188(a0) # 800082c0 <_ZN5Timer8instanceE>
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
    8000125c:	168080e7          	jalr	360(ra) # 800013c0 <_Z8mem_freePv>
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
    80001280:	e64080e7          	jalr	-412(ra) # 800030e0 <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    80001284:	0004b503          	ld	a0,0(s1)
    80001288:	00003097          	auipc	ra,0x3
    8000128c:	048080e7          	jalr	72(ra) # 800042d0 <_ZN9Scheduler3putEP7_thread>
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
    800012e0:	00007797          	auipc	a5,0x7
    800012e4:	f907b783          	ld	a5,-112(a5) # 80008270 <_GLOBAL_OFFSET_TABLE_+0x58>
    800012e8:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)mem_alloc(sizeof(threadSleepWrapper));
    800012ec:	01800513          	li	a0,24
    800012f0:	00000097          	auipc	ra,0x0
    800012f4:	0a0080e7          	jalr	160(ra) # 80001390 <_Z9mem_allocm>
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
    8000133c:	da8080e7          	jalr	-600(ra) # 800030e0 <_ZN7_thread11setSleepingEb>
    thread_dispatch();
    80001340:	00000097          	auipc	ra,0x0
    80001344:	148080e7          	jalr	328(ra) # 80001488 <_Z15thread_dispatchv>
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
    80001380:	00153513          	seqz	a0,a0
    80001384:	00813403          	ld	s0,8(sp)
    80001388:	01010113          	addi	sp,sp,16
    8000138c:	00008067          	ret

0000000080001390 <_Z9mem_allocm>:
 */

#include "syscalls_c.h"
#include "console.h"

void* mem_alloc ( size_t nSize ){
    80001390:	ff010113          	addi	sp,sp,-16
    80001394:	00813423          	sd	s0,8(sp)
    80001398:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    8000139c:	03f50513          	addi	a0,a0,63
    800013a0:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    800013a4:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    800013a8:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    800013ac:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    800013b0:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    800013b4:	00813403          	ld	s0,8(sp)
    800013b8:	01010113          	addi	sp,sp,16
    800013bc:	00008067          	ret

00000000800013c0 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    800013c0:	ff010113          	addi	sp,sp,-16
    800013c4:	00813423          	sd	s0,8(sp)
    800013c8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    800013cc:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    800013d0:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    800013d4:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    800013d8:	00050513          	mv	a0,a0
    return nResult;

}
    800013dc:	0005051b          	sext.w	a0,a0
    800013e0:	00813403          	ld	s0,8(sp)
    800013e4:	01010113          	addi	sp,sp,16
    800013e8:	00008067          	ret

00000000800013ec <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg ) {
    800013ec:	fd010113          	addi	sp,sp,-48
    800013f0:	02113423          	sd	ra,40(sp)
    800013f4:	02813023          	sd	s0,32(sp)
    800013f8:	00913c23          	sd	s1,24(sp)
    800013fc:	01213823          	sd	s2,16(sp)
    80001400:	01313423          	sd	s3,8(sp)
    80001404:	03010413          	addi	s0,sp,48
    80001408:	00050493          	mv	s1,a0
    8000140c:	00058913          	mv	s2,a1
    80001410:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80001414:	00001537          	lui	a0,0x1
    80001418:	00000097          	auipc	ra,0x0
    8000141c:	f78080e7          	jalr	-136(ra) # 80001390 <_Z9mem_allocm>
    /// now we move the pointer up, since SP points to the first free location, and grows down
    __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space + DEFAULT_STACK_SIZE));
    80001420:	000017b7          	lui	a5,0x1
    80001424:	00f50533          	add	a0,a0,a5
    80001428:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    8000142c:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    80001430:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    80001434:	00048593          	mv	a1,s1
    __asm__ volatile("li a0,0x11");
    80001438:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    8000143c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001440:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001444:	0005051b          	sext.w	a0,a0
    80001448:	02813083          	ld	ra,40(sp)
    8000144c:	02013403          	ld	s0,32(sp)
    80001450:	01813483          	ld	s1,24(sp)
    80001454:	01013903          	ld	s2,16(sp)
    80001458:	00813983          	ld	s3,8(sp)
    8000145c:	03010113          	addi	sp,sp,48
    80001460:	00008067          	ret

0000000080001464 <_Z11thread_exitv>:

// int thread_createCPP ( thread_t*, void(*)(void*), void* );

int thread_exit (){
    80001464:	ff010113          	addi	sp,sp,-16
    80001468:	00813423          	sd	s0,8(sp)
    8000146c:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    80001470:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80001474:	00000073          	ecall
    return 0;
}
    80001478:	00000513          	li	a0,0
    8000147c:	00813403          	ld	s0,8(sp)
    80001480:	01010113          	addi	sp,sp,16
    80001484:	00008067          	ret

0000000080001488 <_Z15thread_dispatchv>:

void thread_dispatch () {
    80001488:	ff010113          	addi	sp,sp,-16
    8000148c:	00813423          	sd	s0,8(sp)
    80001490:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    80001494:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    80001498:	00000073          	ecall
}
    8000149c:	00813403          	ld	s0,8(sp)
    800014a0:	01010113          	addi	sp,sp,16
    800014a4:	00008067          	ret

00000000800014a8 <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    800014a8:	ff010113          	addi	sp,sp,-16
    800014ac:	00813423          	sd	s0,8(sp)
    800014b0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    800014b4:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    800014b8:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    800014bc:	00000073          	ecall
}
    800014c0:	00813403          	ld	s0,8(sp)
    800014c4:	01010113          	addi	sp,sp,16
    800014c8:	00008067          	ret

00000000800014cc <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    800014cc:	ff010113          	addi	sp,sp,-16
    800014d0:	00813423          	sd	s0,8(sp)
    800014d4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    800014d8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    800014dc:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    800014e0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    800014e4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800014e8:	0005051b          	sext.w	a0,a0
    800014ec:	00813403          	ld	s0,8(sp)
    800014f0:	01010113          	addi	sp,sp,16
    800014f4:	00008067          	ret

00000000800014f8 <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    800014f8:	ff010113          	addi	sp,sp,-16
    800014fc:	00813423          	sd	s0,8(sp)
    80001500:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    80001504:	02059593          	slli	a1,a1,0x20
    80001508:	0205d593          	srli	a1,a1,0x20
    8000150c:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    80001510:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    80001514:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    80001518:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    8000151c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001520:	0005051b          	sext.w	a0,a0
    80001524:	00813403          	ld	s0,8(sp)
    80001528:	01010113          	addi	sp,sp,16
    8000152c:	00008067          	ret

0000000080001530 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    80001530:	ff010113          	addi	sp,sp,-16
    80001534:	00813423          	sd	s0,8(sp)
    80001538:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    8000153c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    80001540:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    80001544:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001548:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    8000154c:	0005051b          	sext.w	a0,a0
    80001550:	00813403          	ld	s0,8(sp)
    80001554:	01010113          	addi	sp,sp,16
    80001558:	00008067          	ret

000000008000155c <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    8000155c:	ff010113          	addi	sp,sp,-16
    80001560:	00813423          	sd	s0,8(sp)
    80001564:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001568:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    8000156c:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001570:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001574:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001578:	0005051b          	sext.w	a0,a0
    8000157c:	00813403          	ld	s0,8(sp)
    80001580:	01010113          	addi	sp,sp,16
    80001584:	00008067          	ret

0000000080001588 <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    80001588:	ff010113          	addi	sp,sp,-16
    8000158c:	00813423          	sd	s0,8(sp)
    80001590:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001594:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    80001598:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    8000159c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800015a0:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800015a4:	0005051b          	sext.w	a0,a0
    800015a8:	00813403          	ld	s0,8(sp)
    800015ac:	01010113          	addi	sp,sp,16
    800015b0:	00008067          	ret

00000000800015b4 <_Z4getcv>:

char getc() {
    800015b4:	ff010113          	addi	sp,sp,-16
    800015b8:	00813423          	sd	s0,8(sp)
    800015bc:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    800015c0:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    800015c4:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    800015c8:	00050513          	mv	a0,a0
    return chr;
}
    800015cc:	0ff57513          	andi	a0,a0,255
    800015d0:	00813403          	ld	s0,8(sp)
    800015d4:	01010113          	addi	sp,sp,16
    800015d8:	00008067          	ret

00000000800015dc <_Z4putcc>:

#include "console.h"

void putc(char chr ) {
    800015dc:	ff010113          	addi	sp,sp,-16
    800015e0:	00813423          	sd	s0,8(sp)
    800015e4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    800015e8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    800015ec:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    800015f0:	00000073          	ecall
    800015f4:	00813403          	ld	s0,8(sp)
    800015f8:	01010113          	addi	sp,sp,16
    800015fc:	00008067          	ret

0000000080001600 <_ZN4_sem4openEPPS_j>:
#include "syscalls_c.h"
#include "assert.h"
#include "sched.h"
#include "console.h"

void _sem::open(_sem** handle, unsigned init){
    80001600:	fe010113          	addi	sp,sp,-32
    80001604:	00113c23          	sd	ra,24(sp)
    80001608:	00813823          	sd	s0,16(sp)
    8000160c:	00913423          	sd	s1,8(sp)
    80001610:	01213023          	sd	s2,0(sp)
    80001614:	02010413          	addi	s0,sp,32
    80001618:	00050493          	mv	s1,a0
    8000161c:	00058913          	mv	s2,a1
    (*handle) = (sem_t)mem_alloc(sizeof(_sem));
    80001620:	01800513          	li	a0,24
    80001624:	00000097          	auipc	ra,0x0
    80001628:	d6c080e7          	jalr	-660(ra) # 80001390 <_Z9mem_allocm>
    8000162c:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    80001630:	00053023          	sd	zero,0(a0) # 1000 <_entry-0x7ffff000>
    (*handle)->blockTail = 0;
    80001634:	0004b783          	ld	a5,0(s1)
    80001638:	0007b423          	sd	zero,8(a5) # 1008 <_entry-0x7fffeff8>
    (*handle)->value = init;
    8000163c:	0004b783          	ld	a5,0(s1)
    80001640:	0127a823          	sw	s2,16(a5)
}
    80001644:	01813083          	ld	ra,24(sp)
    80001648:	01013403          	ld	s0,16(sp)
    8000164c:	00813483          	ld	s1,8(sp)
    80001650:	00013903          	ld	s2,0(sp)
    80001654:	02010113          	addi	sp,sp,32
    80001658:	00008067          	ret

000000008000165c <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    8000165c:	fe010113          	addi	sp,sp,-32
    80001660:	00113c23          	sd	ra,24(sp)
    80001664:	00813823          	sd	s0,16(sp)
    80001668:	00913423          	sd	s1,8(sp)
    8000166c:	02010413          	addi	s0,sp,32
    80001670:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    80001674:	0004b783          	ld	a5,0(s1)
    80001678:	02078863          	beqz	a5,800016a8 <_ZN4_sem5closeEPS_+0x4c>
        id->blockHead->pThread->setClosed(true);
    8000167c:	00100593          	li	a1,1
    80001680:	0007b503          	ld	a0,0(a5)
    80001684:	00002097          	auipc	ra,0x2
    80001688:	a30080e7          	jalr	-1488(ra) # 800030b4 <_ZN7_thread9setClosedEb>
        mem_free(id->blockHead);
    8000168c:	0004b503          	ld	a0,0(s1)
    80001690:	00000097          	auipc	ra,0x0
    80001694:	d30080e7          	jalr	-720(ra) # 800013c0 <_Z8mem_freePv>
        id->blockHead = id->blockHead->pNext;
    80001698:	0004b783          	ld	a5,0(s1)
    8000169c:	0087b783          	ld	a5,8(a5)
    800016a0:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    800016a4:	fd1ff06f          	j	80001674 <_ZN4_sem5closeEPS_+0x18>
    }
}
    800016a8:	01813083          	ld	ra,24(sp)
    800016ac:	01013403          	ld	s0,16(sp)
    800016b0:	00813483          	ld	s1,8(sp)
    800016b4:	02010113          	addi	sp,sp,32
    800016b8:	00008067          	ret

00000000800016bc <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    800016bc:	01052783          	lw	a5,16(a0)
    800016c0:	fff7879b          	addiw	a5,a5,-1
    800016c4:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    800016c8:	02079713          	slli	a4,a5,0x20
    800016cc:	00074463          	bltz	a4,800016d4 <_ZN4_sem4waitEPS_+0x18>
    800016d0:	00008067          	ret
void _sem::wait(sem_t id){
    800016d4:	fe010113          	addi	sp,sp,-32
    800016d8:	00113c23          	sd	ra,24(sp)
    800016dc:	00813823          	sd	s0,16(sp)
    800016e0:	00913423          	sd	s1,8(sp)
    800016e4:	02010413          	addi	s0,sp,32
    800016e8:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    800016ec:	01000513          	li	a0,16
    800016f0:	00000097          	auipc	ra,0x0
    800016f4:	ca0080e7          	jalr	-864(ra) # 80001390 <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    800016f8:	00007797          	auipc	a5,0x7
    800016fc:	b787b783          	ld	a5,-1160(a5) # 80008270 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001700:	0007b783          	ld	a5,0(a5)
    80001704:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    80001708:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    8000170c:	0004b783          	ld	a5,0(s1)
    80001710:	04078263          	beqz	a5,80001754 <_ZN4_sem4waitEPS_+0x98>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    80001714:	0084b783          	ld	a5,8(s1)
    80001718:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    8000171c:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    80001720:	00100593          	li	a1,1
    80001724:	00007797          	auipc	a5,0x7
    80001728:	b4c7b783          	ld	a5,-1204(a5) # 80008270 <_GLOBAL_OFFSET_TABLE_+0x58>
    8000172c:	0007b503          	ld	a0,0(a5)
    80001730:	00002097          	auipc	ra,0x2
    80001734:	954080e7          	jalr	-1708(ra) # 80003084 <_ZN7_thread10setBlockedEb>
        thread_dispatch();
    80001738:	00000097          	auipc	ra,0x0
    8000173c:	d50080e7          	jalr	-688(ra) # 80001488 <_Z15thread_dispatchv>
    }
}
    80001740:	01813083          	ld	ra,24(sp)
    80001744:	01013403          	ld	s0,16(sp)
    80001748:	00813483          	ld	s1,8(sp)
    8000174c:	02010113          	addi	sp,sp,32
    80001750:	00008067          	ret
            id->blockHead = pNewBlock;
    80001754:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    80001758:	00a4b423          	sd	a0,8(s1)
    8000175c:	fc5ff06f          	j	80001720 <_ZN4_sem4waitEPS_+0x64>

0000000080001760 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    80001760:	01052783          	lw	a5,16(a0)
    80001764:	0017879b          	addiw	a5,a5,1
    80001768:	0007871b          	sext.w	a4,a5
    8000176c:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    80001770:	00e05463          	blez	a4,80001778 <_ZN4_sem6signalEPS_+0x18>
    80001774:	00008067          	ret
void _sem::signal(sem_t id){
    80001778:	fe010113          	addi	sp,sp,-32
    8000177c:	00113c23          	sd	ra,24(sp)
    80001780:	00813823          	sd	s0,16(sp)
    80001784:	00913423          	sd	s1,8(sp)
    80001788:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    8000178c:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    80001790:	0084b783          	ld	a5,8(s1)
    80001794:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    80001798:	04078063          	beqz	a5,800017d8 <_ZN4_sem6signalEPS_+0x78>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    8000179c:	00000593          	li	a1,0
    800017a0:	0004b503          	ld	a0,0(s1)
    800017a4:	00002097          	auipc	ra,0x2
    800017a8:	8e0080e7          	jalr	-1824(ra) # 80003084 <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    800017ac:	00048513          	mv	a0,s1
    800017b0:	00000097          	auipc	ra,0x0
    800017b4:	c10080e7          	jalr	-1008(ra) # 800013c0 <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    800017b8:	0004b503          	ld	a0,0(s1)
    800017bc:	00003097          	auipc	ra,0x3
    800017c0:	b14080e7          	jalr	-1260(ra) # 800042d0 <_ZN9Scheduler3putEP7_thread>
    }
    800017c4:	01813083          	ld	ra,24(sp)
    800017c8:	01013403          	ld	s0,16(sp)
    800017cc:	00813483          	ld	s1,8(sp)
    800017d0:	02010113          	addi	sp,sp,32
    800017d4:	00008067          	ret
            id->blockTail = 0;
    800017d8:	00053423          	sd	zero,8(a0)
    800017dc:	fc1ff06f          	j	8000179c <_ZN4_sem6signalEPS_+0x3c>

00000000800017e0 <main>:
#include "assert.h"
#include "syscalls_c.h"
#include "userConsole.h"

/// @brief first function to be called
void main(){
    800017e0:	eb010113          	addi	sp,sp,-336
    800017e4:	14113423          	sd	ra,328(sp)
    800017e8:	14813023          	sd	s0,320(sp)
    800017ec:	12913c23          	sd	s1,312(sp)
    800017f0:	15010413          	addi	s0,sp,336
    Kernel kernel = Kernel();
    800017f4:	eb040493          	addi	s1,s0,-336
    800017f8:	00048513          	mv	a0,s1
    800017fc:	00001097          	auipc	ra,0x1
    80001800:	940080e7          	jalr	-1728(ra) # 8000213c <_ZN6KernelC1Ev>
    kernel.initialise();
    80001804:	00048513          	mv	a0,s1
    80001808:	00001097          	auipc	ra,0x1
    8000180c:	a24080e7          	jalr	-1500(ra) # 8000222c <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    80001810:	00048513          	mv	a0,s1
    80001814:	00001097          	auipc	ra,0x1
    80001818:	b30080e7          	jalr	-1232(ra) # 80002344 <_ZN6Kernel3runEv>
    8000181c:	00050493          	mv	s1,a0
    putc('\n');
    80001820:	00a00513          	li	a0,10
    80001824:	00000097          	auipc	ra,0x0
    80001828:	db8080e7          	jalr	-584(ra) # 800015dc <_Z4putcc>
    putc('\n');
    8000182c:	00a00513          	li	a0,10
    80001830:	00000097          	auipc	ra,0x0
    80001834:	dac080e7          	jalr	-596(ra) # 800015dc <_Z4putcc>
    putc('-');
    80001838:	02d00513          	li	a0,45
    8000183c:	00000097          	auipc	ra,0x0
    80001840:	da0080e7          	jalr	-608(ra) # 800015dc <_Z4putcc>
    putc('-');
    80001844:	02d00513          	li	a0,45
    80001848:	00000097          	auipc	ra,0x0
    8000184c:	d94080e7          	jalr	-620(ra) # 800015dc <_Z4putcc>
    putc('-');
    80001850:	02d00513          	li	a0,45
    80001854:	00000097          	auipc	ra,0x0
    80001858:	d88080e7          	jalr	-632(ra) # 800015dc <_Z4putcc>
    putc('-');
    8000185c:	02d00513          	li	a0,45
    80001860:	00000097          	auipc	ra,0x0
    80001864:	d7c080e7          	jalr	-644(ra) # 800015dc <_Z4putcc>
    putc('-');
    80001868:	02d00513          	li	a0,45
    8000186c:	00000097          	auipc	ra,0x0
    80001870:	d70080e7          	jalr	-656(ra) # 800015dc <_Z4putcc>
    putc('-');
    80001874:	02d00513          	li	a0,45
    80001878:	00000097          	auipc	ra,0x0
    8000187c:	d64080e7          	jalr	-668(ra) # 800015dc <_Z4putcc>
    putc('-');
    80001880:	02d00513          	li	a0,45
    80001884:	00000097          	auipc	ra,0x0
    80001888:	d58080e7          	jalr	-680(ra) # 800015dc <_Z4putcc>
    putc('-');
    8000188c:	02d00513          	li	a0,45
    80001890:	00000097          	auipc	ra,0x0
    80001894:	d4c080e7          	jalr	-692(ra) # 800015dc <_Z4putcc>
    putc('-');
    80001898:	02d00513          	li	a0,45
    8000189c:	00000097          	auipc	ra,0x0
    800018a0:	d40080e7          	jalr	-704(ra) # 800015dc <_Z4putcc>
    putc('-');
    800018a4:	02d00513          	li	a0,45
    800018a8:	00000097          	auipc	ra,0x0
    800018ac:	d34080e7          	jalr	-716(ra) # 800015dc <_Z4putcc>
    putc('-');
    800018b0:	02d00513          	li	a0,45
    800018b4:	00000097          	auipc	ra,0x0
    800018b8:	d28080e7          	jalr	-728(ra) # 800015dc <_Z4putcc>
    putc('-');
    800018bc:	02d00513          	li	a0,45
    800018c0:	00000097          	auipc	ra,0x0
    800018c4:	d1c080e7          	jalr	-740(ra) # 800015dc <_Z4putcc>
    putc('-');
    800018c8:	02d00513          	li	a0,45
    800018cc:	00000097          	auipc	ra,0x0
    800018d0:	d10080e7          	jalr	-752(ra) # 800015dc <_Z4putcc>
    putc('-');
    800018d4:	02d00513          	li	a0,45
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	d04080e7          	jalr	-764(ra) # 800015dc <_Z4putcc>
    putc('-');
    800018e0:	02d00513          	li	a0,45
    800018e4:	00000097          	auipc	ra,0x0
    800018e8:	cf8080e7          	jalr	-776(ra) # 800015dc <_Z4putcc>
    putc('-');
    800018ec:	02d00513          	li	a0,45
    800018f0:	00000097          	auipc	ra,0x0
    800018f4:	cec080e7          	jalr	-788(ra) # 800015dc <_Z4putcc>
    putc('-');
    800018f8:	02d00513          	li	a0,45
    800018fc:	00000097          	auipc	ra,0x0
    80001900:	ce0080e7          	jalr	-800(ra) # 800015dc <_Z4putcc>
    putc('-');
    80001904:	02d00513          	li	a0,45
    80001908:	00000097          	auipc	ra,0x0
    8000190c:	cd4080e7          	jalr	-812(ra) # 800015dc <_Z4putcc>
    putc('-');
    80001910:	02d00513          	li	a0,45
    80001914:	00000097          	auipc	ra,0x0
    80001918:	cc8080e7          	jalr	-824(ra) # 800015dc <_Z4putcc>
    putc('-');
    8000191c:	02d00513          	li	a0,45
    80001920:	00000097          	auipc	ra,0x0
    80001924:	cbc080e7          	jalr	-836(ra) # 800015dc <_Z4putcc>
    putc('\n');
    80001928:	00a00513          	li	a0,10
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	cb0080e7          	jalr	-848(ra) # 800015dc <_Z4putcc>
    putc('K');
    80001934:	04b00513          	li	a0,75
    80001938:	00000097          	auipc	ra,0x0
    8000193c:	ca4080e7          	jalr	-860(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001940:	06500513          	li	a0,101
    80001944:	00000097          	auipc	ra,0x0
    80001948:	c98080e7          	jalr	-872(ra) # 800015dc <_Z4putcc>
    putc('r');
    8000194c:	07200513          	li	a0,114
    80001950:	00000097          	auipc	ra,0x0
    80001954:	c8c080e7          	jalr	-884(ra) # 800015dc <_Z4putcc>
    putc('n');
    80001958:	06e00513          	li	a0,110
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	c80080e7          	jalr	-896(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001964:	06500513          	li	a0,101
    80001968:	00000097          	auipc	ra,0x0
    8000196c:	c74080e7          	jalr	-908(ra) # 800015dc <_Z4putcc>
    putc('l');
    80001970:	06c00513          	li	a0,108
    80001974:	00000097          	auipc	ra,0x0
    80001978:	c68080e7          	jalr	-920(ra) # 800015dc <_Z4putcc>
    putc(' ');
    8000197c:	02000513          	li	a0,32
    80001980:	00000097          	auipc	ra,0x0
    80001984:	c5c080e7          	jalr	-932(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001988:	06500513          	li	a0,101
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	c50080e7          	jalr	-944(ra) # 800015dc <_Z4putcc>
    putc('x');
    80001994:	07800513          	li	a0,120
    80001998:	00000097          	auipc	ra,0x0
    8000199c:	c44080e7          	jalr	-956(ra) # 800015dc <_Z4putcc>
    putc('i');
    800019a0:	06900513          	li	a0,105
    800019a4:	00000097          	auipc	ra,0x0
    800019a8:	c38080e7          	jalr	-968(ra) # 800015dc <_Z4putcc>
    putc('t');
    800019ac:	07400513          	li	a0,116
    800019b0:	00000097          	auipc	ra,0x0
    800019b4:	c2c080e7          	jalr	-980(ra) # 800015dc <_Z4putcc>
    putc('e');
    800019b8:	06500513          	li	a0,101
    800019bc:	00000097          	auipc	ra,0x0
    800019c0:	c20080e7          	jalr	-992(ra) # 800015dc <_Z4putcc>
    putc('d');
    800019c4:	06400513          	li	a0,100
    800019c8:	00000097          	auipc	ra,0x0
    800019cc:	c14080e7          	jalr	-1004(ra) # 800015dc <_Z4putcc>
    putc(' ');
    800019d0:	02000513          	li	a0,32
    800019d4:	00000097          	auipc	ra,0x0
    800019d8:	c08080e7          	jalr	-1016(ra) # 800015dc <_Z4putcc>
    putc('w');
    800019dc:	07700513          	li	a0,119
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	bfc080e7          	jalr	-1028(ra) # 800015dc <_Z4putcc>
    putc('i');
    800019e8:	06900513          	li	a0,105
    800019ec:	00000097          	auipc	ra,0x0
    800019f0:	bf0080e7          	jalr	-1040(ra) # 800015dc <_Z4putcc>
    putc('t');
    800019f4:	07400513          	li	a0,116
    800019f8:	00000097          	auipc	ra,0x0
    800019fc:	be4080e7          	jalr	-1052(ra) # 800015dc <_Z4putcc>
    putc('h');
    80001a00:	06800513          	li	a0,104
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	bd8080e7          	jalr	-1064(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001a0c:	02000513          	li	a0,32
    80001a10:	00000097          	auipc	ra,0x0
    80001a14:	bcc080e7          	jalr	-1076(ra) # 800015dc <_Z4putcc>
    putc('c');
    80001a18:	06300513          	li	a0,99
    80001a1c:	00000097          	auipc	ra,0x0
    80001a20:	bc0080e7          	jalr	-1088(ra) # 800015dc <_Z4putcc>
    putc('o');
    80001a24:	06f00513          	li	a0,111
    80001a28:	00000097          	auipc	ra,0x0
    80001a2c:	bb4080e7          	jalr	-1100(ra) # 800015dc <_Z4putcc>
    putc('d');
    80001a30:	06400513          	li	a0,100
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	ba8080e7          	jalr	-1112(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001a3c:	06500513          	li	a0,101
    80001a40:	00000097          	auipc	ra,0x0
    80001a44:	b9c080e7          	jalr	-1124(ra) # 800015dc <_Z4putcc>
    putc(':');
    80001a48:	03a00513          	li	a0,58
    80001a4c:	00000097          	auipc	ra,0x0
    80001a50:	b90080e7          	jalr	-1136(ra) # 800015dc <_Z4putcc>
    switch(exitCode){
    80001a54:	00048e63          	beqz	s1,80001a70 <main+0x290>
    80001a58:	00100793          	li	a5,1
    80001a5c:	02f48263          	beq	s1,a5,80001a80 <main+0x2a0>
            break;
        case Kernel::EXIT_FAILURE:
            putc('1');
            break;
        default:
            putc('2');
    80001a60:	03200513          	li	a0,50
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	b78080e7          	jalr	-1160(ra) # 800015dc <_Z4putcc>
    80001a6c:	0200006f          	j	80001a8c <main+0x2ac>
            putc('0');
    80001a70:	03000513          	li	a0,48
    80001a74:	00000097          	auipc	ra,0x0
    80001a78:	b68080e7          	jalr	-1176(ra) # 800015dc <_Z4putcc>
    80001a7c:	0100006f          	j	80001a8c <main+0x2ac>
            putc('1');
    80001a80:	03100513          	li	a0,49
    80001a84:	00000097          	auipc	ra,0x0
    80001a88:	b58080e7          	jalr	-1192(ra) # 800015dc <_Z4putcc>
            break;
    }
    putc('\n');
    80001a8c:	00a00513          	li	a0,10
    80001a90:	00000097          	auipc	ra,0x0
    80001a94:	b4c080e7          	jalr	-1204(ra) # 800015dc <_Z4putcc>
    Console::outputHandler();
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	568080e7          	jalr	1384(ra) # 80002000 <_ZN7Console13outputHandlerEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001aa0:	02049863          	bnez	s1,80001ad0 <main+0x2f0>
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    80001aa4:	ec840513          	addi	a0,s0,-312
    80001aa8:	fffff097          	auipc	ra,0xfffff
    80001aac:	6c8080e7          	jalr	1736(ra) # 80001170 <_ZN5TimerD1Ev>
    80001ab0:	eb040513          	addi	a0,s0,-336
    80001ab4:	00002097          	auipc	ra,0x2
    80001ab8:	804080e7          	jalr	-2044(ra) # 800032b8 <_ZN11HeapManagerD1Ev>
    80001abc:	14813083          	ld	ra,328(sp)
    80001ac0:	14013403          	ld	s0,320(sp)
    80001ac4:	13813483          	ld	s1,312(sp)
    80001ac8:	15010113          	addi	sp,sp,336
    80001acc:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001ad0:	00005697          	auipc	a3,0x5
    80001ad4:	5b868693          	addi	a3,a3,1464 # 80007088 <CONSOLE_STATUS+0x78>
    80001ad8:	05200613          	li	a2,82
    80001adc:	00005597          	auipc	a1,0x5
    80001ae0:	5bc58593          	addi	a1,a1,1468 # 80007098 <CONSOLE_STATUS+0x88>
    80001ae4:	00005517          	auipc	a0,0x5
    80001ae8:	5c450513          	addi	a0,a0,1476 # 800070a8 <CONSOLE_STATUS+0x98>
    80001aec:	00000097          	auipc	ra,0x0
    80001af0:	034080e7          	jalr	52(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
    80001af4:	fb1ff06f          	j	80001aa4 <main+0x2c4>
    80001af8:	00050493          	mv	s1,a0
    80001afc:	ec840513          	addi	a0,s0,-312
    80001b00:	fffff097          	auipc	ra,0xfffff
    80001b04:	670080e7          	jalr	1648(ra) # 80001170 <_ZN5TimerD1Ev>
    80001b08:	eb040513          	addi	a0,s0,-336
    80001b0c:	00001097          	auipc	ra,0x1
    80001b10:	7ac080e7          	jalr	1964(ra) # 800032b8 <_ZN11HeapManagerD1Ev>
    80001b14:	00048513          	mv	a0,s1
    80001b18:	00008097          	auipc	ra,0x8
    80001b1c:	8b0080e7          	jalr	-1872(ra) # 800093c8 <_Unwind_Resume>

0000000080001b20 <_Z13assert_failedPKcS0_jS0_>:
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    80001b20:	fb010113          	addi	sp,sp,-80
    80001b24:	04113423          	sd	ra,72(sp)
    80001b28:	04813023          	sd	s0,64(sp)
    80001b2c:	02913c23          	sd	s1,56(sp)
    80001b30:	03213823          	sd	s2,48(sp)
    80001b34:	03313423          	sd	s3,40(sp)
    80001b38:	03413023          	sd	s4,32(sp)
    80001b3c:	05010413          	addi	s0,sp,80
    80001b40:	00050993          	mv	s3,a0
    80001b44:	00058493          	mv	s1,a1
    80001b48:	00060913          	mv	s2,a2
    80001b4c:	00068a13          	mv	s4,a3
    putc('\n');
    80001b50:	00a00513          	li	a0,10
    80001b54:	00000097          	auipc	ra,0x0
    80001b58:	a88080e7          	jalr	-1400(ra) # 800015dc <_Z4putcc>
    putc('A');
    80001b5c:	04100513          	li	a0,65
    80001b60:	00000097          	auipc	ra,0x0
    80001b64:	a7c080e7          	jalr	-1412(ra) # 800015dc <_Z4putcc>
    putc('s');
    80001b68:	07300513          	li	a0,115
    80001b6c:	00000097          	auipc	ra,0x0
    80001b70:	a70080e7          	jalr	-1424(ra) # 800015dc <_Z4putcc>
    putc('s');
    80001b74:	07300513          	li	a0,115
    80001b78:	00000097          	auipc	ra,0x0
    80001b7c:	a64080e7          	jalr	-1436(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001b80:	06500513          	li	a0,101
    80001b84:	00000097          	auipc	ra,0x0
    80001b88:	a58080e7          	jalr	-1448(ra) # 800015dc <_Z4putcc>
    putc('r');
    80001b8c:	07200513          	li	a0,114
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	a4c080e7          	jalr	-1460(ra) # 800015dc <_Z4putcc>
    putc('t');
    80001b98:	07400513          	li	a0,116
    80001b9c:	00000097          	auipc	ra,0x0
    80001ba0:	a40080e7          	jalr	-1472(ra) # 800015dc <_Z4putcc>
    putc('i');
    80001ba4:	06900513          	li	a0,105
    80001ba8:	00000097          	auipc	ra,0x0
    80001bac:	a34080e7          	jalr	-1484(ra) # 800015dc <_Z4putcc>
    putc('o');
    80001bb0:	06f00513          	li	a0,111
    80001bb4:	00000097          	auipc	ra,0x0
    80001bb8:	a28080e7          	jalr	-1496(ra) # 800015dc <_Z4putcc>
    putc('n');
    80001bbc:	06e00513          	li	a0,110
    80001bc0:	00000097          	auipc	ra,0x0
    80001bc4:	a1c080e7          	jalr	-1508(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001bc8:	02000513          	li	a0,32
    80001bcc:	00000097          	auipc	ra,0x0
    80001bd0:	a10080e7          	jalr	-1520(ra) # 800015dc <_Z4putcc>
    putc('\'');
    80001bd4:	02700513          	li	a0,39
    80001bd8:	00000097          	auipc	ra,0x0
    80001bdc:	a04080e7          	jalr	-1532(ra) # 800015dc <_Z4putcc>
    while(*__assertion != 0){
    80001be0:	0009c503          	lbu	a0,0(s3)
    80001be4:	00050a63          	beqz	a0,80001bf8 <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    80001be8:	00000097          	auipc	ra,0x0
    80001bec:	9f4080e7          	jalr	-1548(ra) # 800015dc <_Z4putcc>
        __assertion++;
    80001bf0:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    80001bf4:	fedff06f          	j	80001be0 <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    80001bf8:	02700513          	li	a0,39
    80001bfc:	00000097          	auipc	ra,0x0
    80001c00:	9e0080e7          	jalr	-1568(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001c04:	02000513          	li	a0,32
    80001c08:	00000097          	auipc	ra,0x0
    80001c0c:	9d4080e7          	jalr	-1580(ra) # 800015dc <_Z4putcc>
    putc('f');
    80001c10:	06600513          	li	a0,102
    80001c14:	00000097          	auipc	ra,0x0
    80001c18:	9c8080e7          	jalr	-1592(ra) # 800015dc <_Z4putcc>
    putc('a');
    80001c1c:	06100513          	li	a0,97
    80001c20:	00000097          	auipc	ra,0x0
    80001c24:	9bc080e7          	jalr	-1604(ra) # 800015dc <_Z4putcc>
    putc('i');
    80001c28:	06900513          	li	a0,105
    80001c2c:	00000097          	auipc	ra,0x0
    80001c30:	9b0080e7          	jalr	-1616(ra) # 800015dc <_Z4putcc>
    putc('l');
    80001c34:	06c00513          	li	a0,108
    80001c38:	00000097          	auipc	ra,0x0
    80001c3c:	9a4080e7          	jalr	-1628(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001c40:	06500513          	li	a0,101
    80001c44:	00000097          	auipc	ra,0x0
    80001c48:	998080e7          	jalr	-1640(ra) # 800015dc <_Z4putcc>
    putc('d');
    80001c4c:	06400513          	li	a0,100
    80001c50:	00000097          	auipc	ra,0x0
    80001c54:	98c080e7          	jalr	-1652(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001c58:	02000513          	li	a0,32
    80001c5c:	00000097          	auipc	ra,0x0
    80001c60:	980080e7          	jalr	-1664(ra) # 800015dc <_Z4putcc>
    putc('i');
    80001c64:	06900513          	li	a0,105
    80001c68:	00000097          	auipc	ra,0x0
    80001c6c:	974080e7          	jalr	-1676(ra) # 800015dc <_Z4putcc>
    putc('n');
    80001c70:	06e00513          	li	a0,110
    80001c74:	00000097          	auipc	ra,0x0
    80001c78:	968080e7          	jalr	-1688(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001c7c:	02000513          	li	a0,32
    80001c80:	00000097          	auipc	ra,0x0
    80001c84:	95c080e7          	jalr	-1700(ra) # 800015dc <_Z4putcc>
    putc('f');
    80001c88:	06600513          	li	a0,102
    80001c8c:	00000097          	auipc	ra,0x0
    80001c90:	950080e7          	jalr	-1712(ra) # 800015dc <_Z4putcc>
    putc('i');
    80001c94:	06900513          	li	a0,105
    80001c98:	00000097          	auipc	ra,0x0
    80001c9c:	944080e7          	jalr	-1724(ra) # 800015dc <_Z4putcc>
    putc('l');
    80001ca0:	06c00513          	li	a0,108
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	938080e7          	jalr	-1736(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001cac:	06500513          	li	a0,101
    80001cb0:	00000097          	auipc	ra,0x0
    80001cb4:	92c080e7          	jalr	-1748(ra) # 800015dc <_Z4putcc>
    putc(':');
    80001cb8:	03a00513          	li	a0,58
    80001cbc:	00000097          	auipc	ra,0x0
    80001cc0:	920080e7          	jalr	-1760(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001cc4:	02000513          	li	a0,32
    80001cc8:	00000097          	auipc	ra,0x0
    80001ccc:	914080e7          	jalr	-1772(ra) # 800015dc <_Z4putcc>
    while(*__file != 0){
    80001cd0:	0004c503          	lbu	a0,0(s1)
    80001cd4:	00050a63          	beqz	a0,80001ce8 <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    80001cd8:	00000097          	auipc	ra,0x0
    80001cdc:	904080e7          	jalr	-1788(ra) # 800015dc <_Z4putcc>
        __file++;
    80001ce0:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80001ce4:	fedff06f          	j	80001cd0 <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    80001ce8:	00a00513          	li	a0,10
    80001cec:	00000097          	auipc	ra,0x0
    80001cf0:	8f0080e7          	jalr	-1808(ra) # 800015dc <_Z4putcc>
    putc('l');
    80001cf4:	06c00513          	li	a0,108
    80001cf8:	00000097          	auipc	ra,0x0
    80001cfc:	8e4080e7          	jalr	-1820(ra) # 800015dc <_Z4putcc>
    putc('i');
    80001d00:	06900513          	li	a0,105
    80001d04:	00000097          	auipc	ra,0x0
    80001d08:	8d8080e7          	jalr	-1832(ra) # 800015dc <_Z4putcc>
    putc('n');
    80001d0c:	06e00513          	li	a0,110
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	8cc080e7          	jalr	-1844(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001d18:	06500513          	li	a0,101
    80001d1c:	00000097          	auipc	ra,0x0
    80001d20:	8c0080e7          	jalr	-1856(ra) # 800015dc <_Z4putcc>
    putc(':');
    80001d24:	03a00513          	li	a0,58
    80001d28:	00000097          	auipc	ra,0x0
    80001d2c:	8b4080e7          	jalr	-1868(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001d30:	02000513          	li	a0,32
    80001d34:	00000097          	auipc	ra,0x0
    80001d38:	8a8080e7          	jalr	-1880(ra) # 800015dc <_Z4putcc>
    char buffer[20];
    int i = 0;
    80001d3c:	00000493          	li	s1,0
    while(__line != 0){
    80001d40:	02090463          	beqz	s2,80001d68 <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80001d44:	00a00713          	li	a4,10
    80001d48:	02e977bb          	remuw	a5,s2,a4
    80001d4c:	0307879b          	addiw	a5,a5,48
    80001d50:	fd040693          	addi	a3,s0,-48
    80001d54:	009686b3          	add	a3,a3,s1
    80001d58:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    80001d5c:	02e9593b          	divuw	s2,s2,a4
        i++;
    80001d60:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    80001d64:	fddff06f          	j	80001d40 <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    80001d68:	02048063          	beqz	s1,80001d88 <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    80001d6c:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80001d70:	fd040793          	addi	a5,s0,-48
    80001d74:	009787b3          	add	a5,a5,s1
    80001d78:	fe87c503          	lbu	a0,-24(a5)
    80001d7c:	00000097          	auipc	ra,0x0
    80001d80:	860080e7          	jalr	-1952(ra) # 800015dc <_Z4putcc>
    80001d84:	fe5ff06f          	j	80001d68 <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80001d88:	00a00513          	li	a0,10
    80001d8c:	00000097          	auipc	ra,0x0
    80001d90:	850080e7          	jalr	-1968(ra) # 800015dc <_Z4putcc>
    putc('f');
    80001d94:	06600513          	li	a0,102
    80001d98:	00000097          	auipc	ra,0x0
    80001d9c:	844080e7          	jalr	-1980(ra) # 800015dc <_Z4putcc>
    putc('u');
    80001da0:	07500513          	li	a0,117
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	838080e7          	jalr	-1992(ra) # 800015dc <_Z4putcc>
    putc('n');
    80001dac:	06e00513          	li	a0,110
    80001db0:	00000097          	auipc	ra,0x0
    80001db4:	82c080e7          	jalr	-2004(ra) # 800015dc <_Z4putcc>
    putc('c');
    80001db8:	06300513          	li	a0,99
    80001dbc:	00000097          	auipc	ra,0x0
    80001dc0:	820080e7          	jalr	-2016(ra) # 800015dc <_Z4putcc>
    putc('t');
    80001dc4:	07400513          	li	a0,116
    80001dc8:	00000097          	auipc	ra,0x0
    80001dcc:	814080e7          	jalr	-2028(ra) # 800015dc <_Z4putcc>
    putc('i');
    80001dd0:	06900513          	li	a0,105
    80001dd4:	00000097          	auipc	ra,0x0
    80001dd8:	808080e7          	jalr	-2040(ra) # 800015dc <_Z4putcc>
    putc('o');
    80001ddc:	06f00513          	li	a0,111
    80001de0:	fffff097          	auipc	ra,0xfffff
    80001de4:	7fc080e7          	jalr	2044(ra) # 800015dc <_Z4putcc>
    putc('n');
    80001de8:	06e00513          	li	a0,110
    80001dec:	fffff097          	auipc	ra,0xfffff
    80001df0:	7f0080e7          	jalr	2032(ra) # 800015dc <_Z4putcc>
    putc(':');
    80001df4:	03a00513          	li	a0,58
    80001df8:	fffff097          	auipc	ra,0xfffff
    80001dfc:	7e4080e7          	jalr	2020(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001e00:	02000513          	li	a0,32
    80001e04:	fffff097          	auipc	ra,0xfffff
    80001e08:	7d8080e7          	jalr	2008(ra) # 800015dc <_Z4putcc>
    putc('\'');
    80001e0c:	02700513          	li	a0,39
    80001e10:	fffff097          	auipc	ra,0xfffff
    80001e14:	7cc080e7          	jalr	1996(ra) # 800015dc <_Z4putcc>
    while(*__function != 0){
    80001e18:	000a4503          	lbu	a0,0(s4)
    80001e1c:	00050a63          	beqz	a0,80001e30 <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    80001e20:	fffff097          	auipc	ra,0xfffff
    80001e24:	7bc080e7          	jalr	1980(ra) # 800015dc <_Z4putcc>
        __function ++;
    80001e28:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80001e2c:	fedff06f          	j	80001e18 <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    80001e30:	02700513          	li	a0,39
    80001e34:	fffff097          	auipc	ra,0xfffff
    80001e38:	7a8080e7          	jalr	1960(ra) # 800015dc <_Z4putcc>
    putc('\n');
    80001e3c:	00a00513          	li	a0,10
    80001e40:	fffff097          	auipc	ra,0xfffff
    80001e44:	79c080e7          	jalr	1948(ra) # 800015dc <_Z4putcc>
    while(1);
    80001e48:	0000006f          	j	80001e48 <_Z13assert_failedPKcS0_jS0_+0x328>

0000000080001e4c <_ZN7Console11getInstanceEv>:

Console* Console::instance = 0;


Console& Console::getInstance(){
    assert(instance != 0);
    80001e4c:	00006797          	auipc	a5,0x6
    80001e50:	47c7b783          	ld	a5,1148(a5) # 800082c8 <_ZN7Console8instanceE>
    80001e54:	00078863          	beqz	a5,80001e64 <_ZN7Console11getInstanceEv+0x18>
    return *instance;
}
    80001e58:	00006517          	auipc	a0,0x6
    80001e5c:	47053503          	ld	a0,1136(a0) # 800082c8 <_ZN7Console8instanceE>
    80001e60:	00008067          	ret
Console& Console::getInstance(){
    80001e64:	ff010113          	addi	sp,sp,-16
    80001e68:	00113423          	sd	ra,8(sp)
    80001e6c:	00813023          	sd	s0,0(sp)
    80001e70:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80001e74:	00005697          	auipc	a3,0x5
    80001e78:	25c68693          	addi	a3,a3,604 # 800070d0 <CONSOLE_STATUS+0xc0>
    80001e7c:	01400613          	li	a2,20
    80001e80:	00005597          	auipc	a1,0x5
    80001e84:	27858593          	addi	a1,a1,632 # 800070f8 <CONSOLE_STATUS+0xe8>
    80001e88:	00005517          	auipc	a0,0x5
    80001e8c:	1f050513          	addi	a0,a0,496 # 80007078 <CONSOLE_STATUS+0x68>
    80001e90:	00000097          	auipc	ra,0x0
    80001e94:	c90080e7          	jalr	-880(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
}
    80001e98:	00006517          	auipc	a0,0x6
    80001e9c:	43053503          	ld	a0,1072(a0) # 800082c8 <_ZN7Console8instanceE>
    80001ea0:	00813083          	ld	ra,8(sp)
    80001ea4:	00013403          	ld	s0,0(sp)
    80001ea8:	01010113          	addi	sp,sp,16
    80001eac:	00008067          	ret

0000000080001eb0 <_ZN7Console13consoleBuffer3putEc>:

void Console::consoleBuffer::put(char c){
    80001eb0:	ff010113          	addi	sp,sp,-16
    80001eb4:	00813423          	sd	s0,8(sp)
    80001eb8:	01010413          	addi	s0,sp,16
    buffer[tail] = c;
    80001ebc:	07053783          	ld	a5,112(a0)
    80001ec0:	00f50733          	add	a4,a0,a5
    80001ec4:	00b70023          	sb	a1,0(a4)
    tail = (tail + 1) % BUFFER_SIZE;
    80001ec8:	00178793          	addi	a5,a5,1
    80001ecc:	06400713          	li	a4,100
    80001ed0:	02e7f7b3          	remu	a5,a5,a4
    80001ed4:	06f53823          	sd	a5,112(a0)
    size++;
    80001ed8:	07853783          	ld	a5,120(a0)
    80001edc:	00178793          	addi	a5,a5,1
    80001ee0:	06f53c23          	sd	a5,120(a0)
}
    80001ee4:	00813403          	ld	s0,8(sp)
    80001ee8:	01010113          	addi	sp,sp,16
    80001eec:	00008067          	ret

0000000080001ef0 <_ZN7Console13consoleBuffer3getEv>:

char Console::consoleBuffer::get(){
    80001ef0:	ff010113          	addi	sp,sp,-16
    80001ef4:	00813423          	sd	s0,8(sp)
    80001ef8:	01010413          	addi	s0,sp,16
    80001efc:	00050793          	mv	a5,a0
    char c = buffer[head];
    80001f00:	06853703          	ld	a4,104(a0)
    80001f04:	00e506b3          	add	a3,a0,a4
    80001f08:	0006c503          	lbu	a0,0(a3)
    head = (head + 1) % BUFFER_SIZE;
    80001f0c:	00170713          	addi	a4,a4,1
    80001f10:	06400693          	li	a3,100
    80001f14:	02d77733          	remu	a4,a4,a3
    80001f18:	06e7b423          	sd	a4,104(a5)
    size--;
    80001f1c:	0787b703          	ld	a4,120(a5)
    80001f20:	fff70713          	addi	a4,a4,-1
    80001f24:	06e7bc23          	sd	a4,120(a5)
    return c;
}
    80001f28:	00813403          	ld	s0,8(sp)
    80001f2c:	01010113          	addi	sp,sp,16
    80001f30:	00008067          	ret

0000000080001f34 <_ZN7Console13consoleBuffer7isEmptyEv>:

bool Console::consoleBuffer::isEmpty(){
    80001f34:	ff010113          	addi	sp,sp,-16
    80001f38:	00813423          	sd	s0,8(sp)
    80001f3c:	01010413          	addi	s0,sp,16
    return size == 0;
    80001f40:	07853503          	ld	a0,120(a0)
}
    80001f44:	00153513          	seqz	a0,a0
    80001f48:	00813403          	ld	s0,8(sp)
    80001f4c:	01010113          	addi	sp,sp,16
    80001f50:	00008067          	ret

0000000080001f54 <_ZN7Console13consoleBuffer6isFullEv>:

bool Console::consoleBuffer::isFull(){
    80001f54:	ff010113          	addi	sp,sp,-16
    80001f58:	00813423          	sd	s0,8(sp)
    80001f5c:	01010413          	addi	s0,sp,16
    return size == BUFFER_SIZE;
    80001f60:	07853503          	ld	a0,120(a0)
    80001f64:	f9c50513          	addi	a0,a0,-100
}
    80001f68:	00153513          	seqz	a0,a0
    80001f6c:	00813403          	ld	s0,8(sp)
    80001f70:	01010113          	addi	sp,sp,16
    80001f74:	00008067          	ret

0000000080001f78 <_ZN7Console4putcEc>:

void Console::putc(char c){
    80001f78:	ff010113          	addi	sp,sp,-16
    80001f7c:	00113423          	sd	ra,8(sp)
    80001f80:	00813023          	sd	s0,0(sp)
    80001f84:	01010413          	addi	s0,sp,16
    80001f88:	00050593          	mv	a1,a0
    instance->outBuffer.put(c);
    80001f8c:	00006517          	auipc	a0,0x6
    80001f90:	33c53503          	ld	a0,828(a0) # 800082c8 <_ZN7Console8instanceE>
    80001f94:	08850513          	addi	a0,a0,136
    80001f98:	00000097          	auipc	ra,0x0
    80001f9c:	f18080e7          	jalr	-232(ra) # 80001eb0 <_ZN7Console13consoleBuffer3putEc>
}
    80001fa0:	00813083          	ld	ra,8(sp)
    80001fa4:	00013403          	ld	s0,0(sp)
    80001fa8:	01010113          	addi	sp,sp,16
    80001fac:	00008067          	ret

0000000080001fb0 <_ZN7Console4getcEv>:

char Console::getc(){
    80001fb0:	fe010113          	addi	sp,sp,-32
    80001fb4:	00113c23          	sd	ra,24(sp)
    80001fb8:	00813823          	sd	s0,16(sp)
    80001fbc:	00913423          	sd	s1,8(sp)
    80001fc0:	02010413          	addi	s0,sp,32
    sem_wait(instance->inSem);
    80001fc4:	00006497          	auipc	s1,0x6
    80001fc8:	30448493          	addi	s1,s1,772 # 800082c8 <_ZN7Console8instanceE>
    80001fcc:	0004b783          	ld	a5,0(s1)
    80001fd0:	0007b503          	ld	a0,0(a5)
    80001fd4:	fffff097          	auipc	ra,0xfffff
    80001fd8:	588080e7          	jalr	1416(ra) # 8000155c <_Z8sem_waitP4_sem>
    return instance->inBuffer.get();
    80001fdc:	0004b503          	ld	a0,0(s1)
    80001fe0:	00850513          	addi	a0,a0,8
    80001fe4:	00000097          	auipc	ra,0x0
    80001fe8:	f0c080e7          	jalr	-244(ra) # 80001ef0 <_ZN7Console13consoleBuffer3getEv>
}
    80001fec:	01813083          	ld	ra,24(sp)
    80001ff0:	01013403          	ld	s0,16(sp)
    80001ff4:	00813483          	ld	s1,8(sp)
    80001ff8:	02010113          	addi	sp,sp,32
    80001ffc:	00008067          	ret

0000000080002000 <_ZN7Console13outputHandlerEv>:

void Console::outputHandler(){
    80002000:	fe010113          	addi	sp,sp,-32
    80002004:	00113c23          	sd	ra,24(sp)
    80002008:	00813823          	sd	s0,16(sp)
    8000200c:	00913423          	sd	s1,8(sp)
    80002010:	01213023          	sd	s2,0(sp)
    80002014:	02010413          	addi	s0,sp,32
    80002018:	00c0006f          	j	80002024 <_ZN7Console13outputHandlerEv+0x24>
    while(!instance->outBuffer.isEmpty()){
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
            (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
        }
        thread_dispatch();
    8000201c:	fffff097          	auipc	ra,0xfffff
    80002020:	46c080e7          	jalr	1132(ra) # 80001488 <_Z15thread_dispatchv>
    while(!instance->outBuffer.isEmpty()){
    80002024:	00006517          	auipc	a0,0x6
    80002028:	2a453503          	ld	a0,676(a0) # 800082c8 <_ZN7Console8instanceE>
    8000202c:	08850513          	addi	a0,a0,136
    80002030:	00000097          	auipc	ra,0x0
    80002034:	f04080e7          	jalr	-252(ra) # 80001f34 <_ZN7Console13consoleBuffer7isEmptyEv>
    80002038:	04051c63          	bnez	a0,80002090 <_ZN7Console13outputHandlerEv+0x90>
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
    8000203c:	00006797          	auipc	a5,0x6
    80002040:	1ec7b783          	ld	a5,492(a5) # 80008228 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002044:	0007b783          	ld	a5,0(a5)
    80002048:	0007c783          	lbu	a5,0(a5)
    8000204c:	0207f793          	andi	a5,a5,32
    80002050:	fc0786e3          	beqz	a5,8000201c <_ZN7Console13outputHandlerEv+0x1c>
    80002054:	00006497          	auipc	s1,0x6
    80002058:	2744b483          	ld	s1,628(s1) # 800082c8 <_ZN7Console8instanceE>
    8000205c:	08848493          	addi	s1,s1,136
    80002060:	00048513          	mv	a0,s1
    80002064:	00000097          	auipc	ra,0x0
    80002068:	ed0080e7          	jalr	-304(ra) # 80001f34 <_ZN7Console13consoleBuffer7isEmptyEv>
    8000206c:	fa0518e3          	bnez	a0,8000201c <_ZN7Console13outputHandlerEv+0x1c>
            (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
    80002070:	00006797          	auipc	a5,0x6
    80002074:	1d07b783          	ld	a5,464(a5) # 80008240 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002078:	0007b903          	ld	s2,0(a5)
    8000207c:	00048513          	mv	a0,s1
    80002080:	00000097          	auipc	ra,0x0
    80002084:	e70080e7          	jalr	-400(ra) # 80001ef0 <_ZN7Console13consoleBuffer3getEv>
    80002088:	00a90023          	sb	a0,0(s2)
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
    8000208c:	fb1ff06f          	j	8000203c <_ZN7Console13outputHandlerEv+0x3c>
    }
}
    80002090:	01813083          	ld	ra,24(sp)
    80002094:	01013403          	ld	s0,16(sp)
    80002098:	00813483          	ld	s1,8(sp)
    8000209c:	00013903          	ld	s2,0(sp)
    800020a0:	02010113          	addi	sp,sp,32
    800020a4:	00008067          	ret

00000000800020a8 <_ZN7Console12inputHandlerEv>:

void Console::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    800020a8:	00006797          	auipc	a5,0x6
    800020ac:	1807b783          	ld	a5,384(a5) # 80008228 <_GLOBAL_OFFSET_TABLE_+0x10>
    800020b0:	0007b783          	ld	a5,0(a5)
    800020b4:	0007c783          	lbu	a5,0(a5)
    800020b8:	0017f793          	andi	a5,a5,1
    800020bc:	06078e63          	beqz	a5,80002138 <_ZN7Console12inputHandlerEv+0x90>
void Console::inputHandler(){
    800020c0:	fe010113          	addi	sp,sp,-32
    800020c4:	00113c23          	sd	ra,24(sp)
    800020c8:	00813823          	sd	s0,16(sp)
    800020cc:	00913423          	sd	s1,8(sp)
    800020d0:	02010413          	addi	s0,sp,32
        char ch =(*(char*)CONSOLE_RX_DATA);
    800020d4:	00006797          	auipc	a5,0x6
    800020d8:	14c7b783          	ld	a5,332(a5) # 80008220 <_GLOBAL_OFFSET_TABLE_+0x8>
    800020dc:	0007b783          	ld	a5,0(a5)
        instance->inBuffer.put(ch);
    800020e0:	00006497          	auipc	s1,0x6
    800020e4:	1e848493          	addi	s1,s1,488 # 800082c8 <_ZN7Console8instanceE>
    800020e8:	0004b503          	ld	a0,0(s1)
    800020ec:	0007c583          	lbu	a1,0(a5)
    800020f0:	00850513          	addi	a0,a0,8
    800020f4:	00000097          	auipc	ra,0x0
    800020f8:	dbc080e7          	jalr	-580(ra) # 80001eb0 <_ZN7Console13consoleBuffer3putEc>
        sem_signal(instance->inSem);
    800020fc:	0004b783          	ld	a5,0(s1)
    80002100:	0007b503          	ld	a0,0(a5)
    80002104:	fffff097          	auipc	ra,0xfffff
    80002108:	484080e7          	jalr	1156(ra) # 80001588 <_Z10sem_signalP4_sem>
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    8000210c:	00006797          	auipc	a5,0x6
    80002110:	11c7b783          	ld	a5,284(a5) # 80008228 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002114:	0007b783          	ld	a5,0(a5)
    80002118:	0007c783          	lbu	a5,0(a5)
    8000211c:	0017f793          	andi	a5,a5,1
    80002120:	fa079ae3          	bnez	a5,800020d4 <_ZN7Console12inputHandlerEv+0x2c>
    }
    80002124:	01813083          	ld	ra,24(sp)
    80002128:	01013403          	ld	s0,16(sp)
    8000212c:	00813483          	ld	s1,8(sp)
    80002130:	02010113          	addi	sp,sp,32
    80002134:	00008067          	ret
    80002138:	00008067          	ret

000000008000213c <_ZN6KernelC1Ev>:
#include "console.h"
#include "userConsole.h"

extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    8000213c:	fd010113          	addi	sp,sp,-48
    80002140:	02113423          	sd	ra,40(sp)
    80002144:	02813023          	sd	s0,32(sp)
    80002148:	00913c23          	sd	s1,24(sp)
    8000214c:	01213823          	sd	s2,16(sp)
    80002150:	01313423          	sd	s3,8(sp)
    80002154:	03010413          	addi	s0,sp,48
    80002158:	00050913          	mv	s2,a0
    8000215c:	00001097          	auipc	ra,0x1
    80002160:	0f4080e7          	jalr	244(ra) # 80003250 <_ZN11HeapManagerC1Ev>
    80002164:	00890513          	addi	a0,s2,8
    80002168:	00002097          	auipc	ra,0x2
    8000216c:	0d0080e7          	jalr	208(ra) # 80004238 <_ZN9SchedulerC1Ev>
    80002170:	01890993          	addi	s3,s2,24
    80002174:	00098513          	mv	a0,s3
    80002178:	fffff097          	auipc	ra,0xfffff
    8000217c:	f88080e7          	jalr	-120(ra) # 80001100 <_ZN5TimerC1Ev>
    80002180:	02890493          	addi	s1,s2,40
    
    sem_t inSem;

    struct consoleBuffer{
    public:
        consoleBuffer(): head(0), tail(0), size(0){}
    80002184:	0604b823          	sd	zero,112(s1)
    80002188:	0604bc23          	sd	zero,120(s1)
    8000218c:	0804b023          	sd	zero,128(s1)
    80002190:	0e04b823          	sd	zero,240(s1)
    80002194:	0e04bc23          	sd	zero,248(s1)
    80002198:	1004b023          	sd	zero,256(s1)
        assert(instance == 0);
    8000219c:	00006797          	auipc	a5,0x6
    800021a0:	0bc7b783          	ld	a5,188(a5) # 80008258 <_GLOBAL_OFFSET_TABLE_+0x40>
    800021a4:	0007b783          	ld	a5,0(a5)
    800021a8:	02079663          	bnez	a5,800021d4 <_ZN6KernelC1Ev+0x98>
        instance = this;
    800021ac:	00006797          	auipc	a5,0x6
    800021b0:	0ac7b783          	ld	a5,172(a5) # 80008258 <_GLOBAL_OFFSET_TABLE_+0x40>
    800021b4:	0097b023          	sd	s1,0(a5)
    800021b8:	02813083          	ld	ra,40(sp)
    800021bc:	02013403          	ld	s0,32(sp)
    800021c0:	01813483          	ld	s1,24(sp)
    800021c4:	01013903          	ld	s2,16(sp)
    800021c8:	00813983          	ld	s3,8(sp)
    800021cc:	03010113          	addi	sp,sp,48
    800021d0:	00008067          	ret
        assert(instance == 0);
    800021d4:	00005697          	auipc	a3,0x5
    800021d8:	f3468693          	addi	a3,a3,-204 # 80007108 <CONSOLE_STATUS+0xf8>
    800021dc:	01a00613          	li	a2,26
    800021e0:	00005597          	auipc	a1,0x5
    800021e4:	f4058593          	addi	a1,a1,-192 # 80007120 <CONSOLE_STATUS+0x110>
    800021e8:	00005517          	auipc	a0,0x5
    800021ec:	e5850513          	addi	a0,a0,-424 # 80007040 <CONSOLE_STATUS+0x30>
    800021f0:	00000097          	auipc	ra,0x0
    800021f4:	930080e7          	jalr	-1744(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
    800021f8:	fb5ff06f          	j	800021ac <_ZN6KernelC1Ev+0x70>
    800021fc:	00050493          	mv	s1,a0
    80002200:	00098513          	mv	a0,s3
    80002204:	fffff097          	auipc	ra,0xfffff
    80002208:	f6c080e7          	jalr	-148(ra) # 80001170 <_ZN5TimerD1Ev>
    8000220c:	00090513          	mv	a0,s2
    80002210:	00001097          	auipc	ra,0x1
    80002214:	0a8080e7          	jalr	168(ra) # 800032b8 <_ZN11HeapManagerD1Ev>
    80002218:	00048513          	mv	a0,s1
    8000221c:	00007097          	auipc	ra,0x7
    80002220:	1ac080e7          	jalr	428(ra) # 800093c8 <_Unwind_Resume>
    80002224:	00050493          	mv	s1,a0
    80002228:	fe5ff06f          	j	8000220c <_ZN6KernelC1Ev+0xd0>

000000008000222c <_ZN6Kernel10initialiseEv>:
 
void Kernel::initialise(){
    8000222c:	ff010113          	addi	sp,sp,-16
    80002230:	00113423          	sd	ra,8(sp)
    80002234:	00813023          	sd	s0,0(sp)
    80002238:	01010413          	addi	s0,sp,16
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    8000223c:	00006797          	auipc	a5,0x6
    80002240:	0247b783          	ld	a5,36(a5) # 80008260 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002244:	10579073          	csrw	stvec,a5

    
    /// initialise the heap manager
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );
    80002248:	00006797          	auipc	a5,0x6
    8000224c:	0207b783          	ld	a5,32(a5) # 80008268 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002250:	0007b603          	ld	a2,0(a5)
    80002254:	00006797          	auipc	a5,0x6
    80002258:	fdc7b783          	ld	a5,-36(a5) # 80008230 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000225c:	0007b583          	ld	a1,0(a5)
    80002260:	00001097          	auipc	ra,0x1
    80002264:	070080e7          	jalr	112(ra) # 800032d0 <_ZN11HeapManager4initEmm>
    console.getInstance().init();
    80002268:	00000097          	auipc	ra,0x0
    8000226c:	be4080e7          	jalr	-1052(ra) # 80001e4c <_ZN7Console11getInstanceEv>
        sem_open(&inSem, 0);
    80002270:	00000593          	li	a1,0
    80002274:	fffff097          	auipc	ra,0xfffff
    80002278:	284080e7          	jalr	644(ra) # 800014f8 <_Z8sem_openPP4_semj>
    return;
}
    8000227c:	00813083          	ld	ra,8(sp)
    80002280:	00013403          	ld	s0,0(sp)
    80002284:	01010113          	addi	sp,sp,16
    80002288:	00008067          	ret

000000008000228c <_Z8testFuncPv>:

// sem_t sem = 0;

void testFunc(void* arg){
    8000228c:	ff010113          	addi	sp,sp,-16
    80002290:	00113423          	sd	ra,8(sp)
    80002294:	00813023          	sd	s0,0(sp)
    80002298:	01010413          	addi	s0,sp,16
    putc('t');
    8000229c:	07400513          	li	a0,116
    800022a0:	fffff097          	auipc	ra,0xfffff
    800022a4:	33c080e7          	jalr	828(ra) # 800015dc <_Z4putcc>
    putc('e');
    800022a8:	06500513          	li	a0,101
    800022ac:	fffff097          	auipc	ra,0xfffff
    800022b0:	330080e7          	jalr	816(ra) # 800015dc <_Z4putcc>
    putc('s');
    800022b4:	07300513          	li	a0,115
    800022b8:	fffff097          	auipc	ra,0xfffff
    800022bc:	324080e7          	jalr	804(ra) # 800015dc <_Z4putcc>
    putc('t');
    800022c0:	07400513          	li	a0,116
    800022c4:	fffff097          	auipc	ra,0xfffff
    800022c8:	318080e7          	jalr	792(ra) # 800015dc <_Z4putcc>

    // sem_wait(sem);
    // thread_dispatch();
    // thread_dispatch();
    thread_dispatch();
    800022cc:	fffff097          	auipc	ra,0xfffff
    800022d0:	1bc080e7          	jalr	444(ra) # 80001488 <_Z15thread_dispatchv>

    // time_sleep(10);
    putc(' ');
    800022d4:	02000513          	li	a0,32
    800022d8:	fffff097          	auipc	ra,0xfffff
    800022dc:	304080e7          	jalr	772(ra) # 800015dc <_Z4putcc>

    putc('t');
    800022e0:	07400513          	li	a0,116
    800022e4:	fffff097          	auipc	ra,0xfffff
    800022e8:	2f8080e7          	jalr	760(ra) # 800015dc <_Z4putcc>
    putc('h');
    800022ec:	06800513          	li	a0,104
    800022f0:	fffff097          	auipc	ra,0xfffff
    800022f4:	2ec080e7          	jalr	748(ra) # 800015dc <_Z4putcc>
    putc('r');
    800022f8:	07200513          	li	a0,114
    800022fc:	fffff097          	auipc	ra,0xfffff
    80002300:	2e0080e7          	jalr	736(ra) # 800015dc <_Z4putcc>
    putc('e');
    80002304:	06500513          	li	a0,101
    80002308:	fffff097          	auipc	ra,0xfffff
    8000230c:	2d4080e7          	jalr	724(ra) # 800015dc <_Z4putcc>
    putc('a');
    80002310:	06100513          	li	a0,97
    80002314:	fffff097          	auipc	ra,0xfffff
    80002318:	2c8080e7          	jalr	712(ra) # 800015dc <_Z4putcc>
    putc('d');
    8000231c:	06400513          	li	a0,100
    80002320:	fffff097          	auipc	ra,0xfffff
    80002324:	2bc080e7          	jalr	700(ra) # 800015dc <_Z4putcc>
    putc('\n');
    80002328:	00a00513          	li	a0,10
    8000232c:	fffff097          	auipc	ra,0xfffff
    80002330:	2b0080e7          	jalr	688(ra) # 800015dc <_Z4putcc>
}
    80002334:	00813083          	ld	ra,8(sp)
    80002338:	00013403          	ld	s0,0(sp)
    8000233c:	01010113          	addi	sp,sp,16
    80002340:	00008067          	ret

0000000080002344 <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    80002344:	fe010113          	addi	sp,sp,-32
    80002348:	00113c23          	sd	ra,24(sp)
    8000234c:	00813823          	sd	s0,16(sp)
    80002350:	02010413          	addi	s0,sp,32

    thread_t t, test;
    
    thread_create(&t, 0, 0);
    80002354:	00000613          	li	a2,0
    80002358:	00000593          	li	a1,0
    8000235c:	fe840513          	addi	a0,s0,-24
    80002360:	fffff097          	auipc	ra,0xfffff
    80002364:	08c080e7          	jalr	140(ra) # 800013ec <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80002368:	00002097          	auipc	ra,0x2
    8000236c:	158080e7          	jalr	344(ra) # 800044c0 <_ZN9Scheduler3getEv>
    80002370:	00006797          	auipc	a5,0x6
    80002374:	f007b783          	ld	a5,-256(a5) # 80008270 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002378:	00a7b023          	sd	a0,0(a5)
    
    /// change to user mode
    __asm__ volatile ("li a0, 0xff");
    8000237c:	0ff00513          	li	a0,255
    __asm__ volatile ("ecall");
    80002380:	00000073          	ecall
    /// NOW WE ARE IN USER MODE
    
    
    thread_create(&test, usermain, 0);
    80002384:	00000613          	li	a2,0
    80002388:	00006597          	auipc	a1,0x6
    8000238c:	eb05b583          	ld	a1,-336(a1) # 80008238 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002390:	fe040513          	addi	a0,s0,-32
    80002394:	fffff097          	auipc	ra,0xfffff
    80002398:	058080e7          	jalr	88(ra) # 800013ec <_Z13thread_createPP7_threadPFvPvES2_>
    do{
        Console::outputHandler();
    8000239c:	00000097          	auipc	ra,0x0
    800023a0:	c64080e7          	jalr	-924(ra) # 80002000 <_ZN7Console13outputHandlerEv>
        thread_dispatch();
    800023a4:	fffff097          	auipc	ra,0xfffff
    800023a8:	0e4080e7          	jalr	228(ra) # 80001488 <_Z15thread_dispatchv>
    }while(!Scheduler::isEmpty() || !Timer::getInstance().noSleepingThreads());
    800023ac:	00002097          	auipc	ra,0x2
    800023b0:	efc080e7          	jalr	-260(ra) # 800042a8 <_ZN9Scheduler7isEmptyEv>
    800023b4:	fe0504e3          	beqz	a0,8000239c <_ZN6Kernel3runEv+0x58>
    800023b8:	fffff097          	auipc	ra,0xfffff
    800023bc:	e00080e7          	jalr	-512(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    800023c0:	fffff097          	auipc	ra,0xfffff
    800023c4:	fb0080e7          	jalr	-80(ra) # 80001370 <_ZN5Timer17noSleepingThreadsEv>
    800023c8:	fc050ae3          	beqz	a0,8000239c <_ZN6Kernel3runEv+0x58>
    // }while(true);

    putc('m');
    800023cc:	06d00513          	li	a0,109
    800023d0:	fffff097          	auipc	ra,0xfffff
    800023d4:	20c080e7          	jalr	524(ra) # 800015dc <_Z4putcc>
    putc('a');
    800023d8:	06100513          	li	a0,97
    800023dc:	fffff097          	auipc	ra,0xfffff
    800023e0:	200080e7          	jalr	512(ra) # 800015dc <_Z4putcc>
    putc('i');
    800023e4:	06900513          	li	a0,105
    800023e8:	fffff097          	auipc	ra,0xfffff
    800023ec:	1f4080e7          	jalr	500(ra) # 800015dc <_Z4putcc>
    putc('n');
    800023f0:	06e00513          	li	a0,110
    800023f4:	fffff097          	auipc	ra,0xfffff
    800023f8:	1e8080e7          	jalr	488(ra) # 800015dc <_Z4putcc>
    putc('\n');
    800023fc:	00a00513          	li	a0,10
    80002400:	fffff097          	auipc	ra,0xfffff
    80002404:	1dc080e7          	jalr	476(ra) # 800015dc <_Z4putcc>
    return EXIT_SUCCESS;
}
    80002408:	00000513          	li	a0,0
    8000240c:	01813083          	ld	ra,24(sp)
    80002410:	01013403          	ld	s0,16(sp)
    80002414:	02010113          	addi	sp,sp,32
    80002418:	00008067          	ret

000000008000241c <_Z13thread_test_1Pv>:
#include "assert.h"

sem_t sem1;
sem_t sem2;

void thread_test_1(void* args){
    8000241c:	ff010113          	addi	sp,sp,-16
    80002420:	00113423          	sd	ra,8(sp)
    80002424:	00813023          	sd	s0,0(sp)
    80002428:	01010413          	addi	s0,sp,16
    putc('1');
    8000242c:	03100513          	li	a0,49
    80002430:	fffff097          	auipc	ra,0xfffff
    80002434:	1ac080e7          	jalr	428(ra) # 800015dc <_Z4putcc>
    putc('s');
    80002438:	07300513          	li	a0,115
    8000243c:	fffff097          	auipc	ra,0xfffff
    80002440:	1a0080e7          	jalr	416(ra) # 800015dc <_Z4putcc>
    time_sleep(30);
    80002444:	01e00513          	li	a0,30
    80002448:	fffff097          	auipc	ra,0xfffff
    8000244c:	084080e7          	jalr	132(ra) # 800014cc <_Z10time_sleepm>
    putc('1');
    80002450:	03100513          	li	a0,49
    80002454:	fffff097          	auipc	ra,0xfffff
    80002458:	188080e7          	jalr	392(ra) # 800015dc <_Z4putcc>
    sem_signal(sem1);
    8000245c:	00006517          	auipc	a0,0x6
    80002460:	e7453503          	ld	a0,-396(a0) # 800082d0 <sem1>
    80002464:	fffff097          	auipc	ra,0xfffff
    80002468:	124080e7          	jalr	292(ra) # 80001588 <_Z10sem_signalP4_sem>
    putc('S');
    8000246c:	05300513          	li	a0,83
    80002470:	fffff097          	auipc	ra,0xfffff
    80002474:	16c080e7          	jalr	364(ra) # 800015dc <_Z4putcc>
}
    80002478:	00813083          	ld	ra,8(sp)
    8000247c:	00013403          	ld	s0,0(sp)
    80002480:	01010113          	addi	sp,sp,16
    80002484:	00008067          	ret

0000000080002488 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80002488:	ff010113          	addi	sp,sp,-16
    8000248c:	00113423          	sd	ra,8(sp)
    80002490:	00813023          	sd	s0,0(sp)
    80002494:	01010413          	addi	s0,sp,16
    putc('2');
    80002498:	03200513          	li	a0,50
    8000249c:	fffff097          	auipc	ra,0xfffff
    800024a0:	140080e7          	jalr	320(ra) # 800015dc <_Z4putcc>
    putc('s');
    800024a4:	07300513          	li	a0,115
    800024a8:	fffff097          	auipc	ra,0xfffff
    800024ac:	134080e7          	jalr	308(ra) # 800015dc <_Z4putcc>
    time_sleep(60);
    800024b0:	03c00513          	li	a0,60
    800024b4:	fffff097          	auipc	ra,0xfffff
    800024b8:	018080e7          	jalr	24(ra) # 800014cc <_Z10time_sleepm>
    putc('2');
    800024bc:	03200513          	li	a0,50
    800024c0:	fffff097          	auipc	ra,0xfffff
    800024c4:	11c080e7          	jalr	284(ra) # 800015dc <_Z4putcc>
    putc('S');
    800024c8:	05300513          	li	a0,83
    800024cc:	fffff097          	auipc	ra,0xfffff
    800024d0:	110080e7          	jalr	272(ra) # 800015dc <_Z4putcc>
    sem_signal(sem2);
    800024d4:	00006517          	auipc	a0,0x6
    800024d8:	e0453503          	ld	a0,-508(a0) # 800082d8 <sem2>
    800024dc:	fffff097          	auipc	ra,0xfffff
    800024e0:	0ac080e7          	jalr	172(ra) # 80001588 <_Z10sem_signalP4_sem>
    for(int i = 0; i < 1 << 20; i++){
    800024e4:	00000793          	li	a5,0
    800024e8:	00100737          	lui	a4,0x100
    800024ec:	00e7d863          	bge	a5,a4,800024fc <_Z13thread_test_2Pv+0x74>
        __asm__ volatile("nop");
    800024f0:	00000013          	nop
    for(int i = 0; i < 1 << 20; i++){
    800024f4:	0017879b          	addiw	a5,a5,1
    800024f8:	ff1ff06f          	j	800024e8 <_Z13thread_test_2Pv+0x60>
    }
}
    800024fc:	00813083          	ld	ra,8(sp)
    80002500:	00013403          	ld	s0,0(sp)
    80002504:	01010113          	addi	sp,sp,16
    80002508:	00008067          	ret

000000008000250c <_Z7memTestv>:

void memTest(){
    8000250c:	fd010113          	addi	sp,sp,-48
    80002510:	02113423          	sd	ra,40(sp)
    80002514:	02813023          	sd	s0,32(sp)
    80002518:	00913c23          	sd	s1,24(sp)
    8000251c:	01213823          	sd	s2,16(sp)
    80002520:	01313423          	sd	s3,8(sp)
    80002524:	01413023          	sd	s4,0(sp)
    80002528:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    8000252c:	00006797          	auipc	a5,0x6
    80002530:	d1c7b783          	ld	a5,-740(a5) # 80008248 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002534:	0007b503          	ld	a0,0(a5)
    80002538:	00001097          	auipc	ra,0x1
    8000253c:	ebc080e7          	jalr	-324(ra) # 800033f4 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002540:	00050993          	mv	s3,a0
    putc('F');
    80002544:	04600513          	li	a0,70
    80002548:	fffff097          	auipc	ra,0xfffff
    8000254c:	094080e7          	jalr	148(ra) # 800015dc <_Z4putcc>
    putc('r');
    80002550:	07200513          	li	a0,114
    80002554:	fffff097          	auipc	ra,0xfffff
    80002558:	088080e7          	jalr	136(ra) # 800015dc <_Z4putcc>
    putc('e');
    8000255c:	06500513          	li	a0,101
    80002560:	fffff097          	auipc	ra,0xfffff
    80002564:	07c080e7          	jalr	124(ra) # 800015dc <_Z4putcc>
    putc('e');
    80002568:	06500513          	li	a0,101
    8000256c:	fffff097          	auipc	ra,0xfffff
    80002570:	070080e7          	jalr	112(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80002574:	02000513          	li	a0,32
    80002578:	fffff097          	auipc	ra,0xfffff
    8000257c:	064080e7          	jalr	100(ra) # 800015dc <_Z4putcc>
    putc('m');
    80002580:	06d00513          	li	a0,109
    80002584:	fffff097          	auipc	ra,0xfffff
    80002588:	058080e7          	jalr	88(ra) # 800015dc <_Z4putcc>
    putc('e');
    8000258c:	06500513          	li	a0,101
    80002590:	fffff097          	auipc	ra,0xfffff
    80002594:	04c080e7          	jalr	76(ra) # 800015dc <_Z4putcc>
    putc('m');
    80002598:	06d00513          	li	a0,109
    8000259c:	fffff097          	auipc	ra,0xfffff
    800025a0:	040080e7          	jalr	64(ra) # 800015dc <_Z4putcc>
    putc('o');
    800025a4:	06f00513          	li	a0,111
    800025a8:	fffff097          	auipc	ra,0xfffff
    800025ac:	034080e7          	jalr	52(ra) # 800015dc <_Z4putcc>
    putc('r');
    800025b0:	07200513          	li	a0,114
    800025b4:	fffff097          	auipc	ra,0xfffff
    800025b8:	028080e7          	jalr	40(ra) # 800015dc <_Z4putcc>
    putc('y');
    800025bc:	07900513          	li	a0,121
    800025c0:	fffff097          	auipc	ra,0xfffff
    800025c4:	01c080e7          	jalr	28(ra) # 800015dc <_Z4putcc>
    putc(':');
    800025c8:	03a00513          	li	a0,58
    800025cc:	fffff097          	auipc	ra,0xfffff
    800025d0:	010080e7          	jalr	16(ra) # 800015dc <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800025d4:	00f00493          	li	s1,15
    800025d8:	0140006f          	j	800025ec <_Z7memTestv+0xe0>
        int digit = (freeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    800025dc:	05750513          	addi	a0,a0,87
    800025e0:	fffff097          	auipc	ra,0xfffff
    800025e4:	ffc080e7          	jalr	-4(ra) # 800015dc <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800025e8:	fff4849b          	addiw	s1,s1,-1
    800025ec:	0204c463          	bltz	s1,80002614 <_Z7memTestv+0x108>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    800025f0:	0024951b          	slliw	a0,s1,0x2
    800025f4:	00a9d533          	srl	a0,s3,a0
    800025f8:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800025fc:	00900793          	li	a5,9
    80002600:	fca7cee3          	blt	a5,a0,800025dc <_Z7memTestv+0xd0>
            putc('0' + digit);
    80002604:	03050513          	addi	a0,a0,48
    80002608:	fffff097          	auipc	ra,0xfffff
    8000260c:	fd4080e7          	jalr	-44(ra) # 800015dc <_Z4putcc>
    80002610:	fd9ff06f          	j	800025e8 <_Z7memTestv+0xdc>
        }
    }
    putc('\n');
    80002614:	00a00513          	li	a0,10
    80002618:	fffff097          	auipc	ra,0xfffff
    8000261c:	fc4080e7          	jalr	-60(ra) # 800015dc <_Z4putcc>
    int n = 100;
    int k = 100;
    int** matrix = (int**)mem_alloc(sizeof(int*) * n);
    80002620:	32000513          	li	a0,800
    80002624:	fffff097          	auipc	ra,0xfffff
    80002628:	d6c080e7          	jalr	-660(ra) # 80001390 <_Z9mem_allocm>
    8000262c:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    80002630:	00000493          	li	s1,0
    80002634:	0080006f          	j	8000263c <_Z7memTestv+0x130>
    80002638:	0014849b          	addiw	s1,s1,1
    8000263c:	06300793          	li	a5,99
    80002640:	0497c663          	blt	a5,s1,8000268c <_Z7memTestv+0x180>
        matrix[i] = (int*)mem_alloc(sizeof(int) * k);
    80002644:	00349a13          	slli	s4,s1,0x3
    80002648:	01490a33          	add	s4,s2,s4
    8000264c:	19000513          	li	a0,400
    80002650:	fffff097          	auipc	ra,0xfffff
    80002654:	d40080e7          	jalr	-704(ra) # 80001390 <_Z9mem_allocm>
    80002658:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    8000265c:	00000713          	li	a4,0
    80002660:	06300793          	li	a5,99
    80002664:	fce7cae3          	blt	a5,a4,80002638 <_Z7memTestv+0x12c>
            matrix[i][j] = i * k + j;
    80002668:	06400793          	li	a5,100
    8000266c:	029787bb          	mulw	a5,a5,s1
    80002670:	000a3683          	ld	a3,0(s4)
    80002674:	00271613          	slli	a2,a4,0x2
    80002678:	00c686b3          	add	a3,a3,a2
    8000267c:	00e787bb          	addw	a5,a5,a4
    80002680:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80002684:	0017071b          	addiw	a4,a4,1
    80002688:	fd9ff06f          	j	80002660 <_Z7memTestv+0x154>
        }
    }
    for(int i = 0; i < n; i++){
    8000268c:	00000a13          	li	s4,0
    80002690:	0780006f          	j	80002708 <_Z7memTestv+0x1fc>
        for(int j = 0; j < k; j++){
    80002694:	0014849b          	addiw	s1,s1,1
    80002698:	06300793          	li	a5,99
    8000269c:	0497ca63          	blt	a5,s1,800026f0 <_Z7memTestv+0x1e4>
            assert(matrix[i][j] == i * k + j);
    800026a0:	003a1793          	slli	a5,s4,0x3
    800026a4:	00f907b3          	add	a5,s2,a5
    800026a8:	0007b783          	ld	a5,0(a5)
    800026ac:	00249713          	slli	a4,s1,0x2
    800026b0:	00e787b3          	add	a5,a5,a4
    800026b4:	0007a703          	lw	a4,0(a5)
    800026b8:	06400793          	li	a5,100
    800026bc:	034787bb          	mulw	a5,a5,s4
    800026c0:	009787bb          	addw	a5,a5,s1
    800026c4:	fcf708e3          	beq	a4,a5,80002694 <_Z7memTestv+0x188>
    800026c8:	00005697          	auipc	a3,0x5
    800026cc:	a7068693          	addi	a3,a3,-1424 # 80007138 <CONSOLE_STATUS+0x128>
    800026d0:	04300613          	li	a2,67
    800026d4:	00005597          	auipc	a1,0x5
    800026d8:	a7458593          	addi	a1,a1,-1420 # 80007148 <CONSOLE_STATUS+0x138>
    800026dc:	00005517          	auipc	a0,0x5
    800026e0:	a8450513          	addi	a0,a0,-1404 # 80007160 <CONSOLE_STATUS+0x150>
    800026e4:	fffff097          	auipc	ra,0xfffff
    800026e8:	43c080e7          	jalr	1084(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
    800026ec:	fa9ff06f          	j	80002694 <_Z7memTestv+0x188>
        }
        mem_free(matrix[i]);
    800026f0:	003a1793          	slli	a5,s4,0x3
    800026f4:	00f907b3          	add	a5,s2,a5
    800026f8:	0007b503          	ld	a0,0(a5)
    800026fc:	fffff097          	auipc	ra,0xfffff
    80002700:	cc4080e7          	jalr	-828(ra) # 800013c0 <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    80002704:	001a0a1b          	addiw	s4,s4,1
    80002708:	06300793          	li	a5,99
    8000270c:	0147c663          	blt	a5,s4,80002718 <_Z7memTestv+0x20c>
        for(int j = 0; j < k; j++){
    80002710:	00000493          	li	s1,0
    80002714:	f85ff06f          	j	80002698 <_Z7memTestv+0x18c>
    }
    mem_free(matrix);
    80002718:	00090513          	mv	a0,s2
    8000271c:	fffff097          	auipc	ra,0xfffff
    80002720:	ca4080e7          	jalr	-860(ra) # 800013c0 <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002724:	00006797          	auipc	a5,0x6
    80002728:	b247b783          	ld	a5,-1244(a5) # 80008248 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000272c:	0007b503          	ld	a0,0(a5)
    80002730:	00001097          	auipc	ra,0x1
    80002734:	cc4080e7          	jalr	-828(ra) # 800033f4 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002738:	00050493          	mv	s1,a0
    putc('F');
    8000273c:	04600513          	li	a0,70
    80002740:	fffff097          	auipc	ra,0xfffff
    80002744:	e9c080e7          	jalr	-356(ra) # 800015dc <_Z4putcc>
    putc('r');
    80002748:	07200513          	li	a0,114
    8000274c:	fffff097          	auipc	ra,0xfffff
    80002750:	e90080e7          	jalr	-368(ra) # 800015dc <_Z4putcc>
    putc('e');
    80002754:	06500513          	li	a0,101
    80002758:	fffff097          	auipc	ra,0xfffff
    8000275c:	e84080e7          	jalr	-380(ra) # 800015dc <_Z4putcc>
    putc('e');
    80002760:	06500513          	li	a0,101
    80002764:	fffff097          	auipc	ra,0xfffff
    80002768:	e78080e7          	jalr	-392(ra) # 800015dc <_Z4putcc>
    putc(' ');
    8000276c:	02000513          	li	a0,32
    80002770:	fffff097          	auipc	ra,0xfffff
    80002774:	e6c080e7          	jalr	-404(ra) # 800015dc <_Z4putcc>
    putc('m');
    80002778:	06d00513          	li	a0,109
    8000277c:	fffff097          	auipc	ra,0xfffff
    80002780:	e60080e7          	jalr	-416(ra) # 800015dc <_Z4putcc>
    putc('e');
    80002784:	06500513          	li	a0,101
    80002788:	fffff097          	auipc	ra,0xfffff
    8000278c:	e54080e7          	jalr	-428(ra) # 800015dc <_Z4putcc>
    putc('m');
    80002790:	06d00513          	li	a0,109
    80002794:	fffff097          	auipc	ra,0xfffff
    80002798:	e48080e7          	jalr	-440(ra) # 800015dc <_Z4putcc>
    putc('o');
    8000279c:	06f00513          	li	a0,111
    800027a0:	fffff097          	auipc	ra,0xfffff
    800027a4:	e3c080e7          	jalr	-452(ra) # 800015dc <_Z4putcc>
    putc('r');
    800027a8:	07200513          	li	a0,114
    800027ac:	fffff097          	auipc	ra,0xfffff
    800027b0:	e30080e7          	jalr	-464(ra) # 800015dc <_Z4putcc>
    putc('y');
    800027b4:	07900513          	li	a0,121
    800027b8:	fffff097          	auipc	ra,0xfffff
    800027bc:	e24080e7          	jalr	-476(ra) # 800015dc <_Z4putcc>
    putc(':');
    800027c0:	03a00513          	li	a0,58
    800027c4:	fffff097          	auipc	ra,0xfffff
    800027c8:	e18080e7          	jalr	-488(ra) # 800015dc <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800027cc:	00f00913          	li	s2,15
    800027d0:	0140006f          	j	800027e4 <_Z7memTestv+0x2d8>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    800027d4:	05750513          	addi	a0,a0,87
    800027d8:	fffff097          	auipc	ra,0xfffff
    800027dc:	e04080e7          	jalr	-508(ra) # 800015dc <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800027e0:	fff9091b          	addiw	s2,s2,-1
    800027e4:	02094463          	bltz	s2,8000280c <_Z7memTestv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    800027e8:	0029151b          	slliw	a0,s2,0x2
    800027ec:	00a4d533          	srl	a0,s1,a0
    800027f0:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800027f4:	00900793          	li	a5,9
    800027f8:	fca7cee3          	blt	a5,a0,800027d4 <_Z7memTestv+0x2c8>
            putc('0' + digit);
    800027fc:	03050513          	addi	a0,a0,48
    80002800:	fffff097          	auipc	ra,0xfffff
    80002804:	ddc080e7          	jalr	-548(ra) # 800015dc <_Z4putcc>
    80002808:	fd9ff06f          	j	800027e0 <_Z7memTestv+0x2d4>
        }
    }
    putc('\n');
    8000280c:	00a00513          	li	a0,10
    80002810:	fffff097          	auipc	ra,0xfffff
    80002814:	dcc080e7          	jalr	-564(ra) # 800015dc <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    80002818:	409989b3          	sub	s3,s3,s1
    putc('D');
    8000281c:	04400513          	li	a0,68
    80002820:	fffff097          	auipc	ra,0xfffff
    80002824:	dbc080e7          	jalr	-580(ra) # 800015dc <_Z4putcc>
    putc('i');
    80002828:	06900513          	li	a0,105
    8000282c:	fffff097          	auipc	ra,0xfffff
    80002830:	db0080e7          	jalr	-592(ra) # 800015dc <_Z4putcc>
    putc('f');
    80002834:	06600513          	li	a0,102
    80002838:	fffff097          	auipc	ra,0xfffff
    8000283c:	da4080e7          	jalr	-604(ra) # 800015dc <_Z4putcc>
    putc('f');
    80002840:	06600513          	li	a0,102
    80002844:	fffff097          	auipc	ra,0xfffff
    80002848:	d98080e7          	jalr	-616(ra) # 800015dc <_Z4putcc>
    putc('e');
    8000284c:	06500513          	li	a0,101
    80002850:	fffff097          	auipc	ra,0xfffff
    80002854:	d8c080e7          	jalr	-628(ra) # 800015dc <_Z4putcc>
    putc('r');
    80002858:	07200513          	li	a0,114
    8000285c:	fffff097          	auipc	ra,0xfffff
    80002860:	d80080e7          	jalr	-640(ra) # 800015dc <_Z4putcc>
    putc('e');
    80002864:	06500513          	li	a0,101
    80002868:	fffff097          	auipc	ra,0xfffff
    8000286c:	d74080e7          	jalr	-652(ra) # 800015dc <_Z4putcc>
    putc('n');
    80002870:	06e00513          	li	a0,110
    80002874:	fffff097          	auipc	ra,0xfffff
    80002878:	d68080e7          	jalr	-664(ra) # 800015dc <_Z4putcc>
    putc('c');
    8000287c:	06300513          	li	a0,99
    80002880:	fffff097          	auipc	ra,0xfffff
    80002884:	d5c080e7          	jalr	-676(ra) # 800015dc <_Z4putcc>
    putc('e');
    80002888:	06500513          	li	a0,101
    8000288c:	fffff097          	auipc	ra,0xfffff
    80002890:	d50080e7          	jalr	-688(ra) # 800015dc <_Z4putcc>
    putc(':');
    80002894:	03a00513          	li	a0,58
    80002898:	fffff097          	auipc	ra,0xfffff
    8000289c:	d44080e7          	jalr	-700(ra) # 800015dc <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800028a0:	00f00493          	li	s1,15
    800028a4:	0140006f          	j	800028b8 <_Z7memTestv+0x3ac>
        int digit = (difference >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    800028a8:	05750513          	addi	a0,a0,87
    800028ac:	fffff097          	auipc	ra,0xfffff
    800028b0:	d30080e7          	jalr	-720(ra) # 800015dc <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800028b4:	fff4849b          	addiw	s1,s1,-1
    800028b8:	0204c463          	bltz	s1,800028e0 <_Z7memTestv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    800028bc:	0024951b          	slliw	a0,s1,0x2
    800028c0:	00a9d533          	srl	a0,s3,a0
    800028c4:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800028c8:	00900793          	li	a5,9
    800028cc:	fca7cee3          	blt	a5,a0,800028a8 <_Z7memTestv+0x39c>
            putc('0' + digit);
    800028d0:	03050513          	addi	a0,a0,48
    800028d4:	fffff097          	auipc	ra,0xfffff
    800028d8:	d08080e7          	jalr	-760(ra) # 800015dc <_Z4putcc>
    800028dc:	fd9ff06f          	j	800028b4 <_Z7memTestv+0x3a8>
        }
    }
    putc('\n');
    800028e0:	00a00513          	li	a0,10
    800028e4:	fffff097          	auipc	ra,0xfffff
    800028e8:	cf8080e7          	jalr	-776(ra) # 800015dc <_Z4putcc>
    putc('\n');
    800028ec:	00a00513          	li	a0,10
    800028f0:	fffff097          	auipc	ra,0xfffff
    800028f4:	cec080e7          	jalr	-788(ra) # 800015dc <_Z4putcc>
    putc('\n');
    800028f8:	00a00513          	li	a0,10
    800028fc:	fffff097          	auipc	ra,0xfffff
    80002900:	ce0080e7          	jalr	-800(ra) # 800015dc <_Z4putcc>
}
    80002904:	02813083          	ld	ra,40(sp)
    80002908:	02013403          	ld	s0,32(sp)
    8000290c:	01813483          	ld	s1,24(sp)
    80002910:	01013903          	ld	s2,16(sp)
    80002914:	00813983          	ld	s3,8(sp)
    80002918:	00013a03          	ld	s4,0(sp)
    8000291c:	03010113          	addi	sp,sp,48
    80002920:	00008067          	ret

0000000080002924 <_Z8usermainPv>:

void usermain(void* arg){
    80002924:	fd010113          	addi	sp,sp,-48
    80002928:	02113423          	sd	ra,40(sp)
    8000292c:	02813023          	sd	s0,32(sp)
    80002930:	00913c23          	sd	s1,24(sp)
    80002934:	03010413          	addi	s0,sp,48
    memTest();    
    80002938:	00000097          	auipc	ra,0x0
    8000293c:	bd4080e7          	jalr	-1068(ra) # 8000250c <_Z7memTestv>
    putc('0');
    80002940:	03000513          	li	a0,48
    80002944:	fffff097          	auipc	ra,0xfffff
    80002948:	c98080e7          	jalr	-872(ra) # 800015dc <_Z4putcc>
    thread_t t1, t2;
    sem_open(&sem1, 0);
    8000294c:	00006497          	auipc	s1,0x6
    80002950:	98448493          	addi	s1,s1,-1660 # 800082d0 <sem1>
    80002954:	00000593          	li	a1,0
    80002958:	00048513          	mv	a0,s1
    8000295c:	fffff097          	auipc	ra,0xfffff
    80002960:	b9c080e7          	jalr	-1124(ra) # 800014f8 <_Z8sem_openPP4_semj>
    sem_open(&sem2, 0);
    80002964:	00000593          	li	a1,0
    80002968:	00006517          	auipc	a0,0x6
    8000296c:	97050513          	addi	a0,a0,-1680 # 800082d8 <sem2>
    80002970:	fffff097          	auipc	ra,0xfffff
    80002974:	b88080e7          	jalr	-1144(ra) # 800014f8 <_Z8sem_openPP4_semj>
    thread_create(&t1, thread_test_1, 0);
    80002978:	00000613          	li	a2,0
    8000297c:	00000597          	auipc	a1,0x0
    80002980:	aa058593          	addi	a1,a1,-1376 # 8000241c <_Z13thread_test_1Pv>
    80002984:	fd840513          	addi	a0,s0,-40
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	a64080e7          	jalr	-1436(ra) # 800013ec <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002990:	00000613          	li	a2,0
    80002994:	00000597          	auipc	a1,0x0
    80002998:	af458593          	addi	a1,a1,-1292 # 80002488 <_Z13thread_test_2Pv>
    8000299c:	fd040513          	addi	a0,s0,-48
    800029a0:	fffff097          	auipc	ra,0xfffff
    800029a4:	a4c080e7          	jalr	-1460(ra) # 800013ec <_Z13thread_createPP7_threadPFvPvES2_>
    sem_wait(sem1);
    800029a8:	0004b503          	ld	a0,0(s1)
    800029ac:	fffff097          	auipc	ra,0xfffff
    800029b0:	bb0080e7          	jalr	-1104(ra) # 8000155c <_Z8sem_waitP4_sem>
    putc('3');
    800029b4:	03300513          	li	a0,51
    800029b8:	fffff097          	auipc	ra,0xfffff
    800029bc:	c24080e7          	jalr	-988(ra) # 800015dc <_Z4putcc>
    // thread_join(t2);
    // if(getc() == 'a')putc('x');
    putc('4');
    800029c0:	03400513          	li	a0,52
    800029c4:	fffff097          	auipc	ra,0xfffff
    800029c8:	c18080e7          	jalr	-1000(ra) # 800015dc <_Z4putcc>
    thread_join(t1);
    800029cc:	fd843503          	ld	a0,-40(s0)
    800029d0:	fffff097          	auipc	ra,0xfffff
    800029d4:	ad8080e7          	jalr	-1320(ra) # 800014a8 <_Z11thread_joinP7_thread>
    // thread_dispatch();
    // thread_dispatch();
    sem_wait(sem2);
    800029d8:	0084b503          	ld	a0,8(s1)
    800029dc:	fffff097          	auipc	ra,0xfffff
    800029e0:	b80080e7          	jalr	-1152(ra) # 8000155c <_Z8sem_waitP4_sem>
    putc('5');
    800029e4:	03500513          	li	a0,53
    800029e8:	fffff097          	auipc	ra,0xfffff
    800029ec:	bf4080e7          	jalr	-1036(ra) # 800015dc <_Z4putcc>
    sem_close(sem1);
    800029f0:	0004b503          	ld	a0,0(s1)
    800029f4:	fffff097          	auipc	ra,0xfffff
    800029f8:	b3c080e7          	jalr	-1220(ra) # 80001530 <_Z9sem_closeP4_sem>
    sem_close(sem2);
    800029fc:	0084b503          	ld	a0,8(s1)
    80002a00:	fffff097          	auipc	ra,0xfffff
    80002a04:	b30080e7          	jalr	-1232(ra) # 80001530 <_Z9sem_closeP4_sem>


    putc('\n');
    80002a08:	00a00513          	li	a0,10
    80002a0c:	fffff097          	auipc	ra,0xfffff
    80002a10:	bd0080e7          	jalr	-1072(ra) # 800015dc <_Z4putcc>
    80002a14:	02813083          	ld	ra,40(sp)
    80002a18:	02013403          	ld	s0,32(sp)
    80002a1c:	01813483          	ld	s1,24(sp)
    80002a20:	03010113          	addi	sp,sp,48
    80002a24:	00008067          	ret

0000000080002a28 <_ZN7_threadC1EPFvPvES0_>:
#include "syscalls_c.h"
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    80002a28:	ff010113          	addi	sp,sp,-16
    80002a2c:	00813423          	sd	s0,8(sp)
    80002a30:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80002a34:	00053023          	sd	zero,0(a0)
    80002a38:	00053423          	sd	zero,8(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80002a3c:	00006717          	auipc	a4,0x6
    80002a40:	8a470713          	addi	a4,a4,-1884 # 800082e0 <_ZN7_thread6nextIDE>
    80002a44:	00072783          	lw	a5,0(a4)
    80002a48:	0017869b          	addiw	a3,a5,1
    80002a4c:	00d72023          	sw	a3,0(a4)
    80002a50:	08f52c23          	sw	a5,152(a0)
    closed = 0;
    80002a54:	09c52783          	lw	a5,156(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002a58:	0015b593          	seqz	a1,a1
    80002a5c:	0045959b          	slliw	a1,a1,0x4
    80002a60:	fe07f793          	andi	a5,a5,-32
    80002a64:	00b7e7b3          	or	a5,a5,a1
    80002a68:	08f52e23          	sw	a5,156(a0)
    reserved = 0;
    80002a6c:	0a052783          	lw	a5,160(a0)
    80002a70:	f0000737          	lui	a4,0xf0000
    80002a74:	00e7f7b3          	and	a5,a5,a4
    80002a78:	0af52023          	sw	a5,160(a0)
    joinHead = 0;
    80002a7c:	06053c23          	sd	zero,120(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    80002a80:	00200793          	li	a5,2
    80002a84:	08f53423          	sd	a5,136(a0)
    stackStart = 0;
    80002a88:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    80002a8c:	00053823          	sd	zero,16(a0)
    context.s1 = 0;
    80002a90:	00053c23          	sd	zero,24(a0)
    context.s2 = 0;
    80002a94:	02053023          	sd	zero,32(a0)
    context.s3 = 0;
    80002a98:	02053423          	sd	zero,40(a0)
    context.s4 = 0;
    80002a9c:	02053823          	sd	zero,48(a0)
    context.s5 = 0;
    80002aa0:	02053c23          	sd	zero,56(a0)
    context.s6 = 0;
    80002aa4:	04053023          	sd	zero,64(a0)
    context.s7 = 0;
    80002aa8:	04053423          	sd	zero,72(a0)
    context.s8 = 0;
    80002aac:	04053823          	sd	zero,80(a0)
    context.s9 = 0;
    80002ab0:	04053c23          	sd	zero,88(a0)
    context.s10 = 0;
    80002ab4:	06053023          	sd	zero,96(a0)
    context.s11 = 0;
    80002ab8:	06053423          	sd	zero,104(a0)

    context.sstatus = 0;
    80002abc:	06053823          	sd	zero,112(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002ac0:	00000797          	auipc	a5,0x0
    80002ac4:	55878793          	addi	a5,a5,1368 # 80003018 <_ZN7_thread7wrapperEv>
    80002ac8:	00f53023          	sd	a5,0(a0)
}
    80002acc:	00813403          	ld	s0,8(sp)
    80002ad0:	01010113          	addi	sp,sp,16
    80002ad4:	00008067          	ret

0000000080002ad8 <_Z10popSppSpieb>:

void popSppSpie(bool kernel = false){
    80002ad8:	ff010113          	addi	sp,sp,-16
    80002adc:	00813423          	sd	s0,8(sp)
    80002ae0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002ae4:	14109073          	csrw	sepc,ra
    if(kernel){
    80002ae8:	00050e63          	beqz	a0,80002b04 <_Z10popSppSpieb+0x2c>
        __asm__ volatile ("csrs sstatus, %0" :: "r" (1 << 8));
    80002aec:	10000793          	li	a5,256
    80002af0:	1007a073          	csrs	sstatus,a5
    }else{
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    }
    __asm__ volatile ("sret");
    80002af4:	10200073          	sret
}
    80002af8:	00813403          	ld	s0,8(sp)
    80002afc:	01010113          	addi	sp,sp,16
    80002b00:	00008067          	ret
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002b04:	10000793          	li	a5,256
    80002b08:	1007b073          	csrc	sstatus,a5
    80002b0c:	fe9ff06f          	j	80002af4 <_Z10popSppSpieb+0x1c>

0000000080002b10 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002b10:	fe010113          	addi	sp,sp,-32
    80002b14:	00113c23          	sd	ra,24(sp)
    80002b18:	00813823          	sd	s0,16(sp)
    80002b1c:	00913423          	sd	s1,8(sp)
    80002b20:	01213023          	sd	s2,0(sp)
    80002b24:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80002b28:	07853483          	ld	s1,120(a0)
    while(current != 0){
    80002b2c:	0c048e63          	beqz	s1,80002c08 <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    80002b30:	0004c503          	lbu	a0,0(s1)
    80002b34:	0014c783          	lbu	a5,1(s1)
    80002b38:	00879793          	slli	a5,a5,0x8
    80002b3c:	00a7e7b3          	or	a5,a5,a0
    80002b40:	0024c503          	lbu	a0,2(s1)
    80002b44:	01051513          	slli	a0,a0,0x10
    80002b48:	00f567b3          	or	a5,a0,a5
    80002b4c:	0034c503          	lbu	a0,3(s1)
    80002b50:	01851513          	slli	a0,a0,0x18
    80002b54:	00f56533          	or	a0,a0,a5
    80002b58:	0044c783          	lbu	a5,4(s1)
    80002b5c:	02079793          	slli	a5,a5,0x20
    80002b60:	00a7e533          	or	a0,a5,a0
    80002b64:	0054c783          	lbu	a5,5(s1)
    80002b68:	02879793          	slli	a5,a5,0x28
    80002b6c:	00a7e7b3          	or	a5,a5,a0
    80002b70:	0064c503          	lbu	a0,6(s1)
    80002b74:	03051513          	slli	a0,a0,0x30
    80002b78:	00f567b3          	or	a5,a0,a5
    80002b7c:	0074c503          	lbu	a0,7(s1)
    80002b80:	03851513          	slli	a0,a0,0x38
    80002b84:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80002b88:	09c52783          	lw	a5,156(a0)
    80002b8c:	ffd7f793          	andi	a5,a5,-3
    80002b90:	08f52e23          	sw	a5,156(a0)
        Scheduler::put(thread);
    80002b94:	00001097          	auipc	ra,0x1
    80002b98:	73c080e7          	jalr	1852(ra) # 800042d0 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80002b9c:	0084c903          	lbu	s2,8(s1)
    80002ba0:	0094c783          	lbu	a5,9(s1)
    80002ba4:	00879793          	slli	a5,a5,0x8
    80002ba8:	0127e7b3          	or	a5,a5,s2
    80002bac:	00a4c903          	lbu	s2,10(s1)
    80002bb0:	01091913          	slli	s2,s2,0x10
    80002bb4:	00f967b3          	or	a5,s2,a5
    80002bb8:	00b4c903          	lbu	s2,11(s1)
    80002bbc:	01891913          	slli	s2,s2,0x18
    80002bc0:	00f96933          	or	s2,s2,a5
    80002bc4:	00c4c783          	lbu	a5,12(s1)
    80002bc8:	02079793          	slli	a5,a5,0x20
    80002bcc:	0127e933          	or	s2,a5,s2
    80002bd0:	00d4c783          	lbu	a5,13(s1)
    80002bd4:	02879793          	slli	a5,a5,0x28
    80002bd8:	0127e7b3          	or	a5,a5,s2
    80002bdc:	00e4c903          	lbu	s2,14(s1)
    80002be0:	03091913          	slli	s2,s2,0x30
    80002be4:	00f967b3          	or	a5,s2,a5
    80002be8:	00f4c903          	lbu	s2,15(s1)
    80002bec:	03891913          	slli	s2,s2,0x38
    80002bf0:	00f96933          	or	s2,s2,a5
        mem_free(current);
    80002bf4:	00048513          	mv	a0,s1
    80002bf8:	ffffe097          	auipc	ra,0xffffe
    80002bfc:	7c8080e7          	jalr	1992(ra) # 800013c0 <_Z8mem_freePv>
        current = next;
    80002c00:	00090493          	mv	s1,s2
    while(current != 0){
    80002c04:	f29ff06f          	j	80002b2c <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80002c08:	01813083          	ld	ra,24(sp)
    80002c0c:	01013403          	ld	s0,16(sp)
    80002c10:	00813483          	ld	s1,8(sp)
    80002c14:	00013903          	ld	s2,0(sp)
    80002c18:	02010113          	addi	sp,sp,32
    80002c1c:	00008067          	ret

0000000080002c20 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80002c20:	fc010113          	addi	sp,sp,-64
    80002c24:	02113c23          	sd	ra,56(sp)
    80002c28:	02813823          	sd	s0,48(sp)
    80002c2c:	02913423          	sd	s1,40(sp)
    80002c30:	03213023          	sd	s2,32(sp)
    80002c34:	01313c23          	sd	s3,24(sp)
    80002c38:	01413823          	sd	s4,16(sp)
    80002c3c:	01513423          	sd	s5,8(sp)
    80002c40:	04010413          	addi	s0,sp,64
    80002c44:	00050493          	mv	s1,a0
    80002c48:	00058913          	mv	s2,a1
    80002c4c:	00060a93          	mv	s5,a2
    80002c50:	00068993          	mv	s3,a3
    80002c54:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    80002c58:	0b800513          	li	a0,184
    80002c5c:	ffffe097          	auipc	ra,0xffffe
    80002c60:	734080e7          	jalr	1844(ra) # 80001390 <_Z9mem_allocm>
    80002c64:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80002c68:	18050063          	beqz	a0,80002de8 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    80002c6c:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    80002c70:	0004b783          	ld	a5,0(s1)
    80002c74:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80002c78:	00005717          	auipc	a4,0x5
    80002c7c:	66870713          	addi	a4,a4,1640 # 800082e0 <_ZN7_thread6nextIDE>
    80002c80:	00072783          	lw	a5,0(a4)
    80002c84:	0017869b          	addiw	a3,a5,1
    80002c88:	00d72023          	sw	a3,0(a4)
    80002c8c:	0004b703          	ld	a4,0(s1)
    80002c90:	08f72c23          	sw	a5,152(a4)
    (*thread)->closed = false;
    80002c94:	0004b703          	ld	a4,0(s1)
    80002c98:	09c72783          	lw	a5,156(a4)
    80002c9c:	ffe7f793          	andi	a5,a5,-2
    80002ca0:	08f72e23          	sw	a5,156(a4)
    (*thread)->blocked = false;
    80002ca4:	0004b703          	ld	a4,0(s1)
    80002ca8:	09c72783          	lw	a5,156(a4)
    80002cac:	ffd7f793          	andi	a5,a5,-3
    80002cb0:	08f72e23          	sw	a5,156(a4)
    (*thread)->sleeping = false;
    80002cb4:	0004b703          	ld	a4,0(s1)
    80002cb8:	09c72783          	lw	a5,156(a4)
    80002cbc:	ffb7f793          	andi	a5,a5,-5
    80002cc0:	08f72e23          	sw	a5,156(a4)
    (*thread)->finished = false;
    80002cc4:	0004b703          	ld	a4,0(s1)
    80002cc8:	09c72783          	lw	a5,156(a4)
    80002ccc:	ff77f793          	andi	a5,a5,-9
    80002cd0:	08f72e23          	sw	a5,156(a4)
    (*thread)->kernel = (function == 0);
    80002cd4:	0004b703          	ld	a4,0(s1)
    80002cd8:	00193913          	seqz	s2,s2
    80002cdc:	0049191b          	slliw	s2,s2,0x4
    80002ce0:	09c72783          	lw	a5,156(a4)
    80002ce4:	fef7f793          	andi	a5,a5,-17
    80002ce8:	0127e933          	or	s2,a5,s2
    80002cec:	09272e23          	sw	s2,156(a4)
    (*thread)->reserved = 0;
    80002cf0:	0004b703          	ld	a4,0(s1)
    80002cf4:	0a072783          	lw	a5,160(a4)
    80002cf8:	f00006b7          	lui	a3,0xf0000
    80002cfc:	00d7f7b3          	and	a5,a5,a3
    80002d00:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = 0;
    80002d04:	0004b783          	ld	a5,0(s1)
    80002d08:	0607bc23          	sd	zero,120(a5)
    (*thread)->joinTail = 0;
    80002d0c:	0004b783          	ld	a5,0(s1)
    80002d10:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    80002d14:	0004b783          	ld	a5,0(s1)
    80002d18:	00200713          	li	a4,2
    80002d1c:	08e7b423          	sd	a4,136(a5)
    (*thread)->stackStart = 0;
    80002d20:	0004b783          	ld	a5,0(s1)
    80002d24:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    80002d28:	0004b783          	ld	a5,0(s1)
    80002d2c:	0007b823          	sd	zero,16(a5)
    (*thread)->context.s1 = 0;
    80002d30:	0004b783          	ld	a5,0(s1)
    80002d34:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s2 = 0;
    80002d38:	0004b783          	ld	a5,0(s1)
    80002d3c:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s3 = 0;
    80002d40:	0004b783          	ld	a5,0(s1)
    80002d44:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s4 = 0;
    80002d48:	0004b783          	ld	a5,0(s1)
    80002d4c:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s5 = 0;
    80002d50:	0004b783          	ld	a5,0(s1)
    80002d54:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s6 = 0;
    80002d58:	0004b783          	ld	a5,0(s1)
    80002d5c:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s7 = 0;
    80002d60:	0004b783          	ld	a5,0(s1)
    80002d64:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s8 = 0;
    80002d68:	0004b783          	ld	a5,0(s1)
    80002d6c:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s9 = 0;
    80002d70:	0004b783          	ld	a5,0(s1)
    80002d74:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s10 = 0;
    80002d78:	0004b783          	ld	a5,0(s1)
    80002d7c:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s11 = 0;
    80002d80:	0004b783          	ld	a5,0(s1)
    80002d84:	0607b423          	sd	zero,104(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80002d88:	0004b783          	ld	a5,0(s1)
    80002d8c:	0137b423          	sd	s3,8(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80002d90:	0004b783          	ld	a5,0(s1)
    80002d94:	00000717          	auipc	a4,0x0
    80002d98:	28470713          	addi	a4,a4,644 # 80003018 <_ZN7_thread7wrapperEv>
    80002d9c:	00e7b023          	sd	a4,0(a5)

    (*thread)->stackStart = stack;
    80002da0:	0004b783          	ld	a5,0(s1)
    80002da4:	0937b823          	sd	s3,144(a5)
    if(start){
    80002da8:	020a1663          	bnez	s4,80002dd4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    80002dac:	00000513          	li	a0,0
}
    80002db0:	03813083          	ld	ra,56(sp)
    80002db4:	03013403          	ld	s0,48(sp)
    80002db8:	02813483          	ld	s1,40(sp)
    80002dbc:	02013903          	ld	s2,32(sp)
    80002dc0:	01813983          	ld	s3,24(sp)
    80002dc4:	01013a03          	ld	s4,16(sp)
    80002dc8:	00813a83          	ld	s5,8(sp)
    80002dcc:	04010113          	addi	sp,sp,64
    80002dd0:	00008067          	ret
        Scheduler::put(*thread);
    80002dd4:	0004b503          	ld	a0,0(s1)
    80002dd8:	00001097          	auipc	ra,0x1
    80002ddc:	4f8080e7          	jalr	1272(ra) # 800042d0 <_ZN9Scheduler3putEP7_thread>
    return 0;
    80002de0:	00000513          	li	a0,0
    80002de4:	fcdff06f          	j	80002db0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    80002de8:	fff00513          	li	a0,-1
    80002dec:	fc5ff06f          	j	80002db0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

0000000080002df0 <_ZN7_thread4joinEPS_>:

void _thread::join(thread_t thread){
    /// cannot join to a finished or closed thread
    if(thread->finished || thread->closed){
    80002df0:	0985b783          	ld	a5,152(a1)
    80002df4:	00900713          	li	a4,9
    80002df8:	02071713          	slli	a4,a4,0x20
    80002dfc:	00e7f7b3          	and	a5,a5,a4
    80002e00:	00078463          	beqz	a5,80002e08 <_ZN7_thread4joinEPS_+0x18>
    80002e04:	00008067          	ret
void _thread::join(thread_t thread){
    80002e08:	fe010113          	addi	sp,sp,-32
    80002e0c:	00113c23          	sd	ra,24(sp)
    80002e10:	00813823          	sd	s0,16(sp)
    80002e14:	00913423          	sd	s1,8(sp)
    80002e18:	01213023          	sd	s2,0(sp)
    80002e1c:	02010413          	addi	s0,sp,32
    80002e20:	00050493          	mv	s1,a0
    80002e24:	00058913          	mv	s2,a1
        return;
    }
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    80002e28:	01000513          	li	a0,16
    80002e2c:	ffffe097          	auipc	ra,0xffffe
    80002e30:	564080e7          	jalr	1380(ra) # 80001390 <_Z9mem_allocm>
    this->blocked = true;
    80002e34:	09c4a703          	lw	a4,156(s1)
    80002e38:	00276713          	ori	a4,a4,2
    80002e3c:	08e4ae23          	sw	a4,156(s1)
    newJoin->thread = this;
    80002e40:	00950023          	sb	s1,0(a0)
    80002e44:	0084d713          	srli	a4,s1,0x8
    80002e48:	00e500a3          	sb	a4,1(a0)
    80002e4c:	0104d713          	srli	a4,s1,0x10
    80002e50:	00e50123          	sb	a4,2(a0)
    80002e54:	0184d71b          	srliw	a4,s1,0x18
    80002e58:	00e501a3          	sb	a4,3(a0)
    80002e5c:	0204d713          	srli	a4,s1,0x20
    80002e60:	00e50223          	sb	a4,4(a0)
    80002e64:	0284d713          	srli	a4,s1,0x28
    80002e68:	00e502a3          	sb	a4,5(a0)
    80002e6c:	0304d713          	srli	a4,s1,0x30
    80002e70:	00e50323          	sb	a4,6(a0)
    80002e74:	0384d493          	srli	s1,s1,0x38
    80002e78:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80002e7c:	00050423          	sb	zero,8(a0)
    80002e80:	000504a3          	sb	zero,9(a0)
    80002e84:	00050523          	sb	zero,10(a0)
    80002e88:	000505a3          	sb	zero,11(a0)
    80002e8c:	00050623          	sb	zero,12(a0)
    80002e90:	000506a3          	sb	zero,13(a0)
    80002e94:	00050723          	sb	zero,14(a0)
    80002e98:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    80002e9c:	07893703          	ld	a4,120(s2)
    80002ea0:	06070463          	beqz	a4,80002f08 <_ZN7_thread4joinEPS_+0x118>
        thread->joinHead = newJoin;
        thread->joinTail = newJoin;
    }else{
        thread->joinTail->next = newJoin;
    80002ea4:	08093703          	ld	a4,128(s2)
    80002ea8:	00a70423          	sb	a0,8(a4)
    80002eac:	00855693          	srli	a3,a0,0x8
    80002eb0:	00d704a3          	sb	a3,9(a4)
    80002eb4:	01055693          	srli	a3,a0,0x10
    80002eb8:	00d70523          	sb	a3,10(a4)
    80002ebc:	0185569b          	srliw	a3,a0,0x18
    80002ec0:	00d705a3          	sb	a3,11(a4)
    80002ec4:	02055693          	srli	a3,a0,0x20
    80002ec8:	00d70623          	sb	a3,12(a4)
    80002ecc:	02855693          	srli	a3,a0,0x28
    80002ed0:	00d706a3          	sb	a3,13(a4)
    80002ed4:	03055693          	srli	a3,a0,0x30
    80002ed8:	00d70723          	sb	a3,14(a4)
    80002edc:	03855693          	srli	a3,a0,0x38
    80002ee0:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    80002ee4:	08a93023          	sd	a0,128(s2)
    }
    thread_dispatch();
    80002ee8:	ffffe097          	auipc	ra,0xffffe
    80002eec:	5a0080e7          	jalr	1440(ra) # 80001488 <_Z15thread_dispatchv>
}
    80002ef0:	01813083          	ld	ra,24(sp)
    80002ef4:	01013403          	ld	s0,16(sp)
    80002ef8:	00813483          	ld	s1,8(sp)
    80002efc:	00013903          	ld	s2,0(sp)
    80002f00:	02010113          	addi	sp,sp,32
    80002f04:	00008067          	ret
        thread->joinHead = newJoin;
    80002f08:	06a93c23          	sd	a0,120(s2)
        thread->joinTail = newJoin;
    80002f0c:	08a93023          	sd	a0,128(s2)
    80002f10:	fd9ff06f          	j	80002ee8 <_ZN7_thread4joinEPS_+0xf8>

0000000080002f14 <_ZN7_thread4tickEv>:

int _thread::tick(){
    if(currentThread->blocked){
    80002f14:	00005797          	auipc	a5,0x5
    80002f18:	3d47b783          	ld	a5,980(a5) # 800082e8 <_ZN7_thread13currentThreadE>
    80002f1c:	09c7a783          	lw	a5,156(a5)
    80002f20:	0027f713          	andi	a4,a5,2
    80002f24:	06071063          	bnez	a4,80002f84 <_ZN7_thread4tickEv+0x70>
        return -1;
    }
    if(currentThread->closed){
    80002f28:	0017f713          	andi	a4,a5,1
    80002f2c:	06071063          	bnez	a4,80002f8c <_ZN7_thread4tickEv+0x78>
        return -2;
    }
    if(currentThread->sleeping){
    80002f30:	0047f713          	andi	a4,a5,4
    80002f34:	06071063          	bnez	a4,80002f94 <_ZN7_thread4tickEv+0x80>
        return -3;
    }
    if(currentThread->finished){
    80002f38:	0087f793          	andi	a5,a5,8
    80002f3c:	06079063          	bnez	a5,80002f9c <_ZN7_thread4tickEv+0x88>
        return -4;
    }
    timeLeft --;
    80002f40:	08853783          	ld	a5,136(a0)
    80002f44:	fff78793          	addi	a5,a5,-1
    80002f48:	08f53423          	sd	a5,136(a0)
    if(timeLeft == 0){
    80002f4c:	00078663          	beqz	a5,80002f58 <_ZN7_thread4tickEv+0x44>
        thread_dispatch();
    }
    return 0;
    80002f50:	00000513          	li	a0,0
}
    80002f54:	00008067          	ret
int _thread::tick(){
    80002f58:	ff010113          	addi	sp,sp,-16
    80002f5c:	00113423          	sd	ra,8(sp)
    80002f60:	00813023          	sd	s0,0(sp)
    80002f64:	01010413          	addi	s0,sp,16
        thread_dispatch();
    80002f68:	ffffe097          	auipc	ra,0xffffe
    80002f6c:	520080e7          	jalr	1312(ra) # 80001488 <_Z15thread_dispatchv>
    return 0;
    80002f70:	00000513          	li	a0,0
}
    80002f74:	00813083          	ld	ra,8(sp)
    80002f78:	00013403          	ld	s0,0(sp)
    80002f7c:	01010113          	addi	sp,sp,16
    80002f80:	00008067          	ret
        return -1;
    80002f84:	fff00513          	li	a0,-1
    80002f88:	00008067          	ret
        return -2;
    80002f8c:	ffe00513          	li	a0,-2
    80002f90:	00008067          	ret
        return -3;
    80002f94:	ffd00513          	li	a0,-3
    80002f98:	00008067          	ret
        return -4;
    80002f9c:	ffc00513          	li	a0,-4
    80002fa0:	00008067          	ret

0000000080002fa4 <_ZN7_thread4exitEv>:

int _thread::exit(){
    if(currentThread->closed){
    80002fa4:	00005717          	auipc	a4,0x5
    80002fa8:	34473703          	ld	a4,836(a4) # 800082e8 <_ZN7_thread13currentThreadE>
    80002fac:	09c72783          	lw	a5,156(a4)
    80002fb0:	0017f693          	andi	a3,a5,1
    80002fb4:	04069663          	bnez	a3,80003000 <_ZN7_thread4exitEv+0x5c>
        return -1;
    }
    if(currentThread->blocked){
    80002fb8:	0027f693          	andi	a3,a5,2
    80002fbc:	04069663          	bnez	a3,80003008 <_ZN7_thread4exitEv+0x64>
        return -2;
    }
    if(currentThread->sleeping){
    80002fc0:	0047f793          	andi	a5,a5,4
    80002fc4:	04079663          	bnez	a5,80003010 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    80002fc8:	ff010113          	addi	sp,sp,-16
    80002fcc:	00113423          	sd	ra,8(sp)
    80002fd0:	00813023          	sd	s0,0(sp)
    80002fd4:	01010413          	addi	s0,sp,16
        return -3;
    }
    currentThread->finished = 1;
    80002fd8:	09c72783          	lw	a5,156(a4)
    80002fdc:	0087e793          	ori	a5,a5,8
    80002fe0:	08f72e23          	sw	a5,156(a4)
    thread_dispatch();
    80002fe4:	ffffe097          	auipc	ra,0xffffe
    80002fe8:	4a4080e7          	jalr	1188(ra) # 80001488 <_Z15thread_dispatchv>
    return 0;
    80002fec:	00000513          	li	a0,0
}
    80002ff0:	00813083          	ld	ra,8(sp)
    80002ff4:	00013403          	ld	s0,0(sp)
    80002ff8:	01010113          	addi	sp,sp,16
    80002ffc:	00008067          	ret
        return -1;
    80003000:	fff00513          	li	a0,-1
    80003004:	00008067          	ret
        return -2;
    80003008:	ffe00513          	li	a0,-2
    8000300c:	00008067          	ret
        return -3;
    80003010:	ffd00513          	li	a0,-3
}
    80003014:	00008067          	ret

0000000080003018 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80003018:	fe010113          	addi	sp,sp,-32
    8000301c:	00113c23          	sd	ra,24(sp)
    80003020:	00813823          	sd	s0,16(sp)
    80003024:	00913423          	sd	s1,8(sp)
    80003028:	02010413          	addi	s0,sp,32
    popSppSpie(currentThread->kernel);
    8000302c:	00005497          	auipc	s1,0x5
    80003030:	2b448493          	addi	s1,s1,692 # 800082e0 <_ZN7_thread6nextIDE>
    80003034:	0084b783          	ld	a5,8(s1)
    80003038:	09c7a503          	lw	a0,156(a5)
    8000303c:	4045551b          	sraiw	a0,a0,0x4
    80003040:	00157513          	andi	a0,a0,1
    80003044:	00000097          	auipc	ra,0x0
    80003048:	a94080e7          	jalr	-1388(ra) # 80002ad8 <_Z10popSppSpieb>
    currentThread->function(currentThread->arg);
    8000304c:	0084b783          	ld	a5,8(s1)
    80003050:	0a87b703          	ld	a4,168(a5)
    80003054:	0b07b503          	ld	a0,176(a5)
    80003058:	000700e7          	jalr	a4
    currentThread->unJoin();
    8000305c:	0084b503          	ld	a0,8(s1)
    80003060:	00000097          	auipc	ra,0x0
    80003064:	ab0080e7          	jalr	-1360(ra) # 80002b10 <_ZN7_thread6unJoinEv>
    exit();
    80003068:	00000097          	auipc	ra,0x0
    8000306c:	f3c080e7          	jalr	-196(ra) # 80002fa4 <_ZN7_thread4exitEv>
}
    80003070:	01813083          	ld	ra,24(sp)
    80003074:	01013403          	ld	s0,16(sp)
    80003078:	00813483          	ld	s1,8(sp)
    8000307c:	02010113          	addi	sp,sp,32
    80003080:	00008067          	ret

0000000080003084 <_ZN7_thread10setBlockedEb>:

void _thread::setBlocked(bool blocked){
    80003084:	ff010113          	addi	sp,sp,-16
    80003088:	00813423          	sd	s0,8(sp)
    8000308c:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80003090:	0015f593          	andi	a1,a1,1
    80003094:	0015979b          	slliw	a5,a1,0x1
    80003098:	09c52583          	lw	a1,156(a0)
    8000309c:	ffd5f593          	andi	a1,a1,-3
    800030a0:	00f5e5b3          	or	a1,a1,a5
    800030a4:	08b52e23          	sw	a1,156(a0)
}
    800030a8:	00813403          	ld	s0,8(sp)
    800030ac:	01010113          	addi	sp,sp,16
    800030b0:	00008067          	ret

00000000800030b4 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    800030b4:	ff010113          	addi	sp,sp,-16
    800030b8:	00813423          	sd	s0,8(sp)
    800030bc:	01010413          	addi	s0,sp,16
    this->closed = closed;
    800030c0:	0015f793          	andi	a5,a1,1
    800030c4:	09c52583          	lw	a1,156(a0)
    800030c8:	ffe5f593          	andi	a1,a1,-2
    800030cc:	00f5e5b3          	or	a1,a1,a5
    800030d0:	08b52e23          	sw	a1,156(a0)
}
    800030d4:	00813403          	ld	s0,8(sp)
    800030d8:	01010113          	addi	sp,sp,16
    800030dc:	00008067          	ret

00000000800030e0 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    800030e0:	ff010113          	addi	sp,sp,-16
    800030e4:	00813423          	sd	s0,8(sp)
    800030e8:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    800030ec:	0015f593          	andi	a1,a1,1
    800030f0:	0025979b          	slliw	a5,a1,0x2
    800030f4:	09c52583          	lw	a1,156(a0)
    800030f8:	ffb5f593          	andi	a1,a1,-5
    800030fc:	00f5e5b3          	or	a1,a1,a5
    80003100:	08b52e23          	sw	a1,156(a0)
}
    80003104:	00813403          	ld	s0,8(sp)
    80003108:	01010113          	addi	sp,sp,16
    8000310c:	00008067          	ret

0000000080003110 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
        Scheduler::put(oldThread);
    }
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    80003110:	ff010113          	addi	sp,sp,-16
    80003114:	00813423          	sd	s0,8(sp)
    80003118:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    8000311c:	04050263          	beqz	a0,80003160 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    80003120:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    80003124:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    80003128:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    8000312c:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    80003130:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    80003134:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    80003138:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    8000313c:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    80003140:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    80003144:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    80003148:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    8000314c:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    80003150:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    80003154:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80003158:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    8000315c:	06853823          	sd	s0,112(a0)
    }
    
    
    if(newContext->sp != 0){
    80003160:	0085b783          	ld	a5,8(a1)
    80003164:	00078463          	beqz	a5,8000316c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    80003168:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    8000316c:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    80003170:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    80003174:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80003178:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    8000317c:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80003180:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80003184:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80003188:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    8000318c:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80003190:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80003194:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    80003198:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    8000319c:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    800031a0:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    800031a4:	0685bd83          	ld	s11,104(a1)

    return;

}
    800031a8:	00813403          	ld	s0,8(sp)
    800031ac:	01010113          	addi	sp,sp,16
    800031b0:	00008067          	ret

00000000800031b4 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    800031b4:	fe010113          	addi	sp,sp,-32
    800031b8:	00113c23          	sd	ra,24(sp)
    800031bc:	00813823          	sd	s0,16(sp)
    800031c0:	00913423          	sd	s1,8(sp)
    800031c4:	01213023          	sd	s2,0(sp)
    800031c8:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    800031cc:	00005917          	auipc	s2,0x5
    800031d0:	11490913          	addi	s2,s2,276 # 800082e0 <_ZN7_thread6nextIDE>
    800031d4:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    800031d8:	00001097          	auipc	ra,0x1
    800031dc:	2e8080e7          	jalr	744(ra) # 800044c0 <_ZN9Scheduler3getEv>
    800031e0:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    800031e4:	00200793          	li	a5,2
    800031e8:	08f4b423          	sd	a5,136(s1)
    if(currentThread == 0){
    800031ec:	04050463          	beqz	a0,80003234 <_ZN7_thread8dispatchEv+0x80>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    800031f0:	00048c63          	beqz	s1,80003208 <_ZN7_thread8dispatchEv+0x54>
    800031f4:	0984b783          	ld	a5,152(s1)
    800031f8:	00f00713          	li	a4,15
    800031fc:	02071713          	slli	a4,a4,0x20
    80003200:	00e7f7b3          	and	a5,a5,a4
    80003204:	02078e63          	beqz	a5,80003240 <_ZN7_thread8dispatchEv+0x8c>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    80003208:	00005597          	auipc	a1,0x5
    8000320c:	0e05b583          	ld	a1,224(a1) # 800082e8 <_ZN7_thread13currentThreadE>
    80003210:	00048513          	mv	a0,s1
    80003214:	00000097          	auipc	ra,0x0
    80003218:	efc080e7          	jalr	-260(ra) # 80003110 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    8000321c:	01813083          	ld	ra,24(sp)
    80003220:	01013403          	ld	s0,16(sp)
    80003224:	00813483          	ld	s1,8(sp)
    80003228:	00013903          	ld	s2,0(sp)
    8000322c:	02010113          	addi	sp,sp,32
    80003230:	00008067          	ret
        currentThread = oldThread;
    80003234:	00005797          	auipc	a5,0x5
    80003238:	0a97ba23          	sd	s1,180(a5) # 800082e8 <_ZN7_thread13currentThreadE>
        return;
    8000323c:	fe1ff06f          	j	8000321c <_ZN7_thread8dispatchEv+0x68>
        Scheduler::put(oldThread);
    80003240:	00048513          	mv	a0,s1
    80003244:	00001097          	auipc	ra,0x1
    80003248:	08c080e7          	jalr	140(ra) # 800042d0 <_ZN9Scheduler3putEP7_thread>
    8000324c:	fbdff06f          	j	80003208 <_ZN7_thread8dispatchEv+0x54>

0000000080003250 <_ZN11HeapManagerC1Ev>:
#include "hw.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80003250:	fe010113          	addi	sp,sp,-32
    80003254:	00113c23          	sd	ra,24(sp)
    80003258:	00813823          	sd	s0,16(sp)
    8000325c:	00913423          	sd	s1,8(sp)
    80003260:	02010413          	addi	s0,sp,32
    80003264:	00050493          	mv	s1,a0
    assert(instance == 0);
    80003268:	00005797          	auipc	a5,0x5
    8000326c:	0887b783          	ld	a5,136(a5) # 800082f0 <_ZN11HeapManager8instanceE>
    80003270:	02079063          	bnez	a5,80003290 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80003274:	00005797          	auipc	a5,0x5
    80003278:	0697be23          	sd	s1,124(a5) # 800082f0 <_ZN11HeapManager8instanceE>
}
    8000327c:	01813083          	ld	ra,24(sp)
    80003280:	01013403          	ld	s0,16(sp)
    80003284:	00813483          	ld	s1,8(sp)
    80003288:	02010113          	addi	sp,sp,32
    8000328c:	00008067          	ret
    assert(instance == 0);
    80003290:	00004697          	auipc	a3,0x4
    80003294:	ef068693          	addi	a3,a3,-272 # 80007180 <CONSOLE_STATUS+0x170>
    80003298:	01300613          	li	a2,19
    8000329c:	00004597          	auipc	a1,0x4
    800032a0:	f0458593          	addi	a1,a1,-252 # 800071a0 <CONSOLE_STATUS+0x190>
    800032a4:	00004517          	auipc	a0,0x4
    800032a8:	d9c50513          	addi	a0,a0,-612 # 80007040 <CONSOLE_STATUS+0x30>
    800032ac:	fffff097          	auipc	ra,0xfffff
    800032b0:	874080e7          	jalr	-1932(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
    800032b4:	fc1ff06f          	j	80003274 <_ZN11HeapManagerC1Ev+0x24>

00000000800032b8 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    800032b8:	ff010113          	addi	sp,sp,-16
    800032bc:	00813423          	sd	s0,8(sp)
    800032c0:	01010413          	addi	s0,sp,16
    
}
    800032c4:	00813403          	ld	s0,8(sp)
    800032c8:	01010113          	addi	sp,sp,16
    800032cc:	00008067          	ret

00000000800032d0 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    800032d0:	fd010113          	addi	sp,sp,-48
    800032d4:	02113423          	sd	ra,40(sp)
    800032d8:	02813023          	sd	s0,32(sp)
    800032dc:	00913c23          	sd	s1,24(sp)
    800032e0:	01213823          	sd	s2,16(sp)
    800032e4:	01313423          	sd	s3,8(sp)
    800032e8:	03010413          	addi	s0,sp,48
    800032ec:	00050993          	mv	s3,a0
    800032f0:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    800032f4:	40b604b3          	sub	s1,a2,a1
    800032f8:	0414b793          	sltiu	a5,s1,65
    800032fc:	0c079863          	bnez	a5,800033cc <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80003300:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80003304:	fde00793          	li	a5,-34
    80003308:	00f90c23          	sb	a5,24(s2)
    8000330c:	fc000713          	li	a4,-64
    80003310:	00e90ca3          	sb	a4,25(s2)
    80003314:	fad00713          	li	a4,-83
    80003318:	00e90d23          	sb	a4,26(s2)
    8000331c:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    80003320:	0064d613          	srli	a2,s1,0x6
    80003324:	0009b783          	ld	a5,0(s3)
    80003328:	fff60613          	addi	a2,a2,-1
    8000332c:	00c78823          	sb	a2,16(a5)
    80003330:	00865713          	srli	a4,a2,0x8
    80003334:	00e788a3          	sb	a4,17(a5)
    80003338:	01065713          	srli	a4,a2,0x10
    8000333c:	00e78923          	sb	a4,18(a5)
    80003340:	0186571b          	srliw	a4,a2,0x18
    80003344:	00e789a3          	sb	a4,19(a5)
    80003348:	02065713          	srli	a4,a2,0x20
    8000334c:	00e78a23          	sb	a4,20(a5)
    80003350:	02865713          	srli	a4,a2,0x28
    80003354:	00e78aa3          	sb	a4,21(a5)
    80003358:	03065713          	srli	a4,a2,0x30
    8000335c:	00e78b23          	sb	a4,22(a5)
    80003360:	03865613          	srli	a2,a2,0x38
    80003364:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80003368:	0009b783          	ld	a5,0(s3)
    8000336c:	00078023          	sb	zero,0(a5)
    80003370:	000780a3          	sb	zero,1(a5)
    80003374:	00078123          	sb	zero,2(a5)
    80003378:	000781a3          	sb	zero,3(a5)
    8000337c:	00078223          	sb	zero,4(a5)
    80003380:	000782a3          	sb	zero,5(a5)
    80003384:	00078323          	sb	zero,6(a5)
    80003388:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    8000338c:	0009b783          	ld	a5,0(s3)
    80003390:	00078423          	sb	zero,8(a5)
    80003394:	000784a3          	sb	zero,9(a5)
    80003398:	00078523          	sb	zero,10(a5)
    8000339c:	000785a3          	sb	zero,11(a5)
    800033a0:	00078623          	sb	zero,12(a5)
    800033a4:	000786a3          	sb	zero,13(a5)
    800033a8:	00078723          	sb	zero,14(a5)
    800033ac:	000787a3          	sb	zero,15(a5)
}
    800033b0:	02813083          	ld	ra,40(sp)
    800033b4:	02013403          	ld	s0,32(sp)
    800033b8:	01813483          	ld	s1,24(sp)
    800033bc:	01013903          	ld	s2,16(sp)
    800033c0:	00813983          	ld	s3,8(sp)
    800033c4:	03010113          	addi	sp,sp,48
    800033c8:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    800033cc:	00004697          	auipc	a3,0x4
    800033d0:	dec68693          	addi	a3,a3,-532 # 800071b8 <CONSOLE_STATUS+0x1a8>
    800033d4:	01c00613          	li	a2,28
    800033d8:	00004597          	auipc	a1,0x4
    800033dc:	dc858593          	addi	a1,a1,-568 # 800071a0 <CONSOLE_STATUS+0x190>
    800033e0:	00004517          	auipc	a0,0x4
    800033e4:	e0850513          	addi	a0,a0,-504 # 800071e8 <CONSOLE_STATUS+0x1d8>
    800033e8:	ffffe097          	auipc	ra,0xffffe
    800033ec:	738080e7          	jalr	1848(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
    800033f0:	f11ff06f          	j	80003300 <_ZN11HeapManager4initEmm+0x30>

00000000800033f4 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    800033f4:	fe010113          	addi	sp,sp,-32
    800033f8:	00113c23          	sd	ra,24(sp)
    800033fc:	00813823          	sd	s0,16(sp)
    80003400:	00913423          	sd	s1,8(sp)
    80003404:	01213023          	sd	s2,0(sp)
    80003408:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    8000340c:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80003410:	00000913          	li	s2,0
    80003414:	0b80006f          	j	800034cc <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80003418:	0104c783          	lbu	a5,16(s1)
    8000341c:	0114c703          	lbu	a4,17(s1)
    80003420:	00871713          	slli	a4,a4,0x8
    80003424:	00f76733          	or	a4,a4,a5
    80003428:	0124c783          	lbu	a5,18(s1)
    8000342c:	01079793          	slli	a5,a5,0x10
    80003430:	00e7e733          	or	a4,a5,a4
    80003434:	0134c783          	lbu	a5,19(s1)
    80003438:	01879793          	slli	a5,a5,0x18
    8000343c:	00e7e7b3          	or	a5,a5,a4
    80003440:	0144c703          	lbu	a4,20(s1)
    80003444:	02071713          	slli	a4,a4,0x20
    80003448:	00f767b3          	or	a5,a4,a5
    8000344c:	0154c703          	lbu	a4,21(s1)
    80003450:	02871713          	slli	a4,a4,0x28
    80003454:	00f76733          	or	a4,a4,a5
    80003458:	0164c783          	lbu	a5,22(s1)
    8000345c:	03079793          	slli	a5,a5,0x30
    80003460:	00e7e733          	or	a4,a5,a4
    80003464:	0174c783          	lbu	a5,23(s1)
    80003468:	03879793          	slli	a5,a5,0x38
    8000346c:	00e7e7b3          	or	a5,a5,a4
    80003470:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80003474:	0004c703          	lbu	a4,0(s1)
    80003478:	0014c783          	lbu	a5,1(s1)
    8000347c:	00879793          	slli	a5,a5,0x8
    80003480:	00e7e733          	or	a4,a5,a4
    80003484:	0024c783          	lbu	a5,2(s1)
    80003488:	01079793          	slli	a5,a5,0x10
    8000348c:	00e7e7b3          	or	a5,a5,a4
    80003490:	0034c703          	lbu	a4,3(s1)
    80003494:	01871713          	slli	a4,a4,0x18
    80003498:	00f767b3          	or	a5,a4,a5
    8000349c:	0044c703          	lbu	a4,4(s1)
    800034a0:	02071713          	slli	a4,a4,0x20
    800034a4:	00f76733          	or	a4,a4,a5
    800034a8:	0054c783          	lbu	a5,5(s1)
    800034ac:	02879793          	slli	a5,a5,0x28
    800034b0:	00e7e733          	or	a4,a5,a4
    800034b4:	0064c783          	lbu	a5,6(s1)
    800034b8:	03079793          	slli	a5,a5,0x30
    800034bc:	00e7e7b3          	or	a5,a5,a4
    800034c0:	0074c483          	lbu	s1,7(s1)
    800034c4:	03849493          	slli	s1,s1,0x38
    800034c8:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    800034cc:	06048263          	beqz	s1,80003530 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    800034d0:	0184c783          	lbu	a5,24(s1)
    800034d4:	0194c703          	lbu	a4,25(s1)
    800034d8:	00871713          	slli	a4,a4,0x8
    800034dc:	00f76733          	or	a4,a4,a5
    800034e0:	01a4c783          	lbu	a5,26(s1)
    800034e4:	01079793          	slli	a5,a5,0x10
    800034e8:	00e7e733          	or	a4,a5,a4
    800034ec:	01b4c783          	lbu	a5,27(s1)
    800034f0:	01879793          	slli	a5,a5,0x18
    800034f4:	00e7e7b3          	or	a5,a5,a4
    800034f8:	0007879b          	sext.w	a5,a5
    800034fc:	deadc737          	lui	a4,0xdeadc
    80003500:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2b7e>
    80003504:	f0e78ae3          	beq	a5,a4,80003418 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80003508:	00004697          	auipc	a3,0x4
    8000350c:	d0068693          	addi	a3,a3,-768 # 80007208 <CONSOLE_STATUS+0x1f8>
    80003510:	02900613          	li	a2,41
    80003514:	00004597          	auipc	a1,0x4
    80003518:	c8c58593          	addi	a1,a1,-884 # 800071a0 <CONSOLE_STATUS+0x190>
    8000351c:	00004517          	auipc	a0,0x4
    80003520:	d1450513          	addi	a0,a0,-748 # 80007230 <CONSOLE_STATUS+0x220>
    80003524:	ffffe097          	auipc	ra,0xffffe
    80003528:	5fc080e7          	jalr	1532(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
    8000352c:	eedff06f          	j	80003418 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80003530:	00090513          	mv	a0,s2
    80003534:	01813083          	ld	ra,24(sp)
    80003538:	01013403          	ld	s0,16(sp)
    8000353c:	00813483          	ld	s1,8(sp)
    80003540:	00013903          	ld	s2,0(sp)
    80003544:	02010113          	addi	sp,sp,32
    80003548:	00008067          	ret

000000008000354c <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    8000354c:	fd010113          	addi	sp,sp,-48
    80003550:	02113423          	sd	ra,40(sp)
    80003554:	02813023          	sd	s0,32(sp)
    80003558:	00913c23          	sd	s1,24(sp)
    8000355c:	01213823          	sd	s2,16(sp)
    80003560:	01313423          	sd	s3,8(sp)
    80003564:	03010413          	addi	s0,sp,48
    80003568:	00050993          	mv	s3,a0
    8000356c:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003570:	00053483          	ld	s1,0(a0)
    80003574:	0b80006f          	j	8000362c <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80003578:	0104c783          	lbu	a5,16(s1)
    8000357c:	0114c703          	lbu	a4,17(s1)
    80003580:	00871713          	slli	a4,a4,0x8
    80003584:	00f76733          	or	a4,a4,a5
    80003588:	0124c783          	lbu	a5,18(s1)
    8000358c:	01079793          	slli	a5,a5,0x10
    80003590:	00e7e733          	or	a4,a5,a4
    80003594:	0134c783          	lbu	a5,19(s1)
    80003598:	01879793          	slli	a5,a5,0x18
    8000359c:	00e7e7b3          	or	a5,a5,a4
    800035a0:	0144c703          	lbu	a4,20(s1)
    800035a4:	02071713          	slli	a4,a4,0x20
    800035a8:	00f767b3          	or	a5,a4,a5
    800035ac:	0154c703          	lbu	a4,21(s1)
    800035b0:	02871713          	slli	a4,a4,0x28
    800035b4:	00f76733          	or	a4,a4,a5
    800035b8:	0164c783          	lbu	a5,22(s1)
    800035bc:	03079793          	slli	a5,a5,0x30
    800035c0:	00e7e733          	or	a4,a5,a4
    800035c4:	0174c783          	lbu	a5,23(s1)
    800035c8:	03879793          	slli	a5,a5,0x38
    800035cc:	00e7e7b3          	or	a5,a5,a4
    800035d0:	0d27f063          	bgeu	a5,s2,80003690 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    800035d4:	0004c703          	lbu	a4,0(s1)
    800035d8:	0014c783          	lbu	a5,1(s1)
    800035dc:	00879793          	slli	a5,a5,0x8
    800035e0:	00e7e733          	or	a4,a5,a4
    800035e4:	0024c783          	lbu	a5,2(s1)
    800035e8:	01079793          	slli	a5,a5,0x10
    800035ec:	00e7e7b3          	or	a5,a5,a4
    800035f0:	0034c703          	lbu	a4,3(s1)
    800035f4:	01871713          	slli	a4,a4,0x18
    800035f8:	00f767b3          	or	a5,a4,a5
    800035fc:	0044c703          	lbu	a4,4(s1)
    80003600:	02071713          	slli	a4,a4,0x20
    80003604:	00f76733          	or	a4,a4,a5
    80003608:	0054c783          	lbu	a5,5(s1)
    8000360c:	02879793          	slli	a5,a5,0x28
    80003610:	00e7e733          	or	a4,a5,a4
    80003614:	0064c783          	lbu	a5,6(s1)
    80003618:	03079793          	slli	a5,a5,0x30
    8000361c:	00e7e7b3          	or	a5,a5,a4
    80003620:	0074c483          	lbu	s1,7(s1)
    80003624:	03849493          	slli	s1,s1,0x38
    80003628:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    8000362c:	4e048c63          	beqz	s1,80003b24 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003630:	0184c783          	lbu	a5,24(s1)
    80003634:	0194c703          	lbu	a4,25(s1)
    80003638:	00871713          	slli	a4,a4,0x8
    8000363c:	00f76733          	or	a4,a4,a5
    80003640:	01a4c783          	lbu	a5,26(s1)
    80003644:	01079793          	slli	a5,a5,0x10
    80003648:	00e7e733          	or	a4,a5,a4
    8000364c:	01b4c783          	lbu	a5,27(s1)
    80003650:	01879793          	slli	a5,a5,0x18
    80003654:	00e7e7b3          	or	a5,a5,a4
    80003658:	0007879b          	sext.w	a5,a5
    8000365c:	deadc737          	lui	a4,0xdeadc
    80003660:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2b7e>
    80003664:	f0e78ae3          	beq	a5,a4,80003578 <_ZN11HeapManager12heapAllocateEm+0x2c>
    80003668:	00004697          	auipc	a3,0x4
    8000366c:	bf068693          	addi	a3,a3,-1040 # 80007258 <CONSOLE_STATUS+0x248>
    80003670:	03300613          	li	a2,51
    80003674:	00004597          	auipc	a1,0x4
    80003678:	b2c58593          	addi	a1,a1,-1236 # 800071a0 <CONSOLE_STATUS+0x190>
    8000367c:	00004517          	auipc	a0,0x4
    80003680:	bb450513          	addi	a0,a0,-1100 # 80007230 <CONSOLE_STATUS+0x220>
    80003684:	ffffe097          	auipc	ra,0xffffe
    80003688:	49c080e7          	jalr	1180(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
    8000368c:	eedff06f          	j	80003578 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80003690:	00190713          	addi	a4,s2,1
    80003694:	2af77263          	bgeu	a4,a5,80003938 <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80003698:	00671793          	slli	a5,a4,0x6
    8000369c:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    800036a0:	fde00713          	li	a4,-34
    800036a4:	00e78c23          	sb	a4,24(a5)
    800036a8:	fc000693          	li	a3,-64
    800036ac:	00d78ca3          	sb	a3,25(a5)
    800036b0:	fad00693          	li	a3,-83
    800036b4:	00d78d23          	sb	a3,26(a5)
    800036b8:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    800036bc:	0104c703          	lbu	a4,16(s1)
    800036c0:	0114c683          	lbu	a3,17(s1)
    800036c4:	00869693          	slli	a3,a3,0x8
    800036c8:	00e6e6b3          	or	a3,a3,a4
    800036cc:	0124c703          	lbu	a4,18(s1)
    800036d0:	01071713          	slli	a4,a4,0x10
    800036d4:	00d766b3          	or	a3,a4,a3
    800036d8:	0134c703          	lbu	a4,19(s1)
    800036dc:	01871713          	slli	a4,a4,0x18
    800036e0:	00d76733          	or	a4,a4,a3
    800036e4:	0144c683          	lbu	a3,20(s1)
    800036e8:	02069693          	slli	a3,a3,0x20
    800036ec:	00e6e733          	or	a4,a3,a4
    800036f0:	0154c683          	lbu	a3,21(s1)
    800036f4:	02869693          	slli	a3,a3,0x28
    800036f8:	00e6e6b3          	or	a3,a3,a4
    800036fc:	0164c703          	lbu	a4,22(s1)
    80003700:	03071713          	slli	a4,a4,0x30
    80003704:	00d766b3          	or	a3,a4,a3
    80003708:	0174c703          	lbu	a4,23(s1)
    8000370c:	03871713          	slli	a4,a4,0x38
    80003710:	00d76733          	or	a4,a4,a3
    80003714:	41270733          	sub	a4,a4,s2
    80003718:	fff70713          	addi	a4,a4,-1
    8000371c:	00e78823          	sb	a4,16(a5)
    80003720:	00875693          	srli	a3,a4,0x8
    80003724:	00d788a3          	sb	a3,17(a5)
    80003728:	01075693          	srli	a3,a4,0x10
    8000372c:	00d78923          	sb	a3,18(a5)
    80003730:	0187569b          	srliw	a3,a4,0x18
    80003734:	00d789a3          	sb	a3,19(a5)
    80003738:	02075693          	srli	a3,a4,0x20
    8000373c:	00d78a23          	sb	a3,20(a5)
    80003740:	02875693          	srli	a3,a4,0x28
    80003744:	00d78aa3          	sb	a3,21(a5)
    80003748:	03075693          	srli	a3,a4,0x30
    8000374c:	00d78b23          	sb	a3,22(a5)
    80003750:	03875713          	srli	a4,a4,0x38
    80003754:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80003758:	0004c703          	lbu	a4,0(s1)
    8000375c:	0014c683          	lbu	a3,1(s1)
    80003760:	00869693          	slli	a3,a3,0x8
    80003764:	00e6e733          	or	a4,a3,a4
    80003768:	0024c683          	lbu	a3,2(s1)
    8000376c:	01069693          	slli	a3,a3,0x10
    80003770:	00e6e6b3          	or	a3,a3,a4
    80003774:	0034c703          	lbu	a4,3(s1)
    80003778:	01871713          	slli	a4,a4,0x18
    8000377c:	00d766b3          	or	a3,a4,a3
    80003780:	0044c703          	lbu	a4,4(s1)
    80003784:	02071713          	slli	a4,a4,0x20
    80003788:	00d76733          	or	a4,a4,a3
    8000378c:	0054c683          	lbu	a3,5(s1)
    80003790:	02869693          	slli	a3,a3,0x28
    80003794:	00e6e733          	or	a4,a3,a4
    80003798:	0064c683          	lbu	a3,6(s1)
    8000379c:	03069693          	slli	a3,a3,0x30
    800037a0:	00e6e6b3          	or	a3,a3,a4
    800037a4:	0074c703          	lbu	a4,7(s1)
    800037a8:	03871713          	slli	a4,a4,0x38
    800037ac:	00d76733          	or	a4,a4,a3
    800037b0:	00d78023          	sb	a3,0(a5)
    800037b4:	00875693          	srli	a3,a4,0x8
    800037b8:	00d780a3          	sb	a3,1(a5)
    800037bc:	01075693          	srli	a3,a4,0x10
    800037c0:	00d78123          	sb	a3,2(a5)
    800037c4:	0187569b          	srliw	a3,a4,0x18
    800037c8:	00d781a3          	sb	a3,3(a5)
    800037cc:	02075693          	srli	a3,a4,0x20
    800037d0:	00d78223          	sb	a3,4(a5)
    800037d4:	02875693          	srli	a3,a4,0x28
    800037d8:	00d782a3          	sb	a3,5(a5)
    800037dc:	03075693          	srli	a3,a4,0x30
    800037e0:	00d78323          	sb	a3,6(a5)
    800037e4:	03875713          	srli	a4,a4,0x38
    800037e8:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    800037ec:	00978423          	sb	s1,8(a5)
    800037f0:	0084d713          	srli	a4,s1,0x8
    800037f4:	00e784a3          	sb	a4,9(a5)
    800037f8:	0104d713          	srli	a4,s1,0x10
    800037fc:	00e78523          	sb	a4,10(a5)
    80003800:	0184d71b          	srliw	a4,s1,0x18
    80003804:	00e785a3          	sb	a4,11(a5)
    80003808:	0204d713          	srli	a4,s1,0x20
    8000380c:	00e78623          	sb	a4,12(a5)
    80003810:	0284d713          	srli	a4,s1,0x28
    80003814:	00e786a3          	sb	a4,13(a5)
    80003818:	0304d713          	srli	a4,s1,0x30
    8000381c:	00e78723          	sb	a4,14(a5)
    80003820:	0384d713          	srli	a4,s1,0x38
    80003824:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    80003828:	0004c703          	lbu	a4,0(s1)
    8000382c:	0014c683          	lbu	a3,1(s1)
    80003830:	00869693          	slli	a3,a3,0x8
    80003834:	00e6e6b3          	or	a3,a3,a4
    80003838:	0024c703          	lbu	a4,2(s1)
    8000383c:	01071713          	slli	a4,a4,0x10
    80003840:	00d766b3          	or	a3,a4,a3
    80003844:	0034c703          	lbu	a4,3(s1)
    80003848:	01871713          	slli	a4,a4,0x18
    8000384c:	00d76733          	or	a4,a4,a3
    80003850:	0044c683          	lbu	a3,4(s1)
    80003854:	02069693          	slli	a3,a3,0x20
    80003858:	00e6e733          	or	a4,a3,a4
    8000385c:	0054c683          	lbu	a3,5(s1)
    80003860:	02869693          	slli	a3,a3,0x28
    80003864:	00e6e6b3          	or	a3,a3,a4
    80003868:	0064c703          	lbu	a4,6(s1)
    8000386c:	03071713          	slli	a4,a4,0x30
    80003870:	00d766b3          	or	a3,a4,a3
    80003874:	0074c703          	lbu	a4,7(s1)
    80003878:	03871713          	slli	a4,a4,0x38
    8000387c:	00d76733          	or	a4,a4,a3
    80003880:	04070063          	beqz	a4,800038c0 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003884:	00f70423          	sb	a5,8(a4)
    80003888:	0087d693          	srli	a3,a5,0x8
    8000388c:	00d704a3          	sb	a3,9(a4)
    80003890:	0107d693          	srli	a3,a5,0x10
    80003894:	00d70523          	sb	a3,10(a4)
    80003898:	0187d69b          	srliw	a3,a5,0x18
    8000389c:	00d705a3          	sb	a3,11(a4)
    800038a0:	0207d693          	srli	a3,a5,0x20
    800038a4:	00d70623          	sb	a3,12(a4)
    800038a8:	0287d693          	srli	a3,a5,0x28
    800038ac:	00d706a3          	sb	a3,13(a4)
    800038b0:	0307d693          	srli	a3,a5,0x30
    800038b4:	00d70723          	sb	a3,14(a4)
    800038b8:	0387d693          	srli	a3,a5,0x38
    800038bc:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    800038c0:	00f48023          	sb	a5,0(s1)
    800038c4:	0087d713          	srli	a4,a5,0x8
    800038c8:	00e480a3          	sb	a4,1(s1)
    800038cc:	0107d713          	srli	a4,a5,0x10
    800038d0:	00e48123          	sb	a4,2(s1)
    800038d4:	0187d71b          	srliw	a4,a5,0x18
    800038d8:	00e481a3          	sb	a4,3(s1)
    800038dc:	0207d713          	srli	a4,a5,0x20
    800038e0:	00e48223          	sb	a4,4(s1)
    800038e4:	0287d713          	srli	a4,a5,0x28
    800038e8:	00e482a3          	sb	a4,5(s1)
    800038ec:	0307d713          	srli	a4,a5,0x30
    800038f0:	00e48323          	sb	a4,6(s1)
    800038f4:	0387d793          	srli	a5,a5,0x38
    800038f8:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    800038fc:	01248823          	sb	s2,16(s1)
    80003900:	00895793          	srli	a5,s2,0x8
    80003904:	00f488a3          	sb	a5,17(s1)
    80003908:	01095793          	srli	a5,s2,0x10
    8000390c:	00f48923          	sb	a5,18(s1)
    80003910:	0189579b          	srliw	a5,s2,0x18
    80003914:	00f489a3          	sb	a5,19(s1)
    80003918:	02095793          	srli	a5,s2,0x20
    8000391c:	00f48a23          	sb	a5,20(s1)
    80003920:	02895793          	srli	a5,s2,0x28
    80003924:	00f48aa3          	sb	a5,21(s1)
    80003928:	03095793          	srli	a5,s2,0x30
    8000392c:	00f48b23          	sb	a5,22(s1)
    80003930:	03895913          	srli	s2,s2,0x38
    80003934:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80003938:	0009b783          	ld	a5,0(s3)
    8000393c:	20978463          	beq	a5,s1,80003b44 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80003940:	0084c783          	lbu	a5,8(s1)
    80003944:	0094c703          	lbu	a4,9(s1)
    80003948:	00871713          	slli	a4,a4,0x8
    8000394c:	00f76733          	or	a4,a4,a5
    80003950:	00a4c783          	lbu	a5,10(s1)
    80003954:	01079793          	slli	a5,a5,0x10
    80003958:	00e7e733          	or	a4,a5,a4
    8000395c:	00b4c783          	lbu	a5,11(s1)
    80003960:	01879793          	slli	a5,a5,0x18
    80003964:	00e7e7b3          	or	a5,a5,a4
    80003968:	00c4c703          	lbu	a4,12(s1)
    8000396c:	02071713          	slli	a4,a4,0x20
    80003970:	00f767b3          	or	a5,a4,a5
    80003974:	00d4c703          	lbu	a4,13(s1)
    80003978:	02871713          	slli	a4,a4,0x28
    8000397c:	00f76733          	or	a4,a4,a5
    80003980:	00e4c783          	lbu	a5,14(s1)
    80003984:	03079793          	slli	a5,a5,0x30
    80003988:	00e7e733          	or	a4,a5,a4
    8000398c:	00f4c783          	lbu	a5,15(s1)
    80003990:	03879793          	slli	a5,a5,0x38
    80003994:	00e7e7b3          	or	a5,a5,a4
    80003998:	08078c63          	beqz	a5,80003a30 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    8000399c:	0004c703          	lbu	a4,0(s1)
    800039a0:	0014c683          	lbu	a3,1(s1)
    800039a4:	00869693          	slli	a3,a3,0x8
    800039a8:	00e6e733          	or	a4,a3,a4
    800039ac:	0024c683          	lbu	a3,2(s1)
    800039b0:	01069693          	slli	a3,a3,0x10
    800039b4:	00e6e6b3          	or	a3,a3,a4
    800039b8:	0034c703          	lbu	a4,3(s1)
    800039bc:	01871713          	slli	a4,a4,0x18
    800039c0:	00d766b3          	or	a3,a4,a3
    800039c4:	0044c703          	lbu	a4,4(s1)
    800039c8:	02071713          	slli	a4,a4,0x20
    800039cc:	00d76733          	or	a4,a4,a3
    800039d0:	0054c683          	lbu	a3,5(s1)
    800039d4:	02869693          	slli	a3,a3,0x28
    800039d8:	00e6e733          	or	a4,a3,a4
    800039dc:	0064c683          	lbu	a3,6(s1)
    800039e0:	03069693          	slli	a3,a3,0x30
    800039e4:	00e6e6b3          	or	a3,a3,a4
    800039e8:	0074c703          	lbu	a4,7(s1)
    800039ec:	03871713          	slli	a4,a4,0x38
    800039f0:	00d76733          	or	a4,a4,a3
    800039f4:	00d78023          	sb	a3,0(a5)
    800039f8:	00875693          	srli	a3,a4,0x8
    800039fc:	00d780a3          	sb	a3,1(a5)
    80003a00:	01075693          	srli	a3,a4,0x10
    80003a04:	00d78123          	sb	a3,2(a5)
    80003a08:	0187569b          	srliw	a3,a4,0x18
    80003a0c:	00d781a3          	sb	a3,3(a5)
    80003a10:	02075693          	srli	a3,a4,0x20
    80003a14:	00d78223          	sb	a3,4(a5)
    80003a18:	02875693          	srli	a3,a4,0x28
    80003a1c:	00d782a3          	sb	a3,5(a5)
    80003a20:	03075693          	srli	a3,a4,0x30
    80003a24:	00d78323          	sb	a3,6(a5)
    80003a28:	03875713          	srli	a4,a4,0x38
    80003a2c:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003a30:	0004c783          	lbu	a5,0(s1)
    80003a34:	0014c703          	lbu	a4,1(s1)
    80003a38:	00871713          	slli	a4,a4,0x8
    80003a3c:	00f76733          	or	a4,a4,a5
    80003a40:	0024c783          	lbu	a5,2(s1)
    80003a44:	01079793          	slli	a5,a5,0x10
    80003a48:	00e7e733          	or	a4,a5,a4
    80003a4c:	0034c783          	lbu	a5,3(s1)
    80003a50:	01879793          	slli	a5,a5,0x18
    80003a54:	00e7e7b3          	or	a5,a5,a4
    80003a58:	0044c703          	lbu	a4,4(s1)
    80003a5c:	02071713          	slli	a4,a4,0x20
    80003a60:	00f767b3          	or	a5,a4,a5
    80003a64:	0054c703          	lbu	a4,5(s1)
    80003a68:	02871713          	slli	a4,a4,0x28
    80003a6c:	00f76733          	or	a4,a4,a5
    80003a70:	0064c783          	lbu	a5,6(s1)
    80003a74:	03079793          	slli	a5,a5,0x30
    80003a78:	00e7e733          	or	a4,a5,a4
    80003a7c:	0074c783          	lbu	a5,7(s1)
    80003a80:	03879793          	slli	a5,a5,0x38
    80003a84:	00e7e7b3          	or	a5,a5,a4
    80003a88:	08078c63          	beqz	a5,80003b20 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003a8c:	0084c703          	lbu	a4,8(s1)
    80003a90:	0094c683          	lbu	a3,9(s1)
    80003a94:	00869693          	slli	a3,a3,0x8
    80003a98:	00e6e733          	or	a4,a3,a4
    80003a9c:	00a4c683          	lbu	a3,10(s1)
    80003aa0:	01069693          	slli	a3,a3,0x10
    80003aa4:	00e6e6b3          	or	a3,a3,a4
    80003aa8:	00b4c703          	lbu	a4,11(s1)
    80003aac:	01871713          	slli	a4,a4,0x18
    80003ab0:	00d766b3          	or	a3,a4,a3
    80003ab4:	00c4c703          	lbu	a4,12(s1)
    80003ab8:	02071713          	slli	a4,a4,0x20
    80003abc:	00d76733          	or	a4,a4,a3
    80003ac0:	00d4c683          	lbu	a3,13(s1)
    80003ac4:	02869693          	slli	a3,a3,0x28
    80003ac8:	00e6e733          	or	a4,a3,a4
    80003acc:	00e4c683          	lbu	a3,14(s1)
    80003ad0:	03069693          	slli	a3,a3,0x30
    80003ad4:	00e6e6b3          	or	a3,a3,a4
    80003ad8:	00f4c703          	lbu	a4,15(s1)
    80003adc:	03871713          	slli	a4,a4,0x38
    80003ae0:	00d76733          	or	a4,a4,a3
    80003ae4:	00d78423          	sb	a3,8(a5)
    80003ae8:	00875693          	srli	a3,a4,0x8
    80003aec:	00d784a3          	sb	a3,9(a5)
    80003af0:	01075693          	srli	a3,a4,0x10
    80003af4:	00d78523          	sb	a3,10(a5)
    80003af8:	0187569b          	srliw	a3,a4,0x18
    80003afc:	00d785a3          	sb	a3,11(a5)
    80003b00:	02075693          	srli	a3,a4,0x20
    80003b04:	00d78623          	sb	a3,12(a5)
    80003b08:	02875693          	srli	a3,a4,0x28
    80003b0c:	00d786a3          	sb	a3,13(a5)
    80003b10:	03075693          	srli	a3,a4,0x30
    80003b14:	00d78723          	sb	a3,14(a5)
    80003b18:	03875713          	srli	a4,a4,0x38
    80003b1c:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    80003b20:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80003b24:	00048513          	mv	a0,s1
    80003b28:	02813083          	ld	ra,40(sp)
    80003b2c:	02013403          	ld	s0,32(sp)
    80003b30:	01813483          	ld	s1,24(sp)
    80003b34:	01013903          	ld	s2,16(sp)
    80003b38:	00813983          	ld	s3,8(sp)
    80003b3c:	03010113          	addi	sp,sp,48
    80003b40:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80003b44:	0004c703          	lbu	a4,0(s1)
    80003b48:	0014c783          	lbu	a5,1(s1)
    80003b4c:	00879793          	slli	a5,a5,0x8
    80003b50:	00e7e7b3          	or	a5,a5,a4
    80003b54:	0024c703          	lbu	a4,2(s1)
    80003b58:	01071713          	slli	a4,a4,0x10
    80003b5c:	00f76733          	or	a4,a4,a5
    80003b60:	0034c783          	lbu	a5,3(s1)
    80003b64:	01879793          	slli	a5,a5,0x18
    80003b68:	00e7e733          	or	a4,a5,a4
    80003b6c:	0044c783          	lbu	a5,4(s1)
    80003b70:	02079793          	slli	a5,a5,0x20
    80003b74:	00e7e7b3          	or	a5,a5,a4
    80003b78:	0054c703          	lbu	a4,5(s1)
    80003b7c:	02871713          	slli	a4,a4,0x28
    80003b80:	00f76733          	or	a4,a4,a5
    80003b84:	0064c783          	lbu	a5,6(s1)
    80003b88:	03079793          	slli	a5,a5,0x30
    80003b8c:	00e7e733          	or	a4,a5,a4
    80003b90:	0074c783          	lbu	a5,7(s1)
    80003b94:	03879793          	slli	a5,a5,0x38
    80003b98:	00e7e7b3          	or	a5,a5,a4
    80003b9c:	00f9b023          	sd	a5,0(s3)
    80003ba0:	da1ff06f          	j	80003940 <_ZN11HeapManager12heapAllocateEm+0x3f4>

0000000080003ba4 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003ba4:	ff010113          	addi	sp,sp,-16
    80003ba8:	00813423          	sd	s0,8(sp)
    80003bac:	01010413          	addi	s0,sp,16
    //     if(pFree->pNext != 0){
    //         pFree->pNext->pPrev = pFree;
    //     }
    // }
    return 0;
}
    80003bb0:	00000513          	li	a0,0
    80003bb4:	00813403          	ld	s0,8(sp)
    80003bb8:	01010113          	addi	sp,sp,16
    80003bbc:	00008067          	ret

0000000080003bc0 <exceptionHandler>:
#include "sem.h"
#include "timer.h"
#include "assert.h"
#include "userConsole.h"

extern "C" void exceptionHandler(){
    80003bc0:	fc010113          	addi	sp,sp,-64
    80003bc4:	02113c23          	sd	ra,56(sp)
    80003bc8:	02813823          	sd	s0,48(sp)
    80003bcc:	02913423          	sd	s1,40(sp)
    80003bd0:	03213023          	sd	s2,32(sp)
    80003bd4:	01313c23          	sd	s3,24(sp)
    80003bd8:	01413823          	sd	s4,16(sp)
    80003bdc:	01513423          	sd	s5,8(sp)
    80003be0:	01613023          	sd	s6,0(sp)
    80003be4:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    80003be8:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    80003bec:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    80003bf0:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    80003bf4:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80003bf8:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80003bfc:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80003c00:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80003c04:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80003c08:	ff870613          	addi	a2,a4,-8
    80003c0c:	00100693          	li	a3,1
    80003c10:	04c6fc63          	bgeu	a3,a2,80003c68 <exceptionHandler+0xa8>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    80003c14:	00500793          	li	a5,5
    80003c18:	22f70663          	beq	a4,a5,80003e44 <exceptionHandler+0x284>
                putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    80003c1c:	00700793          	li	a5,7
    80003c20:	3ef70063          	beq	a4,a5,80004000 <exceptionHandler+0x440>
                putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    80003c24:	fff00793          	li	a5,-1
    80003c28:	03f79793          	slli	a5,a5,0x3f
    80003c2c:	00178793          	addi	a5,a5,1
    80003c30:	58f70c63          	beq	a4,a5,800041c8 <exceptionHandler+0x608>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    80003c34:	fff00793          	li	a5,-1
    80003c38:	03f79793          	slli	a5,a5,0x3f
    80003c3c:	00978793          	addi	a5,a5,9
    80003c40:	0af71063          	bne	a4,a5,80003ce0 <exceptionHandler+0x120>
    {   
        int irq = plic_claim();
    80003c44:	00001097          	auipc	ra,0x1
    80003c48:	280080e7          	jalr	640(ra) # 80004ec4 <plic_claim>
    80003c4c:	00050493          	mv	s1,a0
        if(irq == CONSOLE_IRQ)Console::inputHandler();
    80003c50:	00a00793          	li	a5,10
    80003c54:	5cf50c63          	beq	a0,a5,8000422c <exceptionHandler+0x66c>
        plic_complete(irq);
    80003c58:	00048513          	mv	a0,s1
    80003c5c:	00001097          	auipc	ra,0x1
    80003c60:	2a0080e7          	jalr	672(ra) # 80004efc <plic_complete>
    80003c64:	07c0006f          	j	80003ce0 <exceptionHandler+0x120>
        switch(a0){
    80003c68:	04200713          	li	a4,66
    80003c6c:	02f76463          	bltu	a4,a5,80003c94 <exceptionHandler+0xd4>
    80003c70:	1c078263          	beqz	a5,80003e34 <exceptionHandler+0x274>
    80003c74:	1cf76463          	bltu	a4,a5,80003e3c <exceptionHandler+0x27c>
    80003c78:	00279793          	slli	a5,a5,0x2
    80003c7c:	00003717          	auipc	a4,0x3
    80003c80:	66870713          	addi	a4,a4,1640 # 800072e4 <CONSOLE_STATUS+0x2d4>
    80003c84:	00e787b3          	add	a5,a5,a4
    80003c88:	0007a783          	lw	a5,0(a5)
    80003c8c:	00e787b3          	add	a5,a5,a4
    80003c90:	00078067          	jr	a5
    80003c94:	0ff00713          	li	a4,255
    80003c98:	02e79663          	bne	a5,a4,80003cc4 <exceptionHandler+0x104>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80003c9c:	00000793          	li	a5,0
    80003ca0:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80003ca4:	00448493          	addi	s1,s1,4
    80003ca8:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003cac:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    80003cb0:	10000793          	li	a5,256
    80003cb4:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003cb8:	00200793          	li	a5,2
    80003cbc:	1447b073          	csrc	sip,a5
                return;
    80003cc0:	0200006f          	j	80003ce0 <exceptionHandler+0x120>
        switch(a0){
    80003cc4:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80003cc8:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80003ccc:	00448493          	addi	s1,s1,4
    80003cd0:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003cd4:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003cd8:	00200793          	li	a5,2
    80003cdc:	1447b073          	csrc	sip,a5
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    80003ce0:	03813083          	ld	ra,56(sp)
    80003ce4:	03013403          	ld	s0,48(sp)
    80003ce8:	02813483          	ld	s1,40(sp)
    80003cec:	02013903          	ld	s2,32(sp)
    80003cf0:	01813983          	ld	s3,24(sp)
    80003cf4:	01013a03          	ld	s4,16(sp)
    80003cf8:	00813a83          	ld	s5,8(sp)
    80003cfc:	00013b03          	ld	s6,0(sp)
    80003d00:	04010113          	addi	sp,sp,64
    80003d04:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80003d08:	00098593          	mv	a1,s3
    80003d0c:	00004797          	auipc	a5,0x4
    80003d10:	53c7b783          	ld	a5,1340(a5) # 80008248 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003d14:	0007b503          	ld	a0,0(a5)
    80003d18:	00000097          	auipc	ra,0x0
    80003d1c:	834080e7          	jalr	-1996(ra) # 8000354c <_ZN11HeapManager12heapAllocateEm>
                break;
    80003d20:	fa9ff06f          	j	80003cc8 <exceptionHandler+0x108>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    80003d24:	00098593          	mv	a1,s3
    80003d28:	00004797          	auipc	a5,0x4
    80003d2c:	5207b783          	ld	a5,1312(a5) # 80008248 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003d30:	0007b503          	ld	a0,0(a5)
    80003d34:	00000097          	auipc	ra,0x0
    80003d38:	e70080e7          	jalr	-400(ra) # 80003ba4 <_ZN11HeapManager8heapFreeEPv>
                break;
    80003d3c:	f8dff06f          	j	80003cc8 <exceptionHandler+0x108>
                putc('\0'); /// removing this line causes everything to break
    80003d40:	00000513          	li	a0,0
    80003d44:	ffffe097          	auipc	ra,0xffffe
    80003d48:	898080e7          	jalr	-1896(ra) # 800015dc <_Z4putcc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    80003d4c:	00100713          	li	a4,1
    80003d50:	000b0693          	mv	a3,s6
    80003d54:	000a8613          	mv	a2,s5
    80003d58:	000a0593          	mv	a1,s4
    80003d5c:	00098513          	mv	a0,s3
    80003d60:	fffff097          	auipc	ra,0xfffff
    80003d64:	ec0080e7          	jalr	-320(ra) # 80002c20 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80003d68:	f61ff06f          	j	80003cc8 <exceptionHandler+0x108>
                returnVal = _thread::currentThread->exit();
    80003d6c:	fffff097          	auipc	ra,0xfffff
    80003d70:	238080e7          	jalr	568(ra) # 80002fa4 <_ZN7_thread4exitEv>
                break;
    80003d74:	f55ff06f          	j	80003cc8 <exceptionHandler+0x108>
                _thread::dispatch();
    80003d78:	fffff097          	auipc	ra,0xfffff
    80003d7c:	43c080e7          	jalr	1084(ra) # 800031b4 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80003d80:	00000513          	li	a0,0
                break;
    80003d84:	f45ff06f          	j	80003cc8 <exceptionHandler+0x108>
                _thread::currentThread->join((thread_t)a1);
    80003d88:	00098593          	mv	a1,s3
    80003d8c:	00004797          	auipc	a5,0x4
    80003d90:	4e47b783          	ld	a5,1252(a5) # 80008270 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003d94:	0007b503          	ld	a0,0(a5)
    80003d98:	fffff097          	auipc	ra,0xfffff
    80003d9c:	058080e7          	jalr	88(ra) # 80002df0 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80003da0:	00000513          	li	a0,0
                break;
    80003da4:	f25ff06f          	j	80003cc8 <exceptionHandler+0x108>
                _sem::open((sem_t*)a1, unsigned(a2));
    80003da8:	000a059b          	sext.w	a1,s4
    80003dac:	00098513          	mv	a0,s3
    80003db0:	ffffe097          	auipc	ra,0xffffe
    80003db4:	850080e7          	jalr	-1968(ra) # 80001600 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80003db8:	00000513          	li	a0,0
                break;
    80003dbc:	f0dff06f          	j	80003cc8 <exceptionHandler+0x108>
                _sem::close((sem_t)a1);
    80003dc0:	00098513          	mv	a0,s3
    80003dc4:	ffffe097          	auipc	ra,0xffffe
    80003dc8:	898080e7          	jalr	-1896(ra) # 8000165c <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80003dcc:	00000513          	li	a0,0
                break;
    80003dd0:	ef9ff06f          	j	80003cc8 <exceptionHandler+0x108>
                _sem::wait((sem_t)a1);
    80003dd4:	00098513          	mv	a0,s3
    80003dd8:	ffffe097          	auipc	ra,0xffffe
    80003ddc:	8e4080e7          	jalr	-1820(ra) # 800016bc <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    80003de0:	00000513          	li	a0,0
                break;
    80003de4:	ee5ff06f          	j	80003cc8 <exceptionHandler+0x108>
                _sem::signal((sem_t)a1);
    80003de8:	00098513          	mv	a0,s3
    80003dec:	ffffe097          	auipc	ra,0xffffe
    80003df0:	974080e7          	jalr	-1676(ra) # 80001760 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80003df4:	00000513          	li	a0,0
                break;
    80003df8:	ed1ff06f          	j	80003cc8 <exceptionHandler+0x108>
                returnVal = Timer::getInstance().sleep(a1);
    80003dfc:	ffffd097          	auipc	ra,0xffffd
    80003e00:	3bc080e7          	jalr	956(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    80003e04:	00098593          	mv	a1,s3
    80003e08:	ffffd097          	auipc	ra,0xffffd
    80003e0c:	4b4080e7          	jalr	1204(ra) # 800012bc <_ZN5Timer5sleepEm>
                break;
    80003e10:	eb9ff06f          	j	80003cc8 <exceptionHandler+0x108>
                returnVal = Console::getc();
    80003e14:	ffffe097          	auipc	ra,0xffffe
    80003e18:	19c080e7          	jalr	412(ra) # 80001fb0 <_ZN7Console4getcEv>
                break;
    80003e1c:	eadff06f          	j	80003cc8 <exceptionHandler+0x108>
                Console::putc(a1);
    80003e20:	0ff9f513          	andi	a0,s3,255
    80003e24:	ffffe097          	auipc	ra,0xffffe
    80003e28:	154080e7          	jalr	340(ra) # 80001f78 <_ZN7Console4putcEc>
    uint64 returnVal = 0;
    80003e2c:	00000513          	li	a0,0
                break;
    80003e30:	e99ff06f          	j	80003cc8 <exceptionHandler+0x108>
        switch(a0){
    80003e34:	00000513          	li	a0,0
    80003e38:	e91ff06f          	j	80003cc8 <exceptionHandler+0x108>
    80003e3c:	00000513          	li	a0,0
    80003e40:	e89ff06f          	j	80003cc8 <exceptionHandler+0x108>
        putc('\n');
    80003e44:	00a00513          	li	a0,10
    80003e48:	ffffd097          	auipc	ra,0xffffd
    80003e4c:	794080e7          	jalr	1940(ra) # 800015dc <_Z4putcc>
        putc('E');
    80003e50:	04500513          	li	a0,69
    80003e54:	ffffd097          	auipc	ra,0xffffd
    80003e58:	788080e7          	jalr	1928(ra) # 800015dc <_Z4putcc>
        putc('r');
    80003e5c:	07200513          	li	a0,114
    80003e60:	ffffd097          	auipc	ra,0xffffd
    80003e64:	77c080e7          	jalr	1916(ra) # 800015dc <_Z4putcc>
        putc('r');
    80003e68:	07200513          	li	a0,114
    80003e6c:	ffffd097          	auipc	ra,0xffffd
    80003e70:	770080e7          	jalr	1904(ra) # 800015dc <_Z4putcc>
        putc('o');
    80003e74:	06f00513          	li	a0,111
    80003e78:	ffffd097          	auipc	ra,0xffffd
    80003e7c:	764080e7          	jalr	1892(ra) # 800015dc <_Z4putcc>
        putc('r');
    80003e80:	07200513          	li	a0,114
    80003e84:	ffffd097          	auipc	ra,0xffffd
    80003e88:	758080e7          	jalr	1880(ra) # 800015dc <_Z4putcc>
        putc(':');
    80003e8c:	03a00513          	li	a0,58
    80003e90:	ffffd097          	auipc	ra,0xffffd
    80003e94:	74c080e7          	jalr	1868(ra) # 800015dc <_Z4putcc>
        putc(' ');
    80003e98:	02000513          	li	a0,32
    80003e9c:	ffffd097          	auipc	ra,0xffffd
    80003ea0:	740080e7          	jalr	1856(ra) # 800015dc <_Z4putcc>
        putc('i');
    80003ea4:	06900513          	li	a0,105
    80003ea8:	ffffd097          	auipc	ra,0xffffd
    80003eac:	734080e7          	jalr	1844(ra) # 800015dc <_Z4putcc>
        putc('l');
    80003eb0:	06c00513          	li	a0,108
    80003eb4:	ffffd097          	auipc	ra,0xffffd
    80003eb8:	728080e7          	jalr	1832(ra) # 800015dc <_Z4putcc>
        putc('l');
    80003ebc:	06c00513          	li	a0,108
    80003ec0:	ffffd097          	auipc	ra,0xffffd
    80003ec4:	71c080e7          	jalr	1820(ra) # 800015dc <_Z4putcc>
        putc('e');
    80003ec8:	06500513          	li	a0,101
    80003ecc:	ffffd097          	auipc	ra,0xffffd
    80003ed0:	710080e7          	jalr	1808(ra) # 800015dc <_Z4putcc>
        putc('g');
    80003ed4:	06700513          	li	a0,103
    80003ed8:	ffffd097          	auipc	ra,0xffffd
    80003edc:	704080e7          	jalr	1796(ra) # 800015dc <_Z4putcc>
        putc('a');
    80003ee0:	06100513          	li	a0,97
    80003ee4:	ffffd097          	auipc	ra,0xffffd
    80003ee8:	6f8080e7          	jalr	1784(ra) # 800015dc <_Z4putcc>
        putc('l');
    80003eec:	06c00513          	li	a0,108
    80003ef0:	ffffd097          	auipc	ra,0xffffd
    80003ef4:	6ec080e7          	jalr	1772(ra) # 800015dc <_Z4putcc>
        putc(' ');
    80003ef8:	02000513          	li	a0,32
    80003efc:	ffffd097          	auipc	ra,0xffffd
    80003f00:	6e0080e7          	jalr	1760(ra) # 800015dc <_Z4putcc>
        putc('r');
    80003f04:	07200513          	li	a0,114
    80003f08:	ffffd097          	auipc	ra,0xffffd
    80003f0c:	6d4080e7          	jalr	1748(ra) # 800015dc <_Z4putcc>
        putc('e');
    80003f10:	06500513          	li	a0,101
    80003f14:	ffffd097          	auipc	ra,0xffffd
    80003f18:	6c8080e7          	jalr	1736(ra) # 800015dc <_Z4putcc>
        putc('a');
    80003f1c:	06100513          	li	a0,97
    80003f20:	ffffd097          	auipc	ra,0xffffd
    80003f24:	6bc080e7          	jalr	1724(ra) # 800015dc <_Z4putcc>
        putc('d');
    80003f28:	06400513          	li	a0,100
    80003f2c:	ffffd097          	auipc	ra,0xffffd
    80003f30:	6b0080e7          	jalr	1712(ra) # 800015dc <_Z4putcc>
        putc('!');
    80003f34:	02100513          	li	a0,33
    80003f38:	ffffd097          	auipc	ra,0xffffd
    80003f3c:	6a4080e7          	jalr	1700(ra) # 800015dc <_Z4putcc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80003f40:	14102973          	csrr	s2,sepc
        putc('\n');
    80003f44:	00a00513          	li	a0,10
    80003f48:	ffffd097          	auipc	ra,0xffffd
    80003f4c:	694080e7          	jalr	1684(ra) # 800015dc <_Z4putcc>
        putc('P');
    80003f50:	05000513          	li	a0,80
    80003f54:	ffffd097          	auipc	ra,0xffffd
    80003f58:	688080e7          	jalr	1672(ra) # 800015dc <_Z4putcc>
        putc('C');
    80003f5c:	04300513          	li	a0,67
    80003f60:	ffffd097          	auipc	ra,0xffffd
    80003f64:	67c080e7          	jalr	1660(ra) # 800015dc <_Z4putcc>
        putc(':');
    80003f68:	03a00513          	li	a0,58
    80003f6c:	ffffd097          	auipc	ra,0xffffd
    80003f70:	670080e7          	jalr	1648(ra) # 800015dc <_Z4putcc>
        putc(' ');
    80003f74:	02000513          	li	a0,32
    80003f78:	ffffd097          	auipc	ra,0xffffd
    80003f7c:	664080e7          	jalr	1636(ra) # 800015dc <_Z4putcc>
        putc('0');
    80003f80:	03000513          	li	a0,48
    80003f84:	ffffd097          	auipc	ra,0xffffd
    80003f88:	658080e7          	jalr	1624(ra) # 800015dc <_Z4putcc>
        putc('x');
    80003f8c:	07800513          	li	a0,120
    80003f90:	ffffd097          	auipc	ra,0xffffd
    80003f94:	64c080e7          	jalr	1612(ra) # 800015dc <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80003f98:	00f00493          	li	s1,15
    80003f9c:	0140006f          	j	80003fb0 <exceptionHandler+0x3f0>
                putc('A' + tmp - 10);
    80003fa0:	03750513          	addi	a0,a0,55
    80003fa4:	ffffd097          	auipc	ra,0xffffd
    80003fa8:	638080e7          	jalr	1592(ra) # 800015dc <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80003fac:	fff4849b          	addiw	s1,s1,-1
    80003fb0:	0204c463          	bltz	s1,80003fd8 <exceptionHandler+0x418>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    80003fb4:	0024951b          	slliw	a0,s1,0x2
    80003fb8:	00a95533          	srl	a0,s2,a0
    80003fbc:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80003fc0:	00900793          	li	a5,9
    80003fc4:	fca7eee3          	bltu	a5,a0,80003fa0 <exceptionHandler+0x3e0>
                putc('0' + tmp);
    80003fc8:	03050513          	addi	a0,a0,48
    80003fcc:	ffffd097          	auipc	ra,0xffffd
    80003fd0:	610080e7          	jalr	1552(ra) # 800015dc <_Z4putcc>
    80003fd4:	fd9ff06f          	j	80003fac <exceptionHandler+0x3ec>
        assert(false);
    80003fd8:	00003697          	auipc	a3,0x3
    80003fdc:	2a868693          	addi	a3,a3,680 # 80007280 <CONSOLE_STATUS+0x270>
    80003fe0:	08900613          	li	a2,137
    80003fe4:	00003597          	auipc	a1,0x3
    80003fe8:	2b458593          	addi	a1,a1,692 # 80007298 <CONSOLE_STATUS+0x288>
    80003fec:	00003517          	auipc	a0,0x3
    80003ff0:	2cc50513          	addi	a0,a0,716 # 800072b8 <CONSOLE_STATUS+0x2a8>
    80003ff4:	ffffe097          	auipc	ra,0xffffe
    80003ff8:	b2c080e7          	jalr	-1236(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
    80003ffc:	ce5ff06f          	j	80003ce0 <exceptionHandler+0x120>
        putc('\n');
    80004000:	00a00513          	li	a0,10
    80004004:	ffffd097          	auipc	ra,0xffffd
    80004008:	5d8080e7          	jalr	1496(ra) # 800015dc <_Z4putcc>
        putc('E');
    8000400c:	04500513          	li	a0,69
    80004010:	ffffd097          	auipc	ra,0xffffd
    80004014:	5cc080e7          	jalr	1484(ra) # 800015dc <_Z4putcc>
        putc('r');
    80004018:	07200513          	li	a0,114
    8000401c:	ffffd097          	auipc	ra,0xffffd
    80004020:	5c0080e7          	jalr	1472(ra) # 800015dc <_Z4putcc>
        putc('r');
    80004024:	07200513          	li	a0,114
    80004028:	ffffd097          	auipc	ra,0xffffd
    8000402c:	5b4080e7          	jalr	1460(ra) # 800015dc <_Z4putcc>
        putc('o');
    80004030:	06f00513          	li	a0,111
    80004034:	ffffd097          	auipc	ra,0xffffd
    80004038:	5a8080e7          	jalr	1448(ra) # 800015dc <_Z4putcc>
        putc('r');
    8000403c:	07200513          	li	a0,114
    80004040:	ffffd097          	auipc	ra,0xffffd
    80004044:	59c080e7          	jalr	1436(ra) # 800015dc <_Z4putcc>
        putc(':');
    80004048:	03a00513          	li	a0,58
    8000404c:	ffffd097          	auipc	ra,0xffffd
    80004050:	590080e7          	jalr	1424(ra) # 800015dc <_Z4putcc>
        putc(' ');
    80004054:	02000513          	li	a0,32
    80004058:	ffffd097          	auipc	ra,0xffffd
    8000405c:	584080e7          	jalr	1412(ra) # 800015dc <_Z4putcc>
        putc('i');
    80004060:	06900513          	li	a0,105
    80004064:	ffffd097          	auipc	ra,0xffffd
    80004068:	578080e7          	jalr	1400(ra) # 800015dc <_Z4putcc>
        putc('l');
    8000406c:	06c00513          	li	a0,108
    80004070:	ffffd097          	auipc	ra,0xffffd
    80004074:	56c080e7          	jalr	1388(ra) # 800015dc <_Z4putcc>
        putc('l');
    80004078:	06c00513          	li	a0,108
    8000407c:	ffffd097          	auipc	ra,0xffffd
    80004080:	560080e7          	jalr	1376(ra) # 800015dc <_Z4putcc>
        putc('e');
    80004084:	06500513          	li	a0,101
    80004088:	ffffd097          	auipc	ra,0xffffd
    8000408c:	554080e7          	jalr	1364(ra) # 800015dc <_Z4putcc>
        putc('g');
    80004090:	06700513          	li	a0,103
    80004094:	ffffd097          	auipc	ra,0xffffd
    80004098:	548080e7          	jalr	1352(ra) # 800015dc <_Z4putcc>
        putc('a');
    8000409c:	06100513          	li	a0,97
    800040a0:	ffffd097          	auipc	ra,0xffffd
    800040a4:	53c080e7          	jalr	1340(ra) # 800015dc <_Z4putcc>
        putc('l');
    800040a8:	06c00513          	li	a0,108
    800040ac:	ffffd097          	auipc	ra,0xffffd
    800040b0:	530080e7          	jalr	1328(ra) # 800015dc <_Z4putcc>
        putc(' ');
    800040b4:	02000513          	li	a0,32
    800040b8:	ffffd097          	auipc	ra,0xffffd
    800040bc:	524080e7          	jalr	1316(ra) # 800015dc <_Z4putcc>
        putc('w');
    800040c0:	07700513          	li	a0,119
    800040c4:	ffffd097          	auipc	ra,0xffffd
    800040c8:	518080e7          	jalr	1304(ra) # 800015dc <_Z4putcc>
        putc('r');
    800040cc:	07200513          	li	a0,114
    800040d0:	ffffd097          	auipc	ra,0xffffd
    800040d4:	50c080e7          	jalr	1292(ra) # 800015dc <_Z4putcc>
        putc('i');
    800040d8:	06900513          	li	a0,105
    800040dc:	ffffd097          	auipc	ra,0xffffd
    800040e0:	500080e7          	jalr	1280(ra) # 800015dc <_Z4putcc>
        putc('t');
    800040e4:	07400513          	li	a0,116
    800040e8:	ffffd097          	auipc	ra,0xffffd
    800040ec:	4f4080e7          	jalr	1268(ra) # 800015dc <_Z4putcc>
        putc('e');
    800040f0:	06500513          	li	a0,101
    800040f4:	ffffd097          	auipc	ra,0xffffd
    800040f8:	4e8080e7          	jalr	1256(ra) # 800015dc <_Z4putcc>
        putc('!');
    800040fc:	02100513          	li	a0,33
    80004100:	ffffd097          	auipc	ra,0xffffd
    80004104:	4dc080e7          	jalr	1244(ra) # 800015dc <_Z4putcc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80004108:	14102973          	csrr	s2,sepc
        putc('\n');
    8000410c:	00a00513          	li	a0,10
    80004110:	ffffd097          	auipc	ra,0xffffd
    80004114:	4cc080e7          	jalr	1228(ra) # 800015dc <_Z4putcc>
        putc('P');
    80004118:	05000513          	li	a0,80
    8000411c:	ffffd097          	auipc	ra,0xffffd
    80004120:	4c0080e7          	jalr	1216(ra) # 800015dc <_Z4putcc>
        putc('C');
    80004124:	04300513          	li	a0,67
    80004128:	ffffd097          	auipc	ra,0xffffd
    8000412c:	4b4080e7          	jalr	1204(ra) # 800015dc <_Z4putcc>
        putc(':');
    80004130:	03a00513          	li	a0,58
    80004134:	ffffd097          	auipc	ra,0xffffd
    80004138:	4a8080e7          	jalr	1192(ra) # 800015dc <_Z4putcc>
        putc(' ');
    8000413c:	02000513          	li	a0,32
    80004140:	ffffd097          	auipc	ra,0xffffd
    80004144:	49c080e7          	jalr	1180(ra) # 800015dc <_Z4putcc>
        putc('0');
    80004148:	03000513          	li	a0,48
    8000414c:	ffffd097          	auipc	ra,0xffffd
    80004150:	490080e7          	jalr	1168(ra) # 800015dc <_Z4putcc>
        putc('x');
    80004154:	07800513          	li	a0,120
    80004158:	ffffd097          	auipc	ra,0xffffd
    8000415c:	484080e7          	jalr	1156(ra) # 800015dc <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004160:	00f00493          	li	s1,15
    80004164:	0140006f          	j	80004178 <exceptionHandler+0x5b8>
                putc('A' + tmp - 10);
    80004168:	03750513          	addi	a0,a0,55
    8000416c:	ffffd097          	auipc	ra,0xffffd
    80004170:	470080e7          	jalr	1136(ra) # 800015dc <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004174:	fff4849b          	addiw	s1,s1,-1
    80004178:	0204c463          	bltz	s1,800041a0 <exceptionHandler+0x5e0>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    8000417c:	0024951b          	slliw	a0,s1,0x2
    80004180:	00a95533          	srl	a0,s2,a0
    80004184:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004188:	00900793          	li	a5,9
    8000418c:	fca7eee3          	bltu	a5,a0,80004168 <exceptionHandler+0x5a8>
                putc('0' + tmp);
    80004190:	03050513          	addi	a0,a0,48
    80004194:	ffffd097          	auipc	ra,0xffffd
    80004198:	448080e7          	jalr	1096(ra) # 800015dc <_Z4putcc>
    8000419c:	fd9ff06f          	j	80004174 <exceptionHandler+0x5b4>
        assert(false);
    800041a0:	00003697          	auipc	a3,0x3
    800041a4:	0e068693          	addi	a3,a3,224 # 80007280 <CONSOLE_STATUS+0x270>
    800041a8:	0b300613          	li	a2,179
    800041ac:	00003597          	auipc	a1,0x3
    800041b0:	0ec58593          	addi	a1,a1,236 # 80007298 <CONSOLE_STATUS+0x288>
    800041b4:	00003517          	auipc	a0,0x3
    800041b8:	10450513          	addi	a0,a0,260 # 800072b8 <CONSOLE_STATUS+0x2a8>
    800041bc:	ffffe097          	auipc	ra,0xffffe
    800041c0:	964080e7          	jalr	-1692(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
    800041c4:	b1dff06f          	j	80003ce0 <exceptionHandler+0x120>
        Timer::getInstance().tick();
    800041c8:	ffffd097          	auipc	ra,0xffffd
    800041cc:	ff0080e7          	jalr	-16(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    800041d0:	ffffd097          	auipc	ra,0xffffd
    800041d4:	04c080e7          	jalr	76(ra) # 8000121c <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    800041d8:	00004797          	auipc	a5,0x4
    800041dc:	0987b783          	ld	a5,152(a5) # 80008270 <_GLOBAL_OFFSET_TABLE_+0x58>
    800041e0:	0007b503          	ld	a0,0(a5)
    800041e4:	fffff097          	auipc	ra,0xfffff
    800041e8:	d30080e7          	jalr	-720(ra) # 80002f14 <_ZN7_thread4tickEv>
    800041ec:	00051c63          	bnez	a0,80004204 <exceptionHandler+0x644>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    800041f0:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800041f4:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800041f8:	00200793          	li	a5,2
    800041fc:	1447b073          	csrc	sip,a5
    80004200:	ae1ff06f          	j	80003ce0 <exceptionHandler+0x120>
        assert(_thread::currentThread->tick() == 0);
    80004204:	00003697          	auipc	a3,0x3
    80004208:	07c68693          	addi	a3,a3,124 # 80007280 <CONSOLE_STATUS+0x270>
    8000420c:	0b700613          	li	a2,183
    80004210:	00003597          	auipc	a1,0x3
    80004214:	08858593          	addi	a1,a1,136 # 80007298 <CONSOLE_STATUS+0x288>
    80004218:	00003517          	auipc	a0,0x3
    8000421c:	0a850513          	addi	a0,a0,168 # 800072c0 <CONSOLE_STATUS+0x2b0>
    80004220:	ffffe097          	auipc	ra,0xffffe
    80004224:	900080e7          	jalr	-1792(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
    80004228:	fc9ff06f          	j	800041f0 <exceptionHandler+0x630>
        if(irq == CONSOLE_IRQ)Console::inputHandler();
    8000422c:	ffffe097          	auipc	ra,0xffffe
    80004230:	e7c080e7          	jalr	-388(ra) # 800020a8 <_ZN7Console12inputHandlerEv>
    80004234:	a25ff06f          	j	80003c58 <exceptionHandler+0x98>

0000000080004238 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80004238:	fe010113          	addi	sp,sp,-32
    8000423c:	00113c23          	sd	ra,24(sp)
    80004240:	00813823          	sd	s0,16(sp)
    80004244:	00913423          	sd	s1,8(sp)
    80004248:	02010413          	addi	s0,sp,32
    8000424c:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80004250:	00004797          	auipc	a5,0x4
    80004254:	0a87b783          	ld	a5,168(a5) # 800082f8 <_ZN9Scheduler9singletonE>
    80004258:	02079463          	bnez	a5,80004280 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    8000425c:	00004797          	auipc	a5,0x4
    80004260:	0897be23          	sd	s1,156(a5) # 800082f8 <_ZN9Scheduler9singletonE>
    head = 0;
    80004264:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80004268:	0004b423          	sd	zero,8(s1)
}
    8000426c:	01813083          	ld	ra,24(sp)
    80004270:	01013403          	ld	s0,16(sp)
    80004274:	00813483          	ld	s1,8(sp)
    80004278:	02010113          	addi	sp,sp,32
    8000427c:	00008067          	ret
    assert(singleton == 0);
    80004280:	00003697          	auipc	a3,0x3
    80004284:	17068693          	addi	a3,a3,368 # 800073f0 <CONSOLE_STATUS+0x3e0>
    80004288:	01800613          	li	a2,24
    8000428c:	00003597          	auipc	a1,0x3
    80004290:	17c58593          	addi	a1,a1,380 # 80007408 <CONSOLE_STATUS+0x3f8>
    80004294:	00003517          	auipc	a0,0x3
    80004298:	18450513          	addi	a0,a0,388 # 80007418 <CONSOLE_STATUS+0x408>
    8000429c:	ffffe097          	auipc	ra,0xffffe
    800042a0:	884080e7          	jalr	-1916(ra) # 80001b20 <_Z13assert_failedPKcS0_jS0_>
    800042a4:	fb9ff06f          	j	8000425c <_ZN9SchedulerC1Ev+0x24>

00000000800042a8 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    800042a8:	ff010113          	addi	sp,sp,-16
    800042ac:	00813423          	sd	s0,8(sp)
    800042b0:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    800042b4:	00004797          	auipc	a5,0x4
    800042b8:	0447b783          	ld	a5,68(a5) # 800082f8 <_ZN9Scheduler9singletonE>
    800042bc:	0007b503          	ld	a0,0(a5)
}
    800042c0:	00153513          	seqz	a0,a0
    800042c4:	00813403          	ld	s0,8(sp)
    800042c8:	01010113          	addi	sp,sp,16
    800042cc:	00008067          	ret

00000000800042d0 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    800042d0:	fe010113          	addi	sp,sp,-32
    800042d4:	00113c23          	sd	ra,24(sp)
    800042d8:	00813823          	sd	s0,16(sp)
    800042dc:	00913423          	sd	s1,8(sp)
    800042e0:	01213023          	sd	s2,0(sp)
    800042e4:	02010413          	addi	s0,sp,32
    800042e8:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    800042ec:	00004917          	auipc	s2,0x4
    800042f0:	00c93903          	ld	s2,12(s2) # 800082f8 <_ZN9Scheduler9singletonE>
    800042f4:	00093783          	ld	a5,0(s2)
    800042f8:	12078c63          	beqz	a5,80004430 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    800042fc:	00893903          	ld	s2,8(s2)
    80004300:	01000513          	li	a0,16
    80004304:	ffffd097          	auipc	ra,0xffffd
    80004308:	08c080e7          	jalr	140(ra) # 80001390 <_Z9mem_allocm>
    8000430c:	00a90423          	sb	a0,8(s2)
    80004310:	00855793          	srli	a5,a0,0x8
    80004314:	00f904a3          	sb	a5,9(s2)
    80004318:	01055793          	srli	a5,a0,0x10
    8000431c:	00f90523          	sb	a5,10(s2)
    80004320:	0185579b          	srliw	a5,a0,0x18
    80004324:	00f905a3          	sb	a5,11(s2)
    80004328:	02055793          	srli	a5,a0,0x20
    8000432c:	00f90623          	sb	a5,12(s2)
    80004330:	02855793          	srli	a5,a0,0x28
    80004334:	00f906a3          	sb	a5,13(s2)
    80004338:	03055793          	srli	a5,a0,0x30
    8000433c:	00f90723          	sb	a5,14(s2)
    80004340:	03855513          	srli	a0,a0,0x38
    80004344:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80004348:	00004617          	auipc	a2,0x4
    8000434c:	fb060613          	addi	a2,a2,-80 # 800082f8 <_ZN9Scheduler9singletonE>
    80004350:	00063583          	ld	a1,0(a2)
    80004354:	0085b703          	ld	a4,8(a1)
    80004358:	00874783          	lbu	a5,8(a4)
    8000435c:	00974683          	lbu	a3,9(a4)
    80004360:	00869693          	slli	a3,a3,0x8
    80004364:	00f6e6b3          	or	a3,a3,a5
    80004368:	00a74783          	lbu	a5,10(a4)
    8000436c:	01079793          	slli	a5,a5,0x10
    80004370:	00d7e6b3          	or	a3,a5,a3
    80004374:	00b74783          	lbu	a5,11(a4)
    80004378:	01879793          	slli	a5,a5,0x18
    8000437c:	00d7e7b3          	or	a5,a5,a3
    80004380:	00c74683          	lbu	a3,12(a4)
    80004384:	02069693          	slli	a3,a3,0x20
    80004388:	00f6e7b3          	or	a5,a3,a5
    8000438c:	00d74683          	lbu	a3,13(a4)
    80004390:	02869693          	slli	a3,a3,0x28
    80004394:	00f6e6b3          	or	a3,a3,a5
    80004398:	00e74783          	lbu	a5,14(a4)
    8000439c:	03079793          	slli	a5,a5,0x30
    800043a0:	00d7e6b3          	or	a3,a5,a3
    800043a4:	00f74783          	lbu	a5,15(a4)
    800043a8:	03879793          	slli	a5,a5,0x38
    800043ac:	00d7e7b3          	or	a5,a5,a3
    800043b0:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    800043b4:	00978023          	sb	s1,0(a5)
    800043b8:	0084d713          	srli	a4,s1,0x8
    800043bc:	00e780a3          	sb	a4,1(a5)
    800043c0:	0104d713          	srli	a4,s1,0x10
    800043c4:	00e78123          	sb	a4,2(a5)
    800043c8:	0184d71b          	srliw	a4,s1,0x18
    800043cc:	00e781a3          	sb	a4,3(a5)
    800043d0:	0204d713          	srli	a4,s1,0x20
    800043d4:	00e78223          	sb	a4,4(a5)
    800043d8:	0284d713          	srli	a4,s1,0x28
    800043dc:	00e782a3          	sb	a4,5(a5)
    800043e0:	0304d713          	srli	a4,s1,0x30
    800043e4:	00e78323          	sb	a4,6(a5)
    800043e8:	0384d493          	srli	s1,s1,0x38
    800043ec:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    800043f0:	00063783          	ld	a5,0(a2)
    800043f4:	0087b783          	ld	a5,8(a5)
    800043f8:	00078423          	sb	zero,8(a5)
    800043fc:	000784a3          	sb	zero,9(a5)
    80004400:	00078523          	sb	zero,10(a5)
    80004404:	000785a3          	sb	zero,11(a5)
    80004408:	00078623          	sb	zero,12(a5)
    8000440c:	000786a3          	sb	zero,13(a5)
    80004410:	00078723          	sb	zero,14(a5)
    80004414:	000787a3          	sb	zero,15(a5)
    }
}
    80004418:	01813083          	ld	ra,24(sp)
    8000441c:	01013403          	ld	s0,16(sp)
    80004420:	00813483          	ld	s1,8(sp)
    80004424:	00013903          	ld	s2,0(sp)
    80004428:	02010113          	addi	sp,sp,32
    8000442c:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80004430:	01000513          	li	a0,16
    80004434:	ffffd097          	auipc	ra,0xffffd
    80004438:	f5c080e7          	jalr	-164(ra) # 80001390 <_Z9mem_allocm>
    8000443c:	00a93423          	sd	a0,8(s2)
    80004440:	00004717          	auipc	a4,0x4
    80004444:	eb870713          	addi	a4,a4,-328 # 800082f8 <_ZN9Scheduler9singletonE>
    80004448:	00073783          	ld	a5,0(a4)
    8000444c:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80004450:	00073783          	ld	a5,0(a4)
    80004454:	0007b783          	ld	a5,0(a5)
    80004458:	00978023          	sb	s1,0(a5)
    8000445c:	0084d693          	srli	a3,s1,0x8
    80004460:	00d780a3          	sb	a3,1(a5)
    80004464:	0104d693          	srli	a3,s1,0x10
    80004468:	00d78123          	sb	a3,2(a5)
    8000446c:	0184d69b          	srliw	a3,s1,0x18
    80004470:	00d781a3          	sb	a3,3(a5)
    80004474:	0204d693          	srli	a3,s1,0x20
    80004478:	00d78223          	sb	a3,4(a5)
    8000447c:	0284d693          	srli	a3,s1,0x28
    80004480:	00d782a3          	sb	a3,5(a5)
    80004484:	0304d693          	srli	a3,s1,0x30
    80004488:	00d78323          	sb	a3,6(a5)
    8000448c:	0384d493          	srli	s1,s1,0x38
    80004490:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80004494:	00073783          	ld	a5,0(a4)
    80004498:	0007b783          	ld	a5,0(a5)
    8000449c:	00078423          	sb	zero,8(a5)
    800044a0:	000784a3          	sb	zero,9(a5)
    800044a4:	00078523          	sb	zero,10(a5)
    800044a8:	000785a3          	sb	zero,11(a5)
    800044ac:	00078623          	sb	zero,12(a5)
    800044b0:	000786a3          	sb	zero,13(a5)
    800044b4:	00078723          	sb	zero,14(a5)
    800044b8:	000787a3          	sb	zero,15(a5)
    800044bc:	f5dff06f          	j	80004418 <_ZN9Scheduler3putEP7_thread+0x148>

00000000800044c0 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    800044c0:	fe010113          	addi	sp,sp,-32
    800044c4:	00113c23          	sd	ra,24(sp)
    800044c8:	00813823          	sd	s0,16(sp)
    800044cc:	00913423          	sd	s1,8(sp)
    800044d0:	02010413          	addi	s0,sp,32
    ThreadList* tmp = singleton->head;
    800044d4:	00004697          	auipc	a3,0x4
    800044d8:	e246b683          	ld	a3,-476(a3) # 800082f8 <_ZN9Scheduler9singletonE>
    800044dc:	0006b503          	ld	a0,0(a3)
    if(tmp == 0){
    800044e0:	0e050863          	beqz	a0,800045d0 <_ZN9Scheduler3getEv+0x110>
        return 0;
    }
    thread_t thread = tmp->thread;
    800044e4:	00054483          	lbu	s1,0(a0)
    800044e8:	00154783          	lbu	a5,1(a0)
    800044ec:	00879793          	slli	a5,a5,0x8
    800044f0:	0097e7b3          	or	a5,a5,s1
    800044f4:	00254483          	lbu	s1,2(a0)
    800044f8:	01049493          	slli	s1,s1,0x10
    800044fc:	00f4e7b3          	or	a5,s1,a5
    80004500:	00354483          	lbu	s1,3(a0)
    80004504:	01849493          	slli	s1,s1,0x18
    80004508:	00f4e4b3          	or	s1,s1,a5
    8000450c:	00454783          	lbu	a5,4(a0)
    80004510:	02079793          	slli	a5,a5,0x20
    80004514:	0097e4b3          	or	s1,a5,s1
    80004518:	00554783          	lbu	a5,5(a0)
    8000451c:	02879793          	slli	a5,a5,0x28
    80004520:	0097e7b3          	or	a5,a5,s1
    80004524:	00654483          	lbu	s1,6(a0)
    80004528:	03049493          	slli	s1,s1,0x30
    8000452c:	00f4e7b3          	or	a5,s1,a5
    80004530:	00754483          	lbu	s1,7(a0)
    80004534:	03849493          	slli	s1,s1,0x38
    80004538:	00f4e4b3          	or	s1,s1,a5
    singleton->head = tmp->next;
    8000453c:	00854783          	lbu	a5,8(a0)
    80004540:	00954703          	lbu	a4,9(a0)
    80004544:	00871713          	slli	a4,a4,0x8
    80004548:	00f76733          	or	a4,a4,a5
    8000454c:	00a54783          	lbu	a5,10(a0)
    80004550:	01079793          	slli	a5,a5,0x10
    80004554:	00e7e733          	or	a4,a5,a4
    80004558:	00b54783          	lbu	a5,11(a0)
    8000455c:	01879793          	slli	a5,a5,0x18
    80004560:	00e7e7b3          	or	a5,a5,a4
    80004564:	00c54703          	lbu	a4,12(a0)
    80004568:	02071713          	slli	a4,a4,0x20
    8000456c:	00f767b3          	or	a5,a4,a5
    80004570:	00d54703          	lbu	a4,13(a0)
    80004574:	02871713          	slli	a4,a4,0x28
    80004578:	00f76733          	or	a4,a4,a5
    8000457c:	00e54783          	lbu	a5,14(a0)
    80004580:	03079793          	slli	a5,a5,0x30
    80004584:	00e7e733          	or	a4,a5,a4
    80004588:	00f54783          	lbu	a5,15(a0)
    8000458c:	03879793          	slli	a5,a5,0x38
    80004590:	00e7e7b3          	or	a5,a5,a4
    80004594:	00f6b023          	sd	a5,0(a3)
    if(singleton->head == 0){
    80004598:	00004797          	auipc	a5,0x4
    8000459c:	d607b783          	ld	a5,-672(a5) # 800082f8 <_ZN9Scheduler9singletonE>
    800045a0:	0007b703          	ld	a4,0(a5)
    800045a4:	02070263          	beqz	a4,800045c8 <_ZN9Scheduler3getEv+0x108>
        singleton->tail = 0;
    }
    mem_free(tmp);
    800045a8:	ffffd097          	auipc	ra,0xffffd
    800045ac:	e18080e7          	jalr	-488(ra) # 800013c0 <_Z8mem_freePv>
    return thread;
}
    800045b0:	00048513          	mv	a0,s1
    800045b4:	01813083          	ld	ra,24(sp)
    800045b8:	01013403          	ld	s0,16(sp)
    800045bc:	00813483          	ld	s1,8(sp)
    800045c0:	02010113          	addi	sp,sp,32
    800045c4:	00008067          	ret
        singleton->tail = 0;
    800045c8:	0007b423          	sd	zero,8(a5)
    800045cc:	fddff06f          	j	800045a8 <_ZN9Scheduler3getEv+0xe8>
        return 0;
    800045d0:	00050493          	mv	s1,a0
    800045d4:	fddff06f          	j	800045b0 <_ZN9Scheduler3getEv+0xf0>

00000000800045d8 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    800045d8:	ff010113          	addi	sp,sp,-16
    800045dc:	00813423          	sd	s0,8(sp)
    800045e0:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    800045e4:	00004797          	auipc	a5,0x4
    800045e8:	d147b783          	ld	a5,-748(a5) # 800082f8 <_ZN9Scheduler9singletonE>
    800045ec:	0007b783          	ld	a5,0(a5)
    int count = 0;
    800045f0:	00000513          	li	a0,0
    while(tmp != 0){
    800045f4:	06078263          	beqz	a5,80004658 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    800045f8:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    800045fc:	0087c683          	lbu	a3,8(a5)
    80004600:	0097c703          	lbu	a4,9(a5)
    80004604:	00871713          	slli	a4,a4,0x8
    80004608:	00d766b3          	or	a3,a4,a3
    8000460c:	00a7c703          	lbu	a4,10(a5)
    80004610:	01071713          	slli	a4,a4,0x10
    80004614:	00d76733          	or	a4,a4,a3
    80004618:	00b7c683          	lbu	a3,11(a5)
    8000461c:	01869693          	slli	a3,a3,0x18
    80004620:	00e6e733          	or	a4,a3,a4
    80004624:	00c7c683          	lbu	a3,12(a5)
    80004628:	02069693          	slli	a3,a3,0x20
    8000462c:	00e6e6b3          	or	a3,a3,a4
    80004630:	00d7c703          	lbu	a4,13(a5)
    80004634:	02871713          	slli	a4,a4,0x28
    80004638:	00d766b3          	or	a3,a4,a3
    8000463c:	00e7c703          	lbu	a4,14(a5)
    80004640:	03071713          	slli	a4,a4,0x30
    80004644:	00d76733          	or	a4,a4,a3
    80004648:	00f7c783          	lbu	a5,15(a5)
    8000464c:	03879793          	slli	a5,a5,0x38
    80004650:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80004654:	fa1ff06f          	j	800045f4 <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80004658:	00813403          	ld	s0,8(sp)
    8000465c:	01010113          	addi	sp,sp,16
    80004660:	00008067          	ret

0000000080004664 <start>:
    80004664:	ff010113          	addi	sp,sp,-16
    80004668:	00813423          	sd	s0,8(sp)
    8000466c:	01010413          	addi	s0,sp,16
    80004670:	300027f3          	csrr	a5,mstatus
    80004674:	ffffe737          	lui	a4,0xffffe
    80004678:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff529f>
    8000467c:	00e7f7b3          	and	a5,a5,a4
    80004680:	00001737          	lui	a4,0x1
    80004684:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004688:	00e7e7b3          	or	a5,a5,a4
    8000468c:	30079073          	csrw	mstatus,a5
    80004690:	00000797          	auipc	a5,0x0
    80004694:	16078793          	addi	a5,a5,352 # 800047f0 <system_main>
    80004698:	34179073          	csrw	mepc,a5
    8000469c:	00000793          	li	a5,0
    800046a0:	18079073          	csrw	satp,a5
    800046a4:	000107b7          	lui	a5,0x10
    800046a8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800046ac:	30279073          	csrw	medeleg,a5
    800046b0:	30379073          	csrw	mideleg,a5
    800046b4:	104027f3          	csrr	a5,sie
    800046b8:	2227e793          	ori	a5,a5,546
    800046bc:	10479073          	csrw	sie,a5
    800046c0:	fff00793          	li	a5,-1
    800046c4:	00a7d793          	srli	a5,a5,0xa
    800046c8:	3b079073          	csrw	pmpaddr0,a5
    800046cc:	00f00793          	li	a5,15
    800046d0:	3a079073          	csrw	pmpcfg0,a5
    800046d4:	f14027f3          	csrr	a5,mhartid
    800046d8:	0200c737          	lui	a4,0x200c
    800046dc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800046e0:	0007869b          	sext.w	a3,a5
    800046e4:	00269713          	slli	a4,a3,0x2
    800046e8:	000f4637          	lui	a2,0xf4
    800046ec:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800046f0:	00d70733          	add	a4,a4,a3
    800046f4:	0037979b          	slliw	a5,a5,0x3
    800046f8:	020046b7          	lui	a3,0x2004
    800046fc:	00d787b3          	add	a5,a5,a3
    80004700:	00c585b3          	add	a1,a1,a2
    80004704:	00371693          	slli	a3,a4,0x3
    80004708:	00004717          	auipc	a4,0x4
    8000470c:	bf870713          	addi	a4,a4,-1032 # 80008300 <timer_scratch>
    80004710:	00b7b023          	sd	a1,0(a5)
    80004714:	00d70733          	add	a4,a4,a3
    80004718:	00f73c23          	sd	a5,24(a4)
    8000471c:	02c73023          	sd	a2,32(a4)
    80004720:	34071073          	csrw	mscratch,a4
    80004724:	00000797          	auipc	a5,0x0
    80004728:	6ec78793          	addi	a5,a5,1772 # 80004e10 <timervec>
    8000472c:	30579073          	csrw	mtvec,a5
    80004730:	300027f3          	csrr	a5,mstatus
    80004734:	0087e793          	ori	a5,a5,8
    80004738:	30079073          	csrw	mstatus,a5
    8000473c:	304027f3          	csrr	a5,mie
    80004740:	0807e793          	ori	a5,a5,128
    80004744:	30479073          	csrw	mie,a5
    80004748:	f14027f3          	csrr	a5,mhartid
    8000474c:	0007879b          	sext.w	a5,a5
    80004750:	00078213          	mv	tp,a5
    80004754:	30200073          	mret
    80004758:	00813403          	ld	s0,8(sp)
    8000475c:	01010113          	addi	sp,sp,16
    80004760:	00008067          	ret

0000000080004764 <timerinit>:
    80004764:	ff010113          	addi	sp,sp,-16
    80004768:	00813423          	sd	s0,8(sp)
    8000476c:	01010413          	addi	s0,sp,16
    80004770:	f14027f3          	csrr	a5,mhartid
    80004774:	0200c737          	lui	a4,0x200c
    80004778:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000477c:	0007869b          	sext.w	a3,a5
    80004780:	00269713          	slli	a4,a3,0x2
    80004784:	000f4637          	lui	a2,0xf4
    80004788:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000478c:	00d70733          	add	a4,a4,a3
    80004790:	0037979b          	slliw	a5,a5,0x3
    80004794:	020046b7          	lui	a3,0x2004
    80004798:	00d787b3          	add	a5,a5,a3
    8000479c:	00c585b3          	add	a1,a1,a2
    800047a0:	00371693          	slli	a3,a4,0x3
    800047a4:	00004717          	auipc	a4,0x4
    800047a8:	b5c70713          	addi	a4,a4,-1188 # 80008300 <timer_scratch>
    800047ac:	00b7b023          	sd	a1,0(a5)
    800047b0:	00d70733          	add	a4,a4,a3
    800047b4:	00f73c23          	sd	a5,24(a4)
    800047b8:	02c73023          	sd	a2,32(a4)
    800047bc:	34071073          	csrw	mscratch,a4
    800047c0:	00000797          	auipc	a5,0x0
    800047c4:	65078793          	addi	a5,a5,1616 # 80004e10 <timervec>
    800047c8:	30579073          	csrw	mtvec,a5
    800047cc:	300027f3          	csrr	a5,mstatus
    800047d0:	0087e793          	ori	a5,a5,8
    800047d4:	30079073          	csrw	mstatus,a5
    800047d8:	304027f3          	csrr	a5,mie
    800047dc:	0807e793          	ori	a5,a5,128
    800047e0:	30479073          	csrw	mie,a5
    800047e4:	00813403          	ld	s0,8(sp)
    800047e8:	01010113          	addi	sp,sp,16
    800047ec:	00008067          	ret

00000000800047f0 <system_main>:
    800047f0:	fe010113          	addi	sp,sp,-32
    800047f4:	00813823          	sd	s0,16(sp)
    800047f8:	00913423          	sd	s1,8(sp)
    800047fc:	00113c23          	sd	ra,24(sp)
    80004800:	02010413          	addi	s0,sp,32
    80004804:	00000097          	auipc	ra,0x0
    80004808:	0c4080e7          	jalr	196(ra) # 800048c8 <cpuid>
    8000480c:	00004497          	auipc	s1,0x4
    80004810:	a8448493          	addi	s1,s1,-1404 # 80008290 <started>
    80004814:	02050263          	beqz	a0,80004838 <system_main+0x48>
    80004818:	0004a783          	lw	a5,0(s1)
    8000481c:	0007879b          	sext.w	a5,a5
    80004820:	fe078ce3          	beqz	a5,80004818 <system_main+0x28>
    80004824:	0ff0000f          	fence
    80004828:	00003517          	auipc	a0,0x3
    8000482c:	c3050513          	addi	a0,a0,-976 # 80007458 <CONSOLE_STATUS+0x448>
    80004830:	00001097          	auipc	ra,0x1
    80004834:	a7c080e7          	jalr	-1412(ra) # 800052ac <panic>
    80004838:	00001097          	auipc	ra,0x1
    8000483c:	9d0080e7          	jalr	-1584(ra) # 80005208 <consoleinit>
    80004840:	00001097          	auipc	ra,0x1
    80004844:	15c080e7          	jalr	348(ra) # 8000599c <printfinit>
    80004848:	00003517          	auipc	a0,0x3
    8000484c:	cf050513          	addi	a0,a0,-784 # 80007538 <CONSOLE_STATUS+0x528>
    80004850:	00001097          	auipc	ra,0x1
    80004854:	ab8080e7          	jalr	-1352(ra) # 80005308 <__printf>
    80004858:	00003517          	auipc	a0,0x3
    8000485c:	bd050513          	addi	a0,a0,-1072 # 80007428 <CONSOLE_STATUS+0x418>
    80004860:	00001097          	auipc	ra,0x1
    80004864:	aa8080e7          	jalr	-1368(ra) # 80005308 <__printf>
    80004868:	00003517          	auipc	a0,0x3
    8000486c:	cd050513          	addi	a0,a0,-816 # 80007538 <CONSOLE_STATUS+0x528>
    80004870:	00001097          	auipc	ra,0x1
    80004874:	a98080e7          	jalr	-1384(ra) # 80005308 <__printf>
    80004878:	00001097          	auipc	ra,0x1
    8000487c:	4b0080e7          	jalr	1200(ra) # 80005d28 <kinit>
    80004880:	00000097          	auipc	ra,0x0
    80004884:	148080e7          	jalr	328(ra) # 800049c8 <trapinit>
    80004888:	00000097          	auipc	ra,0x0
    8000488c:	16c080e7          	jalr	364(ra) # 800049f4 <trapinithart>
    80004890:	00000097          	auipc	ra,0x0
    80004894:	5c0080e7          	jalr	1472(ra) # 80004e50 <plicinit>
    80004898:	00000097          	auipc	ra,0x0
    8000489c:	5e0080e7          	jalr	1504(ra) # 80004e78 <plicinithart>
    800048a0:	00000097          	auipc	ra,0x0
    800048a4:	078080e7          	jalr	120(ra) # 80004918 <userinit>
    800048a8:	0ff0000f          	fence
    800048ac:	00100793          	li	a5,1
    800048b0:	00003517          	auipc	a0,0x3
    800048b4:	b9050513          	addi	a0,a0,-1136 # 80007440 <CONSOLE_STATUS+0x430>
    800048b8:	00f4a023          	sw	a5,0(s1)
    800048bc:	00001097          	auipc	ra,0x1
    800048c0:	a4c080e7          	jalr	-1460(ra) # 80005308 <__printf>
    800048c4:	0000006f          	j	800048c4 <system_main+0xd4>

00000000800048c8 <cpuid>:
    800048c8:	ff010113          	addi	sp,sp,-16
    800048cc:	00813423          	sd	s0,8(sp)
    800048d0:	01010413          	addi	s0,sp,16
    800048d4:	00020513          	mv	a0,tp
    800048d8:	00813403          	ld	s0,8(sp)
    800048dc:	0005051b          	sext.w	a0,a0
    800048e0:	01010113          	addi	sp,sp,16
    800048e4:	00008067          	ret

00000000800048e8 <mycpu>:
    800048e8:	ff010113          	addi	sp,sp,-16
    800048ec:	00813423          	sd	s0,8(sp)
    800048f0:	01010413          	addi	s0,sp,16
    800048f4:	00020793          	mv	a5,tp
    800048f8:	00813403          	ld	s0,8(sp)
    800048fc:	0007879b          	sext.w	a5,a5
    80004900:	00779793          	slli	a5,a5,0x7
    80004904:	00005517          	auipc	a0,0x5
    80004908:	a2c50513          	addi	a0,a0,-1492 # 80009330 <cpus>
    8000490c:	00f50533          	add	a0,a0,a5
    80004910:	01010113          	addi	sp,sp,16
    80004914:	00008067          	ret

0000000080004918 <userinit>:
    80004918:	ff010113          	addi	sp,sp,-16
    8000491c:	00813423          	sd	s0,8(sp)
    80004920:	01010413          	addi	s0,sp,16
    80004924:	00813403          	ld	s0,8(sp)
    80004928:	01010113          	addi	sp,sp,16
    8000492c:	ffffd317          	auipc	t1,0xffffd
    80004930:	eb430067          	jr	-332(t1) # 800017e0 <main>

0000000080004934 <either_copyout>:
    80004934:	ff010113          	addi	sp,sp,-16
    80004938:	00813023          	sd	s0,0(sp)
    8000493c:	00113423          	sd	ra,8(sp)
    80004940:	01010413          	addi	s0,sp,16
    80004944:	02051663          	bnez	a0,80004970 <either_copyout+0x3c>
    80004948:	00058513          	mv	a0,a1
    8000494c:	00060593          	mv	a1,a2
    80004950:	0006861b          	sext.w	a2,a3
    80004954:	00002097          	auipc	ra,0x2
    80004958:	c60080e7          	jalr	-928(ra) # 800065b4 <__memmove>
    8000495c:	00813083          	ld	ra,8(sp)
    80004960:	00013403          	ld	s0,0(sp)
    80004964:	00000513          	li	a0,0
    80004968:	01010113          	addi	sp,sp,16
    8000496c:	00008067          	ret
    80004970:	00003517          	auipc	a0,0x3
    80004974:	b1050513          	addi	a0,a0,-1264 # 80007480 <CONSOLE_STATUS+0x470>
    80004978:	00001097          	auipc	ra,0x1
    8000497c:	934080e7          	jalr	-1740(ra) # 800052ac <panic>

0000000080004980 <either_copyin>:
    80004980:	ff010113          	addi	sp,sp,-16
    80004984:	00813023          	sd	s0,0(sp)
    80004988:	00113423          	sd	ra,8(sp)
    8000498c:	01010413          	addi	s0,sp,16
    80004990:	02059463          	bnez	a1,800049b8 <either_copyin+0x38>
    80004994:	00060593          	mv	a1,a2
    80004998:	0006861b          	sext.w	a2,a3
    8000499c:	00002097          	auipc	ra,0x2
    800049a0:	c18080e7          	jalr	-1000(ra) # 800065b4 <__memmove>
    800049a4:	00813083          	ld	ra,8(sp)
    800049a8:	00013403          	ld	s0,0(sp)
    800049ac:	00000513          	li	a0,0
    800049b0:	01010113          	addi	sp,sp,16
    800049b4:	00008067          	ret
    800049b8:	00003517          	auipc	a0,0x3
    800049bc:	af050513          	addi	a0,a0,-1296 # 800074a8 <CONSOLE_STATUS+0x498>
    800049c0:	00001097          	auipc	ra,0x1
    800049c4:	8ec080e7          	jalr	-1812(ra) # 800052ac <panic>

00000000800049c8 <trapinit>:
    800049c8:	ff010113          	addi	sp,sp,-16
    800049cc:	00813423          	sd	s0,8(sp)
    800049d0:	01010413          	addi	s0,sp,16
    800049d4:	00813403          	ld	s0,8(sp)
    800049d8:	00003597          	auipc	a1,0x3
    800049dc:	af858593          	addi	a1,a1,-1288 # 800074d0 <CONSOLE_STATUS+0x4c0>
    800049e0:	00005517          	auipc	a0,0x5
    800049e4:	9d050513          	addi	a0,a0,-1584 # 800093b0 <tickslock>
    800049e8:	01010113          	addi	sp,sp,16
    800049ec:	00001317          	auipc	t1,0x1
    800049f0:	5cc30067          	jr	1484(t1) # 80005fb8 <initlock>

00000000800049f4 <trapinithart>:
    800049f4:	ff010113          	addi	sp,sp,-16
    800049f8:	00813423          	sd	s0,8(sp)
    800049fc:	01010413          	addi	s0,sp,16
    80004a00:	00000797          	auipc	a5,0x0
    80004a04:	30078793          	addi	a5,a5,768 # 80004d00 <kernelvec>
    80004a08:	10579073          	csrw	stvec,a5
    80004a0c:	00813403          	ld	s0,8(sp)
    80004a10:	01010113          	addi	sp,sp,16
    80004a14:	00008067          	ret

0000000080004a18 <usertrap>:
    80004a18:	ff010113          	addi	sp,sp,-16
    80004a1c:	00813423          	sd	s0,8(sp)
    80004a20:	01010413          	addi	s0,sp,16
    80004a24:	00813403          	ld	s0,8(sp)
    80004a28:	01010113          	addi	sp,sp,16
    80004a2c:	00008067          	ret

0000000080004a30 <usertrapret>:
    80004a30:	ff010113          	addi	sp,sp,-16
    80004a34:	00813423          	sd	s0,8(sp)
    80004a38:	01010413          	addi	s0,sp,16
    80004a3c:	00813403          	ld	s0,8(sp)
    80004a40:	01010113          	addi	sp,sp,16
    80004a44:	00008067          	ret

0000000080004a48 <kerneltrap>:
    80004a48:	fe010113          	addi	sp,sp,-32
    80004a4c:	00813823          	sd	s0,16(sp)
    80004a50:	00113c23          	sd	ra,24(sp)
    80004a54:	00913423          	sd	s1,8(sp)
    80004a58:	02010413          	addi	s0,sp,32
    80004a5c:	142025f3          	csrr	a1,scause
    80004a60:	100027f3          	csrr	a5,sstatus
    80004a64:	0027f793          	andi	a5,a5,2
    80004a68:	10079c63          	bnez	a5,80004b80 <kerneltrap+0x138>
    80004a6c:	142027f3          	csrr	a5,scause
    80004a70:	0207ce63          	bltz	a5,80004aac <kerneltrap+0x64>
    80004a74:	00003517          	auipc	a0,0x3
    80004a78:	aa450513          	addi	a0,a0,-1372 # 80007518 <CONSOLE_STATUS+0x508>
    80004a7c:	00001097          	auipc	ra,0x1
    80004a80:	88c080e7          	jalr	-1908(ra) # 80005308 <__printf>
    80004a84:	141025f3          	csrr	a1,sepc
    80004a88:	14302673          	csrr	a2,stval
    80004a8c:	00003517          	auipc	a0,0x3
    80004a90:	a9c50513          	addi	a0,a0,-1380 # 80007528 <CONSOLE_STATUS+0x518>
    80004a94:	00001097          	auipc	ra,0x1
    80004a98:	874080e7          	jalr	-1932(ra) # 80005308 <__printf>
    80004a9c:	00003517          	auipc	a0,0x3
    80004aa0:	aa450513          	addi	a0,a0,-1372 # 80007540 <CONSOLE_STATUS+0x530>
    80004aa4:	00001097          	auipc	ra,0x1
    80004aa8:	808080e7          	jalr	-2040(ra) # 800052ac <panic>
    80004aac:	0ff7f713          	andi	a4,a5,255
    80004ab0:	00900693          	li	a3,9
    80004ab4:	04d70063          	beq	a4,a3,80004af4 <kerneltrap+0xac>
    80004ab8:	fff00713          	li	a4,-1
    80004abc:	03f71713          	slli	a4,a4,0x3f
    80004ac0:	00170713          	addi	a4,a4,1
    80004ac4:	fae798e3          	bne	a5,a4,80004a74 <kerneltrap+0x2c>
    80004ac8:	00000097          	auipc	ra,0x0
    80004acc:	e00080e7          	jalr	-512(ra) # 800048c8 <cpuid>
    80004ad0:	06050663          	beqz	a0,80004b3c <kerneltrap+0xf4>
    80004ad4:	144027f3          	csrr	a5,sip
    80004ad8:	ffd7f793          	andi	a5,a5,-3
    80004adc:	14479073          	csrw	sip,a5
    80004ae0:	01813083          	ld	ra,24(sp)
    80004ae4:	01013403          	ld	s0,16(sp)
    80004ae8:	00813483          	ld	s1,8(sp)
    80004aec:	02010113          	addi	sp,sp,32
    80004af0:	00008067          	ret
    80004af4:	00000097          	auipc	ra,0x0
    80004af8:	3d0080e7          	jalr	976(ra) # 80004ec4 <plic_claim>
    80004afc:	00a00793          	li	a5,10
    80004b00:	00050493          	mv	s1,a0
    80004b04:	06f50863          	beq	a0,a5,80004b74 <kerneltrap+0x12c>
    80004b08:	fc050ce3          	beqz	a0,80004ae0 <kerneltrap+0x98>
    80004b0c:	00050593          	mv	a1,a0
    80004b10:	00003517          	auipc	a0,0x3
    80004b14:	9e850513          	addi	a0,a0,-1560 # 800074f8 <CONSOLE_STATUS+0x4e8>
    80004b18:	00000097          	auipc	ra,0x0
    80004b1c:	7f0080e7          	jalr	2032(ra) # 80005308 <__printf>
    80004b20:	01013403          	ld	s0,16(sp)
    80004b24:	01813083          	ld	ra,24(sp)
    80004b28:	00048513          	mv	a0,s1
    80004b2c:	00813483          	ld	s1,8(sp)
    80004b30:	02010113          	addi	sp,sp,32
    80004b34:	00000317          	auipc	t1,0x0
    80004b38:	3c830067          	jr	968(t1) # 80004efc <plic_complete>
    80004b3c:	00005517          	auipc	a0,0x5
    80004b40:	87450513          	addi	a0,a0,-1932 # 800093b0 <tickslock>
    80004b44:	00001097          	auipc	ra,0x1
    80004b48:	498080e7          	jalr	1176(ra) # 80005fdc <acquire>
    80004b4c:	00003717          	auipc	a4,0x3
    80004b50:	74870713          	addi	a4,a4,1864 # 80008294 <ticks>
    80004b54:	00072783          	lw	a5,0(a4)
    80004b58:	00005517          	auipc	a0,0x5
    80004b5c:	85850513          	addi	a0,a0,-1960 # 800093b0 <tickslock>
    80004b60:	0017879b          	addiw	a5,a5,1
    80004b64:	00f72023          	sw	a5,0(a4)
    80004b68:	00001097          	auipc	ra,0x1
    80004b6c:	540080e7          	jalr	1344(ra) # 800060a8 <release>
    80004b70:	f65ff06f          	j	80004ad4 <kerneltrap+0x8c>
    80004b74:	00001097          	auipc	ra,0x1
    80004b78:	09c080e7          	jalr	156(ra) # 80005c10 <uartintr>
    80004b7c:	fa5ff06f          	j	80004b20 <kerneltrap+0xd8>
    80004b80:	00003517          	auipc	a0,0x3
    80004b84:	95850513          	addi	a0,a0,-1704 # 800074d8 <CONSOLE_STATUS+0x4c8>
    80004b88:	00000097          	auipc	ra,0x0
    80004b8c:	724080e7          	jalr	1828(ra) # 800052ac <panic>

0000000080004b90 <clockintr>:
    80004b90:	fe010113          	addi	sp,sp,-32
    80004b94:	00813823          	sd	s0,16(sp)
    80004b98:	00913423          	sd	s1,8(sp)
    80004b9c:	00113c23          	sd	ra,24(sp)
    80004ba0:	02010413          	addi	s0,sp,32
    80004ba4:	00005497          	auipc	s1,0x5
    80004ba8:	80c48493          	addi	s1,s1,-2036 # 800093b0 <tickslock>
    80004bac:	00048513          	mv	a0,s1
    80004bb0:	00001097          	auipc	ra,0x1
    80004bb4:	42c080e7          	jalr	1068(ra) # 80005fdc <acquire>
    80004bb8:	00003717          	auipc	a4,0x3
    80004bbc:	6dc70713          	addi	a4,a4,1756 # 80008294 <ticks>
    80004bc0:	00072783          	lw	a5,0(a4)
    80004bc4:	01013403          	ld	s0,16(sp)
    80004bc8:	01813083          	ld	ra,24(sp)
    80004bcc:	00048513          	mv	a0,s1
    80004bd0:	0017879b          	addiw	a5,a5,1
    80004bd4:	00813483          	ld	s1,8(sp)
    80004bd8:	00f72023          	sw	a5,0(a4)
    80004bdc:	02010113          	addi	sp,sp,32
    80004be0:	00001317          	auipc	t1,0x1
    80004be4:	4c830067          	jr	1224(t1) # 800060a8 <release>

0000000080004be8 <devintr>:
    80004be8:	142027f3          	csrr	a5,scause
    80004bec:	00000513          	li	a0,0
    80004bf0:	0007c463          	bltz	a5,80004bf8 <devintr+0x10>
    80004bf4:	00008067          	ret
    80004bf8:	fe010113          	addi	sp,sp,-32
    80004bfc:	00813823          	sd	s0,16(sp)
    80004c00:	00113c23          	sd	ra,24(sp)
    80004c04:	00913423          	sd	s1,8(sp)
    80004c08:	02010413          	addi	s0,sp,32
    80004c0c:	0ff7f713          	andi	a4,a5,255
    80004c10:	00900693          	li	a3,9
    80004c14:	04d70c63          	beq	a4,a3,80004c6c <devintr+0x84>
    80004c18:	fff00713          	li	a4,-1
    80004c1c:	03f71713          	slli	a4,a4,0x3f
    80004c20:	00170713          	addi	a4,a4,1
    80004c24:	00e78c63          	beq	a5,a4,80004c3c <devintr+0x54>
    80004c28:	01813083          	ld	ra,24(sp)
    80004c2c:	01013403          	ld	s0,16(sp)
    80004c30:	00813483          	ld	s1,8(sp)
    80004c34:	02010113          	addi	sp,sp,32
    80004c38:	00008067          	ret
    80004c3c:	00000097          	auipc	ra,0x0
    80004c40:	c8c080e7          	jalr	-884(ra) # 800048c8 <cpuid>
    80004c44:	06050663          	beqz	a0,80004cb0 <devintr+0xc8>
    80004c48:	144027f3          	csrr	a5,sip
    80004c4c:	ffd7f793          	andi	a5,a5,-3
    80004c50:	14479073          	csrw	sip,a5
    80004c54:	01813083          	ld	ra,24(sp)
    80004c58:	01013403          	ld	s0,16(sp)
    80004c5c:	00813483          	ld	s1,8(sp)
    80004c60:	00200513          	li	a0,2
    80004c64:	02010113          	addi	sp,sp,32
    80004c68:	00008067          	ret
    80004c6c:	00000097          	auipc	ra,0x0
    80004c70:	258080e7          	jalr	600(ra) # 80004ec4 <plic_claim>
    80004c74:	00a00793          	li	a5,10
    80004c78:	00050493          	mv	s1,a0
    80004c7c:	06f50663          	beq	a0,a5,80004ce8 <devintr+0x100>
    80004c80:	00100513          	li	a0,1
    80004c84:	fa0482e3          	beqz	s1,80004c28 <devintr+0x40>
    80004c88:	00048593          	mv	a1,s1
    80004c8c:	00003517          	auipc	a0,0x3
    80004c90:	86c50513          	addi	a0,a0,-1940 # 800074f8 <CONSOLE_STATUS+0x4e8>
    80004c94:	00000097          	auipc	ra,0x0
    80004c98:	674080e7          	jalr	1652(ra) # 80005308 <__printf>
    80004c9c:	00048513          	mv	a0,s1
    80004ca0:	00000097          	auipc	ra,0x0
    80004ca4:	25c080e7          	jalr	604(ra) # 80004efc <plic_complete>
    80004ca8:	00100513          	li	a0,1
    80004cac:	f7dff06f          	j	80004c28 <devintr+0x40>
    80004cb0:	00004517          	auipc	a0,0x4
    80004cb4:	70050513          	addi	a0,a0,1792 # 800093b0 <tickslock>
    80004cb8:	00001097          	auipc	ra,0x1
    80004cbc:	324080e7          	jalr	804(ra) # 80005fdc <acquire>
    80004cc0:	00003717          	auipc	a4,0x3
    80004cc4:	5d470713          	addi	a4,a4,1492 # 80008294 <ticks>
    80004cc8:	00072783          	lw	a5,0(a4)
    80004ccc:	00004517          	auipc	a0,0x4
    80004cd0:	6e450513          	addi	a0,a0,1764 # 800093b0 <tickslock>
    80004cd4:	0017879b          	addiw	a5,a5,1
    80004cd8:	00f72023          	sw	a5,0(a4)
    80004cdc:	00001097          	auipc	ra,0x1
    80004ce0:	3cc080e7          	jalr	972(ra) # 800060a8 <release>
    80004ce4:	f65ff06f          	j	80004c48 <devintr+0x60>
    80004ce8:	00001097          	auipc	ra,0x1
    80004cec:	f28080e7          	jalr	-216(ra) # 80005c10 <uartintr>
    80004cf0:	fadff06f          	j	80004c9c <devintr+0xb4>
	...

0000000080004d00 <kernelvec>:
    80004d00:	f0010113          	addi	sp,sp,-256
    80004d04:	00113023          	sd	ra,0(sp)
    80004d08:	00213423          	sd	sp,8(sp)
    80004d0c:	00313823          	sd	gp,16(sp)
    80004d10:	00413c23          	sd	tp,24(sp)
    80004d14:	02513023          	sd	t0,32(sp)
    80004d18:	02613423          	sd	t1,40(sp)
    80004d1c:	02713823          	sd	t2,48(sp)
    80004d20:	02813c23          	sd	s0,56(sp)
    80004d24:	04913023          	sd	s1,64(sp)
    80004d28:	04a13423          	sd	a0,72(sp)
    80004d2c:	04b13823          	sd	a1,80(sp)
    80004d30:	04c13c23          	sd	a2,88(sp)
    80004d34:	06d13023          	sd	a3,96(sp)
    80004d38:	06e13423          	sd	a4,104(sp)
    80004d3c:	06f13823          	sd	a5,112(sp)
    80004d40:	07013c23          	sd	a6,120(sp)
    80004d44:	09113023          	sd	a7,128(sp)
    80004d48:	09213423          	sd	s2,136(sp)
    80004d4c:	09313823          	sd	s3,144(sp)
    80004d50:	09413c23          	sd	s4,152(sp)
    80004d54:	0b513023          	sd	s5,160(sp)
    80004d58:	0b613423          	sd	s6,168(sp)
    80004d5c:	0b713823          	sd	s7,176(sp)
    80004d60:	0b813c23          	sd	s8,184(sp)
    80004d64:	0d913023          	sd	s9,192(sp)
    80004d68:	0da13423          	sd	s10,200(sp)
    80004d6c:	0db13823          	sd	s11,208(sp)
    80004d70:	0dc13c23          	sd	t3,216(sp)
    80004d74:	0fd13023          	sd	t4,224(sp)
    80004d78:	0fe13423          	sd	t5,232(sp)
    80004d7c:	0ff13823          	sd	t6,240(sp)
    80004d80:	cc9ff0ef          	jal	ra,80004a48 <kerneltrap>
    80004d84:	00013083          	ld	ra,0(sp)
    80004d88:	00813103          	ld	sp,8(sp)
    80004d8c:	01013183          	ld	gp,16(sp)
    80004d90:	02013283          	ld	t0,32(sp)
    80004d94:	02813303          	ld	t1,40(sp)
    80004d98:	03013383          	ld	t2,48(sp)
    80004d9c:	03813403          	ld	s0,56(sp)
    80004da0:	04013483          	ld	s1,64(sp)
    80004da4:	04813503          	ld	a0,72(sp)
    80004da8:	05013583          	ld	a1,80(sp)
    80004dac:	05813603          	ld	a2,88(sp)
    80004db0:	06013683          	ld	a3,96(sp)
    80004db4:	06813703          	ld	a4,104(sp)
    80004db8:	07013783          	ld	a5,112(sp)
    80004dbc:	07813803          	ld	a6,120(sp)
    80004dc0:	08013883          	ld	a7,128(sp)
    80004dc4:	08813903          	ld	s2,136(sp)
    80004dc8:	09013983          	ld	s3,144(sp)
    80004dcc:	09813a03          	ld	s4,152(sp)
    80004dd0:	0a013a83          	ld	s5,160(sp)
    80004dd4:	0a813b03          	ld	s6,168(sp)
    80004dd8:	0b013b83          	ld	s7,176(sp)
    80004ddc:	0b813c03          	ld	s8,184(sp)
    80004de0:	0c013c83          	ld	s9,192(sp)
    80004de4:	0c813d03          	ld	s10,200(sp)
    80004de8:	0d013d83          	ld	s11,208(sp)
    80004dec:	0d813e03          	ld	t3,216(sp)
    80004df0:	0e013e83          	ld	t4,224(sp)
    80004df4:	0e813f03          	ld	t5,232(sp)
    80004df8:	0f013f83          	ld	t6,240(sp)
    80004dfc:	10010113          	addi	sp,sp,256
    80004e00:	10200073          	sret
    80004e04:	00000013          	nop
    80004e08:	00000013          	nop
    80004e0c:	00000013          	nop

0000000080004e10 <timervec>:
    80004e10:	34051573          	csrrw	a0,mscratch,a0
    80004e14:	00b53023          	sd	a1,0(a0)
    80004e18:	00c53423          	sd	a2,8(a0)
    80004e1c:	00d53823          	sd	a3,16(a0)
    80004e20:	01853583          	ld	a1,24(a0)
    80004e24:	02053603          	ld	a2,32(a0)
    80004e28:	0005b683          	ld	a3,0(a1)
    80004e2c:	00c686b3          	add	a3,a3,a2
    80004e30:	00d5b023          	sd	a3,0(a1)
    80004e34:	00200593          	li	a1,2
    80004e38:	14459073          	csrw	sip,a1
    80004e3c:	01053683          	ld	a3,16(a0)
    80004e40:	00853603          	ld	a2,8(a0)
    80004e44:	00053583          	ld	a1,0(a0)
    80004e48:	34051573          	csrrw	a0,mscratch,a0
    80004e4c:	30200073          	mret

0000000080004e50 <plicinit>:
    80004e50:	ff010113          	addi	sp,sp,-16
    80004e54:	00813423          	sd	s0,8(sp)
    80004e58:	01010413          	addi	s0,sp,16
    80004e5c:	00813403          	ld	s0,8(sp)
    80004e60:	0c0007b7          	lui	a5,0xc000
    80004e64:	00100713          	li	a4,1
    80004e68:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80004e6c:	00e7a223          	sw	a4,4(a5)
    80004e70:	01010113          	addi	sp,sp,16
    80004e74:	00008067          	ret

0000000080004e78 <plicinithart>:
    80004e78:	ff010113          	addi	sp,sp,-16
    80004e7c:	00813023          	sd	s0,0(sp)
    80004e80:	00113423          	sd	ra,8(sp)
    80004e84:	01010413          	addi	s0,sp,16
    80004e88:	00000097          	auipc	ra,0x0
    80004e8c:	a40080e7          	jalr	-1472(ra) # 800048c8 <cpuid>
    80004e90:	0085171b          	slliw	a4,a0,0x8
    80004e94:	0c0027b7          	lui	a5,0xc002
    80004e98:	00e787b3          	add	a5,a5,a4
    80004e9c:	40200713          	li	a4,1026
    80004ea0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80004ea4:	00813083          	ld	ra,8(sp)
    80004ea8:	00013403          	ld	s0,0(sp)
    80004eac:	00d5151b          	slliw	a0,a0,0xd
    80004eb0:	0c2017b7          	lui	a5,0xc201
    80004eb4:	00a78533          	add	a0,a5,a0
    80004eb8:	00052023          	sw	zero,0(a0)
    80004ebc:	01010113          	addi	sp,sp,16
    80004ec0:	00008067          	ret

0000000080004ec4 <plic_claim>:
    80004ec4:	ff010113          	addi	sp,sp,-16
    80004ec8:	00813023          	sd	s0,0(sp)
    80004ecc:	00113423          	sd	ra,8(sp)
    80004ed0:	01010413          	addi	s0,sp,16
    80004ed4:	00000097          	auipc	ra,0x0
    80004ed8:	9f4080e7          	jalr	-1548(ra) # 800048c8 <cpuid>
    80004edc:	00813083          	ld	ra,8(sp)
    80004ee0:	00013403          	ld	s0,0(sp)
    80004ee4:	00d5151b          	slliw	a0,a0,0xd
    80004ee8:	0c2017b7          	lui	a5,0xc201
    80004eec:	00a78533          	add	a0,a5,a0
    80004ef0:	00452503          	lw	a0,4(a0)
    80004ef4:	01010113          	addi	sp,sp,16
    80004ef8:	00008067          	ret

0000000080004efc <plic_complete>:
    80004efc:	fe010113          	addi	sp,sp,-32
    80004f00:	00813823          	sd	s0,16(sp)
    80004f04:	00913423          	sd	s1,8(sp)
    80004f08:	00113c23          	sd	ra,24(sp)
    80004f0c:	02010413          	addi	s0,sp,32
    80004f10:	00050493          	mv	s1,a0
    80004f14:	00000097          	auipc	ra,0x0
    80004f18:	9b4080e7          	jalr	-1612(ra) # 800048c8 <cpuid>
    80004f1c:	01813083          	ld	ra,24(sp)
    80004f20:	01013403          	ld	s0,16(sp)
    80004f24:	00d5179b          	slliw	a5,a0,0xd
    80004f28:	0c201737          	lui	a4,0xc201
    80004f2c:	00f707b3          	add	a5,a4,a5
    80004f30:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004f34:	00813483          	ld	s1,8(sp)
    80004f38:	02010113          	addi	sp,sp,32
    80004f3c:	00008067          	ret

0000000080004f40 <consolewrite>:
    80004f40:	fb010113          	addi	sp,sp,-80
    80004f44:	04813023          	sd	s0,64(sp)
    80004f48:	04113423          	sd	ra,72(sp)
    80004f4c:	02913c23          	sd	s1,56(sp)
    80004f50:	03213823          	sd	s2,48(sp)
    80004f54:	03313423          	sd	s3,40(sp)
    80004f58:	03413023          	sd	s4,32(sp)
    80004f5c:	01513c23          	sd	s5,24(sp)
    80004f60:	05010413          	addi	s0,sp,80
    80004f64:	06c05c63          	blez	a2,80004fdc <consolewrite+0x9c>
    80004f68:	00060993          	mv	s3,a2
    80004f6c:	00050a13          	mv	s4,a0
    80004f70:	00058493          	mv	s1,a1
    80004f74:	00000913          	li	s2,0
    80004f78:	fff00a93          	li	s5,-1
    80004f7c:	01c0006f          	j	80004f98 <consolewrite+0x58>
    80004f80:	fbf44503          	lbu	a0,-65(s0)
    80004f84:	0019091b          	addiw	s2,s2,1
    80004f88:	00148493          	addi	s1,s1,1
    80004f8c:	00001097          	auipc	ra,0x1
    80004f90:	a9c080e7          	jalr	-1380(ra) # 80005a28 <uartputc>
    80004f94:	03298063          	beq	s3,s2,80004fb4 <consolewrite+0x74>
    80004f98:	00048613          	mv	a2,s1
    80004f9c:	00100693          	li	a3,1
    80004fa0:	000a0593          	mv	a1,s4
    80004fa4:	fbf40513          	addi	a0,s0,-65
    80004fa8:	00000097          	auipc	ra,0x0
    80004fac:	9d8080e7          	jalr	-1576(ra) # 80004980 <either_copyin>
    80004fb0:	fd5518e3          	bne	a0,s5,80004f80 <consolewrite+0x40>
    80004fb4:	04813083          	ld	ra,72(sp)
    80004fb8:	04013403          	ld	s0,64(sp)
    80004fbc:	03813483          	ld	s1,56(sp)
    80004fc0:	02813983          	ld	s3,40(sp)
    80004fc4:	02013a03          	ld	s4,32(sp)
    80004fc8:	01813a83          	ld	s5,24(sp)
    80004fcc:	00090513          	mv	a0,s2
    80004fd0:	03013903          	ld	s2,48(sp)
    80004fd4:	05010113          	addi	sp,sp,80
    80004fd8:	00008067          	ret
    80004fdc:	00000913          	li	s2,0
    80004fe0:	fd5ff06f          	j	80004fb4 <consolewrite+0x74>

0000000080004fe4 <consoleread>:
    80004fe4:	f9010113          	addi	sp,sp,-112
    80004fe8:	06813023          	sd	s0,96(sp)
    80004fec:	04913c23          	sd	s1,88(sp)
    80004ff0:	05213823          	sd	s2,80(sp)
    80004ff4:	05313423          	sd	s3,72(sp)
    80004ff8:	05413023          	sd	s4,64(sp)
    80004ffc:	03513c23          	sd	s5,56(sp)
    80005000:	03613823          	sd	s6,48(sp)
    80005004:	03713423          	sd	s7,40(sp)
    80005008:	03813023          	sd	s8,32(sp)
    8000500c:	06113423          	sd	ra,104(sp)
    80005010:	01913c23          	sd	s9,24(sp)
    80005014:	07010413          	addi	s0,sp,112
    80005018:	00060b93          	mv	s7,a2
    8000501c:	00050913          	mv	s2,a0
    80005020:	00058c13          	mv	s8,a1
    80005024:	00060b1b          	sext.w	s6,a2
    80005028:	00004497          	auipc	s1,0x4
    8000502c:	3b048493          	addi	s1,s1,944 # 800093d8 <cons>
    80005030:	00400993          	li	s3,4
    80005034:	fff00a13          	li	s4,-1
    80005038:	00a00a93          	li	s5,10
    8000503c:	05705e63          	blez	s7,80005098 <consoleread+0xb4>
    80005040:	09c4a703          	lw	a4,156(s1)
    80005044:	0984a783          	lw	a5,152(s1)
    80005048:	0007071b          	sext.w	a4,a4
    8000504c:	08e78463          	beq	a5,a4,800050d4 <consoleread+0xf0>
    80005050:	07f7f713          	andi	a4,a5,127
    80005054:	00e48733          	add	a4,s1,a4
    80005058:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000505c:	0017869b          	addiw	a3,a5,1
    80005060:	08d4ac23          	sw	a3,152(s1)
    80005064:	00070c9b          	sext.w	s9,a4
    80005068:	0b370663          	beq	a4,s3,80005114 <consoleread+0x130>
    8000506c:	00100693          	li	a3,1
    80005070:	f9f40613          	addi	a2,s0,-97
    80005074:	000c0593          	mv	a1,s8
    80005078:	00090513          	mv	a0,s2
    8000507c:	f8e40fa3          	sb	a4,-97(s0)
    80005080:	00000097          	auipc	ra,0x0
    80005084:	8b4080e7          	jalr	-1868(ra) # 80004934 <either_copyout>
    80005088:	01450863          	beq	a0,s4,80005098 <consoleread+0xb4>
    8000508c:	001c0c13          	addi	s8,s8,1
    80005090:	fffb8b9b          	addiw	s7,s7,-1
    80005094:	fb5c94e3          	bne	s9,s5,8000503c <consoleread+0x58>
    80005098:	000b851b          	sext.w	a0,s7
    8000509c:	06813083          	ld	ra,104(sp)
    800050a0:	06013403          	ld	s0,96(sp)
    800050a4:	05813483          	ld	s1,88(sp)
    800050a8:	05013903          	ld	s2,80(sp)
    800050ac:	04813983          	ld	s3,72(sp)
    800050b0:	04013a03          	ld	s4,64(sp)
    800050b4:	03813a83          	ld	s5,56(sp)
    800050b8:	02813b83          	ld	s7,40(sp)
    800050bc:	02013c03          	ld	s8,32(sp)
    800050c0:	01813c83          	ld	s9,24(sp)
    800050c4:	40ab053b          	subw	a0,s6,a0
    800050c8:	03013b03          	ld	s6,48(sp)
    800050cc:	07010113          	addi	sp,sp,112
    800050d0:	00008067          	ret
    800050d4:	00001097          	auipc	ra,0x1
    800050d8:	1d8080e7          	jalr	472(ra) # 800062ac <push_on>
    800050dc:	0984a703          	lw	a4,152(s1)
    800050e0:	09c4a783          	lw	a5,156(s1)
    800050e4:	0007879b          	sext.w	a5,a5
    800050e8:	fef70ce3          	beq	a4,a5,800050e0 <consoleread+0xfc>
    800050ec:	00001097          	auipc	ra,0x1
    800050f0:	234080e7          	jalr	564(ra) # 80006320 <pop_on>
    800050f4:	0984a783          	lw	a5,152(s1)
    800050f8:	07f7f713          	andi	a4,a5,127
    800050fc:	00e48733          	add	a4,s1,a4
    80005100:	01874703          	lbu	a4,24(a4)
    80005104:	0017869b          	addiw	a3,a5,1
    80005108:	08d4ac23          	sw	a3,152(s1)
    8000510c:	00070c9b          	sext.w	s9,a4
    80005110:	f5371ee3          	bne	a4,s3,8000506c <consoleread+0x88>
    80005114:	000b851b          	sext.w	a0,s7
    80005118:	f96bf2e3          	bgeu	s7,s6,8000509c <consoleread+0xb8>
    8000511c:	08f4ac23          	sw	a5,152(s1)
    80005120:	f7dff06f          	j	8000509c <consoleread+0xb8>

0000000080005124 <consputc>:
    80005124:	10000793          	li	a5,256
    80005128:	00f50663          	beq	a0,a5,80005134 <consputc+0x10>
    8000512c:	00001317          	auipc	t1,0x1
    80005130:	9f430067          	jr	-1548(t1) # 80005b20 <uartputc_sync>
    80005134:	ff010113          	addi	sp,sp,-16
    80005138:	00113423          	sd	ra,8(sp)
    8000513c:	00813023          	sd	s0,0(sp)
    80005140:	01010413          	addi	s0,sp,16
    80005144:	00800513          	li	a0,8
    80005148:	00001097          	auipc	ra,0x1
    8000514c:	9d8080e7          	jalr	-1576(ra) # 80005b20 <uartputc_sync>
    80005150:	02000513          	li	a0,32
    80005154:	00001097          	auipc	ra,0x1
    80005158:	9cc080e7          	jalr	-1588(ra) # 80005b20 <uartputc_sync>
    8000515c:	00013403          	ld	s0,0(sp)
    80005160:	00813083          	ld	ra,8(sp)
    80005164:	00800513          	li	a0,8
    80005168:	01010113          	addi	sp,sp,16
    8000516c:	00001317          	auipc	t1,0x1
    80005170:	9b430067          	jr	-1612(t1) # 80005b20 <uartputc_sync>

0000000080005174 <consoleintr>:
    80005174:	fe010113          	addi	sp,sp,-32
    80005178:	00813823          	sd	s0,16(sp)
    8000517c:	00913423          	sd	s1,8(sp)
    80005180:	01213023          	sd	s2,0(sp)
    80005184:	00113c23          	sd	ra,24(sp)
    80005188:	02010413          	addi	s0,sp,32
    8000518c:	00004917          	auipc	s2,0x4
    80005190:	24c90913          	addi	s2,s2,588 # 800093d8 <cons>
    80005194:	00050493          	mv	s1,a0
    80005198:	00090513          	mv	a0,s2
    8000519c:	00001097          	auipc	ra,0x1
    800051a0:	e40080e7          	jalr	-448(ra) # 80005fdc <acquire>
    800051a4:	02048c63          	beqz	s1,800051dc <consoleintr+0x68>
    800051a8:	0a092783          	lw	a5,160(s2)
    800051ac:	09892703          	lw	a4,152(s2)
    800051b0:	07f00693          	li	a3,127
    800051b4:	40e7873b          	subw	a4,a5,a4
    800051b8:	02e6e263          	bltu	a3,a4,800051dc <consoleintr+0x68>
    800051bc:	00d00713          	li	a4,13
    800051c0:	04e48063          	beq	s1,a4,80005200 <consoleintr+0x8c>
    800051c4:	07f7f713          	andi	a4,a5,127
    800051c8:	00e90733          	add	a4,s2,a4
    800051cc:	0017879b          	addiw	a5,a5,1
    800051d0:	0af92023          	sw	a5,160(s2)
    800051d4:	00970c23          	sb	s1,24(a4)
    800051d8:	08f92e23          	sw	a5,156(s2)
    800051dc:	01013403          	ld	s0,16(sp)
    800051e0:	01813083          	ld	ra,24(sp)
    800051e4:	00813483          	ld	s1,8(sp)
    800051e8:	00013903          	ld	s2,0(sp)
    800051ec:	00004517          	auipc	a0,0x4
    800051f0:	1ec50513          	addi	a0,a0,492 # 800093d8 <cons>
    800051f4:	02010113          	addi	sp,sp,32
    800051f8:	00001317          	auipc	t1,0x1
    800051fc:	eb030067          	jr	-336(t1) # 800060a8 <release>
    80005200:	00a00493          	li	s1,10
    80005204:	fc1ff06f          	j	800051c4 <consoleintr+0x50>

0000000080005208 <consoleinit>:
    80005208:	fe010113          	addi	sp,sp,-32
    8000520c:	00113c23          	sd	ra,24(sp)
    80005210:	00813823          	sd	s0,16(sp)
    80005214:	00913423          	sd	s1,8(sp)
    80005218:	02010413          	addi	s0,sp,32
    8000521c:	00004497          	auipc	s1,0x4
    80005220:	1bc48493          	addi	s1,s1,444 # 800093d8 <cons>
    80005224:	00048513          	mv	a0,s1
    80005228:	00002597          	auipc	a1,0x2
    8000522c:	32858593          	addi	a1,a1,808 # 80007550 <CONSOLE_STATUS+0x540>
    80005230:	00001097          	auipc	ra,0x1
    80005234:	d88080e7          	jalr	-632(ra) # 80005fb8 <initlock>
    80005238:	00000097          	auipc	ra,0x0
    8000523c:	7ac080e7          	jalr	1964(ra) # 800059e4 <uartinit>
    80005240:	01813083          	ld	ra,24(sp)
    80005244:	01013403          	ld	s0,16(sp)
    80005248:	00000797          	auipc	a5,0x0
    8000524c:	d9c78793          	addi	a5,a5,-612 # 80004fe4 <consoleread>
    80005250:	0af4bc23          	sd	a5,184(s1)
    80005254:	00000797          	auipc	a5,0x0
    80005258:	cec78793          	addi	a5,a5,-788 # 80004f40 <consolewrite>
    8000525c:	0cf4b023          	sd	a5,192(s1)
    80005260:	00813483          	ld	s1,8(sp)
    80005264:	02010113          	addi	sp,sp,32
    80005268:	00008067          	ret

000000008000526c <console_read>:
    8000526c:	ff010113          	addi	sp,sp,-16
    80005270:	00813423          	sd	s0,8(sp)
    80005274:	01010413          	addi	s0,sp,16
    80005278:	00813403          	ld	s0,8(sp)
    8000527c:	00004317          	auipc	t1,0x4
    80005280:	21433303          	ld	t1,532(t1) # 80009490 <devsw+0x10>
    80005284:	01010113          	addi	sp,sp,16
    80005288:	00030067          	jr	t1

000000008000528c <console_write>:
    8000528c:	ff010113          	addi	sp,sp,-16
    80005290:	00813423          	sd	s0,8(sp)
    80005294:	01010413          	addi	s0,sp,16
    80005298:	00813403          	ld	s0,8(sp)
    8000529c:	00004317          	auipc	t1,0x4
    800052a0:	1fc33303          	ld	t1,508(t1) # 80009498 <devsw+0x18>
    800052a4:	01010113          	addi	sp,sp,16
    800052a8:	00030067          	jr	t1

00000000800052ac <panic>:
    800052ac:	fe010113          	addi	sp,sp,-32
    800052b0:	00113c23          	sd	ra,24(sp)
    800052b4:	00813823          	sd	s0,16(sp)
    800052b8:	00913423          	sd	s1,8(sp)
    800052bc:	02010413          	addi	s0,sp,32
    800052c0:	00050493          	mv	s1,a0
    800052c4:	00002517          	auipc	a0,0x2
    800052c8:	29450513          	addi	a0,a0,660 # 80007558 <CONSOLE_STATUS+0x548>
    800052cc:	00004797          	auipc	a5,0x4
    800052d0:	2607a623          	sw	zero,620(a5) # 80009538 <pr+0x18>
    800052d4:	00000097          	auipc	ra,0x0
    800052d8:	034080e7          	jalr	52(ra) # 80005308 <__printf>
    800052dc:	00048513          	mv	a0,s1
    800052e0:	00000097          	auipc	ra,0x0
    800052e4:	028080e7          	jalr	40(ra) # 80005308 <__printf>
    800052e8:	00002517          	auipc	a0,0x2
    800052ec:	25050513          	addi	a0,a0,592 # 80007538 <CONSOLE_STATUS+0x528>
    800052f0:	00000097          	auipc	ra,0x0
    800052f4:	018080e7          	jalr	24(ra) # 80005308 <__printf>
    800052f8:	00100793          	li	a5,1
    800052fc:	00003717          	auipc	a4,0x3
    80005300:	f8f72e23          	sw	a5,-100(a4) # 80008298 <panicked>
    80005304:	0000006f          	j	80005304 <panic+0x58>

0000000080005308 <__printf>:
    80005308:	f3010113          	addi	sp,sp,-208
    8000530c:	08813023          	sd	s0,128(sp)
    80005310:	07313423          	sd	s3,104(sp)
    80005314:	09010413          	addi	s0,sp,144
    80005318:	05813023          	sd	s8,64(sp)
    8000531c:	08113423          	sd	ra,136(sp)
    80005320:	06913c23          	sd	s1,120(sp)
    80005324:	07213823          	sd	s2,112(sp)
    80005328:	07413023          	sd	s4,96(sp)
    8000532c:	05513c23          	sd	s5,88(sp)
    80005330:	05613823          	sd	s6,80(sp)
    80005334:	05713423          	sd	s7,72(sp)
    80005338:	03913c23          	sd	s9,56(sp)
    8000533c:	03a13823          	sd	s10,48(sp)
    80005340:	03b13423          	sd	s11,40(sp)
    80005344:	00004317          	auipc	t1,0x4
    80005348:	1dc30313          	addi	t1,t1,476 # 80009520 <pr>
    8000534c:	01832c03          	lw	s8,24(t1)
    80005350:	00b43423          	sd	a1,8(s0)
    80005354:	00c43823          	sd	a2,16(s0)
    80005358:	00d43c23          	sd	a3,24(s0)
    8000535c:	02e43023          	sd	a4,32(s0)
    80005360:	02f43423          	sd	a5,40(s0)
    80005364:	03043823          	sd	a6,48(s0)
    80005368:	03143c23          	sd	a7,56(s0)
    8000536c:	00050993          	mv	s3,a0
    80005370:	4a0c1663          	bnez	s8,8000581c <__printf+0x514>
    80005374:	60098c63          	beqz	s3,8000598c <__printf+0x684>
    80005378:	0009c503          	lbu	a0,0(s3)
    8000537c:	00840793          	addi	a5,s0,8
    80005380:	f6f43c23          	sd	a5,-136(s0)
    80005384:	00000493          	li	s1,0
    80005388:	22050063          	beqz	a0,800055a8 <__printf+0x2a0>
    8000538c:	00002a37          	lui	s4,0x2
    80005390:	00018ab7          	lui	s5,0x18
    80005394:	000f4b37          	lui	s6,0xf4
    80005398:	00989bb7          	lui	s7,0x989
    8000539c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800053a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800053a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800053a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800053ac:	00148c9b          	addiw	s9,s1,1
    800053b0:	02500793          	li	a5,37
    800053b4:	01998933          	add	s2,s3,s9
    800053b8:	38f51263          	bne	a0,a5,8000573c <__printf+0x434>
    800053bc:	00094783          	lbu	a5,0(s2)
    800053c0:	00078c9b          	sext.w	s9,a5
    800053c4:	1e078263          	beqz	a5,800055a8 <__printf+0x2a0>
    800053c8:	0024849b          	addiw	s1,s1,2
    800053cc:	07000713          	li	a4,112
    800053d0:	00998933          	add	s2,s3,s1
    800053d4:	38e78a63          	beq	a5,a4,80005768 <__printf+0x460>
    800053d8:	20f76863          	bltu	a4,a5,800055e8 <__printf+0x2e0>
    800053dc:	42a78863          	beq	a5,a0,8000580c <__printf+0x504>
    800053e0:	06400713          	li	a4,100
    800053e4:	40e79663          	bne	a5,a4,800057f0 <__printf+0x4e8>
    800053e8:	f7843783          	ld	a5,-136(s0)
    800053ec:	0007a603          	lw	a2,0(a5)
    800053f0:	00878793          	addi	a5,a5,8
    800053f4:	f6f43c23          	sd	a5,-136(s0)
    800053f8:	42064a63          	bltz	a2,8000582c <__printf+0x524>
    800053fc:	00a00713          	li	a4,10
    80005400:	02e677bb          	remuw	a5,a2,a4
    80005404:	00002d97          	auipc	s11,0x2
    80005408:	17cd8d93          	addi	s11,s11,380 # 80007580 <digits>
    8000540c:	00900593          	li	a1,9
    80005410:	0006051b          	sext.w	a0,a2
    80005414:	00000c93          	li	s9,0
    80005418:	02079793          	slli	a5,a5,0x20
    8000541c:	0207d793          	srli	a5,a5,0x20
    80005420:	00fd87b3          	add	a5,s11,a5
    80005424:	0007c783          	lbu	a5,0(a5)
    80005428:	02e656bb          	divuw	a3,a2,a4
    8000542c:	f8f40023          	sb	a5,-128(s0)
    80005430:	14c5d863          	bge	a1,a2,80005580 <__printf+0x278>
    80005434:	06300593          	li	a1,99
    80005438:	00100c93          	li	s9,1
    8000543c:	02e6f7bb          	remuw	a5,a3,a4
    80005440:	02079793          	slli	a5,a5,0x20
    80005444:	0207d793          	srli	a5,a5,0x20
    80005448:	00fd87b3          	add	a5,s11,a5
    8000544c:	0007c783          	lbu	a5,0(a5)
    80005450:	02e6d73b          	divuw	a4,a3,a4
    80005454:	f8f400a3          	sb	a5,-127(s0)
    80005458:	12a5f463          	bgeu	a1,a0,80005580 <__printf+0x278>
    8000545c:	00a00693          	li	a3,10
    80005460:	00900593          	li	a1,9
    80005464:	02d777bb          	remuw	a5,a4,a3
    80005468:	02079793          	slli	a5,a5,0x20
    8000546c:	0207d793          	srli	a5,a5,0x20
    80005470:	00fd87b3          	add	a5,s11,a5
    80005474:	0007c503          	lbu	a0,0(a5)
    80005478:	02d757bb          	divuw	a5,a4,a3
    8000547c:	f8a40123          	sb	a0,-126(s0)
    80005480:	48e5f263          	bgeu	a1,a4,80005904 <__printf+0x5fc>
    80005484:	06300513          	li	a0,99
    80005488:	02d7f5bb          	remuw	a1,a5,a3
    8000548c:	02059593          	slli	a1,a1,0x20
    80005490:	0205d593          	srli	a1,a1,0x20
    80005494:	00bd85b3          	add	a1,s11,a1
    80005498:	0005c583          	lbu	a1,0(a1)
    8000549c:	02d7d7bb          	divuw	a5,a5,a3
    800054a0:	f8b401a3          	sb	a1,-125(s0)
    800054a4:	48e57263          	bgeu	a0,a4,80005928 <__printf+0x620>
    800054a8:	3e700513          	li	a0,999
    800054ac:	02d7f5bb          	remuw	a1,a5,a3
    800054b0:	02059593          	slli	a1,a1,0x20
    800054b4:	0205d593          	srli	a1,a1,0x20
    800054b8:	00bd85b3          	add	a1,s11,a1
    800054bc:	0005c583          	lbu	a1,0(a1)
    800054c0:	02d7d7bb          	divuw	a5,a5,a3
    800054c4:	f8b40223          	sb	a1,-124(s0)
    800054c8:	46e57663          	bgeu	a0,a4,80005934 <__printf+0x62c>
    800054cc:	02d7f5bb          	remuw	a1,a5,a3
    800054d0:	02059593          	slli	a1,a1,0x20
    800054d4:	0205d593          	srli	a1,a1,0x20
    800054d8:	00bd85b3          	add	a1,s11,a1
    800054dc:	0005c583          	lbu	a1,0(a1)
    800054e0:	02d7d7bb          	divuw	a5,a5,a3
    800054e4:	f8b402a3          	sb	a1,-123(s0)
    800054e8:	46ea7863          	bgeu	s4,a4,80005958 <__printf+0x650>
    800054ec:	02d7f5bb          	remuw	a1,a5,a3
    800054f0:	02059593          	slli	a1,a1,0x20
    800054f4:	0205d593          	srli	a1,a1,0x20
    800054f8:	00bd85b3          	add	a1,s11,a1
    800054fc:	0005c583          	lbu	a1,0(a1)
    80005500:	02d7d7bb          	divuw	a5,a5,a3
    80005504:	f8b40323          	sb	a1,-122(s0)
    80005508:	3eeaf863          	bgeu	s5,a4,800058f8 <__printf+0x5f0>
    8000550c:	02d7f5bb          	remuw	a1,a5,a3
    80005510:	02059593          	slli	a1,a1,0x20
    80005514:	0205d593          	srli	a1,a1,0x20
    80005518:	00bd85b3          	add	a1,s11,a1
    8000551c:	0005c583          	lbu	a1,0(a1)
    80005520:	02d7d7bb          	divuw	a5,a5,a3
    80005524:	f8b403a3          	sb	a1,-121(s0)
    80005528:	42eb7e63          	bgeu	s6,a4,80005964 <__printf+0x65c>
    8000552c:	02d7f5bb          	remuw	a1,a5,a3
    80005530:	02059593          	slli	a1,a1,0x20
    80005534:	0205d593          	srli	a1,a1,0x20
    80005538:	00bd85b3          	add	a1,s11,a1
    8000553c:	0005c583          	lbu	a1,0(a1)
    80005540:	02d7d7bb          	divuw	a5,a5,a3
    80005544:	f8b40423          	sb	a1,-120(s0)
    80005548:	42ebfc63          	bgeu	s7,a4,80005980 <__printf+0x678>
    8000554c:	02079793          	slli	a5,a5,0x20
    80005550:	0207d793          	srli	a5,a5,0x20
    80005554:	00fd8db3          	add	s11,s11,a5
    80005558:	000dc703          	lbu	a4,0(s11)
    8000555c:	00a00793          	li	a5,10
    80005560:	00900c93          	li	s9,9
    80005564:	f8e404a3          	sb	a4,-119(s0)
    80005568:	00065c63          	bgez	a2,80005580 <__printf+0x278>
    8000556c:	f9040713          	addi	a4,s0,-112
    80005570:	00f70733          	add	a4,a4,a5
    80005574:	02d00693          	li	a3,45
    80005578:	fed70823          	sb	a3,-16(a4)
    8000557c:	00078c93          	mv	s9,a5
    80005580:	f8040793          	addi	a5,s0,-128
    80005584:	01978cb3          	add	s9,a5,s9
    80005588:	f7f40d13          	addi	s10,s0,-129
    8000558c:	000cc503          	lbu	a0,0(s9)
    80005590:	fffc8c93          	addi	s9,s9,-1
    80005594:	00000097          	auipc	ra,0x0
    80005598:	b90080e7          	jalr	-1136(ra) # 80005124 <consputc>
    8000559c:	ffac98e3          	bne	s9,s10,8000558c <__printf+0x284>
    800055a0:	00094503          	lbu	a0,0(s2)
    800055a4:	e00514e3          	bnez	a0,800053ac <__printf+0xa4>
    800055a8:	1a0c1663          	bnez	s8,80005754 <__printf+0x44c>
    800055ac:	08813083          	ld	ra,136(sp)
    800055b0:	08013403          	ld	s0,128(sp)
    800055b4:	07813483          	ld	s1,120(sp)
    800055b8:	07013903          	ld	s2,112(sp)
    800055bc:	06813983          	ld	s3,104(sp)
    800055c0:	06013a03          	ld	s4,96(sp)
    800055c4:	05813a83          	ld	s5,88(sp)
    800055c8:	05013b03          	ld	s6,80(sp)
    800055cc:	04813b83          	ld	s7,72(sp)
    800055d0:	04013c03          	ld	s8,64(sp)
    800055d4:	03813c83          	ld	s9,56(sp)
    800055d8:	03013d03          	ld	s10,48(sp)
    800055dc:	02813d83          	ld	s11,40(sp)
    800055e0:	0d010113          	addi	sp,sp,208
    800055e4:	00008067          	ret
    800055e8:	07300713          	li	a4,115
    800055ec:	1ce78a63          	beq	a5,a4,800057c0 <__printf+0x4b8>
    800055f0:	07800713          	li	a4,120
    800055f4:	1ee79e63          	bne	a5,a4,800057f0 <__printf+0x4e8>
    800055f8:	f7843783          	ld	a5,-136(s0)
    800055fc:	0007a703          	lw	a4,0(a5)
    80005600:	00878793          	addi	a5,a5,8
    80005604:	f6f43c23          	sd	a5,-136(s0)
    80005608:	28074263          	bltz	a4,8000588c <__printf+0x584>
    8000560c:	00002d97          	auipc	s11,0x2
    80005610:	f74d8d93          	addi	s11,s11,-140 # 80007580 <digits>
    80005614:	00f77793          	andi	a5,a4,15
    80005618:	00fd87b3          	add	a5,s11,a5
    8000561c:	0007c683          	lbu	a3,0(a5)
    80005620:	00f00613          	li	a2,15
    80005624:	0007079b          	sext.w	a5,a4
    80005628:	f8d40023          	sb	a3,-128(s0)
    8000562c:	0047559b          	srliw	a1,a4,0x4
    80005630:	0047569b          	srliw	a3,a4,0x4
    80005634:	00000c93          	li	s9,0
    80005638:	0ee65063          	bge	a2,a4,80005718 <__printf+0x410>
    8000563c:	00f6f693          	andi	a3,a3,15
    80005640:	00dd86b3          	add	a3,s11,a3
    80005644:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005648:	0087d79b          	srliw	a5,a5,0x8
    8000564c:	00100c93          	li	s9,1
    80005650:	f8d400a3          	sb	a3,-127(s0)
    80005654:	0cb67263          	bgeu	a2,a1,80005718 <__printf+0x410>
    80005658:	00f7f693          	andi	a3,a5,15
    8000565c:	00dd86b3          	add	a3,s11,a3
    80005660:	0006c583          	lbu	a1,0(a3)
    80005664:	00f00613          	li	a2,15
    80005668:	0047d69b          	srliw	a3,a5,0x4
    8000566c:	f8b40123          	sb	a1,-126(s0)
    80005670:	0047d593          	srli	a1,a5,0x4
    80005674:	28f67e63          	bgeu	a2,a5,80005910 <__printf+0x608>
    80005678:	00f6f693          	andi	a3,a3,15
    8000567c:	00dd86b3          	add	a3,s11,a3
    80005680:	0006c503          	lbu	a0,0(a3)
    80005684:	0087d813          	srli	a6,a5,0x8
    80005688:	0087d69b          	srliw	a3,a5,0x8
    8000568c:	f8a401a3          	sb	a0,-125(s0)
    80005690:	28b67663          	bgeu	a2,a1,8000591c <__printf+0x614>
    80005694:	00f6f693          	andi	a3,a3,15
    80005698:	00dd86b3          	add	a3,s11,a3
    8000569c:	0006c583          	lbu	a1,0(a3)
    800056a0:	00c7d513          	srli	a0,a5,0xc
    800056a4:	00c7d69b          	srliw	a3,a5,0xc
    800056a8:	f8b40223          	sb	a1,-124(s0)
    800056ac:	29067a63          	bgeu	a2,a6,80005940 <__printf+0x638>
    800056b0:	00f6f693          	andi	a3,a3,15
    800056b4:	00dd86b3          	add	a3,s11,a3
    800056b8:	0006c583          	lbu	a1,0(a3)
    800056bc:	0107d813          	srli	a6,a5,0x10
    800056c0:	0107d69b          	srliw	a3,a5,0x10
    800056c4:	f8b402a3          	sb	a1,-123(s0)
    800056c8:	28a67263          	bgeu	a2,a0,8000594c <__printf+0x644>
    800056cc:	00f6f693          	andi	a3,a3,15
    800056d0:	00dd86b3          	add	a3,s11,a3
    800056d4:	0006c683          	lbu	a3,0(a3)
    800056d8:	0147d79b          	srliw	a5,a5,0x14
    800056dc:	f8d40323          	sb	a3,-122(s0)
    800056e0:	21067663          	bgeu	a2,a6,800058ec <__printf+0x5e4>
    800056e4:	02079793          	slli	a5,a5,0x20
    800056e8:	0207d793          	srli	a5,a5,0x20
    800056ec:	00fd8db3          	add	s11,s11,a5
    800056f0:	000dc683          	lbu	a3,0(s11)
    800056f4:	00800793          	li	a5,8
    800056f8:	00700c93          	li	s9,7
    800056fc:	f8d403a3          	sb	a3,-121(s0)
    80005700:	00075c63          	bgez	a4,80005718 <__printf+0x410>
    80005704:	f9040713          	addi	a4,s0,-112
    80005708:	00f70733          	add	a4,a4,a5
    8000570c:	02d00693          	li	a3,45
    80005710:	fed70823          	sb	a3,-16(a4)
    80005714:	00078c93          	mv	s9,a5
    80005718:	f8040793          	addi	a5,s0,-128
    8000571c:	01978cb3          	add	s9,a5,s9
    80005720:	f7f40d13          	addi	s10,s0,-129
    80005724:	000cc503          	lbu	a0,0(s9)
    80005728:	fffc8c93          	addi	s9,s9,-1
    8000572c:	00000097          	auipc	ra,0x0
    80005730:	9f8080e7          	jalr	-1544(ra) # 80005124 <consputc>
    80005734:	ff9d18e3          	bne	s10,s9,80005724 <__printf+0x41c>
    80005738:	0100006f          	j	80005748 <__printf+0x440>
    8000573c:	00000097          	auipc	ra,0x0
    80005740:	9e8080e7          	jalr	-1560(ra) # 80005124 <consputc>
    80005744:	000c8493          	mv	s1,s9
    80005748:	00094503          	lbu	a0,0(s2)
    8000574c:	c60510e3          	bnez	a0,800053ac <__printf+0xa4>
    80005750:	e40c0ee3          	beqz	s8,800055ac <__printf+0x2a4>
    80005754:	00004517          	auipc	a0,0x4
    80005758:	dcc50513          	addi	a0,a0,-564 # 80009520 <pr>
    8000575c:	00001097          	auipc	ra,0x1
    80005760:	94c080e7          	jalr	-1716(ra) # 800060a8 <release>
    80005764:	e49ff06f          	j	800055ac <__printf+0x2a4>
    80005768:	f7843783          	ld	a5,-136(s0)
    8000576c:	03000513          	li	a0,48
    80005770:	01000d13          	li	s10,16
    80005774:	00878713          	addi	a4,a5,8
    80005778:	0007bc83          	ld	s9,0(a5)
    8000577c:	f6e43c23          	sd	a4,-136(s0)
    80005780:	00000097          	auipc	ra,0x0
    80005784:	9a4080e7          	jalr	-1628(ra) # 80005124 <consputc>
    80005788:	07800513          	li	a0,120
    8000578c:	00000097          	auipc	ra,0x0
    80005790:	998080e7          	jalr	-1640(ra) # 80005124 <consputc>
    80005794:	00002d97          	auipc	s11,0x2
    80005798:	decd8d93          	addi	s11,s11,-532 # 80007580 <digits>
    8000579c:	03ccd793          	srli	a5,s9,0x3c
    800057a0:	00fd87b3          	add	a5,s11,a5
    800057a4:	0007c503          	lbu	a0,0(a5)
    800057a8:	fffd0d1b          	addiw	s10,s10,-1
    800057ac:	004c9c93          	slli	s9,s9,0x4
    800057b0:	00000097          	auipc	ra,0x0
    800057b4:	974080e7          	jalr	-1676(ra) # 80005124 <consputc>
    800057b8:	fe0d12e3          	bnez	s10,8000579c <__printf+0x494>
    800057bc:	f8dff06f          	j	80005748 <__printf+0x440>
    800057c0:	f7843783          	ld	a5,-136(s0)
    800057c4:	0007bc83          	ld	s9,0(a5)
    800057c8:	00878793          	addi	a5,a5,8
    800057cc:	f6f43c23          	sd	a5,-136(s0)
    800057d0:	000c9a63          	bnez	s9,800057e4 <__printf+0x4dc>
    800057d4:	1080006f          	j	800058dc <__printf+0x5d4>
    800057d8:	001c8c93          	addi	s9,s9,1
    800057dc:	00000097          	auipc	ra,0x0
    800057e0:	948080e7          	jalr	-1720(ra) # 80005124 <consputc>
    800057e4:	000cc503          	lbu	a0,0(s9)
    800057e8:	fe0518e3          	bnez	a0,800057d8 <__printf+0x4d0>
    800057ec:	f5dff06f          	j	80005748 <__printf+0x440>
    800057f0:	02500513          	li	a0,37
    800057f4:	00000097          	auipc	ra,0x0
    800057f8:	930080e7          	jalr	-1744(ra) # 80005124 <consputc>
    800057fc:	000c8513          	mv	a0,s9
    80005800:	00000097          	auipc	ra,0x0
    80005804:	924080e7          	jalr	-1756(ra) # 80005124 <consputc>
    80005808:	f41ff06f          	j	80005748 <__printf+0x440>
    8000580c:	02500513          	li	a0,37
    80005810:	00000097          	auipc	ra,0x0
    80005814:	914080e7          	jalr	-1772(ra) # 80005124 <consputc>
    80005818:	f31ff06f          	j	80005748 <__printf+0x440>
    8000581c:	00030513          	mv	a0,t1
    80005820:	00000097          	auipc	ra,0x0
    80005824:	7bc080e7          	jalr	1980(ra) # 80005fdc <acquire>
    80005828:	b4dff06f          	j	80005374 <__printf+0x6c>
    8000582c:	40c0053b          	negw	a0,a2
    80005830:	00a00713          	li	a4,10
    80005834:	02e576bb          	remuw	a3,a0,a4
    80005838:	00002d97          	auipc	s11,0x2
    8000583c:	d48d8d93          	addi	s11,s11,-696 # 80007580 <digits>
    80005840:	ff700593          	li	a1,-9
    80005844:	02069693          	slli	a3,a3,0x20
    80005848:	0206d693          	srli	a3,a3,0x20
    8000584c:	00dd86b3          	add	a3,s11,a3
    80005850:	0006c683          	lbu	a3,0(a3)
    80005854:	02e557bb          	divuw	a5,a0,a4
    80005858:	f8d40023          	sb	a3,-128(s0)
    8000585c:	10b65e63          	bge	a2,a1,80005978 <__printf+0x670>
    80005860:	06300593          	li	a1,99
    80005864:	02e7f6bb          	remuw	a3,a5,a4
    80005868:	02069693          	slli	a3,a3,0x20
    8000586c:	0206d693          	srli	a3,a3,0x20
    80005870:	00dd86b3          	add	a3,s11,a3
    80005874:	0006c683          	lbu	a3,0(a3)
    80005878:	02e7d73b          	divuw	a4,a5,a4
    8000587c:	00200793          	li	a5,2
    80005880:	f8d400a3          	sb	a3,-127(s0)
    80005884:	bca5ece3          	bltu	a1,a0,8000545c <__printf+0x154>
    80005888:	ce5ff06f          	j	8000556c <__printf+0x264>
    8000588c:	40e007bb          	negw	a5,a4
    80005890:	00002d97          	auipc	s11,0x2
    80005894:	cf0d8d93          	addi	s11,s11,-784 # 80007580 <digits>
    80005898:	00f7f693          	andi	a3,a5,15
    8000589c:	00dd86b3          	add	a3,s11,a3
    800058a0:	0006c583          	lbu	a1,0(a3)
    800058a4:	ff100613          	li	a2,-15
    800058a8:	0047d69b          	srliw	a3,a5,0x4
    800058ac:	f8b40023          	sb	a1,-128(s0)
    800058b0:	0047d59b          	srliw	a1,a5,0x4
    800058b4:	0ac75e63          	bge	a4,a2,80005970 <__printf+0x668>
    800058b8:	00f6f693          	andi	a3,a3,15
    800058bc:	00dd86b3          	add	a3,s11,a3
    800058c0:	0006c603          	lbu	a2,0(a3)
    800058c4:	00f00693          	li	a3,15
    800058c8:	0087d79b          	srliw	a5,a5,0x8
    800058cc:	f8c400a3          	sb	a2,-127(s0)
    800058d0:	d8b6e4e3          	bltu	a3,a1,80005658 <__printf+0x350>
    800058d4:	00200793          	li	a5,2
    800058d8:	e2dff06f          	j	80005704 <__printf+0x3fc>
    800058dc:	00002c97          	auipc	s9,0x2
    800058e0:	c84c8c93          	addi	s9,s9,-892 # 80007560 <CONSOLE_STATUS+0x550>
    800058e4:	02800513          	li	a0,40
    800058e8:	ef1ff06f          	j	800057d8 <__printf+0x4d0>
    800058ec:	00700793          	li	a5,7
    800058f0:	00600c93          	li	s9,6
    800058f4:	e0dff06f          	j	80005700 <__printf+0x3f8>
    800058f8:	00700793          	li	a5,7
    800058fc:	00600c93          	li	s9,6
    80005900:	c69ff06f          	j	80005568 <__printf+0x260>
    80005904:	00300793          	li	a5,3
    80005908:	00200c93          	li	s9,2
    8000590c:	c5dff06f          	j	80005568 <__printf+0x260>
    80005910:	00300793          	li	a5,3
    80005914:	00200c93          	li	s9,2
    80005918:	de9ff06f          	j	80005700 <__printf+0x3f8>
    8000591c:	00400793          	li	a5,4
    80005920:	00300c93          	li	s9,3
    80005924:	dddff06f          	j	80005700 <__printf+0x3f8>
    80005928:	00400793          	li	a5,4
    8000592c:	00300c93          	li	s9,3
    80005930:	c39ff06f          	j	80005568 <__printf+0x260>
    80005934:	00500793          	li	a5,5
    80005938:	00400c93          	li	s9,4
    8000593c:	c2dff06f          	j	80005568 <__printf+0x260>
    80005940:	00500793          	li	a5,5
    80005944:	00400c93          	li	s9,4
    80005948:	db9ff06f          	j	80005700 <__printf+0x3f8>
    8000594c:	00600793          	li	a5,6
    80005950:	00500c93          	li	s9,5
    80005954:	dadff06f          	j	80005700 <__printf+0x3f8>
    80005958:	00600793          	li	a5,6
    8000595c:	00500c93          	li	s9,5
    80005960:	c09ff06f          	j	80005568 <__printf+0x260>
    80005964:	00800793          	li	a5,8
    80005968:	00700c93          	li	s9,7
    8000596c:	bfdff06f          	j	80005568 <__printf+0x260>
    80005970:	00100793          	li	a5,1
    80005974:	d91ff06f          	j	80005704 <__printf+0x3fc>
    80005978:	00100793          	li	a5,1
    8000597c:	bf1ff06f          	j	8000556c <__printf+0x264>
    80005980:	00900793          	li	a5,9
    80005984:	00800c93          	li	s9,8
    80005988:	be1ff06f          	j	80005568 <__printf+0x260>
    8000598c:	00002517          	auipc	a0,0x2
    80005990:	bdc50513          	addi	a0,a0,-1060 # 80007568 <CONSOLE_STATUS+0x558>
    80005994:	00000097          	auipc	ra,0x0
    80005998:	918080e7          	jalr	-1768(ra) # 800052ac <panic>

000000008000599c <printfinit>:
    8000599c:	fe010113          	addi	sp,sp,-32
    800059a0:	00813823          	sd	s0,16(sp)
    800059a4:	00913423          	sd	s1,8(sp)
    800059a8:	00113c23          	sd	ra,24(sp)
    800059ac:	02010413          	addi	s0,sp,32
    800059b0:	00004497          	auipc	s1,0x4
    800059b4:	b7048493          	addi	s1,s1,-1168 # 80009520 <pr>
    800059b8:	00048513          	mv	a0,s1
    800059bc:	00002597          	auipc	a1,0x2
    800059c0:	bbc58593          	addi	a1,a1,-1092 # 80007578 <CONSOLE_STATUS+0x568>
    800059c4:	00000097          	auipc	ra,0x0
    800059c8:	5f4080e7          	jalr	1524(ra) # 80005fb8 <initlock>
    800059cc:	01813083          	ld	ra,24(sp)
    800059d0:	01013403          	ld	s0,16(sp)
    800059d4:	0004ac23          	sw	zero,24(s1)
    800059d8:	00813483          	ld	s1,8(sp)
    800059dc:	02010113          	addi	sp,sp,32
    800059e0:	00008067          	ret

00000000800059e4 <uartinit>:
    800059e4:	ff010113          	addi	sp,sp,-16
    800059e8:	00813423          	sd	s0,8(sp)
    800059ec:	01010413          	addi	s0,sp,16
    800059f0:	100007b7          	lui	a5,0x10000
    800059f4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800059f8:	f8000713          	li	a4,-128
    800059fc:	00e781a3          	sb	a4,3(a5)
    80005a00:	00300713          	li	a4,3
    80005a04:	00e78023          	sb	a4,0(a5)
    80005a08:	000780a3          	sb	zero,1(a5)
    80005a0c:	00e781a3          	sb	a4,3(a5)
    80005a10:	00700693          	li	a3,7
    80005a14:	00d78123          	sb	a3,2(a5)
    80005a18:	00e780a3          	sb	a4,1(a5)
    80005a1c:	00813403          	ld	s0,8(sp)
    80005a20:	01010113          	addi	sp,sp,16
    80005a24:	00008067          	ret

0000000080005a28 <uartputc>:
    80005a28:	00003797          	auipc	a5,0x3
    80005a2c:	8707a783          	lw	a5,-1936(a5) # 80008298 <panicked>
    80005a30:	00078463          	beqz	a5,80005a38 <uartputc+0x10>
    80005a34:	0000006f          	j	80005a34 <uartputc+0xc>
    80005a38:	fd010113          	addi	sp,sp,-48
    80005a3c:	02813023          	sd	s0,32(sp)
    80005a40:	00913c23          	sd	s1,24(sp)
    80005a44:	01213823          	sd	s2,16(sp)
    80005a48:	01313423          	sd	s3,8(sp)
    80005a4c:	02113423          	sd	ra,40(sp)
    80005a50:	03010413          	addi	s0,sp,48
    80005a54:	00003917          	auipc	s2,0x3
    80005a58:	84c90913          	addi	s2,s2,-1972 # 800082a0 <uart_tx_r>
    80005a5c:	00093783          	ld	a5,0(s2)
    80005a60:	00003497          	auipc	s1,0x3
    80005a64:	84848493          	addi	s1,s1,-1976 # 800082a8 <uart_tx_w>
    80005a68:	0004b703          	ld	a4,0(s1)
    80005a6c:	02078693          	addi	a3,a5,32
    80005a70:	00050993          	mv	s3,a0
    80005a74:	02e69c63          	bne	a3,a4,80005aac <uartputc+0x84>
    80005a78:	00001097          	auipc	ra,0x1
    80005a7c:	834080e7          	jalr	-1996(ra) # 800062ac <push_on>
    80005a80:	00093783          	ld	a5,0(s2)
    80005a84:	0004b703          	ld	a4,0(s1)
    80005a88:	02078793          	addi	a5,a5,32
    80005a8c:	00e79463          	bne	a5,a4,80005a94 <uartputc+0x6c>
    80005a90:	0000006f          	j	80005a90 <uartputc+0x68>
    80005a94:	00001097          	auipc	ra,0x1
    80005a98:	88c080e7          	jalr	-1908(ra) # 80006320 <pop_on>
    80005a9c:	00093783          	ld	a5,0(s2)
    80005aa0:	0004b703          	ld	a4,0(s1)
    80005aa4:	02078693          	addi	a3,a5,32
    80005aa8:	fce688e3          	beq	a3,a4,80005a78 <uartputc+0x50>
    80005aac:	01f77693          	andi	a3,a4,31
    80005ab0:	00004597          	auipc	a1,0x4
    80005ab4:	a9058593          	addi	a1,a1,-1392 # 80009540 <uart_tx_buf>
    80005ab8:	00d586b3          	add	a3,a1,a3
    80005abc:	00170713          	addi	a4,a4,1
    80005ac0:	01368023          	sb	s3,0(a3)
    80005ac4:	00e4b023          	sd	a4,0(s1)
    80005ac8:	10000637          	lui	a2,0x10000
    80005acc:	02f71063          	bne	a4,a5,80005aec <uartputc+0xc4>
    80005ad0:	0340006f          	j	80005b04 <uartputc+0xdc>
    80005ad4:	00074703          	lbu	a4,0(a4)
    80005ad8:	00f93023          	sd	a5,0(s2)
    80005adc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80005ae0:	00093783          	ld	a5,0(s2)
    80005ae4:	0004b703          	ld	a4,0(s1)
    80005ae8:	00f70e63          	beq	a4,a5,80005b04 <uartputc+0xdc>
    80005aec:	00564683          	lbu	a3,5(a2)
    80005af0:	01f7f713          	andi	a4,a5,31
    80005af4:	00e58733          	add	a4,a1,a4
    80005af8:	0206f693          	andi	a3,a3,32
    80005afc:	00178793          	addi	a5,a5,1
    80005b00:	fc069ae3          	bnez	a3,80005ad4 <uartputc+0xac>
    80005b04:	02813083          	ld	ra,40(sp)
    80005b08:	02013403          	ld	s0,32(sp)
    80005b0c:	01813483          	ld	s1,24(sp)
    80005b10:	01013903          	ld	s2,16(sp)
    80005b14:	00813983          	ld	s3,8(sp)
    80005b18:	03010113          	addi	sp,sp,48
    80005b1c:	00008067          	ret

0000000080005b20 <uartputc_sync>:
    80005b20:	ff010113          	addi	sp,sp,-16
    80005b24:	00813423          	sd	s0,8(sp)
    80005b28:	01010413          	addi	s0,sp,16
    80005b2c:	00002717          	auipc	a4,0x2
    80005b30:	76c72703          	lw	a4,1900(a4) # 80008298 <panicked>
    80005b34:	02071663          	bnez	a4,80005b60 <uartputc_sync+0x40>
    80005b38:	00050793          	mv	a5,a0
    80005b3c:	100006b7          	lui	a3,0x10000
    80005b40:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005b44:	02077713          	andi	a4,a4,32
    80005b48:	fe070ce3          	beqz	a4,80005b40 <uartputc_sync+0x20>
    80005b4c:	0ff7f793          	andi	a5,a5,255
    80005b50:	00f68023          	sb	a5,0(a3)
    80005b54:	00813403          	ld	s0,8(sp)
    80005b58:	01010113          	addi	sp,sp,16
    80005b5c:	00008067          	ret
    80005b60:	0000006f          	j	80005b60 <uartputc_sync+0x40>

0000000080005b64 <uartstart>:
    80005b64:	ff010113          	addi	sp,sp,-16
    80005b68:	00813423          	sd	s0,8(sp)
    80005b6c:	01010413          	addi	s0,sp,16
    80005b70:	00002617          	auipc	a2,0x2
    80005b74:	73060613          	addi	a2,a2,1840 # 800082a0 <uart_tx_r>
    80005b78:	00002517          	auipc	a0,0x2
    80005b7c:	73050513          	addi	a0,a0,1840 # 800082a8 <uart_tx_w>
    80005b80:	00063783          	ld	a5,0(a2)
    80005b84:	00053703          	ld	a4,0(a0)
    80005b88:	04f70263          	beq	a4,a5,80005bcc <uartstart+0x68>
    80005b8c:	100005b7          	lui	a1,0x10000
    80005b90:	00004817          	auipc	a6,0x4
    80005b94:	9b080813          	addi	a6,a6,-1616 # 80009540 <uart_tx_buf>
    80005b98:	01c0006f          	j	80005bb4 <uartstart+0x50>
    80005b9c:	0006c703          	lbu	a4,0(a3)
    80005ba0:	00f63023          	sd	a5,0(a2)
    80005ba4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005ba8:	00063783          	ld	a5,0(a2)
    80005bac:	00053703          	ld	a4,0(a0)
    80005bb0:	00f70e63          	beq	a4,a5,80005bcc <uartstart+0x68>
    80005bb4:	01f7f713          	andi	a4,a5,31
    80005bb8:	00e806b3          	add	a3,a6,a4
    80005bbc:	0055c703          	lbu	a4,5(a1)
    80005bc0:	00178793          	addi	a5,a5,1
    80005bc4:	02077713          	andi	a4,a4,32
    80005bc8:	fc071ae3          	bnez	a4,80005b9c <uartstart+0x38>
    80005bcc:	00813403          	ld	s0,8(sp)
    80005bd0:	01010113          	addi	sp,sp,16
    80005bd4:	00008067          	ret

0000000080005bd8 <uartgetc>:
    80005bd8:	ff010113          	addi	sp,sp,-16
    80005bdc:	00813423          	sd	s0,8(sp)
    80005be0:	01010413          	addi	s0,sp,16
    80005be4:	10000737          	lui	a4,0x10000
    80005be8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80005bec:	0017f793          	andi	a5,a5,1
    80005bf0:	00078c63          	beqz	a5,80005c08 <uartgetc+0x30>
    80005bf4:	00074503          	lbu	a0,0(a4)
    80005bf8:	0ff57513          	andi	a0,a0,255
    80005bfc:	00813403          	ld	s0,8(sp)
    80005c00:	01010113          	addi	sp,sp,16
    80005c04:	00008067          	ret
    80005c08:	fff00513          	li	a0,-1
    80005c0c:	ff1ff06f          	j	80005bfc <uartgetc+0x24>

0000000080005c10 <uartintr>:
    80005c10:	100007b7          	lui	a5,0x10000
    80005c14:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80005c18:	0017f793          	andi	a5,a5,1
    80005c1c:	0a078463          	beqz	a5,80005cc4 <uartintr+0xb4>
    80005c20:	fe010113          	addi	sp,sp,-32
    80005c24:	00813823          	sd	s0,16(sp)
    80005c28:	00913423          	sd	s1,8(sp)
    80005c2c:	00113c23          	sd	ra,24(sp)
    80005c30:	02010413          	addi	s0,sp,32
    80005c34:	100004b7          	lui	s1,0x10000
    80005c38:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80005c3c:	0ff57513          	andi	a0,a0,255
    80005c40:	fffff097          	auipc	ra,0xfffff
    80005c44:	534080e7          	jalr	1332(ra) # 80005174 <consoleintr>
    80005c48:	0054c783          	lbu	a5,5(s1)
    80005c4c:	0017f793          	andi	a5,a5,1
    80005c50:	fe0794e3          	bnez	a5,80005c38 <uartintr+0x28>
    80005c54:	00002617          	auipc	a2,0x2
    80005c58:	64c60613          	addi	a2,a2,1612 # 800082a0 <uart_tx_r>
    80005c5c:	00002517          	auipc	a0,0x2
    80005c60:	64c50513          	addi	a0,a0,1612 # 800082a8 <uart_tx_w>
    80005c64:	00063783          	ld	a5,0(a2)
    80005c68:	00053703          	ld	a4,0(a0)
    80005c6c:	04f70263          	beq	a4,a5,80005cb0 <uartintr+0xa0>
    80005c70:	100005b7          	lui	a1,0x10000
    80005c74:	00004817          	auipc	a6,0x4
    80005c78:	8cc80813          	addi	a6,a6,-1844 # 80009540 <uart_tx_buf>
    80005c7c:	01c0006f          	j	80005c98 <uartintr+0x88>
    80005c80:	0006c703          	lbu	a4,0(a3)
    80005c84:	00f63023          	sd	a5,0(a2)
    80005c88:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005c8c:	00063783          	ld	a5,0(a2)
    80005c90:	00053703          	ld	a4,0(a0)
    80005c94:	00f70e63          	beq	a4,a5,80005cb0 <uartintr+0xa0>
    80005c98:	01f7f713          	andi	a4,a5,31
    80005c9c:	00e806b3          	add	a3,a6,a4
    80005ca0:	0055c703          	lbu	a4,5(a1)
    80005ca4:	00178793          	addi	a5,a5,1
    80005ca8:	02077713          	andi	a4,a4,32
    80005cac:	fc071ae3          	bnez	a4,80005c80 <uartintr+0x70>
    80005cb0:	01813083          	ld	ra,24(sp)
    80005cb4:	01013403          	ld	s0,16(sp)
    80005cb8:	00813483          	ld	s1,8(sp)
    80005cbc:	02010113          	addi	sp,sp,32
    80005cc0:	00008067          	ret
    80005cc4:	00002617          	auipc	a2,0x2
    80005cc8:	5dc60613          	addi	a2,a2,1500 # 800082a0 <uart_tx_r>
    80005ccc:	00002517          	auipc	a0,0x2
    80005cd0:	5dc50513          	addi	a0,a0,1500 # 800082a8 <uart_tx_w>
    80005cd4:	00063783          	ld	a5,0(a2)
    80005cd8:	00053703          	ld	a4,0(a0)
    80005cdc:	04f70263          	beq	a4,a5,80005d20 <uartintr+0x110>
    80005ce0:	100005b7          	lui	a1,0x10000
    80005ce4:	00004817          	auipc	a6,0x4
    80005ce8:	85c80813          	addi	a6,a6,-1956 # 80009540 <uart_tx_buf>
    80005cec:	01c0006f          	j	80005d08 <uartintr+0xf8>
    80005cf0:	0006c703          	lbu	a4,0(a3)
    80005cf4:	00f63023          	sd	a5,0(a2)
    80005cf8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005cfc:	00063783          	ld	a5,0(a2)
    80005d00:	00053703          	ld	a4,0(a0)
    80005d04:	02f70063          	beq	a4,a5,80005d24 <uartintr+0x114>
    80005d08:	01f7f713          	andi	a4,a5,31
    80005d0c:	00e806b3          	add	a3,a6,a4
    80005d10:	0055c703          	lbu	a4,5(a1)
    80005d14:	00178793          	addi	a5,a5,1
    80005d18:	02077713          	andi	a4,a4,32
    80005d1c:	fc071ae3          	bnez	a4,80005cf0 <uartintr+0xe0>
    80005d20:	00008067          	ret
    80005d24:	00008067          	ret

0000000080005d28 <kinit>:
    80005d28:	fc010113          	addi	sp,sp,-64
    80005d2c:	02913423          	sd	s1,40(sp)
    80005d30:	fffff7b7          	lui	a5,0xfffff
    80005d34:	00005497          	auipc	s1,0x5
    80005d38:	82b48493          	addi	s1,s1,-2005 # 8000a55f <end+0xfff>
    80005d3c:	02813823          	sd	s0,48(sp)
    80005d40:	01313c23          	sd	s3,24(sp)
    80005d44:	00f4f4b3          	and	s1,s1,a5
    80005d48:	02113c23          	sd	ra,56(sp)
    80005d4c:	03213023          	sd	s2,32(sp)
    80005d50:	01413823          	sd	s4,16(sp)
    80005d54:	01513423          	sd	s5,8(sp)
    80005d58:	04010413          	addi	s0,sp,64
    80005d5c:	000017b7          	lui	a5,0x1
    80005d60:	01100993          	li	s3,17
    80005d64:	00f487b3          	add	a5,s1,a5
    80005d68:	01b99993          	slli	s3,s3,0x1b
    80005d6c:	06f9e063          	bltu	s3,a5,80005dcc <kinit+0xa4>
    80005d70:	00003a97          	auipc	s5,0x3
    80005d74:	7f0a8a93          	addi	s5,s5,2032 # 80009560 <end>
    80005d78:	0754ec63          	bltu	s1,s5,80005df0 <kinit+0xc8>
    80005d7c:	0734fa63          	bgeu	s1,s3,80005df0 <kinit+0xc8>
    80005d80:	00088a37          	lui	s4,0x88
    80005d84:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80005d88:	00002917          	auipc	s2,0x2
    80005d8c:	52890913          	addi	s2,s2,1320 # 800082b0 <kmem>
    80005d90:	00ca1a13          	slli	s4,s4,0xc
    80005d94:	0140006f          	j	80005da8 <kinit+0x80>
    80005d98:	000017b7          	lui	a5,0x1
    80005d9c:	00f484b3          	add	s1,s1,a5
    80005da0:	0554e863          	bltu	s1,s5,80005df0 <kinit+0xc8>
    80005da4:	0534f663          	bgeu	s1,s3,80005df0 <kinit+0xc8>
    80005da8:	00001637          	lui	a2,0x1
    80005dac:	00100593          	li	a1,1
    80005db0:	00048513          	mv	a0,s1
    80005db4:	00000097          	auipc	ra,0x0
    80005db8:	5e4080e7          	jalr	1508(ra) # 80006398 <__memset>
    80005dbc:	00093783          	ld	a5,0(s2)
    80005dc0:	00f4b023          	sd	a5,0(s1)
    80005dc4:	00993023          	sd	s1,0(s2)
    80005dc8:	fd4498e3          	bne	s1,s4,80005d98 <kinit+0x70>
    80005dcc:	03813083          	ld	ra,56(sp)
    80005dd0:	03013403          	ld	s0,48(sp)
    80005dd4:	02813483          	ld	s1,40(sp)
    80005dd8:	02013903          	ld	s2,32(sp)
    80005ddc:	01813983          	ld	s3,24(sp)
    80005de0:	01013a03          	ld	s4,16(sp)
    80005de4:	00813a83          	ld	s5,8(sp)
    80005de8:	04010113          	addi	sp,sp,64
    80005dec:	00008067          	ret
    80005df0:	00001517          	auipc	a0,0x1
    80005df4:	7a850513          	addi	a0,a0,1960 # 80007598 <digits+0x18>
    80005df8:	fffff097          	auipc	ra,0xfffff
    80005dfc:	4b4080e7          	jalr	1204(ra) # 800052ac <panic>

0000000080005e00 <freerange>:
    80005e00:	fc010113          	addi	sp,sp,-64
    80005e04:	000017b7          	lui	a5,0x1
    80005e08:	02913423          	sd	s1,40(sp)
    80005e0c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005e10:	009504b3          	add	s1,a0,s1
    80005e14:	fffff537          	lui	a0,0xfffff
    80005e18:	02813823          	sd	s0,48(sp)
    80005e1c:	02113c23          	sd	ra,56(sp)
    80005e20:	03213023          	sd	s2,32(sp)
    80005e24:	01313c23          	sd	s3,24(sp)
    80005e28:	01413823          	sd	s4,16(sp)
    80005e2c:	01513423          	sd	s5,8(sp)
    80005e30:	01613023          	sd	s6,0(sp)
    80005e34:	04010413          	addi	s0,sp,64
    80005e38:	00a4f4b3          	and	s1,s1,a0
    80005e3c:	00f487b3          	add	a5,s1,a5
    80005e40:	06f5e463          	bltu	a1,a5,80005ea8 <freerange+0xa8>
    80005e44:	00003a97          	auipc	s5,0x3
    80005e48:	71ca8a93          	addi	s5,s5,1820 # 80009560 <end>
    80005e4c:	0954e263          	bltu	s1,s5,80005ed0 <freerange+0xd0>
    80005e50:	01100993          	li	s3,17
    80005e54:	01b99993          	slli	s3,s3,0x1b
    80005e58:	0734fc63          	bgeu	s1,s3,80005ed0 <freerange+0xd0>
    80005e5c:	00058a13          	mv	s4,a1
    80005e60:	00002917          	auipc	s2,0x2
    80005e64:	45090913          	addi	s2,s2,1104 # 800082b0 <kmem>
    80005e68:	00002b37          	lui	s6,0x2
    80005e6c:	0140006f          	j	80005e80 <freerange+0x80>
    80005e70:	000017b7          	lui	a5,0x1
    80005e74:	00f484b3          	add	s1,s1,a5
    80005e78:	0554ec63          	bltu	s1,s5,80005ed0 <freerange+0xd0>
    80005e7c:	0534fa63          	bgeu	s1,s3,80005ed0 <freerange+0xd0>
    80005e80:	00001637          	lui	a2,0x1
    80005e84:	00100593          	li	a1,1
    80005e88:	00048513          	mv	a0,s1
    80005e8c:	00000097          	auipc	ra,0x0
    80005e90:	50c080e7          	jalr	1292(ra) # 80006398 <__memset>
    80005e94:	00093703          	ld	a4,0(s2)
    80005e98:	016487b3          	add	a5,s1,s6
    80005e9c:	00e4b023          	sd	a4,0(s1)
    80005ea0:	00993023          	sd	s1,0(s2)
    80005ea4:	fcfa76e3          	bgeu	s4,a5,80005e70 <freerange+0x70>
    80005ea8:	03813083          	ld	ra,56(sp)
    80005eac:	03013403          	ld	s0,48(sp)
    80005eb0:	02813483          	ld	s1,40(sp)
    80005eb4:	02013903          	ld	s2,32(sp)
    80005eb8:	01813983          	ld	s3,24(sp)
    80005ebc:	01013a03          	ld	s4,16(sp)
    80005ec0:	00813a83          	ld	s5,8(sp)
    80005ec4:	00013b03          	ld	s6,0(sp)
    80005ec8:	04010113          	addi	sp,sp,64
    80005ecc:	00008067          	ret
    80005ed0:	00001517          	auipc	a0,0x1
    80005ed4:	6c850513          	addi	a0,a0,1736 # 80007598 <digits+0x18>
    80005ed8:	fffff097          	auipc	ra,0xfffff
    80005edc:	3d4080e7          	jalr	980(ra) # 800052ac <panic>

0000000080005ee0 <kfree>:
    80005ee0:	fe010113          	addi	sp,sp,-32
    80005ee4:	00813823          	sd	s0,16(sp)
    80005ee8:	00113c23          	sd	ra,24(sp)
    80005eec:	00913423          	sd	s1,8(sp)
    80005ef0:	02010413          	addi	s0,sp,32
    80005ef4:	03451793          	slli	a5,a0,0x34
    80005ef8:	04079c63          	bnez	a5,80005f50 <kfree+0x70>
    80005efc:	00003797          	auipc	a5,0x3
    80005f00:	66478793          	addi	a5,a5,1636 # 80009560 <end>
    80005f04:	00050493          	mv	s1,a0
    80005f08:	04f56463          	bltu	a0,a5,80005f50 <kfree+0x70>
    80005f0c:	01100793          	li	a5,17
    80005f10:	01b79793          	slli	a5,a5,0x1b
    80005f14:	02f57e63          	bgeu	a0,a5,80005f50 <kfree+0x70>
    80005f18:	00001637          	lui	a2,0x1
    80005f1c:	00100593          	li	a1,1
    80005f20:	00000097          	auipc	ra,0x0
    80005f24:	478080e7          	jalr	1144(ra) # 80006398 <__memset>
    80005f28:	00002797          	auipc	a5,0x2
    80005f2c:	38878793          	addi	a5,a5,904 # 800082b0 <kmem>
    80005f30:	0007b703          	ld	a4,0(a5)
    80005f34:	01813083          	ld	ra,24(sp)
    80005f38:	01013403          	ld	s0,16(sp)
    80005f3c:	00e4b023          	sd	a4,0(s1)
    80005f40:	0097b023          	sd	s1,0(a5)
    80005f44:	00813483          	ld	s1,8(sp)
    80005f48:	02010113          	addi	sp,sp,32
    80005f4c:	00008067          	ret
    80005f50:	00001517          	auipc	a0,0x1
    80005f54:	64850513          	addi	a0,a0,1608 # 80007598 <digits+0x18>
    80005f58:	fffff097          	auipc	ra,0xfffff
    80005f5c:	354080e7          	jalr	852(ra) # 800052ac <panic>

0000000080005f60 <kalloc>:
    80005f60:	fe010113          	addi	sp,sp,-32
    80005f64:	00813823          	sd	s0,16(sp)
    80005f68:	00913423          	sd	s1,8(sp)
    80005f6c:	00113c23          	sd	ra,24(sp)
    80005f70:	02010413          	addi	s0,sp,32
    80005f74:	00002797          	auipc	a5,0x2
    80005f78:	33c78793          	addi	a5,a5,828 # 800082b0 <kmem>
    80005f7c:	0007b483          	ld	s1,0(a5)
    80005f80:	02048063          	beqz	s1,80005fa0 <kalloc+0x40>
    80005f84:	0004b703          	ld	a4,0(s1)
    80005f88:	00001637          	lui	a2,0x1
    80005f8c:	00500593          	li	a1,5
    80005f90:	00048513          	mv	a0,s1
    80005f94:	00e7b023          	sd	a4,0(a5)
    80005f98:	00000097          	auipc	ra,0x0
    80005f9c:	400080e7          	jalr	1024(ra) # 80006398 <__memset>
    80005fa0:	01813083          	ld	ra,24(sp)
    80005fa4:	01013403          	ld	s0,16(sp)
    80005fa8:	00048513          	mv	a0,s1
    80005fac:	00813483          	ld	s1,8(sp)
    80005fb0:	02010113          	addi	sp,sp,32
    80005fb4:	00008067          	ret

0000000080005fb8 <initlock>:
    80005fb8:	ff010113          	addi	sp,sp,-16
    80005fbc:	00813423          	sd	s0,8(sp)
    80005fc0:	01010413          	addi	s0,sp,16
    80005fc4:	00813403          	ld	s0,8(sp)
    80005fc8:	00b53423          	sd	a1,8(a0)
    80005fcc:	00052023          	sw	zero,0(a0)
    80005fd0:	00053823          	sd	zero,16(a0)
    80005fd4:	01010113          	addi	sp,sp,16
    80005fd8:	00008067          	ret

0000000080005fdc <acquire>:
    80005fdc:	fe010113          	addi	sp,sp,-32
    80005fe0:	00813823          	sd	s0,16(sp)
    80005fe4:	00913423          	sd	s1,8(sp)
    80005fe8:	00113c23          	sd	ra,24(sp)
    80005fec:	01213023          	sd	s2,0(sp)
    80005ff0:	02010413          	addi	s0,sp,32
    80005ff4:	00050493          	mv	s1,a0
    80005ff8:	10002973          	csrr	s2,sstatus
    80005ffc:	100027f3          	csrr	a5,sstatus
    80006000:	ffd7f793          	andi	a5,a5,-3
    80006004:	10079073          	csrw	sstatus,a5
    80006008:	fffff097          	auipc	ra,0xfffff
    8000600c:	8e0080e7          	jalr	-1824(ra) # 800048e8 <mycpu>
    80006010:	07852783          	lw	a5,120(a0)
    80006014:	06078e63          	beqz	a5,80006090 <acquire+0xb4>
    80006018:	fffff097          	auipc	ra,0xfffff
    8000601c:	8d0080e7          	jalr	-1840(ra) # 800048e8 <mycpu>
    80006020:	07852783          	lw	a5,120(a0)
    80006024:	0004a703          	lw	a4,0(s1)
    80006028:	0017879b          	addiw	a5,a5,1
    8000602c:	06f52c23          	sw	a5,120(a0)
    80006030:	04071063          	bnez	a4,80006070 <acquire+0x94>
    80006034:	00100713          	li	a4,1
    80006038:	00070793          	mv	a5,a4
    8000603c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006040:	0007879b          	sext.w	a5,a5
    80006044:	fe079ae3          	bnez	a5,80006038 <acquire+0x5c>
    80006048:	0ff0000f          	fence
    8000604c:	fffff097          	auipc	ra,0xfffff
    80006050:	89c080e7          	jalr	-1892(ra) # 800048e8 <mycpu>
    80006054:	01813083          	ld	ra,24(sp)
    80006058:	01013403          	ld	s0,16(sp)
    8000605c:	00a4b823          	sd	a0,16(s1)
    80006060:	00013903          	ld	s2,0(sp)
    80006064:	00813483          	ld	s1,8(sp)
    80006068:	02010113          	addi	sp,sp,32
    8000606c:	00008067          	ret
    80006070:	0104b903          	ld	s2,16(s1)
    80006074:	fffff097          	auipc	ra,0xfffff
    80006078:	874080e7          	jalr	-1932(ra) # 800048e8 <mycpu>
    8000607c:	faa91ce3          	bne	s2,a0,80006034 <acquire+0x58>
    80006080:	00001517          	auipc	a0,0x1
    80006084:	52050513          	addi	a0,a0,1312 # 800075a0 <digits+0x20>
    80006088:	fffff097          	auipc	ra,0xfffff
    8000608c:	224080e7          	jalr	548(ra) # 800052ac <panic>
    80006090:	00195913          	srli	s2,s2,0x1
    80006094:	fffff097          	auipc	ra,0xfffff
    80006098:	854080e7          	jalr	-1964(ra) # 800048e8 <mycpu>
    8000609c:	00197913          	andi	s2,s2,1
    800060a0:	07252e23          	sw	s2,124(a0)
    800060a4:	f75ff06f          	j	80006018 <acquire+0x3c>

00000000800060a8 <release>:
    800060a8:	fe010113          	addi	sp,sp,-32
    800060ac:	00813823          	sd	s0,16(sp)
    800060b0:	00113c23          	sd	ra,24(sp)
    800060b4:	00913423          	sd	s1,8(sp)
    800060b8:	01213023          	sd	s2,0(sp)
    800060bc:	02010413          	addi	s0,sp,32
    800060c0:	00052783          	lw	a5,0(a0)
    800060c4:	00079a63          	bnez	a5,800060d8 <release+0x30>
    800060c8:	00001517          	auipc	a0,0x1
    800060cc:	4e050513          	addi	a0,a0,1248 # 800075a8 <digits+0x28>
    800060d0:	fffff097          	auipc	ra,0xfffff
    800060d4:	1dc080e7          	jalr	476(ra) # 800052ac <panic>
    800060d8:	01053903          	ld	s2,16(a0)
    800060dc:	00050493          	mv	s1,a0
    800060e0:	fffff097          	auipc	ra,0xfffff
    800060e4:	808080e7          	jalr	-2040(ra) # 800048e8 <mycpu>
    800060e8:	fea910e3          	bne	s2,a0,800060c8 <release+0x20>
    800060ec:	0004b823          	sd	zero,16(s1)
    800060f0:	0ff0000f          	fence
    800060f4:	0f50000f          	fence	iorw,ow
    800060f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800060fc:	ffffe097          	auipc	ra,0xffffe
    80006100:	7ec080e7          	jalr	2028(ra) # 800048e8 <mycpu>
    80006104:	100027f3          	csrr	a5,sstatus
    80006108:	0027f793          	andi	a5,a5,2
    8000610c:	04079a63          	bnez	a5,80006160 <release+0xb8>
    80006110:	07852783          	lw	a5,120(a0)
    80006114:	02f05e63          	blez	a5,80006150 <release+0xa8>
    80006118:	fff7871b          	addiw	a4,a5,-1
    8000611c:	06e52c23          	sw	a4,120(a0)
    80006120:	00071c63          	bnez	a4,80006138 <release+0x90>
    80006124:	07c52783          	lw	a5,124(a0)
    80006128:	00078863          	beqz	a5,80006138 <release+0x90>
    8000612c:	100027f3          	csrr	a5,sstatus
    80006130:	0027e793          	ori	a5,a5,2
    80006134:	10079073          	csrw	sstatus,a5
    80006138:	01813083          	ld	ra,24(sp)
    8000613c:	01013403          	ld	s0,16(sp)
    80006140:	00813483          	ld	s1,8(sp)
    80006144:	00013903          	ld	s2,0(sp)
    80006148:	02010113          	addi	sp,sp,32
    8000614c:	00008067          	ret
    80006150:	00001517          	auipc	a0,0x1
    80006154:	47850513          	addi	a0,a0,1144 # 800075c8 <digits+0x48>
    80006158:	fffff097          	auipc	ra,0xfffff
    8000615c:	154080e7          	jalr	340(ra) # 800052ac <panic>
    80006160:	00001517          	auipc	a0,0x1
    80006164:	45050513          	addi	a0,a0,1104 # 800075b0 <digits+0x30>
    80006168:	fffff097          	auipc	ra,0xfffff
    8000616c:	144080e7          	jalr	324(ra) # 800052ac <panic>

0000000080006170 <holding>:
    80006170:	00052783          	lw	a5,0(a0)
    80006174:	00079663          	bnez	a5,80006180 <holding+0x10>
    80006178:	00000513          	li	a0,0
    8000617c:	00008067          	ret
    80006180:	fe010113          	addi	sp,sp,-32
    80006184:	00813823          	sd	s0,16(sp)
    80006188:	00913423          	sd	s1,8(sp)
    8000618c:	00113c23          	sd	ra,24(sp)
    80006190:	02010413          	addi	s0,sp,32
    80006194:	01053483          	ld	s1,16(a0)
    80006198:	ffffe097          	auipc	ra,0xffffe
    8000619c:	750080e7          	jalr	1872(ra) # 800048e8 <mycpu>
    800061a0:	01813083          	ld	ra,24(sp)
    800061a4:	01013403          	ld	s0,16(sp)
    800061a8:	40a48533          	sub	a0,s1,a0
    800061ac:	00153513          	seqz	a0,a0
    800061b0:	00813483          	ld	s1,8(sp)
    800061b4:	02010113          	addi	sp,sp,32
    800061b8:	00008067          	ret

00000000800061bc <push_off>:
    800061bc:	fe010113          	addi	sp,sp,-32
    800061c0:	00813823          	sd	s0,16(sp)
    800061c4:	00113c23          	sd	ra,24(sp)
    800061c8:	00913423          	sd	s1,8(sp)
    800061cc:	02010413          	addi	s0,sp,32
    800061d0:	100024f3          	csrr	s1,sstatus
    800061d4:	100027f3          	csrr	a5,sstatus
    800061d8:	ffd7f793          	andi	a5,a5,-3
    800061dc:	10079073          	csrw	sstatus,a5
    800061e0:	ffffe097          	auipc	ra,0xffffe
    800061e4:	708080e7          	jalr	1800(ra) # 800048e8 <mycpu>
    800061e8:	07852783          	lw	a5,120(a0)
    800061ec:	02078663          	beqz	a5,80006218 <push_off+0x5c>
    800061f0:	ffffe097          	auipc	ra,0xffffe
    800061f4:	6f8080e7          	jalr	1784(ra) # 800048e8 <mycpu>
    800061f8:	07852783          	lw	a5,120(a0)
    800061fc:	01813083          	ld	ra,24(sp)
    80006200:	01013403          	ld	s0,16(sp)
    80006204:	0017879b          	addiw	a5,a5,1
    80006208:	06f52c23          	sw	a5,120(a0)
    8000620c:	00813483          	ld	s1,8(sp)
    80006210:	02010113          	addi	sp,sp,32
    80006214:	00008067          	ret
    80006218:	0014d493          	srli	s1,s1,0x1
    8000621c:	ffffe097          	auipc	ra,0xffffe
    80006220:	6cc080e7          	jalr	1740(ra) # 800048e8 <mycpu>
    80006224:	0014f493          	andi	s1,s1,1
    80006228:	06952e23          	sw	s1,124(a0)
    8000622c:	fc5ff06f          	j	800061f0 <push_off+0x34>

0000000080006230 <pop_off>:
    80006230:	ff010113          	addi	sp,sp,-16
    80006234:	00813023          	sd	s0,0(sp)
    80006238:	00113423          	sd	ra,8(sp)
    8000623c:	01010413          	addi	s0,sp,16
    80006240:	ffffe097          	auipc	ra,0xffffe
    80006244:	6a8080e7          	jalr	1704(ra) # 800048e8 <mycpu>
    80006248:	100027f3          	csrr	a5,sstatus
    8000624c:	0027f793          	andi	a5,a5,2
    80006250:	04079663          	bnez	a5,8000629c <pop_off+0x6c>
    80006254:	07852783          	lw	a5,120(a0)
    80006258:	02f05a63          	blez	a5,8000628c <pop_off+0x5c>
    8000625c:	fff7871b          	addiw	a4,a5,-1
    80006260:	06e52c23          	sw	a4,120(a0)
    80006264:	00071c63          	bnez	a4,8000627c <pop_off+0x4c>
    80006268:	07c52783          	lw	a5,124(a0)
    8000626c:	00078863          	beqz	a5,8000627c <pop_off+0x4c>
    80006270:	100027f3          	csrr	a5,sstatus
    80006274:	0027e793          	ori	a5,a5,2
    80006278:	10079073          	csrw	sstatus,a5
    8000627c:	00813083          	ld	ra,8(sp)
    80006280:	00013403          	ld	s0,0(sp)
    80006284:	01010113          	addi	sp,sp,16
    80006288:	00008067          	ret
    8000628c:	00001517          	auipc	a0,0x1
    80006290:	33c50513          	addi	a0,a0,828 # 800075c8 <digits+0x48>
    80006294:	fffff097          	auipc	ra,0xfffff
    80006298:	018080e7          	jalr	24(ra) # 800052ac <panic>
    8000629c:	00001517          	auipc	a0,0x1
    800062a0:	31450513          	addi	a0,a0,788 # 800075b0 <digits+0x30>
    800062a4:	fffff097          	auipc	ra,0xfffff
    800062a8:	008080e7          	jalr	8(ra) # 800052ac <panic>

00000000800062ac <push_on>:
    800062ac:	fe010113          	addi	sp,sp,-32
    800062b0:	00813823          	sd	s0,16(sp)
    800062b4:	00113c23          	sd	ra,24(sp)
    800062b8:	00913423          	sd	s1,8(sp)
    800062bc:	02010413          	addi	s0,sp,32
    800062c0:	100024f3          	csrr	s1,sstatus
    800062c4:	100027f3          	csrr	a5,sstatus
    800062c8:	0027e793          	ori	a5,a5,2
    800062cc:	10079073          	csrw	sstatus,a5
    800062d0:	ffffe097          	auipc	ra,0xffffe
    800062d4:	618080e7          	jalr	1560(ra) # 800048e8 <mycpu>
    800062d8:	07852783          	lw	a5,120(a0)
    800062dc:	02078663          	beqz	a5,80006308 <push_on+0x5c>
    800062e0:	ffffe097          	auipc	ra,0xffffe
    800062e4:	608080e7          	jalr	1544(ra) # 800048e8 <mycpu>
    800062e8:	07852783          	lw	a5,120(a0)
    800062ec:	01813083          	ld	ra,24(sp)
    800062f0:	01013403          	ld	s0,16(sp)
    800062f4:	0017879b          	addiw	a5,a5,1
    800062f8:	06f52c23          	sw	a5,120(a0)
    800062fc:	00813483          	ld	s1,8(sp)
    80006300:	02010113          	addi	sp,sp,32
    80006304:	00008067          	ret
    80006308:	0014d493          	srli	s1,s1,0x1
    8000630c:	ffffe097          	auipc	ra,0xffffe
    80006310:	5dc080e7          	jalr	1500(ra) # 800048e8 <mycpu>
    80006314:	0014f493          	andi	s1,s1,1
    80006318:	06952e23          	sw	s1,124(a0)
    8000631c:	fc5ff06f          	j	800062e0 <push_on+0x34>

0000000080006320 <pop_on>:
    80006320:	ff010113          	addi	sp,sp,-16
    80006324:	00813023          	sd	s0,0(sp)
    80006328:	00113423          	sd	ra,8(sp)
    8000632c:	01010413          	addi	s0,sp,16
    80006330:	ffffe097          	auipc	ra,0xffffe
    80006334:	5b8080e7          	jalr	1464(ra) # 800048e8 <mycpu>
    80006338:	100027f3          	csrr	a5,sstatus
    8000633c:	0027f793          	andi	a5,a5,2
    80006340:	04078463          	beqz	a5,80006388 <pop_on+0x68>
    80006344:	07852783          	lw	a5,120(a0)
    80006348:	02f05863          	blez	a5,80006378 <pop_on+0x58>
    8000634c:	fff7879b          	addiw	a5,a5,-1
    80006350:	06f52c23          	sw	a5,120(a0)
    80006354:	07853783          	ld	a5,120(a0)
    80006358:	00079863          	bnez	a5,80006368 <pop_on+0x48>
    8000635c:	100027f3          	csrr	a5,sstatus
    80006360:	ffd7f793          	andi	a5,a5,-3
    80006364:	10079073          	csrw	sstatus,a5
    80006368:	00813083          	ld	ra,8(sp)
    8000636c:	00013403          	ld	s0,0(sp)
    80006370:	01010113          	addi	sp,sp,16
    80006374:	00008067          	ret
    80006378:	00001517          	auipc	a0,0x1
    8000637c:	27850513          	addi	a0,a0,632 # 800075f0 <digits+0x70>
    80006380:	fffff097          	auipc	ra,0xfffff
    80006384:	f2c080e7          	jalr	-212(ra) # 800052ac <panic>
    80006388:	00001517          	auipc	a0,0x1
    8000638c:	24850513          	addi	a0,a0,584 # 800075d0 <digits+0x50>
    80006390:	fffff097          	auipc	ra,0xfffff
    80006394:	f1c080e7          	jalr	-228(ra) # 800052ac <panic>

0000000080006398 <__memset>:
    80006398:	ff010113          	addi	sp,sp,-16
    8000639c:	00813423          	sd	s0,8(sp)
    800063a0:	01010413          	addi	s0,sp,16
    800063a4:	1a060e63          	beqz	a2,80006560 <__memset+0x1c8>
    800063a8:	40a007b3          	neg	a5,a0
    800063ac:	0077f793          	andi	a5,a5,7
    800063b0:	00778693          	addi	a3,a5,7
    800063b4:	00b00813          	li	a6,11
    800063b8:	0ff5f593          	andi	a1,a1,255
    800063bc:	fff6071b          	addiw	a4,a2,-1
    800063c0:	1b06e663          	bltu	a3,a6,8000656c <__memset+0x1d4>
    800063c4:	1cd76463          	bltu	a4,a3,8000658c <__memset+0x1f4>
    800063c8:	1a078e63          	beqz	a5,80006584 <__memset+0x1ec>
    800063cc:	00b50023          	sb	a1,0(a0)
    800063d0:	00100713          	li	a4,1
    800063d4:	1ae78463          	beq	a5,a4,8000657c <__memset+0x1e4>
    800063d8:	00b500a3          	sb	a1,1(a0)
    800063dc:	00200713          	li	a4,2
    800063e0:	1ae78a63          	beq	a5,a4,80006594 <__memset+0x1fc>
    800063e4:	00b50123          	sb	a1,2(a0)
    800063e8:	00300713          	li	a4,3
    800063ec:	18e78463          	beq	a5,a4,80006574 <__memset+0x1dc>
    800063f0:	00b501a3          	sb	a1,3(a0)
    800063f4:	00400713          	li	a4,4
    800063f8:	1ae78263          	beq	a5,a4,8000659c <__memset+0x204>
    800063fc:	00b50223          	sb	a1,4(a0)
    80006400:	00500713          	li	a4,5
    80006404:	1ae78063          	beq	a5,a4,800065a4 <__memset+0x20c>
    80006408:	00b502a3          	sb	a1,5(a0)
    8000640c:	00700713          	li	a4,7
    80006410:	18e79e63          	bne	a5,a4,800065ac <__memset+0x214>
    80006414:	00b50323          	sb	a1,6(a0)
    80006418:	00700e93          	li	t4,7
    8000641c:	00859713          	slli	a4,a1,0x8
    80006420:	00e5e733          	or	a4,a1,a4
    80006424:	01059e13          	slli	t3,a1,0x10
    80006428:	01c76e33          	or	t3,a4,t3
    8000642c:	01859313          	slli	t1,a1,0x18
    80006430:	006e6333          	or	t1,t3,t1
    80006434:	02059893          	slli	a7,a1,0x20
    80006438:	40f60e3b          	subw	t3,a2,a5
    8000643c:	011368b3          	or	a7,t1,a7
    80006440:	02859813          	slli	a6,a1,0x28
    80006444:	0108e833          	or	a6,a7,a6
    80006448:	03059693          	slli	a3,a1,0x30
    8000644c:	003e589b          	srliw	a7,t3,0x3
    80006450:	00d866b3          	or	a3,a6,a3
    80006454:	03859713          	slli	a4,a1,0x38
    80006458:	00389813          	slli	a6,a7,0x3
    8000645c:	00f507b3          	add	a5,a0,a5
    80006460:	00e6e733          	or	a4,a3,a4
    80006464:	000e089b          	sext.w	a7,t3
    80006468:	00f806b3          	add	a3,a6,a5
    8000646c:	00e7b023          	sd	a4,0(a5)
    80006470:	00878793          	addi	a5,a5,8
    80006474:	fed79ce3          	bne	a5,a3,8000646c <__memset+0xd4>
    80006478:	ff8e7793          	andi	a5,t3,-8
    8000647c:	0007871b          	sext.w	a4,a5
    80006480:	01d787bb          	addw	a5,a5,t4
    80006484:	0ce88e63          	beq	a7,a4,80006560 <__memset+0x1c8>
    80006488:	00f50733          	add	a4,a0,a5
    8000648c:	00b70023          	sb	a1,0(a4)
    80006490:	0017871b          	addiw	a4,a5,1
    80006494:	0cc77663          	bgeu	a4,a2,80006560 <__memset+0x1c8>
    80006498:	00e50733          	add	a4,a0,a4
    8000649c:	00b70023          	sb	a1,0(a4)
    800064a0:	0027871b          	addiw	a4,a5,2
    800064a4:	0ac77e63          	bgeu	a4,a2,80006560 <__memset+0x1c8>
    800064a8:	00e50733          	add	a4,a0,a4
    800064ac:	00b70023          	sb	a1,0(a4)
    800064b0:	0037871b          	addiw	a4,a5,3
    800064b4:	0ac77663          	bgeu	a4,a2,80006560 <__memset+0x1c8>
    800064b8:	00e50733          	add	a4,a0,a4
    800064bc:	00b70023          	sb	a1,0(a4)
    800064c0:	0047871b          	addiw	a4,a5,4
    800064c4:	08c77e63          	bgeu	a4,a2,80006560 <__memset+0x1c8>
    800064c8:	00e50733          	add	a4,a0,a4
    800064cc:	00b70023          	sb	a1,0(a4)
    800064d0:	0057871b          	addiw	a4,a5,5
    800064d4:	08c77663          	bgeu	a4,a2,80006560 <__memset+0x1c8>
    800064d8:	00e50733          	add	a4,a0,a4
    800064dc:	00b70023          	sb	a1,0(a4)
    800064e0:	0067871b          	addiw	a4,a5,6
    800064e4:	06c77e63          	bgeu	a4,a2,80006560 <__memset+0x1c8>
    800064e8:	00e50733          	add	a4,a0,a4
    800064ec:	00b70023          	sb	a1,0(a4)
    800064f0:	0077871b          	addiw	a4,a5,7
    800064f4:	06c77663          	bgeu	a4,a2,80006560 <__memset+0x1c8>
    800064f8:	00e50733          	add	a4,a0,a4
    800064fc:	00b70023          	sb	a1,0(a4)
    80006500:	0087871b          	addiw	a4,a5,8
    80006504:	04c77e63          	bgeu	a4,a2,80006560 <__memset+0x1c8>
    80006508:	00e50733          	add	a4,a0,a4
    8000650c:	00b70023          	sb	a1,0(a4)
    80006510:	0097871b          	addiw	a4,a5,9
    80006514:	04c77663          	bgeu	a4,a2,80006560 <__memset+0x1c8>
    80006518:	00e50733          	add	a4,a0,a4
    8000651c:	00b70023          	sb	a1,0(a4)
    80006520:	00a7871b          	addiw	a4,a5,10
    80006524:	02c77e63          	bgeu	a4,a2,80006560 <__memset+0x1c8>
    80006528:	00e50733          	add	a4,a0,a4
    8000652c:	00b70023          	sb	a1,0(a4)
    80006530:	00b7871b          	addiw	a4,a5,11
    80006534:	02c77663          	bgeu	a4,a2,80006560 <__memset+0x1c8>
    80006538:	00e50733          	add	a4,a0,a4
    8000653c:	00b70023          	sb	a1,0(a4)
    80006540:	00c7871b          	addiw	a4,a5,12
    80006544:	00c77e63          	bgeu	a4,a2,80006560 <__memset+0x1c8>
    80006548:	00e50733          	add	a4,a0,a4
    8000654c:	00b70023          	sb	a1,0(a4)
    80006550:	00d7879b          	addiw	a5,a5,13
    80006554:	00c7f663          	bgeu	a5,a2,80006560 <__memset+0x1c8>
    80006558:	00f507b3          	add	a5,a0,a5
    8000655c:	00b78023          	sb	a1,0(a5)
    80006560:	00813403          	ld	s0,8(sp)
    80006564:	01010113          	addi	sp,sp,16
    80006568:	00008067          	ret
    8000656c:	00b00693          	li	a3,11
    80006570:	e55ff06f          	j	800063c4 <__memset+0x2c>
    80006574:	00300e93          	li	t4,3
    80006578:	ea5ff06f          	j	8000641c <__memset+0x84>
    8000657c:	00100e93          	li	t4,1
    80006580:	e9dff06f          	j	8000641c <__memset+0x84>
    80006584:	00000e93          	li	t4,0
    80006588:	e95ff06f          	j	8000641c <__memset+0x84>
    8000658c:	00000793          	li	a5,0
    80006590:	ef9ff06f          	j	80006488 <__memset+0xf0>
    80006594:	00200e93          	li	t4,2
    80006598:	e85ff06f          	j	8000641c <__memset+0x84>
    8000659c:	00400e93          	li	t4,4
    800065a0:	e7dff06f          	j	8000641c <__memset+0x84>
    800065a4:	00500e93          	li	t4,5
    800065a8:	e75ff06f          	j	8000641c <__memset+0x84>
    800065ac:	00600e93          	li	t4,6
    800065b0:	e6dff06f          	j	8000641c <__memset+0x84>

00000000800065b4 <__memmove>:
    800065b4:	ff010113          	addi	sp,sp,-16
    800065b8:	00813423          	sd	s0,8(sp)
    800065bc:	01010413          	addi	s0,sp,16
    800065c0:	0e060863          	beqz	a2,800066b0 <__memmove+0xfc>
    800065c4:	fff6069b          	addiw	a3,a2,-1
    800065c8:	0006881b          	sext.w	a6,a3
    800065cc:	0ea5e863          	bltu	a1,a0,800066bc <__memmove+0x108>
    800065d0:	00758713          	addi	a4,a1,7
    800065d4:	00a5e7b3          	or	a5,a1,a0
    800065d8:	40a70733          	sub	a4,a4,a0
    800065dc:	0077f793          	andi	a5,a5,7
    800065e0:	00f73713          	sltiu	a4,a4,15
    800065e4:	00174713          	xori	a4,a4,1
    800065e8:	0017b793          	seqz	a5,a5
    800065ec:	00e7f7b3          	and	a5,a5,a4
    800065f0:	10078863          	beqz	a5,80006700 <__memmove+0x14c>
    800065f4:	00900793          	li	a5,9
    800065f8:	1107f463          	bgeu	a5,a6,80006700 <__memmove+0x14c>
    800065fc:	0036581b          	srliw	a6,a2,0x3
    80006600:	fff8081b          	addiw	a6,a6,-1
    80006604:	02081813          	slli	a6,a6,0x20
    80006608:	01d85893          	srli	a7,a6,0x1d
    8000660c:	00858813          	addi	a6,a1,8
    80006610:	00058793          	mv	a5,a1
    80006614:	00050713          	mv	a4,a0
    80006618:	01088833          	add	a6,a7,a6
    8000661c:	0007b883          	ld	a7,0(a5)
    80006620:	00878793          	addi	a5,a5,8
    80006624:	00870713          	addi	a4,a4,8
    80006628:	ff173c23          	sd	a7,-8(a4)
    8000662c:	ff0798e3          	bne	a5,a6,8000661c <__memmove+0x68>
    80006630:	ff867713          	andi	a4,a2,-8
    80006634:	02071793          	slli	a5,a4,0x20
    80006638:	0207d793          	srli	a5,a5,0x20
    8000663c:	00f585b3          	add	a1,a1,a5
    80006640:	40e686bb          	subw	a3,a3,a4
    80006644:	00f507b3          	add	a5,a0,a5
    80006648:	06e60463          	beq	a2,a4,800066b0 <__memmove+0xfc>
    8000664c:	0005c703          	lbu	a4,0(a1)
    80006650:	00e78023          	sb	a4,0(a5)
    80006654:	04068e63          	beqz	a3,800066b0 <__memmove+0xfc>
    80006658:	0015c603          	lbu	a2,1(a1)
    8000665c:	00100713          	li	a4,1
    80006660:	00c780a3          	sb	a2,1(a5)
    80006664:	04e68663          	beq	a3,a4,800066b0 <__memmove+0xfc>
    80006668:	0025c603          	lbu	a2,2(a1)
    8000666c:	00200713          	li	a4,2
    80006670:	00c78123          	sb	a2,2(a5)
    80006674:	02e68e63          	beq	a3,a4,800066b0 <__memmove+0xfc>
    80006678:	0035c603          	lbu	a2,3(a1)
    8000667c:	00300713          	li	a4,3
    80006680:	00c781a3          	sb	a2,3(a5)
    80006684:	02e68663          	beq	a3,a4,800066b0 <__memmove+0xfc>
    80006688:	0045c603          	lbu	a2,4(a1)
    8000668c:	00400713          	li	a4,4
    80006690:	00c78223          	sb	a2,4(a5)
    80006694:	00e68e63          	beq	a3,a4,800066b0 <__memmove+0xfc>
    80006698:	0055c603          	lbu	a2,5(a1)
    8000669c:	00500713          	li	a4,5
    800066a0:	00c782a3          	sb	a2,5(a5)
    800066a4:	00e68663          	beq	a3,a4,800066b0 <__memmove+0xfc>
    800066a8:	0065c703          	lbu	a4,6(a1)
    800066ac:	00e78323          	sb	a4,6(a5)
    800066b0:	00813403          	ld	s0,8(sp)
    800066b4:	01010113          	addi	sp,sp,16
    800066b8:	00008067          	ret
    800066bc:	02061713          	slli	a4,a2,0x20
    800066c0:	02075713          	srli	a4,a4,0x20
    800066c4:	00e587b3          	add	a5,a1,a4
    800066c8:	f0f574e3          	bgeu	a0,a5,800065d0 <__memmove+0x1c>
    800066cc:	02069613          	slli	a2,a3,0x20
    800066d0:	02065613          	srli	a2,a2,0x20
    800066d4:	fff64613          	not	a2,a2
    800066d8:	00e50733          	add	a4,a0,a4
    800066dc:	00c78633          	add	a2,a5,a2
    800066e0:	fff7c683          	lbu	a3,-1(a5)
    800066e4:	fff78793          	addi	a5,a5,-1
    800066e8:	fff70713          	addi	a4,a4,-1
    800066ec:	00d70023          	sb	a3,0(a4)
    800066f0:	fec798e3          	bne	a5,a2,800066e0 <__memmove+0x12c>
    800066f4:	00813403          	ld	s0,8(sp)
    800066f8:	01010113          	addi	sp,sp,16
    800066fc:	00008067          	ret
    80006700:	02069713          	slli	a4,a3,0x20
    80006704:	02075713          	srli	a4,a4,0x20
    80006708:	00170713          	addi	a4,a4,1
    8000670c:	00e50733          	add	a4,a0,a4
    80006710:	00050793          	mv	a5,a0
    80006714:	0005c683          	lbu	a3,0(a1)
    80006718:	00178793          	addi	a5,a5,1
    8000671c:	00158593          	addi	a1,a1,1
    80006720:	fed78fa3          	sb	a3,-1(a5)
    80006724:	fee798e3          	bne	a5,a4,80006714 <__memmove+0x160>
    80006728:	f89ff06f          	j	800066b0 <__memmove+0xfc>
	...
