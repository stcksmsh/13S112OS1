
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00008117          	auipc	sp,0x8
    80000004:	0b813103          	ld	sp,184(sp) # 800080b8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	715030ef          	jal	ra,80003f30 <start>

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
    8000107c:	448020ef          	jal	ra,800034c4 <exceptionHandler>


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
    8000111c:	0087b783          	ld	a5,8(a5) # 80008120 <_ZN5Timer8instanceE>
    80001120:	02079463          	bnez	a5,80001148 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80001124:	00007797          	auipc	a5,0x7
    80001128:	fe97be23          	sd	s1,-4(a5) # 80008120 <_ZN5Timer8instanceE>
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
    80001168:	744080e7          	jalr	1860(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
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
    80001198:	00007797          	auipc	a5,0x7
    8000119c:	f887b783          	ld	a5,-120(a5) # 80008120 <_ZN5Timer8instanceE>
    800011a0:	00078863          	beqz	a5,800011b0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800011a4:	00007517          	auipc	a0,0x7
    800011a8:	f7c53503          	ld	a0,-132(a0) # 80008120 <_ZN5Timer8instanceE>
    800011ac:	00008067          	ret
Timer& Timer::getInstance(){
    800011b0:	ff010113          	addi	sp,sp,-16
    800011b4:	00113423          	sd	ra,8(sp)
    800011b8:	00813023          	sd	s0,0(sp)
    800011bc:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    800011c0:	00006697          	auipc	a3,0x6
    800011c4:	e9068693          	addi	a3,a3,-368 # 80007050 <CONSOLE_STATUS+0x40>
    800011c8:	02500613          	li	a2,37
    800011cc:	00006597          	auipc	a1,0x6
    800011d0:	e6458593          	addi	a1,a1,-412 # 80007030 <CONSOLE_STATUS+0x20>
    800011d4:	00006517          	auipc	a0,0x6
    800011d8:	ea450513          	addi	a0,a0,-348 # 80007078 <CONSOLE_STATUS+0x68>
    800011dc:	00000097          	auipc	ra,0x0
    800011e0:	6cc080e7          	jalr	1740(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
}
    800011e4:	00007517          	auipc	a0,0x7
    800011e8:	f3c53503          	ld	a0,-196(a0) # 80008120 <_ZN5Timer8instanceE>
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
    8000123c:	00005097          	auipc	ra,0x5
    80001240:	db0080e7          	jalr	-592(ra) # 80005fec <__putc>
        __putc('t');
    80001244:	07400513          	li	a0,116
    80001248:	00005097          	auipc	ra,0x5
    8000124c:	da4080e7          	jalr	-604(ra) # 80005fec <__putc>
        __putc('i');
    80001250:	06900513          	li	a0,105
    80001254:	00005097          	auipc	ra,0x5
    80001258:	d98080e7          	jalr	-616(ra) # 80005fec <__putc>
        __putc('c');
    8000125c:	06300513          	li	a0,99
    80001260:	00005097          	auipc	ra,0x5
    80001264:	d8c080e7          	jalr	-628(ra) # 80005fec <__putc>
        __putc('k');
    80001268:	06b00513          	li	a0,107
    8000126c:	00005097          	auipc	ra,0x5
    80001270:	d80080e7          	jalr	-640(ra) # 80005fec <__putc>
        __putc('\n');
    80001274:	00a00513          	li	a0,10
    80001278:	00005097          	auipc	ra,0x5
    8000127c:	d74080e7          	jalr	-652(ra) # 80005fec <__putc>
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
    800012a4:	00001097          	auipc	ra,0x1
    800012a8:	740080e7          	jalr	1856(ra) # 800029e4 <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    800012ac:	0004b503          	ld	a0,0(s1)
    800012b0:	00003097          	auipc	ra,0x3
    800012b4:	908080e7          	jalr	-1784(ra) # 80003bb8 <_ZN9Scheduler3putEP7_thread>
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
    80001304:	00007797          	auipc	a5,0x7
    80001308:	dcc7b783          	ld	a5,-564(a5) # 800080d0 <_GLOBAL_OFFSET_TABLE_+0x38>
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
    8000135c:	00001097          	auipc	ra,0x1
    80001360:	688080e7          	jalr	1672(ra) # 800029e4 <_ZN7_thread11setSleepingEb>
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
    800016a8:	00001097          	auipc	ra,0x1
    800016ac:	310080e7          	jalr	784(ra) # 800029b8 <_ZN7_thread9setClosedEb>
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
    80001710:	00007797          	auipc	a5,0x7
    80001714:	9c07b783          	ld	a5,-1600(a5) # 800080d0 <_GLOBAL_OFFSET_TABLE_+0x38>
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
    8000173c:	00007797          	auipc	a5,0x7
    80001740:	9947b783          	ld	a5,-1644(a5) # 800080d0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001744:	0007b503          	ld	a0,0(a5)
    80001748:	00001097          	auipc	ra,0x1
    8000174c:	240080e7          	jalr	576(ra) # 80002988 <_ZN7_thread10setBlockedEb>
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
    800017c0:	1cc080e7          	jalr	460(ra) # 80002988 <_ZN7_thread10setBlockedEb>
        // mem_free(pUnblock);
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    800017c4:	0004b503          	ld	a0,0(s1)
    800017c8:	00002097          	auipc	ra,0x2
    800017cc:	3f0080e7          	jalr	1008(ra) # 80003bb8 <_ZN9Scheduler3putEP7_thread>
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
    8000180c:	3cc080e7          	jalr	972(ra) # 80001bd4 <_ZN6KernelC1Ev>
    kernel.initialise();
    80001810:	00048513          	mv	a0,s1
    80001814:	00000097          	auipc	ra,0x0
    80001818:	434080e7          	jalr	1076(ra) # 80001c48 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    8000181c:	00048513          	mv	a0,s1
    80001820:	00000097          	auipc	ra,0x0
    80001824:	52c080e7          	jalr	1324(ra) # 80001d4c <_ZN6Kernel3runEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001828:	02051863          	bnez	a0,80001858 <main+0x6c>
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    8000182c:	fd040513          	addi	a0,s0,-48
    80001830:	00000097          	auipc	ra,0x0
    80001834:	940080e7          	jalr	-1728(ra) # 80001170 <_ZN5TimerD1Ev>
    80001838:	fb840513          	addi	a0,s0,-72
    8000183c:	00001097          	auipc	ra,0x1
    80001840:	380080e7          	jalr	896(ra) # 80002bbc <_ZN11HeapManagerD1Ev>
    80001844:	04813083          	ld	ra,72(sp)
    80001848:	04013403          	ld	s0,64(sp)
    8000184c:	03813483          	ld	s1,56(sp)
    80001850:	05010113          	addi	sp,sp,80
    80001854:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001858:	00006697          	auipc	a3,0x6
    8000185c:	83068693          	addi	a3,a3,-2000 # 80007088 <CONSOLE_STATUS+0x78>
    80001860:	01400613          	li	a2,20
    80001864:	00006597          	auipc	a1,0x6
    80001868:	83458593          	addi	a1,a1,-1996 # 80007098 <CONSOLE_STATUS+0x88>
    8000186c:	00006517          	auipc	a0,0x6
    80001870:	83c50513          	addi	a0,a0,-1988 # 800070a8 <CONSOLE_STATUS+0x98>
    80001874:	00000097          	auipc	ra,0x0
    80001878:	034080e7          	jalr	52(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    8000187c:	fb1ff06f          	j	8000182c <main+0x40>
    80001880:	00050493          	mv	s1,a0
    80001884:	fd040513          	addi	a0,s0,-48
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	8e8080e7          	jalr	-1816(ra) # 80001170 <_ZN5TimerD1Ev>
    80001890:	fb840513          	addi	a0,s0,-72
    80001894:	00001097          	auipc	ra,0x1
    80001898:	328080e7          	jalr	808(ra) # 80002bbc <_ZN11HeapManagerD1Ev>
    8000189c:	00048513          	mv	a0,s1
    800018a0:	00008097          	auipc	ra,0x8
    800018a4:	998080e7          	jalr	-1640(ra) # 80009238 <_Unwind_Resume>

00000000800018a8 <_Z13assert_failedPKcS0_jS0_>:
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    800018a8:	fb010113          	addi	sp,sp,-80
    800018ac:	04113423          	sd	ra,72(sp)
    800018b0:	04813023          	sd	s0,64(sp)
    800018b4:	02913c23          	sd	s1,56(sp)
    800018b8:	03213823          	sd	s2,48(sp)
    800018bc:	03313423          	sd	s3,40(sp)
    800018c0:	03413023          	sd	s4,32(sp)
    800018c4:	05010413          	addi	s0,sp,80
    800018c8:	00050993          	mv	s3,a0
    800018cc:	00058493          	mv	s1,a1
    800018d0:	00060913          	mv	s2,a2
    800018d4:	00068a13          	mv	s4,a3
    putc('\n');
    800018d8:	00a00513          	li	a0,10
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	d24080e7          	jalr	-732(ra) # 80001600 <_Z4putcc>
    putc('A');
    800018e4:	04100513          	li	a0,65
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	d18080e7          	jalr	-744(ra) # 80001600 <_Z4putcc>
    putc('s');
    800018f0:	07300513          	li	a0,115
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	d0c080e7          	jalr	-756(ra) # 80001600 <_Z4putcc>
    putc('s');
    800018fc:	07300513          	li	a0,115
    80001900:	00000097          	auipc	ra,0x0
    80001904:	d00080e7          	jalr	-768(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001908:	06500513          	li	a0,101
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	cf4080e7          	jalr	-780(ra) # 80001600 <_Z4putcc>
    putc('r');
    80001914:	07200513          	li	a0,114
    80001918:	00000097          	auipc	ra,0x0
    8000191c:	ce8080e7          	jalr	-792(ra) # 80001600 <_Z4putcc>
    putc('t');
    80001920:	07400513          	li	a0,116
    80001924:	00000097          	auipc	ra,0x0
    80001928:	cdc080e7          	jalr	-804(ra) # 80001600 <_Z4putcc>
    putc('i');
    8000192c:	06900513          	li	a0,105
    80001930:	00000097          	auipc	ra,0x0
    80001934:	cd0080e7          	jalr	-816(ra) # 80001600 <_Z4putcc>
    putc('o');
    80001938:	06f00513          	li	a0,111
    8000193c:	00000097          	auipc	ra,0x0
    80001940:	cc4080e7          	jalr	-828(ra) # 80001600 <_Z4putcc>
    putc('n');
    80001944:	06e00513          	li	a0,110
    80001948:	00000097          	auipc	ra,0x0
    8000194c:	cb8080e7          	jalr	-840(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001950:	02000513          	li	a0,32
    80001954:	00000097          	auipc	ra,0x0
    80001958:	cac080e7          	jalr	-852(ra) # 80001600 <_Z4putcc>
    putc('\'');
    8000195c:	02700513          	li	a0,39
    80001960:	00000097          	auipc	ra,0x0
    80001964:	ca0080e7          	jalr	-864(ra) # 80001600 <_Z4putcc>
    while(*__assertion != 0){
    80001968:	0009c503          	lbu	a0,0(s3)
    8000196c:	00050a63          	beqz	a0,80001980 <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    80001970:	00000097          	auipc	ra,0x0
    80001974:	c90080e7          	jalr	-880(ra) # 80001600 <_Z4putcc>
        __assertion++;
    80001978:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    8000197c:	fedff06f          	j	80001968 <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    80001980:	02700513          	li	a0,39
    80001984:	00000097          	auipc	ra,0x0
    80001988:	c7c080e7          	jalr	-900(ra) # 80001600 <_Z4putcc>
    putc(' ');
    8000198c:	02000513          	li	a0,32
    80001990:	00000097          	auipc	ra,0x0
    80001994:	c70080e7          	jalr	-912(ra) # 80001600 <_Z4putcc>
    putc('f');
    80001998:	06600513          	li	a0,102
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	c64080e7          	jalr	-924(ra) # 80001600 <_Z4putcc>
    putc('a');
    800019a4:	06100513          	li	a0,97
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	c58080e7          	jalr	-936(ra) # 80001600 <_Z4putcc>
    putc('i');
    800019b0:	06900513          	li	a0,105
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	c4c080e7          	jalr	-948(ra) # 80001600 <_Z4putcc>
    putc('l');
    800019bc:	06c00513          	li	a0,108
    800019c0:	00000097          	auipc	ra,0x0
    800019c4:	c40080e7          	jalr	-960(ra) # 80001600 <_Z4putcc>
    putc('e');
    800019c8:	06500513          	li	a0,101
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	c34080e7          	jalr	-972(ra) # 80001600 <_Z4putcc>
    putc('d');
    800019d4:	06400513          	li	a0,100
    800019d8:	00000097          	auipc	ra,0x0
    800019dc:	c28080e7          	jalr	-984(ra) # 80001600 <_Z4putcc>
    putc(' ');
    800019e0:	02000513          	li	a0,32
    800019e4:	00000097          	auipc	ra,0x0
    800019e8:	c1c080e7          	jalr	-996(ra) # 80001600 <_Z4putcc>
    putc('i');
    800019ec:	06900513          	li	a0,105
    800019f0:	00000097          	auipc	ra,0x0
    800019f4:	c10080e7          	jalr	-1008(ra) # 80001600 <_Z4putcc>
    putc('n');
    800019f8:	06e00513          	li	a0,110
    800019fc:	00000097          	auipc	ra,0x0
    80001a00:	c04080e7          	jalr	-1020(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001a04:	02000513          	li	a0,32
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	bf8080e7          	jalr	-1032(ra) # 80001600 <_Z4putcc>
    putc('f');
    80001a10:	06600513          	li	a0,102
    80001a14:	00000097          	auipc	ra,0x0
    80001a18:	bec080e7          	jalr	-1044(ra) # 80001600 <_Z4putcc>
    putc('i');
    80001a1c:	06900513          	li	a0,105
    80001a20:	00000097          	auipc	ra,0x0
    80001a24:	be0080e7          	jalr	-1056(ra) # 80001600 <_Z4putcc>
    putc('l');
    80001a28:	06c00513          	li	a0,108
    80001a2c:	00000097          	auipc	ra,0x0
    80001a30:	bd4080e7          	jalr	-1068(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001a34:	06500513          	li	a0,101
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	bc8080e7          	jalr	-1080(ra) # 80001600 <_Z4putcc>
    putc(':');
    80001a40:	03a00513          	li	a0,58
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	bbc080e7          	jalr	-1092(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001a4c:	02000513          	li	a0,32
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	bb0080e7          	jalr	-1104(ra) # 80001600 <_Z4putcc>
    while(*__file != 0){
    80001a58:	0004c503          	lbu	a0,0(s1)
    80001a5c:	00050a63          	beqz	a0,80001a70 <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    80001a60:	00000097          	auipc	ra,0x0
    80001a64:	ba0080e7          	jalr	-1120(ra) # 80001600 <_Z4putcc>
        __file++;
    80001a68:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80001a6c:	fedff06f          	j	80001a58 <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    80001a70:	00a00513          	li	a0,10
    80001a74:	00000097          	auipc	ra,0x0
    80001a78:	b8c080e7          	jalr	-1140(ra) # 80001600 <_Z4putcc>
    putc('l');
    80001a7c:	06c00513          	li	a0,108
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	b80080e7          	jalr	-1152(ra) # 80001600 <_Z4putcc>
    putc('i');
    80001a88:	06900513          	li	a0,105
    80001a8c:	00000097          	auipc	ra,0x0
    80001a90:	b74080e7          	jalr	-1164(ra) # 80001600 <_Z4putcc>
    putc('n');
    80001a94:	06e00513          	li	a0,110
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	b68080e7          	jalr	-1176(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001aa0:	06500513          	li	a0,101
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	b5c080e7          	jalr	-1188(ra) # 80001600 <_Z4putcc>
    putc(':');
    80001aac:	03a00513          	li	a0,58
    80001ab0:	00000097          	auipc	ra,0x0
    80001ab4:	b50080e7          	jalr	-1200(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001ab8:	02000513          	li	a0,32
    80001abc:	00000097          	auipc	ra,0x0
    80001ac0:	b44080e7          	jalr	-1212(ra) # 80001600 <_Z4putcc>
    char buffer[20];
    int i = 0;
    80001ac4:	00000493          	li	s1,0
    while(__line != 0){
    80001ac8:	02090463          	beqz	s2,80001af0 <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80001acc:	00a00713          	li	a4,10
    80001ad0:	02e977bb          	remuw	a5,s2,a4
    80001ad4:	0307879b          	addiw	a5,a5,48
    80001ad8:	fd040693          	addi	a3,s0,-48
    80001adc:	009686b3          	add	a3,a3,s1
    80001ae0:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    80001ae4:	02e9593b          	divuw	s2,s2,a4
        i++;
    80001ae8:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    80001aec:	fddff06f          	j	80001ac8 <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    80001af0:	02048063          	beqz	s1,80001b10 <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    80001af4:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80001af8:	fd040793          	addi	a5,s0,-48
    80001afc:	009787b3          	add	a5,a5,s1
    80001b00:	fe87c503          	lbu	a0,-24(a5)
    80001b04:	00000097          	auipc	ra,0x0
    80001b08:	afc080e7          	jalr	-1284(ra) # 80001600 <_Z4putcc>
    80001b0c:	fe5ff06f          	j	80001af0 <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80001b10:	00a00513          	li	a0,10
    80001b14:	00000097          	auipc	ra,0x0
    80001b18:	aec080e7          	jalr	-1300(ra) # 80001600 <_Z4putcc>
    putc('f');
    80001b1c:	06600513          	li	a0,102
    80001b20:	00000097          	auipc	ra,0x0
    80001b24:	ae0080e7          	jalr	-1312(ra) # 80001600 <_Z4putcc>
    putc('u');
    80001b28:	07500513          	li	a0,117
    80001b2c:	00000097          	auipc	ra,0x0
    80001b30:	ad4080e7          	jalr	-1324(ra) # 80001600 <_Z4putcc>
    putc('n');
    80001b34:	06e00513          	li	a0,110
    80001b38:	00000097          	auipc	ra,0x0
    80001b3c:	ac8080e7          	jalr	-1336(ra) # 80001600 <_Z4putcc>
    putc('c');
    80001b40:	06300513          	li	a0,99
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	abc080e7          	jalr	-1348(ra) # 80001600 <_Z4putcc>
    putc('t');
    80001b4c:	07400513          	li	a0,116
    80001b50:	00000097          	auipc	ra,0x0
    80001b54:	ab0080e7          	jalr	-1360(ra) # 80001600 <_Z4putcc>
    putc('i');
    80001b58:	06900513          	li	a0,105
    80001b5c:	00000097          	auipc	ra,0x0
    80001b60:	aa4080e7          	jalr	-1372(ra) # 80001600 <_Z4putcc>
    putc('o');
    80001b64:	06f00513          	li	a0,111
    80001b68:	00000097          	auipc	ra,0x0
    80001b6c:	a98080e7          	jalr	-1384(ra) # 80001600 <_Z4putcc>
    putc('n');
    80001b70:	06e00513          	li	a0,110
    80001b74:	00000097          	auipc	ra,0x0
    80001b78:	a8c080e7          	jalr	-1396(ra) # 80001600 <_Z4putcc>
    putc(':');
    80001b7c:	03a00513          	li	a0,58
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	a80080e7          	jalr	-1408(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001b88:	02000513          	li	a0,32
    80001b8c:	00000097          	auipc	ra,0x0
    80001b90:	a74080e7          	jalr	-1420(ra) # 80001600 <_Z4putcc>
    putc('\'');
    80001b94:	02700513          	li	a0,39
    80001b98:	00000097          	auipc	ra,0x0
    80001b9c:	a68080e7          	jalr	-1432(ra) # 80001600 <_Z4putcc>
    while(*__function != 0){
    80001ba0:	000a4503          	lbu	a0,0(s4)
    80001ba4:	00050a63          	beqz	a0,80001bb8 <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    80001ba8:	00000097          	auipc	ra,0x0
    80001bac:	a58080e7          	jalr	-1448(ra) # 80001600 <_Z4putcc>
        __function ++;
    80001bb0:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80001bb4:	fedff06f          	j	80001ba0 <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    80001bb8:	02700513          	li	a0,39
    80001bbc:	00000097          	auipc	ra,0x0
    80001bc0:	a44080e7          	jalr	-1468(ra) # 80001600 <_Z4putcc>
    putc('\n');
    80001bc4:	00a00513          	li	a0,10
    80001bc8:	00000097          	auipc	ra,0x0
    80001bcc:	a38080e7          	jalr	-1480(ra) # 80001600 <_Z4putcc>
    while(1);
    80001bd0:	0000006f          	j	80001bd0 <_Z13assert_failedPKcS0_jS0_+0x328>

0000000080001bd4 <_ZN6KernelC1Ev>:

#include "console.h"

extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80001bd4:	fe010113          	addi	sp,sp,-32
    80001bd8:	00113c23          	sd	ra,24(sp)
    80001bdc:	00813823          	sd	s0,16(sp)
    80001be0:	00913423          	sd	s1,8(sp)
    80001be4:	01213023          	sd	s2,0(sp)
    80001be8:	02010413          	addi	s0,sp,32
    80001bec:	00050493          	mv	s1,a0
    80001bf0:	00001097          	auipc	ra,0x1
    80001bf4:	f64080e7          	jalr	-156(ra) # 80002b54 <_ZN11HeapManagerC1Ev>
    80001bf8:	00848513          	addi	a0,s1,8
    80001bfc:	00002097          	auipc	ra,0x2
    80001c00:	f24080e7          	jalr	-220(ra) # 80003b20 <_ZN9SchedulerC1Ev>
    80001c04:	01848513          	addi	a0,s1,24
    80001c08:	fffff097          	auipc	ra,0xfffff
    80001c0c:	4f8080e7          	jalr	1272(ra) # 80001100 <_ZN5TimerC1Ev>
    80001c10:	0200006f          	j	80001c30 <_ZN6KernelC1Ev+0x5c>
    80001c14:	00050913          	mv	s2,a0
    80001c18:	00048513          	mv	a0,s1
    80001c1c:	00001097          	auipc	ra,0x1
    80001c20:	fa0080e7          	jalr	-96(ra) # 80002bbc <_ZN11HeapManagerD1Ev>
    80001c24:	00090513          	mv	a0,s2
    80001c28:	00007097          	auipc	ra,0x7
    80001c2c:	610080e7          	jalr	1552(ra) # 80009238 <_Unwind_Resume>
    80001c30:	01813083          	ld	ra,24(sp)
    80001c34:	01013403          	ld	s0,16(sp)
    80001c38:	00813483          	ld	s1,8(sp)
    80001c3c:	00013903          	ld	s2,0(sp)
    80001c40:	02010113          	addi	sp,sp,32
    80001c44:	00008067          	ret

0000000080001c48 <_ZN6Kernel10initialiseEv>:
 
void Kernel::initialise(){
    80001c48:	ff010113          	addi	sp,sp,-16
    80001c4c:	00113423          	sd	ra,8(sp)
    80001c50:	00813023          	sd	s0,0(sp)
    80001c54:	01010413          	addi	s0,sp,16
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80001c58:	00006797          	auipc	a5,0x6
    80001c5c:	4687b783          	ld	a5,1128(a5) # 800080c0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c60:	10579073          	csrw	stvec,a5

    
    /// initialise the heap manager
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );
    80001c64:	00006797          	auipc	a5,0x6
    80001c68:	4647b783          	ld	a5,1124(a5) # 800080c8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001c6c:	0007b603          	ld	a2,0(a5)
    80001c70:	00006797          	auipc	a5,0x6
    80001c74:	4307b783          	ld	a5,1072(a5) # 800080a0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001c78:	0007b583          	ld	a1,0(a5)
    80001c7c:	00001097          	auipc	ra,0x1
    80001c80:	f58080e7          	jalr	-168(ra) # 80002bd4 <_ZN11HeapManager4initEmm>

    return;
}
    80001c84:	00813083          	ld	ra,8(sp)
    80001c88:	00013403          	ld	s0,0(sp)
    80001c8c:	01010113          	addi	sp,sp,16
    80001c90:	00008067          	ret

0000000080001c94 <_Z8testFuncPv>:

// sem_t sem = 0;

void testFunc(void* arg){
    80001c94:	ff010113          	addi	sp,sp,-16
    80001c98:	00113423          	sd	ra,8(sp)
    80001c9c:	00813023          	sd	s0,0(sp)
    80001ca0:	01010413          	addi	s0,sp,16
    putc('t');
    80001ca4:	07400513          	li	a0,116
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	958080e7          	jalr	-1704(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001cb0:	06500513          	li	a0,101
    80001cb4:	00000097          	auipc	ra,0x0
    80001cb8:	94c080e7          	jalr	-1716(ra) # 80001600 <_Z4putcc>
    putc('s');
    80001cbc:	07300513          	li	a0,115
    80001cc0:	00000097          	auipc	ra,0x0
    80001cc4:	940080e7          	jalr	-1728(ra) # 80001600 <_Z4putcc>
    putc('t');
    80001cc8:	07400513          	li	a0,116
    80001ccc:	00000097          	auipc	ra,0x0
    80001cd0:	934080e7          	jalr	-1740(ra) # 80001600 <_Z4putcc>

    // sem_wait(sem);
    // thread_dispatch();
    // thread_dispatch();
    thread_dispatch();
    80001cd4:	fffff097          	auipc	ra,0xfffff
    80001cd8:	7d8080e7          	jalr	2008(ra) # 800014ac <_Z15thread_dispatchv>

    // time_sleep(10);
    putc(' ');
    80001cdc:	02000513          	li	a0,32
    80001ce0:	00000097          	auipc	ra,0x0
    80001ce4:	920080e7          	jalr	-1760(ra) # 80001600 <_Z4putcc>

    putc('t');
    80001ce8:	07400513          	li	a0,116
    80001cec:	00000097          	auipc	ra,0x0
    80001cf0:	914080e7          	jalr	-1772(ra) # 80001600 <_Z4putcc>
    putc('h');
    80001cf4:	06800513          	li	a0,104
    80001cf8:	00000097          	auipc	ra,0x0
    80001cfc:	908080e7          	jalr	-1784(ra) # 80001600 <_Z4putcc>
    putc('r');
    80001d00:	07200513          	li	a0,114
    80001d04:	00000097          	auipc	ra,0x0
    80001d08:	8fc080e7          	jalr	-1796(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001d0c:	06500513          	li	a0,101
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	8f0080e7          	jalr	-1808(ra) # 80001600 <_Z4putcc>
    putc('a');
    80001d18:	06100513          	li	a0,97
    80001d1c:	00000097          	auipc	ra,0x0
    80001d20:	8e4080e7          	jalr	-1820(ra) # 80001600 <_Z4putcc>
    putc('d');
    80001d24:	06400513          	li	a0,100
    80001d28:	00000097          	auipc	ra,0x0
    80001d2c:	8d8080e7          	jalr	-1832(ra) # 80001600 <_Z4putcc>
    putc('\n');
    80001d30:	00a00513          	li	a0,10
    80001d34:	00000097          	auipc	ra,0x0
    80001d38:	8cc080e7          	jalr	-1844(ra) # 80001600 <_Z4putcc>
}
    80001d3c:	00813083          	ld	ra,8(sp)
    80001d40:	00013403          	ld	s0,0(sp)
    80001d44:	01010113          	addi	sp,sp,16
    80001d48:	00008067          	ret

0000000080001d4c <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    80001d4c:	fe010113          	addi	sp,sp,-32
    80001d50:	00113c23          	sd	ra,24(sp)
    80001d54:	00813823          	sd	s0,16(sp)
    80001d58:	02010413          	addi	s0,sp,32

    thread_t t, test;
    
    thread_create(&t, 0, 0);
    80001d5c:	00000613          	li	a2,0
    80001d60:	00000593          	li	a1,0
    80001d64:	fe840513          	addi	a0,s0,-24
    80001d68:	fffff097          	auipc	ra,0xfffff
    80001d6c:	6a8080e7          	jalr	1704(ra) # 80001410 <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80001d70:	00002097          	auipc	ra,0x2
    80001d74:	038080e7          	jalr	56(ra) # 80003da8 <_ZN9Scheduler3getEv>
    80001d78:	00006797          	auipc	a5,0x6
    80001d7c:	3587b783          	ld	a5,856(a5) # 800080d0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001d80:	00a7b023          	sd	a0,0(a5)
    
    /// change to user mode
    __asm__ volatile ("li a0, 0xff");
    80001d84:	0ff00513          	li	a0,255
    __asm__ volatile ("ecall");
    80001d88:	00000073          	ecall
    
    putc('u');
    80001d8c:	07500513          	li	a0,117
    80001d90:	00000097          	auipc	ra,0x0
    80001d94:	870080e7          	jalr	-1936(ra) # 80001600 <_Z4putcc>
    putc('s');
    80001d98:	07300513          	li	a0,115
    80001d9c:	00000097          	auipc	ra,0x0
    80001da0:	864080e7          	jalr	-1948(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001da4:	06500513          	li	a0,101
    80001da8:	00000097          	auipc	ra,0x0
    80001dac:	858080e7          	jalr	-1960(ra) # 80001600 <_Z4putcc>
    putc('r');
    80001db0:	07200513          	li	a0,114
    80001db4:	00000097          	auipc	ra,0x0
    80001db8:	84c080e7          	jalr	-1972(ra) # 80001600 <_Z4putcc>
    putc('\n');
    80001dbc:	00a00513          	li	a0,10
    80001dc0:	00000097          	auipc	ra,0x0
    80001dc4:	840080e7          	jalr	-1984(ra) # 80001600 <_Z4putcc>

    
    /// NOW WE ARE IN USER MODE
    
    
    thread_create(&test, usermain, 0);
    80001dc8:	00000613          	li	a2,0
    80001dcc:	00006597          	auipc	a1,0x6
    80001dd0:	2dc5b583          	ld	a1,732(a1) # 800080a8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001dd4:	fe040513          	addi	a0,s0,-32
    80001dd8:	fffff097          	auipc	ra,0xfffff
    80001ddc:	638080e7          	jalr	1592(ra) # 80001410 <_Z13thread_createPP7_threadPFvPvES2_>
    putc('k');
    80001de0:	06b00513          	li	a0,107
    80001de4:	00000097          	auipc	ra,0x0
    80001de8:	81c080e7          	jalr	-2020(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001dec:	06500513          	li	a0,101
    80001df0:	00000097          	auipc	ra,0x0
    80001df4:	810080e7          	jalr	-2032(ra) # 80001600 <_Z4putcc>
    putc('r');
    80001df8:	07200513          	li	a0,114
    80001dfc:	00000097          	auipc	ra,0x0
    80001e00:	804080e7          	jalr	-2044(ra) # 80001600 <_Z4putcc>
    putc('n');
    80001e04:	06e00513          	li	a0,110
    80001e08:	fffff097          	auipc	ra,0xfffff
    80001e0c:	7f8080e7          	jalr	2040(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001e10:	06500513          	li	a0,101
    80001e14:	fffff097          	auipc	ra,0xfffff
    80001e18:	7ec080e7          	jalr	2028(ra) # 80001600 <_Z4putcc>
    putc('l');
    80001e1c:	06c00513          	li	a0,108
    80001e20:	fffff097          	auipc	ra,0xfffff
    80001e24:	7e0080e7          	jalr	2016(ra) # 80001600 <_Z4putcc>
    putc('\n');
    80001e28:	00a00513          	li	a0,10
    80001e2c:	fffff097          	auipc	ra,0xfffff
    80001e30:	7d4080e7          	jalr	2004(ra) # 80001600 <_Z4putcc>
    do{
        thread_dispatch();
    80001e34:	fffff097          	auipc	ra,0xfffff
    80001e38:	678080e7          	jalr	1656(ra) # 800014ac <_Z15thread_dispatchv>
    // }while(!Scheduler::isEmpty());
    }while(!Scheduler::isEmpty() || !Timer::getInstance().noSleepingThreads());
    80001e3c:	00002097          	auipc	ra,0x2
    80001e40:	d54080e7          	jalr	-684(ra) # 80003b90 <_ZN9Scheduler7isEmptyEv>
    80001e44:	fe0508e3          	beqz	a0,80001e34 <_ZN6Kernel3runEv+0xe8>
    80001e48:	fffff097          	auipc	ra,0xfffff
    80001e4c:	350080e7          	jalr	848(ra) # 80001198 <_ZN5Timer11getInstanceEv>
    80001e50:	fffff097          	auipc	ra,0xfffff
    80001e54:	544080e7          	jalr	1348(ra) # 80001394 <_ZN5Timer17noSleepingThreadsEv>
    80001e58:	fc050ee3          	beqz	a0,80001e34 <_ZN6Kernel3runEv+0xe8>
    // }while(true);

    putc('m');
    80001e5c:	06d00513          	li	a0,109
    80001e60:	fffff097          	auipc	ra,0xfffff
    80001e64:	7a0080e7          	jalr	1952(ra) # 80001600 <_Z4putcc>
    putc('a');
    80001e68:	06100513          	li	a0,97
    80001e6c:	fffff097          	auipc	ra,0xfffff
    80001e70:	794080e7          	jalr	1940(ra) # 80001600 <_Z4putcc>
    putc('i');
    80001e74:	06900513          	li	a0,105
    80001e78:	fffff097          	auipc	ra,0xfffff
    80001e7c:	788080e7          	jalr	1928(ra) # 80001600 <_Z4putcc>
    putc('n');
    80001e80:	06e00513          	li	a0,110
    80001e84:	fffff097          	auipc	ra,0xfffff
    80001e88:	77c080e7          	jalr	1916(ra) # 80001600 <_Z4putcc>
    putc('\n');
    80001e8c:	00a00513          	li	a0,10
    80001e90:	fffff097          	auipc	ra,0xfffff
    80001e94:	770080e7          	jalr	1904(ra) # 80001600 <_Z4putcc>
    // while(1){}
    return EXIT_SUCCESS;
}
    80001e98:	00000513          	li	a0,0
    80001e9c:	01813083          	ld	ra,24(sp)
    80001ea0:	01013403          	ld	s0,16(sp)
    80001ea4:	02010113          	addi	sp,sp,32
    80001ea8:	00008067          	ret

0000000080001eac <_ZN15MemoryAllocator9mem_allocEm>:
#include "memoryAllocator.h"

void *MemoryAllocator::mem_alloc( size_t size ){
    80001eac:	ff010113          	addi	sp,sp,-16
    80001eb0:	00813423          	sd	s0,8(sp)
    80001eb4:	01010413          	addi	s0,sp,16
    80001eb8:	00050713          	mv	a4,a0
    static bool headInitialised = false;
    if(!headInitialised){
    80001ebc:	00006797          	auipc	a5,0x6
    80001ec0:	26c7c783          	lbu	a5,620(a5) # 80008128 <_ZZN15MemoryAllocator9mem_allocEmE15headInitialised>
    80001ec4:	04079863          	bnez	a5,80001f14 <_ZN15MemoryAllocator9mem_allocEm+0x68>
        headInitialised = true;
    80001ec8:	00100793          	li	a5,1
    80001ecc:	00006697          	auipc	a3,0x6
    80001ed0:	24f68e23          	sb	a5,604(a3) # 80008128 <_ZZN15MemoryAllocator9mem_allocEmE15headInitialised>
        head = (FreeMemorySegment*)((uint64)HEAP_START_ADDR);
    80001ed4:	00006697          	auipc	a3,0x6
    80001ed8:	1cc6b683          	ld	a3,460(a3) # 800080a0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001edc:	0006b783          	ld	a5,0(a3)
    80001ee0:	00f53023          	sd	a5,0(a0)
        head->prevSegment = nullptr;
    80001ee4:	0007b023          	sd	zero,0(a5)
        head->nextSegment = nullptr;
    80001ee8:	00053783          	ld	a5,0(a0)
    80001eec:	0007b423          	sd	zero,8(a5)
        head->segmentSize = ((size_t)( (uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR ) - sizeof(MemoryAllocator) ) / MEM_BLOCK_SIZE;
    80001ef0:	00006797          	auipc	a5,0x6
    80001ef4:	1d87b783          	ld	a5,472(a5) # 800080c8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001ef8:	0007b783          	ld	a5,0(a5)
    80001efc:	0006b683          	ld	a3,0(a3)
    80001f00:	40d787b3          	sub	a5,a5,a3
    80001f04:	ff878793          	addi	a5,a5,-8
    80001f08:	00053683          	ld	a3,0(a0)
    80001f0c:	0067d793          	srli	a5,a5,0x6
    80001f10:	00f6b823          	sd	a5,16(a3)
    }
    FreeMemorySegment* freeSegment = head;
    80001f14:	00073503          	ld	a0,0(a4)
    while(freeSegment != nullptr && freeSegment->segmentSize < size)freeSegment = freeSegment->nextSegment;
    80001f18:	00050a63          	beqz	a0,80001f2c <_ZN15MemoryAllocator9mem_allocEm+0x80>
    80001f1c:	01053783          	ld	a5,16(a0)
    80001f20:	00b7f663          	bgeu	a5,a1,80001f2c <_ZN15MemoryAllocator9mem_allocEm+0x80>
    80001f24:	00853503          	ld	a0,8(a0)
    80001f28:	ff1ff06f          	j	80001f18 <_ZN15MemoryAllocator9mem_allocEm+0x6c>
    if(freeSegment == nullptr || freeSegment->segmentSize < size)return nullptr;
    80001f2c:	04050a63          	beqz	a0,80001f80 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    80001f30:	01053683          	ld	a3,16(a0)
    80001f34:	08b6ea63          	bltu	a3,a1,80001fc8 <_ZN15MemoryAllocator9mem_allocEm+0x11c>
    if(freeSegment->segmentSize == size){
    80001f38:	04b68a63          	beq	a3,a1,80001f8c <_ZN15MemoryAllocator9mem_allocEm+0xe0>
        if(freeSegment->prevSegment) freeSegment->prevSegment->nextSegment = freeSegment->nextSegment;
        else head = freeSegment->nextSegment;
        if(freeSegment->nextSegment != nullptr) freeSegment->nextSegment->prevSegment = freeSegment->prevSegment;
        return (void*)((uint64)freeSegment + MEM_BLOCK_SIZE);
    }
    FreeMemorySegment* newSegment = (FreeMemorySegment*)((uint64)freeSegment + size * MEM_BLOCK_SIZE + MEM_BLOCK_SIZE);
    80001f3c:	00659793          	slli	a5,a1,0x6
    80001f40:	00050813          	mv	a6,a0
    80001f44:	00a787b3          	add	a5,a5,a0
    80001f48:	04078613          	addi	a2,a5,64
    newSegment->segmentSize = freeSegment->segmentSize - size;
    80001f4c:	40b686b3          	sub	a3,a3,a1
    80001f50:	00d63823          	sd	a3,16(a2)
    newSegment->prevSegment = freeSegment->prevSegment;
    80001f54:	00053683          	ld	a3,0(a0)
    80001f58:	04d7b023          	sd	a3,64(a5)
    newSegment->nextSegment = freeSegment->nextSegment;
    80001f5c:	00853683          	ld	a3,8(a0)
    80001f60:	00d63423          	sd	a3,8(a2)
    
    if(newSegment->nextSegment != nullptr) newSegment->nextSegment->prevSegment = newSegment;
    80001f64:	00068463          	beqz	a3,80001f6c <_ZN15MemoryAllocator9mem_allocEm+0xc0>
    80001f68:	00c6b023          	sd	a2,0(a3)
    if(newSegment->prevSegment != nullptr) newSegment->prevSegment->nextSegment = newSegment;
    80001f6c:	0407b783          	ld	a5,64(a5)
    80001f70:	04078863          	beqz	a5,80001fc0 <_ZN15MemoryAllocator9mem_allocEm+0x114>
    80001f74:	00c7b423          	sd	a2,8(a5)
    else head = newSegment;
    freeSegment->segmentSize = size;
    80001f78:	00b53823          	sd	a1,16(a0)
    return (void*)((uint64)freeSegment + MEM_BLOCK_SIZE);
    80001f7c:	04080513          	addi	a0,a6,64
}
    80001f80:	00813403          	ld	s0,8(sp)
    80001f84:	01010113          	addi	sp,sp,16
    80001f88:	00008067          	ret
        if(freeSegment->prevSegment) freeSegment->prevSegment->nextSegment = freeSegment->nextSegment;
    80001f8c:	00053783          	ld	a5,0(a0)
    80001f90:	02078263          	beqz	a5,80001fb4 <_ZN15MemoryAllocator9mem_allocEm+0x108>
    80001f94:	00853703          	ld	a4,8(a0)
    80001f98:	00e7b423          	sd	a4,8(a5)
        if(freeSegment->nextSegment != nullptr) freeSegment->nextSegment->prevSegment = freeSegment->prevSegment;
    80001f9c:	00853783          	ld	a5,8(a0)
    80001fa0:	00078663          	beqz	a5,80001fac <_ZN15MemoryAllocator9mem_allocEm+0x100>
    80001fa4:	00053703          	ld	a4,0(a0)
    80001fa8:	00e7b023          	sd	a4,0(a5)
        return (void*)((uint64)freeSegment + MEM_BLOCK_SIZE);
    80001fac:	04050513          	addi	a0,a0,64
    80001fb0:	fd1ff06f          	j	80001f80 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
        else head = freeSegment->nextSegment;
    80001fb4:	00853783          	ld	a5,8(a0)
    80001fb8:	00f73023          	sd	a5,0(a4)
    80001fbc:	fe1ff06f          	j	80001f9c <_ZN15MemoryAllocator9mem_allocEm+0xf0>
    else head = newSegment;
    80001fc0:	00c73023          	sd	a2,0(a4)
    80001fc4:	fb5ff06f          	j	80001f78 <_ZN15MemoryAllocator9mem_allocEm+0xcc>
    if(freeSegment == nullptr || freeSegment->segmentSize < size)return nullptr;
    80001fc8:	00000513          	li	a0,0
    80001fcc:	fb5ff06f          	j	80001f80 <_ZN15MemoryAllocator9mem_allocEm+0xd4>

0000000080001fd0 <_ZN15MemoryAllocator11getInstanceEv>:

MemoryAllocator& MemoryAllocator::getInstance() {
    80001fd0:	ff010113          	addi	sp,sp,-16
    80001fd4:	00813423          	sd	s0,8(sp)
    80001fd8:	01010413          	addi	s0,sp,16
    static MemoryAllocator instance;
    80001fdc:	00006797          	auipc	a5,0x6
    80001fe0:	1547c783          	lbu	a5,340(a5) # 80008130 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    80001fe4:	00079c63          	bnez	a5,80001ffc <_ZN15MemoryAllocator11getInstanceEv+0x2c>
};
class MemoryAllocator {
public:
    static MemoryAllocator& getInstance();
private:
    MemoryAllocator(){};
    80001fe8:	00006797          	auipc	a5,0x6
    80001fec:	14078793          	addi	a5,a5,320 # 80008128 <_ZZN15MemoryAllocator9mem_allocEmE15headInitialised>
    80001ff0:	0007b823          	sd	zero,16(a5)
    80001ff4:	00100713          	li	a4,1
    80001ff8:	00e78423          	sb	a4,8(a5)
    return instance;
}
    80001ffc:	00006517          	auipc	a0,0x6
    80002000:	13c50513          	addi	a0,a0,316 # 80008138 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002004:	00813403          	ld	s0,8(sp)
    80002008:	01010113          	addi	sp,sp,16
    8000200c:	00008067          	ret

0000000080002010 <_ZN15MemoryAllocator12attemptMergeEP17FreeMemorySegment>:

void MemoryAllocator::attemptMerge( FreeMemorySegment *segment ) {
    80002010:	ff010113          	addi	sp,sp,-16
    80002014:	00813423          	sd	s0,8(sp)
    80002018:	01010413          	addi	s0,sp,16
    if((uint64)segment->nextSegment != (uint64)segment + (segment->segmentSize + 1)*MEM_BLOCK_SIZE)
    8000201c:	0085b683          	ld	a3,8(a1)
    80002020:	0105b703          	ld	a4,16(a1)
    80002024:	00170793          	addi	a5,a4,1
    80002028:	00679793          	slli	a5,a5,0x6
    8000202c:	00f587b3          	add	a5,a1,a5
    80002030:	02f69063          	bne	a3,a5,80002050 <_ZN15MemoryAllocator12attemptMergeEP17FreeMemorySegment+0x40>
        return;
    segment->segmentSize += segment->nextSegment->segmentSize;
    80002034:	0106b783          	ld	a5,16(a3)
    80002038:	00f70733          	add	a4,a4,a5
    8000203c:	00e5b823          	sd	a4,16(a1)
    segment->nextSegment = segment->nextSegment->nextSegment;
    80002040:	0086b783          	ld	a5,8(a3)
    80002044:	00f5b423          	sd	a5,8(a1)
    if(segment->nextSegment) segment->nextSegment->prevSegment = segment;
    80002048:	00078463          	beqz	a5,80002050 <_ZN15MemoryAllocator12attemptMergeEP17FreeMemorySegment+0x40>
    8000204c:	00b7b023          	sd	a1,0(a5)
}
    80002050:	00813403          	ld	s0,8(sp)
    80002054:	01010113          	addi	sp,sp,16
    80002058:	00008067          	ret

000000008000205c <_ZN15MemoryAllocator16numberOfSegmentsEv>:

int MemoryAllocator::numberOfSegments(){
    8000205c:	ff010113          	addi	sp,sp,-16
    80002060:	00813423          	sd	s0,8(sp)
    80002064:	01010413          	addi	s0,sp,16
    int count = 0;
    FreeMemorySegment *segment = head;
    80002068:	00053783          	ld	a5,0(a0)
    int count = 0;
    8000206c:	00000513          	li	a0,0
    while(segment){
    80002070:	00078863          	beqz	a5,80002080 <_ZN15MemoryAllocator16numberOfSegmentsEv+0x24>
        count ++;
    80002074:	0015051b          	addiw	a0,a0,1
        segment = segment->nextSegment;
    80002078:	0087b783          	ld	a5,8(a5)
    while(segment){
    8000207c:	ff5ff06f          	j	80002070 <_ZN15MemoryAllocator16numberOfSegmentsEv+0x14>
    }
    return count;
}
    80002080:	00813403          	ld	s0,8(sp)
    80002084:	01010113          	addi	sp,sp,16
    80002088:	00008067          	ret

000000008000208c <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free( void *address ) {
    if((uint64)address >= (uint64)HEAP_END_ADDR || (uint64)address < (uint64)HEAP_START_ADDR)
    8000208c:	00006797          	auipc	a5,0x6
    80002090:	03c7b783          	ld	a5,60(a5) # 800080c8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002094:	0007b783          	ld	a5,0(a5)
    80002098:	0cf5fa63          	bgeu	a1,a5,8000216c <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
int MemoryAllocator::mem_free( void *address ) {
    8000209c:	fe010113          	addi	sp,sp,-32
    800020a0:	00113c23          	sd	ra,24(sp)
    800020a4:	00813823          	sd	s0,16(sp)
    800020a8:	00913423          	sd	s1,8(sp)
    800020ac:	01213023          	sd	s2,0(sp)
    800020b0:	02010413          	addi	s0,sp,32
    800020b4:	00050493          	mv	s1,a0
    800020b8:	00058713          	mv	a4,a1
    if((uint64)address >= (uint64)HEAP_END_ADDR || (uint64)address < (uint64)HEAP_START_ADDR)
    800020bc:	00006797          	auipc	a5,0x6
    800020c0:	fe47b783          	ld	a5,-28(a5) # 800080a0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800020c4:	0007b783          	ld	a5,0(a5)
    800020c8:	0af5e663          	bltu	a1,a5,80002174 <_ZN15MemoryAllocator8mem_freeEPv+0xe8>
        return -1;
    FreeMemorySegment* previousSegment = nullptr;
    if(head && head->nextSegment < address){
    800020cc:	00053783          	ld	a5,0(a0)
    800020d0:	02078063          	beqz	a5,800020f0 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
    800020d4:	0087b683          	ld	a3,8(a5)
    800020d8:	02b6f063          	bgeu	a3,a1,800020f8 <_ZN15MemoryAllocator8mem_freeEPv+0x6c>
        previousSegment = head;
        while(previousSegment->nextSegment != nullptr && previousSegment->nextSegment < address)
    800020dc:	00078593          	mv	a1,a5
    800020e0:	0087b783          	ld	a5,8(a5)
    800020e4:	00078c63          	beqz	a5,800020fc <_ZN15MemoryAllocator8mem_freeEPv+0x70>
    800020e8:	fee7eae3          	bltu	a5,a4,800020dc <_ZN15MemoryAllocator8mem_freeEPv+0x50>
    800020ec:	0100006f          	j	800020fc <_ZN15MemoryAllocator8mem_freeEPv+0x70>
    FreeMemorySegment* previousSegment = nullptr;
    800020f0:	00078593          	mv	a1,a5
    800020f4:	0080006f          	j	800020fc <_ZN15MemoryAllocator8mem_freeEPv+0x70>
    800020f8:	00000593          	li	a1,0
            previousSegment = previousSegment->nextSegment;
    }

    FreeMemorySegment* newSegment = (FreeMemorySegment*)((uint64)address - MEM_BLOCK_SIZE);
    800020fc:	fc070913          	addi	s2,a4,-64
    newSegment->prevSegment = previousSegment;
    80002100:	fcb73023          	sd	a1,-64(a4)
    if(previousSegment){
    80002104:	04058c63          	beqz	a1,8000215c <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
        if(previousSegment->nextSegment)
    80002108:	0085b783          	ld	a5,8(a1)
    8000210c:	00078463          	beqz	a5,80002114 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
            previousSegment->nextSegment->prevSegment = newSegment;
    80002110:	0127b023          	sd	s2,0(a5)
        newSegment->nextSegment = previousSegment->nextSegment;
    80002114:	0085b783          	ld	a5,8(a1)
    80002118:	00f93423          	sd	a5,8(s2)
        previousSegment->nextSegment = newSegment;
    8000211c:	0125b423          	sd	s2,8(a1)
    }else{
        newSegment->nextSegment = head;
        head = newSegment;
    }
    if(previousSegment)attemptMerge(previousSegment);
    80002120:	00058863          	beqz	a1,80002130 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    80002124:	00048513          	mv	a0,s1
    80002128:	00000097          	auipc	ra,0x0
    8000212c:	ee8080e7          	jalr	-280(ra) # 80002010 <_ZN15MemoryAllocator12attemptMergeEP17FreeMemorySegment>
    attemptMerge(newSegment);
    80002130:	00090593          	mv	a1,s2
    80002134:	00048513          	mv	a0,s1
    80002138:	00000097          	auipc	ra,0x0
    8000213c:	ed8080e7          	jalr	-296(ra) # 80002010 <_ZN15MemoryAllocator12attemptMergeEP17FreeMemorySegment>
    return 0;
    80002140:	00000513          	li	a0,0
    80002144:	01813083          	ld	ra,24(sp)
    80002148:	01013403          	ld	s0,16(sp)
    8000214c:	00813483          	ld	s1,8(sp)
    80002150:	00013903          	ld	s2,0(sp)
    80002154:	02010113          	addi	sp,sp,32
    80002158:	00008067          	ret
        newSegment->nextSegment = head;
    8000215c:	0004b783          	ld	a5,0(s1)
    80002160:	00f93423          	sd	a5,8(s2)
        head = newSegment;
    80002164:	0124b023          	sd	s2,0(s1)
    80002168:	fb9ff06f          	j	80002120 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
        return -1;
    8000216c:	fff00513          	li	a0,-1
    80002170:	00008067          	ret
        return -1;
    80002174:	fff00513          	li	a0,-1
    80002178:	fcdff06f          	j	80002144 <_ZN15MemoryAllocator8mem_freeEPv+0xb8>

000000008000217c <_Z13thread_test_1Pv>:
#include "assert.h"

sem_t sem1;
sem_t sem2;

void thread_test_1(void* args){
    8000217c:	ff010113          	addi	sp,sp,-16
    80002180:	00113423          	sd	ra,8(sp)
    80002184:	00813023          	sd	s0,0(sp)
    80002188:	01010413          	addi	s0,sp,16
    putc('1');
    8000218c:	03100513          	li	a0,49
    80002190:	fffff097          	auipc	ra,0xfffff
    80002194:	470080e7          	jalr	1136(ra) # 80001600 <_Z4putcc>
    putc('s');
    80002198:	07300513          	li	a0,115
    8000219c:	fffff097          	auipc	ra,0xfffff
    800021a0:	464080e7          	jalr	1124(ra) # 80001600 <_Z4putcc>
    time_sleep(30);
    800021a4:	01e00513          	li	a0,30
    800021a8:	fffff097          	auipc	ra,0xfffff
    800021ac:	348080e7          	jalr	840(ra) # 800014f0 <_Z10time_sleepm>
    putc('1');
    800021b0:	03100513          	li	a0,49
    800021b4:	fffff097          	auipc	ra,0xfffff
    800021b8:	44c080e7          	jalr	1100(ra) # 80001600 <_Z4putcc>
    sem_signal(sem1);
    800021bc:	00006517          	auipc	a0,0x6
    800021c0:	f8453503          	ld	a0,-124(a0) # 80008140 <sem1>
    800021c4:	fffff097          	auipc	ra,0xfffff
    800021c8:	3e8080e7          	jalr	1000(ra) # 800015ac <_Z10sem_signalP4_sem>
    putc('S');
    800021cc:	05300513          	li	a0,83
    800021d0:	fffff097          	auipc	ra,0xfffff
    800021d4:	430080e7          	jalr	1072(ra) # 80001600 <_Z4putcc>
}
    800021d8:	00813083          	ld	ra,8(sp)
    800021dc:	00013403          	ld	s0,0(sp)
    800021e0:	01010113          	addi	sp,sp,16
    800021e4:	00008067          	ret

00000000800021e8 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    800021e8:	ff010113          	addi	sp,sp,-16
    800021ec:	00113423          	sd	ra,8(sp)
    800021f0:	00813023          	sd	s0,0(sp)
    800021f4:	01010413          	addi	s0,sp,16
    putc('2');
    800021f8:	03200513          	li	a0,50
    800021fc:	fffff097          	auipc	ra,0xfffff
    80002200:	404080e7          	jalr	1028(ra) # 80001600 <_Z4putcc>
    putc('s');
    80002204:	07300513          	li	a0,115
    80002208:	fffff097          	auipc	ra,0xfffff
    8000220c:	3f8080e7          	jalr	1016(ra) # 80001600 <_Z4putcc>
    time_sleep(60);
    80002210:	03c00513          	li	a0,60
    80002214:	fffff097          	auipc	ra,0xfffff
    80002218:	2dc080e7          	jalr	732(ra) # 800014f0 <_Z10time_sleepm>
    putc('2');
    8000221c:	03200513          	li	a0,50
    80002220:	fffff097          	auipc	ra,0xfffff
    80002224:	3e0080e7          	jalr	992(ra) # 80001600 <_Z4putcc>
    putc('S');
    80002228:	05300513          	li	a0,83
    8000222c:	fffff097          	auipc	ra,0xfffff
    80002230:	3d4080e7          	jalr	980(ra) # 80001600 <_Z4putcc>
    sem_signal(sem2);
    80002234:	00006517          	auipc	a0,0x6
    80002238:	f1453503          	ld	a0,-236(a0) # 80008148 <sem2>
    8000223c:	fffff097          	auipc	ra,0xfffff
    80002240:	370080e7          	jalr	880(ra) # 800015ac <_Z10sem_signalP4_sem>
    while(1);
    80002244:	0000006f          	j	80002244 <_Z13thread_test_2Pv+0x5c>

0000000080002248 <_Z8usermainPv>:
}

void usermain(void* arg){
    80002248:	fd010113          	addi	sp,sp,-48
    8000224c:	02113423          	sd	ra,40(sp)
    80002250:	02813023          	sd	s0,32(sp)
    80002254:	00913c23          	sd	s1,24(sp)
    80002258:	03010413          	addi	s0,sp,48
    putc('0');
    8000225c:	03000513          	li	a0,48
    80002260:	fffff097          	auipc	ra,0xfffff
    80002264:	3a0080e7          	jalr	928(ra) # 80001600 <_Z4putcc>
    thread_t t1, t2;
    sem_open(&sem1, 0);
    80002268:	00006497          	auipc	s1,0x6
    8000226c:	ed848493          	addi	s1,s1,-296 # 80008140 <sem1>
    80002270:	00000593          	li	a1,0
    80002274:	00048513          	mv	a0,s1
    80002278:	fffff097          	auipc	ra,0xfffff
    8000227c:	2a4080e7          	jalr	676(ra) # 8000151c <_Z8sem_openPP4_semj>
    sem_open(&sem2, 0);
    80002280:	00000593          	li	a1,0
    80002284:	00006517          	auipc	a0,0x6
    80002288:	ec450513          	addi	a0,a0,-316 # 80008148 <sem2>
    8000228c:	fffff097          	auipc	ra,0xfffff
    80002290:	290080e7          	jalr	656(ra) # 8000151c <_Z8sem_openPP4_semj>
    thread_create(&t1, thread_test_1, 0);
    80002294:	00000613          	li	a2,0
    80002298:	00000597          	auipc	a1,0x0
    8000229c:	ee458593          	addi	a1,a1,-284 # 8000217c <_Z13thread_test_1Pv>
    800022a0:	fd840513          	addi	a0,s0,-40
    800022a4:	fffff097          	auipc	ra,0xfffff
    800022a8:	16c080e7          	jalr	364(ra) # 80001410 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    800022ac:	00000613          	li	a2,0
    800022b0:	00000597          	auipc	a1,0x0
    800022b4:	f3858593          	addi	a1,a1,-200 # 800021e8 <_Z13thread_test_2Pv>
    800022b8:	fd040513          	addi	a0,s0,-48
    800022bc:	fffff097          	auipc	ra,0xfffff
    800022c0:	154080e7          	jalr	340(ra) # 80001410 <_Z13thread_createPP7_threadPFvPvES2_>
    sem_wait(sem1);
    800022c4:	0004b503          	ld	a0,0(s1)
    800022c8:	fffff097          	auipc	ra,0xfffff
    800022cc:	2b8080e7          	jalr	696(ra) # 80001580 <_Z8sem_waitP4_sem>
    putc('3');
    800022d0:	03300513          	li	a0,51
    800022d4:	fffff097          	auipc	ra,0xfffff
    800022d8:	32c080e7          	jalr	812(ra) # 80001600 <_Z4putcc>
    // thread_join(t2);
    // if(getc() == 'a')putc('x');
    putc('4');
    800022dc:	03400513          	li	a0,52
    800022e0:	fffff097          	auipc	ra,0xfffff
    800022e4:	320080e7          	jalr	800(ra) # 80001600 <_Z4putcc>
    thread_join(t1);
    800022e8:	fd843503          	ld	a0,-40(s0)
    800022ec:	fffff097          	auipc	ra,0xfffff
    800022f0:	1e0080e7          	jalr	480(ra) # 800014cc <_Z11thread_joinP7_thread>
    // thread_dispatch();
    // thread_dispatch();
    sem_wait(sem2);
    800022f4:	0084b503          	ld	a0,8(s1)
    800022f8:	fffff097          	auipc	ra,0xfffff
    800022fc:	288080e7          	jalr	648(ra) # 80001580 <_Z8sem_waitP4_sem>
    putc('5');
    80002300:	03500513          	li	a0,53
    80002304:	fffff097          	auipc	ra,0xfffff
    80002308:	2fc080e7          	jalr	764(ra) # 80001600 <_Z4putcc>
    sem_close(sem1);
    8000230c:	0004b503          	ld	a0,0(s1)
    80002310:	fffff097          	auipc	ra,0xfffff
    80002314:	244080e7          	jalr	580(ra) # 80001554 <_Z9sem_closeP4_sem>
    sem_close(sem2);
    80002318:	0084b503          	ld	a0,8(s1)
    8000231c:	fffff097          	auipc	ra,0xfffff
    80002320:	238080e7          	jalr	568(ra) # 80001554 <_Z9sem_closeP4_sem>
    80002324:	02813083          	ld	ra,40(sp)
    80002328:	02013403          	ld	s0,32(sp)
    8000232c:	01813483          	ld	s1,24(sp)
    80002330:	03010113          	addi	sp,sp,48
    80002334:	00008067          	ret

0000000080002338 <_ZN7_threadC1EPFvPvES0_>:
#include "syscalls_c.h"
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    80002338:	ff010113          	addi	sp,sp,-16
    8000233c:	00813423          	sd	s0,8(sp)
    80002340:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80002344:	00053023          	sd	zero,0(a0)
    80002348:	00053423          	sd	zero,8(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    8000234c:	00006717          	auipc	a4,0x6
    80002350:	e0470713          	addi	a4,a4,-508 # 80008150 <_ZN7_thread6nextIDE>
    80002354:	00072783          	lw	a5,0(a4)
    80002358:	0017869b          	addiw	a3,a5,1
    8000235c:	00d72023          	sw	a3,0(a4)
    80002360:	08f52c23          	sw	a5,152(a0)
    closed = 0;
    80002364:	09c52783          	lw	a5,156(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002368:	0015b593          	seqz	a1,a1
    8000236c:	0045959b          	slliw	a1,a1,0x4
    80002370:	fe07f793          	andi	a5,a5,-32
    80002374:	00b7e7b3          	or	a5,a5,a1
    80002378:	08f52e23          	sw	a5,156(a0)
    reserved = 0;
    8000237c:	0a052783          	lw	a5,160(a0)
    80002380:	f0000737          	lui	a4,0xf0000
    80002384:	00e7f7b3          	and	a5,a5,a4
    80002388:	0af52023          	sw	a5,160(a0)
    joinHead = 0;
    8000238c:	06053c23          	sd	zero,120(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    80002390:	00200793          	li	a5,2
    80002394:	08f53423          	sd	a5,136(a0)
    stackStart = 0;
    80002398:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    8000239c:	00053823          	sd	zero,16(a0)
    context.s1 = 0;
    800023a0:	00053c23          	sd	zero,24(a0)
    context.s2 = 0;
    800023a4:	02053023          	sd	zero,32(a0)
    context.s3 = 0;
    800023a8:	02053423          	sd	zero,40(a0)
    context.s4 = 0;
    800023ac:	02053823          	sd	zero,48(a0)
    context.s5 = 0;
    800023b0:	02053c23          	sd	zero,56(a0)
    context.s6 = 0;
    800023b4:	04053023          	sd	zero,64(a0)
    context.s7 = 0;
    800023b8:	04053423          	sd	zero,72(a0)
    context.s8 = 0;
    800023bc:	04053823          	sd	zero,80(a0)
    context.s9 = 0;
    800023c0:	04053c23          	sd	zero,88(a0)
    context.s10 = 0;
    800023c4:	06053023          	sd	zero,96(a0)
    context.s11 = 0;
    800023c8:	06053423          	sd	zero,104(a0)

    context.sstatus = 0;
    800023cc:	06053823          	sd	zero,112(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    800023d0:	00000797          	auipc	a5,0x0
    800023d4:	54c78793          	addi	a5,a5,1356 # 8000291c <_ZN7_thread7wrapperEv>
    800023d8:	00f53023          	sd	a5,0(a0)
}
    800023dc:	00813403          	ld	s0,8(sp)
    800023e0:	01010113          	addi	sp,sp,16
    800023e4:	00008067          	ret

00000000800023e8 <_Z10popSppSpieb>:

void popSppSpie(bool kernel = false){
    800023e8:	ff010113          	addi	sp,sp,-16
    800023ec:	00813423          	sd	s0,8(sp)
    800023f0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    800023f4:	14109073          	csrw	sepc,ra
    if(kernel){
    800023f8:	00050e63          	beqz	a0,80002414 <_Z10popSppSpieb+0x2c>
        __asm__ volatile ("csrs sstatus, %0" :: "r" (1 << 8));
    800023fc:	10000793          	li	a5,256
    80002400:	1007a073          	csrs	sstatus,a5
    }else{
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    }
    __asm__ volatile ("sret");
    80002404:	10200073          	sret
}
    80002408:	00813403          	ld	s0,8(sp)
    8000240c:	01010113          	addi	sp,sp,16
    80002410:	00008067          	ret
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002414:	10000793          	li	a5,256
    80002418:	1007b073          	csrc	sstatus,a5
    8000241c:	fe9ff06f          	j	80002404 <_Z10popSppSpieb+0x1c>

0000000080002420 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002420:	fe010113          	addi	sp,sp,-32
    80002424:	00113c23          	sd	ra,24(sp)
    80002428:	00813823          	sd	s0,16(sp)
    8000242c:	00913423          	sd	s1,8(sp)
    80002430:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80002434:	07853483          	ld	s1,120(a0)
    while(current != 0){
    80002438:	0c048663          	beqz	s1,80002504 <_ZN7_thread6unJoinEv+0xe4>
        thread_t thread = current->thread;
    8000243c:	0004c503          	lbu	a0,0(s1)
    80002440:	0014c783          	lbu	a5,1(s1)
    80002444:	00879793          	slli	a5,a5,0x8
    80002448:	00a7e7b3          	or	a5,a5,a0
    8000244c:	0024c503          	lbu	a0,2(s1)
    80002450:	01051513          	slli	a0,a0,0x10
    80002454:	00f567b3          	or	a5,a0,a5
    80002458:	0034c503          	lbu	a0,3(s1)
    8000245c:	01851513          	slli	a0,a0,0x18
    80002460:	00f56533          	or	a0,a0,a5
    80002464:	0044c783          	lbu	a5,4(s1)
    80002468:	02079793          	slli	a5,a5,0x20
    8000246c:	00a7e533          	or	a0,a5,a0
    80002470:	0054c783          	lbu	a5,5(s1)
    80002474:	02879793          	slli	a5,a5,0x28
    80002478:	00a7e7b3          	or	a5,a5,a0
    8000247c:	0064c503          	lbu	a0,6(s1)
    80002480:	03051513          	slli	a0,a0,0x30
    80002484:	00f567b3          	or	a5,a0,a5
    80002488:	0074c503          	lbu	a0,7(s1)
    8000248c:	03851513          	slli	a0,a0,0x38
    80002490:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80002494:	09c52783          	lw	a5,156(a0)
    80002498:	ffd7f793          	andi	a5,a5,-3
    8000249c:	08f52e23          	sw	a5,156(a0)
        Scheduler::put(thread);
    800024a0:	00001097          	auipc	ra,0x1
    800024a4:	718080e7          	jalr	1816(ra) # 80003bb8 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    800024a8:	0084c703          	lbu	a4,8(s1)
    800024ac:	0094c783          	lbu	a5,9(s1)
    800024b0:	00879793          	slli	a5,a5,0x8
    800024b4:	00e7e733          	or	a4,a5,a4
    800024b8:	00a4c783          	lbu	a5,10(s1)
    800024bc:	01079793          	slli	a5,a5,0x10
    800024c0:	00e7e7b3          	or	a5,a5,a4
    800024c4:	00b4c703          	lbu	a4,11(s1)
    800024c8:	01871713          	slli	a4,a4,0x18
    800024cc:	00f767b3          	or	a5,a4,a5
    800024d0:	00c4c703          	lbu	a4,12(s1)
    800024d4:	02071713          	slli	a4,a4,0x20
    800024d8:	00f76733          	or	a4,a4,a5
    800024dc:	00d4c783          	lbu	a5,13(s1)
    800024e0:	02879793          	slli	a5,a5,0x28
    800024e4:	00e7e733          	or	a4,a5,a4
    800024e8:	00e4c783          	lbu	a5,14(s1)
    800024ec:	03079793          	slli	a5,a5,0x30
    800024f0:	00e7e7b3          	or	a5,a5,a4
    800024f4:	00f4c483          	lbu	s1,15(s1)
    800024f8:	03849493          	slli	s1,s1,0x38
    800024fc:	00f4e4b3          	or	s1,s1,a5
    while(current != 0){
    80002500:	f39ff06f          	j	80002438 <_ZN7_thread6unJoinEv+0x18>
        // mem_free(current);
        current = next;
    }
}
    80002504:	01813083          	ld	ra,24(sp)
    80002508:	01013403          	ld	s0,16(sp)
    8000250c:	00813483          	ld	s1,8(sp)
    80002510:	02010113          	addi	sp,sp,32
    80002514:	00008067          	ret

0000000080002518 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80002518:	fc010113          	addi	sp,sp,-64
    8000251c:	02113c23          	sd	ra,56(sp)
    80002520:	02813823          	sd	s0,48(sp)
    80002524:	02913423          	sd	s1,40(sp)
    80002528:	03213023          	sd	s2,32(sp)
    8000252c:	01313c23          	sd	s3,24(sp)
    80002530:	01413823          	sd	s4,16(sp)
    80002534:	01513423          	sd	s5,8(sp)
    80002538:	04010413          	addi	s0,sp,64
    8000253c:	00050493          	mv	s1,a0
    80002540:	00058913          	mv	s2,a1
    80002544:	00060a93          	mv	s5,a2
    80002548:	00068993          	mv	s3,a3
    8000254c:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    80002550:	0b800513          	li	a0,184
    80002554:	fffff097          	auipc	ra,0xfffff
    80002558:	e60080e7          	jalr	-416(ra) # 800013b4 <_Z9mem_allocm>
    8000255c:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80002560:	18050063          	beqz	a0,800026e0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    80002564:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    80002568:	0004b783          	ld	a5,0(s1)
    8000256c:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80002570:	00006717          	auipc	a4,0x6
    80002574:	be070713          	addi	a4,a4,-1056 # 80008150 <_ZN7_thread6nextIDE>
    80002578:	00072783          	lw	a5,0(a4)
    8000257c:	0017869b          	addiw	a3,a5,1
    80002580:	00d72023          	sw	a3,0(a4)
    80002584:	0004b703          	ld	a4,0(s1)
    80002588:	08f72c23          	sw	a5,152(a4)
    (*thread)->closed = false;
    8000258c:	0004b703          	ld	a4,0(s1)
    80002590:	09c72783          	lw	a5,156(a4)
    80002594:	ffe7f793          	andi	a5,a5,-2
    80002598:	08f72e23          	sw	a5,156(a4)
    (*thread)->blocked = false;
    8000259c:	0004b703          	ld	a4,0(s1)
    800025a0:	09c72783          	lw	a5,156(a4)
    800025a4:	ffd7f793          	andi	a5,a5,-3
    800025a8:	08f72e23          	sw	a5,156(a4)
    (*thread)->sleeping = false;
    800025ac:	0004b703          	ld	a4,0(s1)
    800025b0:	09c72783          	lw	a5,156(a4)
    800025b4:	ffb7f793          	andi	a5,a5,-5
    800025b8:	08f72e23          	sw	a5,156(a4)
    (*thread)->finished = false;
    800025bc:	0004b703          	ld	a4,0(s1)
    800025c0:	09c72783          	lw	a5,156(a4)
    800025c4:	ff77f793          	andi	a5,a5,-9
    800025c8:	08f72e23          	sw	a5,156(a4)
    (*thread)->kernel = (function == 0);
    800025cc:	0004b703          	ld	a4,0(s1)
    800025d0:	00193913          	seqz	s2,s2
    800025d4:	0049191b          	slliw	s2,s2,0x4
    800025d8:	09c72783          	lw	a5,156(a4)
    800025dc:	fef7f793          	andi	a5,a5,-17
    800025e0:	0127e933          	or	s2,a5,s2
    800025e4:	09272e23          	sw	s2,156(a4)
    (*thread)->reserved = 0;
    800025e8:	0004b703          	ld	a4,0(s1)
    800025ec:	0a072783          	lw	a5,160(a4)
    800025f0:	f00006b7          	lui	a3,0xf0000
    800025f4:	00d7f7b3          	and	a5,a5,a3
    800025f8:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = 0;
    800025fc:	0004b783          	ld	a5,0(s1)
    80002600:	0607bc23          	sd	zero,120(a5)
    (*thread)->joinTail = 0;
    80002604:	0004b783          	ld	a5,0(s1)
    80002608:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    8000260c:	0004b783          	ld	a5,0(s1)
    80002610:	00200713          	li	a4,2
    80002614:	08e7b423          	sd	a4,136(a5)
    (*thread)->stackStart = 0;
    80002618:	0004b783          	ld	a5,0(s1)
    8000261c:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    80002620:	0004b783          	ld	a5,0(s1)
    80002624:	0007b823          	sd	zero,16(a5)
    (*thread)->context.s1 = 0;
    80002628:	0004b783          	ld	a5,0(s1)
    8000262c:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s2 = 0;
    80002630:	0004b783          	ld	a5,0(s1)
    80002634:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s3 = 0;
    80002638:	0004b783          	ld	a5,0(s1)
    8000263c:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s4 = 0;
    80002640:	0004b783          	ld	a5,0(s1)
    80002644:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s5 = 0;
    80002648:	0004b783          	ld	a5,0(s1)
    8000264c:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s6 = 0;
    80002650:	0004b783          	ld	a5,0(s1)
    80002654:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s7 = 0;
    80002658:	0004b783          	ld	a5,0(s1)
    8000265c:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s8 = 0;
    80002660:	0004b783          	ld	a5,0(s1)
    80002664:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s9 = 0;
    80002668:	0004b783          	ld	a5,0(s1)
    8000266c:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s10 = 0;
    80002670:	0004b783          	ld	a5,0(s1)
    80002674:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s11 = 0;
    80002678:	0004b783          	ld	a5,0(s1)
    8000267c:	0607b423          	sd	zero,104(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80002680:	0004b783          	ld	a5,0(s1)
    80002684:	0137b423          	sd	s3,8(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80002688:	0004b783          	ld	a5,0(s1)
    8000268c:	00000717          	auipc	a4,0x0
    80002690:	29070713          	addi	a4,a4,656 # 8000291c <_ZN7_thread7wrapperEv>
    80002694:	00e7b023          	sd	a4,0(a5)

    (*thread)->stackStart = stack;
    80002698:	0004b783          	ld	a5,0(s1)
    8000269c:	0937b823          	sd	s3,144(a5)
    if(start){
    800026a0:	020a1663          	bnez	s4,800026cc <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    800026a4:	00000513          	li	a0,0
}
    800026a8:	03813083          	ld	ra,56(sp)
    800026ac:	03013403          	ld	s0,48(sp)
    800026b0:	02813483          	ld	s1,40(sp)
    800026b4:	02013903          	ld	s2,32(sp)
    800026b8:	01813983          	ld	s3,24(sp)
    800026bc:	01013a03          	ld	s4,16(sp)
    800026c0:	00813a83          	ld	s5,8(sp)
    800026c4:	04010113          	addi	sp,sp,64
    800026c8:	00008067          	ret
        Scheduler::put(*thread);
    800026cc:	0004b503          	ld	a0,0(s1)
    800026d0:	00001097          	auipc	ra,0x1
    800026d4:	4e8080e7          	jalr	1256(ra) # 80003bb8 <_ZN9Scheduler3putEP7_thread>
    return 0;
    800026d8:	00000513          	li	a0,0
    800026dc:	fcdff06f          	j	800026a8 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    800026e0:	fff00513          	li	a0,-1
    800026e4:	fc5ff06f          	j	800026a8 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

00000000800026e8 <_ZN7_thread4joinEPS_>:

void _thread::join(thread_t thread){
    800026e8:	fe010113          	addi	sp,sp,-32
    800026ec:	00113c23          	sd	ra,24(sp)
    800026f0:	00813823          	sd	s0,16(sp)
    800026f4:	00913423          	sd	s1,8(sp)
    800026f8:	01213023          	sd	s2,0(sp)
    800026fc:	02010413          	addi	s0,sp,32
    80002700:	00050493          	mv	s1,a0
    80002704:	00058913          	mv	s2,a1
    /// cannot join to a finished or closed thread
    __putc('j');
    80002708:	06a00513          	li	a0,106
    8000270c:	00004097          	auipc	ra,0x4
    80002710:	8e0080e7          	jalr	-1824(ra) # 80005fec <__putc>
    if(thread->finished || thread->closed){
    80002714:	09893783          	ld	a5,152(s2)
    80002718:	00900713          	li	a4,9
    8000271c:	02071713          	slli	a4,a4,0x20
    80002720:	00e7f7b3          	and	a5,a5,a4
    80002724:	00078e63          	beqz	a5,80002740 <_ZN7_thread4joinEPS_+0x58>
        thread->joinTail->next = newJoin;
        thread->joinTail = newJoin;
    }
    // Scheduler::remove(this);
    thread_dispatch();
}
    80002728:	01813083          	ld	ra,24(sp)
    8000272c:	01013403          	ld	s0,16(sp)
    80002730:	00813483          	ld	s1,8(sp)
    80002734:	00013903          	ld	s2,0(sp)
    80002738:	02010113          	addi	sp,sp,32
    8000273c:	00008067          	ret
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    80002740:	01000513          	li	a0,16
    80002744:	fffff097          	auipc	ra,0xfffff
    80002748:	c70080e7          	jalr	-912(ra) # 800013b4 <_Z9mem_allocm>
    this->blocked = true;
    8000274c:	09c4a703          	lw	a4,156(s1)
    80002750:	00276713          	ori	a4,a4,2
    80002754:	08e4ae23          	sw	a4,156(s1)
    newJoin->thread = this;
    80002758:	00950023          	sb	s1,0(a0)
    8000275c:	0084d713          	srli	a4,s1,0x8
    80002760:	00e500a3          	sb	a4,1(a0)
    80002764:	0104d713          	srli	a4,s1,0x10
    80002768:	00e50123          	sb	a4,2(a0)
    8000276c:	0184d71b          	srliw	a4,s1,0x18
    80002770:	00e501a3          	sb	a4,3(a0)
    80002774:	0204d713          	srli	a4,s1,0x20
    80002778:	00e50223          	sb	a4,4(a0)
    8000277c:	0284d713          	srli	a4,s1,0x28
    80002780:	00e502a3          	sb	a4,5(a0)
    80002784:	0304d713          	srli	a4,s1,0x30
    80002788:	00e50323          	sb	a4,6(a0)
    8000278c:	0384d493          	srli	s1,s1,0x38
    80002790:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80002794:	00050423          	sb	zero,8(a0)
    80002798:	000504a3          	sb	zero,9(a0)
    8000279c:	00050523          	sb	zero,10(a0)
    800027a0:	000505a3          	sb	zero,11(a0)
    800027a4:	00050623          	sb	zero,12(a0)
    800027a8:	000506a3          	sb	zero,13(a0)
    800027ac:	00050723          	sb	zero,14(a0)
    800027b0:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    800027b4:	07893703          	ld	a4,120(s2)
    800027b8:	04070a63          	beqz	a4,8000280c <_ZN7_thread4joinEPS_+0x124>
        thread->joinTail->next = newJoin;
    800027bc:	08093703          	ld	a4,128(s2)
    800027c0:	00a70423          	sb	a0,8(a4)
    800027c4:	00855693          	srli	a3,a0,0x8
    800027c8:	00d704a3          	sb	a3,9(a4)
    800027cc:	01055693          	srli	a3,a0,0x10
    800027d0:	00d70523          	sb	a3,10(a4)
    800027d4:	0185569b          	srliw	a3,a0,0x18
    800027d8:	00d705a3          	sb	a3,11(a4)
    800027dc:	02055693          	srli	a3,a0,0x20
    800027e0:	00d70623          	sb	a3,12(a4)
    800027e4:	02855693          	srli	a3,a0,0x28
    800027e8:	00d706a3          	sb	a3,13(a4)
    800027ec:	03055693          	srli	a3,a0,0x30
    800027f0:	00d70723          	sb	a3,14(a4)
    800027f4:	03855693          	srli	a3,a0,0x38
    800027f8:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    800027fc:	08a93023          	sd	a0,128(s2)
    thread_dispatch();
    80002800:	fffff097          	auipc	ra,0xfffff
    80002804:	cac080e7          	jalr	-852(ra) # 800014ac <_Z15thread_dispatchv>
    80002808:	f21ff06f          	j	80002728 <_ZN7_thread4joinEPS_+0x40>
        thread->joinHead = newJoin;
    8000280c:	06a93c23          	sd	a0,120(s2)
        thread->joinTail = newJoin;
    80002810:	08a93023          	sd	a0,128(s2)
    80002814:	fedff06f          	j	80002800 <_ZN7_thread4joinEPS_+0x118>

0000000080002818 <_ZN7_thread4tickEv>:

int _thread::tick(){
    if(currentThread->blocked){
    80002818:	00006797          	auipc	a5,0x6
    8000281c:	9407b783          	ld	a5,-1728(a5) # 80008158 <_ZN7_thread13currentThreadE>
    80002820:	09c7a783          	lw	a5,156(a5)
    80002824:	0027f713          	andi	a4,a5,2
    80002828:	06071063          	bnez	a4,80002888 <_ZN7_thread4tickEv+0x70>
        return -1;
    }
    if(currentThread->closed){
    8000282c:	0017f713          	andi	a4,a5,1
    80002830:	06071063          	bnez	a4,80002890 <_ZN7_thread4tickEv+0x78>
        return -2;
    }
    if(currentThread->sleeping){
    80002834:	0047f713          	andi	a4,a5,4
    80002838:	06071063          	bnez	a4,80002898 <_ZN7_thread4tickEv+0x80>
        return -3;
    }
    if(currentThread->finished){
    8000283c:	0087f793          	andi	a5,a5,8
    80002840:	06079063          	bnez	a5,800028a0 <_ZN7_thread4tickEv+0x88>
        return -4;
    }
    timeLeft --;
    80002844:	08853783          	ld	a5,136(a0)
    80002848:	fff78793          	addi	a5,a5,-1
    8000284c:	08f53423          	sd	a5,136(a0)
    if(timeLeft == 0){
    80002850:	00078663          	beqz	a5,8000285c <_ZN7_thread4tickEv+0x44>
        // __putc('d');
        // __putc('0' + currentThread->ID);
        // __putc('\n');
        thread_dispatch();
    }
    return 0;
    80002854:	00000513          	li	a0,0
}
    80002858:	00008067          	ret
int _thread::tick(){
    8000285c:	ff010113          	addi	sp,sp,-16
    80002860:	00113423          	sd	ra,8(sp)
    80002864:	00813023          	sd	s0,0(sp)
    80002868:	01010413          	addi	s0,sp,16
        thread_dispatch();
    8000286c:	fffff097          	auipc	ra,0xfffff
    80002870:	c40080e7          	jalr	-960(ra) # 800014ac <_Z15thread_dispatchv>
    return 0;
    80002874:	00000513          	li	a0,0
}
    80002878:	00813083          	ld	ra,8(sp)
    8000287c:	00013403          	ld	s0,0(sp)
    80002880:	01010113          	addi	sp,sp,16
    80002884:	00008067          	ret
        return -1;
    80002888:	fff00513          	li	a0,-1
    8000288c:	00008067          	ret
        return -2;
    80002890:	ffe00513          	li	a0,-2
    80002894:	00008067          	ret
        return -3;
    80002898:	ffd00513          	li	a0,-3
    8000289c:	00008067          	ret
        return -4;
    800028a0:	ffc00513          	li	a0,-4
    800028a4:	00008067          	ret

00000000800028a8 <_ZN7_thread4exitEv>:

int _thread::exit(){
    if(currentThread->closed){
    800028a8:	00006717          	auipc	a4,0x6
    800028ac:	8b073703          	ld	a4,-1872(a4) # 80008158 <_ZN7_thread13currentThreadE>
    800028b0:	09c72783          	lw	a5,156(a4)
    800028b4:	0017f693          	andi	a3,a5,1
    800028b8:	04069663          	bnez	a3,80002904 <_ZN7_thread4exitEv+0x5c>
        return -1;
    }
    if(currentThread->blocked){
    800028bc:	0027f693          	andi	a3,a5,2
    800028c0:	04069663          	bnez	a3,8000290c <_ZN7_thread4exitEv+0x64>
        return -2;
    }
    if(currentThread->sleeping){
    800028c4:	0047f793          	andi	a5,a5,4
    800028c8:	04079663          	bnez	a5,80002914 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    800028cc:	ff010113          	addi	sp,sp,-16
    800028d0:	00113423          	sd	ra,8(sp)
    800028d4:	00813023          	sd	s0,0(sp)
    800028d8:	01010413          	addi	s0,sp,16
        return -3;
    }
    currentThread->finished = 1;
    800028dc:	09c72783          	lw	a5,156(a4)
    800028e0:	0087e793          	ori	a5,a5,8
    800028e4:	08f72e23          	sw	a5,156(a4)
    thread_dispatch();
    800028e8:	fffff097          	auipc	ra,0xfffff
    800028ec:	bc4080e7          	jalr	-1084(ra) # 800014ac <_Z15thread_dispatchv>
    return 0;
    800028f0:	00000513          	li	a0,0
}
    800028f4:	00813083          	ld	ra,8(sp)
    800028f8:	00013403          	ld	s0,0(sp)
    800028fc:	01010113          	addi	sp,sp,16
    80002900:	00008067          	ret
        return -1;
    80002904:	fff00513          	li	a0,-1
    80002908:	00008067          	ret
        return -2;
    8000290c:	ffe00513          	li	a0,-2
    80002910:	00008067          	ret
        return -3;
    80002914:	ffd00513          	li	a0,-3
}
    80002918:	00008067          	ret

000000008000291c <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    8000291c:	fe010113          	addi	sp,sp,-32
    80002920:	00113c23          	sd	ra,24(sp)
    80002924:	00813823          	sd	s0,16(sp)
    80002928:	00913423          	sd	s1,8(sp)
    8000292c:	02010413          	addi	s0,sp,32
    popSppSpie(currentThread->kernel);
    80002930:	00006497          	auipc	s1,0x6
    80002934:	82048493          	addi	s1,s1,-2016 # 80008150 <_ZN7_thread6nextIDE>
    80002938:	0084b783          	ld	a5,8(s1)
    8000293c:	09c7a503          	lw	a0,156(a5)
    80002940:	4045551b          	sraiw	a0,a0,0x4
    80002944:	00157513          	andi	a0,a0,1
    80002948:	00000097          	auipc	ra,0x0
    8000294c:	aa0080e7          	jalr	-1376(ra) # 800023e8 <_Z10popSppSpieb>
    currentThread->function(currentThread->arg);
    80002950:	0084b783          	ld	a5,8(s1)
    80002954:	0a87b703          	ld	a4,168(a5)
    80002958:	0b07b503          	ld	a0,176(a5)
    8000295c:	000700e7          	jalr	a4
    currentThread->unJoin();
    80002960:	0084b503          	ld	a0,8(s1)
    80002964:	00000097          	auipc	ra,0x0
    80002968:	abc080e7          	jalr	-1348(ra) # 80002420 <_ZN7_thread6unJoinEv>
    exit();
    8000296c:	00000097          	auipc	ra,0x0
    80002970:	f3c080e7          	jalr	-196(ra) # 800028a8 <_ZN7_thread4exitEv>
}
    80002974:	01813083          	ld	ra,24(sp)
    80002978:	01013403          	ld	s0,16(sp)
    8000297c:	00813483          	ld	s1,8(sp)
    80002980:	02010113          	addi	sp,sp,32
    80002984:	00008067          	ret

0000000080002988 <_ZN7_thread10setBlockedEb>:

void _thread::setBlocked(bool blocked){
    80002988:	ff010113          	addi	sp,sp,-16
    8000298c:	00813423          	sd	s0,8(sp)
    80002990:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80002994:	0015f593          	andi	a1,a1,1
    80002998:	0015979b          	slliw	a5,a1,0x1
    8000299c:	09c52583          	lw	a1,156(a0)
    800029a0:	ffd5f593          	andi	a1,a1,-3
    800029a4:	00f5e5b3          	or	a1,a1,a5
    800029a8:	08b52e23          	sw	a1,156(a0)
}
    800029ac:	00813403          	ld	s0,8(sp)
    800029b0:	01010113          	addi	sp,sp,16
    800029b4:	00008067          	ret

00000000800029b8 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    800029b8:	ff010113          	addi	sp,sp,-16
    800029bc:	00813423          	sd	s0,8(sp)
    800029c0:	01010413          	addi	s0,sp,16
    this->closed = closed;
    800029c4:	0015f793          	andi	a5,a1,1
    800029c8:	09c52583          	lw	a1,156(a0)
    800029cc:	ffe5f593          	andi	a1,a1,-2
    800029d0:	00f5e5b3          	or	a1,a1,a5
    800029d4:	08b52e23          	sw	a1,156(a0)
}
    800029d8:	00813403          	ld	s0,8(sp)
    800029dc:	01010113          	addi	sp,sp,16
    800029e0:	00008067          	ret

00000000800029e4 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    800029e4:	ff010113          	addi	sp,sp,-16
    800029e8:	00813423          	sd	s0,8(sp)
    800029ec:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    800029f0:	0015f593          	andi	a1,a1,1
    800029f4:	0025979b          	slliw	a5,a1,0x2
    800029f8:	09c52583          	lw	a1,156(a0)
    800029fc:	ffb5f593          	andi	a1,a1,-5
    80002a00:	00f5e5b3          	or	a1,a1,a5
    80002a04:	08b52e23          	sw	a1,156(a0)
}
    80002a08:	00813403          	ld	s0,8(sp)
    80002a0c:	01010113          	addi	sp,sp,16
    80002a10:	00008067          	ret

0000000080002a14 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
    // __putc('\n');
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    // __putc('.');
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    80002a14:	ff010113          	addi	sp,sp,-16
    80002a18:	00813423          	sd	s0,8(sp)
    80002a1c:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    80002a20:	04050263          	beqz	a0,80002a64 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    80002a24:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    80002a28:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    80002a2c:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    80002a30:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    80002a34:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    80002a38:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    80002a3c:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    80002a40:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    80002a44:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    80002a48:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    80002a4c:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    80002a50:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    80002a54:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    80002a58:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80002a5c:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    80002a60:	06853823          	sd	s0,112(a0)
    //         __putc('a' + digit - 10);
    //     }
    // }
    // __putc('\n');
    
    if(newContext->sp != 0){
    80002a64:	0085b783          	ld	a5,8(a1)
    80002a68:	00078463          	beqz	a5,80002a70 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    80002a6c:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    80002a70:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    80002a74:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    80002a78:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80002a7c:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    80002a80:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80002a84:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80002a88:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80002a8c:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80002a90:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80002a94:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80002a98:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    80002a9c:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    80002aa0:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    80002aa4:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    80002aa8:	0685bd83          	ld	s11,104(a1)

    return;

}
    80002aac:	00813403          	ld	s0,8(sp)
    80002ab0:	01010113          	addi	sp,sp,16
    80002ab4:	00008067          	ret

0000000080002ab8 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80002ab8:	fe010113          	addi	sp,sp,-32
    80002abc:	00113c23          	sd	ra,24(sp)
    80002ac0:	00813823          	sd	s0,16(sp)
    80002ac4:	00913423          	sd	s1,8(sp)
    80002ac8:	01213023          	sd	s2,0(sp)
    80002acc:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    80002ad0:	00005917          	auipc	s2,0x5
    80002ad4:	68090913          	addi	s2,s2,1664 # 80008150 <_ZN7_thread6nextIDE>
    80002ad8:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    80002adc:	00001097          	auipc	ra,0x1
    80002ae0:	2cc080e7          	jalr	716(ra) # 80003da8 <_ZN9Scheduler3getEv>
    80002ae4:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    80002ae8:	00200793          	li	a5,2
    80002aec:	08f4b423          	sd	a5,136(s1)
    if(currentThread == nullptr){
    80002af0:	04050463          	beqz	a0,80002b38 <_ZN7_thread8dispatchEv+0x80>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80002af4:	00048c63          	beqz	s1,80002b0c <_ZN7_thread8dispatchEv+0x54>
    80002af8:	0984b783          	ld	a5,152(s1)
    80002afc:	00f00713          	li	a4,15
    80002b00:	02071713          	slli	a4,a4,0x20
    80002b04:	00e7f7b3          	and	a5,a5,a4
    80002b08:	02078e63          	beqz	a5,80002b44 <_ZN7_thread8dispatchEv+0x8c>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    80002b0c:	00005597          	auipc	a1,0x5
    80002b10:	64c5b583          	ld	a1,1612(a1) # 80008158 <_ZN7_thread13currentThreadE>
    80002b14:	00048513          	mv	a0,s1
    80002b18:	00000097          	auipc	ra,0x0
    80002b1c:	efc080e7          	jalr	-260(ra) # 80002a14 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    80002b20:	01813083          	ld	ra,24(sp)
    80002b24:	01013403          	ld	s0,16(sp)
    80002b28:	00813483          	ld	s1,8(sp)
    80002b2c:	00013903          	ld	s2,0(sp)
    80002b30:	02010113          	addi	sp,sp,32
    80002b34:	00008067          	ret
        currentThread = oldThread;
    80002b38:	00005797          	auipc	a5,0x5
    80002b3c:	6297b023          	sd	s1,1568(a5) # 80008158 <_ZN7_thread13currentThreadE>
        return;
    80002b40:	fe1ff06f          	j	80002b20 <_ZN7_thread8dispatchEv+0x68>
        Scheduler::put(oldThread);
    80002b44:	00048513          	mv	a0,s1
    80002b48:	00001097          	auipc	ra,0x1
    80002b4c:	070080e7          	jalr	112(ra) # 80003bb8 <_ZN9Scheduler3putEP7_thread>
    80002b50:	fbdff06f          	j	80002b0c <_ZN7_thread8dispatchEv+0x54>

0000000080002b54 <_ZN11HeapManagerC1Ev>:
#include "hw.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80002b54:	fe010113          	addi	sp,sp,-32
    80002b58:	00113c23          	sd	ra,24(sp)
    80002b5c:	00813823          	sd	s0,16(sp)
    80002b60:	00913423          	sd	s1,8(sp)
    80002b64:	02010413          	addi	s0,sp,32
    80002b68:	00050493          	mv	s1,a0
    assert(instance == 0);
    80002b6c:	00005797          	auipc	a5,0x5
    80002b70:	5f47b783          	ld	a5,1524(a5) # 80008160 <_ZN11HeapManager8instanceE>
    80002b74:	02079063          	bnez	a5,80002b94 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80002b78:	00005797          	auipc	a5,0x5
    80002b7c:	5e97b423          	sd	s1,1512(a5) # 80008160 <_ZN11HeapManager8instanceE>
}
    80002b80:	01813083          	ld	ra,24(sp)
    80002b84:	01013403          	ld	s0,16(sp)
    80002b88:	00813483          	ld	s1,8(sp)
    80002b8c:	02010113          	addi	sp,sp,32
    80002b90:	00008067          	ret
    assert(instance == 0);
    80002b94:	00004697          	auipc	a3,0x4
    80002b98:	53c68693          	addi	a3,a3,1340 # 800070d0 <CONSOLE_STATUS+0xc0>
    80002b9c:	01300613          	li	a2,19
    80002ba0:	00004597          	auipc	a1,0x4
    80002ba4:	55058593          	addi	a1,a1,1360 # 800070f0 <CONSOLE_STATUS+0xe0>
    80002ba8:	00004517          	auipc	a0,0x4
    80002bac:	49850513          	addi	a0,a0,1176 # 80007040 <CONSOLE_STATUS+0x30>
    80002bb0:	fffff097          	auipc	ra,0xfffff
    80002bb4:	cf8080e7          	jalr	-776(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80002bb8:	fc1ff06f          	j	80002b78 <_ZN11HeapManagerC1Ev+0x24>

0000000080002bbc <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80002bbc:	ff010113          	addi	sp,sp,-16
    80002bc0:	00813423          	sd	s0,8(sp)
    80002bc4:	01010413          	addi	s0,sp,16
    
}
    80002bc8:	00813403          	ld	s0,8(sp)
    80002bcc:	01010113          	addi	sp,sp,16
    80002bd0:	00008067          	ret

0000000080002bd4 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    80002bd4:	fd010113          	addi	sp,sp,-48
    80002bd8:	02113423          	sd	ra,40(sp)
    80002bdc:	02813023          	sd	s0,32(sp)
    80002be0:	00913c23          	sd	s1,24(sp)
    80002be4:	01213823          	sd	s2,16(sp)
    80002be8:	01313423          	sd	s3,8(sp)
    80002bec:	03010413          	addi	s0,sp,48
    80002bf0:	00050993          	mv	s3,a0
    80002bf4:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002bf8:	40b604b3          	sub	s1,a2,a1
    80002bfc:	0414b793          	sltiu	a5,s1,65
    80002c00:	0c079863          	bnez	a5,80002cd0 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80002c04:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80002c08:	fde00793          	li	a5,-34
    80002c0c:	00f90c23          	sb	a5,24(s2)
    80002c10:	fc000713          	li	a4,-64
    80002c14:	00e90ca3          	sb	a4,25(s2)
    80002c18:	fad00713          	li	a4,-83
    80002c1c:	00e90d23          	sb	a4,26(s2)
    80002c20:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart - MEM_BLOCK_SIZE) / MEM_BLOCK_SIZE;
    80002c24:	fc048613          	addi	a2,s1,-64
    80002c28:	0009b783          	ld	a5,0(s3)
    80002c2c:	00665713          	srli	a4,a2,0x6
    80002c30:	00e78823          	sb	a4,16(a5)
    80002c34:	00e65713          	srli	a4,a2,0xe
    80002c38:	00e788a3          	sb	a4,17(a5)
    80002c3c:	01665713          	srli	a4,a2,0x16
    80002c40:	00e78923          	sb	a4,18(a5)
    80002c44:	01e65713          	srli	a4,a2,0x1e
    80002c48:	00e789a3          	sb	a4,19(a5)
    80002c4c:	02665713          	srli	a4,a2,0x26
    80002c50:	00e78a23          	sb	a4,20(a5)
    80002c54:	02e65713          	srli	a4,a2,0x2e
    80002c58:	00e78aa3          	sb	a4,21(a5)
    80002c5c:	03665713          	srli	a4,a2,0x36
    80002c60:	00e78b23          	sb	a4,22(a5)
    80002c64:	03e65613          	srli	a2,a2,0x3e
    80002c68:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80002c6c:	0009b783          	ld	a5,0(s3)
    80002c70:	00078023          	sb	zero,0(a5)
    80002c74:	000780a3          	sb	zero,1(a5)
    80002c78:	00078123          	sb	zero,2(a5)
    80002c7c:	000781a3          	sb	zero,3(a5)
    80002c80:	00078223          	sb	zero,4(a5)
    80002c84:	000782a3          	sb	zero,5(a5)
    80002c88:	00078323          	sb	zero,6(a5)
    80002c8c:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80002c90:	0009b783          	ld	a5,0(s3)
    80002c94:	00078423          	sb	zero,8(a5)
    80002c98:	000784a3          	sb	zero,9(a5)
    80002c9c:	00078523          	sb	zero,10(a5)
    80002ca0:	000785a3          	sb	zero,11(a5)
    80002ca4:	00078623          	sb	zero,12(a5)
    80002ca8:	000786a3          	sb	zero,13(a5)
    80002cac:	00078723          	sb	zero,14(a5)
    80002cb0:	000787a3          	sb	zero,15(a5)
}
    80002cb4:	02813083          	ld	ra,40(sp)
    80002cb8:	02013403          	ld	s0,32(sp)
    80002cbc:	01813483          	ld	s1,24(sp)
    80002cc0:	01013903          	ld	s2,16(sp)
    80002cc4:	00813983          	ld	s3,8(sp)
    80002cc8:	03010113          	addi	sp,sp,48
    80002ccc:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002cd0:	00004697          	auipc	a3,0x4
    80002cd4:	43868693          	addi	a3,a3,1080 # 80007108 <CONSOLE_STATUS+0xf8>
    80002cd8:	01c00613          	li	a2,28
    80002cdc:	00004597          	auipc	a1,0x4
    80002ce0:	41458593          	addi	a1,a1,1044 # 800070f0 <CONSOLE_STATUS+0xe0>
    80002ce4:	00004517          	auipc	a0,0x4
    80002ce8:	45450513          	addi	a0,a0,1108 # 80007138 <CONSOLE_STATUS+0x128>
    80002cec:	fffff097          	auipc	ra,0xfffff
    80002cf0:	bbc080e7          	jalr	-1092(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80002cf4:	f11ff06f          	j	80002c04 <_ZN11HeapManager4initEmm+0x30>

0000000080002cf8 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80002cf8:	fe010113          	addi	sp,sp,-32
    80002cfc:	00113c23          	sd	ra,24(sp)
    80002d00:	00813823          	sd	s0,16(sp)
    80002d04:	00913423          	sd	s1,8(sp)
    80002d08:	01213023          	sd	s2,0(sp)
    80002d0c:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002d10:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80002d14:	00000913          	li	s2,0
    80002d18:	0b80006f          	j	80002dd0 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        /// how is this an illegal read???
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80002d1c:	0104c783          	lbu	a5,16(s1)
    80002d20:	0114c703          	lbu	a4,17(s1)
    80002d24:	00871713          	slli	a4,a4,0x8
    80002d28:	00f76733          	or	a4,a4,a5
    80002d2c:	0124c783          	lbu	a5,18(s1)
    80002d30:	01079793          	slli	a5,a5,0x10
    80002d34:	00e7e733          	or	a4,a5,a4
    80002d38:	0134c783          	lbu	a5,19(s1)
    80002d3c:	01879793          	slli	a5,a5,0x18
    80002d40:	00e7e7b3          	or	a5,a5,a4
    80002d44:	0144c703          	lbu	a4,20(s1)
    80002d48:	02071713          	slli	a4,a4,0x20
    80002d4c:	00f767b3          	or	a5,a4,a5
    80002d50:	0154c703          	lbu	a4,21(s1)
    80002d54:	02871713          	slli	a4,a4,0x28
    80002d58:	00f76733          	or	a4,a4,a5
    80002d5c:	0164c783          	lbu	a5,22(s1)
    80002d60:	03079793          	slli	a5,a5,0x30
    80002d64:	00e7e733          	or	a4,a5,a4
    80002d68:	0174c783          	lbu	a5,23(s1)
    80002d6c:	03879793          	slli	a5,a5,0x38
    80002d70:	00e7e7b3          	or	a5,a5,a4
    80002d74:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80002d78:	0004c703          	lbu	a4,0(s1)
    80002d7c:	0014c783          	lbu	a5,1(s1)
    80002d80:	00879793          	slli	a5,a5,0x8
    80002d84:	00e7e733          	or	a4,a5,a4
    80002d88:	0024c783          	lbu	a5,2(s1)
    80002d8c:	01079793          	slli	a5,a5,0x10
    80002d90:	00e7e7b3          	or	a5,a5,a4
    80002d94:	0034c703          	lbu	a4,3(s1)
    80002d98:	01871713          	slli	a4,a4,0x18
    80002d9c:	00f767b3          	or	a5,a4,a5
    80002da0:	0044c703          	lbu	a4,4(s1)
    80002da4:	02071713          	slli	a4,a4,0x20
    80002da8:	00f76733          	or	a4,a4,a5
    80002dac:	0054c783          	lbu	a5,5(s1)
    80002db0:	02879793          	slli	a5,a5,0x28
    80002db4:	00e7e733          	or	a4,a5,a4
    80002db8:	0064c783          	lbu	a5,6(s1)
    80002dbc:	03079793          	slli	a5,a5,0x30
    80002dc0:	00e7e7b3          	or	a5,a5,a4
    80002dc4:	0074c483          	lbu	s1,7(s1)
    80002dc8:	03849493          	slli	s1,s1,0x38
    80002dcc:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002dd0:	06048263          	beqz	s1,80002e34 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002dd4:	0184c783          	lbu	a5,24(s1)
    80002dd8:	0194c703          	lbu	a4,25(s1)
    80002ddc:	00871713          	slli	a4,a4,0x8
    80002de0:	00f76733          	or	a4,a4,a5
    80002de4:	01a4c783          	lbu	a5,26(s1)
    80002de8:	01079793          	slli	a5,a5,0x10
    80002dec:	00e7e733          	or	a4,a5,a4
    80002df0:	01b4c783          	lbu	a5,27(s1)
    80002df4:	01879793          	slli	a5,a5,0x18
    80002df8:	00e7e7b3          	or	a5,a5,a4
    80002dfc:	0007879b          	sext.w	a5,a5
    80002e00:	deadc737          	lui	a4,0xdeadc
    80002e04:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2d0e>
    80002e08:	f0e78ae3          	beq	a5,a4,80002d1c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80002e0c:	00004697          	auipc	a3,0x4
    80002e10:	34c68693          	addi	a3,a3,844 # 80007158 <CONSOLE_STATUS+0x148>
    80002e14:	02a00613          	li	a2,42
    80002e18:	00004597          	auipc	a1,0x4
    80002e1c:	2d858593          	addi	a1,a1,728 # 800070f0 <CONSOLE_STATUS+0xe0>
    80002e20:	00004517          	auipc	a0,0x4
    80002e24:	36050513          	addi	a0,a0,864 # 80007180 <CONSOLE_STATUS+0x170>
    80002e28:	fffff097          	auipc	ra,0xfffff
    80002e2c:	a80080e7          	jalr	-1408(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80002e30:	eedff06f          	j	80002d1c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80002e34:	00090513          	mv	a0,s2
    80002e38:	01813083          	ld	ra,24(sp)
    80002e3c:	01013403          	ld	s0,16(sp)
    80002e40:	00813483          	ld	s1,8(sp)
    80002e44:	00013903          	ld	s2,0(sp)
    80002e48:	02010113          	addi	sp,sp,32
    80002e4c:	00008067          	ret

0000000080002e50 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80002e50:	fd010113          	addi	sp,sp,-48
    80002e54:	02113423          	sd	ra,40(sp)
    80002e58:	02813023          	sd	s0,32(sp)
    80002e5c:	00913c23          	sd	s1,24(sp)
    80002e60:	01213823          	sd	s2,16(sp)
    80002e64:	01313423          	sd	s3,8(sp)
    80002e68:	03010413          	addi	s0,sp,48
    80002e6c:	00050993          	mv	s3,a0
    80002e70:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002e74:	00053483          	ld	s1,0(a0)
    80002e78:	0b80006f          	j	80002f30 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80002e7c:	0104c783          	lbu	a5,16(s1)
    80002e80:	0114c703          	lbu	a4,17(s1)
    80002e84:	00871713          	slli	a4,a4,0x8
    80002e88:	00f76733          	or	a4,a4,a5
    80002e8c:	0124c783          	lbu	a5,18(s1)
    80002e90:	01079793          	slli	a5,a5,0x10
    80002e94:	00e7e733          	or	a4,a5,a4
    80002e98:	0134c783          	lbu	a5,19(s1)
    80002e9c:	01879793          	slli	a5,a5,0x18
    80002ea0:	00e7e7b3          	or	a5,a5,a4
    80002ea4:	0144c703          	lbu	a4,20(s1)
    80002ea8:	02071713          	slli	a4,a4,0x20
    80002eac:	00f767b3          	or	a5,a4,a5
    80002eb0:	0154c703          	lbu	a4,21(s1)
    80002eb4:	02871713          	slli	a4,a4,0x28
    80002eb8:	00f76733          	or	a4,a4,a5
    80002ebc:	0164c783          	lbu	a5,22(s1)
    80002ec0:	03079793          	slli	a5,a5,0x30
    80002ec4:	00e7e733          	or	a4,a5,a4
    80002ec8:	0174c783          	lbu	a5,23(s1)
    80002ecc:	03879793          	slli	a5,a5,0x38
    80002ed0:	00e7e7b3          	or	a5,a5,a4
    80002ed4:	0d27f063          	bgeu	a5,s2,80002f94 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80002ed8:	0004c703          	lbu	a4,0(s1)
    80002edc:	0014c783          	lbu	a5,1(s1)
    80002ee0:	00879793          	slli	a5,a5,0x8
    80002ee4:	00e7e733          	or	a4,a5,a4
    80002ee8:	0024c783          	lbu	a5,2(s1)
    80002eec:	01079793          	slli	a5,a5,0x10
    80002ef0:	00e7e7b3          	or	a5,a5,a4
    80002ef4:	0034c703          	lbu	a4,3(s1)
    80002ef8:	01871713          	slli	a4,a4,0x18
    80002efc:	00f767b3          	or	a5,a4,a5
    80002f00:	0044c703          	lbu	a4,4(s1)
    80002f04:	02071713          	slli	a4,a4,0x20
    80002f08:	00f76733          	or	a4,a4,a5
    80002f0c:	0054c783          	lbu	a5,5(s1)
    80002f10:	02879793          	slli	a5,a5,0x28
    80002f14:	00e7e733          	or	a4,a5,a4
    80002f18:	0064c783          	lbu	a5,6(s1)
    80002f1c:	03079793          	slli	a5,a5,0x30
    80002f20:	00e7e7b3          	or	a5,a5,a4
    80002f24:	0074c483          	lbu	s1,7(s1)
    80002f28:	03849493          	slli	s1,s1,0x38
    80002f2c:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002f30:	4e048c63          	beqz	s1,80003428 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002f34:	0184c783          	lbu	a5,24(s1)
    80002f38:	0194c703          	lbu	a4,25(s1)
    80002f3c:	00871713          	slli	a4,a4,0x8
    80002f40:	00f76733          	or	a4,a4,a5
    80002f44:	01a4c783          	lbu	a5,26(s1)
    80002f48:	01079793          	slli	a5,a5,0x10
    80002f4c:	00e7e733          	or	a4,a5,a4
    80002f50:	01b4c783          	lbu	a5,27(s1)
    80002f54:	01879793          	slli	a5,a5,0x18
    80002f58:	00e7e7b3          	or	a5,a5,a4
    80002f5c:	0007879b          	sext.w	a5,a5
    80002f60:	deadc737          	lui	a4,0xdeadc
    80002f64:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2d0e>
    80002f68:	f0e78ae3          	beq	a5,a4,80002e7c <_ZN11HeapManager12heapAllocateEm+0x2c>
    80002f6c:	00004697          	auipc	a3,0x4
    80002f70:	23c68693          	addi	a3,a3,572 # 800071a8 <CONSOLE_STATUS+0x198>
    80002f74:	03400613          	li	a2,52
    80002f78:	00004597          	auipc	a1,0x4
    80002f7c:	17858593          	addi	a1,a1,376 # 800070f0 <CONSOLE_STATUS+0xe0>
    80002f80:	00004517          	auipc	a0,0x4
    80002f84:	20050513          	addi	a0,a0,512 # 80007180 <CONSOLE_STATUS+0x170>
    80002f88:	fffff097          	auipc	ra,0xfffff
    80002f8c:	920080e7          	jalr	-1760(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80002f90:	eedff06f          	j	80002e7c <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80002f94:	00190713          	addi	a4,s2,1
    80002f98:	2af77263          	bgeu	a4,a5,8000323c <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80002f9c:	00671793          	slli	a5,a4,0x6
    80002fa0:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80002fa4:	fde00713          	li	a4,-34
    80002fa8:	00e78c23          	sb	a4,24(a5)
    80002fac:	fc000693          	li	a3,-64
    80002fb0:	00d78ca3          	sb	a3,25(a5)
    80002fb4:	fad00693          	li	a3,-83
    80002fb8:	00d78d23          	sb	a3,26(a5)
    80002fbc:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80002fc0:	0104c703          	lbu	a4,16(s1)
    80002fc4:	0114c683          	lbu	a3,17(s1)
    80002fc8:	00869693          	slli	a3,a3,0x8
    80002fcc:	00e6e6b3          	or	a3,a3,a4
    80002fd0:	0124c703          	lbu	a4,18(s1)
    80002fd4:	01071713          	slli	a4,a4,0x10
    80002fd8:	00d766b3          	or	a3,a4,a3
    80002fdc:	0134c703          	lbu	a4,19(s1)
    80002fe0:	01871713          	slli	a4,a4,0x18
    80002fe4:	00d76733          	or	a4,a4,a3
    80002fe8:	0144c683          	lbu	a3,20(s1)
    80002fec:	02069693          	slli	a3,a3,0x20
    80002ff0:	00e6e733          	or	a4,a3,a4
    80002ff4:	0154c683          	lbu	a3,21(s1)
    80002ff8:	02869693          	slli	a3,a3,0x28
    80002ffc:	00e6e6b3          	or	a3,a3,a4
    80003000:	0164c703          	lbu	a4,22(s1)
    80003004:	03071713          	slli	a4,a4,0x30
    80003008:	00d766b3          	or	a3,a4,a3
    8000300c:	0174c703          	lbu	a4,23(s1)
    80003010:	03871713          	slli	a4,a4,0x38
    80003014:	00d76733          	or	a4,a4,a3
    80003018:	41270733          	sub	a4,a4,s2
    8000301c:	fff70713          	addi	a4,a4,-1
    80003020:	00e78823          	sb	a4,16(a5)
    80003024:	00875693          	srli	a3,a4,0x8
    80003028:	00d788a3          	sb	a3,17(a5)
    8000302c:	01075693          	srli	a3,a4,0x10
    80003030:	00d78923          	sb	a3,18(a5)
    80003034:	0187569b          	srliw	a3,a4,0x18
    80003038:	00d789a3          	sb	a3,19(a5)
    8000303c:	02075693          	srli	a3,a4,0x20
    80003040:	00d78a23          	sb	a3,20(a5)
    80003044:	02875693          	srli	a3,a4,0x28
    80003048:	00d78aa3          	sb	a3,21(a5)
    8000304c:	03075693          	srli	a3,a4,0x30
    80003050:	00d78b23          	sb	a3,22(a5)
    80003054:	03875713          	srli	a4,a4,0x38
    80003058:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    8000305c:	0004c703          	lbu	a4,0(s1)
    80003060:	0014c683          	lbu	a3,1(s1)
    80003064:	00869693          	slli	a3,a3,0x8
    80003068:	00e6e733          	or	a4,a3,a4
    8000306c:	0024c683          	lbu	a3,2(s1)
    80003070:	01069693          	slli	a3,a3,0x10
    80003074:	00e6e6b3          	or	a3,a3,a4
    80003078:	0034c703          	lbu	a4,3(s1)
    8000307c:	01871713          	slli	a4,a4,0x18
    80003080:	00d766b3          	or	a3,a4,a3
    80003084:	0044c703          	lbu	a4,4(s1)
    80003088:	02071713          	slli	a4,a4,0x20
    8000308c:	00d76733          	or	a4,a4,a3
    80003090:	0054c683          	lbu	a3,5(s1)
    80003094:	02869693          	slli	a3,a3,0x28
    80003098:	00e6e733          	or	a4,a3,a4
    8000309c:	0064c683          	lbu	a3,6(s1)
    800030a0:	03069693          	slli	a3,a3,0x30
    800030a4:	00e6e6b3          	or	a3,a3,a4
    800030a8:	0074c703          	lbu	a4,7(s1)
    800030ac:	03871713          	slli	a4,a4,0x38
    800030b0:	00d76733          	or	a4,a4,a3
    800030b4:	00d78023          	sb	a3,0(a5)
    800030b8:	00875693          	srli	a3,a4,0x8
    800030bc:	00d780a3          	sb	a3,1(a5)
    800030c0:	01075693          	srli	a3,a4,0x10
    800030c4:	00d78123          	sb	a3,2(a5)
    800030c8:	0187569b          	srliw	a3,a4,0x18
    800030cc:	00d781a3          	sb	a3,3(a5)
    800030d0:	02075693          	srli	a3,a4,0x20
    800030d4:	00d78223          	sb	a3,4(a5)
    800030d8:	02875693          	srli	a3,a4,0x28
    800030dc:	00d782a3          	sb	a3,5(a5)
    800030e0:	03075693          	srli	a3,a4,0x30
    800030e4:	00d78323          	sb	a3,6(a5)
    800030e8:	03875713          	srli	a4,a4,0x38
    800030ec:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    800030f0:	00978423          	sb	s1,8(a5)
    800030f4:	0084d713          	srli	a4,s1,0x8
    800030f8:	00e784a3          	sb	a4,9(a5)
    800030fc:	0104d713          	srli	a4,s1,0x10
    80003100:	00e78523          	sb	a4,10(a5)
    80003104:	0184d71b          	srliw	a4,s1,0x18
    80003108:	00e785a3          	sb	a4,11(a5)
    8000310c:	0204d713          	srli	a4,s1,0x20
    80003110:	00e78623          	sb	a4,12(a5)
    80003114:	0284d713          	srli	a4,s1,0x28
    80003118:	00e786a3          	sb	a4,13(a5)
    8000311c:	0304d713          	srli	a4,s1,0x30
    80003120:	00e78723          	sb	a4,14(a5)
    80003124:	0384d713          	srli	a4,s1,0x38
    80003128:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    8000312c:	0004c703          	lbu	a4,0(s1)
    80003130:	0014c683          	lbu	a3,1(s1)
    80003134:	00869693          	slli	a3,a3,0x8
    80003138:	00e6e6b3          	or	a3,a3,a4
    8000313c:	0024c703          	lbu	a4,2(s1)
    80003140:	01071713          	slli	a4,a4,0x10
    80003144:	00d766b3          	or	a3,a4,a3
    80003148:	0034c703          	lbu	a4,3(s1)
    8000314c:	01871713          	slli	a4,a4,0x18
    80003150:	00d76733          	or	a4,a4,a3
    80003154:	0044c683          	lbu	a3,4(s1)
    80003158:	02069693          	slli	a3,a3,0x20
    8000315c:	00e6e733          	or	a4,a3,a4
    80003160:	0054c683          	lbu	a3,5(s1)
    80003164:	02869693          	slli	a3,a3,0x28
    80003168:	00e6e6b3          	or	a3,a3,a4
    8000316c:	0064c703          	lbu	a4,6(s1)
    80003170:	03071713          	slli	a4,a4,0x30
    80003174:	00d766b3          	or	a3,a4,a3
    80003178:	0074c703          	lbu	a4,7(s1)
    8000317c:	03871713          	slli	a4,a4,0x38
    80003180:	00d76733          	or	a4,a4,a3
    80003184:	04070063          	beqz	a4,800031c4 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003188:	00f70423          	sb	a5,8(a4)
    8000318c:	0087d693          	srli	a3,a5,0x8
    80003190:	00d704a3          	sb	a3,9(a4)
    80003194:	0107d693          	srli	a3,a5,0x10
    80003198:	00d70523          	sb	a3,10(a4)
    8000319c:	0187d69b          	srliw	a3,a5,0x18
    800031a0:	00d705a3          	sb	a3,11(a4)
    800031a4:	0207d693          	srli	a3,a5,0x20
    800031a8:	00d70623          	sb	a3,12(a4)
    800031ac:	0287d693          	srli	a3,a5,0x28
    800031b0:	00d706a3          	sb	a3,13(a4)
    800031b4:	0307d693          	srli	a3,a5,0x30
    800031b8:	00d70723          	sb	a3,14(a4)
    800031bc:	0387d693          	srli	a3,a5,0x38
    800031c0:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    800031c4:	00f48023          	sb	a5,0(s1)
    800031c8:	0087d713          	srli	a4,a5,0x8
    800031cc:	00e480a3          	sb	a4,1(s1)
    800031d0:	0107d713          	srli	a4,a5,0x10
    800031d4:	00e48123          	sb	a4,2(s1)
    800031d8:	0187d71b          	srliw	a4,a5,0x18
    800031dc:	00e481a3          	sb	a4,3(s1)
    800031e0:	0207d713          	srli	a4,a5,0x20
    800031e4:	00e48223          	sb	a4,4(s1)
    800031e8:	0287d713          	srli	a4,a5,0x28
    800031ec:	00e482a3          	sb	a4,5(s1)
    800031f0:	0307d713          	srli	a4,a5,0x30
    800031f4:	00e48323          	sb	a4,6(s1)
    800031f8:	0387d793          	srli	a5,a5,0x38
    800031fc:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80003200:	01248823          	sb	s2,16(s1)
    80003204:	00895793          	srli	a5,s2,0x8
    80003208:	00f488a3          	sb	a5,17(s1)
    8000320c:	01095793          	srli	a5,s2,0x10
    80003210:	00f48923          	sb	a5,18(s1)
    80003214:	0189579b          	srliw	a5,s2,0x18
    80003218:	00f489a3          	sb	a5,19(s1)
    8000321c:	02095793          	srli	a5,s2,0x20
    80003220:	00f48a23          	sb	a5,20(s1)
    80003224:	02895793          	srli	a5,s2,0x28
    80003228:	00f48aa3          	sb	a5,21(s1)
    8000322c:	03095793          	srli	a5,s2,0x30
    80003230:	00f48b23          	sb	a5,22(s1)
    80003234:	03895913          	srli	s2,s2,0x38
    80003238:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    8000323c:	0009b783          	ld	a5,0(s3)
    80003240:	20978463          	beq	a5,s1,80003448 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80003244:	0084c783          	lbu	a5,8(s1)
    80003248:	0094c703          	lbu	a4,9(s1)
    8000324c:	00871713          	slli	a4,a4,0x8
    80003250:	00f76733          	or	a4,a4,a5
    80003254:	00a4c783          	lbu	a5,10(s1)
    80003258:	01079793          	slli	a5,a5,0x10
    8000325c:	00e7e733          	or	a4,a5,a4
    80003260:	00b4c783          	lbu	a5,11(s1)
    80003264:	01879793          	slli	a5,a5,0x18
    80003268:	00e7e7b3          	or	a5,a5,a4
    8000326c:	00c4c703          	lbu	a4,12(s1)
    80003270:	02071713          	slli	a4,a4,0x20
    80003274:	00f767b3          	or	a5,a4,a5
    80003278:	00d4c703          	lbu	a4,13(s1)
    8000327c:	02871713          	slli	a4,a4,0x28
    80003280:	00f76733          	or	a4,a4,a5
    80003284:	00e4c783          	lbu	a5,14(s1)
    80003288:	03079793          	slli	a5,a5,0x30
    8000328c:	00e7e733          	or	a4,a5,a4
    80003290:	00f4c783          	lbu	a5,15(s1)
    80003294:	03879793          	slli	a5,a5,0x38
    80003298:	00e7e7b3          	or	a5,a5,a4
    8000329c:	08078c63          	beqz	a5,80003334 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    800032a0:	0004c703          	lbu	a4,0(s1)
    800032a4:	0014c683          	lbu	a3,1(s1)
    800032a8:	00869693          	slli	a3,a3,0x8
    800032ac:	00e6e733          	or	a4,a3,a4
    800032b0:	0024c683          	lbu	a3,2(s1)
    800032b4:	01069693          	slli	a3,a3,0x10
    800032b8:	00e6e6b3          	or	a3,a3,a4
    800032bc:	0034c703          	lbu	a4,3(s1)
    800032c0:	01871713          	slli	a4,a4,0x18
    800032c4:	00d766b3          	or	a3,a4,a3
    800032c8:	0044c703          	lbu	a4,4(s1)
    800032cc:	02071713          	slli	a4,a4,0x20
    800032d0:	00d76733          	or	a4,a4,a3
    800032d4:	0054c683          	lbu	a3,5(s1)
    800032d8:	02869693          	slli	a3,a3,0x28
    800032dc:	00e6e733          	or	a4,a3,a4
    800032e0:	0064c683          	lbu	a3,6(s1)
    800032e4:	03069693          	slli	a3,a3,0x30
    800032e8:	00e6e6b3          	or	a3,a3,a4
    800032ec:	0074c703          	lbu	a4,7(s1)
    800032f0:	03871713          	slli	a4,a4,0x38
    800032f4:	00d76733          	or	a4,a4,a3
    800032f8:	00d78023          	sb	a3,0(a5)
    800032fc:	00875693          	srli	a3,a4,0x8
    80003300:	00d780a3          	sb	a3,1(a5)
    80003304:	01075693          	srli	a3,a4,0x10
    80003308:	00d78123          	sb	a3,2(a5)
    8000330c:	0187569b          	srliw	a3,a4,0x18
    80003310:	00d781a3          	sb	a3,3(a5)
    80003314:	02075693          	srli	a3,a4,0x20
    80003318:	00d78223          	sb	a3,4(a5)
    8000331c:	02875693          	srli	a3,a4,0x28
    80003320:	00d782a3          	sb	a3,5(a5)
    80003324:	03075693          	srli	a3,a4,0x30
    80003328:	00d78323          	sb	a3,6(a5)
    8000332c:	03875713          	srli	a4,a4,0x38
    80003330:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003334:	0004c783          	lbu	a5,0(s1)
    80003338:	0014c703          	lbu	a4,1(s1)
    8000333c:	00871713          	slli	a4,a4,0x8
    80003340:	00f76733          	or	a4,a4,a5
    80003344:	0024c783          	lbu	a5,2(s1)
    80003348:	01079793          	slli	a5,a5,0x10
    8000334c:	00e7e733          	or	a4,a5,a4
    80003350:	0034c783          	lbu	a5,3(s1)
    80003354:	01879793          	slli	a5,a5,0x18
    80003358:	00e7e7b3          	or	a5,a5,a4
    8000335c:	0044c703          	lbu	a4,4(s1)
    80003360:	02071713          	slli	a4,a4,0x20
    80003364:	00f767b3          	or	a5,a4,a5
    80003368:	0054c703          	lbu	a4,5(s1)
    8000336c:	02871713          	slli	a4,a4,0x28
    80003370:	00f76733          	or	a4,a4,a5
    80003374:	0064c783          	lbu	a5,6(s1)
    80003378:	03079793          	slli	a5,a5,0x30
    8000337c:	00e7e733          	or	a4,a5,a4
    80003380:	0074c783          	lbu	a5,7(s1)
    80003384:	03879793          	slli	a5,a5,0x38
    80003388:	00e7e7b3          	or	a5,a5,a4
    8000338c:	08078c63          	beqz	a5,80003424 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003390:	0084c703          	lbu	a4,8(s1)
    80003394:	0094c683          	lbu	a3,9(s1)
    80003398:	00869693          	slli	a3,a3,0x8
    8000339c:	00e6e733          	or	a4,a3,a4
    800033a0:	00a4c683          	lbu	a3,10(s1)
    800033a4:	01069693          	slli	a3,a3,0x10
    800033a8:	00e6e6b3          	or	a3,a3,a4
    800033ac:	00b4c703          	lbu	a4,11(s1)
    800033b0:	01871713          	slli	a4,a4,0x18
    800033b4:	00d766b3          	or	a3,a4,a3
    800033b8:	00c4c703          	lbu	a4,12(s1)
    800033bc:	02071713          	slli	a4,a4,0x20
    800033c0:	00d76733          	or	a4,a4,a3
    800033c4:	00d4c683          	lbu	a3,13(s1)
    800033c8:	02869693          	slli	a3,a3,0x28
    800033cc:	00e6e733          	or	a4,a3,a4
    800033d0:	00e4c683          	lbu	a3,14(s1)
    800033d4:	03069693          	slli	a3,a3,0x30
    800033d8:	00e6e6b3          	or	a3,a3,a4
    800033dc:	00f4c703          	lbu	a4,15(s1)
    800033e0:	03871713          	slli	a4,a4,0x38
    800033e4:	00d76733          	or	a4,a4,a3
    800033e8:	00d78423          	sb	a3,8(a5)
    800033ec:	00875693          	srli	a3,a4,0x8
    800033f0:	00d784a3          	sb	a3,9(a5)
    800033f4:	01075693          	srli	a3,a4,0x10
    800033f8:	00d78523          	sb	a3,10(a5)
    800033fc:	0187569b          	srliw	a3,a4,0x18
    80003400:	00d785a3          	sb	a3,11(a5)
    80003404:	02075693          	srli	a3,a4,0x20
    80003408:	00d78623          	sb	a3,12(a5)
    8000340c:	02875693          	srli	a3,a4,0x28
    80003410:	00d786a3          	sb	a3,13(a5)
    80003414:	03075693          	srli	a3,a4,0x30
    80003418:	00d78723          	sb	a3,14(a5)
    8000341c:	03875713          	srli	a4,a4,0x38
    80003420:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    80003424:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80003428:	00048513          	mv	a0,s1
    8000342c:	02813083          	ld	ra,40(sp)
    80003430:	02013403          	ld	s0,32(sp)
    80003434:	01813483          	ld	s1,24(sp)
    80003438:	01013903          	ld	s2,16(sp)
    8000343c:	00813983          	ld	s3,8(sp)
    80003440:	03010113          	addi	sp,sp,48
    80003444:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80003448:	0004c703          	lbu	a4,0(s1)
    8000344c:	0014c783          	lbu	a5,1(s1)
    80003450:	00879793          	slli	a5,a5,0x8
    80003454:	00e7e7b3          	or	a5,a5,a4
    80003458:	0024c703          	lbu	a4,2(s1)
    8000345c:	01071713          	slli	a4,a4,0x10
    80003460:	00f76733          	or	a4,a4,a5
    80003464:	0034c783          	lbu	a5,3(s1)
    80003468:	01879793          	slli	a5,a5,0x18
    8000346c:	00e7e733          	or	a4,a5,a4
    80003470:	0044c783          	lbu	a5,4(s1)
    80003474:	02079793          	slli	a5,a5,0x20
    80003478:	00e7e7b3          	or	a5,a5,a4
    8000347c:	0054c703          	lbu	a4,5(s1)
    80003480:	02871713          	slli	a4,a4,0x28
    80003484:	00f76733          	or	a4,a4,a5
    80003488:	0064c783          	lbu	a5,6(s1)
    8000348c:	03079793          	slli	a5,a5,0x30
    80003490:	00e7e733          	or	a4,a5,a4
    80003494:	0074c783          	lbu	a5,7(s1)
    80003498:	03879793          	slli	a5,a5,0x38
    8000349c:	00e7e7b3          	or	a5,a5,a4
    800034a0:	00f9b023          	sd	a5,0(s3)
    800034a4:	da1ff06f          	j	80003244 <_ZN11HeapManager12heapAllocateEm+0x3f4>

00000000800034a8 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    800034a8:	ff010113          	addi	sp,sp,-16
    800034ac:	00813423          	sd	s0,8(sp)
    800034b0:	01010413          	addi	s0,sp,16
    //     if(pFree->pNext != 0){
    //         pFree->pNext->pPrev = pFree;
    //     }
    // }
    return 0;
}
    800034b4:	00000513          	li	a0,0
    800034b8:	00813403          	ld	s0,8(sp)
    800034bc:	01010113          	addi	sp,sp,16
    800034c0:	00008067          	ret

00000000800034c4 <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"
#include "assert.h"

extern "C" void exceptionHandler(){
    800034c4:	fc010113          	addi	sp,sp,-64
    800034c8:	02113c23          	sd	ra,56(sp)
    800034cc:	02813823          	sd	s0,48(sp)
    800034d0:	02913423          	sd	s1,40(sp)
    800034d4:	03213023          	sd	s2,32(sp)
    800034d8:	01313c23          	sd	s3,24(sp)
    800034dc:	01413823          	sd	s4,16(sp)
    800034e0:	01513423          	sd	s5,8(sp)
    800034e4:	01613023          	sd	s6,0(sp)
    800034e8:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    800034ec:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    800034f0:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    800034f4:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    800034f8:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    800034fc:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80003500:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80003504:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80003508:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    8000350c:	ff870613          	addi	a2,a4,-8
    80003510:	00100693          	li	a3,1
    80003514:	04c6f463          	bgeu	a3,a2,8000355c <exceptionHandler+0x98>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    80003518:	00500793          	li	a5,5
    8000351c:	20f70e63          	beq	a4,a5,80003738 <exceptionHandler+0x274>
                __putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    80003520:	00700793          	li	a5,7
    80003524:	3cf70863          	beq	a4,a5,800038f4 <exceptionHandler+0x430>
                __putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    80003528:	fff00793          	li	a5,-1
    8000352c:	03f79793          	slli	a5,a5,0x3f
    80003530:	00178793          	addi	a5,a5,1
    80003534:	58f70463          	beq	a4,a5,80003abc <exceptionHandler+0x5f8>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    80003538:	fff00793          	li	a5,-1
    8000353c:	03f79793          	slli	a5,a5,0x3f
    80003540:	00978793          	addi	a5,a5,9
    80003544:	08f71863          	bne	a4,a5,800035d4 <exceptionHandler+0x110>
    {   
        int irq = plic_claim();
    80003548:	00001097          	auipc	ra,0x1
    8000354c:	23c080e7          	jalr	572(ra) # 80004784 <plic_claim>
        // if(irq == CONSOLE_IRQ)Console::console_handler();
        plic_complete(irq);
    80003550:	00001097          	auipc	ra,0x1
    80003554:	26c080e7          	jalr	620(ra) # 800047bc <plic_complete>
    80003558:	07c0006f          	j	800035d4 <exceptionHandler+0x110>
        switch(a0){
    8000355c:	04200713          	li	a4,66
    80003560:	02f76463          	bltu	a4,a5,80003588 <exceptionHandler+0xc4>
    80003564:	1c078263          	beqz	a5,80003728 <exceptionHandler+0x264>
    80003568:	1cf76463          	bltu	a4,a5,80003730 <exceptionHandler+0x26c>
    8000356c:	00279793          	slli	a5,a5,0x2
    80003570:	00004717          	auipc	a4,0x4
    80003574:	cc470713          	addi	a4,a4,-828 # 80007234 <CONSOLE_STATUS+0x224>
    80003578:	00e787b3          	add	a5,a5,a4
    8000357c:	0007a783          	lw	a5,0(a5)
    80003580:	00e787b3          	add	a5,a5,a4
    80003584:	00078067          	jr	a5
    80003588:	0ff00713          	li	a4,255
    8000358c:	02e79663          	bne	a5,a4,800035b8 <exceptionHandler+0xf4>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80003590:	00000793          	li	a5,0
    80003594:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80003598:	00448493          	addi	s1,s1,4
    8000359c:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800035a0:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    800035a4:	10000793          	li	a5,256
    800035a8:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800035ac:	00200793          	li	a5,2
    800035b0:	1447b073          	csrc	sip,a5
                return;
    800035b4:	0200006f          	j	800035d4 <exceptionHandler+0x110>
        switch(a0){
    800035b8:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800035bc:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800035c0:	00448493          	addi	s1,s1,4
    800035c4:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800035c8:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800035cc:	00200793          	li	a5,2
    800035d0:	1447b073          	csrc	sip,a5
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    800035d4:	03813083          	ld	ra,56(sp)
    800035d8:	03013403          	ld	s0,48(sp)
    800035dc:	02813483          	ld	s1,40(sp)
    800035e0:	02013903          	ld	s2,32(sp)
    800035e4:	01813983          	ld	s3,24(sp)
    800035e8:	01013a03          	ld	s4,16(sp)
    800035ec:	00813a83          	ld	s5,8(sp)
    800035f0:	00013b03          	ld	s6,0(sp)
    800035f4:	04010113          	addi	sp,sp,64
    800035f8:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    800035fc:	00098593          	mv	a1,s3
    80003600:	00005797          	auipc	a5,0x5
    80003604:	ab07b783          	ld	a5,-1360(a5) # 800080b0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003608:	0007b503          	ld	a0,0(a5)
    8000360c:	00000097          	auipc	ra,0x0
    80003610:	844080e7          	jalr	-1980(ra) # 80002e50 <_ZN11HeapManager12heapAllocateEm>
                break;
    80003614:	fa9ff06f          	j	800035bc <exceptionHandler+0xf8>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    80003618:	00098593          	mv	a1,s3
    8000361c:	00005797          	auipc	a5,0x5
    80003620:	a947b783          	ld	a5,-1388(a5) # 800080b0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003624:	0007b503          	ld	a0,0(a5)
    80003628:	00000097          	auipc	ra,0x0
    8000362c:	e80080e7          	jalr	-384(ra) # 800034a8 <_ZN11HeapManager8heapFreeEPv>
                break;
    80003630:	f8dff06f          	j	800035bc <exceptionHandler+0xf8>
                __putc('\0'); /// removing this line causes everything to break
    80003634:	00000513          	li	a0,0
    80003638:	00003097          	auipc	ra,0x3
    8000363c:	9b4080e7          	jalr	-1612(ra) # 80005fec <__putc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    80003640:	00100713          	li	a4,1
    80003644:	000b0693          	mv	a3,s6
    80003648:	000a8613          	mv	a2,s5
    8000364c:	000a0593          	mv	a1,s4
    80003650:	00098513          	mv	a0,s3
    80003654:	fffff097          	auipc	ra,0xfffff
    80003658:	ec4080e7          	jalr	-316(ra) # 80002518 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    8000365c:	f61ff06f          	j	800035bc <exceptionHandler+0xf8>
                returnVal = _thread::currentThread->exit();
    80003660:	fffff097          	auipc	ra,0xfffff
    80003664:	248080e7          	jalr	584(ra) # 800028a8 <_ZN7_thread4exitEv>
                break;
    80003668:	f55ff06f          	j	800035bc <exceptionHandler+0xf8>
                _thread::dispatch();
    8000366c:	fffff097          	auipc	ra,0xfffff
    80003670:	44c080e7          	jalr	1100(ra) # 80002ab8 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80003674:	00000513          	li	a0,0
                break;
    80003678:	f45ff06f          	j	800035bc <exceptionHandler+0xf8>
                _thread::currentThread->join((thread_t)a1);
    8000367c:	00098593          	mv	a1,s3
    80003680:	00005797          	auipc	a5,0x5
    80003684:	a507b783          	ld	a5,-1456(a5) # 800080d0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003688:	0007b503          	ld	a0,0(a5)
    8000368c:	fffff097          	auipc	ra,0xfffff
    80003690:	05c080e7          	jalr	92(ra) # 800026e8 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80003694:	00000513          	li	a0,0
                break;
    80003698:	f25ff06f          	j	800035bc <exceptionHandler+0xf8>
                _sem::open((sem_t*)a1, unsigned(a2));
    8000369c:	000a059b          	sext.w	a1,s4
    800036a0:	00098513          	mv	a0,s3
    800036a4:	ffffe097          	auipc	ra,0xffffe
    800036a8:	f80080e7          	jalr	-128(ra) # 80001624 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    800036ac:	00000513          	li	a0,0
                break;
    800036b0:	f0dff06f          	j	800035bc <exceptionHandler+0xf8>
                _sem::close((sem_t)a1);
    800036b4:	00098513          	mv	a0,s3
    800036b8:	ffffe097          	auipc	ra,0xffffe
    800036bc:	fc8080e7          	jalr	-56(ra) # 80001680 <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    800036c0:	00000513          	li	a0,0
                break;
    800036c4:	ef9ff06f          	j	800035bc <exceptionHandler+0xf8>
                _sem::wait((sem_t)a1);
    800036c8:	00098513          	mv	a0,s3
    800036cc:	ffffe097          	auipc	ra,0xffffe
    800036d0:	008080e7          	jalr	8(ra) # 800016d4 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    800036d4:	00000513          	li	a0,0
                break;
    800036d8:	ee5ff06f          	j	800035bc <exceptionHandler+0xf8>
                _sem::signal((sem_t)a1);
    800036dc:	00098513          	mv	a0,s3
    800036e0:	ffffe097          	auipc	ra,0xffffe
    800036e4:	098080e7          	jalr	152(ra) # 80001778 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    800036e8:	00000513          	li	a0,0
                break;
    800036ec:	ed1ff06f          	j	800035bc <exceptionHandler+0xf8>
                returnVal = Timer::getInstance().sleep(a1);
    800036f0:	ffffe097          	auipc	ra,0xffffe
    800036f4:	aa8080e7          	jalr	-1368(ra) # 80001198 <_ZN5Timer11getInstanceEv>
    800036f8:	00098593          	mv	a1,s3
    800036fc:	ffffe097          	auipc	ra,0xffffe
    80003700:	be4080e7          	jalr	-1052(ra) # 800012e0 <_ZN5Timer5sleepEm>
                break;
    80003704:	eb9ff06f          	j	800035bc <exceptionHandler+0xf8>
                returnVal = __getc();
    80003708:	00003097          	auipc	ra,0x3
    8000370c:	920080e7          	jalr	-1760(ra) # 80006028 <__getc>
                break;
    80003710:	eadff06f          	j	800035bc <exceptionHandler+0xf8>
                __putc(a1);
    80003714:	0ff9f513          	andi	a0,s3,255
    80003718:	00003097          	auipc	ra,0x3
    8000371c:	8d4080e7          	jalr	-1836(ra) # 80005fec <__putc>
    uint64 returnVal = 0;
    80003720:	00000513          	li	a0,0
                break;
    80003724:	e99ff06f          	j	800035bc <exceptionHandler+0xf8>
        switch(a0){
    80003728:	00000513          	li	a0,0
    8000372c:	e91ff06f          	j	800035bc <exceptionHandler+0xf8>
    80003730:	00000513          	li	a0,0
    80003734:	e89ff06f          	j	800035bc <exceptionHandler+0xf8>
        __putc('\n');
    80003738:	00a00513          	li	a0,10
    8000373c:	00003097          	auipc	ra,0x3
    80003740:	8b0080e7          	jalr	-1872(ra) # 80005fec <__putc>
        __putc('E');
    80003744:	04500513          	li	a0,69
    80003748:	00003097          	auipc	ra,0x3
    8000374c:	8a4080e7          	jalr	-1884(ra) # 80005fec <__putc>
        __putc('r');
    80003750:	07200513          	li	a0,114
    80003754:	00003097          	auipc	ra,0x3
    80003758:	898080e7          	jalr	-1896(ra) # 80005fec <__putc>
        __putc('r');
    8000375c:	07200513          	li	a0,114
    80003760:	00003097          	auipc	ra,0x3
    80003764:	88c080e7          	jalr	-1908(ra) # 80005fec <__putc>
        __putc('o');
    80003768:	06f00513          	li	a0,111
    8000376c:	00003097          	auipc	ra,0x3
    80003770:	880080e7          	jalr	-1920(ra) # 80005fec <__putc>
        __putc('r');
    80003774:	07200513          	li	a0,114
    80003778:	00003097          	auipc	ra,0x3
    8000377c:	874080e7          	jalr	-1932(ra) # 80005fec <__putc>
        __putc(':');
    80003780:	03a00513          	li	a0,58
    80003784:	00003097          	auipc	ra,0x3
    80003788:	868080e7          	jalr	-1944(ra) # 80005fec <__putc>
        __putc(' ');
    8000378c:	02000513          	li	a0,32
    80003790:	00003097          	auipc	ra,0x3
    80003794:	85c080e7          	jalr	-1956(ra) # 80005fec <__putc>
        __putc('i');
    80003798:	06900513          	li	a0,105
    8000379c:	00003097          	auipc	ra,0x3
    800037a0:	850080e7          	jalr	-1968(ra) # 80005fec <__putc>
        __putc('l');
    800037a4:	06c00513          	li	a0,108
    800037a8:	00003097          	auipc	ra,0x3
    800037ac:	844080e7          	jalr	-1980(ra) # 80005fec <__putc>
        __putc('l');
    800037b0:	06c00513          	li	a0,108
    800037b4:	00003097          	auipc	ra,0x3
    800037b8:	838080e7          	jalr	-1992(ra) # 80005fec <__putc>
        __putc('e');
    800037bc:	06500513          	li	a0,101
    800037c0:	00003097          	auipc	ra,0x3
    800037c4:	82c080e7          	jalr	-2004(ra) # 80005fec <__putc>
        __putc('g');
    800037c8:	06700513          	li	a0,103
    800037cc:	00003097          	auipc	ra,0x3
    800037d0:	820080e7          	jalr	-2016(ra) # 80005fec <__putc>
        __putc('a');
    800037d4:	06100513          	li	a0,97
    800037d8:	00003097          	auipc	ra,0x3
    800037dc:	814080e7          	jalr	-2028(ra) # 80005fec <__putc>
        __putc('l');
    800037e0:	06c00513          	li	a0,108
    800037e4:	00003097          	auipc	ra,0x3
    800037e8:	808080e7          	jalr	-2040(ra) # 80005fec <__putc>
        __putc(' ');
    800037ec:	02000513          	li	a0,32
    800037f0:	00002097          	auipc	ra,0x2
    800037f4:	7fc080e7          	jalr	2044(ra) # 80005fec <__putc>
        __putc('r');
    800037f8:	07200513          	li	a0,114
    800037fc:	00002097          	auipc	ra,0x2
    80003800:	7f0080e7          	jalr	2032(ra) # 80005fec <__putc>
        __putc('e');
    80003804:	06500513          	li	a0,101
    80003808:	00002097          	auipc	ra,0x2
    8000380c:	7e4080e7          	jalr	2020(ra) # 80005fec <__putc>
        __putc('a');
    80003810:	06100513          	li	a0,97
    80003814:	00002097          	auipc	ra,0x2
    80003818:	7d8080e7          	jalr	2008(ra) # 80005fec <__putc>
        __putc('d');
    8000381c:	06400513          	li	a0,100
    80003820:	00002097          	auipc	ra,0x2
    80003824:	7cc080e7          	jalr	1996(ra) # 80005fec <__putc>
        __putc('!');
    80003828:	02100513          	li	a0,33
    8000382c:	00002097          	auipc	ra,0x2
    80003830:	7c0080e7          	jalr	1984(ra) # 80005fec <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80003834:	14102973          	csrr	s2,sepc
        __putc('\n');
    80003838:	00a00513          	li	a0,10
    8000383c:	00002097          	auipc	ra,0x2
    80003840:	7b0080e7          	jalr	1968(ra) # 80005fec <__putc>
        __putc('P');
    80003844:	05000513          	li	a0,80
    80003848:	00002097          	auipc	ra,0x2
    8000384c:	7a4080e7          	jalr	1956(ra) # 80005fec <__putc>
        __putc('C');
    80003850:	04300513          	li	a0,67
    80003854:	00002097          	auipc	ra,0x2
    80003858:	798080e7          	jalr	1944(ra) # 80005fec <__putc>
        __putc(':');
    8000385c:	03a00513          	li	a0,58
    80003860:	00002097          	auipc	ra,0x2
    80003864:	78c080e7          	jalr	1932(ra) # 80005fec <__putc>
        __putc(' ');
    80003868:	02000513          	li	a0,32
    8000386c:	00002097          	auipc	ra,0x2
    80003870:	780080e7          	jalr	1920(ra) # 80005fec <__putc>
        __putc('0');
    80003874:	03000513          	li	a0,48
    80003878:	00002097          	auipc	ra,0x2
    8000387c:	774080e7          	jalr	1908(ra) # 80005fec <__putc>
        __putc('x');
    80003880:	07800513          	li	a0,120
    80003884:	00002097          	auipc	ra,0x2
    80003888:	768080e7          	jalr	1896(ra) # 80005fec <__putc>
        for(int i = 15; i >= 0; i--){
    8000388c:	00f00493          	li	s1,15
    80003890:	0140006f          	j	800038a4 <exceptionHandler+0x3e0>
                __putc('A' + tmp - 10);
    80003894:	03750513          	addi	a0,a0,55
    80003898:	00002097          	auipc	ra,0x2
    8000389c:	754080e7          	jalr	1876(ra) # 80005fec <__putc>
        for(int i = 15; i >= 0; i--){
    800038a0:	fff4849b          	addiw	s1,s1,-1
    800038a4:	0204c463          	bltz	s1,800038cc <exceptionHandler+0x408>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    800038a8:	0024951b          	slliw	a0,s1,0x2
    800038ac:	00a95533          	srl	a0,s2,a0
    800038b0:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    800038b4:	00900793          	li	a5,9
    800038b8:	fca7eee3          	bltu	a5,a0,80003894 <exceptionHandler+0x3d0>
                __putc('0' + tmp);
    800038bc:	03050513          	addi	a0,a0,48
    800038c0:	00002097          	auipc	ra,0x2
    800038c4:	72c080e7          	jalr	1836(ra) # 80005fec <__putc>
    800038c8:	fd9ff06f          	j	800038a0 <exceptionHandler+0x3dc>
        assert(false);
    800038cc:	00004697          	auipc	a3,0x4
    800038d0:	90468693          	addi	a3,a3,-1788 # 800071d0 <CONSOLE_STATUS+0x1c0>
    800038d4:	08600613          	li	a2,134
    800038d8:	00004597          	auipc	a1,0x4
    800038dc:	91058593          	addi	a1,a1,-1776 # 800071e8 <CONSOLE_STATUS+0x1d8>
    800038e0:	00004517          	auipc	a0,0x4
    800038e4:	92850513          	addi	a0,a0,-1752 # 80007208 <CONSOLE_STATUS+0x1f8>
    800038e8:	ffffe097          	auipc	ra,0xffffe
    800038ec:	fc0080e7          	jalr	-64(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    800038f0:	ce5ff06f          	j	800035d4 <exceptionHandler+0x110>
        __putc('\n');
    800038f4:	00a00513          	li	a0,10
    800038f8:	00002097          	auipc	ra,0x2
    800038fc:	6f4080e7          	jalr	1780(ra) # 80005fec <__putc>
        __putc('E');
    80003900:	04500513          	li	a0,69
    80003904:	00002097          	auipc	ra,0x2
    80003908:	6e8080e7          	jalr	1768(ra) # 80005fec <__putc>
        __putc('r');
    8000390c:	07200513          	li	a0,114
    80003910:	00002097          	auipc	ra,0x2
    80003914:	6dc080e7          	jalr	1756(ra) # 80005fec <__putc>
        __putc('r');
    80003918:	07200513          	li	a0,114
    8000391c:	00002097          	auipc	ra,0x2
    80003920:	6d0080e7          	jalr	1744(ra) # 80005fec <__putc>
        __putc('o');
    80003924:	06f00513          	li	a0,111
    80003928:	00002097          	auipc	ra,0x2
    8000392c:	6c4080e7          	jalr	1732(ra) # 80005fec <__putc>
        __putc('r');
    80003930:	07200513          	li	a0,114
    80003934:	00002097          	auipc	ra,0x2
    80003938:	6b8080e7          	jalr	1720(ra) # 80005fec <__putc>
        __putc(':');
    8000393c:	03a00513          	li	a0,58
    80003940:	00002097          	auipc	ra,0x2
    80003944:	6ac080e7          	jalr	1708(ra) # 80005fec <__putc>
        __putc(' ');
    80003948:	02000513          	li	a0,32
    8000394c:	00002097          	auipc	ra,0x2
    80003950:	6a0080e7          	jalr	1696(ra) # 80005fec <__putc>
        __putc('i');
    80003954:	06900513          	li	a0,105
    80003958:	00002097          	auipc	ra,0x2
    8000395c:	694080e7          	jalr	1684(ra) # 80005fec <__putc>
        __putc('l');
    80003960:	06c00513          	li	a0,108
    80003964:	00002097          	auipc	ra,0x2
    80003968:	688080e7          	jalr	1672(ra) # 80005fec <__putc>
        __putc('l');
    8000396c:	06c00513          	li	a0,108
    80003970:	00002097          	auipc	ra,0x2
    80003974:	67c080e7          	jalr	1660(ra) # 80005fec <__putc>
        __putc('e');
    80003978:	06500513          	li	a0,101
    8000397c:	00002097          	auipc	ra,0x2
    80003980:	670080e7          	jalr	1648(ra) # 80005fec <__putc>
        __putc('g');
    80003984:	06700513          	li	a0,103
    80003988:	00002097          	auipc	ra,0x2
    8000398c:	664080e7          	jalr	1636(ra) # 80005fec <__putc>
        __putc('a');
    80003990:	06100513          	li	a0,97
    80003994:	00002097          	auipc	ra,0x2
    80003998:	658080e7          	jalr	1624(ra) # 80005fec <__putc>
        __putc('l');
    8000399c:	06c00513          	li	a0,108
    800039a0:	00002097          	auipc	ra,0x2
    800039a4:	64c080e7          	jalr	1612(ra) # 80005fec <__putc>
        __putc(' ');
    800039a8:	02000513          	li	a0,32
    800039ac:	00002097          	auipc	ra,0x2
    800039b0:	640080e7          	jalr	1600(ra) # 80005fec <__putc>
        __putc('w');
    800039b4:	07700513          	li	a0,119
    800039b8:	00002097          	auipc	ra,0x2
    800039bc:	634080e7          	jalr	1588(ra) # 80005fec <__putc>
        __putc('r');
    800039c0:	07200513          	li	a0,114
    800039c4:	00002097          	auipc	ra,0x2
    800039c8:	628080e7          	jalr	1576(ra) # 80005fec <__putc>
        __putc('i');
    800039cc:	06900513          	li	a0,105
    800039d0:	00002097          	auipc	ra,0x2
    800039d4:	61c080e7          	jalr	1564(ra) # 80005fec <__putc>
        __putc('t');
    800039d8:	07400513          	li	a0,116
    800039dc:	00002097          	auipc	ra,0x2
    800039e0:	610080e7          	jalr	1552(ra) # 80005fec <__putc>
        __putc('e');
    800039e4:	06500513          	li	a0,101
    800039e8:	00002097          	auipc	ra,0x2
    800039ec:	604080e7          	jalr	1540(ra) # 80005fec <__putc>
        __putc('!');
    800039f0:	02100513          	li	a0,33
    800039f4:	00002097          	auipc	ra,0x2
    800039f8:	5f8080e7          	jalr	1528(ra) # 80005fec <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    800039fc:	14102973          	csrr	s2,sepc
        __putc('\n');
    80003a00:	00a00513          	li	a0,10
    80003a04:	00002097          	auipc	ra,0x2
    80003a08:	5e8080e7          	jalr	1512(ra) # 80005fec <__putc>
        __putc('P');
    80003a0c:	05000513          	li	a0,80
    80003a10:	00002097          	auipc	ra,0x2
    80003a14:	5dc080e7          	jalr	1500(ra) # 80005fec <__putc>
        __putc('C');
    80003a18:	04300513          	li	a0,67
    80003a1c:	00002097          	auipc	ra,0x2
    80003a20:	5d0080e7          	jalr	1488(ra) # 80005fec <__putc>
        __putc(':');
    80003a24:	03a00513          	li	a0,58
    80003a28:	00002097          	auipc	ra,0x2
    80003a2c:	5c4080e7          	jalr	1476(ra) # 80005fec <__putc>
        __putc(' ');
    80003a30:	02000513          	li	a0,32
    80003a34:	00002097          	auipc	ra,0x2
    80003a38:	5b8080e7          	jalr	1464(ra) # 80005fec <__putc>
        __putc('0');
    80003a3c:	03000513          	li	a0,48
    80003a40:	00002097          	auipc	ra,0x2
    80003a44:	5ac080e7          	jalr	1452(ra) # 80005fec <__putc>
        __putc('x');
    80003a48:	07800513          	li	a0,120
    80003a4c:	00002097          	auipc	ra,0x2
    80003a50:	5a0080e7          	jalr	1440(ra) # 80005fec <__putc>
        for(int i = 15; i >= 0; i--){
    80003a54:	00f00493          	li	s1,15
    80003a58:	0140006f          	j	80003a6c <exceptionHandler+0x5a8>
                __putc('A' + tmp - 10);
    80003a5c:	03750513          	addi	a0,a0,55
    80003a60:	00002097          	auipc	ra,0x2
    80003a64:	58c080e7          	jalr	1420(ra) # 80005fec <__putc>
        for(int i = 15; i >= 0; i--){
    80003a68:	fff4849b          	addiw	s1,s1,-1
    80003a6c:	0204c463          	bltz	s1,80003a94 <exceptionHandler+0x5d0>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    80003a70:	0024951b          	slliw	a0,s1,0x2
    80003a74:	00a95533          	srl	a0,s2,a0
    80003a78:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80003a7c:	00900793          	li	a5,9
    80003a80:	fca7eee3          	bltu	a5,a0,80003a5c <exceptionHandler+0x598>
                __putc('0' + tmp);
    80003a84:	03050513          	addi	a0,a0,48
    80003a88:	00002097          	auipc	ra,0x2
    80003a8c:	564080e7          	jalr	1380(ra) # 80005fec <__putc>
    80003a90:	fd9ff06f          	j	80003a68 <exceptionHandler+0x5a4>
        assert(false);
    80003a94:	00003697          	auipc	a3,0x3
    80003a98:	73c68693          	addi	a3,a3,1852 # 800071d0 <CONSOLE_STATUS+0x1c0>
    80003a9c:	0b000613          	li	a2,176
    80003aa0:	00003597          	auipc	a1,0x3
    80003aa4:	74858593          	addi	a1,a1,1864 # 800071e8 <CONSOLE_STATUS+0x1d8>
    80003aa8:	00003517          	auipc	a0,0x3
    80003aac:	76050513          	addi	a0,a0,1888 # 80007208 <CONSOLE_STATUS+0x1f8>
    80003ab0:	ffffe097          	auipc	ra,0xffffe
    80003ab4:	df8080e7          	jalr	-520(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80003ab8:	b1dff06f          	j	800035d4 <exceptionHandler+0x110>
        Timer::getInstance().tick();
    80003abc:	ffffd097          	auipc	ra,0xffffd
    80003ac0:	6dc080e7          	jalr	1756(ra) # 80001198 <_ZN5Timer11getInstanceEv>
    80003ac4:	ffffd097          	auipc	ra,0xffffd
    80003ac8:	738080e7          	jalr	1848(ra) # 800011fc <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    80003acc:	00004797          	auipc	a5,0x4
    80003ad0:	6047b783          	ld	a5,1540(a5) # 800080d0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003ad4:	0007b503          	ld	a0,0(a5)
    80003ad8:	fffff097          	auipc	ra,0xfffff
    80003adc:	d40080e7          	jalr	-704(ra) # 80002818 <_ZN7_thread4tickEv>
    80003ae0:	00051c63          	bnez	a0,80003af8 <exceptionHandler+0x634>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80003ae4:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003ae8:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003aec:	00200793          	li	a5,2
    80003af0:	1447b073          	csrc	sip,a5
    80003af4:	ae1ff06f          	j	800035d4 <exceptionHandler+0x110>
        assert(_thread::currentThread->tick() == 0);
    80003af8:	00003697          	auipc	a3,0x3
    80003afc:	6d868693          	addi	a3,a3,1752 # 800071d0 <CONSOLE_STATUS+0x1c0>
    80003b00:	0b400613          	li	a2,180
    80003b04:	00003597          	auipc	a1,0x3
    80003b08:	6e458593          	addi	a1,a1,1764 # 800071e8 <CONSOLE_STATUS+0x1d8>
    80003b0c:	00003517          	auipc	a0,0x3
    80003b10:	70450513          	addi	a0,a0,1796 # 80007210 <CONSOLE_STATUS+0x200>
    80003b14:	ffffe097          	auipc	ra,0xffffe
    80003b18:	d94080e7          	jalr	-620(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80003b1c:	fc9ff06f          	j	80003ae4 <exceptionHandler+0x620>

0000000080003b20 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80003b20:	fe010113          	addi	sp,sp,-32
    80003b24:	00113c23          	sd	ra,24(sp)
    80003b28:	00813823          	sd	s0,16(sp)
    80003b2c:	00913423          	sd	s1,8(sp)
    80003b30:	02010413          	addi	s0,sp,32
    80003b34:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80003b38:	00004797          	auipc	a5,0x4
    80003b3c:	6307b783          	ld	a5,1584(a5) # 80008168 <_ZN9Scheduler9singletonE>
    80003b40:	02079463          	bnez	a5,80003b68 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80003b44:	00004797          	auipc	a5,0x4
    80003b48:	6297b223          	sd	s1,1572(a5) # 80008168 <_ZN9Scheduler9singletonE>
    head = 0;
    80003b4c:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80003b50:	0004b423          	sd	zero,8(s1)
}
    80003b54:	01813083          	ld	ra,24(sp)
    80003b58:	01013403          	ld	s0,16(sp)
    80003b5c:	00813483          	ld	s1,8(sp)
    80003b60:	02010113          	addi	sp,sp,32
    80003b64:	00008067          	ret
    assert(singleton == 0);
    80003b68:	00003697          	auipc	a3,0x3
    80003b6c:	7d868693          	addi	a3,a3,2008 # 80007340 <CONSOLE_STATUS+0x330>
    80003b70:	01800613          	li	a2,24
    80003b74:	00003597          	auipc	a1,0x3
    80003b78:	7e458593          	addi	a1,a1,2020 # 80007358 <CONSOLE_STATUS+0x348>
    80003b7c:	00003517          	auipc	a0,0x3
    80003b80:	7ec50513          	addi	a0,a0,2028 # 80007368 <CONSOLE_STATUS+0x358>
    80003b84:	ffffe097          	auipc	ra,0xffffe
    80003b88:	d24080e7          	jalr	-732(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80003b8c:	fb9ff06f          	j	80003b44 <_ZN9SchedulerC1Ev+0x24>

0000000080003b90 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80003b90:	ff010113          	addi	sp,sp,-16
    80003b94:	00813423          	sd	s0,8(sp)
    80003b98:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80003b9c:	00004797          	auipc	a5,0x4
    80003ba0:	5cc7b783          	ld	a5,1484(a5) # 80008168 <_ZN9Scheduler9singletonE>
    80003ba4:	0007b503          	ld	a0,0(a5)
}
    80003ba8:	00153513          	seqz	a0,a0
    80003bac:	00813403          	ld	s0,8(sp)
    80003bb0:	01010113          	addi	sp,sp,16
    80003bb4:	00008067          	ret

0000000080003bb8 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80003bb8:	fe010113          	addi	sp,sp,-32
    80003bbc:	00113c23          	sd	ra,24(sp)
    80003bc0:	00813823          	sd	s0,16(sp)
    80003bc4:	00913423          	sd	s1,8(sp)
    80003bc8:	01213023          	sd	s2,0(sp)
    80003bcc:	02010413          	addi	s0,sp,32
    80003bd0:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80003bd4:	00004917          	auipc	s2,0x4
    80003bd8:	59493903          	ld	s2,1428(s2) # 80008168 <_ZN9Scheduler9singletonE>
    80003bdc:	00093783          	ld	a5,0(s2)
    80003be0:	12078c63          	beqz	a5,80003d18 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003be4:	00893903          	ld	s2,8(s2)
    80003be8:	01000513          	li	a0,16
    80003bec:	ffffd097          	auipc	ra,0xffffd
    80003bf0:	7c8080e7          	jalr	1992(ra) # 800013b4 <_Z9mem_allocm>
    80003bf4:	00a90423          	sb	a0,8(s2)
    80003bf8:	00855793          	srli	a5,a0,0x8
    80003bfc:	00f904a3          	sb	a5,9(s2)
    80003c00:	01055793          	srli	a5,a0,0x10
    80003c04:	00f90523          	sb	a5,10(s2)
    80003c08:	0185579b          	srliw	a5,a0,0x18
    80003c0c:	00f905a3          	sb	a5,11(s2)
    80003c10:	02055793          	srli	a5,a0,0x20
    80003c14:	00f90623          	sb	a5,12(s2)
    80003c18:	02855793          	srli	a5,a0,0x28
    80003c1c:	00f906a3          	sb	a5,13(s2)
    80003c20:	03055793          	srli	a5,a0,0x30
    80003c24:	00f90723          	sb	a5,14(s2)
    80003c28:	03855513          	srli	a0,a0,0x38
    80003c2c:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80003c30:	00004617          	auipc	a2,0x4
    80003c34:	53860613          	addi	a2,a2,1336 # 80008168 <_ZN9Scheduler9singletonE>
    80003c38:	00063583          	ld	a1,0(a2)
    80003c3c:	0085b703          	ld	a4,8(a1)
    80003c40:	00874783          	lbu	a5,8(a4)
    80003c44:	00974683          	lbu	a3,9(a4)
    80003c48:	00869693          	slli	a3,a3,0x8
    80003c4c:	00f6e6b3          	or	a3,a3,a5
    80003c50:	00a74783          	lbu	a5,10(a4)
    80003c54:	01079793          	slli	a5,a5,0x10
    80003c58:	00d7e6b3          	or	a3,a5,a3
    80003c5c:	00b74783          	lbu	a5,11(a4)
    80003c60:	01879793          	slli	a5,a5,0x18
    80003c64:	00d7e7b3          	or	a5,a5,a3
    80003c68:	00c74683          	lbu	a3,12(a4)
    80003c6c:	02069693          	slli	a3,a3,0x20
    80003c70:	00f6e7b3          	or	a5,a3,a5
    80003c74:	00d74683          	lbu	a3,13(a4)
    80003c78:	02869693          	slli	a3,a3,0x28
    80003c7c:	00f6e6b3          	or	a3,a3,a5
    80003c80:	00e74783          	lbu	a5,14(a4)
    80003c84:	03079793          	slli	a5,a5,0x30
    80003c88:	00d7e6b3          	or	a3,a5,a3
    80003c8c:	00f74783          	lbu	a5,15(a4)
    80003c90:	03879793          	slli	a5,a5,0x38
    80003c94:	00d7e7b3          	or	a5,a5,a3
    80003c98:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80003c9c:	00978023          	sb	s1,0(a5)
    80003ca0:	0084d713          	srli	a4,s1,0x8
    80003ca4:	00e780a3          	sb	a4,1(a5)
    80003ca8:	0104d713          	srli	a4,s1,0x10
    80003cac:	00e78123          	sb	a4,2(a5)
    80003cb0:	0184d71b          	srliw	a4,s1,0x18
    80003cb4:	00e781a3          	sb	a4,3(a5)
    80003cb8:	0204d713          	srli	a4,s1,0x20
    80003cbc:	00e78223          	sb	a4,4(a5)
    80003cc0:	0284d713          	srli	a4,s1,0x28
    80003cc4:	00e782a3          	sb	a4,5(a5)
    80003cc8:	0304d713          	srli	a4,s1,0x30
    80003ccc:	00e78323          	sb	a4,6(a5)
    80003cd0:	0384d493          	srli	s1,s1,0x38
    80003cd4:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80003cd8:	00063783          	ld	a5,0(a2)
    80003cdc:	0087b783          	ld	a5,8(a5)
    80003ce0:	00078423          	sb	zero,8(a5)
    80003ce4:	000784a3          	sb	zero,9(a5)
    80003ce8:	00078523          	sb	zero,10(a5)
    80003cec:	000785a3          	sb	zero,11(a5)
    80003cf0:	00078623          	sb	zero,12(a5)
    80003cf4:	000786a3          	sb	zero,13(a5)
    80003cf8:	00078723          	sb	zero,14(a5)
    80003cfc:	000787a3          	sb	zero,15(a5)
    }
}
    80003d00:	01813083          	ld	ra,24(sp)
    80003d04:	01013403          	ld	s0,16(sp)
    80003d08:	00813483          	ld	s1,8(sp)
    80003d0c:	00013903          	ld	s2,0(sp)
    80003d10:	02010113          	addi	sp,sp,32
    80003d14:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003d18:	01000513          	li	a0,16
    80003d1c:	ffffd097          	auipc	ra,0xffffd
    80003d20:	698080e7          	jalr	1688(ra) # 800013b4 <_Z9mem_allocm>
    80003d24:	00a93423          	sd	a0,8(s2)
    80003d28:	00004717          	auipc	a4,0x4
    80003d2c:	44070713          	addi	a4,a4,1088 # 80008168 <_ZN9Scheduler9singletonE>
    80003d30:	00073783          	ld	a5,0(a4)
    80003d34:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80003d38:	00073783          	ld	a5,0(a4)
    80003d3c:	0007b783          	ld	a5,0(a5)
    80003d40:	00978023          	sb	s1,0(a5)
    80003d44:	0084d693          	srli	a3,s1,0x8
    80003d48:	00d780a3          	sb	a3,1(a5)
    80003d4c:	0104d693          	srli	a3,s1,0x10
    80003d50:	00d78123          	sb	a3,2(a5)
    80003d54:	0184d69b          	srliw	a3,s1,0x18
    80003d58:	00d781a3          	sb	a3,3(a5)
    80003d5c:	0204d693          	srli	a3,s1,0x20
    80003d60:	00d78223          	sb	a3,4(a5)
    80003d64:	0284d693          	srli	a3,s1,0x28
    80003d68:	00d782a3          	sb	a3,5(a5)
    80003d6c:	0304d693          	srli	a3,s1,0x30
    80003d70:	00d78323          	sb	a3,6(a5)
    80003d74:	0384d493          	srli	s1,s1,0x38
    80003d78:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80003d7c:	00073783          	ld	a5,0(a4)
    80003d80:	0007b783          	ld	a5,0(a5)
    80003d84:	00078423          	sb	zero,8(a5)
    80003d88:	000784a3          	sb	zero,9(a5)
    80003d8c:	00078523          	sb	zero,10(a5)
    80003d90:	000785a3          	sb	zero,11(a5)
    80003d94:	00078623          	sb	zero,12(a5)
    80003d98:	000786a3          	sb	zero,13(a5)
    80003d9c:	00078723          	sb	zero,14(a5)
    80003da0:	000787a3          	sb	zero,15(a5)
    80003da4:	f5dff06f          	j	80003d00 <_ZN9Scheduler3putEP7_thread+0x148>

0000000080003da8 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80003da8:	ff010113          	addi	sp,sp,-16
    80003dac:	00813423          	sd	s0,8(sp)
    80003db0:	01010413          	addi	s0,sp,16
    ThreadList* tmp = singleton->head;
    80003db4:	00004617          	auipc	a2,0x4
    80003db8:	3b463603          	ld	a2,948(a2) # 80008168 <_ZN9Scheduler9singletonE>
    80003dbc:	00063783          	ld	a5,0(a2)
    if(tmp == 0){
    80003dc0:	0c078e63          	beqz	a5,80003e9c <_ZN9Scheduler3getEv+0xf4>
        return 0;
    }
    thread_t thread = tmp->thread;
    80003dc4:	0007c503          	lbu	a0,0(a5)
    80003dc8:	0017c703          	lbu	a4,1(a5)
    80003dcc:	00871713          	slli	a4,a4,0x8
    80003dd0:	00a76733          	or	a4,a4,a0
    80003dd4:	0027c503          	lbu	a0,2(a5)
    80003dd8:	01051513          	slli	a0,a0,0x10
    80003ddc:	00e56733          	or	a4,a0,a4
    80003de0:	0037c503          	lbu	a0,3(a5)
    80003de4:	01851513          	slli	a0,a0,0x18
    80003de8:	00e56533          	or	a0,a0,a4
    80003dec:	0047c703          	lbu	a4,4(a5)
    80003df0:	02071713          	slli	a4,a4,0x20
    80003df4:	00a76533          	or	a0,a4,a0
    80003df8:	0057c703          	lbu	a4,5(a5)
    80003dfc:	02871713          	slli	a4,a4,0x28
    80003e00:	00a76733          	or	a4,a4,a0
    80003e04:	0067c503          	lbu	a0,6(a5)
    80003e08:	03051513          	slli	a0,a0,0x30
    80003e0c:	00e56733          	or	a4,a0,a4
    80003e10:	0077c503          	lbu	a0,7(a5)
    80003e14:	03851513          	slli	a0,a0,0x38
    80003e18:	00e56533          	or	a0,a0,a4
    singleton->head = tmp->next;
    80003e1c:	0087c683          	lbu	a3,8(a5)
    80003e20:	0097c703          	lbu	a4,9(a5)
    80003e24:	00871713          	slli	a4,a4,0x8
    80003e28:	00d766b3          	or	a3,a4,a3
    80003e2c:	00a7c703          	lbu	a4,10(a5)
    80003e30:	01071713          	slli	a4,a4,0x10
    80003e34:	00d76733          	or	a4,a4,a3
    80003e38:	00b7c683          	lbu	a3,11(a5)
    80003e3c:	01869693          	slli	a3,a3,0x18
    80003e40:	00e6e733          	or	a4,a3,a4
    80003e44:	00c7c683          	lbu	a3,12(a5)
    80003e48:	02069693          	slli	a3,a3,0x20
    80003e4c:	00e6e6b3          	or	a3,a3,a4
    80003e50:	00d7c703          	lbu	a4,13(a5)
    80003e54:	02871713          	slli	a4,a4,0x28
    80003e58:	00d766b3          	or	a3,a4,a3
    80003e5c:	00e7c703          	lbu	a4,14(a5)
    80003e60:	03071713          	slli	a4,a4,0x30
    80003e64:	00d76733          	or	a4,a4,a3
    80003e68:	00f7c783          	lbu	a5,15(a5)
    80003e6c:	03879793          	slli	a5,a5,0x38
    80003e70:	00e7e7b3          	or	a5,a5,a4
    80003e74:	00f63023          	sd	a5,0(a2)
    if(singleton->head == 0){
    80003e78:	00004797          	auipc	a5,0x4
    80003e7c:	2f07b783          	ld	a5,752(a5) # 80008168 <_ZN9Scheduler9singletonE>
    80003e80:	0007b703          	ld	a4,0(a5)
    80003e84:	00070863          	beqz	a4,80003e94 <_ZN9Scheduler3getEv+0xec>
        singleton->tail = 0;
    }
    // mem_free(tmp);
    return thread;
}
    80003e88:	00813403          	ld	s0,8(sp)
    80003e8c:	01010113          	addi	sp,sp,16
    80003e90:	00008067          	ret
        singleton->tail = 0;
    80003e94:	0007b423          	sd	zero,8(a5)
    80003e98:	ff1ff06f          	j	80003e88 <_ZN9Scheduler3getEv+0xe0>
        return 0;
    80003e9c:	00078513          	mv	a0,a5
    80003ea0:	fe9ff06f          	j	80003e88 <_ZN9Scheduler3getEv+0xe0>

0000000080003ea4 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80003ea4:	ff010113          	addi	sp,sp,-16
    80003ea8:	00813423          	sd	s0,8(sp)
    80003eac:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80003eb0:	00004797          	auipc	a5,0x4
    80003eb4:	2b87b783          	ld	a5,696(a5) # 80008168 <_ZN9Scheduler9singletonE>
    80003eb8:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80003ebc:	00000513          	li	a0,0
    while(tmp != 0){
    80003ec0:	06078263          	beqz	a5,80003f24 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80003ec4:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80003ec8:	0087c683          	lbu	a3,8(a5)
    80003ecc:	0097c703          	lbu	a4,9(a5)
    80003ed0:	00871713          	slli	a4,a4,0x8
    80003ed4:	00d766b3          	or	a3,a4,a3
    80003ed8:	00a7c703          	lbu	a4,10(a5)
    80003edc:	01071713          	slli	a4,a4,0x10
    80003ee0:	00d76733          	or	a4,a4,a3
    80003ee4:	00b7c683          	lbu	a3,11(a5)
    80003ee8:	01869693          	slli	a3,a3,0x18
    80003eec:	00e6e733          	or	a4,a3,a4
    80003ef0:	00c7c683          	lbu	a3,12(a5)
    80003ef4:	02069693          	slli	a3,a3,0x20
    80003ef8:	00e6e6b3          	or	a3,a3,a4
    80003efc:	00d7c703          	lbu	a4,13(a5)
    80003f00:	02871713          	slli	a4,a4,0x28
    80003f04:	00d766b3          	or	a3,a4,a3
    80003f08:	00e7c703          	lbu	a4,14(a5)
    80003f0c:	03071713          	slli	a4,a4,0x30
    80003f10:	00d76733          	or	a4,a4,a3
    80003f14:	00f7c783          	lbu	a5,15(a5)
    80003f18:	03879793          	slli	a5,a5,0x38
    80003f1c:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80003f20:	fa1ff06f          	j	80003ec0 <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80003f24:	00813403          	ld	s0,8(sp)
    80003f28:	01010113          	addi	sp,sp,16
    80003f2c:	00008067          	ret

0000000080003f30 <start>:
    80003f30:	ff010113          	addi	sp,sp,-16
    80003f34:	00813423          	sd	s0,8(sp)
    80003f38:	01010413          	addi	s0,sp,16
    80003f3c:	300027f3          	csrr	a5,mstatus
    80003f40:	ffffe737          	lui	a4,0xffffe
    80003f44:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff542f>
    80003f48:	00e7f7b3          	and	a5,a5,a4
    80003f4c:	00001737          	lui	a4,0x1
    80003f50:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003f54:	00e7e7b3          	or	a5,a5,a4
    80003f58:	30079073          	csrw	mstatus,a5
    80003f5c:	00000797          	auipc	a5,0x0
    80003f60:	16078793          	addi	a5,a5,352 # 800040bc <system_main>
    80003f64:	34179073          	csrw	mepc,a5
    80003f68:	00000793          	li	a5,0
    80003f6c:	18079073          	csrw	satp,a5
    80003f70:	000107b7          	lui	a5,0x10
    80003f74:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003f78:	30279073          	csrw	medeleg,a5
    80003f7c:	30379073          	csrw	mideleg,a5
    80003f80:	104027f3          	csrr	a5,sie
    80003f84:	2227e793          	ori	a5,a5,546
    80003f88:	10479073          	csrw	sie,a5
    80003f8c:	fff00793          	li	a5,-1
    80003f90:	00a7d793          	srli	a5,a5,0xa
    80003f94:	3b079073          	csrw	pmpaddr0,a5
    80003f98:	00f00793          	li	a5,15
    80003f9c:	3a079073          	csrw	pmpcfg0,a5
    80003fa0:	f14027f3          	csrr	a5,mhartid
    80003fa4:	0200c737          	lui	a4,0x200c
    80003fa8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003fac:	0007869b          	sext.w	a3,a5
    80003fb0:	00269713          	slli	a4,a3,0x2
    80003fb4:	000f4637          	lui	a2,0xf4
    80003fb8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003fbc:	00d70733          	add	a4,a4,a3
    80003fc0:	0037979b          	slliw	a5,a5,0x3
    80003fc4:	020046b7          	lui	a3,0x2004
    80003fc8:	00d787b3          	add	a5,a5,a3
    80003fcc:	00c585b3          	add	a1,a1,a2
    80003fd0:	00371693          	slli	a3,a4,0x3
    80003fd4:	00004717          	auipc	a4,0x4
    80003fd8:	19c70713          	addi	a4,a4,412 # 80008170 <timer_scratch>
    80003fdc:	00b7b023          	sd	a1,0(a5)
    80003fe0:	00d70733          	add	a4,a4,a3
    80003fe4:	00f73c23          	sd	a5,24(a4)
    80003fe8:	02c73023          	sd	a2,32(a4)
    80003fec:	34071073          	csrw	mscratch,a4
    80003ff0:	00000797          	auipc	a5,0x0
    80003ff4:	6e078793          	addi	a5,a5,1760 # 800046d0 <timervec>
    80003ff8:	30579073          	csrw	mtvec,a5
    80003ffc:	300027f3          	csrr	a5,mstatus
    80004000:	0087e793          	ori	a5,a5,8
    80004004:	30079073          	csrw	mstatus,a5
    80004008:	304027f3          	csrr	a5,mie
    8000400c:	0807e793          	ori	a5,a5,128
    80004010:	30479073          	csrw	mie,a5
    80004014:	f14027f3          	csrr	a5,mhartid
    80004018:	0007879b          	sext.w	a5,a5
    8000401c:	00078213          	mv	tp,a5
    80004020:	30200073          	mret
    80004024:	00813403          	ld	s0,8(sp)
    80004028:	01010113          	addi	sp,sp,16
    8000402c:	00008067          	ret

0000000080004030 <timerinit>:
    80004030:	ff010113          	addi	sp,sp,-16
    80004034:	00813423          	sd	s0,8(sp)
    80004038:	01010413          	addi	s0,sp,16
    8000403c:	f14027f3          	csrr	a5,mhartid
    80004040:	0200c737          	lui	a4,0x200c
    80004044:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004048:	0007869b          	sext.w	a3,a5
    8000404c:	00269713          	slli	a4,a3,0x2
    80004050:	000f4637          	lui	a2,0xf4
    80004054:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004058:	00d70733          	add	a4,a4,a3
    8000405c:	0037979b          	slliw	a5,a5,0x3
    80004060:	020046b7          	lui	a3,0x2004
    80004064:	00d787b3          	add	a5,a5,a3
    80004068:	00c585b3          	add	a1,a1,a2
    8000406c:	00371693          	slli	a3,a4,0x3
    80004070:	00004717          	auipc	a4,0x4
    80004074:	10070713          	addi	a4,a4,256 # 80008170 <timer_scratch>
    80004078:	00b7b023          	sd	a1,0(a5)
    8000407c:	00d70733          	add	a4,a4,a3
    80004080:	00f73c23          	sd	a5,24(a4)
    80004084:	02c73023          	sd	a2,32(a4)
    80004088:	34071073          	csrw	mscratch,a4
    8000408c:	00000797          	auipc	a5,0x0
    80004090:	64478793          	addi	a5,a5,1604 # 800046d0 <timervec>
    80004094:	30579073          	csrw	mtvec,a5
    80004098:	300027f3          	csrr	a5,mstatus
    8000409c:	0087e793          	ori	a5,a5,8
    800040a0:	30079073          	csrw	mstatus,a5
    800040a4:	304027f3          	csrr	a5,mie
    800040a8:	0807e793          	ori	a5,a5,128
    800040ac:	30479073          	csrw	mie,a5
    800040b0:	00813403          	ld	s0,8(sp)
    800040b4:	01010113          	addi	sp,sp,16
    800040b8:	00008067          	ret

00000000800040bc <system_main>:
    800040bc:	fe010113          	addi	sp,sp,-32
    800040c0:	00813823          	sd	s0,16(sp)
    800040c4:	00913423          	sd	s1,8(sp)
    800040c8:	00113c23          	sd	ra,24(sp)
    800040cc:	02010413          	addi	s0,sp,32
    800040d0:	00000097          	auipc	ra,0x0
    800040d4:	0c4080e7          	jalr	196(ra) # 80004194 <cpuid>
    800040d8:	00004497          	auipc	s1,0x4
    800040dc:	01848493          	addi	s1,s1,24 # 800080f0 <started>
    800040e0:	02050263          	beqz	a0,80004104 <system_main+0x48>
    800040e4:	0004a783          	lw	a5,0(s1)
    800040e8:	0007879b          	sext.w	a5,a5
    800040ec:	fe078ce3          	beqz	a5,800040e4 <system_main+0x28>
    800040f0:	0ff0000f          	fence
    800040f4:	00003517          	auipc	a0,0x3
    800040f8:	2b450513          	addi	a0,a0,692 # 800073a8 <CONSOLE_STATUS+0x398>
    800040fc:	00001097          	auipc	ra,0x1
    80004100:	a70080e7          	jalr	-1424(ra) # 80004b6c <panic>
    80004104:	00001097          	auipc	ra,0x1
    80004108:	9c4080e7          	jalr	-1596(ra) # 80004ac8 <consoleinit>
    8000410c:	00001097          	auipc	ra,0x1
    80004110:	150080e7          	jalr	336(ra) # 8000525c <printfinit>
    80004114:	00003517          	auipc	a0,0x3
    80004118:	37450513          	addi	a0,a0,884 # 80007488 <CONSOLE_STATUS+0x478>
    8000411c:	00001097          	auipc	ra,0x1
    80004120:	aac080e7          	jalr	-1364(ra) # 80004bc8 <__printf>
    80004124:	00003517          	auipc	a0,0x3
    80004128:	25450513          	addi	a0,a0,596 # 80007378 <CONSOLE_STATUS+0x368>
    8000412c:	00001097          	auipc	ra,0x1
    80004130:	a9c080e7          	jalr	-1380(ra) # 80004bc8 <__printf>
    80004134:	00003517          	auipc	a0,0x3
    80004138:	35450513          	addi	a0,a0,852 # 80007488 <CONSOLE_STATUS+0x478>
    8000413c:	00001097          	auipc	ra,0x1
    80004140:	a8c080e7          	jalr	-1396(ra) # 80004bc8 <__printf>
    80004144:	00001097          	auipc	ra,0x1
    80004148:	4a4080e7          	jalr	1188(ra) # 800055e8 <kinit>
    8000414c:	00000097          	auipc	ra,0x0
    80004150:	148080e7          	jalr	328(ra) # 80004294 <trapinit>
    80004154:	00000097          	auipc	ra,0x0
    80004158:	16c080e7          	jalr	364(ra) # 800042c0 <trapinithart>
    8000415c:	00000097          	auipc	ra,0x0
    80004160:	5b4080e7          	jalr	1460(ra) # 80004710 <plicinit>
    80004164:	00000097          	auipc	ra,0x0
    80004168:	5d4080e7          	jalr	1492(ra) # 80004738 <plicinithart>
    8000416c:	00000097          	auipc	ra,0x0
    80004170:	078080e7          	jalr	120(ra) # 800041e4 <userinit>
    80004174:	0ff0000f          	fence
    80004178:	00100793          	li	a5,1
    8000417c:	00003517          	auipc	a0,0x3
    80004180:	21450513          	addi	a0,a0,532 # 80007390 <CONSOLE_STATUS+0x380>
    80004184:	00f4a023          	sw	a5,0(s1)
    80004188:	00001097          	auipc	ra,0x1
    8000418c:	a40080e7          	jalr	-1472(ra) # 80004bc8 <__printf>
    80004190:	0000006f          	j	80004190 <system_main+0xd4>

0000000080004194 <cpuid>:
    80004194:	ff010113          	addi	sp,sp,-16
    80004198:	00813423          	sd	s0,8(sp)
    8000419c:	01010413          	addi	s0,sp,16
    800041a0:	00020513          	mv	a0,tp
    800041a4:	00813403          	ld	s0,8(sp)
    800041a8:	0005051b          	sext.w	a0,a0
    800041ac:	01010113          	addi	sp,sp,16
    800041b0:	00008067          	ret

00000000800041b4 <mycpu>:
    800041b4:	ff010113          	addi	sp,sp,-16
    800041b8:	00813423          	sd	s0,8(sp)
    800041bc:	01010413          	addi	s0,sp,16
    800041c0:	00020793          	mv	a5,tp
    800041c4:	00813403          	ld	s0,8(sp)
    800041c8:	0007879b          	sext.w	a5,a5
    800041cc:	00779793          	slli	a5,a5,0x7
    800041d0:	00005517          	auipc	a0,0x5
    800041d4:	fd050513          	addi	a0,a0,-48 # 800091a0 <cpus>
    800041d8:	00f50533          	add	a0,a0,a5
    800041dc:	01010113          	addi	sp,sp,16
    800041e0:	00008067          	ret

00000000800041e4 <userinit>:
    800041e4:	ff010113          	addi	sp,sp,-16
    800041e8:	00813423          	sd	s0,8(sp)
    800041ec:	01010413          	addi	s0,sp,16
    800041f0:	00813403          	ld	s0,8(sp)
    800041f4:	01010113          	addi	sp,sp,16
    800041f8:	ffffd317          	auipc	t1,0xffffd
    800041fc:	5f430067          	jr	1524(t1) # 800017ec <main>

0000000080004200 <either_copyout>:
    80004200:	ff010113          	addi	sp,sp,-16
    80004204:	00813023          	sd	s0,0(sp)
    80004208:	00113423          	sd	ra,8(sp)
    8000420c:	01010413          	addi	s0,sp,16
    80004210:	02051663          	bnez	a0,8000423c <either_copyout+0x3c>
    80004214:	00058513          	mv	a0,a1
    80004218:	00060593          	mv	a1,a2
    8000421c:	0006861b          	sext.w	a2,a3
    80004220:	00002097          	auipc	ra,0x2
    80004224:	c54080e7          	jalr	-940(ra) # 80005e74 <__memmove>
    80004228:	00813083          	ld	ra,8(sp)
    8000422c:	00013403          	ld	s0,0(sp)
    80004230:	00000513          	li	a0,0
    80004234:	01010113          	addi	sp,sp,16
    80004238:	00008067          	ret
    8000423c:	00003517          	auipc	a0,0x3
    80004240:	19450513          	addi	a0,a0,404 # 800073d0 <CONSOLE_STATUS+0x3c0>
    80004244:	00001097          	auipc	ra,0x1
    80004248:	928080e7          	jalr	-1752(ra) # 80004b6c <panic>

000000008000424c <either_copyin>:
    8000424c:	ff010113          	addi	sp,sp,-16
    80004250:	00813023          	sd	s0,0(sp)
    80004254:	00113423          	sd	ra,8(sp)
    80004258:	01010413          	addi	s0,sp,16
    8000425c:	02059463          	bnez	a1,80004284 <either_copyin+0x38>
    80004260:	00060593          	mv	a1,a2
    80004264:	0006861b          	sext.w	a2,a3
    80004268:	00002097          	auipc	ra,0x2
    8000426c:	c0c080e7          	jalr	-1012(ra) # 80005e74 <__memmove>
    80004270:	00813083          	ld	ra,8(sp)
    80004274:	00013403          	ld	s0,0(sp)
    80004278:	00000513          	li	a0,0
    8000427c:	01010113          	addi	sp,sp,16
    80004280:	00008067          	ret
    80004284:	00003517          	auipc	a0,0x3
    80004288:	17450513          	addi	a0,a0,372 # 800073f8 <CONSOLE_STATUS+0x3e8>
    8000428c:	00001097          	auipc	ra,0x1
    80004290:	8e0080e7          	jalr	-1824(ra) # 80004b6c <panic>

0000000080004294 <trapinit>:
    80004294:	ff010113          	addi	sp,sp,-16
    80004298:	00813423          	sd	s0,8(sp)
    8000429c:	01010413          	addi	s0,sp,16
    800042a0:	00813403          	ld	s0,8(sp)
    800042a4:	00003597          	auipc	a1,0x3
    800042a8:	17c58593          	addi	a1,a1,380 # 80007420 <CONSOLE_STATUS+0x410>
    800042ac:	00005517          	auipc	a0,0x5
    800042b0:	f7450513          	addi	a0,a0,-140 # 80009220 <tickslock>
    800042b4:	01010113          	addi	sp,sp,16
    800042b8:	00001317          	auipc	t1,0x1
    800042bc:	5c030067          	jr	1472(t1) # 80005878 <initlock>

00000000800042c0 <trapinithart>:
    800042c0:	ff010113          	addi	sp,sp,-16
    800042c4:	00813423          	sd	s0,8(sp)
    800042c8:	01010413          	addi	s0,sp,16
    800042cc:	00000797          	auipc	a5,0x0
    800042d0:	2f478793          	addi	a5,a5,756 # 800045c0 <kernelvec>
    800042d4:	10579073          	csrw	stvec,a5
    800042d8:	00813403          	ld	s0,8(sp)
    800042dc:	01010113          	addi	sp,sp,16
    800042e0:	00008067          	ret

00000000800042e4 <usertrap>:
    800042e4:	ff010113          	addi	sp,sp,-16
    800042e8:	00813423          	sd	s0,8(sp)
    800042ec:	01010413          	addi	s0,sp,16
    800042f0:	00813403          	ld	s0,8(sp)
    800042f4:	01010113          	addi	sp,sp,16
    800042f8:	00008067          	ret

00000000800042fc <usertrapret>:
    800042fc:	ff010113          	addi	sp,sp,-16
    80004300:	00813423          	sd	s0,8(sp)
    80004304:	01010413          	addi	s0,sp,16
    80004308:	00813403          	ld	s0,8(sp)
    8000430c:	01010113          	addi	sp,sp,16
    80004310:	00008067          	ret

0000000080004314 <kerneltrap>:
    80004314:	fe010113          	addi	sp,sp,-32
    80004318:	00813823          	sd	s0,16(sp)
    8000431c:	00113c23          	sd	ra,24(sp)
    80004320:	00913423          	sd	s1,8(sp)
    80004324:	02010413          	addi	s0,sp,32
    80004328:	142025f3          	csrr	a1,scause
    8000432c:	100027f3          	csrr	a5,sstatus
    80004330:	0027f793          	andi	a5,a5,2
    80004334:	10079c63          	bnez	a5,8000444c <kerneltrap+0x138>
    80004338:	142027f3          	csrr	a5,scause
    8000433c:	0207ce63          	bltz	a5,80004378 <kerneltrap+0x64>
    80004340:	00003517          	auipc	a0,0x3
    80004344:	12850513          	addi	a0,a0,296 # 80007468 <CONSOLE_STATUS+0x458>
    80004348:	00001097          	auipc	ra,0x1
    8000434c:	880080e7          	jalr	-1920(ra) # 80004bc8 <__printf>
    80004350:	141025f3          	csrr	a1,sepc
    80004354:	14302673          	csrr	a2,stval
    80004358:	00003517          	auipc	a0,0x3
    8000435c:	12050513          	addi	a0,a0,288 # 80007478 <CONSOLE_STATUS+0x468>
    80004360:	00001097          	auipc	ra,0x1
    80004364:	868080e7          	jalr	-1944(ra) # 80004bc8 <__printf>
    80004368:	00003517          	auipc	a0,0x3
    8000436c:	12850513          	addi	a0,a0,296 # 80007490 <CONSOLE_STATUS+0x480>
    80004370:	00000097          	auipc	ra,0x0
    80004374:	7fc080e7          	jalr	2044(ra) # 80004b6c <panic>
    80004378:	0ff7f713          	andi	a4,a5,255
    8000437c:	00900693          	li	a3,9
    80004380:	04d70063          	beq	a4,a3,800043c0 <kerneltrap+0xac>
    80004384:	fff00713          	li	a4,-1
    80004388:	03f71713          	slli	a4,a4,0x3f
    8000438c:	00170713          	addi	a4,a4,1
    80004390:	fae798e3          	bne	a5,a4,80004340 <kerneltrap+0x2c>
    80004394:	00000097          	auipc	ra,0x0
    80004398:	e00080e7          	jalr	-512(ra) # 80004194 <cpuid>
    8000439c:	06050663          	beqz	a0,80004408 <kerneltrap+0xf4>
    800043a0:	144027f3          	csrr	a5,sip
    800043a4:	ffd7f793          	andi	a5,a5,-3
    800043a8:	14479073          	csrw	sip,a5
    800043ac:	01813083          	ld	ra,24(sp)
    800043b0:	01013403          	ld	s0,16(sp)
    800043b4:	00813483          	ld	s1,8(sp)
    800043b8:	02010113          	addi	sp,sp,32
    800043bc:	00008067          	ret
    800043c0:	00000097          	auipc	ra,0x0
    800043c4:	3c4080e7          	jalr	964(ra) # 80004784 <plic_claim>
    800043c8:	00a00793          	li	a5,10
    800043cc:	00050493          	mv	s1,a0
    800043d0:	06f50863          	beq	a0,a5,80004440 <kerneltrap+0x12c>
    800043d4:	fc050ce3          	beqz	a0,800043ac <kerneltrap+0x98>
    800043d8:	00050593          	mv	a1,a0
    800043dc:	00003517          	auipc	a0,0x3
    800043e0:	06c50513          	addi	a0,a0,108 # 80007448 <CONSOLE_STATUS+0x438>
    800043e4:	00000097          	auipc	ra,0x0
    800043e8:	7e4080e7          	jalr	2020(ra) # 80004bc8 <__printf>
    800043ec:	01013403          	ld	s0,16(sp)
    800043f0:	01813083          	ld	ra,24(sp)
    800043f4:	00048513          	mv	a0,s1
    800043f8:	00813483          	ld	s1,8(sp)
    800043fc:	02010113          	addi	sp,sp,32
    80004400:	00000317          	auipc	t1,0x0
    80004404:	3bc30067          	jr	956(t1) # 800047bc <plic_complete>
    80004408:	00005517          	auipc	a0,0x5
    8000440c:	e1850513          	addi	a0,a0,-488 # 80009220 <tickslock>
    80004410:	00001097          	auipc	ra,0x1
    80004414:	48c080e7          	jalr	1164(ra) # 8000589c <acquire>
    80004418:	00004717          	auipc	a4,0x4
    8000441c:	cdc70713          	addi	a4,a4,-804 # 800080f4 <ticks>
    80004420:	00072783          	lw	a5,0(a4)
    80004424:	00005517          	auipc	a0,0x5
    80004428:	dfc50513          	addi	a0,a0,-516 # 80009220 <tickslock>
    8000442c:	0017879b          	addiw	a5,a5,1
    80004430:	00f72023          	sw	a5,0(a4)
    80004434:	00001097          	auipc	ra,0x1
    80004438:	534080e7          	jalr	1332(ra) # 80005968 <release>
    8000443c:	f65ff06f          	j	800043a0 <kerneltrap+0x8c>
    80004440:	00001097          	auipc	ra,0x1
    80004444:	090080e7          	jalr	144(ra) # 800054d0 <uartintr>
    80004448:	fa5ff06f          	j	800043ec <kerneltrap+0xd8>
    8000444c:	00003517          	auipc	a0,0x3
    80004450:	fdc50513          	addi	a0,a0,-36 # 80007428 <CONSOLE_STATUS+0x418>
    80004454:	00000097          	auipc	ra,0x0
    80004458:	718080e7          	jalr	1816(ra) # 80004b6c <panic>

000000008000445c <clockintr>:
    8000445c:	fe010113          	addi	sp,sp,-32
    80004460:	00813823          	sd	s0,16(sp)
    80004464:	00913423          	sd	s1,8(sp)
    80004468:	00113c23          	sd	ra,24(sp)
    8000446c:	02010413          	addi	s0,sp,32
    80004470:	00005497          	auipc	s1,0x5
    80004474:	db048493          	addi	s1,s1,-592 # 80009220 <tickslock>
    80004478:	00048513          	mv	a0,s1
    8000447c:	00001097          	auipc	ra,0x1
    80004480:	420080e7          	jalr	1056(ra) # 8000589c <acquire>
    80004484:	00004717          	auipc	a4,0x4
    80004488:	c7070713          	addi	a4,a4,-912 # 800080f4 <ticks>
    8000448c:	00072783          	lw	a5,0(a4)
    80004490:	01013403          	ld	s0,16(sp)
    80004494:	01813083          	ld	ra,24(sp)
    80004498:	00048513          	mv	a0,s1
    8000449c:	0017879b          	addiw	a5,a5,1
    800044a0:	00813483          	ld	s1,8(sp)
    800044a4:	00f72023          	sw	a5,0(a4)
    800044a8:	02010113          	addi	sp,sp,32
    800044ac:	00001317          	auipc	t1,0x1
    800044b0:	4bc30067          	jr	1212(t1) # 80005968 <release>

00000000800044b4 <devintr>:
    800044b4:	142027f3          	csrr	a5,scause
    800044b8:	00000513          	li	a0,0
    800044bc:	0007c463          	bltz	a5,800044c4 <devintr+0x10>
    800044c0:	00008067          	ret
    800044c4:	fe010113          	addi	sp,sp,-32
    800044c8:	00813823          	sd	s0,16(sp)
    800044cc:	00113c23          	sd	ra,24(sp)
    800044d0:	00913423          	sd	s1,8(sp)
    800044d4:	02010413          	addi	s0,sp,32
    800044d8:	0ff7f713          	andi	a4,a5,255
    800044dc:	00900693          	li	a3,9
    800044e0:	04d70c63          	beq	a4,a3,80004538 <devintr+0x84>
    800044e4:	fff00713          	li	a4,-1
    800044e8:	03f71713          	slli	a4,a4,0x3f
    800044ec:	00170713          	addi	a4,a4,1
    800044f0:	00e78c63          	beq	a5,a4,80004508 <devintr+0x54>
    800044f4:	01813083          	ld	ra,24(sp)
    800044f8:	01013403          	ld	s0,16(sp)
    800044fc:	00813483          	ld	s1,8(sp)
    80004500:	02010113          	addi	sp,sp,32
    80004504:	00008067          	ret
    80004508:	00000097          	auipc	ra,0x0
    8000450c:	c8c080e7          	jalr	-884(ra) # 80004194 <cpuid>
    80004510:	06050663          	beqz	a0,8000457c <devintr+0xc8>
    80004514:	144027f3          	csrr	a5,sip
    80004518:	ffd7f793          	andi	a5,a5,-3
    8000451c:	14479073          	csrw	sip,a5
    80004520:	01813083          	ld	ra,24(sp)
    80004524:	01013403          	ld	s0,16(sp)
    80004528:	00813483          	ld	s1,8(sp)
    8000452c:	00200513          	li	a0,2
    80004530:	02010113          	addi	sp,sp,32
    80004534:	00008067          	ret
    80004538:	00000097          	auipc	ra,0x0
    8000453c:	24c080e7          	jalr	588(ra) # 80004784 <plic_claim>
    80004540:	00a00793          	li	a5,10
    80004544:	00050493          	mv	s1,a0
    80004548:	06f50663          	beq	a0,a5,800045b4 <devintr+0x100>
    8000454c:	00100513          	li	a0,1
    80004550:	fa0482e3          	beqz	s1,800044f4 <devintr+0x40>
    80004554:	00048593          	mv	a1,s1
    80004558:	00003517          	auipc	a0,0x3
    8000455c:	ef050513          	addi	a0,a0,-272 # 80007448 <CONSOLE_STATUS+0x438>
    80004560:	00000097          	auipc	ra,0x0
    80004564:	668080e7          	jalr	1640(ra) # 80004bc8 <__printf>
    80004568:	00048513          	mv	a0,s1
    8000456c:	00000097          	auipc	ra,0x0
    80004570:	250080e7          	jalr	592(ra) # 800047bc <plic_complete>
    80004574:	00100513          	li	a0,1
    80004578:	f7dff06f          	j	800044f4 <devintr+0x40>
    8000457c:	00005517          	auipc	a0,0x5
    80004580:	ca450513          	addi	a0,a0,-860 # 80009220 <tickslock>
    80004584:	00001097          	auipc	ra,0x1
    80004588:	318080e7          	jalr	792(ra) # 8000589c <acquire>
    8000458c:	00004717          	auipc	a4,0x4
    80004590:	b6870713          	addi	a4,a4,-1176 # 800080f4 <ticks>
    80004594:	00072783          	lw	a5,0(a4)
    80004598:	00005517          	auipc	a0,0x5
    8000459c:	c8850513          	addi	a0,a0,-888 # 80009220 <tickslock>
    800045a0:	0017879b          	addiw	a5,a5,1
    800045a4:	00f72023          	sw	a5,0(a4)
    800045a8:	00001097          	auipc	ra,0x1
    800045ac:	3c0080e7          	jalr	960(ra) # 80005968 <release>
    800045b0:	f65ff06f          	j	80004514 <devintr+0x60>
    800045b4:	00001097          	auipc	ra,0x1
    800045b8:	f1c080e7          	jalr	-228(ra) # 800054d0 <uartintr>
    800045bc:	fadff06f          	j	80004568 <devintr+0xb4>

00000000800045c0 <kernelvec>:
    800045c0:	f0010113          	addi	sp,sp,-256
    800045c4:	00113023          	sd	ra,0(sp)
    800045c8:	00213423          	sd	sp,8(sp)
    800045cc:	00313823          	sd	gp,16(sp)
    800045d0:	00413c23          	sd	tp,24(sp)
    800045d4:	02513023          	sd	t0,32(sp)
    800045d8:	02613423          	sd	t1,40(sp)
    800045dc:	02713823          	sd	t2,48(sp)
    800045e0:	02813c23          	sd	s0,56(sp)
    800045e4:	04913023          	sd	s1,64(sp)
    800045e8:	04a13423          	sd	a0,72(sp)
    800045ec:	04b13823          	sd	a1,80(sp)
    800045f0:	04c13c23          	sd	a2,88(sp)
    800045f4:	06d13023          	sd	a3,96(sp)
    800045f8:	06e13423          	sd	a4,104(sp)
    800045fc:	06f13823          	sd	a5,112(sp)
    80004600:	07013c23          	sd	a6,120(sp)
    80004604:	09113023          	sd	a7,128(sp)
    80004608:	09213423          	sd	s2,136(sp)
    8000460c:	09313823          	sd	s3,144(sp)
    80004610:	09413c23          	sd	s4,152(sp)
    80004614:	0b513023          	sd	s5,160(sp)
    80004618:	0b613423          	sd	s6,168(sp)
    8000461c:	0b713823          	sd	s7,176(sp)
    80004620:	0b813c23          	sd	s8,184(sp)
    80004624:	0d913023          	sd	s9,192(sp)
    80004628:	0da13423          	sd	s10,200(sp)
    8000462c:	0db13823          	sd	s11,208(sp)
    80004630:	0dc13c23          	sd	t3,216(sp)
    80004634:	0fd13023          	sd	t4,224(sp)
    80004638:	0fe13423          	sd	t5,232(sp)
    8000463c:	0ff13823          	sd	t6,240(sp)
    80004640:	cd5ff0ef          	jal	ra,80004314 <kerneltrap>
    80004644:	00013083          	ld	ra,0(sp)
    80004648:	00813103          	ld	sp,8(sp)
    8000464c:	01013183          	ld	gp,16(sp)
    80004650:	02013283          	ld	t0,32(sp)
    80004654:	02813303          	ld	t1,40(sp)
    80004658:	03013383          	ld	t2,48(sp)
    8000465c:	03813403          	ld	s0,56(sp)
    80004660:	04013483          	ld	s1,64(sp)
    80004664:	04813503          	ld	a0,72(sp)
    80004668:	05013583          	ld	a1,80(sp)
    8000466c:	05813603          	ld	a2,88(sp)
    80004670:	06013683          	ld	a3,96(sp)
    80004674:	06813703          	ld	a4,104(sp)
    80004678:	07013783          	ld	a5,112(sp)
    8000467c:	07813803          	ld	a6,120(sp)
    80004680:	08013883          	ld	a7,128(sp)
    80004684:	08813903          	ld	s2,136(sp)
    80004688:	09013983          	ld	s3,144(sp)
    8000468c:	09813a03          	ld	s4,152(sp)
    80004690:	0a013a83          	ld	s5,160(sp)
    80004694:	0a813b03          	ld	s6,168(sp)
    80004698:	0b013b83          	ld	s7,176(sp)
    8000469c:	0b813c03          	ld	s8,184(sp)
    800046a0:	0c013c83          	ld	s9,192(sp)
    800046a4:	0c813d03          	ld	s10,200(sp)
    800046a8:	0d013d83          	ld	s11,208(sp)
    800046ac:	0d813e03          	ld	t3,216(sp)
    800046b0:	0e013e83          	ld	t4,224(sp)
    800046b4:	0e813f03          	ld	t5,232(sp)
    800046b8:	0f013f83          	ld	t6,240(sp)
    800046bc:	10010113          	addi	sp,sp,256
    800046c0:	10200073          	sret
    800046c4:	00000013          	nop
    800046c8:	00000013          	nop
    800046cc:	00000013          	nop

00000000800046d0 <timervec>:
    800046d0:	34051573          	csrrw	a0,mscratch,a0
    800046d4:	00b53023          	sd	a1,0(a0)
    800046d8:	00c53423          	sd	a2,8(a0)
    800046dc:	00d53823          	sd	a3,16(a0)
    800046e0:	01853583          	ld	a1,24(a0)
    800046e4:	02053603          	ld	a2,32(a0)
    800046e8:	0005b683          	ld	a3,0(a1)
    800046ec:	00c686b3          	add	a3,a3,a2
    800046f0:	00d5b023          	sd	a3,0(a1)
    800046f4:	00200593          	li	a1,2
    800046f8:	14459073          	csrw	sip,a1
    800046fc:	01053683          	ld	a3,16(a0)
    80004700:	00853603          	ld	a2,8(a0)
    80004704:	00053583          	ld	a1,0(a0)
    80004708:	34051573          	csrrw	a0,mscratch,a0
    8000470c:	30200073          	mret

0000000080004710 <plicinit>:
    80004710:	ff010113          	addi	sp,sp,-16
    80004714:	00813423          	sd	s0,8(sp)
    80004718:	01010413          	addi	s0,sp,16
    8000471c:	00813403          	ld	s0,8(sp)
    80004720:	0c0007b7          	lui	a5,0xc000
    80004724:	00100713          	li	a4,1
    80004728:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000472c:	00e7a223          	sw	a4,4(a5)
    80004730:	01010113          	addi	sp,sp,16
    80004734:	00008067          	ret

0000000080004738 <plicinithart>:
    80004738:	ff010113          	addi	sp,sp,-16
    8000473c:	00813023          	sd	s0,0(sp)
    80004740:	00113423          	sd	ra,8(sp)
    80004744:	01010413          	addi	s0,sp,16
    80004748:	00000097          	auipc	ra,0x0
    8000474c:	a4c080e7          	jalr	-1460(ra) # 80004194 <cpuid>
    80004750:	0085171b          	slliw	a4,a0,0x8
    80004754:	0c0027b7          	lui	a5,0xc002
    80004758:	00e787b3          	add	a5,a5,a4
    8000475c:	40200713          	li	a4,1026
    80004760:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80004764:	00813083          	ld	ra,8(sp)
    80004768:	00013403          	ld	s0,0(sp)
    8000476c:	00d5151b          	slliw	a0,a0,0xd
    80004770:	0c2017b7          	lui	a5,0xc201
    80004774:	00a78533          	add	a0,a5,a0
    80004778:	00052023          	sw	zero,0(a0)
    8000477c:	01010113          	addi	sp,sp,16
    80004780:	00008067          	ret

0000000080004784 <plic_claim>:
    80004784:	ff010113          	addi	sp,sp,-16
    80004788:	00813023          	sd	s0,0(sp)
    8000478c:	00113423          	sd	ra,8(sp)
    80004790:	01010413          	addi	s0,sp,16
    80004794:	00000097          	auipc	ra,0x0
    80004798:	a00080e7          	jalr	-1536(ra) # 80004194 <cpuid>
    8000479c:	00813083          	ld	ra,8(sp)
    800047a0:	00013403          	ld	s0,0(sp)
    800047a4:	00d5151b          	slliw	a0,a0,0xd
    800047a8:	0c2017b7          	lui	a5,0xc201
    800047ac:	00a78533          	add	a0,a5,a0
    800047b0:	00452503          	lw	a0,4(a0)
    800047b4:	01010113          	addi	sp,sp,16
    800047b8:	00008067          	ret

00000000800047bc <plic_complete>:
    800047bc:	fe010113          	addi	sp,sp,-32
    800047c0:	00813823          	sd	s0,16(sp)
    800047c4:	00913423          	sd	s1,8(sp)
    800047c8:	00113c23          	sd	ra,24(sp)
    800047cc:	02010413          	addi	s0,sp,32
    800047d0:	00050493          	mv	s1,a0
    800047d4:	00000097          	auipc	ra,0x0
    800047d8:	9c0080e7          	jalr	-1600(ra) # 80004194 <cpuid>
    800047dc:	01813083          	ld	ra,24(sp)
    800047e0:	01013403          	ld	s0,16(sp)
    800047e4:	00d5179b          	slliw	a5,a0,0xd
    800047e8:	0c201737          	lui	a4,0xc201
    800047ec:	00f707b3          	add	a5,a4,a5
    800047f0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800047f4:	00813483          	ld	s1,8(sp)
    800047f8:	02010113          	addi	sp,sp,32
    800047fc:	00008067          	ret

0000000080004800 <consolewrite>:
    80004800:	fb010113          	addi	sp,sp,-80
    80004804:	04813023          	sd	s0,64(sp)
    80004808:	04113423          	sd	ra,72(sp)
    8000480c:	02913c23          	sd	s1,56(sp)
    80004810:	03213823          	sd	s2,48(sp)
    80004814:	03313423          	sd	s3,40(sp)
    80004818:	03413023          	sd	s4,32(sp)
    8000481c:	01513c23          	sd	s5,24(sp)
    80004820:	05010413          	addi	s0,sp,80
    80004824:	06c05c63          	blez	a2,8000489c <consolewrite+0x9c>
    80004828:	00060993          	mv	s3,a2
    8000482c:	00050a13          	mv	s4,a0
    80004830:	00058493          	mv	s1,a1
    80004834:	00000913          	li	s2,0
    80004838:	fff00a93          	li	s5,-1
    8000483c:	01c0006f          	j	80004858 <consolewrite+0x58>
    80004840:	fbf44503          	lbu	a0,-65(s0)
    80004844:	0019091b          	addiw	s2,s2,1
    80004848:	00148493          	addi	s1,s1,1
    8000484c:	00001097          	auipc	ra,0x1
    80004850:	a9c080e7          	jalr	-1380(ra) # 800052e8 <uartputc>
    80004854:	03298063          	beq	s3,s2,80004874 <consolewrite+0x74>
    80004858:	00048613          	mv	a2,s1
    8000485c:	00100693          	li	a3,1
    80004860:	000a0593          	mv	a1,s4
    80004864:	fbf40513          	addi	a0,s0,-65
    80004868:	00000097          	auipc	ra,0x0
    8000486c:	9e4080e7          	jalr	-1564(ra) # 8000424c <either_copyin>
    80004870:	fd5518e3          	bne	a0,s5,80004840 <consolewrite+0x40>
    80004874:	04813083          	ld	ra,72(sp)
    80004878:	04013403          	ld	s0,64(sp)
    8000487c:	03813483          	ld	s1,56(sp)
    80004880:	02813983          	ld	s3,40(sp)
    80004884:	02013a03          	ld	s4,32(sp)
    80004888:	01813a83          	ld	s5,24(sp)
    8000488c:	00090513          	mv	a0,s2
    80004890:	03013903          	ld	s2,48(sp)
    80004894:	05010113          	addi	sp,sp,80
    80004898:	00008067          	ret
    8000489c:	00000913          	li	s2,0
    800048a0:	fd5ff06f          	j	80004874 <consolewrite+0x74>

00000000800048a4 <consoleread>:
    800048a4:	f9010113          	addi	sp,sp,-112
    800048a8:	06813023          	sd	s0,96(sp)
    800048ac:	04913c23          	sd	s1,88(sp)
    800048b0:	05213823          	sd	s2,80(sp)
    800048b4:	05313423          	sd	s3,72(sp)
    800048b8:	05413023          	sd	s4,64(sp)
    800048bc:	03513c23          	sd	s5,56(sp)
    800048c0:	03613823          	sd	s6,48(sp)
    800048c4:	03713423          	sd	s7,40(sp)
    800048c8:	03813023          	sd	s8,32(sp)
    800048cc:	06113423          	sd	ra,104(sp)
    800048d0:	01913c23          	sd	s9,24(sp)
    800048d4:	07010413          	addi	s0,sp,112
    800048d8:	00060b93          	mv	s7,a2
    800048dc:	00050913          	mv	s2,a0
    800048e0:	00058c13          	mv	s8,a1
    800048e4:	00060b1b          	sext.w	s6,a2
    800048e8:	00005497          	auipc	s1,0x5
    800048ec:	96048493          	addi	s1,s1,-1696 # 80009248 <cons>
    800048f0:	00400993          	li	s3,4
    800048f4:	fff00a13          	li	s4,-1
    800048f8:	00a00a93          	li	s5,10
    800048fc:	05705e63          	blez	s7,80004958 <consoleread+0xb4>
    80004900:	09c4a703          	lw	a4,156(s1)
    80004904:	0984a783          	lw	a5,152(s1)
    80004908:	0007071b          	sext.w	a4,a4
    8000490c:	08e78463          	beq	a5,a4,80004994 <consoleread+0xf0>
    80004910:	07f7f713          	andi	a4,a5,127
    80004914:	00e48733          	add	a4,s1,a4
    80004918:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000491c:	0017869b          	addiw	a3,a5,1
    80004920:	08d4ac23          	sw	a3,152(s1)
    80004924:	00070c9b          	sext.w	s9,a4
    80004928:	0b370663          	beq	a4,s3,800049d4 <consoleread+0x130>
    8000492c:	00100693          	li	a3,1
    80004930:	f9f40613          	addi	a2,s0,-97
    80004934:	000c0593          	mv	a1,s8
    80004938:	00090513          	mv	a0,s2
    8000493c:	f8e40fa3          	sb	a4,-97(s0)
    80004940:	00000097          	auipc	ra,0x0
    80004944:	8c0080e7          	jalr	-1856(ra) # 80004200 <either_copyout>
    80004948:	01450863          	beq	a0,s4,80004958 <consoleread+0xb4>
    8000494c:	001c0c13          	addi	s8,s8,1
    80004950:	fffb8b9b          	addiw	s7,s7,-1
    80004954:	fb5c94e3          	bne	s9,s5,800048fc <consoleread+0x58>
    80004958:	000b851b          	sext.w	a0,s7
    8000495c:	06813083          	ld	ra,104(sp)
    80004960:	06013403          	ld	s0,96(sp)
    80004964:	05813483          	ld	s1,88(sp)
    80004968:	05013903          	ld	s2,80(sp)
    8000496c:	04813983          	ld	s3,72(sp)
    80004970:	04013a03          	ld	s4,64(sp)
    80004974:	03813a83          	ld	s5,56(sp)
    80004978:	02813b83          	ld	s7,40(sp)
    8000497c:	02013c03          	ld	s8,32(sp)
    80004980:	01813c83          	ld	s9,24(sp)
    80004984:	40ab053b          	subw	a0,s6,a0
    80004988:	03013b03          	ld	s6,48(sp)
    8000498c:	07010113          	addi	sp,sp,112
    80004990:	00008067          	ret
    80004994:	00001097          	auipc	ra,0x1
    80004998:	1d8080e7          	jalr	472(ra) # 80005b6c <push_on>
    8000499c:	0984a703          	lw	a4,152(s1)
    800049a0:	09c4a783          	lw	a5,156(s1)
    800049a4:	0007879b          	sext.w	a5,a5
    800049a8:	fef70ce3          	beq	a4,a5,800049a0 <consoleread+0xfc>
    800049ac:	00001097          	auipc	ra,0x1
    800049b0:	234080e7          	jalr	564(ra) # 80005be0 <pop_on>
    800049b4:	0984a783          	lw	a5,152(s1)
    800049b8:	07f7f713          	andi	a4,a5,127
    800049bc:	00e48733          	add	a4,s1,a4
    800049c0:	01874703          	lbu	a4,24(a4)
    800049c4:	0017869b          	addiw	a3,a5,1
    800049c8:	08d4ac23          	sw	a3,152(s1)
    800049cc:	00070c9b          	sext.w	s9,a4
    800049d0:	f5371ee3          	bne	a4,s3,8000492c <consoleread+0x88>
    800049d4:	000b851b          	sext.w	a0,s7
    800049d8:	f96bf2e3          	bgeu	s7,s6,8000495c <consoleread+0xb8>
    800049dc:	08f4ac23          	sw	a5,152(s1)
    800049e0:	f7dff06f          	j	8000495c <consoleread+0xb8>

00000000800049e4 <consputc>:
    800049e4:	10000793          	li	a5,256
    800049e8:	00f50663          	beq	a0,a5,800049f4 <consputc+0x10>
    800049ec:	00001317          	auipc	t1,0x1
    800049f0:	9f430067          	jr	-1548(t1) # 800053e0 <uartputc_sync>
    800049f4:	ff010113          	addi	sp,sp,-16
    800049f8:	00113423          	sd	ra,8(sp)
    800049fc:	00813023          	sd	s0,0(sp)
    80004a00:	01010413          	addi	s0,sp,16
    80004a04:	00800513          	li	a0,8
    80004a08:	00001097          	auipc	ra,0x1
    80004a0c:	9d8080e7          	jalr	-1576(ra) # 800053e0 <uartputc_sync>
    80004a10:	02000513          	li	a0,32
    80004a14:	00001097          	auipc	ra,0x1
    80004a18:	9cc080e7          	jalr	-1588(ra) # 800053e0 <uartputc_sync>
    80004a1c:	00013403          	ld	s0,0(sp)
    80004a20:	00813083          	ld	ra,8(sp)
    80004a24:	00800513          	li	a0,8
    80004a28:	01010113          	addi	sp,sp,16
    80004a2c:	00001317          	auipc	t1,0x1
    80004a30:	9b430067          	jr	-1612(t1) # 800053e0 <uartputc_sync>

0000000080004a34 <consoleintr>:
    80004a34:	fe010113          	addi	sp,sp,-32
    80004a38:	00813823          	sd	s0,16(sp)
    80004a3c:	00913423          	sd	s1,8(sp)
    80004a40:	01213023          	sd	s2,0(sp)
    80004a44:	00113c23          	sd	ra,24(sp)
    80004a48:	02010413          	addi	s0,sp,32
    80004a4c:	00004917          	auipc	s2,0x4
    80004a50:	7fc90913          	addi	s2,s2,2044 # 80009248 <cons>
    80004a54:	00050493          	mv	s1,a0
    80004a58:	00090513          	mv	a0,s2
    80004a5c:	00001097          	auipc	ra,0x1
    80004a60:	e40080e7          	jalr	-448(ra) # 8000589c <acquire>
    80004a64:	02048c63          	beqz	s1,80004a9c <consoleintr+0x68>
    80004a68:	0a092783          	lw	a5,160(s2)
    80004a6c:	09892703          	lw	a4,152(s2)
    80004a70:	07f00693          	li	a3,127
    80004a74:	40e7873b          	subw	a4,a5,a4
    80004a78:	02e6e263          	bltu	a3,a4,80004a9c <consoleintr+0x68>
    80004a7c:	00d00713          	li	a4,13
    80004a80:	04e48063          	beq	s1,a4,80004ac0 <consoleintr+0x8c>
    80004a84:	07f7f713          	andi	a4,a5,127
    80004a88:	00e90733          	add	a4,s2,a4
    80004a8c:	0017879b          	addiw	a5,a5,1
    80004a90:	0af92023          	sw	a5,160(s2)
    80004a94:	00970c23          	sb	s1,24(a4)
    80004a98:	08f92e23          	sw	a5,156(s2)
    80004a9c:	01013403          	ld	s0,16(sp)
    80004aa0:	01813083          	ld	ra,24(sp)
    80004aa4:	00813483          	ld	s1,8(sp)
    80004aa8:	00013903          	ld	s2,0(sp)
    80004aac:	00004517          	auipc	a0,0x4
    80004ab0:	79c50513          	addi	a0,a0,1948 # 80009248 <cons>
    80004ab4:	02010113          	addi	sp,sp,32
    80004ab8:	00001317          	auipc	t1,0x1
    80004abc:	eb030067          	jr	-336(t1) # 80005968 <release>
    80004ac0:	00a00493          	li	s1,10
    80004ac4:	fc1ff06f          	j	80004a84 <consoleintr+0x50>

0000000080004ac8 <consoleinit>:
    80004ac8:	fe010113          	addi	sp,sp,-32
    80004acc:	00113c23          	sd	ra,24(sp)
    80004ad0:	00813823          	sd	s0,16(sp)
    80004ad4:	00913423          	sd	s1,8(sp)
    80004ad8:	02010413          	addi	s0,sp,32
    80004adc:	00004497          	auipc	s1,0x4
    80004ae0:	76c48493          	addi	s1,s1,1900 # 80009248 <cons>
    80004ae4:	00048513          	mv	a0,s1
    80004ae8:	00003597          	auipc	a1,0x3
    80004aec:	9b858593          	addi	a1,a1,-1608 # 800074a0 <CONSOLE_STATUS+0x490>
    80004af0:	00001097          	auipc	ra,0x1
    80004af4:	d88080e7          	jalr	-632(ra) # 80005878 <initlock>
    80004af8:	00000097          	auipc	ra,0x0
    80004afc:	7ac080e7          	jalr	1964(ra) # 800052a4 <uartinit>
    80004b00:	01813083          	ld	ra,24(sp)
    80004b04:	01013403          	ld	s0,16(sp)
    80004b08:	00000797          	auipc	a5,0x0
    80004b0c:	d9c78793          	addi	a5,a5,-612 # 800048a4 <consoleread>
    80004b10:	0af4bc23          	sd	a5,184(s1)
    80004b14:	00000797          	auipc	a5,0x0
    80004b18:	cec78793          	addi	a5,a5,-788 # 80004800 <consolewrite>
    80004b1c:	0cf4b023          	sd	a5,192(s1)
    80004b20:	00813483          	ld	s1,8(sp)
    80004b24:	02010113          	addi	sp,sp,32
    80004b28:	00008067          	ret

0000000080004b2c <console_read>:
    80004b2c:	ff010113          	addi	sp,sp,-16
    80004b30:	00813423          	sd	s0,8(sp)
    80004b34:	01010413          	addi	s0,sp,16
    80004b38:	00813403          	ld	s0,8(sp)
    80004b3c:	00004317          	auipc	t1,0x4
    80004b40:	7c433303          	ld	t1,1988(t1) # 80009300 <devsw+0x10>
    80004b44:	01010113          	addi	sp,sp,16
    80004b48:	00030067          	jr	t1

0000000080004b4c <console_write>:
    80004b4c:	ff010113          	addi	sp,sp,-16
    80004b50:	00813423          	sd	s0,8(sp)
    80004b54:	01010413          	addi	s0,sp,16
    80004b58:	00813403          	ld	s0,8(sp)
    80004b5c:	00004317          	auipc	t1,0x4
    80004b60:	7ac33303          	ld	t1,1964(t1) # 80009308 <devsw+0x18>
    80004b64:	01010113          	addi	sp,sp,16
    80004b68:	00030067          	jr	t1

0000000080004b6c <panic>:
    80004b6c:	fe010113          	addi	sp,sp,-32
    80004b70:	00113c23          	sd	ra,24(sp)
    80004b74:	00813823          	sd	s0,16(sp)
    80004b78:	00913423          	sd	s1,8(sp)
    80004b7c:	02010413          	addi	s0,sp,32
    80004b80:	00050493          	mv	s1,a0
    80004b84:	00003517          	auipc	a0,0x3
    80004b88:	92450513          	addi	a0,a0,-1756 # 800074a8 <CONSOLE_STATUS+0x498>
    80004b8c:	00005797          	auipc	a5,0x5
    80004b90:	8007ae23          	sw	zero,-2020(a5) # 800093a8 <pr+0x18>
    80004b94:	00000097          	auipc	ra,0x0
    80004b98:	034080e7          	jalr	52(ra) # 80004bc8 <__printf>
    80004b9c:	00048513          	mv	a0,s1
    80004ba0:	00000097          	auipc	ra,0x0
    80004ba4:	028080e7          	jalr	40(ra) # 80004bc8 <__printf>
    80004ba8:	00003517          	auipc	a0,0x3
    80004bac:	8e050513          	addi	a0,a0,-1824 # 80007488 <CONSOLE_STATUS+0x478>
    80004bb0:	00000097          	auipc	ra,0x0
    80004bb4:	018080e7          	jalr	24(ra) # 80004bc8 <__printf>
    80004bb8:	00100793          	li	a5,1
    80004bbc:	00003717          	auipc	a4,0x3
    80004bc0:	52f72e23          	sw	a5,1340(a4) # 800080f8 <panicked>
    80004bc4:	0000006f          	j	80004bc4 <panic+0x58>

0000000080004bc8 <__printf>:
    80004bc8:	f3010113          	addi	sp,sp,-208
    80004bcc:	08813023          	sd	s0,128(sp)
    80004bd0:	07313423          	sd	s3,104(sp)
    80004bd4:	09010413          	addi	s0,sp,144
    80004bd8:	05813023          	sd	s8,64(sp)
    80004bdc:	08113423          	sd	ra,136(sp)
    80004be0:	06913c23          	sd	s1,120(sp)
    80004be4:	07213823          	sd	s2,112(sp)
    80004be8:	07413023          	sd	s4,96(sp)
    80004bec:	05513c23          	sd	s5,88(sp)
    80004bf0:	05613823          	sd	s6,80(sp)
    80004bf4:	05713423          	sd	s7,72(sp)
    80004bf8:	03913c23          	sd	s9,56(sp)
    80004bfc:	03a13823          	sd	s10,48(sp)
    80004c00:	03b13423          	sd	s11,40(sp)
    80004c04:	00004317          	auipc	t1,0x4
    80004c08:	78c30313          	addi	t1,t1,1932 # 80009390 <pr>
    80004c0c:	01832c03          	lw	s8,24(t1)
    80004c10:	00b43423          	sd	a1,8(s0)
    80004c14:	00c43823          	sd	a2,16(s0)
    80004c18:	00d43c23          	sd	a3,24(s0)
    80004c1c:	02e43023          	sd	a4,32(s0)
    80004c20:	02f43423          	sd	a5,40(s0)
    80004c24:	03043823          	sd	a6,48(s0)
    80004c28:	03143c23          	sd	a7,56(s0)
    80004c2c:	00050993          	mv	s3,a0
    80004c30:	4a0c1663          	bnez	s8,800050dc <__printf+0x514>
    80004c34:	60098c63          	beqz	s3,8000524c <__printf+0x684>
    80004c38:	0009c503          	lbu	a0,0(s3)
    80004c3c:	00840793          	addi	a5,s0,8
    80004c40:	f6f43c23          	sd	a5,-136(s0)
    80004c44:	00000493          	li	s1,0
    80004c48:	22050063          	beqz	a0,80004e68 <__printf+0x2a0>
    80004c4c:	00002a37          	lui	s4,0x2
    80004c50:	00018ab7          	lui	s5,0x18
    80004c54:	000f4b37          	lui	s6,0xf4
    80004c58:	00989bb7          	lui	s7,0x989
    80004c5c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004c60:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004c64:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004c68:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80004c6c:	00148c9b          	addiw	s9,s1,1
    80004c70:	02500793          	li	a5,37
    80004c74:	01998933          	add	s2,s3,s9
    80004c78:	38f51263          	bne	a0,a5,80004ffc <__printf+0x434>
    80004c7c:	00094783          	lbu	a5,0(s2)
    80004c80:	00078c9b          	sext.w	s9,a5
    80004c84:	1e078263          	beqz	a5,80004e68 <__printf+0x2a0>
    80004c88:	0024849b          	addiw	s1,s1,2
    80004c8c:	07000713          	li	a4,112
    80004c90:	00998933          	add	s2,s3,s1
    80004c94:	38e78a63          	beq	a5,a4,80005028 <__printf+0x460>
    80004c98:	20f76863          	bltu	a4,a5,80004ea8 <__printf+0x2e0>
    80004c9c:	42a78863          	beq	a5,a0,800050cc <__printf+0x504>
    80004ca0:	06400713          	li	a4,100
    80004ca4:	40e79663          	bne	a5,a4,800050b0 <__printf+0x4e8>
    80004ca8:	f7843783          	ld	a5,-136(s0)
    80004cac:	0007a603          	lw	a2,0(a5)
    80004cb0:	00878793          	addi	a5,a5,8
    80004cb4:	f6f43c23          	sd	a5,-136(s0)
    80004cb8:	42064a63          	bltz	a2,800050ec <__printf+0x524>
    80004cbc:	00a00713          	li	a4,10
    80004cc0:	02e677bb          	remuw	a5,a2,a4
    80004cc4:	00003d97          	auipc	s11,0x3
    80004cc8:	80cd8d93          	addi	s11,s11,-2036 # 800074d0 <digits>
    80004ccc:	00900593          	li	a1,9
    80004cd0:	0006051b          	sext.w	a0,a2
    80004cd4:	00000c93          	li	s9,0
    80004cd8:	02079793          	slli	a5,a5,0x20
    80004cdc:	0207d793          	srli	a5,a5,0x20
    80004ce0:	00fd87b3          	add	a5,s11,a5
    80004ce4:	0007c783          	lbu	a5,0(a5)
    80004ce8:	02e656bb          	divuw	a3,a2,a4
    80004cec:	f8f40023          	sb	a5,-128(s0)
    80004cf0:	14c5d863          	bge	a1,a2,80004e40 <__printf+0x278>
    80004cf4:	06300593          	li	a1,99
    80004cf8:	00100c93          	li	s9,1
    80004cfc:	02e6f7bb          	remuw	a5,a3,a4
    80004d00:	02079793          	slli	a5,a5,0x20
    80004d04:	0207d793          	srli	a5,a5,0x20
    80004d08:	00fd87b3          	add	a5,s11,a5
    80004d0c:	0007c783          	lbu	a5,0(a5)
    80004d10:	02e6d73b          	divuw	a4,a3,a4
    80004d14:	f8f400a3          	sb	a5,-127(s0)
    80004d18:	12a5f463          	bgeu	a1,a0,80004e40 <__printf+0x278>
    80004d1c:	00a00693          	li	a3,10
    80004d20:	00900593          	li	a1,9
    80004d24:	02d777bb          	remuw	a5,a4,a3
    80004d28:	02079793          	slli	a5,a5,0x20
    80004d2c:	0207d793          	srli	a5,a5,0x20
    80004d30:	00fd87b3          	add	a5,s11,a5
    80004d34:	0007c503          	lbu	a0,0(a5)
    80004d38:	02d757bb          	divuw	a5,a4,a3
    80004d3c:	f8a40123          	sb	a0,-126(s0)
    80004d40:	48e5f263          	bgeu	a1,a4,800051c4 <__printf+0x5fc>
    80004d44:	06300513          	li	a0,99
    80004d48:	02d7f5bb          	remuw	a1,a5,a3
    80004d4c:	02059593          	slli	a1,a1,0x20
    80004d50:	0205d593          	srli	a1,a1,0x20
    80004d54:	00bd85b3          	add	a1,s11,a1
    80004d58:	0005c583          	lbu	a1,0(a1)
    80004d5c:	02d7d7bb          	divuw	a5,a5,a3
    80004d60:	f8b401a3          	sb	a1,-125(s0)
    80004d64:	48e57263          	bgeu	a0,a4,800051e8 <__printf+0x620>
    80004d68:	3e700513          	li	a0,999
    80004d6c:	02d7f5bb          	remuw	a1,a5,a3
    80004d70:	02059593          	slli	a1,a1,0x20
    80004d74:	0205d593          	srli	a1,a1,0x20
    80004d78:	00bd85b3          	add	a1,s11,a1
    80004d7c:	0005c583          	lbu	a1,0(a1)
    80004d80:	02d7d7bb          	divuw	a5,a5,a3
    80004d84:	f8b40223          	sb	a1,-124(s0)
    80004d88:	46e57663          	bgeu	a0,a4,800051f4 <__printf+0x62c>
    80004d8c:	02d7f5bb          	remuw	a1,a5,a3
    80004d90:	02059593          	slli	a1,a1,0x20
    80004d94:	0205d593          	srli	a1,a1,0x20
    80004d98:	00bd85b3          	add	a1,s11,a1
    80004d9c:	0005c583          	lbu	a1,0(a1)
    80004da0:	02d7d7bb          	divuw	a5,a5,a3
    80004da4:	f8b402a3          	sb	a1,-123(s0)
    80004da8:	46ea7863          	bgeu	s4,a4,80005218 <__printf+0x650>
    80004dac:	02d7f5bb          	remuw	a1,a5,a3
    80004db0:	02059593          	slli	a1,a1,0x20
    80004db4:	0205d593          	srli	a1,a1,0x20
    80004db8:	00bd85b3          	add	a1,s11,a1
    80004dbc:	0005c583          	lbu	a1,0(a1)
    80004dc0:	02d7d7bb          	divuw	a5,a5,a3
    80004dc4:	f8b40323          	sb	a1,-122(s0)
    80004dc8:	3eeaf863          	bgeu	s5,a4,800051b8 <__printf+0x5f0>
    80004dcc:	02d7f5bb          	remuw	a1,a5,a3
    80004dd0:	02059593          	slli	a1,a1,0x20
    80004dd4:	0205d593          	srli	a1,a1,0x20
    80004dd8:	00bd85b3          	add	a1,s11,a1
    80004ddc:	0005c583          	lbu	a1,0(a1)
    80004de0:	02d7d7bb          	divuw	a5,a5,a3
    80004de4:	f8b403a3          	sb	a1,-121(s0)
    80004de8:	42eb7e63          	bgeu	s6,a4,80005224 <__printf+0x65c>
    80004dec:	02d7f5bb          	remuw	a1,a5,a3
    80004df0:	02059593          	slli	a1,a1,0x20
    80004df4:	0205d593          	srli	a1,a1,0x20
    80004df8:	00bd85b3          	add	a1,s11,a1
    80004dfc:	0005c583          	lbu	a1,0(a1)
    80004e00:	02d7d7bb          	divuw	a5,a5,a3
    80004e04:	f8b40423          	sb	a1,-120(s0)
    80004e08:	42ebfc63          	bgeu	s7,a4,80005240 <__printf+0x678>
    80004e0c:	02079793          	slli	a5,a5,0x20
    80004e10:	0207d793          	srli	a5,a5,0x20
    80004e14:	00fd8db3          	add	s11,s11,a5
    80004e18:	000dc703          	lbu	a4,0(s11)
    80004e1c:	00a00793          	li	a5,10
    80004e20:	00900c93          	li	s9,9
    80004e24:	f8e404a3          	sb	a4,-119(s0)
    80004e28:	00065c63          	bgez	a2,80004e40 <__printf+0x278>
    80004e2c:	f9040713          	addi	a4,s0,-112
    80004e30:	00f70733          	add	a4,a4,a5
    80004e34:	02d00693          	li	a3,45
    80004e38:	fed70823          	sb	a3,-16(a4)
    80004e3c:	00078c93          	mv	s9,a5
    80004e40:	f8040793          	addi	a5,s0,-128
    80004e44:	01978cb3          	add	s9,a5,s9
    80004e48:	f7f40d13          	addi	s10,s0,-129
    80004e4c:	000cc503          	lbu	a0,0(s9)
    80004e50:	fffc8c93          	addi	s9,s9,-1
    80004e54:	00000097          	auipc	ra,0x0
    80004e58:	b90080e7          	jalr	-1136(ra) # 800049e4 <consputc>
    80004e5c:	ffac98e3          	bne	s9,s10,80004e4c <__printf+0x284>
    80004e60:	00094503          	lbu	a0,0(s2)
    80004e64:	e00514e3          	bnez	a0,80004c6c <__printf+0xa4>
    80004e68:	1a0c1663          	bnez	s8,80005014 <__printf+0x44c>
    80004e6c:	08813083          	ld	ra,136(sp)
    80004e70:	08013403          	ld	s0,128(sp)
    80004e74:	07813483          	ld	s1,120(sp)
    80004e78:	07013903          	ld	s2,112(sp)
    80004e7c:	06813983          	ld	s3,104(sp)
    80004e80:	06013a03          	ld	s4,96(sp)
    80004e84:	05813a83          	ld	s5,88(sp)
    80004e88:	05013b03          	ld	s6,80(sp)
    80004e8c:	04813b83          	ld	s7,72(sp)
    80004e90:	04013c03          	ld	s8,64(sp)
    80004e94:	03813c83          	ld	s9,56(sp)
    80004e98:	03013d03          	ld	s10,48(sp)
    80004e9c:	02813d83          	ld	s11,40(sp)
    80004ea0:	0d010113          	addi	sp,sp,208
    80004ea4:	00008067          	ret
    80004ea8:	07300713          	li	a4,115
    80004eac:	1ce78a63          	beq	a5,a4,80005080 <__printf+0x4b8>
    80004eb0:	07800713          	li	a4,120
    80004eb4:	1ee79e63          	bne	a5,a4,800050b0 <__printf+0x4e8>
    80004eb8:	f7843783          	ld	a5,-136(s0)
    80004ebc:	0007a703          	lw	a4,0(a5)
    80004ec0:	00878793          	addi	a5,a5,8
    80004ec4:	f6f43c23          	sd	a5,-136(s0)
    80004ec8:	28074263          	bltz	a4,8000514c <__printf+0x584>
    80004ecc:	00002d97          	auipc	s11,0x2
    80004ed0:	604d8d93          	addi	s11,s11,1540 # 800074d0 <digits>
    80004ed4:	00f77793          	andi	a5,a4,15
    80004ed8:	00fd87b3          	add	a5,s11,a5
    80004edc:	0007c683          	lbu	a3,0(a5)
    80004ee0:	00f00613          	li	a2,15
    80004ee4:	0007079b          	sext.w	a5,a4
    80004ee8:	f8d40023          	sb	a3,-128(s0)
    80004eec:	0047559b          	srliw	a1,a4,0x4
    80004ef0:	0047569b          	srliw	a3,a4,0x4
    80004ef4:	00000c93          	li	s9,0
    80004ef8:	0ee65063          	bge	a2,a4,80004fd8 <__printf+0x410>
    80004efc:	00f6f693          	andi	a3,a3,15
    80004f00:	00dd86b3          	add	a3,s11,a3
    80004f04:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004f08:	0087d79b          	srliw	a5,a5,0x8
    80004f0c:	00100c93          	li	s9,1
    80004f10:	f8d400a3          	sb	a3,-127(s0)
    80004f14:	0cb67263          	bgeu	a2,a1,80004fd8 <__printf+0x410>
    80004f18:	00f7f693          	andi	a3,a5,15
    80004f1c:	00dd86b3          	add	a3,s11,a3
    80004f20:	0006c583          	lbu	a1,0(a3)
    80004f24:	00f00613          	li	a2,15
    80004f28:	0047d69b          	srliw	a3,a5,0x4
    80004f2c:	f8b40123          	sb	a1,-126(s0)
    80004f30:	0047d593          	srli	a1,a5,0x4
    80004f34:	28f67e63          	bgeu	a2,a5,800051d0 <__printf+0x608>
    80004f38:	00f6f693          	andi	a3,a3,15
    80004f3c:	00dd86b3          	add	a3,s11,a3
    80004f40:	0006c503          	lbu	a0,0(a3)
    80004f44:	0087d813          	srli	a6,a5,0x8
    80004f48:	0087d69b          	srliw	a3,a5,0x8
    80004f4c:	f8a401a3          	sb	a0,-125(s0)
    80004f50:	28b67663          	bgeu	a2,a1,800051dc <__printf+0x614>
    80004f54:	00f6f693          	andi	a3,a3,15
    80004f58:	00dd86b3          	add	a3,s11,a3
    80004f5c:	0006c583          	lbu	a1,0(a3)
    80004f60:	00c7d513          	srli	a0,a5,0xc
    80004f64:	00c7d69b          	srliw	a3,a5,0xc
    80004f68:	f8b40223          	sb	a1,-124(s0)
    80004f6c:	29067a63          	bgeu	a2,a6,80005200 <__printf+0x638>
    80004f70:	00f6f693          	andi	a3,a3,15
    80004f74:	00dd86b3          	add	a3,s11,a3
    80004f78:	0006c583          	lbu	a1,0(a3)
    80004f7c:	0107d813          	srli	a6,a5,0x10
    80004f80:	0107d69b          	srliw	a3,a5,0x10
    80004f84:	f8b402a3          	sb	a1,-123(s0)
    80004f88:	28a67263          	bgeu	a2,a0,8000520c <__printf+0x644>
    80004f8c:	00f6f693          	andi	a3,a3,15
    80004f90:	00dd86b3          	add	a3,s11,a3
    80004f94:	0006c683          	lbu	a3,0(a3)
    80004f98:	0147d79b          	srliw	a5,a5,0x14
    80004f9c:	f8d40323          	sb	a3,-122(s0)
    80004fa0:	21067663          	bgeu	a2,a6,800051ac <__printf+0x5e4>
    80004fa4:	02079793          	slli	a5,a5,0x20
    80004fa8:	0207d793          	srli	a5,a5,0x20
    80004fac:	00fd8db3          	add	s11,s11,a5
    80004fb0:	000dc683          	lbu	a3,0(s11)
    80004fb4:	00800793          	li	a5,8
    80004fb8:	00700c93          	li	s9,7
    80004fbc:	f8d403a3          	sb	a3,-121(s0)
    80004fc0:	00075c63          	bgez	a4,80004fd8 <__printf+0x410>
    80004fc4:	f9040713          	addi	a4,s0,-112
    80004fc8:	00f70733          	add	a4,a4,a5
    80004fcc:	02d00693          	li	a3,45
    80004fd0:	fed70823          	sb	a3,-16(a4)
    80004fd4:	00078c93          	mv	s9,a5
    80004fd8:	f8040793          	addi	a5,s0,-128
    80004fdc:	01978cb3          	add	s9,a5,s9
    80004fe0:	f7f40d13          	addi	s10,s0,-129
    80004fe4:	000cc503          	lbu	a0,0(s9)
    80004fe8:	fffc8c93          	addi	s9,s9,-1
    80004fec:	00000097          	auipc	ra,0x0
    80004ff0:	9f8080e7          	jalr	-1544(ra) # 800049e4 <consputc>
    80004ff4:	ff9d18e3          	bne	s10,s9,80004fe4 <__printf+0x41c>
    80004ff8:	0100006f          	j	80005008 <__printf+0x440>
    80004ffc:	00000097          	auipc	ra,0x0
    80005000:	9e8080e7          	jalr	-1560(ra) # 800049e4 <consputc>
    80005004:	000c8493          	mv	s1,s9
    80005008:	00094503          	lbu	a0,0(s2)
    8000500c:	c60510e3          	bnez	a0,80004c6c <__printf+0xa4>
    80005010:	e40c0ee3          	beqz	s8,80004e6c <__printf+0x2a4>
    80005014:	00004517          	auipc	a0,0x4
    80005018:	37c50513          	addi	a0,a0,892 # 80009390 <pr>
    8000501c:	00001097          	auipc	ra,0x1
    80005020:	94c080e7          	jalr	-1716(ra) # 80005968 <release>
    80005024:	e49ff06f          	j	80004e6c <__printf+0x2a4>
    80005028:	f7843783          	ld	a5,-136(s0)
    8000502c:	03000513          	li	a0,48
    80005030:	01000d13          	li	s10,16
    80005034:	00878713          	addi	a4,a5,8
    80005038:	0007bc83          	ld	s9,0(a5)
    8000503c:	f6e43c23          	sd	a4,-136(s0)
    80005040:	00000097          	auipc	ra,0x0
    80005044:	9a4080e7          	jalr	-1628(ra) # 800049e4 <consputc>
    80005048:	07800513          	li	a0,120
    8000504c:	00000097          	auipc	ra,0x0
    80005050:	998080e7          	jalr	-1640(ra) # 800049e4 <consputc>
    80005054:	00002d97          	auipc	s11,0x2
    80005058:	47cd8d93          	addi	s11,s11,1148 # 800074d0 <digits>
    8000505c:	03ccd793          	srli	a5,s9,0x3c
    80005060:	00fd87b3          	add	a5,s11,a5
    80005064:	0007c503          	lbu	a0,0(a5)
    80005068:	fffd0d1b          	addiw	s10,s10,-1
    8000506c:	004c9c93          	slli	s9,s9,0x4
    80005070:	00000097          	auipc	ra,0x0
    80005074:	974080e7          	jalr	-1676(ra) # 800049e4 <consputc>
    80005078:	fe0d12e3          	bnez	s10,8000505c <__printf+0x494>
    8000507c:	f8dff06f          	j	80005008 <__printf+0x440>
    80005080:	f7843783          	ld	a5,-136(s0)
    80005084:	0007bc83          	ld	s9,0(a5)
    80005088:	00878793          	addi	a5,a5,8
    8000508c:	f6f43c23          	sd	a5,-136(s0)
    80005090:	000c9a63          	bnez	s9,800050a4 <__printf+0x4dc>
    80005094:	1080006f          	j	8000519c <__printf+0x5d4>
    80005098:	001c8c93          	addi	s9,s9,1
    8000509c:	00000097          	auipc	ra,0x0
    800050a0:	948080e7          	jalr	-1720(ra) # 800049e4 <consputc>
    800050a4:	000cc503          	lbu	a0,0(s9)
    800050a8:	fe0518e3          	bnez	a0,80005098 <__printf+0x4d0>
    800050ac:	f5dff06f          	j	80005008 <__printf+0x440>
    800050b0:	02500513          	li	a0,37
    800050b4:	00000097          	auipc	ra,0x0
    800050b8:	930080e7          	jalr	-1744(ra) # 800049e4 <consputc>
    800050bc:	000c8513          	mv	a0,s9
    800050c0:	00000097          	auipc	ra,0x0
    800050c4:	924080e7          	jalr	-1756(ra) # 800049e4 <consputc>
    800050c8:	f41ff06f          	j	80005008 <__printf+0x440>
    800050cc:	02500513          	li	a0,37
    800050d0:	00000097          	auipc	ra,0x0
    800050d4:	914080e7          	jalr	-1772(ra) # 800049e4 <consputc>
    800050d8:	f31ff06f          	j	80005008 <__printf+0x440>
    800050dc:	00030513          	mv	a0,t1
    800050e0:	00000097          	auipc	ra,0x0
    800050e4:	7bc080e7          	jalr	1980(ra) # 8000589c <acquire>
    800050e8:	b4dff06f          	j	80004c34 <__printf+0x6c>
    800050ec:	40c0053b          	negw	a0,a2
    800050f0:	00a00713          	li	a4,10
    800050f4:	02e576bb          	remuw	a3,a0,a4
    800050f8:	00002d97          	auipc	s11,0x2
    800050fc:	3d8d8d93          	addi	s11,s11,984 # 800074d0 <digits>
    80005100:	ff700593          	li	a1,-9
    80005104:	02069693          	slli	a3,a3,0x20
    80005108:	0206d693          	srli	a3,a3,0x20
    8000510c:	00dd86b3          	add	a3,s11,a3
    80005110:	0006c683          	lbu	a3,0(a3)
    80005114:	02e557bb          	divuw	a5,a0,a4
    80005118:	f8d40023          	sb	a3,-128(s0)
    8000511c:	10b65e63          	bge	a2,a1,80005238 <__printf+0x670>
    80005120:	06300593          	li	a1,99
    80005124:	02e7f6bb          	remuw	a3,a5,a4
    80005128:	02069693          	slli	a3,a3,0x20
    8000512c:	0206d693          	srli	a3,a3,0x20
    80005130:	00dd86b3          	add	a3,s11,a3
    80005134:	0006c683          	lbu	a3,0(a3)
    80005138:	02e7d73b          	divuw	a4,a5,a4
    8000513c:	00200793          	li	a5,2
    80005140:	f8d400a3          	sb	a3,-127(s0)
    80005144:	bca5ece3          	bltu	a1,a0,80004d1c <__printf+0x154>
    80005148:	ce5ff06f          	j	80004e2c <__printf+0x264>
    8000514c:	40e007bb          	negw	a5,a4
    80005150:	00002d97          	auipc	s11,0x2
    80005154:	380d8d93          	addi	s11,s11,896 # 800074d0 <digits>
    80005158:	00f7f693          	andi	a3,a5,15
    8000515c:	00dd86b3          	add	a3,s11,a3
    80005160:	0006c583          	lbu	a1,0(a3)
    80005164:	ff100613          	li	a2,-15
    80005168:	0047d69b          	srliw	a3,a5,0x4
    8000516c:	f8b40023          	sb	a1,-128(s0)
    80005170:	0047d59b          	srliw	a1,a5,0x4
    80005174:	0ac75e63          	bge	a4,a2,80005230 <__printf+0x668>
    80005178:	00f6f693          	andi	a3,a3,15
    8000517c:	00dd86b3          	add	a3,s11,a3
    80005180:	0006c603          	lbu	a2,0(a3)
    80005184:	00f00693          	li	a3,15
    80005188:	0087d79b          	srliw	a5,a5,0x8
    8000518c:	f8c400a3          	sb	a2,-127(s0)
    80005190:	d8b6e4e3          	bltu	a3,a1,80004f18 <__printf+0x350>
    80005194:	00200793          	li	a5,2
    80005198:	e2dff06f          	j	80004fc4 <__printf+0x3fc>
    8000519c:	00002c97          	auipc	s9,0x2
    800051a0:	314c8c93          	addi	s9,s9,788 # 800074b0 <CONSOLE_STATUS+0x4a0>
    800051a4:	02800513          	li	a0,40
    800051a8:	ef1ff06f          	j	80005098 <__printf+0x4d0>
    800051ac:	00700793          	li	a5,7
    800051b0:	00600c93          	li	s9,6
    800051b4:	e0dff06f          	j	80004fc0 <__printf+0x3f8>
    800051b8:	00700793          	li	a5,7
    800051bc:	00600c93          	li	s9,6
    800051c0:	c69ff06f          	j	80004e28 <__printf+0x260>
    800051c4:	00300793          	li	a5,3
    800051c8:	00200c93          	li	s9,2
    800051cc:	c5dff06f          	j	80004e28 <__printf+0x260>
    800051d0:	00300793          	li	a5,3
    800051d4:	00200c93          	li	s9,2
    800051d8:	de9ff06f          	j	80004fc0 <__printf+0x3f8>
    800051dc:	00400793          	li	a5,4
    800051e0:	00300c93          	li	s9,3
    800051e4:	dddff06f          	j	80004fc0 <__printf+0x3f8>
    800051e8:	00400793          	li	a5,4
    800051ec:	00300c93          	li	s9,3
    800051f0:	c39ff06f          	j	80004e28 <__printf+0x260>
    800051f4:	00500793          	li	a5,5
    800051f8:	00400c93          	li	s9,4
    800051fc:	c2dff06f          	j	80004e28 <__printf+0x260>
    80005200:	00500793          	li	a5,5
    80005204:	00400c93          	li	s9,4
    80005208:	db9ff06f          	j	80004fc0 <__printf+0x3f8>
    8000520c:	00600793          	li	a5,6
    80005210:	00500c93          	li	s9,5
    80005214:	dadff06f          	j	80004fc0 <__printf+0x3f8>
    80005218:	00600793          	li	a5,6
    8000521c:	00500c93          	li	s9,5
    80005220:	c09ff06f          	j	80004e28 <__printf+0x260>
    80005224:	00800793          	li	a5,8
    80005228:	00700c93          	li	s9,7
    8000522c:	bfdff06f          	j	80004e28 <__printf+0x260>
    80005230:	00100793          	li	a5,1
    80005234:	d91ff06f          	j	80004fc4 <__printf+0x3fc>
    80005238:	00100793          	li	a5,1
    8000523c:	bf1ff06f          	j	80004e2c <__printf+0x264>
    80005240:	00900793          	li	a5,9
    80005244:	00800c93          	li	s9,8
    80005248:	be1ff06f          	j	80004e28 <__printf+0x260>
    8000524c:	00002517          	auipc	a0,0x2
    80005250:	26c50513          	addi	a0,a0,620 # 800074b8 <CONSOLE_STATUS+0x4a8>
    80005254:	00000097          	auipc	ra,0x0
    80005258:	918080e7          	jalr	-1768(ra) # 80004b6c <panic>

000000008000525c <printfinit>:
    8000525c:	fe010113          	addi	sp,sp,-32
    80005260:	00813823          	sd	s0,16(sp)
    80005264:	00913423          	sd	s1,8(sp)
    80005268:	00113c23          	sd	ra,24(sp)
    8000526c:	02010413          	addi	s0,sp,32
    80005270:	00004497          	auipc	s1,0x4
    80005274:	12048493          	addi	s1,s1,288 # 80009390 <pr>
    80005278:	00048513          	mv	a0,s1
    8000527c:	00002597          	auipc	a1,0x2
    80005280:	24c58593          	addi	a1,a1,588 # 800074c8 <CONSOLE_STATUS+0x4b8>
    80005284:	00000097          	auipc	ra,0x0
    80005288:	5f4080e7          	jalr	1524(ra) # 80005878 <initlock>
    8000528c:	01813083          	ld	ra,24(sp)
    80005290:	01013403          	ld	s0,16(sp)
    80005294:	0004ac23          	sw	zero,24(s1)
    80005298:	00813483          	ld	s1,8(sp)
    8000529c:	02010113          	addi	sp,sp,32
    800052a0:	00008067          	ret

00000000800052a4 <uartinit>:
    800052a4:	ff010113          	addi	sp,sp,-16
    800052a8:	00813423          	sd	s0,8(sp)
    800052ac:	01010413          	addi	s0,sp,16
    800052b0:	100007b7          	lui	a5,0x10000
    800052b4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800052b8:	f8000713          	li	a4,-128
    800052bc:	00e781a3          	sb	a4,3(a5)
    800052c0:	00300713          	li	a4,3
    800052c4:	00e78023          	sb	a4,0(a5)
    800052c8:	000780a3          	sb	zero,1(a5)
    800052cc:	00e781a3          	sb	a4,3(a5)
    800052d0:	00700693          	li	a3,7
    800052d4:	00d78123          	sb	a3,2(a5)
    800052d8:	00e780a3          	sb	a4,1(a5)
    800052dc:	00813403          	ld	s0,8(sp)
    800052e0:	01010113          	addi	sp,sp,16
    800052e4:	00008067          	ret

00000000800052e8 <uartputc>:
    800052e8:	00003797          	auipc	a5,0x3
    800052ec:	e107a783          	lw	a5,-496(a5) # 800080f8 <panicked>
    800052f0:	00078463          	beqz	a5,800052f8 <uartputc+0x10>
    800052f4:	0000006f          	j	800052f4 <uartputc+0xc>
    800052f8:	fd010113          	addi	sp,sp,-48
    800052fc:	02813023          	sd	s0,32(sp)
    80005300:	00913c23          	sd	s1,24(sp)
    80005304:	01213823          	sd	s2,16(sp)
    80005308:	01313423          	sd	s3,8(sp)
    8000530c:	02113423          	sd	ra,40(sp)
    80005310:	03010413          	addi	s0,sp,48
    80005314:	00003917          	auipc	s2,0x3
    80005318:	dec90913          	addi	s2,s2,-532 # 80008100 <uart_tx_r>
    8000531c:	00093783          	ld	a5,0(s2)
    80005320:	00003497          	auipc	s1,0x3
    80005324:	de848493          	addi	s1,s1,-536 # 80008108 <uart_tx_w>
    80005328:	0004b703          	ld	a4,0(s1)
    8000532c:	02078693          	addi	a3,a5,32
    80005330:	00050993          	mv	s3,a0
    80005334:	02e69c63          	bne	a3,a4,8000536c <uartputc+0x84>
    80005338:	00001097          	auipc	ra,0x1
    8000533c:	834080e7          	jalr	-1996(ra) # 80005b6c <push_on>
    80005340:	00093783          	ld	a5,0(s2)
    80005344:	0004b703          	ld	a4,0(s1)
    80005348:	02078793          	addi	a5,a5,32
    8000534c:	00e79463          	bne	a5,a4,80005354 <uartputc+0x6c>
    80005350:	0000006f          	j	80005350 <uartputc+0x68>
    80005354:	00001097          	auipc	ra,0x1
    80005358:	88c080e7          	jalr	-1908(ra) # 80005be0 <pop_on>
    8000535c:	00093783          	ld	a5,0(s2)
    80005360:	0004b703          	ld	a4,0(s1)
    80005364:	02078693          	addi	a3,a5,32
    80005368:	fce688e3          	beq	a3,a4,80005338 <uartputc+0x50>
    8000536c:	01f77693          	andi	a3,a4,31
    80005370:	00004597          	auipc	a1,0x4
    80005374:	04058593          	addi	a1,a1,64 # 800093b0 <uart_tx_buf>
    80005378:	00d586b3          	add	a3,a1,a3
    8000537c:	00170713          	addi	a4,a4,1
    80005380:	01368023          	sb	s3,0(a3)
    80005384:	00e4b023          	sd	a4,0(s1)
    80005388:	10000637          	lui	a2,0x10000
    8000538c:	02f71063          	bne	a4,a5,800053ac <uartputc+0xc4>
    80005390:	0340006f          	j	800053c4 <uartputc+0xdc>
    80005394:	00074703          	lbu	a4,0(a4)
    80005398:	00f93023          	sd	a5,0(s2)
    8000539c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800053a0:	00093783          	ld	a5,0(s2)
    800053a4:	0004b703          	ld	a4,0(s1)
    800053a8:	00f70e63          	beq	a4,a5,800053c4 <uartputc+0xdc>
    800053ac:	00564683          	lbu	a3,5(a2)
    800053b0:	01f7f713          	andi	a4,a5,31
    800053b4:	00e58733          	add	a4,a1,a4
    800053b8:	0206f693          	andi	a3,a3,32
    800053bc:	00178793          	addi	a5,a5,1
    800053c0:	fc069ae3          	bnez	a3,80005394 <uartputc+0xac>
    800053c4:	02813083          	ld	ra,40(sp)
    800053c8:	02013403          	ld	s0,32(sp)
    800053cc:	01813483          	ld	s1,24(sp)
    800053d0:	01013903          	ld	s2,16(sp)
    800053d4:	00813983          	ld	s3,8(sp)
    800053d8:	03010113          	addi	sp,sp,48
    800053dc:	00008067          	ret

00000000800053e0 <uartputc_sync>:
    800053e0:	ff010113          	addi	sp,sp,-16
    800053e4:	00813423          	sd	s0,8(sp)
    800053e8:	01010413          	addi	s0,sp,16
    800053ec:	00003717          	auipc	a4,0x3
    800053f0:	d0c72703          	lw	a4,-756(a4) # 800080f8 <panicked>
    800053f4:	02071663          	bnez	a4,80005420 <uartputc_sync+0x40>
    800053f8:	00050793          	mv	a5,a0
    800053fc:	100006b7          	lui	a3,0x10000
    80005400:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005404:	02077713          	andi	a4,a4,32
    80005408:	fe070ce3          	beqz	a4,80005400 <uartputc_sync+0x20>
    8000540c:	0ff7f793          	andi	a5,a5,255
    80005410:	00f68023          	sb	a5,0(a3)
    80005414:	00813403          	ld	s0,8(sp)
    80005418:	01010113          	addi	sp,sp,16
    8000541c:	00008067          	ret
    80005420:	0000006f          	j	80005420 <uartputc_sync+0x40>

0000000080005424 <uartstart>:
    80005424:	ff010113          	addi	sp,sp,-16
    80005428:	00813423          	sd	s0,8(sp)
    8000542c:	01010413          	addi	s0,sp,16
    80005430:	00003617          	auipc	a2,0x3
    80005434:	cd060613          	addi	a2,a2,-816 # 80008100 <uart_tx_r>
    80005438:	00003517          	auipc	a0,0x3
    8000543c:	cd050513          	addi	a0,a0,-816 # 80008108 <uart_tx_w>
    80005440:	00063783          	ld	a5,0(a2)
    80005444:	00053703          	ld	a4,0(a0)
    80005448:	04f70263          	beq	a4,a5,8000548c <uartstart+0x68>
    8000544c:	100005b7          	lui	a1,0x10000
    80005450:	00004817          	auipc	a6,0x4
    80005454:	f6080813          	addi	a6,a6,-160 # 800093b0 <uart_tx_buf>
    80005458:	01c0006f          	j	80005474 <uartstart+0x50>
    8000545c:	0006c703          	lbu	a4,0(a3)
    80005460:	00f63023          	sd	a5,0(a2)
    80005464:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005468:	00063783          	ld	a5,0(a2)
    8000546c:	00053703          	ld	a4,0(a0)
    80005470:	00f70e63          	beq	a4,a5,8000548c <uartstart+0x68>
    80005474:	01f7f713          	andi	a4,a5,31
    80005478:	00e806b3          	add	a3,a6,a4
    8000547c:	0055c703          	lbu	a4,5(a1)
    80005480:	00178793          	addi	a5,a5,1
    80005484:	02077713          	andi	a4,a4,32
    80005488:	fc071ae3          	bnez	a4,8000545c <uartstart+0x38>
    8000548c:	00813403          	ld	s0,8(sp)
    80005490:	01010113          	addi	sp,sp,16
    80005494:	00008067          	ret

0000000080005498 <uartgetc>:
    80005498:	ff010113          	addi	sp,sp,-16
    8000549c:	00813423          	sd	s0,8(sp)
    800054a0:	01010413          	addi	s0,sp,16
    800054a4:	10000737          	lui	a4,0x10000
    800054a8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800054ac:	0017f793          	andi	a5,a5,1
    800054b0:	00078c63          	beqz	a5,800054c8 <uartgetc+0x30>
    800054b4:	00074503          	lbu	a0,0(a4)
    800054b8:	0ff57513          	andi	a0,a0,255
    800054bc:	00813403          	ld	s0,8(sp)
    800054c0:	01010113          	addi	sp,sp,16
    800054c4:	00008067          	ret
    800054c8:	fff00513          	li	a0,-1
    800054cc:	ff1ff06f          	j	800054bc <uartgetc+0x24>

00000000800054d0 <uartintr>:
    800054d0:	100007b7          	lui	a5,0x10000
    800054d4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800054d8:	0017f793          	andi	a5,a5,1
    800054dc:	0a078463          	beqz	a5,80005584 <uartintr+0xb4>
    800054e0:	fe010113          	addi	sp,sp,-32
    800054e4:	00813823          	sd	s0,16(sp)
    800054e8:	00913423          	sd	s1,8(sp)
    800054ec:	00113c23          	sd	ra,24(sp)
    800054f0:	02010413          	addi	s0,sp,32
    800054f4:	100004b7          	lui	s1,0x10000
    800054f8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800054fc:	0ff57513          	andi	a0,a0,255
    80005500:	fffff097          	auipc	ra,0xfffff
    80005504:	534080e7          	jalr	1332(ra) # 80004a34 <consoleintr>
    80005508:	0054c783          	lbu	a5,5(s1)
    8000550c:	0017f793          	andi	a5,a5,1
    80005510:	fe0794e3          	bnez	a5,800054f8 <uartintr+0x28>
    80005514:	00003617          	auipc	a2,0x3
    80005518:	bec60613          	addi	a2,a2,-1044 # 80008100 <uart_tx_r>
    8000551c:	00003517          	auipc	a0,0x3
    80005520:	bec50513          	addi	a0,a0,-1044 # 80008108 <uart_tx_w>
    80005524:	00063783          	ld	a5,0(a2)
    80005528:	00053703          	ld	a4,0(a0)
    8000552c:	04f70263          	beq	a4,a5,80005570 <uartintr+0xa0>
    80005530:	100005b7          	lui	a1,0x10000
    80005534:	00004817          	auipc	a6,0x4
    80005538:	e7c80813          	addi	a6,a6,-388 # 800093b0 <uart_tx_buf>
    8000553c:	01c0006f          	j	80005558 <uartintr+0x88>
    80005540:	0006c703          	lbu	a4,0(a3)
    80005544:	00f63023          	sd	a5,0(a2)
    80005548:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000554c:	00063783          	ld	a5,0(a2)
    80005550:	00053703          	ld	a4,0(a0)
    80005554:	00f70e63          	beq	a4,a5,80005570 <uartintr+0xa0>
    80005558:	01f7f713          	andi	a4,a5,31
    8000555c:	00e806b3          	add	a3,a6,a4
    80005560:	0055c703          	lbu	a4,5(a1)
    80005564:	00178793          	addi	a5,a5,1
    80005568:	02077713          	andi	a4,a4,32
    8000556c:	fc071ae3          	bnez	a4,80005540 <uartintr+0x70>
    80005570:	01813083          	ld	ra,24(sp)
    80005574:	01013403          	ld	s0,16(sp)
    80005578:	00813483          	ld	s1,8(sp)
    8000557c:	02010113          	addi	sp,sp,32
    80005580:	00008067          	ret
    80005584:	00003617          	auipc	a2,0x3
    80005588:	b7c60613          	addi	a2,a2,-1156 # 80008100 <uart_tx_r>
    8000558c:	00003517          	auipc	a0,0x3
    80005590:	b7c50513          	addi	a0,a0,-1156 # 80008108 <uart_tx_w>
    80005594:	00063783          	ld	a5,0(a2)
    80005598:	00053703          	ld	a4,0(a0)
    8000559c:	04f70263          	beq	a4,a5,800055e0 <uartintr+0x110>
    800055a0:	100005b7          	lui	a1,0x10000
    800055a4:	00004817          	auipc	a6,0x4
    800055a8:	e0c80813          	addi	a6,a6,-500 # 800093b0 <uart_tx_buf>
    800055ac:	01c0006f          	j	800055c8 <uartintr+0xf8>
    800055b0:	0006c703          	lbu	a4,0(a3)
    800055b4:	00f63023          	sd	a5,0(a2)
    800055b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800055bc:	00063783          	ld	a5,0(a2)
    800055c0:	00053703          	ld	a4,0(a0)
    800055c4:	02f70063          	beq	a4,a5,800055e4 <uartintr+0x114>
    800055c8:	01f7f713          	andi	a4,a5,31
    800055cc:	00e806b3          	add	a3,a6,a4
    800055d0:	0055c703          	lbu	a4,5(a1)
    800055d4:	00178793          	addi	a5,a5,1
    800055d8:	02077713          	andi	a4,a4,32
    800055dc:	fc071ae3          	bnez	a4,800055b0 <uartintr+0xe0>
    800055e0:	00008067          	ret
    800055e4:	00008067          	ret

00000000800055e8 <kinit>:
    800055e8:	fc010113          	addi	sp,sp,-64
    800055ec:	02913423          	sd	s1,40(sp)
    800055f0:	fffff7b7          	lui	a5,0xfffff
    800055f4:	00005497          	auipc	s1,0x5
    800055f8:	ddb48493          	addi	s1,s1,-549 # 8000a3cf <end+0xfff>
    800055fc:	02813823          	sd	s0,48(sp)
    80005600:	01313c23          	sd	s3,24(sp)
    80005604:	00f4f4b3          	and	s1,s1,a5
    80005608:	02113c23          	sd	ra,56(sp)
    8000560c:	03213023          	sd	s2,32(sp)
    80005610:	01413823          	sd	s4,16(sp)
    80005614:	01513423          	sd	s5,8(sp)
    80005618:	04010413          	addi	s0,sp,64
    8000561c:	000017b7          	lui	a5,0x1
    80005620:	01100993          	li	s3,17
    80005624:	00f487b3          	add	a5,s1,a5
    80005628:	01b99993          	slli	s3,s3,0x1b
    8000562c:	06f9e063          	bltu	s3,a5,8000568c <kinit+0xa4>
    80005630:	00004a97          	auipc	s5,0x4
    80005634:	da0a8a93          	addi	s5,s5,-608 # 800093d0 <end>
    80005638:	0754ec63          	bltu	s1,s5,800056b0 <kinit+0xc8>
    8000563c:	0734fa63          	bgeu	s1,s3,800056b0 <kinit+0xc8>
    80005640:	00088a37          	lui	s4,0x88
    80005644:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80005648:	00003917          	auipc	s2,0x3
    8000564c:	ac890913          	addi	s2,s2,-1336 # 80008110 <kmem>
    80005650:	00ca1a13          	slli	s4,s4,0xc
    80005654:	0140006f          	j	80005668 <kinit+0x80>
    80005658:	000017b7          	lui	a5,0x1
    8000565c:	00f484b3          	add	s1,s1,a5
    80005660:	0554e863          	bltu	s1,s5,800056b0 <kinit+0xc8>
    80005664:	0534f663          	bgeu	s1,s3,800056b0 <kinit+0xc8>
    80005668:	00001637          	lui	a2,0x1
    8000566c:	00100593          	li	a1,1
    80005670:	00048513          	mv	a0,s1
    80005674:	00000097          	auipc	ra,0x0
    80005678:	5e4080e7          	jalr	1508(ra) # 80005c58 <__memset>
    8000567c:	00093783          	ld	a5,0(s2)
    80005680:	00f4b023          	sd	a5,0(s1)
    80005684:	00993023          	sd	s1,0(s2)
    80005688:	fd4498e3          	bne	s1,s4,80005658 <kinit+0x70>
    8000568c:	03813083          	ld	ra,56(sp)
    80005690:	03013403          	ld	s0,48(sp)
    80005694:	02813483          	ld	s1,40(sp)
    80005698:	02013903          	ld	s2,32(sp)
    8000569c:	01813983          	ld	s3,24(sp)
    800056a0:	01013a03          	ld	s4,16(sp)
    800056a4:	00813a83          	ld	s5,8(sp)
    800056a8:	04010113          	addi	sp,sp,64
    800056ac:	00008067          	ret
    800056b0:	00002517          	auipc	a0,0x2
    800056b4:	e3850513          	addi	a0,a0,-456 # 800074e8 <digits+0x18>
    800056b8:	fffff097          	auipc	ra,0xfffff
    800056bc:	4b4080e7          	jalr	1204(ra) # 80004b6c <panic>

00000000800056c0 <freerange>:
    800056c0:	fc010113          	addi	sp,sp,-64
    800056c4:	000017b7          	lui	a5,0x1
    800056c8:	02913423          	sd	s1,40(sp)
    800056cc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800056d0:	009504b3          	add	s1,a0,s1
    800056d4:	fffff537          	lui	a0,0xfffff
    800056d8:	02813823          	sd	s0,48(sp)
    800056dc:	02113c23          	sd	ra,56(sp)
    800056e0:	03213023          	sd	s2,32(sp)
    800056e4:	01313c23          	sd	s3,24(sp)
    800056e8:	01413823          	sd	s4,16(sp)
    800056ec:	01513423          	sd	s5,8(sp)
    800056f0:	01613023          	sd	s6,0(sp)
    800056f4:	04010413          	addi	s0,sp,64
    800056f8:	00a4f4b3          	and	s1,s1,a0
    800056fc:	00f487b3          	add	a5,s1,a5
    80005700:	06f5e463          	bltu	a1,a5,80005768 <freerange+0xa8>
    80005704:	00004a97          	auipc	s5,0x4
    80005708:	ccca8a93          	addi	s5,s5,-820 # 800093d0 <end>
    8000570c:	0954e263          	bltu	s1,s5,80005790 <freerange+0xd0>
    80005710:	01100993          	li	s3,17
    80005714:	01b99993          	slli	s3,s3,0x1b
    80005718:	0734fc63          	bgeu	s1,s3,80005790 <freerange+0xd0>
    8000571c:	00058a13          	mv	s4,a1
    80005720:	00003917          	auipc	s2,0x3
    80005724:	9f090913          	addi	s2,s2,-1552 # 80008110 <kmem>
    80005728:	00002b37          	lui	s6,0x2
    8000572c:	0140006f          	j	80005740 <freerange+0x80>
    80005730:	000017b7          	lui	a5,0x1
    80005734:	00f484b3          	add	s1,s1,a5
    80005738:	0554ec63          	bltu	s1,s5,80005790 <freerange+0xd0>
    8000573c:	0534fa63          	bgeu	s1,s3,80005790 <freerange+0xd0>
    80005740:	00001637          	lui	a2,0x1
    80005744:	00100593          	li	a1,1
    80005748:	00048513          	mv	a0,s1
    8000574c:	00000097          	auipc	ra,0x0
    80005750:	50c080e7          	jalr	1292(ra) # 80005c58 <__memset>
    80005754:	00093703          	ld	a4,0(s2)
    80005758:	016487b3          	add	a5,s1,s6
    8000575c:	00e4b023          	sd	a4,0(s1)
    80005760:	00993023          	sd	s1,0(s2)
    80005764:	fcfa76e3          	bgeu	s4,a5,80005730 <freerange+0x70>
    80005768:	03813083          	ld	ra,56(sp)
    8000576c:	03013403          	ld	s0,48(sp)
    80005770:	02813483          	ld	s1,40(sp)
    80005774:	02013903          	ld	s2,32(sp)
    80005778:	01813983          	ld	s3,24(sp)
    8000577c:	01013a03          	ld	s4,16(sp)
    80005780:	00813a83          	ld	s5,8(sp)
    80005784:	00013b03          	ld	s6,0(sp)
    80005788:	04010113          	addi	sp,sp,64
    8000578c:	00008067          	ret
    80005790:	00002517          	auipc	a0,0x2
    80005794:	d5850513          	addi	a0,a0,-680 # 800074e8 <digits+0x18>
    80005798:	fffff097          	auipc	ra,0xfffff
    8000579c:	3d4080e7          	jalr	980(ra) # 80004b6c <panic>

00000000800057a0 <kfree>:
    800057a0:	fe010113          	addi	sp,sp,-32
    800057a4:	00813823          	sd	s0,16(sp)
    800057a8:	00113c23          	sd	ra,24(sp)
    800057ac:	00913423          	sd	s1,8(sp)
    800057b0:	02010413          	addi	s0,sp,32
    800057b4:	03451793          	slli	a5,a0,0x34
    800057b8:	04079c63          	bnez	a5,80005810 <kfree+0x70>
    800057bc:	00004797          	auipc	a5,0x4
    800057c0:	c1478793          	addi	a5,a5,-1004 # 800093d0 <end>
    800057c4:	00050493          	mv	s1,a0
    800057c8:	04f56463          	bltu	a0,a5,80005810 <kfree+0x70>
    800057cc:	01100793          	li	a5,17
    800057d0:	01b79793          	slli	a5,a5,0x1b
    800057d4:	02f57e63          	bgeu	a0,a5,80005810 <kfree+0x70>
    800057d8:	00001637          	lui	a2,0x1
    800057dc:	00100593          	li	a1,1
    800057e0:	00000097          	auipc	ra,0x0
    800057e4:	478080e7          	jalr	1144(ra) # 80005c58 <__memset>
    800057e8:	00003797          	auipc	a5,0x3
    800057ec:	92878793          	addi	a5,a5,-1752 # 80008110 <kmem>
    800057f0:	0007b703          	ld	a4,0(a5)
    800057f4:	01813083          	ld	ra,24(sp)
    800057f8:	01013403          	ld	s0,16(sp)
    800057fc:	00e4b023          	sd	a4,0(s1)
    80005800:	0097b023          	sd	s1,0(a5)
    80005804:	00813483          	ld	s1,8(sp)
    80005808:	02010113          	addi	sp,sp,32
    8000580c:	00008067          	ret
    80005810:	00002517          	auipc	a0,0x2
    80005814:	cd850513          	addi	a0,a0,-808 # 800074e8 <digits+0x18>
    80005818:	fffff097          	auipc	ra,0xfffff
    8000581c:	354080e7          	jalr	852(ra) # 80004b6c <panic>

0000000080005820 <kalloc>:
    80005820:	fe010113          	addi	sp,sp,-32
    80005824:	00813823          	sd	s0,16(sp)
    80005828:	00913423          	sd	s1,8(sp)
    8000582c:	00113c23          	sd	ra,24(sp)
    80005830:	02010413          	addi	s0,sp,32
    80005834:	00003797          	auipc	a5,0x3
    80005838:	8dc78793          	addi	a5,a5,-1828 # 80008110 <kmem>
    8000583c:	0007b483          	ld	s1,0(a5)
    80005840:	02048063          	beqz	s1,80005860 <kalloc+0x40>
    80005844:	0004b703          	ld	a4,0(s1)
    80005848:	00001637          	lui	a2,0x1
    8000584c:	00500593          	li	a1,5
    80005850:	00048513          	mv	a0,s1
    80005854:	00e7b023          	sd	a4,0(a5)
    80005858:	00000097          	auipc	ra,0x0
    8000585c:	400080e7          	jalr	1024(ra) # 80005c58 <__memset>
    80005860:	01813083          	ld	ra,24(sp)
    80005864:	01013403          	ld	s0,16(sp)
    80005868:	00048513          	mv	a0,s1
    8000586c:	00813483          	ld	s1,8(sp)
    80005870:	02010113          	addi	sp,sp,32
    80005874:	00008067          	ret

0000000080005878 <initlock>:
    80005878:	ff010113          	addi	sp,sp,-16
    8000587c:	00813423          	sd	s0,8(sp)
    80005880:	01010413          	addi	s0,sp,16
    80005884:	00813403          	ld	s0,8(sp)
    80005888:	00b53423          	sd	a1,8(a0)
    8000588c:	00052023          	sw	zero,0(a0)
    80005890:	00053823          	sd	zero,16(a0)
    80005894:	01010113          	addi	sp,sp,16
    80005898:	00008067          	ret

000000008000589c <acquire>:
    8000589c:	fe010113          	addi	sp,sp,-32
    800058a0:	00813823          	sd	s0,16(sp)
    800058a4:	00913423          	sd	s1,8(sp)
    800058a8:	00113c23          	sd	ra,24(sp)
    800058ac:	01213023          	sd	s2,0(sp)
    800058b0:	02010413          	addi	s0,sp,32
    800058b4:	00050493          	mv	s1,a0
    800058b8:	10002973          	csrr	s2,sstatus
    800058bc:	100027f3          	csrr	a5,sstatus
    800058c0:	ffd7f793          	andi	a5,a5,-3
    800058c4:	10079073          	csrw	sstatus,a5
    800058c8:	fffff097          	auipc	ra,0xfffff
    800058cc:	8ec080e7          	jalr	-1812(ra) # 800041b4 <mycpu>
    800058d0:	07852783          	lw	a5,120(a0)
    800058d4:	06078e63          	beqz	a5,80005950 <acquire+0xb4>
    800058d8:	fffff097          	auipc	ra,0xfffff
    800058dc:	8dc080e7          	jalr	-1828(ra) # 800041b4 <mycpu>
    800058e0:	07852783          	lw	a5,120(a0)
    800058e4:	0004a703          	lw	a4,0(s1)
    800058e8:	0017879b          	addiw	a5,a5,1
    800058ec:	06f52c23          	sw	a5,120(a0)
    800058f0:	04071063          	bnez	a4,80005930 <acquire+0x94>
    800058f4:	00100713          	li	a4,1
    800058f8:	00070793          	mv	a5,a4
    800058fc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005900:	0007879b          	sext.w	a5,a5
    80005904:	fe079ae3          	bnez	a5,800058f8 <acquire+0x5c>
    80005908:	0ff0000f          	fence
    8000590c:	fffff097          	auipc	ra,0xfffff
    80005910:	8a8080e7          	jalr	-1880(ra) # 800041b4 <mycpu>
    80005914:	01813083          	ld	ra,24(sp)
    80005918:	01013403          	ld	s0,16(sp)
    8000591c:	00a4b823          	sd	a0,16(s1)
    80005920:	00013903          	ld	s2,0(sp)
    80005924:	00813483          	ld	s1,8(sp)
    80005928:	02010113          	addi	sp,sp,32
    8000592c:	00008067          	ret
    80005930:	0104b903          	ld	s2,16(s1)
    80005934:	fffff097          	auipc	ra,0xfffff
    80005938:	880080e7          	jalr	-1920(ra) # 800041b4 <mycpu>
    8000593c:	faa91ce3          	bne	s2,a0,800058f4 <acquire+0x58>
    80005940:	00002517          	auipc	a0,0x2
    80005944:	bb050513          	addi	a0,a0,-1104 # 800074f0 <digits+0x20>
    80005948:	fffff097          	auipc	ra,0xfffff
    8000594c:	224080e7          	jalr	548(ra) # 80004b6c <panic>
    80005950:	00195913          	srli	s2,s2,0x1
    80005954:	fffff097          	auipc	ra,0xfffff
    80005958:	860080e7          	jalr	-1952(ra) # 800041b4 <mycpu>
    8000595c:	00197913          	andi	s2,s2,1
    80005960:	07252e23          	sw	s2,124(a0)
    80005964:	f75ff06f          	j	800058d8 <acquire+0x3c>

0000000080005968 <release>:
    80005968:	fe010113          	addi	sp,sp,-32
    8000596c:	00813823          	sd	s0,16(sp)
    80005970:	00113c23          	sd	ra,24(sp)
    80005974:	00913423          	sd	s1,8(sp)
    80005978:	01213023          	sd	s2,0(sp)
    8000597c:	02010413          	addi	s0,sp,32
    80005980:	00052783          	lw	a5,0(a0)
    80005984:	00079a63          	bnez	a5,80005998 <release+0x30>
    80005988:	00002517          	auipc	a0,0x2
    8000598c:	b7050513          	addi	a0,a0,-1168 # 800074f8 <digits+0x28>
    80005990:	fffff097          	auipc	ra,0xfffff
    80005994:	1dc080e7          	jalr	476(ra) # 80004b6c <panic>
    80005998:	01053903          	ld	s2,16(a0)
    8000599c:	00050493          	mv	s1,a0
    800059a0:	fffff097          	auipc	ra,0xfffff
    800059a4:	814080e7          	jalr	-2028(ra) # 800041b4 <mycpu>
    800059a8:	fea910e3          	bne	s2,a0,80005988 <release+0x20>
    800059ac:	0004b823          	sd	zero,16(s1)
    800059b0:	0ff0000f          	fence
    800059b4:	0f50000f          	fence	iorw,ow
    800059b8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800059bc:	ffffe097          	auipc	ra,0xffffe
    800059c0:	7f8080e7          	jalr	2040(ra) # 800041b4 <mycpu>
    800059c4:	100027f3          	csrr	a5,sstatus
    800059c8:	0027f793          	andi	a5,a5,2
    800059cc:	04079a63          	bnez	a5,80005a20 <release+0xb8>
    800059d0:	07852783          	lw	a5,120(a0)
    800059d4:	02f05e63          	blez	a5,80005a10 <release+0xa8>
    800059d8:	fff7871b          	addiw	a4,a5,-1
    800059dc:	06e52c23          	sw	a4,120(a0)
    800059e0:	00071c63          	bnez	a4,800059f8 <release+0x90>
    800059e4:	07c52783          	lw	a5,124(a0)
    800059e8:	00078863          	beqz	a5,800059f8 <release+0x90>
    800059ec:	100027f3          	csrr	a5,sstatus
    800059f0:	0027e793          	ori	a5,a5,2
    800059f4:	10079073          	csrw	sstatus,a5
    800059f8:	01813083          	ld	ra,24(sp)
    800059fc:	01013403          	ld	s0,16(sp)
    80005a00:	00813483          	ld	s1,8(sp)
    80005a04:	00013903          	ld	s2,0(sp)
    80005a08:	02010113          	addi	sp,sp,32
    80005a0c:	00008067          	ret
    80005a10:	00002517          	auipc	a0,0x2
    80005a14:	b0850513          	addi	a0,a0,-1272 # 80007518 <digits+0x48>
    80005a18:	fffff097          	auipc	ra,0xfffff
    80005a1c:	154080e7          	jalr	340(ra) # 80004b6c <panic>
    80005a20:	00002517          	auipc	a0,0x2
    80005a24:	ae050513          	addi	a0,a0,-1312 # 80007500 <digits+0x30>
    80005a28:	fffff097          	auipc	ra,0xfffff
    80005a2c:	144080e7          	jalr	324(ra) # 80004b6c <panic>

0000000080005a30 <holding>:
    80005a30:	00052783          	lw	a5,0(a0)
    80005a34:	00079663          	bnez	a5,80005a40 <holding+0x10>
    80005a38:	00000513          	li	a0,0
    80005a3c:	00008067          	ret
    80005a40:	fe010113          	addi	sp,sp,-32
    80005a44:	00813823          	sd	s0,16(sp)
    80005a48:	00913423          	sd	s1,8(sp)
    80005a4c:	00113c23          	sd	ra,24(sp)
    80005a50:	02010413          	addi	s0,sp,32
    80005a54:	01053483          	ld	s1,16(a0)
    80005a58:	ffffe097          	auipc	ra,0xffffe
    80005a5c:	75c080e7          	jalr	1884(ra) # 800041b4 <mycpu>
    80005a60:	01813083          	ld	ra,24(sp)
    80005a64:	01013403          	ld	s0,16(sp)
    80005a68:	40a48533          	sub	a0,s1,a0
    80005a6c:	00153513          	seqz	a0,a0
    80005a70:	00813483          	ld	s1,8(sp)
    80005a74:	02010113          	addi	sp,sp,32
    80005a78:	00008067          	ret

0000000080005a7c <push_off>:
    80005a7c:	fe010113          	addi	sp,sp,-32
    80005a80:	00813823          	sd	s0,16(sp)
    80005a84:	00113c23          	sd	ra,24(sp)
    80005a88:	00913423          	sd	s1,8(sp)
    80005a8c:	02010413          	addi	s0,sp,32
    80005a90:	100024f3          	csrr	s1,sstatus
    80005a94:	100027f3          	csrr	a5,sstatus
    80005a98:	ffd7f793          	andi	a5,a5,-3
    80005a9c:	10079073          	csrw	sstatus,a5
    80005aa0:	ffffe097          	auipc	ra,0xffffe
    80005aa4:	714080e7          	jalr	1812(ra) # 800041b4 <mycpu>
    80005aa8:	07852783          	lw	a5,120(a0)
    80005aac:	02078663          	beqz	a5,80005ad8 <push_off+0x5c>
    80005ab0:	ffffe097          	auipc	ra,0xffffe
    80005ab4:	704080e7          	jalr	1796(ra) # 800041b4 <mycpu>
    80005ab8:	07852783          	lw	a5,120(a0)
    80005abc:	01813083          	ld	ra,24(sp)
    80005ac0:	01013403          	ld	s0,16(sp)
    80005ac4:	0017879b          	addiw	a5,a5,1
    80005ac8:	06f52c23          	sw	a5,120(a0)
    80005acc:	00813483          	ld	s1,8(sp)
    80005ad0:	02010113          	addi	sp,sp,32
    80005ad4:	00008067          	ret
    80005ad8:	0014d493          	srli	s1,s1,0x1
    80005adc:	ffffe097          	auipc	ra,0xffffe
    80005ae0:	6d8080e7          	jalr	1752(ra) # 800041b4 <mycpu>
    80005ae4:	0014f493          	andi	s1,s1,1
    80005ae8:	06952e23          	sw	s1,124(a0)
    80005aec:	fc5ff06f          	j	80005ab0 <push_off+0x34>

0000000080005af0 <pop_off>:
    80005af0:	ff010113          	addi	sp,sp,-16
    80005af4:	00813023          	sd	s0,0(sp)
    80005af8:	00113423          	sd	ra,8(sp)
    80005afc:	01010413          	addi	s0,sp,16
    80005b00:	ffffe097          	auipc	ra,0xffffe
    80005b04:	6b4080e7          	jalr	1716(ra) # 800041b4 <mycpu>
    80005b08:	100027f3          	csrr	a5,sstatus
    80005b0c:	0027f793          	andi	a5,a5,2
    80005b10:	04079663          	bnez	a5,80005b5c <pop_off+0x6c>
    80005b14:	07852783          	lw	a5,120(a0)
    80005b18:	02f05a63          	blez	a5,80005b4c <pop_off+0x5c>
    80005b1c:	fff7871b          	addiw	a4,a5,-1
    80005b20:	06e52c23          	sw	a4,120(a0)
    80005b24:	00071c63          	bnez	a4,80005b3c <pop_off+0x4c>
    80005b28:	07c52783          	lw	a5,124(a0)
    80005b2c:	00078863          	beqz	a5,80005b3c <pop_off+0x4c>
    80005b30:	100027f3          	csrr	a5,sstatus
    80005b34:	0027e793          	ori	a5,a5,2
    80005b38:	10079073          	csrw	sstatus,a5
    80005b3c:	00813083          	ld	ra,8(sp)
    80005b40:	00013403          	ld	s0,0(sp)
    80005b44:	01010113          	addi	sp,sp,16
    80005b48:	00008067          	ret
    80005b4c:	00002517          	auipc	a0,0x2
    80005b50:	9cc50513          	addi	a0,a0,-1588 # 80007518 <digits+0x48>
    80005b54:	fffff097          	auipc	ra,0xfffff
    80005b58:	018080e7          	jalr	24(ra) # 80004b6c <panic>
    80005b5c:	00002517          	auipc	a0,0x2
    80005b60:	9a450513          	addi	a0,a0,-1628 # 80007500 <digits+0x30>
    80005b64:	fffff097          	auipc	ra,0xfffff
    80005b68:	008080e7          	jalr	8(ra) # 80004b6c <panic>

0000000080005b6c <push_on>:
    80005b6c:	fe010113          	addi	sp,sp,-32
    80005b70:	00813823          	sd	s0,16(sp)
    80005b74:	00113c23          	sd	ra,24(sp)
    80005b78:	00913423          	sd	s1,8(sp)
    80005b7c:	02010413          	addi	s0,sp,32
    80005b80:	100024f3          	csrr	s1,sstatus
    80005b84:	100027f3          	csrr	a5,sstatus
    80005b88:	0027e793          	ori	a5,a5,2
    80005b8c:	10079073          	csrw	sstatus,a5
    80005b90:	ffffe097          	auipc	ra,0xffffe
    80005b94:	624080e7          	jalr	1572(ra) # 800041b4 <mycpu>
    80005b98:	07852783          	lw	a5,120(a0)
    80005b9c:	02078663          	beqz	a5,80005bc8 <push_on+0x5c>
    80005ba0:	ffffe097          	auipc	ra,0xffffe
    80005ba4:	614080e7          	jalr	1556(ra) # 800041b4 <mycpu>
    80005ba8:	07852783          	lw	a5,120(a0)
    80005bac:	01813083          	ld	ra,24(sp)
    80005bb0:	01013403          	ld	s0,16(sp)
    80005bb4:	0017879b          	addiw	a5,a5,1
    80005bb8:	06f52c23          	sw	a5,120(a0)
    80005bbc:	00813483          	ld	s1,8(sp)
    80005bc0:	02010113          	addi	sp,sp,32
    80005bc4:	00008067          	ret
    80005bc8:	0014d493          	srli	s1,s1,0x1
    80005bcc:	ffffe097          	auipc	ra,0xffffe
    80005bd0:	5e8080e7          	jalr	1512(ra) # 800041b4 <mycpu>
    80005bd4:	0014f493          	andi	s1,s1,1
    80005bd8:	06952e23          	sw	s1,124(a0)
    80005bdc:	fc5ff06f          	j	80005ba0 <push_on+0x34>

0000000080005be0 <pop_on>:
    80005be0:	ff010113          	addi	sp,sp,-16
    80005be4:	00813023          	sd	s0,0(sp)
    80005be8:	00113423          	sd	ra,8(sp)
    80005bec:	01010413          	addi	s0,sp,16
    80005bf0:	ffffe097          	auipc	ra,0xffffe
    80005bf4:	5c4080e7          	jalr	1476(ra) # 800041b4 <mycpu>
    80005bf8:	100027f3          	csrr	a5,sstatus
    80005bfc:	0027f793          	andi	a5,a5,2
    80005c00:	04078463          	beqz	a5,80005c48 <pop_on+0x68>
    80005c04:	07852783          	lw	a5,120(a0)
    80005c08:	02f05863          	blez	a5,80005c38 <pop_on+0x58>
    80005c0c:	fff7879b          	addiw	a5,a5,-1
    80005c10:	06f52c23          	sw	a5,120(a0)
    80005c14:	07853783          	ld	a5,120(a0)
    80005c18:	00079863          	bnez	a5,80005c28 <pop_on+0x48>
    80005c1c:	100027f3          	csrr	a5,sstatus
    80005c20:	ffd7f793          	andi	a5,a5,-3
    80005c24:	10079073          	csrw	sstatus,a5
    80005c28:	00813083          	ld	ra,8(sp)
    80005c2c:	00013403          	ld	s0,0(sp)
    80005c30:	01010113          	addi	sp,sp,16
    80005c34:	00008067          	ret
    80005c38:	00002517          	auipc	a0,0x2
    80005c3c:	90850513          	addi	a0,a0,-1784 # 80007540 <digits+0x70>
    80005c40:	fffff097          	auipc	ra,0xfffff
    80005c44:	f2c080e7          	jalr	-212(ra) # 80004b6c <panic>
    80005c48:	00002517          	auipc	a0,0x2
    80005c4c:	8d850513          	addi	a0,a0,-1832 # 80007520 <digits+0x50>
    80005c50:	fffff097          	auipc	ra,0xfffff
    80005c54:	f1c080e7          	jalr	-228(ra) # 80004b6c <panic>

0000000080005c58 <__memset>:
    80005c58:	ff010113          	addi	sp,sp,-16
    80005c5c:	00813423          	sd	s0,8(sp)
    80005c60:	01010413          	addi	s0,sp,16
    80005c64:	1a060e63          	beqz	a2,80005e20 <__memset+0x1c8>
    80005c68:	40a007b3          	neg	a5,a0
    80005c6c:	0077f793          	andi	a5,a5,7
    80005c70:	00778693          	addi	a3,a5,7
    80005c74:	00b00813          	li	a6,11
    80005c78:	0ff5f593          	andi	a1,a1,255
    80005c7c:	fff6071b          	addiw	a4,a2,-1
    80005c80:	1b06e663          	bltu	a3,a6,80005e2c <__memset+0x1d4>
    80005c84:	1cd76463          	bltu	a4,a3,80005e4c <__memset+0x1f4>
    80005c88:	1a078e63          	beqz	a5,80005e44 <__memset+0x1ec>
    80005c8c:	00b50023          	sb	a1,0(a0)
    80005c90:	00100713          	li	a4,1
    80005c94:	1ae78463          	beq	a5,a4,80005e3c <__memset+0x1e4>
    80005c98:	00b500a3          	sb	a1,1(a0)
    80005c9c:	00200713          	li	a4,2
    80005ca0:	1ae78a63          	beq	a5,a4,80005e54 <__memset+0x1fc>
    80005ca4:	00b50123          	sb	a1,2(a0)
    80005ca8:	00300713          	li	a4,3
    80005cac:	18e78463          	beq	a5,a4,80005e34 <__memset+0x1dc>
    80005cb0:	00b501a3          	sb	a1,3(a0)
    80005cb4:	00400713          	li	a4,4
    80005cb8:	1ae78263          	beq	a5,a4,80005e5c <__memset+0x204>
    80005cbc:	00b50223          	sb	a1,4(a0)
    80005cc0:	00500713          	li	a4,5
    80005cc4:	1ae78063          	beq	a5,a4,80005e64 <__memset+0x20c>
    80005cc8:	00b502a3          	sb	a1,5(a0)
    80005ccc:	00700713          	li	a4,7
    80005cd0:	18e79e63          	bne	a5,a4,80005e6c <__memset+0x214>
    80005cd4:	00b50323          	sb	a1,6(a0)
    80005cd8:	00700e93          	li	t4,7
    80005cdc:	00859713          	slli	a4,a1,0x8
    80005ce0:	00e5e733          	or	a4,a1,a4
    80005ce4:	01059e13          	slli	t3,a1,0x10
    80005ce8:	01c76e33          	or	t3,a4,t3
    80005cec:	01859313          	slli	t1,a1,0x18
    80005cf0:	006e6333          	or	t1,t3,t1
    80005cf4:	02059893          	slli	a7,a1,0x20
    80005cf8:	40f60e3b          	subw	t3,a2,a5
    80005cfc:	011368b3          	or	a7,t1,a7
    80005d00:	02859813          	slli	a6,a1,0x28
    80005d04:	0108e833          	or	a6,a7,a6
    80005d08:	03059693          	slli	a3,a1,0x30
    80005d0c:	003e589b          	srliw	a7,t3,0x3
    80005d10:	00d866b3          	or	a3,a6,a3
    80005d14:	03859713          	slli	a4,a1,0x38
    80005d18:	00389813          	slli	a6,a7,0x3
    80005d1c:	00f507b3          	add	a5,a0,a5
    80005d20:	00e6e733          	or	a4,a3,a4
    80005d24:	000e089b          	sext.w	a7,t3
    80005d28:	00f806b3          	add	a3,a6,a5
    80005d2c:	00e7b023          	sd	a4,0(a5)
    80005d30:	00878793          	addi	a5,a5,8
    80005d34:	fed79ce3          	bne	a5,a3,80005d2c <__memset+0xd4>
    80005d38:	ff8e7793          	andi	a5,t3,-8
    80005d3c:	0007871b          	sext.w	a4,a5
    80005d40:	01d787bb          	addw	a5,a5,t4
    80005d44:	0ce88e63          	beq	a7,a4,80005e20 <__memset+0x1c8>
    80005d48:	00f50733          	add	a4,a0,a5
    80005d4c:	00b70023          	sb	a1,0(a4)
    80005d50:	0017871b          	addiw	a4,a5,1
    80005d54:	0cc77663          	bgeu	a4,a2,80005e20 <__memset+0x1c8>
    80005d58:	00e50733          	add	a4,a0,a4
    80005d5c:	00b70023          	sb	a1,0(a4)
    80005d60:	0027871b          	addiw	a4,a5,2
    80005d64:	0ac77e63          	bgeu	a4,a2,80005e20 <__memset+0x1c8>
    80005d68:	00e50733          	add	a4,a0,a4
    80005d6c:	00b70023          	sb	a1,0(a4)
    80005d70:	0037871b          	addiw	a4,a5,3
    80005d74:	0ac77663          	bgeu	a4,a2,80005e20 <__memset+0x1c8>
    80005d78:	00e50733          	add	a4,a0,a4
    80005d7c:	00b70023          	sb	a1,0(a4)
    80005d80:	0047871b          	addiw	a4,a5,4
    80005d84:	08c77e63          	bgeu	a4,a2,80005e20 <__memset+0x1c8>
    80005d88:	00e50733          	add	a4,a0,a4
    80005d8c:	00b70023          	sb	a1,0(a4)
    80005d90:	0057871b          	addiw	a4,a5,5
    80005d94:	08c77663          	bgeu	a4,a2,80005e20 <__memset+0x1c8>
    80005d98:	00e50733          	add	a4,a0,a4
    80005d9c:	00b70023          	sb	a1,0(a4)
    80005da0:	0067871b          	addiw	a4,a5,6
    80005da4:	06c77e63          	bgeu	a4,a2,80005e20 <__memset+0x1c8>
    80005da8:	00e50733          	add	a4,a0,a4
    80005dac:	00b70023          	sb	a1,0(a4)
    80005db0:	0077871b          	addiw	a4,a5,7
    80005db4:	06c77663          	bgeu	a4,a2,80005e20 <__memset+0x1c8>
    80005db8:	00e50733          	add	a4,a0,a4
    80005dbc:	00b70023          	sb	a1,0(a4)
    80005dc0:	0087871b          	addiw	a4,a5,8
    80005dc4:	04c77e63          	bgeu	a4,a2,80005e20 <__memset+0x1c8>
    80005dc8:	00e50733          	add	a4,a0,a4
    80005dcc:	00b70023          	sb	a1,0(a4)
    80005dd0:	0097871b          	addiw	a4,a5,9
    80005dd4:	04c77663          	bgeu	a4,a2,80005e20 <__memset+0x1c8>
    80005dd8:	00e50733          	add	a4,a0,a4
    80005ddc:	00b70023          	sb	a1,0(a4)
    80005de0:	00a7871b          	addiw	a4,a5,10
    80005de4:	02c77e63          	bgeu	a4,a2,80005e20 <__memset+0x1c8>
    80005de8:	00e50733          	add	a4,a0,a4
    80005dec:	00b70023          	sb	a1,0(a4)
    80005df0:	00b7871b          	addiw	a4,a5,11
    80005df4:	02c77663          	bgeu	a4,a2,80005e20 <__memset+0x1c8>
    80005df8:	00e50733          	add	a4,a0,a4
    80005dfc:	00b70023          	sb	a1,0(a4)
    80005e00:	00c7871b          	addiw	a4,a5,12
    80005e04:	00c77e63          	bgeu	a4,a2,80005e20 <__memset+0x1c8>
    80005e08:	00e50733          	add	a4,a0,a4
    80005e0c:	00b70023          	sb	a1,0(a4)
    80005e10:	00d7879b          	addiw	a5,a5,13
    80005e14:	00c7f663          	bgeu	a5,a2,80005e20 <__memset+0x1c8>
    80005e18:	00f507b3          	add	a5,a0,a5
    80005e1c:	00b78023          	sb	a1,0(a5)
    80005e20:	00813403          	ld	s0,8(sp)
    80005e24:	01010113          	addi	sp,sp,16
    80005e28:	00008067          	ret
    80005e2c:	00b00693          	li	a3,11
    80005e30:	e55ff06f          	j	80005c84 <__memset+0x2c>
    80005e34:	00300e93          	li	t4,3
    80005e38:	ea5ff06f          	j	80005cdc <__memset+0x84>
    80005e3c:	00100e93          	li	t4,1
    80005e40:	e9dff06f          	j	80005cdc <__memset+0x84>
    80005e44:	00000e93          	li	t4,0
    80005e48:	e95ff06f          	j	80005cdc <__memset+0x84>
    80005e4c:	00000793          	li	a5,0
    80005e50:	ef9ff06f          	j	80005d48 <__memset+0xf0>
    80005e54:	00200e93          	li	t4,2
    80005e58:	e85ff06f          	j	80005cdc <__memset+0x84>
    80005e5c:	00400e93          	li	t4,4
    80005e60:	e7dff06f          	j	80005cdc <__memset+0x84>
    80005e64:	00500e93          	li	t4,5
    80005e68:	e75ff06f          	j	80005cdc <__memset+0x84>
    80005e6c:	00600e93          	li	t4,6
    80005e70:	e6dff06f          	j	80005cdc <__memset+0x84>

0000000080005e74 <__memmove>:
    80005e74:	ff010113          	addi	sp,sp,-16
    80005e78:	00813423          	sd	s0,8(sp)
    80005e7c:	01010413          	addi	s0,sp,16
    80005e80:	0e060863          	beqz	a2,80005f70 <__memmove+0xfc>
    80005e84:	fff6069b          	addiw	a3,a2,-1
    80005e88:	0006881b          	sext.w	a6,a3
    80005e8c:	0ea5e863          	bltu	a1,a0,80005f7c <__memmove+0x108>
    80005e90:	00758713          	addi	a4,a1,7
    80005e94:	00a5e7b3          	or	a5,a1,a0
    80005e98:	40a70733          	sub	a4,a4,a0
    80005e9c:	0077f793          	andi	a5,a5,7
    80005ea0:	00f73713          	sltiu	a4,a4,15
    80005ea4:	00174713          	xori	a4,a4,1
    80005ea8:	0017b793          	seqz	a5,a5
    80005eac:	00e7f7b3          	and	a5,a5,a4
    80005eb0:	10078863          	beqz	a5,80005fc0 <__memmove+0x14c>
    80005eb4:	00900793          	li	a5,9
    80005eb8:	1107f463          	bgeu	a5,a6,80005fc0 <__memmove+0x14c>
    80005ebc:	0036581b          	srliw	a6,a2,0x3
    80005ec0:	fff8081b          	addiw	a6,a6,-1
    80005ec4:	02081813          	slli	a6,a6,0x20
    80005ec8:	01d85893          	srli	a7,a6,0x1d
    80005ecc:	00858813          	addi	a6,a1,8
    80005ed0:	00058793          	mv	a5,a1
    80005ed4:	00050713          	mv	a4,a0
    80005ed8:	01088833          	add	a6,a7,a6
    80005edc:	0007b883          	ld	a7,0(a5)
    80005ee0:	00878793          	addi	a5,a5,8
    80005ee4:	00870713          	addi	a4,a4,8
    80005ee8:	ff173c23          	sd	a7,-8(a4)
    80005eec:	ff0798e3          	bne	a5,a6,80005edc <__memmove+0x68>
    80005ef0:	ff867713          	andi	a4,a2,-8
    80005ef4:	02071793          	slli	a5,a4,0x20
    80005ef8:	0207d793          	srli	a5,a5,0x20
    80005efc:	00f585b3          	add	a1,a1,a5
    80005f00:	40e686bb          	subw	a3,a3,a4
    80005f04:	00f507b3          	add	a5,a0,a5
    80005f08:	06e60463          	beq	a2,a4,80005f70 <__memmove+0xfc>
    80005f0c:	0005c703          	lbu	a4,0(a1)
    80005f10:	00e78023          	sb	a4,0(a5)
    80005f14:	04068e63          	beqz	a3,80005f70 <__memmove+0xfc>
    80005f18:	0015c603          	lbu	a2,1(a1)
    80005f1c:	00100713          	li	a4,1
    80005f20:	00c780a3          	sb	a2,1(a5)
    80005f24:	04e68663          	beq	a3,a4,80005f70 <__memmove+0xfc>
    80005f28:	0025c603          	lbu	a2,2(a1)
    80005f2c:	00200713          	li	a4,2
    80005f30:	00c78123          	sb	a2,2(a5)
    80005f34:	02e68e63          	beq	a3,a4,80005f70 <__memmove+0xfc>
    80005f38:	0035c603          	lbu	a2,3(a1)
    80005f3c:	00300713          	li	a4,3
    80005f40:	00c781a3          	sb	a2,3(a5)
    80005f44:	02e68663          	beq	a3,a4,80005f70 <__memmove+0xfc>
    80005f48:	0045c603          	lbu	a2,4(a1)
    80005f4c:	00400713          	li	a4,4
    80005f50:	00c78223          	sb	a2,4(a5)
    80005f54:	00e68e63          	beq	a3,a4,80005f70 <__memmove+0xfc>
    80005f58:	0055c603          	lbu	a2,5(a1)
    80005f5c:	00500713          	li	a4,5
    80005f60:	00c782a3          	sb	a2,5(a5)
    80005f64:	00e68663          	beq	a3,a4,80005f70 <__memmove+0xfc>
    80005f68:	0065c703          	lbu	a4,6(a1)
    80005f6c:	00e78323          	sb	a4,6(a5)
    80005f70:	00813403          	ld	s0,8(sp)
    80005f74:	01010113          	addi	sp,sp,16
    80005f78:	00008067          	ret
    80005f7c:	02061713          	slli	a4,a2,0x20
    80005f80:	02075713          	srli	a4,a4,0x20
    80005f84:	00e587b3          	add	a5,a1,a4
    80005f88:	f0f574e3          	bgeu	a0,a5,80005e90 <__memmove+0x1c>
    80005f8c:	02069613          	slli	a2,a3,0x20
    80005f90:	02065613          	srli	a2,a2,0x20
    80005f94:	fff64613          	not	a2,a2
    80005f98:	00e50733          	add	a4,a0,a4
    80005f9c:	00c78633          	add	a2,a5,a2
    80005fa0:	fff7c683          	lbu	a3,-1(a5)
    80005fa4:	fff78793          	addi	a5,a5,-1
    80005fa8:	fff70713          	addi	a4,a4,-1
    80005fac:	00d70023          	sb	a3,0(a4)
    80005fb0:	fec798e3          	bne	a5,a2,80005fa0 <__memmove+0x12c>
    80005fb4:	00813403          	ld	s0,8(sp)
    80005fb8:	01010113          	addi	sp,sp,16
    80005fbc:	00008067          	ret
    80005fc0:	02069713          	slli	a4,a3,0x20
    80005fc4:	02075713          	srli	a4,a4,0x20
    80005fc8:	00170713          	addi	a4,a4,1
    80005fcc:	00e50733          	add	a4,a0,a4
    80005fd0:	00050793          	mv	a5,a0
    80005fd4:	0005c683          	lbu	a3,0(a1)
    80005fd8:	00178793          	addi	a5,a5,1
    80005fdc:	00158593          	addi	a1,a1,1
    80005fe0:	fed78fa3          	sb	a3,-1(a5)
    80005fe4:	fee798e3          	bne	a5,a4,80005fd4 <__memmove+0x160>
    80005fe8:	f89ff06f          	j	80005f70 <__memmove+0xfc>

0000000080005fec <__putc>:
    80005fec:	fe010113          	addi	sp,sp,-32
    80005ff0:	00813823          	sd	s0,16(sp)
    80005ff4:	00113c23          	sd	ra,24(sp)
    80005ff8:	02010413          	addi	s0,sp,32
    80005ffc:	00050793          	mv	a5,a0
    80006000:	fef40593          	addi	a1,s0,-17
    80006004:	00100613          	li	a2,1
    80006008:	00000513          	li	a0,0
    8000600c:	fef407a3          	sb	a5,-17(s0)
    80006010:	fffff097          	auipc	ra,0xfffff
    80006014:	b3c080e7          	jalr	-1220(ra) # 80004b4c <console_write>
    80006018:	01813083          	ld	ra,24(sp)
    8000601c:	01013403          	ld	s0,16(sp)
    80006020:	02010113          	addi	sp,sp,32
    80006024:	00008067          	ret

0000000080006028 <__getc>:
    80006028:	fe010113          	addi	sp,sp,-32
    8000602c:	00813823          	sd	s0,16(sp)
    80006030:	00113c23          	sd	ra,24(sp)
    80006034:	02010413          	addi	s0,sp,32
    80006038:	fe840593          	addi	a1,s0,-24
    8000603c:	00100613          	li	a2,1
    80006040:	00000513          	li	a0,0
    80006044:	fffff097          	auipc	ra,0xfffff
    80006048:	ae8080e7          	jalr	-1304(ra) # 80004b2c <console_read>
    8000604c:	fe844503          	lbu	a0,-24(s0)
    80006050:	01813083          	ld	ra,24(sp)
    80006054:	01013403          	ld	s0,16(sp)
    80006058:	02010113          	addi	sp,sp,32
    8000605c:	00008067          	ret

0000000080006060 <console_handler>:
    80006060:	fe010113          	addi	sp,sp,-32
    80006064:	00813823          	sd	s0,16(sp)
    80006068:	00113c23          	sd	ra,24(sp)
    8000606c:	00913423          	sd	s1,8(sp)
    80006070:	02010413          	addi	s0,sp,32
    80006074:	14202773          	csrr	a4,scause
    80006078:	100027f3          	csrr	a5,sstatus
    8000607c:	0027f793          	andi	a5,a5,2
    80006080:	06079e63          	bnez	a5,800060fc <console_handler+0x9c>
    80006084:	00074c63          	bltz	a4,8000609c <console_handler+0x3c>
    80006088:	01813083          	ld	ra,24(sp)
    8000608c:	01013403          	ld	s0,16(sp)
    80006090:	00813483          	ld	s1,8(sp)
    80006094:	02010113          	addi	sp,sp,32
    80006098:	00008067          	ret
    8000609c:	0ff77713          	andi	a4,a4,255
    800060a0:	00900793          	li	a5,9
    800060a4:	fef712e3          	bne	a4,a5,80006088 <console_handler+0x28>
    800060a8:	ffffe097          	auipc	ra,0xffffe
    800060ac:	6dc080e7          	jalr	1756(ra) # 80004784 <plic_claim>
    800060b0:	00a00793          	li	a5,10
    800060b4:	00050493          	mv	s1,a0
    800060b8:	02f50c63          	beq	a0,a5,800060f0 <console_handler+0x90>
    800060bc:	fc0506e3          	beqz	a0,80006088 <console_handler+0x28>
    800060c0:	00050593          	mv	a1,a0
    800060c4:	00001517          	auipc	a0,0x1
    800060c8:	38450513          	addi	a0,a0,900 # 80007448 <CONSOLE_STATUS+0x438>
    800060cc:	fffff097          	auipc	ra,0xfffff
    800060d0:	afc080e7          	jalr	-1284(ra) # 80004bc8 <__printf>
    800060d4:	01013403          	ld	s0,16(sp)
    800060d8:	01813083          	ld	ra,24(sp)
    800060dc:	00048513          	mv	a0,s1
    800060e0:	00813483          	ld	s1,8(sp)
    800060e4:	02010113          	addi	sp,sp,32
    800060e8:	ffffe317          	auipc	t1,0xffffe
    800060ec:	6d430067          	jr	1748(t1) # 800047bc <plic_complete>
    800060f0:	fffff097          	auipc	ra,0xfffff
    800060f4:	3e0080e7          	jalr	992(ra) # 800054d0 <uartintr>
    800060f8:	fddff06f          	j	800060d4 <console_handler+0x74>
    800060fc:	00001517          	auipc	a0,0x1
    80006100:	44c50513          	addi	a0,a0,1100 # 80007548 <digits+0x78>
    80006104:	fffff097          	auipc	ra,0xfffff
    80006108:	a68080e7          	jalr	-1432(ra) # 80004b6c <panic>
	...
