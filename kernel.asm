
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
    8000001c:	69d030ef          	jal	ra,80003eb8 <start>

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
    8000107c:	3d0020ef          	jal	ra,8000344c <exceptionHandler>


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
    80001280:	6f0080e7          	jalr	1776(ra) # 8000296c <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    80001284:	0004b503          	ld	a0,0(s1)
    80001288:	00003097          	auipc	ra,0x3
    8000128c:	8b8080e7          	jalr	-1864(ra) # 80003b40 <_ZN9Scheduler3putEP7_thread>
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
    8000133c:	634080e7          	jalr	1588(ra) # 8000296c <_ZN7_thread11setSleepingEb>
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
    80001688:	2bc080e7          	jalr	700(ra) # 80002940 <_ZN7_thread9setClosedEb>
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
    80001734:	1e0080e7          	jalr	480(ra) # 80002910 <_ZN7_thread10setBlockedEb>
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
    800017a8:	16c080e7          	jalr	364(ra) # 80002910 <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    800017ac:	00048513          	mv	a0,s1
    800017b0:	00000097          	auipc	ra,0x0
    800017b4:	c10080e7          	jalr	-1008(ra) # 800013c0 <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    800017b8:	0004b503          	ld	a0,0(s1)
    800017bc:	00002097          	auipc	ra,0x2
    800017c0:	384080e7          	jalr	900(ra) # 80003b40 <_ZN9Scheduler3putEP7_thread>
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
    80001834:	314080e7          	jalr	788(ra) # 80002b44 <_ZN11HeapManagerD1Ev>
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
    8000188c:	2bc080e7          	jalr	700(ra) # 80002b44 <_ZN11HeapManagerD1Ev>
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
    80001be8:	ef8080e7          	jalr	-264(ra) # 80002adc <_ZN11HeapManagerC1Ev>
    80001bec:	00848513          	addi	a0,s1,8
    80001bf0:	00002097          	auipc	ra,0x2
    80001bf4:	eb8080e7          	jalr	-328(ra) # 80003aa8 <_ZN9SchedulerC1Ev>
    80001bf8:	01848513          	addi	a0,s1,24
    80001bfc:	fffff097          	auipc	ra,0xfffff
    80001c00:	504080e7          	jalr	1284(ra) # 80001100 <_ZN5TimerC1Ev>
    80001c04:	0200006f          	j	80001c24 <_ZN6KernelC1Ev+0x5c>
    80001c08:	00050913          	mv	s2,a0
    80001c0c:	00048513          	mv	a0,s1
    80001c10:	00001097          	auipc	ra,0x1
    80001c14:	f34080e7          	jalr	-204(ra) # 80002b44 <_ZN11HeapManagerD1Ev>
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
    80001c74:	eec080e7          	jalr	-276(ra) # 80002b5c <_ZN11HeapManager4initEmm>

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
    80001d68:	fcc080e7          	jalr	-52(ra) # 80003d30 <_ZN9Scheduler3getEv>
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
    thread_join(t2);
    80002270:	fd043503          	ld	a0,-48(s0)
    80002274:	fffff097          	auipc	ra,0xfffff
    80002278:	234080e7          	jalr	564(ra) # 800014a8 <_Z11thread_joinP7_thread>
    // if(getc() == 'a')putc('x');
    putc('4');
    8000227c:	03400513          	li	a0,52
    80002280:	fffff097          	auipc	ra,0xfffff
    80002284:	35c080e7          	jalr	860(ra) # 800015dc <_Z4putcc>
    // thread_join(t1);
    // thread_dispatch();
    // thread_dispatch();
    sem_wait(sem2);
    80002288:	0084b503          	ld	a0,8(s1)
    8000228c:	fffff097          	auipc	ra,0xfffff
    80002290:	2d0080e7          	jalr	720(ra) # 8000155c <_Z8sem_waitP4_sem>
    putc('5');
    80002294:	03500513          	li	a0,53
    80002298:	fffff097          	auipc	ra,0xfffff
    8000229c:	344080e7          	jalr	836(ra) # 800015dc <_Z4putcc>
    800022a0:	02813083          	ld	ra,40(sp)
    800022a4:	02013403          	ld	s0,32(sp)
    800022a8:	01813483          	ld	s1,24(sp)
    800022ac:	03010113          	addi	sp,sp,48
    800022b0:	00008067          	ret

