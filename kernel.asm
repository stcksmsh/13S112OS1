
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	c8013103          	ld	sp,-896(sp) # 80006c80 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	365030ef          	jal	ra,80003b80 <start>

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
    8000107c:	57c020ef          	jal	ra,800035f8 <exceptionHandler>


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
    8000111c:	bc87b783          	ld	a5,-1080(a5) # 80006ce0 <_ZN5Timer8instanceE>
    80001120:	02079463          	bnez	a5,80001148 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80001124:	00006797          	auipc	a5,0x6
    80001128:	ba97be23          	sd	s1,-1092(a5) # 80006ce0 <_ZN5Timer8instanceE>
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
    80001158:	68c080e7          	jalr	1676(ra) # 800017e0 <_Z13assert_failedPKci>
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
    800011ac:	b387b783          	ld	a5,-1224(a5) # 80006ce0 <_ZN5Timer8instanceE>
    800011b0:	00078863          	beqz	a5,800011c0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800011b4:	00006517          	auipc	a0,0x6
    800011b8:	b2c53503          	ld	a0,-1236(a0) # 80006ce0 <_ZN5Timer8instanceE>
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
    800011e0:	604080e7          	jalr	1540(ra) # 800017e0 <_Z13assert_failedPKci>
}
    800011e4:	00006517          	auipc	a0,0x6
    800011e8:	afc53503          	ld	a0,-1284(a0) # 80006ce0 <_ZN5Timer8instanceE>
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
    80001224:	33c080e7          	jalr	828(ra) # 8000155c <_Z4putcc>
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
    80001254:	d18080e7          	jalr	-744(ra) # 80001f68 <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    80001258:	0004b503          	ld	a0,0(s1)
    8000125c:	00002097          	auipc	ra,0x2
    80001260:	634080e7          	jalr	1588(ra) # 80003890 <_ZN9Scheduler3putEP7_thread>
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
    800012c0:	9dc7b783          	ld	a5,-1572(a5) # 80006c98 <_GLOBAL_OFFSET_TABLE_+0x30>
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
    80001318:	c54080e7          	jalr	-940(ra) # 80001f68 <_ZN7_thread11setSleepingEb>
    putc('s');
    8000131c:	07300513          	li	a0,115
    80001320:	00000097          	auipc	ra,0x0
    80001324:	23c080e7          	jalr	572(ra) # 8000155c <_Z4putcc>
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

000000008000144c <_Z12thread_sleepm>:

// void thread_join ( thread_t );

int thread_sleep( time_t duration){
    8000144c:	ff010113          	addi	sp,sp,-16
    80001450:	00813423          	sd	s0,8(sp)
    80001454:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    80001458:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    8000145c:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001460:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001464:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001468:	0005051b          	sext.w	a0,a0
    8000146c:	00813403          	ld	s0,8(sp)
    80001470:	01010113          	addi	sp,sp,16
    80001474:	00008067          	ret

0000000080001478 <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init) {
    80001478:	ff010113          	addi	sp,sp,-16
    8000147c:	00813423          	sd	s0,8(sp)
    80001480:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    80001484:	02059593          	slli	a1,a1,0x20
    80001488:	0205d593          	srli	a1,a1,0x20
    8000148c:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    80001490:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    80001494:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    80001498:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    8000149c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800014a0:	0005051b          	sext.w	a0,a0
    800014a4:	00813403          	ld	s0,8(sp)
    800014a8:	01010113          	addi	sp,sp,16
    800014ac:	00008067          	ret

00000000800014b0 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle) {
    800014b0:	ff010113          	addi	sp,sp,-16
    800014b4:	00813423          	sd	s0,8(sp)
    800014b8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800014bc:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    800014c0:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    800014c4:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800014c8:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800014cc:	0005051b          	sext.w	a0,a0
    800014d0:	00813403          	ld	s0,8(sp)
    800014d4:	01010113          	addi	sp,sp,16
    800014d8:	00008067          	ret

00000000800014dc <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle) {
    800014dc:	ff010113          	addi	sp,sp,-16
    800014e0:	00813423          	sd	s0,8(sp)
    800014e4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800014e8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    800014ec:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    800014f0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800014f4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800014f8:	0005051b          	sext.w	a0,a0
    800014fc:	00813403          	ld	s0,8(sp)
    80001500:	01010113          	addi	sp,sp,16
    80001504:	00008067          	ret

0000000080001508 <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle) {
    80001508:	ff010113          	addi	sp,sp,-16
    8000150c:	00813423          	sd	s0,8(sp)
    80001510:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001514:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    80001518:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    8000151c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001520:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001524:	0005051b          	sext.w	a0,a0
    80001528:	00813403          	ld	s0,8(sp)
    8000152c:	01010113          	addi	sp,sp,16
    80001530:	00008067          	ret

0000000080001534 <_Z4getcv>:

char getc(){
    80001534:	ff010113          	addi	sp,sp,-16
    80001538:	00813423          	sd	s0,8(sp)
    8000153c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    80001540:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    80001544:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    80001548:	00050513          	mv	a0,a0
    return chr;
}
    8000154c:	0ff57513          	andi	a0,a0,255
    80001550:	00813403          	ld	s0,8(sp)
    80001554:	01010113          	addi	sp,sp,16
    80001558:	00008067          	ret

000000008000155c <_Z4putcc>:

#include "console.h"

void putc(char chr)
{
    8000155c:	ff010113          	addi	sp,sp,-16
    80001560:	00813423          	sd	s0,8(sp)
    80001564:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    80001568:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    8000156c:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80001570:	00000073          	ecall
    80001574:	00813403          	ld	s0,8(sp)
    80001578:	01010113          	addi	sp,sp,16
    8000157c:	00008067          	ret

0000000080001580 <_ZN4_sem4openEPPS_j>:
#include "sem.h"
#include "syscalls_c.h"
#include "assert.h"
#include "sched.h"

void _sem::open(_sem** handle, unsigned init){
    80001580:	ff010113          	addi	sp,sp,-16
    80001584:	00813423          	sd	s0,8(sp)
    80001588:	01010413          	addi	s0,sp,16
    (*handle)->blockHead = nullptr;
    8000158c:	00053783          	ld	a5,0(a0)
    80001590:	0007b023          	sd	zero,0(a5)
    (*handle)->blockTail = nullptr;
    80001594:	00053783          	ld	a5,0(a0)
    80001598:	0007b423          	sd	zero,8(a5)
    (*handle)->value = init;
    8000159c:	00053783          	ld	a5,0(a0)
    800015a0:	00b7a823          	sw	a1,16(a5)
}
    800015a4:	00813403          	ld	s0,8(sp)
    800015a8:	01010113          	addi	sp,sp,16
    800015ac:	00008067          	ret

00000000800015b0 <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    800015b0:	fe010113          	addi	sp,sp,-32
    800015b4:	00113c23          	sd	ra,24(sp)
    800015b8:	00813823          	sd	s0,16(sp)
    800015bc:	00913423          	sd	s1,8(sp)
    800015c0:	02010413          	addi	s0,sp,32
    800015c4:	00050493          	mv	s1,a0
    while(id->blockHead != nullptr){
    800015c8:	0004b783          	ld	a5,0(s1)
    800015cc:	02078863          	beqz	a5,800015fc <_ZN4_sem5closeEPS_+0x4c>
        id->blockHead->pThread->setClosed(true);
    800015d0:	00100593          	li	a1,1
    800015d4:	0007b503          	ld	a0,0(a5)
    800015d8:	00001097          	auipc	ra,0x1
    800015dc:	964080e7          	jalr	-1692(ra) # 80001f3c <_ZN7_thread9setClosedEb>
        mem_free(id->blockHead);
    800015e0:	0004b503          	ld	a0,0(s1)
    800015e4:	00000097          	auipc	ra,0x0
    800015e8:	dc4080e7          	jalr	-572(ra) # 800013a8 <_Z8mem_freePv>
        id->blockHead = id->blockHead->pNext;
    800015ec:	0004b783          	ld	a5,0(s1)
    800015f0:	0087b783          	ld	a5,8(a5)
    800015f4:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != nullptr){
    800015f8:	fd1ff06f          	j	800015c8 <_ZN4_sem5closeEPS_+0x18>
    }
}
    800015fc:	01813083          	ld	ra,24(sp)
    80001600:	01013403          	ld	s0,16(sp)
    80001604:	00813483          	ld	s1,8(sp)
    80001608:	02010113          	addi	sp,sp,32
    8000160c:	00008067          	ret

0000000080001610 <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    80001610:	01052783          	lw	a5,16(a0)
    80001614:	fff7879b          	addiw	a5,a5,-1
    80001618:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    8000161c:	02079713          	slli	a4,a5,0x20
    80001620:	00074463          	bltz	a4,80001628 <_ZN4_sem4waitEPS_+0x18>
    80001624:	00008067          	ret
void _sem::wait(sem_t id){
    80001628:	fe010113          	addi	sp,sp,-32
    8000162c:	00113c23          	sd	ra,24(sp)
    80001630:	00813823          	sd	s0,16(sp)
    80001634:	00913423          	sd	s1,8(sp)
    80001638:	02010413          	addi	s0,sp,32
    8000163c:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    80001640:	01000513          	li	a0,16
    80001644:	00000097          	auipc	ra,0x0
    80001648:	d34080e7          	jalr	-716(ra) # 80001378 <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    8000164c:	00005797          	auipc	a5,0x5
    80001650:	64c7b783          	ld	a5,1612(a5) # 80006c98 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001654:	0007b783          	ld	a5,0(a5)
    80001658:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = nullptr;
    8000165c:	00053423          	sd	zero,8(a0)
        if(id->blockHead == nullptr){
    80001660:	0004b783          	ld	a5,0(s1)
    80001664:	04078263          	beqz	a5,800016a8 <_ZN4_sem4waitEPS_+0x98>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    80001668:	0084b783          	ld	a5,8(s1)
    8000166c:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    80001670:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    80001674:	00100593          	li	a1,1
    80001678:	00005797          	auipc	a5,0x5
    8000167c:	6207b783          	ld	a5,1568(a5) # 80006c98 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001680:	0007b503          	ld	a0,0(a5)
    80001684:	00001097          	auipc	ra,0x1
    80001688:	888080e7          	jalr	-1912(ra) # 80001f0c <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    8000168c:	00001097          	auipc	ra,0x1
    80001690:	a24080e7          	jalr	-1500(ra) # 800020b0 <_ZN7_thread8dispatchEv>
    }
}
    80001694:	01813083          	ld	ra,24(sp)
    80001698:	01013403          	ld	s0,16(sp)
    8000169c:	00813483          	ld	s1,8(sp)
    800016a0:	02010113          	addi	sp,sp,32
    800016a4:	00008067          	ret
            id->blockHead = pNewBlock;
    800016a8:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    800016ac:	00a4b423          	sd	a0,8(s1)
    800016b0:	fc5ff06f          	j	80001674 <_ZN4_sem4waitEPS_+0x64>

00000000800016b4 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    800016b4:	01052783          	lw	a5,16(a0)
    800016b8:	0017879b          	addiw	a5,a5,1
    800016bc:	0007871b          	sext.w	a4,a5
    800016c0:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    800016c4:	00e05463          	blez	a4,800016cc <_ZN4_sem6signalEPS_+0x18>
    800016c8:	00008067          	ret
void _sem::signal(sem_t id){
    800016cc:	fe010113          	addi	sp,sp,-32
    800016d0:	00113c23          	sd	ra,24(sp)
    800016d4:	00813823          	sd	s0,16(sp)
    800016d8:	00913423          	sd	s1,8(sp)
    800016dc:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    800016e0:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    800016e4:	0084b783          	ld	a5,8(s1)
    800016e8:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == nullptr){
    800016ec:	04078063          	beqz	a5,8000172c <_ZN4_sem6signalEPS_+0x78>
            id->blockTail = nullptr;
        }
        pUnblock->pThread->setBlocked(false);
    800016f0:	00000593          	li	a1,0
    800016f4:	0004b503          	ld	a0,0(s1)
    800016f8:	00001097          	auipc	ra,0x1
    800016fc:	814080e7          	jalr	-2028(ra) # 80001f0c <_ZN7_thread10setBlockedEb>
        Scheduler::put(pUnblock->pThread);
    80001700:	0004b503          	ld	a0,0(s1)
    80001704:	00002097          	auipc	ra,0x2
    80001708:	18c080e7          	jalr	396(ra) # 80003890 <_ZN9Scheduler3putEP7_thread>
        mem_free(pUnblock);
    8000170c:	00048513          	mv	a0,s1
    80001710:	00000097          	auipc	ra,0x0
    80001714:	c98080e7          	jalr	-872(ra) # 800013a8 <_Z8mem_freePv>
    }
    80001718:	01813083          	ld	ra,24(sp)
    8000171c:	01013403          	ld	s0,16(sp)
    80001720:	00813483          	ld	s1,8(sp)
    80001724:	02010113          	addi	sp,sp,32
    80001728:	00008067          	ret
            id->blockTail = nullptr;
    8000172c:	00053423          	sd	zero,8(a0)
    80001730:	fc1ff06f          	j	800016f0 <_ZN4_sem6signalEPS_+0x3c>

0000000080001734 <main>:

#include "kernel.h"
#include "assert.h"

/// @brief first function to be called
void main(){
    80001734:	fb010113          	addi	sp,sp,-80
    80001738:	04113423          	sd	ra,72(sp)
    8000173c:	04813023          	sd	s0,64(sp)
    80001740:	02913c23          	sd	s1,56(sp)
    80001744:	05010413          	addi	s0,sp,80
    Kernel kernel = Kernel();
    80001748:	fb040493          	addi	s1,s0,-80
    8000174c:	00048513          	mv	a0,s1
    80001750:	00000097          	auipc	ra,0x0
    80001754:	388080e7          	jalr	904(ra) # 80001ad8 <_ZN6KernelC1Ev>
    kernel.initialise();
    80001758:	00048513          	mv	a0,s1
    8000175c:	00000097          	auipc	ra,0x0
    80001760:	3f0080e7          	jalr	1008(ra) # 80001b4c <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    80001764:	00048513          	mv	a0,s1
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	440080e7          	jalr	1088(ra) # 80001ba8 <_ZN6Kernel3runEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001770:	02051863          	bnez	a0,800017a0 <main+0x6c>
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    80001774:	fd040513          	addi	a0,s0,-48
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	9e8080e7          	jalr	-1560(ra) # 80001160 <_ZN5TimerD1Ev>
    80001780:	fb040513          	addi	a0,s0,-80
    80001784:	00001097          	auipc	ra,0x1
    80001788:	a94080e7          	jalr	-1388(ra) # 80002218 <_ZN11HeapManagerD1Ev>
    8000178c:	04813083          	ld	ra,72(sp)
    80001790:	04013403          	ld	s0,64(sp)
    80001794:	03813483          	ld	s1,56(sp)
    80001798:	05010113          	addi	sp,sp,80
    8000179c:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    800017a0:	01400593          	li	a1,20
    800017a4:	00005517          	auipc	a0,0x5
    800017a8:	88c50513          	addi	a0,a0,-1908 # 80006030 <CONSOLE_STATUS+0x20>
    800017ac:	00000097          	auipc	ra,0x0
    800017b0:	034080e7          	jalr	52(ra) # 800017e0 <_Z13assert_failedPKci>
    800017b4:	fc1ff06f          	j	80001774 <main+0x40>
    800017b8:	00050493          	mv	s1,a0
    800017bc:	fd040513          	addi	a0,s0,-48
    800017c0:	00000097          	auipc	ra,0x0
    800017c4:	9a0080e7          	jalr	-1632(ra) # 80001160 <_ZN5TimerD1Ev>
    800017c8:	fb040513          	addi	a0,s0,-80
    800017cc:	00001097          	auipc	ra,0x1
    800017d0:	a4c080e7          	jalr	-1460(ra) # 80002218 <_ZN11HeapManagerD1Ev>
    800017d4:	00048513          	mv	a0,s1
    800017d8:	00006097          	auipc	ra,0x6
    800017dc:	600080e7          	jalr	1536(ra) # 80007dd8 <_Unwind_Resume>

00000000800017e0 <_Z13assert_failedPKci>:
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char* file, int line ){
    800017e0:	fc010113          	addi	sp,sp,-64
    800017e4:	02113c23          	sd	ra,56(sp)
    800017e8:	02813823          	sd	s0,48(sp)
    800017ec:	02913423          	sd	s1,40(sp)
    800017f0:	03213023          	sd	s2,32(sp)
    800017f4:	04010413          	addi	s0,sp,64
    800017f8:	00050493          	mv	s1,a0
    800017fc:	00058913          	mv	s2,a1
    putc('\n');
    80001800:	00a00513          	li	a0,10
    80001804:	00000097          	auipc	ra,0x0
    80001808:	d58080e7          	jalr	-680(ra) # 8000155c <_Z4putcc>
    putc('A');
    8000180c:	04100513          	li	a0,65
    80001810:	00000097          	auipc	ra,0x0
    80001814:	d4c080e7          	jalr	-692(ra) # 8000155c <_Z4putcc>
    putc('s');
    80001818:	07300513          	li	a0,115
    8000181c:	00000097          	auipc	ra,0x0
    80001820:	d40080e7          	jalr	-704(ra) # 8000155c <_Z4putcc>
    putc('s');
    80001824:	07300513          	li	a0,115
    80001828:	00000097          	auipc	ra,0x0
    8000182c:	d34080e7          	jalr	-716(ra) # 8000155c <_Z4putcc>
    putc('e');
    80001830:	06500513          	li	a0,101
    80001834:	00000097          	auipc	ra,0x0
    80001838:	d28080e7          	jalr	-728(ra) # 8000155c <_Z4putcc>
    putc('r');
    8000183c:	07200513          	li	a0,114
    80001840:	00000097          	auipc	ra,0x0
    80001844:	d1c080e7          	jalr	-740(ra) # 8000155c <_Z4putcc>
    putc('t');
    80001848:	07400513          	li	a0,116
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	d10080e7          	jalr	-752(ra) # 8000155c <_Z4putcc>
    putc('i');
    80001854:	06900513          	li	a0,105
    80001858:	00000097          	auipc	ra,0x0
    8000185c:	d04080e7          	jalr	-764(ra) # 8000155c <_Z4putcc>
    putc('o');
    80001860:	06f00513          	li	a0,111
    80001864:	00000097          	auipc	ra,0x0
    80001868:	cf8080e7          	jalr	-776(ra) # 8000155c <_Z4putcc>
    putc('n');
    8000186c:	06e00513          	li	a0,110
    80001870:	00000097          	auipc	ra,0x0
    80001874:	cec080e7          	jalr	-788(ra) # 8000155c <_Z4putcc>
    putc(' ');
    80001878:	02000513          	li	a0,32
    8000187c:	00000097          	auipc	ra,0x0
    80001880:	ce0080e7          	jalr	-800(ra) # 8000155c <_Z4putcc>
    putc('f');
    80001884:	06600513          	li	a0,102
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	cd4080e7          	jalr	-812(ra) # 8000155c <_Z4putcc>
    putc('a');
    80001890:	06100513          	li	a0,97
    80001894:	00000097          	auipc	ra,0x0
    80001898:	cc8080e7          	jalr	-824(ra) # 8000155c <_Z4putcc>
    putc('i');
    8000189c:	06900513          	li	a0,105
    800018a0:	00000097          	auipc	ra,0x0
    800018a4:	cbc080e7          	jalr	-836(ra) # 8000155c <_Z4putcc>
    putc('l');
    800018a8:	06c00513          	li	a0,108
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	cb0080e7          	jalr	-848(ra) # 8000155c <_Z4putcc>
    putc('e');
    800018b4:	06500513          	li	a0,101
    800018b8:	00000097          	auipc	ra,0x0
    800018bc:	ca4080e7          	jalr	-860(ra) # 8000155c <_Z4putcc>
    putc('d');
    800018c0:	06400513          	li	a0,100
    800018c4:	00000097          	auipc	ra,0x0
    800018c8:	c98080e7          	jalr	-872(ra) # 8000155c <_Z4putcc>
    putc(' ');
    800018cc:	02000513          	li	a0,32
    800018d0:	00000097          	auipc	ra,0x0
    800018d4:	c8c080e7          	jalr	-884(ra) # 8000155c <_Z4putcc>
    putc('i');
    800018d8:	06900513          	li	a0,105
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	c80080e7          	jalr	-896(ra) # 8000155c <_Z4putcc>
    putc('n');
    800018e4:	06e00513          	li	a0,110
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	c74080e7          	jalr	-908(ra) # 8000155c <_Z4putcc>
    putc(' ');
    800018f0:	02000513          	li	a0,32
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	c68080e7          	jalr	-920(ra) # 8000155c <_Z4putcc>
    putc('f');
    800018fc:	06600513          	li	a0,102
    80001900:	00000097          	auipc	ra,0x0
    80001904:	c5c080e7          	jalr	-932(ra) # 8000155c <_Z4putcc>
    putc('i');
    80001908:	06900513          	li	a0,105
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	c50080e7          	jalr	-944(ra) # 8000155c <_Z4putcc>
    putc('l');
    80001914:	06c00513          	li	a0,108
    80001918:	00000097          	auipc	ra,0x0
    8000191c:	c44080e7          	jalr	-956(ra) # 8000155c <_Z4putcc>
    putc('e');
    80001920:	06500513          	li	a0,101
    80001924:	00000097          	auipc	ra,0x0
    80001928:	c38080e7          	jalr	-968(ra) # 8000155c <_Z4putcc>
    putc(':');
    8000192c:	03a00513          	li	a0,58
    80001930:	00000097          	auipc	ra,0x0
    80001934:	c2c080e7          	jalr	-980(ra) # 8000155c <_Z4putcc>
    putc(' ');
    80001938:	02000513          	li	a0,32
    8000193c:	00000097          	auipc	ra,0x0
    80001940:	c20080e7          	jalr	-992(ra) # 8000155c <_Z4putcc>
    while(*file != 0){
    80001944:	0004c503          	lbu	a0,0(s1)
    80001948:	00050a63          	beqz	a0,8000195c <_Z13assert_failedPKci+0x17c>
        putc(*file);
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	c10080e7          	jalr	-1008(ra) # 8000155c <_Z4putcc>
        file++;
    80001954:	00148493          	addi	s1,s1,1
    while(*file != 0){
    80001958:	fedff06f          	j	80001944 <_Z13assert_failedPKci+0x164>
    }
    putc('\n');
    8000195c:	00a00513          	li	a0,10
    80001960:	00000097          	auipc	ra,0x0
    80001964:	bfc080e7          	jalr	-1028(ra) # 8000155c <_Z4putcc>
    putc('l');
    80001968:	06c00513          	li	a0,108
    8000196c:	00000097          	auipc	ra,0x0
    80001970:	bf0080e7          	jalr	-1040(ra) # 8000155c <_Z4putcc>
    putc('i');
    80001974:	06900513          	li	a0,105
    80001978:	00000097          	auipc	ra,0x0
    8000197c:	be4080e7          	jalr	-1052(ra) # 8000155c <_Z4putcc>
    putc('n');
    80001980:	06e00513          	li	a0,110
    80001984:	00000097          	auipc	ra,0x0
    80001988:	bd8080e7          	jalr	-1064(ra) # 8000155c <_Z4putcc>
    putc('e');
    8000198c:	06500513          	li	a0,101
    80001990:	00000097          	auipc	ra,0x0
    80001994:	bcc080e7          	jalr	-1076(ra) # 8000155c <_Z4putcc>
    putc(':');
    80001998:	03a00513          	li	a0,58
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	bc0080e7          	jalr	-1088(ra) # 8000155c <_Z4putcc>
    putc(' ');
    800019a4:	02000513          	li	a0,32
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	bb4080e7          	jalr	-1100(ra) # 8000155c <_Z4putcc>
    char buffer[20];
    int i = 0;
    800019b0:	00000493          	li	s1,0
    while(line != 0){
    800019b4:	02090463          	beqz	s2,800019dc <_Z13assert_failedPKci+0x1fc>
        buffer[i] = line % 10 + '0';
    800019b8:	00a00713          	li	a4,10
    800019bc:	02e967bb          	remw	a5,s2,a4
    800019c0:	0307879b          	addiw	a5,a5,48
    800019c4:	fe040693          	addi	a3,s0,-32
    800019c8:	009686b3          	add	a3,a3,s1
    800019cc:	fef68423          	sb	a5,-24(a3)
        line /= 10;
    800019d0:	02e9493b          	divw	s2,s2,a4
        i++;
    800019d4:	0014849b          	addiw	s1,s1,1
    while(line != 0){
    800019d8:	fddff06f          	j	800019b4 <_Z13assert_failedPKci+0x1d4>
    }
    while(i != 0){
    800019dc:	02048063          	beqz	s1,800019fc <_Z13assert_failedPKci+0x21c>
        i--;
    800019e0:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    800019e4:	fe040793          	addi	a5,s0,-32
    800019e8:	009787b3          	add	a5,a5,s1
    800019ec:	fe87c503          	lbu	a0,-24(a5)
    800019f0:	00000097          	auipc	ra,0x0
    800019f4:	b6c080e7          	jalr	-1172(ra) # 8000155c <_Z4putcc>
    800019f8:	fe5ff06f          	j	800019dc <_Z13assert_failedPKci+0x1fc>
    }
    putc('\n');
    800019fc:	00a00513          	li	a0,10
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	b5c080e7          	jalr	-1188(ra) # 8000155c <_Z4putcc>
    while(1);
    80001a08:	0000006f          	j	80001a08 <_Z13assert_failedPKci+0x228>

0000000080001a0c <_Z8testFuncPv>:
    return;
}

sem_t sem = nullptr;

void testFunc(void* arg){
    80001a0c:	ff010113          	addi	sp,sp,-16
    80001a10:	00113423          	sd	ra,8(sp)
    80001a14:	00813023          	sd	s0,0(sp)
    80001a18:	01010413          	addi	s0,sp,16
    putc('t');
    80001a1c:	07400513          	li	a0,116
    80001a20:	00000097          	auipc	ra,0x0
    80001a24:	b3c080e7          	jalr	-1220(ra) # 8000155c <_Z4putcc>
    putc('e');
    80001a28:	06500513          	li	a0,101
    80001a2c:	00000097          	auipc	ra,0x0
    80001a30:	b30080e7          	jalr	-1232(ra) # 8000155c <_Z4putcc>
    putc('s');
    80001a34:	07300513          	li	a0,115
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	b24080e7          	jalr	-1244(ra) # 8000155c <_Z4putcc>
    putc('t');
    80001a40:	07400513          	li	a0,116
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	b18080e7          	jalr	-1256(ra) # 8000155c <_Z4putcc>

    sem_wait(sem);
    80001a4c:	00005517          	auipc	a0,0x5
    80001a50:	29c53503          	ld	a0,668(a0) # 80006ce8 <sem>
    80001a54:	00000097          	auipc	ra,0x0
    80001a58:	a88080e7          	jalr	-1400(ra) # 800014dc <_Z8sem_waitP4_sem>

    putc(' ');
    80001a5c:	02000513          	li	a0,32
    80001a60:	00000097          	auipc	ra,0x0
    80001a64:	afc080e7          	jalr	-1284(ra) # 8000155c <_Z4putcc>

    thread_sleep(100);
    80001a68:	06400513          	li	a0,100
    80001a6c:	00000097          	auipc	ra,0x0
    80001a70:	9e0080e7          	jalr	-1568(ra) # 8000144c <_Z12thread_sleepm>

    putc('t');
    80001a74:	07400513          	li	a0,116
    80001a78:	00000097          	auipc	ra,0x0
    80001a7c:	ae4080e7          	jalr	-1308(ra) # 8000155c <_Z4putcc>
    putc('h');
    80001a80:	06800513          	li	a0,104
    80001a84:	00000097          	auipc	ra,0x0
    80001a88:	ad8080e7          	jalr	-1320(ra) # 8000155c <_Z4putcc>
    putc('r');
    80001a8c:	07200513          	li	a0,114
    80001a90:	00000097          	auipc	ra,0x0
    80001a94:	acc080e7          	jalr	-1332(ra) # 8000155c <_Z4putcc>
    putc('e');
    80001a98:	06500513          	li	a0,101
    80001a9c:	00000097          	auipc	ra,0x0
    80001aa0:	ac0080e7          	jalr	-1344(ra) # 8000155c <_Z4putcc>
    putc('a');
    80001aa4:	06100513          	li	a0,97
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	ab4080e7          	jalr	-1356(ra) # 8000155c <_Z4putcc>
    putc('d');
    80001ab0:	06400513          	li	a0,100
    80001ab4:	00000097          	auipc	ra,0x0
    80001ab8:	aa8080e7          	jalr	-1368(ra) # 8000155c <_Z4putcc>
    putc('\n');
    80001abc:	00a00513          	li	a0,10
    80001ac0:	00000097          	auipc	ra,0x0
    80001ac4:	a9c080e7          	jalr	-1380(ra) # 8000155c <_Z4putcc>
}
    80001ac8:	00813083          	ld	ra,8(sp)
    80001acc:	00013403          	ld	s0,0(sp)
    80001ad0:	01010113          	addi	sp,sp,16
    80001ad4:	00008067          	ret

0000000080001ad8 <_ZN6KernelC1Ev>:
Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80001ad8:	fe010113          	addi	sp,sp,-32
    80001adc:	00113c23          	sd	ra,24(sp)
    80001ae0:	00813823          	sd	s0,16(sp)
    80001ae4:	00913423          	sd	s1,8(sp)
    80001ae8:	01213023          	sd	s2,0(sp)
    80001aec:	02010413          	addi	s0,sp,32
    80001af0:	00050493          	mv	s1,a0
    80001af4:	00000097          	auipc	ra,0x0
    80001af8:	6cc080e7          	jalr	1740(ra) # 800021c0 <_ZN11HeapManagerC1Ev>
    80001afc:	01048513          	addi	a0,s1,16
    80001b00:	00002097          	auipc	ra,0x2
    80001b04:	d08080e7          	jalr	-760(ra) # 80003808 <_ZN9SchedulerC1Ev>
    80001b08:	02048513          	addi	a0,s1,32
    80001b0c:	fffff097          	auipc	ra,0xfffff
    80001b10:	5f4080e7          	jalr	1524(ra) # 80001100 <_ZN5TimerC1Ev>
    80001b14:	0200006f          	j	80001b34 <_ZN6KernelC1Ev+0x5c>
    80001b18:	00050913          	mv	s2,a0
    80001b1c:	00048513          	mv	a0,s1
    80001b20:	00000097          	auipc	ra,0x0
    80001b24:	6f8080e7          	jalr	1784(ra) # 80002218 <_ZN11HeapManagerD1Ev>
    80001b28:	00090513          	mv	a0,s2
    80001b2c:	00006097          	auipc	ra,0x6
    80001b30:	2ac080e7          	jalr	684(ra) # 80007dd8 <_Unwind_Resume>
    80001b34:	01813083          	ld	ra,24(sp)
    80001b38:	01013403          	ld	s0,16(sp)
    80001b3c:	00813483          	ld	s1,8(sp)
    80001b40:	00013903          	ld	s2,0(sp)
    80001b44:	02010113          	addi	sp,sp,32
    80001b48:	00008067          	ret

0000000080001b4c <_ZN6Kernel10initialiseEv>:
void Kernel::initialise(){
    80001b4c:	ff010113          	addi	sp,sp,-16
    80001b50:	00113423          	sd	ra,8(sp)
    80001b54:	00813023          	sd	s0,0(sp)
    80001b58:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80001b5c:	00005797          	auipc	a5,0x5
    80001b60:	12c7b783          	ld	a5,300(a5) # 80006c88 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001b64:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrs sie, 1"); /// sets bit 1 of sie, enables interrupts
    80001b68:	1040e073          	csrsi	sie,1
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80001b6c:	100027f3          	csrr	a5,sstatus
    sstatus &= ~(1 << 8);
    80001b70:	eff7f793          	andi	a5,a5,-257
    __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80001b74:	10079073          	csrw	sstatus,a5
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );
    80001b78:	00005797          	auipc	a5,0x5
    80001b7c:	1187b783          	ld	a5,280(a5) # 80006c90 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001b80:	0007b603          	ld	a2,0(a5)
    80001b84:	00005797          	auipc	a5,0x5
    80001b88:	0ec7b783          	ld	a5,236(a5) # 80006c70 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001b8c:	0007b583          	ld	a1,0(a5)
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	6a0080e7          	jalr	1696(ra) # 80002230 <_ZN11HeapManager4initEmm>
}
    80001b98:	00813083          	ld	ra,8(sp)
    80001b9c:	00013403          	ld	s0,0(sp)
    80001ba0:	01010113          	addi	sp,sp,16
    80001ba4:	00008067          	ret

0000000080001ba8 <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    80001ba8:	fd010113          	addi	sp,sp,-48
    80001bac:	02113423          	sd	ra,40(sp)
    80001bb0:	02813023          	sd	s0,32(sp)
    80001bb4:	00913c23          	sd	s1,24(sp)
    80001bb8:	03010413          	addi	s0,sp,48
    
    thread_t t = (thread_t)mem_alloc(sizeof(_thread));
    80001bbc:	0b000513          	li	a0,176
    80001bc0:	fffff097          	auipc	ra,0xfffff
    80001bc4:	7b8080e7          	jalr	1976(ra) # 80001378 <_Z9mem_allocm>
    80001bc8:	fca43c23          	sd	a0,-40(s0)
    
    // _thread::create(&t, nullptr, nullptr, nullptr, false);
    // _thread::currentThread = t;

    thread_create(&t, nullptr, nullptr);
    80001bcc:	00000613          	li	a2,0
    80001bd0:	00000593          	li	a1,0
    80001bd4:	fd840513          	addi	a0,s0,-40
    80001bd8:	fffff097          	auipc	ra,0xfffff
    80001bdc:	7fc080e7          	jalr	2044(ra) # 800013d4 <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80001be0:	00002097          	auipc	ra,0x2
    80001be4:	ea0080e7          	jalr	-352(ra) # 80003a80 <_ZN9Scheduler3getEv>
    80001be8:	00005797          	auipc	a5,0x5
    80001bec:	0b07b783          	ld	a5,176(a5) # 80006c98 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001bf0:	00a7b023          	sd	a0,0(a5)

    thread_t test = (thread_t)mem_alloc(sizeof(_thread));
    80001bf4:	0b000513          	li	a0,176
    80001bf8:	fffff097          	auipc	ra,0xfffff
    80001bfc:	780080e7          	jalr	1920(ra) # 80001378 <_Z9mem_allocm>
    80001c00:	fca43823          	sd	a0,-48(s0)
    
    // _thread::create(&test, testFunc, nullptr, nullptr);
    thread_create(&test, testFunc, nullptr);
    80001c04:	00000613          	li	a2,0
    80001c08:	00000597          	auipc	a1,0x0
    80001c0c:	e0458593          	addi	a1,a1,-508 # 80001a0c <_Z8testFuncPv>
    80001c10:	fd040513          	addi	a0,s0,-48
    80001c14:	fffff097          	auipc	ra,0xfffff
    80001c18:	7c0080e7          	jalr	1984(ra) # 800013d4 <_Z13thread_createPP7_threadPFvPvES2_>

    sem = (sem_t)mem_alloc(sizeof(_sem));
    80001c1c:	01800513          	li	a0,24
    80001c20:	fffff097          	auipc	ra,0xfffff
    80001c24:	758080e7          	jalr	1880(ra) # 80001378 <_Z9mem_allocm>
    80001c28:	00005497          	auipc	s1,0x5
    80001c2c:	0c048493          	addi	s1,s1,192 # 80006ce8 <sem>
    80001c30:	00a4b023          	sd	a0,0(s1)
    sem_open(&sem, 0);
    80001c34:	00000593          	li	a1,0
    80001c38:	00048513          	mv	a0,s1
    80001c3c:	00000097          	auipc	ra,0x0
    80001c40:	83c080e7          	jalr	-1988(ra) # 80001478 <_Z8sem_openPP4_semj>


    thread_dispatch();
    80001c44:	fffff097          	auipc	ra,0xfffff
    80001c48:	7e8080e7          	jalr	2024(ra) # 8000142c <_Z15thread_dispatchv>
    sem_signal(sem);
    80001c4c:	0004b503          	ld	a0,0(s1)
    80001c50:	00000097          	auipc	ra,0x0
    80001c54:	8b8080e7          	jalr	-1864(ra) # 80001508 <_Z10sem_signalP4_sem>
    do{
       thread_dispatch();
    80001c58:	fffff097          	auipc	ra,0xfffff
    80001c5c:	7d4080e7          	jalr	2004(ra) # 8000142c <_Z15thread_dispatchv>
    }while(!Scheduler::isEmpty() || !Timer::getInstance().noSleepingThreads());
    80001c60:	00002097          	auipc	ra,0x2
    80001c64:	c08080e7          	jalr	-1016(ra) # 80003868 <_ZN9Scheduler7isEmptyEv>
    80001c68:	fe0508e3          	beqz	a0,80001c58 <_ZN6Kernel3runEv+0xb0>
    80001c6c:	fffff097          	auipc	ra,0xfffff
    80001c70:	53c080e7          	jalr	1340(ra) # 800011a8 <_ZN5Timer11getInstanceEv>
    80001c74:	fffff097          	auipc	ra,0xfffff
    80001c78:	6e4080e7          	jalr	1764(ra) # 80001358 <_ZN5Timer17noSleepingThreadsEv>
    80001c7c:	fc050ee3          	beqz	a0,80001c58 <_ZN6Kernel3runEv+0xb0>

    putc('m');
    80001c80:	06d00513          	li	a0,109
    80001c84:	00000097          	auipc	ra,0x0
    80001c88:	8d8080e7          	jalr	-1832(ra) # 8000155c <_Z4putcc>
    putc('a');
    80001c8c:	06100513          	li	a0,97
    80001c90:	00000097          	auipc	ra,0x0
    80001c94:	8cc080e7          	jalr	-1844(ra) # 8000155c <_Z4putcc>
    putc('i');
    80001c98:	06900513          	li	a0,105
    80001c9c:	00000097          	auipc	ra,0x0
    80001ca0:	8c0080e7          	jalr	-1856(ra) # 8000155c <_Z4putcc>
    putc('n');
    80001ca4:	06e00513          	li	a0,110
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	8b4080e7          	jalr	-1868(ra) # 8000155c <_Z4putcc>
    putc('\n');
    80001cb0:	00a00513          	li	a0,10
    80001cb4:	00000097          	auipc	ra,0x0
    80001cb8:	8a8080e7          	jalr	-1880(ra) # 8000155c <_Z4putcc>
    
    return EXIT_SUCCESS;
    80001cbc:	00000513          	li	a0,0
    80001cc0:	02813083          	ld	ra,40(sp)
    80001cc4:	02013403          	ld	s0,32(sp)
    80001cc8:	01813483          	ld	s1,24(sp)
    80001ccc:	03010113          	addi	sp,sp,48
    80001cd0:	00008067          	ret

0000000080001cd4 <_ZN7_threadC1EPFvPvES0_>:
#include "syscalls_c.h"

thread_t _thread::currentThread = nullptr;
uint32 _thread::nextID = 0;

_thread::_thread(func function, void* arg){
    80001cd4:	ff010113          	addi	sp,sp,-16
    80001cd8:	00813423          	sd	s0,8(sp)
    80001cdc:	01010413          	addi	s0,sp,16
    _thread(func function, void* arg);

    static void wrapper();


    struct contextWrapper{
    80001ce0:	00053823          	sd	zero,16(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80001ce4:	00005717          	auipc	a4,0x5
    80001ce8:	00c70713          	addi	a4,a4,12 # 80006cf0 <_ZN7_thread6nextIDE>
    80001cec:	00072783          	lw	a5,0(a4)
    80001cf0:	0017869b          	addiw	a3,a5,1
    80001cf4:	00d72023          	sw	a3,0(a4)
    80001cf8:	00f52023          	sw	a5,0(a0)
    closed = 0;
    blocked = 0;
    sleeping = 0;
    finished = 0;
    reserved = 0;
    80001cfc:	08052c23          	sw	zero,152(a0)
    joinHead = nullptr;
    80001d00:	08053023          	sd	zero,128(a0)
    timeLeft = 0;
    80001d04:	08053423          	sd	zero,136(a0)
    stackStart = 0;
    80001d08:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    80001d0c:	00053c23          	sd	zero,24(a0)
    context.s1 = 0;
    80001d10:	02053023          	sd	zero,32(a0)
    context.s2 = 0;
    80001d14:	02053423          	sd	zero,40(a0)
    context.s3 = 0;
    80001d18:	02053823          	sd	zero,48(a0)
    context.s4 = 0;
    80001d1c:	02053c23          	sd	zero,56(a0)
    context.s5 = 0;
    80001d20:	04053023          	sd	zero,64(a0)
    context.s6 = 0;
    80001d24:	04053423          	sd	zero,72(a0)
    context.s7 = 0;
    80001d28:	04053823          	sd	zero,80(a0)
    context.s8 = 0;
    80001d2c:	04053c23          	sd	zero,88(a0)
    context.s9 = 0;
    80001d30:	06053023          	sd	zero,96(a0)
    context.s10 = 0;
    80001d34:	06053423          	sd	zero,104(a0)
    context.s11 = 0;
    80001d38:	06053823          	sd	zero,112(a0)

    context.sstatus = 0;
    80001d3c:	06053c23          	sd	zero,120(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80001d40:	00000797          	auipc	a5,0x0
    80001d44:	3e878793          	addi	a5,a5,1000 # 80002128 <_ZN7_thread7wrapperEv>
    80001d48:	00f53423          	sd	a5,8(a0)
}
    80001d4c:	00813403          	ld	s0,8(sp)
    80001d50:	01010113          	addi	sp,sp,16
    80001d54:	00008067          	ret

0000000080001d58 <_Z10popSppSpiev>:

void popSppSpie(){
    80001d58:	ff010113          	addi	sp,sp,-16
    80001d5c:	00813423          	sd	s0,8(sp)
    80001d60:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001d64:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001d68:	10200073          	sret
}
    80001d6c:	00813403          	ld	s0,8(sp)
    80001d70:	01010113          	addi	sp,sp,16
    80001d74:	00008067          	ret

0000000080001d78 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:
    currentThread->function(currentThread->arg);
    currentThread->finished = 1;
    dispatch();
}

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80001d78:	fc010113          	addi	sp,sp,-64
    80001d7c:	02113c23          	sd	ra,56(sp)
    80001d80:	02813823          	sd	s0,48(sp)
    80001d84:	02913423          	sd	s1,40(sp)
    80001d88:	03213023          	sd	s2,32(sp)
    80001d8c:	01313c23          	sd	s3,24(sp)
    80001d90:	01413823          	sd	s4,16(sp)
    80001d94:	01513423          	sd	s5,8(sp)
    80001d98:	04010413          	addi	s0,sp,64
    80001d9c:	00050493          	mv	s1,a0
    80001da0:	00058a93          	mv	s5,a1
    80001da4:	00060a13          	mv	s4,a2
    80001da8:	00068913          	mv	s2,a3
    80001dac:	00070993          	mv	s3,a4
    *thread = (thread_t)mem_alloc(sizeof(_thread));
    80001db0:	0b000513          	li	a0,176
    80001db4:	fffff097          	auipc	ra,0xfffff
    80001db8:	5c4080e7          	jalr	1476(ra) # 80001378 <_Z9mem_allocm>
    80001dbc:	00a4b023          	sd	a0,0(s1)
    
    (*thread)->function = function;
    80001dc0:	0b553023          	sd	s5,160(a0)
    (*thread)->arg = arg;
    80001dc4:	0004b783          	ld	a5,0(s1)
    80001dc8:	0b47b423          	sd	s4,168(a5)
    (*thread)->ID = nextID++;
    80001dcc:	00005717          	auipc	a4,0x5
    80001dd0:	f2470713          	addi	a4,a4,-220 # 80006cf0 <_ZN7_thread6nextIDE>
    80001dd4:	00072783          	lw	a5,0(a4)
    80001dd8:	0017869b          	addiw	a3,a5,1
    80001ddc:	00d72023          	sw	a3,0(a4)
    80001de0:	0004b703          	ld	a4,0(s1)
    80001de4:	00f72023          	sw	a5,0(a4)
    (*thread)->closed = false;
    80001de8:	0004b703          	ld	a4,0(s1)
    80001dec:	09872783          	lw	a5,152(a4)
    80001df0:	ffe7f793          	andi	a5,a5,-2
    80001df4:	08f72c23          	sw	a5,152(a4)
    (*thread)->blocked = false;
    80001df8:	0004b703          	ld	a4,0(s1)
    80001dfc:	09872783          	lw	a5,152(a4)
    80001e00:	ffd7f793          	andi	a5,a5,-3
    80001e04:	08f72c23          	sw	a5,152(a4)
    (*thread)->sleeping = false;
    80001e08:	0004b703          	ld	a4,0(s1)
    80001e0c:	09872783          	lw	a5,152(a4)
    80001e10:	ffb7f793          	andi	a5,a5,-5
    80001e14:	08f72c23          	sw	a5,152(a4)
    (*thread)->finished = false;
    80001e18:	0004b703          	ld	a4,0(s1)
    80001e1c:	09872783          	lw	a5,152(a4)
    80001e20:	ff77f793          	andi	a5,a5,-9
    80001e24:	08f72c23          	sw	a5,152(a4)
    (*thread)->reserved = 0;
    80001e28:	0004b703          	ld	a4,0(s1)
    80001e2c:	09872783          	lw	a5,152(a4)
    80001e30:	00f7f793          	andi	a5,a5,15
    80001e34:	08f72c23          	sw	a5,152(a4)
    (*thread)->joinHead = nullptr;
    80001e38:	0004b783          	ld	a5,0(s1)
    80001e3c:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = 0;
    80001e40:	0004b783          	ld	a5,0(s1)
    80001e44:	0807b423          	sd	zero,136(a5)
    (*thread)->stackStart = 0;
    80001e48:	0004b783          	ld	a5,0(s1)
    80001e4c:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    80001e50:	0004b783          	ld	a5,0(s1)
    80001e54:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s1 = 0;
    80001e58:	0004b783          	ld	a5,0(s1)
    80001e5c:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s2 = 0;
    80001e60:	0004b783          	ld	a5,0(s1)
    80001e64:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s3 = 0;
    80001e68:	0004b783          	ld	a5,0(s1)
    80001e6c:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s4 = 0;
    80001e70:	0004b783          	ld	a5,0(s1)
    80001e74:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s5 = 0;
    80001e78:	0004b783          	ld	a5,0(s1)
    80001e7c:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s6 = 0;
    80001e80:	0004b783          	ld	a5,0(s1)
    80001e84:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s7 = 0;
    80001e88:	0004b783          	ld	a5,0(s1)
    80001e8c:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s8 = 0;
    80001e90:	0004b783          	ld	a5,0(s1)
    80001e94:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s9 = 0;
    80001e98:	0004b783          	ld	a5,0(s1)
    80001e9c:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s10 = 0;
    80001ea0:	0004b783          	ld	a5,0(s1)
    80001ea4:	0607b423          	sd	zero,104(a5)
    (*thread)->context.s11 = 0;
    80001ea8:	0004b783          	ld	a5,0(s1)
    80001eac:	0607b823          	sd	zero,112(a5)

    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80001eb0:	0004b783          	ld	a5,0(s1)
    80001eb4:	0127b823          	sd	s2,16(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80001eb8:	0004b783          	ld	a5,0(s1)
    80001ebc:	00000717          	auipc	a4,0x0
    80001ec0:	26c70713          	addi	a4,a4,620 # 80002128 <_ZN7_thread7wrapperEv>
    80001ec4:	00e7b423          	sd	a4,8(a5)

    (*thread)->stackStart = stack;
    80001ec8:	0004b783          	ld	a5,0(s1)
    80001ecc:	0927b823          	sd	s2,144(a5)
    if(start){
    80001ed0:	02099663          	bnez	s3,80001efc <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x184>
        Scheduler::put(*thread);
    }
    return 0;
}
    80001ed4:	00000513          	li	a0,0
    80001ed8:	03813083          	ld	ra,56(sp)
    80001edc:	03013403          	ld	s0,48(sp)
    80001ee0:	02813483          	ld	s1,40(sp)
    80001ee4:	02013903          	ld	s2,32(sp)
    80001ee8:	01813983          	ld	s3,24(sp)
    80001eec:	01013a03          	ld	s4,16(sp)
    80001ef0:	00813a83          	ld	s5,8(sp)
    80001ef4:	04010113          	addi	sp,sp,64
    80001ef8:	00008067          	ret
        Scheduler::put(*thread);
    80001efc:	0004b503          	ld	a0,0(s1)
    80001f00:	00002097          	auipc	ra,0x2
    80001f04:	990080e7          	jalr	-1648(ra) # 80003890 <_ZN9Scheduler3putEP7_thread>
    80001f08:	fcdff06f          	j	80001ed4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x15c>

0000000080001f0c <_ZN7_thread10setBlockedEb>:
    this->finished = 1;
    dispatch();    
    return 0;
}

void _thread::setBlocked(bool blocked){
    80001f0c:	ff010113          	addi	sp,sp,-16
    80001f10:	00813423          	sd	s0,8(sp)
    80001f14:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80001f18:	0015f593          	andi	a1,a1,1
    80001f1c:	0015979b          	slliw	a5,a1,0x1
    80001f20:	09852583          	lw	a1,152(a0)
    80001f24:	ffd5f593          	andi	a1,a1,-3
    80001f28:	00f5e5b3          	or	a1,a1,a5
    80001f2c:	08b52c23          	sw	a1,152(a0)
}
    80001f30:	00813403          	ld	s0,8(sp)
    80001f34:	01010113          	addi	sp,sp,16
    80001f38:	00008067          	ret

0000000080001f3c <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80001f3c:	ff010113          	addi	sp,sp,-16
    80001f40:	00813423          	sd	s0,8(sp)
    80001f44:	01010413          	addi	s0,sp,16
    this->closed = closed;
    80001f48:	0015f793          	andi	a5,a1,1
    80001f4c:	09852583          	lw	a1,152(a0)
    80001f50:	ffe5f593          	andi	a1,a1,-2
    80001f54:	00f5e5b3          	or	a1,a1,a5
    80001f58:	08b52c23          	sw	a1,152(a0)
}
    80001f5c:	00813403          	ld	s0,8(sp)
    80001f60:	01010113          	addi	sp,sp,16
    80001f64:	00008067          	ret

0000000080001f68 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    80001f68:	ff010113          	addi	sp,sp,-16
    80001f6c:	00813423          	sd	s0,8(sp)
    80001f70:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    80001f74:	0015f593          	andi	a1,a1,1
    80001f78:	0025979b          	slliw	a5,a1,0x2
    80001f7c:	09852583          	lw	a1,152(a0)
    80001f80:	ffb5f593          	andi	a1,a1,-5
    80001f84:	00f5e5b3          	or	a1,a1,a5
    80001f88:	08b52c23          	sw	a1,152(a0)
}
    80001f8c:	00813403          	ld	s0,8(sp)
    80001f90:	01010113          	addi	sp,sp,16
    80001f94:	00008067          	ret

