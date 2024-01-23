
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00008117          	auipc	sp,0x8
    80000004:	03813103          	ld	sp,56(sp) # 80008038 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	621030ef          	jal	ra,80003e3c <start>

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
    8000107c:	42c020ef          	jal	ra,800034a8 <exceptionHandler>


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
    8000111c:	f887b783          	ld	a5,-120(a5) # 800080a0 <_ZN5Timer8instanceE>
    80001120:	02079463          	bnez	a5,80001148 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80001124:	00007797          	auipc	a5,0x7
    80001128:	f697be23          	sd	s1,-132(a5) # 800080a0 <_ZN5Timer8instanceE>
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
    80001164:	00000097          	auipc	ra,0x0
    80001168:	77c080e7          	jalr	1916(ra) # 800018e0 <_Z13assert_failedPKcS0_jS0_>
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
    80001194:	2b8080e7          	jalr	696(ra) # 80001448 <_Z8mem_freePv>
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
    800011bc:	ee87b783          	ld	a5,-280(a5) # 800080a0 <_ZN5Timer8instanceE>
    800011c0:	00078863          	beqz	a5,800011d0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800011c4:	00007517          	auipc	a0,0x7
    800011c8:	edc53503          	ld	a0,-292(a0) # 800080a0 <_ZN5Timer8instanceE>
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
    800011fc:	00000097          	auipc	ra,0x0
    80001200:	6e4080e7          	jalr	1764(ra) # 800018e0 <_Z13assert_failedPKcS0_jS0_>
}
    80001204:	00007517          	auipc	a0,0x7
    80001208:	e9c53503          	ld	a0,-356(a0) # 800080a0 <_ZN5Timer8instanceE>
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
    if(time % 10 == 0){
    8000123c:	00853783          	ld	a5,8(a0)
    80001240:	00a00713          	li	a4,10
    80001244:	02e7f7b3          	remu	a5,a5,a4
    80001248:	00078c63          	beqz	a5,80001260 <_ZN5Timer4tickEv+0x44>
        putc('t');
    }
    time += 1;
    8000124c:	00893783          	ld	a5,8(s2)
    80001250:	00178793          	addi	a5,a5,1
    80001254:	00f93423          	sd	a5,8(s2)
    threadSleepWrapper* current = sleepingHead;
    80001258:	00093483          	ld	s1,0(s2)
    8000125c:	0280006f          	j	80001284 <_ZN5Timer4tickEv+0x68>
        putc('t');
    80001260:	07400513          	li	a0,116
    80001264:	00000097          	auipc	ra,0x0
    80001268:	3bc080e7          	jalr	956(ra) # 80001620 <_Z4putcc>
    8000126c:	fe1ff06f          	j	8000124c <_ZN5Timer4tickEv+0x30>
            putc('w');
            current->thread->setSleeping(false);
            Scheduler::put(current->thread);
            threadSleepWrapper* next = current->next;
            if(current == sleepingHead){
                sleepingHead = next;
    80001270:	01393023          	sd	s3,0(s2)
            }
            mem_free(current);
    80001274:	00048513          	mv	a0,s1
    80001278:	00000097          	auipc	ra,0x0
    8000127c:	1d0080e7          	jalr	464(ra) # 80001448 <_Z8mem_freePv>
            current = next;
    80001280:	00098493          	mv	s1,s3
    while(current != 0){
    80001284:	04048463          	beqz	s1,800012cc <_ZN5Timer4tickEv+0xb0>
        if(current->wakeUpTime <= time){
    80001288:	0084b703          	ld	a4,8(s1)
    8000128c:	00893783          	ld	a5,8(s2)
    80001290:	02e7ee63          	bltu	a5,a4,800012cc <_ZN5Timer4tickEv+0xb0>
            putc('w');
    80001294:	07700513          	li	a0,119
    80001298:	00000097          	auipc	ra,0x0
    8000129c:	388080e7          	jalr	904(ra) # 80001620 <_Z4putcc>
            current->thread->setSleeping(false);
    800012a0:	00000593          	li	a1,0
    800012a4:	0004b503          	ld	a0,0(s1)
    800012a8:	00001097          	auipc	ra,0x1
    800012ac:	140080e7          	jalr	320(ra) # 800023e8 <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    800012b0:	0004b503          	ld	a0,0(s1)
    800012b4:	00003097          	auipc	ra,0x3
    800012b8:	810080e7          	jalr	-2032(ra) # 80003ac4 <_ZN9Scheduler3putEP7_thread>
            threadSleepWrapper* next = current->next;
    800012bc:	0104b983          	ld	s3,16(s1)
            if(current == sleepingHead){
    800012c0:	00093783          	ld	a5,0(s2)
    800012c4:	fa9798e3          	bne	a5,s1,80001274 <_ZN5Timer4tickEv+0x58>
    800012c8:	fa9ff06f          	j	80001270 <_ZN5Timer4tickEv+0x54>
        }else{
            break;
        }
    }
}
    800012cc:	02813083          	ld	ra,40(sp)
    800012d0:	02013403          	ld	s0,32(sp)
    800012d4:	01813483          	ld	s1,24(sp)
    800012d8:	01013903          	ld	s2,16(sp)
    800012dc:	00813983          	ld	s3,8(sp)
    800012e0:	03010113          	addi	sp,sp,48
    800012e4:	00008067          	ret

00000000800012e8 <_ZN5Timer5sleepEm>:

int Timer::sleep(time_t timeToSleep){
    800012e8:	fc010113          	addi	sp,sp,-64
    800012ec:	02113c23          	sd	ra,56(sp)
    800012f0:	02813823          	sd	s0,48(sp)
    800012f4:	02913423          	sd	s1,40(sp)
    800012f8:	03213023          	sd	s2,32(sp)
    800012fc:	01313c23          	sd	s3,24(sp)
    80001300:	01413823          	sd	s4,16(sp)
    80001304:	01513423          	sd	s5,8(sp)
    80001308:	04010413          	addi	s0,sp,64
    8000130c:	00050a13          	mv	s4,a0
    80001310:	00058913          	mv	s2,a1
    thread_t thread = _thread::currentThread;
    80001314:	00007797          	auipc	a5,0x7
    80001318:	d3c7b783          	ld	a5,-708(a5) # 80008050 <_GLOBAL_OFFSET_TABLE_+0x38>
    8000131c:	0007ba83          	ld	s5,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)mem_alloc(sizeof(threadSleepWrapper));
    80001320:	01800513          	li	a0,24
    80001324:	00000097          	auipc	ra,0x0
    80001328:	0f4080e7          	jalr	244(ra) # 80001418 <_Z9mem_allocm>
    8000132c:	00050993          	mv	s3,a0
    newSleepingThread->thread = thread;
    80001330:	01553023          	sd	s5,0(a0)
    newSleepingThread->wakeUpTime = time + timeToSleep;
    80001334:	008a3483          	ld	s1,8(s4)
    80001338:	012484b3          	add	s1,s1,s2
    8000133c:	00953423          	sd	s1,8(a0)
    newSleepingThread->next = 0;
    80001340:	00053823          	sd	zero,16(a0)

    time_t w = newSleepingThread->wakeUpTime;
    putc('w');
    80001344:	07700513          	li	a0,119
    80001348:	00000097          	auipc	ra,0x0
    8000134c:	2d8080e7          	jalr	728(ra) # 80001620 <_Z4putcc>
    while(w > 0){
    80001350:	02048063          	beqz	s1,80001370 <_ZN5Timer5sleepEm+0x88>
        putc('0' + w % 10);
    80001354:	00a00913          	li	s2,10
    80001358:	0324f533          	remu	a0,s1,s2
    8000135c:	03050513          	addi	a0,a0,48
    80001360:	00000097          	auipc	ra,0x0
    80001364:	2c0080e7          	jalr	704(ra) # 80001620 <_Z4putcc>
        w /= 10;
    80001368:	0324d4b3          	divu	s1,s1,s2
    while(w > 0){
    8000136c:	fe5ff06f          	j	80001350 <_ZN5Timer5sleepEm+0x68>
    }
    putc('\n');
    80001370:	00a00513          	li	a0,10
    80001374:	00000097          	auipc	ra,0x0
    80001378:	2ac080e7          	jalr	684(ra) # 80001620 <_Z4putcc>

    if(sleepingHead == 0){
    8000137c:	000a3783          	ld	a5,0(s4)
    80001380:	06078863          	beqz	a5,800013f0 <_ZN5Timer5sleepEm+0x108>
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
    80001384:	00078613          	mv	a2,a5
    80001388:	0107b783          	ld	a5,16(a5)
    8000138c:	00078863          	beqz	a5,8000139c <_ZN5Timer5sleepEm+0xb4>
    80001390:	0087b683          	ld	a3,8(a5)
    80001394:	0089b703          	ld	a4,8(s3)
    80001398:	fee6e6e3          	bltu	a3,a4,80001384 <_ZN5Timer5sleepEm+0x9c>
            current = current->next;
        }
        newSleepingThread->next = current->next;
    8000139c:	00f9b823          	sd	a5,16(s3)
        current->next = newSleepingThread;
    800013a0:	01363823          	sd	s3,16(a2)
    }
    thread->setSleeping(true);
    800013a4:	00100593          	li	a1,1
    800013a8:	000a8513          	mv	a0,s5
    800013ac:	00001097          	auipc	ra,0x1
    800013b0:	03c080e7          	jalr	60(ra) # 800023e8 <_ZN7_thread11setSleepingEb>
    putc('s');
    800013b4:	07300513          	li	a0,115
    800013b8:	00000097          	auipc	ra,0x0
    800013bc:	268080e7          	jalr	616(ra) # 80001620 <_Z4putcc>
    thread_dispatch();
    800013c0:	00000097          	auipc	ra,0x0
    800013c4:	10c080e7          	jalr	268(ra) # 800014cc <_Z15thread_dispatchv>
    return 0;
}
    800013c8:	00000513          	li	a0,0
    800013cc:	03813083          	ld	ra,56(sp)
    800013d0:	03013403          	ld	s0,48(sp)
    800013d4:	02813483          	ld	s1,40(sp)
    800013d8:	02013903          	ld	s2,32(sp)
    800013dc:	01813983          	ld	s3,24(sp)
    800013e0:	01013a03          	ld	s4,16(sp)
    800013e4:	00813a83          	ld	s5,8(sp)
    800013e8:	04010113          	addi	sp,sp,64
    800013ec:	00008067          	ret
        sleepingHead = newSleepingThread;
    800013f0:	013a3023          	sd	s3,0(s4)
    800013f4:	fb1ff06f          	j	800013a4 <_ZN5Timer5sleepEm+0xbc>

00000000800013f8 <_ZN5Timer17noSleepingThreadsEv>:

bool Timer::noSleepingThreads(){
    800013f8:	ff010113          	addi	sp,sp,-16
    800013fc:	00813423          	sd	s0,8(sp)
    80001400:	01010413          	addi	s0,sp,16
    return sleepingHead == 0;
    80001404:	00053503          	ld	a0,0(a0)
    80001408:	00153513          	seqz	a0,a0
    8000140c:	00813403          	ld	s0,8(sp)
    80001410:	01010113          	addi	sp,sp,16
    80001414:	00008067          	ret

0000000080001418 <_Z9mem_allocm>:
 * 
 */

#include "syscalls_c.h"

void* mem_alloc ( size_t nSize ){
    80001418:	ff010113          	addi	sp,sp,-16
    8000141c:	00813423          	sd	s0,8(sp)
    80001420:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001424:	03f50513          	addi	a0,a0,63
    80001428:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    8000142c:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    80001430:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    80001434:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    80001438:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    8000143c:	00813403          	ld	s0,8(sp)
    80001440:	01010113          	addi	sp,sp,16
    80001444:	00008067          	ret

0000000080001448 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    80001448:	ff010113          	addi	sp,sp,-16
    8000144c:	00813423          	sd	s0,8(sp)
    80001450:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    80001454:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    80001458:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    8000145c:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    80001460:	00050513          	mv	a0,a0
    return nResult;

}
    80001464:	0005051b          	sext.w	a0,a0
    80001468:	00813403          	ld	s0,8(sp)
    8000146c:	01010113          	addi	sp,sp,16
    80001470:	00008067          	ret

0000000080001474 <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg ) {
    80001474:	ff010113          	addi	sp,sp,-16
    80001478:	00813423          	sd	s0,8(sp)
    8000147c:	01010413          	addi	s0,sp,16
    // void* stack_space = (void*)((uint64)HeapManager::getInstance().heapAllocate(DEFAULT_STACK_SIZE / MEM_BLOCK_SIZE) + DEFAULT_STACK_SIZE - 1);
    // __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space));
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    80001480:	00060693          	mv	a3,a2
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    80001484:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    80001488:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x11");
    8000148c:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    80001490:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001494:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001498:	0005051b          	sext.w	a0,a0
    8000149c:	00813403          	ld	s0,8(sp)
    800014a0:	01010113          	addi	sp,sp,16
    800014a4:	00008067          	ret

00000000800014a8 <_Z11thread_exitv>:

// int thread_createCPP ( thread_t*, void(*)(void*), void* );

int thread_exit (){
    800014a8:	ff010113          	addi	sp,sp,-16
    800014ac:	00813423          	sd	s0,8(sp)
    800014b0:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    800014b4:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    800014b8:	00000073          	ecall
    return 0;
}
    800014bc:	00000513          	li	a0,0
    800014c0:	00813403          	ld	s0,8(sp)
    800014c4:	01010113          	addi	sp,sp,16
    800014c8:	00008067          	ret

00000000800014cc <_Z15thread_dispatchv>:

void thread_dispatch () {
    800014cc:	ff010113          	addi	sp,sp,-16
    800014d0:	00813423          	sd	s0,8(sp)
    800014d4:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    800014d8:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    800014dc:	00000073          	ecall
}
    800014e0:	00813403          	ld	s0,8(sp)
    800014e4:	01010113          	addi	sp,sp,16
    800014e8:	00008067          	ret

00000000800014ec <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    800014ec:	ff010113          	addi	sp,sp,-16
    800014f0:	00813423          	sd	s0,8(sp)
    800014f4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    800014f8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    800014fc:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    80001500:	00000073          	ecall
}
    80001504:	00813403          	ld	s0,8(sp)
    80001508:	01010113          	addi	sp,sp,16
    8000150c:	00008067          	ret

0000000080001510 <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    80001510:	ff010113          	addi	sp,sp,-16
    80001514:	00813423          	sd	s0,8(sp)
    80001518:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    8000151c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    80001520:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001524:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001528:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    8000152c:	0005051b          	sext.w	a0,a0
    80001530:	00813403          	ld	s0,8(sp)
    80001534:	01010113          	addi	sp,sp,16
    80001538:	00008067          	ret

000000008000153c <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    8000153c:	ff010113          	addi	sp,sp,-16
    80001540:	00813423          	sd	s0,8(sp)
    80001544:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    80001548:	02059593          	slli	a1,a1,0x20
    8000154c:	0205d593          	srli	a1,a1,0x20
    80001550:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    80001554:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    80001558:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    8000155c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001560:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001564:	0005051b          	sext.w	a0,a0
    80001568:	00813403          	ld	s0,8(sp)
    8000156c:	01010113          	addi	sp,sp,16
    80001570:	00008067          	ret

0000000080001574 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    80001574:	ff010113          	addi	sp,sp,-16
    80001578:	00813423          	sd	s0,8(sp)
    8000157c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001580:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    80001584:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    80001588:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    8000158c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001590:	0005051b          	sext.w	a0,a0
    80001594:	00813403          	ld	s0,8(sp)
    80001598:	01010113          	addi	sp,sp,16
    8000159c:	00008067          	ret

00000000800015a0 <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    800015a0:	ff010113          	addi	sp,sp,-16
    800015a4:	00813423          	sd	s0,8(sp)
    800015a8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800015ac:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    800015b0:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    800015b4:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800015b8:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800015bc:	0005051b          	sext.w	a0,a0
    800015c0:	00813403          	ld	s0,8(sp)
    800015c4:	01010113          	addi	sp,sp,16
    800015c8:	00008067          	ret

00000000800015cc <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    800015cc:	ff010113          	addi	sp,sp,-16
    800015d0:	00813423          	sd	s0,8(sp)
    800015d4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800015d8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    800015dc:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    800015e0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800015e4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800015e8:	0005051b          	sext.w	a0,a0
    800015ec:	00813403          	ld	s0,8(sp)
    800015f0:	01010113          	addi	sp,sp,16
    800015f4:	00008067          	ret

00000000800015f8 <_Z4getcv>:

char getc() {
    800015f8:	ff010113          	addi	sp,sp,-16
    800015fc:	00813423          	sd	s0,8(sp)
    80001600:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    80001604:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    80001608:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    8000160c:	00050513          	mv	a0,a0
    return chr;
}
    80001610:	0ff57513          	andi	a0,a0,255
    80001614:	00813403          	ld	s0,8(sp)
    80001618:	01010113          	addi	sp,sp,16
    8000161c:	00008067          	ret

0000000080001620 <_Z4putcc>:

#include "console.h"

void putc(char chr ) {
    80001620:	ff010113          	addi	sp,sp,-16
    80001624:	00813423          	sd	s0,8(sp)
    80001628:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    8000162c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    80001630:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80001634:	00000073          	ecall
    80001638:	00813403          	ld	s0,8(sp)
    8000163c:	01010113          	addi	sp,sp,16
    80001640:	00008067          	ret

0000000080001644 <_ZN4_sem4openEPPS_j>:
#include "sem.h"
#include "syscalls_c.h"
#include "assert.h"
#include "sched.h"

void _sem::open(_sem** handle, unsigned init){
    80001644:	fe010113          	addi	sp,sp,-32
    80001648:	00113c23          	sd	ra,24(sp)
    8000164c:	00813823          	sd	s0,16(sp)
    80001650:	00913423          	sd	s1,8(sp)
    80001654:	01213023          	sd	s2,0(sp)
    80001658:	02010413          	addi	s0,sp,32
    8000165c:	00050493          	mv	s1,a0
    80001660:	00058913          	mv	s2,a1
    (*handle) = (sem_t)mem_alloc(sizeof(_sem));
    80001664:	01800513          	li	a0,24
    80001668:	00000097          	auipc	ra,0x0
    8000166c:	db0080e7          	jalr	-592(ra) # 80001418 <_Z9mem_allocm>
    80001670:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    80001674:	00053023          	sd	zero,0(a0)
    (*handle)->blockTail = 0;
    80001678:	0004b783          	ld	a5,0(s1)
    8000167c:	0007b423          	sd	zero,8(a5)
    (*handle)->value = init;
    80001680:	0004b783          	ld	a5,0(s1)
    80001684:	0127a823          	sw	s2,16(a5)
}
    80001688:	01813083          	ld	ra,24(sp)
    8000168c:	01013403          	ld	s0,16(sp)
    80001690:	00813483          	ld	s1,8(sp)
    80001694:	00013903          	ld	s2,0(sp)
    80001698:	02010113          	addi	sp,sp,32
    8000169c:	00008067          	ret

00000000800016a0 <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    800016a0:	fe010113          	addi	sp,sp,-32
    800016a4:	00113c23          	sd	ra,24(sp)
    800016a8:	00813823          	sd	s0,16(sp)
    800016ac:	00913423          	sd	s1,8(sp)
    800016b0:	02010413          	addi	s0,sp,32
    800016b4:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    800016b8:	0004b783          	ld	a5,0(s1)
    800016bc:	02078863          	beqz	a5,800016ec <_ZN4_sem5closeEPS_+0x4c>
        id->blockHead->pThread->setClosed(true);
    800016c0:	00100593          	li	a1,1
    800016c4:	0007b503          	ld	a0,0(a5)
    800016c8:	00001097          	auipc	ra,0x1
    800016cc:	cf4080e7          	jalr	-780(ra) # 800023bc <_ZN7_thread9setClosedEb>
        mem_free(id->blockHead);
    800016d0:	0004b503          	ld	a0,0(s1)
    800016d4:	00000097          	auipc	ra,0x0
    800016d8:	d74080e7          	jalr	-652(ra) # 80001448 <_Z8mem_freePv>
        id->blockHead = id->blockHead->pNext;
    800016dc:	0004b783          	ld	a5,0(s1)
    800016e0:	0087b783          	ld	a5,8(a5)
    800016e4:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    800016e8:	fd1ff06f          	j	800016b8 <_ZN4_sem5closeEPS_+0x18>
    }
}
    800016ec:	01813083          	ld	ra,24(sp)
    800016f0:	01013403          	ld	s0,16(sp)
    800016f4:	00813483          	ld	s1,8(sp)
    800016f8:	02010113          	addi	sp,sp,32
    800016fc:	00008067          	ret

0000000080001700 <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    80001700:	01052783          	lw	a5,16(a0)
    80001704:	fff7879b          	addiw	a5,a5,-1
    80001708:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    8000170c:	02079713          	slli	a4,a5,0x20
    80001710:	00074463          	bltz	a4,80001718 <_ZN4_sem4waitEPS_+0x18>
    80001714:	00008067          	ret
void _sem::wait(sem_t id){
    80001718:	fe010113          	addi	sp,sp,-32
    8000171c:	00113c23          	sd	ra,24(sp)
    80001720:	00813823          	sd	s0,16(sp)
    80001724:	00913423          	sd	s1,8(sp)
    80001728:	02010413          	addi	s0,sp,32
    8000172c:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    80001730:	01000513          	li	a0,16
    80001734:	00000097          	auipc	ra,0x0
    80001738:	ce4080e7          	jalr	-796(ra) # 80001418 <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    8000173c:	00007797          	auipc	a5,0x7
    80001740:	9147b783          	ld	a5,-1772(a5) # 80008050 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001744:	0007b783          	ld	a5,0(a5)
    80001748:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    8000174c:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    80001750:	0004b783          	ld	a5,0(s1)
    80001754:	04078263          	beqz	a5,80001798 <_ZN4_sem4waitEPS_+0x98>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    80001758:	0084b783          	ld	a5,8(s1)
    8000175c:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    80001760:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    80001764:	00100593          	li	a1,1
    80001768:	00007797          	auipc	a5,0x7
    8000176c:	8e87b783          	ld	a5,-1816(a5) # 80008050 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001770:	0007b503          	ld	a0,0(a5)
    80001774:	00001097          	auipc	ra,0x1
    80001778:	c18080e7          	jalr	-1000(ra) # 8000238c <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    8000177c:	00001097          	auipc	ra,0x1
    80001780:	d40080e7          	jalr	-704(ra) # 800024bc <_ZN7_thread8dispatchEv>
    }
}
    80001784:	01813083          	ld	ra,24(sp)
    80001788:	01013403          	ld	s0,16(sp)
    8000178c:	00813483          	ld	s1,8(sp)
    80001790:	02010113          	addi	sp,sp,32
    80001794:	00008067          	ret
            id->blockHead = pNewBlock;
    80001798:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    8000179c:	00a4b423          	sd	a0,8(s1)
    800017a0:	fc5ff06f          	j	80001764 <_ZN4_sem4waitEPS_+0x64>

00000000800017a4 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    800017a4:	01052783          	lw	a5,16(a0)
    800017a8:	0017879b          	addiw	a5,a5,1
    800017ac:	0007871b          	sext.w	a4,a5
    800017b0:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    800017b4:	00e05463          	blez	a4,800017bc <_ZN4_sem6signalEPS_+0x18>
    800017b8:	00008067          	ret
void _sem::signal(sem_t id){
    800017bc:	fe010113          	addi	sp,sp,-32
    800017c0:	00113c23          	sd	ra,24(sp)
    800017c4:	00813823          	sd	s0,16(sp)
    800017c8:	00913423          	sd	s1,8(sp)
    800017cc:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    800017d0:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    800017d4:	0084b783          	ld	a5,8(s1)
    800017d8:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    800017dc:	04078063          	beqz	a5,8000181c <_ZN4_sem6signalEPS_+0x78>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    800017e0:	00000593          	li	a1,0
    800017e4:	0004b503          	ld	a0,0(s1)
    800017e8:	00001097          	auipc	ra,0x1
    800017ec:	ba4080e7          	jalr	-1116(ra) # 8000238c <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    800017f0:	00048513          	mv	a0,s1
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	c54080e7          	jalr	-940(ra) # 80001448 <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    800017fc:	0004b503          	ld	a0,0(s1)
    80001800:	00002097          	auipc	ra,0x2
    80001804:	2c4080e7          	jalr	708(ra) # 80003ac4 <_ZN9Scheduler3putEP7_thread>
    }
    80001808:	01813083          	ld	ra,24(sp)
    8000180c:	01013403          	ld	s0,16(sp)
    80001810:	00813483          	ld	s1,8(sp)
    80001814:	02010113          	addi	sp,sp,32
    80001818:	00008067          	ret
            id->blockTail = 0;
    8000181c:	00053423          	sd	zero,8(a0)
    80001820:	fc1ff06f          	j	800017e0 <_ZN4_sem6signalEPS_+0x3c>

0000000080001824 <main>:

#include "kernel.h"
#include "assert.h"

/// @brief first function to be called
void main(){
    80001824:	fb010113          	addi	sp,sp,-80
    80001828:	04113423          	sd	ra,72(sp)
    8000182c:	04813023          	sd	s0,64(sp)
    80001830:	02913c23          	sd	s1,56(sp)
    80001834:	05010413          	addi	s0,sp,80
    Kernel kernel = Kernel();
    80001838:	fb040493          	addi	s1,s0,-80
    8000183c:	00048513          	mv	a0,s1
    80001840:	00000097          	auipc	ra,0x0
    80001844:	3cc080e7          	jalr	972(ra) # 80001c0c <_ZN6KernelC1Ev>
    kernel.initialise();
    80001848:	00048513          	mv	a0,s1
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	434080e7          	jalr	1076(ra) # 80001c80 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    80001854:	00048513          	mv	a0,s1
    80001858:	00000097          	auipc	ra,0x0
    8000185c:	538080e7          	jalr	1336(ra) # 80001d90 <_ZN6Kernel3runEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001860:	02051863          	bnez	a0,80001890 <main+0x6c>
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    80001864:	fd040513          	addi	a0,s0,-48
    80001868:	00000097          	auipc	ra,0x0
    8000186c:	908080e7          	jalr	-1784(ra) # 80001170 <_ZN5TimerD1Ev>
    80001870:	fb040513          	addi	a0,s0,-80
    80001874:	00001097          	auipc	ra,0x1
    80001878:	f2c080e7          	jalr	-212(ra) # 800027a0 <_ZN11HeapManagerD1Ev>
    8000187c:	04813083          	ld	ra,72(sp)
    80001880:	04013403          	ld	s0,64(sp)
    80001884:	03813483          	ld	s1,56(sp)
    80001888:	05010113          	addi	sp,sp,80
    8000188c:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001890:	00005697          	auipc	a3,0x5
    80001894:	7f868693          	addi	a3,a3,2040 # 80007088 <CONSOLE_STATUS+0x78>
    80001898:	01400613          	li	a2,20
    8000189c:	00005597          	auipc	a1,0x5
    800018a0:	7fc58593          	addi	a1,a1,2044 # 80007098 <CONSOLE_STATUS+0x88>
    800018a4:	00006517          	auipc	a0,0x6
    800018a8:	80450513          	addi	a0,a0,-2044 # 800070a8 <CONSOLE_STATUS+0x98>
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	034080e7          	jalr	52(ra) # 800018e0 <_Z13assert_failedPKcS0_jS0_>
    800018b4:	fb1ff06f          	j	80001864 <main+0x40>
    800018b8:	00050493          	mv	s1,a0
    800018bc:	fd040513          	addi	a0,s0,-48
    800018c0:	00000097          	auipc	ra,0x0
    800018c4:	8b0080e7          	jalr	-1872(ra) # 80001170 <_ZN5TimerD1Ev>
    800018c8:	fb040513          	addi	a0,s0,-80
    800018cc:	00001097          	auipc	ra,0x1
    800018d0:	ed4080e7          	jalr	-300(ra) # 800027a0 <_ZN11HeapManagerD1Ev>
    800018d4:	00048513          	mv	a0,s1
    800018d8:	00008097          	auipc	ra,0x8
    800018dc:	8d0080e7          	jalr	-1840(ra) # 800091a8 <_Unwind_Resume>

00000000800018e0 <_Z13assert_failedPKcS0_jS0_>:
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    800018e0:	fb010113          	addi	sp,sp,-80
    800018e4:	04113423          	sd	ra,72(sp)
    800018e8:	04813023          	sd	s0,64(sp)
    800018ec:	02913c23          	sd	s1,56(sp)
    800018f0:	03213823          	sd	s2,48(sp)
    800018f4:	03313423          	sd	s3,40(sp)
    800018f8:	03413023          	sd	s4,32(sp)
    800018fc:	05010413          	addi	s0,sp,80
    80001900:	00050993          	mv	s3,a0
    80001904:	00058493          	mv	s1,a1
    80001908:	00060913          	mv	s2,a2
    8000190c:	00068a13          	mv	s4,a3
    putc('\n');
    80001910:	00a00513          	li	a0,10
    80001914:	00000097          	auipc	ra,0x0
    80001918:	d0c080e7          	jalr	-756(ra) # 80001620 <_Z4putcc>
    putc('A');
    8000191c:	04100513          	li	a0,65
    80001920:	00000097          	auipc	ra,0x0
    80001924:	d00080e7          	jalr	-768(ra) # 80001620 <_Z4putcc>
    putc('s');
    80001928:	07300513          	li	a0,115
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	cf4080e7          	jalr	-780(ra) # 80001620 <_Z4putcc>
    putc('s');
    80001934:	07300513          	li	a0,115
    80001938:	00000097          	auipc	ra,0x0
    8000193c:	ce8080e7          	jalr	-792(ra) # 80001620 <_Z4putcc>
    putc('e');
    80001940:	06500513          	li	a0,101
    80001944:	00000097          	auipc	ra,0x0
    80001948:	cdc080e7          	jalr	-804(ra) # 80001620 <_Z4putcc>
    putc('r');
    8000194c:	07200513          	li	a0,114
    80001950:	00000097          	auipc	ra,0x0
    80001954:	cd0080e7          	jalr	-816(ra) # 80001620 <_Z4putcc>
    putc('t');
    80001958:	07400513          	li	a0,116
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	cc4080e7          	jalr	-828(ra) # 80001620 <_Z4putcc>
    putc('i');
    80001964:	06900513          	li	a0,105
    80001968:	00000097          	auipc	ra,0x0
    8000196c:	cb8080e7          	jalr	-840(ra) # 80001620 <_Z4putcc>
    putc('o');
    80001970:	06f00513          	li	a0,111
    80001974:	00000097          	auipc	ra,0x0
    80001978:	cac080e7          	jalr	-852(ra) # 80001620 <_Z4putcc>
    putc('n');
    8000197c:	06e00513          	li	a0,110
    80001980:	00000097          	auipc	ra,0x0
    80001984:	ca0080e7          	jalr	-864(ra) # 80001620 <_Z4putcc>
    putc(' ');
    80001988:	02000513          	li	a0,32
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	c94080e7          	jalr	-876(ra) # 80001620 <_Z4putcc>
    putc('\'');
    80001994:	02700513          	li	a0,39
    80001998:	00000097          	auipc	ra,0x0
    8000199c:	c88080e7          	jalr	-888(ra) # 80001620 <_Z4putcc>
    while(*__assertion != 0){
    800019a0:	0009c503          	lbu	a0,0(s3)
    800019a4:	00050a63          	beqz	a0,800019b8 <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	c78080e7          	jalr	-904(ra) # 80001620 <_Z4putcc>
        __assertion++;
    800019b0:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    800019b4:	fedff06f          	j	800019a0 <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    800019b8:	02700513          	li	a0,39
    800019bc:	00000097          	auipc	ra,0x0
    800019c0:	c64080e7          	jalr	-924(ra) # 80001620 <_Z4putcc>
    putc(' ');
    800019c4:	02000513          	li	a0,32
    800019c8:	00000097          	auipc	ra,0x0
    800019cc:	c58080e7          	jalr	-936(ra) # 80001620 <_Z4putcc>
    putc('f');
    800019d0:	06600513          	li	a0,102
    800019d4:	00000097          	auipc	ra,0x0
    800019d8:	c4c080e7          	jalr	-948(ra) # 80001620 <_Z4putcc>
    putc('a');
    800019dc:	06100513          	li	a0,97
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	c40080e7          	jalr	-960(ra) # 80001620 <_Z4putcc>
    putc('i');
    800019e8:	06900513          	li	a0,105
    800019ec:	00000097          	auipc	ra,0x0
    800019f0:	c34080e7          	jalr	-972(ra) # 80001620 <_Z4putcc>
    putc('l');
    800019f4:	06c00513          	li	a0,108
    800019f8:	00000097          	auipc	ra,0x0
    800019fc:	c28080e7          	jalr	-984(ra) # 80001620 <_Z4putcc>
    putc('e');
    80001a00:	06500513          	li	a0,101
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	c1c080e7          	jalr	-996(ra) # 80001620 <_Z4putcc>
    putc('d');
    80001a0c:	06400513          	li	a0,100
    80001a10:	00000097          	auipc	ra,0x0
    80001a14:	c10080e7          	jalr	-1008(ra) # 80001620 <_Z4putcc>
    putc(' ');
    80001a18:	02000513          	li	a0,32
    80001a1c:	00000097          	auipc	ra,0x0
    80001a20:	c04080e7          	jalr	-1020(ra) # 80001620 <_Z4putcc>
    putc('i');
    80001a24:	06900513          	li	a0,105
    80001a28:	00000097          	auipc	ra,0x0
    80001a2c:	bf8080e7          	jalr	-1032(ra) # 80001620 <_Z4putcc>
    putc('n');
    80001a30:	06e00513          	li	a0,110
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	bec080e7          	jalr	-1044(ra) # 80001620 <_Z4putcc>
    putc(' ');
    80001a3c:	02000513          	li	a0,32
    80001a40:	00000097          	auipc	ra,0x0
    80001a44:	be0080e7          	jalr	-1056(ra) # 80001620 <_Z4putcc>
    putc('f');
    80001a48:	06600513          	li	a0,102
    80001a4c:	00000097          	auipc	ra,0x0
    80001a50:	bd4080e7          	jalr	-1068(ra) # 80001620 <_Z4putcc>
    putc('i');
    80001a54:	06900513          	li	a0,105
    80001a58:	00000097          	auipc	ra,0x0
    80001a5c:	bc8080e7          	jalr	-1080(ra) # 80001620 <_Z4putcc>
    putc('l');
    80001a60:	06c00513          	li	a0,108
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	bbc080e7          	jalr	-1092(ra) # 80001620 <_Z4putcc>
    putc('e');
    80001a6c:	06500513          	li	a0,101
    80001a70:	00000097          	auipc	ra,0x0
    80001a74:	bb0080e7          	jalr	-1104(ra) # 80001620 <_Z4putcc>
    putc(':');
    80001a78:	03a00513          	li	a0,58
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	ba4080e7          	jalr	-1116(ra) # 80001620 <_Z4putcc>
    putc(' ');
    80001a84:	02000513          	li	a0,32
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	b98080e7          	jalr	-1128(ra) # 80001620 <_Z4putcc>
    while(*__file != 0){
    80001a90:	0004c503          	lbu	a0,0(s1)
    80001a94:	00050a63          	beqz	a0,80001aa8 <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	b88080e7          	jalr	-1144(ra) # 80001620 <_Z4putcc>
        __file++;
    80001aa0:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80001aa4:	fedff06f          	j	80001a90 <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    80001aa8:	00a00513          	li	a0,10
    80001aac:	00000097          	auipc	ra,0x0
    80001ab0:	b74080e7          	jalr	-1164(ra) # 80001620 <_Z4putcc>
    putc('l');
    80001ab4:	06c00513          	li	a0,108
    80001ab8:	00000097          	auipc	ra,0x0
    80001abc:	b68080e7          	jalr	-1176(ra) # 80001620 <_Z4putcc>
    putc('i');
    80001ac0:	06900513          	li	a0,105
    80001ac4:	00000097          	auipc	ra,0x0
    80001ac8:	b5c080e7          	jalr	-1188(ra) # 80001620 <_Z4putcc>
    putc('n');
    80001acc:	06e00513          	li	a0,110
    80001ad0:	00000097          	auipc	ra,0x0
    80001ad4:	b50080e7          	jalr	-1200(ra) # 80001620 <_Z4putcc>
    putc('e');
    80001ad8:	06500513          	li	a0,101
    80001adc:	00000097          	auipc	ra,0x0
    80001ae0:	b44080e7          	jalr	-1212(ra) # 80001620 <_Z4putcc>
    putc(':');
    80001ae4:	03a00513          	li	a0,58
    80001ae8:	00000097          	auipc	ra,0x0
    80001aec:	b38080e7          	jalr	-1224(ra) # 80001620 <_Z4putcc>
    putc(' ');
    80001af0:	02000513          	li	a0,32
    80001af4:	00000097          	auipc	ra,0x0
    80001af8:	b2c080e7          	jalr	-1236(ra) # 80001620 <_Z4putcc>
    char buffer[20];
    int i = 0;
    80001afc:	00000493          	li	s1,0
    while(__line != 0){
    80001b00:	02090463          	beqz	s2,80001b28 <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80001b04:	00a00713          	li	a4,10
    80001b08:	02e977bb          	remuw	a5,s2,a4
    80001b0c:	0307879b          	addiw	a5,a5,48
    80001b10:	fd040693          	addi	a3,s0,-48
    80001b14:	009686b3          	add	a3,a3,s1
    80001b18:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    80001b1c:	02e9593b          	divuw	s2,s2,a4
        i++;
    80001b20:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    80001b24:	fddff06f          	j	80001b00 <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    80001b28:	02048063          	beqz	s1,80001b48 <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    80001b2c:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80001b30:	fd040793          	addi	a5,s0,-48
    80001b34:	009787b3          	add	a5,a5,s1
    80001b38:	fe87c503          	lbu	a0,-24(a5)
    80001b3c:	00000097          	auipc	ra,0x0
    80001b40:	ae4080e7          	jalr	-1308(ra) # 80001620 <_Z4putcc>
    80001b44:	fe5ff06f          	j	80001b28 <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80001b48:	00a00513          	li	a0,10
    80001b4c:	00000097          	auipc	ra,0x0
    80001b50:	ad4080e7          	jalr	-1324(ra) # 80001620 <_Z4putcc>
    putc('f');
    80001b54:	06600513          	li	a0,102
    80001b58:	00000097          	auipc	ra,0x0
    80001b5c:	ac8080e7          	jalr	-1336(ra) # 80001620 <_Z4putcc>
    putc('u');
    80001b60:	07500513          	li	a0,117
    80001b64:	00000097          	auipc	ra,0x0
    80001b68:	abc080e7          	jalr	-1348(ra) # 80001620 <_Z4putcc>
    putc('n');
    80001b6c:	06e00513          	li	a0,110
    80001b70:	00000097          	auipc	ra,0x0
    80001b74:	ab0080e7          	jalr	-1360(ra) # 80001620 <_Z4putcc>
    putc('c');
    80001b78:	06300513          	li	a0,99
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	aa4080e7          	jalr	-1372(ra) # 80001620 <_Z4putcc>
    putc('t');
    80001b84:	07400513          	li	a0,116
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	a98080e7          	jalr	-1384(ra) # 80001620 <_Z4putcc>
    putc('i');
    80001b90:	06900513          	li	a0,105
    80001b94:	00000097          	auipc	ra,0x0
    80001b98:	a8c080e7          	jalr	-1396(ra) # 80001620 <_Z4putcc>
    putc('o');
    80001b9c:	06f00513          	li	a0,111
    80001ba0:	00000097          	auipc	ra,0x0
    80001ba4:	a80080e7          	jalr	-1408(ra) # 80001620 <_Z4putcc>
    putc('n');
    80001ba8:	06e00513          	li	a0,110
    80001bac:	00000097          	auipc	ra,0x0
    80001bb0:	a74080e7          	jalr	-1420(ra) # 80001620 <_Z4putcc>
    putc(':');
    80001bb4:	03a00513          	li	a0,58
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	a68080e7          	jalr	-1432(ra) # 80001620 <_Z4putcc>
    putc(' ');
    80001bc0:	02000513          	li	a0,32
    80001bc4:	00000097          	auipc	ra,0x0
    80001bc8:	a5c080e7          	jalr	-1444(ra) # 80001620 <_Z4putcc>
    putc('\'');
    80001bcc:	02700513          	li	a0,39
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	a50080e7          	jalr	-1456(ra) # 80001620 <_Z4putcc>
    while(*__function != 0){
    80001bd8:	000a4503          	lbu	a0,0(s4)
    80001bdc:	00050a63          	beqz	a0,80001bf0 <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    80001be0:	00000097          	auipc	ra,0x0
    80001be4:	a40080e7          	jalr	-1472(ra) # 80001620 <_Z4putcc>
        __function ++;
    80001be8:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80001bec:	fedff06f          	j	80001bd8 <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    80001bf0:	02700513          	li	a0,39
    80001bf4:	00000097          	auipc	ra,0x0
    80001bf8:	a2c080e7          	jalr	-1492(ra) # 80001620 <_Z4putcc>
    putc('\n');
    80001bfc:	00a00513          	li	a0,10
    80001c00:	00000097          	auipc	ra,0x0
    80001c04:	a20080e7          	jalr	-1504(ra) # 80001620 <_Z4putcc>
    while(1);
    80001c08:	0000006f          	j	80001c08 <_Z13assert_failedPKcS0_jS0_+0x328>

0000000080001c0c <_ZN6KernelC1Ev>:

#include "console.h"

extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80001c0c:	fe010113          	addi	sp,sp,-32
    80001c10:	00113c23          	sd	ra,24(sp)
    80001c14:	00813823          	sd	s0,16(sp)
    80001c18:	00913423          	sd	s1,8(sp)
    80001c1c:	01213023          	sd	s2,0(sp)
    80001c20:	02010413          	addi	s0,sp,32
    80001c24:	00050493          	mv	s1,a0
    80001c28:	00001097          	auipc	ra,0x1
    80001c2c:	b10080e7          	jalr	-1264(ra) # 80002738 <_ZN11HeapManagerC1Ev>
    80001c30:	00848513          	addi	a0,s1,8
    80001c34:	00002097          	auipc	ra,0x2
    80001c38:	df8080e7          	jalr	-520(ra) # 80003a2c <_ZN9SchedulerC1Ev>
    80001c3c:	01848513          	addi	a0,s1,24
    80001c40:	fffff097          	auipc	ra,0xfffff
    80001c44:	4c0080e7          	jalr	1216(ra) # 80001100 <_ZN5TimerC1Ev>
    80001c48:	0200006f          	j	80001c68 <_ZN6KernelC1Ev+0x5c>
    80001c4c:	00050913          	mv	s2,a0
    80001c50:	00048513          	mv	a0,s1
    80001c54:	00001097          	auipc	ra,0x1
    80001c58:	b4c080e7          	jalr	-1204(ra) # 800027a0 <_ZN11HeapManagerD1Ev>
    80001c5c:	00090513          	mv	a0,s2
    80001c60:	00007097          	auipc	ra,0x7
    80001c64:	548080e7          	jalr	1352(ra) # 800091a8 <_Unwind_Resume>
    80001c68:	01813083          	ld	ra,24(sp)
    80001c6c:	01013403          	ld	s0,16(sp)
    80001c70:	00813483          	ld	s1,8(sp)
    80001c74:	00013903          	ld	s2,0(sp)
    80001c78:	02010113          	addi	sp,sp,32
    80001c7c:	00008067          	ret

0000000080001c80 <_ZN6Kernel10initialiseEv>:
 

void Kernel::initialise(){
    80001c80:	ff010113          	addi	sp,sp,-16
    80001c84:	00113423          	sd	ra,8(sp)
    80001c88:	00813023          	sd	s0,0(sp)
    80001c8c:	01010413          	addi	s0,sp,16
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80001c90:	00006797          	auipc	a5,0x6
    80001c94:	3b07b783          	ld	a5,944(a5) # 80008040 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c98:	10579073          	csrw	stvec,a5

    /// change to user mode

    uint64 sstatus;
    /// get the current sstatus
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80001c9c:	100027f3          	csrr	a5,sstatus
    /// set the SPP bit to 0
    sstatus &= ~(1 << 8);
    80001ca0:	eff7f793          	andi	a5,a5,-257
    /// write the new sstatus
    __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80001ca4:	10079073          	csrw	sstatus,a5
    
    /// NOW WE ARE IN USER MODE
    
    /// initialise the heap manager
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );
    80001ca8:	00006797          	auipc	a5,0x6
    80001cac:	3a07b783          	ld	a5,928(a5) # 80008048 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001cb0:	0007b603          	ld	a2,0(a5)
    80001cb4:	00006797          	auipc	a5,0x6
    80001cb8:	36c7b783          	ld	a5,876(a5) # 80008020 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001cbc:	0007b583          	ld	a1,0(a5)
    80001cc0:	00001097          	auipc	ra,0x1
    80001cc4:	af8080e7          	jalr	-1288(ra) # 800027b8 <_ZN11HeapManager4initEmm>

    return;
}
    80001cc8:	00813083          	ld	ra,8(sp)
    80001ccc:	00013403          	ld	s0,0(sp)
    80001cd0:	01010113          	addi	sp,sp,16
    80001cd4:	00008067          	ret

0000000080001cd8 <_Z8testFuncPv>:

// sem_t sem = 0;

void testFunc(void* arg){
    80001cd8:	ff010113          	addi	sp,sp,-16
    80001cdc:	00113423          	sd	ra,8(sp)
    80001ce0:	00813023          	sd	s0,0(sp)
    80001ce4:	01010413          	addi	s0,sp,16
    putc('t');
    80001ce8:	07400513          	li	a0,116
    80001cec:	00000097          	auipc	ra,0x0
    80001cf0:	934080e7          	jalr	-1740(ra) # 80001620 <_Z4putcc>
    putc('e');
    80001cf4:	06500513          	li	a0,101
    80001cf8:	00000097          	auipc	ra,0x0
    80001cfc:	928080e7          	jalr	-1752(ra) # 80001620 <_Z4putcc>
    putc('s');
    80001d00:	07300513          	li	a0,115
    80001d04:	00000097          	auipc	ra,0x0
    80001d08:	91c080e7          	jalr	-1764(ra) # 80001620 <_Z4putcc>
    putc('t');
    80001d0c:	07400513          	li	a0,116
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	910080e7          	jalr	-1776(ra) # 80001620 <_Z4putcc>

    // sem_wait(sem);
    // thread_dispatch();
    // thread_dispatch();
    thread_dispatch();
    80001d18:	fffff097          	auipc	ra,0xfffff
    80001d1c:	7b4080e7          	jalr	1972(ra) # 800014cc <_Z15thread_dispatchv>

    // time_sleep(10);
    putc(' ');
    80001d20:	02000513          	li	a0,32
    80001d24:	00000097          	auipc	ra,0x0
    80001d28:	8fc080e7          	jalr	-1796(ra) # 80001620 <_Z4putcc>

    putc('t');
    80001d2c:	07400513          	li	a0,116
    80001d30:	00000097          	auipc	ra,0x0
    80001d34:	8f0080e7          	jalr	-1808(ra) # 80001620 <_Z4putcc>
    putc('h');
    80001d38:	06800513          	li	a0,104
    80001d3c:	00000097          	auipc	ra,0x0
    80001d40:	8e4080e7          	jalr	-1820(ra) # 80001620 <_Z4putcc>
    putc('r');
    80001d44:	07200513          	li	a0,114
    80001d48:	00000097          	auipc	ra,0x0
    80001d4c:	8d8080e7          	jalr	-1832(ra) # 80001620 <_Z4putcc>
    putc('e');
    80001d50:	06500513          	li	a0,101
    80001d54:	00000097          	auipc	ra,0x0
    80001d58:	8cc080e7          	jalr	-1844(ra) # 80001620 <_Z4putcc>
    putc('a');
    80001d5c:	06100513          	li	a0,97
    80001d60:	00000097          	auipc	ra,0x0
    80001d64:	8c0080e7          	jalr	-1856(ra) # 80001620 <_Z4putcc>
    putc('d');
    80001d68:	06400513          	li	a0,100
    80001d6c:	00000097          	auipc	ra,0x0
    80001d70:	8b4080e7          	jalr	-1868(ra) # 80001620 <_Z4putcc>
    putc('\n');
    80001d74:	00a00513          	li	a0,10
    80001d78:	00000097          	auipc	ra,0x0
    80001d7c:	8a8080e7          	jalr	-1880(ra) # 80001620 <_Z4putcc>
}
    80001d80:	00813083          	ld	ra,8(sp)
    80001d84:	00013403          	ld	s0,0(sp)
    80001d88:	01010113          	addi	sp,sp,16
    80001d8c:	00008067          	ret

0000000080001d90 <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    80001d90:	fd010113          	addi	sp,sp,-48
    80001d94:	02113423          	sd	ra,40(sp)
    80001d98:	02813023          	sd	s0,32(sp)
    80001d9c:	00913c23          	sd	s1,24(sp)
    80001da0:	03010413          	addi	s0,sp,48

    thread_t t, test;
    
    thread_create(&t, nullptr, nullptr);
    80001da4:	00000613          	li	a2,0
    80001da8:	00000593          	li	a1,0
    80001dac:	fd840513          	addi	a0,s0,-40
    80001db0:	fffff097          	auipc	ra,0xfffff
    80001db4:	6c4080e7          	jalr	1732(ra) # 80001474 <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80001db8:	00002097          	auipc	ra,0x2
    80001dbc:	efc080e7          	jalr	-260(ra) # 80003cb4 <_ZN9Scheduler3getEv>
    80001dc0:	00006797          	auipc	a5,0x6
    80001dc4:	2907b783          	ld	a5,656(a5) # 80008050 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001dc8:	00a7b023          	sd	a0,0(a5)
    
    thread_create(&test, usermain, 0);
    80001dcc:	00000613          	li	a2,0
    80001dd0:	00006597          	auipc	a1,0x6
    80001dd4:	2585b583          	ld	a1,600(a1) # 80008028 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001dd8:	fd040513          	addi	a0,s0,-48
    80001ddc:	fffff097          	auipc	ra,0xfffff
    80001de0:	698080e7          	jalr	1688(ra) # 80001474 <_Z13thread_createPP7_threadPFvPvES2_>

    int loop = 0;
    80001de4:	00000493          	li	s1,0
    do{
        thread_dispatch();
    80001de8:	fffff097          	auipc	ra,0xfffff
    80001dec:	6e4080e7          	jalr	1764(ra) # 800014cc <_Z15thread_dispatchv>
        loop++;
    80001df0:	0014849b          	addiw	s1,s1,1
    }while(!Scheduler::isEmpty() && loop < 4);
    80001df4:	00002097          	auipc	ra,0x2
    80001df8:	ca8080e7          	jalr	-856(ra) # 80003a9c <_ZN9Scheduler7isEmptyEv>
    80001dfc:	00051663          	bnez	a0,80001e08 <_ZN6Kernel3runEv+0x78>
    80001e00:	00300793          	li	a5,3
    80001e04:	fe97d2e3          	bge	a5,s1,80001de8 <_ZN6Kernel3runEv+0x58>
    // }while(!Scheduler::isEmpty() || !Timer::getInstance().noSleepingThreads());

    putc('m');
    80001e08:	06d00513          	li	a0,109
    80001e0c:	00000097          	auipc	ra,0x0
    80001e10:	814080e7          	jalr	-2028(ra) # 80001620 <_Z4putcc>
    putc('a');
    80001e14:	06100513          	li	a0,97
    80001e18:	00000097          	auipc	ra,0x0
    80001e1c:	808080e7          	jalr	-2040(ra) # 80001620 <_Z4putcc>
    putc('i');
    80001e20:	06900513          	li	a0,105
    80001e24:	fffff097          	auipc	ra,0xfffff
    80001e28:	7fc080e7          	jalr	2044(ra) # 80001620 <_Z4putcc>
    putc('n');
    80001e2c:	06e00513          	li	a0,110
    80001e30:	fffff097          	auipc	ra,0xfffff
    80001e34:	7f0080e7          	jalr	2032(ra) # 80001620 <_Z4putcc>
    putc('\n');
    80001e38:	00a00513          	li	a0,10
    80001e3c:	fffff097          	auipc	ra,0xfffff
    80001e40:	7e4080e7          	jalr	2020(ra) # 80001620 <_Z4putcc>
    
    return EXIT_SUCCESS;
}
    80001e44:	00000513          	li	a0,0
    80001e48:	02813083          	ld	ra,40(sp)
    80001e4c:	02013403          	ld	s0,32(sp)
    80001e50:	01813483          	ld	s1,24(sp)
    80001e54:	03010113          	addi	sp,sp,48
    80001e58:	00008067          	ret

0000000080001e5c <_Z13thread_test_1Pv>:
#include "assert.h"

sem_t sem1;
sem_t sem2;

void thread_test_1(void* args){
    80001e5c:	ff010113          	addi	sp,sp,-16
    80001e60:	00113423          	sd	ra,8(sp)
    80001e64:	00813023          	sd	s0,0(sp)
    80001e68:	01010413          	addi	s0,sp,16
    putc('1');
    80001e6c:	03100513          	li	a0,49
    80001e70:	fffff097          	auipc	ra,0xfffff
    80001e74:	7b0080e7          	jalr	1968(ra) # 80001620 <_Z4putcc>
    putc('s');
    80001e78:	07300513          	li	a0,115
    80001e7c:	fffff097          	auipc	ra,0xfffff
    80001e80:	7a4080e7          	jalr	1956(ra) # 80001620 <_Z4putcc>
    // thread_sleep(50);
    putc('1');
    80001e84:	03100513          	li	a0,49
    80001e88:	fffff097          	auipc	ra,0xfffff
    80001e8c:	798080e7          	jalr	1944(ra) # 80001620 <_Z4putcc>
    sem_signal(sem1);
    80001e90:	00006517          	auipc	a0,0x6
    80001e94:	21853503          	ld	a0,536(a0) # 800080a8 <sem1>
    80001e98:	fffff097          	auipc	ra,0xfffff
    80001e9c:	734080e7          	jalr	1844(ra) # 800015cc <_Z10sem_signalP4_sem>
    putc('S');
    80001ea0:	05300513          	li	a0,83
    80001ea4:	fffff097          	auipc	ra,0xfffff
    80001ea8:	77c080e7          	jalr	1916(ra) # 80001620 <_Z4putcc>
}
    80001eac:	00813083          	ld	ra,8(sp)
    80001eb0:	00013403          	ld	s0,0(sp)
    80001eb4:	01010113          	addi	sp,sp,16
    80001eb8:	00008067          	ret

0000000080001ebc <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80001ebc:	ff010113          	addi	sp,sp,-16
    80001ec0:	00113423          	sd	ra,8(sp)
    80001ec4:	00813023          	sd	s0,0(sp)
    80001ec8:	01010413          	addi	s0,sp,16
    putc('2');
    80001ecc:	03200513          	li	a0,50
    80001ed0:	fffff097          	auipc	ra,0xfffff
    80001ed4:	750080e7          	jalr	1872(ra) # 80001620 <_Z4putcc>
    putc('s');
    80001ed8:	07300513          	li	a0,115
    80001edc:	fffff097          	auipc	ra,0xfffff
    80001ee0:	744080e7          	jalr	1860(ra) # 80001620 <_Z4putcc>
    // thread_sleep(25);
    putc('2');
    80001ee4:	03200513          	li	a0,50
    80001ee8:	fffff097          	auipc	ra,0xfffff
    80001eec:	738080e7          	jalr	1848(ra) # 80001620 <_Z4putcc>
    putc('S');
    80001ef0:	05300513          	li	a0,83
    80001ef4:	fffff097          	auipc	ra,0xfffff
    80001ef8:	72c080e7          	jalr	1836(ra) # 80001620 <_Z4putcc>
    sem_signal(sem2);
    80001efc:	00006517          	auipc	a0,0x6
    80001f00:	1b453503          	ld	a0,436(a0) # 800080b0 <sem2>
    80001f04:	fffff097          	auipc	ra,0xfffff
    80001f08:	6c8080e7          	jalr	1736(ra) # 800015cc <_Z10sem_signalP4_sem>
}
    80001f0c:	00813083          	ld	ra,8(sp)
    80001f10:	00013403          	ld	s0,0(sp)
    80001f14:	01010113          	addi	sp,sp,16
    80001f18:	00008067          	ret

0000000080001f1c <_Z8usermainPv>:

void usermain(void* arg){
    80001f1c:	fd010113          	addi	sp,sp,-48
    80001f20:	02113423          	sd	ra,40(sp)
    80001f24:	02813023          	sd	s0,32(sp)
    80001f28:	00913c23          	sd	s1,24(sp)
    80001f2c:	03010413          	addi	s0,sp,48
    putc('0');
    80001f30:	03000513          	li	a0,48
    80001f34:	fffff097          	auipc	ra,0xfffff
    80001f38:	6ec080e7          	jalr	1772(ra) # 80001620 <_Z4putcc>
    thread_t t1, t2;
    sem_open(&sem1, 0);
    80001f3c:	00006497          	auipc	s1,0x6
    80001f40:	16c48493          	addi	s1,s1,364 # 800080a8 <sem1>
    80001f44:	00000593          	li	a1,0
    80001f48:	00048513          	mv	a0,s1
    80001f4c:	fffff097          	auipc	ra,0xfffff
    80001f50:	5f0080e7          	jalr	1520(ra) # 8000153c <_Z8sem_openPP4_semj>
    sem_open(&sem2, 0);
    80001f54:	00000593          	li	a1,0
    80001f58:	00006517          	auipc	a0,0x6
    80001f5c:	15850513          	addi	a0,a0,344 # 800080b0 <sem2>
    80001f60:	fffff097          	auipc	ra,0xfffff
    80001f64:	5dc080e7          	jalr	1500(ra) # 8000153c <_Z8sem_openPP4_semj>
    thread_create(&t1, thread_test_1, 0);
    80001f68:	00000613          	li	a2,0
    80001f6c:	00000597          	auipc	a1,0x0
    80001f70:	ef058593          	addi	a1,a1,-272 # 80001e5c <_Z13thread_test_1Pv>
    80001f74:	fd840513          	addi	a0,s0,-40
    80001f78:	fffff097          	auipc	ra,0xfffff
    80001f7c:	4fc080e7          	jalr	1276(ra) # 80001474 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80001f80:	00000613          	li	a2,0
    80001f84:	00000597          	auipc	a1,0x0
    80001f88:	f3858593          	addi	a1,a1,-200 # 80001ebc <_Z13thread_test_2Pv>
    80001f8c:	fd040513          	addi	a0,s0,-48
    80001f90:	fffff097          	auipc	ra,0xfffff
    80001f94:	4e4080e7          	jalr	1252(ra) # 80001474 <_Z13thread_createPP7_threadPFvPvES2_>
    sem_wait(sem1);
    80001f98:	0004b503          	ld	a0,0(s1)
    80001f9c:	fffff097          	auipc	ra,0xfffff
    80001fa0:	604080e7          	jalr	1540(ra) # 800015a0 <_Z8sem_waitP4_sem>
    putc('3');
    80001fa4:	03300513          	li	a0,51
    80001fa8:	fffff097          	auipc	ra,0xfffff
    80001fac:	678080e7          	jalr	1656(ra) # 80001620 <_Z4putcc>
    // thread_join(t2);
    // if(getc() == 'a')putc('x');
    putc('4');
    80001fb0:	03400513          	li	a0,52
    80001fb4:	fffff097          	auipc	ra,0xfffff
    80001fb8:	66c080e7          	jalr	1644(ra) # 80001620 <_Z4putcc>
    // thread_join(t1);
    // thread_dispatch();
    // thread_dispatch();
    sem_wait(sem2);
    80001fbc:	0084b503          	ld	a0,8(s1)
    80001fc0:	fffff097          	auipc	ra,0xfffff
    80001fc4:	5e0080e7          	jalr	1504(ra) # 800015a0 <_Z8sem_waitP4_sem>
    putc('5');
    80001fc8:	03500513          	li	a0,53
    80001fcc:	fffff097          	auipc	ra,0xfffff
    80001fd0:	654080e7          	jalr	1620(ra) # 80001620 <_Z4putcc>
    80001fd4:	02813083          	ld	ra,40(sp)
    80001fd8:	02013403          	ld	s0,32(sp)
    80001fdc:	01813483          	ld	s1,24(sp)
    80001fe0:	03010113          	addi	sp,sp,48
    80001fe4:	00008067          	ret

0000000080001fe8 <_ZN7_threadC1EPFvPvES0_>:
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;

_thread::_thread(func function, void* arg){
    80001fe8:	ff010113          	addi	sp,sp,-16
    80001fec:	00813423          	sd	s0,8(sp)
    80001ff0:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80001ff4:	00053823          	sd	zero,16(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80001ff8:	00006717          	auipc	a4,0x6
    80001ffc:	0c070713          	addi	a4,a4,192 # 800080b8 <_ZN7_thread6nextIDE>
    80002000:	00072783          	lw	a5,0(a4)
    80002004:	0017869b          	addiw	a3,a5,1
    80002008:	00d72023          	sw	a3,0(a4)
    8000200c:	00f52023          	sw	a5,0(a0)
    closed = 0;
    80002010:	0a053783          	ld	a5,160(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002014:	0015b593          	seqz	a1,a1
    80002018:	00459593          	slli	a1,a1,0x4
    8000201c:	fe07f793          	andi	a5,a5,-32
    80002020:	00b7e7b3          	or	a5,a5,a1
    reserved = 0;
    80002024:	00005717          	auipc	a4,0x5
    80002028:	0ac73703          	ld	a4,172(a4) # 800070d0 <CONSOLE_STATUS+0xc0>
    8000202c:	00e7f7b3          	and	a5,a5,a4
    80002030:	0af53023          	sd	a5,160(a0)
    joinHead = 0;
    80002034:	08053023          	sd	zero,128(a0)
    timeLeft = 0;
    80002038:	08053823          	sd	zero,144(a0)
    stackStart = 0;
    8000203c:	08053c23          	sd	zero,152(a0)
    
    context.s0 = 0;
    80002040:	00053c23          	sd	zero,24(a0)
    context.s1 = 0;
    80002044:	02053023          	sd	zero,32(a0)
    context.s2 = 0;
    80002048:	02053423          	sd	zero,40(a0)
    context.s3 = 0;
    8000204c:	02053823          	sd	zero,48(a0)
    context.s4 = 0;
    80002050:	02053c23          	sd	zero,56(a0)
    context.s5 = 0;
    80002054:	04053023          	sd	zero,64(a0)
    context.s6 = 0;
    80002058:	04053423          	sd	zero,72(a0)
    context.s7 = 0;
    8000205c:	04053823          	sd	zero,80(a0)
    context.s8 = 0;
    80002060:	04053c23          	sd	zero,88(a0)
    context.s9 = 0;
    80002064:	06053023          	sd	zero,96(a0)
    context.s10 = 0;
    80002068:	06053423          	sd	zero,104(a0)
    context.s11 = 0;
    8000206c:	06053823          	sd	zero,112(a0)

    context.sstatus = 0;
    80002070:	06053c23          	sd	zero,120(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002074:	00000797          	auipc	a5,0x0
    80002078:	67078793          	addi	a5,a5,1648 # 800026e4 <_ZN7_thread7wrapperEv>
    8000207c:	00f53423          	sd	a5,8(a0)
}
    80002080:	00813403          	ld	s0,8(sp)
    80002084:	01010113          	addi	sp,sp,16
    80002088:	00008067          	ret

000000008000208c <_Z10popSppSpiev>:

void popSppSpie(){
    8000208c:	ff010113          	addi	sp,sp,-16
    80002090:	00813423          	sd	s0,8(sp)
    80002094:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002098:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    8000209c:	10200073          	sret
}
    800020a0:	00813403          	ld	s0,8(sp)
    800020a4:	01010113          	addi	sp,sp,16
    800020a8:	00008067          	ret

00000000800020ac <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    800020ac:	fe010113          	addi	sp,sp,-32
    800020b0:	00113c23          	sd	ra,24(sp)
    800020b4:	00813823          	sd	s0,16(sp)
    800020b8:	00913423          	sd	s1,8(sp)
    800020bc:	01213023          	sd	s2,0(sp)
    800020c0:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    800020c4:	08053483          	ld	s1,128(a0)
    while(current != 0){
    800020c8:	0c048e63          	beqz	s1,800021a4 <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    800020cc:	0004c503          	lbu	a0,0(s1)
    800020d0:	0014c783          	lbu	a5,1(s1)
    800020d4:	00879793          	slli	a5,a5,0x8
    800020d8:	00a7e7b3          	or	a5,a5,a0
    800020dc:	0024c503          	lbu	a0,2(s1)
    800020e0:	01051513          	slli	a0,a0,0x10
    800020e4:	00f567b3          	or	a5,a0,a5
    800020e8:	0034c503          	lbu	a0,3(s1)
    800020ec:	01851513          	slli	a0,a0,0x18
    800020f0:	00f56533          	or	a0,a0,a5
    800020f4:	0044c783          	lbu	a5,4(s1)
    800020f8:	02079793          	slli	a5,a5,0x20
    800020fc:	00a7e533          	or	a0,a5,a0
    80002100:	0054c783          	lbu	a5,5(s1)
    80002104:	02879793          	slli	a5,a5,0x28
    80002108:	00a7e7b3          	or	a5,a5,a0
    8000210c:	0064c503          	lbu	a0,6(s1)
    80002110:	03051513          	slli	a0,a0,0x30
    80002114:	00f567b3          	or	a5,a0,a5
    80002118:	0074c503          	lbu	a0,7(s1)
    8000211c:	03851513          	slli	a0,a0,0x38
    80002120:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80002124:	0a053783          	ld	a5,160(a0)
    80002128:	ffd7f793          	andi	a5,a5,-3
    8000212c:	0af53023          	sd	a5,160(a0)
        Scheduler::put(thread);
    80002130:	00002097          	auipc	ra,0x2
    80002134:	994080e7          	jalr	-1644(ra) # 80003ac4 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80002138:	0084c903          	lbu	s2,8(s1)
    8000213c:	0094c783          	lbu	a5,9(s1)
    80002140:	00879793          	slli	a5,a5,0x8
    80002144:	0127e7b3          	or	a5,a5,s2
    80002148:	00a4c903          	lbu	s2,10(s1)
    8000214c:	01091913          	slli	s2,s2,0x10
    80002150:	00f967b3          	or	a5,s2,a5
    80002154:	00b4c903          	lbu	s2,11(s1)
    80002158:	01891913          	slli	s2,s2,0x18
    8000215c:	00f96933          	or	s2,s2,a5
    80002160:	00c4c783          	lbu	a5,12(s1)
    80002164:	02079793          	slli	a5,a5,0x20
    80002168:	0127e933          	or	s2,a5,s2
    8000216c:	00d4c783          	lbu	a5,13(s1)
    80002170:	02879793          	slli	a5,a5,0x28
    80002174:	0127e7b3          	or	a5,a5,s2
    80002178:	00e4c903          	lbu	s2,14(s1)
    8000217c:	03091913          	slli	s2,s2,0x30
    80002180:	00f967b3          	or	a5,s2,a5
    80002184:	00f4c903          	lbu	s2,15(s1)
    80002188:	03891913          	slli	s2,s2,0x38
    8000218c:	00f96933          	or	s2,s2,a5
        mem_free(current);
    80002190:	00048513          	mv	a0,s1
    80002194:	fffff097          	auipc	ra,0xfffff
    80002198:	2b4080e7          	jalr	692(ra) # 80001448 <_Z8mem_freePv>
        current = next;
    8000219c:	00090493          	mv	s1,s2
    while(current != 0){
    800021a0:	f29ff06f          	j	800020c8 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    800021a4:	01813083          	ld	ra,24(sp)
    800021a8:	01013403          	ld	s0,16(sp)
    800021ac:	00813483          	ld	s1,8(sp)
    800021b0:	00013903          	ld	s2,0(sp)
    800021b4:	02010113          	addi	sp,sp,32
    800021b8:	00008067          	ret

00000000800021bc <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    800021bc:	fc010113          	addi	sp,sp,-64
    800021c0:	02113c23          	sd	ra,56(sp)
    800021c4:	02813823          	sd	s0,48(sp)
    800021c8:	02913423          	sd	s1,40(sp)
    800021cc:	03213023          	sd	s2,32(sp)
    800021d0:	01313c23          	sd	s3,24(sp)
    800021d4:	01413823          	sd	s4,16(sp)
    800021d8:	01513423          	sd	s5,8(sp)
    800021dc:	04010413          	addi	s0,sp,64
    800021e0:	00050493          	mv	s1,a0
    800021e4:	00058913          	mv	s2,a1
    800021e8:	00060a93          	mv	s5,a2
    800021ec:	00068993          	mv	s3,a3
    800021f0:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    800021f4:	0b800513          	li	a0,184
    800021f8:	fffff097          	auipc	ra,0xfffff
    800021fc:	220080e7          	jalr	544(ra) # 80001418 <_Z9mem_allocm>
    80002200:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80002204:	18050063          	beqz	a0,80002384 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    80002208:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    8000220c:	0004b783          	ld	a5,0(s1)
    80002210:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80002214:	00006717          	auipc	a4,0x6
    80002218:	ea470713          	addi	a4,a4,-348 # 800080b8 <_ZN7_thread6nextIDE>
    8000221c:	00072783          	lw	a5,0(a4)
    80002220:	0017869b          	addiw	a3,a5,1
    80002224:	00d72023          	sw	a3,0(a4)
    80002228:	0004b703          	ld	a4,0(s1)
    8000222c:	00f72023          	sw	a5,0(a4)
    (*thread)->closed = false;
    80002230:	0004b703          	ld	a4,0(s1)
    80002234:	0a073783          	ld	a5,160(a4)
    80002238:	ffe7f793          	andi	a5,a5,-2
    8000223c:	0af73023          	sd	a5,160(a4)
    (*thread)->blocked = false;
    80002240:	0004b703          	ld	a4,0(s1)
    80002244:	0a073783          	ld	a5,160(a4)
    80002248:	ffd7f793          	andi	a5,a5,-3
    8000224c:	0af73023          	sd	a5,160(a4)
    (*thread)->sleeping = false;
    80002250:	0004b703          	ld	a4,0(s1)
    80002254:	0a073783          	ld	a5,160(a4)
    80002258:	ffb7f793          	andi	a5,a5,-5
    8000225c:	0af73023          	sd	a5,160(a4)
    (*thread)->finished = false;
    80002260:	0004b703          	ld	a4,0(s1)
    80002264:	0a073783          	ld	a5,160(a4)
    80002268:	ff77f793          	andi	a5,a5,-9
    8000226c:	0af73023          	sd	a5,160(a4)
    (*thread)->kernel = (function == 0);
    80002270:	0004b703          	ld	a4,0(s1)
    80002274:	00193913          	seqz	s2,s2
    80002278:	00491913          	slli	s2,s2,0x4
    8000227c:	0a073783          	ld	a5,160(a4)
    80002280:	fef7f793          	andi	a5,a5,-17
    80002284:	0127e933          	or	s2,a5,s2
    80002288:	0b273023          	sd	s2,160(a4)
    (*thread)->reserved = 0;
    8000228c:	0004b703          	ld	a4,0(s1)
    80002290:	0a073783          	ld	a5,160(a4)
    80002294:	00005697          	auipc	a3,0x5
    80002298:	e3c6b683          	ld	a3,-452(a3) # 800070d0 <CONSOLE_STATUS+0xc0>
    8000229c:	00d7f7b3          	and	a5,a5,a3
    800022a0:	0af73023          	sd	a5,160(a4)
    (*thread)->joinHead = 0;
    800022a4:	0004b783          	ld	a5,0(s1)
    800022a8:	0807b023          	sd	zero,128(a5)
    (*thread)->joinTail = 0;
    800022ac:	0004b783          	ld	a5,0(s1)
    800022b0:	0807b423          	sd	zero,136(a5)
    (*thread)->timeLeft = 0;
    800022b4:	0004b783          	ld	a5,0(s1)
    800022b8:	0807b823          	sd	zero,144(a5)
    (*thread)->stackStart = 0;
    800022bc:	0004b783          	ld	a5,0(s1)
    800022c0:	0807bc23          	sd	zero,152(a5)

    (*thread)->context.s0 = 0;
    800022c4:	0004b783          	ld	a5,0(s1)
    800022c8:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s1 = 0;
    800022cc:	0004b783          	ld	a5,0(s1)
    800022d0:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s2 = 0;
    800022d4:	0004b783          	ld	a5,0(s1)
    800022d8:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s3 = 0;
    800022dc:	0004b783          	ld	a5,0(s1)
    800022e0:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s4 = 0;
    800022e4:	0004b783          	ld	a5,0(s1)
    800022e8:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s5 = 0;
    800022ec:	0004b783          	ld	a5,0(s1)
    800022f0:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s6 = 0;
    800022f4:	0004b783          	ld	a5,0(s1)
    800022f8:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s7 = 0;
    800022fc:	0004b783          	ld	a5,0(s1)
    80002300:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s8 = 0;
    80002304:	0004b783          	ld	a5,0(s1)
    80002308:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s9 = 0;
    8000230c:	0004b783          	ld	a5,0(s1)
    80002310:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s10 = 0;
    80002314:	0004b783          	ld	a5,0(s1)
    80002318:	0607b423          	sd	zero,104(a5)
    (*thread)->context.s11 = 0;
    8000231c:	0004b783          	ld	a5,0(s1)
    80002320:	0607b823          	sd	zero,112(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80002324:	0004b783          	ld	a5,0(s1)
    80002328:	0137b823          	sd	s3,16(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    8000232c:	0004b783          	ld	a5,0(s1)
    80002330:	00000717          	auipc	a4,0x0
    80002334:	3b470713          	addi	a4,a4,948 # 800026e4 <_ZN7_thread7wrapperEv>
    80002338:	00e7b423          	sd	a4,8(a5)

    (*thread)->stackStart = stack;
    8000233c:	0004b783          	ld	a5,0(s1)
    80002340:	0937bc23          	sd	s3,152(a5)
    if(start){
    80002344:	020a1663          	bnez	s4,80002370 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    80002348:	00000513          	li	a0,0
}
    8000234c:	03813083          	ld	ra,56(sp)
    80002350:	03013403          	ld	s0,48(sp)
    80002354:	02813483          	ld	s1,40(sp)
    80002358:	02013903          	ld	s2,32(sp)
    8000235c:	01813983          	ld	s3,24(sp)
    80002360:	01013a03          	ld	s4,16(sp)
    80002364:	00813a83          	ld	s5,8(sp)
    80002368:	04010113          	addi	sp,sp,64
    8000236c:	00008067          	ret
        Scheduler::put(*thread);
    80002370:	0004b503          	ld	a0,0(s1)
    80002374:	00001097          	auipc	ra,0x1
    80002378:	750080e7          	jalr	1872(ra) # 80003ac4 <_ZN9Scheduler3putEP7_thread>
    return 0;
    8000237c:	00000513          	li	a0,0
    80002380:	fcdff06f          	j	8000234c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    80002384:	fff00513          	li	a0,-1
    80002388:	fc5ff06f          	j	8000234c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

000000008000238c <_ZN7_thread10setBlockedEb>:
    currentThread->finished = 1;
    dispatch();
    return 0;
}

void _thread::setBlocked(bool blocked){
    8000238c:	ff010113          	addi	sp,sp,-16
    80002390:	00813423          	sd	s0,8(sp)
    80002394:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80002398:	0015f593          	andi	a1,a1,1
    8000239c:	00159793          	slli	a5,a1,0x1
    800023a0:	0a053583          	ld	a1,160(a0)
    800023a4:	ffd5f593          	andi	a1,a1,-3
    800023a8:	00f5e5b3          	or	a1,a1,a5
    800023ac:	0ab53023          	sd	a1,160(a0)
}
    800023b0:	00813403          	ld	s0,8(sp)
    800023b4:	01010113          	addi	sp,sp,16
    800023b8:	00008067          	ret

00000000800023bc <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    800023bc:	ff010113          	addi	sp,sp,-16
    800023c0:	00813423          	sd	s0,8(sp)
    800023c4:	01010413          	addi	s0,sp,16
    this->closed = closed;
    800023c8:	0015f793          	andi	a5,a1,1
    800023cc:	0a053583          	ld	a1,160(a0)
    800023d0:	ffe5f593          	andi	a1,a1,-2
    800023d4:	00f5e5b3          	or	a1,a1,a5
    800023d8:	0ab53023          	sd	a1,160(a0)
}
    800023dc:	00813403          	ld	s0,8(sp)
    800023e0:	01010113          	addi	sp,sp,16
    800023e4:	00008067          	ret

00000000800023e8 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    800023e8:	ff010113          	addi	sp,sp,-16
    800023ec:	00813423          	sd	s0,8(sp)
    800023f0:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    800023f4:	0015f593          	andi	a1,a1,1
    800023f8:	00259793          	slli	a5,a1,0x2
    800023fc:	0a053583          	ld	a1,160(a0)
    80002400:	ffb5f593          	andi	a1,a1,-5
    80002404:	00f5e5b3          	or	a1,a1,a5
    80002408:	0ab53023          	sd	a1,160(a0)
}
    8000240c:	00813403          	ld	s0,8(sp)
    80002410:	01010113          	addi	sp,sp,16
    80002414:	00008067          	ret

0000000080002418 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
    //     return;
    // }
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    80002418:	ff010113          	addi	sp,sp,-16
    8000241c:	00813423          	sd	s0,8(sp)
    80002420:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    80002424:	04050263          	beqz	a0,80002468 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    80002428:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    8000242c:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    80002430:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    80002434:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    80002438:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    8000243c:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    80002440:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    80002444:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    80002448:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    8000244c:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    80002450:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    80002454:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    80002458:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    8000245c:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80002460:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    80002464:	06853823          	sd	s0,112(a0)
    }
    if(newContext->sp != 0){
    80002468:	0085b783          	ld	a5,8(a1)
    8000246c:	00078463          	beqz	a5,80002474 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    80002470:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    80002474:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    80002478:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    8000247c:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80002480:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    80002484:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80002488:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    8000248c:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80002490:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80002494:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80002498:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    8000249c:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    800024a0:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    800024a4:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    800024a8:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    800024ac:	0685bd83          	ld	s11,104(a1)

    return;

}
    800024b0:	00813403          	ld	s0,8(sp)
    800024b4:	01010113          	addi	sp,sp,16
    800024b8:	00008067          	ret

00000000800024bc <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    800024bc:	fe010113          	addi	sp,sp,-32
    800024c0:	00113c23          	sd	ra,24(sp)
    800024c4:	00813823          	sd	s0,16(sp)
    800024c8:	00913423          	sd	s1,8(sp)
    800024cc:	01213023          	sd	s2,0(sp)
    800024d0:	02010413          	addi	s0,sp,32
    _thread* oldThread = currentThread;
    800024d4:	00006917          	auipc	s2,0x6
    800024d8:	be490913          	addi	s2,s2,-1052 # 800080b8 <_ZN7_thread6nextIDE>
    800024dc:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    800024e0:	00001097          	auipc	ra,0x1
    800024e4:	7d4080e7          	jalr	2004(ra) # 80003cb4 <_ZN9Scheduler3getEv>
    800024e8:	00a93423          	sd	a0,8(s2)
    if(currentThread == 0){
    800024ec:	04050663          	beqz	a0,80002538 <_ZN7_thread8dispatchEv+0x7c>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    800024f0:	00048863          	beqz	s1,80002500 <_ZN7_thread8dispatchEv+0x44>
    800024f4:	0a04b783          	ld	a5,160(s1)
    800024f8:	00f7f793          	andi	a5,a5,15
    800024fc:	04078463          	beqz	a5,80002544 <_ZN7_thread8dispatchEv+0x88>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    80002500:	00048463          	beqz	s1,80002508 <_ZN7_thread8dispatchEv+0x4c>
    80002504:	00848493          	addi	s1,s1,8
    80002508:	00006597          	auipc	a1,0x6
    8000250c:	bb85b583          	ld	a1,-1096(a1) # 800080c0 <_ZN7_thread13currentThreadE>
    80002510:	00858593          	addi	a1,a1,8
    80002514:	00048513          	mv	a0,s1
    80002518:	00000097          	auipc	ra,0x0
    8000251c:	f00080e7          	jalr	-256(ra) # 80002418 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    80002520:	01813083          	ld	ra,24(sp)
    80002524:	01013403          	ld	s0,16(sp)
    80002528:	00813483          	ld	s1,8(sp)
    8000252c:	00013903          	ld	s2,0(sp)
    80002530:	02010113          	addi	sp,sp,32
    80002534:	00008067          	ret
        currentThread = oldThread;
    80002538:	00006797          	auipc	a5,0x6
    8000253c:	b897b423          	sd	s1,-1144(a5) # 800080c0 <_ZN7_thread13currentThreadE>
        return;
    80002540:	fe1ff06f          	j	80002520 <_ZN7_thread8dispatchEv+0x64>
            Scheduler::put(oldThread);
    80002544:	00048513          	mv	a0,s1
    80002548:	00001097          	auipc	ra,0x1
    8000254c:	57c080e7          	jalr	1404(ra) # 80003ac4 <_ZN9Scheduler3putEP7_thread>
    80002550:	fb1ff06f          	j	80002500 <_ZN7_thread8dispatchEv+0x44>

0000000080002554 <_ZN7_thread4joinEPS_>:
    if(thread->finished || thread->closed){
    80002554:	0a05b783          	ld	a5,160(a1)
    80002558:	0097f793          	andi	a5,a5,9
    8000255c:	00078463          	beqz	a5,80002564 <_ZN7_thread4joinEPS_+0x10>
    80002560:	00008067          	ret
void _thread::join(thread_t thread){
    80002564:	fe010113          	addi	sp,sp,-32
    80002568:	00113c23          	sd	ra,24(sp)
    8000256c:	00813823          	sd	s0,16(sp)
    80002570:	00913423          	sd	s1,8(sp)
    80002574:	01213023          	sd	s2,0(sp)
    80002578:	02010413          	addi	s0,sp,32
    8000257c:	00050493          	mv	s1,a0
    80002580:	00058913          	mv	s2,a1
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    80002584:	01000513          	li	a0,16
    80002588:	fffff097          	auipc	ra,0xfffff
    8000258c:	e90080e7          	jalr	-368(ra) # 80001418 <_Z9mem_allocm>
    this->blocked = true;
    80002590:	0a04b703          	ld	a4,160(s1)
    80002594:	00276713          	ori	a4,a4,2
    80002598:	0ae4b023          	sd	a4,160(s1)
    newJoin->thread = this;
    8000259c:	00950023          	sb	s1,0(a0)
    800025a0:	0084d713          	srli	a4,s1,0x8
    800025a4:	00e500a3          	sb	a4,1(a0)
    800025a8:	0104d713          	srli	a4,s1,0x10
    800025ac:	00e50123          	sb	a4,2(a0)
    800025b0:	0184d71b          	srliw	a4,s1,0x18
    800025b4:	00e501a3          	sb	a4,3(a0)
    800025b8:	0204d713          	srli	a4,s1,0x20
    800025bc:	00e50223          	sb	a4,4(a0)
    800025c0:	0284d713          	srli	a4,s1,0x28
    800025c4:	00e502a3          	sb	a4,5(a0)
    800025c8:	0304d713          	srli	a4,s1,0x30
    800025cc:	00e50323          	sb	a4,6(a0)
    800025d0:	0384d493          	srli	s1,s1,0x38
    800025d4:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    800025d8:	00050423          	sb	zero,8(a0)
    800025dc:	000504a3          	sb	zero,9(a0)
    800025e0:	00050523          	sb	zero,10(a0)
    800025e4:	000505a3          	sb	zero,11(a0)
    800025e8:	00050623          	sb	zero,12(a0)
    800025ec:	000506a3          	sb	zero,13(a0)
    800025f0:	00050723          	sb	zero,14(a0)
    800025f4:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    800025f8:	08093703          	ld	a4,128(s2)
    800025fc:	06070463          	beqz	a4,80002664 <_ZN7_thread4joinEPS_+0x110>
        thread->joinTail->next = newJoin;
    80002600:	08893703          	ld	a4,136(s2)
    80002604:	00a70423          	sb	a0,8(a4)
    80002608:	00855693          	srli	a3,a0,0x8
    8000260c:	00d704a3          	sb	a3,9(a4)
    80002610:	01055693          	srli	a3,a0,0x10
    80002614:	00d70523          	sb	a3,10(a4)
    80002618:	0185569b          	srliw	a3,a0,0x18
    8000261c:	00d705a3          	sb	a3,11(a4)
    80002620:	02055693          	srli	a3,a0,0x20
    80002624:	00d70623          	sb	a3,12(a4)
    80002628:	02855693          	srli	a3,a0,0x28
    8000262c:	00d706a3          	sb	a3,13(a4)
    80002630:	03055693          	srli	a3,a0,0x30
    80002634:	00d70723          	sb	a3,14(a4)
    80002638:	03855693          	srli	a3,a0,0x38
    8000263c:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    80002640:	08a93423          	sd	a0,136(s2)
    dispatch();
    80002644:	00000097          	auipc	ra,0x0
    80002648:	e78080e7          	jalr	-392(ra) # 800024bc <_ZN7_thread8dispatchEv>
}
    8000264c:	01813083          	ld	ra,24(sp)
    80002650:	01013403          	ld	s0,16(sp)
    80002654:	00813483          	ld	s1,8(sp)
    80002658:	00013903          	ld	s2,0(sp)
    8000265c:	02010113          	addi	sp,sp,32
    80002660:	00008067          	ret
        thread->joinHead = newJoin;
    80002664:	08a93023          	sd	a0,128(s2)
        thread->joinTail = newJoin;
    80002668:	08a93423          	sd	a0,136(s2)
    8000266c:	fd9ff06f          	j	80002644 <_ZN7_thread4joinEPS_+0xf0>

0000000080002670 <_ZN7_thread4exitEv>:
    if(currentThread->closed){
    80002670:	00006717          	auipc	a4,0x6
    80002674:	a5073703          	ld	a4,-1456(a4) # 800080c0 <_ZN7_thread13currentThreadE>
    80002678:	0a073783          	ld	a5,160(a4)
    8000267c:	0017f693          	andi	a3,a5,1
    80002680:	04069663          	bnez	a3,800026cc <_ZN7_thread4exitEv+0x5c>
    if(currentThread->blocked){
    80002684:	0027f693          	andi	a3,a5,2
    80002688:	04069663          	bnez	a3,800026d4 <_ZN7_thread4exitEv+0x64>
    if(currentThread->sleeping){
    8000268c:	0047f793          	andi	a5,a5,4
    80002690:	04079663          	bnez	a5,800026dc <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    80002694:	ff010113          	addi	sp,sp,-16
    80002698:	00113423          	sd	ra,8(sp)
    8000269c:	00813023          	sd	s0,0(sp)
    800026a0:	01010413          	addi	s0,sp,16
    currentThread->finished = 1;
    800026a4:	0a073783          	ld	a5,160(a4)
    800026a8:	0087e793          	ori	a5,a5,8
    800026ac:	0af73023          	sd	a5,160(a4)
    dispatch();
    800026b0:	00000097          	auipc	ra,0x0
    800026b4:	e0c080e7          	jalr	-500(ra) # 800024bc <_ZN7_thread8dispatchEv>
    return 0;
    800026b8:	00000513          	li	a0,0
}
    800026bc:	00813083          	ld	ra,8(sp)
    800026c0:	00013403          	ld	s0,0(sp)
    800026c4:	01010113          	addi	sp,sp,16
    800026c8:	00008067          	ret
        return -1;
    800026cc:	fff00513          	li	a0,-1
    800026d0:	00008067          	ret
        return -2;
    800026d4:	ffe00513          	li	a0,-2
    800026d8:	00008067          	ret
        return -3;
    800026dc:	ffd00513          	li	a0,-3
}
    800026e0:	00008067          	ret

00000000800026e4 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    800026e4:	fe010113          	addi	sp,sp,-32
    800026e8:	00113c23          	sd	ra,24(sp)
    800026ec:	00813823          	sd	s0,16(sp)
    800026f0:	00913423          	sd	s1,8(sp)
    800026f4:	02010413          	addi	s0,sp,32
    currentThread->function(currentThread->arg);
    800026f8:	00006497          	auipc	s1,0x6
    800026fc:	9c048493          	addi	s1,s1,-1600 # 800080b8 <_ZN7_thread6nextIDE>
    80002700:	0084b783          	ld	a5,8(s1)
    80002704:	0a87b703          	ld	a4,168(a5)
    80002708:	0b07b503          	ld	a0,176(a5)
    8000270c:	000700e7          	jalr	a4
    currentThread->unJoin();
    80002710:	0084b503          	ld	a0,8(s1)
    80002714:	00000097          	auipc	ra,0x0
    80002718:	998080e7          	jalr	-1640(ra) # 800020ac <_ZN7_thread6unJoinEv>
    exit();
    8000271c:	00000097          	auipc	ra,0x0
    80002720:	f54080e7          	jalr	-172(ra) # 80002670 <_ZN7_thread4exitEv>
}
    80002724:	01813083          	ld	ra,24(sp)
    80002728:	01013403          	ld	s0,16(sp)
    8000272c:	00813483          	ld	s1,8(sp)
    80002730:	02010113          	addi	sp,sp,32
    80002734:	00008067          	ret

0000000080002738 <_ZN11HeapManagerC1Ev>:
#include "hw.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80002738:	fe010113          	addi	sp,sp,-32
    8000273c:	00113c23          	sd	ra,24(sp)
    80002740:	00813823          	sd	s0,16(sp)
    80002744:	00913423          	sd	s1,8(sp)
    80002748:	02010413          	addi	s0,sp,32
    8000274c:	00050493          	mv	s1,a0
    assert(instance == 0);
    80002750:	00006797          	auipc	a5,0x6
    80002754:	9787b783          	ld	a5,-1672(a5) # 800080c8 <_ZN11HeapManager8instanceE>
    80002758:	02079063          	bnez	a5,80002778 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    8000275c:	00006797          	auipc	a5,0x6
    80002760:	9697b623          	sd	s1,-1684(a5) # 800080c8 <_ZN11HeapManager8instanceE>
}
    80002764:	01813083          	ld	ra,24(sp)
    80002768:	01013403          	ld	s0,16(sp)
    8000276c:	00813483          	ld	s1,8(sp)
    80002770:	02010113          	addi	sp,sp,32
    80002774:	00008067          	ret
    assert(instance == 0);
    80002778:	00005697          	auipc	a3,0x5
    8000277c:	96068693          	addi	a3,a3,-1696 # 800070d8 <CONSOLE_STATUS+0xc8>
    80002780:	01300613          	li	a2,19
    80002784:	00005597          	auipc	a1,0x5
    80002788:	97458593          	addi	a1,a1,-1676 # 800070f8 <CONSOLE_STATUS+0xe8>
    8000278c:	00005517          	auipc	a0,0x5
    80002790:	8b450513          	addi	a0,a0,-1868 # 80007040 <CONSOLE_STATUS+0x30>
    80002794:	fffff097          	auipc	ra,0xfffff
    80002798:	14c080e7          	jalr	332(ra) # 800018e0 <_Z13assert_failedPKcS0_jS0_>
    8000279c:	fc1ff06f          	j	8000275c <_ZN11HeapManagerC1Ev+0x24>

00000000800027a0 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    800027a0:	ff010113          	addi	sp,sp,-16
    800027a4:	00813423          	sd	s0,8(sp)
    800027a8:	01010413          	addi	s0,sp,16
    
}
    800027ac:	00813403          	ld	s0,8(sp)
    800027b0:	01010113          	addi	sp,sp,16
    800027b4:	00008067          	ret

00000000800027b8 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    800027b8:	fd010113          	addi	sp,sp,-48
    800027bc:	02113423          	sd	ra,40(sp)
    800027c0:	02813023          	sd	s0,32(sp)
    800027c4:	00913c23          	sd	s1,24(sp)
    800027c8:	01213823          	sd	s2,16(sp)
    800027cc:	01313423          	sd	s3,8(sp)
    800027d0:	03010413          	addi	s0,sp,48
    800027d4:	00050993          	mv	s3,a0
    800027d8:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    800027dc:	40b604b3          	sub	s1,a2,a1
    800027e0:	0414b793          	sltiu	a5,s1,65
    800027e4:	0c079863          	bnez	a5,800028b4 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    800027e8:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    800027ec:	fde00793          	li	a5,-34
    800027f0:	00f90c23          	sb	a5,24(s2)
    800027f4:	fc000713          	li	a4,-64
    800027f8:	00e90ca3          	sb	a4,25(s2)
    800027fc:	fad00713          	li	a4,-83
    80002800:	00e90d23          	sb	a4,26(s2)
    80002804:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart - MEM_BLOCK_SIZE) / MEM_BLOCK_SIZE;
    80002808:	fc048613          	addi	a2,s1,-64
    8000280c:	0009b783          	ld	a5,0(s3)
    80002810:	00665713          	srli	a4,a2,0x6
    80002814:	00e78823          	sb	a4,16(a5)
    80002818:	00e65713          	srli	a4,a2,0xe
    8000281c:	00e788a3          	sb	a4,17(a5)
    80002820:	01665713          	srli	a4,a2,0x16
    80002824:	00e78923          	sb	a4,18(a5)
    80002828:	01e65713          	srli	a4,a2,0x1e
    8000282c:	00e789a3          	sb	a4,19(a5)
    80002830:	02665713          	srli	a4,a2,0x26
    80002834:	00e78a23          	sb	a4,20(a5)
    80002838:	02e65713          	srli	a4,a2,0x2e
    8000283c:	00e78aa3          	sb	a4,21(a5)
    80002840:	03665713          	srli	a4,a2,0x36
    80002844:	00e78b23          	sb	a4,22(a5)
    80002848:	03e65613          	srli	a2,a2,0x3e
    8000284c:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80002850:	0009b783          	ld	a5,0(s3)
    80002854:	00078023          	sb	zero,0(a5)
    80002858:	000780a3          	sb	zero,1(a5)
    8000285c:	00078123          	sb	zero,2(a5)
    80002860:	000781a3          	sb	zero,3(a5)
    80002864:	00078223          	sb	zero,4(a5)
    80002868:	000782a3          	sb	zero,5(a5)
    8000286c:	00078323          	sb	zero,6(a5)
    80002870:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80002874:	0009b783          	ld	a5,0(s3)
    80002878:	00078423          	sb	zero,8(a5)
    8000287c:	000784a3          	sb	zero,9(a5)
    80002880:	00078523          	sb	zero,10(a5)
    80002884:	000785a3          	sb	zero,11(a5)
    80002888:	00078623          	sb	zero,12(a5)
    8000288c:	000786a3          	sb	zero,13(a5)
    80002890:	00078723          	sb	zero,14(a5)
    80002894:	000787a3          	sb	zero,15(a5)
}
    80002898:	02813083          	ld	ra,40(sp)
    8000289c:	02013403          	ld	s0,32(sp)
    800028a0:	01813483          	ld	s1,24(sp)
    800028a4:	01013903          	ld	s2,16(sp)
    800028a8:	00813983          	ld	s3,8(sp)
    800028ac:	03010113          	addi	sp,sp,48
    800028b0:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    800028b4:	00005697          	auipc	a3,0x5
    800028b8:	85c68693          	addi	a3,a3,-1956 # 80007110 <CONSOLE_STATUS+0x100>
    800028bc:	01c00613          	li	a2,28
    800028c0:	00005597          	auipc	a1,0x5
    800028c4:	83858593          	addi	a1,a1,-1992 # 800070f8 <CONSOLE_STATUS+0xe8>
    800028c8:	00005517          	auipc	a0,0x5
    800028cc:	87850513          	addi	a0,a0,-1928 # 80007140 <CONSOLE_STATUS+0x130>
    800028d0:	fffff097          	auipc	ra,0xfffff
    800028d4:	010080e7          	jalr	16(ra) # 800018e0 <_Z13assert_failedPKcS0_jS0_>
    800028d8:	f11ff06f          	j	800027e8 <_ZN11HeapManager4initEmm+0x30>

00000000800028dc <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    800028dc:	fe010113          	addi	sp,sp,-32
    800028e0:	00113c23          	sd	ra,24(sp)
    800028e4:	00813823          	sd	s0,16(sp)
    800028e8:	00913423          	sd	s1,8(sp)
    800028ec:	01213023          	sd	s2,0(sp)
    800028f0:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    800028f4:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    800028f8:	00000913          	li	s2,0
    800028fc:	0b80006f          	j	800029b4 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        /// how is this an illegal read???
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80002900:	0104c783          	lbu	a5,16(s1)
    80002904:	0114c703          	lbu	a4,17(s1)
    80002908:	00871713          	slli	a4,a4,0x8
    8000290c:	00f76733          	or	a4,a4,a5
    80002910:	0124c783          	lbu	a5,18(s1)
    80002914:	01079793          	slli	a5,a5,0x10
    80002918:	00e7e733          	or	a4,a5,a4
    8000291c:	0134c783          	lbu	a5,19(s1)
    80002920:	01879793          	slli	a5,a5,0x18
    80002924:	00e7e7b3          	or	a5,a5,a4
    80002928:	0144c703          	lbu	a4,20(s1)
    8000292c:	02071713          	slli	a4,a4,0x20
    80002930:	00f767b3          	or	a5,a4,a5
    80002934:	0154c703          	lbu	a4,21(s1)
    80002938:	02871713          	slli	a4,a4,0x28
    8000293c:	00f76733          	or	a4,a4,a5
    80002940:	0164c783          	lbu	a5,22(s1)
    80002944:	03079793          	slli	a5,a5,0x30
    80002948:	00e7e733          	or	a4,a5,a4
    8000294c:	0174c783          	lbu	a5,23(s1)
    80002950:	03879793          	slli	a5,a5,0x38
    80002954:	00e7e7b3          	or	a5,a5,a4
    80002958:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    8000295c:	0004c703          	lbu	a4,0(s1)
    80002960:	0014c783          	lbu	a5,1(s1)
    80002964:	00879793          	slli	a5,a5,0x8
    80002968:	00e7e733          	or	a4,a5,a4
    8000296c:	0024c783          	lbu	a5,2(s1)
    80002970:	01079793          	slli	a5,a5,0x10
    80002974:	00e7e7b3          	or	a5,a5,a4
    80002978:	0034c703          	lbu	a4,3(s1)
    8000297c:	01871713          	slli	a4,a4,0x18
    80002980:	00f767b3          	or	a5,a4,a5
    80002984:	0044c703          	lbu	a4,4(s1)
    80002988:	02071713          	slli	a4,a4,0x20
    8000298c:	00f76733          	or	a4,a4,a5
    80002990:	0054c783          	lbu	a5,5(s1)
    80002994:	02879793          	slli	a5,a5,0x28
    80002998:	00e7e733          	or	a4,a5,a4
    8000299c:	0064c783          	lbu	a5,6(s1)
    800029a0:	03079793          	slli	a5,a5,0x30
    800029a4:	00e7e7b3          	or	a5,a5,a4
    800029a8:	0074c483          	lbu	s1,7(s1)
    800029ac:	03849493          	slli	s1,s1,0x38
    800029b0:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    800029b4:	06048263          	beqz	s1,80002a18 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    800029b8:	0184c783          	lbu	a5,24(s1)
    800029bc:	0194c703          	lbu	a4,25(s1)
    800029c0:	00871713          	slli	a4,a4,0x8
    800029c4:	00f76733          	or	a4,a4,a5
    800029c8:	01a4c783          	lbu	a5,26(s1)
    800029cc:	01079793          	slli	a5,a5,0x10
    800029d0:	00e7e733          	or	a4,a5,a4
    800029d4:	01b4c783          	lbu	a5,27(s1)
    800029d8:	01879793          	slli	a5,a5,0x18
    800029dc:	00e7e7b3          	or	a5,a5,a4
    800029e0:	0007879b          	sext.w	a5,a5
    800029e4:	deadc737          	lui	a4,0xdeadc
    800029e8:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2d9e>
    800029ec:	f0e78ae3          	beq	a5,a4,80002900 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    800029f0:	00004697          	auipc	a3,0x4
    800029f4:	77068693          	addi	a3,a3,1904 # 80007160 <CONSOLE_STATUS+0x150>
    800029f8:	02a00613          	li	a2,42
    800029fc:	00004597          	auipc	a1,0x4
    80002a00:	6fc58593          	addi	a1,a1,1788 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002a04:	00004517          	auipc	a0,0x4
    80002a08:	78450513          	addi	a0,a0,1924 # 80007188 <CONSOLE_STATUS+0x178>
    80002a0c:	fffff097          	auipc	ra,0xfffff
    80002a10:	ed4080e7          	jalr	-300(ra) # 800018e0 <_Z13assert_failedPKcS0_jS0_>
    80002a14:	eedff06f          	j	80002900 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80002a18:	00090513          	mv	a0,s2
    80002a1c:	01813083          	ld	ra,24(sp)
    80002a20:	01013403          	ld	s0,16(sp)
    80002a24:	00813483          	ld	s1,8(sp)
    80002a28:	00013903          	ld	s2,0(sp)
    80002a2c:	02010113          	addi	sp,sp,32
    80002a30:	00008067          	ret

0000000080002a34 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80002a34:	fd010113          	addi	sp,sp,-48
    80002a38:	02113423          	sd	ra,40(sp)
    80002a3c:	02813023          	sd	s0,32(sp)
    80002a40:	00913c23          	sd	s1,24(sp)
    80002a44:	01213823          	sd	s2,16(sp)
    80002a48:	01313423          	sd	s3,8(sp)
    80002a4c:	03010413          	addi	s0,sp,48
    80002a50:	00050993          	mv	s3,a0
    80002a54:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002a58:	00053483          	ld	s1,0(a0)
    80002a5c:	0b80006f          	j	80002b14 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80002a60:	0104c783          	lbu	a5,16(s1)
    80002a64:	0114c703          	lbu	a4,17(s1)
    80002a68:	00871713          	slli	a4,a4,0x8
    80002a6c:	00f76733          	or	a4,a4,a5
    80002a70:	0124c783          	lbu	a5,18(s1)
    80002a74:	01079793          	slli	a5,a5,0x10
    80002a78:	00e7e733          	or	a4,a5,a4
    80002a7c:	0134c783          	lbu	a5,19(s1)
    80002a80:	01879793          	slli	a5,a5,0x18
    80002a84:	00e7e7b3          	or	a5,a5,a4
    80002a88:	0144c703          	lbu	a4,20(s1)
    80002a8c:	02071713          	slli	a4,a4,0x20
    80002a90:	00f767b3          	or	a5,a4,a5
    80002a94:	0154c703          	lbu	a4,21(s1)
    80002a98:	02871713          	slli	a4,a4,0x28
    80002a9c:	00f76733          	or	a4,a4,a5
    80002aa0:	0164c783          	lbu	a5,22(s1)
    80002aa4:	03079793          	slli	a5,a5,0x30
    80002aa8:	00e7e733          	or	a4,a5,a4
    80002aac:	0174c783          	lbu	a5,23(s1)
    80002ab0:	03879793          	slli	a5,a5,0x38
    80002ab4:	00e7e7b3          	or	a5,a5,a4
    80002ab8:	0d27f063          	bgeu	a5,s2,80002b78 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80002abc:	0004c703          	lbu	a4,0(s1)
    80002ac0:	0014c783          	lbu	a5,1(s1)
    80002ac4:	00879793          	slli	a5,a5,0x8
    80002ac8:	00e7e733          	or	a4,a5,a4
    80002acc:	0024c783          	lbu	a5,2(s1)
    80002ad0:	01079793          	slli	a5,a5,0x10
    80002ad4:	00e7e7b3          	or	a5,a5,a4
    80002ad8:	0034c703          	lbu	a4,3(s1)
    80002adc:	01871713          	slli	a4,a4,0x18
    80002ae0:	00f767b3          	or	a5,a4,a5
    80002ae4:	0044c703          	lbu	a4,4(s1)
    80002ae8:	02071713          	slli	a4,a4,0x20
    80002aec:	00f76733          	or	a4,a4,a5
    80002af0:	0054c783          	lbu	a5,5(s1)
    80002af4:	02879793          	slli	a5,a5,0x28
    80002af8:	00e7e733          	or	a4,a5,a4
    80002afc:	0064c783          	lbu	a5,6(s1)
    80002b00:	03079793          	slli	a5,a5,0x30
    80002b04:	00e7e7b3          	or	a5,a5,a4
    80002b08:	0074c483          	lbu	s1,7(s1)
    80002b0c:	03849493          	slli	s1,s1,0x38
    80002b10:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002b14:	4e048c63          	beqz	s1,8000300c <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002b18:	0184c783          	lbu	a5,24(s1)
    80002b1c:	0194c703          	lbu	a4,25(s1)
    80002b20:	00871713          	slli	a4,a4,0x8
    80002b24:	00f76733          	or	a4,a4,a5
    80002b28:	01a4c783          	lbu	a5,26(s1)
    80002b2c:	01079793          	slli	a5,a5,0x10
    80002b30:	00e7e733          	or	a4,a5,a4
    80002b34:	01b4c783          	lbu	a5,27(s1)
    80002b38:	01879793          	slli	a5,a5,0x18
    80002b3c:	00e7e7b3          	or	a5,a5,a4
    80002b40:	0007879b          	sext.w	a5,a5
    80002b44:	deadc737          	lui	a4,0xdeadc
    80002b48:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2d9e>
    80002b4c:	f0e78ae3          	beq	a5,a4,80002a60 <_ZN11HeapManager12heapAllocateEm+0x2c>
    80002b50:	00004697          	auipc	a3,0x4
    80002b54:	66068693          	addi	a3,a3,1632 # 800071b0 <CONSOLE_STATUS+0x1a0>
    80002b58:	03400613          	li	a2,52
    80002b5c:	00004597          	auipc	a1,0x4
    80002b60:	59c58593          	addi	a1,a1,1436 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002b64:	00004517          	auipc	a0,0x4
    80002b68:	62450513          	addi	a0,a0,1572 # 80007188 <CONSOLE_STATUS+0x178>
    80002b6c:	fffff097          	auipc	ra,0xfffff
    80002b70:	d74080e7          	jalr	-652(ra) # 800018e0 <_Z13assert_failedPKcS0_jS0_>
    80002b74:	eedff06f          	j	80002a60 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80002b78:	00190713          	addi	a4,s2,1
    80002b7c:	2af77263          	bgeu	a4,a5,80002e20 <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80002b80:	00671793          	slli	a5,a4,0x6
    80002b84:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80002b88:	fde00713          	li	a4,-34
    80002b8c:	00e78c23          	sb	a4,24(a5)
    80002b90:	fc000693          	li	a3,-64
    80002b94:	00d78ca3          	sb	a3,25(a5)
    80002b98:	fad00693          	li	a3,-83
    80002b9c:	00d78d23          	sb	a3,26(a5)
    80002ba0:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80002ba4:	0104c703          	lbu	a4,16(s1)
    80002ba8:	0114c683          	lbu	a3,17(s1)
    80002bac:	00869693          	slli	a3,a3,0x8
    80002bb0:	00e6e6b3          	or	a3,a3,a4
    80002bb4:	0124c703          	lbu	a4,18(s1)
    80002bb8:	01071713          	slli	a4,a4,0x10
    80002bbc:	00d766b3          	or	a3,a4,a3
    80002bc0:	0134c703          	lbu	a4,19(s1)
    80002bc4:	01871713          	slli	a4,a4,0x18
    80002bc8:	00d76733          	or	a4,a4,a3
    80002bcc:	0144c683          	lbu	a3,20(s1)
    80002bd0:	02069693          	slli	a3,a3,0x20
    80002bd4:	00e6e733          	or	a4,a3,a4
    80002bd8:	0154c683          	lbu	a3,21(s1)
    80002bdc:	02869693          	slli	a3,a3,0x28
    80002be0:	00e6e6b3          	or	a3,a3,a4
    80002be4:	0164c703          	lbu	a4,22(s1)
    80002be8:	03071713          	slli	a4,a4,0x30
    80002bec:	00d766b3          	or	a3,a4,a3
    80002bf0:	0174c703          	lbu	a4,23(s1)
    80002bf4:	03871713          	slli	a4,a4,0x38
    80002bf8:	00d76733          	or	a4,a4,a3
    80002bfc:	41270733          	sub	a4,a4,s2
    80002c00:	fff70713          	addi	a4,a4,-1
    80002c04:	00e78823          	sb	a4,16(a5)
    80002c08:	00875693          	srli	a3,a4,0x8
    80002c0c:	00d788a3          	sb	a3,17(a5)
    80002c10:	01075693          	srli	a3,a4,0x10
    80002c14:	00d78923          	sb	a3,18(a5)
    80002c18:	0187569b          	srliw	a3,a4,0x18
    80002c1c:	00d789a3          	sb	a3,19(a5)
    80002c20:	02075693          	srli	a3,a4,0x20
    80002c24:	00d78a23          	sb	a3,20(a5)
    80002c28:	02875693          	srli	a3,a4,0x28
    80002c2c:	00d78aa3          	sb	a3,21(a5)
    80002c30:	03075693          	srli	a3,a4,0x30
    80002c34:	00d78b23          	sb	a3,22(a5)
    80002c38:	03875713          	srli	a4,a4,0x38
    80002c3c:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80002c40:	0004c703          	lbu	a4,0(s1)
    80002c44:	0014c683          	lbu	a3,1(s1)
    80002c48:	00869693          	slli	a3,a3,0x8
    80002c4c:	00e6e733          	or	a4,a3,a4
    80002c50:	0024c683          	lbu	a3,2(s1)
    80002c54:	01069693          	slli	a3,a3,0x10
    80002c58:	00e6e6b3          	or	a3,a3,a4
    80002c5c:	0034c703          	lbu	a4,3(s1)
    80002c60:	01871713          	slli	a4,a4,0x18
    80002c64:	00d766b3          	or	a3,a4,a3
    80002c68:	0044c703          	lbu	a4,4(s1)
    80002c6c:	02071713          	slli	a4,a4,0x20
    80002c70:	00d76733          	or	a4,a4,a3
    80002c74:	0054c683          	lbu	a3,5(s1)
    80002c78:	02869693          	slli	a3,a3,0x28
    80002c7c:	00e6e733          	or	a4,a3,a4
    80002c80:	0064c683          	lbu	a3,6(s1)
    80002c84:	03069693          	slli	a3,a3,0x30
    80002c88:	00e6e6b3          	or	a3,a3,a4
    80002c8c:	0074c703          	lbu	a4,7(s1)
    80002c90:	03871713          	slli	a4,a4,0x38
    80002c94:	00d76733          	or	a4,a4,a3
    80002c98:	00d78023          	sb	a3,0(a5)
    80002c9c:	00875693          	srli	a3,a4,0x8
    80002ca0:	00d780a3          	sb	a3,1(a5)
    80002ca4:	01075693          	srli	a3,a4,0x10
    80002ca8:	00d78123          	sb	a3,2(a5)
    80002cac:	0187569b          	srliw	a3,a4,0x18
    80002cb0:	00d781a3          	sb	a3,3(a5)
    80002cb4:	02075693          	srli	a3,a4,0x20
    80002cb8:	00d78223          	sb	a3,4(a5)
    80002cbc:	02875693          	srli	a3,a4,0x28
    80002cc0:	00d782a3          	sb	a3,5(a5)
    80002cc4:	03075693          	srli	a3,a4,0x30
    80002cc8:	00d78323          	sb	a3,6(a5)
    80002ccc:	03875713          	srli	a4,a4,0x38
    80002cd0:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80002cd4:	00978423          	sb	s1,8(a5)
    80002cd8:	0084d713          	srli	a4,s1,0x8
    80002cdc:	00e784a3          	sb	a4,9(a5)
    80002ce0:	0104d713          	srli	a4,s1,0x10
    80002ce4:	00e78523          	sb	a4,10(a5)
    80002ce8:	0184d71b          	srliw	a4,s1,0x18
    80002cec:	00e785a3          	sb	a4,11(a5)
    80002cf0:	0204d713          	srli	a4,s1,0x20
    80002cf4:	00e78623          	sb	a4,12(a5)
    80002cf8:	0284d713          	srli	a4,s1,0x28
    80002cfc:	00e786a3          	sb	a4,13(a5)
    80002d00:	0304d713          	srli	a4,s1,0x30
    80002d04:	00e78723          	sb	a4,14(a5)
    80002d08:	0384d713          	srli	a4,s1,0x38
    80002d0c:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    80002d10:	0004c703          	lbu	a4,0(s1)
    80002d14:	0014c683          	lbu	a3,1(s1)
    80002d18:	00869693          	slli	a3,a3,0x8
    80002d1c:	00e6e6b3          	or	a3,a3,a4
    80002d20:	0024c703          	lbu	a4,2(s1)
    80002d24:	01071713          	slli	a4,a4,0x10
    80002d28:	00d766b3          	or	a3,a4,a3
    80002d2c:	0034c703          	lbu	a4,3(s1)
    80002d30:	01871713          	slli	a4,a4,0x18
    80002d34:	00d76733          	or	a4,a4,a3
    80002d38:	0044c683          	lbu	a3,4(s1)
    80002d3c:	02069693          	slli	a3,a3,0x20
    80002d40:	00e6e733          	or	a4,a3,a4
    80002d44:	0054c683          	lbu	a3,5(s1)
    80002d48:	02869693          	slli	a3,a3,0x28
    80002d4c:	00e6e6b3          	or	a3,a3,a4
    80002d50:	0064c703          	lbu	a4,6(s1)
    80002d54:	03071713          	slli	a4,a4,0x30
    80002d58:	00d766b3          	or	a3,a4,a3
    80002d5c:	0074c703          	lbu	a4,7(s1)
    80002d60:	03871713          	slli	a4,a4,0x38
    80002d64:	00d76733          	or	a4,a4,a3
    80002d68:	04070063          	beqz	a4,80002da8 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80002d6c:	00f70423          	sb	a5,8(a4)
    80002d70:	0087d693          	srli	a3,a5,0x8
    80002d74:	00d704a3          	sb	a3,9(a4)
    80002d78:	0107d693          	srli	a3,a5,0x10
    80002d7c:	00d70523          	sb	a3,10(a4)
    80002d80:	0187d69b          	srliw	a3,a5,0x18
    80002d84:	00d705a3          	sb	a3,11(a4)
    80002d88:	0207d693          	srli	a3,a5,0x20
    80002d8c:	00d70623          	sb	a3,12(a4)
    80002d90:	0287d693          	srli	a3,a5,0x28
    80002d94:	00d706a3          	sb	a3,13(a4)
    80002d98:	0307d693          	srli	a3,a5,0x30
    80002d9c:	00d70723          	sb	a3,14(a4)
    80002da0:	0387d693          	srli	a3,a5,0x38
    80002da4:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80002da8:	00f48023          	sb	a5,0(s1)
    80002dac:	0087d713          	srli	a4,a5,0x8
    80002db0:	00e480a3          	sb	a4,1(s1)
    80002db4:	0107d713          	srli	a4,a5,0x10
    80002db8:	00e48123          	sb	a4,2(s1)
    80002dbc:	0187d71b          	srliw	a4,a5,0x18
    80002dc0:	00e481a3          	sb	a4,3(s1)
    80002dc4:	0207d713          	srli	a4,a5,0x20
    80002dc8:	00e48223          	sb	a4,4(s1)
    80002dcc:	0287d713          	srli	a4,a5,0x28
    80002dd0:	00e482a3          	sb	a4,5(s1)
    80002dd4:	0307d713          	srli	a4,a5,0x30
    80002dd8:	00e48323          	sb	a4,6(s1)
    80002ddc:	0387d793          	srli	a5,a5,0x38
    80002de0:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80002de4:	01248823          	sb	s2,16(s1)
    80002de8:	00895793          	srli	a5,s2,0x8
    80002dec:	00f488a3          	sb	a5,17(s1)
    80002df0:	01095793          	srli	a5,s2,0x10
    80002df4:	00f48923          	sb	a5,18(s1)
    80002df8:	0189579b          	srliw	a5,s2,0x18
    80002dfc:	00f489a3          	sb	a5,19(s1)
    80002e00:	02095793          	srli	a5,s2,0x20
    80002e04:	00f48a23          	sb	a5,20(s1)
    80002e08:	02895793          	srli	a5,s2,0x28
    80002e0c:	00f48aa3          	sb	a5,21(s1)
    80002e10:	03095793          	srli	a5,s2,0x30
    80002e14:	00f48b23          	sb	a5,22(s1)
    80002e18:	03895913          	srli	s2,s2,0x38
    80002e1c:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80002e20:	0009b783          	ld	a5,0(s3)
    80002e24:	20978463          	beq	a5,s1,8000302c <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80002e28:	0084c783          	lbu	a5,8(s1)
    80002e2c:	0094c703          	lbu	a4,9(s1)
    80002e30:	00871713          	slli	a4,a4,0x8
    80002e34:	00f76733          	or	a4,a4,a5
    80002e38:	00a4c783          	lbu	a5,10(s1)
    80002e3c:	01079793          	slli	a5,a5,0x10
    80002e40:	00e7e733          	or	a4,a5,a4
    80002e44:	00b4c783          	lbu	a5,11(s1)
    80002e48:	01879793          	slli	a5,a5,0x18
    80002e4c:	00e7e7b3          	or	a5,a5,a4
    80002e50:	00c4c703          	lbu	a4,12(s1)
    80002e54:	02071713          	slli	a4,a4,0x20
    80002e58:	00f767b3          	or	a5,a4,a5
    80002e5c:	00d4c703          	lbu	a4,13(s1)
    80002e60:	02871713          	slli	a4,a4,0x28
    80002e64:	00f76733          	or	a4,a4,a5
    80002e68:	00e4c783          	lbu	a5,14(s1)
    80002e6c:	03079793          	slli	a5,a5,0x30
    80002e70:	00e7e733          	or	a4,a5,a4
    80002e74:	00f4c783          	lbu	a5,15(s1)
    80002e78:	03879793          	slli	a5,a5,0x38
    80002e7c:	00e7e7b3          	or	a5,a5,a4
    80002e80:	08078c63          	beqz	a5,80002f18 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80002e84:	0004c703          	lbu	a4,0(s1)
    80002e88:	0014c683          	lbu	a3,1(s1)
    80002e8c:	00869693          	slli	a3,a3,0x8
    80002e90:	00e6e733          	or	a4,a3,a4
    80002e94:	0024c683          	lbu	a3,2(s1)
    80002e98:	01069693          	slli	a3,a3,0x10
    80002e9c:	00e6e6b3          	or	a3,a3,a4
    80002ea0:	0034c703          	lbu	a4,3(s1)
    80002ea4:	01871713          	slli	a4,a4,0x18
    80002ea8:	00d766b3          	or	a3,a4,a3
    80002eac:	0044c703          	lbu	a4,4(s1)
    80002eb0:	02071713          	slli	a4,a4,0x20
    80002eb4:	00d76733          	or	a4,a4,a3
    80002eb8:	0054c683          	lbu	a3,5(s1)
    80002ebc:	02869693          	slli	a3,a3,0x28
    80002ec0:	00e6e733          	or	a4,a3,a4
    80002ec4:	0064c683          	lbu	a3,6(s1)
    80002ec8:	03069693          	slli	a3,a3,0x30
    80002ecc:	00e6e6b3          	or	a3,a3,a4
    80002ed0:	0074c703          	lbu	a4,7(s1)
    80002ed4:	03871713          	slli	a4,a4,0x38
    80002ed8:	00d76733          	or	a4,a4,a3
    80002edc:	00d78023          	sb	a3,0(a5)
    80002ee0:	00875693          	srli	a3,a4,0x8
    80002ee4:	00d780a3          	sb	a3,1(a5)
    80002ee8:	01075693          	srli	a3,a4,0x10
    80002eec:	00d78123          	sb	a3,2(a5)
    80002ef0:	0187569b          	srliw	a3,a4,0x18
    80002ef4:	00d781a3          	sb	a3,3(a5)
    80002ef8:	02075693          	srli	a3,a4,0x20
    80002efc:	00d78223          	sb	a3,4(a5)
    80002f00:	02875693          	srli	a3,a4,0x28
    80002f04:	00d782a3          	sb	a3,5(a5)
    80002f08:	03075693          	srli	a3,a4,0x30
    80002f0c:	00d78323          	sb	a3,6(a5)
    80002f10:	03875713          	srli	a4,a4,0x38
    80002f14:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80002f18:	0004c783          	lbu	a5,0(s1)
    80002f1c:	0014c703          	lbu	a4,1(s1)
    80002f20:	00871713          	slli	a4,a4,0x8
    80002f24:	00f76733          	or	a4,a4,a5
    80002f28:	0024c783          	lbu	a5,2(s1)
    80002f2c:	01079793          	slli	a5,a5,0x10
    80002f30:	00e7e733          	or	a4,a5,a4
    80002f34:	0034c783          	lbu	a5,3(s1)
    80002f38:	01879793          	slli	a5,a5,0x18
    80002f3c:	00e7e7b3          	or	a5,a5,a4
    80002f40:	0044c703          	lbu	a4,4(s1)
    80002f44:	02071713          	slli	a4,a4,0x20
    80002f48:	00f767b3          	or	a5,a4,a5
    80002f4c:	0054c703          	lbu	a4,5(s1)
    80002f50:	02871713          	slli	a4,a4,0x28
    80002f54:	00f76733          	or	a4,a4,a5
    80002f58:	0064c783          	lbu	a5,6(s1)
    80002f5c:	03079793          	slli	a5,a5,0x30
    80002f60:	00e7e733          	or	a4,a5,a4
    80002f64:	0074c783          	lbu	a5,7(s1)
    80002f68:	03879793          	slli	a5,a5,0x38
    80002f6c:	00e7e7b3          	or	a5,a5,a4
    80002f70:	08078c63          	beqz	a5,80003008 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80002f74:	0084c703          	lbu	a4,8(s1)
    80002f78:	0094c683          	lbu	a3,9(s1)
    80002f7c:	00869693          	slli	a3,a3,0x8
    80002f80:	00e6e733          	or	a4,a3,a4
    80002f84:	00a4c683          	lbu	a3,10(s1)
    80002f88:	01069693          	slli	a3,a3,0x10
    80002f8c:	00e6e6b3          	or	a3,a3,a4
    80002f90:	00b4c703          	lbu	a4,11(s1)
    80002f94:	01871713          	slli	a4,a4,0x18
    80002f98:	00d766b3          	or	a3,a4,a3
    80002f9c:	00c4c703          	lbu	a4,12(s1)
    80002fa0:	02071713          	slli	a4,a4,0x20
    80002fa4:	00d76733          	or	a4,a4,a3
    80002fa8:	00d4c683          	lbu	a3,13(s1)
    80002fac:	02869693          	slli	a3,a3,0x28
    80002fb0:	00e6e733          	or	a4,a3,a4
    80002fb4:	00e4c683          	lbu	a3,14(s1)
    80002fb8:	03069693          	slli	a3,a3,0x30
    80002fbc:	00e6e6b3          	or	a3,a3,a4
    80002fc0:	00f4c703          	lbu	a4,15(s1)
    80002fc4:	03871713          	slli	a4,a4,0x38
    80002fc8:	00d76733          	or	a4,a4,a3
    80002fcc:	00d78423          	sb	a3,8(a5)
    80002fd0:	00875693          	srli	a3,a4,0x8
    80002fd4:	00d784a3          	sb	a3,9(a5)
    80002fd8:	01075693          	srli	a3,a4,0x10
    80002fdc:	00d78523          	sb	a3,10(a5)
    80002fe0:	0187569b          	srliw	a3,a4,0x18
    80002fe4:	00d785a3          	sb	a3,11(a5)
    80002fe8:	02075693          	srli	a3,a4,0x20
    80002fec:	00d78623          	sb	a3,12(a5)
    80002ff0:	02875693          	srli	a3,a4,0x28
    80002ff4:	00d786a3          	sb	a3,13(a5)
    80002ff8:	03075693          	srli	a3,a4,0x30
    80002ffc:	00d78723          	sb	a3,14(a5)
    80003000:	03875713          	srli	a4,a4,0x38
    80003004:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    80003008:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    8000300c:	00048513          	mv	a0,s1
    80003010:	02813083          	ld	ra,40(sp)
    80003014:	02013403          	ld	s0,32(sp)
    80003018:	01813483          	ld	s1,24(sp)
    8000301c:	01013903          	ld	s2,16(sp)
    80003020:	00813983          	ld	s3,8(sp)
    80003024:	03010113          	addi	sp,sp,48
    80003028:	00008067          	ret
                m_pHead = pCurrent->pNext;
    8000302c:	0004c703          	lbu	a4,0(s1)
    80003030:	0014c783          	lbu	a5,1(s1)
    80003034:	00879793          	slli	a5,a5,0x8
    80003038:	00e7e7b3          	or	a5,a5,a4
    8000303c:	0024c703          	lbu	a4,2(s1)
    80003040:	01071713          	slli	a4,a4,0x10
    80003044:	00f76733          	or	a4,a4,a5
    80003048:	0034c783          	lbu	a5,3(s1)
    8000304c:	01879793          	slli	a5,a5,0x18
    80003050:	00e7e733          	or	a4,a5,a4
    80003054:	0044c783          	lbu	a5,4(s1)
    80003058:	02079793          	slli	a5,a5,0x20
    8000305c:	00e7e7b3          	or	a5,a5,a4
    80003060:	0054c703          	lbu	a4,5(s1)
    80003064:	02871713          	slli	a4,a4,0x28
    80003068:	00f76733          	or	a4,a4,a5
    8000306c:	0064c783          	lbu	a5,6(s1)
    80003070:	03079793          	slli	a5,a5,0x30
    80003074:	00e7e733          	or	a4,a5,a4
    80003078:	0074c783          	lbu	a5,7(s1)
    8000307c:	03879793          	slli	a5,a5,0x38
    80003080:	00e7e7b3          	or	a5,a5,a4
    80003084:	00f9b023          	sd	a5,0(s3)
    80003088:	da1ff06f          	j	80002e28 <_ZN11HeapManager12heapAllocateEm+0x3f4>

000000008000308c <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    8000308c:	fd010113          	addi	sp,sp,-48
    80003090:	02113423          	sd	ra,40(sp)
    80003094:	02813023          	sd	s0,32(sp)
    80003098:	00913c23          	sd	s1,24(sp)
    8000309c:	01213823          	sd	s2,16(sp)
    800030a0:	01313423          	sd	s3,8(sp)
    800030a4:	01413023          	sd	s4,0(sp)
    800030a8:	03010413          	addi	s0,sp,48
    800030ac:	00050a13          	mv	s4,a0
    800030b0:	00058993          	mv	s3,a1
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pAddress) - MEM_BLOCK_SIZE);
    800030b4:	fc058913          	addi	s2,a1,-64
    
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    800030b8:	fd85c783          	lbu	a5,-40(a1)
    800030bc:	fd95c703          	lbu	a4,-39(a1)
    800030c0:	00871713          	slli	a4,a4,0x8
    800030c4:	00f76733          	or	a4,a4,a5
    800030c8:	fda5c783          	lbu	a5,-38(a1)
    800030cc:	01079793          	slli	a5,a5,0x10
    800030d0:	00e7e733          	or	a4,a5,a4
    800030d4:	fdb5c783          	lbu	a5,-37(a1)
    800030d8:	01879793          	slli	a5,a5,0x18
    800030dc:	00e7e7b3          	or	a5,a5,a4
    800030e0:	0007879b          	sext.w	a5,a5
    800030e4:	deadc737          	lui	a4,0xdeadc
    800030e8:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2d9e>
    800030ec:	12e79663          	bne	a5,a4,80003218 <_ZN11HeapManager8heapFreeEPv+0x18c>
    HeapFreeSectionHeader* pInsert = m_pHead;
    800030f0:	000a3483          	ld	s1,0(s4)

    if(pInsert == 0 || pInsert->pNext >= pAddress){
    800030f4:	06048063          	beqz	s1,80003154 <_ZN11HeapManager8heapFreeEPv+0xc8>
    800030f8:	0004c783          	lbu	a5,0(s1)
    800030fc:	0014c703          	lbu	a4,1(s1)
    80003100:	00871713          	slli	a4,a4,0x8
    80003104:	00f76733          	or	a4,a4,a5
    80003108:	0024c783          	lbu	a5,2(s1)
    8000310c:	01079793          	slli	a5,a5,0x10
    80003110:	00e7e733          	or	a4,a5,a4
    80003114:	0034c783          	lbu	a5,3(s1)
    80003118:	01879793          	slli	a5,a5,0x18
    8000311c:	00e7e7b3          	or	a5,a5,a4
    80003120:	0044c703          	lbu	a4,4(s1)
    80003124:	02071713          	slli	a4,a4,0x20
    80003128:	00f767b3          	or	a5,a4,a5
    8000312c:	0054c703          	lbu	a4,5(s1)
    80003130:	02871713          	slli	a4,a4,0x28
    80003134:	00f76733          	or	a4,a4,a5
    80003138:	0064c783          	lbu	a5,6(s1)
    8000313c:	03079793          	slli	a5,a5,0x30
    80003140:	00e7e733          	or	a4,a5,a4
    80003144:	0074c783          	lbu	a5,7(s1)
    80003148:	03879793          	slli	a5,a5,0x38
    8000314c:	00e7e7b3          	or	a5,a5,a4
    80003150:	1537e463          	bltu	a5,s3,80003298 <_ZN11HeapManager8heapFreeEPv+0x20c>
        pFree->pNext = m_pHead;
    80003154:	fc998023          	sb	s1,-64(s3)
    80003158:	0084d793          	srli	a5,s1,0x8
    8000315c:	00f900a3          	sb	a5,1(s2)
    80003160:	0104d793          	srli	a5,s1,0x10
    80003164:	00f90123          	sb	a5,2(s2)
    80003168:	0184d79b          	srliw	a5,s1,0x18
    8000316c:	00f901a3          	sb	a5,3(s2)
    80003170:	0204d793          	srli	a5,s1,0x20
    80003174:	00f90223          	sb	a5,4(s2)
    80003178:	0284d793          	srli	a5,s1,0x28
    8000317c:	00f902a3          	sb	a5,5(s2)
    80003180:	0304d793          	srli	a5,s1,0x30
    80003184:	00f90323          	sb	a5,6(s2)
    80003188:	0384d493          	srli	s1,s1,0x38
    8000318c:	009903a3          	sb	s1,7(s2)
        m_pHead->pPrev = pFree;
    80003190:	000a3783          	ld	a5,0(s4)
    80003194:	01278423          	sb	s2,8(a5)
    80003198:	00895713          	srli	a4,s2,0x8
    8000319c:	00e784a3          	sb	a4,9(a5)
    800031a0:	01095713          	srli	a4,s2,0x10
    800031a4:	00e78523          	sb	a4,10(a5)
    800031a8:	0189571b          	srliw	a4,s2,0x18
    800031ac:	00e785a3          	sb	a4,11(a5)
    800031b0:	02095713          	srli	a4,s2,0x20
    800031b4:	00e78623          	sb	a4,12(a5)
    800031b8:	02895713          	srli	a4,s2,0x28
    800031bc:	00e786a3          	sb	a4,13(a5)
    800031c0:	03095713          	srli	a4,s2,0x30
    800031c4:	00e78723          	sb	a4,14(a5)
    800031c8:	03895713          	srli	a4,s2,0x38
    800031cc:	00e787a3          	sb	a4,15(a5)
        m_pHead = pFree;
    800031d0:	012a3023          	sd	s2,0(s4)
        pFree->pNext = 0;
    800031d4:	fc098023          	sb	zero,-64(s3)
    800031d8:	000900a3          	sb	zero,1(s2)
    800031dc:	00090123          	sb	zero,2(s2)
    800031e0:	000901a3          	sb	zero,3(s2)
    800031e4:	00090223          	sb	zero,4(s2)
    800031e8:	000902a3          	sb	zero,5(s2)
    800031ec:	00090323          	sb	zero,6(s2)
    800031f0:	000903a3          	sb	zero,7(s2)
    //     }else{
    //         m_pTail = pFree;
    //     }
    // }
    return 0;
}
    800031f4:	00000513          	li	a0,0
    800031f8:	02813083          	ld	ra,40(sp)
    800031fc:	02013403          	ld	s0,32(sp)
    80003200:	01813483          	ld	s1,24(sp)
    80003204:	01013903          	ld	s2,16(sp)
    80003208:	00813983          	ld	s3,8(sp)
    8000320c:	00013a03          	ld	s4,0(sp)
    80003210:	03010113          	addi	sp,sp,48
    80003214:	00008067          	ret
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003218:	00004697          	auipc	a3,0x4
    8000321c:	fc068693          	addi	a3,a3,-64 # 800071d8 <CONSOLE_STATUS+0x1c8>
    80003220:	05600613          	li	a2,86
    80003224:	00004597          	auipc	a1,0x4
    80003228:	ed458593          	addi	a1,a1,-300 # 800070f8 <CONSOLE_STATUS+0xe8>
    8000322c:	00004517          	auipc	a0,0x4
    80003230:	fd450513          	addi	a0,a0,-44 # 80007200 <CONSOLE_STATUS+0x1f0>
    80003234:	ffffe097          	auipc	ra,0xffffe
    80003238:	6ac080e7          	jalr	1708(ra) # 800018e0 <_Z13assert_failedPKcS0_jS0_>
    8000323c:	eb5ff06f          	j	800030f0 <_ZN11HeapManager8heapFreeEPv+0x64>
            pInsert = pInsert->pNext;
    80003240:	0004c703          	lbu	a4,0(s1)
    80003244:	0014c783          	lbu	a5,1(s1)
    80003248:	00879793          	slli	a5,a5,0x8
    8000324c:	00e7e733          	or	a4,a5,a4
    80003250:	0024c783          	lbu	a5,2(s1)
    80003254:	01079793          	slli	a5,a5,0x10
    80003258:	00e7e7b3          	or	a5,a5,a4
    8000325c:	0034c703          	lbu	a4,3(s1)
    80003260:	01871713          	slli	a4,a4,0x18
    80003264:	00f767b3          	or	a5,a4,a5
    80003268:	0044c703          	lbu	a4,4(s1)
    8000326c:	02071713          	slli	a4,a4,0x20
    80003270:	00f76733          	or	a4,a4,a5
    80003274:	0054c783          	lbu	a5,5(s1)
    80003278:	02879793          	slli	a5,a5,0x28
    8000327c:	00e7e733          	or	a4,a5,a4
    80003280:	0064c783          	lbu	a5,6(s1)
    80003284:	03079793          	slli	a5,a5,0x30
    80003288:	00e7e7b3          	or	a5,a5,a4
    8000328c:	0074c483          	lbu	s1,7(s1)
    80003290:	03849493          	slli	s1,s1,0x38
    80003294:	00f4e4b3          	or	s1,s1,a5
        while(pInsert->pNext != 0 && pInsert->pNext < pAddress){
    80003298:	0004c783          	lbu	a5,0(s1)
    8000329c:	0014c703          	lbu	a4,1(s1)
    800032a0:	00871713          	slli	a4,a4,0x8
    800032a4:	00f76733          	or	a4,a4,a5
    800032a8:	0024c783          	lbu	a5,2(s1)
    800032ac:	01079793          	slli	a5,a5,0x10
    800032b0:	00e7e733          	or	a4,a5,a4
    800032b4:	0034c783          	lbu	a5,3(s1)
    800032b8:	01879793          	slli	a5,a5,0x18
    800032bc:	00e7e7b3          	or	a5,a5,a4
    800032c0:	0044c703          	lbu	a4,4(s1)
    800032c4:	02071713          	slli	a4,a4,0x20
    800032c8:	00f767b3          	or	a5,a4,a5
    800032cc:	0054c703          	lbu	a4,5(s1)
    800032d0:	02871713          	slli	a4,a4,0x28
    800032d4:	00f76733          	or	a4,a4,a5
    800032d8:	0064c783          	lbu	a5,6(s1)
    800032dc:	03079793          	slli	a5,a5,0x30
    800032e0:	00e7e733          	or	a4,a5,a4
    800032e4:	0074c783          	lbu	a5,7(s1)
    800032e8:	03879793          	slli	a5,a5,0x38
    800032ec:	00e7e7b3          	or	a5,a5,a4
    800032f0:	06078463          	beqz	a5,80003358 <_ZN11HeapManager8heapFreeEPv+0x2cc>
    800032f4:	0737f263          	bgeu	a5,s3,80003358 <_ZN11HeapManager8heapFreeEPv+0x2cc>
            assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    800032f8:	0184c783          	lbu	a5,24(s1)
    800032fc:	0194c703          	lbu	a4,25(s1)
    80003300:	00871713          	slli	a4,a4,0x8
    80003304:	00f76733          	or	a4,a4,a5
    80003308:	01a4c783          	lbu	a5,26(s1)
    8000330c:	01079793          	slli	a5,a5,0x10
    80003310:	00e7e733          	or	a4,a5,a4
    80003314:	01b4c783          	lbu	a5,27(s1)
    80003318:	01879793          	slli	a5,a5,0x18
    8000331c:	00e7e7b3          	or	a5,a5,a4
    80003320:	0007879b          	sext.w	a5,a5
    80003324:	deadc737          	lui	a4,0xdeadc
    80003328:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2d9e>
    8000332c:	f0e78ae3          	beq	a5,a4,80003240 <_ZN11HeapManager8heapFreeEPv+0x1b4>
    80003330:	00004697          	auipc	a3,0x4
    80003334:	ea868693          	addi	a3,a3,-344 # 800071d8 <CONSOLE_STATUS+0x1c8>
    80003338:	06000613          	li	a2,96
    8000333c:	00004597          	auipc	a1,0x4
    80003340:	dbc58593          	addi	a1,a1,-580 # 800070f8 <CONSOLE_STATUS+0xe8>
    80003344:	00004517          	auipc	a0,0x4
    80003348:	ee450513          	addi	a0,a0,-284 # 80007228 <CONSOLE_STATUS+0x218>
    8000334c:	ffffe097          	auipc	ra,0xffffe
    80003350:	594080e7          	jalr	1428(ra) # 800018e0 <_Z13assert_failedPKcS0_jS0_>
    80003354:	eedff06f          	j	80003240 <_ZN11HeapManager8heapFreeEPv+0x1b4>
        pFree->pNext = pInsert->pNext;
    80003358:	fcf98023          	sb	a5,-64(s3)
    8000335c:	0087d713          	srli	a4,a5,0x8
    80003360:	00e900a3          	sb	a4,1(s2)
    80003364:	0107d713          	srli	a4,a5,0x10
    80003368:	00e90123          	sb	a4,2(s2)
    8000336c:	0187d71b          	srliw	a4,a5,0x18
    80003370:	00e901a3          	sb	a4,3(s2)
    80003374:	0207d713          	srli	a4,a5,0x20
    80003378:	00e90223          	sb	a4,4(s2)
    8000337c:	0287d713          	srli	a4,a5,0x28
    80003380:	00e902a3          	sb	a4,5(s2)
    80003384:	0307d713          	srli	a4,a5,0x30
    80003388:	00e90323          	sb	a4,6(s2)
    8000338c:	0387d793          	srli	a5,a5,0x38
    80003390:	00f903a3          	sb	a5,7(s2)
        pFree->pPrev = pInsert;
    80003394:	00990423          	sb	s1,8(s2)
    80003398:	0084d793          	srli	a5,s1,0x8
    8000339c:	00f904a3          	sb	a5,9(s2)
    800033a0:	0104d793          	srli	a5,s1,0x10
    800033a4:	00f90523          	sb	a5,10(s2)
    800033a8:	0184d79b          	srliw	a5,s1,0x18
    800033ac:	00f905a3          	sb	a5,11(s2)
    800033b0:	0204d793          	srli	a5,s1,0x20
    800033b4:	00f90623          	sb	a5,12(s2)
    800033b8:	0284d793          	srli	a5,s1,0x28
    800033bc:	00f906a3          	sb	a5,13(s2)
    800033c0:	0304d793          	srli	a5,s1,0x30
    800033c4:	00f90723          	sb	a5,14(s2)
    800033c8:	0384d793          	srli	a5,s1,0x38
    800033cc:	00f907a3          	sb	a5,15(s2)
        if(pInsert->pNext != 0){
    800033d0:	0004c783          	lbu	a5,0(s1)
    800033d4:	0014c703          	lbu	a4,1(s1)
    800033d8:	00871713          	slli	a4,a4,0x8
    800033dc:	00f76733          	or	a4,a4,a5
    800033e0:	0024c783          	lbu	a5,2(s1)
    800033e4:	01079793          	slli	a5,a5,0x10
    800033e8:	00e7e733          	or	a4,a5,a4
    800033ec:	0034c783          	lbu	a5,3(s1)
    800033f0:	01879793          	slli	a5,a5,0x18
    800033f4:	00e7e7b3          	or	a5,a5,a4
    800033f8:	0044c703          	lbu	a4,4(s1)
    800033fc:	02071713          	slli	a4,a4,0x20
    80003400:	00f767b3          	or	a5,a4,a5
    80003404:	0054c703          	lbu	a4,5(s1)
    80003408:	02871713          	slli	a4,a4,0x28
    8000340c:	00f76733          	or	a4,a4,a5
    80003410:	0064c783          	lbu	a5,6(s1)
    80003414:	03079793          	slli	a5,a5,0x30
    80003418:	00e7e733          	or	a4,a5,a4
    8000341c:	0074c783          	lbu	a5,7(s1)
    80003420:	03879793          	slli	a5,a5,0x38
    80003424:	00e7e7b3          	or	a5,a5,a4
    80003428:	04078063          	beqz	a5,80003468 <_ZN11HeapManager8heapFreeEPv+0x3dc>
            pInsert->pNext->pPrev = pFree;
    8000342c:	01278423          	sb	s2,8(a5)
    80003430:	00895713          	srli	a4,s2,0x8
    80003434:	00e784a3          	sb	a4,9(a5)
    80003438:	01095713          	srli	a4,s2,0x10
    8000343c:	00e78523          	sb	a4,10(a5)
    80003440:	0189571b          	srliw	a4,s2,0x18
    80003444:	00e785a3          	sb	a4,11(a5)
    80003448:	02095713          	srli	a4,s2,0x20
    8000344c:	00e78623          	sb	a4,12(a5)
    80003450:	02895713          	srli	a4,s2,0x28
    80003454:	00e786a3          	sb	a4,13(a5)
    80003458:	03095713          	srli	a4,s2,0x30
    8000345c:	00e78723          	sb	a4,14(a5)
    80003460:	03895713          	srli	a4,s2,0x38
    80003464:	00e787a3          	sb	a4,15(a5)
        pInsert->pNext = pFree;
    80003468:	01248023          	sb	s2,0(s1)
    8000346c:	00895793          	srli	a5,s2,0x8
    80003470:	00f480a3          	sb	a5,1(s1)
    80003474:	01095793          	srli	a5,s2,0x10
    80003478:	00f48123          	sb	a5,2(s1)
    8000347c:	0189579b          	srliw	a5,s2,0x18
    80003480:	00f481a3          	sb	a5,3(s1)
    80003484:	02095793          	srli	a5,s2,0x20
    80003488:	00f48223          	sb	a5,4(s1)
    8000348c:	02895793          	srli	a5,s2,0x28
    80003490:	00f482a3          	sb	a5,5(s1)
    80003494:	03095793          	srli	a5,s2,0x30
    80003498:	00f48323          	sb	a5,6(s1)
    8000349c:	03895913          	srli	s2,s2,0x38
    800034a0:	012483a3          	sb	s2,7(s1)
    800034a4:	d51ff06f          	j	800031f4 <_ZN11HeapManager8heapFreeEPv+0x168>

00000000800034a8 <exceptionHandler>:
#include "sem.h"
#include "timer.h"
#include "assert.h"


extern "C" void exceptionHandler(){
    800034a8:	fc010113          	addi	sp,sp,-64
    800034ac:	02113c23          	sd	ra,56(sp)
    800034b0:	02813823          	sd	s0,48(sp)
    800034b4:	02913423          	sd	s1,40(sp)
    800034b8:	03213023          	sd	s2,32(sp)
    800034bc:	01313c23          	sd	s3,24(sp)
    800034c0:	01413823          	sd	s4,16(sp)
    800034c4:	01513423          	sd	s5,8(sp)
    800034c8:	04010413          	addi	s0,sp,64
    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    800034cc:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    800034d0:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    800034d4:	141024f3          	csrr	s1,sepc

    uint64 a0 = 0;
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    800034d8:	00050793          	mv	a5,a0

    uint64 a1, a2, a3, a4;
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    800034dc:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    800034e0:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    800034e4:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    800034e8:	00070693          	mv	a3,a4

    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    800034ec:	ff870613          	addi	a2,a4,-8
    800034f0:	00100693          	li	a3,1
    800034f4:	16c6fe63          	bgeu	a3,a2,80003670 <exceptionHandler+0x1c8>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, 0x2");
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    800034f8:	00500793          	li	a5,5
    800034fc:	30f70a63          	beq	a4,a5,80003810 <exceptionHandler+0x368>
                __putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    80003500:	00700793          	li	a5,7
    80003504:	1af71e63          	bne	a4,a5,800036c0 <exceptionHandler+0x218>
        __putc('\n');
    80003508:	00a00513          	li	a0,10
    8000350c:	00003097          	auipc	ra,0x3
    80003510:	9f0080e7          	jalr	-1552(ra) # 80005efc <__putc>
        __putc('E');
    80003514:	04500513          	li	a0,69
    80003518:	00003097          	auipc	ra,0x3
    8000351c:	9e4080e7          	jalr	-1564(ra) # 80005efc <__putc>
        __putc('r');
    80003520:	07200513          	li	a0,114
    80003524:	00003097          	auipc	ra,0x3
    80003528:	9d8080e7          	jalr	-1576(ra) # 80005efc <__putc>
        __putc('r');
    8000352c:	07200513          	li	a0,114
    80003530:	00003097          	auipc	ra,0x3
    80003534:	9cc080e7          	jalr	-1588(ra) # 80005efc <__putc>
        __putc('o');
    80003538:	06f00513          	li	a0,111
    8000353c:	00003097          	auipc	ra,0x3
    80003540:	9c0080e7          	jalr	-1600(ra) # 80005efc <__putc>
        __putc('r');
    80003544:	07200513          	li	a0,114
    80003548:	00003097          	auipc	ra,0x3
    8000354c:	9b4080e7          	jalr	-1612(ra) # 80005efc <__putc>
        __putc(':');
    80003550:	03a00513          	li	a0,58
    80003554:	00003097          	auipc	ra,0x3
    80003558:	9a8080e7          	jalr	-1624(ra) # 80005efc <__putc>
        __putc(' ');
    8000355c:	02000513          	li	a0,32
    80003560:	00003097          	auipc	ra,0x3
    80003564:	99c080e7          	jalr	-1636(ra) # 80005efc <__putc>
        __putc('i');
    80003568:	06900513          	li	a0,105
    8000356c:	00003097          	auipc	ra,0x3
    80003570:	990080e7          	jalr	-1648(ra) # 80005efc <__putc>
        __putc('l');
    80003574:	06c00513          	li	a0,108
    80003578:	00003097          	auipc	ra,0x3
    8000357c:	984080e7          	jalr	-1660(ra) # 80005efc <__putc>
        __putc('l');
    80003580:	06c00513          	li	a0,108
    80003584:	00003097          	auipc	ra,0x3
    80003588:	978080e7          	jalr	-1672(ra) # 80005efc <__putc>
        __putc('e');
    8000358c:	06500513          	li	a0,101
    80003590:	00003097          	auipc	ra,0x3
    80003594:	96c080e7          	jalr	-1684(ra) # 80005efc <__putc>
        __putc('g');
    80003598:	06700513          	li	a0,103
    8000359c:	00003097          	auipc	ra,0x3
    800035a0:	960080e7          	jalr	-1696(ra) # 80005efc <__putc>
        __putc('a');
    800035a4:	06100513          	li	a0,97
    800035a8:	00003097          	auipc	ra,0x3
    800035ac:	954080e7          	jalr	-1708(ra) # 80005efc <__putc>
        __putc('l');
    800035b0:	06c00513          	li	a0,108
    800035b4:	00003097          	auipc	ra,0x3
    800035b8:	948080e7          	jalr	-1720(ra) # 80005efc <__putc>
        __putc(' ');
    800035bc:	02000513          	li	a0,32
    800035c0:	00003097          	auipc	ra,0x3
    800035c4:	93c080e7          	jalr	-1732(ra) # 80005efc <__putc>
        __putc('w');
    800035c8:	07700513          	li	a0,119
    800035cc:	00003097          	auipc	ra,0x3
    800035d0:	930080e7          	jalr	-1744(ra) # 80005efc <__putc>
        __putc('r');
    800035d4:	07200513          	li	a0,114
    800035d8:	00003097          	auipc	ra,0x3
    800035dc:	924080e7          	jalr	-1756(ra) # 80005efc <__putc>
        __putc('i');
    800035e0:	06900513          	li	a0,105
    800035e4:	00003097          	auipc	ra,0x3
    800035e8:	918080e7          	jalr	-1768(ra) # 80005efc <__putc>
        __putc('t');
    800035ec:	07400513          	li	a0,116
    800035f0:	00003097          	auipc	ra,0x3
    800035f4:	90c080e7          	jalr	-1780(ra) # 80005efc <__putc>
        __putc('e');
    800035f8:	06500513          	li	a0,101
    800035fc:	00003097          	auipc	ra,0x3
    80003600:	900080e7          	jalr	-1792(ra) # 80005efc <__putc>
        __putc('!');
    80003604:	02100513          	li	a0,33
    80003608:	00003097          	auipc	ra,0x3
    8000360c:	8f4080e7          	jalr	-1804(ra) # 80005efc <__putc>
        uint64 pc;
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80003610:	14102973          	csrr	s2,sepc
        __putc('\n');
    80003614:	00a00513          	li	a0,10
    80003618:	00003097          	auipc	ra,0x3
    8000361c:	8e4080e7          	jalr	-1820(ra) # 80005efc <__putc>
        __putc('P');
    80003620:	05000513          	li	a0,80
    80003624:	00003097          	auipc	ra,0x3
    80003628:	8d8080e7          	jalr	-1832(ra) # 80005efc <__putc>
        __putc('C');
    8000362c:	04300513          	li	a0,67
    80003630:	00003097          	auipc	ra,0x3
    80003634:	8cc080e7          	jalr	-1844(ra) # 80005efc <__putc>
        __putc(':');
    80003638:	03a00513          	li	a0,58
    8000363c:	00003097          	auipc	ra,0x3
    80003640:	8c0080e7          	jalr	-1856(ra) # 80005efc <__putc>
        __putc(' ');
    80003644:	02000513          	li	a0,32
    80003648:	00003097          	auipc	ra,0x3
    8000364c:	8b4080e7          	jalr	-1868(ra) # 80005efc <__putc>
        __putc('0');
    80003650:	03000513          	li	a0,48
    80003654:	00003097          	auipc	ra,0x3
    80003658:	8a8080e7          	jalr	-1880(ra) # 80005efc <__putc>
        __putc('x');
    8000365c:	07800513          	li	a0,120
    80003660:	00003097          	auipc	ra,0x3
    80003664:	89c080e7          	jalr	-1892(ra) # 80005efc <__putc>
        for(int i = 15; i >= 0; i--){
    80003668:	00f00493          	li	s1,15
    8000366c:	3700006f          	j	800039dc <exceptionHandler+0x534>
        switch(a0){
    80003670:	04200713          	li	a4,66
    80003674:	18f76a63          	bltu	a4,a5,80003808 <exceptionHandler+0x360>
    80003678:	00279793          	slli	a5,a5,0x2
    8000367c:	00004717          	auipc	a4,0x4
    80003680:	c1470713          	addi	a4,a4,-1004 # 80007290 <CONSOLE_STATUS+0x280>
    80003684:	00e787b3          	add	a5,a5,a4
    80003688:	0007a783          	lw	a5,0(a5)
    8000368c:	00e787b3          	add	a5,a5,a4
    80003690:	00078067          	jr	a5
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80003694:	00098593          	mv	a1,s3
    80003698:	00005797          	auipc	a5,0x5
    8000369c:	9987b783          	ld	a5,-1640(a5) # 80008030 <_GLOBAL_OFFSET_TABLE_+0x18>
    800036a0:	0007b503          	ld	a0,0(a5)
    800036a4:	fffff097          	auipc	ra,0xfffff
    800036a8:	390080e7          	jalr	912(ra) # 80002a34 <_ZN11HeapManager12heapAllocateEm>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800036ac:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800036b0:	00448493          	addi	s1,s1,4
    800036b4:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800036b8:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, 0x2");
    800036bc:	14417073          	csrci	sip,2
    //     Timer::getInstance().tick();
    //     __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    //     __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    //     __asm__ volatile("csrc sip, 0x2");
    // }
    800036c0:	03813083          	ld	ra,56(sp)
    800036c4:	03013403          	ld	s0,48(sp)
    800036c8:	02813483          	ld	s1,40(sp)
    800036cc:	02013903          	ld	s2,32(sp)
    800036d0:	01813983          	ld	s3,24(sp)
    800036d4:	01013a03          	ld	s4,16(sp)
    800036d8:	00813a83          	ld	s5,8(sp)
    800036dc:	04010113          	addi	sp,sp,64
    800036e0:	00008067          	ret
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    800036e4:	00098593          	mv	a1,s3
    800036e8:	00005797          	auipc	a5,0x5
    800036ec:	9487b783          	ld	a5,-1720(a5) # 80008030 <_GLOBAL_OFFSET_TABLE_+0x18>
    800036f0:	0007b503          	ld	a0,0(a5)
    800036f4:	00000097          	auipc	ra,0x0
    800036f8:	998080e7          	jalr	-1640(ra) # 8000308c <_ZN11HeapManager8heapFreeEPv>
                break;
    800036fc:	fb1ff06f          	j	800036ac <exceptionHandler+0x204>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)((uint64)HeapManager::getInstance().heapAllocate(DEFAULT_STACK_SIZE / MEM_BLOCK_SIZE) + DEFAULT_STACK_SIZE - 1));
    80003700:	04000593          	li	a1,64
    80003704:	00005797          	auipc	a5,0x5
    80003708:	92c7b783          	ld	a5,-1748(a5) # 80008030 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000370c:	0007b503          	ld	a0,0(a5)
    80003710:	fffff097          	auipc	ra,0xfffff
    80003714:	324080e7          	jalr	804(ra) # 80002a34 <_ZN11HeapManager12heapAllocateEm>
    80003718:	00100713          	li	a4,1
    8000371c:	000017b7          	lui	a5,0x1
    80003720:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80003724:	00f506b3          	add	a3,a0,a5
    80003728:	000a8613          	mv	a2,s5
    8000372c:	000a0593          	mv	a1,s4
    80003730:	00098513          	mv	a0,s3
    80003734:	fffff097          	auipc	ra,0xfffff
    80003738:	a88080e7          	jalr	-1400(ra) # 800021bc <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    8000373c:	f71ff06f          	j	800036ac <exceptionHandler+0x204>
                returnVal = _thread::currentThread->exit();
    80003740:	fffff097          	auipc	ra,0xfffff
    80003744:	f30080e7          	jalr	-208(ra) # 80002670 <_ZN7_thread4exitEv>
                break;
    80003748:	f65ff06f          	j	800036ac <exceptionHandler+0x204>
                _thread::dispatch();
    8000374c:	fffff097          	auipc	ra,0xfffff
    80003750:	d70080e7          	jalr	-656(ra) # 800024bc <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80003754:	00000513          	li	a0,0
                break;
    80003758:	f55ff06f          	j	800036ac <exceptionHandler+0x204>
                _thread::currentThread->join((thread_t)a1);
    8000375c:	00098593          	mv	a1,s3
    80003760:	00005797          	auipc	a5,0x5
    80003764:	8f07b783          	ld	a5,-1808(a5) # 80008050 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003768:	0007b503          	ld	a0,0(a5)
    8000376c:	fffff097          	auipc	ra,0xfffff
    80003770:	de8080e7          	jalr	-536(ra) # 80002554 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80003774:	00000513          	li	a0,0
                break;
    80003778:	f35ff06f          	j	800036ac <exceptionHandler+0x204>
                _sem::open((sem_t*)a1, unsigned(a2));
    8000377c:	000a059b          	sext.w	a1,s4
    80003780:	00098513          	mv	a0,s3
    80003784:	ffffe097          	auipc	ra,0xffffe
    80003788:	ec0080e7          	jalr	-320(ra) # 80001644 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    8000378c:	00000513          	li	a0,0
                break;
    80003790:	f1dff06f          	j	800036ac <exceptionHandler+0x204>
                _sem::close((sem_t)a1);
    80003794:	00098513          	mv	a0,s3
    80003798:	ffffe097          	auipc	ra,0xffffe
    8000379c:	f08080e7          	jalr	-248(ra) # 800016a0 <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    800037a0:	00000513          	li	a0,0
                break;
    800037a4:	f09ff06f          	j	800036ac <exceptionHandler+0x204>
                _sem::wait((sem_t)a1);
    800037a8:	00098513          	mv	a0,s3
    800037ac:	ffffe097          	auipc	ra,0xffffe
    800037b0:	f54080e7          	jalr	-172(ra) # 80001700 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    800037b4:	00000513          	li	a0,0
                break;
    800037b8:	ef5ff06f          	j	800036ac <exceptionHandler+0x204>
                _sem::signal((sem_t)a1);
    800037bc:	00098513          	mv	a0,s3
    800037c0:	ffffe097          	auipc	ra,0xffffe
    800037c4:	fe4080e7          	jalr	-28(ra) # 800017a4 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    800037c8:	00000513          	li	a0,0
                break;
    800037cc:	ee1ff06f          	j	800036ac <exceptionHandler+0x204>
                returnVal = Timer::getInstance().sleep(a1);
    800037d0:	ffffe097          	auipc	ra,0xffffe
    800037d4:	9e8080e7          	jalr	-1560(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    800037d8:	00098593          	mv	a1,s3
    800037dc:	ffffe097          	auipc	ra,0xffffe
    800037e0:	b0c080e7          	jalr	-1268(ra) # 800012e8 <_ZN5Timer5sleepEm>
                break;
    800037e4:	ec9ff06f          	j	800036ac <exceptionHandler+0x204>
                returnVal = __getc();
    800037e8:	00002097          	auipc	ra,0x2
    800037ec:	750080e7          	jalr	1872(ra) # 80005f38 <__getc>
                break;
    800037f0:	ebdff06f          	j	800036ac <exceptionHandler+0x204>
                __putc(a1);
    800037f4:	0ff9f513          	andi	a0,s3,255
    800037f8:	00002097          	auipc	ra,0x2
    800037fc:	704080e7          	jalr	1796(ra) # 80005efc <__putc>
    uint64 returnVal = 0;
    80003800:	00000513          	li	a0,0
                break;
    80003804:	ea9ff06f          	j	800036ac <exceptionHandler+0x204>
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80003808:	00000513          	li	a0,0
    8000380c:	ea1ff06f          	j	800036ac <exceptionHandler+0x204>
        __putc('\n');
    80003810:	00a00513          	li	a0,10
    80003814:	00002097          	auipc	ra,0x2
    80003818:	6e8080e7          	jalr	1768(ra) # 80005efc <__putc>
        __putc('E');
    8000381c:	04500513          	li	a0,69
    80003820:	00002097          	auipc	ra,0x2
    80003824:	6dc080e7          	jalr	1756(ra) # 80005efc <__putc>
        __putc('r');
    80003828:	07200513          	li	a0,114
    8000382c:	00002097          	auipc	ra,0x2
    80003830:	6d0080e7          	jalr	1744(ra) # 80005efc <__putc>
        __putc('r');
    80003834:	07200513          	li	a0,114
    80003838:	00002097          	auipc	ra,0x2
    8000383c:	6c4080e7          	jalr	1732(ra) # 80005efc <__putc>
        __putc('o');
    80003840:	06f00513          	li	a0,111
    80003844:	00002097          	auipc	ra,0x2
    80003848:	6b8080e7          	jalr	1720(ra) # 80005efc <__putc>
        __putc('r');
    8000384c:	07200513          	li	a0,114
    80003850:	00002097          	auipc	ra,0x2
    80003854:	6ac080e7          	jalr	1708(ra) # 80005efc <__putc>
        __putc(':');
    80003858:	03a00513          	li	a0,58
    8000385c:	00002097          	auipc	ra,0x2
    80003860:	6a0080e7          	jalr	1696(ra) # 80005efc <__putc>
        __putc(' ');
    80003864:	02000513          	li	a0,32
    80003868:	00002097          	auipc	ra,0x2
    8000386c:	694080e7          	jalr	1684(ra) # 80005efc <__putc>
        __putc('i');
    80003870:	06900513          	li	a0,105
    80003874:	00002097          	auipc	ra,0x2
    80003878:	688080e7          	jalr	1672(ra) # 80005efc <__putc>
        __putc('l');
    8000387c:	06c00513          	li	a0,108
    80003880:	00002097          	auipc	ra,0x2
    80003884:	67c080e7          	jalr	1660(ra) # 80005efc <__putc>
        __putc('l');
    80003888:	06c00513          	li	a0,108
    8000388c:	00002097          	auipc	ra,0x2
    80003890:	670080e7          	jalr	1648(ra) # 80005efc <__putc>
        __putc('e');
    80003894:	06500513          	li	a0,101
    80003898:	00002097          	auipc	ra,0x2
    8000389c:	664080e7          	jalr	1636(ra) # 80005efc <__putc>
        __putc('g');
    800038a0:	06700513          	li	a0,103
    800038a4:	00002097          	auipc	ra,0x2
    800038a8:	658080e7          	jalr	1624(ra) # 80005efc <__putc>
        __putc('a');
    800038ac:	06100513          	li	a0,97
    800038b0:	00002097          	auipc	ra,0x2
    800038b4:	64c080e7          	jalr	1612(ra) # 80005efc <__putc>
        __putc('l');
    800038b8:	06c00513          	li	a0,108
    800038bc:	00002097          	auipc	ra,0x2
    800038c0:	640080e7          	jalr	1600(ra) # 80005efc <__putc>
        __putc(' ');
    800038c4:	02000513          	li	a0,32
    800038c8:	00002097          	auipc	ra,0x2
    800038cc:	634080e7          	jalr	1588(ra) # 80005efc <__putc>
        __putc('r');
    800038d0:	07200513          	li	a0,114
    800038d4:	00002097          	auipc	ra,0x2
    800038d8:	628080e7          	jalr	1576(ra) # 80005efc <__putc>
        __putc('e');
    800038dc:	06500513          	li	a0,101
    800038e0:	00002097          	auipc	ra,0x2
    800038e4:	61c080e7          	jalr	1564(ra) # 80005efc <__putc>
        __putc('a');
    800038e8:	06100513          	li	a0,97
    800038ec:	00002097          	auipc	ra,0x2
    800038f0:	610080e7          	jalr	1552(ra) # 80005efc <__putc>
        __putc('d');
    800038f4:	06400513          	li	a0,100
    800038f8:	00002097          	auipc	ra,0x2
    800038fc:	604080e7          	jalr	1540(ra) # 80005efc <__putc>
        __putc('!');
    80003900:	02100513          	li	a0,33
    80003904:	00002097          	auipc	ra,0x2
    80003908:	5f8080e7          	jalr	1528(ra) # 80005efc <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    8000390c:	14102973          	csrr	s2,sepc
        __putc('\n');
    80003910:	00a00513          	li	a0,10
    80003914:	00002097          	auipc	ra,0x2
    80003918:	5e8080e7          	jalr	1512(ra) # 80005efc <__putc>
        __putc('P');
    8000391c:	05000513          	li	a0,80
    80003920:	00002097          	auipc	ra,0x2
    80003924:	5dc080e7          	jalr	1500(ra) # 80005efc <__putc>
        __putc('C');
    80003928:	04300513          	li	a0,67
    8000392c:	00002097          	auipc	ra,0x2
    80003930:	5d0080e7          	jalr	1488(ra) # 80005efc <__putc>
        __putc(':');
    80003934:	03a00513          	li	a0,58
    80003938:	00002097          	auipc	ra,0x2
    8000393c:	5c4080e7          	jalr	1476(ra) # 80005efc <__putc>
        __putc(' ');
    80003940:	02000513          	li	a0,32
    80003944:	00002097          	auipc	ra,0x2
    80003948:	5b8080e7          	jalr	1464(ra) # 80005efc <__putc>
        __putc('0');
    8000394c:	03000513          	li	a0,48
    80003950:	00002097          	auipc	ra,0x2
    80003954:	5ac080e7          	jalr	1452(ra) # 80005efc <__putc>
        __putc('x');
    80003958:	07800513          	li	a0,120
    8000395c:	00002097          	auipc	ra,0x2
    80003960:	5a0080e7          	jalr	1440(ra) # 80005efc <__putc>
        for(int i = 15; i >= 0; i--){
    80003964:	00f00493          	li	s1,15
    80003968:	0140006f          	j	8000397c <exceptionHandler+0x4d4>
                __putc('A' + tmp - 10);
    8000396c:	03750513          	addi	a0,a0,55
    80003970:	00002097          	auipc	ra,0x2
    80003974:	58c080e7          	jalr	1420(ra) # 80005efc <__putc>
        for(int i = 15; i >= 0; i--){
    80003978:	fff4849b          	addiw	s1,s1,-1
    8000397c:	0204c463          	bltz	s1,800039a4 <exceptionHandler+0x4fc>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    80003980:	0024951b          	slliw	a0,s1,0x2
    80003984:	00a95533          	srl	a0,s2,a0
    80003988:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    8000398c:	00900793          	li	a5,9
    80003990:	fca7eee3          	bltu	a5,a0,8000396c <exceptionHandler+0x4c4>
                __putc('0' + tmp);
    80003994:	03050513          	addi	a0,a0,48
    80003998:	00002097          	auipc	ra,0x2
    8000399c:	564080e7          	jalr	1380(ra) # 80005efc <__putc>
    800039a0:	fd9ff06f          	j	80003978 <exceptionHandler+0x4d0>
        assert(false);
    800039a4:	00004697          	auipc	a3,0x4
    800039a8:	8ac68693          	addi	a3,a3,-1876 # 80007250 <CONSOLE_STATUS+0x240>
    800039ac:	07f00613          	li	a2,127
    800039b0:	00004597          	auipc	a1,0x4
    800039b4:	8b858593          	addi	a1,a1,-1864 # 80007268 <CONSOLE_STATUS+0x258>
    800039b8:	00004517          	auipc	a0,0x4
    800039bc:	8d050513          	addi	a0,a0,-1840 # 80007288 <CONSOLE_STATUS+0x278>
    800039c0:	ffffe097          	auipc	ra,0xffffe
    800039c4:	f20080e7          	jalr	-224(ra) # 800018e0 <_Z13assert_failedPKcS0_jS0_>
    800039c8:	cf9ff06f          	j	800036c0 <exceptionHandler+0x218>
                __putc('A' + tmp - 10);
    800039cc:	03750513          	addi	a0,a0,55
    800039d0:	00002097          	auipc	ra,0x2
    800039d4:	52c080e7          	jalr	1324(ra) # 80005efc <__putc>
        for(int i = 15; i >= 0; i--){
    800039d8:	fff4849b          	addiw	s1,s1,-1
    800039dc:	0204c463          	bltz	s1,80003a04 <exceptionHandler+0x55c>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    800039e0:	0024951b          	slliw	a0,s1,0x2
    800039e4:	00a95533          	srl	a0,s2,a0
    800039e8:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    800039ec:	00900793          	li	a5,9
    800039f0:	fca7eee3          	bltu	a5,a0,800039cc <exceptionHandler+0x524>
                __putc('0' + tmp);
    800039f4:	03050513          	addi	a0,a0,48
    800039f8:	00002097          	auipc	ra,0x2
    800039fc:	504080e7          	jalr	1284(ra) # 80005efc <__putc>
    80003a00:	fd9ff06f          	j	800039d8 <exceptionHandler+0x530>
        assert(false);
    80003a04:	00004697          	auipc	a3,0x4
    80003a08:	84c68693          	addi	a3,a3,-1972 # 80007250 <CONSOLE_STATUS+0x240>
    80003a0c:	0a900613          	li	a2,169
    80003a10:	00004597          	auipc	a1,0x4
    80003a14:	85858593          	addi	a1,a1,-1960 # 80007268 <CONSOLE_STATUS+0x258>
    80003a18:	00004517          	auipc	a0,0x4
    80003a1c:	87050513          	addi	a0,a0,-1936 # 80007288 <CONSOLE_STATUS+0x278>
    80003a20:	ffffe097          	auipc	ra,0xffffe
    80003a24:	ec0080e7          	jalr	-320(ra) # 800018e0 <_Z13assert_failedPKcS0_jS0_>
    80003a28:	c99ff06f          	j	800036c0 <exceptionHandler+0x218>

0000000080003a2c <_ZN9SchedulerC1Ev>:
#include "console.h"
#include "thread.h"

Scheduler* Scheduler::singleton = 0;

Scheduler::Scheduler(){
    80003a2c:	fe010113          	addi	sp,sp,-32
    80003a30:	00113c23          	sd	ra,24(sp)
    80003a34:	00813823          	sd	s0,16(sp)
    80003a38:	00913423          	sd	s1,8(sp)
    80003a3c:	02010413          	addi	s0,sp,32
    80003a40:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80003a44:	00004797          	auipc	a5,0x4
    80003a48:	68c7b783          	ld	a5,1676(a5) # 800080d0 <_ZN9Scheduler9singletonE>
    80003a4c:	02079463          	bnez	a5,80003a74 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80003a50:	00004797          	auipc	a5,0x4
    80003a54:	6897b023          	sd	s1,1664(a5) # 800080d0 <_ZN9Scheduler9singletonE>
    head = 0;
    80003a58:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80003a5c:	0004b423          	sd	zero,8(s1)
}
    80003a60:	01813083          	ld	ra,24(sp)
    80003a64:	01013403          	ld	s0,16(sp)
    80003a68:	00813483          	ld	s1,8(sp)
    80003a6c:	02010113          	addi	sp,sp,32
    80003a70:	00008067          	ret
    assert(singleton == 0);
    80003a74:	00004697          	auipc	a3,0x4
    80003a78:	92c68693          	addi	a3,a3,-1748 # 800073a0 <CONSOLE_STATUS+0x390>
    80003a7c:	01500613          	li	a2,21
    80003a80:	00004597          	auipc	a1,0x4
    80003a84:	93858593          	addi	a1,a1,-1736 # 800073b8 <CONSOLE_STATUS+0x3a8>
    80003a88:	00004517          	auipc	a0,0x4
    80003a8c:	94050513          	addi	a0,a0,-1728 # 800073c8 <CONSOLE_STATUS+0x3b8>
    80003a90:	ffffe097          	auipc	ra,0xffffe
    80003a94:	e50080e7          	jalr	-432(ra) # 800018e0 <_Z13assert_failedPKcS0_jS0_>
    80003a98:	fb9ff06f          	j	80003a50 <_ZN9SchedulerC1Ev+0x24>

0000000080003a9c <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80003a9c:	ff010113          	addi	sp,sp,-16
    80003aa0:	00813423          	sd	s0,8(sp)
    80003aa4:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80003aa8:	00004797          	auipc	a5,0x4
    80003aac:	6287b783          	ld	a5,1576(a5) # 800080d0 <_ZN9Scheduler9singletonE>
    80003ab0:	0007b503          	ld	a0,0(a5)
}
    80003ab4:	00153513          	seqz	a0,a0
    80003ab8:	00813403          	ld	s0,8(sp)
    80003abc:	01010113          	addi	sp,sp,16
    80003ac0:	00008067          	ret

0000000080003ac4 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80003ac4:	fe010113          	addi	sp,sp,-32
    80003ac8:	00113c23          	sd	ra,24(sp)
    80003acc:	00813823          	sd	s0,16(sp)
    80003ad0:	00913423          	sd	s1,8(sp)
    80003ad4:	01213023          	sd	s2,0(sp)
    80003ad8:	02010413          	addi	s0,sp,32
    80003adc:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80003ae0:	00004917          	auipc	s2,0x4
    80003ae4:	5f093903          	ld	s2,1520(s2) # 800080d0 <_ZN9Scheduler9singletonE>
    80003ae8:	00093783          	ld	a5,0(s2)
    80003aec:	12078c63          	beqz	a5,80003c24 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003af0:	00893903          	ld	s2,8(s2)
    80003af4:	01000513          	li	a0,16
    80003af8:	ffffe097          	auipc	ra,0xffffe
    80003afc:	920080e7          	jalr	-1760(ra) # 80001418 <_Z9mem_allocm>
    80003b00:	00a90423          	sb	a0,8(s2)
    80003b04:	00855793          	srli	a5,a0,0x8
    80003b08:	00f904a3          	sb	a5,9(s2)
    80003b0c:	01055793          	srli	a5,a0,0x10
    80003b10:	00f90523          	sb	a5,10(s2)
    80003b14:	0185579b          	srliw	a5,a0,0x18
    80003b18:	00f905a3          	sb	a5,11(s2)
    80003b1c:	02055793          	srli	a5,a0,0x20
    80003b20:	00f90623          	sb	a5,12(s2)
    80003b24:	02855793          	srli	a5,a0,0x28
    80003b28:	00f906a3          	sb	a5,13(s2)
    80003b2c:	03055793          	srli	a5,a0,0x30
    80003b30:	00f90723          	sb	a5,14(s2)
    80003b34:	03855513          	srli	a0,a0,0x38
    80003b38:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80003b3c:	00004617          	auipc	a2,0x4
    80003b40:	59460613          	addi	a2,a2,1428 # 800080d0 <_ZN9Scheduler9singletonE>
    80003b44:	00063583          	ld	a1,0(a2)
    80003b48:	0085b703          	ld	a4,8(a1)
    80003b4c:	00874783          	lbu	a5,8(a4)
    80003b50:	00974683          	lbu	a3,9(a4)
    80003b54:	00869693          	slli	a3,a3,0x8
    80003b58:	00f6e6b3          	or	a3,a3,a5
    80003b5c:	00a74783          	lbu	a5,10(a4)
    80003b60:	01079793          	slli	a5,a5,0x10
    80003b64:	00d7e6b3          	or	a3,a5,a3
    80003b68:	00b74783          	lbu	a5,11(a4)
    80003b6c:	01879793          	slli	a5,a5,0x18
    80003b70:	00d7e7b3          	or	a5,a5,a3
    80003b74:	00c74683          	lbu	a3,12(a4)
    80003b78:	02069693          	slli	a3,a3,0x20
    80003b7c:	00f6e7b3          	or	a5,a3,a5
    80003b80:	00d74683          	lbu	a3,13(a4)
    80003b84:	02869693          	slli	a3,a3,0x28
    80003b88:	00f6e6b3          	or	a3,a3,a5
    80003b8c:	00e74783          	lbu	a5,14(a4)
    80003b90:	03079793          	slli	a5,a5,0x30
    80003b94:	00d7e6b3          	or	a3,a5,a3
    80003b98:	00f74783          	lbu	a5,15(a4)
    80003b9c:	03879793          	slli	a5,a5,0x38
    80003ba0:	00d7e7b3          	or	a5,a5,a3
    80003ba4:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80003ba8:	00978023          	sb	s1,0(a5)
    80003bac:	0084d713          	srli	a4,s1,0x8
    80003bb0:	00e780a3          	sb	a4,1(a5)
    80003bb4:	0104d713          	srli	a4,s1,0x10
    80003bb8:	00e78123          	sb	a4,2(a5)
    80003bbc:	0184d71b          	srliw	a4,s1,0x18
    80003bc0:	00e781a3          	sb	a4,3(a5)
    80003bc4:	0204d713          	srli	a4,s1,0x20
    80003bc8:	00e78223          	sb	a4,4(a5)
    80003bcc:	0284d713          	srli	a4,s1,0x28
    80003bd0:	00e782a3          	sb	a4,5(a5)
    80003bd4:	0304d713          	srli	a4,s1,0x30
    80003bd8:	00e78323          	sb	a4,6(a5)
    80003bdc:	0384d493          	srli	s1,s1,0x38
    80003be0:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80003be4:	00063783          	ld	a5,0(a2)
    80003be8:	0087b783          	ld	a5,8(a5)
    80003bec:	00078423          	sb	zero,8(a5)
    80003bf0:	000784a3          	sb	zero,9(a5)
    80003bf4:	00078523          	sb	zero,10(a5)
    80003bf8:	000785a3          	sb	zero,11(a5)
    80003bfc:	00078623          	sb	zero,12(a5)
    80003c00:	000786a3          	sb	zero,13(a5)
    80003c04:	00078723          	sb	zero,14(a5)
    80003c08:	000787a3          	sb	zero,15(a5)
    }
}
    80003c0c:	01813083          	ld	ra,24(sp)
    80003c10:	01013403          	ld	s0,16(sp)
    80003c14:	00813483          	ld	s1,8(sp)
    80003c18:	00013903          	ld	s2,0(sp)
    80003c1c:	02010113          	addi	sp,sp,32
    80003c20:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003c24:	01000513          	li	a0,16
    80003c28:	ffffd097          	auipc	ra,0xffffd
    80003c2c:	7f0080e7          	jalr	2032(ra) # 80001418 <_Z9mem_allocm>
    80003c30:	00a93423          	sd	a0,8(s2)
    80003c34:	00004717          	auipc	a4,0x4
    80003c38:	49c70713          	addi	a4,a4,1180 # 800080d0 <_ZN9Scheduler9singletonE>
    80003c3c:	00073783          	ld	a5,0(a4)
    80003c40:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80003c44:	00073783          	ld	a5,0(a4)
    80003c48:	0007b783          	ld	a5,0(a5)
    80003c4c:	00978023          	sb	s1,0(a5)
    80003c50:	0084d693          	srli	a3,s1,0x8
    80003c54:	00d780a3          	sb	a3,1(a5)
    80003c58:	0104d693          	srli	a3,s1,0x10
    80003c5c:	00d78123          	sb	a3,2(a5)
    80003c60:	0184d69b          	srliw	a3,s1,0x18
    80003c64:	00d781a3          	sb	a3,3(a5)
    80003c68:	0204d693          	srli	a3,s1,0x20
    80003c6c:	00d78223          	sb	a3,4(a5)
    80003c70:	0284d693          	srli	a3,s1,0x28
    80003c74:	00d782a3          	sb	a3,5(a5)
    80003c78:	0304d693          	srli	a3,s1,0x30
    80003c7c:	00d78323          	sb	a3,6(a5)
    80003c80:	0384d493          	srli	s1,s1,0x38
    80003c84:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80003c88:	00073783          	ld	a5,0(a4)
    80003c8c:	0007b783          	ld	a5,0(a5)
    80003c90:	00078423          	sb	zero,8(a5)
    80003c94:	000784a3          	sb	zero,9(a5)
    80003c98:	00078523          	sb	zero,10(a5)
    80003c9c:	000785a3          	sb	zero,11(a5)
    80003ca0:	00078623          	sb	zero,12(a5)
    80003ca4:	000786a3          	sb	zero,13(a5)
    80003ca8:	00078723          	sb	zero,14(a5)
    80003cac:	000787a3          	sb	zero,15(a5)
    80003cb0:	f5dff06f          	j	80003c0c <_ZN9Scheduler3putEP7_thread+0x148>

0000000080003cb4 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80003cb4:	ff010113          	addi	sp,sp,-16
    80003cb8:	00813423          	sd	s0,8(sp)
    80003cbc:	01010413          	addi	s0,sp,16
    ThreadList* tmp = singleton->head;
    80003cc0:	00004617          	auipc	a2,0x4
    80003cc4:	41063603          	ld	a2,1040(a2) # 800080d0 <_ZN9Scheduler9singletonE>
    80003cc8:	00063783          	ld	a5,0(a2)
    if(tmp == 0){
    80003ccc:	0c078e63          	beqz	a5,80003da8 <_ZN9Scheduler3getEv+0xf4>
        return 0;
    }
    thread_t thread = tmp->thread;
    80003cd0:	0007c503          	lbu	a0,0(a5)
    80003cd4:	0017c703          	lbu	a4,1(a5)
    80003cd8:	00871713          	slli	a4,a4,0x8
    80003cdc:	00a76733          	or	a4,a4,a0
    80003ce0:	0027c503          	lbu	a0,2(a5)
    80003ce4:	01051513          	slli	a0,a0,0x10
    80003ce8:	00e56733          	or	a4,a0,a4
    80003cec:	0037c503          	lbu	a0,3(a5)
    80003cf0:	01851513          	slli	a0,a0,0x18
    80003cf4:	00e56533          	or	a0,a0,a4
    80003cf8:	0047c703          	lbu	a4,4(a5)
    80003cfc:	02071713          	slli	a4,a4,0x20
    80003d00:	00a76533          	or	a0,a4,a0
    80003d04:	0057c703          	lbu	a4,5(a5)
    80003d08:	02871713          	slli	a4,a4,0x28
    80003d0c:	00a76733          	or	a4,a4,a0
    80003d10:	0067c503          	lbu	a0,6(a5)
    80003d14:	03051513          	slli	a0,a0,0x30
    80003d18:	00e56733          	or	a4,a0,a4
    80003d1c:	0077c503          	lbu	a0,7(a5)
    80003d20:	03851513          	slli	a0,a0,0x38
    80003d24:	00e56533          	or	a0,a0,a4
    singleton->head = tmp->next;
    80003d28:	0087c683          	lbu	a3,8(a5)
    80003d2c:	0097c703          	lbu	a4,9(a5)
    80003d30:	00871713          	slli	a4,a4,0x8
    80003d34:	00d766b3          	or	a3,a4,a3
    80003d38:	00a7c703          	lbu	a4,10(a5)
    80003d3c:	01071713          	slli	a4,a4,0x10
    80003d40:	00d76733          	or	a4,a4,a3
    80003d44:	00b7c683          	lbu	a3,11(a5)
    80003d48:	01869693          	slli	a3,a3,0x18
    80003d4c:	00e6e733          	or	a4,a3,a4
    80003d50:	00c7c683          	lbu	a3,12(a5)
    80003d54:	02069693          	slli	a3,a3,0x20
    80003d58:	00e6e6b3          	or	a3,a3,a4
    80003d5c:	00d7c703          	lbu	a4,13(a5)
    80003d60:	02871713          	slli	a4,a4,0x28
    80003d64:	00d766b3          	or	a3,a4,a3
    80003d68:	00e7c703          	lbu	a4,14(a5)
    80003d6c:	03071713          	slli	a4,a4,0x30
    80003d70:	00d76733          	or	a4,a4,a3
    80003d74:	00f7c783          	lbu	a5,15(a5)
    80003d78:	03879793          	slli	a5,a5,0x38
    80003d7c:	00e7e7b3          	or	a5,a5,a4
    80003d80:	00f63023          	sd	a5,0(a2)
    if(singleton->head == 0){
    80003d84:	00004797          	auipc	a5,0x4
    80003d88:	34c7b783          	ld	a5,844(a5) # 800080d0 <_ZN9Scheduler9singletonE>
    80003d8c:	0007b703          	ld	a4,0(a5)
    80003d90:	00070863          	beqz	a4,80003da0 <_ZN9Scheduler3getEv+0xec>
        singleton->tail = 0;
    }
    // mem_free(tmp);
    return thread;
}
    80003d94:	00813403          	ld	s0,8(sp)
    80003d98:	01010113          	addi	sp,sp,16
    80003d9c:	00008067          	ret
        singleton->tail = 0;
    80003da0:	0007b423          	sd	zero,8(a5)
    80003da4:	ff1ff06f          	j	80003d94 <_ZN9Scheduler3getEv+0xe0>
        return 0;
    80003da8:	00078513          	mv	a0,a5
    80003dac:	fe9ff06f          	j	80003d94 <_ZN9Scheduler3getEv+0xe0>

0000000080003db0 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80003db0:	ff010113          	addi	sp,sp,-16
    80003db4:	00813423          	sd	s0,8(sp)
    80003db8:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80003dbc:	00004797          	auipc	a5,0x4
    80003dc0:	3147b783          	ld	a5,788(a5) # 800080d0 <_ZN9Scheduler9singletonE>
    80003dc4:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80003dc8:	00000513          	li	a0,0
    while(tmp != 0){
    80003dcc:	06078263          	beqz	a5,80003e30 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80003dd0:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80003dd4:	0087c683          	lbu	a3,8(a5)
    80003dd8:	0097c703          	lbu	a4,9(a5)
    80003ddc:	00871713          	slli	a4,a4,0x8
    80003de0:	00d766b3          	or	a3,a4,a3
    80003de4:	00a7c703          	lbu	a4,10(a5)
    80003de8:	01071713          	slli	a4,a4,0x10
    80003dec:	00d76733          	or	a4,a4,a3
    80003df0:	00b7c683          	lbu	a3,11(a5)
    80003df4:	01869693          	slli	a3,a3,0x18
    80003df8:	00e6e733          	or	a4,a3,a4
    80003dfc:	00c7c683          	lbu	a3,12(a5)
    80003e00:	02069693          	slli	a3,a3,0x20
    80003e04:	00e6e6b3          	or	a3,a3,a4
    80003e08:	00d7c703          	lbu	a4,13(a5)
    80003e0c:	02871713          	slli	a4,a4,0x28
    80003e10:	00d766b3          	or	a3,a4,a3
    80003e14:	00e7c703          	lbu	a4,14(a5)
    80003e18:	03071713          	slli	a4,a4,0x30
    80003e1c:	00d76733          	or	a4,a4,a3
    80003e20:	00f7c783          	lbu	a5,15(a5)
    80003e24:	03879793          	slli	a5,a5,0x38
    80003e28:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80003e2c:	fa1ff06f          	j	80003dcc <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80003e30:	00813403          	ld	s0,8(sp)
    80003e34:	01010113          	addi	sp,sp,16
    80003e38:	00008067          	ret

0000000080003e3c <start>:
    80003e3c:	ff010113          	addi	sp,sp,-16
    80003e40:	00813423          	sd	s0,8(sp)
    80003e44:	01010413          	addi	s0,sp,16
    80003e48:	300027f3          	csrr	a5,mstatus
    80003e4c:	ffffe737          	lui	a4,0xffffe
    80003e50:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff54bf>
    80003e54:	00e7f7b3          	and	a5,a5,a4
    80003e58:	00001737          	lui	a4,0x1
    80003e5c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003e60:	00e7e7b3          	or	a5,a5,a4
    80003e64:	30079073          	csrw	mstatus,a5
    80003e68:	00000797          	auipc	a5,0x0
    80003e6c:	16078793          	addi	a5,a5,352 # 80003fc8 <system_main>
    80003e70:	34179073          	csrw	mepc,a5
    80003e74:	00000793          	li	a5,0
    80003e78:	18079073          	csrw	satp,a5
    80003e7c:	000107b7          	lui	a5,0x10
    80003e80:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003e84:	30279073          	csrw	medeleg,a5
    80003e88:	30379073          	csrw	mideleg,a5
    80003e8c:	104027f3          	csrr	a5,sie
    80003e90:	2227e793          	ori	a5,a5,546
    80003e94:	10479073          	csrw	sie,a5
    80003e98:	fff00793          	li	a5,-1
    80003e9c:	00a7d793          	srli	a5,a5,0xa
    80003ea0:	3b079073          	csrw	pmpaddr0,a5
    80003ea4:	00f00793          	li	a5,15
    80003ea8:	3a079073          	csrw	pmpcfg0,a5
    80003eac:	f14027f3          	csrr	a5,mhartid
    80003eb0:	0200c737          	lui	a4,0x200c
    80003eb4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003eb8:	0007869b          	sext.w	a3,a5
    80003ebc:	00269713          	slli	a4,a3,0x2
    80003ec0:	000f4637          	lui	a2,0xf4
    80003ec4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003ec8:	00d70733          	add	a4,a4,a3
    80003ecc:	0037979b          	slliw	a5,a5,0x3
    80003ed0:	020046b7          	lui	a3,0x2004
    80003ed4:	00d787b3          	add	a5,a5,a3
    80003ed8:	00c585b3          	add	a1,a1,a2
    80003edc:	00371693          	slli	a3,a4,0x3
    80003ee0:	00004717          	auipc	a4,0x4
    80003ee4:	20070713          	addi	a4,a4,512 # 800080e0 <timer_scratch>
    80003ee8:	00b7b023          	sd	a1,0(a5)
    80003eec:	00d70733          	add	a4,a4,a3
    80003ef0:	00f73c23          	sd	a5,24(a4)
    80003ef4:	02c73023          	sd	a2,32(a4)
    80003ef8:	34071073          	csrw	mscratch,a4
    80003efc:	00000797          	auipc	a5,0x0
    80003f00:	6e478793          	addi	a5,a5,1764 # 800045e0 <timervec>
    80003f04:	30579073          	csrw	mtvec,a5
    80003f08:	300027f3          	csrr	a5,mstatus
    80003f0c:	0087e793          	ori	a5,a5,8
    80003f10:	30079073          	csrw	mstatus,a5
    80003f14:	304027f3          	csrr	a5,mie
    80003f18:	0807e793          	ori	a5,a5,128
    80003f1c:	30479073          	csrw	mie,a5
    80003f20:	f14027f3          	csrr	a5,mhartid
    80003f24:	0007879b          	sext.w	a5,a5
    80003f28:	00078213          	mv	tp,a5
    80003f2c:	30200073          	mret
    80003f30:	00813403          	ld	s0,8(sp)
    80003f34:	01010113          	addi	sp,sp,16
    80003f38:	00008067          	ret

0000000080003f3c <timerinit>:
    80003f3c:	ff010113          	addi	sp,sp,-16
    80003f40:	00813423          	sd	s0,8(sp)
    80003f44:	01010413          	addi	s0,sp,16
    80003f48:	f14027f3          	csrr	a5,mhartid
    80003f4c:	0200c737          	lui	a4,0x200c
    80003f50:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003f54:	0007869b          	sext.w	a3,a5
    80003f58:	00269713          	slli	a4,a3,0x2
    80003f5c:	000f4637          	lui	a2,0xf4
    80003f60:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003f64:	00d70733          	add	a4,a4,a3
    80003f68:	0037979b          	slliw	a5,a5,0x3
    80003f6c:	020046b7          	lui	a3,0x2004
    80003f70:	00d787b3          	add	a5,a5,a3
    80003f74:	00c585b3          	add	a1,a1,a2
    80003f78:	00371693          	slli	a3,a4,0x3
    80003f7c:	00004717          	auipc	a4,0x4
    80003f80:	16470713          	addi	a4,a4,356 # 800080e0 <timer_scratch>
    80003f84:	00b7b023          	sd	a1,0(a5)
    80003f88:	00d70733          	add	a4,a4,a3
    80003f8c:	00f73c23          	sd	a5,24(a4)
    80003f90:	02c73023          	sd	a2,32(a4)
    80003f94:	34071073          	csrw	mscratch,a4
    80003f98:	00000797          	auipc	a5,0x0
    80003f9c:	64878793          	addi	a5,a5,1608 # 800045e0 <timervec>
    80003fa0:	30579073          	csrw	mtvec,a5
    80003fa4:	300027f3          	csrr	a5,mstatus
    80003fa8:	0087e793          	ori	a5,a5,8
    80003fac:	30079073          	csrw	mstatus,a5
    80003fb0:	304027f3          	csrr	a5,mie
    80003fb4:	0807e793          	ori	a5,a5,128
    80003fb8:	30479073          	csrw	mie,a5
    80003fbc:	00813403          	ld	s0,8(sp)
    80003fc0:	01010113          	addi	sp,sp,16
    80003fc4:	00008067          	ret

0000000080003fc8 <system_main>:
    80003fc8:	fe010113          	addi	sp,sp,-32
    80003fcc:	00813823          	sd	s0,16(sp)
    80003fd0:	00913423          	sd	s1,8(sp)
    80003fd4:	00113c23          	sd	ra,24(sp)
    80003fd8:	02010413          	addi	s0,sp,32
    80003fdc:	00000097          	auipc	ra,0x0
    80003fe0:	0c4080e7          	jalr	196(ra) # 800040a0 <cpuid>
    80003fe4:	00004497          	auipc	s1,0x4
    80003fe8:	08c48493          	addi	s1,s1,140 # 80008070 <started>
    80003fec:	02050263          	beqz	a0,80004010 <system_main+0x48>
    80003ff0:	0004a783          	lw	a5,0(s1)
    80003ff4:	0007879b          	sext.w	a5,a5
    80003ff8:	fe078ce3          	beqz	a5,80003ff0 <system_main+0x28>
    80003ffc:	0ff0000f          	fence
    80004000:	00003517          	auipc	a0,0x3
    80004004:	40850513          	addi	a0,a0,1032 # 80007408 <CONSOLE_STATUS+0x3f8>
    80004008:	00001097          	auipc	ra,0x1
    8000400c:	a74080e7          	jalr	-1420(ra) # 80004a7c <panic>
    80004010:	00001097          	auipc	ra,0x1
    80004014:	9c8080e7          	jalr	-1592(ra) # 800049d8 <consoleinit>
    80004018:	00001097          	auipc	ra,0x1
    8000401c:	154080e7          	jalr	340(ra) # 8000516c <printfinit>
    80004020:	00003517          	auipc	a0,0x3
    80004024:	4c850513          	addi	a0,a0,1224 # 800074e8 <CONSOLE_STATUS+0x4d8>
    80004028:	00001097          	auipc	ra,0x1
    8000402c:	ab0080e7          	jalr	-1360(ra) # 80004ad8 <__printf>
    80004030:	00003517          	auipc	a0,0x3
    80004034:	3a850513          	addi	a0,a0,936 # 800073d8 <CONSOLE_STATUS+0x3c8>
    80004038:	00001097          	auipc	ra,0x1
    8000403c:	aa0080e7          	jalr	-1376(ra) # 80004ad8 <__printf>
    80004040:	00003517          	auipc	a0,0x3
    80004044:	4a850513          	addi	a0,a0,1192 # 800074e8 <CONSOLE_STATUS+0x4d8>
    80004048:	00001097          	auipc	ra,0x1
    8000404c:	a90080e7          	jalr	-1392(ra) # 80004ad8 <__printf>
    80004050:	00001097          	auipc	ra,0x1
    80004054:	4a8080e7          	jalr	1192(ra) # 800054f8 <kinit>
    80004058:	00000097          	auipc	ra,0x0
    8000405c:	148080e7          	jalr	328(ra) # 800041a0 <trapinit>
    80004060:	00000097          	auipc	ra,0x0
    80004064:	16c080e7          	jalr	364(ra) # 800041cc <trapinithart>
    80004068:	00000097          	auipc	ra,0x0
    8000406c:	5b8080e7          	jalr	1464(ra) # 80004620 <plicinit>
    80004070:	00000097          	auipc	ra,0x0
    80004074:	5d8080e7          	jalr	1496(ra) # 80004648 <plicinithart>
    80004078:	00000097          	auipc	ra,0x0
    8000407c:	078080e7          	jalr	120(ra) # 800040f0 <userinit>
    80004080:	0ff0000f          	fence
    80004084:	00100793          	li	a5,1
    80004088:	00003517          	auipc	a0,0x3
    8000408c:	36850513          	addi	a0,a0,872 # 800073f0 <CONSOLE_STATUS+0x3e0>
    80004090:	00f4a023          	sw	a5,0(s1)
    80004094:	00001097          	auipc	ra,0x1
    80004098:	a44080e7          	jalr	-1468(ra) # 80004ad8 <__printf>
    8000409c:	0000006f          	j	8000409c <system_main+0xd4>

00000000800040a0 <cpuid>:
    800040a0:	ff010113          	addi	sp,sp,-16
    800040a4:	00813423          	sd	s0,8(sp)
    800040a8:	01010413          	addi	s0,sp,16
    800040ac:	00020513          	mv	a0,tp
    800040b0:	00813403          	ld	s0,8(sp)
    800040b4:	0005051b          	sext.w	a0,a0
    800040b8:	01010113          	addi	sp,sp,16
    800040bc:	00008067          	ret

00000000800040c0 <mycpu>:
    800040c0:	ff010113          	addi	sp,sp,-16
    800040c4:	00813423          	sd	s0,8(sp)
    800040c8:	01010413          	addi	s0,sp,16
    800040cc:	00020793          	mv	a5,tp
    800040d0:	00813403          	ld	s0,8(sp)
    800040d4:	0007879b          	sext.w	a5,a5
    800040d8:	00779793          	slli	a5,a5,0x7
    800040dc:	00005517          	auipc	a0,0x5
    800040e0:	03450513          	addi	a0,a0,52 # 80009110 <cpus>
    800040e4:	00f50533          	add	a0,a0,a5
    800040e8:	01010113          	addi	sp,sp,16
    800040ec:	00008067          	ret

00000000800040f0 <userinit>:
    800040f0:	ff010113          	addi	sp,sp,-16
    800040f4:	00813423          	sd	s0,8(sp)
    800040f8:	01010413          	addi	s0,sp,16
    800040fc:	00813403          	ld	s0,8(sp)
    80004100:	01010113          	addi	sp,sp,16
    80004104:	ffffd317          	auipc	t1,0xffffd
    80004108:	72030067          	jr	1824(t1) # 80001824 <main>

000000008000410c <either_copyout>:
    8000410c:	ff010113          	addi	sp,sp,-16
    80004110:	00813023          	sd	s0,0(sp)
    80004114:	00113423          	sd	ra,8(sp)
    80004118:	01010413          	addi	s0,sp,16
    8000411c:	02051663          	bnez	a0,80004148 <either_copyout+0x3c>
    80004120:	00058513          	mv	a0,a1
    80004124:	00060593          	mv	a1,a2
    80004128:	0006861b          	sext.w	a2,a3
    8000412c:	00002097          	auipc	ra,0x2
    80004130:	c58080e7          	jalr	-936(ra) # 80005d84 <__memmove>
    80004134:	00813083          	ld	ra,8(sp)
    80004138:	00013403          	ld	s0,0(sp)
    8000413c:	00000513          	li	a0,0
    80004140:	01010113          	addi	sp,sp,16
    80004144:	00008067          	ret
    80004148:	00003517          	auipc	a0,0x3
    8000414c:	2e850513          	addi	a0,a0,744 # 80007430 <CONSOLE_STATUS+0x420>
    80004150:	00001097          	auipc	ra,0x1
    80004154:	92c080e7          	jalr	-1748(ra) # 80004a7c <panic>

0000000080004158 <either_copyin>:
    80004158:	ff010113          	addi	sp,sp,-16
    8000415c:	00813023          	sd	s0,0(sp)
    80004160:	00113423          	sd	ra,8(sp)
    80004164:	01010413          	addi	s0,sp,16
    80004168:	02059463          	bnez	a1,80004190 <either_copyin+0x38>
    8000416c:	00060593          	mv	a1,a2
    80004170:	0006861b          	sext.w	a2,a3
    80004174:	00002097          	auipc	ra,0x2
    80004178:	c10080e7          	jalr	-1008(ra) # 80005d84 <__memmove>
    8000417c:	00813083          	ld	ra,8(sp)
    80004180:	00013403          	ld	s0,0(sp)
    80004184:	00000513          	li	a0,0
    80004188:	01010113          	addi	sp,sp,16
    8000418c:	00008067          	ret
    80004190:	00003517          	auipc	a0,0x3
    80004194:	2c850513          	addi	a0,a0,712 # 80007458 <CONSOLE_STATUS+0x448>
    80004198:	00001097          	auipc	ra,0x1
    8000419c:	8e4080e7          	jalr	-1820(ra) # 80004a7c <panic>

00000000800041a0 <trapinit>:
    800041a0:	ff010113          	addi	sp,sp,-16
    800041a4:	00813423          	sd	s0,8(sp)
    800041a8:	01010413          	addi	s0,sp,16
    800041ac:	00813403          	ld	s0,8(sp)
    800041b0:	00003597          	auipc	a1,0x3
    800041b4:	2d058593          	addi	a1,a1,720 # 80007480 <CONSOLE_STATUS+0x470>
    800041b8:	00005517          	auipc	a0,0x5
    800041bc:	fd850513          	addi	a0,a0,-40 # 80009190 <tickslock>
    800041c0:	01010113          	addi	sp,sp,16
    800041c4:	00001317          	auipc	t1,0x1
    800041c8:	5c430067          	jr	1476(t1) # 80005788 <initlock>

00000000800041cc <trapinithart>:
    800041cc:	ff010113          	addi	sp,sp,-16
    800041d0:	00813423          	sd	s0,8(sp)
    800041d4:	01010413          	addi	s0,sp,16
    800041d8:	00000797          	auipc	a5,0x0
    800041dc:	2f878793          	addi	a5,a5,760 # 800044d0 <kernelvec>
    800041e0:	10579073          	csrw	stvec,a5
    800041e4:	00813403          	ld	s0,8(sp)
    800041e8:	01010113          	addi	sp,sp,16
    800041ec:	00008067          	ret

00000000800041f0 <usertrap>:
    800041f0:	ff010113          	addi	sp,sp,-16
    800041f4:	00813423          	sd	s0,8(sp)
    800041f8:	01010413          	addi	s0,sp,16
    800041fc:	00813403          	ld	s0,8(sp)
    80004200:	01010113          	addi	sp,sp,16
    80004204:	00008067          	ret

0000000080004208 <usertrapret>:
    80004208:	ff010113          	addi	sp,sp,-16
    8000420c:	00813423          	sd	s0,8(sp)
    80004210:	01010413          	addi	s0,sp,16
    80004214:	00813403          	ld	s0,8(sp)
    80004218:	01010113          	addi	sp,sp,16
    8000421c:	00008067          	ret

0000000080004220 <kerneltrap>:
    80004220:	fe010113          	addi	sp,sp,-32
    80004224:	00813823          	sd	s0,16(sp)
    80004228:	00113c23          	sd	ra,24(sp)
    8000422c:	00913423          	sd	s1,8(sp)
    80004230:	02010413          	addi	s0,sp,32
    80004234:	142025f3          	csrr	a1,scause
    80004238:	100027f3          	csrr	a5,sstatus
    8000423c:	0027f793          	andi	a5,a5,2
    80004240:	10079c63          	bnez	a5,80004358 <kerneltrap+0x138>
    80004244:	142027f3          	csrr	a5,scause
    80004248:	0207ce63          	bltz	a5,80004284 <kerneltrap+0x64>
    8000424c:	00003517          	auipc	a0,0x3
    80004250:	27c50513          	addi	a0,a0,636 # 800074c8 <CONSOLE_STATUS+0x4b8>
    80004254:	00001097          	auipc	ra,0x1
    80004258:	884080e7          	jalr	-1916(ra) # 80004ad8 <__printf>
    8000425c:	141025f3          	csrr	a1,sepc
    80004260:	14302673          	csrr	a2,stval
    80004264:	00003517          	auipc	a0,0x3
    80004268:	27450513          	addi	a0,a0,628 # 800074d8 <CONSOLE_STATUS+0x4c8>
    8000426c:	00001097          	auipc	ra,0x1
    80004270:	86c080e7          	jalr	-1940(ra) # 80004ad8 <__printf>
    80004274:	00003517          	auipc	a0,0x3
    80004278:	27c50513          	addi	a0,a0,636 # 800074f0 <CONSOLE_STATUS+0x4e0>
    8000427c:	00001097          	auipc	ra,0x1
    80004280:	800080e7          	jalr	-2048(ra) # 80004a7c <panic>
    80004284:	0ff7f713          	andi	a4,a5,255
    80004288:	00900693          	li	a3,9
    8000428c:	04d70063          	beq	a4,a3,800042cc <kerneltrap+0xac>
    80004290:	fff00713          	li	a4,-1
    80004294:	03f71713          	slli	a4,a4,0x3f
    80004298:	00170713          	addi	a4,a4,1
    8000429c:	fae798e3          	bne	a5,a4,8000424c <kerneltrap+0x2c>
    800042a0:	00000097          	auipc	ra,0x0
    800042a4:	e00080e7          	jalr	-512(ra) # 800040a0 <cpuid>
    800042a8:	06050663          	beqz	a0,80004314 <kerneltrap+0xf4>
    800042ac:	144027f3          	csrr	a5,sip
    800042b0:	ffd7f793          	andi	a5,a5,-3
    800042b4:	14479073          	csrw	sip,a5
    800042b8:	01813083          	ld	ra,24(sp)
    800042bc:	01013403          	ld	s0,16(sp)
    800042c0:	00813483          	ld	s1,8(sp)
    800042c4:	02010113          	addi	sp,sp,32
    800042c8:	00008067          	ret
    800042cc:	00000097          	auipc	ra,0x0
    800042d0:	3c8080e7          	jalr	968(ra) # 80004694 <plic_claim>
    800042d4:	00a00793          	li	a5,10
    800042d8:	00050493          	mv	s1,a0
    800042dc:	06f50863          	beq	a0,a5,8000434c <kerneltrap+0x12c>
    800042e0:	fc050ce3          	beqz	a0,800042b8 <kerneltrap+0x98>
    800042e4:	00050593          	mv	a1,a0
    800042e8:	00003517          	auipc	a0,0x3
    800042ec:	1c050513          	addi	a0,a0,448 # 800074a8 <CONSOLE_STATUS+0x498>
    800042f0:	00000097          	auipc	ra,0x0
    800042f4:	7e8080e7          	jalr	2024(ra) # 80004ad8 <__printf>
    800042f8:	01013403          	ld	s0,16(sp)
    800042fc:	01813083          	ld	ra,24(sp)
    80004300:	00048513          	mv	a0,s1
    80004304:	00813483          	ld	s1,8(sp)
    80004308:	02010113          	addi	sp,sp,32
    8000430c:	00000317          	auipc	t1,0x0
    80004310:	3c030067          	jr	960(t1) # 800046cc <plic_complete>
    80004314:	00005517          	auipc	a0,0x5
    80004318:	e7c50513          	addi	a0,a0,-388 # 80009190 <tickslock>
    8000431c:	00001097          	auipc	ra,0x1
    80004320:	490080e7          	jalr	1168(ra) # 800057ac <acquire>
    80004324:	00004717          	auipc	a4,0x4
    80004328:	d5070713          	addi	a4,a4,-688 # 80008074 <ticks>
    8000432c:	00072783          	lw	a5,0(a4)
    80004330:	00005517          	auipc	a0,0x5
    80004334:	e6050513          	addi	a0,a0,-416 # 80009190 <tickslock>
    80004338:	0017879b          	addiw	a5,a5,1
    8000433c:	00f72023          	sw	a5,0(a4)
    80004340:	00001097          	auipc	ra,0x1
    80004344:	538080e7          	jalr	1336(ra) # 80005878 <release>
    80004348:	f65ff06f          	j	800042ac <kerneltrap+0x8c>
    8000434c:	00001097          	auipc	ra,0x1
    80004350:	094080e7          	jalr	148(ra) # 800053e0 <uartintr>
    80004354:	fa5ff06f          	j	800042f8 <kerneltrap+0xd8>
    80004358:	00003517          	auipc	a0,0x3
    8000435c:	13050513          	addi	a0,a0,304 # 80007488 <CONSOLE_STATUS+0x478>
    80004360:	00000097          	auipc	ra,0x0
    80004364:	71c080e7          	jalr	1820(ra) # 80004a7c <panic>

0000000080004368 <clockintr>:
    80004368:	fe010113          	addi	sp,sp,-32
    8000436c:	00813823          	sd	s0,16(sp)
    80004370:	00913423          	sd	s1,8(sp)
    80004374:	00113c23          	sd	ra,24(sp)
    80004378:	02010413          	addi	s0,sp,32
    8000437c:	00005497          	auipc	s1,0x5
    80004380:	e1448493          	addi	s1,s1,-492 # 80009190 <tickslock>
    80004384:	00048513          	mv	a0,s1
    80004388:	00001097          	auipc	ra,0x1
    8000438c:	424080e7          	jalr	1060(ra) # 800057ac <acquire>
    80004390:	00004717          	auipc	a4,0x4
    80004394:	ce470713          	addi	a4,a4,-796 # 80008074 <ticks>
    80004398:	00072783          	lw	a5,0(a4)
    8000439c:	01013403          	ld	s0,16(sp)
    800043a0:	01813083          	ld	ra,24(sp)
    800043a4:	00048513          	mv	a0,s1
    800043a8:	0017879b          	addiw	a5,a5,1
    800043ac:	00813483          	ld	s1,8(sp)
    800043b0:	00f72023          	sw	a5,0(a4)
    800043b4:	02010113          	addi	sp,sp,32
    800043b8:	00001317          	auipc	t1,0x1
    800043bc:	4c030067          	jr	1216(t1) # 80005878 <release>

00000000800043c0 <devintr>:
    800043c0:	142027f3          	csrr	a5,scause
    800043c4:	00000513          	li	a0,0
    800043c8:	0007c463          	bltz	a5,800043d0 <devintr+0x10>
    800043cc:	00008067          	ret
    800043d0:	fe010113          	addi	sp,sp,-32
    800043d4:	00813823          	sd	s0,16(sp)
    800043d8:	00113c23          	sd	ra,24(sp)
    800043dc:	00913423          	sd	s1,8(sp)
    800043e0:	02010413          	addi	s0,sp,32
    800043e4:	0ff7f713          	andi	a4,a5,255
    800043e8:	00900693          	li	a3,9
    800043ec:	04d70c63          	beq	a4,a3,80004444 <devintr+0x84>
    800043f0:	fff00713          	li	a4,-1
    800043f4:	03f71713          	slli	a4,a4,0x3f
    800043f8:	00170713          	addi	a4,a4,1
    800043fc:	00e78c63          	beq	a5,a4,80004414 <devintr+0x54>
    80004400:	01813083          	ld	ra,24(sp)
    80004404:	01013403          	ld	s0,16(sp)
    80004408:	00813483          	ld	s1,8(sp)
    8000440c:	02010113          	addi	sp,sp,32
    80004410:	00008067          	ret
    80004414:	00000097          	auipc	ra,0x0
    80004418:	c8c080e7          	jalr	-884(ra) # 800040a0 <cpuid>
    8000441c:	06050663          	beqz	a0,80004488 <devintr+0xc8>
    80004420:	144027f3          	csrr	a5,sip
    80004424:	ffd7f793          	andi	a5,a5,-3
    80004428:	14479073          	csrw	sip,a5
    8000442c:	01813083          	ld	ra,24(sp)
    80004430:	01013403          	ld	s0,16(sp)
    80004434:	00813483          	ld	s1,8(sp)
    80004438:	00200513          	li	a0,2
    8000443c:	02010113          	addi	sp,sp,32
    80004440:	00008067          	ret
    80004444:	00000097          	auipc	ra,0x0
    80004448:	250080e7          	jalr	592(ra) # 80004694 <plic_claim>
    8000444c:	00a00793          	li	a5,10
    80004450:	00050493          	mv	s1,a0
    80004454:	06f50663          	beq	a0,a5,800044c0 <devintr+0x100>
    80004458:	00100513          	li	a0,1
    8000445c:	fa0482e3          	beqz	s1,80004400 <devintr+0x40>
    80004460:	00048593          	mv	a1,s1
    80004464:	00003517          	auipc	a0,0x3
    80004468:	04450513          	addi	a0,a0,68 # 800074a8 <CONSOLE_STATUS+0x498>
    8000446c:	00000097          	auipc	ra,0x0
    80004470:	66c080e7          	jalr	1644(ra) # 80004ad8 <__printf>
    80004474:	00048513          	mv	a0,s1
    80004478:	00000097          	auipc	ra,0x0
    8000447c:	254080e7          	jalr	596(ra) # 800046cc <plic_complete>
    80004480:	00100513          	li	a0,1
    80004484:	f7dff06f          	j	80004400 <devintr+0x40>
    80004488:	00005517          	auipc	a0,0x5
    8000448c:	d0850513          	addi	a0,a0,-760 # 80009190 <tickslock>
    80004490:	00001097          	auipc	ra,0x1
    80004494:	31c080e7          	jalr	796(ra) # 800057ac <acquire>
    80004498:	00004717          	auipc	a4,0x4
    8000449c:	bdc70713          	addi	a4,a4,-1060 # 80008074 <ticks>
    800044a0:	00072783          	lw	a5,0(a4)
    800044a4:	00005517          	auipc	a0,0x5
    800044a8:	cec50513          	addi	a0,a0,-788 # 80009190 <tickslock>
    800044ac:	0017879b          	addiw	a5,a5,1
    800044b0:	00f72023          	sw	a5,0(a4)
    800044b4:	00001097          	auipc	ra,0x1
    800044b8:	3c4080e7          	jalr	964(ra) # 80005878 <release>
    800044bc:	f65ff06f          	j	80004420 <devintr+0x60>
    800044c0:	00001097          	auipc	ra,0x1
    800044c4:	f20080e7          	jalr	-224(ra) # 800053e0 <uartintr>
    800044c8:	fadff06f          	j	80004474 <devintr+0xb4>
    800044cc:	0000                	unimp
	...

00000000800044d0 <kernelvec>:
    800044d0:	f0010113          	addi	sp,sp,-256
    800044d4:	00113023          	sd	ra,0(sp)
    800044d8:	00213423          	sd	sp,8(sp)
    800044dc:	00313823          	sd	gp,16(sp)
    800044e0:	00413c23          	sd	tp,24(sp)
    800044e4:	02513023          	sd	t0,32(sp)
    800044e8:	02613423          	sd	t1,40(sp)
    800044ec:	02713823          	sd	t2,48(sp)
    800044f0:	02813c23          	sd	s0,56(sp)
    800044f4:	04913023          	sd	s1,64(sp)
    800044f8:	04a13423          	sd	a0,72(sp)
    800044fc:	04b13823          	sd	a1,80(sp)
    80004500:	04c13c23          	sd	a2,88(sp)
    80004504:	06d13023          	sd	a3,96(sp)
    80004508:	06e13423          	sd	a4,104(sp)
    8000450c:	06f13823          	sd	a5,112(sp)
    80004510:	07013c23          	sd	a6,120(sp)
    80004514:	09113023          	sd	a7,128(sp)
    80004518:	09213423          	sd	s2,136(sp)
    8000451c:	09313823          	sd	s3,144(sp)
    80004520:	09413c23          	sd	s4,152(sp)
    80004524:	0b513023          	sd	s5,160(sp)
    80004528:	0b613423          	sd	s6,168(sp)
    8000452c:	0b713823          	sd	s7,176(sp)
    80004530:	0b813c23          	sd	s8,184(sp)
    80004534:	0d913023          	sd	s9,192(sp)
    80004538:	0da13423          	sd	s10,200(sp)
    8000453c:	0db13823          	sd	s11,208(sp)
    80004540:	0dc13c23          	sd	t3,216(sp)
    80004544:	0fd13023          	sd	t4,224(sp)
    80004548:	0fe13423          	sd	t5,232(sp)
    8000454c:	0ff13823          	sd	t6,240(sp)
    80004550:	cd1ff0ef          	jal	ra,80004220 <kerneltrap>
    80004554:	00013083          	ld	ra,0(sp)
    80004558:	00813103          	ld	sp,8(sp)
    8000455c:	01013183          	ld	gp,16(sp)
    80004560:	02013283          	ld	t0,32(sp)
    80004564:	02813303          	ld	t1,40(sp)
    80004568:	03013383          	ld	t2,48(sp)
    8000456c:	03813403          	ld	s0,56(sp)
    80004570:	04013483          	ld	s1,64(sp)
    80004574:	04813503          	ld	a0,72(sp)
    80004578:	05013583          	ld	a1,80(sp)
    8000457c:	05813603          	ld	a2,88(sp)
    80004580:	06013683          	ld	a3,96(sp)
    80004584:	06813703          	ld	a4,104(sp)
    80004588:	07013783          	ld	a5,112(sp)
    8000458c:	07813803          	ld	a6,120(sp)
    80004590:	08013883          	ld	a7,128(sp)
    80004594:	08813903          	ld	s2,136(sp)
    80004598:	09013983          	ld	s3,144(sp)
    8000459c:	09813a03          	ld	s4,152(sp)
    800045a0:	0a013a83          	ld	s5,160(sp)
    800045a4:	0a813b03          	ld	s6,168(sp)
    800045a8:	0b013b83          	ld	s7,176(sp)
    800045ac:	0b813c03          	ld	s8,184(sp)
    800045b0:	0c013c83          	ld	s9,192(sp)
    800045b4:	0c813d03          	ld	s10,200(sp)
    800045b8:	0d013d83          	ld	s11,208(sp)
    800045bc:	0d813e03          	ld	t3,216(sp)
    800045c0:	0e013e83          	ld	t4,224(sp)
    800045c4:	0e813f03          	ld	t5,232(sp)
    800045c8:	0f013f83          	ld	t6,240(sp)
    800045cc:	10010113          	addi	sp,sp,256
    800045d0:	10200073          	sret
    800045d4:	00000013          	nop
    800045d8:	00000013          	nop
    800045dc:	00000013          	nop

00000000800045e0 <timervec>:
    800045e0:	34051573          	csrrw	a0,mscratch,a0
    800045e4:	00b53023          	sd	a1,0(a0)
    800045e8:	00c53423          	sd	a2,8(a0)
    800045ec:	00d53823          	sd	a3,16(a0)
    800045f0:	01853583          	ld	a1,24(a0)
    800045f4:	02053603          	ld	a2,32(a0)
    800045f8:	0005b683          	ld	a3,0(a1)
    800045fc:	00c686b3          	add	a3,a3,a2
    80004600:	00d5b023          	sd	a3,0(a1)
    80004604:	00200593          	li	a1,2
    80004608:	14459073          	csrw	sip,a1
    8000460c:	01053683          	ld	a3,16(a0)
    80004610:	00853603          	ld	a2,8(a0)
    80004614:	00053583          	ld	a1,0(a0)
    80004618:	34051573          	csrrw	a0,mscratch,a0
    8000461c:	30200073          	mret

0000000080004620 <plicinit>:
    80004620:	ff010113          	addi	sp,sp,-16
    80004624:	00813423          	sd	s0,8(sp)
    80004628:	01010413          	addi	s0,sp,16
    8000462c:	00813403          	ld	s0,8(sp)
    80004630:	0c0007b7          	lui	a5,0xc000
    80004634:	00100713          	li	a4,1
    80004638:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000463c:	00e7a223          	sw	a4,4(a5)
    80004640:	01010113          	addi	sp,sp,16
    80004644:	00008067          	ret

0000000080004648 <plicinithart>:
    80004648:	ff010113          	addi	sp,sp,-16
    8000464c:	00813023          	sd	s0,0(sp)
    80004650:	00113423          	sd	ra,8(sp)
    80004654:	01010413          	addi	s0,sp,16
    80004658:	00000097          	auipc	ra,0x0
    8000465c:	a48080e7          	jalr	-1464(ra) # 800040a0 <cpuid>
    80004660:	0085171b          	slliw	a4,a0,0x8
    80004664:	0c0027b7          	lui	a5,0xc002
    80004668:	00e787b3          	add	a5,a5,a4
    8000466c:	40200713          	li	a4,1026
    80004670:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80004674:	00813083          	ld	ra,8(sp)
    80004678:	00013403          	ld	s0,0(sp)
    8000467c:	00d5151b          	slliw	a0,a0,0xd
    80004680:	0c2017b7          	lui	a5,0xc201
    80004684:	00a78533          	add	a0,a5,a0
    80004688:	00052023          	sw	zero,0(a0)
    8000468c:	01010113          	addi	sp,sp,16
    80004690:	00008067          	ret

0000000080004694 <plic_claim>:
    80004694:	ff010113          	addi	sp,sp,-16
    80004698:	00813023          	sd	s0,0(sp)
    8000469c:	00113423          	sd	ra,8(sp)
    800046a0:	01010413          	addi	s0,sp,16
    800046a4:	00000097          	auipc	ra,0x0
    800046a8:	9fc080e7          	jalr	-1540(ra) # 800040a0 <cpuid>
    800046ac:	00813083          	ld	ra,8(sp)
    800046b0:	00013403          	ld	s0,0(sp)
    800046b4:	00d5151b          	slliw	a0,a0,0xd
    800046b8:	0c2017b7          	lui	a5,0xc201
    800046bc:	00a78533          	add	a0,a5,a0
    800046c0:	00452503          	lw	a0,4(a0)
    800046c4:	01010113          	addi	sp,sp,16
    800046c8:	00008067          	ret

00000000800046cc <plic_complete>:
    800046cc:	fe010113          	addi	sp,sp,-32
    800046d0:	00813823          	sd	s0,16(sp)
    800046d4:	00913423          	sd	s1,8(sp)
    800046d8:	00113c23          	sd	ra,24(sp)
    800046dc:	02010413          	addi	s0,sp,32
    800046e0:	00050493          	mv	s1,a0
    800046e4:	00000097          	auipc	ra,0x0
    800046e8:	9bc080e7          	jalr	-1604(ra) # 800040a0 <cpuid>
    800046ec:	01813083          	ld	ra,24(sp)
    800046f0:	01013403          	ld	s0,16(sp)
    800046f4:	00d5179b          	slliw	a5,a0,0xd
    800046f8:	0c201737          	lui	a4,0xc201
    800046fc:	00f707b3          	add	a5,a4,a5
    80004700:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004704:	00813483          	ld	s1,8(sp)
    80004708:	02010113          	addi	sp,sp,32
    8000470c:	00008067          	ret

0000000080004710 <consolewrite>:
    80004710:	fb010113          	addi	sp,sp,-80
    80004714:	04813023          	sd	s0,64(sp)
    80004718:	04113423          	sd	ra,72(sp)
    8000471c:	02913c23          	sd	s1,56(sp)
    80004720:	03213823          	sd	s2,48(sp)
    80004724:	03313423          	sd	s3,40(sp)
    80004728:	03413023          	sd	s4,32(sp)
    8000472c:	01513c23          	sd	s5,24(sp)
    80004730:	05010413          	addi	s0,sp,80
    80004734:	06c05c63          	blez	a2,800047ac <consolewrite+0x9c>
    80004738:	00060993          	mv	s3,a2
    8000473c:	00050a13          	mv	s4,a0
    80004740:	00058493          	mv	s1,a1
    80004744:	00000913          	li	s2,0
    80004748:	fff00a93          	li	s5,-1
    8000474c:	01c0006f          	j	80004768 <consolewrite+0x58>
    80004750:	fbf44503          	lbu	a0,-65(s0)
    80004754:	0019091b          	addiw	s2,s2,1
    80004758:	00148493          	addi	s1,s1,1
    8000475c:	00001097          	auipc	ra,0x1
    80004760:	a9c080e7          	jalr	-1380(ra) # 800051f8 <uartputc>
    80004764:	03298063          	beq	s3,s2,80004784 <consolewrite+0x74>
    80004768:	00048613          	mv	a2,s1
    8000476c:	00100693          	li	a3,1
    80004770:	000a0593          	mv	a1,s4
    80004774:	fbf40513          	addi	a0,s0,-65
    80004778:	00000097          	auipc	ra,0x0
    8000477c:	9e0080e7          	jalr	-1568(ra) # 80004158 <either_copyin>
    80004780:	fd5518e3          	bne	a0,s5,80004750 <consolewrite+0x40>
    80004784:	04813083          	ld	ra,72(sp)
    80004788:	04013403          	ld	s0,64(sp)
    8000478c:	03813483          	ld	s1,56(sp)
    80004790:	02813983          	ld	s3,40(sp)
    80004794:	02013a03          	ld	s4,32(sp)
    80004798:	01813a83          	ld	s5,24(sp)
    8000479c:	00090513          	mv	a0,s2
    800047a0:	03013903          	ld	s2,48(sp)
    800047a4:	05010113          	addi	sp,sp,80
    800047a8:	00008067          	ret
    800047ac:	00000913          	li	s2,0
    800047b0:	fd5ff06f          	j	80004784 <consolewrite+0x74>

00000000800047b4 <consoleread>:
    800047b4:	f9010113          	addi	sp,sp,-112
    800047b8:	06813023          	sd	s0,96(sp)
    800047bc:	04913c23          	sd	s1,88(sp)
    800047c0:	05213823          	sd	s2,80(sp)
    800047c4:	05313423          	sd	s3,72(sp)
    800047c8:	05413023          	sd	s4,64(sp)
    800047cc:	03513c23          	sd	s5,56(sp)
    800047d0:	03613823          	sd	s6,48(sp)
    800047d4:	03713423          	sd	s7,40(sp)
    800047d8:	03813023          	sd	s8,32(sp)
    800047dc:	06113423          	sd	ra,104(sp)
    800047e0:	01913c23          	sd	s9,24(sp)
    800047e4:	07010413          	addi	s0,sp,112
    800047e8:	00060b93          	mv	s7,a2
    800047ec:	00050913          	mv	s2,a0
    800047f0:	00058c13          	mv	s8,a1
    800047f4:	00060b1b          	sext.w	s6,a2
    800047f8:	00005497          	auipc	s1,0x5
    800047fc:	9c048493          	addi	s1,s1,-1600 # 800091b8 <cons>
    80004800:	00400993          	li	s3,4
    80004804:	fff00a13          	li	s4,-1
    80004808:	00a00a93          	li	s5,10
    8000480c:	05705e63          	blez	s7,80004868 <consoleread+0xb4>
    80004810:	09c4a703          	lw	a4,156(s1)
    80004814:	0984a783          	lw	a5,152(s1)
    80004818:	0007071b          	sext.w	a4,a4
    8000481c:	08e78463          	beq	a5,a4,800048a4 <consoleread+0xf0>
    80004820:	07f7f713          	andi	a4,a5,127
    80004824:	00e48733          	add	a4,s1,a4
    80004828:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000482c:	0017869b          	addiw	a3,a5,1
    80004830:	08d4ac23          	sw	a3,152(s1)
    80004834:	00070c9b          	sext.w	s9,a4
    80004838:	0b370663          	beq	a4,s3,800048e4 <consoleread+0x130>
    8000483c:	00100693          	li	a3,1
    80004840:	f9f40613          	addi	a2,s0,-97
    80004844:	000c0593          	mv	a1,s8
    80004848:	00090513          	mv	a0,s2
    8000484c:	f8e40fa3          	sb	a4,-97(s0)
    80004850:	00000097          	auipc	ra,0x0
    80004854:	8bc080e7          	jalr	-1860(ra) # 8000410c <either_copyout>
    80004858:	01450863          	beq	a0,s4,80004868 <consoleread+0xb4>
    8000485c:	001c0c13          	addi	s8,s8,1
    80004860:	fffb8b9b          	addiw	s7,s7,-1
    80004864:	fb5c94e3          	bne	s9,s5,8000480c <consoleread+0x58>
    80004868:	000b851b          	sext.w	a0,s7
    8000486c:	06813083          	ld	ra,104(sp)
    80004870:	06013403          	ld	s0,96(sp)
    80004874:	05813483          	ld	s1,88(sp)
    80004878:	05013903          	ld	s2,80(sp)
    8000487c:	04813983          	ld	s3,72(sp)
    80004880:	04013a03          	ld	s4,64(sp)
    80004884:	03813a83          	ld	s5,56(sp)
    80004888:	02813b83          	ld	s7,40(sp)
    8000488c:	02013c03          	ld	s8,32(sp)
    80004890:	01813c83          	ld	s9,24(sp)
    80004894:	40ab053b          	subw	a0,s6,a0
    80004898:	03013b03          	ld	s6,48(sp)
    8000489c:	07010113          	addi	sp,sp,112
    800048a0:	00008067          	ret
    800048a4:	00001097          	auipc	ra,0x1
    800048a8:	1d8080e7          	jalr	472(ra) # 80005a7c <push_on>
    800048ac:	0984a703          	lw	a4,152(s1)
    800048b0:	09c4a783          	lw	a5,156(s1)
    800048b4:	0007879b          	sext.w	a5,a5
    800048b8:	fef70ce3          	beq	a4,a5,800048b0 <consoleread+0xfc>
    800048bc:	00001097          	auipc	ra,0x1
    800048c0:	234080e7          	jalr	564(ra) # 80005af0 <pop_on>
    800048c4:	0984a783          	lw	a5,152(s1)
    800048c8:	07f7f713          	andi	a4,a5,127
    800048cc:	00e48733          	add	a4,s1,a4
    800048d0:	01874703          	lbu	a4,24(a4)
    800048d4:	0017869b          	addiw	a3,a5,1
    800048d8:	08d4ac23          	sw	a3,152(s1)
    800048dc:	00070c9b          	sext.w	s9,a4
    800048e0:	f5371ee3          	bne	a4,s3,8000483c <consoleread+0x88>
    800048e4:	000b851b          	sext.w	a0,s7
    800048e8:	f96bf2e3          	bgeu	s7,s6,8000486c <consoleread+0xb8>
    800048ec:	08f4ac23          	sw	a5,152(s1)
    800048f0:	f7dff06f          	j	8000486c <consoleread+0xb8>

00000000800048f4 <consputc>:
    800048f4:	10000793          	li	a5,256
    800048f8:	00f50663          	beq	a0,a5,80004904 <consputc+0x10>
    800048fc:	00001317          	auipc	t1,0x1
    80004900:	9f430067          	jr	-1548(t1) # 800052f0 <uartputc_sync>
    80004904:	ff010113          	addi	sp,sp,-16
    80004908:	00113423          	sd	ra,8(sp)
    8000490c:	00813023          	sd	s0,0(sp)
    80004910:	01010413          	addi	s0,sp,16
    80004914:	00800513          	li	a0,8
    80004918:	00001097          	auipc	ra,0x1
    8000491c:	9d8080e7          	jalr	-1576(ra) # 800052f0 <uartputc_sync>
    80004920:	02000513          	li	a0,32
    80004924:	00001097          	auipc	ra,0x1
    80004928:	9cc080e7          	jalr	-1588(ra) # 800052f0 <uartputc_sync>
    8000492c:	00013403          	ld	s0,0(sp)
    80004930:	00813083          	ld	ra,8(sp)
    80004934:	00800513          	li	a0,8
    80004938:	01010113          	addi	sp,sp,16
    8000493c:	00001317          	auipc	t1,0x1
    80004940:	9b430067          	jr	-1612(t1) # 800052f0 <uartputc_sync>

0000000080004944 <consoleintr>:
    80004944:	fe010113          	addi	sp,sp,-32
    80004948:	00813823          	sd	s0,16(sp)
    8000494c:	00913423          	sd	s1,8(sp)
    80004950:	01213023          	sd	s2,0(sp)
    80004954:	00113c23          	sd	ra,24(sp)
    80004958:	02010413          	addi	s0,sp,32
    8000495c:	00005917          	auipc	s2,0x5
    80004960:	85c90913          	addi	s2,s2,-1956 # 800091b8 <cons>
    80004964:	00050493          	mv	s1,a0
    80004968:	00090513          	mv	a0,s2
    8000496c:	00001097          	auipc	ra,0x1
    80004970:	e40080e7          	jalr	-448(ra) # 800057ac <acquire>
    80004974:	02048c63          	beqz	s1,800049ac <consoleintr+0x68>
    80004978:	0a092783          	lw	a5,160(s2)
    8000497c:	09892703          	lw	a4,152(s2)
    80004980:	07f00693          	li	a3,127
    80004984:	40e7873b          	subw	a4,a5,a4
    80004988:	02e6e263          	bltu	a3,a4,800049ac <consoleintr+0x68>
    8000498c:	00d00713          	li	a4,13
    80004990:	04e48063          	beq	s1,a4,800049d0 <consoleintr+0x8c>
    80004994:	07f7f713          	andi	a4,a5,127
    80004998:	00e90733          	add	a4,s2,a4
    8000499c:	0017879b          	addiw	a5,a5,1
    800049a0:	0af92023          	sw	a5,160(s2)
    800049a4:	00970c23          	sb	s1,24(a4)
    800049a8:	08f92e23          	sw	a5,156(s2)
    800049ac:	01013403          	ld	s0,16(sp)
    800049b0:	01813083          	ld	ra,24(sp)
    800049b4:	00813483          	ld	s1,8(sp)
    800049b8:	00013903          	ld	s2,0(sp)
    800049bc:	00004517          	auipc	a0,0x4
    800049c0:	7fc50513          	addi	a0,a0,2044 # 800091b8 <cons>
    800049c4:	02010113          	addi	sp,sp,32
    800049c8:	00001317          	auipc	t1,0x1
    800049cc:	eb030067          	jr	-336(t1) # 80005878 <release>
    800049d0:	00a00493          	li	s1,10
    800049d4:	fc1ff06f          	j	80004994 <consoleintr+0x50>

00000000800049d8 <consoleinit>:
    800049d8:	fe010113          	addi	sp,sp,-32
    800049dc:	00113c23          	sd	ra,24(sp)
    800049e0:	00813823          	sd	s0,16(sp)
    800049e4:	00913423          	sd	s1,8(sp)
    800049e8:	02010413          	addi	s0,sp,32
    800049ec:	00004497          	auipc	s1,0x4
    800049f0:	7cc48493          	addi	s1,s1,1996 # 800091b8 <cons>
    800049f4:	00048513          	mv	a0,s1
    800049f8:	00003597          	auipc	a1,0x3
    800049fc:	b0858593          	addi	a1,a1,-1272 # 80007500 <CONSOLE_STATUS+0x4f0>
    80004a00:	00001097          	auipc	ra,0x1
    80004a04:	d88080e7          	jalr	-632(ra) # 80005788 <initlock>
    80004a08:	00000097          	auipc	ra,0x0
    80004a0c:	7ac080e7          	jalr	1964(ra) # 800051b4 <uartinit>
    80004a10:	01813083          	ld	ra,24(sp)
    80004a14:	01013403          	ld	s0,16(sp)
    80004a18:	00000797          	auipc	a5,0x0
    80004a1c:	d9c78793          	addi	a5,a5,-612 # 800047b4 <consoleread>
    80004a20:	0af4bc23          	sd	a5,184(s1)
    80004a24:	00000797          	auipc	a5,0x0
    80004a28:	cec78793          	addi	a5,a5,-788 # 80004710 <consolewrite>
    80004a2c:	0cf4b023          	sd	a5,192(s1)
    80004a30:	00813483          	ld	s1,8(sp)
    80004a34:	02010113          	addi	sp,sp,32
    80004a38:	00008067          	ret

0000000080004a3c <console_read>:
    80004a3c:	ff010113          	addi	sp,sp,-16
    80004a40:	00813423          	sd	s0,8(sp)
    80004a44:	01010413          	addi	s0,sp,16
    80004a48:	00813403          	ld	s0,8(sp)
    80004a4c:	00005317          	auipc	t1,0x5
    80004a50:	82433303          	ld	t1,-2012(t1) # 80009270 <devsw+0x10>
    80004a54:	01010113          	addi	sp,sp,16
    80004a58:	00030067          	jr	t1

0000000080004a5c <console_write>:
    80004a5c:	ff010113          	addi	sp,sp,-16
    80004a60:	00813423          	sd	s0,8(sp)
    80004a64:	01010413          	addi	s0,sp,16
    80004a68:	00813403          	ld	s0,8(sp)
    80004a6c:	00005317          	auipc	t1,0x5
    80004a70:	80c33303          	ld	t1,-2036(t1) # 80009278 <devsw+0x18>
    80004a74:	01010113          	addi	sp,sp,16
    80004a78:	00030067          	jr	t1

0000000080004a7c <panic>:
    80004a7c:	fe010113          	addi	sp,sp,-32
    80004a80:	00113c23          	sd	ra,24(sp)
    80004a84:	00813823          	sd	s0,16(sp)
    80004a88:	00913423          	sd	s1,8(sp)
    80004a8c:	02010413          	addi	s0,sp,32
    80004a90:	00050493          	mv	s1,a0
    80004a94:	00003517          	auipc	a0,0x3
    80004a98:	a7450513          	addi	a0,a0,-1420 # 80007508 <CONSOLE_STATUS+0x4f8>
    80004a9c:	00005797          	auipc	a5,0x5
    80004aa0:	8607ae23          	sw	zero,-1924(a5) # 80009318 <pr+0x18>
    80004aa4:	00000097          	auipc	ra,0x0
    80004aa8:	034080e7          	jalr	52(ra) # 80004ad8 <__printf>
    80004aac:	00048513          	mv	a0,s1
    80004ab0:	00000097          	auipc	ra,0x0
    80004ab4:	028080e7          	jalr	40(ra) # 80004ad8 <__printf>
    80004ab8:	00003517          	auipc	a0,0x3
    80004abc:	a3050513          	addi	a0,a0,-1488 # 800074e8 <CONSOLE_STATUS+0x4d8>
    80004ac0:	00000097          	auipc	ra,0x0
    80004ac4:	018080e7          	jalr	24(ra) # 80004ad8 <__printf>
    80004ac8:	00100793          	li	a5,1
    80004acc:	00003717          	auipc	a4,0x3
    80004ad0:	5af72623          	sw	a5,1452(a4) # 80008078 <panicked>
    80004ad4:	0000006f          	j	80004ad4 <panic+0x58>

0000000080004ad8 <__printf>:
    80004ad8:	f3010113          	addi	sp,sp,-208
    80004adc:	08813023          	sd	s0,128(sp)
    80004ae0:	07313423          	sd	s3,104(sp)
    80004ae4:	09010413          	addi	s0,sp,144
    80004ae8:	05813023          	sd	s8,64(sp)
    80004aec:	08113423          	sd	ra,136(sp)
    80004af0:	06913c23          	sd	s1,120(sp)
    80004af4:	07213823          	sd	s2,112(sp)
    80004af8:	07413023          	sd	s4,96(sp)
    80004afc:	05513c23          	sd	s5,88(sp)
    80004b00:	05613823          	sd	s6,80(sp)
    80004b04:	05713423          	sd	s7,72(sp)
    80004b08:	03913c23          	sd	s9,56(sp)
    80004b0c:	03a13823          	sd	s10,48(sp)
    80004b10:	03b13423          	sd	s11,40(sp)
    80004b14:	00004317          	auipc	t1,0x4
    80004b18:	7ec30313          	addi	t1,t1,2028 # 80009300 <pr>
    80004b1c:	01832c03          	lw	s8,24(t1)
    80004b20:	00b43423          	sd	a1,8(s0)
    80004b24:	00c43823          	sd	a2,16(s0)
    80004b28:	00d43c23          	sd	a3,24(s0)
    80004b2c:	02e43023          	sd	a4,32(s0)
    80004b30:	02f43423          	sd	a5,40(s0)
    80004b34:	03043823          	sd	a6,48(s0)
    80004b38:	03143c23          	sd	a7,56(s0)
    80004b3c:	00050993          	mv	s3,a0
    80004b40:	4a0c1663          	bnez	s8,80004fec <__printf+0x514>
    80004b44:	60098c63          	beqz	s3,8000515c <__printf+0x684>
    80004b48:	0009c503          	lbu	a0,0(s3)
    80004b4c:	00840793          	addi	a5,s0,8
    80004b50:	f6f43c23          	sd	a5,-136(s0)
    80004b54:	00000493          	li	s1,0
    80004b58:	22050063          	beqz	a0,80004d78 <__printf+0x2a0>
    80004b5c:	00002a37          	lui	s4,0x2
    80004b60:	00018ab7          	lui	s5,0x18
    80004b64:	000f4b37          	lui	s6,0xf4
    80004b68:	00989bb7          	lui	s7,0x989
    80004b6c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004b70:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004b74:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004b78:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80004b7c:	00148c9b          	addiw	s9,s1,1
    80004b80:	02500793          	li	a5,37
    80004b84:	01998933          	add	s2,s3,s9
    80004b88:	38f51263          	bne	a0,a5,80004f0c <__printf+0x434>
    80004b8c:	00094783          	lbu	a5,0(s2)
    80004b90:	00078c9b          	sext.w	s9,a5
    80004b94:	1e078263          	beqz	a5,80004d78 <__printf+0x2a0>
    80004b98:	0024849b          	addiw	s1,s1,2
    80004b9c:	07000713          	li	a4,112
    80004ba0:	00998933          	add	s2,s3,s1
    80004ba4:	38e78a63          	beq	a5,a4,80004f38 <__printf+0x460>
    80004ba8:	20f76863          	bltu	a4,a5,80004db8 <__printf+0x2e0>
    80004bac:	42a78863          	beq	a5,a0,80004fdc <__printf+0x504>
    80004bb0:	06400713          	li	a4,100
    80004bb4:	40e79663          	bne	a5,a4,80004fc0 <__printf+0x4e8>
    80004bb8:	f7843783          	ld	a5,-136(s0)
    80004bbc:	0007a603          	lw	a2,0(a5)
    80004bc0:	00878793          	addi	a5,a5,8
    80004bc4:	f6f43c23          	sd	a5,-136(s0)
    80004bc8:	42064a63          	bltz	a2,80004ffc <__printf+0x524>
    80004bcc:	00a00713          	li	a4,10
    80004bd0:	02e677bb          	remuw	a5,a2,a4
    80004bd4:	00003d97          	auipc	s11,0x3
    80004bd8:	95cd8d93          	addi	s11,s11,-1700 # 80007530 <digits>
    80004bdc:	00900593          	li	a1,9
    80004be0:	0006051b          	sext.w	a0,a2
    80004be4:	00000c93          	li	s9,0
    80004be8:	02079793          	slli	a5,a5,0x20
    80004bec:	0207d793          	srli	a5,a5,0x20
    80004bf0:	00fd87b3          	add	a5,s11,a5
    80004bf4:	0007c783          	lbu	a5,0(a5)
    80004bf8:	02e656bb          	divuw	a3,a2,a4
    80004bfc:	f8f40023          	sb	a5,-128(s0)
    80004c00:	14c5d863          	bge	a1,a2,80004d50 <__printf+0x278>
    80004c04:	06300593          	li	a1,99
    80004c08:	00100c93          	li	s9,1
    80004c0c:	02e6f7bb          	remuw	a5,a3,a4
    80004c10:	02079793          	slli	a5,a5,0x20
    80004c14:	0207d793          	srli	a5,a5,0x20
    80004c18:	00fd87b3          	add	a5,s11,a5
    80004c1c:	0007c783          	lbu	a5,0(a5)
    80004c20:	02e6d73b          	divuw	a4,a3,a4
    80004c24:	f8f400a3          	sb	a5,-127(s0)
    80004c28:	12a5f463          	bgeu	a1,a0,80004d50 <__printf+0x278>
    80004c2c:	00a00693          	li	a3,10
    80004c30:	00900593          	li	a1,9
    80004c34:	02d777bb          	remuw	a5,a4,a3
    80004c38:	02079793          	slli	a5,a5,0x20
    80004c3c:	0207d793          	srli	a5,a5,0x20
    80004c40:	00fd87b3          	add	a5,s11,a5
    80004c44:	0007c503          	lbu	a0,0(a5)
    80004c48:	02d757bb          	divuw	a5,a4,a3
    80004c4c:	f8a40123          	sb	a0,-126(s0)
    80004c50:	48e5f263          	bgeu	a1,a4,800050d4 <__printf+0x5fc>
    80004c54:	06300513          	li	a0,99
    80004c58:	02d7f5bb          	remuw	a1,a5,a3
    80004c5c:	02059593          	slli	a1,a1,0x20
    80004c60:	0205d593          	srli	a1,a1,0x20
    80004c64:	00bd85b3          	add	a1,s11,a1
    80004c68:	0005c583          	lbu	a1,0(a1)
    80004c6c:	02d7d7bb          	divuw	a5,a5,a3
    80004c70:	f8b401a3          	sb	a1,-125(s0)
    80004c74:	48e57263          	bgeu	a0,a4,800050f8 <__printf+0x620>
    80004c78:	3e700513          	li	a0,999
    80004c7c:	02d7f5bb          	remuw	a1,a5,a3
    80004c80:	02059593          	slli	a1,a1,0x20
    80004c84:	0205d593          	srli	a1,a1,0x20
    80004c88:	00bd85b3          	add	a1,s11,a1
    80004c8c:	0005c583          	lbu	a1,0(a1)
    80004c90:	02d7d7bb          	divuw	a5,a5,a3
    80004c94:	f8b40223          	sb	a1,-124(s0)
    80004c98:	46e57663          	bgeu	a0,a4,80005104 <__printf+0x62c>
    80004c9c:	02d7f5bb          	remuw	a1,a5,a3
    80004ca0:	02059593          	slli	a1,a1,0x20
    80004ca4:	0205d593          	srli	a1,a1,0x20
    80004ca8:	00bd85b3          	add	a1,s11,a1
    80004cac:	0005c583          	lbu	a1,0(a1)
    80004cb0:	02d7d7bb          	divuw	a5,a5,a3
    80004cb4:	f8b402a3          	sb	a1,-123(s0)
    80004cb8:	46ea7863          	bgeu	s4,a4,80005128 <__printf+0x650>
    80004cbc:	02d7f5bb          	remuw	a1,a5,a3
    80004cc0:	02059593          	slli	a1,a1,0x20
    80004cc4:	0205d593          	srli	a1,a1,0x20
    80004cc8:	00bd85b3          	add	a1,s11,a1
    80004ccc:	0005c583          	lbu	a1,0(a1)
    80004cd0:	02d7d7bb          	divuw	a5,a5,a3
    80004cd4:	f8b40323          	sb	a1,-122(s0)
    80004cd8:	3eeaf863          	bgeu	s5,a4,800050c8 <__printf+0x5f0>
    80004cdc:	02d7f5bb          	remuw	a1,a5,a3
    80004ce0:	02059593          	slli	a1,a1,0x20
    80004ce4:	0205d593          	srli	a1,a1,0x20
    80004ce8:	00bd85b3          	add	a1,s11,a1
    80004cec:	0005c583          	lbu	a1,0(a1)
    80004cf0:	02d7d7bb          	divuw	a5,a5,a3
    80004cf4:	f8b403a3          	sb	a1,-121(s0)
    80004cf8:	42eb7e63          	bgeu	s6,a4,80005134 <__printf+0x65c>
    80004cfc:	02d7f5bb          	remuw	a1,a5,a3
    80004d00:	02059593          	slli	a1,a1,0x20
    80004d04:	0205d593          	srli	a1,a1,0x20
    80004d08:	00bd85b3          	add	a1,s11,a1
    80004d0c:	0005c583          	lbu	a1,0(a1)
    80004d10:	02d7d7bb          	divuw	a5,a5,a3
    80004d14:	f8b40423          	sb	a1,-120(s0)
    80004d18:	42ebfc63          	bgeu	s7,a4,80005150 <__printf+0x678>
    80004d1c:	02079793          	slli	a5,a5,0x20
    80004d20:	0207d793          	srli	a5,a5,0x20
    80004d24:	00fd8db3          	add	s11,s11,a5
    80004d28:	000dc703          	lbu	a4,0(s11)
    80004d2c:	00a00793          	li	a5,10
    80004d30:	00900c93          	li	s9,9
    80004d34:	f8e404a3          	sb	a4,-119(s0)
    80004d38:	00065c63          	bgez	a2,80004d50 <__printf+0x278>
    80004d3c:	f9040713          	addi	a4,s0,-112
    80004d40:	00f70733          	add	a4,a4,a5
    80004d44:	02d00693          	li	a3,45
    80004d48:	fed70823          	sb	a3,-16(a4)
    80004d4c:	00078c93          	mv	s9,a5
    80004d50:	f8040793          	addi	a5,s0,-128
    80004d54:	01978cb3          	add	s9,a5,s9
    80004d58:	f7f40d13          	addi	s10,s0,-129
    80004d5c:	000cc503          	lbu	a0,0(s9)
    80004d60:	fffc8c93          	addi	s9,s9,-1
    80004d64:	00000097          	auipc	ra,0x0
    80004d68:	b90080e7          	jalr	-1136(ra) # 800048f4 <consputc>
    80004d6c:	ffac98e3          	bne	s9,s10,80004d5c <__printf+0x284>
    80004d70:	00094503          	lbu	a0,0(s2)
    80004d74:	e00514e3          	bnez	a0,80004b7c <__printf+0xa4>
    80004d78:	1a0c1663          	bnez	s8,80004f24 <__printf+0x44c>
    80004d7c:	08813083          	ld	ra,136(sp)
    80004d80:	08013403          	ld	s0,128(sp)
    80004d84:	07813483          	ld	s1,120(sp)
    80004d88:	07013903          	ld	s2,112(sp)
    80004d8c:	06813983          	ld	s3,104(sp)
    80004d90:	06013a03          	ld	s4,96(sp)
    80004d94:	05813a83          	ld	s5,88(sp)
    80004d98:	05013b03          	ld	s6,80(sp)
    80004d9c:	04813b83          	ld	s7,72(sp)
    80004da0:	04013c03          	ld	s8,64(sp)
    80004da4:	03813c83          	ld	s9,56(sp)
    80004da8:	03013d03          	ld	s10,48(sp)
    80004dac:	02813d83          	ld	s11,40(sp)
    80004db0:	0d010113          	addi	sp,sp,208
    80004db4:	00008067          	ret
    80004db8:	07300713          	li	a4,115
    80004dbc:	1ce78a63          	beq	a5,a4,80004f90 <__printf+0x4b8>
    80004dc0:	07800713          	li	a4,120
    80004dc4:	1ee79e63          	bne	a5,a4,80004fc0 <__printf+0x4e8>
    80004dc8:	f7843783          	ld	a5,-136(s0)
    80004dcc:	0007a703          	lw	a4,0(a5)
    80004dd0:	00878793          	addi	a5,a5,8
    80004dd4:	f6f43c23          	sd	a5,-136(s0)
    80004dd8:	28074263          	bltz	a4,8000505c <__printf+0x584>
    80004ddc:	00002d97          	auipc	s11,0x2
    80004de0:	754d8d93          	addi	s11,s11,1876 # 80007530 <digits>
    80004de4:	00f77793          	andi	a5,a4,15
    80004de8:	00fd87b3          	add	a5,s11,a5
    80004dec:	0007c683          	lbu	a3,0(a5)
    80004df0:	00f00613          	li	a2,15
    80004df4:	0007079b          	sext.w	a5,a4
    80004df8:	f8d40023          	sb	a3,-128(s0)
    80004dfc:	0047559b          	srliw	a1,a4,0x4
    80004e00:	0047569b          	srliw	a3,a4,0x4
    80004e04:	00000c93          	li	s9,0
    80004e08:	0ee65063          	bge	a2,a4,80004ee8 <__printf+0x410>
    80004e0c:	00f6f693          	andi	a3,a3,15
    80004e10:	00dd86b3          	add	a3,s11,a3
    80004e14:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004e18:	0087d79b          	srliw	a5,a5,0x8
    80004e1c:	00100c93          	li	s9,1
    80004e20:	f8d400a3          	sb	a3,-127(s0)
    80004e24:	0cb67263          	bgeu	a2,a1,80004ee8 <__printf+0x410>
    80004e28:	00f7f693          	andi	a3,a5,15
    80004e2c:	00dd86b3          	add	a3,s11,a3
    80004e30:	0006c583          	lbu	a1,0(a3)
    80004e34:	00f00613          	li	a2,15
    80004e38:	0047d69b          	srliw	a3,a5,0x4
    80004e3c:	f8b40123          	sb	a1,-126(s0)
    80004e40:	0047d593          	srli	a1,a5,0x4
    80004e44:	28f67e63          	bgeu	a2,a5,800050e0 <__printf+0x608>
    80004e48:	00f6f693          	andi	a3,a3,15
    80004e4c:	00dd86b3          	add	a3,s11,a3
    80004e50:	0006c503          	lbu	a0,0(a3)
    80004e54:	0087d813          	srli	a6,a5,0x8
    80004e58:	0087d69b          	srliw	a3,a5,0x8
    80004e5c:	f8a401a3          	sb	a0,-125(s0)
    80004e60:	28b67663          	bgeu	a2,a1,800050ec <__printf+0x614>
    80004e64:	00f6f693          	andi	a3,a3,15
    80004e68:	00dd86b3          	add	a3,s11,a3
    80004e6c:	0006c583          	lbu	a1,0(a3)
    80004e70:	00c7d513          	srli	a0,a5,0xc
    80004e74:	00c7d69b          	srliw	a3,a5,0xc
    80004e78:	f8b40223          	sb	a1,-124(s0)
    80004e7c:	29067a63          	bgeu	a2,a6,80005110 <__printf+0x638>
    80004e80:	00f6f693          	andi	a3,a3,15
    80004e84:	00dd86b3          	add	a3,s11,a3
    80004e88:	0006c583          	lbu	a1,0(a3)
    80004e8c:	0107d813          	srli	a6,a5,0x10
    80004e90:	0107d69b          	srliw	a3,a5,0x10
    80004e94:	f8b402a3          	sb	a1,-123(s0)
    80004e98:	28a67263          	bgeu	a2,a0,8000511c <__printf+0x644>
    80004e9c:	00f6f693          	andi	a3,a3,15
    80004ea0:	00dd86b3          	add	a3,s11,a3
    80004ea4:	0006c683          	lbu	a3,0(a3)
    80004ea8:	0147d79b          	srliw	a5,a5,0x14
    80004eac:	f8d40323          	sb	a3,-122(s0)
    80004eb0:	21067663          	bgeu	a2,a6,800050bc <__printf+0x5e4>
    80004eb4:	02079793          	slli	a5,a5,0x20
    80004eb8:	0207d793          	srli	a5,a5,0x20
    80004ebc:	00fd8db3          	add	s11,s11,a5
    80004ec0:	000dc683          	lbu	a3,0(s11)
    80004ec4:	00800793          	li	a5,8
    80004ec8:	00700c93          	li	s9,7
    80004ecc:	f8d403a3          	sb	a3,-121(s0)
    80004ed0:	00075c63          	bgez	a4,80004ee8 <__printf+0x410>
    80004ed4:	f9040713          	addi	a4,s0,-112
    80004ed8:	00f70733          	add	a4,a4,a5
    80004edc:	02d00693          	li	a3,45
    80004ee0:	fed70823          	sb	a3,-16(a4)
    80004ee4:	00078c93          	mv	s9,a5
    80004ee8:	f8040793          	addi	a5,s0,-128
    80004eec:	01978cb3          	add	s9,a5,s9
    80004ef0:	f7f40d13          	addi	s10,s0,-129
    80004ef4:	000cc503          	lbu	a0,0(s9)
    80004ef8:	fffc8c93          	addi	s9,s9,-1
    80004efc:	00000097          	auipc	ra,0x0
    80004f00:	9f8080e7          	jalr	-1544(ra) # 800048f4 <consputc>
    80004f04:	ff9d18e3          	bne	s10,s9,80004ef4 <__printf+0x41c>
    80004f08:	0100006f          	j	80004f18 <__printf+0x440>
    80004f0c:	00000097          	auipc	ra,0x0
    80004f10:	9e8080e7          	jalr	-1560(ra) # 800048f4 <consputc>
    80004f14:	000c8493          	mv	s1,s9
    80004f18:	00094503          	lbu	a0,0(s2)
    80004f1c:	c60510e3          	bnez	a0,80004b7c <__printf+0xa4>
    80004f20:	e40c0ee3          	beqz	s8,80004d7c <__printf+0x2a4>
    80004f24:	00004517          	auipc	a0,0x4
    80004f28:	3dc50513          	addi	a0,a0,988 # 80009300 <pr>
    80004f2c:	00001097          	auipc	ra,0x1
    80004f30:	94c080e7          	jalr	-1716(ra) # 80005878 <release>
    80004f34:	e49ff06f          	j	80004d7c <__printf+0x2a4>
    80004f38:	f7843783          	ld	a5,-136(s0)
    80004f3c:	03000513          	li	a0,48
    80004f40:	01000d13          	li	s10,16
    80004f44:	00878713          	addi	a4,a5,8
    80004f48:	0007bc83          	ld	s9,0(a5)
    80004f4c:	f6e43c23          	sd	a4,-136(s0)
    80004f50:	00000097          	auipc	ra,0x0
    80004f54:	9a4080e7          	jalr	-1628(ra) # 800048f4 <consputc>
    80004f58:	07800513          	li	a0,120
    80004f5c:	00000097          	auipc	ra,0x0
    80004f60:	998080e7          	jalr	-1640(ra) # 800048f4 <consputc>
    80004f64:	00002d97          	auipc	s11,0x2
    80004f68:	5ccd8d93          	addi	s11,s11,1484 # 80007530 <digits>
    80004f6c:	03ccd793          	srli	a5,s9,0x3c
    80004f70:	00fd87b3          	add	a5,s11,a5
    80004f74:	0007c503          	lbu	a0,0(a5)
    80004f78:	fffd0d1b          	addiw	s10,s10,-1
    80004f7c:	004c9c93          	slli	s9,s9,0x4
    80004f80:	00000097          	auipc	ra,0x0
    80004f84:	974080e7          	jalr	-1676(ra) # 800048f4 <consputc>
    80004f88:	fe0d12e3          	bnez	s10,80004f6c <__printf+0x494>
    80004f8c:	f8dff06f          	j	80004f18 <__printf+0x440>
    80004f90:	f7843783          	ld	a5,-136(s0)
    80004f94:	0007bc83          	ld	s9,0(a5)
    80004f98:	00878793          	addi	a5,a5,8
    80004f9c:	f6f43c23          	sd	a5,-136(s0)
    80004fa0:	000c9a63          	bnez	s9,80004fb4 <__printf+0x4dc>
    80004fa4:	1080006f          	j	800050ac <__printf+0x5d4>
    80004fa8:	001c8c93          	addi	s9,s9,1
    80004fac:	00000097          	auipc	ra,0x0
    80004fb0:	948080e7          	jalr	-1720(ra) # 800048f4 <consputc>
    80004fb4:	000cc503          	lbu	a0,0(s9)
    80004fb8:	fe0518e3          	bnez	a0,80004fa8 <__printf+0x4d0>
    80004fbc:	f5dff06f          	j	80004f18 <__printf+0x440>
    80004fc0:	02500513          	li	a0,37
    80004fc4:	00000097          	auipc	ra,0x0
    80004fc8:	930080e7          	jalr	-1744(ra) # 800048f4 <consputc>
    80004fcc:	000c8513          	mv	a0,s9
    80004fd0:	00000097          	auipc	ra,0x0
    80004fd4:	924080e7          	jalr	-1756(ra) # 800048f4 <consputc>
    80004fd8:	f41ff06f          	j	80004f18 <__printf+0x440>
    80004fdc:	02500513          	li	a0,37
    80004fe0:	00000097          	auipc	ra,0x0
    80004fe4:	914080e7          	jalr	-1772(ra) # 800048f4 <consputc>
    80004fe8:	f31ff06f          	j	80004f18 <__printf+0x440>
    80004fec:	00030513          	mv	a0,t1
    80004ff0:	00000097          	auipc	ra,0x0
    80004ff4:	7bc080e7          	jalr	1980(ra) # 800057ac <acquire>
    80004ff8:	b4dff06f          	j	80004b44 <__printf+0x6c>
    80004ffc:	40c0053b          	negw	a0,a2
    80005000:	00a00713          	li	a4,10
    80005004:	02e576bb          	remuw	a3,a0,a4
    80005008:	00002d97          	auipc	s11,0x2
    8000500c:	528d8d93          	addi	s11,s11,1320 # 80007530 <digits>
    80005010:	ff700593          	li	a1,-9
    80005014:	02069693          	slli	a3,a3,0x20
    80005018:	0206d693          	srli	a3,a3,0x20
    8000501c:	00dd86b3          	add	a3,s11,a3
    80005020:	0006c683          	lbu	a3,0(a3)
    80005024:	02e557bb          	divuw	a5,a0,a4
    80005028:	f8d40023          	sb	a3,-128(s0)
    8000502c:	10b65e63          	bge	a2,a1,80005148 <__printf+0x670>
    80005030:	06300593          	li	a1,99
    80005034:	02e7f6bb          	remuw	a3,a5,a4
    80005038:	02069693          	slli	a3,a3,0x20
    8000503c:	0206d693          	srli	a3,a3,0x20
    80005040:	00dd86b3          	add	a3,s11,a3
    80005044:	0006c683          	lbu	a3,0(a3)
    80005048:	02e7d73b          	divuw	a4,a5,a4
    8000504c:	00200793          	li	a5,2
    80005050:	f8d400a3          	sb	a3,-127(s0)
    80005054:	bca5ece3          	bltu	a1,a0,80004c2c <__printf+0x154>
    80005058:	ce5ff06f          	j	80004d3c <__printf+0x264>
    8000505c:	40e007bb          	negw	a5,a4
    80005060:	00002d97          	auipc	s11,0x2
    80005064:	4d0d8d93          	addi	s11,s11,1232 # 80007530 <digits>
    80005068:	00f7f693          	andi	a3,a5,15
    8000506c:	00dd86b3          	add	a3,s11,a3
    80005070:	0006c583          	lbu	a1,0(a3)
    80005074:	ff100613          	li	a2,-15
    80005078:	0047d69b          	srliw	a3,a5,0x4
    8000507c:	f8b40023          	sb	a1,-128(s0)
    80005080:	0047d59b          	srliw	a1,a5,0x4
    80005084:	0ac75e63          	bge	a4,a2,80005140 <__printf+0x668>
    80005088:	00f6f693          	andi	a3,a3,15
    8000508c:	00dd86b3          	add	a3,s11,a3
    80005090:	0006c603          	lbu	a2,0(a3)
    80005094:	00f00693          	li	a3,15
    80005098:	0087d79b          	srliw	a5,a5,0x8
    8000509c:	f8c400a3          	sb	a2,-127(s0)
    800050a0:	d8b6e4e3          	bltu	a3,a1,80004e28 <__printf+0x350>
    800050a4:	00200793          	li	a5,2
    800050a8:	e2dff06f          	j	80004ed4 <__printf+0x3fc>
    800050ac:	00002c97          	auipc	s9,0x2
    800050b0:	464c8c93          	addi	s9,s9,1124 # 80007510 <CONSOLE_STATUS+0x500>
    800050b4:	02800513          	li	a0,40
    800050b8:	ef1ff06f          	j	80004fa8 <__printf+0x4d0>
    800050bc:	00700793          	li	a5,7
    800050c0:	00600c93          	li	s9,6
    800050c4:	e0dff06f          	j	80004ed0 <__printf+0x3f8>
    800050c8:	00700793          	li	a5,7
    800050cc:	00600c93          	li	s9,6
    800050d0:	c69ff06f          	j	80004d38 <__printf+0x260>
    800050d4:	00300793          	li	a5,3
    800050d8:	00200c93          	li	s9,2
    800050dc:	c5dff06f          	j	80004d38 <__printf+0x260>
    800050e0:	00300793          	li	a5,3
    800050e4:	00200c93          	li	s9,2
    800050e8:	de9ff06f          	j	80004ed0 <__printf+0x3f8>
    800050ec:	00400793          	li	a5,4
    800050f0:	00300c93          	li	s9,3
    800050f4:	dddff06f          	j	80004ed0 <__printf+0x3f8>
    800050f8:	00400793          	li	a5,4
    800050fc:	00300c93          	li	s9,3
    80005100:	c39ff06f          	j	80004d38 <__printf+0x260>
    80005104:	00500793          	li	a5,5
    80005108:	00400c93          	li	s9,4
    8000510c:	c2dff06f          	j	80004d38 <__printf+0x260>
    80005110:	00500793          	li	a5,5
    80005114:	00400c93          	li	s9,4
    80005118:	db9ff06f          	j	80004ed0 <__printf+0x3f8>
    8000511c:	00600793          	li	a5,6
    80005120:	00500c93          	li	s9,5
    80005124:	dadff06f          	j	80004ed0 <__printf+0x3f8>
    80005128:	00600793          	li	a5,6
    8000512c:	00500c93          	li	s9,5
    80005130:	c09ff06f          	j	80004d38 <__printf+0x260>
    80005134:	00800793          	li	a5,8
    80005138:	00700c93          	li	s9,7
    8000513c:	bfdff06f          	j	80004d38 <__printf+0x260>
    80005140:	00100793          	li	a5,1
    80005144:	d91ff06f          	j	80004ed4 <__printf+0x3fc>
    80005148:	00100793          	li	a5,1
    8000514c:	bf1ff06f          	j	80004d3c <__printf+0x264>
    80005150:	00900793          	li	a5,9
    80005154:	00800c93          	li	s9,8
    80005158:	be1ff06f          	j	80004d38 <__printf+0x260>
    8000515c:	00002517          	auipc	a0,0x2
    80005160:	3bc50513          	addi	a0,a0,956 # 80007518 <CONSOLE_STATUS+0x508>
    80005164:	00000097          	auipc	ra,0x0
    80005168:	918080e7          	jalr	-1768(ra) # 80004a7c <panic>

000000008000516c <printfinit>:
    8000516c:	fe010113          	addi	sp,sp,-32
    80005170:	00813823          	sd	s0,16(sp)
    80005174:	00913423          	sd	s1,8(sp)
    80005178:	00113c23          	sd	ra,24(sp)
    8000517c:	02010413          	addi	s0,sp,32
    80005180:	00004497          	auipc	s1,0x4
    80005184:	18048493          	addi	s1,s1,384 # 80009300 <pr>
    80005188:	00048513          	mv	a0,s1
    8000518c:	00002597          	auipc	a1,0x2
    80005190:	39c58593          	addi	a1,a1,924 # 80007528 <CONSOLE_STATUS+0x518>
    80005194:	00000097          	auipc	ra,0x0
    80005198:	5f4080e7          	jalr	1524(ra) # 80005788 <initlock>
    8000519c:	01813083          	ld	ra,24(sp)
    800051a0:	01013403          	ld	s0,16(sp)
    800051a4:	0004ac23          	sw	zero,24(s1)
    800051a8:	00813483          	ld	s1,8(sp)
    800051ac:	02010113          	addi	sp,sp,32
    800051b0:	00008067          	ret

00000000800051b4 <uartinit>:
    800051b4:	ff010113          	addi	sp,sp,-16
    800051b8:	00813423          	sd	s0,8(sp)
    800051bc:	01010413          	addi	s0,sp,16
    800051c0:	100007b7          	lui	a5,0x10000
    800051c4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800051c8:	f8000713          	li	a4,-128
    800051cc:	00e781a3          	sb	a4,3(a5)
    800051d0:	00300713          	li	a4,3
    800051d4:	00e78023          	sb	a4,0(a5)
    800051d8:	000780a3          	sb	zero,1(a5)
    800051dc:	00e781a3          	sb	a4,3(a5)
    800051e0:	00700693          	li	a3,7
    800051e4:	00d78123          	sb	a3,2(a5)
    800051e8:	00e780a3          	sb	a4,1(a5)
    800051ec:	00813403          	ld	s0,8(sp)
    800051f0:	01010113          	addi	sp,sp,16
    800051f4:	00008067          	ret

00000000800051f8 <uartputc>:
    800051f8:	00003797          	auipc	a5,0x3
    800051fc:	e807a783          	lw	a5,-384(a5) # 80008078 <panicked>
    80005200:	00078463          	beqz	a5,80005208 <uartputc+0x10>
    80005204:	0000006f          	j	80005204 <uartputc+0xc>
    80005208:	fd010113          	addi	sp,sp,-48
    8000520c:	02813023          	sd	s0,32(sp)
    80005210:	00913c23          	sd	s1,24(sp)
    80005214:	01213823          	sd	s2,16(sp)
    80005218:	01313423          	sd	s3,8(sp)
    8000521c:	02113423          	sd	ra,40(sp)
    80005220:	03010413          	addi	s0,sp,48
    80005224:	00003917          	auipc	s2,0x3
    80005228:	e5c90913          	addi	s2,s2,-420 # 80008080 <uart_tx_r>
    8000522c:	00093783          	ld	a5,0(s2)
    80005230:	00003497          	auipc	s1,0x3
    80005234:	e5848493          	addi	s1,s1,-424 # 80008088 <uart_tx_w>
    80005238:	0004b703          	ld	a4,0(s1)
    8000523c:	02078693          	addi	a3,a5,32
    80005240:	00050993          	mv	s3,a0
    80005244:	02e69c63          	bne	a3,a4,8000527c <uartputc+0x84>
    80005248:	00001097          	auipc	ra,0x1
    8000524c:	834080e7          	jalr	-1996(ra) # 80005a7c <push_on>
    80005250:	00093783          	ld	a5,0(s2)
    80005254:	0004b703          	ld	a4,0(s1)
    80005258:	02078793          	addi	a5,a5,32
    8000525c:	00e79463          	bne	a5,a4,80005264 <uartputc+0x6c>
    80005260:	0000006f          	j	80005260 <uartputc+0x68>
    80005264:	00001097          	auipc	ra,0x1
    80005268:	88c080e7          	jalr	-1908(ra) # 80005af0 <pop_on>
    8000526c:	00093783          	ld	a5,0(s2)
    80005270:	0004b703          	ld	a4,0(s1)
    80005274:	02078693          	addi	a3,a5,32
    80005278:	fce688e3          	beq	a3,a4,80005248 <uartputc+0x50>
    8000527c:	01f77693          	andi	a3,a4,31
    80005280:	00004597          	auipc	a1,0x4
    80005284:	0a058593          	addi	a1,a1,160 # 80009320 <uart_tx_buf>
    80005288:	00d586b3          	add	a3,a1,a3
    8000528c:	00170713          	addi	a4,a4,1
    80005290:	01368023          	sb	s3,0(a3)
    80005294:	00e4b023          	sd	a4,0(s1)
    80005298:	10000637          	lui	a2,0x10000
    8000529c:	02f71063          	bne	a4,a5,800052bc <uartputc+0xc4>
    800052a0:	0340006f          	j	800052d4 <uartputc+0xdc>
    800052a4:	00074703          	lbu	a4,0(a4)
    800052a8:	00f93023          	sd	a5,0(s2)
    800052ac:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800052b0:	00093783          	ld	a5,0(s2)
    800052b4:	0004b703          	ld	a4,0(s1)
    800052b8:	00f70e63          	beq	a4,a5,800052d4 <uartputc+0xdc>
    800052bc:	00564683          	lbu	a3,5(a2)
    800052c0:	01f7f713          	andi	a4,a5,31
    800052c4:	00e58733          	add	a4,a1,a4
    800052c8:	0206f693          	andi	a3,a3,32
    800052cc:	00178793          	addi	a5,a5,1
    800052d0:	fc069ae3          	bnez	a3,800052a4 <uartputc+0xac>
    800052d4:	02813083          	ld	ra,40(sp)
    800052d8:	02013403          	ld	s0,32(sp)
    800052dc:	01813483          	ld	s1,24(sp)
    800052e0:	01013903          	ld	s2,16(sp)
    800052e4:	00813983          	ld	s3,8(sp)
    800052e8:	03010113          	addi	sp,sp,48
    800052ec:	00008067          	ret

00000000800052f0 <uartputc_sync>:
    800052f0:	ff010113          	addi	sp,sp,-16
    800052f4:	00813423          	sd	s0,8(sp)
    800052f8:	01010413          	addi	s0,sp,16
    800052fc:	00003717          	auipc	a4,0x3
    80005300:	d7c72703          	lw	a4,-644(a4) # 80008078 <panicked>
    80005304:	02071663          	bnez	a4,80005330 <uartputc_sync+0x40>
    80005308:	00050793          	mv	a5,a0
    8000530c:	100006b7          	lui	a3,0x10000
    80005310:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005314:	02077713          	andi	a4,a4,32
    80005318:	fe070ce3          	beqz	a4,80005310 <uartputc_sync+0x20>
    8000531c:	0ff7f793          	andi	a5,a5,255
    80005320:	00f68023          	sb	a5,0(a3)
    80005324:	00813403          	ld	s0,8(sp)
    80005328:	01010113          	addi	sp,sp,16
    8000532c:	00008067          	ret
    80005330:	0000006f          	j	80005330 <uartputc_sync+0x40>

0000000080005334 <uartstart>:
    80005334:	ff010113          	addi	sp,sp,-16
    80005338:	00813423          	sd	s0,8(sp)
    8000533c:	01010413          	addi	s0,sp,16
    80005340:	00003617          	auipc	a2,0x3
    80005344:	d4060613          	addi	a2,a2,-704 # 80008080 <uart_tx_r>
    80005348:	00003517          	auipc	a0,0x3
    8000534c:	d4050513          	addi	a0,a0,-704 # 80008088 <uart_tx_w>
    80005350:	00063783          	ld	a5,0(a2)
    80005354:	00053703          	ld	a4,0(a0)
    80005358:	04f70263          	beq	a4,a5,8000539c <uartstart+0x68>
    8000535c:	100005b7          	lui	a1,0x10000
    80005360:	00004817          	auipc	a6,0x4
    80005364:	fc080813          	addi	a6,a6,-64 # 80009320 <uart_tx_buf>
    80005368:	01c0006f          	j	80005384 <uartstart+0x50>
    8000536c:	0006c703          	lbu	a4,0(a3)
    80005370:	00f63023          	sd	a5,0(a2)
    80005374:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005378:	00063783          	ld	a5,0(a2)
    8000537c:	00053703          	ld	a4,0(a0)
    80005380:	00f70e63          	beq	a4,a5,8000539c <uartstart+0x68>
    80005384:	01f7f713          	andi	a4,a5,31
    80005388:	00e806b3          	add	a3,a6,a4
    8000538c:	0055c703          	lbu	a4,5(a1)
    80005390:	00178793          	addi	a5,a5,1
    80005394:	02077713          	andi	a4,a4,32
    80005398:	fc071ae3          	bnez	a4,8000536c <uartstart+0x38>
    8000539c:	00813403          	ld	s0,8(sp)
    800053a0:	01010113          	addi	sp,sp,16
    800053a4:	00008067          	ret

00000000800053a8 <uartgetc>:
    800053a8:	ff010113          	addi	sp,sp,-16
    800053ac:	00813423          	sd	s0,8(sp)
    800053b0:	01010413          	addi	s0,sp,16
    800053b4:	10000737          	lui	a4,0x10000
    800053b8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800053bc:	0017f793          	andi	a5,a5,1
    800053c0:	00078c63          	beqz	a5,800053d8 <uartgetc+0x30>
    800053c4:	00074503          	lbu	a0,0(a4)
    800053c8:	0ff57513          	andi	a0,a0,255
    800053cc:	00813403          	ld	s0,8(sp)
    800053d0:	01010113          	addi	sp,sp,16
    800053d4:	00008067          	ret
    800053d8:	fff00513          	li	a0,-1
    800053dc:	ff1ff06f          	j	800053cc <uartgetc+0x24>

00000000800053e0 <uartintr>:
    800053e0:	100007b7          	lui	a5,0x10000
    800053e4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800053e8:	0017f793          	andi	a5,a5,1
    800053ec:	0a078463          	beqz	a5,80005494 <uartintr+0xb4>
    800053f0:	fe010113          	addi	sp,sp,-32
    800053f4:	00813823          	sd	s0,16(sp)
    800053f8:	00913423          	sd	s1,8(sp)
    800053fc:	00113c23          	sd	ra,24(sp)
    80005400:	02010413          	addi	s0,sp,32
    80005404:	100004b7          	lui	s1,0x10000
    80005408:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000540c:	0ff57513          	andi	a0,a0,255
    80005410:	fffff097          	auipc	ra,0xfffff
    80005414:	534080e7          	jalr	1332(ra) # 80004944 <consoleintr>
    80005418:	0054c783          	lbu	a5,5(s1)
    8000541c:	0017f793          	andi	a5,a5,1
    80005420:	fe0794e3          	bnez	a5,80005408 <uartintr+0x28>
    80005424:	00003617          	auipc	a2,0x3
    80005428:	c5c60613          	addi	a2,a2,-932 # 80008080 <uart_tx_r>
    8000542c:	00003517          	auipc	a0,0x3
    80005430:	c5c50513          	addi	a0,a0,-932 # 80008088 <uart_tx_w>
    80005434:	00063783          	ld	a5,0(a2)
    80005438:	00053703          	ld	a4,0(a0)
    8000543c:	04f70263          	beq	a4,a5,80005480 <uartintr+0xa0>
    80005440:	100005b7          	lui	a1,0x10000
    80005444:	00004817          	auipc	a6,0x4
    80005448:	edc80813          	addi	a6,a6,-292 # 80009320 <uart_tx_buf>
    8000544c:	01c0006f          	j	80005468 <uartintr+0x88>
    80005450:	0006c703          	lbu	a4,0(a3)
    80005454:	00f63023          	sd	a5,0(a2)
    80005458:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000545c:	00063783          	ld	a5,0(a2)
    80005460:	00053703          	ld	a4,0(a0)
    80005464:	00f70e63          	beq	a4,a5,80005480 <uartintr+0xa0>
    80005468:	01f7f713          	andi	a4,a5,31
    8000546c:	00e806b3          	add	a3,a6,a4
    80005470:	0055c703          	lbu	a4,5(a1)
    80005474:	00178793          	addi	a5,a5,1
    80005478:	02077713          	andi	a4,a4,32
    8000547c:	fc071ae3          	bnez	a4,80005450 <uartintr+0x70>
    80005480:	01813083          	ld	ra,24(sp)
    80005484:	01013403          	ld	s0,16(sp)
    80005488:	00813483          	ld	s1,8(sp)
    8000548c:	02010113          	addi	sp,sp,32
    80005490:	00008067          	ret
    80005494:	00003617          	auipc	a2,0x3
    80005498:	bec60613          	addi	a2,a2,-1044 # 80008080 <uart_tx_r>
    8000549c:	00003517          	auipc	a0,0x3
    800054a0:	bec50513          	addi	a0,a0,-1044 # 80008088 <uart_tx_w>
    800054a4:	00063783          	ld	a5,0(a2)
    800054a8:	00053703          	ld	a4,0(a0)
    800054ac:	04f70263          	beq	a4,a5,800054f0 <uartintr+0x110>
    800054b0:	100005b7          	lui	a1,0x10000
    800054b4:	00004817          	auipc	a6,0x4
    800054b8:	e6c80813          	addi	a6,a6,-404 # 80009320 <uart_tx_buf>
    800054bc:	01c0006f          	j	800054d8 <uartintr+0xf8>
    800054c0:	0006c703          	lbu	a4,0(a3)
    800054c4:	00f63023          	sd	a5,0(a2)
    800054c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800054cc:	00063783          	ld	a5,0(a2)
    800054d0:	00053703          	ld	a4,0(a0)
    800054d4:	02f70063          	beq	a4,a5,800054f4 <uartintr+0x114>
    800054d8:	01f7f713          	andi	a4,a5,31
    800054dc:	00e806b3          	add	a3,a6,a4
    800054e0:	0055c703          	lbu	a4,5(a1)
    800054e4:	00178793          	addi	a5,a5,1
    800054e8:	02077713          	andi	a4,a4,32
    800054ec:	fc071ae3          	bnez	a4,800054c0 <uartintr+0xe0>
    800054f0:	00008067          	ret
    800054f4:	00008067          	ret

00000000800054f8 <kinit>:
    800054f8:	fc010113          	addi	sp,sp,-64
    800054fc:	02913423          	sd	s1,40(sp)
    80005500:	fffff7b7          	lui	a5,0xfffff
    80005504:	00005497          	auipc	s1,0x5
    80005508:	e3b48493          	addi	s1,s1,-453 # 8000a33f <end+0xfff>
    8000550c:	02813823          	sd	s0,48(sp)
    80005510:	01313c23          	sd	s3,24(sp)
    80005514:	00f4f4b3          	and	s1,s1,a5
    80005518:	02113c23          	sd	ra,56(sp)
    8000551c:	03213023          	sd	s2,32(sp)
    80005520:	01413823          	sd	s4,16(sp)
    80005524:	01513423          	sd	s5,8(sp)
    80005528:	04010413          	addi	s0,sp,64
    8000552c:	000017b7          	lui	a5,0x1
    80005530:	01100993          	li	s3,17
    80005534:	00f487b3          	add	a5,s1,a5
    80005538:	01b99993          	slli	s3,s3,0x1b
    8000553c:	06f9e063          	bltu	s3,a5,8000559c <kinit+0xa4>
    80005540:	00004a97          	auipc	s5,0x4
    80005544:	e00a8a93          	addi	s5,s5,-512 # 80009340 <end>
    80005548:	0754ec63          	bltu	s1,s5,800055c0 <kinit+0xc8>
    8000554c:	0734fa63          	bgeu	s1,s3,800055c0 <kinit+0xc8>
    80005550:	00088a37          	lui	s4,0x88
    80005554:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80005558:	00003917          	auipc	s2,0x3
    8000555c:	b3890913          	addi	s2,s2,-1224 # 80008090 <kmem>
    80005560:	00ca1a13          	slli	s4,s4,0xc
    80005564:	0140006f          	j	80005578 <kinit+0x80>
    80005568:	000017b7          	lui	a5,0x1
    8000556c:	00f484b3          	add	s1,s1,a5
    80005570:	0554e863          	bltu	s1,s5,800055c0 <kinit+0xc8>
    80005574:	0534f663          	bgeu	s1,s3,800055c0 <kinit+0xc8>
    80005578:	00001637          	lui	a2,0x1
    8000557c:	00100593          	li	a1,1
    80005580:	00048513          	mv	a0,s1
    80005584:	00000097          	auipc	ra,0x0
    80005588:	5e4080e7          	jalr	1508(ra) # 80005b68 <__memset>
    8000558c:	00093783          	ld	a5,0(s2)
    80005590:	00f4b023          	sd	a5,0(s1)
    80005594:	00993023          	sd	s1,0(s2)
    80005598:	fd4498e3          	bne	s1,s4,80005568 <kinit+0x70>
    8000559c:	03813083          	ld	ra,56(sp)
    800055a0:	03013403          	ld	s0,48(sp)
    800055a4:	02813483          	ld	s1,40(sp)
    800055a8:	02013903          	ld	s2,32(sp)
    800055ac:	01813983          	ld	s3,24(sp)
    800055b0:	01013a03          	ld	s4,16(sp)
    800055b4:	00813a83          	ld	s5,8(sp)
    800055b8:	04010113          	addi	sp,sp,64
    800055bc:	00008067          	ret
    800055c0:	00002517          	auipc	a0,0x2
    800055c4:	f8850513          	addi	a0,a0,-120 # 80007548 <digits+0x18>
    800055c8:	fffff097          	auipc	ra,0xfffff
    800055cc:	4b4080e7          	jalr	1204(ra) # 80004a7c <panic>

00000000800055d0 <freerange>:
    800055d0:	fc010113          	addi	sp,sp,-64
    800055d4:	000017b7          	lui	a5,0x1
    800055d8:	02913423          	sd	s1,40(sp)
    800055dc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800055e0:	009504b3          	add	s1,a0,s1
    800055e4:	fffff537          	lui	a0,0xfffff
    800055e8:	02813823          	sd	s0,48(sp)
    800055ec:	02113c23          	sd	ra,56(sp)
    800055f0:	03213023          	sd	s2,32(sp)
    800055f4:	01313c23          	sd	s3,24(sp)
    800055f8:	01413823          	sd	s4,16(sp)
    800055fc:	01513423          	sd	s5,8(sp)
    80005600:	01613023          	sd	s6,0(sp)
    80005604:	04010413          	addi	s0,sp,64
    80005608:	00a4f4b3          	and	s1,s1,a0
    8000560c:	00f487b3          	add	a5,s1,a5
    80005610:	06f5e463          	bltu	a1,a5,80005678 <freerange+0xa8>
    80005614:	00004a97          	auipc	s5,0x4
    80005618:	d2ca8a93          	addi	s5,s5,-724 # 80009340 <end>
    8000561c:	0954e263          	bltu	s1,s5,800056a0 <freerange+0xd0>
    80005620:	01100993          	li	s3,17
    80005624:	01b99993          	slli	s3,s3,0x1b
    80005628:	0734fc63          	bgeu	s1,s3,800056a0 <freerange+0xd0>
    8000562c:	00058a13          	mv	s4,a1
    80005630:	00003917          	auipc	s2,0x3
    80005634:	a6090913          	addi	s2,s2,-1440 # 80008090 <kmem>
    80005638:	00002b37          	lui	s6,0x2
    8000563c:	0140006f          	j	80005650 <freerange+0x80>
    80005640:	000017b7          	lui	a5,0x1
    80005644:	00f484b3          	add	s1,s1,a5
    80005648:	0554ec63          	bltu	s1,s5,800056a0 <freerange+0xd0>
    8000564c:	0534fa63          	bgeu	s1,s3,800056a0 <freerange+0xd0>
    80005650:	00001637          	lui	a2,0x1
    80005654:	00100593          	li	a1,1
    80005658:	00048513          	mv	a0,s1
    8000565c:	00000097          	auipc	ra,0x0
    80005660:	50c080e7          	jalr	1292(ra) # 80005b68 <__memset>
    80005664:	00093703          	ld	a4,0(s2)
    80005668:	016487b3          	add	a5,s1,s6
    8000566c:	00e4b023          	sd	a4,0(s1)
    80005670:	00993023          	sd	s1,0(s2)
    80005674:	fcfa76e3          	bgeu	s4,a5,80005640 <freerange+0x70>
    80005678:	03813083          	ld	ra,56(sp)
    8000567c:	03013403          	ld	s0,48(sp)
    80005680:	02813483          	ld	s1,40(sp)
    80005684:	02013903          	ld	s2,32(sp)
    80005688:	01813983          	ld	s3,24(sp)
    8000568c:	01013a03          	ld	s4,16(sp)
    80005690:	00813a83          	ld	s5,8(sp)
    80005694:	00013b03          	ld	s6,0(sp)
    80005698:	04010113          	addi	sp,sp,64
    8000569c:	00008067          	ret
    800056a0:	00002517          	auipc	a0,0x2
    800056a4:	ea850513          	addi	a0,a0,-344 # 80007548 <digits+0x18>
    800056a8:	fffff097          	auipc	ra,0xfffff
    800056ac:	3d4080e7          	jalr	980(ra) # 80004a7c <panic>

00000000800056b0 <kfree>:
    800056b0:	fe010113          	addi	sp,sp,-32
    800056b4:	00813823          	sd	s0,16(sp)
    800056b8:	00113c23          	sd	ra,24(sp)
    800056bc:	00913423          	sd	s1,8(sp)
    800056c0:	02010413          	addi	s0,sp,32
    800056c4:	03451793          	slli	a5,a0,0x34
    800056c8:	04079c63          	bnez	a5,80005720 <kfree+0x70>
    800056cc:	00004797          	auipc	a5,0x4
    800056d0:	c7478793          	addi	a5,a5,-908 # 80009340 <end>
    800056d4:	00050493          	mv	s1,a0
    800056d8:	04f56463          	bltu	a0,a5,80005720 <kfree+0x70>
    800056dc:	01100793          	li	a5,17
    800056e0:	01b79793          	slli	a5,a5,0x1b
    800056e4:	02f57e63          	bgeu	a0,a5,80005720 <kfree+0x70>
    800056e8:	00001637          	lui	a2,0x1
    800056ec:	00100593          	li	a1,1
    800056f0:	00000097          	auipc	ra,0x0
    800056f4:	478080e7          	jalr	1144(ra) # 80005b68 <__memset>
    800056f8:	00003797          	auipc	a5,0x3
    800056fc:	99878793          	addi	a5,a5,-1640 # 80008090 <kmem>
    80005700:	0007b703          	ld	a4,0(a5)
    80005704:	01813083          	ld	ra,24(sp)
    80005708:	01013403          	ld	s0,16(sp)
    8000570c:	00e4b023          	sd	a4,0(s1)
    80005710:	0097b023          	sd	s1,0(a5)
    80005714:	00813483          	ld	s1,8(sp)
    80005718:	02010113          	addi	sp,sp,32
    8000571c:	00008067          	ret
    80005720:	00002517          	auipc	a0,0x2
    80005724:	e2850513          	addi	a0,a0,-472 # 80007548 <digits+0x18>
    80005728:	fffff097          	auipc	ra,0xfffff
    8000572c:	354080e7          	jalr	852(ra) # 80004a7c <panic>

0000000080005730 <kalloc>:
    80005730:	fe010113          	addi	sp,sp,-32
    80005734:	00813823          	sd	s0,16(sp)
    80005738:	00913423          	sd	s1,8(sp)
    8000573c:	00113c23          	sd	ra,24(sp)
    80005740:	02010413          	addi	s0,sp,32
    80005744:	00003797          	auipc	a5,0x3
    80005748:	94c78793          	addi	a5,a5,-1716 # 80008090 <kmem>
    8000574c:	0007b483          	ld	s1,0(a5)
    80005750:	02048063          	beqz	s1,80005770 <kalloc+0x40>
    80005754:	0004b703          	ld	a4,0(s1)
    80005758:	00001637          	lui	a2,0x1
    8000575c:	00500593          	li	a1,5
    80005760:	00048513          	mv	a0,s1
    80005764:	00e7b023          	sd	a4,0(a5)
    80005768:	00000097          	auipc	ra,0x0
    8000576c:	400080e7          	jalr	1024(ra) # 80005b68 <__memset>
    80005770:	01813083          	ld	ra,24(sp)
    80005774:	01013403          	ld	s0,16(sp)
    80005778:	00048513          	mv	a0,s1
    8000577c:	00813483          	ld	s1,8(sp)
    80005780:	02010113          	addi	sp,sp,32
    80005784:	00008067          	ret

0000000080005788 <initlock>:
    80005788:	ff010113          	addi	sp,sp,-16
    8000578c:	00813423          	sd	s0,8(sp)
    80005790:	01010413          	addi	s0,sp,16
    80005794:	00813403          	ld	s0,8(sp)
    80005798:	00b53423          	sd	a1,8(a0)
    8000579c:	00052023          	sw	zero,0(a0)
    800057a0:	00053823          	sd	zero,16(a0)
    800057a4:	01010113          	addi	sp,sp,16
    800057a8:	00008067          	ret

00000000800057ac <acquire>:
    800057ac:	fe010113          	addi	sp,sp,-32
    800057b0:	00813823          	sd	s0,16(sp)
    800057b4:	00913423          	sd	s1,8(sp)
    800057b8:	00113c23          	sd	ra,24(sp)
    800057bc:	01213023          	sd	s2,0(sp)
    800057c0:	02010413          	addi	s0,sp,32
    800057c4:	00050493          	mv	s1,a0
    800057c8:	10002973          	csrr	s2,sstatus
    800057cc:	100027f3          	csrr	a5,sstatus
    800057d0:	ffd7f793          	andi	a5,a5,-3
    800057d4:	10079073          	csrw	sstatus,a5
    800057d8:	fffff097          	auipc	ra,0xfffff
    800057dc:	8e8080e7          	jalr	-1816(ra) # 800040c0 <mycpu>
    800057e0:	07852783          	lw	a5,120(a0)
    800057e4:	06078e63          	beqz	a5,80005860 <acquire+0xb4>
    800057e8:	fffff097          	auipc	ra,0xfffff
    800057ec:	8d8080e7          	jalr	-1832(ra) # 800040c0 <mycpu>
    800057f0:	07852783          	lw	a5,120(a0)
    800057f4:	0004a703          	lw	a4,0(s1)
    800057f8:	0017879b          	addiw	a5,a5,1
    800057fc:	06f52c23          	sw	a5,120(a0)
    80005800:	04071063          	bnez	a4,80005840 <acquire+0x94>
    80005804:	00100713          	li	a4,1
    80005808:	00070793          	mv	a5,a4
    8000580c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005810:	0007879b          	sext.w	a5,a5
    80005814:	fe079ae3          	bnez	a5,80005808 <acquire+0x5c>
    80005818:	0ff0000f          	fence
    8000581c:	fffff097          	auipc	ra,0xfffff
    80005820:	8a4080e7          	jalr	-1884(ra) # 800040c0 <mycpu>
    80005824:	01813083          	ld	ra,24(sp)
    80005828:	01013403          	ld	s0,16(sp)
    8000582c:	00a4b823          	sd	a0,16(s1)
    80005830:	00013903          	ld	s2,0(sp)
    80005834:	00813483          	ld	s1,8(sp)
    80005838:	02010113          	addi	sp,sp,32
    8000583c:	00008067          	ret
    80005840:	0104b903          	ld	s2,16(s1)
    80005844:	fffff097          	auipc	ra,0xfffff
    80005848:	87c080e7          	jalr	-1924(ra) # 800040c0 <mycpu>
    8000584c:	faa91ce3          	bne	s2,a0,80005804 <acquire+0x58>
    80005850:	00002517          	auipc	a0,0x2
    80005854:	d0050513          	addi	a0,a0,-768 # 80007550 <digits+0x20>
    80005858:	fffff097          	auipc	ra,0xfffff
    8000585c:	224080e7          	jalr	548(ra) # 80004a7c <panic>
    80005860:	00195913          	srli	s2,s2,0x1
    80005864:	fffff097          	auipc	ra,0xfffff
    80005868:	85c080e7          	jalr	-1956(ra) # 800040c0 <mycpu>
    8000586c:	00197913          	andi	s2,s2,1
    80005870:	07252e23          	sw	s2,124(a0)
    80005874:	f75ff06f          	j	800057e8 <acquire+0x3c>

0000000080005878 <release>:
    80005878:	fe010113          	addi	sp,sp,-32
    8000587c:	00813823          	sd	s0,16(sp)
    80005880:	00113c23          	sd	ra,24(sp)
    80005884:	00913423          	sd	s1,8(sp)
    80005888:	01213023          	sd	s2,0(sp)
    8000588c:	02010413          	addi	s0,sp,32
    80005890:	00052783          	lw	a5,0(a0)
    80005894:	00079a63          	bnez	a5,800058a8 <release+0x30>
    80005898:	00002517          	auipc	a0,0x2
    8000589c:	cc050513          	addi	a0,a0,-832 # 80007558 <digits+0x28>
    800058a0:	fffff097          	auipc	ra,0xfffff
    800058a4:	1dc080e7          	jalr	476(ra) # 80004a7c <panic>
    800058a8:	01053903          	ld	s2,16(a0)
    800058ac:	00050493          	mv	s1,a0
    800058b0:	fffff097          	auipc	ra,0xfffff
    800058b4:	810080e7          	jalr	-2032(ra) # 800040c0 <mycpu>
    800058b8:	fea910e3          	bne	s2,a0,80005898 <release+0x20>
    800058bc:	0004b823          	sd	zero,16(s1)
    800058c0:	0ff0000f          	fence
    800058c4:	0f50000f          	fence	iorw,ow
    800058c8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800058cc:	ffffe097          	auipc	ra,0xffffe
    800058d0:	7f4080e7          	jalr	2036(ra) # 800040c0 <mycpu>
    800058d4:	100027f3          	csrr	a5,sstatus
    800058d8:	0027f793          	andi	a5,a5,2
    800058dc:	04079a63          	bnez	a5,80005930 <release+0xb8>
    800058e0:	07852783          	lw	a5,120(a0)
    800058e4:	02f05e63          	blez	a5,80005920 <release+0xa8>
    800058e8:	fff7871b          	addiw	a4,a5,-1
    800058ec:	06e52c23          	sw	a4,120(a0)
    800058f0:	00071c63          	bnez	a4,80005908 <release+0x90>
    800058f4:	07c52783          	lw	a5,124(a0)
    800058f8:	00078863          	beqz	a5,80005908 <release+0x90>
    800058fc:	100027f3          	csrr	a5,sstatus
    80005900:	0027e793          	ori	a5,a5,2
    80005904:	10079073          	csrw	sstatus,a5
    80005908:	01813083          	ld	ra,24(sp)
    8000590c:	01013403          	ld	s0,16(sp)
    80005910:	00813483          	ld	s1,8(sp)
    80005914:	00013903          	ld	s2,0(sp)
    80005918:	02010113          	addi	sp,sp,32
    8000591c:	00008067          	ret
    80005920:	00002517          	auipc	a0,0x2
    80005924:	c5850513          	addi	a0,a0,-936 # 80007578 <digits+0x48>
    80005928:	fffff097          	auipc	ra,0xfffff
    8000592c:	154080e7          	jalr	340(ra) # 80004a7c <panic>
    80005930:	00002517          	auipc	a0,0x2
    80005934:	c3050513          	addi	a0,a0,-976 # 80007560 <digits+0x30>
    80005938:	fffff097          	auipc	ra,0xfffff
    8000593c:	144080e7          	jalr	324(ra) # 80004a7c <panic>

0000000080005940 <holding>:
    80005940:	00052783          	lw	a5,0(a0)
    80005944:	00079663          	bnez	a5,80005950 <holding+0x10>
    80005948:	00000513          	li	a0,0
    8000594c:	00008067          	ret
    80005950:	fe010113          	addi	sp,sp,-32
    80005954:	00813823          	sd	s0,16(sp)
    80005958:	00913423          	sd	s1,8(sp)
    8000595c:	00113c23          	sd	ra,24(sp)
    80005960:	02010413          	addi	s0,sp,32
    80005964:	01053483          	ld	s1,16(a0)
    80005968:	ffffe097          	auipc	ra,0xffffe
    8000596c:	758080e7          	jalr	1880(ra) # 800040c0 <mycpu>
    80005970:	01813083          	ld	ra,24(sp)
    80005974:	01013403          	ld	s0,16(sp)
    80005978:	40a48533          	sub	a0,s1,a0
    8000597c:	00153513          	seqz	a0,a0
    80005980:	00813483          	ld	s1,8(sp)
    80005984:	02010113          	addi	sp,sp,32
    80005988:	00008067          	ret

000000008000598c <push_off>:
    8000598c:	fe010113          	addi	sp,sp,-32
    80005990:	00813823          	sd	s0,16(sp)
    80005994:	00113c23          	sd	ra,24(sp)
    80005998:	00913423          	sd	s1,8(sp)
    8000599c:	02010413          	addi	s0,sp,32
    800059a0:	100024f3          	csrr	s1,sstatus
    800059a4:	100027f3          	csrr	a5,sstatus
    800059a8:	ffd7f793          	andi	a5,a5,-3
    800059ac:	10079073          	csrw	sstatus,a5
    800059b0:	ffffe097          	auipc	ra,0xffffe
    800059b4:	710080e7          	jalr	1808(ra) # 800040c0 <mycpu>
    800059b8:	07852783          	lw	a5,120(a0)
    800059bc:	02078663          	beqz	a5,800059e8 <push_off+0x5c>
    800059c0:	ffffe097          	auipc	ra,0xffffe
    800059c4:	700080e7          	jalr	1792(ra) # 800040c0 <mycpu>
    800059c8:	07852783          	lw	a5,120(a0)
    800059cc:	01813083          	ld	ra,24(sp)
    800059d0:	01013403          	ld	s0,16(sp)
    800059d4:	0017879b          	addiw	a5,a5,1
    800059d8:	06f52c23          	sw	a5,120(a0)
    800059dc:	00813483          	ld	s1,8(sp)
    800059e0:	02010113          	addi	sp,sp,32
    800059e4:	00008067          	ret
    800059e8:	0014d493          	srli	s1,s1,0x1
    800059ec:	ffffe097          	auipc	ra,0xffffe
    800059f0:	6d4080e7          	jalr	1748(ra) # 800040c0 <mycpu>
    800059f4:	0014f493          	andi	s1,s1,1
    800059f8:	06952e23          	sw	s1,124(a0)
    800059fc:	fc5ff06f          	j	800059c0 <push_off+0x34>

0000000080005a00 <pop_off>:
    80005a00:	ff010113          	addi	sp,sp,-16
    80005a04:	00813023          	sd	s0,0(sp)
    80005a08:	00113423          	sd	ra,8(sp)
    80005a0c:	01010413          	addi	s0,sp,16
    80005a10:	ffffe097          	auipc	ra,0xffffe
    80005a14:	6b0080e7          	jalr	1712(ra) # 800040c0 <mycpu>
    80005a18:	100027f3          	csrr	a5,sstatus
    80005a1c:	0027f793          	andi	a5,a5,2
    80005a20:	04079663          	bnez	a5,80005a6c <pop_off+0x6c>
    80005a24:	07852783          	lw	a5,120(a0)
    80005a28:	02f05a63          	blez	a5,80005a5c <pop_off+0x5c>
    80005a2c:	fff7871b          	addiw	a4,a5,-1
    80005a30:	06e52c23          	sw	a4,120(a0)
    80005a34:	00071c63          	bnez	a4,80005a4c <pop_off+0x4c>
    80005a38:	07c52783          	lw	a5,124(a0)
    80005a3c:	00078863          	beqz	a5,80005a4c <pop_off+0x4c>
    80005a40:	100027f3          	csrr	a5,sstatus
    80005a44:	0027e793          	ori	a5,a5,2
    80005a48:	10079073          	csrw	sstatus,a5
    80005a4c:	00813083          	ld	ra,8(sp)
    80005a50:	00013403          	ld	s0,0(sp)
    80005a54:	01010113          	addi	sp,sp,16
    80005a58:	00008067          	ret
    80005a5c:	00002517          	auipc	a0,0x2
    80005a60:	b1c50513          	addi	a0,a0,-1252 # 80007578 <digits+0x48>
    80005a64:	fffff097          	auipc	ra,0xfffff
    80005a68:	018080e7          	jalr	24(ra) # 80004a7c <panic>
    80005a6c:	00002517          	auipc	a0,0x2
    80005a70:	af450513          	addi	a0,a0,-1292 # 80007560 <digits+0x30>
    80005a74:	fffff097          	auipc	ra,0xfffff
    80005a78:	008080e7          	jalr	8(ra) # 80004a7c <panic>

0000000080005a7c <push_on>:
    80005a7c:	fe010113          	addi	sp,sp,-32
    80005a80:	00813823          	sd	s0,16(sp)
    80005a84:	00113c23          	sd	ra,24(sp)
    80005a88:	00913423          	sd	s1,8(sp)
    80005a8c:	02010413          	addi	s0,sp,32
    80005a90:	100024f3          	csrr	s1,sstatus
    80005a94:	100027f3          	csrr	a5,sstatus
    80005a98:	0027e793          	ori	a5,a5,2
    80005a9c:	10079073          	csrw	sstatus,a5
    80005aa0:	ffffe097          	auipc	ra,0xffffe
    80005aa4:	620080e7          	jalr	1568(ra) # 800040c0 <mycpu>
    80005aa8:	07852783          	lw	a5,120(a0)
    80005aac:	02078663          	beqz	a5,80005ad8 <push_on+0x5c>
    80005ab0:	ffffe097          	auipc	ra,0xffffe
    80005ab4:	610080e7          	jalr	1552(ra) # 800040c0 <mycpu>
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
    80005ae0:	5e4080e7          	jalr	1508(ra) # 800040c0 <mycpu>
    80005ae4:	0014f493          	andi	s1,s1,1
    80005ae8:	06952e23          	sw	s1,124(a0)
    80005aec:	fc5ff06f          	j	80005ab0 <push_on+0x34>

0000000080005af0 <pop_on>:
    80005af0:	ff010113          	addi	sp,sp,-16
    80005af4:	00813023          	sd	s0,0(sp)
    80005af8:	00113423          	sd	ra,8(sp)
    80005afc:	01010413          	addi	s0,sp,16
    80005b00:	ffffe097          	auipc	ra,0xffffe
    80005b04:	5c0080e7          	jalr	1472(ra) # 800040c0 <mycpu>
    80005b08:	100027f3          	csrr	a5,sstatus
    80005b0c:	0027f793          	andi	a5,a5,2
    80005b10:	04078463          	beqz	a5,80005b58 <pop_on+0x68>
    80005b14:	07852783          	lw	a5,120(a0)
    80005b18:	02f05863          	blez	a5,80005b48 <pop_on+0x58>
    80005b1c:	fff7879b          	addiw	a5,a5,-1
    80005b20:	06f52c23          	sw	a5,120(a0)
    80005b24:	07853783          	ld	a5,120(a0)
    80005b28:	00079863          	bnez	a5,80005b38 <pop_on+0x48>
    80005b2c:	100027f3          	csrr	a5,sstatus
    80005b30:	ffd7f793          	andi	a5,a5,-3
    80005b34:	10079073          	csrw	sstatus,a5
    80005b38:	00813083          	ld	ra,8(sp)
    80005b3c:	00013403          	ld	s0,0(sp)
    80005b40:	01010113          	addi	sp,sp,16
    80005b44:	00008067          	ret
    80005b48:	00002517          	auipc	a0,0x2
    80005b4c:	a5850513          	addi	a0,a0,-1448 # 800075a0 <digits+0x70>
    80005b50:	fffff097          	auipc	ra,0xfffff
    80005b54:	f2c080e7          	jalr	-212(ra) # 80004a7c <panic>
    80005b58:	00002517          	auipc	a0,0x2
    80005b5c:	a2850513          	addi	a0,a0,-1496 # 80007580 <digits+0x50>
    80005b60:	fffff097          	auipc	ra,0xfffff
    80005b64:	f1c080e7          	jalr	-228(ra) # 80004a7c <panic>

0000000080005b68 <__memset>:
    80005b68:	ff010113          	addi	sp,sp,-16
    80005b6c:	00813423          	sd	s0,8(sp)
    80005b70:	01010413          	addi	s0,sp,16
    80005b74:	1a060e63          	beqz	a2,80005d30 <__memset+0x1c8>
    80005b78:	40a007b3          	neg	a5,a0
    80005b7c:	0077f793          	andi	a5,a5,7
    80005b80:	00778693          	addi	a3,a5,7
    80005b84:	00b00813          	li	a6,11
    80005b88:	0ff5f593          	andi	a1,a1,255
    80005b8c:	fff6071b          	addiw	a4,a2,-1
    80005b90:	1b06e663          	bltu	a3,a6,80005d3c <__memset+0x1d4>
    80005b94:	1cd76463          	bltu	a4,a3,80005d5c <__memset+0x1f4>
    80005b98:	1a078e63          	beqz	a5,80005d54 <__memset+0x1ec>
    80005b9c:	00b50023          	sb	a1,0(a0)
    80005ba0:	00100713          	li	a4,1
    80005ba4:	1ae78463          	beq	a5,a4,80005d4c <__memset+0x1e4>
    80005ba8:	00b500a3          	sb	a1,1(a0)
    80005bac:	00200713          	li	a4,2
    80005bb0:	1ae78a63          	beq	a5,a4,80005d64 <__memset+0x1fc>
    80005bb4:	00b50123          	sb	a1,2(a0)
    80005bb8:	00300713          	li	a4,3
    80005bbc:	18e78463          	beq	a5,a4,80005d44 <__memset+0x1dc>
    80005bc0:	00b501a3          	sb	a1,3(a0)
    80005bc4:	00400713          	li	a4,4
    80005bc8:	1ae78263          	beq	a5,a4,80005d6c <__memset+0x204>
    80005bcc:	00b50223          	sb	a1,4(a0)
    80005bd0:	00500713          	li	a4,5
    80005bd4:	1ae78063          	beq	a5,a4,80005d74 <__memset+0x20c>
    80005bd8:	00b502a3          	sb	a1,5(a0)
    80005bdc:	00700713          	li	a4,7
    80005be0:	18e79e63          	bne	a5,a4,80005d7c <__memset+0x214>
    80005be4:	00b50323          	sb	a1,6(a0)
    80005be8:	00700e93          	li	t4,7
    80005bec:	00859713          	slli	a4,a1,0x8
    80005bf0:	00e5e733          	or	a4,a1,a4
    80005bf4:	01059e13          	slli	t3,a1,0x10
    80005bf8:	01c76e33          	or	t3,a4,t3
    80005bfc:	01859313          	slli	t1,a1,0x18
    80005c00:	006e6333          	or	t1,t3,t1
    80005c04:	02059893          	slli	a7,a1,0x20
    80005c08:	40f60e3b          	subw	t3,a2,a5
    80005c0c:	011368b3          	or	a7,t1,a7
    80005c10:	02859813          	slli	a6,a1,0x28
    80005c14:	0108e833          	or	a6,a7,a6
    80005c18:	03059693          	slli	a3,a1,0x30
    80005c1c:	003e589b          	srliw	a7,t3,0x3
    80005c20:	00d866b3          	or	a3,a6,a3
    80005c24:	03859713          	slli	a4,a1,0x38
    80005c28:	00389813          	slli	a6,a7,0x3
    80005c2c:	00f507b3          	add	a5,a0,a5
    80005c30:	00e6e733          	or	a4,a3,a4
    80005c34:	000e089b          	sext.w	a7,t3
    80005c38:	00f806b3          	add	a3,a6,a5
    80005c3c:	00e7b023          	sd	a4,0(a5)
    80005c40:	00878793          	addi	a5,a5,8
    80005c44:	fed79ce3          	bne	a5,a3,80005c3c <__memset+0xd4>
    80005c48:	ff8e7793          	andi	a5,t3,-8
    80005c4c:	0007871b          	sext.w	a4,a5
    80005c50:	01d787bb          	addw	a5,a5,t4
    80005c54:	0ce88e63          	beq	a7,a4,80005d30 <__memset+0x1c8>
    80005c58:	00f50733          	add	a4,a0,a5
    80005c5c:	00b70023          	sb	a1,0(a4)
    80005c60:	0017871b          	addiw	a4,a5,1
    80005c64:	0cc77663          	bgeu	a4,a2,80005d30 <__memset+0x1c8>
    80005c68:	00e50733          	add	a4,a0,a4
    80005c6c:	00b70023          	sb	a1,0(a4)
    80005c70:	0027871b          	addiw	a4,a5,2
    80005c74:	0ac77e63          	bgeu	a4,a2,80005d30 <__memset+0x1c8>
    80005c78:	00e50733          	add	a4,a0,a4
    80005c7c:	00b70023          	sb	a1,0(a4)
    80005c80:	0037871b          	addiw	a4,a5,3
    80005c84:	0ac77663          	bgeu	a4,a2,80005d30 <__memset+0x1c8>
    80005c88:	00e50733          	add	a4,a0,a4
    80005c8c:	00b70023          	sb	a1,0(a4)
    80005c90:	0047871b          	addiw	a4,a5,4
    80005c94:	08c77e63          	bgeu	a4,a2,80005d30 <__memset+0x1c8>
    80005c98:	00e50733          	add	a4,a0,a4
    80005c9c:	00b70023          	sb	a1,0(a4)
    80005ca0:	0057871b          	addiw	a4,a5,5
    80005ca4:	08c77663          	bgeu	a4,a2,80005d30 <__memset+0x1c8>
    80005ca8:	00e50733          	add	a4,a0,a4
    80005cac:	00b70023          	sb	a1,0(a4)
    80005cb0:	0067871b          	addiw	a4,a5,6
    80005cb4:	06c77e63          	bgeu	a4,a2,80005d30 <__memset+0x1c8>
    80005cb8:	00e50733          	add	a4,a0,a4
    80005cbc:	00b70023          	sb	a1,0(a4)
    80005cc0:	0077871b          	addiw	a4,a5,7
    80005cc4:	06c77663          	bgeu	a4,a2,80005d30 <__memset+0x1c8>
    80005cc8:	00e50733          	add	a4,a0,a4
    80005ccc:	00b70023          	sb	a1,0(a4)
    80005cd0:	0087871b          	addiw	a4,a5,8
    80005cd4:	04c77e63          	bgeu	a4,a2,80005d30 <__memset+0x1c8>
    80005cd8:	00e50733          	add	a4,a0,a4
    80005cdc:	00b70023          	sb	a1,0(a4)
    80005ce0:	0097871b          	addiw	a4,a5,9
    80005ce4:	04c77663          	bgeu	a4,a2,80005d30 <__memset+0x1c8>
    80005ce8:	00e50733          	add	a4,a0,a4
    80005cec:	00b70023          	sb	a1,0(a4)
    80005cf0:	00a7871b          	addiw	a4,a5,10
    80005cf4:	02c77e63          	bgeu	a4,a2,80005d30 <__memset+0x1c8>
    80005cf8:	00e50733          	add	a4,a0,a4
    80005cfc:	00b70023          	sb	a1,0(a4)
    80005d00:	00b7871b          	addiw	a4,a5,11
    80005d04:	02c77663          	bgeu	a4,a2,80005d30 <__memset+0x1c8>
    80005d08:	00e50733          	add	a4,a0,a4
    80005d0c:	00b70023          	sb	a1,0(a4)
    80005d10:	00c7871b          	addiw	a4,a5,12
    80005d14:	00c77e63          	bgeu	a4,a2,80005d30 <__memset+0x1c8>
    80005d18:	00e50733          	add	a4,a0,a4
    80005d1c:	00b70023          	sb	a1,0(a4)
    80005d20:	00d7879b          	addiw	a5,a5,13
    80005d24:	00c7f663          	bgeu	a5,a2,80005d30 <__memset+0x1c8>
    80005d28:	00f507b3          	add	a5,a0,a5
    80005d2c:	00b78023          	sb	a1,0(a5)
    80005d30:	00813403          	ld	s0,8(sp)
    80005d34:	01010113          	addi	sp,sp,16
    80005d38:	00008067          	ret
    80005d3c:	00b00693          	li	a3,11
    80005d40:	e55ff06f          	j	80005b94 <__memset+0x2c>
    80005d44:	00300e93          	li	t4,3
    80005d48:	ea5ff06f          	j	80005bec <__memset+0x84>
    80005d4c:	00100e93          	li	t4,1
    80005d50:	e9dff06f          	j	80005bec <__memset+0x84>
    80005d54:	00000e93          	li	t4,0
    80005d58:	e95ff06f          	j	80005bec <__memset+0x84>
    80005d5c:	00000793          	li	a5,0
    80005d60:	ef9ff06f          	j	80005c58 <__memset+0xf0>
    80005d64:	00200e93          	li	t4,2
    80005d68:	e85ff06f          	j	80005bec <__memset+0x84>
    80005d6c:	00400e93          	li	t4,4
    80005d70:	e7dff06f          	j	80005bec <__memset+0x84>
    80005d74:	00500e93          	li	t4,5
    80005d78:	e75ff06f          	j	80005bec <__memset+0x84>
    80005d7c:	00600e93          	li	t4,6
    80005d80:	e6dff06f          	j	80005bec <__memset+0x84>

0000000080005d84 <__memmove>:
    80005d84:	ff010113          	addi	sp,sp,-16
    80005d88:	00813423          	sd	s0,8(sp)
    80005d8c:	01010413          	addi	s0,sp,16
    80005d90:	0e060863          	beqz	a2,80005e80 <__memmove+0xfc>
    80005d94:	fff6069b          	addiw	a3,a2,-1
    80005d98:	0006881b          	sext.w	a6,a3
    80005d9c:	0ea5e863          	bltu	a1,a0,80005e8c <__memmove+0x108>
    80005da0:	00758713          	addi	a4,a1,7
    80005da4:	00a5e7b3          	or	a5,a1,a0
    80005da8:	40a70733          	sub	a4,a4,a0
    80005dac:	0077f793          	andi	a5,a5,7
    80005db0:	00f73713          	sltiu	a4,a4,15
    80005db4:	00174713          	xori	a4,a4,1
    80005db8:	0017b793          	seqz	a5,a5
    80005dbc:	00e7f7b3          	and	a5,a5,a4
    80005dc0:	10078863          	beqz	a5,80005ed0 <__memmove+0x14c>
    80005dc4:	00900793          	li	a5,9
    80005dc8:	1107f463          	bgeu	a5,a6,80005ed0 <__memmove+0x14c>
    80005dcc:	0036581b          	srliw	a6,a2,0x3
    80005dd0:	fff8081b          	addiw	a6,a6,-1
    80005dd4:	02081813          	slli	a6,a6,0x20
    80005dd8:	01d85893          	srli	a7,a6,0x1d
    80005ddc:	00858813          	addi	a6,a1,8
    80005de0:	00058793          	mv	a5,a1
    80005de4:	00050713          	mv	a4,a0
    80005de8:	01088833          	add	a6,a7,a6
    80005dec:	0007b883          	ld	a7,0(a5)
    80005df0:	00878793          	addi	a5,a5,8
    80005df4:	00870713          	addi	a4,a4,8
    80005df8:	ff173c23          	sd	a7,-8(a4)
    80005dfc:	ff0798e3          	bne	a5,a6,80005dec <__memmove+0x68>
    80005e00:	ff867713          	andi	a4,a2,-8
    80005e04:	02071793          	slli	a5,a4,0x20
    80005e08:	0207d793          	srli	a5,a5,0x20
    80005e0c:	00f585b3          	add	a1,a1,a5
    80005e10:	40e686bb          	subw	a3,a3,a4
    80005e14:	00f507b3          	add	a5,a0,a5
    80005e18:	06e60463          	beq	a2,a4,80005e80 <__memmove+0xfc>
    80005e1c:	0005c703          	lbu	a4,0(a1)
    80005e20:	00e78023          	sb	a4,0(a5)
    80005e24:	04068e63          	beqz	a3,80005e80 <__memmove+0xfc>
    80005e28:	0015c603          	lbu	a2,1(a1)
    80005e2c:	00100713          	li	a4,1
    80005e30:	00c780a3          	sb	a2,1(a5)
    80005e34:	04e68663          	beq	a3,a4,80005e80 <__memmove+0xfc>
    80005e38:	0025c603          	lbu	a2,2(a1)
    80005e3c:	00200713          	li	a4,2
    80005e40:	00c78123          	sb	a2,2(a5)
    80005e44:	02e68e63          	beq	a3,a4,80005e80 <__memmove+0xfc>
    80005e48:	0035c603          	lbu	a2,3(a1)
    80005e4c:	00300713          	li	a4,3
    80005e50:	00c781a3          	sb	a2,3(a5)
    80005e54:	02e68663          	beq	a3,a4,80005e80 <__memmove+0xfc>
    80005e58:	0045c603          	lbu	a2,4(a1)
    80005e5c:	00400713          	li	a4,4
    80005e60:	00c78223          	sb	a2,4(a5)
    80005e64:	00e68e63          	beq	a3,a4,80005e80 <__memmove+0xfc>
    80005e68:	0055c603          	lbu	a2,5(a1)
    80005e6c:	00500713          	li	a4,5
    80005e70:	00c782a3          	sb	a2,5(a5)
    80005e74:	00e68663          	beq	a3,a4,80005e80 <__memmove+0xfc>
    80005e78:	0065c703          	lbu	a4,6(a1)
    80005e7c:	00e78323          	sb	a4,6(a5)
    80005e80:	00813403          	ld	s0,8(sp)
    80005e84:	01010113          	addi	sp,sp,16
    80005e88:	00008067          	ret
    80005e8c:	02061713          	slli	a4,a2,0x20
    80005e90:	02075713          	srli	a4,a4,0x20
    80005e94:	00e587b3          	add	a5,a1,a4
    80005e98:	f0f574e3          	bgeu	a0,a5,80005da0 <__memmove+0x1c>
    80005e9c:	02069613          	slli	a2,a3,0x20
    80005ea0:	02065613          	srli	a2,a2,0x20
    80005ea4:	fff64613          	not	a2,a2
    80005ea8:	00e50733          	add	a4,a0,a4
    80005eac:	00c78633          	add	a2,a5,a2
    80005eb0:	fff7c683          	lbu	a3,-1(a5)
    80005eb4:	fff78793          	addi	a5,a5,-1
    80005eb8:	fff70713          	addi	a4,a4,-1
    80005ebc:	00d70023          	sb	a3,0(a4)
    80005ec0:	fec798e3          	bne	a5,a2,80005eb0 <__memmove+0x12c>
    80005ec4:	00813403          	ld	s0,8(sp)
    80005ec8:	01010113          	addi	sp,sp,16
    80005ecc:	00008067          	ret
    80005ed0:	02069713          	slli	a4,a3,0x20
    80005ed4:	02075713          	srli	a4,a4,0x20
    80005ed8:	00170713          	addi	a4,a4,1
    80005edc:	00e50733          	add	a4,a0,a4
    80005ee0:	00050793          	mv	a5,a0
    80005ee4:	0005c683          	lbu	a3,0(a1)
    80005ee8:	00178793          	addi	a5,a5,1
    80005eec:	00158593          	addi	a1,a1,1
    80005ef0:	fed78fa3          	sb	a3,-1(a5)
    80005ef4:	fee798e3          	bne	a5,a4,80005ee4 <__memmove+0x160>
    80005ef8:	f89ff06f          	j	80005e80 <__memmove+0xfc>

0000000080005efc <__putc>:
    80005efc:	fe010113          	addi	sp,sp,-32
    80005f00:	00813823          	sd	s0,16(sp)
    80005f04:	00113c23          	sd	ra,24(sp)
    80005f08:	02010413          	addi	s0,sp,32
    80005f0c:	00050793          	mv	a5,a0
    80005f10:	fef40593          	addi	a1,s0,-17
    80005f14:	00100613          	li	a2,1
    80005f18:	00000513          	li	a0,0
    80005f1c:	fef407a3          	sb	a5,-17(s0)
    80005f20:	fffff097          	auipc	ra,0xfffff
    80005f24:	b3c080e7          	jalr	-1220(ra) # 80004a5c <console_write>
    80005f28:	01813083          	ld	ra,24(sp)
    80005f2c:	01013403          	ld	s0,16(sp)
    80005f30:	02010113          	addi	sp,sp,32
    80005f34:	00008067          	ret

0000000080005f38 <__getc>:
    80005f38:	fe010113          	addi	sp,sp,-32
    80005f3c:	00813823          	sd	s0,16(sp)
    80005f40:	00113c23          	sd	ra,24(sp)
    80005f44:	02010413          	addi	s0,sp,32
    80005f48:	fe840593          	addi	a1,s0,-24
    80005f4c:	00100613          	li	a2,1
    80005f50:	00000513          	li	a0,0
    80005f54:	fffff097          	auipc	ra,0xfffff
    80005f58:	ae8080e7          	jalr	-1304(ra) # 80004a3c <console_read>
    80005f5c:	fe844503          	lbu	a0,-24(s0)
    80005f60:	01813083          	ld	ra,24(sp)
    80005f64:	01013403          	ld	s0,16(sp)
    80005f68:	02010113          	addi	sp,sp,32
    80005f6c:	00008067          	ret

0000000080005f70 <console_handler>:
    80005f70:	fe010113          	addi	sp,sp,-32
    80005f74:	00813823          	sd	s0,16(sp)
    80005f78:	00113c23          	sd	ra,24(sp)
    80005f7c:	00913423          	sd	s1,8(sp)
    80005f80:	02010413          	addi	s0,sp,32
    80005f84:	14202773          	csrr	a4,scause
    80005f88:	100027f3          	csrr	a5,sstatus
    80005f8c:	0027f793          	andi	a5,a5,2
    80005f90:	06079e63          	bnez	a5,8000600c <console_handler+0x9c>
    80005f94:	00074c63          	bltz	a4,80005fac <console_handler+0x3c>
    80005f98:	01813083          	ld	ra,24(sp)
    80005f9c:	01013403          	ld	s0,16(sp)
    80005fa0:	00813483          	ld	s1,8(sp)
    80005fa4:	02010113          	addi	sp,sp,32
    80005fa8:	00008067          	ret
    80005fac:	0ff77713          	andi	a4,a4,255
    80005fb0:	00900793          	li	a5,9
    80005fb4:	fef712e3          	bne	a4,a5,80005f98 <console_handler+0x28>
    80005fb8:	ffffe097          	auipc	ra,0xffffe
    80005fbc:	6dc080e7          	jalr	1756(ra) # 80004694 <plic_claim>
    80005fc0:	00a00793          	li	a5,10
    80005fc4:	00050493          	mv	s1,a0
    80005fc8:	02f50c63          	beq	a0,a5,80006000 <console_handler+0x90>
    80005fcc:	fc0506e3          	beqz	a0,80005f98 <console_handler+0x28>
    80005fd0:	00050593          	mv	a1,a0
    80005fd4:	00001517          	auipc	a0,0x1
    80005fd8:	4d450513          	addi	a0,a0,1236 # 800074a8 <CONSOLE_STATUS+0x498>
    80005fdc:	fffff097          	auipc	ra,0xfffff
    80005fe0:	afc080e7          	jalr	-1284(ra) # 80004ad8 <__printf>
    80005fe4:	01013403          	ld	s0,16(sp)
    80005fe8:	01813083          	ld	ra,24(sp)
    80005fec:	00048513          	mv	a0,s1
    80005ff0:	00813483          	ld	s1,8(sp)
    80005ff4:	02010113          	addi	sp,sp,32
    80005ff8:	ffffe317          	auipc	t1,0xffffe
    80005ffc:	6d430067          	jr	1748(t1) # 800046cc <plic_complete>
    80006000:	fffff097          	auipc	ra,0xfffff
    80006004:	3e0080e7          	jalr	992(ra) # 800053e0 <uartintr>
    80006008:	fddff06f          	j	80005fe4 <console_handler+0x74>
    8000600c:	00001517          	auipc	a0,0x1
    80006010:	59c50513          	addi	a0,a0,1436 # 800075a8 <digits+0x78>
    80006014:	fffff097          	auipc	ra,0xfffff
    80006018:	a68080e7          	jalr	-1432(ra) # 80004a7c <panic>
	...
