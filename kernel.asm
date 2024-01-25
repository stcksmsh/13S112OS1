
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00008117          	auipc	sp,0x8
    80000004:	0e813103          	ld	sp,232(sp) # 800080e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1c1040ef          	jal	ra,800049dc <start>

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
    8000107c:	6f5020ef          	jal	ra,80003f70 <exceptionHandler>


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
    8000111c:	0387b783          	ld	a5,56(a5) # 80008150 <_ZN5Timer8instanceE>
    80001120:	02079463          	bnez	a5,80001148 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80001124:	00007797          	auipc	a5,0x7
    80001128:	0297b623          	sd	s1,44(a5) # 80008150 <_ZN5Timer8instanceE>
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
    8000119c:	fb87b783          	ld	a5,-72(a5) # 80008150 <_ZN5Timer8instanceE>
    800011a0:	00078863          	beqz	a5,800011b0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800011a4:	00007517          	auipc	a0,0x7
    800011a8:	fac53503          	ld	a0,-84(a0) # 80008150 <_ZN5Timer8instanceE>
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
    800011e8:	f6c53503          	ld	a0,-148(a0) # 80008150 <_ZN5Timer8instanceE>
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
    80001240:	860080e7          	jalr	-1952(ra) # 80006a9c <__putc>
        __putc('t');
    80001244:	07400513          	li	a0,116
    80001248:	00006097          	auipc	ra,0x6
    8000124c:	854080e7          	jalr	-1964(ra) # 80006a9c <__putc>
        __putc('i');
    80001250:	06900513          	li	a0,105
    80001254:	00006097          	auipc	ra,0x6
    80001258:	848080e7          	jalr	-1976(ra) # 80006a9c <__putc>
        __putc('c');
    8000125c:	06300513          	li	a0,99
    80001260:	00006097          	auipc	ra,0x6
    80001264:	83c080e7          	jalr	-1988(ra) # 80006a9c <__putc>
        __putc('k');
    80001268:	06b00513          	li	a0,107
    8000126c:	00006097          	auipc	ra,0x6
    80001270:	830080e7          	jalr	-2000(ra) # 80006a9c <__putc>
        __putc('\n');
    80001274:	00a00513          	li	a0,10
    80001278:	00006097          	auipc	ra,0x6
    8000127c:	824080e7          	jalr	-2012(ra) # 80006a9c <__putc>
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
    800012a8:	830080e7          	jalr	-2000(ra) # 80002ad4 <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    800012ac:	0004b503          	ld	a0,0(s1)
    800012b0:	00003097          	auipc	ra,0x3
    800012b4:	3b4080e7          	jalr	948(ra) # 80004664 <_ZN9Scheduler3putEP7_thread>
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
    80001308:	dfc7b783          	ld	a5,-516(a5) # 80008100 <_GLOBAL_OFFSET_TABLE_+0x38>
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
    80001360:	778080e7          	jalr	1912(ra) # 80002ad4 <_ZN7_thread11setSleepingEb>
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
    800016ac:	400080e7          	jalr	1024(ra) # 80002aa8 <_ZN7_thread9setClosedEb>
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
    80001714:	9f07b783          	ld	a5,-1552(a5) # 80008100 <_GLOBAL_OFFSET_TABLE_+0x38>
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
    80001740:	9c47b783          	ld	a5,-1596(a5) # 80008100 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001744:	0007b503          	ld	a0,0(a5)
    80001748:	00001097          	auipc	ra,0x1
    8000174c:	330080e7          	jalr	816(ra) # 80002a78 <_ZN7_thread10setBlockedEb>
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
    800017c0:	2bc080e7          	jalr	700(ra) # 80002a78 <_ZN7_thread10setBlockedEb>
        // mem_free(pUnblock);
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    800017c4:	0004b503          	ld	a0,0(s1)
    800017c8:	00003097          	auipc	ra,0x3
    800017cc:	e9c080e7          	jalr	-356(ra) # 80004664 <_ZN9Scheduler3putEP7_thread>
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
    80001840:	470080e7          	jalr	1136(ra) # 80002cac <_ZN11HeapManagerD1Ev>
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
    80001898:	418080e7          	jalr	1048(ra) # 80002cac <_ZN11HeapManagerD1Ev>
    8000189c:	00048513          	mv	a0,s1
    800018a0:	00008097          	auipc	ra,0x8
    800018a4:	9b8080e7          	jalr	-1608(ra) # 80009258 <_Unwind_Resume>

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
    80001bf4:	054080e7          	jalr	84(ra) # 80002c44 <_ZN11HeapManagerC1Ev>
    80001bf8:	00848513          	addi	a0,s1,8
    80001bfc:	00003097          	auipc	ra,0x3
    80001c00:	9d0080e7          	jalr	-1584(ra) # 800045cc <_ZN9SchedulerC1Ev>
    80001c04:	01848513          	addi	a0,s1,24
    80001c08:	fffff097          	auipc	ra,0xfffff
    80001c0c:	4f8080e7          	jalr	1272(ra) # 80001100 <_ZN5TimerC1Ev>
    80001c10:	0200006f          	j	80001c30 <_ZN6KernelC1Ev+0x5c>
    80001c14:	00050913          	mv	s2,a0
    80001c18:	00048513          	mv	a0,s1
    80001c1c:	00001097          	auipc	ra,0x1
    80001c20:	090080e7          	jalr	144(ra) # 80002cac <_ZN11HeapManagerD1Ev>
    80001c24:	00090513          	mv	a0,s2
    80001c28:	00007097          	auipc	ra,0x7
    80001c2c:	630080e7          	jalr	1584(ra) # 80009258 <_Unwind_Resume>
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
    80001c5c:	4987b783          	ld	a5,1176(a5) # 800080f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c60:	10579073          	csrw	stvec,a5

    
    /// initialise the heap manager
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );
    80001c64:	00006797          	auipc	a5,0x6
    80001c68:	4947b783          	ld	a5,1172(a5) # 800080f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001c6c:	0007b603          	ld	a2,0(a5)
    80001c70:	00006797          	auipc	a5,0x6
    80001c74:	4607b783          	ld	a5,1120(a5) # 800080d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001c78:	0007b583          	ld	a1,0(a5)
    80001c7c:	00001097          	auipc	ra,0x1
    80001c80:	048080e7          	jalr	72(ra) # 80002cc4 <_ZN11HeapManager4initEmm>

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
    80001d70:	00003097          	auipc	ra,0x3
    80001d74:	ae4080e7          	jalr	-1308(ra) # 80004854 <_ZN9Scheduler3getEv>
    80001d78:	00006797          	auipc	a5,0x6
    80001d7c:	3887b783          	ld	a5,904(a5) # 80008100 <_GLOBAL_OFFSET_TABLE_+0x38>
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
    80001dd0:	30c5b583          	ld	a1,780(a1) # 800080d8 <_GLOBAL_OFFSET_TABLE_+0x10>
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
    80001e3c:	ff9ff06f          	j	80001e34 <_ZN6Kernel3runEv+0xe8>

0000000080001e40 <_Z13thread_test_1Pv>:
#include "assert.h"

sem_t sem1;
sem_t sem2;

void thread_test_1(void* args){
    80001e40:	ff010113          	addi	sp,sp,-16
    80001e44:	00113423          	sd	ra,8(sp)
    80001e48:	00813023          	sd	s0,0(sp)
    80001e4c:	01010413          	addi	s0,sp,16
    putc('1');
    80001e50:	03100513          	li	a0,49
    80001e54:	fffff097          	auipc	ra,0xfffff
    80001e58:	7ac080e7          	jalr	1964(ra) # 80001600 <_Z4putcc>
    putc('s');
    80001e5c:	07300513          	li	a0,115
    80001e60:	fffff097          	auipc	ra,0xfffff
    80001e64:	7a0080e7          	jalr	1952(ra) # 80001600 <_Z4putcc>
    time_sleep(30);
    80001e68:	01e00513          	li	a0,30
    80001e6c:	fffff097          	auipc	ra,0xfffff
    80001e70:	684080e7          	jalr	1668(ra) # 800014f0 <_Z10time_sleepm>
    putc('1');
    80001e74:	03100513          	li	a0,49
    80001e78:	fffff097          	auipc	ra,0xfffff
    80001e7c:	788080e7          	jalr	1928(ra) # 80001600 <_Z4putcc>
    sem_signal(sem1);
    80001e80:	00006517          	auipc	a0,0x6
    80001e84:	2d853503          	ld	a0,728(a0) # 80008158 <sem1>
    80001e88:	fffff097          	auipc	ra,0xfffff
    80001e8c:	724080e7          	jalr	1828(ra) # 800015ac <_Z10sem_signalP4_sem>
    putc('S');
    80001e90:	05300513          	li	a0,83
    80001e94:	fffff097          	auipc	ra,0xfffff
    80001e98:	76c080e7          	jalr	1900(ra) # 80001600 <_Z4putcc>
}
    80001e9c:	00813083          	ld	ra,8(sp)
    80001ea0:	00013403          	ld	s0,0(sp)
    80001ea4:	01010113          	addi	sp,sp,16
    80001ea8:	00008067          	ret

0000000080001eac <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80001eac:	ff010113          	addi	sp,sp,-16
    80001eb0:	00113423          	sd	ra,8(sp)
    80001eb4:	00813023          	sd	s0,0(sp)
    80001eb8:	01010413          	addi	s0,sp,16
    putc('2');
    80001ebc:	03200513          	li	a0,50
    80001ec0:	fffff097          	auipc	ra,0xfffff
    80001ec4:	740080e7          	jalr	1856(ra) # 80001600 <_Z4putcc>
    putc('s');
    80001ec8:	07300513          	li	a0,115
    80001ecc:	fffff097          	auipc	ra,0xfffff
    80001ed0:	734080e7          	jalr	1844(ra) # 80001600 <_Z4putcc>
    time_sleep(60);
    80001ed4:	03c00513          	li	a0,60
    80001ed8:	fffff097          	auipc	ra,0xfffff
    80001edc:	618080e7          	jalr	1560(ra) # 800014f0 <_Z10time_sleepm>
    putc('2');
    80001ee0:	03200513          	li	a0,50
    80001ee4:	fffff097          	auipc	ra,0xfffff
    80001ee8:	71c080e7          	jalr	1820(ra) # 80001600 <_Z4putcc>
    putc('S');
    80001eec:	05300513          	li	a0,83
    80001ef0:	fffff097          	auipc	ra,0xfffff
    80001ef4:	710080e7          	jalr	1808(ra) # 80001600 <_Z4putcc>
    sem_signal(sem2);
    80001ef8:	00006517          	auipc	a0,0x6
    80001efc:	26853503          	ld	a0,616(a0) # 80008160 <sem2>
    80001f00:	fffff097          	auipc	ra,0xfffff
    80001f04:	6ac080e7          	jalr	1708(ra) # 800015ac <_Z10sem_signalP4_sem>
    while(1);
    80001f08:	0000006f          	j	80001f08 <_Z13thread_test_2Pv+0x5c>

0000000080001f0c <_Z7memTestv>:
}

void memTest(){
    80001f0c:	fd010113          	addi	sp,sp,-48
    80001f10:	02113423          	sd	ra,40(sp)
    80001f14:	02813023          	sd	s0,32(sp)
    80001f18:	00913c23          	sd	s1,24(sp)
    80001f1c:	01213823          	sd	s2,16(sp)
    80001f20:	01313423          	sd	s3,8(sp)
    80001f24:	01413023          	sd	s4,0(sp)
    80001f28:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80001f2c:	00006797          	auipc	a5,0x6
    80001f30:	1b47b783          	ld	a5,436(a5) # 800080e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001f34:	0007b503          	ld	a0,0(a5)
    80001f38:	00001097          	auipc	ra,0x1
    80001f3c:	eb0080e7          	jalr	-336(ra) # 80002de8 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80001f40:	00050993          	mv	s3,a0
    putc('F');
    80001f44:	04600513          	li	a0,70
    80001f48:	fffff097          	auipc	ra,0xfffff
    80001f4c:	6b8080e7          	jalr	1720(ra) # 80001600 <_Z4putcc>
    putc('r');
    80001f50:	07200513          	li	a0,114
    80001f54:	fffff097          	auipc	ra,0xfffff
    80001f58:	6ac080e7          	jalr	1708(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001f5c:	06500513          	li	a0,101
    80001f60:	fffff097          	auipc	ra,0xfffff
    80001f64:	6a0080e7          	jalr	1696(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001f68:	06500513          	li	a0,101
    80001f6c:	fffff097          	auipc	ra,0xfffff
    80001f70:	694080e7          	jalr	1684(ra) # 80001600 <_Z4putcc>
    putc(' ');
    80001f74:	02000513          	li	a0,32
    80001f78:	fffff097          	auipc	ra,0xfffff
    80001f7c:	688080e7          	jalr	1672(ra) # 80001600 <_Z4putcc>
    putc('m');
    80001f80:	06d00513          	li	a0,109
    80001f84:	fffff097          	auipc	ra,0xfffff
    80001f88:	67c080e7          	jalr	1660(ra) # 80001600 <_Z4putcc>
    putc('e');
    80001f8c:	06500513          	li	a0,101
    80001f90:	fffff097          	auipc	ra,0xfffff
    80001f94:	670080e7          	jalr	1648(ra) # 80001600 <_Z4putcc>
    putc('m');
    80001f98:	06d00513          	li	a0,109
    80001f9c:	fffff097          	auipc	ra,0xfffff
    80001fa0:	664080e7          	jalr	1636(ra) # 80001600 <_Z4putcc>
    putc('o');
    80001fa4:	06f00513          	li	a0,111
    80001fa8:	fffff097          	auipc	ra,0xfffff
    80001fac:	658080e7          	jalr	1624(ra) # 80001600 <_Z4putcc>
    putc('r');
    80001fb0:	07200513          	li	a0,114
    80001fb4:	fffff097          	auipc	ra,0xfffff
    80001fb8:	64c080e7          	jalr	1612(ra) # 80001600 <_Z4putcc>
    putc('y');
    80001fbc:	07900513          	li	a0,121
    80001fc0:	fffff097          	auipc	ra,0xfffff
    80001fc4:	640080e7          	jalr	1600(ra) # 80001600 <_Z4putcc>
    putc(':');
    80001fc8:	03a00513          	li	a0,58
    80001fcc:	fffff097          	auipc	ra,0xfffff
    80001fd0:	634080e7          	jalr	1588(ra) # 80001600 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001fd4:	00f00493          	li	s1,15
    80001fd8:	0140006f          	j	80001fec <_Z7memTestv+0xe0>
        int digit = (freeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80001fdc:	05750513          	addi	a0,a0,87
    80001fe0:	fffff097          	auipc	ra,0xfffff
    80001fe4:	620080e7          	jalr	1568(ra) # 80001600 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001fe8:	fff4849b          	addiw	s1,s1,-1
    80001fec:	0204c463          	bltz	s1,80002014 <_Z7memTestv+0x108>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    80001ff0:	0024951b          	slliw	a0,s1,0x2
    80001ff4:	00a9d533          	srl	a0,s3,a0
    80001ff8:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80001ffc:	00900793          	li	a5,9
    80002000:	fca7cee3          	blt	a5,a0,80001fdc <_Z7memTestv+0xd0>
            putc('0' + digit);
    80002004:	03050513          	addi	a0,a0,48
    80002008:	fffff097          	auipc	ra,0xfffff
    8000200c:	5f8080e7          	jalr	1528(ra) # 80001600 <_Z4putcc>
    80002010:	fd9ff06f          	j	80001fe8 <_Z7memTestv+0xdc>
        }
    }
    putc('\n');
    80002014:	00a00513          	li	a0,10
    80002018:	fffff097          	auipc	ra,0xfffff
    8000201c:	5e8080e7          	jalr	1512(ra) # 80001600 <_Z4putcc>
    int n = 100;
    int k = 100;
    int** matrix = (int**)mem_alloc(sizeof(int*) * n);
    80002020:	32000513          	li	a0,800
    80002024:	fffff097          	auipc	ra,0xfffff
    80002028:	390080e7          	jalr	912(ra) # 800013b4 <_Z9mem_allocm>
    8000202c:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    80002030:	00000493          	li	s1,0
    80002034:	0080006f          	j	8000203c <_Z7memTestv+0x130>
    80002038:	0014849b          	addiw	s1,s1,1
    8000203c:	06300793          	li	a5,99
    80002040:	0497c663          	blt	a5,s1,8000208c <_Z7memTestv+0x180>
        matrix[i] = (int*)mem_alloc(sizeof(int) * k);
    80002044:	00349a13          	slli	s4,s1,0x3
    80002048:	01490a33          	add	s4,s2,s4
    8000204c:	19000513          	li	a0,400
    80002050:	fffff097          	auipc	ra,0xfffff
    80002054:	364080e7          	jalr	868(ra) # 800013b4 <_Z9mem_allocm>
    80002058:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    8000205c:	00000713          	li	a4,0
    80002060:	06300793          	li	a5,99
    80002064:	fce7cae3          	blt	a5,a4,80002038 <_Z7memTestv+0x12c>
            matrix[i][j] = i * k + j;
    80002068:	06400793          	li	a5,100
    8000206c:	029787bb          	mulw	a5,a5,s1
    80002070:	000a3683          	ld	a3,0(s4)
    80002074:	00271613          	slli	a2,a4,0x2
    80002078:	00c686b3          	add	a3,a3,a2
    8000207c:	00e787bb          	addw	a5,a5,a4
    80002080:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80002084:	0017071b          	addiw	a4,a4,1
    80002088:	fd9ff06f          	j	80002060 <_Z7memTestv+0x154>
        }
    }
    for(int i = 0; i < n; i++){
    8000208c:	00000a13          	li	s4,0
    80002090:	0780006f          	j	80002108 <_Z7memTestv+0x1fc>
        for(int j = 0; j < k; j++){
    80002094:	0014849b          	addiw	s1,s1,1
    80002098:	06300793          	li	a5,99
    8000209c:	0497ca63          	blt	a5,s1,800020f0 <_Z7memTestv+0x1e4>
            assert(matrix[i][j] == i * k + j);
    800020a0:	003a1793          	slli	a5,s4,0x3
    800020a4:	00f907b3          	add	a5,s2,a5
    800020a8:	0007b783          	ld	a5,0(a5)
    800020ac:	00249713          	slli	a4,s1,0x2
    800020b0:	00e787b3          	add	a5,a5,a4
    800020b4:	0007a703          	lw	a4,0(a5)
    800020b8:	06400793          	li	a5,100
    800020bc:	034787bb          	mulw	a5,a5,s4
    800020c0:	009787bb          	addw	a5,a5,s1
    800020c4:	fcf708e3          	beq	a4,a5,80002094 <_Z7memTestv+0x188>
    800020c8:	00005697          	auipc	a3,0x5
    800020cc:	00868693          	addi	a3,a3,8 # 800070d0 <CONSOLE_STATUS+0xc0>
    800020d0:	04100613          	li	a2,65
    800020d4:	00005597          	auipc	a1,0x5
    800020d8:	00c58593          	addi	a1,a1,12 # 800070e0 <CONSOLE_STATUS+0xd0>
    800020dc:	00005517          	auipc	a0,0x5
    800020e0:	01c50513          	addi	a0,a0,28 # 800070f8 <CONSOLE_STATUS+0xe8>
    800020e4:	fffff097          	auipc	ra,0xfffff
    800020e8:	7c4080e7          	jalr	1988(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    800020ec:	fa9ff06f          	j	80002094 <_Z7memTestv+0x188>
        }
        mem_free(matrix[i]);
    800020f0:	003a1793          	slli	a5,s4,0x3
    800020f4:	00f907b3          	add	a5,s2,a5
    800020f8:	0007b503          	ld	a0,0(a5)
    800020fc:	fffff097          	auipc	ra,0xfffff
    80002100:	2e8080e7          	jalr	744(ra) # 800013e4 <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    80002104:	001a0a1b          	addiw	s4,s4,1
    80002108:	06300793          	li	a5,99
    8000210c:	0147c663          	blt	a5,s4,80002118 <_Z7memTestv+0x20c>
        for(int j = 0; j < k; j++){
    80002110:	00000493          	li	s1,0
    80002114:	f85ff06f          	j	80002098 <_Z7memTestv+0x18c>
    }
    mem_free(matrix);
    80002118:	00090513          	mv	a0,s2
    8000211c:	fffff097          	auipc	ra,0xfffff
    80002120:	2c8080e7          	jalr	712(ra) # 800013e4 <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002124:	00006797          	auipc	a5,0x6
    80002128:	fbc7b783          	ld	a5,-68(a5) # 800080e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000212c:	0007b503          	ld	a0,0(a5)
    80002130:	00001097          	auipc	ra,0x1
    80002134:	cb8080e7          	jalr	-840(ra) # 80002de8 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002138:	00050493          	mv	s1,a0
    putc('F');
    8000213c:	04600513          	li	a0,70
    80002140:	fffff097          	auipc	ra,0xfffff
    80002144:	4c0080e7          	jalr	1216(ra) # 80001600 <_Z4putcc>
    putc('r');
    80002148:	07200513          	li	a0,114
    8000214c:	fffff097          	auipc	ra,0xfffff
    80002150:	4b4080e7          	jalr	1204(ra) # 80001600 <_Z4putcc>
    putc('e');
    80002154:	06500513          	li	a0,101
    80002158:	fffff097          	auipc	ra,0xfffff
    8000215c:	4a8080e7          	jalr	1192(ra) # 80001600 <_Z4putcc>
    putc('e');
    80002160:	06500513          	li	a0,101
    80002164:	fffff097          	auipc	ra,0xfffff
    80002168:	49c080e7          	jalr	1180(ra) # 80001600 <_Z4putcc>
    putc(' ');
    8000216c:	02000513          	li	a0,32
    80002170:	fffff097          	auipc	ra,0xfffff
    80002174:	490080e7          	jalr	1168(ra) # 80001600 <_Z4putcc>
    putc('m');
    80002178:	06d00513          	li	a0,109
    8000217c:	fffff097          	auipc	ra,0xfffff
    80002180:	484080e7          	jalr	1156(ra) # 80001600 <_Z4putcc>
    putc('e');
    80002184:	06500513          	li	a0,101
    80002188:	fffff097          	auipc	ra,0xfffff
    8000218c:	478080e7          	jalr	1144(ra) # 80001600 <_Z4putcc>
    putc('m');
    80002190:	06d00513          	li	a0,109
    80002194:	fffff097          	auipc	ra,0xfffff
    80002198:	46c080e7          	jalr	1132(ra) # 80001600 <_Z4putcc>
    putc('o');
    8000219c:	06f00513          	li	a0,111
    800021a0:	fffff097          	auipc	ra,0xfffff
    800021a4:	460080e7          	jalr	1120(ra) # 80001600 <_Z4putcc>
    putc('r');
    800021a8:	07200513          	li	a0,114
    800021ac:	fffff097          	auipc	ra,0xfffff
    800021b0:	454080e7          	jalr	1108(ra) # 80001600 <_Z4putcc>
    putc('y');
    800021b4:	07900513          	li	a0,121
    800021b8:	fffff097          	auipc	ra,0xfffff
    800021bc:	448080e7          	jalr	1096(ra) # 80001600 <_Z4putcc>
    putc(':');
    800021c0:	03a00513          	li	a0,58
    800021c4:	fffff097          	auipc	ra,0xfffff
    800021c8:	43c080e7          	jalr	1084(ra) # 80001600 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800021cc:	00f00913          	li	s2,15
    800021d0:	0140006f          	j	800021e4 <_Z7memTestv+0x2d8>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    800021d4:	05750513          	addi	a0,a0,87
    800021d8:	fffff097          	auipc	ra,0xfffff
    800021dc:	428080e7          	jalr	1064(ra) # 80001600 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800021e0:	fff9091b          	addiw	s2,s2,-1
    800021e4:	02094463          	bltz	s2,8000220c <_Z7memTestv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    800021e8:	0029151b          	slliw	a0,s2,0x2
    800021ec:	00a4d533          	srl	a0,s1,a0
    800021f0:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800021f4:	00900793          	li	a5,9
    800021f8:	fca7cee3          	blt	a5,a0,800021d4 <_Z7memTestv+0x2c8>
            putc('0' + digit);
    800021fc:	03050513          	addi	a0,a0,48
    80002200:	fffff097          	auipc	ra,0xfffff
    80002204:	400080e7          	jalr	1024(ra) # 80001600 <_Z4putcc>
    80002208:	fd9ff06f          	j	800021e0 <_Z7memTestv+0x2d4>
        }
    }
    putc('\n');
    8000220c:	00a00513          	li	a0,10
    80002210:	fffff097          	auipc	ra,0xfffff
    80002214:	3f0080e7          	jalr	1008(ra) # 80001600 <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    80002218:	409989b3          	sub	s3,s3,s1
    putc('D');
    8000221c:	04400513          	li	a0,68
    80002220:	fffff097          	auipc	ra,0xfffff
    80002224:	3e0080e7          	jalr	992(ra) # 80001600 <_Z4putcc>
    putc('i');
    80002228:	06900513          	li	a0,105
    8000222c:	fffff097          	auipc	ra,0xfffff
    80002230:	3d4080e7          	jalr	980(ra) # 80001600 <_Z4putcc>
    putc('f');
    80002234:	06600513          	li	a0,102
    80002238:	fffff097          	auipc	ra,0xfffff
    8000223c:	3c8080e7          	jalr	968(ra) # 80001600 <_Z4putcc>
    putc('f');
    80002240:	06600513          	li	a0,102
    80002244:	fffff097          	auipc	ra,0xfffff
    80002248:	3bc080e7          	jalr	956(ra) # 80001600 <_Z4putcc>
    putc('e');
    8000224c:	06500513          	li	a0,101
    80002250:	fffff097          	auipc	ra,0xfffff
    80002254:	3b0080e7          	jalr	944(ra) # 80001600 <_Z4putcc>
    putc('r');
    80002258:	07200513          	li	a0,114
    8000225c:	fffff097          	auipc	ra,0xfffff
    80002260:	3a4080e7          	jalr	932(ra) # 80001600 <_Z4putcc>
    putc('e');
    80002264:	06500513          	li	a0,101
    80002268:	fffff097          	auipc	ra,0xfffff
    8000226c:	398080e7          	jalr	920(ra) # 80001600 <_Z4putcc>
    putc('n');
    80002270:	06e00513          	li	a0,110
    80002274:	fffff097          	auipc	ra,0xfffff
    80002278:	38c080e7          	jalr	908(ra) # 80001600 <_Z4putcc>
    putc('c');
    8000227c:	06300513          	li	a0,99
    80002280:	fffff097          	auipc	ra,0xfffff
    80002284:	380080e7          	jalr	896(ra) # 80001600 <_Z4putcc>
    putc('e');
    80002288:	06500513          	li	a0,101
    8000228c:	fffff097          	auipc	ra,0xfffff
    80002290:	374080e7          	jalr	884(ra) # 80001600 <_Z4putcc>
    putc(':');
    80002294:	03a00513          	li	a0,58
    80002298:	fffff097          	auipc	ra,0xfffff
    8000229c:	368080e7          	jalr	872(ra) # 80001600 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800022a0:	00f00493          	li	s1,15
    800022a4:	0140006f          	j	800022b8 <_Z7memTestv+0x3ac>
        int digit = (difference >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    800022a8:	05750513          	addi	a0,a0,87
    800022ac:	fffff097          	auipc	ra,0xfffff
    800022b0:	354080e7          	jalr	852(ra) # 80001600 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800022b4:	fff4849b          	addiw	s1,s1,-1
    800022b8:	0204c463          	bltz	s1,800022e0 <_Z7memTestv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    800022bc:	0024951b          	slliw	a0,s1,0x2
    800022c0:	00a9d533          	srl	a0,s3,a0
    800022c4:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800022c8:	00900793          	li	a5,9
    800022cc:	fca7cee3          	blt	a5,a0,800022a8 <_Z7memTestv+0x39c>
            putc('0' + digit);
    800022d0:	03050513          	addi	a0,a0,48
    800022d4:	fffff097          	auipc	ra,0xfffff
    800022d8:	32c080e7          	jalr	812(ra) # 80001600 <_Z4putcc>
    800022dc:	fd9ff06f          	j	800022b4 <_Z7memTestv+0x3a8>
        }
    }
    putc('\n');
    800022e0:	00a00513          	li	a0,10
    800022e4:	fffff097          	auipc	ra,0xfffff
    800022e8:	31c080e7          	jalr	796(ra) # 80001600 <_Z4putcc>
    putc('\n');
    800022ec:	00a00513          	li	a0,10
    800022f0:	fffff097          	auipc	ra,0xfffff
    800022f4:	310080e7          	jalr	784(ra) # 80001600 <_Z4putcc>
    putc('\n');
    800022f8:	00a00513          	li	a0,10
    800022fc:	fffff097          	auipc	ra,0xfffff
    80002300:	304080e7          	jalr	772(ra) # 80001600 <_Z4putcc>
}
    80002304:	02813083          	ld	ra,40(sp)
    80002308:	02013403          	ld	s0,32(sp)
    8000230c:	01813483          	ld	s1,24(sp)
    80002310:	01013903          	ld	s2,16(sp)
    80002314:	00813983          	ld	s3,8(sp)
    80002318:	00013a03          	ld	s4,0(sp)
    8000231c:	03010113          	addi	sp,sp,48
    80002320:	00008067          	ret

0000000080002324 <_Z8usermainPv>:

void usermain(void* arg){
    80002324:	fd010113          	addi	sp,sp,-48
    80002328:	02113423          	sd	ra,40(sp)
    8000232c:	02813023          	sd	s0,32(sp)
    80002330:	00913c23          	sd	s1,24(sp)
    80002334:	03010413          	addi	s0,sp,48
    memTest();    
    80002338:	00000097          	auipc	ra,0x0
    8000233c:	bd4080e7          	jalr	-1068(ra) # 80001f0c <_Z7memTestv>
    putc('0');
    80002340:	03000513          	li	a0,48
    80002344:	fffff097          	auipc	ra,0xfffff
    80002348:	2bc080e7          	jalr	700(ra) # 80001600 <_Z4putcc>
    thread_t t1, t2;
    sem_open(&sem1, 0);
    8000234c:	00006497          	auipc	s1,0x6
    80002350:	e0c48493          	addi	s1,s1,-500 # 80008158 <sem1>
    80002354:	00000593          	li	a1,0
    80002358:	00048513          	mv	a0,s1
    8000235c:	fffff097          	auipc	ra,0xfffff
    80002360:	1c0080e7          	jalr	448(ra) # 8000151c <_Z8sem_openPP4_semj>
    sem_open(&sem2, 0);
    80002364:	00000593          	li	a1,0
    80002368:	00006517          	auipc	a0,0x6
    8000236c:	df850513          	addi	a0,a0,-520 # 80008160 <sem2>
    80002370:	fffff097          	auipc	ra,0xfffff
    80002374:	1ac080e7          	jalr	428(ra) # 8000151c <_Z8sem_openPP4_semj>
    thread_create(&t1, thread_test_1, 0);
    80002378:	00000613          	li	a2,0
    8000237c:	00000597          	auipc	a1,0x0
    80002380:	ac458593          	addi	a1,a1,-1340 # 80001e40 <_Z13thread_test_1Pv>
    80002384:	fd840513          	addi	a0,s0,-40
    80002388:	fffff097          	auipc	ra,0xfffff
    8000238c:	088080e7          	jalr	136(ra) # 80001410 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002390:	00000613          	li	a2,0
    80002394:	00000597          	auipc	a1,0x0
    80002398:	b1858593          	addi	a1,a1,-1256 # 80001eac <_Z13thread_test_2Pv>
    8000239c:	fd040513          	addi	a0,s0,-48
    800023a0:	fffff097          	auipc	ra,0xfffff
    800023a4:	070080e7          	jalr	112(ra) # 80001410 <_Z13thread_createPP7_threadPFvPvES2_>
    sem_wait(sem1);
    800023a8:	0004b503          	ld	a0,0(s1)
    800023ac:	fffff097          	auipc	ra,0xfffff
    800023b0:	1d4080e7          	jalr	468(ra) # 80001580 <_Z8sem_waitP4_sem>
    putc('3');
    800023b4:	03300513          	li	a0,51
    800023b8:	fffff097          	auipc	ra,0xfffff
    800023bc:	248080e7          	jalr	584(ra) # 80001600 <_Z4putcc>
    // thread_join(t2);
    // if(getc() == 'a')putc('x');
    putc('4');
    800023c0:	03400513          	li	a0,52
    800023c4:	fffff097          	auipc	ra,0xfffff
    800023c8:	23c080e7          	jalr	572(ra) # 80001600 <_Z4putcc>
    thread_join(t1);
    800023cc:	fd843503          	ld	a0,-40(s0)
    800023d0:	fffff097          	auipc	ra,0xfffff
    800023d4:	0fc080e7          	jalr	252(ra) # 800014cc <_Z11thread_joinP7_thread>
    // thread_dispatch();
    // thread_dispatch();
    sem_wait(sem2);
    800023d8:	0084b503          	ld	a0,8(s1)
    800023dc:	fffff097          	auipc	ra,0xfffff
    800023e0:	1a4080e7          	jalr	420(ra) # 80001580 <_Z8sem_waitP4_sem>
    putc('5');
    800023e4:	03500513          	li	a0,53
    800023e8:	fffff097          	auipc	ra,0xfffff
    800023ec:	218080e7          	jalr	536(ra) # 80001600 <_Z4putcc>
    sem_close(sem1);
    800023f0:	0004b503          	ld	a0,0(s1)
    800023f4:	fffff097          	auipc	ra,0xfffff
    800023f8:	160080e7          	jalr	352(ra) # 80001554 <_Z9sem_closeP4_sem>
    sem_close(sem2);
    800023fc:	0084b503          	ld	a0,8(s1)
    80002400:	fffff097          	auipc	ra,0xfffff
    80002404:	154080e7          	jalr	340(ra) # 80001554 <_Z9sem_closeP4_sem>


    putc('\n');
    80002408:	00a00513          	li	a0,10
    8000240c:	fffff097          	auipc	ra,0xfffff
    80002410:	1f4080e7          	jalr	500(ra) # 80001600 <_Z4putcc>
    80002414:	02813083          	ld	ra,40(sp)
    80002418:	02013403          	ld	s0,32(sp)
    8000241c:	01813483          	ld	s1,24(sp)
    80002420:	03010113          	addi	sp,sp,48
    80002424:	00008067          	ret

0000000080002428 <_ZN7_threadC1EPFvPvES0_>:
#include "syscalls_c.h"
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    80002428:	ff010113          	addi	sp,sp,-16
    8000242c:	00813423          	sd	s0,8(sp)
    80002430:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80002434:	00053023          	sd	zero,0(a0)
    80002438:	00053423          	sd	zero,8(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    8000243c:	00006717          	auipc	a4,0x6
    80002440:	d2c70713          	addi	a4,a4,-724 # 80008168 <_ZN7_thread6nextIDE>
    80002444:	00072783          	lw	a5,0(a4)
    80002448:	0017869b          	addiw	a3,a5,1
    8000244c:	00d72023          	sw	a3,0(a4)
    80002450:	08f52c23          	sw	a5,152(a0)
    closed = 0;
    80002454:	09c52783          	lw	a5,156(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002458:	0015b593          	seqz	a1,a1
    8000245c:	0045959b          	slliw	a1,a1,0x4
    80002460:	fe07f793          	andi	a5,a5,-32
    80002464:	00b7e7b3          	or	a5,a5,a1
    80002468:	08f52e23          	sw	a5,156(a0)
    reserved = 0;
    8000246c:	0a052783          	lw	a5,160(a0)
    80002470:	f0000737          	lui	a4,0xf0000
    80002474:	00e7f7b3          	and	a5,a5,a4
    80002478:	0af52023          	sw	a5,160(a0)
    joinHead = 0;
    8000247c:	06053c23          	sd	zero,120(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    80002480:	00200793          	li	a5,2
    80002484:	08f53423          	sd	a5,136(a0)
    stackStart = 0;
    80002488:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    8000248c:	00053823          	sd	zero,16(a0)
    context.s1 = 0;
    80002490:	00053c23          	sd	zero,24(a0)
    context.s2 = 0;
    80002494:	02053023          	sd	zero,32(a0)
    context.s3 = 0;
    80002498:	02053423          	sd	zero,40(a0)
    context.s4 = 0;
    8000249c:	02053823          	sd	zero,48(a0)
    context.s5 = 0;
    800024a0:	02053c23          	sd	zero,56(a0)
    context.s6 = 0;
    800024a4:	04053023          	sd	zero,64(a0)
    context.s7 = 0;
    800024a8:	04053423          	sd	zero,72(a0)
    context.s8 = 0;
    800024ac:	04053823          	sd	zero,80(a0)
    context.s9 = 0;
    800024b0:	04053c23          	sd	zero,88(a0)
    context.s10 = 0;
    800024b4:	06053023          	sd	zero,96(a0)
    context.s11 = 0;
    800024b8:	06053423          	sd	zero,104(a0)

    context.sstatus = 0;
    800024bc:	06053823          	sd	zero,112(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    800024c0:	00000797          	auipc	a5,0x0
    800024c4:	54c78793          	addi	a5,a5,1356 # 80002a0c <_ZN7_thread7wrapperEv>
    800024c8:	00f53023          	sd	a5,0(a0)
}
    800024cc:	00813403          	ld	s0,8(sp)
    800024d0:	01010113          	addi	sp,sp,16
    800024d4:	00008067          	ret

00000000800024d8 <_Z10popSppSpieb>:

void popSppSpie(bool kernel = false){
    800024d8:	ff010113          	addi	sp,sp,-16
    800024dc:	00813423          	sd	s0,8(sp)
    800024e0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    800024e4:	14109073          	csrw	sepc,ra
    if(kernel){
    800024e8:	00050e63          	beqz	a0,80002504 <_Z10popSppSpieb+0x2c>
        __asm__ volatile ("csrs sstatus, %0" :: "r" (1 << 8));
    800024ec:	10000793          	li	a5,256
    800024f0:	1007a073          	csrs	sstatus,a5
    }else{
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    }
    __asm__ volatile ("sret");
    800024f4:	10200073          	sret
}
    800024f8:	00813403          	ld	s0,8(sp)
    800024fc:	01010113          	addi	sp,sp,16
    80002500:	00008067          	ret
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002504:	10000793          	li	a5,256
    80002508:	1007b073          	csrc	sstatus,a5
    8000250c:	fe9ff06f          	j	800024f4 <_Z10popSppSpieb+0x1c>

0000000080002510 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002510:	fe010113          	addi	sp,sp,-32
    80002514:	00113c23          	sd	ra,24(sp)
    80002518:	00813823          	sd	s0,16(sp)
    8000251c:	00913423          	sd	s1,8(sp)
    80002520:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80002524:	07853483          	ld	s1,120(a0)
    while(current != 0){
    80002528:	0c048663          	beqz	s1,800025f4 <_ZN7_thread6unJoinEv+0xe4>
        thread_t thread = current->thread;
    8000252c:	0004c503          	lbu	a0,0(s1)
    80002530:	0014c783          	lbu	a5,1(s1)
    80002534:	00879793          	slli	a5,a5,0x8
    80002538:	00a7e7b3          	or	a5,a5,a0
    8000253c:	0024c503          	lbu	a0,2(s1)
    80002540:	01051513          	slli	a0,a0,0x10
    80002544:	00f567b3          	or	a5,a0,a5
    80002548:	0034c503          	lbu	a0,3(s1)
    8000254c:	01851513          	slli	a0,a0,0x18
    80002550:	00f56533          	or	a0,a0,a5
    80002554:	0044c783          	lbu	a5,4(s1)
    80002558:	02079793          	slli	a5,a5,0x20
    8000255c:	00a7e533          	or	a0,a5,a0
    80002560:	0054c783          	lbu	a5,5(s1)
    80002564:	02879793          	slli	a5,a5,0x28
    80002568:	00a7e7b3          	or	a5,a5,a0
    8000256c:	0064c503          	lbu	a0,6(s1)
    80002570:	03051513          	slli	a0,a0,0x30
    80002574:	00f567b3          	or	a5,a0,a5
    80002578:	0074c503          	lbu	a0,7(s1)
    8000257c:	03851513          	slli	a0,a0,0x38
    80002580:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80002584:	09c52783          	lw	a5,156(a0)
    80002588:	ffd7f793          	andi	a5,a5,-3
    8000258c:	08f52e23          	sw	a5,156(a0)
        Scheduler::put(thread);
    80002590:	00002097          	auipc	ra,0x2
    80002594:	0d4080e7          	jalr	212(ra) # 80004664 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80002598:	0084c703          	lbu	a4,8(s1)
    8000259c:	0094c783          	lbu	a5,9(s1)
    800025a0:	00879793          	slli	a5,a5,0x8
    800025a4:	00e7e733          	or	a4,a5,a4
    800025a8:	00a4c783          	lbu	a5,10(s1)
    800025ac:	01079793          	slli	a5,a5,0x10
    800025b0:	00e7e7b3          	or	a5,a5,a4
    800025b4:	00b4c703          	lbu	a4,11(s1)
    800025b8:	01871713          	slli	a4,a4,0x18
    800025bc:	00f767b3          	or	a5,a4,a5
    800025c0:	00c4c703          	lbu	a4,12(s1)
    800025c4:	02071713          	slli	a4,a4,0x20
    800025c8:	00f76733          	or	a4,a4,a5
    800025cc:	00d4c783          	lbu	a5,13(s1)
    800025d0:	02879793          	slli	a5,a5,0x28
    800025d4:	00e7e733          	or	a4,a5,a4
    800025d8:	00e4c783          	lbu	a5,14(s1)
    800025dc:	03079793          	slli	a5,a5,0x30
    800025e0:	00e7e7b3          	or	a5,a5,a4
    800025e4:	00f4c483          	lbu	s1,15(s1)
    800025e8:	03849493          	slli	s1,s1,0x38
    800025ec:	00f4e4b3          	or	s1,s1,a5
    while(current != 0){
    800025f0:	f39ff06f          	j	80002528 <_ZN7_thread6unJoinEv+0x18>
        // mem_free(current);
        current = next;
    }
}
    800025f4:	01813083          	ld	ra,24(sp)
    800025f8:	01013403          	ld	s0,16(sp)
    800025fc:	00813483          	ld	s1,8(sp)
    80002600:	02010113          	addi	sp,sp,32
    80002604:	00008067          	ret

0000000080002608 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80002608:	fc010113          	addi	sp,sp,-64
    8000260c:	02113c23          	sd	ra,56(sp)
    80002610:	02813823          	sd	s0,48(sp)
    80002614:	02913423          	sd	s1,40(sp)
    80002618:	03213023          	sd	s2,32(sp)
    8000261c:	01313c23          	sd	s3,24(sp)
    80002620:	01413823          	sd	s4,16(sp)
    80002624:	01513423          	sd	s5,8(sp)
    80002628:	04010413          	addi	s0,sp,64
    8000262c:	00050493          	mv	s1,a0
    80002630:	00058913          	mv	s2,a1
    80002634:	00060a93          	mv	s5,a2
    80002638:	00068993          	mv	s3,a3
    8000263c:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    80002640:	0b800513          	li	a0,184
    80002644:	fffff097          	auipc	ra,0xfffff
    80002648:	d70080e7          	jalr	-656(ra) # 800013b4 <_Z9mem_allocm>
    8000264c:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80002650:	18050063          	beqz	a0,800027d0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    80002654:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    80002658:	0004b783          	ld	a5,0(s1)
    8000265c:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80002660:	00006717          	auipc	a4,0x6
    80002664:	b0870713          	addi	a4,a4,-1272 # 80008168 <_ZN7_thread6nextIDE>
    80002668:	00072783          	lw	a5,0(a4)
    8000266c:	0017869b          	addiw	a3,a5,1
    80002670:	00d72023          	sw	a3,0(a4)
    80002674:	0004b703          	ld	a4,0(s1)
    80002678:	08f72c23          	sw	a5,152(a4)
    (*thread)->closed = false;
    8000267c:	0004b703          	ld	a4,0(s1)
    80002680:	09c72783          	lw	a5,156(a4)
    80002684:	ffe7f793          	andi	a5,a5,-2
    80002688:	08f72e23          	sw	a5,156(a4)
    (*thread)->blocked = false;
    8000268c:	0004b703          	ld	a4,0(s1)
    80002690:	09c72783          	lw	a5,156(a4)
    80002694:	ffd7f793          	andi	a5,a5,-3
    80002698:	08f72e23          	sw	a5,156(a4)
    (*thread)->sleeping = false;
    8000269c:	0004b703          	ld	a4,0(s1)
    800026a0:	09c72783          	lw	a5,156(a4)
    800026a4:	ffb7f793          	andi	a5,a5,-5
    800026a8:	08f72e23          	sw	a5,156(a4)
    (*thread)->finished = false;
    800026ac:	0004b703          	ld	a4,0(s1)
    800026b0:	09c72783          	lw	a5,156(a4)
    800026b4:	ff77f793          	andi	a5,a5,-9
    800026b8:	08f72e23          	sw	a5,156(a4)
    (*thread)->kernel = (function == 0);
    800026bc:	0004b703          	ld	a4,0(s1)
    800026c0:	00193913          	seqz	s2,s2
    800026c4:	0049191b          	slliw	s2,s2,0x4
    800026c8:	09c72783          	lw	a5,156(a4)
    800026cc:	fef7f793          	andi	a5,a5,-17
    800026d0:	0127e933          	or	s2,a5,s2
    800026d4:	09272e23          	sw	s2,156(a4)
    (*thread)->reserved = 0;
    800026d8:	0004b703          	ld	a4,0(s1)
    800026dc:	0a072783          	lw	a5,160(a4)
    800026e0:	f00006b7          	lui	a3,0xf0000
    800026e4:	00d7f7b3          	and	a5,a5,a3
    800026e8:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = 0;
    800026ec:	0004b783          	ld	a5,0(s1)
    800026f0:	0607bc23          	sd	zero,120(a5)
    (*thread)->joinTail = 0;
    800026f4:	0004b783          	ld	a5,0(s1)
    800026f8:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    800026fc:	0004b783          	ld	a5,0(s1)
    80002700:	00200713          	li	a4,2
    80002704:	08e7b423          	sd	a4,136(a5)
    (*thread)->stackStart = 0;
    80002708:	0004b783          	ld	a5,0(s1)
    8000270c:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    80002710:	0004b783          	ld	a5,0(s1)
    80002714:	0007b823          	sd	zero,16(a5)
    (*thread)->context.s1 = 0;
    80002718:	0004b783          	ld	a5,0(s1)
    8000271c:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s2 = 0;
    80002720:	0004b783          	ld	a5,0(s1)
    80002724:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s3 = 0;
    80002728:	0004b783          	ld	a5,0(s1)
    8000272c:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s4 = 0;
    80002730:	0004b783          	ld	a5,0(s1)
    80002734:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s5 = 0;
    80002738:	0004b783          	ld	a5,0(s1)
    8000273c:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s6 = 0;
    80002740:	0004b783          	ld	a5,0(s1)
    80002744:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s7 = 0;
    80002748:	0004b783          	ld	a5,0(s1)
    8000274c:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s8 = 0;
    80002750:	0004b783          	ld	a5,0(s1)
    80002754:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s9 = 0;
    80002758:	0004b783          	ld	a5,0(s1)
    8000275c:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s10 = 0;
    80002760:	0004b783          	ld	a5,0(s1)
    80002764:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s11 = 0;
    80002768:	0004b783          	ld	a5,0(s1)
    8000276c:	0607b423          	sd	zero,104(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80002770:	0004b783          	ld	a5,0(s1)
    80002774:	0137b423          	sd	s3,8(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80002778:	0004b783          	ld	a5,0(s1)
    8000277c:	00000717          	auipc	a4,0x0
    80002780:	29070713          	addi	a4,a4,656 # 80002a0c <_ZN7_thread7wrapperEv>
    80002784:	00e7b023          	sd	a4,0(a5)

    (*thread)->stackStart = stack;
    80002788:	0004b783          	ld	a5,0(s1)
    8000278c:	0937b823          	sd	s3,144(a5)
    if(start){
    80002790:	020a1663          	bnez	s4,800027bc <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    80002794:	00000513          	li	a0,0
}
    80002798:	03813083          	ld	ra,56(sp)
    8000279c:	03013403          	ld	s0,48(sp)
    800027a0:	02813483          	ld	s1,40(sp)
    800027a4:	02013903          	ld	s2,32(sp)
    800027a8:	01813983          	ld	s3,24(sp)
    800027ac:	01013a03          	ld	s4,16(sp)
    800027b0:	00813a83          	ld	s5,8(sp)
    800027b4:	04010113          	addi	sp,sp,64
    800027b8:	00008067          	ret
        Scheduler::put(*thread);
    800027bc:	0004b503          	ld	a0,0(s1)
    800027c0:	00002097          	auipc	ra,0x2
    800027c4:	ea4080e7          	jalr	-348(ra) # 80004664 <_ZN9Scheduler3putEP7_thread>
    return 0;
    800027c8:	00000513          	li	a0,0
    800027cc:	fcdff06f          	j	80002798 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    800027d0:	fff00513          	li	a0,-1
    800027d4:	fc5ff06f          	j	80002798 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

00000000800027d8 <_ZN7_thread4joinEPS_>:

void _thread::join(thread_t thread){
    800027d8:	fe010113          	addi	sp,sp,-32
    800027dc:	00113c23          	sd	ra,24(sp)
    800027e0:	00813823          	sd	s0,16(sp)
    800027e4:	00913423          	sd	s1,8(sp)
    800027e8:	01213023          	sd	s2,0(sp)
    800027ec:	02010413          	addi	s0,sp,32
    800027f0:	00050493          	mv	s1,a0
    800027f4:	00058913          	mv	s2,a1
    /// cannot join to a finished or closed thread
    __putc('j');
    800027f8:	06a00513          	li	a0,106
    800027fc:	00004097          	auipc	ra,0x4
    80002800:	2a0080e7          	jalr	672(ra) # 80006a9c <__putc>
    if(thread->finished || thread->closed){
    80002804:	09893783          	ld	a5,152(s2)
    80002808:	00900713          	li	a4,9
    8000280c:	02071713          	slli	a4,a4,0x20
    80002810:	00e7f7b3          	and	a5,a5,a4
    80002814:	00078e63          	beqz	a5,80002830 <_ZN7_thread4joinEPS_+0x58>
        thread->joinTail->next = newJoin;
        thread->joinTail = newJoin;
    }
    // Scheduler::remove(this);
    thread_dispatch();
}
    80002818:	01813083          	ld	ra,24(sp)
    8000281c:	01013403          	ld	s0,16(sp)
    80002820:	00813483          	ld	s1,8(sp)
    80002824:	00013903          	ld	s2,0(sp)
    80002828:	02010113          	addi	sp,sp,32
    8000282c:	00008067          	ret
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    80002830:	01000513          	li	a0,16
    80002834:	fffff097          	auipc	ra,0xfffff
    80002838:	b80080e7          	jalr	-1152(ra) # 800013b4 <_Z9mem_allocm>
    this->blocked = true;
    8000283c:	09c4a703          	lw	a4,156(s1)
    80002840:	00276713          	ori	a4,a4,2
    80002844:	08e4ae23          	sw	a4,156(s1)
    newJoin->thread = this;
    80002848:	00950023          	sb	s1,0(a0)
    8000284c:	0084d713          	srli	a4,s1,0x8
    80002850:	00e500a3          	sb	a4,1(a0)
    80002854:	0104d713          	srli	a4,s1,0x10
    80002858:	00e50123          	sb	a4,2(a0)
    8000285c:	0184d71b          	srliw	a4,s1,0x18
    80002860:	00e501a3          	sb	a4,3(a0)
    80002864:	0204d713          	srli	a4,s1,0x20
    80002868:	00e50223          	sb	a4,4(a0)
    8000286c:	0284d713          	srli	a4,s1,0x28
    80002870:	00e502a3          	sb	a4,5(a0)
    80002874:	0304d713          	srli	a4,s1,0x30
    80002878:	00e50323          	sb	a4,6(a0)
    8000287c:	0384d493          	srli	s1,s1,0x38
    80002880:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80002884:	00050423          	sb	zero,8(a0)
    80002888:	000504a3          	sb	zero,9(a0)
    8000288c:	00050523          	sb	zero,10(a0)
    80002890:	000505a3          	sb	zero,11(a0)
    80002894:	00050623          	sb	zero,12(a0)
    80002898:	000506a3          	sb	zero,13(a0)
    8000289c:	00050723          	sb	zero,14(a0)
    800028a0:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    800028a4:	07893703          	ld	a4,120(s2)
    800028a8:	04070a63          	beqz	a4,800028fc <_ZN7_thread4joinEPS_+0x124>
        thread->joinTail->next = newJoin;
    800028ac:	08093703          	ld	a4,128(s2)
    800028b0:	00a70423          	sb	a0,8(a4)
    800028b4:	00855693          	srli	a3,a0,0x8
    800028b8:	00d704a3          	sb	a3,9(a4)
    800028bc:	01055693          	srli	a3,a0,0x10
    800028c0:	00d70523          	sb	a3,10(a4)
    800028c4:	0185569b          	srliw	a3,a0,0x18
    800028c8:	00d705a3          	sb	a3,11(a4)
    800028cc:	02055693          	srli	a3,a0,0x20
    800028d0:	00d70623          	sb	a3,12(a4)
    800028d4:	02855693          	srli	a3,a0,0x28
    800028d8:	00d706a3          	sb	a3,13(a4)
    800028dc:	03055693          	srli	a3,a0,0x30
    800028e0:	00d70723          	sb	a3,14(a4)
    800028e4:	03855693          	srli	a3,a0,0x38
    800028e8:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    800028ec:	08a93023          	sd	a0,128(s2)
    thread_dispatch();
    800028f0:	fffff097          	auipc	ra,0xfffff
    800028f4:	bbc080e7          	jalr	-1092(ra) # 800014ac <_Z15thread_dispatchv>
    800028f8:	f21ff06f          	j	80002818 <_ZN7_thread4joinEPS_+0x40>
        thread->joinHead = newJoin;
    800028fc:	06a93c23          	sd	a0,120(s2)
        thread->joinTail = newJoin;
    80002900:	08a93023          	sd	a0,128(s2)
    80002904:	fedff06f          	j	800028f0 <_ZN7_thread4joinEPS_+0x118>

0000000080002908 <_ZN7_thread4tickEv>:

int _thread::tick(){
    if(currentThread->blocked){
    80002908:	00006797          	auipc	a5,0x6
    8000290c:	8687b783          	ld	a5,-1944(a5) # 80008170 <_ZN7_thread13currentThreadE>
    80002910:	09c7a783          	lw	a5,156(a5)
    80002914:	0027f713          	andi	a4,a5,2
    80002918:	06071063          	bnez	a4,80002978 <_ZN7_thread4tickEv+0x70>
        return -1;
    }
    if(currentThread->closed){
    8000291c:	0017f713          	andi	a4,a5,1
    80002920:	06071063          	bnez	a4,80002980 <_ZN7_thread4tickEv+0x78>
        return -2;
    }
    if(currentThread->sleeping){
    80002924:	0047f713          	andi	a4,a5,4
    80002928:	06071063          	bnez	a4,80002988 <_ZN7_thread4tickEv+0x80>
        return -3;
    }
    if(currentThread->finished){
    8000292c:	0087f793          	andi	a5,a5,8
    80002930:	06079063          	bnez	a5,80002990 <_ZN7_thread4tickEv+0x88>
        return -4;
    }
    timeLeft --;
    80002934:	08853783          	ld	a5,136(a0)
    80002938:	fff78793          	addi	a5,a5,-1
    8000293c:	08f53423          	sd	a5,136(a0)
    if(timeLeft == 0){
    80002940:	00078663          	beqz	a5,8000294c <_ZN7_thread4tickEv+0x44>
        // __putc('d');
        // __putc('0' + currentThread->ID);
        // __putc('\n');
        thread_dispatch();
    }
    return 0;
    80002944:	00000513          	li	a0,0
}
    80002948:	00008067          	ret
int _thread::tick(){
    8000294c:	ff010113          	addi	sp,sp,-16
    80002950:	00113423          	sd	ra,8(sp)
    80002954:	00813023          	sd	s0,0(sp)
    80002958:	01010413          	addi	s0,sp,16
        thread_dispatch();
    8000295c:	fffff097          	auipc	ra,0xfffff
    80002960:	b50080e7          	jalr	-1200(ra) # 800014ac <_Z15thread_dispatchv>
    return 0;
    80002964:	00000513          	li	a0,0
}
    80002968:	00813083          	ld	ra,8(sp)
    8000296c:	00013403          	ld	s0,0(sp)
    80002970:	01010113          	addi	sp,sp,16
    80002974:	00008067          	ret
        return -1;
    80002978:	fff00513          	li	a0,-1
    8000297c:	00008067          	ret
        return -2;
    80002980:	ffe00513          	li	a0,-2
    80002984:	00008067          	ret
        return -3;
    80002988:	ffd00513          	li	a0,-3
    8000298c:	00008067          	ret
        return -4;
    80002990:	ffc00513          	li	a0,-4
    80002994:	00008067          	ret

0000000080002998 <_ZN7_thread4exitEv>:

int _thread::exit(){
    if(currentThread->closed){
    80002998:	00005717          	auipc	a4,0x5
    8000299c:	7d873703          	ld	a4,2008(a4) # 80008170 <_ZN7_thread13currentThreadE>
    800029a0:	09c72783          	lw	a5,156(a4)
    800029a4:	0017f693          	andi	a3,a5,1
    800029a8:	04069663          	bnez	a3,800029f4 <_ZN7_thread4exitEv+0x5c>
        return -1;
    }
    if(currentThread->blocked){
    800029ac:	0027f693          	andi	a3,a5,2
    800029b0:	04069663          	bnez	a3,800029fc <_ZN7_thread4exitEv+0x64>
        return -2;
    }
    if(currentThread->sleeping){
    800029b4:	0047f793          	andi	a5,a5,4
    800029b8:	04079663          	bnez	a5,80002a04 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    800029bc:	ff010113          	addi	sp,sp,-16
    800029c0:	00113423          	sd	ra,8(sp)
    800029c4:	00813023          	sd	s0,0(sp)
    800029c8:	01010413          	addi	s0,sp,16
        return -3;
    }
    currentThread->finished = 1;
    800029cc:	09c72783          	lw	a5,156(a4)
    800029d0:	0087e793          	ori	a5,a5,8
    800029d4:	08f72e23          	sw	a5,156(a4)
    thread_dispatch();
    800029d8:	fffff097          	auipc	ra,0xfffff
    800029dc:	ad4080e7          	jalr	-1324(ra) # 800014ac <_Z15thread_dispatchv>
    return 0;
    800029e0:	00000513          	li	a0,0
}
    800029e4:	00813083          	ld	ra,8(sp)
    800029e8:	00013403          	ld	s0,0(sp)
    800029ec:	01010113          	addi	sp,sp,16
    800029f0:	00008067          	ret
        return -1;
    800029f4:	fff00513          	li	a0,-1
    800029f8:	00008067          	ret
        return -2;
    800029fc:	ffe00513          	li	a0,-2
    80002a00:	00008067          	ret
        return -3;
    80002a04:	ffd00513          	li	a0,-3
}
    80002a08:	00008067          	ret

0000000080002a0c <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80002a0c:	fe010113          	addi	sp,sp,-32
    80002a10:	00113c23          	sd	ra,24(sp)
    80002a14:	00813823          	sd	s0,16(sp)
    80002a18:	00913423          	sd	s1,8(sp)
    80002a1c:	02010413          	addi	s0,sp,32
    popSppSpie(currentThread->kernel);
    80002a20:	00005497          	auipc	s1,0x5
    80002a24:	74848493          	addi	s1,s1,1864 # 80008168 <_ZN7_thread6nextIDE>
    80002a28:	0084b783          	ld	a5,8(s1)
    80002a2c:	09c7a503          	lw	a0,156(a5)
    80002a30:	4045551b          	sraiw	a0,a0,0x4
    80002a34:	00157513          	andi	a0,a0,1
    80002a38:	00000097          	auipc	ra,0x0
    80002a3c:	aa0080e7          	jalr	-1376(ra) # 800024d8 <_Z10popSppSpieb>
    currentThread->function(currentThread->arg);
    80002a40:	0084b783          	ld	a5,8(s1)
    80002a44:	0a87b703          	ld	a4,168(a5)
    80002a48:	0b07b503          	ld	a0,176(a5)
    80002a4c:	000700e7          	jalr	a4
    currentThread->unJoin();
    80002a50:	0084b503          	ld	a0,8(s1)
    80002a54:	00000097          	auipc	ra,0x0
    80002a58:	abc080e7          	jalr	-1348(ra) # 80002510 <_ZN7_thread6unJoinEv>
    exit();
    80002a5c:	00000097          	auipc	ra,0x0
    80002a60:	f3c080e7          	jalr	-196(ra) # 80002998 <_ZN7_thread4exitEv>
}
    80002a64:	01813083          	ld	ra,24(sp)
    80002a68:	01013403          	ld	s0,16(sp)
    80002a6c:	00813483          	ld	s1,8(sp)
    80002a70:	02010113          	addi	sp,sp,32
    80002a74:	00008067          	ret

0000000080002a78 <_ZN7_thread10setBlockedEb>:

void _thread::setBlocked(bool blocked){
    80002a78:	ff010113          	addi	sp,sp,-16
    80002a7c:	00813423          	sd	s0,8(sp)
    80002a80:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80002a84:	0015f593          	andi	a1,a1,1
    80002a88:	0015979b          	slliw	a5,a1,0x1
    80002a8c:	09c52583          	lw	a1,156(a0)
    80002a90:	ffd5f593          	andi	a1,a1,-3
    80002a94:	00f5e5b3          	or	a1,a1,a5
    80002a98:	08b52e23          	sw	a1,156(a0)
}
    80002a9c:	00813403          	ld	s0,8(sp)
    80002aa0:	01010113          	addi	sp,sp,16
    80002aa4:	00008067          	ret

0000000080002aa8 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80002aa8:	ff010113          	addi	sp,sp,-16
    80002aac:	00813423          	sd	s0,8(sp)
    80002ab0:	01010413          	addi	s0,sp,16
    this->closed = closed;
    80002ab4:	0015f793          	andi	a5,a1,1
    80002ab8:	09c52583          	lw	a1,156(a0)
    80002abc:	ffe5f593          	andi	a1,a1,-2
    80002ac0:	00f5e5b3          	or	a1,a1,a5
    80002ac4:	08b52e23          	sw	a1,156(a0)
}
    80002ac8:	00813403          	ld	s0,8(sp)
    80002acc:	01010113          	addi	sp,sp,16
    80002ad0:	00008067          	ret

0000000080002ad4 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    80002ad4:	ff010113          	addi	sp,sp,-16
    80002ad8:	00813423          	sd	s0,8(sp)
    80002adc:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    80002ae0:	0015f593          	andi	a1,a1,1
    80002ae4:	0025979b          	slliw	a5,a1,0x2
    80002ae8:	09c52583          	lw	a1,156(a0)
    80002aec:	ffb5f593          	andi	a1,a1,-5
    80002af0:	00f5e5b3          	or	a1,a1,a5
    80002af4:	08b52e23          	sw	a1,156(a0)
}
    80002af8:	00813403          	ld	s0,8(sp)
    80002afc:	01010113          	addi	sp,sp,16
    80002b00:	00008067          	ret

0000000080002b04 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
    // __putc('\n');
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    // __putc('.');
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    80002b04:	ff010113          	addi	sp,sp,-16
    80002b08:	00813423          	sd	s0,8(sp)
    80002b0c:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    80002b10:	04050263          	beqz	a0,80002b54 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    80002b14:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    80002b18:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    80002b1c:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    80002b20:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    80002b24:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    80002b28:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    80002b2c:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    80002b30:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    80002b34:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    80002b38:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    80002b3c:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    80002b40:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    80002b44:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    80002b48:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80002b4c:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    80002b50:	06853823          	sd	s0,112(a0)
    //         __putc('a' + digit - 10);
    //     }
    // }
    // __putc('\n');
    
    if(newContext->sp != 0){
    80002b54:	0085b783          	ld	a5,8(a1)
    80002b58:	00078463          	beqz	a5,80002b60 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    80002b5c:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    80002b60:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    80002b64:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    80002b68:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80002b6c:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    80002b70:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80002b74:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80002b78:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80002b7c:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80002b80:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80002b84:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80002b88:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    80002b8c:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    80002b90:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    80002b94:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    80002b98:	0685bd83          	ld	s11,104(a1)

    return;

}
    80002b9c:	00813403          	ld	s0,8(sp)
    80002ba0:	01010113          	addi	sp,sp,16
    80002ba4:	00008067          	ret

0000000080002ba8 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80002ba8:	fe010113          	addi	sp,sp,-32
    80002bac:	00113c23          	sd	ra,24(sp)
    80002bb0:	00813823          	sd	s0,16(sp)
    80002bb4:	00913423          	sd	s1,8(sp)
    80002bb8:	01213023          	sd	s2,0(sp)
    80002bbc:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    80002bc0:	00005917          	auipc	s2,0x5
    80002bc4:	5a890913          	addi	s2,s2,1448 # 80008168 <_ZN7_thread6nextIDE>
    80002bc8:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    80002bcc:	00002097          	auipc	ra,0x2
    80002bd0:	c88080e7          	jalr	-888(ra) # 80004854 <_ZN9Scheduler3getEv>
    80002bd4:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    80002bd8:	00200793          	li	a5,2
    80002bdc:	08f4b423          	sd	a5,136(s1)
    if(currentThread == nullptr){
    80002be0:	04050463          	beqz	a0,80002c28 <_ZN7_thread8dispatchEv+0x80>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80002be4:	00048c63          	beqz	s1,80002bfc <_ZN7_thread8dispatchEv+0x54>
    80002be8:	0984b783          	ld	a5,152(s1)
    80002bec:	00f00713          	li	a4,15
    80002bf0:	02071713          	slli	a4,a4,0x20
    80002bf4:	00e7f7b3          	and	a5,a5,a4
    80002bf8:	02078e63          	beqz	a5,80002c34 <_ZN7_thread8dispatchEv+0x8c>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    80002bfc:	00005597          	auipc	a1,0x5
    80002c00:	5745b583          	ld	a1,1396(a1) # 80008170 <_ZN7_thread13currentThreadE>
    80002c04:	00048513          	mv	a0,s1
    80002c08:	00000097          	auipc	ra,0x0
    80002c0c:	efc080e7          	jalr	-260(ra) # 80002b04 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    80002c10:	01813083          	ld	ra,24(sp)
    80002c14:	01013403          	ld	s0,16(sp)
    80002c18:	00813483          	ld	s1,8(sp)
    80002c1c:	00013903          	ld	s2,0(sp)
    80002c20:	02010113          	addi	sp,sp,32
    80002c24:	00008067          	ret
        currentThread = oldThread;
    80002c28:	00005797          	auipc	a5,0x5
    80002c2c:	5497b423          	sd	s1,1352(a5) # 80008170 <_ZN7_thread13currentThreadE>
        return;
    80002c30:	fe1ff06f          	j	80002c10 <_ZN7_thread8dispatchEv+0x68>
        Scheduler::put(oldThread);
    80002c34:	00048513          	mv	a0,s1
    80002c38:	00002097          	auipc	ra,0x2
    80002c3c:	a2c080e7          	jalr	-1492(ra) # 80004664 <_ZN9Scheduler3putEP7_thread>
    80002c40:	fbdff06f          	j	80002bfc <_ZN7_thread8dispatchEv+0x54>

0000000080002c44 <_ZN11HeapManagerC1Ev>:
#include "hw.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80002c44:	fe010113          	addi	sp,sp,-32
    80002c48:	00113c23          	sd	ra,24(sp)
    80002c4c:	00813823          	sd	s0,16(sp)
    80002c50:	00913423          	sd	s1,8(sp)
    80002c54:	02010413          	addi	s0,sp,32
    80002c58:	00050493          	mv	s1,a0
    assert(instance == 0);
    80002c5c:	00005797          	auipc	a5,0x5
    80002c60:	51c7b783          	ld	a5,1308(a5) # 80008178 <_ZN11HeapManager8instanceE>
    80002c64:	02079063          	bnez	a5,80002c84 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80002c68:	00005797          	auipc	a5,0x5
    80002c6c:	5097b823          	sd	s1,1296(a5) # 80008178 <_ZN11HeapManager8instanceE>
}
    80002c70:	01813083          	ld	ra,24(sp)
    80002c74:	01013403          	ld	s0,16(sp)
    80002c78:	00813483          	ld	s1,8(sp)
    80002c7c:	02010113          	addi	sp,sp,32
    80002c80:	00008067          	ret
    assert(instance == 0);
    80002c84:	00004697          	auipc	a3,0x4
    80002c88:	49468693          	addi	a3,a3,1172 # 80007118 <CONSOLE_STATUS+0x108>
    80002c8c:	01300613          	li	a2,19
    80002c90:	00004597          	auipc	a1,0x4
    80002c94:	4a858593          	addi	a1,a1,1192 # 80007138 <CONSOLE_STATUS+0x128>
    80002c98:	00004517          	auipc	a0,0x4
    80002c9c:	3a850513          	addi	a0,a0,936 # 80007040 <CONSOLE_STATUS+0x30>
    80002ca0:	fffff097          	auipc	ra,0xfffff
    80002ca4:	c08080e7          	jalr	-1016(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80002ca8:	fc1ff06f          	j	80002c68 <_ZN11HeapManagerC1Ev+0x24>

0000000080002cac <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80002cac:	ff010113          	addi	sp,sp,-16
    80002cb0:	00813423          	sd	s0,8(sp)
    80002cb4:	01010413          	addi	s0,sp,16
    
}
    80002cb8:	00813403          	ld	s0,8(sp)
    80002cbc:	01010113          	addi	sp,sp,16
    80002cc0:	00008067          	ret

0000000080002cc4 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    80002cc4:	fd010113          	addi	sp,sp,-48
    80002cc8:	02113423          	sd	ra,40(sp)
    80002ccc:	02813023          	sd	s0,32(sp)
    80002cd0:	00913c23          	sd	s1,24(sp)
    80002cd4:	01213823          	sd	s2,16(sp)
    80002cd8:	01313423          	sd	s3,8(sp)
    80002cdc:	03010413          	addi	s0,sp,48
    80002ce0:	00050993          	mv	s3,a0
    80002ce4:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002ce8:	40b604b3          	sub	s1,a2,a1
    80002cec:	0414b793          	sltiu	a5,s1,65
    80002cf0:	0c079863          	bnez	a5,80002dc0 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80002cf4:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80002cf8:	fde00793          	li	a5,-34
    80002cfc:	00f90c23          	sb	a5,24(s2)
    80002d00:	fc000713          	li	a4,-64
    80002d04:	00e90ca3          	sb	a4,25(s2)
    80002d08:	fad00713          	li	a4,-83
    80002d0c:	00e90d23          	sb	a4,26(s2)
    80002d10:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    80002d14:	0064d613          	srli	a2,s1,0x6
    80002d18:	0009b783          	ld	a5,0(s3)
    80002d1c:	fff60613          	addi	a2,a2,-1
    80002d20:	00c78823          	sb	a2,16(a5)
    80002d24:	00865713          	srli	a4,a2,0x8
    80002d28:	00e788a3          	sb	a4,17(a5)
    80002d2c:	01065713          	srli	a4,a2,0x10
    80002d30:	00e78923          	sb	a4,18(a5)
    80002d34:	0186571b          	srliw	a4,a2,0x18
    80002d38:	00e789a3          	sb	a4,19(a5)
    80002d3c:	02065713          	srli	a4,a2,0x20
    80002d40:	00e78a23          	sb	a4,20(a5)
    80002d44:	02865713          	srli	a4,a2,0x28
    80002d48:	00e78aa3          	sb	a4,21(a5)
    80002d4c:	03065713          	srli	a4,a2,0x30
    80002d50:	00e78b23          	sb	a4,22(a5)
    80002d54:	03865613          	srli	a2,a2,0x38
    80002d58:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80002d5c:	0009b783          	ld	a5,0(s3)
    80002d60:	00078023          	sb	zero,0(a5)
    80002d64:	000780a3          	sb	zero,1(a5)
    80002d68:	00078123          	sb	zero,2(a5)
    80002d6c:	000781a3          	sb	zero,3(a5)
    80002d70:	00078223          	sb	zero,4(a5)
    80002d74:	000782a3          	sb	zero,5(a5)
    80002d78:	00078323          	sb	zero,6(a5)
    80002d7c:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80002d80:	0009b783          	ld	a5,0(s3)
    80002d84:	00078423          	sb	zero,8(a5)
    80002d88:	000784a3          	sb	zero,9(a5)
    80002d8c:	00078523          	sb	zero,10(a5)
    80002d90:	000785a3          	sb	zero,11(a5)
    80002d94:	00078623          	sb	zero,12(a5)
    80002d98:	000786a3          	sb	zero,13(a5)
    80002d9c:	00078723          	sb	zero,14(a5)
    80002da0:	000787a3          	sb	zero,15(a5)
}
    80002da4:	02813083          	ld	ra,40(sp)
    80002da8:	02013403          	ld	s0,32(sp)
    80002dac:	01813483          	ld	s1,24(sp)
    80002db0:	01013903          	ld	s2,16(sp)
    80002db4:	00813983          	ld	s3,8(sp)
    80002db8:	03010113          	addi	sp,sp,48
    80002dbc:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002dc0:	00004697          	auipc	a3,0x4
    80002dc4:	39068693          	addi	a3,a3,912 # 80007150 <CONSOLE_STATUS+0x140>
    80002dc8:	01c00613          	li	a2,28
    80002dcc:	00004597          	auipc	a1,0x4
    80002dd0:	36c58593          	addi	a1,a1,876 # 80007138 <CONSOLE_STATUS+0x128>
    80002dd4:	00004517          	auipc	a0,0x4
    80002dd8:	3ac50513          	addi	a0,a0,940 # 80007180 <CONSOLE_STATUS+0x170>
    80002ddc:	fffff097          	auipc	ra,0xfffff
    80002de0:	acc080e7          	jalr	-1332(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80002de4:	f11ff06f          	j	80002cf4 <_ZN11HeapManager4initEmm+0x30>

0000000080002de8 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80002de8:	fe010113          	addi	sp,sp,-32
    80002dec:	00113c23          	sd	ra,24(sp)
    80002df0:	00813823          	sd	s0,16(sp)
    80002df4:	00913423          	sd	s1,8(sp)
    80002df8:	01213023          	sd	s2,0(sp)
    80002dfc:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002e00:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80002e04:	00000913          	li	s2,0
    80002e08:	0b80006f          	j	80002ec0 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80002e0c:	0104c783          	lbu	a5,16(s1)
    80002e10:	0114c703          	lbu	a4,17(s1)
    80002e14:	00871713          	slli	a4,a4,0x8
    80002e18:	00f76733          	or	a4,a4,a5
    80002e1c:	0124c783          	lbu	a5,18(s1)
    80002e20:	01079793          	slli	a5,a5,0x10
    80002e24:	00e7e733          	or	a4,a5,a4
    80002e28:	0134c783          	lbu	a5,19(s1)
    80002e2c:	01879793          	slli	a5,a5,0x18
    80002e30:	00e7e7b3          	or	a5,a5,a4
    80002e34:	0144c703          	lbu	a4,20(s1)
    80002e38:	02071713          	slli	a4,a4,0x20
    80002e3c:	00f767b3          	or	a5,a4,a5
    80002e40:	0154c703          	lbu	a4,21(s1)
    80002e44:	02871713          	slli	a4,a4,0x28
    80002e48:	00f76733          	or	a4,a4,a5
    80002e4c:	0164c783          	lbu	a5,22(s1)
    80002e50:	03079793          	slli	a5,a5,0x30
    80002e54:	00e7e733          	or	a4,a5,a4
    80002e58:	0174c783          	lbu	a5,23(s1)
    80002e5c:	03879793          	slli	a5,a5,0x38
    80002e60:	00e7e7b3          	or	a5,a5,a4
    80002e64:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80002e68:	0004c703          	lbu	a4,0(s1)
    80002e6c:	0014c783          	lbu	a5,1(s1)
    80002e70:	00879793          	slli	a5,a5,0x8
    80002e74:	00e7e733          	or	a4,a5,a4
    80002e78:	0024c783          	lbu	a5,2(s1)
    80002e7c:	01079793          	slli	a5,a5,0x10
    80002e80:	00e7e7b3          	or	a5,a5,a4
    80002e84:	0034c703          	lbu	a4,3(s1)
    80002e88:	01871713          	slli	a4,a4,0x18
    80002e8c:	00f767b3          	or	a5,a4,a5
    80002e90:	0044c703          	lbu	a4,4(s1)
    80002e94:	02071713          	slli	a4,a4,0x20
    80002e98:	00f76733          	or	a4,a4,a5
    80002e9c:	0054c783          	lbu	a5,5(s1)
    80002ea0:	02879793          	slli	a5,a5,0x28
    80002ea4:	00e7e733          	or	a4,a5,a4
    80002ea8:	0064c783          	lbu	a5,6(s1)
    80002eac:	03079793          	slli	a5,a5,0x30
    80002eb0:	00e7e7b3          	or	a5,a5,a4
    80002eb4:	0074c483          	lbu	s1,7(s1)
    80002eb8:	03849493          	slli	s1,s1,0x38
    80002ebc:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002ec0:	06048263          	beqz	s1,80002f24 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002ec4:	0184c783          	lbu	a5,24(s1)
    80002ec8:	0194c703          	lbu	a4,25(s1)
    80002ecc:	00871713          	slli	a4,a4,0x8
    80002ed0:	00f76733          	or	a4,a4,a5
    80002ed4:	01a4c783          	lbu	a5,26(s1)
    80002ed8:	01079793          	slli	a5,a5,0x10
    80002edc:	00e7e733          	or	a4,a5,a4
    80002ee0:	01b4c783          	lbu	a5,27(s1)
    80002ee4:	01879793          	slli	a5,a5,0x18
    80002ee8:	00e7e7b3          	or	a5,a5,a4
    80002eec:	0007879b          	sext.w	a5,a5
    80002ef0:	deadc737          	lui	a4,0xdeadc
    80002ef4:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2cee>
    80002ef8:	f0e78ae3          	beq	a5,a4,80002e0c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80002efc:	00004697          	auipc	a3,0x4
    80002f00:	2a468693          	addi	a3,a3,676 # 800071a0 <CONSOLE_STATUS+0x190>
    80002f04:	02900613          	li	a2,41
    80002f08:	00004597          	auipc	a1,0x4
    80002f0c:	23058593          	addi	a1,a1,560 # 80007138 <CONSOLE_STATUS+0x128>
    80002f10:	00004517          	auipc	a0,0x4
    80002f14:	2b850513          	addi	a0,a0,696 # 800071c8 <CONSOLE_STATUS+0x1b8>
    80002f18:	fffff097          	auipc	ra,0xfffff
    80002f1c:	990080e7          	jalr	-1648(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80002f20:	eedff06f          	j	80002e0c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80002f24:	00090513          	mv	a0,s2
    80002f28:	01813083          	ld	ra,24(sp)
    80002f2c:	01013403          	ld	s0,16(sp)
    80002f30:	00813483          	ld	s1,8(sp)
    80002f34:	00013903          	ld	s2,0(sp)
    80002f38:	02010113          	addi	sp,sp,32
    80002f3c:	00008067          	ret

0000000080002f40 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80002f40:	fd010113          	addi	sp,sp,-48
    80002f44:	02113423          	sd	ra,40(sp)
    80002f48:	02813023          	sd	s0,32(sp)
    80002f4c:	00913c23          	sd	s1,24(sp)
    80002f50:	01213823          	sd	s2,16(sp)
    80002f54:	01313423          	sd	s3,8(sp)
    80002f58:	03010413          	addi	s0,sp,48
    80002f5c:	00050993          	mv	s3,a0
    80002f60:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002f64:	00053483          	ld	s1,0(a0)
    80002f68:	0b80006f          	j	80003020 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80002f6c:	0104c783          	lbu	a5,16(s1)
    80002f70:	0114c703          	lbu	a4,17(s1)
    80002f74:	00871713          	slli	a4,a4,0x8
    80002f78:	00f76733          	or	a4,a4,a5
    80002f7c:	0124c783          	lbu	a5,18(s1)
    80002f80:	01079793          	slli	a5,a5,0x10
    80002f84:	00e7e733          	or	a4,a5,a4
    80002f88:	0134c783          	lbu	a5,19(s1)
    80002f8c:	01879793          	slli	a5,a5,0x18
    80002f90:	00e7e7b3          	or	a5,a5,a4
    80002f94:	0144c703          	lbu	a4,20(s1)
    80002f98:	02071713          	slli	a4,a4,0x20
    80002f9c:	00f767b3          	or	a5,a4,a5
    80002fa0:	0154c703          	lbu	a4,21(s1)
    80002fa4:	02871713          	slli	a4,a4,0x28
    80002fa8:	00f76733          	or	a4,a4,a5
    80002fac:	0164c783          	lbu	a5,22(s1)
    80002fb0:	03079793          	slli	a5,a5,0x30
    80002fb4:	00e7e733          	or	a4,a5,a4
    80002fb8:	0174c783          	lbu	a5,23(s1)
    80002fbc:	03879793          	slli	a5,a5,0x38
    80002fc0:	00e7e7b3          	or	a5,a5,a4
    80002fc4:	0d27f063          	bgeu	a5,s2,80003084 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80002fc8:	0004c703          	lbu	a4,0(s1)
    80002fcc:	0014c783          	lbu	a5,1(s1)
    80002fd0:	00879793          	slli	a5,a5,0x8
    80002fd4:	00e7e733          	or	a4,a5,a4
    80002fd8:	0024c783          	lbu	a5,2(s1)
    80002fdc:	01079793          	slli	a5,a5,0x10
    80002fe0:	00e7e7b3          	or	a5,a5,a4
    80002fe4:	0034c703          	lbu	a4,3(s1)
    80002fe8:	01871713          	slli	a4,a4,0x18
    80002fec:	00f767b3          	or	a5,a4,a5
    80002ff0:	0044c703          	lbu	a4,4(s1)
    80002ff4:	02071713          	slli	a4,a4,0x20
    80002ff8:	00f76733          	or	a4,a4,a5
    80002ffc:	0054c783          	lbu	a5,5(s1)
    80003000:	02879793          	slli	a5,a5,0x28
    80003004:	00e7e733          	or	a4,a5,a4
    80003008:	0064c783          	lbu	a5,6(s1)
    8000300c:	03079793          	slli	a5,a5,0x30
    80003010:	00e7e7b3          	or	a5,a5,a4
    80003014:	0074c483          	lbu	s1,7(s1)
    80003018:	03849493          	slli	s1,s1,0x38
    8000301c:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003020:	4e048c63          	beqz	s1,80003518 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003024:	0184c783          	lbu	a5,24(s1)
    80003028:	0194c703          	lbu	a4,25(s1)
    8000302c:	00871713          	slli	a4,a4,0x8
    80003030:	00f76733          	or	a4,a4,a5
    80003034:	01a4c783          	lbu	a5,26(s1)
    80003038:	01079793          	slli	a5,a5,0x10
    8000303c:	00e7e733          	or	a4,a5,a4
    80003040:	01b4c783          	lbu	a5,27(s1)
    80003044:	01879793          	slli	a5,a5,0x18
    80003048:	00e7e7b3          	or	a5,a5,a4
    8000304c:	0007879b          	sext.w	a5,a5
    80003050:	deadc737          	lui	a4,0xdeadc
    80003054:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2cee>
    80003058:	f0e78ae3          	beq	a5,a4,80002f6c <_ZN11HeapManager12heapAllocateEm+0x2c>
    8000305c:	00004697          	auipc	a3,0x4
    80003060:	19468693          	addi	a3,a3,404 # 800071f0 <CONSOLE_STATUS+0x1e0>
    80003064:	03300613          	li	a2,51
    80003068:	00004597          	auipc	a1,0x4
    8000306c:	0d058593          	addi	a1,a1,208 # 80007138 <CONSOLE_STATUS+0x128>
    80003070:	00004517          	auipc	a0,0x4
    80003074:	15850513          	addi	a0,a0,344 # 800071c8 <CONSOLE_STATUS+0x1b8>
    80003078:	fffff097          	auipc	ra,0xfffff
    8000307c:	830080e7          	jalr	-2000(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80003080:	eedff06f          	j	80002f6c <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80003084:	00190713          	addi	a4,s2,1
    80003088:	2af77263          	bgeu	a4,a5,8000332c <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    8000308c:	00671793          	slli	a5,a4,0x6
    80003090:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80003094:	fde00713          	li	a4,-34
    80003098:	00e78c23          	sb	a4,24(a5)
    8000309c:	fc000693          	li	a3,-64
    800030a0:	00d78ca3          	sb	a3,25(a5)
    800030a4:	fad00693          	li	a3,-83
    800030a8:	00d78d23          	sb	a3,26(a5)
    800030ac:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    800030b0:	0104c703          	lbu	a4,16(s1)
    800030b4:	0114c683          	lbu	a3,17(s1)
    800030b8:	00869693          	slli	a3,a3,0x8
    800030bc:	00e6e6b3          	or	a3,a3,a4
    800030c0:	0124c703          	lbu	a4,18(s1)
    800030c4:	01071713          	slli	a4,a4,0x10
    800030c8:	00d766b3          	or	a3,a4,a3
    800030cc:	0134c703          	lbu	a4,19(s1)
    800030d0:	01871713          	slli	a4,a4,0x18
    800030d4:	00d76733          	or	a4,a4,a3
    800030d8:	0144c683          	lbu	a3,20(s1)
    800030dc:	02069693          	slli	a3,a3,0x20
    800030e0:	00e6e733          	or	a4,a3,a4
    800030e4:	0154c683          	lbu	a3,21(s1)
    800030e8:	02869693          	slli	a3,a3,0x28
    800030ec:	00e6e6b3          	or	a3,a3,a4
    800030f0:	0164c703          	lbu	a4,22(s1)
    800030f4:	03071713          	slli	a4,a4,0x30
    800030f8:	00d766b3          	or	a3,a4,a3
    800030fc:	0174c703          	lbu	a4,23(s1)
    80003100:	03871713          	slli	a4,a4,0x38
    80003104:	00d76733          	or	a4,a4,a3
    80003108:	41270733          	sub	a4,a4,s2
    8000310c:	fff70713          	addi	a4,a4,-1
    80003110:	00e78823          	sb	a4,16(a5)
    80003114:	00875693          	srli	a3,a4,0x8
    80003118:	00d788a3          	sb	a3,17(a5)
    8000311c:	01075693          	srli	a3,a4,0x10
    80003120:	00d78923          	sb	a3,18(a5)
    80003124:	0187569b          	srliw	a3,a4,0x18
    80003128:	00d789a3          	sb	a3,19(a5)
    8000312c:	02075693          	srli	a3,a4,0x20
    80003130:	00d78a23          	sb	a3,20(a5)
    80003134:	02875693          	srli	a3,a4,0x28
    80003138:	00d78aa3          	sb	a3,21(a5)
    8000313c:	03075693          	srli	a3,a4,0x30
    80003140:	00d78b23          	sb	a3,22(a5)
    80003144:	03875713          	srli	a4,a4,0x38
    80003148:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    8000314c:	0004c703          	lbu	a4,0(s1)
    80003150:	0014c683          	lbu	a3,1(s1)
    80003154:	00869693          	slli	a3,a3,0x8
    80003158:	00e6e733          	or	a4,a3,a4
    8000315c:	0024c683          	lbu	a3,2(s1)
    80003160:	01069693          	slli	a3,a3,0x10
    80003164:	00e6e6b3          	or	a3,a3,a4
    80003168:	0034c703          	lbu	a4,3(s1)
    8000316c:	01871713          	slli	a4,a4,0x18
    80003170:	00d766b3          	or	a3,a4,a3
    80003174:	0044c703          	lbu	a4,4(s1)
    80003178:	02071713          	slli	a4,a4,0x20
    8000317c:	00d76733          	or	a4,a4,a3
    80003180:	0054c683          	lbu	a3,5(s1)
    80003184:	02869693          	slli	a3,a3,0x28
    80003188:	00e6e733          	or	a4,a3,a4
    8000318c:	0064c683          	lbu	a3,6(s1)
    80003190:	03069693          	slli	a3,a3,0x30
    80003194:	00e6e6b3          	or	a3,a3,a4
    80003198:	0074c703          	lbu	a4,7(s1)
    8000319c:	03871713          	slli	a4,a4,0x38
    800031a0:	00d76733          	or	a4,a4,a3
    800031a4:	00d78023          	sb	a3,0(a5)
    800031a8:	00875693          	srli	a3,a4,0x8
    800031ac:	00d780a3          	sb	a3,1(a5)
    800031b0:	01075693          	srli	a3,a4,0x10
    800031b4:	00d78123          	sb	a3,2(a5)
    800031b8:	0187569b          	srliw	a3,a4,0x18
    800031bc:	00d781a3          	sb	a3,3(a5)
    800031c0:	02075693          	srli	a3,a4,0x20
    800031c4:	00d78223          	sb	a3,4(a5)
    800031c8:	02875693          	srli	a3,a4,0x28
    800031cc:	00d782a3          	sb	a3,5(a5)
    800031d0:	03075693          	srli	a3,a4,0x30
    800031d4:	00d78323          	sb	a3,6(a5)
    800031d8:	03875713          	srli	a4,a4,0x38
    800031dc:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    800031e0:	00978423          	sb	s1,8(a5)
    800031e4:	0084d713          	srli	a4,s1,0x8
    800031e8:	00e784a3          	sb	a4,9(a5)
    800031ec:	0104d713          	srli	a4,s1,0x10
    800031f0:	00e78523          	sb	a4,10(a5)
    800031f4:	0184d71b          	srliw	a4,s1,0x18
    800031f8:	00e785a3          	sb	a4,11(a5)
    800031fc:	0204d713          	srli	a4,s1,0x20
    80003200:	00e78623          	sb	a4,12(a5)
    80003204:	0284d713          	srli	a4,s1,0x28
    80003208:	00e786a3          	sb	a4,13(a5)
    8000320c:	0304d713          	srli	a4,s1,0x30
    80003210:	00e78723          	sb	a4,14(a5)
    80003214:	0384d713          	srli	a4,s1,0x38
    80003218:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    8000321c:	0004c703          	lbu	a4,0(s1)
    80003220:	0014c683          	lbu	a3,1(s1)
    80003224:	00869693          	slli	a3,a3,0x8
    80003228:	00e6e6b3          	or	a3,a3,a4
    8000322c:	0024c703          	lbu	a4,2(s1)
    80003230:	01071713          	slli	a4,a4,0x10
    80003234:	00d766b3          	or	a3,a4,a3
    80003238:	0034c703          	lbu	a4,3(s1)
    8000323c:	01871713          	slli	a4,a4,0x18
    80003240:	00d76733          	or	a4,a4,a3
    80003244:	0044c683          	lbu	a3,4(s1)
    80003248:	02069693          	slli	a3,a3,0x20
    8000324c:	00e6e733          	or	a4,a3,a4
    80003250:	0054c683          	lbu	a3,5(s1)
    80003254:	02869693          	slli	a3,a3,0x28
    80003258:	00e6e6b3          	or	a3,a3,a4
    8000325c:	0064c703          	lbu	a4,6(s1)
    80003260:	03071713          	slli	a4,a4,0x30
    80003264:	00d766b3          	or	a3,a4,a3
    80003268:	0074c703          	lbu	a4,7(s1)
    8000326c:	03871713          	slli	a4,a4,0x38
    80003270:	00d76733          	or	a4,a4,a3
    80003274:	04070063          	beqz	a4,800032b4 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003278:	00f70423          	sb	a5,8(a4)
    8000327c:	0087d693          	srli	a3,a5,0x8
    80003280:	00d704a3          	sb	a3,9(a4)
    80003284:	0107d693          	srli	a3,a5,0x10
    80003288:	00d70523          	sb	a3,10(a4)
    8000328c:	0187d69b          	srliw	a3,a5,0x18
    80003290:	00d705a3          	sb	a3,11(a4)
    80003294:	0207d693          	srli	a3,a5,0x20
    80003298:	00d70623          	sb	a3,12(a4)
    8000329c:	0287d693          	srli	a3,a5,0x28
    800032a0:	00d706a3          	sb	a3,13(a4)
    800032a4:	0307d693          	srli	a3,a5,0x30
    800032a8:	00d70723          	sb	a3,14(a4)
    800032ac:	0387d693          	srli	a3,a5,0x38
    800032b0:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    800032b4:	00f48023          	sb	a5,0(s1)
    800032b8:	0087d713          	srli	a4,a5,0x8
    800032bc:	00e480a3          	sb	a4,1(s1)
    800032c0:	0107d713          	srli	a4,a5,0x10
    800032c4:	00e48123          	sb	a4,2(s1)
    800032c8:	0187d71b          	srliw	a4,a5,0x18
    800032cc:	00e481a3          	sb	a4,3(s1)
    800032d0:	0207d713          	srli	a4,a5,0x20
    800032d4:	00e48223          	sb	a4,4(s1)
    800032d8:	0287d713          	srli	a4,a5,0x28
    800032dc:	00e482a3          	sb	a4,5(s1)
    800032e0:	0307d713          	srli	a4,a5,0x30
    800032e4:	00e48323          	sb	a4,6(s1)
    800032e8:	0387d793          	srli	a5,a5,0x38
    800032ec:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    800032f0:	01248823          	sb	s2,16(s1)
    800032f4:	00895793          	srli	a5,s2,0x8
    800032f8:	00f488a3          	sb	a5,17(s1)
    800032fc:	01095793          	srli	a5,s2,0x10
    80003300:	00f48923          	sb	a5,18(s1)
    80003304:	0189579b          	srliw	a5,s2,0x18
    80003308:	00f489a3          	sb	a5,19(s1)
    8000330c:	02095793          	srli	a5,s2,0x20
    80003310:	00f48a23          	sb	a5,20(s1)
    80003314:	02895793          	srli	a5,s2,0x28
    80003318:	00f48aa3          	sb	a5,21(s1)
    8000331c:	03095793          	srli	a5,s2,0x30
    80003320:	00f48b23          	sb	a5,22(s1)
    80003324:	03895913          	srli	s2,s2,0x38
    80003328:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    8000332c:	0009b783          	ld	a5,0(s3)
    80003330:	20978463          	beq	a5,s1,80003538 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80003334:	0084c783          	lbu	a5,8(s1)
    80003338:	0094c703          	lbu	a4,9(s1)
    8000333c:	00871713          	slli	a4,a4,0x8
    80003340:	00f76733          	or	a4,a4,a5
    80003344:	00a4c783          	lbu	a5,10(s1)
    80003348:	01079793          	slli	a5,a5,0x10
    8000334c:	00e7e733          	or	a4,a5,a4
    80003350:	00b4c783          	lbu	a5,11(s1)
    80003354:	01879793          	slli	a5,a5,0x18
    80003358:	00e7e7b3          	or	a5,a5,a4
    8000335c:	00c4c703          	lbu	a4,12(s1)
    80003360:	02071713          	slli	a4,a4,0x20
    80003364:	00f767b3          	or	a5,a4,a5
    80003368:	00d4c703          	lbu	a4,13(s1)
    8000336c:	02871713          	slli	a4,a4,0x28
    80003370:	00f76733          	or	a4,a4,a5
    80003374:	00e4c783          	lbu	a5,14(s1)
    80003378:	03079793          	slli	a5,a5,0x30
    8000337c:	00e7e733          	or	a4,a5,a4
    80003380:	00f4c783          	lbu	a5,15(s1)
    80003384:	03879793          	slli	a5,a5,0x38
    80003388:	00e7e7b3          	or	a5,a5,a4
    8000338c:	08078c63          	beqz	a5,80003424 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80003390:	0004c703          	lbu	a4,0(s1)
    80003394:	0014c683          	lbu	a3,1(s1)
    80003398:	00869693          	slli	a3,a3,0x8
    8000339c:	00e6e733          	or	a4,a3,a4
    800033a0:	0024c683          	lbu	a3,2(s1)
    800033a4:	01069693          	slli	a3,a3,0x10
    800033a8:	00e6e6b3          	or	a3,a3,a4
    800033ac:	0034c703          	lbu	a4,3(s1)
    800033b0:	01871713          	slli	a4,a4,0x18
    800033b4:	00d766b3          	or	a3,a4,a3
    800033b8:	0044c703          	lbu	a4,4(s1)
    800033bc:	02071713          	slli	a4,a4,0x20
    800033c0:	00d76733          	or	a4,a4,a3
    800033c4:	0054c683          	lbu	a3,5(s1)
    800033c8:	02869693          	slli	a3,a3,0x28
    800033cc:	00e6e733          	or	a4,a3,a4
    800033d0:	0064c683          	lbu	a3,6(s1)
    800033d4:	03069693          	slli	a3,a3,0x30
    800033d8:	00e6e6b3          	or	a3,a3,a4
    800033dc:	0074c703          	lbu	a4,7(s1)
    800033e0:	03871713          	slli	a4,a4,0x38
    800033e4:	00d76733          	or	a4,a4,a3
    800033e8:	00d78023          	sb	a3,0(a5)
    800033ec:	00875693          	srli	a3,a4,0x8
    800033f0:	00d780a3          	sb	a3,1(a5)
    800033f4:	01075693          	srli	a3,a4,0x10
    800033f8:	00d78123          	sb	a3,2(a5)
    800033fc:	0187569b          	srliw	a3,a4,0x18
    80003400:	00d781a3          	sb	a3,3(a5)
    80003404:	02075693          	srli	a3,a4,0x20
    80003408:	00d78223          	sb	a3,4(a5)
    8000340c:	02875693          	srli	a3,a4,0x28
    80003410:	00d782a3          	sb	a3,5(a5)
    80003414:	03075693          	srli	a3,a4,0x30
    80003418:	00d78323          	sb	a3,6(a5)
    8000341c:	03875713          	srli	a4,a4,0x38
    80003420:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003424:	0004c783          	lbu	a5,0(s1)
    80003428:	0014c703          	lbu	a4,1(s1)
    8000342c:	00871713          	slli	a4,a4,0x8
    80003430:	00f76733          	or	a4,a4,a5
    80003434:	0024c783          	lbu	a5,2(s1)
    80003438:	01079793          	slli	a5,a5,0x10
    8000343c:	00e7e733          	or	a4,a5,a4
    80003440:	0034c783          	lbu	a5,3(s1)
    80003444:	01879793          	slli	a5,a5,0x18
    80003448:	00e7e7b3          	or	a5,a5,a4
    8000344c:	0044c703          	lbu	a4,4(s1)
    80003450:	02071713          	slli	a4,a4,0x20
    80003454:	00f767b3          	or	a5,a4,a5
    80003458:	0054c703          	lbu	a4,5(s1)
    8000345c:	02871713          	slli	a4,a4,0x28
    80003460:	00f76733          	or	a4,a4,a5
    80003464:	0064c783          	lbu	a5,6(s1)
    80003468:	03079793          	slli	a5,a5,0x30
    8000346c:	00e7e733          	or	a4,a5,a4
    80003470:	0074c783          	lbu	a5,7(s1)
    80003474:	03879793          	slli	a5,a5,0x38
    80003478:	00e7e7b3          	or	a5,a5,a4
    8000347c:	08078c63          	beqz	a5,80003514 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003480:	0084c703          	lbu	a4,8(s1)
    80003484:	0094c683          	lbu	a3,9(s1)
    80003488:	00869693          	slli	a3,a3,0x8
    8000348c:	00e6e733          	or	a4,a3,a4
    80003490:	00a4c683          	lbu	a3,10(s1)
    80003494:	01069693          	slli	a3,a3,0x10
    80003498:	00e6e6b3          	or	a3,a3,a4
    8000349c:	00b4c703          	lbu	a4,11(s1)
    800034a0:	01871713          	slli	a4,a4,0x18
    800034a4:	00d766b3          	or	a3,a4,a3
    800034a8:	00c4c703          	lbu	a4,12(s1)
    800034ac:	02071713          	slli	a4,a4,0x20
    800034b0:	00d76733          	or	a4,a4,a3
    800034b4:	00d4c683          	lbu	a3,13(s1)
    800034b8:	02869693          	slli	a3,a3,0x28
    800034bc:	00e6e733          	or	a4,a3,a4
    800034c0:	00e4c683          	lbu	a3,14(s1)
    800034c4:	03069693          	slli	a3,a3,0x30
    800034c8:	00e6e6b3          	or	a3,a3,a4
    800034cc:	00f4c703          	lbu	a4,15(s1)
    800034d0:	03871713          	slli	a4,a4,0x38
    800034d4:	00d76733          	or	a4,a4,a3
    800034d8:	00d78423          	sb	a3,8(a5)
    800034dc:	00875693          	srli	a3,a4,0x8
    800034e0:	00d784a3          	sb	a3,9(a5)
    800034e4:	01075693          	srli	a3,a4,0x10
    800034e8:	00d78523          	sb	a3,10(a5)
    800034ec:	0187569b          	srliw	a3,a4,0x18
    800034f0:	00d785a3          	sb	a3,11(a5)
    800034f4:	02075693          	srli	a3,a4,0x20
    800034f8:	00d78623          	sb	a3,12(a5)
    800034fc:	02875693          	srli	a3,a4,0x28
    80003500:	00d786a3          	sb	a3,13(a5)
    80003504:	03075693          	srli	a3,a4,0x30
    80003508:	00d78723          	sb	a3,14(a5)
    8000350c:	03875713          	srli	a4,a4,0x38
    80003510:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    80003514:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80003518:	00048513          	mv	a0,s1
    8000351c:	02813083          	ld	ra,40(sp)
    80003520:	02013403          	ld	s0,32(sp)
    80003524:	01813483          	ld	s1,24(sp)
    80003528:	01013903          	ld	s2,16(sp)
    8000352c:	00813983          	ld	s3,8(sp)
    80003530:	03010113          	addi	sp,sp,48
    80003534:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80003538:	0004c703          	lbu	a4,0(s1)
    8000353c:	0014c783          	lbu	a5,1(s1)
    80003540:	00879793          	slli	a5,a5,0x8
    80003544:	00e7e7b3          	or	a5,a5,a4
    80003548:	0024c703          	lbu	a4,2(s1)
    8000354c:	01071713          	slli	a4,a4,0x10
    80003550:	00f76733          	or	a4,a4,a5
    80003554:	0034c783          	lbu	a5,3(s1)
    80003558:	01879793          	slli	a5,a5,0x18
    8000355c:	00e7e733          	or	a4,a5,a4
    80003560:	0044c783          	lbu	a5,4(s1)
    80003564:	02079793          	slli	a5,a5,0x20
    80003568:	00e7e7b3          	or	a5,a5,a4
    8000356c:	0054c703          	lbu	a4,5(s1)
    80003570:	02871713          	slli	a4,a4,0x28
    80003574:	00f76733          	or	a4,a4,a5
    80003578:	0064c783          	lbu	a5,6(s1)
    8000357c:	03079793          	slli	a5,a5,0x30
    80003580:	00e7e733          	or	a4,a5,a4
    80003584:	0074c783          	lbu	a5,7(s1)
    80003588:	03879793          	slli	a5,a5,0x38
    8000358c:	00e7e7b3          	or	a5,a5,a4
    80003590:	00f9b023          	sd	a5,0(s3)
    80003594:	da1ff06f          	j	80003334 <_ZN11HeapManager12heapAllocateEm+0x3f4>

0000000080003598 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003598:	fc010113          	addi	sp,sp,-64
    8000359c:	02113c23          	sd	ra,56(sp)
    800035a0:	02813823          	sd	s0,48(sp)
    800035a4:	02913423          	sd	s1,40(sp)
    800035a8:	03213023          	sd	s2,32(sp)
    800035ac:	01313c23          	sd	s3,24(sp)
    800035b0:	01413823          	sd	s4,16(sp)
    800035b4:	01513423          	sd	s5,8(sp)
    800035b8:	04010413          	addi	s0,sp,64
    800035bc:	00050a93          	mv	s5,a0
    800035c0:	00058a13          	mv	s4,a1
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pAddress) - MEM_BLOCK_SIZE);
    800035c4:	fc058913          	addi	s2,a1,-64
    800035c8:	00090993          	mv	s3,s2
    
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    800035cc:	01894783          	lbu	a5,24(s2)
    800035d0:	01994703          	lbu	a4,25(s2)
    800035d4:	00871713          	slli	a4,a4,0x8
    800035d8:	00f76733          	or	a4,a4,a5
    800035dc:	01a94783          	lbu	a5,26(s2)
    800035e0:	01079793          	slli	a5,a5,0x10
    800035e4:	00e7e733          	or	a4,a5,a4
    800035e8:	01b94783          	lbu	a5,27(s2)
    800035ec:	01879793          	slli	a5,a5,0x18
    800035f0:	00e7e7b3          	or	a5,a5,a4
    800035f4:	0007879b          	sext.w	a5,a5
    800035f8:	deadc737          	lui	a4,0xdeadc
    800035fc:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2cee>
    80003600:	28e79c63          	bne	a5,a4,80003898 <_ZN11HeapManager8heapFreeEPv+0x300>
    HeapFreeSectionHeader* pInsert = m_pHead;
    80003604:	000ab483          	ld	s1,0(s5)

    if(pInsert == 0 || pInsert->pNext >= pAddress){
    80003608:	06048063          	beqz	s1,80003668 <_ZN11HeapManager8heapFreeEPv+0xd0>
    8000360c:	0004c783          	lbu	a5,0(s1)
    80003610:	0014c703          	lbu	a4,1(s1)
    80003614:	00871713          	slli	a4,a4,0x8
    80003618:	00f76733          	or	a4,a4,a5
    8000361c:	0024c783          	lbu	a5,2(s1)
    80003620:	01079793          	slli	a5,a5,0x10
    80003624:	00e7e733          	or	a4,a5,a4
    80003628:	0034c783          	lbu	a5,3(s1)
    8000362c:	01879793          	slli	a5,a5,0x18
    80003630:	00e7e7b3          	or	a5,a5,a4
    80003634:	0044c703          	lbu	a4,4(s1)
    80003638:	02071713          	slli	a4,a4,0x20
    8000363c:	00f767b3          	or	a5,a4,a5
    80003640:	0054c703          	lbu	a4,5(s1)
    80003644:	02871713          	slli	a4,a4,0x28
    80003648:	00f76733          	or	a4,a4,a5
    8000364c:	0064c783          	lbu	a5,6(s1)
    80003650:	03079793          	slli	a5,a5,0x30
    80003654:	00e7e733          	or	a4,a5,a4
    80003658:	0074c783          	lbu	a5,7(s1)
    8000365c:	03879793          	slli	a5,a5,0x38
    80003660:	00e7e7b3          	or	a5,a5,a4
    80003664:	2b47ea63          	bltu	a5,s4,80003918 <_ZN11HeapManager8heapFreeEPv+0x380>
        pFree->pNext = m_pHead;
    80003668:	fc9a0023          	sb	s1,-64(s4)
    8000366c:	0084d793          	srli	a5,s1,0x8
    80003670:	00f900a3          	sb	a5,1(s2)
    80003674:	0104d793          	srli	a5,s1,0x10
    80003678:	00f90123          	sb	a5,2(s2)
    8000367c:	0184d79b          	srliw	a5,s1,0x18
    80003680:	00f901a3          	sb	a5,3(s2)
    80003684:	0204d793          	srli	a5,s1,0x20
    80003688:	00f90223          	sb	a5,4(s2)
    8000368c:	0284d793          	srli	a5,s1,0x28
    80003690:	00f902a3          	sb	a5,5(s2)
    80003694:	0304d793          	srli	a5,s1,0x30
    80003698:	00f90323          	sb	a5,6(s2)
    8000369c:	0384d493          	srli	s1,s1,0x38
    800036a0:	009903a3          	sb	s1,7(s2)
        m_pHead->pPrev = pFree;
    800036a4:	000ab783          	ld	a5,0(s5)
    800036a8:	01278423          	sb	s2,8(a5)
    800036ac:	00895713          	srli	a4,s2,0x8
    800036b0:	00e784a3          	sb	a4,9(a5)
    800036b4:	01095713          	srli	a4,s2,0x10
    800036b8:	00e78523          	sb	a4,10(a5)
    800036bc:	0189571b          	srliw	a4,s2,0x18
    800036c0:	00e785a3          	sb	a4,11(a5)
    800036c4:	02095713          	srli	a4,s2,0x20
    800036c8:	00e78623          	sb	a4,12(a5)
    800036cc:	02895713          	srli	a4,s2,0x28
    800036d0:	00e786a3          	sb	a4,13(a5)
    800036d4:	03095713          	srli	a4,s2,0x30
    800036d8:	00e78723          	sb	a4,14(a5)
    800036dc:	03895713          	srli	a4,s2,0x38
    800036e0:	00e787a3          	sb	a4,15(a5)
        m_pHead = pFree;
    800036e4:	012ab023          	sd	s2,0(s5)
    }



    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uintptr_t>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree)){
    800036e8:	00894783          	lbu	a5,8(s2)
    800036ec:	00994703          	lbu	a4,9(s2)
    800036f0:	00871713          	slli	a4,a4,0x8
    800036f4:	00f76733          	or	a4,a4,a5
    800036f8:	00a94783          	lbu	a5,10(s2)
    800036fc:	01079793          	slli	a5,a5,0x10
    80003700:	00e7e733          	or	a4,a5,a4
    80003704:	00b94783          	lbu	a5,11(s2)
    80003708:	01879793          	slli	a5,a5,0x18
    8000370c:	00e7e7b3          	or	a5,a5,a4
    80003710:	00c94703          	lbu	a4,12(s2)
    80003714:	02071713          	slli	a4,a4,0x20
    80003718:	00f767b3          	or	a5,a4,a5
    8000371c:	00d94703          	lbu	a4,13(s2)
    80003720:	02871713          	slli	a4,a4,0x28
    80003724:	00f76733          	or	a4,a4,a5
    80003728:	00e94783          	lbu	a5,14(s2)
    8000372c:	03079793          	slli	a5,a5,0x30
    80003730:	00e7e733          	or	a4,a5,a4
    80003734:	00f94783          	lbu	a5,15(s2)
    80003738:	03879793          	slli	a5,a5,0x38
    8000373c:	00e7e7b3          	or	a5,a5,a4
    80003740:	06078663          	beqz	a5,800037ac <_ZN11HeapManager8heapFreeEPv+0x214>
    80003744:	0107c703          	lbu	a4,16(a5)
    80003748:	0117c683          	lbu	a3,17(a5)
    8000374c:	00869693          	slli	a3,a3,0x8
    80003750:	00e6e6b3          	or	a3,a3,a4
    80003754:	0127c703          	lbu	a4,18(a5)
    80003758:	01071713          	slli	a4,a4,0x10
    8000375c:	00d766b3          	or	a3,a4,a3
    80003760:	0137c703          	lbu	a4,19(a5)
    80003764:	01871713          	slli	a4,a4,0x18
    80003768:	00d76733          	or	a4,a4,a3
    8000376c:	0147c683          	lbu	a3,20(a5)
    80003770:	02069693          	slli	a3,a3,0x20
    80003774:	00e6e733          	or	a4,a3,a4
    80003778:	0157c683          	lbu	a3,21(a5)
    8000377c:	02869693          	slli	a3,a3,0x28
    80003780:	00e6e6b3          	or	a3,a3,a4
    80003784:	0167c703          	lbu	a4,22(a5)
    80003788:	03071713          	slli	a4,a4,0x30
    8000378c:	00d766b3          	or	a3,a4,a3
    80003790:	0177c703          	lbu	a4,23(a5)
    80003794:	03871713          	slli	a4,a4,0x38
    80003798:	00d76733          	or	a4,a4,a3
    8000379c:	00170693          	addi	a3,a4,1
    800037a0:	00669693          	slli	a3,a3,0x6
    800037a4:	00d786b3          	add	a3,a5,a3
    800037a8:	38d90063          	beq	s2,a3,80003b28 <_ZN11HeapManager8heapFreeEPv+0x590>
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree->pPrev;
        }pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uintptr_t>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree->pNext)){
    800037ac:	0009c783          	lbu	a5,0(s3)
    800037b0:	0019c703          	lbu	a4,1(s3)
    800037b4:	00871713          	slli	a4,a4,0x8
    800037b8:	00f76733          	or	a4,a4,a5
    800037bc:	0029c783          	lbu	a5,2(s3)
    800037c0:	01079793          	slli	a5,a5,0x10
    800037c4:	00e7e733          	or	a4,a5,a4
    800037c8:	0039c783          	lbu	a5,3(s3)
    800037cc:	01879793          	slli	a5,a5,0x18
    800037d0:	00e7e7b3          	or	a5,a5,a4
    800037d4:	0049c703          	lbu	a4,4(s3)
    800037d8:	02071713          	slli	a4,a4,0x20
    800037dc:	00f767b3          	or	a5,a4,a5
    800037e0:	0059c703          	lbu	a4,5(s3)
    800037e4:	02871713          	slli	a4,a4,0x28
    800037e8:	00f76733          	or	a4,a4,a5
    800037ec:	0069c783          	lbu	a5,6(s3)
    800037f0:	03079793          	slli	a5,a5,0x30
    800037f4:	00e7e733          	or	a4,a5,a4
    800037f8:	0079c783          	lbu	a5,7(s3)
    800037fc:	03879793          	slli	a5,a5,0x38
    80003800:	00e7e7b3          	or	a5,a5,a4
    80003804:	06078663          	beqz	a5,80003870 <_ZN11HeapManager8heapFreeEPv+0x2d8>
    80003808:	0109c703          	lbu	a4,16(s3)
    8000380c:	0119c683          	lbu	a3,17(s3)
    80003810:	00869693          	slli	a3,a3,0x8
    80003814:	00e6e6b3          	or	a3,a3,a4
    80003818:	0129c703          	lbu	a4,18(s3)
    8000381c:	01071713          	slli	a4,a4,0x10
    80003820:	00d766b3          	or	a3,a4,a3
    80003824:	0139c703          	lbu	a4,19(s3)
    80003828:	01871713          	slli	a4,a4,0x18
    8000382c:	00d76733          	or	a4,a4,a3
    80003830:	0149c683          	lbu	a3,20(s3)
    80003834:	02069693          	slli	a3,a3,0x20
    80003838:	00e6e733          	or	a4,a3,a4
    8000383c:	0159c683          	lbu	a3,21(s3)
    80003840:	02869693          	slli	a3,a3,0x28
    80003844:	00e6e6b3          	or	a3,a3,a4
    80003848:	0169c703          	lbu	a4,22(s3)
    8000384c:	03071713          	slli	a4,a4,0x30
    80003850:	00d766b3          	or	a3,a4,a3
    80003854:	0179c703          	lbu	a4,23(s3)
    80003858:	03871713          	slli	a4,a4,0x38
    8000385c:	00d76733          	or	a4,a4,a3
    80003860:	00170693          	addi	a3,a4,1
    80003864:	00669693          	slli	a3,a3,0x6
    80003868:	00d986b3          	add	a3,s3,a3
    8000386c:	58f68863          	beq	a3,a5,80003dfc <_ZN11HeapManager8heapFreeEPv+0x864>
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree;
        }
    }
    return 0;
}
    80003870:	00000513          	li	a0,0
    80003874:	03813083          	ld	ra,56(sp)
    80003878:	03013403          	ld	s0,48(sp)
    8000387c:	02813483          	ld	s1,40(sp)
    80003880:	02013903          	ld	s2,32(sp)
    80003884:	01813983          	ld	s3,24(sp)
    80003888:	01013a03          	ld	s4,16(sp)
    8000388c:	00813a83          	ld	s5,8(sp)
    80003890:	04010113          	addi	sp,sp,64
    80003894:	00008067          	ret
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003898:	00004697          	auipc	a3,0x4
    8000389c:	98068693          	addi	a3,a3,-1664 # 80007218 <CONSOLE_STATUS+0x208>
    800038a0:	05500613          	li	a2,85
    800038a4:	00004597          	auipc	a1,0x4
    800038a8:	89458593          	addi	a1,a1,-1900 # 80007138 <CONSOLE_STATUS+0x128>
    800038ac:	00004517          	auipc	a0,0x4
    800038b0:	99450513          	addi	a0,a0,-1644 # 80007240 <CONSOLE_STATUS+0x230>
    800038b4:	ffffe097          	auipc	ra,0xffffe
    800038b8:	ff4080e7          	jalr	-12(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    800038bc:	d49ff06f          	j	80003604 <_ZN11HeapManager8heapFreeEPv+0x6c>
            pInsert = pInsert->pNext;
    800038c0:	0004c703          	lbu	a4,0(s1)
    800038c4:	0014c783          	lbu	a5,1(s1)
    800038c8:	00879793          	slli	a5,a5,0x8
    800038cc:	00e7e733          	or	a4,a5,a4
    800038d0:	0024c783          	lbu	a5,2(s1)
    800038d4:	01079793          	slli	a5,a5,0x10
    800038d8:	00e7e7b3          	or	a5,a5,a4
    800038dc:	0034c703          	lbu	a4,3(s1)
    800038e0:	01871713          	slli	a4,a4,0x18
    800038e4:	00f767b3          	or	a5,a4,a5
    800038e8:	0044c703          	lbu	a4,4(s1)
    800038ec:	02071713          	slli	a4,a4,0x20
    800038f0:	00f76733          	or	a4,a4,a5
    800038f4:	0054c783          	lbu	a5,5(s1)
    800038f8:	02879793          	slli	a5,a5,0x28
    800038fc:	00e7e733          	or	a4,a5,a4
    80003900:	0064c783          	lbu	a5,6(s1)
    80003904:	03079793          	slli	a5,a5,0x30
    80003908:	00e7e7b3          	or	a5,a5,a4
    8000390c:	0074c483          	lbu	s1,7(s1)
    80003910:	03849493          	slli	s1,s1,0x38
    80003914:	00f4e4b3          	or	s1,s1,a5
        while(pInsert->pNext != 0 && pInsert->pNext < pAddress){
    80003918:	0004c783          	lbu	a5,0(s1)
    8000391c:	0014c703          	lbu	a4,1(s1)
    80003920:	00871713          	slli	a4,a4,0x8
    80003924:	00f76733          	or	a4,a4,a5
    80003928:	0024c783          	lbu	a5,2(s1)
    8000392c:	01079793          	slli	a5,a5,0x10
    80003930:	00e7e733          	or	a4,a5,a4
    80003934:	0034c783          	lbu	a5,3(s1)
    80003938:	01879793          	slli	a5,a5,0x18
    8000393c:	00e7e7b3          	or	a5,a5,a4
    80003940:	0044c703          	lbu	a4,4(s1)
    80003944:	02071713          	slli	a4,a4,0x20
    80003948:	00f767b3          	or	a5,a4,a5
    8000394c:	0054c703          	lbu	a4,5(s1)
    80003950:	02871713          	slli	a4,a4,0x28
    80003954:	00f76733          	or	a4,a4,a5
    80003958:	0064c783          	lbu	a5,6(s1)
    8000395c:	03079793          	slli	a5,a5,0x30
    80003960:	00e7e733          	or	a4,a5,a4
    80003964:	0074c783          	lbu	a5,7(s1)
    80003968:	03879793          	slli	a5,a5,0x38
    8000396c:	00e7e7b3          	or	a5,a5,a4
    80003970:	06078463          	beqz	a5,800039d8 <_ZN11HeapManager8heapFreeEPv+0x440>
    80003974:	0747f263          	bgeu	a5,s4,800039d8 <_ZN11HeapManager8heapFreeEPv+0x440>
            assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    80003978:	0184c783          	lbu	a5,24(s1)
    8000397c:	0194c703          	lbu	a4,25(s1)
    80003980:	00871713          	slli	a4,a4,0x8
    80003984:	00f76733          	or	a4,a4,a5
    80003988:	01a4c783          	lbu	a5,26(s1)
    8000398c:	01079793          	slli	a5,a5,0x10
    80003990:	00e7e733          	or	a4,a5,a4
    80003994:	01b4c783          	lbu	a5,27(s1)
    80003998:	01879793          	slli	a5,a5,0x18
    8000399c:	00e7e7b3          	or	a5,a5,a4
    800039a0:	0007879b          	sext.w	a5,a5
    800039a4:	deadc737          	lui	a4,0xdeadc
    800039a8:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2cee>
    800039ac:	f0e78ae3          	beq	a5,a4,800038c0 <_ZN11HeapManager8heapFreeEPv+0x328>
    800039b0:	00004697          	auipc	a3,0x4
    800039b4:	86868693          	addi	a3,a3,-1944 # 80007218 <CONSOLE_STATUS+0x208>
    800039b8:	05e00613          	li	a2,94
    800039bc:	00003597          	auipc	a1,0x3
    800039c0:	77c58593          	addi	a1,a1,1916 # 80007138 <CONSOLE_STATUS+0x128>
    800039c4:	00004517          	auipc	a0,0x4
    800039c8:	8a450513          	addi	a0,a0,-1884 # 80007268 <CONSOLE_STATUS+0x258>
    800039cc:	ffffe097          	auipc	ra,0xffffe
    800039d0:	edc080e7          	jalr	-292(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    800039d4:	eedff06f          	j	800038c0 <_ZN11HeapManager8heapFreeEPv+0x328>
        pFree->pNext = pInsert->pNext;
    800039d8:	fcfa0023          	sb	a5,-64(s4)
    800039dc:	0087d713          	srli	a4,a5,0x8
    800039e0:	00e900a3          	sb	a4,1(s2)
    800039e4:	0107d713          	srli	a4,a5,0x10
    800039e8:	00e90123          	sb	a4,2(s2)
    800039ec:	0187d71b          	srliw	a4,a5,0x18
    800039f0:	00e901a3          	sb	a4,3(s2)
    800039f4:	0207d713          	srli	a4,a5,0x20
    800039f8:	00e90223          	sb	a4,4(s2)
    800039fc:	0287d713          	srli	a4,a5,0x28
    80003a00:	00e902a3          	sb	a4,5(s2)
    80003a04:	0307d713          	srli	a4,a5,0x30
    80003a08:	00e90323          	sb	a4,6(s2)
    80003a0c:	0387d793          	srli	a5,a5,0x38
    80003a10:	00f903a3          	sb	a5,7(s2)
        pFree->pPrev = pInsert;
    80003a14:	00990423          	sb	s1,8(s2)
    80003a18:	0084d793          	srli	a5,s1,0x8
    80003a1c:	00f904a3          	sb	a5,9(s2)
    80003a20:	0104d793          	srli	a5,s1,0x10
    80003a24:	00f90523          	sb	a5,10(s2)
    80003a28:	0184d79b          	srliw	a5,s1,0x18
    80003a2c:	00f905a3          	sb	a5,11(s2)
    80003a30:	0204d793          	srli	a5,s1,0x20
    80003a34:	00f90623          	sb	a5,12(s2)
    80003a38:	0284d793          	srli	a5,s1,0x28
    80003a3c:	00f906a3          	sb	a5,13(s2)
    80003a40:	0304d793          	srli	a5,s1,0x30
    80003a44:	00f90723          	sb	a5,14(s2)
    80003a48:	0384d793          	srli	a5,s1,0x38
    80003a4c:	00f907a3          	sb	a5,15(s2)
        if(pInsert->pNext != 0){
    80003a50:	0004c783          	lbu	a5,0(s1)
    80003a54:	0014c703          	lbu	a4,1(s1)
    80003a58:	00871713          	slli	a4,a4,0x8
    80003a5c:	00f76733          	or	a4,a4,a5
    80003a60:	0024c783          	lbu	a5,2(s1)
    80003a64:	01079793          	slli	a5,a5,0x10
    80003a68:	00e7e733          	or	a4,a5,a4
    80003a6c:	0034c783          	lbu	a5,3(s1)
    80003a70:	01879793          	slli	a5,a5,0x18
    80003a74:	00e7e7b3          	or	a5,a5,a4
    80003a78:	0044c703          	lbu	a4,4(s1)
    80003a7c:	02071713          	slli	a4,a4,0x20
    80003a80:	00f767b3          	or	a5,a4,a5
    80003a84:	0054c703          	lbu	a4,5(s1)
    80003a88:	02871713          	slli	a4,a4,0x28
    80003a8c:	00f76733          	or	a4,a4,a5
    80003a90:	0064c783          	lbu	a5,6(s1)
    80003a94:	03079793          	slli	a5,a5,0x30
    80003a98:	00e7e733          	or	a4,a5,a4
    80003a9c:	0074c783          	lbu	a5,7(s1)
    80003aa0:	03879793          	slli	a5,a5,0x38
    80003aa4:	00e7e7b3          	or	a5,a5,a4
    80003aa8:	04078063          	beqz	a5,80003ae8 <_ZN11HeapManager8heapFreeEPv+0x550>
            pInsert->pNext->pPrev = pFree;
    80003aac:	01278423          	sb	s2,8(a5)
    80003ab0:	00895713          	srli	a4,s2,0x8
    80003ab4:	00e784a3          	sb	a4,9(a5)
    80003ab8:	01095713          	srli	a4,s2,0x10
    80003abc:	00e78523          	sb	a4,10(a5)
    80003ac0:	0189571b          	srliw	a4,s2,0x18
    80003ac4:	00e785a3          	sb	a4,11(a5)
    80003ac8:	02095713          	srli	a4,s2,0x20
    80003acc:	00e78623          	sb	a4,12(a5)
    80003ad0:	02895713          	srli	a4,s2,0x28
    80003ad4:	00e786a3          	sb	a4,13(a5)
    80003ad8:	03095713          	srli	a4,s2,0x30
    80003adc:	00e78723          	sb	a4,14(a5)
    80003ae0:	03895713          	srli	a4,s2,0x38
    80003ae4:	00e787a3          	sb	a4,15(a5)
        pInsert->pNext = pFree;
    80003ae8:	01248023          	sb	s2,0(s1)
    80003aec:	00895793          	srli	a5,s2,0x8
    80003af0:	00f480a3          	sb	a5,1(s1)
    80003af4:	01095793          	srli	a5,s2,0x10
    80003af8:	00f48123          	sb	a5,2(s1)
    80003afc:	0189579b          	srliw	a5,s2,0x18
    80003b00:	00f481a3          	sb	a5,3(s1)
    80003b04:	02095793          	srli	a5,s2,0x20
    80003b08:	00f48223          	sb	a5,4(s1)
    80003b0c:	02895793          	srli	a5,s2,0x28
    80003b10:	00f482a3          	sb	a5,5(s1)
    80003b14:	03095793          	srli	a5,s2,0x30
    80003b18:	00f48323          	sb	a5,6(s1)
    80003b1c:	03895793          	srli	a5,s2,0x38
    80003b20:	00f483a3          	sb	a5,7(s1)
    80003b24:	bc5ff06f          	j	800036e8 <_ZN11HeapManager8heapFreeEPv+0x150>
        pFree->pPrev->nSize += pFree->nSize + 1;
    80003b28:	01094683          	lbu	a3,16(s2)
    80003b2c:	01194603          	lbu	a2,17(s2)
    80003b30:	00861613          	slli	a2,a2,0x8
    80003b34:	00d66633          	or	a2,a2,a3
    80003b38:	01294683          	lbu	a3,18(s2)
    80003b3c:	01069693          	slli	a3,a3,0x10
    80003b40:	00c6e633          	or	a2,a3,a2
    80003b44:	01394683          	lbu	a3,19(s2)
    80003b48:	01869693          	slli	a3,a3,0x18
    80003b4c:	00c6e6b3          	or	a3,a3,a2
    80003b50:	01494603          	lbu	a2,20(s2)
    80003b54:	02061613          	slli	a2,a2,0x20
    80003b58:	00d666b3          	or	a3,a2,a3
    80003b5c:	01594603          	lbu	a2,21(s2)
    80003b60:	02861613          	slli	a2,a2,0x28
    80003b64:	00d66633          	or	a2,a2,a3
    80003b68:	01694683          	lbu	a3,22(s2)
    80003b6c:	03069693          	slli	a3,a3,0x30
    80003b70:	00c6e633          	or	a2,a3,a2
    80003b74:	01794683          	lbu	a3,23(s2)
    80003b78:	03869693          	slli	a3,a3,0x38
    80003b7c:	00c6e6b3          	or	a3,a3,a2
    80003b80:	00d70733          	add	a4,a4,a3
    80003b84:	00170713          	addi	a4,a4,1
    80003b88:	00e78823          	sb	a4,16(a5)
    80003b8c:	00875693          	srli	a3,a4,0x8
    80003b90:	00d788a3          	sb	a3,17(a5)
    80003b94:	01075693          	srli	a3,a4,0x10
    80003b98:	00d78923          	sb	a3,18(a5)
    80003b9c:	0187569b          	srliw	a3,a4,0x18
    80003ba0:	00d789a3          	sb	a3,19(a5)
    80003ba4:	02075693          	srli	a3,a4,0x20
    80003ba8:	00d78a23          	sb	a3,20(a5)
    80003bac:	02875693          	srli	a3,a4,0x28
    80003bb0:	00d78aa3          	sb	a3,21(a5)
    80003bb4:	03075693          	srli	a3,a4,0x30
    80003bb8:	00d78b23          	sb	a3,22(a5)
    80003bbc:	03875713          	srli	a4,a4,0x38
    80003bc0:	00e78ba3          	sb	a4,23(a5)
        pFree->pPrev->pNext = pFree->pNext;
    80003bc4:	00894703          	lbu	a4,8(s2)
    80003bc8:	00994783          	lbu	a5,9(s2)
    80003bcc:	00879793          	slli	a5,a5,0x8
    80003bd0:	00e7e7b3          	or	a5,a5,a4
    80003bd4:	00a94703          	lbu	a4,10(s2)
    80003bd8:	01071713          	slli	a4,a4,0x10
    80003bdc:	00f767b3          	or	a5,a4,a5
    80003be0:	00b94703          	lbu	a4,11(s2)
    80003be4:	01871713          	slli	a4,a4,0x18
    80003be8:	00f76733          	or	a4,a4,a5
    80003bec:	00c94783          	lbu	a5,12(s2)
    80003bf0:	02079793          	slli	a5,a5,0x20
    80003bf4:	00e7e733          	or	a4,a5,a4
    80003bf8:	00d94783          	lbu	a5,13(s2)
    80003bfc:	02879793          	slli	a5,a5,0x28
    80003c00:	00e7e7b3          	or	a5,a5,a4
    80003c04:	00e94703          	lbu	a4,14(s2)
    80003c08:	03071713          	slli	a4,a4,0x30
    80003c0c:	00f767b3          	or	a5,a4,a5
    80003c10:	00f94703          	lbu	a4,15(s2)
    80003c14:	03871713          	slli	a4,a4,0x38
    80003c18:	00f76733          	or	a4,a4,a5
    80003c1c:	fc0a4783          	lbu	a5,-64(s4)
    80003c20:	00194683          	lbu	a3,1(s2)
    80003c24:	00869693          	slli	a3,a3,0x8
    80003c28:	00f6e7b3          	or	a5,a3,a5
    80003c2c:	00294683          	lbu	a3,2(s2)
    80003c30:	01069693          	slli	a3,a3,0x10
    80003c34:	00f6e6b3          	or	a3,a3,a5
    80003c38:	00394783          	lbu	a5,3(s2)
    80003c3c:	01879793          	slli	a5,a5,0x18
    80003c40:	00d7e6b3          	or	a3,a5,a3
    80003c44:	00494783          	lbu	a5,4(s2)
    80003c48:	02079793          	slli	a5,a5,0x20
    80003c4c:	00d7e7b3          	or	a5,a5,a3
    80003c50:	00594683          	lbu	a3,5(s2)
    80003c54:	02869693          	slli	a3,a3,0x28
    80003c58:	00f6e7b3          	or	a5,a3,a5
    80003c5c:	00694683          	lbu	a3,6(s2)
    80003c60:	03069693          	slli	a3,a3,0x30
    80003c64:	00f6e6b3          	or	a3,a3,a5
    80003c68:	00794783          	lbu	a5,7(s2)
    80003c6c:	03879793          	slli	a5,a5,0x38
    80003c70:	00d7e7b3          	or	a5,a5,a3
    80003c74:	00d70023          	sb	a3,0(a4)
    80003c78:	0087d693          	srli	a3,a5,0x8
    80003c7c:	00d700a3          	sb	a3,1(a4)
    80003c80:	0107d693          	srli	a3,a5,0x10
    80003c84:	00d70123          	sb	a3,2(a4)
    80003c88:	0187d69b          	srliw	a3,a5,0x18
    80003c8c:	00d701a3          	sb	a3,3(a4)
    80003c90:	0207d693          	srli	a3,a5,0x20
    80003c94:	00d70223          	sb	a3,4(a4)
    80003c98:	0287d693          	srli	a3,a5,0x28
    80003c9c:	00d702a3          	sb	a3,5(a4)
    80003ca0:	0307d693          	srli	a3,a5,0x30
    80003ca4:	00d70323          	sb	a3,6(a4)
    80003ca8:	0387d793          	srli	a5,a5,0x38
    80003cac:	00f703a3          	sb	a5,7(a4)
        if(pFree->pNext != 0){
    80003cb0:	fc0a4783          	lbu	a5,-64(s4)
    80003cb4:	00194703          	lbu	a4,1(s2)
    80003cb8:	00871713          	slli	a4,a4,0x8
    80003cbc:	00f76733          	or	a4,a4,a5
    80003cc0:	00294783          	lbu	a5,2(s2)
    80003cc4:	01079793          	slli	a5,a5,0x10
    80003cc8:	00e7e733          	or	a4,a5,a4
    80003ccc:	00394783          	lbu	a5,3(s2)
    80003cd0:	01879793          	slli	a5,a5,0x18
    80003cd4:	00e7e7b3          	or	a5,a5,a4
    80003cd8:	00494703          	lbu	a4,4(s2)
    80003cdc:	02071713          	slli	a4,a4,0x20
    80003ce0:	00f767b3          	or	a5,a4,a5
    80003ce4:	00594703          	lbu	a4,5(s2)
    80003ce8:	02871713          	slli	a4,a4,0x28
    80003cec:	00f76733          	or	a4,a4,a5
    80003cf0:	00694783          	lbu	a5,6(s2)
    80003cf4:	03079793          	slli	a5,a5,0x30
    80003cf8:	00e7e733          	or	a4,a5,a4
    80003cfc:	00794783          	lbu	a5,7(s2)
    80003d00:	03879793          	slli	a5,a5,0x38
    80003d04:	00e7e7b3          	or	a5,a5,a4
    80003d08:	08078c63          	beqz	a5,80003da0 <_ZN11HeapManager8heapFreeEPv+0x808>
            pFree->pNext->pPrev = pFree->pPrev;
    80003d0c:	00894703          	lbu	a4,8(s2)
    80003d10:	00994683          	lbu	a3,9(s2)
    80003d14:	00869693          	slli	a3,a3,0x8
    80003d18:	00e6e733          	or	a4,a3,a4
    80003d1c:	00a94683          	lbu	a3,10(s2)
    80003d20:	01069693          	slli	a3,a3,0x10
    80003d24:	00e6e6b3          	or	a3,a3,a4
    80003d28:	00b94703          	lbu	a4,11(s2)
    80003d2c:	01871713          	slli	a4,a4,0x18
    80003d30:	00d766b3          	or	a3,a4,a3
    80003d34:	00c94703          	lbu	a4,12(s2)
    80003d38:	02071713          	slli	a4,a4,0x20
    80003d3c:	00d76733          	or	a4,a4,a3
    80003d40:	00d94683          	lbu	a3,13(s2)
    80003d44:	02869693          	slli	a3,a3,0x28
    80003d48:	00e6e733          	or	a4,a3,a4
    80003d4c:	00e94683          	lbu	a3,14(s2)
    80003d50:	03069693          	slli	a3,a3,0x30
    80003d54:	00e6e6b3          	or	a3,a3,a4
    80003d58:	00f94703          	lbu	a4,15(s2)
    80003d5c:	03871713          	slli	a4,a4,0x38
    80003d60:	00d76733          	or	a4,a4,a3
    80003d64:	00d78423          	sb	a3,8(a5)
    80003d68:	00875693          	srli	a3,a4,0x8
    80003d6c:	00d784a3          	sb	a3,9(a5)
    80003d70:	01075693          	srli	a3,a4,0x10
    80003d74:	00d78523          	sb	a3,10(a5)
    80003d78:	0187569b          	srliw	a3,a4,0x18
    80003d7c:	00d785a3          	sb	a3,11(a5)
    80003d80:	02075693          	srli	a3,a4,0x20
    80003d84:	00d78623          	sb	a3,12(a5)
    80003d88:	02875693          	srli	a3,a4,0x28
    80003d8c:	00d786a3          	sb	a3,13(a5)
    80003d90:	03075693          	srli	a3,a4,0x30
    80003d94:	00d78723          	sb	a3,14(a5)
    80003d98:	03875713          	srli	a4,a4,0x38
    80003d9c:	00e787a3          	sb	a4,15(a5)
        }pFree = pFree->pPrev;
    80003da0:	00894983          	lbu	s3,8(s2)
    80003da4:	00994783          	lbu	a5,9(s2)
    80003da8:	00879793          	slli	a5,a5,0x8
    80003dac:	0137e7b3          	or	a5,a5,s3
    80003db0:	00a94983          	lbu	s3,10(s2)
    80003db4:	01099993          	slli	s3,s3,0x10
    80003db8:	00f9e7b3          	or	a5,s3,a5
    80003dbc:	00b94983          	lbu	s3,11(s2)
    80003dc0:	01899993          	slli	s3,s3,0x18
    80003dc4:	00f9e9b3          	or	s3,s3,a5
    80003dc8:	00c94783          	lbu	a5,12(s2)
    80003dcc:	02079793          	slli	a5,a5,0x20
    80003dd0:	0137e9b3          	or	s3,a5,s3
    80003dd4:	00d94783          	lbu	a5,13(s2)
    80003dd8:	02879793          	slli	a5,a5,0x28
    80003ddc:	0137e7b3          	or	a5,a5,s3
    80003de0:	00e94983          	lbu	s3,14(s2)
    80003de4:	03099993          	slli	s3,s3,0x30
    80003de8:	00f9e7b3          	or	a5,s3,a5
    80003dec:	00f94983          	lbu	s3,15(s2)
    80003df0:	03899993          	slli	s3,s3,0x38
    80003df4:	00f9e9b3          	or	s3,s3,a5
    80003df8:	9b5ff06f          	j	800037ac <_ZN11HeapManager8heapFreeEPv+0x214>
        pFree->nSize += pFree->pNext->nSize + 1;
    80003dfc:	0107c683          	lbu	a3,16(a5)
    80003e00:	0117c603          	lbu	a2,17(a5)
    80003e04:	00861613          	slli	a2,a2,0x8
    80003e08:	00d66633          	or	a2,a2,a3
    80003e0c:	0127c683          	lbu	a3,18(a5)
    80003e10:	01069693          	slli	a3,a3,0x10
    80003e14:	00c6e633          	or	a2,a3,a2
    80003e18:	0137c683          	lbu	a3,19(a5)
    80003e1c:	01869693          	slli	a3,a3,0x18
    80003e20:	00c6e6b3          	or	a3,a3,a2
    80003e24:	0147c603          	lbu	a2,20(a5)
    80003e28:	02061613          	slli	a2,a2,0x20
    80003e2c:	00d666b3          	or	a3,a2,a3
    80003e30:	0157c603          	lbu	a2,21(a5)
    80003e34:	02861613          	slli	a2,a2,0x28
    80003e38:	00d66633          	or	a2,a2,a3
    80003e3c:	0167c683          	lbu	a3,22(a5)
    80003e40:	03069693          	slli	a3,a3,0x30
    80003e44:	00c6e633          	or	a2,a3,a2
    80003e48:	0177c683          	lbu	a3,23(a5)
    80003e4c:	03869693          	slli	a3,a3,0x38
    80003e50:	00c6e6b3          	or	a3,a3,a2
    80003e54:	00d70733          	add	a4,a4,a3
    80003e58:	00170713          	addi	a4,a4,1
    80003e5c:	00e98823          	sb	a4,16(s3)
    80003e60:	00875693          	srli	a3,a4,0x8
    80003e64:	00d988a3          	sb	a3,17(s3)
    80003e68:	01075693          	srli	a3,a4,0x10
    80003e6c:	00d98923          	sb	a3,18(s3)
    80003e70:	0187569b          	srliw	a3,a4,0x18
    80003e74:	00d989a3          	sb	a3,19(s3)
    80003e78:	02075693          	srli	a3,a4,0x20
    80003e7c:	00d98a23          	sb	a3,20(s3)
    80003e80:	02875693          	srli	a3,a4,0x28
    80003e84:	00d98aa3          	sb	a3,21(s3)
    80003e88:	03075693          	srli	a3,a4,0x30
    80003e8c:	00d98b23          	sb	a3,22(s3)
    80003e90:	03875713          	srli	a4,a4,0x38
    80003e94:	00e98ba3          	sb	a4,23(s3)
        pFree->pNext = pFree->pNext->pNext;
    80003e98:	0007c683          	lbu	a3,0(a5)
    80003e9c:	0017c703          	lbu	a4,1(a5)
    80003ea0:	00871713          	slli	a4,a4,0x8
    80003ea4:	00d766b3          	or	a3,a4,a3
    80003ea8:	0027c703          	lbu	a4,2(a5)
    80003eac:	01071713          	slli	a4,a4,0x10
    80003eb0:	00d76733          	or	a4,a4,a3
    80003eb4:	0037c683          	lbu	a3,3(a5)
    80003eb8:	01869693          	slli	a3,a3,0x18
    80003ebc:	00e6e733          	or	a4,a3,a4
    80003ec0:	0047c683          	lbu	a3,4(a5)
    80003ec4:	02069693          	slli	a3,a3,0x20
    80003ec8:	00e6e6b3          	or	a3,a3,a4
    80003ecc:	0057c703          	lbu	a4,5(a5)
    80003ed0:	02871713          	slli	a4,a4,0x28
    80003ed4:	00d766b3          	or	a3,a4,a3
    80003ed8:	0067c703          	lbu	a4,6(a5)
    80003edc:	03071713          	slli	a4,a4,0x30
    80003ee0:	00d76733          	or	a4,a4,a3
    80003ee4:	0077c783          	lbu	a5,7(a5)
    80003ee8:	03879793          	slli	a5,a5,0x38
    80003eec:	00e7e7b3          	or	a5,a5,a4
    80003ef0:	00e98023          	sb	a4,0(s3)
    80003ef4:	0087d713          	srli	a4,a5,0x8
    80003ef8:	00e980a3          	sb	a4,1(s3)
    80003efc:	0107d713          	srli	a4,a5,0x10
    80003f00:	00e98123          	sb	a4,2(s3)
    80003f04:	0187d71b          	srliw	a4,a5,0x18
    80003f08:	00e981a3          	sb	a4,3(s3)
    80003f0c:	0207d713          	srli	a4,a5,0x20
    80003f10:	00e98223          	sb	a4,4(s3)
    80003f14:	0287d713          	srli	a4,a5,0x28
    80003f18:	00e982a3          	sb	a4,5(s3)
    80003f1c:	0307d713          	srli	a4,a5,0x30
    80003f20:	00e98323          	sb	a4,6(s3)
    80003f24:	0387d713          	srli	a4,a5,0x38
    80003f28:	00e983a3          	sb	a4,7(s3)
        if(pFree->pNext != 0){
    80003f2c:	940782e3          	beqz	a5,80003870 <_ZN11HeapManager8heapFreeEPv+0x2d8>
            pFree->pNext->pPrev = pFree;
    80003f30:	01378423          	sb	s3,8(a5)
    80003f34:	0089d713          	srli	a4,s3,0x8
    80003f38:	00e784a3          	sb	a4,9(a5)
    80003f3c:	0109d713          	srli	a4,s3,0x10
    80003f40:	00e78523          	sb	a4,10(a5)
    80003f44:	0189d71b          	srliw	a4,s3,0x18
    80003f48:	00e785a3          	sb	a4,11(a5)
    80003f4c:	0209d713          	srli	a4,s3,0x20
    80003f50:	00e78623          	sb	a4,12(a5)
    80003f54:	0289d713          	srli	a4,s3,0x28
    80003f58:	00e786a3          	sb	a4,13(a5)
    80003f5c:	0309d713          	srli	a4,s3,0x30
    80003f60:	00e78723          	sb	a4,14(a5)
    80003f64:	0389d993          	srli	s3,s3,0x38
    80003f68:	013787a3          	sb	s3,15(a5)
    80003f6c:	905ff06f          	j	80003870 <_ZN11HeapManager8heapFreeEPv+0x2d8>

0000000080003f70 <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"
#include "assert.h"

extern "C" void exceptionHandler(){
    80003f70:	fc010113          	addi	sp,sp,-64
    80003f74:	02113c23          	sd	ra,56(sp)
    80003f78:	02813823          	sd	s0,48(sp)
    80003f7c:	02913423          	sd	s1,40(sp)
    80003f80:	03213023          	sd	s2,32(sp)
    80003f84:	01313c23          	sd	s3,24(sp)
    80003f88:	01413823          	sd	s4,16(sp)
    80003f8c:	01513423          	sd	s5,8(sp)
    80003f90:	01613023          	sd	s6,0(sp)
    80003f94:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    80003f98:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    80003f9c:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    80003fa0:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    80003fa4:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80003fa8:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80003fac:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80003fb0:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80003fb4:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80003fb8:	ff870613          	addi	a2,a4,-8
    80003fbc:	00100693          	li	a3,1
    80003fc0:	04c6f463          	bgeu	a3,a2,80004008 <exceptionHandler+0x98>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    80003fc4:	00500793          	li	a5,5
    80003fc8:	20f70e63          	beq	a4,a5,800041e4 <exceptionHandler+0x274>
                __putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    80003fcc:	00700793          	li	a5,7
    80003fd0:	3cf70863          	beq	a4,a5,800043a0 <exceptionHandler+0x430>
                __putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    80003fd4:	fff00793          	li	a5,-1
    80003fd8:	03f79793          	slli	a5,a5,0x3f
    80003fdc:	00178793          	addi	a5,a5,1
    80003fe0:	58f70463          	beq	a4,a5,80004568 <exceptionHandler+0x5f8>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    80003fe4:	fff00793          	li	a5,-1
    80003fe8:	03f79793          	slli	a5,a5,0x3f
    80003fec:	00978793          	addi	a5,a5,9
    80003ff0:	08f71863          	bne	a4,a5,80004080 <exceptionHandler+0x110>
    {   
        int irq = plic_claim();
    80003ff4:	00001097          	auipc	ra,0x1
    80003ff8:	240080e7          	jalr	576(ra) # 80005234 <plic_claim>
        // if(irq == CONSOLE_IRQ)Console::console_handler();
        plic_complete(irq);
    80003ffc:	00001097          	auipc	ra,0x1
    80004000:	270080e7          	jalr	624(ra) # 8000526c <plic_complete>
    80004004:	07c0006f          	j	80004080 <exceptionHandler+0x110>
        switch(a0){
    80004008:	04200713          	li	a4,66
    8000400c:	02f76463          	bltu	a4,a5,80004034 <exceptionHandler+0xc4>
    80004010:	1c078263          	beqz	a5,800041d4 <exceptionHandler+0x264>
    80004014:	1cf76463          	bltu	a4,a5,800041dc <exceptionHandler+0x26c>
    80004018:	00279793          	slli	a5,a5,0x2
    8000401c:	00003717          	auipc	a4,0x3
    80004020:	2d870713          	addi	a4,a4,728 # 800072f4 <CONSOLE_STATUS+0x2e4>
    80004024:	00e787b3          	add	a5,a5,a4
    80004028:	0007a783          	lw	a5,0(a5)
    8000402c:	00e787b3          	add	a5,a5,a4
    80004030:	00078067          	jr	a5
    80004034:	0ff00713          	li	a4,255
    80004038:	02e79663          	bne	a5,a4,80004064 <exceptionHandler+0xf4>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    8000403c:	00000793          	li	a5,0
    80004040:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80004044:	00448493          	addi	s1,s1,4
    80004048:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    8000404c:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    80004050:	10000793          	li	a5,256
    80004054:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80004058:	00200793          	li	a5,2
    8000405c:	1447b073          	csrc	sip,a5
                return;
    80004060:	0200006f          	j	80004080 <exceptionHandler+0x110>
        switch(a0){
    80004064:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80004068:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    8000406c:	00448493          	addi	s1,s1,4
    80004070:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004074:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80004078:	00200793          	li	a5,2
    8000407c:	1447b073          	csrc	sip,a5
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    80004080:	03813083          	ld	ra,56(sp)
    80004084:	03013403          	ld	s0,48(sp)
    80004088:	02813483          	ld	s1,40(sp)
    8000408c:	02013903          	ld	s2,32(sp)
    80004090:	01813983          	ld	s3,24(sp)
    80004094:	01013a03          	ld	s4,16(sp)
    80004098:	00813a83          	ld	s5,8(sp)
    8000409c:	00013b03          	ld	s6,0(sp)
    800040a0:	04010113          	addi	sp,sp,64
    800040a4:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    800040a8:	00098593          	mv	a1,s3
    800040ac:	00004797          	auipc	a5,0x4
    800040b0:	0347b783          	ld	a5,52(a5) # 800080e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800040b4:	0007b503          	ld	a0,0(a5)
    800040b8:	fffff097          	auipc	ra,0xfffff
    800040bc:	e88080e7          	jalr	-376(ra) # 80002f40 <_ZN11HeapManager12heapAllocateEm>
                break;
    800040c0:	fa9ff06f          	j	80004068 <exceptionHandler+0xf8>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    800040c4:	00098593          	mv	a1,s3
    800040c8:	00004797          	auipc	a5,0x4
    800040cc:	0187b783          	ld	a5,24(a5) # 800080e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800040d0:	0007b503          	ld	a0,0(a5)
    800040d4:	fffff097          	auipc	ra,0xfffff
    800040d8:	4c4080e7          	jalr	1220(ra) # 80003598 <_ZN11HeapManager8heapFreeEPv>
                break;
    800040dc:	f8dff06f          	j	80004068 <exceptionHandler+0xf8>
                __putc('\0'); /// removing this line causes everything to break
    800040e0:	00000513          	li	a0,0
    800040e4:	00003097          	auipc	ra,0x3
    800040e8:	9b8080e7          	jalr	-1608(ra) # 80006a9c <__putc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    800040ec:	00100713          	li	a4,1
    800040f0:	000b0693          	mv	a3,s6
    800040f4:	000a8613          	mv	a2,s5
    800040f8:	000a0593          	mv	a1,s4
    800040fc:	00098513          	mv	a0,s3
    80004100:	ffffe097          	auipc	ra,0xffffe
    80004104:	508080e7          	jalr	1288(ra) # 80002608 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80004108:	f61ff06f          	j	80004068 <exceptionHandler+0xf8>
                returnVal = _thread::currentThread->exit();
    8000410c:	fffff097          	auipc	ra,0xfffff
    80004110:	88c080e7          	jalr	-1908(ra) # 80002998 <_ZN7_thread4exitEv>
                break;
    80004114:	f55ff06f          	j	80004068 <exceptionHandler+0xf8>
                _thread::dispatch();
    80004118:	fffff097          	auipc	ra,0xfffff
    8000411c:	a90080e7          	jalr	-1392(ra) # 80002ba8 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80004120:	00000513          	li	a0,0
                break;
    80004124:	f45ff06f          	j	80004068 <exceptionHandler+0xf8>
                _thread::currentThread->join((thread_t)a1);
    80004128:	00098593          	mv	a1,s3
    8000412c:	00004797          	auipc	a5,0x4
    80004130:	fd47b783          	ld	a5,-44(a5) # 80008100 <_GLOBAL_OFFSET_TABLE_+0x38>
    80004134:	0007b503          	ld	a0,0(a5)
    80004138:	ffffe097          	auipc	ra,0xffffe
    8000413c:	6a0080e7          	jalr	1696(ra) # 800027d8 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80004140:	00000513          	li	a0,0
                break;
    80004144:	f25ff06f          	j	80004068 <exceptionHandler+0xf8>
                _sem::open((sem_t*)a1, unsigned(a2));
    80004148:	000a059b          	sext.w	a1,s4
    8000414c:	00098513          	mv	a0,s3
    80004150:	ffffd097          	auipc	ra,0xffffd
    80004154:	4d4080e7          	jalr	1236(ra) # 80001624 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80004158:	00000513          	li	a0,0
                break;
    8000415c:	f0dff06f          	j	80004068 <exceptionHandler+0xf8>
                _sem::close((sem_t)a1);
    80004160:	00098513          	mv	a0,s3
    80004164:	ffffd097          	auipc	ra,0xffffd
    80004168:	51c080e7          	jalr	1308(ra) # 80001680 <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    8000416c:	00000513          	li	a0,0
                break;
    80004170:	ef9ff06f          	j	80004068 <exceptionHandler+0xf8>
                _sem::wait((sem_t)a1);
    80004174:	00098513          	mv	a0,s3
    80004178:	ffffd097          	auipc	ra,0xffffd
    8000417c:	55c080e7          	jalr	1372(ra) # 800016d4 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    80004180:	00000513          	li	a0,0
                break;
    80004184:	ee5ff06f          	j	80004068 <exceptionHandler+0xf8>
                _sem::signal((sem_t)a1);
    80004188:	00098513          	mv	a0,s3
    8000418c:	ffffd097          	auipc	ra,0xffffd
    80004190:	5ec080e7          	jalr	1516(ra) # 80001778 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80004194:	00000513          	li	a0,0
                break;
    80004198:	ed1ff06f          	j	80004068 <exceptionHandler+0xf8>
                returnVal = Timer::getInstance().sleep(a1);
    8000419c:	ffffd097          	auipc	ra,0xffffd
    800041a0:	ffc080e7          	jalr	-4(ra) # 80001198 <_ZN5Timer11getInstanceEv>
    800041a4:	00098593          	mv	a1,s3
    800041a8:	ffffd097          	auipc	ra,0xffffd
    800041ac:	138080e7          	jalr	312(ra) # 800012e0 <_ZN5Timer5sleepEm>
                break;
    800041b0:	eb9ff06f          	j	80004068 <exceptionHandler+0xf8>
                returnVal = __getc();
    800041b4:	00003097          	auipc	ra,0x3
    800041b8:	924080e7          	jalr	-1756(ra) # 80006ad8 <__getc>
                break;
    800041bc:	eadff06f          	j	80004068 <exceptionHandler+0xf8>
                __putc(a1);
    800041c0:	0ff9f513          	andi	a0,s3,255
    800041c4:	00003097          	auipc	ra,0x3
    800041c8:	8d8080e7          	jalr	-1832(ra) # 80006a9c <__putc>
    uint64 returnVal = 0;
    800041cc:	00000513          	li	a0,0
                break;
    800041d0:	e99ff06f          	j	80004068 <exceptionHandler+0xf8>
        switch(a0){
    800041d4:	00000513          	li	a0,0
    800041d8:	e91ff06f          	j	80004068 <exceptionHandler+0xf8>
    800041dc:	00000513          	li	a0,0
    800041e0:	e89ff06f          	j	80004068 <exceptionHandler+0xf8>
        __putc('\n');
    800041e4:	00a00513          	li	a0,10
    800041e8:	00003097          	auipc	ra,0x3
    800041ec:	8b4080e7          	jalr	-1868(ra) # 80006a9c <__putc>
        __putc('E');
    800041f0:	04500513          	li	a0,69
    800041f4:	00003097          	auipc	ra,0x3
    800041f8:	8a8080e7          	jalr	-1880(ra) # 80006a9c <__putc>
        __putc('r');
    800041fc:	07200513          	li	a0,114
    80004200:	00003097          	auipc	ra,0x3
    80004204:	89c080e7          	jalr	-1892(ra) # 80006a9c <__putc>
        __putc('r');
    80004208:	07200513          	li	a0,114
    8000420c:	00003097          	auipc	ra,0x3
    80004210:	890080e7          	jalr	-1904(ra) # 80006a9c <__putc>
        __putc('o');
    80004214:	06f00513          	li	a0,111
    80004218:	00003097          	auipc	ra,0x3
    8000421c:	884080e7          	jalr	-1916(ra) # 80006a9c <__putc>
        __putc('r');
    80004220:	07200513          	li	a0,114
    80004224:	00003097          	auipc	ra,0x3
    80004228:	878080e7          	jalr	-1928(ra) # 80006a9c <__putc>
        __putc(':');
    8000422c:	03a00513          	li	a0,58
    80004230:	00003097          	auipc	ra,0x3
    80004234:	86c080e7          	jalr	-1940(ra) # 80006a9c <__putc>
        __putc(' ');
    80004238:	02000513          	li	a0,32
    8000423c:	00003097          	auipc	ra,0x3
    80004240:	860080e7          	jalr	-1952(ra) # 80006a9c <__putc>
        __putc('i');
    80004244:	06900513          	li	a0,105
    80004248:	00003097          	auipc	ra,0x3
    8000424c:	854080e7          	jalr	-1964(ra) # 80006a9c <__putc>
        __putc('l');
    80004250:	06c00513          	li	a0,108
    80004254:	00003097          	auipc	ra,0x3
    80004258:	848080e7          	jalr	-1976(ra) # 80006a9c <__putc>
        __putc('l');
    8000425c:	06c00513          	li	a0,108
    80004260:	00003097          	auipc	ra,0x3
    80004264:	83c080e7          	jalr	-1988(ra) # 80006a9c <__putc>
        __putc('e');
    80004268:	06500513          	li	a0,101
    8000426c:	00003097          	auipc	ra,0x3
    80004270:	830080e7          	jalr	-2000(ra) # 80006a9c <__putc>
        __putc('g');
    80004274:	06700513          	li	a0,103
    80004278:	00003097          	auipc	ra,0x3
    8000427c:	824080e7          	jalr	-2012(ra) # 80006a9c <__putc>
        __putc('a');
    80004280:	06100513          	li	a0,97
    80004284:	00003097          	auipc	ra,0x3
    80004288:	818080e7          	jalr	-2024(ra) # 80006a9c <__putc>
        __putc('l');
    8000428c:	06c00513          	li	a0,108
    80004290:	00003097          	auipc	ra,0x3
    80004294:	80c080e7          	jalr	-2036(ra) # 80006a9c <__putc>
        __putc(' ');
    80004298:	02000513          	li	a0,32
    8000429c:	00003097          	auipc	ra,0x3
    800042a0:	800080e7          	jalr	-2048(ra) # 80006a9c <__putc>
        __putc('r');
    800042a4:	07200513          	li	a0,114
    800042a8:	00002097          	auipc	ra,0x2
    800042ac:	7f4080e7          	jalr	2036(ra) # 80006a9c <__putc>
        __putc('e');
    800042b0:	06500513          	li	a0,101
    800042b4:	00002097          	auipc	ra,0x2
    800042b8:	7e8080e7          	jalr	2024(ra) # 80006a9c <__putc>
        __putc('a');
    800042bc:	06100513          	li	a0,97
    800042c0:	00002097          	auipc	ra,0x2
    800042c4:	7dc080e7          	jalr	2012(ra) # 80006a9c <__putc>
        __putc('d');
    800042c8:	06400513          	li	a0,100
    800042cc:	00002097          	auipc	ra,0x2
    800042d0:	7d0080e7          	jalr	2000(ra) # 80006a9c <__putc>
        __putc('!');
    800042d4:	02100513          	li	a0,33
    800042d8:	00002097          	auipc	ra,0x2
    800042dc:	7c4080e7          	jalr	1988(ra) # 80006a9c <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    800042e0:	14102973          	csrr	s2,sepc
        __putc('\n');
    800042e4:	00a00513          	li	a0,10
    800042e8:	00002097          	auipc	ra,0x2
    800042ec:	7b4080e7          	jalr	1972(ra) # 80006a9c <__putc>
        __putc('P');
    800042f0:	05000513          	li	a0,80
    800042f4:	00002097          	auipc	ra,0x2
    800042f8:	7a8080e7          	jalr	1960(ra) # 80006a9c <__putc>
        __putc('C');
    800042fc:	04300513          	li	a0,67
    80004300:	00002097          	auipc	ra,0x2
    80004304:	79c080e7          	jalr	1948(ra) # 80006a9c <__putc>
        __putc(':');
    80004308:	03a00513          	li	a0,58
    8000430c:	00002097          	auipc	ra,0x2
    80004310:	790080e7          	jalr	1936(ra) # 80006a9c <__putc>
        __putc(' ');
    80004314:	02000513          	li	a0,32
    80004318:	00002097          	auipc	ra,0x2
    8000431c:	784080e7          	jalr	1924(ra) # 80006a9c <__putc>
        __putc('0');
    80004320:	03000513          	li	a0,48
    80004324:	00002097          	auipc	ra,0x2
    80004328:	778080e7          	jalr	1912(ra) # 80006a9c <__putc>
        __putc('x');
    8000432c:	07800513          	li	a0,120
    80004330:	00002097          	auipc	ra,0x2
    80004334:	76c080e7          	jalr	1900(ra) # 80006a9c <__putc>
        for(int i = 15; i >= 0; i--){
    80004338:	00f00493          	li	s1,15
    8000433c:	0140006f          	j	80004350 <exceptionHandler+0x3e0>
                __putc('A' + tmp - 10);
    80004340:	03750513          	addi	a0,a0,55
    80004344:	00002097          	auipc	ra,0x2
    80004348:	758080e7          	jalr	1880(ra) # 80006a9c <__putc>
        for(int i = 15; i >= 0; i--){
    8000434c:	fff4849b          	addiw	s1,s1,-1
    80004350:	0204c463          	bltz	s1,80004378 <exceptionHandler+0x408>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    80004354:	0024951b          	slliw	a0,s1,0x2
    80004358:	00a95533          	srl	a0,s2,a0
    8000435c:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004360:	00900793          	li	a5,9
    80004364:	fca7eee3          	bltu	a5,a0,80004340 <exceptionHandler+0x3d0>
                __putc('0' + tmp);
    80004368:	03050513          	addi	a0,a0,48
    8000436c:	00002097          	auipc	ra,0x2
    80004370:	730080e7          	jalr	1840(ra) # 80006a9c <__putc>
    80004374:	fd9ff06f          	j	8000434c <exceptionHandler+0x3dc>
        assert(false);
    80004378:	00003697          	auipc	a3,0x3
    8000437c:	f1868693          	addi	a3,a3,-232 # 80007290 <CONSOLE_STATUS+0x280>
    80004380:	08600613          	li	a2,134
    80004384:	00003597          	auipc	a1,0x3
    80004388:	f2458593          	addi	a1,a1,-220 # 800072a8 <CONSOLE_STATUS+0x298>
    8000438c:	00003517          	auipc	a0,0x3
    80004390:	f3c50513          	addi	a0,a0,-196 # 800072c8 <CONSOLE_STATUS+0x2b8>
    80004394:	ffffd097          	auipc	ra,0xffffd
    80004398:	514080e7          	jalr	1300(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    8000439c:	ce5ff06f          	j	80004080 <exceptionHandler+0x110>
        __putc('\n');
    800043a0:	00a00513          	li	a0,10
    800043a4:	00002097          	auipc	ra,0x2
    800043a8:	6f8080e7          	jalr	1784(ra) # 80006a9c <__putc>
        __putc('E');
    800043ac:	04500513          	li	a0,69
    800043b0:	00002097          	auipc	ra,0x2
    800043b4:	6ec080e7          	jalr	1772(ra) # 80006a9c <__putc>
        __putc('r');
    800043b8:	07200513          	li	a0,114
    800043bc:	00002097          	auipc	ra,0x2
    800043c0:	6e0080e7          	jalr	1760(ra) # 80006a9c <__putc>
        __putc('r');
    800043c4:	07200513          	li	a0,114
    800043c8:	00002097          	auipc	ra,0x2
    800043cc:	6d4080e7          	jalr	1748(ra) # 80006a9c <__putc>
        __putc('o');
    800043d0:	06f00513          	li	a0,111
    800043d4:	00002097          	auipc	ra,0x2
    800043d8:	6c8080e7          	jalr	1736(ra) # 80006a9c <__putc>
        __putc('r');
    800043dc:	07200513          	li	a0,114
    800043e0:	00002097          	auipc	ra,0x2
    800043e4:	6bc080e7          	jalr	1724(ra) # 80006a9c <__putc>
        __putc(':');
    800043e8:	03a00513          	li	a0,58
    800043ec:	00002097          	auipc	ra,0x2
    800043f0:	6b0080e7          	jalr	1712(ra) # 80006a9c <__putc>
        __putc(' ');
    800043f4:	02000513          	li	a0,32
    800043f8:	00002097          	auipc	ra,0x2
    800043fc:	6a4080e7          	jalr	1700(ra) # 80006a9c <__putc>
        __putc('i');
    80004400:	06900513          	li	a0,105
    80004404:	00002097          	auipc	ra,0x2
    80004408:	698080e7          	jalr	1688(ra) # 80006a9c <__putc>
        __putc('l');
    8000440c:	06c00513          	li	a0,108
    80004410:	00002097          	auipc	ra,0x2
    80004414:	68c080e7          	jalr	1676(ra) # 80006a9c <__putc>
        __putc('l');
    80004418:	06c00513          	li	a0,108
    8000441c:	00002097          	auipc	ra,0x2
    80004420:	680080e7          	jalr	1664(ra) # 80006a9c <__putc>
        __putc('e');
    80004424:	06500513          	li	a0,101
    80004428:	00002097          	auipc	ra,0x2
    8000442c:	674080e7          	jalr	1652(ra) # 80006a9c <__putc>
        __putc('g');
    80004430:	06700513          	li	a0,103
    80004434:	00002097          	auipc	ra,0x2
    80004438:	668080e7          	jalr	1640(ra) # 80006a9c <__putc>
        __putc('a');
    8000443c:	06100513          	li	a0,97
    80004440:	00002097          	auipc	ra,0x2
    80004444:	65c080e7          	jalr	1628(ra) # 80006a9c <__putc>
        __putc('l');
    80004448:	06c00513          	li	a0,108
    8000444c:	00002097          	auipc	ra,0x2
    80004450:	650080e7          	jalr	1616(ra) # 80006a9c <__putc>
        __putc(' ');
    80004454:	02000513          	li	a0,32
    80004458:	00002097          	auipc	ra,0x2
    8000445c:	644080e7          	jalr	1604(ra) # 80006a9c <__putc>
        __putc('w');
    80004460:	07700513          	li	a0,119
    80004464:	00002097          	auipc	ra,0x2
    80004468:	638080e7          	jalr	1592(ra) # 80006a9c <__putc>
        __putc('r');
    8000446c:	07200513          	li	a0,114
    80004470:	00002097          	auipc	ra,0x2
    80004474:	62c080e7          	jalr	1580(ra) # 80006a9c <__putc>
        __putc('i');
    80004478:	06900513          	li	a0,105
    8000447c:	00002097          	auipc	ra,0x2
    80004480:	620080e7          	jalr	1568(ra) # 80006a9c <__putc>
        __putc('t');
    80004484:	07400513          	li	a0,116
    80004488:	00002097          	auipc	ra,0x2
    8000448c:	614080e7          	jalr	1556(ra) # 80006a9c <__putc>
        __putc('e');
    80004490:	06500513          	li	a0,101
    80004494:	00002097          	auipc	ra,0x2
    80004498:	608080e7          	jalr	1544(ra) # 80006a9c <__putc>
        __putc('!');
    8000449c:	02100513          	li	a0,33
    800044a0:	00002097          	auipc	ra,0x2
    800044a4:	5fc080e7          	jalr	1532(ra) # 80006a9c <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    800044a8:	14102973          	csrr	s2,sepc
        __putc('\n');
    800044ac:	00a00513          	li	a0,10
    800044b0:	00002097          	auipc	ra,0x2
    800044b4:	5ec080e7          	jalr	1516(ra) # 80006a9c <__putc>
        __putc('P');
    800044b8:	05000513          	li	a0,80
    800044bc:	00002097          	auipc	ra,0x2
    800044c0:	5e0080e7          	jalr	1504(ra) # 80006a9c <__putc>
        __putc('C');
    800044c4:	04300513          	li	a0,67
    800044c8:	00002097          	auipc	ra,0x2
    800044cc:	5d4080e7          	jalr	1492(ra) # 80006a9c <__putc>
        __putc(':');
    800044d0:	03a00513          	li	a0,58
    800044d4:	00002097          	auipc	ra,0x2
    800044d8:	5c8080e7          	jalr	1480(ra) # 80006a9c <__putc>
        __putc(' ');
    800044dc:	02000513          	li	a0,32
    800044e0:	00002097          	auipc	ra,0x2
    800044e4:	5bc080e7          	jalr	1468(ra) # 80006a9c <__putc>
        __putc('0');
    800044e8:	03000513          	li	a0,48
    800044ec:	00002097          	auipc	ra,0x2
    800044f0:	5b0080e7          	jalr	1456(ra) # 80006a9c <__putc>
        __putc('x');
    800044f4:	07800513          	li	a0,120
    800044f8:	00002097          	auipc	ra,0x2
    800044fc:	5a4080e7          	jalr	1444(ra) # 80006a9c <__putc>
        for(int i = 15; i >= 0; i--){
    80004500:	00f00493          	li	s1,15
    80004504:	0140006f          	j	80004518 <exceptionHandler+0x5a8>
                __putc('A' + tmp - 10);
    80004508:	03750513          	addi	a0,a0,55
    8000450c:	00002097          	auipc	ra,0x2
    80004510:	590080e7          	jalr	1424(ra) # 80006a9c <__putc>
        for(int i = 15; i >= 0; i--){
    80004514:	fff4849b          	addiw	s1,s1,-1
    80004518:	0204c463          	bltz	s1,80004540 <exceptionHandler+0x5d0>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    8000451c:	0024951b          	slliw	a0,s1,0x2
    80004520:	00a95533          	srl	a0,s2,a0
    80004524:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004528:	00900793          	li	a5,9
    8000452c:	fca7eee3          	bltu	a5,a0,80004508 <exceptionHandler+0x598>
                __putc('0' + tmp);
    80004530:	03050513          	addi	a0,a0,48
    80004534:	00002097          	auipc	ra,0x2
    80004538:	568080e7          	jalr	1384(ra) # 80006a9c <__putc>
    8000453c:	fd9ff06f          	j	80004514 <exceptionHandler+0x5a4>
        assert(false);
    80004540:	00003697          	auipc	a3,0x3
    80004544:	d5068693          	addi	a3,a3,-688 # 80007290 <CONSOLE_STATUS+0x280>
    80004548:	0b000613          	li	a2,176
    8000454c:	00003597          	auipc	a1,0x3
    80004550:	d5c58593          	addi	a1,a1,-676 # 800072a8 <CONSOLE_STATUS+0x298>
    80004554:	00003517          	auipc	a0,0x3
    80004558:	d7450513          	addi	a0,a0,-652 # 800072c8 <CONSOLE_STATUS+0x2b8>
    8000455c:	ffffd097          	auipc	ra,0xffffd
    80004560:	34c080e7          	jalr	844(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80004564:	b1dff06f          	j	80004080 <exceptionHandler+0x110>
        Timer::getInstance().tick();
    80004568:	ffffd097          	auipc	ra,0xffffd
    8000456c:	c30080e7          	jalr	-976(ra) # 80001198 <_ZN5Timer11getInstanceEv>
    80004570:	ffffd097          	auipc	ra,0xffffd
    80004574:	c8c080e7          	jalr	-884(ra) # 800011fc <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    80004578:	00004797          	auipc	a5,0x4
    8000457c:	b887b783          	ld	a5,-1144(a5) # 80008100 <_GLOBAL_OFFSET_TABLE_+0x38>
    80004580:	0007b503          	ld	a0,0(a5)
    80004584:	ffffe097          	auipc	ra,0xffffe
    80004588:	384080e7          	jalr	900(ra) # 80002908 <_ZN7_thread4tickEv>
    8000458c:	00051c63          	bnez	a0,800045a4 <exceptionHandler+0x634>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80004590:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004594:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80004598:	00200793          	li	a5,2
    8000459c:	1447b073          	csrc	sip,a5
    800045a0:	ae1ff06f          	j	80004080 <exceptionHandler+0x110>
        assert(_thread::currentThread->tick() == 0);
    800045a4:	00003697          	auipc	a3,0x3
    800045a8:	cec68693          	addi	a3,a3,-788 # 80007290 <CONSOLE_STATUS+0x280>
    800045ac:	0b400613          	li	a2,180
    800045b0:	00003597          	auipc	a1,0x3
    800045b4:	cf858593          	addi	a1,a1,-776 # 800072a8 <CONSOLE_STATUS+0x298>
    800045b8:	00003517          	auipc	a0,0x3
    800045bc:	d1850513          	addi	a0,a0,-744 # 800072d0 <CONSOLE_STATUS+0x2c0>
    800045c0:	ffffd097          	auipc	ra,0xffffd
    800045c4:	2e8080e7          	jalr	744(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    800045c8:	fc9ff06f          	j	80004590 <exceptionHandler+0x620>

00000000800045cc <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    800045cc:	fe010113          	addi	sp,sp,-32
    800045d0:	00113c23          	sd	ra,24(sp)
    800045d4:	00813823          	sd	s0,16(sp)
    800045d8:	00913423          	sd	s1,8(sp)
    800045dc:	02010413          	addi	s0,sp,32
    800045e0:	00050493          	mv	s1,a0
    assert(singleton == 0);
    800045e4:	00004797          	auipc	a5,0x4
    800045e8:	b9c7b783          	ld	a5,-1124(a5) # 80008180 <_ZN9Scheduler9singletonE>
    800045ec:	02079463          	bnez	a5,80004614 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    800045f0:	00004797          	auipc	a5,0x4
    800045f4:	b897b823          	sd	s1,-1136(a5) # 80008180 <_ZN9Scheduler9singletonE>
    head = 0;
    800045f8:	0004b023          	sd	zero,0(s1)
    tail = 0;
    800045fc:	0004b423          	sd	zero,8(s1)
}
    80004600:	01813083          	ld	ra,24(sp)
    80004604:	01013403          	ld	s0,16(sp)
    80004608:	00813483          	ld	s1,8(sp)
    8000460c:	02010113          	addi	sp,sp,32
    80004610:	00008067          	ret
    assert(singleton == 0);
    80004614:	00003697          	auipc	a3,0x3
    80004618:	dec68693          	addi	a3,a3,-532 # 80007400 <CONSOLE_STATUS+0x3f0>
    8000461c:	01800613          	li	a2,24
    80004620:	00003597          	auipc	a1,0x3
    80004624:	df858593          	addi	a1,a1,-520 # 80007418 <CONSOLE_STATUS+0x408>
    80004628:	00003517          	auipc	a0,0x3
    8000462c:	e0050513          	addi	a0,a0,-512 # 80007428 <CONSOLE_STATUS+0x418>
    80004630:	ffffd097          	auipc	ra,0xffffd
    80004634:	278080e7          	jalr	632(ra) # 800018a8 <_Z13assert_failedPKcS0_jS0_>
    80004638:	fb9ff06f          	j	800045f0 <_ZN9SchedulerC1Ev+0x24>

000000008000463c <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    8000463c:	ff010113          	addi	sp,sp,-16
    80004640:	00813423          	sd	s0,8(sp)
    80004644:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80004648:	00004797          	auipc	a5,0x4
    8000464c:	b387b783          	ld	a5,-1224(a5) # 80008180 <_ZN9Scheduler9singletonE>
    80004650:	0007b503          	ld	a0,0(a5)
}
    80004654:	00153513          	seqz	a0,a0
    80004658:	00813403          	ld	s0,8(sp)
    8000465c:	01010113          	addi	sp,sp,16
    80004660:	00008067          	ret

0000000080004664 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80004664:	fe010113          	addi	sp,sp,-32
    80004668:	00113c23          	sd	ra,24(sp)
    8000466c:	00813823          	sd	s0,16(sp)
    80004670:	00913423          	sd	s1,8(sp)
    80004674:	01213023          	sd	s2,0(sp)
    80004678:	02010413          	addi	s0,sp,32
    8000467c:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80004680:	00004917          	auipc	s2,0x4
    80004684:	b0093903          	ld	s2,-1280(s2) # 80008180 <_ZN9Scheduler9singletonE>
    80004688:	00093783          	ld	a5,0(s2)
    8000468c:	12078c63          	beqz	a5,800047c4 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80004690:	00893903          	ld	s2,8(s2)
    80004694:	01000513          	li	a0,16
    80004698:	ffffd097          	auipc	ra,0xffffd
    8000469c:	d1c080e7          	jalr	-740(ra) # 800013b4 <_Z9mem_allocm>
    800046a0:	00a90423          	sb	a0,8(s2)
    800046a4:	00855793          	srli	a5,a0,0x8
    800046a8:	00f904a3          	sb	a5,9(s2)
    800046ac:	01055793          	srli	a5,a0,0x10
    800046b0:	00f90523          	sb	a5,10(s2)
    800046b4:	0185579b          	srliw	a5,a0,0x18
    800046b8:	00f905a3          	sb	a5,11(s2)
    800046bc:	02055793          	srli	a5,a0,0x20
    800046c0:	00f90623          	sb	a5,12(s2)
    800046c4:	02855793          	srli	a5,a0,0x28
    800046c8:	00f906a3          	sb	a5,13(s2)
    800046cc:	03055793          	srli	a5,a0,0x30
    800046d0:	00f90723          	sb	a5,14(s2)
    800046d4:	03855513          	srli	a0,a0,0x38
    800046d8:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    800046dc:	00004617          	auipc	a2,0x4
    800046e0:	aa460613          	addi	a2,a2,-1372 # 80008180 <_ZN9Scheduler9singletonE>
    800046e4:	00063583          	ld	a1,0(a2)
    800046e8:	0085b703          	ld	a4,8(a1)
    800046ec:	00874783          	lbu	a5,8(a4)
    800046f0:	00974683          	lbu	a3,9(a4)
    800046f4:	00869693          	slli	a3,a3,0x8
    800046f8:	00f6e6b3          	or	a3,a3,a5
    800046fc:	00a74783          	lbu	a5,10(a4)
    80004700:	01079793          	slli	a5,a5,0x10
    80004704:	00d7e6b3          	or	a3,a5,a3
    80004708:	00b74783          	lbu	a5,11(a4)
    8000470c:	01879793          	slli	a5,a5,0x18
    80004710:	00d7e7b3          	or	a5,a5,a3
    80004714:	00c74683          	lbu	a3,12(a4)
    80004718:	02069693          	slli	a3,a3,0x20
    8000471c:	00f6e7b3          	or	a5,a3,a5
    80004720:	00d74683          	lbu	a3,13(a4)
    80004724:	02869693          	slli	a3,a3,0x28
    80004728:	00f6e6b3          	or	a3,a3,a5
    8000472c:	00e74783          	lbu	a5,14(a4)
    80004730:	03079793          	slli	a5,a5,0x30
    80004734:	00d7e6b3          	or	a3,a5,a3
    80004738:	00f74783          	lbu	a5,15(a4)
    8000473c:	03879793          	slli	a5,a5,0x38
    80004740:	00d7e7b3          	or	a5,a5,a3
    80004744:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80004748:	00978023          	sb	s1,0(a5)
    8000474c:	0084d713          	srli	a4,s1,0x8
    80004750:	00e780a3          	sb	a4,1(a5)
    80004754:	0104d713          	srli	a4,s1,0x10
    80004758:	00e78123          	sb	a4,2(a5)
    8000475c:	0184d71b          	srliw	a4,s1,0x18
    80004760:	00e781a3          	sb	a4,3(a5)
    80004764:	0204d713          	srli	a4,s1,0x20
    80004768:	00e78223          	sb	a4,4(a5)
    8000476c:	0284d713          	srli	a4,s1,0x28
    80004770:	00e782a3          	sb	a4,5(a5)
    80004774:	0304d713          	srli	a4,s1,0x30
    80004778:	00e78323          	sb	a4,6(a5)
    8000477c:	0384d493          	srli	s1,s1,0x38
    80004780:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80004784:	00063783          	ld	a5,0(a2)
    80004788:	0087b783          	ld	a5,8(a5)
    8000478c:	00078423          	sb	zero,8(a5)
    80004790:	000784a3          	sb	zero,9(a5)
    80004794:	00078523          	sb	zero,10(a5)
    80004798:	000785a3          	sb	zero,11(a5)
    8000479c:	00078623          	sb	zero,12(a5)
    800047a0:	000786a3          	sb	zero,13(a5)
    800047a4:	00078723          	sb	zero,14(a5)
    800047a8:	000787a3          	sb	zero,15(a5)
    }
}
    800047ac:	01813083          	ld	ra,24(sp)
    800047b0:	01013403          	ld	s0,16(sp)
    800047b4:	00813483          	ld	s1,8(sp)
    800047b8:	00013903          	ld	s2,0(sp)
    800047bc:	02010113          	addi	sp,sp,32
    800047c0:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    800047c4:	01000513          	li	a0,16
    800047c8:	ffffd097          	auipc	ra,0xffffd
    800047cc:	bec080e7          	jalr	-1044(ra) # 800013b4 <_Z9mem_allocm>
    800047d0:	00a93423          	sd	a0,8(s2)
    800047d4:	00004717          	auipc	a4,0x4
    800047d8:	9ac70713          	addi	a4,a4,-1620 # 80008180 <_ZN9Scheduler9singletonE>
    800047dc:	00073783          	ld	a5,0(a4)
    800047e0:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    800047e4:	00073783          	ld	a5,0(a4)
    800047e8:	0007b783          	ld	a5,0(a5)
    800047ec:	00978023          	sb	s1,0(a5)
    800047f0:	0084d693          	srli	a3,s1,0x8
    800047f4:	00d780a3          	sb	a3,1(a5)
    800047f8:	0104d693          	srli	a3,s1,0x10
    800047fc:	00d78123          	sb	a3,2(a5)
    80004800:	0184d69b          	srliw	a3,s1,0x18
    80004804:	00d781a3          	sb	a3,3(a5)
    80004808:	0204d693          	srli	a3,s1,0x20
    8000480c:	00d78223          	sb	a3,4(a5)
    80004810:	0284d693          	srli	a3,s1,0x28
    80004814:	00d782a3          	sb	a3,5(a5)
    80004818:	0304d693          	srli	a3,s1,0x30
    8000481c:	00d78323          	sb	a3,6(a5)
    80004820:	0384d493          	srli	s1,s1,0x38
    80004824:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80004828:	00073783          	ld	a5,0(a4)
    8000482c:	0007b783          	ld	a5,0(a5)
    80004830:	00078423          	sb	zero,8(a5)
    80004834:	000784a3          	sb	zero,9(a5)
    80004838:	00078523          	sb	zero,10(a5)
    8000483c:	000785a3          	sb	zero,11(a5)
    80004840:	00078623          	sb	zero,12(a5)
    80004844:	000786a3          	sb	zero,13(a5)
    80004848:	00078723          	sb	zero,14(a5)
    8000484c:	000787a3          	sb	zero,15(a5)
    80004850:	f5dff06f          	j	800047ac <_ZN9Scheduler3putEP7_thread+0x148>

0000000080004854 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80004854:	ff010113          	addi	sp,sp,-16
    80004858:	00813423          	sd	s0,8(sp)
    8000485c:	01010413          	addi	s0,sp,16
    ThreadList* tmp = singleton->head;
    80004860:	00004617          	auipc	a2,0x4
    80004864:	92063603          	ld	a2,-1760(a2) # 80008180 <_ZN9Scheduler9singletonE>
    80004868:	00063783          	ld	a5,0(a2)
    if(tmp == 0){
    8000486c:	0c078e63          	beqz	a5,80004948 <_ZN9Scheduler3getEv+0xf4>
        return 0;
    }
    thread_t thread = tmp->thread;
    80004870:	0007c503          	lbu	a0,0(a5)
    80004874:	0017c703          	lbu	a4,1(a5)
    80004878:	00871713          	slli	a4,a4,0x8
    8000487c:	00a76733          	or	a4,a4,a0
    80004880:	0027c503          	lbu	a0,2(a5)
    80004884:	01051513          	slli	a0,a0,0x10
    80004888:	00e56733          	or	a4,a0,a4
    8000488c:	0037c503          	lbu	a0,3(a5)
    80004890:	01851513          	slli	a0,a0,0x18
    80004894:	00e56533          	or	a0,a0,a4
    80004898:	0047c703          	lbu	a4,4(a5)
    8000489c:	02071713          	slli	a4,a4,0x20
    800048a0:	00a76533          	or	a0,a4,a0
    800048a4:	0057c703          	lbu	a4,5(a5)
    800048a8:	02871713          	slli	a4,a4,0x28
    800048ac:	00a76733          	or	a4,a4,a0
    800048b0:	0067c503          	lbu	a0,6(a5)
    800048b4:	03051513          	slli	a0,a0,0x30
    800048b8:	00e56733          	or	a4,a0,a4
    800048bc:	0077c503          	lbu	a0,7(a5)
    800048c0:	03851513          	slli	a0,a0,0x38
    800048c4:	00e56533          	or	a0,a0,a4
    singleton->head = tmp->next;
    800048c8:	0087c683          	lbu	a3,8(a5)
    800048cc:	0097c703          	lbu	a4,9(a5)
    800048d0:	00871713          	slli	a4,a4,0x8
    800048d4:	00d766b3          	or	a3,a4,a3
    800048d8:	00a7c703          	lbu	a4,10(a5)
    800048dc:	01071713          	slli	a4,a4,0x10
    800048e0:	00d76733          	or	a4,a4,a3
    800048e4:	00b7c683          	lbu	a3,11(a5)
    800048e8:	01869693          	slli	a3,a3,0x18
    800048ec:	00e6e733          	or	a4,a3,a4
    800048f0:	00c7c683          	lbu	a3,12(a5)
    800048f4:	02069693          	slli	a3,a3,0x20
    800048f8:	00e6e6b3          	or	a3,a3,a4
    800048fc:	00d7c703          	lbu	a4,13(a5)
    80004900:	02871713          	slli	a4,a4,0x28
    80004904:	00d766b3          	or	a3,a4,a3
    80004908:	00e7c703          	lbu	a4,14(a5)
    8000490c:	03071713          	slli	a4,a4,0x30
    80004910:	00d76733          	or	a4,a4,a3
    80004914:	00f7c783          	lbu	a5,15(a5)
    80004918:	03879793          	slli	a5,a5,0x38
    8000491c:	00e7e7b3          	or	a5,a5,a4
    80004920:	00f63023          	sd	a5,0(a2)
    if(singleton->head == 0){
    80004924:	00004797          	auipc	a5,0x4
    80004928:	85c7b783          	ld	a5,-1956(a5) # 80008180 <_ZN9Scheduler9singletonE>
    8000492c:	0007b703          	ld	a4,0(a5)
    80004930:	00070863          	beqz	a4,80004940 <_ZN9Scheduler3getEv+0xec>
        singleton->tail = 0;
    }
    // mem_free(tmp); THIS ONE BREAKS CAUSES ILLEGAL READS???
    return thread;
}
    80004934:	00813403          	ld	s0,8(sp)
    80004938:	01010113          	addi	sp,sp,16
    8000493c:	00008067          	ret
        singleton->tail = 0;
    80004940:	0007b423          	sd	zero,8(a5)
    80004944:	ff1ff06f          	j	80004934 <_ZN9Scheduler3getEv+0xe0>
        return 0;
    80004948:	00078513          	mv	a0,a5
    8000494c:	fe9ff06f          	j	80004934 <_ZN9Scheduler3getEv+0xe0>

0000000080004950 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80004950:	ff010113          	addi	sp,sp,-16
    80004954:	00813423          	sd	s0,8(sp)
    80004958:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    8000495c:	00004797          	auipc	a5,0x4
    80004960:	8247b783          	ld	a5,-2012(a5) # 80008180 <_ZN9Scheduler9singletonE>
    80004964:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80004968:	00000513          	li	a0,0
    while(tmp != 0){
    8000496c:	06078263          	beqz	a5,800049d0 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80004970:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80004974:	0087c683          	lbu	a3,8(a5)
    80004978:	0097c703          	lbu	a4,9(a5)
    8000497c:	00871713          	slli	a4,a4,0x8
    80004980:	00d766b3          	or	a3,a4,a3
    80004984:	00a7c703          	lbu	a4,10(a5)
    80004988:	01071713          	slli	a4,a4,0x10
    8000498c:	00d76733          	or	a4,a4,a3
    80004990:	00b7c683          	lbu	a3,11(a5)
    80004994:	01869693          	slli	a3,a3,0x18
    80004998:	00e6e733          	or	a4,a3,a4
    8000499c:	00c7c683          	lbu	a3,12(a5)
    800049a0:	02069693          	slli	a3,a3,0x20
    800049a4:	00e6e6b3          	or	a3,a3,a4
    800049a8:	00d7c703          	lbu	a4,13(a5)
    800049ac:	02871713          	slli	a4,a4,0x28
    800049b0:	00d766b3          	or	a3,a4,a3
    800049b4:	00e7c703          	lbu	a4,14(a5)
    800049b8:	03071713          	slli	a4,a4,0x30
    800049bc:	00d76733          	or	a4,a4,a3
    800049c0:	00f7c783          	lbu	a5,15(a5)
    800049c4:	03879793          	slli	a5,a5,0x38
    800049c8:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    800049cc:	fa1ff06f          	j	8000496c <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    800049d0:	00813403          	ld	s0,8(sp)
    800049d4:	01010113          	addi	sp,sp,16
    800049d8:	00008067          	ret

00000000800049dc <start>:
    800049dc:	ff010113          	addi	sp,sp,-16
    800049e0:	00813423          	sd	s0,8(sp)
    800049e4:	01010413          	addi	s0,sp,16
    800049e8:	300027f3          	csrr	a5,mstatus
    800049ec:	ffffe737          	lui	a4,0xffffe
    800049f0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff540f>
    800049f4:	00e7f7b3          	and	a5,a5,a4
    800049f8:	00001737          	lui	a4,0x1
    800049fc:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004a00:	00e7e7b3          	or	a5,a5,a4
    80004a04:	30079073          	csrw	mstatus,a5
    80004a08:	00000797          	auipc	a5,0x0
    80004a0c:	16078793          	addi	a5,a5,352 # 80004b68 <system_main>
    80004a10:	34179073          	csrw	mepc,a5
    80004a14:	00000793          	li	a5,0
    80004a18:	18079073          	csrw	satp,a5
    80004a1c:	000107b7          	lui	a5,0x10
    80004a20:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80004a24:	30279073          	csrw	medeleg,a5
    80004a28:	30379073          	csrw	mideleg,a5
    80004a2c:	104027f3          	csrr	a5,sie
    80004a30:	2227e793          	ori	a5,a5,546
    80004a34:	10479073          	csrw	sie,a5
    80004a38:	fff00793          	li	a5,-1
    80004a3c:	00a7d793          	srli	a5,a5,0xa
    80004a40:	3b079073          	csrw	pmpaddr0,a5
    80004a44:	00f00793          	li	a5,15
    80004a48:	3a079073          	csrw	pmpcfg0,a5
    80004a4c:	f14027f3          	csrr	a5,mhartid
    80004a50:	0200c737          	lui	a4,0x200c
    80004a54:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004a58:	0007869b          	sext.w	a3,a5
    80004a5c:	00269713          	slli	a4,a3,0x2
    80004a60:	000f4637          	lui	a2,0xf4
    80004a64:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004a68:	00d70733          	add	a4,a4,a3
    80004a6c:	0037979b          	slliw	a5,a5,0x3
    80004a70:	020046b7          	lui	a3,0x2004
    80004a74:	00d787b3          	add	a5,a5,a3
    80004a78:	00c585b3          	add	a1,a1,a2
    80004a7c:	00371693          	slli	a3,a4,0x3
    80004a80:	00003717          	auipc	a4,0x3
    80004a84:	71070713          	addi	a4,a4,1808 # 80008190 <timer_scratch>
    80004a88:	00b7b023          	sd	a1,0(a5)
    80004a8c:	00d70733          	add	a4,a4,a3
    80004a90:	00f73c23          	sd	a5,24(a4)
    80004a94:	02c73023          	sd	a2,32(a4)
    80004a98:	34071073          	csrw	mscratch,a4
    80004a9c:	00000797          	auipc	a5,0x0
    80004aa0:	6e478793          	addi	a5,a5,1764 # 80005180 <timervec>
    80004aa4:	30579073          	csrw	mtvec,a5
    80004aa8:	300027f3          	csrr	a5,mstatus
    80004aac:	0087e793          	ori	a5,a5,8
    80004ab0:	30079073          	csrw	mstatus,a5
    80004ab4:	304027f3          	csrr	a5,mie
    80004ab8:	0807e793          	ori	a5,a5,128
    80004abc:	30479073          	csrw	mie,a5
    80004ac0:	f14027f3          	csrr	a5,mhartid
    80004ac4:	0007879b          	sext.w	a5,a5
    80004ac8:	00078213          	mv	tp,a5
    80004acc:	30200073          	mret
    80004ad0:	00813403          	ld	s0,8(sp)
    80004ad4:	01010113          	addi	sp,sp,16
    80004ad8:	00008067          	ret

0000000080004adc <timerinit>:
    80004adc:	ff010113          	addi	sp,sp,-16
    80004ae0:	00813423          	sd	s0,8(sp)
    80004ae4:	01010413          	addi	s0,sp,16
    80004ae8:	f14027f3          	csrr	a5,mhartid
    80004aec:	0200c737          	lui	a4,0x200c
    80004af0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004af4:	0007869b          	sext.w	a3,a5
    80004af8:	00269713          	slli	a4,a3,0x2
    80004afc:	000f4637          	lui	a2,0xf4
    80004b00:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004b04:	00d70733          	add	a4,a4,a3
    80004b08:	0037979b          	slliw	a5,a5,0x3
    80004b0c:	020046b7          	lui	a3,0x2004
    80004b10:	00d787b3          	add	a5,a5,a3
    80004b14:	00c585b3          	add	a1,a1,a2
    80004b18:	00371693          	slli	a3,a4,0x3
    80004b1c:	00003717          	auipc	a4,0x3
    80004b20:	67470713          	addi	a4,a4,1652 # 80008190 <timer_scratch>
    80004b24:	00b7b023          	sd	a1,0(a5)
    80004b28:	00d70733          	add	a4,a4,a3
    80004b2c:	00f73c23          	sd	a5,24(a4)
    80004b30:	02c73023          	sd	a2,32(a4)
    80004b34:	34071073          	csrw	mscratch,a4
    80004b38:	00000797          	auipc	a5,0x0
    80004b3c:	64878793          	addi	a5,a5,1608 # 80005180 <timervec>
    80004b40:	30579073          	csrw	mtvec,a5
    80004b44:	300027f3          	csrr	a5,mstatus
    80004b48:	0087e793          	ori	a5,a5,8
    80004b4c:	30079073          	csrw	mstatus,a5
    80004b50:	304027f3          	csrr	a5,mie
    80004b54:	0807e793          	ori	a5,a5,128
    80004b58:	30479073          	csrw	mie,a5
    80004b5c:	00813403          	ld	s0,8(sp)
    80004b60:	01010113          	addi	sp,sp,16
    80004b64:	00008067          	ret

0000000080004b68 <system_main>:
    80004b68:	fe010113          	addi	sp,sp,-32
    80004b6c:	00813823          	sd	s0,16(sp)
    80004b70:	00913423          	sd	s1,8(sp)
    80004b74:	00113c23          	sd	ra,24(sp)
    80004b78:	02010413          	addi	s0,sp,32
    80004b7c:	00000097          	auipc	ra,0x0
    80004b80:	0c4080e7          	jalr	196(ra) # 80004c40 <cpuid>
    80004b84:	00003497          	auipc	s1,0x3
    80004b88:	59c48493          	addi	s1,s1,1436 # 80008120 <started>
    80004b8c:	02050263          	beqz	a0,80004bb0 <system_main+0x48>
    80004b90:	0004a783          	lw	a5,0(s1)
    80004b94:	0007879b          	sext.w	a5,a5
    80004b98:	fe078ce3          	beqz	a5,80004b90 <system_main+0x28>
    80004b9c:	0ff0000f          	fence
    80004ba0:	00003517          	auipc	a0,0x3
    80004ba4:	8c850513          	addi	a0,a0,-1848 # 80007468 <CONSOLE_STATUS+0x458>
    80004ba8:	00001097          	auipc	ra,0x1
    80004bac:	a74080e7          	jalr	-1420(ra) # 8000561c <panic>
    80004bb0:	00001097          	auipc	ra,0x1
    80004bb4:	9c8080e7          	jalr	-1592(ra) # 80005578 <consoleinit>
    80004bb8:	00001097          	auipc	ra,0x1
    80004bbc:	154080e7          	jalr	340(ra) # 80005d0c <printfinit>
    80004bc0:	00003517          	auipc	a0,0x3
    80004bc4:	98850513          	addi	a0,a0,-1656 # 80007548 <CONSOLE_STATUS+0x538>
    80004bc8:	00001097          	auipc	ra,0x1
    80004bcc:	ab0080e7          	jalr	-1360(ra) # 80005678 <__printf>
    80004bd0:	00003517          	auipc	a0,0x3
    80004bd4:	86850513          	addi	a0,a0,-1944 # 80007438 <CONSOLE_STATUS+0x428>
    80004bd8:	00001097          	auipc	ra,0x1
    80004bdc:	aa0080e7          	jalr	-1376(ra) # 80005678 <__printf>
    80004be0:	00003517          	auipc	a0,0x3
    80004be4:	96850513          	addi	a0,a0,-1688 # 80007548 <CONSOLE_STATUS+0x538>
    80004be8:	00001097          	auipc	ra,0x1
    80004bec:	a90080e7          	jalr	-1392(ra) # 80005678 <__printf>
    80004bf0:	00001097          	auipc	ra,0x1
    80004bf4:	4a8080e7          	jalr	1192(ra) # 80006098 <kinit>
    80004bf8:	00000097          	auipc	ra,0x0
    80004bfc:	148080e7          	jalr	328(ra) # 80004d40 <trapinit>
    80004c00:	00000097          	auipc	ra,0x0
    80004c04:	16c080e7          	jalr	364(ra) # 80004d6c <trapinithart>
    80004c08:	00000097          	auipc	ra,0x0
    80004c0c:	5b8080e7          	jalr	1464(ra) # 800051c0 <plicinit>
    80004c10:	00000097          	auipc	ra,0x0
    80004c14:	5d8080e7          	jalr	1496(ra) # 800051e8 <plicinithart>
    80004c18:	00000097          	auipc	ra,0x0
    80004c1c:	078080e7          	jalr	120(ra) # 80004c90 <userinit>
    80004c20:	0ff0000f          	fence
    80004c24:	00100793          	li	a5,1
    80004c28:	00003517          	auipc	a0,0x3
    80004c2c:	82850513          	addi	a0,a0,-2008 # 80007450 <CONSOLE_STATUS+0x440>
    80004c30:	00f4a023          	sw	a5,0(s1)
    80004c34:	00001097          	auipc	ra,0x1
    80004c38:	a44080e7          	jalr	-1468(ra) # 80005678 <__printf>
    80004c3c:	0000006f          	j	80004c3c <system_main+0xd4>

0000000080004c40 <cpuid>:
    80004c40:	ff010113          	addi	sp,sp,-16
    80004c44:	00813423          	sd	s0,8(sp)
    80004c48:	01010413          	addi	s0,sp,16
    80004c4c:	00020513          	mv	a0,tp
    80004c50:	00813403          	ld	s0,8(sp)
    80004c54:	0005051b          	sext.w	a0,a0
    80004c58:	01010113          	addi	sp,sp,16
    80004c5c:	00008067          	ret

0000000080004c60 <mycpu>:
    80004c60:	ff010113          	addi	sp,sp,-16
    80004c64:	00813423          	sd	s0,8(sp)
    80004c68:	01010413          	addi	s0,sp,16
    80004c6c:	00020793          	mv	a5,tp
    80004c70:	00813403          	ld	s0,8(sp)
    80004c74:	0007879b          	sext.w	a5,a5
    80004c78:	00779793          	slli	a5,a5,0x7
    80004c7c:	00004517          	auipc	a0,0x4
    80004c80:	54450513          	addi	a0,a0,1348 # 800091c0 <cpus>
    80004c84:	00f50533          	add	a0,a0,a5
    80004c88:	01010113          	addi	sp,sp,16
    80004c8c:	00008067          	ret

0000000080004c90 <userinit>:
    80004c90:	ff010113          	addi	sp,sp,-16
    80004c94:	00813423          	sd	s0,8(sp)
    80004c98:	01010413          	addi	s0,sp,16
    80004c9c:	00813403          	ld	s0,8(sp)
    80004ca0:	01010113          	addi	sp,sp,16
    80004ca4:	ffffd317          	auipc	t1,0xffffd
    80004ca8:	b4830067          	jr	-1208(t1) # 800017ec <main>

0000000080004cac <either_copyout>:
    80004cac:	ff010113          	addi	sp,sp,-16
    80004cb0:	00813023          	sd	s0,0(sp)
    80004cb4:	00113423          	sd	ra,8(sp)
    80004cb8:	01010413          	addi	s0,sp,16
    80004cbc:	02051663          	bnez	a0,80004ce8 <either_copyout+0x3c>
    80004cc0:	00058513          	mv	a0,a1
    80004cc4:	00060593          	mv	a1,a2
    80004cc8:	0006861b          	sext.w	a2,a3
    80004ccc:	00002097          	auipc	ra,0x2
    80004cd0:	c58080e7          	jalr	-936(ra) # 80006924 <__memmove>
    80004cd4:	00813083          	ld	ra,8(sp)
    80004cd8:	00013403          	ld	s0,0(sp)
    80004cdc:	00000513          	li	a0,0
    80004ce0:	01010113          	addi	sp,sp,16
    80004ce4:	00008067          	ret
    80004ce8:	00002517          	auipc	a0,0x2
    80004cec:	7a850513          	addi	a0,a0,1960 # 80007490 <CONSOLE_STATUS+0x480>
    80004cf0:	00001097          	auipc	ra,0x1
    80004cf4:	92c080e7          	jalr	-1748(ra) # 8000561c <panic>

0000000080004cf8 <either_copyin>:
    80004cf8:	ff010113          	addi	sp,sp,-16
    80004cfc:	00813023          	sd	s0,0(sp)
    80004d00:	00113423          	sd	ra,8(sp)
    80004d04:	01010413          	addi	s0,sp,16
    80004d08:	02059463          	bnez	a1,80004d30 <either_copyin+0x38>
    80004d0c:	00060593          	mv	a1,a2
    80004d10:	0006861b          	sext.w	a2,a3
    80004d14:	00002097          	auipc	ra,0x2
    80004d18:	c10080e7          	jalr	-1008(ra) # 80006924 <__memmove>
    80004d1c:	00813083          	ld	ra,8(sp)
    80004d20:	00013403          	ld	s0,0(sp)
    80004d24:	00000513          	li	a0,0
    80004d28:	01010113          	addi	sp,sp,16
    80004d2c:	00008067          	ret
    80004d30:	00002517          	auipc	a0,0x2
    80004d34:	78850513          	addi	a0,a0,1928 # 800074b8 <CONSOLE_STATUS+0x4a8>
    80004d38:	00001097          	auipc	ra,0x1
    80004d3c:	8e4080e7          	jalr	-1820(ra) # 8000561c <panic>

0000000080004d40 <trapinit>:
    80004d40:	ff010113          	addi	sp,sp,-16
    80004d44:	00813423          	sd	s0,8(sp)
    80004d48:	01010413          	addi	s0,sp,16
    80004d4c:	00813403          	ld	s0,8(sp)
    80004d50:	00002597          	auipc	a1,0x2
    80004d54:	79058593          	addi	a1,a1,1936 # 800074e0 <CONSOLE_STATUS+0x4d0>
    80004d58:	00004517          	auipc	a0,0x4
    80004d5c:	4e850513          	addi	a0,a0,1256 # 80009240 <tickslock>
    80004d60:	01010113          	addi	sp,sp,16
    80004d64:	00001317          	auipc	t1,0x1
    80004d68:	5c430067          	jr	1476(t1) # 80006328 <initlock>

0000000080004d6c <trapinithart>:
    80004d6c:	ff010113          	addi	sp,sp,-16
    80004d70:	00813423          	sd	s0,8(sp)
    80004d74:	01010413          	addi	s0,sp,16
    80004d78:	00000797          	auipc	a5,0x0
    80004d7c:	2f878793          	addi	a5,a5,760 # 80005070 <kernelvec>
    80004d80:	10579073          	csrw	stvec,a5
    80004d84:	00813403          	ld	s0,8(sp)
    80004d88:	01010113          	addi	sp,sp,16
    80004d8c:	00008067          	ret

0000000080004d90 <usertrap>:
    80004d90:	ff010113          	addi	sp,sp,-16
    80004d94:	00813423          	sd	s0,8(sp)
    80004d98:	01010413          	addi	s0,sp,16
    80004d9c:	00813403          	ld	s0,8(sp)
    80004da0:	01010113          	addi	sp,sp,16
    80004da4:	00008067          	ret

0000000080004da8 <usertrapret>:
    80004da8:	ff010113          	addi	sp,sp,-16
    80004dac:	00813423          	sd	s0,8(sp)
    80004db0:	01010413          	addi	s0,sp,16
    80004db4:	00813403          	ld	s0,8(sp)
    80004db8:	01010113          	addi	sp,sp,16
    80004dbc:	00008067          	ret

0000000080004dc0 <kerneltrap>:
    80004dc0:	fe010113          	addi	sp,sp,-32
    80004dc4:	00813823          	sd	s0,16(sp)
    80004dc8:	00113c23          	sd	ra,24(sp)
    80004dcc:	00913423          	sd	s1,8(sp)
    80004dd0:	02010413          	addi	s0,sp,32
    80004dd4:	142025f3          	csrr	a1,scause
    80004dd8:	100027f3          	csrr	a5,sstatus
    80004ddc:	0027f793          	andi	a5,a5,2
    80004de0:	10079c63          	bnez	a5,80004ef8 <kerneltrap+0x138>
    80004de4:	142027f3          	csrr	a5,scause
    80004de8:	0207ce63          	bltz	a5,80004e24 <kerneltrap+0x64>
    80004dec:	00002517          	auipc	a0,0x2
    80004df0:	73c50513          	addi	a0,a0,1852 # 80007528 <CONSOLE_STATUS+0x518>
    80004df4:	00001097          	auipc	ra,0x1
    80004df8:	884080e7          	jalr	-1916(ra) # 80005678 <__printf>
    80004dfc:	141025f3          	csrr	a1,sepc
    80004e00:	14302673          	csrr	a2,stval
    80004e04:	00002517          	auipc	a0,0x2
    80004e08:	73450513          	addi	a0,a0,1844 # 80007538 <CONSOLE_STATUS+0x528>
    80004e0c:	00001097          	auipc	ra,0x1
    80004e10:	86c080e7          	jalr	-1940(ra) # 80005678 <__printf>
    80004e14:	00002517          	auipc	a0,0x2
    80004e18:	73c50513          	addi	a0,a0,1852 # 80007550 <CONSOLE_STATUS+0x540>
    80004e1c:	00001097          	auipc	ra,0x1
    80004e20:	800080e7          	jalr	-2048(ra) # 8000561c <panic>
    80004e24:	0ff7f713          	andi	a4,a5,255
    80004e28:	00900693          	li	a3,9
    80004e2c:	04d70063          	beq	a4,a3,80004e6c <kerneltrap+0xac>
    80004e30:	fff00713          	li	a4,-1
    80004e34:	03f71713          	slli	a4,a4,0x3f
    80004e38:	00170713          	addi	a4,a4,1
    80004e3c:	fae798e3          	bne	a5,a4,80004dec <kerneltrap+0x2c>
    80004e40:	00000097          	auipc	ra,0x0
    80004e44:	e00080e7          	jalr	-512(ra) # 80004c40 <cpuid>
    80004e48:	06050663          	beqz	a0,80004eb4 <kerneltrap+0xf4>
    80004e4c:	144027f3          	csrr	a5,sip
    80004e50:	ffd7f793          	andi	a5,a5,-3
    80004e54:	14479073          	csrw	sip,a5
    80004e58:	01813083          	ld	ra,24(sp)
    80004e5c:	01013403          	ld	s0,16(sp)
    80004e60:	00813483          	ld	s1,8(sp)
    80004e64:	02010113          	addi	sp,sp,32
    80004e68:	00008067          	ret
    80004e6c:	00000097          	auipc	ra,0x0
    80004e70:	3c8080e7          	jalr	968(ra) # 80005234 <plic_claim>
    80004e74:	00a00793          	li	a5,10
    80004e78:	00050493          	mv	s1,a0
    80004e7c:	06f50863          	beq	a0,a5,80004eec <kerneltrap+0x12c>
    80004e80:	fc050ce3          	beqz	a0,80004e58 <kerneltrap+0x98>
    80004e84:	00050593          	mv	a1,a0
    80004e88:	00002517          	auipc	a0,0x2
    80004e8c:	68050513          	addi	a0,a0,1664 # 80007508 <CONSOLE_STATUS+0x4f8>
    80004e90:	00000097          	auipc	ra,0x0
    80004e94:	7e8080e7          	jalr	2024(ra) # 80005678 <__printf>
    80004e98:	01013403          	ld	s0,16(sp)
    80004e9c:	01813083          	ld	ra,24(sp)
    80004ea0:	00048513          	mv	a0,s1
    80004ea4:	00813483          	ld	s1,8(sp)
    80004ea8:	02010113          	addi	sp,sp,32
    80004eac:	00000317          	auipc	t1,0x0
    80004eb0:	3c030067          	jr	960(t1) # 8000526c <plic_complete>
    80004eb4:	00004517          	auipc	a0,0x4
    80004eb8:	38c50513          	addi	a0,a0,908 # 80009240 <tickslock>
    80004ebc:	00001097          	auipc	ra,0x1
    80004ec0:	490080e7          	jalr	1168(ra) # 8000634c <acquire>
    80004ec4:	00003717          	auipc	a4,0x3
    80004ec8:	26070713          	addi	a4,a4,608 # 80008124 <ticks>
    80004ecc:	00072783          	lw	a5,0(a4)
    80004ed0:	00004517          	auipc	a0,0x4
    80004ed4:	37050513          	addi	a0,a0,880 # 80009240 <tickslock>
    80004ed8:	0017879b          	addiw	a5,a5,1
    80004edc:	00f72023          	sw	a5,0(a4)
    80004ee0:	00001097          	auipc	ra,0x1
    80004ee4:	538080e7          	jalr	1336(ra) # 80006418 <release>
    80004ee8:	f65ff06f          	j	80004e4c <kerneltrap+0x8c>
    80004eec:	00001097          	auipc	ra,0x1
    80004ef0:	094080e7          	jalr	148(ra) # 80005f80 <uartintr>
    80004ef4:	fa5ff06f          	j	80004e98 <kerneltrap+0xd8>
    80004ef8:	00002517          	auipc	a0,0x2
    80004efc:	5f050513          	addi	a0,a0,1520 # 800074e8 <CONSOLE_STATUS+0x4d8>
    80004f00:	00000097          	auipc	ra,0x0
    80004f04:	71c080e7          	jalr	1820(ra) # 8000561c <panic>

0000000080004f08 <clockintr>:
    80004f08:	fe010113          	addi	sp,sp,-32
    80004f0c:	00813823          	sd	s0,16(sp)
    80004f10:	00913423          	sd	s1,8(sp)
    80004f14:	00113c23          	sd	ra,24(sp)
    80004f18:	02010413          	addi	s0,sp,32
    80004f1c:	00004497          	auipc	s1,0x4
    80004f20:	32448493          	addi	s1,s1,804 # 80009240 <tickslock>
    80004f24:	00048513          	mv	a0,s1
    80004f28:	00001097          	auipc	ra,0x1
    80004f2c:	424080e7          	jalr	1060(ra) # 8000634c <acquire>
    80004f30:	00003717          	auipc	a4,0x3
    80004f34:	1f470713          	addi	a4,a4,500 # 80008124 <ticks>
    80004f38:	00072783          	lw	a5,0(a4)
    80004f3c:	01013403          	ld	s0,16(sp)
    80004f40:	01813083          	ld	ra,24(sp)
    80004f44:	00048513          	mv	a0,s1
    80004f48:	0017879b          	addiw	a5,a5,1
    80004f4c:	00813483          	ld	s1,8(sp)
    80004f50:	00f72023          	sw	a5,0(a4)
    80004f54:	02010113          	addi	sp,sp,32
    80004f58:	00001317          	auipc	t1,0x1
    80004f5c:	4c030067          	jr	1216(t1) # 80006418 <release>

0000000080004f60 <devintr>:
    80004f60:	142027f3          	csrr	a5,scause
    80004f64:	00000513          	li	a0,0
    80004f68:	0007c463          	bltz	a5,80004f70 <devintr+0x10>
    80004f6c:	00008067          	ret
    80004f70:	fe010113          	addi	sp,sp,-32
    80004f74:	00813823          	sd	s0,16(sp)
    80004f78:	00113c23          	sd	ra,24(sp)
    80004f7c:	00913423          	sd	s1,8(sp)
    80004f80:	02010413          	addi	s0,sp,32
    80004f84:	0ff7f713          	andi	a4,a5,255
    80004f88:	00900693          	li	a3,9
    80004f8c:	04d70c63          	beq	a4,a3,80004fe4 <devintr+0x84>
    80004f90:	fff00713          	li	a4,-1
    80004f94:	03f71713          	slli	a4,a4,0x3f
    80004f98:	00170713          	addi	a4,a4,1
    80004f9c:	00e78c63          	beq	a5,a4,80004fb4 <devintr+0x54>
    80004fa0:	01813083          	ld	ra,24(sp)
    80004fa4:	01013403          	ld	s0,16(sp)
    80004fa8:	00813483          	ld	s1,8(sp)
    80004fac:	02010113          	addi	sp,sp,32
    80004fb0:	00008067          	ret
    80004fb4:	00000097          	auipc	ra,0x0
    80004fb8:	c8c080e7          	jalr	-884(ra) # 80004c40 <cpuid>
    80004fbc:	06050663          	beqz	a0,80005028 <devintr+0xc8>
    80004fc0:	144027f3          	csrr	a5,sip
    80004fc4:	ffd7f793          	andi	a5,a5,-3
    80004fc8:	14479073          	csrw	sip,a5
    80004fcc:	01813083          	ld	ra,24(sp)
    80004fd0:	01013403          	ld	s0,16(sp)
    80004fd4:	00813483          	ld	s1,8(sp)
    80004fd8:	00200513          	li	a0,2
    80004fdc:	02010113          	addi	sp,sp,32
    80004fe0:	00008067          	ret
    80004fe4:	00000097          	auipc	ra,0x0
    80004fe8:	250080e7          	jalr	592(ra) # 80005234 <plic_claim>
    80004fec:	00a00793          	li	a5,10
    80004ff0:	00050493          	mv	s1,a0
    80004ff4:	06f50663          	beq	a0,a5,80005060 <devintr+0x100>
    80004ff8:	00100513          	li	a0,1
    80004ffc:	fa0482e3          	beqz	s1,80004fa0 <devintr+0x40>
    80005000:	00048593          	mv	a1,s1
    80005004:	00002517          	auipc	a0,0x2
    80005008:	50450513          	addi	a0,a0,1284 # 80007508 <CONSOLE_STATUS+0x4f8>
    8000500c:	00000097          	auipc	ra,0x0
    80005010:	66c080e7          	jalr	1644(ra) # 80005678 <__printf>
    80005014:	00048513          	mv	a0,s1
    80005018:	00000097          	auipc	ra,0x0
    8000501c:	254080e7          	jalr	596(ra) # 8000526c <plic_complete>
    80005020:	00100513          	li	a0,1
    80005024:	f7dff06f          	j	80004fa0 <devintr+0x40>
    80005028:	00004517          	auipc	a0,0x4
    8000502c:	21850513          	addi	a0,a0,536 # 80009240 <tickslock>
    80005030:	00001097          	auipc	ra,0x1
    80005034:	31c080e7          	jalr	796(ra) # 8000634c <acquire>
    80005038:	00003717          	auipc	a4,0x3
    8000503c:	0ec70713          	addi	a4,a4,236 # 80008124 <ticks>
    80005040:	00072783          	lw	a5,0(a4)
    80005044:	00004517          	auipc	a0,0x4
    80005048:	1fc50513          	addi	a0,a0,508 # 80009240 <tickslock>
    8000504c:	0017879b          	addiw	a5,a5,1
    80005050:	00f72023          	sw	a5,0(a4)
    80005054:	00001097          	auipc	ra,0x1
    80005058:	3c4080e7          	jalr	964(ra) # 80006418 <release>
    8000505c:	f65ff06f          	j	80004fc0 <devintr+0x60>
    80005060:	00001097          	auipc	ra,0x1
    80005064:	f20080e7          	jalr	-224(ra) # 80005f80 <uartintr>
    80005068:	fadff06f          	j	80005014 <devintr+0xb4>
    8000506c:	0000                	unimp
	...

0000000080005070 <kernelvec>:
    80005070:	f0010113          	addi	sp,sp,-256
    80005074:	00113023          	sd	ra,0(sp)
    80005078:	00213423          	sd	sp,8(sp)
    8000507c:	00313823          	sd	gp,16(sp)
    80005080:	00413c23          	sd	tp,24(sp)
    80005084:	02513023          	sd	t0,32(sp)
    80005088:	02613423          	sd	t1,40(sp)
    8000508c:	02713823          	sd	t2,48(sp)
    80005090:	02813c23          	sd	s0,56(sp)
    80005094:	04913023          	sd	s1,64(sp)
    80005098:	04a13423          	sd	a0,72(sp)
    8000509c:	04b13823          	sd	a1,80(sp)
    800050a0:	04c13c23          	sd	a2,88(sp)
    800050a4:	06d13023          	sd	a3,96(sp)
    800050a8:	06e13423          	sd	a4,104(sp)
    800050ac:	06f13823          	sd	a5,112(sp)
    800050b0:	07013c23          	sd	a6,120(sp)
    800050b4:	09113023          	sd	a7,128(sp)
    800050b8:	09213423          	sd	s2,136(sp)
    800050bc:	09313823          	sd	s3,144(sp)
    800050c0:	09413c23          	sd	s4,152(sp)
    800050c4:	0b513023          	sd	s5,160(sp)
    800050c8:	0b613423          	sd	s6,168(sp)
    800050cc:	0b713823          	sd	s7,176(sp)
    800050d0:	0b813c23          	sd	s8,184(sp)
    800050d4:	0d913023          	sd	s9,192(sp)
    800050d8:	0da13423          	sd	s10,200(sp)
    800050dc:	0db13823          	sd	s11,208(sp)
    800050e0:	0dc13c23          	sd	t3,216(sp)
    800050e4:	0fd13023          	sd	t4,224(sp)
    800050e8:	0fe13423          	sd	t5,232(sp)
    800050ec:	0ff13823          	sd	t6,240(sp)
    800050f0:	cd1ff0ef          	jal	ra,80004dc0 <kerneltrap>
    800050f4:	00013083          	ld	ra,0(sp)
    800050f8:	00813103          	ld	sp,8(sp)
    800050fc:	01013183          	ld	gp,16(sp)
    80005100:	02013283          	ld	t0,32(sp)
    80005104:	02813303          	ld	t1,40(sp)
    80005108:	03013383          	ld	t2,48(sp)
    8000510c:	03813403          	ld	s0,56(sp)
    80005110:	04013483          	ld	s1,64(sp)
    80005114:	04813503          	ld	a0,72(sp)
    80005118:	05013583          	ld	a1,80(sp)
    8000511c:	05813603          	ld	a2,88(sp)
    80005120:	06013683          	ld	a3,96(sp)
    80005124:	06813703          	ld	a4,104(sp)
    80005128:	07013783          	ld	a5,112(sp)
    8000512c:	07813803          	ld	a6,120(sp)
    80005130:	08013883          	ld	a7,128(sp)
    80005134:	08813903          	ld	s2,136(sp)
    80005138:	09013983          	ld	s3,144(sp)
    8000513c:	09813a03          	ld	s4,152(sp)
    80005140:	0a013a83          	ld	s5,160(sp)
    80005144:	0a813b03          	ld	s6,168(sp)
    80005148:	0b013b83          	ld	s7,176(sp)
    8000514c:	0b813c03          	ld	s8,184(sp)
    80005150:	0c013c83          	ld	s9,192(sp)
    80005154:	0c813d03          	ld	s10,200(sp)
    80005158:	0d013d83          	ld	s11,208(sp)
    8000515c:	0d813e03          	ld	t3,216(sp)
    80005160:	0e013e83          	ld	t4,224(sp)
    80005164:	0e813f03          	ld	t5,232(sp)
    80005168:	0f013f83          	ld	t6,240(sp)
    8000516c:	10010113          	addi	sp,sp,256
    80005170:	10200073          	sret
    80005174:	00000013          	nop
    80005178:	00000013          	nop
    8000517c:	00000013          	nop

0000000080005180 <timervec>:
    80005180:	34051573          	csrrw	a0,mscratch,a0
    80005184:	00b53023          	sd	a1,0(a0)
    80005188:	00c53423          	sd	a2,8(a0)
    8000518c:	00d53823          	sd	a3,16(a0)
    80005190:	01853583          	ld	a1,24(a0)
    80005194:	02053603          	ld	a2,32(a0)
    80005198:	0005b683          	ld	a3,0(a1)
    8000519c:	00c686b3          	add	a3,a3,a2
    800051a0:	00d5b023          	sd	a3,0(a1)
    800051a4:	00200593          	li	a1,2
    800051a8:	14459073          	csrw	sip,a1
    800051ac:	01053683          	ld	a3,16(a0)
    800051b0:	00853603          	ld	a2,8(a0)
    800051b4:	00053583          	ld	a1,0(a0)
    800051b8:	34051573          	csrrw	a0,mscratch,a0
    800051bc:	30200073          	mret

00000000800051c0 <plicinit>:
    800051c0:	ff010113          	addi	sp,sp,-16
    800051c4:	00813423          	sd	s0,8(sp)
    800051c8:	01010413          	addi	s0,sp,16
    800051cc:	00813403          	ld	s0,8(sp)
    800051d0:	0c0007b7          	lui	a5,0xc000
    800051d4:	00100713          	li	a4,1
    800051d8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800051dc:	00e7a223          	sw	a4,4(a5)
    800051e0:	01010113          	addi	sp,sp,16
    800051e4:	00008067          	ret

00000000800051e8 <plicinithart>:
    800051e8:	ff010113          	addi	sp,sp,-16
    800051ec:	00813023          	sd	s0,0(sp)
    800051f0:	00113423          	sd	ra,8(sp)
    800051f4:	01010413          	addi	s0,sp,16
    800051f8:	00000097          	auipc	ra,0x0
    800051fc:	a48080e7          	jalr	-1464(ra) # 80004c40 <cpuid>
    80005200:	0085171b          	slliw	a4,a0,0x8
    80005204:	0c0027b7          	lui	a5,0xc002
    80005208:	00e787b3          	add	a5,a5,a4
    8000520c:	40200713          	li	a4,1026
    80005210:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005214:	00813083          	ld	ra,8(sp)
    80005218:	00013403          	ld	s0,0(sp)
    8000521c:	00d5151b          	slliw	a0,a0,0xd
    80005220:	0c2017b7          	lui	a5,0xc201
    80005224:	00a78533          	add	a0,a5,a0
    80005228:	00052023          	sw	zero,0(a0)
    8000522c:	01010113          	addi	sp,sp,16
    80005230:	00008067          	ret

0000000080005234 <plic_claim>:
    80005234:	ff010113          	addi	sp,sp,-16
    80005238:	00813023          	sd	s0,0(sp)
    8000523c:	00113423          	sd	ra,8(sp)
    80005240:	01010413          	addi	s0,sp,16
    80005244:	00000097          	auipc	ra,0x0
    80005248:	9fc080e7          	jalr	-1540(ra) # 80004c40 <cpuid>
    8000524c:	00813083          	ld	ra,8(sp)
    80005250:	00013403          	ld	s0,0(sp)
    80005254:	00d5151b          	slliw	a0,a0,0xd
    80005258:	0c2017b7          	lui	a5,0xc201
    8000525c:	00a78533          	add	a0,a5,a0
    80005260:	00452503          	lw	a0,4(a0)
    80005264:	01010113          	addi	sp,sp,16
    80005268:	00008067          	ret

000000008000526c <plic_complete>:
    8000526c:	fe010113          	addi	sp,sp,-32
    80005270:	00813823          	sd	s0,16(sp)
    80005274:	00913423          	sd	s1,8(sp)
    80005278:	00113c23          	sd	ra,24(sp)
    8000527c:	02010413          	addi	s0,sp,32
    80005280:	00050493          	mv	s1,a0
    80005284:	00000097          	auipc	ra,0x0
    80005288:	9bc080e7          	jalr	-1604(ra) # 80004c40 <cpuid>
    8000528c:	01813083          	ld	ra,24(sp)
    80005290:	01013403          	ld	s0,16(sp)
    80005294:	00d5179b          	slliw	a5,a0,0xd
    80005298:	0c201737          	lui	a4,0xc201
    8000529c:	00f707b3          	add	a5,a4,a5
    800052a0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800052a4:	00813483          	ld	s1,8(sp)
    800052a8:	02010113          	addi	sp,sp,32
    800052ac:	00008067          	ret

00000000800052b0 <consolewrite>:
    800052b0:	fb010113          	addi	sp,sp,-80
    800052b4:	04813023          	sd	s0,64(sp)
    800052b8:	04113423          	sd	ra,72(sp)
    800052bc:	02913c23          	sd	s1,56(sp)
    800052c0:	03213823          	sd	s2,48(sp)
    800052c4:	03313423          	sd	s3,40(sp)
    800052c8:	03413023          	sd	s4,32(sp)
    800052cc:	01513c23          	sd	s5,24(sp)
    800052d0:	05010413          	addi	s0,sp,80
    800052d4:	06c05c63          	blez	a2,8000534c <consolewrite+0x9c>
    800052d8:	00060993          	mv	s3,a2
    800052dc:	00050a13          	mv	s4,a0
    800052e0:	00058493          	mv	s1,a1
    800052e4:	00000913          	li	s2,0
    800052e8:	fff00a93          	li	s5,-1
    800052ec:	01c0006f          	j	80005308 <consolewrite+0x58>
    800052f0:	fbf44503          	lbu	a0,-65(s0)
    800052f4:	0019091b          	addiw	s2,s2,1
    800052f8:	00148493          	addi	s1,s1,1
    800052fc:	00001097          	auipc	ra,0x1
    80005300:	a9c080e7          	jalr	-1380(ra) # 80005d98 <uartputc>
    80005304:	03298063          	beq	s3,s2,80005324 <consolewrite+0x74>
    80005308:	00048613          	mv	a2,s1
    8000530c:	00100693          	li	a3,1
    80005310:	000a0593          	mv	a1,s4
    80005314:	fbf40513          	addi	a0,s0,-65
    80005318:	00000097          	auipc	ra,0x0
    8000531c:	9e0080e7          	jalr	-1568(ra) # 80004cf8 <either_copyin>
    80005320:	fd5518e3          	bne	a0,s5,800052f0 <consolewrite+0x40>
    80005324:	04813083          	ld	ra,72(sp)
    80005328:	04013403          	ld	s0,64(sp)
    8000532c:	03813483          	ld	s1,56(sp)
    80005330:	02813983          	ld	s3,40(sp)
    80005334:	02013a03          	ld	s4,32(sp)
    80005338:	01813a83          	ld	s5,24(sp)
    8000533c:	00090513          	mv	a0,s2
    80005340:	03013903          	ld	s2,48(sp)
    80005344:	05010113          	addi	sp,sp,80
    80005348:	00008067          	ret
    8000534c:	00000913          	li	s2,0
    80005350:	fd5ff06f          	j	80005324 <consolewrite+0x74>

0000000080005354 <consoleread>:
    80005354:	f9010113          	addi	sp,sp,-112
    80005358:	06813023          	sd	s0,96(sp)
    8000535c:	04913c23          	sd	s1,88(sp)
    80005360:	05213823          	sd	s2,80(sp)
    80005364:	05313423          	sd	s3,72(sp)
    80005368:	05413023          	sd	s4,64(sp)
    8000536c:	03513c23          	sd	s5,56(sp)
    80005370:	03613823          	sd	s6,48(sp)
    80005374:	03713423          	sd	s7,40(sp)
    80005378:	03813023          	sd	s8,32(sp)
    8000537c:	06113423          	sd	ra,104(sp)
    80005380:	01913c23          	sd	s9,24(sp)
    80005384:	07010413          	addi	s0,sp,112
    80005388:	00060b93          	mv	s7,a2
    8000538c:	00050913          	mv	s2,a0
    80005390:	00058c13          	mv	s8,a1
    80005394:	00060b1b          	sext.w	s6,a2
    80005398:	00004497          	auipc	s1,0x4
    8000539c:	ed048493          	addi	s1,s1,-304 # 80009268 <cons>
    800053a0:	00400993          	li	s3,4
    800053a4:	fff00a13          	li	s4,-1
    800053a8:	00a00a93          	li	s5,10
    800053ac:	05705e63          	blez	s7,80005408 <consoleread+0xb4>
    800053b0:	09c4a703          	lw	a4,156(s1)
    800053b4:	0984a783          	lw	a5,152(s1)
    800053b8:	0007071b          	sext.w	a4,a4
    800053bc:	08e78463          	beq	a5,a4,80005444 <consoleread+0xf0>
    800053c0:	07f7f713          	andi	a4,a5,127
    800053c4:	00e48733          	add	a4,s1,a4
    800053c8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800053cc:	0017869b          	addiw	a3,a5,1
    800053d0:	08d4ac23          	sw	a3,152(s1)
    800053d4:	00070c9b          	sext.w	s9,a4
    800053d8:	0b370663          	beq	a4,s3,80005484 <consoleread+0x130>
    800053dc:	00100693          	li	a3,1
    800053e0:	f9f40613          	addi	a2,s0,-97
    800053e4:	000c0593          	mv	a1,s8
    800053e8:	00090513          	mv	a0,s2
    800053ec:	f8e40fa3          	sb	a4,-97(s0)
    800053f0:	00000097          	auipc	ra,0x0
    800053f4:	8bc080e7          	jalr	-1860(ra) # 80004cac <either_copyout>
    800053f8:	01450863          	beq	a0,s4,80005408 <consoleread+0xb4>
    800053fc:	001c0c13          	addi	s8,s8,1
    80005400:	fffb8b9b          	addiw	s7,s7,-1
    80005404:	fb5c94e3          	bne	s9,s5,800053ac <consoleread+0x58>
    80005408:	000b851b          	sext.w	a0,s7
    8000540c:	06813083          	ld	ra,104(sp)
    80005410:	06013403          	ld	s0,96(sp)
    80005414:	05813483          	ld	s1,88(sp)
    80005418:	05013903          	ld	s2,80(sp)
    8000541c:	04813983          	ld	s3,72(sp)
    80005420:	04013a03          	ld	s4,64(sp)
    80005424:	03813a83          	ld	s5,56(sp)
    80005428:	02813b83          	ld	s7,40(sp)
    8000542c:	02013c03          	ld	s8,32(sp)
    80005430:	01813c83          	ld	s9,24(sp)
    80005434:	40ab053b          	subw	a0,s6,a0
    80005438:	03013b03          	ld	s6,48(sp)
    8000543c:	07010113          	addi	sp,sp,112
    80005440:	00008067          	ret
    80005444:	00001097          	auipc	ra,0x1
    80005448:	1d8080e7          	jalr	472(ra) # 8000661c <push_on>
    8000544c:	0984a703          	lw	a4,152(s1)
    80005450:	09c4a783          	lw	a5,156(s1)
    80005454:	0007879b          	sext.w	a5,a5
    80005458:	fef70ce3          	beq	a4,a5,80005450 <consoleread+0xfc>
    8000545c:	00001097          	auipc	ra,0x1
    80005460:	234080e7          	jalr	564(ra) # 80006690 <pop_on>
    80005464:	0984a783          	lw	a5,152(s1)
    80005468:	07f7f713          	andi	a4,a5,127
    8000546c:	00e48733          	add	a4,s1,a4
    80005470:	01874703          	lbu	a4,24(a4)
    80005474:	0017869b          	addiw	a3,a5,1
    80005478:	08d4ac23          	sw	a3,152(s1)
    8000547c:	00070c9b          	sext.w	s9,a4
    80005480:	f5371ee3          	bne	a4,s3,800053dc <consoleread+0x88>
    80005484:	000b851b          	sext.w	a0,s7
    80005488:	f96bf2e3          	bgeu	s7,s6,8000540c <consoleread+0xb8>
    8000548c:	08f4ac23          	sw	a5,152(s1)
    80005490:	f7dff06f          	j	8000540c <consoleread+0xb8>

0000000080005494 <consputc>:
    80005494:	10000793          	li	a5,256
    80005498:	00f50663          	beq	a0,a5,800054a4 <consputc+0x10>
    8000549c:	00001317          	auipc	t1,0x1
    800054a0:	9f430067          	jr	-1548(t1) # 80005e90 <uartputc_sync>
    800054a4:	ff010113          	addi	sp,sp,-16
    800054a8:	00113423          	sd	ra,8(sp)
    800054ac:	00813023          	sd	s0,0(sp)
    800054b0:	01010413          	addi	s0,sp,16
    800054b4:	00800513          	li	a0,8
    800054b8:	00001097          	auipc	ra,0x1
    800054bc:	9d8080e7          	jalr	-1576(ra) # 80005e90 <uartputc_sync>
    800054c0:	02000513          	li	a0,32
    800054c4:	00001097          	auipc	ra,0x1
    800054c8:	9cc080e7          	jalr	-1588(ra) # 80005e90 <uartputc_sync>
    800054cc:	00013403          	ld	s0,0(sp)
    800054d0:	00813083          	ld	ra,8(sp)
    800054d4:	00800513          	li	a0,8
    800054d8:	01010113          	addi	sp,sp,16
    800054dc:	00001317          	auipc	t1,0x1
    800054e0:	9b430067          	jr	-1612(t1) # 80005e90 <uartputc_sync>

00000000800054e4 <consoleintr>:
    800054e4:	fe010113          	addi	sp,sp,-32
    800054e8:	00813823          	sd	s0,16(sp)
    800054ec:	00913423          	sd	s1,8(sp)
    800054f0:	01213023          	sd	s2,0(sp)
    800054f4:	00113c23          	sd	ra,24(sp)
    800054f8:	02010413          	addi	s0,sp,32
    800054fc:	00004917          	auipc	s2,0x4
    80005500:	d6c90913          	addi	s2,s2,-660 # 80009268 <cons>
    80005504:	00050493          	mv	s1,a0
    80005508:	00090513          	mv	a0,s2
    8000550c:	00001097          	auipc	ra,0x1
    80005510:	e40080e7          	jalr	-448(ra) # 8000634c <acquire>
    80005514:	02048c63          	beqz	s1,8000554c <consoleintr+0x68>
    80005518:	0a092783          	lw	a5,160(s2)
    8000551c:	09892703          	lw	a4,152(s2)
    80005520:	07f00693          	li	a3,127
    80005524:	40e7873b          	subw	a4,a5,a4
    80005528:	02e6e263          	bltu	a3,a4,8000554c <consoleintr+0x68>
    8000552c:	00d00713          	li	a4,13
    80005530:	04e48063          	beq	s1,a4,80005570 <consoleintr+0x8c>
    80005534:	07f7f713          	andi	a4,a5,127
    80005538:	00e90733          	add	a4,s2,a4
    8000553c:	0017879b          	addiw	a5,a5,1
    80005540:	0af92023          	sw	a5,160(s2)
    80005544:	00970c23          	sb	s1,24(a4)
    80005548:	08f92e23          	sw	a5,156(s2)
    8000554c:	01013403          	ld	s0,16(sp)
    80005550:	01813083          	ld	ra,24(sp)
    80005554:	00813483          	ld	s1,8(sp)
    80005558:	00013903          	ld	s2,0(sp)
    8000555c:	00004517          	auipc	a0,0x4
    80005560:	d0c50513          	addi	a0,a0,-756 # 80009268 <cons>
    80005564:	02010113          	addi	sp,sp,32
    80005568:	00001317          	auipc	t1,0x1
    8000556c:	eb030067          	jr	-336(t1) # 80006418 <release>
    80005570:	00a00493          	li	s1,10
    80005574:	fc1ff06f          	j	80005534 <consoleintr+0x50>

0000000080005578 <consoleinit>:
    80005578:	fe010113          	addi	sp,sp,-32
    8000557c:	00113c23          	sd	ra,24(sp)
    80005580:	00813823          	sd	s0,16(sp)
    80005584:	00913423          	sd	s1,8(sp)
    80005588:	02010413          	addi	s0,sp,32
    8000558c:	00004497          	auipc	s1,0x4
    80005590:	cdc48493          	addi	s1,s1,-804 # 80009268 <cons>
    80005594:	00048513          	mv	a0,s1
    80005598:	00002597          	auipc	a1,0x2
    8000559c:	fc858593          	addi	a1,a1,-56 # 80007560 <CONSOLE_STATUS+0x550>
    800055a0:	00001097          	auipc	ra,0x1
    800055a4:	d88080e7          	jalr	-632(ra) # 80006328 <initlock>
    800055a8:	00000097          	auipc	ra,0x0
    800055ac:	7ac080e7          	jalr	1964(ra) # 80005d54 <uartinit>
    800055b0:	01813083          	ld	ra,24(sp)
    800055b4:	01013403          	ld	s0,16(sp)
    800055b8:	00000797          	auipc	a5,0x0
    800055bc:	d9c78793          	addi	a5,a5,-612 # 80005354 <consoleread>
    800055c0:	0af4bc23          	sd	a5,184(s1)
    800055c4:	00000797          	auipc	a5,0x0
    800055c8:	cec78793          	addi	a5,a5,-788 # 800052b0 <consolewrite>
    800055cc:	0cf4b023          	sd	a5,192(s1)
    800055d0:	00813483          	ld	s1,8(sp)
    800055d4:	02010113          	addi	sp,sp,32
    800055d8:	00008067          	ret

00000000800055dc <console_read>:
    800055dc:	ff010113          	addi	sp,sp,-16
    800055e0:	00813423          	sd	s0,8(sp)
    800055e4:	01010413          	addi	s0,sp,16
    800055e8:	00813403          	ld	s0,8(sp)
    800055ec:	00004317          	auipc	t1,0x4
    800055f0:	d3433303          	ld	t1,-716(t1) # 80009320 <devsw+0x10>
    800055f4:	01010113          	addi	sp,sp,16
    800055f8:	00030067          	jr	t1

00000000800055fc <console_write>:
    800055fc:	ff010113          	addi	sp,sp,-16
    80005600:	00813423          	sd	s0,8(sp)
    80005604:	01010413          	addi	s0,sp,16
    80005608:	00813403          	ld	s0,8(sp)
    8000560c:	00004317          	auipc	t1,0x4
    80005610:	d1c33303          	ld	t1,-740(t1) # 80009328 <devsw+0x18>
    80005614:	01010113          	addi	sp,sp,16
    80005618:	00030067          	jr	t1

000000008000561c <panic>:
    8000561c:	fe010113          	addi	sp,sp,-32
    80005620:	00113c23          	sd	ra,24(sp)
    80005624:	00813823          	sd	s0,16(sp)
    80005628:	00913423          	sd	s1,8(sp)
    8000562c:	02010413          	addi	s0,sp,32
    80005630:	00050493          	mv	s1,a0
    80005634:	00002517          	auipc	a0,0x2
    80005638:	f3450513          	addi	a0,a0,-204 # 80007568 <CONSOLE_STATUS+0x558>
    8000563c:	00004797          	auipc	a5,0x4
    80005640:	d807a623          	sw	zero,-628(a5) # 800093c8 <pr+0x18>
    80005644:	00000097          	auipc	ra,0x0
    80005648:	034080e7          	jalr	52(ra) # 80005678 <__printf>
    8000564c:	00048513          	mv	a0,s1
    80005650:	00000097          	auipc	ra,0x0
    80005654:	028080e7          	jalr	40(ra) # 80005678 <__printf>
    80005658:	00002517          	auipc	a0,0x2
    8000565c:	ef050513          	addi	a0,a0,-272 # 80007548 <CONSOLE_STATUS+0x538>
    80005660:	00000097          	auipc	ra,0x0
    80005664:	018080e7          	jalr	24(ra) # 80005678 <__printf>
    80005668:	00100793          	li	a5,1
    8000566c:	00003717          	auipc	a4,0x3
    80005670:	aaf72e23          	sw	a5,-1348(a4) # 80008128 <panicked>
    80005674:	0000006f          	j	80005674 <panic+0x58>

0000000080005678 <__printf>:
    80005678:	f3010113          	addi	sp,sp,-208
    8000567c:	08813023          	sd	s0,128(sp)
    80005680:	07313423          	sd	s3,104(sp)
    80005684:	09010413          	addi	s0,sp,144
    80005688:	05813023          	sd	s8,64(sp)
    8000568c:	08113423          	sd	ra,136(sp)
    80005690:	06913c23          	sd	s1,120(sp)
    80005694:	07213823          	sd	s2,112(sp)
    80005698:	07413023          	sd	s4,96(sp)
    8000569c:	05513c23          	sd	s5,88(sp)
    800056a0:	05613823          	sd	s6,80(sp)
    800056a4:	05713423          	sd	s7,72(sp)
    800056a8:	03913c23          	sd	s9,56(sp)
    800056ac:	03a13823          	sd	s10,48(sp)
    800056b0:	03b13423          	sd	s11,40(sp)
    800056b4:	00004317          	auipc	t1,0x4
    800056b8:	cfc30313          	addi	t1,t1,-772 # 800093b0 <pr>
    800056bc:	01832c03          	lw	s8,24(t1)
    800056c0:	00b43423          	sd	a1,8(s0)
    800056c4:	00c43823          	sd	a2,16(s0)
    800056c8:	00d43c23          	sd	a3,24(s0)
    800056cc:	02e43023          	sd	a4,32(s0)
    800056d0:	02f43423          	sd	a5,40(s0)
    800056d4:	03043823          	sd	a6,48(s0)
    800056d8:	03143c23          	sd	a7,56(s0)
    800056dc:	00050993          	mv	s3,a0
    800056e0:	4a0c1663          	bnez	s8,80005b8c <__printf+0x514>
    800056e4:	60098c63          	beqz	s3,80005cfc <__printf+0x684>
    800056e8:	0009c503          	lbu	a0,0(s3)
    800056ec:	00840793          	addi	a5,s0,8
    800056f0:	f6f43c23          	sd	a5,-136(s0)
    800056f4:	00000493          	li	s1,0
    800056f8:	22050063          	beqz	a0,80005918 <__printf+0x2a0>
    800056fc:	00002a37          	lui	s4,0x2
    80005700:	00018ab7          	lui	s5,0x18
    80005704:	000f4b37          	lui	s6,0xf4
    80005708:	00989bb7          	lui	s7,0x989
    8000570c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005710:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005714:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005718:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000571c:	00148c9b          	addiw	s9,s1,1
    80005720:	02500793          	li	a5,37
    80005724:	01998933          	add	s2,s3,s9
    80005728:	38f51263          	bne	a0,a5,80005aac <__printf+0x434>
    8000572c:	00094783          	lbu	a5,0(s2)
    80005730:	00078c9b          	sext.w	s9,a5
    80005734:	1e078263          	beqz	a5,80005918 <__printf+0x2a0>
    80005738:	0024849b          	addiw	s1,s1,2
    8000573c:	07000713          	li	a4,112
    80005740:	00998933          	add	s2,s3,s1
    80005744:	38e78a63          	beq	a5,a4,80005ad8 <__printf+0x460>
    80005748:	20f76863          	bltu	a4,a5,80005958 <__printf+0x2e0>
    8000574c:	42a78863          	beq	a5,a0,80005b7c <__printf+0x504>
    80005750:	06400713          	li	a4,100
    80005754:	40e79663          	bne	a5,a4,80005b60 <__printf+0x4e8>
    80005758:	f7843783          	ld	a5,-136(s0)
    8000575c:	0007a603          	lw	a2,0(a5)
    80005760:	00878793          	addi	a5,a5,8
    80005764:	f6f43c23          	sd	a5,-136(s0)
    80005768:	42064a63          	bltz	a2,80005b9c <__printf+0x524>
    8000576c:	00a00713          	li	a4,10
    80005770:	02e677bb          	remuw	a5,a2,a4
    80005774:	00002d97          	auipc	s11,0x2
    80005778:	e1cd8d93          	addi	s11,s11,-484 # 80007590 <digits>
    8000577c:	00900593          	li	a1,9
    80005780:	0006051b          	sext.w	a0,a2
    80005784:	00000c93          	li	s9,0
    80005788:	02079793          	slli	a5,a5,0x20
    8000578c:	0207d793          	srli	a5,a5,0x20
    80005790:	00fd87b3          	add	a5,s11,a5
    80005794:	0007c783          	lbu	a5,0(a5)
    80005798:	02e656bb          	divuw	a3,a2,a4
    8000579c:	f8f40023          	sb	a5,-128(s0)
    800057a0:	14c5d863          	bge	a1,a2,800058f0 <__printf+0x278>
    800057a4:	06300593          	li	a1,99
    800057a8:	00100c93          	li	s9,1
    800057ac:	02e6f7bb          	remuw	a5,a3,a4
    800057b0:	02079793          	slli	a5,a5,0x20
    800057b4:	0207d793          	srli	a5,a5,0x20
    800057b8:	00fd87b3          	add	a5,s11,a5
    800057bc:	0007c783          	lbu	a5,0(a5)
    800057c0:	02e6d73b          	divuw	a4,a3,a4
    800057c4:	f8f400a3          	sb	a5,-127(s0)
    800057c8:	12a5f463          	bgeu	a1,a0,800058f0 <__printf+0x278>
    800057cc:	00a00693          	li	a3,10
    800057d0:	00900593          	li	a1,9
    800057d4:	02d777bb          	remuw	a5,a4,a3
    800057d8:	02079793          	slli	a5,a5,0x20
    800057dc:	0207d793          	srli	a5,a5,0x20
    800057e0:	00fd87b3          	add	a5,s11,a5
    800057e4:	0007c503          	lbu	a0,0(a5)
    800057e8:	02d757bb          	divuw	a5,a4,a3
    800057ec:	f8a40123          	sb	a0,-126(s0)
    800057f0:	48e5f263          	bgeu	a1,a4,80005c74 <__printf+0x5fc>
    800057f4:	06300513          	li	a0,99
    800057f8:	02d7f5bb          	remuw	a1,a5,a3
    800057fc:	02059593          	slli	a1,a1,0x20
    80005800:	0205d593          	srli	a1,a1,0x20
    80005804:	00bd85b3          	add	a1,s11,a1
    80005808:	0005c583          	lbu	a1,0(a1)
    8000580c:	02d7d7bb          	divuw	a5,a5,a3
    80005810:	f8b401a3          	sb	a1,-125(s0)
    80005814:	48e57263          	bgeu	a0,a4,80005c98 <__printf+0x620>
    80005818:	3e700513          	li	a0,999
    8000581c:	02d7f5bb          	remuw	a1,a5,a3
    80005820:	02059593          	slli	a1,a1,0x20
    80005824:	0205d593          	srli	a1,a1,0x20
    80005828:	00bd85b3          	add	a1,s11,a1
    8000582c:	0005c583          	lbu	a1,0(a1)
    80005830:	02d7d7bb          	divuw	a5,a5,a3
    80005834:	f8b40223          	sb	a1,-124(s0)
    80005838:	46e57663          	bgeu	a0,a4,80005ca4 <__printf+0x62c>
    8000583c:	02d7f5bb          	remuw	a1,a5,a3
    80005840:	02059593          	slli	a1,a1,0x20
    80005844:	0205d593          	srli	a1,a1,0x20
    80005848:	00bd85b3          	add	a1,s11,a1
    8000584c:	0005c583          	lbu	a1,0(a1)
    80005850:	02d7d7bb          	divuw	a5,a5,a3
    80005854:	f8b402a3          	sb	a1,-123(s0)
    80005858:	46ea7863          	bgeu	s4,a4,80005cc8 <__printf+0x650>
    8000585c:	02d7f5bb          	remuw	a1,a5,a3
    80005860:	02059593          	slli	a1,a1,0x20
    80005864:	0205d593          	srli	a1,a1,0x20
    80005868:	00bd85b3          	add	a1,s11,a1
    8000586c:	0005c583          	lbu	a1,0(a1)
    80005870:	02d7d7bb          	divuw	a5,a5,a3
    80005874:	f8b40323          	sb	a1,-122(s0)
    80005878:	3eeaf863          	bgeu	s5,a4,80005c68 <__printf+0x5f0>
    8000587c:	02d7f5bb          	remuw	a1,a5,a3
    80005880:	02059593          	slli	a1,a1,0x20
    80005884:	0205d593          	srli	a1,a1,0x20
    80005888:	00bd85b3          	add	a1,s11,a1
    8000588c:	0005c583          	lbu	a1,0(a1)
    80005890:	02d7d7bb          	divuw	a5,a5,a3
    80005894:	f8b403a3          	sb	a1,-121(s0)
    80005898:	42eb7e63          	bgeu	s6,a4,80005cd4 <__printf+0x65c>
    8000589c:	02d7f5bb          	remuw	a1,a5,a3
    800058a0:	02059593          	slli	a1,a1,0x20
    800058a4:	0205d593          	srli	a1,a1,0x20
    800058a8:	00bd85b3          	add	a1,s11,a1
    800058ac:	0005c583          	lbu	a1,0(a1)
    800058b0:	02d7d7bb          	divuw	a5,a5,a3
    800058b4:	f8b40423          	sb	a1,-120(s0)
    800058b8:	42ebfc63          	bgeu	s7,a4,80005cf0 <__printf+0x678>
    800058bc:	02079793          	slli	a5,a5,0x20
    800058c0:	0207d793          	srli	a5,a5,0x20
    800058c4:	00fd8db3          	add	s11,s11,a5
    800058c8:	000dc703          	lbu	a4,0(s11)
    800058cc:	00a00793          	li	a5,10
    800058d0:	00900c93          	li	s9,9
    800058d4:	f8e404a3          	sb	a4,-119(s0)
    800058d8:	00065c63          	bgez	a2,800058f0 <__printf+0x278>
    800058dc:	f9040713          	addi	a4,s0,-112
    800058e0:	00f70733          	add	a4,a4,a5
    800058e4:	02d00693          	li	a3,45
    800058e8:	fed70823          	sb	a3,-16(a4)
    800058ec:	00078c93          	mv	s9,a5
    800058f0:	f8040793          	addi	a5,s0,-128
    800058f4:	01978cb3          	add	s9,a5,s9
    800058f8:	f7f40d13          	addi	s10,s0,-129
    800058fc:	000cc503          	lbu	a0,0(s9)
    80005900:	fffc8c93          	addi	s9,s9,-1
    80005904:	00000097          	auipc	ra,0x0
    80005908:	b90080e7          	jalr	-1136(ra) # 80005494 <consputc>
    8000590c:	ffac98e3          	bne	s9,s10,800058fc <__printf+0x284>
    80005910:	00094503          	lbu	a0,0(s2)
    80005914:	e00514e3          	bnez	a0,8000571c <__printf+0xa4>
    80005918:	1a0c1663          	bnez	s8,80005ac4 <__printf+0x44c>
    8000591c:	08813083          	ld	ra,136(sp)
    80005920:	08013403          	ld	s0,128(sp)
    80005924:	07813483          	ld	s1,120(sp)
    80005928:	07013903          	ld	s2,112(sp)
    8000592c:	06813983          	ld	s3,104(sp)
    80005930:	06013a03          	ld	s4,96(sp)
    80005934:	05813a83          	ld	s5,88(sp)
    80005938:	05013b03          	ld	s6,80(sp)
    8000593c:	04813b83          	ld	s7,72(sp)
    80005940:	04013c03          	ld	s8,64(sp)
    80005944:	03813c83          	ld	s9,56(sp)
    80005948:	03013d03          	ld	s10,48(sp)
    8000594c:	02813d83          	ld	s11,40(sp)
    80005950:	0d010113          	addi	sp,sp,208
    80005954:	00008067          	ret
    80005958:	07300713          	li	a4,115
    8000595c:	1ce78a63          	beq	a5,a4,80005b30 <__printf+0x4b8>
    80005960:	07800713          	li	a4,120
    80005964:	1ee79e63          	bne	a5,a4,80005b60 <__printf+0x4e8>
    80005968:	f7843783          	ld	a5,-136(s0)
    8000596c:	0007a703          	lw	a4,0(a5)
    80005970:	00878793          	addi	a5,a5,8
    80005974:	f6f43c23          	sd	a5,-136(s0)
    80005978:	28074263          	bltz	a4,80005bfc <__printf+0x584>
    8000597c:	00002d97          	auipc	s11,0x2
    80005980:	c14d8d93          	addi	s11,s11,-1004 # 80007590 <digits>
    80005984:	00f77793          	andi	a5,a4,15
    80005988:	00fd87b3          	add	a5,s11,a5
    8000598c:	0007c683          	lbu	a3,0(a5)
    80005990:	00f00613          	li	a2,15
    80005994:	0007079b          	sext.w	a5,a4
    80005998:	f8d40023          	sb	a3,-128(s0)
    8000599c:	0047559b          	srliw	a1,a4,0x4
    800059a0:	0047569b          	srliw	a3,a4,0x4
    800059a4:	00000c93          	li	s9,0
    800059a8:	0ee65063          	bge	a2,a4,80005a88 <__printf+0x410>
    800059ac:	00f6f693          	andi	a3,a3,15
    800059b0:	00dd86b3          	add	a3,s11,a3
    800059b4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800059b8:	0087d79b          	srliw	a5,a5,0x8
    800059bc:	00100c93          	li	s9,1
    800059c0:	f8d400a3          	sb	a3,-127(s0)
    800059c4:	0cb67263          	bgeu	a2,a1,80005a88 <__printf+0x410>
    800059c8:	00f7f693          	andi	a3,a5,15
    800059cc:	00dd86b3          	add	a3,s11,a3
    800059d0:	0006c583          	lbu	a1,0(a3)
    800059d4:	00f00613          	li	a2,15
    800059d8:	0047d69b          	srliw	a3,a5,0x4
    800059dc:	f8b40123          	sb	a1,-126(s0)
    800059e0:	0047d593          	srli	a1,a5,0x4
    800059e4:	28f67e63          	bgeu	a2,a5,80005c80 <__printf+0x608>
    800059e8:	00f6f693          	andi	a3,a3,15
    800059ec:	00dd86b3          	add	a3,s11,a3
    800059f0:	0006c503          	lbu	a0,0(a3)
    800059f4:	0087d813          	srli	a6,a5,0x8
    800059f8:	0087d69b          	srliw	a3,a5,0x8
    800059fc:	f8a401a3          	sb	a0,-125(s0)
    80005a00:	28b67663          	bgeu	a2,a1,80005c8c <__printf+0x614>
    80005a04:	00f6f693          	andi	a3,a3,15
    80005a08:	00dd86b3          	add	a3,s11,a3
    80005a0c:	0006c583          	lbu	a1,0(a3)
    80005a10:	00c7d513          	srli	a0,a5,0xc
    80005a14:	00c7d69b          	srliw	a3,a5,0xc
    80005a18:	f8b40223          	sb	a1,-124(s0)
    80005a1c:	29067a63          	bgeu	a2,a6,80005cb0 <__printf+0x638>
    80005a20:	00f6f693          	andi	a3,a3,15
    80005a24:	00dd86b3          	add	a3,s11,a3
    80005a28:	0006c583          	lbu	a1,0(a3)
    80005a2c:	0107d813          	srli	a6,a5,0x10
    80005a30:	0107d69b          	srliw	a3,a5,0x10
    80005a34:	f8b402a3          	sb	a1,-123(s0)
    80005a38:	28a67263          	bgeu	a2,a0,80005cbc <__printf+0x644>
    80005a3c:	00f6f693          	andi	a3,a3,15
    80005a40:	00dd86b3          	add	a3,s11,a3
    80005a44:	0006c683          	lbu	a3,0(a3)
    80005a48:	0147d79b          	srliw	a5,a5,0x14
    80005a4c:	f8d40323          	sb	a3,-122(s0)
    80005a50:	21067663          	bgeu	a2,a6,80005c5c <__printf+0x5e4>
    80005a54:	02079793          	slli	a5,a5,0x20
    80005a58:	0207d793          	srli	a5,a5,0x20
    80005a5c:	00fd8db3          	add	s11,s11,a5
    80005a60:	000dc683          	lbu	a3,0(s11)
    80005a64:	00800793          	li	a5,8
    80005a68:	00700c93          	li	s9,7
    80005a6c:	f8d403a3          	sb	a3,-121(s0)
    80005a70:	00075c63          	bgez	a4,80005a88 <__printf+0x410>
    80005a74:	f9040713          	addi	a4,s0,-112
    80005a78:	00f70733          	add	a4,a4,a5
    80005a7c:	02d00693          	li	a3,45
    80005a80:	fed70823          	sb	a3,-16(a4)
    80005a84:	00078c93          	mv	s9,a5
    80005a88:	f8040793          	addi	a5,s0,-128
    80005a8c:	01978cb3          	add	s9,a5,s9
    80005a90:	f7f40d13          	addi	s10,s0,-129
    80005a94:	000cc503          	lbu	a0,0(s9)
    80005a98:	fffc8c93          	addi	s9,s9,-1
    80005a9c:	00000097          	auipc	ra,0x0
    80005aa0:	9f8080e7          	jalr	-1544(ra) # 80005494 <consputc>
    80005aa4:	ff9d18e3          	bne	s10,s9,80005a94 <__printf+0x41c>
    80005aa8:	0100006f          	j	80005ab8 <__printf+0x440>
    80005aac:	00000097          	auipc	ra,0x0
    80005ab0:	9e8080e7          	jalr	-1560(ra) # 80005494 <consputc>
    80005ab4:	000c8493          	mv	s1,s9
    80005ab8:	00094503          	lbu	a0,0(s2)
    80005abc:	c60510e3          	bnez	a0,8000571c <__printf+0xa4>
    80005ac0:	e40c0ee3          	beqz	s8,8000591c <__printf+0x2a4>
    80005ac4:	00004517          	auipc	a0,0x4
    80005ac8:	8ec50513          	addi	a0,a0,-1812 # 800093b0 <pr>
    80005acc:	00001097          	auipc	ra,0x1
    80005ad0:	94c080e7          	jalr	-1716(ra) # 80006418 <release>
    80005ad4:	e49ff06f          	j	8000591c <__printf+0x2a4>
    80005ad8:	f7843783          	ld	a5,-136(s0)
    80005adc:	03000513          	li	a0,48
    80005ae0:	01000d13          	li	s10,16
    80005ae4:	00878713          	addi	a4,a5,8
    80005ae8:	0007bc83          	ld	s9,0(a5)
    80005aec:	f6e43c23          	sd	a4,-136(s0)
    80005af0:	00000097          	auipc	ra,0x0
    80005af4:	9a4080e7          	jalr	-1628(ra) # 80005494 <consputc>
    80005af8:	07800513          	li	a0,120
    80005afc:	00000097          	auipc	ra,0x0
    80005b00:	998080e7          	jalr	-1640(ra) # 80005494 <consputc>
    80005b04:	00002d97          	auipc	s11,0x2
    80005b08:	a8cd8d93          	addi	s11,s11,-1396 # 80007590 <digits>
    80005b0c:	03ccd793          	srli	a5,s9,0x3c
    80005b10:	00fd87b3          	add	a5,s11,a5
    80005b14:	0007c503          	lbu	a0,0(a5)
    80005b18:	fffd0d1b          	addiw	s10,s10,-1
    80005b1c:	004c9c93          	slli	s9,s9,0x4
    80005b20:	00000097          	auipc	ra,0x0
    80005b24:	974080e7          	jalr	-1676(ra) # 80005494 <consputc>
    80005b28:	fe0d12e3          	bnez	s10,80005b0c <__printf+0x494>
    80005b2c:	f8dff06f          	j	80005ab8 <__printf+0x440>
    80005b30:	f7843783          	ld	a5,-136(s0)
    80005b34:	0007bc83          	ld	s9,0(a5)
    80005b38:	00878793          	addi	a5,a5,8
    80005b3c:	f6f43c23          	sd	a5,-136(s0)
    80005b40:	000c9a63          	bnez	s9,80005b54 <__printf+0x4dc>
    80005b44:	1080006f          	j	80005c4c <__printf+0x5d4>
    80005b48:	001c8c93          	addi	s9,s9,1
    80005b4c:	00000097          	auipc	ra,0x0
    80005b50:	948080e7          	jalr	-1720(ra) # 80005494 <consputc>
    80005b54:	000cc503          	lbu	a0,0(s9)
    80005b58:	fe0518e3          	bnez	a0,80005b48 <__printf+0x4d0>
    80005b5c:	f5dff06f          	j	80005ab8 <__printf+0x440>
    80005b60:	02500513          	li	a0,37
    80005b64:	00000097          	auipc	ra,0x0
    80005b68:	930080e7          	jalr	-1744(ra) # 80005494 <consputc>
    80005b6c:	000c8513          	mv	a0,s9
    80005b70:	00000097          	auipc	ra,0x0
    80005b74:	924080e7          	jalr	-1756(ra) # 80005494 <consputc>
    80005b78:	f41ff06f          	j	80005ab8 <__printf+0x440>
    80005b7c:	02500513          	li	a0,37
    80005b80:	00000097          	auipc	ra,0x0
    80005b84:	914080e7          	jalr	-1772(ra) # 80005494 <consputc>
    80005b88:	f31ff06f          	j	80005ab8 <__printf+0x440>
    80005b8c:	00030513          	mv	a0,t1
    80005b90:	00000097          	auipc	ra,0x0
    80005b94:	7bc080e7          	jalr	1980(ra) # 8000634c <acquire>
    80005b98:	b4dff06f          	j	800056e4 <__printf+0x6c>
    80005b9c:	40c0053b          	negw	a0,a2
    80005ba0:	00a00713          	li	a4,10
    80005ba4:	02e576bb          	remuw	a3,a0,a4
    80005ba8:	00002d97          	auipc	s11,0x2
    80005bac:	9e8d8d93          	addi	s11,s11,-1560 # 80007590 <digits>
    80005bb0:	ff700593          	li	a1,-9
    80005bb4:	02069693          	slli	a3,a3,0x20
    80005bb8:	0206d693          	srli	a3,a3,0x20
    80005bbc:	00dd86b3          	add	a3,s11,a3
    80005bc0:	0006c683          	lbu	a3,0(a3)
    80005bc4:	02e557bb          	divuw	a5,a0,a4
    80005bc8:	f8d40023          	sb	a3,-128(s0)
    80005bcc:	10b65e63          	bge	a2,a1,80005ce8 <__printf+0x670>
    80005bd0:	06300593          	li	a1,99
    80005bd4:	02e7f6bb          	remuw	a3,a5,a4
    80005bd8:	02069693          	slli	a3,a3,0x20
    80005bdc:	0206d693          	srli	a3,a3,0x20
    80005be0:	00dd86b3          	add	a3,s11,a3
    80005be4:	0006c683          	lbu	a3,0(a3)
    80005be8:	02e7d73b          	divuw	a4,a5,a4
    80005bec:	00200793          	li	a5,2
    80005bf0:	f8d400a3          	sb	a3,-127(s0)
    80005bf4:	bca5ece3          	bltu	a1,a0,800057cc <__printf+0x154>
    80005bf8:	ce5ff06f          	j	800058dc <__printf+0x264>
    80005bfc:	40e007bb          	negw	a5,a4
    80005c00:	00002d97          	auipc	s11,0x2
    80005c04:	990d8d93          	addi	s11,s11,-1648 # 80007590 <digits>
    80005c08:	00f7f693          	andi	a3,a5,15
    80005c0c:	00dd86b3          	add	a3,s11,a3
    80005c10:	0006c583          	lbu	a1,0(a3)
    80005c14:	ff100613          	li	a2,-15
    80005c18:	0047d69b          	srliw	a3,a5,0x4
    80005c1c:	f8b40023          	sb	a1,-128(s0)
    80005c20:	0047d59b          	srliw	a1,a5,0x4
    80005c24:	0ac75e63          	bge	a4,a2,80005ce0 <__printf+0x668>
    80005c28:	00f6f693          	andi	a3,a3,15
    80005c2c:	00dd86b3          	add	a3,s11,a3
    80005c30:	0006c603          	lbu	a2,0(a3)
    80005c34:	00f00693          	li	a3,15
    80005c38:	0087d79b          	srliw	a5,a5,0x8
    80005c3c:	f8c400a3          	sb	a2,-127(s0)
    80005c40:	d8b6e4e3          	bltu	a3,a1,800059c8 <__printf+0x350>
    80005c44:	00200793          	li	a5,2
    80005c48:	e2dff06f          	j	80005a74 <__printf+0x3fc>
    80005c4c:	00002c97          	auipc	s9,0x2
    80005c50:	924c8c93          	addi	s9,s9,-1756 # 80007570 <CONSOLE_STATUS+0x560>
    80005c54:	02800513          	li	a0,40
    80005c58:	ef1ff06f          	j	80005b48 <__printf+0x4d0>
    80005c5c:	00700793          	li	a5,7
    80005c60:	00600c93          	li	s9,6
    80005c64:	e0dff06f          	j	80005a70 <__printf+0x3f8>
    80005c68:	00700793          	li	a5,7
    80005c6c:	00600c93          	li	s9,6
    80005c70:	c69ff06f          	j	800058d8 <__printf+0x260>
    80005c74:	00300793          	li	a5,3
    80005c78:	00200c93          	li	s9,2
    80005c7c:	c5dff06f          	j	800058d8 <__printf+0x260>
    80005c80:	00300793          	li	a5,3
    80005c84:	00200c93          	li	s9,2
    80005c88:	de9ff06f          	j	80005a70 <__printf+0x3f8>
    80005c8c:	00400793          	li	a5,4
    80005c90:	00300c93          	li	s9,3
    80005c94:	dddff06f          	j	80005a70 <__printf+0x3f8>
    80005c98:	00400793          	li	a5,4
    80005c9c:	00300c93          	li	s9,3
    80005ca0:	c39ff06f          	j	800058d8 <__printf+0x260>
    80005ca4:	00500793          	li	a5,5
    80005ca8:	00400c93          	li	s9,4
    80005cac:	c2dff06f          	j	800058d8 <__printf+0x260>
    80005cb0:	00500793          	li	a5,5
    80005cb4:	00400c93          	li	s9,4
    80005cb8:	db9ff06f          	j	80005a70 <__printf+0x3f8>
    80005cbc:	00600793          	li	a5,6
    80005cc0:	00500c93          	li	s9,5
    80005cc4:	dadff06f          	j	80005a70 <__printf+0x3f8>
    80005cc8:	00600793          	li	a5,6
    80005ccc:	00500c93          	li	s9,5
    80005cd0:	c09ff06f          	j	800058d8 <__printf+0x260>
    80005cd4:	00800793          	li	a5,8
    80005cd8:	00700c93          	li	s9,7
    80005cdc:	bfdff06f          	j	800058d8 <__printf+0x260>
    80005ce0:	00100793          	li	a5,1
    80005ce4:	d91ff06f          	j	80005a74 <__printf+0x3fc>
    80005ce8:	00100793          	li	a5,1
    80005cec:	bf1ff06f          	j	800058dc <__printf+0x264>
    80005cf0:	00900793          	li	a5,9
    80005cf4:	00800c93          	li	s9,8
    80005cf8:	be1ff06f          	j	800058d8 <__printf+0x260>
    80005cfc:	00002517          	auipc	a0,0x2
    80005d00:	87c50513          	addi	a0,a0,-1924 # 80007578 <CONSOLE_STATUS+0x568>
    80005d04:	00000097          	auipc	ra,0x0
    80005d08:	918080e7          	jalr	-1768(ra) # 8000561c <panic>

0000000080005d0c <printfinit>:
    80005d0c:	fe010113          	addi	sp,sp,-32
    80005d10:	00813823          	sd	s0,16(sp)
    80005d14:	00913423          	sd	s1,8(sp)
    80005d18:	00113c23          	sd	ra,24(sp)
    80005d1c:	02010413          	addi	s0,sp,32
    80005d20:	00003497          	auipc	s1,0x3
    80005d24:	69048493          	addi	s1,s1,1680 # 800093b0 <pr>
    80005d28:	00048513          	mv	a0,s1
    80005d2c:	00002597          	auipc	a1,0x2
    80005d30:	85c58593          	addi	a1,a1,-1956 # 80007588 <CONSOLE_STATUS+0x578>
    80005d34:	00000097          	auipc	ra,0x0
    80005d38:	5f4080e7          	jalr	1524(ra) # 80006328 <initlock>
    80005d3c:	01813083          	ld	ra,24(sp)
    80005d40:	01013403          	ld	s0,16(sp)
    80005d44:	0004ac23          	sw	zero,24(s1)
    80005d48:	00813483          	ld	s1,8(sp)
    80005d4c:	02010113          	addi	sp,sp,32
    80005d50:	00008067          	ret

0000000080005d54 <uartinit>:
    80005d54:	ff010113          	addi	sp,sp,-16
    80005d58:	00813423          	sd	s0,8(sp)
    80005d5c:	01010413          	addi	s0,sp,16
    80005d60:	100007b7          	lui	a5,0x10000
    80005d64:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80005d68:	f8000713          	li	a4,-128
    80005d6c:	00e781a3          	sb	a4,3(a5)
    80005d70:	00300713          	li	a4,3
    80005d74:	00e78023          	sb	a4,0(a5)
    80005d78:	000780a3          	sb	zero,1(a5)
    80005d7c:	00e781a3          	sb	a4,3(a5)
    80005d80:	00700693          	li	a3,7
    80005d84:	00d78123          	sb	a3,2(a5)
    80005d88:	00e780a3          	sb	a4,1(a5)
    80005d8c:	00813403          	ld	s0,8(sp)
    80005d90:	01010113          	addi	sp,sp,16
    80005d94:	00008067          	ret

0000000080005d98 <uartputc>:
    80005d98:	00002797          	auipc	a5,0x2
    80005d9c:	3907a783          	lw	a5,912(a5) # 80008128 <panicked>
    80005da0:	00078463          	beqz	a5,80005da8 <uartputc+0x10>
    80005da4:	0000006f          	j	80005da4 <uartputc+0xc>
    80005da8:	fd010113          	addi	sp,sp,-48
    80005dac:	02813023          	sd	s0,32(sp)
    80005db0:	00913c23          	sd	s1,24(sp)
    80005db4:	01213823          	sd	s2,16(sp)
    80005db8:	01313423          	sd	s3,8(sp)
    80005dbc:	02113423          	sd	ra,40(sp)
    80005dc0:	03010413          	addi	s0,sp,48
    80005dc4:	00002917          	auipc	s2,0x2
    80005dc8:	36c90913          	addi	s2,s2,876 # 80008130 <uart_tx_r>
    80005dcc:	00093783          	ld	a5,0(s2)
    80005dd0:	00002497          	auipc	s1,0x2
    80005dd4:	36848493          	addi	s1,s1,872 # 80008138 <uart_tx_w>
    80005dd8:	0004b703          	ld	a4,0(s1)
    80005ddc:	02078693          	addi	a3,a5,32
    80005de0:	00050993          	mv	s3,a0
    80005de4:	02e69c63          	bne	a3,a4,80005e1c <uartputc+0x84>
    80005de8:	00001097          	auipc	ra,0x1
    80005dec:	834080e7          	jalr	-1996(ra) # 8000661c <push_on>
    80005df0:	00093783          	ld	a5,0(s2)
    80005df4:	0004b703          	ld	a4,0(s1)
    80005df8:	02078793          	addi	a5,a5,32
    80005dfc:	00e79463          	bne	a5,a4,80005e04 <uartputc+0x6c>
    80005e00:	0000006f          	j	80005e00 <uartputc+0x68>
    80005e04:	00001097          	auipc	ra,0x1
    80005e08:	88c080e7          	jalr	-1908(ra) # 80006690 <pop_on>
    80005e0c:	00093783          	ld	a5,0(s2)
    80005e10:	0004b703          	ld	a4,0(s1)
    80005e14:	02078693          	addi	a3,a5,32
    80005e18:	fce688e3          	beq	a3,a4,80005de8 <uartputc+0x50>
    80005e1c:	01f77693          	andi	a3,a4,31
    80005e20:	00003597          	auipc	a1,0x3
    80005e24:	5b058593          	addi	a1,a1,1456 # 800093d0 <uart_tx_buf>
    80005e28:	00d586b3          	add	a3,a1,a3
    80005e2c:	00170713          	addi	a4,a4,1
    80005e30:	01368023          	sb	s3,0(a3)
    80005e34:	00e4b023          	sd	a4,0(s1)
    80005e38:	10000637          	lui	a2,0x10000
    80005e3c:	02f71063          	bne	a4,a5,80005e5c <uartputc+0xc4>
    80005e40:	0340006f          	j	80005e74 <uartputc+0xdc>
    80005e44:	00074703          	lbu	a4,0(a4)
    80005e48:	00f93023          	sd	a5,0(s2)
    80005e4c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80005e50:	00093783          	ld	a5,0(s2)
    80005e54:	0004b703          	ld	a4,0(s1)
    80005e58:	00f70e63          	beq	a4,a5,80005e74 <uartputc+0xdc>
    80005e5c:	00564683          	lbu	a3,5(a2)
    80005e60:	01f7f713          	andi	a4,a5,31
    80005e64:	00e58733          	add	a4,a1,a4
    80005e68:	0206f693          	andi	a3,a3,32
    80005e6c:	00178793          	addi	a5,a5,1
    80005e70:	fc069ae3          	bnez	a3,80005e44 <uartputc+0xac>
    80005e74:	02813083          	ld	ra,40(sp)
    80005e78:	02013403          	ld	s0,32(sp)
    80005e7c:	01813483          	ld	s1,24(sp)
    80005e80:	01013903          	ld	s2,16(sp)
    80005e84:	00813983          	ld	s3,8(sp)
    80005e88:	03010113          	addi	sp,sp,48
    80005e8c:	00008067          	ret

0000000080005e90 <uartputc_sync>:
    80005e90:	ff010113          	addi	sp,sp,-16
    80005e94:	00813423          	sd	s0,8(sp)
    80005e98:	01010413          	addi	s0,sp,16
    80005e9c:	00002717          	auipc	a4,0x2
    80005ea0:	28c72703          	lw	a4,652(a4) # 80008128 <panicked>
    80005ea4:	02071663          	bnez	a4,80005ed0 <uartputc_sync+0x40>
    80005ea8:	00050793          	mv	a5,a0
    80005eac:	100006b7          	lui	a3,0x10000
    80005eb0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005eb4:	02077713          	andi	a4,a4,32
    80005eb8:	fe070ce3          	beqz	a4,80005eb0 <uartputc_sync+0x20>
    80005ebc:	0ff7f793          	andi	a5,a5,255
    80005ec0:	00f68023          	sb	a5,0(a3)
    80005ec4:	00813403          	ld	s0,8(sp)
    80005ec8:	01010113          	addi	sp,sp,16
    80005ecc:	00008067          	ret
    80005ed0:	0000006f          	j	80005ed0 <uartputc_sync+0x40>

0000000080005ed4 <uartstart>:
    80005ed4:	ff010113          	addi	sp,sp,-16
    80005ed8:	00813423          	sd	s0,8(sp)
    80005edc:	01010413          	addi	s0,sp,16
    80005ee0:	00002617          	auipc	a2,0x2
    80005ee4:	25060613          	addi	a2,a2,592 # 80008130 <uart_tx_r>
    80005ee8:	00002517          	auipc	a0,0x2
    80005eec:	25050513          	addi	a0,a0,592 # 80008138 <uart_tx_w>
    80005ef0:	00063783          	ld	a5,0(a2)
    80005ef4:	00053703          	ld	a4,0(a0)
    80005ef8:	04f70263          	beq	a4,a5,80005f3c <uartstart+0x68>
    80005efc:	100005b7          	lui	a1,0x10000
    80005f00:	00003817          	auipc	a6,0x3
    80005f04:	4d080813          	addi	a6,a6,1232 # 800093d0 <uart_tx_buf>
    80005f08:	01c0006f          	j	80005f24 <uartstart+0x50>
    80005f0c:	0006c703          	lbu	a4,0(a3)
    80005f10:	00f63023          	sd	a5,0(a2)
    80005f14:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005f18:	00063783          	ld	a5,0(a2)
    80005f1c:	00053703          	ld	a4,0(a0)
    80005f20:	00f70e63          	beq	a4,a5,80005f3c <uartstart+0x68>
    80005f24:	01f7f713          	andi	a4,a5,31
    80005f28:	00e806b3          	add	a3,a6,a4
    80005f2c:	0055c703          	lbu	a4,5(a1)
    80005f30:	00178793          	addi	a5,a5,1
    80005f34:	02077713          	andi	a4,a4,32
    80005f38:	fc071ae3          	bnez	a4,80005f0c <uartstart+0x38>
    80005f3c:	00813403          	ld	s0,8(sp)
    80005f40:	01010113          	addi	sp,sp,16
    80005f44:	00008067          	ret

0000000080005f48 <uartgetc>:
    80005f48:	ff010113          	addi	sp,sp,-16
    80005f4c:	00813423          	sd	s0,8(sp)
    80005f50:	01010413          	addi	s0,sp,16
    80005f54:	10000737          	lui	a4,0x10000
    80005f58:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80005f5c:	0017f793          	andi	a5,a5,1
    80005f60:	00078c63          	beqz	a5,80005f78 <uartgetc+0x30>
    80005f64:	00074503          	lbu	a0,0(a4)
    80005f68:	0ff57513          	andi	a0,a0,255
    80005f6c:	00813403          	ld	s0,8(sp)
    80005f70:	01010113          	addi	sp,sp,16
    80005f74:	00008067          	ret
    80005f78:	fff00513          	li	a0,-1
    80005f7c:	ff1ff06f          	j	80005f6c <uartgetc+0x24>

0000000080005f80 <uartintr>:
    80005f80:	100007b7          	lui	a5,0x10000
    80005f84:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80005f88:	0017f793          	andi	a5,a5,1
    80005f8c:	0a078463          	beqz	a5,80006034 <uartintr+0xb4>
    80005f90:	fe010113          	addi	sp,sp,-32
    80005f94:	00813823          	sd	s0,16(sp)
    80005f98:	00913423          	sd	s1,8(sp)
    80005f9c:	00113c23          	sd	ra,24(sp)
    80005fa0:	02010413          	addi	s0,sp,32
    80005fa4:	100004b7          	lui	s1,0x10000
    80005fa8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80005fac:	0ff57513          	andi	a0,a0,255
    80005fb0:	fffff097          	auipc	ra,0xfffff
    80005fb4:	534080e7          	jalr	1332(ra) # 800054e4 <consoleintr>
    80005fb8:	0054c783          	lbu	a5,5(s1)
    80005fbc:	0017f793          	andi	a5,a5,1
    80005fc0:	fe0794e3          	bnez	a5,80005fa8 <uartintr+0x28>
    80005fc4:	00002617          	auipc	a2,0x2
    80005fc8:	16c60613          	addi	a2,a2,364 # 80008130 <uart_tx_r>
    80005fcc:	00002517          	auipc	a0,0x2
    80005fd0:	16c50513          	addi	a0,a0,364 # 80008138 <uart_tx_w>
    80005fd4:	00063783          	ld	a5,0(a2)
    80005fd8:	00053703          	ld	a4,0(a0)
    80005fdc:	04f70263          	beq	a4,a5,80006020 <uartintr+0xa0>
    80005fe0:	100005b7          	lui	a1,0x10000
    80005fe4:	00003817          	auipc	a6,0x3
    80005fe8:	3ec80813          	addi	a6,a6,1004 # 800093d0 <uart_tx_buf>
    80005fec:	01c0006f          	j	80006008 <uartintr+0x88>
    80005ff0:	0006c703          	lbu	a4,0(a3)
    80005ff4:	00f63023          	sd	a5,0(a2)
    80005ff8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005ffc:	00063783          	ld	a5,0(a2)
    80006000:	00053703          	ld	a4,0(a0)
    80006004:	00f70e63          	beq	a4,a5,80006020 <uartintr+0xa0>
    80006008:	01f7f713          	andi	a4,a5,31
    8000600c:	00e806b3          	add	a3,a6,a4
    80006010:	0055c703          	lbu	a4,5(a1)
    80006014:	00178793          	addi	a5,a5,1
    80006018:	02077713          	andi	a4,a4,32
    8000601c:	fc071ae3          	bnez	a4,80005ff0 <uartintr+0x70>
    80006020:	01813083          	ld	ra,24(sp)
    80006024:	01013403          	ld	s0,16(sp)
    80006028:	00813483          	ld	s1,8(sp)
    8000602c:	02010113          	addi	sp,sp,32
    80006030:	00008067          	ret
    80006034:	00002617          	auipc	a2,0x2
    80006038:	0fc60613          	addi	a2,a2,252 # 80008130 <uart_tx_r>
    8000603c:	00002517          	auipc	a0,0x2
    80006040:	0fc50513          	addi	a0,a0,252 # 80008138 <uart_tx_w>
    80006044:	00063783          	ld	a5,0(a2)
    80006048:	00053703          	ld	a4,0(a0)
    8000604c:	04f70263          	beq	a4,a5,80006090 <uartintr+0x110>
    80006050:	100005b7          	lui	a1,0x10000
    80006054:	00003817          	auipc	a6,0x3
    80006058:	37c80813          	addi	a6,a6,892 # 800093d0 <uart_tx_buf>
    8000605c:	01c0006f          	j	80006078 <uartintr+0xf8>
    80006060:	0006c703          	lbu	a4,0(a3)
    80006064:	00f63023          	sd	a5,0(a2)
    80006068:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000606c:	00063783          	ld	a5,0(a2)
    80006070:	00053703          	ld	a4,0(a0)
    80006074:	02f70063          	beq	a4,a5,80006094 <uartintr+0x114>
    80006078:	01f7f713          	andi	a4,a5,31
    8000607c:	00e806b3          	add	a3,a6,a4
    80006080:	0055c703          	lbu	a4,5(a1)
    80006084:	00178793          	addi	a5,a5,1
    80006088:	02077713          	andi	a4,a4,32
    8000608c:	fc071ae3          	bnez	a4,80006060 <uartintr+0xe0>
    80006090:	00008067          	ret
    80006094:	00008067          	ret

0000000080006098 <kinit>:
    80006098:	fc010113          	addi	sp,sp,-64
    8000609c:	02913423          	sd	s1,40(sp)
    800060a0:	fffff7b7          	lui	a5,0xfffff
    800060a4:	00004497          	auipc	s1,0x4
    800060a8:	34b48493          	addi	s1,s1,843 # 8000a3ef <end+0xfff>
    800060ac:	02813823          	sd	s0,48(sp)
    800060b0:	01313c23          	sd	s3,24(sp)
    800060b4:	00f4f4b3          	and	s1,s1,a5
    800060b8:	02113c23          	sd	ra,56(sp)
    800060bc:	03213023          	sd	s2,32(sp)
    800060c0:	01413823          	sd	s4,16(sp)
    800060c4:	01513423          	sd	s5,8(sp)
    800060c8:	04010413          	addi	s0,sp,64
    800060cc:	000017b7          	lui	a5,0x1
    800060d0:	01100993          	li	s3,17
    800060d4:	00f487b3          	add	a5,s1,a5
    800060d8:	01b99993          	slli	s3,s3,0x1b
    800060dc:	06f9e063          	bltu	s3,a5,8000613c <kinit+0xa4>
    800060e0:	00003a97          	auipc	s5,0x3
    800060e4:	310a8a93          	addi	s5,s5,784 # 800093f0 <end>
    800060e8:	0754ec63          	bltu	s1,s5,80006160 <kinit+0xc8>
    800060ec:	0734fa63          	bgeu	s1,s3,80006160 <kinit+0xc8>
    800060f0:	00088a37          	lui	s4,0x88
    800060f4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800060f8:	00002917          	auipc	s2,0x2
    800060fc:	04890913          	addi	s2,s2,72 # 80008140 <kmem>
    80006100:	00ca1a13          	slli	s4,s4,0xc
    80006104:	0140006f          	j	80006118 <kinit+0x80>
    80006108:	000017b7          	lui	a5,0x1
    8000610c:	00f484b3          	add	s1,s1,a5
    80006110:	0554e863          	bltu	s1,s5,80006160 <kinit+0xc8>
    80006114:	0534f663          	bgeu	s1,s3,80006160 <kinit+0xc8>
    80006118:	00001637          	lui	a2,0x1
    8000611c:	00100593          	li	a1,1
    80006120:	00048513          	mv	a0,s1
    80006124:	00000097          	auipc	ra,0x0
    80006128:	5e4080e7          	jalr	1508(ra) # 80006708 <__memset>
    8000612c:	00093783          	ld	a5,0(s2)
    80006130:	00f4b023          	sd	a5,0(s1)
    80006134:	00993023          	sd	s1,0(s2)
    80006138:	fd4498e3          	bne	s1,s4,80006108 <kinit+0x70>
    8000613c:	03813083          	ld	ra,56(sp)
    80006140:	03013403          	ld	s0,48(sp)
    80006144:	02813483          	ld	s1,40(sp)
    80006148:	02013903          	ld	s2,32(sp)
    8000614c:	01813983          	ld	s3,24(sp)
    80006150:	01013a03          	ld	s4,16(sp)
    80006154:	00813a83          	ld	s5,8(sp)
    80006158:	04010113          	addi	sp,sp,64
    8000615c:	00008067          	ret
    80006160:	00001517          	auipc	a0,0x1
    80006164:	44850513          	addi	a0,a0,1096 # 800075a8 <digits+0x18>
    80006168:	fffff097          	auipc	ra,0xfffff
    8000616c:	4b4080e7          	jalr	1204(ra) # 8000561c <panic>

0000000080006170 <freerange>:
    80006170:	fc010113          	addi	sp,sp,-64
    80006174:	000017b7          	lui	a5,0x1
    80006178:	02913423          	sd	s1,40(sp)
    8000617c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006180:	009504b3          	add	s1,a0,s1
    80006184:	fffff537          	lui	a0,0xfffff
    80006188:	02813823          	sd	s0,48(sp)
    8000618c:	02113c23          	sd	ra,56(sp)
    80006190:	03213023          	sd	s2,32(sp)
    80006194:	01313c23          	sd	s3,24(sp)
    80006198:	01413823          	sd	s4,16(sp)
    8000619c:	01513423          	sd	s5,8(sp)
    800061a0:	01613023          	sd	s6,0(sp)
    800061a4:	04010413          	addi	s0,sp,64
    800061a8:	00a4f4b3          	and	s1,s1,a0
    800061ac:	00f487b3          	add	a5,s1,a5
    800061b0:	06f5e463          	bltu	a1,a5,80006218 <freerange+0xa8>
    800061b4:	00003a97          	auipc	s5,0x3
    800061b8:	23ca8a93          	addi	s5,s5,572 # 800093f0 <end>
    800061bc:	0954e263          	bltu	s1,s5,80006240 <freerange+0xd0>
    800061c0:	01100993          	li	s3,17
    800061c4:	01b99993          	slli	s3,s3,0x1b
    800061c8:	0734fc63          	bgeu	s1,s3,80006240 <freerange+0xd0>
    800061cc:	00058a13          	mv	s4,a1
    800061d0:	00002917          	auipc	s2,0x2
    800061d4:	f7090913          	addi	s2,s2,-144 # 80008140 <kmem>
    800061d8:	00002b37          	lui	s6,0x2
    800061dc:	0140006f          	j	800061f0 <freerange+0x80>
    800061e0:	000017b7          	lui	a5,0x1
    800061e4:	00f484b3          	add	s1,s1,a5
    800061e8:	0554ec63          	bltu	s1,s5,80006240 <freerange+0xd0>
    800061ec:	0534fa63          	bgeu	s1,s3,80006240 <freerange+0xd0>
    800061f0:	00001637          	lui	a2,0x1
    800061f4:	00100593          	li	a1,1
    800061f8:	00048513          	mv	a0,s1
    800061fc:	00000097          	auipc	ra,0x0
    80006200:	50c080e7          	jalr	1292(ra) # 80006708 <__memset>
    80006204:	00093703          	ld	a4,0(s2)
    80006208:	016487b3          	add	a5,s1,s6
    8000620c:	00e4b023          	sd	a4,0(s1)
    80006210:	00993023          	sd	s1,0(s2)
    80006214:	fcfa76e3          	bgeu	s4,a5,800061e0 <freerange+0x70>
    80006218:	03813083          	ld	ra,56(sp)
    8000621c:	03013403          	ld	s0,48(sp)
    80006220:	02813483          	ld	s1,40(sp)
    80006224:	02013903          	ld	s2,32(sp)
    80006228:	01813983          	ld	s3,24(sp)
    8000622c:	01013a03          	ld	s4,16(sp)
    80006230:	00813a83          	ld	s5,8(sp)
    80006234:	00013b03          	ld	s6,0(sp)
    80006238:	04010113          	addi	sp,sp,64
    8000623c:	00008067          	ret
    80006240:	00001517          	auipc	a0,0x1
    80006244:	36850513          	addi	a0,a0,872 # 800075a8 <digits+0x18>
    80006248:	fffff097          	auipc	ra,0xfffff
    8000624c:	3d4080e7          	jalr	980(ra) # 8000561c <panic>

0000000080006250 <kfree>:
    80006250:	fe010113          	addi	sp,sp,-32
    80006254:	00813823          	sd	s0,16(sp)
    80006258:	00113c23          	sd	ra,24(sp)
    8000625c:	00913423          	sd	s1,8(sp)
    80006260:	02010413          	addi	s0,sp,32
    80006264:	03451793          	slli	a5,a0,0x34
    80006268:	04079c63          	bnez	a5,800062c0 <kfree+0x70>
    8000626c:	00003797          	auipc	a5,0x3
    80006270:	18478793          	addi	a5,a5,388 # 800093f0 <end>
    80006274:	00050493          	mv	s1,a0
    80006278:	04f56463          	bltu	a0,a5,800062c0 <kfree+0x70>
    8000627c:	01100793          	li	a5,17
    80006280:	01b79793          	slli	a5,a5,0x1b
    80006284:	02f57e63          	bgeu	a0,a5,800062c0 <kfree+0x70>
    80006288:	00001637          	lui	a2,0x1
    8000628c:	00100593          	li	a1,1
    80006290:	00000097          	auipc	ra,0x0
    80006294:	478080e7          	jalr	1144(ra) # 80006708 <__memset>
    80006298:	00002797          	auipc	a5,0x2
    8000629c:	ea878793          	addi	a5,a5,-344 # 80008140 <kmem>
    800062a0:	0007b703          	ld	a4,0(a5)
    800062a4:	01813083          	ld	ra,24(sp)
    800062a8:	01013403          	ld	s0,16(sp)
    800062ac:	00e4b023          	sd	a4,0(s1)
    800062b0:	0097b023          	sd	s1,0(a5)
    800062b4:	00813483          	ld	s1,8(sp)
    800062b8:	02010113          	addi	sp,sp,32
    800062bc:	00008067          	ret
    800062c0:	00001517          	auipc	a0,0x1
    800062c4:	2e850513          	addi	a0,a0,744 # 800075a8 <digits+0x18>
    800062c8:	fffff097          	auipc	ra,0xfffff
    800062cc:	354080e7          	jalr	852(ra) # 8000561c <panic>

00000000800062d0 <kalloc>:
    800062d0:	fe010113          	addi	sp,sp,-32
    800062d4:	00813823          	sd	s0,16(sp)
    800062d8:	00913423          	sd	s1,8(sp)
    800062dc:	00113c23          	sd	ra,24(sp)
    800062e0:	02010413          	addi	s0,sp,32
    800062e4:	00002797          	auipc	a5,0x2
    800062e8:	e5c78793          	addi	a5,a5,-420 # 80008140 <kmem>
    800062ec:	0007b483          	ld	s1,0(a5)
    800062f0:	02048063          	beqz	s1,80006310 <kalloc+0x40>
    800062f4:	0004b703          	ld	a4,0(s1)
    800062f8:	00001637          	lui	a2,0x1
    800062fc:	00500593          	li	a1,5
    80006300:	00048513          	mv	a0,s1
    80006304:	00e7b023          	sd	a4,0(a5)
    80006308:	00000097          	auipc	ra,0x0
    8000630c:	400080e7          	jalr	1024(ra) # 80006708 <__memset>
    80006310:	01813083          	ld	ra,24(sp)
    80006314:	01013403          	ld	s0,16(sp)
    80006318:	00048513          	mv	a0,s1
    8000631c:	00813483          	ld	s1,8(sp)
    80006320:	02010113          	addi	sp,sp,32
    80006324:	00008067          	ret

0000000080006328 <initlock>:
    80006328:	ff010113          	addi	sp,sp,-16
    8000632c:	00813423          	sd	s0,8(sp)
    80006330:	01010413          	addi	s0,sp,16
    80006334:	00813403          	ld	s0,8(sp)
    80006338:	00b53423          	sd	a1,8(a0)
    8000633c:	00052023          	sw	zero,0(a0)
    80006340:	00053823          	sd	zero,16(a0)
    80006344:	01010113          	addi	sp,sp,16
    80006348:	00008067          	ret

000000008000634c <acquire>:
    8000634c:	fe010113          	addi	sp,sp,-32
    80006350:	00813823          	sd	s0,16(sp)
    80006354:	00913423          	sd	s1,8(sp)
    80006358:	00113c23          	sd	ra,24(sp)
    8000635c:	01213023          	sd	s2,0(sp)
    80006360:	02010413          	addi	s0,sp,32
    80006364:	00050493          	mv	s1,a0
    80006368:	10002973          	csrr	s2,sstatus
    8000636c:	100027f3          	csrr	a5,sstatus
    80006370:	ffd7f793          	andi	a5,a5,-3
    80006374:	10079073          	csrw	sstatus,a5
    80006378:	fffff097          	auipc	ra,0xfffff
    8000637c:	8e8080e7          	jalr	-1816(ra) # 80004c60 <mycpu>
    80006380:	07852783          	lw	a5,120(a0)
    80006384:	06078e63          	beqz	a5,80006400 <acquire+0xb4>
    80006388:	fffff097          	auipc	ra,0xfffff
    8000638c:	8d8080e7          	jalr	-1832(ra) # 80004c60 <mycpu>
    80006390:	07852783          	lw	a5,120(a0)
    80006394:	0004a703          	lw	a4,0(s1)
    80006398:	0017879b          	addiw	a5,a5,1
    8000639c:	06f52c23          	sw	a5,120(a0)
    800063a0:	04071063          	bnez	a4,800063e0 <acquire+0x94>
    800063a4:	00100713          	li	a4,1
    800063a8:	00070793          	mv	a5,a4
    800063ac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800063b0:	0007879b          	sext.w	a5,a5
    800063b4:	fe079ae3          	bnez	a5,800063a8 <acquire+0x5c>
    800063b8:	0ff0000f          	fence
    800063bc:	fffff097          	auipc	ra,0xfffff
    800063c0:	8a4080e7          	jalr	-1884(ra) # 80004c60 <mycpu>
    800063c4:	01813083          	ld	ra,24(sp)
    800063c8:	01013403          	ld	s0,16(sp)
    800063cc:	00a4b823          	sd	a0,16(s1)
    800063d0:	00013903          	ld	s2,0(sp)
    800063d4:	00813483          	ld	s1,8(sp)
    800063d8:	02010113          	addi	sp,sp,32
    800063dc:	00008067          	ret
    800063e0:	0104b903          	ld	s2,16(s1)
    800063e4:	fffff097          	auipc	ra,0xfffff
    800063e8:	87c080e7          	jalr	-1924(ra) # 80004c60 <mycpu>
    800063ec:	faa91ce3          	bne	s2,a0,800063a4 <acquire+0x58>
    800063f0:	00001517          	auipc	a0,0x1
    800063f4:	1c050513          	addi	a0,a0,448 # 800075b0 <digits+0x20>
    800063f8:	fffff097          	auipc	ra,0xfffff
    800063fc:	224080e7          	jalr	548(ra) # 8000561c <panic>
    80006400:	00195913          	srli	s2,s2,0x1
    80006404:	fffff097          	auipc	ra,0xfffff
    80006408:	85c080e7          	jalr	-1956(ra) # 80004c60 <mycpu>
    8000640c:	00197913          	andi	s2,s2,1
    80006410:	07252e23          	sw	s2,124(a0)
    80006414:	f75ff06f          	j	80006388 <acquire+0x3c>

0000000080006418 <release>:
    80006418:	fe010113          	addi	sp,sp,-32
    8000641c:	00813823          	sd	s0,16(sp)
    80006420:	00113c23          	sd	ra,24(sp)
    80006424:	00913423          	sd	s1,8(sp)
    80006428:	01213023          	sd	s2,0(sp)
    8000642c:	02010413          	addi	s0,sp,32
    80006430:	00052783          	lw	a5,0(a0)
    80006434:	00079a63          	bnez	a5,80006448 <release+0x30>
    80006438:	00001517          	auipc	a0,0x1
    8000643c:	18050513          	addi	a0,a0,384 # 800075b8 <digits+0x28>
    80006440:	fffff097          	auipc	ra,0xfffff
    80006444:	1dc080e7          	jalr	476(ra) # 8000561c <panic>
    80006448:	01053903          	ld	s2,16(a0)
    8000644c:	00050493          	mv	s1,a0
    80006450:	fffff097          	auipc	ra,0xfffff
    80006454:	810080e7          	jalr	-2032(ra) # 80004c60 <mycpu>
    80006458:	fea910e3          	bne	s2,a0,80006438 <release+0x20>
    8000645c:	0004b823          	sd	zero,16(s1)
    80006460:	0ff0000f          	fence
    80006464:	0f50000f          	fence	iorw,ow
    80006468:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000646c:	ffffe097          	auipc	ra,0xffffe
    80006470:	7f4080e7          	jalr	2036(ra) # 80004c60 <mycpu>
    80006474:	100027f3          	csrr	a5,sstatus
    80006478:	0027f793          	andi	a5,a5,2
    8000647c:	04079a63          	bnez	a5,800064d0 <release+0xb8>
    80006480:	07852783          	lw	a5,120(a0)
    80006484:	02f05e63          	blez	a5,800064c0 <release+0xa8>
    80006488:	fff7871b          	addiw	a4,a5,-1
    8000648c:	06e52c23          	sw	a4,120(a0)
    80006490:	00071c63          	bnez	a4,800064a8 <release+0x90>
    80006494:	07c52783          	lw	a5,124(a0)
    80006498:	00078863          	beqz	a5,800064a8 <release+0x90>
    8000649c:	100027f3          	csrr	a5,sstatus
    800064a0:	0027e793          	ori	a5,a5,2
    800064a4:	10079073          	csrw	sstatus,a5
    800064a8:	01813083          	ld	ra,24(sp)
    800064ac:	01013403          	ld	s0,16(sp)
    800064b0:	00813483          	ld	s1,8(sp)
    800064b4:	00013903          	ld	s2,0(sp)
    800064b8:	02010113          	addi	sp,sp,32
    800064bc:	00008067          	ret
    800064c0:	00001517          	auipc	a0,0x1
    800064c4:	11850513          	addi	a0,a0,280 # 800075d8 <digits+0x48>
    800064c8:	fffff097          	auipc	ra,0xfffff
    800064cc:	154080e7          	jalr	340(ra) # 8000561c <panic>
    800064d0:	00001517          	auipc	a0,0x1
    800064d4:	0f050513          	addi	a0,a0,240 # 800075c0 <digits+0x30>
    800064d8:	fffff097          	auipc	ra,0xfffff
    800064dc:	144080e7          	jalr	324(ra) # 8000561c <panic>

00000000800064e0 <holding>:
    800064e0:	00052783          	lw	a5,0(a0)
    800064e4:	00079663          	bnez	a5,800064f0 <holding+0x10>
    800064e8:	00000513          	li	a0,0
    800064ec:	00008067          	ret
    800064f0:	fe010113          	addi	sp,sp,-32
    800064f4:	00813823          	sd	s0,16(sp)
    800064f8:	00913423          	sd	s1,8(sp)
    800064fc:	00113c23          	sd	ra,24(sp)
    80006500:	02010413          	addi	s0,sp,32
    80006504:	01053483          	ld	s1,16(a0)
    80006508:	ffffe097          	auipc	ra,0xffffe
    8000650c:	758080e7          	jalr	1880(ra) # 80004c60 <mycpu>
    80006510:	01813083          	ld	ra,24(sp)
    80006514:	01013403          	ld	s0,16(sp)
    80006518:	40a48533          	sub	a0,s1,a0
    8000651c:	00153513          	seqz	a0,a0
    80006520:	00813483          	ld	s1,8(sp)
    80006524:	02010113          	addi	sp,sp,32
    80006528:	00008067          	ret

000000008000652c <push_off>:
    8000652c:	fe010113          	addi	sp,sp,-32
    80006530:	00813823          	sd	s0,16(sp)
    80006534:	00113c23          	sd	ra,24(sp)
    80006538:	00913423          	sd	s1,8(sp)
    8000653c:	02010413          	addi	s0,sp,32
    80006540:	100024f3          	csrr	s1,sstatus
    80006544:	100027f3          	csrr	a5,sstatus
    80006548:	ffd7f793          	andi	a5,a5,-3
    8000654c:	10079073          	csrw	sstatus,a5
    80006550:	ffffe097          	auipc	ra,0xffffe
    80006554:	710080e7          	jalr	1808(ra) # 80004c60 <mycpu>
    80006558:	07852783          	lw	a5,120(a0)
    8000655c:	02078663          	beqz	a5,80006588 <push_off+0x5c>
    80006560:	ffffe097          	auipc	ra,0xffffe
    80006564:	700080e7          	jalr	1792(ra) # 80004c60 <mycpu>
    80006568:	07852783          	lw	a5,120(a0)
    8000656c:	01813083          	ld	ra,24(sp)
    80006570:	01013403          	ld	s0,16(sp)
    80006574:	0017879b          	addiw	a5,a5,1
    80006578:	06f52c23          	sw	a5,120(a0)
    8000657c:	00813483          	ld	s1,8(sp)
    80006580:	02010113          	addi	sp,sp,32
    80006584:	00008067          	ret
    80006588:	0014d493          	srli	s1,s1,0x1
    8000658c:	ffffe097          	auipc	ra,0xffffe
    80006590:	6d4080e7          	jalr	1748(ra) # 80004c60 <mycpu>
    80006594:	0014f493          	andi	s1,s1,1
    80006598:	06952e23          	sw	s1,124(a0)
    8000659c:	fc5ff06f          	j	80006560 <push_off+0x34>

00000000800065a0 <pop_off>:
    800065a0:	ff010113          	addi	sp,sp,-16
    800065a4:	00813023          	sd	s0,0(sp)
    800065a8:	00113423          	sd	ra,8(sp)
    800065ac:	01010413          	addi	s0,sp,16
    800065b0:	ffffe097          	auipc	ra,0xffffe
    800065b4:	6b0080e7          	jalr	1712(ra) # 80004c60 <mycpu>
    800065b8:	100027f3          	csrr	a5,sstatus
    800065bc:	0027f793          	andi	a5,a5,2
    800065c0:	04079663          	bnez	a5,8000660c <pop_off+0x6c>
    800065c4:	07852783          	lw	a5,120(a0)
    800065c8:	02f05a63          	blez	a5,800065fc <pop_off+0x5c>
    800065cc:	fff7871b          	addiw	a4,a5,-1
    800065d0:	06e52c23          	sw	a4,120(a0)
    800065d4:	00071c63          	bnez	a4,800065ec <pop_off+0x4c>
    800065d8:	07c52783          	lw	a5,124(a0)
    800065dc:	00078863          	beqz	a5,800065ec <pop_off+0x4c>
    800065e0:	100027f3          	csrr	a5,sstatus
    800065e4:	0027e793          	ori	a5,a5,2
    800065e8:	10079073          	csrw	sstatus,a5
    800065ec:	00813083          	ld	ra,8(sp)
    800065f0:	00013403          	ld	s0,0(sp)
    800065f4:	01010113          	addi	sp,sp,16
    800065f8:	00008067          	ret
    800065fc:	00001517          	auipc	a0,0x1
    80006600:	fdc50513          	addi	a0,a0,-36 # 800075d8 <digits+0x48>
    80006604:	fffff097          	auipc	ra,0xfffff
    80006608:	018080e7          	jalr	24(ra) # 8000561c <panic>
    8000660c:	00001517          	auipc	a0,0x1
    80006610:	fb450513          	addi	a0,a0,-76 # 800075c0 <digits+0x30>
    80006614:	fffff097          	auipc	ra,0xfffff
    80006618:	008080e7          	jalr	8(ra) # 8000561c <panic>

000000008000661c <push_on>:
    8000661c:	fe010113          	addi	sp,sp,-32
    80006620:	00813823          	sd	s0,16(sp)
    80006624:	00113c23          	sd	ra,24(sp)
    80006628:	00913423          	sd	s1,8(sp)
    8000662c:	02010413          	addi	s0,sp,32
    80006630:	100024f3          	csrr	s1,sstatus
    80006634:	100027f3          	csrr	a5,sstatus
    80006638:	0027e793          	ori	a5,a5,2
    8000663c:	10079073          	csrw	sstatus,a5
    80006640:	ffffe097          	auipc	ra,0xffffe
    80006644:	620080e7          	jalr	1568(ra) # 80004c60 <mycpu>
    80006648:	07852783          	lw	a5,120(a0)
    8000664c:	02078663          	beqz	a5,80006678 <push_on+0x5c>
    80006650:	ffffe097          	auipc	ra,0xffffe
    80006654:	610080e7          	jalr	1552(ra) # 80004c60 <mycpu>
    80006658:	07852783          	lw	a5,120(a0)
    8000665c:	01813083          	ld	ra,24(sp)
    80006660:	01013403          	ld	s0,16(sp)
    80006664:	0017879b          	addiw	a5,a5,1
    80006668:	06f52c23          	sw	a5,120(a0)
    8000666c:	00813483          	ld	s1,8(sp)
    80006670:	02010113          	addi	sp,sp,32
    80006674:	00008067          	ret
    80006678:	0014d493          	srli	s1,s1,0x1
    8000667c:	ffffe097          	auipc	ra,0xffffe
    80006680:	5e4080e7          	jalr	1508(ra) # 80004c60 <mycpu>
    80006684:	0014f493          	andi	s1,s1,1
    80006688:	06952e23          	sw	s1,124(a0)
    8000668c:	fc5ff06f          	j	80006650 <push_on+0x34>

0000000080006690 <pop_on>:
    80006690:	ff010113          	addi	sp,sp,-16
    80006694:	00813023          	sd	s0,0(sp)
    80006698:	00113423          	sd	ra,8(sp)
    8000669c:	01010413          	addi	s0,sp,16
    800066a0:	ffffe097          	auipc	ra,0xffffe
    800066a4:	5c0080e7          	jalr	1472(ra) # 80004c60 <mycpu>
    800066a8:	100027f3          	csrr	a5,sstatus
    800066ac:	0027f793          	andi	a5,a5,2
    800066b0:	04078463          	beqz	a5,800066f8 <pop_on+0x68>
    800066b4:	07852783          	lw	a5,120(a0)
    800066b8:	02f05863          	blez	a5,800066e8 <pop_on+0x58>
    800066bc:	fff7879b          	addiw	a5,a5,-1
    800066c0:	06f52c23          	sw	a5,120(a0)
    800066c4:	07853783          	ld	a5,120(a0)
    800066c8:	00079863          	bnez	a5,800066d8 <pop_on+0x48>
    800066cc:	100027f3          	csrr	a5,sstatus
    800066d0:	ffd7f793          	andi	a5,a5,-3
    800066d4:	10079073          	csrw	sstatus,a5
    800066d8:	00813083          	ld	ra,8(sp)
    800066dc:	00013403          	ld	s0,0(sp)
    800066e0:	01010113          	addi	sp,sp,16
    800066e4:	00008067          	ret
    800066e8:	00001517          	auipc	a0,0x1
    800066ec:	f1850513          	addi	a0,a0,-232 # 80007600 <digits+0x70>
    800066f0:	fffff097          	auipc	ra,0xfffff
    800066f4:	f2c080e7          	jalr	-212(ra) # 8000561c <panic>
    800066f8:	00001517          	auipc	a0,0x1
    800066fc:	ee850513          	addi	a0,a0,-280 # 800075e0 <digits+0x50>
    80006700:	fffff097          	auipc	ra,0xfffff
    80006704:	f1c080e7          	jalr	-228(ra) # 8000561c <panic>

0000000080006708 <__memset>:
    80006708:	ff010113          	addi	sp,sp,-16
    8000670c:	00813423          	sd	s0,8(sp)
    80006710:	01010413          	addi	s0,sp,16
    80006714:	1a060e63          	beqz	a2,800068d0 <__memset+0x1c8>
    80006718:	40a007b3          	neg	a5,a0
    8000671c:	0077f793          	andi	a5,a5,7
    80006720:	00778693          	addi	a3,a5,7
    80006724:	00b00813          	li	a6,11
    80006728:	0ff5f593          	andi	a1,a1,255
    8000672c:	fff6071b          	addiw	a4,a2,-1
    80006730:	1b06e663          	bltu	a3,a6,800068dc <__memset+0x1d4>
    80006734:	1cd76463          	bltu	a4,a3,800068fc <__memset+0x1f4>
    80006738:	1a078e63          	beqz	a5,800068f4 <__memset+0x1ec>
    8000673c:	00b50023          	sb	a1,0(a0)
    80006740:	00100713          	li	a4,1
    80006744:	1ae78463          	beq	a5,a4,800068ec <__memset+0x1e4>
    80006748:	00b500a3          	sb	a1,1(a0)
    8000674c:	00200713          	li	a4,2
    80006750:	1ae78a63          	beq	a5,a4,80006904 <__memset+0x1fc>
    80006754:	00b50123          	sb	a1,2(a0)
    80006758:	00300713          	li	a4,3
    8000675c:	18e78463          	beq	a5,a4,800068e4 <__memset+0x1dc>
    80006760:	00b501a3          	sb	a1,3(a0)
    80006764:	00400713          	li	a4,4
    80006768:	1ae78263          	beq	a5,a4,8000690c <__memset+0x204>
    8000676c:	00b50223          	sb	a1,4(a0)
    80006770:	00500713          	li	a4,5
    80006774:	1ae78063          	beq	a5,a4,80006914 <__memset+0x20c>
    80006778:	00b502a3          	sb	a1,5(a0)
    8000677c:	00700713          	li	a4,7
    80006780:	18e79e63          	bne	a5,a4,8000691c <__memset+0x214>
    80006784:	00b50323          	sb	a1,6(a0)
    80006788:	00700e93          	li	t4,7
    8000678c:	00859713          	slli	a4,a1,0x8
    80006790:	00e5e733          	or	a4,a1,a4
    80006794:	01059e13          	slli	t3,a1,0x10
    80006798:	01c76e33          	or	t3,a4,t3
    8000679c:	01859313          	slli	t1,a1,0x18
    800067a0:	006e6333          	or	t1,t3,t1
    800067a4:	02059893          	slli	a7,a1,0x20
    800067a8:	40f60e3b          	subw	t3,a2,a5
    800067ac:	011368b3          	or	a7,t1,a7
    800067b0:	02859813          	slli	a6,a1,0x28
    800067b4:	0108e833          	or	a6,a7,a6
    800067b8:	03059693          	slli	a3,a1,0x30
    800067bc:	003e589b          	srliw	a7,t3,0x3
    800067c0:	00d866b3          	or	a3,a6,a3
    800067c4:	03859713          	slli	a4,a1,0x38
    800067c8:	00389813          	slli	a6,a7,0x3
    800067cc:	00f507b3          	add	a5,a0,a5
    800067d0:	00e6e733          	or	a4,a3,a4
    800067d4:	000e089b          	sext.w	a7,t3
    800067d8:	00f806b3          	add	a3,a6,a5
    800067dc:	00e7b023          	sd	a4,0(a5)
    800067e0:	00878793          	addi	a5,a5,8
    800067e4:	fed79ce3          	bne	a5,a3,800067dc <__memset+0xd4>
    800067e8:	ff8e7793          	andi	a5,t3,-8
    800067ec:	0007871b          	sext.w	a4,a5
    800067f0:	01d787bb          	addw	a5,a5,t4
    800067f4:	0ce88e63          	beq	a7,a4,800068d0 <__memset+0x1c8>
    800067f8:	00f50733          	add	a4,a0,a5
    800067fc:	00b70023          	sb	a1,0(a4)
    80006800:	0017871b          	addiw	a4,a5,1
    80006804:	0cc77663          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006808:	00e50733          	add	a4,a0,a4
    8000680c:	00b70023          	sb	a1,0(a4)
    80006810:	0027871b          	addiw	a4,a5,2
    80006814:	0ac77e63          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006818:	00e50733          	add	a4,a0,a4
    8000681c:	00b70023          	sb	a1,0(a4)
    80006820:	0037871b          	addiw	a4,a5,3
    80006824:	0ac77663          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006828:	00e50733          	add	a4,a0,a4
    8000682c:	00b70023          	sb	a1,0(a4)
    80006830:	0047871b          	addiw	a4,a5,4
    80006834:	08c77e63          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006838:	00e50733          	add	a4,a0,a4
    8000683c:	00b70023          	sb	a1,0(a4)
    80006840:	0057871b          	addiw	a4,a5,5
    80006844:	08c77663          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006848:	00e50733          	add	a4,a0,a4
    8000684c:	00b70023          	sb	a1,0(a4)
    80006850:	0067871b          	addiw	a4,a5,6
    80006854:	06c77e63          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006858:	00e50733          	add	a4,a0,a4
    8000685c:	00b70023          	sb	a1,0(a4)
    80006860:	0077871b          	addiw	a4,a5,7
    80006864:	06c77663          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006868:	00e50733          	add	a4,a0,a4
    8000686c:	00b70023          	sb	a1,0(a4)
    80006870:	0087871b          	addiw	a4,a5,8
    80006874:	04c77e63          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006878:	00e50733          	add	a4,a0,a4
    8000687c:	00b70023          	sb	a1,0(a4)
    80006880:	0097871b          	addiw	a4,a5,9
    80006884:	04c77663          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006888:	00e50733          	add	a4,a0,a4
    8000688c:	00b70023          	sb	a1,0(a4)
    80006890:	00a7871b          	addiw	a4,a5,10
    80006894:	02c77e63          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    80006898:	00e50733          	add	a4,a0,a4
    8000689c:	00b70023          	sb	a1,0(a4)
    800068a0:	00b7871b          	addiw	a4,a5,11
    800068a4:	02c77663          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    800068a8:	00e50733          	add	a4,a0,a4
    800068ac:	00b70023          	sb	a1,0(a4)
    800068b0:	00c7871b          	addiw	a4,a5,12
    800068b4:	00c77e63          	bgeu	a4,a2,800068d0 <__memset+0x1c8>
    800068b8:	00e50733          	add	a4,a0,a4
    800068bc:	00b70023          	sb	a1,0(a4)
    800068c0:	00d7879b          	addiw	a5,a5,13
    800068c4:	00c7f663          	bgeu	a5,a2,800068d0 <__memset+0x1c8>
    800068c8:	00f507b3          	add	a5,a0,a5
    800068cc:	00b78023          	sb	a1,0(a5)
    800068d0:	00813403          	ld	s0,8(sp)
    800068d4:	01010113          	addi	sp,sp,16
    800068d8:	00008067          	ret
    800068dc:	00b00693          	li	a3,11
    800068e0:	e55ff06f          	j	80006734 <__memset+0x2c>
    800068e4:	00300e93          	li	t4,3
    800068e8:	ea5ff06f          	j	8000678c <__memset+0x84>
    800068ec:	00100e93          	li	t4,1
    800068f0:	e9dff06f          	j	8000678c <__memset+0x84>
    800068f4:	00000e93          	li	t4,0
    800068f8:	e95ff06f          	j	8000678c <__memset+0x84>
    800068fc:	00000793          	li	a5,0
    80006900:	ef9ff06f          	j	800067f8 <__memset+0xf0>
    80006904:	00200e93          	li	t4,2
    80006908:	e85ff06f          	j	8000678c <__memset+0x84>
    8000690c:	00400e93          	li	t4,4
    80006910:	e7dff06f          	j	8000678c <__memset+0x84>
    80006914:	00500e93          	li	t4,5
    80006918:	e75ff06f          	j	8000678c <__memset+0x84>
    8000691c:	00600e93          	li	t4,6
    80006920:	e6dff06f          	j	8000678c <__memset+0x84>

0000000080006924 <__memmove>:
    80006924:	ff010113          	addi	sp,sp,-16
    80006928:	00813423          	sd	s0,8(sp)
    8000692c:	01010413          	addi	s0,sp,16
    80006930:	0e060863          	beqz	a2,80006a20 <__memmove+0xfc>
    80006934:	fff6069b          	addiw	a3,a2,-1
    80006938:	0006881b          	sext.w	a6,a3
    8000693c:	0ea5e863          	bltu	a1,a0,80006a2c <__memmove+0x108>
    80006940:	00758713          	addi	a4,a1,7
    80006944:	00a5e7b3          	or	a5,a1,a0
    80006948:	40a70733          	sub	a4,a4,a0
    8000694c:	0077f793          	andi	a5,a5,7
    80006950:	00f73713          	sltiu	a4,a4,15
    80006954:	00174713          	xori	a4,a4,1
    80006958:	0017b793          	seqz	a5,a5
    8000695c:	00e7f7b3          	and	a5,a5,a4
    80006960:	10078863          	beqz	a5,80006a70 <__memmove+0x14c>
    80006964:	00900793          	li	a5,9
    80006968:	1107f463          	bgeu	a5,a6,80006a70 <__memmove+0x14c>
    8000696c:	0036581b          	srliw	a6,a2,0x3
    80006970:	fff8081b          	addiw	a6,a6,-1
    80006974:	02081813          	slli	a6,a6,0x20
    80006978:	01d85893          	srli	a7,a6,0x1d
    8000697c:	00858813          	addi	a6,a1,8
    80006980:	00058793          	mv	a5,a1
    80006984:	00050713          	mv	a4,a0
    80006988:	01088833          	add	a6,a7,a6
    8000698c:	0007b883          	ld	a7,0(a5)
    80006990:	00878793          	addi	a5,a5,8
    80006994:	00870713          	addi	a4,a4,8
    80006998:	ff173c23          	sd	a7,-8(a4)
    8000699c:	ff0798e3          	bne	a5,a6,8000698c <__memmove+0x68>
    800069a0:	ff867713          	andi	a4,a2,-8
    800069a4:	02071793          	slli	a5,a4,0x20
    800069a8:	0207d793          	srli	a5,a5,0x20
    800069ac:	00f585b3          	add	a1,a1,a5
    800069b0:	40e686bb          	subw	a3,a3,a4
    800069b4:	00f507b3          	add	a5,a0,a5
    800069b8:	06e60463          	beq	a2,a4,80006a20 <__memmove+0xfc>
    800069bc:	0005c703          	lbu	a4,0(a1)
    800069c0:	00e78023          	sb	a4,0(a5)
    800069c4:	04068e63          	beqz	a3,80006a20 <__memmove+0xfc>
    800069c8:	0015c603          	lbu	a2,1(a1)
    800069cc:	00100713          	li	a4,1
    800069d0:	00c780a3          	sb	a2,1(a5)
    800069d4:	04e68663          	beq	a3,a4,80006a20 <__memmove+0xfc>
    800069d8:	0025c603          	lbu	a2,2(a1)
    800069dc:	00200713          	li	a4,2
    800069e0:	00c78123          	sb	a2,2(a5)
    800069e4:	02e68e63          	beq	a3,a4,80006a20 <__memmove+0xfc>
    800069e8:	0035c603          	lbu	a2,3(a1)
    800069ec:	00300713          	li	a4,3
    800069f0:	00c781a3          	sb	a2,3(a5)
    800069f4:	02e68663          	beq	a3,a4,80006a20 <__memmove+0xfc>
    800069f8:	0045c603          	lbu	a2,4(a1)
    800069fc:	00400713          	li	a4,4
    80006a00:	00c78223          	sb	a2,4(a5)
    80006a04:	00e68e63          	beq	a3,a4,80006a20 <__memmove+0xfc>
    80006a08:	0055c603          	lbu	a2,5(a1)
    80006a0c:	00500713          	li	a4,5
    80006a10:	00c782a3          	sb	a2,5(a5)
    80006a14:	00e68663          	beq	a3,a4,80006a20 <__memmove+0xfc>
    80006a18:	0065c703          	lbu	a4,6(a1)
    80006a1c:	00e78323          	sb	a4,6(a5)
    80006a20:	00813403          	ld	s0,8(sp)
    80006a24:	01010113          	addi	sp,sp,16
    80006a28:	00008067          	ret
    80006a2c:	02061713          	slli	a4,a2,0x20
    80006a30:	02075713          	srli	a4,a4,0x20
    80006a34:	00e587b3          	add	a5,a1,a4
    80006a38:	f0f574e3          	bgeu	a0,a5,80006940 <__memmove+0x1c>
    80006a3c:	02069613          	slli	a2,a3,0x20
    80006a40:	02065613          	srli	a2,a2,0x20
    80006a44:	fff64613          	not	a2,a2
    80006a48:	00e50733          	add	a4,a0,a4
    80006a4c:	00c78633          	add	a2,a5,a2
    80006a50:	fff7c683          	lbu	a3,-1(a5)
    80006a54:	fff78793          	addi	a5,a5,-1
    80006a58:	fff70713          	addi	a4,a4,-1
    80006a5c:	00d70023          	sb	a3,0(a4)
    80006a60:	fec798e3          	bne	a5,a2,80006a50 <__memmove+0x12c>
    80006a64:	00813403          	ld	s0,8(sp)
    80006a68:	01010113          	addi	sp,sp,16
    80006a6c:	00008067          	ret
    80006a70:	02069713          	slli	a4,a3,0x20
    80006a74:	02075713          	srli	a4,a4,0x20
    80006a78:	00170713          	addi	a4,a4,1
    80006a7c:	00e50733          	add	a4,a0,a4
    80006a80:	00050793          	mv	a5,a0
    80006a84:	0005c683          	lbu	a3,0(a1)
    80006a88:	00178793          	addi	a5,a5,1
    80006a8c:	00158593          	addi	a1,a1,1
    80006a90:	fed78fa3          	sb	a3,-1(a5)
    80006a94:	fee798e3          	bne	a5,a4,80006a84 <__memmove+0x160>
    80006a98:	f89ff06f          	j	80006a20 <__memmove+0xfc>

0000000080006a9c <__putc>:
    80006a9c:	fe010113          	addi	sp,sp,-32
    80006aa0:	00813823          	sd	s0,16(sp)
    80006aa4:	00113c23          	sd	ra,24(sp)
    80006aa8:	02010413          	addi	s0,sp,32
    80006aac:	00050793          	mv	a5,a0
    80006ab0:	fef40593          	addi	a1,s0,-17
    80006ab4:	00100613          	li	a2,1
    80006ab8:	00000513          	li	a0,0
    80006abc:	fef407a3          	sb	a5,-17(s0)
    80006ac0:	fffff097          	auipc	ra,0xfffff
    80006ac4:	b3c080e7          	jalr	-1220(ra) # 800055fc <console_write>
    80006ac8:	01813083          	ld	ra,24(sp)
    80006acc:	01013403          	ld	s0,16(sp)
    80006ad0:	02010113          	addi	sp,sp,32
    80006ad4:	00008067          	ret

0000000080006ad8 <__getc>:
    80006ad8:	fe010113          	addi	sp,sp,-32
    80006adc:	00813823          	sd	s0,16(sp)
    80006ae0:	00113c23          	sd	ra,24(sp)
    80006ae4:	02010413          	addi	s0,sp,32
    80006ae8:	fe840593          	addi	a1,s0,-24
    80006aec:	00100613          	li	a2,1
    80006af0:	00000513          	li	a0,0
    80006af4:	fffff097          	auipc	ra,0xfffff
    80006af8:	ae8080e7          	jalr	-1304(ra) # 800055dc <console_read>
    80006afc:	fe844503          	lbu	a0,-24(s0)
    80006b00:	01813083          	ld	ra,24(sp)
    80006b04:	01013403          	ld	s0,16(sp)
    80006b08:	02010113          	addi	sp,sp,32
    80006b0c:	00008067          	ret

0000000080006b10 <console_handler>:
    80006b10:	fe010113          	addi	sp,sp,-32
    80006b14:	00813823          	sd	s0,16(sp)
    80006b18:	00113c23          	sd	ra,24(sp)
    80006b1c:	00913423          	sd	s1,8(sp)
    80006b20:	02010413          	addi	s0,sp,32
    80006b24:	14202773          	csrr	a4,scause
    80006b28:	100027f3          	csrr	a5,sstatus
    80006b2c:	0027f793          	andi	a5,a5,2
    80006b30:	06079e63          	bnez	a5,80006bac <console_handler+0x9c>
    80006b34:	00074c63          	bltz	a4,80006b4c <console_handler+0x3c>
    80006b38:	01813083          	ld	ra,24(sp)
    80006b3c:	01013403          	ld	s0,16(sp)
    80006b40:	00813483          	ld	s1,8(sp)
    80006b44:	02010113          	addi	sp,sp,32
    80006b48:	00008067          	ret
    80006b4c:	0ff77713          	andi	a4,a4,255
    80006b50:	00900793          	li	a5,9
    80006b54:	fef712e3          	bne	a4,a5,80006b38 <console_handler+0x28>
    80006b58:	ffffe097          	auipc	ra,0xffffe
    80006b5c:	6dc080e7          	jalr	1756(ra) # 80005234 <plic_claim>
    80006b60:	00a00793          	li	a5,10
    80006b64:	00050493          	mv	s1,a0
    80006b68:	02f50c63          	beq	a0,a5,80006ba0 <console_handler+0x90>
    80006b6c:	fc0506e3          	beqz	a0,80006b38 <console_handler+0x28>
    80006b70:	00050593          	mv	a1,a0
    80006b74:	00001517          	auipc	a0,0x1
    80006b78:	99450513          	addi	a0,a0,-1644 # 80007508 <CONSOLE_STATUS+0x4f8>
    80006b7c:	fffff097          	auipc	ra,0xfffff
    80006b80:	afc080e7          	jalr	-1284(ra) # 80005678 <__printf>
    80006b84:	01013403          	ld	s0,16(sp)
    80006b88:	01813083          	ld	ra,24(sp)
    80006b8c:	00048513          	mv	a0,s1
    80006b90:	00813483          	ld	s1,8(sp)
    80006b94:	02010113          	addi	sp,sp,32
    80006b98:	ffffe317          	auipc	t1,0xffffe
    80006b9c:	6d430067          	jr	1748(t1) # 8000526c <plic_complete>
    80006ba0:	fffff097          	auipc	ra,0xfffff
    80006ba4:	3e0080e7          	jalr	992(ra) # 80005f80 <uartintr>
    80006ba8:	fddff06f          	j	80006b84 <console_handler+0x74>
    80006bac:	00001517          	auipc	a0,0x1
    80006bb0:	a5c50513          	addi	a0,a0,-1444 # 80007608 <digits+0x78>
    80006bb4:	fffff097          	auipc	ra,0xfffff
    80006bb8:	a68080e7          	jalr	-1432(ra) # 8000561c <panic>
	...