0000000080001f98 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
    // }
    currentThread =  Scheduler::get();
    contextSwitch(oldThread == nullptr?nullptr:&oldThread->context, &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    80001f98:	ff010113          	addi	sp,sp,-16
    80001f9c:	00813423          	sd	s0,8(sp)
    80001fa0:	01010413          	addi	s0,sp,16
    if(oldContext != nullptr){
    80001fa4:	08050063          	beqz	a0,80002024 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x8c>

        __asm__ volatile ("mv %0, sp" : "=r"(oldContext->sp));
    80001fa8:	00010793          	mv	a5,sp
    80001fac:	00f53423          	sd	a5,8(a0)
        __asm__ volatile ("mv %0, ra" : "=r"(oldContext->pc));
    80001fb0:	00008793          	mv	a5,ra
    80001fb4:	00f53023          	sd	a5,0(a0)

        __asm__ volatile ("mv %0, s0" : "=r"(oldContext->s0));
    80001fb8:	00040793          	mv	a5,s0
    80001fbc:	00f53823          	sd	a5,16(a0)
        __asm__ volatile ("mv %0, s1" : "=r"(oldContext->s1));
    80001fc0:	00048793          	mv	a5,s1
    80001fc4:	00f53c23          	sd	a5,24(a0)
        __asm__ volatile ("mv %0, s2" : "=r"(oldContext->s2));
    80001fc8:	00090793          	mv	a5,s2
    80001fcc:	02f53023          	sd	a5,32(a0)
        __asm__ volatile ("mv %0, s3" : "=r"(oldContext->s3));
    80001fd0:	00098793          	mv	a5,s3
    80001fd4:	02f53423          	sd	a5,40(a0)
        __asm__ volatile ("mv %0, s4" : "=r"(oldContext->s4));
    80001fd8:	000a0793          	mv	a5,s4
    80001fdc:	02f53823          	sd	a5,48(a0)
        __asm__ volatile ("mv %0, s5" : "=r"(oldContext->s5));
    80001fe0:	000a8793          	mv	a5,s5
    80001fe4:	02f53c23          	sd	a5,56(a0)
        __asm__ volatile ("mv %0, s6" : "=r"(oldContext->s6));
    80001fe8:	000b0793          	mv	a5,s6
    80001fec:	04f53023          	sd	a5,64(a0)
        __asm__ volatile ("mv %0, s7" : "=r"(oldContext->s7));
    80001ff0:	000b8793          	mv	a5,s7
    80001ff4:	04f53423          	sd	a5,72(a0)
        __asm__ volatile ("mv %0, s8" : "=r"(oldContext->s8));
    80001ff8:	000c0793          	mv	a5,s8
    80001ffc:	04f53823          	sd	a5,80(a0)
        __asm__ volatile ("mv %0, s9" : "=r"(oldContext->s9));
    80002000:	000c8793          	mv	a5,s9
    80002004:	04f53c23          	sd	a5,88(a0)
        __asm__ volatile ("mv %0, s10" : "=r"(oldContext->s10));
    80002008:	000d0793          	mv	a5,s10
    8000200c:	06f53023          	sd	a5,96(a0)
        __asm__ volatile ("mv %0, s11" : "=r"(oldContext->s11));
    80002010:	000d8793          	mv	a5,s11
    80002014:	06f53423          	sd	a5,104(a0)

        __asm__ volatile ("csrr s0, sstatus");
    80002018:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("mv %0, s0" : "=r"(oldContext->sstatus));
    8000201c:	00040793          	mv	a5,s0
    80002020:	06f53823          	sd	a5,112(a0)

    }
    if(newContext->sp != 0){
    80002024:	0085b783          	ld	a5,8(a1)
    80002028:	00078463          	beqz	a5,80002030 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x98>
        __asm__ volatile ("mv sp, %0" :: "r"(newContext->sp));
    8000202c:	00078113          	mv	sp,a5
    }

    
    __asm__ volatile ("mv s0, %0" :: "r"(newContext->sstatus));
    80002030:	0705b783          	ld	a5,112(a1)
    80002034:	00078413          	mv	s0,a5
    __asm__ volatile ("csrw sstatus, s0");
    80002038:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("mv s0, %0" :: "r"(newContext->s0));
    8000203c:	0105b783          	ld	a5,16(a1)
    80002040:	00078413          	mv	s0,a5
    __asm__ volatile ("mv s1, %0" :: "r"(newContext->s1));
    80002044:	0185b783          	ld	a5,24(a1)
    80002048:	00078493          	mv	s1,a5
    __asm__ volatile ("mv s2, %0" :: "r"(newContext->s2));
    8000204c:	0205b783          	ld	a5,32(a1)
    80002050:	00078913          	mv	s2,a5
    __asm__ volatile ("mv s3, %0" :: "r"(newContext->s3));
    80002054:	0285b783          	ld	a5,40(a1)
    80002058:	00078993          	mv	s3,a5
    __asm__ volatile ("mv s4, %0" :: "r"(newContext->s4));
    8000205c:	0305b783          	ld	a5,48(a1)
    80002060:	00078a13          	mv	s4,a5
    __asm__ volatile ("mv s5, %0" :: "r"(newContext->s5));
    80002064:	0385b783          	ld	a5,56(a1)
    80002068:	00078a93          	mv	s5,a5
    __asm__ volatile ("mv s6, %0" :: "r"(newContext->s6));
    8000206c:	0405b783          	ld	a5,64(a1)
    80002070:	00078b13          	mv	s6,a5
    __asm__ volatile ("mv s7, %0" :: "r"(newContext->s7));
    80002074:	0485b783          	ld	a5,72(a1)
    80002078:	00078b93          	mv	s7,a5
    __asm__ volatile ("mv s8, %0" :: "r"(newContext->s8));
    8000207c:	0505b783          	ld	a5,80(a1)
    80002080:	00078c13          	mv	s8,a5
    __asm__ volatile ("mv s9, %0" :: "r"(newContext->s9));
    80002084:	0585b783          	ld	a5,88(a1)
    80002088:	00078c93          	mv	s9,a5
    __asm__ volatile ("mv s10, %0" :: "r"(newContext->s10));
    8000208c:	0605b783          	ld	a5,96(a1)
    80002090:	00078d13          	mv	s10,a5
    __asm__ volatile ("mv s11, %0" :: "r"(newContext->s11));
    80002094:	0685b783          	ld	a5,104(a1)
    80002098:	00078d93          	mv	s11,a5

    __asm__ volatile ("mv ra, %0" :: "r"(newContext->pc));
    8000209c:	0005b783          	ld	a5,0(a1)
    800020a0:	00078093          	mv	ra,a5
    return;
}
    800020a4:	00813403          	ld	s0,8(sp)
    800020a8:	01010113          	addi	sp,sp,16
    800020ac:	00008067          	ret

00000000800020b0 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    800020b0:	fe010113          	addi	sp,sp,-32
    800020b4:	00113c23          	sd	ra,24(sp)
    800020b8:	00813823          	sd	s0,16(sp)
    800020bc:	00913423          	sd	s1,8(sp)
    800020c0:	02010413          	addi	s0,sp,32
    _thread* oldThread = currentThread;
    800020c4:	00005497          	auipc	s1,0x5
    800020c8:	c344b483          	ld	s1,-972(s1) # 80006cf8 <_ZN7_thread13currentThreadE>
    if(oldThread != nullptr && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    800020cc:	00048863          	beqz	s1,800020dc <_ZN7_thread8dispatchEv+0x2c>
    800020d0:	0984b783          	ld	a5,152(s1)
    800020d4:	00f7f793          	andi	a5,a5,15
    800020d8:	04078063          	beqz	a5,80002118 <_ZN7_thread8dispatchEv+0x68>
    currentThread =  Scheduler::get();
    800020dc:	00002097          	auipc	ra,0x2
    800020e0:	9a4080e7          	jalr	-1628(ra) # 80003a80 <_ZN9Scheduler3getEv>
    800020e4:	00005797          	auipc	a5,0x5
    800020e8:	c0a7ba23          	sd	a0,-1004(a5) # 80006cf8 <_ZN7_thread13currentThreadE>
    contextSwitch(oldThread == nullptr?nullptr:&oldThread->context, &(currentThread->context));
    800020ec:	00048463          	beqz	s1,800020f4 <_ZN7_thread8dispatchEv+0x44>
    800020f0:	00848493          	addi	s1,s1,8
    800020f4:	00850593          	addi	a1,a0,8
    800020f8:	00048513          	mv	a0,s1
    800020fc:	00000097          	auipc	ra,0x0
    80002100:	e9c080e7          	jalr	-356(ra) # 80001f98 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    80002104:	01813083          	ld	ra,24(sp)
    80002108:	01013403          	ld	s0,16(sp)
    8000210c:	00813483          	ld	s1,8(sp)
    80002110:	02010113          	addi	sp,sp,32
    80002114:	00008067          	ret
            Scheduler::put(oldThread);
    80002118:	00048513          	mv	a0,s1
    8000211c:	00001097          	auipc	ra,0x1
    80002120:	774080e7          	jalr	1908(ra) # 80003890 <_ZN9Scheduler3putEP7_thread>
    80002124:	fb9ff06f          	j	800020dc <_ZN7_thread8dispatchEv+0x2c>

0000000080002128 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80002128:	fe010113          	addi	sp,sp,-32
    8000212c:	00113c23          	sd	ra,24(sp)
    80002130:	00813823          	sd	s0,16(sp)
    80002134:	00913423          	sd	s1,8(sp)
    80002138:	02010413          	addi	s0,sp,32
    popSppSpie();
    8000213c:	00000097          	auipc	ra,0x0
    80002140:	c1c080e7          	jalr	-996(ra) # 80001d58 <_Z10popSppSpiev>
    currentThread->function(currentThread->arg);
    80002144:	00005497          	auipc	s1,0x5
    80002148:	bac48493          	addi	s1,s1,-1108 # 80006cf0 <_ZN7_thread6nextIDE>
    8000214c:	0084b783          	ld	a5,8(s1)
    80002150:	0a07b703          	ld	a4,160(a5)
    80002154:	0a87b503          	ld	a0,168(a5)
    80002158:	000700e7          	jalr	a4
    currentThread->finished = 1;
    8000215c:	0084b703          	ld	a4,8(s1)
    80002160:	09872783          	lw	a5,152(a4)
    80002164:	0087e793          	ori	a5,a5,8
    80002168:	08f72c23          	sw	a5,152(a4)
    dispatch();
    8000216c:	00000097          	auipc	ra,0x0
    80002170:	f44080e7          	jalr	-188(ra) # 800020b0 <_ZN7_thread8dispatchEv>
}
    80002174:	01813083          	ld	ra,24(sp)
    80002178:	01013403          	ld	s0,16(sp)
    8000217c:	00813483          	ld	s1,8(sp)
    80002180:	02010113          	addi	sp,sp,32
    80002184:	00008067          	ret

0000000080002188 <_ZN7_thread4exitEv>:
int _thread::exit(){
    80002188:	ff010113          	addi	sp,sp,-16
    8000218c:	00113423          	sd	ra,8(sp)
    80002190:	00813023          	sd	s0,0(sp)
    80002194:	01010413          	addi	s0,sp,16
    this->finished = 1;
    80002198:	09852783          	lw	a5,152(a0)
    8000219c:	0087e793          	ori	a5,a5,8
    800021a0:	08f52c23          	sw	a5,152(a0)
    dispatch();    
    800021a4:	00000097          	auipc	ra,0x0
    800021a8:	f0c080e7          	jalr	-244(ra) # 800020b0 <_ZN7_thread8dispatchEv>
}
    800021ac:	00000513          	li	a0,0
    800021b0:	00813083          	ld	ra,8(sp)
    800021b4:	00013403          	ld	s0,0(sp)
    800021b8:	01010113          	addi	sp,sp,16
    800021bc:	00008067          	ret

00000000800021c0 <_ZN11HeapManagerC1Ev>:
#include "heapManager.h"
#include "hw.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    800021c0:	fe010113          	addi	sp,sp,-32
    800021c4:	00113c23          	sd	ra,24(sp)
    800021c8:	00813823          	sd	s0,16(sp)
    800021cc:	00913423          	sd	s1,8(sp)
    800021d0:	02010413          	addi	s0,sp,32
    800021d4:	00050493          	mv	s1,a0
    assert(instance == 0);
    800021d8:	00005797          	auipc	a5,0x5
    800021dc:	b287b783          	ld	a5,-1240(a5) # 80006d00 <_ZN11HeapManager8instanceE>
    800021e0:	02079063          	bnez	a5,80002200 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    800021e4:	00005797          	auipc	a5,0x5
    800021e8:	b097be23          	sd	s1,-1252(a5) # 80006d00 <_ZN11HeapManager8instanceE>
}
    800021ec:	01813083          	ld	ra,24(sp)
    800021f0:	01013403          	ld	s0,16(sp)
    800021f4:	00813483          	ld	s1,8(sp)
    800021f8:	02010113          	addi	sp,sp,32
    800021fc:	00008067          	ret
    assert(instance == 0);
    80002200:	01200593          	li	a1,18
    80002204:	00004517          	auipc	a0,0x4
    80002208:	e3c50513          	addi	a0,a0,-452 # 80006040 <CONSOLE_STATUS+0x30>
    8000220c:	fffff097          	auipc	ra,0xfffff
    80002210:	5d4080e7          	jalr	1492(ra) # 800017e0 <_Z13assert_failedPKci>
    80002214:	fd1ff06f          	j	800021e4 <_ZN11HeapManagerC1Ev+0x24>

0000000080002218 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80002218:	ff010113          	addi	sp,sp,-16
    8000221c:	00813423          	sd	s0,8(sp)
    80002220:	01010413          	addi	s0,sp,16
    
}
    80002224:	00813403          	ld	s0,8(sp)
    80002228:	01010113          	addi	sp,sp,16
    8000222c:	00008067          	ret

0000000080002230 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    80002230:	fd010113          	addi	sp,sp,-48
    80002234:	02113423          	sd	ra,40(sp)
    80002238:	02813023          	sd	s0,32(sp)
    8000223c:	00913c23          	sd	s1,24(sp)
    80002240:	01213823          	sd	s2,16(sp)
    80002244:	01313423          	sd	s3,8(sp)
    80002248:	03010413          	addi	s0,sp,48
    8000224c:	00050913          	mv	s2,a0
    80002250:	00058993          	mv	s3,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002254:	40b604b3          	sub	s1,a2,a1
    80002258:	0414b793          	sltiu	a5,s1,65
    8000225c:	0c079c63          	bnez	a5,80002334 <_ZN11HeapManager4initEmm+0x104>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80002260:	01393023          	sd	s3,0(s2)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80002264:	fde00793          	li	a5,-34
    80002268:	00f98c23          	sb	a5,24(s3)
    8000226c:	fc000713          	li	a4,-64
    80002270:	00e98ca3          	sb	a4,25(s3)
    80002274:	fad00713          	li	a4,-83
    80002278:	00e98d23          	sb	a4,26(s3)
    8000227c:	00f98da3          	sb	a5,27(s3)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    80002280:	0064d613          	srli	a2,s1,0x6
    80002284:	00093783          	ld	a5,0(s2)
    80002288:	fff60613          	addi	a2,a2,-1
    8000228c:	00c78823          	sb	a2,16(a5)
    80002290:	00865713          	srli	a4,a2,0x8
    80002294:	00e788a3          	sb	a4,17(a5)
    80002298:	01065713          	srli	a4,a2,0x10
    8000229c:	00e78923          	sb	a4,18(a5)
    800022a0:	0186571b          	srliw	a4,a2,0x18
    800022a4:	00e789a3          	sb	a4,19(a5)
    800022a8:	02065713          	srli	a4,a2,0x20
    800022ac:	00e78a23          	sb	a4,20(a5)
    800022b0:	02865713          	srli	a4,a2,0x28
    800022b4:	00e78aa3          	sb	a4,21(a5)
    800022b8:	03065713          	srli	a4,a2,0x30
    800022bc:	00e78b23          	sb	a4,22(a5)
    800022c0:	03865613          	srli	a2,a2,0x38
    800022c4:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    800022c8:	00093783          	ld	a5,0(s2)
    800022cc:	00078023          	sb	zero,0(a5)
    800022d0:	000780a3          	sb	zero,1(a5)
    800022d4:	00078123          	sb	zero,2(a5)
    800022d8:	000781a3          	sb	zero,3(a5)
    800022dc:	00078223          	sb	zero,4(a5)
    800022e0:	000782a3          	sb	zero,5(a5)
    800022e4:	00078323          	sb	zero,6(a5)
    800022e8:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    800022ec:	00093783          	ld	a5,0(s2)
    800022f0:	00078423          	sb	zero,8(a5)
    800022f4:	000784a3          	sb	zero,9(a5)
    800022f8:	00078523          	sb	zero,10(a5)
    800022fc:	000785a3          	sb	zero,11(a5)
    80002300:	00078623          	sb	zero,12(a5)
    80002304:	000786a3          	sb	zero,13(a5)
    80002308:	00078723          	sb	zero,14(a5)
    8000230c:	000787a3          	sb	zero,15(a5)
    m_pTail = m_pHead;
    80002310:	00093783          	ld	a5,0(s2)
    80002314:	00f93423          	sd	a5,8(s2)
}
    80002318:	02813083          	ld	ra,40(sp)
    8000231c:	02013403          	ld	s0,32(sp)
    80002320:	01813483          	ld	s1,24(sp)
    80002324:	01013903          	ld	s2,16(sp)
    80002328:	00813983          	ld	s3,8(sp)
    8000232c:	03010113          	addi	sp,sp,48
    80002330:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002334:	01b00593          	li	a1,27
    80002338:	00004517          	auipc	a0,0x4
    8000233c:	d0850513          	addi	a0,a0,-760 # 80006040 <CONSOLE_STATUS+0x30>
    80002340:	fffff097          	auipc	ra,0xfffff
    80002344:	4a0080e7          	jalr	1184(ra) # 800017e0 <_Z13assert_failedPKci>
    80002348:	f19ff06f          	j	80002260 <_ZN11HeapManager4initEmm+0x30>

000000008000234c <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    8000234c:	fe010113          	addi	sp,sp,-32
    80002350:	00113c23          	sd	ra,24(sp)
    80002354:	00813823          	sd	s0,16(sp)
    80002358:	00913423          	sd	s1,8(sp)
    8000235c:	01213023          	sd	s2,0(sp)
    80002360:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002364:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80002368:	00000913          	li	s2,0
    8000236c:	0b80006f          	j	80002424 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80002370:	0104c783          	lbu	a5,16(s1)
    80002374:	0114c703          	lbu	a4,17(s1)
    80002378:	00871713          	slli	a4,a4,0x8
    8000237c:	00f76733          	or	a4,a4,a5
    80002380:	0124c783          	lbu	a5,18(s1)
    80002384:	01079793          	slli	a5,a5,0x10
    80002388:	00e7e733          	or	a4,a5,a4
    8000238c:	0134c783          	lbu	a5,19(s1)
    80002390:	01879793          	slli	a5,a5,0x18
    80002394:	00e7e7b3          	or	a5,a5,a4
    80002398:	0144c703          	lbu	a4,20(s1)
    8000239c:	02071713          	slli	a4,a4,0x20
    800023a0:	00f767b3          	or	a5,a4,a5
    800023a4:	0154c703          	lbu	a4,21(s1)
    800023a8:	02871713          	slli	a4,a4,0x28
    800023ac:	00f76733          	or	a4,a4,a5
    800023b0:	0164c783          	lbu	a5,22(s1)
    800023b4:	03079793          	slli	a5,a5,0x30
    800023b8:	00e7e733          	or	a4,a5,a4
    800023bc:	0174c783          	lbu	a5,23(s1)
    800023c0:	03879793          	slli	a5,a5,0x38
    800023c4:	00e7e7b3          	or	a5,a5,a4
    800023c8:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    800023cc:	0004c703          	lbu	a4,0(s1)
    800023d0:	0014c783          	lbu	a5,1(s1)
    800023d4:	00879793          	slli	a5,a5,0x8
    800023d8:	00e7e733          	or	a4,a5,a4
    800023dc:	0024c783          	lbu	a5,2(s1)
    800023e0:	01079793          	slli	a5,a5,0x10
    800023e4:	00e7e7b3          	or	a5,a5,a4
    800023e8:	0034c703          	lbu	a4,3(s1)
    800023ec:	01871713          	slli	a4,a4,0x18
    800023f0:	00f767b3          	or	a5,a4,a5
    800023f4:	0044c703          	lbu	a4,4(s1)
    800023f8:	02071713          	slli	a4,a4,0x20
    800023fc:	00f76733          	or	a4,a4,a5
    80002400:	0054c783          	lbu	a5,5(s1)
    80002404:	02879793          	slli	a5,a5,0x28
    80002408:	00e7e733          	or	a4,a5,a4
    8000240c:	0064c783          	lbu	a5,6(s1)
    80002410:	03079793          	slli	a5,a5,0x30
    80002414:	00e7e7b3          	or	a5,a5,a4
    80002418:	0074c483          	lbu	s1,7(s1)
    8000241c:	03849493          	slli	s1,s1,0x38
    80002420:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002424:	04048a63          	beqz	s1,80002478 <_ZN11HeapManager17getHeapFreeMemoryEv+0x12c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002428:	0184c783          	lbu	a5,24(s1)
    8000242c:	0194c703          	lbu	a4,25(s1)
    80002430:	00871713          	slli	a4,a4,0x8
    80002434:	00f76733          	or	a4,a4,a5
    80002438:	01a4c783          	lbu	a5,26(s1)
    8000243c:	01079793          	slli	a5,a5,0x10
    80002440:	00e7e733          	or	a4,a5,a4
    80002444:	01b4c783          	lbu	a5,27(s1)
    80002448:	01879793          	slli	a5,a5,0x18
    8000244c:	00e7e7b3          	or	a5,a5,a4
    80002450:	0007879b          	sext.w	a5,a5
    80002454:	deadc737          	lui	a4,0xdeadc
    80002458:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead416e>
    8000245c:	f0e78ae3          	beq	a5,a4,80002370 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80002460:	02900593          	li	a1,41
    80002464:	00004517          	auipc	a0,0x4
    80002468:	bdc50513          	addi	a0,a0,-1060 # 80006040 <CONSOLE_STATUS+0x30>
    8000246c:	fffff097          	auipc	ra,0xfffff
    80002470:	374080e7          	jalr	884(ra) # 800017e0 <_Z13assert_failedPKci>
    80002474:	efdff06f          	j	80002370 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80002478:	00090513          	mv	a0,s2
    8000247c:	01813083          	ld	ra,24(sp)
    80002480:	01013403          	ld	s0,16(sp)
    80002484:	00813483          	ld	s1,8(sp)
    80002488:	00013903          	ld	s2,0(sp)
    8000248c:	02010113          	addi	sp,sp,32
    80002490:	00008067          	ret