00000000800022b4 <_ZN7_threadC1EPFvPvES0_>:
#include "syscalls_c.h"
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    800022b4:	ff010113          	addi	sp,sp,-16
    800022b8:	00813423          	sd	s0,8(sp)
    800022bc:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    800022c0:	00053023          	sd	zero,0(a0)
    800022c4:	00053423          	sd	zero,8(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    800022c8:	00006717          	auipc	a4,0x6
    800022cc:	e9870713          	addi	a4,a4,-360 # 80008160 <_ZN7_thread6nextIDE>
    800022d0:	00072783          	lw	a5,0(a4)
    800022d4:	0017869b          	addiw	a3,a5,1
    800022d8:	00d72023          	sw	a3,0(a4)
    800022dc:	08f52c23          	sw	a5,152(a0)
    closed = 0;
    800022e0:	09c52783          	lw	a5,156(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    800022e4:	0015b593          	seqz	a1,a1
    800022e8:	0045959b          	slliw	a1,a1,0x4
    800022ec:	fe07f793          	andi	a5,a5,-32
    800022f0:	00b7e7b3          	or	a5,a5,a1
    800022f4:	08f52e23          	sw	a5,156(a0)
    reserved = 0;
    800022f8:	0a052783          	lw	a5,160(a0)
    800022fc:	f0000737          	lui	a4,0xf0000
    80002300:	00e7f7b3          	and	a5,a5,a4
    80002304:	0af52023          	sw	a5,160(a0)
    joinHead = 0;
    80002308:	06053c23          	sd	zero,120(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    8000230c:	00200793          	li	a5,2
    80002310:	08f53423          	sd	a5,136(a0)
    stackStart = 0;
    80002314:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    80002318:	00053823          	sd	zero,16(a0)
    context.s1 = 0;
    8000231c:	00053c23          	sd	zero,24(a0)
    context.s2 = 0;
    80002320:	02053023          	sd	zero,32(a0)
    context.s3 = 0;
    80002324:	02053423          	sd	zero,40(a0)
    context.s4 = 0;
    80002328:	02053823          	sd	zero,48(a0)
    context.s5 = 0;
    8000232c:	02053c23          	sd	zero,56(a0)
    context.s6 = 0;
    80002330:	04053023          	sd	zero,64(a0)
    context.s7 = 0;
    80002334:	04053423          	sd	zero,72(a0)
    context.s8 = 0;
    80002338:	04053823          	sd	zero,80(a0)
    context.s9 = 0;
    8000233c:	04053c23          	sd	zero,88(a0)
    context.s10 = 0;
    80002340:	06053023          	sd	zero,96(a0)
    context.s11 = 0;
    80002344:	06053423          	sd	zero,104(a0)

    context.sstatus = 0;
    80002348:	06053823          	sd	zero,112(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    8000234c:	00000797          	auipc	a5,0x0
    80002350:	55878793          	addi	a5,a5,1368 # 800028a4 <_ZN7_thread7wrapperEv>
    80002354:	00f53023          	sd	a5,0(a0)
}
    80002358:	00813403          	ld	s0,8(sp)
    8000235c:	01010113          	addi	sp,sp,16
    80002360:	00008067          	ret

0000000080002364 <_Z10popSppSpieb>:

void popSppSpie(bool kernel = false){
    80002364:	ff010113          	addi	sp,sp,-16
    80002368:	00813423          	sd	s0,8(sp)
    8000236c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002370:	14109073          	csrw	sepc,ra
    if(kernel){
    80002374:	00050e63          	beqz	a0,80002390 <_Z10popSppSpieb+0x2c>
        __asm__ volatile ("csrs sstatus, %0" :: "r" (1 << 8));
    80002378:	10000793          	li	a5,256
    8000237c:	1007a073          	csrs	sstatus,a5
    }else{
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    }
    __asm__ volatile ("sret");
    80002380:	10200073          	sret
}
    80002384:	00813403          	ld	s0,8(sp)
    80002388:	01010113          	addi	sp,sp,16
    8000238c:	00008067          	ret
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002390:	10000793          	li	a5,256
    80002394:	1007b073          	csrc	sstatus,a5
    80002398:	fe9ff06f          	j	80002380 <_Z10popSppSpieb+0x1c>

000000008000239c <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    8000239c:	fe010113          	addi	sp,sp,-32
    800023a0:	00113c23          	sd	ra,24(sp)
    800023a4:	00813823          	sd	s0,16(sp)
    800023a8:	00913423          	sd	s1,8(sp)
    800023ac:	01213023          	sd	s2,0(sp)
    800023b0:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    800023b4:	07853483          	ld	s1,120(a0)
    while(current != 0){
    800023b8:	0c048e63          	beqz	s1,80002494 <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    800023bc:	0004c503          	lbu	a0,0(s1)
    800023c0:	0014c783          	lbu	a5,1(s1)
    800023c4:	00879793          	slli	a5,a5,0x8
    800023c8:	00a7e7b3          	or	a5,a5,a0
    800023cc:	0024c503          	lbu	a0,2(s1)
    800023d0:	01051513          	slli	a0,a0,0x10
    800023d4:	00f567b3          	or	a5,a0,a5
    800023d8:	0034c503          	lbu	a0,3(s1)
    800023dc:	01851513          	slli	a0,a0,0x18
    800023e0:	00f56533          	or	a0,a0,a5
    800023e4:	0044c783          	lbu	a5,4(s1)
    800023e8:	02079793          	slli	a5,a5,0x20
    800023ec:	00a7e533          	or	a0,a5,a0
    800023f0:	0054c783          	lbu	a5,5(s1)
    800023f4:	02879793          	slli	a5,a5,0x28
    800023f8:	00a7e7b3          	or	a5,a5,a0
    800023fc:	0064c503          	lbu	a0,6(s1)
    80002400:	03051513          	slli	a0,a0,0x30
    80002404:	00f567b3          	or	a5,a0,a5
    80002408:	0074c503          	lbu	a0,7(s1)
    8000240c:	03851513          	slli	a0,a0,0x38
    80002410:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80002414:	09c52783          	lw	a5,156(a0)
    80002418:	ffd7f793          	andi	a5,a5,-3
    8000241c:	08f52e23          	sw	a5,156(a0)
        Scheduler::put(thread);
    80002420:	00001097          	auipc	ra,0x1
    80002424:	720080e7          	jalr	1824(ra) # 80003b40 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80002428:	0084c903          	lbu	s2,8(s1)
    8000242c:	0094c783          	lbu	a5,9(s1)
    80002430:	00879793          	slli	a5,a5,0x8
    80002434:	0127e7b3          	or	a5,a5,s2
    80002438:	00a4c903          	lbu	s2,10(s1)
    8000243c:	01091913          	slli	s2,s2,0x10
    80002440:	00f967b3          	or	a5,s2,a5
    80002444:	00b4c903          	lbu	s2,11(s1)
    80002448:	01891913          	slli	s2,s2,0x18
    8000244c:	00f96933          	or	s2,s2,a5
    80002450:	00c4c783          	lbu	a5,12(s1)
    80002454:	02079793          	slli	a5,a5,0x20
    80002458:	0127e933          	or	s2,a5,s2
    8000245c:	00d4c783          	lbu	a5,13(s1)
    80002460:	02879793          	slli	a5,a5,0x28
    80002464:	0127e7b3          	or	a5,a5,s2
    80002468:	00e4c903          	lbu	s2,14(s1)
    8000246c:	03091913          	slli	s2,s2,0x30
    80002470:	00f967b3          	or	a5,s2,a5
    80002474:	00f4c903          	lbu	s2,15(s1)
    80002478:	03891913          	slli	s2,s2,0x38
    8000247c:	00f96933          	or	s2,s2,a5
        mem_free(current);
    80002480:	00048513          	mv	a0,s1
    80002484:	fffff097          	auipc	ra,0xfffff
    80002488:	f3c080e7          	jalr	-196(ra) # 800013c0 <_Z8mem_freePv>
        current = next;
    8000248c:	00090493          	mv	s1,s2
    while(current != 0){
    80002490:	f29ff06f          	j	800023b8 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80002494:	01813083          	ld	ra,24(sp)
    80002498:	01013403          	ld	s0,16(sp)
    8000249c:	00813483          	ld	s1,8(sp)
    800024a0:	00013903          	ld	s2,0(sp)
    800024a4:	02010113          	addi	sp,sp,32
    800024a8:	00008067          	ret

00000000800024ac <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    800024ac:	fc010113          	addi	sp,sp,-64
    800024b0:	02113c23          	sd	ra,56(sp)
    800024b4:	02813823          	sd	s0,48(sp)
    800024b8:	02913423          	sd	s1,40(sp)
    800024bc:	03213023          	sd	s2,32(sp)
    800024c0:	01313c23          	sd	s3,24(sp)
    800024c4:	01413823          	sd	s4,16(sp)
    800024c8:	01513423          	sd	s5,8(sp)
    800024cc:	04010413          	addi	s0,sp,64
    800024d0:	00050493          	mv	s1,a0
    800024d4:	00058913          	mv	s2,a1
    800024d8:	00060a93          	mv	s5,a2
    800024dc:	00068993          	mv	s3,a3
    800024e0:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    800024e4:	0b800513          	li	a0,184
    800024e8:	fffff097          	auipc	ra,0xfffff
    800024ec:	ea8080e7          	jalr	-344(ra) # 80001390 <_Z9mem_allocm>
    800024f0:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    800024f4:	18050063          	beqz	a0,80002674 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    800024f8:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    800024fc:	0004b783          	ld	a5,0(s1)
    80002500:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80002504:	00006717          	auipc	a4,0x6
    80002508:	c5c70713          	addi	a4,a4,-932 # 80008160 <_ZN7_thread6nextIDE>
    8000250c:	00072783          	lw	a5,0(a4)
    80002510:	0017869b          	addiw	a3,a5,1
    80002514:	00d72023          	sw	a3,0(a4)
    80002518:	0004b703          	ld	a4,0(s1)
    8000251c:	08f72c23          	sw	a5,152(a4)
    (*thread)->closed = false;
    80002520:	0004b703          	ld	a4,0(s1)
    80002524:	09c72783          	lw	a5,156(a4)
    80002528:	ffe7f793          	andi	a5,a5,-2
    8000252c:	08f72e23          	sw	a5,156(a4)
    (*thread)->blocked = false;
    80002530:	0004b703          	ld	a4,0(s1)
    80002534:	09c72783          	lw	a5,156(a4)
    80002538:	ffd7f793          	andi	a5,a5,-3
    8000253c:	08f72e23          	sw	a5,156(a4)
    (*thread)->sleeping = false;
    80002540:	0004b703          	ld	a4,0(s1)
    80002544:	09c72783          	lw	a5,156(a4)
    80002548:	ffb7f793          	andi	a5,a5,-5
    8000254c:	08f72e23          	sw	a5,156(a4)
    (*thread)->finished = false;
    80002550:	0004b703          	ld	a4,0(s1)
    80002554:	09c72783          	lw	a5,156(a4)
    80002558:	ff77f793          	andi	a5,a5,-9
    8000255c:	08f72e23          	sw	a5,156(a4)
    (*thread)->kernel = (function == 0);
    80002560:	0004b703          	ld	a4,0(s1)
    80002564:	00193913          	seqz	s2,s2
    80002568:	0049191b          	slliw	s2,s2,0x4
    8000256c:	09c72783          	lw	a5,156(a4)
    80002570:	fef7f793          	andi	a5,a5,-17
    80002574:	0127e933          	or	s2,a5,s2
    80002578:	09272e23          	sw	s2,156(a4)
    (*thread)->reserved = 0;
    8000257c:	0004b703          	ld	a4,0(s1)
    80002580:	0a072783          	lw	a5,160(a4)
    80002584:	f00006b7          	lui	a3,0xf0000
    80002588:	00d7f7b3          	and	a5,a5,a3
    8000258c:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = 0;
    80002590:	0004b783          	ld	a5,0(s1)
    80002594:	0607bc23          	sd	zero,120(a5)
    (*thread)->joinTail = 0;
    80002598:	0004b783          	ld	a5,0(s1)
    8000259c:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    800025a0:	0004b783          	ld	a5,0(s1)
    800025a4:	00200713          	li	a4,2
    800025a8:	08e7b423          	sd	a4,136(a5)
    (*thread)->stackStart = 0;
    800025ac:	0004b783          	ld	a5,0(s1)
    800025b0:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    800025b4:	0004b783          	ld	a5,0(s1)
    800025b8:	0007b823          	sd	zero,16(a5)
    (*thread)->context.s1 = 0;
    800025bc:	0004b783          	ld	a5,0(s1)
    800025c0:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s2 = 0;
    800025c4:	0004b783          	ld	a5,0(s1)
    800025c8:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s3 = 0;
    800025cc:	0004b783          	ld	a5,0(s1)
    800025d0:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s4 = 0;
    800025d4:	0004b783          	ld	a5,0(s1)
    800025d8:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s5 = 0;
    800025dc:	0004b783          	ld	a5,0(s1)
    800025e0:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s6 = 0;
    800025e4:	0004b783          	ld	a5,0(s1)
    800025e8:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s7 = 0;
    800025ec:	0004b783          	ld	a5,0(s1)
    800025f0:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s8 = 0;
    800025f4:	0004b783          	ld	a5,0(s1)
    800025f8:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s9 = 0;
    800025fc:	0004b783          	ld	a5,0(s1)
    80002600:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s10 = 0;
    80002604:	0004b783          	ld	a5,0(s1)
    80002608:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s11 = 0;
    8000260c:	0004b783          	ld	a5,0(s1)
    80002610:	0607b423          	sd	zero,104(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80002614:	0004b783          	ld	a5,0(s1)
    80002618:	0137b423          	sd	s3,8(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    8000261c:	0004b783          	ld	a5,0(s1)
    80002620:	00000717          	auipc	a4,0x0
    80002624:	28470713          	addi	a4,a4,644 # 800028a4 <_ZN7_thread7wrapperEv>
    80002628:	00e7b023          	sd	a4,0(a5)

    (*thread)->stackStart = stack;
    8000262c:	0004b783          	ld	a5,0(s1)
    80002630:	0937b823          	sd	s3,144(a5)
    if(start){
    80002634:	020a1663          	bnez	s4,80002660 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    80002638:	00000513          	li	a0,0
}
    8000263c:	03813083          	ld	ra,56(sp)
    80002640:	03013403          	ld	s0,48(sp)
    80002644:	02813483          	ld	s1,40(sp)
    80002648:	02013903          	ld	s2,32(sp)
    8000264c:	01813983          	ld	s3,24(sp)
    80002650:	01013a03          	ld	s4,16(sp)
    80002654:	00813a83          	ld	s5,8(sp)
    80002658:	04010113          	addi	sp,sp,64
    8000265c:	00008067          	ret
        Scheduler::put(*thread);
    80002660:	0004b503          	ld	a0,0(s1)
    80002664:	00001097          	auipc	ra,0x1
    80002668:	4dc080e7          	jalr	1244(ra) # 80003b40 <_ZN9Scheduler3putEP7_thread>
    return 0;
    8000266c:	00000513          	li	a0,0
    80002670:	fcdff06f          	j	8000263c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    80002674:	fff00513          	li	a0,-1
    80002678:	fc5ff06f          	j	8000263c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

000000008000267c <_ZN7_thread4joinEPS_>:

void _thread::join(thread_t thread){
    /// cannot join to a finished or closed thread
    if(thread->finished || thread->closed){
    8000267c:	0985b783          	ld	a5,152(a1)
    80002680:	00900713          	li	a4,9
    80002684:	02071713          	slli	a4,a4,0x20
    80002688:	00e7f7b3          	and	a5,a5,a4
    8000268c:	00078463          	beqz	a5,80002694 <_ZN7_thread4joinEPS_+0x18>
    80002690:	00008067          	ret
void _thread::join(thread_t thread){
    80002694:	fe010113          	addi	sp,sp,-32
    80002698:	00113c23          	sd	ra,24(sp)
    8000269c:	00813823          	sd	s0,16(sp)
    800026a0:	00913423          	sd	s1,8(sp)
    800026a4:	01213023          	sd	s2,0(sp)
    800026a8:	02010413          	addi	s0,sp,32
    800026ac:	00050493          	mv	s1,a0
    800026b0:	00058913          	mv	s2,a1
        return;
    }
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    800026b4:	01000513          	li	a0,16
    800026b8:	fffff097          	auipc	ra,0xfffff
    800026bc:	cd8080e7          	jalr	-808(ra) # 80001390 <_Z9mem_allocm>
    this->blocked = true;
    800026c0:	09c4a703          	lw	a4,156(s1)
    800026c4:	00276713          	ori	a4,a4,2
    800026c8:	08e4ae23          	sw	a4,156(s1)
    newJoin->thread = this;
    800026cc:	00950023          	sb	s1,0(a0)
    800026d0:	0084d713          	srli	a4,s1,0x8
    800026d4:	00e500a3          	sb	a4,1(a0)
    800026d8:	0104d713          	srli	a4,s1,0x10
    800026dc:	00e50123          	sb	a4,2(a0)
    800026e0:	0184d71b          	srliw	a4,s1,0x18
    800026e4:	00e501a3          	sb	a4,3(a0)
    800026e8:	0204d713          	srli	a4,s1,0x20
    800026ec:	00e50223          	sb	a4,4(a0)
    800026f0:	0284d713          	srli	a4,s1,0x28
    800026f4:	00e502a3          	sb	a4,5(a0)
    800026f8:	0304d713          	srli	a4,s1,0x30
    800026fc:	00e50323          	sb	a4,6(a0)
    80002700:	0384d493          	srli	s1,s1,0x38
    80002704:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80002708:	00050423          	sb	zero,8(a0)
    8000270c:	000504a3          	sb	zero,9(a0)
    80002710:	00050523          	sb	zero,10(a0)
    80002714:	000505a3          	sb	zero,11(a0)
    80002718:	00050623          	sb	zero,12(a0)
    8000271c:	000506a3          	sb	zero,13(a0)
    80002720:	00050723          	sb	zero,14(a0)
    80002724:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    80002728:	07893703          	ld	a4,120(s2)
    8000272c:	06070463          	beqz	a4,80002794 <_ZN7_thread4joinEPS_+0x118>
        thread->joinHead = newJoin;
        thread->joinTail = newJoin;
    }else{
        thread->joinTail->next = newJoin;
    80002730:	08093703          	ld	a4,128(s2)
    80002734:	00a70423          	sb	a0,8(a4)
    80002738:	00855693          	srli	a3,a0,0x8
    8000273c:	00d704a3          	sb	a3,9(a4)
    80002740:	01055693          	srli	a3,a0,0x10
    80002744:	00d70523          	sb	a3,10(a4)
    80002748:	0185569b          	srliw	a3,a0,0x18
    8000274c:	00d705a3          	sb	a3,11(a4)
    80002750:	02055693          	srli	a3,a0,0x20
    80002754:	00d70623          	sb	a3,12(a4)
    80002758:	02855693          	srli	a3,a0,0x28
    8000275c:	00d706a3          	sb	a3,13(a4)
    80002760:	03055693          	srli	a3,a0,0x30
    80002764:	00d70723          	sb	a3,14(a4)
    80002768:	03855693          	srli	a3,a0,0x38
    8000276c:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    80002770:	08a93023          	sd	a0,128(s2)
    }
    // Scheduler::remove(this);
    thread_dispatch();
    80002774:	fffff097          	auipc	ra,0xfffff
    80002778:	d14080e7          	jalr	-748(ra) # 80001488 <_Z15thread_dispatchv>
}
    8000277c:	01813083          	ld	ra,24(sp)
    80002780:	01013403          	ld	s0,16(sp)
    80002784:	00813483          	ld	s1,8(sp)
    80002788:	00013903          	ld	s2,0(sp)
    8000278c:	02010113          	addi	sp,sp,32
    80002790:	00008067          	ret
        thread->joinHead = newJoin;
    80002794:	06a93c23          	sd	a0,120(s2)
        thread->joinTail = newJoin;
    80002798:	08a93023          	sd	a0,128(s2)
    8000279c:	fd9ff06f          	j	80002774 <_ZN7_thread4joinEPS_+0xf8>

00000000800027a0 <_ZN7_thread4tickEv>:

int _thread::tick(){
    if(currentThread->blocked){
    800027a0:	00006797          	auipc	a5,0x6
    800027a4:	9c87b783          	ld	a5,-1592(a5) # 80008168 <_ZN7_thread13currentThreadE>
    800027a8:	09c7a783          	lw	a5,156(a5)
    800027ac:	0027f713          	andi	a4,a5,2
    800027b0:	06071063          	bnez	a4,80002810 <_ZN7_thread4tickEv+0x70>
        return -1;
    }
    if(currentThread->closed){
    800027b4:	0017f713          	andi	a4,a5,1
    800027b8:	06071063          	bnez	a4,80002818 <_ZN7_thread4tickEv+0x78>
        return -2;
    }
    if(currentThread->sleeping){
    800027bc:	0047f713          	andi	a4,a5,4
    800027c0:	06071063          	bnez	a4,80002820 <_ZN7_thread4tickEv+0x80>
        return -3;
    }
    if(currentThread->finished){
    800027c4:	0087f793          	andi	a5,a5,8
    800027c8:	06079063          	bnez	a5,80002828 <_ZN7_thread4tickEv+0x88>
        return -4;
    }
    timeLeft --;
    800027cc:	08853783          	ld	a5,136(a0)
    800027d0:	fff78793          	addi	a5,a5,-1
    800027d4:	08f53423          	sd	a5,136(a0)
    if(timeLeft == 0){
    800027d8:	00078663          	beqz	a5,800027e4 <_ZN7_thread4tickEv+0x44>
        // __putc('d');
        // __putc('0' + currentThread->ID);
        // __putc('\n');
        thread_dispatch();
    }
    return 0;
    800027dc:	00000513          	li	a0,0
}
    800027e0:	00008067          	ret
int _thread::tick(){
    800027e4:	ff010113          	addi	sp,sp,-16
    800027e8:	00113423          	sd	ra,8(sp)
    800027ec:	00813023          	sd	s0,0(sp)
    800027f0:	01010413          	addi	s0,sp,16
        thread_dispatch();
    800027f4:	fffff097          	auipc	ra,0xfffff
    800027f8:	c94080e7          	jalr	-876(ra) # 80001488 <_Z15thread_dispatchv>
    return 0;
    800027fc:	00000513          	li	a0,0
}
    80002800:	00813083          	ld	ra,8(sp)
    80002804:	00013403          	ld	s0,0(sp)
    80002808:	01010113          	addi	sp,sp,16
    8000280c:	00008067          	ret
        return -1;
    80002810:	fff00513          	li	a0,-1
    80002814:	00008067          	ret
        return -2;
    80002818:	ffe00513          	li	a0,-2
    8000281c:	00008067          	ret
        return -3;
    80002820:	ffd00513          	li	a0,-3
    80002824:	00008067          	ret
        return -4;
    80002828:	ffc00513          	li	a0,-4
    8000282c:	00008067          	ret

0000000080002830 <_ZN7_thread4exitEv>:

int _thread::exit(){
    if(currentThread->closed){
    80002830:	00006717          	auipc	a4,0x6
    80002834:	93873703          	ld	a4,-1736(a4) # 80008168 <_ZN7_thread13currentThreadE>
    80002838:	09c72783          	lw	a5,156(a4)
    8000283c:	0017f693          	andi	a3,a5,1
    80002840:	04069663          	bnez	a3,8000288c <_ZN7_thread4exitEv+0x5c>
        return -1;
    }
    if(currentThread->blocked){
    80002844:	0027f693          	andi	a3,a5,2
    80002848:	04069663          	bnez	a3,80002894 <_ZN7_thread4exitEv+0x64>
        return -2;
    }
    if(currentThread->sleeping){
    8000284c:	0047f793          	andi	a5,a5,4
    80002850:	04079663          	bnez	a5,8000289c <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    80002854:	ff010113          	addi	sp,sp,-16
    80002858:	00113423          	sd	ra,8(sp)
    8000285c:	00813023          	sd	s0,0(sp)
    80002860:	01010413          	addi	s0,sp,16
        return -3;
    }
    currentThread->finished = 1;
    80002864:	09c72783          	lw	a5,156(a4)
    80002868:	0087e793          	ori	a5,a5,8
    8000286c:	08f72e23          	sw	a5,156(a4)
    thread_dispatch();
    80002870:	fffff097          	auipc	ra,0xfffff
    80002874:	c18080e7          	jalr	-1000(ra) # 80001488 <_Z15thread_dispatchv>
    return 0;
    80002878:	00000513          	li	a0,0
}
    8000287c:	00813083          	ld	ra,8(sp)
    80002880:	00013403          	ld	s0,0(sp)
    80002884:	01010113          	addi	sp,sp,16
    80002888:	00008067          	ret
        return -1;
    8000288c:	fff00513          	li	a0,-1
    80002890:	00008067          	ret
        return -2;
    80002894:	ffe00513          	li	a0,-2
    80002898:	00008067          	ret
        return -3;
    8000289c:	ffd00513          	li	a0,-3
}
    800028a0:	00008067          	ret

00000000800028a4 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    800028a4:	fe010113          	addi	sp,sp,-32
    800028a8:	00113c23          	sd	ra,24(sp)
    800028ac:	00813823          	sd	s0,16(sp)
    800028b0:	00913423          	sd	s1,8(sp)
    800028b4:	02010413          	addi	s0,sp,32
    popSppSpie(currentThread->kernel);
    800028b8:	00006497          	auipc	s1,0x6
    800028bc:	8a848493          	addi	s1,s1,-1880 # 80008160 <_ZN7_thread6nextIDE>
    800028c0:	0084b783          	ld	a5,8(s1)
    800028c4:	09c7a503          	lw	a0,156(a5)
    800028c8:	4045551b          	sraiw	a0,a0,0x4
    800028cc:	00157513          	andi	a0,a0,1
    800028d0:	00000097          	auipc	ra,0x0
    800028d4:	a94080e7          	jalr	-1388(ra) # 80002364 <_Z10popSppSpieb>
    currentThread->function(currentThread->arg);
    800028d8:	0084b783          	ld	a5,8(s1)
    800028dc:	0a87b703          	ld	a4,168(a5)
    800028e0:	0b07b503          	ld	a0,176(a5)
    800028e4:	000700e7          	jalr	a4
    currentThread->unJoin();
    800028e8:	0084b503          	ld	a0,8(s1)
    800028ec:	00000097          	auipc	ra,0x0
    800028f0:	ab0080e7          	jalr	-1360(ra) # 8000239c <_ZN7_thread6unJoinEv>
    exit();
    800028f4:	00000097          	auipc	ra,0x0
    800028f8:	f3c080e7          	jalr	-196(ra) # 80002830 <_ZN7_thread4exitEv>
}
    800028fc:	01813083          	ld	ra,24(sp)
    80002900:	01013403          	ld	s0,16(sp)
    80002904:	00813483          	ld	s1,8(sp)
    80002908:	02010113          	addi	sp,sp,32
    8000290c:	00008067          	ret

0000000080002910 <_ZN7_thread10setBlockedEb>:

void _thread::setBlocked(bool blocked){
    80002910:	ff010113          	addi	sp,sp,-16
    80002914:	00813423          	sd	s0,8(sp)
    80002918:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    8000291c:	0015f593          	andi	a1,a1,1
    80002920:	0015979b          	slliw	a5,a1,0x1
    80002924:	09c52583          	lw	a1,156(a0)
    80002928:	ffd5f593          	andi	a1,a1,-3
    8000292c:	00f5e5b3          	or	a1,a1,a5
    80002930:	08b52e23          	sw	a1,156(a0)
}
    80002934:	00813403          	ld	s0,8(sp)
    80002938:	01010113          	addi	sp,sp,16
    8000293c:	00008067          	ret

0000000080002940 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80002940:	ff010113          	addi	sp,sp,-16
    80002944:	00813423          	sd	s0,8(sp)
    80002948:	01010413          	addi	s0,sp,16
    this->closed = closed;
    8000294c:	0015f793          	andi	a5,a1,1
    80002950:	09c52583          	lw	a1,156(a0)
    80002954:	ffe5f593          	andi	a1,a1,-2
    80002958:	00f5e5b3          	or	a1,a1,a5
    8000295c:	08b52e23          	sw	a1,156(a0)
}
    80002960:	00813403          	ld	s0,8(sp)
    80002964:	01010113          	addi	sp,sp,16
    80002968:	00008067          	ret

000000008000296c <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    8000296c:	ff010113          	addi	sp,sp,-16
    80002970:	00813423          	sd	s0,8(sp)
    80002974:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    80002978:	0015f593          	andi	a1,a1,1
    8000297c:	0025979b          	slliw	a5,a1,0x2
    80002980:	09c52583          	lw	a1,156(a0)
    80002984:	ffb5f593          	andi	a1,a1,-5
    80002988:	00f5e5b3          	or	a1,a1,a5
    8000298c:	08b52e23          	sw	a1,156(a0)
}
    80002990:	00813403          	ld	s0,8(sp)
    80002994:	01010113          	addi	sp,sp,16
    80002998:	00008067          	ret

000000008000299c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
    // __putc('\n');
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    // __putc('.');
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    8000299c:	ff010113          	addi	sp,sp,-16
    800029a0:	00813423          	sd	s0,8(sp)
    800029a4:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    800029a8:	04050263          	beqz	a0,800029ec <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    800029ac:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    800029b0:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    800029b4:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    800029b8:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    800029bc:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    800029c0:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    800029c4:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    800029c8:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    800029cc:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    800029d0:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    800029d4:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    800029d8:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    800029dc:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    800029e0:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    800029e4:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    800029e8:	06853823          	sd	s0,112(a0)
    //         __putc('a' + digit - 10);
    //     }
    // }
    // __putc('\n');
    
    if(newContext->sp != 0){
    800029ec:	0085b783          	ld	a5,8(a1)
    800029f0:	00078463          	beqz	a5,800029f8 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    800029f4:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    800029f8:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    800029fc:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    80002a00:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80002a04:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    80002a08:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80002a0c:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80002a10:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80002a14:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80002a18:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80002a1c:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80002a20:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    80002a24:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    80002a28:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    80002a2c:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    80002a30:	0685bd83          	ld	s11,104(a1)

    return;

}
    80002a34:	00813403          	ld	s0,8(sp)
    80002a38:	01010113          	addi	sp,sp,16
    80002a3c:	00008067          	ret

0000000080002a40 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80002a40:	fe010113          	addi	sp,sp,-32
    80002a44:	00113c23          	sd	ra,24(sp)
    80002a48:	00813823          	sd	s0,16(sp)
    80002a4c:	00913423          	sd	s1,8(sp)
    80002a50:	01213023          	sd	s2,0(sp)
    80002a54:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    80002a58:	00005917          	auipc	s2,0x5
    80002a5c:	70890913          	addi	s2,s2,1800 # 80008160 <_ZN7_thread6nextIDE>
    80002a60:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    80002a64:	00001097          	auipc	ra,0x1
    80002a68:	2cc080e7          	jalr	716(ra) # 80003d30 <_ZN9Scheduler3getEv>
    80002a6c:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    80002a70:	00200793          	li	a5,2
    80002a74:	08f4b423          	sd	a5,136(s1)
    if(currentThread == nullptr){
    80002a78:	04050463          	beqz	a0,80002ac0 <_ZN7_thread8dispatchEv+0x80>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80002a7c:	00048c63          	beqz	s1,80002a94 <_ZN7_thread8dispatchEv+0x54>
    80002a80:	0984b783          	ld	a5,152(s1)
    80002a84:	00f00713          	li	a4,15
    80002a88:	02071713          	slli	a4,a4,0x20
    80002a8c:	00e7f7b3          	and	a5,a5,a4
    80002a90:	02078e63          	beqz	a5,80002acc <_ZN7_thread8dispatchEv+0x8c>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    80002a94:	00005597          	auipc	a1,0x5
    80002a98:	6d45b583          	ld	a1,1748(a1) # 80008168 <_ZN7_thread13currentThreadE>
    80002a9c:	00048513          	mv	a0,s1
    80002aa0:	00000097          	auipc	ra,0x0
    80002aa4:	efc080e7          	jalr	-260(ra) # 8000299c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    80002aa8:	01813083          	ld	ra,24(sp)
    80002aac:	01013403          	ld	s0,16(sp)
    80002ab0:	00813483          	ld	s1,8(sp)
    80002ab4:	00013903          	ld	s2,0(sp)
    80002ab8:	02010113          	addi	sp,sp,32
    80002abc:	00008067          	ret
        currentThread = oldThread;
    80002ac0:	00005797          	auipc	a5,0x5
    80002ac4:	6a97b423          	sd	s1,1704(a5) # 80008168 <_ZN7_thread13currentThreadE>
        return;
    80002ac8:	fe1ff06f          	j	80002aa8 <_ZN7_thread8dispatchEv+0x68>
        Scheduler::put(oldThread);
    80002acc:	00048513          	mv	a0,s1
    80002ad0:	00001097          	auipc	ra,0x1
    80002ad4:	070080e7          	jalr	112(ra) # 80003b40 <_ZN9Scheduler3putEP7_thread>
    80002ad8:	fbdff06f          	j	80002a94 <_ZN7_thread8dispatchEv+0x54>

0000000080002adc <_ZN11HeapManagerC1Ev>:
#include "hw.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80002adc:	fe010113          	addi	sp,sp,-32
    80002ae0:	00113c23          	sd	ra,24(sp)
    80002ae4:	00813823          	sd	s0,16(sp)
    80002ae8:	00913423          	sd	s1,8(sp)
    80002aec:	02010413          	addi	s0,sp,32
    80002af0:	00050493          	mv	s1,a0
    assert(instance == 0);
    80002af4:	00005797          	auipc	a5,0x5
    80002af8:	67c7b783          	ld	a5,1660(a5) # 80008170 <_ZN11HeapManager8instanceE>
    80002afc:	02079063          	bnez	a5,80002b1c <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80002b00:	00005797          	auipc	a5,0x5
    80002b04:	6697b823          	sd	s1,1648(a5) # 80008170 <_ZN11HeapManager8instanceE>
}
    80002b08:	01813083          	ld	ra,24(sp)
    80002b0c:	01013403          	ld	s0,16(sp)
    80002b10:	00813483          	ld	s1,8(sp)
    80002b14:	02010113          	addi	sp,sp,32
    80002b18:	00008067          	ret
    assert(instance == 0);
    80002b1c:	00004697          	auipc	a3,0x4
    80002b20:	5b468693          	addi	a3,a3,1460 # 800070d0 <CONSOLE_STATUS+0xc0>
    80002b24:	01300613          	li	a2,19
    80002b28:	00004597          	auipc	a1,0x4
    80002b2c:	5c858593          	addi	a1,a1,1480 # 800070f0 <CONSOLE_STATUS+0xe0>
    80002b30:	00004517          	auipc	a0,0x4
    80002b34:	51050513          	addi	a0,a0,1296 # 80007040 <CONSOLE_STATUS+0x30>
    80002b38:	fffff097          	auipc	ra,0xfffff
    80002b3c:	d64080e7          	jalr	-668(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80002b40:	fc1ff06f          	j	80002b00 <_ZN11HeapManagerC1Ev+0x24>

0000000080002b44 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80002b44:	ff010113          	addi	sp,sp,-16
    80002b48:	00813423          	sd	s0,8(sp)
    80002b4c:	01010413          	addi	s0,sp,16
    
}
    80002b50:	00813403          	ld	s0,8(sp)
    80002b54:	01010113          	addi	sp,sp,16
    80002b58:	00008067          	ret

0000000080002b5c <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    80002b5c:	fd010113          	addi	sp,sp,-48
    80002b60:	02113423          	sd	ra,40(sp)
    80002b64:	02813023          	sd	s0,32(sp)
    80002b68:	00913c23          	sd	s1,24(sp)
    80002b6c:	01213823          	sd	s2,16(sp)
    80002b70:	01313423          	sd	s3,8(sp)
    80002b74:	03010413          	addi	s0,sp,48
    80002b78:	00050993          	mv	s3,a0
    80002b7c:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002b80:	40b604b3          	sub	s1,a2,a1
    80002b84:	0414b793          	sltiu	a5,s1,65
    80002b88:	0c079863          	bnez	a5,80002c58 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80002b8c:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80002b90:	fde00793          	li	a5,-34
    80002b94:	00f90c23          	sb	a5,24(s2)
    80002b98:	fc000713          	li	a4,-64
    80002b9c:	00e90ca3          	sb	a4,25(s2)
    80002ba0:	fad00713          	li	a4,-83
    80002ba4:	00e90d23          	sb	a4,26(s2)
    80002ba8:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart - MEM_BLOCK_SIZE) / MEM_BLOCK_SIZE;
    80002bac:	fc048613          	addi	a2,s1,-64
    80002bb0:	0009b783          	ld	a5,0(s3)
    80002bb4:	00665713          	srli	a4,a2,0x6
    80002bb8:	00e78823          	sb	a4,16(a5)
    80002bbc:	00e65713          	srli	a4,a2,0xe
    80002bc0:	00e788a3          	sb	a4,17(a5)
    80002bc4:	01665713          	srli	a4,a2,0x16
    80002bc8:	00e78923          	sb	a4,18(a5)
    80002bcc:	01e65713          	srli	a4,a2,0x1e
    80002bd0:	00e789a3          	sb	a4,19(a5)
    80002bd4:	02665713          	srli	a4,a2,0x26
    80002bd8:	00e78a23          	sb	a4,20(a5)
    80002bdc:	02e65713          	srli	a4,a2,0x2e
    80002be0:	00e78aa3          	sb	a4,21(a5)
    80002be4:	03665713          	srli	a4,a2,0x36
    80002be8:	00e78b23          	sb	a4,22(a5)
    80002bec:	03e65613          	srli	a2,a2,0x3e
    80002bf0:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80002bf4:	0009b783          	ld	a5,0(s3)
    80002bf8:	00078023          	sb	zero,0(a5)
    80002bfc:	000780a3          	sb	zero,1(a5)
    80002c00:	00078123          	sb	zero,2(a5)
    80002c04:	000781a3          	sb	zero,3(a5)
    80002c08:	00078223          	sb	zero,4(a5)
    80002c0c:	000782a3          	sb	zero,5(a5)
    80002c10:	00078323          	sb	zero,6(a5)
    80002c14:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80002c18:	0009b783          	ld	a5,0(s3)
    80002c1c:	00078423          	sb	zero,8(a5)
    80002c20:	000784a3          	sb	zero,9(a5)
    80002c24:	00078523          	sb	zero,10(a5)
    80002c28:	000785a3          	sb	zero,11(a5)
    80002c2c:	00078623          	sb	zero,12(a5)
    80002c30:	000786a3          	sb	zero,13(a5)
    80002c34:	00078723          	sb	zero,14(a5)
    80002c38:	000787a3          	sb	zero,15(a5)
}
    80002c3c:	02813083          	ld	ra,40(sp)
    80002c40:	02013403          	ld	s0,32(sp)
    80002c44:	01813483          	ld	s1,24(sp)
    80002c48:	01013903          	ld	s2,16(sp)
    80002c4c:	00813983          	ld	s3,8(sp)
    80002c50:	03010113          	addi	sp,sp,48
    80002c54:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002c58:	00004697          	auipc	a3,0x4
    80002c5c:	4b068693          	addi	a3,a3,1200 # 80007108 <CONSOLE_STATUS+0xf8>
    80002c60:	01c00613          	li	a2,28
    80002c64:	00004597          	auipc	a1,0x4
    80002c68:	48c58593          	addi	a1,a1,1164 # 800070f0 <CONSOLE_STATUS+0xe0>
    80002c6c:	00004517          	auipc	a0,0x4
    80002c70:	4cc50513          	addi	a0,a0,1228 # 80007138 <CONSOLE_STATUS+0x128>
    80002c74:	fffff097          	auipc	ra,0xfffff
    80002c78:	c28080e7          	jalr	-984(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80002c7c:	f11ff06f          	j	80002b8c <_ZN11HeapManager4initEmm+0x30>

0000000080002c80 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80002c80:	fe010113          	addi	sp,sp,-32
    80002c84:	00113c23          	sd	ra,24(sp)
    80002c88:	00813823          	sd	s0,16(sp)
    80002c8c:	00913423          	sd	s1,8(sp)
    80002c90:	01213023          	sd	s2,0(sp)
    80002c94:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002c98:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80002c9c:	00000913          	li	s2,0
    80002ca0:	0b80006f          	j	80002d58 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        /// how is this an illegal read???
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80002ca4:	0104c783          	lbu	a5,16(s1)
    80002ca8:	0114c703          	lbu	a4,17(s1)
    80002cac:	00871713          	slli	a4,a4,0x8
    80002cb0:	00f76733          	or	a4,a4,a5
    80002cb4:	0124c783          	lbu	a5,18(s1)
    80002cb8:	01079793          	slli	a5,a5,0x10
    80002cbc:	00e7e733          	or	a4,a5,a4
    80002cc0:	0134c783          	lbu	a5,19(s1)
    80002cc4:	01879793          	slli	a5,a5,0x18
    80002cc8:	00e7e7b3          	or	a5,a5,a4
    80002ccc:	0144c703          	lbu	a4,20(s1)
    80002cd0:	02071713          	slli	a4,a4,0x20
    80002cd4:	00f767b3          	or	a5,a4,a5
    80002cd8:	0154c703          	lbu	a4,21(s1)
    80002cdc:	02871713          	slli	a4,a4,0x28
    80002ce0:	00f76733          	or	a4,a4,a5
    80002ce4:	0164c783          	lbu	a5,22(s1)
    80002ce8:	03079793          	slli	a5,a5,0x30
    80002cec:	00e7e733          	or	a4,a5,a4
    80002cf0:	0174c783          	lbu	a5,23(s1)
    80002cf4:	03879793          	slli	a5,a5,0x38
    80002cf8:	00e7e7b3          	or	a5,a5,a4
    80002cfc:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80002d00:	0004c703          	lbu	a4,0(s1)
    80002d04:	0014c783          	lbu	a5,1(s1)
    80002d08:	00879793          	slli	a5,a5,0x8
    80002d0c:	00e7e733          	or	a4,a5,a4
    80002d10:	0024c783          	lbu	a5,2(s1)
    80002d14:	01079793          	slli	a5,a5,0x10
    80002d18:	00e7e7b3          	or	a5,a5,a4
    80002d1c:	0034c703          	lbu	a4,3(s1)
    80002d20:	01871713          	slli	a4,a4,0x18
    80002d24:	00f767b3          	or	a5,a4,a5
    80002d28:	0044c703          	lbu	a4,4(s1)
    80002d2c:	02071713          	slli	a4,a4,0x20
    80002d30:	00f76733          	or	a4,a4,a5
    80002d34:	0054c783          	lbu	a5,5(s1)
    80002d38:	02879793          	slli	a5,a5,0x28
    80002d3c:	00e7e733          	or	a4,a5,a4
    80002d40:	0064c783          	lbu	a5,6(s1)
    80002d44:	03079793          	slli	a5,a5,0x30
    80002d48:	00e7e7b3          	or	a5,a5,a4
    80002d4c:	0074c483          	lbu	s1,7(s1)
    80002d50:	03849493          	slli	s1,s1,0x38
    80002d54:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002d58:	06048263          	beqz	s1,80002dbc <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002d5c:	0184c783          	lbu	a5,24(s1)
    80002d60:	0194c703          	lbu	a4,25(s1)
    80002d64:	00871713          	slli	a4,a4,0x8
    80002d68:	00f76733          	or	a4,a4,a5
    80002d6c:	01a4c783          	lbu	a5,26(s1)
    80002d70:	01079793          	slli	a5,a5,0x10
    80002d74:	00e7e733          	or	a4,a5,a4
    80002d78:	01b4c783          	lbu	a5,27(s1)
    80002d7c:	01879793          	slli	a5,a5,0x18
    80002d80:	00e7e7b3          	or	a5,a5,a4
    80002d84:	0007879b          	sext.w	a5,a5
    80002d88:	deadc737          	lui	a4,0xdeadc
    80002d8c:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2cee>
    80002d90:	f0e78ae3          	beq	a5,a4,80002ca4 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80002d94:	00004697          	auipc	a3,0x4
    80002d98:	3c468693          	addi	a3,a3,964 # 80007158 <CONSOLE_STATUS+0x148>
    80002d9c:	02a00613          	li	a2,42
    80002da0:	00004597          	auipc	a1,0x4
    80002da4:	35058593          	addi	a1,a1,848 # 800070f0 <CONSOLE_STATUS+0xe0>
    80002da8:	00004517          	auipc	a0,0x4
    80002dac:	3d850513          	addi	a0,a0,984 # 80007180 <CONSOLE_STATUS+0x170>
    80002db0:	fffff097          	auipc	ra,0xfffff
    80002db4:	aec080e7          	jalr	-1300(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80002db8:	eedff06f          	j	80002ca4 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80002dbc:	00090513          	mv	a0,s2
    80002dc0:	01813083          	ld	ra,24(sp)
    80002dc4:	01013403          	ld	s0,16(sp)
    80002dc8:	00813483          	ld	s1,8(sp)
    80002dcc:	00013903          	ld	s2,0(sp)
    80002dd0:	02010113          	addi	sp,sp,32
    80002dd4:	00008067          	ret

0000000080002dd8 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80002dd8:	fd010113          	addi	sp,sp,-48
    80002ddc:	02113423          	sd	ra,40(sp)
    80002de0:	02813023          	sd	s0,32(sp)
    80002de4:	00913c23          	sd	s1,24(sp)
    80002de8:	01213823          	sd	s2,16(sp)
    80002dec:	01313423          	sd	s3,8(sp)
    80002df0:	03010413          	addi	s0,sp,48
    80002df4:	00050993          	mv	s3,a0
    80002df8:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002dfc:	00053483          	ld	s1,0(a0)
    80002e00:	0b80006f          	j	80002eb8 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80002e04:	0104c783          	lbu	a5,16(s1)
    80002e08:	0114c703          	lbu	a4,17(s1)
    80002e0c:	00871713          	slli	a4,a4,0x8
    80002e10:	00f76733          	or	a4,a4,a5
    80002e14:	0124c783          	lbu	a5,18(s1)
    80002e18:	01079793          	slli	a5,a5,0x10
    80002e1c:	00e7e733          	or	a4,a5,a4
    80002e20:	0134c783          	lbu	a5,19(s1)
    80002e24:	01879793          	slli	a5,a5,0x18
    80002e28:	00e7e7b3          	or	a5,a5,a4
    80002e2c:	0144c703          	lbu	a4,20(s1)
    80002e30:	02071713          	slli	a4,a4,0x20
    80002e34:	00f767b3          	or	a5,a4,a5
    80002e38:	0154c703          	lbu	a4,21(s1)
    80002e3c:	02871713          	slli	a4,a4,0x28
    80002e40:	00f76733          	or	a4,a4,a5
    80002e44:	0164c783          	lbu	a5,22(s1)
    80002e48:	03079793          	slli	a5,a5,0x30
    80002e4c:	00e7e733          	or	a4,a5,a4
    80002e50:	0174c783          	lbu	a5,23(s1)
    80002e54:	03879793          	slli	a5,a5,0x38
    80002e58:	00e7e7b3          	or	a5,a5,a4
    80002e5c:	0d27f063          	bgeu	a5,s2,80002f1c <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80002e60:	0004c703          	lbu	a4,0(s1)
    80002e64:	0014c783          	lbu	a5,1(s1)
    80002e68:	00879793          	slli	a5,a5,0x8
    80002e6c:	00e7e733          	or	a4,a5,a4
    80002e70:	0024c783          	lbu	a5,2(s1)
    80002e74:	01079793          	slli	a5,a5,0x10
    80002e78:	00e7e7b3          	or	a5,a5,a4
    80002e7c:	0034c703          	lbu	a4,3(s1)
    80002e80:	01871713          	slli	a4,a4,0x18
    80002e84:	00f767b3          	or	a5,a4,a5
    80002e88:	0044c703          	lbu	a4,4(s1)
    80002e8c:	02071713          	slli	a4,a4,0x20
    80002e90:	00f76733          	or	a4,a4,a5
    80002e94:	0054c783          	lbu	a5,5(s1)
    80002e98:	02879793          	slli	a5,a5,0x28
    80002e9c:	00e7e733          	or	a4,a5,a4
    80002ea0:	0064c783          	lbu	a5,6(s1)
    80002ea4:	03079793          	slli	a5,a5,0x30
    80002ea8:	00e7e7b3          	or	a5,a5,a4
    80002eac:	0074c483          	lbu	s1,7(s1)
    80002eb0:	03849493          	slli	s1,s1,0x38
    80002eb4:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002eb8:	4e048c63          	beqz	s1,800033b0 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002ebc:	0184c783          	lbu	a5,24(s1)
    80002ec0:	0194c703          	lbu	a4,25(s1)
    80002ec4:	00871713          	slli	a4,a4,0x8
    80002ec8:	00f76733          	or	a4,a4,a5
    80002ecc:	01a4c783          	lbu	a5,26(s1)
    80002ed0:	01079793          	slli	a5,a5,0x10
    80002ed4:	00e7e733          	or	a4,a5,a4
    80002ed8:	01b4c783          	lbu	a5,27(s1)
    80002edc:	01879793          	slli	a5,a5,0x18
    80002ee0:	00e7e7b3          	or	a5,a5,a4
    80002ee4:	0007879b          	sext.w	a5,a5
    80002ee8:	deadc737          	lui	a4,0xdeadc
    80002eec:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2cee>
    80002ef0:	f0e78ae3          	beq	a5,a4,80002e04 <_ZN11HeapManager12heapAllocateEm+0x2c>
    80002ef4:	00004697          	auipc	a3,0x4
    80002ef8:	2b468693          	addi	a3,a3,692 # 800071a8 <CONSOLE_STATUS+0x198>
    80002efc:	03400613          	li	a2,52
    80002f00:	00004597          	auipc	a1,0x4
    80002f04:	1f058593          	addi	a1,a1,496 # 800070f0 <CONSOLE_STATUS+0xe0>
    80002f08:	00004517          	auipc	a0,0x4
    80002f0c:	27850513          	addi	a0,a0,632 # 80007180 <CONSOLE_STATUS+0x170>
    80002f10:	fffff097          	auipc	ra,0xfffff
    80002f14:	98c080e7          	jalr	-1652(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80002f18:	eedff06f          	j	80002e04 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80002f1c:	00190713          	addi	a4,s2,1
    80002f20:	2af77263          	bgeu	a4,a5,800031c4 <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80002f24:	00671793          	slli	a5,a4,0x6
    80002f28:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80002f2c:	fde00713          	li	a4,-34
    80002f30:	00e78c23          	sb	a4,24(a5)
    80002f34:	fc000693          	li	a3,-64
    80002f38:	00d78ca3          	sb	a3,25(a5)
    80002f3c:	fad00693          	li	a3,-83
    80002f40:	00d78d23          	sb	a3,26(a5)
    80002f44:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80002f48:	0104c703          	lbu	a4,16(s1)
    80002f4c:	0114c683          	lbu	a3,17(s1)
    80002f50:	00869693          	slli	a3,a3,0x8
    80002f54:	00e6e6b3          	or	a3,a3,a4
    80002f58:	0124c703          	lbu	a4,18(s1)
    80002f5c:	01071713          	slli	a4,a4,0x10
    80002f60:	00d766b3          	or	a3,a4,a3
    80002f64:	0134c703          	lbu	a4,19(s1)
    80002f68:	01871713          	slli	a4,a4,0x18
    80002f6c:	00d76733          	or	a4,a4,a3
    80002f70:	0144c683          	lbu	a3,20(s1)
    80002f74:	02069693          	slli	a3,a3,0x20
    80002f78:	00e6e733          	or	a4,a3,a4
    80002f7c:	0154c683          	lbu	a3,21(s1)
    80002f80:	02869693          	slli	a3,a3,0x28
    80002f84:	00e6e6b3          	or	a3,a3,a4
    80002f88:	0164c703          	lbu	a4,22(s1)
    80002f8c:	03071713          	slli	a4,a4,0x30
    80002f90:	00d766b3          	or	a3,a4,a3
    80002f94:	0174c703          	lbu	a4,23(s1)
    80002f98:	03871713          	slli	a4,a4,0x38
    80002f9c:	00d76733          	or	a4,a4,a3
    80002fa0:	41270733          	sub	a4,a4,s2
    80002fa4:	fff70713          	addi	a4,a4,-1
    80002fa8:	00e78823          	sb	a4,16(a5)
    80002fac:	00875693          	srli	a3,a4,0x8
    80002fb0:	00d788a3          	sb	a3,17(a5)
    80002fb4:	01075693          	srli	a3,a4,0x10
    80002fb8:	00d78923          	sb	a3,18(a5)
    80002fbc:	0187569b          	srliw	a3,a4,0x18
    80002fc0:	00d789a3          	sb	a3,19(a5)
    80002fc4:	02075693          	srli	a3,a4,0x20
    80002fc8:	00d78a23          	sb	a3,20(a5)
    80002fcc:	02875693          	srli	a3,a4,0x28
    80002fd0:	00d78aa3          	sb	a3,21(a5)
    80002fd4:	03075693          	srli	a3,a4,0x30
    80002fd8:	00d78b23          	sb	a3,22(a5)
    80002fdc:	03875713          	srli	a4,a4,0x38
    80002fe0:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80002fe4:	0004c703          	lbu	a4,0(s1)
    80002fe8:	0014c683          	lbu	a3,1(s1)
    80002fec:	00869693          	slli	a3,a3,0x8
    80002ff0:	00e6e733          	or	a4,a3,a4
    80002ff4:	0024c683          	lbu	a3,2(s1)
    80002ff8:	01069693          	slli	a3,a3,0x10
    80002ffc:	00e6e6b3          	or	a3,a3,a4
    80003000:	0034c703          	lbu	a4,3(s1)
    80003004:	01871713          	slli	a4,a4,0x18
    80003008:	00d766b3          	or	a3,a4,a3
    8000300c:	0044c703          	lbu	a4,4(s1)
    80003010:	02071713          	slli	a4,a4,0x20
    80003014:	00d76733          	or	a4,a4,a3
    80003018:	0054c683          	lbu	a3,5(s1)
    8000301c:	02869693          	slli	a3,a3,0x28
    80003020:	00e6e733          	or	a4,a3,a4
    80003024:	0064c683          	lbu	a3,6(s1)
    80003028:	03069693          	slli	a3,a3,0x30
    8000302c:	00e6e6b3          	or	a3,a3,a4
    80003030:	0074c703          	lbu	a4,7(s1)
    80003034:	03871713          	slli	a4,a4,0x38
    80003038:	00d76733          	or	a4,a4,a3
    8000303c:	00d78023          	sb	a3,0(a5)
    80003040:	00875693          	srli	a3,a4,0x8
    80003044:	00d780a3          	sb	a3,1(a5)
    80003048:	01075693          	srli	a3,a4,0x10
    8000304c:	00d78123          	sb	a3,2(a5)
    80003050:	0187569b          	srliw	a3,a4,0x18
    80003054:	00d781a3          	sb	a3,3(a5)
    80003058:	02075693          	srli	a3,a4,0x20
    8000305c:	00d78223          	sb	a3,4(a5)
    80003060:	02875693          	srli	a3,a4,0x28
    80003064:	00d782a3          	sb	a3,5(a5)
    80003068:	03075693          	srli	a3,a4,0x30
    8000306c:	00d78323          	sb	a3,6(a5)
    80003070:	03875713          	srli	a4,a4,0x38
    80003074:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80003078:	00978423          	sb	s1,8(a5)
    8000307c:	0084d713          	srli	a4,s1,0x8
    80003080:	00e784a3          	sb	a4,9(a5)
    80003084:	0104d713          	srli	a4,s1,0x10
    80003088:	00e78523          	sb	a4,10(a5)
    8000308c:	0184d71b          	srliw	a4,s1,0x18
    80003090:	00e785a3          	sb	a4,11(a5)
    80003094:	0204d713          	srli	a4,s1,0x20
    80003098:	00e78623          	sb	a4,12(a5)
    8000309c:	0284d713          	srli	a4,s1,0x28
    800030a0:	00e786a3          	sb	a4,13(a5)
    800030a4:	0304d713          	srli	a4,s1,0x30
    800030a8:	00e78723          	sb	a4,14(a5)
    800030ac:	0384d713          	srli	a4,s1,0x38
    800030b0:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    800030b4:	0004c703          	lbu	a4,0(s1)
    800030b8:	0014c683          	lbu	a3,1(s1)
    800030bc:	00869693          	slli	a3,a3,0x8
    800030c0:	00e6e6b3          	or	a3,a3,a4
    800030c4:	0024c703          	lbu	a4,2(s1)
    800030c8:	01071713          	slli	a4,a4,0x10
    800030cc:	00d766b3          	or	a3,a4,a3
    800030d0:	0034c703          	lbu	a4,3(s1)
    800030d4:	01871713          	slli	a4,a4,0x18
    800030d8:	00d76733          	or	a4,a4,a3
    800030dc:	0044c683          	lbu	a3,4(s1)
    800030e0:	02069693          	slli	a3,a3,0x20
    800030e4:	00e6e733          	or	a4,a3,a4
    800030e8:	0054c683          	lbu	a3,5(s1)
    800030ec:	02869693          	slli	a3,a3,0x28
    800030f0:	00e6e6b3          	or	a3,a3,a4
    800030f4:	0064c703          	lbu	a4,6(s1)
    800030f8:	03071713          	slli	a4,a4,0x30
    800030fc:	00d766b3          	or	a3,a4,a3
    80003100:	0074c703          	lbu	a4,7(s1)
    80003104:	03871713          	slli	a4,a4,0x38
    80003108:	00d76733          	or	a4,a4,a3
    8000310c:	04070063          	beqz	a4,8000314c <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003110:	00f70423          	sb	a5,8(a4)
    80003114:	0087d693          	srli	a3,a5,0x8
    80003118:	00d704a3          	sb	a3,9(a4)
    8000311c:	0107d693          	srli	a3,a5,0x10
    80003120:	00d70523          	sb	a3,10(a4)
    80003124:	0187d69b          	srliw	a3,a5,0x18
    80003128:	00d705a3          	sb	a3,11(a4)
    8000312c:	0207d693          	srli	a3,a5,0x20
    80003130:	00d70623          	sb	a3,12(a4)
    80003134:	0287d693          	srli	a3,a5,0x28
    80003138:	00d706a3          	sb	a3,13(a4)
    8000313c:	0307d693          	srli	a3,a5,0x30
    80003140:	00d70723          	sb	a3,14(a4)
    80003144:	0387d693          	srli	a3,a5,0x38
    80003148:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    8000314c:	00f48023          	sb	a5,0(s1)
    80003150:	0087d713          	srli	a4,a5,0x8
    80003154:	00e480a3          	sb	a4,1(s1)
    80003158:	0107d713          	srli	a4,a5,0x10
    8000315c:	00e48123          	sb	a4,2(s1)
    80003160:	0187d71b          	srliw	a4,a5,0x18
    80003164:	00e481a3          	sb	a4,3(s1)
    80003168:	0207d713          	srli	a4,a5,0x20
    8000316c:	00e48223          	sb	a4,4(s1)
    80003170:	0287d713          	srli	a4,a5,0x28
    80003174:	00e482a3          	sb	a4,5(s1)
    80003178:	0307d713          	srli	a4,a5,0x30
    8000317c:	00e48323          	sb	a4,6(s1)
    80003180:	0387d793          	srli	a5,a5,0x38
    80003184:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80003188:	01248823          	sb	s2,16(s1)
    8000318c:	00895793          	srli	a5,s2,0x8
    80003190:	00f488a3          	sb	a5,17(s1)
    80003194:	01095793          	srli	a5,s2,0x10
    80003198:	00f48923          	sb	a5,18(s1)
    8000319c:	0189579b          	srliw	a5,s2,0x18
    800031a0:	00f489a3          	sb	a5,19(s1)
    800031a4:	02095793          	srli	a5,s2,0x20
    800031a8:	00f48a23          	sb	a5,20(s1)
    800031ac:	02895793          	srli	a5,s2,0x28
    800031b0:	00f48aa3          	sb	a5,21(s1)
    800031b4:	03095793          	srli	a5,s2,0x30
    800031b8:	00f48b23          	sb	a5,22(s1)
    800031bc:	03895913          	srli	s2,s2,0x38
    800031c0:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    800031c4:	0009b783          	ld	a5,0(s3)
    800031c8:	20978463          	beq	a5,s1,800033d0 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    800031cc:	0084c783          	lbu	a5,8(s1)
    800031d0:	0094c703          	lbu	a4,9(s1)
    800031d4:	00871713          	slli	a4,a4,0x8
    800031d8:	00f76733          	or	a4,a4,a5
    800031dc:	00a4c783          	lbu	a5,10(s1)
    800031e0:	01079793          	slli	a5,a5,0x10
    800031e4:	00e7e733          	or	a4,a5,a4
    800031e8:	00b4c783          	lbu	a5,11(s1)
    800031ec:	01879793          	slli	a5,a5,0x18
    800031f0:	00e7e7b3          	or	a5,a5,a4
    800031f4:	00c4c703          	lbu	a4,12(s1)
    800031f8:	02071713          	slli	a4,a4,0x20
    800031fc:	00f767b3          	or	a5,a4,a5
    80003200:	00d4c703          	lbu	a4,13(s1)
    80003204:	02871713          	slli	a4,a4,0x28
    80003208:	00f76733          	or	a4,a4,a5
    8000320c:	00e4c783          	lbu	a5,14(s1)
    80003210:	03079793          	slli	a5,a5,0x30
    80003214:	00e7e733          	or	a4,a5,a4
    80003218:	00f4c783          	lbu	a5,15(s1)
    8000321c:	03879793          	slli	a5,a5,0x38
    80003220:	00e7e7b3          	or	a5,a5,a4
    80003224:	08078c63          	beqz	a5,800032bc <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80003228:	0004c703          	lbu	a4,0(s1)
    8000322c:	0014c683          	lbu	a3,1(s1)
    80003230:	00869693          	slli	a3,a3,0x8
    80003234:	00e6e733          	or	a4,a3,a4
    80003238:	0024c683          	lbu	a3,2(s1)
    8000323c:	01069693          	slli	a3,a3,0x10
    80003240:	00e6e6b3          	or	a3,a3,a4
    80003244:	0034c703          	lbu	a4,3(s1)
    80003248:	01871713          	slli	a4,a4,0x18
    8000324c:	00d766b3          	or	a3,a4,a3
    80003250:	0044c703          	lbu	a4,4(s1)
    80003254:	02071713          	slli	a4,a4,0x20
    80003258:	00d76733          	or	a4,a4,a3
    8000325c:	0054c683          	lbu	a3,5(s1)
    80003260:	02869693          	slli	a3,a3,0x28
    80003264:	00e6e733          	or	a4,a3,a4
    80003268:	0064c683          	lbu	a3,6(s1)
    8000326c:	03069693          	slli	a3,a3,0x30
    80003270:	00e6e6b3          	or	a3,a3,a4
    80003274:	0074c703          	lbu	a4,7(s1)
    80003278:	03871713          	slli	a4,a4,0x38
    8000327c:	00d76733          	or	a4,a4,a3
    80003280:	00d78023          	sb	a3,0(a5)
    80003284:	00875693          	srli	a3,a4,0x8
    80003288:	00d780a3          	sb	a3,1(a5)
    8000328c:	01075693          	srli	a3,a4,0x10
    80003290:	00d78123          	sb	a3,2(a5)
    80003294:	0187569b          	srliw	a3,a4,0x18
    80003298:	00d781a3          	sb	a3,3(a5)
    8000329c:	02075693          	srli	a3,a4,0x20
    800032a0:	00d78223          	sb	a3,4(a5)
    800032a4:	02875693          	srli	a3,a4,0x28
    800032a8:	00d782a3          	sb	a3,5(a5)
    800032ac:	03075693          	srli	a3,a4,0x30
    800032b0:	00d78323          	sb	a3,6(a5)
    800032b4:	03875713          	srli	a4,a4,0x38
    800032b8:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    800032bc:	0004c783          	lbu	a5,0(s1)
    800032c0:	0014c703          	lbu	a4,1(s1)
    800032c4:	00871713          	slli	a4,a4,0x8
    800032c8:	00f76733          	or	a4,a4,a5
    800032cc:	0024c783          	lbu	a5,2(s1)
    800032d0:	01079793          	slli	a5,a5,0x10
    800032d4:	00e7e733          	or	a4,a5,a4
    800032d8:	0034c783          	lbu	a5,3(s1)
    800032dc:	01879793          	slli	a5,a5,0x18
    800032e0:	00e7e7b3          	or	a5,a5,a4
    800032e4:	0044c703          	lbu	a4,4(s1)
    800032e8:	02071713          	slli	a4,a4,0x20
    800032ec:	00f767b3          	or	a5,a4,a5
    800032f0:	0054c703          	lbu	a4,5(s1)
    800032f4:	02871713          	slli	a4,a4,0x28
    800032f8:	00f76733          	or	a4,a4,a5
    800032fc:	0064c783          	lbu	a5,6(s1)
    80003300:	03079793          	slli	a5,a5,0x30
    80003304:	00e7e733          	or	a4,a5,a4
    80003308:	0074c783          	lbu	a5,7(s1)
    8000330c:	03879793          	slli	a5,a5,0x38
    80003310:	00e7e7b3          	or	a5,a5,a4
    80003314:	08078c63          	beqz	a5,800033ac <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003318:	0084c703          	lbu	a4,8(s1)
    8000331c:	0094c683          	lbu	a3,9(s1)
    80003320:	00869693          	slli	a3,a3,0x8
    80003324:	00e6e733          	or	a4,a3,a4
    80003328:	00a4c683          	lbu	a3,10(s1)
    8000332c:	01069693          	slli	a3,a3,0x10
    80003330:	00e6e6b3          	or	a3,a3,a4
    80003334:	00b4c703          	lbu	a4,11(s1)
    80003338:	01871713          	slli	a4,a4,0x18
    8000333c:	00d766b3          	or	a3,a4,a3
    80003340:	00c4c703          	lbu	a4,12(s1)
    80003344:	02071713          	slli	a4,a4,0x20
    80003348:	00d76733          	or	a4,a4,a3
    8000334c:	00d4c683          	lbu	a3,13(s1)
    80003350:	02869693          	slli	a3,a3,0x28
    80003354:	00e6e733          	or	a4,a3,a4
    80003358:	00e4c683          	lbu	a3,14(s1)
    8000335c:	03069693          	slli	a3,a3,0x30
    80003360:	00e6e6b3          	or	a3,a3,a4
    80003364:	00f4c703          	lbu	a4,15(s1)
    80003368:	03871713          	slli	a4,a4,0x38
    8000336c:	00d76733          	or	a4,a4,a3
    80003370:	00d78423          	sb	a3,8(a5)
    80003374:	00875693          	srli	a3,a4,0x8
    80003378:	00d784a3          	sb	a3,9(a5)
    8000337c:	01075693          	srli	a3,a4,0x10
    80003380:	00d78523          	sb	a3,10(a5)
    80003384:	0187569b          	srliw	a3,a4,0x18
    80003388:	00d785a3          	sb	a3,11(a5)
    8000338c:	02075693          	srli	a3,a4,0x20
    80003390:	00d78623          	sb	a3,12(a5)
    80003394:	02875693          	srli	a3,a4,0x28
    80003398:	00d786a3          	sb	a3,13(a5)
    8000339c:	03075693          	srli	a3,a4,0x30
    800033a0:	00d78723          	sb	a3,14(a5)
    800033a4:	03875713          	srli	a4,a4,0x38
    800033a8:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    800033ac:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    800033b0:	00048513          	mv	a0,s1
    800033b4:	02813083          	ld	ra,40(sp)
    800033b8:	02013403          	ld	s0,32(sp)
    800033bc:	01813483          	ld	s1,24(sp)
    800033c0:	01013903          	ld	s2,16(sp)
    800033c4:	00813983          	ld	s3,8(sp)
    800033c8:	03010113          	addi	sp,sp,48
    800033cc:	00008067          	ret
                m_pHead = pCurrent->pNext;
    800033d0:	0004c703          	lbu	a4,0(s1)
    800033d4:	0014c783          	lbu	a5,1(s1)
    800033d8:	00879793          	slli	a5,a5,0x8
    800033dc:	00e7e7b3          	or	a5,a5,a4
    800033e0:	0024c703          	lbu	a4,2(s1)
    800033e4:	01071713          	slli	a4,a4,0x10
    800033e8:	00f76733          	or	a4,a4,a5
    800033ec:	0034c783          	lbu	a5,3(s1)
    800033f0:	01879793          	slli	a5,a5,0x18
    800033f4:	00e7e733          	or	a4,a5,a4
    800033f8:	0044c783          	lbu	a5,4(s1)
    800033fc:	02079793          	slli	a5,a5,0x20
    80003400:	00e7e7b3          	or	a5,a5,a4
    80003404:	0054c703          	lbu	a4,5(s1)
    80003408:	02871713          	slli	a4,a4,0x28
    8000340c:	00f76733          	or	a4,a4,a5
    80003410:	0064c783          	lbu	a5,6(s1)
    80003414:	03079793          	slli	a5,a5,0x30
    80003418:	00e7e733          	or	a4,a5,a4
    8000341c:	0074c783          	lbu	a5,7(s1)
    80003420:	03879793          	slli	a5,a5,0x38
    80003424:	00e7e7b3          	or	a5,a5,a4
    80003428:	00f9b023          	sd	a5,0(s3)
    8000342c:	da1ff06f          	j	800031cc <_ZN11HeapManager12heapAllocateEm+0x3f4>

0000000080003430 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003430:	ff010113          	addi	sp,sp,-16
    80003434:	00813423          	sd	s0,8(sp)
    80003438:	01010413          	addi	s0,sp,16
    //     if(pFree->pNext != 0){
    //         pFree->pNext->pPrev = pFree;
    //     }
    // }
    return 0;
}
    8000343c:	00000513          	li	a0,0
    80003440:	00813403          	ld	s0,8(sp)
    80003444:	01010113          	addi	sp,sp,16
    80003448:	00008067          	ret

000000008000344c <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"
#include "assert.h"

extern "C" void exceptionHandler(){
    8000344c:	fc010113          	addi	sp,sp,-64
    80003450:	02113c23          	sd	ra,56(sp)
    80003454:	02813823          	sd	s0,48(sp)
    80003458:	02913423          	sd	s1,40(sp)
    8000345c:	03213023          	sd	s2,32(sp)
    80003460:	01313c23          	sd	s3,24(sp)
    80003464:	01413823          	sd	s4,16(sp)
    80003468:	01513423          	sd	s5,8(sp)
    8000346c:	01613023          	sd	s6,0(sp)
    80003470:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    80003474:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    80003478:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    8000347c:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    80003480:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80003484:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80003488:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    8000348c:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80003490:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80003494:	ff870613          	addi	a2,a4,-8
    80003498:	00100693          	li	a3,1
    8000349c:	04c6f463          	bgeu	a3,a2,800034e4 <exceptionHandler+0x98>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    800034a0:	00500793          	li	a5,5
    800034a4:	20f70e63          	beq	a4,a5,800036c0 <exceptionHandler+0x274>
                __putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    800034a8:	00700793          	li	a5,7
    800034ac:	3cf70863          	beq	a4,a5,8000387c <exceptionHandler+0x430>
                __putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    800034b0:	fff00793          	li	a5,-1
    800034b4:	03f79793          	slli	a5,a5,0x3f
    800034b8:	00178793          	addi	a5,a5,1
    800034bc:	58f70463          	beq	a4,a5,80003a44 <exceptionHandler+0x5f8>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    800034c0:	fff00793          	li	a5,-1
    800034c4:	03f79793          	slli	a5,a5,0x3f
    800034c8:	00978793          	addi	a5,a5,9
    800034cc:	08f71863          	bne	a4,a5,8000355c <exceptionHandler+0x110>
    {   
        int irq = plic_claim();
    800034d0:	00001097          	auipc	ra,0x1
    800034d4:	244080e7          	jalr	580(ra) # 80004714 <plic_claim>
        // if(irq == CONSOLE_IRQ)Console::console_handler();
        plic_complete(irq);
    800034d8:	00001097          	auipc	ra,0x1
    800034dc:	274080e7          	jalr	628(ra) # 8000474c <plic_complete>
    800034e0:	07c0006f          	j	8000355c <exceptionHandler+0x110>
        switch(a0){
    800034e4:	04200713          	li	a4,66
    800034e8:	02f76463          	bltu	a4,a5,80003510 <exceptionHandler+0xc4>
    800034ec:	1c078263          	beqz	a5,800036b0 <exceptionHandler+0x264>
    800034f0:	1cf76463          	bltu	a4,a5,800036b8 <exceptionHandler+0x26c>
    800034f4:	00279793          	slli	a5,a5,0x2
    800034f8:	00004717          	auipc	a4,0x4
    800034fc:	d3c70713          	addi	a4,a4,-708 # 80007234 <CONSOLE_STATUS+0x224>
    80003500:	00e787b3          	add	a5,a5,a4
    80003504:	0007a783          	lw	a5,0(a5)
    80003508:	00e787b3          	add	a5,a5,a4
    8000350c:	00078067          	jr	a5
    80003510:	0ff00713          	li	a4,255
    80003514:	02e79663          	bne	a5,a4,80003540 <exceptionHandler+0xf4>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80003518:	00000793          	li	a5,0
    8000351c:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80003520:	00448493          	addi	s1,s1,4
    80003524:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003528:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    8000352c:	10000793          	li	a5,256
    80003530:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003534:	00200793          	li	a5,2
    80003538:	1447b073          	csrc	sip,a5
                return;
    8000353c:	0200006f          	j	8000355c <exceptionHandler+0x110>
        switch(a0){
    80003540:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80003544:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80003548:	00448493          	addi	s1,s1,4
    8000354c:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003550:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003554:	00200793          	li	a5,2
    80003558:	1447b073          	csrc	sip,a5
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    8000355c:	03813083          	ld	ra,56(sp)
    80003560:	03013403          	ld	s0,48(sp)
    80003564:	02813483          	ld	s1,40(sp)
    80003568:	02013903          	ld	s2,32(sp)
    8000356c:	01813983          	ld	s3,24(sp)
    80003570:	01013a03          	ld	s4,16(sp)
    80003574:	00813a83          	ld	s5,8(sp)
    80003578:	00013b03          	ld	s6,0(sp)
    8000357c:	04010113          	addi	sp,sp,64
    80003580:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80003584:	00098593          	mv	a1,s3
    80003588:	00005797          	auipc	a5,0x5
    8000358c:	b387b783          	ld	a5,-1224(a5) # 800080c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003590:	0007b503          	ld	a0,0(a5)
    80003594:	00000097          	auipc	ra,0x0
    80003598:	844080e7          	jalr	-1980(ra) # 80002dd8 <_ZN11HeapManager12heapAllocateEm>
                break;
    8000359c:	fa9ff06f          	j	80003544 <exceptionHandler+0xf8>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    800035a0:	00098593          	mv	a1,s3
    800035a4:	00005797          	auipc	a5,0x5
    800035a8:	b1c7b783          	ld	a5,-1252(a5) # 800080c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800035ac:	0007b503          	ld	a0,0(a5)
    800035b0:	00000097          	auipc	ra,0x0
    800035b4:	e80080e7          	jalr	-384(ra) # 80003430 <_ZN11HeapManager8heapFreeEPv>
                break;
    800035b8:	f8dff06f          	j	80003544 <exceptionHandler+0xf8>
                __putc('\0'); /// removing this line causes everything to break
    800035bc:	00000513          	li	a0,0
    800035c0:	00003097          	auipc	ra,0x3
    800035c4:	9bc080e7          	jalr	-1604(ra) # 80005f7c <__putc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    800035c8:	00100713          	li	a4,1
    800035cc:	000b0693          	mv	a3,s6
    800035d0:	000a8613          	mv	a2,s5
    800035d4:	000a0593          	mv	a1,s4
    800035d8:	00098513          	mv	a0,s3
    800035dc:	fffff097          	auipc	ra,0xfffff
    800035e0:	ed0080e7          	jalr	-304(ra) # 800024ac <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    800035e4:	f61ff06f          	j	80003544 <exceptionHandler+0xf8>
                returnVal = _thread::currentThread->exit();
    800035e8:	fffff097          	auipc	ra,0xfffff
    800035ec:	248080e7          	jalr	584(ra) # 80002830 <_ZN7_thread4exitEv>
                break;
    800035f0:	f55ff06f          	j	80003544 <exceptionHandler+0xf8>
                _thread::dispatch();
    800035f4:	fffff097          	auipc	ra,0xfffff
    800035f8:	44c080e7          	jalr	1100(ra) # 80002a40 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    800035fc:	00000513          	li	a0,0
                break;
    80003600:	f45ff06f          	j	80003544 <exceptionHandler+0xf8>
                _thread::currentThread->join((thread_t)a1);
    80003604:	00098593          	mv	a1,s3
    80003608:	00005797          	auipc	a5,0x5
    8000360c:	ad87b783          	ld	a5,-1320(a5) # 800080e0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003610:	0007b503          	ld	a0,0(a5)
    80003614:	fffff097          	auipc	ra,0xfffff
    80003618:	068080e7          	jalr	104(ra) # 8000267c <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    8000361c:	00000513          	li	a0,0
                break;
    80003620:	f25ff06f          	j	80003544 <exceptionHandler+0xf8>
                _sem::open((sem_t*)a1, unsigned(a2));
    80003624:	000a059b          	sext.w	a1,s4
    80003628:	00098513          	mv	a0,s3
    8000362c:	ffffe097          	auipc	ra,0xffffe
    80003630:	fd4080e7          	jalr	-44(ra) # 80001600 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80003634:	00000513          	li	a0,0
                break;
    80003638:	f0dff06f          	j	80003544 <exceptionHandler+0xf8>
                _sem::close((sem_t)a1);
    8000363c:	00098513          	mv	a0,s3
    80003640:	ffffe097          	auipc	ra,0xffffe
    80003644:	01c080e7          	jalr	28(ra) # 8000165c <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80003648:	00000513          	li	a0,0
                break;
    8000364c:	ef9ff06f          	j	80003544 <exceptionHandler+0xf8>
                _sem::wait((sem_t)a1);
    80003650:	00098513          	mv	a0,s3
    80003654:	ffffe097          	auipc	ra,0xffffe
    80003658:	068080e7          	jalr	104(ra) # 800016bc <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    8000365c:	00000513          	li	a0,0
                break;
    80003660:	ee5ff06f          	j	80003544 <exceptionHandler+0xf8>
                _sem::signal((sem_t)a1);
    80003664:	00098513          	mv	a0,s3
    80003668:	ffffe097          	auipc	ra,0xffffe
    8000366c:	0f8080e7          	jalr	248(ra) # 80001760 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80003670:	00000513          	li	a0,0
                break;
    80003674:	ed1ff06f          	j	80003544 <exceptionHandler+0xf8>
                returnVal = Timer::getInstance().sleep(a1);
    80003678:	ffffe097          	auipc	ra,0xffffe
    8000367c:	b40080e7          	jalr	-1216(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    80003680:	00098593          	mv	a1,s3
    80003684:	ffffe097          	auipc	ra,0xffffe
    80003688:	c38080e7          	jalr	-968(ra) # 800012bc <_ZN5Timer5sleepEm>
                break;
    8000368c:	eb9ff06f          	j	80003544 <exceptionHandler+0xf8>
                returnVal = __getc();
    80003690:	00003097          	auipc	ra,0x3
    80003694:	928080e7          	jalr	-1752(ra) # 80005fb8 <__getc>
                break;
    80003698:	eadff06f          	j	80003544 <exceptionHandler+0xf8>
                __putc(a1);
    8000369c:	0ff9f513          	andi	a0,s3,255
    800036a0:	00003097          	auipc	ra,0x3
    800036a4:	8dc080e7          	jalr	-1828(ra) # 80005f7c <__putc>
    uint64 returnVal = 0;
    800036a8:	00000513          	li	a0,0
                break;
    800036ac:	e99ff06f          	j	80003544 <exceptionHandler+0xf8>
        switch(a0){
    800036b0:	00000513          	li	a0,0
    800036b4:	e91ff06f          	j	80003544 <exceptionHandler+0xf8>
    800036b8:	00000513          	li	a0,0
    800036bc:	e89ff06f          	j	80003544 <exceptionHandler+0xf8>
        __putc('\n');
    800036c0:	00a00513          	li	a0,10
    800036c4:	00003097          	auipc	ra,0x3
    800036c8:	8b8080e7          	jalr	-1864(ra) # 80005f7c <__putc>
        __putc('E');
    800036cc:	04500513          	li	a0,69
    800036d0:	00003097          	auipc	ra,0x3
    800036d4:	8ac080e7          	jalr	-1876(ra) # 80005f7c <__putc>
        __putc('r');
    800036d8:	07200513          	li	a0,114
    800036dc:	00003097          	auipc	ra,0x3
    800036e0:	8a0080e7          	jalr	-1888(ra) # 80005f7c <__putc>
        __putc('r');
    800036e4:	07200513          	li	a0,114
    800036e8:	00003097          	auipc	ra,0x3
    800036ec:	894080e7          	jalr	-1900(ra) # 80005f7c <__putc>
        __putc('o');
    800036f0:	06f00513          	li	a0,111
    800036f4:	00003097          	auipc	ra,0x3
    800036f8:	888080e7          	jalr	-1912(ra) # 80005f7c <__putc>
        __putc('r');
    800036fc:	07200513          	li	a0,114
    80003700:	00003097          	auipc	ra,0x3
    80003704:	87c080e7          	jalr	-1924(ra) # 80005f7c <__putc>
        __putc(':');
    80003708:	03a00513          	li	a0,58
    8000370c:	00003097          	auipc	ra,0x3
    80003710:	870080e7          	jalr	-1936(ra) # 80005f7c <__putc>
        __putc(' ');
    80003714:	02000513          	li	a0,32
    80003718:	00003097          	auipc	ra,0x3
    8000371c:	864080e7          	jalr	-1948(ra) # 80005f7c <__putc>
        __putc('i');
    80003720:	06900513          	li	a0,105
    80003724:	00003097          	auipc	ra,0x3
    80003728:	858080e7          	jalr	-1960(ra) # 80005f7c <__putc>
        __putc('l');
    8000372c:	06c00513          	li	a0,108
    80003730:	00003097          	auipc	ra,0x3
    80003734:	84c080e7          	jalr	-1972(ra) # 80005f7c <__putc>
        __putc('l');
    80003738:	06c00513          	li	a0,108
    8000373c:	00003097          	auipc	ra,0x3
    80003740:	840080e7          	jalr	-1984(ra) # 80005f7c <__putc>
        __putc('e');
    80003744:	06500513          	li	a0,101
    80003748:	00003097          	auipc	ra,0x3
    8000374c:	834080e7          	jalr	-1996(ra) # 80005f7c <__putc>
        __putc('g');
    80003750:	06700513          	li	a0,103
    80003754:	00003097          	auipc	ra,0x3
    80003758:	828080e7          	jalr	-2008(ra) # 80005f7c <__putc>
        __putc('a');
    8000375c:	06100513          	li	a0,97
    80003760:	00003097          	auipc	ra,0x3
    80003764:	81c080e7          	jalr	-2020(ra) # 80005f7c <__putc>
        __putc('l');
    80003768:	06c00513          	li	a0,108
    8000376c:	00003097          	auipc	ra,0x3
    80003770:	810080e7          	jalr	-2032(ra) # 80005f7c <__putc>
        __putc(' ');
    80003774:	02000513          	li	a0,32
    80003778:	00003097          	auipc	ra,0x3
    8000377c:	804080e7          	jalr	-2044(ra) # 80005f7c <__putc>
        __putc('r');
    80003780:	07200513          	li	a0,114
    80003784:	00002097          	auipc	ra,0x2
    80003788:	7f8080e7          	jalr	2040(ra) # 80005f7c <__putc>
        __putc('e');
    8000378c:	06500513          	li	a0,101
    80003790:	00002097          	auipc	ra,0x2
    80003794:	7ec080e7          	jalr	2028(ra) # 80005f7c <__putc>
        __putc('a');
    80003798:	06100513          	li	a0,97
    8000379c:	00002097          	auipc	ra,0x2
    800037a0:	7e0080e7          	jalr	2016(ra) # 80005f7c <__putc>
        __putc('d');
    800037a4:	06400513          	li	a0,100
    800037a8:	00002097          	auipc	ra,0x2
    800037ac:	7d4080e7          	jalr	2004(ra) # 80005f7c <__putc>
        __putc('!');
    800037b0:	02100513          	li	a0,33
    800037b4:	00002097          	auipc	ra,0x2
    800037b8:	7c8080e7          	jalr	1992(ra) # 80005f7c <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    800037bc:	14102973          	csrr	s2,sepc
        __putc('\n');
    800037c0:	00a00513          	li	a0,10
    800037c4:	00002097          	auipc	ra,0x2
    800037c8:	7b8080e7          	jalr	1976(ra) # 80005f7c <__putc>
        __putc('P');
    800037cc:	05000513          	li	a0,80
    800037d0:	00002097          	auipc	ra,0x2
    800037d4:	7ac080e7          	jalr	1964(ra) # 80005f7c <__putc>
        __putc('C');
    800037d8:	04300513          	li	a0,67
    800037dc:	00002097          	auipc	ra,0x2
    800037e0:	7a0080e7          	jalr	1952(ra) # 80005f7c <__putc>
        __putc(':');
    800037e4:	03a00513          	li	a0,58
    800037e8:	00002097          	auipc	ra,0x2
    800037ec:	794080e7          	jalr	1940(ra) # 80005f7c <__putc>
        __putc(' ');
    800037f0:	02000513          	li	a0,32
    800037f4:	00002097          	auipc	ra,0x2
    800037f8:	788080e7          	jalr	1928(ra) # 80005f7c <__putc>
        __putc('0');
    800037fc:	03000513          	li	a0,48
    80003800:	00002097          	auipc	ra,0x2
    80003804:	77c080e7          	jalr	1916(ra) # 80005f7c <__putc>
        __putc('x');
    80003808:	07800513          	li	a0,120
    8000380c:	00002097          	auipc	ra,0x2
    80003810:	770080e7          	jalr	1904(ra) # 80005f7c <__putc>
        for(int i = 15; i >= 0; i--){
    80003814:	00f00493          	li	s1,15
    80003818:	0140006f          	j	8000382c <exceptionHandler+0x3e0>
                __putc('A' + tmp - 10);
    8000381c:	03750513          	addi	a0,a0,55
    80003820:	00002097          	auipc	ra,0x2
    80003824:	75c080e7          	jalr	1884(ra) # 80005f7c <__putc>
        for(int i = 15; i >= 0; i--){
    80003828:	fff4849b          	addiw	s1,s1,-1
    8000382c:	0204c463          	bltz	s1,80003854 <exceptionHandler+0x408>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    80003830:	0024951b          	slliw	a0,s1,0x2
    80003834:	00a95533          	srl	a0,s2,a0
    80003838:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    8000383c:	00900793          	li	a5,9
    80003840:	fca7eee3          	bltu	a5,a0,8000381c <exceptionHandler+0x3d0>
                __putc('0' + tmp);
    80003844:	03050513          	addi	a0,a0,48
    80003848:	00002097          	auipc	ra,0x2
    8000384c:	734080e7          	jalr	1844(ra) # 80005f7c <__putc>
    80003850:	fd9ff06f          	j	80003828 <exceptionHandler+0x3dc>
        assert(false);
    80003854:	00004697          	auipc	a3,0x4
    80003858:	97c68693          	addi	a3,a3,-1668 # 800071d0 <CONSOLE_STATUS+0x1c0>
    8000385c:	08600613          	li	a2,134
    80003860:	00004597          	auipc	a1,0x4
    80003864:	98858593          	addi	a1,a1,-1656 # 800071e8 <CONSOLE_STATUS+0x1d8>
    80003868:	00004517          	auipc	a0,0x4
    8000386c:	9a050513          	addi	a0,a0,-1632 # 80007208 <CONSOLE_STATUS+0x1f8>
    80003870:	ffffe097          	auipc	ra,0xffffe
    80003874:	02c080e7          	jalr	44(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80003878:	ce5ff06f          	j	8000355c <exceptionHandler+0x110>
        __putc('\n');
    8000387c:	00a00513          	li	a0,10
    80003880:	00002097          	auipc	ra,0x2
    80003884:	6fc080e7          	jalr	1788(ra) # 80005f7c <__putc>
        __putc('E');
    80003888:	04500513          	li	a0,69
    8000388c:	00002097          	auipc	ra,0x2
    80003890:	6f0080e7          	jalr	1776(ra) # 80005f7c <__putc>
        __putc('r');
    80003894:	07200513          	li	a0,114
    80003898:	00002097          	auipc	ra,0x2
    8000389c:	6e4080e7          	jalr	1764(ra) # 80005f7c <__putc>
        __putc('r');
    800038a0:	07200513          	li	a0,114
    800038a4:	00002097          	auipc	ra,0x2
    800038a8:	6d8080e7          	jalr	1752(ra) # 80005f7c <__putc>
        __putc('o');
    800038ac:	06f00513          	li	a0,111
    800038b0:	00002097          	auipc	ra,0x2
    800038b4:	6cc080e7          	jalr	1740(ra) # 80005f7c <__putc>
        __putc('r');
    800038b8:	07200513          	li	a0,114
    800038bc:	00002097          	auipc	ra,0x2
    800038c0:	6c0080e7          	jalr	1728(ra) # 80005f7c <__putc>
        __putc(':');
    800038c4:	03a00513          	li	a0,58
    800038c8:	00002097          	auipc	ra,0x2
    800038cc:	6b4080e7          	jalr	1716(ra) # 80005f7c <__putc>
        __putc(' ');
    800038d0:	02000513          	li	a0,32
    800038d4:	00002097          	auipc	ra,0x2
    800038d8:	6a8080e7          	jalr	1704(ra) # 80005f7c <__putc>
        __putc('i');
    800038dc:	06900513          	li	a0,105
    800038e0:	00002097          	auipc	ra,0x2
    800038e4:	69c080e7          	jalr	1692(ra) # 80005f7c <__putc>
        __putc('l');
    800038e8:	06c00513          	li	a0,108
    800038ec:	00002097          	auipc	ra,0x2
    800038f0:	690080e7          	jalr	1680(ra) # 80005f7c <__putc>
        __putc('l');
    800038f4:	06c00513          	li	a0,108
    800038f8:	00002097          	auipc	ra,0x2
    800038fc:	684080e7          	jalr	1668(ra) # 80005f7c <__putc>
        __putc('e');
    80003900:	06500513          	li	a0,101
    80003904:	00002097          	auipc	ra,0x2
    80003908:	678080e7          	jalr	1656(ra) # 80005f7c <__putc>
        __putc('g');
    8000390c:	06700513          	li	a0,103
    80003910:	00002097          	auipc	ra,0x2
    80003914:	66c080e7          	jalr	1644(ra) # 80005f7c <__putc>
        __putc('a');
    80003918:	06100513          	li	a0,97
    8000391c:	00002097          	auipc	ra,0x2
    80003920:	660080e7          	jalr	1632(ra) # 80005f7c <__putc>
        __putc('l');
    80003924:	06c00513          	li	a0,108
    80003928:	00002097          	auipc	ra,0x2
    8000392c:	654080e7          	jalr	1620(ra) # 80005f7c <__putc>
        __putc(' ');
    80003930:	02000513          	li	a0,32
    80003934:	00002097          	auipc	ra,0x2
    80003938:	648080e7          	jalr	1608(ra) # 80005f7c <__putc>
        __putc('w');
    8000393c:	07700513          	li	a0,119
    80003940:	00002097          	auipc	ra,0x2
    80003944:	63c080e7          	jalr	1596(ra) # 80005f7c <__putc>
        __putc('r');
    80003948:	07200513          	li	a0,114
    8000394c:	00002097          	auipc	ra,0x2
    80003950:	630080e7          	jalr	1584(ra) # 80005f7c <__putc>
        __putc('i');
    80003954:	06900513          	li	a0,105
    80003958:	00002097          	auipc	ra,0x2
    8000395c:	624080e7          	jalr	1572(ra) # 80005f7c <__putc>
        __putc('t');
    80003960:	07400513          	li	a0,116
    80003964:	00002097          	auipc	ra,0x2
    80003968:	618080e7          	jalr	1560(ra) # 80005f7c <__putc>
        __putc('e');
    8000396c:	06500513          	li	a0,101
    80003970:	00002097          	auipc	ra,0x2
    80003974:	60c080e7          	jalr	1548(ra) # 80005f7c <__putc>
        __putc('!');
    80003978:	02100513          	li	a0,33
    8000397c:	00002097          	auipc	ra,0x2
    80003980:	600080e7          	jalr	1536(ra) # 80005f7c <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80003984:	14102973          	csrr	s2,sepc
        __putc('\n');
    80003988:	00a00513          	li	a0,10
    8000398c:	00002097          	auipc	ra,0x2
    80003990:	5f0080e7          	jalr	1520(ra) # 80005f7c <__putc>
        __putc('P');
    80003994:	05000513          	li	a0,80
    80003998:	00002097          	auipc	ra,0x2
    8000399c:	5e4080e7          	jalr	1508(ra) # 80005f7c <__putc>
        __putc('C');
    800039a0:	04300513          	li	a0,67
    800039a4:	00002097          	auipc	ra,0x2
    800039a8:	5d8080e7          	jalr	1496(ra) # 80005f7c <__putc>
        __putc(':');
    800039ac:	03a00513          	li	a0,58
    800039b0:	00002097          	auipc	ra,0x2
    800039b4:	5cc080e7          	jalr	1484(ra) # 80005f7c <__putc>
        __putc(' ');
    800039b8:	02000513          	li	a0,32
    800039bc:	00002097          	auipc	ra,0x2
    800039c0:	5c0080e7          	jalr	1472(ra) # 80005f7c <__putc>
        __putc('0');
    800039c4:	03000513          	li	a0,48
    800039c8:	00002097          	auipc	ra,0x2
    800039cc:	5b4080e7          	jalr	1460(ra) # 80005f7c <__putc>
        __putc('x');
    800039d0:	07800513          	li	a0,120
    800039d4:	00002097          	auipc	ra,0x2
    800039d8:	5a8080e7          	jalr	1448(ra) # 80005f7c <__putc>
        for(int i = 15; i >= 0; i--){
    800039dc:	00f00493          	li	s1,15
    800039e0:	0140006f          	j	800039f4 <exceptionHandler+0x5a8>
                __putc('A' + tmp - 10);
    800039e4:	03750513          	addi	a0,a0,55
    800039e8:	00002097          	auipc	ra,0x2
    800039ec:	594080e7          	jalr	1428(ra) # 80005f7c <__putc>
        for(int i = 15; i >= 0; i--){
    800039f0:	fff4849b          	addiw	s1,s1,-1
    800039f4:	0204c463          	bltz	s1,80003a1c <exceptionHandler+0x5d0>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    800039f8:	0024951b          	slliw	a0,s1,0x2
    800039fc:	00a95533          	srl	a0,s2,a0
    80003a00:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80003a04:	00900793          	li	a5,9
    80003a08:	fca7eee3          	bltu	a5,a0,800039e4 <exceptionHandler+0x598>
                __putc('0' + tmp);
    80003a0c:	03050513          	addi	a0,a0,48
    80003a10:	00002097          	auipc	ra,0x2
    80003a14:	56c080e7          	jalr	1388(ra) # 80005f7c <__putc>
    80003a18:	fd9ff06f          	j	800039f0 <exceptionHandler+0x5a4>
        assert(false);
    80003a1c:	00003697          	auipc	a3,0x3
    80003a20:	7b468693          	addi	a3,a3,1972 # 800071d0 <CONSOLE_STATUS+0x1c0>
    80003a24:	0b000613          	li	a2,176
    80003a28:	00003597          	auipc	a1,0x3
    80003a2c:	7c058593          	addi	a1,a1,1984 # 800071e8 <CONSOLE_STATUS+0x1d8>
    80003a30:	00003517          	auipc	a0,0x3
    80003a34:	7d850513          	addi	a0,a0,2008 # 80007208 <CONSOLE_STATUS+0x1f8>
    80003a38:	ffffe097          	auipc	ra,0xffffe
    80003a3c:	e64080e7          	jalr	-412(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80003a40:	b1dff06f          	j	8000355c <exceptionHandler+0x110>
        Timer::getInstance().tick();
    80003a44:	ffffd097          	auipc	ra,0xffffd
    80003a48:	774080e7          	jalr	1908(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    80003a4c:	ffffd097          	auipc	ra,0xffffd
    80003a50:	7d0080e7          	jalr	2000(ra) # 8000121c <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    80003a54:	00004797          	auipc	a5,0x4
    80003a58:	68c7b783          	ld	a5,1676(a5) # 800080e0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003a5c:	0007b503          	ld	a0,0(a5)
    80003a60:	fffff097          	auipc	ra,0xfffff
    80003a64:	d40080e7          	jalr	-704(ra) # 800027a0 <_ZN7_thread4tickEv>
    80003a68:	00051c63          	bnez	a0,80003a80 <exceptionHandler+0x634>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80003a6c:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003a70:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003a74:	00200793          	li	a5,2
    80003a78:	1447b073          	csrc	sip,a5
    80003a7c:	ae1ff06f          	j	8000355c <exceptionHandler+0x110>
        assert(_thread::currentThread->tick() == 0);
    80003a80:	00003697          	auipc	a3,0x3
    80003a84:	75068693          	addi	a3,a3,1872 # 800071d0 <CONSOLE_STATUS+0x1c0>
    80003a88:	0b400613          	li	a2,180
    80003a8c:	00003597          	auipc	a1,0x3
    80003a90:	75c58593          	addi	a1,a1,1884 # 800071e8 <CONSOLE_STATUS+0x1d8>
    80003a94:	00003517          	auipc	a0,0x3
    80003a98:	77c50513          	addi	a0,a0,1916 # 80007210 <CONSOLE_STATUS+0x200>
    80003a9c:	ffffe097          	auipc	ra,0xffffe
    80003aa0:	e00080e7          	jalr	-512(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80003aa4:	fc9ff06f          	j	80003a6c <exceptionHandler+0x620>

0000000080003aa8 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80003aa8:	fe010113          	addi	sp,sp,-32
    80003aac:	00113c23          	sd	ra,24(sp)
    80003ab0:	00813823          	sd	s0,16(sp)
    80003ab4:	00913423          	sd	s1,8(sp)
    80003ab8:	02010413          	addi	s0,sp,32
    80003abc:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80003ac0:	00004797          	auipc	a5,0x4
    80003ac4:	6b87b783          	ld	a5,1720(a5) # 80008178 <_ZN9Scheduler9singletonE>
    80003ac8:	02079463          	bnez	a5,80003af0 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80003acc:	00004797          	auipc	a5,0x4
    80003ad0:	6a97b623          	sd	s1,1708(a5) # 80008178 <_ZN9Scheduler9singletonE>
    head = 0;
    80003ad4:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80003ad8:	0004b423          	sd	zero,8(s1)
}
    80003adc:	01813083          	ld	ra,24(sp)
    80003ae0:	01013403          	ld	s0,16(sp)
    80003ae4:	00813483          	ld	s1,8(sp)
    80003ae8:	02010113          	addi	sp,sp,32
    80003aec:	00008067          	ret
    assert(singleton == 0);
    80003af0:	00004697          	auipc	a3,0x4
    80003af4:	85068693          	addi	a3,a3,-1968 # 80007340 <CONSOLE_STATUS+0x330>
    80003af8:	01800613          	li	a2,24
    80003afc:	00004597          	auipc	a1,0x4
    80003b00:	85c58593          	addi	a1,a1,-1956 # 80007358 <CONSOLE_STATUS+0x348>
    80003b04:	00004517          	auipc	a0,0x4
    80003b08:	86450513          	addi	a0,a0,-1948 # 80007368 <CONSOLE_STATUS+0x358>
    80003b0c:	ffffe097          	auipc	ra,0xffffe
    80003b10:	d90080e7          	jalr	-624(ra) # 8000189c <_Z13assert_failedPKcS0_jS0_>
    80003b14:	fb9ff06f          	j	80003acc <_ZN9SchedulerC1Ev+0x24>

0000000080003b18 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80003b18:	ff010113          	addi	sp,sp,-16
    80003b1c:	00813423          	sd	s0,8(sp)
    80003b20:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80003b24:	00004797          	auipc	a5,0x4
    80003b28:	6547b783          	ld	a5,1620(a5) # 80008178 <_ZN9Scheduler9singletonE>
    80003b2c:	0007b503          	ld	a0,0(a5)
}
    80003b30:	00153513          	seqz	a0,a0
    80003b34:	00813403          	ld	s0,8(sp)
    80003b38:	01010113          	addi	sp,sp,16
    80003b3c:	00008067          	ret

0000000080003b40 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80003b40:	fe010113          	addi	sp,sp,-32
    80003b44:	00113c23          	sd	ra,24(sp)
    80003b48:	00813823          	sd	s0,16(sp)
    80003b4c:	00913423          	sd	s1,8(sp)
    80003b50:	01213023          	sd	s2,0(sp)
    80003b54:	02010413          	addi	s0,sp,32
    80003b58:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80003b5c:	00004917          	auipc	s2,0x4
    80003b60:	61c93903          	ld	s2,1564(s2) # 80008178 <_ZN9Scheduler9singletonE>
    80003b64:	00093783          	ld	a5,0(s2)
    80003b68:	12078c63          	beqz	a5,80003ca0 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003b6c:	00893903          	ld	s2,8(s2)
    80003b70:	01000513          	li	a0,16
    80003b74:	ffffe097          	auipc	ra,0xffffe
    80003b78:	81c080e7          	jalr	-2020(ra) # 80001390 <_Z9mem_allocm>
    80003b7c:	00a90423          	sb	a0,8(s2)
    80003b80:	00855793          	srli	a5,a0,0x8
    80003b84:	00f904a3          	sb	a5,9(s2)
    80003b88:	01055793          	srli	a5,a0,0x10
    80003b8c:	00f90523          	sb	a5,10(s2)
    80003b90:	0185579b          	srliw	a5,a0,0x18
    80003b94:	00f905a3          	sb	a5,11(s2)
    80003b98:	02055793          	srli	a5,a0,0x20
    80003b9c:	00f90623          	sb	a5,12(s2)
    80003ba0:	02855793          	srli	a5,a0,0x28
    80003ba4:	00f906a3          	sb	a5,13(s2)
    80003ba8:	03055793          	srli	a5,a0,0x30
    80003bac:	00f90723          	sb	a5,14(s2)
    80003bb0:	03855513          	srli	a0,a0,0x38
    80003bb4:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80003bb8:	00004617          	auipc	a2,0x4
    80003bbc:	5c060613          	addi	a2,a2,1472 # 80008178 <_ZN9Scheduler9singletonE>
    80003bc0:	00063583          	ld	a1,0(a2)
    80003bc4:	0085b703          	ld	a4,8(a1)
    80003bc8:	00874783          	lbu	a5,8(a4)
    80003bcc:	00974683          	lbu	a3,9(a4)
    80003bd0:	00869693          	slli	a3,a3,0x8
    80003bd4:	00f6e6b3          	or	a3,a3,a5
    80003bd8:	00a74783          	lbu	a5,10(a4)
    80003bdc:	01079793          	slli	a5,a5,0x10
    80003be0:	00d7e6b3          	or	a3,a5,a3
    80003be4:	00b74783          	lbu	a5,11(a4)
    80003be8:	01879793          	slli	a5,a5,0x18
    80003bec:	00d7e7b3          	or	a5,a5,a3
    80003bf0:	00c74683          	lbu	a3,12(a4)
    80003bf4:	02069693          	slli	a3,a3,0x20
    80003bf8:	00f6e7b3          	or	a5,a3,a5
    80003bfc:	00d74683          	lbu	a3,13(a4)
    80003c00:	02869693          	slli	a3,a3,0x28
    80003c04:	00f6e6b3          	or	a3,a3,a5
    80003c08:	00e74783          	lbu	a5,14(a4)
    80003c0c:	03079793          	slli	a5,a5,0x30
    80003c10:	00d7e6b3          	or	a3,a5,a3
    80003c14:	00f74783          	lbu	a5,15(a4)
    80003c18:	03879793          	slli	a5,a5,0x38
    80003c1c:	00d7e7b3          	or	a5,a5,a3
    80003c20:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80003c24:	00978023          	sb	s1,0(a5)
    80003c28:	0084d713          	srli	a4,s1,0x8
    80003c2c:	00e780a3          	sb	a4,1(a5)
    80003c30:	0104d713          	srli	a4,s1,0x10
    80003c34:	00e78123          	sb	a4,2(a5)
    80003c38:	0184d71b          	srliw	a4,s1,0x18
    80003c3c:	00e781a3          	sb	a4,3(a5)
    80003c40:	0204d713          	srli	a4,s1,0x20
    80003c44:	00e78223          	sb	a4,4(a5)
    80003c48:	0284d713          	srli	a4,s1,0x28
    80003c4c:	00e782a3          	sb	a4,5(a5)
    80003c50:	0304d713          	srli	a4,s1,0x30
    80003c54:	00e78323          	sb	a4,6(a5)
    80003c58:	0384d493          	srli	s1,s1,0x38
    80003c5c:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80003c60:	00063783          	ld	a5,0(a2)
    80003c64:	0087b783          	ld	a5,8(a5)
    80003c68:	00078423          	sb	zero,8(a5)
    80003c6c:	000784a3          	sb	zero,9(a5)
    80003c70:	00078523          	sb	zero,10(a5)
    80003c74:	000785a3          	sb	zero,11(a5)
    80003c78:	00078623          	sb	zero,12(a5)
    80003c7c:	000786a3          	sb	zero,13(a5)
    80003c80:	00078723          	sb	zero,14(a5)
    80003c84:	000787a3          	sb	zero,15(a5)
    }
}
    80003c88:	01813083          	ld	ra,24(sp)
    80003c8c:	01013403          	ld	s0,16(sp)
    80003c90:	00813483          	ld	s1,8(sp)
    80003c94:	00013903          	ld	s2,0(sp)
    80003c98:	02010113          	addi	sp,sp,32
    80003c9c:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003ca0:	01000513          	li	a0,16
    80003ca4:	ffffd097          	auipc	ra,0xffffd
    80003ca8:	6ec080e7          	jalr	1772(ra) # 80001390 <_Z9mem_allocm>
    80003cac:	00a93423          	sd	a0,8(s2)
    80003cb0:	00004717          	auipc	a4,0x4
    80003cb4:	4c870713          	addi	a4,a4,1224 # 80008178 <_ZN9Scheduler9singletonE>
    80003cb8:	00073783          	ld	a5,0(a4)
    80003cbc:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80003cc0:	00073783          	ld	a5,0(a4)
    80003cc4:	0007b783          	ld	a5,0(a5)
    80003cc8:	00978023          	sb	s1,0(a5)
    80003ccc:	0084d693          	srli	a3,s1,0x8
    80003cd0:	00d780a3          	sb	a3,1(a5)
    80003cd4:	0104d693          	srli	a3,s1,0x10
    80003cd8:	00d78123          	sb	a3,2(a5)
    80003cdc:	0184d69b          	srliw	a3,s1,0x18
    80003ce0:	00d781a3          	sb	a3,3(a5)
    80003ce4:	0204d693          	srli	a3,s1,0x20
    80003ce8:	00d78223          	sb	a3,4(a5)
    80003cec:	0284d693          	srli	a3,s1,0x28
    80003cf0:	00d782a3          	sb	a3,5(a5)
    80003cf4:	0304d693          	srli	a3,s1,0x30
    80003cf8:	00d78323          	sb	a3,6(a5)
    80003cfc:	0384d493          	srli	s1,s1,0x38
    80003d00:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80003d04:	00073783          	ld	a5,0(a4)
    80003d08:	0007b783          	ld	a5,0(a5)
    80003d0c:	00078423          	sb	zero,8(a5)
    80003d10:	000784a3          	sb	zero,9(a5)
    80003d14:	00078523          	sb	zero,10(a5)
    80003d18:	000785a3          	sb	zero,11(a5)
    80003d1c:	00078623          	sb	zero,12(a5)
    80003d20:	000786a3          	sb	zero,13(a5)
    80003d24:	00078723          	sb	zero,14(a5)
    80003d28:	000787a3          	sb	zero,15(a5)
    80003d2c:	f5dff06f          	j	80003c88 <_ZN9Scheduler3putEP7_thread+0x148>

0000000080003d30 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80003d30:	ff010113          	addi	sp,sp,-16
    80003d34:	00813423          	sd	s0,8(sp)
    80003d38:	01010413          	addi	s0,sp,16
    ThreadList* tmp = singleton->head;
    80003d3c:	00004617          	auipc	a2,0x4
    80003d40:	43c63603          	ld	a2,1084(a2) # 80008178 <_ZN9Scheduler9singletonE>
    80003d44:	00063783          	ld	a5,0(a2)
    if(tmp == 0){
    80003d48:	0c078e63          	beqz	a5,80003e24 <_ZN9Scheduler3getEv+0xf4>
        return 0;
    }
    thread_t thread = tmp->thread;
    80003d4c:	0007c503          	lbu	a0,0(a5)
    80003d50:	0017c703          	lbu	a4,1(a5)
    80003d54:	00871713          	slli	a4,a4,0x8
    80003d58:	00a76733          	or	a4,a4,a0
    80003d5c:	0027c503          	lbu	a0,2(a5)
    80003d60:	01051513          	slli	a0,a0,0x10
    80003d64:	00e56733          	or	a4,a0,a4
    80003d68:	0037c503          	lbu	a0,3(a5)
    80003d6c:	01851513          	slli	a0,a0,0x18
    80003d70:	00e56533          	or	a0,a0,a4
    80003d74:	0047c703          	lbu	a4,4(a5)
    80003d78:	02071713          	slli	a4,a4,0x20
    80003d7c:	00a76533          	or	a0,a4,a0
    80003d80:	0057c703          	lbu	a4,5(a5)
    80003d84:	02871713          	slli	a4,a4,0x28
    80003d88:	00a76733          	or	a4,a4,a0
    80003d8c:	0067c503          	lbu	a0,6(a5)
    80003d90:	03051513          	slli	a0,a0,0x30
    80003d94:	00e56733          	or	a4,a0,a4
    80003d98:	0077c503          	lbu	a0,7(a5)
    80003d9c:	03851513          	slli	a0,a0,0x38
    80003da0:	00e56533          	or	a0,a0,a4
    singleton->head = tmp->next;
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
    80003dfc:	00f63023          	sd	a5,0(a2)
    if(singleton->head == 0){
    80003e00:	00004797          	auipc	a5,0x4
    80003e04:	3787b783          	ld	a5,888(a5) # 80008178 <_ZN9Scheduler9singletonE>
    80003e08:	0007b703          	ld	a4,0(a5)
    80003e0c:	00070863          	beqz	a4,80003e1c <_ZN9Scheduler3getEv+0xec>
        singleton->tail = 0;
    }
    // mem_free(tmp);
    return thread;
}
    80003e10:	00813403          	ld	s0,8(sp)
    80003e14:	01010113          	addi	sp,sp,16
    80003e18:	00008067          	ret
        singleton->tail = 0;
    80003e1c:	0007b423          	sd	zero,8(a5)
    80003e20:	ff1ff06f          	j	80003e10 <_ZN9Scheduler3getEv+0xe0>
        return 0;
    80003e24:	00078513          	mv	a0,a5
    80003e28:	fe9ff06f          	j	80003e10 <_ZN9Scheduler3getEv+0xe0>

0000000080003e2c <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80003e2c:	ff010113          	addi	sp,sp,-16
    80003e30:	00813423          	sd	s0,8(sp)
    80003e34:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80003e38:	00004797          	auipc	a5,0x4
    80003e3c:	3407b783          	ld	a5,832(a5) # 80008178 <_ZN9Scheduler9singletonE>
    80003e40:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80003e44:	00000513          	li	a0,0
    while(tmp != 0){
    80003e48:	06078263          	beqz	a5,80003eac <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80003e4c:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80003e50:	0087c683          	lbu	a3,8(a5)
    80003e54:	0097c703          	lbu	a4,9(a5)
    80003e58:	00871713          	slli	a4,a4,0x8
    80003e5c:	00d766b3          	or	a3,a4,a3
    80003e60:	00a7c703          	lbu	a4,10(a5)
    80003e64:	01071713          	slli	a4,a4,0x10
    80003e68:	00d76733          	or	a4,a4,a3
    80003e6c:	00b7c683          	lbu	a3,11(a5)
    80003e70:	01869693          	slli	a3,a3,0x18
    80003e74:	00e6e733          	or	a4,a3,a4
    80003e78:	00c7c683          	lbu	a3,12(a5)
    80003e7c:	02069693          	slli	a3,a3,0x20
    80003e80:	00e6e6b3          	or	a3,a3,a4
    80003e84:	00d7c703          	lbu	a4,13(a5)
    80003e88:	02871713          	slli	a4,a4,0x28
    80003e8c:	00d766b3          	or	a3,a4,a3
    80003e90:	00e7c703          	lbu	a4,14(a5)
    80003e94:	03071713          	slli	a4,a4,0x30
    80003e98:	00d76733          	or	a4,a4,a3
    80003e9c:	00f7c783          	lbu	a5,15(a5)
    80003ea0:	03879793          	slli	a5,a5,0x38
    80003ea4:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80003ea8:	fa1ff06f          	j	80003e48 <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80003eac:	00813403          	ld	s0,8(sp)
    80003eb0:	01010113          	addi	sp,sp,16
    80003eb4:	00008067          	ret

0000000080003eb8 <start>:
    80003eb8:	ff010113          	addi	sp,sp,-16
    80003ebc:	00813423          	sd	s0,8(sp)
    80003ec0:	01010413          	addi	s0,sp,16
    80003ec4:	300027f3          	csrr	a5,mstatus
    80003ec8:	ffffe737          	lui	a4,0xffffe
    80003ecc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff540f>
    80003ed0:	00e7f7b3          	and	a5,a5,a4
    80003ed4:	00001737          	lui	a4,0x1
    80003ed8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003edc:	00e7e7b3          	or	a5,a5,a4
    80003ee0:	30079073          	csrw	mstatus,a5
    80003ee4:	00000797          	auipc	a5,0x0
    80003ee8:	16078793          	addi	a5,a5,352 # 80004044 <system_main>
    80003eec:	34179073          	csrw	mepc,a5
    80003ef0:	00000793          	li	a5,0
    80003ef4:	18079073          	csrw	satp,a5
    80003ef8:	000107b7          	lui	a5,0x10
    80003efc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003f00:	30279073          	csrw	medeleg,a5
    80003f04:	30379073          	csrw	mideleg,a5
    80003f08:	104027f3          	csrr	a5,sie
    80003f0c:	2227e793          	ori	a5,a5,546
    80003f10:	10479073          	csrw	sie,a5
    80003f14:	fff00793          	li	a5,-1
    80003f18:	00a7d793          	srli	a5,a5,0xa
    80003f1c:	3b079073          	csrw	pmpaddr0,a5
    80003f20:	00f00793          	li	a5,15
    80003f24:	3a079073          	csrw	pmpcfg0,a5
    80003f28:	f14027f3          	csrr	a5,mhartid
    80003f2c:	0200c737          	lui	a4,0x200c
    80003f30:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003f34:	0007869b          	sext.w	a3,a5
    80003f38:	00269713          	slli	a4,a3,0x2
    80003f3c:	000f4637          	lui	a2,0xf4
    80003f40:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003f44:	00d70733          	add	a4,a4,a3
    80003f48:	0037979b          	slliw	a5,a5,0x3
    80003f4c:	020046b7          	lui	a3,0x2004
    80003f50:	00d787b3          	add	a5,a5,a3
    80003f54:	00c585b3          	add	a1,a1,a2
    80003f58:	00371693          	slli	a3,a4,0x3
    80003f5c:	00004717          	auipc	a4,0x4
    80003f60:	23470713          	addi	a4,a4,564 # 80008190 <timer_scratch>
    80003f64:	00b7b023          	sd	a1,0(a5)
    80003f68:	00d70733          	add	a4,a4,a3
    80003f6c:	00f73c23          	sd	a5,24(a4)
    80003f70:	02c73023          	sd	a2,32(a4)
    80003f74:	34071073          	csrw	mscratch,a4
    80003f78:	00000797          	auipc	a5,0x0
    80003f7c:	6e878793          	addi	a5,a5,1768 # 80004660 <timervec>
    80003f80:	30579073          	csrw	mtvec,a5
    80003f84:	300027f3          	csrr	a5,mstatus
    80003f88:	0087e793          	ori	a5,a5,8
    80003f8c:	30079073          	csrw	mstatus,a5
    80003f90:	304027f3          	csrr	a5,mie
    80003f94:	0807e793          	ori	a5,a5,128
    80003f98:	30479073          	csrw	mie,a5
    80003f9c:	f14027f3          	csrr	a5,mhartid
    80003fa0:	0007879b          	sext.w	a5,a5
    80003fa4:	00078213          	mv	tp,a5
    80003fa8:	30200073          	mret
    80003fac:	00813403          	ld	s0,8(sp)
    80003fb0:	01010113          	addi	sp,sp,16
    80003fb4:	00008067          	ret

0000000080003fb8 <timerinit>:
    80003fb8:	ff010113          	addi	sp,sp,-16
    80003fbc:	00813423          	sd	s0,8(sp)
    80003fc0:	01010413          	addi	s0,sp,16
    80003fc4:	f14027f3          	csrr	a5,mhartid
    80003fc8:	0200c737          	lui	a4,0x200c
    80003fcc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003fd0:	0007869b          	sext.w	a3,a5
    80003fd4:	00269713          	slli	a4,a3,0x2
    80003fd8:	000f4637          	lui	a2,0xf4
    80003fdc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003fe0:	00d70733          	add	a4,a4,a3
    80003fe4:	0037979b          	slliw	a5,a5,0x3
    80003fe8:	020046b7          	lui	a3,0x2004
    80003fec:	00d787b3          	add	a5,a5,a3
    80003ff0:	00c585b3          	add	a1,a1,a2
    80003ff4:	00371693          	slli	a3,a4,0x3
    80003ff8:	00004717          	auipc	a4,0x4
    80003ffc:	19870713          	addi	a4,a4,408 # 80008190 <timer_scratch>
    80004000:	00b7b023          	sd	a1,0(a5)
    80004004:	00d70733          	add	a4,a4,a3
    80004008:	00f73c23          	sd	a5,24(a4)
    8000400c:	02c73023          	sd	a2,32(a4)
    80004010:	34071073          	csrw	mscratch,a4
    80004014:	00000797          	auipc	a5,0x0
    80004018:	64c78793          	addi	a5,a5,1612 # 80004660 <timervec>
    8000401c:	30579073          	csrw	mtvec,a5
    80004020:	300027f3          	csrr	a5,mstatus
    80004024:	0087e793          	ori	a5,a5,8
    80004028:	30079073          	csrw	mstatus,a5
    8000402c:	304027f3          	csrr	a5,mie
    80004030:	0807e793          	ori	a5,a5,128
    80004034:	30479073          	csrw	mie,a5
    80004038:	00813403          	ld	s0,8(sp)
    8000403c:	01010113          	addi	sp,sp,16
    80004040:	00008067          	ret

0000000080004044 <system_main>:
    80004044:	fe010113          	addi	sp,sp,-32
    80004048:	00813823          	sd	s0,16(sp)
    8000404c:	00913423          	sd	s1,8(sp)
    80004050:	00113c23          	sd	ra,24(sp)
    80004054:	02010413          	addi	s0,sp,32
    80004058:	00000097          	auipc	ra,0x0
    8000405c:	0c4080e7          	jalr	196(ra) # 8000411c <cpuid>
    80004060:	00004497          	auipc	s1,0x4
    80004064:	0a048493          	addi	s1,s1,160 # 80008100 <started>
    80004068:	02050263          	beqz	a0,8000408c <system_main+0x48>
    8000406c:	0004a783          	lw	a5,0(s1)
    80004070:	0007879b          	sext.w	a5,a5
    80004074:	fe078ce3          	beqz	a5,8000406c <system_main+0x28>
    80004078:	0ff0000f          	fence
    8000407c:	00003517          	auipc	a0,0x3
    80004080:	32c50513          	addi	a0,a0,812 # 800073a8 <CONSOLE_STATUS+0x398>
    80004084:	00001097          	auipc	ra,0x1
    80004088:	a78080e7          	jalr	-1416(ra) # 80004afc <panic>
    8000408c:	00001097          	auipc	ra,0x1
    80004090:	9cc080e7          	jalr	-1588(ra) # 80004a58 <consoleinit>
    80004094:	00001097          	auipc	ra,0x1
    80004098:	158080e7          	jalr	344(ra) # 800051ec <printfinit>
    8000409c:	00003517          	auipc	a0,0x3
    800040a0:	3ec50513          	addi	a0,a0,1004 # 80007488 <CONSOLE_STATUS+0x478>
    800040a4:	00001097          	auipc	ra,0x1
    800040a8:	ab4080e7          	jalr	-1356(ra) # 80004b58 <__printf>
    800040ac:	00003517          	auipc	a0,0x3
    800040b0:	2cc50513          	addi	a0,a0,716 # 80007378 <CONSOLE_STATUS+0x368>
    800040b4:	00001097          	auipc	ra,0x1
    800040b8:	aa4080e7          	jalr	-1372(ra) # 80004b58 <__printf>
    800040bc:	00003517          	auipc	a0,0x3
    800040c0:	3cc50513          	addi	a0,a0,972 # 80007488 <CONSOLE_STATUS+0x478>
    800040c4:	00001097          	auipc	ra,0x1
    800040c8:	a94080e7          	jalr	-1388(ra) # 80004b58 <__printf>
    800040cc:	00001097          	auipc	ra,0x1
    800040d0:	4ac080e7          	jalr	1196(ra) # 80005578 <kinit>
    800040d4:	00000097          	auipc	ra,0x0
    800040d8:	148080e7          	jalr	328(ra) # 8000421c <trapinit>
    800040dc:	00000097          	auipc	ra,0x0
    800040e0:	16c080e7          	jalr	364(ra) # 80004248 <trapinithart>
    800040e4:	00000097          	auipc	ra,0x0
    800040e8:	5bc080e7          	jalr	1468(ra) # 800046a0 <plicinit>
    800040ec:	00000097          	auipc	ra,0x0
    800040f0:	5dc080e7          	jalr	1500(ra) # 800046c8 <plicinithart>
    800040f4:	00000097          	auipc	ra,0x0
    800040f8:	078080e7          	jalr	120(ra) # 8000416c <userinit>
    800040fc:	0ff0000f          	fence
    80004100:	00100793          	li	a5,1
    80004104:	00003517          	auipc	a0,0x3
    80004108:	28c50513          	addi	a0,a0,652 # 80007390 <CONSOLE_STATUS+0x380>
    8000410c:	00f4a023          	sw	a5,0(s1)
    80004110:	00001097          	auipc	ra,0x1
    80004114:	a48080e7          	jalr	-1464(ra) # 80004b58 <__printf>
    80004118:	0000006f          	j	80004118 <system_main+0xd4>

000000008000411c <cpuid>:
    8000411c:	ff010113          	addi	sp,sp,-16
    80004120:	00813423          	sd	s0,8(sp)
    80004124:	01010413          	addi	s0,sp,16
    80004128:	00020513          	mv	a0,tp
    8000412c:	00813403          	ld	s0,8(sp)
    80004130:	0005051b          	sext.w	a0,a0
    80004134:	01010113          	addi	sp,sp,16
    80004138:	00008067          	ret

000000008000413c <mycpu>:
    8000413c:	ff010113          	addi	sp,sp,-16
    80004140:	00813423          	sd	s0,8(sp)
    80004144:	01010413          	addi	s0,sp,16
    80004148:	00020793          	mv	a5,tp
    8000414c:	00813403          	ld	s0,8(sp)
    80004150:	0007879b          	sext.w	a5,a5
    80004154:	00779793          	slli	a5,a5,0x7
    80004158:	00005517          	auipc	a0,0x5
    8000415c:	06850513          	addi	a0,a0,104 # 800091c0 <cpus>
    80004160:	00f50533          	add	a0,a0,a5
    80004164:	01010113          	addi	sp,sp,16
    80004168:	00008067          	ret

000000008000416c <userinit>:
    8000416c:	ff010113          	addi	sp,sp,-16
    80004170:	00813423          	sd	s0,8(sp)
    80004174:	01010413          	addi	s0,sp,16
    80004178:	00813403          	ld	s0,8(sp)
    8000417c:	01010113          	addi	sp,sp,16
    80004180:	ffffd317          	auipc	t1,0xffffd
    80004184:	66030067          	jr	1632(t1) # 800017e0 <main>

0000000080004188 <either_copyout>:
    80004188:	ff010113          	addi	sp,sp,-16
    8000418c:	00813023          	sd	s0,0(sp)
    80004190:	00113423          	sd	ra,8(sp)
    80004194:	01010413          	addi	s0,sp,16
    80004198:	02051663          	bnez	a0,800041c4 <either_copyout+0x3c>
    8000419c:	00058513          	mv	a0,a1
    800041a0:	00060593          	mv	a1,a2
    800041a4:	0006861b          	sext.w	a2,a3
    800041a8:	00002097          	auipc	ra,0x2
    800041ac:	c5c080e7          	jalr	-932(ra) # 80005e04 <__memmove>
    800041b0:	00813083          	ld	ra,8(sp)
    800041b4:	00013403          	ld	s0,0(sp)
    800041b8:	00000513          	li	a0,0
    800041bc:	01010113          	addi	sp,sp,16
    800041c0:	00008067          	ret
    800041c4:	00003517          	auipc	a0,0x3
    800041c8:	20c50513          	addi	a0,a0,524 # 800073d0 <CONSOLE_STATUS+0x3c0>
    800041cc:	00001097          	auipc	ra,0x1
    800041d0:	930080e7          	jalr	-1744(ra) # 80004afc <panic>

00000000800041d4 <either_copyin>:
    800041d4:	ff010113          	addi	sp,sp,-16
    800041d8:	00813023          	sd	s0,0(sp)
    800041dc:	00113423          	sd	ra,8(sp)
    800041e0:	01010413          	addi	s0,sp,16
    800041e4:	02059463          	bnez	a1,8000420c <either_copyin+0x38>
    800041e8:	00060593          	mv	a1,a2
    800041ec:	0006861b          	sext.w	a2,a3
    800041f0:	00002097          	auipc	ra,0x2
    800041f4:	c14080e7          	jalr	-1004(ra) # 80005e04 <__memmove>
    800041f8:	00813083          	ld	ra,8(sp)
    800041fc:	00013403          	ld	s0,0(sp)
    80004200:	00000513          	li	a0,0
    80004204:	01010113          	addi	sp,sp,16
    80004208:	00008067          	ret
    8000420c:	00003517          	auipc	a0,0x3
    80004210:	1ec50513          	addi	a0,a0,492 # 800073f8 <CONSOLE_STATUS+0x3e8>
    80004214:	00001097          	auipc	ra,0x1
    80004218:	8e8080e7          	jalr	-1816(ra) # 80004afc <panic>

000000008000421c <trapinit>:
    8000421c:	ff010113          	addi	sp,sp,-16
    80004220:	00813423          	sd	s0,8(sp)
    80004224:	01010413          	addi	s0,sp,16
    80004228:	00813403          	ld	s0,8(sp)
    8000422c:	00003597          	auipc	a1,0x3
    80004230:	1f458593          	addi	a1,a1,500 # 80007420 <CONSOLE_STATUS+0x410>
    80004234:	00005517          	auipc	a0,0x5
    80004238:	00c50513          	addi	a0,a0,12 # 80009240 <tickslock>
    8000423c:	01010113          	addi	sp,sp,16
    80004240:	00001317          	auipc	t1,0x1
    80004244:	5c830067          	jr	1480(t1) # 80005808 <initlock>

0000000080004248 <trapinithart>:
    80004248:	ff010113          	addi	sp,sp,-16
    8000424c:	00813423          	sd	s0,8(sp)
    80004250:	01010413          	addi	s0,sp,16
    80004254:	00000797          	auipc	a5,0x0
    80004258:	2fc78793          	addi	a5,a5,764 # 80004550 <kernelvec>
    8000425c:	10579073          	csrw	stvec,a5
    80004260:	00813403          	ld	s0,8(sp)
    80004264:	01010113          	addi	sp,sp,16
    80004268:	00008067          	ret

000000008000426c <usertrap>:
    8000426c:	ff010113          	addi	sp,sp,-16
    80004270:	00813423          	sd	s0,8(sp)
    80004274:	01010413          	addi	s0,sp,16
    80004278:	00813403          	ld	s0,8(sp)
    8000427c:	01010113          	addi	sp,sp,16
    80004280:	00008067          	ret

0000000080004284 <usertrapret>:
    80004284:	ff010113          	addi	sp,sp,-16
    80004288:	00813423          	sd	s0,8(sp)
    8000428c:	01010413          	addi	s0,sp,16
    80004290:	00813403          	ld	s0,8(sp)
    80004294:	01010113          	addi	sp,sp,16
    80004298:	00008067          	ret

000000008000429c <kerneltrap>:
    8000429c:	fe010113          	addi	sp,sp,-32
    800042a0:	00813823          	sd	s0,16(sp)
    800042a4:	00113c23          	sd	ra,24(sp)
    800042a8:	00913423          	sd	s1,8(sp)
    800042ac:	02010413          	addi	s0,sp,32
    800042b0:	142025f3          	csrr	a1,scause
    800042b4:	100027f3          	csrr	a5,sstatus
    800042b8:	0027f793          	andi	a5,a5,2
    800042bc:	10079c63          	bnez	a5,800043d4 <kerneltrap+0x138>
    800042c0:	142027f3          	csrr	a5,scause
    800042c4:	0207ce63          	bltz	a5,80004300 <kerneltrap+0x64>
    800042c8:	00003517          	auipc	a0,0x3
    800042cc:	1a050513          	addi	a0,a0,416 # 80007468 <CONSOLE_STATUS+0x458>
    800042d0:	00001097          	auipc	ra,0x1
    800042d4:	888080e7          	jalr	-1912(ra) # 80004b58 <__printf>
    800042d8:	141025f3          	csrr	a1,sepc
    800042dc:	14302673          	csrr	a2,stval
    800042e0:	00003517          	auipc	a0,0x3
    800042e4:	19850513          	addi	a0,a0,408 # 80007478 <CONSOLE_STATUS+0x468>
    800042e8:	00001097          	auipc	ra,0x1
    800042ec:	870080e7          	jalr	-1936(ra) # 80004b58 <__printf>
    800042f0:	00003517          	auipc	a0,0x3
    800042f4:	1a050513          	addi	a0,a0,416 # 80007490 <CONSOLE_STATUS+0x480>
    800042f8:	00001097          	auipc	ra,0x1
    800042fc:	804080e7          	jalr	-2044(ra) # 80004afc <panic>
    80004300:	0ff7f713          	andi	a4,a5,255
    80004304:	00900693          	li	a3,9
    80004308:	04d70063          	beq	a4,a3,80004348 <kerneltrap+0xac>
    8000430c:	fff00713          	li	a4,-1
    80004310:	03f71713          	slli	a4,a4,0x3f
    80004314:	00170713          	addi	a4,a4,1
    80004318:	fae798e3          	bne	a5,a4,800042c8 <kerneltrap+0x2c>
    8000431c:	00000097          	auipc	ra,0x0
    80004320:	e00080e7          	jalr	-512(ra) # 8000411c <cpuid>
    80004324:	06050663          	beqz	a0,80004390 <kerneltrap+0xf4>
    80004328:	144027f3          	csrr	a5,sip
    8000432c:	ffd7f793          	andi	a5,a5,-3
    80004330:	14479073          	csrw	sip,a5
    80004334:	01813083          	ld	ra,24(sp)
    80004338:	01013403          	ld	s0,16(sp)
    8000433c:	00813483          	ld	s1,8(sp)
    80004340:	02010113          	addi	sp,sp,32
    80004344:	00008067          	ret
    80004348:	00000097          	auipc	ra,0x0
    8000434c:	3cc080e7          	jalr	972(ra) # 80004714 <plic_claim>
    80004350:	00a00793          	li	a5,10
    80004354:	00050493          	mv	s1,a0
    80004358:	06f50863          	beq	a0,a5,800043c8 <kerneltrap+0x12c>
    8000435c:	fc050ce3          	beqz	a0,80004334 <kerneltrap+0x98>
    80004360:	00050593          	mv	a1,a0
    80004364:	00003517          	auipc	a0,0x3
    80004368:	0e450513          	addi	a0,a0,228 # 80007448 <CONSOLE_STATUS+0x438>
    8000436c:	00000097          	auipc	ra,0x0
    80004370:	7ec080e7          	jalr	2028(ra) # 80004b58 <__printf>
    80004374:	01013403          	ld	s0,16(sp)
    80004378:	01813083          	ld	ra,24(sp)
    8000437c:	00048513          	mv	a0,s1
    80004380:	00813483          	ld	s1,8(sp)
    80004384:	02010113          	addi	sp,sp,32
    80004388:	00000317          	auipc	t1,0x0
    8000438c:	3c430067          	jr	964(t1) # 8000474c <plic_complete>
    80004390:	00005517          	auipc	a0,0x5
    80004394:	eb050513          	addi	a0,a0,-336 # 80009240 <tickslock>
    80004398:	00001097          	auipc	ra,0x1
    8000439c:	494080e7          	jalr	1172(ra) # 8000582c <acquire>
    800043a0:	00004717          	auipc	a4,0x4
    800043a4:	d6470713          	addi	a4,a4,-668 # 80008104 <ticks>
    800043a8:	00072783          	lw	a5,0(a4)
    800043ac:	00005517          	auipc	a0,0x5
    800043b0:	e9450513          	addi	a0,a0,-364 # 80009240 <tickslock>
    800043b4:	0017879b          	addiw	a5,a5,1
    800043b8:	00f72023          	sw	a5,0(a4)
    800043bc:	00001097          	auipc	ra,0x1
    800043c0:	53c080e7          	jalr	1340(ra) # 800058f8 <release>
    800043c4:	f65ff06f          	j	80004328 <kerneltrap+0x8c>
    800043c8:	00001097          	auipc	ra,0x1
    800043cc:	098080e7          	jalr	152(ra) # 80005460 <uartintr>
    800043d0:	fa5ff06f          	j	80004374 <kerneltrap+0xd8>
    800043d4:	00003517          	auipc	a0,0x3
    800043d8:	05450513          	addi	a0,a0,84 # 80007428 <CONSOLE_STATUS+0x418>
    800043dc:	00000097          	auipc	ra,0x0
    800043e0:	720080e7          	jalr	1824(ra) # 80004afc <panic>

00000000800043e4 <clockintr>:
    800043e4:	fe010113          	addi	sp,sp,-32
    800043e8:	00813823          	sd	s0,16(sp)
    800043ec:	00913423          	sd	s1,8(sp)
    800043f0:	00113c23          	sd	ra,24(sp)
    800043f4:	02010413          	addi	s0,sp,32
    800043f8:	00005497          	auipc	s1,0x5
    800043fc:	e4848493          	addi	s1,s1,-440 # 80009240 <tickslock>
    80004400:	00048513          	mv	a0,s1
    80004404:	00001097          	auipc	ra,0x1
    80004408:	428080e7          	jalr	1064(ra) # 8000582c <acquire>
    8000440c:	00004717          	auipc	a4,0x4
    80004410:	cf870713          	addi	a4,a4,-776 # 80008104 <ticks>
    80004414:	00072783          	lw	a5,0(a4)
    80004418:	01013403          	ld	s0,16(sp)
    8000441c:	01813083          	ld	ra,24(sp)
    80004420:	00048513          	mv	a0,s1
    80004424:	0017879b          	addiw	a5,a5,1
    80004428:	00813483          	ld	s1,8(sp)
    8000442c:	00f72023          	sw	a5,0(a4)
    80004430:	02010113          	addi	sp,sp,32
    80004434:	00001317          	auipc	t1,0x1
    80004438:	4c430067          	jr	1220(t1) # 800058f8 <release>

000000008000443c <devintr>:
    8000443c:	142027f3          	csrr	a5,scause
    80004440:	00000513          	li	a0,0
    80004444:	0007c463          	bltz	a5,8000444c <devintr+0x10>
    80004448:	00008067          	ret
    8000444c:	fe010113          	addi	sp,sp,-32
    80004450:	00813823          	sd	s0,16(sp)
    80004454:	00113c23          	sd	ra,24(sp)
    80004458:	00913423          	sd	s1,8(sp)
    8000445c:	02010413          	addi	s0,sp,32
    80004460:	0ff7f713          	andi	a4,a5,255
    80004464:	00900693          	li	a3,9
    80004468:	04d70c63          	beq	a4,a3,800044c0 <devintr+0x84>
    8000446c:	fff00713          	li	a4,-1
    80004470:	03f71713          	slli	a4,a4,0x3f
    80004474:	00170713          	addi	a4,a4,1
    80004478:	00e78c63          	beq	a5,a4,80004490 <devintr+0x54>
    8000447c:	01813083          	ld	ra,24(sp)
    80004480:	01013403          	ld	s0,16(sp)
    80004484:	00813483          	ld	s1,8(sp)
    80004488:	02010113          	addi	sp,sp,32
    8000448c:	00008067          	ret
    80004490:	00000097          	auipc	ra,0x0
    80004494:	c8c080e7          	jalr	-884(ra) # 8000411c <cpuid>
    80004498:	06050663          	beqz	a0,80004504 <devintr+0xc8>
    8000449c:	144027f3          	csrr	a5,sip
    800044a0:	ffd7f793          	andi	a5,a5,-3
    800044a4:	14479073          	csrw	sip,a5
    800044a8:	01813083          	ld	ra,24(sp)
    800044ac:	01013403          	ld	s0,16(sp)
    800044b0:	00813483          	ld	s1,8(sp)
    800044b4:	00200513          	li	a0,2
    800044b8:	02010113          	addi	sp,sp,32
    800044bc:	00008067          	ret
    800044c0:	00000097          	auipc	ra,0x0
    800044c4:	254080e7          	jalr	596(ra) # 80004714 <plic_claim>
    800044c8:	00a00793          	li	a5,10
    800044cc:	00050493          	mv	s1,a0
    800044d0:	06f50663          	beq	a0,a5,8000453c <devintr+0x100>
    800044d4:	00100513          	li	a0,1
    800044d8:	fa0482e3          	beqz	s1,8000447c <devintr+0x40>
    800044dc:	00048593          	mv	a1,s1
    800044e0:	00003517          	auipc	a0,0x3
    800044e4:	f6850513          	addi	a0,a0,-152 # 80007448 <CONSOLE_STATUS+0x438>
    800044e8:	00000097          	auipc	ra,0x0
    800044ec:	670080e7          	jalr	1648(ra) # 80004b58 <__printf>
    800044f0:	00048513          	mv	a0,s1
    800044f4:	00000097          	auipc	ra,0x0
    800044f8:	258080e7          	jalr	600(ra) # 8000474c <plic_complete>
    800044fc:	00100513          	li	a0,1
    80004500:	f7dff06f          	j	8000447c <devintr+0x40>
    80004504:	00005517          	auipc	a0,0x5
    80004508:	d3c50513          	addi	a0,a0,-708 # 80009240 <tickslock>
    8000450c:	00001097          	auipc	ra,0x1
    80004510:	320080e7          	jalr	800(ra) # 8000582c <acquire>
    80004514:	00004717          	auipc	a4,0x4
    80004518:	bf070713          	addi	a4,a4,-1040 # 80008104 <ticks>
    8000451c:	00072783          	lw	a5,0(a4)
    80004520:	00005517          	auipc	a0,0x5
    80004524:	d2050513          	addi	a0,a0,-736 # 80009240 <tickslock>
    80004528:	0017879b          	addiw	a5,a5,1
    8000452c:	00f72023          	sw	a5,0(a4)
    80004530:	00001097          	auipc	ra,0x1
    80004534:	3c8080e7          	jalr	968(ra) # 800058f8 <release>
    80004538:	f65ff06f          	j	8000449c <devintr+0x60>
    8000453c:	00001097          	auipc	ra,0x1
    80004540:	f24080e7          	jalr	-220(ra) # 80005460 <uartintr>
    80004544:	fadff06f          	j	800044f0 <devintr+0xb4>
	...

0000000080004550 <kernelvec>:
    80004550:	f0010113          	addi	sp,sp,-256
    80004554:	00113023          	sd	ra,0(sp)
    80004558:	00213423          	sd	sp,8(sp)
    8000455c:	00313823          	sd	gp,16(sp)
    80004560:	00413c23          	sd	tp,24(sp)
    80004564:	02513023          	sd	t0,32(sp)
    80004568:	02613423          	sd	t1,40(sp)
    8000456c:	02713823          	sd	t2,48(sp)
    80004570:	02813c23          	sd	s0,56(sp)
    80004574:	04913023          	sd	s1,64(sp)
    80004578:	04a13423          	sd	a0,72(sp)
    8000457c:	04b13823          	sd	a1,80(sp)
    80004580:	04c13c23          	sd	a2,88(sp)
    80004584:	06d13023          	sd	a3,96(sp)
    80004588:	06e13423          	sd	a4,104(sp)
    8000458c:	06f13823          	sd	a5,112(sp)
    80004590:	07013c23          	sd	a6,120(sp)
    80004594:	09113023          	sd	a7,128(sp)
    80004598:	09213423          	sd	s2,136(sp)
    8000459c:	09313823          	sd	s3,144(sp)
    800045a0:	09413c23          	sd	s4,152(sp)
    800045a4:	0b513023          	sd	s5,160(sp)
    800045a8:	0b613423          	sd	s6,168(sp)
    800045ac:	0b713823          	sd	s7,176(sp)
    800045b0:	0b813c23          	sd	s8,184(sp)
    800045b4:	0d913023          	sd	s9,192(sp)
    800045b8:	0da13423          	sd	s10,200(sp)
    800045bc:	0db13823          	sd	s11,208(sp)
    800045c0:	0dc13c23          	sd	t3,216(sp)
    800045c4:	0fd13023          	sd	t4,224(sp)
    800045c8:	0fe13423          	sd	t5,232(sp)
    800045cc:	0ff13823          	sd	t6,240(sp)
    800045d0:	ccdff0ef          	jal	ra,8000429c <kerneltrap>
    800045d4:	00013083          	ld	ra,0(sp)
    800045d8:	00813103          	ld	sp,8(sp)
    800045dc:	01013183          	ld	gp,16(sp)
    800045e0:	02013283          	ld	t0,32(sp)
    800045e4:	02813303          	ld	t1,40(sp)
    800045e8:	03013383          	ld	t2,48(sp)
    800045ec:	03813403          	ld	s0,56(sp)
    800045f0:	04013483          	ld	s1,64(sp)
    800045f4:	04813503          	ld	a0,72(sp)
    800045f8:	05013583          	ld	a1,80(sp)
    800045fc:	05813603          	ld	a2,88(sp)
    80004600:	06013683          	ld	a3,96(sp)
    80004604:	06813703          	ld	a4,104(sp)
    80004608:	07013783          	ld	a5,112(sp)
    8000460c:	07813803          	ld	a6,120(sp)
    80004610:	08013883          	ld	a7,128(sp)
    80004614:	08813903          	ld	s2,136(sp)
    80004618:	09013983          	ld	s3,144(sp)
    8000461c:	09813a03          	ld	s4,152(sp)
    80004620:	0a013a83          	ld	s5,160(sp)
    80004624:	0a813b03          	ld	s6,168(sp)
    80004628:	0b013b83          	ld	s7,176(sp)
    8000462c:	0b813c03          	ld	s8,184(sp)
    80004630:	0c013c83          	ld	s9,192(sp)
    80004634:	0c813d03          	ld	s10,200(sp)
    80004638:	0d013d83          	ld	s11,208(sp)
    8000463c:	0d813e03          	ld	t3,216(sp)
    80004640:	0e013e83          	ld	t4,224(sp)
    80004644:	0e813f03          	ld	t5,232(sp)
    80004648:	0f013f83          	ld	t6,240(sp)
    8000464c:	10010113          	addi	sp,sp,256
    80004650:	10200073          	sret
    80004654:	00000013          	nop
    80004658:	00000013          	nop
    8000465c:	00000013          	nop

0000000080004660 <timervec>:
    80004660:	34051573          	csrrw	a0,mscratch,a0
    80004664:	00b53023          	sd	a1,0(a0)
    80004668:	00c53423          	sd	a2,8(a0)
    8000466c:	00d53823          	sd	a3,16(a0)
    80004670:	01853583          	ld	a1,24(a0)
    80004674:	02053603          	ld	a2,32(a0)
    80004678:	0005b683          	ld	a3,0(a1)
    8000467c:	00c686b3          	add	a3,a3,a2
    80004680:	00d5b023          	sd	a3,0(a1)
    80004684:	00200593          	li	a1,2
    80004688:	14459073          	csrw	sip,a1
    8000468c:	01053683          	ld	a3,16(a0)
    80004690:	00853603          	ld	a2,8(a0)
    80004694:	00053583          	ld	a1,0(a0)
    80004698:	34051573          	csrrw	a0,mscratch,a0
    8000469c:	30200073          	mret

00000000800046a0 <plicinit>:
    800046a0:	ff010113          	addi	sp,sp,-16
    800046a4:	00813423          	sd	s0,8(sp)
    800046a8:	01010413          	addi	s0,sp,16
    800046ac:	00813403          	ld	s0,8(sp)
    800046b0:	0c0007b7          	lui	a5,0xc000
    800046b4:	00100713          	li	a4,1
    800046b8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800046bc:	00e7a223          	sw	a4,4(a5)
    800046c0:	01010113          	addi	sp,sp,16
    800046c4:	00008067          	ret

00000000800046c8 <plicinithart>:
    800046c8:	ff010113          	addi	sp,sp,-16
    800046cc:	00813023          	sd	s0,0(sp)
    800046d0:	00113423          	sd	ra,8(sp)
    800046d4:	01010413          	addi	s0,sp,16
    800046d8:	00000097          	auipc	ra,0x0
    800046dc:	a44080e7          	jalr	-1468(ra) # 8000411c <cpuid>
    800046e0:	0085171b          	slliw	a4,a0,0x8
    800046e4:	0c0027b7          	lui	a5,0xc002
    800046e8:	00e787b3          	add	a5,a5,a4
    800046ec:	40200713          	li	a4,1026
    800046f0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800046f4:	00813083          	ld	ra,8(sp)
    800046f8:	00013403          	ld	s0,0(sp)
    800046fc:	00d5151b          	slliw	a0,a0,0xd
    80004700:	0c2017b7          	lui	a5,0xc201
    80004704:	00a78533          	add	a0,a5,a0
    80004708:	00052023          	sw	zero,0(a0)
    8000470c:	01010113          	addi	sp,sp,16
    80004710:	00008067          	ret

0000000080004714 <plic_claim>:
    80004714:	ff010113          	addi	sp,sp,-16
    80004718:	00813023          	sd	s0,0(sp)
    8000471c:	00113423          	sd	ra,8(sp)
    80004720:	01010413          	addi	s0,sp,16
    80004724:	00000097          	auipc	ra,0x0
    80004728:	9f8080e7          	jalr	-1544(ra) # 8000411c <cpuid>
    8000472c:	00813083          	ld	ra,8(sp)
    80004730:	00013403          	ld	s0,0(sp)
    80004734:	00d5151b          	slliw	a0,a0,0xd
    80004738:	0c2017b7          	lui	a5,0xc201
    8000473c:	00a78533          	add	a0,a5,a0
    80004740:	00452503          	lw	a0,4(a0)
    80004744:	01010113          	addi	sp,sp,16
    80004748:	00008067          	ret

000000008000474c <plic_complete>:
    8000474c:	fe010113          	addi	sp,sp,-32
    80004750:	00813823          	sd	s0,16(sp)
    80004754:	00913423          	sd	s1,8(sp)
    80004758:	00113c23          	sd	ra,24(sp)
    8000475c:	02010413          	addi	s0,sp,32
    80004760:	00050493          	mv	s1,a0
    80004764:	00000097          	auipc	ra,0x0
    80004768:	9b8080e7          	jalr	-1608(ra) # 8000411c <cpuid>
    8000476c:	01813083          	ld	ra,24(sp)
    80004770:	01013403          	ld	s0,16(sp)
    80004774:	00d5179b          	slliw	a5,a0,0xd
    80004778:	0c201737          	lui	a4,0xc201
    8000477c:	00f707b3          	add	a5,a4,a5
    80004780:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004784:	00813483          	ld	s1,8(sp)
    80004788:	02010113          	addi	sp,sp,32
    8000478c:	00008067          	ret

0000000080004790 <consolewrite>:
    80004790:	fb010113          	addi	sp,sp,-80
    80004794:	04813023          	sd	s0,64(sp)
    80004798:	04113423          	sd	ra,72(sp)
    8000479c:	02913c23          	sd	s1,56(sp)
    800047a0:	03213823          	sd	s2,48(sp)
    800047a4:	03313423          	sd	s3,40(sp)
    800047a8:	03413023          	sd	s4,32(sp)
    800047ac:	01513c23          	sd	s5,24(sp)
    800047b0:	05010413          	addi	s0,sp,80
    800047b4:	06c05c63          	blez	a2,8000482c <consolewrite+0x9c>
    800047b8:	00060993          	mv	s3,a2
    800047bc:	00050a13          	mv	s4,a0
    800047c0:	00058493          	mv	s1,a1
    800047c4:	00000913          	li	s2,0
    800047c8:	fff00a93          	li	s5,-1
    800047cc:	01c0006f          	j	800047e8 <consolewrite+0x58>
    800047d0:	fbf44503          	lbu	a0,-65(s0)
    800047d4:	0019091b          	addiw	s2,s2,1
    800047d8:	00148493          	addi	s1,s1,1
    800047dc:	00001097          	auipc	ra,0x1
    800047e0:	a9c080e7          	jalr	-1380(ra) # 80005278 <uartputc>
    800047e4:	03298063          	beq	s3,s2,80004804 <consolewrite+0x74>
    800047e8:	00048613          	mv	a2,s1
    800047ec:	00100693          	li	a3,1
    800047f0:	000a0593          	mv	a1,s4
    800047f4:	fbf40513          	addi	a0,s0,-65
    800047f8:	00000097          	auipc	ra,0x0
    800047fc:	9dc080e7          	jalr	-1572(ra) # 800041d4 <either_copyin>
    80004800:	fd5518e3          	bne	a0,s5,800047d0 <consolewrite+0x40>
    80004804:	04813083          	ld	ra,72(sp)
    80004808:	04013403          	ld	s0,64(sp)
    8000480c:	03813483          	ld	s1,56(sp)
    80004810:	02813983          	ld	s3,40(sp)
    80004814:	02013a03          	ld	s4,32(sp)
    80004818:	01813a83          	ld	s5,24(sp)
    8000481c:	00090513          	mv	a0,s2
    80004820:	03013903          	ld	s2,48(sp)
    80004824:	05010113          	addi	sp,sp,80
    80004828:	00008067          	ret
    8000482c:	00000913          	li	s2,0
    80004830:	fd5ff06f          	j	80004804 <consolewrite+0x74>

0000000080004834 <consoleread>:
    80004834:	f9010113          	addi	sp,sp,-112
    80004838:	06813023          	sd	s0,96(sp)
    8000483c:	04913c23          	sd	s1,88(sp)
    80004840:	05213823          	sd	s2,80(sp)
    80004844:	05313423          	sd	s3,72(sp)
    80004848:	05413023          	sd	s4,64(sp)
    8000484c:	03513c23          	sd	s5,56(sp)
    80004850:	03613823          	sd	s6,48(sp)
    80004854:	03713423          	sd	s7,40(sp)
    80004858:	03813023          	sd	s8,32(sp)
    8000485c:	06113423          	sd	ra,104(sp)
    80004860:	01913c23          	sd	s9,24(sp)
    80004864:	07010413          	addi	s0,sp,112
    80004868:	00060b93          	mv	s7,a2
    8000486c:	00050913          	mv	s2,a0
    80004870:	00058c13          	mv	s8,a1
    80004874:	00060b1b          	sext.w	s6,a2
    80004878:	00005497          	auipc	s1,0x5
    8000487c:	9f048493          	addi	s1,s1,-1552 # 80009268 <cons>
    80004880:	00400993          	li	s3,4
    80004884:	fff00a13          	li	s4,-1
    80004888:	00a00a93          	li	s5,10
    8000488c:	05705e63          	blez	s7,800048e8 <consoleread+0xb4>
    80004890:	09c4a703          	lw	a4,156(s1)
    80004894:	0984a783          	lw	a5,152(s1)
    80004898:	0007071b          	sext.w	a4,a4
    8000489c:	08e78463          	beq	a5,a4,80004924 <consoleread+0xf0>
    800048a0:	07f7f713          	andi	a4,a5,127
    800048a4:	00e48733          	add	a4,s1,a4
    800048a8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800048ac:	0017869b          	addiw	a3,a5,1
    800048b0:	08d4ac23          	sw	a3,152(s1)
    800048b4:	00070c9b          	sext.w	s9,a4
    800048b8:	0b370663          	beq	a4,s3,80004964 <consoleread+0x130>
    800048bc:	00100693          	li	a3,1
    800048c0:	f9f40613          	addi	a2,s0,-97
    800048c4:	000c0593          	mv	a1,s8
    800048c8:	00090513          	mv	a0,s2
    800048cc:	f8e40fa3          	sb	a4,-97(s0)
    800048d0:	00000097          	auipc	ra,0x0
    800048d4:	8b8080e7          	jalr	-1864(ra) # 80004188 <either_copyout>
    800048d8:	01450863          	beq	a0,s4,800048e8 <consoleread+0xb4>
    800048dc:	001c0c13          	addi	s8,s8,1
    800048e0:	fffb8b9b          	addiw	s7,s7,-1
    800048e4:	fb5c94e3          	bne	s9,s5,8000488c <consoleread+0x58>
    800048e8:	000b851b          	sext.w	a0,s7
    800048ec:	06813083          	ld	ra,104(sp)
    800048f0:	06013403          	ld	s0,96(sp)
    800048f4:	05813483          	ld	s1,88(sp)
    800048f8:	05013903          	ld	s2,80(sp)
    800048fc:	04813983          	ld	s3,72(sp)
    80004900:	04013a03          	ld	s4,64(sp)
    80004904:	03813a83          	ld	s5,56(sp)
    80004908:	02813b83          	ld	s7,40(sp)
    8000490c:	02013c03          	ld	s8,32(sp)
    80004910:	01813c83          	ld	s9,24(sp)
    80004914:	40ab053b          	subw	a0,s6,a0
    80004918:	03013b03          	ld	s6,48(sp)
    8000491c:	07010113          	addi	sp,sp,112
    80004920:	00008067          	ret
    80004924:	00001097          	auipc	ra,0x1
    80004928:	1d8080e7          	jalr	472(ra) # 80005afc <push_on>
    8000492c:	0984a703          	lw	a4,152(s1)
    80004930:	09c4a783          	lw	a5,156(s1)
    80004934:	0007879b          	sext.w	a5,a5
    80004938:	fef70ce3          	beq	a4,a5,80004930 <consoleread+0xfc>
    8000493c:	00001097          	auipc	ra,0x1
    80004940:	234080e7          	jalr	564(ra) # 80005b70 <pop_on>
    80004944:	0984a783          	lw	a5,152(s1)
    80004948:	07f7f713          	andi	a4,a5,127
    8000494c:	00e48733          	add	a4,s1,a4
    80004950:	01874703          	lbu	a4,24(a4)
    80004954:	0017869b          	addiw	a3,a5,1
    80004958:	08d4ac23          	sw	a3,152(s1)
    8000495c:	00070c9b          	sext.w	s9,a4
    80004960:	f5371ee3          	bne	a4,s3,800048bc <consoleread+0x88>
    80004964:	000b851b          	sext.w	a0,s7
    80004968:	f96bf2e3          	bgeu	s7,s6,800048ec <consoleread+0xb8>
    8000496c:	08f4ac23          	sw	a5,152(s1)
    80004970:	f7dff06f          	j	800048ec <consoleread+0xb8>

0000000080004974 <consputc>:
    80004974:	10000793          	li	a5,256
    80004978:	00f50663          	beq	a0,a5,80004984 <consputc+0x10>
    8000497c:	00001317          	auipc	t1,0x1
    80004980:	9f430067          	jr	-1548(t1) # 80005370 <uartputc_sync>
    80004984:	ff010113          	addi	sp,sp,-16
    80004988:	00113423          	sd	ra,8(sp)
    8000498c:	00813023          	sd	s0,0(sp)
    80004990:	01010413          	addi	s0,sp,16
    80004994:	00800513          	li	a0,8
    80004998:	00001097          	auipc	ra,0x1
    8000499c:	9d8080e7          	jalr	-1576(ra) # 80005370 <uartputc_sync>
    800049a0:	02000513          	li	a0,32
    800049a4:	00001097          	auipc	ra,0x1
    800049a8:	9cc080e7          	jalr	-1588(ra) # 80005370 <uartputc_sync>
    800049ac:	00013403          	ld	s0,0(sp)
    800049b0:	00813083          	ld	ra,8(sp)
    800049b4:	00800513          	li	a0,8
    800049b8:	01010113          	addi	sp,sp,16
    800049bc:	00001317          	auipc	t1,0x1
    800049c0:	9b430067          	jr	-1612(t1) # 80005370 <uartputc_sync>

00000000800049c4 <consoleintr>:
    800049c4:	fe010113          	addi	sp,sp,-32
    800049c8:	00813823          	sd	s0,16(sp)
    800049cc:	00913423          	sd	s1,8(sp)
    800049d0:	01213023          	sd	s2,0(sp)
    800049d4:	00113c23          	sd	ra,24(sp)
    800049d8:	02010413          	addi	s0,sp,32
    800049dc:	00005917          	auipc	s2,0x5
    800049e0:	88c90913          	addi	s2,s2,-1908 # 80009268 <cons>
    800049e4:	00050493          	mv	s1,a0
    800049e8:	00090513          	mv	a0,s2
    800049ec:	00001097          	auipc	ra,0x1
    800049f0:	e40080e7          	jalr	-448(ra) # 8000582c <acquire>
    800049f4:	02048c63          	beqz	s1,80004a2c <consoleintr+0x68>
    800049f8:	0a092783          	lw	a5,160(s2)
    800049fc:	09892703          	lw	a4,152(s2)
    80004a00:	07f00693          	li	a3,127
    80004a04:	40e7873b          	subw	a4,a5,a4
    80004a08:	02e6e263          	bltu	a3,a4,80004a2c <consoleintr+0x68>
    80004a0c:	00d00713          	li	a4,13
    80004a10:	04e48063          	beq	s1,a4,80004a50 <consoleintr+0x8c>
    80004a14:	07f7f713          	andi	a4,a5,127
    80004a18:	00e90733          	add	a4,s2,a4
    80004a1c:	0017879b          	addiw	a5,a5,1
    80004a20:	0af92023          	sw	a5,160(s2)
    80004a24:	00970c23          	sb	s1,24(a4)
    80004a28:	08f92e23          	sw	a5,156(s2)
    80004a2c:	01013403          	ld	s0,16(sp)
    80004a30:	01813083          	ld	ra,24(sp)
    80004a34:	00813483          	ld	s1,8(sp)
    80004a38:	00013903          	ld	s2,0(sp)
    80004a3c:	00005517          	auipc	a0,0x5
    80004a40:	82c50513          	addi	a0,a0,-2004 # 80009268 <cons>
    80004a44:	02010113          	addi	sp,sp,32
    80004a48:	00001317          	auipc	t1,0x1
    80004a4c:	eb030067          	jr	-336(t1) # 800058f8 <release>
    80004a50:	00a00493          	li	s1,10
    80004a54:	fc1ff06f          	j	80004a14 <consoleintr+0x50>

0000000080004a58 <consoleinit>:
    80004a58:	fe010113          	addi	sp,sp,-32
    80004a5c:	00113c23          	sd	ra,24(sp)
    80004a60:	00813823          	sd	s0,16(sp)
    80004a64:	00913423          	sd	s1,8(sp)
    80004a68:	02010413          	addi	s0,sp,32
    80004a6c:	00004497          	auipc	s1,0x4
    80004a70:	7fc48493          	addi	s1,s1,2044 # 80009268 <cons>
    80004a74:	00048513          	mv	a0,s1
    80004a78:	00003597          	auipc	a1,0x3
    80004a7c:	a2858593          	addi	a1,a1,-1496 # 800074a0 <CONSOLE_STATUS+0x490>
    80004a80:	00001097          	auipc	ra,0x1
    80004a84:	d88080e7          	jalr	-632(ra) # 80005808 <initlock>
    80004a88:	00000097          	auipc	ra,0x0
    80004a8c:	7ac080e7          	jalr	1964(ra) # 80005234 <uartinit>
    80004a90:	01813083          	ld	ra,24(sp)
    80004a94:	01013403          	ld	s0,16(sp)
    80004a98:	00000797          	auipc	a5,0x0
    80004a9c:	d9c78793          	addi	a5,a5,-612 # 80004834 <consoleread>
    80004aa0:	0af4bc23          	sd	a5,184(s1)
    80004aa4:	00000797          	auipc	a5,0x0
    80004aa8:	cec78793          	addi	a5,a5,-788 # 80004790 <consolewrite>
    80004aac:	0cf4b023          	sd	a5,192(s1)
    80004ab0:	00813483          	ld	s1,8(sp)
    80004ab4:	02010113          	addi	sp,sp,32
    80004ab8:	00008067          	ret

0000000080004abc <console_read>:
    80004abc:	ff010113          	addi	sp,sp,-16
    80004ac0:	00813423          	sd	s0,8(sp)
    80004ac4:	01010413          	addi	s0,sp,16
    80004ac8:	00813403          	ld	s0,8(sp)
    80004acc:	00005317          	auipc	t1,0x5
    80004ad0:	85433303          	ld	t1,-1964(t1) # 80009320 <devsw+0x10>
    80004ad4:	01010113          	addi	sp,sp,16
    80004ad8:	00030067          	jr	t1

0000000080004adc <console_write>:
    80004adc:	ff010113          	addi	sp,sp,-16
    80004ae0:	00813423          	sd	s0,8(sp)
    80004ae4:	01010413          	addi	s0,sp,16
    80004ae8:	00813403          	ld	s0,8(sp)
    80004aec:	00005317          	auipc	t1,0x5
    80004af0:	83c33303          	ld	t1,-1988(t1) # 80009328 <devsw+0x18>
    80004af4:	01010113          	addi	sp,sp,16
    80004af8:	00030067          	jr	t1

0000000080004afc <panic>:
    80004afc:	fe010113          	addi	sp,sp,-32
    80004b00:	00113c23          	sd	ra,24(sp)
    80004b04:	00813823          	sd	s0,16(sp)
    80004b08:	00913423          	sd	s1,8(sp)
    80004b0c:	02010413          	addi	s0,sp,32
    80004b10:	00050493          	mv	s1,a0
    80004b14:	00003517          	auipc	a0,0x3
    80004b18:	99450513          	addi	a0,a0,-1644 # 800074a8 <CONSOLE_STATUS+0x498>
    80004b1c:	00005797          	auipc	a5,0x5
    80004b20:	8a07a623          	sw	zero,-1876(a5) # 800093c8 <pr+0x18>
    80004b24:	00000097          	auipc	ra,0x0
    80004b28:	034080e7          	jalr	52(ra) # 80004b58 <__printf>
    80004b2c:	00048513          	mv	a0,s1
    80004b30:	00000097          	auipc	ra,0x0
    80004b34:	028080e7          	jalr	40(ra) # 80004b58 <__printf>
    80004b38:	00003517          	auipc	a0,0x3
    80004b3c:	95050513          	addi	a0,a0,-1712 # 80007488 <CONSOLE_STATUS+0x478>
    80004b40:	00000097          	auipc	ra,0x0
    80004b44:	018080e7          	jalr	24(ra) # 80004b58 <__printf>
    80004b48:	00100793          	li	a5,1
    80004b4c:	00003717          	auipc	a4,0x3
    80004b50:	5af72e23          	sw	a5,1468(a4) # 80008108 <panicked>
    80004b54:	0000006f          	j	80004b54 <panic+0x58>

0000000080004b58 <__printf>:
    80004b58:	f3010113          	addi	sp,sp,-208
    80004b5c:	08813023          	sd	s0,128(sp)
    80004b60:	07313423          	sd	s3,104(sp)
    80004b64:	09010413          	addi	s0,sp,144
    80004b68:	05813023          	sd	s8,64(sp)
    80004b6c:	08113423          	sd	ra,136(sp)
    80004b70:	06913c23          	sd	s1,120(sp)
    80004b74:	07213823          	sd	s2,112(sp)
    80004b78:	07413023          	sd	s4,96(sp)
    80004b7c:	05513c23          	sd	s5,88(sp)
    80004b80:	05613823          	sd	s6,80(sp)
    80004b84:	05713423          	sd	s7,72(sp)
    80004b88:	03913c23          	sd	s9,56(sp)
    80004b8c:	03a13823          	sd	s10,48(sp)
    80004b90:	03b13423          	sd	s11,40(sp)
    80004b94:	00005317          	auipc	t1,0x5
    80004b98:	81c30313          	addi	t1,t1,-2020 # 800093b0 <pr>
    80004b9c:	01832c03          	lw	s8,24(t1)
    80004ba0:	00b43423          	sd	a1,8(s0)
    80004ba4:	00c43823          	sd	a2,16(s0)
    80004ba8:	00d43c23          	sd	a3,24(s0)
    80004bac:	02e43023          	sd	a4,32(s0)
    80004bb0:	02f43423          	sd	a5,40(s0)
    80004bb4:	03043823          	sd	a6,48(s0)
    80004bb8:	03143c23          	sd	a7,56(s0)
    80004bbc:	00050993          	mv	s3,a0
    80004bc0:	4a0c1663          	bnez	s8,8000506c <__printf+0x514>
    80004bc4:	60098c63          	beqz	s3,800051dc <__printf+0x684>
    80004bc8:	0009c503          	lbu	a0,0(s3)
    80004bcc:	00840793          	addi	a5,s0,8
    80004bd0:	f6f43c23          	sd	a5,-136(s0)
    80004bd4:	00000493          	li	s1,0
    80004bd8:	22050063          	beqz	a0,80004df8 <__printf+0x2a0>
    80004bdc:	00002a37          	lui	s4,0x2
    80004be0:	00018ab7          	lui	s5,0x18
    80004be4:	000f4b37          	lui	s6,0xf4
    80004be8:	00989bb7          	lui	s7,0x989
    80004bec:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004bf0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004bf4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004bf8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80004bfc:	00148c9b          	addiw	s9,s1,1
    80004c00:	02500793          	li	a5,37
    80004c04:	01998933          	add	s2,s3,s9
    80004c08:	38f51263          	bne	a0,a5,80004f8c <__printf+0x434>
    80004c0c:	00094783          	lbu	a5,0(s2)
    80004c10:	00078c9b          	sext.w	s9,a5
    80004c14:	1e078263          	beqz	a5,80004df8 <__printf+0x2a0>
    80004c18:	0024849b          	addiw	s1,s1,2
    80004c1c:	07000713          	li	a4,112
    80004c20:	00998933          	add	s2,s3,s1
    80004c24:	38e78a63          	beq	a5,a4,80004fb8 <__printf+0x460>
    80004c28:	20f76863          	bltu	a4,a5,80004e38 <__printf+0x2e0>
    80004c2c:	42a78863          	beq	a5,a0,8000505c <__printf+0x504>
    80004c30:	06400713          	li	a4,100
    80004c34:	40e79663          	bne	a5,a4,80005040 <__printf+0x4e8>
    80004c38:	f7843783          	ld	a5,-136(s0)
    80004c3c:	0007a603          	lw	a2,0(a5)
    80004c40:	00878793          	addi	a5,a5,8
    80004c44:	f6f43c23          	sd	a5,-136(s0)
    80004c48:	42064a63          	bltz	a2,8000507c <__printf+0x524>
    80004c4c:	00a00713          	li	a4,10
    80004c50:	02e677bb          	remuw	a5,a2,a4
    80004c54:	00003d97          	auipc	s11,0x3
    80004c58:	87cd8d93          	addi	s11,s11,-1924 # 800074d0 <digits>
    80004c5c:	00900593          	li	a1,9
    80004c60:	0006051b          	sext.w	a0,a2
    80004c64:	00000c93          	li	s9,0
    80004c68:	02079793          	slli	a5,a5,0x20
    80004c6c:	0207d793          	srli	a5,a5,0x20
    80004c70:	00fd87b3          	add	a5,s11,a5
    80004c74:	0007c783          	lbu	a5,0(a5)
    80004c78:	02e656bb          	divuw	a3,a2,a4
    80004c7c:	f8f40023          	sb	a5,-128(s0)
    80004c80:	14c5d863          	bge	a1,a2,80004dd0 <__printf+0x278>
    80004c84:	06300593          	li	a1,99
    80004c88:	00100c93          	li	s9,1
    80004c8c:	02e6f7bb          	remuw	a5,a3,a4
    80004c90:	02079793          	slli	a5,a5,0x20
    80004c94:	0207d793          	srli	a5,a5,0x20
    80004c98:	00fd87b3          	add	a5,s11,a5
    80004c9c:	0007c783          	lbu	a5,0(a5)
    80004ca0:	02e6d73b          	divuw	a4,a3,a4
    80004ca4:	f8f400a3          	sb	a5,-127(s0)
    80004ca8:	12a5f463          	bgeu	a1,a0,80004dd0 <__printf+0x278>
    80004cac:	00a00693          	li	a3,10
    80004cb0:	00900593          	li	a1,9
    80004cb4:	02d777bb          	remuw	a5,a4,a3
    80004cb8:	02079793          	slli	a5,a5,0x20
    80004cbc:	0207d793          	srli	a5,a5,0x20
    80004cc0:	00fd87b3          	add	a5,s11,a5
    80004cc4:	0007c503          	lbu	a0,0(a5)
    80004cc8:	02d757bb          	divuw	a5,a4,a3
    80004ccc:	f8a40123          	sb	a0,-126(s0)
    80004cd0:	48e5f263          	bgeu	a1,a4,80005154 <__printf+0x5fc>
    80004cd4:	06300513          	li	a0,99
    80004cd8:	02d7f5bb          	remuw	a1,a5,a3
    80004cdc:	02059593          	slli	a1,a1,0x20
    80004ce0:	0205d593          	srli	a1,a1,0x20
    80004ce4:	00bd85b3          	add	a1,s11,a1
    80004ce8:	0005c583          	lbu	a1,0(a1)
    80004cec:	02d7d7bb          	divuw	a5,a5,a3
    80004cf0:	f8b401a3          	sb	a1,-125(s0)
    80004cf4:	48e57263          	bgeu	a0,a4,80005178 <__printf+0x620>
    80004cf8:	3e700513          	li	a0,999
    80004cfc:	02d7f5bb          	remuw	a1,a5,a3
    80004d00:	02059593          	slli	a1,a1,0x20
    80004d04:	0205d593          	srli	a1,a1,0x20
    80004d08:	00bd85b3          	add	a1,s11,a1
    80004d0c:	0005c583          	lbu	a1,0(a1)
    80004d10:	02d7d7bb          	divuw	a5,a5,a3
    80004d14:	f8b40223          	sb	a1,-124(s0)
    80004d18:	46e57663          	bgeu	a0,a4,80005184 <__printf+0x62c>
    80004d1c:	02d7f5bb          	remuw	a1,a5,a3
    80004d20:	02059593          	slli	a1,a1,0x20
    80004d24:	0205d593          	srli	a1,a1,0x20
    80004d28:	00bd85b3          	add	a1,s11,a1
    80004d2c:	0005c583          	lbu	a1,0(a1)
    80004d30:	02d7d7bb          	divuw	a5,a5,a3
    80004d34:	f8b402a3          	sb	a1,-123(s0)
    80004d38:	46ea7863          	bgeu	s4,a4,800051a8 <__printf+0x650>
    80004d3c:	02d7f5bb          	remuw	a1,a5,a3
    80004d40:	02059593          	slli	a1,a1,0x20
    80004d44:	0205d593          	srli	a1,a1,0x20
    80004d48:	00bd85b3          	add	a1,s11,a1
    80004d4c:	0005c583          	lbu	a1,0(a1)
    80004d50:	02d7d7bb          	divuw	a5,a5,a3
    80004d54:	f8b40323          	sb	a1,-122(s0)
    80004d58:	3eeaf863          	bgeu	s5,a4,80005148 <__printf+0x5f0>
    80004d5c:	02d7f5bb          	remuw	a1,a5,a3
    80004d60:	02059593          	slli	a1,a1,0x20
    80004d64:	0205d593          	srli	a1,a1,0x20
    80004d68:	00bd85b3          	add	a1,s11,a1
    80004d6c:	0005c583          	lbu	a1,0(a1)
    80004d70:	02d7d7bb          	divuw	a5,a5,a3
    80004d74:	f8b403a3          	sb	a1,-121(s0)
    80004d78:	42eb7e63          	bgeu	s6,a4,800051b4 <__printf+0x65c>
    80004d7c:	02d7f5bb          	remuw	a1,a5,a3
    80004d80:	02059593          	slli	a1,a1,0x20
    80004d84:	0205d593          	srli	a1,a1,0x20
    80004d88:	00bd85b3          	add	a1,s11,a1
    80004d8c:	0005c583          	lbu	a1,0(a1)
    80004d90:	02d7d7bb          	divuw	a5,a5,a3
    80004d94:	f8b40423          	sb	a1,-120(s0)
    80004d98:	42ebfc63          	bgeu	s7,a4,800051d0 <__printf+0x678>
    80004d9c:	02079793          	slli	a5,a5,0x20
    80004da0:	0207d793          	srli	a5,a5,0x20
    80004da4:	00fd8db3          	add	s11,s11,a5
    80004da8:	000dc703          	lbu	a4,0(s11)
    80004dac:	00a00793          	li	a5,10
    80004db0:	00900c93          	li	s9,9
    80004db4:	f8e404a3          	sb	a4,-119(s0)
    80004db8:	00065c63          	bgez	a2,80004dd0 <__printf+0x278>
    80004dbc:	f9040713          	addi	a4,s0,-112
    80004dc0:	00f70733          	add	a4,a4,a5
    80004dc4:	02d00693          	li	a3,45
    80004dc8:	fed70823          	sb	a3,-16(a4)
    80004dcc:	00078c93          	mv	s9,a5
    80004dd0:	f8040793          	addi	a5,s0,-128
    80004dd4:	01978cb3          	add	s9,a5,s9
    80004dd8:	f7f40d13          	addi	s10,s0,-129
    80004ddc:	000cc503          	lbu	a0,0(s9)
    80004de0:	fffc8c93          	addi	s9,s9,-1
    80004de4:	00000097          	auipc	ra,0x0
    80004de8:	b90080e7          	jalr	-1136(ra) # 80004974 <consputc>
    80004dec:	ffac98e3          	bne	s9,s10,80004ddc <__printf+0x284>
    80004df0:	00094503          	lbu	a0,0(s2)
    80004df4:	e00514e3          	bnez	a0,80004bfc <__printf+0xa4>
    80004df8:	1a0c1663          	bnez	s8,80004fa4 <__printf+0x44c>
    80004dfc:	08813083          	ld	ra,136(sp)
    80004e00:	08013403          	ld	s0,128(sp)
    80004e04:	07813483          	ld	s1,120(sp)
    80004e08:	07013903          	ld	s2,112(sp)
    80004e0c:	06813983          	ld	s3,104(sp)
    80004e10:	06013a03          	ld	s4,96(sp)
    80004e14:	05813a83          	ld	s5,88(sp)
    80004e18:	05013b03          	ld	s6,80(sp)
    80004e1c:	04813b83          	ld	s7,72(sp)
    80004e20:	04013c03          	ld	s8,64(sp)
    80004e24:	03813c83          	ld	s9,56(sp)
    80004e28:	03013d03          	ld	s10,48(sp)
    80004e2c:	02813d83          	ld	s11,40(sp)
    80004e30:	0d010113          	addi	sp,sp,208
    80004e34:	00008067          	ret
    80004e38:	07300713          	li	a4,115
    80004e3c:	1ce78a63          	beq	a5,a4,80005010 <__printf+0x4b8>
    80004e40:	07800713          	li	a4,120
    80004e44:	1ee79e63          	bne	a5,a4,80005040 <__printf+0x4e8>
    80004e48:	f7843783          	ld	a5,-136(s0)
    80004e4c:	0007a703          	lw	a4,0(a5)
    80004e50:	00878793          	addi	a5,a5,8
    80004e54:	f6f43c23          	sd	a5,-136(s0)
    80004e58:	28074263          	bltz	a4,800050dc <__printf+0x584>
    80004e5c:	00002d97          	auipc	s11,0x2
    80004e60:	674d8d93          	addi	s11,s11,1652 # 800074d0 <digits>
    80004e64:	00f77793          	andi	a5,a4,15
    80004e68:	00fd87b3          	add	a5,s11,a5
    80004e6c:	0007c683          	lbu	a3,0(a5)
    80004e70:	00f00613          	li	a2,15
    80004e74:	0007079b          	sext.w	a5,a4
    80004e78:	f8d40023          	sb	a3,-128(s0)
    80004e7c:	0047559b          	srliw	a1,a4,0x4
    80004e80:	0047569b          	srliw	a3,a4,0x4
    80004e84:	00000c93          	li	s9,0
    80004e88:	0ee65063          	bge	a2,a4,80004f68 <__printf+0x410>
    80004e8c:	00f6f693          	andi	a3,a3,15
    80004e90:	00dd86b3          	add	a3,s11,a3
    80004e94:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004e98:	0087d79b          	srliw	a5,a5,0x8
    80004e9c:	00100c93          	li	s9,1
    80004ea0:	f8d400a3          	sb	a3,-127(s0)
    80004ea4:	0cb67263          	bgeu	a2,a1,80004f68 <__printf+0x410>
    80004ea8:	00f7f693          	andi	a3,a5,15
    80004eac:	00dd86b3          	add	a3,s11,a3
    80004eb0:	0006c583          	lbu	a1,0(a3)
    80004eb4:	00f00613          	li	a2,15
    80004eb8:	0047d69b          	srliw	a3,a5,0x4
    80004ebc:	f8b40123          	sb	a1,-126(s0)
    80004ec0:	0047d593          	srli	a1,a5,0x4
    80004ec4:	28f67e63          	bgeu	a2,a5,80005160 <__printf+0x608>
    80004ec8:	00f6f693          	andi	a3,a3,15
    80004ecc:	00dd86b3          	add	a3,s11,a3
    80004ed0:	0006c503          	lbu	a0,0(a3)
    80004ed4:	0087d813          	srli	a6,a5,0x8
    80004ed8:	0087d69b          	srliw	a3,a5,0x8
    80004edc:	f8a401a3          	sb	a0,-125(s0)
    80004ee0:	28b67663          	bgeu	a2,a1,8000516c <__printf+0x614>
    80004ee4:	00f6f693          	andi	a3,a3,15
    80004ee8:	00dd86b3          	add	a3,s11,a3
    80004eec:	0006c583          	lbu	a1,0(a3)
    80004ef0:	00c7d513          	srli	a0,a5,0xc
    80004ef4:	00c7d69b          	srliw	a3,a5,0xc
    80004ef8:	f8b40223          	sb	a1,-124(s0)
    80004efc:	29067a63          	bgeu	a2,a6,80005190 <__printf+0x638>
    80004f00:	00f6f693          	andi	a3,a3,15
    80004f04:	00dd86b3          	add	a3,s11,a3
    80004f08:	0006c583          	lbu	a1,0(a3)
    80004f0c:	0107d813          	srli	a6,a5,0x10
    80004f10:	0107d69b          	srliw	a3,a5,0x10
    80004f14:	f8b402a3          	sb	a1,-123(s0)
    80004f18:	28a67263          	bgeu	a2,a0,8000519c <__printf+0x644>
    80004f1c:	00f6f693          	andi	a3,a3,15
    80004f20:	00dd86b3          	add	a3,s11,a3
    80004f24:	0006c683          	lbu	a3,0(a3)
    80004f28:	0147d79b          	srliw	a5,a5,0x14
    80004f2c:	f8d40323          	sb	a3,-122(s0)
    80004f30:	21067663          	bgeu	a2,a6,8000513c <__printf+0x5e4>
    80004f34:	02079793          	slli	a5,a5,0x20
    80004f38:	0207d793          	srli	a5,a5,0x20
    80004f3c:	00fd8db3          	add	s11,s11,a5
    80004f40:	000dc683          	lbu	a3,0(s11)
    80004f44:	00800793          	li	a5,8
    80004f48:	00700c93          	li	s9,7
    80004f4c:	f8d403a3          	sb	a3,-121(s0)
    80004f50:	00075c63          	bgez	a4,80004f68 <__printf+0x410>
    80004f54:	f9040713          	addi	a4,s0,-112
    80004f58:	00f70733          	add	a4,a4,a5
    80004f5c:	02d00693          	li	a3,45
    80004f60:	fed70823          	sb	a3,-16(a4)
    80004f64:	00078c93          	mv	s9,a5
    80004f68:	f8040793          	addi	a5,s0,-128
    80004f6c:	01978cb3          	add	s9,a5,s9
    80004f70:	f7f40d13          	addi	s10,s0,-129
    80004f74:	000cc503          	lbu	a0,0(s9)
    80004f78:	fffc8c93          	addi	s9,s9,-1
    80004f7c:	00000097          	auipc	ra,0x0
    80004f80:	9f8080e7          	jalr	-1544(ra) # 80004974 <consputc>
    80004f84:	ff9d18e3          	bne	s10,s9,80004f74 <__printf+0x41c>
    80004f88:	0100006f          	j	80004f98 <__printf+0x440>
    80004f8c:	00000097          	auipc	ra,0x0
    80004f90:	9e8080e7          	jalr	-1560(ra) # 80004974 <consputc>
    80004f94:	000c8493          	mv	s1,s9
    80004f98:	00094503          	lbu	a0,0(s2)
    80004f9c:	c60510e3          	bnez	a0,80004bfc <__printf+0xa4>
    80004fa0:	e40c0ee3          	beqz	s8,80004dfc <__printf+0x2a4>
    80004fa4:	00004517          	auipc	a0,0x4
    80004fa8:	40c50513          	addi	a0,a0,1036 # 800093b0 <pr>
    80004fac:	00001097          	auipc	ra,0x1
    80004fb0:	94c080e7          	jalr	-1716(ra) # 800058f8 <release>
    80004fb4:	e49ff06f          	j	80004dfc <__printf+0x2a4>
    80004fb8:	f7843783          	ld	a5,-136(s0)
    80004fbc:	03000513          	li	a0,48
    80004fc0:	01000d13          	li	s10,16
    80004fc4:	00878713          	addi	a4,a5,8
    80004fc8:	0007bc83          	ld	s9,0(a5)
    80004fcc:	f6e43c23          	sd	a4,-136(s0)
    80004fd0:	00000097          	auipc	ra,0x0
    80004fd4:	9a4080e7          	jalr	-1628(ra) # 80004974 <consputc>
    80004fd8:	07800513          	li	a0,120
    80004fdc:	00000097          	auipc	ra,0x0
    80004fe0:	998080e7          	jalr	-1640(ra) # 80004974 <consputc>
    80004fe4:	00002d97          	auipc	s11,0x2
    80004fe8:	4ecd8d93          	addi	s11,s11,1260 # 800074d0 <digits>
    80004fec:	03ccd793          	srli	a5,s9,0x3c
    80004ff0:	00fd87b3          	add	a5,s11,a5
    80004ff4:	0007c503          	lbu	a0,0(a5)
    80004ff8:	fffd0d1b          	addiw	s10,s10,-1
    80004ffc:	004c9c93          	slli	s9,s9,0x4
    80005000:	00000097          	auipc	ra,0x0
    80005004:	974080e7          	jalr	-1676(ra) # 80004974 <consputc>
    80005008:	fe0d12e3          	bnez	s10,80004fec <__printf+0x494>
    8000500c:	f8dff06f          	j	80004f98 <__printf+0x440>
    80005010:	f7843783          	ld	a5,-136(s0)
    80005014:	0007bc83          	ld	s9,0(a5)
    80005018:	00878793          	addi	a5,a5,8
    8000501c:	f6f43c23          	sd	a5,-136(s0)
    80005020:	000c9a63          	bnez	s9,80005034 <__printf+0x4dc>
    80005024:	1080006f          	j	8000512c <__printf+0x5d4>
    80005028:	001c8c93          	addi	s9,s9,1
    8000502c:	00000097          	auipc	ra,0x0
    80005030:	948080e7          	jalr	-1720(ra) # 80004974 <consputc>
    80005034:	000cc503          	lbu	a0,0(s9)
    80005038:	fe0518e3          	bnez	a0,80005028 <__printf+0x4d0>
    8000503c:	f5dff06f          	j	80004f98 <__printf+0x440>
    80005040:	02500513          	li	a0,37
    80005044:	00000097          	auipc	ra,0x0
    80005048:	930080e7          	jalr	-1744(ra) # 80004974 <consputc>
    8000504c:	000c8513          	mv	a0,s9
    80005050:	00000097          	auipc	ra,0x0
    80005054:	924080e7          	jalr	-1756(ra) # 80004974 <consputc>
    80005058:	f41ff06f          	j	80004f98 <__printf+0x440>
    8000505c:	02500513          	li	a0,37
    80005060:	00000097          	auipc	ra,0x0
    80005064:	914080e7          	jalr	-1772(ra) # 80004974 <consputc>
    80005068:	f31ff06f          	j	80004f98 <__printf+0x440>
    8000506c:	00030513          	mv	a0,t1
    80005070:	00000097          	auipc	ra,0x0
    80005074:	7bc080e7          	jalr	1980(ra) # 8000582c <acquire>
    80005078:	b4dff06f          	j	80004bc4 <__printf+0x6c>
    8000507c:	40c0053b          	negw	a0,a2
    80005080:	00a00713          	li	a4,10
    80005084:	02e576bb          	remuw	a3,a0,a4
    80005088:	00002d97          	auipc	s11,0x2
    8000508c:	448d8d93          	addi	s11,s11,1096 # 800074d0 <digits>
    80005090:	ff700593          	li	a1,-9
    80005094:	02069693          	slli	a3,a3,0x20
    80005098:	0206d693          	srli	a3,a3,0x20
    8000509c:	00dd86b3          	add	a3,s11,a3
    800050a0:	0006c683          	lbu	a3,0(a3)
    800050a4:	02e557bb          	divuw	a5,a0,a4
    800050a8:	f8d40023          	sb	a3,-128(s0)
    800050ac:	10b65e63          	bge	a2,a1,800051c8 <__printf+0x670>
    800050b0:	06300593          	li	a1,99
    800050b4:	02e7f6bb          	remuw	a3,a5,a4
    800050b8:	02069693          	slli	a3,a3,0x20
    800050bc:	0206d693          	srli	a3,a3,0x20
    800050c0:	00dd86b3          	add	a3,s11,a3
    800050c4:	0006c683          	lbu	a3,0(a3)
    800050c8:	02e7d73b          	divuw	a4,a5,a4
    800050cc:	00200793          	li	a5,2
    800050d0:	f8d400a3          	sb	a3,-127(s0)
    800050d4:	bca5ece3          	bltu	a1,a0,80004cac <__printf+0x154>
    800050d8:	ce5ff06f          	j	80004dbc <__printf+0x264>
    800050dc:	40e007bb          	negw	a5,a4
    800050e0:	00002d97          	auipc	s11,0x2
    800050e4:	3f0d8d93          	addi	s11,s11,1008 # 800074d0 <digits>
    800050e8:	00f7f693          	andi	a3,a5,15
    800050ec:	00dd86b3          	add	a3,s11,a3
    800050f0:	0006c583          	lbu	a1,0(a3)
    800050f4:	ff100613          	li	a2,-15
    800050f8:	0047d69b          	srliw	a3,a5,0x4
    800050fc:	f8b40023          	sb	a1,-128(s0)
    80005100:	0047d59b          	srliw	a1,a5,0x4
    80005104:	0ac75e63          	bge	a4,a2,800051c0 <__printf+0x668>
    80005108:	00f6f693          	andi	a3,a3,15
    8000510c:	00dd86b3          	add	a3,s11,a3
    80005110:	0006c603          	lbu	a2,0(a3)
    80005114:	00f00693          	li	a3,15
    80005118:	0087d79b          	srliw	a5,a5,0x8
    8000511c:	f8c400a3          	sb	a2,-127(s0)
    80005120:	d8b6e4e3          	bltu	a3,a1,80004ea8 <__printf+0x350>
    80005124:	00200793          	li	a5,2
    80005128:	e2dff06f          	j	80004f54 <__printf+0x3fc>
    8000512c:	00002c97          	auipc	s9,0x2
    80005130:	384c8c93          	addi	s9,s9,900 # 800074b0 <CONSOLE_STATUS+0x4a0>
    80005134:	02800513          	li	a0,40
    80005138:	ef1ff06f          	j	80005028 <__printf+0x4d0>
    8000513c:	00700793          	li	a5,7
    80005140:	00600c93          	li	s9,6
    80005144:	e0dff06f          	j	80004f50 <__printf+0x3f8>
    80005148:	00700793          	li	a5,7
    8000514c:	00600c93          	li	s9,6
    80005150:	c69ff06f          	j	80004db8 <__printf+0x260>
    80005154:	00300793          	li	a5,3
    80005158:	00200c93          	li	s9,2
    8000515c:	c5dff06f          	j	80004db8 <__printf+0x260>
    80005160:	00300793          	li	a5,3
    80005164:	00200c93          	li	s9,2
    80005168:	de9ff06f          	j	80004f50 <__printf+0x3f8>
    8000516c:	00400793          	li	a5,4
    80005170:	00300c93          	li	s9,3
    80005174:	dddff06f          	j	80004f50 <__printf+0x3f8>
    80005178:	00400793          	li	a5,4
    8000517c:	00300c93          	li	s9,3
    80005180:	c39ff06f          	j	80004db8 <__printf+0x260>
    80005184:	00500793          	li	a5,5
    80005188:	00400c93          	li	s9,4
    8000518c:	c2dff06f          	j	80004db8 <__printf+0x260>
    80005190:	00500793          	li	a5,5
    80005194:	00400c93          	li	s9,4
    80005198:	db9ff06f          	j	80004f50 <__printf+0x3f8>
    8000519c:	00600793          	li	a5,6
    800051a0:	00500c93          	li	s9,5
    800051a4:	dadff06f          	j	80004f50 <__printf+0x3f8>
    800051a8:	00600793          	li	a5,6
    800051ac:	00500c93          	li	s9,5
    800051b0:	c09ff06f          	j	80004db8 <__printf+0x260>
    800051b4:	00800793          	li	a5,8
    800051b8:	00700c93          	li	s9,7
    800051bc:	bfdff06f          	j	80004db8 <__printf+0x260>
    800051c0:	00100793          	li	a5,1
    800051c4:	d91ff06f          	j	80004f54 <__printf+0x3fc>
    800051c8:	00100793          	li	a5,1
    800051cc:	bf1ff06f          	j	80004dbc <__printf+0x264>
    800051d0:	00900793          	li	a5,9
    800051d4:	00800c93          	li	s9,8
    800051d8:	be1ff06f          	j	80004db8 <__printf+0x260>
    800051dc:	00002517          	auipc	a0,0x2
    800051e0:	2dc50513          	addi	a0,a0,732 # 800074b8 <CONSOLE_STATUS+0x4a8>
    800051e4:	00000097          	auipc	ra,0x0
    800051e8:	918080e7          	jalr	-1768(ra) # 80004afc <panic>

00000000800051ec <printfinit>:
    800051ec:	fe010113          	addi	sp,sp,-32
    800051f0:	00813823          	sd	s0,16(sp)
    800051f4:	00913423          	sd	s1,8(sp)
    800051f8:	00113c23          	sd	ra,24(sp)
    800051fc:	02010413          	addi	s0,sp,32
    80005200:	00004497          	auipc	s1,0x4
    80005204:	1b048493          	addi	s1,s1,432 # 800093b0 <pr>
    80005208:	00048513          	mv	a0,s1
    8000520c:	00002597          	auipc	a1,0x2
    80005210:	2bc58593          	addi	a1,a1,700 # 800074c8 <CONSOLE_STATUS+0x4b8>
    80005214:	00000097          	auipc	ra,0x0
    80005218:	5f4080e7          	jalr	1524(ra) # 80005808 <initlock>
    8000521c:	01813083          	ld	ra,24(sp)
    80005220:	01013403          	ld	s0,16(sp)
    80005224:	0004ac23          	sw	zero,24(s1)
    80005228:	00813483          	ld	s1,8(sp)
    8000522c:	02010113          	addi	sp,sp,32
    80005230:	00008067          	ret

0000000080005234 <uartinit>:
    80005234:	ff010113          	addi	sp,sp,-16
    80005238:	00813423          	sd	s0,8(sp)
    8000523c:	01010413          	addi	s0,sp,16
    80005240:	100007b7          	lui	a5,0x10000
    80005244:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80005248:	f8000713          	li	a4,-128
    8000524c:	00e781a3          	sb	a4,3(a5)
    80005250:	00300713          	li	a4,3
    80005254:	00e78023          	sb	a4,0(a5)
    80005258:	000780a3          	sb	zero,1(a5)
    8000525c:	00e781a3          	sb	a4,3(a5)
    80005260:	00700693          	li	a3,7
    80005264:	00d78123          	sb	a3,2(a5)
    80005268:	00e780a3          	sb	a4,1(a5)
    8000526c:	00813403          	ld	s0,8(sp)
    80005270:	01010113          	addi	sp,sp,16
    80005274:	00008067          	ret

0000000080005278 <uartputc>:
    80005278:	00003797          	auipc	a5,0x3
    8000527c:	e907a783          	lw	a5,-368(a5) # 80008108 <panicked>
    80005280:	00078463          	beqz	a5,80005288 <uartputc+0x10>
    80005284:	0000006f          	j	80005284 <uartputc+0xc>
    80005288:	fd010113          	addi	sp,sp,-48
    8000528c:	02813023          	sd	s0,32(sp)
    80005290:	00913c23          	sd	s1,24(sp)
    80005294:	01213823          	sd	s2,16(sp)
    80005298:	01313423          	sd	s3,8(sp)
    8000529c:	02113423          	sd	ra,40(sp)
    800052a0:	03010413          	addi	s0,sp,48
    800052a4:	00003917          	auipc	s2,0x3
    800052a8:	e6c90913          	addi	s2,s2,-404 # 80008110 <uart_tx_r>
    800052ac:	00093783          	ld	a5,0(s2)
    800052b0:	00003497          	auipc	s1,0x3
    800052b4:	e6848493          	addi	s1,s1,-408 # 80008118 <uart_tx_w>
    800052b8:	0004b703          	ld	a4,0(s1)
    800052bc:	02078693          	addi	a3,a5,32
    800052c0:	00050993          	mv	s3,a0
    800052c4:	02e69c63          	bne	a3,a4,800052fc <uartputc+0x84>
    800052c8:	00001097          	auipc	ra,0x1
    800052cc:	834080e7          	jalr	-1996(ra) # 80005afc <push_on>
    800052d0:	00093783          	ld	a5,0(s2)
    800052d4:	0004b703          	ld	a4,0(s1)
    800052d8:	02078793          	addi	a5,a5,32
    800052dc:	00e79463          	bne	a5,a4,800052e4 <uartputc+0x6c>
    800052e0:	0000006f          	j	800052e0 <uartputc+0x68>
    800052e4:	00001097          	auipc	ra,0x1
    800052e8:	88c080e7          	jalr	-1908(ra) # 80005b70 <pop_on>
    800052ec:	00093783          	ld	a5,0(s2)
    800052f0:	0004b703          	ld	a4,0(s1)
    800052f4:	02078693          	addi	a3,a5,32
    800052f8:	fce688e3          	beq	a3,a4,800052c8 <uartputc+0x50>
    800052fc:	01f77693          	andi	a3,a4,31
    80005300:	00004597          	auipc	a1,0x4
    80005304:	0d058593          	addi	a1,a1,208 # 800093d0 <uart_tx_buf>
    80005308:	00d586b3          	add	a3,a1,a3
    8000530c:	00170713          	addi	a4,a4,1
    80005310:	01368023          	sb	s3,0(a3)
    80005314:	00e4b023          	sd	a4,0(s1)
    80005318:	10000637          	lui	a2,0x10000
    8000531c:	02f71063          	bne	a4,a5,8000533c <uartputc+0xc4>
    80005320:	0340006f          	j	80005354 <uartputc+0xdc>
    80005324:	00074703          	lbu	a4,0(a4)
    80005328:	00f93023          	sd	a5,0(s2)
    8000532c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80005330:	00093783          	ld	a5,0(s2)
    80005334:	0004b703          	ld	a4,0(s1)
    80005338:	00f70e63          	beq	a4,a5,80005354 <uartputc+0xdc>
    8000533c:	00564683          	lbu	a3,5(a2)
    80005340:	01f7f713          	andi	a4,a5,31
    80005344:	00e58733          	add	a4,a1,a4
    80005348:	0206f693          	andi	a3,a3,32
    8000534c:	00178793          	addi	a5,a5,1
    80005350:	fc069ae3          	bnez	a3,80005324 <uartputc+0xac>
    80005354:	02813083          	ld	ra,40(sp)
    80005358:	02013403          	ld	s0,32(sp)
    8000535c:	01813483          	ld	s1,24(sp)
    80005360:	01013903          	ld	s2,16(sp)
    80005364:	00813983          	ld	s3,8(sp)
    80005368:	03010113          	addi	sp,sp,48
    8000536c:	00008067          	ret

0000000080005370 <uartputc_sync>:
    80005370:	ff010113          	addi	sp,sp,-16
    80005374:	00813423          	sd	s0,8(sp)
    80005378:	01010413          	addi	s0,sp,16
    8000537c:	00003717          	auipc	a4,0x3
    80005380:	d8c72703          	lw	a4,-628(a4) # 80008108 <panicked>
    80005384:	02071663          	bnez	a4,800053b0 <uartputc_sync+0x40>
    80005388:	00050793          	mv	a5,a0
    8000538c:	100006b7          	lui	a3,0x10000
    80005390:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005394:	02077713          	andi	a4,a4,32
    80005398:	fe070ce3          	beqz	a4,80005390 <uartputc_sync+0x20>
    8000539c:	0ff7f793          	andi	a5,a5,255
    800053a0:	00f68023          	sb	a5,0(a3)
    800053a4:	00813403          	ld	s0,8(sp)
    800053a8:	01010113          	addi	sp,sp,16
    800053ac:	00008067          	ret
    800053b0:	0000006f          	j	800053b0 <uartputc_sync+0x40>

00000000800053b4 <uartstart>:
    800053b4:	ff010113          	addi	sp,sp,-16
    800053b8:	00813423          	sd	s0,8(sp)
    800053bc:	01010413          	addi	s0,sp,16
    800053c0:	00003617          	auipc	a2,0x3
    800053c4:	d5060613          	addi	a2,a2,-688 # 80008110 <uart_tx_r>
    800053c8:	00003517          	auipc	a0,0x3
    800053cc:	d5050513          	addi	a0,a0,-688 # 80008118 <uart_tx_w>
    800053d0:	00063783          	ld	a5,0(a2)
    800053d4:	00053703          	ld	a4,0(a0)
    800053d8:	04f70263          	beq	a4,a5,8000541c <uartstart+0x68>
    800053dc:	100005b7          	lui	a1,0x10000
    800053e0:	00004817          	auipc	a6,0x4
    800053e4:	ff080813          	addi	a6,a6,-16 # 800093d0 <uart_tx_buf>
    800053e8:	01c0006f          	j	80005404 <uartstart+0x50>
    800053ec:	0006c703          	lbu	a4,0(a3)
    800053f0:	00f63023          	sd	a5,0(a2)
    800053f4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800053f8:	00063783          	ld	a5,0(a2)
    800053fc:	00053703          	ld	a4,0(a0)
    80005400:	00f70e63          	beq	a4,a5,8000541c <uartstart+0x68>
    80005404:	01f7f713          	andi	a4,a5,31
    80005408:	00e806b3          	add	a3,a6,a4
    8000540c:	0055c703          	lbu	a4,5(a1)
    80005410:	00178793          	addi	a5,a5,1
    80005414:	02077713          	andi	a4,a4,32
    80005418:	fc071ae3          	bnez	a4,800053ec <uartstart+0x38>
    8000541c:	00813403          	ld	s0,8(sp)
    80005420:	01010113          	addi	sp,sp,16
    80005424:	00008067          	ret

0000000080005428 <uartgetc>:
    80005428:	ff010113          	addi	sp,sp,-16
    8000542c:	00813423          	sd	s0,8(sp)
    80005430:	01010413          	addi	s0,sp,16
    80005434:	10000737          	lui	a4,0x10000
    80005438:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000543c:	0017f793          	andi	a5,a5,1
    80005440:	00078c63          	beqz	a5,80005458 <uartgetc+0x30>
    80005444:	00074503          	lbu	a0,0(a4)
    80005448:	0ff57513          	andi	a0,a0,255
    8000544c:	00813403          	ld	s0,8(sp)
    80005450:	01010113          	addi	sp,sp,16
    80005454:	00008067          	ret
    80005458:	fff00513          	li	a0,-1
    8000545c:	ff1ff06f          	j	8000544c <uartgetc+0x24>

0000000080005460 <uartintr>:
    80005460:	100007b7          	lui	a5,0x10000
    80005464:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80005468:	0017f793          	andi	a5,a5,1
    8000546c:	0a078463          	beqz	a5,80005514 <uartintr+0xb4>
    80005470:	fe010113          	addi	sp,sp,-32
    80005474:	00813823          	sd	s0,16(sp)
    80005478:	00913423          	sd	s1,8(sp)
    8000547c:	00113c23          	sd	ra,24(sp)
    80005480:	02010413          	addi	s0,sp,32
    80005484:	100004b7          	lui	s1,0x10000
    80005488:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000548c:	0ff57513          	andi	a0,a0,255
    80005490:	fffff097          	auipc	ra,0xfffff
    80005494:	534080e7          	jalr	1332(ra) # 800049c4 <consoleintr>
    80005498:	0054c783          	lbu	a5,5(s1)
    8000549c:	0017f793          	andi	a5,a5,1
    800054a0:	fe0794e3          	bnez	a5,80005488 <uartintr+0x28>
    800054a4:	00003617          	auipc	a2,0x3
    800054a8:	c6c60613          	addi	a2,a2,-916 # 80008110 <uart_tx_r>
    800054ac:	00003517          	auipc	a0,0x3
    800054b0:	c6c50513          	addi	a0,a0,-916 # 80008118 <uart_tx_w>
    800054b4:	00063783          	ld	a5,0(a2)
    800054b8:	00053703          	ld	a4,0(a0)
    800054bc:	04f70263          	beq	a4,a5,80005500 <uartintr+0xa0>
    800054c0:	100005b7          	lui	a1,0x10000
    800054c4:	00004817          	auipc	a6,0x4
    800054c8:	f0c80813          	addi	a6,a6,-244 # 800093d0 <uart_tx_buf>
    800054cc:	01c0006f          	j	800054e8 <uartintr+0x88>
    800054d0:	0006c703          	lbu	a4,0(a3)
    800054d4:	00f63023          	sd	a5,0(a2)
    800054d8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800054dc:	00063783          	ld	a5,0(a2)
    800054e0:	00053703          	ld	a4,0(a0)
    800054e4:	00f70e63          	beq	a4,a5,80005500 <uartintr+0xa0>
    800054e8:	01f7f713          	andi	a4,a5,31
    800054ec:	00e806b3          	add	a3,a6,a4
    800054f0:	0055c703          	lbu	a4,5(a1)
    800054f4:	00178793          	addi	a5,a5,1
    800054f8:	02077713          	andi	a4,a4,32
    800054fc:	fc071ae3          	bnez	a4,800054d0 <uartintr+0x70>
    80005500:	01813083          	ld	ra,24(sp)
    80005504:	01013403          	ld	s0,16(sp)
    80005508:	00813483          	ld	s1,8(sp)
    8000550c:	02010113          	addi	sp,sp,32
    80005510:	00008067          	ret
    80005514:	00003617          	auipc	a2,0x3
    80005518:	bfc60613          	addi	a2,a2,-1028 # 80008110 <uart_tx_r>
    8000551c:	00003517          	auipc	a0,0x3
    80005520:	bfc50513          	addi	a0,a0,-1028 # 80008118 <uart_tx_w>
    80005524:	00063783          	ld	a5,0(a2)
    80005528:	00053703          	ld	a4,0(a0)
    8000552c:	04f70263          	beq	a4,a5,80005570 <uartintr+0x110>
    80005530:	100005b7          	lui	a1,0x10000
    80005534:	00004817          	auipc	a6,0x4
    80005538:	e9c80813          	addi	a6,a6,-356 # 800093d0 <uart_tx_buf>
    8000553c:	01c0006f          	j	80005558 <uartintr+0xf8>
    80005540:	0006c703          	lbu	a4,0(a3)
    80005544:	00f63023          	sd	a5,0(a2)
    80005548:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000554c:	00063783          	ld	a5,0(a2)
    80005550:	00053703          	ld	a4,0(a0)
    80005554:	02f70063          	beq	a4,a5,80005574 <uartintr+0x114>
    80005558:	01f7f713          	andi	a4,a5,31
    8000555c:	00e806b3          	add	a3,a6,a4
    80005560:	0055c703          	lbu	a4,5(a1)
    80005564:	00178793          	addi	a5,a5,1
    80005568:	02077713          	andi	a4,a4,32
    8000556c:	fc071ae3          	bnez	a4,80005540 <uartintr+0xe0>
    80005570:	00008067          	ret
    80005574:	00008067          	ret

0000000080005578 <kinit>:
    80005578:	fc010113          	addi	sp,sp,-64
    8000557c:	02913423          	sd	s1,40(sp)
    80005580:	fffff7b7          	lui	a5,0xfffff
    80005584:	00005497          	auipc	s1,0x5
    80005588:	e6b48493          	addi	s1,s1,-405 # 8000a3ef <end+0xfff>
    8000558c:	02813823          	sd	s0,48(sp)
    80005590:	01313c23          	sd	s3,24(sp)
    80005594:	00f4f4b3          	and	s1,s1,a5
    80005598:	02113c23          	sd	ra,56(sp)
    8000559c:	03213023          	sd	s2,32(sp)
    800055a0:	01413823          	sd	s4,16(sp)
    800055a4:	01513423          	sd	s5,8(sp)
    800055a8:	04010413          	addi	s0,sp,64
    800055ac:	000017b7          	lui	a5,0x1
    800055b0:	01100993          	li	s3,17
    800055b4:	00f487b3          	add	a5,s1,a5
    800055b8:	01b99993          	slli	s3,s3,0x1b
    800055bc:	06f9e063          	bltu	s3,a5,8000561c <kinit+0xa4>
    800055c0:	00004a97          	auipc	s5,0x4
    800055c4:	e30a8a93          	addi	s5,s5,-464 # 800093f0 <end>
    800055c8:	0754ec63          	bltu	s1,s5,80005640 <kinit+0xc8>
    800055cc:	0734fa63          	bgeu	s1,s3,80005640 <kinit+0xc8>
    800055d0:	00088a37          	lui	s4,0x88
    800055d4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800055d8:	00003917          	auipc	s2,0x3
    800055dc:	b4890913          	addi	s2,s2,-1208 # 80008120 <kmem>
    800055e0:	00ca1a13          	slli	s4,s4,0xc
    800055e4:	0140006f          	j	800055f8 <kinit+0x80>
    800055e8:	000017b7          	lui	a5,0x1
    800055ec:	00f484b3          	add	s1,s1,a5
    800055f0:	0554e863          	bltu	s1,s5,80005640 <kinit+0xc8>
    800055f4:	0534f663          	bgeu	s1,s3,80005640 <kinit+0xc8>
    800055f8:	00001637          	lui	a2,0x1
    800055fc:	00100593          	li	a1,1
    80005600:	00048513          	mv	a0,s1
    80005604:	00000097          	auipc	ra,0x0
    80005608:	5e4080e7          	jalr	1508(ra) # 80005be8 <__memset>
    8000560c:	00093783          	ld	a5,0(s2)
    80005610:	00f4b023          	sd	a5,0(s1)
    80005614:	00993023          	sd	s1,0(s2)
    80005618:	fd4498e3          	bne	s1,s4,800055e8 <kinit+0x70>
    8000561c:	03813083          	ld	ra,56(sp)
    80005620:	03013403          	ld	s0,48(sp)
    80005624:	02813483          	ld	s1,40(sp)
    80005628:	02013903          	ld	s2,32(sp)
    8000562c:	01813983          	ld	s3,24(sp)
    80005630:	01013a03          	ld	s4,16(sp)
    80005634:	00813a83          	ld	s5,8(sp)
    80005638:	04010113          	addi	sp,sp,64
    8000563c:	00008067          	ret
    80005640:	00002517          	auipc	a0,0x2
    80005644:	ea850513          	addi	a0,a0,-344 # 800074e8 <digits+0x18>
    80005648:	fffff097          	auipc	ra,0xfffff
    8000564c:	4b4080e7          	jalr	1204(ra) # 80004afc <panic>

0000000080005650 <freerange>:
    80005650:	fc010113          	addi	sp,sp,-64
    80005654:	000017b7          	lui	a5,0x1
    80005658:	02913423          	sd	s1,40(sp)
    8000565c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005660:	009504b3          	add	s1,a0,s1
    80005664:	fffff537          	lui	a0,0xfffff
    80005668:	02813823          	sd	s0,48(sp)
    8000566c:	02113c23          	sd	ra,56(sp)
    80005670:	03213023          	sd	s2,32(sp)
    80005674:	01313c23          	sd	s3,24(sp)
    80005678:	01413823          	sd	s4,16(sp)
    8000567c:	01513423          	sd	s5,8(sp)
    80005680:	01613023          	sd	s6,0(sp)
    80005684:	04010413          	addi	s0,sp,64
    80005688:	00a4f4b3          	and	s1,s1,a0
    8000568c:	00f487b3          	add	a5,s1,a5
    80005690:	06f5e463          	bltu	a1,a5,800056f8 <freerange+0xa8>
    80005694:	00004a97          	auipc	s5,0x4
    80005698:	d5ca8a93          	addi	s5,s5,-676 # 800093f0 <end>
    8000569c:	0954e263          	bltu	s1,s5,80005720 <freerange+0xd0>
    800056a0:	01100993          	li	s3,17
    800056a4:	01b99993          	slli	s3,s3,0x1b
    800056a8:	0734fc63          	bgeu	s1,s3,80005720 <freerange+0xd0>
    800056ac:	00058a13          	mv	s4,a1
    800056b0:	00003917          	auipc	s2,0x3
    800056b4:	a7090913          	addi	s2,s2,-1424 # 80008120 <kmem>
    800056b8:	00002b37          	lui	s6,0x2
    800056bc:	0140006f          	j	800056d0 <freerange+0x80>
    800056c0:	000017b7          	lui	a5,0x1
    800056c4:	00f484b3          	add	s1,s1,a5
    800056c8:	0554ec63          	bltu	s1,s5,80005720 <freerange+0xd0>
    800056cc:	0534fa63          	bgeu	s1,s3,80005720 <freerange+0xd0>
    800056d0:	00001637          	lui	a2,0x1
    800056d4:	00100593          	li	a1,1
    800056d8:	00048513          	mv	a0,s1
    800056dc:	00000097          	auipc	ra,0x0
    800056e0:	50c080e7          	jalr	1292(ra) # 80005be8 <__memset>
    800056e4:	00093703          	ld	a4,0(s2)
    800056e8:	016487b3          	add	a5,s1,s6
    800056ec:	00e4b023          	sd	a4,0(s1)
    800056f0:	00993023          	sd	s1,0(s2)
    800056f4:	fcfa76e3          	bgeu	s4,a5,800056c0 <freerange+0x70>
    800056f8:	03813083          	ld	ra,56(sp)
    800056fc:	03013403          	ld	s0,48(sp)
    80005700:	02813483          	ld	s1,40(sp)
    80005704:	02013903          	ld	s2,32(sp)
    80005708:	01813983          	ld	s3,24(sp)
    8000570c:	01013a03          	ld	s4,16(sp)
    80005710:	00813a83          	ld	s5,8(sp)
    80005714:	00013b03          	ld	s6,0(sp)
    80005718:	04010113          	addi	sp,sp,64
    8000571c:	00008067          	ret
    80005720:	00002517          	auipc	a0,0x2
    80005724:	dc850513          	addi	a0,a0,-568 # 800074e8 <digits+0x18>
    80005728:	fffff097          	auipc	ra,0xfffff
    8000572c:	3d4080e7          	jalr	980(ra) # 80004afc <panic>

0000000080005730 <kfree>:
    80005730:	fe010113          	addi	sp,sp,-32
    80005734:	00813823          	sd	s0,16(sp)
    80005738:	00113c23          	sd	ra,24(sp)
    8000573c:	00913423          	sd	s1,8(sp)
    80005740:	02010413          	addi	s0,sp,32
    80005744:	03451793          	slli	a5,a0,0x34
    80005748:	04079c63          	bnez	a5,800057a0 <kfree+0x70>
    8000574c:	00004797          	auipc	a5,0x4
    80005750:	ca478793          	addi	a5,a5,-860 # 800093f0 <end>
    80005754:	00050493          	mv	s1,a0
    80005758:	04f56463          	bltu	a0,a5,800057a0 <kfree+0x70>
    8000575c:	01100793          	li	a5,17
    80005760:	01b79793          	slli	a5,a5,0x1b
    80005764:	02f57e63          	bgeu	a0,a5,800057a0 <kfree+0x70>
    80005768:	00001637          	lui	a2,0x1
    8000576c:	00100593          	li	a1,1
    80005770:	00000097          	auipc	ra,0x0
    80005774:	478080e7          	jalr	1144(ra) # 80005be8 <__memset>
    80005778:	00003797          	auipc	a5,0x3
    8000577c:	9a878793          	addi	a5,a5,-1624 # 80008120 <kmem>
    80005780:	0007b703          	ld	a4,0(a5)
    80005784:	01813083          	ld	ra,24(sp)
    80005788:	01013403          	ld	s0,16(sp)
    8000578c:	00e4b023          	sd	a4,0(s1)
    80005790:	0097b023          	sd	s1,0(a5)
    80005794:	00813483          	ld	s1,8(sp)
    80005798:	02010113          	addi	sp,sp,32
    8000579c:	00008067          	ret
    800057a0:	00002517          	auipc	a0,0x2
    800057a4:	d4850513          	addi	a0,a0,-696 # 800074e8 <digits+0x18>
    800057a8:	fffff097          	auipc	ra,0xfffff
    800057ac:	354080e7          	jalr	852(ra) # 80004afc <panic>

00000000800057b0 <kalloc>:
    800057b0:	fe010113          	addi	sp,sp,-32
    800057b4:	00813823          	sd	s0,16(sp)
    800057b8:	00913423          	sd	s1,8(sp)
    800057bc:	00113c23          	sd	ra,24(sp)
    800057c0:	02010413          	addi	s0,sp,32
    800057c4:	00003797          	auipc	a5,0x3
    800057c8:	95c78793          	addi	a5,a5,-1700 # 80008120 <kmem>
    800057cc:	0007b483          	ld	s1,0(a5)
    800057d0:	02048063          	beqz	s1,800057f0 <kalloc+0x40>
    800057d4:	0004b703          	ld	a4,0(s1)
    800057d8:	00001637          	lui	a2,0x1
    800057dc:	00500593          	li	a1,5
    800057e0:	00048513          	mv	a0,s1
    800057e4:	00e7b023          	sd	a4,0(a5)
    800057e8:	00000097          	auipc	ra,0x0
    800057ec:	400080e7          	jalr	1024(ra) # 80005be8 <__memset>
    800057f0:	01813083          	ld	ra,24(sp)
    800057f4:	01013403          	ld	s0,16(sp)
    800057f8:	00048513          	mv	a0,s1
    800057fc:	00813483          	ld	s1,8(sp)
    80005800:	02010113          	addi	sp,sp,32
    80005804:	00008067          	ret

0000000080005808 <initlock>:
    80005808:	ff010113          	addi	sp,sp,-16
    8000580c:	00813423          	sd	s0,8(sp)
    80005810:	01010413          	addi	s0,sp,16
    80005814:	00813403          	ld	s0,8(sp)
    80005818:	00b53423          	sd	a1,8(a0)
    8000581c:	00052023          	sw	zero,0(a0)
    80005820:	00053823          	sd	zero,16(a0)
    80005824:	01010113          	addi	sp,sp,16
    80005828:	00008067          	ret

000000008000582c <acquire>:
    8000582c:	fe010113          	addi	sp,sp,-32
    80005830:	00813823          	sd	s0,16(sp)
    80005834:	00913423          	sd	s1,8(sp)
    80005838:	00113c23          	sd	ra,24(sp)
    8000583c:	01213023          	sd	s2,0(sp)
    80005840:	02010413          	addi	s0,sp,32
    80005844:	00050493          	mv	s1,a0
    80005848:	10002973          	csrr	s2,sstatus
    8000584c:	100027f3          	csrr	a5,sstatus
    80005850:	ffd7f793          	andi	a5,a5,-3
    80005854:	10079073          	csrw	sstatus,a5
    80005858:	fffff097          	auipc	ra,0xfffff
    8000585c:	8e4080e7          	jalr	-1820(ra) # 8000413c <mycpu>
    80005860:	07852783          	lw	a5,120(a0)
    80005864:	06078e63          	beqz	a5,800058e0 <acquire+0xb4>
    80005868:	fffff097          	auipc	ra,0xfffff
    8000586c:	8d4080e7          	jalr	-1836(ra) # 8000413c <mycpu>
    80005870:	07852783          	lw	a5,120(a0)
    80005874:	0004a703          	lw	a4,0(s1)
    80005878:	0017879b          	addiw	a5,a5,1
    8000587c:	06f52c23          	sw	a5,120(a0)
    80005880:	04071063          	bnez	a4,800058c0 <acquire+0x94>
    80005884:	00100713          	li	a4,1
    80005888:	00070793          	mv	a5,a4
    8000588c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005890:	0007879b          	sext.w	a5,a5
    80005894:	fe079ae3          	bnez	a5,80005888 <acquire+0x5c>
    80005898:	0ff0000f          	fence
    8000589c:	fffff097          	auipc	ra,0xfffff
    800058a0:	8a0080e7          	jalr	-1888(ra) # 8000413c <mycpu>
    800058a4:	01813083          	ld	ra,24(sp)
    800058a8:	01013403          	ld	s0,16(sp)
    800058ac:	00a4b823          	sd	a0,16(s1)
    800058b0:	00013903          	ld	s2,0(sp)
    800058b4:	00813483          	ld	s1,8(sp)
    800058b8:	02010113          	addi	sp,sp,32
    800058bc:	00008067          	ret
    800058c0:	0104b903          	ld	s2,16(s1)
    800058c4:	fffff097          	auipc	ra,0xfffff
    800058c8:	878080e7          	jalr	-1928(ra) # 8000413c <mycpu>
    800058cc:	faa91ce3          	bne	s2,a0,80005884 <acquire+0x58>
    800058d0:	00002517          	auipc	a0,0x2
    800058d4:	c2050513          	addi	a0,a0,-992 # 800074f0 <digits+0x20>
    800058d8:	fffff097          	auipc	ra,0xfffff
    800058dc:	224080e7          	jalr	548(ra) # 80004afc <panic>
    800058e0:	00195913          	srli	s2,s2,0x1
    800058e4:	fffff097          	auipc	ra,0xfffff
    800058e8:	858080e7          	jalr	-1960(ra) # 8000413c <mycpu>
    800058ec:	00197913          	andi	s2,s2,1
    800058f0:	07252e23          	sw	s2,124(a0)
    800058f4:	f75ff06f          	j	80005868 <acquire+0x3c>

00000000800058f8 <release>:
    800058f8:	fe010113          	addi	sp,sp,-32
    800058fc:	00813823          	sd	s0,16(sp)
    80005900:	00113c23          	sd	ra,24(sp)
    80005904:	00913423          	sd	s1,8(sp)
    80005908:	01213023          	sd	s2,0(sp)
    8000590c:	02010413          	addi	s0,sp,32
    80005910:	00052783          	lw	a5,0(a0)
    80005914:	00079a63          	bnez	a5,80005928 <release+0x30>
    80005918:	00002517          	auipc	a0,0x2
    8000591c:	be050513          	addi	a0,a0,-1056 # 800074f8 <digits+0x28>
    80005920:	fffff097          	auipc	ra,0xfffff
    80005924:	1dc080e7          	jalr	476(ra) # 80004afc <panic>
    80005928:	01053903          	ld	s2,16(a0)
    8000592c:	00050493          	mv	s1,a0
    80005930:	fffff097          	auipc	ra,0xfffff
    80005934:	80c080e7          	jalr	-2036(ra) # 8000413c <mycpu>
    80005938:	fea910e3          	bne	s2,a0,80005918 <release+0x20>
    8000593c:	0004b823          	sd	zero,16(s1)
    80005940:	0ff0000f          	fence
    80005944:	0f50000f          	fence	iorw,ow
    80005948:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000594c:	ffffe097          	auipc	ra,0xffffe
    80005950:	7f0080e7          	jalr	2032(ra) # 8000413c <mycpu>
    80005954:	100027f3          	csrr	a5,sstatus
    80005958:	0027f793          	andi	a5,a5,2
    8000595c:	04079a63          	bnez	a5,800059b0 <release+0xb8>
    80005960:	07852783          	lw	a5,120(a0)
    80005964:	02f05e63          	blez	a5,800059a0 <release+0xa8>
    80005968:	fff7871b          	addiw	a4,a5,-1
    8000596c:	06e52c23          	sw	a4,120(a0)
    80005970:	00071c63          	bnez	a4,80005988 <release+0x90>
    80005974:	07c52783          	lw	a5,124(a0)
    80005978:	00078863          	beqz	a5,80005988 <release+0x90>
    8000597c:	100027f3          	csrr	a5,sstatus
    80005980:	0027e793          	ori	a5,a5,2
    80005984:	10079073          	csrw	sstatus,a5
    80005988:	01813083          	ld	ra,24(sp)
    8000598c:	01013403          	ld	s0,16(sp)
    80005990:	00813483          	ld	s1,8(sp)
    80005994:	00013903          	ld	s2,0(sp)
    80005998:	02010113          	addi	sp,sp,32
    8000599c:	00008067          	ret
    800059a0:	00002517          	auipc	a0,0x2
    800059a4:	b7850513          	addi	a0,a0,-1160 # 80007518 <digits+0x48>
    800059a8:	fffff097          	auipc	ra,0xfffff
    800059ac:	154080e7          	jalr	340(ra) # 80004afc <panic>
    800059b0:	00002517          	auipc	a0,0x2
    800059b4:	b5050513          	addi	a0,a0,-1200 # 80007500 <digits+0x30>
    800059b8:	fffff097          	auipc	ra,0xfffff
    800059bc:	144080e7          	jalr	324(ra) # 80004afc <panic>

00000000800059c0 <holding>:
    800059c0:	00052783          	lw	a5,0(a0)
    800059c4:	00079663          	bnez	a5,800059d0 <holding+0x10>
    800059c8:	00000513          	li	a0,0
    800059cc:	00008067          	ret
    800059d0:	fe010113          	addi	sp,sp,-32
    800059d4:	00813823          	sd	s0,16(sp)
    800059d8:	00913423          	sd	s1,8(sp)
    800059dc:	00113c23          	sd	ra,24(sp)
    800059e0:	02010413          	addi	s0,sp,32
    800059e4:	01053483          	ld	s1,16(a0)
    800059e8:	ffffe097          	auipc	ra,0xffffe
    800059ec:	754080e7          	jalr	1876(ra) # 8000413c <mycpu>
    800059f0:	01813083          	ld	ra,24(sp)
    800059f4:	01013403          	ld	s0,16(sp)
    800059f8:	40a48533          	sub	a0,s1,a0
    800059fc:	00153513          	seqz	a0,a0
    80005a00:	00813483          	ld	s1,8(sp)
    80005a04:	02010113          	addi	sp,sp,32
    80005a08:	00008067          	ret

0000000080005a0c <push_off>:
    80005a0c:	fe010113          	addi	sp,sp,-32
    80005a10:	00813823          	sd	s0,16(sp)
    80005a14:	00113c23          	sd	ra,24(sp)
    80005a18:	00913423          	sd	s1,8(sp)
    80005a1c:	02010413          	addi	s0,sp,32
    80005a20:	100024f3          	csrr	s1,sstatus
    80005a24:	100027f3          	csrr	a5,sstatus
    80005a28:	ffd7f793          	andi	a5,a5,-3
    80005a2c:	10079073          	csrw	sstatus,a5
    80005a30:	ffffe097          	auipc	ra,0xffffe
    80005a34:	70c080e7          	jalr	1804(ra) # 8000413c <mycpu>
    80005a38:	07852783          	lw	a5,120(a0)
    80005a3c:	02078663          	beqz	a5,80005a68 <push_off+0x5c>
    80005a40:	ffffe097          	auipc	ra,0xffffe
    80005a44:	6fc080e7          	jalr	1788(ra) # 8000413c <mycpu>
    80005a48:	07852783          	lw	a5,120(a0)
    80005a4c:	01813083          	ld	ra,24(sp)
    80005a50:	01013403          	ld	s0,16(sp)
    80005a54:	0017879b          	addiw	a5,a5,1
    80005a58:	06f52c23          	sw	a5,120(a0)
    80005a5c:	00813483          	ld	s1,8(sp)
    80005a60:	02010113          	addi	sp,sp,32
    80005a64:	00008067          	ret
    80005a68:	0014d493          	srli	s1,s1,0x1
    80005a6c:	ffffe097          	auipc	ra,0xffffe
    80005a70:	6d0080e7          	jalr	1744(ra) # 8000413c <mycpu>
    80005a74:	0014f493          	andi	s1,s1,1
    80005a78:	06952e23          	sw	s1,124(a0)
    80005a7c:	fc5ff06f          	j	80005a40 <push_off+0x34>

0000000080005a80 <pop_off>:
    80005a80:	ff010113          	addi	sp,sp,-16
    80005a84:	00813023          	sd	s0,0(sp)
    80005a88:	00113423          	sd	ra,8(sp)
    80005a8c:	01010413          	addi	s0,sp,16
    80005a90:	ffffe097          	auipc	ra,0xffffe
    80005a94:	6ac080e7          	jalr	1708(ra) # 8000413c <mycpu>
    80005a98:	100027f3          	csrr	a5,sstatus
    80005a9c:	0027f793          	andi	a5,a5,2
    80005aa0:	04079663          	bnez	a5,80005aec <pop_off+0x6c>
    80005aa4:	07852783          	lw	a5,120(a0)
    80005aa8:	02f05a63          	blez	a5,80005adc <pop_off+0x5c>
    80005aac:	fff7871b          	addiw	a4,a5,-1
    80005ab0:	06e52c23          	sw	a4,120(a0)
    80005ab4:	00071c63          	bnez	a4,80005acc <pop_off+0x4c>
    80005ab8:	07c52783          	lw	a5,124(a0)
    80005abc:	00078863          	beqz	a5,80005acc <pop_off+0x4c>
    80005ac0:	100027f3          	csrr	a5,sstatus
    80005ac4:	0027e793          	ori	a5,a5,2
    80005ac8:	10079073          	csrw	sstatus,a5
    80005acc:	00813083          	ld	ra,8(sp)
    80005ad0:	00013403          	ld	s0,0(sp)
    80005ad4:	01010113          	addi	sp,sp,16
    80005ad8:	00008067          	ret
    80005adc:	00002517          	auipc	a0,0x2
    80005ae0:	a3c50513          	addi	a0,a0,-1476 # 80007518 <digits+0x48>
    80005ae4:	fffff097          	auipc	ra,0xfffff
    80005ae8:	018080e7          	jalr	24(ra) # 80004afc <panic>
    80005aec:	00002517          	auipc	a0,0x2
    80005af0:	a1450513          	addi	a0,a0,-1516 # 80007500 <digits+0x30>
    80005af4:	fffff097          	auipc	ra,0xfffff
    80005af8:	008080e7          	jalr	8(ra) # 80004afc <panic>

0000000080005afc <push_on>:
    80005afc:	fe010113          	addi	sp,sp,-32
    80005b00:	00813823          	sd	s0,16(sp)
    80005b04:	00113c23          	sd	ra,24(sp)
    80005b08:	00913423          	sd	s1,8(sp)
    80005b0c:	02010413          	addi	s0,sp,32
    80005b10:	100024f3          	csrr	s1,sstatus
    80005b14:	100027f3          	csrr	a5,sstatus
    80005b18:	0027e793          	ori	a5,a5,2
    80005b1c:	10079073          	csrw	sstatus,a5
    80005b20:	ffffe097          	auipc	ra,0xffffe
    80005b24:	61c080e7          	jalr	1564(ra) # 8000413c <mycpu>
    80005b28:	07852783          	lw	a5,120(a0)
    80005b2c:	02078663          	beqz	a5,80005b58 <push_on+0x5c>
    80005b30:	ffffe097          	auipc	ra,0xffffe
    80005b34:	60c080e7          	jalr	1548(ra) # 8000413c <mycpu>
    80005b38:	07852783          	lw	a5,120(a0)
    80005b3c:	01813083          	ld	ra,24(sp)
    80005b40:	01013403          	ld	s0,16(sp)
    80005b44:	0017879b          	addiw	a5,a5,1
    80005b48:	06f52c23          	sw	a5,120(a0)
    80005b4c:	00813483          	ld	s1,8(sp)
    80005b50:	02010113          	addi	sp,sp,32
    80005b54:	00008067          	ret
    80005b58:	0014d493          	srli	s1,s1,0x1
    80005b5c:	ffffe097          	auipc	ra,0xffffe
    80005b60:	5e0080e7          	jalr	1504(ra) # 8000413c <mycpu>
    80005b64:	0014f493          	andi	s1,s1,1
    80005b68:	06952e23          	sw	s1,124(a0)
    80005b6c:	fc5ff06f          	j	80005b30 <push_on+0x34>

0000000080005b70 <pop_on>:
    80005b70:	ff010113          	addi	sp,sp,-16
    80005b74:	00813023          	sd	s0,0(sp)
    80005b78:	00113423          	sd	ra,8(sp)
    80005b7c:	01010413          	addi	s0,sp,16
    80005b80:	ffffe097          	auipc	ra,0xffffe
    80005b84:	5bc080e7          	jalr	1468(ra) # 8000413c <mycpu>
    80005b88:	100027f3          	csrr	a5,sstatus
    80005b8c:	0027f793          	andi	a5,a5,2
    80005b90:	04078463          	beqz	a5,80005bd8 <pop_on+0x68>
    80005b94:	07852783          	lw	a5,120(a0)
    80005b98:	02f05863          	blez	a5,80005bc8 <pop_on+0x58>
    80005b9c:	fff7879b          	addiw	a5,a5,-1
    80005ba0:	06f52c23          	sw	a5,120(a0)
    80005ba4:	07853783          	ld	a5,120(a0)
    80005ba8:	00079863          	bnez	a5,80005bb8 <pop_on+0x48>
    80005bac:	100027f3          	csrr	a5,sstatus
    80005bb0:	ffd7f793          	andi	a5,a5,-3
    80005bb4:	10079073          	csrw	sstatus,a5
    80005bb8:	00813083          	ld	ra,8(sp)
    80005bbc:	00013403          	ld	s0,0(sp)
    80005bc0:	01010113          	addi	sp,sp,16
    80005bc4:	00008067          	ret
    80005bc8:	00002517          	auipc	a0,0x2
    80005bcc:	97850513          	addi	a0,a0,-1672 # 80007540 <digits+0x70>
    80005bd0:	fffff097          	auipc	ra,0xfffff
    80005bd4:	f2c080e7          	jalr	-212(ra) # 80004afc <panic>
    80005bd8:	00002517          	auipc	a0,0x2
    80005bdc:	94850513          	addi	a0,a0,-1720 # 80007520 <digits+0x50>
    80005be0:	fffff097          	auipc	ra,0xfffff
    80005be4:	f1c080e7          	jalr	-228(ra) # 80004afc <panic>

0000000080005be8 <__memset>:
    80005be8:	ff010113          	addi	sp,sp,-16
    80005bec:	00813423          	sd	s0,8(sp)
    80005bf0:	01010413          	addi	s0,sp,16
    80005bf4:	1a060e63          	beqz	a2,80005db0 <__memset+0x1c8>
    80005bf8:	40a007b3          	neg	a5,a0
    80005bfc:	0077f793          	andi	a5,a5,7
    80005c00:	00778693          	addi	a3,a5,7
    80005c04:	00b00813          	li	a6,11
    80005c08:	0ff5f593          	andi	a1,a1,255
    80005c0c:	fff6071b          	addiw	a4,a2,-1
    80005c10:	1b06e663          	bltu	a3,a6,80005dbc <__memset+0x1d4>
    80005c14:	1cd76463          	bltu	a4,a3,80005ddc <__memset+0x1f4>
    80005c18:	1a078e63          	beqz	a5,80005dd4 <__memset+0x1ec>
    80005c1c:	00b50023          	sb	a1,0(a0)
    80005c20:	00100713          	li	a4,1
    80005c24:	1ae78463          	beq	a5,a4,80005dcc <__memset+0x1e4>
    80005c28:	00b500a3          	sb	a1,1(a0)
    80005c2c:	00200713          	li	a4,2
    80005c30:	1ae78a63          	beq	a5,a4,80005de4 <__memset+0x1fc>
    80005c34:	00b50123          	sb	a1,2(a0)
    80005c38:	00300713          	li	a4,3
    80005c3c:	18e78463          	beq	a5,a4,80005dc4 <__memset+0x1dc>
    80005c40:	00b501a3          	sb	a1,3(a0)
    80005c44:	00400713          	li	a4,4
    80005c48:	1ae78263          	beq	a5,a4,80005dec <__memset+0x204>
    80005c4c:	00b50223          	sb	a1,4(a0)
    80005c50:	00500713          	li	a4,5
    80005c54:	1ae78063          	beq	a5,a4,80005df4 <__memset+0x20c>
    80005c58:	00b502a3          	sb	a1,5(a0)
    80005c5c:	00700713          	li	a4,7
    80005c60:	18e79e63          	bne	a5,a4,80005dfc <__memset+0x214>
    80005c64:	00b50323          	sb	a1,6(a0)
    80005c68:	00700e93          	li	t4,7
    80005c6c:	00859713          	slli	a4,a1,0x8
    80005c70:	00e5e733          	or	a4,a1,a4
    80005c74:	01059e13          	slli	t3,a1,0x10
    80005c78:	01c76e33          	or	t3,a4,t3
    80005c7c:	01859313          	slli	t1,a1,0x18
    80005c80:	006e6333          	or	t1,t3,t1
    80005c84:	02059893          	slli	a7,a1,0x20
    80005c88:	40f60e3b          	subw	t3,a2,a5
    80005c8c:	011368b3          	or	a7,t1,a7
    80005c90:	02859813          	slli	a6,a1,0x28
    80005c94:	0108e833          	or	a6,a7,a6
    80005c98:	03059693          	slli	a3,a1,0x30
    80005c9c:	003e589b          	srliw	a7,t3,0x3
    80005ca0:	00d866b3          	or	a3,a6,a3
    80005ca4:	03859713          	slli	a4,a1,0x38
    80005ca8:	00389813          	slli	a6,a7,0x3
    80005cac:	00f507b3          	add	a5,a0,a5
    80005cb0:	00e6e733          	or	a4,a3,a4
    80005cb4:	000e089b          	sext.w	a7,t3
    80005cb8:	00f806b3          	add	a3,a6,a5
    80005cbc:	00e7b023          	sd	a4,0(a5)
    80005cc0:	00878793          	addi	a5,a5,8
    80005cc4:	fed79ce3          	bne	a5,a3,80005cbc <__memset+0xd4>
    80005cc8:	ff8e7793          	andi	a5,t3,-8
    80005ccc:	0007871b          	sext.w	a4,a5
    80005cd0:	01d787bb          	addw	a5,a5,t4
    80005cd4:	0ce88e63          	beq	a7,a4,80005db0 <__memset+0x1c8>
    80005cd8:	00f50733          	add	a4,a0,a5
    80005cdc:	00b70023          	sb	a1,0(a4)
    80005ce0:	0017871b          	addiw	a4,a5,1
    80005ce4:	0cc77663          	bgeu	a4,a2,80005db0 <__memset+0x1c8>
    80005ce8:	00e50733          	add	a4,a0,a4
    80005cec:	00b70023          	sb	a1,0(a4)
    80005cf0:	0027871b          	addiw	a4,a5,2
    80005cf4:	0ac77e63          	bgeu	a4,a2,80005db0 <__memset+0x1c8>
    80005cf8:	00e50733          	add	a4,a0,a4
    80005cfc:	00b70023          	sb	a1,0(a4)
    80005d00:	0037871b          	addiw	a4,a5,3
    80005d04:	0ac77663          	bgeu	a4,a2,80005db0 <__memset+0x1c8>
    80005d08:	00e50733          	add	a4,a0,a4
    80005d0c:	00b70023          	sb	a1,0(a4)
    80005d10:	0047871b          	addiw	a4,a5,4
    80005d14:	08c77e63          	bgeu	a4,a2,80005db0 <__memset+0x1c8>
    80005d18:	00e50733          	add	a4,a0,a4
    80005d1c:	00b70023          	sb	a1,0(a4)
    80005d20:	0057871b          	addiw	a4,a5,5
    80005d24:	08c77663          	bgeu	a4,a2,80005db0 <__memset+0x1c8>
    80005d28:	00e50733          	add	a4,a0,a4
    80005d2c:	00b70023          	sb	a1,0(a4)
    80005d30:	0067871b          	addiw	a4,a5,6
    80005d34:	06c77e63          	bgeu	a4,a2,80005db0 <__memset+0x1c8>
    80005d38:	00e50733          	add	a4,a0,a4
    80005d3c:	00b70023          	sb	a1,0(a4)
    80005d40:	0077871b          	addiw	a4,a5,7
    80005d44:	06c77663          	bgeu	a4,a2,80005db0 <__memset+0x1c8>
    80005d48:	00e50733          	add	a4,a0,a4
    80005d4c:	00b70023          	sb	a1,0(a4)
    80005d50:	0087871b          	addiw	a4,a5,8
    80005d54:	04c77e63          	bgeu	a4,a2,80005db0 <__memset+0x1c8>
    80005d58:	00e50733          	add	a4,a0,a4
    80005d5c:	00b70023          	sb	a1,0(a4)
    80005d60:	0097871b          	addiw	a4,a5,9
    80005d64:	04c77663          	bgeu	a4,a2,80005db0 <__memset+0x1c8>
    80005d68:	00e50733          	add	a4,a0,a4
    80005d6c:	00b70023          	sb	a1,0(a4)
    80005d70:	00a7871b          	addiw	a4,a5,10
    80005d74:	02c77e63          	bgeu	a4,a2,80005db0 <__memset+0x1c8>
    80005d78:	00e50733          	add	a4,a0,a4
    80005d7c:	00b70023          	sb	a1,0(a4)
    80005d80:	00b7871b          	addiw	a4,a5,11
    80005d84:	02c77663          	bgeu	a4,a2,80005db0 <__memset+0x1c8>
    80005d88:	00e50733          	add	a4,a0,a4
    80005d8c:	00b70023          	sb	a1,0(a4)
    80005d90:	00c7871b          	addiw	a4,a5,12
    80005d94:	00c77e63          	bgeu	a4,a2,80005db0 <__memset+0x1c8>
    80005d98:	00e50733          	add	a4,a0,a4
    80005d9c:	00b70023          	sb	a1,0(a4)
    80005da0:	00d7879b          	addiw	a5,a5,13
    80005da4:	00c7f663          	bgeu	a5,a2,80005db0 <__memset+0x1c8>
    80005da8:	00f507b3          	add	a5,a0,a5
    80005dac:	00b78023          	sb	a1,0(a5)
    80005db0:	00813403          	ld	s0,8(sp)
    80005db4:	01010113          	addi	sp,sp,16
    80005db8:	00008067          	ret
    80005dbc:	00b00693          	li	a3,11
    80005dc0:	e55ff06f          	j	80005c14 <__memset+0x2c>
    80005dc4:	00300e93          	li	t4,3
    80005dc8:	ea5ff06f          	j	80005c6c <__memset+0x84>
    80005dcc:	00100e93          	li	t4,1
    80005dd0:	e9dff06f          	j	80005c6c <__memset+0x84>
    80005dd4:	00000e93          	li	t4,0
    80005dd8:	e95ff06f          	j	80005c6c <__memset+0x84>
    80005ddc:	00000793          	li	a5,0
    80005de0:	ef9ff06f          	j	80005cd8 <__memset+0xf0>
    80005de4:	00200e93          	li	t4,2
    80005de8:	e85ff06f          	j	80005c6c <__memset+0x84>
    80005dec:	00400e93          	li	t4,4
    80005df0:	e7dff06f          	j	80005c6c <__memset+0x84>
    80005df4:	00500e93          	li	t4,5
    80005df8:	e75ff06f          	j	80005c6c <__memset+0x84>
    80005dfc:	00600e93          	li	t4,6
    80005e00:	e6dff06f          	j	80005c6c <__memset+0x84>

0000000080005e04 <__memmove>:
    80005e04:	ff010113          	addi	sp,sp,-16
    80005e08:	00813423          	sd	s0,8(sp)
    80005e0c:	01010413          	addi	s0,sp,16
    80005e10:	0e060863          	beqz	a2,80005f00 <__memmove+0xfc>
    80005e14:	fff6069b          	addiw	a3,a2,-1
    80005e18:	0006881b          	sext.w	a6,a3
    80005e1c:	0ea5e863          	bltu	a1,a0,80005f0c <__memmove+0x108>
    80005e20:	00758713          	addi	a4,a1,7
    80005e24:	00a5e7b3          	or	a5,a1,a0
    80005e28:	40a70733          	sub	a4,a4,a0
    80005e2c:	0077f793          	andi	a5,a5,7
    80005e30:	00f73713          	sltiu	a4,a4,15
    80005e34:	00174713          	xori	a4,a4,1
    80005e38:	0017b793          	seqz	a5,a5
    80005e3c:	00e7f7b3          	and	a5,a5,a4
    80005e40:	10078863          	beqz	a5,80005f50 <__memmove+0x14c>
    80005e44:	00900793          	li	a5,9
    80005e48:	1107f463          	bgeu	a5,a6,80005f50 <__memmove+0x14c>
    80005e4c:	0036581b          	srliw	a6,a2,0x3
    80005e50:	fff8081b          	addiw	a6,a6,-1
    80005e54:	02081813          	slli	a6,a6,0x20
    80005e58:	01d85893          	srli	a7,a6,0x1d
    80005e5c:	00858813          	addi	a6,a1,8
    80005e60:	00058793          	mv	a5,a1
    80005e64:	00050713          	mv	a4,a0
    80005e68:	01088833          	add	a6,a7,a6
    80005e6c:	0007b883          	ld	a7,0(a5)
    80005e70:	00878793          	addi	a5,a5,8
    80005e74:	00870713          	addi	a4,a4,8
    80005e78:	ff173c23          	sd	a7,-8(a4)
    80005e7c:	ff0798e3          	bne	a5,a6,80005e6c <__memmove+0x68>
    80005e80:	ff867713          	andi	a4,a2,-8
    80005e84:	02071793          	slli	a5,a4,0x20
    80005e88:	0207d793          	srli	a5,a5,0x20
    80005e8c:	00f585b3          	add	a1,a1,a5
    80005e90:	40e686bb          	subw	a3,a3,a4
    80005e94:	00f507b3          	add	a5,a0,a5
    80005e98:	06e60463          	beq	a2,a4,80005f00 <__memmove+0xfc>
    80005e9c:	0005c703          	lbu	a4,0(a1)
    80005ea0:	00e78023          	sb	a4,0(a5)
    80005ea4:	04068e63          	beqz	a3,80005f00 <__memmove+0xfc>
    80005ea8:	0015c603          	lbu	a2,1(a1)
    80005eac:	00100713          	li	a4,1
    80005eb0:	00c780a3          	sb	a2,1(a5)
    80005eb4:	04e68663          	beq	a3,a4,80005f00 <__memmove+0xfc>
    80005eb8:	0025c603          	lbu	a2,2(a1)
    80005ebc:	00200713          	li	a4,2
    80005ec0:	00c78123          	sb	a2,2(a5)
    80005ec4:	02e68e63          	beq	a3,a4,80005f00 <__memmove+0xfc>
    80005ec8:	0035c603          	lbu	a2,3(a1)
    80005ecc:	00300713          	li	a4,3
    80005ed0:	00c781a3          	sb	a2,3(a5)
    80005ed4:	02e68663          	beq	a3,a4,80005f00 <__memmove+0xfc>
    80005ed8:	0045c603          	lbu	a2,4(a1)
    80005edc:	00400713          	li	a4,4
    80005ee0:	00c78223          	sb	a2,4(a5)
    80005ee4:	00e68e63          	beq	a3,a4,80005f00 <__memmove+0xfc>
    80005ee8:	0055c603          	lbu	a2,5(a1)
    80005eec:	00500713          	li	a4,5
    80005ef0:	00c782a3          	sb	a2,5(a5)
    80005ef4:	00e68663          	beq	a3,a4,80005f00 <__memmove+0xfc>
    80005ef8:	0065c703          	lbu	a4,6(a1)
    80005efc:	00e78323          	sb	a4,6(a5)
    80005f00:	00813403          	ld	s0,8(sp)
    80005f04:	01010113          	addi	sp,sp,16
    80005f08:	00008067          	ret
    80005f0c:	02061713          	slli	a4,a2,0x20
    80005f10:	02075713          	srli	a4,a4,0x20
    80005f14:	00e587b3          	add	a5,a1,a4
    80005f18:	f0f574e3          	bgeu	a0,a5,80005e20 <__memmove+0x1c>
    80005f1c:	02069613          	slli	a2,a3,0x20
    80005f20:	02065613          	srli	a2,a2,0x20
    80005f24:	fff64613          	not	a2,a2
    80005f28:	00e50733          	add	a4,a0,a4
    80005f2c:	00c78633          	add	a2,a5,a2
    80005f30:	fff7c683          	lbu	a3,-1(a5)
    80005f34:	fff78793          	addi	a5,a5,-1
    80005f38:	fff70713          	addi	a4,a4,-1
    80005f3c:	00d70023          	sb	a3,0(a4)
    80005f40:	fec798e3          	bne	a5,a2,80005f30 <__memmove+0x12c>
    80005f44:	00813403          	ld	s0,8(sp)
    80005f48:	01010113          	addi	sp,sp,16
    80005f4c:	00008067          	ret
    80005f50:	02069713          	slli	a4,a3,0x20
    80005f54:	02075713          	srli	a4,a4,0x20
    80005f58:	00170713          	addi	a4,a4,1
    80005f5c:	00e50733          	add	a4,a0,a4
    80005f60:	00050793          	mv	a5,a0
    80005f64:	0005c683          	lbu	a3,0(a1)
    80005f68:	00178793          	addi	a5,a5,1
    80005f6c:	00158593          	addi	a1,a1,1
    80005f70:	fed78fa3          	sb	a3,-1(a5)
    80005f74:	fee798e3          	bne	a5,a4,80005f64 <__memmove+0x160>
    80005f78:	f89ff06f          	j	80005f00 <__memmove+0xfc>

0000000080005f7c <__putc>:
    80005f7c:	fe010113          	addi	sp,sp,-32
    80005f80:	00813823          	sd	s0,16(sp)
    80005f84:	00113c23          	sd	ra,24(sp)
    80005f88:	02010413          	addi	s0,sp,32
    80005f8c:	00050793          	mv	a5,a0
    80005f90:	fef40593          	addi	a1,s0,-17
    80005f94:	00100613          	li	a2,1
    80005f98:	00000513          	li	a0,0
    80005f9c:	fef407a3          	sb	a5,-17(s0)
    80005fa0:	fffff097          	auipc	ra,0xfffff
    80005fa4:	b3c080e7          	jalr	-1220(ra) # 80004adc <console_write>
    80005fa8:	01813083          	ld	ra,24(sp)
    80005fac:	01013403          	ld	s0,16(sp)
    80005fb0:	02010113          	addi	sp,sp,32
    80005fb4:	00008067          	ret

0000000080005fb8 <__getc>:
    80005fb8:	fe010113          	addi	sp,sp,-32
    80005fbc:	00813823          	sd	s0,16(sp)
    80005fc0:	00113c23          	sd	ra,24(sp)
    80005fc4:	02010413          	addi	s0,sp,32
    80005fc8:	fe840593          	addi	a1,s0,-24
    80005fcc:	00100613          	li	a2,1
    80005fd0:	00000513          	li	a0,0
    80005fd4:	fffff097          	auipc	ra,0xfffff
    80005fd8:	ae8080e7          	jalr	-1304(ra) # 80004abc <console_read>
    80005fdc:	fe844503          	lbu	a0,-24(s0)
    80005fe0:	01813083          	ld	ra,24(sp)
    80005fe4:	01013403          	ld	s0,16(sp)
    80005fe8:	02010113          	addi	sp,sp,32
    80005fec:	00008067          	ret

0000000080005ff0 <console_handler>:
    80005ff0:	fe010113          	addi	sp,sp,-32
    80005ff4:	00813823          	sd	s0,16(sp)
    80005ff8:	00113c23          	sd	ra,24(sp)
    80005ffc:	00913423          	sd	s1,8(sp)
    80006000:	02010413          	addi	s0,sp,32
    80006004:	14202773          	csrr	a4,scause
    80006008:	100027f3          	csrr	a5,sstatus
    8000600c:	0027f793          	andi	a5,a5,2
    80006010:	06079e63          	bnez	a5,8000608c <console_handler+0x9c>
    80006014:	00074c63          	bltz	a4,8000602c <console_handler+0x3c>
    80006018:	01813083          	ld	ra,24(sp)
    8000601c:	01013403          	ld	s0,16(sp)
    80006020:	00813483          	ld	s1,8(sp)
    80006024:	02010113          	addi	sp,sp,32
    80006028:	00008067          	ret
    8000602c:	0ff77713          	andi	a4,a4,255
    80006030:	00900793          	li	a5,9
    80006034:	fef712e3          	bne	a4,a5,80006018 <console_handler+0x28>
    80006038:	ffffe097          	auipc	ra,0xffffe
    8000603c:	6dc080e7          	jalr	1756(ra) # 80004714 <plic_claim>
    80006040:	00a00793          	li	a5,10
    80006044:	00050493          	mv	s1,a0
    80006048:	02f50c63          	beq	a0,a5,80006080 <console_handler+0x90>
    8000604c:	fc0506e3          	beqz	a0,80006018 <console_handler+0x28>
    80006050:	00050593          	mv	a1,a0
    80006054:	00001517          	auipc	a0,0x1
    80006058:	3f450513          	addi	a0,a0,1012 # 80007448 <CONSOLE_STATUS+0x438>
    8000605c:	fffff097          	auipc	ra,0xfffff
    80006060:	afc080e7          	jalr	-1284(ra) # 80004b58 <__printf>
    80006064:	01013403          	ld	s0,16(sp)
    80006068:	01813083          	ld	ra,24(sp)
    8000606c:	00048513          	mv	a0,s1
    80006070:	00813483          	ld	s1,8(sp)
    80006074:	02010113          	addi	sp,sp,32
    80006078:	ffffe317          	auipc	t1,0xffffe
    8000607c:	6d430067          	jr	1748(t1) # 8000474c <plic_complete>
    80006080:	fffff097          	auipc	ra,0xfffff
    80006084:	3e0080e7          	jalr	992(ra) # 80005460 <uartintr>
    80006088:	fddff06f          	j	80006064 <console_handler+0x74>
    8000608c:	00001517          	auipc	a0,0x1
    80006090:	4bc50513          	addi	a0,a0,1212 # 80007548 <digits+0x78>
    80006094:	fffff097          	auipc	ra,0xfffff
    80006098:	a68080e7          	jalr	-1432(ra) # 80004afc <panic>
	...
