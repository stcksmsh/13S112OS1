
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00008117          	auipc	sp,0x8
    80000004:	fc813103          	ld	sp,-56(sp) # 80007fc8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	6a1030ef          	jal	ra,80003ebc <start>

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
    8000107c:	414020ef          	jal	ra,80003490 <exceptionHandler>


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
    8000111c:	f187b783          	ld	a5,-232(a5) # 80008030 <_ZN5Timer8instanceE>
    80001120:	02079463          	bnez	a5,80001148 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80001124:	00007797          	auipc	a5,0x7
    80001128:	f097b623          	sd	s1,-244(a5) # 80008030 <_ZN5Timer8instanceE>
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
    80001164:	00001097          	auipc	ra,0x1
    80001168:	824080e7          	jalr	-2012(ra) # 80001988 <_Z13assert_failedPKcS0_jS0_>
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
    80001194:	2c4080e7          	jalr	708(ra) # 80001454 <_Z8mem_freePv>
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
    800011bc:	e787b783          	ld	a5,-392(a5) # 80008030 <_ZN5Timer8instanceE>
    800011c0:	00078863          	beqz	a5,800011d0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800011c4:	00007517          	auipc	a0,0x7
    800011c8:	e6c53503          	ld	a0,-404(a0) # 80008030 <_ZN5Timer8instanceE>
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
    80001200:	78c080e7          	jalr	1932(ra) # 80001988 <_Z13assert_failedPKcS0_jS0_>
}
    80001204:	00007517          	auipc	a0,0x7
    80001208:	e2c53503          	ld	a0,-468(a0) # 80008030 <_ZN5Timer8instanceE>
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
    if(time % 10 == 0){
    80001248:	00a00713          	li	a4,10
    8000124c:	02e7f7b3          	remu	a5,a5,a4
    80001250:	00078663          	beqz	a5,8000125c <_ZN5Timer4tickEv+0x40>
        __putc('i');
        __putc('c');
        __putc('k');
        __putc('\n');
    }
    threadSleepWrapper* current = sleepingHead;
    80001254:	00093483          	ld	s1,0(s2)
    80001258:	0640006f          	j	800012bc <_ZN5Timer4tickEv+0xa0>
        __putc('\n');
    8000125c:	00a00513          	li	a0,10
    80001260:	00005097          	auipc	ra,0x5
    80001264:	d1c080e7          	jalr	-740(ra) # 80005f7c <__putc>
        __putc('t');
    80001268:	07400513          	li	a0,116
    8000126c:	00005097          	auipc	ra,0x5
    80001270:	d10080e7          	jalr	-752(ra) # 80005f7c <__putc>
        __putc('i');
    80001274:	06900513          	li	a0,105
    80001278:	00005097          	auipc	ra,0x5
    8000127c:	d04080e7          	jalr	-764(ra) # 80005f7c <__putc>
        __putc('c');
    80001280:	06300513          	li	a0,99
    80001284:	00005097          	auipc	ra,0x5
    80001288:	cf8080e7          	jalr	-776(ra) # 80005f7c <__putc>
        __putc('k');
    8000128c:	06b00513          	li	a0,107
    80001290:	00005097          	auipc	ra,0x5
    80001294:	cec080e7          	jalr	-788(ra) # 80005f7c <__putc>
        __putc('\n');
    80001298:	00a00513          	li	a0,10
    8000129c:	00005097          	auipc	ra,0x5
    800012a0:	ce0080e7          	jalr	-800(ra) # 80005f7c <__putc>
    800012a4:	fb1ff06f          	j	80001254 <_ZN5Timer4tickEv+0x38>
            __putc('\n');
            current->thread->setSleeping(false);
            Scheduler::put(current->thread);
            threadSleepWrapper* next = current->next;
            if(current == sleepingHead){
                sleepingHead = next;
    800012a8:	01393023          	sd	s3,0(s2)
            }
            mem_free(current);
    800012ac:	00048513          	mv	a0,s1
    800012b0:	00000097          	auipc	ra,0x0
    800012b4:	1a4080e7          	jalr	420(ra) # 80001454 <_Z8mem_freePv>
            current = next;
    800012b8:	00098493          	mv	s1,s3
    while(current != 0){
    800012bc:	06048c63          	beqz	s1,80001334 <_ZN5Timer4tickEv+0x118>
        if(current->wakeUpTime <= time){
    800012c0:	0084b703          	ld	a4,8(s1)
    800012c4:	00893783          	ld	a5,8(s2)
    800012c8:	06e7e663          	bltu	a5,a4,80001334 <_ZN5Timer4tickEv+0x118>
            __putc('\n');
    800012cc:	00a00513          	li	a0,10
    800012d0:	00005097          	auipc	ra,0x5
    800012d4:	cac080e7          	jalr	-852(ra) # 80005f7c <__putc>
            __putc('t');
    800012d8:	07400513          	li	a0,116
    800012dc:	00005097          	auipc	ra,0x5
    800012e0:	ca0080e7          	jalr	-864(ra) # 80005f7c <__putc>
            __putc('0' + current->thread->ID);
    800012e4:	0004b783          	ld	a5,0(s1)
    800012e8:	0007a503          	lw	a0,0(a5)
    800012ec:	0305051b          	addiw	a0,a0,48
    800012f0:	0ff57513          	andi	a0,a0,255
    800012f4:	00005097          	auipc	ra,0x5
    800012f8:	c88080e7          	jalr	-888(ra) # 80005f7c <__putc>
            __putc('\n');
    800012fc:	00a00513          	li	a0,10
    80001300:	00005097          	auipc	ra,0x5
    80001304:	c7c080e7          	jalr	-900(ra) # 80005f7c <__putc>
            current->thread->setSleeping(false);
    80001308:	00000593          	li	a1,0
    8000130c:	0004b503          	ld	a0,0(s1)
    80001310:	00001097          	auipc	ra,0x1
    80001314:	430080e7          	jalr	1072(ra) # 80002740 <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    80001318:	0004b503          	ld	a0,0(s1)
    8000131c:	00003097          	auipc	ra,0x3
    80001320:	828080e7          	jalr	-2008(ra) # 80003b44 <_ZN9Scheduler3putEP7_thread>
            threadSleepWrapper* next = current->next;
    80001324:	0104b983          	ld	s3,16(s1)
            if(current == sleepingHead){
    80001328:	00093783          	ld	a5,0(s2)
    8000132c:	f89790e3          	bne	a5,s1,800012ac <_ZN5Timer4tickEv+0x90>
    80001330:	f79ff06f          	j	800012a8 <_ZN5Timer4tickEv+0x8c>
        }else{
            break;
        }
    }
}
    80001334:	02813083          	ld	ra,40(sp)
    80001338:	02013403          	ld	s0,32(sp)
    8000133c:	01813483          	ld	s1,24(sp)
    80001340:	01013903          	ld	s2,16(sp)
    80001344:	00813983          	ld	s3,8(sp)
    80001348:	03010113          	addi	sp,sp,48
    8000134c:	00008067          	ret

0000000080001350 <_ZN5Timer5sleepEm>:

int Timer::sleep(time_t timeToSleep){
    80001350:	fd010113          	addi	sp,sp,-48
    80001354:	02113423          	sd	ra,40(sp)
    80001358:	02813023          	sd	s0,32(sp)
    8000135c:	00913c23          	sd	s1,24(sp)
    80001360:	01213823          	sd	s2,16(sp)
    80001364:	01313423          	sd	s3,8(sp)
    80001368:	03010413          	addi	s0,sp,48
    8000136c:	00050493          	mv	s1,a0
    80001370:	00058913          	mv	s2,a1
    thread_t thread = _thread::currentThread;
    80001374:	00007797          	auipc	a5,0x7
    80001378:	c6c7b783          	ld	a5,-916(a5) # 80007fe0 <_GLOBAL_OFFSET_TABLE_+0x38>
    8000137c:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)mem_alloc(sizeof(threadSleepWrapper));
    80001380:	01800513          	li	a0,24
    80001384:	00000097          	auipc	ra,0x0
    80001388:	0a0080e7          	jalr	160(ra) # 80001424 <_Z9mem_allocm>
    newSleepingThread->thread = thread;
    8000138c:	01353023          	sd	s3,0(a0)
    newSleepingThread->wakeUpTime = time + timeToSleep;
    80001390:	0084b783          	ld	a5,8(s1)
    80001394:	012785b3          	add	a1,a5,s2
    80001398:	00b53423          	sd	a1,8(a0)
    newSleepingThread->next = 0;
    8000139c:	00053823          	sd	zero,16(a0)

    if(sleepingHead == 0){
    800013a0:	0004b783          	ld	a5,0(s1)
    800013a4:	04078c63          	beqz	a5,800013fc <_ZN5Timer5sleepEm+0xac>
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
    800013a8:	00078693          	mv	a3,a5
    800013ac:	0107b783          	ld	a5,16(a5)
    800013b0:	00078663          	beqz	a5,800013bc <_ZN5Timer5sleepEm+0x6c>
    800013b4:	0087b703          	ld	a4,8(a5)
    800013b8:	feb768e3          	bltu	a4,a1,800013a8 <_ZN5Timer5sleepEm+0x58>
            current = current->next;
        }
        newSleepingThread->next = current->next;
    800013bc:	00f53823          	sd	a5,16(a0)
        current->next = newSleepingThread;
    800013c0:	00a6b823          	sd	a0,16(a3)
    }
    thread->setSleeping(true);
    800013c4:	00100593          	li	a1,1
    800013c8:	00098513          	mv	a0,s3
    800013cc:	00001097          	auipc	ra,0x1
    800013d0:	374080e7          	jalr	884(ra) # 80002740 <_ZN7_thread11setSleepingEb>
    thread_dispatch();
    800013d4:	00000097          	auipc	ra,0x0
    800013d8:	148080e7          	jalr	328(ra) # 8000151c <_Z15thread_dispatchv>
    return 0;
}
    800013dc:	00000513          	li	a0,0
    800013e0:	02813083          	ld	ra,40(sp)
    800013e4:	02013403          	ld	s0,32(sp)
    800013e8:	01813483          	ld	s1,24(sp)
    800013ec:	01013903          	ld	s2,16(sp)
    800013f0:	00813983          	ld	s3,8(sp)
    800013f4:	03010113          	addi	sp,sp,48
    800013f8:	00008067          	ret
        sleepingHead = newSleepingThread;
    800013fc:	00a4b023          	sd	a0,0(s1)
    80001400:	fc5ff06f          	j	800013c4 <_ZN5Timer5sleepEm+0x74>

0000000080001404 <_ZN5Timer17noSleepingThreadsEv>:

bool Timer::noSleepingThreads(){
    80001404:	ff010113          	addi	sp,sp,-16
    80001408:	00813423          	sd	s0,8(sp)
    8000140c:	01010413          	addi	s0,sp,16
    return sleepingHead == 0;
    80001410:	00053503          	ld	a0,0(a0)
    80001414:	00153513          	seqz	a0,a0
    80001418:	00813403          	ld	s0,8(sp)
    8000141c:	01010113          	addi	sp,sp,16
    80001420:	00008067          	ret

0000000080001424 <_Z9mem_allocm>:
 */

#include "syscalls_c.h"
#include "console.h"

void* mem_alloc ( size_t nSize ){
    80001424:	ff010113          	addi	sp,sp,-16
    80001428:	00813423          	sd	s0,8(sp)
    8000142c:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001430:	03f50513          	addi	a0,a0,63
    80001434:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    80001438:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    8000143c:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    80001440:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    80001444:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    80001448:	00813403          	ld	s0,8(sp)
    8000144c:	01010113          	addi	sp,sp,16
    80001450:	00008067          	ret

0000000080001454 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    80001454:	ff010113          	addi	sp,sp,-16
    80001458:	00813423          	sd	s0,8(sp)
    8000145c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    80001460:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    80001464:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    80001468:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    8000146c:	00050513          	mv	a0,a0
    return nResult;

}
    80001470:	0005051b          	sext.w	a0,a0
    80001474:	00813403          	ld	s0,8(sp)
    80001478:	01010113          	addi	sp,sp,16
    8000147c:	00008067          	ret

0000000080001480 <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg ) {
    80001480:	fd010113          	addi	sp,sp,-48
    80001484:	02113423          	sd	ra,40(sp)
    80001488:	02813023          	sd	s0,32(sp)
    8000148c:	00913c23          	sd	s1,24(sp)
    80001490:	01213823          	sd	s2,16(sp)
    80001494:	01313423          	sd	s3,8(sp)
    80001498:	03010413          	addi	s0,sp,48
    8000149c:	00050493          	mv	s1,a0
    800014a0:	00058913          	mv	s2,a1
    800014a4:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    800014a8:	00001537          	lui	a0,0x1
    800014ac:	00000097          	auipc	ra,0x0
    800014b0:	f78080e7          	jalr	-136(ra) # 80001424 <_Z9mem_allocm>
    /// now we move the pointer up, since SP points to the first free location, and grows down
    __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space + DEFAULT_STACK_SIZE));
    800014b4:	000017b7          	lui	a5,0x1
    800014b8:	00f50533          	add	a0,a0,a5
    800014bc:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    800014c0:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    800014c4:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    800014c8:	00048593          	mv	a1,s1
    __asm__ volatile("li a0,0x11");
    800014cc:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    800014d0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800014d4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800014d8:	0005051b          	sext.w	a0,a0
    800014dc:	02813083          	ld	ra,40(sp)
    800014e0:	02013403          	ld	s0,32(sp)
    800014e4:	01813483          	ld	s1,24(sp)
    800014e8:	01013903          	ld	s2,16(sp)
    800014ec:	00813983          	ld	s3,8(sp)
    800014f0:	03010113          	addi	sp,sp,48
    800014f4:	00008067          	ret

00000000800014f8 <_Z11thread_exitv>:

// int thread_createCPP ( thread_t*, void(*)(void*), void* );

int thread_exit (){
    800014f8:	ff010113          	addi	sp,sp,-16
    800014fc:	00813423          	sd	s0,8(sp)
    80001500:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    80001504:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80001508:	00000073          	ecall
    return 0;
}
    8000150c:	00000513          	li	a0,0
    80001510:	00813403          	ld	s0,8(sp)
    80001514:	01010113          	addi	sp,sp,16
    80001518:	00008067          	ret

000000008000151c <_Z15thread_dispatchv>:

void thread_dispatch () {
    8000151c:	ff010113          	addi	sp,sp,-16
    80001520:	00813423          	sd	s0,8(sp)
    80001524:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    80001528:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    8000152c:	00000073          	ecall
}
    80001530:	00813403          	ld	s0,8(sp)
    80001534:	01010113          	addi	sp,sp,16
    80001538:	00008067          	ret

000000008000153c <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    8000153c:	ff010113          	addi	sp,sp,-16
    80001540:	00813423          	sd	s0,8(sp)
    80001544:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    80001548:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    8000154c:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    80001550:	00000073          	ecall
}
    80001554:	00813403          	ld	s0,8(sp)
    80001558:	01010113          	addi	sp,sp,16
    8000155c:	00008067          	ret

0000000080001560 <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    80001560:	ff010113          	addi	sp,sp,-16
    80001564:	00813423          	sd	s0,8(sp)
    80001568:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    8000156c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    80001570:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001574:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001578:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    8000157c:	0005051b          	sext.w	a0,a0
    80001580:	00813403          	ld	s0,8(sp)
    80001584:	01010113          	addi	sp,sp,16
    80001588:	00008067          	ret

000000008000158c <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    8000158c:	ff010113          	addi	sp,sp,-16
    80001590:	00813423          	sd	s0,8(sp)
    80001594:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    80001598:	02059593          	slli	a1,a1,0x20
    8000159c:	0205d593          	srli	a1,a1,0x20
    800015a0:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    800015a4:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    800015a8:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    800015ac:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800015b0:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800015b4:	0005051b          	sext.w	a0,a0
    800015b8:	00813403          	ld	s0,8(sp)
    800015bc:	01010113          	addi	sp,sp,16
    800015c0:	00008067          	ret

00000000800015c4 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    800015c4:	ff010113          	addi	sp,sp,-16
    800015c8:	00813423          	sd	s0,8(sp)
    800015cc:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800015d0:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    800015d4:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    800015d8:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800015dc:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800015e0:	0005051b          	sext.w	a0,a0
    800015e4:	00813403          	ld	s0,8(sp)
    800015e8:	01010113          	addi	sp,sp,16
    800015ec:	00008067          	ret

00000000800015f0 <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    800015f0:	ff010113          	addi	sp,sp,-16
    800015f4:	00813423          	sd	s0,8(sp)
    800015f8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800015fc:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    80001600:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001604:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001608:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    8000160c:	0005051b          	sext.w	a0,a0
    80001610:	00813403          	ld	s0,8(sp)
    80001614:	01010113          	addi	sp,sp,16
    80001618:	00008067          	ret

000000008000161c <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    8000161c:	ff010113          	addi	sp,sp,-16
    80001620:	00813423          	sd	s0,8(sp)
    80001624:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001628:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    8000162c:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    80001630:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001634:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001638:	0005051b          	sext.w	a0,a0
    8000163c:	00813403          	ld	s0,8(sp)
    80001640:	01010113          	addi	sp,sp,16
    80001644:	00008067          	ret

0000000080001648 <_Z4getcv>:

char getc() {
    80001648:	ff010113          	addi	sp,sp,-16
    8000164c:	00813423          	sd	s0,8(sp)
    80001650:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    80001654:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    80001658:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    8000165c:	00050513          	mv	a0,a0
    return chr;
}
    80001660:	0ff57513          	andi	a0,a0,255
    80001664:	00813403          	ld	s0,8(sp)
    80001668:	01010113          	addi	sp,sp,16
    8000166c:	00008067          	ret

0000000080001670 <_Z4putcc>:

#include "console.h"

void putc(char chr ) {
    80001670:	ff010113          	addi	sp,sp,-16
    80001674:	00813423          	sd	s0,8(sp)
    80001678:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    8000167c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    80001680:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80001684:	00000073          	ecall
    80001688:	00813403          	ld	s0,8(sp)
    8000168c:	01010113          	addi	sp,sp,16
    80001690:	00008067          	ret

0000000080001694 <_ZN4_sem4openEPPS_j>:
#include "syscalls_c.h"
#include "assert.h"
#include "sched.h"
#include "console.h"

void _sem::open(_sem** handle, unsigned init){
    80001694:	fe010113          	addi	sp,sp,-32
    80001698:	00113c23          	sd	ra,24(sp)
    8000169c:	00813823          	sd	s0,16(sp)
    800016a0:	00913423          	sd	s1,8(sp)
    800016a4:	01213023          	sd	s2,0(sp)
    800016a8:	02010413          	addi	s0,sp,32
    800016ac:	00050493          	mv	s1,a0
    800016b0:	00058913          	mv	s2,a1
    (*handle) = (sem_t)mem_alloc(sizeof(_sem));
    800016b4:	01800513          	li	a0,24
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	d6c080e7          	jalr	-660(ra) # 80001424 <_Z9mem_allocm>
    800016c0:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    800016c4:	00053023          	sd	zero,0(a0) # 1000 <_entry-0x7ffff000>
    (*handle)->blockTail = 0;
    800016c8:	0004b783          	ld	a5,0(s1)
    800016cc:	0007b423          	sd	zero,8(a5) # 1008 <_entry-0x7fffeff8>
    (*handle)->value = init;
    800016d0:	0004b783          	ld	a5,0(s1)
    800016d4:	0127a823          	sw	s2,16(a5)
}
    800016d8:	01813083          	ld	ra,24(sp)
    800016dc:	01013403          	ld	s0,16(sp)
    800016e0:	00813483          	ld	s1,8(sp)
    800016e4:	00013903          	ld	s2,0(sp)
    800016e8:	02010113          	addi	sp,sp,32
    800016ec:	00008067          	ret

00000000800016f0 <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    800016f0:	fe010113          	addi	sp,sp,-32
    800016f4:	00113c23          	sd	ra,24(sp)
    800016f8:	00813823          	sd	s0,16(sp)
    800016fc:	00913423          	sd	s1,8(sp)
    80001700:	02010413          	addi	s0,sp,32
    80001704:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    80001708:	0004b783          	ld	a5,0(s1)
    8000170c:	02078863          	beqz	a5,8000173c <_ZN4_sem5closeEPS_+0x4c>
        id->blockHead->pThread->setClosed(true);
    80001710:	00100593          	li	a1,1
    80001714:	0007b503          	ld	a0,0(a5)
    80001718:	00001097          	auipc	ra,0x1
    8000171c:	ffc080e7          	jalr	-4(ra) # 80002714 <_ZN7_thread9setClosedEb>
        mem_free(id->blockHead);
    80001720:	0004b503          	ld	a0,0(s1)
    80001724:	00000097          	auipc	ra,0x0
    80001728:	d30080e7          	jalr	-720(ra) # 80001454 <_Z8mem_freePv>
        id->blockHead = id->blockHead->pNext;
    8000172c:	0004b783          	ld	a5,0(s1)
    80001730:	0087b783          	ld	a5,8(a5)
    80001734:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    80001738:	fd1ff06f          	j	80001708 <_ZN4_sem5closeEPS_+0x18>
    }
}
    8000173c:	01813083          	ld	ra,24(sp)
    80001740:	01013403          	ld	s0,16(sp)
    80001744:	00813483          	ld	s1,8(sp)
    80001748:	02010113          	addi	sp,sp,32
    8000174c:	00008067          	ret

0000000080001750 <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    80001750:	01052783          	lw	a5,16(a0)
    80001754:	fff7879b          	addiw	a5,a5,-1
    80001758:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    8000175c:	02079713          	slli	a4,a5,0x20
    80001760:	00074463          	bltz	a4,80001768 <_ZN4_sem4waitEPS_+0x18>
    80001764:	00008067          	ret
void _sem::wait(sem_t id){
    80001768:	fe010113          	addi	sp,sp,-32
    8000176c:	00113c23          	sd	ra,24(sp)
    80001770:	00813823          	sd	s0,16(sp)
    80001774:	00913423          	sd	s1,8(sp)
    80001778:	02010413          	addi	s0,sp,32
    8000177c:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    80001780:	01000513          	li	a0,16
    80001784:	00000097          	auipc	ra,0x0
    80001788:	ca0080e7          	jalr	-864(ra) # 80001424 <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    8000178c:	00007797          	auipc	a5,0x7
    80001790:	8547b783          	ld	a5,-1964(a5) # 80007fe0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001794:	0007b783          	ld	a5,0(a5)
    80001798:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    8000179c:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    800017a0:	0004b783          	ld	a5,0(s1)
    800017a4:	04078863          	beqz	a5,800017f4 <_ZN4_sem4waitEPS_+0xa4>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    800017a8:	0084b783          	ld	a5,8(s1)
    800017ac:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    800017b0:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    800017b4:	00100593          	li	a1,1
    800017b8:	00007797          	auipc	a5,0x7
    800017bc:	8287b783          	ld	a5,-2008(a5) # 80007fe0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800017c0:	0007b503          	ld	a0,0(a5)
    800017c4:	00001097          	auipc	ra,0x1
    800017c8:	f20080e7          	jalr	-224(ra) # 800026e4 <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    800017cc:	00001097          	auipc	ra,0x1
    800017d0:	048080e7          	jalr	72(ra) # 80002814 <_ZN7_thread8dispatchEv>
        __putc('w');
    800017d4:	07700513          	li	a0,119
    800017d8:	00004097          	auipc	ra,0x4
    800017dc:	7a4080e7          	jalr	1956(ra) # 80005f7c <__putc>
    }
}
    800017e0:	01813083          	ld	ra,24(sp)
    800017e4:	01013403          	ld	s0,16(sp)
    800017e8:	00813483          	ld	s1,8(sp)
    800017ec:	02010113          	addi	sp,sp,32
    800017f0:	00008067          	ret
            id->blockHead = pNewBlock;
    800017f4:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    800017f8:	00a4b423          	sd	a0,8(s1)
    800017fc:	fb9ff06f          	j	800017b4 <_ZN4_sem4waitEPS_+0x64>

0000000080001800 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    80001800:	01052783          	lw	a5,16(a0)
    80001804:	0017879b          	addiw	a5,a5,1
    80001808:	0007871b          	sext.w	a4,a5
    8000180c:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    80001810:	00e05463          	blez	a4,80001818 <_ZN4_sem6signalEPS_+0x18>
    80001814:	00008067          	ret
void _sem::signal(sem_t id){
    80001818:	fe010113          	addi	sp,sp,-32
    8000181c:	00113c23          	sd	ra,24(sp)
    80001820:	00813823          	sd	s0,16(sp)
    80001824:	00913423          	sd	s1,8(sp)
    80001828:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    8000182c:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    80001830:	0084b783          	ld	a5,8(s1)
    80001834:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    80001838:	08078663          	beqz	a5,800018c4 <_ZN4_sem6signalEPS_+0xc4>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    8000183c:	00000593          	li	a1,0
    80001840:	0004b503          	ld	a0,0(s1)
    80001844:	00001097          	auipc	ra,0x1
    80001848:	ea0080e7          	jalr	-352(ra) # 800026e4 <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    8000184c:	00048513          	mv	a0,s1
    80001850:	00000097          	auipc	ra,0x0
    80001854:	c04080e7          	jalr	-1020(ra) # 80001454 <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
    80001858:	0004b483          	ld	s1,0(s1)
        __putc('0' + Scheduler::getCount());
    8000185c:	00002097          	auipc	ra,0x2
    80001860:	5d4080e7          	jalr	1492(ra) # 80003e30 <_ZN9Scheduler8getCountEv>
    80001864:	0305051b          	addiw	a0,a0,48
    80001868:	0ff57513          	andi	a0,a0,255
    8000186c:	00004097          	auipc	ra,0x4
    80001870:	710080e7          	jalr	1808(ra) # 80005f7c <__putc>
        Scheduler::put(t);
    80001874:	00048513          	mv	a0,s1
    80001878:	00002097          	auipc	ra,0x2
    8000187c:	2cc080e7          	jalr	716(ra) # 80003b44 <_ZN9Scheduler3putEP7_thread>
        __putc('=');
    80001880:	03d00513          	li	a0,61
    80001884:	00004097          	auipc	ra,0x4
    80001888:	6f8080e7          	jalr	1784(ra) # 80005f7c <__putc>
        __putc('0' + Scheduler::getCount());
    8000188c:	00002097          	auipc	ra,0x2
    80001890:	5a4080e7          	jalr	1444(ra) # 80003e30 <_ZN9Scheduler8getCountEv>
    80001894:	0305051b          	addiw	a0,a0,48
    80001898:	0ff57513          	andi	a0,a0,255
    8000189c:	00004097          	auipc	ra,0x4
    800018a0:	6e0080e7          	jalr	1760(ra) # 80005f7c <__putc>
        __putc('\n');
    800018a4:	00a00513          	li	a0,10
    800018a8:	00004097          	auipc	ra,0x4
    800018ac:	6d4080e7          	jalr	1748(ra) # 80005f7c <__putc>
    }
    800018b0:	01813083          	ld	ra,24(sp)
    800018b4:	01013403          	ld	s0,16(sp)
    800018b8:	00813483          	ld	s1,8(sp)
    800018bc:	02010113          	addi	sp,sp,32
    800018c0:	00008067          	ret
            id->blockTail = 0;
    800018c4:	00053423          	sd	zero,8(a0)
    800018c8:	f75ff06f          	j	8000183c <_ZN4_sem6signalEPS_+0x3c>

00000000800018cc <main>:

#include "kernel.h"
#include "assert.h"