0000000080002494 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80002494:	fd010113          	addi	sp,sp,-48
    80002498:	02113423          	sd	ra,40(sp)
    8000249c:	02813023          	sd	s0,32(sp)
    800024a0:	00913c23          	sd	s1,24(sp)
    800024a4:	01213823          	sd	s2,16(sp)
    800024a8:	01313423          	sd	s3,8(sp)
    800024ac:	03010413          	addi	s0,sp,48
    800024b0:	00050993          	mv	s3,a0
    800024b4:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    800024b8:	00053483          	ld	s1,0(a0)
    800024bc:	0b80006f          	j	80002574 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    800024c0:	0104c783          	lbu	a5,16(s1)
    800024c4:	0114c703          	lbu	a4,17(s1)
    800024c8:	00871713          	slli	a4,a4,0x8
    800024cc:	00f76733          	or	a4,a4,a5
    800024d0:	0124c783          	lbu	a5,18(s1)
    800024d4:	01079793          	slli	a5,a5,0x10
    800024d8:	00e7e733          	or	a4,a5,a4
    800024dc:	0134c783          	lbu	a5,19(s1)
    800024e0:	01879793          	slli	a5,a5,0x18
    800024e4:	00e7e7b3          	or	a5,a5,a4
    800024e8:	0144c703          	lbu	a4,20(s1)
    800024ec:	02071713          	slli	a4,a4,0x20
    800024f0:	00f767b3          	or	a5,a4,a5
    800024f4:	0154c703          	lbu	a4,21(s1)
    800024f8:	02871713          	slli	a4,a4,0x28
    800024fc:	00f76733          	or	a4,a4,a5
    80002500:	0164c783          	lbu	a5,22(s1)
    80002504:	03079793          	slli	a5,a5,0x30
    80002508:	00e7e733          	or	a4,a5,a4
    8000250c:	0174c783          	lbu	a5,23(s1)
    80002510:	03879793          	slli	a5,a5,0x38
    80002514:	00e7e7b3          	or	a5,a5,a4
    80002518:	0b27f863          	bgeu	a5,s2,800025c8 <_ZN11HeapManager12heapAllocateEm+0x134>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    8000251c:	0004c703          	lbu	a4,0(s1)
    80002520:	0014c783          	lbu	a5,1(s1)
    80002524:	00879793          	slli	a5,a5,0x8
    80002528:	00e7e733          	or	a4,a5,a4
    8000252c:	0024c783          	lbu	a5,2(s1)
    80002530:	01079793          	slli	a5,a5,0x10
    80002534:	00e7e7b3          	or	a5,a5,a4
    80002538:	0034c703          	lbu	a4,3(s1)
    8000253c:	01871713          	slli	a4,a4,0x18
    80002540:	00f767b3          	or	a5,a4,a5
    80002544:	0044c703          	lbu	a4,4(s1)
    80002548:	02071713          	slli	a4,a4,0x20
    8000254c:	00f76733          	or	a4,a4,a5
    80002550:	0054c783          	lbu	a5,5(s1)
    80002554:	02879793          	slli	a5,a5,0x28
    80002558:	00e7e733          	or	a4,a5,a4
    8000255c:	0064c783          	lbu	a5,6(s1)
    80002560:	03079793          	slli	a5,a5,0x30
    80002564:	00e7e7b3          	or	a5,a5,a4
    80002568:	0074c483          	lbu	s1,7(s1)
    8000256c:	03849493          	slli	s1,s1,0x38
    80002570:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002574:	4e048863          	beqz	s1,80002a64 <_ZN11HeapManager12heapAllocateEm+0x5d0>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002578:	0184c783          	lbu	a5,24(s1)
    8000257c:	0194c703          	lbu	a4,25(s1)
    80002580:	00871713          	slli	a4,a4,0x8
    80002584:	00f76733          	or	a4,a4,a5
    80002588:	01a4c783          	lbu	a5,26(s1)
    8000258c:	01079793          	slli	a5,a5,0x10
    80002590:	00e7e733          	or	a4,a5,a4
    80002594:	01b4c783          	lbu	a5,27(s1)
    80002598:	01879793          	slli	a5,a5,0x18
    8000259c:	00e7e7b3          	or	a5,a5,a4
    800025a0:	0007879b          	sext.w	a5,a5
    800025a4:	deadc737          	lui	a4,0xdeadc
    800025a8:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead416e>
    800025ac:	f0e78ae3          	beq	a5,a4,800024c0 <_ZN11HeapManager12heapAllocateEm+0x2c>
    800025b0:	03300593          	li	a1,51
    800025b4:	00004517          	auipc	a0,0x4
    800025b8:	a8c50513          	addi	a0,a0,-1396 # 80006040 <CONSOLE_STATUS+0x30>
    800025bc:	fffff097          	auipc	ra,0xfffff
    800025c0:	224080e7          	jalr	548(ra) # 800017e0 <_Z13assert_failedPKci>
    800025c4:	efdff06f          	j	800024c0 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    800025c8:	00190713          	addi	a4,s2,1
    800025cc:	2af77263          	bgeu	a4,a5,80002870 <_ZN11HeapManager12heapAllocateEm+0x3dc>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    800025d0:	00671793          	slli	a5,a4,0x6
    800025d4:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    800025d8:	fde00713          	li	a4,-34
    800025dc:	00e78c23          	sb	a4,24(a5)
    800025e0:	fc000693          	li	a3,-64
    800025e4:	00d78ca3          	sb	a3,25(a5)
    800025e8:	fad00693          	li	a3,-83
    800025ec:	00d78d23          	sb	a3,26(a5)
    800025f0:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    800025f4:	0104c703          	lbu	a4,16(s1)
    800025f8:	0114c683          	lbu	a3,17(s1)
    800025fc:	00869693          	slli	a3,a3,0x8
    80002600:	00e6e6b3          	or	a3,a3,a4
    80002604:	0124c703          	lbu	a4,18(s1)
    80002608:	01071713          	slli	a4,a4,0x10
    8000260c:	00d766b3          	or	a3,a4,a3
    80002610:	0134c703          	lbu	a4,19(s1)
    80002614:	01871713          	slli	a4,a4,0x18
    80002618:	00d76733          	or	a4,a4,a3
    8000261c:	0144c683          	lbu	a3,20(s1)
    80002620:	02069693          	slli	a3,a3,0x20
    80002624:	00e6e733          	or	a4,a3,a4
    80002628:	0154c683          	lbu	a3,21(s1)
    8000262c:	02869693          	slli	a3,a3,0x28
    80002630:	00e6e6b3          	or	a3,a3,a4
    80002634:	0164c703          	lbu	a4,22(s1)
    80002638:	03071713          	slli	a4,a4,0x30
    8000263c:	00d766b3          	or	a3,a4,a3
    80002640:	0174c703          	lbu	a4,23(s1)
    80002644:	03871713          	slli	a4,a4,0x38
    80002648:	00d76733          	or	a4,a4,a3
    8000264c:	41270733          	sub	a4,a4,s2
    80002650:	fff70713          	addi	a4,a4,-1
    80002654:	00e78823          	sb	a4,16(a5)
    80002658:	00875693          	srli	a3,a4,0x8
    8000265c:	00d788a3          	sb	a3,17(a5)
    80002660:	01075693          	srli	a3,a4,0x10
    80002664:	00d78923          	sb	a3,18(a5)
    80002668:	0187569b          	srliw	a3,a4,0x18
    8000266c:	00d789a3          	sb	a3,19(a5)
    80002670:	02075693          	srli	a3,a4,0x20
    80002674:	00d78a23          	sb	a3,20(a5)
    80002678:	02875693          	srli	a3,a4,0x28
    8000267c:	00d78aa3          	sb	a3,21(a5)
    80002680:	03075693          	srli	a3,a4,0x30
    80002684:	00d78b23          	sb	a3,22(a5)
    80002688:	03875713          	srli	a4,a4,0x38
    8000268c:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80002690:	0004c703          	lbu	a4,0(s1)
    80002694:	0014c683          	lbu	a3,1(s1)
    80002698:	00869693          	slli	a3,a3,0x8
    8000269c:	00e6e733          	or	a4,a3,a4
    800026a0:	0024c683          	lbu	a3,2(s1)
    800026a4:	01069693          	slli	a3,a3,0x10
    800026a8:	00e6e6b3          	or	a3,a3,a4
    800026ac:	0034c703          	lbu	a4,3(s1)
    800026b0:	01871713          	slli	a4,a4,0x18
    800026b4:	00d766b3          	or	a3,a4,a3
    800026b8:	0044c703          	lbu	a4,4(s1)
    800026bc:	02071713          	slli	a4,a4,0x20
    800026c0:	00d76733          	or	a4,a4,a3
    800026c4:	0054c683          	lbu	a3,5(s1)
    800026c8:	02869693          	slli	a3,a3,0x28
    800026cc:	00e6e733          	or	a4,a3,a4
    800026d0:	0064c683          	lbu	a3,6(s1)
    800026d4:	03069693          	slli	a3,a3,0x30
    800026d8:	00e6e6b3          	or	a3,a3,a4
    800026dc:	0074c703          	lbu	a4,7(s1)
    800026e0:	03871713          	slli	a4,a4,0x38
    800026e4:	00d76733          	or	a4,a4,a3
    800026e8:	00d78023          	sb	a3,0(a5)
    800026ec:	00875693          	srli	a3,a4,0x8
    800026f0:	00d780a3          	sb	a3,1(a5)
    800026f4:	01075693          	srli	a3,a4,0x10
    800026f8:	00d78123          	sb	a3,2(a5)
    800026fc:	0187569b          	srliw	a3,a4,0x18
    80002700:	00d781a3          	sb	a3,3(a5)
    80002704:	02075693          	srli	a3,a4,0x20
    80002708:	00d78223          	sb	a3,4(a5)
    8000270c:	02875693          	srli	a3,a4,0x28
    80002710:	00d782a3          	sb	a3,5(a5)
    80002714:	03075693          	srli	a3,a4,0x30
    80002718:	00d78323          	sb	a3,6(a5)
    8000271c:	03875713          	srli	a4,a4,0x38
    80002720:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80002724:	00978423          	sb	s1,8(a5)
    80002728:	0084d713          	srli	a4,s1,0x8
    8000272c:	00e784a3          	sb	a4,9(a5)
    80002730:	0104d713          	srli	a4,s1,0x10
    80002734:	00e78523          	sb	a4,10(a5)
    80002738:	0184d71b          	srliw	a4,s1,0x18
    8000273c:	00e785a3          	sb	a4,11(a5)
    80002740:	0204d713          	srli	a4,s1,0x20
    80002744:	00e78623          	sb	a4,12(a5)
    80002748:	0284d713          	srli	a4,s1,0x28
    8000274c:	00e786a3          	sb	a4,13(a5)
    80002750:	0304d713          	srli	a4,s1,0x30
    80002754:	00e78723          	sb	a4,14(a5)
    80002758:	0384d713          	srli	a4,s1,0x38
    8000275c:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    80002760:	0004c703          	lbu	a4,0(s1)
    80002764:	0014c683          	lbu	a3,1(s1)
    80002768:	00869693          	slli	a3,a3,0x8
    8000276c:	00e6e6b3          	or	a3,a3,a4
    80002770:	0024c703          	lbu	a4,2(s1)
    80002774:	01071713          	slli	a4,a4,0x10
    80002778:	00d766b3          	or	a3,a4,a3
    8000277c:	0034c703          	lbu	a4,3(s1)
    80002780:	01871713          	slli	a4,a4,0x18
    80002784:	00d76733          	or	a4,a4,a3
    80002788:	0044c683          	lbu	a3,4(s1)
    8000278c:	02069693          	slli	a3,a3,0x20
    80002790:	00e6e733          	or	a4,a3,a4
    80002794:	0054c683          	lbu	a3,5(s1)
    80002798:	02869693          	slli	a3,a3,0x28
    8000279c:	00e6e6b3          	or	a3,a3,a4
    800027a0:	0064c703          	lbu	a4,6(s1)
    800027a4:	03071713          	slli	a4,a4,0x30
    800027a8:	00d766b3          	or	a3,a4,a3
    800027ac:	0074c703          	lbu	a4,7(s1)
    800027b0:	03871713          	slli	a4,a4,0x38
    800027b4:	00d76733          	or	a4,a4,a3
    800027b8:	04070063          	beqz	a4,800027f8 <_ZN11HeapManager12heapAllocateEm+0x364>
                    pCurrent->pNext->pPrev = pNew;
    800027bc:	00f70423          	sb	a5,8(a4)
    800027c0:	0087d693          	srli	a3,a5,0x8
    800027c4:	00d704a3          	sb	a3,9(a4)
    800027c8:	0107d693          	srli	a3,a5,0x10
    800027cc:	00d70523          	sb	a3,10(a4)
    800027d0:	0187d69b          	srliw	a3,a5,0x18
    800027d4:	00d705a3          	sb	a3,11(a4)
    800027d8:	0207d693          	srli	a3,a5,0x20
    800027dc:	00d70623          	sb	a3,12(a4)
    800027e0:	0287d693          	srli	a3,a5,0x28
    800027e4:	00d706a3          	sb	a3,13(a4)
    800027e8:	0307d693          	srli	a3,a5,0x30
    800027ec:	00d70723          	sb	a3,14(a4)
    800027f0:	0387d693          	srli	a3,a5,0x38
    800027f4:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    800027f8:	00f48023          	sb	a5,0(s1)
    800027fc:	0087d713          	srli	a4,a5,0x8
    80002800:	00e480a3          	sb	a4,1(s1)
    80002804:	0107d713          	srli	a4,a5,0x10
    80002808:	00e48123          	sb	a4,2(s1)
    8000280c:	0187d71b          	srliw	a4,a5,0x18
    80002810:	00e481a3          	sb	a4,3(s1)
    80002814:	0207d713          	srli	a4,a5,0x20
    80002818:	00e48223          	sb	a4,4(s1)
    8000281c:	0287d713          	srli	a4,a5,0x28
    80002820:	00e482a3          	sb	a4,5(s1)
    80002824:	0307d713          	srli	a4,a5,0x30
    80002828:	00e48323          	sb	a4,6(s1)
    8000282c:	0387d793          	srli	a5,a5,0x38
    80002830:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80002834:	01248823          	sb	s2,16(s1)
    80002838:	00895793          	srli	a5,s2,0x8
    8000283c:	00f488a3          	sb	a5,17(s1)
    80002840:	01095793          	srli	a5,s2,0x10
    80002844:	00f48923          	sb	a5,18(s1)
    80002848:	0189579b          	srliw	a5,s2,0x18
    8000284c:	00f489a3          	sb	a5,19(s1)
    80002850:	02095793          	srli	a5,s2,0x20
    80002854:	00f48a23          	sb	a5,20(s1)
    80002858:	02895793          	srli	a5,s2,0x28
    8000285c:	00f48aa3          	sb	a5,21(s1)
    80002860:	03095793          	srli	a5,s2,0x30
    80002864:	00f48b23          	sb	a5,22(s1)
    80002868:	03895913          	srli	s2,s2,0x38
    8000286c:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80002870:	0009b783          	ld	a5,0(s3)
    80002874:	20978863          	beq	a5,s1,80002a84 <_ZN11HeapManager12heapAllocateEm+0x5f0>
            if(pCurrent == m_pTail){
    80002878:	0089b783          	ld	a5,8(s3)
    8000287c:	26978463          	beq	a5,s1,80002ae4 <_ZN11HeapManager12heapAllocateEm+0x650>
            if(pCurrent->pPrev != 0){
    80002880:	0084c783          	lbu	a5,8(s1)
    80002884:	0094c703          	lbu	a4,9(s1)
    80002888:	00871713          	slli	a4,a4,0x8
    8000288c:	00f76733          	or	a4,a4,a5
    80002890:	00a4c783          	lbu	a5,10(s1)
    80002894:	01079793          	slli	a5,a5,0x10
    80002898:	00e7e733          	or	a4,a5,a4
    8000289c:	00b4c783          	lbu	a5,11(s1)
    800028a0:	01879793          	slli	a5,a5,0x18
    800028a4:	00e7e7b3          	or	a5,a5,a4
    800028a8:	00c4c703          	lbu	a4,12(s1)
    800028ac:	02071713          	slli	a4,a4,0x20
    800028b0:	00f767b3          	or	a5,a4,a5
    800028b4:	00d4c703          	lbu	a4,13(s1)
    800028b8:	02871713          	slli	a4,a4,0x28
    800028bc:	00f76733          	or	a4,a4,a5
    800028c0:	00e4c783          	lbu	a5,14(s1)
    800028c4:	03079793          	slli	a5,a5,0x30
    800028c8:	00e7e733          	or	a4,a5,a4
    800028cc:	00f4c783          	lbu	a5,15(s1)
    800028d0:	03879793          	slli	a5,a5,0x38
    800028d4:	00e7e7b3          	or	a5,a5,a4
    800028d8:	08078c63          	beqz	a5,80002970 <_ZN11HeapManager12heapAllocateEm+0x4dc>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    800028dc:	0004c703          	lbu	a4,0(s1)
    800028e0:	0014c683          	lbu	a3,1(s1)
    800028e4:	00869693          	slli	a3,a3,0x8
    800028e8:	00e6e733          	or	a4,a3,a4
    800028ec:	0024c683          	lbu	a3,2(s1)
    800028f0:	01069693          	slli	a3,a3,0x10
    800028f4:	00e6e6b3          	or	a3,a3,a4
    800028f8:	0034c703          	lbu	a4,3(s1)
    800028fc:	01871713          	slli	a4,a4,0x18
    80002900:	00d766b3          	or	a3,a4,a3
    80002904:	0044c703          	lbu	a4,4(s1)
    80002908:	02071713          	slli	a4,a4,0x20
    8000290c:	00d76733          	or	a4,a4,a3
    80002910:	0054c683          	lbu	a3,5(s1)
    80002914:	02869693          	slli	a3,a3,0x28
    80002918:	00e6e733          	or	a4,a3,a4
    8000291c:	0064c683          	lbu	a3,6(s1)
    80002920:	03069693          	slli	a3,a3,0x30
    80002924:	00e6e6b3          	or	a3,a3,a4
    80002928:	0074c703          	lbu	a4,7(s1)
    8000292c:	03871713          	slli	a4,a4,0x38
    80002930:	00d76733          	or	a4,a4,a3
    80002934:	00d78023          	sb	a3,0(a5)
    80002938:	00875693          	srli	a3,a4,0x8
    8000293c:	00d780a3          	sb	a3,1(a5)
    80002940:	01075693          	srli	a3,a4,0x10
    80002944:	00d78123          	sb	a3,2(a5)
    80002948:	0187569b          	srliw	a3,a4,0x18
    8000294c:	00d781a3          	sb	a3,3(a5)
    80002950:	02075693          	srli	a3,a4,0x20
    80002954:	00d78223          	sb	a3,4(a5)
    80002958:	02875693          	srli	a3,a4,0x28
    8000295c:	00d782a3          	sb	a3,5(a5)
    80002960:	03075693          	srli	a3,a4,0x30
    80002964:	00d78323          	sb	a3,6(a5)
    80002968:	03875713          	srli	a4,a4,0x38
    8000296c:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80002970:	0004c783          	lbu	a5,0(s1)
    80002974:	0014c703          	lbu	a4,1(s1)
    80002978:	00871713          	slli	a4,a4,0x8
    8000297c:	00f76733          	or	a4,a4,a5
    80002980:	0024c783          	lbu	a5,2(s1)
    80002984:	01079793          	slli	a5,a5,0x10
    80002988:	00e7e733          	or	a4,a5,a4
    8000298c:	0034c783          	lbu	a5,3(s1)
    80002990:	01879793          	slli	a5,a5,0x18
    80002994:	00e7e7b3          	or	a5,a5,a4
    80002998:	0044c703          	lbu	a4,4(s1)
    8000299c:	02071713          	slli	a4,a4,0x20
    800029a0:	00f767b3          	or	a5,a4,a5
    800029a4:	0054c703          	lbu	a4,5(s1)
    800029a8:	02871713          	slli	a4,a4,0x28
    800029ac:	00f76733          	or	a4,a4,a5
    800029b0:	0064c783          	lbu	a5,6(s1)
    800029b4:	03079793          	slli	a5,a5,0x30
    800029b8:	00e7e733          	or	a4,a5,a4
    800029bc:	0074c783          	lbu	a5,7(s1)
    800029c0:	03879793          	slli	a5,a5,0x38
    800029c4:	00e7e7b3          	or	a5,a5,a4
    800029c8:	08078c63          	beqz	a5,80002a60 <_ZN11HeapManager12heapAllocateEm+0x5cc>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    800029cc:	0084c703          	lbu	a4,8(s1)
    800029d0:	0094c683          	lbu	a3,9(s1)
    800029d4:	00869693          	slli	a3,a3,0x8
    800029d8:	00e6e733          	or	a4,a3,a4
    800029dc:	00a4c683          	lbu	a3,10(s1)
    800029e0:	01069693          	slli	a3,a3,0x10
    800029e4:	00e6e6b3          	or	a3,a3,a4
    800029e8:	00b4c703          	lbu	a4,11(s1)
    800029ec:	01871713          	slli	a4,a4,0x18
    800029f0:	00d766b3          	or	a3,a4,a3
    800029f4:	00c4c703          	lbu	a4,12(s1)
    800029f8:	02071713          	slli	a4,a4,0x20
    800029fc:	00d76733          	or	a4,a4,a3
    80002a00:	00d4c683          	lbu	a3,13(s1)
    80002a04:	02869693          	slli	a3,a3,0x28
    80002a08:	00e6e733          	or	a4,a3,a4
    80002a0c:	00e4c683          	lbu	a3,14(s1)
    80002a10:	03069693          	slli	a3,a3,0x30
    80002a14:	00e6e6b3          	or	a3,a3,a4
    80002a18:	00f4c703          	lbu	a4,15(s1)
    80002a1c:	03871713          	slli	a4,a4,0x38
    80002a20:	00d76733          	or	a4,a4,a3
    80002a24:	00d78423          	sb	a3,8(a5)
    80002a28:	00875693          	srli	a3,a4,0x8
    80002a2c:	00d784a3          	sb	a3,9(a5)
    80002a30:	01075693          	srli	a3,a4,0x10
    80002a34:	00d78523          	sb	a3,10(a5)
    80002a38:	0187569b          	srliw	a3,a4,0x18
    80002a3c:	00d785a3          	sb	a3,11(a5)
    80002a40:	02075693          	srli	a3,a4,0x20
    80002a44:	00d78623          	sb	a3,12(a5)
    80002a48:	02875693          	srli	a3,a4,0x28
    80002a4c:	00d786a3          	sb	a3,13(a5)
    80002a50:	03075693          	srli	a3,a4,0x30
    80002a54:	00d78723          	sb	a3,14(a5)
    80002a58:	03875713          	srli	a4,a4,0x38
    80002a5c:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    80002a60:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80002a64:	00048513          	mv	a0,s1
    80002a68:	02813083          	ld	ra,40(sp)
    80002a6c:	02013403          	ld	s0,32(sp)
    80002a70:	01813483          	ld	s1,24(sp)
    80002a74:	01013903          	ld	s2,16(sp)
    80002a78:	00813983          	ld	s3,8(sp)
    80002a7c:	03010113          	addi	sp,sp,48
    80002a80:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80002a84:	0004c703          	lbu	a4,0(s1)
    80002a88:	0014c783          	lbu	a5,1(s1)
    80002a8c:	00879793          	slli	a5,a5,0x8
    80002a90:	00e7e7b3          	or	a5,a5,a4
    80002a94:	0024c703          	lbu	a4,2(s1)
    80002a98:	01071713          	slli	a4,a4,0x10
    80002a9c:	00f76733          	or	a4,a4,a5
    80002aa0:	0034c783          	lbu	a5,3(s1)
    80002aa4:	01879793          	slli	a5,a5,0x18
    80002aa8:	00e7e733          	or	a4,a5,a4
    80002aac:	0044c783          	lbu	a5,4(s1)
    80002ab0:	02079793          	slli	a5,a5,0x20
    80002ab4:	00e7e7b3          	or	a5,a5,a4
    80002ab8:	0054c703          	lbu	a4,5(s1)
    80002abc:	02871713          	slli	a4,a4,0x28
    80002ac0:	00f76733          	or	a4,a4,a5
    80002ac4:	0064c783          	lbu	a5,6(s1)
    80002ac8:	03079793          	slli	a5,a5,0x30
    80002acc:	00e7e733          	or	a4,a5,a4
    80002ad0:	0074c783          	lbu	a5,7(s1)
    80002ad4:	03879793          	slli	a5,a5,0x38
    80002ad8:	00e7e7b3          	or	a5,a5,a4
    80002adc:	00f9b023          	sd	a5,0(s3)
    80002ae0:	d99ff06f          	j	80002878 <_ZN11HeapManager12heapAllocateEm+0x3e4>
                m_pTail = pCurrent->pPrev;
    80002ae4:	0084c703          	lbu	a4,8(s1)
    80002ae8:	0094c783          	lbu	a5,9(s1)
    80002aec:	00879793          	slli	a5,a5,0x8
    80002af0:	00e7e7b3          	or	a5,a5,a4
    80002af4:	00a4c703          	lbu	a4,10(s1)
    80002af8:	01071713          	slli	a4,a4,0x10
    80002afc:	00f76733          	or	a4,a4,a5
    80002b00:	00b4c783          	lbu	a5,11(s1)
    80002b04:	01879793          	slli	a5,a5,0x18
    80002b08:	00e7e733          	or	a4,a5,a4
    80002b0c:	00c4c783          	lbu	a5,12(s1)
    80002b10:	02079793          	slli	a5,a5,0x20
    80002b14:	00e7e7b3          	or	a5,a5,a4
    80002b18:	00d4c703          	lbu	a4,13(s1)
    80002b1c:	02871713          	slli	a4,a4,0x28
    80002b20:	00f76733          	or	a4,a4,a5
    80002b24:	00e4c783          	lbu	a5,14(s1)
    80002b28:	03079793          	slli	a5,a5,0x30
    80002b2c:	00e7e733          	or	a4,a5,a4
    80002b30:	00f4c783          	lbu	a5,15(s1)
    80002b34:	03879793          	slli	a5,a5,0x38
    80002b38:	00e7e7b3          	or	a5,a5,a4
    80002b3c:	00f9b423          	sd	a5,8(s3)
    80002b40:	d41ff06f          	j	80002880 <_ZN11HeapManager12heapAllocateEm+0x3ec>

0000000080002b44 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80002b44:	fc010113          	addi	sp,sp,-64
    80002b48:	02113c23          	sd	ra,56(sp)
    80002b4c:	02813823          	sd	s0,48(sp)
    80002b50:	02913423          	sd	s1,40(sp)
    80002b54:	03213023          	sd	s2,32(sp)
    80002b58:	01313c23          	sd	s3,24(sp)
    80002b5c:	01413823          	sd	s4,16(sp)
    80002b60:	01513423          	sd	s5,8(sp)
    80002b64:	04010413          	addi	s0,sp,64
    80002b68:	00050a93          	mv	s5,a0
    80002b6c:	00058a13          	mv	s4,a1
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pAddress) - MEM_BLOCK_SIZE);
    80002b70:	fc058913          	addi	s2,a1,-64
    80002b74:	00090993          	mv	s3,s2
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80002b78:	01894783          	lbu	a5,24(s2)
    80002b7c:	01994703          	lbu	a4,25(s2)
    80002b80:	00871713          	slli	a4,a4,0x8
    80002b84:	00f76733          	or	a4,a4,a5
    80002b88:	01a94783          	lbu	a5,26(s2)
    80002b8c:	01079793          	slli	a5,a5,0x10
    80002b90:	00e7e733          	or	a4,a5,a4
    80002b94:	01b94783          	lbu	a5,27(s2)
    80002b98:	01879793          	slli	a5,a5,0x18
    80002b9c:	00e7e7b3          	or	a5,a5,a4
    80002ba0:	0007879b          	sext.w	a5,a5
    80002ba4:	deadc737          	lui	a4,0xdeadc
    80002ba8:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead416e>
    80002bac:	00e79663          	bne	a5,a4,80002bb8 <_ZN11HeapManager8heapFreeEPv+0x74>
    HeapFreeSectionHeader* pInsert = m_pHead;
    80002bb0:	000ab483          	ld	s1,0(s5)
    80002bb4:	0740006f          	j	80002c28 <_ZN11HeapManager8heapFreeEPv+0xe4>
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80002bb8:	05700593          	li	a1,87
    80002bbc:	00003517          	auipc	a0,0x3
    80002bc0:	48450513          	addi	a0,a0,1156 # 80006040 <CONSOLE_STATUS+0x30>
    80002bc4:	fffff097          	auipc	ra,0xfffff
    80002bc8:	c1c080e7          	jalr	-996(ra) # 800017e0 <_Z13assert_failedPKci>
    80002bcc:	fe5ff06f          	j	80002bb0 <_ZN11HeapManager8heapFreeEPv+0x6c>
    while(pInsert != 0 && pInsert < pFree){
        assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
        pInsert = pInsert->pNext;
    80002bd0:	0004c703          	lbu	a4,0(s1)
    80002bd4:	0014c783          	lbu	a5,1(s1)
    80002bd8:	00879793          	slli	a5,a5,0x8
    80002bdc:	00e7e733          	or	a4,a5,a4
    80002be0:	0024c783          	lbu	a5,2(s1)
    80002be4:	01079793          	slli	a5,a5,0x10
    80002be8:	00e7e7b3          	or	a5,a5,a4
    80002bec:	0034c703          	lbu	a4,3(s1)
    80002bf0:	01871713          	slli	a4,a4,0x18
    80002bf4:	00f767b3          	or	a5,a4,a5
    80002bf8:	0044c703          	lbu	a4,4(s1)
    80002bfc:	02071713          	slli	a4,a4,0x20
    80002c00:	00f76733          	or	a4,a4,a5
    80002c04:	0054c783          	lbu	a5,5(s1)
    80002c08:	02879793          	slli	a5,a5,0x28
    80002c0c:	00e7e733          	or	a4,a5,a4
    80002c10:	0064c783          	lbu	a5,6(s1)
    80002c14:	03079793          	slli	a5,a5,0x30
    80002c18:	00e7e7b3          	or	a5,a5,a4
    80002c1c:	0074c483          	lbu	s1,7(s1)
    80002c20:	03849493          	slli	s1,s1,0x38
    80002c24:	00f4e4b3          	or	s1,s1,a5
    while(pInsert != 0 && pInsert < pFree){
    80002c28:	04048c63          	beqz	s1,80002c80 <_ZN11HeapManager8heapFreeEPv+0x13c>
    80002c2c:	0534fa63          	bgeu	s1,s3,80002c80 <_ZN11HeapManager8heapFreeEPv+0x13c>
        assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    80002c30:	0184c783          	lbu	a5,24(s1)
    80002c34:	0194c703          	lbu	a4,25(s1)
    80002c38:	00871713          	slli	a4,a4,0x8
    80002c3c:	00f76733          	or	a4,a4,a5
    80002c40:	01a4c783          	lbu	a5,26(s1)
    80002c44:	01079793          	slli	a5,a5,0x10
    80002c48:	00e7e733          	or	a4,a5,a4
    80002c4c:	01b4c783          	lbu	a5,27(s1)
    80002c50:	01879793          	slli	a5,a5,0x18
    80002c54:	00e7e7b3          	or	a5,a5,a4
    80002c58:	0007879b          	sext.w	a5,a5
    80002c5c:	deadc737          	lui	a4,0xdeadc
    80002c60:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead416e>
    80002c64:	f6e786e3          	beq	a5,a4,80002bd0 <_ZN11HeapManager8heapFreeEPv+0x8c>
    80002c68:	05a00593          	li	a1,90
    80002c6c:	00003517          	auipc	a0,0x3
    80002c70:	3d450513          	addi	a0,a0,980 # 80006040 <CONSOLE_STATUS+0x30>
    80002c74:	fffff097          	auipc	ra,0xfffff
    80002c78:	b6c080e7          	jalr	-1172(ra) # 800017e0 <_Z13assert_failedPKci>
    80002c7c:	f55ff06f          	j	80002bd0 <_ZN11HeapManager8heapFreeEPv+0x8c>
    }
    if(pInsert == 0){
    80002c80:	40048863          	beqz	s1,80003090 <_ZN11HeapManager8heapFreeEPv+0x54c>
        pFree->pPrev = m_pTail;
        pFree->pNext = 0;
        m_pTail->pNext = pFree;
        m_pTail = pFree;
    }else{
        pFree->pPrev = pInsert->pPrev;
    80002c84:	0084c783          	lbu	a5,8(s1)
    80002c88:	0094c703          	lbu	a4,9(s1)
    80002c8c:	00871713          	slli	a4,a4,0x8
    80002c90:	00f767b3          	or	a5,a4,a5
    80002c94:	00a4c703          	lbu	a4,10(s1)
    80002c98:	01071713          	slli	a4,a4,0x10
    80002c9c:	00f76733          	or	a4,a4,a5
    80002ca0:	00b4c783          	lbu	a5,11(s1)
    80002ca4:	01879793          	slli	a5,a5,0x18
    80002ca8:	00e7e733          	or	a4,a5,a4
    80002cac:	00c4c783          	lbu	a5,12(s1)
    80002cb0:	02079793          	slli	a5,a5,0x20
    80002cb4:	00e7e7b3          	or	a5,a5,a4
    80002cb8:	00d4c703          	lbu	a4,13(s1)
    80002cbc:	02871713          	slli	a4,a4,0x28
    80002cc0:	00f767b3          	or	a5,a4,a5
    80002cc4:	00e4c703          	lbu	a4,14(s1)
    80002cc8:	03071713          	slli	a4,a4,0x30
    80002ccc:	00f76733          	or	a4,a4,a5
    80002cd0:	00f4c783          	lbu	a5,15(s1)
    80002cd4:	03879793          	slli	a5,a5,0x38
    80002cd8:	00e7e7b3          	or	a5,a5,a4
    80002cdc:	00e90423          	sb	a4,8(s2)
    80002ce0:	0087d713          	srli	a4,a5,0x8
    80002ce4:	00e904a3          	sb	a4,9(s2)
    80002ce8:	0107d713          	srli	a4,a5,0x10
    80002cec:	00e90523          	sb	a4,10(s2)
    80002cf0:	0187d71b          	srliw	a4,a5,0x18
    80002cf4:	00e905a3          	sb	a4,11(s2)
    80002cf8:	0207d713          	srli	a4,a5,0x20
    80002cfc:	00e90623          	sb	a4,12(s2)
    80002d00:	0287d713          	srli	a4,a5,0x28
    80002d04:	00e906a3          	sb	a4,13(s2)
    80002d08:	0307d713          	srli	a4,a5,0x30
    80002d0c:	00e90723          	sb	a4,14(s2)
    80002d10:	0387d793          	srli	a5,a5,0x38
    80002d14:	00f907a3          	sb	a5,15(s2)
        pFree->pNext = pInsert;
    80002d18:	fc9a0023          	sb	s1,-64(s4)
    80002d1c:	0084d793          	srli	a5,s1,0x8
    80002d20:	00f900a3          	sb	a5,1(s2)
    80002d24:	0104d793          	srli	a5,s1,0x10
    80002d28:	00f90123          	sb	a5,2(s2)
    80002d2c:	0184d79b          	srliw	a5,s1,0x18
    80002d30:	00f901a3          	sb	a5,3(s2)
    80002d34:	0204d793          	srli	a5,s1,0x20
    80002d38:	00f90223          	sb	a5,4(s2)
    80002d3c:	0284d793          	srli	a5,s1,0x28
    80002d40:	00f902a3          	sb	a5,5(s2)
    80002d44:	0304d793          	srli	a5,s1,0x30
    80002d48:	00f90323          	sb	a5,6(s2)
    80002d4c:	0384d793          	srli	a5,s1,0x38
    80002d50:	00f903a3          	sb	a5,7(s2)
        if(pInsert->pPrev != 0){
    80002d54:	0084c783          	lbu	a5,8(s1)
    80002d58:	0094c703          	lbu	a4,9(s1)
    80002d5c:	00871713          	slli	a4,a4,0x8
    80002d60:	00f76733          	or	a4,a4,a5
    80002d64:	00a4c783          	lbu	a5,10(s1)
    80002d68:	01079793          	slli	a5,a5,0x10
    80002d6c:	00e7e733          	or	a4,a5,a4
    80002d70:	00b4c783          	lbu	a5,11(s1)
    80002d74:	01879793          	slli	a5,a5,0x18
    80002d78:	00e7e7b3          	or	a5,a5,a4
    80002d7c:	00c4c703          	lbu	a4,12(s1)
    80002d80:	02071713          	slli	a4,a4,0x20
    80002d84:	00f767b3          	or	a5,a4,a5
    80002d88:	00d4c703          	lbu	a4,13(s1)
    80002d8c:	02871713          	slli	a4,a4,0x28
    80002d90:	00f76733          	or	a4,a4,a5
    80002d94:	00e4c783          	lbu	a5,14(s1)
    80002d98:	03079793          	slli	a5,a5,0x30
    80002d9c:	00e7e733          	or	a4,a5,a4
    80002da0:	00f4c783          	lbu	a5,15(s1)
    80002da4:	03879793          	slli	a5,a5,0x38
    80002da8:	00e7e7b3          	or	a5,a5,a4
    80002dac:	04078063          	beqz	a5,80002dec <_ZN11HeapManager8heapFreeEPv+0x2a8>
            pInsert->pPrev->pNext = pFree;
    80002db0:	01278023          	sb	s2,0(a5)
    80002db4:	00895713          	srli	a4,s2,0x8
    80002db8:	00e780a3          	sb	a4,1(a5)
    80002dbc:	01095713          	srli	a4,s2,0x10
    80002dc0:	00e78123          	sb	a4,2(a5)
    80002dc4:	0189571b          	srliw	a4,s2,0x18
    80002dc8:	00e781a3          	sb	a4,3(a5)
    80002dcc:	02095713          	srli	a4,s2,0x20
    80002dd0:	00e78223          	sb	a4,4(a5)
    80002dd4:	02895713          	srli	a4,s2,0x28
    80002dd8:	00e782a3          	sb	a4,5(a5)
    80002ddc:	03095713          	srli	a4,s2,0x30
    80002de0:	00e78323          	sb	a4,6(a5)
    80002de4:	03895713          	srli	a4,s2,0x38
    80002de8:	00e783a3          	sb	a4,7(a5)
        }
        pInsert->pPrev = pFree;
    80002dec:	01248423          	sb	s2,8(s1)
    80002df0:	00895793          	srli	a5,s2,0x8
    80002df4:	00f484a3          	sb	a5,9(s1)
    80002df8:	01095793          	srli	a5,s2,0x10
    80002dfc:	00f48523          	sb	a5,10(s1)
    80002e00:	0189579b          	srliw	a5,s2,0x18
    80002e04:	00f485a3          	sb	a5,11(s1)
    80002e08:	02095793          	srli	a5,s2,0x20
    80002e0c:	00f48623          	sb	a5,12(s1)
    80002e10:	02895793          	srli	a5,s2,0x28
    80002e14:	00f486a3          	sb	a5,13(s1)
    80002e18:	03095793          	srli	a5,s2,0x30
    80002e1c:	00f48723          	sb	a5,14(s1)
    80002e20:	03895793          	srli	a5,s2,0x38
    80002e24:	00f487a3          	sb	a5,15(s1)
    }
    if(!pFree->pPrev){
    80002e28:	00894783          	lbu	a5,8(s2)
    80002e2c:	00994703          	lbu	a4,9(s2)
    80002e30:	00871713          	slli	a4,a4,0x8
    80002e34:	00f76733          	or	a4,a4,a5
    80002e38:	00a94783          	lbu	a5,10(s2)
    80002e3c:	01079793          	slli	a5,a5,0x10
    80002e40:	00e7e733          	or	a4,a5,a4
    80002e44:	00b94783          	lbu	a5,11(s2)
    80002e48:	01879793          	slli	a5,a5,0x18
    80002e4c:	00e7e7b3          	or	a5,a5,a4
    80002e50:	00c94703          	lbu	a4,12(s2)
    80002e54:	02071713          	slli	a4,a4,0x20
    80002e58:	00f767b3          	or	a5,a4,a5
    80002e5c:	00d94703          	lbu	a4,13(s2)
    80002e60:	02871713          	slli	a4,a4,0x28
    80002e64:	00f76733          	or	a4,a4,a5
    80002e68:	00e94783          	lbu	a5,14(s2)
    80002e6c:	03079793          	slli	a5,a5,0x30
    80002e70:	00e7e733          	or	a4,a5,a4
    80002e74:	00f94783          	lbu	a5,15(s2)
    80002e78:	03879793          	slli	a5,a5,0x38
    80002e7c:	00e7e7b3          	or	a5,a5,a4
    80002e80:	2a078c63          	beqz	a5,80003138 <_ZN11HeapManager8heapFreeEPv+0x5f4>
        m_pHead = pFree;
    }
    if(!pFree->pNext){
    80002e84:	fc0a4783          	lbu	a5,-64(s4)
    80002e88:	00194703          	lbu	a4,1(s2)
    80002e8c:	00871713          	slli	a4,a4,0x8
    80002e90:	00f76733          	or	a4,a4,a5
    80002e94:	00294783          	lbu	a5,2(s2)
    80002e98:	01079793          	slli	a5,a5,0x10
    80002e9c:	00e7e733          	or	a4,a5,a4
    80002ea0:	00394783          	lbu	a5,3(s2)
    80002ea4:	01879793          	slli	a5,a5,0x18
    80002ea8:	00e7e7b3          	or	a5,a5,a4
    80002eac:	00494703          	lbu	a4,4(s2)
    80002eb0:	02071713          	slli	a4,a4,0x20
    80002eb4:	00f767b3          	or	a5,a4,a5
    80002eb8:	00594703          	lbu	a4,5(s2)
    80002ebc:	02871713          	slli	a4,a4,0x28
    80002ec0:	00f76733          	or	a4,a4,a5
    80002ec4:	00694783          	lbu	a5,6(s2)
    80002ec8:	03079793          	slli	a5,a5,0x30
    80002ecc:	00e7e733          	or	a4,a5,a4
    80002ed0:	00794783          	lbu	a5,7(s2)
    80002ed4:	03879793          	slli	a5,a5,0x38
    80002ed8:	00e7e7b3          	or	a5,a5,a4
    80002edc:	26078263          	beqz	a5,80003140 <_ZN11HeapManager8heapFreeEPv+0x5fc>
        m_pTail = pFree;
    }

    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uintptr_t>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree)){
    80002ee0:	00894783          	lbu	a5,8(s2)
    80002ee4:	00994703          	lbu	a4,9(s2)
    80002ee8:	00871713          	slli	a4,a4,0x8
    80002eec:	00f76733          	or	a4,a4,a5
    80002ef0:	00a94783          	lbu	a5,10(s2)
    80002ef4:	01079793          	slli	a5,a5,0x10
    80002ef8:	00e7e733          	or	a4,a5,a4
    80002efc:	00b94783          	lbu	a5,11(s2)
    80002f00:	01879793          	slli	a5,a5,0x18
    80002f04:	00e7e7b3          	or	a5,a5,a4
    80002f08:	00c94703          	lbu	a4,12(s2)
    80002f0c:	02071713          	slli	a4,a4,0x20
    80002f10:	00f767b3          	or	a5,a4,a5
    80002f14:	00d94703          	lbu	a4,13(s2)
    80002f18:	02871713          	slli	a4,a4,0x28
    80002f1c:	00f76733          	or	a4,a4,a5
    80002f20:	00e94783          	lbu	a5,14(s2)
    80002f24:	03079793          	slli	a5,a5,0x30
    80002f28:	00e7e733          	or	a4,a5,a4
    80002f2c:	00f94783          	lbu	a5,15(s2)
    80002f30:	03879793          	slli	a5,a5,0x38
    80002f34:	00e7e7b3          	or	a5,a5,a4
    80002f38:	06078663          	beqz	a5,80002fa4 <_ZN11HeapManager8heapFreeEPv+0x460>
    80002f3c:	0107c703          	lbu	a4,16(a5)
    80002f40:	0117c683          	lbu	a3,17(a5)
    80002f44:	00869693          	slli	a3,a3,0x8
    80002f48:	00e6e6b3          	or	a3,a3,a4
    80002f4c:	0127c703          	lbu	a4,18(a5)
    80002f50:	01071713          	slli	a4,a4,0x10
    80002f54:	00d766b3          	or	a3,a4,a3
    80002f58:	0137c703          	lbu	a4,19(a5)
    80002f5c:	01871713          	slli	a4,a4,0x18
    80002f60:	00d76733          	or	a4,a4,a3
    80002f64:	0147c683          	lbu	a3,20(a5)
    80002f68:	02069693          	slli	a3,a3,0x20
    80002f6c:	00e6e733          	or	a4,a3,a4
    80002f70:	0157c683          	lbu	a3,21(a5)
    80002f74:	02869693          	slli	a3,a3,0x28
    80002f78:	00e6e6b3          	or	a3,a3,a4
    80002f7c:	0167c703          	lbu	a4,22(a5)
    80002f80:	03071713          	slli	a4,a4,0x30
    80002f84:	00d766b3          	or	a3,a4,a3
    80002f88:	0177c703          	lbu	a4,23(a5)
    80002f8c:	03871713          	slli	a4,a4,0x38
    80002f90:	00d76733          	or	a4,a4,a3
    80002f94:	00170693          	addi	a3,a4,1
    80002f98:	00669693          	slli	a3,a3,0x6
    80002f9c:	00d786b3          	add	a3,a5,a3
    80002fa0:	1ad90463          	beq	s2,a3,80003148 <_ZN11HeapManager8heapFreeEPv+0x604>
            m_pTail = pFree->pPrev;
        }
        pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uintptr_t>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree->pNext)){
    80002fa4:	0009c783          	lbu	a5,0(s3)
    80002fa8:	0019c703          	lbu	a4,1(s3)
    80002fac:	00871713          	slli	a4,a4,0x8
    80002fb0:	00f76733          	or	a4,a4,a5
    80002fb4:	0029c783          	lbu	a5,2(s3)
    80002fb8:	01079793          	slli	a5,a5,0x10
    80002fbc:	00e7e733          	or	a4,a5,a4
    80002fc0:	0039c783          	lbu	a5,3(s3)
    80002fc4:	01879793          	slli	a5,a5,0x18
    80002fc8:	00e7e7b3          	or	a5,a5,a4
    80002fcc:	0049c703          	lbu	a4,4(s3)
    80002fd0:	02071713          	slli	a4,a4,0x20
    80002fd4:	00f767b3          	or	a5,a4,a5
    80002fd8:	0059c703          	lbu	a4,5(s3)
    80002fdc:	02871713          	slli	a4,a4,0x28
    80002fe0:	00f76733          	or	a4,a4,a5
    80002fe4:	0069c783          	lbu	a5,6(s3)
    80002fe8:	03079793          	slli	a5,a5,0x30
    80002fec:	00e7e733          	or	a4,a5,a4
    80002ff0:	0079c783          	lbu	a5,7(s3)
    80002ff4:	03879793          	slli	a5,a5,0x38
    80002ff8:	00e7e7b3          	or	a5,a5,a4
    80002ffc:	06078663          	beqz	a5,80003068 <_ZN11HeapManager8heapFreeEPv+0x524>
    80003000:	0109c703          	lbu	a4,16(s3)
    80003004:	0119c683          	lbu	a3,17(s3)
    80003008:	00869693          	slli	a3,a3,0x8
    8000300c:	00e6e6b3          	or	a3,a3,a4
    80003010:	0129c703          	lbu	a4,18(s3)
    80003014:	01071713          	slli	a4,a4,0x10
    80003018:	00d766b3          	or	a3,a4,a3
    8000301c:	0139c703          	lbu	a4,19(s3)
    80003020:	01871713          	slli	a4,a4,0x18
    80003024:	00d76733          	or	a4,a4,a3
    80003028:	0149c683          	lbu	a3,20(s3)
    8000302c:	02069693          	slli	a3,a3,0x20
    80003030:	00e6e733          	or	a4,a3,a4
    80003034:	0159c683          	lbu	a3,21(s3)
    80003038:	02869693          	slli	a3,a3,0x28
    8000303c:	00e6e6b3          	or	a3,a3,a4
    80003040:	0169c703          	lbu	a4,22(s3)
    80003044:	03071713          	slli	a4,a4,0x30
    80003048:	00d766b3          	or	a3,a4,a3
    8000304c:	0179c703          	lbu	a4,23(s3)
    80003050:	03871713          	slli	a4,a4,0x38
    80003054:	00d76733          	or	a4,a4,a3
    80003058:	00170693          	addi	a3,a4,1
    8000305c:	00669693          	slli	a3,a3,0x6
    80003060:	00d986b3          	add	a3,s3,a3
    80003064:	40f68c63          	beq	a3,a5,8000347c <_ZN11HeapManager8heapFreeEPv+0x938>
        }else{
            m_pTail = pFree;
        }
    }
    return 0;
}
    80003068:	00000513          	li	a0,0
    8000306c:	03813083          	ld	ra,56(sp)
    80003070:	03013403          	ld	s0,48(sp)
    80003074:	02813483          	ld	s1,40(sp)
    80003078:	02013903          	ld	s2,32(sp)
    8000307c:	01813983          	ld	s3,24(sp)
    80003080:	01013a03          	ld	s4,16(sp)
    80003084:	00813a83          	ld	s5,8(sp)
    80003088:	04010113          	addi	sp,sp,64
    8000308c:	00008067          	ret
        pFree->pPrev = m_pTail;
    80003090:	008ab783          	ld	a5,8(s5)
    80003094:	00f90423          	sb	a5,8(s2)
    80003098:	0087d713          	srli	a4,a5,0x8
    8000309c:	00e904a3          	sb	a4,9(s2)
    800030a0:	0107d713          	srli	a4,a5,0x10
    800030a4:	00e90523          	sb	a4,10(s2)
    800030a8:	0187d71b          	srliw	a4,a5,0x18
    800030ac:	00e905a3          	sb	a4,11(s2)
    800030b0:	0207d713          	srli	a4,a5,0x20
    800030b4:	00e90623          	sb	a4,12(s2)
    800030b8:	0287d713          	srli	a4,a5,0x28
    800030bc:	00e906a3          	sb	a4,13(s2)
    800030c0:	0307d713          	srli	a4,a5,0x30
    800030c4:	00e90723          	sb	a4,14(s2)
    800030c8:	0387d793          	srli	a5,a5,0x38
    800030cc:	00f907a3          	sb	a5,15(s2)
        pFree->pNext = 0;
    800030d0:	fc0a0023          	sb	zero,-64(s4)
    800030d4:	000900a3          	sb	zero,1(s2)
    800030d8:	00090123          	sb	zero,2(s2)
    800030dc:	000901a3          	sb	zero,3(s2)
    800030e0:	00090223          	sb	zero,4(s2)
    800030e4:	000902a3          	sb	zero,5(s2)
    800030e8:	00090323          	sb	zero,6(s2)
    800030ec:	000903a3          	sb	zero,7(s2)
        m_pTail->pNext = pFree;
    800030f0:	008ab783          	ld	a5,8(s5)
    800030f4:	01278023          	sb	s2,0(a5)
    800030f8:	00895713          	srli	a4,s2,0x8
    800030fc:	00e780a3          	sb	a4,1(a5)
    80003100:	01095713          	srli	a4,s2,0x10
    80003104:	00e78123          	sb	a4,2(a5)
    80003108:	0189571b          	srliw	a4,s2,0x18
    8000310c:	00e781a3          	sb	a4,3(a5)
    80003110:	02095713          	srli	a4,s2,0x20
    80003114:	00e78223          	sb	a4,4(a5)
    80003118:	02895713          	srli	a4,s2,0x28
    8000311c:	00e782a3          	sb	a4,5(a5)
    80003120:	03095713          	srli	a4,s2,0x30
    80003124:	00e78323          	sb	a4,6(a5)
    80003128:	03895713          	srli	a4,s2,0x38
    8000312c:	00e783a3          	sb	a4,7(a5)
        m_pTail = pFree;
    80003130:	012ab423          	sd	s2,8(s5)
    80003134:	cf5ff06f          	j	80002e28 <_ZN11HeapManager8heapFreeEPv+0x2e4>
        m_pHead = pFree;
    80003138:	012ab023          	sd	s2,0(s5)
    8000313c:	d49ff06f          	j	80002e84 <_ZN11HeapManager8heapFreeEPv+0x340>
        m_pTail = pFree;
    80003140:	012ab423          	sd	s2,8(s5)
    80003144:	d9dff06f          	j	80002ee0 <_ZN11HeapManager8heapFreeEPv+0x39c>
        pFree->pPrev->nSize += pFree->nSize + 1;
    80003148:	01094683          	lbu	a3,16(s2)
    8000314c:	01194603          	lbu	a2,17(s2)
    80003150:	00861613          	slli	a2,a2,0x8
    80003154:	00d66633          	or	a2,a2,a3
    80003158:	01294683          	lbu	a3,18(s2)
    8000315c:	01069693          	slli	a3,a3,0x10
    80003160:	00c6e633          	or	a2,a3,a2
    80003164:	01394683          	lbu	a3,19(s2)
    80003168:	01869693          	slli	a3,a3,0x18
    8000316c:	00c6e6b3          	or	a3,a3,a2
    80003170:	01494603          	lbu	a2,20(s2)
    80003174:	02061613          	slli	a2,a2,0x20
    80003178:	00d666b3          	or	a3,a2,a3
    8000317c:	01594603          	lbu	a2,21(s2)
    80003180:	02861613          	slli	a2,a2,0x28
    80003184:	00d66633          	or	a2,a2,a3
    80003188:	01694683          	lbu	a3,22(s2)
    8000318c:	03069693          	slli	a3,a3,0x30
    80003190:	00c6e633          	or	a2,a3,a2
    80003194:	01794683          	lbu	a3,23(s2)
    80003198:	03869693          	slli	a3,a3,0x38
    8000319c:	00c6e6b3          	or	a3,a3,a2
    800031a0:	00d70733          	add	a4,a4,a3
    800031a4:	00170713          	addi	a4,a4,1
    800031a8:	00e78823          	sb	a4,16(a5)
    800031ac:	00875693          	srli	a3,a4,0x8
    800031b0:	00d788a3          	sb	a3,17(a5)
    800031b4:	01075693          	srli	a3,a4,0x10
    800031b8:	00d78923          	sb	a3,18(a5)
    800031bc:	0187569b          	srliw	a3,a4,0x18
    800031c0:	00d789a3          	sb	a3,19(a5)
    800031c4:	02075693          	srli	a3,a4,0x20
    800031c8:	00d78a23          	sb	a3,20(a5)
    800031cc:	02875693          	srli	a3,a4,0x28
    800031d0:	00d78aa3          	sb	a3,21(a5)
    800031d4:	03075693          	srli	a3,a4,0x30
    800031d8:	00d78b23          	sb	a3,22(a5)
    800031dc:	03875713          	srli	a4,a4,0x38
    800031e0:	00e78ba3          	sb	a4,23(a5)
        pFree->pPrev->pNext = pFree->pNext;
    800031e4:	00894703          	lbu	a4,8(s2)
    800031e8:	00994783          	lbu	a5,9(s2)
    800031ec:	00879793          	slli	a5,a5,0x8
    800031f0:	00e7e7b3          	or	a5,a5,a4
    800031f4:	00a94703          	lbu	a4,10(s2)
    800031f8:	01071713          	slli	a4,a4,0x10
    800031fc:	00f767b3          	or	a5,a4,a5
    80003200:	00b94703          	lbu	a4,11(s2)
    80003204:	01871713          	slli	a4,a4,0x18
    80003208:	00f76733          	or	a4,a4,a5
    8000320c:	00c94783          	lbu	a5,12(s2)
    80003210:	02079793          	slli	a5,a5,0x20
    80003214:	00e7e733          	or	a4,a5,a4
    80003218:	00d94783          	lbu	a5,13(s2)
    8000321c:	02879793          	slli	a5,a5,0x28
    80003220:	00e7e7b3          	or	a5,a5,a4
    80003224:	00e94703          	lbu	a4,14(s2)
    80003228:	03071713          	slli	a4,a4,0x30
    8000322c:	00f767b3          	or	a5,a4,a5
    80003230:	00f94703          	lbu	a4,15(s2)
    80003234:	03871713          	slli	a4,a4,0x38
    80003238:	00f76733          	or	a4,a4,a5
    8000323c:	fc0a4783          	lbu	a5,-64(s4)
    80003240:	00194683          	lbu	a3,1(s2)
    80003244:	00869693          	slli	a3,a3,0x8
    80003248:	00f6e7b3          	or	a5,a3,a5
    8000324c:	00294683          	lbu	a3,2(s2)
    80003250:	01069693          	slli	a3,a3,0x10
    80003254:	00f6e6b3          	or	a3,a3,a5
    80003258:	00394783          	lbu	a5,3(s2)
    8000325c:	01879793          	slli	a5,a5,0x18
    80003260:	00d7e6b3          	or	a3,a5,a3
    80003264:	00494783          	lbu	a5,4(s2)
    80003268:	02079793          	slli	a5,a5,0x20
    8000326c:	00d7e7b3          	or	a5,a5,a3
    80003270:	00594683          	lbu	a3,5(s2)
    80003274:	02869693          	slli	a3,a3,0x28
    80003278:	00f6e7b3          	or	a5,a3,a5
    8000327c:	00694683          	lbu	a3,6(s2)
    80003280:	03069693          	slli	a3,a3,0x30
    80003284:	00f6e6b3          	or	a3,a3,a5
    80003288:	00794783          	lbu	a5,7(s2)
    8000328c:	03879793          	slli	a5,a5,0x38
    80003290:	00d7e7b3          	or	a5,a5,a3
    80003294:	00d70023          	sb	a3,0(a4)
    80003298:	0087d693          	srli	a3,a5,0x8
    8000329c:	00d700a3          	sb	a3,1(a4)
    800032a0:	0107d693          	srli	a3,a5,0x10
    800032a4:	00d70123          	sb	a3,2(a4)
    800032a8:	0187d69b          	srliw	a3,a5,0x18
    800032ac:	00d701a3          	sb	a3,3(a4)
    800032b0:	0207d693          	srli	a3,a5,0x20
    800032b4:	00d70223          	sb	a3,4(a4)
    800032b8:	0287d693          	srli	a3,a5,0x28
    800032bc:	00d702a3          	sb	a3,5(a4)
    800032c0:	0307d693          	srli	a3,a5,0x30
    800032c4:	00d70323          	sb	a3,6(a4)
    800032c8:	0387d793          	srli	a5,a5,0x38
    800032cc:	00f703a3          	sb	a5,7(a4)
        if(pFree->pNext != 0){
    800032d0:	fc0a4783          	lbu	a5,-64(s4)
    800032d4:	00194703          	lbu	a4,1(s2)
    800032d8:	00871713          	slli	a4,a4,0x8
    800032dc:	00f76733          	or	a4,a4,a5
    800032e0:	00294783          	lbu	a5,2(s2)
    800032e4:	01079793          	slli	a5,a5,0x10
    800032e8:	00e7e733          	or	a4,a5,a4
    800032ec:	00394783          	lbu	a5,3(s2)
    800032f0:	01879793          	slli	a5,a5,0x18
    800032f4:	00e7e7b3          	or	a5,a5,a4
    800032f8:	00494703          	lbu	a4,4(s2)
    800032fc:	02071713          	slli	a4,a4,0x20
    80003300:	00f767b3          	or	a5,a4,a5
    80003304:	00594703          	lbu	a4,5(s2)
    80003308:	02871713          	slli	a4,a4,0x28
    8000330c:	00f76733          	or	a4,a4,a5
    80003310:	00694783          	lbu	a5,6(s2)
    80003314:	03079793          	slli	a5,a5,0x30
    80003318:	00e7e733          	or	a4,a5,a4
    8000331c:	00794783          	lbu	a5,7(s2)
    80003320:	03879793          	slli	a5,a5,0x38
    80003324:	00e7e7b3          	or	a5,a5,a4
    80003328:	0e078a63          	beqz	a5,8000341c <_ZN11HeapManager8heapFreeEPv+0x8d8>
            pFree->pNext->pPrev = pFree->pPrev;
    8000332c:	00894703          	lbu	a4,8(s2)
    80003330:	00994683          	lbu	a3,9(s2)
    80003334:	00869693          	slli	a3,a3,0x8
    80003338:	00e6e733          	or	a4,a3,a4
    8000333c:	00a94683          	lbu	a3,10(s2)
    80003340:	01069693          	slli	a3,a3,0x10
    80003344:	00e6e6b3          	or	a3,a3,a4
    80003348:	00b94703          	lbu	a4,11(s2)
    8000334c:	01871713          	slli	a4,a4,0x18
    80003350:	00d766b3          	or	a3,a4,a3
    80003354:	00c94703          	lbu	a4,12(s2)
    80003358:	02071713          	slli	a4,a4,0x20
    8000335c:	00d76733          	or	a4,a4,a3
    80003360:	00d94683          	lbu	a3,13(s2)
    80003364:	02869693          	slli	a3,a3,0x28
    80003368:	00e6e733          	or	a4,a3,a4
    8000336c:	00e94683          	lbu	a3,14(s2)
    80003370:	03069693          	slli	a3,a3,0x30
    80003374:	00e6e6b3          	or	a3,a3,a4
    80003378:	00f94703          	lbu	a4,15(s2)
    8000337c:	03871713          	slli	a4,a4,0x38
    80003380:	00d76733          	or	a4,a4,a3
    80003384:	00d78423          	sb	a3,8(a5)
    80003388:	00875693          	srli	a3,a4,0x8
    8000338c:	00d784a3          	sb	a3,9(a5)
    80003390:	01075693          	srli	a3,a4,0x10
    80003394:	00d78523          	sb	a3,10(a5)
    80003398:	0187569b          	srliw	a3,a4,0x18
    8000339c:	00d785a3          	sb	a3,11(a5)
    800033a0:	02075693          	srli	a3,a4,0x20
    800033a4:	00d78623          	sb	a3,12(a5)
    800033a8:	02875693          	srli	a3,a4,0x28
    800033ac:	00d786a3          	sb	a3,13(a5)
    800033b0:	03075693          	srli	a3,a4,0x30
    800033b4:	00d78723          	sb	a3,14(a5)
    800033b8:	03875713          	srli	a4,a4,0x38
    800033bc:	00e787a3          	sb	a4,15(a5)
        pFree = pFree->pPrev;
    800033c0:	00894983          	lbu	s3,8(s2)
    800033c4:	00994783          	lbu	a5,9(s2)
    800033c8:	00879793          	slli	a5,a5,0x8
    800033cc:	0137e7b3          	or	a5,a5,s3
    800033d0:	00a94983          	lbu	s3,10(s2)
    800033d4:	01099993          	slli	s3,s3,0x10
    800033d8:	00f9e7b3          	or	a5,s3,a5
    800033dc:	00b94983          	lbu	s3,11(s2)
    800033e0:	01899993          	slli	s3,s3,0x18
    800033e4:	00f9e9b3          	or	s3,s3,a5
    800033e8:	00c94783          	lbu	a5,12(s2)
    800033ec:	02079793          	slli	a5,a5,0x20
    800033f0:	0137e9b3          	or	s3,a5,s3
    800033f4:	00d94783          	lbu	a5,13(s2)
    800033f8:	02879793          	slli	a5,a5,0x28
    800033fc:	0137e7b3          	or	a5,a5,s3
    80003400:	00e94983          	lbu	s3,14(s2)
    80003404:	03099993          	slli	s3,s3,0x30
    80003408:	00f9e7b3          	or	a5,s3,a5
    8000340c:	00f94983          	lbu	s3,15(s2)
    80003410:	03899993          	slli	s3,s3,0x38
    80003414:	00f9e9b3          	or	s3,s3,a5
    80003418:	b8dff06f          	j	80002fa4 <_ZN11HeapManager8heapFreeEPv+0x460>
            m_pTail = pFree->pPrev;
    8000341c:	00894703          	lbu	a4,8(s2)
    80003420:	00994783          	lbu	a5,9(s2)
    80003424:	00879793          	slli	a5,a5,0x8
    80003428:	00e7e7b3          	or	a5,a5,a4
    8000342c:	00a94703          	lbu	a4,10(s2)
    80003430:	01071713          	slli	a4,a4,0x10
    80003434:	00f76733          	or	a4,a4,a5
    80003438:	00b94783          	lbu	a5,11(s2)
    8000343c:	01879793          	slli	a5,a5,0x18
    80003440:	00e7e733          	or	a4,a5,a4
    80003444:	00c94783          	lbu	a5,12(s2)
    80003448:	02079793          	slli	a5,a5,0x20
    8000344c:	00e7e7b3          	or	a5,a5,a4
    80003450:	00d94703          	lbu	a4,13(s2)
    80003454:	02871713          	slli	a4,a4,0x28
    80003458:	00f76733          	or	a4,a4,a5
    8000345c:	00e94783          	lbu	a5,14(s2)
    80003460:	03079793          	slli	a5,a5,0x30
    80003464:	00e7e733          	or	a4,a5,a4
    80003468:	00f94783          	lbu	a5,15(s2)
    8000346c:	03879793          	slli	a5,a5,0x38
    80003470:	00e7e7b3          	or	a5,a5,a4
    80003474:	00fab423          	sd	a5,8(s5)
    80003478:	f49ff06f          	j	800033c0 <_ZN11HeapManager8heapFreeEPv+0x87c>
        pFree->nSize += pFree->pNext->nSize + 1;
    8000347c:	0107c683          	lbu	a3,16(a5)
    80003480:	0117c603          	lbu	a2,17(a5)
    80003484:	00861613          	slli	a2,a2,0x8
    80003488:	00d66633          	or	a2,a2,a3
    8000348c:	0127c683          	lbu	a3,18(a5)
    80003490:	01069693          	slli	a3,a3,0x10
    80003494:	00c6e633          	or	a2,a3,a2
    80003498:	0137c683          	lbu	a3,19(a5)
    8000349c:	01869693          	slli	a3,a3,0x18
    800034a0:	00c6e6b3          	or	a3,a3,a2
    800034a4:	0147c603          	lbu	a2,20(a5)
    800034a8:	02061613          	slli	a2,a2,0x20
    800034ac:	00d666b3          	or	a3,a2,a3
    800034b0:	0157c603          	lbu	a2,21(a5)
    800034b4:	02861613          	slli	a2,a2,0x28
    800034b8:	00d66633          	or	a2,a2,a3
    800034bc:	0167c683          	lbu	a3,22(a5)
    800034c0:	03069693          	slli	a3,a3,0x30
    800034c4:	00c6e633          	or	a2,a3,a2
    800034c8:	0177c683          	lbu	a3,23(a5)
    800034cc:	03869693          	slli	a3,a3,0x38
    800034d0:	00c6e6b3          	or	a3,a3,a2
    800034d4:	00d70733          	add	a4,a4,a3
    800034d8:	00170713          	addi	a4,a4,1
    800034dc:	00e98823          	sb	a4,16(s3)
    800034e0:	00875693          	srli	a3,a4,0x8
    800034e4:	00d988a3          	sb	a3,17(s3)
    800034e8:	01075693          	srli	a3,a4,0x10
    800034ec:	00d98923          	sb	a3,18(s3)
    800034f0:	0187569b          	srliw	a3,a4,0x18
    800034f4:	00d989a3          	sb	a3,19(s3)
    800034f8:	02075693          	srli	a3,a4,0x20
    800034fc:	00d98a23          	sb	a3,20(s3)
    80003500:	02875693          	srli	a3,a4,0x28
    80003504:	00d98aa3          	sb	a3,21(s3)
    80003508:	03075693          	srli	a3,a4,0x30
    8000350c:	00d98b23          	sb	a3,22(s3)
    80003510:	03875713          	srli	a4,a4,0x38
    80003514:	00e98ba3          	sb	a4,23(s3)
        pFree->pNext = pFree->pNext->pNext;
    80003518:	0007c683          	lbu	a3,0(a5)
    8000351c:	0017c703          	lbu	a4,1(a5)
    80003520:	00871713          	slli	a4,a4,0x8
    80003524:	00d766b3          	or	a3,a4,a3
    80003528:	0027c703          	lbu	a4,2(a5)
    8000352c:	01071713          	slli	a4,a4,0x10
    80003530:	00d76733          	or	a4,a4,a3
    80003534:	0037c683          	lbu	a3,3(a5)
    80003538:	01869693          	slli	a3,a3,0x18
    8000353c:	00e6e733          	or	a4,a3,a4
    80003540:	0047c683          	lbu	a3,4(a5)
    80003544:	02069693          	slli	a3,a3,0x20
    80003548:	00e6e6b3          	or	a3,a3,a4
    8000354c:	0057c703          	lbu	a4,5(a5)
    80003550:	02871713          	slli	a4,a4,0x28
    80003554:	00d766b3          	or	a3,a4,a3
    80003558:	0067c703          	lbu	a4,6(a5)
    8000355c:	03071713          	slli	a4,a4,0x30
    80003560:	00d76733          	or	a4,a4,a3
    80003564:	0077c783          	lbu	a5,7(a5)
    80003568:	03879793          	slli	a5,a5,0x38
    8000356c:	00e7e7b3          	or	a5,a5,a4
    80003570:	00e98023          	sb	a4,0(s3)
    80003574:	0087d713          	srli	a4,a5,0x8
    80003578:	00e980a3          	sb	a4,1(s3)
    8000357c:	0107d713          	srli	a4,a5,0x10
    80003580:	00e98123          	sb	a4,2(s3)
    80003584:	0187d71b          	srliw	a4,a5,0x18
    80003588:	00e981a3          	sb	a4,3(s3)
    8000358c:	0207d713          	srli	a4,a5,0x20
    80003590:	00e98223          	sb	a4,4(s3)
    80003594:	0287d713          	srli	a4,a5,0x28
    80003598:	00e982a3          	sb	a4,5(s3)
    8000359c:	0307d713          	srli	a4,a5,0x30
    800035a0:	00e98323          	sb	a4,6(s3)
    800035a4:	0387d713          	srli	a4,a5,0x38
    800035a8:	00e983a3          	sb	a4,7(s3)
        if(pFree->pNext != 0){
    800035ac:	04078263          	beqz	a5,800035f0 <_ZN11HeapManager8heapFreeEPv+0xaac>
            pFree->pNext->pPrev = pFree;
    800035b0:	01378423          	sb	s3,8(a5)
    800035b4:	0089d713          	srli	a4,s3,0x8
    800035b8:	00e784a3          	sb	a4,9(a5)
    800035bc:	0109d713          	srli	a4,s3,0x10
    800035c0:	00e78523          	sb	a4,10(a5)
    800035c4:	0189d71b          	srliw	a4,s3,0x18
    800035c8:	00e785a3          	sb	a4,11(a5)
    800035cc:	0209d713          	srli	a4,s3,0x20
    800035d0:	00e78623          	sb	a4,12(a5)
    800035d4:	0289d713          	srli	a4,s3,0x28
    800035d8:	00e786a3          	sb	a4,13(a5)
    800035dc:	0309d713          	srli	a4,s3,0x30
    800035e0:	00e78723          	sb	a4,14(a5)
    800035e4:	0389d993          	srli	s3,s3,0x38
    800035e8:	013787a3          	sb	s3,15(a5)
    800035ec:	a7dff06f          	j	80003068 <_ZN11HeapManager8heapFreeEPv+0x524>
            m_pTail = pFree;
    800035f0:	013ab423          	sd	s3,8(s5)
    800035f4:	a75ff06f          	j	80003068 <_ZN11HeapManager8heapFreeEPv+0x524>

00000000800035f8 <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"


extern "C" void exceptionHandler(){
    800035f8:	fc010113          	addi	sp,sp,-64
    800035fc:	02113c23          	sd	ra,56(sp)
    80003600:	02813823          	sd	s0,48(sp)
    80003604:	02913423          	sd	s1,40(sp)
    80003608:	03213023          	sd	s2,32(sp)
    8000360c:	01313c23          	sd	s3,24(sp)
    80003610:	01413823          	sd	s4,16(sp)
    80003614:	01513423          	sd	s5,8(sp)
    80003618:	04010413          	addi	s0,sp,64

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    8000361c:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80003620:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80003624:	141024f3          	csrr	s1,sepc

    uint64 a0 = 0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80003628:	00050793          	mv	a5,a0
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    8000362c:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    80003630:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    80003634:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    80003638:	00070693          	mv	a3,a4
    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    8000363c:	ff870613          	addi	a2,a4,-8
    80003640:	00100693          	li	a3,1
    80003644:	02c6fc63          	bgeu	a3,a2,8000367c <exceptionHandler+0x84>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, 0x2");
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    80003648:	fff00793          	li	a5,-1
    8000364c:	03f79793          	slli	a5,a5,0x3f
    80003650:	00178793          	addi	a5,a5,1
    80003654:	18f70a63          	beq	a4,a5,800037e8 <exceptionHandler+0x1f0>
        __putc('x');
        Timer::getInstance().tick();
    }
    80003658:	03813083          	ld	ra,56(sp)
    8000365c:	03013403          	ld	s0,48(sp)
    80003660:	02813483          	ld	s1,40(sp)
    80003664:	02013903          	ld	s2,32(sp)
    80003668:	01813983          	ld	s3,24(sp)
    8000366c:	01013a03          	ld	s4,16(sp)
    80003670:	00813a83          	ld	s5,8(sp)
    80003674:	04010113          	addi	sp,sp,64
    80003678:	00008067          	ret
        switch(a0){
    8000367c:	04200713          	li	a4,66
    80003680:	16f76063          	bltu	a4,a5,800037e0 <exceptionHandler+0x1e8>
    80003684:	00279793          	slli	a5,a5,0x2
    80003688:	00003717          	auipc	a4,0x3
    8000368c:	9cc70713          	addi	a4,a4,-1588 # 80006054 <CONSOLE_STATUS+0x44>
    80003690:	00e787b3          	add	a5,a5,a4
    80003694:	0007a783          	lw	a5,0(a5)
    80003698:	00e787b3          	add	a5,a5,a4
    8000369c:	00078067          	jr	a5
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    800036a0:	00098593          	mv	a1,s3
    800036a4:	00003797          	auipc	a5,0x3
    800036a8:	5d47b783          	ld	a5,1492(a5) # 80006c78 <_GLOBAL_OFFSET_TABLE_+0x10>
    800036ac:	0007b503          	ld	a0,0(a5)
    800036b0:	fffff097          	auipc	ra,0xfffff
    800036b4:	de4080e7          	jalr	-540(ra) # 80002494 <_ZN11HeapManager12heapAllocateEm>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800036b8:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800036bc:	00448493          	addi	s1,s1,4
    800036c0:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800036c4:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, 0x2");
    800036c8:	14417073          	csrci	sip,2
    800036cc:	f8dff06f          	j	80003658 <exceptionHandler+0x60>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    800036d0:	00098593          	mv	a1,s3
    800036d4:	00003797          	auipc	a5,0x3
    800036d8:	5a47b783          	ld	a5,1444(a5) # 80006c78 <_GLOBAL_OFFSET_TABLE_+0x10>
    800036dc:	0007b503          	ld	a0,0(a5)
    800036e0:	fffff097          	auipc	ra,0xfffff
    800036e4:	464080e7          	jalr	1124(ra) # 80002b44 <_ZN11HeapManager8heapFreeEPv>
                break;
    800036e8:	fd1ff06f          	j	800036b8 <exceptionHandler+0xc0>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)((uint64)HeapManager::getInstance().heapAllocate(DEFAULT_STACK_SIZE / MEM_BLOCK_SIZE) + DEFAULT_STACK_SIZE - 1));
    800036ec:	04000593          	li	a1,64
    800036f0:	00003797          	auipc	a5,0x3
    800036f4:	5887b783          	ld	a5,1416(a5) # 80006c78 <_GLOBAL_OFFSET_TABLE_+0x10>
    800036f8:	0007b503          	ld	a0,0(a5)
    800036fc:	fffff097          	auipc	ra,0xfffff
    80003700:	d98080e7          	jalr	-616(ra) # 80002494 <_ZN11HeapManager12heapAllocateEm>
    80003704:	00100713          	li	a4,1
    80003708:	000017b7          	lui	a5,0x1
    8000370c:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80003710:	00f506b3          	add	a3,a0,a5
    80003714:	000a8613          	mv	a2,s5
    80003718:	000a0593          	mv	a1,s4
    8000371c:	00098513          	mv	a0,s3
    80003720:	ffffe097          	auipc	ra,0xffffe
    80003724:	658080e7          	jalr	1624(ra) # 80001d78 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80003728:	f91ff06f          	j	800036b8 <exceptionHandler+0xc0>
                returnVal = _thread::currentThread->exit();
    8000372c:	00003797          	auipc	a5,0x3
    80003730:	56c7b783          	ld	a5,1388(a5) # 80006c98 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003734:	0007b503          	ld	a0,0(a5)
    80003738:	fffff097          	auipc	ra,0xfffff
    8000373c:	a50080e7          	jalr	-1456(ra) # 80002188 <_ZN7_thread4exitEv>
                break;
    80003740:	f79ff06f          	j	800036b8 <exceptionHandler+0xc0>
                _thread::dispatch();
    80003744:	fffff097          	auipc	ra,0xfffff
    80003748:	96c080e7          	jalr	-1684(ra) # 800020b0 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    8000374c:	00000513          	li	a0,0
                break;
    80003750:	f69ff06f          	j	800036b8 <exceptionHandler+0xc0>
                _sem::open((sem_t*)a1, unsigned(a2));
    80003754:	000a059b          	sext.w	a1,s4
    80003758:	00098513          	mv	a0,s3
    8000375c:	ffffe097          	auipc	ra,0xffffe
    80003760:	e24080e7          	jalr	-476(ra) # 80001580 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80003764:	00000513          	li	a0,0
                break;
    80003768:	f51ff06f          	j	800036b8 <exceptionHandler+0xc0>
                _sem::close((sem_t)a1);
    8000376c:	00098513          	mv	a0,s3
    80003770:	ffffe097          	auipc	ra,0xffffe
    80003774:	e40080e7          	jalr	-448(ra) # 800015b0 <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80003778:	00000513          	li	a0,0
                break;
    8000377c:	f3dff06f          	j	800036b8 <exceptionHandler+0xc0>
                _sem::wait((sem_t)a1);
    80003780:	00098513          	mv	a0,s3
    80003784:	ffffe097          	auipc	ra,0xffffe
    80003788:	e8c080e7          	jalr	-372(ra) # 80001610 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    8000378c:	00000513          	li	a0,0
                break;
    80003790:	f29ff06f          	j	800036b8 <exceptionHandler+0xc0>
                _sem::signal((sem_t)a1);
    80003794:	00098513          	mv	a0,s3
    80003798:	ffffe097          	auipc	ra,0xffffe
    8000379c:	f1c080e7          	jalr	-228(ra) # 800016b4 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    800037a0:	00000513          	li	a0,0
                break;
    800037a4:	f15ff06f          	j	800036b8 <exceptionHandler+0xc0>
                returnVal = Timer::getInstance().sleep(a1);
    800037a8:	ffffe097          	auipc	ra,0xffffe
    800037ac:	a00080e7          	jalr	-1536(ra) # 800011a8 <_ZN5Timer11getInstanceEv>
    800037b0:	00098593          	mv	a1,s3
    800037b4:	ffffe097          	auipc	ra,0xffffe
    800037b8:	ae4080e7          	jalr	-1308(ra) # 80001298 <_ZN5Timer5sleepEm>
                break;
    800037bc:	efdff06f          	j	800036b8 <exceptionHandler+0xc0>
                returnVal = __getc();
    800037c0:	00002097          	auipc	ra,0x2
    800037c4:	4b8080e7          	jalr	1208(ra) # 80005c78 <__getc>
                break;
    800037c8:	ef1ff06f          	j	800036b8 <exceptionHandler+0xc0>
                __putc(a1);
    800037cc:	0ff9f513          	andi	a0,s3,255
    800037d0:	00002097          	auipc	ra,0x2
    800037d4:	46c080e7          	jalr	1132(ra) # 80005c3c <__putc>
    uint64 returnVal = 0;
    800037d8:	00000513          	li	a0,0
                break;
    800037dc:	eddff06f          	j	800036b8 <exceptionHandler+0xc0>
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    800037e0:	00000513          	li	a0,0
    800037e4:	ed5ff06f          	j	800036b8 <exceptionHandler+0xc0>
        __putc('x');
    800037e8:	07800513          	li	a0,120
    800037ec:	00002097          	auipc	ra,0x2
    800037f0:	450080e7          	jalr	1104(ra) # 80005c3c <__putc>
        Timer::getInstance().tick();
    800037f4:	ffffe097          	auipc	ra,0xffffe
    800037f8:	9b4080e7          	jalr	-1612(ra) # 800011a8 <_ZN5Timer11getInstanceEv>
    800037fc:	ffffe097          	auipc	ra,0xffffe
    80003800:	a00080e7          	jalr	-1536(ra) # 800011fc <_ZN5Timer4tickEv>
    80003804:	e55ff06f          	j	80003658 <exceptionHandler+0x60>

0000000080003808 <_ZN9SchedulerC1Ev>:
#include "assert.h"
#include "syscalls_c.h"

Scheduler* Scheduler::singleton = nullptr;

Scheduler::Scheduler(){
    80003808:	fe010113          	addi	sp,sp,-32
    8000380c:	00113c23          	sd	ra,24(sp)
    80003810:	00813823          	sd	s0,16(sp)
    80003814:	00913423          	sd	s1,8(sp)
    80003818:	02010413          	addi	s0,sp,32
    8000381c:	00050493          	mv	s1,a0
    assert(singleton == nullptr);
    80003820:	00003797          	auipc	a5,0x3
    80003824:	4e87b783          	ld	a5,1256(a5) # 80006d08 <_ZN9Scheduler9singletonE>
    80003828:	02079463          	bnez	a5,80003850 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    8000382c:	00003797          	auipc	a5,0x3
    80003830:	4c97be23          	sd	s1,1244(a5) # 80006d08 <_ZN9Scheduler9singletonE>
    head = nullptr;
    80003834:	0004b023          	sd	zero,0(s1)
    tail = nullptr;
    80003838:	0004b423          	sd	zero,8(s1)
}
    8000383c:	01813083          	ld	ra,24(sp)
    80003840:	01013403          	ld	s0,16(sp)
    80003844:	00813483          	ld	s1,8(sp)
    80003848:	02010113          	addi	sp,sp,32
    8000384c:	00008067          	ret
    assert(singleton == nullptr);
    80003850:	01300593          	li	a1,19
    80003854:	00003517          	auipc	a0,0x3
    80003858:	90c50513          	addi	a0,a0,-1780 # 80006160 <CONSOLE_STATUS+0x150>
    8000385c:	ffffe097          	auipc	ra,0xffffe
    80003860:	f84080e7          	jalr	-124(ra) # 800017e0 <_Z13assert_failedPKci>
    80003864:	fc9ff06f          	j	8000382c <_ZN9SchedulerC1Ev+0x24>

0000000080003868 <_ZN9Scheduler7isEmptyEv>:

// Scheduler* Scheduler::getInstance(){
//     return singleton;
// }

bool Scheduler::isEmpty(){
    80003868:	ff010113          	addi	sp,sp,-16
    8000386c:	00813423          	sd	s0,8(sp)
    80003870:	01010413          	addi	s0,sp,16
    return singleton->head == nullptr;
    80003874:	00003797          	auipc	a5,0x3
    80003878:	4947b783          	ld	a5,1172(a5) # 80006d08 <_ZN9Scheduler9singletonE>
    8000387c:	0007b503          	ld	a0,0(a5)
}
    80003880:	00153513          	seqz	a0,a0
    80003884:	00813403          	ld	s0,8(sp)
    80003888:	01010113          	addi	sp,sp,16
    8000388c:	00008067          	ret

0000000080003890 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80003890:	fe010113          	addi	sp,sp,-32
    80003894:	00113c23          	sd	ra,24(sp)
    80003898:	00813823          	sd	s0,16(sp)
    8000389c:	00913423          	sd	s1,8(sp)
    800038a0:	01213023          	sd	s2,0(sp)
    800038a4:	02010413          	addi	s0,sp,32
    800038a8:	00050493          	mv	s1,a0
    if(singleton->head == nullptr){
    800038ac:	00003917          	auipc	s2,0x3
    800038b0:	45c93903          	ld	s2,1116(s2) # 80006d08 <_ZN9Scheduler9singletonE>
    800038b4:	00093783          	ld	a5,0(s2)
    800038b8:	12078c63          	beqz	a5,800039f0 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = nullptr;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    800038bc:	00893903          	ld	s2,8(s2)
    800038c0:	01000513          	li	a0,16
    800038c4:	ffffe097          	auipc	ra,0xffffe
    800038c8:	ab4080e7          	jalr	-1356(ra) # 80001378 <_Z9mem_allocm>
    800038cc:	00a90423          	sb	a0,8(s2)
    800038d0:	00855793          	srli	a5,a0,0x8
    800038d4:	00f904a3          	sb	a5,9(s2)
    800038d8:	01055793          	srli	a5,a0,0x10
    800038dc:	00f90523          	sb	a5,10(s2)
    800038e0:	0185579b          	srliw	a5,a0,0x18
    800038e4:	00f905a3          	sb	a5,11(s2)
    800038e8:	02055793          	srli	a5,a0,0x20
    800038ec:	00f90623          	sb	a5,12(s2)
    800038f0:	02855793          	srli	a5,a0,0x28
    800038f4:	00f906a3          	sb	a5,13(s2)
    800038f8:	03055793          	srli	a5,a0,0x30
    800038fc:	00f90723          	sb	a5,14(s2)
    80003900:	03855513          	srli	a0,a0,0x38
    80003904:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80003908:	00003617          	auipc	a2,0x3
    8000390c:	40060613          	addi	a2,a2,1024 # 80006d08 <_ZN9Scheduler9singletonE>
    80003910:	00063583          	ld	a1,0(a2)
    80003914:	0085b703          	ld	a4,8(a1)
    80003918:	00874783          	lbu	a5,8(a4)
    8000391c:	00974683          	lbu	a3,9(a4)
    80003920:	00869693          	slli	a3,a3,0x8
    80003924:	00f6e6b3          	or	a3,a3,a5
    80003928:	00a74783          	lbu	a5,10(a4)
    8000392c:	01079793          	slli	a5,a5,0x10
    80003930:	00d7e6b3          	or	a3,a5,a3
    80003934:	00b74783          	lbu	a5,11(a4)
    80003938:	01879793          	slli	a5,a5,0x18
    8000393c:	00d7e7b3          	or	a5,a5,a3
    80003940:	00c74683          	lbu	a3,12(a4)
    80003944:	02069693          	slli	a3,a3,0x20
    80003948:	00f6e7b3          	or	a5,a3,a5
    8000394c:	00d74683          	lbu	a3,13(a4)
    80003950:	02869693          	slli	a3,a3,0x28
    80003954:	00f6e6b3          	or	a3,a3,a5
    80003958:	00e74783          	lbu	a5,14(a4)
    8000395c:	03079793          	slli	a5,a5,0x30
    80003960:	00d7e6b3          	or	a3,a5,a3
    80003964:	00f74783          	lbu	a5,15(a4)
    80003968:	03879793          	slli	a5,a5,0x38
    8000396c:	00d7e7b3          	or	a5,a5,a3
    80003970:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80003974:	00978023          	sb	s1,0(a5)
    80003978:	0084d713          	srli	a4,s1,0x8
    8000397c:	00e780a3          	sb	a4,1(a5)
    80003980:	0104d713          	srli	a4,s1,0x10
    80003984:	00e78123          	sb	a4,2(a5)
    80003988:	0184d71b          	srliw	a4,s1,0x18
    8000398c:	00e781a3          	sb	a4,3(a5)
    80003990:	0204d713          	srli	a4,s1,0x20
    80003994:	00e78223          	sb	a4,4(a5)
    80003998:	0284d713          	srli	a4,s1,0x28
    8000399c:	00e782a3          	sb	a4,5(a5)
    800039a0:	0304d713          	srli	a4,s1,0x30
    800039a4:	00e78323          	sb	a4,6(a5)
    800039a8:	0384d493          	srli	s1,s1,0x38
    800039ac:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = nullptr;
    800039b0:	00063783          	ld	a5,0(a2)
    800039b4:	0087b783          	ld	a5,8(a5)
    800039b8:	00078423          	sb	zero,8(a5)
    800039bc:	000784a3          	sb	zero,9(a5)
    800039c0:	00078523          	sb	zero,10(a5)
    800039c4:	000785a3          	sb	zero,11(a5)
    800039c8:	00078623          	sb	zero,12(a5)
    800039cc:	000786a3          	sb	zero,13(a5)
    800039d0:	00078723          	sb	zero,14(a5)
    800039d4:	000787a3          	sb	zero,15(a5)
    }
}
    800039d8:	01813083          	ld	ra,24(sp)
    800039dc:	01013403          	ld	s0,16(sp)
    800039e0:	00813483          	ld	s1,8(sp)
    800039e4:	00013903          	ld	s2,0(sp)
    800039e8:	02010113          	addi	sp,sp,32
    800039ec:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    800039f0:	01000513          	li	a0,16
    800039f4:	ffffe097          	auipc	ra,0xffffe
    800039f8:	984080e7          	jalr	-1660(ra) # 80001378 <_Z9mem_allocm>
    800039fc:	00a93423          	sd	a0,8(s2)
    80003a00:	00003717          	auipc	a4,0x3
    80003a04:	30870713          	addi	a4,a4,776 # 80006d08 <_ZN9Scheduler9singletonE>
    80003a08:	00073783          	ld	a5,0(a4)
    80003a0c:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80003a10:	00073783          	ld	a5,0(a4)
    80003a14:	0007b783          	ld	a5,0(a5)
    80003a18:	00978023          	sb	s1,0(a5)
    80003a1c:	0084d693          	srli	a3,s1,0x8
    80003a20:	00d780a3          	sb	a3,1(a5)
    80003a24:	0104d693          	srli	a3,s1,0x10
    80003a28:	00d78123          	sb	a3,2(a5)
    80003a2c:	0184d69b          	srliw	a3,s1,0x18
    80003a30:	00d781a3          	sb	a3,3(a5)
    80003a34:	0204d693          	srli	a3,s1,0x20
    80003a38:	00d78223          	sb	a3,4(a5)
    80003a3c:	0284d693          	srli	a3,s1,0x28
    80003a40:	00d782a3          	sb	a3,5(a5)
    80003a44:	0304d693          	srli	a3,s1,0x30
    80003a48:	00d78323          	sb	a3,6(a5)
    80003a4c:	0384d493          	srli	s1,s1,0x38
    80003a50:	009783a3          	sb	s1,7(a5)
        singleton->head->next = nullptr;
    80003a54:	00073783          	ld	a5,0(a4)
    80003a58:	0007b783          	ld	a5,0(a5)
    80003a5c:	00078423          	sb	zero,8(a5)
    80003a60:	000784a3          	sb	zero,9(a5)
    80003a64:	00078523          	sb	zero,10(a5)
    80003a68:	000785a3          	sb	zero,11(a5)
    80003a6c:	00078623          	sb	zero,12(a5)
    80003a70:	000786a3          	sb	zero,13(a5)
    80003a74:	00078723          	sb	zero,14(a5)
    80003a78:	000787a3          	sb	zero,15(a5)
    80003a7c:	f5dff06f          	j	800039d8 <_ZN9Scheduler3putEP7_thread+0x148>

