
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00008117          	auipc	sp,0x8
    80000004:	0c813103          	ld	sp,200(sp) # 800080c8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	691030ef          	jal	ra,80003eac <start>

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
    8000107c:	3c4020ef          	jal	ra,80003440 <exceptionHandler>


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
#include "assert.h"
#include "console.h"

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
    8000111c:	0187b783          	ld	a5,24(a5) # 80008130 <_ZN5Timer8instanceE>
    80001120:	02079463          	bnez	a5,80001148 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80001124:	00007797          	auipc	a5,0x7
    80001128:	0097b623          	sd	s1,12(a5) # 80008130 <_ZN5Timer8instanceE>
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
    80001150:	01500613          	li	a2,21
    80001154:	00006597          	auipc	a1,0x6
    80001158:	edc58593          	addi	a1,a1,-292 # 80007030 <CONSOLE_STATUS+0x20>
    8000115c:	00006517          	auipc	a0,0x6
    80001160:	ee450513          	addi	a0,a0,-284 # 80007040 <CONSOLE_STATUS+0x30>
    80001164:	00000097          	auipc	ra,0x0
    80001168:	738080e7          	jalr	1848(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
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
    800011bc:	f787b783          	ld	a5,-136(a5) # 80008130 <_ZN5Timer8instanceE>
    800011c0:	00078863          	beqz	a5,800011d0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800011c4:	00007517          	auipc	a0,0x7
    800011c8:	f6c53503          	ld	a0,-148(a0) # 80008130 <_ZN5Timer8instanceE>
    800011cc:	00008067          	ret
Timer& Timer::getInstance(){
    800011d0:	ff010113          	addi	sp,sp,-16
    800011d4:	00113423          	sd	ra,8(sp)
    800011d8:	00813023          	sd	s0,0(sp)
    800011dc:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    800011e0:	00006697          	auipc	a3,0x6
    800011e4:	e7068693          	addi	a3,a3,-400 # 80007050 <CONSOLE_STATUS+0x40>
    800011e8:	02500613          	li	a2,37
    800011ec:	00006597          	auipc	a1,0x6
    800011f0:	e4458593          	addi	a1,a1,-444 # 80007030 <CONSOLE_STATUS+0x20>
    800011f4:	00006517          	auipc	a0,0x6
    800011f8:	e8450513          	addi	a0,a0,-380 # 80007078 <CONSOLE_STATUS+0x68>
    800011fc:	00000097          	auipc	ra,0x0
    80001200:	6a0080e7          	jalr	1696(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
}
    80001204:	00007517          	auipc	a0,0x7
    80001208:	f2c53503          	ld	a0,-212(a0) # 80008130 <_ZN5Timer8instanceE>
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
    //     __putc('i');
    //     __putc('c');
    //     __putc('k');
    //     __putc('\n');
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
    8000127c:	00001097          	auipc	ra,0x1
    80001280:	6e4080e7          	jalr	1764(ra) # 80002960 <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    80001284:	0004b503          	ld	a0,0(s1)
    80001288:	00003097          	auipc	ra,0x3
    8000128c:	8ac080e7          	jalr	-1876(ra) # 80003b34 <_ZN9Scheduler3putEP7_thread>
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
    800012e4:	e007b783          	ld	a5,-512(a5) # 800080e0 <_GLOBAL_OFFSET_TABLE_+0x38>
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
    80001338:	00001097          	auipc	ra,0x1
    8000133c:	628080e7          	jalr	1576(ra) # 80002960 <_ZN7_thread11setSleepingEb>
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
    80001684:	00001097          	auipc	ra,0x1
    80001688:	2b0080e7          	jalr	688(ra) # 80002934 <_ZN7_thread9setClosedEb>
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
    800016fc:	9e87b783          	ld	a5,-1560(a5) # 800080e0 <_GLOBAL_OFFSET_TABLE_+0x38>
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
    80001728:	9bc7b783          	ld	a5,-1604(a5) # 800080e0 <_GLOBAL_OFFSET_TABLE_+0x38>
    8000172c:	0007b503          	ld	a0,0(a5)
    80001730:	00001097          	auipc	ra,0x1
    80001734:	1d4080e7          	jalr	468(ra) # 80002904 <_ZN7_thread10setBlockedEb>
        // _thread::dispatch();
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
    800017a4:	00001097          	auipc	ra,0x1
    800017a8:	160080e7          	jalr	352(ra) # 80002904 <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    800017ac:	00048513          	mv	a0,s1
    800017b0:	00000097          	auipc	ra,0x0
    800017b4:	c10080e7          	jalr	-1008(ra) # 800013c0 <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    800017b8:	0004b503          	ld	a0,0(s1)
    800017bc:	00002097          	auipc	ra,0x2
    800017c0:	378080e7          	jalr	888(ra) # 80003b34 <_ZN9Scheduler3putEP7_thread>
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

#include "kernel.h"
#include "assert.h"

/// @brief first function to be called
void main(){
    800017e0:	fb010113          	addi	sp,sp,-80
    800017e4:	04113423          	sd	ra,72(sp)
    800017e8:	04813023          	sd	s0,64(sp)
    800017ec:	02913c23          	sd	s1,56(sp)
    800017f0:	05010413          	addi	s0,sp,80
    Kernel kernel = Kernel();
    800017f4:	fb840493          	addi	s1,s0,-72
    800017f8:	00048513          	mv	a0,s1
    800017fc:	00000097          	auipc	ra,0x0
    80001800:	3cc080e7          	jalr	972(ra) # 80001bc8 <_ZN6KernelC1Ev>
    kernel.initialise();
    80001804:	00048513          	mv	a0,s1
    80001808:	00000097          	auipc	ra,0x0
    8000180c:	434080e7          	jalr	1076(ra) # 80001c3c <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    80001810:	00048513          	mv	a0,s1
    80001814:	00000097          	auipc	ra,0x0
    80001818:	52c080e7          	jalr	1324(ra) # 80001d40 <_ZN6Kernel3runEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    8000181c:	02051863          	bnez	a0,8000184c <main+0x6c>
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    80001820:	fd040513          	addi	a0,s0,-48
    80001824:	00000097          	auipc	ra,0x0
    80001828:	94c080e7          	jalr	-1716(ra) # 80001170 <_ZN5TimerD1Ev>
    8000182c:	fb840513          	addi	a0,s0,-72
    80001830:	00001097          	auipc	ra,0x1
    80001834:	308080e7          	jalr	776(ra) # 80002b38 <_ZN11HeapManagerD1Ev>
    80001838:	04813083          	ld	ra,72(sp)
    8000183c:	04013403          	ld	s0,64(sp)
    80001840:	03813483          	ld	s1,56(sp)
    80001844:	05010113          	addi	sp,sp,80
    80001848:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    8000184c:	00006697          	auipc	a3,0x6
    80001850:	83c68693          	addi	a3,a3,-1988 # 80007088 <CONSOLE_STATUS+0x78>
    80001854:	01400613          	li	a2,20
    80001858:	00006597          	auipc	a1,0x6
    8000185c:	84058593          	addi	a1,a1,-1984 # 80007098 <CONSOLE_STATUS+0x88>
    80001860:	00006517          	auipc	a0,0x6
    80001864:	84850513          	addi	a0,a0,-1976 # 800070a8 <CONSOLE_STATUS+0x98>
    80001868:	00000097          	auipc	ra,0x0
    8000186c:	034080e7          	jalr	52(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80001870:	fb1ff06f          	j	80001820 <main+0x40>
    80001874:	00050493          	mv	s1,a0
    80001878:	fd040513          	addi	a0,s0,-48
    8000187c:	00000097          	auipc	ra,0x0
    80001880:	8f4080e7          	jalr	-1804(ra) # 80001170 <_ZN5TimerD1Ev>
    80001884:	fb840513          	addi	a0,s0,-72
    80001888:	00001097          	auipc	ra,0x1
    8000188c:	2b0080e7          	jalr	688(ra) # 80002b38 <_ZN11HeapManagerD1Ev>
    80001890:	00048513          	mv	a0,s1
    80001894:	00008097          	auipc	ra,0x8
    80001898:	9c4080e7          	jalr	-1596(ra) # 80009258 <_Unwind_Resume>

000000008000189c <_Z13assert_failedPKcS0_jS0_>:
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    8000189c:	fb010113          	addi	sp,sp,-80
    800018a0:	04113423          	sd	ra,72(sp)
    800018a4:	04813023          	sd	s0,64(sp)
    800018a8:	02913c23          	sd	s1,56(sp)
    800018ac:	03213823          	sd	s2,48(sp)
    800018b0:	03313423          	sd	s3,40(sp)
    800018b4:	03413023          	sd	s4,32(sp)
    800018b8:	05010413          	addi	s0,sp,80
    800018bc:	00050993          	mv	s3,a0
    800018c0:	00058493          	mv	s1,a1
    800018c4:	00060913          	mv	s2,a2
    800018c8:	00068a13          	mv	s4,a3
    putc('\n');
    800018cc:	00a00513          	li	a0,10
    800018d0:	00000097          	auipc	ra,0x0
    800018d4:	d0c080e7          	jalr	-756(ra) # 800015dc <_Z4putcc>
    putc('A');
    800018d8:	04100513          	li	a0,65
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	d00080e7          	jalr	-768(ra) # 800015dc <_Z4putcc>
    putc('s');
    800018e4:	07300513          	li	a0,115
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	cf4080e7          	jalr	-780(ra) # 800015dc <_Z4putcc>
    putc('s');
    800018f0:	07300513          	li	a0,115
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	ce8080e7          	jalr	-792(ra) # 800015dc <_Z4putcc>
    putc('e');
    800018fc:	06500513          	li	a0,101
    80001900:	00000097          	auipc	ra,0x0
    80001904:	cdc080e7          	jalr	-804(ra) # 800015dc <_Z4putcc>
    putc('r');
    80001908:	07200513          	li	a0,114
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	cd0080e7          	jalr	-816(ra) # 800015dc <_Z4putcc>
    putc('t');
    80001914:	07400513          	li	a0,116
    80001918:	00000097          	auipc	ra,0x0
    8000191c:	cc4080e7          	jalr	-828(ra) # 800015dc <_Z4putcc>
    putc('i');
    80001920:	06900513          	li	a0,105
    80001924:	00000097          	auipc	ra,0x0
    80001928:	cb8080e7          	jalr	-840(ra) # 800015dc <_Z4putcc>
    putc('o');
    8000192c:	06f00513          	li	a0,111
    80001930:	00000097          	auipc	ra,0x0
    80001934:	cac080e7          	jalr	-852(ra) # 800015dc <_Z4putcc>
    putc('n');
    80001938:	06e00513          	li	a0,110
    8000193c:	00000097          	auipc	ra,0x0
    80001940:	ca0080e7          	jalr	-864(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001944:	02000513          	li	a0,32
    80001948:	00000097          	auipc	ra,0x0
    8000194c:	c94080e7          	jalr	-876(ra) # 800015dc <_Z4putcc>
    putc('\'');
    80001950:	02700513          	li	a0,39
    80001954:	00000097          	auipc	ra,0x0
    80001958:	c88080e7          	jalr	-888(ra) # 800015dc <_Z4putcc>
    while(*__assertion != 0){
    8000195c:	0009c503          	lbu	a0,0(s3)
    80001960:	00050a63          	beqz	a0,80001974 <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    80001964:	00000097          	auipc	ra,0x0
    80001968:	c78080e7          	jalr	-904(ra) # 800015dc <_Z4putcc>
        __assertion++;
    8000196c:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    80001970:	fedff06f          	j	8000195c <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    80001974:	02700513          	li	a0,39
    80001978:	00000097          	auipc	ra,0x0
    8000197c:	c64080e7          	jalr	-924(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001980:	02000513          	li	a0,32
    80001984:	00000097          	auipc	ra,0x0
    80001988:	c58080e7          	jalr	-936(ra) # 800015dc <_Z4putcc>
    putc('f');
    8000198c:	06600513          	li	a0,102
    80001990:	00000097          	auipc	ra,0x0
    80001994:	c4c080e7          	jalr	-948(ra) # 800015dc <_Z4putcc>
    putc('a');
    80001998:	06100513          	li	a0,97
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	c40080e7          	jalr	-960(ra) # 800015dc <_Z4putcc>
    putc('i');
    800019a4:	06900513          	li	a0,105
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	c34080e7          	jalr	-972(ra) # 800015dc <_Z4putcc>
    putc('l');
    800019b0:	06c00513          	li	a0,108
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	c28080e7          	jalr	-984(ra) # 800015dc <_Z4putcc>
    putc('e');
    800019bc:	06500513          	li	a0,101
    800019c0:	00000097          	auipc	ra,0x0
    800019c4:	c1c080e7          	jalr	-996(ra) # 800015dc <_Z4putcc>
    putc('d');
    800019c8:	06400513          	li	a0,100
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	c10080e7          	jalr	-1008(ra) # 800015dc <_Z4putcc>
    putc(' ');
    800019d4:	02000513          	li	a0,32
    800019d8:	00000097          	auipc	ra,0x0
    800019dc:	c04080e7          	jalr	-1020(ra) # 800015dc <_Z4putcc>
    putc('i');
    800019e0:	06900513          	li	a0,105
    800019e4:	00000097          	auipc	ra,0x0
    800019e8:	bf8080e7          	jalr	-1032(ra) # 800015dc <_Z4putcc>
    putc('n');
    800019ec:	06e00513          	li	a0,110
    800019f0:	00000097          	auipc	ra,0x0
    800019f4:	bec080e7          	jalr	-1044(ra) # 800015dc <_Z4putcc>
    putc(' ');
    800019f8:	02000513          	li	a0,32
    800019fc:	00000097          	auipc	ra,0x0
    80001a00:	be0080e7          	jalr	-1056(ra) # 800015dc <_Z4putcc>
    putc('f');
    80001a04:	06600513          	li	a0,102
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	bd4080e7          	jalr	-1068(ra) # 800015dc <_Z4putcc>
    putc('i');
    80001a10:	06900513          	li	a0,105
    80001a14:	00000097          	auipc	ra,0x0
    80001a18:	bc8080e7          	jalr	-1080(ra) # 800015dc <_Z4putcc>
    putc('l');
    80001a1c:	06c00513          	li	a0,108
    80001a20:	00000097          	auipc	ra,0x0
    80001a24:	bbc080e7          	jalr	-1092(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001a28:	06500513          	li	a0,101
    80001a2c:	00000097          	auipc	ra,0x0
    80001a30:	bb0080e7          	jalr	-1104(ra) # 800015dc <_Z4putcc>
    putc(':');
    80001a34:	03a00513          	li	a0,58
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	ba4080e7          	jalr	-1116(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001a40:	02000513          	li	a0,32
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	b98080e7          	jalr	-1128(ra) # 800015dc <_Z4putcc>
    while(*__file != 0){
    80001a4c:	0004c503          	lbu	a0,0(s1)
    80001a50:	00050a63          	beqz	a0,80001a64 <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    80001a54:	00000097          	auipc	ra,0x0
    80001a58:	b88080e7          	jalr	-1144(ra) # 800015dc <_Z4putcc>
        __file++;
    80001a5c:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80001a60:	fedff06f          	j	80001a4c <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    80001a64:	00a00513          	li	a0,10
    80001a68:	00000097          	auipc	ra,0x0
    80001a6c:	b74080e7          	jalr	-1164(ra) # 800015dc <_Z4putcc>
    putc('l');
    80001a70:	06c00513          	li	a0,108
    80001a74:	00000097          	auipc	ra,0x0
    80001a78:	b68080e7          	jalr	-1176(ra) # 800015dc <_Z4putcc>
    putc('i');
    80001a7c:	06900513          	li	a0,105
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	b5c080e7          	jalr	-1188(ra) # 800015dc <_Z4putcc>
    putc('n');
    80001a88:	06e00513          	li	a0,110
    80001a8c:	00000097          	auipc	ra,0x0
    80001a90:	b50080e7          	jalr	-1200(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001a94:	06500513          	li	a0,101
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	b44080e7          	jalr	-1212(ra) # 800015dc <_Z4putcc>
    putc(':');
    80001aa0:	03a00513          	li	a0,58
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	b38080e7          	jalr	-1224(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001aac:	02000513          	li	a0,32
    80001ab0:	00000097          	auipc	ra,0x0
    80001ab4:	b2c080e7          	jalr	-1236(ra) # 800015dc <_Z4putcc>
    char buffer[20];
    int i = 0;
    80001ab8:	00000493          	li	s1,0
    while(__line != 0){
    80001abc:	02090463          	beqz	s2,80001ae4 <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80001ac0:	00a00713          	li	a4,10
    80001ac4:	02e977bb          	remuw	a5,s2,a4
    80001ac8:	0307879b          	addiw	a5,a5,48
    80001acc:	fd040693          	addi	a3,s0,-48
    80001ad0:	009686b3          	add	a3,a3,s1
    80001ad4:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    80001ad8:	02e9593b          	divuw	s2,s2,a4
        i++;
    80001adc:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    80001ae0:	fddff06f          	j	80001abc <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    80001ae4:	02048063          	beqz	s1,80001b04 <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    80001ae8:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80001aec:	fd040793          	addi	a5,s0,-48
    80001af0:	009787b3          	add	a5,a5,s1
    80001af4:	fe87c503          	lbu	a0,-24(a5)
    80001af8:	00000097          	auipc	ra,0x0
    80001afc:	ae4080e7          	jalr	-1308(ra) # 800015dc <_Z4putcc>
    80001b00:	fe5ff06f          	j	80001ae4 <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80001b04:	00a00513          	li	a0,10
    80001b08:	00000097          	auipc	ra,0x0
    80001b0c:	ad4080e7          	jalr	-1324(ra) # 800015dc <_Z4putcc>
    putc('f');
    80001b10:	06600513          	li	a0,102
    80001b14:	00000097          	auipc	ra,0x0
    80001b18:	ac8080e7          	jalr	-1336(ra) # 800015dc <_Z4putcc>
    putc('u');
    80001b1c:	07500513          	li	a0,117
    80001b20:	00000097          	auipc	ra,0x0
    80001b24:	abc080e7          	jalr	-1348(ra) # 800015dc <_Z4putcc>
    putc('n');
    80001b28:	06e00513          	li	a0,110
    80001b2c:	00000097          	auipc	ra,0x0
    80001b30:	ab0080e7          	jalr	-1360(ra) # 800015dc <_Z4putcc>
    putc('c');
    80001b34:	06300513          	li	a0,99
    80001b38:	00000097          	auipc	ra,0x0
    80001b3c:	aa4080e7          	jalr	-1372(ra) # 800015dc <_Z4putcc>
    putc('t');
    80001b40:	07400513          	li	a0,116
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	a98080e7          	jalr	-1384(ra) # 800015dc <_Z4putcc>
    putc('i');
    80001b4c:	06900513          	li	a0,105
    80001b50:	00000097          	auipc	ra,0x0
    80001b54:	a8c080e7          	jalr	-1396(ra) # 800015dc <_Z4putcc>
    putc('o');
    80001b58:	06f00513          	li	a0,111
    80001b5c:	00000097          	auipc	ra,0x0
    80001b60:	a80080e7          	jalr	-1408(ra) # 800015dc <_Z4putcc>
    putc('n');
    80001b64:	06e00513          	li	a0,110
    80001b68:	00000097          	auipc	ra,0x0
    80001b6c:	a74080e7          	jalr	-1420(ra) # 800015dc <_Z4putcc>
    putc(':');
    80001b70:	03a00513          	li	a0,58
    80001b74:	00000097          	auipc	ra,0x0
    80001b78:	a68080e7          	jalr	-1432(ra) # 800015dc <_Z4putcc>
    putc(' ');
    80001b7c:	02000513          	li	a0,32
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	a5c080e7          	jalr	-1444(ra) # 800015dc <_Z4putcc>
    putc('\'');
    80001b88:	02700513          	li	a0,39
    80001b8c:	00000097          	auipc	ra,0x0
    80001b90:	a50080e7          	jalr	-1456(ra) # 800015dc <_Z4putcc>
    while(*__function != 0){
    80001b94:	000a4503          	lbu	a0,0(s4)
    80001b98:	00050a63          	beqz	a0,80001bac <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    80001b9c:	00000097          	auipc	ra,0x0
    80001ba0:	a40080e7          	jalr	-1472(ra) # 800015dc <_Z4putcc>
        __function ++;
    80001ba4:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80001ba8:	fedff06f          	j	80001b94 <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    80001bac:	02700513          	li	a0,39
    80001bb0:	00000097          	auipc	ra,0x0
    80001bb4:	a2c080e7          	jalr	-1492(ra) # 800015dc <_Z4putcc>
    putc('\n');
    80001bb8:	00a00513          	li	a0,10
    80001bbc:	00000097          	auipc	ra,0x0
    80001bc0:	a20080e7          	jalr	-1504(ra) # 800015dc <_Z4putcc>
    while(1);
    80001bc4:	0000006f          	j	80001bc4 <_Z13assert_failedPKcS0_jS0_+0x328>

0000000080001bc8 <_ZN6KernelC1Ev>:

#include "console.h"

extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80001bc8:	fe010113          	addi	sp,sp,-32
    80001bcc:	00113c23          	sd	ra,24(sp)
    80001bd0:	00813823          	sd	s0,16(sp)
    80001bd4:	00913423          	sd	s1,8(sp)
    80001bd8:	01213023          	sd	s2,0(sp)
    80001bdc:	02010413          	addi	s0,sp,32
    80001be0:	00050493          	mv	s1,a0
    80001be4:	00001097          	auipc	ra,0x1
    80001be8:	eec080e7          	jalr	-276(ra) # 80002ad0 <_ZN11HeapManagerC1Ev>
    80001bec:	00848513          	addi	a0,s1,8
    80001bf0:	00002097          	auipc	ra,0x2
    80001bf4:	eac080e7          	jalr	-340(ra) # 80003a9c <_ZN9SchedulerC1Ev>
    80001bf8:	01848513          	addi	a0,s1,24
    80001bfc:	fffff097          	auipc	ra,0xfffff
    80001c00:	504080e7          	jalr	1284(ra) # 80001100 <_ZN5TimerC1Ev>
    80001c04:	0200006f          	j	80001c24 <_ZN6KernelC1Ev+0x5c>
    80001c08:	00050913          	mv	s2,a0
    80001c0c:	00048513          	mv	a0,s1
    80001c10:	00001097          	auipc	ra,0x1
    80001c14:	f28080e7          	jalr	-216(ra) # 80002b38 <_ZN11HeapManagerD1Ev>
    80001c18:	00090513          	mv	a0,s2
    80001c1c:	00007097          	auipc	ra,0x7
    80001c20:	63c080e7          	jalr	1596(ra) # 80009258 <_Unwind_Resume>
    80001c24:	01813083          	ld	ra,24(sp)
    80001c28:	01013403          	ld	s0,16(sp)
    80001c2c:	00813483          	ld	s1,8(sp)
    80001c30:	00013903          	ld	s2,0(sp)
    80001c34:	02010113          	addi	sp,sp,32
    80001c38:	00008067          	ret

0000000080001c3c <_ZN6Kernel10initialiseEv>:
 
void Kernel::initialise(){
    80001c3c:	ff010113          	addi	sp,sp,-16
    80001c40:	00113423          	sd	ra,8(sp)
    80001c44:	00813023          	sd	s0,0(sp)
    80001c48:	01010413          	addi	s0,sp,16
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80001c4c:	00006797          	auipc	a5,0x6
    80001c50:	4847b783          	ld	a5,1156(a5) # 800080d0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c54:	10579073          	csrw	stvec,a5

    
    /// initialise the heap manager
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );
    80001c58:	00006797          	auipc	a5,0x6
    80001c5c:	4807b783          	ld	a5,1152(a5) # 800080d8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001c60:	0007b603          	ld	a2,0(a5)
    80001c64:	00006797          	auipc	a5,0x6
    80001c68:	44c7b783          	ld	a5,1100(a5) # 800080b0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001c6c:	0007b583          	ld	a1,0(a5)
    80001c70:	00001097          	auipc	ra,0x1
    80001c74:	ee0080e7          	jalr	-288(ra) # 80002b50 <_ZN11HeapManager4initEmm>

    return;
}
    80001c78:	00813083          	ld	ra,8(sp)
    80001c7c:	00013403          	ld	s0,0(sp)
    80001c80:	01010113          	addi	sp,sp,16
    80001c84:	00008067          	ret

0000000080001c88 <_Z8testFuncPv>:

// sem_t sem = 0;

void testFunc(void* arg){
    80001c88:	ff010113          	addi	sp,sp,-16
    80001c8c:	00113423          	sd	ra,8(sp)
    80001c90:	00813023          	sd	s0,0(sp)
    80001c94:	01010413          	addi	s0,sp,16
    putc('t');
    80001c98:	07400513          	li	a0,116
    80001c9c:	00000097          	auipc	ra,0x0
    80001ca0:	940080e7          	jalr	-1728(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001ca4:	06500513          	li	a0,101
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	934080e7          	jalr	-1740(ra) # 800015dc <_Z4putcc>
    putc('s');
    80001cb0:	07300513          	li	a0,115
    80001cb4:	00000097          	auipc	ra,0x0
    80001cb8:	928080e7          	jalr	-1752(ra) # 800015dc <_Z4putcc>
    putc('t');
    80001cbc:	07400513          	li	a0,116
    80001cc0:	00000097          	auipc	ra,0x0
    80001cc4:	91c080e7          	jalr	-1764(ra) # 800015dc <_Z4putcc>

    // sem_wait(sem);
    // thread_dispatch();
    // thread_dispatch();
    thread_dispatch();
    80001cc8:	fffff097          	auipc	ra,0xfffff
    80001ccc:	7c0080e7          	jalr	1984(ra) # 80001488 <_Z15thread_dispatchv>

    // time_sleep(10);
    putc(' ');
    80001cd0:	02000513          	li	a0,32
    80001cd4:	00000097          	auipc	ra,0x0
    80001cd8:	908080e7          	jalr	-1784(ra) # 800015dc <_Z4putcc>

    putc('t');
    80001cdc:	07400513          	li	a0,116
    80001ce0:	00000097          	auipc	ra,0x0
    80001ce4:	8fc080e7          	jalr	-1796(ra) # 800015dc <_Z4putcc>
    putc('h');
    80001ce8:	06800513          	li	a0,104
    80001cec:	00000097          	auipc	ra,0x0
    80001cf0:	8f0080e7          	jalr	-1808(ra) # 800015dc <_Z4putcc>
    putc('r');
    80001cf4:	07200513          	li	a0,114
    80001cf8:	00000097          	auipc	ra,0x0
    80001cfc:	8e4080e7          	jalr	-1820(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001d00:	06500513          	li	a0,101
    80001d04:	00000097          	auipc	ra,0x0
    80001d08:	8d8080e7          	jalr	-1832(ra) # 800015dc <_Z4putcc>
    putc('a');
    80001d0c:	06100513          	li	a0,97
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	8cc080e7          	jalr	-1844(ra) # 800015dc <_Z4putcc>
    putc('d');
    80001d18:	06400513          	li	a0,100
    80001d1c:	00000097          	auipc	ra,0x0
    80001d20:	8c0080e7          	jalr	-1856(ra) # 800015dc <_Z4putcc>
    putc('\n');
    80001d24:	00a00513          	li	a0,10
    80001d28:	00000097          	auipc	ra,0x0
    80001d2c:	8b4080e7          	jalr	-1868(ra) # 800015dc <_Z4putcc>
}
    80001d30:	00813083          	ld	ra,8(sp)
    80001d34:	00013403          	ld	s0,0(sp)
    80001d38:	01010113          	addi	sp,sp,16
    80001d3c:	00008067          	ret

0000000080001d40 <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    80001d40:	fe010113          	addi	sp,sp,-32
    80001d44:	00113c23          	sd	ra,24(sp)
    80001d48:	00813823          	sd	s0,16(sp)
    80001d4c:	02010413          	addi	s0,sp,32

    thread_t t, test;
    
    thread_create(&t, 0, 0);
    80001d50:	00000613          	li	a2,0
    80001d54:	00000593          	li	a1,0
    80001d58:	fe840513          	addi	a0,s0,-24
    80001d5c:	fffff097          	auipc	ra,0xfffff
    80001d60:	690080e7          	jalr	1680(ra) # 800013ec <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80001d64:	00002097          	auipc	ra,0x2
    80001d68:	fc0080e7          	jalr	-64(ra) # 80003d24 <_ZN9Scheduler3getEv>
    80001d6c:	00006797          	auipc	a5,0x6
    80001d70:	3747b783          	ld	a5,884(a5) # 800080e0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001d74:	00a7b023          	sd	a0,0(a5)
    
    /// change to user mode
    __asm__ volatile ("li a0, 0xff");
    80001d78:	0ff00513          	li	a0,255
    __asm__ volatile ("ecall");
    80001d7c:	00000073          	ecall
    
    putc('u');
    80001d80:	07500513          	li	a0,117
    80001d84:	00000097          	auipc	ra,0x0
    80001d88:	858080e7          	jalr	-1960(ra) # 800015dc <_Z4putcc>
    putc('s');
    80001d8c:	07300513          	li	a0,115
    80001d90:	00000097          	auipc	ra,0x0
    80001d94:	84c080e7          	jalr	-1972(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001d98:	06500513          	li	a0,101
    80001d9c:	00000097          	auipc	ra,0x0
    80001da0:	840080e7          	jalr	-1984(ra) # 800015dc <_Z4putcc>
    putc('r');
    80001da4:	07200513          	li	a0,114
    80001da8:	00000097          	auipc	ra,0x0
    80001dac:	834080e7          	jalr	-1996(ra) # 800015dc <_Z4putcc>
    putc('\n');
    80001db0:	00a00513          	li	a0,10
    80001db4:	00000097          	auipc	ra,0x0
    80001db8:	828080e7          	jalr	-2008(ra) # 800015dc <_Z4putcc>

    
    /// NOW WE ARE IN USER MODE
    
    
    thread_create(&test, usermain, 0);
    80001dbc:	00000613          	li	a2,0
    80001dc0:	00006597          	auipc	a1,0x6
    80001dc4:	2f85b583          	ld	a1,760(a1) # 800080b8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001dc8:	fe040513          	addi	a0,s0,-32
    80001dcc:	fffff097          	auipc	ra,0xfffff
    80001dd0:	620080e7          	jalr	1568(ra) # 800013ec <_Z13thread_createPP7_threadPFvPvES2_>
    putc('k');
    80001dd4:	06b00513          	li	a0,107
    80001dd8:	00000097          	auipc	ra,0x0
    80001ddc:	804080e7          	jalr	-2044(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001de0:	06500513          	li	a0,101
    80001de4:	fffff097          	auipc	ra,0xfffff
    80001de8:	7f8080e7          	jalr	2040(ra) # 800015dc <_Z4putcc>
    putc('r');
    80001dec:	07200513          	li	a0,114
    80001df0:	fffff097          	auipc	ra,0xfffff
    80001df4:	7ec080e7          	jalr	2028(ra) # 800015dc <_Z4putcc>
    putc('n');
    80001df8:	06e00513          	li	a0,110
    80001dfc:	fffff097          	auipc	ra,0xfffff
    80001e00:	7e0080e7          	jalr	2016(ra) # 800015dc <_Z4putcc>
    putc('e');
    80001e04:	06500513          	li	a0,101
    80001e08:	fffff097          	auipc	ra,0xfffff
    80001e0c:	7d4080e7          	jalr	2004(ra) # 800015dc <_Z4putcc>
    putc('l');
    80001e10:	06c00513          	li	a0,108
    80001e14:	fffff097          	auipc	ra,0xfffff
    80001e18:	7c8080e7          	jalr	1992(ra) # 800015dc <_Z4putcc>
    putc('\n');
    80001e1c:	00a00513          	li	a0,10
    80001e20:	fffff097          	auipc	ra,0xfffff
    80001e24:	7bc080e7          	jalr	1980(ra) # 800015dc <_Z4putcc>
    do{
        thread_dispatch();
    80001e28:	fffff097          	auipc	ra,0xfffff
    80001e2c:	660080e7          	jalr	1632(ra) # 80001488 <_Z15thread_dispatchv>
    80001e30:	ff9ff06f          	j	80001e28 <_ZN6Kernel3runEv+0xe8>

0000000080001e34 <_ZN15MemoryAllocator9mem_allocEm>:
#include "memoryAllocator.h"

void *MemoryAllocator::mem_alloc( size_t size ){
    80001e34:	ff010113          	addi	sp,sp,-16
    80001e38:	00813423          	sd	s0,8(sp)
    80001e3c:	01010413          	addi	s0,sp,16
    80001e40:	00050713          	mv	a4,a0
    static bool headInitialised = false;
    if(!headInitialised){
    80001e44:	00006797          	auipc	a5,0x6
    80001e48:	2f47c783          	lbu	a5,756(a5) # 80008138 <_ZZN15MemoryAllocator9mem_allocEmE15headInitialised>
    80001e4c:	04079863          	bnez	a5,80001e9c <_ZN15MemoryAllocator9mem_allocEm+0x68>
        headInitialised = true;
    80001e50:	00100793          	li	a5,1
    80001e54:	00006697          	auipc	a3,0x6
    80001e58:	2ef68223          	sb	a5,740(a3) # 80008138 <_ZZN15MemoryAllocator9mem_allocEmE15headInitialised>
        head = (FreeMemorySegment*)((uint64)HEAP_START_ADDR);
    80001e5c:	00006697          	auipc	a3,0x6
    80001e60:	2546b683          	ld	a3,596(a3) # 800080b0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001e64:	0006b783          	ld	a5,0(a3)
    80001e68:	00f53023          	sd	a5,0(a0)
        head->prevSegment = nullptr;
    80001e6c:	0007b023          	sd	zero,0(a5)
        head->nextSegment = nullptr;
    80001e70:	00053783          	ld	a5,0(a0)
    80001e74:	0007b423          	sd	zero,8(a5)
        head->segmentSize = ((size_t)( (uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR ) - sizeof(MemoryAllocator) ) / MEM_BLOCK_SIZE;
    80001e78:	00006797          	auipc	a5,0x6
    80001e7c:	2607b783          	ld	a5,608(a5) # 800080d8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001e80:	0007b783          	ld	a5,0(a5)
    80001e84:	0006b683          	ld	a3,0(a3)
    80001e88:	40d787b3          	sub	a5,a5,a3
    80001e8c:	ff878793          	addi	a5,a5,-8
    80001e90:	00053683          	ld	a3,0(a0)
    80001e94:	0067d793          	srli	a5,a5,0x6
    80001e98:	00f6b823          	sd	a5,16(a3)
    }
    FreeMemorySegment* freeSegment = head;
    80001e9c:	00073503          	ld	a0,0(a4)
    while(freeSegment != nullptr && freeSegment->segmentSize < size)freeSegment = freeSegment->nextSegment;
    80001ea0:	00050a63          	beqz	a0,80001eb4 <_ZN15MemoryAllocator9mem_allocEm+0x80>
    80001ea4:	01053783          	ld	a5,16(a0)
    80001ea8:	00b7f663          	bgeu	a5,a1,80001eb4 <_ZN15MemoryAllocator9mem_allocEm+0x80>
    80001eac:	00853503          	ld	a0,8(a0)
    80001eb0:	ff1ff06f          	j	80001ea0 <_ZN15MemoryAllocator9mem_allocEm+0x6c>
    if(freeSegment == nullptr || freeSegment->segmentSize < size)return nullptr;
    80001eb4:	04050a63          	beqz	a0,80001f08 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    80001eb8:	01053683          	ld	a3,16(a0)
    80001ebc:	08b6ea63          	bltu	a3,a1,80001f50 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
    if(freeSegment->segmentSize == size){
    80001ec0:	04b68a63          	beq	a3,a1,80001f14 <_ZN15MemoryAllocator9mem_allocEm+0xe0>
        if(freeSegment->prevSegment) freeSegment->prevSegment->nextSegment = freeSegment->nextSegment;
        else head = freeSegment->nextSegment;
        if(freeSegment->nextSegment != nullptr) freeSegment->nextSegment->prevSegment = freeSegment->prevSegment;
        return (void*)((uint64)freeSegment + MEM_BLOCK_SIZE);
    }
    FreeMemorySegment* newSegment = (FreeMemorySegment*)((uint64)freeSegment + size * MEM_BLOCK_SIZE + MEM_BLOCK_SIZE);
    80001ec4:	00659793          	slli	a5,a1,0x6
    80001ec8:	00050813          	mv	a6,a0
    80001ecc:	00a787b3          	add	a5,a5,a0
    80001ed0:	04078613          	addi	a2,a5,64
    newSegment->segmentSize = freeSegment->segmentSize - size;
    80001ed4:	40b686b3          	sub	a3,a3,a1
    80001ed8:	00d63823          	sd	a3,16(a2)
    newSegment->prevSegment = freeSegment->prevSegment;
    80001edc:	00053683          	ld	a3,0(a0)
    80001ee0:	04d7b023          	sd	a3,64(a5)
    newSegment->nextSegment = freeSegment->nextSegment;
    80001ee4:	00853683          	ld	a3,8(a0)
    80001ee8:	00d63423          	sd	a3,8(a2)
    
    if(newSegment->nextSegment != nullptr) newSegment->nextSegment->prevSegment = newSegment;
    80001eec:	00068463          	beqz	a3,80001ef4 <_ZN15MemoryAllocator9mem_allocEm+0xc0>
    80001ef0:	00c6b023          	sd	a2,0(a3)
    if(newSegment->prevSegment != nullptr) newSegment->prevSegment->nextSegment = newSegment;
    80001ef4:	0407b783          	ld	a5,64(a5)
    80001ef8:	04078863          	beqz	a5,80001f48 <_ZN15MemoryAllocator9mem_allocEm+0x114>
    80001efc:	00c7b423          	sd	a2,8(a5)
    else head = newSegment;
    freeSegment->segmentSize = size;
    80001f00:	00b53823          	sd	a1,16(a0)
    return (void*)((uint64)freeSegment + MEM_BLOCK_SIZE);
    80001f04:	04080513          	addi	a0,a6,64
}
    80001f08:	00813403          	ld	s0,8(sp)
    80001f0c:	01010113          	addi	sp,sp,16
    80001f10:	00008067          	ret
        if(freeSegment->prevSegment) freeSegment->prevSegment->nextSegment = freeSegment->nextSegment;
    80001f14:	00053783          	ld	a5,0(a0)
    80001f18:	02078263          	beqz	a5,80001f3c <_ZN15MemoryAllocator9mem_allocEm+0x108>
    80001f1c:	00853703          	ld	a4,8(a0)
    80001f20:	00e7b423          	sd	a4,8(a5)
        if(freeSegment->nextSegment != nullptr) freeSegment->nextSegment->prevSegment = freeSegment->prevSegment;
    80001f24:	00853783          	ld	a5,8(a0)
    80001f28:	00078663          	beqz	a5,80001f34 <_ZN15MemoryAllocator9mem_allocEm+0x100>
    80001f2c:	00053703          	ld	a4,0(a0)
    80001f30:	00e7b023          	sd	a4,0(a5)
        return (void*)((uint64)freeSegment + MEM_BLOCK_SIZE);
    80001f34:	04050513          	addi	a0,a0,64
    80001f38:	fd1ff06f          	j	80001f08 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
        else head = freeSegment->nextSegment;
    80001f3c:	00853783          	ld	a5,8(a0)
    80001f40:	00f73023          	sd	a5,0(a4)
    80001f44:	fe1ff06f          	j	80001f24 <_ZN15MemoryAllocator9mem_allocEm+0xf0>
    else head = newSegment;
    80001f48:	00c73023          	sd	a2,0(a4)
    80001f4c:	fb5ff06f          	j	80001f00 <_ZN15MemoryAllocator9mem_allocEm+0xcc>
    if(freeSegment == nullptr || freeSegment->segmentSize < size)return nullptr;
    80001f50:	00000513          	li	a0,0
    80001f54:	fb5ff06f          	j	80001f08 <_ZN15MemoryAllocator9mem_allocEm+0xd4>

0000000080001f58 <_ZN15MemoryAllocator11getInstanceEv>:

MemoryAllocator& MemoryAllocator::getInstance() {
    80001f58:	ff010113          	addi	sp,sp,-16
    80001f5c:	00813423          	sd	s0,8(sp)
    80001f60:	01010413          	addi	s0,sp,16
    static MemoryAllocator instance;
    80001f64:	00006797          	auipc	a5,0x6
    80001f68:	1dc7c783          	lbu	a5,476(a5) # 80008140 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    80001f6c:	00079c63          	bnez	a5,80001f84 <_ZN15MemoryAllocator11getInstanceEv+0x2c>
};
class MemoryAllocator {
public:
    static MemoryAllocator& getInstance();
private:
    MemoryAllocator(){};
    80001f70:	00006797          	auipc	a5,0x6
    80001f74:	1c878793          	addi	a5,a5,456 # 80008138 <_ZZN15MemoryAllocator9mem_allocEmE15headInitialised>
    80001f78:	0007b823          	sd	zero,16(a5)
    80001f7c:	00100713          	li	a4,1
    80001f80:	00e78423          	sb	a4,8(a5)
    return instance;
}
    80001f84:	00006517          	auipc	a0,0x6
    80001f88:	1c450513          	addi	a0,a0,452 # 80008148 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80001f8c:	00813403          	ld	s0,8(sp)
    80001f90:	01010113          	addi	sp,sp,16
    80001f94:	00008067          	ret

0000000080001f98 <_ZN15MemoryAllocator12attemptMergeEP17FreeMemorySegment>:

void MemoryAllocator::attemptMerge( FreeMemorySegment *segment ) {
    80001f98:	ff010113          	addi	sp,sp,-16
    80001f9c:	00813423          	sd	s0,8(sp)
    80001fa0:	01010413          	addi	s0,sp,16
    if((uint64)segment->nextSegment != (uint64)segment + (segment->segmentSize + 1)*MEM_BLOCK_SIZE)
    80001fa4:	0085b683          	ld	a3,8(a1)
    80001fa8:	0105b703          	ld	a4,16(a1)
    80001fac:	00170793          	addi	a5,a4,1
    80001fb0:	00679793          	slli	a5,a5,0x6
    80001fb4:	00f587b3          	add	a5,a1,a5
    80001fb8:	02f69063          	bne	a3,a5,80001fd8 <_ZN15MemoryAllocator12attemptMergeEP17FreeMemorySegment+0x40>
        return;
    segment->segmentSize += segment->nextSegment->segmentSize;
    80001fbc:	0106b783          	ld	a5,16(a3)
    80001fc0:	00f70733          	add	a4,a4,a5
    80001fc4:	00e5b823          	sd	a4,16(a1)
    segment->nextSegment = segment->nextSegment->nextSegment;
    80001fc8:	0086b783          	ld	a5,8(a3)
    80001fcc:	00f5b423          	sd	a5,8(a1)
    if(segment->nextSegment) segment->nextSegment->prevSegment = segment;
    80001fd0:	00078463          	beqz	a5,80001fd8 <_ZN15MemoryAllocator12attemptMergeEP17FreeMemorySegment+0x40>
    80001fd4:	00b7b023          	sd	a1,0(a5)
}
    80001fd8:	00813403          	ld	s0,8(sp)
    80001fdc:	01010113          	addi	sp,sp,16
    80001fe0:	00008067          	ret

0000000080001fe4 <_ZN15MemoryAllocator16numberOfSegmentsEv>:

int MemoryAllocator::numberOfSegments(){
    80001fe4:	ff010113          	addi	sp,sp,-16
    80001fe8:	00813423          	sd	s0,8(sp)
    80001fec:	01010413          	addi	s0,sp,16
    int count = 0;
    FreeMemorySegment *segment = head;
    80001ff0:	00053783          	ld	a5,0(a0)
    int count = 0;
    80001ff4:	00000513          	li	a0,0
    while(segment){
    80001ff8:	00078863          	beqz	a5,80002008 <_ZN15MemoryAllocator16numberOfSegmentsEv+0x24>
        count ++;
    80001ffc:	0015051b          	addiw	a0,a0,1
        segment = segment->nextSegment;
    80002000:	0087b783          	ld	a5,8(a5)
    while(segment){
    80002004:	ff5ff06f          	j	80001ff8 <_ZN15MemoryAllocator16numberOfSegmentsEv+0x14>
    }
    return count;
}
    80002008:	00813403          	ld	s0,8(sp)
    8000200c:	01010113          	addi	sp,sp,16
    80002010:	00008067          	ret

0000000080002014 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free( void *address ) {
    if((uint64)address >= (uint64)HEAP_END_ADDR || (uint64)address < (uint64)HEAP_START_ADDR)
    80002014:	00006797          	auipc	a5,0x6
    80002018:	0c47b783          	ld	a5,196(a5) # 800080d8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000201c:	0007b783          	ld	a5,0(a5)
    80002020:	0cf5fa63          	bgeu	a1,a5,800020f4 <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
int MemoryAllocator::mem_free( void *address ) {
    80002024:	fe010113          	addi	sp,sp,-32
    80002028:	00113c23          	sd	ra,24(sp)
    8000202c:	00813823          	sd	s0,16(sp)
    80002030:	00913423          	sd	s1,8(sp)
    80002034:	01213023          	sd	s2,0(sp)
    80002038:	02010413          	addi	s0,sp,32
    8000203c:	00050493          	mv	s1,a0
    80002040:	00058713          	mv	a4,a1
    if((uint64)address >= (uint64)HEAP_END_ADDR || (uint64)address < (uint64)HEAP_START_ADDR)
    80002044:	00006797          	auipc	a5,0x6
    80002048:	06c7b783          	ld	a5,108(a5) # 800080b0 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000204c:	0007b783          	ld	a5,0(a5)
    80002050:	0af5e663          	bltu	a1,a5,800020fc <_ZN15MemoryAllocator8mem_freeEPv+0xe8>
        return -1;
    FreeMemorySegment* previousSegment = nullptr;
    if(head && head->nextSegment < address){
    80002054:	00053783          	ld	a5,0(a0)
    80002058:	02078063          	beqz	a5,80002078 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
    8000205c:	0087b683          	ld	a3,8(a5)
    80002060:	02b6f063          	bgeu	a3,a1,80002080 <_ZN15MemoryAllocator8mem_freeEPv+0x6c>
        previousSegment = head;
        while(previousSegment->nextSegment != nullptr && previousSegment->nextSegment < address)
    80002064:	00078593          	mv	a1,a5
    80002068:	0087b783          	ld	a5,8(a5)
    8000206c:	00078c63          	beqz	a5,80002084 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
    80002070:	fee7eae3          	bltu	a5,a4,80002064 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
    80002074:	0100006f          	j	80002084 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
    FreeMemorySegment* previousSegment = nullptr;
    80002078:	00078593          	mv	a1,a5
    8000207c:	0080006f          	j	80002084 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
    80002080:	00000593          	li	a1,0
            previousSegment = previousSegment->nextSegment;
    }

    FreeMemorySegment* newSegment = (FreeMemorySegment*)((uint64)address - MEM_BLOCK_SIZE);
    80002084:	fc070913          	addi	s2,a4,-64
    newSegment->prevSegment = previousSegment;
    80002088:	fcb73023          	sd	a1,-64(a4)
    if(previousSegment){
    8000208c:	04058c63          	beqz	a1,800020e4 <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
        if(previousSegment->nextSegment)
    80002090:	0085b783          	ld	a5,8(a1)
    80002094:	00078463          	beqz	a5,8000209c <_ZN15MemoryAllocator8mem_freeEPv+0x88>
            previousSegment->nextSegment->prevSegment = newSegment;
    80002098:	0127b023          	sd	s2,0(a5)
        newSegment->nextSegment = previousSegment->nextSegment;
    8000209c:	0085b783          	ld	a5,8(a1)
    800020a0:	00f93423          	sd	a5,8(s2)
        previousSegment->nextSegment = newSegment;
    800020a4:	0125b423          	sd	s2,8(a1)
    }else{
        newSegment->nextSegment = head;
        head = newSegment;
    }
    if(previousSegment)attemptMerge(previousSegment);
    800020a8:	00058863          	beqz	a1,800020b8 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    800020ac:	00048513          	mv	a0,s1
    800020b0:	00000097          	auipc	ra,0x0
    800020b4:	ee8080e7          	jalr	-280(ra) # 80001f98 <_ZN15MemoryAllocator12attemptMergeEP17FreeMemorySegment>
    attemptMerge(newSegment);
    800020b8:	00090593          	mv	a1,s2
    800020bc:	00048513          	mv	a0,s1
    800020c0:	00000097          	auipc	ra,0x0
    800020c4:	ed8080e7          	jalr	-296(ra) # 80001f98 <_ZN15MemoryAllocator12attemptMergeEP17FreeMemorySegment>
    return 0;
    800020c8:	00000513          	li	a0,0
    800020cc:	01813083          	ld	ra,24(sp)
    800020d0:	01013403          	ld	s0,16(sp)
    800020d4:	00813483          	ld	s1,8(sp)
    800020d8:	00013903          	ld	s2,0(sp)
    800020dc:	02010113          	addi	sp,sp,32
    800020e0:	00008067          	ret
        newSegment->nextSegment = head;
    800020e4:	0004b783          	ld	a5,0(s1)
    800020e8:	00f93423          	sd	a5,8(s2)
        head = newSegment;
    800020ec:	0124b023          	sd	s2,0(s1)
    800020f0:	fb9ff06f          	j	800020a8 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
        return -1;
    800020f4:	fff00513          	li	a0,-1
    800020f8:	00008067          	ret
        return -1;
    800020fc:	fff00513          	li	a0,-1
    80002100:	fcdff06f          	j	800020cc <_ZN15MemoryAllocator8mem_freeEPv+0xb8>

0000000080002104 <_Z13thread_test_1Pv>:
#include "assert.h"

sem_t sem1;
sem_t sem2;

void thread_test_1(void* args){
    80002104:	ff010113          	addi	sp,sp,-16
    80002108:	00113423          	sd	ra,8(sp)
    8000210c:	00813023          	sd	s0,0(sp)
    80002110:	01010413          	addi	s0,sp,16
    putc('1');
    80002114:	03100513          	li	a0,49
    80002118:	fffff097          	auipc	ra,0xfffff
    8000211c:	4c4080e7          	jalr	1220(ra) # 800015dc <_Z4putcc>
    putc('s');
    80002120:	07300513          	li	a0,115
    80002124:	fffff097          	auipc	ra,0xfffff
    80002128:	4b8080e7          	jalr	1208(ra) # 800015dc <_Z4putcc>
    time_sleep(30);
    8000212c:	01e00513          	li	a0,30
    80002130:	fffff097          	auipc	ra,0xfffff
    80002134:	39c080e7          	jalr	924(ra) # 800014cc <_Z10time_sleepm>
    putc('1');
    80002138:	03100513          	li	a0,49
    8000213c:	fffff097          	auipc	ra,0xfffff
    80002140:	4a0080e7          	jalr	1184(ra) # 800015dc <_Z4putcc>
    sem_signal(sem1);
    80002144:	00006517          	auipc	a0,0x6
    80002148:	00c53503          	ld	a0,12(a0) # 80008150 <sem1>
    8000214c:	fffff097          	auipc	ra,0xfffff
    80002150:	43c080e7          	jalr	1084(ra) # 80001588 <_Z10sem_signalP4_sem>
    putc('S');
    80002154:	05300513          	li	a0,83
    80002158:	fffff097          	auipc	ra,0xfffff
    8000215c:	484080e7          	jalr	1156(ra) # 800015dc <_Z4putcc>
}
    80002160:	00813083          	ld	ra,8(sp)
    80002164:	00013403          	ld	s0,0(sp)
    80002168:	01010113          	addi	sp,sp,16
    8000216c:	00008067          	ret

0000000080002170 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80002170:	ff010113          	addi	sp,sp,-16
    80002174:	00113423          	sd	ra,8(sp)
    80002178:	00813023          	sd	s0,0(sp)
    8000217c:	01010413          	addi	s0,sp,16
    putc('2');
    80002180:	03200513          	li	a0,50
    80002184:	fffff097          	auipc	ra,0xfffff
    80002188:	458080e7          	jalr	1112(ra) # 800015dc <_Z4putcc>
    putc('s');
    8000218c:	07300513          	li	a0,115
    80002190:	fffff097          	auipc	ra,0xfffff
    80002194:	44c080e7          	jalr	1100(ra) # 800015dc <_Z4putcc>
    time_sleep(100);
    80002198:	06400513          	li	a0,100
    8000219c:	fffff097          	auipc	ra,0xfffff
    800021a0:	330080e7          	jalr	816(ra) # 800014cc <_Z10time_sleepm>
    putc('2');
    800021a4:	03200513          	li	a0,50
    800021a8:	fffff097          	auipc	ra,0xfffff
    800021ac:	434080e7          	jalr	1076(ra) # 800015dc <_Z4putcc>
    putc('S');
    800021b0:	05300513          	li	a0,83
    800021b4:	fffff097          	auipc	ra,0xfffff
    800021b8:	428080e7          	jalr	1064(ra) # 800015dc <_Z4putcc>
    // while(1);
    sem_signal(sem2);
    800021bc:	00006517          	auipc	a0,0x6
    800021c0:	f9c53503          	ld	a0,-100(a0) # 80008158 <sem2>
    800021c4:	fffff097          	auipc	ra,0xfffff
    800021c8:	3c4080e7          	jalr	964(ra) # 80001588 <_Z10sem_signalP4_sem>
}
    800021cc:	00813083          	ld	ra,8(sp)
    800021d0:	00013403          	ld	s0,0(sp)
    800021d4:	01010113          	addi	sp,sp,16
    800021d8:	00008067          	ret

00000000800021dc <_Z8usermainPv>:

void usermain(void* arg){
    800021dc:	fd010113          	addi	sp,sp,-48
    800021e0:	02113423          	sd	ra,40(sp)
    800021e4:	02813023          	sd	s0,32(sp)
    800021e8:	00913c23          	sd	s1,24(sp)
    800021ec:	03010413          	addi	s0,sp,48
    putc('0');
    800021f0:	03000513          	li	a0,48
    800021f4:	fffff097          	auipc	ra,0xfffff
    800021f8:	3e8080e7          	jalr	1000(ra) # 800015dc <_Z4putcc>
    thread_t t1, t2;
    sem_open(&sem1, 0);
    800021fc:	00006497          	auipc	s1,0x6
    80002200:	f5448493          	addi	s1,s1,-172 # 80008150 <sem1>
    80002204:	00000593          	li	a1,0
    80002208:	00048513          	mv	a0,s1
    8000220c:	fffff097          	auipc	ra,0xfffff
    80002210:	2ec080e7          	jalr	748(ra) # 800014f8 <_Z8sem_openPP4_semj>
    sem_open(&sem2, 0);
    80002214:	00000593          	li	a1,0
    80002218:	00006517          	auipc	a0,0x6
    8000221c:	f4050513          	addi	a0,a0,-192 # 80008158 <sem2>
    80002220:	fffff097          	auipc	ra,0xfffff
    80002224:	2d8080e7          	jalr	728(ra) # 800014f8 <_Z8sem_openPP4_semj>
    thread_create(&t1, thread_test_1, 0);
    80002228:	00000613          	li	a2,0
    8000222c:	00000597          	auipc	a1,0x0
    80002230:	ed858593          	addi	a1,a1,-296 # 80002104 <_Z13thread_test_1Pv>
    80002234:	fd840513          	addi	a0,s0,-40
    80002238:	fffff097          	auipc	ra,0xfffff
    8000223c:	1b4080e7          	jalr	436(ra) # 800013ec <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002240:	00000613          	li	a2,0
    80002244:	00000597          	auipc	a1,0x0
    80002248:	f2c58593          	addi	a1,a1,-212 # 80002170 <_Z13thread_test_2Pv>
    8000224c:	fd040513          	addi	a0,s0,-48
    80002250:	fffff097          	auipc	ra,0xfffff
    80002254:	19c080e7          	jalr	412(ra) # 800013ec <_Z13thread_createPP7_threadPFvPvES2_>
    sem_wait(sem1);
    80002258:	0004b503          	ld	a0,0(s1)
    8000225c:	fffff097          	auipc	ra,0xfffff
    80002260:	300080e7          	jalr	768(ra) # 8000155c <_Z8sem_waitP4_sem>
    putc('3');
    80002264:	03300513          	li	a0,51
    80002268:	fffff097          	auipc	ra,0xfffff
    8000226c:	374080e7          	jalr	884(ra) # 800015dc <_Z4putcc>
    // thread_join(t2);
    // if(getc() == 'a')putc('x');
    putc('4');
    80002270:	03400513          	li	a0,52
    80002274:	fffff097          	auipc	ra,0xfffff
    80002278:	368080e7          	jalr	872(ra) # 800015dc <_Z4putcc>
    // thread_join(t1);
    // thread_dispatch();
    // thread_dispatch();
    sem_wait(sem2);
    8000227c:	0084b503          	ld	a0,8(s1)
    80002280:	fffff097          	auipc	ra,0xfffff
    80002284:	2dc080e7          	jalr	732(ra) # 8000155c <_Z8sem_waitP4_sem>
    putc('5');
    80002288:	03500513          	li	a0,53
    8000228c:	fffff097          	auipc	ra,0xfffff
    80002290:	350080e7          	jalr	848(ra) # 800015dc <_Z4putcc>
    80002294:	02813083          	ld	ra,40(sp)
    80002298:	02013403          	ld	s0,32(sp)
    8000229c:	01813483          	ld	s1,24(sp)
    800022a0:	03010113          	addi	sp,sp,48
    800022a4:	00008067          	ret

00000000800022a8 <_ZN7_threadC1EPFvPvES0_>:
#include "syscalls_c.h"
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    800022a8:	ff010113          	addi	sp,sp,-16
    800022ac:	00813423          	sd	s0,8(sp)
    800022b0:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    800022b4:	00053023          	sd	zero,0(a0)
    800022b8:	00053423          	sd	zero,8(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    800022bc:	00006717          	auipc	a4,0x6
    800022c0:	ea470713          	addi	a4,a4,-348 # 80008160 <_ZN7_thread6nextIDE>
    800022c4:	00072783          	lw	a5,0(a4)
    800022c8:	0017869b          	addiw	a3,a5,1
    800022cc:	00d72023          	sw	a3,0(a4)
    800022d0:	08f52c23          	sw	a5,152(a0)
    closed = 0;
    800022d4:	09c52783          	lw	a5,156(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    800022d8:	0015b593          	seqz	a1,a1
    800022dc:	0045959b          	slliw	a1,a1,0x4
    800022e0:	fe07f793          	andi	a5,a5,-32
    800022e4:	00b7e7b3          	or	a5,a5,a1
    800022e8:	08f52e23          	sw	a5,156(a0)
    reserved = 0;
    800022ec:	0a052783          	lw	a5,160(a0)
    800022f0:	f0000737          	lui	a4,0xf0000
    800022f4:	00e7f7b3          	and	a5,a5,a4
    800022f8:	0af52023          	sw	a5,160(a0)
    joinHead = 0;
    800022fc:	06053c23          	sd	zero,120(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    80002300:	00200793          	li	a5,2
    80002304:	08f53423          	sd	a5,136(a0)
    stackStart = 0;
    80002308:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    8000230c:	00053823          	sd	zero,16(a0)
    context.s1 = 0;
    80002310:	00053c23          	sd	zero,24(a0)
    context.s2 = 0;
    80002314:	02053023          	sd	zero,32(a0)
    context.s3 = 0;
    80002318:	02053423          	sd	zero,40(a0)
    context.s4 = 0;
    8000231c:	02053823          	sd	zero,48(a0)
    context.s5 = 0;
    80002320:	02053c23          	sd	zero,56(a0)
    context.s6 = 0;
    80002324:	04053023          	sd	zero,64(a0)
    context.s7 = 0;
    80002328:	04053423          	sd	zero,72(a0)
    context.s8 = 0;
    8000232c:	04053823          	sd	zero,80(a0)
    context.s9 = 0;
    80002330:	04053c23          	sd	zero,88(a0)
    context.s10 = 0;
    80002334:	06053023          	sd	zero,96(a0)
    context.s11 = 0;
    80002338:	06053423          	sd	zero,104(a0)

    context.sstatus = 0;
    8000233c:	06053823          	sd	zero,112(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002340:	00000797          	auipc	a5,0x0
    80002344:	55878793          	addi	a5,a5,1368 # 80002898 <_ZN7_thread7wrapperEv>
    80002348:	00f53023          	sd	a5,0(a0)
}
    8000234c:	00813403          	ld	s0,8(sp)
    80002350:	01010113          	addi	sp,sp,16
    80002354:	00008067          	ret

0000000080002358 <_Z10popSppSpieb>:

void popSppSpie(bool kernel = false){
    80002358:	ff010113          	addi	sp,sp,-16
    8000235c:	00813423          	sd	s0,8(sp)
    80002360:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002364:	14109073          	csrw	sepc,ra
    if(kernel){
    80002368:	00050e63          	beqz	a0,80002384 <_Z10popSppSpieb+0x2c>
        __asm__ volatile ("csrs sstatus, %0" :: "r" (1 << 8));
    8000236c:	10000793          	li	a5,256
    80002370:	1007a073          	csrs	sstatus,a5
    }else{
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    }
    __asm__ volatile ("sret");
    80002374:	10200073          	sret
}
    80002378:	00813403          	ld	s0,8(sp)
    8000237c:	01010113          	addi	sp,sp,16
    80002380:	00008067          	ret
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002384:	10000793          	li	a5,256
    80002388:	1007b073          	csrc	sstatus,a5
    8000238c:	fe9ff06f          	j	80002374 <_Z10popSppSpieb+0x1c>

0000000080002390 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002390:	fe010113          	addi	sp,sp,-32
    80002394:	00113c23          	sd	ra,24(sp)
    80002398:	00813823          	sd	s0,16(sp)
    8000239c:	00913423          	sd	s1,8(sp)
    800023a0:	01213023          	sd	s2,0(sp)
    800023a4:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    800023a8:	07853483          	ld	s1,120(a0)
    while(current != 0){
    800023ac:	0c048e63          	beqz	s1,80002488 <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    800023b0:	0004c503          	lbu	a0,0(s1)
    800023b4:	0014c783          	lbu	a5,1(s1)
    800023b8:	00879793          	slli	a5,a5,0x8
    800023bc:	00a7e7b3          	or	a5,a5,a0
    800023c0:	0024c503          	lbu	a0,2(s1)
    800023c4:	01051513          	slli	a0,a0,0x10
    800023c8:	00f567b3          	or	a5,a0,a5
    800023cc:	0034c503          	lbu	a0,3(s1)
    800023d0:	01851513          	slli	a0,a0,0x18
    800023d4:	00f56533          	or	a0,a0,a5
    800023d8:	0044c783          	lbu	a5,4(s1)
    800023dc:	02079793          	slli	a5,a5,0x20
    800023e0:	00a7e533          	or	a0,a5,a0
    800023e4:	0054c783          	lbu	a5,5(s1)
    800023e8:	02879793          	slli	a5,a5,0x28
    800023ec:	00a7e7b3          	or	a5,a5,a0
    800023f0:	0064c503          	lbu	a0,6(s1)
    800023f4:	03051513          	slli	a0,a0,0x30
    800023f8:	00f567b3          	or	a5,a0,a5
    800023fc:	0074c503          	lbu	a0,7(s1)
    80002400:	03851513          	slli	a0,a0,0x38
    80002404:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80002408:	09c52783          	lw	a5,156(a0)
    8000240c:	ffd7f793          	andi	a5,a5,-3
    80002410:	08f52e23          	sw	a5,156(a0)
        Scheduler::put(thread);
    80002414:	00001097          	auipc	ra,0x1
    80002418:	720080e7          	jalr	1824(ra) # 80003b34 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    8000241c:	0084c903          	lbu	s2,8(s1)
    80002420:	0094c783          	lbu	a5,9(s1)
    80002424:	00879793          	slli	a5,a5,0x8
    80002428:	0127e7b3          	or	a5,a5,s2
    8000242c:	00a4c903          	lbu	s2,10(s1)
    80002430:	01091913          	slli	s2,s2,0x10
    80002434:	00f967b3          	or	a5,s2,a5
    80002438:	00b4c903          	lbu	s2,11(s1)
    8000243c:	01891913          	slli	s2,s2,0x18
    80002440:	00f96933          	or	s2,s2,a5
    80002444:	00c4c783          	lbu	a5,12(s1)
    80002448:	02079793          	slli	a5,a5,0x20
    8000244c:	0127e933          	or	s2,a5,s2
    80002450:	00d4c783          	lbu	a5,13(s1)
    80002454:	02879793          	slli	a5,a5,0x28
    80002458:	0127e7b3          	or	a5,a5,s2
    8000245c:	00e4c903          	lbu	s2,14(s1)
    80002460:	03091913          	slli	s2,s2,0x30
    80002464:	00f967b3          	or	a5,s2,a5
    80002468:	00f4c903          	lbu	s2,15(s1)
    8000246c:	03891913          	slli	s2,s2,0x38
    80002470:	00f96933          	or	s2,s2,a5
        mem_free(current);
    80002474:	00048513          	mv	a0,s1
    80002478:	fffff097          	auipc	ra,0xfffff
    8000247c:	f48080e7          	jalr	-184(ra) # 800013c0 <_Z8mem_freePv>
        current = next;
    80002480:	00090493          	mv	s1,s2
    while(current != 0){
    80002484:	f29ff06f          	j	800023ac <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80002488:	01813083          	ld	ra,24(sp)
    8000248c:	01013403          	ld	s0,16(sp)
    80002490:	00813483          	ld	s1,8(sp)
    80002494:	00013903          	ld	s2,0(sp)
    80002498:	02010113          	addi	sp,sp,32
    8000249c:	00008067          	ret

00000000800024a0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    800024a0:	fc010113          	addi	sp,sp,-64
    800024a4:	02113c23          	sd	ra,56(sp)
    800024a8:	02813823          	sd	s0,48(sp)
    800024ac:	02913423          	sd	s1,40(sp)
    800024b0:	03213023          	sd	s2,32(sp)
    800024b4:	01313c23          	sd	s3,24(sp)
    800024b8:	01413823          	sd	s4,16(sp)
    800024bc:	01513423          	sd	s5,8(sp)
    800024c0:	04010413          	addi	s0,sp,64
    800024c4:	00050493          	mv	s1,a0
    800024c8:	00058913          	mv	s2,a1
    800024cc:	00060a93          	mv	s5,a2
    800024d0:	00068993          	mv	s3,a3
    800024d4:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    800024d8:	0b800513          	li	a0,184
    800024dc:	fffff097          	auipc	ra,0xfffff
    800024e0:	eb4080e7          	jalr	-332(ra) # 80001390 <_Z9mem_allocm>
    800024e4:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    800024e8:	18050063          	beqz	a0,80002668 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    800024ec:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    800024f0:	0004b783          	ld	a5,0(s1)
    800024f4:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    800024f8:	00006717          	auipc	a4,0x6
    800024fc:	c6870713          	addi	a4,a4,-920 # 80008160 <_ZN7_thread6nextIDE>
    80002500:	00072783          	lw	a5,0(a4)
    80002504:	0017869b          	addiw	a3,a5,1
    80002508:	00d72023          	sw	a3,0(a4)
    8000250c:	0004b703          	ld	a4,0(s1)
    80002510:	08f72c23          	sw	a5,152(a4)
    (*thread)->closed = false;
    80002514:	0004b703          	ld	a4,0(s1)
    80002518:	09c72783          	lw	a5,156(a4)
    8000251c:	ffe7f793          	andi	a5,a5,-2
    80002520:	08f72e23          	sw	a5,156(a4)
    (*thread)->blocked = false;
    80002524:	0004b703          	ld	a4,0(s1)
    80002528:	09c72783          	lw	a5,156(a4)
    8000252c:	ffd7f793          	andi	a5,a5,-3
    80002530:	08f72e23          	sw	a5,156(a4)
    (*thread)->sleeping = false;
    80002534:	0004b703          	ld	a4,0(s1)
    80002538:	09c72783          	lw	a5,156(a4)
    8000253c:	ffb7f793          	andi	a5,a5,-5
    80002540:	08f72e23          	sw	a5,156(a4)
    (*thread)->finished = false;
    80002544:	0004b703          	ld	a4,0(s1)
    80002548:	09c72783          	lw	a5,156(a4)
    8000254c:	ff77f793          	andi	a5,a5,-9
    80002550:	08f72e23          	sw	a5,156(a4)
    (*thread)->kernel = (function == 0);
    80002554:	0004b703          	ld	a4,0(s1)
    80002558:	00193913          	seqz	s2,s2
    8000255c:	0049191b          	slliw	s2,s2,0x4
    80002560:	09c72783          	lw	a5,156(a4)
    80002564:	fef7f793          	andi	a5,a5,-17
    80002568:	0127e933          	or	s2,a5,s2
    8000256c:	09272e23          	sw	s2,156(a4)
    (*thread)->reserved = 0;
    80002570:	0004b703          	ld	a4,0(s1)
    80002574:	0a072783          	lw	a5,160(a4)
    80002578:	f00006b7          	lui	a3,0xf0000
    8000257c:	00d7f7b3          	and	a5,a5,a3
    80002580:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = 0;
    80002584:	0004b783          	ld	a5,0(s1)
    80002588:	0607bc23          	sd	zero,120(a5)
    (*thread)->joinTail = 0;
    8000258c:	0004b783          	ld	a5,0(s1)
    80002590:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    80002594:	0004b783          	ld	a5,0(s1)
    80002598:	00200713          	li	a4,2
    8000259c:	08e7b423          	sd	a4,136(a5)
    (*thread)->stackStart = 0;
    800025a0:	0004b783          	ld	a5,0(s1)
    800025a4:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    800025a8:	0004b783          	ld	a5,0(s1)
    800025ac:	0007b823          	sd	zero,16(a5)
    (*thread)->context.s1 = 0;
    800025b0:	0004b783          	ld	a5,0(s1)
    800025b4:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s2 = 0;
    800025b8:	0004b783          	ld	a5,0(s1)
    800025bc:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s3 = 0;
    800025c0:	0004b783          	ld	a5,0(s1)
    800025c4:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s4 = 0;
    800025c8:	0004b783          	ld	a5,0(s1)
    800025cc:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s5 = 0;
    800025d0:	0004b783          	ld	a5,0(s1)
    800025d4:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s6 = 0;
    800025d8:	0004b783          	ld	a5,0(s1)
    800025dc:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s7 = 0;
    800025e0:	0004b783          	ld	a5,0(s1)
    800025e4:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s8 = 0;
    800025e8:	0004b783          	ld	a5,0(s1)
    800025ec:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s9 = 0;
    800025f0:	0004b783          	ld	a5,0(s1)
    800025f4:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s10 = 0;
    800025f8:	0004b783          	ld	a5,0(s1)
    800025fc:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s11 = 0;
    80002600:	0004b783          	ld	a5,0(s1)
    80002604:	0607b423          	sd	zero,104(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80002608:	0004b783          	ld	a5,0(s1)
    8000260c:	0137b423          	sd	s3,8(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80002610:	0004b783          	ld	a5,0(s1)
    80002614:	00000717          	auipc	a4,0x0
    80002618:	28470713          	addi	a4,a4,644 # 80002898 <_ZN7_thread7wrapperEv>
    8000261c:	00e7b023          	sd	a4,0(a5)

    (*thread)->stackStart = stack;
    80002620:	0004b783          	ld	a5,0(s1)
    80002624:	0937b823          	sd	s3,144(a5)
    if(start){
    80002628:	020a1663          	bnez	s4,80002654 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    8000262c:	00000513          	li	a0,0
}
    80002630:	03813083          	ld	ra,56(sp)
    80002634:	03013403          	ld	s0,48(sp)
    80002638:	02813483          	ld	s1,40(sp)
    8000263c:	02013903          	ld	s2,32(sp)
    80002640:	01813983          	ld	s3,24(sp)
    80002644:	01013a03          	ld	s4,16(sp)
    80002648:	00813a83          	ld	s5,8(sp)
    8000264c:	04010113          	addi	sp,sp,64
    80002650:	00008067          	ret
        Scheduler::put(*thread);
    80002654:	0004b503          	ld	a0,0(s1)
    80002658:	00001097          	auipc	ra,0x1
    8000265c:	4dc080e7          	jalr	1244(ra) # 80003b34 <_ZN9Scheduler3putEP7_thread>
    return 0;
    80002660:	00000513          	li	a0,0
    80002664:	fcdff06f          	j	80002630 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    80002668:	fff00513          	li	a0,-1
    8000266c:	fc5ff06f          	j	80002630 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

0000000080002670 <_ZN7_thread4joinEPS_>:

void _thread::join(thread_t thread){
    /// cannot join to a finished or closed thread
    if(thread->finished || thread->closed){
    80002670:	0985b783          	ld	a5,152(a1)
    80002674:	00900713          	li	a4,9
    80002678:	02071713          	slli	a4,a4,0x20
    8000267c:	00e7f7b3          	and	a5,a5,a4
    80002680:	00078463          	beqz	a5,80002688 <_ZN7_thread4joinEPS_+0x18>
    80002684:	00008067          	ret
void _thread::join(thread_t thread){
    80002688:	fe010113          	addi	sp,sp,-32
    8000268c:	00113c23          	sd	ra,24(sp)
    80002690:	00813823          	sd	s0,16(sp)
    80002694:	00913423          	sd	s1,8(sp)
    80002698:	01213023          	sd	s2,0(sp)
    8000269c:	02010413          	addi	s0,sp,32
    800026a0:	00050493          	mv	s1,a0
    800026a4:	00058913          	mv	s2,a1
        return;
    }
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    800026a8:	01000513          	li	a0,16
    800026ac:	fffff097          	auipc	ra,0xfffff
    800026b0:	ce4080e7          	jalr	-796(ra) # 80001390 <_Z9mem_allocm>
    this->blocked = true;
    800026b4:	09c4a703          	lw	a4,156(s1)
    800026b8:	00276713          	ori	a4,a4,2
    800026bc:	08e4ae23          	sw	a4,156(s1)
    newJoin->thread = this;
    800026c0:	00950023          	sb	s1,0(a0)
    800026c4:	0084d713          	srli	a4,s1,0x8
    800026c8:	00e500a3          	sb	a4,1(a0)
    800026cc:	0104d713          	srli	a4,s1,0x10
    800026d0:	00e50123          	sb	a4,2(a0)
    800026d4:	0184d71b          	srliw	a4,s1,0x18
    800026d8:	00e501a3          	sb	a4,3(a0)
    800026dc:	0204d713          	srli	a4,s1,0x20
    800026e0:	00e50223          	sb	a4,4(a0)
    800026e4:	0284d713          	srli	a4,s1,0x28
    800026e8:	00e502a3          	sb	a4,5(a0)
    800026ec:	0304d713          	srli	a4,s1,0x30
    800026f0:	00e50323          	sb	a4,6(a0)
    800026f4:	0384d493          	srli	s1,s1,0x38
    800026f8:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    800026fc:	00050423          	sb	zero,8(a0)
    80002700:	000504a3          	sb	zero,9(a0)
    80002704:	00050523          	sb	zero,10(a0)
    80002708:	000505a3          	sb	zero,11(a0)
    8000270c:	00050623          	sb	zero,12(a0)
    80002710:	000506a3          	sb	zero,13(a0)
    80002714:	00050723          	sb	zero,14(a0)
    80002718:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    8000271c:	07893703          	ld	a4,120(s2)
    80002720:	06070463          	beqz	a4,80002788 <_ZN7_thread4joinEPS_+0x118>
        thread->joinHead = newJoin;
        thread->joinTail = newJoin;
    }else{
        thread->joinTail->next = newJoin;
    80002724:	08093703          	ld	a4,128(s2)
    80002728:	00a70423          	sb	a0,8(a4)
    8000272c:	00855693          	srli	a3,a0,0x8
    80002730:	00d704a3          	sb	a3,9(a4)
    80002734:	01055693          	srli	a3,a0,0x10
    80002738:	00d70523          	sb	a3,10(a4)
    8000273c:	0185569b          	srliw	a3,a0,0x18
    80002740:	00d705a3          	sb	a3,11(a4)
    80002744:	02055693          	srli	a3,a0,0x20
    80002748:	00d70623          	sb	a3,12(a4)
    8000274c:	02855693          	srli	a3,a0,0x28
    80002750:	00d706a3          	sb	a3,13(a4)
    80002754:	03055693          	srli	a3,a0,0x30
    80002758:	00d70723          	sb	a3,14(a4)
    8000275c:	03855693          	srli	a3,a0,0x38
    80002760:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    80002764:	08a93023          	sd	a0,128(s2)
    }
    // Scheduler::remove(this);
    thread_dispatch();
    80002768:	fffff097          	auipc	ra,0xfffff
    8000276c:	d20080e7          	jalr	-736(ra) # 80001488 <_Z15thread_dispatchv>
}
    80002770:	01813083          	ld	ra,24(sp)
    80002774:	01013403          	ld	s0,16(sp)
    80002778:	00813483          	ld	s1,8(sp)
    8000277c:	00013903          	ld	s2,0(sp)
    80002780:	02010113          	addi	sp,sp,32
    80002784:	00008067          	ret
        thread->joinHead = newJoin;
    80002788:	06a93c23          	sd	a0,120(s2)
        thread->joinTail = newJoin;
    8000278c:	08a93023          	sd	a0,128(s2)
    80002790:	fd9ff06f          	j	80002768 <_ZN7_thread4joinEPS_+0xf8>

0000000080002794 <_ZN7_thread4tickEv>:

int _thread::tick(){
    if(currentThread->blocked){
    80002794:	00006797          	auipc	a5,0x6
    80002798:	9d47b783          	ld	a5,-1580(a5) # 80008168 <_ZN7_thread13currentThreadE>
    8000279c:	09c7a783          	lw	a5,156(a5)
    800027a0:	0027f713          	andi	a4,a5,2
    800027a4:	06071063          	bnez	a4,80002804 <_ZN7_thread4tickEv+0x70>
        return -1;
    }
    if(currentThread->closed){
    800027a8:	0017f713          	andi	a4,a5,1
    800027ac:	06071063          	bnez	a4,8000280c <_ZN7_thread4tickEv+0x78>
        return -2;
    }
    if(currentThread->sleeping){
    800027b0:	0047f713          	andi	a4,a5,4
    800027b4:	06071063          	bnez	a4,80002814 <_ZN7_thread4tickEv+0x80>
        return -3;
    }
    if(currentThread->finished){
    800027b8:	0087f793          	andi	a5,a5,8
    800027bc:	06079063          	bnez	a5,8000281c <_ZN7_thread4tickEv+0x88>
        return -4;
    }
    timeLeft --;
    800027c0:	08853783          	ld	a5,136(a0)
    800027c4:	fff78793          	addi	a5,a5,-1
    800027c8:	08f53423          	sd	a5,136(a0)
    if(timeLeft == 0){
    800027cc:	00078663          	beqz	a5,800027d8 <_ZN7_thread4tickEv+0x44>
        // __putc('d');
        // __putc('0' + currentThread->ID);
        // __putc('\n');
        thread_dispatch();
    }
    return 0;
    800027d0:	00000513          	li	a0,0
}
    800027d4:	00008067          	ret
int _thread::tick(){
    800027d8:	ff010113          	addi	sp,sp,-16
    800027dc:	00113423          	sd	ra,8(sp)
    800027e0:	00813023          	sd	s0,0(sp)
    800027e4:	01010413          	addi	s0,sp,16
        thread_dispatch();
    800027e8:	fffff097          	auipc	ra,0xfffff
    800027ec:	ca0080e7          	jalr	-864(ra) # 80001488 <_Z15thread_dispatchv>
    return 0;
    800027f0:	00000513          	li	a0,0
}
    800027f4:	00813083          	ld	ra,8(sp)
    800027f8:	00013403          	ld	s0,0(sp)
    800027fc:	01010113          	addi	sp,sp,16
    80002800:	00008067          	ret
        return -1;
    80002804:	fff00513          	li	a0,-1
    80002808:	00008067          	ret
        return -2;
    8000280c:	ffe00513          	li	a0,-2
    80002810:	00008067          	ret
        return -3;
    80002814:	ffd00513          	li	a0,-3
    80002818:	00008067          	ret
        return -4;
    8000281c:	ffc00513          	li	a0,-4
    80002820:	00008067          	ret

0000000080002824 <_ZN7_thread4exitEv>:

int _thread::exit(){
    if(currentThread->closed){
    80002824:	00006717          	auipc	a4,0x6
    80002828:	94473703          	ld	a4,-1724(a4) # 80008168 <_ZN7_thread13currentThreadE>
    8000282c:	09c72783          	lw	a5,156(a4)
    80002830:	0017f693          	andi	a3,a5,1
    80002834:	04069663          	bnez	a3,80002880 <_ZN7_thread4exitEv+0x5c>
        return -1;
    }
    if(currentThread->blocked){
    80002838:	0027f693          	andi	a3,a5,2
    8000283c:	04069663          	bnez	a3,80002888 <_ZN7_thread4exitEv+0x64>
        return -2;
    }
    if(currentThread->sleeping){
    80002840:	0047f793          	andi	a5,a5,4
    80002844:	04079663          	bnez	a5,80002890 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    80002848:	ff010113          	addi	sp,sp,-16
    8000284c:	00113423          	sd	ra,8(sp)
    80002850:	00813023          	sd	s0,0(sp)
    80002854:	01010413          	addi	s0,sp,16
        return -3;
    }
    currentThread->finished = 1;
    80002858:	09c72783          	lw	a5,156(a4)
    8000285c:	0087e793          	ori	a5,a5,8
    80002860:	08f72e23          	sw	a5,156(a4)
    thread_dispatch();
    80002864:	fffff097          	auipc	ra,0xfffff
    80002868:	c24080e7          	jalr	-988(ra) # 80001488 <_Z15thread_dispatchv>
    return 0;
    8000286c:	00000513          	li	a0,0
}
    80002870:	00813083          	ld	ra,8(sp)
    80002874:	00013403          	ld	s0,0(sp)
    80002878:	01010113          	addi	sp,sp,16
    8000287c:	00008067          	ret
        return -1;
    80002880:	fff00513          	li	a0,-1
    80002884:	00008067          	ret
        return -2;
    80002888:	ffe00513          	li	a0,-2
    8000288c:	00008067          	ret
        return -3;
    80002890:	ffd00513          	li	a0,-3
}
    80002894:	00008067          	ret

0000000080002898 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80002898:	fe010113          	addi	sp,sp,-32
    8000289c:	00113c23          	sd	ra,24(sp)
    800028a0:	00813823          	sd	s0,16(sp)
    800028a4:	00913423          	sd	s1,8(sp)
    800028a8:	02010413          	addi	s0,sp,32
    popSppSpie(currentThread->kernel);
    800028ac:	00006497          	auipc	s1,0x6
    800028b0:	8b448493          	addi	s1,s1,-1868 # 80008160 <_ZN7_thread6nextIDE>
    800028b4:	0084b783          	ld	a5,8(s1)
    800028b8:	09c7a503          	lw	a0,156(a5)
    800028bc:	4045551b          	sraiw	a0,a0,0x4
    800028c0:	00157513          	andi	a0,a0,1
    800028c4:	00000097          	auipc	ra,0x0
    800028c8:	a94080e7          	jalr	-1388(ra) # 80002358 <_Z10popSppSpieb>
    currentThread->function(currentThread->arg);
    800028cc:	0084b783          	ld	a5,8(s1)
    800028d0:	0a87b703          	ld	a4,168(a5)
    800028d4:	0b07b503          	ld	a0,176(a5)
    800028d8:	000700e7          	jalr	a4
    currentThread->unJoin();
    800028dc:	0084b503          	ld	a0,8(s1)
    800028e0:	00000097          	auipc	ra,0x0
    800028e4:	ab0080e7          	jalr	-1360(ra) # 80002390 <_ZN7_thread6unJoinEv>
    exit();
    800028e8:	00000097          	auipc	ra,0x0
    800028ec:	f3c080e7          	jalr	-196(ra) # 80002824 <_ZN7_thread4exitEv>
}
    800028f0:	01813083          	ld	ra,24(sp)
    800028f4:	01013403          	ld	s0,16(sp)
    800028f8:	00813483          	ld	s1,8(sp)
    800028fc:	02010113          	addi	sp,sp,32
    80002900:	00008067          	ret

0000000080002904 <_ZN7_thread10setBlockedEb>:

void _thread::setBlocked(bool blocked){
    80002904:	ff010113          	addi	sp,sp,-16
    80002908:	00813423          	sd	s0,8(sp)
    8000290c:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80002910:	0015f593          	andi	a1,a1,1
    80002914:	0015979b          	slliw	a5,a1,0x1
    80002918:	09c52583          	lw	a1,156(a0)
    8000291c:	ffd5f593          	andi	a1,a1,-3
    80002920:	00f5e5b3          	or	a1,a1,a5
    80002924:	08b52e23          	sw	a1,156(a0)
}
    80002928:	00813403          	ld	s0,8(sp)
    8000292c:	01010113          	addi	sp,sp,16
    80002930:	00008067          	ret

0000000080002934 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80002934:	ff010113          	addi	sp,sp,-16
    80002938:	00813423          	sd	s0,8(sp)
    8000293c:	01010413          	addi	s0,sp,16
    this->closed = closed;
    80002940:	0015f793          	andi	a5,a1,1
    80002944:	09c52583          	lw	a1,156(a0)
    80002948:	ffe5f593          	andi	a1,a1,-2
    8000294c:	00f5e5b3          	or	a1,a1,a5
    80002950:	08b52e23          	sw	a1,156(a0)
}
    80002954:	00813403          	ld	s0,8(sp)
    80002958:	01010113          	addi	sp,sp,16
    8000295c:	00008067          	ret

0000000080002960 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    80002960:	ff010113          	addi	sp,sp,-16
    80002964:	00813423          	sd	s0,8(sp)
    80002968:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    8000296c:	0015f593          	andi	a1,a1,1
    80002970:	0025979b          	slliw	a5,a1,0x2
    80002974:	09c52583          	lw	a1,156(a0)
    80002978:	ffb5f593          	andi	a1,a1,-5
    8000297c:	00f5e5b3          	or	a1,a1,a5
    80002980:	08b52e23          	sw	a1,156(a0)
}
    80002984:	00813403          	ld	s0,8(sp)
    80002988:	01010113          	addi	sp,sp,16
    8000298c:	00008067          	ret

0000000080002990 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
    // __putc('\n');
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    // __putc('.');
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    80002990:	ff010113          	addi	sp,sp,-16
    80002994:	00813423          	sd	s0,8(sp)
    80002998:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    8000299c:	04050263          	beqz	a0,800029e0 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    800029a0:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    800029a4:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    800029a8:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    800029ac:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    800029b0:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    800029b4:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    800029b8:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    800029bc:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    800029c0:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    800029c4:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    800029c8:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    800029cc:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    800029d0:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    800029d4:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    800029d8:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    800029dc:	06853823          	sd	s0,112(a0)
    //         __putc('a' + digit - 10);
    //     }
    // }
    // __putc('\n');
    
    if(newContext->sp != 0){
    800029e0:	0085b783          	ld	a5,8(a1)
    800029e4:	00078463          	beqz	a5,800029ec <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    800029e8:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    800029ec:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    800029f0:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    800029f4:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    800029f8:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    800029fc:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80002a00:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80002a04:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80002a08:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80002a0c:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80002a10:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80002a14:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    80002a18:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    80002a1c:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    80002a20:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    80002a24:	0685bd83          	ld	s11,104(a1)

    return;

}
    80002a28:	00813403          	ld	s0,8(sp)
    80002a2c:	01010113          	addi	sp,sp,16
    80002a30:	00008067          	ret

0000000080002a34 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80002a34:	fe010113          	addi	sp,sp,-32
    80002a38:	00113c23          	sd	ra,24(sp)
    80002a3c:	00813823          	sd	s0,16(sp)
    80002a40:	00913423          	sd	s1,8(sp)
    80002a44:	01213023          	sd	s2,0(sp)
    80002a48:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    80002a4c:	00005917          	auipc	s2,0x5
    80002a50:	71490913          	addi	s2,s2,1812 # 80008160 <_ZN7_thread6nextIDE>
    80002a54:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    80002a58:	00001097          	auipc	ra,0x1
    80002a5c:	2cc080e7          	jalr	716(ra) # 80003d24 <_ZN9Scheduler3getEv>
    80002a60:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    80002a64:	00200793          	li	a5,2
    80002a68:	08f4b423          	sd	a5,136(s1)
    if(currentThread == nullptr){
    80002a6c:	04050463          	beqz	a0,80002ab4 <_ZN7_thread8dispatchEv+0x80>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80002a70:	00048c63          	beqz	s1,80002a88 <_ZN7_thread8dispatchEv+0x54>
    80002a74:	0984b783          	ld	a5,152(s1)
    80002a78:	00f00713          	li	a4,15
    80002a7c:	02071713          	slli	a4,a4,0x20
    80002a80:	00e7f7b3          	and	a5,a5,a4
    80002a84:	02078e63          	beqz	a5,80002ac0 <_ZN7_thread8dispatchEv+0x8c>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    80002a88:	00005597          	auipc	a1,0x5
    80002a8c:	6e05b583          	ld	a1,1760(a1) # 80008168 <_ZN7_thread13currentThreadE>
    80002a90:	00048513          	mv	a0,s1
    80002a94:	00000097          	auipc	ra,0x0
    80002a98:	efc080e7          	jalr	-260(ra) # 80002990 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    80002a9c:	01813083          	ld	ra,24(sp)
    80002aa0:	01013403          	ld	s0,16(sp)
    80002aa4:	00813483          	ld	s1,8(sp)
    80002aa8:	00013903          	ld	s2,0(sp)
    80002aac:	02010113          	addi	sp,sp,32
    80002ab0:	00008067          	ret
        currentThread = oldThread;
    80002ab4:	00005797          	auipc	a5,0x5
    80002ab8:	6a97ba23          	sd	s1,1716(a5) # 80008168 <_ZN7_thread13currentThreadE>
        return;
    80002abc:	fe1ff06f          	j	80002a9c <_ZN7_thread8dispatchEv+0x68>
        Scheduler::put(oldThread);
    80002ac0:	00048513          	mv	a0,s1
    80002ac4:	00001097          	auipc	ra,0x1
    80002ac8:	070080e7          	jalr	112(ra) # 80003b34 <_ZN9Scheduler3putEP7_thread>
    80002acc:	fbdff06f          	j	80002a88 <_ZN7_thread8dispatchEv+0x54>

0000000080002ad0 <_ZN11HeapManagerC1Ev>:
#include "hw.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80002ad0:	fe010113          	addi	sp,sp,-32
    80002ad4:	00113c23          	sd	ra,24(sp)
    80002ad8:	00813823          	sd	s0,16(sp)
    80002adc:	00913423          	sd	s1,8(sp)
    80002ae0:	02010413          	addi	s0,sp,32
    80002ae4:	00050493          	mv	s1,a0
    assert(instance == 0);
    80002ae8:	00005797          	auipc	a5,0x5
    80002aec:	6887b783          	ld	a5,1672(a5) # 80008170 <_ZN11HeapManager8instanceE>
    80002af0:	02079063          	bnez	a5,80002b10 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80002af4:	00005797          	auipc	a5,0x5
    80002af8:	6697be23          	sd	s1,1660(a5) # 80008170 <_ZN11HeapManager8instanceE>
}
    80002afc:	01813083          	ld	ra,24(sp)
    80002b00:	01013403          	ld	s0,16(sp)
    80002b04:	00813483          	ld	s1,8(sp)
    80002b08:	02010113          	addi	sp,sp,32
    80002b0c:	00008067          	ret
    assert(instance == 0);
    80002b10:	00004697          	auipc	a3,0x4
    80002b14:	5c068693          	addi	a3,a3,1472 # 800070d0 <CONSOLE_STATUS+0xc0>
    80002b18:	01300613          	li	a2,19
    80002b1c:	00004597          	auipc	a1,0x4
    80002b20:	5d458593          	addi	a1,a1,1492 # 800070f0 <CONSOLE_STATUS+0xe0>
    80002b24:	00004517          	auipc	a0,0x4
    80002b28:	51c50513          	addi	a0,a0,1308 # 80007040 <CONSOLE_STATUS+0x30>
    80002b2c:	fffff097          	auipc	ra,0xfffff
    80002b30:	d70080e7          	jalr	-656(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80002b34:	fc1ff06f          	j	80002af4 <_ZN11HeapManagerC1Ev+0x24>

0000000080002b38 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80002b38:	ff010113          	addi	sp,sp,-16
    80002b3c:	00813423          	sd	s0,8(sp)
    80002b40:	01010413          	addi	s0,sp,16
    
}
    80002b44:	00813403          	ld	s0,8(sp)
    80002b48:	01010113          	addi	sp,sp,16
    80002b4c:	00008067          	ret

0000000080002b50 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    80002b50:	fd010113          	addi	sp,sp,-48
    80002b54:	02113423          	sd	ra,40(sp)
    80002b58:	02813023          	sd	s0,32(sp)
    80002b5c:	00913c23          	sd	s1,24(sp)
    80002b60:	01213823          	sd	s2,16(sp)
    80002b64:	01313423          	sd	s3,8(sp)
    80002b68:	03010413          	addi	s0,sp,48
    80002b6c:	00050993          	mv	s3,a0
    80002b70:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002b74:	40b604b3          	sub	s1,a2,a1
    80002b78:	0414b793          	sltiu	a5,s1,65
    80002b7c:	0c079863          	bnez	a5,80002c4c <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80002b80:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80002b84:	fde00793          	li	a5,-34
    80002b88:	00f90c23          	sb	a5,24(s2)
    80002b8c:	fc000713          	li	a4,-64
    80002b90:	00e90ca3          	sb	a4,25(s2)
    80002b94:	fad00713          	li	a4,-83
    80002b98:	00e90d23          	sb	a4,26(s2)
    80002b9c:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart - MEM_BLOCK_SIZE) / MEM_BLOCK_SIZE;
    80002ba0:	fc048613          	addi	a2,s1,-64
    80002ba4:	0009b783          	ld	a5,0(s3)
    80002ba8:	00665713          	srli	a4,a2,0x6
    80002bac:	00e78823          	sb	a4,16(a5)
    80002bb0:	00e65713          	srli	a4,a2,0xe
    80002bb4:	00e788a3          	sb	a4,17(a5)
    80002bb8:	01665713          	srli	a4,a2,0x16
    80002bbc:	00e78923          	sb	a4,18(a5)
    80002bc0:	01e65713          	srli	a4,a2,0x1e
    80002bc4:	00e789a3          	sb	a4,19(a5)
    80002bc8:	02665713          	srli	a4,a2,0x26
    80002bcc:	00e78a23          	sb	a4,20(a5)
    80002bd0:	02e65713          	srli	a4,a2,0x2e
    80002bd4:	00e78aa3          	sb	a4,21(a5)
    80002bd8:	03665713          	srli	a4,a2,0x36
    80002bdc:	00e78b23          	sb	a4,22(a5)
    80002be0:	03e65613          	srli	a2,a2,0x3e
    80002be4:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80002be8:	0009b783          	ld	a5,0(s3)
    80002bec:	00078023          	sb	zero,0(a5)
    80002bf0:	000780a3          	sb	zero,1(a5)
    80002bf4:	00078123          	sb	zero,2(a5)
    80002bf8:	000781a3          	sb	zero,3(a5)
    80002bfc:	00078223          	sb	zero,4(a5)
    80002c00:	000782a3          	sb	zero,5(a5)
    80002c04:	00078323          	sb	zero,6(a5)
    80002c08:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80002c0c:	0009b783          	ld	a5,0(s3)
    80002c10:	00078423          	sb	zero,8(a5)
    80002c14:	000784a3          	sb	zero,9(a5)
    80002c18:	00078523          	sb	zero,10(a5)
    80002c1c:	000785a3          	sb	zero,11(a5)
    80002c20:	00078623          	sb	zero,12(a5)
    80002c24:	000786a3          	sb	zero,13(a5)
    80002c28:	00078723          	sb	zero,14(a5)
    80002c2c:	000787a3          	sb	zero,15(a5)
}
    80002c30:	02813083          	ld	ra,40(sp)
    80002c34:	02013403          	ld	s0,32(sp)
    80002c38:	01813483          	ld	s1,24(sp)
    80002c3c:	01013903          	ld	s2,16(sp)
    80002c40:	00813983          	ld	s3,8(sp)
    80002c44:	03010113          	addi	sp,sp,48
    80002c48:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002c4c:	00004697          	auipc	a3,0x4
    80002c50:	4bc68693          	addi	a3,a3,1212 # 80007108 <CONSOLE_STATUS+0xf8>
    80002c54:	01c00613          	li	a2,28
    80002c58:	00004597          	auipc	a1,0x4
    80002c5c:	49858593          	addi	a1,a1,1176 # 800070f0 <CONSOLE_STATUS+0xe0>
    80002c60:	00004517          	auipc	a0,0x4
    80002c64:	4d850513          	addi	a0,a0,1240 # 80007138 <CONSOLE_STATUS+0x128>
    80002c68:	fffff097          	auipc	ra,0xfffff
    80002c6c:	c34080e7          	jalr	-972(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80002c70:	f11ff06f          	j	80002b80 <_ZN11HeapManager4initEmm+0x30>

0000000080002c74 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80002c74:	fe010113          	addi	sp,sp,-32
    80002c78:	00113c23          	sd	ra,24(sp)
    80002c7c:	00813823          	sd	s0,16(sp)
    80002c80:	00913423          	sd	s1,8(sp)
    80002c84:	01213023          	sd	s2,0(sp)
    80002c88:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002c8c:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80002c90:	00000913          	li	s2,0
    80002c94:	0b80006f          	j	80002d4c <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        /// how is this an illegal read???
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80002c98:	0104c783          	lbu	a5,16(s1)
    80002c9c:	0114c703          	lbu	a4,17(s1)
    80002ca0:	00871713          	slli	a4,a4,0x8
    80002ca4:	00f76733          	or	a4,a4,a5
    80002ca8:	0124c783          	lbu	a5,18(s1)
    80002cac:	01079793          	slli	a5,a5,0x10
    80002cb0:	00e7e733          	or	a4,a5,a4
    80002cb4:	0134c783          	lbu	a5,19(s1)
    80002cb8:	01879793          	slli	a5,a5,0x18
    80002cbc:	00e7e7b3          	or	a5,a5,a4
    80002cc0:	0144c703          	lbu	a4,20(s1)
    80002cc4:	02071713          	slli	a4,a4,0x20
    80002cc8:	00f767b3          	or	a5,a4,a5
    80002ccc:	0154c703          	lbu	a4,21(s1)
    80002cd0:	02871713          	slli	a4,a4,0x28
    80002cd4:	00f76733          	or	a4,a4,a5
    80002cd8:	0164c783          	lbu	a5,22(s1)
    80002cdc:	03079793          	slli	a5,a5,0x30
    80002ce0:	00e7e733          	or	a4,a5,a4
    80002ce4:	0174c783          	lbu	a5,23(s1)
    80002ce8:	03879793          	slli	a5,a5,0x38
    80002cec:	00e7e7b3          	or	a5,a5,a4
    80002cf0:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80002cf4:	0004c703          	lbu	a4,0(s1)
    80002cf8:	0014c783          	lbu	a5,1(s1)
    80002cfc:	00879793          	slli	a5,a5,0x8
    80002d00:	00e7e733          	or	a4,a5,a4
    80002d04:	0024c783          	lbu	a5,2(s1)
    80002d08:	01079793          	slli	a5,a5,0x10
    80002d0c:	00e7e7b3          	or	a5,a5,a4
    80002d10:	0034c703          	lbu	a4,3(s1)
    80002d14:	01871713          	slli	a4,a4,0x18
    80002d18:	00f767b3          	or	a5,a4,a5
    80002d1c:	0044c703          	lbu	a4,4(s1)
    80002d20:	02071713          	slli	a4,a4,0x20
    80002d24:	00f76733          	or	a4,a4,a5
    80002d28:	0054c783          	lbu	a5,5(s1)
    80002d2c:	02879793          	slli	a5,a5,0x28
    80002d30:	00e7e733          	or	a4,a5,a4
    80002d34:	0064c783          	lbu	a5,6(s1)
    80002d38:	03079793          	slli	a5,a5,0x30
    80002d3c:	00e7e7b3          	or	a5,a5,a4
    80002d40:	0074c483          	lbu	s1,7(s1)
    80002d44:	03849493          	slli	s1,s1,0x38
    80002d48:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002d4c:	06048263          	beqz	s1,80002db0 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002d50:	0184c783          	lbu	a5,24(s1)
    80002d54:	0194c703          	lbu	a4,25(s1)
    80002d58:	00871713          	slli	a4,a4,0x8
    80002d5c:	00f76733          	or	a4,a4,a5
    80002d60:	01a4c783          	lbu	a5,26(s1)
    80002d64:	01079793          	slli	a5,a5,0x10
    80002d68:	00e7e733          	or	a4,a5,a4
    80002d6c:	01b4c783          	lbu	a5,27(s1)
    80002d70:	01879793          	slli	a5,a5,0x18
    80002d74:	00e7e7b3          	or	a5,a5,a4
    80002d78:	0007879b          	sext.w	a5,a5
    80002d7c:	deadc737          	lui	a4,0xdeadc
    80002d80:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2cee>
    80002d84:	f0e78ae3          	beq	a5,a4,80002c98 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80002d88:	00004697          	auipc	a3,0x4
    80002d8c:	3d068693          	addi	a3,a3,976 # 80007158 <CONSOLE_STATUS+0x148>
    80002d90:	02a00613          	li	a2,42
    80002d94:	00004597          	auipc	a1,0x4
    80002d98:	35c58593          	addi	a1,a1,860 # 800070f0 <CONSOLE_STATUS+0xe0>
    80002d9c:	00004517          	auipc	a0,0x4
    80002da0:	3e450513          	addi	a0,a0,996 # 80007180 <CONSOLE_STATUS+0x170>
    80002da4:	fffff097          	auipc	ra,0xfffff
    80002da8:	af8080e7          	jalr	-1288(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80002dac:	eedff06f          	j	80002c98 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80002db0:	00090513          	mv	a0,s2
    80002db4:	01813083          	ld	ra,24(sp)
    80002db8:	01013403          	ld	s0,16(sp)
    80002dbc:	00813483          	ld	s1,8(sp)
    80002dc0:	00013903          	ld	s2,0(sp)
    80002dc4:	02010113          	addi	sp,sp,32
    80002dc8:	00008067          	ret

0000000080002dcc <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80002dcc:	fd010113          	addi	sp,sp,-48
    80002dd0:	02113423          	sd	ra,40(sp)
    80002dd4:	02813023          	sd	s0,32(sp)
    80002dd8:	00913c23          	sd	s1,24(sp)
    80002ddc:	01213823          	sd	s2,16(sp)
    80002de0:	01313423          	sd	s3,8(sp)
    80002de4:	03010413          	addi	s0,sp,48
    80002de8:	00050993          	mv	s3,a0
    80002dec:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002df0:	00053483          	ld	s1,0(a0)
    80002df4:	0b80006f          	j	80002eac <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80002df8:	0104c783          	lbu	a5,16(s1)
    80002dfc:	0114c703          	lbu	a4,17(s1)
    80002e00:	00871713          	slli	a4,a4,0x8
    80002e04:	00f76733          	or	a4,a4,a5
    80002e08:	0124c783          	lbu	a5,18(s1)
    80002e0c:	01079793          	slli	a5,a5,0x10
    80002e10:	00e7e733          	or	a4,a5,a4
    80002e14:	0134c783          	lbu	a5,19(s1)
    80002e18:	01879793          	slli	a5,a5,0x18
    80002e1c:	00e7e7b3          	or	a5,a5,a4
    80002e20:	0144c703          	lbu	a4,20(s1)
    80002e24:	02071713          	slli	a4,a4,0x20
    80002e28:	00f767b3          	or	a5,a4,a5
    80002e2c:	0154c703          	lbu	a4,21(s1)
    80002e30:	02871713          	slli	a4,a4,0x28
    80002e34:	00f76733          	or	a4,a4,a5
    80002e38:	0164c783          	lbu	a5,22(s1)
    80002e3c:	03079793          	slli	a5,a5,0x30
    80002e40:	00e7e733          	or	a4,a5,a4
    80002e44:	0174c783          	lbu	a5,23(s1)
    80002e48:	03879793          	slli	a5,a5,0x38
    80002e4c:	00e7e7b3          	or	a5,a5,a4
    80002e50:	0d27f063          	bgeu	a5,s2,80002f10 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80002e54:	0004c703          	lbu	a4,0(s1)
    80002e58:	0014c783          	lbu	a5,1(s1)
    80002e5c:	00879793          	slli	a5,a5,0x8
    80002e60:	00e7e733          	or	a4,a5,a4
    80002e64:	0024c783          	lbu	a5,2(s1)
    80002e68:	01079793          	slli	a5,a5,0x10
    80002e6c:	00e7e7b3          	or	a5,a5,a4
    80002e70:	0034c703          	lbu	a4,3(s1)
    80002e74:	01871713          	slli	a4,a4,0x18
    80002e78:	00f767b3          	or	a5,a4,a5
    80002e7c:	0044c703          	lbu	a4,4(s1)
    80002e80:	02071713          	slli	a4,a4,0x20
    80002e84:	00f76733          	or	a4,a4,a5
    80002e88:	0054c783          	lbu	a5,5(s1)
    80002e8c:	02879793          	slli	a5,a5,0x28
    80002e90:	00e7e733          	or	a4,a5,a4
    80002e94:	0064c783          	lbu	a5,6(s1)
    80002e98:	03079793          	slli	a5,a5,0x30
    80002e9c:	00e7e7b3          	or	a5,a5,a4
    80002ea0:	0074c483          	lbu	s1,7(s1)
    80002ea4:	03849493          	slli	s1,s1,0x38
    80002ea8:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002eac:	4e048c63          	beqz	s1,800033a4 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002eb0:	0184c783          	lbu	a5,24(s1)
    80002eb4:	0194c703          	lbu	a4,25(s1)
    80002eb8:	00871713          	slli	a4,a4,0x8
    80002ebc:	00f76733          	or	a4,a4,a5
    80002ec0:	01a4c783          	lbu	a5,26(s1)
    80002ec4:	01079793          	slli	a5,a5,0x10
    80002ec8:	00e7e733          	or	a4,a5,a4
    80002ecc:	01b4c783          	lbu	a5,27(s1)
    80002ed0:	01879793          	slli	a5,a5,0x18
    80002ed4:	00e7e7b3          	or	a5,a5,a4
    80002ed8:	0007879b          	sext.w	a5,a5
    80002edc:	deadc737          	lui	a4,0xdeadc
    80002ee0:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2cee>
    80002ee4:	f0e78ae3          	beq	a5,a4,80002df8 <_ZN11HeapManager12heapAllocateEm+0x2c>
    80002ee8:	00004697          	auipc	a3,0x4
    80002eec:	2c068693          	addi	a3,a3,704 # 800071a8 <CONSOLE_STATUS+0x198>
    80002ef0:	03400613          	li	a2,52
    80002ef4:	00004597          	auipc	a1,0x4
    80002ef8:	1fc58593          	addi	a1,a1,508 # 800070f0 <CONSOLE_STATUS+0xe0>
    80002efc:	00004517          	auipc	a0,0x4
    80002f00:	28450513          	addi	a0,a0,644 # 80007180 <CONSOLE_STATUS+0x170>
    80002f04:	fffff097          	auipc	ra,0xfffff
    80002f08:	998080e7          	jalr	-1640(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80002f0c:	eedff06f          	j	80002df8 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80002f10:	00190713          	addi	a4,s2,1
    80002f14:	2af77263          	bgeu	a4,a5,800031b8 <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80002f18:	00671793          	slli	a5,a4,0x6
    80002f1c:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80002f20:	fde00713          	li	a4,-34
    80002f24:	00e78c23          	sb	a4,24(a5)
    80002f28:	fc000693          	li	a3,-64
    80002f2c:	00d78ca3          	sb	a3,25(a5)
    80002f30:	fad00693          	li	a3,-83
    80002f34:	00d78d23          	sb	a3,26(a5)
    80002f38:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80002f3c:	0104c703          	lbu	a4,16(s1)
    80002f40:	0114c683          	lbu	a3,17(s1)
    80002f44:	00869693          	slli	a3,a3,0x8
    80002f48:	00e6e6b3          	or	a3,a3,a4
    80002f4c:	0124c703          	lbu	a4,18(s1)
    80002f50:	01071713          	slli	a4,a4,0x10
    80002f54:	00d766b3          	or	a3,a4,a3
    80002f58:	0134c703          	lbu	a4,19(s1)
    80002f5c:	01871713          	slli	a4,a4,0x18
    80002f60:	00d76733          	or	a4,a4,a3
    80002f64:	0144c683          	lbu	a3,20(s1)
    80002f68:	02069693          	slli	a3,a3,0x20
    80002f6c:	00e6e733          	or	a4,a3,a4
    80002f70:	0154c683          	lbu	a3,21(s1)
    80002f74:	02869693          	slli	a3,a3,0x28
    80002f78:	00e6e6b3          	or	a3,a3,a4
    80002f7c:	0164c703          	lbu	a4,22(s1)
    80002f80:	03071713          	slli	a4,a4,0x30
    80002f84:	00d766b3          	or	a3,a4,a3
    80002f88:	0174c703          	lbu	a4,23(s1)
    80002f8c:	03871713          	slli	a4,a4,0x38
    80002f90:	00d76733          	or	a4,a4,a3
    80002f94:	41270733          	sub	a4,a4,s2
    80002f98:	fff70713          	addi	a4,a4,-1
    80002f9c:	00e78823          	sb	a4,16(a5)
    80002fa0:	00875693          	srli	a3,a4,0x8
    80002fa4:	00d788a3          	sb	a3,17(a5)
    80002fa8:	01075693          	srli	a3,a4,0x10
    80002fac:	00d78923          	sb	a3,18(a5)
    80002fb0:	0187569b          	srliw	a3,a4,0x18
    80002fb4:	00d789a3          	sb	a3,19(a5)
    80002fb8:	02075693          	srli	a3,a4,0x20
    80002fbc:	00d78a23          	sb	a3,20(a5)
    80002fc0:	02875693          	srli	a3,a4,0x28
    80002fc4:	00d78aa3          	sb	a3,21(a5)
    80002fc8:	03075693          	srli	a3,a4,0x30
    80002fcc:	00d78b23          	sb	a3,22(a5)
    80002fd0:	03875713          	srli	a4,a4,0x38
    80002fd4:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80002fd8:	0004c703          	lbu	a4,0(s1)
    80002fdc:	0014c683          	lbu	a3,1(s1)
    80002fe0:	00869693          	slli	a3,a3,0x8
    80002fe4:	00e6e733          	or	a4,a3,a4
    80002fe8:	0024c683          	lbu	a3,2(s1)
    80002fec:	01069693          	slli	a3,a3,0x10
    80002ff0:	00e6e6b3          	or	a3,a3,a4
    80002ff4:	0034c703          	lbu	a4,3(s1)
    80002ff8:	01871713          	slli	a4,a4,0x18
    80002ffc:	00d766b3          	or	a3,a4,a3
    80003000:	0044c703          	lbu	a4,4(s1)
    80003004:	02071713          	slli	a4,a4,0x20
    80003008:	00d76733          	or	a4,a4,a3
    8000300c:	0054c683          	lbu	a3,5(s1)
    80003010:	02869693          	slli	a3,a3,0x28
    80003014:	00e6e733          	or	a4,a3,a4
    80003018:	0064c683          	lbu	a3,6(s1)
    8000301c:	03069693          	slli	a3,a3,0x30
    80003020:	00e6e6b3          	or	a3,a3,a4
    80003024:	0074c703          	lbu	a4,7(s1)
    80003028:	03871713          	slli	a4,a4,0x38
    8000302c:	00d76733          	or	a4,a4,a3
    80003030:	00d78023          	sb	a3,0(a5)
    80003034:	00875693          	srli	a3,a4,0x8
    80003038:	00d780a3          	sb	a3,1(a5)
    8000303c:	01075693          	srli	a3,a4,0x10
    80003040:	00d78123          	sb	a3,2(a5)
    80003044:	0187569b          	srliw	a3,a4,0x18
    80003048:	00d781a3          	sb	a3,3(a5)
    8000304c:	02075693          	srli	a3,a4,0x20
    80003050:	00d78223          	sb	a3,4(a5)
    80003054:	02875693          	srli	a3,a4,0x28
    80003058:	00d782a3          	sb	a3,5(a5)
    8000305c:	03075693          	srli	a3,a4,0x30
    80003060:	00d78323          	sb	a3,6(a5)
    80003064:	03875713          	srli	a4,a4,0x38
    80003068:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    8000306c:	00978423          	sb	s1,8(a5)
    80003070:	0084d713          	srli	a4,s1,0x8
    80003074:	00e784a3          	sb	a4,9(a5)
    80003078:	0104d713          	srli	a4,s1,0x10
    8000307c:	00e78523          	sb	a4,10(a5)
    80003080:	0184d71b          	srliw	a4,s1,0x18
    80003084:	00e785a3          	sb	a4,11(a5)
    80003088:	0204d713          	srli	a4,s1,0x20
    8000308c:	00e78623          	sb	a4,12(a5)
    80003090:	0284d713          	srli	a4,s1,0x28
    80003094:	00e786a3          	sb	a4,13(a5)
    80003098:	0304d713          	srli	a4,s1,0x30
    8000309c:	00e78723          	sb	a4,14(a5)
    800030a0:	0384d713          	srli	a4,s1,0x38
    800030a4:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    800030a8:	0004c703          	lbu	a4,0(s1)
    800030ac:	0014c683          	lbu	a3,1(s1)
    800030b0:	00869693          	slli	a3,a3,0x8
    800030b4:	00e6e6b3          	or	a3,a3,a4
    800030b8:	0024c703          	lbu	a4,2(s1)
    800030bc:	01071713          	slli	a4,a4,0x10
    800030c0:	00d766b3          	or	a3,a4,a3
    800030c4:	0034c703          	lbu	a4,3(s1)
    800030c8:	01871713          	slli	a4,a4,0x18
    800030cc:	00d76733          	or	a4,a4,a3
    800030d0:	0044c683          	lbu	a3,4(s1)
    800030d4:	02069693          	slli	a3,a3,0x20
    800030d8:	00e6e733          	or	a4,a3,a4
    800030dc:	0054c683          	lbu	a3,5(s1)
    800030e0:	02869693          	slli	a3,a3,0x28
    800030e4:	00e6e6b3          	or	a3,a3,a4
    800030e8:	0064c703          	lbu	a4,6(s1)
    800030ec:	03071713          	slli	a4,a4,0x30
    800030f0:	00d766b3          	or	a3,a4,a3
    800030f4:	0074c703          	lbu	a4,7(s1)
    800030f8:	03871713          	slli	a4,a4,0x38
    800030fc:	00d76733          	or	a4,a4,a3
    80003100:	04070063          	beqz	a4,80003140 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003104:	00f70423          	sb	a5,8(a4)
    80003108:	0087d693          	srli	a3,a5,0x8
    8000310c:	00d704a3          	sb	a3,9(a4)
    80003110:	0107d693          	srli	a3,a5,0x10
    80003114:	00d70523          	sb	a3,10(a4)
    80003118:	0187d69b          	srliw	a3,a5,0x18
    8000311c:	00d705a3          	sb	a3,11(a4)
    80003120:	0207d693          	srli	a3,a5,0x20
    80003124:	00d70623          	sb	a3,12(a4)
    80003128:	0287d693          	srli	a3,a5,0x28
    8000312c:	00d706a3          	sb	a3,13(a4)
    80003130:	0307d693          	srli	a3,a5,0x30
    80003134:	00d70723          	sb	a3,14(a4)
    80003138:	0387d693          	srli	a3,a5,0x38
    8000313c:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80003140:	00f48023          	sb	a5,0(s1)
    80003144:	0087d713          	srli	a4,a5,0x8
    80003148:	00e480a3          	sb	a4,1(s1)
    8000314c:	0107d713          	srli	a4,a5,0x10
    80003150:	00e48123          	sb	a4,2(s1)
    80003154:	0187d71b          	srliw	a4,a5,0x18
    80003158:	00e481a3          	sb	a4,3(s1)
    8000315c:	0207d713          	srli	a4,a5,0x20
    80003160:	00e48223          	sb	a4,4(s1)
    80003164:	0287d713          	srli	a4,a5,0x28
    80003168:	00e482a3          	sb	a4,5(s1)
    8000316c:	0307d713          	srli	a4,a5,0x30
    80003170:	00e48323          	sb	a4,6(s1)
    80003174:	0387d793          	srli	a5,a5,0x38
    80003178:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    8000317c:	01248823          	sb	s2,16(s1)
    80003180:	00895793          	srli	a5,s2,0x8
    80003184:	00f488a3          	sb	a5,17(s1)
    80003188:	01095793          	srli	a5,s2,0x10
    8000318c:	00f48923          	sb	a5,18(s1)
    80003190:	0189579b          	srliw	a5,s2,0x18
    80003194:	00f489a3          	sb	a5,19(s1)
    80003198:	02095793          	srli	a5,s2,0x20
    8000319c:	00f48a23          	sb	a5,20(s1)
    800031a0:	02895793          	srli	a5,s2,0x28
    800031a4:	00f48aa3          	sb	a5,21(s1)
    800031a8:	03095793          	srli	a5,s2,0x30
    800031ac:	00f48b23          	sb	a5,22(s1)
    800031b0:	03895913          	srli	s2,s2,0x38
    800031b4:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    800031b8:	0009b783          	ld	a5,0(s3)
    800031bc:	20978463          	beq	a5,s1,800033c4 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    800031c0:	0084c783          	lbu	a5,8(s1)
    800031c4:	0094c703          	lbu	a4,9(s1)
    800031c8:	00871713          	slli	a4,a4,0x8
    800031cc:	00f76733          	or	a4,a4,a5
    800031d0:	00a4c783          	lbu	a5,10(s1)
    800031d4:	01079793          	slli	a5,a5,0x10
    800031d8:	00e7e733          	or	a4,a5,a4
    800031dc:	00b4c783          	lbu	a5,11(s1)
    800031e0:	01879793          	slli	a5,a5,0x18
    800031e4:	00e7e7b3          	or	a5,a5,a4
    800031e8:	00c4c703          	lbu	a4,12(s1)
    800031ec:	02071713          	slli	a4,a4,0x20
    800031f0:	00f767b3          	or	a5,a4,a5
    800031f4:	00d4c703          	lbu	a4,13(s1)
    800031f8:	02871713          	slli	a4,a4,0x28
    800031fc:	00f76733          	or	a4,a4,a5
    80003200:	00e4c783          	lbu	a5,14(s1)
    80003204:	03079793          	slli	a5,a5,0x30
    80003208:	00e7e733          	or	a4,a5,a4
    8000320c:	00f4c783          	lbu	a5,15(s1)
    80003210:	03879793          	slli	a5,a5,0x38
    80003214:	00e7e7b3          	or	a5,a5,a4
    80003218:	08078c63          	beqz	a5,800032b0 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    8000321c:	0004c703          	lbu	a4,0(s1)
    80003220:	0014c683          	lbu	a3,1(s1)
    80003224:	00869693          	slli	a3,a3,0x8
    80003228:	00e6e733          	or	a4,a3,a4
    8000322c:	0024c683          	lbu	a3,2(s1)
    80003230:	01069693          	slli	a3,a3,0x10
    80003234:	00e6e6b3          	or	a3,a3,a4
    80003238:	0034c703          	lbu	a4,3(s1)
    8000323c:	01871713          	slli	a4,a4,0x18
    80003240:	00d766b3          	or	a3,a4,a3
    80003244:	0044c703          	lbu	a4,4(s1)
    80003248:	02071713          	slli	a4,a4,0x20
    8000324c:	00d76733          	or	a4,a4,a3
    80003250:	0054c683          	lbu	a3,5(s1)
    80003254:	02869693          	slli	a3,a3,0x28
    80003258:	00e6e733          	or	a4,a3,a4
    8000325c:	0064c683          	lbu	a3,6(s1)
    80003260:	03069693          	slli	a3,a3,0x30
    80003264:	00e6e6b3          	or	a3,a3,a4
    80003268:	0074c703          	lbu	a4,7(s1)
    8000326c:	03871713          	slli	a4,a4,0x38
    80003270:	00d76733          	or	a4,a4,a3
    80003274:	00d78023          	sb	a3,0(a5)
    80003278:	00875693          	srli	a3,a4,0x8
    8000327c:	00d780a3          	sb	a3,1(a5)
    80003280:	01075693          	srli	a3,a4,0x10
    80003284:	00d78123          	sb	a3,2(a5)
    80003288:	0187569b          	srliw	a3,a4,0x18
    8000328c:	00d781a3          	sb	a3,3(a5)
    80003290:	02075693          	srli	a3,a4,0x20
    80003294:	00d78223          	sb	a3,4(a5)
    80003298:	02875693          	srli	a3,a4,0x28
    8000329c:	00d782a3          	sb	a3,5(a5)
    800032a0:	03075693          	srli	a3,a4,0x30
    800032a4:	00d78323          	sb	a3,6(a5)
    800032a8:	03875713          	srli	a4,a4,0x38
    800032ac:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    800032b0:	0004c783          	lbu	a5,0(s1)
    800032b4:	0014c703          	lbu	a4,1(s1)
    800032b8:	00871713          	slli	a4,a4,0x8
    800032bc:	00f76733          	or	a4,a4,a5
    800032c0:	0024c783          	lbu	a5,2(s1)
    800032c4:	01079793          	slli	a5,a5,0x10
    800032c8:	00e7e733          	or	a4,a5,a4
    800032cc:	0034c783          	lbu	a5,3(s1)
    800032d0:	01879793          	slli	a5,a5,0x18
    800032d4:	00e7e7b3          	or	a5,a5,a4
    800032d8:	0044c703          	lbu	a4,4(s1)
    800032dc:	02071713          	slli	a4,a4,0x20
    800032e0:	00f767b3          	or	a5,a4,a5
    800032e4:	0054c703          	lbu	a4,5(s1)
    800032e8:	02871713          	slli	a4,a4,0x28
    800032ec:	00f76733          	or	a4,a4,a5
    800032f0:	0064c783          	lbu	a5,6(s1)
    800032f4:	03079793          	slli	a5,a5,0x30
    800032f8:	00e7e733          	or	a4,a5,a4
    800032fc:	0074c783          	lbu	a5,7(s1)
    80003300:	03879793          	slli	a5,a5,0x38
    80003304:	00e7e7b3          	or	a5,a5,a4
    80003308:	08078c63          	beqz	a5,800033a0 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    8000330c:	0084c703          	lbu	a4,8(s1)
    80003310:	0094c683          	lbu	a3,9(s1)
    80003314:	00869693          	slli	a3,a3,0x8
    80003318:	00e6e733          	or	a4,a3,a4
    8000331c:	00a4c683          	lbu	a3,10(s1)
    80003320:	01069693          	slli	a3,a3,0x10
    80003324:	00e6e6b3          	or	a3,a3,a4
    80003328:	00b4c703          	lbu	a4,11(s1)
    8000332c:	01871713          	slli	a4,a4,0x18
    80003330:	00d766b3          	or	a3,a4,a3
    80003334:	00c4c703          	lbu	a4,12(s1)
    80003338:	02071713          	slli	a4,a4,0x20
    8000333c:	00d76733          	or	a4,a4,a3
    80003340:	00d4c683          	lbu	a3,13(s1)
    80003344:	02869693          	slli	a3,a3,0x28
    80003348:	00e6e733          	or	a4,a3,a4
    8000334c:	00e4c683          	lbu	a3,14(s1)
    80003350:	03069693          	slli	a3,a3,0x30
    80003354:	00e6e6b3          	or	a3,a3,a4
    80003358:	00f4c703          	lbu	a4,15(s1)
    8000335c:	03871713          	slli	a4,a4,0x38
    80003360:	00d76733          	or	a4,a4,a3
    80003364:	00d78423          	sb	a3,8(a5)
    80003368:	00875693          	srli	a3,a4,0x8
    8000336c:	00d784a3          	sb	a3,9(a5)
    80003370:	01075693          	srli	a3,a4,0x10
    80003374:	00d78523          	sb	a3,10(a5)
    80003378:	0187569b          	srliw	a3,a4,0x18
    8000337c:	00d785a3          	sb	a3,11(a5)
    80003380:	02075693          	srli	a3,a4,0x20
    80003384:	00d78623          	sb	a3,12(a5)
    80003388:	02875693          	srli	a3,a4,0x28
    8000338c:	00d786a3          	sb	a3,13(a5)
    80003390:	03075693          	srli	a3,a4,0x30
    80003394:	00d78723          	sb	a3,14(a5)
    80003398:	03875713          	srli	a4,a4,0x38
    8000339c:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    800033a0:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    800033a4:	00048513          	mv	a0,s1
    800033a8:	02813083          	ld	ra,40(sp)
    800033ac:	02013403          	ld	s0,32(sp)
    800033b0:	01813483          	ld	s1,24(sp)
    800033b4:	01013903          	ld	s2,16(sp)
    800033b8:	00813983          	ld	s3,8(sp)
    800033bc:	03010113          	addi	sp,sp,48
    800033c0:	00008067          	ret
                m_pHead = pCurrent->pNext;
    800033c4:	0004c703          	lbu	a4,0(s1)
    800033c8:	0014c783          	lbu	a5,1(s1)
    800033cc:	00879793          	slli	a5,a5,0x8
    800033d0:	00e7e7b3          	or	a5,a5,a4
    800033d4:	0024c703          	lbu	a4,2(s1)
    800033d8:	01071713          	slli	a4,a4,0x10
    800033dc:	00f76733          	or	a4,a4,a5
    800033e0:	0034c783          	lbu	a5,3(s1)
    800033e4:	01879793          	slli	a5,a5,0x18
    800033e8:	00e7e733          	or	a4,a5,a4
    800033ec:	0044c783          	lbu	a5,4(s1)
    800033f0:	02079793          	slli	a5,a5,0x20
    800033f4:	00e7e7b3          	or	a5,a5,a4
    800033f8:	0054c703          	lbu	a4,5(s1)
    800033fc:	02871713          	slli	a4,a4,0x28
    80003400:	00f76733          	or	a4,a4,a5
    80003404:	0064c783          	lbu	a5,6(s1)
    80003408:	03079793          	slli	a5,a5,0x30
    8000340c:	00e7e733          	or	a4,a5,a4
    80003410:	0074c783          	lbu	a5,7(s1)
    80003414:	03879793          	slli	a5,a5,0x38
    80003418:	00e7e7b3          	or	a5,a5,a4
    8000341c:	00f9b023          	sd	a5,0(s3)
    80003420:	da1ff06f          	j	800031c0 <_ZN11HeapManager12heapAllocateEm+0x3f4>

0000000080003424 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003424:	ff010113          	addi	sp,sp,-16
    80003428:	00813423          	sd	s0,8(sp)
    8000342c:	01010413          	addi	s0,sp,16
    //     if(pFree->pNext != 0){
    //         pFree->pNext->pPrev = pFree;
    //     }
    // }
    return 0;
}
    80003430:	00000513          	li	a0,0
    80003434:	00813403          	ld	s0,8(sp)
    80003438:	01010113          	addi	sp,sp,16
    8000343c:	00008067          	ret

0000000080003440 <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"
#include "assert.h"

extern "C" void exceptionHandler(){
    80003440:	fc010113          	addi	sp,sp,-64
    80003444:	02113c23          	sd	ra,56(sp)
    80003448:	02813823          	sd	s0,48(sp)
    8000344c:	02913423          	sd	s1,40(sp)
    80003450:	03213023          	sd	s2,32(sp)
    80003454:	01313c23          	sd	s3,24(sp)
    80003458:	01413823          	sd	s4,16(sp)
    8000345c:	01513423          	sd	s5,8(sp)
    80003460:	01613023          	sd	s6,0(sp)
    80003464:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    80003468:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    8000346c:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    80003470:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    80003474:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80003478:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    8000347c:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80003480:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80003484:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80003488:	ff870613          	addi	a2,a4,-8
    8000348c:	00100693          	li	a3,1
    80003490:	04c6f463          	bgeu	a3,a2,800034d8 <exceptionHandler+0x98>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    80003494:	00500793          	li	a5,5
    80003498:	20f70e63          	beq	a4,a5,800036b4 <exceptionHandler+0x274>
                __putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    8000349c:	00700793          	li	a5,7
    800034a0:	3cf70863          	beq	a4,a5,80003870 <exceptionHandler+0x430>
                __putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    800034a4:	fff00793          	li	a5,-1
    800034a8:	03f79793          	slli	a5,a5,0x3f
    800034ac:	00178793          	addi	a5,a5,1
    800034b0:	58f70463          	beq	a4,a5,80003a38 <exceptionHandler+0x5f8>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    800034b4:	fff00793          	li	a5,-1
    800034b8:	03f79793          	slli	a5,a5,0x3f
    800034bc:	00978793          	addi	a5,a5,9
    800034c0:	08f71863          	bne	a4,a5,80003550 <exceptionHandler+0x110>
    {   
        int irq = plic_claim();
    800034c4:	00001097          	auipc	ra,0x1
    800034c8:	240080e7          	jalr	576(ra) # 80004704 <plic_claim>
        // if(irq == CONSOLE_IRQ)Console::console_handler();
        plic_complete(irq);
    800034cc:	00001097          	auipc	ra,0x1
    800034d0:	270080e7          	jalr	624(ra) # 8000473c <plic_complete>
    800034d4:	07c0006f          	j	80003550 <exceptionHandler+0x110>
        switch(a0){
    800034d8:	04200713          	li	a4,66
    800034dc:	02f76463          	bltu	a4,a5,80003504 <exceptionHandler+0xc4>
    800034e0:	1c078263          	beqz	a5,800036a4 <exceptionHandler+0x264>
    800034e4:	1cf76463          	bltu	a4,a5,800036ac <exceptionHandler+0x26c>
    800034e8:	00279793          	slli	a5,a5,0x2
    800034ec:	00004717          	auipc	a4,0x4
    800034f0:	d4870713          	addi	a4,a4,-696 # 80007234 <CONSOLE_STATUS+0x224>
    800034f4:	00e787b3          	add	a5,a5,a4
    800034f8:	0007a783          	lw	a5,0(a5)
    800034fc:	00e787b3          	add	a5,a5,a4
    80003500:	00078067          	jr	a5
    80003504:	0ff00713          	li	a4,255
    80003508:	02e79663          	bne	a5,a4,80003534 <exceptionHandler+0xf4>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    8000350c:	00000793          	li	a5,0
    80003510:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80003514:	00448493          	addi	s1,s1,4
    80003518:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    8000351c:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    80003520:	10000793          	li	a5,256
    80003524:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003528:	00200793          	li	a5,2
    8000352c:	1447b073          	csrc	sip,a5
                return;
    80003530:	0200006f          	j	80003550 <exceptionHandler+0x110>
        switch(a0){
    80003534:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80003538:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    8000353c:	00448493          	addi	s1,s1,4
    80003540:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003544:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003548:	00200793          	li	a5,2
    8000354c:	1447b073          	csrc	sip,a5
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    80003550:	03813083          	ld	ra,56(sp)
    80003554:	03013403          	ld	s0,48(sp)
    80003558:	02813483          	ld	s1,40(sp)
    8000355c:	02013903          	ld	s2,32(sp)
    80003560:	01813983          	ld	s3,24(sp)
    80003564:	01013a03          	ld	s4,16(sp)
    80003568:	00813a83          	ld	s5,8(sp)
    8000356c:	00013b03          	ld	s6,0(sp)
    80003570:	04010113          	addi	sp,sp,64
    80003574:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80003578:	00098593          	mv	a1,s3
    8000357c:	00005797          	auipc	a5,0x5
    80003580:	b447b783          	ld	a5,-1212(a5) # 800080c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003584:	0007b503          	ld	a0,0(a5)
    80003588:	00000097          	auipc	ra,0x0
    8000358c:	844080e7          	jalr	-1980(ra) # 80002dcc <_ZN11HeapManager12heapAllocateEm>
                break;
    80003590:	fa9ff06f          	j	80003538 <exceptionHandler+0xf8>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    80003594:	00098593          	mv	a1,s3
    80003598:	00005797          	auipc	a5,0x5
    8000359c:	b287b783          	ld	a5,-1240(a5) # 800080c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800035a0:	0007b503          	ld	a0,0(a5)
    800035a4:	00000097          	auipc	ra,0x0
    800035a8:	e80080e7          	jalr	-384(ra) # 80003424 <_ZN11HeapManager8heapFreeEPv>
                break;
    800035ac:	f8dff06f          	j	80003538 <exceptionHandler+0xf8>
                __putc('\0'); /// removing this line causes everything to break
    800035b0:	00000513          	li	a0,0
    800035b4:	00003097          	auipc	ra,0x3
    800035b8:	9b8080e7          	jalr	-1608(ra) # 80005f6c <__putc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    800035bc:	00100713          	li	a4,1
    800035c0:	000b0693          	mv	a3,s6
    800035c4:	000a8613          	mv	a2,s5
    800035c8:	000a0593          	mv	a1,s4
    800035cc:	00098513          	mv	a0,s3
    800035d0:	fffff097          	auipc	ra,0xfffff
    800035d4:	ed0080e7          	jalr	-304(ra) # 800024a0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    800035d8:	f61ff06f          	j	80003538 <exceptionHandler+0xf8>
                returnVal = _thread::currentThread->exit();
    800035dc:	fffff097          	auipc	ra,0xfffff
    800035e0:	248080e7          	jalr	584(ra) # 80002824 <_ZN7_thread4exitEv>
                break;
    800035e4:	f55ff06f          	j	80003538 <exceptionHandler+0xf8>
                _thread::dispatch();
    800035e8:	fffff097          	auipc	ra,0xfffff
    800035ec:	44c080e7          	jalr	1100(ra) # 80002a34 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    800035f0:	00000513          	li	a0,0
                break;
    800035f4:	f45ff06f          	j	80003538 <exceptionHandler+0xf8>
                _thread::currentThread->join((thread_t)a1);
    800035f8:	00098593          	mv	a1,s3
    800035fc:	00005797          	auipc	a5,0x5
    80003600:	ae47b783          	ld	a5,-1308(a5) # 800080e0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003604:	0007b503          	ld	a0,0(a5)
    80003608:	fffff097          	auipc	ra,0xfffff
    8000360c:	068080e7          	jalr	104(ra) # 80002670 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80003610:	00000513          	li	a0,0
                break;
    80003614:	f25ff06f          	j	80003538 <exceptionHandler+0xf8>
                _sem::open((sem_t*)a1, unsigned(a2));
    80003618:	000a059b          	sext.w	a1,s4
    8000361c:	00098513          	mv	a0,s3
    80003620:	ffffe097          	auipc	ra,0xffffe
    80003624:	fe0080e7          	jalr	-32(ra) # 80001600 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80003628:	00000513          	li	a0,0
                break;
    8000362c:	f0dff06f          	j	80003538 <exceptionHandler+0xf8>
                _sem::close((sem_t)a1);
    80003630:	00098513          	mv	a0,s3
    80003634:	ffffe097          	auipc	ra,0xffffe
    80003638:	028080e7          	jalr	40(ra) # 8000165c <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    8000363c:	00000513          	li	a0,0
                break;
    80003640:	ef9ff06f          	j	80003538 <exceptionHandler+0xf8>
                _sem::wait((sem_t)a1);
    80003644:	00098513          	mv	a0,s3
    80003648:	ffffe097          	auipc	ra,0xffffe
    8000364c:	074080e7          	jalr	116(ra) # 800016bc <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    80003650:	00000513          	li	a0,0
                break;
    80003654:	ee5ff06f          	j	80003538 <exceptionHandler+0xf8>
                _sem::signal((sem_t)a1);
    80003658:	00098513          	mv	a0,s3
    8000365c:	ffffe097          	auipc	ra,0xffffe
    80003660:	104080e7          	jalr	260(ra) # 80001760 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80003664:	00000513          	li	a0,0
                break;
    80003668:	ed1ff06f          	j	80003538 <exceptionHandler+0xf8>
                returnVal = Timer::getInstance().sleep(a1);
    8000366c:	ffffe097          	auipc	ra,0xffffe
    80003670:	b4c080e7          	jalr	-1204(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    80003674:	00098593          	mv	a1,s3
    80003678:	ffffe097          	auipc	ra,0xffffe
    8000367c:	c44080e7          	jalr	-956(ra) # 800012bc <_ZN5Timer5sleepEm>
                break;
    80003680:	eb9ff06f          	j	80003538 <exceptionHandler+0xf8>
                returnVal = __getc();
    80003684:	00003097          	auipc	ra,0x3
    80003688:	924080e7          	jalr	-1756(ra) # 80005fa8 <__getc>
                break;
    8000368c:	eadff06f          	j	80003538 <exceptionHandler+0xf8>
                __putc(a1);
    80003690:	0ff9f513          	andi	a0,s3,255
    80003694:	00003097          	auipc	ra,0x3
    80003698:	8d8080e7          	jalr	-1832(ra) # 80005f6c <__putc>
    uint64 returnVal = 0;
    8000369c:	00000513          	li	a0,0
                break;
    800036a0:	e99ff06f          	j	80003538 <exceptionHandler+0xf8>
        switch(a0){
    800036a4:	00000513          	li	a0,0
    800036a8:	e91ff06f          	j	80003538 <exceptionHandler+0xf8>
    800036ac:	00000513          	li	a0,0
    800036b0:	e89ff06f          	j	80003538 <exceptionHandler+0xf8>
        __putc('\n');
    800036b4:	00a00513          	li	a0,10
    800036b8:	00003097          	auipc	ra,0x3
    800036bc:	8b4080e7          	jalr	-1868(ra) # 80005f6c <__putc>
        __putc('E');
    800036c0:	04500513          	li	a0,69
    800036c4:	00003097          	auipc	ra,0x3
    800036c8:	8a8080e7          	jalr	-1880(ra) # 80005f6c <__putc>
        __putc('r');
    800036cc:	07200513          	li	a0,114
    800036d0:	00003097          	auipc	ra,0x3
    800036d4:	89c080e7          	jalr	-1892(ra) # 80005f6c <__putc>
        __putc('r');
    800036d8:	07200513          	li	a0,114
    800036dc:	00003097          	auipc	ra,0x3
    800036e0:	890080e7          	jalr	-1904(ra) # 80005f6c <__putc>
        __putc('o');
    800036e4:	06f00513          	li	a0,111
    800036e8:	00003097          	auipc	ra,0x3
    800036ec:	884080e7          	jalr	-1916(ra) # 80005f6c <__putc>
        __putc('r');
    800036f0:	07200513          	li	a0,114
    800036f4:	00003097          	auipc	ra,0x3
    800036f8:	878080e7          	jalr	-1928(ra) # 80005f6c <__putc>
        __putc(':');
    800036fc:	03a00513          	li	a0,58
    80003700:	00003097          	auipc	ra,0x3
    80003704:	86c080e7          	jalr	-1940(ra) # 80005f6c <__putc>
        __putc(' ');
    80003708:	02000513          	li	a0,32
    8000370c:	00003097          	auipc	ra,0x3
    80003710:	860080e7          	jalr	-1952(ra) # 80005f6c <__putc>
        __putc('i');
    80003714:	06900513          	li	a0,105
    80003718:	00003097          	auipc	ra,0x3
    8000371c:	854080e7          	jalr	-1964(ra) # 80005f6c <__putc>
        __putc('l');
    80003720:	06c00513          	li	a0,108
    80003724:	00003097          	auipc	ra,0x3
    80003728:	848080e7          	jalr	-1976(ra) # 80005f6c <__putc>
        __putc('l');
    8000372c:	06c00513          	li	a0,108
    80003730:	00003097          	auipc	ra,0x3
    80003734:	83c080e7          	jalr	-1988(ra) # 80005f6c <__putc>
        __putc('e');
    80003738:	06500513          	li	a0,101
    8000373c:	00003097          	auipc	ra,0x3
    80003740:	830080e7          	jalr	-2000(ra) # 80005f6c <__putc>
        __putc('g');
    80003744:	06700513          	li	a0,103
    80003748:	00003097          	auipc	ra,0x3
    8000374c:	824080e7          	jalr	-2012(ra) # 80005f6c <__putc>
        __putc('a');
    80003750:	06100513          	li	a0,97
    80003754:	00003097          	auipc	ra,0x3
    80003758:	818080e7          	jalr	-2024(ra) # 80005f6c <__putc>
        __putc('l');
    8000375c:	06c00513          	li	a0,108
    80003760:	00003097          	auipc	ra,0x3
    80003764:	80c080e7          	jalr	-2036(ra) # 80005f6c <__putc>
        __putc(' ');
    80003768:	02000513          	li	a0,32
    8000376c:	00003097          	auipc	ra,0x3
    80003770:	800080e7          	jalr	-2048(ra) # 80005f6c <__putc>
        __putc('r');
    80003774:	07200513          	li	a0,114
    80003778:	00002097          	auipc	ra,0x2
    8000377c:	7f4080e7          	jalr	2036(ra) # 80005f6c <__putc>
        __putc('e');
    80003780:	06500513          	li	a0,101
    80003784:	00002097          	auipc	ra,0x2
    80003788:	7e8080e7          	jalr	2024(ra) # 80005f6c <__putc>
        __putc('a');
    8000378c:	06100513          	li	a0,97
    80003790:	00002097          	auipc	ra,0x2
    80003794:	7dc080e7          	jalr	2012(ra) # 80005f6c <__putc>
        __putc('d');
    80003798:	06400513          	li	a0,100
    8000379c:	00002097          	auipc	ra,0x2
    800037a0:	7d0080e7          	jalr	2000(ra) # 80005f6c <__putc>
        __putc('!');
    800037a4:	02100513          	li	a0,33
    800037a8:	00002097          	auipc	ra,0x2
    800037ac:	7c4080e7          	jalr	1988(ra) # 80005f6c <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    800037b0:	14102973          	csrr	s2,sepc
        __putc('\n');
    800037b4:	00a00513          	li	a0,10
    800037b8:	00002097          	auipc	ra,0x2
    800037bc:	7b4080e7          	jalr	1972(ra) # 80005f6c <__putc>
        __putc('P');
    800037c0:	05000513          	li	a0,80
    800037c4:	00002097          	auipc	ra,0x2
    800037c8:	7a8080e7          	jalr	1960(ra) # 80005f6c <__putc>
        __putc('C');
    800037cc:	04300513          	li	a0,67
    800037d0:	00002097          	auipc	ra,0x2
    800037d4:	79c080e7          	jalr	1948(ra) # 80005f6c <__putc>
        __putc(':');
    800037d8:	03a00513          	li	a0,58
    800037dc:	00002097          	auipc	ra,0x2
    800037e0:	790080e7          	jalr	1936(ra) # 80005f6c <__putc>
        __putc(' ');
    800037e4:	02000513          	li	a0,32
    800037e8:	00002097          	auipc	ra,0x2
    800037ec:	784080e7          	jalr	1924(ra) # 80005f6c <__putc>
        __putc('0');
    800037f0:	03000513          	li	a0,48
    800037f4:	00002097          	auipc	ra,0x2
    800037f8:	778080e7          	jalr	1912(ra) # 80005f6c <__putc>
        __putc('x');
    800037fc:	07800513          	li	a0,120
    80003800:	00002097          	auipc	ra,0x2
    80003804:	76c080e7          	jalr	1900(ra) # 80005f6c <__putc>
        for(int i = 15; i >= 0; i--){
    80003808:	00f00493          	li	s1,15
    8000380c:	0140006f          	j	80003820 <exceptionHandler+0x3e0>
                __putc('A' + tmp - 10);
    80003810:	03750513          	addi	a0,a0,55
    80003814:	00002097          	auipc	ra,0x2
    80003818:	758080e7          	jalr	1880(ra) # 80005f6c <__putc>
        for(int i = 15; i >= 0; i--){
    8000381c:	fff4849b          	addiw	s1,s1,-1
    80003820:	0204c463          	bltz	s1,80003848 <exceptionHandler+0x408>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    80003824:	0024951b          	slliw	a0,s1,0x2
    80003828:	00a95533          	srl	a0,s2,a0
    8000382c:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80003830:	00900793          	li	a5,9
    80003834:	fca7eee3          	bltu	a5,a0,80003810 <exceptionHandler+0x3d0>
                __putc('0' + tmp);
    80003838:	03050513          	addi	a0,a0,48
    8000383c:	00002097          	auipc	ra,0x2
    80003840:	730080e7          	jalr	1840(ra) # 80005f6c <__putc>
    80003844:	fd9ff06f          	j	8000381c <exceptionHandler+0x3dc>
        assert(false);
    80003848:	00004697          	auipc	a3,0x4
    8000384c:	98868693          	addi	a3,a3,-1656 # 800071d0 <CONSOLE_STATUS+0x1c0>
    80003850:	08600613          	li	a2,134
    80003854:	00004597          	auipc	a1,0x4
    80003858:	99458593          	addi	a1,a1,-1644 # 800071e8 <CONSOLE_STATUS+0x1d8>
    8000385c:	00004517          	auipc	a0,0x4
    80003860:	9ac50513          	addi	a0,a0,-1620 # 80007208 <CONSOLE_STATUS+0x1f8>
    80003864:	ffffe097          	auipc	ra,0xffffe
    80003868:	038080e7          	jalr	56(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    8000386c:	ce5ff06f          	j	80003550 <exceptionHandler+0x110>
        __putc('\n');
    80003870:	00a00513          	li	a0,10
    80003874:	00002097          	auipc	ra,0x2
    80003878:	6f8080e7          	jalr	1784(ra) # 80005f6c <__putc>
        __putc('E');
    8000387c:	04500513          	li	a0,69
    80003880:	00002097          	auipc	ra,0x2
    80003884:	6ec080e7          	jalr	1772(ra) # 80005f6c <__putc>
        __putc('r');
    80003888:	07200513          	li	a0,114
    8000388c:	00002097          	auipc	ra,0x2
    80003890:	6e0080e7          	jalr	1760(ra) # 80005f6c <__putc>
        __putc('r');
    80003894:	07200513          	li	a0,114
    80003898:	00002097          	auipc	ra,0x2
    8000389c:	6d4080e7          	jalr	1748(ra) # 80005f6c <__putc>
        __putc('o');
    800038a0:	06f00513          	li	a0,111
    800038a4:	00002097          	auipc	ra,0x2
    800038a8:	6c8080e7          	jalr	1736(ra) # 80005f6c <__putc>
        __putc('r');
    800038ac:	07200513          	li	a0,114
    800038b0:	00002097          	auipc	ra,0x2
    800038b4:	6bc080e7          	jalr	1724(ra) # 80005f6c <__putc>
        __putc(':');
    800038b8:	03a00513          	li	a0,58
    800038bc:	00002097          	auipc	ra,0x2
    800038c0:	6b0080e7          	jalr	1712(ra) # 80005f6c <__putc>
        __putc(' ');
    800038c4:	02000513          	li	a0,32
    800038c8:	00002097          	auipc	ra,0x2
    800038cc:	6a4080e7          	jalr	1700(ra) # 80005f6c <__putc>
        __putc('i');
    800038d0:	06900513          	li	a0,105
    800038d4:	00002097          	auipc	ra,0x2
    800038d8:	698080e7          	jalr	1688(ra) # 80005f6c <__putc>
        __putc('l');
    800038dc:	06c00513          	li	a0,108
    800038e0:	00002097          	auipc	ra,0x2
    800038e4:	68c080e7          	jalr	1676(ra) # 80005f6c <__putc>
        __putc('l');
    800038e8:	06c00513          	li	a0,108
    800038ec:	00002097          	auipc	ra,0x2
    800038f0:	680080e7          	jalr	1664(ra) # 80005f6c <__putc>
        __putc('e');
    800038f4:	06500513          	li	a0,101
    800038f8:	00002097          	auipc	ra,0x2
    800038fc:	674080e7          	jalr	1652(ra) # 80005f6c <__putc>
        __putc('g');
    80003900:	06700513          	li	a0,103
    80003904:	00002097          	auipc	ra,0x2
    80003908:	668080e7          	jalr	1640(ra) # 80005f6c <__putc>
        __putc('a');
    8000390c:	06100513          	li	a0,97
    80003910:	00002097          	auipc	ra,0x2
    80003914:	65c080e7          	jalr	1628(ra) # 80005f6c <__putc>
        __putc('l');
    80003918:	06c00513          	li	a0,108
    8000391c:	00002097          	auipc	ra,0x2
    80003920:	650080e7          	jalr	1616(ra) # 80005f6c <__putc>
        __putc(' ');
    80003924:	02000513          	li	a0,32
    80003928:	00002097          	auipc	ra,0x2
    8000392c:	644080e7          	jalr	1604(ra) # 80005f6c <__putc>
        __putc('w');
    80003930:	07700513          	li	a0,119
    80003934:	00002097          	auipc	ra,0x2
    80003938:	638080e7          	jalr	1592(ra) # 80005f6c <__putc>
        __putc('r');
    8000393c:	07200513          	li	a0,114
    80003940:	00002097          	auipc	ra,0x2
    80003944:	62c080e7          	jalr	1580(ra) # 80005f6c <__putc>
        __putc('i');
    80003948:	06900513          	li	a0,105
    8000394c:	00002097          	auipc	ra,0x2
    80003950:	620080e7          	jalr	1568(ra) # 80005f6c <__putc>
        __putc('t');
    80003954:	07400513          	li	a0,116
    80003958:	00002097          	auipc	ra,0x2
    8000395c:	614080e7          	jalr	1556(ra) # 80005f6c <__putc>
        __putc('e');
    80003960:	06500513          	li	a0,101
    80003964:	00002097          	auipc	ra,0x2
    80003968:	608080e7          	jalr	1544(ra) # 80005f6c <__putc>
        __putc('!');
    8000396c:	02100513          	li	a0,33
    80003970:	00002097          	auipc	ra,0x2
    80003974:	5fc080e7          	jalr	1532(ra) # 80005f6c <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80003978:	14102973          	csrr	s2,sepc
        __putc('\n');
    8000397c:	00a00513          	li	a0,10
    80003980:	00002097          	auipc	ra,0x2
    80003984:	5ec080e7          	jalr	1516(ra) # 80005f6c <__putc>
        __putc('P');
    80003988:	05000513          	li	a0,80
    8000398c:	00002097          	auipc	ra,0x2
    80003990:	5e0080e7          	jalr	1504(ra) # 80005f6c <__putc>
        __putc('C');
    80003994:	04300513          	li	a0,67
    80003998:	00002097          	auipc	ra,0x2
    8000399c:	5d4080e7          	jalr	1492(ra) # 80005f6c <__putc>
        __putc(':');
    800039a0:	03a00513          	li	a0,58
    800039a4:	00002097          	auipc	ra,0x2
    800039a8:	5c8080e7          	jalr	1480(ra) # 80005f6c <__putc>
        __putc(' ');
    800039ac:	02000513          	li	a0,32
    800039b0:	00002097          	auipc	ra,0x2
    800039b4:	5bc080e7          	jalr	1468(ra) # 80005f6c <__putc>
        __putc('0');
    800039b8:	03000513          	li	a0,48
    800039bc:	00002097          	auipc	ra,0x2
    800039c0:	5b0080e7          	jalr	1456(ra) # 80005f6c <__putc>
        __putc('x');
    800039c4:	07800513          	li	a0,120
    800039c8:	00002097          	auipc	ra,0x2
    800039cc:	5a4080e7          	jalr	1444(ra) # 80005f6c <__putc>
        for(int i = 15; i >= 0; i--){
    800039d0:	00f00493          	li	s1,15
    800039d4:	0140006f          	j	800039e8 <exceptionHandler+0x5a8>
                __putc('A' + tmp - 10);
    800039d8:	03750513          	addi	a0,a0,55
    800039dc:	00002097          	auipc	ra,0x2
    800039e0:	590080e7          	jalr	1424(ra) # 80005f6c <__putc>
        for(int i = 15; i >= 0; i--){
    800039e4:	fff4849b          	addiw	s1,s1,-1
    800039e8:	0204c463          	bltz	s1,80003a10 <exceptionHandler+0x5d0>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    800039ec:	0024951b          	slliw	a0,s1,0x2
    800039f0:	00a95533          	srl	a0,s2,a0
    800039f4:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    800039f8:	00900793          	li	a5,9
    800039fc:	fca7eee3          	bltu	a5,a0,800039d8 <exceptionHandler+0x598>
                __putc('0' + tmp);
    80003a00:	03050513          	addi	a0,a0,48
    80003a04:	00002097          	auipc	ra,0x2
    80003a08:	568080e7          	jalr	1384(ra) # 80005f6c <__putc>
    80003a0c:	fd9ff06f          	j	800039e4 <exceptionHandler+0x5a4>
        assert(false);
    80003a10:	00003697          	auipc	a3,0x3
    80003a14:	7c068693          	addi	a3,a3,1984 # 800071d0 <CONSOLE_STATUS+0x1c0>
    80003a18:	0b000613          	li	a2,176
    80003a1c:	00003597          	auipc	a1,0x3
    80003a20:	7cc58593          	addi	a1,a1,1996 # 800071e8 <CONSOLE_STATUS+0x1d8>
    80003a24:	00003517          	auipc	a0,0x3
    80003a28:	7e450513          	addi	a0,a0,2020 # 80007208 <CONSOLE_STATUS+0x1f8>
    80003a2c:	ffffe097          	auipc	ra,0xffffe
    80003a30:	e70080e7          	jalr	-400(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80003a34:	b1dff06f          	j	80003550 <exceptionHandler+0x110>
        Timer::getInstance().tick();
    80003a38:	ffffd097          	auipc	ra,0xffffd
    80003a3c:	780080e7          	jalr	1920(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    80003a40:	ffffd097          	auipc	ra,0xffffd
    80003a44:	7dc080e7          	jalr	2012(ra) # 8000121c <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    80003a48:	00004797          	auipc	a5,0x4
    80003a4c:	6987b783          	ld	a5,1688(a5) # 800080e0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003a50:	0007b503          	ld	a0,0(a5)
    80003a54:	fffff097          	auipc	ra,0xfffff
    80003a58:	d40080e7          	jalr	-704(ra) # 80002794 <_ZN7_thread4tickEv>
    80003a5c:	00051c63          	bnez	a0,80003a74 <exceptionHandler+0x634>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80003a60:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003a64:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003a68:	00200793          	li	a5,2
    80003a6c:	1447b073          	csrc	sip,a5
    80003a70:	ae1ff06f          	j	80003550 <exceptionHandler+0x110>
        assert(_thread::currentThread->tick() == 0);
    80003a74:	00003697          	auipc	a3,0x3
    80003a78:	75c68693          	addi	a3,a3,1884 # 800071d0 <CONSOLE_STATUS+0x1c0>
    80003a7c:	0b400613          	li	a2,180
    80003a80:	00003597          	auipc	a1,0x3
    80003a84:	76858593          	addi	a1,a1,1896 # 800071e8 <CONSOLE_STATUS+0x1d8>
    80003a88:	00003517          	auipc	a0,0x3
    80003a8c:	78850513          	addi	a0,a0,1928 # 80007210 <CONSOLE_STATUS+0x200>
    80003a90:	ffffe097          	auipc	ra,0xffffe
    80003a94:	e0c080e7          	jalr	-500(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80003a98:	fc9ff06f          	j	80003a60 <exceptionHandler+0x620>

0000000080003a9c <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80003a9c:	fe010113          	addi	sp,sp,-32
    80003aa0:	00113c23          	sd	ra,24(sp)
    80003aa4:	00813823          	sd	s0,16(sp)
    80003aa8:	00913423          	sd	s1,8(sp)
    80003aac:	02010413          	addi	s0,sp,32
    80003ab0:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80003ab4:	00004797          	auipc	a5,0x4
    80003ab8:	6c47b783          	ld	a5,1732(a5) # 80008178 <_ZN9Scheduler9singletonE>
    80003abc:	02079463          	bnez	a5,80003ae4 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80003ac0:	00004797          	auipc	a5,0x4
    80003ac4:	6a97bc23          	sd	s1,1720(a5) # 80008178 <_ZN9Scheduler9singletonE>
    head = 0;
    80003ac8:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80003acc:	0004b423          	sd	zero,8(s1)
}
    80003ad0:	01813083          	ld	ra,24(sp)
    80003ad4:	01013403          	ld	s0,16(sp)
    80003ad8:	00813483          	ld	s1,8(sp)
    80003adc:	02010113          	addi	sp,sp,32
    80003ae0:	00008067          	ret
    assert(singleton == 0);
    80003ae4:	00004697          	auipc	a3,0x4
    80003ae8:	85c68693          	addi	a3,a3,-1956 # 80007340 <CONSOLE_STATUS+0x330>
    80003aec:	01800613          	li	a2,24
    80003af0:	00004597          	auipc	a1,0x4
    80003af4:	86858593          	addi	a1,a1,-1944 # 80007358 <CONSOLE_STATUS+0x348>
    80003af8:	00004517          	auipc	a0,0x4
    80003afc:	87050513          	addi	a0,a0,-1936 # 80007368 <CONSOLE_STATUS+0x358>
    80003b00:	ffffe097          	auipc	ra,0xffffe
    80003b04:	d9c080e7          	jalr	-612(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80003b08:	fb9ff06f          	j	80003ac0 <_ZN9SchedulerC1Ev+0x24>

0000000080003b0c <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80003b0c:	ff010113          	addi	sp,sp,-16
    80003b10:	00813423          	sd	s0,8(sp)
    80003b14:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80003b18:	00004797          	auipc	a5,0x4
    80003b1c:	6607b783          	ld	a5,1632(a5) # 80008178 <_ZN9Scheduler9singletonE>
    80003b20:	0007b503          	ld	a0,0(a5)
}
    80003b24:	00153513          	seqz	a0,a0
    80003b28:	00813403          	ld	s0,8(sp)
    80003b2c:	01010113          	addi	sp,sp,16
    80003b30:	00008067          	ret

0000000080003b34 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80003b34:	fe010113          	addi	sp,sp,-32
    80003b38:	00113c23          	sd	ra,24(sp)
    80003b3c:	00813823          	sd	s0,16(sp)
    80003b40:	00913423          	sd	s1,8(sp)
    80003b44:	01213023          	sd	s2,0(sp)
    80003b48:	02010413          	addi	s0,sp,32
    80003b4c:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80003b50:	00004917          	auipc	s2,0x4
    80003b54:	62893903          	ld	s2,1576(s2) # 80008178 <_ZN9Scheduler9singletonE>
    80003b58:	00093783          	ld	a5,0(s2)
    80003b5c:	12078c63          	beqz	a5,80003c94 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003b60:	00893903          	ld	s2,8(s2)
    80003b64:	01000513          	li	a0,16
    80003b68:	ffffe097          	auipc	ra,0xffffe
    80003b6c:	828080e7          	jalr	-2008(ra) # 80001390 <_Z9mem_allocm>
    80003b70:	00a90423          	sb	a0,8(s2)
    80003b74:	00855793          	srli	a5,a0,0x8
    80003b78:	00f904a3          	sb	a5,9(s2)
    80003b7c:	01055793          	srli	a5,a0,0x10
    80003b80:	00f90523          	sb	a5,10(s2)
    80003b84:	0185579b          	srliw	a5,a0,0x18
    80003b88:	00f905a3          	sb	a5,11(s2)
    80003b8c:	02055793          	srli	a5,a0,0x20
    80003b90:	00f90623          	sb	a5,12(s2)
    80003b94:	02855793          	srli	a5,a0,0x28
    80003b98:	00f906a3          	sb	a5,13(s2)
    80003b9c:	03055793          	srli	a5,a0,0x30
    80003ba0:	00f90723          	sb	a5,14(s2)
    80003ba4:	03855513          	srli	a0,a0,0x38
    80003ba8:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80003bac:	00004617          	auipc	a2,0x4
    80003bb0:	5cc60613          	addi	a2,a2,1484 # 80008178 <_ZN9Scheduler9singletonE>
    80003bb4:	00063583          	ld	a1,0(a2)
    80003bb8:	0085b703          	ld	a4,8(a1)
    80003bbc:	00874783          	lbu	a5,8(a4)
    80003bc0:	00974683          	lbu	a3,9(a4)
    80003bc4:	00869693          	slli	a3,a3,0x8
    80003bc8:	00f6e6b3          	or	a3,a3,a5
    80003bcc:	00a74783          	lbu	a5,10(a4)
    80003bd0:	01079793          	slli	a5,a5,0x10
    80003bd4:	00d7e6b3          	or	a3,a5,a3
    80003bd8:	00b74783          	lbu	a5,11(a4)
    80003bdc:	01879793          	slli	a5,a5,0x18
    80003be0:	00d7e7b3          	or	a5,a5,a3
    80003be4:	00c74683          	lbu	a3,12(a4)
    80003be8:	02069693          	slli	a3,a3,0x20
    80003bec:	00f6e7b3          	or	a5,a3,a5
    80003bf0:	00d74683          	lbu	a3,13(a4)
    80003bf4:	02869693          	slli	a3,a3,0x28
    80003bf8:	00f6e6b3          	or	a3,a3,a5
    80003bfc:	00e74783          	lbu	a5,14(a4)
    80003c00:	03079793          	slli	a5,a5,0x30
    80003c04:	00d7e6b3          	or	a3,a5,a3
    80003c08:	00f74783          	lbu	a5,15(a4)
    80003c0c:	03879793          	slli	a5,a5,0x38
    80003c10:	00d7e7b3          	or	a5,a5,a3
    80003c14:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80003c18:	00978023          	sb	s1,0(a5)
    80003c1c:	0084d713          	srli	a4,s1,0x8
    80003c20:	00e780a3          	sb	a4,1(a5)
    80003c24:	0104d713          	srli	a4,s1,0x10
    80003c28:	00e78123          	sb	a4,2(a5)
    80003c2c:	0184d71b          	srliw	a4,s1,0x18
    80003c30:	00e781a3          	sb	a4,3(a5)
    80003c34:	0204d713          	srli	a4,s1,0x20
    80003c38:	00e78223          	sb	a4,4(a5)
    80003c3c:	0284d713          	srli	a4,s1,0x28
    80003c40:	00e782a3          	sb	a4,5(a5)
    80003c44:	0304d713          	srli	a4,s1,0x30
    80003c48:	00e78323          	sb	a4,6(a5)
    80003c4c:	0384d493          	srli	s1,s1,0x38
    80003c50:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80003c54:	00063783          	ld	a5,0(a2)
    80003c58:	0087b783          	ld	a5,8(a5)
    80003c5c:	00078423          	sb	zero,8(a5)
    80003c60:	000784a3          	sb	zero,9(a5)
    80003c64:	00078523          	sb	zero,10(a5)
    80003c68:	000785a3          	sb	zero,11(a5)
    80003c6c:	00078623          	sb	zero,12(a5)
    80003c70:	000786a3          	sb	zero,13(a5)
    80003c74:	00078723          	sb	zero,14(a5)
    80003c78:	000787a3          	sb	zero,15(a5)
    }
}
    80003c7c:	01813083          	ld	ra,24(sp)
    80003c80:	01013403          	ld	s0,16(sp)
    80003c84:	00813483          	ld	s1,8(sp)
    80003c88:	00013903          	ld	s2,0(sp)
    80003c8c:	02010113          	addi	sp,sp,32
    80003c90:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003c94:	01000513          	li	a0,16
    80003c98:	ffffd097          	auipc	ra,0xffffd
    80003c9c:	6f8080e7          	jalr	1784(ra) # 80001390 <_Z9mem_allocm>
    80003ca0:	00a93423          	sd	a0,8(s2)
    80003ca4:	00004717          	auipc	a4,0x4
    80003ca8:	4d470713          	addi	a4,a4,1236 # 80008178 <_ZN9Scheduler9singletonE>
    80003cac:	00073783          	ld	a5,0(a4)
    80003cb0:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80003cb4:	00073783          	ld	a5,0(a4)
    80003cb8:	0007b783          	ld	a5,0(a5)
    80003cbc:	00978023          	sb	s1,0(a5)
    80003cc0:	0084d693          	srli	a3,s1,0x8
    80003cc4:	00d780a3          	sb	a3,1(a5)
    80003cc8:	0104d693          	srli	a3,s1,0x10
    80003ccc:	00d78123          	sb	a3,2(a5)
    80003cd0:	0184d69b          	srliw	a3,s1,0x18
    80003cd4:	00d781a3          	sb	a3,3(a5)
    80003cd8:	0204d693          	srli	a3,s1,0x20
    80003cdc:	00d78223          	sb	a3,4(a5)
    80003ce0:	0284d693          	srli	a3,s1,0x28
    80003ce4:	00d782a3          	sb	a3,5(a5)
    80003ce8:	0304d693          	srli	a3,s1,0x30
    80003cec:	00d78323          	sb	a3,6(a5)
    80003cf0:	0384d493          	srli	s1,s1,0x38
    80003cf4:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80003cf8:	00073783          	ld	a5,0(a4)
    80003cfc:	0007b783          	ld	a5,0(a5)
    80003d00:	00078423          	sb	zero,8(a5)
    80003d04:	000784a3          	sb	zero,9(a5)
    80003d08:	00078523          	sb	zero,10(a5)
    80003d0c:	000785a3          	sb	zero,11(a5)
    80003d10:	00078623          	sb	zero,12(a5)
    80003d14:	000786a3          	sb	zero,13(a5)
    80003d18:	00078723          	sb	zero,14(a5)
    80003d1c:	000787a3          	sb	zero,15(a5)
    80003d20:	f5dff06f          	j	80003c7c <_ZN9Scheduler3putEP7_thread+0x148>

0000000080003d24 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80003d24:	ff010113          	addi	sp,sp,-16
    80003d28:	00813423          	sd	s0,8(sp)
    80003d2c:	01010413          	addi	s0,sp,16
    ThreadList* tmp = singleton->head;
    80003d30:	00004617          	auipc	a2,0x4
    80003d34:	44863603          	ld	a2,1096(a2) # 80008178 <_ZN9Scheduler9singletonE>
    80003d38:	00063783          	ld	a5,0(a2)
    if(tmp == 0){
    80003d3c:	0c078e63          	beqz	a5,80003e18 <_ZN9Scheduler3getEv+0xf4>
        return 0;
    }
    thread_t thread = tmp->thread;
    80003d40:	0007c503          	lbu	a0,0(a5)
    80003d44:	0017c703          	lbu	a4,1(a5)
    80003d48:	00871713          	slli	a4,a4,0x8
    80003d4c:	00a76733          	or	a4,a4,a0
    80003d50:	0027c503          	lbu	a0,2(a5)
    80003d54:	01051513          	slli	a0,a0,0x10
    80003d58:	00e56733          	or	a4,a0,a4
    80003d5c:	0037c503          	lbu	a0,3(a5)
    80003d60:	01851513          	slli	a0,a0,0x18
    80003d64:	00e56533          	or	a0,a0,a4
    80003d68:	0047c703          	lbu	a4,4(a5)
    80003d6c:	02071713          	slli	a4,a4,0x20
    80003d70:	00a76533          	or	a0,a4,a0
    80003d74:	0057c703          	lbu	a4,5(a5)
    80003d78:	02871713          	slli	a4,a4,0x28
    80003d7c:	00a76733          	or	a4,a4,a0
    80003d80:	0067c503          	lbu	a0,6(a5)
    80003d84:	03051513          	slli	a0,a0,0x30
    80003d88:	00e56733          	or	a4,a0,a4
    80003d8c:	0077c503          	lbu	a0,7(a5)
    80003d90:	03851513          	slli	a0,a0,0x38
    80003d94:	00e56533          	or	a0,a0,a4
    singleton->head = tmp->next;
    80003d98:	0087c683          	lbu	a3,8(a5)
    80003d9c:	0097c703          	lbu	a4,9(a5)
    80003da0:	00871713          	slli	a4,a4,0x8
    80003da4:	00d766b3          	or	a3,a4,a3
    80003da8:	00a7c703          	lbu	a4,10(a5)
    80003dac:	01071713          	slli	a4,a4,0x10
    80003db0:	00d76733          	or	a4,a4,a3
    80003db4:	00b7c683          	lbu	a3,11(a5)
    80003db8:	01869693          	slli	a3,a3,0x18
    80003dbc:	00e6e733          	or	a4,a3,a4
    80003dc0:	00c7c683          	lbu	a3,12(a5)
    80003dc4:	02069693          	slli	a3,a3,0x20
    80003dc8:	00e6e6b3          	or	a3,a3,a4
    80003dcc:	00d7c703          	lbu	a4,13(a5)
    80003dd0:	02871713          	slli	a4,a4,0x28
    80003dd4:	00d766b3          	or	a3,a4,a3
    80003dd8:	00e7c703          	lbu	a4,14(a5)
    80003ddc:	03071713          	slli	a4,a4,0x30
    80003de0:	00d76733          	or	a4,a4,a3
    80003de4:	00f7c783          	lbu	a5,15(a5)
    80003de8:	03879793          	slli	a5,a5,0x38
    80003dec:	00e7e7b3          	or	a5,a5,a4
    80003df0:	00f63023          	sd	a5,0(a2)
    if(singleton->head == 0){
    80003df4:	00004797          	auipc	a5,0x4
    80003df8:	3847b783          	ld	a5,900(a5) # 80008178 <_ZN9Scheduler9singletonE>
    80003dfc:	0007b703          	ld	a4,0(a5)
    80003e00:	00070863          	beqz	a4,80003e10 <_ZN9Scheduler3getEv+0xec>
        singleton->tail = 0;
    }
    // mem_free(tmp);
    return thread;
}
    80003e04:	00813403          	ld	s0,8(sp)
    80003e08:	01010113          	addi	sp,sp,16
    80003e0c:	00008067          	ret
        singleton->tail = 0;
    80003e10:	0007b423          	sd	zero,8(a5)
    80003e14:	ff1ff06f          	j	80003e04 <_ZN9Scheduler3getEv+0xe0>
        return 0;
    80003e18:	00078513          	mv	a0,a5
    80003e1c:	fe9ff06f          	j	80003e04 <_ZN9Scheduler3getEv+0xe0>

0000000080003e20 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80003e20:	ff010113          	addi	sp,sp,-16
    80003e24:	00813423          	sd	s0,8(sp)
    80003e28:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80003e2c:	00004797          	auipc	a5,0x4
    80003e30:	34c7b783          	ld	a5,844(a5) # 80008178 <_ZN9Scheduler9singletonE>
    80003e34:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80003e38:	00000513          	li	a0,0
    while(tmp != 0){
    80003e3c:	06078263          	beqz	a5,80003ea0 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80003e40:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80003e44:	0087c683          	lbu	a3,8(a5)
    80003e48:	0097c703          	lbu	a4,9(a5)
    80003e4c:	00871713          	slli	a4,a4,0x8
    80003e50:	00d766b3          	or	a3,a4,a3
    80003e54:	00a7c703          	lbu	a4,10(a5)
    80003e58:	01071713          	slli	a4,a4,0x10
    80003e5c:	00d76733          	or	a4,a4,a3
    80003e60:	00b7c683          	lbu	a3,11(a5)
    80003e64:	01869693          	slli	a3,a3,0x18
    80003e68:	00e6e733          	or	a4,a3,a4
    80003e6c:	00c7c683          	lbu	a3,12(a5)
    80003e70:	02069693          	slli	a3,a3,0x20
    80003e74:	00e6e6b3          	or	a3,a3,a4
    80003e78:	00d7c703          	lbu	a4,13(a5)
    80003e7c:	02871713          	slli	a4,a4,0x28
    80003e80:	00d766b3          	or	a3,a4,a3
    80003e84:	00e7c703          	lbu	a4,14(a5)
    80003e88:	03071713          	slli	a4,a4,0x30
    80003e8c:	00d76733          	or	a4,a4,a3
    80003e90:	00f7c783          	lbu	a5,15(a5)
    80003e94:	03879793          	slli	a5,a5,0x38
    80003e98:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80003e9c:	fa1ff06f          	j	80003e3c <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80003ea0:	00813403          	ld	s0,8(sp)
    80003ea4:	01010113          	addi	sp,sp,16
    80003ea8:	00008067          	ret

0000000080003eac <start>:
    80003eac:	ff010113          	addi	sp,sp,-16
    80003eb0:	00813423          	sd	s0,8(sp)
    80003eb4:	01010413          	addi	s0,sp,16
    80003eb8:	300027f3          	csrr	a5,mstatus
    80003ebc:	ffffe737          	lui	a4,0xffffe
    80003ec0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff540f>
    80003ec4:	00e7f7b3          	and	a5,a5,a4
    80003ec8:	00001737          	lui	a4,0x1
    80003ecc:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003ed0:	00e7e7b3          	or	a5,a5,a4
    80003ed4:	30079073          	csrw	mstatus,a5
    80003ed8:	00000797          	auipc	a5,0x0
    80003edc:	16078793          	addi	a5,a5,352 # 80004038 <system_main>
    80003ee0:	34179073          	csrw	mepc,a5
    80003ee4:	00000793          	li	a5,0
    80003ee8:	18079073          	csrw	satp,a5
    80003eec:	000107b7          	lui	a5,0x10
    80003ef0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003ef4:	30279073          	csrw	medeleg,a5
    80003ef8:	30379073          	csrw	mideleg,a5
    80003efc:	104027f3          	csrr	a5,sie
    80003f00:	2227e793          	ori	a5,a5,546
    80003f04:	10479073          	csrw	sie,a5
    80003f08:	fff00793          	li	a5,-1
    80003f0c:	00a7d793          	srli	a5,a5,0xa
    80003f10:	3b079073          	csrw	pmpaddr0,a5
    80003f14:	00f00793          	li	a5,15
    80003f18:	3a079073          	csrw	pmpcfg0,a5
    80003f1c:	f14027f3          	csrr	a5,mhartid
    80003f20:	0200c737          	lui	a4,0x200c
    80003f24:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003f28:	0007869b          	sext.w	a3,a5
    80003f2c:	00269713          	slli	a4,a3,0x2
    80003f30:	000f4637          	lui	a2,0xf4
    80003f34:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003f38:	00d70733          	add	a4,a4,a3
    80003f3c:	0037979b          	slliw	a5,a5,0x3
    80003f40:	020046b7          	lui	a3,0x2004
    80003f44:	00d787b3          	add	a5,a5,a3
    80003f48:	00c585b3          	add	a1,a1,a2
    80003f4c:	00371693          	slli	a3,a4,0x3
    80003f50:	00004717          	auipc	a4,0x4
    80003f54:	24070713          	addi	a4,a4,576 # 80008190 <timer_scratch>
    80003f58:	00b7b023          	sd	a1,0(a5)
    80003f5c:	00d70733          	add	a4,a4,a3
    80003f60:	00f73c23          	sd	a5,24(a4)
    80003f64:	02c73023          	sd	a2,32(a4)
    80003f68:	34071073          	csrw	mscratch,a4
    80003f6c:	00000797          	auipc	a5,0x0
    80003f70:	6e478793          	addi	a5,a5,1764 # 80004650 <timervec>
    80003f74:	30579073          	csrw	mtvec,a5
    80003f78:	300027f3          	csrr	a5,mstatus
    80003f7c:	0087e793          	ori	a5,a5,8
    80003f80:	30079073          	csrw	mstatus,a5
    80003f84:	304027f3          	csrr	a5,mie
    80003f88:	0807e793          	ori	a5,a5,128
    80003f8c:	30479073          	csrw	mie,a5
    80003f90:	f14027f3          	csrr	a5,mhartid
    80003f94:	0007879b          	sext.w	a5,a5
    80003f98:	00078213          	mv	tp,a5
    80003f9c:	30200073          	mret
    80003fa0:	00813403          	ld	s0,8(sp)
    80003fa4:	01010113          	addi	sp,sp,16
    80003fa8:	00008067          	ret

0000000080003fac <timerinit>:
    80003fac:	ff010113          	addi	sp,sp,-16
    80003fb0:	00813423          	sd	s0,8(sp)
    80003fb4:	01010413          	addi	s0,sp,16
    80003fb8:	f14027f3          	csrr	a5,mhartid
    80003fbc:	0200c737          	lui	a4,0x200c
    80003fc0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003fc4:	0007869b          	sext.w	a3,a5
    80003fc8:	00269713          	slli	a4,a3,0x2
    80003fcc:	000f4637          	lui	a2,0xf4
    80003fd0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003fd4:	00d70733          	add	a4,a4,a3
    80003fd8:	0037979b          	slliw	a5,a5,0x3
    80003fdc:	020046b7          	lui	a3,0x2004
    80003fe0:	00d787b3          	add	a5,a5,a3
    80003fe4:	00c585b3          	add	a1,a1,a2
    80003fe8:	00371693          	slli	a3,a4,0x3
    80003fec:	00004717          	auipc	a4,0x4
    80003ff0:	1a470713          	addi	a4,a4,420 # 80008190 <timer_scratch>
    80003ff4:	00b7b023          	sd	a1,0(a5)
    80003ff8:	00d70733          	add	a4,a4,a3
    80003ffc:	00f73c23          	sd	a5,24(a4)
    80004000:	02c73023          	sd	a2,32(a4)
    80004004:	34071073          	csrw	mscratch,a4
    80004008:	00000797          	auipc	a5,0x0
    8000400c:	64878793          	addi	a5,a5,1608 # 80004650 <timervec>
    80004010:	30579073          	csrw	mtvec,a5
    80004014:	300027f3          	csrr	a5,mstatus
    80004018:	0087e793          	ori	a5,a5,8
    8000401c:	30079073          	csrw	mstatus,a5
    80004020:	304027f3          	csrr	a5,mie
    80004024:	0807e793          	ori	a5,a5,128
    80004028:	30479073          	csrw	mie,a5
    8000402c:	00813403          	ld	s0,8(sp)
    80004030:	01010113          	addi	sp,sp,16
    80004034:	00008067          	ret

0000000080004038 <system_main>:
    80004038:	fe010113          	addi	sp,sp,-32
    8000403c:	00813823          	sd	s0,16(sp)
    80004040:	00913423          	sd	s1,8(sp)
    80004044:	00113c23          	sd	ra,24(sp)
    80004048:	02010413          	addi	s0,sp,32
    8000404c:	00000097          	auipc	ra,0x0
    80004050:	0c4080e7          	jalr	196(ra) # 80004110 <cpuid>
    80004054:	00004497          	auipc	s1,0x4
    80004058:	0ac48493          	addi	s1,s1,172 # 80008100 <started>
    8000405c:	02050263          	beqz	a0,80004080 <system_main+0x48>
    80004060:	0004a783          	lw	a5,0(s1)
    80004064:	0007879b          	sext.w	a5,a5
    80004068:	fe078ce3          	beqz	a5,80004060 <system_main+0x28>
    8000406c:	0ff0000f          	fence
    80004070:	00003517          	auipc	a0,0x3
    80004074:	33850513          	addi	a0,a0,824 # 800073a8 <CONSOLE_STATUS+0x398>
    80004078:	00001097          	auipc	ra,0x1
    8000407c:	a74080e7          	jalr	-1420(ra) # 80004aec <panic>
    80004080:	00001097          	auipc	ra,0x1
    80004084:	9c8080e7          	jalr	-1592(ra) # 80004a48 <consoleinit>
    80004088:	00001097          	auipc	ra,0x1
    8000408c:	154080e7          	jalr	340(ra) # 800051dc <printfinit>
    80004090:	00003517          	auipc	a0,0x3
    80004094:	3f850513          	addi	a0,a0,1016 # 80007488 <CONSOLE_STATUS+0x478>
    80004098:	00001097          	auipc	ra,0x1
    8000409c:	ab0080e7          	jalr	-1360(ra) # 80004b48 <__printf>
    800040a0:	00003517          	auipc	a0,0x3
    800040a4:	2d850513          	addi	a0,a0,728 # 80007378 <CONSOLE_STATUS+0x368>
    800040a8:	00001097          	auipc	ra,0x1
    800040ac:	aa0080e7          	jalr	-1376(ra) # 80004b48 <__printf>
    800040b0:	00003517          	auipc	a0,0x3
    800040b4:	3d850513          	addi	a0,a0,984 # 80007488 <CONSOLE_STATUS+0x478>
    800040b8:	00001097          	auipc	ra,0x1
    800040bc:	a90080e7          	jalr	-1392(ra) # 80004b48 <__printf>
    800040c0:	00001097          	auipc	ra,0x1
    800040c4:	4a8080e7          	jalr	1192(ra) # 80005568 <kinit>
    800040c8:	00000097          	auipc	ra,0x0
    800040cc:	148080e7          	jalr	328(ra) # 80004210 <trapinit>
    800040d0:	00000097          	auipc	ra,0x0
    800040d4:	16c080e7          	jalr	364(ra) # 8000423c <trapinithart>
    800040d8:	00000097          	auipc	ra,0x0
    800040dc:	5b8080e7          	jalr	1464(ra) # 80004690 <plicinit>
    800040e0:	00000097          	auipc	ra,0x0
    800040e4:	5d8080e7          	jalr	1496(ra) # 800046b8 <plicinithart>
    800040e8:	00000097          	auipc	ra,0x0
    800040ec:	078080e7          	jalr	120(ra) # 80004160 <userinit>
    800040f0:	0ff0000f          	fence
    800040f4:	00100793          	li	a5,1
    800040f8:	00003517          	auipc	a0,0x3
    800040fc:	29850513          	addi	a0,a0,664 # 80007390 <CONSOLE_STATUS+0x380>
    80004100:	00f4a023          	sw	a5,0(s1)
    80004104:	00001097          	auipc	ra,0x1
    80004108:	a44080e7          	jalr	-1468(ra) # 80004b48 <__printf>
    8000410c:	0000006f          	j	8000410c <system_main+0xd4>

0000000080004110 <cpuid>:
    80004110:	ff010113          	addi	sp,sp,-16
    80004114:	00813423          	sd	s0,8(sp)
    80004118:	01010413          	addi	s0,sp,16
    8000411c:	00020513          	mv	a0,tp
    80004120:	00813403          	ld	s0,8(sp)
    80004124:	0005051b          	sext.w	a0,a0
    80004128:	01010113          	addi	sp,sp,16
    8000412c:	00008067          	ret

0000000080004130 <mycpu>:
    80004130:	ff010113          	addi	sp,sp,-16
    80004134:	00813423          	sd	s0,8(sp)
    80004138:	01010413          	addi	s0,sp,16
    8000413c:	00020793          	mv	a5,tp
    80004140:	00813403          	ld	s0,8(sp)
    80004144:	0007879b          	sext.w	a5,a5
    80004148:	00779793          	slli	a5,a5,0x7
    8000414c:	00005517          	auipc	a0,0x5
    80004150:	07450513          	addi	a0,a0,116 # 800091c0 <cpus>
    80004154:	00f50533          	add	a0,a0,a5
    80004158:	01010113          	addi	sp,sp,16
    8000415c:	00008067          	ret

0000000080004160 <userinit>:
    80004160:	ff010113          	addi	sp,sp,-16
    80004164:	00813423          	sd	s0,8(sp)
    80004168:	01010413          	addi	s0,sp,16
    8000416c:	00813403          	ld	s0,8(sp)
    80004170:	01010113          	addi	sp,sp,16
    80004174:	ffffd317          	auipc	t1,0xffffd
    80004178:	66c30067          	jr	1644(t1) # 800017e0 <main>

000000008000417c <either_copyout>:
    8000417c:	ff010113          	addi	sp,sp,-16
    80004180:	00813023          	sd	s0,0(sp)
    80004184:	00113423          	sd	ra,8(sp)
    80004188:	01010413          	addi	s0,sp,16
    8000418c:	02051663          	bnez	a0,800041b8 <either_copyout+0x3c>
    80004190:	00058513          	mv	a0,a1
    80004194:	00060593          	mv	a1,a2
    80004198:	0006861b          	sext.w	a2,a3
    8000419c:	00002097          	auipc	ra,0x2
    800041a0:	c58080e7          	jalr	-936(ra) # 80005df4 <__memmove>
    800041a4:	00813083          	ld	ra,8(sp)
    800041a8:	00013403          	ld	s0,0(sp)
    800041ac:	00000513          	li	a0,0
    800041b0:	01010113          	addi	sp,sp,16
    800041b4:	00008067          	ret
    800041b8:	00003517          	auipc	a0,0x3
    800041bc:	21850513          	addi	a0,a0,536 # 800073d0 <CONSOLE_STATUS+0x3c0>
    800041c0:	00001097          	auipc	ra,0x1
    800041c4:	92c080e7          	jalr	-1748(ra) # 80004aec <panic>

00000000800041c8 <either_copyin>:
    800041c8:	ff010113          	addi	sp,sp,-16
    800041cc:	00813023          	sd	s0,0(sp)
    800041d0:	00113423          	sd	ra,8(sp)
    800041d4:	01010413          	addi	s0,sp,16
    800041d8:	02059463          	bnez	a1,80004200 <either_copyin+0x38>
    800041dc:	00060593          	mv	a1,a2
    800041e0:	0006861b          	sext.w	a2,a3
    800041e4:	00002097          	auipc	ra,0x2
    800041e8:	c10080e7          	jalr	-1008(ra) # 80005df4 <__memmove>
    800041ec:	00813083          	ld	ra,8(sp)
    800041f0:	00013403          	ld	s0,0(sp)
    800041f4:	00000513          	li	a0,0
    800041f8:	01010113          	addi	sp,sp,16
    800041fc:	00008067          	ret
    80004200:	00003517          	auipc	a0,0x3
    80004204:	1f850513          	addi	a0,a0,504 # 800073f8 <CONSOLE_STATUS+0x3e8>
    80004208:	00001097          	auipc	ra,0x1
    8000420c:	8e4080e7          	jalr	-1820(ra) # 80004aec <panic>

0000000080004210 <trapinit>:
    80004210:	ff010113          	addi	sp,sp,-16
    80004214:	00813423          	sd	s0,8(sp)
    80004218:	01010413          	addi	s0,sp,16
    8000421c:	00813403          	ld	s0,8(sp)
    80004220:	00003597          	auipc	a1,0x3
    80004224:	20058593          	addi	a1,a1,512 # 80007420 <CONSOLE_STATUS+0x410>
    80004228:	00005517          	auipc	a0,0x5
    8000422c:	01850513          	addi	a0,a0,24 # 80009240 <tickslock>
    80004230:	01010113          	addi	sp,sp,16
    80004234:	00001317          	auipc	t1,0x1
    80004238:	5c430067          	jr	1476(t1) # 800057f8 <initlock>

000000008000423c <trapinithart>:
    8000423c:	ff010113          	addi	sp,sp,-16
    80004240:	00813423          	sd	s0,8(sp)
    80004244:	01010413          	addi	s0,sp,16
    80004248:	00000797          	auipc	a5,0x0
    8000424c:	2f878793          	addi	a5,a5,760 # 80004540 <kernelvec>
    80004250:	10579073          	csrw	stvec,a5
    80004254:	00813403          	ld	s0,8(sp)
    80004258:	01010113          	addi	sp,sp,16
    8000425c:	00008067          	ret

0000000080004260 <usertrap>:
    80004260:	ff010113          	addi	sp,sp,-16
    80004264:	00813423          	sd	s0,8(sp)
    80004268:	01010413          	addi	s0,sp,16
    8000426c:	00813403          	ld	s0,8(sp)
    80004270:	01010113          	addi	sp,sp,16
    80004274:	00008067          	ret

0000000080004278 <usertrapret>:
    80004278:	ff010113          	addi	sp,sp,-16
    8000427c:	00813423          	sd	s0,8(sp)
    80004280:	01010413          	addi	s0,sp,16
    80004284:	00813403          	ld	s0,8(sp)
    80004288:	01010113          	addi	sp,sp,16
    8000428c:	00008067          	ret

0000000080004290 <kerneltrap>:
    80004290:	fe010113          	addi	sp,sp,-32
    80004294:	00813823          	sd	s0,16(sp)
    80004298:	00113c23          	sd	ra,24(sp)
    8000429c:	00913423          	sd	s1,8(sp)
    800042a0:	02010413          	addi	s0,sp,32
    800042a4:	142025f3          	csrr	a1,scause
    800042a8:	100027f3          	csrr	a5,sstatus
    800042ac:	0027f793          	andi	a5,a5,2
    800042b0:	10079c63          	bnez	a5,800043c8 <kerneltrap+0x138>
    800042b4:	142027f3          	csrr	a5,scause
    800042b8:	0207ce63          	bltz	a5,800042f4 <kerneltrap+0x64>
    800042bc:	00003517          	auipc	a0,0x3
    800042c0:	1ac50513          	addi	a0,a0,428 # 80007468 <CONSOLE_STATUS+0x458>
    800042c4:	00001097          	auipc	ra,0x1
    800042c8:	884080e7          	jalr	-1916(ra) # 80004b48 <__printf>
    800042cc:	141025f3          	csrr	a1,sepc
    800042d0:	14302673          	csrr	a2,stval
    800042d4:	00003517          	auipc	a0,0x3
    800042d8:	1a450513          	addi	a0,a0,420 # 80007478 <CONSOLE_STATUS+0x468>
    800042dc:	00001097          	auipc	ra,0x1
    800042e0:	86c080e7          	jalr	-1940(ra) # 80004b48 <__printf>
    800042e4:	00003517          	auipc	a0,0x3
    800042e8:	1ac50513          	addi	a0,a0,428 # 80007490 <CONSOLE_STATUS+0x480>
    800042ec:	00001097          	auipc	ra,0x1
    800042f0:	800080e7          	jalr	-2048(ra) # 80004aec <panic>
    800042f4:	0ff7f713          	andi	a4,a5,255
    800042f8:	00900693          	li	a3,9
    800042fc:	04d70063          	beq	a4,a3,8000433c <kerneltrap+0xac>
    80004300:	fff00713          	li	a4,-1
    80004304:	03f71713          	slli	a4,a4,0x3f
    80004308:	00170713          	addi	a4,a4,1
    8000430c:	fae798e3          	bne	a5,a4,800042bc <kerneltrap+0x2c>
    80004310:	00000097          	auipc	ra,0x0
    80004314:	e00080e7          	jalr	-512(ra) # 80004110 <cpuid>
    80004318:	06050663          	beqz	a0,80004384 <kerneltrap+0xf4>
    8000431c:	144027f3          	csrr	a5,sip
    80004320:	ffd7f793          	andi	a5,a5,-3
    80004324:	14479073          	csrw	sip,a5
    80004328:	01813083          	ld	ra,24(sp)
    8000432c:	01013403          	ld	s0,16(sp)
    80004330:	00813483          	ld	s1,8(sp)
    80004334:	02010113          	addi	sp,sp,32
    80004338:	00008067          	ret
    8000433c:	00000097          	auipc	ra,0x0
    80004340:	3c8080e7          	jalr	968(ra) # 80004704 <plic_claim>
    80004344:	00a00793          	li	a5,10
    80004348:	00050493          	mv	s1,a0
    8000434c:	06f50863          	beq	a0,a5,800043bc <kerneltrap+0x12c>
    80004350:	fc050ce3          	beqz	a0,80004328 <kerneltrap+0x98>
    80004354:	00050593          	mv	a1,a0
    80004358:	00003517          	auipc	a0,0x3
    8000435c:	0f050513          	addi	a0,a0,240 # 80007448 <CONSOLE_STATUS+0x438>
    80004360:	00000097          	auipc	ra,0x0
    80004364:	7e8080e7          	jalr	2024(ra) # 80004b48 <__printf>
    80004368:	01013403          	ld	s0,16(sp)
    8000436c:	01813083          	ld	ra,24(sp)
    80004370:	00048513          	mv	a0,s1
    80004374:	00813483          	ld	s1,8(sp)
    80004378:	02010113          	addi	sp,sp,32
    8000437c:	00000317          	auipc	t1,0x0
    80004380:	3c030067          	jr	960(t1) # 8000473c <plic_complete>
    80004384:	00005517          	auipc	a0,0x5
    80004388:	ebc50513          	addi	a0,a0,-324 # 80009240 <tickslock>
    8000438c:	00001097          	auipc	ra,0x1
    80004390:	490080e7          	jalr	1168(ra) # 8000581c <acquire>
    80004394:	00004717          	auipc	a4,0x4
    80004398:	d7070713          	addi	a4,a4,-656 # 80008104 <ticks>
    8000439c:	00072783          	lw	a5,0(a4)
    800043a0:	00005517          	auipc	a0,0x5
    800043a4:	ea050513          	addi	a0,a0,-352 # 80009240 <tickslock>
    800043a8:	0017879b          	addiw	a5,a5,1
    800043ac:	00f72023          	sw	a5,0(a4)
    800043b0:	00001097          	auipc	ra,0x1
    800043b4:	538080e7          	jalr	1336(ra) # 800058e8 <release>
    800043b8:	f65ff06f          	j	8000431c <kerneltrap+0x8c>
    800043bc:	00001097          	auipc	ra,0x1
    800043c0:	094080e7          	jalr	148(ra) # 80005450 <uartintr>
    800043c4:	fa5ff06f          	j	80004368 <kerneltrap+0xd8>
    800043c8:	00003517          	auipc	a0,0x3
    800043cc:	06050513          	addi	a0,a0,96 # 80007428 <CONSOLE_STATUS+0x418>
    800043d0:	00000097          	auipc	ra,0x0
    800043d4:	71c080e7          	jalr	1820(ra) # 80004aec <panic>

00000000800043d8 <clockintr>:
    800043d8:	fe010113          	addi	sp,sp,-32
    800043dc:	00813823          	sd	s0,16(sp)
    800043e0:	00913423          	sd	s1,8(sp)
    800043e4:	00113c23          	sd	ra,24(sp)
    800043e8:	02010413          	addi	s0,sp,32
    800043ec:	00005497          	auipc	s1,0x5
    800043f0:	e5448493          	addi	s1,s1,-428 # 80009240 <tickslock>
    800043f4:	00048513          	mv	a0,s1
    800043f8:	00001097          	auipc	ra,0x1
    800043fc:	424080e7          	jalr	1060(ra) # 8000581c <acquire>
    80004400:	00004717          	auipc	a4,0x4
    80004404:	d0470713          	addi	a4,a4,-764 # 80008104 <ticks>
    80004408:	00072783          	lw	a5,0(a4)
    8000440c:	01013403          	ld	s0,16(sp)
    80004410:	01813083          	ld	ra,24(sp)
    80004414:	00048513          	mv	a0,s1
    80004418:	0017879b          	addiw	a5,a5,1
    8000441c:	00813483          	ld	s1,8(sp)
    80004420:	00f72023          	sw	a5,0(a4)
    80004424:	02010113          	addi	sp,sp,32
    80004428:	00001317          	auipc	t1,0x1
    8000442c:	4c030067          	jr	1216(t1) # 800058e8 <release>

0000000080004430 <devintr>:
    80004430:	142027f3          	csrr	a5,scause
    80004434:	00000513          	li	a0,0
    80004438:	0007c463          	bltz	a5,80004440 <devintr+0x10>
    8000443c:	00008067          	ret
    80004440:	fe010113          	addi	sp,sp,-32
    80004444:	00813823          	sd	s0,16(sp)
    80004448:	00113c23          	sd	ra,24(sp)
    8000444c:	00913423          	sd	s1,8(sp)
    80004450:	02010413          	addi	s0,sp,32
    80004454:	0ff7f713          	andi	a4,a5,255
    80004458:	00900693          	li	a3,9
    8000445c:	04d70c63          	beq	a4,a3,800044b4 <devintr+0x84>
    80004460:	fff00713          	li	a4,-1
    80004464:	03f71713          	slli	a4,a4,0x3f
    80004468:	00170713          	addi	a4,a4,1
    8000446c:	00e78c63          	beq	a5,a4,80004484 <devintr+0x54>
    80004470:	01813083          	ld	ra,24(sp)
    80004474:	01013403          	ld	s0,16(sp)
    80004478:	00813483          	ld	s1,8(sp)
    8000447c:	02010113          	addi	sp,sp,32
    80004480:	00008067          	ret
    80004484:	00000097          	auipc	ra,0x0
    80004488:	c8c080e7          	jalr	-884(ra) # 80004110 <cpuid>
    8000448c:	06050663          	beqz	a0,800044f8 <devintr+0xc8>
    80004490:	144027f3          	csrr	a5,sip
    80004494:	ffd7f793          	andi	a5,a5,-3
    80004498:	14479073          	csrw	sip,a5
    8000449c:	01813083          	ld	ra,24(sp)
    800044a0:	01013403          	ld	s0,16(sp)
    800044a4:	00813483          	ld	s1,8(sp)
    800044a8:	00200513          	li	a0,2
    800044ac:	02010113          	addi	sp,sp,32
    800044b0:	00008067          	ret
    800044b4:	00000097          	auipc	ra,0x0
    800044b8:	250080e7          	jalr	592(ra) # 80004704 <plic_claim>
    800044bc:	00a00793          	li	a5,10
    800044c0:	00050493          	mv	s1,a0
    800044c4:	06f50663          	beq	a0,a5,80004530 <devintr+0x100>
    800044c8:	00100513          	li	a0,1
    800044cc:	fa0482e3          	beqz	s1,80004470 <devintr+0x40>
    800044d0:	00048593          	mv	a1,s1
    800044d4:	00003517          	auipc	a0,0x3
    800044d8:	f7450513          	addi	a0,a0,-140 # 80007448 <CONSOLE_STATUS+0x438>
    800044dc:	00000097          	auipc	ra,0x0
    800044e0:	66c080e7          	jalr	1644(ra) # 80004b48 <__printf>
    800044e4:	00048513          	mv	a0,s1
    800044e8:	00000097          	auipc	ra,0x0
    800044ec:	254080e7          	jalr	596(ra) # 8000473c <plic_complete>
    800044f0:	00100513          	li	a0,1
    800044f4:	f7dff06f          	j	80004470 <devintr+0x40>
    800044f8:	00005517          	auipc	a0,0x5
    800044fc:	d4850513          	addi	a0,a0,-696 # 80009240 <tickslock>
    80004500:	00001097          	auipc	ra,0x1
    80004504:	31c080e7          	jalr	796(ra) # 8000581c <acquire>
    80004508:	00004717          	auipc	a4,0x4
    8000450c:	bfc70713          	addi	a4,a4,-1028 # 80008104 <ticks>
    80004510:	00072783          	lw	a5,0(a4)
    80004514:	00005517          	auipc	a0,0x5
    80004518:	d2c50513          	addi	a0,a0,-724 # 80009240 <tickslock>
    8000451c:	0017879b          	addiw	a5,a5,1
    80004520:	00f72023          	sw	a5,0(a4)
    80004524:	00001097          	auipc	ra,0x1
    80004528:	3c4080e7          	jalr	964(ra) # 800058e8 <release>
    8000452c:	f65ff06f          	j	80004490 <devintr+0x60>
    80004530:	00001097          	auipc	ra,0x1
    80004534:	f20080e7          	jalr	-224(ra) # 80005450 <uartintr>
    80004538:	fadff06f          	j	800044e4 <devintr+0xb4>
    8000453c:	0000                	unimp
	...

0000000080004540 <kernelvec>:
    80004540:	f0010113          	addi	sp,sp,-256
    80004544:	00113023          	sd	ra,0(sp)
    80004548:	00213423          	sd	sp,8(sp)
    8000454c:	00313823          	sd	gp,16(sp)
    80004550:	00413c23          	sd	tp,24(sp)
    80004554:	02513023          	sd	t0,32(sp)
    80004558:	02613423          	sd	t1,40(sp)
    8000455c:	02713823          	sd	t2,48(sp)
    80004560:	02813c23          	sd	s0,56(sp)
    80004564:	04913023          	sd	s1,64(sp)
    80004568:	04a13423          	sd	a0,72(sp)
    8000456c:	04b13823          	sd	a1,80(sp)
    80004570:	04c13c23          	sd	a2,88(sp)
    80004574:	06d13023          	sd	a3,96(sp)
    80004578:	06e13423          	sd	a4,104(sp)
    8000457c:	06f13823          	sd	a5,112(sp)
    80004580:	07013c23          	sd	a6,120(sp)
    80004584:	09113023          	sd	a7,128(sp)
    80004588:	09213423          	sd	s2,136(sp)
    8000458c:	09313823          	sd	s3,144(sp)
    80004590:	09413c23          	sd	s4,152(sp)
    80004594:	0b513023          	sd	s5,160(sp)
    80004598:	0b613423          	sd	s6,168(sp)
    8000459c:	0b713823          	sd	s7,176(sp)
    800045a0:	0b813c23          	sd	s8,184(sp)
    800045a4:	0d913023          	sd	s9,192(sp)
    800045a8:	0da13423          	sd	s10,200(sp)
    800045ac:	0db13823          	sd	s11,208(sp)
    800045b0:	0dc13c23          	sd	t3,216(sp)
    800045b4:	0fd13023          	sd	t4,224(sp)
    800045b8:	0fe13423          	sd	t5,232(sp)
    800045bc:	0ff13823          	sd	t6,240(sp)
    800045c0:	cd1ff0ef          	jal	ra,80004290 <kerneltrap>
    800045c4:	00013083          	ld	ra,0(sp)
    800045c8:	00813103          	ld	sp,8(sp)
    800045cc:	01013183          	ld	gp,16(sp)
    800045d0:	02013283          	ld	t0,32(sp)
    800045d4:	02813303          	ld	t1,40(sp)
    800045d8:	03013383          	ld	t2,48(sp)
    800045dc:	03813403          	ld	s0,56(sp)
    800045e0:	04013483          	ld	s1,64(sp)
    800045e4:	04813503          	ld	a0,72(sp)
    800045e8:	05013583          	ld	a1,80(sp)
    800045ec:	05813603          	ld	a2,88(sp)
    800045f0:	06013683          	ld	a3,96(sp)
    800045f4:	06813703          	ld	a4,104(sp)
    800045f8:	07013783          	ld	a5,112(sp)
    800045fc:	07813803          	ld	a6,120(sp)
    80004600:	08013883          	ld	a7,128(sp)
    80004604:	08813903          	ld	s2,136(sp)
    80004608:	09013983          	ld	s3,144(sp)
    8000460c:	09813a03          	ld	s4,152(sp)
    80004610:	0a013a83          	ld	s5,160(sp)
    80004614:	0a813b03          	ld	s6,168(sp)
    80004618:	0b013b83          	ld	s7,176(sp)
    8000461c:	0b813c03          	ld	s8,184(sp)
    80004620:	0c013c83          	ld	s9,192(sp)
    80004624:	0c813d03          	ld	s10,200(sp)
    80004628:	0d013d83          	ld	s11,208(sp)
    8000462c:	0d813e03          	ld	t3,216(sp)
    80004630:	0e013e83          	ld	t4,224(sp)
    80004634:	0e813f03          	ld	t5,232(sp)
    80004638:	0f013f83          	ld	t6,240(sp)
    8000463c:	10010113          	addi	sp,sp,256
    80004640:	10200073          	sret
    80004644:	00000013          	nop
    80004648:	00000013          	nop
    8000464c:	00000013          	nop

0000000080004650 <timervec>:
    80004650:	34051573          	csrrw	a0,mscratch,a0
    80004654:	00b53023          	sd	a1,0(a0)
    80004658:	00c53423          	sd	a2,8(a0)
    8000465c:	00d53823          	sd	a3,16(a0)
    80004660:	01853583          	ld	a1,24(a0)
    80004664:	02053603          	ld	a2,32(a0)
    80004668:	0005b683          	ld	a3,0(a1)
    8000466c:	00c686b3          	add	a3,a3,a2
    80004670:	00d5b023          	sd	a3,0(a1)
    80004674:	00200593          	li	a1,2
    80004678:	14459073          	csrw	sip,a1
    8000467c:	01053683          	ld	a3,16(a0)
    80004680:	00853603          	ld	a2,8(a0)
    80004684:	00053583          	ld	a1,0(a0)
    80004688:	34051573          	csrrw	a0,mscratch,a0
    8000468c:	30200073          	mret

0000000080004690 <plicinit>:
    80004690:	ff010113          	addi	sp,sp,-16
    80004694:	00813423          	sd	s0,8(sp)
    80004698:	01010413          	addi	s0,sp,16
    8000469c:	00813403          	ld	s0,8(sp)
    800046a0:	0c0007b7          	lui	a5,0xc000
    800046a4:	00100713          	li	a4,1
    800046a8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800046ac:	00e7a223          	sw	a4,4(a5)
    800046b0:	01010113          	addi	sp,sp,16
    800046b4:	00008067          	ret

00000000800046b8 <plicinithart>:
    800046b8:	ff010113          	addi	sp,sp,-16
    800046bc:	00813023          	sd	s0,0(sp)
    800046c0:	00113423          	sd	ra,8(sp)
    800046c4:	01010413          	addi	s0,sp,16
    800046c8:	00000097          	auipc	ra,0x0
    800046cc:	a48080e7          	jalr	-1464(ra) # 80004110 <cpuid>
    800046d0:	0085171b          	slliw	a4,a0,0x8
    800046d4:	0c0027b7          	lui	a5,0xc002
    800046d8:	00e787b3          	add	a5,a5,a4
    800046dc:	40200713          	li	a4,1026
    800046e0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800046e4:	00813083          	ld	ra,8(sp)
    800046e8:	00013403          	ld	s0,0(sp)
    800046ec:	00d5151b          	slliw	a0,a0,0xd
    800046f0:	0c2017b7          	lui	a5,0xc201
    800046f4:	00a78533          	add	a0,a5,a0
    800046f8:	00052023          	sw	zero,0(a0)
    800046fc:	01010113          	addi	sp,sp,16
    80004700:	00008067          	ret

0000000080004704 <plic_claim>:
    80004704:	ff010113          	addi	sp,sp,-16
    80004708:	00813023          	sd	s0,0(sp)
    8000470c:	00113423          	sd	ra,8(sp)
    80004710:	01010413          	addi	s0,sp,16
    80004714:	00000097          	auipc	ra,0x0
    80004718:	9fc080e7          	jalr	-1540(ra) # 80004110 <cpuid>
    8000471c:	00813083          	ld	ra,8(sp)
    80004720:	00013403          	ld	s0,0(sp)
    80004724:	00d5151b          	slliw	a0,a0,0xd
    80004728:	0c2017b7          	lui	a5,0xc201
    8000472c:	00a78533          	add	a0,a5,a0
    80004730:	00452503          	lw	a0,4(a0)
    80004734:	01010113          	addi	sp,sp,16
    80004738:	00008067          	ret

000000008000473c <plic_complete>:
    8000473c:	fe010113          	addi	sp,sp,-32
    80004740:	00813823          	sd	s0,16(sp)
    80004744:	00913423          	sd	s1,8(sp)
    80004748:	00113c23          	sd	ra,24(sp)
    8000474c:	02010413          	addi	s0,sp,32
    80004750:	00050493          	mv	s1,a0
    80004754:	00000097          	auipc	ra,0x0
    80004758:	9bc080e7          	jalr	-1604(ra) # 80004110 <cpuid>
    8000475c:	01813083          	ld	ra,24(sp)
    80004760:	01013403          	ld	s0,16(sp)
    80004764:	00d5179b          	slliw	a5,a0,0xd
    80004768:	0c201737          	lui	a4,0xc201
    8000476c:	00f707b3          	add	a5,a4,a5
    80004770:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004774:	00813483          	ld	s1,8(sp)
    80004778:	02010113          	addi	sp,sp,32
    8000477c:	00008067          	ret

0000000080004780 <consolewrite>:
    80004780:	fb010113          	addi	sp,sp,-80
    80004784:	04813023          	sd	s0,64(sp)
    80004788:	04113423          	sd	ra,72(sp)
    8000478c:	02913c23          	sd	s1,56(sp)
    80004790:	03213823          	sd	s2,48(sp)
    80004794:	03313423          	sd	s3,40(sp)
    80004798:	03413023          	sd	s4,32(sp)
    8000479c:	01513c23          	sd	s5,24(sp)
    800047a0:	05010413          	addi	s0,sp,80
    800047a4:	06c05c63          	blez	a2,8000481c <consolewrite+0x9c>
    800047a8:	00060993          	mv	s3,a2
    800047ac:	00050a13          	mv	s4,a0
    800047b0:	00058493          	mv	s1,a1
    800047b4:	00000913          	li	s2,0
    800047b8:	fff00a93          	li	s5,-1
    800047bc:	01c0006f          	j	800047d8 <consolewrite+0x58>
    800047c0:	fbf44503          	lbu	a0,-65(s0)
    800047c4:	0019091b          	addiw	s2,s2,1
    800047c8:	00148493          	addi	s1,s1,1
    800047cc:	00001097          	auipc	ra,0x1
    800047d0:	a9c080e7          	jalr	-1380(ra) # 80005268 <uartputc>
    800047d4:	03298063          	beq	s3,s2,800047f4 <consolewrite+0x74>
    800047d8:	00048613          	mv	a2,s1
    800047dc:	00100693          	li	a3,1
    800047e0:	000a0593          	mv	a1,s4
    800047e4:	fbf40513          	addi	a0,s0,-65
    800047e8:	00000097          	auipc	ra,0x0
    800047ec:	9e0080e7          	jalr	-1568(ra) # 800041c8 <either_copyin>
    800047f0:	fd5518e3          	bne	a0,s5,800047c0 <consolewrite+0x40>
    800047f4:	04813083          	ld	ra,72(sp)
    800047f8:	04013403          	ld	s0,64(sp)
    800047fc:	03813483          	ld	s1,56(sp)
    80004800:	02813983          	ld	s3,40(sp)
    80004804:	02013a03          	ld	s4,32(sp)
    80004808:	01813a83          	ld	s5,24(sp)
    8000480c:	00090513          	mv	a0,s2
    80004810:	03013903          	ld	s2,48(sp)
    80004814:	05010113          	addi	sp,sp,80
    80004818:	00008067          	ret
    8000481c:	00000913          	li	s2,0
    80004820:	fd5ff06f          	j	800047f4 <consolewrite+0x74>

0000000080004824 <consoleread>:
    80004824:	f9010113          	addi	sp,sp,-112
    80004828:	06813023          	sd	s0,96(sp)
    8000482c:	04913c23          	sd	s1,88(sp)
    80004830:	05213823          	sd	s2,80(sp)
    80004834:	05313423          	sd	s3,72(sp)
    80004838:	05413023          	sd	s4,64(sp)
    8000483c:	03513c23          	sd	s5,56(sp)
    80004840:	03613823          	sd	s6,48(sp)
    80004844:	03713423          	sd	s7,40(sp)
    80004848:	03813023          	sd	s8,32(sp)
    8000484c:	06113423          	sd	ra,104(sp)
    80004850:	01913c23          	sd	s9,24(sp)
    80004854:	07010413          	addi	s0,sp,112
    80004858:	00060b93          	mv	s7,a2
    8000485c:	00050913          	mv	s2,a0
    80004860:	00058c13          	mv	s8,a1
    80004864:	00060b1b          	sext.w	s6,a2
    80004868:	00005497          	auipc	s1,0x5
    8000486c:	a0048493          	addi	s1,s1,-1536 # 80009268 <cons>
    80004870:	00400993          	li	s3,4
    80004874:	fff00a13          	li	s4,-1
    80004878:	00a00a93          	li	s5,10
    8000487c:	05705e63          	blez	s7,800048d8 <consoleread+0xb4>
    80004880:	09c4a703          	lw	a4,156(s1)
    80004884:	0984a783          	lw	a5,152(s1)
    80004888:	0007071b          	sext.w	a4,a4
    8000488c:	08e78463          	beq	a5,a4,80004914 <consoleread+0xf0>
    80004890:	07f7f713          	andi	a4,a5,127
    80004894:	00e48733          	add	a4,s1,a4
    80004898:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000489c:	0017869b          	addiw	a3,a5,1
    800048a0:	08d4ac23          	sw	a3,152(s1)
    800048a4:	00070c9b          	sext.w	s9,a4
    800048a8:	0b370663          	beq	a4,s3,80004954 <consoleread+0x130>
    800048ac:	00100693          	li	a3,1
    800048b0:	f9f40613          	addi	a2,s0,-97
    800048b4:	000c0593          	mv	a1,s8
    800048b8:	00090513          	mv	a0,s2
    800048bc:	f8e40fa3          	sb	a4,-97(s0)
    800048c0:	00000097          	auipc	ra,0x0
    800048c4:	8bc080e7          	jalr	-1860(ra) # 8000417c <either_copyout>
    800048c8:	01450863          	beq	a0,s4,800048d8 <consoleread+0xb4>
    800048cc:	001c0c13          	addi	s8,s8,1
    800048d0:	fffb8b9b          	addiw	s7,s7,-1
    800048d4:	fb5c94e3          	bne	s9,s5,8000487c <consoleread+0x58>
    800048d8:	000b851b          	sext.w	a0,s7
    800048dc:	06813083          	ld	ra,104(sp)
    800048e0:	06013403          	ld	s0,96(sp)
    800048e4:	05813483          	ld	s1,88(sp)
    800048e8:	05013903          	ld	s2,80(sp)
    800048ec:	04813983          	ld	s3,72(sp)
    800048f0:	04013a03          	ld	s4,64(sp)
    800048f4:	03813a83          	ld	s5,56(sp)
    800048f8:	02813b83          	ld	s7,40(sp)
    800048fc:	02013c03          	ld	s8,32(sp)
    80004900:	01813c83          	ld	s9,24(sp)
    80004904:	40ab053b          	subw	a0,s6,a0
    80004908:	03013b03          	ld	s6,48(sp)
    8000490c:	07010113          	addi	sp,sp,112
    80004910:	00008067          	ret
    80004914:	00001097          	auipc	ra,0x1
    80004918:	1d8080e7          	jalr	472(ra) # 80005aec <push_on>
    8000491c:	0984a703          	lw	a4,152(s1)
    80004920:	09c4a783          	lw	a5,156(s1)
    80004924:	0007879b          	sext.w	a5,a5
    80004928:	fef70ce3          	beq	a4,a5,80004920 <consoleread+0xfc>
    8000492c:	00001097          	auipc	ra,0x1
    80004930:	234080e7          	jalr	564(ra) # 80005b60 <pop_on>
    80004934:	0984a783          	lw	a5,152(s1)
    80004938:	07f7f713          	andi	a4,a5,127
    8000493c:	00e48733          	add	a4,s1,a4
    80004940:	01874703          	lbu	a4,24(a4)
    80004944:	0017869b          	addiw	a3,a5,1
    80004948:	08d4ac23          	sw	a3,152(s1)
    8000494c:	00070c9b          	sext.w	s9,a4
    80004950:	f5371ee3          	bne	a4,s3,800048ac <consoleread+0x88>
    80004954:	000b851b          	sext.w	a0,s7
    80004958:	f96bf2e3          	bgeu	s7,s6,800048dc <consoleread+0xb8>
    8000495c:	08f4ac23          	sw	a5,152(s1)
    80004960:	f7dff06f          	j	800048dc <consoleread+0xb8>

0000000080004964 <consputc>:
    80004964:	10000793          	li	a5,256
    80004968:	00f50663          	beq	a0,a5,80004974 <consputc+0x10>
    8000496c:	00001317          	auipc	t1,0x1
    80004970:	9f430067          	jr	-1548(t1) # 80005360 <uartputc_sync>
    80004974:	ff010113          	addi	sp,sp,-16
    80004978:	00113423          	sd	ra,8(sp)
    8000497c:	00813023          	sd	s0,0(sp)
    80004980:	01010413          	addi	s0,sp,16
    80004984:	00800513          	li	a0,8
    80004988:	00001097          	auipc	ra,0x1
    8000498c:	9d8080e7          	jalr	-1576(ra) # 80005360 <uartputc_sync>
    80004990:	02000513          	li	a0,32
    80004994:	00001097          	auipc	ra,0x1
    80004998:	9cc080e7          	jalr	-1588(ra) # 80005360 <uartputc_sync>
    8000499c:	00013403          	ld	s0,0(sp)
    800049a0:	00813083          	ld	ra,8(sp)
    800049a4:	00800513          	li	a0,8
    800049a8:	01010113          	addi	sp,sp,16
    800049ac:	00001317          	auipc	t1,0x1
    800049b0:	9b430067          	jr	-1612(t1) # 80005360 <uartputc_sync>

00000000800049b4 <consoleintr>:
    800049b4:	fe010113          	addi	sp,sp,-32
    800049b8:	00813823          	sd	s0,16(sp)
    800049bc:	00913423          	sd	s1,8(sp)
    800049c0:	01213023          	sd	s2,0(sp)
    800049c4:	00113c23          	sd	ra,24(sp)
    800049c8:	02010413          	addi	s0,sp,32
    800049cc:	00005917          	auipc	s2,0x5
    800049d0:	89c90913          	addi	s2,s2,-1892 # 80009268 <cons>
    800049d4:	00050493          	mv	s1,a0
    800049d8:	00090513          	mv	a0,s2
    800049dc:	00001097          	auipc	ra,0x1
    800049e0:	e40080e7          	jalr	-448(ra) # 8000581c <acquire>
    800049e4:	02048c63          	beqz	s1,80004a1c <consoleintr+0x68>
    800049e8:	0a092783          	lw	a5,160(s2)
    800049ec:	09892703          	lw	a4,152(s2)
    800049f0:	07f00693          	li	a3,127
    800049f4:	40e7873b          	subw	a4,a5,a4
    800049f8:	02e6e263          	bltu	a3,a4,80004a1c <consoleintr+0x68>
    800049fc:	00d00713          	li	a4,13
    80004a00:	04e48063          	beq	s1,a4,80004a40 <consoleintr+0x8c>
    80004a04:	07f7f713          	andi	a4,a5,127
    80004a08:	00e90733          	add	a4,s2,a4
    80004a0c:	0017879b          	addiw	a5,a5,1
    80004a10:	0af92023          	sw	a5,160(s2)
    80004a14:	00970c23          	sb	s1,24(a4)
    80004a18:	08f92e23          	sw	a5,156(s2)
    80004a1c:	01013403          	ld	s0,16(sp)
    80004a20:	01813083          	ld	ra,24(sp)
    80004a24:	00813483          	ld	s1,8(sp)
    80004a28:	00013903          	ld	s2,0(sp)
    80004a2c:	00005517          	auipc	a0,0x5
    80004a30:	83c50513          	addi	a0,a0,-1988 # 80009268 <cons>
    80004a34:	02010113          	addi	sp,sp,32
    80004a38:	00001317          	auipc	t1,0x1
    80004a3c:	eb030067          	jr	-336(t1) # 800058e8 <release>
    80004a40:	00a00493          	li	s1,10
    80004a44:	fc1ff06f          	j	80004a04 <consoleintr+0x50>

0000000080004a48 <consoleinit>:
    80004a48:	fe010113          	addi	sp,sp,-32
    80004a4c:	00113c23          	sd	ra,24(sp)
    80004a50:	00813823          	sd	s0,16(sp)
    80004a54:	00913423          	sd	s1,8(sp)
    80004a58:	02010413          	addi	s0,sp,32
    80004a5c:	00005497          	auipc	s1,0x5
    80004a60:	80c48493          	addi	s1,s1,-2036 # 80009268 <cons>
    80004a64:	00048513          	mv	a0,s1
    80004a68:	00003597          	auipc	a1,0x3
    80004a6c:	a3858593          	addi	a1,a1,-1480 # 800074a0 <CONSOLE_STATUS+0x490>
    80004a70:	00001097          	auipc	ra,0x1
    80004a74:	d88080e7          	jalr	-632(ra) # 800057f8 <initlock>
    80004a78:	00000097          	auipc	ra,0x0
    80004a7c:	7ac080e7          	jalr	1964(ra) # 80005224 <uartinit>
    80004a80:	01813083          	ld	ra,24(sp)
    80004a84:	01013403          	ld	s0,16(sp)
    80004a88:	00000797          	auipc	a5,0x0
    80004a8c:	d9c78793          	addi	a5,a5,-612 # 80004824 <consoleread>
    80004a90:	0af4bc23          	sd	a5,184(s1)
    80004a94:	00000797          	auipc	a5,0x0
    80004a98:	cec78793          	addi	a5,a5,-788 # 80004780 <consolewrite>
    80004a9c:	0cf4b023          	sd	a5,192(s1)
    80004aa0:	00813483          	ld	s1,8(sp)
    80004aa4:	02010113          	addi	sp,sp,32
    80004aa8:	00008067          	ret

0000000080004aac <console_read>:
    80004aac:	ff010113          	addi	sp,sp,-16
    80004ab0:	00813423          	sd	s0,8(sp)
    80004ab4:	01010413          	addi	s0,sp,16
    80004ab8:	00813403          	ld	s0,8(sp)
    80004abc:	00005317          	auipc	t1,0x5
    80004ac0:	86433303          	ld	t1,-1948(t1) # 80009320 <devsw+0x10>
    80004ac4:	01010113          	addi	sp,sp,16
    80004ac8:	00030067          	jr	t1

0000000080004acc <console_write>:
    80004acc:	ff010113          	addi	sp,sp,-16
    80004ad0:	00813423          	sd	s0,8(sp)
    80004ad4:	01010413          	addi	s0,sp,16
    80004ad8:	00813403          	ld	s0,8(sp)
    80004adc:	00005317          	auipc	t1,0x5
    80004ae0:	84c33303          	ld	t1,-1972(t1) # 80009328 <devsw+0x18>
    80004ae4:	01010113          	addi	sp,sp,16
    80004ae8:	00030067          	jr	t1

0000000080004aec <panic>:
    80004aec:	fe010113          	addi	sp,sp,-32
    80004af0:	00113c23          	sd	ra,24(sp)
    80004af4:	00813823          	sd	s0,16(sp)
    80004af8:	00913423          	sd	s1,8(sp)
    80004afc:	02010413          	addi	s0,sp,32
    80004b00:	00050493          	mv	s1,a0
    80004b04:	00003517          	auipc	a0,0x3
    80004b08:	9a450513          	addi	a0,a0,-1628 # 800074a8 <CONSOLE_STATUS+0x498>
    80004b0c:	00005797          	auipc	a5,0x5
    80004b10:	8a07ae23          	sw	zero,-1860(a5) # 800093c8 <pr+0x18>
    80004b14:	00000097          	auipc	ra,0x0
    80004b18:	034080e7          	jalr	52(ra) # 80004b48 <__printf>
    80004b1c:	00048513          	mv	a0,s1
    80004b20:	00000097          	auipc	ra,0x0
    80004b24:	028080e7          	jalr	40(ra) # 80004b48 <__printf>
    80004b28:	00003517          	auipc	a0,0x3
    80004b2c:	96050513          	addi	a0,a0,-1696 # 80007488 <CONSOLE_STATUS+0x478>
    80004b30:	00000097          	auipc	ra,0x0
    80004b34:	018080e7          	jalr	24(ra) # 80004b48 <__printf>
    80004b38:	00100793          	li	a5,1
    80004b3c:	00003717          	auipc	a4,0x3
    80004b40:	5cf72623          	sw	a5,1484(a4) # 80008108 <panicked>
    80004b44:	0000006f          	j	80004b44 <panic+0x58>

0000000080004b48 <__printf>:
    80004b48:	f3010113          	addi	sp,sp,-208
    80004b4c:	08813023          	sd	s0,128(sp)
    80004b50:	07313423          	sd	s3,104(sp)
    80004b54:	09010413          	addi	s0,sp,144
    80004b58:	05813023          	sd	s8,64(sp)
    80004b5c:	08113423          	sd	ra,136(sp)
    80004b60:	06913c23          	sd	s1,120(sp)
    80004b64:	07213823          	sd	s2,112(sp)
    80004b68:	07413023          	sd	s4,96(sp)
    80004b6c:	05513c23          	sd	s5,88(sp)
    80004b70:	05613823          	sd	s6,80(sp)
    80004b74:	05713423          	sd	s7,72(sp)
    80004b78:	03913c23          	sd	s9,56(sp)
    80004b7c:	03a13823          	sd	s10,48(sp)
    80004b80:	03b13423          	sd	s11,40(sp)
    80004b84:	00005317          	auipc	t1,0x5
    80004b88:	82c30313          	addi	t1,t1,-2004 # 800093b0 <pr>
    80004b8c:	01832c03          	lw	s8,24(t1)
    80004b90:	00b43423          	sd	a1,8(s0)
    80004b94:	00c43823          	sd	a2,16(s0)
    80004b98:	00d43c23          	sd	a3,24(s0)
    80004b9c:	02e43023          	sd	a4,32(s0)
    80004ba0:	02f43423          	sd	a5,40(s0)
    80004ba4:	03043823          	sd	a6,48(s0)
    80004ba8:	03143c23          	sd	a7,56(s0)
    80004bac:	00050993          	mv	s3,a0
    80004bb0:	4a0c1663          	bnez	s8,8000505c <__printf+0x514>
    80004bb4:	60098c63          	beqz	s3,800051cc <__printf+0x684>
    80004bb8:	0009c503          	lbu	a0,0(s3)
    80004bbc:	00840793          	addi	a5,s0,8
    80004bc0:	f6f43c23          	sd	a5,-136(s0)
    80004bc4:	00000493          	li	s1,0
    80004bc8:	22050063          	beqz	a0,80004de8 <__printf+0x2a0>
    80004bcc:	00002a37          	lui	s4,0x2
    80004bd0:	00018ab7          	lui	s5,0x18
    80004bd4:	000f4b37          	lui	s6,0xf4
    80004bd8:	00989bb7          	lui	s7,0x989
    80004bdc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004be0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004be4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004be8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80004bec:	00148c9b          	addiw	s9,s1,1
    80004bf0:	02500793          	li	a5,37
    80004bf4:	01998933          	add	s2,s3,s9
    80004bf8:	38f51263          	bne	a0,a5,80004f7c <__printf+0x434>
    80004bfc:	00094783          	lbu	a5,0(s2)
    80004c00:	00078c9b          	sext.w	s9,a5
    80004c04:	1e078263          	beqz	a5,80004de8 <__printf+0x2a0>
    80004c08:	0024849b          	addiw	s1,s1,2
    80004c0c:	07000713          	li	a4,112
    80004c10:	00998933          	add	s2,s3,s1
    80004c14:	38e78a63          	beq	a5,a4,80004fa8 <__printf+0x460>
    80004c18:	20f76863          	bltu	a4,a5,80004e28 <__printf+0x2e0>
    80004c1c:	42a78863          	beq	a5,a0,8000504c <__printf+0x504>
    80004c20:	06400713          	li	a4,100
    80004c24:	40e79663          	bne	a5,a4,80005030 <__printf+0x4e8>
    80004c28:	f7843783          	ld	a5,-136(s0)
    80004c2c:	0007a603          	lw	a2,0(a5)
    80004c30:	00878793          	addi	a5,a5,8
    80004c34:	f6f43c23          	sd	a5,-136(s0)
    80004c38:	42064a63          	bltz	a2,8000506c <__printf+0x524>
    80004c3c:	00a00713          	li	a4,10
    80004c40:	02e677bb          	remuw	a5,a2,a4
    80004c44:	00003d97          	auipc	s11,0x3
    80004c48:	88cd8d93          	addi	s11,s11,-1908 # 800074d0 <digits>
    80004c4c:	00900593          	li	a1,9
    80004c50:	0006051b          	sext.w	a0,a2
    80004c54:	00000c93          	li	s9,0
    80004c58:	02079793          	slli	a5,a5,0x20
    80004c5c:	0207d793          	srli	a5,a5,0x20
    80004c60:	00fd87b3          	add	a5,s11,a5
    80004c64:	0007c783          	lbu	a5,0(a5)
    80004c68:	02e656bb          	divuw	a3,a2,a4
    80004c6c:	f8f40023          	sb	a5,-128(s0)
    80004c70:	14c5d863          	bge	a1,a2,80004dc0 <__printf+0x278>
    80004c74:	06300593          	li	a1,99
    80004c78:	00100c93          	li	s9,1
    80004c7c:	02e6f7bb          	remuw	a5,a3,a4
    80004c80:	02079793          	slli	a5,a5,0x20
    80004c84:	0207d793          	srli	a5,a5,0x20
    80004c88:	00fd87b3          	add	a5,s11,a5
    80004c8c:	0007c783          	lbu	a5,0(a5)
    80004c90:	02e6d73b          	divuw	a4,a3,a4
    80004c94:	f8f400a3          	sb	a5,-127(s0)
    80004c98:	12a5f463          	bgeu	a1,a0,80004dc0 <__printf+0x278>
    80004c9c:	00a00693          	li	a3,10
    80004ca0:	00900593          	li	a1,9
    80004ca4:	02d777bb          	remuw	a5,a4,a3
    80004ca8:	02079793          	slli	a5,a5,0x20
    80004cac:	0207d793          	srli	a5,a5,0x20
    80004cb0:	00fd87b3          	add	a5,s11,a5
    80004cb4:	0007c503          	lbu	a0,0(a5)
    80004cb8:	02d757bb          	divuw	a5,a4,a3
    80004cbc:	f8a40123          	sb	a0,-126(s0)
    80004cc0:	48e5f263          	bgeu	a1,a4,80005144 <__printf+0x5fc>
    80004cc4:	06300513          	li	a0,99
    80004cc8:	02d7f5bb          	remuw	a1,a5,a3
    80004ccc:	02059593          	slli	a1,a1,0x20
    80004cd0:	0205d593          	srli	a1,a1,0x20
    80004cd4:	00bd85b3          	add	a1,s11,a1
    80004cd8:	0005c583          	lbu	a1,0(a1)
    80004cdc:	02d7d7bb          	divuw	a5,a5,a3
    80004ce0:	f8b401a3          	sb	a1,-125(s0)
    80004ce4:	48e57263          	bgeu	a0,a4,80005168 <__printf+0x620>
    80004ce8:	3e700513          	li	a0,999
    80004cec:	02d7f5bb          	remuw	a1,a5,a3
    80004cf0:	02059593          	slli	a1,a1,0x20
    80004cf4:	0205d593          	srli	a1,a1,0x20
    80004cf8:	00bd85b3          	add	a1,s11,a1
    80004cfc:	0005c583          	lbu	a1,0(a1)
    80004d00:	02d7d7bb          	divuw	a5,a5,a3
    80004d04:	f8b40223          	sb	a1,-124(s0)
    80004d08:	46e57663          	bgeu	a0,a4,80005174 <__printf+0x62c>
    80004d0c:	02d7f5bb          	remuw	a1,a5,a3
    80004d10:	02059593          	slli	a1,a1,0x20
    80004d14:	0205d593          	srli	a1,a1,0x20
    80004d18:	00bd85b3          	add	a1,s11,a1
    80004d1c:	0005c583          	lbu	a1,0(a1)
    80004d20:	02d7d7bb          	divuw	a5,a5,a3
    80004d24:	f8b402a3          	sb	a1,-123(s0)
    80004d28:	46ea7863          	bgeu	s4,a4,80005198 <__printf+0x650>
    80004d2c:	02d7f5bb          	remuw	a1,a5,a3
    80004d30:	02059593          	slli	a1,a1,0x20
    80004d34:	0205d593          	srli	a1,a1,0x20
    80004d38:	00bd85b3          	add	a1,s11,a1
    80004d3c:	0005c583          	lbu	a1,0(a1)
    80004d40:	02d7d7bb          	divuw	a5,a5,a3
    80004d44:	f8b40323          	sb	a1,-122(s0)
    80004d48:	3eeaf863          	bgeu	s5,a4,80005138 <__printf+0x5f0>
    80004d4c:	02d7f5bb          	remuw	a1,a5,a3
    80004d50:	02059593          	slli	a1,a1,0x20
    80004d54:	0205d593          	srli	a1,a1,0x20
    80004d58:	00bd85b3          	add	a1,s11,a1
    80004d5c:	0005c583          	lbu	a1,0(a1)
    80004d60:	02d7d7bb          	divuw	a5,a5,a3
    80004d64:	f8b403a3          	sb	a1,-121(s0)
    80004d68:	42eb7e63          	bgeu	s6,a4,800051a4 <__printf+0x65c>
    80004d6c:	02d7f5bb          	remuw	a1,a5,a3
    80004d70:	02059593          	slli	a1,a1,0x20
    80004d74:	0205d593          	srli	a1,a1,0x20
    80004d78:	00bd85b3          	add	a1,s11,a1
    80004d7c:	0005c583          	lbu	a1,0(a1)
    80004d80:	02d7d7bb          	divuw	a5,a5,a3
    80004d84:	f8b40423          	sb	a1,-120(s0)
    80004d88:	42ebfc63          	bgeu	s7,a4,800051c0 <__printf+0x678>
    80004d8c:	02079793          	slli	a5,a5,0x20
    80004d90:	0207d793          	srli	a5,a5,0x20
    80004d94:	00fd8db3          	add	s11,s11,a5
    80004d98:	000dc703          	lbu	a4,0(s11)
    80004d9c:	00a00793          	li	a5,10
    80004da0:	00900c93          	li	s9,9
    80004da4:	f8e404a3          	sb	a4,-119(s0)
    80004da8:	00065c63          	bgez	a2,80004dc0 <__printf+0x278>
    80004dac:	f9040713          	addi	a4,s0,-112
    80004db0:	00f70733          	add	a4,a4,a5
    80004db4:	02d00693          	li	a3,45
    80004db8:	fed70823          	sb	a3,-16(a4)
    80004dbc:	00078c93          	mv	s9,a5
    80004dc0:	f8040793          	addi	a5,s0,-128
    80004dc4:	01978cb3          	add	s9,a5,s9
    80004dc8:	f7f40d13          	addi	s10,s0,-129
    80004dcc:	000cc503          	lbu	a0,0(s9)
    80004dd0:	fffc8c93          	addi	s9,s9,-1
    80004dd4:	00000097          	auipc	ra,0x0
    80004dd8:	b90080e7          	jalr	-1136(ra) # 80004964 <consputc>
    80004ddc:	ffac98e3          	bne	s9,s10,80004dcc <__printf+0x284>
    80004de0:	00094503          	lbu	a0,0(s2)
    80004de4:	e00514e3          	bnez	a0,80004bec <__printf+0xa4>
    80004de8:	1a0c1663          	bnez	s8,80004f94 <__printf+0x44c>
    80004dec:	08813083          	ld	ra,136(sp)
    80004df0:	08013403          	ld	s0,128(sp)
    80004df4:	07813483          	ld	s1,120(sp)
    80004df8:	07013903          	ld	s2,112(sp)
    80004dfc:	06813983          	ld	s3,104(sp)
    80004e00:	06013a03          	ld	s4,96(sp)
    80004e04:	05813a83          	ld	s5,88(sp)
    80004e08:	05013b03          	ld	s6,80(sp)
    80004e0c:	04813b83          	ld	s7,72(sp)
    80004e10:	04013c03          	ld	s8,64(sp)
    80004e14:	03813c83          	ld	s9,56(sp)
    80004e18:	03013d03          	ld	s10,48(sp)
    80004e1c:	02813d83          	ld	s11,40(sp)
    80004e20:	0d010113          	addi	sp,sp,208
    80004e24:	00008067          	ret
    80004e28:	07300713          	li	a4,115
    80004e2c:	1ce78a63          	beq	a5,a4,80005000 <__printf+0x4b8>
    80004e30:	07800713          	li	a4,120
    80004e34:	1ee79e63          	bne	a5,a4,80005030 <__printf+0x4e8>
    80004e38:	f7843783          	ld	a5,-136(s0)
    80004e3c:	0007a703          	lw	a4,0(a5)
    80004e40:	00878793          	addi	a5,a5,8
    80004e44:	f6f43c23          	sd	a5,-136(s0)
    80004e48:	28074263          	bltz	a4,800050cc <__printf+0x584>
    80004e4c:	00002d97          	auipc	s11,0x2
    80004e50:	684d8d93          	addi	s11,s11,1668 # 800074d0 <digits>
    80004e54:	00f77793          	andi	a5,a4,15
    80004e58:	00fd87b3          	add	a5,s11,a5
    80004e5c:	0007c683          	lbu	a3,0(a5)
    80004e60:	00f00613          	li	a2,15
    80004e64:	0007079b          	sext.w	a5,a4
    80004e68:	f8d40023          	sb	a3,-128(s0)
    80004e6c:	0047559b          	srliw	a1,a4,0x4
    80004e70:	0047569b          	srliw	a3,a4,0x4
    80004e74:	00000c93          	li	s9,0
    80004e78:	0ee65063          	bge	a2,a4,80004f58 <__printf+0x410>
    80004e7c:	00f6f693          	andi	a3,a3,15
    80004e80:	00dd86b3          	add	a3,s11,a3
    80004e84:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004e88:	0087d79b          	srliw	a5,a5,0x8
    80004e8c:	00100c93          	li	s9,1
    80004e90:	f8d400a3          	sb	a3,-127(s0)
    80004e94:	0cb67263          	bgeu	a2,a1,80004f58 <__printf+0x410>
    80004e98:	00f7f693          	andi	a3,a5,15
    80004e9c:	00dd86b3          	add	a3,s11,a3
    80004ea0:	0006c583          	lbu	a1,0(a3)
    80004ea4:	00f00613          	li	a2,15
    80004ea8:	0047d69b          	srliw	a3,a5,0x4
    80004eac:	f8b40123          	sb	a1,-126(s0)
    80004eb0:	0047d593          	srli	a1,a5,0x4
    80004eb4:	28f67e63          	bgeu	a2,a5,80005150 <__printf+0x608>
    80004eb8:	00f6f693          	andi	a3,a3,15
    80004ebc:	00dd86b3          	add	a3,s11,a3
    80004ec0:	0006c503          	lbu	a0,0(a3)
    80004ec4:	0087d813          	srli	a6,a5,0x8
    80004ec8:	0087d69b          	srliw	a3,a5,0x8
    80004ecc:	f8a401a3          	sb	a0,-125(s0)
    80004ed0:	28b67663          	bgeu	a2,a1,8000515c <__printf+0x614>
    80004ed4:	00f6f693          	andi	a3,a3,15
    80004ed8:	00dd86b3          	add	a3,s11,a3
    80004edc:	0006c583          	lbu	a1,0(a3)
    80004ee0:	00c7d513          	srli	a0,a5,0xc
    80004ee4:	00c7d69b          	srliw	a3,a5,0xc
    80004ee8:	f8b40223          	sb	a1,-124(s0)
    80004eec:	29067a63          	bgeu	a2,a6,80005180 <__printf+0x638>
    80004ef0:	00f6f693          	andi	a3,a3,15
    80004ef4:	00dd86b3          	add	a3,s11,a3
    80004ef8:	0006c583          	lbu	a1,0(a3)
    80004efc:	0107d813          	srli	a6,a5,0x10
    80004f00:	0107d69b          	srliw	a3,a5,0x10
    80004f04:	f8b402a3          	sb	a1,-123(s0)
    80004f08:	28a67263          	bgeu	a2,a0,8000518c <__printf+0x644>
    80004f0c:	00f6f693          	andi	a3,a3,15
    80004f10:	00dd86b3          	add	a3,s11,a3
    80004f14:	0006c683          	lbu	a3,0(a3)
    80004f18:	0147d79b          	srliw	a5,a5,0x14
    80004f1c:	f8d40323          	sb	a3,-122(s0)
    80004f20:	21067663          	bgeu	a2,a6,8000512c <__printf+0x5e4>
    80004f24:	02079793          	slli	a5,a5,0x20
    80004f28:	0207d793          	srli	a5,a5,0x20
    80004f2c:	00fd8db3          	add	s11,s11,a5
    80004f30:	000dc683          	lbu	a3,0(s11)
    80004f34:	00800793          	li	a5,8
    80004f38:	00700c93          	li	s9,7
    80004f3c:	f8d403a3          	sb	a3,-121(s0)
    80004f40:	00075c63          	bgez	a4,80004f58 <__printf+0x410>
    80004f44:	f9040713          	addi	a4,s0,-112
    80004f48:	00f70733          	add	a4,a4,a5
    80004f4c:	02d00693          	li	a3,45
    80004f50:	fed70823          	sb	a3,-16(a4)
    80004f54:	00078c93          	mv	s9,a5
    80004f58:	f8040793          	addi	a5,s0,-128
    80004f5c:	01978cb3          	add	s9,a5,s9
    80004f60:	f7f40d13          	addi	s10,s0,-129
    80004f64:	000cc503          	lbu	a0,0(s9)
    80004f68:	fffc8c93          	addi	s9,s9,-1
    80004f6c:	00000097          	auipc	ra,0x0
    80004f70:	9f8080e7          	jalr	-1544(ra) # 80004964 <consputc>
    80004f74:	ff9d18e3          	bne	s10,s9,80004f64 <__printf+0x41c>
    80004f78:	0100006f          	j	80004f88 <__printf+0x440>
    80004f7c:	00000097          	auipc	ra,0x0
    80004f80:	9e8080e7          	jalr	-1560(ra) # 80004964 <consputc>
    80004f84:	000c8493          	mv	s1,s9
    80004f88:	00094503          	lbu	a0,0(s2)
    80004f8c:	c60510e3          	bnez	a0,80004bec <__printf+0xa4>
    80004f90:	e40c0ee3          	beqz	s8,80004dec <__printf+0x2a4>
    80004f94:	00004517          	auipc	a0,0x4
    80004f98:	41c50513          	addi	a0,a0,1052 # 800093b0 <pr>
    80004f9c:	00001097          	auipc	ra,0x1
    80004fa0:	94c080e7          	jalr	-1716(ra) # 800058e8 <release>
    80004fa4:	e49ff06f          	j	80004dec <__printf+0x2a4>
    80004fa8:	f7843783          	ld	a5,-136(s0)
    80004fac:	03000513          	li	a0,48
    80004fb0:	01000d13          	li	s10,16
    80004fb4:	00878713          	addi	a4,a5,8
    80004fb8:	0007bc83          	ld	s9,0(a5)
    80004fbc:	f6e43c23          	sd	a4,-136(s0)
    80004fc0:	00000097          	auipc	ra,0x0
    80004fc4:	9a4080e7          	jalr	-1628(ra) # 80004964 <consputc>
    80004fc8:	07800513          	li	a0,120
    80004fcc:	00000097          	auipc	ra,0x0
    80004fd0:	998080e7          	jalr	-1640(ra) # 80004964 <consputc>
    80004fd4:	00002d97          	auipc	s11,0x2
    80004fd8:	4fcd8d93          	addi	s11,s11,1276 # 800074d0 <digits>
    80004fdc:	03ccd793          	srli	a5,s9,0x3c
    80004fe0:	00fd87b3          	add	a5,s11,a5
    80004fe4:	0007c503          	lbu	a0,0(a5)
    80004fe8:	fffd0d1b          	addiw	s10,s10,-1
    80004fec:	004c9c93          	slli	s9,s9,0x4
    80004ff0:	00000097          	auipc	ra,0x0
    80004ff4:	974080e7          	jalr	-1676(ra) # 80004964 <consputc>
    80004ff8:	fe0d12e3          	bnez	s10,80004fdc <__printf+0x494>
    80004ffc:	f8dff06f          	j	80004f88 <__printf+0x440>
    80005000:	f7843783          	ld	a5,-136(s0)
    80005004:	0007bc83          	ld	s9,0(a5)
    80005008:	00878793          	addi	a5,a5,8
    8000500c:	f6f43c23          	sd	a5,-136(s0)
    80005010:	000c9a63          	bnez	s9,80005024 <__printf+0x4dc>
    80005014:	1080006f          	j	8000511c <__printf+0x5d4>
    80005018:	001c8c93          	addi	s9,s9,1
    8000501c:	00000097          	auipc	ra,0x0
    80005020:	948080e7          	jalr	-1720(ra) # 80004964 <consputc>
    80005024:	000cc503          	lbu	a0,0(s9)
    80005028:	fe0518e3          	bnez	a0,80005018 <__printf+0x4d0>
    8000502c:	f5dff06f          	j	80004f88 <__printf+0x440>
    80005030:	02500513          	li	a0,37
    80005034:	00000097          	auipc	ra,0x0
    80005038:	930080e7          	jalr	-1744(ra) # 80004964 <consputc>
    8000503c:	000c8513          	mv	a0,s9
    80005040:	00000097          	auipc	ra,0x0
    80005044:	924080e7          	jalr	-1756(ra) # 80004964 <consputc>
    80005048:	f41ff06f          	j	80004f88 <__printf+0x440>
    8000504c:	02500513          	li	a0,37
    80005050:	00000097          	auipc	ra,0x0
    80005054:	914080e7          	jalr	-1772(ra) # 80004964 <consputc>
    80005058:	f31ff06f          	j	80004f88 <__printf+0x440>
    8000505c:	00030513          	mv	a0,t1
    80005060:	00000097          	auipc	ra,0x0
    80005064:	7bc080e7          	jalr	1980(ra) # 8000581c <acquire>
    80005068:	b4dff06f          	j	80004bb4 <__printf+0x6c>
    8000506c:	40c0053b          	negw	a0,a2
    80005070:	00a00713          	li	a4,10
    80005074:	02e576bb          	remuw	a3,a0,a4
    80005078:	00002d97          	auipc	s11,0x2
    8000507c:	458d8d93          	addi	s11,s11,1112 # 800074d0 <digits>
    80005080:	ff700593          	li	a1,-9
    80005084:	02069693          	slli	a3,a3,0x20
    80005088:	0206d693          	srli	a3,a3,0x20
    8000508c:	00dd86b3          	add	a3,s11,a3
    80005090:	0006c683          	lbu	a3,0(a3)
    80005094:	02e557bb          	divuw	a5,a0,a4
    80005098:	f8d40023          	sb	a3,-128(s0)
    8000509c:	10b65e63          	bge	a2,a1,800051b8 <__printf+0x670>
    800050a0:	06300593          	li	a1,99
    800050a4:	02e7f6bb          	remuw	a3,a5,a4
    800050a8:	02069693          	slli	a3,a3,0x20
    800050ac:	0206d693          	srli	a3,a3,0x20
    800050b0:	00dd86b3          	add	a3,s11,a3
    800050b4:	0006c683          	lbu	a3,0(a3)
    800050b8:	02e7d73b          	divuw	a4,a5,a4
    800050bc:	00200793          	li	a5,2
    800050c0:	f8d400a3          	sb	a3,-127(s0)
    800050c4:	bca5ece3          	bltu	a1,a0,80004c9c <__printf+0x154>
    800050c8:	ce5ff06f          	j	80004dac <__printf+0x264>
    800050cc:	40e007bb          	negw	a5,a4
    800050d0:	00002d97          	auipc	s11,0x2
    800050d4:	400d8d93          	addi	s11,s11,1024 # 800074d0 <digits>
    800050d8:	00f7f693          	andi	a3,a5,15
    800050dc:	00dd86b3          	add	a3,s11,a3
    800050e0:	0006c583          	lbu	a1,0(a3)
    800050e4:	ff100613          	li	a2,-15
    800050e8:	0047d69b          	srliw	a3,a5,0x4
    800050ec:	f8b40023          	sb	a1,-128(s0)
    800050f0:	0047d59b          	srliw	a1,a5,0x4
    800050f4:	0ac75e63          	bge	a4,a2,800051b0 <__printf+0x668>
    800050f8:	00f6f693          	andi	a3,a3,15
    800050fc:	00dd86b3          	add	a3,s11,a3
    80005100:	0006c603          	lbu	a2,0(a3)
    80005104:	00f00693          	li	a3,15
    80005108:	0087d79b          	srliw	a5,a5,0x8
    8000510c:	f8c400a3          	sb	a2,-127(s0)
    80005110:	d8b6e4e3          	bltu	a3,a1,80004e98 <__printf+0x350>
    80005114:	00200793          	li	a5,2
    80005118:	e2dff06f          	j	80004f44 <__printf+0x3fc>
    8000511c:	00002c97          	auipc	s9,0x2
    80005120:	394c8c93          	addi	s9,s9,916 # 800074b0 <CONSOLE_STATUS+0x4a0>
    80005124:	02800513          	li	a0,40
    80005128:	ef1ff06f          	j	80005018 <__printf+0x4d0>
    8000512c:	00700793          	li	a5,7
    80005130:	00600c93          	li	s9,6
    80005134:	e0dff06f          	j	80004f40 <__printf+0x3f8>
    80005138:	00700793          	li	a5,7
    8000513c:	00600c93          	li	s9,6
    80005140:	c69ff06f          	j	80004da8 <__printf+0x260>
    80005144:	00300793          	li	a5,3
    80005148:	00200c93          	li	s9,2
    8000514c:	c5dff06f          	j	80004da8 <__printf+0x260>
    80005150:	00300793          	li	a5,3
    80005154:	00200c93          	li	s9,2
    80005158:	de9ff06f          	j	80004f40 <__printf+0x3f8>
    8000515c:	00400793          	li	a5,4
    80005160:	00300c93          	li	s9,3
    80005164:	dddff06f          	j	80004f40 <__printf+0x3f8>
    80005168:	00400793          	li	a5,4
    8000516c:	00300c93          	li	s9,3
    80005170:	c39ff06f          	j	80004da8 <__printf+0x260>
    80005174:	00500793          	li	a5,5
    80005178:	00400c93          	li	s9,4
    8000517c:	c2dff06f          	j	80004da8 <__printf+0x260>
    80005180:	00500793          	li	a5,5
    80005184:	00400c93          	li	s9,4
    80005188:	db9ff06f          	j	80004f40 <__printf+0x3f8>
    8000518c:	00600793          	li	a5,6
    80005190:	00500c93          	li	s9,5
    80005194:	dadff06f          	j	80004f40 <__printf+0x3f8>
    80005198:	00600793          	li	a5,6
    8000519c:	00500c93          	li	s9,5
    800051a0:	c09ff06f          	j	80004da8 <__printf+0x260>
    800051a4:	00800793          	li	a5,8
    800051a8:	00700c93          	li	s9,7
    800051ac:	bfdff06f          	j	80004da8 <__printf+0x260>
    800051b0:	00100793          	li	a5,1
    800051b4:	d91ff06f          	j	80004f44 <__printf+0x3fc>
    800051b8:	00100793          	li	a5,1
    800051bc:	bf1ff06f          	j	80004dac <__printf+0x264>
    800051c0:	00900793          	li	a5,9
    800051c4:	00800c93          	li	s9,8
    800051c8:	be1ff06f          	j	80004da8 <__printf+0x260>
    800051cc:	00002517          	auipc	a0,0x2
    800051d0:	2ec50513          	addi	a0,a0,748 # 800074b8 <CONSOLE_STATUS+0x4a8>
    800051d4:	00000097          	auipc	ra,0x0
    800051d8:	918080e7          	jalr	-1768(ra) # 80004aec <panic>

00000000800051dc <printfinit>:
    800051dc:	fe010113          	addi	sp,sp,-32
    800051e0:	00813823          	sd	s0,16(sp)
    800051e4:	00913423          	sd	s1,8(sp)
    800051e8:	00113c23          	sd	ra,24(sp)
    800051ec:	02010413          	addi	s0,sp,32
    800051f0:	00004497          	auipc	s1,0x4
    800051f4:	1c048493          	addi	s1,s1,448 # 800093b0 <pr>
    800051f8:	00048513          	mv	a0,s1
    800051fc:	00002597          	auipc	a1,0x2
    80005200:	2cc58593          	addi	a1,a1,716 # 800074c8 <CONSOLE_STATUS+0x4b8>
    80005204:	00000097          	auipc	ra,0x0
    80005208:	5f4080e7          	jalr	1524(ra) # 800057f8 <initlock>
    8000520c:	01813083          	ld	ra,24(sp)
    80005210:	01013403          	ld	s0,16(sp)
    80005214:	0004ac23          	sw	zero,24(s1)
    80005218:	00813483          	ld	s1,8(sp)
    8000521c:	02010113          	addi	sp,sp,32
    80005220:	00008067          	ret

0000000080005224 <uartinit>:
    80005224:	ff010113          	addi	sp,sp,-16
    80005228:	00813423          	sd	s0,8(sp)
    8000522c:	01010413          	addi	s0,sp,16
    80005230:	100007b7          	lui	a5,0x10000
    80005234:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80005238:	f8000713          	li	a4,-128
    8000523c:	00e781a3          	sb	a4,3(a5)
    80005240:	00300713          	li	a4,3
    80005244:	00e78023          	sb	a4,0(a5)
    80005248:	000780a3          	sb	zero,1(a5)
    8000524c:	00e781a3          	sb	a4,3(a5)
    80005250:	00700693          	li	a3,7
    80005254:	00d78123          	sb	a3,2(a5)
    80005258:	00e780a3          	sb	a4,1(a5)
    8000525c:	00813403          	ld	s0,8(sp)
    80005260:	01010113          	addi	sp,sp,16
    80005264:	00008067          	ret

0000000080005268 <uartputc>:
    80005268:	00003797          	auipc	a5,0x3
    8000526c:	ea07a783          	lw	a5,-352(a5) # 80008108 <panicked>
    80005270:	00078463          	beqz	a5,80005278 <uartputc+0x10>
    80005274:	0000006f          	j	80005274 <uartputc+0xc>
    80005278:	fd010113          	addi	sp,sp,-48
    8000527c:	02813023          	sd	s0,32(sp)
    80005280:	00913c23          	sd	s1,24(sp)
    80005284:	01213823          	sd	s2,16(sp)
    80005288:	01313423          	sd	s3,8(sp)
    8000528c:	02113423          	sd	ra,40(sp)
    80005290:	03010413          	addi	s0,sp,48
    80005294:	00003917          	auipc	s2,0x3
    80005298:	e7c90913          	addi	s2,s2,-388 # 80008110 <uart_tx_r>
    8000529c:	00093783          	ld	a5,0(s2)
    800052a0:	00003497          	auipc	s1,0x3
    800052a4:	e7848493          	addi	s1,s1,-392 # 80008118 <uart_tx_w>
    800052a8:	0004b703          	ld	a4,0(s1)
    800052ac:	02078693          	addi	a3,a5,32
    800052b0:	00050993          	mv	s3,a0
    800052b4:	02e69c63          	bne	a3,a4,800052ec <uartputc+0x84>
    800052b8:	00001097          	auipc	ra,0x1
    800052bc:	834080e7          	jalr	-1996(ra) # 80005aec <push_on>
    800052c0:	00093783          	ld	a5,0(s2)
    800052c4:	0004b703          	ld	a4,0(s1)
    800052c8:	02078793          	addi	a5,a5,32
    800052cc:	00e79463          	bne	a5,a4,800052d4 <uartputc+0x6c>
    800052d0:	0000006f          	j	800052d0 <uartputc+0x68>
    800052d4:	00001097          	auipc	ra,0x1
    800052d8:	88c080e7          	jalr	-1908(ra) # 80005b60 <pop_on>
    800052dc:	00093783          	ld	a5,0(s2)
    800052e0:	0004b703          	ld	a4,0(s1)
    800052e4:	02078693          	addi	a3,a5,32
    800052e8:	fce688e3          	beq	a3,a4,800052b8 <uartputc+0x50>
    800052ec:	01f77693          	andi	a3,a4,31
    800052f0:	00004597          	auipc	a1,0x4
    800052f4:	0e058593          	addi	a1,a1,224 # 800093d0 <uart_tx_buf>
    800052f8:	00d586b3          	add	a3,a1,a3
    800052fc:	00170713          	addi	a4,a4,1
    80005300:	01368023          	sb	s3,0(a3)
    80005304:	00e4b023          	sd	a4,0(s1)
    80005308:	10000637          	lui	a2,0x10000
    8000530c:	02f71063          	bne	a4,a5,8000532c <uartputc+0xc4>
    80005310:	0340006f          	j	80005344 <uartputc+0xdc>
    80005314:	00074703          	lbu	a4,0(a4)
    80005318:	00f93023          	sd	a5,0(s2)
    8000531c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80005320:	00093783          	ld	a5,0(s2)
    80005324:	0004b703          	ld	a4,0(s1)
    80005328:	00f70e63          	beq	a4,a5,80005344 <uartputc+0xdc>
    8000532c:	00564683          	lbu	a3,5(a2)
    80005330:	01f7f713          	andi	a4,a5,31
    80005334:	00e58733          	add	a4,a1,a4
    80005338:	0206f693          	andi	a3,a3,32
    8000533c:	00178793          	addi	a5,a5,1
    80005340:	fc069ae3          	bnez	a3,80005314 <uartputc+0xac>
    80005344:	02813083          	ld	ra,40(sp)
    80005348:	02013403          	ld	s0,32(sp)
    8000534c:	01813483          	ld	s1,24(sp)
    80005350:	01013903          	ld	s2,16(sp)
    80005354:	00813983          	ld	s3,8(sp)
    80005358:	03010113          	addi	sp,sp,48
    8000535c:	00008067          	ret

0000000080005360 <uartputc_sync>:
    80005360:	ff010113          	addi	sp,sp,-16
    80005364:	00813423          	sd	s0,8(sp)
    80005368:	01010413          	addi	s0,sp,16
    8000536c:	00003717          	auipc	a4,0x3
    80005370:	d9c72703          	lw	a4,-612(a4) # 80008108 <panicked>
    80005374:	02071663          	bnez	a4,800053a0 <uartputc_sync+0x40>
    80005378:	00050793          	mv	a5,a0
    8000537c:	100006b7          	lui	a3,0x10000
    80005380:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005384:	02077713          	andi	a4,a4,32
    80005388:	fe070ce3          	beqz	a4,80005380 <uartputc_sync+0x20>
    8000538c:	0ff7f793          	andi	a5,a5,255
    80005390:	00f68023          	sb	a5,0(a3)
    80005394:	00813403          	ld	s0,8(sp)
    80005398:	01010113          	addi	sp,sp,16
    8000539c:	00008067          	ret
    800053a0:	0000006f          	j	800053a0 <uartputc_sync+0x40>

00000000800053a4 <uartstart>:
    800053a4:	ff010113          	addi	sp,sp,-16
    800053a8:	00813423          	sd	s0,8(sp)
    800053ac:	01010413          	addi	s0,sp,16
    800053b0:	00003617          	auipc	a2,0x3
    800053b4:	d6060613          	addi	a2,a2,-672 # 80008110 <uart_tx_r>
    800053b8:	00003517          	auipc	a0,0x3
    800053bc:	d6050513          	addi	a0,a0,-672 # 80008118 <uart_tx_w>
    800053c0:	00063783          	ld	a5,0(a2)
    800053c4:	00053703          	ld	a4,0(a0)
    800053c8:	04f70263          	beq	a4,a5,8000540c <uartstart+0x68>
    800053cc:	100005b7          	lui	a1,0x10000
    800053d0:	00004817          	auipc	a6,0x4
    800053d4:	00080813          	mv	a6,a6
    800053d8:	01c0006f          	j	800053f4 <uartstart+0x50>
    800053dc:	0006c703          	lbu	a4,0(a3)
    800053e0:	00f63023          	sd	a5,0(a2)
    800053e4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800053e8:	00063783          	ld	a5,0(a2)
    800053ec:	00053703          	ld	a4,0(a0)
    800053f0:	00f70e63          	beq	a4,a5,8000540c <uartstart+0x68>
    800053f4:	01f7f713          	andi	a4,a5,31
    800053f8:	00e806b3          	add	a3,a6,a4
    800053fc:	0055c703          	lbu	a4,5(a1)
    80005400:	00178793          	addi	a5,a5,1
    80005404:	02077713          	andi	a4,a4,32
    80005408:	fc071ae3          	bnez	a4,800053dc <uartstart+0x38>
    8000540c:	00813403          	ld	s0,8(sp)
    80005410:	01010113          	addi	sp,sp,16
    80005414:	00008067          	ret

0000000080005418 <uartgetc>:
    80005418:	ff010113          	addi	sp,sp,-16
    8000541c:	00813423          	sd	s0,8(sp)
    80005420:	01010413          	addi	s0,sp,16
    80005424:	10000737          	lui	a4,0x10000
    80005428:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000542c:	0017f793          	andi	a5,a5,1
    80005430:	00078c63          	beqz	a5,80005448 <uartgetc+0x30>
    80005434:	00074503          	lbu	a0,0(a4)
    80005438:	0ff57513          	andi	a0,a0,255
    8000543c:	00813403          	ld	s0,8(sp)
    80005440:	01010113          	addi	sp,sp,16
    80005444:	00008067          	ret
    80005448:	fff00513          	li	a0,-1
    8000544c:	ff1ff06f          	j	8000543c <uartgetc+0x24>

0000000080005450 <uartintr>:
    80005450:	100007b7          	lui	a5,0x10000
    80005454:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80005458:	0017f793          	andi	a5,a5,1
    8000545c:	0a078463          	beqz	a5,80005504 <uartintr+0xb4>
    80005460:	fe010113          	addi	sp,sp,-32
    80005464:	00813823          	sd	s0,16(sp)
    80005468:	00913423          	sd	s1,8(sp)
    8000546c:	00113c23          	sd	ra,24(sp)
    80005470:	02010413          	addi	s0,sp,32
    80005474:	100004b7          	lui	s1,0x10000
    80005478:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000547c:	0ff57513          	andi	a0,a0,255
    80005480:	fffff097          	auipc	ra,0xfffff
    80005484:	534080e7          	jalr	1332(ra) # 800049b4 <consoleintr>
    80005488:	0054c783          	lbu	a5,5(s1)
    8000548c:	0017f793          	andi	a5,a5,1
    80005490:	fe0794e3          	bnez	a5,80005478 <uartintr+0x28>
    80005494:	00003617          	auipc	a2,0x3
    80005498:	c7c60613          	addi	a2,a2,-900 # 80008110 <uart_tx_r>
    8000549c:	00003517          	auipc	a0,0x3
    800054a0:	c7c50513          	addi	a0,a0,-900 # 80008118 <uart_tx_w>
    800054a4:	00063783          	ld	a5,0(a2)
    800054a8:	00053703          	ld	a4,0(a0)
    800054ac:	04f70263          	beq	a4,a5,800054f0 <uartintr+0xa0>
    800054b0:	100005b7          	lui	a1,0x10000
    800054b4:	00004817          	auipc	a6,0x4
    800054b8:	f1c80813          	addi	a6,a6,-228 # 800093d0 <uart_tx_buf>
    800054bc:	01c0006f          	j	800054d8 <uartintr+0x88>
    800054c0:	0006c703          	lbu	a4,0(a3)
    800054c4:	00f63023          	sd	a5,0(a2)
    800054c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800054cc:	00063783          	ld	a5,0(a2)
    800054d0:	00053703          	ld	a4,0(a0)
    800054d4:	00f70e63          	beq	a4,a5,800054f0 <uartintr+0xa0>
    800054d8:	01f7f713          	andi	a4,a5,31
    800054dc:	00e806b3          	add	a3,a6,a4
    800054e0:	0055c703          	lbu	a4,5(a1)
    800054e4:	00178793          	addi	a5,a5,1
    800054e8:	02077713          	andi	a4,a4,32
    800054ec:	fc071ae3          	bnez	a4,800054c0 <uartintr+0x70>
    800054f0:	01813083          	ld	ra,24(sp)
    800054f4:	01013403          	ld	s0,16(sp)
    800054f8:	00813483          	ld	s1,8(sp)
    800054fc:	02010113          	addi	sp,sp,32
    80005500:	00008067          	ret
    80005504:	00003617          	auipc	a2,0x3
    80005508:	c0c60613          	addi	a2,a2,-1012 # 80008110 <uart_tx_r>
    8000550c:	00003517          	auipc	a0,0x3
    80005510:	c0c50513          	addi	a0,a0,-1012 # 80008118 <uart_tx_w>
    80005514:	00063783          	ld	a5,0(a2)
    80005518:	00053703          	ld	a4,0(a0)
    8000551c:	04f70263          	beq	a4,a5,80005560 <uartintr+0x110>
    80005520:	100005b7          	lui	a1,0x10000
    80005524:	00004817          	auipc	a6,0x4
    80005528:	eac80813          	addi	a6,a6,-340 # 800093d0 <uart_tx_buf>
    8000552c:	01c0006f          	j	80005548 <uartintr+0xf8>
    80005530:	0006c703          	lbu	a4,0(a3)
    80005534:	00f63023          	sd	a5,0(a2)
    80005538:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000553c:	00063783          	ld	a5,0(a2)
    80005540:	00053703          	ld	a4,0(a0)
    80005544:	02f70063          	beq	a4,a5,80005564 <uartintr+0x114>
    80005548:	01f7f713          	andi	a4,a5,31
    8000554c:	00e806b3          	add	a3,a6,a4
    80005550:	0055c703          	lbu	a4,5(a1)
    80005554:	00178793          	addi	a5,a5,1
    80005558:	02077713          	andi	a4,a4,32
    8000555c:	fc071ae3          	bnez	a4,80005530 <uartintr+0xe0>
    80005560:	00008067          	ret
    80005564:	00008067          	ret

0000000080005568 <kinit>:
    80005568:	fc010113          	addi	sp,sp,-64
    8000556c:	02913423          	sd	s1,40(sp)
    80005570:	fffff7b7          	lui	a5,0xfffff
    80005574:	00005497          	auipc	s1,0x5
    80005578:	e7b48493          	addi	s1,s1,-389 # 8000a3ef <end+0xfff>
    8000557c:	02813823          	sd	s0,48(sp)
    80005580:	01313c23          	sd	s3,24(sp)
    80005584:	00f4f4b3          	and	s1,s1,a5
    80005588:	02113c23          	sd	ra,56(sp)
    8000558c:	03213023          	sd	s2,32(sp)
    80005590:	01413823          	sd	s4,16(sp)
    80005594:	01513423          	sd	s5,8(sp)
    80005598:	04010413          	addi	s0,sp,64
    8000559c:	000017b7          	lui	a5,0x1
    800055a0:	01100993          	li	s3,17
    800055a4:	00f487b3          	add	a5,s1,a5
    800055a8:	01b99993          	slli	s3,s3,0x1b
    800055ac:	06f9e063          	bltu	s3,a5,8000560c <kinit+0xa4>
    800055b0:	00004a97          	auipc	s5,0x4
    800055b4:	e40a8a93          	addi	s5,s5,-448 # 800093f0 <end>
    800055b8:	0754ec63          	bltu	s1,s5,80005630 <kinit+0xc8>
    800055bc:	0734fa63          	bgeu	s1,s3,80005630 <kinit+0xc8>
    800055c0:	00088a37          	lui	s4,0x88
    800055c4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800055c8:	00003917          	auipc	s2,0x3
    800055cc:	b5890913          	addi	s2,s2,-1192 # 80008120 <kmem>
    800055d0:	00ca1a13          	slli	s4,s4,0xc
    800055d4:	0140006f          	j	800055e8 <kinit+0x80>
    800055d8:	000017b7          	lui	a5,0x1
    800055dc:	00f484b3          	add	s1,s1,a5
    800055e0:	0554e863          	bltu	s1,s5,80005630 <kinit+0xc8>
    800055e4:	0534f663          	bgeu	s1,s3,80005630 <kinit+0xc8>
    800055e8:	00001637          	lui	a2,0x1
    800055ec:	00100593          	li	a1,1
    800055f0:	00048513          	mv	a0,s1
    800055f4:	00000097          	auipc	ra,0x0
    800055f8:	5e4080e7          	jalr	1508(ra) # 80005bd8 <__memset>
    800055fc:	00093783          	ld	a5,0(s2)
    80005600:	00f4b023          	sd	a5,0(s1)
    80005604:	00993023          	sd	s1,0(s2)
    80005608:	fd4498e3          	bne	s1,s4,800055d8 <kinit+0x70>
    8000560c:	03813083          	ld	ra,56(sp)
    80005610:	03013403          	ld	s0,48(sp)
    80005614:	02813483          	ld	s1,40(sp)
    80005618:	02013903          	ld	s2,32(sp)
    8000561c:	01813983          	ld	s3,24(sp)
    80005620:	01013a03          	ld	s4,16(sp)
    80005624:	00813a83          	ld	s5,8(sp)
    80005628:	04010113          	addi	sp,sp,64
    8000562c:	00008067          	ret
    80005630:	00002517          	auipc	a0,0x2
    80005634:	eb850513          	addi	a0,a0,-328 # 800074e8 <digits+0x18>
    80005638:	fffff097          	auipc	ra,0xfffff
    8000563c:	4b4080e7          	jalr	1204(ra) # 80004aec <panic>

0000000080005640 <freerange>:
    80005640:	fc010113          	addi	sp,sp,-64
    80005644:	000017b7          	lui	a5,0x1
    80005648:	02913423          	sd	s1,40(sp)
    8000564c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005650:	009504b3          	add	s1,a0,s1
    80005654:	fffff537          	lui	a0,0xfffff
    80005658:	02813823          	sd	s0,48(sp)
    8000565c:	02113c23          	sd	ra,56(sp)
    80005660:	03213023          	sd	s2,32(sp)
    80005664:	01313c23          	sd	s3,24(sp)
    80005668:	01413823          	sd	s4,16(sp)
    8000566c:	01513423          	sd	s5,8(sp)
    80005670:	01613023          	sd	s6,0(sp)
    80005674:	04010413          	addi	s0,sp,64
    80005678:	00a4f4b3          	and	s1,s1,a0
    8000567c:	00f487b3          	add	a5,s1,a5
    80005680:	06f5e463          	bltu	a1,a5,800056e8 <freerange+0xa8>
    80005684:	00004a97          	auipc	s5,0x4
    80005688:	d6ca8a93          	addi	s5,s5,-660 # 800093f0 <end>
    8000568c:	0954e263          	bltu	s1,s5,80005710 <freerange+0xd0>
    80005690:	01100993          	li	s3,17
    80005694:	01b99993          	slli	s3,s3,0x1b
    80005698:	0734fc63          	bgeu	s1,s3,80005710 <freerange+0xd0>
    8000569c:	00058a13          	mv	s4,a1
    800056a0:	00003917          	auipc	s2,0x3
    800056a4:	a8090913          	addi	s2,s2,-1408 # 80008120 <kmem>
    800056a8:	00002b37          	lui	s6,0x2
    800056ac:	0140006f          	j	800056c0 <freerange+0x80>
    800056b0:	000017b7          	lui	a5,0x1
    800056b4:	00f484b3          	add	s1,s1,a5
    800056b8:	0554ec63          	bltu	s1,s5,80005710 <freerange+0xd0>
    800056bc:	0534fa63          	bgeu	s1,s3,80005710 <freerange+0xd0>
    800056c0:	00001637          	lui	a2,0x1
    800056c4:	00100593          	li	a1,1
    800056c8:	00048513          	mv	a0,s1
    800056cc:	00000097          	auipc	ra,0x0
    800056d0:	50c080e7          	jalr	1292(ra) # 80005bd8 <__memset>
    800056d4:	00093703          	ld	a4,0(s2)
    800056d8:	016487b3          	add	a5,s1,s6
    800056dc:	00e4b023          	sd	a4,0(s1)
    800056e0:	00993023          	sd	s1,0(s2)
    800056e4:	fcfa76e3          	bgeu	s4,a5,800056b0 <freerange+0x70>
    800056e8:	03813083          	ld	ra,56(sp)
    800056ec:	03013403          	ld	s0,48(sp)
    800056f0:	02813483          	ld	s1,40(sp)
    800056f4:	02013903          	ld	s2,32(sp)
    800056f8:	01813983          	ld	s3,24(sp)
    800056fc:	01013a03          	ld	s4,16(sp)
    80005700:	00813a83          	ld	s5,8(sp)
    80005704:	00013b03          	ld	s6,0(sp)
    80005708:	04010113          	addi	sp,sp,64
    8000570c:	00008067          	ret
    80005710:	00002517          	auipc	a0,0x2
    80005714:	dd850513          	addi	a0,a0,-552 # 800074e8 <digits+0x18>
    80005718:	fffff097          	auipc	ra,0xfffff
    8000571c:	3d4080e7          	jalr	980(ra) # 80004aec <panic>

0000000080005720 <kfree>:
    80005720:	fe010113          	addi	sp,sp,-32
    80005724:	00813823          	sd	s0,16(sp)
    80005728:	00113c23          	sd	ra,24(sp)
    8000572c:	00913423          	sd	s1,8(sp)
    80005730:	02010413          	addi	s0,sp,32
    80005734:	03451793          	slli	a5,a0,0x34
    80005738:	04079c63          	bnez	a5,80005790 <kfree+0x70>
    8000573c:	00004797          	auipc	a5,0x4
    80005740:	cb478793          	addi	a5,a5,-844 # 800093f0 <end>
    80005744:	00050493          	mv	s1,a0
    80005748:	04f56463          	bltu	a0,a5,80005790 <kfree+0x70>
    8000574c:	01100793          	li	a5,17
    80005750:	01b79793          	slli	a5,a5,0x1b
    80005754:	02f57e63          	bgeu	a0,a5,80005790 <kfree+0x70>
    80005758:	00001637          	lui	a2,0x1
    8000575c:	00100593          	li	a1,1
    80005760:	00000097          	auipc	ra,0x0
    80005764:	478080e7          	jalr	1144(ra) # 80005bd8 <__memset>
    80005768:	00003797          	auipc	a5,0x3
    8000576c:	9b878793          	addi	a5,a5,-1608 # 80008120 <kmem>
    80005770:	0007b703          	ld	a4,0(a5)
    80005774:	01813083          	ld	ra,24(sp)
    80005778:	01013403          	ld	s0,16(sp)
    8000577c:	00e4b023          	sd	a4,0(s1)
    80005780:	0097b023          	sd	s1,0(a5)
    80005784:	00813483          	ld	s1,8(sp)
    80005788:	02010113          	addi	sp,sp,32
    8000578c:	00008067          	ret
    80005790:	00002517          	auipc	a0,0x2
    80005794:	d5850513          	addi	a0,a0,-680 # 800074e8 <digits+0x18>
    80005798:	fffff097          	auipc	ra,0xfffff
    8000579c:	354080e7          	jalr	852(ra) # 80004aec <panic>

00000000800057a0 <kalloc>:
    800057a0:	fe010113          	addi	sp,sp,-32
    800057a4:	00813823          	sd	s0,16(sp)
    800057a8:	00913423          	sd	s1,8(sp)
    800057ac:	00113c23          	sd	ra,24(sp)
    800057b0:	02010413          	addi	s0,sp,32
    800057b4:	00003797          	auipc	a5,0x3
    800057b8:	96c78793          	addi	a5,a5,-1684 # 80008120 <kmem>
    800057bc:	0007b483          	ld	s1,0(a5)
    800057c0:	02048063          	beqz	s1,800057e0 <kalloc+0x40>
    800057c4:	0004b703          	ld	a4,0(s1)
    800057c8:	00001637          	lui	a2,0x1
    800057cc:	00500593          	li	a1,5
    800057d0:	00048513          	mv	a0,s1
    800057d4:	00e7b023          	sd	a4,0(a5)
    800057d8:	00000097          	auipc	ra,0x0
    800057dc:	400080e7          	jalr	1024(ra) # 80005bd8 <__memset>
    800057e0:	01813083          	ld	ra,24(sp)
    800057e4:	01013403          	ld	s0,16(sp)
    800057e8:	00048513          	mv	a0,s1
    800057ec:	00813483          	ld	s1,8(sp)
    800057f0:	02010113          	addi	sp,sp,32
    800057f4:	00008067          	ret

00000000800057f8 <initlock>:
    800057f8:	ff010113          	addi	sp,sp,-16
    800057fc:	00813423          	sd	s0,8(sp)
    80005800:	01010413          	addi	s0,sp,16
    80005804:	00813403          	ld	s0,8(sp)
    80005808:	00b53423          	sd	a1,8(a0)
    8000580c:	00052023          	sw	zero,0(a0)
    80005810:	00053823          	sd	zero,16(a0)
    80005814:	01010113          	addi	sp,sp,16
    80005818:	00008067          	ret

000000008000581c <acquire>:
    8000581c:	fe010113          	addi	sp,sp,-32
    80005820:	00813823          	sd	s0,16(sp)
    80005824:	00913423          	sd	s1,8(sp)
    80005828:	00113c23          	sd	ra,24(sp)
    8000582c:	01213023          	sd	s2,0(sp)
    80005830:	02010413          	addi	s0,sp,32
    80005834:	00050493          	mv	s1,a0
    80005838:	10002973          	csrr	s2,sstatus
    8000583c:	100027f3          	csrr	a5,sstatus
    80005840:	ffd7f793          	andi	a5,a5,-3
    80005844:	10079073          	csrw	sstatus,a5
    80005848:	fffff097          	auipc	ra,0xfffff
    8000584c:	8e8080e7          	jalr	-1816(ra) # 80004130 <mycpu>
    80005850:	07852783          	lw	a5,120(a0)
    80005854:	06078e63          	beqz	a5,800058d0 <acquire+0xb4>
    80005858:	fffff097          	auipc	ra,0xfffff
    8000585c:	8d8080e7          	jalr	-1832(ra) # 80004130 <mycpu>
    80005860:	07852783          	lw	a5,120(a0)
    80005864:	0004a703          	lw	a4,0(s1)
    80005868:	0017879b          	addiw	a5,a5,1
    8000586c:	06f52c23          	sw	a5,120(a0)
    80005870:	04071063          	bnez	a4,800058b0 <acquire+0x94>
    80005874:	00100713          	li	a4,1
    80005878:	00070793          	mv	a5,a4
    8000587c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005880:	0007879b          	sext.w	a5,a5
    80005884:	fe079ae3          	bnez	a5,80005878 <acquire+0x5c>
    80005888:	0ff0000f          	fence
    8000588c:	fffff097          	auipc	ra,0xfffff
    80005890:	8a4080e7          	jalr	-1884(ra) # 80004130 <mycpu>
    80005894:	01813083          	ld	ra,24(sp)
    80005898:	01013403          	ld	s0,16(sp)
    8000589c:	00a4b823          	sd	a0,16(s1)
    800058a0:	00013903          	ld	s2,0(sp)
    800058a4:	00813483          	ld	s1,8(sp)
    800058a8:	02010113          	addi	sp,sp,32
    800058ac:	00008067          	ret
    800058b0:	0104b903          	ld	s2,16(s1)
    800058b4:	fffff097          	auipc	ra,0xfffff
    800058b8:	87c080e7          	jalr	-1924(ra) # 80004130 <mycpu>
    800058bc:	faa91ce3          	bne	s2,a0,80005874 <acquire+0x58>
    800058c0:	00002517          	auipc	a0,0x2
    800058c4:	c3050513          	addi	a0,a0,-976 # 800074f0 <digits+0x20>
    800058c8:	fffff097          	auipc	ra,0xfffff
    800058cc:	224080e7          	jalr	548(ra) # 80004aec <panic>
    800058d0:	00195913          	srli	s2,s2,0x1
    800058d4:	fffff097          	auipc	ra,0xfffff
    800058d8:	85c080e7          	jalr	-1956(ra) # 80004130 <mycpu>
    800058dc:	00197913          	andi	s2,s2,1
    800058e0:	07252e23          	sw	s2,124(a0)
    800058e4:	f75ff06f          	j	80005858 <acquire+0x3c>

00000000800058e8 <release>:
    800058e8:	fe010113          	addi	sp,sp,-32
    800058ec:	00813823          	sd	s0,16(sp)
    800058f0:	00113c23          	sd	ra,24(sp)
    800058f4:	00913423          	sd	s1,8(sp)
    800058f8:	01213023          	sd	s2,0(sp)
    800058fc:	02010413          	addi	s0,sp,32
    80005900:	00052783          	lw	a5,0(a0)
    80005904:	00079a63          	bnez	a5,80005918 <release+0x30>
    80005908:	00002517          	auipc	a0,0x2
    8000590c:	bf050513          	addi	a0,a0,-1040 # 800074f8 <digits+0x28>
    80005910:	fffff097          	auipc	ra,0xfffff
    80005914:	1dc080e7          	jalr	476(ra) # 80004aec <panic>
    80005918:	01053903          	ld	s2,16(a0)
    8000591c:	00050493          	mv	s1,a0
    80005920:	fffff097          	auipc	ra,0xfffff
    80005924:	810080e7          	jalr	-2032(ra) # 80004130 <mycpu>
    80005928:	fea910e3          	bne	s2,a0,80005908 <release+0x20>
    8000592c:	0004b823          	sd	zero,16(s1)
    80005930:	0ff0000f          	fence
    80005934:	0f50000f          	fence	iorw,ow
    80005938:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000593c:	ffffe097          	auipc	ra,0xffffe
    80005940:	7f4080e7          	jalr	2036(ra) # 80004130 <mycpu>
    80005944:	100027f3          	csrr	a5,sstatus
    80005948:	0027f793          	andi	a5,a5,2
    8000594c:	04079a63          	bnez	a5,800059a0 <release+0xb8>
    80005950:	07852783          	lw	a5,120(a0)
    80005954:	02f05e63          	blez	a5,80005990 <release+0xa8>
    80005958:	fff7871b          	addiw	a4,a5,-1
    8000595c:	06e52c23          	sw	a4,120(a0)
    80005960:	00071c63          	bnez	a4,80005978 <release+0x90>
    80005964:	07c52783          	lw	a5,124(a0)
    80005968:	00078863          	beqz	a5,80005978 <release+0x90>
    8000596c:	100027f3          	csrr	a5,sstatus
    80005970:	0027e793          	ori	a5,a5,2
    80005974:	10079073          	csrw	sstatus,a5
    80005978:	01813083          	ld	ra,24(sp)
    8000597c:	01013403          	ld	s0,16(sp)
    80005980:	00813483          	ld	s1,8(sp)
    80005984:	00013903          	ld	s2,0(sp)
    80005988:	02010113          	addi	sp,sp,32
    8000598c:	00008067          	ret
    80005990:	00002517          	auipc	a0,0x2
    80005994:	b8850513          	addi	a0,a0,-1144 # 80007518 <digits+0x48>
    80005998:	fffff097          	auipc	ra,0xfffff
    8000599c:	154080e7          	jalr	340(ra) # 80004aec <panic>
    800059a0:	00002517          	auipc	a0,0x2
    800059a4:	b6050513          	addi	a0,a0,-1184 # 80007500 <digits+0x30>
    800059a8:	fffff097          	auipc	ra,0xfffff
    800059ac:	144080e7          	jalr	324(ra) # 80004aec <panic>

00000000800059b0 <holding>:
    800059b0:	00052783          	lw	a5,0(a0)
    800059b4:	00079663          	bnez	a5,800059c0 <holding+0x10>
    800059b8:	00000513          	li	a0,0
    800059bc:	00008067          	ret
    800059c0:	fe010113          	addi	sp,sp,-32
    800059c4:	00813823          	sd	s0,16(sp)
    800059c8:	00913423          	sd	s1,8(sp)
    800059cc:	00113c23          	sd	ra,24(sp)
    800059d0:	02010413          	addi	s0,sp,32
    800059d4:	01053483          	ld	s1,16(a0)
    800059d8:	ffffe097          	auipc	ra,0xffffe
    800059dc:	758080e7          	jalr	1880(ra) # 80004130 <mycpu>
    800059e0:	01813083          	ld	ra,24(sp)
    800059e4:	01013403          	ld	s0,16(sp)
    800059e8:	40a48533          	sub	a0,s1,a0
    800059ec:	00153513          	seqz	a0,a0
    800059f0:	00813483          	ld	s1,8(sp)
    800059f4:	02010113          	addi	sp,sp,32
    800059f8:	00008067          	ret

00000000800059fc <push_off>:
    800059fc:	fe010113          	addi	sp,sp,-32
    80005a00:	00813823          	sd	s0,16(sp)
    80005a04:	00113c23          	sd	ra,24(sp)
    80005a08:	00913423          	sd	s1,8(sp)
    80005a0c:	02010413          	addi	s0,sp,32
    80005a10:	100024f3          	csrr	s1,sstatus
    80005a14:	100027f3          	csrr	a5,sstatus
    80005a18:	ffd7f793          	andi	a5,a5,-3
    80005a1c:	10079073          	csrw	sstatus,a5
    80005a20:	ffffe097          	auipc	ra,0xffffe
    80005a24:	710080e7          	jalr	1808(ra) # 80004130 <mycpu>
    80005a28:	07852783          	lw	a5,120(a0)
    80005a2c:	02078663          	beqz	a5,80005a58 <push_off+0x5c>
    80005a30:	ffffe097          	auipc	ra,0xffffe
    80005a34:	700080e7          	jalr	1792(ra) # 80004130 <mycpu>
    80005a38:	07852783          	lw	a5,120(a0)
    80005a3c:	01813083          	ld	ra,24(sp)
    80005a40:	01013403          	ld	s0,16(sp)
    80005a44:	0017879b          	addiw	a5,a5,1
    80005a48:	06f52c23          	sw	a5,120(a0)
    80005a4c:	00813483          	ld	s1,8(sp)
    80005a50:	02010113          	addi	sp,sp,32
    80005a54:	00008067          	ret
    80005a58:	0014d493          	srli	s1,s1,0x1
    80005a5c:	ffffe097          	auipc	ra,0xffffe
    80005a60:	6d4080e7          	jalr	1748(ra) # 80004130 <mycpu>
    80005a64:	0014f493          	andi	s1,s1,1
    80005a68:	06952e23          	sw	s1,124(a0)
    80005a6c:	fc5ff06f          	j	80005a30 <push_off+0x34>

0000000080005a70 <pop_off>:
    80005a70:	ff010113          	addi	sp,sp,-16
    80005a74:	00813023          	sd	s0,0(sp)
    80005a78:	00113423          	sd	ra,8(sp)
    80005a7c:	01010413          	addi	s0,sp,16
    80005a80:	ffffe097          	auipc	ra,0xffffe
    80005a84:	6b0080e7          	jalr	1712(ra) # 80004130 <mycpu>
    80005a88:	100027f3          	csrr	a5,sstatus
    80005a8c:	0027f793          	andi	a5,a5,2
    80005a90:	04079663          	bnez	a5,80005adc <pop_off+0x6c>
    80005a94:	07852783          	lw	a5,120(a0)
    80005a98:	02f05a63          	blez	a5,80005acc <pop_off+0x5c>
    80005a9c:	fff7871b          	addiw	a4,a5,-1
    80005aa0:	06e52c23          	sw	a4,120(a0)
    80005aa4:	00071c63          	bnez	a4,80005abc <pop_off+0x4c>
    80005aa8:	07c52783          	lw	a5,124(a0)
    80005aac:	00078863          	beqz	a5,80005abc <pop_off+0x4c>
    80005ab0:	100027f3          	csrr	a5,sstatus
    80005ab4:	0027e793          	ori	a5,a5,2
    80005ab8:	10079073          	csrw	sstatus,a5
    80005abc:	00813083          	ld	ra,8(sp)
    80005ac0:	00013403          	ld	s0,0(sp)
    80005ac4:	01010113          	addi	sp,sp,16
    80005ac8:	00008067          	ret
    80005acc:	00002517          	auipc	a0,0x2
    80005ad0:	a4c50513          	addi	a0,a0,-1460 # 80007518 <digits+0x48>
    80005ad4:	fffff097          	auipc	ra,0xfffff
    80005ad8:	018080e7          	jalr	24(ra) # 80004aec <panic>
    80005adc:	00002517          	auipc	a0,0x2
    80005ae0:	a2450513          	addi	a0,a0,-1500 # 80007500 <digits+0x30>
    80005ae4:	fffff097          	auipc	ra,0xfffff
    80005ae8:	008080e7          	jalr	8(ra) # 80004aec <panic>

0000000080005aec <push_on>:
    80005aec:	fe010113          	addi	sp,sp,-32
    80005af0:	00813823          	sd	s0,16(sp)
    80005af4:	00113c23          	sd	ra,24(sp)
    80005af8:	00913423          	sd	s1,8(sp)
    80005afc:	02010413          	addi	s0,sp,32
    80005b00:	100024f3          	csrr	s1,sstatus
    80005b04:	100027f3          	csrr	a5,sstatus
    80005b08:	0027e793          	ori	a5,a5,2
    80005b0c:	10079073          	csrw	sstatus,a5
    80005b10:	ffffe097          	auipc	ra,0xffffe
    80005b14:	620080e7          	jalr	1568(ra) # 80004130 <mycpu>
    80005b18:	07852783          	lw	a5,120(a0)
    80005b1c:	02078663          	beqz	a5,80005b48 <push_on+0x5c>
    80005b20:	ffffe097          	auipc	ra,0xffffe
    80005b24:	610080e7          	jalr	1552(ra) # 80004130 <mycpu>
    80005b28:	07852783          	lw	a5,120(a0)
    80005b2c:	01813083          	ld	ra,24(sp)
    80005b30:	01013403          	ld	s0,16(sp)
    80005b34:	0017879b          	addiw	a5,a5,1
    80005b38:	06f52c23          	sw	a5,120(a0)
    80005b3c:	00813483          	ld	s1,8(sp)
    80005b40:	02010113          	addi	sp,sp,32
    80005b44:	00008067          	ret
    80005b48:	0014d493          	srli	s1,s1,0x1
    80005b4c:	ffffe097          	auipc	ra,0xffffe
    80005b50:	5e4080e7          	jalr	1508(ra) # 80004130 <mycpu>
    80005b54:	0014f493          	andi	s1,s1,1
    80005b58:	06952e23          	sw	s1,124(a0)
    80005b5c:	fc5ff06f          	j	80005b20 <push_on+0x34>

0000000080005b60 <pop_on>:
    80005b60:	ff010113          	addi	sp,sp,-16
    80005b64:	00813023          	sd	s0,0(sp)
    80005b68:	00113423          	sd	ra,8(sp)
    80005b6c:	01010413          	addi	s0,sp,16
    80005b70:	ffffe097          	auipc	ra,0xffffe
    80005b74:	5c0080e7          	jalr	1472(ra) # 80004130 <mycpu>
    80005b78:	100027f3          	csrr	a5,sstatus
    80005b7c:	0027f793          	andi	a5,a5,2
    80005b80:	04078463          	beqz	a5,80005bc8 <pop_on+0x68>
    80005b84:	07852783          	lw	a5,120(a0)
    80005b88:	02f05863          	blez	a5,80005bb8 <pop_on+0x58>
    80005b8c:	fff7879b          	addiw	a5,a5,-1
    80005b90:	06f52c23          	sw	a5,120(a0)
    80005b94:	07853783          	ld	a5,120(a0)
    80005b98:	00079863          	bnez	a5,80005ba8 <pop_on+0x48>
    80005b9c:	100027f3          	csrr	a5,sstatus
    80005ba0:	ffd7f793          	andi	a5,a5,-3
    80005ba4:	10079073          	csrw	sstatus,a5
    80005ba8:	00813083          	ld	ra,8(sp)
    80005bac:	00013403          	ld	s0,0(sp)
    80005bb0:	01010113          	addi	sp,sp,16
    80005bb4:	00008067          	ret
    80005bb8:	00002517          	auipc	a0,0x2
    80005bbc:	98850513          	addi	a0,a0,-1656 # 80007540 <digits+0x70>
    80005bc0:	fffff097          	auipc	ra,0xfffff
    80005bc4:	f2c080e7          	jalr	-212(ra) # 80004aec <panic>
    80005bc8:	00002517          	auipc	a0,0x2
    80005bcc:	95850513          	addi	a0,a0,-1704 # 80007520 <digits+0x50>
    80005bd0:	fffff097          	auipc	ra,0xfffff
    80005bd4:	f1c080e7          	jalr	-228(ra) # 80004aec <panic>

0000000080005bd8 <__memset>:
    80005bd8:	ff010113          	addi	sp,sp,-16
    80005bdc:	00813423          	sd	s0,8(sp)
    80005be0:	01010413          	addi	s0,sp,16
    80005be4:	1a060e63          	beqz	a2,80005da0 <__memset+0x1c8>
    80005be8:	40a007b3          	neg	a5,a0
    80005bec:	0077f793          	andi	a5,a5,7
    80005bf0:	00778693          	addi	a3,a5,7
    80005bf4:	00b00813          	li	a6,11
    80005bf8:	0ff5f593          	andi	a1,a1,255
    80005bfc:	fff6071b          	addiw	a4,a2,-1
    80005c00:	1b06e663          	bltu	a3,a6,80005dac <__memset+0x1d4>
    80005c04:	1cd76463          	bltu	a4,a3,80005dcc <__memset+0x1f4>
    80005c08:	1a078e63          	beqz	a5,80005dc4 <__memset+0x1ec>
    80005c0c:	00b50023          	sb	a1,0(a0)
    80005c10:	00100713          	li	a4,1
    80005c14:	1ae78463          	beq	a5,a4,80005dbc <__memset+0x1e4>
    80005c18:	00b500a3          	sb	a1,1(a0)
    80005c1c:	00200713          	li	a4,2
    80005c20:	1ae78a63          	beq	a5,a4,80005dd4 <__memset+0x1fc>
    80005c24:	00b50123          	sb	a1,2(a0)
    80005c28:	00300713          	li	a4,3
    80005c2c:	18e78463          	beq	a5,a4,80005db4 <__memset+0x1dc>
    80005c30:	00b501a3          	sb	a1,3(a0)
    80005c34:	00400713          	li	a4,4
    80005c38:	1ae78263          	beq	a5,a4,80005ddc <__memset+0x204>
    80005c3c:	00b50223          	sb	a1,4(a0)
    80005c40:	00500713          	li	a4,5
    80005c44:	1ae78063          	beq	a5,a4,80005de4 <__memset+0x20c>
    80005c48:	00b502a3          	sb	a1,5(a0)
    80005c4c:	00700713          	li	a4,7
    80005c50:	18e79e63          	bne	a5,a4,80005dec <__memset+0x214>
    80005c54:	00b50323          	sb	a1,6(a0)
    80005c58:	00700e93          	li	t4,7
    80005c5c:	00859713          	slli	a4,a1,0x8
    80005c60:	00e5e733          	or	a4,a1,a4
    80005c64:	01059e13          	slli	t3,a1,0x10
    80005c68:	01c76e33          	or	t3,a4,t3
    80005c6c:	01859313          	slli	t1,a1,0x18
    80005c70:	006e6333          	or	t1,t3,t1
    80005c74:	02059893          	slli	a7,a1,0x20
    80005c78:	40f60e3b          	subw	t3,a2,a5
    80005c7c:	011368b3          	or	a7,t1,a7
    80005c80:	02859813          	slli	a6,a1,0x28
    80005c84:	0108e833          	or	a6,a7,a6
    80005c88:	03059693          	slli	a3,a1,0x30
    80005c8c:	003e589b          	srliw	a7,t3,0x3
    80005c90:	00d866b3          	or	a3,a6,a3
    80005c94:	03859713          	slli	a4,a1,0x38
    80005c98:	00389813          	slli	a6,a7,0x3
    80005c9c:	00f507b3          	add	a5,a0,a5
    80005ca0:	00e6e733          	or	a4,a3,a4
    80005ca4:	000e089b          	sext.w	a7,t3
    80005ca8:	00f806b3          	add	a3,a6,a5
    80005cac:	00e7b023          	sd	a4,0(a5)
    80005cb0:	00878793          	addi	a5,a5,8
    80005cb4:	fed79ce3          	bne	a5,a3,80005cac <__memset+0xd4>
    80005cb8:	ff8e7793          	andi	a5,t3,-8
    80005cbc:	0007871b          	sext.w	a4,a5
    80005cc0:	01d787bb          	addw	a5,a5,t4
    80005cc4:	0ce88e63          	beq	a7,a4,80005da0 <__memset+0x1c8>
    80005cc8:	00f50733          	add	a4,a0,a5
    80005ccc:	00b70023          	sb	a1,0(a4)
    80005cd0:	0017871b          	addiw	a4,a5,1
    80005cd4:	0cc77663          	bgeu	a4,a2,80005da0 <__memset+0x1c8>
    80005cd8:	00e50733          	add	a4,a0,a4
    80005cdc:	00b70023          	sb	a1,0(a4)
    80005ce0:	0027871b          	addiw	a4,a5,2
    80005ce4:	0ac77e63          	bgeu	a4,a2,80005da0 <__memset+0x1c8>
    80005ce8:	00e50733          	add	a4,a0,a4
    80005cec:	00b70023          	sb	a1,0(a4)
    80005cf0:	0037871b          	addiw	a4,a5,3
    80005cf4:	0ac77663          	bgeu	a4,a2,80005da0 <__memset+0x1c8>
    80005cf8:	00e50733          	add	a4,a0,a4
    80005cfc:	00b70023          	sb	a1,0(a4)
    80005d00:	0047871b          	addiw	a4,a5,4
    80005d04:	08c77e63          	bgeu	a4,a2,80005da0 <__memset+0x1c8>
    80005d08:	00e50733          	add	a4,a0,a4
    80005d0c:	00b70023          	sb	a1,0(a4)
    80005d10:	0057871b          	addiw	a4,a5,5
    80005d14:	08c77663          	bgeu	a4,a2,80005da0 <__memset+0x1c8>
    80005d18:	00e50733          	add	a4,a0,a4
    80005d1c:	00b70023          	sb	a1,0(a4)
    80005d20:	0067871b          	addiw	a4,a5,6
    80005d24:	06c77e63          	bgeu	a4,a2,80005da0 <__memset+0x1c8>
    80005d28:	00e50733          	add	a4,a0,a4
    80005d2c:	00b70023          	sb	a1,0(a4)
    80005d30:	0077871b          	addiw	a4,a5,7
    80005d34:	06c77663          	bgeu	a4,a2,80005da0 <__memset+0x1c8>
    80005d38:	00e50733          	add	a4,a0,a4
    80005d3c:	00b70023          	sb	a1,0(a4)
    80005d40:	0087871b          	addiw	a4,a5,8
    80005d44:	04c77e63          	bgeu	a4,a2,80005da0 <__memset+0x1c8>
    80005d48:	00e50733          	add	a4,a0,a4
    80005d4c:	00b70023          	sb	a1,0(a4)
    80005d50:	0097871b          	addiw	a4,a5,9
    80005d54:	04c77663          	bgeu	a4,a2,80005da0 <__memset+0x1c8>
    80005d58:	00e50733          	add	a4,a0,a4
    80005d5c:	00b70023          	sb	a1,0(a4)
    80005d60:	00a7871b          	addiw	a4,a5,10
    80005d64:	02c77e63          	bgeu	a4,a2,80005da0 <__memset+0x1c8>
    80005d68:	00e50733          	add	a4,a0,a4
    80005d6c:	00b70023          	sb	a1,0(a4)
    80005d70:	00b7871b          	addiw	a4,a5,11
    80005d74:	02c77663          	bgeu	a4,a2,80005da0 <__memset+0x1c8>
    80005d78:	00e50733          	add	a4,a0,a4
    80005d7c:	00b70023          	sb	a1,0(a4)
    80005d80:	00c7871b          	addiw	a4,a5,12
    80005d84:	00c77e63          	bgeu	a4,a2,80005da0 <__memset+0x1c8>
    80005d88:	00e50733          	add	a4,a0,a4
    80005d8c:	00b70023          	sb	a1,0(a4)
    80005d90:	00d7879b          	addiw	a5,a5,13
    80005d94:	00c7f663          	bgeu	a5,a2,80005da0 <__memset+0x1c8>
    80005d98:	00f507b3          	add	a5,a0,a5
    80005d9c:	00b78023          	sb	a1,0(a5)
    80005da0:	00813403          	ld	s0,8(sp)
    80005da4:	01010113          	addi	sp,sp,16
    80005da8:	00008067          	ret
    80005dac:	00b00693          	li	a3,11
    80005db0:	e55ff06f          	j	80005c04 <__memset+0x2c>
    80005db4:	00300e93          	li	t4,3
    80005db8:	ea5ff06f          	j	80005c5c <__memset+0x84>
    80005dbc:	00100e93          	li	t4,1
    80005dc0:	e9dff06f          	j	80005c5c <__memset+0x84>
    80005dc4:	00000e93          	li	t4,0
    80005dc8:	e95ff06f          	j	80005c5c <__memset+0x84>
    80005dcc:	00000793          	li	a5,0
    80005dd0:	ef9ff06f          	j	80005cc8 <__memset+0xf0>
    80005dd4:	00200e93          	li	t4,2
    80005dd8:	e85ff06f          	j	80005c5c <__memset+0x84>
    80005ddc:	00400e93          	li	t4,4
    80005de0:	e7dff06f          	j	80005c5c <__memset+0x84>
    80005de4:	00500e93          	li	t4,5
    80005de8:	e75ff06f          	j	80005c5c <__memset+0x84>
    80005dec:	00600e93          	li	t4,6
    80005df0:	e6dff06f          	j	80005c5c <__memset+0x84>

0000000080005df4 <__memmove>:
    80005df4:	ff010113          	addi	sp,sp,-16
    80005df8:	00813423          	sd	s0,8(sp)
    80005dfc:	01010413          	addi	s0,sp,16
    80005e00:	0e060863          	beqz	a2,80005ef0 <__memmove+0xfc>
    80005e04:	fff6069b          	addiw	a3,a2,-1
    80005e08:	0006881b          	sext.w	a6,a3
    80005e0c:	0ea5e863          	bltu	a1,a0,80005efc <__memmove+0x108>
    80005e10:	00758713          	addi	a4,a1,7
    80005e14:	00a5e7b3          	or	a5,a1,a0
    80005e18:	40a70733          	sub	a4,a4,a0
    80005e1c:	0077f793          	andi	a5,a5,7
    80005e20:	00f73713          	sltiu	a4,a4,15
    80005e24:	00174713          	xori	a4,a4,1
    80005e28:	0017b793          	seqz	a5,a5
    80005e2c:	00e7f7b3          	and	a5,a5,a4
    80005e30:	10078863          	beqz	a5,80005f40 <__memmove+0x14c>
    80005e34:	00900793          	li	a5,9
    80005e38:	1107f463          	bgeu	a5,a6,80005f40 <__memmove+0x14c>
    80005e3c:	0036581b          	srliw	a6,a2,0x3
    80005e40:	fff8081b          	addiw	a6,a6,-1
    80005e44:	02081813          	slli	a6,a6,0x20
    80005e48:	01d85893          	srli	a7,a6,0x1d
    80005e4c:	00858813          	addi	a6,a1,8
    80005e50:	00058793          	mv	a5,a1
    80005e54:	00050713          	mv	a4,a0
    80005e58:	01088833          	add	a6,a7,a6
    80005e5c:	0007b883          	ld	a7,0(a5)
    80005e60:	00878793          	addi	a5,a5,8
    80005e64:	00870713          	addi	a4,a4,8
    80005e68:	ff173c23          	sd	a7,-8(a4)
    80005e6c:	ff0798e3          	bne	a5,a6,80005e5c <__memmove+0x68>
    80005e70:	ff867713          	andi	a4,a2,-8
    80005e74:	02071793          	slli	a5,a4,0x20
    80005e78:	0207d793          	srli	a5,a5,0x20
    80005e7c:	00f585b3          	add	a1,a1,a5
    80005e80:	40e686bb          	subw	a3,a3,a4
    80005e84:	00f507b3          	add	a5,a0,a5
    80005e88:	06e60463          	beq	a2,a4,80005ef0 <__memmove+0xfc>
    80005e8c:	0005c703          	lbu	a4,0(a1)
    80005e90:	00e78023          	sb	a4,0(a5)
    80005e94:	04068e63          	beqz	a3,80005ef0 <__memmove+0xfc>
    80005e98:	0015c603          	lbu	a2,1(a1)
    80005e9c:	00100713          	li	a4,1
    80005ea0:	00c780a3          	sb	a2,1(a5)
    80005ea4:	04e68663          	beq	a3,a4,80005ef0 <__memmove+0xfc>
    80005ea8:	0025c603          	lbu	a2,2(a1)
    80005eac:	00200713          	li	a4,2
    80005eb0:	00c78123          	sb	a2,2(a5)
    80005eb4:	02e68e63          	beq	a3,a4,80005ef0 <__memmove+0xfc>
    80005eb8:	0035c603          	lbu	a2,3(a1)
    80005ebc:	00300713          	li	a4,3
    80005ec0:	00c781a3          	sb	a2,3(a5)
    80005ec4:	02e68663          	beq	a3,a4,80005ef0 <__memmove+0xfc>
    80005ec8:	0045c603          	lbu	a2,4(a1)
    80005ecc:	00400713          	li	a4,4
    80005ed0:	00c78223          	sb	a2,4(a5)
    80005ed4:	00e68e63          	beq	a3,a4,80005ef0 <__memmove+0xfc>
    80005ed8:	0055c603          	lbu	a2,5(a1)
    80005edc:	00500713          	li	a4,5
    80005ee0:	00c782a3          	sb	a2,5(a5)
    80005ee4:	00e68663          	beq	a3,a4,80005ef0 <__memmove+0xfc>
    80005ee8:	0065c703          	lbu	a4,6(a1)
    80005eec:	00e78323          	sb	a4,6(a5)
    80005ef0:	00813403          	ld	s0,8(sp)
    80005ef4:	01010113          	addi	sp,sp,16
    80005ef8:	00008067          	ret
    80005efc:	02061713          	slli	a4,a2,0x20
    80005f00:	02075713          	srli	a4,a4,0x20
    80005f04:	00e587b3          	add	a5,a1,a4
    80005f08:	f0f574e3          	bgeu	a0,a5,80005e10 <__memmove+0x1c>
    80005f0c:	02069613          	slli	a2,a3,0x20
    80005f10:	02065613          	srli	a2,a2,0x20
    80005f14:	fff64613          	not	a2,a2
    80005f18:	00e50733          	add	a4,a0,a4
    80005f1c:	00c78633          	add	a2,a5,a2
    80005f20:	fff7c683          	lbu	a3,-1(a5)
    80005f24:	fff78793          	addi	a5,a5,-1
    80005f28:	fff70713          	addi	a4,a4,-1
    80005f2c:	00d70023          	sb	a3,0(a4)
    80005f30:	fec798e3          	bne	a5,a2,80005f20 <__memmove+0x12c>
    80005f34:	00813403          	ld	s0,8(sp)
    80005f38:	01010113          	addi	sp,sp,16
    80005f3c:	00008067          	ret
    80005f40:	02069713          	slli	a4,a3,0x20
    80005f44:	02075713          	srli	a4,a4,0x20
    80005f48:	00170713          	addi	a4,a4,1
    80005f4c:	00e50733          	add	a4,a0,a4
    80005f50:	00050793          	mv	a5,a0
    80005f54:	0005c683          	lbu	a3,0(a1)
    80005f58:	00178793          	addi	a5,a5,1
    80005f5c:	00158593          	addi	a1,a1,1
    80005f60:	fed78fa3          	sb	a3,-1(a5)
    80005f64:	fee798e3          	bne	a5,a4,80005f54 <__memmove+0x160>
    80005f68:	f89ff06f          	j	80005ef0 <__memmove+0xfc>

0000000080005f6c <__putc>:
    80005f6c:	fe010113          	addi	sp,sp,-32
    80005f70:	00813823          	sd	s0,16(sp)
    80005f74:	00113c23          	sd	ra,24(sp)
    80005f78:	02010413          	addi	s0,sp,32
    80005f7c:	00050793          	mv	a5,a0
    80005f80:	fef40593          	addi	a1,s0,-17
    80005f84:	00100613          	li	a2,1
    80005f88:	00000513          	li	a0,0
    80005f8c:	fef407a3          	sb	a5,-17(s0)
    80005f90:	fffff097          	auipc	ra,0xfffff
    80005f94:	b3c080e7          	jalr	-1220(ra) # 80004acc <console_write>
    80005f98:	01813083          	ld	ra,24(sp)
    80005f9c:	01013403          	ld	s0,16(sp)
    80005fa0:	02010113          	addi	sp,sp,32
    80005fa4:	00008067          	ret

0000000080005fa8 <__getc>:
    80005fa8:	fe010113          	addi	sp,sp,-32
    80005fac:	00813823          	sd	s0,16(sp)
    80005fb0:	00113c23          	sd	ra,24(sp)
    80005fb4:	02010413          	addi	s0,sp,32
    80005fb8:	fe840593          	addi	a1,s0,-24
    80005fbc:	00100613          	li	a2,1
    80005fc0:	00000513          	li	a0,0
    80005fc4:	fffff097          	auipc	ra,0xfffff
    80005fc8:	ae8080e7          	jalr	-1304(ra) # 80004aac <console_read>
    80005fcc:	fe844503          	lbu	a0,-24(s0)
    80005fd0:	01813083          	ld	ra,24(sp)
    80005fd4:	01013403          	ld	s0,16(sp)
    80005fd8:	02010113          	addi	sp,sp,32
    80005fdc:	00008067          	ret

0000000080005fe0 <console_handler>:
    80005fe0:	fe010113          	addi	sp,sp,-32
    80005fe4:	00813823          	sd	s0,16(sp)
    80005fe8:	00113c23          	sd	ra,24(sp)
    80005fec:	00913423          	sd	s1,8(sp)
    80005ff0:	02010413          	addi	s0,sp,32
    80005ff4:	14202773          	csrr	a4,scause
    80005ff8:	100027f3          	csrr	a5,sstatus
    80005ffc:	0027f793          	andi	a5,a5,2
    80006000:	06079e63          	bnez	a5,8000607c <console_handler+0x9c>
    80006004:	00074c63          	bltz	a4,8000601c <console_handler+0x3c>
    80006008:	01813083          	ld	ra,24(sp)
    8000600c:	01013403          	ld	s0,16(sp)
    80006010:	00813483          	ld	s1,8(sp)
    80006014:	02010113          	addi	sp,sp,32
    80006018:	00008067          	ret
    8000601c:	0ff77713          	andi	a4,a4,255
    80006020:	00900793          	li	a5,9
    80006024:	fef712e3          	bne	a4,a5,80006008 <console_handler+0x28>
    80006028:	ffffe097          	auipc	ra,0xffffe
    8000602c:	6dc080e7          	jalr	1756(ra) # 80004704 <plic_claim>
    80006030:	00a00793          	li	a5,10
    80006034:	00050493          	mv	s1,a0
    80006038:	02f50c63          	beq	a0,a5,80006070 <console_handler+0x90>
    8000603c:	fc0506e3          	beqz	a0,80006008 <console_handler+0x28>
    80006040:	00050593          	mv	a1,a0
    80006044:	00001517          	auipc	a0,0x1
    80006048:	40450513          	addi	a0,a0,1028 # 80007448 <CONSOLE_STATUS+0x438>
    8000604c:	fffff097          	auipc	ra,0xfffff
    80006050:	afc080e7          	jalr	-1284(ra) # 80004b48 <__printf>
    80006054:	01013403          	ld	s0,16(sp)
    80006058:	01813083          	ld	ra,24(sp)
    8000605c:	00048513          	mv	a0,s1
    80006060:	00813483          	ld	s1,8(sp)
    80006064:	02010113          	addi	sp,sp,32
    80006068:	ffffe317          	auipc	t1,0xffffe
    8000606c:	6d430067          	jr	1748(t1) # 8000473c <plic_complete>
    80006070:	fffff097          	auipc	ra,0xfffff
    80006074:	3e0080e7          	jalr	992(ra) # 80005450 <uartintr>
    80006078:	fddff06f          	j	80006054 <console_handler+0x74>
    8000607c:	00001517          	auipc	a0,0x1
    80006080:	4cc50513          	addi	a0,a0,1228 # 80007548 <digits+0x78>
    80006084:	fffff097          	auipc	ra,0xfffff
    80006088:	a68080e7          	jalr	-1432(ra) # 80004aec <panic>
	...