/// @brief first function to be called
void main(){
    800018cc:	fb010113          	addi	sp,sp,-80
    800018d0:	04113423          	sd	ra,72(sp)
    800018d4:	04813023          	sd	s0,64(sp)
    800018d8:	02913c23          	sd	s1,56(sp)
    800018dc:	05010413          	addi	s0,sp,80
    Kernel kernel = Kernel();
    800018e0:	fb040493          	addi	s1,s0,-80
    800018e4:	00048513          	mv	a0,s1
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	3cc080e7          	jalr	972(ra) # 80001cb4 <_ZN6KernelC1Ev>
    kernel.initialise();
    800018f0:	00048513          	mv	a0,s1
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	434080e7          	jalr	1076(ra) # 80001d28 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    800018fc:	00048513          	mv	a0,s1
    80001900:	00000097          	auipc	ra,0x0
    80001904:	52c080e7          	jalr	1324(ra) # 80001e2c <_ZN6Kernel3runEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001908:	02051863          	bnez	a0,80001938 <main+0x6c>
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    8000190c:	fd040513          	addi	a0,s0,-48
    80001910:	00000097          	auipc	ra,0x0
    80001914:	860080e7          	jalr	-1952(ra) # 80001170 <_ZN5TimerD1Ev>
    80001918:	fb040513          	addi	a0,s0,-80
    8000191c:	00001097          	auipc	ra,0x1
    80001920:	26c080e7          	jalr	620(ra) # 80002b88 <_ZN11HeapManagerD1Ev>
    80001924:	04813083          	ld	ra,72(sp)
    80001928:	04013403          	ld	s0,64(sp)
    8000192c:	03813483          	ld	s1,56(sp)
    80001930:	05010113          	addi	sp,sp,80
    80001934:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001938:	00005697          	auipc	a3,0x5
    8000193c:	75068693          	addi	a3,a3,1872 # 80007088 <CONSOLE_STATUS+0x78>
    80001940:	01400613          	li	a2,20
    80001944:	00005597          	auipc	a1,0x5
    80001948:	75458593          	addi	a1,a1,1876 # 80007098 <CONSOLE_STATUS+0x88>
    8000194c:	00005517          	auipc	a0,0x5
    80001950:	75c50513          	addi	a0,a0,1884 # 800070a8 <CONSOLE_STATUS+0x98>
    80001954:	00000097          	auipc	ra,0x0
    80001958:	034080e7          	jalr	52(ra) # 80001988 <_Z13assert_failedPKcS0_jS0_>
    8000195c:	fb1ff06f          	j	8000190c <main+0x40>
    80001960:	00050493          	mv	s1,a0
    80001964:	fd040513          	addi	a0,s0,-48
    80001968:	00000097          	auipc	ra,0x0
    8000196c:	808080e7          	jalr	-2040(ra) # 80001170 <_ZN5TimerD1Ev>
    80001970:	fb040513          	addi	a0,s0,-80
    80001974:	00001097          	auipc	ra,0x1
    80001978:	214080e7          	jalr	532(ra) # 80002b88 <_ZN11HeapManagerD1Ev>
    8000197c:	00048513          	mv	a0,s1
    80001980:	00007097          	auipc	ra,0x7
    80001984:	7a8080e7          	jalr	1960(ra) # 80009128 <_Unwind_Resume>

0000000080001988 <_Z13assert_failedPKcS0_jS0_>:
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    80001988:	fb010113          	addi	sp,sp,-80
    8000198c:	04113423          	sd	ra,72(sp)
    80001990:	04813023          	sd	s0,64(sp)
    80001994:	02913c23          	sd	s1,56(sp)
    80001998:	03213823          	sd	s2,48(sp)
    8000199c:	03313423          	sd	s3,40(sp)
    800019a0:	03413023          	sd	s4,32(sp)
    800019a4:	05010413          	addi	s0,sp,80
    800019a8:	00050993          	mv	s3,a0
    800019ac:	00058493          	mv	s1,a1
    800019b0:	00060913          	mv	s2,a2
    800019b4:	00068a13          	mv	s4,a3
    putc('\n');
    800019b8:	00a00513          	li	a0,10
    800019bc:	00000097          	auipc	ra,0x0
    800019c0:	cb4080e7          	jalr	-844(ra) # 80001670 <_Z4putcc>
    putc('A');
    800019c4:	04100513          	li	a0,65
    800019c8:	00000097          	auipc	ra,0x0
    800019cc:	ca8080e7          	jalr	-856(ra) # 80001670 <_Z4putcc>
    putc('s');
    800019d0:	07300513          	li	a0,115
    800019d4:	00000097          	auipc	ra,0x0
    800019d8:	c9c080e7          	jalr	-868(ra) # 80001670 <_Z4putcc>
    putc('s');
    800019dc:	07300513          	li	a0,115
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	c90080e7          	jalr	-880(ra) # 80001670 <_Z4putcc>
    putc('e');
    800019e8:	06500513          	li	a0,101
    800019ec:	00000097          	auipc	ra,0x0
    800019f0:	c84080e7          	jalr	-892(ra) # 80001670 <_Z4putcc>
    putc('r');
    800019f4:	07200513          	li	a0,114
    800019f8:	00000097          	auipc	ra,0x0
    800019fc:	c78080e7          	jalr	-904(ra) # 80001670 <_Z4putcc>
    putc('t');
    80001a00:	07400513          	li	a0,116
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	c6c080e7          	jalr	-916(ra) # 80001670 <_Z4putcc>
    putc('i');
    80001a0c:	06900513          	li	a0,105
    80001a10:	00000097          	auipc	ra,0x0
    80001a14:	c60080e7          	jalr	-928(ra) # 80001670 <_Z4putcc>
    putc('o');
    80001a18:	06f00513          	li	a0,111
    80001a1c:	00000097          	auipc	ra,0x0
    80001a20:	c54080e7          	jalr	-940(ra) # 80001670 <_Z4putcc>
    putc('n');
    80001a24:	06e00513          	li	a0,110
    80001a28:	00000097          	auipc	ra,0x0
    80001a2c:	c48080e7          	jalr	-952(ra) # 80001670 <_Z4putcc>
    putc(' ');
    80001a30:	02000513          	li	a0,32
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	c3c080e7          	jalr	-964(ra) # 80001670 <_Z4putcc>
    putc('\'');
    80001a3c:	02700513          	li	a0,39
    80001a40:	00000097          	auipc	ra,0x0
    80001a44:	c30080e7          	jalr	-976(ra) # 80001670 <_Z4putcc>
    while(*__assertion != 0){
    80001a48:	0009c503          	lbu	a0,0(s3)
    80001a4c:	00050a63          	beqz	a0,80001a60 <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	c20080e7          	jalr	-992(ra) # 80001670 <_Z4putcc>
        __assertion++;
    80001a58:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    80001a5c:	fedff06f          	j	80001a48 <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    80001a60:	02700513          	li	a0,39
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	c0c080e7          	jalr	-1012(ra) # 80001670 <_Z4putcc>
    putc(' ');
    80001a6c:	02000513          	li	a0,32
    80001a70:	00000097          	auipc	ra,0x0
    80001a74:	c00080e7          	jalr	-1024(ra) # 80001670 <_Z4putcc>
    putc('f');
    80001a78:	06600513          	li	a0,102
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	bf4080e7          	jalr	-1036(ra) # 80001670 <_Z4putcc>
    putc('a');
    80001a84:	06100513          	li	a0,97
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	be8080e7          	jalr	-1048(ra) # 80001670 <_Z4putcc>
    putc('i');
    80001a90:	06900513          	li	a0,105
    80001a94:	00000097          	auipc	ra,0x0
    80001a98:	bdc080e7          	jalr	-1060(ra) # 80001670 <_Z4putcc>
    putc('l');
    80001a9c:	06c00513          	li	a0,108
    80001aa0:	00000097          	auipc	ra,0x0
    80001aa4:	bd0080e7          	jalr	-1072(ra) # 80001670 <_Z4putcc>
    putc('e');
    80001aa8:	06500513          	li	a0,101
    80001aac:	00000097          	auipc	ra,0x0
    80001ab0:	bc4080e7          	jalr	-1084(ra) # 80001670 <_Z4putcc>
    putc('d');
    80001ab4:	06400513          	li	a0,100
    80001ab8:	00000097          	auipc	ra,0x0
    80001abc:	bb8080e7          	jalr	-1096(ra) # 80001670 <_Z4putcc>
    putc(' ');
    80001ac0:	02000513          	li	a0,32
    80001ac4:	00000097          	auipc	ra,0x0
    80001ac8:	bac080e7          	jalr	-1108(ra) # 80001670 <_Z4putcc>
    putc('i');
    80001acc:	06900513          	li	a0,105
    80001ad0:	00000097          	auipc	ra,0x0
    80001ad4:	ba0080e7          	jalr	-1120(ra) # 80001670 <_Z4putcc>
    putc('n');
    80001ad8:	06e00513          	li	a0,110
    80001adc:	00000097          	auipc	ra,0x0
    80001ae0:	b94080e7          	jalr	-1132(ra) # 80001670 <_Z4putcc>
    putc(' ');
    80001ae4:	02000513          	li	a0,32
    80001ae8:	00000097          	auipc	ra,0x0
    80001aec:	b88080e7          	jalr	-1144(ra) # 80001670 <_Z4putcc>
    putc('f');
    80001af0:	06600513          	li	a0,102
    80001af4:	00000097          	auipc	ra,0x0
    80001af8:	b7c080e7          	jalr	-1156(ra) # 80001670 <_Z4putcc>
    putc('i');
    80001afc:	06900513          	li	a0,105
    80001b00:	00000097          	auipc	ra,0x0
    80001b04:	b70080e7          	jalr	-1168(ra) # 80001670 <_Z4putcc>
    putc('l');
    80001b08:	06c00513          	li	a0,108
    80001b0c:	00000097          	auipc	ra,0x0
    80001b10:	b64080e7          	jalr	-1180(ra) # 80001670 <_Z4putcc>
    putc('e');
    80001b14:	06500513          	li	a0,101
    80001b18:	00000097          	auipc	ra,0x0
    80001b1c:	b58080e7          	jalr	-1192(ra) # 80001670 <_Z4putcc>
    putc(':');
    80001b20:	03a00513          	li	a0,58
    80001b24:	00000097          	auipc	ra,0x0
    80001b28:	b4c080e7          	jalr	-1204(ra) # 80001670 <_Z4putcc>
    putc(' ');
    80001b2c:	02000513          	li	a0,32
    80001b30:	00000097          	auipc	ra,0x0
    80001b34:	b40080e7          	jalr	-1216(ra) # 80001670 <_Z4putcc>
    while(*__file != 0){
    80001b38:	0004c503          	lbu	a0,0(s1)
    80001b3c:	00050a63          	beqz	a0,80001b50 <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    80001b40:	00000097          	auipc	ra,0x0
    80001b44:	b30080e7          	jalr	-1232(ra) # 80001670 <_Z4putcc>
        __file++;
    80001b48:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80001b4c:	fedff06f          	j	80001b38 <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    80001b50:	00a00513          	li	a0,10
    80001b54:	00000097          	auipc	ra,0x0
    80001b58:	b1c080e7          	jalr	-1252(ra) # 80001670 <_Z4putcc>
    putc('l');
    80001b5c:	06c00513          	li	a0,108
    80001b60:	00000097          	auipc	ra,0x0
    80001b64:	b10080e7          	jalr	-1264(ra) # 80001670 <_Z4putcc>
    putc('i');
    80001b68:	06900513          	li	a0,105
    80001b6c:	00000097          	auipc	ra,0x0
    80001b70:	b04080e7          	jalr	-1276(ra) # 80001670 <_Z4putcc>
    putc('n');
    80001b74:	06e00513          	li	a0,110
    80001b78:	00000097          	auipc	ra,0x0
    80001b7c:	af8080e7          	jalr	-1288(ra) # 80001670 <_Z4putcc>
    putc('e');
    80001b80:	06500513          	li	a0,101
    80001b84:	00000097          	auipc	ra,0x0
    80001b88:	aec080e7          	jalr	-1300(ra) # 80001670 <_Z4putcc>
    putc(':');
    80001b8c:	03a00513          	li	a0,58
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	ae0080e7          	jalr	-1312(ra) # 80001670 <_Z4putcc>
    putc(' ');
    80001b98:	02000513          	li	a0,32
    80001b9c:	00000097          	auipc	ra,0x0
    80001ba0:	ad4080e7          	jalr	-1324(ra) # 80001670 <_Z4putcc>
    char buffer[20];
    int i = 0;
    80001ba4:	00000493          	li	s1,0
    while(__line != 0){
    80001ba8:	02090463          	beqz	s2,80001bd0 <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80001bac:	00a00713          	li	a4,10
    80001bb0:	02e977bb          	remuw	a5,s2,a4
    80001bb4:	0307879b          	addiw	a5,a5,48
    80001bb8:	fd040693          	addi	a3,s0,-48
    80001bbc:	009686b3          	add	a3,a3,s1
    80001bc0:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    80001bc4:	02e9593b          	divuw	s2,s2,a4
        i++;
    80001bc8:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    80001bcc:	fddff06f          	j	80001ba8 <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    80001bd0:	02048063          	beqz	s1,80001bf0 <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    80001bd4:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80001bd8:	fd040793          	addi	a5,s0,-48
    80001bdc:	009787b3          	add	a5,a5,s1
    80001be0:	fe87c503          	lbu	a0,-24(a5)
    80001be4:	00000097          	auipc	ra,0x0
    80001be8:	a8c080e7          	jalr	-1396(ra) # 80001670 <_Z4putcc>
    80001bec:	fe5ff06f          	j	80001bd0 <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80001bf0:	00a00513          	li	a0,10
    80001bf4:	00000097          	auipc	ra,0x0
    80001bf8:	a7c080e7          	jalr	-1412(ra) # 80001670 <_Z4putcc>
    putc('f');
    80001bfc:	06600513          	li	a0,102
    80001c00:	00000097          	auipc	ra,0x0
    80001c04:	a70080e7          	jalr	-1424(ra) # 80001670 <_Z4putcc>
    putc('u');
    80001c08:	07500513          	li	a0,117
    80001c0c:	00000097          	auipc	ra,0x0
    80001c10:	a64080e7          	jalr	-1436(ra) # 80001670 <_Z4putcc>
    putc('n');
    80001c14:	06e00513          	li	a0,110
    80001c18:	00000097          	auipc	ra,0x0
    80001c1c:	a58080e7          	jalr	-1448(ra) # 80001670 <_Z4putcc>
    putc('c');
    80001c20:	06300513          	li	a0,99
    80001c24:	00000097          	auipc	ra,0x0
    80001c28:	a4c080e7          	jalr	-1460(ra) # 80001670 <_Z4putcc>
    putc('t');
    80001c2c:	07400513          	li	a0,116
    80001c30:	00000097          	auipc	ra,0x0
    80001c34:	a40080e7          	jalr	-1472(ra) # 80001670 <_Z4putcc>
    putc('i');
    80001c38:	06900513          	li	a0,105
    80001c3c:	00000097          	auipc	ra,0x0
    80001c40:	a34080e7          	jalr	-1484(ra) # 80001670 <_Z4putcc>
    putc('o');
    80001c44:	06f00513          	li	a0,111
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	a28080e7          	jalr	-1496(ra) # 80001670 <_Z4putcc>
    putc('n');
    80001c50:	06e00513          	li	a0,110
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	a1c080e7          	jalr	-1508(ra) # 80001670 <_Z4putcc>
    putc(':');
    80001c5c:	03a00513          	li	a0,58
    80001c60:	00000097          	auipc	ra,0x0
    80001c64:	a10080e7          	jalr	-1520(ra) # 80001670 <_Z4putcc>
    putc(' ');
    80001c68:	02000513          	li	a0,32
    80001c6c:	00000097          	auipc	ra,0x0
    80001c70:	a04080e7          	jalr	-1532(ra) # 80001670 <_Z4putcc>
    putc('\'');
    80001c74:	02700513          	li	a0,39
    80001c78:	00000097          	auipc	ra,0x0
    80001c7c:	9f8080e7          	jalr	-1544(ra) # 80001670 <_Z4putcc>
    while(*__function != 0){
    80001c80:	000a4503          	lbu	a0,0(s4)
    80001c84:	00050a63          	beqz	a0,80001c98 <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    80001c88:	00000097          	auipc	ra,0x0
    80001c8c:	9e8080e7          	jalr	-1560(ra) # 80001670 <_Z4putcc>
        __function ++;
    80001c90:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80001c94:	fedff06f          	j	80001c80 <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    80001c98:	02700513          	li	a0,39
    80001c9c:	00000097          	auipc	ra,0x0
    80001ca0:	9d4080e7          	jalr	-1580(ra) # 80001670 <_Z4putcc>
    putc('\n');
    80001ca4:	00a00513          	li	a0,10
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	9c8080e7          	jalr	-1592(ra) # 80001670 <_Z4putcc>
    while(1);
    80001cb0:	0000006f          	j	80001cb0 <_Z13assert_failedPKcS0_jS0_+0x328>

0000000080001cb4 <_ZN6KernelC1Ev>:

#include "console.h"

extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80001cb4:	fe010113          	addi	sp,sp,-32
    80001cb8:	00113c23          	sd	ra,24(sp)
    80001cbc:	00813823          	sd	s0,16(sp)
    80001cc0:	00913423          	sd	s1,8(sp)
    80001cc4:	01213023          	sd	s2,0(sp)
    80001cc8:	02010413          	addi	s0,sp,32
    80001ccc:	00050493          	mv	s1,a0
    80001cd0:	00001097          	auipc	ra,0x1
    80001cd4:	e50080e7          	jalr	-432(ra) # 80002b20 <_ZN11HeapManagerC1Ev>
    80001cd8:	00848513          	addi	a0,s1,8
    80001cdc:	00002097          	auipc	ra,0x2
    80001ce0:	dd0080e7          	jalr	-560(ra) # 80003aac <_ZN9SchedulerC1Ev>
    80001ce4:	01848513          	addi	a0,s1,24
    80001ce8:	fffff097          	auipc	ra,0xfffff
    80001cec:	418080e7          	jalr	1048(ra) # 80001100 <_ZN5TimerC1Ev>
    80001cf0:	0200006f          	j	80001d10 <_ZN6KernelC1Ev+0x5c>
    80001cf4:	00050913          	mv	s2,a0
    80001cf8:	00048513          	mv	a0,s1
    80001cfc:	00001097          	auipc	ra,0x1
    80001d00:	e8c080e7          	jalr	-372(ra) # 80002b88 <_ZN11HeapManagerD1Ev>
    80001d04:	00090513          	mv	a0,s2
    80001d08:	00007097          	auipc	ra,0x7
    80001d0c:	420080e7          	jalr	1056(ra) # 80009128 <_Unwind_Resume>
    80001d10:	01813083          	ld	ra,24(sp)
    80001d14:	01013403          	ld	s0,16(sp)
    80001d18:	00813483          	ld	s1,8(sp)
    80001d1c:	00013903          	ld	s2,0(sp)
    80001d20:	02010113          	addi	sp,sp,32
    80001d24:	00008067          	ret

0000000080001d28 <_ZN6Kernel10initialiseEv>:
 
void Kernel::initialise(){
    80001d28:	ff010113          	addi	sp,sp,-16
    80001d2c:	00113423          	sd	ra,8(sp)
    80001d30:	00813023          	sd	s0,0(sp)
    80001d34:	01010413          	addi	s0,sp,16
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80001d38:	00006797          	auipc	a5,0x6
    80001d3c:	2987b783          	ld	a5,664(a5) # 80007fd0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d40:	10579073          	csrw	stvec,a5

    
    /// initialise the heap manager
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );
    80001d44:	00006797          	auipc	a5,0x6
    80001d48:	2947b783          	ld	a5,660(a5) # 80007fd8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001d4c:	0007b603          	ld	a2,0(a5)
    80001d50:	00006797          	auipc	a5,0x6
    80001d54:	2607b783          	ld	a5,608(a5) # 80007fb0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001d58:	0007b583          	ld	a1,0(a5)
    80001d5c:	00001097          	auipc	ra,0x1
    80001d60:	e44080e7          	jalr	-444(ra) # 80002ba0 <_ZN11HeapManager4initEmm>

    return;
}
    80001d64:	00813083          	ld	ra,8(sp)
    80001d68:	00013403          	ld	s0,0(sp)
    80001d6c:	01010113          	addi	sp,sp,16
    80001d70:	00008067          	ret

0000000080001d74 <_Z8testFuncPv>:

// sem_t sem = 0;

void testFunc(void* arg){
    80001d74:	ff010113          	addi	sp,sp,-16
    80001d78:	00113423          	sd	ra,8(sp)
    80001d7c:	00813023          	sd	s0,0(sp)
    80001d80:	01010413          	addi	s0,sp,16
    putc('t');
    80001d84:	07400513          	li	a0,116
    80001d88:	00000097          	auipc	ra,0x0
    80001d8c:	8e8080e7          	jalr	-1816(ra) # 80001670 <_Z4putcc>
    putc('e');
    80001d90:	06500513          	li	a0,101
    80001d94:	00000097          	auipc	ra,0x0
    80001d98:	8dc080e7          	jalr	-1828(ra) # 80001670 <_Z4putcc>
    putc('s');
    80001d9c:	07300513          	li	a0,115
    80001da0:	00000097          	auipc	ra,0x0
    80001da4:	8d0080e7          	jalr	-1840(ra) # 80001670 <_Z4putcc>
    putc('t');
    80001da8:	07400513          	li	a0,116
    80001dac:	00000097          	auipc	ra,0x0
    80001db0:	8c4080e7          	jalr	-1852(ra) # 80001670 <_Z4putcc>

    // sem_wait(sem);
    // thread_dispatch();
    // thread_dispatch();
    thread_dispatch();
    80001db4:	fffff097          	auipc	ra,0xfffff
    80001db8:	768080e7          	jalr	1896(ra) # 8000151c <_Z15thread_dispatchv>

    // time_sleep(10);
    putc(' ');
    80001dbc:	02000513          	li	a0,32
    80001dc0:	00000097          	auipc	ra,0x0
    80001dc4:	8b0080e7          	jalr	-1872(ra) # 80001670 <_Z4putcc>

    putc('t');
    80001dc8:	07400513          	li	a0,116
    80001dcc:	00000097          	auipc	ra,0x0
    80001dd0:	8a4080e7          	jalr	-1884(ra) # 80001670 <_Z4putcc>
    putc('h');
    80001dd4:	06800513          	li	a0,104
    80001dd8:	00000097          	auipc	ra,0x0
    80001ddc:	898080e7          	jalr	-1896(ra) # 80001670 <_Z4putcc>
    putc('r');
    80001de0:	07200513          	li	a0,114
    80001de4:	00000097          	auipc	ra,0x0
    80001de8:	88c080e7          	jalr	-1908(ra) # 80001670 <_Z4putcc>
    putc('e');
    80001dec:	06500513          	li	a0,101
    80001df0:	00000097          	auipc	ra,0x0
    80001df4:	880080e7          	jalr	-1920(ra) # 80001670 <_Z4putcc>
    putc('a');
    80001df8:	06100513          	li	a0,97
    80001dfc:	00000097          	auipc	ra,0x0
    80001e00:	874080e7          	jalr	-1932(ra) # 80001670 <_Z4putcc>
    putc('d');
    80001e04:	06400513          	li	a0,100
    80001e08:	00000097          	auipc	ra,0x0
    80001e0c:	868080e7          	jalr	-1944(ra) # 80001670 <_Z4putcc>
    putc('\n');
    80001e10:	00a00513          	li	a0,10
    80001e14:	00000097          	auipc	ra,0x0
    80001e18:	85c080e7          	jalr	-1956(ra) # 80001670 <_Z4putcc>
}
    80001e1c:	00813083          	ld	ra,8(sp)
    80001e20:	00013403          	ld	s0,0(sp)
    80001e24:	01010113          	addi	sp,sp,16
    80001e28:	00008067          	ret

0000000080001e2c <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    80001e2c:	fd010113          	addi	sp,sp,-48
    80001e30:	02113423          	sd	ra,40(sp)
    80001e34:	02813023          	sd	s0,32(sp)
    80001e38:	00913c23          	sd	s1,24(sp)
    80001e3c:	01213823          	sd	s2,16(sp)
    80001e40:	03010413          	addi	s0,sp,48

    thread_t t, test;
    
    thread_create(&t, 0, 0);
    80001e44:	00000613          	li	a2,0
    80001e48:	00000593          	li	a1,0
    80001e4c:	fd840513          	addi	a0,s0,-40
    80001e50:	fffff097          	auipc	ra,0xfffff
    80001e54:	630080e7          	jalr	1584(ra) # 80001480 <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80001e58:	00002097          	auipc	ra,0x2
    80001e5c:	edc080e7          	jalr	-292(ra) # 80003d34 <_ZN9Scheduler3getEv>
    80001e60:	00006797          	auipc	a5,0x6
    80001e64:	1807b783          	ld	a5,384(a5) # 80007fe0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001e68:	00a7b023          	sd	a0,0(a5)
    
    /// change to user mode
    __asm__ volatile ("li a0, 0xff");
    80001e6c:	0ff00513          	li	a0,255
    __asm__ volatile ("ecall");
    80001e70:	00000073          	ecall
    
    putc('u');
    80001e74:	07500513          	li	a0,117
    80001e78:	fffff097          	auipc	ra,0xfffff
    80001e7c:	7f8080e7          	jalr	2040(ra) # 80001670 <_Z4putcc>
    putc('s');
    80001e80:	07300513          	li	a0,115
    80001e84:	fffff097          	auipc	ra,0xfffff
    80001e88:	7ec080e7          	jalr	2028(ra) # 80001670 <_Z4putcc>
    putc('e');
    80001e8c:	06500513          	li	a0,101
    80001e90:	fffff097          	auipc	ra,0xfffff
    80001e94:	7e0080e7          	jalr	2016(ra) # 80001670 <_Z4putcc>
    putc('r');
    80001e98:	07200513          	li	a0,114
    80001e9c:	fffff097          	auipc	ra,0xfffff
    80001ea0:	7d4080e7          	jalr	2004(ra) # 80001670 <_Z4putcc>
    putc('\n');
    80001ea4:	00a00513          	li	a0,10
    80001ea8:	fffff097          	auipc	ra,0xfffff
    80001eac:	7c8080e7          	jalr	1992(ra) # 80001670 <_Z4putcc>

    
    /// NOW WE ARE IN USER MODE
    
    
    thread_create(&test, usermain, 0);
    80001eb0:	00000613          	li	a2,0
    80001eb4:	00006597          	auipc	a1,0x6
    80001eb8:	1045b583          	ld	a1,260(a1) # 80007fb8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001ebc:	fd040513          	addi	a0,s0,-48
    80001ec0:	fffff097          	auipc	ra,0xfffff
    80001ec4:	5c0080e7          	jalr	1472(ra) # 80001480 <_Z13thread_createPP7_threadPFvPvES2_>
    putc('k');
    80001ec8:	06b00513          	li	a0,107
    80001ecc:	fffff097          	auipc	ra,0xfffff
    80001ed0:	7a4080e7          	jalr	1956(ra) # 80001670 <_Z4putcc>
    putc('e');
    80001ed4:	06500513          	li	a0,101
    80001ed8:	fffff097          	auipc	ra,0xfffff
    80001edc:	798080e7          	jalr	1944(ra) # 80001670 <_Z4putcc>
    putc('r');
    80001ee0:	07200513          	li	a0,114
    80001ee4:	fffff097          	auipc	ra,0xfffff
    80001ee8:	78c080e7          	jalr	1932(ra) # 80001670 <_Z4putcc>
    putc('n');
    80001eec:	06e00513          	li	a0,110
    80001ef0:	fffff097          	auipc	ra,0xfffff
    80001ef4:	780080e7          	jalr	1920(ra) # 80001670 <_Z4putcc>
    putc('e');
    80001ef8:	06500513          	li	a0,101
    80001efc:	fffff097          	auipc	ra,0xfffff
    80001f00:	774080e7          	jalr	1908(ra) # 80001670 <_Z4putcc>
    putc('l');
    80001f04:	06c00513          	li	a0,108
    80001f08:	fffff097          	auipc	ra,0xfffff
    80001f0c:	768080e7          	jalr	1896(ra) # 80001670 <_Z4putcc>
    putc('\n');
    80001f10:	00a00513          	li	a0,10
    80001f14:	fffff097          	auipc	ra,0xfffff
    80001f18:	75c080e7          	jalr	1884(ra) # 80001670 <_Z4putcc>
    int cnt = 0;
    80001f1c:	00000493          	li	s1,0
    80001f20:	0500006f          	j	80001f70 <_ZN6Kernel3runEv+0x144>
    do{
        thread_dispatch();
        if(cnt ++ % 100 == 0){
            putc('\n');
    80001f24:	00a00513          	li	a0,10
    80001f28:	fffff097          	auipc	ra,0xfffff
    80001f2c:	748080e7          	jalr	1864(ra) # 80001670 <_Z4putcc>
            putc('l');
    80001f30:	06c00513          	li	a0,108
    80001f34:	fffff097          	auipc	ra,0xfffff
    80001f38:	73c080e7          	jalr	1852(ra) # 80001670 <_Z4putcc>
            putc('o');
    80001f3c:	06f00513          	li	a0,111
    80001f40:	fffff097          	auipc	ra,0xfffff
    80001f44:	730080e7          	jalr	1840(ra) # 80001670 <_Z4putcc>
            putc('o');
    80001f48:	06f00513          	li	a0,111
    80001f4c:	fffff097          	auipc	ra,0xfffff
    80001f50:	724080e7          	jalr	1828(ra) # 80001670 <_Z4putcc>
            putc('p');
    80001f54:	07000513          	li	a0,112
    80001f58:	fffff097          	auipc	ra,0xfffff
    80001f5c:	718080e7          	jalr	1816(ra) # 80001670 <_Z4putcc>
            putc('\n');
    80001f60:	00a00513          	li	a0,10
    80001f64:	fffff097          	auipc	ra,0xfffff
    80001f68:	70c080e7          	jalr	1804(ra) # 80001670 <_Z4putcc>
Kernel::EXIT_CODE Kernel::run(){
    80001f6c:	00090493          	mv	s1,s2
        thread_dispatch();
    80001f70:	fffff097          	auipc	ra,0xfffff
    80001f74:	5ac080e7          	jalr	1452(ra) # 8000151c <_Z15thread_dispatchv>
        if(cnt ++ % 100 == 0){
    80001f78:	0014891b          	addiw	s2,s1,1
    80001f7c:	06400793          	li	a5,100
    80001f80:	02f4e4bb          	remw	s1,s1,a5
    80001f84:	fe0494e3          	bnez	s1,80001f6c <_ZN6Kernel3runEv+0x140>
    80001f88:	f9dff06f          	j	80001f24 <_ZN6Kernel3runEv+0xf8>

0000000080001f8c <_Z13thread_test_2Pv>:
    putc('0' + cnt);
    putc('\n');
    // assert(false);
}

void thread_test_2(void* args){
    80001f8c:	ff010113          	addi	sp,sp,-16
    80001f90:	00113423          	sd	ra,8(sp)
    80001f94:	00813023          	sd	s0,0(sp)
    80001f98:	01010413          	addi	s0,sp,16
    putc('2');
    80001f9c:	03200513          	li	a0,50
    80001fa0:	fffff097          	auipc	ra,0xfffff
    80001fa4:	6d0080e7          	jalr	1744(ra) # 80001670 <_Z4putcc>
    putc('s');
    80001fa8:	07300513          	li	a0,115
    80001fac:	fffff097          	auipc	ra,0xfffff
    80001fb0:	6c4080e7          	jalr	1732(ra) # 80001670 <_Z4putcc>
    // time_sleep(25);
    putc('2');
    80001fb4:	03200513          	li	a0,50
    80001fb8:	fffff097          	auipc	ra,0xfffff
    80001fbc:	6b8080e7          	jalr	1720(ra) # 80001670 <_Z4putcc>
    putc('S');
    80001fc0:	05300513          	li	a0,83
    80001fc4:	fffff097          	auipc	ra,0xfffff
    80001fc8:	6ac080e7          	jalr	1708(ra) # 80001670 <_Z4putcc>
    // sem_signal(sem2);
}
    80001fcc:	00813083          	ld	ra,8(sp)
    80001fd0:	00013403          	ld	s0,0(sp)
    80001fd4:	01010113          	addi	sp,sp,16
    80001fd8:	00008067          	ret

0000000080001fdc <_Z13thread_test_1Pv>:
void thread_test_1(void* args){
    80001fdc:	fd010113          	addi	sp,sp,-48
    80001fe0:	02113423          	sd	ra,40(sp)
    80001fe4:	02813023          	sd	s0,32(sp)
    80001fe8:	00913c23          	sd	s1,24(sp)
    80001fec:	01213823          	sd	s2,16(sp)
    80001ff0:	01313423          	sd	s3,8(sp)
    80001ff4:	03010413          	addi	s0,sp,48
    putc('1');
    80001ff8:	03100513          	li	a0,49
    80001ffc:	fffff097          	auipc	ra,0xfffff
    80002000:	674080e7          	jalr	1652(ra) # 80001670 <_Z4putcc>
    putc('s');
    80002004:	07300513          	li	a0,115
    80002008:	fffff097          	auipc	ra,0xfffff
    8000200c:	668080e7          	jalr	1640(ra) # 80001670 <_Z4putcc>
    time_sleep(30);
    80002010:	01e00513          	li	a0,30
    80002014:	fffff097          	auipc	ra,0xfffff
    80002018:	54c080e7          	jalr	1356(ra) # 80001560 <_Z10time_sleepm>
    putc('1');
    8000201c:	03100513          	li	a0,49
    80002020:	fffff097          	auipc	ra,0xfffff
    80002024:	650080e7          	jalr	1616(ra) # 80001670 <_Z4putcc>
    sem_signal(sem1);
    80002028:	00006517          	auipc	a0,0x6
    8000202c:	01053503          	ld	a0,16(a0) # 80008038 <sem1>
    80002030:	fffff097          	auipc	ra,0xfffff
    80002034:	5ec080e7          	jalr	1516(ra) # 8000161c <_Z10sem_signalP4_sem>
    putc('S');
    80002038:	05300513          	li	a0,83
    8000203c:	fffff097          	auipc	ra,0xfffff
    80002040:	634080e7          	jalr	1588(ra) # 80001670 <_Z4putcc>
    putc('\n');
    80002044:	00a00513          	li	a0,10
    80002048:	fffff097          	auipc	ra,0xfffff
    8000204c:	628080e7          	jalr	1576(ra) # 80001670 <_Z4putcc>
    putc('c');
    80002050:	06300513          	li	a0,99
    80002054:	fffff097          	auipc	ra,0xfffff
    80002058:	61c080e7          	jalr	1564(ra) # 80001670 <_Z4putcc>
    putc('n');
    8000205c:	06e00513          	li	a0,110
    80002060:	fffff097          	auipc	ra,0xfffff
    80002064:	610080e7          	jalr	1552(ra) # 80001670 <_Z4putcc>
    putc('t');
    80002068:	07400513          	li	a0,116
    8000206c:	fffff097          	auipc	ra,0xfffff
    80002070:	604080e7          	jalr	1540(ra) # 80001670 <_Z4putcc>
    putc(':');
    80002074:	03a00513          	li	a0,58
    80002078:	fffff097          	auipc	ra,0xfffff
    8000207c:	5f8080e7          	jalr	1528(ra) # 80001670 <_Z4putcc>
    putc(' ');
    80002080:	02000513          	li	a0,32
    80002084:	fffff097          	auipc	ra,0xfffff
    80002088:	5ec080e7          	jalr	1516(ra) # 80001670 <_Z4putcc>
    int cnt = Scheduler::getCount();
    8000208c:	00002097          	auipc	ra,0x2
    80002090:	da4080e7          	jalr	-604(ra) # 80003e30 <_ZN9Scheduler8getCountEv>
    putc('0' + cnt);
    80002094:	0305051b          	addiw	a0,a0,48
    80002098:	0ff57513          	andi	a0,a0,255
    8000209c:	fffff097          	auipc	ra,0xfffff
    800020a0:	5d4080e7          	jalr	1492(ra) # 80001670 <_Z4putcc>
    putc('\n');
    800020a4:	00a00513          	li	a0,10
    800020a8:	fffff097          	auipc	ra,0xfffff
    800020ac:	5c8080e7          	jalr	1480(ra) # 80001670 <_Z4putcc>
    thread_t t1 = Scheduler::get();
    800020b0:	00002097          	auipc	ra,0x2
    800020b4:	c84080e7          	jalr	-892(ra) # 80003d34 <_ZN9Scheduler3getEv>
    800020b8:	00050913          	mv	s2,a0
    int id = t1->ID;
    800020bc:	00052483          	lw	s1,0(a0)
    putc('i');
    800020c0:	06900513          	li	a0,105
    800020c4:	fffff097          	auipc	ra,0xfffff
    800020c8:	5ac080e7          	jalr	1452(ra) # 80001670 <_Z4putcc>
    putc('d');
    800020cc:	06400513          	li	a0,100
    800020d0:	fffff097          	auipc	ra,0xfffff
    800020d4:	5a0080e7          	jalr	1440(ra) # 80001670 <_Z4putcc>
    putc(':');
    800020d8:	03a00513          	li	a0,58
    800020dc:	fffff097          	auipc	ra,0xfffff
    800020e0:	594080e7          	jalr	1428(ra) # 80001670 <_Z4putcc>
    putc(' ');
    800020e4:	02000513          	li	a0,32
    800020e8:	fffff097          	auipc	ra,0xfffff
    800020ec:	588080e7          	jalr	1416(ra) # 80001670 <_Z4putcc>
    putc('0' + id);
    800020f0:	0304851b          	addiw	a0,s1,48
    800020f4:	0ff57513          	andi	a0,a0,255
    800020f8:	fffff097          	auipc	ra,0xfffff
    800020fc:	578080e7          	jalr	1400(ra) # 80001670 <_Z4putcc>
    putc('\n');
    80002100:	00a00513          	li	a0,10
    80002104:	fffff097          	auipc	ra,0xfffff
    80002108:	56c080e7          	jalr	1388(ra) # 80001670 <_Z4putcc>
    thread_t t2 = Scheduler::get();
    8000210c:	00002097          	auipc	ra,0x2
    80002110:	c28080e7          	jalr	-984(ra) # 80003d34 <_ZN9Scheduler3getEv>
    80002114:	00050993          	mv	s3,a0
    id = t2->ID;
    80002118:	00052483          	lw	s1,0(a0)
    putc('i');
    8000211c:	06900513          	li	a0,105
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	550080e7          	jalr	1360(ra) # 80001670 <_Z4putcc>
    putc('d');
    80002128:	06400513          	li	a0,100
    8000212c:	fffff097          	auipc	ra,0xfffff
    80002130:	544080e7          	jalr	1348(ra) # 80001670 <_Z4putcc>
    putc(':');
    80002134:	03a00513          	li	a0,58
    80002138:	fffff097          	auipc	ra,0xfffff
    8000213c:	538080e7          	jalr	1336(ra) # 80001670 <_Z4putcc>
    putc(' ');
    80002140:	02000513          	li	a0,32
    80002144:	fffff097          	auipc	ra,0xfffff
    80002148:	52c080e7          	jalr	1324(ra) # 80001670 <_Z4putcc>
    putc('0' + id);
    8000214c:	0304851b          	addiw	a0,s1,48
    80002150:	0ff57513          	andi	a0,a0,255
    80002154:	fffff097          	auipc	ra,0xfffff
    80002158:	51c080e7          	jalr	1308(ra) # 80001670 <_Z4putcc>
    putc('\n');
    8000215c:	00a00513          	li	a0,10
    80002160:	fffff097          	auipc	ra,0xfffff
    80002164:	510080e7          	jalr	1296(ra) # 80001670 <_Z4putcc>
    cnt = Scheduler::getCount();
    80002168:	00002097          	auipc	ra,0x2
    8000216c:	cc8080e7          	jalr	-824(ra) # 80003e30 <_ZN9Scheduler8getCountEv>
    80002170:	00050493          	mv	s1,a0
    putc('c');
    80002174:	06300513          	li	a0,99
    80002178:	fffff097          	auipc	ra,0xfffff
    8000217c:	4f8080e7          	jalr	1272(ra) # 80001670 <_Z4putcc>
    putc('n');
    80002180:	06e00513          	li	a0,110
    80002184:	fffff097          	auipc	ra,0xfffff
    80002188:	4ec080e7          	jalr	1260(ra) # 80001670 <_Z4putcc>
    putc('t');
    8000218c:	07400513          	li	a0,116
    80002190:	fffff097          	auipc	ra,0xfffff
    80002194:	4e0080e7          	jalr	1248(ra) # 80001670 <_Z4putcc>
    putc(':');
    80002198:	03a00513          	li	a0,58
    8000219c:	fffff097          	auipc	ra,0xfffff
    800021a0:	4d4080e7          	jalr	1236(ra) # 80001670 <_Z4putcc>
    putc(' ');
    800021a4:	02000513          	li	a0,32
    800021a8:	fffff097          	auipc	ra,0xfffff
    800021ac:	4c8080e7          	jalr	1224(ra) # 80001670 <_Z4putcc>
    putc('0' + cnt);
    800021b0:	0304849b          	addiw	s1,s1,48
    800021b4:	0ff4f513          	andi	a0,s1,255
    800021b8:	fffff097          	auipc	ra,0xfffff
    800021bc:	4b8080e7          	jalr	1208(ra) # 80001670 <_Z4putcc>
    putc('\n');
    800021c0:	00a00513          	li	a0,10
    800021c4:	fffff097          	auipc	ra,0xfffff
    800021c8:	4ac080e7          	jalr	1196(ra) # 80001670 <_Z4putcc>
    Scheduler::put(t2);
    800021cc:	00098513          	mv	a0,s3
    800021d0:	00002097          	auipc	ra,0x2
    800021d4:	974080e7          	jalr	-1676(ra) # 80003b44 <_ZN9Scheduler3putEP7_thread>
    putc('x');
    800021d8:	07800513          	li	a0,120
    800021dc:	fffff097          	auipc	ra,0xfffff
    800021e0:	494080e7          	jalr	1172(ra) # 80001670 <_Z4putcc>
    Scheduler::put(t1);
    800021e4:	00090513          	mv	a0,s2
    800021e8:	00002097          	auipc	ra,0x2
    800021ec:	95c080e7          	jalr	-1700(ra) # 80003b44 <_ZN9Scheduler3putEP7_thread>
    putc('x');
    800021f0:	07800513          	li	a0,120
    800021f4:	fffff097          	auipc	ra,0xfffff
    800021f8:	47c080e7          	jalr	1148(ra) # 80001670 <_Z4putcc>
    cnt = Scheduler::getCount();
    800021fc:	00002097          	auipc	ra,0x2
    80002200:	c34080e7          	jalr	-972(ra) # 80003e30 <_ZN9Scheduler8getCountEv>
    80002204:	00050493          	mv	s1,a0
    putc('\n');
    80002208:	00a00513          	li	a0,10
    8000220c:	fffff097          	auipc	ra,0xfffff
    80002210:	464080e7          	jalr	1124(ra) # 80001670 <_Z4putcc>
    putc('c');
    80002214:	06300513          	li	a0,99
    80002218:	fffff097          	auipc	ra,0xfffff
    8000221c:	458080e7          	jalr	1112(ra) # 80001670 <_Z4putcc>
    putc('n');
    80002220:	06e00513          	li	a0,110
    80002224:	fffff097          	auipc	ra,0xfffff
    80002228:	44c080e7          	jalr	1100(ra) # 80001670 <_Z4putcc>
    putc('t');
    8000222c:	07400513          	li	a0,116
    80002230:	fffff097          	auipc	ra,0xfffff
    80002234:	440080e7          	jalr	1088(ra) # 80001670 <_Z4putcc>
    putc(':');
    80002238:	03a00513          	li	a0,58
    8000223c:	fffff097          	auipc	ra,0xfffff
    80002240:	434080e7          	jalr	1076(ra) # 80001670 <_Z4putcc>
    putc(' ');
    80002244:	02000513          	li	a0,32
    80002248:	fffff097          	auipc	ra,0xfffff
    8000224c:	428080e7          	jalr	1064(ra) # 80001670 <_Z4putcc>
    putc('0' + cnt);
    80002250:	0304851b          	addiw	a0,s1,48
    80002254:	0ff57513          	andi	a0,a0,255
    80002258:	fffff097          	auipc	ra,0xfffff
    8000225c:	418080e7          	jalr	1048(ra) # 80001670 <_Z4putcc>
    putc('\n');
    80002260:	00a00513          	li	a0,10
    80002264:	fffff097          	auipc	ra,0xfffff
    80002268:	40c080e7          	jalr	1036(ra) # 80001670 <_Z4putcc>
}
    8000226c:	02813083          	ld	ra,40(sp)
    80002270:	02013403          	ld	s0,32(sp)
    80002274:	01813483          	ld	s1,24(sp)
    80002278:	01013903          	ld	s2,16(sp)
    8000227c:	00813983          	ld	s3,8(sp)
    80002280:	03010113          	addi	sp,sp,48
    80002284:	00008067          	ret

0000000080002288 <_Z8usermainPv>:

void usermain(void* arg){
    80002288:	fd010113          	addi	sp,sp,-48
    8000228c:	02113423          	sd	ra,40(sp)
    80002290:	02813023          	sd	s0,32(sp)
    80002294:	00913c23          	sd	s1,24(sp)
    80002298:	03010413          	addi	s0,sp,48
    putc('0');
    8000229c:	03000513          	li	a0,48
    800022a0:	fffff097          	auipc	ra,0xfffff
    800022a4:	3d0080e7          	jalr	976(ra) # 80001670 <_Z4putcc>
    thread_t t1, t2;
    sem_open(&sem1, 0);
    800022a8:	00006497          	auipc	s1,0x6
    800022ac:	d9048493          	addi	s1,s1,-624 # 80008038 <sem1>
    800022b0:	00000593          	li	a1,0
    800022b4:	00048513          	mv	a0,s1
    800022b8:	fffff097          	auipc	ra,0xfffff
    800022bc:	2d4080e7          	jalr	724(ra) # 8000158c <_Z8sem_openPP4_semj>
    // sem_open(&sem2, 0);
    thread_create(&t1, thread_test_1, 0);
    800022c0:	00000613          	li	a2,0
    800022c4:	00000597          	auipc	a1,0x0
    800022c8:	d1858593          	addi	a1,a1,-744 # 80001fdc <_Z13thread_test_1Pv>
    800022cc:	fd840513          	addi	a0,s0,-40
    800022d0:	fffff097          	auipc	ra,0xfffff
    800022d4:	1b0080e7          	jalr	432(ra) # 80001480 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    800022d8:	00000613          	li	a2,0
    800022dc:	00000597          	auipc	a1,0x0
    800022e0:	cb058593          	addi	a1,a1,-848 # 80001f8c <_Z13thread_test_2Pv>
    800022e4:	fd040513          	addi	a0,s0,-48
    800022e8:	fffff097          	auipc	ra,0xfffff
    800022ec:	198080e7          	jalr	408(ra) # 80001480 <_Z13thread_createPP7_threadPFvPvES2_>
    sem_wait(sem1);
    800022f0:	0004b503          	ld	a0,0(s1)
    800022f4:	fffff097          	auipc	ra,0xfffff
    800022f8:	2fc080e7          	jalr	764(ra) # 800015f0 <_Z8sem_waitP4_sem>
    putc('3');
    800022fc:	03300513          	li	a0,51
    80002300:	fffff097          	auipc	ra,0xfffff
    80002304:	370080e7          	jalr	880(ra) # 80001670 <_Z4putcc>
    thread_join(t2);
    80002308:	fd043503          	ld	a0,-48(s0)
    8000230c:	fffff097          	auipc	ra,0xfffff
    80002310:	230080e7          	jalr	560(ra) # 8000153c <_Z11thread_joinP7_thread>
    // if(getc() == 'a')putc('x');
    putc('4');
    80002314:	03400513          	li	a0,52
    80002318:	fffff097          	auipc	ra,0xfffff
    8000231c:	358080e7          	jalr	856(ra) # 80001670 <_Z4putcc>
    // thread_join(t1);
    // thread_dispatch();
    // thread_dispatch();
    // sem_wait(sem2);
    putc('5');
    80002320:	03500513          	li	a0,53
    80002324:	fffff097          	auipc	ra,0xfffff
    80002328:	34c080e7          	jalr	844(ra) # 80001670 <_Z4putcc>
    8000232c:	02813083          	ld	ra,40(sp)
    80002330:	02013403          	ld	s0,32(sp)
    80002334:	01813483          	ld	s1,24(sp)
    80002338:	03010113          	addi	sp,sp,48
    8000233c:	00008067          	ret

0000000080002340 <_ZN7_threadC1EPFvPvES0_>:
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;

_thread::_thread(func function, void* arg){
    80002340:	ff010113          	addi	sp,sp,-16
    80002344:	00813423          	sd	s0,8(sp)
    80002348:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    8000234c:	00053823          	sd	zero,16(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80002350:	00006717          	auipc	a4,0x6
    80002354:	cf070713          	addi	a4,a4,-784 # 80008040 <_ZN7_thread6nextIDE>
    80002358:	00072783          	lw	a5,0(a4)
    8000235c:	0017869b          	addiw	a3,a5,1
    80002360:	00d72023          	sw	a3,0(a4)
    80002364:	00f52023          	sw	a5,0(a0)
    closed = 0;
    80002368:	0a053783          	ld	a5,160(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    8000236c:	0015b593          	seqz	a1,a1
    80002370:	00459593          	slli	a1,a1,0x4
    80002374:	fe07f793          	andi	a5,a5,-32
    80002378:	00b7e7b3          	or	a5,a5,a1
    reserved = 0;
    8000237c:	00005717          	auipc	a4,0x5
    80002380:	d5473703          	ld	a4,-684(a4) # 800070d0 <CONSOLE_STATUS+0xc0>
    80002384:	00e7f7b3          	and	a5,a5,a4
    80002388:	0af53023          	sd	a5,160(a0)
    joinHead = 0;
    8000238c:	08053023          	sd	zero,128(a0)
    timeLeft = 0;
    80002390:	08053823          	sd	zero,144(a0)
    stackStart = 0;
    80002394:	08053c23          	sd	zero,152(a0)
    
    context.s0 = 0;
    80002398:	00053c23          	sd	zero,24(a0)
    context.s1 = 0;
    8000239c:	02053023          	sd	zero,32(a0)
    context.s2 = 0;
    800023a0:	02053423          	sd	zero,40(a0)
    context.s3 = 0;
    800023a4:	02053823          	sd	zero,48(a0)
    context.s4 = 0;
    800023a8:	02053c23          	sd	zero,56(a0)
    context.s5 = 0;
    800023ac:	04053023          	sd	zero,64(a0)
    context.s6 = 0;
    800023b0:	04053423          	sd	zero,72(a0)
    context.s7 = 0;
    800023b4:	04053823          	sd	zero,80(a0)
    context.s8 = 0;
    800023b8:	04053c23          	sd	zero,88(a0)
    context.s9 = 0;
    800023bc:	06053023          	sd	zero,96(a0)
    context.s10 = 0;
    800023c0:	06053423          	sd	zero,104(a0)
    context.s11 = 0;
    800023c4:	06053823          	sd	zero,112(a0)

    context.sstatus = 0;
    800023c8:	06053c23          	sd	zero,120(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    800023cc:	00000797          	auipc	a5,0x0
    800023d0:	6e878793          	addi	a5,a5,1768 # 80002ab4 <_ZN7_thread7wrapperEv>
    800023d4:	00f53423          	sd	a5,8(a0)
}
    800023d8:	00813403          	ld	s0,8(sp)
    800023dc:	01010113          	addi	sp,sp,16
    800023e0:	00008067          	ret

00000000800023e4 <_Z10popSppSpieb>:

void popSppSpie(bool kernel = false){
    800023e4:	ff010113          	addi	sp,sp,-16
    800023e8:	00813423          	sd	s0,8(sp)
    800023ec:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    800023f0:	14109073          	csrw	sepc,ra
    // if(kernel){
    //     __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    // }
    __asm__ volatile ("sret");
    800023f4:	10200073          	sret
}
    800023f8:	00813403          	ld	s0,8(sp)
    800023fc:	01010113          	addi	sp,sp,16
    80002400:	00008067          	ret

0000000080002404 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002404:	fe010113          	addi	sp,sp,-32
    80002408:	00113c23          	sd	ra,24(sp)
    8000240c:	00813823          	sd	s0,16(sp)
    80002410:	00913423          	sd	s1,8(sp)
    80002414:	01213023          	sd	s2,0(sp)
    80002418:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    8000241c:	08053483          	ld	s1,128(a0)
    while(current != 0){
    80002420:	0c048e63          	beqz	s1,800024fc <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    80002424:	0004c503          	lbu	a0,0(s1)
    80002428:	0014c783          	lbu	a5,1(s1)
    8000242c:	00879793          	slli	a5,a5,0x8
    80002430:	00a7e7b3          	or	a5,a5,a0
    80002434:	0024c503          	lbu	a0,2(s1)
    80002438:	01051513          	slli	a0,a0,0x10
    8000243c:	00f567b3          	or	a5,a0,a5
    80002440:	0034c503          	lbu	a0,3(s1)
    80002444:	01851513          	slli	a0,a0,0x18
    80002448:	00f56533          	or	a0,a0,a5
    8000244c:	0044c783          	lbu	a5,4(s1)
    80002450:	02079793          	slli	a5,a5,0x20
    80002454:	00a7e533          	or	a0,a5,a0
    80002458:	0054c783          	lbu	a5,5(s1)
    8000245c:	02879793          	slli	a5,a5,0x28
    80002460:	00a7e7b3          	or	a5,a5,a0
    80002464:	0064c503          	lbu	a0,6(s1)
    80002468:	03051513          	slli	a0,a0,0x30
    8000246c:	00f567b3          	or	a5,a0,a5
    80002470:	0074c503          	lbu	a0,7(s1)
    80002474:	03851513          	slli	a0,a0,0x38
    80002478:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    8000247c:	0a053783          	ld	a5,160(a0)
    80002480:	ffd7f793          	andi	a5,a5,-3
    80002484:	0af53023          	sd	a5,160(a0)
        Scheduler::put(thread);
    80002488:	00001097          	auipc	ra,0x1
    8000248c:	6bc080e7          	jalr	1724(ra) # 80003b44 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80002490:	0084c903          	lbu	s2,8(s1)
    80002494:	0094c783          	lbu	a5,9(s1)
    80002498:	00879793          	slli	a5,a5,0x8
    8000249c:	0127e7b3          	or	a5,a5,s2
    800024a0:	00a4c903          	lbu	s2,10(s1)
    800024a4:	01091913          	slli	s2,s2,0x10
    800024a8:	00f967b3          	or	a5,s2,a5
    800024ac:	00b4c903          	lbu	s2,11(s1)
    800024b0:	01891913          	slli	s2,s2,0x18
    800024b4:	00f96933          	or	s2,s2,a5
    800024b8:	00c4c783          	lbu	a5,12(s1)
    800024bc:	02079793          	slli	a5,a5,0x20
    800024c0:	0127e933          	or	s2,a5,s2
    800024c4:	00d4c783          	lbu	a5,13(s1)
    800024c8:	02879793          	slli	a5,a5,0x28
    800024cc:	0127e7b3          	or	a5,a5,s2
    800024d0:	00e4c903          	lbu	s2,14(s1)
    800024d4:	03091913          	slli	s2,s2,0x30
    800024d8:	00f967b3          	or	a5,s2,a5
    800024dc:	00f4c903          	lbu	s2,15(s1)
    800024e0:	03891913          	slli	s2,s2,0x38
    800024e4:	00f96933          	or	s2,s2,a5
        mem_free(current);
    800024e8:	00048513          	mv	a0,s1
    800024ec:	fffff097          	auipc	ra,0xfffff
    800024f0:	f68080e7          	jalr	-152(ra) # 80001454 <_Z8mem_freePv>
        current = next;
    800024f4:	00090493          	mv	s1,s2
    while(current != 0){
    800024f8:	f29ff06f          	j	80002420 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    800024fc:	01813083          	ld	ra,24(sp)
    80002500:	01013403          	ld	s0,16(sp)
    80002504:	00813483          	ld	s1,8(sp)
    80002508:	00013903          	ld	s2,0(sp)
    8000250c:	02010113          	addi	sp,sp,32
    80002510:	00008067          	ret

0000000080002514 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80002514:	fc010113          	addi	sp,sp,-64
    80002518:	02113c23          	sd	ra,56(sp)
    8000251c:	02813823          	sd	s0,48(sp)
    80002520:	02913423          	sd	s1,40(sp)
    80002524:	03213023          	sd	s2,32(sp)
    80002528:	01313c23          	sd	s3,24(sp)
    8000252c:	01413823          	sd	s4,16(sp)
    80002530:	01513423          	sd	s5,8(sp)
    80002534:	04010413          	addi	s0,sp,64
    80002538:	00050493          	mv	s1,a0
    8000253c:	00058913          	mv	s2,a1
    80002540:	00060a93          	mv	s5,a2
    80002544:	00068993          	mv	s3,a3
    80002548:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    8000254c:	0b800513          	li	a0,184
    80002550:	fffff097          	auipc	ra,0xfffff
    80002554:	ed4080e7          	jalr	-300(ra) # 80001424 <_Z9mem_allocm>
    80002558:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    8000255c:	18050063          	beqz	a0,800026dc <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    80002560:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    80002564:	0004b783          	ld	a5,0(s1)
    80002568:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    8000256c:	00006717          	auipc	a4,0x6
    80002570:	ad470713          	addi	a4,a4,-1324 # 80008040 <_ZN7_thread6nextIDE>
    80002574:	00072783          	lw	a5,0(a4)
    80002578:	0017869b          	addiw	a3,a5,1
    8000257c:	00d72023          	sw	a3,0(a4)
    80002580:	0004b703          	ld	a4,0(s1)
    80002584:	00f72023          	sw	a5,0(a4)
    (*thread)->closed = false;
    80002588:	0004b703          	ld	a4,0(s1)
    8000258c:	0a073783          	ld	a5,160(a4)
    80002590:	ffe7f793          	andi	a5,a5,-2
    80002594:	0af73023          	sd	a5,160(a4)
    (*thread)->blocked = false;
    80002598:	0004b703          	ld	a4,0(s1)
    8000259c:	0a073783          	ld	a5,160(a4)
    800025a0:	ffd7f793          	andi	a5,a5,-3
    800025a4:	0af73023          	sd	a5,160(a4)
    (*thread)->sleeping = false;
    800025a8:	0004b703          	ld	a4,0(s1)
    800025ac:	0a073783          	ld	a5,160(a4)
    800025b0:	ffb7f793          	andi	a5,a5,-5
    800025b4:	0af73023          	sd	a5,160(a4)
    (*thread)->finished = false;
    800025b8:	0004b703          	ld	a4,0(s1)
    800025bc:	0a073783          	ld	a5,160(a4)
    800025c0:	ff77f793          	andi	a5,a5,-9
    800025c4:	0af73023          	sd	a5,160(a4)
    (*thread)->kernel = (function == 0);
    800025c8:	0004b703          	ld	a4,0(s1)
    800025cc:	00193913          	seqz	s2,s2
    800025d0:	00491913          	slli	s2,s2,0x4
    800025d4:	0a073783          	ld	a5,160(a4)
    800025d8:	fef7f793          	andi	a5,a5,-17
    800025dc:	0127e933          	or	s2,a5,s2
    800025e0:	0b273023          	sd	s2,160(a4)
    (*thread)->reserved = 0;
    800025e4:	0004b703          	ld	a4,0(s1)
    800025e8:	0a073783          	ld	a5,160(a4)
    800025ec:	00005697          	auipc	a3,0x5
    800025f0:	ae46b683          	ld	a3,-1308(a3) # 800070d0 <CONSOLE_STATUS+0xc0>
    800025f4:	00d7f7b3          	and	a5,a5,a3
    800025f8:	0af73023          	sd	a5,160(a4)
    (*thread)->joinHead = 0;
    800025fc:	0004b783          	ld	a5,0(s1)
    80002600:	0807b023          	sd	zero,128(a5)
    (*thread)->joinTail = 0;
    80002604:	0004b783          	ld	a5,0(s1)
    80002608:	0807b423          	sd	zero,136(a5)
    (*thread)->timeLeft = 0;
    8000260c:	0004b783          	ld	a5,0(s1)
    80002610:	0807b823          	sd	zero,144(a5)
    (*thread)->stackStart = 0;
    80002614:	0004b783          	ld	a5,0(s1)
    80002618:	0807bc23          	sd	zero,152(a5)

    (*thread)->context.s0 = 0;
    8000261c:	0004b783          	ld	a5,0(s1)
    80002620:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s1 = 0;
    80002624:	0004b783          	ld	a5,0(s1)
    80002628:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s2 = 0;
    8000262c:	0004b783          	ld	a5,0(s1)
    80002630:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s3 = 0;
    80002634:	0004b783          	ld	a5,0(s1)
    80002638:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s4 = 0;
    8000263c:	0004b783          	ld	a5,0(s1)
    80002640:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s5 = 0;
    80002644:	0004b783          	ld	a5,0(s1)
    80002648:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s6 = 0;
    8000264c:	0004b783          	ld	a5,0(s1)
    80002650:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s7 = 0;
    80002654:	0004b783          	ld	a5,0(s1)
    80002658:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s8 = 0;
    8000265c:	0004b783          	ld	a5,0(s1)
    80002660:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s9 = 0;
    80002664:	0004b783          	ld	a5,0(s1)
    80002668:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s10 = 0;
    8000266c:	0004b783          	ld	a5,0(s1)
    80002670:	0607b423          	sd	zero,104(a5)
    (*thread)->context.s11 = 0;
    80002674:	0004b783          	ld	a5,0(s1)
    80002678:	0607b823          	sd	zero,112(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    8000267c:	0004b783          	ld	a5,0(s1)
    80002680:	0137b823          	sd	s3,16(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80002684:	0004b783          	ld	a5,0(s1)
    80002688:	00000717          	auipc	a4,0x0
    8000268c:	42c70713          	addi	a4,a4,1068 # 80002ab4 <_ZN7_thread7wrapperEv>
    80002690:	00e7b423          	sd	a4,8(a5)

    (*thread)->stackStart = stack;
    80002694:	0004b783          	ld	a5,0(s1)
    80002698:	0937bc23          	sd	s3,152(a5)
    if(start){
    8000269c:	020a1663          	bnez	s4,800026c8 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    800026a0:	00000513          	li	a0,0
}
    800026a4:	03813083          	ld	ra,56(sp)
    800026a8:	03013403          	ld	s0,48(sp)
    800026ac:	02813483          	ld	s1,40(sp)
    800026b0:	02013903          	ld	s2,32(sp)
    800026b4:	01813983          	ld	s3,24(sp)
    800026b8:	01013a03          	ld	s4,16(sp)
    800026bc:	00813a83          	ld	s5,8(sp)
    800026c0:	04010113          	addi	sp,sp,64
    800026c4:	00008067          	ret
        Scheduler::put(*thread);
    800026c8:	0004b503          	ld	a0,0(s1)
    800026cc:	00001097          	auipc	ra,0x1
    800026d0:	478080e7          	jalr	1144(ra) # 80003b44 <_ZN9Scheduler3putEP7_thread>
    return 0;
    800026d4:	00000513          	li	a0,0
    800026d8:	fcdff06f          	j	800026a4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    800026dc:	fff00513          	li	a0,-1
    800026e0:	fc5ff06f          	j	800026a4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

00000000800026e4 <_ZN7_thread10setBlockedEb>:
    currentThread->finished = 1;
    dispatch();
    return 0;
}

void _thread::setBlocked(bool blocked){
    800026e4:	ff010113          	addi	sp,sp,-16
    800026e8:	00813423          	sd	s0,8(sp)
    800026ec:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    800026f0:	0015f593          	andi	a1,a1,1
    800026f4:	00159793          	slli	a5,a1,0x1
    800026f8:	0a053583          	ld	a1,160(a0)
    800026fc:	ffd5f593          	andi	a1,a1,-3
    80002700:	00f5e5b3          	or	a1,a1,a5
    80002704:	0ab53023          	sd	a1,160(a0)
}
    80002708:	00813403          	ld	s0,8(sp)
    8000270c:	01010113          	addi	sp,sp,16
    80002710:	00008067          	ret

0000000080002714 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80002714:	ff010113          	addi	sp,sp,-16
    80002718:	00813423          	sd	s0,8(sp)
    8000271c:	01010413          	addi	s0,sp,16
    this->closed = closed;
    80002720:	0015f793          	andi	a5,a1,1
    80002724:	0a053583          	ld	a1,160(a0)
    80002728:	ffe5f593          	andi	a1,a1,-2
    8000272c:	00f5e5b3          	or	a1,a1,a5
    80002730:	0ab53023          	sd	a1,160(a0)
}
    80002734:	00813403          	ld	s0,8(sp)
    80002738:	01010113          	addi	sp,sp,16
    8000273c:	00008067          	ret

0000000080002740 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    80002740:	ff010113          	addi	sp,sp,-16
    80002744:	00813423          	sd	s0,8(sp)
    80002748:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    8000274c:	0015f593          	andi	a1,a1,1
    80002750:	00259793          	slli	a5,a1,0x2
    80002754:	0a053583          	ld	a1,160(a0)
    80002758:	ffb5f593          	andi	a1,a1,-5
    8000275c:	00f5e5b3          	or	a1,a1,a5
    80002760:	0ab53023          	sd	a1,160(a0)
}
    80002764:	00813403          	ld	s0,8(sp)
    80002768:	01010113          	addi	sp,sp,16
    8000276c:	00008067          	ret

0000000080002770 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
    __putc('0' + currentThread->ID);
    __putc('\n');
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    80002770:	ff010113          	addi	sp,sp,-16
    80002774:	00813423          	sd	s0,8(sp)
    80002778:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    8000277c:	04050263          	beqz	a0,800027c0 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    80002780:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    80002784:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    80002788:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    8000278c:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    80002790:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    80002794:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    80002798:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    8000279c:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    800027a0:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    800027a4:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    800027a8:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    800027ac:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    800027b0:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    800027b4:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    800027b8:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    800027bc:	06853823          	sd	s0,112(a0)
    }
    if(newContext->sp != 0){
    800027c0:	0085b783          	ld	a5,8(a1)
    800027c4:	00078463          	beqz	a5,800027cc <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    800027c8:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    800027cc:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    800027d0:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    800027d4:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    800027d8:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    800027dc:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    800027e0:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    800027e4:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    800027e8:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    800027ec:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    800027f0:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    800027f4:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    800027f8:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    800027fc:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    80002800:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    80002804:	0685bd83          	ld	s11,104(a1)

    return;

}
    80002808:	00813403          	ld	s0,8(sp)
    8000280c:	01010113          	addi	sp,sp,16
    80002810:	00008067          	ret

0000000080002814 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80002814:	fe010113          	addi	sp,sp,-32
    80002818:	00113c23          	sd	ra,24(sp)
    8000281c:	00813823          	sd	s0,16(sp)
    80002820:	00913423          	sd	s1,8(sp)
    80002824:	01213023          	sd	s2,0(sp)
    80002828:	02010413          	addi	s0,sp,32
    _thread* oldThread = currentThread;
    8000282c:	00006917          	auipc	s2,0x6
    80002830:	81490913          	addi	s2,s2,-2028 # 80008040 <_ZN7_thread6nextIDE>
    80002834:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    80002838:	00001097          	auipc	ra,0x1
    8000283c:	4fc080e7          	jalr	1276(ra) # 80003d34 <_ZN9Scheduler3getEv>
    80002840:	00a93423          	sd	a0,8(s2)
    if(currentThread == 0){
    80002844:	08050c63          	beqz	a0,800028dc <_ZN7_thread8dispatchEv+0xc8>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80002848:	00048863          	beqz	s1,80002858 <_ZN7_thread8dispatchEv+0x44>
    8000284c:	0a04b783          	ld	a5,160(s1)
    80002850:	00f7f793          	andi	a5,a5,15
    80002854:	08078a63          	beqz	a5,800028e8 <_ZN7_thread8dispatchEv+0xd4>
    __putc('d');
    80002858:	06400513          	li	a0,100
    8000285c:	00003097          	auipc	ra,0x3
    80002860:	720080e7          	jalr	1824(ra) # 80005f7c <__putc>
    if(oldThread != 0){
    80002864:	00048c63          	beqz	s1,8000287c <_ZN7_thread8dispatchEv+0x68>
        __putc('0' + oldThread->ID);
    80002868:	0004a503          	lw	a0,0(s1)
    8000286c:	0305051b          	addiw	a0,a0,48
    80002870:	0ff57513          	andi	a0,a0,255
    80002874:	00003097          	auipc	ra,0x3
    80002878:	708080e7          	jalr	1800(ra) # 80005f7c <__putc>
    __putc('0' + currentThread->ID);
    8000287c:	00005797          	auipc	a5,0x5
    80002880:	7cc7b783          	ld	a5,1996(a5) # 80008048 <_ZN7_thread13currentThreadE>
    80002884:	0007a503          	lw	a0,0(a5)
    80002888:	0305051b          	addiw	a0,a0,48
    8000288c:	0ff57513          	andi	a0,a0,255
    80002890:	00003097          	auipc	ra,0x3
    80002894:	6ec080e7          	jalr	1772(ra) # 80005f7c <__putc>
    __putc('\n');
    80002898:	00a00513          	li	a0,10
    8000289c:	00003097          	auipc	ra,0x3
    800028a0:	6e0080e7          	jalr	1760(ra) # 80005f7c <__putc>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    800028a4:	00048463          	beqz	s1,800028ac <_ZN7_thread8dispatchEv+0x98>
    800028a8:	00848493          	addi	s1,s1,8
    800028ac:	00005597          	auipc	a1,0x5
    800028b0:	79c5b583          	ld	a1,1948(a1) # 80008048 <_ZN7_thread13currentThreadE>
    800028b4:	00858593          	addi	a1,a1,8
    800028b8:	00048513          	mv	a0,s1
    800028bc:	00000097          	auipc	ra,0x0
    800028c0:	eb4080e7          	jalr	-332(ra) # 80002770 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    800028c4:	01813083          	ld	ra,24(sp)
    800028c8:	01013403          	ld	s0,16(sp)
    800028cc:	00813483          	ld	s1,8(sp)
    800028d0:	00013903          	ld	s2,0(sp)
    800028d4:	02010113          	addi	sp,sp,32
    800028d8:	00008067          	ret
        currentThread = oldThread;
    800028dc:	00005797          	auipc	a5,0x5
    800028e0:	7697b623          	sd	s1,1900(a5) # 80008048 <_ZN7_thread13currentThreadE>
        return;
    800028e4:	fe1ff06f          	j	800028c4 <_ZN7_thread8dispatchEv+0xb0>
            Scheduler::put(oldThread);
    800028e8:	00048513          	mv	a0,s1
    800028ec:	00001097          	auipc	ra,0x1
    800028f0:	258080e7          	jalr	600(ra) # 80003b44 <_ZN9Scheduler3putEP7_thread>
    800028f4:	f65ff06f          	j	80002858 <_ZN7_thread8dispatchEv+0x44>

00000000800028f8 <_ZN7_thread4joinEPS_>:
    if(thread->finished || thread->closed){
    800028f8:	0a05b783          	ld	a5,160(a1)
    800028fc:	0097f793          	andi	a5,a5,9
    80002900:	00078463          	beqz	a5,80002908 <_ZN7_thread4joinEPS_+0x10>
    80002904:	00008067          	ret
void _thread::join(thread_t thread){
    80002908:	fe010113          	addi	sp,sp,-32
    8000290c:	00113c23          	sd	ra,24(sp)
    80002910:	00813823          	sd	s0,16(sp)
    80002914:	00913423          	sd	s1,8(sp)
    80002918:	01213023          	sd	s2,0(sp)
    8000291c:	02010413          	addi	s0,sp,32
    80002920:	00050493          	mv	s1,a0
    80002924:	00058913          	mv	s2,a1
    __putc('j');
    80002928:	06a00513          	li	a0,106
    8000292c:	00003097          	auipc	ra,0x3
    80002930:	650080e7          	jalr	1616(ra) # 80005f7c <__putc>
    __putc('0' + thread->ID);
    80002934:	00092503          	lw	a0,0(s2)
    80002938:	0305051b          	addiw	a0,a0,48
    8000293c:	0ff57513          	andi	a0,a0,255
    80002940:	00003097          	auipc	ra,0x3
    80002944:	63c080e7          	jalr	1596(ra) # 80005f7c <__putc>
    __putc('\n');
    80002948:	00a00513          	li	a0,10
    8000294c:	00003097          	auipc	ra,0x3
    80002950:	630080e7          	jalr	1584(ra) # 80005f7c <__putc>
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    80002954:	01000513          	li	a0,16
    80002958:	fffff097          	auipc	ra,0xfffff
    8000295c:	acc080e7          	jalr	-1332(ra) # 80001424 <_Z9mem_allocm>
    this->blocked = true;
    80002960:	0a04b703          	ld	a4,160(s1)
    80002964:	00276713          	ori	a4,a4,2
    80002968:	0ae4b023          	sd	a4,160(s1)
    newJoin->thread = this;
    8000296c:	00950023          	sb	s1,0(a0)
    80002970:	0084d713          	srli	a4,s1,0x8
    80002974:	00e500a3          	sb	a4,1(a0)
    80002978:	0104d713          	srli	a4,s1,0x10
    8000297c:	00e50123          	sb	a4,2(a0)
    80002980:	0184d71b          	srliw	a4,s1,0x18
    80002984:	00e501a3          	sb	a4,3(a0)
    80002988:	0204d713          	srli	a4,s1,0x20
    8000298c:	00e50223          	sb	a4,4(a0)
    80002990:	0284d713          	srli	a4,s1,0x28
    80002994:	00e502a3          	sb	a4,5(a0)
    80002998:	0304d713          	srli	a4,s1,0x30
    8000299c:	00e50323          	sb	a4,6(a0)
    800029a0:	0384d493          	srli	s1,s1,0x38
    800029a4:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    800029a8:	00050423          	sb	zero,8(a0)
    800029ac:	000504a3          	sb	zero,9(a0)
    800029b0:	00050523          	sb	zero,10(a0)
    800029b4:	000505a3          	sb	zero,11(a0)
    800029b8:	00050623          	sb	zero,12(a0)
    800029bc:	000506a3          	sb	zero,13(a0)
    800029c0:	00050723          	sb	zero,14(a0)
    800029c4:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    800029c8:	08093703          	ld	a4,128(s2)
    800029cc:	06070463          	beqz	a4,80002a34 <_ZN7_thread4joinEPS_+0x13c>
        thread->joinTail->next = newJoin;
    800029d0:	08893703          	ld	a4,136(s2)
    800029d4:	00a70423          	sb	a0,8(a4)
    800029d8:	00855693          	srli	a3,a0,0x8
    800029dc:	00d704a3          	sb	a3,9(a4)
    800029e0:	01055693          	srli	a3,a0,0x10
    800029e4:	00d70523          	sb	a3,10(a4)
    800029e8:	0185569b          	srliw	a3,a0,0x18
    800029ec:	00d705a3          	sb	a3,11(a4)
    800029f0:	02055693          	srli	a3,a0,0x20
    800029f4:	00d70623          	sb	a3,12(a4)
    800029f8:	02855693          	srli	a3,a0,0x28
    800029fc:	00d706a3          	sb	a3,13(a4)
    80002a00:	03055693          	srli	a3,a0,0x30
    80002a04:	00d70723          	sb	a3,14(a4)
    80002a08:	03855693          	srli	a3,a0,0x38
    80002a0c:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    80002a10:	08a93423          	sd	a0,136(s2)
    dispatch();
    80002a14:	00000097          	auipc	ra,0x0
    80002a18:	e00080e7          	jalr	-512(ra) # 80002814 <_ZN7_thread8dispatchEv>
}
    80002a1c:	01813083          	ld	ra,24(sp)
    80002a20:	01013403          	ld	s0,16(sp)
    80002a24:	00813483          	ld	s1,8(sp)
    80002a28:	00013903          	ld	s2,0(sp)
    80002a2c:	02010113          	addi	sp,sp,32
    80002a30:	00008067          	ret
        thread->joinHead = newJoin;
    80002a34:	08a93023          	sd	a0,128(s2)
        thread->joinTail = newJoin;
    80002a38:	08a93423          	sd	a0,136(s2)
    80002a3c:	fd9ff06f          	j	80002a14 <_ZN7_thread4joinEPS_+0x11c>

0000000080002a40 <_ZN7_thread4exitEv>:
    if(currentThread->closed){
    80002a40:	00005717          	auipc	a4,0x5
    80002a44:	60873703          	ld	a4,1544(a4) # 80008048 <_ZN7_thread13currentThreadE>
    80002a48:	0a073783          	ld	a5,160(a4)
    80002a4c:	0017f693          	andi	a3,a5,1
    80002a50:	04069663          	bnez	a3,80002a9c <_ZN7_thread4exitEv+0x5c>
    if(currentThread->blocked){
    80002a54:	0027f693          	andi	a3,a5,2
    80002a58:	04069663          	bnez	a3,80002aa4 <_ZN7_thread4exitEv+0x64>
    if(currentThread->sleeping){
    80002a5c:	0047f793          	andi	a5,a5,4
    80002a60:	04079663          	bnez	a5,80002aac <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    80002a64:	ff010113          	addi	sp,sp,-16
    80002a68:	00113423          	sd	ra,8(sp)
    80002a6c:	00813023          	sd	s0,0(sp)
    80002a70:	01010413          	addi	s0,sp,16
    currentThread->finished = 1;
    80002a74:	0a073783          	ld	a5,160(a4)
    80002a78:	0087e793          	ori	a5,a5,8
    80002a7c:	0af73023          	sd	a5,160(a4)
    dispatch();
    80002a80:	00000097          	auipc	ra,0x0
    80002a84:	d94080e7          	jalr	-620(ra) # 80002814 <_ZN7_thread8dispatchEv>
    return 0;
    80002a88:	00000513          	li	a0,0
}
    80002a8c:	00813083          	ld	ra,8(sp)
    80002a90:	00013403          	ld	s0,0(sp)
    80002a94:	01010113          	addi	sp,sp,16
    80002a98:	00008067          	ret
        return -1;
    80002a9c:	fff00513          	li	a0,-1
    80002aa0:	00008067          	ret
        return -2;
    80002aa4:	ffe00513          	li	a0,-2
    80002aa8:	00008067          	ret
        return -3;
    80002aac:	ffd00513          	li	a0,-3
}
    80002ab0:	00008067          	ret

0000000080002ab4 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80002ab4:	fe010113          	addi	sp,sp,-32
    80002ab8:	00113c23          	sd	ra,24(sp)
    80002abc:	00813823          	sd	s0,16(sp)
    80002ac0:	00913423          	sd	s1,8(sp)
    80002ac4:	02010413          	addi	s0,sp,32
    popSppSpie(currentThread->kernel);
    80002ac8:	00005497          	auipc	s1,0x5
    80002acc:	57848493          	addi	s1,s1,1400 # 80008040 <_ZN7_thread6nextIDE>
    80002ad0:	0084b783          	ld	a5,8(s1)
    80002ad4:	0a07b503          	ld	a0,160(a5)
    80002ad8:	00455513          	srli	a0,a0,0x4
    80002adc:	00157513          	andi	a0,a0,1
    80002ae0:	00000097          	auipc	ra,0x0
    80002ae4:	904080e7          	jalr	-1788(ra) # 800023e4 <_Z10popSppSpieb>
    currentThread->function(currentThread->arg);
    80002ae8:	0084b783          	ld	a5,8(s1)
    80002aec:	0a87b703          	ld	a4,168(a5)
    80002af0:	0b07b503          	ld	a0,176(a5)
    80002af4:	000700e7          	jalr	a4
    currentThread->unJoin();
    80002af8:	0084b503          	ld	a0,8(s1)
    80002afc:	00000097          	auipc	ra,0x0
    80002b00:	908080e7          	jalr	-1784(ra) # 80002404 <_ZN7_thread6unJoinEv>
    exit();
    80002b04:	00000097          	auipc	ra,0x0
    80002b08:	f3c080e7          	jalr	-196(ra) # 80002a40 <_ZN7_thread4exitEv>
}
    80002b0c:	01813083          	ld	ra,24(sp)
    80002b10:	01013403          	ld	s0,16(sp)
    80002b14:	00813483          	ld	s1,8(sp)
    80002b18:	02010113          	addi	sp,sp,32
    80002b1c:	00008067          	ret

0000000080002b20 <_ZN11HeapManagerC1Ev>:
#include "hw.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80002b20:	fe010113          	addi	sp,sp,-32
    80002b24:	00113c23          	sd	ra,24(sp)
    80002b28:	00813823          	sd	s0,16(sp)
    80002b2c:	00913423          	sd	s1,8(sp)
    80002b30:	02010413          	addi	s0,sp,32
    80002b34:	00050493          	mv	s1,a0
    assert(instance == 0);
    80002b38:	00005797          	auipc	a5,0x5
    80002b3c:	5187b783          	ld	a5,1304(a5) # 80008050 <_ZN11HeapManager8instanceE>
    80002b40:	02079063          	bnez	a5,80002b60 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80002b44:	00005797          	auipc	a5,0x5
    80002b48:	5097b623          	sd	s1,1292(a5) # 80008050 <_ZN11HeapManager8instanceE>
}
    80002b4c:	01813083          	ld	ra,24(sp)
    80002b50:	01013403          	ld	s0,16(sp)
    80002b54:	00813483          	ld	s1,8(sp)
    80002b58:	02010113          	addi	sp,sp,32
    80002b5c:	00008067          	ret
    assert(instance == 0);
    80002b60:	00004697          	auipc	a3,0x4
    80002b64:	57868693          	addi	a3,a3,1400 # 800070d8 <CONSOLE_STATUS+0xc8>
    80002b68:	01300613          	li	a2,19
    80002b6c:	00004597          	auipc	a1,0x4
    80002b70:	58c58593          	addi	a1,a1,1420 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002b74:	00004517          	auipc	a0,0x4
    80002b78:	4cc50513          	addi	a0,a0,1228 # 80007040 <CONSOLE_STATUS+0x30>
    80002b7c:	fffff097          	auipc	ra,0xfffff
    80002b80:	e0c080e7          	jalr	-500(ra) # 80001988 <_Z13assert_failedPKcS0_jS0_>
    80002b84:	fc1ff06f          	j	80002b44 <_ZN11HeapManagerC1Ev+0x24>

0000000080002b88 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80002b88:	ff010113          	addi	sp,sp,-16
    80002b8c:	00813423          	sd	s0,8(sp)
    80002b90:	01010413          	addi	s0,sp,16
    
}
    80002b94:	00813403          	ld	s0,8(sp)
    80002b98:	01010113          	addi	sp,sp,16
    80002b9c:	00008067          	ret

0000000080002ba0 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    80002ba0:	fd010113          	addi	sp,sp,-48
    80002ba4:	02113423          	sd	ra,40(sp)
    80002ba8:	02813023          	sd	s0,32(sp)
    80002bac:	00913c23          	sd	s1,24(sp)
    80002bb0:	01213823          	sd	s2,16(sp)
    80002bb4:	01313423          	sd	s3,8(sp)
    80002bb8:	03010413          	addi	s0,sp,48
    80002bbc:	00050993          	mv	s3,a0
    80002bc0:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002bc4:	40b604b3          	sub	s1,a2,a1
    80002bc8:	0414b793          	sltiu	a5,s1,65
    80002bcc:	0c079863          	bnez	a5,80002c9c <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80002bd0:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80002bd4:	fde00793          	li	a5,-34
    80002bd8:	00f90c23          	sb	a5,24(s2)
    80002bdc:	fc000713          	li	a4,-64
    80002be0:	00e90ca3          	sb	a4,25(s2)
    80002be4:	fad00713          	li	a4,-83
    80002be8:	00e90d23          	sb	a4,26(s2)
    80002bec:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart - MEM_BLOCK_SIZE) / MEM_BLOCK_SIZE;
    80002bf0:	fc048613          	addi	a2,s1,-64
    80002bf4:	0009b783          	ld	a5,0(s3)
    80002bf8:	00665713          	srli	a4,a2,0x6
    80002bfc:	00e78823          	sb	a4,16(a5)
    80002c00:	00e65713          	srli	a4,a2,0xe
    80002c04:	00e788a3          	sb	a4,17(a5)
    80002c08:	01665713          	srli	a4,a2,0x16
    80002c0c:	00e78923          	sb	a4,18(a5)
    80002c10:	01e65713          	srli	a4,a2,0x1e
    80002c14:	00e789a3          	sb	a4,19(a5)
    80002c18:	02665713          	srli	a4,a2,0x26
    80002c1c:	00e78a23          	sb	a4,20(a5)
    80002c20:	02e65713          	srli	a4,a2,0x2e
    80002c24:	00e78aa3          	sb	a4,21(a5)
    80002c28:	03665713          	srli	a4,a2,0x36
    80002c2c:	00e78b23          	sb	a4,22(a5)
    80002c30:	03e65613          	srli	a2,a2,0x3e
    80002c34:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80002c38:	0009b783          	ld	a5,0(s3)
    80002c3c:	00078023          	sb	zero,0(a5)
    80002c40:	000780a3          	sb	zero,1(a5)
    80002c44:	00078123          	sb	zero,2(a5)
    80002c48:	000781a3          	sb	zero,3(a5)
    80002c4c:	00078223          	sb	zero,4(a5)
    80002c50:	000782a3          	sb	zero,5(a5)
    80002c54:	00078323          	sb	zero,6(a5)
    80002c58:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80002c5c:	0009b783          	ld	a5,0(s3)
    80002c60:	00078423          	sb	zero,8(a5)
    80002c64:	000784a3          	sb	zero,9(a5)
    80002c68:	00078523          	sb	zero,10(a5)
    80002c6c:	000785a3          	sb	zero,11(a5)
    80002c70:	00078623          	sb	zero,12(a5)
    80002c74:	000786a3          	sb	zero,13(a5)
    80002c78:	00078723          	sb	zero,14(a5)
    80002c7c:	000787a3          	sb	zero,15(a5)
}
    80002c80:	02813083          	ld	ra,40(sp)
    80002c84:	02013403          	ld	s0,32(sp)
    80002c88:	01813483          	ld	s1,24(sp)
    80002c8c:	01013903          	ld	s2,16(sp)
    80002c90:	00813983          	ld	s3,8(sp)
    80002c94:	03010113          	addi	sp,sp,48
    80002c98:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002c9c:	00004697          	auipc	a3,0x4
    80002ca0:	47468693          	addi	a3,a3,1140 # 80007110 <CONSOLE_STATUS+0x100>
    80002ca4:	01c00613          	li	a2,28
    80002ca8:	00004597          	auipc	a1,0x4
    80002cac:	45058593          	addi	a1,a1,1104 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002cb0:	00004517          	auipc	a0,0x4
    80002cb4:	49050513          	addi	a0,a0,1168 # 80007140 <CONSOLE_STATUS+0x130>
    80002cb8:	fffff097          	auipc	ra,0xfffff
    80002cbc:	cd0080e7          	jalr	-816(ra) # 80001988 <_Z13assert_failedPKcS0_jS0_>
    80002cc0:	f11ff06f          	j	80002bd0 <_ZN11HeapManager4initEmm+0x30>

0000000080002cc4 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80002cc4:	fe010113          	addi	sp,sp,-32
    80002cc8:	00113c23          	sd	ra,24(sp)
    80002ccc:	00813823          	sd	s0,16(sp)
    80002cd0:	00913423          	sd	s1,8(sp)
    80002cd4:	01213023          	sd	s2,0(sp)
    80002cd8:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002cdc:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80002ce0:	00000913          	li	s2,0
    80002ce4:	0b80006f          	j	80002d9c <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        /// how is this an illegal read???
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80002ce8:	0104c783          	lbu	a5,16(s1)
    80002cec:	0114c703          	lbu	a4,17(s1)
    80002cf0:	00871713          	slli	a4,a4,0x8
    80002cf4:	00f76733          	or	a4,a4,a5
    80002cf8:	0124c783          	lbu	a5,18(s1)
    80002cfc:	01079793          	slli	a5,a5,0x10
    80002d00:	00e7e733          	or	a4,a5,a4
    80002d04:	0134c783          	lbu	a5,19(s1)
    80002d08:	01879793          	slli	a5,a5,0x18
    80002d0c:	00e7e7b3          	or	a5,a5,a4
    80002d10:	0144c703          	lbu	a4,20(s1)
    80002d14:	02071713          	slli	a4,a4,0x20
    80002d18:	00f767b3          	or	a5,a4,a5
    80002d1c:	0154c703          	lbu	a4,21(s1)
    80002d20:	02871713          	slli	a4,a4,0x28
    80002d24:	00f76733          	or	a4,a4,a5
    80002d28:	0164c783          	lbu	a5,22(s1)
    80002d2c:	03079793          	slli	a5,a5,0x30
    80002d30:	00e7e733          	or	a4,a5,a4
    80002d34:	0174c783          	lbu	a5,23(s1)
    80002d38:	03879793          	slli	a5,a5,0x38
    80002d3c:	00e7e7b3          	or	a5,a5,a4
    80002d40:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80002d44:	0004c703          	lbu	a4,0(s1)
    80002d48:	0014c783          	lbu	a5,1(s1)
    80002d4c:	00879793          	slli	a5,a5,0x8
    80002d50:	00e7e733          	or	a4,a5,a4
    80002d54:	0024c783          	lbu	a5,2(s1)
    80002d58:	01079793          	slli	a5,a5,0x10
    80002d5c:	00e7e7b3          	or	a5,a5,a4
    80002d60:	0034c703          	lbu	a4,3(s1)
    80002d64:	01871713          	slli	a4,a4,0x18
    80002d68:	00f767b3          	or	a5,a4,a5
    80002d6c:	0044c703          	lbu	a4,4(s1)
    80002d70:	02071713          	slli	a4,a4,0x20
    80002d74:	00f76733          	or	a4,a4,a5
    80002d78:	0054c783          	lbu	a5,5(s1)
    80002d7c:	02879793          	slli	a5,a5,0x28
    80002d80:	00e7e733          	or	a4,a5,a4
    80002d84:	0064c783          	lbu	a5,6(s1)
    80002d88:	03079793          	slli	a5,a5,0x30
    80002d8c:	00e7e7b3          	or	a5,a5,a4
    80002d90:	0074c483          	lbu	s1,7(s1)
    80002d94:	03849493          	slli	s1,s1,0x38
    80002d98:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002d9c:	06048263          	beqz	s1,80002e00 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002da0:	0184c783          	lbu	a5,24(s1)
    80002da4:	0194c703          	lbu	a4,25(s1)
    80002da8:	00871713          	slli	a4,a4,0x8
    80002dac:	00f76733          	or	a4,a4,a5
    80002db0:	01a4c783          	lbu	a5,26(s1)
    80002db4:	01079793          	slli	a5,a5,0x10
    80002db8:	00e7e733          	or	a4,a5,a4
    80002dbc:	01b4c783          	lbu	a5,27(s1)
    80002dc0:	01879793          	slli	a5,a5,0x18
    80002dc4:	00e7e7b3          	or	a5,a5,a4
    80002dc8:	0007879b          	sext.w	a5,a5
    80002dcc:	deadc737          	lui	a4,0xdeadc
    80002dd0:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2e1e>
    80002dd4:	f0e78ae3          	beq	a5,a4,80002ce8 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80002dd8:	00004697          	auipc	a3,0x4
    80002ddc:	38868693          	addi	a3,a3,904 # 80007160 <CONSOLE_STATUS+0x150>
    80002de0:	02a00613          	li	a2,42
    80002de4:	00004597          	auipc	a1,0x4
    80002de8:	31458593          	addi	a1,a1,788 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002dec:	00004517          	auipc	a0,0x4
    80002df0:	39c50513          	addi	a0,a0,924 # 80007188 <CONSOLE_STATUS+0x178>
    80002df4:	fffff097          	auipc	ra,0xfffff
    80002df8:	b94080e7          	jalr	-1132(ra) # 80001988 <_Z13assert_failedPKcS0_jS0_>
    80002dfc:	eedff06f          	j	80002ce8 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80002e00:	00090513          	mv	a0,s2
    80002e04:	01813083          	ld	ra,24(sp)
    80002e08:	01013403          	ld	s0,16(sp)
    80002e0c:	00813483          	ld	s1,8(sp)
    80002e10:	00013903          	ld	s2,0(sp)
    80002e14:	02010113          	addi	sp,sp,32
    80002e18:	00008067          	ret

0000000080002e1c <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80002e1c:	fd010113          	addi	sp,sp,-48
    80002e20:	02113423          	sd	ra,40(sp)
    80002e24:	02813023          	sd	s0,32(sp)
    80002e28:	00913c23          	sd	s1,24(sp)
    80002e2c:	01213823          	sd	s2,16(sp)
    80002e30:	01313423          	sd	s3,8(sp)
    80002e34:	03010413          	addi	s0,sp,48
    80002e38:	00050993          	mv	s3,a0
    80002e3c:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002e40:	00053483          	ld	s1,0(a0)
    80002e44:	0b80006f          	j	80002efc <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80002e48:	0104c783          	lbu	a5,16(s1)
    80002e4c:	0114c703          	lbu	a4,17(s1)
    80002e50:	00871713          	slli	a4,a4,0x8
    80002e54:	00f76733          	or	a4,a4,a5
    80002e58:	0124c783          	lbu	a5,18(s1)
    80002e5c:	01079793          	slli	a5,a5,0x10
    80002e60:	00e7e733          	or	a4,a5,a4
    80002e64:	0134c783          	lbu	a5,19(s1)
    80002e68:	01879793          	slli	a5,a5,0x18
    80002e6c:	00e7e7b3          	or	a5,a5,a4
    80002e70:	0144c703          	lbu	a4,20(s1)
    80002e74:	02071713          	slli	a4,a4,0x20
    80002e78:	00f767b3          	or	a5,a4,a5
    80002e7c:	0154c703          	lbu	a4,21(s1)
    80002e80:	02871713          	slli	a4,a4,0x28
    80002e84:	00f76733          	or	a4,a4,a5
    80002e88:	0164c783          	lbu	a5,22(s1)
    80002e8c:	03079793          	slli	a5,a5,0x30
    80002e90:	00e7e733          	or	a4,a5,a4
    80002e94:	0174c783          	lbu	a5,23(s1)
    80002e98:	03879793          	slli	a5,a5,0x38
    80002e9c:	00e7e7b3          	or	a5,a5,a4
    80002ea0:	0d27f063          	bgeu	a5,s2,80002f60 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80002ea4:	0004c703          	lbu	a4,0(s1)
    80002ea8:	0014c783          	lbu	a5,1(s1)
    80002eac:	00879793          	slli	a5,a5,0x8
    80002eb0:	00e7e733          	or	a4,a5,a4
    80002eb4:	0024c783          	lbu	a5,2(s1)
    80002eb8:	01079793          	slli	a5,a5,0x10
    80002ebc:	00e7e7b3          	or	a5,a5,a4
    80002ec0:	0034c703          	lbu	a4,3(s1)
    80002ec4:	01871713          	slli	a4,a4,0x18
    80002ec8:	00f767b3          	or	a5,a4,a5
    80002ecc:	0044c703          	lbu	a4,4(s1)
    80002ed0:	02071713          	slli	a4,a4,0x20
    80002ed4:	00f76733          	or	a4,a4,a5
    80002ed8:	0054c783          	lbu	a5,5(s1)
    80002edc:	02879793          	slli	a5,a5,0x28
    80002ee0:	00e7e733          	or	a4,a5,a4
    80002ee4:	0064c783          	lbu	a5,6(s1)
    80002ee8:	03079793          	slli	a5,a5,0x30
    80002eec:	00e7e7b3          	or	a5,a5,a4
    80002ef0:	0074c483          	lbu	s1,7(s1)
    80002ef4:	03849493          	slli	s1,s1,0x38
    80002ef8:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002efc:	4e048c63          	beqz	s1,800033f4 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002f00:	0184c783          	lbu	a5,24(s1)
    80002f04:	0194c703          	lbu	a4,25(s1)
    80002f08:	00871713          	slli	a4,a4,0x8
    80002f0c:	00f76733          	or	a4,a4,a5
    80002f10:	01a4c783          	lbu	a5,26(s1)
    80002f14:	01079793          	slli	a5,a5,0x10
    80002f18:	00e7e733          	or	a4,a5,a4
    80002f1c:	01b4c783          	lbu	a5,27(s1)
    80002f20:	01879793          	slli	a5,a5,0x18
    80002f24:	00e7e7b3          	or	a5,a5,a4
    80002f28:	0007879b          	sext.w	a5,a5
    80002f2c:	deadc737          	lui	a4,0xdeadc
    80002f30:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2e1e>
    80002f34:	f0e78ae3          	beq	a5,a4,80002e48 <_ZN11HeapManager12heapAllocateEm+0x2c>
    80002f38:	00004697          	auipc	a3,0x4
    80002f3c:	27868693          	addi	a3,a3,632 # 800071b0 <CONSOLE_STATUS+0x1a0>
    80002f40:	03400613          	li	a2,52
    80002f44:	00004597          	auipc	a1,0x4
    80002f48:	1b458593          	addi	a1,a1,436 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002f4c:	00004517          	auipc	a0,0x4
    80002f50:	23c50513          	addi	a0,a0,572 # 80007188 <CONSOLE_STATUS+0x178>
    80002f54:	fffff097          	auipc	ra,0xfffff
    80002f58:	a34080e7          	jalr	-1484(ra) # 80001988 <_Z13assert_failedPKcS0_jS0_>
    80002f5c:	eedff06f          	j	80002e48 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80002f60:	00190713          	addi	a4,s2,1
    80002f64:	2af77263          	bgeu	a4,a5,80003208 <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80002f68:	00671793          	slli	a5,a4,0x6
    80002f6c:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80002f70:	fde00713          	li	a4,-34
    80002f74:	00e78c23          	sb	a4,24(a5)
    80002f78:	fc000693          	li	a3,-64
    80002f7c:	00d78ca3          	sb	a3,25(a5)
    80002f80:	fad00693          	li	a3,-83
    80002f84:	00d78d23          	sb	a3,26(a5)
    80002f88:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80002f8c:	0104c703          	lbu	a4,16(s1)
    80002f90:	0114c683          	lbu	a3,17(s1)
    80002f94:	00869693          	slli	a3,a3,0x8
    80002f98:	00e6e6b3          	or	a3,a3,a4
    80002f9c:	0124c703          	lbu	a4,18(s1)
    80002fa0:	01071713          	slli	a4,a4,0x10
    80002fa4:	00d766b3          	or	a3,a4,a3
    80002fa8:	0134c703          	lbu	a4,19(s1)
    80002fac:	01871713          	slli	a4,a4,0x18
    80002fb0:	00d76733          	or	a4,a4,a3
    80002fb4:	0144c683          	lbu	a3,20(s1)
    80002fb8:	02069693          	slli	a3,a3,0x20
    80002fbc:	00e6e733          	or	a4,a3,a4
    80002fc0:	0154c683          	lbu	a3,21(s1)
    80002fc4:	02869693          	slli	a3,a3,0x28
    80002fc8:	00e6e6b3          	or	a3,a3,a4
    80002fcc:	0164c703          	lbu	a4,22(s1)
    80002fd0:	03071713          	slli	a4,a4,0x30
    80002fd4:	00d766b3          	or	a3,a4,a3
    80002fd8:	0174c703          	lbu	a4,23(s1)
    80002fdc:	03871713          	slli	a4,a4,0x38
    80002fe0:	00d76733          	or	a4,a4,a3
    80002fe4:	41270733          	sub	a4,a4,s2
    80002fe8:	fff70713          	addi	a4,a4,-1
    80002fec:	00e78823          	sb	a4,16(a5)
    80002ff0:	00875693          	srli	a3,a4,0x8
    80002ff4:	00d788a3          	sb	a3,17(a5)
    80002ff8:	01075693          	srli	a3,a4,0x10
    80002ffc:	00d78923          	sb	a3,18(a5)
    80003000:	0187569b          	srliw	a3,a4,0x18
    80003004:	00d789a3          	sb	a3,19(a5)
    80003008:	02075693          	srli	a3,a4,0x20
    8000300c:	00d78a23          	sb	a3,20(a5)
    80003010:	02875693          	srli	a3,a4,0x28
    80003014:	00d78aa3          	sb	a3,21(a5)
    80003018:	03075693          	srli	a3,a4,0x30
    8000301c:	00d78b23          	sb	a3,22(a5)
    80003020:	03875713          	srli	a4,a4,0x38
    80003024:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80003028:	0004c703          	lbu	a4,0(s1)
    8000302c:	0014c683          	lbu	a3,1(s1)
    80003030:	00869693          	slli	a3,a3,0x8
    80003034:	00e6e733          	or	a4,a3,a4
    80003038:	0024c683          	lbu	a3,2(s1)
    8000303c:	01069693          	slli	a3,a3,0x10
    80003040:	00e6e6b3          	or	a3,a3,a4
    80003044:	0034c703          	lbu	a4,3(s1)
    80003048:	01871713          	slli	a4,a4,0x18
    8000304c:	00d766b3          	or	a3,a4,a3
    80003050:	0044c703          	lbu	a4,4(s1)
    80003054:	02071713          	slli	a4,a4,0x20
    80003058:	00d76733          	or	a4,a4,a3
    8000305c:	0054c683          	lbu	a3,5(s1)
    80003060:	02869693          	slli	a3,a3,0x28
    80003064:	00e6e733          	or	a4,a3,a4
    80003068:	0064c683          	lbu	a3,6(s1)
    8000306c:	03069693          	slli	a3,a3,0x30
    80003070:	00e6e6b3          	or	a3,a3,a4
    80003074:	0074c703          	lbu	a4,7(s1)
    80003078:	03871713          	slli	a4,a4,0x38
    8000307c:	00d76733          	or	a4,a4,a3
    80003080:	00d78023          	sb	a3,0(a5)
    80003084:	00875693          	srli	a3,a4,0x8
    80003088:	00d780a3          	sb	a3,1(a5)
    8000308c:	01075693          	srli	a3,a4,0x10
    80003090:	00d78123          	sb	a3,2(a5)
    80003094:	0187569b          	srliw	a3,a4,0x18
    80003098:	00d781a3          	sb	a3,3(a5)
    8000309c:	02075693          	srli	a3,a4,0x20
    800030a0:	00d78223          	sb	a3,4(a5)
    800030a4:	02875693          	srli	a3,a4,0x28
    800030a8:	00d782a3          	sb	a3,5(a5)
    800030ac:	03075693          	srli	a3,a4,0x30
    800030b0:	00d78323          	sb	a3,6(a5)
    800030b4:	03875713          	srli	a4,a4,0x38
    800030b8:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    800030bc:	00978423          	sb	s1,8(a5)
    800030c0:	0084d713          	srli	a4,s1,0x8
    800030c4:	00e784a3          	sb	a4,9(a5)
    800030c8:	0104d713          	srli	a4,s1,0x10
    800030cc:	00e78523          	sb	a4,10(a5)
    800030d0:	0184d71b          	srliw	a4,s1,0x18
    800030d4:	00e785a3          	sb	a4,11(a5)
    800030d8:	0204d713          	srli	a4,s1,0x20
    800030dc:	00e78623          	sb	a4,12(a5)
    800030e0:	0284d713          	srli	a4,s1,0x28
    800030e4:	00e786a3          	sb	a4,13(a5)
    800030e8:	0304d713          	srli	a4,s1,0x30
    800030ec:	00e78723          	sb	a4,14(a5)
    800030f0:	0384d713          	srli	a4,s1,0x38
    800030f4:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    800030f8:	0004c703          	lbu	a4,0(s1)
    800030fc:	0014c683          	lbu	a3,1(s1)
    80003100:	00869693          	slli	a3,a3,0x8
    80003104:	00e6e6b3          	or	a3,a3,a4
    80003108:	0024c703          	lbu	a4,2(s1)
    8000310c:	01071713          	slli	a4,a4,0x10
    80003110:	00d766b3          	or	a3,a4,a3
    80003114:	0034c703          	lbu	a4,3(s1)
    80003118:	01871713          	slli	a4,a4,0x18
    8000311c:	00d76733          	or	a4,a4,a3
    80003120:	0044c683          	lbu	a3,4(s1)
    80003124:	02069693          	slli	a3,a3,0x20
    80003128:	00e6e733          	or	a4,a3,a4
    8000312c:	0054c683          	lbu	a3,5(s1)
    80003130:	02869693          	slli	a3,a3,0x28
    80003134:	00e6e6b3          	or	a3,a3,a4
    80003138:	0064c703          	lbu	a4,6(s1)
    8000313c:	03071713          	slli	a4,a4,0x30
    80003140:	00d766b3          	or	a3,a4,a3
    80003144:	0074c703          	lbu	a4,7(s1)
    80003148:	03871713          	slli	a4,a4,0x38
    8000314c:	00d76733          	or	a4,a4,a3
    80003150:	04070063          	beqz	a4,80003190 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003154:	00f70423          	sb	a5,8(a4)
    80003158:	0087d693          	srli	a3,a5,0x8
    8000315c:	00d704a3          	sb	a3,9(a4)
    80003160:	0107d693          	srli	a3,a5,0x10
    80003164:	00d70523          	sb	a3,10(a4)
    80003168:	0187d69b          	srliw	a3,a5,0x18
    8000316c:	00d705a3          	sb	a3,11(a4)
    80003170:	0207d693          	srli	a3,a5,0x20
    80003174:	00d70623          	sb	a3,12(a4)
    80003178:	0287d693          	srli	a3,a5,0x28
    8000317c:	00d706a3          	sb	a3,13(a4)
    80003180:	0307d693          	srli	a3,a5,0x30
    80003184:	00d70723          	sb	a3,14(a4)
    80003188:	0387d693          	srli	a3,a5,0x38
    8000318c:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80003190:	00f48023          	sb	a5,0(s1)
    80003194:	0087d713          	srli	a4,a5,0x8
    80003198:	00e480a3          	sb	a4,1(s1)
    8000319c:	0107d713          	srli	a4,a5,0x10
    800031a0:	00e48123          	sb	a4,2(s1)
    800031a4:	0187d71b          	srliw	a4,a5,0x18
    800031a8:	00e481a3          	sb	a4,3(s1)
    800031ac:	0207d713          	srli	a4,a5,0x20
    800031b0:	00e48223          	sb	a4,4(s1)
    800031b4:	0287d713          	srli	a4,a5,0x28
    800031b8:	00e482a3          	sb	a4,5(s1)
    800031bc:	0307d713          	srli	a4,a5,0x30
    800031c0:	00e48323          	sb	a4,6(s1)
    800031c4:	0387d793          	srli	a5,a5,0x38
    800031c8:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    800031cc:	01248823          	sb	s2,16(s1)
    800031d0:	00895793          	srli	a5,s2,0x8
    800031d4:	00f488a3          	sb	a5,17(s1)
    800031d8:	01095793          	srli	a5,s2,0x10
    800031dc:	00f48923          	sb	a5,18(s1)
    800031e0:	0189579b          	srliw	a5,s2,0x18
    800031e4:	00f489a3          	sb	a5,19(s1)
    800031e8:	02095793          	srli	a5,s2,0x20
    800031ec:	00f48a23          	sb	a5,20(s1)
    800031f0:	02895793          	srli	a5,s2,0x28
    800031f4:	00f48aa3          	sb	a5,21(s1)
    800031f8:	03095793          	srli	a5,s2,0x30
    800031fc:	00f48b23          	sb	a5,22(s1)
    80003200:	03895913          	srli	s2,s2,0x38
    80003204:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80003208:	0009b783          	ld	a5,0(s3)
    8000320c:	20978463          	beq	a5,s1,80003414 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80003210:	0084c783          	lbu	a5,8(s1)
    80003214:	0094c703          	lbu	a4,9(s1)
    80003218:	00871713          	slli	a4,a4,0x8
    8000321c:	00f76733          	or	a4,a4,a5
    80003220:	00a4c783          	lbu	a5,10(s1)
    80003224:	01079793          	slli	a5,a5,0x10
    80003228:	00e7e733          	or	a4,a5,a4
    8000322c:	00b4c783          	lbu	a5,11(s1)
    80003230:	01879793          	slli	a5,a5,0x18
    80003234:	00e7e7b3          	or	a5,a5,a4
    80003238:	00c4c703          	lbu	a4,12(s1)
    8000323c:	02071713          	slli	a4,a4,0x20
    80003240:	00f767b3          	or	a5,a4,a5
    80003244:	00d4c703          	lbu	a4,13(s1)
    80003248:	02871713          	slli	a4,a4,0x28
    8000324c:	00f76733          	or	a4,a4,a5
    80003250:	00e4c783          	lbu	a5,14(s1)
    80003254:	03079793          	slli	a5,a5,0x30
    80003258:	00e7e733          	or	a4,a5,a4
    8000325c:	00f4c783          	lbu	a5,15(s1)
    80003260:	03879793          	slli	a5,a5,0x38
    80003264:	00e7e7b3          	or	a5,a5,a4
    80003268:	08078c63          	beqz	a5,80003300 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    8000326c:	0004c703          	lbu	a4,0(s1)
    80003270:	0014c683          	lbu	a3,1(s1)
    80003274:	00869693          	slli	a3,a3,0x8
    80003278:	00e6e733          	or	a4,a3,a4
    8000327c:	0024c683          	lbu	a3,2(s1)
    80003280:	01069693          	slli	a3,a3,0x10
    80003284:	00e6e6b3          	or	a3,a3,a4
    80003288:	0034c703          	lbu	a4,3(s1)
    8000328c:	01871713          	slli	a4,a4,0x18
    80003290:	00d766b3          	or	a3,a4,a3
    80003294:	0044c703          	lbu	a4,4(s1)
    80003298:	02071713          	slli	a4,a4,0x20
    8000329c:	00d76733          	or	a4,a4,a3
    800032a0:	0054c683          	lbu	a3,5(s1)
    800032a4:	02869693          	slli	a3,a3,0x28
    800032a8:	00e6e733          	or	a4,a3,a4
    800032ac:	0064c683          	lbu	a3,6(s1)
    800032b0:	03069693          	slli	a3,a3,0x30
    800032b4:	00e6e6b3          	or	a3,a3,a4
    800032b8:	0074c703          	lbu	a4,7(s1)
    800032bc:	03871713          	slli	a4,a4,0x38
    800032c0:	00d76733          	or	a4,a4,a3
    800032c4:	00d78023          	sb	a3,0(a5)
    800032c8:	00875693          	srli	a3,a4,0x8
    800032cc:	00d780a3          	sb	a3,1(a5)
    800032d0:	01075693          	srli	a3,a4,0x10
    800032d4:	00d78123          	sb	a3,2(a5)
    800032d8:	0187569b          	srliw	a3,a4,0x18
    800032dc:	00d781a3          	sb	a3,3(a5)
    800032e0:	02075693          	srli	a3,a4,0x20
    800032e4:	00d78223          	sb	a3,4(a5)
    800032e8:	02875693          	srli	a3,a4,0x28
    800032ec:	00d782a3          	sb	a3,5(a5)
    800032f0:	03075693          	srli	a3,a4,0x30
    800032f4:	00d78323          	sb	a3,6(a5)
    800032f8:	03875713          	srli	a4,a4,0x38
    800032fc:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003300:	0004c783          	lbu	a5,0(s1)
    80003304:	0014c703          	lbu	a4,1(s1)
    80003308:	00871713          	slli	a4,a4,0x8
    8000330c:	00f76733          	or	a4,a4,a5
    80003310:	0024c783          	lbu	a5,2(s1)
    80003314:	01079793          	slli	a5,a5,0x10
    80003318:	00e7e733          	or	a4,a5,a4
    8000331c:	0034c783          	lbu	a5,3(s1)
    80003320:	01879793          	slli	a5,a5,0x18
    80003324:	00e7e7b3          	or	a5,a5,a4
    80003328:	0044c703          	lbu	a4,4(s1)
    8000332c:	02071713          	slli	a4,a4,0x20
    80003330:	00f767b3          	or	a5,a4,a5
    80003334:	0054c703          	lbu	a4,5(s1)
    80003338:	02871713          	slli	a4,a4,0x28
    8000333c:	00f76733          	or	a4,a4,a5
    80003340:	0064c783          	lbu	a5,6(s1)
    80003344:	03079793          	slli	a5,a5,0x30
    80003348:	00e7e733          	or	a4,a5,a4
    8000334c:	0074c783          	lbu	a5,7(s1)
    80003350:	03879793          	slli	a5,a5,0x38
    80003354:	00e7e7b3          	or	a5,a5,a4
    80003358:	08078c63          	beqz	a5,800033f0 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    8000335c:	0084c703          	lbu	a4,8(s1)
    80003360:	0094c683          	lbu	a3,9(s1)
    80003364:	00869693          	slli	a3,a3,0x8
    80003368:	00e6e733          	or	a4,a3,a4
    8000336c:	00a4c683          	lbu	a3,10(s1)
    80003370:	01069693          	slli	a3,a3,0x10
    80003374:	00e6e6b3          	or	a3,a3,a4
    80003378:	00b4c703          	lbu	a4,11(s1)
    8000337c:	01871713          	slli	a4,a4,0x18
    80003380:	00d766b3          	or	a3,a4,a3
    80003384:	00c4c703          	lbu	a4,12(s1)
    80003388:	02071713          	slli	a4,a4,0x20
    8000338c:	00d76733          	or	a4,a4,a3
    80003390:	00d4c683          	lbu	a3,13(s1)
    80003394:	02869693          	slli	a3,a3,0x28
    80003398:	00e6e733          	or	a4,a3,a4
    8000339c:	00e4c683          	lbu	a3,14(s1)
    800033a0:	03069693          	slli	a3,a3,0x30
    800033a4:	00e6e6b3          	or	a3,a3,a4
    800033a8:	00f4c703          	lbu	a4,15(s1)
    800033ac:	03871713          	slli	a4,a4,0x38
    800033b0:	00d76733          	or	a4,a4,a3
    800033b4:	00d78423          	sb	a3,8(a5)
    800033b8:	00875693          	srli	a3,a4,0x8
    800033bc:	00d784a3          	sb	a3,9(a5)
    800033c0:	01075693          	srli	a3,a4,0x10
    800033c4:	00d78523          	sb	a3,10(a5)
    800033c8:	0187569b          	srliw	a3,a4,0x18
    800033cc:	00d785a3          	sb	a3,11(a5)
    800033d0:	02075693          	srli	a3,a4,0x20
    800033d4:	00d78623          	sb	a3,12(a5)
    800033d8:	02875693          	srli	a3,a4,0x28
    800033dc:	00d786a3          	sb	a3,13(a5)
    800033e0:	03075693          	srli	a3,a4,0x30
    800033e4:	00d78723          	sb	a3,14(a5)
    800033e8:	03875713          	srli	a4,a4,0x38
    800033ec:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    800033f0:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    800033f4:	00048513          	mv	a0,s1
    800033f8:	02813083          	ld	ra,40(sp)
    800033fc:	02013403          	ld	s0,32(sp)
    80003400:	01813483          	ld	s1,24(sp)
    80003404:	01013903          	ld	s2,16(sp)
    80003408:	00813983          	ld	s3,8(sp)
    8000340c:	03010113          	addi	sp,sp,48
    80003410:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80003414:	0004c703          	lbu	a4,0(s1)
    80003418:	0014c783          	lbu	a5,1(s1)
    8000341c:	00879793          	slli	a5,a5,0x8
    80003420:	00e7e7b3          	or	a5,a5,a4
    80003424:	0024c703          	lbu	a4,2(s1)
    80003428:	01071713          	slli	a4,a4,0x10
    8000342c:	00f76733          	or	a4,a4,a5
    80003430:	0034c783          	lbu	a5,3(s1)
    80003434:	01879793          	slli	a5,a5,0x18
    80003438:	00e7e733          	or	a4,a5,a4
    8000343c:	0044c783          	lbu	a5,4(s1)
    80003440:	02079793          	slli	a5,a5,0x20
    80003444:	00e7e7b3          	or	a5,a5,a4
    80003448:	0054c703          	lbu	a4,5(s1)
    8000344c:	02871713          	slli	a4,a4,0x28
    80003450:	00f76733          	or	a4,a4,a5
    80003454:	0064c783          	lbu	a5,6(s1)
    80003458:	03079793          	slli	a5,a5,0x30
    8000345c:	00e7e733          	or	a4,a5,a4
    80003460:	0074c783          	lbu	a5,7(s1)
    80003464:	03879793          	slli	a5,a5,0x38
    80003468:	00e7e7b3          	or	a5,a5,a4
    8000346c:	00f9b023          	sd	a5,0(s3)
    80003470:	da1ff06f          	j	80003210 <_ZN11HeapManager12heapAllocateEm+0x3f4>

0000000080003474 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003474:	ff010113          	addi	sp,sp,-16
    80003478:	00813423          	sd	s0,8(sp)
    8000347c:	01010413          	addi	s0,sp,16
    //     if(pFree->pNext != 0){
    //         pFree->pNext->pPrev = pFree;
    //     }
    // }
    return 0;
}
    80003480:	00000513          	li	a0,0
    80003484:	00813403          	ld	s0,8(sp)
    80003488:	01010113          	addi	sp,sp,16
    8000348c:	00008067          	ret

0000000080003490 <exceptionHandler>:
#include "sem.h"
#include "timer.h"
#include "assert.h"


extern "C" void exceptionHandler(){
    80003490:	fc010113          	addi	sp,sp,-64
    80003494:	02113c23          	sd	ra,56(sp)
    80003498:	02813823          	sd	s0,48(sp)
    8000349c:	02913423          	sd	s1,40(sp)
    800034a0:	03213023          	sd	s2,32(sp)
    800034a4:	01313c23          	sd	s3,24(sp)
    800034a8:	01413823          	sd	s4,16(sp)
    800034ac:	01513423          	sd	s5,8(sp)
    800034b0:	01613023          	sd	s6,0(sp)
    800034b4:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    800034b8:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    800034bc:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    800034c0:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    800034c4:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    800034c8:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    800034cc:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    800034d0:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    800034d4:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    800034d8:	ff870613          	addi	a2,a4,-8
    800034dc:	00100693          	li	a3,1
    800034e0:	04c6f463          	bgeu	a3,a2,80003528 <exceptionHandler+0x98>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    800034e4:	00500793          	li	a5,5
    800034e8:	20f70e63          	beq	a4,a5,80003704 <exceptionHandler+0x274>
                __putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    800034ec:	00700793          	li	a5,7
    800034f0:	3cf70863          	beq	a4,a5,800038c0 <exceptionHandler+0x430>
                __putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    800034f4:	fff00793          	li	a5,-1
    800034f8:	03f79793          	slli	a5,a5,0x3f
    800034fc:	00178793          	addi	a5,a5,1
    80003500:	58f70463          	beq	a4,a5,80003a88 <exceptionHandler+0x5f8>
        Timer::getInstance().tick();
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    80003504:	fff00793          	li	a5,-1
    80003508:	03f79793          	slli	a5,a5,0x3f
    8000350c:	00978793          	addi	a5,a5,9
    80003510:	08f71863          	bne	a4,a5,800035a0 <exceptionHandler+0x110>
    {   
        int irq = plic_claim();
    80003514:	00001097          	auipc	ra,0x1
    80003518:	200080e7          	jalr	512(ra) # 80004714 <plic_claim>
        // if(irq == CONSOLE_IRQ)Console::console_handler();
        plic_complete(irq);
    8000351c:	00001097          	auipc	ra,0x1
    80003520:	230080e7          	jalr	560(ra) # 8000474c <plic_complete>
    80003524:	07c0006f          	j	800035a0 <exceptionHandler+0x110>
        switch(a0){
    80003528:	04200713          	li	a4,66
    8000352c:	02f76463          	bltu	a4,a5,80003554 <exceptionHandler+0xc4>
    80003530:	1c078263          	beqz	a5,800036f4 <exceptionHandler+0x264>
    80003534:	1cf76463          	bltu	a4,a5,800036fc <exceptionHandler+0x26c>
    80003538:	00279793          	slli	a5,a5,0x2
    8000353c:	00004717          	auipc	a4,0x4
    80003540:	cdc70713          	addi	a4,a4,-804 # 80007218 <CONSOLE_STATUS+0x208>
    80003544:	00e787b3          	add	a5,a5,a4
    80003548:	0007a783          	lw	a5,0(a5)
    8000354c:	00e787b3          	add	a5,a5,a4
    80003550:	00078067          	jr	a5
    80003554:	0ff00713          	li	a4,255
    80003558:	02e79663          	bne	a5,a4,80003584 <exceptionHandler+0xf4>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    8000355c:	00000793          	li	a5,0
    80003560:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80003564:	00448493          	addi	s1,s1,4
    80003568:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    8000356c:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    80003570:	10000793          	li	a5,256
    80003574:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003578:	00200793          	li	a5,2
    8000357c:	1447b073          	csrc	sip,a5
                return;
    80003580:	0200006f          	j	800035a0 <exceptionHandler+0x110>
        switch(a0){
    80003584:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80003588:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    8000358c:	00448493          	addi	s1,s1,4
    80003590:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003594:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003598:	00200793          	li	a5,2
    8000359c:	1447b073          	csrc	sip,a5
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    800035a0:	03813083          	ld	ra,56(sp)
    800035a4:	03013403          	ld	s0,48(sp)
    800035a8:	02813483          	ld	s1,40(sp)
    800035ac:	02013903          	ld	s2,32(sp)
    800035b0:	01813983          	ld	s3,24(sp)
    800035b4:	01013a03          	ld	s4,16(sp)
    800035b8:	00813a83          	ld	s5,8(sp)
    800035bc:	00013b03          	ld	s6,0(sp)
    800035c0:	04010113          	addi	sp,sp,64
    800035c4:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    800035c8:	00098593          	mv	a1,s3
    800035cc:	00005797          	auipc	a5,0x5
    800035d0:	9f47b783          	ld	a5,-1548(a5) # 80007fc0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800035d4:	0007b503          	ld	a0,0(a5)
    800035d8:	00000097          	auipc	ra,0x0
    800035dc:	844080e7          	jalr	-1980(ra) # 80002e1c <_ZN11HeapManager12heapAllocateEm>
                break;
    800035e0:	fa9ff06f          	j	80003588 <exceptionHandler+0xf8>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    800035e4:	00098593          	mv	a1,s3
    800035e8:	00005797          	auipc	a5,0x5
    800035ec:	9d87b783          	ld	a5,-1576(a5) # 80007fc0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800035f0:	0007b503          	ld	a0,0(a5)
    800035f4:	00000097          	auipc	ra,0x0
    800035f8:	e80080e7          	jalr	-384(ra) # 80003474 <_ZN11HeapManager8heapFreeEPv>
                break;
    800035fc:	f8dff06f          	j	80003588 <exceptionHandler+0xf8>
                __putc('\0'); /// removing this line causes everything to break
    80003600:	00000513          	li	a0,0
    80003604:	00003097          	auipc	ra,0x3
    80003608:	978080e7          	jalr	-1672(ra) # 80005f7c <__putc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    8000360c:	00100713          	li	a4,1
    80003610:	000b0693          	mv	a3,s6
    80003614:	000a8613          	mv	a2,s5
    80003618:	000a0593          	mv	a1,s4
    8000361c:	00098513          	mv	a0,s3
    80003620:	fffff097          	auipc	ra,0xfffff
    80003624:	ef4080e7          	jalr	-268(ra) # 80002514 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80003628:	f61ff06f          	j	80003588 <exceptionHandler+0xf8>
                returnVal = _thread::currentThread->exit();
    8000362c:	fffff097          	auipc	ra,0xfffff
    80003630:	414080e7          	jalr	1044(ra) # 80002a40 <_ZN7_thread4exitEv>
                break;
    80003634:	f55ff06f          	j	80003588 <exceptionHandler+0xf8>
                _thread::dispatch();
    80003638:	fffff097          	auipc	ra,0xfffff
    8000363c:	1dc080e7          	jalr	476(ra) # 80002814 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80003640:	00000513          	li	a0,0
                break;
    80003644:	f45ff06f          	j	80003588 <exceptionHandler+0xf8>
                _thread::currentThread->join((thread_t)a1);
    80003648:	00098593          	mv	a1,s3
    8000364c:	00005797          	auipc	a5,0x5
    80003650:	9947b783          	ld	a5,-1644(a5) # 80007fe0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003654:	0007b503          	ld	a0,0(a5)
    80003658:	fffff097          	auipc	ra,0xfffff
    8000365c:	2a0080e7          	jalr	672(ra) # 800028f8 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80003660:	00000513          	li	a0,0
                break;
    80003664:	f25ff06f          	j	80003588 <exceptionHandler+0xf8>
                _sem::open((sem_t*)a1, unsigned(a2));
    80003668:	000a059b          	sext.w	a1,s4
    8000366c:	00098513          	mv	a0,s3
    80003670:	ffffe097          	auipc	ra,0xffffe
    80003674:	024080e7          	jalr	36(ra) # 80001694 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80003678:	00000513          	li	a0,0
                break;
    8000367c:	f0dff06f          	j	80003588 <exceptionHandler+0xf8>
                _sem::close((sem_t)a1);
    80003680:	00098513          	mv	a0,s3
    80003684:	ffffe097          	auipc	ra,0xffffe
    80003688:	06c080e7          	jalr	108(ra) # 800016f0 <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    8000368c:	00000513          	li	a0,0
                break;
    80003690:	ef9ff06f          	j	80003588 <exceptionHandler+0xf8>
                _sem::wait((sem_t)a1);
    80003694:	00098513          	mv	a0,s3
    80003698:	ffffe097          	auipc	ra,0xffffe
    8000369c:	0b8080e7          	jalr	184(ra) # 80001750 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    800036a0:	00000513          	li	a0,0
                break;
    800036a4:	ee5ff06f          	j	80003588 <exceptionHandler+0xf8>
                _sem::signal((sem_t)a1);
    800036a8:	00098513          	mv	a0,s3
    800036ac:	ffffe097          	auipc	ra,0xffffe
    800036b0:	154080e7          	jalr	340(ra) # 80001800 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    800036b4:	00000513          	li	a0,0
                break;
    800036b8:	ed1ff06f          	j	80003588 <exceptionHandler+0xf8>
                returnVal = Timer::getInstance().sleep(a1);
    800036bc:	ffffe097          	auipc	ra,0xffffe
    800036c0:	afc080e7          	jalr	-1284(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    800036c4:	00098593          	mv	a1,s3
    800036c8:	ffffe097          	auipc	ra,0xffffe
    800036cc:	c88080e7          	jalr	-888(ra) # 80001350 <_ZN5Timer5sleepEm>
                break;
    800036d0:	eb9ff06f          	j	80003588 <exceptionHandler+0xf8>
                returnVal = __getc();
    800036d4:	00003097          	auipc	ra,0x3
    800036d8:	8e4080e7          	jalr	-1820(ra) # 80005fb8 <__getc>
                break;
    800036dc:	eadff06f          	j	80003588 <exceptionHandler+0xf8>
                __putc(a1);
    800036e0:	0ff9f513          	andi	a0,s3,255
    800036e4:	00003097          	auipc	ra,0x3
    800036e8:	898080e7          	jalr	-1896(ra) # 80005f7c <__putc>
    uint64 returnVal = 0;
    800036ec:	00000513          	li	a0,0
                break;
    800036f0:	e99ff06f          	j	80003588 <exceptionHandler+0xf8>
        switch(a0){
    800036f4:	00000513          	li	a0,0
    800036f8:	e91ff06f          	j	80003588 <exceptionHandler+0xf8>
    800036fc:	00000513          	li	a0,0
    80003700:	e89ff06f          	j	80003588 <exceptionHandler+0xf8>
        __putc('\n');
    80003704:	00a00513          	li	a0,10
    80003708:	00003097          	auipc	ra,0x3
    8000370c:	874080e7          	jalr	-1932(ra) # 80005f7c <__putc>
        __putc('E');
    80003710:	04500513          	li	a0,69
    80003714:	00003097          	auipc	ra,0x3
    80003718:	868080e7          	jalr	-1944(ra) # 80005f7c <__putc>
        __putc('r');
    8000371c:	07200513          	li	a0,114
    80003720:	00003097          	auipc	ra,0x3
    80003724:	85c080e7          	jalr	-1956(ra) # 80005f7c <__putc>
        __putc('r');
    80003728:	07200513          	li	a0,114
    8000372c:	00003097          	auipc	ra,0x3
    80003730:	850080e7          	jalr	-1968(ra) # 80005f7c <__putc>
        __putc('o');
    80003734:	06f00513          	li	a0,111
    80003738:	00003097          	auipc	ra,0x3
    8000373c:	844080e7          	jalr	-1980(ra) # 80005f7c <__putc>
        __putc('r');
    80003740:	07200513          	li	a0,114
    80003744:	00003097          	auipc	ra,0x3
    80003748:	838080e7          	jalr	-1992(ra) # 80005f7c <__putc>
        __putc(':');
    8000374c:	03a00513          	li	a0,58
    80003750:	00003097          	auipc	ra,0x3
    80003754:	82c080e7          	jalr	-2004(ra) # 80005f7c <__putc>
        __putc(' ');
    80003758:	02000513          	li	a0,32
    8000375c:	00003097          	auipc	ra,0x3
    80003760:	820080e7          	jalr	-2016(ra) # 80005f7c <__putc>
        __putc('i');
    80003764:	06900513          	li	a0,105
    80003768:	00003097          	auipc	ra,0x3
    8000376c:	814080e7          	jalr	-2028(ra) # 80005f7c <__putc>
        __putc('l');
    80003770:	06c00513          	li	a0,108
    80003774:	00003097          	auipc	ra,0x3
    80003778:	808080e7          	jalr	-2040(ra) # 80005f7c <__putc>
        __putc('l');
    8000377c:	06c00513          	li	a0,108
    80003780:	00002097          	auipc	ra,0x2
    80003784:	7fc080e7          	jalr	2044(ra) # 80005f7c <__putc>
        __putc('e');
    80003788:	06500513          	li	a0,101
    8000378c:	00002097          	auipc	ra,0x2
    80003790:	7f0080e7          	jalr	2032(ra) # 80005f7c <__putc>
        __putc('g');
    80003794:	06700513          	li	a0,103
    80003798:	00002097          	auipc	ra,0x2
    8000379c:	7e4080e7          	jalr	2020(ra) # 80005f7c <__putc>
        __putc('a');
    800037a0:	06100513          	li	a0,97
    800037a4:	00002097          	auipc	ra,0x2
    800037a8:	7d8080e7          	jalr	2008(ra) # 80005f7c <__putc>
        __putc('l');
    800037ac:	06c00513          	li	a0,108
    800037b0:	00002097          	auipc	ra,0x2
    800037b4:	7cc080e7          	jalr	1996(ra) # 80005f7c <__putc>
        __putc(' ');
    800037b8:	02000513          	li	a0,32
    800037bc:	00002097          	auipc	ra,0x2
    800037c0:	7c0080e7          	jalr	1984(ra) # 80005f7c <__putc>
        __putc('r');
    800037c4:	07200513          	li	a0,114
    800037c8:	00002097          	auipc	ra,0x2
    800037cc:	7b4080e7          	jalr	1972(ra) # 80005f7c <__putc>
        __putc('e');
    800037d0:	06500513          	li	a0,101
    800037d4:	00002097          	auipc	ra,0x2
    800037d8:	7a8080e7          	jalr	1960(ra) # 80005f7c <__putc>
        __putc('a');
    800037dc:	06100513          	li	a0,97
    800037e0:	00002097          	auipc	ra,0x2
    800037e4:	79c080e7          	jalr	1948(ra) # 80005f7c <__putc>
        __putc('d');
    800037e8:	06400513          	li	a0,100
    800037ec:	00002097          	auipc	ra,0x2
    800037f0:	790080e7          	jalr	1936(ra) # 80005f7c <__putc>
        __putc('!');
    800037f4:	02100513          	li	a0,33
    800037f8:	00002097          	auipc	ra,0x2
    800037fc:	784080e7          	jalr	1924(ra) # 80005f7c <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80003800:	14102973          	csrr	s2,sepc
        __putc('\n');
    80003804:	00a00513          	li	a0,10
    80003808:	00002097          	auipc	ra,0x2
    8000380c:	774080e7          	jalr	1908(ra) # 80005f7c <__putc>
        __putc('P');
    80003810:	05000513          	li	a0,80
    80003814:	00002097          	auipc	ra,0x2
    80003818:	768080e7          	jalr	1896(ra) # 80005f7c <__putc>
        __putc('C');
    8000381c:	04300513          	li	a0,67
    80003820:	00002097          	auipc	ra,0x2
    80003824:	75c080e7          	jalr	1884(ra) # 80005f7c <__putc>
        __putc(':');
    80003828:	03a00513          	li	a0,58
    8000382c:	00002097          	auipc	ra,0x2
    80003830:	750080e7          	jalr	1872(ra) # 80005f7c <__putc>
        __putc(' ');
    80003834:	02000513          	li	a0,32
    80003838:	00002097          	auipc	ra,0x2
    8000383c:	744080e7          	jalr	1860(ra) # 80005f7c <__putc>
        __putc('0');
    80003840:	03000513          	li	a0,48
    80003844:	00002097          	auipc	ra,0x2
    80003848:	738080e7          	jalr	1848(ra) # 80005f7c <__putc>
        __putc('x');
    8000384c:	07800513          	li	a0,120
    80003850:	00002097          	auipc	ra,0x2
    80003854:	72c080e7          	jalr	1836(ra) # 80005f7c <__putc>
        for(int i = 15; i >= 0; i--){
    80003858:	00f00493          	li	s1,15
    8000385c:	0140006f          	j	80003870 <exceptionHandler+0x3e0>
                __putc('A' + tmp - 10);
    80003860:	03750513          	addi	a0,a0,55
    80003864:	00002097          	auipc	ra,0x2
    80003868:	718080e7          	jalr	1816(ra) # 80005f7c <__putc>
        for(int i = 15; i >= 0; i--){
    8000386c:	fff4849b          	addiw	s1,s1,-1
    80003870:	0204c463          	bltz	s1,80003898 <exceptionHandler+0x408>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    80003874:	0024951b          	slliw	a0,s1,0x2
    80003878:	00a95533          	srl	a0,s2,a0
    8000387c:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80003880:	00900793          	li	a5,9
    80003884:	fca7eee3          	bltu	a5,a0,80003860 <exceptionHandler+0x3d0>
                __putc('0' + tmp);
    80003888:	03050513          	addi	a0,a0,48
    8000388c:	00002097          	auipc	ra,0x2
    80003890:	6f0080e7          	jalr	1776(ra) # 80005f7c <__putc>
    80003894:	fd9ff06f          	j	8000386c <exceptionHandler+0x3dc>
        assert(false);
    80003898:	00004697          	auipc	a3,0x4
    8000389c:	94068693          	addi	a3,a3,-1728 # 800071d8 <CONSOLE_STATUS+0x1c8>
    800038a0:	08700613          	li	a2,135
    800038a4:	00004597          	auipc	a1,0x4
    800038a8:	94c58593          	addi	a1,a1,-1716 # 800071f0 <CONSOLE_STATUS+0x1e0>
    800038ac:	00004517          	auipc	a0,0x4
    800038b0:	96450513          	addi	a0,a0,-1692 # 80007210 <CONSOLE_STATUS+0x200>
    800038b4:	ffffe097          	auipc	ra,0xffffe
    800038b8:	0d4080e7          	jalr	212(ra) # 80001988 <_Z13assert_failedPKcS0_jS0_>
    800038bc:	ce5ff06f          	j	800035a0 <exceptionHandler+0x110>
        __putc('\n');
    800038c0:	00a00513          	li	a0,10
    800038c4:	00002097          	auipc	ra,0x2
    800038c8:	6b8080e7          	jalr	1720(ra) # 80005f7c <__putc>
        __putc('E');
    800038cc:	04500513          	li	a0,69
    800038d0:	00002097          	auipc	ra,0x2
    800038d4:	6ac080e7          	jalr	1708(ra) # 80005f7c <__putc>
        __putc('r');
    800038d8:	07200513          	li	a0,114
    800038dc:	00002097          	auipc	ra,0x2
    800038e0:	6a0080e7          	jalr	1696(ra) # 80005f7c <__putc>
        __putc('r');
    800038e4:	07200513          	li	a0,114
    800038e8:	00002097          	auipc	ra,0x2
    800038ec:	694080e7          	jalr	1684(ra) # 80005f7c <__putc>
        __putc('o');
    800038f0:	06f00513          	li	a0,111
    800038f4:	00002097          	auipc	ra,0x2
    800038f8:	688080e7          	jalr	1672(ra) # 80005f7c <__putc>
        __putc('r');
    800038fc:	07200513          	li	a0,114
    80003900:	00002097          	auipc	ra,0x2
    80003904:	67c080e7          	jalr	1660(ra) # 80005f7c <__putc>
        __putc(':');
    80003908:	03a00513          	li	a0,58
    8000390c:	00002097          	auipc	ra,0x2
    80003910:	670080e7          	jalr	1648(ra) # 80005f7c <__putc>
        __putc(' ');
    80003914:	02000513          	li	a0,32
    80003918:	00002097          	auipc	ra,0x2
    8000391c:	664080e7          	jalr	1636(ra) # 80005f7c <__putc>
        __putc('i');
    80003920:	06900513          	li	a0,105
    80003924:	00002097          	auipc	ra,0x2
    80003928:	658080e7          	jalr	1624(ra) # 80005f7c <__putc>
        __putc('l');
    8000392c:	06c00513          	li	a0,108
    80003930:	00002097          	auipc	ra,0x2
    80003934:	64c080e7          	jalr	1612(ra) # 80005f7c <__putc>
        __putc('l');
    80003938:	06c00513          	li	a0,108
    8000393c:	00002097          	auipc	ra,0x2
    80003940:	640080e7          	jalr	1600(ra) # 80005f7c <__putc>
        __putc('e');
    80003944:	06500513          	li	a0,101
    80003948:	00002097          	auipc	ra,0x2
    8000394c:	634080e7          	jalr	1588(ra) # 80005f7c <__putc>
        __putc('g');
    80003950:	06700513          	li	a0,103
    80003954:	00002097          	auipc	ra,0x2
    80003958:	628080e7          	jalr	1576(ra) # 80005f7c <__putc>
        __putc('a');
    8000395c:	06100513          	li	a0,97
    80003960:	00002097          	auipc	ra,0x2
    80003964:	61c080e7          	jalr	1564(ra) # 80005f7c <__putc>
        __putc('l');
    80003968:	06c00513          	li	a0,108
    8000396c:	00002097          	auipc	ra,0x2
    80003970:	610080e7          	jalr	1552(ra) # 80005f7c <__putc>
        __putc(' ');
    80003974:	02000513          	li	a0,32
    80003978:	00002097          	auipc	ra,0x2
    8000397c:	604080e7          	jalr	1540(ra) # 80005f7c <__putc>
        __putc('w');
    80003980:	07700513          	li	a0,119
    80003984:	00002097          	auipc	ra,0x2
    80003988:	5f8080e7          	jalr	1528(ra) # 80005f7c <__putc>
        __putc('r');
    8000398c:	07200513          	li	a0,114
    80003990:	00002097          	auipc	ra,0x2
    80003994:	5ec080e7          	jalr	1516(ra) # 80005f7c <__putc>
        __putc('i');
    80003998:	06900513          	li	a0,105
    8000399c:	00002097          	auipc	ra,0x2
    800039a0:	5e0080e7          	jalr	1504(ra) # 80005f7c <__putc>
        __putc('t');
    800039a4:	07400513          	li	a0,116
    800039a8:	00002097          	auipc	ra,0x2
    800039ac:	5d4080e7          	jalr	1492(ra) # 80005f7c <__putc>
        __putc('e');
    800039b0:	06500513          	li	a0,101
    800039b4:	00002097          	auipc	ra,0x2
    800039b8:	5c8080e7          	jalr	1480(ra) # 80005f7c <__putc>
        __putc('!');
    800039bc:	02100513          	li	a0,33
    800039c0:	00002097          	auipc	ra,0x2
    800039c4:	5bc080e7          	jalr	1468(ra) # 80005f7c <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    800039c8:	14102973          	csrr	s2,sepc
        __putc('\n');
    800039cc:	00a00513          	li	a0,10
    800039d0:	00002097          	auipc	ra,0x2
    800039d4:	5ac080e7          	jalr	1452(ra) # 80005f7c <__putc>
        __putc('P');
    800039d8:	05000513          	li	a0,80
    800039dc:	00002097          	auipc	ra,0x2
    800039e0:	5a0080e7          	jalr	1440(ra) # 80005f7c <__putc>
        __putc('C');
    800039e4:	04300513          	li	a0,67
    800039e8:	00002097          	auipc	ra,0x2
    800039ec:	594080e7          	jalr	1428(ra) # 80005f7c <__putc>
        __putc(':');
    800039f0:	03a00513          	li	a0,58
    800039f4:	00002097          	auipc	ra,0x2
    800039f8:	588080e7          	jalr	1416(ra) # 80005f7c <__putc>
        __putc(' ');
    800039fc:	02000513          	li	a0,32
    80003a00:	00002097          	auipc	ra,0x2
    80003a04:	57c080e7          	jalr	1404(ra) # 80005f7c <__putc>
        __putc('0');
    80003a08:	03000513          	li	a0,48
    80003a0c:	00002097          	auipc	ra,0x2
    80003a10:	570080e7          	jalr	1392(ra) # 80005f7c <__putc>
        __putc('x');
    80003a14:	07800513          	li	a0,120
    80003a18:	00002097          	auipc	ra,0x2
    80003a1c:	564080e7          	jalr	1380(ra) # 80005f7c <__putc>
        for(int i = 15; i >= 0; i--){
    80003a20:	00f00493          	li	s1,15
    80003a24:	0140006f          	j	80003a38 <exceptionHandler+0x5a8>
                __putc('A' + tmp - 10);
    80003a28:	03750513          	addi	a0,a0,55
    80003a2c:	00002097          	auipc	ra,0x2
    80003a30:	550080e7          	jalr	1360(ra) # 80005f7c <__putc>
        for(int i = 15; i >= 0; i--){
    80003a34:	fff4849b          	addiw	s1,s1,-1
    80003a38:	0204c463          	bltz	s1,80003a60 <exceptionHandler+0x5d0>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    80003a3c:	0024951b          	slliw	a0,s1,0x2
    80003a40:	00a95533          	srl	a0,s2,a0
    80003a44:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80003a48:	00900793          	li	a5,9
    80003a4c:	fca7eee3          	bltu	a5,a0,80003a28 <exceptionHandler+0x598>
                __putc('0' + tmp);
    80003a50:	03050513          	addi	a0,a0,48
    80003a54:	00002097          	auipc	ra,0x2
    80003a58:	528080e7          	jalr	1320(ra) # 80005f7c <__putc>
    80003a5c:	fd9ff06f          	j	80003a34 <exceptionHandler+0x5a4>
        assert(false);
    80003a60:	00003697          	auipc	a3,0x3
    80003a64:	77868693          	addi	a3,a3,1912 # 800071d8 <CONSOLE_STATUS+0x1c8>
    80003a68:	0b100613          	li	a2,177
    80003a6c:	00003597          	auipc	a1,0x3
    80003a70:	78458593          	addi	a1,a1,1924 # 800071f0 <CONSOLE_STATUS+0x1e0>
    80003a74:	00003517          	auipc	a0,0x3
    80003a78:	79c50513          	addi	a0,a0,1948 # 80007210 <CONSOLE_STATUS+0x200>
    80003a7c:	ffffe097          	auipc	ra,0xffffe
    80003a80:	f0c080e7          	jalr	-244(ra) # 80001988 <_Z13assert_failedPKcS0_jS0_>
    80003a84:	b1dff06f          	j	800035a0 <exceptionHandler+0x110>
        Timer::getInstance().tick();
    80003a88:	ffffd097          	auipc	ra,0xffffd
    80003a8c:	730080e7          	jalr	1840(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    80003a90:	ffffd097          	auipc	ra,0xffffd
    80003a94:	78c080e7          	jalr	1932(ra) # 8000121c <_ZN5Timer4tickEv>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80003a98:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003a9c:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003aa0:	00200793          	li	a5,2
    80003aa4:	1447b073          	csrc	sip,a5
    80003aa8:	af9ff06f          	j	800035a0 <exceptionHandler+0x110>

0000000080003aac <_ZN9SchedulerC1Ev>:
#include "console.h"
#include "thread.h"

Scheduler* Scheduler::singleton = 0;

Scheduler::Scheduler(){
    80003aac:	fe010113          	addi	sp,sp,-32
    80003ab0:	00113c23          	sd	ra,24(sp)
    80003ab4:	00813823          	sd	s0,16(sp)
    80003ab8:	00913423          	sd	s1,8(sp)
    80003abc:	02010413          	addi	s0,sp,32
    80003ac0:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80003ac4:	00004797          	auipc	a5,0x4
    80003ac8:	5947b783          	ld	a5,1428(a5) # 80008058 <_ZN9Scheduler9singletonE>
    80003acc:	02079463          	bnez	a5,80003af4 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80003ad0:	00004797          	auipc	a5,0x4
    80003ad4:	5897b423          	sd	s1,1416(a5) # 80008058 <_ZN9Scheduler9singletonE>
    head = 0;
    80003ad8:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80003adc:	0004b423          	sd	zero,8(s1)
}
    80003ae0:	01813083          	ld	ra,24(sp)
    80003ae4:	01013403          	ld	s0,16(sp)
    80003ae8:	00813483          	ld	s1,8(sp)
    80003aec:	02010113          	addi	sp,sp,32
    80003af0:	00008067          	ret
    assert(singleton == 0);
    80003af4:	00004697          	auipc	a3,0x4
    80003af8:	83468693          	addi	a3,a3,-1996 # 80007328 <CONSOLE_STATUS+0x318>
    80003afc:	01500613          	li	a2,21
    80003b00:	00004597          	auipc	a1,0x4
    80003b04:	84058593          	addi	a1,a1,-1984 # 80007340 <CONSOLE_STATUS+0x330>
    80003b08:	00004517          	auipc	a0,0x4
    80003b0c:	84850513          	addi	a0,a0,-1976 # 80007350 <CONSOLE_STATUS+0x340>
    80003b10:	ffffe097          	auipc	ra,0xffffe
    80003b14:	e78080e7          	jalr	-392(ra) # 80001988 <_Z13assert_failedPKcS0_jS0_>
    80003b18:	fb9ff06f          	j	80003ad0 <_ZN9SchedulerC1Ev+0x24>

0000000080003b1c <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80003b1c:	ff010113          	addi	sp,sp,-16
    80003b20:	00813423          	sd	s0,8(sp)
    80003b24:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80003b28:	00004797          	auipc	a5,0x4
    80003b2c:	5307b783          	ld	a5,1328(a5) # 80008058 <_ZN9Scheduler9singletonE>
    80003b30:	0007b503          	ld	a0,0(a5)
}
    80003b34:	00153513          	seqz	a0,a0
    80003b38:	00813403          	ld	s0,8(sp)
    80003b3c:	01010113          	addi	sp,sp,16
    80003b40:	00008067          	ret

0000000080003b44 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80003b44:	fe010113          	addi	sp,sp,-32
    80003b48:	00113c23          	sd	ra,24(sp)
    80003b4c:	00813823          	sd	s0,16(sp)
    80003b50:	00913423          	sd	s1,8(sp)
    80003b54:	01213023          	sd	s2,0(sp)
    80003b58:	02010413          	addi	s0,sp,32
    80003b5c:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80003b60:	00004917          	auipc	s2,0x4
    80003b64:	4f893903          	ld	s2,1272(s2) # 80008058 <_ZN9Scheduler9singletonE>
    80003b68:	00093783          	ld	a5,0(s2)
    80003b6c:	12078c63          	beqz	a5,80003ca4 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003b70:	00893903          	ld	s2,8(s2)
    80003b74:	01000513          	li	a0,16
    80003b78:	ffffe097          	auipc	ra,0xffffe
    80003b7c:	8ac080e7          	jalr	-1876(ra) # 80001424 <_Z9mem_allocm>
    80003b80:	00a90423          	sb	a0,8(s2)
    80003b84:	00855793          	srli	a5,a0,0x8
    80003b88:	00f904a3          	sb	a5,9(s2)
    80003b8c:	01055793          	srli	a5,a0,0x10
    80003b90:	00f90523          	sb	a5,10(s2)
    80003b94:	0185579b          	srliw	a5,a0,0x18
    80003b98:	00f905a3          	sb	a5,11(s2)
    80003b9c:	02055793          	srli	a5,a0,0x20
    80003ba0:	00f90623          	sb	a5,12(s2)
    80003ba4:	02855793          	srli	a5,a0,0x28
    80003ba8:	00f906a3          	sb	a5,13(s2)
    80003bac:	03055793          	srli	a5,a0,0x30
    80003bb0:	00f90723          	sb	a5,14(s2)
    80003bb4:	03855513          	srli	a0,a0,0x38
    80003bb8:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80003bbc:	00004617          	auipc	a2,0x4
    80003bc0:	49c60613          	addi	a2,a2,1180 # 80008058 <_ZN9Scheduler9singletonE>
    80003bc4:	00063583          	ld	a1,0(a2)
    80003bc8:	0085b703          	ld	a4,8(a1)
    80003bcc:	00874783          	lbu	a5,8(a4)
    80003bd0:	00974683          	lbu	a3,9(a4)
    80003bd4:	00869693          	slli	a3,a3,0x8
    80003bd8:	00f6e6b3          	or	a3,a3,a5
    80003bdc:	00a74783          	lbu	a5,10(a4)
    80003be0:	01079793          	slli	a5,a5,0x10
    80003be4:	00d7e6b3          	or	a3,a5,a3
    80003be8:	00b74783          	lbu	a5,11(a4)
    80003bec:	01879793          	slli	a5,a5,0x18
    80003bf0:	00d7e7b3          	or	a5,a5,a3
    80003bf4:	00c74683          	lbu	a3,12(a4)
    80003bf8:	02069693          	slli	a3,a3,0x20
    80003bfc:	00f6e7b3          	or	a5,a3,a5
    80003c00:	00d74683          	lbu	a3,13(a4)
    80003c04:	02869693          	slli	a3,a3,0x28
    80003c08:	00f6e6b3          	or	a3,a3,a5
    80003c0c:	00e74783          	lbu	a5,14(a4)
    80003c10:	03079793          	slli	a5,a5,0x30
    80003c14:	00d7e6b3          	or	a3,a5,a3
    80003c18:	00f74783          	lbu	a5,15(a4)
    80003c1c:	03879793          	slli	a5,a5,0x38
    80003c20:	00d7e7b3          	or	a5,a5,a3
    80003c24:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80003c28:	00978023          	sb	s1,0(a5)
    80003c2c:	0084d713          	srli	a4,s1,0x8
    80003c30:	00e780a3          	sb	a4,1(a5)
    80003c34:	0104d713          	srli	a4,s1,0x10
    80003c38:	00e78123          	sb	a4,2(a5)
    80003c3c:	0184d71b          	srliw	a4,s1,0x18
    80003c40:	00e781a3          	sb	a4,3(a5)
    80003c44:	0204d713          	srli	a4,s1,0x20
    80003c48:	00e78223          	sb	a4,4(a5)
    80003c4c:	0284d713          	srli	a4,s1,0x28
    80003c50:	00e782a3          	sb	a4,5(a5)
    80003c54:	0304d713          	srli	a4,s1,0x30
    80003c58:	00e78323          	sb	a4,6(a5)
    80003c5c:	0384d493          	srli	s1,s1,0x38
    80003c60:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80003c64:	00063783          	ld	a5,0(a2)
    80003c68:	0087b783          	ld	a5,8(a5)
    80003c6c:	00078423          	sb	zero,8(a5)
    80003c70:	000784a3          	sb	zero,9(a5)
    80003c74:	00078523          	sb	zero,10(a5)
    80003c78:	000785a3          	sb	zero,11(a5)
    80003c7c:	00078623          	sb	zero,12(a5)
    80003c80:	000786a3          	sb	zero,13(a5)
    80003c84:	00078723          	sb	zero,14(a5)
    80003c88:	000787a3          	sb	zero,15(a5)
    }
}
    80003c8c:	01813083          	ld	ra,24(sp)
    80003c90:	01013403          	ld	s0,16(sp)
    80003c94:	00813483          	ld	s1,8(sp)
    80003c98:	00013903          	ld	s2,0(sp)
    80003c9c:	02010113          	addi	sp,sp,32
    80003ca0:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003ca4:	01000513          	li	a0,16
    80003ca8:	ffffd097          	auipc	ra,0xffffd
    80003cac:	77c080e7          	jalr	1916(ra) # 80001424 <_Z9mem_allocm>
    80003cb0:	00a93423          	sd	a0,8(s2)
    80003cb4:	00004717          	auipc	a4,0x4
    80003cb8:	3a470713          	addi	a4,a4,932 # 80008058 <_ZN9Scheduler9singletonE>
    80003cbc:	00073783          	ld	a5,0(a4)
    80003cc0:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80003cc4:	00073783          	ld	a5,0(a4)
    80003cc8:	0007b783          	ld	a5,0(a5)
    80003ccc:	00978023          	sb	s1,0(a5)
    80003cd0:	0084d693          	srli	a3,s1,0x8
    80003cd4:	00d780a3          	sb	a3,1(a5)
    80003cd8:	0104d693          	srli	a3,s1,0x10
    80003cdc:	00d78123          	sb	a3,2(a5)
    80003ce0:	0184d69b          	srliw	a3,s1,0x18
    80003ce4:	00d781a3          	sb	a3,3(a5)
    80003ce8:	0204d693          	srli	a3,s1,0x20
    80003cec:	00d78223          	sb	a3,4(a5)
    80003cf0:	0284d693          	srli	a3,s1,0x28
    80003cf4:	00d782a3          	sb	a3,5(a5)
    80003cf8:	0304d693          	srli	a3,s1,0x30
    80003cfc:	00d78323          	sb	a3,6(a5)
    80003d00:	0384d493          	srli	s1,s1,0x38
    80003d04:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80003d08:	00073783          	ld	a5,0(a4)
    80003d0c:	0007b783          	ld	a5,0(a5)
    80003d10:	00078423          	sb	zero,8(a5)
    80003d14:	000784a3          	sb	zero,9(a5)
    80003d18:	00078523          	sb	zero,10(a5)
    80003d1c:	000785a3          	sb	zero,11(a5)
    80003d20:	00078623          	sb	zero,12(a5)
    80003d24:	000786a3          	sb	zero,13(a5)
    80003d28:	00078723          	sb	zero,14(a5)
    80003d2c:	000787a3          	sb	zero,15(a5)
    80003d30:	f5dff06f          	j	80003c8c <_ZN9Scheduler3putEP7_thread+0x148>

0000000080003d34 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80003d34:	ff010113          	addi	sp,sp,-16
    80003d38:	00813423          	sd	s0,8(sp)
    80003d3c:	01010413          	addi	s0,sp,16
    ThreadList* tmp = singleton->head;
    80003d40:	00004617          	auipc	a2,0x4
    80003d44:	31863603          	ld	a2,792(a2) # 80008058 <_ZN9Scheduler9singletonE>
    80003d48:	00063783          	ld	a5,0(a2)
    if(tmp == 0){
    80003d4c:	0c078e63          	beqz	a5,80003e28 <_ZN9Scheduler3getEv+0xf4>
        return 0;
    }
    thread_t thread = tmp->thread;
    80003d50:	0007c503          	lbu	a0,0(a5)
    80003d54:	0017c703          	lbu	a4,1(a5)
    80003d58:	00871713          	slli	a4,a4,0x8
    80003d5c:	00a76733          	or	a4,a4,a0
    80003d60:	0027c503          	lbu	a0,2(a5)
    80003d64:	01051513          	slli	a0,a0,0x10
    80003d68:	00e56733          	or	a4,a0,a4
    80003d6c:	0037c503          	lbu	a0,3(a5)
    80003d70:	01851513          	slli	a0,a0,0x18
    80003d74:	00e56533          	or	a0,a0,a4
    80003d78:	0047c703          	lbu	a4,4(a5)
    80003d7c:	02071713          	slli	a4,a4,0x20
    80003d80:	00a76533          	or	a0,a4,a0
    80003d84:	0057c703          	lbu	a4,5(a5)
    80003d88:	02871713          	slli	a4,a4,0x28
    80003d8c:	00a76733          	or	a4,a4,a0
    80003d90:	0067c503          	lbu	a0,6(a5)
    80003d94:	03051513          	slli	a0,a0,0x30
    80003d98:	00e56733          	or	a4,a0,a4
    80003d9c:	0077c503          	lbu	a0,7(a5)
    80003da0:	03851513          	slli	a0,a0,0x38
    80003da4:	00e56533          	or	a0,a0,a4
    singleton->head = tmp->next;
    80003da8:	0087c683          	lbu	a3,8(a5)
    80003dac:	0097c703          	lbu	a4,9(a5)
    80003db0:	00871713          	slli	a4,a4,0x8
    80003db4:	00d766b3          	or	a3,a4,a3
    80003db8:	00a7c703          	lbu	a4,10(a5)
    80003dbc:	01071713          	slli	a4,a4,0x10
    80003dc0:	00d76733          	or	a4,a4,a3
    80003dc4:	00b7c683          	lbu	a3,11(a5)
    80003dc8:	01869693          	slli	a3,a3,0x18
    80003dcc:	00e6e733          	or	a4,a3,a4
    80003dd0:	00c7c683          	lbu	a3,12(a5)
    80003dd4:	02069693          	slli	a3,a3,0x20
    80003dd8:	00e6e6b3          	or	a3,a3,a4
    80003ddc:	00d7c703          	lbu	a4,13(a5)
    80003de0:	02871713          	slli	a4,a4,0x28
    80003de4:	00d766b3          	or	a3,a4,a3
    80003de8:	00e7c703          	lbu	a4,14(a5)
    80003dec:	03071713          	slli	a4,a4,0x30
    80003df0:	00d76733          	or	a4,a4,a3
    80003df4:	00f7c783          	lbu	a5,15(a5)
    80003df8:	03879793          	slli	a5,a5,0x38
    80003dfc:	00e7e7b3          	or	a5,a5,a4
    80003e00:	00f63023          	sd	a5,0(a2)
    if(singleton->head == 0){
    80003e04:	00004797          	auipc	a5,0x4
    80003e08:	2547b783          	ld	a5,596(a5) # 80008058 <_ZN9Scheduler9singletonE>
    80003e0c:	0007b703          	ld	a4,0(a5)
    80003e10:	00070863          	beqz	a4,80003e20 <_ZN9Scheduler3getEv+0xec>
        singleton->tail = 0;
    }
    // mem_free(tmp);
    return thread;
}
    80003e14:	00813403          	ld	s0,8(sp)
    80003e18:	01010113          	addi	sp,sp,16
    80003e1c:	00008067          	ret
        singleton->tail = 0;
    80003e20:	0007b423          	sd	zero,8(a5)
    80003e24:	ff1ff06f          	j	80003e14 <_ZN9Scheduler3getEv+0xe0>
        return 0;
    80003e28:	00078513          	mv	a0,a5
    80003e2c:	fe9ff06f          	j	80003e14 <_ZN9Scheduler3getEv+0xe0>

0000000080003e30 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80003e30:	ff010113          	addi	sp,sp,-16
    80003e34:	00813423          	sd	s0,8(sp)
    80003e38:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80003e3c:	00004797          	auipc	a5,0x4
    80003e40:	21c7b783          	ld	a5,540(a5) # 80008058 <_ZN9Scheduler9singletonE>
    80003e44:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80003e48:	00000513          	li	a0,0
    while(tmp != 0){
    80003e4c:	06078263          	beqz	a5,80003eb0 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80003e50:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80003e54:	0087c683          	lbu	a3,8(a5)
    80003e58:	0097c703          	lbu	a4,9(a5)
    80003e5c:	00871713          	slli	a4,a4,0x8
    80003e60:	00d766b3          	or	a3,a4,a3
    80003e64:	00a7c703          	lbu	a4,10(a5)
    80003e68:	01071713          	slli	a4,a4,0x10
    80003e6c:	00d76733          	or	a4,a4,a3
    80003e70:	00b7c683          	lbu	a3,11(a5)
    80003e74:	01869693          	slli	a3,a3,0x18
    80003e78:	00e6e733          	or	a4,a3,a4
    80003e7c:	00c7c683          	lbu	a3,12(a5)
    80003e80:	02069693          	slli	a3,a3,0x20
    80003e84:	00e6e6b3          	or	a3,a3,a4
    80003e88:	00d7c703          	lbu	a4,13(a5)
    80003e8c:	02871713          	slli	a4,a4,0x28
    80003e90:	00d766b3          	or	a3,a4,a3
    80003e94:	00e7c703          	lbu	a4,14(a5)
    80003e98:	03071713          	slli	a4,a4,0x30
    80003e9c:	00d76733          	or	a4,a4,a3
    80003ea0:	00f7c783          	lbu	a5,15(a5)
    80003ea4:	03879793          	slli	a5,a5,0x38
    80003ea8:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80003eac:	fa1ff06f          	j	80003e4c <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80003eb0:	00813403          	ld	s0,8(sp)
    80003eb4:	01010113          	addi	sp,sp,16
    80003eb8:	00008067          	ret

0000000080003ebc <start>:
    80003ebc:	ff010113          	addi	sp,sp,-16
    80003ec0:	00813423          	sd	s0,8(sp)
    80003ec4:	01010413          	addi	s0,sp,16
    80003ec8:	300027f3          	csrr	a5,mstatus
    80003ecc:	ffffe737          	lui	a4,0xffffe
    80003ed0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff553f>
    80003ed4:	00e7f7b3          	and	a5,a5,a4
    80003ed8:	00001737          	lui	a4,0x1
    80003edc:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003ee0:	00e7e7b3          	or	a5,a5,a4
    80003ee4:	30079073          	csrw	mstatus,a5
    80003ee8:	00000797          	auipc	a5,0x0
    80003eec:	16078793          	addi	a5,a5,352 # 80004048 <system_main>
    80003ef0:	34179073          	csrw	mepc,a5
    80003ef4:	00000793          	li	a5,0
    80003ef8:	18079073          	csrw	satp,a5
    80003efc:	000107b7          	lui	a5,0x10
    80003f00:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003f04:	30279073          	csrw	medeleg,a5
    80003f08:	30379073          	csrw	mideleg,a5
    80003f0c:	104027f3          	csrr	a5,sie
    80003f10:	2227e793          	ori	a5,a5,546
    80003f14:	10479073          	csrw	sie,a5
    80003f18:	fff00793          	li	a5,-1
    80003f1c:	00a7d793          	srli	a5,a5,0xa
    80003f20:	3b079073          	csrw	pmpaddr0,a5
    80003f24:	00f00793          	li	a5,15
    80003f28:	3a079073          	csrw	pmpcfg0,a5
    80003f2c:	f14027f3          	csrr	a5,mhartid
    80003f30:	0200c737          	lui	a4,0x200c
    80003f34:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003f38:	0007869b          	sext.w	a3,a5
    80003f3c:	00269713          	slli	a4,a3,0x2
    80003f40:	000f4637          	lui	a2,0xf4
    80003f44:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003f48:	00d70733          	add	a4,a4,a3
    80003f4c:	0037979b          	slliw	a5,a5,0x3
    80003f50:	020046b7          	lui	a3,0x2004
    80003f54:	00d787b3          	add	a5,a5,a3
    80003f58:	00c585b3          	add	a1,a1,a2
    80003f5c:	00371693          	slli	a3,a4,0x3
    80003f60:	00004717          	auipc	a4,0x4
    80003f64:	10070713          	addi	a4,a4,256 # 80008060 <timer_scratch>
    80003f68:	00b7b023          	sd	a1,0(a5)
    80003f6c:	00d70733          	add	a4,a4,a3
    80003f70:	00f73c23          	sd	a5,24(a4)
    80003f74:	02c73023          	sd	a2,32(a4)
    80003f78:	34071073          	csrw	mscratch,a4
    80003f7c:	00000797          	auipc	a5,0x0
    80003f80:	6e478793          	addi	a5,a5,1764 # 80004660 <timervec>
    80003f84:	30579073          	csrw	mtvec,a5
    80003f88:	300027f3          	csrr	a5,mstatus
    80003f8c:	0087e793          	ori	a5,a5,8
    80003f90:	30079073          	csrw	mstatus,a5
    80003f94:	304027f3          	csrr	a5,mie
    80003f98:	0807e793          	ori	a5,a5,128
    80003f9c:	30479073          	csrw	mie,a5
    80003fa0:	f14027f3          	csrr	a5,mhartid
    80003fa4:	0007879b          	sext.w	a5,a5
    80003fa8:	00078213          	mv	tp,a5
    80003fac:	30200073          	mret
    80003fb0:	00813403          	ld	s0,8(sp)
    80003fb4:	01010113          	addi	sp,sp,16
    80003fb8:	00008067          	ret

0000000080003fbc <timerinit>:
    80003fbc:	ff010113          	addi	sp,sp,-16
    80003fc0:	00813423          	sd	s0,8(sp)
    80003fc4:	01010413          	addi	s0,sp,16
    80003fc8:	f14027f3          	csrr	a5,mhartid
    80003fcc:	0200c737          	lui	a4,0x200c
    80003fd0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003fd4:	0007869b          	sext.w	a3,a5
    80003fd8:	00269713          	slli	a4,a3,0x2
    80003fdc:	000f4637          	lui	a2,0xf4
    80003fe0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003fe4:	00d70733          	add	a4,a4,a3
    80003fe8:	0037979b          	slliw	a5,a5,0x3
    80003fec:	020046b7          	lui	a3,0x2004
    80003ff0:	00d787b3          	add	a5,a5,a3
    80003ff4:	00c585b3          	add	a1,a1,a2
    80003ff8:	00371693          	slli	a3,a4,0x3
    80003ffc:	00004717          	auipc	a4,0x4
    80004000:	06470713          	addi	a4,a4,100 # 80008060 <timer_scratch>
    80004004:	00b7b023          	sd	a1,0(a5)
    80004008:	00d70733          	add	a4,a4,a3
    8000400c:	00f73c23          	sd	a5,24(a4)
    80004010:	02c73023          	sd	a2,32(a4)
    80004014:	34071073          	csrw	mscratch,a4
    80004018:	00000797          	auipc	a5,0x0
    8000401c:	64878793          	addi	a5,a5,1608 # 80004660 <timervec>
    80004020:	30579073          	csrw	mtvec,a5
    80004024:	300027f3          	csrr	a5,mstatus
    80004028:	0087e793          	ori	a5,a5,8
    8000402c:	30079073          	csrw	mstatus,a5
    80004030:	304027f3          	csrr	a5,mie
    80004034:	0807e793          	ori	a5,a5,128
    80004038:	30479073          	csrw	mie,a5
    8000403c:	00813403          	ld	s0,8(sp)
    80004040:	01010113          	addi	sp,sp,16
    80004044:	00008067          	ret

0000000080004048 <system_main>:
    80004048:	fe010113          	addi	sp,sp,-32
    8000404c:	00813823          	sd	s0,16(sp)
    80004050:	00913423          	sd	s1,8(sp)
    80004054:	00113c23          	sd	ra,24(sp)
    80004058:	02010413          	addi	s0,sp,32
    8000405c:	00000097          	auipc	ra,0x0
    80004060:	0c4080e7          	jalr	196(ra) # 80004120 <cpuid>
    80004064:	00004497          	auipc	s1,0x4
    80004068:	f9c48493          	addi	s1,s1,-100 # 80008000 <started>
    8000406c:	02050263          	beqz	a0,80004090 <system_main+0x48>
    80004070:	0004a783          	lw	a5,0(s1)
    80004074:	0007879b          	sext.w	a5,a5
    80004078:	fe078ce3          	beqz	a5,80004070 <system_main+0x28>
    8000407c:	0ff0000f          	fence
    80004080:	00003517          	auipc	a0,0x3
    80004084:	31050513          	addi	a0,a0,784 # 80007390 <CONSOLE_STATUS+0x380>
    80004088:	00001097          	auipc	ra,0x1
    8000408c:	a74080e7          	jalr	-1420(ra) # 80004afc <panic>
    80004090:	00001097          	auipc	ra,0x1
    80004094:	9c8080e7          	jalr	-1592(ra) # 80004a58 <consoleinit>
    80004098:	00001097          	auipc	ra,0x1
    8000409c:	154080e7          	jalr	340(ra) # 800051ec <printfinit>
    800040a0:	00003517          	auipc	a0,0x3
    800040a4:	3d050513          	addi	a0,a0,976 # 80007470 <CONSOLE_STATUS+0x460>
    800040a8:	00001097          	auipc	ra,0x1
    800040ac:	ab0080e7          	jalr	-1360(ra) # 80004b58 <__printf>
    800040b0:	00003517          	auipc	a0,0x3
    800040b4:	2b050513          	addi	a0,a0,688 # 80007360 <CONSOLE_STATUS+0x350>
    800040b8:	00001097          	auipc	ra,0x1
    800040bc:	aa0080e7          	jalr	-1376(ra) # 80004b58 <__printf>
    800040c0:	00003517          	auipc	a0,0x3
    800040c4:	3b050513          	addi	a0,a0,944 # 80007470 <CONSOLE_STATUS+0x460>
    800040c8:	00001097          	auipc	ra,0x1
    800040cc:	a90080e7          	jalr	-1392(ra) # 80004b58 <__printf>
    800040d0:	00001097          	auipc	ra,0x1
    800040d4:	4a8080e7          	jalr	1192(ra) # 80005578 <kinit>
    800040d8:	00000097          	auipc	ra,0x0
    800040dc:	148080e7          	jalr	328(ra) # 80004220 <trapinit>
    800040e0:	00000097          	auipc	ra,0x0
    800040e4:	16c080e7          	jalr	364(ra) # 8000424c <trapinithart>
    800040e8:	00000097          	auipc	ra,0x0
    800040ec:	5b8080e7          	jalr	1464(ra) # 800046a0 <plicinit>
    800040f0:	00000097          	auipc	ra,0x0
    800040f4:	5d8080e7          	jalr	1496(ra) # 800046c8 <plicinithart>
    800040f8:	00000097          	auipc	ra,0x0
    800040fc:	078080e7          	jalr	120(ra) # 80004170 <userinit>
    80004100:	0ff0000f          	fence
    80004104:	00100793          	li	a5,1
    80004108:	00003517          	auipc	a0,0x3
    8000410c:	27050513          	addi	a0,a0,624 # 80007378 <CONSOLE_STATUS+0x368>
    80004110:	00f4a023          	sw	a5,0(s1)
    80004114:	00001097          	auipc	ra,0x1
    80004118:	a44080e7          	jalr	-1468(ra) # 80004b58 <__printf>
    8000411c:	0000006f          	j	8000411c <system_main+0xd4>

0000000080004120 <cpuid>:
    80004120:	ff010113          	addi	sp,sp,-16
    80004124:	00813423          	sd	s0,8(sp)
    80004128:	01010413          	addi	s0,sp,16
    8000412c:	00020513          	mv	a0,tp
    80004130:	00813403          	ld	s0,8(sp)
    80004134:	0005051b          	sext.w	a0,a0
    80004138:	01010113          	addi	sp,sp,16
    8000413c:	00008067          	ret

0000000080004140 <mycpu>:
    80004140:	ff010113          	addi	sp,sp,-16
    80004144:	00813423          	sd	s0,8(sp)
    80004148:	01010413          	addi	s0,sp,16
    8000414c:	00020793          	mv	a5,tp
    80004150:	00813403          	ld	s0,8(sp)
    80004154:	0007879b          	sext.w	a5,a5
    80004158:	00779793          	slli	a5,a5,0x7
    8000415c:	00005517          	auipc	a0,0x5
    80004160:	f3450513          	addi	a0,a0,-204 # 80009090 <cpus>
    80004164:	00f50533          	add	a0,a0,a5
    80004168:	01010113          	addi	sp,sp,16
    8000416c:	00008067          	ret

0000000080004170 <userinit>:
    80004170:	ff010113          	addi	sp,sp,-16
    80004174:	00813423          	sd	s0,8(sp)
    80004178:	01010413          	addi	s0,sp,16
    8000417c:	00813403          	ld	s0,8(sp)
    80004180:	01010113          	addi	sp,sp,16
    80004184:	ffffd317          	auipc	t1,0xffffd
    80004188:	74830067          	jr	1864(t1) # 800018cc <main>

000000008000418c <either_copyout>:
    8000418c:	ff010113          	addi	sp,sp,-16
    80004190:	00813023          	sd	s0,0(sp)
    80004194:	00113423          	sd	ra,8(sp)
    80004198:	01010413          	addi	s0,sp,16
    8000419c:	02051663          	bnez	a0,800041c8 <either_copyout+0x3c>
    800041a0:	00058513          	mv	a0,a1
    800041a4:	00060593          	mv	a1,a2
    800041a8:	0006861b          	sext.w	a2,a3
    800041ac:	00002097          	auipc	ra,0x2
    800041b0:	c58080e7          	jalr	-936(ra) # 80005e04 <__memmove>
    800041b4:	00813083          	ld	ra,8(sp)
    800041b8:	00013403          	ld	s0,0(sp)
    800041bc:	00000513          	li	a0,0
    800041c0:	01010113          	addi	sp,sp,16
    800041c4:	00008067          	ret
    800041c8:	00003517          	auipc	a0,0x3
    800041cc:	1f050513          	addi	a0,a0,496 # 800073b8 <CONSOLE_STATUS+0x3a8>
    800041d0:	00001097          	auipc	ra,0x1
    800041d4:	92c080e7          	jalr	-1748(ra) # 80004afc <panic>

00000000800041d8 <either_copyin>:
    800041d8:	ff010113          	addi	sp,sp,-16
    800041dc:	00813023          	sd	s0,0(sp)
    800041e0:	00113423          	sd	ra,8(sp)
    800041e4:	01010413          	addi	s0,sp,16
    800041e8:	02059463          	bnez	a1,80004210 <either_copyin+0x38>
    800041ec:	00060593          	mv	a1,a2
    800041f0:	0006861b          	sext.w	a2,a3
    800041f4:	00002097          	auipc	ra,0x2
    800041f8:	c10080e7          	jalr	-1008(ra) # 80005e04 <__memmove>
    800041fc:	00813083          	ld	ra,8(sp)
    80004200:	00013403          	ld	s0,0(sp)
    80004204:	00000513          	li	a0,0
    80004208:	01010113          	addi	sp,sp,16
    8000420c:	00008067          	ret
    80004210:	00003517          	auipc	a0,0x3
    80004214:	1d050513          	addi	a0,a0,464 # 800073e0 <CONSOLE_STATUS+0x3d0>
    80004218:	00001097          	auipc	ra,0x1
    8000421c:	8e4080e7          	jalr	-1820(ra) # 80004afc <panic>

0000000080004220 <trapinit>:
    80004220:	ff010113          	addi	sp,sp,-16
    80004224:	00813423          	sd	s0,8(sp)
    80004228:	01010413          	addi	s0,sp,16
    8000422c:	00813403          	ld	s0,8(sp)
    80004230:	00003597          	auipc	a1,0x3
    80004234:	1d858593          	addi	a1,a1,472 # 80007408 <CONSOLE_STATUS+0x3f8>
    80004238:	00005517          	auipc	a0,0x5
    8000423c:	ed850513          	addi	a0,a0,-296 # 80009110 <tickslock>
    80004240:	01010113          	addi	sp,sp,16
    80004244:	00001317          	auipc	t1,0x1
    80004248:	5c430067          	jr	1476(t1) # 80005808 <initlock>

000000008000424c <trapinithart>:
    8000424c:	ff010113          	addi	sp,sp,-16
    80004250:	00813423          	sd	s0,8(sp)
    80004254:	01010413          	addi	s0,sp,16
    80004258:	00000797          	auipc	a5,0x0
    8000425c:	2f878793          	addi	a5,a5,760 # 80004550 <kernelvec>
    80004260:	10579073          	csrw	stvec,a5
    80004264:	00813403          	ld	s0,8(sp)
    80004268:	01010113          	addi	sp,sp,16
    8000426c:	00008067          	ret

0000000080004270 <usertrap>:
    80004270:	ff010113          	addi	sp,sp,-16
    80004274:	00813423          	sd	s0,8(sp)
    80004278:	01010413          	addi	s0,sp,16
    8000427c:	00813403          	ld	s0,8(sp)
    80004280:	01010113          	addi	sp,sp,16
    80004284:	00008067          	ret

0000000080004288 <usertrapret>:
    80004288:	ff010113          	addi	sp,sp,-16
    8000428c:	00813423          	sd	s0,8(sp)
    80004290:	01010413          	addi	s0,sp,16
    80004294:	00813403          	ld	s0,8(sp)
    80004298:	01010113          	addi	sp,sp,16
    8000429c:	00008067          	ret

00000000800042a0 <kerneltrap>:
    800042a0:	fe010113          	addi	sp,sp,-32
    800042a4:	00813823          	sd	s0,16(sp)
    800042a8:	00113c23          	sd	ra,24(sp)
    800042ac:	00913423          	sd	s1,8(sp)
    800042b0:	02010413          	addi	s0,sp,32
    800042b4:	142025f3          	csrr	a1,scause
    800042b8:	100027f3          	csrr	a5,sstatus
    800042bc:	0027f793          	andi	a5,a5,2
    800042c0:	10079c63          	bnez	a5,800043d8 <kerneltrap+0x138>
    800042c4:	142027f3          	csrr	a5,scause
    800042c8:	0207ce63          	bltz	a5,80004304 <kerneltrap+0x64>
    800042cc:	00003517          	auipc	a0,0x3
    800042d0:	18450513          	addi	a0,a0,388 # 80007450 <CONSOLE_STATUS+0x440>
    800042d4:	00001097          	auipc	ra,0x1
    800042d8:	884080e7          	jalr	-1916(ra) # 80004b58 <__printf>
    800042dc:	141025f3          	csrr	a1,sepc
    800042e0:	14302673          	csrr	a2,stval
    800042e4:	00003517          	auipc	a0,0x3
    800042e8:	17c50513          	addi	a0,a0,380 # 80007460 <CONSOLE_STATUS+0x450>
    800042ec:	00001097          	auipc	ra,0x1
    800042f0:	86c080e7          	jalr	-1940(ra) # 80004b58 <__printf>
    800042f4:	00003517          	auipc	a0,0x3
    800042f8:	18450513          	addi	a0,a0,388 # 80007478 <CONSOLE_STATUS+0x468>
    800042fc:	00001097          	auipc	ra,0x1
    80004300:	800080e7          	jalr	-2048(ra) # 80004afc <panic>
    80004304:	0ff7f713          	andi	a4,a5,255
    80004308:	00900693          	li	a3,9
    8000430c:	04d70063          	beq	a4,a3,8000434c <kerneltrap+0xac>
    80004310:	fff00713          	li	a4,-1
    80004314:	03f71713          	slli	a4,a4,0x3f
    80004318:	00170713          	addi	a4,a4,1
    8000431c:	fae798e3          	bne	a5,a4,800042cc <kerneltrap+0x2c>
    80004320:	00000097          	auipc	ra,0x0
    80004324:	e00080e7          	jalr	-512(ra) # 80004120 <cpuid>
    80004328:	06050663          	beqz	a0,80004394 <kerneltrap+0xf4>
    8000432c:	144027f3          	csrr	a5,sip
    80004330:	ffd7f793          	andi	a5,a5,-3
    80004334:	14479073          	csrw	sip,a5
    80004338:	01813083          	ld	ra,24(sp)
    8000433c:	01013403          	ld	s0,16(sp)
    80004340:	00813483          	ld	s1,8(sp)
    80004344:	02010113          	addi	sp,sp,32
    80004348:	00008067          	ret
    8000434c:	00000097          	auipc	ra,0x0
    80004350:	3c8080e7          	jalr	968(ra) # 80004714 <plic_claim>
    80004354:	00a00793          	li	a5,10
    80004358:	00050493          	mv	s1,a0
    8000435c:	06f50863          	beq	a0,a5,800043cc <kerneltrap+0x12c>
    80004360:	fc050ce3          	beqz	a0,80004338 <kerneltrap+0x98>
    80004364:	00050593          	mv	a1,a0
    80004368:	00003517          	auipc	a0,0x3
    8000436c:	0c850513          	addi	a0,a0,200 # 80007430 <CONSOLE_STATUS+0x420>
    80004370:	00000097          	auipc	ra,0x0
    80004374:	7e8080e7          	jalr	2024(ra) # 80004b58 <__printf>
    80004378:	01013403          	ld	s0,16(sp)
    8000437c:	01813083          	ld	ra,24(sp)
    80004380:	00048513          	mv	a0,s1
    80004384:	00813483          	ld	s1,8(sp)
    80004388:	02010113          	addi	sp,sp,32
    8000438c:	00000317          	auipc	t1,0x0
    80004390:	3c030067          	jr	960(t1) # 8000474c <plic_complete>
    80004394:	00005517          	auipc	a0,0x5
    80004398:	d7c50513          	addi	a0,a0,-644 # 80009110 <tickslock>
    8000439c:	00001097          	auipc	ra,0x1
    800043a0:	490080e7          	jalr	1168(ra) # 8000582c <acquire>
    800043a4:	00004717          	auipc	a4,0x4
    800043a8:	c6070713          	addi	a4,a4,-928 # 80008004 <ticks>
    800043ac:	00072783          	lw	a5,0(a4)
    800043b0:	00005517          	auipc	a0,0x5
    800043b4:	d6050513          	addi	a0,a0,-672 # 80009110 <tickslock>
    800043b8:	0017879b          	addiw	a5,a5,1
    800043bc:	00f72023          	sw	a5,0(a4)
    800043c0:	00001097          	auipc	ra,0x1
    800043c4:	538080e7          	jalr	1336(ra) # 800058f8 <release>
    800043c8:	f65ff06f          	j	8000432c <kerneltrap+0x8c>
    800043cc:	00001097          	auipc	ra,0x1
    800043d0:	094080e7          	jalr	148(ra) # 80005460 <uartintr>
    800043d4:	fa5ff06f          	j	80004378 <kerneltrap+0xd8>
    800043d8:	00003517          	auipc	a0,0x3
    800043dc:	03850513          	addi	a0,a0,56 # 80007410 <CONSOLE_STATUS+0x400>
    800043e0:	00000097          	auipc	ra,0x0
    800043e4:	71c080e7          	jalr	1820(ra) # 80004afc <panic>

00000000800043e8 <clockintr>:
    800043e8:	fe010113          	addi	sp,sp,-32
    800043ec:	00813823          	sd	s0,16(sp)
    800043f0:	00913423          	sd	s1,8(sp)
    800043f4:	00113c23          	sd	ra,24(sp)
    800043f8:	02010413          	addi	s0,sp,32
    800043fc:	00005497          	auipc	s1,0x5
    80004400:	d1448493          	addi	s1,s1,-748 # 80009110 <tickslock>
    80004404:	00048513          	mv	a0,s1
    80004408:	00001097          	auipc	ra,0x1
    8000440c:	424080e7          	jalr	1060(ra) # 8000582c <acquire>
    80004410:	00004717          	auipc	a4,0x4
    80004414:	bf470713          	addi	a4,a4,-1036 # 80008004 <ticks>
    80004418:	00072783          	lw	a5,0(a4)
    8000441c:	01013403          	ld	s0,16(sp)
    80004420:	01813083          	ld	ra,24(sp)
    80004424:	00048513          	mv	a0,s1
    80004428:	0017879b          	addiw	a5,a5,1
    8000442c:	00813483          	ld	s1,8(sp)
    80004430:	00f72023          	sw	a5,0(a4)
    80004434:	02010113          	addi	sp,sp,32
    80004438:	00001317          	auipc	t1,0x1
    8000443c:	4c030067          	jr	1216(t1) # 800058f8 <release>

0000000080004440 <devintr>:
    80004440:	142027f3          	csrr	a5,scause
    80004444:	00000513          	li	a0,0
    80004448:	0007c463          	bltz	a5,80004450 <devintr+0x10>
    8000444c:	00008067          	ret
    80004450:	fe010113          	addi	sp,sp,-32
    80004454:	00813823          	sd	s0,16(sp)
    80004458:	00113c23          	sd	ra,24(sp)
    8000445c:	00913423          	sd	s1,8(sp)
    80004460:	02010413          	addi	s0,sp,32
    80004464:	0ff7f713          	andi	a4,a5,255
    80004468:	00900693          	li	a3,9
    8000446c:	04d70c63          	beq	a4,a3,800044c4 <devintr+0x84>
    80004470:	fff00713          	li	a4,-1
    80004474:	03f71713          	slli	a4,a4,0x3f
    80004478:	00170713          	addi	a4,a4,1
    8000447c:	00e78c63          	beq	a5,a4,80004494 <devintr+0x54>
    80004480:	01813083          	ld	ra,24(sp)
    80004484:	01013403          	ld	s0,16(sp)
    80004488:	00813483          	ld	s1,8(sp)
    8000448c:	02010113          	addi	sp,sp,32
    80004490:	00008067          	ret
    80004494:	00000097          	auipc	ra,0x0
    80004498:	c8c080e7          	jalr	-884(ra) # 80004120 <cpuid>
    8000449c:	06050663          	beqz	a0,80004508 <devintr+0xc8>
    800044a0:	144027f3          	csrr	a5,sip
    800044a4:	ffd7f793          	andi	a5,a5,-3
    800044a8:	14479073          	csrw	sip,a5
    800044ac:	01813083          	ld	ra,24(sp)
    800044b0:	01013403          	ld	s0,16(sp)
    800044b4:	00813483          	ld	s1,8(sp)
    800044b8:	00200513          	li	a0,2
    800044bc:	02010113          	addi	sp,sp,32
    800044c0:	00008067          	ret
    800044c4:	00000097          	auipc	ra,0x0
    800044c8:	250080e7          	jalr	592(ra) # 80004714 <plic_claim>
    800044cc:	00a00793          	li	a5,10
    800044d0:	00050493          	mv	s1,a0
    800044d4:	06f50663          	beq	a0,a5,80004540 <devintr+0x100>
    800044d8:	00100513          	li	a0,1
    800044dc:	fa0482e3          	beqz	s1,80004480 <devintr+0x40>
    800044e0:	00048593          	mv	a1,s1
    800044e4:	00003517          	auipc	a0,0x3
    800044e8:	f4c50513          	addi	a0,a0,-180 # 80007430 <CONSOLE_STATUS+0x420>
    800044ec:	00000097          	auipc	ra,0x0
    800044f0:	66c080e7          	jalr	1644(ra) # 80004b58 <__printf>
    800044f4:	00048513          	mv	a0,s1
    800044f8:	00000097          	auipc	ra,0x0
    800044fc:	254080e7          	jalr	596(ra) # 8000474c <plic_complete>
    80004500:	00100513          	li	a0,1
    80004504:	f7dff06f          	j	80004480 <devintr+0x40>
    80004508:	00005517          	auipc	a0,0x5
    8000450c:	c0850513          	addi	a0,a0,-1016 # 80009110 <tickslock>
    80004510:	00001097          	auipc	ra,0x1
    80004514:	31c080e7          	jalr	796(ra) # 8000582c <acquire>
    80004518:	00004717          	auipc	a4,0x4
    8000451c:	aec70713          	addi	a4,a4,-1300 # 80008004 <ticks>
    80004520:	00072783          	lw	a5,0(a4)
    80004524:	00005517          	auipc	a0,0x5
    80004528:	bec50513          	addi	a0,a0,-1044 # 80009110 <tickslock>
    8000452c:	0017879b          	addiw	a5,a5,1
    80004530:	00f72023          	sw	a5,0(a4)
    80004534:	00001097          	auipc	ra,0x1
    80004538:	3c4080e7          	jalr	964(ra) # 800058f8 <release>
    8000453c:	f65ff06f          	j	800044a0 <devintr+0x60>
    80004540:	00001097          	auipc	ra,0x1
    80004544:	f20080e7          	jalr	-224(ra) # 80005460 <uartintr>
    80004548:	fadff06f          	j	800044f4 <devintr+0xb4>
    8000454c:	0000                	unimp
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
    800045d0:	cd1ff0ef          	jal	ra,800042a0 <kerneltrap>
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
    800046dc:	a48080e7          	jalr	-1464(ra) # 80004120 <cpuid>
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
    80004728:	9fc080e7          	jalr	-1540(ra) # 80004120 <cpuid>
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
    80004768:	9bc080e7          	jalr	-1604(ra) # 80004120 <cpuid>
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
    800047fc:	9e0080e7          	jalr	-1568(ra) # 800041d8 <either_copyin>
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
    8000487c:	8c048493          	addi	s1,s1,-1856 # 80009138 <cons>
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
    800048d4:	8bc080e7          	jalr	-1860(ra) # 8000418c <either_copyout>
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
    800049dc:	00004917          	auipc	s2,0x4
    800049e0:	75c90913          	addi	s2,s2,1884 # 80009138 <cons>
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
    80004a3c:	00004517          	auipc	a0,0x4
    80004a40:	6fc50513          	addi	a0,a0,1788 # 80009138 <cons>
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
    80004a70:	6cc48493          	addi	s1,s1,1740 # 80009138 <cons>
    80004a74:	00048513          	mv	a0,s1
    80004a78:	00003597          	auipc	a1,0x3
    80004a7c:	a1058593          	addi	a1,a1,-1520 # 80007488 <CONSOLE_STATUS+0x478>
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
    80004acc:	00004317          	auipc	t1,0x4
    80004ad0:	72433303          	ld	t1,1828(t1) # 800091f0 <devsw+0x10>
    80004ad4:	01010113          	addi	sp,sp,16
    80004ad8:	00030067          	jr	t1

0000000080004adc <console_write>:
    80004adc:	ff010113          	addi	sp,sp,-16
    80004ae0:	00813423          	sd	s0,8(sp)
    80004ae4:	01010413          	addi	s0,sp,16
    80004ae8:	00813403          	ld	s0,8(sp)
    80004aec:	00004317          	auipc	t1,0x4
    80004af0:	70c33303          	ld	t1,1804(t1) # 800091f8 <devsw+0x18>
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
    80004b18:	97c50513          	addi	a0,a0,-1668 # 80007490 <CONSOLE_STATUS+0x480>
    80004b1c:	00004797          	auipc	a5,0x4
    80004b20:	7607ae23          	sw	zero,1916(a5) # 80009298 <pr+0x18>
    80004b24:	00000097          	auipc	ra,0x0
    80004b28:	034080e7          	jalr	52(ra) # 80004b58 <__printf>
    80004b2c:	00048513          	mv	a0,s1
    80004b30:	00000097          	auipc	ra,0x0
    80004b34:	028080e7          	jalr	40(ra) # 80004b58 <__printf>
    80004b38:	00003517          	auipc	a0,0x3
    80004b3c:	93850513          	addi	a0,a0,-1736 # 80007470 <CONSOLE_STATUS+0x460>
    80004b40:	00000097          	auipc	ra,0x0
    80004b44:	018080e7          	jalr	24(ra) # 80004b58 <__printf>
    80004b48:	00100793          	li	a5,1
    80004b4c:	00003717          	auipc	a4,0x3
    80004b50:	4af72e23          	sw	a5,1212(a4) # 80008008 <panicked>
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
    80004b94:	00004317          	auipc	t1,0x4
    80004b98:	6ec30313          	addi	t1,t1,1772 # 80009280 <pr>
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
    80004c58:	864d8d93          	addi	s11,s11,-1948 # 800074b8 <digits>
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
    80004e60:	65cd8d93          	addi	s11,s11,1628 # 800074b8 <digits>
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
    80004fa8:	2dc50513          	addi	a0,a0,732 # 80009280 <pr>
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
    80004fe8:	4d4d8d93          	addi	s11,s11,1236 # 800074b8 <digits>
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
    8000508c:	430d8d93          	addi	s11,s11,1072 # 800074b8 <digits>
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
    800050e4:	3d8d8d93          	addi	s11,s11,984 # 800074b8 <digits>
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
    80005130:	36cc8c93          	addi	s9,s9,876 # 80007498 <CONSOLE_STATUS+0x488>
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
    800051e0:	2c450513          	addi	a0,a0,708 # 800074a0 <CONSOLE_STATUS+0x490>
    800051e4:	00000097          	auipc	ra,0x0
    800051e8:	918080e7          	jalr	-1768(ra) # 80004afc <panic>

00000000800051ec <printfinit>:
    800051ec:	fe010113          	addi	sp,sp,-32
    800051f0:	00813823          	sd	s0,16(sp)
    800051f4:	00913423          	sd	s1,8(sp)
    800051f8:	00113c23          	sd	ra,24(sp)
    800051fc:	02010413          	addi	s0,sp,32
    80005200:	00004497          	auipc	s1,0x4
    80005204:	08048493          	addi	s1,s1,128 # 80009280 <pr>
    80005208:	00048513          	mv	a0,s1
    8000520c:	00002597          	auipc	a1,0x2
    80005210:	2a458593          	addi	a1,a1,676 # 800074b0 <CONSOLE_STATUS+0x4a0>
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
    8000527c:	d907a783          	lw	a5,-624(a5) # 80008008 <panicked>
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
    800052a8:	d6c90913          	addi	s2,s2,-660 # 80008010 <uart_tx_r>
    800052ac:	00093783          	ld	a5,0(s2)
    800052b0:	00003497          	auipc	s1,0x3
    800052b4:	d6848493          	addi	s1,s1,-664 # 80008018 <uart_tx_w>
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
    80005304:	fa058593          	addi	a1,a1,-96 # 800092a0 <uart_tx_buf>
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
    80005380:	c8c72703          	lw	a4,-884(a4) # 80008008 <panicked>
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
    800053c4:	c5060613          	addi	a2,a2,-944 # 80008010 <uart_tx_r>
    800053c8:	00003517          	auipc	a0,0x3
    800053cc:	c5050513          	addi	a0,a0,-944 # 80008018 <uart_tx_w>
    800053d0:	00063783          	ld	a5,0(a2)
    800053d4:	00053703          	ld	a4,0(a0)
    800053d8:	04f70263          	beq	a4,a5,8000541c <uartstart+0x68>
    800053dc:	100005b7          	lui	a1,0x10000
    800053e0:	00004817          	auipc	a6,0x4
    800053e4:	ec080813          	addi	a6,a6,-320 # 800092a0 <uart_tx_buf>
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
    800054a8:	b6c60613          	addi	a2,a2,-1172 # 80008010 <uart_tx_r>
    800054ac:	00003517          	auipc	a0,0x3
    800054b0:	b6c50513          	addi	a0,a0,-1172 # 80008018 <uart_tx_w>
    800054b4:	00063783          	ld	a5,0(a2)
    800054b8:	00053703          	ld	a4,0(a0)
    800054bc:	04f70263          	beq	a4,a5,80005500 <uartintr+0xa0>
    800054c0:	100005b7          	lui	a1,0x10000
    800054c4:	00004817          	auipc	a6,0x4
    800054c8:	ddc80813          	addi	a6,a6,-548 # 800092a0 <uart_tx_buf>
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
    80005518:	afc60613          	addi	a2,a2,-1284 # 80008010 <uart_tx_r>
    8000551c:	00003517          	auipc	a0,0x3
    80005520:	afc50513          	addi	a0,a0,-1284 # 80008018 <uart_tx_w>
    80005524:	00063783          	ld	a5,0(a2)
    80005528:	00053703          	ld	a4,0(a0)
    8000552c:	04f70263          	beq	a4,a5,80005570 <uartintr+0x110>
    80005530:	100005b7          	lui	a1,0x10000
    80005534:	00004817          	auipc	a6,0x4
    80005538:	d6c80813          	addi	a6,a6,-660 # 800092a0 <uart_tx_buf>
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
    80005588:	d3b48493          	addi	s1,s1,-709 # 8000a2bf <end+0xfff>
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
    800055c4:	d00a8a93          	addi	s5,s5,-768 # 800092c0 <end>
    800055c8:	0754ec63          	bltu	s1,s5,80005640 <kinit+0xc8>
    800055cc:	0734fa63          	bgeu	s1,s3,80005640 <kinit+0xc8>
    800055d0:	00088a37          	lui	s4,0x88
    800055d4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800055d8:	00003917          	auipc	s2,0x3
    800055dc:	a4890913          	addi	s2,s2,-1464 # 80008020 <kmem>
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
    80005644:	e9050513          	addi	a0,a0,-368 # 800074d0 <digits+0x18>
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
    80005698:	c2ca8a93          	addi	s5,s5,-980 # 800092c0 <end>
    8000569c:	0954e263          	bltu	s1,s5,80005720 <freerange+0xd0>
    800056a0:	01100993          	li	s3,17
    800056a4:	01b99993          	slli	s3,s3,0x1b
    800056a8:	0734fc63          	bgeu	s1,s3,80005720 <freerange+0xd0>
    800056ac:	00058a13          	mv	s4,a1
    800056b0:	00003917          	auipc	s2,0x3
    800056b4:	97090913          	addi	s2,s2,-1680 # 80008020 <kmem>
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
    80005724:	db050513          	addi	a0,a0,-592 # 800074d0 <digits+0x18>
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
    80005750:	b7478793          	addi	a5,a5,-1164 # 800092c0 <end>
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
    8000577c:	8a878793          	addi	a5,a5,-1880 # 80008020 <kmem>
    80005780:	0007b703          	ld	a4,0(a5)
    80005784:	01813083          	ld	ra,24(sp)
    80005788:	01013403          	ld	s0,16(sp)
    8000578c:	00e4b023          	sd	a4,0(s1)
    80005790:	0097b023          	sd	s1,0(a5)
    80005794:	00813483          	ld	s1,8(sp)
    80005798:	02010113          	addi	sp,sp,32
    8000579c:	00008067          	ret
    800057a0:	00002517          	auipc	a0,0x2
    800057a4:	d3050513          	addi	a0,a0,-720 # 800074d0 <digits+0x18>
    800057a8:	fffff097          	auipc	ra,0xfffff
    800057ac:	354080e7          	jalr	852(ra) # 80004afc <panic>

00000000800057b0 <kalloc>:
    800057b0:	fe010113          	addi	sp,sp,-32
    800057b4:	00813823          	sd	s0,16(sp)
    800057b8:	00913423          	sd	s1,8(sp)
    800057bc:	00113c23          	sd	ra,24(sp)
    800057c0:	02010413          	addi	s0,sp,32
    800057c4:	00003797          	auipc	a5,0x3
    800057c8:	85c78793          	addi	a5,a5,-1956 # 80008020 <kmem>
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
    8000585c:	8e8080e7          	jalr	-1816(ra) # 80004140 <mycpu>
    80005860:	07852783          	lw	a5,120(a0)
    80005864:	06078e63          	beqz	a5,800058e0 <acquire+0xb4>
    80005868:	fffff097          	auipc	ra,0xfffff
    8000586c:	8d8080e7          	jalr	-1832(ra) # 80004140 <mycpu>
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
    800058a0:	8a4080e7          	jalr	-1884(ra) # 80004140 <mycpu>
    800058a4:	01813083          	ld	ra,24(sp)
    800058a8:	01013403          	ld	s0,16(sp)
    800058ac:	00a4b823          	sd	a0,16(s1)
    800058b0:	00013903          	ld	s2,0(sp)
    800058b4:	00813483          	ld	s1,8(sp)
    800058b8:	02010113          	addi	sp,sp,32
    800058bc:	00008067          	ret
    800058c0:	0104b903          	ld	s2,16(s1)
    800058c4:	fffff097          	auipc	ra,0xfffff
    800058c8:	87c080e7          	jalr	-1924(ra) # 80004140 <mycpu>
    800058cc:	faa91ce3          	bne	s2,a0,80005884 <acquire+0x58>
    800058d0:	00002517          	auipc	a0,0x2
    800058d4:	c0850513          	addi	a0,a0,-1016 # 800074d8 <digits+0x20>
    800058d8:	fffff097          	auipc	ra,0xfffff
    800058dc:	224080e7          	jalr	548(ra) # 80004afc <panic>
    800058e0:	00195913          	srli	s2,s2,0x1
    800058e4:	fffff097          	auipc	ra,0xfffff
    800058e8:	85c080e7          	jalr	-1956(ra) # 80004140 <mycpu>
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
    8000591c:	bc850513          	addi	a0,a0,-1080 # 800074e0 <digits+0x28>
    80005920:	fffff097          	auipc	ra,0xfffff
    80005924:	1dc080e7          	jalr	476(ra) # 80004afc <panic>
    80005928:	01053903          	ld	s2,16(a0)
    8000592c:	00050493          	mv	s1,a0
    80005930:	fffff097          	auipc	ra,0xfffff
    80005934:	810080e7          	jalr	-2032(ra) # 80004140 <mycpu>
    80005938:	fea910e3          	bne	s2,a0,80005918 <release+0x20>
    8000593c:	0004b823          	sd	zero,16(s1)
    80005940:	0ff0000f          	fence
    80005944:	0f50000f          	fence	iorw,ow
    80005948:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000594c:	ffffe097          	auipc	ra,0xffffe
    80005950:	7f4080e7          	jalr	2036(ra) # 80004140 <mycpu>
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
    800059a4:	b6050513          	addi	a0,a0,-1184 # 80007500 <digits+0x48>
    800059a8:	fffff097          	auipc	ra,0xfffff
    800059ac:	154080e7          	jalr	340(ra) # 80004afc <panic>
    800059b0:	00002517          	auipc	a0,0x2
    800059b4:	b3850513          	addi	a0,a0,-1224 # 800074e8 <digits+0x30>
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
    800059ec:	758080e7          	jalr	1880(ra) # 80004140 <mycpu>
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
    80005a34:	710080e7          	jalr	1808(ra) # 80004140 <mycpu>
    80005a38:	07852783          	lw	a5,120(a0)
    80005a3c:	02078663          	beqz	a5,80005a68 <push_off+0x5c>
    80005a40:	ffffe097          	auipc	ra,0xffffe
    80005a44:	700080e7          	jalr	1792(ra) # 80004140 <mycpu>
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
    80005a70:	6d4080e7          	jalr	1748(ra) # 80004140 <mycpu>
    80005a74:	0014f493          	andi	s1,s1,1
    80005a78:	06952e23          	sw	s1,124(a0)
    80005a7c:	fc5ff06f          	j	80005a40 <push_off+0x34>

0000000080005a80 <pop_off>:
    80005a80:	ff010113          	addi	sp,sp,-16
    80005a84:	00813023          	sd	s0,0(sp)
    80005a88:	00113423          	sd	ra,8(sp)
    80005a8c:	01010413          	addi	s0,sp,16
    80005a90:	ffffe097          	auipc	ra,0xffffe
    80005a94:	6b0080e7          	jalr	1712(ra) # 80004140 <mycpu>
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
    80005ae0:	a2450513          	addi	a0,a0,-1500 # 80007500 <digits+0x48>
    80005ae4:	fffff097          	auipc	ra,0xfffff
    80005ae8:	018080e7          	jalr	24(ra) # 80004afc <panic>
    80005aec:	00002517          	auipc	a0,0x2
    80005af0:	9fc50513          	addi	a0,a0,-1540 # 800074e8 <digits+0x30>
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
    80005b24:	620080e7          	jalr	1568(ra) # 80004140 <mycpu>
    80005b28:	07852783          	lw	a5,120(a0)
    80005b2c:	02078663          	beqz	a5,80005b58 <push_on+0x5c>
    80005b30:	ffffe097          	auipc	ra,0xffffe
    80005b34:	610080e7          	jalr	1552(ra) # 80004140 <mycpu>
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
    80005b60:	5e4080e7          	jalr	1508(ra) # 80004140 <mycpu>
    80005b64:	0014f493          	andi	s1,s1,1
    80005b68:	06952e23          	sw	s1,124(a0)
    80005b6c:	fc5ff06f          	j	80005b30 <push_on+0x34>

0000000080005b70 <pop_on>:
    80005b70:	ff010113          	addi	sp,sp,-16
    80005b74:	00813023          	sd	s0,0(sp)
    80005b78:	00113423          	sd	ra,8(sp)
    80005b7c:	01010413          	addi	s0,sp,16
    80005b80:	ffffe097          	auipc	ra,0xffffe
    80005b84:	5c0080e7          	jalr	1472(ra) # 80004140 <mycpu>
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
    80005bcc:	96050513          	addi	a0,a0,-1696 # 80007528 <digits+0x70>
    80005bd0:	fffff097          	auipc	ra,0xfffff
    80005bd4:	f2c080e7          	jalr	-212(ra) # 80004afc <panic>
    80005bd8:	00002517          	auipc	a0,0x2
    80005bdc:	93050513          	addi	a0,a0,-1744 # 80007508 <digits+0x50>
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
    80006058:	3dc50513          	addi	a0,a0,988 # 80007430 <CONSOLE_STATUS+0x420>
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
    80006090:	4a450513          	addi	a0,a0,1188 # 80007530 <digits+0x78>
    80006094:	fffff097          	auipc	ra,0xfffff
    80006098:	a68080e7          	jalr	-1432(ra) # 80004afc <panic>
	...