0000000080003a80 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80003a80:	fe010113          	addi	sp,sp,-32
    80003a84:	00113c23          	sd	ra,24(sp)
    80003a88:	00813823          	sd	s0,16(sp)
    80003a8c:	00913423          	sd	s1,8(sp)
    80003a90:	02010413          	addi	s0,sp,32
    ThreadList* tmp = singleton->head;
    80003a94:	00003697          	auipc	a3,0x3
    80003a98:	2746b683          	ld	a3,628(a3) # 80006d08 <_ZN9Scheduler9singletonE>
    80003a9c:	0006b503          	ld	a0,0(a3)
    if(tmp == nullptr){
    80003aa0:	0c050c63          	beqz	a0,80003b78 <_ZN9Scheduler3getEv+0xf8>
        return nullptr;
    }
    thread_t thread = tmp->thread;
    80003aa4:	00054483          	lbu	s1,0(a0)
    80003aa8:	00154783          	lbu	a5,1(a0)
    80003aac:	00879793          	slli	a5,a5,0x8
    80003ab0:	0097e7b3          	or	a5,a5,s1
    80003ab4:	00254483          	lbu	s1,2(a0)
    80003ab8:	01049493          	slli	s1,s1,0x10
    80003abc:	00f4e7b3          	or	a5,s1,a5
    80003ac0:	00354483          	lbu	s1,3(a0)
    80003ac4:	01849493          	slli	s1,s1,0x18
    80003ac8:	00f4e4b3          	or	s1,s1,a5
    80003acc:	00454783          	lbu	a5,4(a0)
    80003ad0:	02079793          	slli	a5,a5,0x20
    80003ad4:	0097e4b3          	or	s1,a5,s1
    80003ad8:	00554783          	lbu	a5,5(a0)
    80003adc:	02879793          	slli	a5,a5,0x28
    80003ae0:	0097e7b3          	or	a5,a5,s1
    80003ae4:	00654483          	lbu	s1,6(a0)
    80003ae8:	03049493          	slli	s1,s1,0x30
    80003aec:	00f4e7b3          	or	a5,s1,a5
    80003af0:	00754483          	lbu	s1,7(a0)
    80003af4:	03849493          	slli	s1,s1,0x38
    80003af8:	00f4e4b3          	or	s1,s1,a5
    singleton->head = tmp->next;
    80003afc:	00854783          	lbu	a5,8(a0)
    80003b00:	00954703          	lbu	a4,9(a0)
    80003b04:	00871713          	slli	a4,a4,0x8
    80003b08:	00f76733          	or	a4,a4,a5
    80003b0c:	00a54783          	lbu	a5,10(a0)
    80003b10:	01079793          	slli	a5,a5,0x10
    80003b14:	00e7e733          	or	a4,a5,a4
    80003b18:	00b54783          	lbu	a5,11(a0)
    80003b1c:	01879793          	slli	a5,a5,0x18
    80003b20:	00e7e7b3          	or	a5,a5,a4
    80003b24:	00c54703          	lbu	a4,12(a0)
    80003b28:	02071713          	slli	a4,a4,0x20
    80003b2c:	00f767b3          	or	a5,a4,a5
    80003b30:	00d54703          	lbu	a4,13(a0)
    80003b34:	02871713          	slli	a4,a4,0x28
    80003b38:	00f76733          	or	a4,a4,a5
    80003b3c:	00e54783          	lbu	a5,14(a0)
    80003b40:	03079793          	slli	a5,a5,0x30
    80003b44:	00e7e733          	or	a4,a5,a4
    80003b48:	00f54783          	lbu	a5,15(a0)
    80003b4c:	03879793          	slli	a5,a5,0x38
    80003b50:	00e7e7b3          	or	a5,a5,a4
    80003b54:	00f6b023          	sd	a5,0(a3)
    mem_free(tmp);
    80003b58:	ffffe097          	auipc	ra,0xffffe
    80003b5c:	850080e7          	jalr	-1968(ra) # 800013a8 <_Z8mem_freePv>
    return thread;
    80003b60:	00048513          	mv	a0,s1
    80003b64:	01813083          	ld	ra,24(sp)
    80003b68:	01013403          	ld	s0,16(sp)
    80003b6c:	00813483          	ld	s1,8(sp)
    80003b70:	02010113          	addi	sp,sp,32
    80003b74:	00008067          	ret
        return nullptr;
    80003b78:	00050493          	mv	s1,a0
    80003b7c:	fe5ff06f          	j	80003b60 <_ZN9Scheduler3getEv+0xe0>

