
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00009117          	auipc	sp,0x9
    80000004:	20813103          	ld	sp,520(sp) # 80009208 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	641040ef          	jal	ra,80004e5c <start>

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
    8000107c:	374030ef          	jal	ra,800043f0 <exceptionHandler>


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
    80001118:	00008797          	auipc	a5,0x8
    8000111c:	1587b783          	ld	a5,344(a5) # 80009270 <_ZN5Timer8instanceE>
    80001120:	02079463          	bnez	a5,80001148 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80001124:	00008797          	auipc	a5,0x8
    80001128:	1497b623          	sd	s1,332(a5) # 80009270 <_ZN5Timer8instanceE>
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
    80001150:	01500613          	li	a2,21
    80001154:	00007597          	auipc	a1,0x7
    80001158:	edc58593          	addi	a1,a1,-292 # 80008030 <CONSOLE_STATUS+0x20>
    8000115c:	00007517          	auipc	a0,0x7
    80001160:	ee450513          	addi	a0,a0,-284 # 80008040 <CONSOLE_STATUS+0x30>
    80001164:	00001097          	auipc	ra,0x1
    80001168:	9a8080e7          	jalr	-1624(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    8000116c:	fb9ff06f          	j	80001124 <_ZN5TimerC1Ev+0x24>

0000000080001170 <_ZN5TimerD1Ev>:

Timer::~Timer(){
    80001170:	ff010113          	addi	sp,sp,-16
    80001174:	00813423          	sd	s0,8(sp)
    80001178:	01010413          	addi	s0,sp,16
    threadSleepWrapper* current = sleepingHead;
    8000117c:	00053783          	ld	a5,0(a0)
    while(current != 0){
    80001180:	00078663          	beqz	a5,8000118c <_ZN5TimerD1Ev+0x1c>
        threadSleepWrapper* next = current->next;
    80001184:	0107b783          	ld	a5,16(a5)
    while(current != 0){
    80001188:	ff9ff06f          	j	80001180 <_ZN5TimerD1Ev+0x10>
        // mem_free(current);
        current = next;
    }
}
    8000118c:	00813403          	ld	s0,8(sp)
    80001190:	01010113          	addi	sp,sp,16
    80001194:	00008067          	ret

0000000080001198 <_ZN5Timer11getInstanceEv>:

Timer& Timer::getInstance(){
    assert(instance != 0);
    80001198:	00008797          	auipc	a5,0x8
    8000119c:	0d87b783          	ld	a5,216(a5) # 80009270 <_ZN5Timer8instanceE>
    800011a0:	00078863          	beqz	a5,800011b0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800011a4:	00008517          	auipc	a0,0x8
    800011a8:	0cc53503          	ld	a0,204(a0) # 80009270 <_ZN5Timer8instanceE>
    800011ac:	00008067          	ret
Timer& Timer::getInstance(){
    800011b0:	ff010113          	addi	sp,sp,-16
    800011b4:	00113423          	sd	ra,8(sp)
    800011b8:	00813023          	sd	s0,0(sp)
    800011bc:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    800011c0:	00007697          	auipc	a3,0x7
    800011c4:	e9068693          	addi	a3,a3,-368 # 80008050 <CONSOLE_STATUS+0x40>
    800011c8:	02500613          	li	a2,37
    800011cc:	00007597          	auipc	a1,0x7
    800011d0:	e6458593          	addi	a1,a1,-412 # 80008030 <CONSOLE_STATUS+0x20>
    800011d4:	00007517          	auipc	a0,0x7
    800011d8:	ea450513          	addi	a0,a0,-348 # 80008078 <CONSOLE_STATUS+0x68>
    800011dc:	00001097          	auipc	ra,0x1
    800011e0:	930080e7          	jalr	-1744(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
}
    800011e4:	00008517          	auipc	a0,0x8
    800011e8:	08c53503          	ld	a0,140(a0) # 80009270 <_ZN5Timer8instanceE>
    800011ec:	00813083          	ld	ra,8(sp)
    800011f0:	00013403          	ld	s0,0(sp)
    800011f4:	01010113          	addi	sp,sp,16
    800011f8:	00008067          	ret

00000000800011fc <_ZN5Timer4tickEv>:

void Timer::tick(){
    800011fc:	fe010113          	addi	sp,sp,-32
    80001200:	00113c23          	sd	ra,24(sp)
    80001204:	00813823          	sd	s0,16(sp)
    80001208:	00913423          	sd	s1,8(sp)
    8000120c:	01213023          	sd	s2,0(sp)
    80001210:	02010413          	addi	s0,sp,32
    80001214:	00050913          	mv	s2,a0
    time += 1;
    80001218:	00853783          	ld	a5,8(a0)
    8000121c:	00178793          	addi	a5,a5,1
    80001220:	00f53423          	sd	a5,8(a0)
    if(time % 10 == 0){
    80001224:	00a00713          	li	a4,10
    80001228:	02e7f7b3          	remu	a5,a5,a4
    8000122c:	00078663          	beqz	a5,80001238 <_ZN5Timer4tickEv+0x3c>
        __putc('i');
        __putc('c');
        __putc('k');
        __putc('\n');
    }
    threadSleepWrapper* current = sleepingHead;
    80001230:	00093483          	ld	s1,0(s2)
    80001234:	0580006f          	j	8000128c <_ZN5Timer4tickEv+0x90>
        __putc('\n');
    80001238:	00a00513          	li	a0,10
    8000123c:	00006097          	auipc	ra,0x6
    80001240:	ce0080e7          	jalr	-800(ra) # 80006f1c <__putc>
        __putc('t');
    80001244:	07400513          	li	a0,116
    80001248:	00006097          	auipc	ra,0x6
    8000124c:	cd4080e7          	jalr	-812(ra) # 80006f1c <__putc>
        __putc('i');
    80001250:	06900513          	li	a0,105
    80001254:	00006097          	auipc	ra,0x6
    80001258:	cc8080e7          	jalr	-824(ra) # 80006f1c <__putc>
        __putc('c');
    8000125c:	06300513          	li	a0,99
    80001260:	00006097          	auipc	ra,0x6
    80001264:	cbc080e7          	jalr	-836(ra) # 80006f1c <__putc>
        __putc('k');
    80001268:	06b00513          	li	a0,107
    8000126c:	00006097          	auipc	ra,0x6
    80001270:	cb0080e7          	jalr	-848(ra) # 80006f1c <__putc>
        __putc('\n');
    80001274:	00a00513          	li	a0,10
    80001278:	00006097          	auipc	ra,0x6
    8000127c:	ca4080e7          	jalr	-860(ra) # 80006f1c <__putc>
    80001280:	fb1ff06f          	j	80001230 <_ZN5Timer4tickEv+0x34>
        if(current->wakeUpTime <= time){
            current->thread->setSleeping(false);
            Scheduler::put(current->thread);
            threadSleepWrapper* next = current->next;
            if(current == sleepingHead){
                sleepingHead = next;
    80001284:	00f93023          	sd	a5,0(s2)
void Timer::tick(){
    80001288:	00078493          	mv	s1,a5
    while(current != 0){
    8000128c:	02048e63          	beqz	s1,800012c8 <_ZN5Timer4tickEv+0xcc>
        if(current->wakeUpTime <= time){
    80001290:	0084b703          	ld	a4,8(s1)
    80001294:	00893783          	ld	a5,8(s2)
    80001298:	02e7e863          	bltu	a5,a4,800012c8 <_ZN5Timer4tickEv+0xcc>
            current->thread->setSleeping(false);
    8000129c:	00000593          	li	a1,0
    800012a0:	0004b503          	ld	a0,0(s1)
    800012a4:	00002097          	auipc	ra,0x2
    800012a8:	cb0080e7          	jalr	-848(ra) # 80002f54 <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    800012ac:	0004b503          	ld	a0,0(s1)
    800012b0:	00004097          	auipc	ra,0x4
    800012b4:	834080e7          	jalr	-1996(ra) # 80004ae4 <_ZN9Scheduler3putEP7_thread>
            threadSleepWrapper* next = current->next;
    800012b8:	0104b783          	ld	a5,16(s1)
            if(current == sleepingHead){
    800012bc:	00093703          	ld	a4,0(s2)
    800012c0:	fc9714e3          	bne	a4,s1,80001288 <_ZN5Timer4tickEv+0x8c>
    800012c4:	fc1ff06f          	j	80001284 <_ZN5Timer4tickEv+0x88>
            current = next;
        }else{
            break;
        }
    }
}
    800012c8:	01813083          	ld	ra,24(sp)
    800012cc:	01013403          	ld	s0,16(sp)
    800012d0:	00813483          	ld	s1,8(sp)
    800012d4:	00013903          	ld	s2,0(sp)
    800012d8:	02010113          	addi	sp,sp,32
    800012dc:	00008067          	ret

00000000800012e0 <_ZN5Timer5sleepEm>:

int Timer::sleep(time_t timeToSleep){
    800012e0:	fd010113          	addi	sp,sp,-48
    800012e4:	02113423          	sd	ra,40(sp)
    800012e8:	02813023          	sd	s0,32(sp)
    800012ec:	00913c23          	sd	s1,24(sp)
    800012f0:	01213823          	sd	s2,16(sp)
    800012f4:	01313423          	sd	s3,8(sp)
    800012f8:	03010413          	addi	s0,sp,48
    800012fc:	00050493          	mv	s1,a0
    80001300:	00058913          	mv	s2,a1
    thread_t thread = _thread::currentThread;
    80001304:	00008797          	auipc	a5,0x8
    80001308:	f1c7b783          	ld	a5,-228(a5) # 80009220 <_GLOBAL_OFFSET_TABLE_+0x38>
    8000130c:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)mem_alloc(sizeof(threadSleepWrapper));
    80001310:	01800513          	li	a0,24
    80001314:	00000097          	auipc	ra,0x0
    80001318:	0a0080e7          	jalr	160(ra) # 800013b4 <_Z9mem_allocm>
    newSleepingThread->thread = thread;
    8000131c:	01353023          	sd	s3,0(a0)
    newSleepingThread->wakeUpTime = time + timeToSleep;
    80001320:	0084b783          	ld	a5,8(s1)
    80001324:	012785b3          	add	a1,a5,s2
    80001328:	00b53423          	sd	a1,8(a0)
    newSleepingThread->next = 0;
    8000132c:	00053823          	sd	zero,16(a0)

    if(sleepingHead == 0){
    80001330:	0004b783          	ld	a5,0(s1)
    80001334:	04078c63          	beqz	a5,8000138c <_ZN5Timer5sleepEm+0xac>
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
    80001338:	00078693          	mv	a3,a5
    8000133c:	0107b783          	ld	a5,16(a5)
    80001340:	00078663          	beqz	a5,8000134c <_ZN5Timer5sleepEm+0x6c>
    80001344:	0087b703          	ld	a4,8(a5)
    80001348:	feb768e3          	bltu	a4,a1,80001338 <_ZN5Timer5sleepEm+0x58>
            current = current->next;
        }
        newSleepingThread->next = current->next;
    8000134c:	00f53823          	sd	a5,16(a0)
        current->next = newSleepingThread;
    80001350:	00a6b823          	sd	a0,16(a3)
    }
    thread->setSleeping(true);
    80001354:	00100593          	li	a1,1
    80001358:	00098513          	mv	a0,s3
    8000135c:	00002097          	auipc	ra,0x2
    80001360:	bf8080e7          	jalr	-1032(ra) # 80002f54 <_ZN7_thread11setSleepingEb>
    thread_dispatch();
    80001364:	00000097          	auipc	ra,0x0
    80001368:	148080e7          	jalr	328(ra) # 800014ac <_Z15thread_dispatchv>
    return 0;
}
    8000136c:	00000513          	li	a0,0
    80001370:	02813083          	ld	ra,40(sp)
    80001374:	02013403          	ld	s0,32(sp)
    80001378:	01813483          	ld	s1,24(sp)
    8000137c:	01013903          	ld	s2,16(sp)
    80001380:	00813983          	ld	s3,8(sp)
    80001384:	03010113          	addi	sp,sp,48
    80001388:	00008067          	ret
        sleepingHead = newSleepingThread;
    8000138c:	00a4b023          	sd	a0,0(s1)
    80001390:	fc5ff06f          	j	80001354 <_ZN5Timer5sleepEm+0x74>

0000000080001394 <_ZN5Timer17noSleepingThreadsEv>:

bool Timer::noSleepingThreads(){
    80001394:	ff010113          	addi	sp,sp,-16
    80001398:	00813423          	sd	s0,8(sp)
    8000139c:	01010413          	addi	s0,sp,16
    return sleepingHead == 0;
    800013a0:	00053503          	ld	a0,0(a0)
    800013a4:	00153513          	seqz	a0,a0
    800013a8:	00813403          	ld	s0,8(sp)
    800013ac:	01010113          	addi	sp,sp,16
    800013b0:	00008067          	ret

00000000800013b4 <_Z9mem_allocm>:
 */

#include "syscalls_c.h"
#include "console.h"

void* mem_alloc ( size_t nSize ){
    800013b4:	ff010113          	addi	sp,sp,-16
    800013b8:	00813423          	sd	s0,8(sp)
    800013bc:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    800013c0:	03f50513          	addi	a0,a0,63
    800013c4:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    800013c8:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    800013cc:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    800013d0:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    800013d4:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    800013d8:	00813403          	ld	s0,8(sp)
    800013dc:	01010113          	addi	sp,sp,16
    800013e0:	00008067          	ret

00000000800013e4 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    800013e4:	ff010113          	addi	sp,sp,-16
    800013e8:	00813423          	sd	s0,8(sp)
    800013ec:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    800013f0:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    800013f4:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    800013f8:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    800013fc:	00050513          	mv	a0,a0
    return nResult;

}
    80001400:	0005051b          	sext.w	a0,a0
    80001404:	00813403          	ld	s0,8(sp)
    80001408:	01010113          	addi	sp,sp,16
    8000140c:	00008067          	ret

0000000080001410 <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg ) {
    80001410:	fd010113          	addi	sp,sp,-48
    80001414:	02113423          	sd	ra,40(sp)
    80001418:	02813023          	sd	s0,32(sp)
    8000141c:	00913c23          	sd	s1,24(sp)
    80001420:	01213823          	sd	s2,16(sp)
    80001424:	01313423          	sd	s3,8(sp)
    80001428:	03010413          	addi	s0,sp,48
    8000142c:	00050493          	mv	s1,a0
    80001430:	00058913          	mv	s2,a1
    80001434:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80001438:	00001537          	lui	a0,0x1
    8000143c:	00000097          	auipc	ra,0x0
    80001440:	f78080e7          	jalr	-136(ra) # 800013b4 <_Z9mem_allocm>
    /// now we move the pointer up, since SP points to the first free location, and grows down
    __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space + DEFAULT_STACK_SIZE));
    80001444:	000017b7          	lui	a5,0x1
    80001448:	00f50533          	add	a0,a0,a5
    8000144c:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    80001450:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    80001454:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    80001458:	00048593          	mv	a1,s1
    __asm__ volatile("li a0,0x11");
    8000145c:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    80001460:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001464:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001468:	0005051b          	sext.w	a0,a0
    8000146c:	02813083          	ld	ra,40(sp)
    80001470:	02013403          	ld	s0,32(sp)
    80001474:	01813483          	ld	s1,24(sp)
    80001478:	01013903          	ld	s2,16(sp)
    8000147c:	00813983          	ld	s3,8(sp)
    80001480:	03010113          	addi	sp,sp,48
    80001484:	00008067          	ret

0000000080001488 <_Z11thread_exitv>:

// int thread_createCPP ( thread_t*, void(*)(void*), void* );

int thread_exit (){
    80001488:	ff010113          	addi	sp,sp,-16
    8000148c:	00813423          	sd	s0,8(sp)
    80001490:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    80001494:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80001498:	00000073          	ecall
    return 0;
}
    8000149c:	00000513          	li	a0,0
    800014a0:	00813403          	ld	s0,8(sp)
    800014a4:	01010113          	addi	sp,sp,16
    800014a8:	00008067          	ret

00000000800014ac <_Z15thread_dispatchv>:

void thread_dispatch () {
    800014ac:	ff010113          	addi	sp,sp,-16
    800014b0:	00813423          	sd	s0,8(sp)
    800014b4:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    800014b8:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    800014bc:	00000073          	ecall
}
    800014c0:	00813403          	ld	s0,8(sp)
    800014c4:	01010113          	addi	sp,sp,16
    800014c8:	00008067          	ret

00000000800014cc <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    800014cc:	ff010113          	addi	sp,sp,-16
    800014d0:	00813423          	sd	s0,8(sp)
    800014d4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    800014d8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    800014dc:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    800014e0:	00000073          	ecall
}
    800014e4:	00813403          	ld	s0,8(sp)
    800014e8:	01010113          	addi	sp,sp,16
    800014ec:	00008067          	ret

00000000800014f0 <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    800014f0:	ff010113          	addi	sp,sp,-16
    800014f4:	00813423          	sd	s0,8(sp)
    800014f8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    800014fc:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    80001500:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001504:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001508:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    8000150c:	0005051b          	sext.w	a0,a0
    80001510:	00813403          	ld	s0,8(sp)
    80001514:	01010113          	addi	sp,sp,16
    80001518:	00008067          	ret

000000008000151c <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    8000151c:	ff010113          	addi	sp,sp,-16
    80001520:	00813423          	sd	s0,8(sp)
    80001524:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    80001528:	02059593          	slli	a1,a1,0x20
    8000152c:	0205d593          	srli	a1,a1,0x20
    80001530:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    80001534:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    80001538:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    8000153c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001540:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001544:	0005051b          	sext.w	a0,a0
    80001548:	00813403          	ld	s0,8(sp)
    8000154c:	01010113          	addi	sp,sp,16
    80001550:	00008067          	ret

0000000080001554 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    80001554:	ff010113          	addi	sp,sp,-16
    80001558:	00813423          	sd	s0,8(sp)
    8000155c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001560:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    80001564:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    80001568:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    8000156c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001570:	0005051b          	sext.w	a0,a0
    80001574:	00813403          	ld	s0,8(sp)
    80001578:	01010113          	addi	sp,sp,16
    8000157c:	00008067          	ret

0000000080001580 <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    80001580:	ff010113          	addi	sp,sp,-16
    80001584:	00813423          	sd	s0,8(sp)
    80001588:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    8000158c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    80001590:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001594:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001598:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    8000159c:	0005051b          	sext.w	a0,a0
    800015a0:	00813403          	ld	s0,8(sp)
    800015a4:	01010113          	addi	sp,sp,16
    800015a8:	00008067          	ret

00000000800015ac <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    800015ac:	ff010113          	addi	sp,sp,-16
    800015b0:	00813423          	sd	s0,8(sp)
    800015b4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800015b8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    800015bc:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    800015c0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800015c4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800015c8:	0005051b          	sext.w	a0,a0
    800015cc:	00813403          	ld	s0,8(sp)
    800015d0:	01010113          	addi	sp,sp,16
    800015d4:	00008067          	ret

00000000800015d8 <_Z4getcv>:

char getc() {
    800015d8:	ff010113          	addi	sp,sp,-16
    800015dc:	00813423          	sd	s0,8(sp)
    800015e0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    800015e4:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    800015e8:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    800015ec:	00050513          	mv	a0,a0
    return chr;
}
    800015f0:	0ff57513          	andi	a0,a0,255
    800015f4:	00813403          	ld	s0,8(sp)
    800015f8:	01010113          	addi	sp,sp,16
    800015fc:	00008067          	ret

0000000080001600 <_Z4putcc>:

#include "console.h"

void putc(char chr ) {
    80001600:	ff010113          	addi	sp,sp,-16
    80001604:	00813423          	sd	s0,8(sp)
    80001608:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    8000160c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    80001610:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80001614:	00000073          	ecall
    80001618:	00813403          	ld	s0,8(sp)
    8000161c:	01010113          	addi	sp,sp,16
    80001620:	00008067          	ret

0000000080001624 <_ZN4_sem4openEPPS_j>:
#include "syscalls_c.h"
#include "assert.h"
#include "sched.h"
#include "console.h"

void _sem::open(_sem** handle, unsigned init){
    80001624:	fe010113          	addi	sp,sp,-32
    80001628:	00113c23          	sd	ra,24(sp)
    8000162c:	00813823          	sd	s0,16(sp)
    80001630:	00913423          	sd	s1,8(sp)
    80001634:	01213023          	sd	s2,0(sp)
    80001638:	02010413          	addi	s0,sp,32
    8000163c:	00050493          	mv	s1,a0
    80001640:	00058913          	mv	s2,a1
    (*handle) = (sem_t)mem_alloc(sizeof(_sem));
    80001644:	01800513          	li	a0,24
    80001648:	00000097          	auipc	ra,0x0
    8000164c:	d6c080e7          	jalr	-660(ra) # 800013b4 <_Z9mem_allocm>
    80001650:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    80001654:	00053023          	sd	zero,0(a0) # 1000 <_entry-0x7ffff000>
    (*handle)->blockTail = 0;
    80001658:	0004b783          	ld	a5,0(s1)
    8000165c:	0007b423          	sd	zero,8(a5) # 1008 <_entry-0x7fffeff8>
    (*handle)->value = init;
    80001660:	0004b783          	ld	a5,0(s1)
    80001664:	0127a823          	sw	s2,16(a5)
}
    80001668:	01813083          	ld	ra,24(sp)
    8000166c:	01013403          	ld	s0,16(sp)
    80001670:	00813483          	ld	s1,8(sp)
    80001674:	00013903          	ld	s2,0(sp)
    80001678:	02010113          	addi	sp,sp,32
    8000167c:	00008067          	ret

0000000080001680 <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    80001680:	fe010113          	addi	sp,sp,-32
    80001684:	00113c23          	sd	ra,24(sp)
    80001688:	00813823          	sd	s0,16(sp)
    8000168c:	00913423          	sd	s1,8(sp)
    80001690:	02010413          	addi	s0,sp,32
    80001694:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    80001698:	0004b783          	ld	a5,0(s1)
    8000169c:	02078263          	beqz	a5,800016c0 <_ZN4_sem5closeEPS_+0x40>
        id->blockHead->pThread->setClosed(true);
    800016a0:	00100593          	li	a1,1
    800016a4:	0007b503          	ld	a0,0(a5)
    800016a8:	00002097          	auipc	ra,0x2
    800016ac:	880080e7          	jalr	-1920(ra) # 80002f28 <_ZN7_thread9setClosedEb>
        // mem_free(id->blockHead);
        id->blockHead = id->blockHead->pNext;
    800016b0:	0004b783          	ld	a5,0(s1)
    800016b4:	0087b783          	ld	a5,8(a5)
    800016b8:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    800016bc:	fddff06f          	j	80001698 <_ZN4_sem5closeEPS_+0x18>
    }
}
    800016c0:	01813083          	ld	ra,24(sp)
    800016c4:	01013403          	ld	s0,16(sp)
    800016c8:	00813483          	ld	s1,8(sp)
    800016cc:	02010113          	addi	sp,sp,32
    800016d0:	00008067          	ret

00000000800016d4 <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    800016d4:	01052783          	lw	a5,16(a0)
    800016d8:	fff7879b          	addiw	a5,a5,-1
    800016dc:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    800016e0:	02079713          	slli	a4,a5,0x20
    800016e4:	00074463          	bltz	a4,800016ec <_ZN4_sem4waitEPS_+0x18>
    800016e8:	00008067          	ret
void _sem::wait(sem_t id){
    800016ec:	fe010113          	addi	sp,sp,-32
    800016f0:	00113c23          	sd	ra,24(sp)
    800016f4:	00813823          	sd	s0,16(sp)
    800016f8:	00913423          	sd	s1,8(sp)
    800016fc:	02010413          	addi	s0,sp,32
    80001700:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    80001704:	01000513          	li	a0,16
    80001708:	00000097          	auipc	ra,0x0
    8000170c:	cac080e7          	jalr	-852(ra) # 800013b4 <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    80001710:	00008797          	auipc	a5,0x8
    80001714:	b107b783          	ld	a5,-1264(a5) # 80009220 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001718:	0007b783          	ld	a5,0(a5)
    8000171c:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    80001720:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    80001724:	0004b783          	ld	a5,0(s1)
    80001728:	04078263          	beqz	a5,8000176c <_ZN4_sem4waitEPS_+0x98>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    8000172c:	0084b783          	ld	a5,8(s1)
    80001730:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    80001734:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    80001738:	00100593          	li	a1,1
    8000173c:	00008797          	auipc	a5,0x8
    80001740:	ae47b783          	ld	a5,-1308(a5) # 80009220 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001744:	0007b503          	ld	a0,0(a5)
    80001748:	00001097          	auipc	ra,0x1
    8000174c:	7b0080e7          	jalr	1968(ra) # 80002ef8 <_ZN7_thread10setBlockedEb>
        thread_dispatch();
    80001750:	00000097          	auipc	ra,0x0
    80001754:	d5c080e7          	jalr	-676(ra) # 800014ac <_Z15thread_dispatchv>
    }
}
    80001758:	01813083          	ld	ra,24(sp)
    8000175c:	01013403          	ld	s0,16(sp)
    80001760:	00813483          	ld	s1,8(sp)
    80001764:	02010113          	addi	sp,sp,32
    80001768:	00008067          	ret
            id->blockHead = pNewBlock;
    8000176c:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    80001770:	00a4b423          	sd	a0,8(s1)
    80001774:	fc5ff06f          	j	80001738 <_ZN4_sem4waitEPS_+0x64>

0000000080001778 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    80001778:	01052783          	lw	a5,16(a0)
    8000177c:	0017879b          	addiw	a5,a5,1
    80001780:	0007871b          	sext.w	a4,a5
    80001784:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    80001788:	00e05463          	blez	a4,80001790 <_ZN4_sem6signalEPS_+0x18>
    8000178c:	00008067          	ret
void _sem::signal(sem_t id){
    80001790:	fe010113          	addi	sp,sp,-32
    80001794:	00113c23          	sd	ra,24(sp)
    80001798:	00813823          	sd	s0,16(sp)
    8000179c:	00913423          	sd	s1,8(sp)
    800017a0:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    800017a4:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    800017a8:	0084b783          	ld	a5,8(s1)
    800017ac:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    800017b0:	02078a63          	beqz	a5,800017e4 <_ZN4_sem6signalEPS_+0x6c>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    800017b4:	00000593          	li	a1,0
    800017b8:	0004b503          	ld	a0,0(s1)
    800017bc:	00001097          	auipc	ra,0x1
    800017c0:	73c080e7          	jalr	1852(ra) # 80002ef8 <_ZN7_thread10setBlockedEb>
        // mem_free(pUnblock);
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    800017c4:	0004b503          	ld	a0,0(s1)
    800017c8:	00003097          	auipc	ra,0x3
    800017cc:	31c080e7          	jalr	796(ra) # 80004ae4 <_ZN9Scheduler3putEP7_thread>
    }
    800017d0:	01813083          	ld	ra,24(sp)
    800017d4:	01013403          	ld	s0,16(sp)
    800017d8:	00813483          	ld	s1,8(sp)
    800017dc:	02010113          	addi	sp,sp,32
    800017e0:	00008067          	ret
            id->blockTail = 0;
    800017e4:	00053423          	sd	zero,8(a0)
    800017e8:	fcdff06f          	j	800017b4 <_ZN4_sem6signalEPS_+0x3c>

00000000800017ec <main>:
#include "kernel.h"
#include "assert.h"
#include "syscalls_c.h"

/// @brief first function to be called
void main(){
    800017ec:	fb010113          	addi	sp,sp,-80
    800017f0:	04113423          	sd	ra,72(sp)
    800017f4:	04813023          	sd	s0,64(sp)
    800017f8:	02913c23          	sd	s1,56(sp)
    800017fc:	05010413          	addi	s0,sp,80
    Kernel kernel = Kernel();
    80001800:	fb840493          	addi	s1,s0,-72
    80001804:	00048513          	mv	a0,s1
    80001808:	00000097          	auipc	ra,0x0
    8000180c:	7bc080e7          	jalr	1980(ra) # 80001fc4 <_ZN6KernelC1Ev>
    kernel.initialise();
    80001810:	00048513          	mv	a0,s1
    80001814:	00001097          	auipc	ra,0x1
    80001818:	824080e7          	jalr	-2012(ra) # 80002038 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    8000181c:	00048513          	mv	a0,s1
    80001820:	00001097          	auipc	ra,0x1
    80001824:	91c080e7          	jalr	-1764(ra) # 8000213c <_ZN6Kernel3runEv>
    80001828:	00050493          	mv	s1,a0
    putc('\n');
    8000182c:	00a00513          	li	a0,10
    80001830:	00000097          	auipc	ra,0x0
    80001834:	dd0080e7          	jalr	-560(ra) # 80001600 <_Z4putcc>
    putc('\n');
    80001838:	00a00513          	li	a0,10
    8000183c:	00000097          	auipc	ra,0x0
    80001840:	dc4080e7          	jalr	-572(ra) # 80001600 <_Z4putcc>
    putc('-');
    80001844:	02d00513          	li	a0,45
    80001848:	00000097          	auipc	ra,0x0
    8000184c:	db8080e7          	jalr	-584(ra) # 80001600 <_Z4putcc>
    putc('-');
    80001850:	02d00513          	li	a0,45
    80001854:	00000097          	auipc	ra,0x0
    80001858:	dac080e7          	jalr	-596(ra) # 80001600 <_Z4putcc>
    putc('-');
    8000185c:	02d00513          	li	a0,45
    80001860:	00000097          	auipc	ra,0x0
    80001864:	da0080e7          	jalr	-608(ra) # 80001600 <_Z4putcc>
    putc('-');
    80001868:	02d00513          	li	a0,45
    8000186c:	00000097          	auipc	ra,0x0
    80001870:	d94080e7          	jalr	-620(ra) # 80001600 <_Z4putcc>
    putc('-');
    80001874:	02d00513          	li	a0,45
    80001878:	00000097          	auipc	ra,0x0
    8000187c:	d88080e7          	jalr	-632(ra) # 80001600 <_Z4putcc>
    putc('-');
    80001880:	02d00513          	li	a0,45
    80001884:	00000097          	auipc	ra,0x0
    80001888:	d7c080e7          	jalr	-644(ra) # 80001600 <_Z4putcc>
    putc('-');
    8000188c:	02d00513          	li	a0,45
    80001890:	00000097          	auipc	ra,0x0
    80001894:	d70080e7          	jalr	-656(ra) # 80001600 <_Z4putcc>
    putc('-');
    80001898:	02d00513          	li	a0,45
    8000189c:	00000097          	auipc	ra,0x0
    800018a0:	d64080e7          	jalr	-668(ra) # 80001600 <_Z4putcc>
    putc('-');
    800018a4:	02d00513          	li	a0,45
    800018a8:	00000097          	auipc	ra,0x0
    800018ac:	d58080e7          	jalr	-680(ra) # 80001600 <_Z4putcc>
    putc('-');
    800018b0:	02d00513          	li	a0,45
    800018b4:	00000097          	auipc	ra,0x0
    800018b8:	d4c080e7          	jalr	-692(ra) # 80001600 <_Z4putcc>
    putc('-');
    800018bc:	02d00513          	li	a0,45
    800018c0:	00000097          	auipc	ra,0x0
    800018c4:	d40080e7          	jalr	-704(ra) # 80001600 <_Z4putcc>
    putc('-');
    800018c8:	02d00513          	li	a0,45
    800018cc:	00000097          	auipc	ra,0x0
    800018d0:	d34080e7          	jalr	-716(ra) # 80001600 <_Z4putcc>
    putc('-');
    800018d4:	02d00513          	li	a0,45
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	d28080e7          	jalr	-728(ra) # 80001600 <_Z4putcc>
    putc('-');
    800018e0:	02d00513          	li	a0,45
    800018e4:	00000097          	auipc	ra,0x0
    800018e8:	d1c080e7          	jalr	-740(ra) # 80001600 <_Z4putcc>
    putc('-');
    800018ec:	02d00513          	li	a0,45
    800018f0:	00000097          	auipc	ra,0x0
    800018f4:	d10080e7          	jalr	-752(ra) # 80001600 <_Z4putcc>
    putc('-');
    800018f8:	02d00513          	li	a0,45
    800018fc:	00000097          	auipc	ra,0x0
    80001900:	d04080e7          	jalr	-764(ra) # 80001600 <_Z4putcc>
    putc('-');
    80001904:	02d00513          	li	a0,45
    80001908:	00000097          	auipc	ra,0x0
    8000190c:	cf8080e7          	jalr	-776(ra) # 80001600 <_Z4putcc>
    putc('-');
    80001910:	02d00513          	li	a0,45
    80001914:	00000097          	auipc	ra,0x0
    80001918:	cec080e7          	jalr	-788(ra) # 80001600 <_Z4putcc>
    putc('-');
    8000191c:	02d00513          	li	a0,45
    80001920:	00000097          	auipc	ra,0x0
    80001924:	ce0080e7          	jalr	-800(ra) # 80001600 <_Z4putcc>
    putc('-');
    80001928:	02d00513          	li	a0,45
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	cd4080e7          	jalr	-812(ra) # 80001600 <_Z4putcc>
    putc('K');
    80001934:	04b00513          	li	a0,75
    80001938:	00000097          	auipc	ra,0x0
    8000193c:	cc8080e7          	jalr	-824(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001940:	06500513          	li	a0,101
    80001944:	00000097          	auipc	ra,0x0
    80001948:	cbc080e7          	jalr	-836(ra) # 80001600 <_Z4putcc>
    putc('r');
    8000194c:	07200513          	li	a0,114
    80001950:	00000097          	auipc	ra,0x0
    80001954:	cb0080e7          	jalr	-848(ra) # 80001600 <_Z4putcc>
    putc('n');
    80001958:	06e00513          	li	a0,110
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	ca4080e7          	jalr	-860(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001964:	06500513          	li	a0,101
    80001968:	00000097          	auipc	ra,0x0
    8000196c:	c98080e7          	jalr	-872(ra) # 80001600 <_Z4putcc>
    putc('l');
    80001970:	06c00513          	li	a0,108
    80001974:	00000097          	auipc	ra,0x0
    80001978:	c8c080e7          	jalr	-884(ra) # 80001600 <_Z4putcc>
    putc(' ');
    8000197c:	02000513          	li	a0,32
    80001980:	00000097          	auipc	ra,0x0
    80001984:	c80080e7          	jalr	-896(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001988:	06500513          	li	a0,101
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	c74080e7          	jalr	-908(ra) # 80001600 <_Z4putcc>
    putc('x');
    80001994:	07800513          	li	a0,120
    80001998:	00000097          	auipc	ra,0x0
    8000199c:	c68080e7          	jalr	-920(ra) # 80001600 <_Z4putcc>
    putc('i');
    800019a0:	06900513          	li	a0,105
    800019a4:	00000097          	auipc	ra,0x0
    800019a8:	c5c080e7          	jalr	-932(ra) # 80001600 <_Z4putcc>
    putc('t');
    800019ac:	07400513          	li	a0,116
    800019b0:	00000097          	auipc	ra,0x0
    800019b4:	c50080e7          	jalr	-944(ra) # 80001600 <_Z4putcc>
    putc('e');
    800019b8:	06500513          	li	a0,101
    800019bc:	00000097          	auipc	ra,0x0
    800019c0:	c44080e7          	jalr	-956(ra) # 80001600 <_Z4putcc>
    putc('d');
    800019c4:	06400513          	li	a0,100
    800019c8:	00000097          	auipc	ra,0x0
    800019cc:	c38080e7          	jalr	-968(ra) # 80001600 <_Z4putcc>
    putc(' ');
    800019d0:	02000513          	li	a0,32
    800019d4:	00000097          	auipc	ra,0x0
    800019d8:	c2c080e7          	jalr	-980(ra) # 80001600 <_Z4putcc>
    putc('w');
    800019dc:	07700513          	li	a0,119
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	c20080e7          	jalr	-992(ra) # 80001600 <_Z4putcc>
    putc('i');
    800019e8:	06900513          	li	a0,105
    800019ec:	00000097          	auipc	ra,0x0
    800019f0:	c14080e7          	jalr	-1004(ra) # 80001600 <_Z4putcc>
    putc('t');
    800019f4:	07400513          	li	a0,116
    800019f8:	00000097          	auipc	ra,0x0
    800019fc:	c08080e7          	jalr	-1016(ra) # 80001600 <_Z4putcc>
    putc('h');
    80001a00:	06800513          	li	a0,104
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	bfc080e7          	jalr	-1028(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001a0c:	02000513          	li	a0,32
    80001a10:	00000097          	auipc	ra,0x0
    80001a14:	bf0080e7          	jalr	-1040(ra) # 80001600 <_Z4putcc>
    putc('c');
    80001a18:	06300513          	li	a0,99
    80001a1c:	00000097          	auipc	ra,0x0
    80001a20:	be4080e7          	jalr	-1052(ra) # 80001600 <_Z4putcc>
    putc('o');
    80001a24:	06f00513          	li	a0,111
    80001a28:	00000097          	auipc	ra,0x0
    80001a2c:	bd8080e7          	jalr	-1064(ra) # 80001600 <_Z4putcc>
    putc('d');
    80001a30:	06400513          	li	a0,100
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	bcc080e7          	jalr	-1076(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001a3c:	06500513          	li	a0,101
    80001a40:	00000097          	auipc	ra,0x0
    80001a44:	bc0080e7          	jalr	-1088(ra) # 80001600 <_Z4putcc>
    putc(':');
    80001a48:	03a00513          	li	a0,58
    80001a4c:	00000097          	auipc	ra,0x0
    80001a50:	bb4080e7          	jalr	-1100(ra) # 80001600 <_Z4putcc>
    switch(exitCode){
    80001a54:	00048e63          	beqz	s1,80001a70 <main+0x284>
    80001a58:	00100793          	li	a5,1
    80001a5c:	02f48263          	beq	s1,a5,80001a80 <main+0x294>
            break;
        case Kernel::EXIT_FAILURE:
            putc('1');
            break;
        default:
            putc('2');
    80001a60:	03200513          	li	a0,50
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	b9c080e7          	jalr	-1124(ra) # 80001600 <_Z4putcc>
    80001a6c:	0200006f          	j	80001a8c <main+0x2a0>
            putc('0');
    80001a70:	03000513          	li	a0,48
    80001a74:	00000097          	auipc	ra,0x0
    80001a78:	b8c080e7          	jalr	-1140(ra) # 80001600 <_Z4putcc>
    80001a7c:	0100006f          	j	80001a8c <main+0x2a0>
            putc('1');
    80001a80:	03100513          	li	a0,49
    80001a84:	00000097          	auipc	ra,0x0
    80001a88:	b7c080e7          	jalr	-1156(ra) # 80001600 <_Z4putcc>
            break;
    }
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001a8c:	02049863          	bnez	s1,80001abc <main+0x2d0>
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    80001a90:	fd040513          	addi	a0,s0,-48
    80001a94:	fffff097          	auipc	ra,0xfffff
    80001a98:	6dc080e7          	jalr	1756(ra) # 80001170 <_ZN5TimerD1Ev>
    80001a9c:	fb840513          	addi	a0,s0,-72
    80001aa0:	00001097          	auipc	ra,0x1
    80001aa4:	68c080e7          	jalr	1676(ra) # 8000312c <_ZN11HeapManagerD1Ev>
    80001aa8:	04813083          	ld	ra,72(sp)
    80001aac:	04013403          	ld	s0,64(sp)
    80001ab0:	03813483          	ld	s1,56(sp)
    80001ab4:	05010113          	addi	sp,sp,80
    80001ab8:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001abc:	00006697          	auipc	a3,0x6
    80001ac0:	5cc68693          	addi	a3,a3,1484 # 80008088 <CONSOLE_STATUS+0x78>
    80001ac4:	04e00613          	li	a2,78
    80001ac8:	00006597          	auipc	a1,0x6
    80001acc:	5d058593          	addi	a1,a1,1488 # 80008098 <CONSOLE_STATUS+0x88>
    80001ad0:	00006517          	auipc	a0,0x6
    80001ad4:	5d850513          	addi	a0,a0,1496 # 800080a8 <CONSOLE_STATUS+0x98>
    80001ad8:	00000097          	auipc	ra,0x0
    80001adc:	034080e7          	jalr	52(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    80001ae0:	fb1ff06f          	j	80001a90 <main+0x2a4>
    80001ae4:	00050493          	mv	s1,a0
    80001ae8:	fd040513          	addi	a0,s0,-48
    80001aec:	fffff097          	auipc	ra,0xfffff
    80001af0:	684080e7          	jalr	1668(ra) # 80001170 <_ZN5TimerD1Ev>
    80001af4:	fb840513          	addi	a0,s0,-72
    80001af8:	00001097          	auipc	ra,0x1
    80001afc:	634080e7          	jalr	1588(ra) # 8000312c <_ZN11HeapManagerD1Ev>
    80001b00:	00048513          	mv	a0,s1
    80001b04:	00009097          	auipc	ra,0x9
    80001b08:	874080e7          	jalr	-1932(ra) # 8000a378 <_Unwind_Resume>

0000000080001b0c <_Z13assert_failedPKcS0_jS0_>:
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    80001b0c:	fb010113          	addi	sp,sp,-80
    80001b10:	04113423          	sd	ra,72(sp)
    80001b14:	04813023          	sd	s0,64(sp)
    80001b18:	02913c23          	sd	s1,56(sp)
    80001b1c:	03213823          	sd	s2,48(sp)
    80001b20:	03313423          	sd	s3,40(sp)
    80001b24:	03413023          	sd	s4,32(sp)
    80001b28:	05010413          	addi	s0,sp,80
    80001b2c:	00050993          	mv	s3,a0
    80001b30:	00058493          	mv	s1,a1
    80001b34:	00060913          	mv	s2,a2
    80001b38:	00068a13          	mv	s4,a3
    putc('\n');
    80001b3c:	00a00513          	li	a0,10
    80001b40:	00000097          	auipc	ra,0x0
    80001b44:	ac0080e7          	jalr	-1344(ra) # 80001600 <_Z4putcc>
    putc('A');
    80001b48:	04100513          	li	a0,65
    80001b4c:	00000097          	auipc	ra,0x0
    80001b50:	ab4080e7          	jalr	-1356(ra) # 80001600 <_Z4putcc>
    putc('s');
    80001b54:	07300513          	li	a0,115
    80001b58:	00000097          	auipc	ra,0x0
    80001b5c:	aa8080e7          	jalr	-1368(ra) # 80001600 <_Z4putcc>
    putc('s');
    80001b60:	07300513          	li	a0,115
    80001b64:	00000097          	auipc	ra,0x0
    80001b68:	a9c080e7          	jalr	-1380(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001b6c:	06500513          	li	a0,101
    80001b70:	00000097          	auipc	ra,0x0
    80001b74:	a90080e7          	jalr	-1392(ra) # 80001600 <_Z4putcc>
    putc('r');
    80001b78:	07200513          	li	a0,114
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	a84080e7          	jalr	-1404(ra) # 80001600 <_Z4putcc>
    putc('t');
    80001b84:	07400513          	li	a0,116
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	a78080e7          	jalr	-1416(ra) # 80001600 <_Z4putcc>
    putc('i');
    80001b90:	06900513          	li	a0,105
    80001b94:	00000097          	auipc	ra,0x0
    80001b98:	a6c080e7          	jalr	-1428(ra) # 80001600 <_Z4putcc>
    putc('o');
    80001b9c:	06f00513          	li	a0,111
    80001ba0:	00000097          	auipc	ra,0x0
    80001ba4:	a60080e7          	jalr	-1440(ra) # 80001600 <_Z4putcc>
    putc('n');
    80001ba8:	06e00513          	li	a0,110
    80001bac:	00000097          	auipc	ra,0x0
    80001bb0:	a54080e7          	jalr	-1452(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001bb4:	02000513          	li	a0,32
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	a48080e7          	jalr	-1464(ra) # 80001600 <_Z4putcc>
    putc('\'');
    80001bc0:	02700513          	li	a0,39
    80001bc4:	00000097          	auipc	ra,0x0
    80001bc8:	a3c080e7          	jalr	-1476(ra) # 80001600 <_Z4putcc>
    while(*__assertion != 0){
    80001bcc:	0009c503          	lbu	a0,0(s3)
    80001bd0:	00050a63          	beqz	a0,80001be4 <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    80001bd4:	00000097          	auipc	ra,0x0
    80001bd8:	a2c080e7          	jalr	-1492(ra) # 80001600 <_Z4putcc>
        __assertion++;
    80001bdc:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    80001be0:	fedff06f          	j	80001bcc <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    80001be4:	02700513          	li	a0,39
    80001be8:	00000097          	auipc	ra,0x0
    80001bec:	a18080e7          	jalr	-1512(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001bf0:	02000513          	li	a0,32
    80001bf4:	00000097          	auipc	ra,0x0
    80001bf8:	a0c080e7          	jalr	-1524(ra) # 80001600 <_Z4putcc>
    putc('f');
    80001bfc:	06600513          	li	a0,102
    80001c00:	00000097          	auipc	ra,0x0
    80001c04:	a00080e7          	jalr	-1536(ra) # 80001600 <_Z4putcc>
    putc('a');
    80001c08:	06100513          	li	a0,97
    80001c0c:	00000097          	auipc	ra,0x0
    80001c10:	9f4080e7          	jalr	-1548(ra) # 80001600 <_Z4putcc>
    putc('i');
    80001c14:	06900513          	li	a0,105
    80001c18:	00000097          	auipc	ra,0x0
    80001c1c:	9e8080e7          	jalr	-1560(ra) # 80001600 <_Z4putcc>
    putc('l');
    80001c20:	06c00513          	li	a0,108
    80001c24:	00000097          	auipc	ra,0x0
    80001c28:	9dc080e7          	jalr	-1572(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001c2c:	06500513          	li	a0,101
    80001c30:	00000097          	auipc	ra,0x0
    80001c34:	9d0080e7          	jalr	-1584(ra) # 80001600 <_Z4putcc>
    putc('d');
    80001c38:	06400513          	li	a0,100
    80001c3c:	00000097          	auipc	ra,0x0
    80001c40:	9c4080e7          	jalr	-1596(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001c44:	02000513          	li	a0,32
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	9b8080e7          	jalr	-1608(ra) # 80001600 <_Z4putcc>
    putc('i');
    80001c50:	06900513          	li	a0,105
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	9ac080e7          	jalr	-1620(ra) # 80001600 <_Z4putcc>
    putc('n');
    80001c5c:	06e00513          	li	a0,110
    80001c60:	00000097          	auipc	ra,0x0
    80001c64:	9a0080e7          	jalr	-1632(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001c68:	02000513          	li	a0,32
    80001c6c:	00000097          	auipc	ra,0x0
    80001c70:	994080e7          	jalr	-1644(ra) # 80001600 <_Z4putcc>
    putc('f');
    80001c74:	06600513          	li	a0,102
    80001c78:	00000097          	auipc	ra,0x0
    80001c7c:	988080e7          	jalr	-1656(ra) # 80001600 <_Z4putcc>
    putc('i');
    80001c80:	06900513          	li	a0,105
    80001c84:	00000097          	auipc	ra,0x0
    80001c88:	97c080e7          	jalr	-1668(ra) # 80001600 <_Z4putcc>
    putc('l');
    80001c8c:	06c00513          	li	a0,108
    80001c90:	00000097          	auipc	ra,0x0
    80001c94:	970080e7          	jalr	-1680(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001c98:	06500513          	li	a0,101
    80001c9c:	00000097          	auipc	ra,0x0
    80001ca0:	964080e7          	jalr	-1692(ra) # 80001600 <_Z4putcc>
    putc(':');
    80001ca4:	03a00513          	li	a0,58
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	958080e7          	jalr	-1704(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001cb0:	02000513          	li	a0,32
    80001cb4:	00000097          	auipc	ra,0x0
    80001cb8:	94c080e7          	jalr	-1716(ra) # 80001600 <_Z4putcc>
    while(*__file != 0){
    80001cbc:	0004c503          	lbu	a0,0(s1)
    80001cc0:	00050a63          	beqz	a0,80001cd4 <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    80001cc4:	00000097          	auipc	ra,0x0
    80001cc8:	93c080e7          	jalr	-1732(ra) # 80001600 <_Z4putcc>
        __file++;
    80001ccc:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80001cd0:	fedff06f          	j	80001cbc <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    80001cd4:	00a00513          	li	a0,10
    80001cd8:	00000097          	auipc	ra,0x0
    80001cdc:	928080e7          	jalr	-1752(ra) # 80001600 <_Z4putcc>
    putc('l');
    80001ce0:	06c00513          	li	a0,108
    80001ce4:	00000097          	auipc	ra,0x0
    80001ce8:	91c080e7          	jalr	-1764(ra) # 80001600 <_Z4putcc>
    putc('i');
    80001cec:	06900513          	li	a0,105
    80001cf0:	00000097          	auipc	ra,0x0
    80001cf4:	910080e7          	jalr	-1776(ra) # 80001600 <_Z4putcc>
    putc('n');
    80001cf8:	06e00513          	li	a0,110
    80001cfc:	00000097          	auipc	ra,0x0
    80001d00:	904080e7          	jalr	-1788(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001d04:	06500513          	li	a0,101
    80001d08:	00000097          	auipc	ra,0x0
    80001d0c:	8f8080e7          	jalr	-1800(ra) # 80001600 <_Z4putcc>
    putc(':');
    80001d10:	03a00513          	li	a0,58
    80001d14:	00000097          	auipc	ra,0x0
    80001d18:	8ec080e7          	jalr	-1812(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001d1c:	02000513          	li	a0,32
    80001d20:	00000097          	auipc	ra,0x0
    80001d24:	8e0080e7          	jalr	-1824(ra) # 80001600 <_Z4putcc>
    char buffer[20];
    int i = 0;
    80001d28:	00000493          	li	s1,0
    while(__line != 0){
    80001d2c:	02090463          	beqz	s2,80001d54 <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80001d30:	00a00713          	li	a4,10
    80001d34:	02e977bb          	remuw	a5,s2,a4
    80001d38:	0307879b          	addiw	a5,a5,48
    80001d3c:	fd040693          	addi	a3,s0,-48
    80001d40:	009686b3          	add	a3,a3,s1
    80001d44:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    80001d48:	02e9593b          	divuw	s2,s2,a4
        i++;
    80001d4c:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    80001d50:	fddff06f          	j	80001d2c <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    80001d54:	02048063          	beqz	s1,80001d74 <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    80001d58:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80001d5c:	fd040793          	addi	a5,s0,-48
    80001d60:	009787b3          	add	a5,a5,s1
    80001d64:	fe87c503          	lbu	a0,-24(a5)
    80001d68:	00000097          	auipc	ra,0x0
    80001d6c:	898080e7          	jalr	-1896(ra) # 80001600 <_Z4putcc>
    80001d70:	fe5ff06f          	j	80001d54 <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80001d74:	00a00513          	li	a0,10
    80001d78:	00000097          	auipc	ra,0x0
    80001d7c:	888080e7          	jalr	-1912(ra) # 80001600 <_Z4putcc>
    putc('f');
    80001d80:	06600513          	li	a0,102
    80001d84:	00000097          	auipc	ra,0x0
    80001d88:	87c080e7          	jalr	-1924(ra) # 80001600 <_Z4putcc>
    putc('u');
    80001d8c:	07500513          	li	a0,117
    80001d90:	00000097          	auipc	ra,0x0
    80001d94:	870080e7          	jalr	-1936(ra) # 80001600 <_Z4putcc>
    putc('n');
    80001d98:	06e00513          	li	a0,110
    80001d9c:	00000097          	auipc	ra,0x0
    80001da0:	864080e7          	jalr	-1948(ra) # 80001600 <_Z4putcc>
    putc('c');
    80001da4:	06300513          	li	a0,99
    80001da8:	00000097          	auipc	ra,0x0
    80001dac:	858080e7          	jalr	-1960(ra) # 80001600 <_Z4putcc>
    putc('t');
    80001db0:	07400513          	li	a0,116
    80001db4:	00000097          	auipc	ra,0x0
    80001db8:	84c080e7          	jalr	-1972(ra) # 80001600 <_Z4putcc>
    putc('i');
    80001dbc:	06900513          	li	a0,105
    80001dc0:	00000097          	auipc	ra,0x0
    80001dc4:	840080e7          	jalr	-1984(ra) # 80001600 <_Z4putcc>
    putc('o');
    80001dc8:	06f00513          	li	a0,111
    80001dcc:	00000097          	auipc	ra,0x0
    80001dd0:	834080e7          	jalr	-1996(ra) # 80001600 <_Z4putcc>
    putc('n');
    80001dd4:	06e00513          	li	a0,110
    80001dd8:	00000097          	auipc	ra,0x0
    80001ddc:	828080e7          	jalr	-2008(ra) # 80001600 <_Z4putcc>
    putc(':');
    80001de0:	03a00513          	li	a0,58
    80001de4:	00000097          	auipc	ra,0x0
    80001de8:	81c080e7          	jalr	-2020(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001dec:	02000513          	li	a0,32
    80001df0:	00000097          	auipc	ra,0x0
    80001df4:	810080e7          	jalr	-2032(ra) # 80001600 <_Z4putcc>
    putc('\'');
    80001df8:	02700513          	li	a0,39
    80001dfc:	00000097          	auipc	ra,0x0
    80001e00:	804080e7          	jalr	-2044(ra) # 80001600 <_Z4putcc>
    while(*__function != 0){
    80001e04:	000a4503          	lbu	a0,0(s4)
    80001e08:	00050a63          	beqz	a0,80001e1c <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    80001e0c:	fffff097          	auipc	ra,0xfffff
    80001e10:	7f4080e7          	jalr	2036(ra) # 80001600 <_Z4putcc>
        __function ++;
    80001e14:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80001e18:	fedff06f          	j	80001e04 <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    80001e1c:	02700513          	li	a0,39
    80001e20:	fffff097          	auipc	ra,0xfffff
    80001e24:	7e0080e7          	jalr	2016(ra) # 80001600 <_Z4putcc>
    putc('\n');
    80001e28:	00a00513          	li	a0,10
    80001e2c:	fffff097          	auipc	ra,0xfffff
    80001e30:	7d4080e7          	jalr	2004(ra) # 80001600 <_Z4putcc>
    while(1);
    80001e34:	0000006f          	j	80001e34 <_Z13assert_failedPKcS0_jS0_+0x328>

0000000080001e38 <_ZN7Console11getInstanceEv>:
#include "userConsole.h"

Console* Console::instance = nullptr;


Console& Console::getInstance(){
    80001e38:	ff010113          	addi	sp,sp,-16
    80001e3c:	00813423          	sd	s0,8(sp)
    80001e40:	01010413          	addi	s0,sp,16
    return *instance;
}
    80001e44:	00007517          	auipc	a0,0x7
    80001e48:	43453503          	ld	a0,1076(a0) # 80009278 <_ZN7Console8instanceE>
    80001e4c:	00813403          	ld	s0,8(sp)
    80001e50:	01010113          	addi	sp,sp,16
    80001e54:	00008067          	ret

0000000080001e58 <_ZN7Console13consoleBuffer7isEmptyEv>:
    head = (head + 1) % BUFFER_SIZE;
    size--;
    return c;
}

bool Console::consoleBuffer::isEmpty(){
    80001e58:	ff010113          	addi	sp,sp,-16
    80001e5c:	00813423          	sd	s0,8(sp)
    80001e60:	01010413          	addi	s0,sp,16
    return size == 0;
    80001e64:	07853503          	ld	a0,120(a0)
}
    80001e68:	00153513          	seqz	a0,a0
    80001e6c:	00813403          	ld	s0,8(sp)
    80001e70:	01010113          	addi	sp,sp,16
    80001e74:	00008067          	ret

0000000080001e78 <_ZN7Console13consoleBuffer3getEv>:
char Console::consoleBuffer::get(){
    80001e78:	fe010113          	addi	sp,sp,-32
    80001e7c:	00113c23          	sd	ra,24(sp)
    80001e80:	00813823          	sd	s0,16(sp)
    80001e84:	00913423          	sd	s1,8(sp)
    80001e88:	02010413          	addi	s0,sp,32
    80001e8c:	00050493          	mv	s1,a0
    while(isEmpty());
    80001e90:	00048513          	mv	a0,s1
    80001e94:	00000097          	auipc	ra,0x0
    80001e98:	fc4080e7          	jalr	-60(ra) # 80001e58 <_ZN7Console13consoleBuffer7isEmptyEv>
    80001e9c:	fe051ae3          	bnez	a0,80001e90 <_ZN7Console13consoleBuffer3getEv+0x18>
    char c = buffer[head];
    80001ea0:	0684b783          	ld	a5,104(s1)
    80001ea4:	00f48733          	add	a4,s1,a5
    80001ea8:	00074503          	lbu	a0,0(a4)
    head = (head + 1) % BUFFER_SIZE;
    80001eac:	00178793          	addi	a5,a5,1
    80001eb0:	06400713          	li	a4,100
    80001eb4:	02e7f7b3          	remu	a5,a5,a4
    80001eb8:	06f4b423          	sd	a5,104(s1)
    size--;
    80001ebc:	0784b783          	ld	a5,120(s1)
    80001ec0:	fff78793          	addi	a5,a5,-1
    80001ec4:	06f4bc23          	sd	a5,120(s1)
}
    80001ec8:	01813083          	ld	ra,24(sp)
    80001ecc:	01013403          	ld	s0,16(sp)
    80001ed0:	00813483          	ld	s1,8(sp)
    80001ed4:	02010113          	addi	sp,sp,32
    80001ed8:	00008067          	ret

0000000080001edc <_ZN7Console13consoleBuffer6isFullEv>:

bool Console::consoleBuffer::isFull(){
    80001edc:	ff010113          	addi	sp,sp,-16
    80001ee0:	00813423          	sd	s0,8(sp)
    80001ee4:	01010413          	addi	s0,sp,16
    return size == BUFFER_SIZE;
    80001ee8:	07853503          	ld	a0,120(a0)
    80001eec:	f9c50513          	addi	a0,a0,-100
}
    80001ef0:	00153513          	seqz	a0,a0
    80001ef4:	00813403          	ld	s0,8(sp)
    80001ef8:	01010113          	addi	sp,sp,16
    80001efc:	00008067          	ret

0000000080001f00 <_ZN7Console13consoleBuffer3putEc>:
void Console::consoleBuffer::put(char c){
    80001f00:	fe010113          	addi	sp,sp,-32
    80001f04:	00113c23          	sd	ra,24(sp)
    80001f08:	00813823          	sd	s0,16(sp)
    80001f0c:	00913423          	sd	s1,8(sp)
    80001f10:	01213023          	sd	s2,0(sp)
    80001f14:	02010413          	addi	s0,sp,32
    80001f18:	00050493          	mv	s1,a0
    80001f1c:	00058913          	mv	s2,a1
    while(isFull());
    80001f20:	00048513          	mv	a0,s1
    80001f24:	00000097          	auipc	ra,0x0
    80001f28:	fb8080e7          	jalr	-72(ra) # 80001edc <_ZN7Console13consoleBuffer6isFullEv>
    80001f2c:	fe051ae3          	bnez	a0,80001f20 <_ZN7Console13consoleBuffer3putEc+0x20>
    buffer[tail] = c;
    80001f30:	0704b783          	ld	a5,112(s1)
    80001f34:	00f48733          	add	a4,s1,a5
    80001f38:	01270023          	sb	s2,0(a4)
    tail = (tail + 1) % BUFFER_SIZE;
    80001f3c:	00178793          	addi	a5,a5,1
    80001f40:	06400713          	li	a4,100
    80001f44:	02e7f7b3          	remu	a5,a5,a4
    80001f48:	06f4b823          	sd	a5,112(s1)
    size++;
    80001f4c:	0784b783          	ld	a5,120(s1)
    80001f50:	00178793          	addi	a5,a5,1
    80001f54:	06f4bc23          	sd	a5,120(s1)
}
    80001f58:	01813083          	ld	ra,24(sp)
    80001f5c:	01013403          	ld	s0,16(sp)
    80001f60:	00813483          	ld	s1,8(sp)
    80001f64:	00013903          	ld	s2,0(sp)
    80001f68:	02010113          	addi	sp,sp,32
    80001f6c:	00008067          	ret

0000000080001f70 <_ZN7Console4putcEc>:

void Console::putc(char c){
    80001f70:	ff010113          	addi	sp,sp,-16
    80001f74:	00113423          	sd	ra,8(sp)
    80001f78:	00813023          	sd	s0,0(sp)
    80001f7c:	01010413          	addi	s0,sp,16
    outBuffer.put(c);
    80001f80:	08050513          	addi	a0,a0,128
    80001f84:	00000097          	auipc	ra,0x0
    80001f88:	f7c080e7          	jalr	-132(ra) # 80001f00 <_ZN7Console13consoleBuffer3putEc>
}
    80001f8c:	00813083          	ld	ra,8(sp)
    80001f90:	00013403          	ld	s0,0(sp)
    80001f94:	01010113          	addi	sp,sp,16
    80001f98:	00008067          	ret

0000000080001f9c <_ZN7Console4getcEv>:

char Console::getc(){
    80001f9c:	ff010113          	addi	sp,sp,-16
    80001fa0:	00113423          	sd	ra,8(sp)
    80001fa4:	00813023          	sd	s0,0(sp)
    80001fa8:	01010413          	addi	s0,sp,16
    return inBuffer.get();
    80001fac:	00000097          	auipc	ra,0x0
    80001fb0:	ecc080e7          	jalr	-308(ra) # 80001e78 <_ZN7Console13consoleBuffer3getEv>
}
    80001fb4:	00813083          	ld	ra,8(sp)
    80001fb8:	00013403          	ld	s0,0(sp)
    80001fbc:	01010113          	addi	sp,sp,16
    80001fc0:	00008067          	ret

0000000080001fc4 <_ZN6KernelC1Ev>:

#include "console.h"

extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80001fc4:	fe010113          	addi	sp,sp,-32
    80001fc8:	00113c23          	sd	ra,24(sp)
    80001fcc:	00813823          	sd	s0,16(sp)
    80001fd0:	00913423          	sd	s1,8(sp)
    80001fd4:	01213023          	sd	s2,0(sp)
    80001fd8:	02010413          	addi	s0,sp,32
    80001fdc:	00050493          	mv	s1,a0
    80001fe0:	00001097          	auipc	ra,0x1
    80001fe4:	0e4080e7          	jalr	228(ra) # 800030c4 <_ZN11HeapManagerC1Ev>
    80001fe8:	00848513          	addi	a0,s1,8
    80001fec:	00003097          	auipc	ra,0x3
    80001ff0:	a60080e7          	jalr	-1440(ra) # 80004a4c <_ZN9SchedulerC1Ev>
    80001ff4:	01848513          	addi	a0,s1,24
    80001ff8:	fffff097          	auipc	ra,0xfffff
    80001ffc:	108080e7          	jalr	264(ra) # 80001100 <_ZN5TimerC1Ev>
    80002000:	0200006f          	j	80002020 <_ZN6KernelC1Ev+0x5c>
    80002004:	00050913          	mv	s2,a0
    80002008:	00048513          	mv	a0,s1
    8000200c:	00001097          	auipc	ra,0x1
    80002010:	120080e7          	jalr	288(ra) # 8000312c <_ZN11HeapManagerD1Ev>
    80002014:	00090513          	mv	a0,s2
    80002018:	00008097          	auipc	ra,0x8
    8000201c:	360080e7          	jalr	864(ra) # 8000a378 <_Unwind_Resume>
    80002020:	01813083          	ld	ra,24(sp)
    80002024:	01013403          	ld	s0,16(sp)
    80002028:	00813483          	ld	s1,8(sp)
    8000202c:	00013903          	ld	s2,0(sp)
    80002030:	02010113          	addi	sp,sp,32
    80002034:	00008067          	ret

0000000080002038 <_ZN6Kernel10initialiseEv>:
 
void Kernel::initialise(){
    80002038:	ff010113          	addi	sp,sp,-16
    8000203c:	00113423          	sd	ra,8(sp)
    80002040:	00813023          	sd	s0,0(sp)
    80002044:	01010413          	addi	s0,sp,16
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80002048:	00007797          	auipc	a5,0x7
    8000204c:	1c87b783          	ld	a5,456(a5) # 80009210 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002050:	10579073          	csrw	stvec,a5

    
    /// initialise the heap manager
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );
    80002054:	00007797          	auipc	a5,0x7
    80002058:	1c47b783          	ld	a5,452(a5) # 80009218 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000205c:	0007b603          	ld	a2,0(a5)
    80002060:	00007797          	auipc	a5,0x7
    80002064:	1907b783          	ld	a5,400(a5) # 800091f0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002068:	0007b583          	ld	a1,0(a5)
    8000206c:	00001097          	auipc	ra,0x1
    80002070:	0d8080e7          	jalr	216(ra) # 80003144 <_ZN11HeapManager4initEmm>

    return;
}
    80002074:	00813083          	ld	ra,8(sp)
    80002078:	00013403          	ld	s0,0(sp)
    8000207c:	01010113          	addi	sp,sp,16
    80002080:	00008067          	ret

0000000080002084 <_Z8testFuncPv>:

// sem_t sem = 0;

void testFunc(void* arg){
    80002084:	ff010113          	addi	sp,sp,-16
    80002088:	00113423          	sd	ra,8(sp)
    8000208c:	00813023          	sd	s0,0(sp)
    80002090:	01010413          	addi	s0,sp,16
    putc('t');
    80002094:	07400513          	li	a0,116
    80002098:	fffff097          	auipc	ra,0xfffff
    8000209c:	568080e7          	jalr	1384(ra) # 80001600 <_Z4putcc>
    putc('e');
    800020a0:	06500513          	li	a0,101
    800020a4:	fffff097          	auipc	ra,0xfffff
    800020a8:	55c080e7          	jalr	1372(ra) # 80001600 <_Z4putcc>
    putc('s');
    800020ac:	07300513          	li	a0,115
    800020b0:	fffff097          	auipc	ra,0xfffff
    800020b4:	550080e7          	jalr	1360(ra) # 80001600 <_Z4putcc>
    putc('t');
    800020b8:	07400513          	li	a0,116
    800020bc:	fffff097          	auipc	ra,0xfffff
    800020c0:	544080e7          	jalr	1348(ra) # 80001600 <_Z4putcc>

    // sem_wait(sem);
    // thread_dispatch();
    // thread_dispatch();
    thread_dispatch();
    800020c4:	fffff097          	auipc	ra,0xfffff
    800020c8:	3e8080e7          	jalr	1000(ra) # 800014ac <_Z15thread_dispatchv>

    // time_sleep(10);
    putc(' ');
    800020cc:	02000513          	li	a0,32
    800020d0:	fffff097          	auipc	ra,0xfffff
    800020d4:	530080e7          	jalr	1328(ra) # 80001600 <_Z4putcc>

    putc('t');
    800020d8:	07400513          	li	a0,116
    800020dc:	fffff097          	auipc	ra,0xfffff
    800020e0:	524080e7          	jalr	1316(ra) # 80001600 <_Z4putcc>
    putc('h');
    800020e4:	06800513          	li	a0,104
    800020e8:	fffff097          	auipc	ra,0xfffff
    800020ec:	518080e7          	jalr	1304(ra) # 80001600 <_Z4putcc>
    putc('r');
    800020f0:	07200513          	li	a0,114
    800020f4:	fffff097          	auipc	ra,0xfffff
    800020f8:	50c080e7          	jalr	1292(ra) # 80001600 <_Z4putcc>
    putc('e');
    800020fc:	06500513          	li	a0,101
    80002100:	fffff097          	auipc	ra,0xfffff
    80002104:	500080e7          	jalr	1280(ra) # 80001600 <_Z4putcc>
    putc('a');
    80002108:	06100513          	li	a0,97
    8000210c:	fffff097          	auipc	ra,0xfffff
    80002110:	4f4080e7          	jalr	1268(ra) # 80001600 <_Z4putcc>
    putc('d');
    80002114:	06400513          	li	a0,100
    80002118:	fffff097          	auipc	ra,0xfffff
    8000211c:	4e8080e7          	jalr	1256(ra) # 80001600 <_Z4putcc>
    putc('\n');
    80002120:	00a00513          	li	a0,10
    80002124:	fffff097          	auipc	ra,0xfffff
    80002128:	4dc080e7          	jalr	1244(ra) # 80001600 <_Z4putcc>
}
    8000212c:	00813083          	ld	ra,8(sp)
    80002130:	00013403          	ld	s0,0(sp)
    80002134:	01010113          	addi	sp,sp,16
    80002138:	00008067          	ret

000000008000213c <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    8000213c:	fe010113          	addi	sp,sp,-32
    80002140:	00113c23          	sd	ra,24(sp)
    80002144:	00813823          	sd	s0,16(sp)
    80002148:	02010413          	addi	s0,sp,32

    thread_t t, test;
    
    thread_create(&t, 0, 0);
    8000214c:	00000613          	li	a2,0
    80002150:	00000593          	li	a1,0
    80002154:	fe840513          	addi	a0,s0,-24
    80002158:	fffff097          	auipc	ra,0xfffff
    8000215c:	2b8080e7          	jalr	696(ra) # 80001410 <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80002160:	00003097          	auipc	ra,0x3
    80002164:	b74080e7          	jalr	-1164(ra) # 80004cd4 <_ZN9Scheduler3getEv>
    80002168:	00007797          	auipc	a5,0x7
    8000216c:	0b87b783          	ld	a5,184(a5) # 80009220 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002170:	00a7b023          	sd	a0,0(a5)
    
    /// change to user mode
    __asm__ volatile ("li a0, 0xff");
    80002174:	0ff00513          	li	a0,255
    __asm__ volatile ("ecall");
    80002178:	00000073          	ecall
    
    putc('u');
    8000217c:	07500513          	li	a0,117
    80002180:	fffff097          	auipc	ra,0xfffff
    80002184:	480080e7          	jalr	1152(ra) # 80001600 <_Z4putcc>
    putc('s');
    80002188:	07300513          	li	a0,115
    8000218c:	fffff097          	auipc	ra,0xfffff
    80002190:	474080e7          	jalr	1140(ra) # 80001600 <_Z4putcc>
    putc('e');
    80002194:	06500513          	li	a0,101
    80002198:	fffff097          	auipc	ra,0xfffff
    8000219c:	468080e7          	jalr	1128(ra) # 80001600 <_Z4putcc>
    putc('r');
    800021a0:	07200513          	li	a0,114
    800021a4:	fffff097          	auipc	ra,0xfffff
    800021a8:	45c080e7          	jalr	1116(ra) # 80001600 <_Z4putcc>
    putc('\n');
    800021ac:	00a00513          	li	a0,10
    800021b0:	fffff097          	auipc	ra,0xfffff
    800021b4:	450080e7          	jalr	1104(ra) # 80001600 <_Z4putcc>

    
    /// NOW WE ARE IN USER MODE
    
    
    thread_create(&test, usermain, 0);
    800021b8:	00000613          	li	a2,0
    800021bc:	00007597          	auipc	a1,0x7
    800021c0:	03c5b583          	ld	a1,60(a1) # 800091f8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800021c4:	fe040513          	addi	a0,s0,-32
    800021c8:	fffff097          	auipc	ra,0xfffff
    800021cc:	248080e7          	jalr	584(ra) # 80001410 <_Z13thread_createPP7_threadPFvPvES2_>
    putc('k');
    800021d0:	06b00513          	li	a0,107
    800021d4:	fffff097          	auipc	ra,0xfffff
    800021d8:	42c080e7          	jalr	1068(ra) # 80001600 <_Z4putcc>
    putc('e');
    800021dc:	06500513          	li	a0,101
    800021e0:	fffff097          	auipc	ra,0xfffff
    800021e4:	420080e7          	jalr	1056(ra) # 80001600 <_Z4putcc>
    putc('r');
    800021e8:	07200513          	li	a0,114
    800021ec:	fffff097          	auipc	ra,0xfffff
    800021f0:	414080e7          	jalr	1044(ra) # 80001600 <_Z4putcc>
    putc('n');
    800021f4:	06e00513          	li	a0,110
    800021f8:	fffff097          	auipc	ra,0xfffff
    800021fc:	408080e7          	jalr	1032(ra) # 80001600 <_Z4putcc>
    putc('e');
    80002200:	06500513          	li	a0,101
    80002204:	fffff097          	auipc	ra,0xfffff
    80002208:	3fc080e7          	jalr	1020(ra) # 80001600 <_Z4putcc>
    putc('l');
    8000220c:	06c00513          	li	a0,108
    80002210:	fffff097          	auipc	ra,0xfffff
    80002214:	3f0080e7          	jalr	1008(ra) # 80001600 <_Z4putcc>
    putc('\n');
    80002218:	00a00513          	li	a0,10
    8000221c:	fffff097          	auipc	ra,0xfffff
    80002220:	3e4080e7          	jalr	996(ra) # 80001600 <_Z4putcc>
    do{
        thread_dispatch();
    80002224:	fffff097          	auipc	ra,0xfffff
    80002228:	288080e7          	jalr	648(ra) # 800014ac <_Z15thread_dispatchv>
    }while(!Scheduler::isEmpty() || !Timer::getInstance().noSleepingThreads());
    8000222c:	00003097          	auipc	ra,0x3
    80002230:	890080e7          	jalr	-1904(ra) # 80004abc <_ZN9Scheduler7isEmptyEv>
    80002234:	fe0508e3          	beqz	a0,80002224 <_ZN6Kernel3runEv+0xe8>
    80002238:	fffff097          	auipc	ra,0xfffff
    8000223c:	f60080e7          	jalr	-160(ra) # 80001198 <_ZN5Timer11getInstanceEv>
    80002240:	fffff097          	auipc	ra,0xfffff
    80002244:	154080e7          	jalr	340(ra) # 80001394 <_ZN5Timer17noSleepingThreadsEv>
    80002248:	fc050ee3          	beqz	a0,80002224 <_ZN6Kernel3runEv+0xe8>
    // }while(true);

    putc('m');
    8000224c:	06d00513          	li	a0,109
    80002250:	fffff097          	auipc	ra,0xfffff
    80002254:	3b0080e7          	jalr	944(ra) # 80001600 <_Z4putcc>
    putc('a');
    80002258:	06100513          	li	a0,97
    8000225c:	fffff097          	auipc	ra,0xfffff
    80002260:	3a4080e7          	jalr	932(ra) # 80001600 <_Z4putcc>
    putc('i');
    80002264:	06900513          	li	a0,105
    80002268:	fffff097          	auipc	ra,0xfffff
    8000226c:	398080e7          	jalr	920(ra) # 80001600 <_Z4putcc>
    putc('n');
    80002270:	06e00513          	li	a0,110
    80002274:	fffff097          	auipc	ra,0xfffff
    80002278:	38c080e7          	jalr	908(ra) # 80001600 <_Z4putcc>
    putc('\n');
    8000227c:	00a00513          	li	a0,10
    80002280:	fffff097          	auipc	ra,0xfffff
    80002284:	380080e7          	jalr	896(ra) # 80001600 <_Z4putcc>
    return EXIT_SUCCESS;
}
    80002288:	00000513          	li	a0,0
    8000228c:	01813083          	ld	ra,24(sp)
    80002290:	01013403          	ld	s0,16(sp)
    80002294:	02010113          	addi	sp,sp,32
    80002298:	00008067          	ret

000000008000229c <_Z13thread_test_1Pv>:
#include "assert.h"

sem_t sem1;
sem_t sem2;

void thread_test_1(void* args){
    8000229c:	ff010113          	addi	sp,sp,-16
    800022a0:	00113423          	sd	ra,8(sp)
    800022a4:	00813023          	sd	s0,0(sp)
    800022a8:	01010413          	addi	s0,sp,16
    putc('1');
    800022ac:	03100513          	li	a0,49
    800022b0:	fffff097          	auipc	ra,0xfffff
    800022b4:	350080e7          	jalr	848(ra) # 80001600 <_Z4putcc>
    putc('s');
    800022b8:	07300513          	li	a0,115
    800022bc:	fffff097          	auipc	ra,0xfffff
    800022c0:	344080e7          	jalr	836(ra) # 80001600 <_Z4putcc>
    time_sleep(30);
    800022c4:	01e00513          	li	a0,30
    800022c8:	fffff097          	auipc	ra,0xfffff
    800022cc:	228080e7          	jalr	552(ra) # 800014f0 <_Z10time_sleepm>
    putc('1');
    800022d0:	03100513          	li	a0,49
    800022d4:	fffff097          	auipc	ra,0xfffff
    800022d8:	32c080e7          	jalr	812(ra) # 80001600 <_Z4putcc>
    sem_signal(sem1);
    800022dc:	00007517          	auipc	a0,0x7
    800022e0:	fa453503          	ld	a0,-92(a0) # 80009280 <sem1>
    800022e4:	fffff097          	auipc	ra,0xfffff
    800022e8:	2c8080e7          	jalr	712(ra) # 800015ac <_Z10sem_signalP4_sem>
    putc('S');
    800022ec:	05300513          	li	a0,83
    800022f0:	fffff097          	auipc	ra,0xfffff
    800022f4:	310080e7          	jalr	784(ra) # 80001600 <_Z4putcc>
}
    800022f8:	00813083          	ld	ra,8(sp)
    800022fc:	00013403          	ld	s0,0(sp)
    80002300:	01010113          	addi	sp,sp,16
    80002304:	00008067          	ret

0000000080002308 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80002308:	ff010113          	addi	sp,sp,-16
    8000230c:	00113423          	sd	ra,8(sp)
    80002310:	00813023          	sd	s0,0(sp)
    80002314:	01010413          	addi	s0,sp,16
    putc('2');
    80002318:	03200513          	li	a0,50
    8000231c:	fffff097          	auipc	ra,0xfffff
    80002320:	2e4080e7          	jalr	740(ra) # 80001600 <_Z4putcc>
    putc('s');
    80002324:	07300513          	li	a0,115
    80002328:	fffff097          	auipc	ra,0xfffff
    8000232c:	2d8080e7          	jalr	728(ra) # 80001600 <_Z4putcc>
    time_sleep(60);
    80002330:	03c00513          	li	a0,60
    80002334:	fffff097          	auipc	ra,0xfffff
    80002338:	1bc080e7          	jalr	444(ra) # 800014f0 <_Z10time_sleepm>
    putc('2');
    8000233c:	03200513          	li	a0,50
    80002340:	fffff097          	auipc	ra,0xfffff
    80002344:	2c0080e7          	jalr	704(ra) # 80001600 <_Z4putcc>
    putc('S');
    80002348:	05300513          	li	a0,83
    8000234c:	fffff097          	auipc	ra,0xfffff
    80002350:	2b4080e7          	jalr	692(ra) # 80001600 <_Z4putcc>
    sem_signal(sem2);
    80002354:	00007517          	auipc	a0,0x7
    80002358:	f3453503          	ld	a0,-204(a0) # 80009288 <sem2>
    8000235c:	fffff097          	auipc	ra,0xfffff
    80002360:	250080e7          	jalr	592(ra) # 800015ac <_Z10sem_signalP4_sem>
    for(int i = 0; i < 1 << 20; i++){
    80002364:	00000793          	li	a5,0
    80002368:	00100737          	lui	a4,0x100
    8000236c:	00e7d863          	bge	a5,a4,8000237c <_Z13thread_test_2Pv+0x74>
        __asm__ volatile("nop");
    80002370:	00000013          	nop
    for(int i = 0; i < 1 << 20; i++){
    80002374:	0017879b          	addiw	a5,a5,1
    80002378:	ff1ff06f          	j	80002368 <_Z13thread_test_2Pv+0x60>
    }
}
    8000237c:	00813083          	ld	ra,8(sp)
    80002380:	00013403          	ld	s0,0(sp)
    80002384:	01010113          	addi	sp,sp,16
    80002388:	00008067          	ret

000000008000238c <_Z7memTestv>:

void memTest(){
    8000238c:	fd010113          	addi	sp,sp,-48
    80002390:	02113423          	sd	ra,40(sp)
    80002394:	02813023          	sd	s0,32(sp)
    80002398:	00913c23          	sd	s1,24(sp)
    8000239c:	01213823          	sd	s2,16(sp)
    800023a0:	01313423          	sd	s3,8(sp)
    800023a4:	01413023          	sd	s4,0(sp)
    800023a8:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    800023ac:	00007797          	auipc	a5,0x7
    800023b0:	e547b783          	ld	a5,-428(a5) # 80009200 <_GLOBAL_OFFSET_TABLE_+0x18>
    800023b4:	0007b503          	ld	a0,0(a5)
    800023b8:	00001097          	auipc	ra,0x1
    800023bc:	eb0080e7          	jalr	-336(ra) # 80003268 <_ZN11HeapManager17getHeapFreeMemoryEv>
    800023c0:	00050993          	mv	s3,a0
    putc('F');
    800023c4:	04600513          	li	a0,70
    800023c8:	fffff097          	auipc	ra,0xfffff
    800023cc:	238080e7          	jalr	568(ra) # 80001600 <_Z4putcc>
    putc('r');
    800023d0:	07200513          	li	a0,114
    800023d4:	fffff097          	auipc	ra,0xfffff
    800023d8:	22c080e7          	jalr	556(ra) # 80001600 <_Z4putcc>
    putc('e');
    800023dc:	06500513          	li	a0,101
    800023e0:	fffff097          	auipc	ra,0xfffff
    800023e4:	220080e7          	jalr	544(ra) # 80001600 <_Z4putcc>
    putc('e');
    800023e8:	06500513          	li	a0,101
    800023ec:	fffff097          	auipc	ra,0xfffff
    800023f0:	214080e7          	jalr	532(ra) # 80001600 <_Z4putcc>
    putc(' ');
    800023f4:	02000513          	li	a0,32
    800023f8:	fffff097          	auipc	ra,0xfffff
    800023fc:	208080e7          	jalr	520(ra) # 80001600 <_Z4putcc>
    putc('m');
    80002400:	06d00513          	li	a0,109
    80002404:	fffff097          	auipc	ra,0xfffff
    80002408:	1fc080e7          	jalr	508(ra) # 80001600 <_Z4putcc>
    putc('e');
    8000240c:	06500513          	li	a0,101
    80002410:	fffff097          	auipc	ra,0xfffff
    80002414:	1f0080e7          	jalr	496(ra) # 80001600 <_Z4putcc>
    putc('m');
    80002418:	06d00513          	li	a0,109
    8000241c:	fffff097          	auipc	ra,0xfffff
    80002420:	1e4080e7          	jalr	484(ra) # 80001600 <_Z4putcc>
    putc('o');
    80002424:	06f00513          	li	a0,111
    80002428:	fffff097          	auipc	ra,0xfffff
    8000242c:	1d8080e7          	jalr	472(ra) # 80001600 <_Z4putcc>
    putc('r');
    80002430:	07200513          	li	a0,114
    80002434:	fffff097          	auipc	ra,0xfffff
    80002438:	1cc080e7          	jalr	460(ra) # 80001600 <_Z4putcc>
    putc('y');
    8000243c:	07900513          	li	a0,121
    80002440:	fffff097          	auipc	ra,0xfffff
    80002444:	1c0080e7          	jalr	448(ra) # 80001600 <_Z4putcc>
    putc(':');
    80002448:	03a00513          	li	a0,58
    8000244c:	fffff097          	auipc	ra,0xfffff
    80002450:	1b4080e7          	jalr	436(ra) # 80001600 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002454:	00f00493          	li	s1,15
    80002458:	0140006f          	j	8000246c <_Z7memTestv+0xe0>
        int digit = (freeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    8000245c:	05750513          	addi	a0,a0,87
    80002460:	fffff097          	auipc	ra,0xfffff
    80002464:	1a0080e7          	jalr	416(ra) # 80001600 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002468:	fff4849b          	addiw	s1,s1,-1
    8000246c:	0204c463          	bltz	s1,80002494 <_Z7memTestv+0x108>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    80002470:	0024951b          	slliw	a0,s1,0x2
    80002474:	00a9d533          	srl	a0,s3,a0
    80002478:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    8000247c:	00900793          	li	a5,9
    80002480:	fca7cee3          	blt	a5,a0,8000245c <_Z7memTestv+0xd0>
            putc('0' + digit);
    80002484:	03050513          	addi	a0,a0,48
    80002488:	fffff097          	auipc	ra,0xfffff
    8000248c:	178080e7          	jalr	376(ra) # 80001600 <_Z4putcc>
    80002490:	fd9ff06f          	j	80002468 <_Z7memTestv+0xdc>
        }
    }
    putc('\n');
    80002494:	00a00513          	li	a0,10
    80002498:	fffff097          	auipc	ra,0xfffff
    8000249c:	168080e7          	jalr	360(ra) # 80001600 <_Z4putcc>
    int n = 100;
    int k = 100;
    int** matrix = (int**)mem_alloc(sizeof(int*) * n);
    800024a0:	32000513          	li	a0,800
    800024a4:	fffff097          	auipc	ra,0xfffff
    800024a8:	f10080e7          	jalr	-240(ra) # 800013b4 <_Z9mem_allocm>
    800024ac:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    800024b0:	00000493          	li	s1,0
    800024b4:	0080006f          	j	800024bc <_Z7memTestv+0x130>
    800024b8:	0014849b          	addiw	s1,s1,1
    800024bc:	06300793          	li	a5,99
    800024c0:	0497c663          	blt	a5,s1,8000250c <_Z7memTestv+0x180>
        matrix[i] = (int*)mem_alloc(sizeof(int) * k);
    800024c4:	00349a13          	slli	s4,s1,0x3
    800024c8:	01490a33          	add	s4,s2,s4
    800024cc:	19000513          	li	a0,400
    800024d0:	fffff097          	auipc	ra,0xfffff
    800024d4:	ee4080e7          	jalr	-284(ra) # 800013b4 <_Z9mem_allocm>
    800024d8:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    800024dc:	00000713          	li	a4,0
    800024e0:	06300793          	li	a5,99
    800024e4:	fce7cae3          	blt	a5,a4,800024b8 <_Z7memTestv+0x12c>
            matrix[i][j] = i * k + j;
    800024e8:	06400793          	li	a5,100
    800024ec:	029787bb          	mulw	a5,a5,s1
    800024f0:	000a3683          	ld	a3,0(s4)
    800024f4:	00271613          	slli	a2,a4,0x2
    800024f8:	00c686b3          	add	a3,a3,a2
    800024fc:	00e787bb          	addw	a5,a5,a4
    80002500:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80002504:	0017071b          	addiw	a4,a4,1
    80002508:	fd9ff06f          	j	800024e0 <_Z7memTestv+0x154>
        }
    }
    for(int i = 0; i < n; i++){
    8000250c:	00000a13          	li	s4,0
    80002510:	0780006f          	j	80002588 <_Z7memTestv+0x1fc>
        for(int j = 0; j < k; j++){
    80002514:	0014849b          	addiw	s1,s1,1
    80002518:	06300793          	li	a5,99
    8000251c:	0497ca63          	blt	a5,s1,80002570 <_Z7memTestv+0x1e4>
            assert(matrix[i][j] == i * k + j);
    80002520:	003a1793          	slli	a5,s4,0x3
    80002524:	00f907b3          	add	a5,s2,a5
    80002528:	0007b783          	ld	a5,0(a5)
    8000252c:	00249713          	slli	a4,s1,0x2
    80002530:	00e787b3          	add	a5,a5,a4
    80002534:	0007a703          	lw	a4,0(a5)
    80002538:	06400793          	li	a5,100
    8000253c:	034787bb          	mulw	a5,a5,s4
    80002540:	009787bb          	addw	a5,a5,s1
    80002544:	fcf708e3          	beq	a4,a5,80002514 <_Z7memTestv+0x188>
    80002548:	00006697          	auipc	a3,0x6
    8000254c:	b8868693          	addi	a3,a3,-1144 # 800080d0 <CONSOLE_STATUS+0xc0>
    80002550:	04300613          	li	a2,67
    80002554:	00006597          	auipc	a1,0x6
    80002558:	b8c58593          	addi	a1,a1,-1140 # 800080e0 <CONSOLE_STATUS+0xd0>
    8000255c:	00006517          	auipc	a0,0x6
    80002560:	b9c50513          	addi	a0,a0,-1124 # 800080f8 <CONSOLE_STATUS+0xe8>
    80002564:	fffff097          	auipc	ra,0xfffff
    80002568:	5a8080e7          	jalr	1448(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    8000256c:	fa9ff06f          	j	80002514 <_Z7memTestv+0x188>
        }
        mem_free(matrix[i]);
    80002570:	003a1793          	slli	a5,s4,0x3
    80002574:	00f907b3          	add	a5,s2,a5
    80002578:	0007b503          	ld	a0,0(a5)
    8000257c:	fffff097          	auipc	ra,0xfffff
    80002580:	e68080e7          	jalr	-408(ra) # 800013e4 <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    80002584:	001a0a1b          	addiw	s4,s4,1
    80002588:	06300793          	li	a5,99
    8000258c:	0147c663          	blt	a5,s4,80002598 <_Z7memTestv+0x20c>
        for(int j = 0; j < k; j++){
    80002590:	00000493          	li	s1,0
    80002594:	f85ff06f          	j	80002518 <_Z7memTestv+0x18c>
    }
    mem_free(matrix);
    80002598:	00090513          	mv	a0,s2
    8000259c:	fffff097          	auipc	ra,0xfffff
    800025a0:	e48080e7          	jalr	-440(ra) # 800013e4 <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    800025a4:	00007797          	auipc	a5,0x7
    800025a8:	c5c7b783          	ld	a5,-932(a5) # 80009200 <_GLOBAL_OFFSET_TABLE_+0x18>
    800025ac:	0007b503          	ld	a0,0(a5)
    800025b0:	00001097          	auipc	ra,0x1
    800025b4:	cb8080e7          	jalr	-840(ra) # 80003268 <_ZN11HeapManager17getHeapFreeMemoryEv>
    800025b8:	00050493          	mv	s1,a0
    putc('F');
    800025bc:	04600513          	li	a0,70
    800025c0:	fffff097          	auipc	ra,0xfffff
    800025c4:	040080e7          	jalr	64(ra) # 80001600 <_Z4putcc>
    putc('r');
    800025c8:	07200513          	li	a0,114
    800025cc:	fffff097          	auipc	ra,0xfffff
    800025d0:	034080e7          	jalr	52(ra) # 80001600 <_Z4putcc>
    putc('e');
    800025d4:	06500513          	li	a0,101
    800025d8:	fffff097          	auipc	ra,0xfffff
    800025dc:	028080e7          	jalr	40(ra) # 80001600 <_Z4putcc>
    putc('e');
    800025e0:	06500513          	li	a0,101
    800025e4:	fffff097          	auipc	ra,0xfffff
    800025e8:	01c080e7          	jalr	28(ra) # 80001600 <_Z4putcc>
    putc(' ');
    800025ec:	02000513          	li	a0,32
    800025f0:	fffff097          	auipc	ra,0xfffff
    800025f4:	010080e7          	jalr	16(ra) # 80001600 <_Z4putcc>
    putc('m');
    800025f8:	06d00513          	li	a0,109
    800025fc:	fffff097          	auipc	ra,0xfffff
    80002600:	004080e7          	jalr	4(ra) # 80001600 <_Z4putcc>
    putc('e');
    80002604:	06500513          	li	a0,101
    80002608:	fffff097          	auipc	ra,0xfffff
    8000260c:	ff8080e7          	jalr	-8(ra) # 80001600 <_Z4putcc>
    putc('m');
    80002610:	06d00513          	li	a0,109
    80002614:	fffff097          	auipc	ra,0xfffff
    80002618:	fec080e7          	jalr	-20(ra) # 80001600 <_Z4putcc>
    putc('o');
    8000261c:	06f00513          	li	a0,111
    80002620:	fffff097          	auipc	ra,0xfffff
    80002624:	fe0080e7          	jalr	-32(ra) # 80001600 <_Z4putcc>
    putc('r');
    80002628:	07200513          	li	a0,114
    8000262c:	fffff097          	auipc	ra,0xfffff
    80002630:	fd4080e7          	jalr	-44(ra) # 80001600 <_Z4putcc>
    putc('y');
    80002634:	07900513          	li	a0,121
    80002638:	fffff097          	auipc	ra,0xfffff
    8000263c:	fc8080e7          	jalr	-56(ra) # 80001600 <_Z4putcc>
    putc(':');
    80002640:	03a00513          	li	a0,58
    80002644:	fffff097          	auipc	ra,0xfffff
    80002648:	fbc080e7          	jalr	-68(ra) # 80001600 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    8000264c:	00f00913          	li	s2,15
    80002650:	0140006f          	j	80002664 <_Z7memTestv+0x2d8>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002654:	05750513          	addi	a0,a0,87
    80002658:	fffff097          	auipc	ra,0xfffff
    8000265c:	fa8080e7          	jalr	-88(ra) # 80001600 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002660:	fff9091b          	addiw	s2,s2,-1
    80002664:	02094463          	bltz	s2,8000268c <_Z7memTestv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    80002668:	0029151b          	slliw	a0,s2,0x2
    8000266c:	00a4d533          	srl	a0,s1,a0
    80002670:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002674:	00900793          	li	a5,9
    80002678:	fca7cee3          	blt	a5,a0,80002654 <_Z7memTestv+0x2c8>
            putc('0' + digit);
    8000267c:	03050513          	addi	a0,a0,48
    80002680:	fffff097          	auipc	ra,0xfffff
    80002684:	f80080e7          	jalr	-128(ra) # 80001600 <_Z4putcc>
    80002688:	fd9ff06f          	j	80002660 <_Z7memTestv+0x2d4>
        }
    }
    putc('\n');
    8000268c:	00a00513          	li	a0,10
    80002690:	fffff097          	auipc	ra,0xfffff
    80002694:	f70080e7          	jalr	-144(ra) # 80001600 <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    80002698:	409989b3          	sub	s3,s3,s1
    putc('D');
    8000269c:	04400513          	li	a0,68
    800026a0:	fffff097          	auipc	ra,0xfffff
    800026a4:	f60080e7          	jalr	-160(ra) # 80001600 <_Z4putcc>
    putc('i');
    800026a8:	06900513          	li	a0,105
    800026ac:	fffff097          	auipc	ra,0xfffff
    800026b0:	f54080e7          	jalr	-172(ra) # 80001600 <_Z4putcc>
    putc('f');
    800026b4:	06600513          	li	a0,102
    800026b8:	fffff097          	auipc	ra,0xfffff
    800026bc:	f48080e7          	jalr	-184(ra) # 80001600 <_Z4putcc>
    putc('f');
    800026c0:	06600513          	li	a0,102
    800026c4:	fffff097          	auipc	ra,0xfffff
    800026c8:	f3c080e7          	jalr	-196(ra) # 80001600 <_Z4putcc>
    putc('e');
    800026cc:	06500513          	li	a0,101
    800026d0:	fffff097          	auipc	ra,0xfffff
    800026d4:	f30080e7          	jalr	-208(ra) # 80001600 <_Z4putcc>
    putc('r');
    800026d8:	07200513          	li	a0,114
    800026dc:	fffff097          	auipc	ra,0xfffff
    800026e0:	f24080e7          	jalr	-220(ra) # 80001600 <_Z4putcc>
    putc('e');
    800026e4:	06500513          	li	a0,101
    800026e8:	fffff097          	auipc	ra,0xfffff
    800026ec:	f18080e7          	jalr	-232(ra) # 80001600 <_Z4putcc>
    putc('n');
    800026f0:	06e00513          	li	a0,110
    800026f4:	fffff097          	auipc	ra,0xfffff
    800026f8:	f0c080e7          	jalr	-244(ra) # 80001600 <_Z4putcc>
    putc('c');
    800026fc:	06300513          	li	a0,99
    80002700:	fffff097          	auipc	ra,0xfffff
    80002704:	f00080e7          	jalr	-256(ra) # 80001600 <_Z4putcc>
    putc('e');
    80002708:	06500513          	li	a0,101
    8000270c:	fffff097          	auipc	ra,0xfffff
    80002710:	ef4080e7          	jalr	-268(ra) # 80001600 <_Z4putcc>
    putc(':');
    80002714:	03a00513          	li	a0,58
    80002718:	fffff097          	auipc	ra,0xfffff
    8000271c:	ee8080e7          	jalr	-280(ra) # 80001600 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002720:	00f00493          	li	s1,15
    80002724:	0140006f          	j	80002738 <_Z7memTestv+0x3ac>
        int digit = (difference >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002728:	05750513          	addi	a0,a0,87
    8000272c:	fffff097          	auipc	ra,0xfffff
    80002730:	ed4080e7          	jalr	-300(ra) # 80001600 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002734:	fff4849b          	addiw	s1,s1,-1
    80002738:	0204c463          	bltz	s1,80002760 <_Z7memTestv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    8000273c:	0024951b          	slliw	a0,s1,0x2
    80002740:	00a9d533          	srl	a0,s3,a0
    80002744:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002748:	00900793          	li	a5,9
    8000274c:	fca7cee3          	blt	a5,a0,80002728 <_Z7memTestv+0x39c>
            putc('0' + digit);
    80002750:	03050513          	addi	a0,a0,48
    80002754:	fffff097          	auipc	ra,0xfffff
    80002758:	eac080e7          	jalr	-340(ra) # 80001600 <_Z4putcc>
    8000275c:	fd9ff06f          	j	80002734 <_Z7memTestv+0x3a8>
        }
    }
    putc('\n');
    80002760:	00a00513          	li	a0,10
    80002764:	fffff097          	auipc	ra,0xfffff
    80002768:	e9c080e7          	jalr	-356(ra) # 80001600 <_Z4putcc>
    putc('\n');
    8000276c:	00a00513          	li	a0,10
    80002770:	fffff097          	auipc	ra,0xfffff
    80002774:	e90080e7          	jalr	-368(ra) # 80001600 <_Z4putcc>
    putc('\n');
    80002778:	00a00513          	li	a0,10
    8000277c:	fffff097          	auipc	ra,0xfffff
    80002780:	e84080e7          	jalr	-380(ra) # 80001600 <_Z4putcc>
}
    80002784:	02813083          	ld	ra,40(sp)
    80002788:	02013403          	ld	s0,32(sp)
    8000278c:	01813483          	ld	s1,24(sp)
    80002790:	01013903          	ld	s2,16(sp)
    80002794:	00813983          	ld	s3,8(sp)
    80002798:	00013a03          	ld	s4,0(sp)
    8000279c:	03010113          	addi	sp,sp,48
    800027a0:	00008067          	ret

00000000800027a4 <_Z8usermainPv>:

void usermain(void* arg){
    800027a4:	fd010113          	addi	sp,sp,-48
    800027a8:	02113423          	sd	ra,40(sp)
    800027ac:	02813023          	sd	s0,32(sp)
    800027b0:	00913c23          	sd	s1,24(sp)
    800027b4:	03010413          	addi	s0,sp,48
    memTest();    
    800027b8:	00000097          	auipc	ra,0x0
    800027bc:	bd4080e7          	jalr	-1068(ra) # 8000238c <_Z7memTestv>
    putc('0');
    800027c0:	03000513          	li	a0,48
    800027c4:	fffff097          	auipc	ra,0xfffff
    800027c8:	e3c080e7          	jalr	-452(ra) # 80001600 <_Z4putcc>
    thread_t t1, t2;
    sem_open(&sem1, 0);
    800027cc:	00007497          	auipc	s1,0x7
    800027d0:	ab448493          	addi	s1,s1,-1356 # 80009280 <sem1>
    800027d4:	00000593          	li	a1,0
    800027d8:	00048513          	mv	a0,s1
    800027dc:	fffff097          	auipc	ra,0xfffff
    800027e0:	d40080e7          	jalr	-704(ra) # 8000151c <_Z8sem_openPP4_semj>
    sem_open(&sem2, 0);
    800027e4:	00000593          	li	a1,0
    800027e8:	00007517          	auipc	a0,0x7
    800027ec:	aa050513          	addi	a0,a0,-1376 # 80009288 <sem2>
    800027f0:	fffff097          	auipc	ra,0xfffff
    800027f4:	d2c080e7          	jalr	-724(ra) # 8000151c <_Z8sem_openPP4_semj>
    thread_create(&t1, thread_test_1, 0);
    800027f8:	00000613          	li	a2,0
    800027fc:	00000597          	auipc	a1,0x0
    80002800:	aa058593          	addi	a1,a1,-1376 # 8000229c <_Z13thread_test_1Pv>
    80002804:	fd840513          	addi	a0,s0,-40
    80002808:	fffff097          	auipc	ra,0xfffff
    8000280c:	c08080e7          	jalr	-1016(ra) # 80001410 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002810:	00000613          	li	a2,0
    80002814:	00000597          	auipc	a1,0x0
    80002818:	af458593          	addi	a1,a1,-1292 # 80002308 <_Z13thread_test_2Pv>
    8000281c:	fd040513          	addi	a0,s0,-48
    80002820:	fffff097          	auipc	ra,0xfffff
    80002824:	bf0080e7          	jalr	-1040(ra) # 80001410 <_Z13thread_createPP7_threadPFvPvES2_>
    sem_wait(sem1);
    80002828:	0004b503          	ld	a0,0(s1)
    8000282c:	fffff097          	auipc	ra,0xfffff
    80002830:	d54080e7          	jalr	-684(ra) # 80001580 <_Z8sem_waitP4_sem>
    putc('3');
    80002834:	03300513          	li	a0,51
    80002838:	fffff097          	auipc	ra,0xfffff
    8000283c:	dc8080e7          	jalr	-568(ra) # 80001600 <_Z4putcc>
    // thread_join(t2);
    // if(getc() == 'a')putc('x');
    putc('4');
    80002840:	03400513          	li	a0,52
    80002844:	fffff097          	auipc	ra,0xfffff
    80002848:	dbc080e7          	jalr	-580(ra) # 80001600 <_Z4putcc>
    thread_join(t1);
    8000284c:	fd843503          	ld	a0,-40(s0)
    80002850:	fffff097          	auipc	ra,0xfffff
    80002854:	c7c080e7          	jalr	-900(ra) # 800014cc <_Z11thread_joinP7_thread>
    // thread_dispatch();
    // thread_dispatch();
    sem_wait(sem2);
    80002858:	0084b503          	ld	a0,8(s1)
    8000285c:	fffff097          	auipc	ra,0xfffff
    80002860:	d24080e7          	jalr	-732(ra) # 80001580 <_Z8sem_waitP4_sem>
    putc('5');
    80002864:	03500513          	li	a0,53
    80002868:	fffff097          	auipc	ra,0xfffff
    8000286c:	d98080e7          	jalr	-616(ra) # 80001600 <_Z4putcc>
    sem_close(sem1);
    80002870:	0004b503          	ld	a0,0(s1)
    80002874:	fffff097          	auipc	ra,0xfffff
    80002878:	ce0080e7          	jalr	-800(ra) # 80001554 <_Z9sem_closeP4_sem>
    sem_close(sem2);
    8000287c:	0084b503          	ld	a0,8(s1)
    80002880:	fffff097          	auipc	ra,0xfffff
    80002884:	cd4080e7          	jalr	-812(ra) # 80001554 <_Z9sem_closeP4_sem>


    putc('\n');
    80002888:	00a00513          	li	a0,10
    8000288c:	fffff097          	auipc	ra,0xfffff
    80002890:	d74080e7          	jalr	-652(ra) # 80001600 <_Z4putcc>
    80002894:	02813083          	ld	ra,40(sp)
    80002898:	02013403          	ld	s0,32(sp)
    8000289c:	01813483          	ld	s1,24(sp)
    800028a0:	03010113          	addi	sp,sp,48
    800028a4:	00008067          	ret

00000000800028a8 <_ZN7_threadC1EPFvPvES0_>:
#include "syscalls_c.h"
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    800028a8:	ff010113          	addi	sp,sp,-16
    800028ac:	00813423          	sd	s0,8(sp)
    800028b0:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    800028b4:	00053023          	sd	zero,0(a0)
    800028b8:	00053423          	sd	zero,8(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    800028bc:	00007717          	auipc	a4,0x7
    800028c0:	9d470713          	addi	a4,a4,-1580 # 80009290 <_ZN7_thread6nextIDE>
    800028c4:	00072783          	lw	a5,0(a4)
    800028c8:	0017869b          	addiw	a3,a5,1
    800028cc:	00d72023          	sw	a3,0(a4)
    800028d0:	08f52c23          	sw	a5,152(a0)
    closed = 0;
    800028d4:	09c52783          	lw	a5,156(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    800028d8:	0015b593          	seqz	a1,a1
    800028dc:	0045959b          	slliw	a1,a1,0x4
    800028e0:	fe07f793          	andi	a5,a5,-32
    800028e4:	00b7e7b3          	or	a5,a5,a1
    800028e8:	08f52e23          	sw	a5,156(a0)
    reserved = 0;
    800028ec:	0a052783          	lw	a5,160(a0)
    800028f0:	f0000737          	lui	a4,0xf0000
    800028f4:	00e7f7b3          	and	a5,a5,a4
    800028f8:	0af52023          	sw	a5,160(a0)
    joinHead = 0;
    800028fc:	06053c23          	sd	zero,120(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    80002900:	00200793          	li	a5,2
    80002904:	08f53423          	sd	a5,136(a0)
    stackStart = 0;
    80002908:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    8000290c:	00053823          	sd	zero,16(a0)
    context.s1 = 0;
    80002910:	00053c23          	sd	zero,24(a0)
    context.s2 = 0;
    80002914:	02053023          	sd	zero,32(a0)
    context.s3 = 0;
    80002918:	02053423          	sd	zero,40(a0)
    context.s4 = 0;
    8000291c:	02053823          	sd	zero,48(a0)
    context.s5 = 0;
    80002920:	02053c23          	sd	zero,56(a0)
    context.s6 = 0;
    80002924:	04053023          	sd	zero,64(a0)
    context.s7 = 0;
    80002928:	04053423          	sd	zero,72(a0)
    context.s8 = 0;
    8000292c:	04053823          	sd	zero,80(a0)
    context.s9 = 0;
    80002930:	04053c23          	sd	zero,88(a0)
    context.s10 = 0;
    80002934:	06053023          	sd	zero,96(a0)
    context.s11 = 0;
    80002938:	06053423          	sd	zero,104(a0)

    context.sstatus = 0;
    8000293c:	06053823          	sd	zero,112(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002940:	00000797          	auipc	a5,0x0
    80002944:	54c78793          	addi	a5,a5,1356 # 80002e8c <_ZN7_thread7wrapperEv>
    80002948:	00f53023          	sd	a5,0(a0)
}
    8000294c:	00813403          	ld	s0,8(sp)
    80002950:	01010113          	addi	sp,sp,16
    80002954:	00008067          	ret

0000000080002958 <_Z10popSppSpieb>:

void popSppSpie(bool kernel = false){
    80002958:	ff010113          	addi	sp,sp,-16
    8000295c:	00813423          	sd	s0,8(sp)
    80002960:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002964:	14109073          	csrw	sepc,ra
    if(kernel){
    80002968:	00050e63          	beqz	a0,80002984 <_Z10popSppSpieb+0x2c>
        __asm__ volatile ("csrs sstatus, %0" :: "r" (1 << 8));
    8000296c:	10000793          	li	a5,256
    80002970:	1007a073          	csrs	sstatus,a5
    }else{
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    }
    __asm__ volatile ("sret");
    80002974:	10200073          	sret
}
    80002978:	00813403          	ld	s0,8(sp)
    8000297c:	01010113          	addi	sp,sp,16
    80002980:	00008067          	ret
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002984:	10000793          	li	a5,256
    80002988:	1007b073          	csrc	sstatus,a5
    8000298c:	fe9ff06f          	j	80002974 <_Z10popSppSpieb+0x1c>

0000000080002990 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002990:	fe010113          	addi	sp,sp,-32
    80002994:	00113c23          	sd	ra,24(sp)
    80002998:	00813823          	sd	s0,16(sp)
    8000299c:	00913423          	sd	s1,8(sp)
    800029a0:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    800029a4:	07853483          	ld	s1,120(a0)
    while(current != 0){
    800029a8:	0c048663          	beqz	s1,80002a74 <_ZN7_thread6unJoinEv+0xe4>
        thread_t thread = current->thread;
    800029ac:	0004c503          	lbu	a0,0(s1)
    800029b0:	0014c783          	lbu	a5,1(s1)
    800029b4:	00879793          	slli	a5,a5,0x8
    800029b8:	00a7e7b3          	or	a5,a5,a0
    800029bc:	0024c503          	lbu	a0,2(s1)
    800029c0:	01051513          	slli	a0,a0,0x10
    800029c4:	00f567b3          	or	a5,a0,a5
    800029c8:	0034c503          	lbu	a0,3(s1)
    800029cc:	01851513          	slli	a0,a0,0x18
    800029d0:	00f56533          	or	a0,a0,a5
    800029d4:	0044c783          	lbu	a5,4(s1)
    800029d8:	02079793          	slli	a5,a5,0x20
    800029dc:	00a7e533          	or	a0,a5,a0
    800029e0:	0054c783          	lbu	a5,5(s1)
    800029e4:	02879793          	slli	a5,a5,0x28
    800029e8:	00a7e7b3          	or	a5,a5,a0
    800029ec:	0064c503          	lbu	a0,6(s1)
    800029f0:	03051513          	slli	a0,a0,0x30
    800029f4:	00f567b3          	or	a5,a0,a5
    800029f8:	0074c503          	lbu	a0,7(s1)
    800029fc:	03851513          	slli	a0,a0,0x38
    80002a00:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80002a04:	09c52783          	lw	a5,156(a0)
    80002a08:	ffd7f793          	andi	a5,a5,-3
    80002a0c:	08f52e23          	sw	a5,156(a0)
        Scheduler::put(thread);
    80002a10:	00002097          	auipc	ra,0x2
    80002a14:	0d4080e7          	jalr	212(ra) # 80004ae4 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80002a18:	0084c703          	lbu	a4,8(s1)
    80002a1c:	0094c783          	lbu	a5,9(s1)
    80002a20:	00879793          	slli	a5,a5,0x8
    80002a24:	00e7e733          	or	a4,a5,a4
    80002a28:	00a4c783          	lbu	a5,10(s1)
    80002a2c:	01079793          	slli	a5,a5,0x10
    80002a30:	00e7e7b3          	or	a5,a5,a4
    80002a34:	00b4c703          	lbu	a4,11(s1)
    80002a38:	01871713          	slli	a4,a4,0x18
    80002a3c:	00f767b3          	or	a5,a4,a5
    80002a40:	00c4c703          	lbu	a4,12(s1)
    80002a44:	02071713          	slli	a4,a4,0x20
    80002a48:	00f76733          	or	a4,a4,a5
    80002a4c:	00d4c783          	lbu	a5,13(s1)
    80002a50:	02879793          	slli	a5,a5,0x28
    80002a54:	00e7e733          	or	a4,a5,a4
    80002a58:	00e4c783          	lbu	a5,14(s1)
    80002a5c:	03079793          	slli	a5,a5,0x30
    80002a60:	00e7e7b3          	or	a5,a5,a4
    80002a64:	00f4c483          	lbu	s1,15(s1)
    80002a68:	03849493          	slli	s1,s1,0x38
    80002a6c:	00f4e4b3          	or	s1,s1,a5
    while(current != 0){
    80002a70:	f39ff06f          	j	800029a8 <_ZN7_thread6unJoinEv+0x18>
        // mem_free(current);
        current = next;
    }
}
    80002a74:	01813083          	ld	ra,24(sp)
    80002a78:	01013403          	ld	s0,16(sp)
    80002a7c:	00813483          	ld	s1,8(sp)
    80002a80:	02010113          	addi	sp,sp,32
    80002a84:	00008067          	ret

0000000080002a88 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80002a88:	fc010113          	addi	sp,sp,-64
    80002a8c:	02113c23          	sd	ra,56(sp)
    80002a90:	02813823          	sd	s0,48(sp)
    80002a94:	02913423          	sd	s1,40(sp)
    80002a98:	03213023          	sd	s2,32(sp)
    80002a9c:	01313c23          	sd	s3,24(sp)
    80002aa0:	01413823          	sd	s4,16(sp)
    80002aa4:	01513423          	sd	s5,8(sp)
    80002aa8:	04010413          	addi	s0,sp,64
    80002aac:	00050493          	mv	s1,a0
    80002ab0:	00058913          	mv	s2,a1
    80002ab4:	00060a93          	mv	s5,a2
    80002ab8:	00068993          	mv	s3,a3
    80002abc:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    80002ac0:	0b800513          	li	a0,184
    80002ac4:	fffff097          	auipc	ra,0xfffff
    80002ac8:	8f0080e7          	jalr	-1808(ra) # 800013b4 <_Z9mem_allocm>
    80002acc:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80002ad0:	18050063          	beqz	a0,80002c50 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    80002ad4:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    80002ad8:	0004b783          	ld	a5,0(s1)
    80002adc:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80002ae0:	00006717          	auipc	a4,0x6
    80002ae4:	7b070713          	addi	a4,a4,1968 # 80009290 <_ZN7_thread6nextIDE>
    80002ae8:	00072783          	lw	a5,0(a4)
    80002aec:	0017869b          	addiw	a3,a5,1
    80002af0:	00d72023          	sw	a3,0(a4)
    80002af4:	0004b703          	ld	a4,0(s1)
    80002af8:	08f72c23          	sw	a5,152(a4)
    (*thread)->closed = false;
    80002afc:	0004b703          	ld	a4,0(s1)
    80002b00:	09c72783          	lw	a5,156(a4)
    80002b04:	ffe7f793          	andi	a5,a5,-2
    80002b08:	08f72e23          	sw	a5,156(a4)
    (*thread)->blocked = false;
    80002b0c:	0004b703          	ld	a4,0(s1)
    80002b10:	09c72783          	lw	a5,156(a4)
    80002b14:	ffd7f793          	andi	a5,a5,-3
    80002b18:	08f72e23          	sw	a5,156(a4)
    (*thread)->sleeping = false;
    80002b1c:	0004b703          	ld	a4,0(s1)
    80002b20:	09c72783          	lw	a5,156(a4)
    80002b24:	ffb7f793          	andi	a5,a5,-5
    80002b28:	08f72e23          	sw	a5,156(a4)
    (*thread)->finished = false;
    80002b2c:	0004b703          	ld	a4,0(s1)
    80002b30:	09c72783          	lw	a5,156(a4)
    80002b34:	ff77f793          	andi	a5,a5,-9
    80002b38:	08f72e23          	sw	a5,156(a4)
    (*thread)->kernel = (function == 0);
    80002b3c:	0004b703          	ld	a4,0(s1)
    80002b40:	00193913          	seqz	s2,s2
    80002b44:	0049191b          	slliw	s2,s2,0x4
    80002b48:	09c72783          	lw	a5,156(a4)
    80002b4c:	fef7f793          	andi	a5,a5,-17
    80002b50:	0127e933          	or	s2,a5,s2
    80002b54:	09272e23          	sw	s2,156(a4)
    (*thread)->reserved = 0;
    80002b58:	0004b703          	ld	a4,0(s1)
    80002b5c:	0a072783          	lw	a5,160(a4)
    80002b60:	f00006b7          	lui	a3,0xf0000
    80002b64:	00d7f7b3          	and	a5,a5,a3
    80002b68:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = 0;
    80002b6c:	0004b783          	ld	a5,0(s1)
    80002b70:	0607bc23          	sd	zero,120(a5)
    (*thread)->joinTail = 0;
    80002b74:	0004b783          	ld	a5,0(s1)
    80002b78:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    80002b7c:	0004b783          	ld	a5,0(s1)
    80002b80:	00200713          	li	a4,2
    80002b84:	08e7b423          	sd	a4,136(a5)
    (*thread)->stackStart = 0;
    80002b88:	0004b783          	ld	a5,0(s1)
    80002b8c:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    80002b90:	0004b783          	ld	a5,0(s1)
    80002b94:	0007b823          	sd	zero,16(a5)
    (*thread)->context.s1 = 0;
    80002b98:	0004b783          	ld	a5,0(s1)
    80002b9c:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s2 = 0;
    80002ba0:	0004b783          	ld	a5,0(s1)
    80002ba4:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s3 = 0;
    80002ba8:	0004b783          	ld	a5,0(s1)
    80002bac:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s4 = 0;
    80002bb0:	0004b783          	ld	a5,0(s1)
    80002bb4:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s5 = 0;
    80002bb8:	0004b783          	ld	a5,0(s1)
    80002bbc:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s6 = 0;
    80002bc0:	0004b783          	ld	a5,0(s1)
    80002bc4:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s7 = 0;
    80002bc8:	0004b783          	ld	a5,0(s1)
    80002bcc:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s8 = 0;
    80002bd0:	0004b783          	ld	a5,0(s1)
    80002bd4:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s9 = 0;
    80002bd8:	0004b783          	ld	a5,0(s1)
    80002bdc:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s10 = 0;
    80002be0:	0004b783          	ld	a5,0(s1)
    80002be4:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s11 = 0;
    80002be8:	0004b783          	ld	a5,0(s1)
    80002bec:	0607b423          	sd	zero,104(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80002bf0:	0004b783          	ld	a5,0(s1)
    80002bf4:	0137b423          	sd	s3,8(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80002bf8:	0004b783          	ld	a5,0(s1)
    80002bfc:	00000717          	auipc	a4,0x0
    80002c00:	29070713          	addi	a4,a4,656 # 80002e8c <_ZN7_thread7wrapperEv>
    80002c04:	00e7b023          	sd	a4,0(a5)

    (*thread)->stackStart = stack;
    80002c08:	0004b783          	ld	a5,0(s1)
    80002c0c:	0937b823          	sd	s3,144(a5)
    if(start){
    80002c10:	020a1663          	bnez	s4,80002c3c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    80002c14:	00000513          	li	a0,0
}
    80002c18:	03813083          	ld	ra,56(sp)
    80002c1c:	03013403          	ld	s0,48(sp)
    80002c20:	02813483          	ld	s1,40(sp)
    80002c24:	02013903          	ld	s2,32(sp)
    80002c28:	01813983          	ld	s3,24(sp)
    80002c2c:	01013a03          	ld	s4,16(sp)
    80002c30:	00813a83          	ld	s5,8(sp)
    80002c34:	04010113          	addi	sp,sp,64
    80002c38:	00008067          	ret
        Scheduler::put(*thread);
    80002c3c:	0004b503          	ld	a0,0(s1)
    80002c40:	00002097          	auipc	ra,0x2
    80002c44:	ea4080e7          	jalr	-348(ra) # 80004ae4 <_ZN9Scheduler3putEP7_thread>
    return 0;
    80002c48:	00000513          	li	a0,0
    80002c4c:	fcdff06f          	j	80002c18 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    80002c50:	fff00513          	li	a0,-1
    80002c54:	fc5ff06f          	j	80002c18 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

0000000080002c58 <_ZN7_thread4joinEPS_>:

void _thread::join(thread_t thread){
    80002c58:	fe010113          	addi	sp,sp,-32
    80002c5c:	00113c23          	sd	ra,24(sp)
    80002c60:	00813823          	sd	s0,16(sp)
    80002c64:	00913423          	sd	s1,8(sp)
    80002c68:	01213023          	sd	s2,0(sp)
    80002c6c:	02010413          	addi	s0,sp,32
    80002c70:	00050493          	mv	s1,a0
    80002c74:	00058913          	mv	s2,a1
    /// cannot join to a finished or closed thread
    __putc('j');
    80002c78:	06a00513          	li	a0,106
    80002c7c:	00004097          	auipc	ra,0x4
    80002c80:	2a0080e7          	jalr	672(ra) # 80006f1c <__putc>
    if(thread->finished || thread->closed){
    80002c84:	09893783          	ld	a5,152(s2)
    80002c88:	00900713          	li	a4,9
    80002c8c:	02071713          	slli	a4,a4,0x20
    80002c90:	00e7f7b3          	and	a5,a5,a4
    80002c94:	00078e63          	beqz	a5,80002cb0 <_ZN7_thread4joinEPS_+0x58>
        thread->joinTail->next = newJoin;
        thread->joinTail = newJoin;
    }
    // Scheduler::remove(this);
    thread_dispatch();
}
    80002c98:	01813083          	ld	ra,24(sp)
    80002c9c:	01013403          	ld	s0,16(sp)
    80002ca0:	00813483          	ld	s1,8(sp)
    80002ca4:	00013903          	ld	s2,0(sp)
    80002ca8:	02010113          	addi	sp,sp,32
    80002cac:	00008067          	ret
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    80002cb0:	01000513          	li	a0,16
    80002cb4:	ffffe097          	auipc	ra,0xffffe
    80002cb8:	700080e7          	jalr	1792(ra) # 800013b4 <_Z9mem_allocm>
    this->blocked = true;
    80002cbc:	09c4a703          	lw	a4,156(s1)
    80002cc0:	00276713          	ori	a4,a4,2
    80002cc4:	08e4ae23          	sw	a4,156(s1)
    newJoin->thread = this;
    80002cc8:	00950023          	sb	s1,0(a0)
    80002ccc:	0084d713          	srli	a4,s1,0x8
    80002cd0:	00e500a3          	sb	a4,1(a0)
    80002cd4:	0104d713          	srli	a4,s1,0x10
    80002cd8:	00e50123          	sb	a4,2(a0)
    80002cdc:	0184d71b          	srliw	a4,s1,0x18
    80002ce0:	00e501a3          	sb	a4,3(a0)
    80002ce4:	0204d713          	srli	a4,s1,0x20
    80002ce8:	00e50223          	sb	a4,4(a0)
    80002cec:	0284d713          	srli	a4,s1,0x28
    80002cf0:	00e502a3          	sb	a4,5(a0)
    80002cf4:	0304d713          	srli	a4,s1,0x30
    80002cf8:	00e50323          	sb	a4,6(a0)
    80002cfc:	0384d493          	srli	s1,s1,0x38
    80002d00:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80002d04:	00050423          	sb	zero,8(a0)
    80002d08:	000504a3          	sb	zero,9(a0)
    80002d0c:	00050523          	sb	zero,10(a0)
    80002d10:	000505a3          	sb	zero,11(a0)
    80002d14:	00050623          	sb	zero,12(a0)
    80002d18:	000506a3          	sb	zero,13(a0)
    80002d1c:	00050723          	sb	zero,14(a0)
    80002d20:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    80002d24:	07893703          	ld	a4,120(s2)
    80002d28:	04070a63          	beqz	a4,80002d7c <_ZN7_thread4joinEPS_+0x124>
        thread->joinTail->next = newJoin;
    80002d2c:	08093703          	ld	a4,128(s2)
    80002d30:	00a70423          	sb	a0,8(a4)
    80002d34:	00855693          	srli	a3,a0,0x8
    80002d38:	00d704a3          	sb	a3,9(a4)
    80002d3c:	01055693          	srli	a3,a0,0x10
    80002d40:	00d70523          	sb	a3,10(a4)
    80002d44:	0185569b          	srliw	a3,a0,0x18
    80002d48:	00d705a3          	sb	a3,11(a4)
    80002d4c:	02055693          	srli	a3,a0,0x20
    80002d50:	00d70623          	sb	a3,12(a4)
    80002d54:	02855693          	srli	a3,a0,0x28
    80002d58:	00d706a3          	sb	a3,13(a4)
    80002d5c:	03055693          	srli	a3,a0,0x30
    80002d60:	00d70723          	sb	a3,14(a4)
    80002d64:	03855693          	srli	a3,a0,0x38
    80002d68:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    80002d6c:	08a93023          	sd	a0,128(s2)
    thread_dispatch();
    80002d70:	ffffe097          	auipc	ra,0xffffe
    80002d74:	73c080e7          	jalr	1852(ra) # 800014ac <_Z15thread_dispatchv>
    80002d78:	f21ff06f          	j	80002c98 <_ZN7_thread4joinEPS_+0x40>
        thread->joinHead = newJoin;
    80002d7c:	06a93c23          	sd	a0,120(s2)
        thread->joinTail = newJoin;
    80002d80:	08a93023          	sd	a0,128(s2)
    80002d84:	fedff06f          	j	80002d70 <_ZN7_thread4joinEPS_+0x118>

0000000080002d88 <_ZN7_thread4tickEv>:

int _thread::tick(){
    if(currentThread->blocked){
    80002d88:	00006797          	auipc	a5,0x6
    80002d8c:	5107b783          	ld	a5,1296(a5) # 80009298 <_ZN7_thread13currentThreadE>
    80002d90:	09c7a783          	lw	a5,156(a5)
    80002d94:	0027f713          	andi	a4,a5,2
    80002d98:	06071063          	bnez	a4,80002df8 <_ZN7_thread4tickEv+0x70>
        return -1;
    }
    if(currentThread->closed){
    80002d9c:	0017f713          	andi	a4,a5,1
    80002da0:	06071063          	bnez	a4,80002e00 <_ZN7_thread4tickEv+0x78>
        return -2;
    }
    if(currentThread->sleeping){
    80002da4:	0047f713          	andi	a4,a5,4
    80002da8:	06071063          	bnez	a4,80002e08 <_ZN7_thread4tickEv+0x80>
        return -3;
    }
    if(currentThread->finished){
    80002dac:	0087f793          	andi	a5,a5,8
    80002db0:	06079063          	bnez	a5,80002e10 <_ZN7_thread4tickEv+0x88>
        return -4;
    }
    timeLeft --;
    80002db4:	08853783          	ld	a5,136(a0)
    80002db8:	fff78793          	addi	a5,a5,-1
    80002dbc:	08f53423          	sd	a5,136(a0)
    if(timeLeft == 0){
    80002dc0:	00078663          	beqz	a5,80002dcc <_ZN7_thread4tickEv+0x44>
        // __putc('d');
        // __putc('0' + currentThread->ID);
        // __putc('\n');
        thread_dispatch();
    }
    return 0;
    80002dc4:	00000513          	li	a0,0
}
    80002dc8:	00008067          	ret
int _thread::tick(){
    80002dcc:	ff010113          	addi	sp,sp,-16
    80002dd0:	00113423          	sd	ra,8(sp)
    80002dd4:	00813023          	sd	s0,0(sp)
    80002dd8:	01010413          	addi	s0,sp,16
        thread_dispatch();
    80002ddc:	ffffe097          	auipc	ra,0xffffe
    80002de0:	6d0080e7          	jalr	1744(ra) # 800014ac <_Z15thread_dispatchv>
    return 0;
    80002de4:	00000513          	li	a0,0
}
    80002de8:	00813083          	ld	ra,8(sp)
    80002dec:	00013403          	ld	s0,0(sp)
    80002df0:	01010113          	addi	sp,sp,16
    80002df4:	00008067          	ret
        return -1;
    80002df8:	fff00513          	li	a0,-1
    80002dfc:	00008067          	ret
        return -2;
    80002e00:	ffe00513          	li	a0,-2
    80002e04:	00008067          	ret
        return -3;
    80002e08:	ffd00513          	li	a0,-3
    80002e0c:	00008067          	ret
        return -4;
    80002e10:	ffc00513          	li	a0,-4
    80002e14:	00008067          	ret

0000000080002e18 <_ZN7_thread4exitEv>:

int _thread::exit(){
    if(currentThread->closed){
    80002e18:	00006717          	auipc	a4,0x6
    80002e1c:	48073703          	ld	a4,1152(a4) # 80009298 <_ZN7_thread13currentThreadE>
    80002e20:	09c72783          	lw	a5,156(a4)
    80002e24:	0017f693          	andi	a3,a5,1
    80002e28:	04069663          	bnez	a3,80002e74 <_ZN7_thread4exitEv+0x5c>
        return -1;
    }
    if(currentThread->blocked){
    80002e2c:	0027f693          	andi	a3,a5,2
    80002e30:	04069663          	bnez	a3,80002e7c <_ZN7_thread4exitEv+0x64>
        return -2;
    }
    if(currentThread->sleeping){
    80002e34:	0047f793          	andi	a5,a5,4
    80002e38:	04079663          	bnez	a5,80002e84 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    80002e3c:	ff010113          	addi	sp,sp,-16
    80002e40:	00113423          	sd	ra,8(sp)
    80002e44:	00813023          	sd	s0,0(sp)
    80002e48:	01010413          	addi	s0,sp,16
        return -3;
    }
    currentThread->finished = 1;
    80002e4c:	09c72783          	lw	a5,156(a4)
    80002e50:	0087e793          	ori	a5,a5,8
    80002e54:	08f72e23          	sw	a5,156(a4)
    thread_dispatch();
    80002e58:	ffffe097          	auipc	ra,0xffffe
    80002e5c:	654080e7          	jalr	1620(ra) # 800014ac <_Z15thread_dispatchv>
    return 0;
    80002e60:	00000513          	li	a0,0
}
    80002e64:	00813083          	ld	ra,8(sp)
    80002e68:	00013403          	ld	s0,0(sp)
    80002e6c:	01010113          	addi	sp,sp,16
    80002e70:	00008067          	ret
        return -1;
    80002e74:	fff00513          	li	a0,-1
    80002e78:	00008067          	ret
        return -2;
    80002e7c:	ffe00513          	li	a0,-2
    80002e80:	00008067          	ret
        return -3;
    80002e84:	ffd00513          	li	a0,-3
}
    80002e88:	00008067          	ret

0000000080002e8c <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80002e8c:	fe010113          	addi	sp,sp,-32
    80002e90:	00113c23          	sd	ra,24(sp)
    80002e94:	00813823          	sd	s0,16(sp)
    80002e98:	00913423          	sd	s1,8(sp)
    80002e9c:	02010413          	addi	s0,sp,32
    popSppSpie(currentThread->kernel);
    80002ea0:	00006497          	auipc	s1,0x6
    80002ea4:	3f048493          	addi	s1,s1,1008 # 80009290 <_ZN7_thread6nextIDE>
    80002ea8:	0084b783          	ld	a5,8(s1)
    80002eac:	09c7a503          	lw	a0,156(a5)
    80002eb0:	4045551b          	sraiw	a0,a0,0x4
    80002eb4:	00157513          	andi	a0,a0,1
    80002eb8:	00000097          	auipc	ra,0x0
    80002ebc:	aa0080e7          	jalr	-1376(ra) # 80002958 <_Z10popSppSpieb>
    currentThread->function(currentThread->arg);
    80002ec0:	0084b783          	ld	a5,8(s1)
    80002ec4:	0a87b703          	ld	a4,168(a5)
    80002ec8:	0b07b503          	ld	a0,176(a5)
    80002ecc:	000700e7          	jalr	a4
    currentThread->unJoin();
    80002ed0:	0084b503          	ld	a0,8(s1)
    80002ed4:	00000097          	auipc	ra,0x0
    80002ed8:	abc080e7          	jalr	-1348(ra) # 80002990 <_ZN7_thread6unJoinEv>
    exit();
    80002edc:	00000097          	auipc	ra,0x0
    80002ee0:	f3c080e7          	jalr	-196(ra) # 80002e18 <_ZN7_thread4exitEv>
}
    80002ee4:	01813083          	ld	ra,24(sp)
    80002ee8:	01013403          	ld	s0,16(sp)
    80002eec:	00813483          	ld	s1,8(sp)
    80002ef0:	02010113          	addi	sp,sp,32
    80002ef4:	00008067          	ret

0000000080002ef8 <_ZN7_thread10setBlockedEb>:

void _thread::setBlocked(bool blocked){
    80002ef8:	ff010113          	addi	sp,sp,-16
    80002efc:	00813423          	sd	s0,8(sp)
    80002f00:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80002f04:	0015f593          	andi	a1,a1,1
    80002f08:	0015979b          	slliw	a5,a1,0x1
    80002f0c:	09c52583          	lw	a1,156(a0)
    80002f10:	ffd5f593          	andi	a1,a1,-3
    80002f14:	00f5e5b3          	or	a1,a1,a5
    80002f18:	08b52e23          	sw	a1,156(a0)
}
    80002f1c:	00813403          	ld	s0,8(sp)
    80002f20:	01010113          	addi	sp,sp,16
    80002f24:	00008067          	ret

0000000080002f28 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80002f28:	ff010113          	addi	sp,sp,-16
    80002f2c:	00813423          	sd	s0,8(sp)
    80002f30:	01010413          	addi	s0,sp,16
    this->closed = closed;
    80002f34:	0015f793          	andi	a5,a1,1
    80002f38:	09c52583          	lw	a1,156(a0)
    80002f3c:	ffe5f593          	andi	a1,a1,-2
    80002f40:	00f5e5b3          	or	a1,a1,a5
    80002f44:	08b52e23          	sw	a1,156(a0)
}
    80002f48:	00813403          	ld	s0,8(sp)
    80002f4c:	01010113          	addi	sp,sp,16
    80002f50:	00008067          	ret

0000000080002f54 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    80002f54:	ff010113          	addi	sp,sp,-16
    80002f58:	00813423          	sd	s0,8(sp)
    80002f5c:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    80002f60:	0015f593          	andi	a1,a1,1
    80002f64:	0025979b          	slliw	a5,a1,0x2
    80002f68:	09c52583          	lw	a1,156(a0)
    80002f6c:	ffb5f593          	andi	a1,a1,-5
    80002f70:	00f5e5b3          	or	a1,a1,a5
    80002f74:	08b52e23          	sw	a1,156(a0)
}
    80002f78:	00813403          	ld	s0,8(sp)
    80002f7c:	01010113          	addi	sp,sp,16
    80002f80:	00008067          	ret

0000000080002f84 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
    // __putc('\n');
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    // __putc('.');
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    80002f84:	ff010113          	addi	sp,sp,-16
    80002f88:	00813423          	sd	s0,8(sp)
    80002f8c:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    80002f90:	04050263          	beqz	a0,80002fd4 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    80002f94:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    80002f98:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    80002f9c:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    80002fa0:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    80002fa4:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    80002fa8:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    80002fac:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    80002fb0:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    80002fb4:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    80002fb8:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    80002fbc:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    80002fc0:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    80002fc4:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    80002fc8:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80002fcc:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    80002fd0:	06853823          	sd	s0,112(a0)
    //         __putc('a' + digit - 10);
    //     }
    // }
    // __putc('\n');
    
    if(newContext->sp != 0){
    80002fd4:	0085b783          	ld	a5,8(a1)
    80002fd8:	00078463          	beqz	a5,80002fe0 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    80002fdc:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    80002fe0:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    80002fe4:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    80002fe8:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80002fec:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    80002ff0:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80002ff4:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80002ff8:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80002ffc:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80003000:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80003004:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80003008:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    8000300c:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    80003010:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    80003014:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    80003018:	0685bd83          	ld	s11,104(a1)

    return;

}
    8000301c:	00813403          	ld	s0,8(sp)
    80003020:	01010113          	addi	sp,sp,16
    80003024:	00008067          	ret

0000000080003028 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80003028:	fe010113          	addi	sp,sp,-32
    8000302c:	00113c23          	sd	ra,24(sp)
    80003030:	00813823          	sd	s0,16(sp)
    80003034:	00913423          	sd	s1,8(sp)
    80003038:	01213023          	sd	s2,0(sp)
    8000303c:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    80003040:	00006917          	auipc	s2,0x6
    80003044:	25090913          	addi	s2,s2,592 # 80009290 <_ZN7_thread6nextIDE>
    80003048:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    8000304c:	00002097          	auipc	ra,0x2
    80003050:	c88080e7          	jalr	-888(ra) # 80004cd4 <_ZN9Scheduler3getEv>
    80003054:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    80003058:	00200793          	li	a5,2
    8000305c:	08f4b423          	sd	a5,136(s1)
    if(currentThread == nullptr){
    80003060:	04050463          	beqz	a0,800030a8 <_ZN7_thread8dispatchEv+0x80>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80003064:	00048c63          	beqz	s1,8000307c <_ZN7_thread8dispatchEv+0x54>
    80003068:	0984b783          	ld	a5,152(s1)
    8000306c:	00f00713          	li	a4,15
    80003070:	02071713          	slli	a4,a4,0x20
    80003074:	00e7f7b3          	and	a5,a5,a4
    80003078:	02078e63          	beqz	a5,800030b4 <_ZN7_thread8dispatchEv+0x8c>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    8000307c:	00006597          	auipc	a1,0x6
    80003080:	21c5b583          	ld	a1,540(a1) # 80009298 <_ZN7_thread13currentThreadE>
    80003084:	00048513          	mv	a0,s1
    80003088:	00000097          	auipc	ra,0x0
    8000308c:	efc080e7          	jalr	-260(ra) # 80002f84 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    80003090:	01813083          	ld	ra,24(sp)
    80003094:	01013403          	ld	s0,16(sp)
    80003098:	00813483          	ld	s1,8(sp)
    8000309c:	00013903          	ld	s2,0(sp)
    800030a0:	02010113          	addi	sp,sp,32
    800030a4:	00008067          	ret
        currentThread = oldThread;
    800030a8:	00006797          	auipc	a5,0x6
    800030ac:	1e97b823          	sd	s1,496(a5) # 80009298 <_ZN7_thread13currentThreadE>
        return;
    800030b0:	fe1ff06f          	j	80003090 <_ZN7_thread8dispatchEv+0x68>
        Scheduler::put(oldThread);
    800030b4:	00048513          	mv	a0,s1
    800030b8:	00002097          	auipc	ra,0x2
    800030bc:	a2c080e7          	jalr	-1492(ra) # 80004ae4 <_ZN9Scheduler3putEP7_thread>
    800030c0:	fbdff06f          	j	8000307c <_ZN7_thread8dispatchEv+0x54>

00000000800030c4 <_ZN11HeapManagerC1Ev>:
#include "hw.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    800030c4:	fe010113          	addi	sp,sp,-32
    800030c8:	00113c23          	sd	ra,24(sp)
    800030cc:	00813823          	sd	s0,16(sp)
    800030d0:	00913423          	sd	s1,8(sp)
    800030d4:	02010413          	addi	s0,sp,32
    800030d8:	00050493          	mv	s1,a0
    assert(instance == 0);
    800030dc:	00006797          	auipc	a5,0x6
    800030e0:	1c47b783          	ld	a5,452(a5) # 800092a0 <_ZN11HeapManager8instanceE>
    800030e4:	02079063          	bnez	a5,80003104 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    800030e8:	00006797          	auipc	a5,0x6
    800030ec:	1a97bc23          	sd	s1,440(a5) # 800092a0 <_ZN11HeapManager8instanceE>
}
    800030f0:	01813083          	ld	ra,24(sp)
    800030f4:	01013403          	ld	s0,16(sp)
    800030f8:	00813483          	ld	s1,8(sp)
    800030fc:	02010113          	addi	sp,sp,32
    80003100:	00008067          	ret
    assert(instance == 0);
    80003104:	00005697          	auipc	a3,0x5
    80003108:	01468693          	addi	a3,a3,20 # 80008118 <CONSOLE_STATUS+0x108>
    8000310c:	01300613          	li	a2,19
    80003110:	00005597          	auipc	a1,0x5
    80003114:	02858593          	addi	a1,a1,40 # 80008138 <CONSOLE_STATUS+0x128>
    80003118:	00005517          	auipc	a0,0x5
    8000311c:	f2850513          	addi	a0,a0,-216 # 80008040 <CONSOLE_STATUS+0x30>
    80003120:	fffff097          	auipc	ra,0xfffff
    80003124:	9ec080e7          	jalr	-1556(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    80003128:	fc1ff06f          	j	800030e8 <_ZN11HeapManagerC1Ev+0x24>

000000008000312c <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    8000312c:	ff010113          	addi	sp,sp,-16
    80003130:	00813423          	sd	s0,8(sp)
    80003134:	01010413          	addi	s0,sp,16
    
}
    80003138:	00813403          	ld	s0,8(sp)
    8000313c:	01010113          	addi	sp,sp,16
    80003140:	00008067          	ret

0000000080003144 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    80003144:	fd010113          	addi	sp,sp,-48
    80003148:	02113423          	sd	ra,40(sp)
    8000314c:	02813023          	sd	s0,32(sp)
    80003150:	00913c23          	sd	s1,24(sp)
    80003154:	01213823          	sd	s2,16(sp)
    80003158:	01313423          	sd	s3,8(sp)
    8000315c:	03010413          	addi	s0,sp,48
    80003160:	00050993          	mv	s3,a0
    80003164:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003168:	40b604b3          	sub	s1,a2,a1
    8000316c:	0414b793          	sltiu	a5,s1,65
    80003170:	0c079863          	bnez	a5,80003240 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80003174:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80003178:	fde00793          	li	a5,-34
    8000317c:	00f90c23          	sb	a5,24(s2)
    80003180:	fc000713          	li	a4,-64
    80003184:	00e90ca3          	sb	a4,25(s2)
    80003188:	fad00713          	li	a4,-83
    8000318c:	00e90d23          	sb	a4,26(s2)
    80003190:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    80003194:	0064d613          	srli	a2,s1,0x6
    80003198:	0009b783          	ld	a5,0(s3)
    8000319c:	fff60613          	addi	a2,a2,-1
    800031a0:	00c78823          	sb	a2,16(a5)
    800031a4:	00865713          	srli	a4,a2,0x8
    800031a8:	00e788a3          	sb	a4,17(a5)
    800031ac:	01065713          	srli	a4,a2,0x10
    800031b0:	00e78923          	sb	a4,18(a5)
    800031b4:	0186571b          	srliw	a4,a2,0x18
    800031b8:	00e789a3          	sb	a4,19(a5)
    800031bc:	02065713          	srli	a4,a2,0x20
    800031c0:	00e78a23          	sb	a4,20(a5)
    800031c4:	02865713          	srli	a4,a2,0x28
    800031c8:	00e78aa3          	sb	a4,21(a5)
    800031cc:	03065713          	srli	a4,a2,0x30
    800031d0:	00e78b23          	sb	a4,22(a5)
    800031d4:	03865613          	srli	a2,a2,0x38
    800031d8:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    800031dc:	0009b783          	ld	a5,0(s3)
    800031e0:	00078023          	sb	zero,0(a5)
    800031e4:	000780a3          	sb	zero,1(a5)
    800031e8:	00078123          	sb	zero,2(a5)
    800031ec:	000781a3          	sb	zero,3(a5)
    800031f0:	00078223          	sb	zero,4(a5)
    800031f4:	000782a3          	sb	zero,5(a5)
    800031f8:	00078323          	sb	zero,6(a5)
    800031fc:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80003200:	0009b783          	ld	a5,0(s3)
    80003204:	00078423          	sb	zero,8(a5)
    80003208:	000784a3          	sb	zero,9(a5)
    8000320c:	00078523          	sb	zero,10(a5)
    80003210:	000785a3          	sb	zero,11(a5)
    80003214:	00078623          	sb	zero,12(a5)
    80003218:	000786a3          	sb	zero,13(a5)
    8000321c:	00078723          	sb	zero,14(a5)
    80003220:	000787a3          	sb	zero,15(a5)
}
    80003224:	02813083          	ld	ra,40(sp)
    80003228:	02013403          	ld	s0,32(sp)
    8000322c:	01813483          	ld	s1,24(sp)
    80003230:	01013903          	ld	s2,16(sp)
    80003234:	00813983          	ld	s3,8(sp)
    80003238:	03010113          	addi	sp,sp,48
    8000323c:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003240:	00005697          	auipc	a3,0x5
    80003244:	f1068693          	addi	a3,a3,-240 # 80008150 <CONSOLE_STATUS+0x140>
    80003248:	01c00613          	li	a2,28
    8000324c:	00005597          	auipc	a1,0x5
    80003250:	eec58593          	addi	a1,a1,-276 # 80008138 <CONSOLE_STATUS+0x128>
    80003254:	00005517          	auipc	a0,0x5
    80003258:	f2c50513          	addi	a0,a0,-212 # 80008180 <CONSOLE_STATUS+0x170>
    8000325c:	fffff097          	auipc	ra,0xfffff
    80003260:	8b0080e7          	jalr	-1872(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    80003264:	f11ff06f          	j	80003174 <_ZN11HeapManager4initEmm+0x30>

0000000080003268 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80003268:	fe010113          	addi	sp,sp,-32
    8000326c:	00113c23          	sd	ra,24(sp)
    80003270:	00813823          	sd	s0,16(sp)
    80003274:	00913423          	sd	s1,8(sp)
    80003278:	01213023          	sd	s2,0(sp)
    8000327c:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003280:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80003284:	00000913          	li	s2,0
    80003288:	0b80006f          	j	80003340 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    8000328c:	0104c783          	lbu	a5,16(s1)
    80003290:	0114c703          	lbu	a4,17(s1)
    80003294:	00871713          	slli	a4,a4,0x8
    80003298:	00f76733          	or	a4,a4,a5
    8000329c:	0124c783          	lbu	a5,18(s1)
    800032a0:	01079793          	slli	a5,a5,0x10
    800032a4:	00e7e733          	or	a4,a5,a4
    800032a8:	0134c783          	lbu	a5,19(s1)
    800032ac:	01879793          	slli	a5,a5,0x18
    800032b0:	00e7e7b3          	or	a5,a5,a4
    800032b4:	0144c703          	lbu	a4,20(s1)
    800032b8:	02071713          	slli	a4,a4,0x20
    800032bc:	00f767b3          	or	a5,a4,a5
    800032c0:	0154c703          	lbu	a4,21(s1)
    800032c4:	02871713          	slli	a4,a4,0x28
    800032c8:	00f76733          	or	a4,a4,a5
    800032cc:	0164c783          	lbu	a5,22(s1)
    800032d0:	03079793          	slli	a5,a5,0x30
    800032d4:	00e7e733          	or	a4,a5,a4
    800032d8:	0174c783          	lbu	a5,23(s1)
    800032dc:	03879793          	slli	a5,a5,0x38
    800032e0:	00e7e7b3          	or	a5,a5,a4
    800032e4:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    800032e8:	0004c703          	lbu	a4,0(s1)
    800032ec:	0014c783          	lbu	a5,1(s1)
    800032f0:	00879793          	slli	a5,a5,0x8
    800032f4:	00e7e733          	or	a4,a5,a4
    800032f8:	0024c783          	lbu	a5,2(s1)
    800032fc:	01079793          	slli	a5,a5,0x10
    80003300:	00e7e7b3          	or	a5,a5,a4
    80003304:	0034c703          	lbu	a4,3(s1)
    80003308:	01871713          	slli	a4,a4,0x18
    8000330c:	00f767b3          	or	a5,a4,a5
    80003310:	0044c703          	lbu	a4,4(s1)
    80003314:	02071713          	slli	a4,a4,0x20
    80003318:	00f76733          	or	a4,a4,a5
    8000331c:	0054c783          	lbu	a5,5(s1)
    80003320:	02879793          	slli	a5,a5,0x28
    80003324:	00e7e733          	or	a4,a5,a4
    80003328:	0064c783          	lbu	a5,6(s1)
    8000332c:	03079793          	slli	a5,a5,0x30
    80003330:	00e7e7b3          	or	a5,a5,a4
    80003334:	0074c483          	lbu	s1,7(s1)
    80003338:	03849493          	slli	s1,s1,0x38
    8000333c:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003340:	06048263          	beqz	s1,800033a4 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003344:	0184c783          	lbu	a5,24(s1)
    80003348:	0194c703          	lbu	a4,25(s1)
    8000334c:	00871713          	slli	a4,a4,0x8
    80003350:	00f76733          	or	a4,a4,a5
    80003354:	01a4c783          	lbu	a5,26(s1)
    80003358:	01079793          	slli	a5,a5,0x10
    8000335c:	00e7e733          	or	a4,a5,a4
    80003360:	01b4c783          	lbu	a5,27(s1)
    80003364:	01879793          	slli	a5,a5,0x18
    80003368:	00e7e7b3          	or	a5,a5,a4
    8000336c:	0007879b          	sext.w	a5,a5
    80003370:	deadc737          	lui	a4,0xdeadc
    80003374:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead1bce>
    80003378:	f0e78ae3          	beq	a5,a4,8000328c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    8000337c:	00005697          	auipc	a3,0x5
    80003380:	e2468693          	addi	a3,a3,-476 # 800081a0 <CONSOLE_STATUS+0x190>
    80003384:	02900613          	li	a2,41
    80003388:	00005597          	auipc	a1,0x5
    8000338c:	db058593          	addi	a1,a1,-592 # 80008138 <CONSOLE_STATUS+0x128>
    80003390:	00005517          	auipc	a0,0x5
    80003394:	e3850513          	addi	a0,a0,-456 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80003398:	ffffe097          	auipc	ra,0xffffe
    8000339c:	774080e7          	jalr	1908(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    800033a0:	eedff06f          	j	8000328c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    800033a4:	00090513          	mv	a0,s2
    800033a8:	01813083          	ld	ra,24(sp)
    800033ac:	01013403          	ld	s0,16(sp)
    800033b0:	00813483          	ld	s1,8(sp)
    800033b4:	00013903          	ld	s2,0(sp)
    800033b8:	02010113          	addi	sp,sp,32
    800033bc:	00008067          	ret

00000000800033c0 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    800033c0:	fd010113          	addi	sp,sp,-48
    800033c4:	02113423          	sd	ra,40(sp)
    800033c8:	02813023          	sd	s0,32(sp)
    800033cc:	00913c23          	sd	s1,24(sp)
    800033d0:	01213823          	sd	s2,16(sp)
    800033d4:	01313423          	sd	s3,8(sp)
    800033d8:	03010413          	addi	s0,sp,48
    800033dc:	00050993          	mv	s3,a0
    800033e0:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    800033e4:	00053483          	ld	s1,0(a0)
    800033e8:	0b80006f          	j	800034a0 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    800033ec:	0104c783          	lbu	a5,16(s1)
    800033f0:	0114c703          	lbu	a4,17(s1)
    800033f4:	00871713          	slli	a4,a4,0x8
    800033f8:	00f76733          	or	a4,a4,a5
    800033fc:	0124c783          	lbu	a5,18(s1)
    80003400:	01079793          	slli	a5,a5,0x10
    80003404:	00e7e733          	or	a4,a5,a4
    80003408:	0134c783          	lbu	a5,19(s1)
    8000340c:	01879793          	slli	a5,a5,0x18
    80003410:	00e7e7b3          	or	a5,a5,a4
    80003414:	0144c703          	lbu	a4,20(s1)
    80003418:	02071713          	slli	a4,a4,0x20
    8000341c:	00f767b3          	or	a5,a4,a5
    80003420:	0154c703          	lbu	a4,21(s1)
    80003424:	02871713          	slli	a4,a4,0x28
    80003428:	00f76733          	or	a4,a4,a5
    8000342c:	0164c783          	lbu	a5,22(s1)
    80003430:	03079793          	slli	a5,a5,0x30
    80003434:	00e7e733          	or	a4,a5,a4
    80003438:	0174c783          	lbu	a5,23(s1)
    8000343c:	03879793          	slli	a5,a5,0x38
    80003440:	00e7e7b3          	or	a5,a5,a4
    80003444:	0d27f063          	bgeu	a5,s2,80003504 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80003448:	0004c703          	lbu	a4,0(s1)
    8000344c:	0014c783          	lbu	a5,1(s1)
    80003450:	00879793          	slli	a5,a5,0x8
    80003454:	00e7e733          	or	a4,a5,a4
    80003458:	0024c783          	lbu	a5,2(s1)
    8000345c:	01079793          	slli	a5,a5,0x10
    80003460:	00e7e7b3          	or	a5,a5,a4
    80003464:	0034c703          	lbu	a4,3(s1)
    80003468:	01871713          	slli	a4,a4,0x18
    8000346c:	00f767b3          	or	a5,a4,a5
    80003470:	0044c703          	lbu	a4,4(s1)
    80003474:	02071713          	slli	a4,a4,0x20
    80003478:	00f76733          	or	a4,a4,a5
    8000347c:	0054c783          	lbu	a5,5(s1)
    80003480:	02879793          	slli	a5,a5,0x28
    80003484:	00e7e733          	or	a4,a5,a4
    80003488:	0064c783          	lbu	a5,6(s1)
    8000348c:	03079793          	slli	a5,a5,0x30
    80003490:	00e7e7b3          	or	a5,a5,a4
    80003494:	0074c483          	lbu	s1,7(s1)
    80003498:	03849493          	slli	s1,s1,0x38
    8000349c:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    800034a0:	4e048c63          	beqz	s1,80003998 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    800034a4:	0184c783          	lbu	a5,24(s1)
    800034a8:	0194c703          	lbu	a4,25(s1)
    800034ac:	00871713          	slli	a4,a4,0x8
    800034b0:	00f76733          	or	a4,a4,a5
    800034b4:	01a4c783          	lbu	a5,26(s1)
    800034b8:	01079793          	slli	a5,a5,0x10
    800034bc:	00e7e733          	or	a4,a5,a4
    800034c0:	01b4c783          	lbu	a5,27(s1)
    800034c4:	01879793          	slli	a5,a5,0x18
    800034c8:	00e7e7b3          	or	a5,a5,a4
    800034cc:	0007879b          	sext.w	a5,a5
    800034d0:	deadc737          	lui	a4,0xdeadc
    800034d4:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead1bce>
    800034d8:	f0e78ae3          	beq	a5,a4,800033ec <_ZN11HeapManager12heapAllocateEm+0x2c>
    800034dc:	00005697          	auipc	a3,0x5
    800034e0:	d1468693          	addi	a3,a3,-748 # 800081f0 <CONSOLE_STATUS+0x1e0>
    800034e4:	03300613          	li	a2,51
    800034e8:	00005597          	auipc	a1,0x5
    800034ec:	c5058593          	addi	a1,a1,-944 # 80008138 <CONSOLE_STATUS+0x128>
    800034f0:	00005517          	auipc	a0,0x5
    800034f4:	cd850513          	addi	a0,a0,-808 # 800081c8 <CONSOLE_STATUS+0x1b8>
    800034f8:	ffffe097          	auipc	ra,0xffffe
    800034fc:	614080e7          	jalr	1556(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    80003500:	eedff06f          	j	800033ec <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80003504:	00190713          	addi	a4,s2,1
    80003508:	2af77263          	bgeu	a4,a5,800037ac <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    8000350c:	00671793          	slli	a5,a4,0x6
    80003510:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80003514:	fde00713          	li	a4,-34
    80003518:	00e78c23          	sb	a4,24(a5)
    8000351c:	fc000693          	li	a3,-64
    80003520:	00d78ca3          	sb	a3,25(a5)
    80003524:	fad00693          	li	a3,-83
    80003528:	00d78d23          	sb	a3,26(a5)
    8000352c:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80003530:	0104c703          	lbu	a4,16(s1)
    80003534:	0114c683          	lbu	a3,17(s1)
    80003538:	00869693          	slli	a3,a3,0x8
    8000353c:	00e6e6b3          	or	a3,a3,a4
    80003540:	0124c703          	lbu	a4,18(s1)
    80003544:	01071713          	slli	a4,a4,0x10
    80003548:	00d766b3          	or	a3,a4,a3
    8000354c:	0134c703          	lbu	a4,19(s1)
    80003550:	01871713          	slli	a4,a4,0x18
    80003554:	00d76733          	or	a4,a4,a3
    80003558:	0144c683          	lbu	a3,20(s1)
    8000355c:	02069693          	slli	a3,a3,0x20
    80003560:	00e6e733          	or	a4,a3,a4
    80003564:	0154c683          	lbu	a3,21(s1)
    80003568:	02869693          	slli	a3,a3,0x28
    8000356c:	00e6e6b3          	or	a3,a3,a4
    80003570:	0164c703          	lbu	a4,22(s1)
    80003574:	03071713          	slli	a4,a4,0x30
    80003578:	00d766b3          	or	a3,a4,a3
    8000357c:	0174c703          	lbu	a4,23(s1)
    80003580:	03871713          	slli	a4,a4,0x38
    80003584:	00d76733          	or	a4,a4,a3
    80003588:	41270733          	sub	a4,a4,s2
    8000358c:	fff70713          	addi	a4,a4,-1
    80003590:	00e78823          	sb	a4,16(a5)
    80003594:	00875693          	srli	a3,a4,0x8
    80003598:	00d788a3          	sb	a3,17(a5)
    8000359c:	01075693          	srli	a3,a4,0x10
    800035a0:	00d78923          	sb	a3,18(a5)
    800035a4:	0187569b          	srliw	a3,a4,0x18
    800035a8:	00d789a3          	sb	a3,19(a5)
    800035ac:	02075693          	srli	a3,a4,0x20
    800035b0:	00d78a23          	sb	a3,20(a5)
    800035b4:	02875693          	srli	a3,a4,0x28
    800035b8:	00d78aa3          	sb	a3,21(a5)
    800035bc:	03075693          	srli	a3,a4,0x30
    800035c0:	00d78b23          	sb	a3,22(a5)
    800035c4:	03875713          	srli	a4,a4,0x38
    800035c8:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    800035cc:	0004c703          	lbu	a4,0(s1)
    800035d0:	0014c683          	lbu	a3,1(s1)
    800035d4:	00869693          	slli	a3,a3,0x8
    800035d8:	00e6e733          	or	a4,a3,a4
    800035dc:	0024c683          	lbu	a3,2(s1)
    800035e0:	01069693          	slli	a3,a3,0x10
    800035e4:	00e6e6b3          	or	a3,a3,a4
    800035e8:	0034c703          	lbu	a4,3(s1)
    800035ec:	01871713          	slli	a4,a4,0x18
    800035f0:	00d766b3          	or	a3,a4,a3
    800035f4:	0044c703          	lbu	a4,4(s1)
    800035f8:	02071713          	slli	a4,a4,0x20
    800035fc:	00d76733          	or	a4,a4,a3
    80003600:	0054c683          	lbu	a3,5(s1)
    80003604:	02869693          	slli	a3,a3,0x28
    80003608:	00e6e733          	or	a4,a3,a4
    8000360c:	0064c683          	lbu	a3,6(s1)
    80003610:	03069693          	slli	a3,a3,0x30
    80003614:	00e6e6b3          	or	a3,a3,a4
    80003618:	0074c703          	lbu	a4,7(s1)
    8000361c:	03871713          	slli	a4,a4,0x38
    80003620:	00d76733          	or	a4,a4,a3
    80003624:	00d78023          	sb	a3,0(a5)
    80003628:	00875693          	srli	a3,a4,0x8
    8000362c:	00d780a3          	sb	a3,1(a5)
    80003630:	01075693          	srli	a3,a4,0x10
    80003634:	00d78123          	sb	a3,2(a5)
    80003638:	0187569b          	srliw	a3,a4,0x18
    8000363c:	00d781a3          	sb	a3,3(a5)
    80003640:	02075693          	srli	a3,a4,0x20
    80003644:	00d78223          	sb	a3,4(a5)
    80003648:	02875693          	srli	a3,a4,0x28
    8000364c:	00d782a3          	sb	a3,5(a5)
    80003650:	03075693          	srli	a3,a4,0x30
    80003654:	00d78323          	sb	a3,6(a5)
    80003658:	03875713          	srli	a4,a4,0x38
    8000365c:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80003660:	00978423          	sb	s1,8(a5)
    80003664:	0084d713          	srli	a4,s1,0x8
    80003668:	00e784a3          	sb	a4,9(a5)
    8000366c:	0104d713          	srli	a4,s1,0x10
    80003670:	00e78523          	sb	a4,10(a5)
    80003674:	0184d71b          	srliw	a4,s1,0x18
    80003678:	00e785a3          	sb	a4,11(a5)
    8000367c:	0204d713          	srli	a4,s1,0x20
    80003680:	00e78623          	sb	a4,12(a5)
    80003684:	0284d713          	srli	a4,s1,0x28
    80003688:	00e786a3          	sb	a4,13(a5)
    8000368c:	0304d713          	srli	a4,s1,0x30
    80003690:	00e78723          	sb	a4,14(a5)
    80003694:	0384d713          	srli	a4,s1,0x38
    80003698:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    8000369c:	0004c703          	lbu	a4,0(s1)
    800036a0:	0014c683          	lbu	a3,1(s1)
    800036a4:	00869693          	slli	a3,a3,0x8
    800036a8:	00e6e6b3          	or	a3,a3,a4
    800036ac:	0024c703          	lbu	a4,2(s1)
    800036b0:	01071713          	slli	a4,a4,0x10
    800036b4:	00d766b3          	or	a3,a4,a3
    800036b8:	0034c703          	lbu	a4,3(s1)
    800036bc:	01871713          	slli	a4,a4,0x18
    800036c0:	00d76733          	or	a4,a4,a3
    800036c4:	0044c683          	lbu	a3,4(s1)
    800036c8:	02069693          	slli	a3,a3,0x20
    800036cc:	00e6e733          	or	a4,a3,a4
    800036d0:	0054c683          	lbu	a3,5(s1)
    800036d4:	02869693          	slli	a3,a3,0x28
    800036d8:	00e6e6b3          	or	a3,a3,a4
    800036dc:	0064c703          	lbu	a4,6(s1)
    800036e0:	03071713          	slli	a4,a4,0x30
    800036e4:	00d766b3          	or	a3,a4,a3
    800036e8:	0074c703          	lbu	a4,7(s1)
    800036ec:	03871713          	slli	a4,a4,0x38
    800036f0:	00d76733          	or	a4,a4,a3
    800036f4:	04070063          	beqz	a4,80003734 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    800036f8:	00f70423          	sb	a5,8(a4)
    800036fc:	0087d693          	srli	a3,a5,0x8
    80003700:	00d704a3          	sb	a3,9(a4)
    80003704:	0107d693          	srli	a3,a5,0x10
    80003708:	00d70523          	sb	a3,10(a4)
    8000370c:	0187d69b          	srliw	a3,a5,0x18
    80003710:	00d705a3          	sb	a3,11(a4)
    80003714:	0207d693          	srli	a3,a5,0x20
    80003718:	00d70623          	sb	a3,12(a4)
    8000371c:	0287d693          	srli	a3,a5,0x28
    80003720:	00d706a3          	sb	a3,13(a4)
    80003724:	0307d693          	srli	a3,a5,0x30
    80003728:	00d70723          	sb	a3,14(a4)
    8000372c:	0387d693          	srli	a3,a5,0x38
    80003730:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80003734:	00f48023          	sb	a5,0(s1)
    80003738:	0087d713          	srli	a4,a5,0x8
    8000373c:	00e480a3          	sb	a4,1(s1)
    80003740:	0107d713          	srli	a4,a5,0x10
    80003744:	00e48123          	sb	a4,2(s1)
    80003748:	0187d71b          	srliw	a4,a5,0x18
    8000374c:	00e481a3          	sb	a4,3(s1)
    80003750:	0207d713          	srli	a4,a5,0x20
    80003754:	00e48223          	sb	a4,4(s1)
    80003758:	0287d713          	srli	a4,a5,0x28
    8000375c:	00e482a3          	sb	a4,5(s1)
    80003760:	0307d713          	srli	a4,a5,0x30
    80003764:	00e48323          	sb	a4,6(s1)
    80003768:	0387d793          	srli	a5,a5,0x38
    8000376c:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80003770:	01248823          	sb	s2,16(s1)
    80003774:	00895793          	srli	a5,s2,0x8
    80003778:	00f488a3          	sb	a5,17(s1)
    8000377c:	01095793          	srli	a5,s2,0x10
    80003780:	00f48923          	sb	a5,18(s1)
    80003784:	0189579b          	srliw	a5,s2,0x18
    80003788:	00f489a3          	sb	a5,19(s1)
    8000378c:	02095793          	srli	a5,s2,0x20
    80003790:	00f48a23          	sb	a5,20(s1)
    80003794:	02895793          	srli	a5,s2,0x28
    80003798:	00f48aa3          	sb	a5,21(s1)
    8000379c:	03095793          	srli	a5,s2,0x30
    800037a0:	00f48b23          	sb	a5,22(s1)
    800037a4:	03895913          	srli	s2,s2,0x38
    800037a8:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    800037ac:	0009b783          	ld	a5,0(s3)
    800037b0:	20978463          	beq	a5,s1,800039b8 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    800037b4:	0084c783          	lbu	a5,8(s1)
    800037b8:	0094c703          	lbu	a4,9(s1)
    800037bc:	00871713          	slli	a4,a4,0x8
    800037c0:	00f76733          	or	a4,a4,a5
    800037c4:	00a4c783          	lbu	a5,10(s1)
    800037c8:	01079793          	slli	a5,a5,0x10
    800037cc:	00e7e733          	or	a4,a5,a4
    800037d0:	00b4c783          	lbu	a5,11(s1)
    800037d4:	01879793          	slli	a5,a5,0x18
    800037d8:	00e7e7b3          	or	a5,a5,a4
    800037dc:	00c4c703          	lbu	a4,12(s1)
    800037e0:	02071713          	slli	a4,a4,0x20
    800037e4:	00f767b3          	or	a5,a4,a5
    800037e8:	00d4c703          	lbu	a4,13(s1)
    800037ec:	02871713          	slli	a4,a4,0x28
    800037f0:	00f76733          	or	a4,a4,a5
    800037f4:	00e4c783          	lbu	a5,14(s1)
    800037f8:	03079793          	slli	a5,a5,0x30
    800037fc:	00e7e733          	or	a4,a5,a4
    80003800:	00f4c783          	lbu	a5,15(s1)
    80003804:	03879793          	slli	a5,a5,0x38
    80003808:	00e7e7b3          	or	a5,a5,a4
    8000380c:	08078c63          	beqz	a5,800038a4 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80003810:	0004c703          	lbu	a4,0(s1)
    80003814:	0014c683          	lbu	a3,1(s1)
    80003818:	00869693          	slli	a3,a3,0x8
    8000381c:	00e6e733          	or	a4,a3,a4
    80003820:	0024c683          	lbu	a3,2(s1)
    80003824:	01069693          	slli	a3,a3,0x10
    80003828:	00e6e6b3          	or	a3,a3,a4
    8000382c:	0034c703          	lbu	a4,3(s1)
    80003830:	01871713          	slli	a4,a4,0x18
    80003834:	00d766b3          	or	a3,a4,a3
    80003838:	0044c703          	lbu	a4,4(s1)
    8000383c:	02071713          	slli	a4,a4,0x20
    80003840:	00d76733          	or	a4,a4,a3
    80003844:	0054c683          	lbu	a3,5(s1)
    80003848:	02869693          	slli	a3,a3,0x28
    8000384c:	00e6e733          	or	a4,a3,a4
    80003850:	0064c683          	lbu	a3,6(s1)
    80003854:	03069693          	slli	a3,a3,0x30
    80003858:	00e6e6b3          	or	a3,a3,a4
    8000385c:	0074c703          	lbu	a4,7(s1)
    80003860:	03871713          	slli	a4,a4,0x38
    80003864:	00d76733          	or	a4,a4,a3
    80003868:	00d78023          	sb	a3,0(a5)
    8000386c:	00875693          	srli	a3,a4,0x8
    80003870:	00d780a3          	sb	a3,1(a5)
    80003874:	01075693          	srli	a3,a4,0x10
    80003878:	00d78123          	sb	a3,2(a5)
    8000387c:	0187569b          	srliw	a3,a4,0x18
    80003880:	00d781a3          	sb	a3,3(a5)
    80003884:	02075693          	srli	a3,a4,0x20
    80003888:	00d78223          	sb	a3,4(a5)
    8000388c:	02875693          	srli	a3,a4,0x28
    80003890:	00d782a3          	sb	a3,5(a5)
    80003894:	03075693          	srli	a3,a4,0x30
    80003898:	00d78323          	sb	a3,6(a5)
    8000389c:	03875713          	srli	a4,a4,0x38
    800038a0:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    800038a4:	0004c783          	lbu	a5,0(s1)
    800038a8:	0014c703          	lbu	a4,1(s1)
    800038ac:	00871713          	slli	a4,a4,0x8
    800038b0:	00f76733          	or	a4,a4,a5
    800038b4:	0024c783          	lbu	a5,2(s1)
    800038b8:	01079793          	slli	a5,a5,0x10
    800038bc:	00e7e733          	or	a4,a5,a4
    800038c0:	0034c783          	lbu	a5,3(s1)
    800038c4:	01879793          	slli	a5,a5,0x18
    800038c8:	00e7e7b3          	or	a5,a5,a4
    800038cc:	0044c703          	lbu	a4,4(s1)
    800038d0:	02071713          	slli	a4,a4,0x20
    800038d4:	00f767b3          	or	a5,a4,a5
    800038d8:	0054c703          	lbu	a4,5(s1)
    800038dc:	02871713          	slli	a4,a4,0x28
    800038e0:	00f76733          	or	a4,a4,a5
    800038e4:	0064c783          	lbu	a5,6(s1)
    800038e8:	03079793          	slli	a5,a5,0x30
    800038ec:	00e7e733          	or	a4,a5,a4
    800038f0:	0074c783          	lbu	a5,7(s1)
    800038f4:	03879793          	slli	a5,a5,0x38
    800038f8:	00e7e7b3          	or	a5,a5,a4
    800038fc:	08078c63          	beqz	a5,80003994 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003900:	0084c703          	lbu	a4,8(s1)
    80003904:	0094c683          	lbu	a3,9(s1)
    80003908:	00869693          	slli	a3,a3,0x8
    8000390c:	00e6e733          	or	a4,a3,a4
    80003910:	00a4c683          	lbu	a3,10(s1)
    80003914:	01069693          	slli	a3,a3,0x10
    80003918:	00e6e6b3          	or	a3,a3,a4
    8000391c:	00b4c703          	lbu	a4,11(s1)
    80003920:	01871713          	slli	a4,a4,0x18
    80003924:	00d766b3          	or	a3,a4,a3
    80003928:	00c4c703          	lbu	a4,12(s1)
    8000392c:	02071713          	slli	a4,a4,0x20
    80003930:	00d76733          	or	a4,a4,a3
    80003934:	00d4c683          	lbu	a3,13(s1)
    80003938:	02869693          	slli	a3,a3,0x28
    8000393c:	00e6e733          	or	a4,a3,a4
    80003940:	00e4c683          	lbu	a3,14(s1)
    80003944:	03069693          	slli	a3,a3,0x30
    80003948:	00e6e6b3          	or	a3,a3,a4
    8000394c:	00f4c703          	lbu	a4,15(s1)
    80003950:	03871713          	slli	a4,a4,0x38
    80003954:	00d76733          	or	a4,a4,a3
    80003958:	00d78423          	sb	a3,8(a5)
    8000395c:	00875693          	srli	a3,a4,0x8
    80003960:	00d784a3          	sb	a3,9(a5)
    80003964:	01075693          	srli	a3,a4,0x10
    80003968:	00d78523          	sb	a3,10(a5)
    8000396c:	0187569b          	srliw	a3,a4,0x18
    80003970:	00d785a3          	sb	a3,11(a5)
    80003974:	02075693          	srli	a3,a4,0x20
    80003978:	00d78623          	sb	a3,12(a5)
    8000397c:	02875693          	srli	a3,a4,0x28
    80003980:	00d786a3          	sb	a3,13(a5)
    80003984:	03075693          	srli	a3,a4,0x30
    80003988:	00d78723          	sb	a3,14(a5)
    8000398c:	03875713          	srli	a4,a4,0x38
    80003990:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    80003994:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80003998:	00048513          	mv	a0,s1
    8000399c:	02813083          	ld	ra,40(sp)
    800039a0:	02013403          	ld	s0,32(sp)
    800039a4:	01813483          	ld	s1,24(sp)
    800039a8:	01013903          	ld	s2,16(sp)
    800039ac:	00813983          	ld	s3,8(sp)
    800039b0:	03010113          	addi	sp,sp,48
    800039b4:	00008067          	ret
                m_pHead = pCurrent->pNext;
    800039b8:	0004c703          	lbu	a4,0(s1)
    800039bc:	0014c783          	lbu	a5,1(s1)
    800039c0:	00879793          	slli	a5,a5,0x8
    800039c4:	00e7e7b3          	or	a5,a5,a4
    800039c8:	0024c703          	lbu	a4,2(s1)
    800039cc:	01071713          	slli	a4,a4,0x10
    800039d0:	00f76733          	or	a4,a4,a5
    800039d4:	0034c783          	lbu	a5,3(s1)
    800039d8:	01879793          	slli	a5,a5,0x18
    800039dc:	00e7e733          	or	a4,a5,a4
    800039e0:	0044c783          	lbu	a5,4(s1)
    800039e4:	02079793          	slli	a5,a5,0x20
    800039e8:	00e7e7b3          	or	a5,a5,a4
    800039ec:	0054c703          	lbu	a4,5(s1)
    800039f0:	02871713          	slli	a4,a4,0x28
    800039f4:	00f76733          	or	a4,a4,a5
    800039f8:	0064c783          	lbu	a5,6(s1)
    800039fc:	03079793          	slli	a5,a5,0x30
    80003a00:	00e7e733          	or	a4,a5,a4
    80003a04:	0074c783          	lbu	a5,7(s1)
    80003a08:	03879793          	slli	a5,a5,0x38
    80003a0c:	00e7e7b3          	or	a5,a5,a4
    80003a10:	00f9b023          	sd	a5,0(s3)
    80003a14:	da1ff06f          	j	800037b4 <_ZN11HeapManager12heapAllocateEm+0x3f4>

0000000080003a18 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003a18:	fc010113          	addi	sp,sp,-64
    80003a1c:	02113c23          	sd	ra,56(sp)
    80003a20:	02813823          	sd	s0,48(sp)
    80003a24:	02913423          	sd	s1,40(sp)
    80003a28:	03213023          	sd	s2,32(sp)
    80003a2c:	01313c23          	sd	s3,24(sp)
    80003a30:	01413823          	sd	s4,16(sp)
    80003a34:	01513423          	sd	s5,8(sp)
    80003a38:	04010413          	addi	s0,sp,64
    80003a3c:	00050a93          	mv	s5,a0
    80003a40:	00058a13          	mv	s4,a1
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pAddress) - MEM_BLOCK_SIZE);
    80003a44:	fc058913          	addi	s2,a1,-64
    80003a48:	00090993          	mv	s3,s2
    
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003a4c:	01894783          	lbu	a5,24(s2)
    80003a50:	01994703          	lbu	a4,25(s2)
    80003a54:	00871713          	slli	a4,a4,0x8
    80003a58:	00f76733          	or	a4,a4,a5
    80003a5c:	01a94783          	lbu	a5,26(s2)
    80003a60:	01079793          	slli	a5,a5,0x10
    80003a64:	00e7e733          	or	a4,a5,a4
    80003a68:	01b94783          	lbu	a5,27(s2)
    80003a6c:	01879793          	slli	a5,a5,0x18
    80003a70:	00e7e7b3          	or	a5,a5,a4
    80003a74:	0007879b          	sext.w	a5,a5
    80003a78:	deadc737          	lui	a4,0xdeadc
    80003a7c:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead1bce>
    80003a80:	28e79c63          	bne	a5,a4,80003d18 <_ZN11HeapManager8heapFreeEPv+0x300>
    HeapFreeSectionHeader* pInsert = m_pHead;
    80003a84:	000ab483          	ld	s1,0(s5)

    if(pInsert == 0 || pInsert->pNext >= pAddress){
    80003a88:	06048063          	beqz	s1,80003ae8 <_ZN11HeapManager8heapFreeEPv+0xd0>
    80003a8c:	0004c783          	lbu	a5,0(s1)
    80003a90:	0014c703          	lbu	a4,1(s1)
    80003a94:	00871713          	slli	a4,a4,0x8
    80003a98:	00f76733          	or	a4,a4,a5
    80003a9c:	0024c783          	lbu	a5,2(s1)
    80003aa0:	01079793          	slli	a5,a5,0x10
    80003aa4:	00e7e733          	or	a4,a5,a4
    80003aa8:	0034c783          	lbu	a5,3(s1)
    80003aac:	01879793          	slli	a5,a5,0x18
    80003ab0:	00e7e7b3          	or	a5,a5,a4
    80003ab4:	0044c703          	lbu	a4,4(s1)
    80003ab8:	02071713          	slli	a4,a4,0x20
    80003abc:	00f767b3          	or	a5,a4,a5
    80003ac0:	0054c703          	lbu	a4,5(s1)
    80003ac4:	02871713          	slli	a4,a4,0x28
    80003ac8:	00f76733          	or	a4,a4,a5
    80003acc:	0064c783          	lbu	a5,6(s1)
    80003ad0:	03079793          	slli	a5,a5,0x30
    80003ad4:	00e7e733          	or	a4,a5,a4
    80003ad8:	0074c783          	lbu	a5,7(s1)
    80003adc:	03879793          	slli	a5,a5,0x38
    80003ae0:	00e7e7b3          	or	a5,a5,a4
    80003ae4:	2b47ea63          	bltu	a5,s4,80003d98 <_ZN11HeapManager8heapFreeEPv+0x380>
        pFree->pNext = m_pHead;
    80003ae8:	fc9a0023          	sb	s1,-64(s4)
    80003aec:	0084d793          	srli	a5,s1,0x8
    80003af0:	00f900a3          	sb	a5,1(s2)
    80003af4:	0104d793          	srli	a5,s1,0x10
    80003af8:	00f90123          	sb	a5,2(s2)
    80003afc:	0184d79b          	srliw	a5,s1,0x18
    80003b00:	00f901a3          	sb	a5,3(s2)
    80003b04:	0204d793          	srli	a5,s1,0x20
    80003b08:	00f90223          	sb	a5,4(s2)
    80003b0c:	0284d793          	srli	a5,s1,0x28
    80003b10:	00f902a3          	sb	a5,5(s2)
    80003b14:	0304d793          	srli	a5,s1,0x30
    80003b18:	00f90323          	sb	a5,6(s2)
    80003b1c:	0384d493          	srli	s1,s1,0x38
    80003b20:	009903a3          	sb	s1,7(s2)
        m_pHead->pPrev = pFree;
    80003b24:	000ab783          	ld	a5,0(s5)
    80003b28:	01278423          	sb	s2,8(a5)
    80003b2c:	00895713          	srli	a4,s2,0x8
    80003b30:	00e784a3          	sb	a4,9(a5)
    80003b34:	01095713          	srli	a4,s2,0x10
    80003b38:	00e78523          	sb	a4,10(a5)
    80003b3c:	0189571b          	srliw	a4,s2,0x18
    80003b40:	00e785a3          	sb	a4,11(a5)
    80003b44:	02095713          	srli	a4,s2,0x20
    80003b48:	00e78623          	sb	a4,12(a5)
    80003b4c:	02895713          	srli	a4,s2,0x28
    80003b50:	00e786a3          	sb	a4,13(a5)
    80003b54:	03095713          	srli	a4,s2,0x30
    80003b58:	00e78723          	sb	a4,14(a5)
    80003b5c:	03895713          	srli	a4,s2,0x38
    80003b60:	00e787a3          	sb	a4,15(a5)
        m_pHead = pFree;
    80003b64:	012ab023          	sd	s2,0(s5)
    }



    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uintptr_t>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree)){
    80003b68:	00894783          	lbu	a5,8(s2)
    80003b6c:	00994703          	lbu	a4,9(s2)
    80003b70:	00871713          	slli	a4,a4,0x8
    80003b74:	00f76733          	or	a4,a4,a5
    80003b78:	00a94783          	lbu	a5,10(s2)
    80003b7c:	01079793          	slli	a5,a5,0x10
    80003b80:	00e7e733          	or	a4,a5,a4
    80003b84:	00b94783          	lbu	a5,11(s2)
    80003b88:	01879793          	slli	a5,a5,0x18
    80003b8c:	00e7e7b3          	or	a5,a5,a4
    80003b90:	00c94703          	lbu	a4,12(s2)
    80003b94:	02071713          	slli	a4,a4,0x20
    80003b98:	00f767b3          	or	a5,a4,a5
    80003b9c:	00d94703          	lbu	a4,13(s2)
    80003ba0:	02871713          	slli	a4,a4,0x28
    80003ba4:	00f76733          	or	a4,a4,a5
    80003ba8:	00e94783          	lbu	a5,14(s2)
    80003bac:	03079793          	slli	a5,a5,0x30
    80003bb0:	00e7e733          	or	a4,a5,a4
    80003bb4:	00f94783          	lbu	a5,15(s2)
    80003bb8:	03879793          	slli	a5,a5,0x38
    80003bbc:	00e7e7b3          	or	a5,a5,a4
    80003bc0:	06078663          	beqz	a5,80003c2c <_ZN11HeapManager8heapFreeEPv+0x214>
    80003bc4:	0107c703          	lbu	a4,16(a5)
    80003bc8:	0117c683          	lbu	a3,17(a5)
    80003bcc:	00869693          	slli	a3,a3,0x8
    80003bd0:	00e6e6b3          	or	a3,a3,a4
    80003bd4:	0127c703          	lbu	a4,18(a5)
    80003bd8:	01071713          	slli	a4,a4,0x10
    80003bdc:	00d766b3          	or	a3,a4,a3
    80003be0:	0137c703          	lbu	a4,19(a5)
    80003be4:	01871713          	slli	a4,a4,0x18
    80003be8:	00d76733          	or	a4,a4,a3
    80003bec:	0147c683          	lbu	a3,20(a5)
    80003bf0:	02069693          	slli	a3,a3,0x20
    80003bf4:	00e6e733          	or	a4,a3,a4
    80003bf8:	0157c683          	lbu	a3,21(a5)
    80003bfc:	02869693          	slli	a3,a3,0x28
    80003c00:	00e6e6b3          	or	a3,a3,a4
    80003c04:	0167c703          	lbu	a4,22(a5)
    80003c08:	03071713          	slli	a4,a4,0x30
    80003c0c:	00d766b3          	or	a3,a4,a3
    80003c10:	0177c703          	lbu	a4,23(a5)
    80003c14:	03871713          	slli	a4,a4,0x38
    80003c18:	00d76733          	or	a4,a4,a3
    80003c1c:	00170693          	addi	a3,a4,1
    80003c20:	00669693          	slli	a3,a3,0x6
    80003c24:	00d786b3          	add	a3,a5,a3
    80003c28:	38d90063          	beq	s2,a3,80003fa8 <_ZN11HeapManager8heapFreeEPv+0x590>
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree->pPrev;
        }pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uintptr_t>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree->pNext)){
    80003c2c:	0009c783          	lbu	a5,0(s3)
    80003c30:	0019c703          	lbu	a4,1(s3)
    80003c34:	00871713          	slli	a4,a4,0x8
    80003c38:	00f76733          	or	a4,a4,a5
    80003c3c:	0029c783          	lbu	a5,2(s3)
    80003c40:	01079793          	slli	a5,a5,0x10
    80003c44:	00e7e733          	or	a4,a5,a4
    80003c48:	0039c783          	lbu	a5,3(s3)
    80003c4c:	01879793          	slli	a5,a5,0x18
    80003c50:	00e7e7b3          	or	a5,a5,a4
    80003c54:	0049c703          	lbu	a4,4(s3)
    80003c58:	02071713          	slli	a4,a4,0x20
    80003c5c:	00f767b3          	or	a5,a4,a5
    80003c60:	0059c703          	lbu	a4,5(s3)
    80003c64:	02871713          	slli	a4,a4,0x28
    80003c68:	00f76733          	or	a4,a4,a5
    80003c6c:	0069c783          	lbu	a5,6(s3)
    80003c70:	03079793          	slli	a5,a5,0x30
    80003c74:	00e7e733          	or	a4,a5,a4
    80003c78:	0079c783          	lbu	a5,7(s3)
    80003c7c:	03879793          	slli	a5,a5,0x38
    80003c80:	00e7e7b3          	or	a5,a5,a4
    80003c84:	06078663          	beqz	a5,80003cf0 <_ZN11HeapManager8heapFreeEPv+0x2d8>
    80003c88:	0109c703          	lbu	a4,16(s3)
    80003c8c:	0119c683          	lbu	a3,17(s3)
    80003c90:	00869693          	slli	a3,a3,0x8
    80003c94:	00e6e6b3          	or	a3,a3,a4
    80003c98:	0129c703          	lbu	a4,18(s3)
    80003c9c:	01071713          	slli	a4,a4,0x10
    80003ca0:	00d766b3          	or	a3,a4,a3
    80003ca4:	0139c703          	lbu	a4,19(s3)
    80003ca8:	01871713          	slli	a4,a4,0x18
    80003cac:	00d76733          	or	a4,a4,a3
    80003cb0:	0149c683          	lbu	a3,20(s3)
    80003cb4:	02069693          	slli	a3,a3,0x20
    80003cb8:	00e6e733          	or	a4,a3,a4
    80003cbc:	0159c683          	lbu	a3,21(s3)
    80003cc0:	02869693          	slli	a3,a3,0x28
    80003cc4:	00e6e6b3          	or	a3,a3,a4
    80003cc8:	0169c703          	lbu	a4,22(s3)
    80003ccc:	03071713          	slli	a4,a4,0x30
    80003cd0:	00d766b3          	or	a3,a4,a3
    80003cd4:	0179c703          	lbu	a4,23(s3)
    80003cd8:	03871713          	slli	a4,a4,0x38
    80003cdc:	00d76733          	or	a4,a4,a3
    80003ce0:	00170693          	addi	a3,a4,1
    80003ce4:	00669693          	slli	a3,a3,0x6
    80003ce8:	00d986b3          	add	a3,s3,a3
    80003cec:	58f68863          	beq	a3,a5,8000427c <_ZN11HeapManager8heapFreeEPv+0x864>
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree;
        }
    }
    return 0;
}
    80003cf0:	00000513          	li	a0,0
    80003cf4:	03813083          	ld	ra,56(sp)
    80003cf8:	03013403          	ld	s0,48(sp)
    80003cfc:	02813483          	ld	s1,40(sp)
    80003d00:	02013903          	ld	s2,32(sp)
    80003d04:	01813983          	ld	s3,24(sp)
    80003d08:	01013a03          	ld	s4,16(sp)
    80003d0c:	00813a83          	ld	s5,8(sp)
    80003d10:	04010113          	addi	sp,sp,64
    80003d14:	00008067          	ret
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003d18:	00004697          	auipc	a3,0x4
    80003d1c:	50068693          	addi	a3,a3,1280 # 80008218 <CONSOLE_STATUS+0x208>
    80003d20:	05500613          	li	a2,85
    80003d24:	00004597          	auipc	a1,0x4
    80003d28:	41458593          	addi	a1,a1,1044 # 80008138 <CONSOLE_STATUS+0x128>
    80003d2c:	00004517          	auipc	a0,0x4
    80003d30:	51450513          	addi	a0,a0,1300 # 80008240 <CONSOLE_STATUS+0x230>
    80003d34:	ffffe097          	auipc	ra,0xffffe
    80003d38:	dd8080e7          	jalr	-552(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    80003d3c:	d49ff06f          	j	80003a84 <_ZN11HeapManager8heapFreeEPv+0x6c>
            pInsert = pInsert->pNext;
    80003d40:	0004c703          	lbu	a4,0(s1)
    80003d44:	0014c783          	lbu	a5,1(s1)
    80003d48:	00879793          	slli	a5,a5,0x8
    80003d4c:	00e7e733          	or	a4,a5,a4
    80003d50:	0024c783          	lbu	a5,2(s1)
    80003d54:	01079793          	slli	a5,a5,0x10
    80003d58:	00e7e7b3          	or	a5,a5,a4
    80003d5c:	0034c703          	lbu	a4,3(s1)
    80003d60:	01871713          	slli	a4,a4,0x18
    80003d64:	00f767b3          	or	a5,a4,a5
    80003d68:	0044c703          	lbu	a4,4(s1)
    80003d6c:	02071713          	slli	a4,a4,0x20
    80003d70:	00f76733          	or	a4,a4,a5
    80003d74:	0054c783          	lbu	a5,5(s1)
    80003d78:	02879793          	slli	a5,a5,0x28
    80003d7c:	00e7e733          	or	a4,a5,a4
    80003d80:	0064c783          	lbu	a5,6(s1)
    80003d84:	03079793          	slli	a5,a5,0x30
    80003d88:	00e7e7b3          	or	a5,a5,a4
    80003d8c:	0074c483          	lbu	s1,7(s1)
    80003d90:	03849493          	slli	s1,s1,0x38
    80003d94:	00f4e4b3          	or	s1,s1,a5
        while(pInsert->pNext != 0 && pInsert->pNext < pAddress){
    80003d98:	0004c783          	lbu	a5,0(s1)
    80003d9c:	0014c703          	lbu	a4,1(s1)
    80003da0:	00871713          	slli	a4,a4,0x8
    80003da4:	00f76733          	or	a4,a4,a5
    80003da8:	0024c783          	lbu	a5,2(s1)
    80003dac:	01079793          	slli	a5,a5,0x10
    80003db0:	00e7e733          	or	a4,a5,a4
    80003db4:	0034c783          	lbu	a5,3(s1)
    80003db8:	01879793          	slli	a5,a5,0x18
    80003dbc:	00e7e7b3          	or	a5,a5,a4
    80003dc0:	0044c703          	lbu	a4,4(s1)
    80003dc4:	02071713          	slli	a4,a4,0x20
    80003dc8:	00f767b3          	or	a5,a4,a5
    80003dcc:	0054c703          	lbu	a4,5(s1)
    80003dd0:	02871713          	slli	a4,a4,0x28
    80003dd4:	00f76733          	or	a4,a4,a5
    80003dd8:	0064c783          	lbu	a5,6(s1)
    80003ddc:	03079793          	slli	a5,a5,0x30
    80003de0:	00e7e733          	or	a4,a5,a4
    80003de4:	0074c783          	lbu	a5,7(s1)
    80003de8:	03879793          	slli	a5,a5,0x38
    80003dec:	00e7e7b3          	or	a5,a5,a4
    80003df0:	06078463          	beqz	a5,80003e58 <_ZN11HeapManager8heapFreeEPv+0x440>
    80003df4:	0747f263          	bgeu	a5,s4,80003e58 <_ZN11HeapManager8heapFreeEPv+0x440>
            assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    80003df8:	0184c783          	lbu	a5,24(s1)
    80003dfc:	0194c703          	lbu	a4,25(s1)
    80003e00:	00871713          	slli	a4,a4,0x8
    80003e04:	00f76733          	or	a4,a4,a5
    80003e08:	01a4c783          	lbu	a5,26(s1)
    80003e0c:	01079793          	slli	a5,a5,0x10
    80003e10:	00e7e733          	or	a4,a5,a4
    80003e14:	01b4c783          	lbu	a5,27(s1)
    80003e18:	01879793          	slli	a5,a5,0x18
    80003e1c:	00e7e7b3          	or	a5,a5,a4
    80003e20:	0007879b          	sext.w	a5,a5
    80003e24:	deadc737          	lui	a4,0xdeadc
    80003e28:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead1bce>
    80003e2c:	f0e78ae3          	beq	a5,a4,80003d40 <_ZN11HeapManager8heapFreeEPv+0x328>
    80003e30:	00004697          	auipc	a3,0x4
    80003e34:	3e868693          	addi	a3,a3,1000 # 80008218 <CONSOLE_STATUS+0x208>
    80003e38:	05e00613          	li	a2,94
    80003e3c:	00004597          	auipc	a1,0x4
    80003e40:	2fc58593          	addi	a1,a1,764 # 80008138 <CONSOLE_STATUS+0x128>
    80003e44:	00004517          	auipc	a0,0x4
    80003e48:	42450513          	addi	a0,a0,1060 # 80008268 <CONSOLE_STATUS+0x258>
    80003e4c:	ffffe097          	auipc	ra,0xffffe
    80003e50:	cc0080e7          	jalr	-832(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    80003e54:	eedff06f          	j	80003d40 <_ZN11HeapManager8heapFreeEPv+0x328>
        pFree->pNext = pInsert->pNext;
    80003e58:	fcfa0023          	sb	a5,-64(s4)
    80003e5c:	0087d713          	srli	a4,a5,0x8
    80003e60:	00e900a3          	sb	a4,1(s2)
    80003e64:	0107d713          	srli	a4,a5,0x10
    80003e68:	00e90123          	sb	a4,2(s2)
    80003e6c:	0187d71b          	srliw	a4,a5,0x18
    80003e70:	00e901a3          	sb	a4,3(s2)
    80003e74:	0207d713          	srli	a4,a5,0x20
    80003e78:	00e90223          	sb	a4,4(s2)
    80003e7c:	0287d713          	srli	a4,a5,0x28
    80003e80:	00e902a3          	sb	a4,5(s2)
    80003e84:	0307d713          	srli	a4,a5,0x30
    80003e88:	00e90323          	sb	a4,6(s2)
    80003e8c:	0387d793          	srli	a5,a5,0x38
    80003e90:	00f903a3          	sb	a5,7(s2)
        pFree->pPrev = pInsert;
    80003e94:	00990423          	sb	s1,8(s2)
    80003e98:	0084d793          	srli	a5,s1,0x8
    80003e9c:	00f904a3          	sb	a5,9(s2)
    80003ea0:	0104d793          	srli	a5,s1,0x10
    80003ea4:	00f90523          	sb	a5,10(s2)
    80003ea8:	0184d79b          	srliw	a5,s1,0x18
    80003eac:	00f905a3          	sb	a5,11(s2)
    80003eb0:	0204d793          	srli	a5,s1,0x20
    80003eb4:	00f90623          	sb	a5,12(s2)
    80003eb8:	0284d793          	srli	a5,s1,0x28
    80003ebc:	00f906a3          	sb	a5,13(s2)
    80003ec0:	0304d793          	srli	a5,s1,0x30
    80003ec4:	00f90723          	sb	a5,14(s2)
    80003ec8:	0384d793          	srli	a5,s1,0x38
    80003ecc:	00f907a3          	sb	a5,15(s2)
        if(pInsert->pNext != 0){
    80003ed0:	0004c783          	lbu	a5,0(s1)
    80003ed4:	0014c703          	lbu	a4,1(s1)
    80003ed8:	00871713          	slli	a4,a4,0x8
    80003edc:	00f76733          	or	a4,a4,a5
    80003ee0:	0024c783          	lbu	a5,2(s1)
    80003ee4:	01079793          	slli	a5,a5,0x10
    80003ee8:	00e7e733          	or	a4,a5,a4
    80003eec:	0034c783          	lbu	a5,3(s1)
    80003ef0:	01879793          	slli	a5,a5,0x18
    80003ef4:	00e7e7b3          	or	a5,a5,a4
    80003ef8:	0044c703          	lbu	a4,4(s1)
    80003efc:	02071713          	slli	a4,a4,0x20
    80003f00:	00f767b3          	or	a5,a4,a5
    80003f04:	0054c703          	lbu	a4,5(s1)
    80003f08:	02871713          	slli	a4,a4,0x28
    80003f0c:	00f76733          	or	a4,a4,a5
    80003f10:	0064c783          	lbu	a5,6(s1)
    80003f14:	03079793          	slli	a5,a5,0x30
    80003f18:	00e7e733          	or	a4,a5,a4
    80003f1c:	0074c783          	lbu	a5,7(s1)
    80003f20:	03879793          	slli	a5,a5,0x38
    80003f24:	00e7e7b3          	or	a5,a5,a4
    80003f28:	04078063          	beqz	a5,80003f68 <_ZN11HeapManager8heapFreeEPv+0x550>
            pInsert->pNext->pPrev = pFree;
    80003f2c:	01278423          	sb	s2,8(a5)
    80003f30:	00895713          	srli	a4,s2,0x8
    80003f34:	00e784a3          	sb	a4,9(a5)
    80003f38:	01095713          	srli	a4,s2,0x10
    80003f3c:	00e78523          	sb	a4,10(a5)
    80003f40:	0189571b          	srliw	a4,s2,0x18
    80003f44:	00e785a3          	sb	a4,11(a5)
    80003f48:	02095713          	srli	a4,s2,0x20
    80003f4c:	00e78623          	sb	a4,12(a5)
    80003f50:	02895713          	srli	a4,s2,0x28
    80003f54:	00e786a3          	sb	a4,13(a5)
    80003f58:	03095713          	srli	a4,s2,0x30
    80003f5c:	00e78723          	sb	a4,14(a5)
    80003f60:	03895713          	srli	a4,s2,0x38
    80003f64:	00e787a3          	sb	a4,15(a5)
        pInsert->pNext = pFree;
    80003f68:	01248023          	sb	s2,0(s1)
    80003f6c:	00895793          	srli	a5,s2,0x8
    80003f70:	00f480a3          	sb	a5,1(s1)
    80003f74:	01095793          	srli	a5,s2,0x10
    80003f78:	00f48123          	sb	a5,2(s1)
    80003f7c:	0189579b          	srliw	a5,s2,0x18
    80003f80:	00f481a3          	sb	a5,3(s1)
    80003f84:	02095793          	srli	a5,s2,0x20
    80003f88:	00f48223          	sb	a5,4(s1)
    80003f8c:	02895793          	srli	a5,s2,0x28
    80003f90:	00f482a3          	sb	a5,5(s1)
    80003f94:	03095793          	srli	a5,s2,0x30
    80003f98:	00f48323          	sb	a5,6(s1)
    80003f9c:	03895793          	srli	a5,s2,0x38
    80003fa0:	00f483a3          	sb	a5,7(s1)
    80003fa4:	bc5ff06f          	j	80003b68 <_ZN11HeapManager8heapFreeEPv+0x150>
        pFree->pPrev->nSize += pFree->nSize + 1;
    80003fa8:	01094683          	lbu	a3,16(s2)
    80003fac:	01194603          	lbu	a2,17(s2)
    80003fb0:	00861613          	slli	a2,a2,0x8
    80003fb4:	00d66633          	or	a2,a2,a3
    80003fb8:	01294683          	lbu	a3,18(s2)
    80003fbc:	01069693          	slli	a3,a3,0x10
    80003fc0:	00c6e633          	or	a2,a3,a2
    80003fc4:	01394683          	lbu	a3,19(s2)
    80003fc8:	01869693          	slli	a3,a3,0x18
    80003fcc:	00c6e6b3          	or	a3,a3,a2
    80003fd0:	01494603          	lbu	a2,20(s2)
    80003fd4:	02061613          	slli	a2,a2,0x20
    80003fd8:	00d666b3          	or	a3,a2,a3
    80003fdc:	01594603          	lbu	a2,21(s2)
    80003fe0:	02861613          	slli	a2,a2,0x28
    80003fe4:	00d66633          	or	a2,a2,a3
    80003fe8:	01694683          	lbu	a3,22(s2)
    80003fec:	03069693          	slli	a3,a3,0x30
    80003ff0:	00c6e633          	or	a2,a3,a2
    80003ff4:	01794683          	lbu	a3,23(s2)
    80003ff8:	03869693          	slli	a3,a3,0x38
    80003ffc:	00c6e6b3          	or	a3,a3,a2
    80004000:	00d70733          	add	a4,a4,a3
    80004004:	00170713          	addi	a4,a4,1
    80004008:	00e78823          	sb	a4,16(a5)
    8000400c:	00875693          	srli	a3,a4,0x8
    80004010:	00d788a3          	sb	a3,17(a5)
    80004014:	01075693          	srli	a3,a4,0x10
    80004018:	00d78923          	sb	a3,18(a5)
    8000401c:	0187569b          	srliw	a3,a4,0x18
    80004020:	00d789a3          	sb	a3,19(a5)
    80004024:	02075693          	srli	a3,a4,0x20
    80004028:	00d78a23          	sb	a3,20(a5)
    8000402c:	02875693          	srli	a3,a4,0x28
    80004030:	00d78aa3          	sb	a3,21(a5)
    80004034:	03075693          	srli	a3,a4,0x30
    80004038:	00d78b23          	sb	a3,22(a5)
    8000403c:	03875713          	srli	a4,a4,0x38
    80004040:	00e78ba3          	sb	a4,23(a5)
        pFree->pPrev->pNext = pFree->pNext;
    80004044:	00894703          	lbu	a4,8(s2)
    80004048:	00994783          	lbu	a5,9(s2)
    8000404c:	00879793          	slli	a5,a5,0x8
    80004050:	00e7e7b3          	or	a5,a5,a4
    80004054:	00a94703          	lbu	a4,10(s2)
    80004058:	01071713          	slli	a4,a4,0x10
    8000405c:	00f767b3          	or	a5,a4,a5
    80004060:	00b94703          	lbu	a4,11(s2)
    80004064:	01871713          	slli	a4,a4,0x18
    80004068:	00f76733          	or	a4,a4,a5
    8000406c:	00c94783          	lbu	a5,12(s2)
    80004070:	02079793          	slli	a5,a5,0x20
    80004074:	00e7e733          	or	a4,a5,a4
    80004078:	00d94783          	lbu	a5,13(s2)
    8000407c:	02879793          	slli	a5,a5,0x28
    80004080:	00e7e7b3          	or	a5,a5,a4
    80004084:	00e94703          	lbu	a4,14(s2)
    80004088:	03071713          	slli	a4,a4,0x30
    8000408c:	00f767b3          	or	a5,a4,a5
    80004090:	00f94703          	lbu	a4,15(s2)
    80004094:	03871713          	slli	a4,a4,0x38
    80004098:	00f76733          	or	a4,a4,a5
    8000409c:	fc0a4783          	lbu	a5,-64(s4)
    800040a0:	00194683          	lbu	a3,1(s2)
    800040a4:	00869693          	slli	a3,a3,0x8
    800040a8:	00f6e7b3          	or	a5,a3,a5
    800040ac:	00294683          	lbu	a3,2(s2)
    800040b0:	01069693          	slli	a3,a3,0x10
    800040b4:	00f6e6b3          	or	a3,a3,a5
    800040b8:	00394783          	lbu	a5,3(s2)
    800040bc:	01879793          	slli	a5,a5,0x18
    800040c0:	00d7e6b3          	or	a3,a5,a3
    800040c4:	00494783          	lbu	a5,4(s2)
    800040c8:	02079793          	slli	a5,a5,0x20
    800040cc:	00d7e7b3          	or	a5,a5,a3
    800040d0:	00594683          	lbu	a3,5(s2)
    800040d4:	02869693          	slli	a3,a3,0x28
    800040d8:	00f6e7b3          	or	a5,a3,a5
    800040dc:	00694683          	lbu	a3,6(s2)
    800040e0:	03069693          	slli	a3,a3,0x30
    800040e4:	00f6e6b3          	or	a3,a3,a5
    800040e8:	00794783          	lbu	a5,7(s2)
    800040ec:	03879793          	slli	a5,a5,0x38
    800040f0:	00d7e7b3          	or	a5,a5,a3
    800040f4:	00d70023          	sb	a3,0(a4)
    800040f8:	0087d693          	srli	a3,a5,0x8
    800040fc:	00d700a3          	sb	a3,1(a4)
    80004100:	0107d693          	srli	a3,a5,0x10
    80004104:	00d70123          	sb	a3,2(a4)
    80004108:	0187d69b          	srliw	a3,a5,0x18
    8000410c:	00d701a3          	sb	a3,3(a4)
    80004110:	0207d693          	srli	a3,a5,0x20
    80004114:	00d70223          	sb	a3,4(a4)
    80004118:	0287d693          	srli	a3,a5,0x28
    8000411c:	00d702a3          	sb	a3,5(a4)
    80004120:	0307d693          	srli	a3,a5,0x30
    80004124:	00d70323          	sb	a3,6(a4)
    80004128:	0387d793          	srli	a5,a5,0x38
    8000412c:	00f703a3          	sb	a5,7(a4)
        if(pFree->pNext != 0){
    80004130:	fc0a4783          	lbu	a5,-64(s4)
    80004134:	00194703          	lbu	a4,1(s2)
    80004138:	00871713          	slli	a4,a4,0x8
    8000413c:	00f76733          	or	a4,a4,a5
    80004140:	00294783          	lbu	a5,2(s2)
    80004144:	01079793          	slli	a5,a5,0x10
    80004148:	00e7e733          	or	a4,a5,a4
    8000414c:	00394783          	lbu	a5,3(s2)
    80004150:	01879793          	slli	a5,a5,0x18
    80004154:	00e7e7b3          	or	a5,a5,a4
    80004158:	00494703          	lbu	a4,4(s2)
    8000415c:	02071713          	slli	a4,a4,0x20
    80004160:	00f767b3          	or	a5,a4,a5
    80004164:	00594703          	lbu	a4,5(s2)
    80004168:	02871713          	slli	a4,a4,0x28
    8000416c:	00f76733          	or	a4,a4,a5
    80004170:	00694783          	lbu	a5,6(s2)
    80004174:	03079793          	slli	a5,a5,0x30
    80004178:	00e7e733          	or	a4,a5,a4
    8000417c:	00794783          	lbu	a5,7(s2)
    80004180:	03879793          	slli	a5,a5,0x38
    80004184:	00e7e7b3          	or	a5,a5,a4
    80004188:	08078c63          	beqz	a5,80004220 <_ZN11HeapManager8heapFreeEPv+0x808>
            pFree->pNext->pPrev = pFree->pPrev;
    8000418c:	00894703          	lbu	a4,8(s2)
    80004190:	00994683          	lbu	a3,9(s2)
    80004194:	00869693          	slli	a3,a3,0x8
    80004198:	00e6e733          	or	a4,a3,a4
    8000419c:	00a94683          	lbu	a3,10(s2)
    800041a0:	01069693          	slli	a3,a3,0x10
    800041a4:	00e6e6b3          	or	a3,a3,a4
    800041a8:	00b94703          	lbu	a4,11(s2)
    800041ac:	01871713          	slli	a4,a4,0x18
    800041b0:	00d766b3          	or	a3,a4,a3
    800041b4:	00c94703          	lbu	a4,12(s2)
    800041b8:	02071713          	slli	a4,a4,0x20
    800041bc:	00d76733          	or	a4,a4,a3
    800041c0:	00d94683          	lbu	a3,13(s2)
    800041c4:	02869693          	slli	a3,a3,0x28
    800041c8:	00e6e733          	or	a4,a3,a4
    800041cc:	00e94683          	lbu	a3,14(s2)
    800041d0:	03069693          	slli	a3,a3,0x30
    800041d4:	00e6e6b3          	or	a3,a3,a4
    800041d8:	00f94703          	lbu	a4,15(s2)
    800041dc:	03871713          	slli	a4,a4,0x38
    800041e0:	00d76733          	or	a4,a4,a3
    800041e4:	00d78423          	sb	a3,8(a5)
    800041e8:	00875693          	srli	a3,a4,0x8
    800041ec:	00d784a3          	sb	a3,9(a5)
    800041f0:	01075693          	srli	a3,a4,0x10
    800041f4:	00d78523          	sb	a3,10(a5)
    800041f8:	0187569b          	srliw	a3,a4,0x18
    800041fc:	00d785a3          	sb	a3,11(a5)
    80004200:	02075693          	srli	a3,a4,0x20
    80004204:	00d78623          	sb	a3,12(a5)
    80004208:	02875693          	srli	a3,a4,0x28
    8000420c:	00d786a3          	sb	a3,13(a5)
    80004210:	03075693          	srli	a3,a4,0x30
    80004214:	00d78723          	sb	a3,14(a5)
    80004218:	03875713          	srli	a4,a4,0x38
    8000421c:	00e787a3          	sb	a4,15(a5)
        }pFree = pFree->pPrev;
    80004220:	00894983          	lbu	s3,8(s2)
    80004224:	00994783          	lbu	a5,9(s2)
    80004228:	00879793          	slli	a5,a5,0x8
    8000422c:	0137e7b3          	or	a5,a5,s3
    80004230:	00a94983          	lbu	s3,10(s2)
    80004234:	01099993          	slli	s3,s3,0x10
    80004238:	00f9e7b3          	or	a5,s3,a5
    8000423c:	00b94983          	lbu	s3,11(s2)
    80004240:	01899993          	slli	s3,s3,0x18
    80004244:	00f9e9b3          	or	s3,s3,a5
    80004248:	00c94783          	lbu	a5,12(s2)
    8000424c:	02079793          	slli	a5,a5,0x20
    80004250:	0137e9b3          	or	s3,a5,s3
    80004254:	00d94783          	lbu	a5,13(s2)
    80004258:	02879793          	slli	a5,a5,0x28
    8000425c:	0137e7b3          	or	a5,a5,s3
    80004260:	00e94983          	lbu	s3,14(s2)
    80004264:	03099993          	slli	s3,s3,0x30
    80004268:	00f9e7b3          	or	a5,s3,a5
    8000426c:	00f94983          	lbu	s3,15(s2)
    80004270:	03899993          	slli	s3,s3,0x38
    80004274:	00f9e9b3          	or	s3,s3,a5
    80004278:	9b5ff06f          	j	80003c2c <_ZN11HeapManager8heapFreeEPv+0x214>
        pFree->nSize += pFree->pNext->nSize + 1;
    8000427c:	0107c683          	lbu	a3,16(a5)
    80004280:	0117c603          	lbu	a2,17(a5)
    80004284:	00861613          	slli	a2,a2,0x8
    80004288:	00d66633          	or	a2,a2,a3
    8000428c:	0127c683          	lbu	a3,18(a5)
    80004290:	01069693          	slli	a3,a3,0x10
    80004294:	00c6e633          	or	a2,a3,a2
    80004298:	0137c683          	lbu	a3,19(a5)
    8000429c:	01869693          	slli	a3,a3,0x18
    800042a0:	00c6e6b3          	or	a3,a3,a2
    800042a4:	0147c603          	lbu	a2,20(a5)
    800042a8:	02061613          	slli	a2,a2,0x20
    800042ac:	00d666b3          	or	a3,a2,a3
    800042b0:	0157c603          	lbu	a2,21(a5)
    800042b4:	02861613          	slli	a2,a2,0x28
    800042b8:	00d66633          	or	a2,a2,a3
    800042bc:	0167c683          	lbu	a3,22(a5)
    800042c0:	03069693          	slli	a3,a3,0x30
    800042c4:	00c6e633          	or	a2,a3,a2
    800042c8:	0177c683          	lbu	a3,23(a5)
    800042cc:	03869693          	slli	a3,a3,0x38
    800042d0:	00c6e6b3          	or	a3,a3,a2
    800042d4:	00d70733          	add	a4,a4,a3
    800042d8:	00170713          	addi	a4,a4,1
    800042dc:	00e98823          	sb	a4,16(s3)
    800042e0:	00875693          	srli	a3,a4,0x8
    800042e4:	00d988a3          	sb	a3,17(s3)
    800042e8:	01075693          	srli	a3,a4,0x10
    800042ec:	00d98923          	sb	a3,18(s3)
    800042f0:	0187569b          	srliw	a3,a4,0x18
    800042f4:	00d989a3          	sb	a3,19(s3)
    800042f8:	02075693          	srli	a3,a4,0x20
    800042fc:	00d98a23          	sb	a3,20(s3)
    80004300:	02875693          	srli	a3,a4,0x28
    80004304:	00d98aa3          	sb	a3,21(s3)
    80004308:	03075693          	srli	a3,a4,0x30
    8000430c:	00d98b23          	sb	a3,22(s3)
    80004310:	03875713          	srli	a4,a4,0x38
    80004314:	00e98ba3          	sb	a4,23(s3)
        pFree->pNext = pFree->pNext->pNext;
    80004318:	0007c683          	lbu	a3,0(a5)
    8000431c:	0017c703          	lbu	a4,1(a5)
    80004320:	00871713          	slli	a4,a4,0x8
    80004324:	00d766b3          	or	a3,a4,a3
    80004328:	0027c703          	lbu	a4,2(a5)
    8000432c:	01071713          	slli	a4,a4,0x10
    80004330:	00d76733          	or	a4,a4,a3
    80004334:	0037c683          	lbu	a3,3(a5)
    80004338:	01869693          	slli	a3,a3,0x18
    8000433c:	00e6e733          	or	a4,a3,a4
    80004340:	0047c683          	lbu	a3,4(a5)
    80004344:	02069693          	slli	a3,a3,0x20
    80004348:	00e6e6b3          	or	a3,a3,a4
    8000434c:	0057c703          	lbu	a4,5(a5)
    80004350:	02871713          	slli	a4,a4,0x28
    80004354:	00d766b3          	or	a3,a4,a3
    80004358:	0067c703          	lbu	a4,6(a5)
    8000435c:	03071713          	slli	a4,a4,0x30
    80004360:	00d76733          	or	a4,a4,a3
    80004364:	0077c783          	lbu	a5,7(a5)
    80004368:	03879793          	slli	a5,a5,0x38
    8000436c:	00e7e7b3          	or	a5,a5,a4
    80004370:	00e98023          	sb	a4,0(s3)
    80004374:	0087d713          	srli	a4,a5,0x8
    80004378:	00e980a3          	sb	a4,1(s3)
    8000437c:	0107d713          	srli	a4,a5,0x10
    80004380:	00e98123          	sb	a4,2(s3)
    80004384:	0187d71b          	srliw	a4,a5,0x18
    80004388:	00e981a3          	sb	a4,3(s3)
    8000438c:	0207d713          	srli	a4,a5,0x20
    80004390:	00e98223          	sb	a4,4(s3)
    80004394:	0287d713          	srli	a4,a5,0x28
    80004398:	00e982a3          	sb	a4,5(s3)
    8000439c:	0307d713          	srli	a4,a5,0x30
    800043a0:	00e98323          	sb	a4,6(s3)
    800043a4:	0387d713          	srli	a4,a5,0x38
    800043a8:	00e983a3          	sb	a4,7(s3)
        if(pFree->pNext != 0){
    800043ac:	940782e3          	beqz	a5,80003cf0 <_ZN11HeapManager8heapFreeEPv+0x2d8>
            pFree->pNext->pPrev = pFree;
    800043b0:	01378423          	sb	s3,8(a5)
    800043b4:	0089d713          	srli	a4,s3,0x8
    800043b8:	00e784a3          	sb	a4,9(a5)
    800043bc:	0109d713          	srli	a4,s3,0x10
    800043c0:	00e78523          	sb	a4,10(a5)
    800043c4:	0189d71b          	srliw	a4,s3,0x18
    800043c8:	00e785a3          	sb	a4,11(a5)
    800043cc:	0209d713          	srli	a4,s3,0x20
    800043d0:	00e78623          	sb	a4,12(a5)
    800043d4:	0289d713          	srli	a4,s3,0x28
    800043d8:	00e786a3          	sb	a4,13(a5)
    800043dc:	0309d713          	srli	a4,s3,0x30
    800043e0:	00e78723          	sb	a4,14(a5)
    800043e4:	0389d993          	srli	s3,s3,0x38
    800043e8:	013787a3          	sb	s3,15(a5)
    800043ec:	905ff06f          	j	80003cf0 <_ZN11HeapManager8heapFreeEPv+0x2d8>

00000000800043f0 <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"
#include "assert.h"

extern "C" void exceptionHandler(){
    800043f0:	fc010113          	addi	sp,sp,-64
    800043f4:	02113c23          	sd	ra,56(sp)
    800043f8:	02813823          	sd	s0,48(sp)
    800043fc:	02913423          	sd	s1,40(sp)
    80004400:	03213023          	sd	s2,32(sp)
    80004404:	01313c23          	sd	s3,24(sp)
    80004408:	01413823          	sd	s4,16(sp)
    8000440c:	01513423          	sd	s5,8(sp)
    80004410:	01613023          	sd	s6,0(sp)
    80004414:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    80004418:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    8000441c:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    80004420:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    80004424:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80004428:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    8000442c:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80004430:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80004434:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80004438:	ff870613          	addi	a2,a4,-8
    8000443c:	00100693          	li	a3,1
    80004440:	04c6f463          	bgeu	a3,a2,80004488 <exceptionHandler+0x98>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    80004444:	00500793          	li	a5,5
    80004448:	20f70e63          	beq	a4,a5,80004664 <exceptionHandler+0x274>
                __putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    8000444c:	00700793          	li	a5,7
    80004450:	3cf70863          	beq	a4,a5,80004820 <exceptionHandler+0x430>
                __putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    80004454:	fff00793          	li	a5,-1
    80004458:	03f79793          	slli	a5,a5,0x3f
    8000445c:	00178793          	addi	a5,a5,1
    80004460:	58f70463          	beq	a4,a5,800049e8 <exceptionHandler+0x5f8>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    80004464:	fff00793          	li	a5,-1
    80004468:	03f79793          	slli	a5,a5,0x3f
    8000446c:	00978793          	addi	a5,a5,9
    80004470:	08f71863          	bne	a4,a5,80004500 <exceptionHandler+0x110>
    {   
        int irq = plic_claim();
    80004474:	00001097          	auipc	ra,0x1
    80004478:	240080e7          	jalr	576(ra) # 800056b4 <plic_claim>
        // if(irq == CONSOLE_IRQ)Console::console_handler();
        plic_complete(irq);
    8000447c:	00001097          	auipc	ra,0x1
    80004480:	270080e7          	jalr	624(ra) # 800056ec <plic_complete>
    80004484:	07c0006f          	j	80004500 <exceptionHandler+0x110>
        switch(a0){
    80004488:	04200713          	li	a4,66
    8000448c:	02f76463          	bltu	a4,a5,800044b4 <exceptionHandler+0xc4>
    80004490:	1c078263          	beqz	a5,80004654 <exceptionHandler+0x264>
    80004494:	1cf76463          	bltu	a4,a5,8000465c <exceptionHandler+0x26c>
    80004498:	00279793          	slli	a5,a5,0x2
    8000449c:	00004717          	auipc	a4,0x4
    800044a0:	e5870713          	addi	a4,a4,-424 # 800082f4 <CONSOLE_STATUS+0x2e4>
    800044a4:	00e787b3          	add	a5,a5,a4
    800044a8:	0007a783          	lw	a5,0(a5)
    800044ac:	00e787b3          	add	a5,a5,a4
    800044b0:	00078067          	jr	a5
    800044b4:	0ff00713          	li	a4,255
    800044b8:	02e79663          	bne	a5,a4,800044e4 <exceptionHandler+0xf4>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800044bc:	00000793          	li	a5,0
    800044c0:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800044c4:	00448493          	addi	s1,s1,4
    800044c8:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800044cc:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    800044d0:	10000793          	li	a5,256
    800044d4:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800044d8:	00200793          	li	a5,2
    800044dc:	1447b073          	csrc	sip,a5
                return;
    800044e0:	0200006f          	j	80004500 <exceptionHandler+0x110>
        switch(a0){
    800044e4:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800044e8:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800044ec:	00448493          	addi	s1,s1,4
    800044f0:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800044f4:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800044f8:	00200793          	li	a5,2
    800044fc:	1447b073          	csrc	sip,a5
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    80004500:	03813083          	ld	ra,56(sp)
    80004504:	03013403          	ld	s0,48(sp)
    80004508:	02813483          	ld	s1,40(sp)
    8000450c:	02013903          	ld	s2,32(sp)
    80004510:	01813983          	ld	s3,24(sp)
    80004514:	01013a03          	ld	s4,16(sp)
    80004518:	00813a83          	ld	s5,8(sp)
    8000451c:	00013b03          	ld	s6,0(sp)
    80004520:	04010113          	addi	sp,sp,64
    80004524:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80004528:	00098593          	mv	a1,s3
    8000452c:	00005797          	auipc	a5,0x5
    80004530:	cd47b783          	ld	a5,-812(a5) # 80009200 <_GLOBAL_OFFSET_TABLE_+0x18>
    80004534:	0007b503          	ld	a0,0(a5)
    80004538:	fffff097          	auipc	ra,0xfffff
    8000453c:	e88080e7          	jalr	-376(ra) # 800033c0 <_ZN11HeapManager12heapAllocateEm>
                break;
    80004540:	fa9ff06f          	j	800044e8 <exceptionHandler+0xf8>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    80004544:	00098593          	mv	a1,s3
    80004548:	00005797          	auipc	a5,0x5
    8000454c:	cb87b783          	ld	a5,-840(a5) # 80009200 <_GLOBAL_OFFSET_TABLE_+0x18>
    80004550:	0007b503          	ld	a0,0(a5)
    80004554:	fffff097          	auipc	ra,0xfffff
    80004558:	4c4080e7          	jalr	1220(ra) # 80003a18 <_ZN11HeapManager8heapFreeEPv>
                break;
    8000455c:	f8dff06f          	j	800044e8 <exceptionHandler+0xf8>
                __putc('\0'); /// removing this line causes everything to break
    80004560:	00000513          	li	a0,0
    80004564:	00003097          	auipc	ra,0x3
    80004568:	9b8080e7          	jalr	-1608(ra) # 80006f1c <__putc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    8000456c:	00100713          	li	a4,1
    80004570:	000b0693          	mv	a3,s6
    80004574:	000a8613          	mv	a2,s5
    80004578:	000a0593          	mv	a1,s4
    8000457c:	00098513          	mv	a0,s3
    80004580:	ffffe097          	auipc	ra,0xffffe
    80004584:	508080e7          	jalr	1288(ra) # 80002a88 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80004588:	f61ff06f          	j	800044e8 <exceptionHandler+0xf8>
                returnVal = _thread::currentThread->exit();
    8000458c:	fffff097          	auipc	ra,0xfffff
    80004590:	88c080e7          	jalr	-1908(ra) # 80002e18 <_ZN7_thread4exitEv>
                break;
    80004594:	f55ff06f          	j	800044e8 <exceptionHandler+0xf8>
                _thread::dispatch();
    80004598:	fffff097          	auipc	ra,0xfffff
    8000459c:	a90080e7          	jalr	-1392(ra) # 80003028 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    800045a0:	00000513          	li	a0,0
                break;
    800045a4:	f45ff06f          	j	800044e8 <exceptionHandler+0xf8>
                _thread::currentThread->join((thread_t)a1);
    800045a8:	00098593          	mv	a1,s3
    800045ac:	00005797          	auipc	a5,0x5
    800045b0:	c747b783          	ld	a5,-908(a5) # 80009220 <_GLOBAL_OFFSET_TABLE_+0x38>
    800045b4:	0007b503          	ld	a0,0(a5)
    800045b8:	ffffe097          	auipc	ra,0xffffe
    800045bc:	6a0080e7          	jalr	1696(ra) # 80002c58 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    800045c0:	00000513          	li	a0,0
                break;
    800045c4:	f25ff06f          	j	800044e8 <exceptionHandler+0xf8>
                _sem::open((sem_t*)a1, unsigned(a2));
    800045c8:	000a059b          	sext.w	a1,s4
    800045cc:	00098513          	mv	a0,s3
    800045d0:	ffffd097          	auipc	ra,0xffffd
    800045d4:	054080e7          	jalr	84(ra) # 80001624 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    800045d8:	00000513          	li	a0,0
                break;
    800045dc:	f0dff06f          	j	800044e8 <exceptionHandler+0xf8>
                _sem::close((sem_t)a1);
    800045e0:	00098513          	mv	a0,s3
    800045e4:	ffffd097          	auipc	ra,0xffffd
    800045e8:	09c080e7          	jalr	156(ra) # 80001680 <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    800045ec:	00000513          	li	a0,0
                break;
    800045f0:	ef9ff06f          	j	800044e8 <exceptionHandler+0xf8>
                _sem::wait((sem_t)a1);
    800045f4:	00098513          	mv	a0,s3
    800045f8:	ffffd097          	auipc	ra,0xffffd
    800045fc:	0dc080e7          	jalr	220(ra) # 800016d4 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    80004600:	00000513          	li	a0,0
                break;
    80004604:	ee5ff06f          	j	800044e8 <exceptionHandler+0xf8>
                _sem::signal((sem_t)a1);
    80004608:	00098513          	mv	a0,s3
    8000460c:	ffffd097          	auipc	ra,0xffffd
    80004610:	16c080e7          	jalr	364(ra) # 80001778 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80004614:	00000513          	li	a0,0
                break;
    80004618:	ed1ff06f          	j	800044e8 <exceptionHandler+0xf8>
                returnVal = Timer::getInstance().sleep(a1);
    8000461c:	ffffd097          	auipc	ra,0xffffd
    80004620:	b7c080e7          	jalr	-1156(ra) # 80001198 <_ZN5Timer11getInstanceEv>
    80004624:	00098593          	mv	a1,s3
    80004628:	ffffd097          	auipc	ra,0xffffd
    8000462c:	cb8080e7          	jalr	-840(ra) # 800012e0 <_ZN5Timer5sleepEm>
                break;
    80004630:	eb9ff06f          	j	800044e8 <exceptionHandler+0xf8>
                returnVal = __getc();
    80004634:	00003097          	auipc	ra,0x3
    80004638:	924080e7          	jalr	-1756(ra) # 80006f58 <__getc>
                break;
    8000463c:	eadff06f          	j	800044e8 <exceptionHandler+0xf8>
                __putc(a1);
    80004640:	0ff9f513          	andi	a0,s3,255
    80004644:	00003097          	auipc	ra,0x3
    80004648:	8d8080e7          	jalr	-1832(ra) # 80006f1c <__putc>
    uint64 returnVal = 0;
    8000464c:	00000513          	li	a0,0
                break;
    80004650:	e99ff06f          	j	800044e8 <exceptionHandler+0xf8>
        switch(a0){
    80004654:	00000513          	li	a0,0
    80004658:	e91ff06f          	j	800044e8 <exceptionHandler+0xf8>
    8000465c:	00000513          	li	a0,0
    80004660:	e89ff06f          	j	800044e8 <exceptionHandler+0xf8>
        __putc('\n');
    80004664:	00a00513          	li	a0,10
    80004668:	00003097          	auipc	ra,0x3
    8000466c:	8b4080e7          	jalr	-1868(ra) # 80006f1c <__putc>
        __putc('E');
    80004670:	04500513          	li	a0,69
    80004674:	00003097          	auipc	ra,0x3
    80004678:	8a8080e7          	jalr	-1880(ra) # 80006f1c <__putc>
        __putc('r');
    8000467c:	07200513          	li	a0,114
    80004680:	00003097          	auipc	ra,0x3
    80004684:	89c080e7          	jalr	-1892(ra) # 80006f1c <__putc>
        __putc('r');
    80004688:	07200513          	li	a0,114
    8000468c:	00003097          	auipc	ra,0x3
    80004690:	890080e7          	jalr	-1904(ra) # 80006f1c <__putc>
        __putc('o');
    80004694:	06f00513          	li	a0,111
    80004698:	00003097          	auipc	ra,0x3
    8000469c:	884080e7          	jalr	-1916(ra) # 80006f1c <__putc>
        __putc('r');
    800046a0:	07200513          	li	a0,114
    800046a4:	00003097          	auipc	ra,0x3
    800046a8:	878080e7          	jalr	-1928(ra) # 80006f1c <__putc>
        __putc(':');
    800046ac:	03a00513          	li	a0,58
    800046b0:	00003097          	auipc	ra,0x3
    800046b4:	86c080e7          	jalr	-1940(ra) # 80006f1c <__putc>
        __putc(' ');
    800046b8:	02000513          	li	a0,32
    800046bc:	00003097          	auipc	ra,0x3
    800046c0:	860080e7          	jalr	-1952(ra) # 80006f1c <__putc>
        __putc('i');
    800046c4:	06900513          	li	a0,105
    800046c8:	00003097          	auipc	ra,0x3
    800046cc:	854080e7          	jalr	-1964(ra) # 80006f1c <__putc>
        __putc('l');
    800046d0:	06c00513          	li	a0,108
    800046d4:	00003097          	auipc	ra,0x3
    800046d8:	848080e7          	jalr	-1976(ra) # 80006f1c <__putc>
        __putc('l');
    800046dc:	06c00513          	li	a0,108
    800046e0:	00003097          	auipc	ra,0x3
    800046e4:	83c080e7          	jalr	-1988(ra) # 80006f1c <__putc>
        __putc('e');
    800046e8:	06500513          	li	a0,101
    800046ec:	00003097          	auipc	ra,0x3
    800046f0:	830080e7          	jalr	-2000(ra) # 80006f1c <__putc>
        __putc('g');
    800046f4:	06700513          	li	a0,103
    800046f8:	00003097          	auipc	ra,0x3
    800046fc:	824080e7          	jalr	-2012(ra) # 80006f1c <__putc>
        __putc('a');
    80004700:	06100513          	li	a0,97
    80004704:	00003097          	auipc	ra,0x3
    80004708:	818080e7          	jalr	-2024(ra) # 80006f1c <__putc>
        __putc('l');
    8000470c:	06c00513          	li	a0,108
    80004710:	00003097          	auipc	ra,0x3
    80004714:	80c080e7          	jalr	-2036(ra) # 80006f1c <__putc>
        __putc(' ');
    80004718:	02000513          	li	a0,32
    8000471c:	00003097          	auipc	ra,0x3
    80004720:	800080e7          	jalr	-2048(ra) # 80006f1c <__putc>
        __putc('r');
    80004724:	07200513          	li	a0,114
    80004728:	00002097          	auipc	ra,0x2
    8000472c:	7f4080e7          	jalr	2036(ra) # 80006f1c <__putc>
        __putc('e');
    80004730:	06500513          	li	a0,101
    80004734:	00002097          	auipc	ra,0x2
    80004738:	7e8080e7          	jalr	2024(ra) # 80006f1c <__putc>
        __putc('a');
    8000473c:	06100513          	li	a0,97
    80004740:	00002097          	auipc	ra,0x2
    80004744:	7dc080e7          	jalr	2012(ra) # 80006f1c <__putc>
        __putc('d');
    80004748:	06400513          	li	a0,100
    8000474c:	00002097          	auipc	ra,0x2
    80004750:	7d0080e7          	jalr	2000(ra) # 80006f1c <__putc>
        __putc('!');
    80004754:	02100513          	li	a0,33
    80004758:	00002097          	auipc	ra,0x2
    8000475c:	7c4080e7          	jalr	1988(ra) # 80006f1c <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80004760:	14102973          	csrr	s2,sepc
        __putc('\n');
    80004764:	00a00513          	li	a0,10
    80004768:	00002097          	auipc	ra,0x2
    8000476c:	7b4080e7          	jalr	1972(ra) # 80006f1c <__putc>
        __putc('P');
    80004770:	05000513          	li	a0,80
    80004774:	00002097          	auipc	ra,0x2
    80004778:	7a8080e7          	jalr	1960(ra) # 80006f1c <__putc>
        __putc('C');
    8000477c:	04300513          	li	a0,67
    80004780:	00002097          	auipc	ra,0x2
    80004784:	79c080e7          	jalr	1948(ra) # 80006f1c <__putc>
        __putc(':');
    80004788:	03a00513          	li	a0,58
    8000478c:	00002097          	auipc	ra,0x2
    80004790:	790080e7          	jalr	1936(ra) # 80006f1c <__putc>
        __putc(' ');
    80004794:	02000513          	li	a0,32
    80004798:	00002097          	auipc	ra,0x2
    8000479c:	784080e7          	jalr	1924(ra) # 80006f1c <__putc>
        __putc('0');
    800047a0:	03000513          	li	a0,48
    800047a4:	00002097          	auipc	ra,0x2
    800047a8:	778080e7          	jalr	1912(ra) # 80006f1c <__putc>
        __putc('x');
    800047ac:	07800513          	li	a0,120
    800047b0:	00002097          	auipc	ra,0x2
    800047b4:	76c080e7          	jalr	1900(ra) # 80006f1c <__putc>
        for(int i = 15; i >= 0; i--){
    800047b8:	00f00493          	li	s1,15
    800047bc:	0140006f          	j	800047d0 <exceptionHandler+0x3e0>
                __putc('A' + tmp - 10);
    800047c0:	03750513          	addi	a0,a0,55
    800047c4:	00002097          	auipc	ra,0x2
    800047c8:	758080e7          	jalr	1880(ra) # 80006f1c <__putc>
        for(int i = 15; i >= 0; i--){
    800047cc:	fff4849b          	addiw	s1,s1,-1
    800047d0:	0204c463          	bltz	s1,800047f8 <exceptionHandler+0x408>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    800047d4:	0024951b          	slliw	a0,s1,0x2
    800047d8:	00a95533          	srl	a0,s2,a0
    800047dc:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    800047e0:	00900793          	li	a5,9
    800047e4:	fca7eee3          	bltu	a5,a0,800047c0 <exceptionHandler+0x3d0>
                __putc('0' + tmp);
    800047e8:	03050513          	addi	a0,a0,48
    800047ec:	00002097          	auipc	ra,0x2
    800047f0:	730080e7          	jalr	1840(ra) # 80006f1c <__putc>
    800047f4:	fd9ff06f          	j	800047cc <exceptionHandler+0x3dc>
        assert(false);
    800047f8:	00004697          	auipc	a3,0x4
    800047fc:	a9868693          	addi	a3,a3,-1384 # 80008290 <CONSOLE_STATUS+0x280>
    80004800:	08600613          	li	a2,134
    80004804:	00004597          	auipc	a1,0x4
    80004808:	aa458593          	addi	a1,a1,-1372 # 800082a8 <CONSOLE_STATUS+0x298>
    8000480c:	00004517          	auipc	a0,0x4
    80004810:	abc50513          	addi	a0,a0,-1348 # 800082c8 <CONSOLE_STATUS+0x2b8>
    80004814:	ffffd097          	auipc	ra,0xffffd
    80004818:	2f8080e7          	jalr	760(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    8000481c:	ce5ff06f          	j	80004500 <exceptionHandler+0x110>
        __putc('\n');
    80004820:	00a00513          	li	a0,10
    80004824:	00002097          	auipc	ra,0x2
    80004828:	6f8080e7          	jalr	1784(ra) # 80006f1c <__putc>
        __putc('E');
    8000482c:	04500513          	li	a0,69
    80004830:	00002097          	auipc	ra,0x2
    80004834:	6ec080e7          	jalr	1772(ra) # 80006f1c <__putc>
        __putc('r');
    80004838:	07200513          	li	a0,114
    8000483c:	00002097          	auipc	ra,0x2
    80004840:	6e0080e7          	jalr	1760(ra) # 80006f1c <__putc>
        __putc('r');
    80004844:	07200513          	li	a0,114
    80004848:	00002097          	auipc	ra,0x2
    8000484c:	6d4080e7          	jalr	1748(ra) # 80006f1c <__putc>
        __putc('o');
    80004850:	06f00513          	li	a0,111
    80004854:	00002097          	auipc	ra,0x2
    80004858:	6c8080e7          	jalr	1736(ra) # 80006f1c <__putc>
        __putc('r');
    8000485c:	07200513          	li	a0,114
    80004860:	00002097          	auipc	ra,0x2
    80004864:	6bc080e7          	jalr	1724(ra) # 80006f1c <__putc>
        __putc(':');
    80004868:	03a00513          	li	a0,58
    8000486c:	00002097          	auipc	ra,0x2
    80004870:	6b0080e7          	jalr	1712(ra) # 80006f1c <__putc>
        __putc(' ');
    80004874:	02000513          	li	a0,32
    80004878:	00002097          	auipc	ra,0x2
    8000487c:	6a4080e7          	jalr	1700(ra) # 80006f1c <__putc>
        __putc('i');
    80004880:	06900513          	li	a0,105
    80004884:	00002097          	auipc	ra,0x2
    80004888:	698080e7          	jalr	1688(ra) # 80006f1c <__putc>
        __putc('l');
    8000488c:	06c00513          	li	a0,108
    80004890:	00002097          	auipc	ra,0x2
    80004894:	68c080e7          	jalr	1676(ra) # 80006f1c <__putc>
        __putc('l');
    80004898:	06c00513          	li	a0,108
    8000489c:	00002097          	auipc	ra,0x2
    800048a0:	680080e7          	jalr	1664(ra) # 80006f1c <__putc>
        __putc('e');
    800048a4:	06500513          	li	a0,101
    800048a8:	00002097          	auipc	ra,0x2
    800048ac:	674080e7          	jalr	1652(ra) # 80006f1c <__putc>
        __putc('g');
    800048b0:	06700513          	li	a0,103
    800048b4:	00002097          	auipc	ra,0x2
    800048b8:	668080e7          	jalr	1640(ra) # 80006f1c <__putc>
        __putc('a');
    800048bc:	06100513          	li	a0,97
    800048c0:	00002097          	auipc	ra,0x2
    800048c4:	65c080e7          	jalr	1628(ra) # 80006f1c <__putc>
        __putc('l');
    800048c8:	06c00513          	li	a0,108
    800048cc:	00002097          	auipc	ra,0x2
    800048d0:	650080e7          	jalr	1616(ra) # 80006f1c <__putc>
        __putc(' ');
    800048d4:	02000513          	li	a0,32
    800048d8:	00002097          	auipc	ra,0x2
    800048dc:	644080e7          	jalr	1604(ra) # 80006f1c <__putc>
        __putc('w');
    800048e0:	07700513          	li	a0,119
    800048e4:	00002097          	auipc	ra,0x2
    800048e8:	638080e7          	jalr	1592(ra) # 80006f1c <__putc>
        __putc('r');
    800048ec:	07200513          	li	a0,114
    800048f0:	00002097          	auipc	ra,0x2
    800048f4:	62c080e7          	jalr	1580(ra) # 80006f1c <__putc>
        __putc('i');
    800048f8:	06900513          	li	a0,105
    800048fc:	00002097          	auipc	ra,0x2
    80004900:	620080e7          	jalr	1568(ra) # 80006f1c <__putc>
        __putc('t');
    80004904:	07400513          	li	a0,116
    80004908:	00002097          	auipc	ra,0x2
    8000490c:	614080e7          	jalr	1556(ra) # 80006f1c <__putc>
        __putc('e');
    80004910:	06500513          	li	a0,101
    80004914:	00002097          	auipc	ra,0x2
    80004918:	608080e7          	jalr	1544(ra) # 80006f1c <__putc>
        __putc('!');
    8000491c:	02100513          	li	a0,33
    80004920:	00002097          	auipc	ra,0x2
    80004924:	5fc080e7          	jalr	1532(ra) # 80006f1c <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80004928:	14102973          	csrr	s2,sepc
        __putc('\n');
    8000492c:	00a00513          	li	a0,10
    80004930:	00002097          	auipc	ra,0x2
    80004934:	5ec080e7          	jalr	1516(ra) # 80006f1c <__putc>
        __putc('P');
    80004938:	05000513          	li	a0,80
    8000493c:	00002097          	auipc	ra,0x2
    80004940:	5e0080e7          	jalr	1504(ra) # 80006f1c <__putc>
        __putc('C');
    80004944:	04300513          	li	a0,67
    80004948:	00002097          	auipc	ra,0x2
    8000494c:	5d4080e7          	jalr	1492(ra) # 80006f1c <__putc>
        __putc(':');
    80004950:	03a00513          	li	a0,58
    80004954:	00002097          	auipc	ra,0x2
    80004958:	5c8080e7          	jalr	1480(ra) # 80006f1c <__putc>
        __putc(' ');
    8000495c:	02000513          	li	a0,32
    80004960:	00002097          	auipc	ra,0x2
    80004964:	5bc080e7          	jalr	1468(ra) # 80006f1c <__putc>
        __putc('0');
    80004968:	03000513          	li	a0,48
    8000496c:	00002097          	auipc	ra,0x2
    80004970:	5b0080e7          	jalr	1456(ra) # 80006f1c <__putc>
        __putc('x');
    80004974:	07800513          	li	a0,120
    80004978:	00002097          	auipc	ra,0x2
    8000497c:	5a4080e7          	jalr	1444(ra) # 80006f1c <__putc>
        for(int i = 15; i >= 0; i--){
    80004980:	00f00493          	li	s1,15
    80004984:	0140006f          	j	80004998 <exceptionHandler+0x5a8>
                __putc('A' + tmp - 10);
    80004988:	03750513          	addi	a0,a0,55
    8000498c:	00002097          	auipc	ra,0x2
    80004990:	590080e7          	jalr	1424(ra) # 80006f1c <__putc>
        for(int i = 15; i >= 0; i--){
    80004994:	fff4849b          	addiw	s1,s1,-1
    80004998:	0204c463          	bltz	s1,800049c0 <exceptionHandler+0x5d0>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    8000499c:	0024951b          	slliw	a0,s1,0x2
    800049a0:	00a95533          	srl	a0,s2,a0
    800049a4:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    800049a8:	00900793          	li	a5,9
    800049ac:	fca7eee3          	bltu	a5,a0,80004988 <exceptionHandler+0x598>
                __putc('0' + tmp);
    800049b0:	03050513          	addi	a0,a0,48
    800049b4:	00002097          	auipc	ra,0x2
    800049b8:	568080e7          	jalr	1384(ra) # 80006f1c <__putc>
    800049bc:	fd9ff06f          	j	80004994 <exceptionHandler+0x5a4>
        assert(false);
    800049c0:	00004697          	auipc	a3,0x4
    800049c4:	8d068693          	addi	a3,a3,-1840 # 80008290 <CONSOLE_STATUS+0x280>
    800049c8:	0b000613          	li	a2,176
    800049cc:	00004597          	auipc	a1,0x4
    800049d0:	8dc58593          	addi	a1,a1,-1828 # 800082a8 <CONSOLE_STATUS+0x298>
    800049d4:	00004517          	auipc	a0,0x4
    800049d8:	8f450513          	addi	a0,a0,-1804 # 800082c8 <CONSOLE_STATUS+0x2b8>
    800049dc:	ffffd097          	auipc	ra,0xffffd
    800049e0:	130080e7          	jalr	304(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    800049e4:	b1dff06f          	j	80004500 <exceptionHandler+0x110>
        Timer::getInstance().tick();
    800049e8:	ffffc097          	auipc	ra,0xffffc
    800049ec:	7b0080e7          	jalr	1968(ra) # 80001198 <_ZN5Timer11getInstanceEv>
    800049f0:	ffffd097          	auipc	ra,0xffffd
    800049f4:	80c080e7          	jalr	-2036(ra) # 800011fc <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    800049f8:	00005797          	auipc	a5,0x5
    800049fc:	8287b783          	ld	a5,-2008(a5) # 80009220 <_GLOBAL_OFFSET_TABLE_+0x38>
    80004a00:	0007b503          	ld	a0,0(a5)
    80004a04:	ffffe097          	auipc	ra,0xffffe
    80004a08:	384080e7          	jalr	900(ra) # 80002d88 <_ZN7_thread4tickEv>
    80004a0c:	00051c63          	bnez	a0,80004a24 <exceptionHandler+0x634>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80004a10:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004a14:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80004a18:	00200793          	li	a5,2
    80004a1c:	1447b073          	csrc	sip,a5
    80004a20:	ae1ff06f          	j	80004500 <exceptionHandler+0x110>
        assert(_thread::currentThread->tick() == 0);
    80004a24:	00004697          	auipc	a3,0x4
    80004a28:	86c68693          	addi	a3,a3,-1940 # 80008290 <CONSOLE_STATUS+0x280>
    80004a2c:	0b400613          	li	a2,180
    80004a30:	00004597          	auipc	a1,0x4
    80004a34:	87858593          	addi	a1,a1,-1928 # 800082a8 <CONSOLE_STATUS+0x298>
    80004a38:	00004517          	auipc	a0,0x4
    80004a3c:	89850513          	addi	a0,a0,-1896 # 800082d0 <CONSOLE_STATUS+0x2c0>
    80004a40:	ffffd097          	auipc	ra,0xffffd
    80004a44:	0cc080e7          	jalr	204(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    80004a48:	fc9ff06f          	j	80004a10 <exceptionHandler+0x620>

0000000080004a4c <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80004a4c:	fe010113          	addi	sp,sp,-32
    80004a50:	00113c23          	sd	ra,24(sp)
    80004a54:	00813823          	sd	s0,16(sp)
    80004a58:	00913423          	sd	s1,8(sp)
    80004a5c:	02010413          	addi	s0,sp,32
    80004a60:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80004a64:	00005797          	auipc	a5,0x5
    80004a68:	8447b783          	ld	a5,-1980(a5) # 800092a8 <_ZN9Scheduler9singletonE>
    80004a6c:	02079463          	bnez	a5,80004a94 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80004a70:	00005797          	auipc	a5,0x5
    80004a74:	8297bc23          	sd	s1,-1992(a5) # 800092a8 <_ZN9Scheduler9singletonE>
    head = 0;
    80004a78:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80004a7c:	0004b423          	sd	zero,8(s1)
}
    80004a80:	01813083          	ld	ra,24(sp)
    80004a84:	01013403          	ld	s0,16(sp)
    80004a88:	00813483          	ld	s1,8(sp)
    80004a8c:	02010113          	addi	sp,sp,32
    80004a90:	00008067          	ret
    assert(singleton == 0);
    80004a94:	00004697          	auipc	a3,0x4
    80004a98:	96c68693          	addi	a3,a3,-1684 # 80008400 <CONSOLE_STATUS+0x3f0>
    80004a9c:	01800613          	li	a2,24
    80004aa0:	00004597          	auipc	a1,0x4
    80004aa4:	97858593          	addi	a1,a1,-1672 # 80008418 <CONSOLE_STATUS+0x408>
    80004aa8:	00004517          	auipc	a0,0x4
    80004aac:	98050513          	addi	a0,a0,-1664 # 80008428 <CONSOLE_STATUS+0x418>
    80004ab0:	ffffd097          	auipc	ra,0xffffd
    80004ab4:	05c080e7          	jalr	92(ra) # 80001b0c <_Z13assert_failedPKcS0_jS0_>
    80004ab8:	fb9ff06f          	j	80004a70 <_ZN9SchedulerC1Ev+0x24>

0000000080004abc <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80004abc:	ff010113          	addi	sp,sp,-16
    80004ac0:	00813423          	sd	s0,8(sp)
    80004ac4:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80004ac8:	00004797          	auipc	a5,0x4
    80004acc:	7e07b783          	ld	a5,2016(a5) # 800092a8 <_ZN9Scheduler9singletonE>
    80004ad0:	0007b503          	ld	a0,0(a5)
}
    80004ad4:	00153513          	seqz	a0,a0
    80004ad8:	00813403          	ld	s0,8(sp)
    80004adc:	01010113          	addi	sp,sp,16
    80004ae0:	00008067          	ret

0000000080004ae4 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80004ae4:	fe010113          	addi	sp,sp,-32
    80004ae8:	00113c23          	sd	ra,24(sp)
    80004aec:	00813823          	sd	s0,16(sp)
    80004af0:	00913423          	sd	s1,8(sp)
    80004af4:	01213023          	sd	s2,0(sp)
    80004af8:	02010413          	addi	s0,sp,32
    80004afc:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80004b00:	00004917          	auipc	s2,0x4
    80004b04:	7a893903          	ld	s2,1960(s2) # 800092a8 <_ZN9Scheduler9singletonE>
    80004b08:	00093783          	ld	a5,0(s2)
    80004b0c:	12078c63          	beqz	a5,80004c44 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80004b10:	00893903          	ld	s2,8(s2)
    80004b14:	01000513          	li	a0,16
    80004b18:	ffffd097          	auipc	ra,0xffffd
    80004b1c:	89c080e7          	jalr	-1892(ra) # 800013b4 <_Z9mem_allocm>
    80004b20:	00a90423          	sb	a0,8(s2)
    80004b24:	00855793          	srli	a5,a0,0x8
    80004b28:	00f904a3          	sb	a5,9(s2)
    80004b2c:	01055793          	srli	a5,a0,0x10
    80004b30:	00f90523          	sb	a5,10(s2)
    80004b34:	0185579b          	srliw	a5,a0,0x18
    80004b38:	00f905a3          	sb	a5,11(s2)
    80004b3c:	02055793          	srli	a5,a0,0x20
    80004b40:	00f90623          	sb	a5,12(s2)
    80004b44:	02855793          	srli	a5,a0,0x28
    80004b48:	00f906a3          	sb	a5,13(s2)
    80004b4c:	03055793          	srli	a5,a0,0x30
    80004b50:	00f90723          	sb	a5,14(s2)
    80004b54:	03855513          	srli	a0,a0,0x38
    80004b58:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80004b5c:	00004617          	auipc	a2,0x4
    80004b60:	74c60613          	addi	a2,a2,1868 # 800092a8 <_ZN9Scheduler9singletonE>
    80004b64:	00063583          	ld	a1,0(a2)
    80004b68:	0085b703          	ld	a4,8(a1)
    80004b6c:	00874783          	lbu	a5,8(a4)
    80004b70:	00974683          	lbu	a3,9(a4)
    80004b74:	00869693          	slli	a3,a3,0x8
    80004b78:	00f6e6b3          	or	a3,a3,a5
    80004b7c:	00a74783          	lbu	a5,10(a4)
    80004b80:	01079793          	slli	a5,a5,0x10
    80004b84:	00d7e6b3          	or	a3,a5,a3
    80004b88:	00b74783          	lbu	a5,11(a4)
    80004b8c:	01879793          	slli	a5,a5,0x18
    80004b90:	00d7e7b3          	or	a5,a5,a3
    80004b94:	00c74683          	lbu	a3,12(a4)
    80004b98:	02069693          	slli	a3,a3,0x20
    80004b9c:	00f6e7b3          	or	a5,a3,a5
    80004ba0:	00d74683          	lbu	a3,13(a4)
    80004ba4:	02869693          	slli	a3,a3,0x28
    80004ba8:	00f6e6b3          	or	a3,a3,a5
    80004bac:	00e74783          	lbu	a5,14(a4)
    80004bb0:	03079793          	slli	a5,a5,0x30
    80004bb4:	00d7e6b3          	or	a3,a5,a3
    80004bb8:	00f74783          	lbu	a5,15(a4)
    80004bbc:	03879793          	slli	a5,a5,0x38
    80004bc0:	00d7e7b3          	or	a5,a5,a3
    80004bc4:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80004bc8:	00978023          	sb	s1,0(a5)
    80004bcc:	0084d713          	srli	a4,s1,0x8
    80004bd0:	00e780a3          	sb	a4,1(a5)
    80004bd4:	0104d713          	srli	a4,s1,0x10
    80004bd8:	00e78123          	sb	a4,2(a5)
    80004bdc:	0184d71b          	srliw	a4,s1,0x18
    80004be0:	00e781a3          	sb	a4,3(a5)
    80004be4:	0204d713          	srli	a4,s1,0x20
    80004be8:	00e78223          	sb	a4,4(a5)
    80004bec:	0284d713          	srli	a4,s1,0x28
    80004bf0:	00e782a3          	sb	a4,5(a5)
    80004bf4:	0304d713          	srli	a4,s1,0x30
    80004bf8:	00e78323          	sb	a4,6(a5)
    80004bfc:	0384d493          	srli	s1,s1,0x38
    80004c00:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80004c04:	00063783          	ld	a5,0(a2)
    80004c08:	0087b783          	ld	a5,8(a5)
    80004c0c:	00078423          	sb	zero,8(a5)
    80004c10:	000784a3          	sb	zero,9(a5)
    80004c14:	00078523          	sb	zero,10(a5)
    80004c18:	000785a3          	sb	zero,11(a5)
    80004c1c:	00078623          	sb	zero,12(a5)
    80004c20:	000786a3          	sb	zero,13(a5)
    80004c24:	00078723          	sb	zero,14(a5)
    80004c28:	000787a3          	sb	zero,15(a5)
    }
}
    80004c2c:	01813083          	ld	ra,24(sp)
    80004c30:	01013403          	ld	s0,16(sp)
    80004c34:	00813483          	ld	s1,8(sp)
    80004c38:	00013903          	ld	s2,0(sp)
    80004c3c:	02010113          	addi	sp,sp,32
    80004c40:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80004c44:	01000513          	li	a0,16
    80004c48:	ffffc097          	auipc	ra,0xffffc
    80004c4c:	76c080e7          	jalr	1900(ra) # 800013b4 <_Z9mem_allocm>
    80004c50:	00a93423          	sd	a0,8(s2)
    80004c54:	00004717          	auipc	a4,0x4
    80004c58:	65470713          	addi	a4,a4,1620 # 800092a8 <_ZN9Scheduler9singletonE>
    80004c5c:	00073783          	ld	a5,0(a4)
    80004c60:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80004c64:	00073783          	ld	a5,0(a4)
    80004c68:	0007b783          	ld	a5,0(a5)
    80004c6c:	00978023          	sb	s1,0(a5)
    80004c70:	0084d693          	srli	a3,s1,0x8
    80004c74:	00d780a3          	sb	a3,1(a5)
    80004c78:	0104d693          	srli	a3,s1,0x10
    80004c7c:	00d78123          	sb	a3,2(a5)
    80004c80:	0184d69b          	srliw	a3,s1,0x18
    80004c84:	00d781a3          	sb	a3,3(a5)
    80004c88:	0204d693          	srli	a3,s1,0x20
    80004c8c:	00d78223          	sb	a3,4(a5)
    80004c90:	0284d693          	srli	a3,s1,0x28
    80004c94:	00d782a3          	sb	a3,5(a5)
    80004c98:	0304d693          	srli	a3,s1,0x30
    80004c9c:	00d78323          	sb	a3,6(a5)
    80004ca0:	0384d493          	srli	s1,s1,0x38
    80004ca4:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80004ca8:	00073783          	ld	a5,0(a4)
    80004cac:	0007b783          	ld	a5,0(a5)
    80004cb0:	00078423          	sb	zero,8(a5)
    80004cb4:	000784a3          	sb	zero,9(a5)
    80004cb8:	00078523          	sb	zero,10(a5)
    80004cbc:	000785a3          	sb	zero,11(a5)
    80004cc0:	00078623          	sb	zero,12(a5)
    80004cc4:	000786a3          	sb	zero,13(a5)
    80004cc8:	00078723          	sb	zero,14(a5)
    80004ccc:	000787a3          	sb	zero,15(a5)
    80004cd0:	f5dff06f          	j	80004c2c <_ZN9Scheduler3putEP7_thread+0x148>

0000000080004cd4 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80004cd4:	ff010113          	addi	sp,sp,-16
    80004cd8:	00813423          	sd	s0,8(sp)
    80004cdc:	01010413          	addi	s0,sp,16
    ThreadList* tmp = singleton->head;
    80004ce0:	00004617          	auipc	a2,0x4
    80004ce4:	5c863603          	ld	a2,1480(a2) # 800092a8 <_ZN9Scheduler9singletonE>
    80004ce8:	00063783          	ld	a5,0(a2)
    if(tmp == 0){
    80004cec:	0c078e63          	beqz	a5,80004dc8 <_ZN9Scheduler3getEv+0xf4>
        return 0;
    }
    thread_t thread = tmp->thread;
    80004cf0:	0007c503          	lbu	a0,0(a5)
    80004cf4:	0017c703          	lbu	a4,1(a5)
    80004cf8:	00871713          	slli	a4,a4,0x8
    80004cfc:	00a76733          	or	a4,a4,a0
    80004d00:	0027c503          	lbu	a0,2(a5)
    80004d04:	01051513          	slli	a0,a0,0x10
    80004d08:	00e56733          	or	a4,a0,a4
    80004d0c:	0037c503          	lbu	a0,3(a5)
    80004d10:	01851513          	slli	a0,a0,0x18
    80004d14:	00e56533          	or	a0,a0,a4
    80004d18:	0047c703          	lbu	a4,4(a5)
    80004d1c:	02071713          	slli	a4,a4,0x20
    80004d20:	00a76533          	or	a0,a4,a0
    80004d24:	0057c703          	lbu	a4,5(a5)
    80004d28:	02871713          	slli	a4,a4,0x28
    80004d2c:	00a76733          	or	a4,a4,a0
    80004d30:	0067c503          	lbu	a0,6(a5)
    80004d34:	03051513          	slli	a0,a0,0x30
    80004d38:	00e56733          	or	a4,a0,a4
    80004d3c:	0077c503          	lbu	a0,7(a5)
    80004d40:	03851513          	slli	a0,a0,0x38
    80004d44:	00e56533          	or	a0,a0,a4
    singleton->head = tmp->next;
    80004d48:	0087c683          	lbu	a3,8(a5)
    80004d4c:	0097c703          	lbu	a4,9(a5)
    80004d50:	00871713          	slli	a4,a4,0x8
    80004d54:	00d766b3          	or	a3,a4,a3
    80004d58:	00a7c703          	lbu	a4,10(a5)
    80004d5c:	01071713          	slli	a4,a4,0x10
    80004d60:	00d76733          	or	a4,a4,a3
    80004d64:	00b7c683          	lbu	a3,11(a5)
    80004d68:	01869693          	slli	a3,a3,0x18
    80004d6c:	00e6e733          	or	a4,a3,a4
    80004d70:	00c7c683          	lbu	a3,12(a5)
    80004d74:	02069693          	slli	a3,a3,0x20
    80004d78:	00e6e6b3          	or	a3,a3,a4
    80004d7c:	00d7c703          	lbu	a4,13(a5)
    80004d80:	02871713          	slli	a4,a4,0x28
    80004d84:	00d766b3          	or	a3,a4,a3
    80004d88:	00e7c703          	lbu	a4,14(a5)
    80004d8c:	03071713          	slli	a4,a4,0x30
    80004d90:	00d76733          	or	a4,a4,a3
    80004d94:	00f7c783          	lbu	a5,15(a5)
    80004d98:	03879793          	slli	a5,a5,0x38
    80004d9c:	00e7e7b3          	or	a5,a5,a4
    80004da0:	00f63023          	sd	a5,0(a2)
    if(singleton->head == 0){
    80004da4:	00004797          	auipc	a5,0x4
    80004da8:	5047b783          	ld	a5,1284(a5) # 800092a8 <_ZN9Scheduler9singletonE>
    80004dac:	0007b703          	ld	a4,0(a5)
    80004db0:	00070863          	beqz	a4,80004dc0 <_ZN9Scheduler3getEv+0xec>
        singleton->tail = 0;
    }
    // mem_free(tmp); THIS ONE BREAKS CAUSES ILLEGAL READS???
    return thread;
}
    80004db4:	00813403          	ld	s0,8(sp)
    80004db8:	01010113          	addi	sp,sp,16
    80004dbc:	00008067          	ret
        singleton->tail = 0;
    80004dc0:	0007b423          	sd	zero,8(a5)
    80004dc4:	ff1ff06f          	j	80004db4 <_ZN9Scheduler3getEv+0xe0>
        return 0;
    80004dc8:	00078513          	mv	a0,a5
    80004dcc:	fe9ff06f          	j	80004db4 <_ZN9Scheduler3getEv+0xe0>

0000000080004dd0 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80004dd0:	ff010113          	addi	sp,sp,-16
    80004dd4:	00813423          	sd	s0,8(sp)
    80004dd8:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80004ddc:	00004797          	auipc	a5,0x4
    80004de0:	4cc7b783          	ld	a5,1228(a5) # 800092a8 <_ZN9Scheduler9singletonE>
    80004de4:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80004de8:	00000513          	li	a0,0
    while(tmp != 0){
    80004dec:	06078263          	beqz	a5,80004e50 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80004df0:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80004df4:	0087c683          	lbu	a3,8(a5)
    80004df8:	0097c703          	lbu	a4,9(a5)
    80004dfc:	00871713          	slli	a4,a4,0x8
    80004e00:	00d766b3          	or	a3,a4,a3
    80004e04:	00a7c703          	lbu	a4,10(a5)
    80004e08:	01071713          	slli	a4,a4,0x10
    80004e0c:	00d76733          	or	a4,a4,a3
    80004e10:	00b7c683          	lbu	a3,11(a5)
    80004e14:	01869693          	slli	a3,a3,0x18
    80004e18:	00e6e733          	or	a4,a3,a4
    80004e1c:	00c7c683          	lbu	a3,12(a5)
    80004e20:	02069693          	slli	a3,a3,0x20
    80004e24:	00e6e6b3          	or	a3,a3,a4
    80004e28:	00d7c703          	lbu	a4,13(a5)
    80004e2c:	02871713          	slli	a4,a4,0x28
    80004e30:	00d766b3          	or	a3,a4,a3
    80004e34:	00e7c703          	lbu	a4,14(a5)
    80004e38:	03071713          	slli	a4,a4,0x30
    80004e3c:	00d76733          	or	a4,a4,a3
    80004e40:	00f7c783          	lbu	a5,15(a5)
    80004e44:	03879793          	slli	a5,a5,0x38
    80004e48:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80004e4c:	fa1ff06f          	j	80004dec <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80004e50:	00813403          	ld	s0,8(sp)
    80004e54:	01010113          	addi	sp,sp,16
    80004e58:	00008067          	ret

0000000080004e5c <start>:
    80004e5c:	ff010113          	addi	sp,sp,-16
    80004e60:	00813423          	sd	s0,8(sp)
    80004e64:	01010413          	addi	s0,sp,16
    80004e68:	300027f3          	csrr	a5,mstatus
    80004e6c:	ffffe737          	lui	a4,0xffffe
    80004e70:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff42ef>
    80004e74:	00e7f7b3          	and	a5,a5,a4
    80004e78:	00001737          	lui	a4,0x1
    80004e7c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004e80:	00e7e7b3          	or	a5,a5,a4
    80004e84:	30079073          	csrw	mstatus,a5
    80004e88:	00000797          	auipc	a5,0x0
    80004e8c:	16078793          	addi	a5,a5,352 # 80004fe8 <system_main>
    80004e90:	34179073          	csrw	mepc,a5
    80004e94:	00000793          	li	a5,0
    80004e98:	18079073          	csrw	satp,a5
    80004e9c:	000107b7          	lui	a5,0x10
    80004ea0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80004ea4:	30279073          	csrw	medeleg,a5
    80004ea8:	30379073          	csrw	mideleg,a5
    80004eac:	104027f3          	csrr	a5,sie
    80004eb0:	2227e793          	ori	a5,a5,546
    80004eb4:	10479073          	csrw	sie,a5
    80004eb8:	fff00793          	li	a5,-1
    80004ebc:	00a7d793          	srli	a5,a5,0xa
    80004ec0:	3b079073          	csrw	pmpaddr0,a5
    80004ec4:	00f00793          	li	a5,15
    80004ec8:	3a079073          	csrw	pmpcfg0,a5
    80004ecc:	f14027f3          	csrr	a5,mhartid
    80004ed0:	0200c737          	lui	a4,0x200c
    80004ed4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004ed8:	0007869b          	sext.w	a3,a5
    80004edc:	00269713          	slli	a4,a3,0x2
    80004ee0:	000f4637          	lui	a2,0xf4
    80004ee4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004ee8:	00d70733          	add	a4,a4,a3
    80004eec:	0037979b          	slliw	a5,a5,0x3
    80004ef0:	020046b7          	lui	a3,0x2004
    80004ef4:	00d787b3          	add	a5,a5,a3
    80004ef8:	00c585b3          	add	a1,a1,a2
    80004efc:	00371693          	slli	a3,a4,0x3
    80004f00:	00004717          	auipc	a4,0x4
    80004f04:	3b070713          	addi	a4,a4,944 # 800092b0 <timer_scratch>
    80004f08:	00b7b023          	sd	a1,0(a5)
    80004f0c:	00d70733          	add	a4,a4,a3
    80004f10:	00f73c23          	sd	a5,24(a4)
    80004f14:	02c73023          	sd	a2,32(a4)
    80004f18:	34071073          	csrw	mscratch,a4
    80004f1c:	00000797          	auipc	a5,0x0
    80004f20:	6e478793          	addi	a5,a5,1764 # 80005600 <timervec>
    80004f24:	30579073          	csrw	mtvec,a5
    80004f28:	300027f3          	csrr	a5,mstatus
    80004f2c:	0087e793          	ori	a5,a5,8
    80004f30:	30079073          	csrw	mstatus,a5
    80004f34:	304027f3          	csrr	a5,mie
    80004f38:	0807e793          	ori	a5,a5,128
    80004f3c:	30479073          	csrw	mie,a5
    80004f40:	f14027f3          	csrr	a5,mhartid
    80004f44:	0007879b          	sext.w	a5,a5
    80004f48:	00078213          	mv	tp,a5
    80004f4c:	30200073          	mret
    80004f50:	00813403          	ld	s0,8(sp)
    80004f54:	01010113          	addi	sp,sp,16
    80004f58:	00008067          	ret

0000000080004f5c <timerinit>:
    80004f5c:	ff010113          	addi	sp,sp,-16
    80004f60:	00813423          	sd	s0,8(sp)
    80004f64:	01010413          	addi	s0,sp,16
    80004f68:	f14027f3          	csrr	a5,mhartid
    80004f6c:	0200c737          	lui	a4,0x200c
    80004f70:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004f74:	0007869b          	sext.w	a3,a5
    80004f78:	00269713          	slli	a4,a3,0x2
    80004f7c:	000f4637          	lui	a2,0xf4
    80004f80:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004f84:	00d70733          	add	a4,a4,a3
    80004f88:	0037979b          	slliw	a5,a5,0x3
    80004f8c:	020046b7          	lui	a3,0x2004
    80004f90:	00d787b3          	add	a5,a5,a3
    80004f94:	00c585b3          	add	a1,a1,a2
    80004f98:	00371693          	slli	a3,a4,0x3
    80004f9c:	00004717          	auipc	a4,0x4
    80004fa0:	31470713          	addi	a4,a4,788 # 800092b0 <timer_scratch>
    80004fa4:	00b7b023          	sd	a1,0(a5)
    80004fa8:	00d70733          	add	a4,a4,a3
    80004fac:	00f73c23          	sd	a5,24(a4)
    80004fb0:	02c73023          	sd	a2,32(a4)
    80004fb4:	34071073          	csrw	mscratch,a4
    80004fb8:	00000797          	auipc	a5,0x0
    80004fbc:	64878793          	addi	a5,a5,1608 # 80005600 <timervec>
    80004fc0:	30579073          	csrw	mtvec,a5
    80004fc4:	300027f3          	csrr	a5,mstatus
    80004fc8:	0087e793          	ori	a5,a5,8
    80004fcc:	30079073          	csrw	mstatus,a5
    80004fd0:	304027f3          	csrr	a5,mie
    80004fd4:	0807e793          	ori	a5,a5,128
    80004fd8:	30479073          	csrw	mie,a5
    80004fdc:	00813403          	ld	s0,8(sp)
    80004fe0:	01010113          	addi	sp,sp,16
    80004fe4:	00008067          	ret

0000000080004fe8 <system_main>:
    80004fe8:	fe010113          	addi	sp,sp,-32
    80004fec:	00813823          	sd	s0,16(sp)
    80004ff0:	00913423          	sd	s1,8(sp)
    80004ff4:	00113c23          	sd	ra,24(sp)
    80004ff8:	02010413          	addi	s0,sp,32
    80004ffc:	00000097          	auipc	ra,0x0
    80005000:	0c4080e7          	jalr	196(ra) # 800050c0 <cpuid>
    80005004:	00004497          	auipc	s1,0x4
    80005008:	23c48493          	addi	s1,s1,572 # 80009240 <started>
    8000500c:	02050263          	beqz	a0,80005030 <system_main+0x48>
    80005010:	0004a783          	lw	a5,0(s1)
    80005014:	0007879b          	sext.w	a5,a5
    80005018:	fe078ce3          	beqz	a5,80005010 <system_main+0x28>
    8000501c:	0ff0000f          	fence
    80005020:	00003517          	auipc	a0,0x3
    80005024:	44850513          	addi	a0,a0,1096 # 80008468 <CONSOLE_STATUS+0x458>
    80005028:	00001097          	auipc	ra,0x1
    8000502c:	a74080e7          	jalr	-1420(ra) # 80005a9c <panic>
    80005030:	00001097          	auipc	ra,0x1
    80005034:	9c8080e7          	jalr	-1592(ra) # 800059f8 <consoleinit>
    80005038:	00001097          	auipc	ra,0x1
    8000503c:	154080e7          	jalr	340(ra) # 8000618c <printfinit>
    80005040:	00003517          	auipc	a0,0x3
    80005044:	50850513          	addi	a0,a0,1288 # 80008548 <CONSOLE_STATUS+0x538>
    80005048:	00001097          	auipc	ra,0x1
    8000504c:	ab0080e7          	jalr	-1360(ra) # 80005af8 <__printf>
    80005050:	00003517          	auipc	a0,0x3
    80005054:	3e850513          	addi	a0,a0,1000 # 80008438 <CONSOLE_STATUS+0x428>
    80005058:	00001097          	auipc	ra,0x1
    8000505c:	aa0080e7          	jalr	-1376(ra) # 80005af8 <__printf>
    80005060:	00003517          	auipc	a0,0x3
    80005064:	4e850513          	addi	a0,a0,1256 # 80008548 <CONSOLE_STATUS+0x538>
    80005068:	00001097          	auipc	ra,0x1
    8000506c:	a90080e7          	jalr	-1392(ra) # 80005af8 <__printf>
    80005070:	00001097          	auipc	ra,0x1
    80005074:	4a8080e7          	jalr	1192(ra) # 80006518 <kinit>
    80005078:	00000097          	auipc	ra,0x0
    8000507c:	148080e7          	jalr	328(ra) # 800051c0 <trapinit>
    80005080:	00000097          	auipc	ra,0x0
    80005084:	16c080e7          	jalr	364(ra) # 800051ec <trapinithart>
    80005088:	00000097          	auipc	ra,0x0
    8000508c:	5b8080e7          	jalr	1464(ra) # 80005640 <plicinit>
    80005090:	00000097          	auipc	ra,0x0
    80005094:	5d8080e7          	jalr	1496(ra) # 80005668 <plicinithart>
    80005098:	00000097          	auipc	ra,0x0
    8000509c:	078080e7          	jalr	120(ra) # 80005110 <userinit>
    800050a0:	0ff0000f          	fence
    800050a4:	00100793          	li	a5,1
    800050a8:	00003517          	auipc	a0,0x3
    800050ac:	3a850513          	addi	a0,a0,936 # 80008450 <CONSOLE_STATUS+0x440>
    800050b0:	00f4a023          	sw	a5,0(s1)
    800050b4:	00001097          	auipc	ra,0x1
    800050b8:	a44080e7          	jalr	-1468(ra) # 80005af8 <__printf>
    800050bc:	0000006f          	j	800050bc <system_main+0xd4>

00000000800050c0 <cpuid>:
    800050c0:	ff010113          	addi	sp,sp,-16
    800050c4:	00813423          	sd	s0,8(sp)
    800050c8:	01010413          	addi	s0,sp,16
    800050cc:	00020513          	mv	a0,tp
    800050d0:	00813403          	ld	s0,8(sp)
    800050d4:	0005051b          	sext.w	a0,a0
    800050d8:	01010113          	addi	sp,sp,16
    800050dc:	00008067          	ret

00000000800050e0 <mycpu>:
    800050e0:	ff010113          	addi	sp,sp,-16
    800050e4:	00813423          	sd	s0,8(sp)
    800050e8:	01010413          	addi	s0,sp,16
    800050ec:	00020793          	mv	a5,tp
    800050f0:	00813403          	ld	s0,8(sp)
    800050f4:	0007879b          	sext.w	a5,a5
    800050f8:	00779793          	slli	a5,a5,0x7
    800050fc:	00005517          	auipc	a0,0x5
    80005100:	1e450513          	addi	a0,a0,484 # 8000a2e0 <cpus>
    80005104:	00f50533          	add	a0,a0,a5
    80005108:	01010113          	addi	sp,sp,16
    8000510c:	00008067          	ret

0000000080005110 <userinit>:
    80005110:	ff010113          	addi	sp,sp,-16
    80005114:	00813423          	sd	s0,8(sp)
    80005118:	01010413          	addi	s0,sp,16
    8000511c:	00813403          	ld	s0,8(sp)
    80005120:	01010113          	addi	sp,sp,16
    80005124:	ffffc317          	auipc	t1,0xffffc
    80005128:	6c830067          	jr	1736(t1) # 800017ec <main>

000000008000512c <either_copyout>:
    8000512c:	ff010113          	addi	sp,sp,-16
    80005130:	00813023          	sd	s0,0(sp)
    80005134:	00113423          	sd	ra,8(sp)
    80005138:	01010413          	addi	s0,sp,16
    8000513c:	02051663          	bnez	a0,80005168 <either_copyout+0x3c>
    80005140:	00058513          	mv	a0,a1
    80005144:	00060593          	mv	a1,a2
    80005148:	0006861b          	sext.w	a2,a3
    8000514c:	00002097          	auipc	ra,0x2
    80005150:	c58080e7          	jalr	-936(ra) # 80006da4 <__memmove>
    80005154:	00813083          	ld	ra,8(sp)
    80005158:	00013403          	ld	s0,0(sp)
    8000515c:	00000513          	li	a0,0
    80005160:	01010113          	addi	sp,sp,16
    80005164:	00008067          	ret
    80005168:	00003517          	auipc	a0,0x3
    8000516c:	32850513          	addi	a0,a0,808 # 80008490 <CONSOLE_STATUS+0x480>
    80005170:	00001097          	auipc	ra,0x1
    80005174:	92c080e7          	jalr	-1748(ra) # 80005a9c <panic>

0000000080005178 <either_copyin>:
    80005178:	ff010113          	addi	sp,sp,-16
    8000517c:	00813023          	sd	s0,0(sp)
    80005180:	00113423          	sd	ra,8(sp)
    80005184:	01010413          	addi	s0,sp,16
    80005188:	02059463          	bnez	a1,800051b0 <either_copyin+0x38>
    8000518c:	00060593          	mv	a1,a2
    80005190:	0006861b          	sext.w	a2,a3
    80005194:	00002097          	auipc	ra,0x2
    80005198:	c10080e7          	jalr	-1008(ra) # 80006da4 <__memmove>
    8000519c:	00813083          	ld	ra,8(sp)
    800051a0:	00013403          	ld	s0,0(sp)
    800051a4:	00000513          	li	a0,0
    800051a8:	01010113          	addi	sp,sp,16
    800051ac:	00008067          	ret
    800051b0:	00003517          	auipc	a0,0x3
    800051b4:	30850513          	addi	a0,a0,776 # 800084b8 <CONSOLE_STATUS+0x4a8>
    800051b8:	00001097          	auipc	ra,0x1
    800051bc:	8e4080e7          	jalr	-1820(ra) # 80005a9c <panic>

00000000800051c0 <trapinit>:
    800051c0:	ff010113          	addi	sp,sp,-16
    800051c4:	00813423          	sd	s0,8(sp)
    800051c8:	01010413          	addi	s0,sp,16
    800051cc:	00813403          	ld	s0,8(sp)
    800051d0:	00003597          	auipc	a1,0x3
    800051d4:	31058593          	addi	a1,a1,784 # 800084e0 <CONSOLE_STATUS+0x4d0>
    800051d8:	00005517          	auipc	a0,0x5
    800051dc:	18850513          	addi	a0,a0,392 # 8000a360 <tickslock>
    800051e0:	01010113          	addi	sp,sp,16
    800051e4:	00001317          	auipc	t1,0x1
    800051e8:	5c430067          	jr	1476(t1) # 800067a8 <initlock>

00000000800051ec <trapinithart>:
    800051ec:	ff010113          	addi	sp,sp,-16
    800051f0:	00813423          	sd	s0,8(sp)
    800051f4:	01010413          	addi	s0,sp,16
    800051f8:	00000797          	auipc	a5,0x0
    800051fc:	2f878793          	addi	a5,a5,760 # 800054f0 <kernelvec>
    80005200:	10579073          	csrw	stvec,a5
    80005204:	00813403          	ld	s0,8(sp)
    80005208:	01010113          	addi	sp,sp,16
    8000520c:	00008067          	ret

0000000080005210 <usertrap>:
    80005210:	ff010113          	addi	sp,sp,-16
    80005214:	00813423          	sd	s0,8(sp)
    80005218:	01010413          	addi	s0,sp,16
    8000521c:	00813403          	ld	s0,8(sp)
    80005220:	01010113          	addi	sp,sp,16
    80005224:	00008067          	ret

0000000080005228 <usertrapret>:
    80005228:	ff010113          	addi	sp,sp,-16
    8000522c:	00813423          	sd	s0,8(sp)
    80005230:	01010413          	addi	s0,sp,16
    80005234:	00813403          	ld	s0,8(sp)
    80005238:	01010113          	addi	sp,sp,16
    8000523c:	00008067          	ret

0000000080005240 <kerneltrap>:
    80005240:	fe010113          	addi	sp,sp,-32
    80005244:	00813823          	sd	s0,16(sp)
    80005248:	00113c23          	sd	ra,24(sp)
    8000524c:	00913423          	sd	s1,8(sp)
    80005250:	02010413          	addi	s0,sp,32
    80005254:	142025f3          	csrr	a1,scause
    80005258:	100027f3          	csrr	a5,sstatus
    8000525c:	0027f793          	andi	a5,a5,2
    80005260:	10079c63          	bnez	a5,80005378 <kerneltrap+0x138>
    80005264:	142027f3          	csrr	a5,scause
    80005268:	0207ce63          	bltz	a5,800052a4 <kerneltrap+0x64>
    8000526c:	00003517          	auipc	a0,0x3
    80005270:	2bc50513          	addi	a0,a0,700 # 80008528 <CONSOLE_STATUS+0x518>
    80005274:	00001097          	auipc	ra,0x1
    80005278:	884080e7          	jalr	-1916(ra) # 80005af8 <__printf>
    8000527c:	141025f3          	csrr	a1,sepc
    80005280:	14302673          	csrr	a2,stval
    80005284:	00003517          	auipc	a0,0x3
    80005288:	2b450513          	addi	a0,a0,692 # 80008538 <CONSOLE_STATUS+0x528>
    8000528c:	00001097          	auipc	ra,0x1
    80005290:	86c080e7          	jalr	-1940(ra) # 80005af8 <__printf>
    80005294:	00003517          	auipc	a0,0x3
    80005298:	2bc50513          	addi	a0,a0,700 # 80008550 <CONSOLE_STATUS+0x540>
    8000529c:	00001097          	auipc	ra,0x1
    800052a0:	800080e7          	jalr	-2048(ra) # 80005a9c <panic>
    800052a4:	0ff7f713          	andi	a4,a5,255
    800052a8:	00900693          	li	a3,9
    800052ac:	04d70063          	beq	a4,a3,800052ec <kerneltrap+0xac>
    800052b0:	fff00713          	li	a4,-1
    800052b4:	03f71713          	slli	a4,a4,0x3f
    800052b8:	00170713          	addi	a4,a4,1
    800052bc:	fae798e3          	bne	a5,a4,8000526c <kerneltrap+0x2c>
    800052c0:	00000097          	auipc	ra,0x0
    800052c4:	e00080e7          	jalr	-512(ra) # 800050c0 <cpuid>
    800052c8:	06050663          	beqz	a0,80005334 <kerneltrap+0xf4>
    800052cc:	144027f3          	csrr	a5,sip
    800052d0:	ffd7f793          	andi	a5,a5,-3
    800052d4:	14479073          	csrw	sip,a5
    800052d8:	01813083          	ld	ra,24(sp)
    800052dc:	01013403          	ld	s0,16(sp)
    800052e0:	00813483          	ld	s1,8(sp)
    800052e4:	02010113          	addi	sp,sp,32
    800052e8:	00008067          	ret
    800052ec:	00000097          	auipc	ra,0x0
    800052f0:	3c8080e7          	jalr	968(ra) # 800056b4 <plic_claim>
    800052f4:	00a00793          	li	a5,10
    800052f8:	00050493          	mv	s1,a0
    800052fc:	06f50863          	beq	a0,a5,8000536c <kerneltrap+0x12c>
    80005300:	fc050ce3          	beqz	a0,800052d8 <kerneltrap+0x98>
    80005304:	00050593          	mv	a1,a0
    80005308:	00003517          	auipc	a0,0x3
    8000530c:	20050513          	addi	a0,a0,512 # 80008508 <CONSOLE_STATUS+0x4f8>
    80005310:	00000097          	auipc	ra,0x0
    80005314:	7e8080e7          	jalr	2024(ra) # 80005af8 <__printf>
    80005318:	01013403          	ld	s0,16(sp)
    8000531c:	01813083          	ld	ra,24(sp)
    80005320:	00048513          	mv	a0,s1
    80005324:	00813483          	ld	s1,8(sp)
    80005328:	02010113          	addi	sp,sp,32
    8000532c:	00000317          	auipc	t1,0x0
    80005330:	3c030067          	jr	960(t1) # 800056ec <plic_complete>
    80005334:	00005517          	auipc	a0,0x5
    80005338:	02c50513          	addi	a0,a0,44 # 8000a360 <tickslock>
    8000533c:	00001097          	auipc	ra,0x1
    80005340:	490080e7          	jalr	1168(ra) # 800067cc <acquire>
    80005344:	00004717          	auipc	a4,0x4
    80005348:	f0070713          	addi	a4,a4,-256 # 80009244 <ticks>
    8000534c:	00072783          	lw	a5,0(a4)
    80005350:	00005517          	auipc	a0,0x5
    80005354:	01050513          	addi	a0,a0,16 # 8000a360 <tickslock>
    80005358:	0017879b          	addiw	a5,a5,1
    8000535c:	00f72023          	sw	a5,0(a4)
    80005360:	00001097          	auipc	ra,0x1
    80005364:	538080e7          	jalr	1336(ra) # 80006898 <release>
    80005368:	f65ff06f          	j	800052cc <kerneltrap+0x8c>
    8000536c:	00001097          	auipc	ra,0x1
    80005370:	094080e7          	jalr	148(ra) # 80006400 <uartintr>
    80005374:	fa5ff06f          	j	80005318 <kerneltrap+0xd8>
    80005378:	00003517          	auipc	a0,0x3
    8000537c:	17050513          	addi	a0,a0,368 # 800084e8 <CONSOLE_STATUS+0x4d8>
    80005380:	00000097          	auipc	ra,0x0
    80005384:	71c080e7          	jalr	1820(ra) # 80005a9c <panic>

0000000080005388 <clockintr>:
    80005388:	fe010113          	addi	sp,sp,-32
    8000538c:	00813823          	sd	s0,16(sp)
    80005390:	00913423          	sd	s1,8(sp)
    80005394:	00113c23          	sd	ra,24(sp)
    80005398:	02010413          	addi	s0,sp,32
    8000539c:	00005497          	auipc	s1,0x5
    800053a0:	fc448493          	addi	s1,s1,-60 # 8000a360 <tickslock>
    800053a4:	00048513          	mv	a0,s1
    800053a8:	00001097          	auipc	ra,0x1
    800053ac:	424080e7          	jalr	1060(ra) # 800067cc <acquire>
    800053b0:	00004717          	auipc	a4,0x4
    800053b4:	e9470713          	addi	a4,a4,-364 # 80009244 <ticks>
    800053b8:	00072783          	lw	a5,0(a4)
    800053bc:	01013403          	ld	s0,16(sp)
    800053c0:	01813083          	ld	ra,24(sp)
    800053c4:	00048513          	mv	a0,s1
    800053c8:	0017879b          	addiw	a5,a5,1
    800053cc:	00813483          	ld	s1,8(sp)
    800053d0:	00f72023          	sw	a5,0(a4)
    800053d4:	02010113          	addi	sp,sp,32
    800053d8:	00001317          	auipc	t1,0x1
    800053dc:	4c030067          	jr	1216(t1) # 80006898 <release>

00000000800053e0 <devintr>:
    800053e0:	142027f3          	csrr	a5,scause
    800053e4:	00000513          	li	a0,0
    800053e8:	0007c463          	bltz	a5,800053f0 <devintr+0x10>
    800053ec:	00008067          	ret
    800053f0:	fe010113          	addi	sp,sp,-32
    800053f4:	00813823          	sd	s0,16(sp)
    800053f8:	00113c23          	sd	ra,24(sp)
    800053fc:	00913423          	sd	s1,8(sp)
    80005400:	02010413          	addi	s0,sp,32
    80005404:	0ff7f713          	andi	a4,a5,255
    80005408:	00900693          	li	a3,9
    8000540c:	04d70c63          	beq	a4,a3,80005464 <devintr+0x84>
    80005410:	fff00713          	li	a4,-1
    80005414:	03f71713          	slli	a4,a4,0x3f
    80005418:	00170713          	addi	a4,a4,1
    8000541c:	00e78c63          	beq	a5,a4,80005434 <devintr+0x54>
    80005420:	01813083          	ld	ra,24(sp)
    80005424:	01013403          	ld	s0,16(sp)
    80005428:	00813483          	ld	s1,8(sp)
    8000542c:	02010113          	addi	sp,sp,32
    80005430:	00008067          	ret
    80005434:	00000097          	auipc	ra,0x0
    80005438:	c8c080e7          	jalr	-884(ra) # 800050c0 <cpuid>
    8000543c:	06050663          	beqz	a0,800054a8 <devintr+0xc8>
    80005440:	144027f3          	csrr	a5,sip
    80005444:	ffd7f793          	andi	a5,a5,-3
    80005448:	14479073          	csrw	sip,a5
    8000544c:	01813083          	ld	ra,24(sp)
    80005450:	01013403          	ld	s0,16(sp)
    80005454:	00813483          	ld	s1,8(sp)
    80005458:	00200513          	li	a0,2
    8000545c:	02010113          	addi	sp,sp,32
    80005460:	00008067          	ret
    80005464:	00000097          	auipc	ra,0x0
    80005468:	250080e7          	jalr	592(ra) # 800056b4 <plic_claim>
    8000546c:	00a00793          	li	a5,10
    80005470:	00050493          	mv	s1,a0
    80005474:	06f50663          	beq	a0,a5,800054e0 <devintr+0x100>
    80005478:	00100513          	li	a0,1
    8000547c:	fa0482e3          	beqz	s1,80005420 <devintr+0x40>
    80005480:	00048593          	mv	a1,s1
    80005484:	00003517          	auipc	a0,0x3
    80005488:	08450513          	addi	a0,a0,132 # 80008508 <CONSOLE_STATUS+0x4f8>
    8000548c:	00000097          	auipc	ra,0x0
    80005490:	66c080e7          	jalr	1644(ra) # 80005af8 <__printf>
    80005494:	00048513          	mv	a0,s1
    80005498:	00000097          	auipc	ra,0x0
    8000549c:	254080e7          	jalr	596(ra) # 800056ec <plic_complete>
    800054a0:	00100513          	li	a0,1
    800054a4:	f7dff06f          	j	80005420 <devintr+0x40>
    800054a8:	00005517          	auipc	a0,0x5
    800054ac:	eb850513          	addi	a0,a0,-328 # 8000a360 <tickslock>
    800054b0:	00001097          	auipc	ra,0x1
    800054b4:	31c080e7          	jalr	796(ra) # 800067cc <acquire>
    800054b8:	00004717          	auipc	a4,0x4
    800054bc:	d8c70713          	addi	a4,a4,-628 # 80009244 <ticks>
    800054c0:	00072783          	lw	a5,0(a4)
    800054c4:	00005517          	auipc	a0,0x5
    800054c8:	e9c50513          	addi	a0,a0,-356 # 8000a360 <tickslock>
    800054cc:	0017879b          	addiw	a5,a5,1
    800054d0:	00f72023          	sw	a5,0(a4)
    800054d4:	00001097          	auipc	ra,0x1
    800054d8:	3c4080e7          	jalr	964(ra) # 80006898 <release>
    800054dc:	f65ff06f          	j	80005440 <devintr+0x60>
    800054e0:	00001097          	auipc	ra,0x1
    800054e4:	f20080e7          	jalr	-224(ra) # 80006400 <uartintr>
    800054e8:	fadff06f          	j	80005494 <devintr+0xb4>
    800054ec:	0000                	unimp
	...

00000000800054f0 <kernelvec>:
    800054f0:	f0010113          	addi	sp,sp,-256
    800054f4:	00113023          	sd	ra,0(sp)
    800054f8:	00213423          	sd	sp,8(sp)
    800054fc:	00313823          	sd	gp,16(sp)
    80005500:	00413c23          	sd	tp,24(sp)
    80005504:	02513023          	sd	t0,32(sp)
    80005508:	02613423          	sd	t1,40(sp)
    8000550c:	02713823          	sd	t2,48(sp)
    80005510:	02813c23          	sd	s0,56(sp)
    80005514:	04913023          	sd	s1,64(sp)
    80005518:	04a13423          	sd	a0,72(sp)
    8000551c:	04b13823          	sd	a1,80(sp)
    80005520:	04c13c23          	sd	a2,88(sp)
    80005524:	06d13023          	sd	a3,96(sp)
    80005528:	06e13423          	sd	a4,104(sp)
    8000552c:	06f13823          	sd	a5,112(sp)
    80005530:	07013c23          	sd	a6,120(sp)
    80005534:	09113023          	sd	a7,128(sp)
    80005538:	09213423          	sd	s2,136(sp)
    8000553c:	09313823          	sd	s3,144(sp)
    80005540:	09413c23          	sd	s4,152(sp)
    80005544:	0b513023          	sd	s5,160(sp)
    80005548:	0b613423          	sd	s6,168(sp)
    8000554c:	0b713823          	sd	s7,176(sp)
    80005550:	0b813c23          	sd	s8,184(sp)
    80005554:	0d913023          	sd	s9,192(sp)
    80005558:	0da13423          	sd	s10,200(sp)
    8000555c:	0db13823          	sd	s11,208(sp)
    80005560:	0dc13c23          	sd	t3,216(sp)
    80005564:	0fd13023          	sd	t4,224(sp)
    80005568:	0fe13423          	sd	t5,232(sp)
    8000556c:	0ff13823          	sd	t6,240(sp)
    80005570:	cd1ff0ef          	jal	ra,80005240 <kerneltrap>
    80005574:	00013083          	ld	ra,0(sp)
    80005578:	00813103          	ld	sp,8(sp)
    8000557c:	01013183          	ld	gp,16(sp)
    80005580:	02013283          	ld	t0,32(sp)
    80005584:	02813303          	ld	t1,40(sp)
    80005588:	03013383          	ld	t2,48(sp)
    8000558c:	03813403          	ld	s0,56(sp)
    80005590:	04013483          	ld	s1,64(sp)
    80005594:	04813503          	ld	a0,72(sp)
    80005598:	05013583          	ld	a1,80(sp)
    8000559c:	05813603          	ld	a2,88(sp)
    800055a0:	06013683          	ld	a3,96(sp)
    800055a4:	06813703          	ld	a4,104(sp)
    800055a8:	07013783          	ld	a5,112(sp)
    800055ac:	07813803          	ld	a6,120(sp)
    800055b0:	08013883          	ld	a7,128(sp)
    800055b4:	08813903          	ld	s2,136(sp)
    800055b8:	09013983          	ld	s3,144(sp)
    800055bc:	09813a03          	ld	s4,152(sp)
    800055c0:	0a013a83          	ld	s5,160(sp)
    800055c4:	0a813b03          	ld	s6,168(sp)
    800055c8:	0b013b83          	ld	s7,176(sp)
    800055cc:	0b813c03          	ld	s8,184(sp)
    800055d0:	0c013c83          	ld	s9,192(sp)
    800055d4:	0c813d03          	ld	s10,200(sp)
    800055d8:	0d013d83          	ld	s11,208(sp)
    800055dc:	0d813e03          	ld	t3,216(sp)
    800055e0:	0e013e83          	ld	t4,224(sp)
    800055e4:	0e813f03          	ld	t5,232(sp)
    800055e8:	0f013f83          	ld	t6,240(sp)
    800055ec:	10010113          	addi	sp,sp,256
    800055f0:	10200073          	sret
    800055f4:	00000013          	nop
    800055f8:	00000013          	nop
    800055fc:	00000013          	nop

0000000080005600 <timervec>:
    80005600:	34051573          	csrrw	a0,mscratch,a0
    80005604:	00b53023          	sd	a1,0(a0)
    80005608:	00c53423          	sd	a2,8(a0)
    8000560c:	00d53823          	sd	a3,16(a0)
    80005610:	01853583          	ld	a1,24(a0)
    80005614:	02053603          	ld	a2,32(a0)
    80005618:	0005b683          	ld	a3,0(a1)
    8000561c:	00c686b3          	add	a3,a3,a2
    80005620:	00d5b023          	sd	a3,0(a1)
    80005624:	00200593          	li	a1,2
    80005628:	14459073          	csrw	sip,a1
    8000562c:	01053683          	ld	a3,16(a0)
    80005630:	00853603          	ld	a2,8(a0)
    80005634:	00053583          	ld	a1,0(a0)
    80005638:	34051573          	csrrw	a0,mscratch,a0
    8000563c:	30200073          	mret

0000000080005640 <plicinit>:
    80005640:	ff010113          	addi	sp,sp,-16
    80005644:	00813423          	sd	s0,8(sp)
    80005648:	01010413          	addi	s0,sp,16
    8000564c:	00813403          	ld	s0,8(sp)
    80005650:	0c0007b7          	lui	a5,0xc000
    80005654:	00100713          	li	a4,1
    80005658:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000565c:	00e7a223          	sw	a4,4(a5)
    80005660:	01010113          	addi	sp,sp,16
    80005664:	00008067          	ret

0000000080005668 <plicinithart>:
    80005668:	ff010113          	addi	sp,sp,-16
    8000566c:	00813023          	sd	s0,0(sp)
    80005670:	00113423          	sd	ra,8(sp)
    80005674:	01010413          	addi	s0,sp,16
    80005678:	00000097          	auipc	ra,0x0
    8000567c:	a48080e7          	jalr	-1464(ra) # 800050c0 <cpuid>
    80005680:	0085171b          	slliw	a4,a0,0x8
    80005684:	0c0027b7          	lui	a5,0xc002
    80005688:	00e787b3          	add	a5,a5,a4
    8000568c:	40200713          	li	a4,1026
    80005690:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005694:	00813083          	ld	ra,8(sp)
    80005698:	00013403          	ld	s0,0(sp)
    8000569c:	00d5151b          	slliw	a0,a0,0xd
    800056a0:	0c2017b7          	lui	a5,0xc201
    800056a4:	00a78533          	add	a0,a5,a0
    800056a8:	00052023          	sw	zero,0(a0)
    800056ac:	01010113          	addi	sp,sp,16
    800056b0:	00008067          	ret

00000000800056b4 <plic_claim>:
    800056b4:	ff010113          	addi	sp,sp,-16
    800056b8:	00813023          	sd	s0,0(sp)
    800056bc:	00113423          	sd	ra,8(sp)
    800056c0:	01010413          	addi	s0,sp,16
    800056c4:	00000097          	auipc	ra,0x0
    800056c8:	9fc080e7          	jalr	-1540(ra) # 800050c0 <cpuid>
    800056cc:	00813083          	ld	ra,8(sp)
    800056d0:	00013403          	ld	s0,0(sp)
    800056d4:	00d5151b          	slliw	a0,a0,0xd
    800056d8:	0c2017b7          	lui	a5,0xc201
    800056dc:	00a78533          	add	a0,a5,a0
    800056e0:	00452503          	lw	a0,4(a0)
    800056e4:	01010113          	addi	sp,sp,16
    800056e8:	00008067          	ret

00000000800056ec <plic_complete>:
    800056ec:	fe010113          	addi	sp,sp,-32
    800056f0:	00813823          	sd	s0,16(sp)
    800056f4:	00913423          	sd	s1,8(sp)
    800056f8:	00113c23          	sd	ra,24(sp)
    800056fc:	02010413          	addi	s0,sp,32
    80005700:	00050493          	mv	s1,a0
    80005704:	00000097          	auipc	ra,0x0
    80005708:	9bc080e7          	jalr	-1604(ra) # 800050c0 <cpuid>
    8000570c:	01813083          	ld	ra,24(sp)
    80005710:	01013403          	ld	s0,16(sp)
    80005714:	00d5179b          	slliw	a5,a0,0xd
    80005718:	0c201737          	lui	a4,0xc201
    8000571c:	00f707b3          	add	a5,a4,a5
    80005720:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005724:	00813483          	ld	s1,8(sp)
    80005728:	02010113          	addi	sp,sp,32
    8000572c:	00008067          	ret

0000000080005730 <consolewrite>:
    80005730:	fb010113          	addi	sp,sp,-80
    80005734:	04813023          	sd	s0,64(sp)
    80005738:	04113423          	sd	ra,72(sp)
    8000573c:	02913c23          	sd	s1,56(sp)
    80005740:	03213823          	sd	s2,48(sp)
    80005744:	03313423          	sd	s3,40(sp)
    80005748:	03413023          	sd	s4,32(sp)
    8000574c:	01513c23          	sd	s5,24(sp)
    80005750:	05010413          	addi	s0,sp,80
    80005754:	06c05c63          	blez	a2,800057cc <consolewrite+0x9c>
    80005758:	00060993          	mv	s3,a2
    8000575c:	00050a13          	mv	s4,a0
    80005760:	00058493          	mv	s1,a1
    80005764:	00000913          	li	s2,0
    80005768:	fff00a93          	li	s5,-1
    8000576c:	01c0006f          	j	80005788 <consolewrite+0x58>
    80005770:	fbf44503          	lbu	a0,-65(s0)
    80005774:	0019091b          	addiw	s2,s2,1
    80005778:	00148493          	addi	s1,s1,1
    8000577c:	00001097          	auipc	ra,0x1
    80005780:	a9c080e7          	jalr	-1380(ra) # 80006218 <uartputc>
    80005784:	03298063          	beq	s3,s2,800057a4 <consolewrite+0x74>
    80005788:	00048613          	mv	a2,s1
    8000578c:	00100693          	li	a3,1
    80005790:	000a0593          	mv	a1,s4
    80005794:	fbf40513          	addi	a0,s0,-65
    80005798:	00000097          	auipc	ra,0x0
    8000579c:	9e0080e7          	jalr	-1568(ra) # 80005178 <either_copyin>
    800057a0:	fd5518e3          	bne	a0,s5,80005770 <consolewrite+0x40>
    800057a4:	04813083          	ld	ra,72(sp)
    800057a8:	04013403          	ld	s0,64(sp)
    800057ac:	03813483          	ld	s1,56(sp)
    800057b0:	02813983          	ld	s3,40(sp)
    800057b4:	02013a03          	ld	s4,32(sp)
    800057b8:	01813a83          	ld	s5,24(sp)
    800057bc:	00090513          	mv	a0,s2
    800057c0:	03013903          	ld	s2,48(sp)
    800057c4:	05010113          	addi	sp,sp,80
    800057c8:	00008067          	ret
    800057cc:	00000913          	li	s2,0
    800057d0:	fd5ff06f          	j	800057a4 <consolewrite+0x74>

00000000800057d4 <consoleread>:
    800057d4:	f9010113          	addi	sp,sp,-112
    800057d8:	06813023          	sd	s0,96(sp)
    800057dc:	04913c23          	sd	s1,88(sp)
    800057e0:	05213823          	sd	s2,80(sp)
    800057e4:	05313423          	sd	s3,72(sp)
    800057e8:	05413023          	sd	s4,64(sp)
    800057ec:	03513c23          	sd	s5,56(sp)
    800057f0:	03613823          	sd	s6,48(sp)
    800057f4:	03713423          	sd	s7,40(sp)
    800057f8:	03813023          	sd	s8,32(sp)
    800057fc:	06113423          	sd	ra,104(sp)
    80005800:	01913c23          	sd	s9,24(sp)
    80005804:	07010413          	addi	s0,sp,112
    80005808:	00060b93          	mv	s7,a2
    8000580c:	00050913          	mv	s2,a0
    80005810:	00058c13          	mv	s8,a1
    80005814:	00060b1b          	sext.w	s6,a2
    80005818:	00005497          	auipc	s1,0x5
    8000581c:	b7048493          	addi	s1,s1,-1168 # 8000a388 <cons>
    80005820:	00400993          	li	s3,4
    80005824:	fff00a13          	li	s4,-1
    80005828:	00a00a93          	li	s5,10
    8000582c:	05705e63          	blez	s7,80005888 <consoleread+0xb4>
    80005830:	09c4a703          	lw	a4,156(s1)
    80005834:	0984a783          	lw	a5,152(s1)
    80005838:	0007071b          	sext.w	a4,a4
    8000583c:	08e78463          	beq	a5,a4,800058c4 <consoleread+0xf0>
    80005840:	07f7f713          	andi	a4,a5,127
    80005844:	00e48733          	add	a4,s1,a4
    80005848:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000584c:	0017869b          	addiw	a3,a5,1
    80005850:	08d4ac23          	sw	a3,152(s1)
    80005854:	00070c9b          	sext.w	s9,a4
    80005858:	0b370663          	beq	a4,s3,80005904 <consoleread+0x130>
    8000585c:	00100693          	li	a3,1
    80005860:	f9f40613          	addi	a2,s0,-97
    80005864:	000c0593          	mv	a1,s8
    80005868:	00090513          	mv	a0,s2
    8000586c:	f8e40fa3          	sb	a4,-97(s0)
    80005870:	00000097          	auipc	ra,0x0
    80005874:	8bc080e7          	jalr	-1860(ra) # 8000512c <either_copyout>
    80005878:	01450863          	beq	a0,s4,80005888 <consoleread+0xb4>
    8000587c:	001c0c13          	addi	s8,s8,1
    80005880:	fffb8b9b          	addiw	s7,s7,-1
    80005884:	fb5c94e3          	bne	s9,s5,8000582c <consoleread+0x58>
    80005888:	000b851b          	sext.w	a0,s7
    8000588c:	06813083          	ld	ra,104(sp)
    80005890:	06013403          	ld	s0,96(sp)
    80005894:	05813483          	ld	s1,88(sp)
    80005898:	05013903          	ld	s2,80(sp)
    8000589c:	04813983          	ld	s3,72(sp)
    800058a0:	04013a03          	ld	s4,64(sp)
    800058a4:	03813a83          	ld	s5,56(sp)
    800058a8:	02813b83          	ld	s7,40(sp)
    800058ac:	02013c03          	ld	s8,32(sp)
    800058b0:	01813c83          	ld	s9,24(sp)
    800058b4:	40ab053b          	subw	a0,s6,a0
    800058b8:	03013b03          	ld	s6,48(sp)
    800058bc:	07010113          	addi	sp,sp,112
    800058c0:	00008067          	ret
    800058c4:	00001097          	auipc	ra,0x1
    800058c8:	1d8080e7          	jalr	472(ra) # 80006a9c <push_on>
    800058cc:	0984a703          	lw	a4,152(s1)
    800058d0:	09c4a783          	lw	a5,156(s1)
    800058d4:	0007879b          	sext.w	a5,a5
    800058d8:	fef70ce3          	beq	a4,a5,800058d0 <consoleread+0xfc>
    800058dc:	00001097          	auipc	ra,0x1
    800058e0:	234080e7          	jalr	564(ra) # 80006b10 <pop_on>
    800058e4:	0984a783          	lw	a5,152(s1)
    800058e8:	07f7f713          	andi	a4,a5,127
    800058ec:	00e48733          	add	a4,s1,a4
    800058f0:	01874703          	lbu	a4,24(a4)
    800058f4:	0017869b          	addiw	a3,a5,1
    800058f8:	08d4ac23          	sw	a3,152(s1)
    800058fc:	00070c9b          	sext.w	s9,a4
    80005900:	f5371ee3          	bne	a4,s3,8000585c <consoleread+0x88>
    80005904:	000b851b          	sext.w	a0,s7
    80005908:	f96bf2e3          	bgeu	s7,s6,8000588c <consoleread+0xb8>
    8000590c:	08f4ac23          	sw	a5,152(s1)
    80005910:	f7dff06f          	j	8000588c <consoleread+0xb8>

0000000080005914 <consputc>:
    80005914:	10000793          	li	a5,256
    80005918:	00f50663          	beq	a0,a5,80005924 <consputc+0x10>
    8000591c:	00001317          	auipc	t1,0x1
    80005920:	9f430067          	jr	-1548(t1) # 80006310 <uartputc_sync>
    80005924:	ff010113          	addi	sp,sp,-16
    80005928:	00113423          	sd	ra,8(sp)
    8000592c:	00813023          	sd	s0,0(sp)
    80005930:	01010413          	addi	s0,sp,16
    80005934:	00800513          	li	a0,8
    80005938:	00001097          	auipc	ra,0x1
    8000593c:	9d8080e7          	jalr	-1576(ra) # 80006310 <uartputc_sync>
    80005940:	02000513          	li	a0,32
    80005944:	00001097          	auipc	ra,0x1
    80005948:	9cc080e7          	jalr	-1588(ra) # 80006310 <uartputc_sync>
    8000594c:	00013403          	ld	s0,0(sp)
    80005950:	00813083          	ld	ra,8(sp)
    80005954:	00800513          	li	a0,8
    80005958:	01010113          	addi	sp,sp,16
    8000595c:	00001317          	auipc	t1,0x1
    80005960:	9b430067          	jr	-1612(t1) # 80006310 <uartputc_sync>

0000000080005964 <consoleintr>:
    80005964:	fe010113          	addi	sp,sp,-32
    80005968:	00813823          	sd	s0,16(sp)
    8000596c:	00913423          	sd	s1,8(sp)
    80005970:	01213023          	sd	s2,0(sp)
    80005974:	00113c23          	sd	ra,24(sp)
    80005978:	02010413          	addi	s0,sp,32
    8000597c:	00005917          	auipc	s2,0x5
    80005980:	a0c90913          	addi	s2,s2,-1524 # 8000a388 <cons>
    80005984:	00050493          	mv	s1,a0
    80005988:	00090513          	mv	a0,s2
    8000598c:	00001097          	auipc	ra,0x1
    80005990:	e40080e7          	jalr	-448(ra) # 800067cc <acquire>
    80005994:	02048c63          	beqz	s1,800059cc <consoleintr+0x68>
    80005998:	0a092783          	lw	a5,160(s2)
    8000599c:	09892703          	lw	a4,152(s2)
    800059a0:	07f00693          	li	a3,127
    800059a4:	40e7873b          	subw	a4,a5,a4
    800059a8:	02e6e263          	bltu	a3,a4,800059cc <consoleintr+0x68>
    800059ac:	00d00713          	li	a4,13
    800059b0:	04e48063          	beq	s1,a4,800059f0 <consoleintr+0x8c>
    800059b4:	07f7f713          	andi	a4,a5,127
    800059b8:	00e90733          	add	a4,s2,a4
    800059bc:	0017879b          	addiw	a5,a5,1
    800059c0:	0af92023          	sw	a5,160(s2)
    800059c4:	00970c23          	sb	s1,24(a4)
    800059c8:	08f92e23          	sw	a5,156(s2)
    800059cc:	01013403          	ld	s0,16(sp)
    800059d0:	01813083          	ld	ra,24(sp)
    800059d4:	00813483          	ld	s1,8(sp)
    800059d8:	00013903          	ld	s2,0(sp)
    800059dc:	00005517          	auipc	a0,0x5
    800059e0:	9ac50513          	addi	a0,a0,-1620 # 8000a388 <cons>
    800059e4:	02010113          	addi	sp,sp,32
    800059e8:	00001317          	auipc	t1,0x1
    800059ec:	eb030067          	jr	-336(t1) # 80006898 <release>
    800059f0:	00a00493          	li	s1,10
    800059f4:	fc1ff06f          	j	800059b4 <consoleintr+0x50>

00000000800059f8 <consoleinit>:
    800059f8:	fe010113          	addi	sp,sp,-32
    800059fc:	00113c23          	sd	ra,24(sp)
    80005a00:	00813823          	sd	s0,16(sp)
    80005a04:	00913423          	sd	s1,8(sp)
    80005a08:	02010413          	addi	s0,sp,32
    80005a0c:	00005497          	auipc	s1,0x5
    80005a10:	97c48493          	addi	s1,s1,-1668 # 8000a388 <cons>
    80005a14:	00048513          	mv	a0,s1
    80005a18:	00003597          	auipc	a1,0x3
    80005a1c:	b4858593          	addi	a1,a1,-1208 # 80008560 <CONSOLE_STATUS+0x550>
    80005a20:	00001097          	auipc	ra,0x1
    80005a24:	d88080e7          	jalr	-632(ra) # 800067a8 <initlock>
    80005a28:	00000097          	auipc	ra,0x0
    80005a2c:	7ac080e7          	jalr	1964(ra) # 800061d4 <uartinit>
    80005a30:	01813083          	ld	ra,24(sp)
    80005a34:	01013403          	ld	s0,16(sp)
    80005a38:	00000797          	auipc	a5,0x0
    80005a3c:	d9c78793          	addi	a5,a5,-612 # 800057d4 <consoleread>
    80005a40:	0af4bc23          	sd	a5,184(s1)
    80005a44:	00000797          	auipc	a5,0x0
    80005a48:	cec78793          	addi	a5,a5,-788 # 80005730 <consolewrite>
    80005a4c:	0cf4b023          	sd	a5,192(s1)
    80005a50:	00813483          	ld	s1,8(sp)
    80005a54:	02010113          	addi	sp,sp,32
    80005a58:	00008067          	ret

0000000080005a5c <console_read>:
    80005a5c:	ff010113          	addi	sp,sp,-16
    80005a60:	00813423          	sd	s0,8(sp)
    80005a64:	01010413          	addi	s0,sp,16
    80005a68:	00813403          	ld	s0,8(sp)
    80005a6c:	00005317          	auipc	t1,0x5
    80005a70:	9d433303          	ld	t1,-1580(t1) # 8000a440 <devsw+0x10>
    80005a74:	01010113          	addi	sp,sp,16
    80005a78:	00030067          	jr	t1

0000000080005a7c <console_write>:
    80005a7c:	ff010113          	addi	sp,sp,-16
    80005a80:	00813423          	sd	s0,8(sp)
    80005a84:	01010413          	addi	s0,sp,16
    80005a88:	00813403          	ld	s0,8(sp)
    80005a8c:	00005317          	auipc	t1,0x5
    80005a90:	9bc33303          	ld	t1,-1604(t1) # 8000a448 <devsw+0x18>
    80005a94:	01010113          	addi	sp,sp,16
    80005a98:	00030067          	jr	t1

0000000080005a9c <panic>:
    80005a9c:	fe010113          	addi	sp,sp,-32
    80005aa0:	00113c23          	sd	ra,24(sp)
    80005aa4:	00813823          	sd	s0,16(sp)
    80005aa8:	00913423          	sd	s1,8(sp)
    80005aac:	02010413          	addi	s0,sp,32
    80005ab0:	00050493          	mv	s1,a0
    80005ab4:	00003517          	auipc	a0,0x3
    80005ab8:	ab450513          	addi	a0,a0,-1356 # 80008568 <CONSOLE_STATUS+0x558>
    80005abc:	00005797          	auipc	a5,0x5
    80005ac0:	a207a623          	sw	zero,-1492(a5) # 8000a4e8 <pr+0x18>
    80005ac4:	00000097          	auipc	ra,0x0
    80005ac8:	034080e7          	jalr	52(ra) # 80005af8 <__printf>
    80005acc:	00048513          	mv	a0,s1
    80005ad0:	00000097          	auipc	ra,0x0
    80005ad4:	028080e7          	jalr	40(ra) # 80005af8 <__printf>
    80005ad8:	00003517          	auipc	a0,0x3
    80005adc:	a7050513          	addi	a0,a0,-1424 # 80008548 <CONSOLE_STATUS+0x538>
    80005ae0:	00000097          	auipc	ra,0x0
    80005ae4:	018080e7          	jalr	24(ra) # 80005af8 <__printf>
    80005ae8:	00100793          	li	a5,1
    80005aec:	00003717          	auipc	a4,0x3
    80005af0:	74f72e23          	sw	a5,1884(a4) # 80009248 <panicked>
    80005af4:	0000006f          	j	80005af4 <panic+0x58>

0000000080005af8 <__printf>:
    80005af8:	f3010113          	addi	sp,sp,-208
    80005afc:	08813023          	sd	s0,128(sp)
    80005b00:	07313423          	sd	s3,104(sp)
    80005b04:	09010413          	addi	s0,sp,144
    80005b08:	05813023          	sd	s8,64(sp)
    80005b0c:	08113423          	sd	ra,136(sp)
    80005b10:	06913c23          	sd	s1,120(sp)
    80005b14:	07213823          	sd	s2,112(sp)
    80005b18:	07413023          	sd	s4,96(sp)
    80005b1c:	05513c23          	sd	s5,88(sp)
    80005b20:	05613823          	sd	s6,80(sp)
    80005b24:	05713423          	sd	s7,72(sp)
    80005b28:	03913c23          	sd	s9,56(sp)
    80005b2c:	03a13823          	sd	s10,48(sp)
    80005b30:	03b13423          	sd	s11,40(sp)
    80005b34:	00005317          	auipc	t1,0x5
    80005b38:	99c30313          	addi	t1,t1,-1636 # 8000a4d0 <pr>
    80005b3c:	01832c03          	lw	s8,24(t1)
    80005b40:	00b43423          	sd	a1,8(s0)
    80005b44:	00c43823          	sd	a2,16(s0)
    80005b48:	00d43c23          	sd	a3,24(s0)
    80005b4c:	02e43023          	sd	a4,32(s0)
    80005b50:	02f43423          	sd	a5,40(s0)
    80005b54:	03043823          	sd	a6,48(s0)
    80005b58:	03143c23          	sd	a7,56(s0)
    80005b5c:	00050993          	mv	s3,a0
    80005b60:	4a0c1663          	bnez	s8,8000600c <__printf+0x514>
    80005b64:	60098c63          	beqz	s3,8000617c <__printf+0x684>
    80005b68:	0009c503          	lbu	a0,0(s3)
    80005b6c:	00840793          	addi	a5,s0,8
    80005b70:	f6f43c23          	sd	a5,-136(s0)
    80005b74:	00000493          	li	s1,0
    80005b78:	22050063          	beqz	a0,80005d98 <__printf+0x2a0>
    80005b7c:	00002a37          	lui	s4,0x2
    80005b80:	00018ab7          	lui	s5,0x18
    80005b84:	000f4b37          	lui	s6,0xf4
    80005b88:	00989bb7          	lui	s7,0x989
    80005b8c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005b90:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005b94:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005b98:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005b9c:	00148c9b          	addiw	s9,s1,1
    80005ba0:	02500793          	li	a5,37
    80005ba4:	01998933          	add	s2,s3,s9
    80005ba8:	38f51263          	bne	a0,a5,80005f2c <__printf+0x434>
    80005bac:	00094783          	lbu	a5,0(s2)
    80005bb0:	00078c9b          	sext.w	s9,a5
    80005bb4:	1e078263          	beqz	a5,80005d98 <__printf+0x2a0>
    80005bb8:	0024849b          	addiw	s1,s1,2
    80005bbc:	07000713          	li	a4,112
    80005bc0:	00998933          	add	s2,s3,s1
    80005bc4:	38e78a63          	beq	a5,a4,80005f58 <__printf+0x460>
    80005bc8:	20f76863          	bltu	a4,a5,80005dd8 <__printf+0x2e0>
    80005bcc:	42a78863          	beq	a5,a0,80005ffc <__printf+0x504>
    80005bd0:	06400713          	li	a4,100
    80005bd4:	40e79663          	bne	a5,a4,80005fe0 <__printf+0x4e8>
    80005bd8:	f7843783          	ld	a5,-136(s0)
    80005bdc:	0007a603          	lw	a2,0(a5)
    80005be0:	00878793          	addi	a5,a5,8
    80005be4:	f6f43c23          	sd	a5,-136(s0)
    80005be8:	42064a63          	bltz	a2,8000601c <__printf+0x524>
    80005bec:	00a00713          	li	a4,10
    80005bf0:	02e677bb          	remuw	a5,a2,a4
    80005bf4:	00003d97          	auipc	s11,0x3
    80005bf8:	99cd8d93          	addi	s11,s11,-1636 # 80008590 <digits>
    80005bfc:	00900593          	li	a1,9
    80005c00:	0006051b          	sext.w	a0,a2
    80005c04:	00000c93          	li	s9,0
    80005c08:	02079793          	slli	a5,a5,0x20
    80005c0c:	0207d793          	srli	a5,a5,0x20
    80005c10:	00fd87b3          	add	a5,s11,a5
    80005c14:	0007c783          	lbu	a5,0(a5)
    80005c18:	02e656bb          	divuw	a3,a2,a4
    80005c1c:	f8f40023          	sb	a5,-128(s0)
    80005c20:	14c5d863          	bge	a1,a2,80005d70 <__printf+0x278>
    80005c24:	06300593          	li	a1,99
    80005c28:	00100c93          	li	s9,1
    80005c2c:	02e6f7bb          	remuw	a5,a3,a4
    80005c30:	02079793          	slli	a5,a5,0x20
    80005c34:	0207d793          	srli	a5,a5,0x20
    80005c38:	00fd87b3          	add	a5,s11,a5
    80005c3c:	0007c783          	lbu	a5,0(a5)
    80005c40:	02e6d73b          	divuw	a4,a3,a4
    80005c44:	f8f400a3          	sb	a5,-127(s0)
    80005c48:	12a5f463          	bgeu	a1,a0,80005d70 <__printf+0x278>
    80005c4c:	00a00693          	li	a3,10
    80005c50:	00900593          	li	a1,9
    80005c54:	02d777bb          	remuw	a5,a4,a3
    80005c58:	02079793          	slli	a5,a5,0x20
    80005c5c:	0207d793          	srli	a5,a5,0x20
    80005c60:	00fd87b3          	add	a5,s11,a5
    80005c64:	0007c503          	lbu	a0,0(a5)
    80005c68:	02d757bb          	divuw	a5,a4,a3
    80005c6c:	f8a40123          	sb	a0,-126(s0)
    80005c70:	48e5f263          	bgeu	a1,a4,800060f4 <__printf+0x5fc>
    80005c74:	06300513          	li	a0,99
    80005c78:	02d7f5bb          	remuw	a1,a5,a3
    80005c7c:	02059593          	slli	a1,a1,0x20
    80005c80:	0205d593          	srli	a1,a1,0x20
    80005c84:	00bd85b3          	add	a1,s11,a1
    80005c88:	0005c583          	lbu	a1,0(a1)
    80005c8c:	02d7d7bb          	divuw	a5,a5,a3
    80005c90:	f8b401a3          	sb	a1,-125(s0)
    80005c94:	48e57263          	bgeu	a0,a4,80006118 <__printf+0x620>
    80005c98:	3e700513          	li	a0,999
    80005c9c:	02d7f5bb          	remuw	a1,a5,a3
    80005ca0:	02059593          	slli	a1,a1,0x20
    80005ca4:	0205d593          	srli	a1,a1,0x20
    80005ca8:	00bd85b3          	add	a1,s11,a1
    80005cac:	0005c583          	lbu	a1,0(a1)
    80005cb0:	02d7d7bb          	divuw	a5,a5,a3
    80005cb4:	f8b40223          	sb	a1,-124(s0)
    80005cb8:	46e57663          	bgeu	a0,a4,80006124 <__printf+0x62c>
    80005cbc:	02d7f5bb          	remuw	a1,a5,a3
    80005cc0:	02059593          	slli	a1,a1,0x20
    80005cc4:	0205d593          	srli	a1,a1,0x20
    80005cc8:	00bd85b3          	add	a1,s11,a1
    80005ccc:	0005c583          	lbu	a1,0(a1)
    80005cd0:	02d7d7bb          	divuw	a5,a5,a3
    80005cd4:	f8b402a3          	sb	a1,-123(s0)
    80005cd8:	46ea7863          	bgeu	s4,a4,80006148 <__printf+0x650>
    80005cdc:	02d7f5bb          	remuw	a1,a5,a3
    80005ce0:	02059593          	slli	a1,a1,0x20
    80005ce4:	0205d593          	srli	a1,a1,0x20
    80005ce8:	00bd85b3          	add	a1,s11,a1
    80005cec:	0005c583          	lbu	a1,0(a1)
    80005cf0:	02d7d7bb          	divuw	a5,a5,a3
    80005cf4:	f8b40323          	sb	a1,-122(s0)
    80005cf8:	3eeaf863          	bgeu	s5,a4,800060e8 <__printf+0x5f0>
    80005cfc:	02d7f5bb          	remuw	a1,a5,a3
    80005d00:	02059593          	slli	a1,a1,0x20
    80005d04:	0205d593          	srli	a1,a1,0x20
    80005d08:	00bd85b3          	add	a1,s11,a1
    80005d0c:	0005c583          	lbu	a1,0(a1)
    80005d10:	02d7d7bb          	divuw	a5,a5,a3
    80005d14:	f8b403a3          	sb	a1,-121(s0)
    80005d18:	42eb7e63          	bgeu	s6,a4,80006154 <__printf+0x65c>
    80005d1c:	02d7f5bb          	remuw	a1,a5,a3
    80005d20:	02059593          	slli	a1,a1,0x20
    80005d24:	0205d593          	srli	a1,a1,0x20
    80005d28:	00bd85b3          	add	a1,s11,a1
    80005d2c:	0005c583          	lbu	a1,0(a1)
    80005d30:	02d7d7bb          	divuw	a5,a5,a3
    80005d34:	f8b40423          	sb	a1,-120(s0)
    80005d38:	42ebfc63          	bgeu	s7,a4,80006170 <__printf+0x678>
    80005d3c:	02079793          	slli	a5,a5,0x20
    80005d40:	0207d793          	srli	a5,a5,0x20
    80005d44:	00fd8db3          	add	s11,s11,a5
    80005d48:	000dc703          	lbu	a4,0(s11)
    80005d4c:	00a00793          	li	a5,10
    80005d50:	00900c93          	li	s9,9
    80005d54:	f8e404a3          	sb	a4,-119(s0)
    80005d58:	00065c63          	bgez	a2,80005d70 <__printf+0x278>
    80005d5c:	f9040713          	addi	a4,s0,-112
    80005d60:	00f70733          	add	a4,a4,a5
    80005d64:	02d00693          	li	a3,45
    80005d68:	fed70823          	sb	a3,-16(a4)
    80005d6c:	00078c93          	mv	s9,a5
    80005d70:	f8040793          	addi	a5,s0,-128
    80005d74:	01978cb3          	add	s9,a5,s9
    80005d78:	f7f40d13          	addi	s10,s0,-129
    80005d7c:	000cc503          	lbu	a0,0(s9)
    80005d80:	fffc8c93          	addi	s9,s9,-1
    80005d84:	00000097          	auipc	ra,0x0
    80005d88:	b90080e7          	jalr	-1136(ra) # 80005914 <consputc>
    80005d8c:	ffac98e3          	bne	s9,s10,80005d7c <__printf+0x284>
    80005d90:	00094503          	lbu	a0,0(s2)
    80005d94:	e00514e3          	bnez	a0,80005b9c <__printf+0xa4>
    80005d98:	1a0c1663          	bnez	s8,80005f44 <__printf+0x44c>
    80005d9c:	08813083          	ld	ra,136(sp)
    80005da0:	08013403          	ld	s0,128(sp)
    80005da4:	07813483          	ld	s1,120(sp)
    80005da8:	07013903          	ld	s2,112(sp)
    80005dac:	06813983          	ld	s3,104(sp)
    80005db0:	06013a03          	ld	s4,96(sp)
    80005db4:	05813a83          	ld	s5,88(sp)
    80005db8:	05013b03          	ld	s6,80(sp)
    80005dbc:	04813b83          	ld	s7,72(sp)
    80005dc0:	04013c03          	ld	s8,64(sp)
    80005dc4:	03813c83          	ld	s9,56(sp)
    80005dc8:	03013d03          	ld	s10,48(sp)
    80005dcc:	02813d83          	ld	s11,40(sp)
    80005dd0:	0d010113          	addi	sp,sp,208
    80005dd4:	00008067          	ret
    80005dd8:	07300713          	li	a4,115
    80005ddc:	1ce78a63          	beq	a5,a4,80005fb0 <__printf+0x4b8>
    80005de0:	07800713          	li	a4,120
    80005de4:	1ee79e63          	bne	a5,a4,80005fe0 <__printf+0x4e8>
    80005de8:	f7843783          	ld	a5,-136(s0)
    80005dec:	0007a703          	lw	a4,0(a5)
    80005df0:	00878793          	addi	a5,a5,8
    80005df4:	f6f43c23          	sd	a5,-136(s0)
    80005df8:	28074263          	bltz	a4,8000607c <__printf+0x584>
    80005dfc:	00002d97          	auipc	s11,0x2
    80005e00:	794d8d93          	addi	s11,s11,1940 # 80008590 <digits>
    80005e04:	00f77793          	andi	a5,a4,15
    80005e08:	00fd87b3          	add	a5,s11,a5
    80005e0c:	0007c683          	lbu	a3,0(a5)
    80005e10:	00f00613          	li	a2,15
    80005e14:	0007079b          	sext.w	a5,a4
    80005e18:	f8d40023          	sb	a3,-128(s0)
    80005e1c:	0047559b          	srliw	a1,a4,0x4
    80005e20:	0047569b          	srliw	a3,a4,0x4
    80005e24:	00000c93          	li	s9,0
    80005e28:	0ee65063          	bge	a2,a4,80005f08 <__printf+0x410>
    80005e2c:	00f6f693          	andi	a3,a3,15
    80005e30:	00dd86b3          	add	a3,s11,a3
    80005e34:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005e38:	0087d79b          	srliw	a5,a5,0x8
    80005e3c:	00100c93          	li	s9,1
    80005e40:	f8d400a3          	sb	a3,-127(s0)
    80005e44:	0cb67263          	bgeu	a2,a1,80005f08 <__printf+0x410>
    80005e48:	00f7f693          	andi	a3,a5,15
    80005e4c:	00dd86b3          	add	a3,s11,a3
    80005e50:	0006c583          	lbu	a1,0(a3)
    80005e54:	00f00613          	li	a2,15
    80005e58:	0047d69b          	srliw	a3,a5,0x4
    80005e5c:	f8b40123          	sb	a1,-126(s0)
    80005e60:	0047d593          	srli	a1,a5,0x4
    80005e64:	28f67e63          	bgeu	a2,a5,80006100 <__printf+0x608>
    80005e68:	00f6f693          	andi	a3,a3,15
    80005e6c:	00dd86b3          	add	a3,s11,a3
    80005e70:	0006c503          	lbu	a0,0(a3)
    80005e74:	0087d813          	srli	a6,a5,0x8
    80005e78:	0087d69b          	srliw	a3,a5,0x8
    80005e7c:	f8a401a3          	sb	a0,-125(s0)
    80005e80:	28b67663          	bgeu	a2,a1,8000610c <__printf+0x614>
    80005e84:	00f6f693          	andi	a3,a3,15
    80005e88:	00dd86b3          	add	a3,s11,a3
    80005e8c:	0006c583          	lbu	a1,0(a3)
    80005e90:	00c7d513          	srli	a0,a5,0xc
    80005e94:	00c7d69b          	srliw	a3,a5,0xc
    80005e98:	f8b40223          	sb	a1,-124(s0)
    80005e9c:	29067a63          	bgeu	a2,a6,80006130 <__printf+0x638>
    80005ea0:	00f6f693          	andi	a3,a3,15
    80005ea4:	00dd86b3          	add	a3,s11,a3
    80005ea8:	0006c583          	lbu	a1,0(a3)
    80005eac:	0107d813          	srli	a6,a5,0x10
    80005eb0:	0107d69b          	srliw	a3,a5,0x10
    80005eb4:	f8b402a3          	sb	a1,-123(s0)
    80005eb8:	28a67263          	bgeu	a2,a0,8000613c <__printf+0x644>
    80005ebc:	00f6f693          	andi	a3,a3,15
    80005ec0:	00dd86b3          	add	a3,s11,a3
    80005ec4:	0006c683          	lbu	a3,0(a3)
    80005ec8:	0147d79b          	srliw	a5,a5,0x14
    80005ecc:	f8d40323          	sb	a3,-122(s0)
    80005ed0:	21067663          	bgeu	a2,a6,800060dc <__printf+0x5e4>
    80005ed4:	02079793          	slli	a5,a5,0x20
    80005ed8:	0207d793          	srli	a5,a5,0x20
    80005edc:	00fd8db3          	add	s11,s11,a5
    80005ee0:	000dc683          	lbu	a3,0(s11)
    80005ee4:	00800793          	li	a5,8
    80005ee8:	00700c93          	li	s9,7
    80005eec:	f8d403a3          	sb	a3,-121(s0)
    80005ef0:	00075c63          	bgez	a4,80005f08 <__printf+0x410>
    80005ef4:	f9040713          	addi	a4,s0,-112
    80005ef8:	00f70733          	add	a4,a4,a5
    80005efc:	02d00693          	li	a3,45
    80005f00:	fed70823          	sb	a3,-16(a4)
    80005f04:	00078c93          	mv	s9,a5
    80005f08:	f8040793          	addi	a5,s0,-128
    80005f0c:	01978cb3          	add	s9,a5,s9
    80005f10:	f7f40d13          	addi	s10,s0,-129
    80005f14:	000cc503          	lbu	a0,0(s9)
    80005f18:	fffc8c93          	addi	s9,s9,-1
    80005f1c:	00000097          	auipc	ra,0x0
    80005f20:	9f8080e7          	jalr	-1544(ra) # 80005914 <consputc>
    80005f24:	ff9d18e3          	bne	s10,s9,80005f14 <__printf+0x41c>
    80005f28:	0100006f          	j	80005f38 <__printf+0x440>
    80005f2c:	00000097          	auipc	ra,0x0
    80005f30:	9e8080e7          	jalr	-1560(ra) # 80005914 <consputc>
    80005f34:	000c8493          	mv	s1,s9
    80005f38:	00094503          	lbu	a0,0(s2)
    80005f3c:	c60510e3          	bnez	a0,80005b9c <__printf+0xa4>
    80005f40:	e40c0ee3          	beqz	s8,80005d9c <__printf+0x2a4>
    80005f44:	00004517          	auipc	a0,0x4
    80005f48:	58c50513          	addi	a0,a0,1420 # 8000a4d0 <pr>
    80005f4c:	00001097          	auipc	ra,0x1
    80005f50:	94c080e7          	jalr	-1716(ra) # 80006898 <release>
    80005f54:	e49ff06f          	j	80005d9c <__printf+0x2a4>
    80005f58:	f7843783          	ld	a5,-136(s0)
    80005f5c:	03000513          	li	a0,48
    80005f60:	01000d13          	li	s10,16
    80005f64:	00878713          	addi	a4,a5,8
    80005f68:	0007bc83          	ld	s9,0(a5)
    80005f6c:	f6e43c23          	sd	a4,-136(s0)
    80005f70:	00000097          	auipc	ra,0x0
    80005f74:	9a4080e7          	jalr	-1628(ra) # 80005914 <consputc>
    80005f78:	07800513          	li	a0,120
    80005f7c:	00000097          	auipc	ra,0x0
    80005f80:	998080e7          	jalr	-1640(ra) # 80005914 <consputc>
    80005f84:	00002d97          	auipc	s11,0x2
    80005f88:	60cd8d93          	addi	s11,s11,1548 # 80008590 <digits>
    80005f8c:	03ccd793          	srli	a5,s9,0x3c
    80005f90:	00fd87b3          	add	a5,s11,a5
    80005f94:	0007c503          	lbu	a0,0(a5)
    80005f98:	fffd0d1b          	addiw	s10,s10,-1
    80005f9c:	004c9c93          	slli	s9,s9,0x4
    80005fa0:	00000097          	auipc	ra,0x0
    80005fa4:	974080e7          	jalr	-1676(ra) # 80005914 <consputc>
    80005fa8:	fe0d12e3          	bnez	s10,80005f8c <__printf+0x494>
    80005fac:	f8dff06f          	j	80005f38 <__printf+0x440>
    80005fb0:	f7843783          	ld	a5,-136(s0)
    80005fb4:	0007bc83          	ld	s9,0(a5)
    80005fb8:	00878793          	addi	a5,a5,8
    80005fbc:	f6f43c23          	sd	a5,-136(s0)
    80005fc0:	000c9a63          	bnez	s9,80005fd4 <__printf+0x4dc>
    80005fc4:	1080006f          	j	800060cc <__printf+0x5d4>
    80005fc8:	001c8c93          	addi	s9,s9,1
    80005fcc:	00000097          	auipc	ra,0x0
    80005fd0:	948080e7          	jalr	-1720(ra) # 80005914 <consputc>
    80005fd4:	000cc503          	lbu	a0,0(s9)
    80005fd8:	fe0518e3          	bnez	a0,80005fc8 <__printf+0x4d0>
    80005fdc:	f5dff06f          	j	80005f38 <__printf+0x440>
    80005fe0:	02500513          	li	a0,37
    80005fe4:	00000097          	auipc	ra,0x0
    80005fe8:	930080e7          	jalr	-1744(ra) # 80005914 <consputc>
    80005fec:	000c8513          	mv	a0,s9
    80005ff0:	00000097          	auipc	ra,0x0
    80005ff4:	924080e7          	jalr	-1756(ra) # 80005914 <consputc>
    80005ff8:	f41ff06f          	j	80005f38 <__printf+0x440>
    80005ffc:	02500513          	li	a0,37
    80006000:	00000097          	auipc	ra,0x0
    80006004:	914080e7          	jalr	-1772(ra) # 80005914 <consputc>
    80006008:	f31ff06f          	j	80005f38 <__printf+0x440>
    8000600c:	00030513          	mv	a0,t1
    80006010:	00000097          	auipc	ra,0x0
    80006014:	7bc080e7          	jalr	1980(ra) # 800067cc <acquire>
    80006018:	b4dff06f          	j	80005b64 <__printf+0x6c>
    8000601c:	40c0053b          	negw	a0,a2
    80006020:	00a00713          	li	a4,10
    80006024:	02e576bb          	remuw	a3,a0,a4
    80006028:	00002d97          	auipc	s11,0x2
    8000602c:	568d8d93          	addi	s11,s11,1384 # 80008590 <digits>
    80006030:	ff700593          	li	a1,-9
    80006034:	02069693          	slli	a3,a3,0x20
    80006038:	0206d693          	srli	a3,a3,0x20
    8000603c:	00dd86b3          	add	a3,s11,a3
    80006040:	0006c683          	lbu	a3,0(a3)
    80006044:	02e557bb          	divuw	a5,a0,a4
    80006048:	f8d40023          	sb	a3,-128(s0)
    8000604c:	10b65e63          	bge	a2,a1,80006168 <__printf+0x670>
    80006050:	06300593          	li	a1,99
    80006054:	02e7f6bb          	remuw	a3,a5,a4
    80006058:	02069693          	slli	a3,a3,0x20
    8000605c:	0206d693          	srli	a3,a3,0x20
    80006060:	00dd86b3          	add	a3,s11,a3
    80006064:	0006c683          	lbu	a3,0(a3)
    80006068:	02e7d73b          	divuw	a4,a5,a4
    8000606c:	00200793          	li	a5,2
    80006070:	f8d400a3          	sb	a3,-127(s0)
    80006074:	bca5ece3          	bltu	a1,a0,80005c4c <__printf+0x154>
    80006078:	ce5ff06f          	j	80005d5c <__printf+0x264>
    8000607c:	40e007bb          	negw	a5,a4
    80006080:	00002d97          	auipc	s11,0x2
    80006084:	510d8d93          	addi	s11,s11,1296 # 80008590 <digits>
    80006088:	00f7f693          	andi	a3,a5,15
    8000608c:	00dd86b3          	add	a3,s11,a3
    80006090:	0006c583          	lbu	a1,0(a3)
    80006094:	ff100613          	li	a2,-15
    80006098:	0047d69b          	srliw	a3,a5,0x4
    8000609c:	f8b40023          	sb	a1,-128(s0)
    800060a0:	0047d59b          	srliw	a1,a5,0x4
    800060a4:	0ac75e63          	bge	a4,a2,80006160 <__printf+0x668>
    800060a8:	00f6f693          	andi	a3,a3,15
    800060ac:	00dd86b3          	add	a3,s11,a3
    800060b0:	0006c603          	lbu	a2,0(a3)
    800060b4:	00f00693          	li	a3,15
    800060b8:	0087d79b          	srliw	a5,a5,0x8
    800060bc:	f8c400a3          	sb	a2,-127(s0)
    800060c0:	d8b6e4e3          	bltu	a3,a1,80005e48 <__printf+0x350>
    800060c4:	00200793          	li	a5,2
    800060c8:	e2dff06f          	j	80005ef4 <__printf+0x3fc>
    800060cc:	00002c97          	auipc	s9,0x2
    800060d0:	4a4c8c93          	addi	s9,s9,1188 # 80008570 <CONSOLE_STATUS+0x560>
    800060d4:	02800513          	li	a0,40
    800060d8:	ef1ff06f          	j	80005fc8 <__printf+0x4d0>
    800060dc:	00700793          	li	a5,7
    800060e0:	00600c93          	li	s9,6
    800060e4:	e0dff06f          	j	80005ef0 <__printf+0x3f8>
    800060e8:	00700793          	li	a5,7
    800060ec:	00600c93          	li	s9,6
    800060f0:	c69ff06f          	j	80005d58 <__printf+0x260>
    800060f4:	00300793          	li	a5,3
    800060f8:	00200c93          	li	s9,2
    800060fc:	c5dff06f          	j	80005d58 <__printf+0x260>
    80006100:	00300793          	li	a5,3
    80006104:	00200c93          	li	s9,2
    80006108:	de9ff06f          	j	80005ef0 <__printf+0x3f8>
    8000610c:	00400793          	li	a5,4
    80006110:	00300c93          	li	s9,3
    80006114:	dddff06f          	j	80005ef0 <__printf+0x3f8>
    80006118:	00400793          	li	a5,4
    8000611c:	00300c93          	li	s9,3
    80006120:	c39ff06f          	j	80005d58 <__printf+0x260>
    80006124:	00500793          	li	a5,5
    80006128:	00400c93          	li	s9,4
    8000612c:	c2dff06f          	j	80005d58 <__printf+0x260>
    80006130:	00500793          	li	a5,5
    80006134:	00400c93          	li	s9,4
    80006138:	db9ff06f          	j	80005ef0 <__printf+0x3f8>
    8000613c:	00600793          	li	a5,6
    80006140:	00500c93          	li	s9,5
    80006144:	dadff06f          	j	80005ef0 <__printf+0x3f8>
    80006148:	00600793          	li	a5,6
    8000614c:	00500c93          	li	s9,5
    80006150:	c09ff06f          	j	80005d58 <__printf+0x260>
    80006154:	00800793          	li	a5,8
    80006158:	00700c93          	li	s9,7
    8000615c:	bfdff06f          	j	80005d58 <__printf+0x260>
    80006160:	00100793          	li	a5,1
    80006164:	d91ff06f          	j	80005ef4 <__printf+0x3fc>
    80006168:	00100793          	li	a5,1
    8000616c:	bf1ff06f          	j	80005d5c <__printf+0x264>
    80006170:	00900793          	li	a5,9
    80006174:	00800c93          	li	s9,8
    80006178:	be1ff06f          	j	80005d58 <__printf+0x260>
    8000617c:	00002517          	auipc	a0,0x2
    80006180:	3fc50513          	addi	a0,a0,1020 # 80008578 <CONSOLE_STATUS+0x568>
    80006184:	00000097          	auipc	ra,0x0
    80006188:	918080e7          	jalr	-1768(ra) # 80005a9c <panic>

000000008000618c <printfinit>:
    8000618c:	fe010113          	addi	sp,sp,-32
    80006190:	00813823          	sd	s0,16(sp)
    80006194:	00913423          	sd	s1,8(sp)
    80006198:	00113c23          	sd	ra,24(sp)
    8000619c:	02010413          	addi	s0,sp,32
    800061a0:	00004497          	auipc	s1,0x4
    800061a4:	33048493          	addi	s1,s1,816 # 8000a4d0 <pr>
    800061a8:	00048513          	mv	a0,s1
    800061ac:	00002597          	auipc	a1,0x2
    800061b0:	3dc58593          	addi	a1,a1,988 # 80008588 <CONSOLE_STATUS+0x578>
    800061b4:	00000097          	auipc	ra,0x0
    800061b8:	5f4080e7          	jalr	1524(ra) # 800067a8 <initlock>
    800061bc:	01813083          	ld	ra,24(sp)
    800061c0:	01013403          	ld	s0,16(sp)
    800061c4:	0004ac23          	sw	zero,24(s1)
    800061c8:	00813483          	ld	s1,8(sp)
    800061cc:	02010113          	addi	sp,sp,32
    800061d0:	00008067          	ret

00000000800061d4 <uartinit>:
    800061d4:	ff010113          	addi	sp,sp,-16
    800061d8:	00813423          	sd	s0,8(sp)
    800061dc:	01010413          	addi	s0,sp,16
    800061e0:	100007b7          	lui	a5,0x10000
    800061e4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800061e8:	f8000713          	li	a4,-128
    800061ec:	00e781a3          	sb	a4,3(a5)
    800061f0:	00300713          	li	a4,3
    800061f4:	00e78023          	sb	a4,0(a5)
    800061f8:	000780a3          	sb	zero,1(a5)
    800061fc:	00e781a3          	sb	a4,3(a5)
    80006200:	00700693          	li	a3,7
    80006204:	00d78123          	sb	a3,2(a5)
    80006208:	00e780a3          	sb	a4,1(a5)
    8000620c:	00813403          	ld	s0,8(sp)
    80006210:	01010113          	addi	sp,sp,16
    80006214:	00008067          	ret

0000000080006218 <uartputc>:
    80006218:	00003797          	auipc	a5,0x3
    8000621c:	0307a783          	lw	a5,48(a5) # 80009248 <panicked>
    80006220:	00078463          	beqz	a5,80006228 <uartputc+0x10>
    80006224:	0000006f          	j	80006224 <uartputc+0xc>
    80006228:	fd010113          	addi	sp,sp,-48
    8000622c:	02813023          	sd	s0,32(sp)
    80006230:	00913c23          	sd	s1,24(sp)
    80006234:	01213823          	sd	s2,16(sp)
    80006238:	01313423          	sd	s3,8(sp)
    8000623c:	02113423          	sd	ra,40(sp)
    80006240:	03010413          	addi	s0,sp,48
    80006244:	00003917          	auipc	s2,0x3
    80006248:	00c90913          	addi	s2,s2,12 # 80009250 <uart_tx_r>
    8000624c:	00093783          	ld	a5,0(s2)
    80006250:	00003497          	auipc	s1,0x3
    80006254:	00848493          	addi	s1,s1,8 # 80009258 <uart_tx_w>
    80006258:	0004b703          	ld	a4,0(s1)
    8000625c:	02078693          	addi	a3,a5,32
    80006260:	00050993          	mv	s3,a0
    80006264:	02e69c63          	bne	a3,a4,8000629c <uartputc+0x84>
    80006268:	00001097          	auipc	ra,0x1
    8000626c:	834080e7          	jalr	-1996(ra) # 80006a9c <push_on>
    80006270:	00093783          	ld	a5,0(s2)
    80006274:	0004b703          	ld	a4,0(s1)
    80006278:	02078793          	addi	a5,a5,32
    8000627c:	00e79463          	bne	a5,a4,80006284 <uartputc+0x6c>
    80006280:	0000006f          	j	80006280 <uartputc+0x68>
    80006284:	00001097          	auipc	ra,0x1
    80006288:	88c080e7          	jalr	-1908(ra) # 80006b10 <pop_on>
    8000628c:	00093783          	ld	a5,0(s2)
    80006290:	0004b703          	ld	a4,0(s1)
    80006294:	02078693          	addi	a3,a5,32
    80006298:	fce688e3          	beq	a3,a4,80006268 <uartputc+0x50>
    8000629c:	01f77693          	andi	a3,a4,31
    800062a0:	00004597          	auipc	a1,0x4
    800062a4:	25058593          	addi	a1,a1,592 # 8000a4f0 <uart_tx_buf>
    800062a8:	00d586b3          	add	a3,a1,a3
    800062ac:	00170713          	addi	a4,a4,1
    800062b0:	01368023          	sb	s3,0(a3)
    800062b4:	00e4b023          	sd	a4,0(s1)
    800062b8:	10000637          	lui	a2,0x10000
    800062bc:	02f71063          	bne	a4,a5,800062dc <uartputc+0xc4>
    800062c0:	0340006f          	j	800062f4 <uartputc+0xdc>
    800062c4:	00074703          	lbu	a4,0(a4)
    800062c8:	00f93023          	sd	a5,0(s2)
    800062cc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800062d0:	00093783          	ld	a5,0(s2)
    800062d4:	0004b703          	ld	a4,0(s1)
    800062d8:	00f70e63          	beq	a4,a5,800062f4 <uartputc+0xdc>
    800062dc:	00564683          	lbu	a3,5(a2)
    800062e0:	01f7f713          	andi	a4,a5,31
    800062e4:	00e58733          	add	a4,a1,a4
    800062e8:	0206f693          	andi	a3,a3,32
    800062ec:	00178793          	addi	a5,a5,1
    800062f0:	fc069ae3          	bnez	a3,800062c4 <uartputc+0xac>
    800062f4:	02813083          	ld	ra,40(sp)
    800062f8:	02013403          	ld	s0,32(sp)
    800062fc:	01813483          	ld	s1,24(sp)
    80006300:	01013903          	ld	s2,16(sp)
    80006304:	00813983          	ld	s3,8(sp)
    80006308:	03010113          	addi	sp,sp,48
    8000630c:	00008067          	ret

0000000080006310 <uartputc_sync>:
    80006310:	ff010113          	addi	sp,sp,-16
    80006314:	00813423          	sd	s0,8(sp)
    80006318:	01010413          	addi	s0,sp,16
    8000631c:	00003717          	auipc	a4,0x3
    80006320:	f2c72703          	lw	a4,-212(a4) # 80009248 <panicked>
    80006324:	02071663          	bnez	a4,80006350 <uartputc_sync+0x40>
    80006328:	00050793          	mv	a5,a0
    8000632c:	100006b7          	lui	a3,0x10000
    80006330:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006334:	02077713          	andi	a4,a4,32
    80006338:	fe070ce3          	beqz	a4,80006330 <uartputc_sync+0x20>
    8000633c:	0ff7f793          	andi	a5,a5,255
    80006340:	00f68023          	sb	a5,0(a3)
    80006344:	00813403          	ld	s0,8(sp)
    80006348:	01010113          	addi	sp,sp,16
    8000634c:	00008067          	ret
    80006350:	0000006f          	j	80006350 <uartputc_sync+0x40>

0000000080006354 <uartstart>:
    80006354:	ff010113          	addi	sp,sp,-16
    80006358:	00813423          	sd	s0,8(sp)
    8000635c:	01010413          	addi	s0,sp,16
    80006360:	00003617          	auipc	a2,0x3
    80006364:	ef060613          	addi	a2,a2,-272 # 80009250 <uart_tx_r>
    80006368:	00003517          	auipc	a0,0x3
    8000636c:	ef050513          	addi	a0,a0,-272 # 80009258 <uart_tx_w>
    80006370:	00063783          	ld	a5,0(a2)
    80006374:	00053703          	ld	a4,0(a0)
    80006378:	04f70263          	beq	a4,a5,800063bc <uartstart+0x68>
    8000637c:	100005b7          	lui	a1,0x10000
    80006380:	00004817          	auipc	a6,0x4
    80006384:	17080813          	addi	a6,a6,368 # 8000a4f0 <uart_tx_buf>
    80006388:	01c0006f          	j	800063a4 <uartstart+0x50>
    8000638c:	0006c703          	lbu	a4,0(a3)
    80006390:	00f63023          	sd	a5,0(a2)
    80006394:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006398:	00063783          	ld	a5,0(a2)
    8000639c:	00053703          	ld	a4,0(a0)
    800063a0:	00f70e63          	beq	a4,a5,800063bc <uartstart+0x68>
    800063a4:	01f7f713          	andi	a4,a5,31
    800063a8:	00e806b3          	add	a3,a6,a4
    800063ac:	0055c703          	lbu	a4,5(a1)
    800063b0:	00178793          	addi	a5,a5,1
    800063b4:	02077713          	andi	a4,a4,32
    800063b8:	fc071ae3          	bnez	a4,8000638c <uartstart+0x38>
    800063bc:	00813403          	ld	s0,8(sp)
    800063c0:	01010113          	addi	sp,sp,16
    800063c4:	00008067          	ret

00000000800063c8 <uartgetc>:
    800063c8:	ff010113          	addi	sp,sp,-16
    800063cc:	00813423          	sd	s0,8(sp)
    800063d0:	01010413          	addi	s0,sp,16
    800063d4:	10000737          	lui	a4,0x10000
    800063d8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800063dc:	0017f793          	andi	a5,a5,1
    800063e0:	00078c63          	beqz	a5,800063f8 <uartgetc+0x30>
    800063e4:	00074503          	lbu	a0,0(a4)
    800063e8:	0ff57513          	andi	a0,a0,255
    800063ec:	00813403          	ld	s0,8(sp)
    800063f0:	01010113          	addi	sp,sp,16
    800063f4:	00008067          	ret
    800063f8:	fff00513          	li	a0,-1
    800063fc:	ff1ff06f          	j	800063ec <uartgetc+0x24>

0000000080006400 <uartintr>:
    80006400:	100007b7          	lui	a5,0x10000
    80006404:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006408:	0017f793          	andi	a5,a5,1
    8000640c:	0a078463          	beqz	a5,800064b4 <uartintr+0xb4>
    80006410:	fe010113          	addi	sp,sp,-32
    80006414:	00813823          	sd	s0,16(sp)
    80006418:	00913423          	sd	s1,8(sp)
    8000641c:	00113c23          	sd	ra,24(sp)
    80006420:	02010413          	addi	s0,sp,32
    80006424:	100004b7          	lui	s1,0x10000
    80006428:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000642c:	0ff57513          	andi	a0,a0,255
    80006430:	fffff097          	auipc	ra,0xfffff
    80006434:	534080e7          	jalr	1332(ra) # 80005964 <consoleintr>
    80006438:	0054c783          	lbu	a5,5(s1)
    8000643c:	0017f793          	andi	a5,a5,1
    80006440:	fe0794e3          	bnez	a5,80006428 <uartintr+0x28>
    80006444:	00003617          	auipc	a2,0x3
    80006448:	e0c60613          	addi	a2,a2,-500 # 80009250 <uart_tx_r>
    8000644c:	00003517          	auipc	a0,0x3
    80006450:	e0c50513          	addi	a0,a0,-500 # 80009258 <uart_tx_w>
    80006454:	00063783          	ld	a5,0(a2)
    80006458:	00053703          	ld	a4,0(a0)
    8000645c:	04f70263          	beq	a4,a5,800064a0 <uartintr+0xa0>
    80006460:	100005b7          	lui	a1,0x10000
    80006464:	00004817          	auipc	a6,0x4
    80006468:	08c80813          	addi	a6,a6,140 # 8000a4f0 <uart_tx_buf>
    8000646c:	01c0006f          	j	80006488 <uartintr+0x88>
    80006470:	0006c703          	lbu	a4,0(a3)
    80006474:	00f63023          	sd	a5,0(a2)
    80006478:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000647c:	00063783          	ld	a5,0(a2)
    80006480:	00053703          	ld	a4,0(a0)
    80006484:	00f70e63          	beq	a4,a5,800064a0 <uartintr+0xa0>
    80006488:	01f7f713          	andi	a4,a5,31
    8000648c:	00e806b3          	add	a3,a6,a4
    80006490:	0055c703          	lbu	a4,5(a1)
    80006494:	00178793          	addi	a5,a5,1
    80006498:	02077713          	andi	a4,a4,32
    8000649c:	fc071ae3          	bnez	a4,80006470 <uartintr+0x70>
    800064a0:	01813083          	ld	ra,24(sp)
    800064a4:	01013403          	ld	s0,16(sp)
    800064a8:	00813483          	ld	s1,8(sp)
    800064ac:	02010113          	addi	sp,sp,32
    800064b0:	00008067          	ret
    800064b4:	00003617          	auipc	a2,0x3
    800064b8:	d9c60613          	addi	a2,a2,-612 # 80009250 <uart_tx_r>
    800064bc:	00003517          	auipc	a0,0x3
    800064c0:	d9c50513          	addi	a0,a0,-612 # 80009258 <uart_tx_w>
    800064c4:	00063783          	ld	a5,0(a2)
    800064c8:	00053703          	ld	a4,0(a0)
    800064cc:	04f70263          	beq	a4,a5,80006510 <uartintr+0x110>
    800064d0:	100005b7          	lui	a1,0x10000
    800064d4:	00004817          	auipc	a6,0x4
    800064d8:	01c80813          	addi	a6,a6,28 # 8000a4f0 <uart_tx_buf>
    800064dc:	01c0006f          	j	800064f8 <uartintr+0xf8>
    800064e0:	0006c703          	lbu	a4,0(a3)
    800064e4:	00f63023          	sd	a5,0(a2)
    800064e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800064ec:	00063783          	ld	a5,0(a2)
    800064f0:	00053703          	ld	a4,0(a0)
    800064f4:	02f70063          	beq	a4,a5,80006514 <uartintr+0x114>
    800064f8:	01f7f713          	andi	a4,a5,31
    800064fc:	00e806b3          	add	a3,a6,a4
    80006500:	0055c703          	lbu	a4,5(a1)
    80006504:	00178793          	addi	a5,a5,1
    80006508:	02077713          	andi	a4,a4,32
    8000650c:	fc071ae3          	bnez	a4,800064e0 <uartintr+0xe0>
    80006510:	00008067          	ret
    80006514:	00008067          	ret

0000000080006518 <kinit>:
    80006518:	fc010113          	addi	sp,sp,-64
    8000651c:	02913423          	sd	s1,40(sp)
    80006520:	fffff7b7          	lui	a5,0xfffff
    80006524:	00005497          	auipc	s1,0x5
    80006528:	feb48493          	addi	s1,s1,-21 # 8000b50f <end+0xfff>
    8000652c:	02813823          	sd	s0,48(sp)
    80006530:	01313c23          	sd	s3,24(sp)
    80006534:	00f4f4b3          	and	s1,s1,a5
    80006538:	02113c23          	sd	ra,56(sp)
    8000653c:	03213023          	sd	s2,32(sp)
    80006540:	01413823          	sd	s4,16(sp)
    80006544:	01513423          	sd	s5,8(sp)
    80006548:	04010413          	addi	s0,sp,64
    8000654c:	000017b7          	lui	a5,0x1
    80006550:	01100993          	li	s3,17
    80006554:	00f487b3          	add	a5,s1,a5
    80006558:	01b99993          	slli	s3,s3,0x1b
    8000655c:	06f9e063          	bltu	s3,a5,800065bc <kinit+0xa4>
    80006560:	00004a97          	auipc	s5,0x4
    80006564:	fb0a8a93          	addi	s5,s5,-80 # 8000a510 <end>
    80006568:	0754ec63          	bltu	s1,s5,800065e0 <kinit+0xc8>
    8000656c:	0734fa63          	bgeu	s1,s3,800065e0 <kinit+0xc8>
    80006570:	00088a37          	lui	s4,0x88
    80006574:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006578:	00003917          	auipc	s2,0x3
    8000657c:	ce890913          	addi	s2,s2,-792 # 80009260 <kmem>
    80006580:	00ca1a13          	slli	s4,s4,0xc
    80006584:	0140006f          	j	80006598 <kinit+0x80>
    80006588:	000017b7          	lui	a5,0x1
    8000658c:	00f484b3          	add	s1,s1,a5
    80006590:	0554e863          	bltu	s1,s5,800065e0 <kinit+0xc8>
    80006594:	0534f663          	bgeu	s1,s3,800065e0 <kinit+0xc8>
    80006598:	00001637          	lui	a2,0x1
    8000659c:	00100593          	li	a1,1
    800065a0:	00048513          	mv	a0,s1
    800065a4:	00000097          	auipc	ra,0x0
    800065a8:	5e4080e7          	jalr	1508(ra) # 80006b88 <__memset>
    800065ac:	00093783          	ld	a5,0(s2)
    800065b0:	00f4b023          	sd	a5,0(s1)
    800065b4:	00993023          	sd	s1,0(s2)
    800065b8:	fd4498e3          	bne	s1,s4,80006588 <kinit+0x70>
    800065bc:	03813083          	ld	ra,56(sp)
    800065c0:	03013403          	ld	s0,48(sp)
    800065c4:	02813483          	ld	s1,40(sp)
    800065c8:	02013903          	ld	s2,32(sp)
    800065cc:	01813983          	ld	s3,24(sp)
    800065d0:	01013a03          	ld	s4,16(sp)
    800065d4:	00813a83          	ld	s5,8(sp)
    800065d8:	04010113          	addi	sp,sp,64
    800065dc:	00008067          	ret
    800065e0:	00002517          	auipc	a0,0x2
    800065e4:	fc850513          	addi	a0,a0,-56 # 800085a8 <digits+0x18>
    800065e8:	fffff097          	auipc	ra,0xfffff
    800065ec:	4b4080e7          	jalr	1204(ra) # 80005a9c <panic>

00000000800065f0 <freerange>:
    800065f0:	fc010113          	addi	sp,sp,-64
    800065f4:	000017b7          	lui	a5,0x1
    800065f8:	02913423          	sd	s1,40(sp)
    800065fc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006600:	009504b3          	add	s1,a0,s1
    80006604:	fffff537          	lui	a0,0xfffff
    80006608:	02813823          	sd	s0,48(sp)
    8000660c:	02113c23          	sd	ra,56(sp)
    80006610:	03213023          	sd	s2,32(sp)
    80006614:	01313c23          	sd	s3,24(sp)
    80006618:	01413823          	sd	s4,16(sp)
    8000661c:	01513423          	sd	s5,8(sp)
    80006620:	01613023          	sd	s6,0(sp)
    80006624:	04010413          	addi	s0,sp,64
    80006628:	00a4f4b3          	and	s1,s1,a0
    8000662c:	00f487b3          	add	a5,s1,a5
    80006630:	06f5e463          	bltu	a1,a5,80006698 <freerange+0xa8>
    80006634:	00004a97          	auipc	s5,0x4
    80006638:	edca8a93          	addi	s5,s5,-292 # 8000a510 <end>
    8000663c:	0954e263          	bltu	s1,s5,800066c0 <freerange+0xd0>
    80006640:	01100993          	li	s3,17
    80006644:	01b99993          	slli	s3,s3,0x1b
    80006648:	0734fc63          	bgeu	s1,s3,800066c0 <freerange+0xd0>
    8000664c:	00058a13          	mv	s4,a1
    80006650:	00003917          	auipc	s2,0x3
    80006654:	c1090913          	addi	s2,s2,-1008 # 80009260 <kmem>
    80006658:	00002b37          	lui	s6,0x2
    8000665c:	0140006f          	j	80006670 <freerange+0x80>
    80006660:	000017b7          	lui	a5,0x1
    80006664:	00f484b3          	add	s1,s1,a5
    80006668:	0554ec63          	bltu	s1,s5,800066c0 <freerange+0xd0>
    8000666c:	0534fa63          	bgeu	s1,s3,800066c0 <freerange+0xd0>
    80006670:	00001637          	lui	a2,0x1
    80006674:	00100593          	li	a1,1
    80006678:	00048513          	mv	a0,s1
    8000667c:	00000097          	auipc	ra,0x0
    80006680:	50c080e7          	jalr	1292(ra) # 80006b88 <__memset>
    80006684:	00093703          	ld	a4,0(s2)
    80006688:	016487b3          	add	a5,s1,s6
    8000668c:	00e4b023          	sd	a4,0(s1)
    80006690:	00993023          	sd	s1,0(s2)
    80006694:	fcfa76e3          	bgeu	s4,a5,80006660 <freerange+0x70>
    80006698:	03813083          	ld	ra,56(sp)
    8000669c:	03013403          	ld	s0,48(sp)
    800066a0:	02813483          	ld	s1,40(sp)
    800066a4:	02013903          	ld	s2,32(sp)
    800066a8:	01813983          	ld	s3,24(sp)
    800066ac:	01013a03          	ld	s4,16(sp)
    800066b0:	00813a83          	ld	s5,8(sp)
    800066b4:	00013b03          	ld	s6,0(sp)
    800066b8:	04010113          	addi	sp,sp,64
    800066bc:	00008067          	ret
    800066c0:	00002517          	auipc	a0,0x2
    800066c4:	ee850513          	addi	a0,a0,-280 # 800085a8 <digits+0x18>
    800066c8:	fffff097          	auipc	ra,0xfffff
    800066cc:	3d4080e7          	jalr	980(ra) # 80005a9c <panic>

00000000800066d0 <kfree>:
    800066d0:	fe010113          	addi	sp,sp,-32
    800066d4:	00813823          	sd	s0,16(sp)
    800066d8:	00113c23          	sd	ra,24(sp)
    800066dc:	00913423          	sd	s1,8(sp)
    800066e0:	02010413          	addi	s0,sp,32
    800066e4:	03451793          	slli	a5,a0,0x34
    800066e8:	04079c63          	bnez	a5,80006740 <kfree+0x70>
    800066ec:	00004797          	auipc	a5,0x4
    800066f0:	e2478793          	addi	a5,a5,-476 # 8000a510 <end>
    800066f4:	00050493          	mv	s1,a0
    800066f8:	04f56463          	bltu	a0,a5,80006740 <kfree+0x70>
    800066fc:	01100793          	li	a5,17
    80006700:	01b79793          	slli	a5,a5,0x1b
    80006704:	02f57e63          	bgeu	a0,a5,80006740 <kfree+0x70>
    80006708:	00001637          	lui	a2,0x1
    8000670c:	00100593          	li	a1,1
    80006710:	00000097          	auipc	ra,0x0
    80006714:	478080e7          	jalr	1144(ra) # 80006b88 <__memset>
    80006718:	00003797          	auipc	a5,0x3
    8000671c:	b4878793          	addi	a5,a5,-1208 # 80009260 <kmem>
    80006720:	0007b703          	ld	a4,0(a5)
    80006724:	01813083          	ld	ra,24(sp)
    80006728:	01013403          	ld	s0,16(sp)
    8000672c:	00e4b023          	sd	a4,0(s1)
    80006730:	0097b023          	sd	s1,0(a5)
    80006734:	00813483          	ld	s1,8(sp)
    80006738:	02010113          	addi	sp,sp,32
    8000673c:	00008067          	ret
    80006740:	00002517          	auipc	a0,0x2
    80006744:	e6850513          	addi	a0,a0,-408 # 800085a8 <digits+0x18>
    80006748:	fffff097          	auipc	ra,0xfffff
    8000674c:	354080e7          	jalr	852(ra) # 80005a9c <panic>

0000000080006750 <kalloc>:
    80006750:	fe010113          	addi	sp,sp,-32
    80006754:	00813823          	sd	s0,16(sp)
    80006758:	00913423          	sd	s1,8(sp)
    8000675c:	00113c23          	sd	ra,24(sp)
    80006760:	02010413          	addi	s0,sp,32
    80006764:	00003797          	auipc	a5,0x3
    80006768:	afc78793          	addi	a5,a5,-1284 # 80009260 <kmem>
    8000676c:	0007b483          	ld	s1,0(a5)
    80006770:	02048063          	beqz	s1,80006790 <kalloc+0x40>
    80006774:	0004b703          	ld	a4,0(s1)
    80006778:	00001637          	lui	a2,0x1
    8000677c:	00500593          	li	a1,5
    80006780:	00048513          	mv	a0,s1
    80006784:	00e7b023          	sd	a4,0(a5)
    80006788:	00000097          	auipc	ra,0x0
    8000678c:	400080e7          	jalr	1024(ra) # 80006b88 <__memset>
    80006790:	01813083          	ld	ra,24(sp)
    80006794:	01013403          	ld	s0,16(sp)
    80006798:	00048513          	mv	a0,s1
    8000679c:	00813483          	ld	s1,8(sp)
    800067a0:	02010113          	addi	sp,sp,32
    800067a4:	00008067          	ret

00000000800067a8 <initlock>:
    800067a8:	ff010113          	addi	sp,sp,-16
    800067ac:	00813423          	sd	s0,8(sp)
    800067b0:	01010413          	addi	s0,sp,16
    800067b4:	00813403          	ld	s0,8(sp)
    800067b8:	00b53423          	sd	a1,8(a0)
    800067bc:	00052023          	sw	zero,0(a0)
    800067c0:	00053823          	sd	zero,16(a0)
    800067c4:	01010113          	addi	sp,sp,16
    800067c8:	00008067          	ret

00000000800067cc <acquire>:
    800067cc:	fe010113          	addi	sp,sp,-32
    800067d0:	00813823          	sd	s0,16(sp)
    800067d4:	00913423          	sd	s1,8(sp)
    800067d8:	00113c23          	sd	ra,24(sp)
    800067dc:	01213023          	sd	s2,0(sp)
    800067e0:	02010413          	addi	s0,sp,32
    800067e4:	00050493          	mv	s1,a0
    800067e8:	10002973          	csrr	s2,sstatus
    800067ec:	100027f3          	csrr	a5,sstatus
    800067f0:	ffd7f793          	andi	a5,a5,-3
    800067f4:	10079073          	csrw	sstatus,a5
    800067f8:	fffff097          	auipc	ra,0xfffff
    800067fc:	8e8080e7          	jalr	-1816(ra) # 800050e0 <mycpu>
    80006800:	07852783          	lw	a5,120(a0)
    80006804:	06078e63          	beqz	a5,80006880 <acquire+0xb4>
    80006808:	fffff097          	auipc	ra,0xfffff
    8000680c:	8d8080e7          	jalr	-1832(ra) # 800050e0 <mycpu>
    80006810:	07852783          	lw	a5,120(a0)
    80006814:	0004a703          	lw	a4,0(s1)
    80006818:	0017879b          	addiw	a5,a5,1
    8000681c:	06f52c23          	sw	a5,120(a0)
    80006820:	04071063          	bnez	a4,80006860 <acquire+0x94>
    80006824:	00100713          	li	a4,1
    80006828:	00070793          	mv	a5,a4
    8000682c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006830:	0007879b          	sext.w	a5,a5
    80006834:	fe079ae3          	bnez	a5,80006828 <acquire+0x5c>
    80006838:	0ff0000f          	fence
    8000683c:	fffff097          	auipc	ra,0xfffff
    80006840:	8a4080e7          	jalr	-1884(ra) # 800050e0 <mycpu>
    80006844:	01813083          	ld	ra,24(sp)
    80006848:	01013403          	ld	s0,16(sp)
    8000684c:	00a4b823          	sd	a0,16(s1)
    80006850:	00013903          	ld	s2,0(sp)
    80006854:	00813483          	ld	s1,8(sp)
    80006858:	02010113          	addi	sp,sp,32
    8000685c:	00008067          	ret
    80006860:	0104b903          	ld	s2,16(s1)
    80006864:	fffff097          	auipc	ra,0xfffff
    80006868:	87c080e7          	jalr	-1924(ra) # 800050e0 <mycpu>
    8000686c:	faa91ce3          	bne	s2,a0,80006824 <acquire+0x58>
    80006870:	00002517          	auipc	a0,0x2
    80006874:	d4050513          	addi	a0,a0,-704 # 800085b0 <digits+0x20>
    80006878:	fffff097          	auipc	ra,0xfffff
    8000687c:	224080e7          	jalr	548(ra) # 80005a9c <panic>
    80006880:	00195913          	srli	s2,s2,0x1
    80006884:	fffff097          	auipc	ra,0xfffff
    80006888:	85c080e7          	jalr	-1956(ra) # 800050e0 <mycpu>
    8000688c:	00197913          	andi	s2,s2,1
    80006890:	07252e23          	sw	s2,124(a0)
    80006894:	f75ff06f          	j	80006808 <acquire+0x3c>

0000000080006898 <release>:
    80006898:	fe010113          	addi	sp,sp,-32
    8000689c:	00813823          	sd	s0,16(sp)
    800068a0:	00113c23          	sd	ra,24(sp)
    800068a4:	00913423          	sd	s1,8(sp)
    800068a8:	01213023          	sd	s2,0(sp)
    800068ac:	02010413          	addi	s0,sp,32
    800068b0:	00052783          	lw	a5,0(a0)
    800068b4:	00079a63          	bnez	a5,800068c8 <release+0x30>
    800068b8:	00002517          	auipc	a0,0x2
    800068bc:	d0050513          	addi	a0,a0,-768 # 800085b8 <digits+0x28>
    800068c0:	fffff097          	auipc	ra,0xfffff
    800068c4:	1dc080e7          	jalr	476(ra) # 80005a9c <panic>
    800068c8:	01053903          	ld	s2,16(a0)
    800068cc:	00050493          	mv	s1,a0
    800068d0:	fffff097          	auipc	ra,0xfffff
    800068d4:	810080e7          	jalr	-2032(ra) # 800050e0 <mycpu>
    800068d8:	fea910e3          	bne	s2,a0,800068b8 <release+0x20>
    800068dc:	0004b823          	sd	zero,16(s1)
    800068e0:	0ff0000f          	fence
    800068e4:	0f50000f          	fence	iorw,ow
    800068e8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800068ec:	ffffe097          	auipc	ra,0xffffe
    800068f0:	7f4080e7          	jalr	2036(ra) # 800050e0 <mycpu>
    800068f4:	100027f3          	csrr	a5,sstatus
    800068f8:	0027f793          	andi	a5,a5,2
    800068fc:	04079a63          	bnez	a5,80006950 <release+0xb8>
    80006900:	07852783          	lw	a5,120(a0)
    80006904:	02f05e63          	blez	a5,80006940 <release+0xa8>
    80006908:	fff7871b          	addiw	a4,a5,-1
    8000690c:	06e52c23          	sw	a4,120(a0)
    80006910:	00071c63          	bnez	a4,80006928 <release+0x90>
    80006914:	07c52783          	lw	a5,124(a0)
    80006918:	00078863          	beqz	a5,80006928 <release+0x90>
    8000691c:	100027f3          	csrr	a5,sstatus
    80006920:	0027e793          	ori	a5,a5,2
    80006924:	10079073          	csrw	sstatus,a5
    80006928:	01813083          	ld	ra,24(sp)
    8000692c:	01013403          	ld	s0,16(sp)
    80006930:	00813483          	ld	s1,8(sp)
    80006934:	00013903          	ld	s2,0(sp)
    80006938:	02010113          	addi	sp,sp,32
    8000693c:	00008067          	ret
    80006940:	00002517          	auipc	a0,0x2
    80006944:	c9850513          	addi	a0,a0,-872 # 800085d8 <digits+0x48>
    80006948:	fffff097          	auipc	ra,0xfffff
    8000694c:	154080e7          	jalr	340(ra) # 80005a9c <panic>
    80006950:	00002517          	auipc	a0,0x2
    80006954:	c7050513          	addi	a0,a0,-912 # 800085c0 <digits+0x30>
    80006958:	fffff097          	auipc	ra,0xfffff
    8000695c:	144080e7          	jalr	324(ra) # 80005a9c <panic>

0000000080006960 <holding>:
    80006960:	00052783          	lw	a5,0(a0)
    80006964:	00079663          	bnez	a5,80006970 <holding+0x10>
    80006968:	00000513          	li	a0,0
    8000696c:	00008067          	ret
    80006970:	fe010113          	addi	sp,sp,-32
    80006974:	00813823          	sd	s0,16(sp)
    80006978:	00913423          	sd	s1,8(sp)
    8000697c:	00113c23          	sd	ra,24(sp)
    80006980:	02010413          	addi	s0,sp,32
    80006984:	01053483          	ld	s1,16(a0)
    80006988:	ffffe097          	auipc	ra,0xffffe
    8000698c:	758080e7          	jalr	1880(ra) # 800050e0 <mycpu>
    80006990:	01813083          	ld	ra,24(sp)
    80006994:	01013403          	ld	s0,16(sp)
    80006998:	40a48533          	sub	a0,s1,a0
    8000699c:	00153513          	seqz	a0,a0
    800069a0:	00813483          	ld	s1,8(sp)
    800069a4:	02010113          	addi	sp,sp,32
    800069a8:	00008067          	ret

00000000800069ac <push_off>:
    800069ac:	fe010113          	addi	sp,sp,-32
    800069b0:	00813823          	sd	s0,16(sp)
    800069b4:	00113c23          	sd	ra,24(sp)
    800069b8:	00913423          	sd	s1,8(sp)
    800069bc:	02010413          	addi	s0,sp,32
    800069c0:	100024f3          	csrr	s1,sstatus
    800069c4:	100027f3          	csrr	a5,sstatus
    800069c8:	ffd7f793          	andi	a5,a5,-3
    800069cc:	10079073          	csrw	sstatus,a5
    800069d0:	ffffe097          	auipc	ra,0xffffe
    800069d4:	710080e7          	jalr	1808(ra) # 800050e0 <mycpu>
    800069d8:	07852783          	lw	a5,120(a0)
    800069dc:	02078663          	beqz	a5,80006a08 <push_off+0x5c>
    800069e0:	ffffe097          	auipc	ra,0xffffe
    800069e4:	700080e7          	jalr	1792(ra) # 800050e0 <mycpu>
    800069e8:	07852783          	lw	a5,120(a0)
    800069ec:	01813083          	ld	ra,24(sp)
    800069f0:	01013403          	ld	s0,16(sp)
    800069f4:	0017879b          	addiw	a5,a5,1
    800069f8:	06f52c23          	sw	a5,120(a0)
    800069fc:	00813483          	ld	s1,8(sp)
    80006a00:	02010113          	addi	sp,sp,32
    80006a04:	00008067          	ret
    80006a08:	0014d493          	srli	s1,s1,0x1
    80006a0c:	ffffe097          	auipc	ra,0xffffe
    80006a10:	6d4080e7          	jalr	1748(ra) # 800050e0 <mycpu>
    80006a14:	0014f493          	andi	s1,s1,1
    80006a18:	06952e23          	sw	s1,124(a0)
    80006a1c:	fc5ff06f          	j	800069e0 <push_off+0x34>

0000000080006a20 <pop_off>:
    80006a20:	ff010113          	addi	sp,sp,-16
    80006a24:	00813023          	sd	s0,0(sp)
    80006a28:	00113423          	sd	ra,8(sp)
    80006a2c:	01010413          	addi	s0,sp,16
    80006a30:	ffffe097          	auipc	ra,0xffffe
    80006a34:	6b0080e7          	jalr	1712(ra) # 800050e0 <mycpu>
    80006a38:	100027f3          	csrr	a5,sstatus
    80006a3c:	0027f793          	andi	a5,a5,2
    80006a40:	04079663          	bnez	a5,80006a8c <pop_off+0x6c>
    80006a44:	07852783          	lw	a5,120(a0)
    80006a48:	02f05a63          	blez	a5,80006a7c <pop_off+0x5c>
    80006a4c:	fff7871b          	addiw	a4,a5,-1
    80006a50:	06e52c23          	sw	a4,120(a0)
    80006a54:	00071c63          	bnez	a4,80006a6c <pop_off+0x4c>
    80006a58:	07c52783          	lw	a5,124(a0)
    80006a5c:	00078863          	beqz	a5,80006a6c <pop_off+0x4c>
    80006a60:	100027f3          	csrr	a5,sstatus
    80006a64:	0027e793          	ori	a5,a5,2
    80006a68:	10079073          	csrw	sstatus,a5
    80006a6c:	00813083          	ld	ra,8(sp)
    80006a70:	00013403          	ld	s0,0(sp)
    80006a74:	01010113          	addi	sp,sp,16
    80006a78:	00008067          	ret
    80006a7c:	00002517          	auipc	a0,0x2
    80006a80:	b5c50513          	addi	a0,a0,-1188 # 800085d8 <digits+0x48>
    80006a84:	fffff097          	auipc	ra,0xfffff
    80006a88:	018080e7          	jalr	24(ra) # 80005a9c <panic>
    80006a8c:	00002517          	auipc	a0,0x2
    80006a90:	b3450513          	addi	a0,a0,-1228 # 800085c0 <digits+0x30>
    80006a94:	fffff097          	auipc	ra,0xfffff
    80006a98:	008080e7          	jalr	8(ra) # 80005a9c <panic>

0000000080006a9c <push_on>:
    80006a9c:	fe010113          	addi	sp,sp,-32
    80006aa0:	00813823          	sd	s0,16(sp)
    80006aa4:	00113c23          	sd	ra,24(sp)
    80006aa8:	00913423          	sd	s1,8(sp)
    80006aac:	02010413          	addi	s0,sp,32
    80006ab0:	100024f3          	csrr	s1,sstatus
    80006ab4:	100027f3          	csrr	a5,sstatus
    80006ab8:	0027e793          	ori	a5,a5,2
    80006abc:	10079073          	csrw	sstatus,a5
    80006ac0:	ffffe097          	auipc	ra,0xffffe
    80006ac4:	620080e7          	jalr	1568(ra) # 800050e0 <mycpu>
    80006ac8:	07852783          	lw	a5,120(a0)
    80006acc:	02078663          	beqz	a5,80006af8 <push_on+0x5c>
    80006ad0:	ffffe097          	auipc	ra,0xffffe
    80006ad4:	610080e7          	jalr	1552(ra) # 800050e0 <mycpu>
    80006ad8:	07852783          	lw	a5,120(a0)
    80006adc:	01813083          	ld	ra,24(sp)
    80006ae0:	01013403          	ld	s0,16(sp)
    80006ae4:	0017879b          	addiw	a5,a5,1
    80006ae8:	06f52c23          	sw	a5,120(a0)
    80006aec:	00813483          	ld	s1,8(sp)
    80006af0:	02010113          	addi	sp,sp,32
    80006af4:	00008067          	ret
    80006af8:	0014d493          	srli	s1,s1,0x1
    80006afc:	ffffe097          	auipc	ra,0xffffe
    80006b00:	5e4080e7          	jalr	1508(ra) # 800050e0 <mycpu>
    80006b04:	0014f493          	andi	s1,s1,1
    80006b08:	06952e23          	sw	s1,124(a0)
    80006b0c:	fc5ff06f          	j	80006ad0 <push_on+0x34>

0000000080006b10 <pop_on>:
    80006b10:	ff010113          	addi	sp,sp,-16
    80006b14:	00813023          	sd	s0,0(sp)
    80006b18:	00113423          	sd	ra,8(sp)
    80006b1c:	01010413          	addi	s0,sp,16
    80006b20:	ffffe097          	auipc	ra,0xffffe
    80006b24:	5c0080e7          	jalr	1472(ra) # 800050e0 <mycpu>
    80006b28:	100027f3          	csrr	a5,sstatus
    80006b2c:	0027f793          	andi	a5,a5,2
    80006b30:	04078463          	beqz	a5,80006b78 <pop_on+0x68>
    80006b34:	07852783          	lw	a5,120(a0)
    80006b38:	02f05863          	blez	a5,80006b68 <pop_on+0x58>
    80006b3c:	fff7879b          	addiw	a5,a5,-1
    80006b40:	06f52c23          	sw	a5,120(a0)
    80006b44:	07853783          	ld	a5,120(a0)
    80006b48:	00079863          	bnez	a5,80006b58 <pop_on+0x48>
    80006b4c:	100027f3          	csrr	a5,sstatus
    80006b50:	ffd7f793          	andi	a5,a5,-3
    80006b54:	10079073          	csrw	sstatus,a5
    80006b58:	00813083          	ld	ra,8(sp)
    80006b5c:	00013403          	ld	s0,0(sp)
    80006b60:	01010113          	addi	sp,sp,16
    80006b64:	00008067          	ret
    80006b68:	00002517          	auipc	a0,0x2
    80006b6c:	a9850513          	addi	a0,a0,-1384 # 80008600 <digits+0x70>
    80006b70:	fffff097          	auipc	ra,0xfffff
    80006b74:	f2c080e7          	jalr	-212(ra) # 80005a9c <panic>
    80006b78:	00002517          	auipc	a0,0x2
    80006b7c:	a6850513          	addi	a0,a0,-1432 # 800085e0 <digits+0x50>
    80006b80:	fffff097          	auipc	ra,0xfffff
    80006b84:	f1c080e7          	jalr	-228(ra) # 80005a9c <panic>

0000000080006b88 <__memset>:
    80006b88:	ff010113          	addi	sp,sp,-16
    80006b8c:	00813423          	sd	s0,8(sp)
    80006b90:	01010413          	addi	s0,sp,16
    80006b94:	1a060e63          	beqz	a2,80006d50 <__memset+0x1c8>
    80006b98:	40a007b3          	neg	a5,a0
    80006b9c:	0077f793          	andi	a5,a5,7
    80006ba0:	00778693          	addi	a3,a5,7
    80006ba4:	00b00813          	li	a6,11
    80006ba8:	0ff5f593          	andi	a1,a1,255
    80006bac:	fff6071b          	addiw	a4,a2,-1
    80006bb0:	1b06e663          	bltu	a3,a6,80006d5c <__memset+0x1d4>
    80006bb4:	1cd76463          	bltu	a4,a3,80006d7c <__memset+0x1f4>
    80006bb8:	1a078e63          	beqz	a5,80006d74 <__memset+0x1ec>
    80006bbc:	00b50023          	sb	a1,0(a0)
    80006bc0:	00100713          	li	a4,1
    80006bc4:	1ae78463          	beq	a5,a4,80006d6c <__memset+0x1e4>
    80006bc8:	00b500a3          	sb	a1,1(a0)
    80006bcc:	00200713          	li	a4,2
    80006bd0:	1ae78a63          	beq	a5,a4,80006d84 <__memset+0x1fc>
    80006bd4:	00b50123          	sb	a1,2(a0)
    80006bd8:	00300713          	li	a4,3
    80006bdc:	18e78463          	beq	a5,a4,80006d64 <__memset+0x1dc>
    80006be0:	00b501a3          	sb	a1,3(a0)
    80006be4:	00400713          	li	a4,4
    80006be8:	1ae78263          	beq	a5,a4,80006d8c <__memset+0x204>
    80006bec:	00b50223          	sb	a1,4(a0)
    80006bf0:	00500713          	li	a4,5
    80006bf4:	1ae78063          	beq	a5,a4,80006d94 <__memset+0x20c>
    80006bf8:	00b502a3          	sb	a1,5(a0)
    80006bfc:	00700713          	li	a4,7
    80006c00:	18e79e63          	bne	a5,a4,80006d9c <__memset+0x214>
    80006c04:	00b50323          	sb	a1,6(a0)
    80006c08:	00700e93          	li	t4,7
    80006c0c:	00859713          	slli	a4,a1,0x8
    80006c10:	00e5e733          	or	a4,a1,a4
    80006c14:	01059e13          	slli	t3,a1,0x10
    80006c18:	01c76e33          	or	t3,a4,t3
    80006c1c:	01859313          	slli	t1,a1,0x18
    80006c20:	006e6333          	or	t1,t3,t1
    80006c24:	02059893          	slli	a7,a1,0x20
    80006c28:	40f60e3b          	subw	t3,a2,a5
    80006c2c:	011368b3          	or	a7,t1,a7
    80006c30:	02859813          	slli	a6,a1,0x28
    80006c34:	0108e833          	or	a6,a7,a6
    80006c38:	03059693          	slli	a3,a1,0x30
    80006c3c:	003e589b          	srliw	a7,t3,0x3
    80006c40:	00d866b3          	or	a3,a6,a3
    80006c44:	03859713          	slli	a4,a1,0x38
    80006c48:	00389813          	slli	a6,a7,0x3
    80006c4c:	00f507b3          	add	a5,a0,a5
    80006c50:	00e6e733          	or	a4,a3,a4
    80006c54:	000e089b          	sext.w	a7,t3
    80006c58:	00f806b3          	add	a3,a6,a5
    80006c5c:	00e7b023          	sd	a4,0(a5)
    80006c60:	00878793          	addi	a5,a5,8
    80006c64:	fed79ce3          	bne	a5,a3,80006c5c <__memset+0xd4>
    80006c68:	ff8e7793          	andi	a5,t3,-8
    80006c6c:	0007871b          	sext.w	a4,a5
    80006c70:	01d787bb          	addw	a5,a5,t4
    80006c74:	0ce88e63          	beq	a7,a4,80006d50 <__memset+0x1c8>
    80006c78:	00f50733          	add	a4,a0,a5
    80006c7c:	00b70023          	sb	a1,0(a4)
    80006c80:	0017871b          	addiw	a4,a5,1
    80006c84:	0cc77663          	bgeu	a4,a2,80006d50 <__memset+0x1c8>
    80006c88:	00e50733          	add	a4,a0,a4
    80006c8c:	00b70023          	sb	a1,0(a4)
    80006c90:	0027871b          	addiw	a4,a5,2
    80006c94:	0ac77e63          	bgeu	a4,a2,80006d50 <__memset+0x1c8>
    80006c98:	00e50733          	add	a4,a0,a4
    80006c9c:	00b70023          	sb	a1,0(a4)
    80006ca0:	0037871b          	addiw	a4,a5,3
    80006ca4:	0ac77663          	bgeu	a4,a2,80006d50 <__memset+0x1c8>
    80006ca8:	00e50733          	add	a4,a0,a4
    80006cac:	00b70023          	sb	a1,0(a4)
    80006cb0:	0047871b          	addiw	a4,a5,4
    80006cb4:	08c77e63          	bgeu	a4,a2,80006d50 <__memset+0x1c8>
    80006cb8:	00e50733          	add	a4,a0,a4
    80006cbc:	00b70023          	sb	a1,0(a4)
    80006cc0:	0057871b          	addiw	a4,a5,5
    80006cc4:	08c77663          	bgeu	a4,a2,80006d50 <__memset+0x1c8>
    80006cc8:	00e50733          	add	a4,a0,a4
    80006ccc:	00b70023          	sb	a1,0(a4)
    80006cd0:	0067871b          	addiw	a4,a5,6
    80006cd4:	06c77e63          	bgeu	a4,a2,80006d50 <__memset+0x1c8>
    80006cd8:	00e50733          	add	a4,a0,a4
    80006cdc:	00b70023          	sb	a1,0(a4)
    80006ce0:	0077871b          	addiw	a4,a5,7
    80006ce4:	06c77663          	bgeu	a4,a2,80006d50 <__memset+0x1c8>
    80006ce8:	00e50733          	add	a4,a0,a4
    80006cec:	00b70023          	sb	a1,0(a4)
    80006cf0:	0087871b          	addiw	a4,a5,8
    80006cf4:	04c77e63          	bgeu	a4,a2,80006d50 <__memset+0x1c8>
    80006cf8:	00e50733          	add	a4,a0,a4
    80006cfc:	00b70023          	sb	a1,0(a4)
    80006d00:	0097871b          	addiw	a4,a5,9
    80006d04:	04c77663          	bgeu	a4,a2,80006d50 <__memset+0x1c8>
    80006d08:	00e50733          	add	a4,a0,a4
    80006d0c:	00b70023          	sb	a1,0(a4)
    80006d10:	00a7871b          	addiw	a4,a5,10
    80006d14:	02c77e63          	bgeu	a4,a2,80006d50 <__memset+0x1c8>
    80006d18:	00e50733          	add	a4,a0,a4
    80006d1c:	00b70023          	sb	a1,0(a4)
    80006d20:	00b7871b          	addiw	a4,a5,11
    80006d24:	02c77663          	bgeu	a4,a2,80006d50 <__memset+0x1c8>
    80006d28:	00e50733          	add	a4,a0,a4
    80006d2c:	00b70023          	sb	a1,0(a4)
    80006d30:	00c7871b          	addiw	a4,a5,12
    80006d34:	00c77e63          	bgeu	a4,a2,80006d50 <__memset+0x1c8>
    80006d38:	00e50733          	add	a4,a0,a4
    80006d3c:	00b70023          	sb	a1,0(a4)
    80006d40:	00d7879b          	addiw	a5,a5,13
    80006d44:	00c7f663          	bgeu	a5,a2,80006d50 <__memset+0x1c8>
    80006d48:	00f507b3          	add	a5,a0,a5
    80006d4c:	00b78023          	sb	a1,0(a5)
    80006d50:	00813403          	ld	s0,8(sp)
    80006d54:	01010113          	addi	sp,sp,16
    80006d58:	00008067          	ret
    80006d5c:	00b00693          	li	a3,11
    80006d60:	e55ff06f          	j	80006bb4 <__memset+0x2c>
    80006d64:	00300e93          	li	t4,3
    80006d68:	ea5ff06f          	j	80006c0c <__memset+0x84>
    80006d6c:	00100e93          	li	t4,1
    80006d70:	e9dff06f          	j	80006c0c <__memset+0x84>
    80006d74:	00000e93          	li	t4,0
    80006d78:	e95ff06f          	j	80006c0c <__memset+0x84>
    80006d7c:	00000793          	li	a5,0
    80006d80:	ef9ff06f          	j	80006c78 <__memset+0xf0>
    80006d84:	00200e93          	li	t4,2
    80006d88:	e85ff06f          	j	80006c0c <__memset+0x84>
    80006d8c:	00400e93          	li	t4,4
    80006d90:	e7dff06f          	j	80006c0c <__memset+0x84>
    80006d94:	00500e93          	li	t4,5
    80006d98:	e75ff06f          	j	80006c0c <__memset+0x84>
    80006d9c:	00600e93          	li	t4,6
    80006da0:	e6dff06f          	j	80006c0c <__memset+0x84>

0000000080006da4 <__memmove>:
    80006da4:	ff010113          	addi	sp,sp,-16
    80006da8:	00813423          	sd	s0,8(sp)
    80006dac:	01010413          	addi	s0,sp,16
    80006db0:	0e060863          	beqz	a2,80006ea0 <__memmove+0xfc>
    80006db4:	fff6069b          	addiw	a3,a2,-1
    80006db8:	0006881b          	sext.w	a6,a3
    80006dbc:	0ea5e863          	bltu	a1,a0,80006eac <__memmove+0x108>
    80006dc0:	00758713          	addi	a4,a1,7
    80006dc4:	00a5e7b3          	or	a5,a1,a0
    80006dc8:	40a70733          	sub	a4,a4,a0
    80006dcc:	0077f793          	andi	a5,a5,7
    80006dd0:	00f73713          	sltiu	a4,a4,15
    80006dd4:	00174713          	xori	a4,a4,1
    80006dd8:	0017b793          	seqz	a5,a5
    80006ddc:	00e7f7b3          	and	a5,a5,a4
    80006de0:	10078863          	beqz	a5,80006ef0 <__memmove+0x14c>
    80006de4:	00900793          	li	a5,9
    80006de8:	1107f463          	bgeu	a5,a6,80006ef0 <__memmove+0x14c>
    80006dec:	0036581b          	srliw	a6,a2,0x3
    80006df0:	fff8081b          	addiw	a6,a6,-1
    80006df4:	02081813          	slli	a6,a6,0x20
    80006df8:	01d85893          	srli	a7,a6,0x1d
    80006dfc:	00858813          	addi	a6,a1,8
    80006e00:	00058793          	mv	a5,a1
    80006e04:	00050713          	mv	a4,a0
    80006e08:	01088833          	add	a6,a7,a6
    80006e0c:	0007b883          	ld	a7,0(a5)
    80006e10:	00878793          	addi	a5,a5,8
    80006e14:	00870713          	addi	a4,a4,8
    80006e18:	ff173c23          	sd	a7,-8(a4)
    80006e1c:	ff0798e3          	bne	a5,a6,80006e0c <__memmove+0x68>
    80006e20:	ff867713          	andi	a4,a2,-8
    80006e24:	02071793          	slli	a5,a4,0x20
    80006e28:	0207d793          	srli	a5,a5,0x20
    80006e2c:	00f585b3          	add	a1,a1,a5
    80006e30:	40e686bb          	subw	a3,a3,a4
    80006e34:	00f507b3          	add	a5,a0,a5
    80006e38:	06e60463          	beq	a2,a4,80006ea0 <__memmove+0xfc>
    80006e3c:	0005c703          	lbu	a4,0(a1)
    80006e40:	00e78023          	sb	a4,0(a5)
    80006e44:	04068e63          	beqz	a3,80006ea0 <__memmove+0xfc>
    80006e48:	0015c603          	lbu	a2,1(a1)
    80006e4c:	00100713          	li	a4,1
    80006e50:	00c780a3          	sb	a2,1(a5)
    80006e54:	04e68663          	beq	a3,a4,80006ea0 <__memmove+0xfc>
    80006e58:	0025c603          	lbu	a2,2(a1)
    80006e5c:	00200713          	li	a4,2
    80006e60:	00c78123          	sb	a2,2(a5)
    80006e64:	02e68e63          	beq	a3,a4,80006ea0 <__memmove+0xfc>
    80006e68:	0035c603          	lbu	a2,3(a1)
    80006e6c:	00300713          	li	a4,3
    80006e70:	00c781a3          	sb	a2,3(a5)
    80006e74:	02e68663          	beq	a3,a4,80006ea0 <__memmove+0xfc>
    80006e78:	0045c603          	lbu	a2,4(a1)
    80006e7c:	00400713          	li	a4,4
    80006e80:	00c78223          	sb	a2,4(a5)
    80006e84:	00e68e63          	beq	a3,a4,80006ea0 <__memmove+0xfc>
    80006e88:	0055c603          	lbu	a2,5(a1)
    80006e8c:	00500713          	li	a4,5
    80006e90:	00c782a3          	sb	a2,5(a5)
    80006e94:	00e68663          	beq	a3,a4,80006ea0 <__memmove+0xfc>
    80006e98:	0065c703          	lbu	a4,6(a1)
    80006e9c:	00e78323          	sb	a4,6(a5)
    80006ea0:	00813403          	ld	s0,8(sp)
    80006ea4:	01010113          	addi	sp,sp,16
    80006ea8:	00008067          	ret
    80006eac:	02061713          	slli	a4,a2,0x20
    80006eb0:	02075713          	srli	a4,a4,0x20
    80006eb4:	00e587b3          	add	a5,a1,a4
    80006eb8:	f0f574e3          	bgeu	a0,a5,80006dc0 <__memmove+0x1c>
    80006ebc:	02069613          	slli	a2,a3,0x20
    80006ec0:	02065613          	srli	a2,a2,0x20
    80006ec4:	fff64613          	not	a2,a2
    80006ec8:	00e50733          	add	a4,a0,a4
    80006ecc:	00c78633          	add	a2,a5,a2
    80006ed0:	fff7c683          	lbu	a3,-1(a5)
    80006ed4:	fff78793          	addi	a5,a5,-1
    80006ed8:	fff70713          	addi	a4,a4,-1
    80006edc:	00d70023          	sb	a3,0(a4)
    80006ee0:	fec798e3          	bne	a5,a2,80006ed0 <__memmove+0x12c>
    80006ee4:	00813403          	ld	s0,8(sp)
    80006ee8:	01010113          	addi	sp,sp,16
    80006eec:	00008067          	ret
    80006ef0:	02069713          	slli	a4,a3,0x20
    80006ef4:	02075713          	srli	a4,a4,0x20
    80006ef8:	00170713          	addi	a4,a4,1
    80006efc:	00e50733          	add	a4,a0,a4
    80006f00:	00050793          	mv	a5,a0
    80006f04:	0005c683          	lbu	a3,0(a1)
    80006f08:	00178793          	addi	a5,a5,1
    80006f0c:	00158593          	addi	a1,a1,1
    80006f10:	fed78fa3          	sb	a3,-1(a5)
    80006f14:	fee798e3          	bne	a5,a4,80006f04 <__memmove+0x160>
    80006f18:	f89ff06f          	j	80006ea0 <__memmove+0xfc>

0000000080006f1c <__putc>:
    80006f1c:	fe010113          	addi	sp,sp,-32
    80006f20:	00813823          	sd	s0,16(sp)
    80006f24:	00113c23          	sd	ra,24(sp)
    80006f28:	02010413          	addi	s0,sp,32
    80006f2c:	00050793          	mv	a5,a0
    80006f30:	fef40593          	addi	a1,s0,-17
    80006f34:	00100613          	li	a2,1
    80006f38:	00000513          	li	a0,0
    80006f3c:	fef407a3          	sb	a5,-17(s0)
    80006f40:	fffff097          	auipc	ra,0xfffff
    80006f44:	b3c080e7          	jalr	-1220(ra) # 80005a7c <console_write>
    80006f48:	01813083          	ld	ra,24(sp)
    80006f4c:	01013403          	ld	s0,16(sp)
    80006f50:	02010113          	addi	sp,sp,32
    80006f54:	00008067          	ret

0000000080006f58 <__getc>:
    80006f58:	fe010113          	addi	sp,sp,-32
    80006f5c:	00813823          	sd	s0,16(sp)
    80006f60:	00113c23          	sd	ra,24(sp)
    80006f64:	02010413          	addi	s0,sp,32
    80006f68:	fe840593          	addi	a1,s0,-24
    80006f6c:	00100613          	li	a2,1
    80006f70:	00000513          	li	a0,0
    80006f74:	fffff097          	auipc	ra,0xfffff
    80006f78:	ae8080e7          	jalr	-1304(ra) # 80005a5c <console_read>
    80006f7c:	fe844503          	lbu	a0,-24(s0)
    80006f80:	01813083          	ld	ra,24(sp)
    80006f84:	01013403          	ld	s0,16(sp)
    80006f88:	02010113          	addi	sp,sp,32
    80006f8c:	00008067          	ret

0000000080006f90 <console_handler>:
    80006f90:	fe010113          	addi	sp,sp,-32
    80006f94:	00813823          	sd	s0,16(sp)
    80006f98:	00113c23          	sd	ra,24(sp)
    80006f9c:	00913423          	sd	s1,8(sp)
    80006fa0:	02010413          	addi	s0,sp,32
    80006fa4:	14202773          	csrr	a4,scause
    80006fa8:	100027f3          	csrr	a5,sstatus
    80006fac:	0027f793          	andi	a5,a5,2
    80006fb0:	06079e63          	bnez	a5,8000702c <console_handler+0x9c>
    80006fb4:	00074c63          	bltz	a4,80006fcc <console_handler+0x3c>
    80006fb8:	01813083          	ld	ra,24(sp)
    80006fbc:	01013403          	ld	s0,16(sp)
    80006fc0:	00813483          	ld	s1,8(sp)
    80006fc4:	02010113          	addi	sp,sp,32
    80006fc8:	00008067          	ret
    80006fcc:	0ff77713          	andi	a4,a4,255
    80006fd0:	00900793          	li	a5,9
    80006fd4:	fef712e3          	bne	a4,a5,80006fb8 <console_handler+0x28>
    80006fd8:	ffffe097          	auipc	ra,0xffffe
    80006fdc:	6dc080e7          	jalr	1756(ra) # 800056b4 <plic_claim>
    80006fe0:	00a00793          	li	a5,10
    80006fe4:	00050493          	mv	s1,a0
    80006fe8:	02f50c63          	beq	a0,a5,80007020 <console_handler+0x90>
    80006fec:	fc0506e3          	beqz	a0,80006fb8 <console_handler+0x28>
    80006ff0:	00050593          	mv	a1,a0
    80006ff4:	00001517          	auipc	a0,0x1
    80006ff8:	51450513          	addi	a0,a0,1300 # 80008508 <CONSOLE_STATUS+0x4f8>
    80006ffc:	fffff097          	auipc	ra,0xfffff
    80007000:	afc080e7          	jalr	-1284(ra) # 80005af8 <__printf>
    80007004:	01013403          	ld	s0,16(sp)
    80007008:	01813083          	ld	ra,24(sp)
    8000700c:	00048513          	mv	a0,s1
    80007010:	00813483          	ld	s1,8(sp)
    80007014:	02010113          	addi	sp,sp,32
    80007018:	ffffe317          	auipc	t1,0xffffe
    8000701c:	6d430067          	jr	1748(t1) # 800056ec <plic_complete>
    80007020:	fffff097          	auipc	ra,0xfffff
    80007024:	3e0080e7          	jalr	992(ra) # 80006400 <uartintr>
    80007028:	fddff06f          	j	80007004 <console_handler+0x74>
    8000702c:	00001517          	auipc	a0,0x1
    80007030:	5dc50513          	addi	a0,a0,1500 # 80008608 <digits+0x78>
    80007034:	fffff097          	auipc	ra,0xfffff
    80007038:	a68080e7          	jalr	-1432(ra) # 80005a9c <panic>
	...
