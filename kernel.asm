
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00008117          	auipc	sp,0x8
    80000004:	04813103          	ld	sp,72(sp) # 80008048 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	4c0040ef          	jal	ra,800044dc <start>

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
    8000107c:	28d020ef          	jal	ra,80003b08 <exceptionHandler>


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
    8000111c:	f987b783          	ld	a5,-104(a5) # 800080b0 <_ZN5Timer8instanceE>
    80001120:	02079463          	bnez	a5,80001148 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80001124:	00007797          	auipc	a5,0x7
    80001128:	f897b623          	sd	s1,-116(a5) # 800080b0 <_ZN5Timer8instanceE>
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
    80001168:	7c0080e7          	jalr	1984(ra) # 80001924 <_Z13assert_failedPKcS0_jS0_>
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
    800011bc:	ef87b783          	ld	a5,-264(a5) # 800080b0 <_ZN5Timer8instanceE>
    800011c0:	00078863          	beqz	a5,800011d0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800011c4:	00007517          	auipc	a0,0x7
    800011c8:	eec53503          	ld	a0,-276(a0) # 800080b0 <_ZN5Timer8instanceE>
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
    80001200:	728080e7          	jalr	1832(ra) # 80001924 <_Z13assert_failedPKcS0_jS0_>
}
    80001204:	00007517          	auipc	a0,0x7
    80001208:	eac53503          	ld	a0,-340(a0) # 800080b0 <_ZN5Timer8instanceE>
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
    80001268:	400080e7          	jalr	1024(ra) # 80001664 <_Z4putcc>
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
    8000129c:	3cc080e7          	jalr	972(ra) # 80001664 <_Z4putcc>
            current->thread->setSleeping(false);
    800012a0:	00000593          	li	a1,0
    800012a4:	0004b503          	ld	a0,0(s1)
    800012a8:	00001097          	auipc	ra,0x1
    800012ac:	1c4080e7          	jalr	452(ra) # 8000246c <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    800012b0:	0004b503          	ld	a0,0(s1)
    800012b4:	00003097          	auipc	ra,0x3
    800012b8:	eb0080e7          	jalr	-336(ra) # 80004164 <_ZN9Scheduler3putEP7_thread>
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
    80001318:	d4c7b783          	ld	a5,-692(a5) # 80008060 <_GLOBAL_OFFSET_TABLE_+0x38>
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
    8000134c:	31c080e7          	jalr	796(ra) # 80001664 <_Z4putcc>
    while(w > 0){
    80001350:	02048063          	beqz	s1,80001370 <_ZN5Timer5sleepEm+0x88>
        putc('0' + w % 10);
    80001354:	00a00913          	li	s2,10
    80001358:	0324f533          	remu	a0,s1,s2
    8000135c:	03050513          	addi	a0,a0,48
    80001360:	00000097          	auipc	ra,0x0
    80001364:	304080e7          	jalr	772(ra) # 80001664 <_Z4putcc>
        w /= 10;
    80001368:	0324d4b3          	divu	s1,s1,s2
    while(w > 0){
    8000136c:	fe5ff06f          	j	80001350 <_ZN5Timer5sleepEm+0x68>
    }
    putc('\n');
    80001370:	00a00513          	li	a0,10
    80001374:	00000097          	auipc	ra,0x0
    80001378:	2f0080e7          	jalr	752(ra) # 80001664 <_Z4putcc>

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
    800013b0:	0c0080e7          	jalr	192(ra) # 8000246c <_ZN7_thread11setSleepingEb>
    putc('s');
    800013b4:	07300513          	li	a0,115
    800013b8:	00000097          	auipc	ra,0x0
    800013bc:	2ac080e7          	jalr	684(ra) # 80001664 <_Z4putcc>
    thread_dispatch();
    800013c0:	00000097          	auipc	ra,0x0
    800013c4:	150080e7          	jalr	336(ra) # 80001510 <_Z15thread_dispatchv>
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
 */

#include "syscalls_c.h"
#include "console.h"

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
    80001474:	fd010113          	addi	sp,sp,-48
    80001478:	02113423          	sd	ra,40(sp)
    8000147c:	02813023          	sd	s0,32(sp)
    80001480:	00913c23          	sd	s1,24(sp)
    80001484:	01213823          	sd	s2,16(sp)
    80001488:	01313423          	sd	s3,8(sp)
    8000148c:	03010413          	addi	s0,sp,48
    80001490:	00050493          	mv	s1,a0
    80001494:	00058913          	mv	s2,a1
    80001498:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    8000149c:	00001537          	lui	a0,0x1
    800014a0:	00000097          	auipc	ra,0x0
    800014a4:	f78080e7          	jalr	-136(ra) # 80001418 <_Z9mem_allocm>
    /// now we move the pointer up, since SP points to the first free location, and grows down
    __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space + DEFAULT_STACK_SIZE));
    800014a8:	000017b7          	lui	a5,0x1
    800014ac:	00f50533          	add	a0,a0,a5
    800014b0:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    800014b4:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    800014b8:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    800014bc:	00048593          	mv	a1,s1
    __asm__ volatile("li a0,0x11");
    800014c0:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    800014c4:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800014c8:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800014cc:	0005051b          	sext.w	a0,a0
    800014d0:	02813083          	ld	ra,40(sp)
    800014d4:	02013403          	ld	s0,32(sp)
    800014d8:	01813483          	ld	s1,24(sp)
    800014dc:	01013903          	ld	s2,16(sp)
    800014e0:	00813983          	ld	s3,8(sp)
    800014e4:	03010113          	addi	sp,sp,48
    800014e8:	00008067          	ret

00000000800014ec <_Z11thread_exitv>:

// int thread_createCPP ( thread_t*, void(*)(void*), void* );

int thread_exit (){
    800014ec:	ff010113          	addi	sp,sp,-16
    800014f0:	00813423          	sd	s0,8(sp)
    800014f4:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    800014f8:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    800014fc:	00000073          	ecall
    return 0;
}
    80001500:	00000513          	li	a0,0
    80001504:	00813403          	ld	s0,8(sp)
    80001508:	01010113          	addi	sp,sp,16
    8000150c:	00008067          	ret

0000000080001510 <_Z15thread_dispatchv>:

void thread_dispatch () {
    80001510:	ff010113          	addi	sp,sp,-16
    80001514:	00813423          	sd	s0,8(sp)
    80001518:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    8000151c:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    80001520:	00000073          	ecall
}
    80001524:	00813403          	ld	s0,8(sp)
    80001528:	01010113          	addi	sp,sp,16
    8000152c:	00008067          	ret

0000000080001530 <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    80001530:	ff010113          	addi	sp,sp,-16
    80001534:	00813423          	sd	s0,8(sp)
    80001538:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    8000153c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    80001540:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    80001544:	00000073          	ecall
}
    80001548:	00813403          	ld	s0,8(sp)
    8000154c:	01010113          	addi	sp,sp,16
    80001550:	00008067          	ret

0000000080001554 <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    80001554:	ff010113          	addi	sp,sp,-16
    80001558:	00813423          	sd	s0,8(sp)
    8000155c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    80001560:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    80001564:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001568:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    8000156c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001570:	0005051b          	sext.w	a0,a0
    80001574:	00813403          	ld	s0,8(sp)
    80001578:	01010113          	addi	sp,sp,16
    8000157c:	00008067          	ret

0000000080001580 <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    80001580:	ff010113          	addi	sp,sp,-16
    80001584:	00813423          	sd	s0,8(sp)
    80001588:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    8000158c:	02059593          	slli	a1,a1,0x20
    80001590:	0205d593          	srli	a1,a1,0x20
    80001594:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    80001598:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    8000159c:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    800015a0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800015a4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800015a8:	0005051b          	sext.w	a0,a0
    800015ac:	00813403          	ld	s0,8(sp)
    800015b0:	01010113          	addi	sp,sp,16
    800015b4:	00008067          	ret

00000000800015b8 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    800015b8:	ff010113          	addi	sp,sp,-16
    800015bc:	00813423          	sd	s0,8(sp)
    800015c0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800015c4:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    800015c8:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    800015cc:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800015d0:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800015d4:	0005051b          	sext.w	a0,a0
    800015d8:	00813403          	ld	s0,8(sp)
    800015dc:	01010113          	addi	sp,sp,16
    800015e0:	00008067          	ret

00000000800015e4 <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    800015e4:	ff010113          	addi	sp,sp,-16
    800015e8:	00813423          	sd	s0,8(sp)
    800015ec:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800015f0:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    800015f4:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    800015f8:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800015fc:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001600:	0005051b          	sext.w	a0,a0
    80001604:	00813403          	ld	s0,8(sp)
    80001608:	01010113          	addi	sp,sp,16
    8000160c:	00008067          	ret

0000000080001610 <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    80001610:	ff010113          	addi	sp,sp,-16
    80001614:	00813423          	sd	s0,8(sp)
    80001618:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    8000161c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    80001620:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    80001624:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001628:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    8000162c:	0005051b          	sext.w	a0,a0
    80001630:	00813403          	ld	s0,8(sp)
    80001634:	01010113          	addi	sp,sp,16
    80001638:	00008067          	ret

000000008000163c <_Z4getcv>:

char getc() {
    8000163c:	ff010113          	addi	sp,sp,-16
    80001640:	00813423          	sd	s0,8(sp)
    80001644:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    80001648:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    8000164c:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    80001650:	00050513          	mv	a0,a0
    return chr;
}
    80001654:	0ff57513          	andi	a0,a0,255
    80001658:	00813403          	ld	s0,8(sp)
    8000165c:	01010113          	addi	sp,sp,16
    80001660:	00008067          	ret

0000000080001664 <_Z4putcc>:

#include "console.h"

void putc(char chr ) {
    80001664:	ff010113          	addi	sp,sp,-16
    80001668:	00813423          	sd	s0,8(sp)
    8000166c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    80001670:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    80001674:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80001678:	00000073          	ecall
    8000167c:	00813403          	ld	s0,8(sp)
    80001680:	01010113          	addi	sp,sp,16
    80001684:	00008067          	ret

0000000080001688 <_ZN4_sem4openEPPS_j>:
#include "sem.h"
#include "syscalls_c.h"
#include "assert.h"
#include "sched.h"

void _sem::open(_sem** handle, unsigned init){
    80001688:	fe010113          	addi	sp,sp,-32
    8000168c:	00113c23          	sd	ra,24(sp)
    80001690:	00813823          	sd	s0,16(sp)
    80001694:	00913423          	sd	s1,8(sp)
    80001698:	01213023          	sd	s2,0(sp)
    8000169c:	02010413          	addi	s0,sp,32
    800016a0:	00050493          	mv	s1,a0
    800016a4:	00058913          	mv	s2,a1
    (*handle) = (sem_t)mem_alloc(sizeof(_sem));
    800016a8:	01800513          	li	a0,24
    800016ac:	00000097          	auipc	ra,0x0
    800016b0:	d6c080e7          	jalr	-660(ra) # 80001418 <_Z9mem_allocm>
    800016b4:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    800016b8:	00053023          	sd	zero,0(a0) # 1000 <_entry-0x7ffff000>
    (*handle)->blockTail = 0;
    800016bc:	0004b783          	ld	a5,0(s1)
    800016c0:	0007b423          	sd	zero,8(a5) # 1008 <_entry-0x7fffeff8>
    (*handle)->value = init;
    800016c4:	0004b783          	ld	a5,0(s1)
    800016c8:	0127a823          	sw	s2,16(a5)
}
    800016cc:	01813083          	ld	ra,24(sp)
    800016d0:	01013403          	ld	s0,16(sp)
    800016d4:	00813483          	ld	s1,8(sp)
    800016d8:	00013903          	ld	s2,0(sp)
    800016dc:	02010113          	addi	sp,sp,32
    800016e0:	00008067          	ret

00000000800016e4 <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    800016e4:	fe010113          	addi	sp,sp,-32
    800016e8:	00113c23          	sd	ra,24(sp)
    800016ec:	00813823          	sd	s0,16(sp)
    800016f0:	00913423          	sd	s1,8(sp)
    800016f4:	02010413          	addi	s0,sp,32
    800016f8:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    800016fc:	0004b783          	ld	a5,0(s1)
    80001700:	02078863          	beqz	a5,80001730 <_ZN4_sem5closeEPS_+0x4c>
        id->blockHead->pThread->setClosed(true);
    80001704:	00100593          	li	a1,1
    80001708:	0007b503          	ld	a0,0(a5)
    8000170c:	00001097          	auipc	ra,0x1
    80001710:	d34080e7          	jalr	-716(ra) # 80002440 <_ZN7_thread9setClosedEb>
        mem_free(id->blockHead);
    80001714:	0004b503          	ld	a0,0(s1)
    80001718:	00000097          	auipc	ra,0x0
    8000171c:	d30080e7          	jalr	-720(ra) # 80001448 <_Z8mem_freePv>
        id->blockHead = id->blockHead->pNext;
    80001720:	0004b783          	ld	a5,0(s1)
    80001724:	0087b783          	ld	a5,8(a5)
    80001728:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    8000172c:	fd1ff06f          	j	800016fc <_ZN4_sem5closeEPS_+0x18>
    }
}
    80001730:	01813083          	ld	ra,24(sp)
    80001734:	01013403          	ld	s0,16(sp)
    80001738:	00813483          	ld	s1,8(sp)
    8000173c:	02010113          	addi	sp,sp,32
    80001740:	00008067          	ret

0000000080001744 <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    80001744:	01052783          	lw	a5,16(a0)
    80001748:	fff7879b          	addiw	a5,a5,-1
    8000174c:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    80001750:	02079713          	slli	a4,a5,0x20
    80001754:	00074463          	bltz	a4,8000175c <_ZN4_sem4waitEPS_+0x18>
    80001758:	00008067          	ret
void _sem::wait(sem_t id){
    8000175c:	fe010113          	addi	sp,sp,-32
    80001760:	00113c23          	sd	ra,24(sp)
    80001764:	00813823          	sd	s0,16(sp)
    80001768:	00913423          	sd	s1,8(sp)
    8000176c:	02010413          	addi	s0,sp,32
    80001770:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    80001774:	01000513          	li	a0,16
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	ca0080e7          	jalr	-864(ra) # 80001418 <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    80001780:	00007797          	auipc	a5,0x7
    80001784:	8e07b783          	ld	a5,-1824(a5) # 80008060 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001788:	0007b783          	ld	a5,0(a5)
    8000178c:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    80001790:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    80001794:	0004b783          	ld	a5,0(s1)
    80001798:	04078263          	beqz	a5,800017dc <_ZN4_sem4waitEPS_+0x98>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    8000179c:	0084b783          	ld	a5,8(s1)
    800017a0:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    800017a4:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    800017a8:	00100593          	li	a1,1
    800017ac:	00007797          	auipc	a5,0x7
    800017b0:	8b47b783          	ld	a5,-1868(a5) # 80008060 <_GLOBAL_OFFSET_TABLE_+0x38>
    800017b4:	0007b503          	ld	a0,0(a5)
    800017b8:	00001097          	auipc	ra,0x1
    800017bc:	c58080e7          	jalr	-936(ra) # 80002410 <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    800017c0:	00001097          	auipc	ra,0x1
    800017c4:	d80080e7          	jalr	-640(ra) # 80002540 <_ZN7_thread8dispatchEv>
    }
}
    800017c8:	01813083          	ld	ra,24(sp)
    800017cc:	01013403          	ld	s0,16(sp)
    800017d0:	00813483          	ld	s1,8(sp)
    800017d4:	02010113          	addi	sp,sp,32
    800017d8:	00008067          	ret
            id->blockHead = pNewBlock;
    800017dc:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    800017e0:	00a4b423          	sd	a0,8(s1)
    800017e4:	fc5ff06f          	j	800017a8 <_ZN4_sem4waitEPS_+0x64>

00000000800017e8 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    800017e8:	01052783          	lw	a5,16(a0)
    800017ec:	0017879b          	addiw	a5,a5,1
    800017f0:	0007871b          	sext.w	a4,a5
    800017f4:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    800017f8:	00e05463          	blez	a4,80001800 <_ZN4_sem6signalEPS_+0x18>
    800017fc:	00008067          	ret
void _sem::signal(sem_t id){
    80001800:	fe010113          	addi	sp,sp,-32
    80001804:	00113c23          	sd	ra,24(sp)
    80001808:	00813823          	sd	s0,16(sp)
    8000180c:	00913423          	sd	s1,8(sp)
    80001810:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    80001814:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    80001818:	0084b783          	ld	a5,8(s1)
    8000181c:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    80001820:	04078063          	beqz	a5,80001860 <_ZN4_sem6signalEPS_+0x78>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    80001824:	00000593          	li	a1,0
    80001828:	0004b503          	ld	a0,0(s1)
    8000182c:	00001097          	auipc	ra,0x1
    80001830:	be4080e7          	jalr	-1052(ra) # 80002410 <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    80001834:	00048513          	mv	a0,s1
    80001838:	00000097          	auipc	ra,0x0
    8000183c:	c10080e7          	jalr	-1008(ra) # 80001448 <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    80001840:	0004b503          	ld	a0,0(s1)
    80001844:	00003097          	auipc	ra,0x3
    80001848:	920080e7          	jalr	-1760(ra) # 80004164 <_ZN9Scheduler3putEP7_thread>
    }
    8000184c:	01813083          	ld	ra,24(sp)
    80001850:	01013403          	ld	s0,16(sp)
    80001854:	00813483          	ld	s1,8(sp)
    80001858:	02010113          	addi	sp,sp,32
    8000185c:	00008067          	ret
            id->blockTail = 0;
    80001860:	00053423          	sd	zero,8(a0)
    80001864:	fc1ff06f          	j	80001824 <_ZN4_sem6signalEPS_+0x3c>

0000000080001868 <main>:

#include "kernel.h"
#include "assert.h"

/// @brief first function to be called
void main(){
    80001868:	fb010113          	addi	sp,sp,-80
    8000186c:	04113423          	sd	ra,72(sp)
    80001870:	04813023          	sd	s0,64(sp)
    80001874:	02913c23          	sd	s1,56(sp)
    80001878:	05010413          	addi	s0,sp,80
    Kernel kernel = Kernel();
    8000187c:	fb040493          	addi	s1,s0,-80
    80001880:	00048513          	mv	a0,s1
    80001884:	00000097          	auipc	ra,0x0
    80001888:	3cc080e7          	jalr	972(ra) # 80001c50 <_ZN6KernelC1Ev>
    kernel.initialise();
    8000188c:	00048513          	mv	a0,s1
    80001890:	00000097          	auipc	ra,0x0
    80001894:	434080e7          	jalr	1076(ra) # 80001cc4 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    80001898:	00048513          	mv	a0,s1
    8000189c:	00000097          	auipc	ra,0x0
    800018a0:	538080e7          	jalr	1336(ra) # 80001dd4 <_ZN6Kernel3runEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    800018a4:	02051863          	bnez	a0,800018d4 <main+0x6c>
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    800018a8:	fd040513          	addi	a0,s0,-48
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	8c4080e7          	jalr	-1852(ra) # 80001170 <_ZN5TimerD1Ev>
    800018b4:	fb040513          	addi	a0,s0,-80
    800018b8:	00001097          	auipc	ra,0x1
    800018bc:	f6c080e7          	jalr	-148(ra) # 80002824 <_ZN11HeapManagerD1Ev>
    800018c0:	04813083          	ld	ra,72(sp)
    800018c4:	04013403          	ld	s0,64(sp)
    800018c8:	03813483          	ld	s1,56(sp)
    800018cc:	05010113          	addi	sp,sp,80
    800018d0:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    800018d4:	00005697          	auipc	a3,0x5
    800018d8:	7b468693          	addi	a3,a3,1972 # 80007088 <CONSOLE_STATUS+0x78>
    800018dc:	01400613          	li	a2,20
    800018e0:	00005597          	auipc	a1,0x5
    800018e4:	7b858593          	addi	a1,a1,1976 # 80007098 <CONSOLE_STATUS+0x88>
    800018e8:	00005517          	auipc	a0,0x5
    800018ec:	7c050513          	addi	a0,a0,1984 # 800070a8 <CONSOLE_STATUS+0x98>
    800018f0:	00000097          	auipc	ra,0x0
    800018f4:	034080e7          	jalr	52(ra) # 80001924 <_Z13assert_failedPKcS0_jS0_>
    800018f8:	fb1ff06f          	j	800018a8 <main+0x40>
    800018fc:	00050493          	mv	s1,a0
    80001900:	fd040513          	addi	a0,s0,-48
    80001904:	00000097          	auipc	ra,0x0
    80001908:	86c080e7          	jalr	-1940(ra) # 80001170 <_ZN5TimerD1Ev>
    8000190c:	fb040513          	addi	a0,s0,-80
    80001910:	00001097          	auipc	ra,0x1
    80001914:	f14080e7          	jalr	-236(ra) # 80002824 <_ZN11HeapManagerD1Ev>
    80001918:	00048513          	mv	a0,s1
    8000191c:	00008097          	auipc	ra,0x8
    80001920:	89c080e7          	jalr	-1892(ra) # 800091b8 <_Unwind_Resume>

0000000080001924 <_Z13assert_failedPKcS0_jS0_>:
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    80001924:	fb010113          	addi	sp,sp,-80
    80001928:	04113423          	sd	ra,72(sp)
    8000192c:	04813023          	sd	s0,64(sp)
    80001930:	02913c23          	sd	s1,56(sp)
    80001934:	03213823          	sd	s2,48(sp)
    80001938:	03313423          	sd	s3,40(sp)
    8000193c:	03413023          	sd	s4,32(sp)
    80001940:	05010413          	addi	s0,sp,80
    80001944:	00050993          	mv	s3,a0
    80001948:	00058493          	mv	s1,a1
    8000194c:	00060913          	mv	s2,a2
    80001950:	00068a13          	mv	s4,a3
    putc('\n');
    80001954:	00a00513          	li	a0,10
    80001958:	00000097          	auipc	ra,0x0
    8000195c:	d0c080e7          	jalr	-756(ra) # 80001664 <_Z4putcc>
    putc('A');
    80001960:	04100513          	li	a0,65
    80001964:	00000097          	auipc	ra,0x0
    80001968:	d00080e7          	jalr	-768(ra) # 80001664 <_Z4putcc>
    putc('s');
    8000196c:	07300513          	li	a0,115
    80001970:	00000097          	auipc	ra,0x0
    80001974:	cf4080e7          	jalr	-780(ra) # 80001664 <_Z4putcc>
    putc('s');
    80001978:	07300513          	li	a0,115
    8000197c:	00000097          	auipc	ra,0x0
    80001980:	ce8080e7          	jalr	-792(ra) # 80001664 <_Z4putcc>
    putc('e');
    80001984:	06500513          	li	a0,101
    80001988:	00000097          	auipc	ra,0x0
    8000198c:	cdc080e7          	jalr	-804(ra) # 80001664 <_Z4putcc>
    putc('r');
    80001990:	07200513          	li	a0,114
    80001994:	00000097          	auipc	ra,0x0
    80001998:	cd0080e7          	jalr	-816(ra) # 80001664 <_Z4putcc>
    putc('t');
    8000199c:	07400513          	li	a0,116
    800019a0:	00000097          	auipc	ra,0x0
    800019a4:	cc4080e7          	jalr	-828(ra) # 80001664 <_Z4putcc>
    putc('i');
    800019a8:	06900513          	li	a0,105
    800019ac:	00000097          	auipc	ra,0x0
    800019b0:	cb8080e7          	jalr	-840(ra) # 80001664 <_Z4putcc>
    putc('o');
    800019b4:	06f00513          	li	a0,111
    800019b8:	00000097          	auipc	ra,0x0
    800019bc:	cac080e7          	jalr	-852(ra) # 80001664 <_Z4putcc>
    putc('n');
    800019c0:	06e00513          	li	a0,110
    800019c4:	00000097          	auipc	ra,0x0
    800019c8:	ca0080e7          	jalr	-864(ra) # 80001664 <_Z4putcc>
    putc(' ');
    800019cc:	02000513          	li	a0,32
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	c94080e7          	jalr	-876(ra) # 80001664 <_Z4putcc>
    putc('\'');
    800019d8:	02700513          	li	a0,39
    800019dc:	00000097          	auipc	ra,0x0
    800019e0:	c88080e7          	jalr	-888(ra) # 80001664 <_Z4putcc>
    while(*__assertion != 0){
    800019e4:	0009c503          	lbu	a0,0(s3)
    800019e8:	00050a63          	beqz	a0,800019fc <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    800019ec:	00000097          	auipc	ra,0x0
    800019f0:	c78080e7          	jalr	-904(ra) # 80001664 <_Z4putcc>
        __assertion++;
    800019f4:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    800019f8:	fedff06f          	j	800019e4 <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    800019fc:	02700513          	li	a0,39
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	c64080e7          	jalr	-924(ra) # 80001664 <_Z4putcc>
    putc(' ');
    80001a08:	02000513          	li	a0,32
    80001a0c:	00000097          	auipc	ra,0x0
    80001a10:	c58080e7          	jalr	-936(ra) # 80001664 <_Z4putcc>
    putc('f');
    80001a14:	06600513          	li	a0,102
    80001a18:	00000097          	auipc	ra,0x0
    80001a1c:	c4c080e7          	jalr	-948(ra) # 80001664 <_Z4putcc>
    putc('a');
    80001a20:	06100513          	li	a0,97
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	c40080e7          	jalr	-960(ra) # 80001664 <_Z4putcc>
    putc('i');
    80001a2c:	06900513          	li	a0,105
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	c34080e7          	jalr	-972(ra) # 80001664 <_Z4putcc>
    putc('l');
    80001a38:	06c00513          	li	a0,108
    80001a3c:	00000097          	auipc	ra,0x0
    80001a40:	c28080e7          	jalr	-984(ra) # 80001664 <_Z4putcc>
    putc('e');
    80001a44:	06500513          	li	a0,101
    80001a48:	00000097          	auipc	ra,0x0
    80001a4c:	c1c080e7          	jalr	-996(ra) # 80001664 <_Z4putcc>
    putc('d');
    80001a50:	06400513          	li	a0,100
    80001a54:	00000097          	auipc	ra,0x0
    80001a58:	c10080e7          	jalr	-1008(ra) # 80001664 <_Z4putcc>
    putc(' ');
    80001a5c:	02000513          	li	a0,32
    80001a60:	00000097          	auipc	ra,0x0
    80001a64:	c04080e7          	jalr	-1020(ra) # 80001664 <_Z4putcc>
    putc('i');
    80001a68:	06900513          	li	a0,105
    80001a6c:	00000097          	auipc	ra,0x0
    80001a70:	bf8080e7          	jalr	-1032(ra) # 80001664 <_Z4putcc>
    putc('n');
    80001a74:	06e00513          	li	a0,110
    80001a78:	00000097          	auipc	ra,0x0
    80001a7c:	bec080e7          	jalr	-1044(ra) # 80001664 <_Z4putcc>
    putc(' ');
    80001a80:	02000513          	li	a0,32
    80001a84:	00000097          	auipc	ra,0x0
    80001a88:	be0080e7          	jalr	-1056(ra) # 80001664 <_Z4putcc>
    putc('f');
    80001a8c:	06600513          	li	a0,102
    80001a90:	00000097          	auipc	ra,0x0
    80001a94:	bd4080e7          	jalr	-1068(ra) # 80001664 <_Z4putcc>
    putc('i');
    80001a98:	06900513          	li	a0,105
    80001a9c:	00000097          	auipc	ra,0x0
    80001aa0:	bc8080e7          	jalr	-1080(ra) # 80001664 <_Z4putcc>
    putc('l');
    80001aa4:	06c00513          	li	a0,108
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	bbc080e7          	jalr	-1092(ra) # 80001664 <_Z4putcc>
    putc('e');
    80001ab0:	06500513          	li	a0,101
    80001ab4:	00000097          	auipc	ra,0x0
    80001ab8:	bb0080e7          	jalr	-1104(ra) # 80001664 <_Z4putcc>
    putc(':');
    80001abc:	03a00513          	li	a0,58
    80001ac0:	00000097          	auipc	ra,0x0
    80001ac4:	ba4080e7          	jalr	-1116(ra) # 80001664 <_Z4putcc>
    putc(' ');
    80001ac8:	02000513          	li	a0,32
    80001acc:	00000097          	auipc	ra,0x0
    80001ad0:	b98080e7          	jalr	-1128(ra) # 80001664 <_Z4putcc>
    while(*__file != 0){
    80001ad4:	0004c503          	lbu	a0,0(s1)
    80001ad8:	00050a63          	beqz	a0,80001aec <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    80001adc:	00000097          	auipc	ra,0x0
    80001ae0:	b88080e7          	jalr	-1144(ra) # 80001664 <_Z4putcc>
        __file++;
    80001ae4:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80001ae8:	fedff06f          	j	80001ad4 <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    80001aec:	00a00513          	li	a0,10
    80001af0:	00000097          	auipc	ra,0x0
    80001af4:	b74080e7          	jalr	-1164(ra) # 80001664 <_Z4putcc>
    putc('l');
    80001af8:	06c00513          	li	a0,108
    80001afc:	00000097          	auipc	ra,0x0
    80001b00:	b68080e7          	jalr	-1176(ra) # 80001664 <_Z4putcc>
    putc('i');
    80001b04:	06900513          	li	a0,105
    80001b08:	00000097          	auipc	ra,0x0
    80001b0c:	b5c080e7          	jalr	-1188(ra) # 80001664 <_Z4putcc>
    putc('n');
    80001b10:	06e00513          	li	a0,110
    80001b14:	00000097          	auipc	ra,0x0
    80001b18:	b50080e7          	jalr	-1200(ra) # 80001664 <_Z4putcc>
    putc('e');
    80001b1c:	06500513          	li	a0,101
    80001b20:	00000097          	auipc	ra,0x0
    80001b24:	b44080e7          	jalr	-1212(ra) # 80001664 <_Z4putcc>
    putc(':');
    80001b28:	03a00513          	li	a0,58
    80001b2c:	00000097          	auipc	ra,0x0
    80001b30:	b38080e7          	jalr	-1224(ra) # 80001664 <_Z4putcc>
    putc(' ');
    80001b34:	02000513          	li	a0,32
    80001b38:	00000097          	auipc	ra,0x0
    80001b3c:	b2c080e7          	jalr	-1236(ra) # 80001664 <_Z4putcc>
    char buffer[20];
    int i = 0;
    80001b40:	00000493          	li	s1,0
    while(__line != 0){
    80001b44:	02090463          	beqz	s2,80001b6c <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80001b48:	00a00713          	li	a4,10
    80001b4c:	02e977bb          	remuw	a5,s2,a4
    80001b50:	0307879b          	addiw	a5,a5,48
    80001b54:	fd040693          	addi	a3,s0,-48
    80001b58:	009686b3          	add	a3,a3,s1
    80001b5c:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    80001b60:	02e9593b          	divuw	s2,s2,a4
        i++;
    80001b64:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    80001b68:	fddff06f          	j	80001b44 <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    80001b6c:	02048063          	beqz	s1,80001b8c <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    80001b70:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80001b74:	fd040793          	addi	a5,s0,-48
    80001b78:	009787b3          	add	a5,a5,s1
    80001b7c:	fe87c503          	lbu	a0,-24(a5)
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	ae4080e7          	jalr	-1308(ra) # 80001664 <_Z4putcc>
    80001b88:	fe5ff06f          	j	80001b6c <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80001b8c:	00a00513          	li	a0,10
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	ad4080e7          	jalr	-1324(ra) # 80001664 <_Z4putcc>
    putc('f');
    80001b98:	06600513          	li	a0,102
    80001b9c:	00000097          	auipc	ra,0x0
    80001ba0:	ac8080e7          	jalr	-1336(ra) # 80001664 <_Z4putcc>
    putc('u');
    80001ba4:	07500513          	li	a0,117
    80001ba8:	00000097          	auipc	ra,0x0
    80001bac:	abc080e7          	jalr	-1348(ra) # 80001664 <_Z4putcc>
    putc('n');
    80001bb0:	06e00513          	li	a0,110
    80001bb4:	00000097          	auipc	ra,0x0
    80001bb8:	ab0080e7          	jalr	-1360(ra) # 80001664 <_Z4putcc>
    putc('c');
    80001bbc:	06300513          	li	a0,99
    80001bc0:	00000097          	auipc	ra,0x0
    80001bc4:	aa4080e7          	jalr	-1372(ra) # 80001664 <_Z4putcc>
    putc('t');
    80001bc8:	07400513          	li	a0,116
    80001bcc:	00000097          	auipc	ra,0x0
    80001bd0:	a98080e7          	jalr	-1384(ra) # 80001664 <_Z4putcc>
    putc('i');
    80001bd4:	06900513          	li	a0,105
    80001bd8:	00000097          	auipc	ra,0x0
    80001bdc:	a8c080e7          	jalr	-1396(ra) # 80001664 <_Z4putcc>
    putc('o');
    80001be0:	06f00513          	li	a0,111
    80001be4:	00000097          	auipc	ra,0x0
    80001be8:	a80080e7          	jalr	-1408(ra) # 80001664 <_Z4putcc>
    putc('n');
    80001bec:	06e00513          	li	a0,110
    80001bf0:	00000097          	auipc	ra,0x0
    80001bf4:	a74080e7          	jalr	-1420(ra) # 80001664 <_Z4putcc>
    putc(':');
    80001bf8:	03a00513          	li	a0,58
    80001bfc:	00000097          	auipc	ra,0x0
    80001c00:	a68080e7          	jalr	-1432(ra) # 80001664 <_Z4putcc>
    putc(' ');
    80001c04:	02000513          	li	a0,32
    80001c08:	00000097          	auipc	ra,0x0
    80001c0c:	a5c080e7          	jalr	-1444(ra) # 80001664 <_Z4putcc>
    putc('\'');
    80001c10:	02700513          	li	a0,39
    80001c14:	00000097          	auipc	ra,0x0
    80001c18:	a50080e7          	jalr	-1456(ra) # 80001664 <_Z4putcc>
    while(*__function != 0){
    80001c1c:	000a4503          	lbu	a0,0(s4)
    80001c20:	00050a63          	beqz	a0,80001c34 <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    80001c24:	00000097          	auipc	ra,0x0
    80001c28:	a40080e7          	jalr	-1472(ra) # 80001664 <_Z4putcc>
        __function ++;
    80001c2c:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80001c30:	fedff06f          	j	80001c1c <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    80001c34:	02700513          	li	a0,39
    80001c38:	00000097          	auipc	ra,0x0
    80001c3c:	a2c080e7          	jalr	-1492(ra) # 80001664 <_Z4putcc>
    putc('\n');
    80001c40:	00a00513          	li	a0,10
    80001c44:	00000097          	auipc	ra,0x0
    80001c48:	a20080e7          	jalr	-1504(ra) # 80001664 <_Z4putcc>
    while(1);
    80001c4c:	0000006f          	j	80001c4c <_Z13assert_failedPKcS0_jS0_+0x328>

0000000080001c50 <_ZN6KernelC1Ev>:

#include "console.h"

extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80001c50:	fe010113          	addi	sp,sp,-32
    80001c54:	00113c23          	sd	ra,24(sp)
    80001c58:	00813823          	sd	s0,16(sp)
    80001c5c:	00913423          	sd	s1,8(sp)
    80001c60:	01213023          	sd	s2,0(sp)
    80001c64:	02010413          	addi	s0,sp,32
    80001c68:	00050493          	mv	s1,a0
    80001c6c:	00001097          	auipc	ra,0x1
    80001c70:	b50080e7          	jalr	-1200(ra) # 800027bc <_ZN11HeapManagerC1Ev>
    80001c74:	00848513          	addi	a0,s1,8
    80001c78:	00002097          	auipc	ra,0x2
    80001c7c:	454080e7          	jalr	1108(ra) # 800040cc <_ZN9SchedulerC1Ev>
    80001c80:	01848513          	addi	a0,s1,24
    80001c84:	fffff097          	auipc	ra,0xfffff
    80001c88:	47c080e7          	jalr	1148(ra) # 80001100 <_ZN5TimerC1Ev>
    80001c8c:	0200006f          	j	80001cac <_ZN6KernelC1Ev+0x5c>
    80001c90:	00050913          	mv	s2,a0
    80001c94:	00048513          	mv	a0,s1
    80001c98:	00001097          	auipc	ra,0x1
    80001c9c:	b8c080e7          	jalr	-1140(ra) # 80002824 <_ZN11HeapManagerD1Ev>
    80001ca0:	00090513          	mv	a0,s2
    80001ca4:	00007097          	auipc	ra,0x7
    80001ca8:	514080e7          	jalr	1300(ra) # 800091b8 <_Unwind_Resume>
    80001cac:	01813083          	ld	ra,24(sp)
    80001cb0:	01013403          	ld	s0,16(sp)
    80001cb4:	00813483          	ld	s1,8(sp)
    80001cb8:	00013903          	ld	s2,0(sp)
    80001cbc:	02010113          	addi	sp,sp,32
    80001cc0:	00008067          	ret

0000000080001cc4 <_ZN6Kernel10initialiseEv>:
 

void Kernel::initialise(){
    80001cc4:	ff010113          	addi	sp,sp,-16
    80001cc8:	00113423          	sd	ra,8(sp)
    80001ccc:	00813023          	sd	s0,0(sp)
    80001cd0:	01010413          	addi	s0,sp,16
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80001cd4:	00006797          	auipc	a5,0x6
    80001cd8:	37c7b783          	ld	a5,892(a5) # 80008050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001cdc:	10579073          	csrw	stvec,a5

    /// change to user mode

    uint64 sstatus;
    /// get the current sstatus
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80001ce0:	100027f3          	csrr	a5,sstatus
    /// set the SPP bit to 0
    sstatus &= ~(1 << 8);
    80001ce4:	eff7f793          	andi	a5,a5,-257
    /// write the new sstatus
    __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80001ce8:	10079073          	csrw	sstatus,a5
    
    /// NOW WE ARE IN USER MODE
    
    /// initialise the heap manager
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );
    80001cec:	00006797          	auipc	a5,0x6
    80001cf0:	36c7b783          	ld	a5,876(a5) # 80008058 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001cf4:	0007b603          	ld	a2,0(a5)
    80001cf8:	00006797          	auipc	a5,0x6
    80001cfc:	3387b783          	ld	a5,824(a5) # 80008030 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001d00:	0007b583          	ld	a1,0(a5)
    80001d04:	00001097          	auipc	ra,0x1
    80001d08:	b38080e7          	jalr	-1224(ra) # 8000283c <_ZN11HeapManager4initEmm>

    return;
}
    80001d0c:	00813083          	ld	ra,8(sp)
    80001d10:	00013403          	ld	s0,0(sp)
    80001d14:	01010113          	addi	sp,sp,16
    80001d18:	00008067          	ret

0000000080001d1c <_Z8testFuncPv>:

// sem_t sem = 0;

void testFunc(void* arg){
    80001d1c:	ff010113          	addi	sp,sp,-16
    80001d20:	00113423          	sd	ra,8(sp)
    80001d24:	00813023          	sd	s0,0(sp)
    80001d28:	01010413          	addi	s0,sp,16
    putc('t');
    80001d2c:	07400513          	li	a0,116
    80001d30:	00000097          	auipc	ra,0x0
    80001d34:	934080e7          	jalr	-1740(ra) # 80001664 <_Z4putcc>
    putc('e');
    80001d38:	06500513          	li	a0,101
    80001d3c:	00000097          	auipc	ra,0x0
    80001d40:	928080e7          	jalr	-1752(ra) # 80001664 <_Z4putcc>
    putc('s');
    80001d44:	07300513          	li	a0,115
    80001d48:	00000097          	auipc	ra,0x0
    80001d4c:	91c080e7          	jalr	-1764(ra) # 80001664 <_Z4putcc>
    putc('t');
    80001d50:	07400513          	li	a0,116
    80001d54:	00000097          	auipc	ra,0x0
    80001d58:	910080e7          	jalr	-1776(ra) # 80001664 <_Z4putcc>

    // sem_wait(sem);
    // thread_dispatch();
    // thread_dispatch();
    thread_dispatch();
    80001d5c:	fffff097          	auipc	ra,0xfffff
    80001d60:	7b4080e7          	jalr	1972(ra) # 80001510 <_Z15thread_dispatchv>

    // time_sleep(10);
    putc(' ');
    80001d64:	02000513          	li	a0,32
    80001d68:	00000097          	auipc	ra,0x0
    80001d6c:	8fc080e7          	jalr	-1796(ra) # 80001664 <_Z4putcc>

    putc('t');
    80001d70:	07400513          	li	a0,116
    80001d74:	00000097          	auipc	ra,0x0
    80001d78:	8f0080e7          	jalr	-1808(ra) # 80001664 <_Z4putcc>
    putc('h');
    80001d7c:	06800513          	li	a0,104
    80001d80:	00000097          	auipc	ra,0x0
    80001d84:	8e4080e7          	jalr	-1820(ra) # 80001664 <_Z4putcc>
    putc('r');
    80001d88:	07200513          	li	a0,114
    80001d8c:	00000097          	auipc	ra,0x0
    80001d90:	8d8080e7          	jalr	-1832(ra) # 80001664 <_Z4putcc>
    putc('e');
    80001d94:	06500513          	li	a0,101
    80001d98:	00000097          	auipc	ra,0x0
    80001d9c:	8cc080e7          	jalr	-1844(ra) # 80001664 <_Z4putcc>
    putc('a');
    80001da0:	06100513          	li	a0,97
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	8c0080e7          	jalr	-1856(ra) # 80001664 <_Z4putcc>
    putc('d');
    80001dac:	06400513          	li	a0,100
    80001db0:	00000097          	auipc	ra,0x0
    80001db4:	8b4080e7          	jalr	-1868(ra) # 80001664 <_Z4putcc>
    putc('\n');
    80001db8:	00a00513          	li	a0,10
    80001dbc:	00000097          	auipc	ra,0x0
    80001dc0:	8a8080e7          	jalr	-1880(ra) # 80001664 <_Z4putcc>
}
    80001dc4:	00813083          	ld	ra,8(sp)
    80001dc8:	00013403          	ld	s0,0(sp)
    80001dcc:	01010113          	addi	sp,sp,16
    80001dd0:	00008067          	ret

0000000080001dd4 <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    80001dd4:	fd010113          	addi	sp,sp,-48
    80001dd8:	02113423          	sd	ra,40(sp)
    80001ddc:	02813023          	sd	s0,32(sp)
    80001de0:	00913c23          	sd	s1,24(sp)
    80001de4:	03010413          	addi	s0,sp,48

    thread_t t, test;
    
    thread_create(&t, 0, 0);
    80001de8:	00000613          	li	a2,0
    80001dec:	00000593          	li	a1,0
    80001df0:	fd840513          	addi	a0,s0,-40
    80001df4:	fffff097          	auipc	ra,0xfffff
    80001df8:	680080e7          	jalr	1664(ra) # 80001474 <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80001dfc:	00002097          	auipc	ra,0x2
    80001e00:	558080e7          	jalr	1368(ra) # 80004354 <_ZN9Scheduler3getEv>
    80001e04:	00006797          	auipc	a5,0x6
    80001e08:	25c7b783          	ld	a5,604(a5) # 80008060 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001e0c:	00a7b023          	sd	a0,0(a5)
    
    thread_create(&test, usermain, 0);
    80001e10:	00000613          	li	a2,0
    80001e14:	00006597          	auipc	a1,0x6
    80001e18:	2245b583          	ld	a1,548(a1) # 80008038 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001e1c:	fd040513          	addi	a0,s0,-48
    80001e20:	fffff097          	auipc	ra,0xfffff
    80001e24:	654080e7          	jalr	1620(ra) # 80001474 <_Z13thread_createPP7_threadPFvPvES2_>
    putc('k');
    80001e28:	06b00513          	li	a0,107
    80001e2c:	00000097          	auipc	ra,0x0
    80001e30:	838080e7          	jalr	-1992(ra) # 80001664 <_Z4putcc>
    putc('e');
    80001e34:	06500513          	li	a0,101
    80001e38:	00000097          	auipc	ra,0x0
    80001e3c:	82c080e7          	jalr	-2004(ra) # 80001664 <_Z4putcc>
    putc('r');
    80001e40:	07200513          	li	a0,114
    80001e44:	00000097          	auipc	ra,0x0
    80001e48:	820080e7          	jalr	-2016(ra) # 80001664 <_Z4putcc>
    putc('n');
    80001e4c:	06e00513          	li	a0,110
    80001e50:	00000097          	auipc	ra,0x0
    80001e54:	814080e7          	jalr	-2028(ra) # 80001664 <_Z4putcc>
    putc('e');
    80001e58:	06500513          	li	a0,101
    80001e5c:	00000097          	auipc	ra,0x0
    80001e60:	808080e7          	jalr	-2040(ra) # 80001664 <_Z4putcc>
    putc('l');
    80001e64:	06c00513          	li	a0,108
    80001e68:	fffff097          	auipc	ra,0xfffff
    80001e6c:	7fc080e7          	jalr	2044(ra) # 80001664 <_Z4putcc>
    putc('\n');
    80001e70:	00a00513          	li	a0,10
    80001e74:	fffff097          	auipc	ra,0xfffff
    80001e78:	7f0080e7          	jalr	2032(ra) # 80001664 <_Z4putcc>
    int loop = 0;
    80001e7c:	00000493          	li	s1,0
    do{
        thread_dispatch();
    80001e80:	fffff097          	auipc	ra,0xfffff
    80001e84:	690080e7          	jalr	1680(ra) # 80001510 <_Z15thread_dispatchv>
        loop++;
    80001e88:	0014849b          	addiw	s1,s1,1
    }while(!Scheduler::isEmpty() && loop < 4);
    80001e8c:	00002097          	auipc	ra,0x2
    80001e90:	2b0080e7          	jalr	688(ra) # 8000413c <_ZN9Scheduler7isEmptyEv>
    80001e94:	00051663          	bnez	a0,80001ea0 <_ZN6Kernel3runEv+0xcc>
    80001e98:	00300793          	li	a5,3
    80001e9c:	fe97d2e3          	bge	a5,s1,80001e80 <_ZN6Kernel3runEv+0xac>
    // }while(!Scheduler::isEmpty() || !Timer::getInstance().noSleepingThreads());

    putc('m');
    80001ea0:	06d00513          	li	a0,109
    80001ea4:	fffff097          	auipc	ra,0xfffff
    80001ea8:	7c0080e7          	jalr	1984(ra) # 80001664 <_Z4putcc>
    putc('a');
    80001eac:	06100513          	li	a0,97
    80001eb0:	fffff097          	auipc	ra,0xfffff
    80001eb4:	7b4080e7          	jalr	1972(ra) # 80001664 <_Z4putcc>
    putc('i');
    80001eb8:	06900513          	li	a0,105
    80001ebc:	fffff097          	auipc	ra,0xfffff
    80001ec0:	7a8080e7          	jalr	1960(ra) # 80001664 <_Z4putcc>
    putc('n');
    80001ec4:	06e00513          	li	a0,110
    80001ec8:	fffff097          	auipc	ra,0xfffff
    80001ecc:	79c080e7          	jalr	1948(ra) # 80001664 <_Z4putcc>
    putc('\n');
    80001ed0:	00a00513          	li	a0,10
    80001ed4:	fffff097          	auipc	ra,0xfffff
    80001ed8:	790080e7          	jalr	1936(ra) # 80001664 <_Z4putcc>
    while(1){}
    80001edc:	0000006f          	j	80001edc <_ZN6Kernel3runEv+0x108>

0000000080001ee0 <_Z13thread_test_1Pv>:
#include "assert.h"

sem_t sem1;
sem_t sem2;

void thread_test_1(void* args){
    80001ee0:	ff010113          	addi	sp,sp,-16
    80001ee4:	00113423          	sd	ra,8(sp)
    80001ee8:	00813023          	sd	s0,0(sp)
    80001eec:	01010413          	addi	s0,sp,16
    putc('1');
    80001ef0:	03100513          	li	a0,49
    80001ef4:	fffff097          	auipc	ra,0xfffff
    80001ef8:	770080e7          	jalr	1904(ra) # 80001664 <_Z4putcc>
    putc('s');
    80001efc:	07300513          	li	a0,115
    80001f00:	fffff097          	auipc	ra,0xfffff
    80001f04:	764080e7          	jalr	1892(ra) # 80001664 <_Z4putcc>
    // time_sleep(50);
    putc('1');
    80001f08:	03100513          	li	a0,49
    80001f0c:	fffff097          	auipc	ra,0xfffff
    80001f10:	758080e7          	jalr	1880(ra) # 80001664 <_Z4putcc>
    sem_signal(sem1);
    80001f14:	00006517          	auipc	a0,0x6
    80001f18:	1a453503          	ld	a0,420(a0) # 800080b8 <sem1>
    80001f1c:	fffff097          	auipc	ra,0xfffff
    80001f20:	6f4080e7          	jalr	1780(ra) # 80001610 <_Z10sem_signalP4_sem>
    putc('S');
    80001f24:	05300513          	li	a0,83
    80001f28:	fffff097          	auipc	ra,0xfffff
    80001f2c:	73c080e7          	jalr	1852(ra) # 80001664 <_Z4putcc>
}
    80001f30:	00813083          	ld	ra,8(sp)
    80001f34:	00013403          	ld	s0,0(sp)
    80001f38:	01010113          	addi	sp,sp,16
    80001f3c:	00008067          	ret

0000000080001f40 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80001f40:	ff010113          	addi	sp,sp,-16
    80001f44:	00113423          	sd	ra,8(sp)
    80001f48:	00813023          	sd	s0,0(sp)
    80001f4c:	01010413          	addi	s0,sp,16
    putc('2');
    80001f50:	03200513          	li	a0,50
    80001f54:	fffff097          	auipc	ra,0xfffff
    80001f58:	710080e7          	jalr	1808(ra) # 80001664 <_Z4putcc>
    putc('s');
    80001f5c:	07300513          	li	a0,115
    80001f60:	fffff097          	auipc	ra,0xfffff
    80001f64:	704080e7          	jalr	1796(ra) # 80001664 <_Z4putcc>
    // time_sleep(25);
    putc('2');
    80001f68:	03200513          	li	a0,50
    80001f6c:	fffff097          	auipc	ra,0xfffff
    80001f70:	6f8080e7          	jalr	1784(ra) # 80001664 <_Z4putcc>
    putc('S');
    80001f74:	05300513          	li	a0,83
    80001f78:	fffff097          	auipc	ra,0xfffff
    80001f7c:	6ec080e7          	jalr	1772(ra) # 80001664 <_Z4putcc>
    sem_signal(sem2);
    80001f80:	00006517          	auipc	a0,0x6
    80001f84:	14053503          	ld	a0,320(a0) # 800080c0 <sem2>
    80001f88:	fffff097          	auipc	ra,0xfffff
    80001f8c:	688080e7          	jalr	1672(ra) # 80001610 <_Z10sem_signalP4_sem>
}
    80001f90:	00813083          	ld	ra,8(sp)
    80001f94:	00013403          	ld	s0,0(sp)
    80001f98:	01010113          	addi	sp,sp,16
    80001f9c:	00008067          	ret

0000000080001fa0 <_Z8usermainPv>:

void usermain(void* arg){
    80001fa0:	fd010113          	addi	sp,sp,-48
    80001fa4:	02113423          	sd	ra,40(sp)
    80001fa8:	02813023          	sd	s0,32(sp)
    80001fac:	00913c23          	sd	s1,24(sp)
    80001fb0:	03010413          	addi	s0,sp,48
    putc('0');
    80001fb4:	03000513          	li	a0,48
    80001fb8:	fffff097          	auipc	ra,0xfffff
    80001fbc:	6ac080e7          	jalr	1708(ra) # 80001664 <_Z4putcc>
    thread_t t1, t2;
    sem_open(&sem1, 0);
    80001fc0:	00006497          	auipc	s1,0x6
    80001fc4:	0f848493          	addi	s1,s1,248 # 800080b8 <sem1>
    80001fc8:	00000593          	li	a1,0
    80001fcc:	00048513          	mv	a0,s1
    80001fd0:	fffff097          	auipc	ra,0xfffff
    80001fd4:	5b0080e7          	jalr	1456(ra) # 80001580 <_Z8sem_openPP4_semj>
    sem_open(&sem2, 0);
    80001fd8:	00000593          	li	a1,0
    80001fdc:	00006517          	auipc	a0,0x6
    80001fe0:	0e450513          	addi	a0,a0,228 # 800080c0 <sem2>
    80001fe4:	fffff097          	auipc	ra,0xfffff
    80001fe8:	59c080e7          	jalr	1436(ra) # 80001580 <_Z8sem_openPP4_semj>
    thread_create(&t1, thread_test_1, 0);
    80001fec:	00000613          	li	a2,0
    80001ff0:	00000597          	auipc	a1,0x0
    80001ff4:	ef058593          	addi	a1,a1,-272 # 80001ee0 <_Z13thread_test_1Pv>
    80001ff8:	fd840513          	addi	a0,s0,-40
    80001ffc:	fffff097          	auipc	ra,0xfffff
    80002000:	478080e7          	jalr	1144(ra) # 80001474 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002004:	00000613          	li	a2,0
    80002008:	00000597          	auipc	a1,0x0
    8000200c:	f3858593          	addi	a1,a1,-200 # 80001f40 <_Z13thread_test_2Pv>
    80002010:	fd040513          	addi	a0,s0,-48
    80002014:	fffff097          	auipc	ra,0xfffff
    80002018:	460080e7          	jalr	1120(ra) # 80001474 <_Z13thread_createPP7_threadPFvPvES2_>
    sem_wait(sem1);
    8000201c:	0004b503          	ld	a0,0(s1)
    80002020:	fffff097          	auipc	ra,0xfffff
    80002024:	5c4080e7          	jalr	1476(ra) # 800015e4 <_Z8sem_waitP4_sem>
    putc('3');
    80002028:	03300513          	li	a0,51
    8000202c:	fffff097          	auipc	ra,0xfffff
    80002030:	638080e7          	jalr	1592(ra) # 80001664 <_Z4putcc>
    // thread_join(t2);
    // if(getc() == 'a')putc('x');
    putc('4');
    80002034:	03400513          	li	a0,52
    80002038:	fffff097          	auipc	ra,0xfffff
    8000203c:	62c080e7          	jalr	1580(ra) # 80001664 <_Z4putcc>
    // thread_join(t1);
    // thread_dispatch();
    // thread_dispatch();
    sem_wait(sem2);
    80002040:	0084b503          	ld	a0,8(s1)
    80002044:	fffff097          	auipc	ra,0xfffff
    80002048:	5a0080e7          	jalr	1440(ra) # 800015e4 <_Z8sem_waitP4_sem>
    putc('5');
    8000204c:	03500513          	li	a0,53
    80002050:	fffff097          	auipc	ra,0xfffff
    80002054:	614080e7          	jalr	1556(ra) # 80001664 <_Z4putcc>
    80002058:	02813083          	ld	ra,40(sp)
    8000205c:	02013403          	ld	s0,32(sp)
    80002060:	01813483          	ld	s1,24(sp)
    80002064:	03010113          	addi	sp,sp,48
    80002068:	00008067          	ret

000000008000206c <_ZN7_threadC1EPFvPvES0_>:
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;

_thread::_thread(func function, void* arg){
    8000206c:	ff010113          	addi	sp,sp,-16
    80002070:	00813423          	sd	s0,8(sp)
    80002074:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80002078:	00053823          	sd	zero,16(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    8000207c:	00006717          	auipc	a4,0x6
    80002080:	04c70713          	addi	a4,a4,76 # 800080c8 <_ZN7_thread6nextIDE>
    80002084:	00072783          	lw	a5,0(a4)
    80002088:	0017869b          	addiw	a3,a5,1
    8000208c:	00d72023          	sw	a3,0(a4)
    80002090:	00f52023          	sw	a5,0(a0)
    closed = 0;
    80002094:	0a053783          	ld	a5,160(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002098:	0015b593          	seqz	a1,a1
    8000209c:	00459593          	slli	a1,a1,0x4
    800020a0:	fe07f793          	andi	a5,a5,-32
    800020a4:	00b7e7b3          	or	a5,a5,a1
    reserved = 0;
    800020a8:	00005717          	auipc	a4,0x5
    800020ac:	02873703          	ld	a4,40(a4) # 800070d0 <CONSOLE_STATUS+0xc0>
    800020b0:	00e7f7b3          	and	a5,a5,a4
    800020b4:	0af53023          	sd	a5,160(a0)
    joinHead = 0;
    800020b8:	08053023          	sd	zero,128(a0)
    timeLeft = 0;
    800020bc:	08053823          	sd	zero,144(a0)
    stackStart = 0;
    800020c0:	08053c23          	sd	zero,152(a0)
    
    context.s0 = 0;
    800020c4:	00053c23          	sd	zero,24(a0)
    context.s1 = 0;
    800020c8:	02053023          	sd	zero,32(a0)
    context.s2 = 0;
    800020cc:	02053423          	sd	zero,40(a0)
    context.s3 = 0;
    800020d0:	02053823          	sd	zero,48(a0)
    context.s4 = 0;
    800020d4:	02053c23          	sd	zero,56(a0)
    context.s5 = 0;
    800020d8:	04053023          	sd	zero,64(a0)
    context.s6 = 0;
    800020dc:	04053423          	sd	zero,72(a0)
    context.s7 = 0;
    800020e0:	04053823          	sd	zero,80(a0)
    context.s8 = 0;
    800020e4:	04053c23          	sd	zero,88(a0)
    context.s9 = 0;
    800020e8:	06053023          	sd	zero,96(a0)
    context.s10 = 0;
    800020ec:	06053423          	sd	zero,104(a0)
    context.s11 = 0;
    800020f0:	06053823          	sd	zero,112(a0)

    context.sstatus = 0;
    800020f4:	06053c23          	sd	zero,120(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    800020f8:	00000797          	auipc	a5,0x0
    800020fc:	67078793          	addi	a5,a5,1648 # 80002768 <_ZN7_thread7wrapperEv>
    80002100:	00f53423          	sd	a5,8(a0)
}
    80002104:	00813403          	ld	s0,8(sp)
    80002108:	01010113          	addi	sp,sp,16
    8000210c:	00008067          	ret

0000000080002110 <_Z10popSppSpiev>:

void popSppSpie(){
    80002110:	ff010113          	addi	sp,sp,-16
    80002114:	00813423          	sd	s0,8(sp)
    80002118:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    8000211c:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80002120:	10200073          	sret
}
    80002124:	00813403          	ld	s0,8(sp)
    80002128:	01010113          	addi	sp,sp,16
    8000212c:	00008067          	ret

0000000080002130 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002130:	fe010113          	addi	sp,sp,-32
    80002134:	00113c23          	sd	ra,24(sp)
    80002138:	00813823          	sd	s0,16(sp)
    8000213c:	00913423          	sd	s1,8(sp)
    80002140:	01213023          	sd	s2,0(sp)
    80002144:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80002148:	08053483          	ld	s1,128(a0)
    while(current != 0){
    8000214c:	0c048e63          	beqz	s1,80002228 <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    80002150:	0004c503          	lbu	a0,0(s1)
    80002154:	0014c783          	lbu	a5,1(s1)
    80002158:	00879793          	slli	a5,a5,0x8
    8000215c:	00a7e7b3          	or	a5,a5,a0
    80002160:	0024c503          	lbu	a0,2(s1)
    80002164:	01051513          	slli	a0,a0,0x10
    80002168:	00f567b3          	or	a5,a0,a5
    8000216c:	0034c503          	lbu	a0,3(s1)
    80002170:	01851513          	slli	a0,a0,0x18
    80002174:	00f56533          	or	a0,a0,a5
    80002178:	0044c783          	lbu	a5,4(s1)
    8000217c:	02079793          	slli	a5,a5,0x20
    80002180:	00a7e533          	or	a0,a5,a0
    80002184:	0054c783          	lbu	a5,5(s1)
    80002188:	02879793          	slli	a5,a5,0x28
    8000218c:	00a7e7b3          	or	a5,a5,a0
    80002190:	0064c503          	lbu	a0,6(s1)
    80002194:	03051513          	slli	a0,a0,0x30
    80002198:	00f567b3          	or	a5,a0,a5
    8000219c:	0074c503          	lbu	a0,7(s1)
    800021a0:	03851513          	slli	a0,a0,0x38
    800021a4:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    800021a8:	0a053783          	ld	a5,160(a0)
    800021ac:	ffd7f793          	andi	a5,a5,-3
    800021b0:	0af53023          	sd	a5,160(a0)
        Scheduler::put(thread);
    800021b4:	00002097          	auipc	ra,0x2
    800021b8:	fb0080e7          	jalr	-80(ra) # 80004164 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    800021bc:	0084c903          	lbu	s2,8(s1)
    800021c0:	0094c783          	lbu	a5,9(s1)
    800021c4:	00879793          	slli	a5,a5,0x8
    800021c8:	0127e7b3          	or	a5,a5,s2
    800021cc:	00a4c903          	lbu	s2,10(s1)
    800021d0:	01091913          	slli	s2,s2,0x10
    800021d4:	00f967b3          	or	a5,s2,a5
    800021d8:	00b4c903          	lbu	s2,11(s1)
    800021dc:	01891913          	slli	s2,s2,0x18
    800021e0:	00f96933          	or	s2,s2,a5
    800021e4:	00c4c783          	lbu	a5,12(s1)
    800021e8:	02079793          	slli	a5,a5,0x20
    800021ec:	0127e933          	or	s2,a5,s2
    800021f0:	00d4c783          	lbu	a5,13(s1)
    800021f4:	02879793          	slli	a5,a5,0x28
    800021f8:	0127e7b3          	or	a5,a5,s2
    800021fc:	00e4c903          	lbu	s2,14(s1)
    80002200:	03091913          	slli	s2,s2,0x30
    80002204:	00f967b3          	or	a5,s2,a5
    80002208:	00f4c903          	lbu	s2,15(s1)
    8000220c:	03891913          	slli	s2,s2,0x38
    80002210:	00f96933          	or	s2,s2,a5
        mem_free(current);
    80002214:	00048513          	mv	a0,s1
    80002218:	fffff097          	auipc	ra,0xfffff
    8000221c:	230080e7          	jalr	560(ra) # 80001448 <_Z8mem_freePv>
        current = next;
    80002220:	00090493          	mv	s1,s2
    while(current != 0){
    80002224:	f29ff06f          	j	8000214c <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80002228:	01813083          	ld	ra,24(sp)
    8000222c:	01013403          	ld	s0,16(sp)
    80002230:	00813483          	ld	s1,8(sp)
    80002234:	00013903          	ld	s2,0(sp)
    80002238:	02010113          	addi	sp,sp,32
    8000223c:	00008067          	ret

0000000080002240 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80002240:	fc010113          	addi	sp,sp,-64
    80002244:	02113c23          	sd	ra,56(sp)
    80002248:	02813823          	sd	s0,48(sp)
    8000224c:	02913423          	sd	s1,40(sp)
    80002250:	03213023          	sd	s2,32(sp)
    80002254:	01313c23          	sd	s3,24(sp)
    80002258:	01413823          	sd	s4,16(sp)
    8000225c:	01513423          	sd	s5,8(sp)
    80002260:	04010413          	addi	s0,sp,64
    80002264:	00050493          	mv	s1,a0
    80002268:	00058913          	mv	s2,a1
    8000226c:	00060a93          	mv	s5,a2
    80002270:	00068993          	mv	s3,a3
    80002274:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    80002278:	0b800513          	li	a0,184
    8000227c:	fffff097          	auipc	ra,0xfffff
    80002280:	19c080e7          	jalr	412(ra) # 80001418 <_Z9mem_allocm>
    80002284:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80002288:	18050063          	beqz	a0,80002408 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    8000228c:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    80002290:	0004b783          	ld	a5,0(s1)
    80002294:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80002298:	00006717          	auipc	a4,0x6
    8000229c:	e3070713          	addi	a4,a4,-464 # 800080c8 <_ZN7_thread6nextIDE>
    800022a0:	00072783          	lw	a5,0(a4)
    800022a4:	0017869b          	addiw	a3,a5,1
    800022a8:	00d72023          	sw	a3,0(a4)
    800022ac:	0004b703          	ld	a4,0(s1)
    800022b0:	00f72023          	sw	a5,0(a4)
    (*thread)->closed = false;
    800022b4:	0004b703          	ld	a4,0(s1)
    800022b8:	0a073783          	ld	a5,160(a4)
    800022bc:	ffe7f793          	andi	a5,a5,-2
    800022c0:	0af73023          	sd	a5,160(a4)
    (*thread)->blocked = false;
    800022c4:	0004b703          	ld	a4,0(s1)
    800022c8:	0a073783          	ld	a5,160(a4)
    800022cc:	ffd7f793          	andi	a5,a5,-3
    800022d0:	0af73023          	sd	a5,160(a4)
    (*thread)->sleeping = false;
    800022d4:	0004b703          	ld	a4,0(s1)
    800022d8:	0a073783          	ld	a5,160(a4)
    800022dc:	ffb7f793          	andi	a5,a5,-5
    800022e0:	0af73023          	sd	a5,160(a4)
    (*thread)->finished = false;
    800022e4:	0004b703          	ld	a4,0(s1)
    800022e8:	0a073783          	ld	a5,160(a4)
    800022ec:	ff77f793          	andi	a5,a5,-9
    800022f0:	0af73023          	sd	a5,160(a4)
    (*thread)->kernel = (function == 0);
    800022f4:	0004b703          	ld	a4,0(s1)
    800022f8:	00193913          	seqz	s2,s2
    800022fc:	00491913          	slli	s2,s2,0x4
    80002300:	0a073783          	ld	a5,160(a4)
    80002304:	fef7f793          	andi	a5,a5,-17
    80002308:	0127e933          	or	s2,a5,s2
    8000230c:	0b273023          	sd	s2,160(a4)
    (*thread)->reserved = 0;
    80002310:	0004b703          	ld	a4,0(s1)
    80002314:	0a073783          	ld	a5,160(a4)
    80002318:	00005697          	auipc	a3,0x5
    8000231c:	db86b683          	ld	a3,-584(a3) # 800070d0 <CONSOLE_STATUS+0xc0>
    80002320:	00d7f7b3          	and	a5,a5,a3
    80002324:	0af73023          	sd	a5,160(a4)
    (*thread)->joinHead = 0;
    80002328:	0004b783          	ld	a5,0(s1)
    8000232c:	0807b023          	sd	zero,128(a5)
    (*thread)->joinTail = 0;
    80002330:	0004b783          	ld	a5,0(s1)
    80002334:	0807b423          	sd	zero,136(a5)
    (*thread)->timeLeft = 0;
    80002338:	0004b783          	ld	a5,0(s1)
    8000233c:	0807b823          	sd	zero,144(a5)
    (*thread)->stackStart = 0;
    80002340:	0004b783          	ld	a5,0(s1)
    80002344:	0807bc23          	sd	zero,152(a5)

    (*thread)->context.s0 = 0;
    80002348:	0004b783          	ld	a5,0(s1)
    8000234c:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s1 = 0;
    80002350:	0004b783          	ld	a5,0(s1)
    80002354:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s2 = 0;
    80002358:	0004b783          	ld	a5,0(s1)
    8000235c:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s3 = 0;
    80002360:	0004b783          	ld	a5,0(s1)
    80002364:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s4 = 0;
    80002368:	0004b783          	ld	a5,0(s1)
    8000236c:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s5 = 0;
    80002370:	0004b783          	ld	a5,0(s1)
    80002374:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s6 = 0;
    80002378:	0004b783          	ld	a5,0(s1)
    8000237c:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s7 = 0;
    80002380:	0004b783          	ld	a5,0(s1)
    80002384:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s8 = 0;
    80002388:	0004b783          	ld	a5,0(s1)
    8000238c:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s9 = 0;
    80002390:	0004b783          	ld	a5,0(s1)
    80002394:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s10 = 0;
    80002398:	0004b783          	ld	a5,0(s1)
    8000239c:	0607b423          	sd	zero,104(a5)
    (*thread)->context.s11 = 0;
    800023a0:	0004b783          	ld	a5,0(s1)
    800023a4:	0607b823          	sd	zero,112(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    800023a8:	0004b783          	ld	a5,0(s1)
    800023ac:	0137b823          	sd	s3,16(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    800023b0:	0004b783          	ld	a5,0(s1)
    800023b4:	00000717          	auipc	a4,0x0
    800023b8:	3b470713          	addi	a4,a4,948 # 80002768 <_ZN7_thread7wrapperEv>
    800023bc:	00e7b423          	sd	a4,8(a5)

    (*thread)->stackStart = stack;
    800023c0:	0004b783          	ld	a5,0(s1)
    800023c4:	0937bc23          	sd	s3,152(a5)
    if(start){
    800023c8:	020a1663          	bnez	s4,800023f4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    800023cc:	00000513          	li	a0,0
}
    800023d0:	03813083          	ld	ra,56(sp)
    800023d4:	03013403          	ld	s0,48(sp)
    800023d8:	02813483          	ld	s1,40(sp)
    800023dc:	02013903          	ld	s2,32(sp)
    800023e0:	01813983          	ld	s3,24(sp)
    800023e4:	01013a03          	ld	s4,16(sp)
    800023e8:	00813a83          	ld	s5,8(sp)
    800023ec:	04010113          	addi	sp,sp,64
    800023f0:	00008067          	ret
        Scheduler::put(*thread);
    800023f4:	0004b503          	ld	a0,0(s1)
    800023f8:	00002097          	auipc	ra,0x2
    800023fc:	d6c080e7          	jalr	-660(ra) # 80004164 <_ZN9Scheduler3putEP7_thread>
    return 0;
    80002400:	00000513          	li	a0,0
    80002404:	fcdff06f          	j	800023d0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    80002408:	fff00513          	li	a0,-1
    8000240c:	fc5ff06f          	j	800023d0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

0000000080002410 <_ZN7_thread10setBlockedEb>:
    currentThread->finished = 1;
    dispatch();
    return 0;
}

void _thread::setBlocked(bool blocked){
    80002410:	ff010113          	addi	sp,sp,-16
    80002414:	00813423          	sd	s0,8(sp)
    80002418:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    8000241c:	0015f593          	andi	a1,a1,1
    80002420:	00159793          	slli	a5,a1,0x1
    80002424:	0a053583          	ld	a1,160(a0)
    80002428:	ffd5f593          	andi	a1,a1,-3
    8000242c:	00f5e5b3          	or	a1,a1,a5
    80002430:	0ab53023          	sd	a1,160(a0)
}
    80002434:	00813403          	ld	s0,8(sp)
    80002438:	01010113          	addi	sp,sp,16
    8000243c:	00008067          	ret

0000000080002440 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80002440:	ff010113          	addi	sp,sp,-16
    80002444:	00813423          	sd	s0,8(sp)
    80002448:	01010413          	addi	s0,sp,16
    this->closed = closed;
    8000244c:	0015f793          	andi	a5,a1,1
    80002450:	0a053583          	ld	a1,160(a0)
    80002454:	ffe5f593          	andi	a1,a1,-2
    80002458:	00f5e5b3          	or	a1,a1,a5
    8000245c:	0ab53023          	sd	a1,160(a0)
}
    80002460:	00813403          	ld	s0,8(sp)
    80002464:	01010113          	addi	sp,sp,16
    80002468:	00008067          	ret

000000008000246c <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    8000246c:	ff010113          	addi	sp,sp,-16
    80002470:	00813423          	sd	s0,8(sp)
    80002474:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    80002478:	0015f593          	andi	a1,a1,1
    8000247c:	00259793          	slli	a5,a1,0x2
    80002480:	0a053583          	ld	a1,160(a0)
    80002484:	ffb5f593          	andi	a1,a1,-5
    80002488:	00f5e5b3          	or	a1,a1,a5
    8000248c:	0ab53023          	sd	a1,160(a0)
}
    80002490:	00813403          	ld	s0,8(sp)
    80002494:	01010113          	addi	sp,sp,16
    80002498:	00008067          	ret

000000008000249c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
    //     return;
    // }
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    8000249c:	ff010113          	addi	sp,sp,-16
    800024a0:	00813423          	sd	s0,8(sp)
    800024a4:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    800024a8:	04050263          	beqz	a0,800024ec <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    800024ac:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    800024b0:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    800024b4:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    800024b8:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    800024bc:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    800024c0:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    800024c4:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    800024c8:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    800024cc:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    800024d0:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    800024d4:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    800024d8:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    800024dc:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    800024e0:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    800024e4:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    800024e8:	06853823          	sd	s0,112(a0)
    }
    if(newContext->sp != 0){
    800024ec:	0085b783          	ld	a5,8(a1)
    800024f0:	00078463          	beqz	a5,800024f8 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    800024f4:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    800024f8:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    800024fc:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    80002500:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80002504:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    80002508:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    8000250c:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80002510:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80002514:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80002518:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    8000251c:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80002520:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    80002524:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    80002528:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    8000252c:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    80002530:	0685bd83          	ld	s11,104(a1)

    return;

}
    80002534:	00813403          	ld	s0,8(sp)
    80002538:	01010113          	addi	sp,sp,16
    8000253c:	00008067          	ret

0000000080002540 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80002540:	fe010113          	addi	sp,sp,-32
    80002544:	00113c23          	sd	ra,24(sp)
    80002548:	00813823          	sd	s0,16(sp)
    8000254c:	00913423          	sd	s1,8(sp)
    80002550:	01213023          	sd	s2,0(sp)
    80002554:	02010413          	addi	s0,sp,32
    _thread* oldThread = currentThread;
    80002558:	00006917          	auipc	s2,0x6
    8000255c:	b7090913          	addi	s2,s2,-1168 # 800080c8 <_ZN7_thread6nextIDE>
    80002560:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    80002564:	00002097          	auipc	ra,0x2
    80002568:	df0080e7          	jalr	-528(ra) # 80004354 <_ZN9Scheduler3getEv>
    8000256c:	00a93423          	sd	a0,8(s2)
    if(currentThread == 0){
    80002570:	04050663          	beqz	a0,800025bc <_ZN7_thread8dispatchEv+0x7c>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80002574:	00048863          	beqz	s1,80002584 <_ZN7_thread8dispatchEv+0x44>
    80002578:	0a04b783          	ld	a5,160(s1)
    8000257c:	00f7f793          	andi	a5,a5,15
    80002580:	04078463          	beqz	a5,800025c8 <_ZN7_thread8dispatchEv+0x88>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    80002584:	00048463          	beqz	s1,8000258c <_ZN7_thread8dispatchEv+0x4c>
    80002588:	00848493          	addi	s1,s1,8
    8000258c:	00006597          	auipc	a1,0x6
    80002590:	b445b583          	ld	a1,-1212(a1) # 800080d0 <_ZN7_thread13currentThreadE>
    80002594:	00858593          	addi	a1,a1,8
    80002598:	00048513          	mv	a0,s1
    8000259c:	00000097          	auipc	ra,0x0
    800025a0:	f00080e7          	jalr	-256(ra) # 8000249c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    800025a4:	01813083          	ld	ra,24(sp)
    800025a8:	01013403          	ld	s0,16(sp)
    800025ac:	00813483          	ld	s1,8(sp)
    800025b0:	00013903          	ld	s2,0(sp)
    800025b4:	02010113          	addi	sp,sp,32
    800025b8:	00008067          	ret
        currentThread = oldThread;
    800025bc:	00006797          	auipc	a5,0x6
    800025c0:	b097ba23          	sd	s1,-1260(a5) # 800080d0 <_ZN7_thread13currentThreadE>
        return;
    800025c4:	fe1ff06f          	j	800025a4 <_ZN7_thread8dispatchEv+0x64>
            Scheduler::put(oldThread);
    800025c8:	00048513          	mv	a0,s1
    800025cc:	00002097          	auipc	ra,0x2
    800025d0:	b98080e7          	jalr	-1128(ra) # 80004164 <_ZN9Scheduler3putEP7_thread>
    800025d4:	fb1ff06f          	j	80002584 <_ZN7_thread8dispatchEv+0x44>

00000000800025d8 <_ZN7_thread4joinEPS_>:
    if(thread->finished || thread->closed){
    800025d8:	0a05b783          	ld	a5,160(a1)
    800025dc:	0097f793          	andi	a5,a5,9
    800025e0:	00078463          	beqz	a5,800025e8 <_ZN7_thread4joinEPS_+0x10>
    800025e4:	00008067          	ret
void _thread::join(thread_t thread){
    800025e8:	fe010113          	addi	sp,sp,-32
    800025ec:	00113c23          	sd	ra,24(sp)
    800025f0:	00813823          	sd	s0,16(sp)
    800025f4:	00913423          	sd	s1,8(sp)
    800025f8:	01213023          	sd	s2,0(sp)
    800025fc:	02010413          	addi	s0,sp,32
    80002600:	00050493          	mv	s1,a0
    80002604:	00058913          	mv	s2,a1
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    80002608:	01000513          	li	a0,16
    8000260c:	fffff097          	auipc	ra,0xfffff
    80002610:	e0c080e7          	jalr	-500(ra) # 80001418 <_Z9mem_allocm>
    this->blocked = true;
    80002614:	0a04b703          	ld	a4,160(s1)
    80002618:	00276713          	ori	a4,a4,2
    8000261c:	0ae4b023          	sd	a4,160(s1)
    newJoin->thread = this;
    80002620:	00950023          	sb	s1,0(a0)
    80002624:	0084d713          	srli	a4,s1,0x8
    80002628:	00e500a3          	sb	a4,1(a0)
    8000262c:	0104d713          	srli	a4,s1,0x10
    80002630:	00e50123          	sb	a4,2(a0)
    80002634:	0184d71b          	srliw	a4,s1,0x18
    80002638:	00e501a3          	sb	a4,3(a0)
    8000263c:	0204d713          	srli	a4,s1,0x20
    80002640:	00e50223          	sb	a4,4(a0)
    80002644:	0284d713          	srli	a4,s1,0x28
    80002648:	00e502a3          	sb	a4,5(a0)
    8000264c:	0304d713          	srli	a4,s1,0x30
    80002650:	00e50323          	sb	a4,6(a0)
    80002654:	0384d493          	srli	s1,s1,0x38
    80002658:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    8000265c:	00050423          	sb	zero,8(a0)
    80002660:	000504a3          	sb	zero,9(a0)
    80002664:	00050523          	sb	zero,10(a0)
    80002668:	000505a3          	sb	zero,11(a0)
    8000266c:	00050623          	sb	zero,12(a0)
    80002670:	000506a3          	sb	zero,13(a0)
    80002674:	00050723          	sb	zero,14(a0)
    80002678:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    8000267c:	08093703          	ld	a4,128(s2)
    80002680:	06070463          	beqz	a4,800026e8 <_ZN7_thread4joinEPS_+0x110>
        thread->joinTail->next = newJoin;
    80002684:	08893703          	ld	a4,136(s2)
    80002688:	00a70423          	sb	a0,8(a4)
    8000268c:	00855693          	srli	a3,a0,0x8
    80002690:	00d704a3          	sb	a3,9(a4)
    80002694:	01055693          	srli	a3,a0,0x10
    80002698:	00d70523          	sb	a3,10(a4)
    8000269c:	0185569b          	srliw	a3,a0,0x18
    800026a0:	00d705a3          	sb	a3,11(a4)
    800026a4:	02055693          	srli	a3,a0,0x20
    800026a8:	00d70623          	sb	a3,12(a4)
    800026ac:	02855693          	srli	a3,a0,0x28
    800026b0:	00d706a3          	sb	a3,13(a4)
    800026b4:	03055693          	srli	a3,a0,0x30
    800026b8:	00d70723          	sb	a3,14(a4)
    800026bc:	03855693          	srli	a3,a0,0x38
    800026c0:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    800026c4:	08a93423          	sd	a0,136(s2)
    dispatch();
    800026c8:	00000097          	auipc	ra,0x0
    800026cc:	e78080e7          	jalr	-392(ra) # 80002540 <_ZN7_thread8dispatchEv>
}
    800026d0:	01813083          	ld	ra,24(sp)
    800026d4:	01013403          	ld	s0,16(sp)
    800026d8:	00813483          	ld	s1,8(sp)
    800026dc:	00013903          	ld	s2,0(sp)
    800026e0:	02010113          	addi	sp,sp,32
    800026e4:	00008067          	ret
        thread->joinHead = newJoin;
    800026e8:	08a93023          	sd	a0,128(s2)
        thread->joinTail = newJoin;
    800026ec:	08a93423          	sd	a0,136(s2)
    800026f0:	fd9ff06f          	j	800026c8 <_ZN7_thread4joinEPS_+0xf0>

00000000800026f4 <_ZN7_thread4exitEv>:
    if(currentThread->closed){
    800026f4:	00006717          	auipc	a4,0x6
    800026f8:	9dc73703          	ld	a4,-1572(a4) # 800080d0 <_ZN7_thread13currentThreadE>
    800026fc:	0a073783          	ld	a5,160(a4)
    80002700:	0017f693          	andi	a3,a5,1
    80002704:	04069663          	bnez	a3,80002750 <_ZN7_thread4exitEv+0x5c>
    if(currentThread->blocked){
    80002708:	0027f693          	andi	a3,a5,2
    8000270c:	04069663          	bnez	a3,80002758 <_ZN7_thread4exitEv+0x64>
    if(currentThread->sleeping){
    80002710:	0047f793          	andi	a5,a5,4
    80002714:	04079663          	bnez	a5,80002760 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    80002718:	ff010113          	addi	sp,sp,-16
    8000271c:	00113423          	sd	ra,8(sp)
    80002720:	00813023          	sd	s0,0(sp)
    80002724:	01010413          	addi	s0,sp,16
    currentThread->finished = 1;
    80002728:	0a073783          	ld	a5,160(a4)
    8000272c:	0087e793          	ori	a5,a5,8
    80002730:	0af73023          	sd	a5,160(a4)
    dispatch();
    80002734:	00000097          	auipc	ra,0x0
    80002738:	e0c080e7          	jalr	-500(ra) # 80002540 <_ZN7_thread8dispatchEv>
    return 0;
    8000273c:	00000513          	li	a0,0
}
    80002740:	00813083          	ld	ra,8(sp)
    80002744:	00013403          	ld	s0,0(sp)
    80002748:	01010113          	addi	sp,sp,16
    8000274c:	00008067          	ret
        return -1;
    80002750:	fff00513          	li	a0,-1
    80002754:	00008067          	ret
        return -2;
    80002758:	ffe00513          	li	a0,-2
    8000275c:	00008067          	ret
        return -3;
    80002760:	ffd00513          	li	a0,-3
}
    80002764:	00008067          	ret

0000000080002768 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80002768:	fe010113          	addi	sp,sp,-32
    8000276c:	00113c23          	sd	ra,24(sp)
    80002770:	00813823          	sd	s0,16(sp)
    80002774:	00913423          	sd	s1,8(sp)
    80002778:	02010413          	addi	s0,sp,32
    currentThread->function(currentThread->arg);
    8000277c:	00006497          	auipc	s1,0x6
    80002780:	94c48493          	addi	s1,s1,-1716 # 800080c8 <_ZN7_thread6nextIDE>
    80002784:	0084b783          	ld	a5,8(s1)
    80002788:	0a87b703          	ld	a4,168(a5)
    8000278c:	0b07b503          	ld	a0,176(a5)
    80002790:	000700e7          	jalr	a4
    currentThread->unJoin();
    80002794:	0084b503          	ld	a0,8(s1)
    80002798:	00000097          	auipc	ra,0x0
    8000279c:	998080e7          	jalr	-1640(ra) # 80002130 <_ZN7_thread6unJoinEv>
    exit();
    800027a0:	00000097          	auipc	ra,0x0
    800027a4:	f54080e7          	jalr	-172(ra) # 800026f4 <_ZN7_thread4exitEv>
}
    800027a8:	01813083          	ld	ra,24(sp)
    800027ac:	01013403          	ld	s0,16(sp)
    800027b0:	00813483          	ld	s1,8(sp)
    800027b4:	02010113          	addi	sp,sp,32
    800027b8:	00008067          	ret

00000000800027bc <_ZN11HeapManagerC1Ev>:
#include "hw.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    800027bc:	fe010113          	addi	sp,sp,-32
    800027c0:	00113c23          	sd	ra,24(sp)
    800027c4:	00813823          	sd	s0,16(sp)
    800027c8:	00913423          	sd	s1,8(sp)
    800027cc:	02010413          	addi	s0,sp,32
    800027d0:	00050493          	mv	s1,a0
    assert(instance == 0);
    800027d4:	00006797          	auipc	a5,0x6
    800027d8:	9047b783          	ld	a5,-1788(a5) # 800080d8 <_ZN11HeapManager8instanceE>
    800027dc:	02079063          	bnez	a5,800027fc <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    800027e0:	00006797          	auipc	a5,0x6
    800027e4:	8e97bc23          	sd	s1,-1800(a5) # 800080d8 <_ZN11HeapManager8instanceE>
}
    800027e8:	01813083          	ld	ra,24(sp)
    800027ec:	01013403          	ld	s0,16(sp)
    800027f0:	00813483          	ld	s1,8(sp)
    800027f4:	02010113          	addi	sp,sp,32
    800027f8:	00008067          	ret
    assert(instance == 0);
    800027fc:	00005697          	auipc	a3,0x5
    80002800:	8dc68693          	addi	a3,a3,-1828 # 800070d8 <CONSOLE_STATUS+0xc8>
    80002804:	01300613          	li	a2,19
    80002808:	00005597          	auipc	a1,0x5
    8000280c:	8f058593          	addi	a1,a1,-1808 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002810:	00005517          	auipc	a0,0x5
    80002814:	83050513          	addi	a0,a0,-2000 # 80007040 <CONSOLE_STATUS+0x30>
    80002818:	fffff097          	auipc	ra,0xfffff
    8000281c:	10c080e7          	jalr	268(ra) # 80001924 <_Z13assert_failedPKcS0_jS0_>
    80002820:	fc1ff06f          	j	800027e0 <_ZN11HeapManagerC1Ev+0x24>

0000000080002824 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80002824:	ff010113          	addi	sp,sp,-16
    80002828:	00813423          	sd	s0,8(sp)
    8000282c:	01010413          	addi	s0,sp,16
    
}
    80002830:	00813403          	ld	s0,8(sp)
    80002834:	01010113          	addi	sp,sp,16
    80002838:	00008067          	ret

000000008000283c <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    8000283c:	fd010113          	addi	sp,sp,-48
    80002840:	02113423          	sd	ra,40(sp)
    80002844:	02813023          	sd	s0,32(sp)
    80002848:	00913c23          	sd	s1,24(sp)
    8000284c:	01213823          	sd	s2,16(sp)
    80002850:	01313423          	sd	s3,8(sp)
    80002854:	03010413          	addi	s0,sp,48
    80002858:	00050993          	mv	s3,a0
    8000285c:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002860:	40b604b3          	sub	s1,a2,a1
    80002864:	0414b793          	sltiu	a5,s1,65
    80002868:	0c079863          	bnez	a5,80002938 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    8000286c:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80002870:	fde00793          	li	a5,-34
    80002874:	00f90c23          	sb	a5,24(s2)
    80002878:	fc000713          	li	a4,-64
    8000287c:	00e90ca3          	sb	a4,25(s2)
    80002880:	fad00713          	li	a4,-83
    80002884:	00e90d23          	sb	a4,26(s2)
    80002888:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart - MEM_BLOCK_SIZE) / MEM_BLOCK_SIZE;
    8000288c:	fc048613          	addi	a2,s1,-64
    80002890:	0009b783          	ld	a5,0(s3)
    80002894:	00665713          	srli	a4,a2,0x6
    80002898:	00e78823          	sb	a4,16(a5)
    8000289c:	00e65713          	srli	a4,a2,0xe
    800028a0:	00e788a3          	sb	a4,17(a5)
    800028a4:	01665713          	srli	a4,a2,0x16
    800028a8:	00e78923          	sb	a4,18(a5)
    800028ac:	01e65713          	srli	a4,a2,0x1e
    800028b0:	00e789a3          	sb	a4,19(a5)
    800028b4:	02665713          	srli	a4,a2,0x26
    800028b8:	00e78a23          	sb	a4,20(a5)
    800028bc:	02e65713          	srli	a4,a2,0x2e
    800028c0:	00e78aa3          	sb	a4,21(a5)
    800028c4:	03665713          	srli	a4,a2,0x36
    800028c8:	00e78b23          	sb	a4,22(a5)
    800028cc:	03e65613          	srli	a2,a2,0x3e
    800028d0:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    800028d4:	0009b783          	ld	a5,0(s3)
    800028d8:	00078023          	sb	zero,0(a5)
    800028dc:	000780a3          	sb	zero,1(a5)
    800028e0:	00078123          	sb	zero,2(a5)
    800028e4:	000781a3          	sb	zero,3(a5)
    800028e8:	00078223          	sb	zero,4(a5)
    800028ec:	000782a3          	sb	zero,5(a5)
    800028f0:	00078323          	sb	zero,6(a5)
    800028f4:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    800028f8:	0009b783          	ld	a5,0(s3)
    800028fc:	00078423          	sb	zero,8(a5)
    80002900:	000784a3          	sb	zero,9(a5)
    80002904:	00078523          	sb	zero,10(a5)
    80002908:	000785a3          	sb	zero,11(a5)
    8000290c:	00078623          	sb	zero,12(a5)
    80002910:	000786a3          	sb	zero,13(a5)
    80002914:	00078723          	sb	zero,14(a5)
    80002918:	000787a3          	sb	zero,15(a5)
}
    8000291c:	02813083          	ld	ra,40(sp)
    80002920:	02013403          	ld	s0,32(sp)
    80002924:	01813483          	ld	s1,24(sp)
    80002928:	01013903          	ld	s2,16(sp)
    8000292c:	00813983          	ld	s3,8(sp)
    80002930:	03010113          	addi	sp,sp,48
    80002934:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002938:	00004697          	auipc	a3,0x4
    8000293c:	7d868693          	addi	a3,a3,2008 # 80007110 <CONSOLE_STATUS+0x100>
    80002940:	01c00613          	li	a2,28
    80002944:	00004597          	auipc	a1,0x4
    80002948:	7b458593          	addi	a1,a1,1972 # 800070f8 <CONSOLE_STATUS+0xe8>
    8000294c:	00004517          	auipc	a0,0x4
    80002950:	7f450513          	addi	a0,a0,2036 # 80007140 <CONSOLE_STATUS+0x130>
    80002954:	fffff097          	auipc	ra,0xfffff
    80002958:	fd0080e7          	jalr	-48(ra) # 80001924 <_Z13assert_failedPKcS0_jS0_>
    8000295c:	f11ff06f          	j	8000286c <_ZN11HeapManager4initEmm+0x30>

0000000080002960 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80002960:	fe010113          	addi	sp,sp,-32
    80002964:	00113c23          	sd	ra,24(sp)
    80002968:	00813823          	sd	s0,16(sp)
    8000296c:	00913423          	sd	s1,8(sp)
    80002970:	01213023          	sd	s2,0(sp)
    80002974:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002978:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    8000297c:	00000913          	li	s2,0
    80002980:	0b80006f          	j	80002a38 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        /// how is this an illegal read???
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80002984:	0104c783          	lbu	a5,16(s1)
    80002988:	0114c703          	lbu	a4,17(s1)
    8000298c:	00871713          	slli	a4,a4,0x8
    80002990:	00f76733          	or	a4,a4,a5
    80002994:	0124c783          	lbu	a5,18(s1)
    80002998:	01079793          	slli	a5,a5,0x10
    8000299c:	00e7e733          	or	a4,a5,a4
    800029a0:	0134c783          	lbu	a5,19(s1)
    800029a4:	01879793          	slli	a5,a5,0x18
    800029a8:	00e7e7b3          	or	a5,a5,a4
    800029ac:	0144c703          	lbu	a4,20(s1)
    800029b0:	02071713          	slli	a4,a4,0x20
    800029b4:	00f767b3          	or	a5,a4,a5
    800029b8:	0154c703          	lbu	a4,21(s1)
    800029bc:	02871713          	slli	a4,a4,0x28
    800029c0:	00f76733          	or	a4,a4,a5
    800029c4:	0164c783          	lbu	a5,22(s1)
    800029c8:	03079793          	slli	a5,a5,0x30
    800029cc:	00e7e733          	or	a4,a5,a4
    800029d0:	0174c783          	lbu	a5,23(s1)
    800029d4:	03879793          	slli	a5,a5,0x38
    800029d8:	00e7e7b3          	or	a5,a5,a4
    800029dc:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    800029e0:	0004c703          	lbu	a4,0(s1)
    800029e4:	0014c783          	lbu	a5,1(s1)
    800029e8:	00879793          	slli	a5,a5,0x8
    800029ec:	00e7e733          	or	a4,a5,a4
    800029f0:	0024c783          	lbu	a5,2(s1)
    800029f4:	01079793          	slli	a5,a5,0x10
    800029f8:	00e7e7b3          	or	a5,a5,a4
    800029fc:	0034c703          	lbu	a4,3(s1)
    80002a00:	01871713          	slli	a4,a4,0x18
    80002a04:	00f767b3          	or	a5,a4,a5
    80002a08:	0044c703          	lbu	a4,4(s1)
    80002a0c:	02071713          	slli	a4,a4,0x20
    80002a10:	00f76733          	or	a4,a4,a5
    80002a14:	0054c783          	lbu	a5,5(s1)
    80002a18:	02879793          	slli	a5,a5,0x28
    80002a1c:	00e7e733          	or	a4,a5,a4
    80002a20:	0064c783          	lbu	a5,6(s1)
    80002a24:	03079793          	slli	a5,a5,0x30
    80002a28:	00e7e7b3          	or	a5,a5,a4
    80002a2c:	0074c483          	lbu	s1,7(s1)
    80002a30:	03849493          	slli	s1,s1,0x38
    80002a34:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002a38:	06048263          	beqz	s1,80002a9c <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002a3c:	0184c783          	lbu	a5,24(s1)
    80002a40:	0194c703          	lbu	a4,25(s1)
    80002a44:	00871713          	slli	a4,a4,0x8
    80002a48:	00f76733          	or	a4,a4,a5
    80002a4c:	01a4c783          	lbu	a5,26(s1)
    80002a50:	01079793          	slli	a5,a5,0x10
    80002a54:	00e7e733          	or	a4,a5,a4
    80002a58:	01b4c783          	lbu	a5,27(s1)
    80002a5c:	01879793          	slli	a5,a5,0x18
    80002a60:	00e7e7b3          	or	a5,a5,a4
    80002a64:	0007879b          	sext.w	a5,a5
    80002a68:	deadc737          	lui	a4,0xdeadc
    80002a6c:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2d8e>
    80002a70:	f0e78ae3          	beq	a5,a4,80002984 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80002a74:	00004697          	auipc	a3,0x4
    80002a78:	6ec68693          	addi	a3,a3,1772 # 80007160 <CONSOLE_STATUS+0x150>
    80002a7c:	02a00613          	li	a2,42
    80002a80:	00004597          	auipc	a1,0x4
    80002a84:	67858593          	addi	a1,a1,1656 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002a88:	00004517          	auipc	a0,0x4
    80002a8c:	70050513          	addi	a0,a0,1792 # 80007188 <CONSOLE_STATUS+0x178>
    80002a90:	fffff097          	auipc	ra,0xfffff
    80002a94:	e94080e7          	jalr	-364(ra) # 80001924 <_Z13assert_failedPKcS0_jS0_>
    80002a98:	eedff06f          	j	80002984 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80002a9c:	00090513          	mv	a0,s2
    80002aa0:	01813083          	ld	ra,24(sp)
    80002aa4:	01013403          	ld	s0,16(sp)
    80002aa8:	00813483          	ld	s1,8(sp)
    80002aac:	00013903          	ld	s2,0(sp)
    80002ab0:	02010113          	addi	sp,sp,32
    80002ab4:	00008067          	ret

0000000080002ab8 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80002ab8:	fd010113          	addi	sp,sp,-48
    80002abc:	02113423          	sd	ra,40(sp)
    80002ac0:	02813023          	sd	s0,32(sp)
    80002ac4:	00913c23          	sd	s1,24(sp)
    80002ac8:	01213823          	sd	s2,16(sp)
    80002acc:	01313423          	sd	s3,8(sp)
    80002ad0:	03010413          	addi	s0,sp,48
    80002ad4:	00050993          	mv	s3,a0
    80002ad8:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002adc:	00053483          	ld	s1,0(a0)
    80002ae0:	0b80006f          	j	80002b98 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80002ae4:	0104c783          	lbu	a5,16(s1)
    80002ae8:	0114c703          	lbu	a4,17(s1)
    80002aec:	00871713          	slli	a4,a4,0x8
    80002af0:	00f76733          	or	a4,a4,a5
    80002af4:	0124c783          	lbu	a5,18(s1)
    80002af8:	01079793          	slli	a5,a5,0x10
    80002afc:	00e7e733          	or	a4,a5,a4
    80002b00:	0134c783          	lbu	a5,19(s1)
    80002b04:	01879793          	slli	a5,a5,0x18
    80002b08:	00e7e7b3          	or	a5,a5,a4
    80002b0c:	0144c703          	lbu	a4,20(s1)
    80002b10:	02071713          	slli	a4,a4,0x20
    80002b14:	00f767b3          	or	a5,a4,a5
    80002b18:	0154c703          	lbu	a4,21(s1)
    80002b1c:	02871713          	slli	a4,a4,0x28
    80002b20:	00f76733          	or	a4,a4,a5
    80002b24:	0164c783          	lbu	a5,22(s1)
    80002b28:	03079793          	slli	a5,a5,0x30
    80002b2c:	00e7e733          	or	a4,a5,a4
    80002b30:	0174c783          	lbu	a5,23(s1)
    80002b34:	03879793          	slli	a5,a5,0x38
    80002b38:	00e7e7b3          	or	a5,a5,a4
    80002b3c:	0d27f063          	bgeu	a5,s2,80002bfc <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80002b40:	0004c703          	lbu	a4,0(s1)
    80002b44:	0014c783          	lbu	a5,1(s1)
    80002b48:	00879793          	slli	a5,a5,0x8
    80002b4c:	00e7e733          	or	a4,a5,a4
    80002b50:	0024c783          	lbu	a5,2(s1)
    80002b54:	01079793          	slli	a5,a5,0x10
    80002b58:	00e7e7b3          	or	a5,a5,a4
    80002b5c:	0034c703          	lbu	a4,3(s1)
    80002b60:	01871713          	slli	a4,a4,0x18
    80002b64:	00f767b3          	or	a5,a4,a5
    80002b68:	0044c703          	lbu	a4,4(s1)
    80002b6c:	02071713          	slli	a4,a4,0x20
    80002b70:	00f76733          	or	a4,a4,a5
    80002b74:	0054c783          	lbu	a5,5(s1)
    80002b78:	02879793          	slli	a5,a5,0x28
    80002b7c:	00e7e733          	or	a4,a5,a4
    80002b80:	0064c783          	lbu	a5,6(s1)
    80002b84:	03079793          	slli	a5,a5,0x30
    80002b88:	00e7e7b3          	or	a5,a5,a4
    80002b8c:	0074c483          	lbu	s1,7(s1)
    80002b90:	03849493          	slli	s1,s1,0x38
    80002b94:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002b98:	4e048c63          	beqz	s1,80003090 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002b9c:	0184c783          	lbu	a5,24(s1)
    80002ba0:	0194c703          	lbu	a4,25(s1)
    80002ba4:	00871713          	slli	a4,a4,0x8
    80002ba8:	00f76733          	or	a4,a4,a5
    80002bac:	01a4c783          	lbu	a5,26(s1)
    80002bb0:	01079793          	slli	a5,a5,0x10
    80002bb4:	00e7e733          	or	a4,a5,a4
    80002bb8:	01b4c783          	lbu	a5,27(s1)
    80002bbc:	01879793          	slli	a5,a5,0x18
    80002bc0:	00e7e7b3          	or	a5,a5,a4
    80002bc4:	0007879b          	sext.w	a5,a5
    80002bc8:	deadc737          	lui	a4,0xdeadc
    80002bcc:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2d8e>
    80002bd0:	f0e78ae3          	beq	a5,a4,80002ae4 <_ZN11HeapManager12heapAllocateEm+0x2c>
    80002bd4:	00004697          	auipc	a3,0x4
    80002bd8:	5dc68693          	addi	a3,a3,1500 # 800071b0 <CONSOLE_STATUS+0x1a0>
    80002bdc:	03400613          	li	a2,52
    80002be0:	00004597          	auipc	a1,0x4
    80002be4:	51858593          	addi	a1,a1,1304 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002be8:	00004517          	auipc	a0,0x4
    80002bec:	5a050513          	addi	a0,a0,1440 # 80007188 <CONSOLE_STATUS+0x178>
    80002bf0:	fffff097          	auipc	ra,0xfffff
    80002bf4:	d34080e7          	jalr	-716(ra) # 80001924 <_Z13assert_failedPKcS0_jS0_>
    80002bf8:	eedff06f          	j	80002ae4 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80002bfc:	00190713          	addi	a4,s2,1
    80002c00:	2af77263          	bgeu	a4,a5,80002ea4 <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80002c04:	00671793          	slli	a5,a4,0x6
    80002c08:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80002c0c:	fde00713          	li	a4,-34
    80002c10:	00e78c23          	sb	a4,24(a5)
    80002c14:	fc000693          	li	a3,-64
    80002c18:	00d78ca3          	sb	a3,25(a5)
    80002c1c:	fad00693          	li	a3,-83
    80002c20:	00d78d23          	sb	a3,26(a5)
    80002c24:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80002c28:	0104c703          	lbu	a4,16(s1)
    80002c2c:	0114c683          	lbu	a3,17(s1)
    80002c30:	00869693          	slli	a3,a3,0x8
    80002c34:	00e6e6b3          	or	a3,a3,a4
    80002c38:	0124c703          	lbu	a4,18(s1)
    80002c3c:	01071713          	slli	a4,a4,0x10
    80002c40:	00d766b3          	or	a3,a4,a3
    80002c44:	0134c703          	lbu	a4,19(s1)
    80002c48:	01871713          	slli	a4,a4,0x18
    80002c4c:	00d76733          	or	a4,a4,a3
    80002c50:	0144c683          	lbu	a3,20(s1)
    80002c54:	02069693          	slli	a3,a3,0x20
    80002c58:	00e6e733          	or	a4,a3,a4
    80002c5c:	0154c683          	lbu	a3,21(s1)
    80002c60:	02869693          	slli	a3,a3,0x28
    80002c64:	00e6e6b3          	or	a3,a3,a4
    80002c68:	0164c703          	lbu	a4,22(s1)
    80002c6c:	03071713          	slli	a4,a4,0x30
    80002c70:	00d766b3          	or	a3,a4,a3
    80002c74:	0174c703          	lbu	a4,23(s1)
    80002c78:	03871713          	slli	a4,a4,0x38
    80002c7c:	00d76733          	or	a4,a4,a3
    80002c80:	41270733          	sub	a4,a4,s2
    80002c84:	fff70713          	addi	a4,a4,-1
    80002c88:	00e78823          	sb	a4,16(a5)
    80002c8c:	00875693          	srli	a3,a4,0x8
    80002c90:	00d788a3          	sb	a3,17(a5)
    80002c94:	01075693          	srli	a3,a4,0x10
    80002c98:	00d78923          	sb	a3,18(a5)
    80002c9c:	0187569b          	srliw	a3,a4,0x18
    80002ca0:	00d789a3          	sb	a3,19(a5)
    80002ca4:	02075693          	srli	a3,a4,0x20
    80002ca8:	00d78a23          	sb	a3,20(a5)
    80002cac:	02875693          	srli	a3,a4,0x28
    80002cb0:	00d78aa3          	sb	a3,21(a5)
    80002cb4:	03075693          	srli	a3,a4,0x30
    80002cb8:	00d78b23          	sb	a3,22(a5)
    80002cbc:	03875713          	srli	a4,a4,0x38
    80002cc0:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80002cc4:	0004c703          	lbu	a4,0(s1)
    80002cc8:	0014c683          	lbu	a3,1(s1)
    80002ccc:	00869693          	slli	a3,a3,0x8
    80002cd0:	00e6e733          	or	a4,a3,a4
    80002cd4:	0024c683          	lbu	a3,2(s1)
    80002cd8:	01069693          	slli	a3,a3,0x10
    80002cdc:	00e6e6b3          	or	a3,a3,a4
    80002ce0:	0034c703          	lbu	a4,3(s1)
    80002ce4:	01871713          	slli	a4,a4,0x18
    80002ce8:	00d766b3          	or	a3,a4,a3
    80002cec:	0044c703          	lbu	a4,4(s1)
    80002cf0:	02071713          	slli	a4,a4,0x20
    80002cf4:	00d76733          	or	a4,a4,a3
    80002cf8:	0054c683          	lbu	a3,5(s1)
    80002cfc:	02869693          	slli	a3,a3,0x28
    80002d00:	00e6e733          	or	a4,a3,a4
    80002d04:	0064c683          	lbu	a3,6(s1)
    80002d08:	03069693          	slli	a3,a3,0x30
    80002d0c:	00e6e6b3          	or	a3,a3,a4
    80002d10:	0074c703          	lbu	a4,7(s1)
    80002d14:	03871713          	slli	a4,a4,0x38
    80002d18:	00d76733          	or	a4,a4,a3
    80002d1c:	00d78023          	sb	a3,0(a5)
    80002d20:	00875693          	srli	a3,a4,0x8
    80002d24:	00d780a3          	sb	a3,1(a5)
    80002d28:	01075693          	srli	a3,a4,0x10
    80002d2c:	00d78123          	sb	a3,2(a5)
    80002d30:	0187569b          	srliw	a3,a4,0x18
    80002d34:	00d781a3          	sb	a3,3(a5)
    80002d38:	02075693          	srli	a3,a4,0x20
    80002d3c:	00d78223          	sb	a3,4(a5)
    80002d40:	02875693          	srli	a3,a4,0x28
    80002d44:	00d782a3          	sb	a3,5(a5)
    80002d48:	03075693          	srli	a3,a4,0x30
    80002d4c:	00d78323          	sb	a3,6(a5)
    80002d50:	03875713          	srli	a4,a4,0x38
    80002d54:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80002d58:	00978423          	sb	s1,8(a5)
    80002d5c:	0084d713          	srli	a4,s1,0x8
    80002d60:	00e784a3          	sb	a4,9(a5)
    80002d64:	0104d713          	srli	a4,s1,0x10
    80002d68:	00e78523          	sb	a4,10(a5)
    80002d6c:	0184d71b          	srliw	a4,s1,0x18
    80002d70:	00e785a3          	sb	a4,11(a5)
    80002d74:	0204d713          	srli	a4,s1,0x20
    80002d78:	00e78623          	sb	a4,12(a5)
    80002d7c:	0284d713          	srli	a4,s1,0x28
    80002d80:	00e786a3          	sb	a4,13(a5)
    80002d84:	0304d713          	srli	a4,s1,0x30
    80002d88:	00e78723          	sb	a4,14(a5)
    80002d8c:	0384d713          	srli	a4,s1,0x38
    80002d90:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    80002d94:	0004c703          	lbu	a4,0(s1)
    80002d98:	0014c683          	lbu	a3,1(s1)
    80002d9c:	00869693          	slli	a3,a3,0x8
    80002da0:	00e6e6b3          	or	a3,a3,a4
    80002da4:	0024c703          	lbu	a4,2(s1)
    80002da8:	01071713          	slli	a4,a4,0x10
    80002dac:	00d766b3          	or	a3,a4,a3
    80002db0:	0034c703          	lbu	a4,3(s1)
    80002db4:	01871713          	slli	a4,a4,0x18
    80002db8:	00d76733          	or	a4,a4,a3
    80002dbc:	0044c683          	lbu	a3,4(s1)
    80002dc0:	02069693          	slli	a3,a3,0x20
    80002dc4:	00e6e733          	or	a4,a3,a4
    80002dc8:	0054c683          	lbu	a3,5(s1)
    80002dcc:	02869693          	slli	a3,a3,0x28
    80002dd0:	00e6e6b3          	or	a3,a3,a4
    80002dd4:	0064c703          	lbu	a4,6(s1)
    80002dd8:	03071713          	slli	a4,a4,0x30
    80002ddc:	00d766b3          	or	a3,a4,a3
    80002de0:	0074c703          	lbu	a4,7(s1)
    80002de4:	03871713          	slli	a4,a4,0x38
    80002de8:	00d76733          	or	a4,a4,a3
    80002dec:	04070063          	beqz	a4,80002e2c <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80002df0:	00f70423          	sb	a5,8(a4)
    80002df4:	0087d693          	srli	a3,a5,0x8
    80002df8:	00d704a3          	sb	a3,9(a4)
    80002dfc:	0107d693          	srli	a3,a5,0x10
    80002e00:	00d70523          	sb	a3,10(a4)
    80002e04:	0187d69b          	srliw	a3,a5,0x18
    80002e08:	00d705a3          	sb	a3,11(a4)
    80002e0c:	0207d693          	srli	a3,a5,0x20
    80002e10:	00d70623          	sb	a3,12(a4)
    80002e14:	0287d693          	srli	a3,a5,0x28
    80002e18:	00d706a3          	sb	a3,13(a4)
    80002e1c:	0307d693          	srli	a3,a5,0x30
    80002e20:	00d70723          	sb	a3,14(a4)
    80002e24:	0387d693          	srli	a3,a5,0x38
    80002e28:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80002e2c:	00f48023          	sb	a5,0(s1)
    80002e30:	0087d713          	srli	a4,a5,0x8
    80002e34:	00e480a3          	sb	a4,1(s1)
    80002e38:	0107d713          	srli	a4,a5,0x10
    80002e3c:	00e48123          	sb	a4,2(s1)
    80002e40:	0187d71b          	srliw	a4,a5,0x18
    80002e44:	00e481a3          	sb	a4,3(s1)
    80002e48:	0207d713          	srli	a4,a5,0x20
    80002e4c:	00e48223          	sb	a4,4(s1)
    80002e50:	0287d713          	srli	a4,a5,0x28
    80002e54:	00e482a3          	sb	a4,5(s1)
    80002e58:	0307d713          	srli	a4,a5,0x30
    80002e5c:	00e48323          	sb	a4,6(s1)
    80002e60:	0387d793          	srli	a5,a5,0x38
    80002e64:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80002e68:	01248823          	sb	s2,16(s1)
    80002e6c:	00895793          	srli	a5,s2,0x8
    80002e70:	00f488a3          	sb	a5,17(s1)
    80002e74:	01095793          	srli	a5,s2,0x10
    80002e78:	00f48923          	sb	a5,18(s1)
    80002e7c:	0189579b          	srliw	a5,s2,0x18
    80002e80:	00f489a3          	sb	a5,19(s1)
    80002e84:	02095793          	srli	a5,s2,0x20
    80002e88:	00f48a23          	sb	a5,20(s1)
    80002e8c:	02895793          	srli	a5,s2,0x28
    80002e90:	00f48aa3          	sb	a5,21(s1)
    80002e94:	03095793          	srli	a5,s2,0x30
    80002e98:	00f48b23          	sb	a5,22(s1)
    80002e9c:	03895913          	srli	s2,s2,0x38
    80002ea0:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80002ea4:	0009b783          	ld	a5,0(s3)
    80002ea8:	20978463          	beq	a5,s1,800030b0 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80002eac:	0084c783          	lbu	a5,8(s1)
    80002eb0:	0094c703          	lbu	a4,9(s1)
    80002eb4:	00871713          	slli	a4,a4,0x8
    80002eb8:	00f76733          	or	a4,a4,a5
    80002ebc:	00a4c783          	lbu	a5,10(s1)
    80002ec0:	01079793          	slli	a5,a5,0x10
    80002ec4:	00e7e733          	or	a4,a5,a4
    80002ec8:	00b4c783          	lbu	a5,11(s1)
    80002ecc:	01879793          	slli	a5,a5,0x18
    80002ed0:	00e7e7b3          	or	a5,a5,a4
    80002ed4:	00c4c703          	lbu	a4,12(s1)
    80002ed8:	02071713          	slli	a4,a4,0x20
    80002edc:	00f767b3          	or	a5,a4,a5
    80002ee0:	00d4c703          	lbu	a4,13(s1)
    80002ee4:	02871713          	slli	a4,a4,0x28
    80002ee8:	00f76733          	or	a4,a4,a5
    80002eec:	00e4c783          	lbu	a5,14(s1)
    80002ef0:	03079793          	slli	a5,a5,0x30
    80002ef4:	00e7e733          	or	a4,a5,a4
    80002ef8:	00f4c783          	lbu	a5,15(s1)
    80002efc:	03879793          	slli	a5,a5,0x38
    80002f00:	00e7e7b3          	or	a5,a5,a4
    80002f04:	08078c63          	beqz	a5,80002f9c <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80002f08:	0004c703          	lbu	a4,0(s1)
    80002f0c:	0014c683          	lbu	a3,1(s1)
    80002f10:	00869693          	slli	a3,a3,0x8
    80002f14:	00e6e733          	or	a4,a3,a4
    80002f18:	0024c683          	lbu	a3,2(s1)
    80002f1c:	01069693          	slli	a3,a3,0x10
    80002f20:	00e6e6b3          	or	a3,a3,a4
    80002f24:	0034c703          	lbu	a4,3(s1)
    80002f28:	01871713          	slli	a4,a4,0x18
    80002f2c:	00d766b3          	or	a3,a4,a3
    80002f30:	0044c703          	lbu	a4,4(s1)
    80002f34:	02071713          	slli	a4,a4,0x20
    80002f38:	00d76733          	or	a4,a4,a3
    80002f3c:	0054c683          	lbu	a3,5(s1)
    80002f40:	02869693          	slli	a3,a3,0x28
    80002f44:	00e6e733          	or	a4,a3,a4
    80002f48:	0064c683          	lbu	a3,6(s1)
    80002f4c:	03069693          	slli	a3,a3,0x30
    80002f50:	00e6e6b3          	or	a3,a3,a4
    80002f54:	0074c703          	lbu	a4,7(s1)
    80002f58:	03871713          	slli	a4,a4,0x38
    80002f5c:	00d76733          	or	a4,a4,a3
    80002f60:	00d78023          	sb	a3,0(a5)
    80002f64:	00875693          	srli	a3,a4,0x8
    80002f68:	00d780a3          	sb	a3,1(a5)
    80002f6c:	01075693          	srli	a3,a4,0x10
    80002f70:	00d78123          	sb	a3,2(a5)
    80002f74:	0187569b          	srliw	a3,a4,0x18
    80002f78:	00d781a3          	sb	a3,3(a5)
    80002f7c:	02075693          	srli	a3,a4,0x20
    80002f80:	00d78223          	sb	a3,4(a5)
    80002f84:	02875693          	srli	a3,a4,0x28
    80002f88:	00d782a3          	sb	a3,5(a5)
    80002f8c:	03075693          	srli	a3,a4,0x30
    80002f90:	00d78323          	sb	a3,6(a5)
    80002f94:	03875713          	srli	a4,a4,0x38
    80002f98:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80002f9c:	0004c783          	lbu	a5,0(s1)
    80002fa0:	0014c703          	lbu	a4,1(s1)
    80002fa4:	00871713          	slli	a4,a4,0x8
    80002fa8:	00f76733          	or	a4,a4,a5
    80002fac:	0024c783          	lbu	a5,2(s1)
    80002fb0:	01079793          	slli	a5,a5,0x10
    80002fb4:	00e7e733          	or	a4,a5,a4
    80002fb8:	0034c783          	lbu	a5,3(s1)
    80002fbc:	01879793          	slli	a5,a5,0x18
    80002fc0:	00e7e7b3          	or	a5,a5,a4
    80002fc4:	0044c703          	lbu	a4,4(s1)
    80002fc8:	02071713          	slli	a4,a4,0x20
    80002fcc:	00f767b3          	or	a5,a4,a5
    80002fd0:	0054c703          	lbu	a4,5(s1)
    80002fd4:	02871713          	slli	a4,a4,0x28
    80002fd8:	00f76733          	or	a4,a4,a5
    80002fdc:	0064c783          	lbu	a5,6(s1)
    80002fe0:	03079793          	slli	a5,a5,0x30
    80002fe4:	00e7e733          	or	a4,a5,a4
    80002fe8:	0074c783          	lbu	a5,7(s1)
    80002fec:	03879793          	slli	a5,a5,0x38
    80002ff0:	00e7e7b3          	or	a5,a5,a4
    80002ff4:	08078c63          	beqz	a5,8000308c <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80002ff8:	0084c703          	lbu	a4,8(s1)
    80002ffc:	0094c683          	lbu	a3,9(s1)
    80003000:	00869693          	slli	a3,a3,0x8
    80003004:	00e6e733          	or	a4,a3,a4
    80003008:	00a4c683          	lbu	a3,10(s1)
    8000300c:	01069693          	slli	a3,a3,0x10
    80003010:	00e6e6b3          	or	a3,a3,a4
    80003014:	00b4c703          	lbu	a4,11(s1)
    80003018:	01871713          	slli	a4,a4,0x18
    8000301c:	00d766b3          	or	a3,a4,a3
    80003020:	00c4c703          	lbu	a4,12(s1)
    80003024:	02071713          	slli	a4,a4,0x20
    80003028:	00d76733          	or	a4,a4,a3
    8000302c:	00d4c683          	lbu	a3,13(s1)
    80003030:	02869693          	slli	a3,a3,0x28
    80003034:	00e6e733          	or	a4,a3,a4
    80003038:	00e4c683          	lbu	a3,14(s1)
    8000303c:	03069693          	slli	a3,a3,0x30
    80003040:	00e6e6b3          	or	a3,a3,a4
    80003044:	00f4c703          	lbu	a4,15(s1)
    80003048:	03871713          	slli	a4,a4,0x38
    8000304c:	00d76733          	or	a4,a4,a3
    80003050:	00d78423          	sb	a3,8(a5)
    80003054:	00875693          	srli	a3,a4,0x8
    80003058:	00d784a3          	sb	a3,9(a5)
    8000305c:	01075693          	srli	a3,a4,0x10
    80003060:	00d78523          	sb	a3,10(a5)
    80003064:	0187569b          	srliw	a3,a4,0x18
    80003068:	00d785a3          	sb	a3,11(a5)
    8000306c:	02075693          	srli	a3,a4,0x20
    80003070:	00d78623          	sb	a3,12(a5)
    80003074:	02875693          	srli	a3,a4,0x28
    80003078:	00d786a3          	sb	a3,13(a5)
    8000307c:	03075693          	srli	a3,a4,0x30
    80003080:	00d78723          	sb	a3,14(a5)
    80003084:	03875713          	srli	a4,a4,0x38
    80003088:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    8000308c:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80003090:	00048513          	mv	a0,s1
    80003094:	02813083          	ld	ra,40(sp)
    80003098:	02013403          	ld	s0,32(sp)
    8000309c:	01813483          	ld	s1,24(sp)
    800030a0:	01013903          	ld	s2,16(sp)
    800030a4:	00813983          	ld	s3,8(sp)
    800030a8:	03010113          	addi	sp,sp,48
    800030ac:	00008067          	ret
                m_pHead = pCurrent->pNext;
    800030b0:	0004c703          	lbu	a4,0(s1)
    800030b4:	0014c783          	lbu	a5,1(s1)
    800030b8:	00879793          	slli	a5,a5,0x8
    800030bc:	00e7e7b3          	or	a5,a5,a4
    800030c0:	0024c703          	lbu	a4,2(s1)
    800030c4:	01071713          	slli	a4,a4,0x10
    800030c8:	00f76733          	or	a4,a4,a5
    800030cc:	0034c783          	lbu	a5,3(s1)
    800030d0:	01879793          	slli	a5,a5,0x18
    800030d4:	00e7e733          	or	a4,a5,a4
    800030d8:	0044c783          	lbu	a5,4(s1)
    800030dc:	02079793          	slli	a5,a5,0x20
    800030e0:	00e7e7b3          	or	a5,a5,a4
    800030e4:	0054c703          	lbu	a4,5(s1)
    800030e8:	02871713          	slli	a4,a4,0x28
    800030ec:	00f76733          	or	a4,a4,a5
    800030f0:	0064c783          	lbu	a5,6(s1)
    800030f4:	03079793          	slli	a5,a5,0x30
    800030f8:	00e7e733          	or	a4,a5,a4
    800030fc:	0074c783          	lbu	a5,7(s1)
    80003100:	03879793          	slli	a5,a5,0x38
    80003104:	00e7e7b3          	or	a5,a5,a4
    80003108:	00f9b023          	sd	a5,0(s3)
    8000310c:	da1ff06f          	j	80002eac <_ZN11HeapManager12heapAllocateEm+0x3f4>

0000000080003110 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003110:	fc010113          	addi	sp,sp,-64
    80003114:	02113c23          	sd	ra,56(sp)
    80003118:	02813823          	sd	s0,48(sp)
    8000311c:	02913423          	sd	s1,40(sp)
    80003120:	03213023          	sd	s2,32(sp)
    80003124:	01313c23          	sd	s3,24(sp)
    80003128:	01413823          	sd	s4,16(sp)
    8000312c:	01513423          	sd	s5,8(sp)
    80003130:	04010413          	addi	s0,sp,64
    80003134:	00050a93          	mv	s5,a0
    80003138:	00058a13          	mv	s4,a1
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pAddress) - MEM_BLOCK_SIZE);
    8000313c:	fc058913          	addi	s2,a1,-64
    80003140:	00090993          	mv	s3,s2
    
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003144:	01894783          	lbu	a5,24(s2)
    80003148:	01994703          	lbu	a4,25(s2)
    8000314c:	00871713          	slli	a4,a4,0x8
    80003150:	00f76733          	or	a4,a4,a5
    80003154:	01a94783          	lbu	a5,26(s2)
    80003158:	01079793          	slli	a5,a5,0x10
    8000315c:	00e7e733          	or	a4,a5,a4
    80003160:	01b94783          	lbu	a5,27(s2)
    80003164:	01879793          	slli	a5,a5,0x18
    80003168:	00e7e7b3          	or	a5,a5,a4
    8000316c:	0007879b          	sext.w	a5,a5
    80003170:	deadc737          	lui	a4,0xdeadc
    80003174:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2d8e>
    80003178:	2ae79c63          	bne	a5,a4,80003430 <_ZN11HeapManager8heapFreeEPv+0x320>
    HeapFreeSectionHeader* pInsert = m_pHead;
    8000317c:	000ab483          	ld	s1,0(s5)

    if(pInsert == 0 || pInsert->pNext >= pAddress){
    80003180:	06048063          	beqz	s1,800031e0 <_ZN11HeapManager8heapFreeEPv+0xd0>
    80003184:	0004c783          	lbu	a5,0(s1)
    80003188:	0014c703          	lbu	a4,1(s1)
    8000318c:	00871713          	slli	a4,a4,0x8
    80003190:	00f76733          	or	a4,a4,a5
    80003194:	0024c783          	lbu	a5,2(s1)
    80003198:	01079793          	slli	a5,a5,0x10
    8000319c:	00e7e733          	or	a4,a5,a4
    800031a0:	0034c783          	lbu	a5,3(s1)
    800031a4:	01879793          	slli	a5,a5,0x18
    800031a8:	00e7e7b3          	or	a5,a5,a4
    800031ac:	0044c703          	lbu	a4,4(s1)
    800031b0:	02071713          	slli	a4,a4,0x20
    800031b4:	00f767b3          	or	a5,a4,a5
    800031b8:	0054c703          	lbu	a4,5(s1)
    800031bc:	02871713          	slli	a4,a4,0x28
    800031c0:	00f76733          	or	a4,a4,a5
    800031c4:	0064c783          	lbu	a5,6(s1)
    800031c8:	03079793          	slli	a5,a5,0x30
    800031cc:	00e7e733          	or	a4,a5,a4
    800031d0:	0074c783          	lbu	a5,7(s1)
    800031d4:	03879793          	slli	a5,a5,0x38
    800031d8:	00e7e7b3          	or	a5,a5,a4
    800031dc:	2d47ea63          	bltu	a5,s4,800034b0 <_ZN11HeapManager8heapFreeEPv+0x3a0>
        pFree->pNext = m_pHead;
    800031e0:	fc9a0023          	sb	s1,-64(s4)
    800031e4:	0084d793          	srli	a5,s1,0x8
    800031e8:	00f900a3          	sb	a5,1(s2)
    800031ec:	0104d793          	srli	a5,s1,0x10
    800031f0:	00f90123          	sb	a5,2(s2)
    800031f4:	0184d79b          	srliw	a5,s1,0x18
    800031f8:	00f901a3          	sb	a5,3(s2)
    800031fc:	0204d793          	srli	a5,s1,0x20
    80003200:	00f90223          	sb	a5,4(s2)
    80003204:	0284d793          	srli	a5,s1,0x28
    80003208:	00f902a3          	sb	a5,5(s2)
    8000320c:	0304d793          	srli	a5,s1,0x30
    80003210:	00f90323          	sb	a5,6(s2)
    80003214:	0384d493          	srli	s1,s1,0x38
    80003218:	009903a3          	sb	s1,7(s2)
        m_pHead->pPrev = pFree;
    8000321c:	000ab783          	ld	a5,0(s5)
    80003220:	01278423          	sb	s2,8(a5)
    80003224:	00895713          	srli	a4,s2,0x8
    80003228:	00e784a3          	sb	a4,9(a5)
    8000322c:	01095713          	srli	a4,s2,0x10
    80003230:	00e78523          	sb	a4,10(a5)
    80003234:	0189571b          	srliw	a4,s2,0x18
    80003238:	00e785a3          	sb	a4,11(a5)
    8000323c:	02095713          	srli	a4,s2,0x20
    80003240:	00e78623          	sb	a4,12(a5)
    80003244:	02895713          	srli	a4,s2,0x28
    80003248:	00e786a3          	sb	a4,13(a5)
    8000324c:	03095713          	srli	a4,s2,0x30
    80003250:	00e78723          	sb	a4,14(a5)
    80003254:	03895713          	srli	a4,s2,0x38
    80003258:	00e787a3          	sb	a4,15(a5)
        m_pHead = pFree;
    8000325c:	012ab023          	sd	s2,0(s5)
        pFree->pNext = 0;
    80003260:	fc0a0023          	sb	zero,-64(s4)
    80003264:	000900a3          	sb	zero,1(s2)
    80003268:	00090123          	sb	zero,2(s2)
    8000326c:	000901a3          	sb	zero,3(s2)
    80003270:	00090223          	sb	zero,4(s2)
    80003274:	000902a3          	sb	zero,5(s2)
    80003278:	00090323          	sb	zero,6(s2)
    8000327c:	000903a3          	sb	zero,7(s2)
    }



    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uintptr_t>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree)){
    80003280:	00894783          	lbu	a5,8(s2)
    80003284:	00994703          	lbu	a4,9(s2)
    80003288:	00871713          	slli	a4,a4,0x8
    8000328c:	00f76733          	or	a4,a4,a5
    80003290:	00a94783          	lbu	a5,10(s2)
    80003294:	01079793          	slli	a5,a5,0x10
    80003298:	00e7e733          	or	a4,a5,a4
    8000329c:	00b94783          	lbu	a5,11(s2)
    800032a0:	01879793          	slli	a5,a5,0x18
    800032a4:	00e7e7b3          	or	a5,a5,a4
    800032a8:	00c94703          	lbu	a4,12(s2)
    800032ac:	02071713          	slli	a4,a4,0x20
    800032b0:	00f767b3          	or	a5,a4,a5
    800032b4:	00d94703          	lbu	a4,13(s2)
    800032b8:	02871713          	slli	a4,a4,0x28
    800032bc:	00f76733          	or	a4,a4,a5
    800032c0:	00e94783          	lbu	a5,14(s2)
    800032c4:	03079793          	slli	a5,a5,0x30
    800032c8:	00e7e733          	or	a4,a5,a4
    800032cc:	00f94783          	lbu	a5,15(s2)
    800032d0:	03879793          	slli	a5,a5,0x38
    800032d4:	00e7e7b3          	or	a5,a5,a4
    800032d8:	06078663          	beqz	a5,80003344 <_ZN11HeapManager8heapFreeEPv+0x234>
    800032dc:	0107c703          	lbu	a4,16(a5)
    800032e0:	0117c683          	lbu	a3,17(a5)
    800032e4:	00869693          	slli	a3,a3,0x8
    800032e8:	00e6e6b3          	or	a3,a3,a4
    800032ec:	0127c703          	lbu	a4,18(a5)
    800032f0:	01071713          	slli	a4,a4,0x10
    800032f4:	00d766b3          	or	a3,a4,a3
    800032f8:	0137c703          	lbu	a4,19(a5)
    800032fc:	01871713          	slli	a4,a4,0x18
    80003300:	00d76733          	or	a4,a4,a3
    80003304:	0147c683          	lbu	a3,20(a5)
    80003308:	02069693          	slli	a3,a3,0x20
    8000330c:	00e6e733          	or	a4,a3,a4
    80003310:	0157c683          	lbu	a3,21(a5)
    80003314:	02869693          	slli	a3,a3,0x28
    80003318:	00e6e6b3          	or	a3,a3,a4
    8000331c:	0167c703          	lbu	a4,22(a5)
    80003320:	03071713          	slli	a4,a4,0x30
    80003324:	00d766b3          	or	a3,a4,a3
    80003328:	0177c703          	lbu	a4,23(a5)
    8000332c:	03871713          	slli	a4,a4,0x38
    80003330:	00d76733          	or	a4,a4,a3
    80003334:	00170693          	addi	a3,a4,1
    80003338:	00669693          	slli	a3,a3,0x6
    8000333c:	00d786b3          	add	a3,a5,a3
    80003340:	38d90063          	beq	s2,a3,800036c0 <_ZN11HeapManager8heapFreeEPv+0x5b0>
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree->pPrev;
        }pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uintptr_t>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uintptr_t>(pFree->pNext)){
    80003344:	0009c783          	lbu	a5,0(s3)
    80003348:	0019c703          	lbu	a4,1(s3)
    8000334c:	00871713          	slli	a4,a4,0x8
    80003350:	00f76733          	or	a4,a4,a5
    80003354:	0029c783          	lbu	a5,2(s3)
    80003358:	01079793          	slli	a5,a5,0x10
    8000335c:	00e7e733          	or	a4,a5,a4
    80003360:	0039c783          	lbu	a5,3(s3)
    80003364:	01879793          	slli	a5,a5,0x18
    80003368:	00e7e7b3          	or	a5,a5,a4
    8000336c:	0049c703          	lbu	a4,4(s3)
    80003370:	02071713          	slli	a4,a4,0x20
    80003374:	00f767b3          	or	a5,a4,a5
    80003378:	0059c703          	lbu	a4,5(s3)
    8000337c:	02871713          	slli	a4,a4,0x28
    80003380:	00f76733          	or	a4,a4,a5
    80003384:	0069c783          	lbu	a5,6(s3)
    80003388:	03079793          	slli	a5,a5,0x30
    8000338c:	00e7e733          	or	a4,a5,a4
    80003390:	0079c783          	lbu	a5,7(s3)
    80003394:	03879793          	slli	a5,a5,0x38
    80003398:	00e7e7b3          	or	a5,a5,a4
    8000339c:	06078663          	beqz	a5,80003408 <_ZN11HeapManager8heapFreeEPv+0x2f8>
    800033a0:	0109c703          	lbu	a4,16(s3)
    800033a4:	0119c683          	lbu	a3,17(s3)
    800033a8:	00869693          	slli	a3,a3,0x8
    800033ac:	00e6e6b3          	or	a3,a3,a4
    800033b0:	0129c703          	lbu	a4,18(s3)
    800033b4:	01071713          	slli	a4,a4,0x10
    800033b8:	00d766b3          	or	a3,a4,a3
    800033bc:	0139c703          	lbu	a4,19(s3)
    800033c0:	01871713          	slli	a4,a4,0x18
    800033c4:	00d76733          	or	a4,a4,a3
    800033c8:	0149c683          	lbu	a3,20(s3)
    800033cc:	02069693          	slli	a3,a3,0x20
    800033d0:	00e6e733          	or	a4,a3,a4
    800033d4:	0159c683          	lbu	a3,21(s3)
    800033d8:	02869693          	slli	a3,a3,0x28
    800033dc:	00e6e6b3          	or	a3,a3,a4
    800033e0:	0169c703          	lbu	a4,22(s3)
    800033e4:	03071713          	slli	a4,a4,0x30
    800033e8:	00d766b3          	or	a3,a4,a3
    800033ec:	0179c703          	lbu	a4,23(s3)
    800033f0:	03871713          	slli	a4,a4,0x38
    800033f4:	00d76733          	or	a4,a4,a3
    800033f8:	00170693          	addi	a3,a4,1
    800033fc:	00669693          	slli	a3,a3,0x6
    80003400:	00d986b3          	add	a3,s3,a3
    80003404:	58f68863          	beq	a3,a5,80003994 <_ZN11HeapManager8heapFreeEPv+0x884>
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree;
        }
    }
    return 0;
}
    80003408:	00000513          	li	a0,0
    8000340c:	03813083          	ld	ra,56(sp)
    80003410:	03013403          	ld	s0,48(sp)
    80003414:	02813483          	ld	s1,40(sp)
    80003418:	02013903          	ld	s2,32(sp)
    8000341c:	01813983          	ld	s3,24(sp)
    80003420:	01013a03          	ld	s4,16(sp)
    80003424:	00813a83          	ld	s5,8(sp)
    80003428:	04010113          	addi	sp,sp,64
    8000342c:	00008067          	ret
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003430:	00004697          	auipc	a3,0x4
    80003434:	da868693          	addi	a3,a3,-600 # 800071d8 <CONSOLE_STATUS+0x1c8>
    80003438:	05600613          	li	a2,86
    8000343c:	00004597          	auipc	a1,0x4
    80003440:	cbc58593          	addi	a1,a1,-836 # 800070f8 <CONSOLE_STATUS+0xe8>
    80003444:	00004517          	auipc	a0,0x4
    80003448:	dbc50513          	addi	a0,a0,-580 # 80007200 <CONSOLE_STATUS+0x1f0>
    8000344c:	ffffe097          	auipc	ra,0xffffe
    80003450:	4d8080e7          	jalr	1240(ra) # 80001924 <_Z13assert_failedPKcS0_jS0_>
    80003454:	d29ff06f          	j	8000317c <_ZN11HeapManager8heapFreeEPv+0x6c>
            pInsert = pInsert->pNext;
    80003458:	0004c703          	lbu	a4,0(s1)
    8000345c:	0014c783          	lbu	a5,1(s1)
    80003460:	00879793          	slli	a5,a5,0x8
    80003464:	00e7e733          	or	a4,a5,a4
    80003468:	0024c783          	lbu	a5,2(s1)
    8000346c:	01079793          	slli	a5,a5,0x10
    80003470:	00e7e7b3          	or	a5,a5,a4
    80003474:	0034c703          	lbu	a4,3(s1)
    80003478:	01871713          	slli	a4,a4,0x18
    8000347c:	00f767b3          	or	a5,a4,a5
    80003480:	0044c703          	lbu	a4,4(s1)
    80003484:	02071713          	slli	a4,a4,0x20
    80003488:	00f76733          	or	a4,a4,a5
    8000348c:	0054c783          	lbu	a5,5(s1)
    80003490:	02879793          	slli	a5,a5,0x28
    80003494:	00e7e733          	or	a4,a5,a4
    80003498:	0064c783          	lbu	a5,6(s1)
    8000349c:	03079793          	slli	a5,a5,0x30
    800034a0:	00e7e7b3          	or	a5,a5,a4
    800034a4:	0074c483          	lbu	s1,7(s1)
    800034a8:	03849493          	slli	s1,s1,0x38
    800034ac:	00f4e4b3          	or	s1,s1,a5
        while(pInsert->pNext != 0 && pInsert->pNext < pAddress){
    800034b0:	0004c783          	lbu	a5,0(s1)
    800034b4:	0014c703          	lbu	a4,1(s1)
    800034b8:	00871713          	slli	a4,a4,0x8
    800034bc:	00f76733          	or	a4,a4,a5
    800034c0:	0024c783          	lbu	a5,2(s1)
    800034c4:	01079793          	slli	a5,a5,0x10
    800034c8:	00e7e733          	or	a4,a5,a4
    800034cc:	0034c783          	lbu	a5,3(s1)
    800034d0:	01879793          	slli	a5,a5,0x18
    800034d4:	00e7e7b3          	or	a5,a5,a4
    800034d8:	0044c703          	lbu	a4,4(s1)
    800034dc:	02071713          	slli	a4,a4,0x20
    800034e0:	00f767b3          	or	a5,a4,a5
    800034e4:	0054c703          	lbu	a4,5(s1)
    800034e8:	02871713          	slli	a4,a4,0x28
    800034ec:	00f76733          	or	a4,a4,a5
    800034f0:	0064c783          	lbu	a5,6(s1)
    800034f4:	03079793          	slli	a5,a5,0x30
    800034f8:	00e7e733          	or	a4,a5,a4
    800034fc:	0074c783          	lbu	a5,7(s1)
    80003500:	03879793          	slli	a5,a5,0x38
    80003504:	00e7e7b3          	or	a5,a5,a4
    80003508:	06078463          	beqz	a5,80003570 <_ZN11HeapManager8heapFreeEPv+0x460>
    8000350c:	0747f263          	bgeu	a5,s4,80003570 <_ZN11HeapManager8heapFreeEPv+0x460>
            assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    80003510:	0184c783          	lbu	a5,24(s1)
    80003514:	0194c703          	lbu	a4,25(s1)
    80003518:	00871713          	slli	a4,a4,0x8
    8000351c:	00f76733          	or	a4,a4,a5
    80003520:	01a4c783          	lbu	a5,26(s1)
    80003524:	01079793          	slli	a5,a5,0x10
    80003528:	00e7e733          	or	a4,a5,a4
    8000352c:	01b4c783          	lbu	a5,27(s1)
    80003530:	01879793          	slli	a5,a5,0x18
    80003534:	00e7e7b3          	or	a5,a5,a4
    80003538:	0007879b          	sext.w	a5,a5
    8000353c:	deadc737          	lui	a4,0xdeadc
    80003540:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2d8e>
    80003544:	f0e78ae3          	beq	a5,a4,80003458 <_ZN11HeapManager8heapFreeEPv+0x348>
    80003548:	00004697          	auipc	a3,0x4
    8000354c:	c9068693          	addi	a3,a3,-880 # 800071d8 <CONSOLE_STATUS+0x1c8>
    80003550:	06000613          	li	a2,96
    80003554:	00004597          	auipc	a1,0x4
    80003558:	ba458593          	addi	a1,a1,-1116 # 800070f8 <CONSOLE_STATUS+0xe8>
    8000355c:	00004517          	auipc	a0,0x4
    80003560:	ccc50513          	addi	a0,a0,-820 # 80007228 <CONSOLE_STATUS+0x218>
    80003564:	ffffe097          	auipc	ra,0xffffe
    80003568:	3c0080e7          	jalr	960(ra) # 80001924 <_Z13assert_failedPKcS0_jS0_>
    8000356c:	eedff06f          	j	80003458 <_ZN11HeapManager8heapFreeEPv+0x348>
        pFree->pNext = pInsert->pNext;
    80003570:	fcfa0023          	sb	a5,-64(s4)
    80003574:	0087d713          	srli	a4,a5,0x8
    80003578:	00e900a3          	sb	a4,1(s2)
    8000357c:	0107d713          	srli	a4,a5,0x10
    80003580:	00e90123          	sb	a4,2(s2)
    80003584:	0187d71b          	srliw	a4,a5,0x18
    80003588:	00e901a3          	sb	a4,3(s2)
    8000358c:	0207d713          	srli	a4,a5,0x20
    80003590:	00e90223          	sb	a4,4(s2)
    80003594:	0287d713          	srli	a4,a5,0x28
    80003598:	00e902a3          	sb	a4,5(s2)
    8000359c:	0307d713          	srli	a4,a5,0x30
    800035a0:	00e90323          	sb	a4,6(s2)
    800035a4:	0387d793          	srli	a5,a5,0x38
    800035a8:	00f903a3          	sb	a5,7(s2)
        pFree->pPrev = pInsert;
    800035ac:	00990423          	sb	s1,8(s2)
    800035b0:	0084d793          	srli	a5,s1,0x8
    800035b4:	00f904a3          	sb	a5,9(s2)
    800035b8:	0104d793          	srli	a5,s1,0x10
    800035bc:	00f90523          	sb	a5,10(s2)
    800035c0:	0184d79b          	srliw	a5,s1,0x18
    800035c4:	00f905a3          	sb	a5,11(s2)
    800035c8:	0204d793          	srli	a5,s1,0x20
    800035cc:	00f90623          	sb	a5,12(s2)
    800035d0:	0284d793          	srli	a5,s1,0x28
    800035d4:	00f906a3          	sb	a5,13(s2)
    800035d8:	0304d793          	srli	a5,s1,0x30
    800035dc:	00f90723          	sb	a5,14(s2)
    800035e0:	0384d793          	srli	a5,s1,0x38
    800035e4:	00f907a3          	sb	a5,15(s2)
        if(pInsert->pNext != 0){
    800035e8:	0004c783          	lbu	a5,0(s1)
    800035ec:	0014c703          	lbu	a4,1(s1)
    800035f0:	00871713          	slli	a4,a4,0x8
    800035f4:	00f76733          	or	a4,a4,a5
    800035f8:	0024c783          	lbu	a5,2(s1)
    800035fc:	01079793          	slli	a5,a5,0x10
    80003600:	00e7e733          	or	a4,a5,a4
    80003604:	0034c783          	lbu	a5,3(s1)
    80003608:	01879793          	slli	a5,a5,0x18
    8000360c:	00e7e7b3          	or	a5,a5,a4
    80003610:	0044c703          	lbu	a4,4(s1)
    80003614:	02071713          	slli	a4,a4,0x20
    80003618:	00f767b3          	or	a5,a4,a5
    8000361c:	0054c703          	lbu	a4,5(s1)
    80003620:	02871713          	slli	a4,a4,0x28
    80003624:	00f76733          	or	a4,a4,a5
    80003628:	0064c783          	lbu	a5,6(s1)
    8000362c:	03079793          	slli	a5,a5,0x30
    80003630:	00e7e733          	or	a4,a5,a4
    80003634:	0074c783          	lbu	a5,7(s1)
    80003638:	03879793          	slli	a5,a5,0x38
    8000363c:	00e7e7b3          	or	a5,a5,a4
    80003640:	04078063          	beqz	a5,80003680 <_ZN11HeapManager8heapFreeEPv+0x570>
            pInsert->pNext->pPrev = pFree;
    80003644:	01278423          	sb	s2,8(a5)
    80003648:	00895713          	srli	a4,s2,0x8
    8000364c:	00e784a3          	sb	a4,9(a5)
    80003650:	01095713          	srli	a4,s2,0x10
    80003654:	00e78523          	sb	a4,10(a5)
    80003658:	0189571b          	srliw	a4,s2,0x18
    8000365c:	00e785a3          	sb	a4,11(a5)
    80003660:	02095713          	srli	a4,s2,0x20
    80003664:	00e78623          	sb	a4,12(a5)
    80003668:	02895713          	srli	a4,s2,0x28
    8000366c:	00e786a3          	sb	a4,13(a5)
    80003670:	03095713          	srli	a4,s2,0x30
    80003674:	00e78723          	sb	a4,14(a5)
    80003678:	03895713          	srli	a4,s2,0x38
    8000367c:	00e787a3          	sb	a4,15(a5)
        pInsert->pNext = pFree;
    80003680:	01248023          	sb	s2,0(s1)
    80003684:	00895793          	srli	a5,s2,0x8
    80003688:	00f480a3          	sb	a5,1(s1)
    8000368c:	01095793          	srli	a5,s2,0x10
    80003690:	00f48123          	sb	a5,2(s1)
    80003694:	0189579b          	srliw	a5,s2,0x18
    80003698:	00f481a3          	sb	a5,3(s1)
    8000369c:	02095793          	srli	a5,s2,0x20
    800036a0:	00f48223          	sb	a5,4(s1)
    800036a4:	02895793          	srli	a5,s2,0x28
    800036a8:	00f482a3          	sb	a5,5(s1)
    800036ac:	03095793          	srli	a5,s2,0x30
    800036b0:	00f48323          	sb	a5,6(s1)
    800036b4:	03895793          	srli	a5,s2,0x38
    800036b8:	00f483a3          	sb	a5,7(s1)
    800036bc:	bc5ff06f          	j	80003280 <_ZN11HeapManager8heapFreeEPv+0x170>
        pFree->pPrev->nSize += pFree->nSize + 1;
    800036c0:	01094683          	lbu	a3,16(s2)
    800036c4:	01194603          	lbu	a2,17(s2)
    800036c8:	00861613          	slli	a2,a2,0x8
    800036cc:	00d66633          	or	a2,a2,a3
    800036d0:	01294683          	lbu	a3,18(s2)
    800036d4:	01069693          	slli	a3,a3,0x10
    800036d8:	00c6e633          	or	a2,a3,a2
    800036dc:	01394683          	lbu	a3,19(s2)
    800036e0:	01869693          	slli	a3,a3,0x18
    800036e4:	00c6e6b3          	or	a3,a3,a2
    800036e8:	01494603          	lbu	a2,20(s2)
    800036ec:	02061613          	slli	a2,a2,0x20
    800036f0:	00d666b3          	or	a3,a2,a3
    800036f4:	01594603          	lbu	a2,21(s2)
    800036f8:	02861613          	slli	a2,a2,0x28
    800036fc:	00d66633          	or	a2,a2,a3
    80003700:	01694683          	lbu	a3,22(s2)
    80003704:	03069693          	slli	a3,a3,0x30
    80003708:	00c6e633          	or	a2,a3,a2
    8000370c:	01794683          	lbu	a3,23(s2)
    80003710:	03869693          	slli	a3,a3,0x38
    80003714:	00c6e6b3          	or	a3,a3,a2
    80003718:	00d70733          	add	a4,a4,a3
    8000371c:	00170713          	addi	a4,a4,1
    80003720:	00e78823          	sb	a4,16(a5)
    80003724:	00875693          	srli	a3,a4,0x8
    80003728:	00d788a3          	sb	a3,17(a5)
    8000372c:	01075693          	srli	a3,a4,0x10
    80003730:	00d78923          	sb	a3,18(a5)
    80003734:	0187569b          	srliw	a3,a4,0x18
    80003738:	00d789a3          	sb	a3,19(a5)
    8000373c:	02075693          	srli	a3,a4,0x20
    80003740:	00d78a23          	sb	a3,20(a5)
    80003744:	02875693          	srli	a3,a4,0x28
    80003748:	00d78aa3          	sb	a3,21(a5)
    8000374c:	03075693          	srli	a3,a4,0x30
    80003750:	00d78b23          	sb	a3,22(a5)
    80003754:	03875713          	srli	a4,a4,0x38
    80003758:	00e78ba3          	sb	a4,23(a5)
        pFree->pPrev->pNext = pFree->pNext;
    8000375c:	00894703          	lbu	a4,8(s2)
    80003760:	00994783          	lbu	a5,9(s2)
    80003764:	00879793          	slli	a5,a5,0x8
    80003768:	00e7e7b3          	or	a5,a5,a4
    8000376c:	00a94703          	lbu	a4,10(s2)
    80003770:	01071713          	slli	a4,a4,0x10
    80003774:	00f767b3          	or	a5,a4,a5
    80003778:	00b94703          	lbu	a4,11(s2)
    8000377c:	01871713          	slli	a4,a4,0x18
    80003780:	00f76733          	or	a4,a4,a5
    80003784:	00c94783          	lbu	a5,12(s2)
    80003788:	02079793          	slli	a5,a5,0x20
    8000378c:	00e7e733          	or	a4,a5,a4
    80003790:	00d94783          	lbu	a5,13(s2)
    80003794:	02879793          	slli	a5,a5,0x28
    80003798:	00e7e7b3          	or	a5,a5,a4
    8000379c:	00e94703          	lbu	a4,14(s2)
    800037a0:	03071713          	slli	a4,a4,0x30
    800037a4:	00f767b3          	or	a5,a4,a5
    800037a8:	00f94703          	lbu	a4,15(s2)
    800037ac:	03871713          	slli	a4,a4,0x38
    800037b0:	00f76733          	or	a4,a4,a5
    800037b4:	fc0a4783          	lbu	a5,-64(s4)
    800037b8:	00194683          	lbu	a3,1(s2)
    800037bc:	00869693          	slli	a3,a3,0x8
    800037c0:	00f6e7b3          	or	a5,a3,a5
    800037c4:	00294683          	lbu	a3,2(s2)
    800037c8:	01069693          	slli	a3,a3,0x10
    800037cc:	00f6e6b3          	or	a3,a3,a5
    800037d0:	00394783          	lbu	a5,3(s2)
    800037d4:	01879793          	slli	a5,a5,0x18
    800037d8:	00d7e6b3          	or	a3,a5,a3
    800037dc:	00494783          	lbu	a5,4(s2)
    800037e0:	02079793          	slli	a5,a5,0x20
    800037e4:	00d7e7b3          	or	a5,a5,a3
    800037e8:	00594683          	lbu	a3,5(s2)
    800037ec:	02869693          	slli	a3,a3,0x28
    800037f0:	00f6e7b3          	or	a5,a3,a5
    800037f4:	00694683          	lbu	a3,6(s2)
    800037f8:	03069693          	slli	a3,a3,0x30
    800037fc:	00f6e6b3          	or	a3,a3,a5
    80003800:	00794783          	lbu	a5,7(s2)
    80003804:	03879793          	slli	a5,a5,0x38
    80003808:	00d7e7b3          	or	a5,a5,a3
    8000380c:	00d70023          	sb	a3,0(a4)
    80003810:	0087d693          	srli	a3,a5,0x8
    80003814:	00d700a3          	sb	a3,1(a4)
    80003818:	0107d693          	srli	a3,a5,0x10
    8000381c:	00d70123          	sb	a3,2(a4)
    80003820:	0187d69b          	srliw	a3,a5,0x18
    80003824:	00d701a3          	sb	a3,3(a4)
    80003828:	0207d693          	srli	a3,a5,0x20
    8000382c:	00d70223          	sb	a3,4(a4)
    80003830:	0287d693          	srli	a3,a5,0x28
    80003834:	00d702a3          	sb	a3,5(a4)
    80003838:	0307d693          	srli	a3,a5,0x30
    8000383c:	00d70323          	sb	a3,6(a4)
    80003840:	0387d793          	srli	a5,a5,0x38
    80003844:	00f703a3          	sb	a5,7(a4)
        if(pFree->pNext != 0){
    80003848:	fc0a4783          	lbu	a5,-64(s4)
    8000384c:	00194703          	lbu	a4,1(s2)
    80003850:	00871713          	slli	a4,a4,0x8
    80003854:	00f76733          	or	a4,a4,a5
    80003858:	00294783          	lbu	a5,2(s2)
    8000385c:	01079793          	slli	a5,a5,0x10
    80003860:	00e7e733          	or	a4,a5,a4
    80003864:	00394783          	lbu	a5,3(s2)
    80003868:	01879793          	slli	a5,a5,0x18
    8000386c:	00e7e7b3          	or	a5,a5,a4
    80003870:	00494703          	lbu	a4,4(s2)
    80003874:	02071713          	slli	a4,a4,0x20
    80003878:	00f767b3          	or	a5,a4,a5
    8000387c:	00594703          	lbu	a4,5(s2)
    80003880:	02871713          	slli	a4,a4,0x28
    80003884:	00f76733          	or	a4,a4,a5
    80003888:	00694783          	lbu	a5,6(s2)
    8000388c:	03079793          	slli	a5,a5,0x30
    80003890:	00e7e733          	or	a4,a5,a4
    80003894:	00794783          	lbu	a5,7(s2)
    80003898:	03879793          	slli	a5,a5,0x38
    8000389c:	00e7e7b3          	or	a5,a5,a4
    800038a0:	08078c63          	beqz	a5,80003938 <_ZN11HeapManager8heapFreeEPv+0x828>
            pFree->pNext->pPrev = pFree->pPrev;
    800038a4:	00894703          	lbu	a4,8(s2)
    800038a8:	00994683          	lbu	a3,9(s2)
    800038ac:	00869693          	slli	a3,a3,0x8
    800038b0:	00e6e733          	or	a4,a3,a4
    800038b4:	00a94683          	lbu	a3,10(s2)
    800038b8:	01069693          	slli	a3,a3,0x10
    800038bc:	00e6e6b3          	or	a3,a3,a4
    800038c0:	00b94703          	lbu	a4,11(s2)
    800038c4:	01871713          	slli	a4,a4,0x18
    800038c8:	00d766b3          	or	a3,a4,a3
    800038cc:	00c94703          	lbu	a4,12(s2)
    800038d0:	02071713          	slli	a4,a4,0x20
    800038d4:	00d76733          	or	a4,a4,a3
    800038d8:	00d94683          	lbu	a3,13(s2)
    800038dc:	02869693          	slli	a3,a3,0x28
    800038e0:	00e6e733          	or	a4,a3,a4
    800038e4:	00e94683          	lbu	a3,14(s2)
    800038e8:	03069693          	slli	a3,a3,0x30
    800038ec:	00e6e6b3          	or	a3,a3,a4
    800038f0:	00f94703          	lbu	a4,15(s2)
    800038f4:	03871713          	slli	a4,a4,0x38
    800038f8:	00d76733          	or	a4,a4,a3
    800038fc:	00d78423          	sb	a3,8(a5)
    80003900:	00875693          	srli	a3,a4,0x8
    80003904:	00d784a3          	sb	a3,9(a5)
    80003908:	01075693          	srli	a3,a4,0x10
    8000390c:	00d78523          	sb	a3,10(a5)
    80003910:	0187569b          	srliw	a3,a4,0x18
    80003914:	00d785a3          	sb	a3,11(a5)
    80003918:	02075693          	srli	a3,a4,0x20
    8000391c:	00d78623          	sb	a3,12(a5)
    80003920:	02875693          	srli	a3,a4,0x28
    80003924:	00d786a3          	sb	a3,13(a5)
    80003928:	03075693          	srli	a3,a4,0x30
    8000392c:	00d78723          	sb	a3,14(a5)
    80003930:	03875713          	srli	a4,a4,0x38
    80003934:	00e787a3          	sb	a4,15(a5)
        }pFree = pFree->pPrev;
    80003938:	00894983          	lbu	s3,8(s2)
    8000393c:	00994783          	lbu	a5,9(s2)
    80003940:	00879793          	slli	a5,a5,0x8
    80003944:	0137e7b3          	or	a5,a5,s3
    80003948:	00a94983          	lbu	s3,10(s2)
    8000394c:	01099993          	slli	s3,s3,0x10
    80003950:	00f9e7b3          	or	a5,s3,a5
    80003954:	00b94983          	lbu	s3,11(s2)
    80003958:	01899993          	slli	s3,s3,0x18
    8000395c:	00f9e9b3          	or	s3,s3,a5
    80003960:	00c94783          	lbu	a5,12(s2)
    80003964:	02079793          	slli	a5,a5,0x20
    80003968:	0137e9b3          	or	s3,a5,s3
    8000396c:	00d94783          	lbu	a5,13(s2)
    80003970:	02879793          	slli	a5,a5,0x28
    80003974:	0137e7b3          	or	a5,a5,s3
    80003978:	00e94983          	lbu	s3,14(s2)
    8000397c:	03099993          	slli	s3,s3,0x30
    80003980:	00f9e7b3          	or	a5,s3,a5
    80003984:	00f94983          	lbu	s3,15(s2)
    80003988:	03899993          	slli	s3,s3,0x38
    8000398c:	00f9e9b3          	or	s3,s3,a5
    80003990:	9b5ff06f          	j	80003344 <_ZN11HeapManager8heapFreeEPv+0x234>
        pFree->nSize += pFree->pNext->nSize + 1;
    80003994:	0107c683          	lbu	a3,16(a5)
    80003998:	0117c603          	lbu	a2,17(a5)
    8000399c:	00861613          	slli	a2,a2,0x8
    800039a0:	00d66633          	or	a2,a2,a3
    800039a4:	0127c683          	lbu	a3,18(a5)
    800039a8:	01069693          	slli	a3,a3,0x10
    800039ac:	00c6e633          	or	a2,a3,a2
    800039b0:	0137c683          	lbu	a3,19(a5)
    800039b4:	01869693          	slli	a3,a3,0x18
    800039b8:	00c6e6b3          	or	a3,a3,a2
    800039bc:	0147c603          	lbu	a2,20(a5)
    800039c0:	02061613          	slli	a2,a2,0x20
    800039c4:	00d666b3          	or	a3,a2,a3
    800039c8:	0157c603          	lbu	a2,21(a5)
    800039cc:	02861613          	slli	a2,a2,0x28
    800039d0:	00d66633          	or	a2,a2,a3
    800039d4:	0167c683          	lbu	a3,22(a5)
    800039d8:	03069693          	slli	a3,a3,0x30
    800039dc:	00c6e633          	or	a2,a3,a2
    800039e0:	0177c683          	lbu	a3,23(a5)
    800039e4:	03869693          	slli	a3,a3,0x38
    800039e8:	00c6e6b3          	or	a3,a3,a2
    800039ec:	00d70733          	add	a4,a4,a3
    800039f0:	00170713          	addi	a4,a4,1
    800039f4:	00e98823          	sb	a4,16(s3)
    800039f8:	00875693          	srli	a3,a4,0x8
    800039fc:	00d988a3          	sb	a3,17(s3)
    80003a00:	01075693          	srli	a3,a4,0x10
    80003a04:	00d98923          	sb	a3,18(s3)
    80003a08:	0187569b          	srliw	a3,a4,0x18
    80003a0c:	00d989a3          	sb	a3,19(s3)
    80003a10:	02075693          	srli	a3,a4,0x20
    80003a14:	00d98a23          	sb	a3,20(s3)
    80003a18:	02875693          	srli	a3,a4,0x28
    80003a1c:	00d98aa3          	sb	a3,21(s3)
    80003a20:	03075693          	srli	a3,a4,0x30
    80003a24:	00d98b23          	sb	a3,22(s3)
    80003a28:	03875713          	srli	a4,a4,0x38
    80003a2c:	00e98ba3          	sb	a4,23(s3)
        pFree->pNext = pFree->pNext->pNext;
    80003a30:	0007c683          	lbu	a3,0(a5)
    80003a34:	0017c703          	lbu	a4,1(a5)
    80003a38:	00871713          	slli	a4,a4,0x8
    80003a3c:	00d766b3          	or	a3,a4,a3
    80003a40:	0027c703          	lbu	a4,2(a5)
    80003a44:	01071713          	slli	a4,a4,0x10
    80003a48:	00d76733          	or	a4,a4,a3
    80003a4c:	0037c683          	lbu	a3,3(a5)
    80003a50:	01869693          	slli	a3,a3,0x18
    80003a54:	00e6e733          	or	a4,a3,a4
    80003a58:	0047c683          	lbu	a3,4(a5)
    80003a5c:	02069693          	slli	a3,a3,0x20
    80003a60:	00e6e6b3          	or	a3,a3,a4
    80003a64:	0057c703          	lbu	a4,5(a5)
    80003a68:	02871713          	slli	a4,a4,0x28
    80003a6c:	00d766b3          	or	a3,a4,a3
    80003a70:	0067c703          	lbu	a4,6(a5)
    80003a74:	03071713          	slli	a4,a4,0x30
    80003a78:	00d76733          	or	a4,a4,a3
    80003a7c:	0077c783          	lbu	a5,7(a5)
    80003a80:	03879793          	slli	a5,a5,0x38
    80003a84:	00e7e7b3          	or	a5,a5,a4
    80003a88:	00e98023          	sb	a4,0(s3)
    80003a8c:	0087d713          	srli	a4,a5,0x8
    80003a90:	00e980a3          	sb	a4,1(s3)
    80003a94:	0107d713          	srli	a4,a5,0x10
    80003a98:	00e98123          	sb	a4,2(s3)
    80003a9c:	0187d71b          	srliw	a4,a5,0x18
    80003aa0:	00e981a3          	sb	a4,3(s3)
    80003aa4:	0207d713          	srli	a4,a5,0x20
    80003aa8:	00e98223          	sb	a4,4(s3)
    80003aac:	0287d713          	srli	a4,a5,0x28
    80003ab0:	00e982a3          	sb	a4,5(s3)
    80003ab4:	0307d713          	srli	a4,a5,0x30
    80003ab8:	00e98323          	sb	a4,6(s3)
    80003abc:	0387d713          	srli	a4,a5,0x38
    80003ac0:	00e983a3          	sb	a4,7(s3)
        if(pFree->pNext != 0){
    80003ac4:	940782e3          	beqz	a5,80003408 <_ZN11HeapManager8heapFreeEPv+0x2f8>
            pFree->pNext->pPrev = pFree;
    80003ac8:	01378423          	sb	s3,8(a5)
    80003acc:	0089d713          	srli	a4,s3,0x8
    80003ad0:	00e784a3          	sb	a4,9(a5)
    80003ad4:	0109d713          	srli	a4,s3,0x10
    80003ad8:	00e78523          	sb	a4,10(a5)
    80003adc:	0189d71b          	srliw	a4,s3,0x18
    80003ae0:	00e785a3          	sb	a4,11(a5)
    80003ae4:	0209d713          	srli	a4,s3,0x20
    80003ae8:	00e78623          	sb	a4,12(a5)
    80003aec:	0289d713          	srli	a4,s3,0x28
    80003af0:	00e786a3          	sb	a4,13(a5)
    80003af4:	0309d713          	srli	a4,s3,0x30
    80003af8:	00e78723          	sb	a4,14(a5)
    80003afc:	0389d993          	srli	s3,s3,0x38
    80003b00:	013787a3          	sb	s3,15(a5)
    80003b04:	905ff06f          	j	80003408 <_ZN11HeapManager8heapFreeEPv+0x2f8>

0000000080003b08 <exceptionHandler>:
#include "sem.h"
#include "timer.h"
#include "assert.h"


extern "C" void exceptionHandler(){
    80003b08:	fc010113          	addi	sp,sp,-64
    80003b0c:	02113c23          	sd	ra,56(sp)
    80003b10:	02813823          	sd	s0,48(sp)
    80003b14:	02913423          	sd	s1,40(sp)
    80003b18:	03213023          	sd	s2,32(sp)
    80003b1c:	01313c23          	sd	s3,24(sp)
    80003b20:	01413823          	sd	s4,16(sp)
    80003b24:	01513423          	sd	s5,8(sp)
    80003b28:	01613023          	sd	s6,0(sp)
    80003b2c:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    80003b30:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    80003b34:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    80003b38:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    80003b3c:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80003b40:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80003b44:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80003b48:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80003b4c:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80003b50:	ff870613          	addi	a2,a4,-8
    80003b54:	00100693          	li	a3,1
    80003b58:	02c6fa63          	bgeu	a3,a2,80003b8c <exceptionHandler+0x84>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, 0x2");
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    80003b5c:	00500793          	li	a5,5
    80003b60:	1af70e63          	beq	a4,a5,80003d1c <exceptionHandler+0x214>
                __putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    80003b64:	00700793          	li	a5,7
    80003b68:	36f70863          	beq	a4,a5,80003ed8 <exceptionHandler+0x3d0>
                __putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    80003b6c:	fff00793          	li	a5,-1
    80003b70:	03f79793          	slli	a5,a5,0x3f
    80003b74:	00178793          	addi	a5,a5,1
    80003b78:	52f70463          	beq	a4,a5,800040a0 <exceptionHandler+0x598>
        Timer::getInstance().tick();
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, 0x2");
    }else{
        __putc(',');
    80003b7c:	02c00513          	li	a0,44
    80003b80:	00003097          	auipc	ra,0x3
    80003b84:	a1c080e7          	jalr	-1508(ra) # 8000659c <__putc>
    }
    80003b88:	0540006f          	j	80003bdc <exceptionHandler+0xd4>
        switch(a0){
    80003b8c:	04200713          	li	a4,66
    80003b90:	18f76263          	bltu	a4,a5,80003d14 <exceptionHandler+0x20c>
    80003b94:	00279793          	slli	a5,a5,0x2
    80003b98:	00003717          	auipc	a4,0x3
    80003b9c:	6f870713          	addi	a4,a4,1784 # 80007290 <CONSOLE_STATUS+0x280>
    80003ba0:	00e787b3          	add	a5,a5,a4
    80003ba4:	0007a783          	lw	a5,0(a5)
    80003ba8:	00e787b3          	add	a5,a5,a4
    80003bac:	00078067          	jr	a5
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80003bb0:	00098593          	mv	a1,s3
    80003bb4:	00004797          	auipc	a5,0x4
    80003bb8:	48c7b783          	ld	a5,1164(a5) # 80008040 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003bbc:	0007b503          	ld	a0,0(a5)
    80003bc0:	fffff097          	auipc	ra,0xfffff
    80003bc4:	ef8080e7          	jalr	-264(ra) # 80002ab8 <_ZN11HeapManager12heapAllocateEm>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80003bc8:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80003bcc:	00448493          	addi	s1,s1,4
    80003bd0:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003bd4:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, 0x2");
    80003bd8:	14417073          	csrci	sip,2
    80003bdc:	03813083          	ld	ra,56(sp)
    80003be0:	03013403          	ld	s0,48(sp)
    80003be4:	02813483          	ld	s1,40(sp)
    80003be8:	02013903          	ld	s2,32(sp)
    80003bec:	01813983          	ld	s3,24(sp)
    80003bf0:	01013a03          	ld	s4,16(sp)
    80003bf4:	00813a83          	ld	s5,8(sp)
    80003bf8:	00013b03          	ld	s6,0(sp)
    80003bfc:	04010113          	addi	sp,sp,64
    80003c00:	00008067          	ret
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    80003c04:	00098593          	mv	a1,s3
    80003c08:	00004797          	auipc	a5,0x4
    80003c0c:	4387b783          	ld	a5,1080(a5) # 80008040 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003c10:	0007b503          	ld	a0,0(a5)
    80003c14:	fffff097          	auipc	ra,0xfffff
    80003c18:	4fc080e7          	jalr	1276(ra) # 80003110 <_ZN11HeapManager8heapFreeEPv>
                break;
    80003c1c:	fadff06f          	j	80003bc8 <exceptionHandler+0xc0>
                __putc('\0');
    80003c20:	00000513          	li	a0,0
    80003c24:	00003097          	auipc	ra,0x3
    80003c28:	978080e7          	jalr	-1672(ra) # 8000659c <__putc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    80003c2c:	00100713          	li	a4,1
    80003c30:	000b0693          	mv	a3,s6
    80003c34:	000a8613          	mv	a2,s5
    80003c38:	000a0593          	mv	a1,s4
    80003c3c:	00098513          	mv	a0,s3
    80003c40:	ffffe097          	auipc	ra,0xffffe
    80003c44:	600080e7          	jalr	1536(ra) # 80002240 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80003c48:	f81ff06f          	j	80003bc8 <exceptionHandler+0xc0>
                returnVal = _thread::currentThread->exit();
    80003c4c:	fffff097          	auipc	ra,0xfffff
    80003c50:	aa8080e7          	jalr	-1368(ra) # 800026f4 <_ZN7_thread4exitEv>
                break;
    80003c54:	f75ff06f          	j	80003bc8 <exceptionHandler+0xc0>
                _thread::dispatch();
    80003c58:	fffff097          	auipc	ra,0xfffff
    80003c5c:	8e8080e7          	jalr	-1816(ra) # 80002540 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80003c60:	00000513          	li	a0,0
                break;
    80003c64:	f65ff06f          	j	80003bc8 <exceptionHandler+0xc0>
                _thread::currentThread->join((thread_t)a1);
    80003c68:	00098593          	mv	a1,s3
    80003c6c:	00004797          	auipc	a5,0x4
    80003c70:	3f47b783          	ld	a5,1012(a5) # 80008060 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003c74:	0007b503          	ld	a0,0(a5)
    80003c78:	fffff097          	auipc	ra,0xfffff
    80003c7c:	960080e7          	jalr	-1696(ra) # 800025d8 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80003c80:	00000513          	li	a0,0
                break;
    80003c84:	f45ff06f          	j	80003bc8 <exceptionHandler+0xc0>
                _sem::open((sem_t*)a1, unsigned(a2));
    80003c88:	000a059b          	sext.w	a1,s4
    80003c8c:	00098513          	mv	a0,s3
    80003c90:	ffffe097          	auipc	ra,0xffffe
    80003c94:	9f8080e7          	jalr	-1544(ra) # 80001688 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80003c98:	00000513          	li	a0,0
                break;
    80003c9c:	f2dff06f          	j	80003bc8 <exceptionHandler+0xc0>
                _sem::close((sem_t)a1);
    80003ca0:	00098513          	mv	a0,s3
    80003ca4:	ffffe097          	auipc	ra,0xffffe
    80003ca8:	a40080e7          	jalr	-1472(ra) # 800016e4 <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80003cac:	00000513          	li	a0,0
                break;
    80003cb0:	f19ff06f          	j	80003bc8 <exceptionHandler+0xc0>
                _sem::wait((sem_t)a1);
    80003cb4:	00098513          	mv	a0,s3
    80003cb8:	ffffe097          	auipc	ra,0xffffe
    80003cbc:	a8c080e7          	jalr	-1396(ra) # 80001744 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    80003cc0:	00000513          	li	a0,0
                break;
    80003cc4:	f05ff06f          	j	80003bc8 <exceptionHandler+0xc0>
                _sem::signal((sem_t)a1);
    80003cc8:	00098513          	mv	a0,s3
    80003ccc:	ffffe097          	auipc	ra,0xffffe
    80003cd0:	b1c080e7          	jalr	-1252(ra) # 800017e8 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80003cd4:	00000513          	li	a0,0
                break;
    80003cd8:	ef1ff06f          	j	80003bc8 <exceptionHandler+0xc0>
                returnVal = Timer::getInstance().sleep(a1);
    80003cdc:	ffffd097          	auipc	ra,0xffffd
    80003ce0:	4dc080e7          	jalr	1244(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    80003ce4:	00098593          	mv	a1,s3
    80003ce8:	ffffd097          	auipc	ra,0xffffd
    80003cec:	600080e7          	jalr	1536(ra) # 800012e8 <_ZN5Timer5sleepEm>
                break;
    80003cf0:	ed9ff06f          	j	80003bc8 <exceptionHandler+0xc0>
                returnVal = __getc();
    80003cf4:	00003097          	auipc	ra,0x3
    80003cf8:	8e4080e7          	jalr	-1820(ra) # 800065d8 <__getc>
                break;
    80003cfc:	ecdff06f          	j	80003bc8 <exceptionHandler+0xc0>
                __putc(a1);
    80003d00:	0ff9f513          	andi	a0,s3,255
    80003d04:	00003097          	auipc	ra,0x3
    80003d08:	898080e7          	jalr	-1896(ra) # 8000659c <__putc>
    uint64 returnVal = 0;
    80003d0c:	00000513          	li	a0,0
                break;
    80003d10:	eb9ff06f          	j	80003bc8 <exceptionHandler+0xc0>
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80003d14:	00000513          	li	a0,0
    80003d18:	eb1ff06f          	j	80003bc8 <exceptionHandler+0xc0>
        __putc('\n');
    80003d1c:	00a00513          	li	a0,10
    80003d20:	00003097          	auipc	ra,0x3
    80003d24:	87c080e7          	jalr	-1924(ra) # 8000659c <__putc>
        __putc('E');
    80003d28:	04500513          	li	a0,69
    80003d2c:	00003097          	auipc	ra,0x3
    80003d30:	870080e7          	jalr	-1936(ra) # 8000659c <__putc>
        __putc('r');
    80003d34:	07200513          	li	a0,114
    80003d38:	00003097          	auipc	ra,0x3
    80003d3c:	864080e7          	jalr	-1948(ra) # 8000659c <__putc>
        __putc('r');
    80003d40:	07200513          	li	a0,114
    80003d44:	00003097          	auipc	ra,0x3
    80003d48:	858080e7          	jalr	-1960(ra) # 8000659c <__putc>
        __putc('o');
    80003d4c:	06f00513          	li	a0,111
    80003d50:	00003097          	auipc	ra,0x3
    80003d54:	84c080e7          	jalr	-1972(ra) # 8000659c <__putc>
        __putc('r');
    80003d58:	07200513          	li	a0,114
    80003d5c:	00003097          	auipc	ra,0x3
    80003d60:	840080e7          	jalr	-1984(ra) # 8000659c <__putc>
        __putc(':');
    80003d64:	03a00513          	li	a0,58
    80003d68:	00003097          	auipc	ra,0x3
    80003d6c:	834080e7          	jalr	-1996(ra) # 8000659c <__putc>
        __putc(' ');
    80003d70:	02000513          	li	a0,32
    80003d74:	00003097          	auipc	ra,0x3
    80003d78:	828080e7          	jalr	-2008(ra) # 8000659c <__putc>
        __putc('i');
    80003d7c:	06900513          	li	a0,105
    80003d80:	00003097          	auipc	ra,0x3
    80003d84:	81c080e7          	jalr	-2020(ra) # 8000659c <__putc>
        __putc('l');
    80003d88:	06c00513          	li	a0,108
    80003d8c:	00003097          	auipc	ra,0x3
    80003d90:	810080e7          	jalr	-2032(ra) # 8000659c <__putc>
        __putc('l');
    80003d94:	06c00513          	li	a0,108
    80003d98:	00003097          	auipc	ra,0x3
    80003d9c:	804080e7          	jalr	-2044(ra) # 8000659c <__putc>
        __putc('e');
    80003da0:	06500513          	li	a0,101
    80003da4:	00002097          	auipc	ra,0x2
    80003da8:	7f8080e7          	jalr	2040(ra) # 8000659c <__putc>
        __putc('g');
    80003dac:	06700513          	li	a0,103
    80003db0:	00002097          	auipc	ra,0x2
    80003db4:	7ec080e7          	jalr	2028(ra) # 8000659c <__putc>
        __putc('a');
    80003db8:	06100513          	li	a0,97
    80003dbc:	00002097          	auipc	ra,0x2
    80003dc0:	7e0080e7          	jalr	2016(ra) # 8000659c <__putc>
        __putc('l');
    80003dc4:	06c00513          	li	a0,108
    80003dc8:	00002097          	auipc	ra,0x2
    80003dcc:	7d4080e7          	jalr	2004(ra) # 8000659c <__putc>
        __putc(' ');
    80003dd0:	02000513          	li	a0,32
    80003dd4:	00002097          	auipc	ra,0x2
    80003dd8:	7c8080e7          	jalr	1992(ra) # 8000659c <__putc>
        __putc('r');
    80003ddc:	07200513          	li	a0,114
    80003de0:	00002097          	auipc	ra,0x2
    80003de4:	7bc080e7          	jalr	1980(ra) # 8000659c <__putc>
        __putc('e');
    80003de8:	06500513          	li	a0,101
    80003dec:	00002097          	auipc	ra,0x2
    80003df0:	7b0080e7          	jalr	1968(ra) # 8000659c <__putc>
        __putc('a');
    80003df4:	06100513          	li	a0,97
    80003df8:	00002097          	auipc	ra,0x2
    80003dfc:	7a4080e7          	jalr	1956(ra) # 8000659c <__putc>
        __putc('d');
    80003e00:	06400513          	li	a0,100
    80003e04:	00002097          	auipc	ra,0x2
    80003e08:	798080e7          	jalr	1944(ra) # 8000659c <__putc>
        __putc('!');
    80003e0c:	02100513          	li	a0,33
    80003e10:	00002097          	auipc	ra,0x2
    80003e14:	78c080e7          	jalr	1932(ra) # 8000659c <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80003e18:	14102973          	csrr	s2,sepc
        __putc('\n');
    80003e1c:	00a00513          	li	a0,10
    80003e20:	00002097          	auipc	ra,0x2
    80003e24:	77c080e7          	jalr	1916(ra) # 8000659c <__putc>
        __putc('P');
    80003e28:	05000513          	li	a0,80
    80003e2c:	00002097          	auipc	ra,0x2
    80003e30:	770080e7          	jalr	1904(ra) # 8000659c <__putc>
        __putc('C');
    80003e34:	04300513          	li	a0,67
    80003e38:	00002097          	auipc	ra,0x2
    80003e3c:	764080e7          	jalr	1892(ra) # 8000659c <__putc>
        __putc(':');
    80003e40:	03a00513          	li	a0,58
    80003e44:	00002097          	auipc	ra,0x2
    80003e48:	758080e7          	jalr	1880(ra) # 8000659c <__putc>
        __putc(' ');
    80003e4c:	02000513          	li	a0,32
    80003e50:	00002097          	auipc	ra,0x2
    80003e54:	74c080e7          	jalr	1868(ra) # 8000659c <__putc>
        __putc('0');
    80003e58:	03000513          	li	a0,48
    80003e5c:	00002097          	auipc	ra,0x2
    80003e60:	740080e7          	jalr	1856(ra) # 8000659c <__putc>
        __putc('x');
    80003e64:	07800513          	li	a0,120
    80003e68:	00002097          	auipc	ra,0x2
    80003e6c:	734080e7          	jalr	1844(ra) # 8000659c <__putc>
        for(int i = 15; i >= 0; i--){
    80003e70:	00f00493          	li	s1,15
    80003e74:	0140006f          	j	80003e88 <exceptionHandler+0x380>
                __putc('A' + tmp - 10);
    80003e78:	03750513          	addi	a0,a0,55
    80003e7c:	00002097          	auipc	ra,0x2
    80003e80:	720080e7          	jalr	1824(ra) # 8000659c <__putc>
        for(int i = 15; i >= 0; i--){
    80003e84:	fff4849b          	addiw	s1,s1,-1
    80003e88:	0204c463          	bltz	s1,80003eb0 <exceptionHandler+0x3a8>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    80003e8c:	0024951b          	slliw	a0,s1,0x2
    80003e90:	00a95533          	srl	a0,s2,a0
    80003e94:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80003e98:	00900793          	li	a5,9
    80003e9c:	fca7eee3          	bltu	a5,a0,80003e78 <exceptionHandler+0x370>
                __putc('0' + tmp);
    80003ea0:	03050513          	addi	a0,a0,48
    80003ea4:	00002097          	auipc	ra,0x2
    80003ea8:	6f8080e7          	jalr	1784(ra) # 8000659c <__putc>
    80003eac:	fd9ff06f          	j	80003e84 <exceptionHandler+0x37c>
        assert(false);
    80003eb0:	00003697          	auipc	a3,0x3
    80003eb4:	3a068693          	addi	a3,a3,928 # 80007250 <CONSOLE_STATUS+0x240>
    80003eb8:	08500613          	li	a2,133
    80003ebc:	00003597          	auipc	a1,0x3
    80003ec0:	3ac58593          	addi	a1,a1,940 # 80007268 <CONSOLE_STATUS+0x258>
    80003ec4:	00003517          	auipc	a0,0x3
    80003ec8:	3c450513          	addi	a0,a0,964 # 80007288 <CONSOLE_STATUS+0x278>
    80003ecc:	ffffe097          	auipc	ra,0xffffe
    80003ed0:	a58080e7          	jalr	-1448(ra) # 80001924 <_Z13assert_failedPKcS0_jS0_>
    80003ed4:	d09ff06f          	j	80003bdc <exceptionHandler+0xd4>
        __putc('\n');
    80003ed8:	00a00513          	li	a0,10
    80003edc:	00002097          	auipc	ra,0x2
    80003ee0:	6c0080e7          	jalr	1728(ra) # 8000659c <__putc>
        __putc('E');
    80003ee4:	04500513          	li	a0,69
    80003ee8:	00002097          	auipc	ra,0x2
    80003eec:	6b4080e7          	jalr	1716(ra) # 8000659c <__putc>
        __putc('r');
    80003ef0:	07200513          	li	a0,114
    80003ef4:	00002097          	auipc	ra,0x2
    80003ef8:	6a8080e7          	jalr	1704(ra) # 8000659c <__putc>
        __putc('r');
    80003efc:	07200513          	li	a0,114
    80003f00:	00002097          	auipc	ra,0x2
    80003f04:	69c080e7          	jalr	1692(ra) # 8000659c <__putc>
        __putc('o');
    80003f08:	06f00513          	li	a0,111
    80003f0c:	00002097          	auipc	ra,0x2
    80003f10:	690080e7          	jalr	1680(ra) # 8000659c <__putc>
        __putc('r');
    80003f14:	07200513          	li	a0,114
    80003f18:	00002097          	auipc	ra,0x2
    80003f1c:	684080e7          	jalr	1668(ra) # 8000659c <__putc>
        __putc(':');
    80003f20:	03a00513          	li	a0,58
    80003f24:	00002097          	auipc	ra,0x2
    80003f28:	678080e7          	jalr	1656(ra) # 8000659c <__putc>
        __putc(' ');
    80003f2c:	02000513          	li	a0,32
    80003f30:	00002097          	auipc	ra,0x2
    80003f34:	66c080e7          	jalr	1644(ra) # 8000659c <__putc>
        __putc('i');
    80003f38:	06900513          	li	a0,105
    80003f3c:	00002097          	auipc	ra,0x2
    80003f40:	660080e7          	jalr	1632(ra) # 8000659c <__putc>
        __putc('l');
    80003f44:	06c00513          	li	a0,108
    80003f48:	00002097          	auipc	ra,0x2
    80003f4c:	654080e7          	jalr	1620(ra) # 8000659c <__putc>
        __putc('l');
    80003f50:	06c00513          	li	a0,108
    80003f54:	00002097          	auipc	ra,0x2
    80003f58:	648080e7          	jalr	1608(ra) # 8000659c <__putc>
        __putc('e');
    80003f5c:	06500513          	li	a0,101
    80003f60:	00002097          	auipc	ra,0x2
    80003f64:	63c080e7          	jalr	1596(ra) # 8000659c <__putc>
        __putc('g');
    80003f68:	06700513          	li	a0,103
    80003f6c:	00002097          	auipc	ra,0x2
    80003f70:	630080e7          	jalr	1584(ra) # 8000659c <__putc>
        __putc('a');
    80003f74:	06100513          	li	a0,97
    80003f78:	00002097          	auipc	ra,0x2
    80003f7c:	624080e7          	jalr	1572(ra) # 8000659c <__putc>
        __putc('l');
    80003f80:	06c00513          	li	a0,108
    80003f84:	00002097          	auipc	ra,0x2
    80003f88:	618080e7          	jalr	1560(ra) # 8000659c <__putc>
        __putc(' ');
    80003f8c:	02000513          	li	a0,32
    80003f90:	00002097          	auipc	ra,0x2
    80003f94:	60c080e7          	jalr	1548(ra) # 8000659c <__putc>
        __putc('w');
    80003f98:	07700513          	li	a0,119
    80003f9c:	00002097          	auipc	ra,0x2
    80003fa0:	600080e7          	jalr	1536(ra) # 8000659c <__putc>
        __putc('r');
    80003fa4:	07200513          	li	a0,114
    80003fa8:	00002097          	auipc	ra,0x2
    80003fac:	5f4080e7          	jalr	1524(ra) # 8000659c <__putc>
        __putc('i');
    80003fb0:	06900513          	li	a0,105
    80003fb4:	00002097          	auipc	ra,0x2
    80003fb8:	5e8080e7          	jalr	1512(ra) # 8000659c <__putc>
        __putc('t');
    80003fbc:	07400513          	li	a0,116
    80003fc0:	00002097          	auipc	ra,0x2
    80003fc4:	5dc080e7          	jalr	1500(ra) # 8000659c <__putc>
        __putc('e');
    80003fc8:	06500513          	li	a0,101
    80003fcc:	00002097          	auipc	ra,0x2
    80003fd0:	5d0080e7          	jalr	1488(ra) # 8000659c <__putc>
        __putc('!');
    80003fd4:	02100513          	li	a0,33
    80003fd8:	00002097          	auipc	ra,0x2
    80003fdc:	5c4080e7          	jalr	1476(ra) # 8000659c <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80003fe0:	14102973          	csrr	s2,sepc
        __putc('\n');
    80003fe4:	00a00513          	li	a0,10
    80003fe8:	00002097          	auipc	ra,0x2
    80003fec:	5b4080e7          	jalr	1460(ra) # 8000659c <__putc>
        __putc('P');
    80003ff0:	05000513          	li	a0,80
    80003ff4:	00002097          	auipc	ra,0x2
    80003ff8:	5a8080e7          	jalr	1448(ra) # 8000659c <__putc>
        __putc('C');
    80003ffc:	04300513          	li	a0,67
    80004000:	00002097          	auipc	ra,0x2
    80004004:	59c080e7          	jalr	1436(ra) # 8000659c <__putc>
        __putc(':');
    80004008:	03a00513          	li	a0,58
    8000400c:	00002097          	auipc	ra,0x2
    80004010:	590080e7          	jalr	1424(ra) # 8000659c <__putc>
        __putc(' ');
    80004014:	02000513          	li	a0,32
    80004018:	00002097          	auipc	ra,0x2
    8000401c:	584080e7          	jalr	1412(ra) # 8000659c <__putc>
        __putc('0');
    80004020:	03000513          	li	a0,48
    80004024:	00002097          	auipc	ra,0x2
    80004028:	578080e7          	jalr	1400(ra) # 8000659c <__putc>
        __putc('x');
    8000402c:	07800513          	li	a0,120
    80004030:	00002097          	auipc	ra,0x2
    80004034:	56c080e7          	jalr	1388(ra) # 8000659c <__putc>
        for(int i = 15; i >= 0; i--){
    80004038:	00f00493          	li	s1,15
    8000403c:	0140006f          	j	80004050 <exceptionHandler+0x548>
                __putc('A' + tmp - 10);
    80004040:	03750513          	addi	a0,a0,55
    80004044:	00002097          	auipc	ra,0x2
    80004048:	558080e7          	jalr	1368(ra) # 8000659c <__putc>
        for(int i = 15; i >= 0; i--){
    8000404c:	fff4849b          	addiw	s1,s1,-1
    80004050:	0204c463          	bltz	s1,80004078 <exceptionHandler+0x570>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    80004054:	0024951b          	slliw	a0,s1,0x2
    80004058:	00a95533          	srl	a0,s2,a0
    8000405c:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004060:	00900793          	li	a5,9
    80004064:	fca7eee3          	bltu	a5,a0,80004040 <exceptionHandler+0x538>
                __putc('0' + tmp);
    80004068:	03050513          	addi	a0,a0,48
    8000406c:	00002097          	auipc	ra,0x2
    80004070:	530080e7          	jalr	1328(ra) # 8000659c <__putc>
    80004074:	fd9ff06f          	j	8000404c <exceptionHandler+0x544>
        assert(false);
    80004078:	00003697          	auipc	a3,0x3
    8000407c:	1d868693          	addi	a3,a3,472 # 80007250 <CONSOLE_STATUS+0x240>
    80004080:	0af00613          	li	a2,175
    80004084:	00003597          	auipc	a1,0x3
    80004088:	1e458593          	addi	a1,a1,484 # 80007268 <CONSOLE_STATUS+0x258>
    8000408c:	00003517          	auipc	a0,0x3
    80004090:	1fc50513          	addi	a0,a0,508 # 80007288 <CONSOLE_STATUS+0x278>
    80004094:	ffffe097          	auipc	ra,0xffffe
    80004098:	890080e7          	jalr	-1904(ra) # 80001924 <_Z13assert_failedPKcS0_jS0_>
    8000409c:	b41ff06f          	j	80003bdc <exceptionHandler+0xd4>
        __putc('.');
    800040a0:	02e00513          	li	a0,46
    800040a4:	00002097          	auipc	ra,0x2
    800040a8:	4f8080e7          	jalr	1272(ra) # 8000659c <__putc>
        Timer::getInstance().tick();
    800040ac:	ffffd097          	auipc	ra,0xffffd
    800040b0:	10c080e7          	jalr	268(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    800040b4:	ffffd097          	auipc	ra,0xffffd
    800040b8:	168080e7          	jalr	360(ra) # 8000121c <_ZN5Timer4tickEv>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    800040bc:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800040c0:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, 0x2");
    800040c4:	14417073          	csrci	sip,2
    800040c8:	b15ff06f          	j	80003bdc <exceptionHandler+0xd4>

00000000800040cc <_ZN9SchedulerC1Ev>:
#include "console.h"
#include "thread.h"

Scheduler* Scheduler::singleton = 0;

Scheduler::Scheduler(){
    800040cc:	fe010113          	addi	sp,sp,-32
    800040d0:	00113c23          	sd	ra,24(sp)
    800040d4:	00813823          	sd	s0,16(sp)
    800040d8:	00913423          	sd	s1,8(sp)
    800040dc:	02010413          	addi	s0,sp,32
    800040e0:	00050493          	mv	s1,a0
    assert(singleton == 0);
    800040e4:	00004797          	auipc	a5,0x4
    800040e8:	ffc7b783          	ld	a5,-4(a5) # 800080e0 <_ZN9Scheduler9singletonE>
    800040ec:	02079463          	bnez	a5,80004114 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    800040f0:	00004797          	auipc	a5,0x4
    800040f4:	fe97b823          	sd	s1,-16(a5) # 800080e0 <_ZN9Scheduler9singletonE>
    head = 0;
    800040f8:	0004b023          	sd	zero,0(s1)
    tail = 0;
    800040fc:	0004b423          	sd	zero,8(s1)
}
    80004100:	01813083          	ld	ra,24(sp)
    80004104:	01013403          	ld	s0,16(sp)
    80004108:	00813483          	ld	s1,8(sp)
    8000410c:	02010113          	addi	sp,sp,32
    80004110:	00008067          	ret
    assert(singleton == 0);
    80004114:	00003697          	auipc	a3,0x3
    80004118:	28c68693          	addi	a3,a3,652 # 800073a0 <CONSOLE_STATUS+0x390>
    8000411c:	01500613          	li	a2,21
    80004120:	00003597          	auipc	a1,0x3
    80004124:	29858593          	addi	a1,a1,664 # 800073b8 <CONSOLE_STATUS+0x3a8>
    80004128:	00003517          	auipc	a0,0x3
    8000412c:	2a050513          	addi	a0,a0,672 # 800073c8 <CONSOLE_STATUS+0x3b8>
    80004130:	ffffd097          	auipc	ra,0xffffd
    80004134:	7f4080e7          	jalr	2036(ra) # 80001924 <_Z13assert_failedPKcS0_jS0_>
    80004138:	fb9ff06f          	j	800040f0 <_ZN9SchedulerC1Ev+0x24>

000000008000413c <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    8000413c:	ff010113          	addi	sp,sp,-16
    80004140:	00813423          	sd	s0,8(sp)
    80004144:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80004148:	00004797          	auipc	a5,0x4
    8000414c:	f987b783          	ld	a5,-104(a5) # 800080e0 <_ZN9Scheduler9singletonE>
    80004150:	0007b503          	ld	a0,0(a5)
}
    80004154:	00153513          	seqz	a0,a0
    80004158:	00813403          	ld	s0,8(sp)
    8000415c:	01010113          	addi	sp,sp,16
    80004160:	00008067          	ret

0000000080004164 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80004164:	fe010113          	addi	sp,sp,-32
    80004168:	00113c23          	sd	ra,24(sp)
    8000416c:	00813823          	sd	s0,16(sp)
    80004170:	00913423          	sd	s1,8(sp)
    80004174:	01213023          	sd	s2,0(sp)
    80004178:	02010413          	addi	s0,sp,32
    8000417c:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80004180:	00004917          	auipc	s2,0x4
    80004184:	f6093903          	ld	s2,-160(s2) # 800080e0 <_ZN9Scheduler9singletonE>
    80004188:	00093783          	ld	a5,0(s2)
    8000418c:	12078c63          	beqz	a5,800042c4 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80004190:	00893903          	ld	s2,8(s2)
    80004194:	01000513          	li	a0,16
    80004198:	ffffd097          	auipc	ra,0xffffd
    8000419c:	280080e7          	jalr	640(ra) # 80001418 <_Z9mem_allocm>
    800041a0:	00a90423          	sb	a0,8(s2)
    800041a4:	00855793          	srli	a5,a0,0x8
    800041a8:	00f904a3          	sb	a5,9(s2)
    800041ac:	01055793          	srli	a5,a0,0x10
    800041b0:	00f90523          	sb	a5,10(s2)
    800041b4:	0185579b          	srliw	a5,a0,0x18
    800041b8:	00f905a3          	sb	a5,11(s2)
    800041bc:	02055793          	srli	a5,a0,0x20
    800041c0:	00f90623          	sb	a5,12(s2)
    800041c4:	02855793          	srli	a5,a0,0x28
    800041c8:	00f906a3          	sb	a5,13(s2)
    800041cc:	03055793          	srli	a5,a0,0x30
    800041d0:	00f90723          	sb	a5,14(s2)
    800041d4:	03855513          	srli	a0,a0,0x38
    800041d8:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    800041dc:	00004617          	auipc	a2,0x4
    800041e0:	f0460613          	addi	a2,a2,-252 # 800080e0 <_ZN9Scheduler9singletonE>
    800041e4:	00063583          	ld	a1,0(a2)
    800041e8:	0085b703          	ld	a4,8(a1)
    800041ec:	00874783          	lbu	a5,8(a4)
    800041f0:	00974683          	lbu	a3,9(a4)
    800041f4:	00869693          	slli	a3,a3,0x8
    800041f8:	00f6e6b3          	or	a3,a3,a5
    800041fc:	00a74783          	lbu	a5,10(a4)
    80004200:	01079793          	slli	a5,a5,0x10
    80004204:	00d7e6b3          	or	a3,a5,a3
    80004208:	00b74783          	lbu	a5,11(a4)
    8000420c:	01879793          	slli	a5,a5,0x18
    80004210:	00d7e7b3          	or	a5,a5,a3
    80004214:	00c74683          	lbu	a3,12(a4)
    80004218:	02069693          	slli	a3,a3,0x20
    8000421c:	00f6e7b3          	or	a5,a3,a5
    80004220:	00d74683          	lbu	a3,13(a4)
    80004224:	02869693          	slli	a3,a3,0x28
    80004228:	00f6e6b3          	or	a3,a3,a5
    8000422c:	00e74783          	lbu	a5,14(a4)
    80004230:	03079793          	slli	a5,a5,0x30
    80004234:	00d7e6b3          	or	a3,a5,a3
    80004238:	00f74783          	lbu	a5,15(a4)
    8000423c:	03879793          	slli	a5,a5,0x38
    80004240:	00d7e7b3          	or	a5,a5,a3
    80004244:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80004248:	00978023          	sb	s1,0(a5)
    8000424c:	0084d713          	srli	a4,s1,0x8
    80004250:	00e780a3          	sb	a4,1(a5)
    80004254:	0104d713          	srli	a4,s1,0x10
    80004258:	00e78123          	sb	a4,2(a5)
    8000425c:	0184d71b          	srliw	a4,s1,0x18
    80004260:	00e781a3          	sb	a4,3(a5)
    80004264:	0204d713          	srli	a4,s1,0x20
    80004268:	00e78223          	sb	a4,4(a5)
    8000426c:	0284d713          	srli	a4,s1,0x28
    80004270:	00e782a3          	sb	a4,5(a5)
    80004274:	0304d713          	srli	a4,s1,0x30
    80004278:	00e78323          	sb	a4,6(a5)
    8000427c:	0384d493          	srli	s1,s1,0x38
    80004280:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80004284:	00063783          	ld	a5,0(a2)
    80004288:	0087b783          	ld	a5,8(a5)
    8000428c:	00078423          	sb	zero,8(a5)
    80004290:	000784a3          	sb	zero,9(a5)
    80004294:	00078523          	sb	zero,10(a5)
    80004298:	000785a3          	sb	zero,11(a5)
    8000429c:	00078623          	sb	zero,12(a5)
    800042a0:	000786a3          	sb	zero,13(a5)
    800042a4:	00078723          	sb	zero,14(a5)
    800042a8:	000787a3          	sb	zero,15(a5)
    }
}
    800042ac:	01813083          	ld	ra,24(sp)
    800042b0:	01013403          	ld	s0,16(sp)
    800042b4:	00813483          	ld	s1,8(sp)
    800042b8:	00013903          	ld	s2,0(sp)
    800042bc:	02010113          	addi	sp,sp,32
    800042c0:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    800042c4:	01000513          	li	a0,16
    800042c8:	ffffd097          	auipc	ra,0xffffd
    800042cc:	150080e7          	jalr	336(ra) # 80001418 <_Z9mem_allocm>
    800042d0:	00a93423          	sd	a0,8(s2)
    800042d4:	00004717          	auipc	a4,0x4
    800042d8:	e0c70713          	addi	a4,a4,-500 # 800080e0 <_ZN9Scheduler9singletonE>
    800042dc:	00073783          	ld	a5,0(a4)
    800042e0:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    800042e4:	00073783          	ld	a5,0(a4)
    800042e8:	0007b783          	ld	a5,0(a5)
    800042ec:	00978023          	sb	s1,0(a5)
    800042f0:	0084d693          	srli	a3,s1,0x8
    800042f4:	00d780a3          	sb	a3,1(a5)
    800042f8:	0104d693          	srli	a3,s1,0x10
    800042fc:	00d78123          	sb	a3,2(a5)
    80004300:	0184d69b          	srliw	a3,s1,0x18
    80004304:	00d781a3          	sb	a3,3(a5)
    80004308:	0204d693          	srli	a3,s1,0x20
    8000430c:	00d78223          	sb	a3,4(a5)
    80004310:	0284d693          	srli	a3,s1,0x28
    80004314:	00d782a3          	sb	a3,5(a5)
    80004318:	0304d693          	srli	a3,s1,0x30
    8000431c:	00d78323          	sb	a3,6(a5)
    80004320:	0384d493          	srli	s1,s1,0x38
    80004324:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80004328:	00073783          	ld	a5,0(a4)
    8000432c:	0007b783          	ld	a5,0(a5)
    80004330:	00078423          	sb	zero,8(a5)
    80004334:	000784a3          	sb	zero,9(a5)
    80004338:	00078523          	sb	zero,10(a5)
    8000433c:	000785a3          	sb	zero,11(a5)
    80004340:	00078623          	sb	zero,12(a5)
    80004344:	000786a3          	sb	zero,13(a5)
    80004348:	00078723          	sb	zero,14(a5)
    8000434c:	000787a3          	sb	zero,15(a5)
    80004350:	f5dff06f          	j	800042ac <_ZN9Scheduler3putEP7_thread+0x148>

0000000080004354 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80004354:	ff010113          	addi	sp,sp,-16
    80004358:	00813423          	sd	s0,8(sp)
    8000435c:	01010413          	addi	s0,sp,16
    ThreadList* tmp = singleton->head;
    80004360:	00004617          	auipc	a2,0x4
    80004364:	d8063603          	ld	a2,-640(a2) # 800080e0 <_ZN9Scheduler9singletonE>
    80004368:	00063783          	ld	a5,0(a2)
    if(tmp == 0){
    8000436c:	0c078e63          	beqz	a5,80004448 <_ZN9Scheduler3getEv+0xf4>
        return 0;
    }
    thread_t thread = tmp->thread;
    80004370:	0007c503          	lbu	a0,0(a5)
    80004374:	0017c703          	lbu	a4,1(a5)
    80004378:	00871713          	slli	a4,a4,0x8
    8000437c:	00a76733          	or	a4,a4,a0
    80004380:	0027c503          	lbu	a0,2(a5)
    80004384:	01051513          	slli	a0,a0,0x10
    80004388:	00e56733          	or	a4,a0,a4
    8000438c:	0037c503          	lbu	a0,3(a5)
    80004390:	01851513          	slli	a0,a0,0x18
    80004394:	00e56533          	or	a0,a0,a4
    80004398:	0047c703          	lbu	a4,4(a5)
    8000439c:	02071713          	slli	a4,a4,0x20
    800043a0:	00a76533          	or	a0,a4,a0
    800043a4:	0057c703          	lbu	a4,5(a5)
    800043a8:	02871713          	slli	a4,a4,0x28
    800043ac:	00a76733          	or	a4,a4,a0
    800043b0:	0067c503          	lbu	a0,6(a5)
    800043b4:	03051513          	slli	a0,a0,0x30
    800043b8:	00e56733          	or	a4,a0,a4
    800043bc:	0077c503          	lbu	a0,7(a5)
    800043c0:	03851513          	slli	a0,a0,0x38
    800043c4:	00e56533          	or	a0,a0,a4
    singleton->head = tmp->next;
    800043c8:	0087c683          	lbu	a3,8(a5)
    800043cc:	0097c703          	lbu	a4,9(a5)
    800043d0:	00871713          	slli	a4,a4,0x8
    800043d4:	00d766b3          	or	a3,a4,a3
    800043d8:	00a7c703          	lbu	a4,10(a5)
    800043dc:	01071713          	slli	a4,a4,0x10
    800043e0:	00d76733          	or	a4,a4,a3
    800043e4:	00b7c683          	lbu	a3,11(a5)
    800043e8:	01869693          	slli	a3,a3,0x18
    800043ec:	00e6e733          	or	a4,a3,a4
    800043f0:	00c7c683          	lbu	a3,12(a5)
    800043f4:	02069693          	slli	a3,a3,0x20
    800043f8:	00e6e6b3          	or	a3,a3,a4
    800043fc:	00d7c703          	lbu	a4,13(a5)
    80004400:	02871713          	slli	a4,a4,0x28
    80004404:	00d766b3          	or	a3,a4,a3
    80004408:	00e7c703          	lbu	a4,14(a5)
    8000440c:	03071713          	slli	a4,a4,0x30
    80004410:	00d76733          	or	a4,a4,a3
    80004414:	00f7c783          	lbu	a5,15(a5)
    80004418:	03879793          	slli	a5,a5,0x38
    8000441c:	00e7e7b3          	or	a5,a5,a4
    80004420:	00f63023          	sd	a5,0(a2)
    if(singleton->head == 0){
    80004424:	00004797          	auipc	a5,0x4
    80004428:	cbc7b783          	ld	a5,-836(a5) # 800080e0 <_ZN9Scheduler9singletonE>
    8000442c:	0007b703          	ld	a4,0(a5)
    80004430:	00070863          	beqz	a4,80004440 <_ZN9Scheduler3getEv+0xec>
        singleton->tail = 0;
    }
    // mem_free(tmp);
    return thread;
}
    80004434:	00813403          	ld	s0,8(sp)
    80004438:	01010113          	addi	sp,sp,16
    8000443c:	00008067          	ret
        singleton->tail = 0;
    80004440:	0007b423          	sd	zero,8(a5)
    80004444:	ff1ff06f          	j	80004434 <_ZN9Scheduler3getEv+0xe0>
        return 0;
    80004448:	00078513          	mv	a0,a5
    8000444c:	fe9ff06f          	j	80004434 <_ZN9Scheduler3getEv+0xe0>

0000000080004450 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80004450:	ff010113          	addi	sp,sp,-16
    80004454:	00813423          	sd	s0,8(sp)
    80004458:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    8000445c:	00004797          	auipc	a5,0x4
    80004460:	c847b783          	ld	a5,-892(a5) # 800080e0 <_ZN9Scheduler9singletonE>
    80004464:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80004468:	00000513          	li	a0,0
    while(tmp != 0){
    8000446c:	06078263          	beqz	a5,800044d0 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80004470:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80004474:	0087c683          	lbu	a3,8(a5)
    80004478:	0097c703          	lbu	a4,9(a5)
    8000447c:	00871713          	slli	a4,a4,0x8
    80004480:	00d766b3          	or	a3,a4,a3
    80004484:	00a7c703          	lbu	a4,10(a5)
    80004488:	01071713          	slli	a4,a4,0x10
    8000448c:	00d76733          	or	a4,a4,a3
    80004490:	00b7c683          	lbu	a3,11(a5)
    80004494:	01869693          	slli	a3,a3,0x18
    80004498:	00e6e733          	or	a4,a3,a4
    8000449c:	00c7c683          	lbu	a3,12(a5)
    800044a0:	02069693          	slli	a3,a3,0x20
    800044a4:	00e6e6b3          	or	a3,a3,a4
    800044a8:	00d7c703          	lbu	a4,13(a5)
    800044ac:	02871713          	slli	a4,a4,0x28
    800044b0:	00d766b3          	or	a3,a4,a3
    800044b4:	00e7c703          	lbu	a4,14(a5)
    800044b8:	03071713          	slli	a4,a4,0x30
    800044bc:	00d76733          	or	a4,a4,a3
    800044c0:	00f7c783          	lbu	a5,15(a5)
    800044c4:	03879793          	slli	a5,a5,0x38
    800044c8:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    800044cc:	fa1ff06f          	j	8000446c <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    800044d0:	00813403          	ld	s0,8(sp)
    800044d4:	01010113          	addi	sp,sp,16
    800044d8:	00008067          	ret

00000000800044dc <start>:
    800044dc:	ff010113          	addi	sp,sp,-16
    800044e0:	00813423          	sd	s0,8(sp)
    800044e4:	01010413          	addi	s0,sp,16
    800044e8:	300027f3          	csrr	a5,mstatus
    800044ec:	ffffe737          	lui	a4,0xffffe
    800044f0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff54af>
    800044f4:	00e7f7b3          	and	a5,a5,a4
    800044f8:	00001737          	lui	a4,0x1
    800044fc:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004500:	00e7e7b3          	or	a5,a5,a4
    80004504:	30079073          	csrw	mstatus,a5
    80004508:	00000797          	auipc	a5,0x0
    8000450c:	16078793          	addi	a5,a5,352 # 80004668 <system_main>
    80004510:	34179073          	csrw	mepc,a5
    80004514:	00000793          	li	a5,0
    80004518:	18079073          	csrw	satp,a5
    8000451c:	000107b7          	lui	a5,0x10
    80004520:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80004524:	30279073          	csrw	medeleg,a5
    80004528:	30379073          	csrw	mideleg,a5
    8000452c:	104027f3          	csrr	a5,sie
    80004530:	2227e793          	ori	a5,a5,546
    80004534:	10479073          	csrw	sie,a5
    80004538:	fff00793          	li	a5,-1
    8000453c:	00a7d793          	srli	a5,a5,0xa
    80004540:	3b079073          	csrw	pmpaddr0,a5
    80004544:	00f00793          	li	a5,15
    80004548:	3a079073          	csrw	pmpcfg0,a5
    8000454c:	f14027f3          	csrr	a5,mhartid
    80004550:	0200c737          	lui	a4,0x200c
    80004554:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004558:	0007869b          	sext.w	a3,a5
    8000455c:	00269713          	slli	a4,a3,0x2
    80004560:	000f4637          	lui	a2,0xf4
    80004564:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004568:	00d70733          	add	a4,a4,a3
    8000456c:	0037979b          	slliw	a5,a5,0x3
    80004570:	020046b7          	lui	a3,0x2004
    80004574:	00d787b3          	add	a5,a5,a3
    80004578:	00c585b3          	add	a1,a1,a2
    8000457c:	00371693          	slli	a3,a4,0x3
    80004580:	00004717          	auipc	a4,0x4
    80004584:	b7070713          	addi	a4,a4,-1168 # 800080f0 <timer_scratch>
    80004588:	00b7b023          	sd	a1,0(a5)
    8000458c:	00d70733          	add	a4,a4,a3
    80004590:	00f73c23          	sd	a5,24(a4)
    80004594:	02c73023          	sd	a2,32(a4)
    80004598:	34071073          	csrw	mscratch,a4
    8000459c:	00000797          	auipc	a5,0x0
    800045a0:	6e478793          	addi	a5,a5,1764 # 80004c80 <timervec>
    800045a4:	30579073          	csrw	mtvec,a5
    800045a8:	300027f3          	csrr	a5,mstatus
    800045ac:	0087e793          	ori	a5,a5,8
    800045b0:	30079073          	csrw	mstatus,a5
    800045b4:	304027f3          	csrr	a5,mie
    800045b8:	0807e793          	ori	a5,a5,128
    800045bc:	30479073          	csrw	mie,a5
    800045c0:	f14027f3          	csrr	a5,mhartid
    800045c4:	0007879b          	sext.w	a5,a5
    800045c8:	00078213          	mv	tp,a5
    800045cc:	30200073          	mret
    800045d0:	00813403          	ld	s0,8(sp)
    800045d4:	01010113          	addi	sp,sp,16
    800045d8:	00008067          	ret

00000000800045dc <timerinit>:
    800045dc:	ff010113          	addi	sp,sp,-16
    800045e0:	00813423          	sd	s0,8(sp)
    800045e4:	01010413          	addi	s0,sp,16
    800045e8:	f14027f3          	csrr	a5,mhartid
    800045ec:	0200c737          	lui	a4,0x200c
    800045f0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800045f4:	0007869b          	sext.w	a3,a5
    800045f8:	00269713          	slli	a4,a3,0x2
    800045fc:	000f4637          	lui	a2,0xf4
    80004600:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004604:	00d70733          	add	a4,a4,a3
    80004608:	0037979b          	slliw	a5,a5,0x3
    8000460c:	020046b7          	lui	a3,0x2004
    80004610:	00d787b3          	add	a5,a5,a3
    80004614:	00c585b3          	add	a1,a1,a2
    80004618:	00371693          	slli	a3,a4,0x3
    8000461c:	00004717          	auipc	a4,0x4
    80004620:	ad470713          	addi	a4,a4,-1324 # 800080f0 <timer_scratch>
    80004624:	00b7b023          	sd	a1,0(a5)
    80004628:	00d70733          	add	a4,a4,a3
    8000462c:	00f73c23          	sd	a5,24(a4)
    80004630:	02c73023          	sd	a2,32(a4)
    80004634:	34071073          	csrw	mscratch,a4
    80004638:	00000797          	auipc	a5,0x0
    8000463c:	64878793          	addi	a5,a5,1608 # 80004c80 <timervec>
    80004640:	30579073          	csrw	mtvec,a5
    80004644:	300027f3          	csrr	a5,mstatus
    80004648:	0087e793          	ori	a5,a5,8
    8000464c:	30079073          	csrw	mstatus,a5
    80004650:	304027f3          	csrr	a5,mie
    80004654:	0807e793          	ori	a5,a5,128
    80004658:	30479073          	csrw	mie,a5
    8000465c:	00813403          	ld	s0,8(sp)
    80004660:	01010113          	addi	sp,sp,16
    80004664:	00008067          	ret

0000000080004668 <system_main>:
    80004668:	fe010113          	addi	sp,sp,-32
    8000466c:	00813823          	sd	s0,16(sp)
    80004670:	00913423          	sd	s1,8(sp)
    80004674:	00113c23          	sd	ra,24(sp)
    80004678:	02010413          	addi	s0,sp,32
    8000467c:	00000097          	auipc	ra,0x0
    80004680:	0c4080e7          	jalr	196(ra) # 80004740 <cpuid>
    80004684:	00004497          	auipc	s1,0x4
    80004688:	9fc48493          	addi	s1,s1,-1540 # 80008080 <started>
    8000468c:	02050263          	beqz	a0,800046b0 <system_main+0x48>
    80004690:	0004a783          	lw	a5,0(s1)
    80004694:	0007879b          	sext.w	a5,a5
    80004698:	fe078ce3          	beqz	a5,80004690 <system_main+0x28>
    8000469c:	0ff0000f          	fence
    800046a0:	00003517          	auipc	a0,0x3
    800046a4:	d6850513          	addi	a0,a0,-664 # 80007408 <CONSOLE_STATUS+0x3f8>
    800046a8:	00001097          	auipc	ra,0x1
    800046ac:	a74080e7          	jalr	-1420(ra) # 8000511c <panic>
    800046b0:	00001097          	auipc	ra,0x1
    800046b4:	9c8080e7          	jalr	-1592(ra) # 80005078 <consoleinit>
    800046b8:	00001097          	auipc	ra,0x1
    800046bc:	154080e7          	jalr	340(ra) # 8000580c <printfinit>
    800046c0:	00003517          	auipc	a0,0x3
    800046c4:	e2850513          	addi	a0,a0,-472 # 800074e8 <CONSOLE_STATUS+0x4d8>
    800046c8:	00001097          	auipc	ra,0x1
    800046cc:	ab0080e7          	jalr	-1360(ra) # 80005178 <__printf>
    800046d0:	00003517          	auipc	a0,0x3
    800046d4:	d0850513          	addi	a0,a0,-760 # 800073d8 <CONSOLE_STATUS+0x3c8>
    800046d8:	00001097          	auipc	ra,0x1
    800046dc:	aa0080e7          	jalr	-1376(ra) # 80005178 <__printf>
    800046e0:	00003517          	auipc	a0,0x3
    800046e4:	e0850513          	addi	a0,a0,-504 # 800074e8 <CONSOLE_STATUS+0x4d8>
    800046e8:	00001097          	auipc	ra,0x1
    800046ec:	a90080e7          	jalr	-1392(ra) # 80005178 <__printf>
    800046f0:	00001097          	auipc	ra,0x1
    800046f4:	4a8080e7          	jalr	1192(ra) # 80005b98 <kinit>
    800046f8:	00000097          	auipc	ra,0x0
    800046fc:	148080e7          	jalr	328(ra) # 80004840 <trapinit>
    80004700:	00000097          	auipc	ra,0x0
    80004704:	16c080e7          	jalr	364(ra) # 8000486c <trapinithart>
    80004708:	00000097          	auipc	ra,0x0
    8000470c:	5b8080e7          	jalr	1464(ra) # 80004cc0 <plicinit>
    80004710:	00000097          	auipc	ra,0x0
    80004714:	5d8080e7          	jalr	1496(ra) # 80004ce8 <plicinithart>
    80004718:	00000097          	auipc	ra,0x0
    8000471c:	078080e7          	jalr	120(ra) # 80004790 <userinit>
    80004720:	0ff0000f          	fence
    80004724:	00100793          	li	a5,1
    80004728:	00003517          	auipc	a0,0x3
    8000472c:	cc850513          	addi	a0,a0,-824 # 800073f0 <CONSOLE_STATUS+0x3e0>
    80004730:	00f4a023          	sw	a5,0(s1)
    80004734:	00001097          	auipc	ra,0x1
    80004738:	a44080e7          	jalr	-1468(ra) # 80005178 <__printf>
    8000473c:	0000006f          	j	8000473c <system_main+0xd4>

0000000080004740 <cpuid>:
    80004740:	ff010113          	addi	sp,sp,-16
    80004744:	00813423          	sd	s0,8(sp)
    80004748:	01010413          	addi	s0,sp,16
    8000474c:	00020513          	mv	a0,tp
    80004750:	00813403          	ld	s0,8(sp)
    80004754:	0005051b          	sext.w	a0,a0
    80004758:	01010113          	addi	sp,sp,16
    8000475c:	00008067          	ret

0000000080004760 <mycpu>:
    80004760:	ff010113          	addi	sp,sp,-16
    80004764:	00813423          	sd	s0,8(sp)
    80004768:	01010413          	addi	s0,sp,16
    8000476c:	00020793          	mv	a5,tp
    80004770:	00813403          	ld	s0,8(sp)
    80004774:	0007879b          	sext.w	a5,a5
    80004778:	00779793          	slli	a5,a5,0x7
    8000477c:	00005517          	auipc	a0,0x5
    80004780:	9a450513          	addi	a0,a0,-1628 # 80009120 <cpus>
    80004784:	00f50533          	add	a0,a0,a5
    80004788:	01010113          	addi	sp,sp,16
    8000478c:	00008067          	ret

0000000080004790 <userinit>:
    80004790:	ff010113          	addi	sp,sp,-16
    80004794:	00813423          	sd	s0,8(sp)
    80004798:	01010413          	addi	s0,sp,16
    8000479c:	00813403          	ld	s0,8(sp)
    800047a0:	01010113          	addi	sp,sp,16
    800047a4:	ffffd317          	auipc	t1,0xffffd
    800047a8:	0c430067          	jr	196(t1) # 80001868 <main>

00000000800047ac <either_copyout>:
    800047ac:	ff010113          	addi	sp,sp,-16
    800047b0:	00813023          	sd	s0,0(sp)
    800047b4:	00113423          	sd	ra,8(sp)
    800047b8:	01010413          	addi	s0,sp,16
    800047bc:	02051663          	bnez	a0,800047e8 <either_copyout+0x3c>
    800047c0:	00058513          	mv	a0,a1
    800047c4:	00060593          	mv	a1,a2
    800047c8:	0006861b          	sext.w	a2,a3
    800047cc:	00002097          	auipc	ra,0x2
    800047d0:	c58080e7          	jalr	-936(ra) # 80006424 <__memmove>
    800047d4:	00813083          	ld	ra,8(sp)
    800047d8:	00013403          	ld	s0,0(sp)
    800047dc:	00000513          	li	a0,0
    800047e0:	01010113          	addi	sp,sp,16
    800047e4:	00008067          	ret
    800047e8:	00003517          	auipc	a0,0x3
    800047ec:	c4850513          	addi	a0,a0,-952 # 80007430 <CONSOLE_STATUS+0x420>
    800047f0:	00001097          	auipc	ra,0x1
    800047f4:	92c080e7          	jalr	-1748(ra) # 8000511c <panic>

00000000800047f8 <either_copyin>:
    800047f8:	ff010113          	addi	sp,sp,-16
    800047fc:	00813023          	sd	s0,0(sp)
    80004800:	00113423          	sd	ra,8(sp)
    80004804:	01010413          	addi	s0,sp,16
    80004808:	02059463          	bnez	a1,80004830 <either_copyin+0x38>
    8000480c:	00060593          	mv	a1,a2
    80004810:	0006861b          	sext.w	a2,a3
    80004814:	00002097          	auipc	ra,0x2
    80004818:	c10080e7          	jalr	-1008(ra) # 80006424 <__memmove>
    8000481c:	00813083          	ld	ra,8(sp)
    80004820:	00013403          	ld	s0,0(sp)
    80004824:	00000513          	li	a0,0
    80004828:	01010113          	addi	sp,sp,16
    8000482c:	00008067          	ret
    80004830:	00003517          	auipc	a0,0x3
    80004834:	c2850513          	addi	a0,a0,-984 # 80007458 <CONSOLE_STATUS+0x448>
    80004838:	00001097          	auipc	ra,0x1
    8000483c:	8e4080e7          	jalr	-1820(ra) # 8000511c <panic>

0000000080004840 <trapinit>:
    80004840:	ff010113          	addi	sp,sp,-16
    80004844:	00813423          	sd	s0,8(sp)
    80004848:	01010413          	addi	s0,sp,16
    8000484c:	00813403          	ld	s0,8(sp)
    80004850:	00003597          	auipc	a1,0x3
    80004854:	c3058593          	addi	a1,a1,-976 # 80007480 <CONSOLE_STATUS+0x470>
    80004858:	00005517          	auipc	a0,0x5
    8000485c:	94850513          	addi	a0,a0,-1720 # 800091a0 <tickslock>
    80004860:	01010113          	addi	sp,sp,16
    80004864:	00001317          	auipc	t1,0x1
    80004868:	5c430067          	jr	1476(t1) # 80005e28 <initlock>

000000008000486c <trapinithart>:
    8000486c:	ff010113          	addi	sp,sp,-16
    80004870:	00813423          	sd	s0,8(sp)
    80004874:	01010413          	addi	s0,sp,16
    80004878:	00000797          	auipc	a5,0x0
    8000487c:	2f878793          	addi	a5,a5,760 # 80004b70 <kernelvec>
    80004880:	10579073          	csrw	stvec,a5
    80004884:	00813403          	ld	s0,8(sp)
    80004888:	01010113          	addi	sp,sp,16
    8000488c:	00008067          	ret

0000000080004890 <usertrap>:
    80004890:	ff010113          	addi	sp,sp,-16
    80004894:	00813423          	sd	s0,8(sp)
    80004898:	01010413          	addi	s0,sp,16
    8000489c:	00813403          	ld	s0,8(sp)
    800048a0:	01010113          	addi	sp,sp,16
    800048a4:	00008067          	ret

00000000800048a8 <usertrapret>:
    800048a8:	ff010113          	addi	sp,sp,-16
    800048ac:	00813423          	sd	s0,8(sp)
    800048b0:	01010413          	addi	s0,sp,16
    800048b4:	00813403          	ld	s0,8(sp)
    800048b8:	01010113          	addi	sp,sp,16
    800048bc:	00008067          	ret

00000000800048c0 <kerneltrap>:
    800048c0:	fe010113          	addi	sp,sp,-32
    800048c4:	00813823          	sd	s0,16(sp)
    800048c8:	00113c23          	sd	ra,24(sp)
    800048cc:	00913423          	sd	s1,8(sp)
    800048d0:	02010413          	addi	s0,sp,32
    800048d4:	142025f3          	csrr	a1,scause
    800048d8:	100027f3          	csrr	a5,sstatus
    800048dc:	0027f793          	andi	a5,a5,2
    800048e0:	10079c63          	bnez	a5,800049f8 <kerneltrap+0x138>
    800048e4:	142027f3          	csrr	a5,scause
    800048e8:	0207ce63          	bltz	a5,80004924 <kerneltrap+0x64>
    800048ec:	00003517          	auipc	a0,0x3
    800048f0:	bdc50513          	addi	a0,a0,-1060 # 800074c8 <CONSOLE_STATUS+0x4b8>
    800048f4:	00001097          	auipc	ra,0x1
    800048f8:	884080e7          	jalr	-1916(ra) # 80005178 <__printf>
    800048fc:	141025f3          	csrr	a1,sepc
    80004900:	14302673          	csrr	a2,stval
    80004904:	00003517          	auipc	a0,0x3
    80004908:	bd450513          	addi	a0,a0,-1068 # 800074d8 <CONSOLE_STATUS+0x4c8>
    8000490c:	00001097          	auipc	ra,0x1
    80004910:	86c080e7          	jalr	-1940(ra) # 80005178 <__printf>
    80004914:	00003517          	auipc	a0,0x3
    80004918:	bdc50513          	addi	a0,a0,-1060 # 800074f0 <CONSOLE_STATUS+0x4e0>
    8000491c:	00001097          	auipc	ra,0x1
    80004920:	800080e7          	jalr	-2048(ra) # 8000511c <panic>
    80004924:	0ff7f713          	andi	a4,a5,255
    80004928:	00900693          	li	a3,9
    8000492c:	04d70063          	beq	a4,a3,8000496c <kerneltrap+0xac>
    80004930:	fff00713          	li	a4,-1
    80004934:	03f71713          	slli	a4,a4,0x3f
    80004938:	00170713          	addi	a4,a4,1
    8000493c:	fae798e3          	bne	a5,a4,800048ec <kerneltrap+0x2c>
    80004940:	00000097          	auipc	ra,0x0
    80004944:	e00080e7          	jalr	-512(ra) # 80004740 <cpuid>
    80004948:	06050663          	beqz	a0,800049b4 <kerneltrap+0xf4>
    8000494c:	144027f3          	csrr	a5,sip
    80004950:	ffd7f793          	andi	a5,a5,-3
    80004954:	14479073          	csrw	sip,a5
    80004958:	01813083          	ld	ra,24(sp)
    8000495c:	01013403          	ld	s0,16(sp)
    80004960:	00813483          	ld	s1,8(sp)
    80004964:	02010113          	addi	sp,sp,32
    80004968:	00008067          	ret
    8000496c:	00000097          	auipc	ra,0x0
    80004970:	3c8080e7          	jalr	968(ra) # 80004d34 <plic_claim>
    80004974:	00a00793          	li	a5,10
    80004978:	00050493          	mv	s1,a0
    8000497c:	06f50863          	beq	a0,a5,800049ec <kerneltrap+0x12c>
    80004980:	fc050ce3          	beqz	a0,80004958 <kerneltrap+0x98>
    80004984:	00050593          	mv	a1,a0
    80004988:	00003517          	auipc	a0,0x3
    8000498c:	b2050513          	addi	a0,a0,-1248 # 800074a8 <CONSOLE_STATUS+0x498>
    80004990:	00000097          	auipc	ra,0x0
    80004994:	7e8080e7          	jalr	2024(ra) # 80005178 <__printf>
    80004998:	01013403          	ld	s0,16(sp)
    8000499c:	01813083          	ld	ra,24(sp)
    800049a0:	00048513          	mv	a0,s1
    800049a4:	00813483          	ld	s1,8(sp)
    800049a8:	02010113          	addi	sp,sp,32
    800049ac:	00000317          	auipc	t1,0x0
    800049b0:	3c030067          	jr	960(t1) # 80004d6c <plic_complete>
    800049b4:	00004517          	auipc	a0,0x4
    800049b8:	7ec50513          	addi	a0,a0,2028 # 800091a0 <tickslock>
    800049bc:	00001097          	auipc	ra,0x1
    800049c0:	490080e7          	jalr	1168(ra) # 80005e4c <acquire>
    800049c4:	00003717          	auipc	a4,0x3
    800049c8:	6c070713          	addi	a4,a4,1728 # 80008084 <ticks>
    800049cc:	00072783          	lw	a5,0(a4)
    800049d0:	00004517          	auipc	a0,0x4
    800049d4:	7d050513          	addi	a0,a0,2000 # 800091a0 <tickslock>
    800049d8:	0017879b          	addiw	a5,a5,1
    800049dc:	00f72023          	sw	a5,0(a4)
    800049e0:	00001097          	auipc	ra,0x1
    800049e4:	538080e7          	jalr	1336(ra) # 80005f18 <release>
    800049e8:	f65ff06f          	j	8000494c <kerneltrap+0x8c>
    800049ec:	00001097          	auipc	ra,0x1
    800049f0:	094080e7          	jalr	148(ra) # 80005a80 <uartintr>
    800049f4:	fa5ff06f          	j	80004998 <kerneltrap+0xd8>
    800049f8:	00003517          	auipc	a0,0x3
    800049fc:	a9050513          	addi	a0,a0,-1392 # 80007488 <CONSOLE_STATUS+0x478>
    80004a00:	00000097          	auipc	ra,0x0
    80004a04:	71c080e7          	jalr	1820(ra) # 8000511c <panic>

0000000080004a08 <clockintr>:
    80004a08:	fe010113          	addi	sp,sp,-32
    80004a0c:	00813823          	sd	s0,16(sp)
    80004a10:	00913423          	sd	s1,8(sp)
    80004a14:	00113c23          	sd	ra,24(sp)
    80004a18:	02010413          	addi	s0,sp,32
    80004a1c:	00004497          	auipc	s1,0x4
    80004a20:	78448493          	addi	s1,s1,1924 # 800091a0 <tickslock>
    80004a24:	00048513          	mv	a0,s1
    80004a28:	00001097          	auipc	ra,0x1
    80004a2c:	424080e7          	jalr	1060(ra) # 80005e4c <acquire>
    80004a30:	00003717          	auipc	a4,0x3
    80004a34:	65470713          	addi	a4,a4,1620 # 80008084 <ticks>
    80004a38:	00072783          	lw	a5,0(a4)
    80004a3c:	01013403          	ld	s0,16(sp)
    80004a40:	01813083          	ld	ra,24(sp)
    80004a44:	00048513          	mv	a0,s1
    80004a48:	0017879b          	addiw	a5,a5,1
    80004a4c:	00813483          	ld	s1,8(sp)
    80004a50:	00f72023          	sw	a5,0(a4)
    80004a54:	02010113          	addi	sp,sp,32
    80004a58:	00001317          	auipc	t1,0x1
    80004a5c:	4c030067          	jr	1216(t1) # 80005f18 <release>

0000000080004a60 <devintr>:
    80004a60:	142027f3          	csrr	a5,scause
    80004a64:	00000513          	li	a0,0
    80004a68:	0007c463          	bltz	a5,80004a70 <devintr+0x10>
    80004a6c:	00008067          	ret
    80004a70:	fe010113          	addi	sp,sp,-32
    80004a74:	00813823          	sd	s0,16(sp)
    80004a78:	00113c23          	sd	ra,24(sp)
    80004a7c:	00913423          	sd	s1,8(sp)
    80004a80:	02010413          	addi	s0,sp,32
    80004a84:	0ff7f713          	andi	a4,a5,255
    80004a88:	00900693          	li	a3,9
    80004a8c:	04d70c63          	beq	a4,a3,80004ae4 <devintr+0x84>
    80004a90:	fff00713          	li	a4,-1
    80004a94:	03f71713          	slli	a4,a4,0x3f
    80004a98:	00170713          	addi	a4,a4,1
    80004a9c:	00e78c63          	beq	a5,a4,80004ab4 <devintr+0x54>
    80004aa0:	01813083          	ld	ra,24(sp)
    80004aa4:	01013403          	ld	s0,16(sp)
    80004aa8:	00813483          	ld	s1,8(sp)
    80004aac:	02010113          	addi	sp,sp,32
    80004ab0:	00008067          	ret
    80004ab4:	00000097          	auipc	ra,0x0
    80004ab8:	c8c080e7          	jalr	-884(ra) # 80004740 <cpuid>
    80004abc:	06050663          	beqz	a0,80004b28 <devintr+0xc8>
    80004ac0:	144027f3          	csrr	a5,sip
    80004ac4:	ffd7f793          	andi	a5,a5,-3
    80004ac8:	14479073          	csrw	sip,a5
    80004acc:	01813083          	ld	ra,24(sp)
    80004ad0:	01013403          	ld	s0,16(sp)
    80004ad4:	00813483          	ld	s1,8(sp)
    80004ad8:	00200513          	li	a0,2
    80004adc:	02010113          	addi	sp,sp,32
    80004ae0:	00008067          	ret
    80004ae4:	00000097          	auipc	ra,0x0
    80004ae8:	250080e7          	jalr	592(ra) # 80004d34 <plic_claim>
    80004aec:	00a00793          	li	a5,10
    80004af0:	00050493          	mv	s1,a0
    80004af4:	06f50663          	beq	a0,a5,80004b60 <devintr+0x100>
    80004af8:	00100513          	li	a0,1
    80004afc:	fa0482e3          	beqz	s1,80004aa0 <devintr+0x40>
    80004b00:	00048593          	mv	a1,s1
    80004b04:	00003517          	auipc	a0,0x3
    80004b08:	9a450513          	addi	a0,a0,-1628 # 800074a8 <CONSOLE_STATUS+0x498>
    80004b0c:	00000097          	auipc	ra,0x0
    80004b10:	66c080e7          	jalr	1644(ra) # 80005178 <__printf>
    80004b14:	00048513          	mv	a0,s1
    80004b18:	00000097          	auipc	ra,0x0
    80004b1c:	254080e7          	jalr	596(ra) # 80004d6c <plic_complete>
    80004b20:	00100513          	li	a0,1
    80004b24:	f7dff06f          	j	80004aa0 <devintr+0x40>
    80004b28:	00004517          	auipc	a0,0x4
    80004b2c:	67850513          	addi	a0,a0,1656 # 800091a0 <tickslock>
    80004b30:	00001097          	auipc	ra,0x1
    80004b34:	31c080e7          	jalr	796(ra) # 80005e4c <acquire>
    80004b38:	00003717          	auipc	a4,0x3
    80004b3c:	54c70713          	addi	a4,a4,1356 # 80008084 <ticks>
    80004b40:	00072783          	lw	a5,0(a4)
    80004b44:	00004517          	auipc	a0,0x4
    80004b48:	65c50513          	addi	a0,a0,1628 # 800091a0 <tickslock>
    80004b4c:	0017879b          	addiw	a5,a5,1
    80004b50:	00f72023          	sw	a5,0(a4)
    80004b54:	00001097          	auipc	ra,0x1
    80004b58:	3c4080e7          	jalr	964(ra) # 80005f18 <release>
    80004b5c:	f65ff06f          	j	80004ac0 <devintr+0x60>
    80004b60:	00001097          	auipc	ra,0x1
    80004b64:	f20080e7          	jalr	-224(ra) # 80005a80 <uartintr>
    80004b68:	fadff06f          	j	80004b14 <devintr+0xb4>
    80004b6c:	0000                	unimp
	...

0000000080004b70 <kernelvec>:
    80004b70:	f0010113          	addi	sp,sp,-256
    80004b74:	00113023          	sd	ra,0(sp)
    80004b78:	00213423          	sd	sp,8(sp)
    80004b7c:	00313823          	sd	gp,16(sp)
    80004b80:	00413c23          	sd	tp,24(sp)
    80004b84:	02513023          	sd	t0,32(sp)
    80004b88:	02613423          	sd	t1,40(sp)
    80004b8c:	02713823          	sd	t2,48(sp)
    80004b90:	02813c23          	sd	s0,56(sp)
    80004b94:	04913023          	sd	s1,64(sp)
    80004b98:	04a13423          	sd	a0,72(sp)
    80004b9c:	04b13823          	sd	a1,80(sp)
    80004ba0:	04c13c23          	sd	a2,88(sp)
    80004ba4:	06d13023          	sd	a3,96(sp)
    80004ba8:	06e13423          	sd	a4,104(sp)
    80004bac:	06f13823          	sd	a5,112(sp)
    80004bb0:	07013c23          	sd	a6,120(sp)
    80004bb4:	09113023          	sd	a7,128(sp)
    80004bb8:	09213423          	sd	s2,136(sp)
    80004bbc:	09313823          	sd	s3,144(sp)
    80004bc0:	09413c23          	sd	s4,152(sp)
    80004bc4:	0b513023          	sd	s5,160(sp)
    80004bc8:	0b613423          	sd	s6,168(sp)
    80004bcc:	0b713823          	sd	s7,176(sp)
    80004bd0:	0b813c23          	sd	s8,184(sp)
    80004bd4:	0d913023          	sd	s9,192(sp)
    80004bd8:	0da13423          	sd	s10,200(sp)
    80004bdc:	0db13823          	sd	s11,208(sp)
    80004be0:	0dc13c23          	sd	t3,216(sp)
    80004be4:	0fd13023          	sd	t4,224(sp)
    80004be8:	0fe13423          	sd	t5,232(sp)
    80004bec:	0ff13823          	sd	t6,240(sp)
    80004bf0:	cd1ff0ef          	jal	ra,800048c0 <kerneltrap>
    80004bf4:	00013083          	ld	ra,0(sp)
    80004bf8:	00813103          	ld	sp,8(sp)
    80004bfc:	01013183          	ld	gp,16(sp)
    80004c00:	02013283          	ld	t0,32(sp)
    80004c04:	02813303          	ld	t1,40(sp)
    80004c08:	03013383          	ld	t2,48(sp)
    80004c0c:	03813403          	ld	s0,56(sp)
    80004c10:	04013483          	ld	s1,64(sp)
    80004c14:	04813503          	ld	a0,72(sp)
    80004c18:	05013583          	ld	a1,80(sp)
    80004c1c:	05813603          	ld	a2,88(sp)
    80004c20:	06013683          	ld	a3,96(sp)
    80004c24:	06813703          	ld	a4,104(sp)
    80004c28:	07013783          	ld	a5,112(sp)
    80004c2c:	07813803          	ld	a6,120(sp)
    80004c30:	08013883          	ld	a7,128(sp)
    80004c34:	08813903          	ld	s2,136(sp)
    80004c38:	09013983          	ld	s3,144(sp)
    80004c3c:	09813a03          	ld	s4,152(sp)
    80004c40:	0a013a83          	ld	s5,160(sp)
    80004c44:	0a813b03          	ld	s6,168(sp)
    80004c48:	0b013b83          	ld	s7,176(sp)
    80004c4c:	0b813c03          	ld	s8,184(sp)
    80004c50:	0c013c83          	ld	s9,192(sp)
    80004c54:	0c813d03          	ld	s10,200(sp)
    80004c58:	0d013d83          	ld	s11,208(sp)
    80004c5c:	0d813e03          	ld	t3,216(sp)
    80004c60:	0e013e83          	ld	t4,224(sp)
    80004c64:	0e813f03          	ld	t5,232(sp)
    80004c68:	0f013f83          	ld	t6,240(sp)
    80004c6c:	10010113          	addi	sp,sp,256
    80004c70:	10200073          	sret
    80004c74:	00000013          	nop
    80004c78:	00000013          	nop
    80004c7c:	00000013          	nop

0000000080004c80 <timervec>:
    80004c80:	34051573          	csrrw	a0,mscratch,a0
    80004c84:	00b53023          	sd	a1,0(a0)
    80004c88:	00c53423          	sd	a2,8(a0)
    80004c8c:	00d53823          	sd	a3,16(a0)
    80004c90:	01853583          	ld	a1,24(a0)
    80004c94:	02053603          	ld	a2,32(a0)
    80004c98:	0005b683          	ld	a3,0(a1)
    80004c9c:	00c686b3          	add	a3,a3,a2
    80004ca0:	00d5b023          	sd	a3,0(a1)
    80004ca4:	00200593          	li	a1,2
    80004ca8:	14459073          	csrw	sip,a1
    80004cac:	01053683          	ld	a3,16(a0)
    80004cb0:	00853603          	ld	a2,8(a0)
    80004cb4:	00053583          	ld	a1,0(a0)
    80004cb8:	34051573          	csrrw	a0,mscratch,a0
    80004cbc:	30200073          	mret

0000000080004cc0 <plicinit>:
    80004cc0:	ff010113          	addi	sp,sp,-16
    80004cc4:	00813423          	sd	s0,8(sp)
    80004cc8:	01010413          	addi	s0,sp,16
    80004ccc:	00813403          	ld	s0,8(sp)
    80004cd0:	0c0007b7          	lui	a5,0xc000
    80004cd4:	00100713          	li	a4,1
    80004cd8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80004cdc:	00e7a223          	sw	a4,4(a5)
    80004ce0:	01010113          	addi	sp,sp,16
    80004ce4:	00008067          	ret

0000000080004ce8 <plicinithart>:
    80004ce8:	ff010113          	addi	sp,sp,-16
    80004cec:	00813023          	sd	s0,0(sp)
    80004cf0:	00113423          	sd	ra,8(sp)
    80004cf4:	01010413          	addi	s0,sp,16
    80004cf8:	00000097          	auipc	ra,0x0
    80004cfc:	a48080e7          	jalr	-1464(ra) # 80004740 <cpuid>
    80004d00:	0085171b          	slliw	a4,a0,0x8
    80004d04:	0c0027b7          	lui	a5,0xc002
    80004d08:	00e787b3          	add	a5,a5,a4
    80004d0c:	40200713          	li	a4,1026
    80004d10:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80004d14:	00813083          	ld	ra,8(sp)
    80004d18:	00013403          	ld	s0,0(sp)
    80004d1c:	00d5151b          	slliw	a0,a0,0xd
    80004d20:	0c2017b7          	lui	a5,0xc201
    80004d24:	00a78533          	add	a0,a5,a0
    80004d28:	00052023          	sw	zero,0(a0)
    80004d2c:	01010113          	addi	sp,sp,16
    80004d30:	00008067          	ret

0000000080004d34 <plic_claim>:
    80004d34:	ff010113          	addi	sp,sp,-16
    80004d38:	00813023          	sd	s0,0(sp)
    80004d3c:	00113423          	sd	ra,8(sp)
    80004d40:	01010413          	addi	s0,sp,16
    80004d44:	00000097          	auipc	ra,0x0
    80004d48:	9fc080e7          	jalr	-1540(ra) # 80004740 <cpuid>
    80004d4c:	00813083          	ld	ra,8(sp)
    80004d50:	00013403          	ld	s0,0(sp)
    80004d54:	00d5151b          	slliw	a0,a0,0xd
    80004d58:	0c2017b7          	lui	a5,0xc201
    80004d5c:	00a78533          	add	a0,a5,a0
    80004d60:	00452503          	lw	a0,4(a0)
    80004d64:	01010113          	addi	sp,sp,16
    80004d68:	00008067          	ret

0000000080004d6c <plic_complete>:
    80004d6c:	fe010113          	addi	sp,sp,-32
    80004d70:	00813823          	sd	s0,16(sp)
    80004d74:	00913423          	sd	s1,8(sp)
    80004d78:	00113c23          	sd	ra,24(sp)
    80004d7c:	02010413          	addi	s0,sp,32
    80004d80:	00050493          	mv	s1,a0
    80004d84:	00000097          	auipc	ra,0x0
    80004d88:	9bc080e7          	jalr	-1604(ra) # 80004740 <cpuid>
    80004d8c:	01813083          	ld	ra,24(sp)
    80004d90:	01013403          	ld	s0,16(sp)
    80004d94:	00d5179b          	slliw	a5,a0,0xd
    80004d98:	0c201737          	lui	a4,0xc201
    80004d9c:	00f707b3          	add	a5,a4,a5
    80004da0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004da4:	00813483          	ld	s1,8(sp)
    80004da8:	02010113          	addi	sp,sp,32
    80004dac:	00008067          	ret

0000000080004db0 <consolewrite>:
    80004db0:	fb010113          	addi	sp,sp,-80
    80004db4:	04813023          	sd	s0,64(sp)
    80004db8:	04113423          	sd	ra,72(sp)
    80004dbc:	02913c23          	sd	s1,56(sp)
    80004dc0:	03213823          	sd	s2,48(sp)
    80004dc4:	03313423          	sd	s3,40(sp)
    80004dc8:	03413023          	sd	s4,32(sp)
    80004dcc:	01513c23          	sd	s5,24(sp)
    80004dd0:	05010413          	addi	s0,sp,80
    80004dd4:	06c05c63          	blez	a2,80004e4c <consolewrite+0x9c>
    80004dd8:	00060993          	mv	s3,a2
    80004ddc:	00050a13          	mv	s4,a0
    80004de0:	00058493          	mv	s1,a1
    80004de4:	00000913          	li	s2,0
    80004de8:	fff00a93          	li	s5,-1
    80004dec:	01c0006f          	j	80004e08 <consolewrite+0x58>
    80004df0:	fbf44503          	lbu	a0,-65(s0)
    80004df4:	0019091b          	addiw	s2,s2,1
    80004df8:	00148493          	addi	s1,s1,1
    80004dfc:	00001097          	auipc	ra,0x1
    80004e00:	a9c080e7          	jalr	-1380(ra) # 80005898 <uartputc>
    80004e04:	03298063          	beq	s3,s2,80004e24 <consolewrite+0x74>
    80004e08:	00048613          	mv	a2,s1
    80004e0c:	00100693          	li	a3,1
    80004e10:	000a0593          	mv	a1,s4
    80004e14:	fbf40513          	addi	a0,s0,-65
    80004e18:	00000097          	auipc	ra,0x0
    80004e1c:	9e0080e7          	jalr	-1568(ra) # 800047f8 <either_copyin>
    80004e20:	fd5518e3          	bne	a0,s5,80004df0 <consolewrite+0x40>
    80004e24:	04813083          	ld	ra,72(sp)
    80004e28:	04013403          	ld	s0,64(sp)
    80004e2c:	03813483          	ld	s1,56(sp)
    80004e30:	02813983          	ld	s3,40(sp)
    80004e34:	02013a03          	ld	s4,32(sp)
    80004e38:	01813a83          	ld	s5,24(sp)
    80004e3c:	00090513          	mv	a0,s2
    80004e40:	03013903          	ld	s2,48(sp)
    80004e44:	05010113          	addi	sp,sp,80
    80004e48:	00008067          	ret
    80004e4c:	00000913          	li	s2,0
    80004e50:	fd5ff06f          	j	80004e24 <consolewrite+0x74>

0000000080004e54 <consoleread>:
    80004e54:	f9010113          	addi	sp,sp,-112
    80004e58:	06813023          	sd	s0,96(sp)
    80004e5c:	04913c23          	sd	s1,88(sp)
    80004e60:	05213823          	sd	s2,80(sp)
    80004e64:	05313423          	sd	s3,72(sp)
    80004e68:	05413023          	sd	s4,64(sp)
    80004e6c:	03513c23          	sd	s5,56(sp)
    80004e70:	03613823          	sd	s6,48(sp)
    80004e74:	03713423          	sd	s7,40(sp)
    80004e78:	03813023          	sd	s8,32(sp)
    80004e7c:	06113423          	sd	ra,104(sp)
    80004e80:	01913c23          	sd	s9,24(sp)
    80004e84:	07010413          	addi	s0,sp,112
    80004e88:	00060b93          	mv	s7,a2
    80004e8c:	00050913          	mv	s2,a0
    80004e90:	00058c13          	mv	s8,a1
    80004e94:	00060b1b          	sext.w	s6,a2
    80004e98:	00004497          	auipc	s1,0x4
    80004e9c:	33048493          	addi	s1,s1,816 # 800091c8 <cons>
    80004ea0:	00400993          	li	s3,4
    80004ea4:	fff00a13          	li	s4,-1
    80004ea8:	00a00a93          	li	s5,10
    80004eac:	05705e63          	blez	s7,80004f08 <consoleread+0xb4>
    80004eb0:	09c4a703          	lw	a4,156(s1)
    80004eb4:	0984a783          	lw	a5,152(s1)
    80004eb8:	0007071b          	sext.w	a4,a4
    80004ebc:	08e78463          	beq	a5,a4,80004f44 <consoleread+0xf0>
    80004ec0:	07f7f713          	andi	a4,a5,127
    80004ec4:	00e48733          	add	a4,s1,a4
    80004ec8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80004ecc:	0017869b          	addiw	a3,a5,1
    80004ed0:	08d4ac23          	sw	a3,152(s1)
    80004ed4:	00070c9b          	sext.w	s9,a4
    80004ed8:	0b370663          	beq	a4,s3,80004f84 <consoleread+0x130>
    80004edc:	00100693          	li	a3,1
    80004ee0:	f9f40613          	addi	a2,s0,-97
    80004ee4:	000c0593          	mv	a1,s8
    80004ee8:	00090513          	mv	a0,s2
    80004eec:	f8e40fa3          	sb	a4,-97(s0)
    80004ef0:	00000097          	auipc	ra,0x0
    80004ef4:	8bc080e7          	jalr	-1860(ra) # 800047ac <either_copyout>
    80004ef8:	01450863          	beq	a0,s4,80004f08 <consoleread+0xb4>
    80004efc:	001c0c13          	addi	s8,s8,1
    80004f00:	fffb8b9b          	addiw	s7,s7,-1
    80004f04:	fb5c94e3          	bne	s9,s5,80004eac <consoleread+0x58>
    80004f08:	000b851b          	sext.w	a0,s7
    80004f0c:	06813083          	ld	ra,104(sp)
    80004f10:	06013403          	ld	s0,96(sp)
    80004f14:	05813483          	ld	s1,88(sp)
    80004f18:	05013903          	ld	s2,80(sp)
    80004f1c:	04813983          	ld	s3,72(sp)
    80004f20:	04013a03          	ld	s4,64(sp)
    80004f24:	03813a83          	ld	s5,56(sp)
    80004f28:	02813b83          	ld	s7,40(sp)
    80004f2c:	02013c03          	ld	s8,32(sp)
    80004f30:	01813c83          	ld	s9,24(sp)
    80004f34:	40ab053b          	subw	a0,s6,a0
    80004f38:	03013b03          	ld	s6,48(sp)
    80004f3c:	07010113          	addi	sp,sp,112
    80004f40:	00008067          	ret
    80004f44:	00001097          	auipc	ra,0x1
    80004f48:	1d8080e7          	jalr	472(ra) # 8000611c <push_on>
    80004f4c:	0984a703          	lw	a4,152(s1)
    80004f50:	09c4a783          	lw	a5,156(s1)
    80004f54:	0007879b          	sext.w	a5,a5
    80004f58:	fef70ce3          	beq	a4,a5,80004f50 <consoleread+0xfc>
    80004f5c:	00001097          	auipc	ra,0x1
    80004f60:	234080e7          	jalr	564(ra) # 80006190 <pop_on>
    80004f64:	0984a783          	lw	a5,152(s1)
    80004f68:	07f7f713          	andi	a4,a5,127
    80004f6c:	00e48733          	add	a4,s1,a4
    80004f70:	01874703          	lbu	a4,24(a4)
    80004f74:	0017869b          	addiw	a3,a5,1
    80004f78:	08d4ac23          	sw	a3,152(s1)
    80004f7c:	00070c9b          	sext.w	s9,a4
    80004f80:	f5371ee3          	bne	a4,s3,80004edc <consoleread+0x88>
    80004f84:	000b851b          	sext.w	a0,s7
    80004f88:	f96bf2e3          	bgeu	s7,s6,80004f0c <consoleread+0xb8>
    80004f8c:	08f4ac23          	sw	a5,152(s1)
    80004f90:	f7dff06f          	j	80004f0c <consoleread+0xb8>

0000000080004f94 <consputc>:
    80004f94:	10000793          	li	a5,256
    80004f98:	00f50663          	beq	a0,a5,80004fa4 <consputc+0x10>
    80004f9c:	00001317          	auipc	t1,0x1
    80004fa0:	9f430067          	jr	-1548(t1) # 80005990 <uartputc_sync>
    80004fa4:	ff010113          	addi	sp,sp,-16
    80004fa8:	00113423          	sd	ra,8(sp)
    80004fac:	00813023          	sd	s0,0(sp)
    80004fb0:	01010413          	addi	s0,sp,16
    80004fb4:	00800513          	li	a0,8
    80004fb8:	00001097          	auipc	ra,0x1
    80004fbc:	9d8080e7          	jalr	-1576(ra) # 80005990 <uartputc_sync>
    80004fc0:	02000513          	li	a0,32
    80004fc4:	00001097          	auipc	ra,0x1
    80004fc8:	9cc080e7          	jalr	-1588(ra) # 80005990 <uartputc_sync>
    80004fcc:	00013403          	ld	s0,0(sp)
    80004fd0:	00813083          	ld	ra,8(sp)
    80004fd4:	00800513          	li	a0,8
    80004fd8:	01010113          	addi	sp,sp,16
    80004fdc:	00001317          	auipc	t1,0x1
    80004fe0:	9b430067          	jr	-1612(t1) # 80005990 <uartputc_sync>

0000000080004fe4 <consoleintr>:
    80004fe4:	fe010113          	addi	sp,sp,-32
    80004fe8:	00813823          	sd	s0,16(sp)
    80004fec:	00913423          	sd	s1,8(sp)
    80004ff0:	01213023          	sd	s2,0(sp)
    80004ff4:	00113c23          	sd	ra,24(sp)
    80004ff8:	02010413          	addi	s0,sp,32
    80004ffc:	00004917          	auipc	s2,0x4
    80005000:	1cc90913          	addi	s2,s2,460 # 800091c8 <cons>
    80005004:	00050493          	mv	s1,a0
    80005008:	00090513          	mv	a0,s2
    8000500c:	00001097          	auipc	ra,0x1
    80005010:	e40080e7          	jalr	-448(ra) # 80005e4c <acquire>
    80005014:	02048c63          	beqz	s1,8000504c <consoleintr+0x68>
    80005018:	0a092783          	lw	a5,160(s2)
    8000501c:	09892703          	lw	a4,152(s2)
    80005020:	07f00693          	li	a3,127
    80005024:	40e7873b          	subw	a4,a5,a4
    80005028:	02e6e263          	bltu	a3,a4,8000504c <consoleintr+0x68>
    8000502c:	00d00713          	li	a4,13
    80005030:	04e48063          	beq	s1,a4,80005070 <consoleintr+0x8c>
    80005034:	07f7f713          	andi	a4,a5,127
    80005038:	00e90733          	add	a4,s2,a4
    8000503c:	0017879b          	addiw	a5,a5,1
    80005040:	0af92023          	sw	a5,160(s2)
    80005044:	00970c23          	sb	s1,24(a4)
    80005048:	08f92e23          	sw	a5,156(s2)
    8000504c:	01013403          	ld	s0,16(sp)
    80005050:	01813083          	ld	ra,24(sp)
    80005054:	00813483          	ld	s1,8(sp)
    80005058:	00013903          	ld	s2,0(sp)
    8000505c:	00004517          	auipc	a0,0x4
    80005060:	16c50513          	addi	a0,a0,364 # 800091c8 <cons>
    80005064:	02010113          	addi	sp,sp,32
    80005068:	00001317          	auipc	t1,0x1
    8000506c:	eb030067          	jr	-336(t1) # 80005f18 <release>
    80005070:	00a00493          	li	s1,10
    80005074:	fc1ff06f          	j	80005034 <consoleintr+0x50>

0000000080005078 <consoleinit>:
    80005078:	fe010113          	addi	sp,sp,-32
    8000507c:	00113c23          	sd	ra,24(sp)
    80005080:	00813823          	sd	s0,16(sp)
    80005084:	00913423          	sd	s1,8(sp)
    80005088:	02010413          	addi	s0,sp,32
    8000508c:	00004497          	auipc	s1,0x4
    80005090:	13c48493          	addi	s1,s1,316 # 800091c8 <cons>
    80005094:	00048513          	mv	a0,s1
    80005098:	00002597          	auipc	a1,0x2
    8000509c:	46858593          	addi	a1,a1,1128 # 80007500 <CONSOLE_STATUS+0x4f0>
    800050a0:	00001097          	auipc	ra,0x1
    800050a4:	d88080e7          	jalr	-632(ra) # 80005e28 <initlock>
    800050a8:	00000097          	auipc	ra,0x0
    800050ac:	7ac080e7          	jalr	1964(ra) # 80005854 <uartinit>
    800050b0:	01813083          	ld	ra,24(sp)
    800050b4:	01013403          	ld	s0,16(sp)
    800050b8:	00000797          	auipc	a5,0x0
    800050bc:	d9c78793          	addi	a5,a5,-612 # 80004e54 <consoleread>
    800050c0:	0af4bc23          	sd	a5,184(s1)
    800050c4:	00000797          	auipc	a5,0x0
    800050c8:	cec78793          	addi	a5,a5,-788 # 80004db0 <consolewrite>
    800050cc:	0cf4b023          	sd	a5,192(s1)
    800050d0:	00813483          	ld	s1,8(sp)
    800050d4:	02010113          	addi	sp,sp,32
    800050d8:	00008067          	ret

00000000800050dc <console_read>:
    800050dc:	ff010113          	addi	sp,sp,-16
    800050e0:	00813423          	sd	s0,8(sp)
    800050e4:	01010413          	addi	s0,sp,16
    800050e8:	00813403          	ld	s0,8(sp)
    800050ec:	00004317          	auipc	t1,0x4
    800050f0:	19433303          	ld	t1,404(t1) # 80009280 <devsw+0x10>
    800050f4:	01010113          	addi	sp,sp,16
    800050f8:	00030067          	jr	t1

00000000800050fc <console_write>:
    800050fc:	ff010113          	addi	sp,sp,-16
    80005100:	00813423          	sd	s0,8(sp)
    80005104:	01010413          	addi	s0,sp,16
    80005108:	00813403          	ld	s0,8(sp)
    8000510c:	00004317          	auipc	t1,0x4
    80005110:	17c33303          	ld	t1,380(t1) # 80009288 <devsw+0x18>
    80005114:	01010113          	addi	sp,sp,16
    80005118:	00030067          	jr	t1

000000008000511c <panic>:
    8000511c:	fe010113          	addi	sp,sp,-32
    80005120:	00113c23          	sd	ra,24(sp)
    80005124:	00813823          	sd	s0,16(sp)
    80005128:	00913423          	sd	s1,8(sp)
    8000512c:	02010413          	addi	s0,sp,32
    80005130:	00050493          	mv	s1,a0
    80005134:	00002517          	auipc	a0,0x2
    80005138:	3d450513          	addi	a0,a0,980 # 80007508 <CONSOLE_STATUS+0x4f8>
    8000513c:	00004797          	auipc	a5,0x4
    80005140:	1e07a623          	sw	zero,492(a5) # 80009328 <pr+0x18>
    80005144:	00000097          	auipc	ra,0x0
    80005148:	034080e7          	jalr	52(ra) # 80005178 <__printf>
    8000514c:	00048513          	mv	a0,s1
    80005150:	00000097          	auipc	ra,0x0
    80005154:	028080e7          	jalr	40(ra) # 80005178 <__printf>
    80005158:	00002517          	auipc	a0,0x2
    8000515c:	39050513          	addi	a0,a0,912 # 800074e8 <CONSOLE_STATUS+0x4d8>
    80005160:	00000097          	auipc	ra,0x0
    80005164:	018080e7          	jalr	24(ra) # 80005178 <__printf>
    80005168:	00100793          	li	a5,1
    8000516c:	00003717          	auipc	a4,0x3
    80005170:	f0f72e23          	sw	a5,-228(a4) # 80008088 <panicked>
    80005174:	0000006f          	j	80005174 <panic+0x58>

0000000080005178 <__printf>:
    80005178:	f3010113          	addi	sp,sp,-208
    8000517c:	08813023          	sd	s0,128(sp)
    80005180:	07313423          	sd	s3,104(sp)
    80005184:	09010413          	addi	s0,sp,144
    80005188:	05813023          	sd	s8,64(sp)
    8000518c:	08113423          	sd	ra,136(sp)
    80005190:	06913c23          	sd	s1,120(sp)
    80005194:	07213823          	sd	s2,112(sp)
    80005198:	07413023          	sd	s4,96(sp)
    8000519c:	05513c23          	sd	s5,88(sp)
    800051a0:	05613823          	sd	s6,80(sp)
    800051a4:	05713423          	sd	s7,72(sp)
    800051a8:	03913c23          	sd	s9,56(sp)
    800051ac:	03a13823          	sd	s10,48(sp)
    800051b0:	03b13423          	sd	s11,40(sp)
    800051b4:	00004317          	auipc	t1,0x4
    800051b8:	15c30313          	addi	t1,t1,348 # 80009310 <pr>
    800051bc:	01832c03          	lw	s8,24(t1)
    800051c0:	00b43423          	sd	a1,8(s0)
    800051c4:	00c43823          	sd	a2,16(s0)
    800051c8:	00d43c23          	sd	a3,24(s0)
    800051cc:	02e43023          	sd	a4,32(s0)
    800051d0:	02f43423          	sd	a5,40(s0)
    800051d4:	03043823          	sd	a6,48(s0)
    800051d8:	03143c23          	sd	a7,56(s0)
    800051dc:	00050993          	mv	s3,a0
    800051e0:	4a0c1663          	bnez	s8,8000568c <__printf+0x514>
    800051e4:	60098c63          	beqz	s3,800057fc <__printf+0x684>
    800051e8:	0009c503          	lbu	a0,0(s3)
    800051ec:	00840793          	addi	a5,s0,8
    800051f0:	f6f43c23          	sd	a5,-136(s0)
    800051f4:	00000493          	li	s1,0
    800051f8:	22050063          	beqz	a0,80005418 <__printf+0x2a0>
    800051fc:	00002a37          	lui	s4,0x2
    80005200:	00018ab7          	lui	s5,0x18
    80005204:	000f4b37          	lui	s6,0xf4
    80005208:	00989bb7          	lui	s7,0x989
    8000520c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005210:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005214:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005218:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000521c:	00148c9b          	addiw	s9,s1,1
    80005220:	02500793          	li	a5,37
    80005224:	01998933          	add	s2,s3,s9
    80005228:	38f51263          	bne	a0,a5,800055ac <__printf+0x434>
    8000522c:	00094783          	lbu	a5,0(s2)
    80005230:	00078c9b          	sext.w	s9,a5
    80005234:	1e078263          	beqz	a5,80005418 <__printf+0x2a0>
    80005238:	0024849b          	addiw	s1,s1,2
    8000523c:	07000713          	li	a4,112
    80005240:	00998933          	add	s2,s3,s1
    80005244:	38e78a63          	beq	a5,a4,800055d8 <__printf+0x460>
    80005248:	20f76863          	bltu	a4,a5,80005458 <__printf+0x2e0>
    8000524c:	42a78863          	beq	a5,a0,8000567c <__printf+0x504>
    80005250:	06400713          	li	a4,100
    80005254:	40e79663          	bne	a5,a4,80005660 <__printf+0x4e8>
    80005258:	f7843783          	ld	a5,-136(s0)
    8000525c:	0007a603          	lw	a2,0(a5)
    80005260:	00878793          	addi	a5,a5,8
    80005264:	f6f43c23          	sd	a5,-136(s0)
    80005268:	42064a63          	bltz	a2,8000569c <__printf+0x524>
    8000526c:	00a00713          	li	a4,10
    80005270:	02e677bb          	remuw	a5,a2,a4
    80005274:	00002d97          	auipc	s11,0x2
    80005278:	2bcd8d93          	addi	s11,s11,700 # 80007530 <digits>
    8000527c:	00900593          	li	a1,9
    80005280:	0006051b          	sext.w	a0,a2
    80005284:	00000c93          	li	s9,0
    80005288:	02079793          	slli	a5,a5,0x20
    8000528c:	0207d793          	srli	a5,a5,0x20
    80005290:	00fd87b3          	add	a5,s11,a5
    80005294:	0007c783          	lbu	a5,0(a5)
    80005298:	02e656bb          	divuw	a3,a2,a4
    8000529c:	f8f40023          	sb	a5,-128(s0)
    800052a0:	14c5d863          	bge	a1,a2,800053f0 <__printf+0x278>
    800052a4:	06300593          	li	a1,99
    800052a8:	00100c93          	li	s9,1
    800052ac:	02e6f7bb          	remuw	a5,a3,a4
    800052b0:	02079793          	slli	a5,a5,0x20
    800052b4:	0207d793          	srli	a5,a5,0x20
    800052b8:	00fd87b3          	add	a5,s11,a5
    800052bc:	0007c783          	lbu	a5,0(a5)
    800052c0:	02e6d73b          	divuw	a4,a3,a4
    800052c4:	f8f400a3          	sb	a5,-127(s0)
    800052c8:	12a5f463          	bgeu	a1,a0,800053f0 <__printf+0x278>
    800052cc:	00a00693          	li	a3,10
    800052d0:	00900593          	li	a1,9
    800052d4:	02d777bb          	remuw	a5,a4,a3
    800052d8:	02079793          	slli	a5,a5,0x20
    800052dc:	0207d793          	srli	a5,a5,0x20
    800052e0:	00fd87b3          	add	a5,s11,a5
    800052e4:	0007c503          	lbu	a0,0(a5)
    800052e8:	02d757bb          	divuw	a5,a4,a3
    800052ec:	f8a40123          	sb	a0,-126(s0)
    800052f0:	48e5f263          	bgeu	a1,a4,80005774 <__printf+0x5fc>
    800052f4:	06300513          	li	a0,99
    800052f8:	02d7f5bb          	remuw	a1,a5,a3
    800052fc:	02059593          	slli	a1,a1,0x20
    80005300:	0205d593          	srli	a1,a1,0x20
    80005304:	00bd85b3          	add	a1,s11,a1
    80005308:	0005c583          	lbu	a1,0(a1)
    8000530c:	02d7d7bb          	divuw	a5,a5,a3
    80005310:	f8b401a3          	sb	a1,-125(s0)
    80005314:	48e57263          	bgeu	a0,a4,80005798 <__printf+0x620>
    80005318:	3e700513          	li	a0,999
    8000531c:	02d7f5bb          	remuw	a1,a5,a3
    80005320:	02059593          	slli	a1,a1,0x20
    80005324:	0205d593          	srli	a1,a1,0x20
    80005328:	00bd85b3          	add	a1,s11,a1
    8000532c:	0005c583          	lbu	a1,0(a1)
    80005330:	02d7d7bb          	divuw	a5,a5,a3
    80005334:	f8b40223          	sb	a1,-124(s0)
    80005338:	46e57663          	bgeu	a0,a4,800057a4 <__printf+0x62c>
    8000533c:	02d7f5bb          	remuw	a1,a5,a3
    80005340:	02059593          	slli	a1,a1,0x20
    80005344:	0205d593          	srli	a1,a1,0x20
    80005348:	00bd85b3          	add	a1,s11,a1
    8000534c:	0005c583          	lbu	a1,0(a1)
    80005350:	02d7d7bb          	divuw	a5,a5,a3
    80005354:	f8b402a3          	sb	a1,-123(s0)
    80005358:	46ea7863          	bgeu	s4,a4,800057c8 <__printf+0x650>
    8000535c:	02d7f5bb          	remuw	a1,a5,a3
    80005360:	02059593          	slli	a1,a1,0x20
    80005364:	0205d593          	srli	a1,a1,0x20
    80005368:	00bd85b3          	add	a1,s11,a1
    8000536c:	0005c583          	lbu	a1,0(a1)
    80005370:	02d7d7bb          	divuw	a5,a5,a3
    80005374:	f8b40323          	sb	a1,-122(s0)
    80005378:	3eeaf863          	bgeu	s5,a4,80005768 <__printf+0x5f0>
    8000537c:	02d7f5bb          	remuw	a1,a5,a3
    80005380:	02059593          	slli	a1,a1,0x20
    80005384:	0205d593          	srli	a1,a1,0x20
    80005388:	00bd85b3          	add	a1,s11,a1
    8000538c:	0005c583          	lbu	a1,0(a1)
    80005390:	02d7d7bb          	divuw	a5,a5,a3
    80005394:	f8b403a3          	sb	a1,-121(s0)
    80005398:	42eb7e63          	bgeu	s6,a4,800057d4 <__printf+0x65c>
    8000539c:	02d7f5bb          	remuw	a1,a5,a3
    800053a0:	02059593          	slli	a1,a1,0x20
    800053a4:	0205d593          	srli	a1,a1,0x20
    800053a8:	00bd85b3          	add	a1,s11,a1
    800053ac:	0005c583          	lbu	a1,0(a1)
    800053b0:	02d7d7bb          	divuw	a5,a5,a3
    800053b4:	f8b40423          	sb	a1,-120(s0)
    800053b8:	42ebfc63          	bgeu	s7,a4,800057f0 <__printf+0x678>
    800053bc:	02079793          	slli	a5,a5,0x20
    800053c0:	0207d793          	srli	a5,a5,0x20
    800053c4:	00fd8db3          	add	s11,s11,a5
    800053c8:	000dc703          	lbu	a4,0(s11)
    800053cc:	00a00793          	li	a5,10
    800053d0:	00900c93          	li	s9,9
    800053d4:	f8e404a3          	sb	a4,-119(s0)
    800053d8:	00065c63          	bgez	a2,800053f0 <__printf+0x278>
    800053dc:	f9040713          	addi	a4,s0,-112
    800053e0:	00f70733          	add	a4,a4,a5
    800053e4:	02d00693          	li	a3,45
    800053e8:	fed70823          	sb	a3,-16(a4)
    800053ec:	00078c93          	mv	s9,a5
    800053f0:	f8040793          	addi	a5,s0,-128
    800053f4:	01978cb3          	add	s9,a5,s9
    800053f8:	f7f40d13          	addi	s10,s0,-129
    800053fc:	000cc503          	lbu	a0,0(s9)
    80005400:	fffc8c93          	addi	s9,s9,-1
    80005404:	00000097          	auipc	ra,0x0
    80005408:	b90080e7          	jalr	-1136(ra) # 80004f94 <consputc>
    8000540c:	ffac98e3          	bne	s9,s10,800053fc <__printf+0x284>
    80005410:	00094503          	lbu	a0,0(s2)
    80005414:	e00514e3          	bnez	a0,8000521c <__printf+0xa4>
    80005418:	1a0c1663          	bnez	s8,800055c4 <__printf+0x44c>
    8000541c:	08813083          	ld	ra,136(sp)
    80005420:	08013403          	ld	s0,128(sp)
    80005424:	07813483          	ld	s1,120(sp)
    80005428:	07013903          	ld	s2,112(sp)
    8000542c:	06813983          	ld	s3,104(sp)
    80005430:	06013a03          	ld	s4,96(sp)
    80005434:	05813a83          	ld	s5,88(sp)
    80005438:	05013b03          	ld	s6,80(sp)
    8000543c:	04813b83          	ld	s7,72(sp)
    80005440:	04013c03          	ld	s8,64(sp)
    80005444:	03813c83          	ld	s9,56(sp)
    80005448:	03013d03          	ld	s10,48(sp)
    8000544c:	02813d83          	ld	s11,40(sp)
    80005450:	0d010113          	addi	sp,sp,208
    80005454:	00008067          	ret
    80005458:	07300713          	li	a4,115
    8000545c:	1ce78a63          	beq	a5,a4,80005630 <__printf+0x4b8>
    80005460:	07800713          	li	a4,120
    80005464:	1ee79e63          	bne	a5,a4,80005660 <__printf+0x4e8>
    80005468:	f7843783          	ld	a5,-136(s0)
    8000546c:	0007a703          	lw	a4,0(a5)
    80005470:	00878793          	addi	a5,a5,8
    80005474:	f6f43c23          	sd	a5,-136(s0)
    80005478:	28074263          	bltz	a4,800056fc <__printf+0x584>
    8000547c:	00002d97          	auipc	s11,0x2
    80005480:	0b4d8d93          	addi	s11,s11,180 # 80007530 <digits>
    80005484:	00f77793          	andi	a5,a4,15
    80005488:	00fd87b3          	add	a5,s11,a5
    8000548c:	0007c683          	lbu	a3,0(a5)
    80005490:	00f00613          	li	a2,15
    80005494:	0007079b          	sext.w	a5,a4
    80005498:	f8d40023          	sb	a3,-128(s0)
    8000549c:	0047559b          	srliw	a1,a4,0x4
    800054a0:	0047569b          	srliw	a3,a4,0x4
    800054a4:	00000c93          	li	s9,0
    800054a8:	0ee65063          	bge	a2,a4,80005588 <__printf+0x410>
    800054ac:	00f6f693          	andi	a3,a3,15
    800054b0:	00dd86b3          	add	a3,s11,a3
    800054b4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800054b8:	0087d79b          	srliw	a5,a5,0x8
    800054bc:	00100c93          	li	s9,1
    800054c0:	f8d400a3          	sb	a3,-127(s0)
    800054c4:	0cb67263          	bgeu	a2,a1,80005588 <__printf+0x410>
    800054c8:	00f7f693          	andi	a3,a5,15
    800054cc:	00dd86b3          	add	a3,s11,a3
    800054d0:	0006c583          	lbu	a1,0(a3)
    800054d4:	00f00613          	li	a2,15
    800054d8:	0047d69b          	srliw	a3,a5,0x4
    800054dc:	f8b40123          	sb	a1,-126(s0)
    800054e0:	0047d593          	srli	a1,a5,0x4
    800054e4:	28f67e63          	bgeu	a2,a5,80005780 <__printf+0x608>
    800054e8:	00f6f693          	andi	a3,a3,15
    800054ec:	00dd86b3          	add	a3,s11,a3
    800054f0:	0006c503          	lbu	a0,0(a3)
    800054f4:	0087d813          	srli	a6,a5,0x8
    800054f8:	0087d69b          	srliw	a3,a5,0x8
    800054fc:	f8a401a3          	sb	a0,-125(s0)
    80005500:	28b67663          	bgeu	a2,a1,8000578c <__printf+0x614>
    80005504:	00f6f693          	andi	a3,a3,15
    80005508:	00dd86b3          	add	a3,s11,a3
    8000550c:	0006c583          	lbu	a1,0(a3)
    80005510:	00c7d513          	srli	a0,a5,0xc
    80005514:	00c7d69b          	srliw	a3,a5,0xc
    80005518:	f8b40223          	sb	a1,-124(s0)
    8000551c:	29067a63          	bgeu	a2,a6,800057b0 <__printf+0x638>
    80005520:	00f6f693          	andi	a3,a3,15
    80005524:	00dd86b3          	add	a3,s11,a3
    80005528:	0006c583          	lbu	a1,0(a3)
    8000552c:	0107d813          	srli	a6,a5,0x10
    80005530:	0107d69b          	srliw	a3,a5,0x10
    80005534:	f8b402a3          	sb	a1,-123(s0)
    80005538:	28a67263          	bgeu	a2,a0,800057bc <__printf+0x644>
    8000553c:	00f6f693          	andi	a3,a3,15
    80005540:	00dd86b3          	add	a3,s11,a3
    80005544:	0006c683          	lbu	a3,0(a3)
    80005548:	0147d79b          	srliw	a5,a5,0x14
    8000554c:	f8d40323          	sb	a3,-122(s0)
    80005550:	21067663          	bgeu	a2,a6,8000575c <__printf+0x5e4>
    80005554:	02079793          	slli	a5,a5,0x20
    80005558:	0207d793          	srli	a5,a5,0x20
    8000555c:	00fd8db3          	add	s11,s11,a5
    80005560:	000dc683          	lbu	a3,0(s11)
    80005564:	00800793          	li	a5,8
    80005568:	00700c93          	li	s9,7
    8000556c:	f8d403a3          	sb	a3,-121(s0)
    80005570:	00075c63          	bgez	a4,80005588 <__printf+0x410>
    80005574:	f9040713          	addi	a4,s0,-112
    80005578:	00f70733          	add	a4,a4,a5
    8000557c:	02d00693          	li	a3,45
    80005580:	fed70823          	sb	a3,-16(a4)
    80005584:	00078c93          	mv	s9,a5
    80005588:	f8040793          	addi	a5,s0,-128
    8000558c:	01978cb3          	add	s9,a5,s9
    80005590:	f7f40d13          	addi	s10,s0,-129
    80005594:	000cc503          	lbu	a0,0(s9)
    80005598:	fffc8c93          	addi	s9,s9,-1
    8000559c:	00000097          	auipc	ra,0x0
    800055a0:	9f8080e7          	jalr	-1544(ra) # 80004f94 <consputc>
    800055a4:	ff9d18e3          	bne	s10,s9,80005594 <__printf+0x41c>
    800055a8:	0100006f          	j	800055b8 <__printf+0x440>
    800055ac:	00000097          	auipc	ra,0x0
    800055b0:	9e8080e7          	jalr	-1560(ra) # 80004f94 <consputc>
    800055b4:	000c8493          	mv	s1,s9
    800055b8:	00094503          	lbu	a0,0(s2)
    800055bc:	c60510e3          	bnez	a0,8000521c <__printf+0xa4>
    800055c0:	e40c0ee3          	beqz	s8,8000541c <__printf+0x2a4>
    800055c4:	00004517          	auipc	a0,0x4
    800055c8:	d4c50513          	addi	a0,a0,-692 # 80009310 <pr>
    800055cc:	00001097          	auipc	ra,0x1
    800055d0:	94c080e7          	jalr	-1716(ra) # 80005f18 <release>
    800055d4:	e49ff06f          	j	8000541c <__printf+0x2a4>
    800055d8:	f7843783          	ld	a5,-136(s0)
    800055dc:	03000513          	li	a0,48
    800055e0:	01000d13          	li	s10,16
    800055e4:	00878713          	addi	a4,a5,8
    800055e8:	0007bc83          	ld	s9,0(a5)
    800055ec:	f6e43c23          	sd	a4,-136(s0)
    800055f0:	00000097          	auipc	ra,0x0
    800055f4:	9a4080e7          	jalr	-1628(ra) # 80004f94 <consputc>
    800055f8:	07800513          	li	a0,120
    800055fc:	00000097          	auipc	ra,0x0
    80005600:	998080e7          	jalr	-1640(ra) # 80004f94 <consputc>
    80005604:	00002d97          	auipc	s11,0x2
    80005608:	f2cd8d93          	addi	s11,s11,-212 # 80007530 <digits>
    8000560c:	03ccd793          	srli	a5,s9,0x3c
    80005610:	00fd87b3          	add	a5,s11,a5
    80005614:	0007c503          	lbu	a0,0(a5)
    80005618:	fffd0d1b          	addiw	s10,s10,-1
    8000561c:	004c9c93          	slli	s9,s9,0x4
    80005620:	00000097          	auipc	ra,0x0
    80005624:	974080e7          	jalr	-1676(ra) # 80004f94 <consputc>
    80005628:	fe0d12e3          	bnez	s10,8000560c <__printf+0x494>
    8000562c:	f8dff06f          	j	800055b8 <__printf+0x440>
    80005630:	f7843783          	ld	a5,-136(s0)
    80005634:	0007bc83          	ld	s9,0(a5)
    80005638:	00878793          	addi	a5,a5,8
    8000563c:	f6f43c23          	sd	a5,-136(s0)
    80005640:	000c9a63          	bnez	s9,80005654 <__printf+0x4dc>
    80005644:	1080006f          	j	8000574c <__printf+0x5d4>
    80005648:	001c8c93          	addi	s9,s9,1
    8000564c:	00000097          	auipc	ra,0x0
    80005650:	948080e7          	jalr	-1720(ra) # 80004f94 <consputc>
    80005654:	000cc503          	lbu	a0,0(s9)
    80005658:	fe0518e3          	bnez	a0,80005648 <__printf+0x4d0>
    8000565c:	f5dff06f          	j	800055b8 <__printf+0x440>
    80005660:	02500513          	li	a0,37
    80005664:	00000097          	auipc	ra,0x0
    80005668:	930080e7          	jalr	-1744(ra) # 80004f94 <consputc>
    8000566c:	000c8513          	mv	a0,s9
    80005670:	00000097          	auipc	ra,0x0
    80005674:	924080e7          	jalr	-1756(ra) # 80004f94 <consputc>
    80005678:	f41ff06f          	j	800055b8 <__printf+0x440>
    8000567c:	02500513          	li	a0,37
    80005680:	00000097          	auipc	ra,0x0
    80005684:	914080e7          	jalr	-1772(ra) # 80004f94 <consputc>
    80005688:	f31ff06f          	j	800055b8 <__printf+0x440>
    8000568c:	00030513          	mv	a0,t1
    80005690:	00000097          	auipc	ra,0x0
    80005694:	7bc080e7          	jalr	1980(ra) # 80005e4c <acquire>
    80005698:	b4dff06f          	j	800051e4 <__printf+0x6c>
    8000569c:	40c0053b          	negw	a0,a2
    800056a0:	00a00713          	li	a4,10
    800056a4:	02e576bb          	remuw	a3,a0,a4
    800056a8:	00002d97          	auipc	s11,0x2
    800056ac:	e88d8d93          	addi	s11,s11,-376 # 80007530 <digits>
    800056b0:	ff700593          	li	a1,-9
    800056b4:	02069693          	slli	a3,a3,0x20
    800056b8:	0206d693          	srli	a3,a3,0x20
    800056bc:	00dd86b3          	add	a3,s11,a3
    800056c0:	0006c683          	lbu	a3,0(a3)
    800056c4:	02e557bb          	divuw	a5,a0,a4
    800056c8:	f8d40023          	sb	a3,-128(s0)
    800056cc:	10b65e63          	bge	a2,a1,800057e8 <__printf+0x670>
    800056d0:	06300593          	li	a1,99
    800056d4:	02e7f6bb          	remuw	a3,a5,a4
    800056d8:	02069693          	slli	a3,a3,0x20
    800056dc:	0206d693          	srli	a3,a3,0x20
    800056e0:	00dd86b3          	add	a3,s11,a3
    800056e4:	0006c683          	lbu	a3,0(a3)
    800056e8:	02e7d73b          	divuw	a4,a5,a4
    800056ec:	00200793          	li	a5,2
    800056f0:	f8d400a3          	sb	a3,-127(s0)
    800056f4:	bca5ece3          	bltu	a1,a0,800052cc <__printf+0x154>
    800056f8:	ce5ff06f          	j	800053dc <__printf+0x264>
    800056fc:	40e007bb          	negw	a5,a4
    80005700:	00002d97          	auipc	s11,0x2
    80005704:	e30d8d93          	addi	s11,s11,-464 # 80007530 <digits>
    80005708:	00f7f693          	andi	a3,a5,15
    8000570c:	00dd86b3          	add	a3,s11,a3
    80005710:	0006c583          	lbu	a1,0(a3)
    80005714:	ff100613          	li	a2,-15
    80005718:	0047d69b          	srliw	a3,a5,0x4
    8000571c:	f8b40023          	sb	a1,-128(s0)
    80005720:	0047d59b          	srliw	a1,a5,0x4
    80005724:	0ac75e63          	bge	a4,a2,800057e0 <__printf+0x668>
    80005728:	00f6f693          	andi	a3,a3,15
    8000572c:	00dd86b3          	add	a3,s11,a3
    80005730:	0006c603          	lbu	a2,0(a3)
    80005734:	00f00693          	li	a3,15
    80005738:	0087d79b          	srliw	a5,a5,0x8
    8000573c:	f8c400a3          	sb	a2,-127(s0)
    80005740:	d8b6e4e3          	bltu	a3,a1,800054c8 <__printf+0x350>
    80005744:	00200793          	li	a5,2
    80005748:	e2dff06f          	j	80005574 <__printf+0x3fc>
    8000574c:	00002c97          	auipc	s9,0x2
    80005750:	dc4c8c93          	addi	s9,s9,-572 # 80007510 <CONSOLE_STATUS+0x500>
    80005754:	02800513          	li	a0,40
    80005758:	ef1ff06f          	j	80005648 <__printf+0x4d0>
    8000575c:	00700793          	li	a5,7
    80005760:	00600c93          	li	s9,6
    80005764:	e0dff06f          	j	80005570 <__printf+0x3f8>
    80005768:	00700793          	li	a5,7
    8000576c:	00600c93          	li	s9,6
    80005770:	c69ff06f          	j	800053d8 <__printf+0x260>
    80005774:	00300793          	li	a5,3
    80005778:	00200c93          	li	s9,2
    8000577c:	c5dff06f          	j	800053d8 <__printf+0x260>
    80005780:	00300793          	li	a5,3
    80005784:	00200c93          	li	s9,2
    80005788:	de9ff06f          	j	80005570 <__printf+0x3f8>
    8000578c:	00400793          	li	a5,4
    80005790:	00300c93          	li	s9,3
    80005794:	dddff06f          	j	80005570 <__printf+0x3f8>
    80005798:	00400793          	li	a5,4
    8000579c:	00300c93          	li	s9,3
    800057a0:	c39ff06f          	j	800053d8 <__printf+0x260>
    800057a4:	00500793          	li	a5,5
    800057a8:	00400c93          	li	s9,4
    800057ac:	c2dff06f          	j	800053d8 <__printf+0x260>
    800057b0:	00500793          	li	a5,5
    800057b4:	00400c93          	li	s9,4
    800057b8:	db9ff06f          	j	80005570 <__printf+0x3f8>
    800057bc:	00600793          	li	a5,6
    800057c0:	00500c93          	li	s9,5
    800057c4:	dadff06f          	j	80005570 <__printf+0x3f8>
    800057c8:	00600793          	li	a5,6
    800057cc:	00500c93          	li	s9,5
    800057d0:	c09ff06f          	j	800053d8 <__printf+0x260>
    800057d4:	00800793          	li	a5,8
    800057d8:	00700c93          	li	s9,7
    800057dc:	bfdff06f          	j	800053d8 <__printf+0x260>
    800057e0:	00100793          	li	a5,1
    800057e4:	d91ff06f          	j	80005574 <__printf+0x3fc>
    800057e8:	00100793          	li	a5,1
    800057ec:	bf1ff06f          	j	800053dc <__printf+0x264>
    800057f0:	00900793          	li	a5,9
    800057f4:	00800c93          	li	s9,8
    800057f8:	be1ff06f          	j	800053d8 <__printf+0x260>
    800057fc:	00002517          	auipc	a0,0x2
    80005800:	d1c50513          	addi	a0,a0,-740 # 80007518 <CONSOLE_STATUS+0x508>
    80005804:	00000097          	auipc	ra,0x0
    80005808:	918080e7          	jalr	-1768(ra) # 8000511c <panic>

000000008000580c <printfinit>:
    8000580c:	fe010113          	addi	sp,sp,-32
    80005810:	00813823          	sd	s0,16(sp)
    80005814:	00913423          	sd	s1,8(sp)
    80005818:	00113c23          	sd	ra,24(sp)
    8000581c:	02010413          	addi	s0,sp,32
    80005820:	00004497          	auipc	s1,0x4
    80005824:	af048493          	addi	s1,s1,-1296 # 80009310 <pr>
    80005828:	00048513          	mv	a0,s1
    8000582c:	00002597          	auipc	a1,0x2
    80005830:	cfc58593          	addi	a1,a1,-772 # 80007528 <CONSOLE_STATUS+0x518>
    80005834:	00000097          	auipc	ra,0x0
    80005838:	5f4080e7          	jalr	1524(ra) # 80005e28 <initlock>
    8000583c:	01813083          	ld	ra,24(sp)
    80005840:	01013403          	ld	s0,16(sp)
    80005844:	0004ac23          	sw	zero,24(s1)
    80005848:	00813483          	ld	s1,8(sp)
    8000584c:	02010113          	addi	sp,sp,32
    80005850:	00008067          	ret

0000000080005854 <uartinit>:
    80005854:	ff010113          	addi	sp,sp,-16
    80005858:	00813423          	sd	s0,8(sp)
    8000585c:	01010413          	addi	s0,sp,16
    80005860:	100007b7          	lui	a5,0x10000
    80005864:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80005868:	f8000713          	li	a4,-128
    8000586c:	00e781a3          	sb	a4,3(a5)
    80005870:	00300713          	li	a4,3
    80005874:	00e78023          	sb	a4,0(a5)
    80005878:	000780a3          	sb	zero,1(a5)
    8000587c:	00e781a3          	sb	a4,3(a5)
    80005880:	00700693          	li	a3,7
    80005884:	00d78123          	sb	a3,2(a5)
    80005888:	00e780a3          	sb	a4,1(a5)
    8000588c:	00813403          	ld	s0,8(sp)
    80005890:	01010113          	addi	sp,sp,16
    80005894:	00008067          	ret

0000000080005898 <uartputc>:
    80005898:	00002797          	auipc	a5,0x2
    8000589c:	7f07a783          	lw	a5,2032(a5) # 80008088 <panicked>
    800058a0:	00078463          	beqz	a5,800058a8 <uartputc+0x10>
    800058a4:	0000006f          	j	800058a4 <uartputc+0xc>
    800058a8:	fd010113          	addi	sp,sp,-48
    800058ac:	02813023          	sd	s0,32(sp)
    800058b0:	00913c23          	sd	s1,24(sp)
    800058b4:	01213823          	sd	s2,16(sp)
    800058b8:	01313423          	sd	s3,8(sp)
    800058bc:	02113423          	sd	ra,40(sp)
    800058c0:	03010413          	addi	s0,sp,48
    800058c4:	00002917          	auipc	s2,0x2
    800058c8:	7cc90913          	addi	s2,s2,1996 # 80008090 <uart_tx_r>
    800058cc:	00093783          	ld	a5,0(s2)
    800058d0:	00002497          	auipc	s1,0x2
    800058d4:	7c848493          	addi	s1,s1,1992 # 80008098 <uart_tx_w>
    800058d8:	0004b703          	ld	a4,0(s1)
    800058dc:	02078693          	addi	a3,a5,32
    800058e0:	00050993          	mv	s3,a0
    800058e4:	02e69c63          	bne	a3,a4,8000591c <uartputc+0x84>
    800058e8:	00001097          	auipc	ra,0x1
    800058ec:	834080e7          	jalr	-1996(ra) # 8000611c <push_on>
    800058f0:	00093783          	ld	a5,0(s2)
    800058f4:	0004b703          	ld	a4,0(s1)
    800058f8:	02078793          	addi	a5,a5,32
    800058fc:	00e79463          	bne	a5,a4,80005904 <uartputc+0x6c>
    80005900:	0000006f          	j	80005900 <uartputc+0x68>
    80005904:	00001097          	auipc	ra,0x1
    80005908:	88c080e7          	jalr	-1908(ra) # 80006190 <pop_on>
    8000590c:	00093783          	ld	a5,0(s2)
    80005910:	0004b703          	ld	a4,0(s1)
    80005914:	02078693          	addi	a3,a5,32
    80005918:	fce688e3          	beq	a3,a4,800058e8 <uartputc+0x50>
    8000591c:	01f77693          	andi	a3,a4,31
    80005920:	00004597          	auipc	a1,0x4
    80005924:	a1058593          	addi	a1,a1,-1520 # 80009330 <uart_tx_buf>
    80005928:	00d586b3          	add	a3,a1,a3
    8000592c:	00170713          	addi	a4,a4,1
    80005930:	01368023          	sb	s3,0(a3)
    80005934:	00e4b023          	sd	a4,0(s1)
    80005938:	10000637          	lui	a2,0x10000
    8000593c:	02f71063          	bne	a4,a5,8000595c <uartputc+0xc4>
    80005940:	0340006f          	j	80005974 <uartputc+0xdc>
    80005944:	00074703          	lbu	a4,0(a4)
    80005948:	00f93023          	sd	a5,0(s2)
    8000594c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80005950:	00093783          	ld	a5,0(s2)
    80005954:	0004b703          	ld	a4,0(s1)
    80005958:	00f70e63          	beq	a4,a5,80005974 <uartputc+0xdc>
    8000595c:	00564683          	lbu	a3,5(a2)
    80005960:	01f7f713          	andi	a4,a5,31
    80005964:	00e58733          	add	a4,a1,a4
    80005968:	0206f693          	andi	a3,a3,32
    8000596c:	00178793          	addi	a5,a5,1
    80005970:	fc069ae3          	bnez	a3,80005944 <uartputc+0xac>
    80005974:	02813083          	ld	ra,40(sp)
    80005978:	02013403          	ld	s0,32(sp)
    8000597c:	01813483          	ld	s1,24(sp)
    80005980:	01013903          	ld	s2,16(sp)
    80005984:	00813983          	ld	s3,8(sp)
    80005988:	03010113          	addi	sp,sp,48
    8000598c:	00008067          	ret

0000000080005990 <uartputc_sync>:
    80005990:	ff010113          	addi	sp,sp,-16
    80005994:	00813423          	sd	s0,8(sp)
    80005998:	01010413          	addi	s0,sp,16
    8000599c:	00002717          	auipc	a4,0x2
    800059a0:	6ec72703          	lw	a4,1772(a4) # 80008088 <panicked>
    800059a4:	02071663          	bnez	a4,800059d0 <uartputc_sync+0x40>
    800059a8:	00050793          	mv	a5,a0
    800059ac:	100006b7          	lui	a3,0x10000
    800059b0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800059b4:	02077713          	andi	a4,a4,32
    800059b8:	fe070ce3          	beqz	a4,800059b0 <uartputc_sync+0x20>
    800059bc:	0ff7f793          	andi	a5,a5,255
    800059c0:	00f68023          	sb	a5,0(a3)
    800059c4:	00813403          	ld	s0,8(sp)
    800059c8:	01010113          	addi	sp,sp,16
    800059cc:	00008067          	ret
    800059d0:	0000006f          	j	800059d0 <uartputc_sync+0x40>

00000000800059d4 <uartstart>:
    800059d4:	ff010113          	addi	sp,sp,-16
    800059d8:	00813423          	sd	s0,8(sp)
    800059dc:	01010413          	addi	s0,sp,16
    800059e0:	00002617          	auipc	a2,0x2
    800059e4:	6b060613          	addi	a2,a2,1712 # 80008090 <uart_tx_r>
    800059e8:	00002517          	auipc	a0,0x2
    800059ec:	6b050513          	addi	a0,a0,1712 # 80008098 <uart_tx_w>
    800059f0:	00063783          	ld	a5,0(a2)
    800059f4:	00053703          	ld	a4,0(a0)
    800059f8:	04f70263          	beq	a4,a5,80005a3c <uartstart+0x68>
    800059fc:	100005b7          	lui	a1,0x10000
    80005a00:	00004817          	auipc	a6,0x4
    80005a04:	93080813          	addi	a6,a6,-1744 # 80009330 <uart_tx_buf>
    80005a08:	01c0006f          	j	80005a24 <uartstart+0x50>
    80005a0c:	0006c703          	lbu	a4,0(a3)
    80005a10:	00f63023          	sd	a5,0(a2)
    80005a14:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005a18:	00063783          	ld	a5,0(a2)
    80005a1c:	00053703          	ld	a4,0(a0)
    80005a20:	00f70e63          	beq	a4,a5,80005a3c <uartstart+0x68>
    80005a24:	01f7f713          	andi	a4,a5,31
    80005a28:	00e806b3          	add	a3,a6,a4
    80005a2c:	0055c703          	lbu	a4,5(a1)
    80005a30:	00178793          	addi	a5,a5,1
    80005a34:	02077713          	andi	a4,a4,32
    80005a38:	fc071ae3          	bnez	a4,80005a0c <uartstart+0x38>
    80005a3c:	00813403          	ld	s0,8(sp)
    80005a40:	01010113          	addi	sp,sp,16
    80005a44:	00008067          	ret

0000000080005a48 <uartgetc>:
    80005a48:	ff010113          	addi	sp,sp,-16
    80005a4c:	00813423          	sd	s0,8(sp)
    80005a50:	01010413          	addi	s0,sp,16
    80005a54:	10000737          	lui	a4,0x10000
    80005a58:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80005a5c:	0017f793          	andi	a5,a5,1
    80005a60:	00078c63          	beqz	a5,80005a78 <uartgetc+0x30>
    80005a64:	00074503          	lbu	a0,0(a4)
    80005a68:	0ff57513          	andi	a0,a0,255
    80005a6c:	00813403          	ld	s0,8(sp)
    80005a70:	01010113          	addi	sp,sp,16
    80005a74:	00008067          	ret
    80005a78:	fff00513          	li	a0,-1
    80005a7c:	ff1ff06f          	j	80005a6c <uartgetc+0x24>

0000000080005a80 <uartintr>:
    80005a80:	100007b7          	lui	a5,0x10000
    80005a84:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80005a88:	0017f793          	andi	a5,a5,1
    80005a8c:	0a078463          	beqz	a5,80005b34 <uartintr+0xb4>
    80005a90:	fe010113          	addi	sp,sp,-32
    80005a94:	00813823          	sd	s0,16(sp)
    80005a98:	00913423          	sd	s1,8(sp)
    80005a9c:	00113c23          	sd	ra,24(sp)
    80005aa0:	02010413          	addi	s0,sp,32
    80005aa4:	100004b7          	lui	s1,0x10000
    80005aa8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80005aac:	0ff57513          	andi	a0,a0,255
    80005ab0:	fffff097          	auipc	ra,0xfffff
    80005ab4:	534080e7          	jalr	1332(ra) # 80004fe4 <consoleintr>
    80005ab8:	0054c783          	lbu	a5,5(s1)
    80005abc:	0017f793          	andi	a5,a5,1
    80005ac0:	fe0794e3          	bnez	a5,80005aa8 <uartintr+0x28>
    80005ac4:	00002617          	auipc	a2,0x2
    80005ac8:	5cc60613          	addi	a2,a2,1484 # 80008090 <uart_tx_r>
    80005acc:	00002517          	auipc	a0,0x2
    80005ad0:	5cc50513          	addi	a0,a0,1484 # 80008098 <uart_tx_w>
    80005ad4:	00063783          	ld	a5,0(a2)
    80005ad8:	00053703          	ld	a4,0(a0)
    80005adc:	04f70263          	beq	a4,a5,80005b20 <uartintr+0xa0>
    80005ae0:	100005b7          	lui	a1,0x10000
    80005ae4:	00004817          	auipc	a6,0x4
    80005ae8:	84c80813          	addi	a6,a6,-1972 # 80009330 <uart_tx_buf>
    80005aec:	01c0006f          	j	80005b08 <uartintr+0x88>
    80005af0:	0006c703          	lbu	a4,0(a3)
    80005af4:	00f63023          	sd	a5,0(a2)
    80005af8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005afc:	00063783          	ld	a5,0(a2)
    80005b00:	00053703          	ld	a4,0(a0)
    80005b04:	00f70e63          	beq	a4,a5,80005b20 <uartintr+0xa0>
    80005b08:	01f7f713          	andi	a4,a5,31
    80005b0c:	00e806b3          	add	a3,a6,a4
    80005b10:	0055c703          	lbu	a4,5(a1)
    80005b14:	00178793          	addi	a5,a5,1
    80005b18:	02077713          	andi	a4,a4,32
    80005b1c:	fc071ae3          	bnez	a4,80005af0 <uartintr+0x70>
    80005b20:	01813083          	ld	ra,24(sp)
    80005b24:	01013403          	ld	s0,16(sp)
    80005b28:	00813483          	ld	s1,8(sp)
    80005b2c:	02010113          	addi	sp,sp,32
    80005b30:	00008067          	ret
    80005b34:	00002617          	auipc	a2,0x2
    80005b38:	55c60613          	addi	a2,a2,1372 # 80008090 <uart_tx_r>
    80005b3c:	00002517          	auipc	a0,0x2
    80005b40:	55c50513          	addi	a0,a0,1372 # 80008098 <uart_tx_w>
    80005b44:	00063783          	ld	a5,0(a2)
    80005b48:	00053703          	ld	a4,0(a0)
    80005b4c:	04f70263          	beq	a4,a5,80005b90 <uartintr+0x110>
    80005b50:	100005b7          	lui	a1,0x10000
    80005b54:	00003817          	auipc	a6,0x3
    80005b58:	7dc80813          	addi	a6,a6,2012 # 80009330 <uart_tx_buf>
    80005b5c:	01c0006f          	j	80005b78 <uartintr+0xf8>
    80005b60:	0006c703          	lbu	a4,0(a3)
    80005b64:	00f63023          	sd	a5,0(a2)
    80005b68:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005b6c:	00063783          	ld	a5,0(a2)
    80005b70:	00053703          	ld	a4,0(a0)
    80005b74:	02f70063          	beq	a4,a5,80005b94 <uartintr+0x114>
    80005b78:	01f7f713          	andi	a4,a5,31
    80005b7c:	00e806b3          	add	a3,a6,a4
    80005b80:	0055c703          	lbu	a4,5(a1)
    80005b84:	00178793          	addi	a5,a5,1
    80005b88:	02077713          	andi	a4,a4,32
    80005b8c:	fc071ae3          	bnez	a4,80005b60 <uartintr+0xe0>
    80005b90:	00008067          	ret
    80005b94:	00008067          	ret

0000000080005b98 <kinit>:
    80005b98:	fc010113          	addi	sp,sp,-64
    80005b9c:	02913423          	sd	s1,40(sp)
    80005ba0:	fffff7b7          	lui	a5,0xfffff
    80005ba4:	00004497          	auipc	s1,0x4
    80005ba8:	7ab48493          	addi	s1,s1,1963 # 8000a34f <end+0xfff>
    80005bac:	02813823          	sd	s0,48(sp)
    80005bb0:	01313c23          	sd	s3,24(sp)
    80005bb4:	00f4f4b3          	and	s1,s1,a5
    80005bb8:	02113c23          	sd	ra,56(sp)
    80005bbc:	03213023          	sd	s2,32(sp)
    80005bc0:	01413823          	sd	s4,16(sp)
    80005bc4:	01513423          	sd	s5,8(sp)
    80005bc8:	04010413          	addi	s0,sp,64
    80005bcc:	000017b7          	lui	a5,0x1
    80005bd0:	01100993          	li	s3,17
    80005bd4:	00f487b3          	add	a5,s1,a5
    80005bd8:	01b99993          	slli	s3,s3,0x1b
    80005bdc:	06f9e063          	bltu	s3,a5,80005c3c <kinit+0xa4>
    80005be0:	00003a97          	auipc	s5,0x3
    80005be4:	770a8a93          	addi	s5,s5,1904 # 80009350 <end>
    80005be8:	0754ec63          	bltu	s1,s5,80005c60 <kinit+0xc8>
    80005bec:	0734fa63          	bgeu	s1,s3,80005c60 <kinit+0xc8>
    80005bf0:	00088a37          	lui	s4,0x88
    80005bf4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80005bf8:	00002917          	auipc	s2,0x2
    80005bfc:	4a890913          	addi	s2,s2,1192 # 800080a0 <kmem>
    80005c00:	00ca1a13          	slli	s4,s4,0xc
    80005c04:	0140006f          	j	80005c18 <kinit+0x80>
    80005c08:	000017b7          	lui	a5,0x1
    80005c0c:	00f484b3          	add	s1,s1,a5
    80005c10:	0554e863          	bltu	s1,s5,80005c60 <kinit+0xc8>
    80005c14:	0534f663          	bgeu	s1,s3,80005c60 <kinit+0xc8>
    80005c18:	00001637          	lui	a2,0x1
    80005c1c:	00100593          	li	a1,1
    80005c20:	00048513          	mv	a0,s1
    80005c24:	00000097          	auipc	ra,0x0
    80005c28:	5e4080e7          	jalr	1508(ra) # 80006208 <__memset>
    80005c2c:	00093783          	ld	a5,0(s2)
    80005c30:	00f4b023          	sd	a5,0(s1)
    80005c34:	00993023          	sd	s1,0(s2)
    80005c38:	fd4498e3          	bne	s1,s4,80005c08 <kinit+0x70>
    80005c3c:	03813083          	ld	ra,56(sp)
    80005c40:	03013403          	ld	s0,48(sp)
    80005c44:	02813483          	ld	s1,40(sp)
    80005c48:	02013903          	ld	s2,32(sp)
    80005c4c:	01813983          	ld	s3,24(sp)
    80005c50:	01013a03          	ld	s4,16(sp)
    80005c54:	00813a83          	ld	s5,8(sp)
    80005c58:	04010113          	addi	sp,sp,64
    80005c5c:	00008067          	ret
    80005c60:	00002517          	auipc	a0,0x2
    80005c64:	8e850513          	addi	a0,a0,-1816 # 80007548 <digits+0x18>
    80005c68:	fffff097          	auipc	ra,0xfffff
    80005c6c:	4b4080e7          	jalr	1204(ra) # 8000511c <panic>

0000000080005c70 <freerange>:
    80005c70:	fc010113          	addi	sp,sp,-64
    80005c74:	000017b7          	lui	a5,0x1
    80005c78:	02913423          	sd	s1,40(sp)
    80005c7c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005c80:	009504b3          	add	s1,a0,s1
    80005c84:	fffff537          	lui	a0,0xfffff
    80005c88:	02813823          	sd	s0,48(sp)
    80005c8c:	02113c23          	sd	ra,56(sp)
    80005c90:	03213023          	sd	s2,32(sp)
    80005c94:	01313c23          	sd	s3,24(sp)
    80005c98:	01413823          	sd	s4,16(sp)
    80005c9c:	01513423          	sd	s5,8(sp)
    80005ca0:	01613023          	sd	s6,0(sp)
    80005ca4:	04010413          	addi	s0,sp,64
    80005ca8:	00a4f4b3          	and	s1,s1,a0
    80005cac:	00f487b3          	add	a5,s1,a5
    80005cb0:	06f5e463          	bltu	a1,a5,80005d18 <freerange+0xa8>
    80005cb4:	00003a97          	auipc	s5,0x3
    80005cb8:	69ca8a93          	addi	s5,s5,1692 # 80009350 <end>
    80005cbc:	0954e263          	bltu	s1,s5,80005d40 <freerange+0xd0>
    80005cc0:	01100993          	li	s3,17
    80005cc4:	01b99993          	slli	s3,s3,0x1b
    80005cc8:	0734fc63          	bgeu	s1,s3,80005d40 <freerange+0xd0>
    80005ccc:	00058a13          	mv	s4,a1
    80005cd0:	00002917          	auipc	s2,0x2
    80005cd4:	3d090913          	addi	s2,s2,976 # 800080a0 <kmem>
    80005cd8:	00002b37          	lui	s6,0x2
    80005cdc:	0140006f          	j	80005cf0 <freerange+0x80>
    80005ce0:	000017b7          	lui	a5,0x1
    80005ce4:	00f484b3          	add	s1,s1,a5
    80005ce8:	0554ec63          	bltu	s1,s5,80005d40 <freerange+0xd0>
    80005cec:	0534fa63          	bgeu	s1,s3,80005d40 <freerange+0xd0>
    80005cf0:	00001637          	lui	a2,0x1
    80005cf4:	00100593          	li	a1,1
    80005cf8:	00048513          	mv	a0,s1
    80005cfc:	00000097          	auipc	ra,0x0
    80005d00:	50c080e7          	jalr	1292(ra) # 80006208 <__memset>
    80005d04:	00093703          	ld	a4,0(s2)
    80005d08:	016487b3          	add	a5,s1,s6
    80005d0c:	00e4b023          	sd	a4,0(s1)
    80005d10:	00993023          	sd	s1,0(s2)
    80005d14:	fcfa76e3          	bgeu	s4,a5,80005ce0 <freerange+0x70>
    80005d18:	03813083          	ld	ra,56(sp)
    80005d1c:	03013403          	ld	s0,48(sp)
    80005d20:	02813483          	ld	s1,40(sp)
    80005d24:	02013903          	ld	s2,32(sp)
    80005d28:	01813983          	ld	s3,24(sp)
    80005d2c:	01013a03          	ld	s4,16(sp)
    80005d30:	00813a83          	ld	s5,8(sp)
    80005d34:	00013b03          	ld	s6,0(sp)
    80005d38:	04010113          	addi	sp,sp,64
    80005d3c:	00008067          	ret
    80005d40:	00002517          	auipc	a0,0x2
    80005d44:	80850513          	addi	a0,a0,-2040 # 80007548 <digits+0x18>
    80005d48:	fffff097          	auipc	ra,0xfffff
    80005d4c:	3d4080e7          	jalr	980(ra) # 8000511c <panic>

0000000080005d50 <kfree>:
    80005d50:	fe010113          	addi	sp,sp,-32
    80005d54:	00813823          	sd	s0,16(sp)
    80005d58:	00113c23          	sd	ra,24(sp)
    80005d5c:	00913423          	sd	s1,8(sp)
    80005d60:	02010413          	addi	s0,sp,32
    80005d64:	03451793          	slli	a5,a0,0x34
    80005d68:	04079c63          	bnez	a5,80005dc0 <kfree+0x70>
    80005d6c:	00003797          	auipc	a5,0x3
    80005d70:	5e478793          	addi	a5,a5,1508 # 80009350 <end>
    80005d74:	00050493          	mv	s1,a0
    80005d78:	04f56463          	bltu	a0,a5,80005dc0 <kfree+0x70>
    80005d7c:	01100793          	li	a5,17
    80005d80:	01b79793          	slli	a5,a5,0x1b
    80005d84:	02f57e63          	bgeu	a0,a5,80005dc0 <kfree+0x70>
    80005d88:	00001637          	lui	a2,0x1
    80005d8c:	00100593          	li	a1,1
    80005d90:	00000097          	auipc	ra,0x0
    80005d94:	478080e7          	jalr	1144(ra) # 80006208 <__memset>
    80005d98:	00002797          	auipc	a5,0x2
    80005d9c:	30878793          	addi	a5,a5,776 # 800080a0 <kmem>
    80005da0:	0007b703          	ld	a4,0(a5)
    80005da4:	01813083          	ld	ra,24(sp)
    80005da8:	01013403          	ld	s0,16(sp)
    80005dac:	00e4b023          	sd	a4,0(s1)
    80005db0:	0097b023          	sd	s1,0(a5)
    80005db4:	00813483          	ld	s1,8(sp)
    80005db8:	02010113          	addi	sp,sp,32
    80005dbc:	00008067          	ret
    80005dc0:	00001517          	auipc	a0,0x1
    80005dc4:	78850513          	addi	a0,a0,1928 # 80007548 <digits+0x18>
    80005dc8:	fffff097          	auipc	ra,0xfffff
    80005dcc:	354080e7          	jalr	852(ra) # 8000511c <panic>

0000000080005dd0 <kalloc>:
    80005dd0:	fe010113          	addi	sp,sp,-32
    80005dd4:	00813823          	sd	s0,16(sp)
    80005dd8:	00913423          	sd	s1,8(sp)
    80005ddc:	00113c23          	sd	ra,24(sp)
    80005de0:	02010413          	addi	s0,sp,32
    80005de4:	00002797          	auipc	a5,0x2
    80005de8:	2bc78793          	addi	a5,a5,700 # 800080a0 <kmem>
    80005dec:	0007b483          	ld	s1,0(a5)
    80005df0:	02048063          	beqz	s1,80005e10 <kalloc+0x40>
    80005df4:	0004b703          	ld	a4,0(s1)
    80005df8:	00001637          	lui	a2,0x1
    80005dfc:	00500593          	li	a1,5
    80005e00:	00048513          	mv	a0,s1
    80005e04:	00e7b023          	sd	a4,0(a5)
    80005e08:	00000097          	auipc	ra,0x0
    80005e0c:	400080e7          	jalr	1024(ra) # 80006208 <__memset>
    80005e10:	01813083          	ld	ra,24(sp)
    80005e14:	01013403          	ld	s0,16(sp)
    80005e18:	00048513          	mv	a0,s1
    80005e1c:	00813483          	ld	s1,8(sp)
    80005e20:	02010113          	addi	sp,sp,32
    80005e24:	00008067          	ret

0000000080005e28 <initlock>:
    80005e28:	ff010113          	addi	sp,sp,-16
    80005e2c:	00813423          	sd	s0,8(sp)
    80005e30:	01010413          	addi	s0,sp,16
    80005e34:	00813403          	ld	s0,8(sp)
    80005e38:	00b53423          	sd	a1,8(a0)
    80005e3c:	00052023          	sw	zero,0(a0)
    80005e40:	00053823          	sd	zero,16(a0)
    80005e44:	01010113          	addi	sp,sp,16
    80005e48:	00008067          	ret

0000000080005e4c <acquire>:
    80005e4c:	fe010113          	addi	sp,sp,-32
    80005e50:	00813823          	sd	s0,16(sp)
    80005e54:	00913423          	sd	s1,8(sp)
    80005e58:	00113c23          	sd	ra,24(sp)
    80005e5c:	01213023          	sd	s2,0(sp)
    80005e60:	02010413          	addi	s0,sp,32
    80005e64:	00050493          	mv	s1,a0
    80005e68:	10002973          	csrr	s2,sstatus
    80005e6c:	100027f3          	csrr	a5,sstatus
    80005e70:	ffd7f793          	andi	a5,a5,-3
    80005e74:	10079073          	csrw	sstatus,a5
    80005e78:	fffff097          	auipc	ra,0xfffff
    80005e7c:	8e8080e7          	jalr	-1816(ra) # 80004760 <mycpu>
    80005e80:	07852783          	lw	a5,120(a0)
    80005e84:	06078e63          	beqz	a5,80005f00 <acquire+0xb4>
    80005e88:	fffff097          	auipc	ra,0xfffff
    80005e8c:	8d8080e7          	jalr	-1832(ra) # 80004760 <mycpu>
    80005e90:	07852783          	lw	a5,120(a0)
    80005e94:	0004a703          	lw	a4,0(s1)
    80005e98:	0017879b          	addiw	a5,a5,1
    80005e9c:	06f52c23          	sw	a5,120(a0)
    80005ea0:	04071063          	bnez	a4,80005ee0 <acquire+0x94>
    80005ea4:	00100713          	li	a4,1
    80005ea8:	00070793          	mv	a5,a4
    80005eac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005eb0:	0007879b          	sext.w	a5,a5
    80005eb4:	fe079ae3          	bnez	a5,80005ea8 <acquire+0x5c>
    80005eb8:	0ff0000f          	fence
    80005ebc:	fffff097          	auipc	ra,0xfffff
    80005ec0:	8a4080e7          	jalr	-1884(ra) # 80004760 <mycpu>
    80005ec4:	01813083          	ld	ra,24(sp)
    80005ec8:	01013403          	ld	s0,16(sp)
    80005ecc:	00a4b823          	sd	a0,16(s1)
    80005ed0:	00013903          	ld	s2,0(sp)
    80005ed4:	00813483          	ld	s1,8(sp)
    80005ed8:	02010113          	addi	sp,sp,32
    80005edc:	00008067          	ret
    80005ee0:	0104b903          	ld	s2,16(s1)
    80005ee4:	fffff097          	auipc	ra,0xfffff
    80005ee8:	87c080e7          	jalr	-1924(ra) # 80004760 <mycpu>
    80005eec:	faa91ce3          	bne	s2,a0,80005ea4 <acquire+0x58>
    80005ef0:	00001517          	auipc	a0,0x1
    80005ef4:	66050513          	addi	a0,a0,1632 # 80007550 <digits+0x20>
    80005ef8:	fffff097          	auipc	ra,0xfffff
    80005efc:	224080e7          	jalr	548(ra) # 8000511c <panic>
    80005f00:	00195913          	srli	s2,s2,0x1
    80005f04:	fffff097          	auipc	ra,0xfffff
    80005f08:	85c080e7          	jalr	-1956(ra) # 80004760 <mycpu>
    80005f0c:	00197913          	andi	s2,s2,1
    80005f10:	07252e23          	sw	s2,124(a0)
    80005f14:	f75ff06f          	j	80005e88 <acquire+0x3c>

0000000080005f18 <release>:
    80005f18:	fe010113          	addi	sp,sp,-32
    80005f1c:	00813823          	sd	s0,16(sp)
    80005f20:	00113c23          	sd	ra,24(sp)
    80005f24:	00913423          	sd	s1,8(sp)
    80005f28:	01213023          	sd	s2,0(sp)
    80005f2c:	02010413          	addi	s0,sp,32
    80005f30:	00052783          	lw	a5,0(a0)
    80005f34:	00079a63          	bnez	a5,80005f48 <release+0x30>
    80005f38:	00001517          	auipc	a0,0x1
    80005f3c:	62050513          	addi	a0,a0,1568 # 80007558 <digits+0x28>
    80005f40:	fffff097          	auipc	ra,0xfffff
    80005f44:	1dc080e7          	jalr	476(ra) # 8000511c <panic>
    80005f48:	01053903          	ld	s2,16(a0)
    80005f4c:	00050493          	mv	s1,a0
    80005f50:	fffff097          	auipc	ra,0xfffff
    80005f54:	810080e7          	jalr	-2032(ra) # 80004760 <mycpu>
    80005f58:	fea910e3          	bne	s2,a0,80005f38 <release+0x20>
    80005f5c:	0004b823          	sd	zero,16(s1)
    80005f60:	0ff0000f          	fence
    80005f64:	0f50000f          	fence	iorw,ow
    80005f68:	0804a02f          	amoswap.w	zero,zero,(s1)
    80005f6c:	ffffe097          	auipc	ra,0xffffe
    80005f70:	7f4080e7          	jalr	2036(ra) # 80004760 <mycpu>
    80005f74:	100027f3          	csrr	a5,sstatus
    80005f78:	0027f793          	andi	a5,a5,2
    80005f7c:	04079a63          	bnez	a5,80005fd0 <release+0xb8>
    80005f80:	07852783          	lw	a5,120(a0)
    80005f84:	02f05e63          	blez	a5,80005fc0 <release+0xa8>
    80005f88:	fff7871b          	addiw	a4,a5,-1
    80005f8c:	06e52c23          	sw	a4,120(a0)
    80005f90:	00071c63          	bnez	a4,80005fa8 <release+0x90>
    80005f94:	07c52783          	lw	a5,124(a0)
    80005f98:	00078863          	beqz	a5,80005fa8 <release+0x90>
    80005f9c:	100027f3          	csrr	a5,sstatus
    80005fa0:	0027e793          	ori	a5,a5,2
    80005fa4:	10079073          	csrw	sstatus,a5
    80005fa8:	01813083          	ld	ra,24(sp)
    80005fac:	01013403          	ld	s0,16(sp)
    80005fb0:	00813483          	ld	s1,8(sp)
    80005fb4:	00013903          	ld	s2,0(sp)
    80005fb8:	02010113          	addi	sp,sp,32
    80005fbc:	00008067          	ret
    80005fc0:	00001517          	auipc	a0,0x1
    80005fc4:	5b850513          	addi	a0,a0,1464 # 80007578 <digits+0x48>
    80005fc8:	fffff097          	auipc	ra,0xfffff
    80005fcc:	154080e7          	jalr	340(ra) # 8000511c <panic>
    80005fd0:	00001517          	auipc	a0,0x1
    80005fd4:	59050513          	addi	a0,a0,1424 # 80007560 <digits+0x30>
    80005fd8:	fffff097          	auipc	ra,0xfffff
    80005fdc:	144080e7          	jalr	324(ra) # 8000511c <panic>

0000000080005fe0 <holding>:
    80005fe0:	00052783          	lw	a5,0(a0)
    80005fe4:	00079663          	bnez	a5,80005ff0 <holding+0x10>
    80005fe8:	00000513          	li	a0,0
    80005fec:	00008067          	ret
    80005ff0:	fe010113          	addi	sp,sp,-32
    80005ff4:	00813823          	sd	s0,16(sp)
    80005ff8:	00913423          	sd	s1,8(sp)
    80005ffc:	00113c23          	sd	ra,24(sp)
    80006000:	02010413          	addi	s0,sp,32
    80006004:	01053483          	ld	s1,16(a0)
    80006008:	ffffe097          	auipc	ra,0xffffe
    8000600c:	758080e7          	jalr	1880(ra) # 80004760 <mycpu>
    80006010:	01813083          	ld	ra,24(sp)
    80006014:	01013403          	ld	s0,16(sp)
    80006018:	40a48533          	sub	a0,s1,a0
    8000601c:	00153513          	seqz	a0,a0
    80006020:	00813483          	ld	s1,8(sp)
    80006024:	02010113          	addi	sp,sp,32
    80006028:	00008067          	ret

000000008000602c <push_off>:
    8000602c:	fe010113          	addi	sp,sp,-32
    80006030:	00813823          	sd	s0,16(sp)
    80006034:	00113c23          	sd	ra,24(sp)
    80006038:	00913423          	sd	s1,8(sp)
    8000603c:	02010413          	addi	s0,sp,32
    80006040:	100024f3          	csrr	s1,sstatus
    80006044:	100027f3          	csrr	a5,sstatus
    80006048:	ffd7f793          	andi	a5,a5,-3
    8000604c:	10079073          	csrw	sstatus,a5
    80006050:	ffffe097          	auipc	ra,0xffffe
    80006054:	710080e7          	jalr	1808(ra) # 80004760 <mycpu>
    80006058:	07852783          	lw	a5,120(a0)
    8000605c:	02078663          	beqz	a5,80006088 <push_off+0x5c>
    80006060:	ffffe097          	auipc	ra,0xffffe
    80006064:	700080e7          	jalr	1792(ra) # 80004760 <mycpu>
    80006068:	07852783          	lw	a5,120(a0)
    8000606c:	01813083          	ld	ra,24(sp)
    80006070:	01013403          	ld	s0,16(sp)
    80006074:	0017879b          	addiw	a5,a5,1
    80006078:	06f52c23          	sw	a5,120(a0)
    8000607c:	00813483          	ld	s1,8(sp)
    80006080:	02010113          	addi	sp,sp,32
    80006084:	00008067          	ret
    80006088:	0014d493          	srli	s1,s1,0x1
    8000608c:	ffffe097          	auipc	ra,0xffffe
    80006090:	6d4080e7          	jalr	1748(ra) # 80004760 <mycpu>
    80006094:	0014f493          	andi	s1,s1,1
    80006098:	06952e23          	sw	s1,124(a0)
    8000609c:	fc5ff06f          	j	80006060 <push_off+0x34>

00000000800060a0 <pop_off>:
    800060a0:	ff010113          	addi	sp,sp,-16
    800060a4:	00813023          	sd	s0,0(sp)
    800060a8:	00113423          	sd	ra,8(sp)
    800060ac:	01010413          	addi	s0,sp,16
    800060b0:	ffffe097          	auipc	ra,0xffffe
    800060b4:	6b0080e7          	jalr	1712(ra) # 80004760 <mycpu>
    800060b8:	100027f3          	csrr	a5,sstatus
    800060bc:	0027f793          	andi	a5,a5,2
    800060c0:	04079663          	bnez	a5,8000610c <pop_off+0x6c>
    800060c4:	07852783          	lw	a5,120(a0)
    800060c8:	02f05a63          	blez	a5,800060fc <pop_off+0x5c>
    800060cc:	fff7871b          	addiw	a4,a5,-1
    800060d0:	06e52c23          	sw	a4,120(a0)
    800060d4:	00071c63          	bnez	a4,800060ec <pop_off+0x4c>
    800060d8:	07c52783          	lw	a5,124(a0)
    800060dc:	00078863          	beqz	a5,800060ec <pop_off+0x4c>
    800060e0:	100027f3          	csrr	a5,sstatus
    800060e4:	0027e793          	ori	a5,a5,2
    800060e8:	10079073          	csrw	sstatus,a5
    800060ec:	00813083          	ld	ra,8(sp)
    800060f0:	00013403          	ld	s0,0(sp)
    800060f4:	01010113          	addi	sp,sp,16
    800060f8:	00008067          	ret
    800060fc:	00001517          	auipc	a0,0x1
    80006100:	47c50513          	addi	a0,a0,1148 # 80007578 <digits+0x48>
    80006104:	fffff097          	auipc	ra,0xfffff
    80006108:	018080e7          	jalr	24(ra) # 8000511c <panic>
    8000610c:	00001517          	auipc	a0,0x1
    80006110:	45450513          	addi	a0,a0,1108 # 80007560 <digits+0x30>
    80006114:	fffff097          	auipc	ra,0xfffff
    80006118:	008080e7          	jalr	8(ra) # 8000511c <panic>

000000008000611c <push_on>:
    8000611c:	fe010113          	addi	sp,sp,-32
    80006120:	00813823          	sd	s0,16(sp)
    80006124:	00113c23          	sd	ra,24(sp)
    80006128:	00913423          	sd	s1,8(sp)
    8000612c:	02010413          	addi	s0,sp,32
    80006130:	100024f3          	csrr	s1,sstatus
    80006134:	100027f3          	csrr	a5,sstatus
    80006138:	0027e793          	ori	a5,a5,2
    8000613c:	10079073          	csrw	sstatus,a5
    80006140:	ffffe097          	auipc	ra,0xffffe
    80006144:	620080e7          	jalr	1568(ra) # 80004760 <mycpu>
    80006148:	07852783          	lw	a5,120(a0)
    8000614c:	02078663          	beqz	a5,80006178 <push_on+0x5c>
    80006150:	ffffe097          	auipc	ra,0xffffe
    80006154:	610080e7          	jalr	1552(ra) # 80004760 <mycpu>
    80006158:	07852783          	lw	a5,120(a0)
    8000615c:	01813083          	ld	ra,24(sp)
    80006160:	01013403          	ld	s0,16(sp)
    80006164:	0017879b          	addiw	a5,a5,1
    80006168:	06f52c23          	sw	a5,120(a0)
    8000616c:	00813483          	ld	s1,8(sp)
    80006170:	02010113          	addi	sp,sp,32
    80006174:	00008067          	ret
    80006178:	0014d493          	srli	s1,s1,0x1
    8000617c:	ffffe097          	auipc	ra,0xffffe
    80006180:	5e4080e7          	jalr	1508(ra) # 80004760 <mycpu>
    80006184:	0014f493          	andi	s1,s1,1
    80006188:	06952e23          	sw	s1,124(a0)
    8000618c:	fc5ff06f          	j	80006150 <push_on+0x34>

0000000080006190 <pop_on>:
    80006190:	ff010113          	addi	sp,sp,-16
    80006194:	00813023          	sd	s0,0(sp)
    80006198:	00113423          	sd	ra,8(sp)
    8000619c:	01010413          	addi	s0,sp,16
    800061a0:	ffffe097          	auipc	ra,0xffffe
    800061a4:	5c0080e7          	jalr	1472(ra) # 80004760 <mycpu>
    800061a8:	100027f3          	csrr	a5,sstatus
    800061ac:	0027f793          	andi	a5,a5,2
    800061b0:	04078463          	beqz	a5,800061f8 <pop_on+0x68>
    800061b4:	07852783          	lw	a5,120(a0)
    800061b8:	02f05863          	blez	a5,800061e8 <pop_on+0x58>
    800061bc:	fff7879b          	addiw	a5,a5,-1
    800061c0:	06f52c23          	sw	a5,120(a0)
    800061c4:	07853783          	ld	a5,120(a0)
    800061c8:	00079863          	bnez	a5,800061d8 <pop_on+0x48>
    800061cc:	100027f3          	csrr	a5,sstatus
    800061d0:	ffd7f793          	andi	a5,a5,-3
    800061d4:	10079073          	csrw	sstatus,a5
    800061d8:	00813083          	ld	ra,8(sp)
    800061dc:	00013403          	ld	s0,0(sp)
    800061e0:	01010113          	addi	sp,sp,16
    800061e4:	00008067          	ret
    800061e8:	00001517          	auipc	a0,0x1
    800061ec:	3b850513          	addi	a0,a0,952 # 800075a0 <digits+0x70>
    800061f0:	fffff097          	auipc	ra,0xfffff
    800061f4:	f2c080e7          	jalr	-212(ra) # 8000511c <panic>
    800061f8:	00001517          	auipc	a0,0x1
    800061fc:	38850513          	addi	a0,a0,904 # 80007580 <digits+0x50>
    80006200:	fffff097          	auipc	ra,0xfffff
    80006204:	f1c080e7          	jalr	-228(ra) # 8000511c <panic>

0000000080006208 <__memset>:
    80006208:	ff010113          	addi	sp,sp,-16
    8000620c:	00813423          	sd	s0,8(sp)
    80006210:	01010413          	addi	s0,sp,16
    80006214:	1a060e63          	beqz	a2,800063d0 <__memset+0x1c8>
    80006218:	40a007b3          	neg	a5,a0
    8000621c:	0077f793          	andi	a5,a5,7
    80006220:	00778693          	addi	a3,a5,7
    80006224:	00b00813          	li	a6,11
    80006228:	0ff5f593          	andi	a1,a1,255
    8000622c:	fff6071b          	addiw	a4,a2,-1
    80006230:	1b06e663          	bltu	a3,a6,800063dc <__memset+0x1d4>
    80006234:	1cd76463          	bltu	a4,a3,800063fc <__memset+0x1f4>
    80006238:	1a078e63          	beqz	a5,800063f4 <__memset+0x1ec>
    8000623c:	00b50023          	sb	a1,0(a0)
    80006240:	00100713          	li	a4,1
    80006244:	1ae78463          	beq	a5,a4,800063ec <__memset+0x1e4>
    80006248:	00b500a3          	sb	a1,1(a0)
    8000624c:	00200713          	li	a4,2
    80006250:	1ae78a63          	beq	a5,a4,80006404 <__memset+0x1fc>
    80006254:	00b50123          	sb	a1,2(a0)
    80006258:	00300713          	li	a4,3
    8000625c:	18e78463          	beq	a5,a4,800063e4 <__memset+0x1dc>
    80006260:	00b501a3          	sb	a1,3(a0)
    80006264:	00400713          	li	a4,4
    80006268:	1ae78263          	beq	a5,a4,8000640c <__memset+0x204>
    8000626c:	00b50223          	sb	a1,4(a0)
    80006270:	00500713          	li	a4,5
    80006274:	1ae78063          	beq	a5,a4,80006414 <__memset+0x20c>
    80006278:	00b502a3          	sb	a1,5(a0)
    8000627c:	00700713          	li	a4,7
    80006280:	18e79e63          	bne	a5,a4,8000641c <__memset+0x214>
    80006284:	00b50323          	sb	a1,6(a0)
    80006288:	00700e93          	li	t4,7
    8000628c:	00859713          	slli	a4,a1,0x8
    80006290:	00e5e733          	or	a4,a1,a4
    80006294:	01059e13          	slli	t3,a1,0x10
    80006298:	01c76e33          	or	t3,a4,t3
    8000629c:	01859313          	slli	t1,a1,0x18
    800062a0:	006e6333          	or	t1,t3,t1
    800062a4:	02059893          	slli	a7,a1,0x20
    800062a8:	40f60e3b          	subw	t3,a2,a5
    800062ac:	011368b3          	or	a7,t1,a7
    800062b0:	02859813          	slli	a6,a1,0x28
    800062b4:	0108e833          	or	a6,a7,a6
    800062b8:	03059693          	slli	a3,a1,0x30
    800062bc:	003e589b          	srliw	a7,t3,0x3
    800062c0:	00d866b3          	or	a3,a6,a3
    800062c4:	03859713          	slli	a4,a1,0x38
    800062c8:	00389813          	slli	a6,a7,0x3
    800062cc:	00f507b3          	add	a5,a0,a5
    800062d0:	00e6e733          	or	a4,a3,a4
    800062d4:	000e089b          	sext.w	a7,t3
    800062d8:	00f806b3          	add	a3,a6,a5
    800062dc:	00e7b023          	sd	a4,0(a5)
    800062e0:	00878793          	addi	a5,a5,8
    800062e4:	fed79ce3          	bne	a5,a3,800062dc <__memset+0xd4>
    800062e8:	ff8e7793          	andi	a5,t3,-8
    800062ec:	0007871b          	sext.w	a4,a5
    800062f0:	01d787bb          	addw	a5,a5,t4
    800062f4:	0ce88e63          	beq	a7,a4,800063d0 <__memset+0x1c8>
    800062f8:	00f50733          	add	a4,a0,a5
    800062fc:	00b70023          	sb	a1,0(a4)
    80006300:	0017871b          	addiw	a4,a5,1
    80006304:	0cc77663          	bgeu	a4,a2,800063d0 <__memset+0x1c8>
    80006308:	00e50733          	add	a4,a0,a4
    8000630c:	00b70023          	sb	a1,0(a4)
    80006310:	0027871b          	addiw	a4,a5,2
    80006314:	0ac77e63          	bgeu	a4,a2,800063d0 <__memset+0x1c8>
    80006318:	00e50733          	add	a4,a0,a4
    8000631c:	00b70023          	sb	a1,0(a4)
    80006320:	0037871b          	addiw	a4,a5,3
    80006324:	0ac77663          	bgeu	a4,a2,800063d0 <__memset+0x1c8>
    80006328:	00e50733          	add	a4,a0,a4
    8000632c:	00b70023          	sb	a1,0(a4)
    80006330:	0047871b          	addiw	a4,a5,4
    80006334:	08c77e63          	bgeu	a4,a2,800063d0 <__memset+0x1c8>
    80006338:	00e50733          	add	a4,a0,a4
    8000633c:	00b70023          	sb	a1,0(a4)
    80006340:	0057871b          	addiw	a4,a5,5
    80006344:	08c77663          	bgeu	a4,a2,800063d0 <__memset+0x1c8>
    80006348:	00e50733          	add	a4,a0,a4
    8000634c:	00b70023          	sb	a1,0(a4)
    80006350:	0067871b          	addiw	a4,a5,6
    80006354:	06c77e63          	bgeu	a4,a2,800063d0 <__memset+0x1c8>
    80006358:	00e50733          	add	a4,a0,a4
    8000635c:	00b70023          	sb	a1,0(a4)
    80006360:	0077871b          	addiw	a4,a5,7
    80006364:	06c77663          	bgeu	a4,a2,800063d0 <__memset+0x1c8>
    80006368:	00e50733          	add	a4,a0,a4
    8000636c:	00b70023          	sb	a1,0(a4)
    80006370:	0087871b          	addiw	a4,a5,8
    80006374:	04c77e63          	bgeu	a4,a2,800063d0 <__memset+0x1c8>
    80006378:	00e50733          	add	a4,a0,a4
    8000637c:	00b70023          	sb	a1,0(a4)
    80006380:	0097871b          	addiw	a4,a5,9
    80006384:	04c77663          	bgeu	a4,a2,800063d0 <__memset+0x1c8>
    80006388:	00e50733          	add	a4,a0,a4
    8000638c:	00b70023          	sb	a1,0(a4)
    80006390:	00a7871b          	addiw	a4,a5,10
    80006394:	02c77e63          	bgeu	a4,a2,800063d0 <__memset+0x1c8>
    80006398:	00e50733          	add	a4,a0,a4
    8000639c:	00b70023          	sb	a1,0(a4)
    800063a0:	00b7871b          	addiw	a4,a5,11
    800063a4:	02c77663          	bgeu	a4,a2,800063d0 <__memset+0x1c8>
    800063a8:	00e50733          	add	a4,a0,a4
    800063ac:	00b70023          	sb	a1,0(a4)
    800063b0:	00c7871b          	addiw	a4,a5,12
    800063b4:	00c77e63          	bgeu	a4,a2,800063d0 <__memset+0x1c8>
    800063b8:	00e50733          	add	a4,a0,a4
    800063bc:	00b70023          	sb	a1,0(a4)
    800063c0:	00d7879b          	addiw	a5,a5,13
    800063c4:	00c7f663          	bgeu	a5,a2,800063d0 <__memset+0x1c8>
    800063c8:	00f507b3          	add	a5,a0,a5
    800063cc:	00b78023          	sb	a1,0(a5)
    800063d0:	00813403          	ld	s0,8(sp)
    800063d4:	01010113          	addi	sp,sp,16
    800063d8:	00008067          	ret
    800063dc:	00b00693          	li	a3,11
    800063e0:	e55ff06f          	j	80006234 <__memset+0x2c>
    800063e4:	00300e93          	li	t4,3
    800063e8:	ea5ff06f          	j	8000628c <__memset+0x84>
    800063ec:	00100e93          	li	t4,1
    800063f0:	e9dff06f          	j	8000628c <__memset+0x84>
    800063f4:	00000e93          	li	t4,0
    800063f8:	e95ff06f          	j	8000628c <__memset+0x84>
    800063fc:	00000793          	li	a5,0
    80006400:	ef9ff06f          	j	800062f8 <__memset+0xf0>
    80006404:	00200e93          	li	t4,2
    80006408:	e85ff06f          	j	8000628c <__memset+0x84>
    8000640c:	00400e93          	li	t4,4
    80006410:	e7dff06f          	j	8000628c <__memset+0x84>
    80006414:	00500e93          	li	t4,5
    80006418:	e75ff06f          	j	8000628c <__memset+0x84>
    8000641c:	00600e93          	li	t4,6
    80006420:	e6dff06f          	j	8000628c <__memset+0x84>

0000000080006424 <__memmove>:
    80006424:	ff010113          	addi	sp,sp,-16
    80006428:	00813423          	sd	s0,8(sp)
    8000642c:	01010413          	addi	s0,sp,16
    80006430:	0e060863          	beqz	a2,80006520 <__memmove+0xfc>
    80006434:	fff6069b          	addiw	a3,a2,-1
    80006438:	0006881b          	sext.w	a6,a3
    8000643c:	0ea5e863          	bltu	a1,a0,8000652c <__memmove+0x108>
    80006440:	00758713          	addi	a4,a1,7
    80006444:	00a5e7b3          	or	a5,a1,a0
    80006448:	40a70733          	sub	a4,a4,a0
    8000644c:	0077f793          	andi	a5,a5,7
    80006450:	00f73713          	sltiu	a4,a4,15
    80006454:	00174713          	xori	a4,a4,1
    80006458:	0017b793          	seqz	a5,a5
    8000645c:	00e7f7b3          	and	a5,a5,a4
    80006460:	10078863          	beqz	a5,80006570 <__memmove+0x14c>
    80006464:	00900793          	li	a5,9
    80006468:	1107f463          	bgeu	a5,a6,80006570 <__memmove+0x14c>
    8000646c:	0036581b          	srliw	a6,a2,0x3
    80006470:	fff8081b          	addiw	a6,a6,-1
    80006474:	02081813          	slli	a6,a6,0x20
    80006478:	01d85893          	srli	a7,a6,0x1d
    8000647c:	00858813          	addi	a6,a1,8
    80006480:	00058793          	mv	a5,a1
    80006484:	00050713          	mv	a4,a0
    80006488:	01088833          	add	a6,a7,a6
    8000648c:	0007b883          	ld	a7,0(a5)
    80006490:	00878793          	addi	a5,a5,8
    80006494:	00870713          	addi	a4,a4,8
    80006498:	ff173c23          	sd	a7,-8(a4)
    8000649c:	ff0798e3          	bne	a5,a6,8000648c <__memmove+0x68>
    800064a0:	ff867713          	andi	a4,a2,-8
    800064a4:	02071793          	slli	a5,a4,0x20
    800064a8:	0207d793          	srli	a5,a5,0x20
    800064ac:	00f585b3          	add	a1,a1,a5
    800064b0:	40e686bb          	subw	a3,a3,a4
    800064b4:	00f507b3          	add	a5,a0,a5
    800064b8:	06e60463          	beq	a2,a4,80006520 <__memmove+0xfc>
    800064bc:	0005c703          	lbu	a4,0(a1)
    800064c0:	00e78023          	sb	a4,0(a5)
    800064c4:	04068e63          	beqz	a3,80006520 <__memmove+0xfc>
    800064c8:	0015c603          	lbu	a2,1(a1)
    800064cc:	00100713          	li	a4,1
    800064d0:	00c780a3          	sb	a2,1(a5)
    800064d4:	04e68663          	beq	a3,a4,80006520 <__memmove+0xfc>
    800064d8:	0025c603          	lbu	a2,2(a1)
    800064dc:	00200713          	li	a4,2
    800064e0:	00c78123          	sb	a2,2(a5)
    800064e4:	02e68e63          	beq	a3,a4,80006520 <__memmove+0xfc>
    800064e8:	0035c603          	lbu	a2,3(a1)
    800064ec:	00300713          	li	a4,3
    800064f0:	00c781a3          	sb	a2,3(a5)
    800064f4:	02e68663          	beq	a3,a4,80006520 <__memmove+0xfc>
    800064f8:	0045c603          	lbu	a2,4(a1)
    800064fc:	00400713          	li	a4,4
    80006500:	00c78223          	sb	a2,4(a5)
    80006504:	00e68e63          	beq	a3,a4,80006520 <__memmove+0xfc>
    80006508:	0055c603          	lbu	a2,5(a1)
    8000650c:	00500713          	li	a4,5
    80006510:	00c782a3          	sb	a2,5(a5)
    80006514:	00e68663          	beq	a3,a4,80006520 <__memmove+0xfc>
    80006518:	0065c703          	lbu	a4,6(a1)
    8000651c:	00e78323          	sb	a4,6(a5)
    80006520:	00813403          	ld	s0,8(sp)
    80006524:	01010113          	addi	sp,sp,16
    80006528:	00008067          	ret
    8000652c:	02061713          	slli	a4,a2,0x20
    80006530:	02075713          	srli	a4,a4,0x20
    80006534:	00e587b3          	add	a5,a1,a4
    80006538:	f0f574e3          	bgeu	a0,a5,80006440 <__memmove+0x1c>
    8000653c:	02069613          	slli	a2,a3,0x20
    80006540:	02065613          	srli	a2,a2,0x20
    80006544:	fff64613          	not	a2,a2
    80006548:	00e50733          	add	a4,a0,a4
    8000654c:	00c78633          	add	a2,a5,a2
    80006550:	fff7c683          	lbu	a3,-1(a5)
    80006554:	fff78793          	addi	a5,a5,-1
    80006558:	fff70713          	addi	a4,a4,-1
    8000655c:	00d70023          	sb	a3,0(a4)
    80006560:	fec798e3          	bne	a5,a2,80006550 <__memmove+0x12c>
    80006564:	00813403          	ld	s0,8(sp)
    80006568:	01010113          	addi	sp,sp,16
    8000656c:	00008067          	ret
    80006570:	02069713          	slli	a4,a3,0x20
    80006574:	02075713          	srli	a4,a4,0x20
    80006578:	00170713          	addi	a4,a4,1
    8000657c:	00e50733          	add	a4,a0,a4
    80006580:	00050793          	mv	a5,a0
    80006584:	0005c683          	lbu	a3,0(a1)
    80006588:	00178793          	addi	a5,a5,1
    8000658c:	00158593          	addi	a1,a1,1
    80006590:	fed78fa3          	sb	a3,-1(a5)
    80006594:	fee798e3          	bne	a5,a4,80006584 <__memmove+0x160>
    80006598:	f89ff06f          	j	80006520 <__memmove+0xfc>

000000008000659c <__putc>:
    8000659c:	fe010113          	addi	sp,sp,-32
    800065a0:	00813823          	sd	s0,16(sp)
    800065a4:	00113c23          	sd	ra,24(sp)
    800065a8:	02010413          	addi	s0,sp,32
    800065ac:	00050793          	mv	a5,a0
    800065b0:	fef40593          	addi	a1,s0,-17
    800065b4:	00100613          	li	a2,1
    800065b8:	00000513          	li	a0,0
    800065bc:	fef407a3          	sb	a5,-17(s0)
    800065c0:	fffff097          	auipc	ra,0xfffff
    800065c4:	b3c080e7          	jalr	-1220(ra) # 800050fc <console_write>
    800065c8:	01813083          	ld	ra,24(sp)
    800065cc:	01013403          	ld	s0,16(sp)
    800065d0:	02010113          	addi	sp,sp,32
    800065d4:	00008067          	ret

00000000800065d8 <__getc>:
    800065d8:	fe010113          	addi	sp,sp,-32
    800065dc:	00813823          	sd	s0,16(sp)
    800065e0:	00113c23          	sd	ra,24(sp)
    800065e4:	02010413          	addi	s0,sp,32
    800065e8:	fe840593          	addi	a1,s0,-24
    800065ec:	00100613          	li	a2,1
    800065f0:	00000513          	li	a0,0
    800065f4:	fffff097          	auipc	ra,0xfffff
    800065f8:	ae8080e7          	jalr	-1304(ra) # 800050dc <console_read>
    800065fc:	fe844503          	lbu	a0,-24(s0)
    80006600:	01813083          	ld	ra,24(sp)
    80006604:	01013403          	ld	s0,16(sp)
    80006608:	02010113          	addi	sp,sp,32
    8000660c:	00008067          	ret

0000000080006610 <console_handler>:
    80006610:	fe010113          	addi	sp,sp,-32
    80006614:	00813823          	sd	s0,16(sp)
    80006618:	00113c23          	sd	ra,24(sp)
    8000661c:	00913423          	sd	s1,8(sp)
    80006620:	02010413          	addi	s0,sp,32
    80006624:	14202773          	csrr	a4,scause
    80006628:	100027f3          	csrr	a5,sstatus
    8000662c:	0027f793          	andi	a5,a5,2
    80006630:	06079e63          	bnez	a5,800066ac <console_handler+0x9c>
    80006634:	00074c63          	bltz	a4,8000664c <console_handler+0x3c>
    80006638:	01813083          	ld	ra,24(sp)
    8000663c:	01013403          	ld	s0,16(sp)
    80006640:	00813483          	ld	s1,8(sp)
    80006644:	02010113          	addi	sp,sp,32
    80006648:	00008067          	ret
    8000664c:	0ff77713          	andi	a4,a4,255
    80006650:	00900793          	li	a5,9
    80006654:	fef712e3          	bne	a4,a5,80006638 <console_handler+0x28>
    80006658:	ffffe097          	auipc	ra,0xffffe
    8000665c:	6dc080e7          	jalr	1756(ra) # 80004d34 <plic_claim>
    80006660:	00a00793          	li	a5,10
    80006664:	00050493          	mv	s1,a0
    80006668:	02f50c63          	beq	a0,a5,800066a0 <console_handler+0x90>
    8000666c:	fc0506e3          	beqz	a0,80006638 <console_handler+0x28>
    80006670:	00050593          	mv	a1,a0
    80006674:	00001517          	auipc	a0,0x1
    80006678:	e3450513          	addi	a0,a0,-460 # 800074a8 <CONSOLE_STATUS+0x498>
    8000667c:	fffff097          	auipc	ra,0xfffff
    80006680:	afc080e7          	jalr	-1284(ra) # 80005178 <__printf>
    80006684:	01013403          	ld	s0,16(sp)
    80006688:	01813083          	ld	ra,24(sp)
    8000668c:	00048513          	mv	a0,s1
    80006690:	00813483          	ld	s1,8(sp)
    80006694:	02010113          	addi	sp,sp,32
    80006698:	ffffe317          	auipc	t1,0xffffe
    8000669c:	6d430067          	jr	1748(t1) # 80004d6c <plic_complete>
    800066a0:	fffff097          	auipc	ra,0xfffff
    800066a4:	3e0080e7          	jalr	992(ra) # 80005a80 <uartintr>
    800066a8:	fddff06f          	j	80006684 <console_handler+0x74>
    800066ac:	00001517          	auipc	a0,0x1
    800066b0:	efc50513          	addi	a0,a0,-260 # 800075a8 <digits+0x78>
    800066b4:	fffff097          	auipc	ra,0xfffff
    800066b8:	a68080e7          	jalr	-1432(ra) # 8000511c <panic>
	...