0000000080003b80 <start>:
    80003b80:	ff010113          	addi	sp,sp,-16
    80003b84:	00813423          	sd	s0,8(sp)
    80003b88:	01010413          	addi	s0,sp,16
    80003b8c:	300027f3          	csrr	a5,mstatus
    80003b90:	ffffe737          	lui	a4,0xffffe
    80003b94:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff688f>
    80003b98:	00e7f7b3          	and	a5,a5,a4
    80003b9c:	00001737          	lui	a4,0x1
    80003ba0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003ba4:	00e7e7b3          	or	a5,a5,a4
    80003ba8:	30079073          	csrw	mstatus,a5
    80003bac:	00000797          	auipc	a5,0x0
    80003bb0:	16078793          	addi	a5,a5,352 # 80003d0c <system_main>
    80003bb4:	34179073          	csrw	mepc,a5
    80003bb8:	00000793          	li	a5,0
    80003bbc:	18079073          	csrw	satp,a5
    80003bc0:	000107b7          	lui	a5,0x10
    80003bc4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003bc8:	30279073          	csrw	medeleg,a5
    80003bcc:	30379073          	csrw	mideleg,a5
    80003bd0:	104027f3          	csrr	a5,sie
    80003bd4:	2227e793          	ori	a5,a5,546
    80003bd8:	10479073          	csrw	sie,a5
    80003bdc:	fff00793          	li	a5,-1
    80003be0:	00a7d793          	srli	a5,a5,0xa
    80003be4:	3b079073          	csrw	pmpaddr0,a5
    80003be8:	00f00793          	li	a5,15
    80003bec:	3a079073          	csrw	pmpcfg0,a5
    80003bf0:	f14027f3          	csrr	a5,mhartid
    80003bf4:	0200c737          	lui	a4,0x200c
    80003bf8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003bfc:	0007869b          	sext.w	a3,a5
    80003c00:	00269713          	slli	a4,a3,0x2
    80003c04:	000f4637          	lui	a2,0xf4
    80003c08:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003c0c:	00d70733          	add	a4,a4,a3
    80003c10:	0037979b          	slliw	a5,a5,0x3
    80003c14:	020046b7          	lui	a3,0x2004
    80003c18:	00d787b3          	add	a5,a5,a3
    80003c1c:	00c585b3          	add	a1,a1,a2
    80003c20:	00371693          	slli	a3,a4,0x3
    80003c24:	00003717          	auipc	a4,0x3
    80003c28:	0ec70713          	addi	a4,a4,236 # 80006d10 <timer_scratch>
    80003c2c:	00b7b023          	sd	a1,0(a5)
    80003c30:	00d70733          	add	a4,a4,a3
    80003c34:	00f73c23          	sd	a5,24(a4)
    80003c38:	02c73023          	sd	a2,32(a4)
    80003c3c:	34071073          	csrw	mscratch,a4
    80003c40:	00000797          	auipc	a5,0x0
    80003c44:	6e078793          	addi	a5,a5,1760 # 80004320 <timervec>
    80003c48:	30579073          	csrw	mtvec,a5
    80003c4c:	300027f3          	csrr	a5,mstatus
    80003c50:	0087e793          	ori	a5,a5,8
    80003c54:	30079073          	csrw	mstatus,a5
    80003c58:	304027f3          	csrr	a5,mie
    80003c5c:	0807e793          	ori	a5,a5,128
    80003c60:	30479073          	csrw	mie,a5
    80003c64:	f14027f3          	csrr	a5,mhartid
    80003c68:	0007879b          	sext.w	a5,a5
    80003c6c:	00078213          	mv	tp,a5
    80003c70:	30200073          	mret
    80003c74:	00813403          	ld	s0,8(sp)
    80003c78:	01010113          	addi	sp,sp,16
    80003c7c:	00008067          	ret

0000000080003c80 <timerinit>:
    80003c80:	ff010113          	addi	sp,sp,-16
    80003c84:	00813423          	sd	s0,8(sp)
    80003c88:	01010413          	addi	s0,sp,16
    80003c8c:	f14027f3          	csrr	a5,mhartid
    80003c90:	0200c737          	lui	a4,0x200c
    80003c94:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003c98:	0007869b          	sext.w	a3,a5
    80003c9c:	00269713          	slli	a4,a3,0x2
    80003ca0:	000f4637          	lui	a2,0xf4
    80003ca4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003ca8:	00d70733          	add	a4,a4,a3
    80003cac:	0037979b          	slliw	a5,a5,0x3
    80003cb0:	020046b7          	lui	a3,0x2004
    80003cb4:	00d787b3          	add	a5,a5,a3
    80003cb8:	00c585b3          	add	a1,a1,a2
    80003cbc:	00371693          	slli	a3,a4,0x3
    80003cc0:	00003717          	auipc	a4,0x3
    80003cc4:	05070713          	addi	a4,a4,80 # 80006d10 <timer_scratch>
    80003cc8:	00b7b023          	sd	a1,0(a5)
    80003ccc:	00d70733          	add	a4,a4,a3
    80003cd0:	00f73c23          	sd	a5,24(a4)
    80003cd4:	02c73023          	sd	a2,32(a4)
    80003cd8:	34071073          	csrw	mscratch,a4
    80003cdc:	00000797          	auipc	a5,0x0
    80003ce0:	64478793          	addi	a5,a5,1604 # 80004320 <timervec>
    80003ce4:	30579073          	csrw	mtvec,a5
    80003ce8:	300027f3          	csrr	a5,mstatus
    80003cec:	0087e793          	ori	a5,a5,8
    80003cf0:	30079073          	csrw	mstatus,a5
    80003cf4:	304027f3          	csrr	a5,mie
    80003cf8:	0807e793          	ori	a5,a5,128
    80003cfc:	30479073          	csrw	mie,a5
    80003d00:	00813403          	ld	s0,8(sp)
    80003d04:	01010113          	addi	sp,sp,16
    80003d08:	00008067          	ret

0000000080003d0c <system_main>:
    80003d0c:	fe010113          	addi	sp,sp,-32
    80003d10:	00813823          	sd	s0,16(sp)
    80003d14:	00913423          	sd	s1,8(sp)
    80003d18:	00113c23          	sd	ra,24(sp)
    80003d1c:	02010413          	addi	s0,sp,32
    80003d20:	00000097          	auipc	ra,0x0
    80003d24:	0c4080e7          	jalr	196(ra) # 80003de4 <cpuid>
    80003d28:	00003497          	auipc	s1,0x3
    80003d2c:	f8848493          	addi	s1,s1,-120 # 80006cb0 <started>
    80003d30:	02050263          	beqz	a0,80003d54 <system_main+0x48>
    80003d34:	0004a783          	lw	a5,0(s1)
    80003d38:	0007879b          	sext.w	a5,a5
    80003d3c:	fe078ce3          	beqz	a5,80003d34 <system_main+0x28>
    80003d40:	0ff0000f          	fence
    80003d44:	00002517          	auipc	a0,0x2
    80003d48:	45c50513          	addi	a0,a0,1116 # 800061a0 <CONSOLE_STATUS+0x190>
    80003d4c:	00001097          	auipc	ra,0x1
    80003d50:	a70080e7          	jalr	-1424(ra) # 800047bc <panic>
    80003d54:	00001097          	auipc	ra,0x1
    80003d58:	9c4080e7          	jalr	-1596(ra) # 80004718 <consoleinit>
    80003d5c:	00001097          	auipc	ra,0x1
    80003d60:	150080e7          	jalr	336(ra) # 80004eac <printfinit>
    80003d64:	00002517          	auipc	a0,0x2
    80003d68:	51c50513          	addi	a0,a0,1308 # 80006280 <CONSOLE_STATUS+0x270>
    80003d6c:	00001097          	auipc	ra,0x1
    80003d70:	aac080e7          	jalr	-1364(ra) # 80004818 <__printf>
    80003d74:	00002517          	auipc	a0,0x2
    80003d78:	3fc50513          	addi	a0,a0,1020 # 80006170 <CONSOLE_STATUS+0x160>
    80003d7c:	00001097          	auipc	ra,0x1
    80003d80:	a9c080e7          	jalr	-1380(ra) # 80004818 <__printf>
    80003d84:	00002517          	auipc	a0,0x2
    80003d88:	4fc50513          	addi	a0,a0,1276 # 80006280 <CONSOLE_STATUS+0x270>
    80003d8c:	00001097          	auipc	ra,0x1
    80003d90:	a8c080e7          	jalr	-1396(ra) # 80004818 <__printf>
    80003d94:	00001097          	auipc	ra,0x1
    80003d98:	4a4080e7          	jalr	1188(ra) # 80005238 <kinit>
    80003d9c:	00000097          	auipc	ra,0x0
    80003da0:	148080e7          	jalr	328(ra) # 80003ee4 <trapinit>
    80003da4:	00000097          	auipc	ra,0x0
    80003da8:	16c080e7          	jalr	364(ra) # 80003f10 <trapinithart>
    80003dac:	00000097          	auipc	ra,0x0
    80003db0:	5b4080e7          	jalr	1460(ra) # 80004360 <plicinit>
    80003db4:	00000097          	auipc	ra,0x0
    80003db8:	5d4080e7          	jalr	1492(ra) # 80004388 <plicinithart>
    80003dbc:	00000097          	auipc	ra,0x0
    80003dc0:	078080e7          	jalr	120(ra) # 80003e34 <userinit>
    80003dc4:	0ff0000f          	fence
    80003dc8:	00100793          	li	a5,1
    80003dcc:	00002517          	auipc	a0,0x2
    80003dd0:	3bc50513          	addi	a0,a0,956 # 80006188 <CONSOLE_STATUS+0x178>
    80003dd4:	00f4a023          	sw	a5,0(s1)
    80003dd8:	00001097          	auipc	ra,0x1
    80003ddc:	a40080e7          	jalr	-1472(ra) # 80004818 <__printf>
    80003de0:	0000006f          	j	80003de0 <system_main+0xd4>

0000000080003de4 <cpuid>:
    80003de4:	ff010113          	addi	sp,sp,-16
    80003de8:	00813423          	sd	s0,8(sp)
    80003dec:	01010413          	addi	s0,sp,16
    80003df0:	00020513          	mv	a0,tp
    80003df4:	00813403          	ld	s0,8(sp)
    80003df8:	0005051b          	sext.w	a0,a0
    80003dfc:	01010113          	addi	sp,sp,16
    80003e00:	00008067          	ret

0000000080003e04 <mycpu>:
    80003e04:	ff010113          	addi	sp,sp,-16
    80003e08:	00813423          	sd	s0,8(sp)
    80003e0c:	01010413          	addi	s0,sp,16
    80003e10:	00020793          	mv	a5,tp
    80003e14:	00813403          	ld	s0,8(sp)
    80003e18:	0007879b          	sext.w	a5,a5
    80003e1c:	00779793          	slli	a5,a5,0x7
    80003e20:	00004517          	auipc	a0,0x4
    80003e24:	f2050513          	addi	a0,a0,-224 # 80007d40 <cpus>
    80003e28:	00f50533          	add	a0,a0,a5
    80003e2c:	01010113          	addi	sp,sp,16
    80003e30:	00008067          	ret

0000000080003e34 <userinit>:
    80003e34:	ff010113          	addi	sp,sp,-16
    80003e38:	00813423          	sd	s0,8(sp)
    80003e3c:	01010413          	addi	s0,sp,16
    80003e40:	00813403          	ld	s0,8(sp)
    80003e44:	01010113          	addi	sp,sp,16
    80003e48:	ffffe317          	auipc	t1,0xffffe
    80003e4c:	8ec30067          	jr	-1812(t1) # 80001734 <main>

0000000080003e50 <either_copyout>:
    80003e50:	ff010113          	addi	sp,sp,-16
    80003e54:	00813023          	sd	s0,0(sp)
    80003e58:	00113423          	sd	ra,8(sp)
    80003e5c:	01010413          	addi	s0,sp,16
    80003e60:	02051663          	bnez	a0,80003e8c <either_copyout+0x3c>
    80003e64:	00058513          	mv	a0,a1
    80003e68:	00060593          	mv	a1,a2
    80003e6c:	0006861b          	sext.w	a2,a3
    80003e70:	00002097          	auipc	ra,0x2
    80003e74:	c54080e7          	jalr	-940(ra) # 80005ac4 <__memmove>
    80003e78:	00813083          	ld	ra,8(sp)
    80003e7c:	00013403          	ld	s0,0(sp)
    80003e80:	00000513          	li	a0,0
    80003e84:	01010113          	addi	sp,sp,16
    80003e88:	00008067          	ret
    80003e8c:	00002517          	auipc	a0,0x2
    80003e90:	33c50513          	addi	a0,a0,828 # 800061c8 <CONSOLE_STATUS+0x1b8>
    80003e94:	00001097          	auipc	ra,0x1
    80003e98:	928080e7          	jalr	-1752(ra) # 800047bc <panic>

0000000080003e9c <either_copyin>:
    80003e9c:	ff010113          	addi	sp,sp,-16
    80003ea0:	00813023          	sd	s0,0(sp)
    80003ea4:	00113423          	sd	ra,8(sp)
    80003ea8:	01010413          	addi	s0,sp,16
    80003eac:	02059463          	bnez	a1,80003ed4 <either_copyin+0x38>
    80003eb0:	00060593          	mv	a1,a2
    80003eb4:	0006861b          	sext.w	a2,a3
    80003eb8:	00002097          	auipc	ra,0x2
    80003ebc:	c0c080e7          	jalr	-1012(ra) # 80005ac4 <__memmove>
    80003ec0:	00813083          	ld	ra,8(sp)
    80003ec4:	00013403          	ld	s0,0(sp)
    80003ec8:	00000513          	li	a0,0
    80003ecc:	01010113          	addi	sp,sp,16
    80003ed0:	00008067          	ret
    80003ed4:	00002517          	auipc	a0,0x2
    80003ed8:	31c50513          	addi	a0,a0,796 # 800061f0 <CONSOLE_STATUS+0x1e0>
    80003edc:	00001097          	auipc	ra,0x1
    80003ee0:	8e0080e7          	jalr	-1824(ra) # 800047bc <panic>

0000000080003ee4 <trapinit>:
    80003ee4:	ff010113          	addi	sp,sp,-16
    80003ee8:	00813423          	sd	s0,8(sp)
    80003eec:	01010413          	addi	s0,sp,16
    80003ef0:	00813403          	ld	s0,8(sp)
    80003ef4:	00002597          	auipc	a1,0x2
    80003ef8:	32458593          	addi	a1,a1,804 # 80006218 <CONSOLE_STATUS+0x208>
    80003efc:	00004517          	auipc	a0,0x4
    80003f00:	ec450513          	addi	a0,a0,-316 # 80007dc0 <tickslock>
    80003f04:	01010113          	addi	sp,sp,16
    80003f08:	00001317          	auipc	t1,0x1
    80003f0c:	5c030067          	jr	1472(t1) # 800054c8 <initlock>

0000000080003f10 <trapinithart>:
    80003f10:	ff010113          	addi	sp,sp,-16
    80003f14:	00813423          	sd	s0,8(sp)
    80003f18:	01010413          	addi	s0,sp,16
    80003f1c:	00000797          	auipc	a5,0x0
    80003f20:	2f478793          	addi	a5,a5,756 # 80004210 <kernelvec>
    80003f24:	10579073          	csrw	stvec,a5
    80003f28:	00813403          	ld	s0,8(sp)
    80003f2c:	01010113          	addi	sp,sp,16
    80003f30:	00008067          	ret

0000000080003f34 <usertrap>:
    80003f34:	ff010113          	addi	sp,sp,-16
    80003f38:	00813423          	sd	s0,8(sp)
    80003f3c:	01010413          	addi	s0,sp,16
    80003f40:	00813403          	ld	s0,8(sp)
    80003f44:	01010113          	addi	sp,sp,16
    80003f48:	00008067          	ret

0000000080003f4c <usertrapret>:
    80003f4c:	ff010113          	addi	sp,sp,-16
    80003f50:	00813423          	sd	s0,8(sp)
    80003f54:	01010413          	addi	s0,sp,16
    80003f58:	00813403          	ld	s0,8(sp)
    80003f5c:	01010113          	addi	sp,sp,16
    80003f60:	00008067          	ret

0000000080003f64 <kerneltrap>:
    80003f64:	fe010113          	addi	sp,sp,-32
    80003f68:	00813823          	sd	s0,16(sp)
    80003f6c:	00113c23          	sd	ra,24(sp)
    80003f70:	00913423          	sd	s1,8(sp)
    80003f74:	02010413          	addi	s0,sp,32
    80003f78:	142025f3          	csrr	a1,scause
    80003f7c:	100027f3          	csrr	a5,sstatus
    80003f80:	0027f793          	andi	a5,a5,2
    80003f84:	10079c63          	bnez	a5,8000409c <kerneltrap+0x138>
    80003f88:	142027f3          	csrr	a5,scause
    80003f8c:	0207ce63          	bltz	a5,80003fc8 <kerneltrap+0x64>
    80003f90:	00002517          	auipc	a0,0x2
    80003f94:	2d050513          	addi	a0,a0,720 # 80006260 <CONSOLE_STATUS+0x250>
    80003f98:	00001097          	auipc	ra,0x1
    80003f9c:	880080e7          	jalr	-1920(ra) # 80004818 <__printf>
    80003fa0:	141025f3          	csrr	a1,sepc
    80003fa4:	14302673          	csrr	a2,stval
    80003fa8:	00002517          	auipc	a0,0x2
    80003fac:	2c850513          	addi	a0,a0,712 # 80006270 <CONSOLE_STATUS+0x260>
    80003fb0:	00001097          	auipc	ra,0x1
    80003fb4:	868080e7          	jalr	-1944(ra) # 80004818 <__printf>
    80003fb8:	00002517          	auipc	a0,0x2
    80003fbc:	2d050513          	addi	a0,a0,720 # 80006288 <CONSOLE_STATUS+0x278>
    80003fc0:	00000097          	auipc	ra,0x0
    80003fc4:	7fc080e7          	jalr	2044(ra) # 800047bc <panic>
    80003fc8:	0ff7f713          	andi	a4,a5,255
    80003fcc:	00900693          	li	a3,9
    80003fd0:	04d70063          	beq	a4,a3,80004010 <kerneltrap+0xac>
    80003fd4:	fff00713          	li	a4,-1
    80003fd8:	03f71713          	slli	a4,a4,0x3f
    80003fdc:	00170713          	addi	a4,a4,1
    80003fe0:	fae798e3          	bne	a5,a4,80003f90 <kerneltrap+0x2c>
    80003fe4:	00000097          	auipc	ra,0x0
    80003fe8:	e00080e7          	jalr	-512(ra) # 80003de4 <cpuid>
    80003fec:	06050663          	beqz	a0,80004058 <kerneltrap+0xf4>
    80003ff0:	144027f3          	csrr	a5,sip
    80003ff4:	ffd7f793          	andi	a5,a5,-3
    80003ff8:	14479073          	csrw	sip,a5
    80003ffc:	01813083          	ld	ra,24(sp)
    80004000:	01013403          	ld	s0,16(sp)
    80004004:	00813483          	ld	s1,8(sp)
    80004008:	02010113          	addi	sp,sp,32
    8000400c:	00008067          	ret
    80004010:	00000097          	auipc	ra,0x0
    80004014:	3c4080e7          	jalr	964(ra) # 800043d4 <plic_claim>
    80004018:	00a00793          	li	a5,10
    8000401c:	00050493          	mv	s1,a0
    80004020:	06f50863          	beq	a0,a5,80004090 <kerneltrap+0x12c>
    80004024:	fc050ce3          	beqz	a0,80003ffc <kerneltrap+0x98>
    80004028:	00050593          	mv	a1,a0
    8000402c:	00002517          	auipc	a0,0x2
    80004030:	21450513          	addi	a0,a0,532 # 80006240 <CONSOLE_STATUS+0x230>
    80004034:	00000097          	auipc	ra,0x0
    80004038:	7e4080e7          	jalr	2020(ra) # 80004818 <__printf>
    8000403c:	01013403          	ld	s0,16(sp)
    80004040:	01813083          	ld	ra,24(sp)
    80004044:	00048513          	mv	a0,s1
    80004048:	00813483          	ld	s1,8(sp)
    8000404c:	02010113          	addi	sp,sp,32
    80004050:	00000317          	auipc	t1,0x0
    80004054:	3bc30067          	jr	956(t1) # 8000440c <plic_complete>
    80004058:	00004517          	auipc	a0,0x4
    8000405c:	d6850513          	addi	a0,a0,-664 # 80007dc0 <tickslock>
    80004060:	00001097          	auipc	ra,0x1
    80004064:	48c080e7          	jalr	1164(ra) # 800054ec <acquire>
    80004068:	00003717          	auipc	a4,0x3
    8000406c:	c4c70713          	addi	a4,a4,-948 # 80006cb4 <ticks>
    80004070:	00072783          	lw	a5,0(a4)
    80004074:	00004517          	auipc	a0,0x4
    80004078:	d4c50513          	addi	a0,a0,-692 # 80007dc0 <tickslock>
    8000407c:	0017879b          	addiw	a5,a5,1
    80004080:	00f72023          	sw	a5,0(a4)
    80004084:	00001097          	auipc	ra,0x1
    80004088:	534080e7          	jalr	1332(ra) # 800055b8 <release>
    8000408c:	f65ff06f          	j	80003ff0 <kerneltrap+0x8c>
    80004090:	00001097          	auipc	ra,0x1
    80004094:	090080e7          	jalr	144(ra) # 80005120 <uartintr>
    80004098:	fa5ff06f          	j	8000403c <kerneltrap+0xd8>
    8000409c:	00002517          	auipc	a0,0x2
    800040a0:	18450513          	addi	a0,a0,388 # 80006220 <CONSOLE_STATUS+0x210>
    800040a4:	00000097          	auipc	ra,0x0
    800040a8:	718080e7          	jalr	1816(ra) # 800047bc <panic>

00000000800040ac <clockintr>:
    800040ac:	fe010113          	addi	sp,sp,-32
    800040b0:	00813823          	sd	s0,16(sp)
    800040b4:	00913423          	sd	s1,8(sp)
    800040b8:	00113c23          	sd	ra,24(sp)
    800040bc:	02010413          	addi	s0,sp,32
    800040c0:	00004497          	auipc	s1,0x4
    800040c4:	d0048493          	addi	s1,s1,-768 # 80007dc0 <tickslock>
    800040c8:	00048513          	mv	a0,s1
    800040cc:	00001097          	auipc	ra,0x1
    800040d0:	420080e7          	jalr	1056(ra) # 800054ec <acquire>
    800040d4:	00003717          	auipc	a4,0x3
    800040d8:	be070713          	addi	a4,a4,-1056 # 80006cb4 <ticks>
    800040dc:	00072783          	lw	a5,0(a4)
    800040e0:	01013403          	ld	s0,16(sp)
    800040e4:	01813083          	ld	ra,24(sp)
    800040e8:	00048513          	mv	a0,s1
    800040ec:	0017879b          	addiw	a5,a5,1
    800040f0:	00813483          	ld	s1,8(sp)
    800040f4:	00f72023          	sw	a5,0(a4)
    800040f8:	02010113          	addi	sp,sp,32
    800040fc:	00001317          	auipc	t1,0x1
    80004100:	4bc30067          	jr	1212(t1) # 800055b8 <release>

0000000080004104 <devintr>:
    80004104:	142027f3          	csrr	a5,scause
    80004108:	00000513          	li	a0,0
    8000410c:	0007c463          	bltz	a5,80004114 <devintr+0x10>
    80004110:	00008067          	ret
    80004114:	fe010113          	addi	sp,sp,-32
    80004118:	00813823          	sd	s0,16(sp)
    8000411c:	00113c23          	sd	ra,24(sp)
    80004120:	00913423          	sd	s1,8(sp)
    80004124:	02010413          	addi	s0,sp,32
    80004128:	0ff7f713          	andi	a4,a5,255
    8000412c:	00900693          	li	a3,9
    80004130:	04d70c63          	beq	a4,a3,80004188 <devintr+0x84>
    80004134:	fff00713          	li	a4,-1
    80004138:	03f71713          	slli	a4,a4,0x3f
    8000413c:	00170713          	addi	a4,a4,1
    80004140:	00e78c63          	beq	a5,a4,80004158 <devintr+0x54>
    80004144:	01813083          	ld	ra,24(sp)
    80004148:	01013403          	ld	s0,16(sp)
    8000414c:	00813483          	ld	s1,8(sp)
    80004150:	02010113          	addi	sp,sp,32
    80004154:	00008067          	ret
    80004158:	00000097          	auipc	ra,0x0
    8000415c:	c8c080e7          	jalr	-884(ra) # 80003de4 <cpuid>
    80004160:	06050663          	beqz	a0,800041cc <devintr+0xc8>
    80004164:	144027f3          	csrr	a5,sip
    80004168:	ffd7f793          	andi	a5,a5,-3
    8000416c:	14479073          	csrw	sip,a5
    80004170:	01813083          	ld	ra,24(sp)
    80004174:	01013403          	ld	s0,16(sp)
    80004178:	00813483          	ld	s1,8(sp)
    8000417c:	00200513          	li	a0,2
    80004180:	02010113          	addi	sp,sp,32
    80004184:	00008067          	ret
    80004188:	00000097          	auipc	ra,0x0
    8000418c:	24c080e7          	jalr	588(ra) # 800043d4 <plic_claim>
    80004190:	00a00793          	li	a5,10
    80004194:	00050493          	mv	s1,a0
    80004198:	06f50663          	beq	a0,a5,80004204 <devintr+0x100>
    8000419c:	00100513          	li	a0,1
    800041a0:	fa0482e3          	beqz	s1,80004144 <devintr+0x40>
    800041a4:	00048593          	mv	a1,s1
    800041a8:	00002517          	auipc	a0,0x2
    800041ac:	09850513          	addi	a0,a0,152 # 80006240 <CONSOLE_STATUS+0x230>
    800041b0:	00000097          	auipc	ra,0x0
    800041b4:	668080e7          	jalr	1640(ra) # 80004818 <__printf>
    800041b8:	00048513          	mv	a0,s1
    800041bc:	00000097          	auipc	ra,0x0
    800041c0:	250080e7          	jalr	592(ra) # 8000440c <plic_complete>
    800041c4:	00100513          	li	a0,1
    800041c8:	f7dff06f          	j	80004144 <devintr+0x40>
    800041cc:	00004517          	auipc	a0,0x4
    800041d0:	bf450513          	addi	a0,a0,-1036 # 80007dc0 <tickslock>
    800041d4:	00001097          	auipc	ra,0x1
    800041d8:	318080e7          	jalr	792(ra) # 800054ec <acquire>
    800041dc:	00003717          	auipc	a4,0x3
    800041e0:	ad870713          	addi	a4,a4,-1320 # 80006cb4 <ticks>
    800041e4:	00072783          	lw	a5,0(a4)
    800041e8:	00004517          	auipc	a0,0x4
    800041ec:	bd850513          	addi	a0,a0,-1064 # 80007dc0 <tickslock>
    800041f0:	0017879b          	addiw	a5,a5,1
    800041f4:	00f72023          	sw	a5,0(a4)
    800041f8:	00001097          	auipc	ra,0x1
    800041fc:	3c0080e7          	jalr	960(ra) # 800055b8 <release>
    80004200:	f65ff06f          	j	80004164 <devintr+0x60>
    80004204:	00001097          	auipc	ra,0x1
    80004208:	f1c080e7          	jalr	-228(ra) # 80005120 <uartintr>
    8000420c:	fadff06f          	j	800041b8 <devintr+0xb4>

0000000080004210 <kernelvec>:
    80004210:	f0010113          	addi	sp,sp,-256
    80004214:	00113023          	sd	ra,0(sp)
    80004218:	00213423          	sd	sp,8(sp)
    8000421c:	00313823          	sd	gp,16(sp)
    80004220:	00413c23          	sd	tp,24(sp)
    80004224:	02513023          	sd	t0,32(sp)
    80004228:	02613423          	sd	t1,40(sp)
    8000422c:	02713823          	sd	t2,48(sp)
    80004230:	02813c23          	sd	s0,56(sp)
    80004234:	04913023          	sd	s1,64(sp)
    80004238:	04a13423          	sd	a0,72(sp)
    8000423c:	04b13823          	sd	a1,80(sp)
    80004240:	04c13c23          	sd	a2,88(sp)
    80004244:	06d13023          	sd	a3,96(sp)
    80004248:	06e13423          	sd	a4,104(sp)
    8000424c:	06f13823          	sd	a5,112(sp)
    80004250:	07013c23          	sd	a6,120(sp)
    80004254:	09113023          	sd	a7,128(sp)
    80004258:	09213423          	sd	s2,136(sp)
    8000425c:	09313823          	sd	s3,144(sp)
    80004260:	09413c23          	sd	s4,152(sp)
    80004264:	0b513023          	sd	s5,160(sp)
    80004268:	0b613423          	sd	s6,168(sp)
    8000426c:	0b713823          	sd	s7,176(sp)
    80004270:	0b813c23          	sd	s8,184(sp)
    80004274:	0d913023          	sd	s9,192(sp)
    80004278:	0da13423          	sd	s10,200(sp)
    8000427c:	0db13823          	sd	s11,208(sp)
    80004280:	0dc13c23          	sd	t3,216(sp)
    80004284:	0fd13023          	sd	t4,224(sp)
    80004288:	0fe13423          	sd	t5,232(sp)
    8000428c:	0ff13823          	sd	t6,240(sp)
    80004290:	cd5ff0ef          	jal	ra,80003f64 <kerneltrap>
    80004294:	00013083          	ld	ra,0(sp)
    80004298:	00813103          	ld	sp,8(sp)
    8000429c:	01013183          	ld	gp,16(sp)
    800042a0:	02013283          	ld	t0,32(sp)
    800042a4:	02813303          	ld	t1,40(sp)
    800042a8:	03013383          	ld	t2,48(sp)
    800042ac:	03813403          	ld	s0,56(sp)
    800042b0:	04013483          	ld	s1,64(sp)
    800042b4:	04813503          	ld	a0,72(sp)
    800042b8:	05013583          	ld	a1,80(sp)
    800042bc:	05813603          	ld	a2,88(sp)
    800042c0:	06013683          	ld	a3,96(sp)
    800042c4:	06813703          	ld	a4,104(sp)
    800042c8:	07013783          	ld	a5,112(sp)
    800042cc:	07813803          	ld	a6,120(sp)
    800042d0:	08013883          	ld	a7,128(sp)
    800042d4:	08813903          	ld	s2,136(sp)
    800042d8:	09013983          	ld	s3,144(sp)
    800042dc:	09813a03          	ld	s4,152(sp)
    800042e0:	0a013a83          	ld	s5,160(sp)
    800042e4:	0a813b03          	ld	s6,168(sp)
    800042e8:	0b013b83          	ld	s7,176(sp)
    800042ec:	0b813c03          	ld	s8,184(sp)
    800042f0:	0c013c83          	ld	s9,192(sp)
    800042f4:	0c813d03          	ld	s10,200(sp)
    800042f8:	0d013d83          	ld	s11,208(sp)
    800042fc:	0d813e03          	ld	t3,216(sp)
    80004300:	0e013e83          	ld	t4,224(sp)
    80004304:	0e813f03          	ld	t5,232(sp)
    80004308:	0f013f83          	ld	t6,240(sp)
    8000430c:	10010113          	addi	sp,sp,256
    80004310:	10200073          	sret
    80004314:	00000013          	nop
    80004318:	00000013          	nop
    8000431c:	00000013          	nop

0000000080004320 <timervec>:
    80004320:	34051573          	csrrw	a0,mscratch,a0
    80004324:	00b53023          	sd	a1,0(a0)
    80004328:	00c53423          	sd	a2,8(a0)
    8000432c:	00d53823          	sd	a3,16(a0)
    80004330:	01853583          	ld	a1,24(a0)
    80004334:	02053603          	ld	a2,32(a0)
    80004338:	0005b683          	ld	a3,0(a1)
    8000433c:	00c686b3          	add	a3,a3,a2
    80004340:	00d5b023          	sd	a3,0(a1)
    80004344:	00200593          	li	a1,2
    80004348:	14459073          	csrw	sip,a1
    8000434c:	01053683          	ld	a3,16(a0)
    80004350:	00853603          	ld	a2,8(a0)
    80004354:	00053583          	ld	a1,0(a0)
    80004358:	34051573          	csrrw	a0,mscratch,a0
    8000435c:	30200073          	mret

0000000080004360 <plicinit>:
    80004360:	ff010113          	addi	sp,sp,-16
    80004364:	00813423          	sd	s0,8(sp)
    80004368:	01010413          	addi	s0,sp,16
    8000436c:	00813403          	ld	s0,8(sp)
    80004370:	0c0007b7          	lui	a5,0xc000
    80004374:	00100713          	li	a4,1
    80004378:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000437c:	00e7a223          	sw	a4,4(a5)
    80004380:	01010113          	addi	sp,sp,16
    80004384:	00008067          	ret

0000000080004388 <plicinithart>:
    80004388:	ff010113          	addi	sp,sp,-16
    8000438c:	00813023          	sd	s0,0(sp)
    80004390:	00113423          	sd	ra,8(sp)
    80004394:	01010413          	addi	s0,sp,16
    80004398:	00000097          	auipc	ra,0x0
    8000439c:	a4c080e7          	jalr	-1460(ra) # 80003de4 <cpuid>
    800043a0:	0085171b          	slliw	a4,a0,0x8
    800043a4:	0c0027b7          	lui	a5,0xc002
    800043a8:	00e787b3          	add	a5,a5,a4
    800043ac:	40200713          	li	a4,1026
    800043b0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800043b4:	00813083          	ld	ra,8(sp)
    800043b8:	00013403          	ld	s0,0(sp)
    800043bc:	00d5151b          	slliw	a0,a0,0xd
    800043c0:	0c2017b7          	lui	a5,0xc201
    800043c4:	00a78533          	add	a0,a5,a0
    800043c8:	00052023          	sw	zero,0(a0)
    800043cc:	01010113          	addi	sp,sp,16
    800043d0:	00008067          	ret

00000000800043d4 <plic_claim>:
    800043d4:	ff010113          	addi	sp,sp,-16
    800043d8:	00813023          	sd	s0,0(sp)
    800043dc:	00113423          	sd	ra,8(sp)
    800043e0:	01010413          	addi	s0,sp,16
    800043e4:	00000097          	auipc	ra,0x0
    800043e8:	a00080e7          	jalr	-1536(ra) # 80003de4 <cpuid>
    800043ec:	00813083          	ld	ra,8(sp)
    800043f0:	00013403          	ld	s0,0(sp)
    800043f4:	00d5151b          	slliw	a0,a0,0xd
    800043f8:	0c2017b7          	lui	a5,0xc201
    800043fc:	00a78533          	add	a0,a5,a0
    80004400:	00452503          	lw	a0,4(a0)
    80004404:	01010113          	addi	sp,sp,16
    80004408:	00008067          	ret

000000008000440c <plic_complete>:
    8000440c:	fe010113          	addi	sp,sp,-32
    80004410:	00813823          	sd	s0,16(sp)
    80004414:	00913423          	sd	s1,8(sp)
    80004418:	00113c23          	sd	ra,24(sp)
    8000441c:	02010413          	addi	s0,sp,32
    80004420:	00050493          	mv	s1,a0
    80004424:	00000097          	auipc	ra,0x0
    80004428:	9c0080e7          	jalr	-1600(ra) # 80003de4 <cpuid>
    8000442c:	01813083          	ld	ra,24(sp)
    80004430:	01013403          	ld	s0,16(sp)
    80004434:	00d5179b          	slliw	a5,a0,0xd
    80004438:	0c201737          	lui	a4,0xc201
    8000443c:	00f707b3          	add	a5,a4,a5
    80004440:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004444:	00813483          	ld	s1,8(sp)
    80004448:	02010113          	addi	sp,sp,32
    8000444c:	00008067          	ret

0000000080004450 <consolewrite>:
    80004450:	fb010113          	addi	sp,sp,-80
    80004454:	04813023          	sd	s0,64(sp)
    80004458:	04113423          	sd	ra,72(sp)
    8000445c:	02913c23          	sd	s1,56(sp)
    80004460:	03213823          	sd	s2,48(sp)
    80004464:	03313423          	sd	s3,40(sp)
    80004468:	03413023          	sd	s4,32(sp)
    8000446c:	01513c23          	sd	s5,24(sp)
    80004470:	05010413          	addi	s0,sp,80
    80004474:	06c05c63          	blez	a2,800044ec <consolewrite+0x9c>
    80004478:	00060993          	mv	s3,a2
    8000447c:	00050a13          	mv	s4,a0
    80004480:	00058493          	mv	s1,a1
    80004484:	00000913          	li	s2,0
    80004488:	fff00a93          	li	s5,-1
    8000448c:	01c0006f          	j	800044a8 <consolewrite+0x58>
    80004490:	fbf44503          	lbu	a0,-65(s0)
    80004494:	0019091b          	addiw	s2,s2,1
    80004498:	00148493          	addi	s1,s1,1
    8000449c:	00001097          	auipc	ra,0x1
    800044a0:	a9c080e7          	jalr	-1380(ra) # 80004f38 <uartputc>
    800044a4:	03298063          	beq	s3,s2,800044c4 <consolewrite+0x74>
    800044a8:	00048613          	mv	a2,s1
    800044ac:	00100693          	li	a3,1
    800044b0:	000a0593          	mv	a1,s4
    800044b4:	fbf40513          	addi	a0,s0,-65
    800044b8:	00000097          	auipc	ra,0x0
    800044bc:	9e4080e7          	jalr	-1564(ra) # 80003e9c <either_copyin>
    800044c0:	fd5518e3          	bne	a0,s5,80004490 <consolewrite+0x40>
    800044c4:	04813083          	ld	ra,72(sp)
    800044c8:	04013403          	ld	s0,64(sp)
    800044cc:	03813483          	ld	s1,56(sp)
    800044d0:	02813983          	ld	s3,40(sp)
    800044d4:	02013a03          	ld	s4,32(sp)
    800044d8:	01813a83          	ld	s5,24(sp)
    800044dc:	00090513          	mv	a0,s2
    800044e0:	03013903          	ld	s2,48(sp)
    800044e4:	05010113          	addi	sp,sp,80
    800044e8:	00008067          	ret
    800044ec:	00000913          	li	s2,0
    800044f0:	fd5ff06f          	j	800044c4 <consolewrite+0x74>

00000000800044f4 <consoleread>:
    800044f4:	f9010113          	addi	sp,sp,-112
    800044f8:	06813023          	sd	s0,96(sp)
    800044fc:	04913c23          	sd	s1,88(sp)
    80004500:	05213823          	sd	s2,80(sp)
    80004504:	05313423          	sd	s3,72(sp)
    80004508:	05413023          	sd	s4,64(sp)
    8000450c:	03513c23          	sd	s5,56(sp)
    80004510:	03613823          	sd	s6,48(sp)
    80004514:	03713423          	sd	s7,40(sp)
    80004518:	03813023          	sd	s8,32(sp)
    8000451c:	06113423          	sd	ra,104(sp)
    80004520:	01913c23          	sd	s9,24(sp)
    80004524:	07010413          	addi	s0,sp,112
    80004528:	00060b93          	mv	s7,a2
    8000452c:	00050913          	mv	s2,a0
    80004530:	00058c13          	mv	s8,a1
    80004534:	00060b1b          	sext.w	s6,a2
    80004538:	00004497          	auipc	s1,0x4
    8000453c:	8b048493          	addi	s1,s1,-1872 # 80007de8 <cons>
    80004540:	00400993          	li	s3,4
    80004544:	fff00a13          	li	s4,-1
    80004548:	00a00a93          	li	s5,10
    8000454c:	05705e63          	blez	s7,800045a8 <consoleread+0xb4>
    80004550:	09c4a703          	lw	a4,156(s1)
    80004554:	0984a783          	lw	a5,152(s1)
    80004558:	0007071b          	sext.w	a4,a4
    8000455c:	08e78463          	beq	a5,a4,800045e4 <consoleread+0xf0>
    80004560:	07f7f713          	andi	a4,a5,127
    80004564:	00e48733          	add	a4,s1,a4
    80004568:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000456c:	0017869b          	addiw	a3,a5,1
    80004570:	08d4ac23          	sw	a3,152(s1)
    80004574:	00070c9b          	sext.w	s9,a4
    80004578:	0b370663          	beq	a4,s3,80004624 <consoleread+0x130>
    8000457c:	00100693          	li	a3,1
    80004580:	f9f40613          	addi	a2,s0,-97
    80004584:	000c0593          	mv	a1,s8
    80004588:	00090513          	mv	a0,s2
    8000458c:	f8e40fa3          	sb	a4,-97(s0)
    80004590:	00000097          	auipc	ra,0x0
    80004594:	8c0080e7          	jalr	-1856(ra) # 80003e50 <either_copyout>
    80004598:	01450863          	beq	a0,s4,800045a8 <consoleread+0xb4>
    8000459c:	001c0c13          	addi	s8,s8,1
    800045a0:	fffb8b9b          	addiw	s7,s7,-1
    800045a4:	fb5c94e3          	bne	s9,s5,8000454c <consoleread+0x58>
    800045a8:	000b851b          	sext.w	a0,s7
    800045ac:	06813083          	ld	ra,104(sp)
    800045b0:	06013403          	ld	s0,96(sp)
    800045b4:	05813483          	ld	s1,88(sp)
    800045b8:	05013903          	ld	s2,80(sp)
    800045bc:	04813983          	ld	s3,72(sp)
    800045c0:	04013a03          	ld	s4,64(sp)
    800045c4:	03813a83          	ld	s5,56(sp)
    800045c8:	02813b83          	ld	s7,40(sp)
    800045cc:	02013c03          	ld	s8,32(sp)
    800045d0:	01813c83          	ld	s9,24(sp)
    800045d4:	40ab053b          	subw	a0,s6,a0
    800045d8:	03013b03          	ld	s6,48(sp)
    800045dc:	07010113          	addi	sp,sp,112
    800045e0:	00008067          	ret
    800045e4:	00001097          	auipc	ra,0x1
    800045e8:	1d8080e7          	jalr	472(ra) # 800057bc <push_on>
    800045ec:	0984a703          	lw	a4,152(s1)
    800045f0:	09c4a783          	lw	a5,156(s1)
    800045f4:	0007879b          	sext.w	a5,a5
    800045f8:	fef70ce3          	beq	a4,a5,800045f0 <consoleread+0xfc>
    800045fc:	00001097          	auipc	ra,0x1
    80004600:	234080e7          	jalr	564(ra) # 80005830 <pop_on>
    80004604:	0984a783          	lw	a5,152(s1)
    80004608:	07f7f713          	andi	a4,a5,127
    8000460c:	00e48733          	add	a4,s1,a4
    80004610:	01874703          	lbu	a4,24(a4)
    80004614:	0017869b          	addiw	a3,a5,1
    80004618:	08d4ac23          	sw	a3,152(s1)
    8000461c:	00070c9b          	sext.w	s9,a4
    80004620:	f5371ee3          	bne	a4,s3,8000457c <consoleread+0x88>
    80004624:	000b851b          	sext.w	a0,s7
    80004628:	f96bf2e3          	bgeu	s7,s6,800045ac <consoleread+0xb8>
    8000462c:	08f4ac23          	sw	a5,152(s1)
    80004630:	f7dff06f          	j	800045ac <consoleread+0xb8>

0000000080004634 <consputc>:
    80004634:	10000793          	li	a5,256
    80004638:	00f50663          	beq	a0,a5,80004644 <consputc+0x10>
    8000463c:	00001317          	auipc	t1,0x1
    80004640:	9f430067          	jr	-1548(t1) # 80005030 <uartputc_sync>
    80004644:	ff010113          	addi	sp,sp,-16
    80004648:	00113423          	sd	ra,8(sp)
    8000464c:	00813023          	sd	s0,0(sp)
    80004650:	01010413          	addi	s0,sp,16
    80004654:	00800513          	li	a0,8
    80004658:	00001097          	auipc	ra,0x1
    8000465c:	9d8080e7          	jalr	-1576(ra) # 80005030 <uartputc_sync>
    80004660:	02000513          	li	a0,32
    80004664:	00001097          	auipc	ra,0x1
    80004668:	9cc080e7          	jalr	-1588(ra) # 80005030 <uartputc_sync>
    8000466c:	00013403          	ld	s0,0(sp)
    80004670:	00813083          	ld	ra,8(sp)
    80004674:	00800513          	li	a0,8
    80004678:	01010113          	addi	sp,sp,16
    8000467c:	00001317          	auipc	t1,0x1
    80004680:	9b430067          	jr	-1612(t1) # 80005030 <uartputc_sync>

0000000080004684 <consoleintr>:
    80004684:	fe010113          	addi	sp,sp,-32
    80004688:	00813823          	sd	s0,16(sp)
    8000468c:	00913423          	sd	s1,8(sp)
    80004690:	01213023          	sd	s2,0(sp)
    80004694:	00113c23          	sd	ra,24(sp)
    80004698:	02010413          	addi	s0,sp,32
    8000469c:	00003917          	auipc	s2,0x3
    800046a0:	74c90913          	addi	s2,s2,1868 # 80007de8 <cons>
    800046a4:	00050493          	mv	s1,a0
    800046a8:	00090513          	mv	a0,s2
    800046ac:	00001097          	auipc	ra,0x1
    800046b0:	e40080e7          	jalr	-448(ra) # 800054ec <acquire>
    800046b4:	02048c63          	beqz	s1,800046ec <consoleintr+0x68>
    800046b8:	0a092783          	lw	a5,160(s2)
    800046bc:	09892703          	lw	a4,152(s2)
    800046c0:	07f00693          	li	a3,127
    800046c4:	40e7873b          	subw	a4,a5,a4
    800046c8:	02e6e263          	bltu	a3,a4,800046ec <consoleintr+0x68>
    800046cc:	00d00713          	li	a4,13
    800046d0:	04e48063          	beq	s1,a4,80004710 <consoleintr+0x8c>
    800046d4:	07f7f713          	andi	a4,a5,127
    800046d8:	00e90733          	add	a4,s2,a4
    800046dc:	0017879b          	addiw	a5,a5,1
    800046e0:	0af92023          	sw	a5,160(s2)
    800046e4:	00970c23          	sb	s1,24(a4)
    800046e8:	08f92e23          	sw	a5,156(s2)
    800046ec:	01013403          	ld	s0,16(sp)
    800046f0:	01813083          	ld	ra,24(sp)
    800046f4:	00813483          	ld	s1,8(sp)
    800046f8:	00013903          	ld	s2,0(sp)
    800046fc:	00003517          	auipc	a0,0x3
    80004700:	6ec50513          	addi	a0,a0,1772 # 80007de8 <cons>
    80004704:	02010113          	addi	sp,sp,32
    80004708:	00001317          	auipc	t1,0x1
    8000470c:	eb030067          	jr	-336(t1) # 800055b8 <release>
    80004710:	00a00493          	li	s1,10
    80004714:	fc1ff06f          	j	800046d4 <consoleintr+0x50>

0000000080004718 <consoleinit>:
    80004718:	fe010113          	addi	sp,sp,-32
    8000471c:	00113c23          	sd	ra,24(sp)
    80004720:	00813823          	sd	s0,16(sp)
    80004724:	00913423          	sd	s1,8(sp)
    80004728:	02010413          	addi	s0,sp,32
    8000472c:	00003497          	auipc	s1,0x3
    80004730:	6bc48493          	addi	s1,s1,1724 # 80007de8 <cons>
    80004734:	00048513          	mv	a0,s1
    80004738:	00002597          	auipc	a1,0x2
    8000473c:	b6058593          	addi	a1,a1,-1184 # 80006298 <CONSOLE_STATUS+0x288>
    80004740:	00001097          	auipc	ra,0x1
    80004744:	d88080e7          	jalr	-632(ra) # 800054c8 <initlock>
    80004748:	00000097          	auipc	ra,0x0
    8000474c:	7ac080e7          	jalr	1964(ra) # 80004ef4 <uartinit>
    80004750:	01813083          	ld	ra,24(sp)
    80004754:	01013403          	ld	s0,16(sp)
    80004758:	00000797          	auipc	a5,0x0
    8000475c:	d9c78793          	addi	a5,a5,-612 # 800044f4 <consoleread>
    80004760:	0af4bc23          	sd	a5,184(s1)
    80004764:	00000797          	auipc	a5,0x0
    80004768:	cec78793          	addi	a5,a5,-788 # 80004450 <consolewrite>
    8000476c:	0cf4b023          	sd	a5,192(s1)
    80004770:	00813483          	ld	s1,8(sp)
    80004774:	02010113          	addi	sp,sp,32
    80004778:	00008067          	ret

000000008000477c <console_read>:
    8000477c:	ff010113          	addi	sp,sp,-16
    80004780:	00813423          	sd	s0,8(sp)
    80004784:	01010413          	addi	s0,sp,16
    80004788:	00813403          	ld	s0,8(sp)
    8000478c:	00003317          	auipc	t1,0x3
    80004790:	71433303          	ld	t1,1812(t1) # 80007ea0 <devsw+0x10>
    80004794:	01010113          	addi	sp,sp,16
    80004798:	00030067          	jr	t1

000000008000479c <console_write>:
    8000479c:	ff010113          	addi	sp,sp,-16
    800047a0:	00813423          	sd	s0,8(sp)
    800047a4:	01010413          	addi	s0,sp,16
    800047a8:	00813403          	ld	s0,8(sp)
    800047ac:	00003317          	auipc	t1,0x3
    800047b0:	6fc33303          	ld	t1,1788(t1) # 80007ea8 <devsw+0x18>
    800047b4:	01010113          	addi	sp,sp,16
    800047b8:	00030067          	jr	t1

00000000800047bc <panic>:
    800047bc:	fe010113          	addi	sp,sp,-32
    800047c0:	00113c23          	sd	ra,24(sp)
    800047c4:	00813823          	sd	s0,16(sp)
    800047c8:	00913423          	sd	s1,8(sp)
    800047cc:	02010413          	addi	s0,sp,32
    800047d0:	00050493          	mv	s1,a0
    800047d4:	00002517          	auipc	a0,0x2
    800047d8:	acc50513          	addi	a0,a0,-1332 # 800062a0 <CONSOLE_STATUS+0x290>
    800047dc:	00003797          	auipc	a5,0x3
    800047e0:	7607a623          	sw	zero,1900(a5) # 80007f48 <pr+0x18>
    800047e4:	00000097          	auipc	ra,0x0
    800047e8:	034080e7          	jalr	52(ra) # 80004818 <__printf>
    800047ec:	00048513          	mv	a0,s1
    800047f0:	00000097          	auipc	ra,0x0
    800047f4:	028080e7          	jalr	40(ra) # 80004818 <__printf>
    800047f8:	00002517          	auipc	a0,0x2
    800047fc:	a8850513          	addi	a0,a0,-1400 # 80006280 <CONSOLE_STATUS+0x270>
    80004800:	00000097          	auipc	ra,0x0
    80004804:	018080e7          	jalr	24(ra) # 80004818 <__printf>
    80004808:	00100793          	li	a5,1
    8000480c:	00002717          	auipc	a4,0x2
    80004810:	4af72623          	sw	a5,1196(a4) # 80006cb8 <panicked>
    80004814:	0000006f          	j	80004814 <panic+0x58>

0000000080004818 <__printf>:
    80004818:	f3010113          	addi	sp,sp,-208
    8000481c:	08813023          	sd	s0,128(sp)
    80004820:	07313423          	sd	s3,104(sp)
    80004824:	09010413          	addi	s0,sp,144
    80004828:	05813023          	sd	s8,64(sp)
    8000482c:	08113423          	sd	ra,136(sp)
    80004830:	06913c23          	sd	s1,120(sp)
    80004834:	07213823          	sd	s2,112(sp)
    80004838:	07413023          	sd	s4,96(sp)
    8000483c:	05513c23          	sd	s5,88(sp)
    80004840:	05613823          	sd	s6,80(sp)
    80004844:	05713423          	sd	s7,72(sp)
    80004848:	03913c23          	sd	s9,56(sp)
    8000484c:	03a13823          	sd	s10,48(sp)
    80004850:	03b13423          	sd	s11,40(sp)
    80004854:	00003317          	auipc	t1,0x3
    80004858:	6dc30313          	addi	t1,t1,1756 # 80007f30 <pr>
    8000485c:	01832c03          	lw	s8,24(t1)
    80004860:	00b43423          	sd	a1,8(s0)
    80004864:	00c43823          	sd	a2,16(s0)
    80004868:	00d43c23          	sd	a3,24(s0)
    8000486c:	02e43023          	sd	a4,32(s0)
    80004870:	02f43423          	sd	a5,40(s0)
    80004874:	03043823          	sd	a6,48(s0)
    80004878:	03143c23          	sd	a7,56(s0)
    8000487c:	00050993          	mv	s3,a0
    80004880:	4a0c1663          	bnez	s8,80004d2c <__printf+0x514>
    80004884:	60098c63          	beqz	s3,80004e9c <__printf+0x684>
    80004888:	0009c503          	lbu	a0,0(s3)
    8000488c:	00840793          	addi	a5,s0,8
    80004890:	f6f43c23          	sd	a5,-136(s0)
    80004894:	00000493          	li	s1,0
    80004898:	22050063          	beqz	a0,80004ab8 <__printf+0x2a0>
    8000489c:	00002a37          	lui	s4,0x2
    800048a0:	00018ab7          	lui	s5,0x18
    800048a4:	000f4b37          	lui	s6,0xf4
    800048a8:	00989bb7          	lui	s7,0x989
    800048ac:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800048b0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800048b4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800048b8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800048bc:	00148c9b          	addiw	s9,s1,1
    800048c0:	02500793          	li	a5,37
    800048c4:	01998933          	add	s2,s3,s9
    800048c8:	38f51263          	bne	a0,a5,80004c4c <__printf+0x434>
    800048cc:	00094783          	lbu	a5,0(s2)
    800048d0:	00078c9b          	sext.w	s9,a5
    800048d4:	1e078263          	beqz	a5,80004ab8 <__printf+0x2a0>
    800048d8:	0024849b          	addiw	s1,s1,2
    800048dc:	07000713          	li	a4,112
    800048e0:	00998933          	add	s2,s3,s1
    800048e4:	38e78a63          	beq	a5,a4,80004c78 <__printf+0x460>
    800048e8:	20f76863          	bltu	a4,a5,80004af8 <__printf+0x2e0>
    800048ec:	42a78863          	beq	a5,a0,80004d1c <__printf+0x504>
    800048f0:	06400713          	li	a4,100
    800048f4:	40e79663          	bne	a5,a4,80004d00 <__printf+0x4e8>
    800048f8:	f7843783          	ld	a5,-136(s0)
    800048fc:	0007a603          	lw	a2,0(a5)
    80004900:	00878793          	addi	a5,a5,8
    80004904:	f6f43c23          	sd	a5,-136(s0)
    80004908:	42064a63          	bltz	a2,80004d3c <__printf+0x524>
    8000490c:	00a00713          	li	a4,10
    80004910:	02e677bb          	remuw	a5,a2,a4
    80004914:	00002d97          	auipc	s11,0x2
    80004918:	9b4d8d93          	addi	s11,s11,-1612 # 800062c8 <digits>
    8000491c:	00900593          	li	a1,9
    80004920:	0006051b          	sext.w	a0,a2
    80004924:	00000c93          	li	s9,0
    80004928:	02079793          	slli	a5,a5,0x20
    8000492c:	0207d793          	srli	a5,a5,0x20
    80004930:	00fd87b3          	add	a5,s11,a5
    80004934:	0007c783          	lbu	a5,0(a5)
    80004938:	02e656bb          	divuw	a3,a2,a4
    8000493c:	f8f40023          	sb	a5,-128(s0)
    80004940:	14c5d863          	bge	a1,a2,80004a90 <__printf+0x278>
    80004944:	06300593          	li	a1,99
    80004948:	00100c93          	li	s9,1
    8000494c:	02e6f7bb          	remuw	a5,a3,a4
    80004950:	02079793          	slli	a5,a5,0x20
    80004954:	0207d793          	srli	a5,a5,0x20
    80004958:	00fd87b3          	add	a5,s11,a5
    8000495c:	0007c783          	lbu	a5,0(a5)
    80004960:	02e6d73b          	divuw	a4,a3,a4
    80004964:	f8f400a3          	sb	a5,-127(s0)
    80004968:	12a5f463          	bgeu	a1,a0,80004a90 <__printf+0x278>
    8000496c:	00a00693          	li	a3,10
    80004970:	00900593          	li	a1,9
    80004974:	02d777bb          	remuw	a5,a4,a3
    80004978:	02079793          	slli	a5,a5,0x20
    8000497c:	0207d793          	srli	a5,a5,0x20
    80004980:	00fd87b3          	add	a5,s11,a5
    80004984:	0007c503          	lbu	a0,0(a5)
    80004988:	02d757bb          	divuw	a5,a4,a3
    8000498c:	f8a40123          	sb	a0,-126(s0)
    80004990:	48e5f263          	bgeu	a1,a4,80004e14 <__printf+0x5fc>
    80004994:	06300513          	li	a0,99
    80004998:	02d7f5bb          	remuw	a1,a5,a3
    8000499c:	02059593          	slli	a1,a1,0x20
    800049a0:	0205d593          	srli	a1,a1,0x20
    800049a4:	00bd85b3          	add	a1,s11,a1
    800049a8:	0005c583          	lbu	a1,0(a1)
    800049ac:	02d7d7bb          	divuw	a5,a5,a3
    800049b0:	f8b401a3          	sb	a1,-125(s0)
    800049b4:	48e57263          	bgeu	a0,a4,80004e38 <__printf+0x620>
    800049b8:	3e700513          	li	a0,999
    800049bc:	02d7f5bb          	remuw	a1,a5,a3
    800049c0:	02059593          	slli	a1,a1,0x20
    800049c4:	0205d593          	srli	a1,a1,0x20
    800049c8:	00bd85b3          	add	a1,s11,a1
    800049cc:	0005c583          	lbu	a1,0(a1)
    800049d0:	02d7d7bb          	divuw	a5,a5,a3
    800049d4:	f8b40223          	sb	a1,-124(s0)
    800049d8:	46e57663          	bgeu	a0,a4,80004e44 <__printf+0x62c>
    800049dc:	02d7f5bb          	remuw	a1,a5,a3
    800049e0:	02059593          	slli	a1,a1,0x20
    800049e4:	0205d593          	srli	a1,a1,0x20
    800049e8:	00bd85b3          	add	a1,s11,a1
    800049ec:	0005c583          	lbu	a1,0(a1)
    800049f0:	02d7d7bb          	divuw	a5,a5,a3
    800049f4:	f8b402a3          	sb	a1,-123(s0)
    800049f8:	46ea7863          	bgeu	s4,a4,80004e68 <__printf+0x650>
    800049fc:	02d7f5bb          	remuw	a1,a5,a3
    80004a00:	02059593          	slli	a1,a1,0x20
    80004a04:	0205d593          	srli	a1,a1,0x20
    80004a08:	00bd85b3          	add	a1,s11,a1
    80004a0c:	0005c583          	lbu	a1,0(a1)
    80004a10:	02d7d7bb          	divuw	a5,a5,a3
    80004a14:	f8b40323          	sb	a1,-122(s0)
    80004a18:	3eeaf863          	bgeu	s5,a4,80004e08 <__printf+0x5f0>
    80004a1c:	02d7f5bb          	remuw	a1,a5,a3
    80004a20:	02059593          	slli	a1,a1,0x20
    80004a24:	0205d593          	srli	a1,a1,0x20
    80004a28:	00bd85b3          	add	a1,s11,a1
    80004a2c:	0005c583          	lbu	a1,0(a1)
    80004a30:	02d7d7bb          	divuw	a5,a5,a3
    80004a34:	f8b403a3          	sb	a1,-121(s0)
    80004a38:	42eb7e63          	bgeu	s6,a4,80004e74 <__printf+0x65c>
    80004a3c:	02d7f5bb          	remuw	a1,a5,a3
    80004a40:	02059593          	slli	a1,a1,0x20
    80004a44:	0205d593          	srli	a1,a1,0x20
    80004a48:	00bd85b3          	add	a1,s11,a1
    80004a4c:	0005c583          	lbu	a1,0(a1)
    80004a50:	02d7d7bb          	divuw	a5,a5,a3
    80004a54:	f8b40423          	sb	a1,-120(s0)
    80004a58:	42ebfc63          	bgeu	s7,a4,80004e90 <__printf+0x678>
    80004a5c:	02079793          	slli	a5,a5,0x20
    80004a60:	0207d793          	srli	a5,a5,0x20
    80004a64:	00fd8db3          	add	s11,s11,a5
    80004a68:	000dc703          	lbu	a4,0(s11)
    80004a6c:	00a00793          	li	a5,10
    80004a70:	00900c93          	li	s9,9
    80004a74:	f8e404a3          	sb	a4,-119(s0)
    80004a78:	00065c63          	bgez	a2,80004a90 <__printf+0x278>
    80004a7c:	f9040713          	addi	a4,s0,-112
    80004a80:	00f70733          	add	a4,a4,a5
    80004a84:	02d00693          	li	a3,45
    80004a88:	fed70823          	sb	a3,-16(a4)
    80004a8c:	00078c93          	mv	s9,a5
    80004a90:	f8040793          	addi	a5,s0,-128
    80004a94:	01978cb3          	add	s9,a5,s9
    80004a98:	f7f40d13          	addi	s10,s0,-129
    80004a9c:	000cc503          	lbu	a0,0(s9)
    80004aa0:	fffc8c93          	addi	s9,s9,-1
    80004aa4:	00000097          	auipc	ra,0x0
    80004aa8:	b90080e7          	jalr	-1136(ra) # 80004634 <consputc>
    80004aac:	ffac98e3          	bne	s9,s10,80004a9c <__printf+0x284>
    80004ab0:	00094503          	lbu	a0,0(s2)
    80004ab4:	e00514e3          	bnez	a0,800048bc <__printf+0xa4>
    80004ab8:	1a0c1663          	bnez	s8,80004c64 <__printf+0x44c>
    80004abc:	08813083          	ld	ra,136(sp)
    80004ac0:	08013403          	ld	s0,128(sp)
    80004ac4:	07813483          	ld	s1,120(sp)
    80004ac8:	07013903          	ld	s2,112(sp)
    80004acc:	06813983          	ld	s3,104(sp)
    80004ad0:	06013a03          	ld	s4,96(sp)
    80004ad4:	05813a83          	ld	s5,88(sp)
    80004ad8:	05013b03          	ld	s6,80(sp)
    80004adc:	04813b83          	ld	s7,72(sp)
    80004ae0:	04013c03          	ld	s8,64(sp)
    80004ae4:	03813c83          	ld	s9,56(sp)
    80004ae8:	03013d03          	ld	s10,48(sp)
    80004aec:	02813d83          	ld	s11,40(sp)
    80004af0:	0d010113          	addi	sp,sp,208
    80004af4:	00008067          	ret
    80004af8:	07300713          	li	a4,115
    80004afc:	1ce78a63          	beq	a5,a4,80004cd0 <__printf+0x4b8>
    80004b00:	07800713          	li	a4,120
    80004b04:	1ee79e63          	bne	a5,a4,80004d00 <__printf+0x4e8>
    80004b08:	f7843783          	ld	a5,-136(s0)
    80004b0c:	0007a703          	lw	a4,0(a5)
    80004b10:	00878793          	addi	a5,a5,8
    80004b14:	f6f43c23          	sd	a5,-136(s0)
    80004b18:	28074263          	bltz	a4,80004d9c <__printf+0x584>
    80004b1c:	00001d97          	auipc	s11,0x1
    80004b20:	7acd8d93          	addi	s11,s11,1964 # 800062c8 <digits>
    80004b24:	00f77793          	andi	a5,a4,15
    80004b28:	00fd87b3          	add	a5,s11,a5
    80004b2c:	0007c683          	lbu	a3,0(a5)
    80004b30:	00f00613          	li	a2,15
    80004b34:	0007079b          	sext.w	a5,a4
    80004b38:	f8d40023          	sb	a3,-128(s0)
    80004b3c:	0047559b          	srliw	a1,a4,0x4
    80004b40:	0047569b          	srliw	a3,a4,0x4
    80004b44:	00000c93          	li	s9,0
    80004b48:	0ee65063          	bge	a2,a4,80004c28 <__printf+0x410>
    80004b4c:	00f6f693          	andi	a3,a3,15
    80004b50:	00dd86b3          	add	a3,s11,a3
    80004b54:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004b58:	0087d79b          	srliw	a5,a5,0x8
    80004b5c:	00100c93          	li	s9,1
    80004b60:	f8d400a3          	sb	a3,-127(s0)
    80004b64:	0cb67263          	bgeu	a2,a1,80004c28 <__printf+0x410>
    80004b68:	00f7f693          	andi	a3,a5,15
    80004b6c:	00dd86b3          	add	a3,s11,a3
    80004b70:	0006c583          	lbu	a1,0(a3)
    80004b74:	00f00613          	li	a2,15
    80004b78:	0047d69b          	srliw	a3,a5,0x4
    80004b7c:	f8b40123          	sb	a1,-126(s0)
    80004b80:	0047d593          	srli	a1,a5,0x4
    80004b84:	28f67e63          	bgeu	a2,a5,80004e20 <__printf+0x608>
    80004b88:	00f6f693          	andi	a3,a3,15
    80004b8c:	00dd86b3          	add	a3,s11,a3
    80004b90:	0006c503          	lbu	a0,0(a3)
    80004b94:	0087d813          	srli	a6,a5,0x8
    80004b98:	0087d69b          	srliw	a3,a5,0x8
    80004b9c:	f8a401a3          	sb	a0,-125(s0)
    80004ba0:	28b67663          	bgeu	a2,a1,80004e2c <__printf+0x614>
    80004ba4:	00f6f693          	andi	a3,a3,15
    80004ba8:	00dd86b3          	add	a3,s11,a3
    80004bac:	0006c583          	lbu	a1,0(a3)
    80004bb0:	00c7d513          	srli	a0,a5,0xc
    80004bb4:	00c7d69b          	srliw	a3,a5,0xc
    80004bb8:	f8b40223          	sb	a1,-124(s0)
    80004bbc:	29067a63          	bgeu	a2,a6,80004e50 <__printf+0x638>
    80004bc0:	00f6f693          	andi	a3,a3,15
    80004bc4:	00dd86b3          	add	a3,s11,a3
    80004bc8:	0006c583          	lbu	a1,0(a3)
    80004bcc:	0107d813          	srli	a6,a5,0x10
    80004bd0:	0107d69b          	srliw	a3,a5,0x10
    80004bd4:	f8b402a3          	sb	a1,-123(s0)
    80004bd8:	28a67263          	bgeu	a2,a0,80004e5c <__printf+0x644>
    80004bdc:	00f6f693          	andi	a3,a3,15
    80004be0:	00dd86b3          	add	a3,s11,a3
    80004be4:	0006c683          	lbu	a3,0(a3)
    80004be8:	0147d79b          	srliw	a5,a5,0x14
    80004bec:	f8d40323          	sb	a3,-122(s0)
    80004bf0:	21067663          	bgeu	a2,a6,80004dfc <__printf+0x5e4>
    80004bf4:	02079793          	slli	a5,a5,0x20
    80004bf8:	0207d793          	srli	a5,a5,0x20
    80004bfc:	00fd8db3          	add	s11,s11,a5
    80004c00:	000dc683          	lbu	a3,0(s11)
    80004c04:	00800793          	li	a5,8
    80004c08:	00700c93          	li	s9,7
    80004c0c:	f8d403a3          	sb	a3,-121(s0)
    80004c10:	00075c63          	bgez	a4,80004c28 <__printf+0x410>
    80004c14:	f9040713          	addi	a4,s0,-112
    80004c18:	00f70733          	add	a4,a4,a5
    80004c1c:	02d00693          	li	a3,45
    80004c20:	fed70823          	sb	a3,-16(a4)
    80004c24:	00078c93          	mv	s9,a5
    80004c28:	f8040793          	addi	a5,s0,-128
    80004c2c:	01978cb3          	add	s9,a5,s9
    80004c30:	f7f40d13          	addi	s10,s0,-129
    80004c34:	000cc503          	lbu	a0,0(s9)
    80004c38:	fffc8c93          	addi	s9,s9,-1
    80004c3c:	00000097          	auipc	ra,0x0
    80004c40:	9f8080e7          	jalr	-1544(ra) # 80004634 <consputc>
    80004c44:	ff9d18e3          	bne	s10,s9,80004c34 <__printf+0x41c>
    80004c48:	0100006f          	j	80004c58 <__printf+0x440>
    80004c4c:	00000097          	auipc	ra,0x0
    80004c50:	9e8080e7          	jalr	-1560(ra) # 80004634 <consputc>
    80004c54:	000c8493          	mv	s1,s9
    80004c58:	00094503          	lbu	a0,0(s2)
    80004c5c:	c60510e3          	bnez	a0,800048bc <__printf+0xa4>
    80004c60:	e40c0ee3          	beqz	s8,80004abc <__printf+0x2a4>
    80004c64:	00003517          	auipc	a0,0x3
    80004c68:	2cc50513          	addi	a0,a0,716 # 80007f30 <pr>
    80004c6c:	00001097          	auipc	ra,0x1
    80004c70:	94c080e7          	jalr	-1716(ra) # 800055b8 <release>
    80004c74:	e49ff06f          	j	80004abc <__printf+0x2a4>
    80004c78:	f7843783          	ld	a5,-136(s0)
    80004c7c:	03000513          	li	a0,48
    80004c80:	01000d13          	li	s10,16
    80004c84:	00878713          	addi	a4,a5,8
    80004c88:	0007bc83          	ld	s9,0(a5)
    80004c8c:	f6e43c23          	sd	a4,-136(s0)
    80004c90:	00000097          	auipc	ra,0x0
    80004c94:	9a4080e7          	jalr	-1628(ra) # 80004634 <consputc>
    80004c98:	07800513          	li	a0,120
    80004c9c:	00000097          	auipc	ra,0x0
    80004ca0:	998080e7          	jalr	-1640(ra) # 80004634 <consputc>
    80004ca4:	00001d97          	auipc	s11,0x1
    80004ca8:	624d8d93          	addi	s11,s11,1572 # 800062c8 <digits>
    80004cac:	03ccd793          	srli	a5,s9,0x3c
    80004cb0:	00fd87b3          	add	a5,s11,a5
    80004cb4:	0007c503          	lbu	a0,0(a5)
    80004cb8:	fffd0d1b          	addiw	s10,s10,-1
    80004cbc:	004c9c93          	slli	s9,s9,0x4
    80004cc0:	00000097          	auipc	ra,0x0
    80004cc4:	974080e7          	jalr	-1676(ra) # 80004634 <consputc>
    80004cc8:	fe0d12e3          	bnez	s10,80004cac <__printf+0x494>
    80004ccc:	f8dff06f          	j	80004c58 <__printf+0x440>
    80004cd0:	f7843783          	ld	a5,-136(s0)
    80004cd4:	0007bc83          	ld	s9,0(a5)
    80004cd8:	00878793          	addi	a5,a5,8
    80004cdc:	f6f43c23          	sd	a5,-136(s0)
    80004ce0:	000c9a63          	bnez	s9,80004cf4 <__printf+0x4dc>
    80004ce4:	1080006f          	j	80004dec <__printf+0x5d4>
    80004ce8:	001c8c93          	addi	s9,s9,1
    80004cec:	00000097          	auipc	ra,0x0
    80004cf0:	948080e7          	jalr	-1720(ra) # 80004634 <consputc>
    80004cf4:	000cc503          	lbu	a0,0(s9)
    80004cf8:	fe0518e3          	bnez	a0,80004ce8 <__printf+0x4d0>
    80004cfc:	f5dff06f          	j	80004c58 <__printf+0x440>
    80004d00:	02500513          	li	a0,37
    80004d04:	00000097          	auipc	ra,0x0
    80004d08:	930080e7          	jalr	-1744(ra) # 80004634 <consputc>
    80004d0c:	000c8513          	mv	a0,s9
    80004d10:	00000097          	auipc	ra,0x0
    80004d14:	924080e7          	jalr	-1756(ra) # 80004634 <consputc>
    80004d18:	f41ff06f          	j	80004c58 <__printf+0x440>
    80004d1c:	02500513          	li	a0,37
    80004d20:	00000097          	auipc	ra,0x0
    80004d24:	914080e7          	jalr	-1772(ra) # 80004634 <consputc>
    80004d28:	f31ff06f          	j	80004c58 <__printf+0x440>
    80004d2c:	00030513          	mv	a0,t1
    80004d30:	00000097          	auipc	ra,0x0
    80004d34:	7bc080e7          	jalr	1980(ra) # 800054ec <acquire>
    80004d38:	b4dff06f          	j	80004884 <__printf+0x6c>
    80004d3c:	40c0053b          	negw	a0,a2
    80004d40:	00a00713          	li	a4,10
    80004d44:	02e576bb          	remuw	a3,a0,a4
    80004d48:	00001d97          	auipc	s11,0x1
    80004d4c:	580d8d93          	addi	s11,s11,1408 # 800062c8 <digits>
    80004d50:	ff700593          	li	a1,-9
    80004d54:	02069693          	slli	a3,a3,0x20
    80004d58:	0206d693          	srli	a3,a3,0x20
    80004d5c:	00dd86b3          	add	a3,s11,a3
    80004d60:	0006c683          	lbu	a3,0(a3)
    80004d64:	02e557bb          	divuw	a5,a0,a4
    80004d68:	f8d40023          	sb	a3,-128(s0)
    80004d6c:	10b65e63          	bge	a2,a1,80004e88 <__printf+0x670>
    80004d70:	06300593          	li	a1,99
    80004d74:	02e7f6bb          	remuw	a3,a5,a4
    80004d78:	02069693          	slli	a3,a3,0x20
    80004d7c:	0206d693          	srli	a3,a3,0x20
    80004d80:	00dd86b3          	add	a3,s11,a3
    80004d84:	0006c683          	lbu	a3,0(a3)
    80004d88:	02e7d73b          	divuw	a4,a5,a4
    80004d8c:	00200793          	li	a5,2
    80004d90:	f8d400a3          	sb	a3,-127(s0)
    80004d94:	bca5ece3          	bltu	a1,a0,8000496c <__printf+0x154>
    80004d98:	ce5ff06f          	j	80004a7c <__printf+0x264>
    80004d9c:	40e007bb          	negw	a5,a4
    80004da0:	00001d97          	auipc	s11,0x1
    80004da4:	528d8d93          	addi	s11,s11,1320 # 800062c8 <digits>
    80004da8:	00f7f693          	andi	a3,a5,15
    80004dac:	00dd86b3          	add	a3,s11,a3
    80004db0:	0006c583          	lbu	a1,0(a3)
    80004db4:	ff100613          	li	a2,-15
    80004db8:	0047d69b          	srliw	a3,a5,0x4
    80004dbc:	f8b40023          	sb	a1,-128(s0)
    80004dc0:	0047d59b          	srliw	a1,a5,0x4
    80004dc4:	0ac75e63          	bge	a4,a2,80004e80 <__printf+0x668>
    80004dc8:	00f6f693          	andi	a3,a3,15
    80004dcc:	00dd86b3          	add	a3,s11,a3
    80004dd0:	0006c603          	lbu	a2,0(a3)
    80004dd4:	00f00693          	li	a3,15
    80004dd8:	0087d79b          	srliw	a5,a5,0x8
    80004ddc:	f8c400a3          	sb	a2,-127(s0)
    80004de0:	d8b6e4e3          	bltu	a3,a1,80004b68 <__printf+0x350>
    80004de4:	00200793          	li	a5,2
    80004de8:	e2dff06f          	j	80004c14 <__printf+0x3fc>
    80004dec:	00001c97          	auipc	s9,0x1
    80004df0:	4bcc8c93          	addi	s9,s9,1212 # 800062a8 <CONSOLE_STATUS+0x298>
    80004df4:	02800513          	li	a0,40
    80004df8:	ef1ff06f          	j	80004ce8 <__printf+0x4d0>
    80004dfc:	00700793          	li	a5,7
    80004e00:	00600c93          	li	s9,6
    80004e04:	e0dff06f          	j	80004c10 <__printf+0x3f8>
    80004e08:	00700793          	li	a5,7
    80004e0c:	00600c93          	li	s9,6
    80004e10:	c69ff06f          	j	80004a78 <__printf+0x260>
    80004e14:	00300793          	li	a5,3
    80004e18:	00200c93          	li	s9,2
    80004e1c:	c5dff06f          	j	80004a78 <__printf+0x260>
    80004e20:	00300793          	li	a5,3
    80004e24:	00200c93          	li	s9,2
    80004e28:	de9ff06f          	j	80004c10 <__printf+0x3f8>
    80004e2c:	00400793          	li	a5,4
    80004e30:	00300c93          	li	s9,3
    80004e34:	dddff06f          	j	80004c10 <__printf+0x3f8>
    80004e38:	00400793          	li	a5,4
    80004e3c:	00300c93          	li	s9,3
    80004e40:	c39ff06f          	j	80004a78 <__printf+0x260>
    80004e44:	00500793          	li	a5,5
    80004e48:	00400c93          	li	s9,4
    80004e4c:	c2dff06f          	j	80004a78 <__printf+0x260>
    80004e50:	00500793          	li	a5,5
    80004e54:	00400c93          	li	s9,4
    80004e58:	db9ff06f          	j	80004c10 <__printf+0x3f8>
    80004e5c:	00600793          	li	a5,6
    80004e60:	00500c93          	li	s9,5
    80004e64:	dadff06f          	j	80004c10 <__printf+0x3f8>
    80004e68:	00600793          	li	a5,6
    80004e6c:	00500c93          	li	s9,5
    80004e70:	c09ff06f          	j	80004a78 <__printf+0x260>
    80004e74:	00800793          	li	a5,8
    80004e78:	00700c93          	li	s9,7
    80004e7c:	bfdff06f          	j	80004a78 <__printf+0x260>
    80004e80:	00100793          	li	a5,1
    80004e84:	d91ff06f          	j	80004c14 <__printf+0x3fc>
    80004e88:	00100793          	li	a5,1
    80004e8c:	bf1ff06f          	j	80004a7c <__printf+0x264>
    80004e90:	00900793          	li	a5,9
    80004e94:	00800c93          	li	s9,8
    80004e98:	be1ff06f          	j	80004a78 <__printf+0x260>
    80004e9c:	00001517          	auipc	a0,0x1
    80004ea0:	41450513          	addi	a0,a0,1044 # 800062b0 <CONSOLE_STATUS+0x2a0>
    80004ea4:	00000097          	auipc	ra,0x0
    80004ea8:	918080e7          	jalr	-1768(ra) # 800047bc <panic>

0000000080004eac <printfinit>:
    80004eac:	fe010113          	addi	sp,sp,-32
    80004eb0:	00813823          	sd	s0,16(sp)
    80004eb4:	00913423          	sd	s1,8(sp)
    80004eb8:	00113c23          	sd	ra,24(sp)
    80004ebc:	02010413          	addi	s0,sp,32
    80004ec0:	00003497          	auipc	s1,0x3
    80004ec4:	07048493          	addi	s1,s1,112 # 80007f30 <pr>
    80004ec8:	00048513          	mv	a0,s1
    80004ecc:	00001597          	auipc	a1,0x1
    80004ed0:	3f458593          	addi	a1,a1,1012 # 800062c0 <CONSOLE_STATUS+0x2b0>
    80004ed4:	00000097          	auipc	ra,0x0
    80004ed8:	5f4080e7          	jalr	1524(ra) # 800054c8 <initlock>
    80004edc:	01813083          	ld	ra,24(sp)
    80004ee0:	01013403          	ld	s0,16(sp)
    80004ee4:	0004ac23          	sw	zero,24(s1)
    80004ee8:	00813483          	ld	s1,8(sp)
    80004eec:	02010113          	addi	sp,sp,32
    80004ef0:	00008067          	ret

0000000080004ef4 <uartinit>:
    80004ef4:	ff010113          	addi	sp,sp,-16
    80004ef8:	00813423          	sd	s0,8(sp)
    80004efc:	01010413          	addi	s0,sp,16
    80004f00:	100007b7          	lui	a5,0x10000
    80004f04:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004f08:	f8000713          	li	a4,-128
    80004f0c:	00e781a3          	sb	a4,3(a5)
    80004f10:	00300713          	li	a4,3
    80004f14:	00e78023          	sb	a4,0(a5)
    80004f18:	000780a3          	sb	zero,1(a5)
    80004f1c:	00e781a3          	sb	a4,3(a5)
    80004f20:	00700693          	li	a3,7
    80004f24:	00d78123          	sb	a3,2(a5)
    80004f28:	00e780a3          	sb	a4,1(a5)
    80004f2c:	00813403          	ld	s0,8(sp)
    80004f30:	01010113          	addi	sp,sp,16
    80004f34:	00008067          	ret

0000000080004f38 <uartputc>:
    80004f38:	00002797          	auipc	a5,0x2
    80004f3c:	d807a783          	lw	a5,-640(a5) # 80006cb8 <panicked>
    80004f40:	00078463          	beqz	a5,80004f48 <uartputc+0x10>
    80004f44:	0000006f          	j	80004f44 <uartputc+0xc>
    80004f48:	fd010113          	addi	sp,sp,-48
    80004f4c:	02813023          	sd	s0,32(sp)
    80004f50:	00913c23          	sd	s1,24(sp)
    80004f54:	01213823          	sd	s2,16(sp)
    80004f58:	01313423          	sd	s3,8(sp)
    80004f5c:	02113423          	sd	ra,40(sp)
    80004f60:	03010413          	addi	s0,sp,48
    80004f64:	00002917          	auipc	s2,0x2
    80004f68:	d5c90913          	addi	s2,s2,-676 # 80006cc0 <uart_tx_r>
    80004f6c:	00093783          	ld	a5,0(s2)
    80004f70:	00002497          	auipc	s1,0x2
    80004f74:	d5848493          	addi	s1,s1,-680 # 80006cc8 <uart_tx_w>
    80004f78:	0004b703          	ld	a4,0(s1)
    80004f7c:	02078693          	addi	a3,a5,32
    80004f80:	00050993          	mv	s3,a0
    80004f84:	02e69c63          	bne	a3,a4,80004fbc <uartputc+0x84>
    80004f88:	00001097          	auipc	ra,0x1
    80004f8c:	834080e7          	jalr	-1996(ra) # 800057bc <push_on>
    80004f90:	00093783          	ld	a5,0(s2)
    80004f94:	0004b703          	ld	a4,0(s1)
    80004f98:	02078793          	addi	a5,a5,32
    80004f9c:	00e79463          	bne	a5,a4,80004fa4 <uartputc+0x6c>
    80004fa0:	0000006f          	j	80004fa0 <uartputc+0x68>
    80004fa4:	00001097          	auipc	ra,0x1
    80004fa8:	88c080e7          	jalr	-1908(ra) # 80005830 <pop_on>
    80004fac:	00093783          	ld	a5,0(s2)
    80004fb0:	0004b703          	ld	a4,0(s1)
    80004fb4:	02078693          	addi	a3,a5,32
    80004fb8:	fce688e3          	beq	a3,a4,80004f88 <uartputc+0x50>
    80004fbc:	01f77693          	andi	a3,a4,31
    80004fc0:	00003597          	auipc	a1,0x3
    80004fc4:	f9058593          	addi	a1,a1,-112 # 80007f50 <uart_tx_buf>
    80004fc8:	00d586b3          	add	a3,a1,a3
    80004fcc:	00170713          	addi	a4,a4,1
    80004fd0:	01368023          	sb	s3,0(a3)
    80004fd4:	00e4b023          	sd	a4,0(s1)
    80004fd8:	10000637          	lui	a2,0x10000
    80004fdc:	02f71063          	bne	a4,a5,80004ffc <uartputc+0xc4>
    80004fe0:	0340006f          	j	80005014 <uartputc+0xdc>
    80004fe4:	00074703          	lbu	a4,0(a4)
    80004fe8:	00f93023          	sd	a5,0(s2)
    80004fec:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004ff0:	00093783          	ld	a5,0(s2)
    80004ff4:	0004b703          	ld	a4,0(s1)
    80004ff8:	00f70e63          	beq	a4,a5,80005014 <uartputc+0xdc>
    80004ffc:	00564683          	lbu	a3,5(a2)
    80005000:	01f7f713          	andi	a4,a5,31
    80005004:	00e58733          	add	a4,a1,a4
    80005008:	0206f693          	andi	a3,a3,32
    8000500c:	00178793          	addi	a5,a5,1
    80005010:	fc069ae3          	bnez	a3,80004fe4 <uartputc+0xac>
    80005014:	02813083          	ld	ra,40(sp)
    80005018:	02013403          	ld	s0,32(sp)
    8000501c:	01813483          	ld	s1,24(sp)
    80005020:	01013903          	ld	s2,16(sp)
    80005024:	00813983          	ld	s3,8(sp)
    80005028:	03010113          	addi	sp,sp,48
    8000502c:	00008067          	ret

0000000080005030 <uartputc_sync>:
    80005030:	ff010113          	addi	sp,sp,-16
    80005034:	00813423          	sd	s0,8(sp)
    80005038:	01010413          	addi	s0,sp,16
    8000503c:	00002717          	auipc	a4,0x2
    80005040:	c7c72703          	lw	a4,-900(a4) # 80006cb8 <panicked>
    80005044:	02071663          	bnez	a4,80005070 <uartputc_sync+0x40>
    80005048:	00050793          	mv	a5,a0
    8000504c:	100006b7          	lui	a3,0x10000
    80005050:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005054:	02077713          	andi	a4,a4,32
    80005058:	fe070ce3          	beqz	a4,80005050 <uartputc_sync+0x20>
    8000505c:	0ff7f793          	andi	a5,a5,255
    80005060:	00f68023          	sb	a5,0(a3)
    80005064:	00813403          	ld	s0,8(sp)
    80005068:	01010113          	addi	sp,sp,16
    8000506c:	00008067          	ret
    80005070:	0000006f          	j	80005070 <uartputc_sync+0x40>

0000000080005074 <uartstart>:
    80005074:	ff010113          	addi	sp,sp,-16
    80005078:	00813423          	sd	s0,8(sp)
    8000507c:	01010413          	addi	s0,sp,16
    80005080:	00002617          	auipc	a2,0x2
    80005084:	c4060613          	addi	a2,a2,-960 # 80006cc0 <uart_tx_r>
    80005088:	00002517          	auipc	a0,0x2
    8000508c:	c4050513          	addi	a0,a0,-960 # 80006cc8 <uart_tx_w>
    80005090:	00063783          	ld	a5,0(a2)
    80005094:	00053703          	ld	a4,0(a0)
    80005098:	04f70263          	beq	a4,a5,800050dc <uartstart+0x68>
    8000509c:	100005b7          	lui	a1,0x10000
    800050a0:	00003817          	auipc	a6,0x3
    800050a4:	eb080813          	addi	a6,a6,-336 # 80007f50 <uart_tx_buf>
    800050a8:	01c0006f          	j	800050c4 <uartstart+0x50>
    800050ac:	0006c703          	lbu	a4,0(a3)
    800050b0:	00f63023          	sd	a5,0(a2)
    800050b4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800050b8:	00063783          	ld	a5,0(a2)
    800050bc:	00053703          	ld	a4,0(a0)
    800050c0:	00f70e63          	beq	a4,a5,800050dc <uartstart+0x68>
    800050c4:	01f7f713          	andi	a4,a5,31
    800050c8:	00e806b3          	add	a3,a6,a4
    800050cc:	0055c703          	lbu	a4,5(a1)
    800050d0:	00178793          	addi	a5,a5,1
    800050d4:	02077713          	andi	a4,a4,32
    800050d8:	fc071ae3          	bnez	a4,800050ac <uartstart+0x38>
    800050dc:	00813403          	ld	s0,8(sp)
    800050e0:	01010113          	addi	sp,sp,16
    800050e4:	00008067          	ret

00000000800050e8 <uartgetc>:
    800050e8:	ff010113          	addi	sp,sp,-16
    800050ec:	00813423          	sd	s0,8(sp)
    800050f0:	01010413          	addi	s0,sp,16
    800050f4:	10000737          	lui	a4,0x10000
    800050f8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800050fc:	0017f793          	andi	a5,a5,1
    80005100:	00078c63          	beqz	a5,80005118 <uartgetc+0x30>
    80005104:	00074503          	lbu	a0,0(a4)
    80005108:	0ff57513          	andi	a0,a0,255
    8000510c:	00813403          	ld	s0,8(sp)
    80005110:	01010113          	addi	sp,sp,16
    80005114:	00008067          	ret
    80005118:	fff00513          	li	a0,-1
    8000511c:	ff1ff06f          	j	8000510c <uartgetc+0x24>

0000000080005120 <uartintr>:
    80005120:	100007b7          	lui	a5,0x10000
    80005124:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80005128:	0017f793          	andi	a5,a5,1
    8000512c:	0a078463          	beqz	a5,800051d4 <uartintr+0xb4>
    80005130:	fe010113          	addi	sp,sp,-32
    80005134:	00813823          	sd	s0,16(sp)
    80005138:	00913423          	sd	s1,8(sp)
    8000513c:	00113c23          	sd	ra,24(sp)
    80005140:	02010413          	addi	s0,sp,32
    80005144:	100004b7          	lui	s1,0x10000
    80005148:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000514c:	0ff57513          	andi	a0,a0,255
    80005150:	fffff097          	auipc	ra,0xfffff
    80005154:	534080e7          	jalr	1332(ra) # 80004684 <consoleintr>
    80005158:	0054c783          	lbu	a5,5(s1)
    8000515c:	0017f793          	andi	a5,a5,1
    80005160:	fe0794e3          	bnez	a5,80005148 <uartintr+0x28>
    80005164:	00002617          	auipc	a2,0x2
    80005168:	b5c60613          	addi	a2,a2,-1188 # 80006cc0 <uart_tx_r>
    8000516c:	00002517          	auipc	a0,0x2
    80005170:	b5c50513          	addi	a0,a0,-1188 # 80006cc8 <uart_tx_w>
    80005174:	00063783          	ld	a5,0(a2)
    80005178:	00053703          	ld	a4,0(a0)
    8000517c:	04f70263          	beq	a4,a5,800051c0 <uartintr+0xa0>
    80005180:	100005b7          	lui	a1,0x10000
    80005184:	00003817          	auipc	a6,0x3
    80005188:	dcc80813          	addi	a6,a6,-564 # 80007f50 <uart_tx_buf>
    8000518c:	01c0006f          	j	800051a8 <uartintr+0x88>
    80005190:	0006c703          	lbu	a4,0(a3)
    80005194:	00f63023          	sd	a5,0(a2)
    80005198:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000519c:	00063783          	ld	a5,0(a2)
    800051a0:	00053703          	ld	a4,0(a0)
    800051a4:	00f70e63          	beq	a4,a5,800051c0 <uartintr+0xa0>
    800051a8:	01f7f713          	andi	a4,a5,31
    800051ac:	00e806b3          	add	a3,a6,a4
    800051b0:	0055c703          	lbu	a4,5(a1)
    800051b4:	00178793          	addi	a5,a5,1
    800051b8:	02077713          	andi	a4,a4,32
    800051bc:	fc071ae3          	bnez	a4,80005190 <uartintr+0x70>
    800051c0:	01813083          	ld	ra,24(sp)
    800051c4:	01013403          	ld	s0,16(sp)
    800051c8:	00813483          	ld	s1,8(sp)
    800051cc:	02010113          	addi	sp,sp,32
    800051d0:	00008067          	ret
    800051d4:	00002617          	auipc	a2,0x2
    800051d8:	aec60613          	addi	a2,a2,-1300 # 80006cc0 <uart_tx_r>
    800051dc:	00002517          	auipc	a0,0x2
    800051e0:	aec50513          	addi	a0,a0,-1300 # 80006cc8 <uart_tx_w>
    800051e4:	00063783          	ld	a5,0(a2)
    800051e8:	00053703          	ld	a4,0(a0)
    800051ec:	04f70263          	beq	a4,a5,80005230 <uartintr+0x110>
    800051f0:	100005b7          	lui	a1,0x10000
    800051f4:	00003817          	auipc	a6,0x3
    800051f8:	d5c80813          	addi	a6,a6,-676 # 80007f50 <uart_tx_buf>
    800051fc:	01c0006f          	j	80005218 <uartintr+0xf8>
    80005200:	0006c703          	lbu	a4,0(a3)
    80005204:	00f63023          	sd	a5,0(a2)
    80005208:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000520c:	00063783          	ld	a5,0(a2)
    80005210:	00053703          	ld	a4,0(a0)
    80005214:	02f70063          	beq	a4,a5,80005234 <uartintr+0x114>
    80005218:	01f7f713          	andi	a4,a5,31
    8000521c:	00e806b3          	add	a3,a6,a4
    80005220:	0055c703          	lbu	a4,5(a1)
    80005224:	00178793          	addi	a5,a5,1
    80005228:	02077713          	andi	a4,a4,32
    8000522c:	fc071ae3          	bnez	a4,80005200 <uartintr+0xe0>
    80005230:	00008067          	ret
    80005234:	00008067          	ret

0000000080005238 <kinit>:
    80005238:	fc010113          	addi	sp,sp,-64
    8000523c:	02913423          	sd	s1,40(sp)
    80005240:	fffff7b7          	lui	a5,0xfffff
    80005244:	00004497          	auipc	s1,0x4
    80005248:	d2b48493          	addi	s1,s1,-725 # 80008f6f <end+0xfff>
    8000524c:	02813823          	sd	s0,48(sp)
    80005250:	01313c23          	sd	s3,24(sp)
    80005254:	00f4f4b3          	and	s1,s1,a5
    80005258:	02113c23          	sd	ra,56(sp)
    8000525c:	03213023          	sd	s2,32(sp)
    80005260:	01413823          	sd	s4,16(sp)
    80005264:	01513423          	sd	s5,8(sp)
    80005268:	04010413          	addi	s0,sp,64
    8000526c:	000017b7          	lui	a5,0x1
    80005270:	01100993          	li	s3,17
    80005274:	00f487b3          	add	a5,s1,a5
    80005278:	01b99993          	slli	s3,s3,0x1b
    8000527c:	06f9e063          	bltu	s3,a5,800052dc <kinit+0xa4>
    80005280:	00003a97          	auipc	s5,0x3
    80005284:	cf0a8a93          	addi	s5,s5,-784 # 80007f70 <end>
    80005288:	0754ec63          	bltu	s1,s5,80005300 <kinit+0xc8>
    8000528c:	0734fa63          	bgeu	s1,s3,80005300 <kinit+0xc8>
    80005290:	00088a37          	lui	s4,0x88
    80005294:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80005298:	00002917          	auipc	s2,0x2
    8000529c:	a3890913          	addi	s2,s2,-1480 # 80006cd0 <kmem>
    800052a0:	00ca1a13          	slli	s4,s4,0xc
    800052a4:	0140006f          	j	800052b8 <kinit+0x80>
    800052a8:	000017b7          	lui	a5,0x1
    800052ac:	00f484b3          	add	s1,s1,a5
    800052b0:	0554e863          	bltu	s1,s5,80005300 <kinit+0xc8>
    800052b4:	0534f663          	bgeu	s1,s3,80005300 <kinit+0xc8>
    800052b8:	00001637          	lui	a2,0x1
    800052bc:	00100593          	li	a1,1
    800052c0:	00048513          	mv	a0,s1
    800052c4:	00000097          	auipc	ra,0x0
    800052c8:	5e4080e7          	jalr	1508(ra) # 800058a8 <__memset>
    800052cc:	00093783          	ld	a5,0(s2)
    800052d0:	00f4b023          	sd	a5,0(s1)
    800052d4:	00993023          	sd	s1,0(s2)
    800052d8:	fd4498e3          	bne	s1,s4,800052a8 <kinit+0x70>
    800052dc:	03813083          	ld	ra,56(sp)
    800052e0:	03013403          	ld	s0,48(sp)
    800052e4:	02813483          	ld	s1,40(sp)
    800052e8:	02013903          	ld	s2,32(sp)
    800052ec:	01813983          	ld	s3,24(sp)
    800052f0:	01013a03          	ld	s4,16(sp)
    800052f4:	00813a83          	ld	s5,8(sp)
    800052f8:	04010113          	addi	sp,sp,64
    800052fc:	00008067          	ret
    80005300:	00001517          	auipc	a0,0x1
    80005304:	fe050513          	addi	a0,a0,-32 # 800062e0 <digits+0x18>
    80005308:	fffff097          	auipc	ra,0xfffff
    8000530c:	4b4080e7          	jalr	1204(ra) # 800047bc <panic>

0000000080005310 <freerange>:
    80005310:	fc010113          	addi	sp,sp,-64
    80005314:	000017b7          	lui	a5,0x1
    80005318:	02913423          	sd	s1,40(sp)
    8000531c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005320:	009504b3          	add	s1,a0,s1
    80005324:	fffff537          	lui	a0,0xfffff
    80005328:	02813823          	sd	s0,48(sp)
    8000532c:	02113c23          	sd	ra,56(sp)
    80005330:	03213023          	sd	s2,32(sp)
    80005334:	01313c23          	sd	s3,24(sp)
    80005338:	01413823          	sd	s4,16(sp)
    8000533c:	01513423          	sd	s5,8(sp)
    80005340:	01613023          	sd	s6,0(sp)
    80005344:	04010413          	addi	s0,sp,64
    80005348:	00a4f4b3          	and	s1,s1,a0
    8000534c:	00f487b3          	add	a5,s1,a5
    80005350:	06f5e463          	bltu	a1,a5,800053b8 <freerange+0xa8>
    80005354:	00003a97          	auipc	s5,0x3
    80005358:	c1ca8a93          	addi	s5,s5,-996 # 80007f70 <end>
    8000535c:	0954e263          	bltu	s1,s5,800053e0 <freerange+0xd0>
    80005360:	01100993          	li	s3,17
    80005364:	01b99993          	slli	s3,s3,0x1b
    80005368:	0734fc63          	bgeu	s1,s3,800053e0 <freerange+0xd0>
    8000536c:	00058a13          	mv	s4,a1
    80005370:	00002917          	auipc	s2,0x2
    80005374:	96090913          	addi	s2,s2,-1696 # 80006cd0 <kmem>
    80005378:	00002b37          	lui	s6,0x2
    8000537c:	0140006f          	j	80005390 <freerange+0x80>
    80005380:	000017b7          	lui	a5,0x1
    80005384:	00f484b3          	add	s1,s1,a5
    80005388:	0554ec63          	bltu	s1,s5,800053e0 <freerange+0xd0>
    8000538c:	0534fa63          	bgeu	s1,s3,800053e0 <freerange+0xd0>
    80005390:	00001637          	lui	a2,0x1
    80005394:	00100593          	li	a1,1
    80005398:	00048513          	mv	a0,s1
    8000539c:	00000097          	auipc	ra,0x0
    800053a0:	50c080e7          	jalr	1292(ra) # 800058a8 <__memset>
    800053a4:	00093703          	ld	a4,0(s2)
    800053a8:	016487b3          	add	a5,s1,s6
    800053ac:	00e4b023          	sd	a4,0(s1)
    800053b0:	00993023          	sd	s1,0(s2)
    800053b4:	fcfa76e3          	bgeu	s4,a5,80005380 <freerange+0x70>
    800053b8:	03813083          	ld	ra,56(sp)
    800053bc:	03013403          	ld	s0,48(sp)
    800053c0:	02813483          	ld	s1,40(sp)
    800053c4:	02013903          	ld	s2,32(sp)
    800053c8:	01813983          	ld	s3,24(sp)
    800053cc:	01013a03          	ld	s4,16(sp)
    800053d0:	00813a83          	ld	s5,8(sp)
    800053d4:	00013b03          	ld	s6,0(sp)
    800053d8:	04010113          	addi	sp,sp,64
    800053dc:	00008067          	ret
    800053e0:	00001517          	auipc	a0,0x1
    800053e4:	f0050513          	addi	a0,a0,-256 # 800062e0 <digits+0x18>
    800053e8:	fffff097          	auipc	ra,0xfffff
    800053ec:	3d4080e7          	jalr	980(ra) # 800047bc <panic>

00000000800053f0 <kfree>:
    800053f0:	fe010113          	addi	sp,sp,-32
    800053f4:	00813823          	sd	s0,16(sp)
    800053f8:	00113c23          	sd	ra,24(sp)
    800053fc:	00913423          	sd	s1,8(sp)
    80005400:	02010413          	addi	s0,sp,32
    80005404:	03451793          	slli	a5,a0,0x34
    80005408:	04079c63          	bnez	a5,80005460 <kfree+0x70>
    8000540c:	00003797          	auipc	a5,0x3
    80005410:	b6478793          	addi	a5,a5,-1180 # 80007f70 <end>
    80005414:	00050493          	mv	s1,a0
    80005418:	04f56463          	bltu	a0,a5,80005460 <kfree+0x70>
    8000541c:	01100793          	li	a5,17
    80005420:	01b79793          	slli	a5,a5,0x1b
    80005424:	02f57e63          	bgeu	a0,a5,80005460 <kfree+0x70>
    80005428:	00001637          	lui	a2,0x1
    8000542c:	00100593          	li	a1,1
    80005430:	00000097          	auipc	ra,0x0
    80005434:	478080e7          	jalr	1144(ra) # 800058a8 <__memset>
    80005438:	00002797          	auipc	a5,0x2
    8000543c:	89878793          	addi	a5,a5,-1896 # 80006cd0 <kmem>
    80005440:	0007b703          	ld	a4,0(a5)
    80005444:	01813083          	ld	ra,24(sp)
    80005448:	01013403          	ld	s0,16(sp)
    8000544c:	00e4b023          	sd	a4,0(s1)
    80005450:	0097b023          	sd	s1,0(a5)
    80005454:	00813483          	ld	s1,8(sp)
    80005458:	02010113          	addi	sp,sp,32
    8000545c:	00008067          	ret
    80005460:	00001517          	auipc	a0,0x1
    80005464:	e8050513          	addi	a0,a0,-384 # 800062e0 <digits+0x18>
    80005468:	fffff097          	auipc	ra,0xfffff
    8000546c:	354080e7          	jalr	852(ra) # 800047bc <panic>

0000000080005470 <kalloc>:
    80005470:	fe010113          	addi	sp,sp,-32
    80005474:	00813823          	sd	s0,16(sp)
    80005478:	00913423          	sd	s1,8(sp)
    8000547c:	00113c23          	sd	ra,24(sp)
    80005480:	02010413          	addi	s0,sp,32
    80005484:	00002797          	auipc	a5,0x2
    80005488:	84c78793          	addi	a5,a5,-1972 # 80006cd0 <kmem>
    8000548c:	0007b483          	ld	s1,0(a5)
    80005490:	02048063          	beqz	s1,800054b0 <kalloc+0x40>
    80005494:	0004b703          	ld	a4,0(s1)
    80005498:	00001637          	lui	a2,0x1
    8000549c:	00500593          	li	a1,5
    800054a0:	00048513          	mv	a0,s1
    800054a4:	00e7b023          	sd	a4,0(a5)
    800054a8:	00000097          	auipc	ra,0x0
    800054ac:	400080e7          	jalr	1024(ra) # 800058a8 <__memset>
    800054b0:	01813083          	ld	ra,24(sp)
    800054b4:	01013403          	ld	s0,16(sp)
    800054b8:	00048513          	mv	a0,s1
    800054bc:	00813483          	ld	s1,8(sp)
    800054c0:	02010113          	addi	sp,sp,32
    800054c4:	00008067          	ret

00000000800054c8 <initlock>:
    800054c8:	ff010113          	addi	sp,sp,-16
    800054cc:	00813423          	sd	s0,8(sp)
    800054d0:	01010413          	addi	s0,sp,16
    800054d4:	00813403          	ld	s0,8(sp)
    800054d8:	00b53423          	sd	a1,8(a0)
    800054dc:	00052023          	sw	zero,0(a0)
    800054e0:	00053823          	sd	zero,16(a0)
    800054e4:	01010113          	addi	sp,sp,16
    800054e8:	00008067          	ret

00000000800054ec <acquire>:
    800054ec:	fe010113          	addi	sp,sp,-32
    800054f0:	00813823          	sd	s0,16(sp)
    800054f4:	00913423          	sd	s1,8(sp)
    800054f8:	00113c23          	sd	ra,24(sp)
    800054fc:	01213023          	sd	s2,0(sp)
    80005500:	02010413          	addi	s0,sp,32
    80005504:	00050493          	mv	s1,a0
    80005508:	10002973          	csrr	s2,sstatus
    8000550c:	100027f3          	csrr	a5,sstatus
    80005510:	ffd7f793          	andi	a5,a5,-3
    80005514:	10079073          	csrw	sstatus,a5
    80005518:	fffff097          	auipc	ra,0xfffff
    8000551c:	8ec080e7          	jalr	-1812(ra) # 80003e04 <mycpu>
    80005520:	07852783          	lw	a5,120(a0)
    80005524:	06078e63          	beqz	a5,800055a0 <acquire+0xb4>
    80005528:	fffff097          	auipc	ra,0xfffff
    8000552c:	8dc080e7          	jalr	-1828(ra) # 80003e04 <mycpu>
    80005530:	07852783          	lw	a5,120(a0)
    80005534:	0004a703          	lw	a4,0(s1)
    80005538:	0017879b          	addiw	a5,a5,1
    8000553c:	06f52c23          	sw	a5,120(a0)
    80005540:	04071063          	bnez	a4,80005580 <acquire+0x94>
    80005544:	00100713          	li	a4,1
    80005548:	00070793          	mv	a5,a4
    8000554c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005550:	0007879b          	sext.w	a5,a5
    80005554:	fe079ae3          	bnez	a5,80005548 <acquire+0x5c>
    80005558:	0ff0000f          	fence
    8000555c:	fffff097          	auipc	ra,0xfffff
    80005560:	8a8080e7          	jalr	-1880(ra) # 80003e04 <mycpu>
    80005564:	01813083          	ld	ra,24(sp)
    80005568:	01013403          	ld	s0,16(sp)
    8000556c:	00a4b823          	sd	a0,16(s1)
    80005570:	00013903          	ld	s2,0(sp)
    80005574:	00813483          	ld	s1,8(sp)
    80005578:	02010113          	addi	sp,sp,32
    8000557c:	00008067          	ret
    80005580:	0104b903          	ld	s2,16(s1)
    80005584:	fffff097          	auipc	ra,0xfffff
    80005588:	880080e7          	jalr	-1920(ra) # 80003e04 <mycpu>
    8000558c:	faa91ce3          	bne	s2,a0,80005544 <acquire+0x58>
    80005590:	00001517          	auipc	a0,0x1
    80005594:	d5850513          	addi	a0,a0,-680 # 800062e8 <digits+0x20>
    80005598:	fffff097          	auipc	ra,0xfffff
    8000559c:	224080e7          	jalr	548(ra) # 800047bc <panic>
    800055a0:	00195913          	srli	s2,s2,0x1
    800055a4:	fffff097          	auipc	ra,0xfffff
    800055a8:	860080e7          	jalr	-1952(ra) # 80003e04 <mycpu>
    800055ac:	00197913          	andi	s2,s2,1
    800055b0:	07252e23          	sw	s2,124(a0)
    800055b4:	f75ff06f          	j	80005528 <acquire+0x3c>

00000000800055b8 <release>:
    800055b8:	fe010113          	addi	sp,sp,-32
    800055bc:	00813823          	sd	s0,16(sp)
    800055c0:	00113c23          	sd	ra,24(sp)
    800055c4:	00913423          	sd	s1,8(sp)
    800055c8:	01213023          	sd	s2,0(sp)
    800055cc:	02010413          	addi	s0,sp,32
    800055d0:	00052783          	lw	a5,0(a0)
    800055d4:	00079a63          	bnez	a5,800055e8 <release+0x30>
    800055d8:	00001517          	auipc	a0,0x1
    800055dc:	d1850513          	addi	a0,a0,-744 # 800062f0 <digits+0x28>
    800055e0:	fffff097          	auipc	ra,0xfffff
    800055e4:	1dc080e7          	jalr	476(ra) # 800047bc <panic>
    800055e8:	01053903          	ld	s2,16(a0)
    800055ec:	00050493          	mv	s1,a0
    800055f0:	fffff097          	auipc	ra,0xfffff
    800055f4:	814080e7          	jalr	-2028(ra) # 80003e04 <mycpu>
    800055f8:	fea910e3          	bne	s2,a0,800055d8 <release+0x20>
    800055fc:	0004b823          	sd	zero,16(s1)
    80005600:	0ff0000f          	fence
    80005604:	0f50000f          	fence	iorw,ow
    80005608:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000560c:	ffffe097          	auipc	ra,0xffffe
    80005610:	7f8080e7          	jalr	2040(ra) # 80003e04 <mycpu>
    80005614:	100027f3          	csrr	a5,sstatus
    80005618:	0027f793          	andi	a5,a5,2
    8000561c:	04079a63          	bnez	a5,80005670 <release+0xb8>
    80005620:	07852783          	lw	a5,120(a0)
    80005624:	02f05e63          	blez	a5,80005660 <release+0xa8>
    80005628:	fff7871b          	addiw	a4,a5,-1
    8000562c:	06e52c23          	sw	a4,120(a0)
    80005630:	00071c63          	bnez	a4,80005648 <release+0x90>
    80005634:	07c52783          	lw	a5,124(a0)
    80005638:	00078863          	beqz	a5,80005648 <release+0x90>
    8000563c:	100027f3          	csrr	a5,sstatus
    80005640:	0027e793          	ori	a5,a5,2
    80005644:	10079073          	csrw	sstatus,a5
    80005648:	01813083          	ld	ra,24(sp)
    8000564c:	01013403          	ld	s0,16(sp)
    80005650:	00813483          	ld	s1,8(sp)
    80005654:	00013903          	ld	s2,0(sp)
    80005658:	02010113          	addi	sp,sp,32
    8000565c:	00008067          	ret
    80005660:	00001517          	auipc	a0,0x1
    80005664:	cb050513          	addi	a0,a0,-848 # 80006310 <digits+0x48>
    80005668:	fffff097          	auipc	ra,0xfffff
    8000566c:	154080e7          	jalr	340(ra) # 800047bc <panic>
    80005670:	00001517          	auipc	a0,0x1
    80005674:	c8850513          	addi	a0,a0,-888 # 800062f8 <digits+0x30>
    80005678:	fffff097          	auipc	ra,0xfffff
    8000567c:	144080e7          	jalr	324(ra) # 800047bc <panic>

0000000080005680 <holding>:
    80005680:	00052783          	lw	a5,0(a0)
    80005684:	00079663          	bnez	a5,80005690 <holding+0x10>
    80005688:	00000513          	li	a0,0
    8000568c:	00008067          	ret
    80005690:	fe010113          	addi	sp,sp,-32
    80005694:	00813823          	sd	s0,16(sp)
    80005698:	00913423          	sd	s1,8(sp)
    8000569c:	00113c23          	sd	ra,24(sp)
    800056a0:	02010413          	addi	s0,sp,32
    800056a4:	01053483          	ld	s1,16(a0)
    800056a8:	ffffe097          	auipc	ra,0xffffe
    800056ac:	75c080e7          	jalr	1884(ra) # 80003e04 <mycpu>
    800056b0:	01813083          	ld	ra,24(sp)
    800056b4:	01013403          	ld	s0,16(sp)
    800056b8:	40a48533          	sub	a0,s1,a0
    800056bc:	00153513          	seqz	a0,a0
    800056c0:	00813483          	ld	s1,8(sp)
    800056c4:	02010113          	addi	sp,sp,32
    800056c8:	00008067          	ret

00000000800056cc <push_off>:
    800056cc:	fe010113          	addi	sp,sp,-32
    800056d0:	00813823          	sd	s0,16(sp)
    800056d4:	00113c23          	sd	ra,24(sp)
    800056d8:	00913423          	sd	s1,8(sp)
    800056dc:	02010413          	addi	s0,sp,32
    800056e0:	100024f3          	csrr	s1,sstatus
    800056e4:	100027f3          	csrr	a5,sstatus
    800056e8:	ffd7f793          	andi	a5,a5,-3
    800056ec:	10079073          	csrw	sstatus,a5
    800056f0:	ffffe097          	auipc	ra,0xffffe
    800056f4:	714080e7          	jalr	1812(ra) # 80003e04 <mycpu>
    800056f8:	07852783          	lw	a5,120(a0)
    800056fc:	02078663          	beqz	a5,80005728 <push_off+0x5c>
    80005700:	ffffe097          	auipc	ra,0xffffe
    80005704:	704080e7          	jalr	1796(ra) # 80003e04 <mycpu>
    80005708:	07852783          	lw	a5,120(a0)
    8000570c:	01813083          	ld	ra,24(sp)
    80005710:	01013403          	ld	s0,16(sp)
    80005714:	0017879b          	addiw	a5,a5,1
    80005718:	06f52c23          	sw	a5,120(a0)
    8000571c:	00813483          	ld	s1,8(sp)
    80005720:	02010113          	addi	sp,sp,32
    80005724:	00008067          	ret
    80005728:	0014d493          	srli	s1,s1,0x1
    8000572c:	ffffe097          	auipc	ra,0xffffe
    80005730:	6d8080e7          	jalr	1752(ra) # 80003e04 <mycpu>
    80005734:	0014f493          	andi	s1,s1,1
    80005738:	06952e23          	sw	s1,124(a0)
    8000573c:	fc5ff06f          	j	80005700 <push_off+0x34>

0000000080005740 <pop_off>:
    80005740:	ff010113          	addi	sp,sp,-16
    80005744:	00813023          	sd	s0,0(sp)
    80005748:	00113423          	sd	ra,8(sp)
    8000574c:	01010413          	addi	s0,sp,16
    80005750:	ffffe097          	auipc	ra,0xffffe
    80005754:	6b4080e7          	jalr	1716(ra) # 80003e04 <mycpu>
    80005758:	100027f3          	csrr	a5,sstatus
    8000575c:	0027f793          	andi	a5,a5,2
    80005760:	04079663          	bnez	a5,800057ac <pop_off+0x6c>
    80005764:	07852783          	lw	a5,120(a0)
    80005768:	02f05a63          	blez	a5,8000579c <pop_off+0x5c>
    8000576c:	fff7871b          	addiw	a4,a5,-1
    80005770:	06e52c23          	sw	a4,120(a0)
    80005774:	00071c63          	bnez	a4,8000578c <pop_off+0x4c>
    80005778:	07c52783          	lw	a5,124(a0)
    8000577c:	00078863          	beqz	a5,8000578c <pop_off+0x4c>
    80005780:	100027f3          	csrr	a5,sstatus
    80005784:	0027e793          	ori	a5,a5,2
    80005788:	10079073          	csrw	sstatus,a5
    8000578c:	00813083          	ld	ra,8(sp)
    80005790:	00013403          	ld	s0,0(sp)
    80005794:	01010113          	addi	sp,sp,16
    80005798:	00008067          	ret
    8000579c:	00001517          	auipc	a0,0x1
    800057a0:	b7450513          	addi	a0,a0,-1164 # 80006310 <digits+0x48>
    800057a4:	fffff097          	auipc	ra,0xfffff
    800057a8:	018080e7          	jalr	24(ra) # 800047bc <panic>
    800057ac:	00001517          	auipc	a0,0x1
    800057b0:	b4c50513          	addi	a0,a0,-1204 # 800062f8 <digits+0x30>
    800057b4:	fffff097          	auipc	ra,0xfffff
    800057b8:	008080e7          	jalr	8(ra) # 800047bc <panic>

00000000800057bc <push_on>:
    800057bc:	fe010113          	addi	sp,sp,-32
    800057c0:	00813823          	sd	s0,16(sp)
    800057c4:	00113c23          	sd	ra,24(sp)
    800057c8:	00913423          	sd	s1,8(sp)
    800057cc:	02010413          	addi	s0,sp,32
    800057d0:	100024f3          	csrr	s1,sstatus
    800057d4:	100027f3          	csrr	a5,sstatus
    800057d8:	0027e793          	ori	a5,a5,2
    800057dc:	10079073          	csrw	sstatus,a5
    800057e0:	ffffe097          	auipc	ra,0xffffe
    800057e4:	624080e7          	jalr	1572(ra) # 80003e04 <mycpu>
    800057e8:	07852783          	lw	a5,120(a0)
    800057ec:	02078663          	beqz	a5,80005818 <push_on+0x5c>
    800057f0:	ffffe097          	auipc	ra,0xffffe
    800057f4:	614080e7          	jalr	1556(ra) # 80003e04 <mycpu>
    800057f8:	07852783          	lw	a5,120(a0)
    800057fc:	01813083          	ld	ra,24(sp)
    80005800:	01013403          	ld	s0,16(sp)
    80005804:	0017879b          	addiw	a5,a5,1
    80005808:	06f52c23          	sw	a5,120(a0)
    8000580c:	00813483          	ld	s1,8(sp)
    80005810:	02010113          	addi	sp,sp,32
    80005814:	00008067          	ret
    80005818:	0014d493          	srli	s1,s1,0x1
    8000581c:	ffffe097          	auipc	ra,0xffffe
    80005820:	5e8080e7          	jalr	1512(ra) # 80003e04 <mycpu>
    80005824:	0014f493          	andi	s1,s1,1
    80005828:	06952e23          	sw	s1,124(a0)
    8000582c:	fc5ff06f          	j	800057f0 <push_on+0x34>

0000000080005830 <pop_on>:
    80005830:	ff010113          	addi	sp,sp,-16
    80005834:	00813023          	sd	s0,0(sp)
    80005838:	00113423          	sd	ra,8(sp)
    8000583c:	01010413          	addi	s0,sp,16
    80005840:	ffffe097          	auipc	ra,0xffffe
    80005844:	5c4080e7          	jalr	1476(ra) # 80003e04 <mycpu>
    80005848:	100027f3          	csrr	a5,sstatus
    8000584c:	0027f793          	andi	a5,a5,2
    80005850:	04078463          	beqz	a5,80005898 <pop_on+0x68>
    80005854:	07852783          	lw	a5,120(a0)
    80005858:	02f05863          	blez	a5,80005888 <pop_on+0x58>
    8000585c:	fff7879b          	addiw	a5,a5,-1
    80005860:	06f52c23          	sw	a5,120(a0)
    80005864:	07853783          	ld	a5,120(a0)
    80005868:	00079863          	bnez	a5,80005878 <pop_on+0x48>
    8000586c:	100027f3          	csrr	a5,sstatus
    80005870:	ffd7f793          	andi	a5,a5,-3
    80005874:	10079073          	csrw	sstatus,a5
    80005878:	00813083          	ld	ra,8(sp)
    8000587c:	00013403          	ld	s0,0(sp)
    80005880:	01010113          	addi	sp,sp,16
    80005884:	00008067          	ret
    80005888:	00001517          	auipc	a0,0x1
    8000588c:	ab050513          	addi	a0,a0,-1360 # 80006338 <digits+0x70>
    80005890:	fffff097          	auipc	ra,0xfffff
    80005894:	f2c080e7          	jalr	-212(ra) # 800047bc <panic>
    80005898:	00001517          	auipc	a0,0x1
    8000589c:	a8050513          	addi	a0,a0,-1408 # 80006318 <digits+0x50>
    800058a0:	fffff097          	auipc	ra,0xfffff
    800058a4:	f1c080e7          	jalr	-228(ra) # 800047bc <panic>

00000000800058a8 <__memset>:
    800058a8:	ff010113          	addi	sp,sp,-16
    800058ac:	00813423          	sd	s0,8(sp)
    800058b0:	01010413          	addi	s0,sp,16
    800058b4:	1a060e63          	beqz	a2,80005a70 <__memset+0x1c8>
    800058b8:	40a007b3          	neg	a5,a0
    800058bc:	0077f793          	andi	a5,a5,7
    800058c0:	00778693          	addi	a3,a5,7
    800058c4:	00b00813          	li	a6,11
    800058c8:	0ff5f593          	andi	a1,a1,255
    800058cc:	fff6071b          	addiw	a4,a2,-1
    800058d0:	1b06e663          	bltu	a3,a6,80005a7c <__memset+0x1d4>
    800058d4:	1cd76463          	bltu	a4,a3,80005a9c <__memset+0x1f4>
    800058d8:	1a078e63          	beqz	a5,80005a94 <__memset+0x1ec>
    800058dc:	00b50023          	sb	a1,0(a0)
    800058e0:	00100713          	li	a4,1
    800058e4:	1ae78463          	beq	a5,a4,80005a8c <__memset+0x1e4>
    800058e8:	00b500a3          	sb	a1,1(a0)
    800058ec:	00200713          	li	a4,2
    800058f0:	1ae78a63          	beq	a5,a4,80005aa4 <__memset+0x1fc>
    800058f4:	00b50123          	sb	a1,2(a0)
    800058f8:	00300713          	li	a4,3
    800058fc:	18e78463          	beq	a5,a4,80005a84 <__memset+0x1dc>
    80005900:	00b501a3          	sb	a1,3(a0)
    80005904:	00400713          	li	a4,4
    80005908:	1ae78263          	beq	a5,a4,80005aac <__memset+0x204>
    8000590c:	00b50223          	sb	a1,4(a0)
    80005910:	00500713          	li	a4,5
    80005914:	1ae78063          	beq	a5,a4,80005ab4 <__memset+0x20c>
    80005918:	00b502a3          	sb	a1,5(a0)
    8000591c:	00700713          	li	a4,7
    80005920:	18e79e63          	bne	a5,a4,80005abc <__memset+0x214>
    80005924:	00b50323          	sb	a1,6(a0)
    80005928:	00700e93          	li	t4,7
    8000592c:	00859713          	slli	a4,a1,0x8
    80005930:	00e5e733          	or	a4,a1,a4
    80005934:	01059e13          	slli	t3,a1,0x10
    80005938:	01c76e33          	or	t3,a4,t3
    8000593c:	01859313          	slli	t1,a1,0x18
    80005940:	006e6333          	or	t1,t3,t1
    80005944:	02059893          	slli	a7,a1,0x20
    80005948:	40f60e3b          	subw	t3,a2,a5
    8000594c:	011368b3          	or	a7,t1,a7
    80005950:	02859813          	slli	a6,a1,0x28
    80005954:	0108e833          	or	a6,a7,a6
    80005958:	03059693          	slli	a3,a1,0x30
    8000595c:	003e589b          	srliw	a7,t3,0x3
    80005960:	00d866b3          	or	a3,a6,a3
    80005964:	03859713          	slli	a4,a1,0x38
    80005968:	00389813          	slli	a6,a7,0x3
    8000596c:	00f507b3          	add	a5,a0,a5
    80005970:	00e6e733          	or	a4,a3,a4
    80005974:	000e089b          	sext.w	a7,t3
    80005978:	00f806b3          	add	a3,a6,a5
    8000597c:	00e7b023          	sd	a4,0(a5)
    80005980:	00878793          	addi	a5,a5,8
    80005984:	fed79ce3          	bne	a5,a3,8000597c <__memset+0xd4>
    80005988:	ff8e7793          	andi	a5,t3,-8
    8000598c:	0007871b          	sext.w	a4,a5
    80005990:	01d787bb          	addw	a5,a5,t4
    80005994:	0ce88e63          	beq	a7,a4,80005a70 <__memset+0x1c8>
    80005998:	00f50733          	add	a4,a0,a5
    8000599c:	00b70023          	sb	a1,0(a4)
    800059a0:	0017871b          	addiw	a4,a5,1
    800059a4:	0cc77663          	bgeu	a4,a2,80005a70 <__memset+0x1c8>
    800059a8:	00e50733          	add	a4,a0,a4
    800059ac:	00b70023          	sb	a1,0(a4)
    800059b0:	0027871b          	addiw	a4,a5,2
    800059b4:	0ac77e63          	bgeu	a4,a2,80005a70 <__memset+0x1c8>
    800059b8:	00e50733          	add	a4,a0,a4
    800059bc:	00b70023          	sb	a1,0(a4)
    800059c0:	0037871b          	addiw	a4,a5,3
    800059c4:	0ac77663          	bgeu	a4,a2,80005a70 <__memset+0x1c8>
    800059c8:	00e50733          	add	a4,a0,a4
    800059cc:	00b70023          	sb	a1,0(a4)
    800059d0:	0047871b          	addiw	a4,a5,4
    800059d4:	08c77e63          	bgeu	a4,a2,80005a70 <__memset+0x1c8>
    800059d8:	00e50733          	add	a4,a0,a4
    800059dc:	00b70023          	sb	a1,0(a4)
    800059e0:	0057871b          	addiw	a4,a5,5
    800059e4:	08c77663          	bgeu	a4,a2,80005a70 <__memset+0x1c8>
    800059e8:	00e50733          	add	a4,a0,a4
    800059ec:	00b70023          	sb	a1,0(a4)
    800059f0:	0067871b          	addiw	a4,a5,6
    800059f4:	06c77e63          	bgeu	a4,a2,80005a70 <__memset+0x1c8>
    800059f8:	00e50733          	add	a4,a0,a4
    800059fc:	00b70023          	sb	a1,0(a4)
    80005a00:	0077871b          	addiw	a4,a5,7
    80005a04:	06c77663          	bgeu	a4,a2,80005a70 <__memset+0x1c8>
    80005a08:	00e50733          	add	a4,a0,a4
    80005a0c:	00b70023          	sb	a1,0(a4)
    80005a10:	0087871b          	addiw	a4,a5,8
    80005a14:	04c77e63          	bgeu	a4,a2,80005a70 <__memset+0x1c8>
    80005a18:	00e50733          	add	a4,a0,a4
    80005a1c:	00b70023          	sb	a1,0(a4)
    80005a20:	0097871b          	addiw	a4,a5,9
    80005a24:	04c77663          	bgeu	a4,a2,80005a70 <__memset+0x1c8>
    80005a28:	00e50733          	add	a4,a0,a4
    80005a2c:	00b70023          	sb	a1,0(a4)
    80005a30:	00a7871b          	addiw	a4,a5,10
    80005a34:	02c77e63          	bgeu	a4,a2,80005a70 <__memset+0x1c8>
    80005a38:	00e50733          	add	a4,a0,a4
    80005a3c:	00b70023          	sb	a1,0(a4)
    80005a40:	00b7871b          	addiw	a4,a5,11
    80005a44:	02c77663          	bgeu	a4,a2,80005a70 <__memset+0x1c8>
    80005a48:	00e50733          	add	a4,a0,a4
    80005a4c:	00b70023          	sb	a1,0(a4)
    80005a50:	00c7871b          	addiw	a4,a5,12
    80005a54:	00c77e63          	bgeu	a4,a2,80005a70 <__memset+0x1c8>
    80005a58:	00e50733          	add	a4,a0,a4
    80005a5c:	00b70023          	sb	a1,0(a4)
    80005a60:	00d7879b          	addiw	a5,a5,13
    80005a64:	00c7f663          	bgeu	a5,a2,80005a70 <__memset+0x1c8>
    80005a68:	00f507b3          	add	a5,a0,a5
    80005a6c:	00b78023          	sb	a1,0(a5)
    80005a70:	00813403          	ld	s0,8(sp)
    80005a74:	01010113          	addi	sp,sp,16
    80005a78:	00008067          	ret
    80005a7c:	00b00693          	li	a3,11
    80005a80:	e55ff06f          	j	800058d4 <__memset+0x2c>
    80005a84:	00300e93          	li	t4,3
    80005a88:	ea5ff06f          	j	8000592c <__memset+0x84>
    80005a8c:	00100e93          	li	t4,1
    80005a90:	e9dff06f          	j	8000592c <__memset+0x84>
    80005a94:	00000e93          	li	t4,0
    80005a98:	e95ff06f          	j	8000592c <__memset+0x84>
    80005a9c:	00000793          	li	a5,0
    80005aa0:	ef9ff06f          	j	80005998 <__memset+0xf0>
    80005aa4:	00200e93          	li	t4,2
    80005aa8:	e85ff06f          	j	8000592c <__memset+0x84>
    80005aac:	00400e93          	li	t4,4
    80005ab0:	e7dff06f          	j	8000592c <__memset+0x84>
    80005ab4:	00500e93          	li	t4,5
    80005ab8:	e75ff06f          	j	8000592c <__memset+0x84>
    80005abc:	00600e93          	li	t4,6
    80005ac0:	e6dff06f          	j	8000592c <__memset+0x84>

0000000080005ac4 <__memmove>:
    80005ac4:	ff010113          	addi	sp,sp,-16
    80005ac8:	00813423          	sd	s0,8(sp)
    80005acc:	01010413          	addi	s0,sp,16
    80005ad0:	0e060863          	beqz	a2,80005bc0 <__memmove+0xfc>
    80005ad4:	fff6069b          	addiw	a3,a2,-1
    80005ad8:	0006881b          	sext.w	a6,a3
    80005adc:	0ea5e863          	bltu	a1,a0,80005bcc <__memmove+0x108>
    80005ae0:	00758713          	addi	a4,a1,7
    80005ae4:	00a5e7b3          	or	a5,a1,a0
    80005ae8:	40a70733          	sub	a4,a4,a0
    80005aec:	0077f793          	andi	a5,a5,7
    80005af0:	00f73713          	sltiu	a4,a4,15
    80005af4:	00174713          	xori	a4,a4,1
    80005af8:	0017b793          	seqz	a5,a5
    80005afc:	00e7f7b3          	and	a5,a5,a4
    80005b00:	10078863          	beqz	a5,80005c10 <__memmove+0x14c>
    80005b04:	00900793          	li	a5,9
    80005b08:	1107f463          	bgeu	a5,a6,80005c10 <__memmove+0x14c>
    80005b0c:	0036581b          	srliw	a6,a2,0x3
    80005b10:	fff8081b          	addiw	a6,a6,-1
    80005b14:	02081813          	slli	a6,a6,0x20
    80005b18:	01d85893          	srli	a7,a6,0x1d
    80005b1c:	00858813          	addi	a6,a1,8
    80005b20:	00058793          	mv	a5,a1
    80005b24:	00050713          	mv	a4,a0
    80005b28:	01088833          	add	a6,a7,a6
    80005b2c:	0007b883          	ld	a7,0(a5)
    80005b30:	00878793          	addi	a5,a5,8
    80005b34:	00870713          	addi	a4,a4,8
    80005b38:	ff173c23          	sd	a7,-8(a4)
    80005b3c:	ff0798e3          	bne	a5,a6,80005b2c <__memmove+0x68>
    80005b40:	ff867713          	andi	a4,a2,-8
    80005b44:	02071793          	slli	a5,a4,0x20
    80005b48:	0207d793          	srli	a5,a5,0x20
    80005b4c:	00f585b3          	add	a1,a1,a5
    80005b50:	40e686bb          	subw	a3,a3,a4
    80005b54:	00f507b3          	add	a5,a0,a5
    80005b58:	06e60463          	beq	a2,a4,80005bc0 <__memmove+0xfc>
    80005b5c:	0005c703          	lbu	a4,0(a1)
    80005b60:	00e78023          	sb	a4,0(a5)
    80005b64:	04068e63          	beqz	a3,80005bc0 <__memmove+0xfc>
    80005b68:	0015c603          	lbu	a2,1(a1)
    80005b6c:	00100713          	li	a4,1
    80005b70:	00c780a3          	sb	a2,1(a5)
    80005b74:	04e68663          	beq	a3,a4,80005bc0 <__memmove+0xfc>
    80005b78:	0025c603          	lbu	a2,2(a1)
    80005b7c:	00200713          	li	a4,2
    80005b80:	00c78123          	sb	a2,2(a5)
    80005b84:	02e68e63          	beq	a3,a4,80005bc0 <__memmove+0xfc>
    80005b88:	0035c603          	lbu	a2,3(a1)
    80005b8c:	00300713          	li	a4,3
    80005b90:	00c781a3          	sb	a2,3(a5)
    80005b94:	02e68663          	beq	a3,a4,80005bc0 <__memmove+0xfc>
    80005b98:	0045c603          	lbu	a2,4(a1)
    80005b9c:	00400713          	li	a4,4
    80005ba0:	00c78223          	sb	a2,4(a5)
    80005ba4:	00e68e63          	beq	a3,a4,80005bc0 <__memmove+0xfc>
    80005ba8:	0055c603          	lbu	a2,5(a1)
    80005bac:	00500713          	li	a4,5
    80005bb0:	00c782a3          	sb	a2,5(a5)
    80005bb4:	00e68663          	beq	a3,a4,80005bc0 <__memmove+0xfc>
    80005bb8:	0065c703          	lbu	a4,6(a1)
    80005bbc:	00e78323          	sb	a4,6(a5)
    80005bc0:	00813403          	ld	s0,8(sp)
    80005bc4:	01010113          	addi	sp,sp,16
    80005bc8:	00008067          	ret
    80005bcc:	02061713          	slli	a4,a2,0x20
    80005bd0:	02075713          	srli	a4,a4,0x20
    80005bd4:	00e587b3          	add	a5,a1,a4
    80005bd8:	f0f574e3          	bgeu	a0,a5,80005ae0 <__memmove+0x1c>
    80005bdc:	02069613          	slli	a2,a3,0x20
    80005be0:	02065613          	srli	a2,a2,0x20
    80005be4:	fff64613          	not	a2,a2
    80005be8:	00e50733          	add	a4,a0,a4
    80005bec:	00c78633          	add	a2,a5,a2
    80005bf0:	fff7c683          	lbu	a3,-1(a5)
    80005bf4:	fff78793          	addi	a5,a5,-1
    80005bf8:	fff70713          	addi	a4,a4,-1
    80005bfc:	00d70023          	sb	a3,0(a4)
    80005c00:	fec798e3          	bne	a5,a2,80005bf0 <__memmove+0x12c>
    80005c04:	00813403          	ld	s0,8(sp)
    80005c08:	01010113          	addi	sp,sp,16
    80005c0c:	00008067          	ret
    80005c10:	02069713          	slli	a4,a3,0x20
    80005c14:	02075713          	srli	a4,a4,0x20
    80005c18:	00170713          	addi	a4,a4,1
    80005c1c:	00e50733          	add	a4,a0,a4
    80005c20:	00050793          	mv	a5,a0
    80005c24:	0005c683          	lbu	a3,0(a1)
    80005c28:	00178793          	addi	a5,a5,1
    80005c2c:	00158593          	addi	a1,a1,1
    80005c30:	fed78fa3          	sb	a3,-1(a5)
    80005c34:	fee798e3          	bne	a5,a4,80005c24 <__memmove+0x160>
    80005c38:	f89ff06f          	j	80005bc0 <__memmove+0xfc>

0000000080005c3c <__putc>:
    80005c3c:	fe010113          	addi	sp,sp,-32
    80005c40:	00813823          	sd	s0,16(sp)
    80005c44:	00113c23          	sd	ra,24(sp)
    80005c48:	02010413          	addi	s0,sp,32
    80005c4c:	00050793          	mv	a5,a0
    80005c50:	fef40593          	addi	a1,s0,-17
    80005c54:	00100613          	li	a2,1
    80005c58:	00000513          	li	a0,0
    80005c5c:	fef407a3          	sb	a5,-17(s0)
    80005c60:	fffff097          	auipc	ra,0xfffff
    80005c64:	b3c080e7          	jalr	-1220(ra) # 8000479c <console_write>
    80005c68:	01813083          	ld	ra,24(sp)
    80005c6c:	01013403          	ld	s0,16(sp)
    80005c70:	02010113          	addi	sp,sp,32
    80005c74:	00008067          	ret

0000000080005c78 <__getc>:
    80005c78:	fe010113          	addi	sp,sp,-32
    80005c7c:	00813823          	sd	s0,16(sp)
    80005c80:	00113c23          	sd	ra,24(sp)
    80005c84:	02010413          	addi	s0,sp,32
    80005c88:	fe840593          	addi	a1,s0,-24
    80005c8c:	00100613          	li	a2,1
    80005c90:	00000513          	li	a0,0
    80005c94:	fffff097          	auipc	ra,0xfffff
    80005c98:	ae8080e7          	jalr	-1304(ra) # 8000477c <console_read>
    80005c9c:	fe844503          	lbu	a0,-24(s0)
    80005ca0:	01813083          	ld	ra,24(sp)
    80005ca4:	01013403          	ld	s0,16(sp)
    80005ca8:	02010113          	addi	sp,sp,32
    80005cac:	00008067          	ret

0000000080005cb0 <console_handler>:
    80005cb0:	fe010113          	addi	sp,sp,-32
    80005cb4:	00813823          	sd	s0,16(sp)
    80005cb8:	00113c23          	sd	ra,24(sp)
    80005cbc:	00913423          	sd	s1,8(sp)
    80005cc0:	02010413          	addi	s0,sp,32
    80005cc4:	14202773          	csrr	a4,scause
    80005cc8:	100027f3          	csrr	a5,sstatus
    80005ccc:	0027f793          	andi	a5,a5,2
    80005cd0:	06079e63          	bnez	a5,80005d4c <console_handler+0x9c>
    80005cd4:	00074c63          	bltz	a4,80005cec <console_handler+0x3c>
    80005cd8:	01813083          	ld	ra,24(sp)
    80005cdc:	01013403          	ld	s0,16(sp)
    80005ce0:	00813483          	ld	s1,8(sp)
    80005ce4:	02010113          	addi	sp,sp,32
    80005ce8:	00008067          	ret
    80005cec:	0ff77713          	andi	a4,a4,255
    80005cf0:	00900793          	li	a5,9
    80005cf4:	fef712e3          	bne	a4,a5,80005cd8 <console_handler+0x28>
    80005cf8:	ffffe097          	auipc	ra,0xffffe
    80005cfc:	6dc080e7          	jalr	1756(ra) # 800043d4 <plic_claim>
    80005d00:	00a00793          	li	a5,10
    80005d04:	00050493          	mv	s1,a0
    80005d08:	02f50c63          	beq	a0,a5,80005d40 <console_handler+0x90>
    80005d0c:	fc0506e3          	beqz	a0,80005cd8 <console_handler+0x28>
    80005d10:	00050593          	mv	a1,a0
    80005d14:	00000517          	auipc	a0,0x0
    80005d18:	52c50513          	addi	a0,a0,1324 # 80006240 <CONSOLE_STATUS+0x230>
    80005d1c:	fffff097          	auipc	ra,0xfffff
    80005d20:	afc080e7          	jalr	-1284(ra) # 80004818 <__printf>
    80005d24:	01013403          	ld	s0,16(sp)
    80005d28:	01813083          	ld	ra,24(sp)
    80005d2c:	00048513          	mv	a0,s1
    80005d30:	00813483          	ld	s1,8(sp)
    80005d34:	02010113          	addi	sp,sp,32
    80005d38:	ffffe317          	auipc	t1,0xffffe
    80005d3c:	6d430067          	jr	1748(t1) # 8000440c <plic_complete>
    80005d40:	fffff097          	auipc	ra,0xfffff
    80005d44:	3e0080e7          	jalr	992(ra) # 80005120 <uartintr>
    80005d48:	fddff06f          	j	80005d24 <console_handler+0x74>
    80005d4c:	00000517          	auipc	a0,0x0
    80005d50:	5f450513          	addi	a0,a0,1524 # 80006340 <digits+0x78>
    80005d54:	fffff097          	auipc	ra,0xfffff
    80005d58:	a68080e7          	jalr	-1432(ra) # 800047bc <panic>
	...
