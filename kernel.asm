
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00008117          	auipc	sp,0x8
    80000004:	fb813103          	ld	sp,-72(sp) # 80007fb8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	615030ef          	jal	ra,80003e30 <start>

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
    8000107c:	388020ef          	jal	ra,80003404 <exceptionHandler>


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
    8000111c:	f087b783          	ld	a5,-248(a5) # 80008020 <_ZN5Timer8instanceE>
    80001120:	02079463          	bnez	a5,80001148 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80001124:	00007797          	auipc	a5,0x7
    80001128:	ee97be23          	sd	s1,-260(a5) # 80008020 <_ZN5Timer8instanceE>
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
    80001168:	810080e7          	jalr	-2032(ra) # 80001974 <_Z13assert_failedPKcS0_jS0_>
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
    80001194:	2b0080e7          	jalr	688(ra) # 80001440 <_Z8mem_freePv>
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
    800011bc:	e687b783          	ld	a5,-408(a5) # 80008020 <_ZN5Timer8instanceE>
    800011c0:	00078863          	beqz	a5,800011d0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800011c4:	00007517          	auipc	a0,0x7
    800011c8:	e5c53503          	ld	a0,-420(a0) # 80008020 <_ZN5Timer8instanceE>
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
    80001200:	778080e7          	jalr	1912(ra) # 80001974 <_Z13assert_failedPKcS0_jS0_>
}
    80001204:	00007517          	auipc	a0,0x7
    80001208:	e1c53503          	ld	a0,-484(a0) # 80008020 <_ZN5Timer8instanceE>
    8000120c:	00813083          	ld	ra,8(sp)
    80001210:	00013403          	ld	s0,0(sp)
    80001214:	01010113          	addi	sp,sp,16
    80001218:	00008067          	ret

000000008000121c <_ZN5Timer4tickEv>:

void Timer::tick(){
    8000121c:	fe010113          	addi	sp,sp,-32
    80001220:	00113c23          	sd	ra,24(sp)
    80001224:	00813823          	sd	s0,16(sp)
    80001228:	00913423          	sd	s1,8(sp)
    8000122c:	01213023          	sd	s2,0(sp)
    80001230:	02010413          	addi	s0,sp,32
    80001234:	00050913          	mv	s2,a0
    time += 1;
    80001238:	00853783          	ld	a5,8(a0)
    8000123c:	00178793          	addi	a5,a5,1
    80001240:	00f53423          	sd	a5,8(a0)
    if(time % 10 == 0){
    80001244:	00a00713          	li	a4,10
    80001248:	02e7f7b3          	remu	a5,a5,a4
    8000124c:	00078663          	beqz	a5,80001258 <_ZN5Timer4tickEv+0x3c>
        __putc('i');
        __putc('c');
        __putc('k');
        __putc('\n');
    }
    threadSleepWrapper* current = sleepingHead;
    80001250:	00093483          	ld	s1,0(s2)
    80001254:	0580006f          	j	800012ac <_ZN5Timer4tickEv+0x90>
        __putc('\n');
    80001258:	00a00513          	li	a0,10
    8000125c:	00005097          	auipc	ra,0x5
    80001260:	c90080e7          	jalr	-880(ra) # 80005eec <__putc>
        __putc('t');
    80001264:	07400513          	li	a0,116
    80001268:	00005097          	auipc	ra,0x5
    8000126c:	c84080e7          	jalr	-892(ra) # 80005eec <__putc>
        __putc('i');
    80001270:	06900513          	li	a0,105
    80001274:	00005097          	auipc	ra,0x5
    80001278:	c78080e7          	jalr	-904(ra) # 80005eec <__putc>
        __putc('c');
    8000127c:	06300513          	li	a0,99
    80001280:	00005097          	auipc	ra,0x5
    80001284:	c6c080e7          	jalr	-916(ra) # 80005eec <__putc>
        __putc('k');
    80001288:	06b00513          	li	a0,107
    8000128c:	00005097          	auipc	ra,0x5
    80001290:	c60080e7          	jalr	-928(ra) # 80005eec <__putc>
        __putc('\n');
    80001294:	00a00513          	li	a0,10
    80001298:	00005097          	auipc	ra,0x5
    8000129c:	c54080e7          	jalr	-940(ra) # 80005eec <__putc>
    800012a0:	fb1ff06f          	j	80001250 <_ZN5Timer4tickEv+0x34>
            __putc('\n');
            current->thread->setSleeping(false);
            Scheduler::put(current->thread);
            threadSleepWrapper* next = current->next;
            if(current == sleepingHead){
                sleepingHead = next;
    800012a4:	00f93023          	sd	a5,0(s2)
void Timer::tick(){
    800012a8:	00078493          	mv	s1,a5
    while(current != 0){
    800012ac:	06048c63          	beqz	s1,80001324 <_ZN5Timer4tickEv+0x108>
        if(current->wakeUpTime <= time){
    800012b0:	0084b703          	ld	a4,8(s1)
    800012b4:	00893783          	ld	a5,8(s2)
    800012b8:	06e7e663          	bltu	a5,a4,80001324 <_ZN5Timer4tickEv+0x108>
            __putc('\n');
    800012bc:	00a00513          	li	a0,10
    800012c0:	00005097          	auipc	ra,0x5
    800012c4:	c2c080e7          	jalr	-980(ra) # 80005eec <__putc>
            __putc('t');
    800012c8:	07400513          	li	a0,116
    800012cc:	00005097          	auipc	ra,0x5
    800012d0:	c20080e7          	jalr	-992(ra) # 80005eec <__putc>
            __putc('0' + current->thread->ID);
    800012d4:	0004b783          	ld	a5,0(s1)
    800012d8:	0007a503          	lw	a0,0(a5)
    800012dc:	0305051b          	addiw	a0,a0,48
    800012e0:	0ff57513          	andi	a0,a0,255
    800012e4:	00005097          	auipc	ra,0x5
    800012e8:	c08080e7          	jalr	-1016(ra) # 80005eec <__putc>
            __putc('\n');
    800012ec:	00a00513          	li	a0,10
    800012f0:	00005097          	auipc	ra,0x5
    800012f4:	bfc080e7          	jalr	-1028(ra) # 80005eec <__putc>
            current->thread->setSleeping(false);
    800012f8:	00000593          	li	a1,0
    800012fc:	0004b503          	ld	a0,0(s1)
    80001300:	00001097          	auipc	ra,0x1
    80001304:	3a8080e7          	jalr	936(ra) # 800026a8 <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    80001308:	0004b503          	ld	a0,0(s1)
    8000130c:	00002097          	auipc	ra,0x2
    80001310:	7ac080e7          	jalr	1964(ra) # 80003ab8 <_ZN9Scheduler3putEP7_thread>
            threadSleepWrapper* next = current->next;
    80001314:	0104b783          	ld	a5,16(s1)
            if(current == sleepingHead){
    80001318:	00093703          	ld	a4,0(s2)
    8000131c:	f89716e3          	bne	a4,s1,800012a8 <_ZN5Timer4tickEv+0x8c>
    80001320:	f85ff06f          	j	800012a4 <_ZN5Timer4tickEv+0x88>
            current = next;
        }else{
            break;
        }
    }
}
    80001324:	01813083          	ld	ra,24(sp)
    80001328:	01013403          	ld	s0,16(sp)
    8000132c:	00813483          	ld	s1,8(sp)
    80001330:	00013903          	ld	s2,0(sp)
    80001334:	02010113          	addi	sp,sp,32
    80001338:	00008067          	ret

000000008000133c <_ZN5Timer5sleepEm>:

int Timer::sleep(time_t timeToSleep){
    8000133c:	fd010113          	addi	sp,sp,-48
    80001340:	02113423          	sd	ra,40(sp)
    80001344:	02813023          	sd	s0,32(sp)
    80001348:	00913c23          	sd	s1,24(sp)
    8000134c:	01213823          	sd	s2,16(sp)
    80001350:	01313423          	sd	s3,8(sp)
    80001354:	03010413          	addi	s0,sp,48
    80001358:	00050493          	mv	s1,a0
    8000135c:	00058913          	mv	s2,a1
    thread_t thread = _thread::currentThread;
    80001360:	00007797          	auipc	a5,0x7
    80001364:	c707b783          	ld	a5,-912(a5) # 80007fd0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001368:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)mem_alloc(sizeof(threadSleepWrapper));
    8000136c:	01800513          	li	a0,24
    80001370:	00000097          	auipc	ra,0x0
    80001374:	0a0080e7          	jalr	160(ra) # 80001410 <_Z9mem_allocm>
    newSleepingThread->thread = thread;
    80001378:	01353023          	sd	s3,0(a0)
    newSleepingThread->wakeUpTime = time + timeToSleep;
    8000137c:	0084b783          	ld	a5,8(s1)
    80001380:	012785b3          	add	a1,a5,s2
    80001384:	00b53423          	sd	a1,8(a0)
    newSleepingThread->next = 0;
    80001388:	00053823          	sd	zero,16(a0)

    if(sleepingHead == 0){
    8000138c:	0004b783          	ld	a5,0(s1)
    80001390:	04078c63          	beqz	a5,800013e8 <_ZN5Timer5sleepEm+0xac>
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
    80001394:	00078693          	mv	a3,a5
    80001398:	0107b783          	ld	a5,16(a5)
    8000139c:	00078663          	beqz	a5,800013a8 <_ZN5Timer5sleepEm+0x6c>
    800013a0:	0087b703          	ld	a4,8(a5)
    800013a4:	feb768e3          	bltu	a4,a1,80001394 <_ZN5Timer5sleepEm+0x58>
            current = current->next;
        }
        newSleepingThread->next = current->next;
    800013a8:	00f53823          	sd	a5,16(a0)
        current->next = newSleepingThread;
    800013ac:	00a6b823          	sd	a0,16(a3)
    }
    thread->setSleeping(true);
    800013b0:	00100593          	li	a1,1
    800013b4:	00098513          	mv	a0,s3
    800013b8:	00001097          	auipc	ra,0x1
    800013bc:	2f0080e7          	jalr	752(ra) # 800026a8 <_ZN7_thread11setSleepingEb>
    thread_dispatch();
    800013c0:	00000097          	auipc	ra,0x0
    800013c4:	148080e7          	jalr	328(ra) # 80001508 <_Z15thread_dispatchv>
    return 0;
}
    800013c8:	00000513          	li	a0,0
    800013cc:	02813083          	ld	ra,40(sp)
    800013d0:	02013403          	ld	s0,32(sp)
    800013d4:	01813483          	ld	s1,24(sp)
    800013d8:	01013903          	ld	s2,16(sp)
    800013dc:	00813983          	ld	s3,8(sp)
    800013e0:	03010113          	addi	sp,sp,48
    800013e4:	00008067          	ret
        sleepingHead = newSleepingThread;
    800013e8:	00a4b023          	sd	a0,0(s1)
    800013ec:	fc5ff06f          	j	800013b0 <_ZN5Timer5sleepEm+0x74>

00000000800013f0 <_ZN5Timer17noSleepingThreadsEv>:

bool Timer::noSleepingThreads(){
    800013f0:	ff010113          	addi	sp,sp,-16
    800013f4:	00813423          	sd	s0,8(sp)
    800013f8:	01010413          	addi	s0,sp,16
    return sleepingHead == 0;
    800013fc:	00053503          	ld	a0,0(a0)
    80001400:	00153513          	seqz	a0,a0
    80001404:	00813403          	ld	s0,8(sp)
    80001408:	01010113          	addi	sp,sp,16
    8000140c:	00008067          	ret

0000000080001410 <_Z9mem_allocm>:
 */

#include "syscalls_c.h"
#include "console.h"

void* mem_alloc ( size_t nSize ){
    80001410:	ff010113          	addi	sp,sp,-16
    80001414:	00813423          	sd	s0,8(sp)
    80001418:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    8000141c:	03f50513          	addi	a0,a0,63
    80001420:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    80001424:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    80001428:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    8000142c:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    80001430:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    80001434:	00813403          	ld	s0,8(sp)
    80001438:	01010113          	addi	sp,sp,16
    8000143c:	00008067          	ret

0000000080001440 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    80001440:	ff010113          	addi	sp,sp,-16
    80001444:	00813423          	sd	s0,8(sp)
    80001448:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    8000144c:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    80001450:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    80001454:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    80001458:	00050513          	mv	a0,a0
    return nResult;

}
    8000145c:	0005051b          	sext.w	a0,a0
    80001460:	00813403          	ld	s0,8(sp)
    80001464:	01010113          	addi	sp,sp,16
    80001468:	00008067          	ret

000000008000146c <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg ) {
    8000146c:	fd010113          	addi	sp,sp,-48
    80001470:	02113423          	sd	ra,40(sp)
    80001474:	02813023          	sd	s0,32(sp)
    80001478:	00913c23          	sd	s1,24(sp)
    8000147c:	01213823          	sd	s2,16(sp)
    80001480:	01313423          	sd	s3,8(sp)
    80001484:	03010413          	addi	s0,sp,48
    80001488:	00050493          	mv	s1,a0
    8000148c:	00058913          	mv	s2,a1
    80001490:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80001494:	00001537          	lui	a0,0x1
    80001498:	00000097          	auipc	ra,0x0
    8000149c:	f78080e7          	jalr	-136(ra) # 80001410 <_Z9mem_allocm>
    /// now we move the pointer up, since SP points to the first free location, and grows down
    __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space + DEFAULT_STACK_SIZE));
    800014a0:	000017b7          	lui	a5,0x1
    800014a4:	00f50533          	add	a0,a0,a5
    800014a8:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    800014ac:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    800014b0:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    800014b4:	00048593          	mv	a1,s1
    __asm__ volatile("li a0,0x11");
    800014b8:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    800014bc:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800014c0:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800014c4:	0005051b          	sext.w	a0,a0
    800014c8:	02813083          	ld	ra,40(sp)
    800014cc:	02013403          	ld	s0,32(sp)
    800014d0:	01813483          	ld	s1,24(sp)
    800014d4:	01013903          	ld	s2,16(sp)
    800014d8:	00813983          	ld	s3,8(sp)
    800014dc:	03010113          	addi	sp,sp,48
    800014e0:	00008067          	ret

00000000800014e4 <_Z11thread_exitv>:

// int thread_createCPP ( thread_t*, void(*)(void*), void* );

int thread_exit (){
    800014e4:	ff010113          	addi	sp,sp,-16
    800014e8:	00813423          	sd	s0,8(sp)
    800014ec:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    800014f0:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    800014f4:	00000073          	ecall
    return 0;
}
    800014f8:	00000513          	li	a0,0
    800014fc:	00813403          	ld	s0,8(sp)
    80001500:	01010113          	addi	sp,sp,16
    80001504:	00008067          	ret

0000000080001508 <_Z15thread_dispatchv>:

void thread_dispatch () {
    80001508:	ff010113          	addi	sp,sp,-16
    8000150c:	00813423          	sd	s0,8(sp)
    80001510:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    80001514:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    80001518:	00000073          	ecall
}
    8000151c:	00813403          	ld	s0,8(sp)
    80001520:	01010113          	addi	sp,sp,16
    80001524:	00008067          	ret

0000000080001528 <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    80001528:	ff010113          	addi	sp,sp,-16
    8000152c:	00813423          	sd	s0,8(sp)
    80001530:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    80001534:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    80001538:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    8000153c:	00000073          	ecall
}
    80001540:	00813403          	ld	s0,8(sp)
    80001544:	01010113          	addi	sp,sp,16
    80001548:	00008067          	ret

000000008000154c <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    8000154c:	ff010113          	addi	sp,sp,-16
    80001550:	00813423          	sd	s0,8(sp)
    80001554:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    80001558:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    8000155c:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001560:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001564:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001568:	0005051b          	sext.w	a0,a0
    8000156c:	00813403          	ld	s0,8(sp)
    80001570:	01010113          	addi	sp,sp,16
    80001574:	00008067          	ret

0000000080001578 <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    80001578:	ff010113          	addi	sp,sp,-16
    8000157c:	00813423          	sd	s0,8(sp)
    80001580:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    80001584:	02059593          	slli	a1,a1,0x20
    80001588:	0205d593          	srli	a1,a1,0x20
    8000158c:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    80001590:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    80001594:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    80001598:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    8000159c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800015a0:	0005051b          	sext.w	a0,a0
    800015a4:	00813403          	ld	s0,8(sp)
    800015a8:	01010113          	addi	sp,sp,16
    800015ac:	00008067          	ret

00000000800015b0 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    800015b0:	ff010113          	addi	sp,sp,-16
    800015b4:	00813423          	sd	s0,8(sp)
    800015b8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800015bc:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    800015c0:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    800015c4:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800015c8:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800015cc:	0005051b          	sext.w	a0,a0
    800015d0:	00813403          	ld	s0,8(sp)
    800015d4:	01010113          	addi	sp,sp,16
    800015d8:	00008067          	ret

00000000800015dc <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    800015dc:	ff010113          	addi	sp,sp,-16
    800015e0:	00813423          	sd	s0,8(sp)
    800015e4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800015e8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    800015ec:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    800015f0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800015f4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800015f8:	0005051b          	sext.w	a0,a0
    800015fc:	00813403          	ld	s0,8(sp)
    80001600:	01010113          	addi	sp,sp,16
    80001604:	00008067          	ret

0000000080001608 <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    80001608:	ff010113          	addi	sp,sp,-16
    8000160c:	00813423          	sd	s0,8(sp)
    80001610:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001614:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    80001618:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    8000161c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001620:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001624:	0005051b          	sext.w	a0,a0
    80001628:	00813403          	ld	s0,8(sp)
    8000162c:	01010113          	addi	sp,sp,16
    80001630:	00008067          	ret

0000000080001634 <_Z4getcv>:

char getc() {
    80001634:	ff010113          	addi	sp,sp,-16
    80001638:	00813423          	sd	s0,8(sp)
    8000163c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    80001640:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    80001644:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    80001648:	00050513          	mv	a0,a0
    return chr;
}
    8000164c:	0ff57513          	andi	a0,a0,255
    80001650:	00813403          	ld	s0,8(sp)
    80001654:	01010113          	addi	sp,sp,16
    80001658:	00008067          	ret

000000008000165c <_Z4putcc>:

#include "console.h"

void putc(char chr ) {
    8000165c:	ff010113          	addi	sp,sp,-16
    80001660:	00813423          	sd	s0,8(sp)
    80001664:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    80001668:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    8000166c:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80001670:	00000073          	ecall
    80001674:	00813403          	ld	s0,8(sp)
    80001678:	01010113          	addi	sp,sp,16
    8000167c:	00008067          	ret

0000000080001680 <_ZN4_sem4openEPPS_j>:
#include "syscalls_c.h"
#include "assert.h"
#include "sched.h"
#include "console.h"

void _sem::open(_sem** handle, unsigned init){
    80001680:	fe010113          	addi	sp,sp,-32
    80001684:	00113c23          	sd	ra,24(sp)
    80001688:	00813823          	sd	s0,16(sp)
    8000168c:	00913423          	sd	s1,8(sp)
    80001690:	01213023          	sd	s2,0(sp)
    80001694:	02010413          	addi	s0,sp,32
    80001698:	00050493          	mv	s1,a0
    8000169c:	00058913          	mv	s2,a1
    (*handle) = (sem_t)mem_alloc(sizeof(_sem));
    800016a0:	01800513          	li	a0,24
    800016a4:	00000097          	auipc	ra,0x0
    800016a8:	d6c080e7          	jalr	-660(ra) # 80001410 <_Z9mem_allocm>
    800016ac:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    800016b0:	00053023          	sd	zero,0(a0) # 1000 <_entry-0x7ffff000>
    (*handle)->blockTail = 0;
    800016b4:	0004b783          	ld	a5,0(s1)
    800016b8:	0007b423          	sd	zero,8(a5) # 1008 <_entry-0x7fffeff8>
    (*handle)->value = init;
    800016bc:	0004b783          	ld	a5,0(s1)
    800016c0:	0127a823          	sw	s2,16(a5)
}
    800016c4:	01813083          	ld	ra,24(sp)
    800016c8:	01013403          	ld	s0,16(sp)
    800016cc:	00813483          	ld	s1,8(sp)
    800016d0:	00013903          	ld	s2,0(sp)
    800016d4:	02010113          	addi	sp,sp,32
    800016d8:	00008067          	ret

00000000800016dc <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    800016dc:	fe010113          	addi	sp,sp,-32
    800016e0:	00113c23          	sd	ra,24(sp)
    800016e4:	00813823          	sd	s0,16(sp)
    800016e8:	00913423          	sd	s1,8(sp)
    800016ec:	02010413          	addi	s0,sp,32
    800016f0:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    800016f4:	0004b783          	ld	a5,0(s1)
    800016f8:	02078863          	beqz	a5,80001728 <_ZN4_sem5closeEPS_+0x4c>
        id->blockHead->pThread->setClosed(true);
    800016fc:	00100593          	li	a1,1
    80001700:	0007b503          	ld	a0,0(a5)
    80001704:	00001097          	auipc	ra,0x1
    80001708:	f78080e7          	jalr	-136(ra) # 8000267c <_ZN7_thread9setClosedEb>
        mem_free(id->blockHead);
    8000170c:	0004b503          	ld	a0,0(s1)
    80001710:	00000097          	auipc	ra,0x0
    80001714:	d30080e7          	jalr	-720(ra) # 80001440 <_Z8mem_freePv>
        id->blockHead = id->blockHead->pNext;
    80001718:	0004b783          	ld	a5,0(s1)
    8000171c:	0087b783          	ld	a5,8(a5)
    80001720:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    80001724:	fd1ff06f          	j	800016f4 <_ZN4_sem5closeEPS_+0x18>
    }
}
    80001728:	01813083          	ld	ra,24(sp)
    8000172c:	01013403          	ld	s0,16(sp)
    80001730:	00813483          	ld	s1,8(sp)
    80001734:	02010113          	addi	sp,sp,32
    80001738:	00008067          	ret

000000008000173c <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    8000173c:	01052783          	lw	a5,16(a0)
    80001740:	fff7879b          	addiw	a5,a5,-1
    80001744:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    80001748:	02079713          	slli	a4,a5,0x20
    8000174c:	00074463          	bltz	a4,80001754 <_ZN4_sem4waitEPS_+0x18>
    80001750:	00008067          	ret
void _sem::wait(sem_t id){
    80001754:	fe010113          	addi	sp,sp,-32
    80001758:	00113c23          	sd	ra,24(sp)
    8000175c:	00813823          	sd	s0,16(sp)
    80001760:	00913423          	sd	s1,8(sp)
    80001764:	02010413          	addi	s0,sp,32
    80001768:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    8000176c:	01000513          	li	a0,16
    80001770:	00000097          	auipc	ra,0x0
    80001774:	ca0080e7          	jalr	-864(ra) # 80001410 <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    80001778:	00007797          	auipc	a5,0x7
    8000177c:	8587b783          	ld	a5,-1960(a5) # 80007fd0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001780:	0007b783          	ld	a5,0(a5)
    80001784:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    80001788:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    8000178c:	0004b783          	ld	a5,0(s1)
    80001790:	04078863          	beqz	a5,800017e0 <_ZN4_sem4waitEPS_+0xa4>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    80001794:	0084b783          	ld	a5,8(s1)
    80001798:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    8000179c:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    800017a0:	00100593          	li	a1,1
    800017a4:	00007797          	auipc	a5,0x7
    800017a8:	82c7b783          	ld	a5,-2004(a5) # 80007fd0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800017ac:	0007b503          	ld	a0,0(a5)
    800017b0:	00001097          	auipc	ra,0x1
    800017b4:	e9c080e7          	jalr	-356(ra) # 8000264c <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    800017b8:	00001097          	auipc	ra,0x1
    800017bc:	fc4080e7          	jalr	-60(ra) # 8000277c <_ZN7_thread8dispatchEv>
        __putc('w');
    800017c0:	07700513          	li	a0,119
    800017c4:	00004097          	auipc	ra,0x4
    800017c8:	728080e7          	jalr	1832(ra) # 80005eec <__putc>
    }
}
    800017cc:	01813083          	ld	ra,24(sp)
    800017d0:	01013403          	ld	s0,16(sp)
    800017d4:	00813483          	ld	s1,8(sp)
    800017d8:	02010113          	addi	sp,sp,32
    800017dc:	00008067          	ret
            id->blockHead = pNewBlock;
    800017e0:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    800017e4:	00a4b423          	sd	a0,8(s1)
    800017e8:	fb9ff06f          	j	800017a0 <_ZN4_sem4waitEPS_+0x64>

00000000800017ec <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    800017ec:	01052783          	lw	a5,16(a0)
    800017f0:	0017879b          	addiw	a5,a5,1
    800017f4:	0007871b          	sext.w	a4,a5
    800017f8:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    800017fc:	00e05463          	blez	a4,80001804 <_ZN4_sem6signalEPS_+0x18>
    80001800:	00008067          	ret
void _sem::signal(sem_t id){
    80001804:	fe010113          	addi	sp,sp,-32
    80001808:	00113c23          	sd	ra,24(sp)
    8000180c:	00813823          	sd	s0,16(sp)
    80001810:	00913423          	sd	s1,8(sp)
    80001814:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    80001818:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    8000181c:	0084b783          	ld	a5,8(s1)
    80001820:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    80001824:	08078663          	beqz	a5,800018b0 <_ZN4_sem6signalEPS_+0xc4>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    80001828:	00000593          	li	a1,0
    8000182c:	0004b503          	ld	a0,0(s1)
    80001830:	00001097          	auipc	ra,0x1
    80001834:	e1c080e7          	jalr	-484(ra) # 8000264c <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    80001838:	00048513          	mv	a0,s1
    8000183c:	00000097          	auipc	ra,0x0
    80001840:	c04080e7          	jalr	-1020(ra) # 80001440 <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
    80001844:	0004b483          	ld	s1,0(s1)
        __putc('0' + Scheduler::getCount());
    80001848:	00002097          	auipc	ra,0x2
    8000184c:	55c080e7          	jalr	1372(ra) # 80003da4 <_ZN9Scheduler8getCountEv>
    80001850:	0305051b          	addiw	a0,a0,48
    80001854:	0ff57513          	andi	a0,a0,255
    80001858:	00004097          	auipc	ra,0x4
    8000185c:	694080e7          	jalr	1684(ra) # 80005eec <__putc>
        Scheduler::put(t);
    80001860:	00048513          	mv	a0,s1
    80001864:	00002097          	auipc	ra,0x2
    80001868:	254080e7          	jalr	596(ra) # 80003ab8 <_ZN9Scheduler3putEP7_thread>
        __putc('=');
    8000186c:	03d00513          	li	a0,61
    80001870:	00004097          	auipc	ra,0x4
    80001874:	67c080e7          	jalr	1660(ra) # 80005eec <__putc>
        __putc('0' + Scheduler::getCount());
    80001878:	00002097          	auipc	ra,0x2
    8000187c:	52c080e7          	jalr	1324(ra) # 80003da4 <_ZN9Scheduler8getCountEv>
    80001880:	0305051b          	addiw	a0,a0,48
    80001884:	0ff57513          	andi	a0,a0,255
    80001888:	00004097          	auipc	ra,0x4
    8000188c:	664080e7          	jalr	1636(ra) # 80005eec <__putc>
        __putc('\n');
    80001890:	00a00513          	li	a0,10
    80001894:	00004097          	auipc	ra,0x4
    80001898:	658080e7          	jalr	1624(ra) # 80005eec <__putc>
    }
    8000189c:	01813083          	ld	ra,24(sp)
    800018a0:	01013403          	ld	s0,16(sp)
    800018a4:	00813483          	ld	s1,8(sp)
    800018a8:	02010113          	addi	sp,sp,32
    800018ac:	00008067          	ret
            id->blockTail = 0;
    800018b0:	00053423          	sd	zero,8(a0)
    800018b4:	f75ff06f          	j	80001828 <_ZN4_sem6signalEPS_+0x3c>

00000000800018b8 <main>:

#include "kernel.h"
#include "assert.h"

/// @brief first function to be called
void main(){
    800018b8:	fb010113          	addi	sp,sp,-80
    800018bc:	04113423          	sd	ra,72(sp)
    800018c0:	04813023          	sd	s0,64(sp)
    800018c4:	02913c23          	sd	s1,56(sp)
    800018c8:	05010413          	addi	s0,sp,80
    Kernel kernel = Kernel();
    800018cc:	fb840493          	addi	s1,s0,-72
    800018d0:	00048513          	mv	a0,s1
    800018d4:	00000097          	auipc	ra,0x0
    800018d8:	3cc080e7          	jalr	972(ra) # 80001ca0 <_ZN6KernelC1Ev>
    kernel.initialise();
    800018dc:	00048513          	mv	a0,s1
    800018e0:	00000097          	auipc	ra,0x0
    800018e4:	434080e7          	jalr	1076(ra) # 80001d14 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    800018e8:	00048513          	mv	a0,s1
    800018ec:	00000097          	auipc	ra,0x0
    800018f0:	52c080e7          	jalr	1324(ra) # 80001e18 <_ZN6Kernel3runEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    800018f4:	02051863          	bnez	a0,80001924 <main+0x6c>
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    800018f8:	fd040513          	addi	a0,s0,-48
    800018fc:	00000097          	auipc	ra,0x0
    80001900:	874080e7          	jalr	-1932(ra) # 80001170 <_ZN5TimerD1Ev>
    80001904:	fb840513          	addi	a0,s0,-72
    80001908:	00001097          	auipc	ra,0x1
    8000190c:	1f4080e7          	jalr	500(ra) # 80002afc <_ZN11HeapManagerD1Ev>
    80001910:	04813083          	ld	ra,72(sp)
    80001914:	04013403          	ld	s0,64(sp)
    80001918:	03813483          	ld	s1,56(sp)
    8000191c:	05010113          	addi	sp,sp,80
    80001920:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001924:	00005697          	auipc	a3,0x5
    80001928:	76468693          	addi	a3,a3,1892 # 80007088 <CONSOLE_STATUS+0x78>
    8000192c:	01400613          	li	a2,20
    80001930:	00005597          	auipc	a1,0x5
    80001934:	76858593          	addi	a1,a1,1896 # 80007098 <CONSOLE_STATUS+0x88>
    80001938:	00005517          	auipc	a0,0x5
    8000193c:	77050513          	addi	a0,a0,1904 # 800070a8 <CONSOLE_STATUS+0x98>
    80001940:	00000097          	auipc	ra,0x0
    80001944:	034080e7          	jalr	52(ra) # 80001974 <_Z13assert_failedPKcS0_jS0_>
    80001948:	fb1ff06f          	j	800018f8 <main+0x40>
    8000194c:	00050493          	mv	s1,a0
    80001950:	fd040513          	addi	a0,s0,-48
    80001954:	00000097          	auipc	ra,0x0
    80001958:	81c080e7          	jalr	-2020(ra) # 80001170 <_ZN5TimerD1Ev>
    8000195c:	fb840513          	addi	a0,s0,-72
    80001960:	00001097          	auipc	ra,0x1
    80001964:	19c080e7          	jalr	412(ra) # 80002afc <_ZN11HeapManagerD1Ev>
    80001968:	00048513          	mv	a0,s1
    8000196c:	00007097          	auipc	ra,0x7
    80001970:	7ac080e7          	jalr	1964(ra) # 80009118 <_Unwind_Resume>

0000000080001974 <_Z13assert_failedPKcS0_jS0_>:
 * 
 */
#include "assert.h"
#include "syscalls_c.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    80001974:	fb010113          	addi	sp,sp,-80
    80001978:	04113423          	sd	ra,72(sp)
    8000197c:	04813023          	sd	s0,64(sp)
    80001980:	02913c23          	sd	s1,56(sp)
    80001984:	03213823          	sd	s2,48(sp)
    80001988:	03313423          	sd	s3,40(sp)
    8000198c:	03413023          	sd	s4,32(sp)
    80001990:	05010413          	addi	s0,sp,80
    80001994:	00050993          	mv	s3,a0
    80001998:	00058493          	mv	s1,a1
    8000199c:	00060913          	mv	s2,a2
    800019a0:	00068a13          	mv	s4,a3
    putc('\n');
    800019a4:	00a00513          	li	a0,10
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	cb4080e7          	jalr	-844(ra) # 8000165c <_Z4putcc>
    putc('A');
    800019b0:	04100513          	li	a0,65
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	ca8080e7          	jalr	-856(ra) # 8000165c <_Z4putcc>
    putc('s');
    800019bc:	07300513          	li	a0,115
    800019c0:	00000097          	auipc	ra,0x0
    800019c4:	c9c080e7          	jalr	-868(ra) # 8000165c <_Z4putcc>
    putc('s');
    800019c8:	07300513          	li	a0,115
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	c90080e7          	jalr	-880(ra) # 8000165c <_Z4putcc>
    putc('e');
    800019d4:	06500513          	li	a0,101
    800019d8:	00000097          	auipc	ra,0x0
    800019dc:	c84080e7          	jalr	-892(ra) # 8000165c <_Z4putcc>
    putc('r');
    800019e0:	07200513          	li	a0,114
    800019e4:	00000097          	auipc	ra,0x0
    800019e8:	c78080e7          	jalr	-904(ra) # 8000165c <_Z4putcc>
    putc('t');
    800019ec:	07400513          	li	a0,116
    800019f0:	00000097          	auipc	ra,0x0
    800019f4:	c6c080e7          	jalr	-916(ra) # 8000165c <_Z4putcc>
    putc('i');
    800019f8:	06900513          	li	a0,105
    800019fc:	00000097          	auipc	ra,0x0
    80001a00:	c60080e7          	jalr	-928(ra) # 8000165c <_Z4putcc>
    putc('o');
    80001a04:	06f00513          	li	a0,111
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	c54080e7          	jalr	-940(ra) # 8000165c <_Z4putcc>
    putc('n');
    80001a10:	06e00513          	li	a0,110
    80001a14:	00000097          	auipc	ra,0x0
    80001a18:	c48080e7          	jalr	-952(ra) # 8000165c <_Z4putcc>
    putc(' ');
    80001a1c:	02000513          	li	a0,32
    80001a20:	00000097          	auipc	ra,0x0
    80001a24:	c3c080e7          	jalr	-964(ra) # 8000165c <_Z4putcc>
    putc('\'');
    80001a28:	02700513          	li	a0,39
    80001a2c:	00000097          	auipc	ra,0x0
    80001a30:	c30080e7          	jalr	-976(ra) # 8000165c <_Z4putcc>
    while(*__assertion != 0){
    80001a34:	0009c503          	lbu	a0,0(s3)
    80001a38:	00050a63          	beqz	a0,80001a4c <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    80001a3c:	00000097          	auipc	ra,0x0
    80001a40:	c20080e7          	jalr	-992(ra) # 8000165c <_Z4putcc>
        __assertion++;
    80001a44:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    80001a48:	fedff06f          	j	80001a34 <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    80001a4c:	02700513          	li	a0,39
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	c0c080e7          	jalr	-1012(ra) # 8000165c <_Z4putcc>
    putc(' ');
    80001a58:	02000513          	li	a0,32
    80001a5c:	00000097          	auipc	ra,0x0
    80001a60:	c00080e7          	jalr	-1024(ra) # 8000165c <_Z4putcc>
    putc('f');
    80001a64:	06600513          	li	a0,102
    80001a68:	00000097          	auipc	ra,0x0
    80001a6c:	bf4080e7          	jalr	-1036(ra) # 8000165c <_Z4putcc>
    putc('a');
    80001a70:	06100513          	li	a0,97
    80001a74:	00000097          	auipc	ra,0x0
    80001a78:	be8080e7          	jalr	-1048(ra) # 8000165c <_Z4putcc>
    putc('i');
    80001a7c:	06900513          	li	a0,105
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	bdc080e7          	jalr	-1060(ra) # 8000165c <_Z4putcc>
    putc('l');
    80001a88:	06c00513          	li	a0,108
    80001a8c:	00000097          	auipc	ra,0x0
    80001a90:	bd0080e7          	jalr	-1072(ra) # 8000165c <_Z4putcc>
    putc('e');
    80001a94:	06500513          	li	a0,101
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	bc4080e7          	jalr	-1084(ra) # 8000165c <_Z4putcc>
    putc('d');
    80001aa0:	06400513          	li	a0,100
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	bb8080e7          	jalr	-1096(ra) # 8000165c <_Z4putcc>
    putc(' ');
    80001aac:	02000513          	li	a0,32
    80001ab0:	00000097          	auipc	ra,0x0
    80001ab4:	bac080e7          	jalr	-1108(ra) # 8000165c <_Z4putcc>
    putc('i');
    80001ab8:	06900513          	li	a0,105
    80001abc:	00000097          	auipc	ra,0x0
    80001ac0:	ba0080e7          	jalr	-1120(ra) # 8000165c <_Z4putcc>
    putc('n');
    80001ac4:	06e00513          	li	a0,110
    80001ac8:	00000097          	auipc	ra,0x0
    80001acc:	b94080e7          	jalr	-1132(ra) # 8000165c <_Z4putcc>
    putc(' ');
    80001ad0:	02000513          	li	a0,32
    80001ad4:	00000097          	auipc	ra,0x0
    80001ad8:	b88080e7          	jalr	-1144(ra) # 8000165c <_Z4putcc>
    putc('f');
    80001adc:	06600513          	li	a0,102
    80001ae0:	00000097          	auipc	ra,0x0
    80001ae4:	b7c080e7          	jalr	-1156(ra) # 8000165c <_Z4putcc>
    putc('i');
    80001ae8:	06900513          	li	a0,105
    80001aec:	00000097          	auipc	ra,0x0
    80001af0:	b70080e7          	jalr	-1168(ra) # 8000165c <_Z4putcc>
    putc('l');
    80001af4:	06c00513          	li	a0,108
    80001af8:	00000097          	auipc	ra,0x0
    80001afc:	b64080e7          	jalr	-1180(ra) # 8000165c <_Z4putcc>
    putc('e');
    80001b00:	06500513          	li	a0,101
    80001b04:	00000097          	auipc	ra,0x0
    80001b08:	b58080e7          	jalr	-1192(ra) # 8000165c <_Z4putcc>
    putc(':');
    80001b0c:	03a00513          	li	a0,58
    80001b10:	00000097          	auipc	ra,0x0
    80001b14:	b4c080e7          	jalr	-1204(ra) # 8000165c <_Z4putcc>
    putc(' ');
    80001b18:	02000513          	li	a0,32
    80001b1c:	00000097          	auipc	ra,0x0
    80001b20:	b40080e7          	jalr	-1216(ra) # 8000165c <_Z4putcc>
    while(*__file != 0){
    80001b24:	0004c503          	lbu	a0,0(s1)
    80001b28:	00050a63          	beqz	a0,80001b3c <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    80001b2c:	00000097          	auipc	ra,0x0
    80001b30:	b30080e7          	jalr	-1232(ra) # 8000165c <_Z4putcc>
        __file++;
    80001b34:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80001b38:	fedff06f          	j	80001b24 <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    80001b3c:	00a00513          	li	a0,10
    80001b40:	00000097          	auipc	ra,0x0
    80001b44:	b1c080e7          	jalr	-1252(ra) # 8000165c <_Z4putcc>
    putc('l');
    80001b48:	06c00513          	li	a0,108
    80001b4c:	00000097          	auipc	ra,0x0
    80001b50:	b10080e7          	jalr	-1264(ra) # 8000165c <_Z4putcc>
    putc('i');
    80001b54:	06900513          	li	a0,105
    80001b58:	00000097          	auipc	ra,0x0
    80001b5c:	b04080e7          	jalr	-1276(ra) # 8000165c <_Z4putcc>
    putc('n');
    80001b60:	06e00513          	li	a0,110
    80001b64:	00000097          	auipc	ra,0x0
    80001b68:	af8080e7          	jalr	-1288(ra) # 8000165c <_Z4putcc>
    putc('e');
    80001b6c:	06500513          	li	a0,101
    80001b70:	00000097          	auipc	ra,0x0
    80001b74:	aec080e7          	jalr	-1300(ra) # 8000165c <_Z4putcc>
    putc(':');
    80001b78:	03a00513          	li	a0,58
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	ae0080e7          	jalr	-1312(ra) # 8000165c <_Z4putcc>
    putc(' ');
    80001b84:	02000513          	li	a0,32
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	ad4080e7          	jalr	-1324(ra) # 8000165c <_Z4putcc>
    char buffer[20];
    int i = 0;
    80001b90:	00000493          	li	s1,0
    while(__line != 0){
    80001b94:	02090463          	beqz	s2,80001bbc <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80001b98:	00a00713          	li	a4,10
    80001b9c:	02e977bb          	remuw	a5,s2,a4
    80001ba0:	0307879b          	addiw	a5,a5,48
    80001ba4:	fd040693          	addi	a3,s0,-48
    80001ba8:	009686b3          	add	a3,a3,s1
    80001bac:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    80001bb0:	02e9593b          	divuw	s2,s2,a4
        i++;
    80001bb4:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    80001bb8:	fddff06f          	j	80001b94 <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    80001bbc:	02048063          	beqz	s1,80001bdc <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    80001bc0:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80001bc4:	fd040793          	addi	a5,s0,-48
    80001bc8:	009787b3          	add	a5,a5,s1
    80001bcc:	fe87c503          	lbu	a0,-24(a5)
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	a8c080e7          	jalr	-1396(ra) # 8000165c <_Z4putcc>
    80001bd8:	fe5ff06f          	j	80001bbc <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80001bdc:	00a00513          	li	a0,10
    80001be0:	00000097          	auipc	ra,0x0
    80001be4:	a7c080e7          	jalr	-1412(ra) # 8000165c <_Z4putcc>
    putc('f');
    80001be8:	06600513          	li	a0,102
    80001bec:	00000097          	auipc	ra,0x0
    80001bf0:	a70080e7          	jalr	-1424(ra) # 8000165c <_Z4putcc>
    putc('u');
    80001bf4:	07500513          	li	a0,117
    80001bf8:	00000097          	auipc	ra,0x0
    80001bfc:	a64080e7          	jalr	-1436(ra) # 8000165c <_Z4putcc>
    putc('n');
    80001c00:	06e00513          	li	a0,110
    80001c04:	00000097          	auipc	ra,0x0
    80001c08:	a58080e7          	jalr	-1448(ra) # 8000165c <_Z4putcc>
    putc('c');
    80001c0c:	06300513          	li	a0,99
    80001c10:	00000097          	auipc	ra,0x0
    80001c14:	a4c080e7          	jalr	-1460(ra) # 8000165c <_Z4putcc>
    putc('t');
    80001c18:	07400513          	li	a0,116
    80001c1c:	00000097          	auipc	ra,0x0
    80001c20:	a40080e7          	jalr	-1472(ra) # 8000165c <_Z4putcc>
    putc('i');
    80001c24:	06900513          	li	a0,105
    80001c28:	00000097          	auipc	ra,0x0
    80001c2c:	a34080e7          	jalr	-1484(ra) # 8000165c <_Z4putcc>
    putc('o');
    80001c30:	06f00513          	li	a0,111
    80001c34:	00000097          	auipc	ra,0x0
    80001c38:	a28080e7          	jalr	-1496(ra) # 8000165c <_Z4putcc>
    putc('n');
    80001c3c:	06e00513          	li	a0,110
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	a1c080e7          	jalr	-1508(ra) # 8000165c <_Z4putcc>
    putc(':');
    80001c48:	03a00513          	li	a0,58
    80001c4c:	00000097          	auipc	ra,0x0
    80001c50:	a10080e7          	jalr	-1520(ra) # 8000165c <_Z4putcc>
    putc(' ');
    80001c54:	02000513          	li	a0,32
    80001c58:	00000097          	auipc	ra,0x0
    80001c5c:	a04080e7          	jalr	-1532(ra) # 8000165c <_Z4putcc>
    putc('\'');
    80001c60:	02700513          	li	a0,39
    80001c64:	00000097          	auipc	ra,0x0
    80001c68:	9f8080e7          	jalr	-1544(ra) # 8000165c <_Z4putcc>
    while(*__function != 0){
    80001c6c:	000a4503          	lbu	a0,0(s4)
    80001c70:	00050a63          	beqz	a0,80001c84 <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    80001c74:	00000097          	auipc	ra,0x0
    80001c78:	9e8080e7          	jalr	-1560(ra) # 8000165c <_Z4putcc>
        __function ++;
    80001c7c:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80001c80:	fedff06f          	j	80001c6c <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    80001c84:	02700513          	li	a0,39
    80001c88:	00000097          	auipc	ra,0x0
    80001c8c:	9d4080e7          	jalr	-1580(ra) # 8000165c <_Z4putcc>
    putc('\n');
    80001c90:	00a00513          	li	a0,10
    80001c94:	00000097          	auipc	ra,0x0
    80001c98:	9c8080e7          	jalr	-1592(ra) # 8000165c <_Z4putcc>
    while(1);
    80001c9c:	0000006f          	j	80001c9c <_Z13assert_failedPKcS0_jS0_+0x328>

0000000080001ca0 <_ZN6KernelC1Ev>:

#include "console.h"

extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80001ca0:	fe010113          	addi	sp,sp,-32
    80001ca4:	00113c23          	sd	ra,24(sp)
    80001ca8:	00813823          	sd	s0,16(sp)
    80001cac:	00913423          	sd	s1,8(sp)
    80001cb0:	01213023          	sd	s2,0(sp)
    80001cb4:	02010413          	addi	s0,sp,32
    80001cb8:	00050493          	mv	s1,a0
    80001cbc:	00001097          	auipc	ra,0x1
    80001cc0:	dd8080e7          	jalr	-552(ra) # 80002a94 <_ZN11HeapManagerC1Ev>
    80001cc4:	00848513          	addi	a0,s1,8
    80001cc8:	00002097          	auipc	ra,0x2
    80001ccc:	d58080e7          	jalr	-680(ra) # 80003a20 <_ZN9SchedulerC1Ev>
    80001cd0:	01848513          	addi	a0,s1,24
    80001cd4:	fffff097          	auipc	ra,0xfffff
    80001cd8:	42c080e7          	jalr	1068(ra) # 80001100 <_ZN5TimerC1Ev>
    80001cdc:	0200006f          	j	80001cfc <_ZN6KernelC1Ev+0x5c>
    80001ce0:	00050913          	mv	s2,a0
    80001ce4:	00048513          	mv	a0,s1
    80001ce8:	00001097          	auipc	ra,0x1
    80001cec:	e14080e7          	jalr	-492(ra) # 80002afc <_ZN11HeapManagerD1Ev>
    80001cf0:	00090513          	mv	a0,s2
    80001cf4:	00007097          	auipc	ra,0x7
    80001cf8:	424080e7          	jalr	1060(ra) # 80009118 <_Unwind_Resume>
    80001cfc:	01813083          	ld	ra,24(sp)
    80001d00:	01013403          	ld	s0,16(sp)
    80001d04:	00813483          	ld	s1,8(sp)
    80001d08:	00013903          	ld	s2,0(sp)
    80001d0c:	02010113          	addi	sp,sp,32
    80001d10:	00008067          	ret

0000000080001d14 <_ZN6Kernel10initialiseEv>:
 
void Kernel::initialise(){
    80001d14:	ff010113          	addi	sp,sp,-16
    80001d18:	00113423          	sd	ra,8(sp)
    80001d1c:	00813023          	sd	s0,0(sp)
    80001d20:	01010413          	addi	s0,sp,16
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80001d24:	00006797          	auipc	a5,0x6
    80001d28:	29c7b783          	ld	a5,668(a5) # 80007fc0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d2c:	10579073          	csrw	stvec,a5

    
    /// initialise the heap manager
    heapManager.init((uintptr_t)HEAP_START_ADDR, (uintptr_t)HEAP_END_ADDR );
    80001d30:	00006797          	auipc	a5,0x6
    80001d34:	2987b783          	ld	a5,664(a5) # 80007fc8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001d38:	0007b603          	ld	a2,0(a5)
    80001d3c:	00006797          	auipc	a5,0x6
    80001d40:	2647b783          	ld	a5,612(a5) # 80007fa0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001d44:	0007b583          	ld	a1,0(a5)
    80001d48:	00001097          	auipc	ra,0x1
    80001d4c:	dcc080e7          	jalr	-564(ra) # 80002b14 <_ZN11HeapManager4initEmm>

    return;
}
    80001d50:	00813083          	ld	ra,8(sp)
    80001d54:	00013403          	ld	s0,0(sp)
    80001d58:	01010113          	addi	sp,sp,16
    80001d5c:	00008067          	ret

0000000080001d60 <_Z8testFuncPv>:

// sem_t sem = 0;

void testFunc(void* arg){
    80001d60:	ff010113          	addi	sp,sp,-16
    80001d64:	00113423          	sd	ra,8(sp)
    80001d68:	00813023          	sd	s0,0(sp)
    80001d6c:	01010413          	addi	s0,sp,16
    putc('t');
    80001d70:	07400513          	li	a0,116
    80001d74:	00000097          	auipc	ra,0x0
    80001d78:	8e8080e7          	jalr	-1816(ra) # 8000165c <_Z4putcc>
    putc('e');
    80001d7c:	06500513          	li	a0,101
    80001d80:	00000097          	auipc	ra,0x0
    80001d84:	8dc080e7          	jalr	-1828(ra) # 8000165c <_Z4putcc>
    putc('s');
    80001d88:	07300513          	li	a0,115
    80001d8c:	00000097          	auipc	ra,0x0
    80001d90:	8d0080e7          	jalr	-1840(ra) # 8000165c <_Z4putcc>
    putc('t');
    80001d94:	07400513          	li	a0,116
    80001d98:	00000097          	auipc	ra,0x0
    80001d9c:	8c4080e7          	jalr	-1852(ra) # 8000165c <_Z4putcc>

    // sem_wait(sem);
    // thread_dispatch();
    // thread_dispatch();
    thread_dispatch();
    80001da0:	fffff097          	auipc	ra,0xfffff
    80001da4:	768080e7          	jalr	1896(ra) # 80001508 <_Z15thread_dispatchv>

    // time_sleep(10);
    putc(' ');
    80001da8:	02000513          	li	a0,32
    80001dac:	00000097          	auipc	ra,0x0
    80001db0:	8b0080e7          	jalr	-1872(ra) # 8000165c <_Z4putcc>

    putc('t');
    80001db4:	07400513          	li	a0,116
    80001db8:	00000097          	auipc	ra,0x0
    80001dbc:	8a4080e7          	jalr	-1884(ra) # 8000165c <_Z4putcc>
    putc('h');
    80001dc0:	06800513          	li	a0,104
    80001dc4:	00000097          	auipc	ra,0x0
    80001dc8:	898080e7          	jalr	-1896(ra) # 8000165c <_Z4putcc>
    putc('r');
    80001dcc:	07200513          	li	a0,114
    80001dd0:	00000097          	auipc	ra,0x0
    80001dd4:	88c080e7          	jalr	-1908(ra) # 8000165c <_Z4putcc>
    putc('e');
    80001dd8:	06500513          	li	a0,101
    80001ddc:	00000097          	auipc	ra,0x0
    80001de0:	880080e7          	jalr	-1920(ra) # 8000165c <_Z4putcc>
    putc('a');
    80001de4:	06100513          	li	a0,97
    80001de8:	00000097          	auipc	ra,0x0
    80001dec:	874080e7          	jalr	-1932(ra) # 8000165c <_Z4putcc>
    putc('d');
    80001df0:	06400513          	li	a0,100
    80001df4:	00000097          	auipc	ra,0x0
    80001df8:	868080e7          	jalr	-1944(ra) # 8000165c <_Z4putcc>
    putc('\n');
    80001dfc:	00a00513          	li	a0,10
    80001e00:	00000097          	auipc	ra,0x0
    80001e04:	85c080e7          	jalr	-1956(ra) # 8000165c <_Z4putcc>
}
    80001e08:	00813083          	ld	ra,8(sp)
    80001e0c:	00013403          	ld	s0,0(sp)
    80001e10:	01010113          	addi	sp,sp,16
    80001e14:	00008067          	ret

0000000080001e18 <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    80001e18:	fe010113          	addi	sp,sp,-32
    80001e1c:	00113c23          	sd	ra,24(sp)
    80001e20:	00813823          	sd	s0,16(sp)
    80001e24:	02010413          	addi	s0,sp,32

    thread_t t, test;
    
    thread_create(&t, 0, 0);
    80001e28:	00000613          	li	a2,0
    80001e2c:	00000593          	li	a1,0
    80001e30:	fe840513          	addi	a0,s0,-24
    80001e34:	fffff097          	auipc	ra,0xfffff
    80001e38:	638080e7          	jalr	1592(ra) # 8000146c <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80001e3c:	00002097          	auipc	ra,0x2
    80001e40:	e6c080e7          	jalr	-404(ra) # 80003ca8 <_ZN9Scheduler3getEv>
    80001e44:	00006797          	auipc	a5,0x6
    80001e48:	18c7b783          	ld	a5,396(a5) # 80007fd0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001e4c:	00a7b023          	sd	a0,0(a5)
    
    /// change to user mode
    __asm__ volatile ("li a0, 0xff");
    80001e50:	0ff00513          	li	a0,255
    __asm__ volatile ("ecall");
    80001e54:	00000073          	ecall
    
    putc('u');
    80001e58:	07500513          	li	a0,117
    80001e5c:	00000097          	auipc	ra,0x0
    80001e60:	800080e7          	jalr	-2048(ra) # 8000165c <_Z4putcc>
    putc('s');
    80001e64:	07300513          	li	a0,115
    80001e68:	fffff097          	auipc	ra,0xfffff
    80001e6c:	7f4080e7          	jalr	2036(ra) # 8000165c <_Z4putcc>
    putc('e');
    80001e70:	06500513          	li	a0,101
    80001e74:	fffff097          	auipc	ra,0xfffff
    80001e78:	7e8080e7          	jalr	2024(ra) # 8000165c <_Z4putcc>
    putc('r');
    80001e7c:	07200513          	li	a0,114
    80001e80:	fffff097          	auipc	ra,0xfffff
    80001e84:	7dc080e7          	jalr	2012(ra) # 8000165c <_Z4putcc>
    putc('\n');
    80001e88:	00a00513          	li	a0,10
    80001e8c:	fffff097          	auipc	ra,0xfffff
    80001e90:	7d0080e7          	jalr	2000(ra) # 8000165c <_Z4putcc>

    
    /// NOW WE ARE IN USER MODE
    
    
    thread_create(&test, usermain, 0);
    80001e94:	00000613          	li	a2,0
    80001e98:	00006597          	auipc	a1,0x6
    80001e9c:	1105b583          	ld	a1,272(a1) # 80007fa8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001ea0:	fe040513          	addi	a0,s0,-32
    80001ea4:	fffff097          	auipc	ra,0xfffff
    80001ea8:	5c8080e7          	jalr	1480(ra) # 8000146c <_Z13thread_createPP7_threadPFvPvES2_>
    putc('k');
    80001eac:	06b00513          	li	a0,107
    80001eb0:	fffff097          	auipc	ra,0xfffff
    80001eb4:	7ac080e7          	jalr	1964(ra) # 8000165c <_Z4putcc>
    putc('e');
    80001eb8:	06500513          	li	a0,101
    80001ebc:	fffff097          	auipc	ra,0xfffff
    80001ec0:	7a0080e7          	jalr	1952(ra) # 8000165c <_Z4putcc>
    putc('r');
    80001ec4:	07200513          	li	a0,114
    80001ec8:	fffff097          	auipc	ra,0xfffff
    80001ecc:	794080e7          	jalr	1940(ra) # 8000165c <_Z4putcc>
    putc('n');
    80001ed0:	06e00513          	li	a0,110
    80001ed4:	fffff097          	auipc	ra,0xfffff
    80001ed8:	788080e7          	jalr	1928(ra) # 8000165c <_Z4putcc>
    putc('e');
    80001edc:	06500513          	li	a0,101
    80001ee0:	fffff097          	auipc	ra,0xfffff
    80001ee4:	77c080e7          	jalr	1916(ra) # 8000165c <_Z4putcc>
    putc('l');
    80001ee8:	06c00513          	li	a0,108
    80001eec:	fffff097          	auipc	ra,0xfffff
    80001ef0:	770080e7          	jalr	1904(ra) # 8000165c <_Z4putcc>
    putc('\n');
    80001ef4:	00a00513          	li	a0,10
    80001ef8:	fffff097          	auipc	ra,0xfffff
    80001efc:	764080e7          	jalr	1892(ra) # 8000165c <_Z4putcc>
    do{
        thread_dispatch();
    80001f00:	fffff097          	auipc	ra,0xfffff
    80001f04:	608080e7          	jalr	1544(ra) # 80001508 <_Z15thread_dispatchv>
    80001f08:	ff9ff06f          	j	80001f00 <_ZN6Kernel3runEv+0xe8>

0000000080001f0c <_Z13thread_test_2Pv>:
    putc('0' + cnt);
    putc('\n');
    // assert(false);
}

void thread_test_2(void* args){
    80001f0c:	ff010113          	addi	sp,sp,-16
    80001f10:	00113423          	sd	ra,8(sp)
    80001f14:	00813023          	sd	s0,0(sp)
    80001f18:	01010413          	addi	s0,sp,16
    putc('2');
    80001f1c:	03200513          	li	a0,50
    80001f20:	fffff097          	auipc	ra,0xfffff
    80001f24:	73c080e7          	jalr	1852(ra) # 8000165c <_Z4putcc>
    putc('s');
    80001f28:	07300513          	li	a0,115
    80001f2c:	fffff097          	auipc	ra,0xfffff
    80001f30:	730080e7          	jalr	1840(ra) # 8000165c <_Z4putcc>
    // time_sleep(25);
    putc('2');
    80001f34:	03200513          	li	a0,50
    80001f38:	fffff097          	auipc	ra,0xfffff
    80001f3c:	724080e7          	jalr	1828(ra) # 8000165c <_Z4putcc>
    putc('S');
    80001f40:	05300513          	li	a0,83
    80001f44:	fffff097          	auipc	ra,0xfffff
    80001f48:	718080e7          	jalr	1816(ra) # 8000165c <_Z4putcc>
    // sem_signal(sem2);
}
    80001f4c:	00813083          	ld	ra,8(sp)
    80001f50:	00013403          	ld	s0,0(sp)
    80001f54:	01010113          	addi	sp,sp,16
    80001f58:	00008067          	ret

0000000080001f5c <_Z13thread_test_1Pv>:
void thread_test_1(void* args){
    80001f5c:	fd010113          	addi	sp,sp,-48
    80001f60:	02113423          	sd	ra,40(sp)
    80001f64:	02813023          	sd	s0,32(sp)
    80001f68:	00913c23          	sd	s1,24(sp)
    80001f6c:	01213823          	sd	s2,16(sp)
    80001f70:	01313423          	sd	s3,8(sp)
    80001f74:	03010413          	addi	s0,sp,48
    putc('1');
    80001f78:	03100513          	li	a0,49
    80001f7c:	fffff097          	auipc	ra,0xfffff
    80001f80:	6e0080e7          	jalr	1760(ra) # 8000165c <_Z4putcc>
    putc('s');
    80001f84:	07300513          	li	a0,115
    80001f88:	fffff097          	auipc	ra,0xfffff
    80001f8c:	6d4080e7          	jalr	1748(ra) # 8000165c <_Z4putcc>
    time_sleep(30);
    80001f90:	01e00513          	li	a0,30
    80001f94:	fffff097          	auipc	ra,0xfffff
    80001f98:	5b8080e7          	jalr	1464(ra) # 8000154c <_Z10time_sleepm>
    putc('1');
    80001f9c:	03100513          	li	a0,49
    80001fa0:	fffff097          	auipc	ra,0xfffff
    80001fa4:	6bc080e7          	jalr	1724(ra) # 8000165c <_Z4putcc>
    sem_signal(sem1);
    80001fa8:	00006517          	auipc	a0,0x6
    80001fac:	08053503          	ld	a0,128(a0) # 80008028 <sem1>
    80001fb0:	fffff097          	auipc	ra,0xfffff
    80001fb4:	658080e7          	jalr	1624(ra) # 80001608 <_Z10sem_signalP4_sem>
    putc('S');
    80001fb8:	05300513          	li	a0,83
    80001fbc:	fffff097          	auipc	ra,0xfffff
    80001fc0:	6a0080e7          	jalr	1696(ra) # 8000165c <_Z4putcc>
    putc('\n');
    80001fc4:	00a00513          	li	a0,10
    80001fc8:	fffff097          	auipc	ra,0xfffff
    80001fcc:	694080e7          	jalr	1684(ra) # 8000165c <_Z4putcc>
    putc('c');
    80001fd0:	06300513          	li	a0,99
    80001fd4:	fffff097          	auipc	ra,0xfffff
    80001fd8:	688080e7          	jalr	1672(ra) # 8000165c <_Z4putcc>
    putc('n');
    80001fdc:	06e00513          	li	a0,110
    80001fe0:	fffff097          	auipc	ra,0xfffff
    80001fe4:	67c080e7          	jalr	1660(ra) # 8000165c <_Z4putcc>
    putc('t');
    80001fe8:	07400513          	li	a0,116
    80001fec:	fffff097          	auipc	ra,0xfffff
    80001ff0:	670080e7          	jalr	1648(ra) # 8000165c <_Z4putcc>
    putc(':');
    80001ff4:	03a00513          	li	a0,58
    80001ff8:	fffff097          	auipc	ra,0xfffff
    80001ffc:	664080e7          	jalr	1636(ra) # 8000165c <_Z4putcc>
    putc(' ');
    80002000:	02000513          	li	a0,32
    80002004:	fffff097          	auipc	ra,0xfffff
    80002008:	658080e7          	jalr	1624(ra) # 8000165c <_Z4putcc>
    int cnt = Scheduler::getCount();
    8000200c:	00002097          	auipc	ra,0x2
    80002010:	d98080e7          	jalr	-616(ra) # 80003da4 <_ZN9Scheduler8getCountEv>
    putc('0' + cnt);
    80002014:	0305051b          	addiw	a0,a0,48
    80002018:	0ff57513          	andi	a0,a0,255
    8000201c:	fffff097          	auipc	ra,0xfffff
    80002020:	640080e7          	jalr	1600(ra) # 8000165c <_Z4putcc>
    putc('\n');
    80002024:	00a00513          	li	a0,10
    80002028:	fffff097          	auipc	ra,0xfffff
    8000202c:	634080e7          	jalr	1588(ra) # 8000165c <_Z4putcc>
    thread_t t1 = Scheduler::get();
    80002030:	00002097          	auipc	ra,0x2
    80002034:	c78080e7          	jalr	-904(ra) # 80003ca8 <_ZN9Scheduler3getEv>
    80002038:	00050993          	mv	s3,a0
    int id = t1->ID;
    8000203c:	00052483          	lw	s1,0(a0)
    putc('i');
    80002040:	06900513          	li	a0,105
    80002044:	fffff097          	auipc	ra,0xfffff
    80002048:	618080e7          	jalr	1560(ra) # 8000165c <_Z4putcc>
    putc('d');
    8000204c:	06400513          	li	a0,100
    80002050:	fffff097          	auipc	ra,0xfffff
    80002054:	60c080e7          	jalr	1548(ra) # 8000165c <_Z4putcc>
    putc(':');
    80002058:	03a00513          	li	a0,58
    8000205c:	fffff097          	auipc	ra,0xfffff
    80002060:	600080e7          	jalr	1536(ra) # 8000165c <_Z4putcc>
    putc(' ');
    80002064:	02000513          	li	a0,32
    80002068:	fffff097          	auipc	ra,0xfffff
    8000206c:	5f4080e7          	jalr	1524(ra) # 8000165c <_Z4putcc>
    putc('0' + id);
    80002070:	0304851b          	addiw	a0,s1,48
    80002074:	0ff57513          	andi	a0,a0,255
    80002078:	fffff097          	auipc	ra,0xfffff
    8000207c:	5e4080e7          	jalr	1508(ra) # 8000165c <_Z4putcc>
    putc('\n');
    80002080:	00a00513          	li	a0,10
    80002084:	fffff097          	auipc	ra,0xfffff
    80002088:	5d8080e7          	jalr	1496(ra) # 8000165c <_Z4putcc>
    thread_t t2 = Scheduler::get();
    8000208c:	00002097          	auipc	ra,0x2
    80002090:	c1c080e7          	jalr	-996(ra) # 80003ca8 <_ZN9Scheduler3getEv>
    80002094:	00050913          	mv	s2,a0
    id = t2->ID;
    80002098:	00052483          	lw	s1,0(a0)
    putc('i');
    8000209c:	06900513          	li	a0,105
    800020a0:	fffff097          	auipc	ra,0xfffff
    800020a4:	5bc080e7          	jalr	1468(ra) # 8000165c <_Z4putcc>
    putc('d');
    800020a8:	06400513          	li	a0,100
    800020ac:	fffff097          	auipc	ra,0xfffff
    800020b0:	5b0080e7          	jalr	1456(ra) # 8000165c <_Z4putcc>
    putc(':');
    800020b4:	03a00513          	li	a0,58
    800020b8:	fffff097          	auipc	ra,0xfffff
    800020bc:	5a4080e7          	jalr	1444(ra) # 8000165c <_Z4putcc>
    putc(' ');
    800020c0:	02000513          	li	a0,32
    800020c4:	fffff097          	auipc	ra,0xfffff
    800020c8:	598080e7          	jalr	1432(ra) # 8000165c <_Z4putcc>
    putc('0' + id);
    800020cc:	0304851b          	addiw	a0,s1,48
    800020d0:	0ff57513          	andi	a0,a0,255
    800020d4:	fffff097          	auipc	ra,0xfffff
    800020d8:	588080e7          	jalr	1416(ra) # 8000165c <_Z4putcc>
    putc('\n');
    800020dc:	00a00513          	li	a0,10
    800020e0:	fffff097          	auipc	ra,0xfffff
    800020e4:	57c080e7          	jalr	1404(ra) # 8000165c <_Z4putcc>
    cnt = Scheduler::getCount();
    800020e8:	00002097          	auipc	ra,0x2
    800020ec:	cbc080e7          	jalr	-836(ra) # 80003da4 <_ZN9Scheduler8getCountEv>
    800020f0:	00050493          	mv	s1,a0
    putc('c');
    800020f4:	06300513          	li	a0,99
    800020f8:	fffff097          	auipc	ra,0xfffff
    800020fc:	564080e7          	jalr	1380(ra) # 8000165c <_Z4putcc>
    putc('n');
    80002100:	06e00513          	li	a0,110
    80002104:	fffff097          	auipc	ra,0xfffff
    80002108:	558080e7          	jalr	1368(ra) # 8000165c <_Z4putcc>
    putc('t');
    8000210c:	07400513          	li	a0,116
    80002110:	fffff097          	auipc	ra,0xfffff
    80002114:	54c080e7          	jalr	1356(ra) # 8000165c <_Z4putcc>
    putc(':');
    80002118:	03a00513          	li	a0,58
    8000211c:	fffff097          	auipc	ra,0xfffff
    80002120:	540080e7          	jalr	1344(ra) # 8000165c <_Z4putcc>
    putc(' ');
    80002124:	02000513          	li	a0,32
    80002128:	fffff097          	auipc	ra,0xfffff
    8000212c:	534080e7          	jalr	1332(ra) # 8000165c <_Z4putcc>
    putc('0' + cnt);
    80002130:	0304849b          	addiw	s1,s1,48
    80002134:	0ff4f513          	andi	a0,s1,255
    80002138:	fffff097          	auipc	ra,0xfffff
    8000213c:	524080e7          	jalr	1316(ra) # 8000165c <_Z4putcc>
    putc('\n');
    80002140:	00a00513          	li	a0,10
    80002144:	fffff097          	auipc	ra,0xfffff
    80002148:	518080e7          	jalr	1304(ra) # 8000165c <_Z4putcc>
    Scheduler::put(t1);
    8000214c:	00098513          	mv	a0,s3
    80002150:	00002097          	auipc	ra,0x2
    80002154:	968080e7          	jalr	-1688(ra) # 80003ab8 <_ZN9Scheduler3putEP7_thread>
    Scheduler::put(t2);
    80002158:	00090513          	mv	a0,s2
    8000215c:	00002097          	auipc	ra,0x2
    80002160:	95c080e7          	jalr	-1700(ra) # 80003ab8 <_ZN9Scheduler3putEP7_thread>
    cnt = Scheduler::getCount();
    80002164:	00002097          	auipc	ra,0x2
    80002168:	c40080e7          	jalr	-960(ra) # 80003da4 <_ZN9Scheduler8getCountEv>
    8000216c:	00050493          	mv	s1,a0
    putc('\n');
    80002170:	00a00513          	li	a0,10
    80002174:	fffff097          	auipc	ra,0xfffff
    80002178:	4e8080e7          	jalr	1256(ra) # 8000165c <_Z4putcc>
    putc('c');
    8000217c:	06300513          	li	a0,99
    80002180:	fffff097          	auipc	ra,0xfffff
    80002184:	4dc080e7          	jalr	1244(ra) # 8000165c <_Z4putcc>
    putc('n');
    80002188:	06e00513          	li	a0,110
    8000218c:	fffff097          	auipc	ra,0xfffff
    80002190:	4d0080e7          	jalr	1232(ra) # 8000165c <_Z4putcc>
    putc('t');
    80002194:	07400513          	li	a0,116
    80002198:	fffff097          	auipc	ra,0xfffff
    8000219c:	4c4080e7          	jalr	1220(ra) # 8000165c <_Z4putcc>
    putc(':');
    800021a0:	03a00513          	li	a0,58
    800021a4:	fffff097          	auipc	ra,0xfffff
    800021a8:	4b8080e7          	jalr	1208(ra) # 8000165c <_Z4putcc>
    putc(' ');
    800021ac:	02000513          	li	a0,32
    800021b0:	fffff097          	auipc	ra,0xfffff
    800021b4:	4ac080e7          	jalr	1196(ra) # 8000165c <_Z4putcc>
    putc('0' + cnt);
    800021b8:	0304851b          	addiw	a0,s1,48
    800021bc:	0ff57513          	andi	a0,a0,255
    800021c0:	fffff097          	auipc	ra,0xfffff
    800021c4:	49c080e7          	jalr	1180(ra) # 8000165c <_Z4putcc>
    putc('\n');
    800021c8:	00a00513          	li	a0,10
    800021cc:	fffff097          	auipc	ra,0xfffff
    800021d0:	490080e7          	jalr	1168(ra) # 8000165c <_Z4putcc>
}
    800021d4:	02813083          	ld	ra,40(sp)
    800021d8:	02013403          	ld	s0,32(sp)
    800021dc:	01813483          	ld	s1,24(sp)
    800021e0:	01013903          	ld	s2,16(sp)
    800021e4:	00813983          	ld	s3,8(sp)
    800021e8:	03010113          	addi	sp,sp,48
    800021ec:	00008067          	ret

00000000800021f0 <_Z8usermainPv>:

void usermain(void* arg){
    800021f0:	fd010113          	addi	sp,sp,-48
    800021f4:	02113423          	sd	ra,40(sp)
    800021f8:	02813023          	sd	s0,32(sp)
    800021fc:	00913c23          	sd	s1,24(sp)
    80002200:	03010413          	addi	s0,sp,48
    putc('0');
    80002204:	03000513          	li	a0,48
    80002208:	fffff097          	auipc	ra,0xfffff
    8000220c:	454080e7          	jalr	1108(ra) # 8000165c <_Z4putcc>
    thread_t t1, t2;
    sem_open(&sem1, 0);
    80002210:	00006497          	auipc	s1,0x6
    80002214:	e1848493          	addi	s1,s1,-488 # 80008028 <sem1>
    80002218:	00000593          	li	a1,0
    8000221c:	00048513          	mv	a0,s1
    80002220:	fffff097          	auipc	ra,0xfffff
    80002224:	358080e7          	jalr	856(ra) # 80001578 <_Z8sem_openPP4_semj>
    // sem_open(&sem2, 0);
    thread_create(&t1, thread_test_1, 0);
    80002228:	00000613          	li	a2,0
    8000222c:	00000597          	auipc	a1,0x0
    80002230:	d3058593          	addi	a1,a1,-720 # 80001f5c <_Z13thread_test_1Pv>
    80002234:	fd840513          	addi	a0,s0,-40
    80002238:	fffff097          	auipc	ra,0xfffff
    8000223c:	234080e7          	jalr	564(ra) # 8000146c <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002240:	00000613          	li	a2,0
    80002244:	00000597          	auipc	a1,0x0
    80002248:	cc858593          	addi	a1,a1,-824 # 80001f0c <_Z13thread_test_2Pv>
    8000224c:	fd040513          	addi	a0,s0,-48
    80002250:	fffff097          	auipc	ra,0xfffff
    80002254:	21c080e7          	jalr	540(ra) # 8000146c <_Z13thread_createPP7_threadPFvPvES2_>
    sem_wait(sem1);
    80002258:	0004b503          	ld	a0,0(s1)
    8000225c:	fffff097          	auipc	ra,0xfffff
    80002260:	380080e7          	jalr	896(ra) # 800015dc <_Z8sem_waitP4_sem>
    putc('3');
    80002264:	03300513          	li	a0,51
    80002268:	fffff097          	auipc	ra,0xfffff
    8000226c:	3f4080e7          	jalr	1012(ra) # 8000165c <_Z4putcc>
    thread_join(t2);
    80002270:	fd043503          	ld	a0,-48(s0)
    80002274:	fffff097          	auipc	ra,0xfffff
    80002278:	2b4080e7          	jalr	692(ra) # 80001528 <_Z11thread_joinP7_thread>
    // if(getc() == 'a')putc('x');
    putc('4');
    8000227c:	03400513          	li	a0,52
    80002280:	fffff097          	auipc	ra,0xfffff
    80002284:	3dc080e7          	jalr	988(ra) # 8000165c <_Z4putcc>
    // thread_join(t1);
    // thread_dispatch();
    // thread_dispatch();
    // sem_wait(sem2);
    putc('5');
    80002288:	03500513          	li	a0,53
    8000228c:	fffff097          	auipc	ra,0xfffff
    80002290:	3d0080e7          	jalr	976(ra) # 8000165c <_Z4putcc>
    80002294:	02813083          	ld	ra,40(sp)
    80002298:	02013403          	ld	s0,32(sp)
    8000229c:	01813483          	ld	s1,24(sp)
    800022a0:	03010113          	addi	sp,sp,48
    800022a4:	00008067          	ret

00000000800022a8 <_ZN7_threadC1EPFvPvES0_>:
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
    800022b4:	00053823          	sd	zero,16(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    800022b8:	00006717          	auipc	a4,0x6
    800022bc:	d7870713          	addi	a4,a4,-648 # 80008030 <_ZN7_thread6nextIDE>
    800022c0:	00072783          	lw	a5,0(a4)
    800022c4:	0017869b          	addiw	a3,a5,1
    800022c8:	00d72023          	sw	a3,0(a4)
    800022cc:	00f52023          	sw	a5,0(a0)
    closed = 0;
    800022d0:	0a053783          	ld	a5,160(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    800022d4:	0015b593          	seqz	a1,a1
    800022d8:	00459593          	slli	a1,a1,0x4
    800022dc:	fe07f793          	andi	a5,a5,-32
    800022e0:	00b7e7b3          	or	a5,a5,a1
    reserved = 0;
    800022e4:	00005717          	auipc	a4,0x5
    800022e8:	dec73703          	ld	a4,-532(a4) # 800070d0 <CONSOLE_STATUS+0xc0>
    800022ec:	00e7f7b3          	and	a5,a5,a4
    800022f0:	0af53023          	sd	a5,160(a0)
    joinHead = 0;
    800022f4:	08053023          	sd	zero,128(a0)
    timeLeft = 0;
    800022f8:	08053823          	sd	zero,144(a0)
    stackStart = 0;
    800022fc:	08053c23          	sd	zero,152(a0)
    
    context.s0 = 0;
    80002300:	00053c23          	sd	zero,24(a0)
    context.s1 = 0;
    80002304:	02053023          	sd	zero,32(a0)
    context.s2 = 0;
    80002308:	02053423          	sd	zero,40(a0)
    context.s3 = 0;
    8000230c:	02053823          	sd	zero,48(a0)
    context.s4 = 0;
    80002310:	02053c23          	sd	zero,56(a0)
    context.s5 = 0;
    80002314:	04053023          	sd	zero,64(a0)
    context.s6 = 0;
    80002318:	04053423          	sd	zero,72(a0)
    context.s7 = 0;
    8000231c:	04053823          	sd	zero,80(a0)
    context.s8 = 0;
    80002320:	04053c23          	sd	zero,88(a0)
    context.s9 = 0;
    80002324:	06053023          	sd	zero,96(a0)
    context.s10 = 0;
    80002328:	06053423          	sd	zero,104(a0)
    context.s11 = 0;
    8000232c:	06053823          	sd	zero,112(a0)

    context.sstatus = 0;
    80002330:	06053c23          	sd	zero,120(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002334:	00000797          	auipc	a5,0x0
    80002338:	6f478793          	addi	a5,a5,1780 # 80002a28 <_ZN7_thread7wrapperEv>
    8000233c:	00f53423          	sd	a5,8(a0)
}
    80002340:	00813403          	ld	s0,8(sp)
    80002344:	01010113          	addi	sp,sp,16
    80002348:	00008067          	ret

000000008000234c <_Z10popSppSpieb>:

void popSppSpie(bool kernel = false){
    8000234c:	ff010113          	addi	sp,sp,-16
    80002350:	00813423          	sd	s0,8(sp)
    80002354:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002358:	14109073          	csrw	sepc,ra
    // if(kernel){
    //     __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    // }
    __asm__ volatile ("sret");
    8000235c:	10200073          	sret
}
    80002360:	00813403          	ld	s0,8(sp)
    80002364:	01010113          	addi	sp,sp,16
    80002368:	00008067          	ret

000000008000236c <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    8000236c:	fe010113          	addi	sp,sp,-32
    80002370:	00113c23          	sd	ra,24(sp)
    80002374:	00813823          	sd	s0,16(sp)
    80002378:	00913423          	sd	s1,8(sp)
    8000237c:	01213023          	sd	s2,0(sp)
    80002380:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80002384:	08053483          	ld	s1,128(a0)
    while(current != 0){
    80002388:	0c048e63          	beqz	s1,80002464 <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    8000238c:	0004c503          	lbu	a0,0(s1)
    80002390:	0014c783          	lbu	a5,1(s1)
    80002394:	00879793          	slli	a5,a5,0x8
    80002398:	00a7e7b3          	or	a5,a5,a0
    8000239c:	0024c503          	lbu	a0,2(s1)
    800023a0:	01051513          	slli	a0,a0,0x10
    800023a4:	00f567b3          	or	a5,a0,a5
    800023a8:	0034c503          	lbu	a0,3(s1)
    800023ac:	01851513          	slli	a0,a0,0x18
    800023b0:	00f56533          	or	a0,a0,a5
    800023b4:	0044c783          	lbu	a5,4(s1)
    800023b8:	02079793          	slli	a5,a5,0x20
    800023bc:	00a7e533          	or	a0,a5,a0
    800023c0:	0054c783          	lbu	a5,5(s1)
    800023c4:	02879793          	slli	a5,a5,0x28
    800023c8:	00a7e7b3          	or	a5,a5,a0
    800023cc:	0064c503          	lbu	a0,6(s1)
    800023d0:	03051513          	slli	a0,a0,0x30
    800023d4:	00f567b3          	or	a5,a0,a5
    800023d8:	0074c503          	lbu	a0,7(s1)
    800023dc:	03851513          	slli	a0,a0,0x38
    800023e0:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    800023e4:	0a053783          	ld	a5,160(a0)
    800023e8:	ffd7f793          	andi	a5,a5,-3
    800023ec:	0af53023          	sd	a5,160(a0)
        Scheduler::put(thread);
    800023f0:	00001097          	auipc	ra,0x1
    800023f4:	6c8080e7          	jalr	1736(ra) # 80003ab8 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    800023f8:	0084c903          	lbu	s2,8(s1)
    800023fc:	0094c783          	lbu	a5,9(s1)
    80002400:	00879793          	slli	a5,a5,0x8
    80002404:	0127e7b3          	or	a5,a5,s2
    80002408:	00a4c903          	lbu	s2,10(s1)
    8000240c:	01091913          	slli	s2,s2,0x10
    80002410:	00f967b3          	or	a5,s2,a5
    80002414:	00b4c903          	lbu	s2,11(s1)
    80002418:	01891913          	slli	s2,s2,0x18
    8000241c:	00f96933          	or	s2,s2,a5
    80002420:	00c4c783          	lbu	a5,12(s1)
    80002424:	02079793          	slli	a5,a5,0x20
    80002428:	0127e933          	or	s2,a5,s2
    8000242c:	00d4c783          	lbu	a5,13(s1)
    80002430:	02879793          	slli	a5,a5,0x28
    80002434:	0127e7b3          	or	a5,a5,s2
    80002438:	00e4c903          	lbu	s2,14(s1)
    8000243c:	03091913          	slli	s2,s2,0x30
    80002440:	00f967b3          	or	a5,s2,a5
    80002444:	00f4c903          	lbu	s2,15(s1)
    80002448:	03891913          	slli	s2,s2,0x38
    8000244c:	00f96933          	or	s2,s2,a5
        mem_free(current);
    80002450:	00048513          	mv	a0,s1
    80002454:	fffff097          	auipc	ra,0xfffff
    80002458:	fec080e7          	jalr	-20(ra) # 80001440 <_Z8mem_freePv>
        current = next;
    8000245c:	00090493          	mv	s1,s2
    while(current != 0){
    80002460:	f29ff06f          	j	80002388 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80002464:	01813083          	ld	ra,24(sp)
    80002468:	01013403          	ld	s0,16(sp)
    8000246c:	00813483          	ld	s1,8(sp)
    80002470:	00013903          	ld	s2,0(sp)
    80002474:	02010113          	addi	sp,sp,32
    80002478:	00008067          	ret

000000008000247c <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    8000247c:	fc010113          	addi	sp,sp,-64
    80002480:	02113c23          	sd	ra,56(sp)
    80002484:	02813823          	sd	s0,48(sp)
    80002488:	02913423          	sd	s1,40(sp)
    8000248c:	03213023          	sd	s2,32(sp)
    80002490:	01313c23          	sd	s3,24(sp)
    80002494:	01413823          	sd	s4,16(sp)
    80002498:	01513423          	sd	s5,8(sp)
    8000249c:	04010413          	addi	s0,sp,64
    800024a0:	00050493          	mv	s1,a0
    800024a4:	00058913          	mv	s2,a1
    800024a8:	00060a93          	mv	s5,a2
    800024ac:	00068993          	mv	s3,a3
    800024b0:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    800024b4:	0b800513          	li	a0,184
    800024b8:	fffff097          	auipc	ra,0xfffff
    800024bc:	f58080e7          	jalr	-168(ra) # 80001410 <_Z9mem_allocm>
    800024c0:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    800024c4:	18050063          	beqz	a0,80002644 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    800024c8:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    800024cc:	0004b783          	ld	a5,0(s1)
    800024d0:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    800024d4:	00006717          	auipc	a4,0x6
    800024d8:	b5c70713          	addi	a4,a4,-1188 # 80008030 <_ZN7_thread6nextIDE>
    800024dc:	00072783          	lw	a5,0(a4)
    800024e0:	0017869b          	addiw	a3,a5,1
    800024e4:	00d72023          	sw	a3,0(a4)
    800024e8:	0004b703          	ld	a4,0(s1)
    800024ec:	00f72023          	sw	a5,0(a4)
    (*thread)->closed = false;
    800024f0:	0004b703          	ld	a4,0(s1)
    800024f4:	0a073783          	ld	a5,160(a4)
    800024f8:	ffe7f793          	andi	a5,a5,-2
    800024fc:	0af73023          	sd	a5,160(a4)
    (*thread)->blocked = false;
    80002500:	0004b703          	ld	a4,0(s1)
    80002504:	0a073783          	ld	a5,160(a4)
    80002508:	ffd7f793          	andi	a5,a5,-3
    8000250c:	0af73023          	sd	a5,160(a4)
    (*thread)->sleeping = false;
    80002510:	0004b703          	ld	a4,0(s1)
    80002514:	0a073783          	ld	a5,160(a4)
    80002518:	ffb7f793          	andi	a5,a5,-5
    8000251c:	0af73023          	sd	a5,160(a4)
    (*thread)->finished = false;
    80002520:	0004b703          	ld	a4,0(s1)
    80002524:	0a073783          	ld	a5,160(a4)
    80002528:	ff77f793          	andi	a5,a5,-9
    8000252c:	0af73023          	sd	a5,160(a4)
    (*thread)->kernel = (function == 0);
    80002530:	0004b703          	ld	a4,0(s1)
    80002534:	00193913          	seqz	s2,s2
    80002538:	00491913          	slli	s2,s2,0x4
    8000253c:	0a073783          	ld	a5,160(a4)
    80002540:	fef7f793          	andi	a5,a5,-17
    80002544:	0127e933          	or	s2,a5,s2
    80002548:	0b273023          	sd	s2,160(a4)
    (*thread)->reserved = 0;
    8000254c:	0004b703          	ld	a4,0(s1)
    80002550:	0a073783          	ld	a5,160(a4)
    80002554:	00005697          	auipc	a3,0x5
    80002558:	b7c6b683          	ld	a3,-1156(a3) # 800070d0 <CONSOLE_STATUS+0xc0>
    8000255c:	00d7f7b3          	and	a5,a5,a3
    80002560:	0af73023          	sd	a5,160(a4)
    (*thread)->joinHead = 0;
    80002564:	0004b783          	ld	a5,0(s1)
    80002568:	0807b023          	sd	zero,128(a5)
    (*thread)->joinTail = 0;
    8000256c:	0004b783          	ld	a5,0(s1)
    80002570:	0807b423          	sd	zero,136(a5)
    (*thread)->timeLeft = 0;
    80002574:	0004b783          	ld	a5,0(s1)
    80002578:	0807b823          	sd	zero,144(a5)
    (*thread)->stackStart = 0;
    8000257c:	0004b783          	ld	a5,0(s1)
    80002580:	0807bc23          	sd	zero,152(a5)

    (*thread)->context.s0 = 0;
    80002584:	0004b783          	ld	a5,0(s1)
    80002588:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s1 = 0;
    8000258c:	0004b783          	ld	a5,0(s1)
    80002590:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s2 = 0;
    80002594:	0004b783          	ld	a5,0(s1)
    80002598:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s3 = 0;
    8000259c:	0004b783          	ld	a5,0(s1)
    800025a0:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s4 = 0;
    800025a4:	0004b783          	ld	a5,0(s1)
    800025a8:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s5 = 0;
    800025ac:	0004b783          	ld	a5,0(s1)
    800025b0:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s6 = 0;
    800025b4:	0004b783          	ld	a5,0(s1)
    800025b8:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s7 = 0;
    800025bc:	0004b783          	ld	a5,0(s1)
    800025c0:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s8 = 0;
    800025c4:	0004b783          	ld	a5,0(s1)
    800025c8:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s9 = 0;
    800025cc:	0004b783          	ld	a5,0(s1)
    800025d0:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s10 = 0;
    800025d4:	0004b783          	ld	a5,0(s1)
    800025d8:	0607b423          	sd	zero,104(a5)
    (*thread)->context.s11 = 0;
    800025dc:	0004b783          	ld	a5,0(s1)
    800025e0:	0607b823          	sd	zero,112(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    800025e4:	0004b783          	ld	a5,0(s1)
    800025e8:	0137b823          	sd	s3,16(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    800025ec:	0004b783          	ld	a5,0(s1)
    800025f0:	00000717          	auipc	a4,0x0
    800025f4:	43870713          	addi	a4,a4,1080 # 80002a28 <_ZN7_thread7wrapperEv>
    800025f8:	00e7b423          	sd	a4,8(a5)

    (*thread)->stackStart = stack;
    800025fc:	0004b783          	ld	a5,0(s1)
    80002600:	0937bc23          	sd	s3,152(a5)
    if(start){
    80002604:	020a1663          	bnez	s4,80002630 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    80002608:	00000513          	li	a0,0
}
    8000260c:	03813083          	ld	ra,56(sp)
    80002610:	03013403          	ld	s0,48(sp)
    80002614:	02813483          	ld	s1,40(sp)
    80002618:	02013903          	ld	s2,32(sp)
    8000261c:	01813983          	ld	s3,24(sp)
    80002620:	01013a03          	ld	s4,16(sp)
    80002624:	00813a83          	ld	s5,8(sp)
    80002628:	04010113          	addi	sp,sp,64
    8000262c:	00008067          	ret
        Scheduler::put(*thread);
    80002630:	0004b503          	ld	a0,0(s1)
    80002634:	00001097          	auipc	ra,0x1
    80002638:	484080e7          	jalr	1156(ra) # 80003ab8 <_ZN9Scheduler3putEP7_thread>
    return 0;
    8000263c:	00000513          	li	a0,0
    80002640:	fcdff06f          	j	8000260c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    80002644:	fff00513          	li	a0,-1
    80002648:	fc5ff06f          	j	8000260c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

000000008000264c <_ZN7_thread10setBlockedEb>:
    currentThread->finished = 1;
    dispatch();
    return 0;
}

void _thread::setBlocked(bool blocked){
    8000264c:	ff010113          	addi	sp,sp,-16
    80002650:	00813423          	sd	s0,8(sp)
    80002654:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80002658:	0015f593          	andi	a1,a1,1
    8000265c:	00159793          	slli	a5,a1,0x1
    80002660:	0a053583          	ld	a1,160(a0)
    80002664:	ffd5f593          	andi	a1,a1,-3
    80002668:	00f5e5b3          	or	a1,a1,a5
    8000266c:	0ab53023          	sd	a1,160(a0)
}
    80002670:	00813403          	ld	s0,8(sp)
    80002674:	01010113          	addi	sp,sp,16
    80002678:	00008067          	ret

000000008000267c <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    8000267c:	ff010113          	addi	sp,sp,-16
    80002680:	00813423          	sd	s0,8(sp)
    80002684:	01010413          	addi	s0,sp,16
    this->closed = closed;
    80002688:	0015f793          	andi	a5,a1,1
    8000268c:	0a053583          	ld	a1,160(a0)
    80002690:	ffe5f593          	andi	a1,a1,-2
    80002694:	00f5e5b3          	or	a1,a1,a5
    80002698:	0ab53023          	sd	a1,160(a0)
}
    8000269c:	00813403          	ld	s0,8(sp)
    800026a0:	01010113          	addi	sp,sp,16
    800026a4:	00008067          	ret

00000000800026a8 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    800026a8:	ff010113          	addi	sp,sp,-16
    800026ac:	00813423          	sd	s0,8(sp)
    800026b0:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    800026b4:	0015f593          	andi	a1,a1,1
    800026b8:	00259793          	slli	a5,a1,0x2
    800026bc:	0a053583          	ld	a1,160(a0)
    800026c0:	ffb5f593          	andi	a1,a1,-5
    800026c4:	00f5e5b3          	or	a1,a1,a5
    800026c8:	0ab53023          	sd	a1,160(a0)
}
    800026cc:	00813403          	ld	s0,8(sp)
    800026d0:	01010113          	addi	sp,sp,16
    800026d4:	00008067          	ret

00000000800026d8 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
    __putc('\n');
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    __putc('.');
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    800026d8:	ff010113          	addi	sp,sp,-16
    800026dc:	00813423          	sd	s0,8(sp)
    800026e0:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    800026e4:	04050263          	beqz	a0,80002728 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    800026e8:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    800026ec:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    800026f0:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    800026f4:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    800026f8:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    800026fc:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    80002700:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    80002704:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    80002708:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    8000270c:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    80002710:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    80002714:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    80002718:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    8000271c:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80002720:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    80002724:	06853823          	sd	s0,112(a0)
    //         __putc('a' + digit - 10);
    //     }
    // }
    // __putc('\n');
    
    if(newContext->sp != 0){
    80002728:	0085b783          	ld	a5,8(a1)
    8000272c:	00078463          	beqz	a5,80002734 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    80002730:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    80002734:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    80002738:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    8000273c:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80002740:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    80002744:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80002748:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    8000274c:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80002750:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80002754:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80002758:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    8000275c:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    80002760:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    80002764:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    80002768:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    8000276c:	0685bd83          	ld	s11,104(a1)

    return;

}
    80002770:	00813403          	ld	s0,8(sp)
    80002774:	01010113          	addi	sp,sp,16
    80002778:	00008067          	ret

000000008000277c <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    8000277c:	fe010113          	addi	sp,sp,-32
    80002780:	00113c23          	sd	ra,24(sp)
    80002784:	00813823          	sd	s0,16(sp)
    80002788:	00913423          	sd	s1,8(sp)
    8000278c:	01213023          	sd	s2,0(sp)
    80002790:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    80002794:	00006917          	auipc	s2,0x6
    80002798:	89c90913          	addi	s2,s2,-1892 # 80008030 <_ZN7_thread6nextIDE>
    8000279c:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    800027a0:	00001097          	auipc	ra,0x1
    800027a4:	508080e7          	jalr	1288(ra) # 80003ca8 <_ZN9Scheduler3getEv>
    800027a8:	00a93423          	sd	a0,8(s2)
    if(currentThread == nullptr){
    800027ac:	0a050263          	beqz	a0,80002850 <_ZN7_thread8dispatchEv+0xd4>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    800027b0:	00048863          	beqz	s1,800027c0 <_ZN7_thread8dispatchEv+0x44>
    800027b4:	0a04b783          	ld	a5,160(s1)
    800027b8:	00f7f793          	andi	a5,a5,15
    800027bc:	0a078063          	beqz	a5,8000285c <_ZN7_thread8dispatchEv+0xe0>
    __putc('d');
    800027c0:	06400513          	li	a0,100
    800027c4:	00003097          	auipc	ra,0x3
    800027c8:	728080e7          	jalr	1832(ra) # 80005eec <__putc>
    if(oldThread != 0){
    800027cc:	00048c63          	beqz	s1,800027e4 <_ZN7_thread8dispatchEv+0x68>
        __putc('0' + oldThread->ID);
    800027d0:	0004a503          	lw	a0,0(s1)
    800027d4:	0305051b          	addiw	a0,a0,48
    800027d8:	0ff57513          	andi	a0,a0,255
    800027dc:	00003097          	auipc	ra,0x3
    800027e0:	710080e7          	jalr	1808(ra) # 80005eec <__putc>
    __putc('0' + currentThread->ID);
    800027e4:	00006797          	auipc	a5,0x6
    800027e8:	8547b783          	ld	a5,-1964(a5) # 80008038 <_ZN7_thread13currentThreadE>
    800027ec:	0007a503          	lw	a0,0(a5)
    800027f0:	0305051b          	addiw	a0,a0,48
    800027f4:	0ff57513          	andi	a0,a0,255
    800027f8:	00003097          	auipc	ra,0x3
    800027fc:	6f4080e7          	jalr	1780(ra) # 80005eec <__putc>
    __putc('\n');
    80002800:	00a00513          	li	a0,10
    80002804:	00003097          	auipc	ra,0x3
    80002808:	6e8080e7          	jalr	1768(ra) # 80005eec <__putc>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    8000280c:	00048463          	beqz	s1,80002814 <_ZN7_thread8dispatchEv+0x98>
    80002810:	00848493          	addi	s1,s1,8
    80002814:	00006597          	auipc	a1,0x6
    80002818:	8245b583          	ld	a1,-2012(a1) # 80008038 <_ZN7_thread13currentThreadE>
    8000281c:	00858593          	addi	a1,a1,8
    80002820:	00048513          	mv	a0,s1
    80002824:	00000097          	auipc	ra,0x0
    80002828:	eb4080e7          	jalr	-332(ra) # 800026d8 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
    __putc('.');
    8000282c:	02e00513          	li	a0,46
    80002830:	00003097          	auipc	ra,0x3
    80002834:	6bc080e7          	jalr	1724(ra) # 80005eec <__putc>
}
    80002838:	01813083          	ld	ra,24(sp)
    8000283c:	01013403          	ld	s0,16(sp)
    80002840:	00813483          	ld	s1,8(sp)
    80002844:	00013903          	ld	s2,0(sp)
    80002848:	02010113          	addi	sp,sp,32
    8000284c:	00008067          	ret
        currentThread = oldThread;
    80002850:	00005797          	auipc	a5,0x5
    80002854:	7e97b423          	sd	s1,2024(a5) # 80008038 <_ZN7_thread13currentThreadE>
        return;
    80002858:	fe1ff06f          	j	80002838 <_ZN7_thread8dispatchEv+0xbc>
            Scheduler::put(oldThread);
    8000285c:	00048513          	mv	a0,s1
    80002860:	00001097          	auipc	ra,0x1
    80002864:	258080e7          	jalr	600(ra) # 80003ab8 <_ZN9Scheduler3putEP7_thread>
    80002868:	f59ff06f          	j	800027c0 <_ZN7_thread8dispatchEv+0x44>

000000008000286c <_ZN7_thread4joinEPS_>:
    if(thread->finished || thread->closed){
    8000286c:	0a05b783          	ld	a5,160(a1)
    80002870:	0097f793          	andi	a5,a5,9
    80002874:	00078463          	beqz	a5,8000287c <_ZN7_thread4joinEPS_+0x10>
    80002878:	00008067          	ret
void _thread::join(thread_t thread){
    8000287c:	fe010113          	addi	sp,sp,-32
    80002880:	00113c23          	sd	ra,24(sp)
    80002884:	00813823          	sd	s0,16(sp)
    80002888:	00913423          	sd	s1,8(sp)
    8000288c:	01213023          	sd	s2,0(sp)
    80002890:	02010413          	addi	s0,sp,32
    80002894:	00050493          	mv	s1,a0
    80002898:	00058913          	mv	s2,a1
    __putc('j');
    8000289c:	06a00513          	li	a0,106
    800028a0:	00003097          	auipc	ra,0x3
    800028a4:	64c080e7          	jalr	1612(ra) # 80005eec <__putc>
    __putc('0' + thread->ID);
    800028a8:	00092503          	lw	a0,0(s2)
    800028ac:	0305051b          	addiw	a0,a0,48
    800028b0:	0ff57513          	andi	a0,a0,255
    800028b4:	00003097          	auipc	ra,0x3
    800028b8:	638080e7          	jalr	1592(ra) # 80005eec <__putc>
    __putc('\n');
    800028bc:	00a00513          	li	a0,10
    800028c0:	00003097          	auipc	ra,0x3
    800028c4:	62c080e7          	jalr	1580(ra) # 80005eec <__putc>
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    800028c8:	01000513          	li	a0,16
    800028cc:	fffff097          	auipc	ra,0xfffff
    800028d0:	b44080e7          	jalr	-1212(ra) # 80001410 <_Z9mem_allocm>
    this->blocked = true;
    800028d4:	0a04b703          	ld	a4,160(s1)
    800028d8:	00276713          	ori	a4,a4,2
    800028dc:	0ae4b023          	sd	a4,160(s1)
    newJoin->thread = this;
    800028e0:	00950023          	sb	s1,0(a0)
    800028e4:	0084d713          	srli	a4,s1,0x8
    800028e8:	00e500a3          	sb	a4,1(a0)
    800028ec:	0104d713          	srli	a4,s1,0x10
    800028f0:	00e50123          	sb	a4,2(a0)
    800028f4:	0184d71b          	srliw	a4,s1,0x18
    800028f8:	00e501a3          	sb	a4,3(a0)
    800028fc:	0204d713          	srli	a4,s1,0x20
    80002900:	00e50223          	sb	a4,4(a0)
    80002904:	0284d713          	srli	a4,s1,0x28
    80002908:	00e502a3          	sb	a4,5(a0)
    8000290c:	0304d713          	srli	a4,s1,0x30
    80002910:	00e50323          	sb	a4,6(a0)
    80002914:	0384d493          	srli	s1,s1,0x38
    80002918:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    8000291c:	00050423          	sb	zero,8(a0)
    80002920:	000504a3          	sb	zero,9(a0)
    80002924:	00050523          	sb	zero,10(a0)
    80002928:	000505a3          	sb	zero,11(a0)
    8000292c:	00050623          	sb	zero,12(a0)
    80002930:	000506a3          	sb	zero,13(a0)
    80002934:	00050723          	sb	zero,14(a0)
    80002938:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    8000293c:	08093703          	ld	a4,128(s2)
    80002940:	06070463          	beqz	a4,800029a8 <_ZN7_thread4joinEPS_+0x13c>
        thread->joinTail->next = newJoin;
    80002944:	08893703          	ld	a4,136(s2)
    80002948:	00a70423          	sb	a0,8(a4)
    8000294c:	00855693          	srli	a3,a0,0x8
    80002950:	00d704a3          	sb	a3,9(a4)
    80002954:	01055693          	srli	a3,a0,0x10
    80002958:	00d70523          	sb	a3,10(a4)
    8000295c:	0185569b          	srliw	a3,a0,0x18
    80002960:	00d705a3          	sb	a3,11(a4)
    80002964:	02055693          	srli	a3,a0,0x20
    80002968:	00d70623          	sb	a3,12(a4)
    8000296c:	02855693          	srli	a3,a0,0x28
    80002970:	00d706a3          	sb	a3,13(a4)
    80002974:	03055693          	srli	a3,a0,0x30
    80002978:	00d70723          	sb	a3,14(a4)
    8000297c:	03855693          	srli	a3,a0,0x38
    80002980:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    80002984:	08a93423          	sd	a0,136(s2)
    dispatch();
    80002988:	00000097          	auipc	ra,0x0
    8000298c:	df4080e7          	jalr	-524(ra) # 8000277c <_ZN7_thread8dispatchEv>
}
    80002990:	01813083          	ld	ra,24(sp)
    80002994:	01013403          	ld	s0,16(sp)
    80002998:	00813483          	ld	s1,8(sp)
    8000299c:	00013903          	ld	s2,0(sp)
    800029a0:	02010113          	addi	sp,sp,32
    800029a4:	00008067          	ret
        thread->joinHead = newJoin;
    800029a8:	08a93023          	sd	a0,128(s2)
        thread->joinTail = newJoin;
    800029ac:	08a93423          	sd	a0,136(s2)
    800029b0:	fd9ff06f          	j	80002988 <_ZN7_thread4joinEPS_+0x11c>

00000000800029b4 <_ZN7_thread4exitEv>:
    if(currentThread->closed){
    800029b4:	00005717          	auipc	a4,0x5
    800029b8:	68473703          	ld	a4,1668(a4) # 80008038 <_ZN7_thread13currentThreadE>
    800029bc:	0a073783          	ld	a5,160(a4)
    800029c0:	0017f693          	andi	a3,a5,1
    800029c4:	04069663          	bnez	a3,80002a10 <_ZN7_thread4exitEv+0x5c>
    if(currentThread->blocked){
    800029c8:	0027f693          	andi	a3,a5,2
    800029cc:	04069663          	bnez	a3,80002a18 <_ZN7_thread4exitEv+0x64>
    if(currentThread->sleeping){
    800029d0:	0047f793          	andi	a5,a5,4
    800029d4:	04079663          	bnez	a5,80002a20 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    800029d8:	ff010113          	addi	sp,sp,-16
    800029dc:	00113423          	sd	ra,8(sp)
    800029e0:	00813023          	sd	s0,0(sp)
    800029e4:	01010413          	addi	s0,sp,16
    currentThread->finished = 1;
    800029e8:	0a073783          	ld	a5,160(a4)
    800029ec:	0087e793          	ori	a5,a5,8
    800029f0:	0af73023          	sd	a5,160(a4)
    dispatch();
    800029f4:	00000097          	auipc	ra,0x0
    800029f8:	d88080e7          	jalr	-632(ra) # 8000277c <_ZN7_thread8dispatchEv>
    return 0;
    800029fc:	00000513          	li	a0,0
}
    80002a00:	00813083          	ld	ra,8(sp)
    80002a04:	00013403          	ld	s0,0(sp)
    80002a08:	01010113          	addi	sp,sp,16
    80002a0c:	00008067          	ret
        return -1;
    80002a10:	fff00513          	li	a0,-1
    80002a14:	00008067          	ret
        return -2;
    80002a18:	ffe00513          	li	a0,-2
    80002a1c:	00008067          	ret
        return -3;
    80002a20:	ffd00513          	li	a0,-3
}
    80002a24:	00008067          	ret

0000000080002a28 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80002a28:	fe010113          	addi	sp,sp,-32
    80002a2c:	00113c23          	sd	ra,24(sp)
    80002a30:	00813823          	sd	s0,16(sp)
    80002a34:	00913423          	sd	s1,8(sp)
    80002a38:	02010413          	addi	s0,sp,32
    popSppSpie(currentThread->kernel);
    80002a3c:	00005497          	auipc	s1,0x5
    80002a40:	5f448493          	addi	s1,s1,1524 # 80008030 <_ZN7_thread6nextIDE>
    80002a44:	0084b783          	ld	a5,8(s1)
    80002a48:	0a07b503          	ld	a0,160(a5)
    80002a4c:	00455513          	srli	a0,a0,0x4
    80002a50:	00157513          	andi	a0,a0,1
    80002a54:	00000097          	auipc	ra,0x0
    80002a58:	8f8080e7          	jalr	-1800(ra) # 8000234c <_Z10popSppSpieb>
    currentThread->function(currentThread->arg);
    80002a5c:	0084b783          	ld	a5,8(s1)
    80002a60:	0a87b703          	ld	a4,168(a5)
    80002a64:	0b07b503          	ld	a0,176(a5)
    80002a68:	000700e7          	jalr	a4
    currentThread->unJoin();
    80002a6c:	0084b503          	ld	a0,8(s1)
    80002a70:	00000097          	auipc	ra,0x0
    80002a74:	8fc080e7          	jalr	-1796(ra) # 8000236c <_ZN7_thread6unJoinEv>
    exit();
    80002a78:	00000097          	auipc	ra,0x0
    80002a7c:	f3c080e7          	jalr	-196(ra) # 800029b4 <_ZN7_thread4exitEv>
}
    80002a80:	01813083          	ld	ra,24(sp)
    80002a84:	01013403          	ld	s0,16(sp)
    80002a88:	00813483          	ld	s1,8(sp)
    80002a8c:	02010113          	addi	sp,sp,32
    80002a90:	00008067          	ret

0000000080002a94 <_ZN11HeapManagerC1Ev>:
#include "hw.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80002a94:	fe010113          	addi	sp,sp,-32
    80002a98:	00113c23          	sd	ra,24(sp)
    80002a9c:	00813823          	sd	s0,16(sp)
    80002aa0:	00913423          	sd	s1,8(sp)
    80002aa4:	02010413          	addi	s0,sp,32
    80002aa8:	00050493          	mv	s1,a0
    assert(instance == 0);
    80002aac:	00005797          	auipc	a5,0x5
    80002ab0:	5947b783          	ld	a5,1428(a5) # 80008040 <_ZN11HeapManager8instanceE>
    80002ab4:	02079063          	bnez	a5,80002ad4 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80002ab8:	00005797          	auipc	a5,0x5
    80002abc:	5897b423          	sd	s1,1416(a5) # 80008040 <_ZN11HeapManager8instanceE>
}
    80002ac0:	01813083          	ld	ra,24(sp)
    80002ac4:	01013403          	ld	s0,16(sp)
    80002ac8:	00813483          	ld	s1,8(sp)
    80002acc:	02010113          	addi	sp,sp,32
    80002ad0:	00008067          	ret
    assert(instance == 0);
    80002ad4:	00004697          	auipc	a3,0x4
    80002ad8:	60468693          	addi	a3,a3,1540 # 800070d8 <CONSOLE_STATUS+0xc8>
    80002adc:	01300613          	li	a2,19
    80002ae0:	00004597          	auipc	a1,0x4
    80002ae4:	61858593          	addi	a1,a1,1560 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002ae8:	00004517          	auipc	a0,0x4
    80002aec:	55850513          	addi	a0,a0,1368 # 80007040 <CONSOLE_STATUS+0x30>
    80002af0:	fffff097          	auipc	ra,0xfffff
    80002af4:	e84080e7          	jalr	-380(ra) # 80001974 <_Z13assert_failedPKcS0_jS0_>
    80002af8:	fc1ff06f          	j	80002ab8 <_ZN11HeapManagerC1Ev+0x24>

0000000080002afc <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80002afc:	ff010113          	addi	sp,sp,-16
    80002b00:	00813423          	sd	s0,8(sp)
    80002b04:	01010413          	addi	s0,sp,16
    
}
    80002b08:	00813403          	ld	s0,8(sp)
    80002b0c:	01010113          	addi	sp,sp,16
    80002b10:	00008067          	ret

0000000080002b14 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uintptr_t nStart, size_t nEnd){
    80002b14:	fd010113          	addi	sp,sp,-48
    80002b18:	02113423          	sd	ra,40(sp)
    80002b1c:	02813023          	sd	s0,32(sp)
    80002b20:	00913c23          	sd	s1,24(sp)
    80002b24:	01213823          	sd	s2,16(sp)
    80002b28:	01313423          	sd	s3,8(sp)
    80002b2c:	03010413          	addi	s0,sp,48
    80002b30:	00050993          	mv	s3,a0
    80002b34:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002b38:	40b604b3          	sub	s1,a2,a1
    80002b3c:	0414b793          	sltiu	a5,s1,65
    80002b40:	0c079863          	bnez	a5,80002c10 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80002b44:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80002b48:	fde00793          	li	a5,-34
    80002b4c:	00f90c23          	sb	a5,24(s2)
    80002b50:	fc000713          	li	a4,-64
    80002b54:	00e90ca3          	sb	a4,25(s2)
    80002b58:	fad00713          	li	a4,-83
    80002b5c:	00e90d23          	sb	a4,26(s2)
    80002b60:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart - MEM_BLOCK_SIZE) / MEM_BLOCK_SIZE;
    80002b64:	fc048613          	addi	a2,s1,-64
    80002b68:	0009b783          	ld	a5,0(s3)
    80002b6c:	00665713          	srli	a4,a2,0x6
    80002b70:	00e78823          	sb	a4,16(a5)
    80002b74:	00e65713          	srli	a4,a2,0xe
    80002b78:	00e788a3          	sb	a4,17(a5)
    80002b7c:	01665713          	srli	a4,a2,0x16
    80002b80:	00e78923          	sb	a4,18(a5)
    80002b84:	01e65713          	srli	a4,a2,0x1e
    80002b88:	00e789a3          	sb	a4,19(a5)
    80002b8c:	02665713          	srli	a4,a2,0x26
    80002b90:	00e78a23          	sb	a4,20(a5)
    80002b94:	02e65713          	srli	a4,a2,0x2e
    80002b98:	00e78aa3          	sb	a4,21(a5)
    80002b9c:	03665713          	srli	a4,a2,0x36
    80002ba0:	00e78b23          	sb	a4,22(a5)
    80002ba4:	03e65613          	srli	a2,a2,0x3e
    80002ba8:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80002bac:	0009b783          	ld	a5,0(s3)
    80002bb0:	00078023          	sb	zero,0(a5)
    80002bb4:	000780a3          	sb	zero,1(a5)
    80002bb8:	00078123          	sb	zero,2(a5)
    80002bbc:	000781a3          	sb	zero,3(a5)
    80002bc0:	00078223          	sb	zero,4(a5)
    80002bc4:	000782a3          	sb	zero,5(a5)
    80002bc8:	00078323          	sb	zero,6(a5)
    80002bcc:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80002bd0:	0009b783          	ld	a5,0(s3)
    80002bd4:	00078423          	sb	zero,8(a5)
    80002bd8:	000784a3          	sb	zero,9(a5)
    80002bdc:	00078523          	sb	zero,10(a5)
    80002be0:	000785a3          	sb	zero,11(a5)
    80002be4:	00078623          	sb	zero,12(a5)
    80002be8:	000786a3          	sb	zero,13(a5)
    80002bec:	00078723          	sb	zero,14(a5)
    80002bf0:	000787a3          	sb	zero,15(a5)
}
    80002bf4:	02813083          	ld	ra,40(sp)
    80002bf8:	02013403          	ld	s0,32(sp)
    80002bfc:	01813483          	ld	s1,24(sp)
    80002c00:	01013903          	ld	s2,16(sp)
    80002c04:	00813983          	ld	s3,8(sp)
    80002c08:	03010113          	addi	sp,sp,48
    80002c0c:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80002c10:	00004697          	auipc	a3,0x4
    80002c14:	50068693          	addi	a3,a3,1280 # 80007110 <CONSOLE_STATUS+0x100>
    80002c18:	01c00613          	li	a2,28
    80002c1c:	00004597          	auipc	a1,0x4
    80002c20:	4dc58593          	addi	a1,a1,1244 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002c24:	00004517          	auipc	a0,0x4
    80002c28:	51c50513          	addi	a0,a0,1308 # 80007140 <CONSOLE_STATUS+0x130>
    80002c2c:	fffff097          	auipc	ra,0xfffff
    80002c30:	d48080e7          	jalr	-696(ra) # 80001974 <_Z13assert_failedPKcS0_jS0_>
    80002c34:	f11ff06f          	j	80002b44 <_ZN11HeapManager4initEmm+0x30>

0000000080002c38 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80002c38:	fe010113          	addi	sp,sp,-32
    80002c3c:	00113c23          	sd	ra,24(sp)
    80002c40:	00813823          	sd	s0,16(sp)
    80002c44:	00913423          	sd	s1,8(sp)
    80002c48:	01213023          	sd	s2,0(sp)
    80002c4c:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002c50:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80002c54:	00000913          	li	s2,0
    80002c58:	0b80006f          	j	80002d10 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        /// how is this an illegal read???
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80002c5c:	0104c783          	lbu	a5,16(s1)
    80002c60:	0114c703          	lbu	a4,17(s1)
    80002c64:	00871713          	slli	a4,a4,0x8
    80002c68:	00f76733          	or	a4,a4,a5
    80002c6c:	0124c783          	lbu	a5,18(s1)
    80002c70:	01079793          	slli	a5,a5,0x10
    80002c74:	00e7e733          	or	a4,a5,a4
    80002c78:	0134c783          	lbu	a5,19(s1)
    80002c7c:	01879793          	slli	a5,a5,0x18
    80002c80:	00e7e7b3          	or	a5,a5,a4
    80002c84:	0144c703          	lbu	a4,20(s1)
    80002c88:	02071713          	slli	a4,a4,0x20
    80002c8c:	00f767b3          	or	a5,a4,a5
    80002c90:	0154c703          	lbu	a4,21(s1)
    80002c94:	02871713          	slli	a4,a4,0x28
    80002c98:	00f76733          	or	a4,a4,a5
    80002c9c:	0164c783          	lbu	a5,22(s1)
    80002ca0:	03079793          	slli	a5,a5,0x30
    80002ca4:	00e7e733          	or	a4,a5,a4
    80002ca8:	0174c783          	lbu	a5,23(s1)
    80002cac:	03879793          	slli	a5,a5,0x38
    80002cb0:	00e7e7b3          	or	a5,a5,a4
    80002cb4:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80002cb8:	0004c703          	lbu	a4,0(s1)
    80002cbc:	0014c783          	lbu	a5,1(s1)
    80002cc0:	00879793          	slli	a5,a5,0x8
    80002cc4:	00e7e733          	or	a4,a5,a4
    80002cc8:	0024c783          	lbu	a5,2(s1)
    80002ccc:	01079793          	slli	a5,a5,0x10
    80002cd0:	00e7e7b3          	or	a5,a5,a4
    80002cd4:	0034c703          	lbu	a4,3(s1)
    80002cd8:	01871713          	slli	a4,a4,0x18
    80002cdc:	00f767b3          	or	a5,a4,a5
    80002ce0:	0044c703          	lbu	a4,4(s1)
    80002ce4:	02071713          	slli	a4,a4,0x20
    80002ce8:	00f76733          	or	a4,a4,a5
    80002cec:	0054c783          	lbu	a5,5(s1)
    80002cf0:	02879793          	slli	a5,a5,0x28
    80002cf4:	00e7e733          	or	a4,a5,a4
    80002cf8:	0064c783          	lbu	a5,6(s1)
    80002cfc:	03079793          	slli	a5,a5,0x30
    80002d00:	00e7e7b3          	or	a5,a5,a4
    80002d04:	0074c483          	lbu	s1,7(s1)
    80002d08:	03849493          	slli	s1,s1,0x38
    80002d0c:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002d10:	06048263          	beqz	s1,80002d74 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002d14:	0184c783          	lbu	a5,24(s1)
    80002d18:	0194c703          	lbu	a4,25(s1)
    80002d1c:	00871713          	slli	a4,a4,0x8
    80002d20:	00f76733          	or	a4,a4,a5
    80002d24:	01a4c783          	lbu	a5,26(s1)
    80002d28:	01079793          	slli	a5,a5,0x10
    80002d2c:	00e7e733          	or	a4,a5,a4
    80002d30:	01b4c783          	lbu	a5,27(s1)
    80002d34:	01879793          	slli	a5,a5,0x18
    80002d38:	00e7e7b3          	or	a5,a5,a4
    80002d3c:	0007879b          	sext.w	a5,a5
    80002d40:	deadc737          	lui	a4,0xdeadc
    80002d44:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2e2e>
    80002d48:	f0e78ae3          	beq	a5,a4,80002c5c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80002d4c:	00004697          	auipc	a3,0x4
    80002d50:	41468693          	addi	a3,a3,1044 # 80007160 <CONSOLE_STATUS+0x150>
    80002d54:	02a00613          	li	a2,42
    80002d58:	00004597          	auipc	a1,0x4
    80002d5c:	3a058593          	addi	a1,a1,928 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002d60:	00004517          	auipc	a0,0x4
    80002d64:	42850513          	addi	a0,a0,1064 # 80007188 <CONSOLE_STATUS+0x178>
    80002d68:	fffff097          	auipc	ra,0xfffff
    80002d6c:	c0c080e7          	jalr	-1012(ra) # 80001974 <_Z13assert_failedPKcS0_jS0_>
    80002d70:	eedff06f          	j	80002c5c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80002d74:	00090513          	mv	a0,s2
    80002d78:	01813083          	ld	ra,24(sp)
    80002d7c:	01013403          	ld	s0,16(sp)
    80002d80:	00813483          	ld	s1,8(sp)
    80002d84:	00013903          	ld	s2,0(sp)
    80002d88:	02010113          	addi	sp,sp,32
    80002d8c:	00008067          	ret

0000000080002d90 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80002d90:	fd010113          	addi	sp,sp,-48
    80002d94:	02113423          	sd	ra,40(sp)
    80002d98:	02813023          	sd	s0,32(sp)
    80002d9c:	00913c23          	sd	s1,24(sp)
    80002da0:	01213823          	sd	s2,16(sp)
    80002da4:	01313423          	sd	s3,8(sp)
    80002da8:	03010413          	addi	s0,sp,48
    80002dac:	00050993          	mv	s3,a0
    80002db0:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80002db4:	00053483          	ld	s1,0(a0)
    80002db8:	0b80006f          	j	80002e70 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80002dbc:	0104c783          	lbu	a5,16(s1)
    80002dc0:	0114c703          	lbu	a4,17(s1)
    80002dc4:	00871713          	slli	a4,a4,0x8
    80002dc8:	00f76733          	or	a4,a4,a5
    80002dcc:	0124c783          	lbu	a5,18(s1)
    80002dd0:	01079793          	slli	a5,a5,0x10
    80002dd4:	00e7e733          	or	a4,a5,a4
    80002dd8:	0134c783          	lbu	a5,19(s1)
    80002ddc:	01879793          	slli	a5,a5,0x18
    80002de0:	00e7e7b3          	or	a5,a5,a4
    80002de4:	0144c703          	lbu	a4,20(s1)
    80002de8:	02071713          	slli	a4,a4,0x20
    80002dec:	00f767b3          	or	a5,a4,a5
    80002df0:	0154c703          	lbu	a4,21(s1)
    80002df4:	02871713          	slli	a4,a4,0x28
    80002df8:	00f76733          	or	a4,a4,a5
    80002dfc:	0164c783          	lbu	a5,22(s1)
    80002e00:	03079793          	slli	a5,a5,0x30
    80002e04:	00e7e733          	or	a4,a5,a4
    80002e08:	0174c783          	lbu	a5,23(s1)
    80002e0c:	03879793          	slli	a5,a5,0x38
    80002e10:	00e7e7b3          	or	a5,a5,a4
    80002e14:	0d27f063          	bgeu	a5,s2,80002ed4 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80002e18:	0004c703          	lbu	a4,0(s1)
    80002e1c:	0014c783          	lbu	a5,1(s1)
    80002e20:	00879793          	slli	a5,a5,0x8
    80002e24:	00e7e733          	or	a4,a5,a4
    80002e28:	0024c783          	lbu	a5,2(s1)
    80002e2c:	01079793          	slli	a5,a5,0x10
    80002e30:	00e7e7b3          	or	a5,a5,a4
    80002e34:	0034c703          	lbu	a4,3(s1)
    80002e38:	01871713          	slli	a4,a4,0x18
    80002e3c:	00f767b3          	or	a5,a4,a5
    80002e40:	0044c703          	lbu	a4,4(s1)
    80002e44:	02071713          	slli	a4,a4,0x20
    80002e48:	00f76733          	or	a4,a4,a5
    80002e4c:	0054c783          	lbu	a5,5(s1)
    80002e50:	02879793          	slli	a5,a5,0x28
    80002e54:	00e7e733          	or	a4,a5,a4
    80002e58:	0064c783          	lbu	a5,6(s1)
    80002e5c:	03079793          	slli	a5,a5,0x30
    80002e60:	00e7e7b3          	or	a5,a5,a4
    80002e64:	0074c483          	lbu	s1,7(s1)
    80002e68:	03849493          	slli	s1,s1,0x38
    80002e6c:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80002e70:	4e048c63          	beqz	s1,80003368 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80002e74:	0184c783          	lbu	a5,24(s1)
    80002e78:	0194c703          	lbu	a4,25(s1)
    80002e7c:	00871713          	slli	a4,a4,0x8
    80002e80:	00f76733          	or	a4,a4,a5
    80002e84:	01a4c783          	lbu	a5,26(s1)
    80002e88:	01079793          	slli	a5,a5,0x10
    80002e8c:	00e7e733          	or	a4,a5,a4
    80002e90:	01b4c783          	lbu	a5,27(s1)
    80002e94:	01879793          	slli	a5,a5,0x18
    80002e98:	00e7e7b3          	or	a5,a5,a4
    80002e9c:	0007879b          	sext.w	a5,a5
    80002ea0:	deadc737          	lui	a4,0xdeadc
    80002ea4:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5ead2e2e>
    80002ea8:	f0e78ae3          	beq	a5,a4,80002dbc <_ZN11HeapManager12heapAllocateEm+0x2c>
    80002eac:	00004697          	auipc	a3,0x4
    80002eb0:	30468693          	addi	a3,a3,772 # 800071b0 <CONSOLE_STATUS+0x1a0>
    80002eb4:	03400613          	li	a2,52
    80002eb8:	00004597          	auipc	a1,0x4
    80002ebc:	24058593          	addi	a1,a1,576 # 800070f8 <CONSOLE_STATUS+0xe8>
    80002ec0:	00004517          	auipc	a0,0x4
    80002ec4:	2c850513          	addi	a0,a0,712 # 80007188 <CONSOLE_STATUS+0x178>
    80002ec8:	fffff097          	auipc	ra,0xfffff
    80002ecc:	aac080e7          	jalr	-1364(ra) # 80001974 <_Z13assert_failedPKcS0_jS0_>
    80002ed0:	eedff06f          	j	80002dbc <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80002ed4:	00190713          	addi	a4,s2,1
    80002ed8:	2af77263          	bgeu	a4,a5,8000317c <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uintptr_t>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80002edc:	00671793          	slli	a5,a4,0x6
    80002ee0:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80002ee4:	fde00713          	li	a4,-34
    80002ee8:	00e78c23          	sb	a4,24(a5)
    80002eec:	fc000693          	li	a3,-64
    80002ef0:	00d78ca3          	sb	a3,25(a5)
    80002ef4:	fad00693          	li	a3,-83
    80002ef8:	00d78d23          	sb	a3,26(a5)
    80002efc:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80002f00:	0104c703          	lbu	a4,16(s1)
    80002f04:	0114c683          	lbu	a3,17(s1)
    80002f08:	00869693          	slli	a3,a3,0x8
    80002f0c:	00e6e6b3          	or	a3,a3,a4
    80002f10:	0124c703          	lbu	a4,18(s1)
    80002f14:	01071713          	slli	a4,a4,0x10
    80002f18:	00d766b3          	or	a3,a4,a3
    80002f1c:	0134c703          	lbu	a4,19(s1)
    80002f20:	01871713          	slli	a4,a4,0x18
    80002f24:	00d76733          	or	a4,a4,a3
    80002f28:	0144c683          	lbu	a3,20(s1)
    80002f2c:	02069693          	slli	a3,a3,0x20
    80002f30:	00e6e733          	or	a4,a3,a4
    80002f34:	0154c683          	lbu	a3,21(s1)
    80002f38:	02869693          	slli	a3,a3,0x28
    80002f3c:	00e6e6b3          	or	a3,a3,a4
    80002f40:	0164c703          	lbu	a4,22(s1)
    80002f44:	03071713          	slli	a4,a4,0x30
    80002f48:	00d766b3          	or	a3,a4,a3
    80002f4c:	0174c703          	lbu	a4,23(s1)
    80002f50:	03871713          	slli	a4,a4,0x38
    80002f54:	00d76733          	or	a4,a4,a3
    80002f58:	41270733          	sub	a4,a4,s2
    80002f5c:	fff70713          	addi	a4,a4,-1
    80002f60:	00e78823          	sb	a4,16(a5)
    80002f64:	00875693          	srli	a3,a4,0x8
    80002f68:	00d788a3          	sb	a3,17(a5)
    80002f6c:	01075693          	srli	a3,a4,0x10
    80002f70:	00d78923          	sb	a3,18(a5)
    80002f74:	0187569b          	srliw	a3,a4,0x18
    80002f78:	00d789a3          	sb	a3,19(a5)
    80002f7c:	02075693          	srli	a3,a4,0x20
    80002f80:	00d78a23          	sb	a3,20(a5)
    80002f84:	02875693          	srli	a3,a4,0x28
    80002f88:	00d78aa3          	sb	a3,21(a5)
    80002f8c:	03075693          	srli	a3,a4,0x30
    80002f90:	00d78b23          	sb	a3,22(a5)
    80002f94:	03875713          	srli	a4,a4,0x38
    80002f98:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80002f9c:	0004c703          	lbu	a4,0(s1)
    80002fa0:	0014c683          	lbu	a3,1(s1)
    80002fa4:	00869693          	slli	a3,a3,0x8
    80002fa8:	00e6e733          	or	a4,a3,a4
    80002fac:	0024c683          	lbu	a3,2(s1)
    80002fb0:	01069693          	slli	a3,a3,0x10
    80002fb4:	00e6e6b3          	or	a3,a3,a4
    80002fb8:	0034c703          	lbu	a4,3(s1)
    80002fbc:	01871713          	slli	a4,a4,0x18
    80002fc0:	00d766b3          	or	a3,a4,a3
    80002fc4:	0044c703          	lbu	a4,4(s1)
    80002fc8:	02071713          	slli	a4,a4,0x20
    80002fcc:	00d76733          	or	a4,a4,a3
    80002fd0:	0054c683          	lbu	a3,5(s1)
    80002fd4:	02869693          	slli	a3,a3,0x28
    80002fd8:	00e6e733          	or	a4,a3,a4
    80002fdc:	0064c683          	lbu	a3,6(s1)
    80002fe0:	03069693          	slli	a3,a3,0x30
    80002fe4:	00e6e6b3          	or	a3,a3,a4
    80002fe8:	0074c703          	lbu	a4,7(s1)
    80002fec:	03871713          	slli	a4,a4,0x38
    80002ff0:	00d76733          	or	a4,a4,a3
    80002ff4:	00d78023          	sb	a3,0(a5)
    80002ff8:	00875693          	srli	a3,a4,0x8
    80002ffc:	00d780a3          	sb	a3,1(a5)
    80003000:	01075693          	srli	a3,a4,0x10
    80003004:	00d78123          	sb	a3,2(a5)
    80003008:	0187569b          	srliw	a3,a4,0x18
    8000300c:	00d781a3          	sb	a3,3(a5)
    80003010:	02075693          	srli	a3,a4,0x20
    80003014:	00d78223          	sb	a3,4(a5)
    80003018:	02875693          	srli	a3,a4,0x28
    8000301c:	00d782a3          	sb	a3,5(a5)
    80003020:	03075693          	srli	a3,a4,0x30
    80003024:	00d78323          	sb	a3,6(a5)
    80003028:	03875713          	srli	a4,a4,0x38
    8000302c:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80003030:	00978423          	sb	s1,8(a5)
    80003034:	0084d713          	srli	a4,s1,0x8
    80003038:	00e784a3          	sb	a4,9(a5)
    8000303c:	0104d713          	srli	a4,s1,0x10
    80003040:	00e78523          	sb	a4,10(a5)
    80003044:	0184d71b          	srliw	a4,s1,0x18
    80003048:	00e785a3          	sb	a4,11(a5)
    8000304c:	0204d713          	srli	a4,s1,0x20
    80003050:	00e78623          	sb	a4,12(a5)
    80003054:	0284d713          	srli	a4,s1,0x28
    80003058:	00e786a3          	sb	a4,13(a5)
    8000305c:	0304d713          	srli	a4,s1,0x30
    80003060:	00e78723          	sb	a4,14(a5)
    80003064:	0384d713          	srli	a4,s1,0x38
    80003068:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    8000306c:	0004c703          	lbu	a4,0(s1)
    80003070:	0014c683          	lbu	a3,1(s1)
    80003074:	00869693          	slli	a3,a3,0x8
    80003078:	00e6e6b3          	or	a3,a3,a4
    8000307c:	0024c703          	lbu	a4,2(s1)
    80003080:	01071713          	slli	a4,a4,0x10
    80003084:	00d766b3          	or	a3,a4,a3
    80003088:	0034c703          	lbu	a4,3(s1)
    8000308c:	01871713          	slli	a4,a4,0x18
    80003090:	00d76733          	or	a4,a4,a3
    80003094:	0044c683          	lbu	a3,4(s1)
    80003098:	02069693          	slli	a3,a3,0x20
    8000309c:	00e6e733          	or	a4,a3,a4
    800030a0:	0054c683          	lbu	a3,5(s1)
    800030a4:	02869693          	slli	a3,a3,0x28
    800030a8:	00e6e6b3          	or	a3,a3,a4
    800030ac:	0064c703          	lbu	a4,6(s1)
    800030b0:	03071713          	slli	a4,a4,0x30
    800030b4:	00d766b3          	or	a3,a4,a3
    800030b8:	0074c703          	lbu	a4,7(s1)
    800030bc:	03871713          	slli	a4,a4,0x38
    800030c0:	00d76733          	or	a4,a4,a3
    800030c4:	04070063          	beqz	a4,80003104 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    800030c8:	00f70423          	sb	a5,8(a4)
    800030cc:	0087d693          	srli	a3,a5,0x8
    800030d0:	00d704a3          	sb	a3,9(a4)
    800030d4:	0107d693          	srli	a3,a5,0x10
    800030d8:	00d70523          	sb	a3,10(a4)
    800030dc:	0187d69b          	srliw	a3,a5,0x18
    800030e0:	00d705a3          	sb	a3,11(a4)
    800030e4:	0207d693          	srli	a3,a5,0x20
    800030e8:	00d70623          	sb	a3,12(a4)
    800030ec:	0287d693          	srli	a3,a5,0x28
    800030f0:	00d706a3          	sb	a3,13(a4)
    800030f4:	0307d693          	srli	a3,a5,0x30
    800030f8:	00d70723          	sb	a3,14(a4)
    800030fc:	0387d693          	srli	a3,a5,0x38
    80003100:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80003104:	00f48023          	sb	a5,0(s1)
    80003108:	0087d713          	srli	a4,a5,0x8
    8000310c:	00e480a3          	sb	a4,1(s1)
    80003110:	0107d713          	srli	a4,a5,0x10
    80003114:	00e48123          	sb	a4,2(s1)
    80003118:	0187d71b          	srliw	a4,a5,0x18
    8000311c:	00e481a3          	sb	a4,3(s1)
    80003120:	0207d713          	srli	a4,a5,0x20
    80003124:	00e48223          	sb	a4,4(s1)
    80003128:	0287d713          	srli	a4,a5,0x28
    8000312c:	00e482a3          	sb	a4,5(s1)
    80003130:	0307d713          	srli	a4,a5,0x30
    80003134:	00e48323          	sb	a4,6(s1)
    80003138:	0387d793          	srli	a5,a5,0x38
    8000313c:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80003140:	01248823          	sb	s2,16(s1)
    80003144:	00895793          	srli	a5,s2,0x8
    80003148:	00f488a3          	sb	a5,17(s1)
    8000314c:	01095793          	srli	a5,s2,0x10
    80003150:	00f48923          	sb	a5,18(s1)
    80003154:	0189579b          	srliw	a5,s2,0x18
    80003158:	00f489a3          	sb	a5,19(s1)
    8000315c:	02095793          	srli	a5,s2,0x20
    80003160:	00f48a23          	sb	a5,20(s1)
    80003164:	02895793          	srli	a5,s2,0x28
    80003168:	00f48aa3          	sb	a5,21(s1)
    8000316c:	03095793          	srli	a5,s2,0x30
    80003170:	00f48b23          	sb	a5,22(s1)
    80003174:	03895913          	srli	s2,s2,0x38
    80003178:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    8000317c:	0009b783          	ld	a5,0(s3)
    80003180:	20978463          	beq	a5,s1,80003388 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80003184:	0084c783          	lbu	a5,8(s1)
    80003188:	0094c703          	lbu	a4,9(s1)
    8000318c:	00871713          	slli	a4,a4,0x8
    80003190:	00f76733          	or	a4,a4,a5
    80003194:	00a4c783          	lbu	a5,10(s1)
    80003198:	01079793          	slli	a5,a5,0x10
    8000319c:	00e7e733          	or	a4,a5,a4
    800031a0:	00b4c783          	lbu	a5,11(s1)
    800031a4:	01879793          	slli	a5,a5,0x18
    800031a8:	00e7e7b3          	or	a5,a5,a4
    800031ac:	00c4c703          	lbu	a4,12(s1)
    800031b0:	02071713          	slli	a4,a4,0x20
    800031b4:	00f767b3          	or	a5,a4,a5
    800031b8:	00d4c703          	lbu	a4,13(s1)
    800031bc:	02871713          	slli	a4,a4,0x28
    800031c0:	00f76733          	or	a4,a4,a5
    800031c4:	00e4c783          	lbu	a5,14(s1)
    800031c8:	03079793          	slli	a5,a5,0x30
    800031cc:	00e7e733          	or	a4,a5,a4
    800031d0:	00f4c783          	lbu	a5,15(s1)
    800031d4:	03879793          	slli	a5,a5,0x38
    800031d8:	00e7e7b3          	or	a5,a5,a4
    800031dc:	08078c63          	beqz	a5,80003274 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    800031e0:	0004c703          	lbu	a4,0(s1)
    800031e4:	0014c683          	lbu	a3,1(s1)
    800031e8:	00869693          	slli	a3,a3,0x8
    800031ec:	00e6e733          	or	a4,a3,a4
    800031f0:	0024c683          	lbu	a3,2(s1)
    800031f4:	01069693          	slli	a3,a3,0x10
    800031f8:	00e6e6b3          	or	a3,a3,a4
    800031fc:	0034c703          	lbu	a4,3(s1)
    80003200:	01871713          	slli	a4,a4,0x18
    80003204:	00d766b3          	or	a3,a4,a3
    80003208:	0044c703          	lbu	a4,4(s1)
    8000320c:	02071713          	slli	a4,a4,0x20
    80003210:	00d76733          	or	a4,a4,a3
    80003214:	0054c683          	lbu	a3,5(s1)
    80003218:	02869693          	slli	a3,a3,0x28
    8000321c:	00e6e733          	or	a4,a3,a4
    80003220:	0064c683          	lbu	a3,6(s1)
    80003224:	03069693          	slli	a3,a3,0x30
    80003228:	00e6e6b3          	or	a3,a3,a4
    8000322c:	0074c703          	lbu	a4,7(s1)
    80003230:	03871713          	slli	a4,a4,0x38
    80003234:	00d76733          	or	a4,a4,a3
    80003238:	00d78023          	sb	a3,0(a5)
    8000323c:	00875693          	srli	a3,a4,0x8
    80003240:	00d780a3          	sb	a3,1(a5)
    80003244:	01075693          	srli	a3,a4,0x10
    80003248:	00d78123          	sb	a3,2(a5)
    8000324c:	0187569b          	srliw	a3,a4,0x18
    80003250:	00d781a3          	sb	a3,3(a5)
    80003254:	02075693          	srli	a3,a4,0x20
    80003258:	00d78223          	sb	a3,4(a5)
    8000325c:	02875693          	srli	a3,a4,0x28
    80003260:	00d782a3          	sb	a3,5(a5)
    80003264:	03075693          	srli	a3,a4,0x30
    80003268:	00d78323          	sb	a3,6(a5)
    8000326c:	03875713          	srli	a4,a4,0x38
    80003270:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003274:	0004c783          	lbu	a5,0(s1)
    80003278:	0014c703          	lbu	a4,1(s1)
    8000327c:	00871713          	slli	a4,a4,0x8
    80003280:	00f76733          	or	a4,a4,a5
    80003284:	0024c783          	lbu	a5,2(s1)
    80003288:	01079793          	slli	a5,a5,0x10
    8000328c:	00e7e733          	or	a4,a5,a4
    80003290:	0034c783          	lbu	a5,3(s1)
    80003294:	01879793          	slli	a5,a5,0x18
    80003298:	00e7e7b3          	or	a5,a5,a4
    8000329c:	0044c703          	lbu	a4,4(s1)
    800032a0:	02071713          	slli	a4,a4,0x20
    800032a4:	00f767b3          	or	a5,a4,a5
    800032a8:	0054c703          	lbu	a4,5(s1)
    800032ac:	02871713          	slli	a4,a4,0x28
    800032b0:	00f76733          	or	a4,a4,a5
    800032b4:	0064c783          	lbu	a5,6(s1)
    800032b8:	03079793          	slli	a5,a5,0x30
    800032bc:	00e7e733          	or	a4,a5,a4
    800032c0:	0074c783          	lbu	a5,7(s1)
    800032c4:	03879793          	slli	a5,a5,0x38
    800032c8:	00e7e7b3          	or	a5,a5,a4
    800032cc:	08078c63          	beqz	a5,80003364 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    800032d0:	0084c703          	lbu	a4,8(s1)
    800032d4:	0094c683          	lbu	a3,9(s1)
    800032d8:	00869693          	slli	a3,a3,0x8
    800032dc:	00e6e733          	or	a4,a3,a4
    800032e0:	00a4c683          	lbu	a3,10(s1)
    800032e4:	01069693          	slli	a3,a3,0x10
    800032e8:	00e6e6b3          	or	a3,a3,a4
    800032ec:	00b4c703          	lbu	a4,11(s1)
    800032f0:	01871713          	slli	a4,a4,0x18
    800032f4:	00d766b3          	or	a3,a4,a3
    800032f8:	00c4c703          	lbu	a4,12(s1)
    800032fc:	02071713          	slli	a4,a4,0x20
    80003300:	00d76733          	or	a4,a4,a3
    80003304:	00d4c683          	lbu	a3,13(s1)
    80003308:	02869693          	slli	a3,a3,0x28
    8000330c:	00e6e733          	or	a4,a3,a4
    80003310:	00e4c683          	lbu	a3,14(s1)
    80003314:	03069693          	slli	a3,a3,0x30
    80003318:	00e6e6b3          	or	a3,a3,a4
    8000331c:	00f4c703          	lbu	a4,15(s1)
    80003320:	03871713          	slli	a4,a4,0x38
    80003324:	00d76733          	or	a4,a4,a3
    80003328:	00d78423          	sb	a3,8(a5)
    8000332c:	00875693          	srli	a3,a4,0x8
    80003330:	00d784a3          	sb	a3,9(a5)
    80003334:	01075693          	srli	a3,a4,0x10
    80003338:	00d78523          	sb	a3,10(a5)
    8000333c:	0187569b          	srliw	a3,a4,0x18
    80003340:	00d785a3          	sb	a3,11(a5)
    80003344:	02075693          	srli	a3,a4,0x20
    80003348:	00d78623          	sb	a3,12(a5)
    8000334c:	02875693          	srli	a3,a4,0x28
    80003350:	00d786a3          	sb	a3,13(a5)
    80003354:	03075693          	srli	a3,a4,0x30
    80003358:	00d78723          	sb	a3,14(a5)
    8000335c:	03875713          	srli	a4,a4,0x38
    80003360:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(pCurrent) + MEM_BLOCK_SIZE);
    80003364:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80003368:	00048513          	mv	a0,s1
    8000336c:	02813083          	ld	ra,40(sp)
    80003370:	02013403          	ld	s0,32(sp)
    80003374:	01813483          	ld	s1,24(sp)
    80003378:	01013903          	ld	s2,16(sp)
    8000337c:	00813983          	ld	s3,8(sp)
    80003380:	03010113          	addi	sp,sp,48
    80003384:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80003388:	0004c703          	lbu	a4,0(s1)
    8000338c:	0014c783          	lbu	a5,1(s1)
    80003390:	00879793          	slli	a5,a5,0x8
    80003394:	00e7e7b3          	or	a5,a5,a4
    80003398:	0024c703          	lbu	a4,2(s1)
    8000339c:	01071713          	slli	a4,a4,0x10
    800033a0:	00f76733          	or	a4,a4,a5
    800033a4:	0034c783          	lbu	a5,3(s1)
    800033a8:	01879793          	slli	a5,a5,0x18
    800033ac:	00e7e733          	or	a4,a5,a4
    800033b0:	0044c783          	lbu	a5,4(s1)
    800033b4:	02079793          	slli	a5,a5,0x20
    800033b8:	00e7e7b3          	or	a5,a5,a4
    800033bc:	0054c703          	lbu	a4,5(s1)
    800033c0:	02871713          	slli	a4,a4,0x28
    800033c4:	00f76733          	or	a4,a4,a5
    800033c8:	0064c783          	lbu	a5,6(s1)
    800033cc:	03079793          	slli	a5,a5,0x30
    800033d0:	00e7e733          	or	a4,a5,a4
    800033d4:	0074c783          	lbu	a5,7(s1)
    800033d8:	03879793          	slli	a5,a5,0x38
    800033dc:	00e7e7b3          	or	a5,a5,a4
    800033e0:	00f9b023          	sd	a5,0(s3)
    800033e4:	da1ff06f          	j	80003184 <_ZN11HeapManager12heapAllocateEm+0x3f4>

00000000800033e8 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    800033e8:	ff010113          	addi	sp,sp,-16
    800033ec:	00813423          	sd	s0,8(sp)
    800033f0:	01010413          	addi	s0,sp,16
    //     if(pFree->pNext != 0){
    //         pFree->pNext->pPrev = pFree;
    //     }
    // }
    return 0;
}
    800033f4:	00000513          	li	a0,0
    800033f8:	00813403          	ld	s0,8(sp)
    800033fc:	01010113          	addi	sp,sp,16
    80003400:	00008067          	ret

0000000080003404 <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"
#include "assert.h"

extern "C" void exceptionHandler(){
    80003404:	fc010113          	addi	sp,sp,-64
    80003408:	02113c23          	sd	ra,56(sp)
    8000340c:	02813823          	sd	s0,48(sp)
    80003410:	02913423          	sd	s1,40(sp)
    80003414:	03213023          	sd	s2,32(sp)
    80003418:	01313c23          	sd	s3,24(sp)
    8000341c:	01413823          	sd	s4,16(sp)
    80003420:	01513423          	sd	s5,8(sp)
    80003424:	01613023          	sd	s6,0(sp)
    80003428:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    8000342c:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    80003430:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    80003434:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    80003438:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    8000343c:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80003440:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80003444:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80003448:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    8000344c:	ff870613          	addi	a2,a4,-8
    80003450:	00100693          	li	a3,1
    80003454:	04c6f463          	bgeu	a3,a2,8000349c <exceptionHandler+0x98>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    80003458:	00500793          	li	a5,5
    8000345c:	20f70e63          	beq	a4,a5,80003678 <exceptionHandler+0x274>
                __putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    80003460:	00700793          	li	a5,7
    80003464:	3cf70863          	beq	a4,a5,80003834 <exceptionHandler+0x430>
                __putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    80003468:	fff00793          	li	a5,-1
    8000346c:	03f79793          	slli	a5,a5,0x3f
    80003470:	00178793          	addi	a5,a5,1
    80003474:	58f70463          	beq	a4,a5,800039fc <exceptionHandler+0x5f8>
        Timer::getInstance().tick();
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    80003478:	fff00793          	li	a5,-1
    8000347c:	03f79793          	slli	a5,a5,0x3f
    80003480:	00978793          	addi	a5,a5,9
    80003484:	08f71863          	bne	a4,a5,80003514 <exceptionHandler+0x110>
    {   
        int irq = plic_claim();
    80003488:	00001097          	auipc	ra,0x1
    8000348c:	1fc080e7          	jalr	508(ra) # 80004684 <plic_claim>
        // if(irq == CONSOLE_IRQ)Console::console_handler();
        plic_complete(irq);
    80003490:	00001097          	auipc	ra,0x1
    80003494:	22c080e7          	jalr	556(ra) # 800046bc <plic_complete>
    80003498:	07c0006f          	j	80003514 <exceptionHandler+0x110>
        switch(a0){
    8000349c:	04200713          	li	a4,66
    800034a0:	02f76463          	bltu	a4,a5,800034c8 <exceptionHandler+0xc4>
    800034a4:	1c078263          	beqz	a5,80003668 <exceptionHandler+0x264>
    800034a8:	1cf76463          	bltu	a4,a5,80003670 <exceptionHandler+0x26c>
    800034ac:	00279793          	slli	a5,a5,0x2
    800034b0:	00004717          	auipc	a4,0x4
    800034b4:	d6870713          	addi	a4,a4,-664 # 80007218 <CONSOLE_STATUS+0x208>
    800034b8:	00e787b3          	add	a5,a5,a4
    800034bc:	0007a783          	lw	a5,0(a5)
    800034c0:	00e787b3          	add	a5,a5,a4
    800034c4:	00078067          	jr	a5
    800034c8:	0ff00713          	li	a4,255
    800034cc:	02e79663          	bne	a5,a4,800034f8 <exceptionHandler+0xf4>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800034d0:	00000793          	li	a5,0
    800034d4:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800034d8:	00448493          	addi	s1,s1,4
    800034dc:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800034e0:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    800034e4:	10000793          	li	a5,256
    800034e8:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800034ec:	00200793          	li	a5,2
    800034f0:	1447b073          	csrc	sip,a5
                return;
    800034f4:	0200006f          	j	80003514 <exceptionHandler+0x110>
        switch(a0){
    800034f8:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800034fc:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80003500:	00448493          	addi	s1,s1,4
    80003504:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003508:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    8000350c:	00200793          	li	a5,2
    80003510:	1447b073          	csrc	sip,a5
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    80003514:	03813083          	ld	ra,56(sp)
    80003518:	03013403          	ld	s0,48(sp)
    8000351c:	02813483          	ld	s1,40(sp)
    80003520:	02013903          	ld	s2,32(sp)
    80003524:	01813983          	ld	s3,24(sp)
    80003528:	01013a03          	ld	s4,16(sp)
    8000352c:	00813a83          	ld	s5,8(sp)
    80003530:	00013b03          	ld	s6,0(sp)
    80003534:	04010113          	addi	sp,sp,64
    80003538:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    8000353c:	00098593          	mv	a1,s3
    80003540:	00005797          	auipc	a5,0x5
    80003544:	a707b783          	ld	a5,-1424(a5) # 80007fb0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003548:	0007b503          	ld	a0,0(a5)
    8000354c:	00000097          	auipc	ra,0x0
    80003550:	844080e7          	jalr	-1980(ra) # 80002d90 <_ZN11HeapManager12heapAllocateEm>
                break;
    80003554:	fa9ff06f          	j	800034fc <exceptionHandler+0xf8>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    80003558:	00098593          	mv	a1,s3
    8000355c:	00005797          	auipc	a5,0x5
    80003560:	a547b783          	ld	a5,-1452(a5) # 80007fb0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003564:	0007b503          	ld	a0,0(a5)
    80003568:	00000097          	auipc	ra,0x0
    8000356c:	e80080e7          	jalr	-384(ra) # 800033e8 <_ZN11HeapManager8heapFreeEPv>
                break;
    80003570:	f8dff06f          	j	800034fc <exceptionHandler+0xf8>
                __putc('\0'); /// removing this line causes everything to break
    80003574:	00000513          	li	a0,0
    80003578:	00003097          	auipc	ra,0x3
    8000357c:	974080e7          	jalr	-1676(ra) # 80005eec <__putc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    80003580:	00100713          	li	a4,1
    80003584:	000b0693          	mv	a3,s6
    80003588:	000a8613          	mv	a2,s5
    8000358c:	000a0593          	mv	a1,s4
    80003590:	00098513          	mv	a0,s3
    80003594:	fffff097          	auipc	ra,0xfffff
    80003598:	ee8080e7          	jalr	-280(ra) # 8000247c <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    8000359c:	f61ff06f          	j	800034fc <exceptionHandler+0xf8>
                returnVal = _thread::currentThread->exit();
    800035a0:	fffff097          	auipc	ra,0xfffff
    800035a4:	414080e7          	jalr	1044(ra) # 800029b4 <_ZN7_thread4exitEv>
                break;
    800035a8:	f55ff06f          	j	800034fc <exceptionHandler+0xf8>
                _thread::dispatch();
    800035ac:	fffff097          	auipc	ra,0xfffff
    800035b0:	1d0080e7          	jalr	464(ra) # 8000277c <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    800035b4:	00000513          	li	a0,0
                break;
    800035b8:	f45ff06f          	j	800034fc <exceptionHandler+0xf8>
                _thread::currentThread->join((thread_t)a1);
    800035bc:	00098593          	mv	a1,s3
    800035c0:	00005797          	auipc	a5,0x5
    800035c4:	a107b783          	ld	a5,-1520(a5) # 80007fd0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800035c8:	0007b503          	ld	a0,0(a5)
    800035cc:	fffff097          	auipc	ra,0xfffff
    800035d0:	2a0080e7          	jalr	672(ra) # 8000286c <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    800035d4:	00000513          	li	a0,0
                break;
    800035d8:	f25ff06f          	j	800034fc <exceptionHandler+0xf8>
                _sem::open((sem_t*)a1, unsigned(a2));
    800035dc:	000a059b          	sext.w	a1,s4
    800035e0:	00098513          	mv	a0,s3
    800035e4:	ffffe097          	auipc	ra,0xffffe
    800035e8:	09c080e7          	jalr	156(ra) # 80001680 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    800035ec:	00000513          	li	a0,0
                break;
    800035f0:	f0dff06f          	j	800034fc <exceptionHandler+0xf8>
                _sem::close((sem_t)a1);
    800035f4:	00098513          	mv	a0,s3
    800035f8:	ffffe097          	auipc	ra,0xffffe
    800035fc:	0e4080e7          	jalr	228(ra) # 800016dc <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80003600:	00000513          	li	a0,0
                break;
    80003604:	ef9ff06f          	j	800034fc <exceptionHandler+0xf8>
                _sem::wait((sem_t)a1);
    80003608:	00098513          	mv	a0,s3
    8000360c:	ffffe097          	auipc	ra,0xffffe
    80003610:	130080e7          	jalr	304(ra) # 8000173c <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    80003614:	00000513          	li	a0,0
                break;
    80003618:	ee5ff06f          	j	800034fc <exceptionHandler+0xf8>
                _sem::signal((sem_t)a1);
    8000361c:	00098513          	mv	a0,s3
    80003620:	ffffe097          	auipc	ra,0xffffe
    80003624:	1cc080e7          	jalr	460(ra) # 800017ec <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80003628:	00000513          	li	a0,0
                break;
    8000362c:	ed1ff06f          	j	800034fc <exceptionHandler+0xf8>
                returnVal = Timer::getInstance().sleep(a1);
    80003630:	ffffe097          	auipc	ra,0xffffe
    80003634:	b88080e7          	jalr	-1144(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    80003638:	00098593          	mv	a1,s3
    8000363c:	ffffe097          	auipc	ra,0xffffe
    80003640:	d00080e7          	jalr	-768(ra) # 8000133c <_ZN5Timer5sleepEm>
                break;
    80003644:	eb9ff06f          	j	800034fc <exceptionHandler+0xf8>
                returnVal = __getc();
    80003648:	00003097          	auipc	ra,0x3
    8000364c:	8e0080e7          	jalr	-1824(ra) # 80005f28 <__getc>
                break;
    80003650:	eadff06f          	j	800034fc <exceptionHandler+0xf8>
                __putc(a1);
    80003654:	0ff9f513          	andi	a0,s3,255
    80003658:	00003097          	auipc	ra,0x3
    8000365c:	894080e7          	jalr	-1900(ra) # 80005eec <__putc>
    uint64 returnVal = 0;
    80003660:	00000513          	li	a0,0
                break;
    80003664:	e99ff06f          	j	800034fc <exceptionHandler+0xf8>
        switch(a0){
    80003668:	00000513          	li	a0,0
    8000366c:	e91ff06f          	j	800034fc <exceptionHandler+0xf8>
    80003670:	00000513          	li	a0,0
    80003674:	e89ff06f          	j	800034fc <exceptionHandler+0xf8>
        __putc('\n');
    80003678:	00a00513          	li	a0,10
    8000367c:	00003097          	auipc	ra,0x3
    80003680:	870080e7          	jalr	-1936(ra) # 80005eec <__putc>
        __putc('E');
    80003684:	04500513          	li	a0,69
    80003688:	00003097          	auipc	ra,0x3
    8000368c:	864080e7          	jalr	-1948(ra) # 80005eec <__putc>
        __putc('r');
    80003690:	07200513          	li	a0,114
    80003694:	00003097          	auipc	ra,0x3
    80003698:	858080e7          	jalr	-1960(ra) # 80005eec <__putc>
        __putc('r');
    8000369c:	07200513          	li	a0,114
    800036a0:	00003097          	auipc	ra,0x3
    800036a4:	84c080e7          	jalr	-1972(ra) # 80005eec <__putc>
        __putc('o');
    800036a8:	06f00513          	li	a0,111
    800036ac:	00003097          	auipc	ra,0x3
    800036b0:	840080e7          	jalr	-1984(ra) # 80005eec <__putc>
        __putc('r');
    800036b4:	07200513          	li	a0,114
    800036b8:	00003097          	auipc	ra,0x3
    800036bc:	834080e7          	jalr	-1996(ra) # 80005eec <__putc>
        __putc(':');
    800036c0:	03a00513          	li	a0,58
    800036c4:	00003097          	auipc	ra,0x3
    800036c8:	828080e7          	jalr	-2008(ra) # 80005eec <__putc>
        __putc(' ');
    800036cc:	02000513          	li	a0,32
    800036d0:	00003097          	auipc	ra,0x3
    800036d4:	81c080e7          	jalr	-2020(ra) # 80005eec <__putc>
        __putc('i');
    800036d8:	06900513          	li	a0,105
    800036dc:	00003097          	auipc	ra,0x3
    800036e0:	810080e7          	jalr	-2032(ra) # 80005eec <__putc>
        __putc('l');
    800036e4:	06c00513          	li	a0,108
    800036e8:	00003097          	auipc	ra,0x3
    800036ec:	804080e7          	jalr	-2044(ra) # 80005eec <__putc>
        __putc('l');
    800036f0:	06c00513          	li	a0,108
    800036f4:	00002097          	auipc	ra,0x2
    800036f8:	7f8080e7          	jalr	2040(ra) # 80005eec <__putc>
        __putc('e');
    800036fc:	06500513          	li	a0,101
    80003700:	00002097          	auipc	ra,0x2
    80003704:	7ec080e7          	jalr	2028(ra) # 80005eec <__putc>
        __putc('g');
    80003708:	06700513          	li	a0,103
    8000370c:	00002097          	auipc	ra,0x2
    80003710:	7e0080e7          	jalr	2016(ra) # 80005eec <__putc>
        __putc('a');
    80003714:	06100513          	li	a0,97
    80003718:	00002097          	auipc	ra,0x2
    8000371c:	7d4080e7          	jalr	2004(ra) # 80005eec <__putc>
        __putc('l');
    80003720:	06c00513          	li	a0,108
    80003724:	00002097          	auipc	ra,0x2
    80003728:	7c8080e7          	jalr	1992(ra) # 80005eec <__putc>
        __putc(' ');
    8000372c:	02000513          	li	a0,32
    80003730:	00002097          	auipc	ra,0x2
    80003734:	7bc080e7          	jalr	1980(ra) # 80005eec <__putc>
        __putc('r');
    80003738:	07200513          	li	a0,114
    8000373c:	00002097          	auipc	ra,0x2
    80003740:	7b0080e7          	jalr	1968(ra) # 80005eec <__putc>
        __putc('e');
    80003744:	06500513          	li	a0,101
    80003748:	00002097          	auipc	ra,0x2
    8000374c:	7a4080e7          	jalr	1956(ra) # 80005eec <__putc>
        __putc('a');
    80003750:	06100513          	li	a0,97
    80003754:	00002097          	auipc	ra,0x2
    80003758:	798080e7          	jalr	1944(ra) # 80005eec <__putc>
        __putc('d');
    8000375c:	06400513          	li	a0,100
    80003760:	00002097          	auipc	ra,0x2
    80003764:	78c080e7          	jalr	1932(ra) # 80005eec <__putc>
        __putc('!');
    80003768:	02100513          	li	a0,33
    8000376c:	00002097          	auipc	ra,0x2
    80003770:	780080e7          	jalr	1920(ra) # 80005eec <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80003774:	14102973          	csrr	s2,sepc
        __putc('\n');
    80003778:	00a00513          	li	a0,10
    8000377c:	00002097          	auipc	ra,0x2
    80003780:	770080e7          	jalr	1904(ra) # 80005eec <__putc>
        __putc('P');
    80003784:	05000513          	li	a0,80
    80003788:	00002097          	auipc	ra,0x2
    8000378c:	764080e7          	jalr	1892(ra) # 80005eec <__putc>
        __putc('C');
    80003790:	04300513          	li	a0,67
    80003794:	00002097          	auipc	ra,0x2
    80003798:	758080e7          	jalr	1880(ra) # 80005eec <__putc>
        __putc(':');
    8000379c:	03a00513          	li	a0,58
    800037a0:	00002097          	auipc	ra,0x2
    800037a4:	74c080e7          	jalr	1868(ra) # 80005eec <__putc>
        __putc(' ');
    800037a8:	02000513          	li	a0,32
    800037ac:	00002097          	auipc	ra,0x2
    800037b0:	740080e7          	jalr	1856(ra) # 80005eec <__putc>
        __putc('0');
    800037b4:	03000513          	li	a0,48
    800037b8:	00002097          	auipc	ra,0x2
    800037bc:	734080e7          	jalr	1844(ra) # 80005eec <__putc>
        __putc('x');
    800037c0:	07800513          	li	a0,120
    800037c4:	00002097          	auipc	ra,0x2
    800037c8:	728080e7          	jalr	1832(ra) # 80005eec <__putc>
        for(int i = 15; i >= 0; i--){
    800037cc:	00f00493          	li	s1,15
    800037d0:	0140006f          	j	800037e4 <exceptionHandler+0x3e0>
                __putc('A' + tmp - 10);
    800037d4:	03750513          	addi	a0,a0,55
    800037d8:	00002097          	auipc	ra,0x2
    800037dc:	714080e7          	jalr	1812(ra) # 80005eec <__putc>
        for(int i = 15; i >= 0; i--){
    800037e0:	fff4849b          	addiw	s1,s1,-1
    800037e4:	0204c463          	bltz	s1,8000380c <exceptionHandler+0x408>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    800037e8:	0024951b          	slliw	a0,s1,0x2
    800037ec:	00a95533          	srl	a0,s2,a0
    800037f0:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    800037f4:	00900793          	li	a5,9
    800037f8:	fca7eee3          	bltu	a5,a0,800037d4 <exceptionHandler+0x3d0>
                __putc('0' + tmp);
    800037fc:	03050513          	addi	a0,a0,48
    80003800:	00002097          	auipc	ra,0x2
    80003804:	6ec080e7          	jalr	1772(ra) # 80005eec <__putc>
    80003808:	fd9ff06f          	j	800037e0 <exceptionHandler+0x3dc>
        assert(false);
    8000380c:	00004697          	auipc	a3,0x4
    80003810:	9cc68693          	addi	a3,a3,-1588 # 800071d8 <CONSOLE_STATUS+0x1c8>
    80003814:	08600613          	li	a2,134
    80003818:	00004597          	auipc	a1,0x4
    8000381c:	9d858593          	addi	a1,a1,-1576 # 800071f0 <CONSOLE_STATUS+0x1e0>
    80003820:	00004517          	auipc	a0,0x4
    80003824:	9f050513          	addi	a0,a0,-1552 # 80007210 <CONSOLE_STATUS+0x200>
    80003828:	ffffe097          	auipc	ra,0xffffe
    8000382c:	14c080e7          	jalr	332(ra) # 80001974 <_Z13assert_failedPKcS0_jS0_>
    80003830:	ce5ff06f          	j	80003514 <exceptionHandler+0x110>
        __putc('\n');
    80003834:	00a00513          	li	a0,10
    80003838:	00002097          	auipc	ra,0x2
    8000383c:	6b4080e7          	jalr	1716(ra) # 80005eec <__putc>
        __putc('E');
    80003840:	04500513          	li	a0,69
    80003844:	00002097          	auipc	ra,0x2
    80003848:	6a8080e7          	jalr	1704(ra) # 80005eec <__putc>
        __putc('r');
    8000384c:	07200513          	li	a0,114
    80003850:	00002097          	auipc	ra,0x2
    80003854:	69c080e7          	jalr	1692(ra) # 80005eec <__putc>
        __putc('r');
    80003858:	07200513          	li	a0,114
    8000385c:	00002097          	auipc	ra,0x2
    80003860:	690080e7          	jalr	1680(ra) # 80005eec <__putc>
        __putc('o');
    80003864:	06f00513          	li	a0,111
    80003868:	00002097          	auipc	ra,0x2
    8000386c:	684080e7          	jalr	1668(ra) # 80005eec <__putc>
        __putc('r');
    80003870:	07200513          	li	a0,114
    80003874:	00002097          	auipc	ra,0x2
    80003878:	678080e7          	jalr	1656(ra) # 80005eec <__putc>
        __putc(':');
    8000387c:	03a00513          	li	a0,58
    80003880:	00002097          	auipc	ra,0x2
    80003884:	66c080e7          	jalr	1644(ra) # 80005eec <__putc>
        __putc(' ');
    80003888:	02000513          	li	a0,32
    8000388c:	00002097          	auipc	ra,0x2
    80003890:	660080e7          	jalr	1632(ra) # 80005eec <__putc>
        __putc('i');
    80003894:	06900513          	li	a0,105
    80003898:	00002097          	auipc	ra,0x2
    8000389c:	654080e7          	jalr	1620(ra) # 80005eec <__putc>
        __putc('l');
    800038a0:	06c00513          	li	a0,108
    800038a4:	00002097          	auipc	ra,0x2
    800038a8:	648080e7          	jalr	1608(ra) # 80005eec <__putc>
        __putc('l');
    800038ac:	06c00513          	li	a0,108
    800038b0:	00002097          	auipc	ra,0x2
    800038b4:	63c080e7          	jalr	1596(ra) # 80005eec <__putc>
        __putc('e');
    800038b8:	06500513          	li	a0,101
    800038bc:	00002097          	auipc	ra,0x2
    800038c0:	630080e7          	jalr	1584(ra) # 80005eec <__putc>
        __putc('g');
    800038c4:	06700513          	li	a0,103
    800038c8:	00002097          	auipc	ra,0x2
    800038cc:	624080e7          	jalr	1572(ra) # 80005eec <__putc>
        __putc('a');
    800038d0:	06100513          	li	a0,97
    800038d4:	00002097          	auipc	ra,0x2
    800038d8:	618080e7          	jalr	1560(ra) # 80005eec <__putc>
        __putc('l');
    800038dc:	06c00513          	li	a0,108
    800038e0:	00002097          	auipc	ra,0x2
    800038e4:	60c080e7          	jalr	1548(ra) # 80005eec <__putc>
        __putc(' ');
    800038e8:	02000513          	li	a0,32
    800038ec:	00002097          	auipc	ra,0x2
    800038f0:	600080e7          	jalr	1536(ra) # 80005eec <__putc>
        __putc('w');
    800038f4:	07700513          	li	a0,119
    800038f8:	00002097          	auipc	ra,0x2
    800038fc:	5f4080e7          	jalr	1524(ra) # 80005eec <__putc>
        __putc('r');
    80003900:	07200513          	li	a0,114
    80003904:	00002097          	auipc	ra,0x2
    80003908:	5e8080e7          	jalr	1512(ra) # 80005eec <__putc>
        __putc('i');
    8000390c:	06900513          	li	a0,105
    80003910:	00002097          	auipc	ra,0x2
    80003914:	5dc080e7          	jalr	1500(ra) # 80005eec <__putc>
        __putc('t');
    80003918:	07400513          	li	a0,116
    8000391c:	00002097          	auipc	ra,0x2
    80003920:	5d0080e7          	jalr	1488(ra) # 80005eec <__putc>
        __putc('e');
    80003924:	06500513          	li	a0,101
    80003928:	00002097          	auipc	ra,0x2
    8000392c:	5c4080e7          	jalr	1476(ra) # 80005eec <__putc>
        __putc('!');
    80003930:	02100513          	li	a0,33
    80003934:	00002097          	auipc	ra,0x2
    80003938:	5b8080e7          	jalr	1464(ra) # 80005eec <__putc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    8000393c:	14102973          	csrr	s2,sepc
        __putc('\n');
    80003940:	00a00513          	li	a0,10
    80003944:	00002097          	auipc	ra,0x2
    80003948:	5a8080e7          	jalr	1448(ra) # 80005eec <__putc>
        __putc('P');
    8000394c:	05000513          	li	a0,80
    80003950:	00002097          	auipc	ra,0x2
    80003954:	59c080e7          	jalr	1436(ra) # 80005eec <__putc>
        __putc('C');
    80003958:	04300513          	li	a0,67
    8000395c:	00002097          	auipc	ra,0x2
    80003960:	590080e7          	jalr	1424(ra) # 80005eec <__putc>
        __putc(':');
    80003964:	03a00513          	li	a0,58
    80003968:	00002097          	auipc	ra,0x2
    8000396c:	584080e7          	jalr	1412(ra) # 80005eec <__putc>
        __putc(' ');
    80003970:	02000513          	li	a0,32
    80003974:	00002097          	auipc	ra,0x2
    80003978:	578080e7          	jalr	1400(ra) # 80005eec <__putc>
        __putc('0');
    8000397c:	03000513          	li	a0,48
    80003980:	00002097          	auipc	ra,0x2
    80003984:	56c080e7          	jalr	1388(ra) # 80005eec <__putc>
        __putc('x');
    80003988:	07800513          	li	a0,120
    8000398c:	00002097          	auipc	ra,0x2
    80003990:	560080e7          	jalr	1376(ra) # 80005eec <__putc>
        for(int i = 15; i >= 0; i--){
    80003994:	00f00493          	li	s1,15
    80003998:	0140006f          	j	800039ac <exceptionHandler+0x5a8>
                __putc('A' + tmp - 10);
    8000399c:	03750513          	addi	a0,a0,55
    800039a0:	00002097          	auipc	ra,0x2
    800039a4:	54c080e7          	jalr	1356(ra) # 80005eec <__putc>
        for(int i = 15; i >= 0; i--){
    800039a8:	fff4849b          	addiw	s1,s1,-1
    800039ac:	0204c463          	bltz	s1,800039d4 <exceptionHandler+0x5d0>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    800039b0:	0024951b          	slliw	a0,s1,0x2
    800039b4:	00a95533          	srl	a0,s2,a0
    800039b8:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    800039bc:	00900793          	li	a5,9
    800039c0:	fca7eee3          	bltu	a5,a0,8000399c <exceptionHandler+0x598>
                __putc('0' + tmp);
    800039c4:	03050513          	addi	a0,a0,48
    800039c8:	00002097          	auipc	ra,0x2
    800039cc:	524080e7          	jalr	1316(ra) # 80005eec <__putc>
    800039d0:	fd9ff06f          	j	800039a8 <exceptionHandler+0x5a4>
        assert(false);
    800039d4:	00004697          	auipc	a3,0x4
    800039d8:	80468693          	addi	a3,a3,-2044 # 800071d8 <CONSOLE_STATUS+0x1c8>
    800039dc:	0b000613          	li	a2,176
    800039e0:	00004597          	auipc	a1,0x4
    800039e4:	81058593          	addi	a1,a1,-2032 # 800071f0 <CONSOLE_STATUS+0x1e0>
    800039e8:	00004517          	auipc	a0,0x4
    800039ec:	82850513          	addi	a0,a0,-2008 # 80007210 <CONSOLE_STATUS+0x200>
    800039f0:	ffffe097          	auipc	ra,0xffffe
    800039f4:	f84080e7          	jalr	-124(ra) # 80001974 <_Z13assert_failedPKcS0_jS0_>
    800039f8:	b1dff06f          	j	80003514 <exceptionHandler+0x110>
        Timer::getInstance().tick();
    800039fc:	ffffd097          	auipc	ra,0xffffd
    80003a00:	7bc080e7          	jalr	1980(ra) # 800011b8 <_ZN5Timer11getInstanceEv>
    80003a04:	ffffe097          	auipc	ra,0xffffe
    80003a08:	818080e7          	jalr	-2024(ra) # 8000121c <_ZN5Timer4tickEv>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80003a0c:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80003a10:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80003a14:	00200793          	li	a5,2
    80003a18:	1447b073          	csrc	sip,a5
    80003a1c:	af9ff06f          	j	80003514 <exceptionHandler+0x110>

0000000080003a20 <_ZN9SchedulerC1Ev>:
#include "console.h"
#include "thread.h"

Scheduler* Scheduler::singleton = 0;

Scheduler::Scheduler(){
    80003a20:	fe010113          	addi	sp,sp,-32
    80003a24:	00113c23          	sd	ra,24(sp)
    80003a28:	00813823          	sd	s0,16(sp)
    80003a2c:	00913423          	sd	s1,8(sp)
    80003a30:	02010413          	addi	s0,sp,32
    80003a34:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80003a38:	00004797          	auipc	a5,0x4
    80003a3c:	6107b783          	ld	a5,1552(a5) # 80008048 <_ZN9Scheduler9singletonE>
    80003a40:	02079463          	bnez	a5,80003a68 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80003a44:	00004797          	auipc	a5,0x4
    80003a48:	6097b223          	sd	s1,1540(a5) # 80008048 <_ZN9Scheduler9singletonE>
    head = 0;
    80003a4c:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80003a50:	0004b423          	sd	zero,8(s1)
}
    80003a54:	01813083          	ld	ra,24(sp)
    80003a58:	01013403          	ld	s0,16(sp)
    80003a5c:	00813483          	ld	s1,8(sp)
    80003a60:	02010113          	addi	sp,sp,32
    80003a64:	00008067          	ret
    assert(singleton == 0);
    80003a68:	00004697          	auipc	a3,0x4
    80003a6c:	8c068693          	addi	a3,a3,-1856 # 80007328 <CONSOLE_STATUS+0x318>
    80003a70:	01500613          	li	a2,21
    80003a74:	00004597          	auipc	a1,0x4
    80003a78:	8cc58593          	addi	a1,a1,-1844 # 80007340 <CONSOLE_STATUS+0x330>
    80003a7c:	00004517          	auipc	a0,0x4
    80003a80:	8d450513          	addi	a0,a0,-1836 # 80007350 <CONSOLE_STATUS+0x340>
    80003a84:	ffffe097          	auipc	ra,0xffffe
    80003a88:	ef0080e7          	jalr	-272(ra) # 80001974 <_Z13assert_failedPKcS0_jS0_>
    80003a8c:	fb9ff06f          	j	80003a44 <_ZN9SchedulerC1Ev+0x24>

0000000080003a90 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80003a90:	ff010113          	addi	sp,sp,-16
    80003a94:	00813423          	sd	s0,8(sp)
    80003a98:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80003a9c:	00004797          	auipc	a5,0x4
    80003aa0:	5ac7b783          	ld	a5,1452(a5) # 80008048 <_ZN9Scheduler9singletonE>
    80003aa4:	0007b503          	ld	a0,0(a5)
}
    80003aa8:	00153513          	seqz	a0,a0
    80003aac:	00813403          	ld	s0,8(sp)
    80003ab0:	01010113          	addi	sp,sp,16
    80003ab4:	00008067          	ret

0000000080003ab8 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80003ab8:	fe010113          	addi	sp,sp,-32
    80003abc:	00113c23          	sd	ra,24(sp)
    80003ac0:	00813823          	sd	s0,16(sp)
    80003ac4:	00913423          	sd	s1,8(sp)
    80003ac8:	01213023          	sd	s2,0(sp)
    80003acc:	02010413          	addi	s0,sp,32
    80003ad0:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80003ad4:	00004917          	auipc	s2,0x4
    80003ad8:	57493903          	ld	s2,1396(s2) # 80008048 <_ZN9Scheduler9singletonE>
    80003adc:	00093783          	ld	a5,0(s2)
    80003ae0:	12078c63          	beqz	a5,80003c18 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003ae4:	00893903          	ld	s2,8(s2)
    80003ae8:	01000513          	li	a0,16
    80003aec:	ffffe097          	auipc	ra,0xffffe
    80003af0:	924080e7          	jalr	-1756(ra) # 80001410 <_Z9mem_allocm>
    80003af4:	00a90423          	sb	a0,8(s2)
    80003af8:	00855793          	srli	a5,a0,0x8
    80003afc:	00f904a3          	sb	a5,9(s2)
    80003b00:	01055793          	srli	a5,a0,0x10
    80003b04:	00f90523          	sb	a5,10(s2)
    80003b08:	0185579b          	srliw	a5,a0,0x18
    80003b0c:	00f905a3          	sb	a5,11(s2)
    80003b10:	02055793          	srli	a5,a0,0x20
    80003b14:	00f90623          	sb	a5,12(s2)
    80003b18:	02855793          	srli	a5,a0,0x28
    80003b1c:	00f906a3          	sb	a5,13(s2)
    80003b20:	03055793          	srli	a5,a0,0x30
    80003b24:	00f90723          	sb	a5,14(s2)
    80003b28:	03855513          	srli	a0,a0,0x38
    80003b2c:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80003b30:	00004617          	auipc	a2,0x4
    80003b34:	51860613          	addi	a2,a2,1304 # 80008048 <_ZN9Scheduler9singletonE>
    80003b38:	00063583          	ld	a1,0(a2)
    80003b3c:	0085b703          	ld	a4,8(a1)
    80003b40:	00874783          	lbu	a5,8(a4)
    80003b44:	00974683          	lbu	a3,9(a4)
    80003b48:	00869693          	slli	a3,a3,0x8
    80003b4c:	00f6e6b3          	or	a3,a3,a5
    80003b50:	00a74783          	lbu	a5,10(a4)
    80003b54:	01079793          	slli	a5,a5,0x10
    80003b58:	00d7e6b3          	or	a3,a5,a3
    80003b5c:	00b74783          	lbu	a5,11(a4)
    80003b60:	01879793          	slli	a5,a5,0x18
    80003b64:	00d7e7b3          	or	a5,a5,a3
    80003b68:	00c74683          	lbu	a3,12(a4)
    80003b6c:	02069693          	slli	a3,a3,0x20
    80003b70:	00f6e7b3          	or	a5,a3,a5
    80003b74:	00d74683          	lbu	a3,13(a4)
    80003b78:	02869693          	slli	a3,a3,0x28
    80003b7c:	00f6e6b3          	or	a3,a3,a5
    80003b80:	00e74783          	lbu	a5,14(a4)
    80003b84:	03079793          	slli	a5,a5,0x30
    80003b88:	00d7e6b3          	or	a3,a5,a3
    80003b8c:	00f74783          	lbu	a5,15(a4)
    80003b90:	03879793          	slli	a5,a5,0x38
    80003b94:	00d7e7b3          	or	a5,a5,a3
    80003b98:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80003b9c:	00978023          	sb	s1,0(a5)
    80003ba0:	0084d713          	srli	a4,s1,0x8
    80003ba4:	00e780a3          	sb	a4,1(a5)
    80003ba8:	0104d713          	srli	a4,s1,0x10
    80003bac:	00e78123          	sb	a4,2(a5)
    80003bb0:	0184d71b          	srliw	a4,s1,0x18
    80003bb4:	00e781a3          	sb	a4,3(a5)
    80003bb8:	0204d713          	srli	a4,s1,0x20
    80003bbc:	00e78223          	sb	a4,4(a5)
    80003bc0:	0284d713          	srli	a4,s1,0x28
    80003bc4:	00e782a3          	sb	a4,5(a5)
    80003bc8:	0304d713          	srli	a4,s1,0x30
    80003bcc:	00e78323          	sb	a4,6(a5)
    80003bd0:	0384d493          	srli	s1,s1,0x38
    80003bd4:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80003bd8:	00063783          	ld	a5,0(a2)
    80003bdc:	0087b783          	ld	a5,8(a5)
    80003be0:	00078423          	sb	zero,8(a5)
    80003be4:	000784a3          	sb	zero,9(a5)
    80003be8:	00078523          	sb	zero,10(a5)
    80003bec:	000785a3          	sb	zero,11(a5)
    80003bf0:	00078623          	sb	zero,12(a5)
    80003bf4:	000786a3          	sb	zero,13(a5)
    80003bf8:	00078723          	sb	zero,14(a5)
    80003bfc:	000787a3          	sb	zero,15(a5)
    }
}
    80003c00:	01813083          	ld	ra,24(sp)
    80003c04:	01013403          	ld	s0,16(sp)
    80003c08:	00813483          	ld	s1,8(sp)
    80003c0c:	00013903          	ld	s2,0(sp)
    80003c10:	02010113          	addi	sp,sp,32
    80003c14:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80003c18:	01000513          	li	a0,16
    80003c1c:	ffffd097          	auipc	ra,0xffffd
    80003c20:	7f4080e7          	jalr	2036(ra) # 80001410 <_Z9mem_allocm>
    80003c24:	00a93423          	sd	a0,8(s2)
    80003c28:	00004717          	auipc	a4,0x4
    80003c2c:	42070713          	addi	a4,a4,1056 # 80008048 <_ZN9Scheduler9singletonE>
    80003c30:	00073783          	ld	a5,0(a4)
    80003c34:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80003c38:	00073783          	ld	a5,0(a4)
    80003c3c:	0007b783          	ld	a5,0(a5)
    80003c40:	00978023          	sb	s1,0(a5)
    80003c44:	0084d693          	srli	a3,s1,0x8
    80003c48:	00d780a3          	sb	a3,1(a5)
    80003c4c:	0104d693          	srli	a3,s1,0x10
    80003c50:	00d78123          	sb	a3,2(a5)
    80003c54:	0184d69b          	srliw	a3,s1,0x18
    80003c58:	00d781a3          	sb	a3,3(a5)
    80003c5c:	0204d693          	srli	a3,s1,0x20
    80003c60:	00d78223          	sb	a3,4(a5)
    80003c64:	0284d693          	srli	a3,s1,0x28
    80003c68:	00d782a3          	sb	a3,5(a5)
    80003c6c:	0304d693          	srli	a3,s1,0x30
    80003c70:	00d78323          	sb	a3,6(a5)
    80003c74:	0384d493          	srli	s1,s1,0x38
    80003c78:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80003c7c:	00073783          	ld	a5,0(a4)
    80003c80:	0007b783          	ld	a5,0(a5)
    80003c84:	00078423          	sb	zero,8(a5)
    80003c88:	000784a3          	sb	zero,9(a5)
    80003c8c:	00078523          	sb	zero,10(a5)
    80003c90:	000785a3          	sb	zero,11(a5)
    80003c94:	00078623          	sb	zero,12(a5)
    80003c98:	000786a3          	sb	zero,13(a5)
    80003c9c:	00078723          	sb	zero,14(a5)
    80003ca0:	000787a3          	sb	zero,15(a5)
    80003ca4:	f5dff06f          	j	80003c00 <_ZN9Scheduler3putEP7_thread+0x148>

0000000080003ca8 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80003ca8:	ff010113          	addi	sp,sp,-16
    80003cac:	00813423          	sd	s0,8(sp)
    80003cb0:	01010413          	addi	s0,sp,16
    ThreadList* tmp = singleton->head;
    80003cb4:	00004617          	auipc	a2,0x4
    80003cb8:	39463603          	ld	a2,916(a2) # 80008048 <_ZN9Scheduler9singletonE>
    80003cbc:	00063783          	ld	a5,0(a2)
    if(tmp == 0){
    80003cc0:	0c078e63          	beqz	a5,80003d9c <_ZN9Scheduler3getEv+0xf4>
        return 0;
    }
    thread_t thread = tmp->thread;
    80003cc4:	0007c503          	lbu	a0,0(a5)
    80003cc8:	0017c703          	lbu	a4,1(a5)
    80003ccc:	00871713          	slli	a4,a4,0x8
    80003cd0:	00a76733          	or	a4,a4,a0
    80003cd4:	0027c503          	lbu	a0,2(a5)
    80003cd8:	01051513          	slli	a0,a0,0x10
    80003cdc:	00e56733          	or	a4,a0,a4
    80003ce0:	0037c503          	lbu	a0,3(a5)
    80003ce4:	01851513          	slli	a0,a0,0x18
    80003ce8:	00e56533          	or	a0,a0,a4
    80003cec:	0047c703          	lbu	a4,4(a5)
    80003cf0:	02071713          	slli	a4,a4,0x20
    80003cf4:	00a76533          	or	a0,a4,a0
    80003cf8:	0057c703          	lbu	a4,5(a5)
    80003cfc:	02871713          	slli	a4,a4,0x28
    80003d00:	00a76733          	or	a4,a4,a0
    80003d04:	0067c503          	lbu	a0,6(a5)
    80003d08:	03051513          	slli	a0,a0,0x30
    80003d0c:	00e56733          	or	a4,a0,a4
    80003d10:	0077c503          	lbu	a0,7(a5)
    80003d14:	03851513          	slli	a0,a0,0x38
    80003d18:	00e56533          	or	a0,a0,a4
    singleton->head = tmp->next;
    80003d1c:	0087c683          	lbu	a3,8(a5)
    80003d20:	0097c703          	lbu	a4,9(a5)
    80003d24:	00871713          	slli	a4,a4,0x8
    80003d28:	00d766b3          	or	a3,a4,a3
    80003d2c:	00a7c703          	lbu	a4,10(a5)
    80003d30:	01071713          	slli	a4,a4,0x10
    80003d34:	00d76733          	or	a4,a4,a3
    80003d38:	00b7c683          	lbu	a3,11(a5)
    80003d3c:	01869693          	slli	a3,a3,0x18
    80003d40:	00e6e733          	or	a4,a3,a4
    80003d44:	00c7c683          	lbu	a3,12(a5)
    80003d48:	02069693          	slli	a3,a3,0x20
    80003d4c:	00e6e6b3          	or	a3,a3,a4
    80003d50:	00d7c703          	lbu	a4,13(a5)
    80003d54:	02871713          	slli	a4,a4,0x28
    80003d58:	00d766b3          	or	a3,a4,a3
    80003d5c:	00e7c703          	lbu	a4,14(a5)
    80003d60:	03071713          	slli	a4,a4,0x30
    80003d64:	00d76733          	or	a4,a4,a3
    80003d68:	00f7c783          	lbu	a5,15(a5)
    80003d6c:	03879793          	slli	a5,a5,0x38
    80003d70:	00e7e7b3          	or	a5,a5,a4
    80003d74:	00f63023          	sd	a5,0(a2)
    if(singleton->head == 0){
    80003d78:	00004797          	auipc	a5,0x4
    80003d7c:	2d07b783          	ld	a5,720(a5) # 80008048 <_ZN9Scheduler9singletonE>
    80003d80:	0007b703          	ld	a4,0(a5)
    80003d84:	00070863          	beqz	a4,80003d94 <_ZN9Scheduler3getEv+0xec>
        singleton->tail = 0;
    }
    // mem_free(tmp);
    return thread;
}
    80003d88:	00813403          	ld	s0,8(sp)
    80003d8c:	01010113          	addi	sp,sp,16
    80003d90:	00008067          	ret
        singleton->tail = 0;
    80003d94:	0007b423          	sd	zero,8(a5)
    80003d98:	ff1ff06f          	j	80003d88 <_ZN9Scheduler3getEv+0xe0>
        return 0;
    80003d9c:	00078513          	mv	a0,a5
    80003da0:	fe9ff06f          	j	80003d88 <_ZN9Scheduler3getEv+0xe0>

0000000080003da4 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80003da4:	ff010113          	addi	sp,sp,-16
    80003da8:	00813423          	sd	s0,8(sp)
    80003dac:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80003db0:	00004797          	auipc	a5,0x4
    80003db4:	2987b783          	ld	a5,664(a5) # 80008048 <_ZN9Scheduler9singletonE>
    80003db8:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80003dbc:	00000513          	li	a0,0
    while(tmp != 0){
    80003dc0:	06078263          	beqz	a5,80003e24 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80003dc4:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80003dc8:	0087c683          	lbu	a3,8(a5)
    80003dcc:	0097c703          	lbu	a4,9(a5)
    80003dd0:	00871713          	slli	a4,a4,0x8
    80003dd4:	00d766b3          	or	a3,a4,a3
    80003dd8:	00a7c703          	lbu	a4,10(a5)
    80003ddc:	01071713          	slli	a4,a4,0x10
    80003de0:	00d76733          	or	a4,a4,a3
    80003de4:	00b7c683          	lbu	a3,11(a5)
    80003de8:	01869693          	slli	a3,a3,0x18
    80003dec:	00e6e733          	or	a4,a3,a4
    80003df0:	00c7c683          	lbu	a3,12(a5)
    80003df4:	02069693          	slli	a3,a3,0x20
    80003df8:	00e6e6b3          	or	a3,a3,a4
    80003dfc:	00d7c703          	lbu	a4,13(a5)
    80003e00:	02871713          	slli	a4,a4,0x28
    80003e04:	00d766b3          	or	a3,a4,a3
    80003e08:	00e7c703          	lbu	a4,14(a5)
    80003e0c:	03071713          	slli	a4,a4,0x30
    80003e10:	00d76733          	or	a4,a4,a3
    80003e14:	00f7c783          	lbu	a5,15(a5)
    80003e18:	03879793          	slli	a5,a5,0x38
    80003e1c:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80003e20:	fa1ff06f          	j	80003dc0 <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80003e24:	00813403          	ld	s0,8(sp)
    80003e28:	01010113          	addi	sp,sp,16
    80003e2c:	00008067          	ret

0000000080003e30 <start>:
    80003e30:	ff010113          	addi	sp,sp,-16
    80003e34:	00813423          	sd	s0,8(sp)
    80003e38:	01010413          	addi	s0,sp,16
    80003e3c:	300027f3          	csrr	a5,mstatus
    80003e40:	ffffe737          	lui	a4,0xffffe
    80003e44:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff554f>
    80003e48:	00e7f7b3          	and	a5,a5,a4
    80003e4c:	00001737          	lui	a4,0x1
    80003e50:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003e54:	00e7e7b3          	or	a5,a5,a4
    80003e58:	30079073          	csrw	mstatus,a5
    80003e5c:	00000797          	auipc	a5,0x0
    80003e60:	16078793          	addi	a5,a5,352 # 80003fbc <system_main>
    80003e64:	34179073          	csrw	mepc,a5
    80003e68:	00000793          	li	a5,0
    80003e6c:	18079073          	csrw	satp,a5
    80003e70:	000107b7          	lui	a5,0x10
    80003e74:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003e78:	30279073          	csrw	medeleg,a5
    80003e7c:	30379073          	csrw	mideleg,a5
    80003e80:	104027f3          	csrr	a5,sie
    80003e84:	2227e793          	ori	a5,a5,546
    80003e88:	10479073          	csrw	sie,a5
    80003e8c:	fff00793          	li	a5,-1
    80003e90:	00a7d793          	srli	a5,a5,0xa
    80003e94:	3b079073          	csrw	pmpaddr0,a5
    80003e98:	00f00793          	li	a5,15
    80003e9c:	3a079073          	csrw	pmpcfg0,a5
    80003ea0:	f14027f3          	csrr	a5,mhartid
    80003ea4:	0200c737          	lui	a4,0x200c
    80003ea8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003eac:	0007869b          	sext.w	a3,a5
    80003eb0:	00269713          	slli	a4,a3,0x2
    80003eb4:	000f4637          	lui	a2,0xf4
    80003eb8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003ebc:	00d70733          	add	a4,a4,a3
    80003ec0:	0037979b          	slliw	a5,a5,0x3
    80003ec4:	020046b7          	lui	a3,0x2004
    80003ec8:	00d787b3          	add	a5,a5,a3
    80003ecc:	00c585b3          	add	a1,a1,a2
    80003ed0:	00371693          	slli	a3,a4,0x3
    80003ed4:	00004717          	auipc	a4,0x4
    80003ed8:	17c70713          	addi	a4,a4,380 # 80008050 <timer_scratch>
    80003edc:	00b7b023          	sd	a1,0(a5)
    80003ee0:	00d70733          	add	a4,a4,a3
    80003ee4:	00f73c23          	sd	a5,24(a4)
    80003ee8:	02c73023          	sd	a2,32(a4)
    80003eec:	34071073          	csrw	mscratch,a4
    80003ef0:	00000797          	auipc	a5,0x0
    80003ef4:	6e078793          	addi	a5,a5,1760 # 800045d0 <timervec>
    80003ef8:	30579073          	csrw	mtvec,a5
    80003efc:	300027f3          	csrr	a5,mstatus
    80003f00:	0087e793          	ori	a5,a5,8
    80003f04:	30079073          	csrw	mstatus,a5
    80003f08:	304027f3          	csrr	a5,mie
    80003f0c:	0807e793          	ori	a5,a5,128
    80003f10:	30479073          	csrw	mie,a5
    80003f14:	f14027f3          	csrr	a5,mhartid
    80003f18:	0007879b          	sext.w	a5,a5
    80003f1c:	00078213          	mv	tp,a5
    80003f20:	30200073          	mret
    80003f24:	00813403          	ld	s0,8(sp)
    80003f28:	01010113          	addi	sp,sp,16
    80003f2c:	00008067          	ret

0000000080003f30 <timerinit>:
    80003f30:	ff010113          	addi	sp,sp,-16
    80003f34:	00813423          	sd	s0,8(sp)
    80003f38:	01010413          	addi	s0,sp,16
    80003f3c:	f14027f3          	csrr	a5,mhartid
    80003f40:	0200c737          	lui	a4,0x200c
    80003f44:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003f48:	0007869b          	sext.w	a3,a5
    80003f4c:	00269713          	slli	a4,a3,0x2
    80003f50:	000f4637          	lui	a2,0xf4
    80003f54:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003f58:	00d70733          	add	a4,a4,a3
    80003f5c:	0037979b          	slliw	a5,a5,0x3
    80003f60:	020046b7          	lui	a3,0x2004
    80003f64:	00d787b3          	add	a5,a5,a3
    80003f68:	00c585b3          	add	a1,a1,a2
    80003f6c:	00371693          	slli	a3,a4,0x3
    80003f70:	00004717          	auipc	a4,0x4
    80003f74:	0e070713          	addi	a4,a4,224 # 80008050 <timer_scratch>
    80003f78:	00b7b023          	sd	a1,0(a5)
    80003f7c:	00d70733          	add	a4,a4,a3
    80003f80:	00f73c23          	sd	a5,24(a4)
    80003f84:	02c73023          	sd	a2,32(a4)
    80003f88:	34071073          	csrw	mscratch,a4
    80003f8c:	00000797          	auipc	a5,0x0
    80003f90:	64478793          	addi	a5,a5,1604 # 800045d0 <timervec>
    80003f94:	30579073          	csrw	mtvec,a5
    80003f98:	300027f3          	csrr	a5,mstatus
    80003f9c:	0087e793          	ori	a5,a5,8
    80003fa0:	30079073          	csrw	mstatus,a5
    80003fa4:	304027f3          	csrr	a5,mie
    80003fa8:	0807e793          	ori	a5,a5,128
    80003fac:	30479073          	csrw	mie,a5
    80003fb0:	00813403          	ld	s0,8(sp)
    80003fb4:	01010113          	addi	sp,sp,16
    80003fb8:	00008067          	ret

0000000080003fbc <system_main>:
    80003fbc:	fe010113          	addi	sp,sp,-32
    80003fc0:	00813823          	sd	s0,16(sp)
    80003fc4:	00913423          	sd	s1,8(sp)
    80003fc8:	00113c23          	sd	ra,24(sp)
    80003fcc:	02010413          	addi	s0,sp,32
    80003fd0:	00000097          	auipc	ra,0x0
    80003fd4:	0c4080e7          	jalr	196(ra) # 80004094 <cpuid>
    80003fd8:	00004497          	auipc	s1,0x4
    80003fdc:	01848493          	addi	s1,s1,24 # 80007ff0 <started>
    80003fe0:	02050263          	beqz	a0,80004004 <system_main+0x48>
    80003fe4:	0004a783          	lw	a5,0(s1)
    80003fe8:	0007879b          	sext.w	a5,a5
    80003fec:	fe078ce3          	beqz	a5,80003fe4 <system_main+0x28>
    80003ff0:	0ff0000f          	fence
    80003ff4:	00003517          	auipc	a0,0x3
    80003ff8:	39c50513          	addi	a0,a0,924 # 80007390 <CONSOLE_STATUS+0x380>
    80003ffc:	00001097          	auipc	ra,0x1
    80004000:	a70080e7          	jalr	-1424(ra) # 80004a6c <panic>
    80004004:	00001097          	auipc	ra,0x1
    80004008:	9c4080e7          	jalr	-1596(ra) # 800049c8 <consoleinit>
    8000400c:	00001097          	auipc	ra,0x1
    80004010:	150080e7          	jalr	336(ra) # 8000515c <printfinit>
    80004014:	00003517          	auipc	a0,0x3
    80004018:	45c50513          	addi	a0,a0,1116 # 80007470 <CONSOLE_STATUS+0x460>
    8000401c:	00001097          	auipc	ra,0x1
    80004020:	aac080e7          	jalr	-1364(ra) # 80004ac8 <__printf>
    80004024:	00003517          	auipc	a0,0x3
    80004028:	33c50513          	addi	a0,a0,828 # 80007360 <CONSOLE_STATUS+0x350>
    8000402c:	00001097          	auipc	ra,0x1
    80004030:	a9c080e7          	jalr	-1380(ra) # 80004ac8 <__printf>
    80004034:	00003517          	auipc	a0,0x3
    80004038:	43c50513          	addi	a0,a0,1084 # 80007470 <CONSOLE_STATUS+0x460>
    8000403c:	00001097          	auipc	ra,0x1
    80004040:	a8c080e7          	jalr	-1396(ra) # 80004ac8 <__printf>
    80004044:	00001097          	auipc	ra,0x1
    80004048:	4a4080e7          	jalr	1188(ra) # 800054e8 <kinit>
    8000404c:	00000097          	auipc	ra,0x0
    80004050:	148080e7          	jalr	328(ra) # 80004194 <trapinit>
    80004054:	00000097          	auipc	ra,0x0
    80004058:	16c080e7          	jalr	364(ra) # 800041c0 <trapinithart>
    8000405c:	00000097          	auipc	ra,0x0
    80004060:	5b4080e7          	jalr	1460(ra) # 80004610 <plicinit>
    80004064:	00000097          	auipc	ra,0x0
    80004068:	5d4080e7          	jalr	1492(ra) # 80004638 <plicinithart>
    8000406c:	00000097          	auipc	ra,0x0
    80004070:	078080e7          	jalr	120(ra) # 800040e4 <userinit>
    80004074:	0ff0000f          	fence
    80004078:	00100793          	li	a5,1
    8000407c:	00003517          	auipc	a0,0x3
    80004080:	2fc50513          	addi	a0,a0,764 # 80007378 <CONSOLE_STATUS+0x368>
    80004084:	00f4a023          	sw	a5,0(s1)
    80004088:	00001097          	auipc	ra,0x1
    8000408c:	a40080e7          	jalr	-1472(ra) # 80004ac8 <__printf>
    80004090:	0000006f          	j	80004090 <system_main+0xd4>

0000000080004094 <cpuid>:
    80004094:	ff010113          	addi	sp,sp,-16
    80004098:	00813423          	sd	s0,8(sp)
    8000409c:	01010413          	addi	s0,sp,16
    800040a0:	00020513          	mv	a0,tp
    800040a4:	00813403          	ld	s0,8(sp)
    800040a8:	0005051b          	sext.w	a0,a0
    800040ac:	01010113          	addi	sp,sp,16
    800040b0:	00008067          	ret

00000000800040b4 <mycpu>:
    800040b4:	ff010113          	addi	sp,sp,-16
    800040b8:	00813423          	sd	s0,8(sp)
    800040bc:	01010413          	addi	s0,sp,16
    800040c0:	00020793          	mv	a5,tp
    800040c4:	00813403          	ld	s0,8(sp)
    800040c8:	0007879b          	sext.w	a5,a5
    800040cc:	00779793          	slli	a5,a5,0x7
    800040d0:	00005517          	auipc	a0,0x5
    800040d4:	fb050513          	addi	a0,a0,-80 # 80009080 <cpus>
    800040d8:	00f50533          	add	a0,a0,a5
    800040dc:	01010113          	addi	sp,sp,16
    800040e0:	00008067          	ret

00000000800040e4 <userinit>:
    800040e4:	ff010113          	addi	sp,sp,-16
    800040e8:	00813423          	sd	s0,8(sp)
    800040ec:	01010413          	addi	s0,sp,16
    800040f0:	00813403          	ld	s0,8(sp)
    800040f4:	01010113          	addi	sp,sp,16
    800040f8:	ffffd317          	auipc	t1,0xffffd
    800040fc:	7c030067          	jr	1984(t1) # 800018b8 <main>

0000000080004100 <either_copyout>:
    80004100:	ff010113          	addi	sp,sp,-16
    80004104:	00813023          	sd	s0,0(sp)
    80004108:	00113423          	sd	ra,8(sp)
    8000410c:	01010413          	addi	s0,sp,16
    80004110:	02051663          	bnez	a0,8000413c <either_copyout+0x3c>
    80004114:	00058513          	mv	a0,a1
    80004118:	00060593          	mv	a1,a2
    8000411c:	0006861b          	sext.w	a2,a3
    80004120:	00002097          	auipc	ra,0x2
    80004124:	c54080e7          	jalr	-940(ra) # 80005d74 <__memmove>
    80004128:	00813083          	ld	ra,8(sp)
    8000412c:	00013403          	ld	s0,0(sp)
    80004130:	00000513          	li	a0,0
    80004134:	01010113          	addi	sp,sp,16
    80004138:	00008067          	ret
    8000413c:	00003517          	auipc	a0,0x3
    80004140:	27c50513          	addi	a0,a0,636 # 800073b8 <CONSOLE_STATUS+0x3a8>
    80004144:	00001097          	auipc	ra,0x1
    80004148:	928080e7          	jalr	-1752(ra) # 80004a6c <panic>

000000008000414c <either_copyin>:
    8000414c:	ff010113          	addi	sp,sp,-16
    80004150:	00813023          	sd	s0,0(sp)
    80004154:	00113423          	sd	ra,8(sp)
    80004158:	01010413          	addi	s0,sp,16
    8000415c:	02059463          	bnez	a1,80004184 <either_copyin+0x38>
    80004160:	00060593          	mv	a1,a2
    80004164:	0006861b          	sext.w	a2,a3
    80004168:	00002097          	auipc	ra,0x2
    8000416c:	c0c080e7          	jalr	-1012(ra) # 80005d74 <__memmove>
    80004170:	00813083          	ld	ra,8(sp)
    80004174:	00013403          	ld	s0,0(sp)
    80004178:	00000513          	li	a0,0
    8000417c:	01010113          	addi	sp,sp,16
    80004180:	00008067          	ret
    80004184:	00003517          	auipc	a0,0x3
    80004188:	25c50513          	addi	a0,a0,604 # 800073e0 <CONSOLE_STATUS+0x3d0>
    8000418c:	00001097          	auipc	ra,0x1
    80004190:	8e0080e7          	jalr	-1824(ra) # 80004a6c <panic>

0000000080004194 <trapinit>:
    80004194:	ff010113          	addi	sp,sp,-16
    80004198:	00813423          	sd	s0,8(sp)
    8000419c:	01010413          	addi	s0,sp,16
    800041a0:	00813403          	ld	s0,8(sp)
    800041a4:	00003597          	auipc	a1,0x3
    800041a8:	26458593          	addi	a1,a1,612 # 80007408 <CONSOLE_STATUS+0x3f8>
    800041ac:	00005517          	auipc	a0,0x5
    800041b0:	f5450513          	addi	a0,a0,-172 # 80009100 <tickslock>
    800041b4:	01010113          	addi	sp,sp,16
    800041b8:	00001317          	auipc	t1,0x1
    800041bc:	5c030067          	jr	1472(t1) # 80005778 <initlock>

00000000800041c0 <trapinithart>:
    800041c0:	ff010113          	addi	sp,sp,-16
    800041c4:	00813423          	sd	s0,8(sp)
    800041c8:	01010413          	addi	s0,sp,16
    800041cc:	00000797          	auipc	a5,0x0
    800041d0:	2f478793          	addi	a5,a5,756 # 800044c0 <kernelvec>
    800041d4:	10579073          	csrw	stvec,a5
    800041d8:	00813403          	ld	s0,8(sp)
    800041dc:	01010113          	addi	sp,sp,16
    800041e0:	00008067          	ret

00000000800041e4 <usertrap>:
    800041e4:	ff010113          	addi	sp,sp,-16
    800041e8:	00813423          	sd	s0,8(sp)
    800041ec:	01010413          	addi	s0,sp,16
    800041f0:	00813403          	ld	s0,8(sp)
    800041f4:	01010113          	addi	sp,sp,16
    800041f8:	00008067          	ret

00000000800041fc <usertrapret>:
    800041fc:	ff010113          	addi	sp,sp,-16
    80004200:	00813423          	sd	s0,8(sp)
    80004204:	01010413          	addi	s0,sp,16
    80004208:	00813403          	ld	s0,8(sp)
    8000420c:	01010113          	addi	sp,sp,16
    80004210:	00008067          	ret

0000000080004214 <kerneltrap>:
    80004214:	fe010113          	addi	sp,sp,-32
    80004218:	00813823          	sd	s0,16(sp)
    8000421c:	00113c23          	sd	ra,24(sp)
    80004220:	00913423          	sd	s1,8(sp)
    80004224:	02010413          	addi	s0,sp,32
    80004228:	142025f3          	csrr	a1,scause
    8000422c:	100027f3          	csrr	a5,sstatus
    80004230:	0027f793          	andi	a5,a5,2
    80004234:	10079c63          	bnez	a5,8000434c <kerneltrap+0x138>
    80004238:	142027f3          	csrr	a5,scause
    8000423c:	0207ce63          	bltz	a5,80004278 <kerneltrap+0x64>
    80004240:	00003517          	auipc	a0,0x3
    80004244:	21050513          	addi	a0,a0,528 # 80007450 <CONSOLE_STATUS+0x440>
    80004248:	00001097          	auipc	ra,0x1
    8000424c:	880080e7          	jalr	-1920(ra) # 80004ac8 <__printf>
    80004250:	141025f3          	csrr	a1,sepc
    80004254:	14302673          	csrr	a2,stval
    80004258:	00003517          	auipc	a0,0x3
    8000425c:	20850513          	addi	a0,a0,520 # 80007460 <CONSOLE_STATUS+0x450>
    80004260:	00001097          	auipc	ra,0x1
    80004264:	868080e7          	jalr	-1944(ra) # 80004ac8 <__printf>
    80004268:	00003517          	auipc	a0,0x3
    8000426c:	21050513          	addi	a0,a0,528 # 80007478 <CONSOLE_STATUS+0x468>
    80004270:	00000097          	auipc	ra,0x0
    80004274:	7fc080e7          	jalr	2044(ra) # 80004a6c <panic>
    80004278:	0ff7f713          	andi	a4,a5,255
    8000427c:	00900693          	li	a3,9
    80004280:	04d70063          	beq	a4,a3,800042c0 <kerneltrap+0xac>
    80004284:	fff00713          	li	a4,-1
    80004288:	03f71713          	slli	a4,a4,0x3f
    8000428c:	00170713          	addi	a4,a4,1
    80004290:	fae798e3          	bne	a5,a4,80004240 <kerneltrap+0x2c>
    80004294:	00000097          	auipc	ra,0x0
    80004298:	e00080e7          	jalr	-512(ra) # 80004094 <cpuid>
    8000429c:	06050663          	beqz	a0,80004308 <kerneltrap+0xf4>
    800042a0:	144027f3          	csrr	a5,sip
    800042a4:	ffd7f793          	andi	a5,a5,-3
    800042a8:	14479073          	csrw	sip,a5
    800042ac:	01813083          	ld	ra,24(sp)
    800042b0:	01013403          	ld	s0,16(sp)
    800042b4:	00813483          	ld	s1,8(sp)
    800042b8:	02010113          	addi	sp,sp,32
    800042bc:	00008067          	ret
    800042c0:	00000097          	auipc	ra,0x0
    800042c4:	3c4080e7          	jalr	964(ra) # 80004684 <plic_claim>
    800042c8:	00a00793          	li	a5,10
    800042cc:	00050493          	mv	s1,a0
    800042d0:	06f50863          	beq	a0,a5,80004340 <kerneltrap+0x12c>
    800042d4:	fc050ce3          	beqz	a0,800042ac <kerneltrap+0x98>
    800042d8:	00050593          	mv	a1,a0
    800042dc:	00003517          	auipc	a0,0x3
    800042e0:	15450513          	addi	a0,a0,340 # 80007430 <CONSOLE_STATUS+0x420>
    800042e4:	00000097          	auipc	ra,0x0
    800042e8:	7e4080e7          	jalr	2020(ra) # 80004ac8 <__printf>
    800042ec:	01013403          	ld	s0,16(sp)
    800042f0:	01813083          	ld	ra,24(sp)
    800042f4:	00048513          	mv	a0,s1
    800042f8:	00813483          	ld	s1,8(sp)
    800042fc:	02010113          	addi	sp,sp,32
    80004300:	00000317          	auipc	t1,0x0
    80004304:	3bc30067          	jr	956(t1) # 800046bc <plic_complete>
    80004308:	00005517          	auipc	a0,0x5
    8000430c:	df850513          	addi	a0,a0,-520 # 80009100 <tickslock>
    80004310:	00001097          	auipc	ra,0x1
    80004314:	48c080e7          	jalr	1164(ra) # 8000579c <acquire>
    80004318:	00004717          	auipc	a4,0x4
    8000431c:	cdc70713          	addi	a4,a4,-804 # 80007ff4 <ticks>
    80004320:	00072783          	lw	a5,0(a4)
    80004324:	00005517          	auipc	a0,0x5
    80004328:	ddc50513          	addi	a0,a0,-548 # 80009100 <tickslock>
    8000432c:	0017879b          	addiw	a5,a5,1
    80004330:	00f72023          	sw	a5,0(a4)
    80004334:	00001097          	auipc	ra,0x1
    80004338:	534080e7          	jalr	1332(ra) # 80005868 <release>
    8000433c:	f65ff06f          	j	800042a0 <kerneltrap+0x8c>
    80004340:	00001097          	auipc	ra,0x1
    80004344:	090080e7          	jalr	144(ra) # 800053d0 <uartintr>
    80004348:	fa5ff06f          	j	800042ec <kerneltrap+0xd8>
    8000434c:	00003517          	auipc	a0,0x3
    80004350:	0c450513          	addi	a0,a0,196 # 80007410 <CONSOLE_STATUS+0x400>
    80004354:	00000097          	auipc	ra,0x0
    80004358:	718080e7          	jalr	1816(ra) # 80004a6c <panic>

000000008000435c <clockintr>:
    8000435c:	fe010113          	addi	sp,sp,-32
    80004360:	00813823          	sd	s0,16(sp)
    80004364:	00913423          	sd	s1,8(sp)
    80004368:	00113c23          	sd	ra,24(sp)
    8000436c:	02010413          	addi	s0,sp,32
    80004370:	00005497          	auipc	s1,0x5
    80004374:	d9048493          	addi	s1,s1,-624 # 80009100 <tickslock>
    80004378:	00048513          	mv	a0,s1
    8000437c:	00001097          	auipc	ra,0x1
    80004380:	420080e7          	jalr	1056(ra) # 8000579c <acquire>
    80004384:	00004717          	auipc	a4,0x4
    80004388:	c7070713          	addi	a4,a4,-912 # 80007ff4 <ticks>
    8000438c:	00072783          	lw	a5,0(a4)
    80004390:	01013403          	ld	s0,16(sp)
    80004394:	01813083          	ld	ra,24(sp)
    80004398:	00048513          	mv	a0,s1
    8000439c:	0017879b          	addiw	a5,a5,1
    800043a0:	00813483          	ld	s1,8(sp)
    800043a4:	00f72023          	sw	a5,0(a4)
    800043a8:	02010113          	addi	sp,sp,32
    800043ac:	00001317          	auipc	t1,0x1
    800043b0:	4bc30067          	jr	1212(t1) # 80005868 <release>

00000000800043b4 <devintr>:
    800043b4:	142027f3          	csrr	a5,scause
    800043b8:	00000513          	li	a0,0
    800043bc:	0007c463          	bltz	a5,800043c4 <devintr+0x10>
    800043c0:	00008067          	ret
    800043c4:	fe010113          	addi	sp,sp,-32
    800043c8:	00813823          	sd	s0,16(sp)
    800043cc:	00113c23          	sd	ra,24(sp)
    800043d0:	00913423          	sd	s1,8(sp)
    800043d4:	02010413          	addi	s0,sp,32
    800043d8:	0ff7f713          	andi	a4,a5,255
    800043dc:	00900693          	li	a3,9
    800043e0:	04d70c63          	beq	a4,a3,80004438 <devintr+0x84>
    800043e4:	fff00713          	li	a4,-1
    800043e8:	03f71713          	slli	a4,a4,0x3f
    800043ec:	00170713          	addi	a4,a4,1
    800043f0:	00e78c63          	beq	a5,a4,80004408 <devintr+0x54>
    800043f4:	01813083          	ld	ra,24(sp)
    800043f8:	01013403          	ld	s0,16(sp)
    800043fc:	00813483          	ld	s1,8(sp)
    80004400:	02010113          	addi	sp,sp,32
    80004404:	00008067          	ret
    80004408:	00000097          	auipc	ra,0x0
    8000440c:	c8c080e7          	jalr	-884(ra) # 80004094 <cpuid>
    80004410:	06050663          	beqz	a0,8000447c <devintr+0xc8>
    80004414:	144027f3          	csrr	a5,sip
    80004418:	ffd7f793          	andi	a5,a5,-3
    8000441c:	14479073          	csrw	sip,a5
    80004420:	01813083          	ld	ra,24(sp)
    80004424:	01013403          	ld	s0,16(sp)
    80004428:	00813483          	ld	s1,8(sp)
    8000442c:	00200513          	li	a0,2
    80004430:	02010113          	addi	sp,sp,32
    80004434:	00008067          	ret
    80004438:	00000097          	auipc	ra,0x0
    8000443c:	24c080e7          	jalr	588(ra) # 80004684 <plic_claim>
    80004440:	00a00793          	li	a5,10
    80004444:	00050493          	mv	s1,a0
    80004448:	06f50663          	beq	a0,a5,800044b4 <devintr+0x100>
    8000444c:	00100513          	li	a0,1
    80004450:	fa0482e3          	beqz	s1,800043f4 <devintr+0x40>
    80004454:	00048593          	mv	a1,s1
    80004458:	00003517          	auipc	a0,0x3
    8000445c:	fd850513          	addi	a0,a0,-40 # 80007430 <CONSOLE_STATUS+0x420>
    80004460:	00000097          	auipc	ra,0x0
    80004464:	668080e7          	jalr	1640(ra) # 80004ac8 <__printf>
    80004468:	00048513          	mv	a0,s1
    8000446c:	00000097          	auipc	ra,0x0
    80004470:	250080e7          	jalr	592(ra) # 800046bc <plic_complete>
    80004474:	00100513          	li	a0,1
    80004478:	f7dff06f          	j	800043f4 <devintr+0x40>
    8000447c:	00005517          	auipc	a0,0x5
    80004480:	c8450513          	addi	a0,a0,-892 # 80009100 <tickslock>
    80004484:	00001097          	auipc	ra,0x1
    80004488:	318080e7          	jalr	792(ra) # 8000579c <acquire>
    8000448c:	00004717          	auipc	a4,0x4
    80004490:	b6870713          	addi	a4,a4,-1176 # 80007ff4 <ticks>
    80004494:	00072783          	lw	a5,0(a4)
    80004498:	00005517          	auipc	a0,0x5
    8000449c:	c6850513          	addi	a0,a0,-920 # 80009100 <tickslock>
    800044a0:	0017879b          	addiw	a5,a5,1
    800044a4:	00f72023          	sw	a5,0(a4)
    800044a8:	00001097          	auipc	ra,0x1
    800044ac:	3c0080e7          	jalr	960(ra) # 80005868 <release>
    800044b0:	f65ff06f          	j	80004414 <devintr+0x60>
    800044b4:	00001097          	auipc	ra,0x1
    800044b8:	f1c080e7          	jalr	-228(ra) # 800053d0 <uartintr>
    800044bc:	fadff06f          	j	80004468 <devintr+0xb4>

00000000800044c0 <kernelvec>:
    800044c0:	f0010113          	addi	sp,sp,-256
    800044c4:	00113023          	sd	ra,0(sp)
    800044c8:	00213423          	sd	sp,8(sp)
    800044cc:	00313823          	sd	gp,16(sp)
    800044d0:	00413c23          	sd	tp,24(sp)
    800044d4:	02513023          	sd	t0,32(sp)
    800044d8:	02613423          	sd	t1,40(sp)
    800044dc:	02713823          	sd	t2,48(sp)
    800044e0:	02813c23          	sd	s0,56(sp)
    800044e4:	04913023          	sd	s1,64(sp)
    800044e8:	04a13423          	sd	a0,72(sp)
    800044ec:	04b13823          	sd	a1,80(sp)
    800044f0:	04c13c23          	sd	a2,88(sp)
    800044f4:	06d13023          	sd	a3,96(sp)
    800044f8:	06e13423          	sd	a4,104(sp)
    800044fc:	06f13823          	sd	a5,112(sp)
    80004500:	07013c23          	sd	a6,120(sp)
    80004504:	09113023          	sd	a7,128(sp)
    80004508:	09213423          	sd	s2,136(sp)
    8000450c:	09313823          	sd	s3,144(sp)
    80004510:	09413c23          	sd	s4,152(sp)
    80004514:	0b513023          	sd	s5,160(sp)
    80004518:	0b613423          	sd	s6,168(sp)
    8000451c:	0b713823          	sd	s7,176(sp)
    80004520:	0b813c23          	sd	s8,184(sp)
    80004524:	0d913023          	sd	s9,192(sp)
    80004528:	0da13423          	sd	s10,200(sp)
    8000452c:	0db13823          	sd	s11,208(sp)
    80004530:	0dc13c23          	sd	t3,216(sp)
    80004534:	0fd13023          	sd	t4,224(sp)
    80004538:	0fe13423          	sd	t5,232(sp)
    8000453c:	0ff13823          	sd	t6,240(sp)
    80004540:	cd5ff0ef          	jal	ra,80004214 <kerneltrap>
    80004544:	00013083          	ld	ra,0(sp)
    80004548:	00813103          	ld	sp,8(sp)
    8000454c:	01013183          	ld	gp,16(sp)
    80004550:	02013283          	ld	t0,32(sp)
    80004554:	02813303          	ld	t1,40(sp)
    80004558:	03013383          	ld	t2,48(sp)
    8000455c:	03813403          	ld	s0,56(sp)
    80004560:	04013483          	ld	s1,64(sp)
    80004564:	04813503          	ld	a0,72(sp)
    80004568:	05013583          	ld	a1,80(sp)
    8000456c:	05813603          	ld	a2,88(sp)
    80004570:	06013683          	ld	a3,96(sp)
    80004574:	06813703          	ld	a4,104(sp)
    80004578:	07013783          	ld	a5,112(sp)
    8000457c:	07813803          	ld	a6,120(sp)
    80004580:	08013883          	ld	a7,128(sp)
    80004584:	08813903          	ld	s2,136(sp)
    80004588:	09013983          	ld	s3,144(sp)
    8000458c:	09813a03          	ld	s4,152(sp)
    80004590:	0a013a83          	ld	s5,160(sp)
    80004594:	0a813b03          	ld	s6,168(sp)
    80004598:	0b013b83          	ld	s7,176(sp)
    8000459c:	0b813c03          	ld	s8,184(sp)
    800045a0:	0c013c83          	ld	s9,192(sp)
    800045a4:	0c813d03          	ld	s10,200(sp)
    800045a8:	0d013d83          	ld	s11,208(sp)
    800045ac:	0d813e03          	ld	t3,216(sp)
    800045b0:	0e013e83          	ld	t4,224(sp)
    800045b4:	0e813f03          	ld	t5,232(sp)
    800045b8:	0f013f83          	ld	t6,240(sp)
    800045bc:	10010113          	addi	sp,sp,256
    800045c0:	10200073          	sret
    800045c4:	00000013          	nop
    800045c8:	00000013          	nop
    800045cc:	00000013          	nop

00000000800045d0 <timervec>:
    800045d0:	34051573          	csrrw	a0,mscratch,a0
    800045d4:	00b53023          	sd	a1,0(a0)
    800045d8:	00c53423          	sd	a2,8(a0)
    800045dc:	00d53823          	sd	a3,16(a0)
    800045e0:	01853583          	ld	a1,24(a0)
    800045e4:	02053603          	ld	a2,32(a0)
    800045e8:	0005b683          	ld	a3,0(a1)
    800045ec:	00c686b3          	add	a3,a3,a2
    800045f0:	00d5b023          	sd	a3,0(a1)
    800045f4:	00200593          	li	a1,2
    800045f8:	14459073          	csrw	sip,a1
    800045fc:	01053683          	ld	a3,16(a0)
    80004600:	00853603          	ld	a2,8(a0)
    80004604:	00053583          	ld	a1,0(a0)
    80004608:	34051573          	csrrw	a0,mscratch,a0
    8000460c:	30200073          	mret

0000000080004610 <plicinit>:
    80004610:	ff010113          	addi	sp,sp,-16
    80004614:	00813423          	sd	s0,8(sp)
    80004618:	01010413          	addi	s0,sp,16
    8000461c:	00813403          	ld	s0,8(sp)
    80004620:	0c0007b7          	lui	a5,0xc000
    80004624:	00100713          	li	a4,1
    80004628:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000462c:	00e7a223          	sw	a4,4(a5)
    80004630:	01010113          	addi	sp,sp,16
    80004634:	00008067          	ret

0000000080004638 <plicinithart>:
    80004638:	ff010113          	addi	sp,sp,-16
    8000463c:	00813023          	sd	s0,0(sp)
    80004640:	00113423          	sd	ra,8(sp)
    80004644:	01010413          	addi	s0,sp,16
    80004648:	00000097          	auipc	ra,0x0
    8000464c:	a4c080e7          	jalr	-1460(ra) # 80004094 <cpuid>
    80004650:	0085171b          	slliw	a4,a0,0x8
    80004654:	0c0027b7          	lui	a5,0xc002
    80004658:	00e787b3          	add	a5,a5,a4
    8000465c:	40200713          	li	a4,1026
    80004660:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80004664:	00813083          	ld	ra,8(sp)
    80004668:	00013403          	ld	s0,0(sp)
    8000466c:	00d5151b          	slliw	a0,a0,0xd
    80004670:	0c2017b7          	lui	a5,0xc201
    80004674:	00a78533          	add	a0,a5,a0
    80004678:	00052023          	sw	zero,0(a0)
    8000467c:	01010113          	addi	sp,sp,16
    80004680:	00008067          	ret

0000000080004684 <plic_claim>:
    80004684:	ff010113          	addi	sp,sp,-16
    80004688:	00813023          	sd	s0,0(sp)
    8000468c:	00113423          	sd	ra,8(sp)
    80004690:	01010413          	addi	s0,sp,16
    80004694:	00000097          	auipc	ra,0x0
    80004698:	a00080e7          	jalr	-1536(ra) # 80004094 <cpuid>
    8000469c:	00813083          	ld	ra,8(sp)
    800046a0:	00013403          	ld	s0,0(sp)
    800046a4:	00d5151b          	slliw	a0,a0,0xd
    800046a8:	0c2017b7          	lui	a5,0xc201
    800046ac:	00a78533          	add	a0,a5,a0
    800046b0:	00452503          	lw	a0,4(a0)
    800046b4:	01010113          	addi	sp,sp,16
    800046b8:	00008067          	ret

00000000800046bc <plic_complete>:
    800046bc:	fe010113          	addi	sp,sp,-32
    800046c0:	00813823          	sd	s0,16(sp)
    800046c4:	00913423          	sd	s1,8(sp)
    800046c8:	00113c23          	sd	ra,24(sp)
    800046cc:	02010413          	addi	s0,sp,32
    800046d0:	00050493          	mv	s1,a0
    800046d4:	00000097          	auipc	ra,0x0
    800046d8:	9c0080e7          	jalr	-1600(ra) # 80004094 <cpuid>
    800046dc:	01813083          	ld	ra,24(sp)
    800046e0:	01013403          	ld	s0,16(sp)
    800046e4:	00d5179b          	slliw	a5,a0,0xd
    800046e8:	0c201737          	lui	a4,0xc201
    800046ec:	00f707b3          	add	a5,a4,a5
    800046f0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800046f4:	00813483          	ld	s1,8(sp)
    800046f8:	02010113          	addi	sp,sp,32
    800046fc:	00008067          	ret

0000000080004700 <consolewrite>:
    80004700:	fb010113          	addi	sp,sp,-80
    80004704:	04813023          	sd	s0,64(sp)
    80004708:	04113423          	sd	ra,72(sp)
    8000470c:	02913c23          	sd	s1,56(sp)
    80004710:	03213823          	sd	s2,48(sp)
    80004714:	03313423          	sd	s3,40(sp)
    80004718:	03413023          	sd	s4,32(sp)
    8000471c:	01513c23          	sd	s5,24(sp)
    80004720:	05010413          	addi	s0,sp,80
    80004724:	06c05c63          	blez	a2,8000479c <consolewrite+0x9c>
    80004728:	00060993          	mv	s3,a2
    8000472c:	00050a13          	mv	s4,a0
    80004730:	00058493          	mv	s1,a1
    80004734:	00000913          	li	s2,0
    80004738:	fff00a93          	li	s5,-1
    8000473c:	01c0006f          	j	80004758 <consolewrite+0x58>
    80004740:	fbf44503          	lbu	a0,-65(s0)
    80004744:	0019091b          	addiw	s2,s2,1
    80004748:	00148493          	addi	s1,s1,1
    8000474c:	00001097          	auipc	ra,0x1
    80004750:	a9c080e7          	jalr	-1380(ra) # 800051e8 <uartputc>
    80004754:	03298063          	beq	s3,s2,80004774 <consolewrite+0x74>
    80004758:	00048613          	mv	a2,s1
    8000475c:	00100693          	li	a3,1
    80004760:	000a0593          	mv	a1,s4
    80004764:	fbf40513          	addi	a0,s0,-65
    80004768:	00000097          	auipc	ra,0x0
    8000476c:	9e4080e7          	jalr	-1564(ra) # 8000414c <either_copyin>
    80004770:	fd5518e3          	bne	a0,s5,80004740 <consolewrite+0x40>
    80004774:	04813083          	ld	ra,72(sp)
    80004778:	04013403          	ld	s0,64(sp)
    8000477c:	03813483          	ld	s1,56(sp)
    80004780:	02813983          	ld	s3,40(sp)
    80004784:	02013a03          	ld	s4,32(sp)
    80004788:	01813a83          	ld	s5,24(sp)
    8000478c:	00090513          	mv	a0,s2
    80004790:	03013903          	ld	s2,48(sp)
    80004794:	05010113          	addi	sp,sp,80
    80004798:	00008067          	ret
    8000479c:	00000913          	li	s2,0
    800047a0:	fd5ff06f          	j	80004774 <consolewrite+0x74>

00000000800047a4 <consoleread>:
    800047a4:	f9010113          	addi	sp,sp,-112
    800047a8:	06813023          	sd	s0,96(sp)
    800047ac:	04913c23          	sd	s1,88(sp)
    800047b0:	05213823          	sd	s2,80(sp)
    800047b4:	05313423          	sd	s3,72(sp)
    800047b8:	05413023          	sd	s4,64(sp)
    800047bc:	03513c23          	sd	s5,56(sp)
    800047c0:	03613823          	sd	s6,48(sp)
    800047c4:	03713423          	sd	s7,40(sp)
    800047c8:	03813023          	sd	s8,32(sp)
    800047cc:	06113423          	sd	ra,104(sp)
    800047d0:	01913c23          	sd	s9,24(sp)
    800047d4:	07010413          	addi	s0,sp,112
    800047d8:	00060b93          	mv	s7,a2
    800047dc:	00050913          	mv	s2,a0
    800047e0:	00058c13          	mv	s8,a1
    800047e4:	00060b1b          	sext.w	s6,a2
    800047e8:	00005497          	auipc	s1,0x5
    800047ec:	94048493          	addi	s1,s1,-1728 # 80009128 <cons>
    800047f0:	00400993          	li	s3,4
    800047f4:	fff00a13          	li	s4,-1
    800047f8:	00a00a93          	li	s5,10
    800047fc:	05705e63          	blez	s7,80004858 <consoleread+0xb4>
    80004800:	09c4a703          	lw	a4,156(s1)
    80004804:	0984a783          	lw	a5,152(s1)
    80004808:	0007071b          	sext.w	a4,a4
    8000480c:	08e78463          	beq	a5,a4,80004894 <consoleread+0xf0>
    80004810:	07f7f713          	andi	a4,a5,127
    80004814:	00e48733          	add	a4,s1,a4
    80004818:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000481c:	0017869b          	addiw	a3,a5,1
    80004820:	08d4ac23          	sw	a3,152(s1)
    80004824:	00070c9b          	sext.w	s9,a4
    80004828:	0b370663          	beq	a4,s3,800048d4 <consoleread+0x130>
    8000482c:	00100693          	li	a3,1
    80004830:	f9f40613          	addi	a2,s0,-97
    80004834:	000c0593          	mv	a1,s8
    80004838:	00090513          	mv	a0,s2
    8000483c:	f8e40fa3          	sb	a4,-97(s0)
    80004840:	00000097          	auipc	ra,0x0
    80004844:	8c0080e7          	jalr	-1856(ra) # 80004100 <either_copyout>
    80004848:	01450863          	beq	a0,s4,80004858 <consoleread+0xb4>
    8000484c:	001c0c13          	addi	s8,s8,1
    80004850:	fffb8b9b          	addiw	s7,s7,-1
    80004854:	fb5c94e3          	bne	s9,s5,800047fc <consoleread+0x58>
    80004858:	000b851b          	sext.w	a0,s7
    8000485c:	06813083          	ld	ra,104(sp)
    80004860:	06013403          	ld	s0,96(sp)
    80004864:	05813483          	ld	s1,88(sp)
    80004868:	05013903          	ld	s2,80(sp)
    8000486c:	04813983          	ld	s3,72(sp)
    80004870:	04013a03          	ld	s4,64(sp)
    80004874:	03813a83          	ld	s5,56(sp)
    80004878:	02813b83          	ld	s7,40(sp)
    8000487c:	02013c03          	ld	s8,32(sp)
    80004880:	01813c83          	ld	s9,24(sp)
    80004884:	40ab053b          	subw	a0,s6,a0
    80004888:	03013b03          	ld	s6,48(sp)
    8000488c:	07010113          	addi	sp,sp,112
    80004890:	00008067          	ret
    80004894:	00001097          	auipc	ra,0x1
    80004898:	1d8080e7          	jalr	472(ra) # 80005a6c <push_on>
    8000489c:	0984a703          	lw	a4,152(s1)
    800048a0:	09c4a783          	lw	a5,156(s1)
    800048a4:	0007879b          	sext.w	a5,a5
    800048a8:	fef70ce3          	beq	a4,a5,800048a0 <consoleread+0xfc>
    800048ac:	00001097          	auipc	ra,0x1
    800048b0:	234080e7          	jalr	564(ra) # 80005ae0 <pop_on>
    800048b4:	0984a783          	lw	a5,152(s1)
    800048b8:	07f7f713          	andi	a4,a5,127
    800048bc:	00e48733          	add	a4,s1,a4
    800048c0:	01874703          	lbu	a4,24(a4)
    800048c4:	0017869b          	addiw	a3,a5,1
    800048c8:	08d4ac23          	sw	a3,152(s1)
    800048cc:	00070c9b          	sext.w	s9,a4
    800048d0:	f5371ee3          	bne	a4,s3,8000482c <consoleread+0x88>
    800048d4:	000b851b          	sext.w	a0,s7
    800048d8:	f96bf2e3          	bgeu	s7,s6,8000485c <consoleread+0xb8>
    800048dc:	08f4ac23          	sw	a5,152(s1)
    800048e0:	f7dff06f          	j	8000485c <consoleread+0xb8>

00000000800048e4 <consputc>:
    800048e4:	10000793          	li	a5,256
    800048e8:	00f50663          	beq	a0,a5,800048f4 <consputc+0x10>
    800048ec:	00001317          	auipc	t1,0x1
    800048f0:	9f430067          	jr	-1548(t1) # 800052e0 <uartputc_sync>
    800048f4:	ff010113          	addi	sp,sp,-16
    800048f8:	00113423          	sd	ra,8(sp)
    800048fc:	00813023          	sd	s0,0(sp)
    80004900:	01010413          	addi	s0,sp,16
    80004904:	00800513          	li	a0,8
    80004908:	00001097          	auipc	ra,0x1
    8000490c:	9d8080e7          	jalr	-1576(ra) # 800052e0 <uartputc_sync>
    80004910:	02000513          	li	a0,32
    80004914:	00001097          	auipc	ra,0x1
    80004918:	9cc080e7          	jalr	-1588(ra) # 800052e0 <uartputc_sync>
    8000491c:	00013403          	ld	s0,0(sp)
    80004920:	00813083          	ld	ra,8(sp)
    80004924:	00800513          	li	a0,8
    80004928:	01010113          	addi	sp,sp,16
    8000492c:	00001317          	auipc	t1,0x1
    80004930:	9b430067          	jr	-1612(t1) # 800052e0 <uartputc_sync>

0000000080004934 <consoleintr>:
    80004934:	fe010113          	addi	sp,sp,-32
    80004938:	00813823          	sd	s0,16(sp)
    8000493c:	00913423          	sd	s1,8(sp)
    80004940:	01213023          	sd	s2,0(sp)
    80004944:	00113c23          	sd	ra,24(sp)
    80004948:	02010413          	addi	s0,sp,32
    8000494c:	00004917          	auipc	s2,0x4
    80004950:	7dc90913          	addi	s2,s2,2012 # 80009128 <cons>
    80004954:	00050493          	mv	s1,a0
    80004958:	00090513          	mv	a0,s2
    8000495c:	00001097          	auipc	ra,0x1
    80004960:	e40080e7          	jalr	-448(ra) # 8000579c <acquire>
    80004964:	02048c63          	beqz	s1,8000499c <consoleintr+0x68>
    80004968:	0a092783          	lw	a5,160(s2)
    8000496c:	09892703          	lw	a4,152(s2)
    80004970:	07f00693          	li	a3,127
    80004974:	40e7873b          	subw	a4,a5,a4
    80004978:	02e6e263          	bltu	a3,a4,8000499c <consoleintr+0x68>
    8000497c:	00d00713          	li	a4,13
    80004980:	04e48063          	beq	s1,a4,800049c0 <consoleintr+0x8c>
    80004984:	07f7f713          	andi	a4,a5,127
    80004988:	00e90733          	add	a4,s2,a4
    8000498c:	0017879b          	addiw	a5,a5,1
    80004990:	0af92023          	sw	a5,160(s2)
    80004994:	00970c23          	sb	s1,24(a4)
    80004998:	08f92e23          	sw	a5,156(s2)
    8000499c:	01013403          	ld	s0,16(sp)
    800049a0:	01813083          	ld	ra,24(sp)
    800049a4:	00813483          	ld	s1,8(sp)
    800049a8:	00013903          	ld	s2,0(sp)
    800049ac:	00004517          	auipc	a0,0x4
    800049b0:	77c50513          	addi	a0,a0,1916 # 80009128 <cons>
    800049b4:	02010113          	addi	sp,sp,32
    800049b8:	00001317          	auipc	t1,0x1
    800049bc:	eb030067          	jr	-336(t1) # 80005868 <release>
    800049c0:	00a00493          	li	s1,10
    800049c4:	fc1ff06f          	j	80004984 <consoleintr+0x50>

00000000800049c8 <consoleinit>:
    800049c8:	fe010113          	addi	sp,sp,-32
    800049cc:	00113c23          	sd	ra,24(sp)
    800049d0:	00813823          	sd	s0,16(sp)
    800049d4:	00913423          	sd	s1,8(sp)
    800049d8:	02010413          	addi	s0,sp,32
    800049dc:	00004497          	auipc	s1,0x4
    800049e0:	74c48493          	addi	s1,s1,1868 # 80009128 <cons>
    800049e4:	00048513          	mv	a0,s1
    800049e8:	00003597          	auipc	a1,0x3
    800049ec:	aa058593          	addi	a1,a1,-1376 # 80007488 <CONSOLE_STATUS+0x478>
    800049f0:	00001097          	auipc	ra,0x1
    800049f4:	d88080e7          	jalr	-632(ra) # 80005778 <initlock>
    800049f8:	00000097          	auipc	ra,0x0
    800049fc:	7ac080e7          	jalr	1964(ra) # 800051a4 <uartinit>
    80004a00:	01813083          	ld	ra,24(sp)
    80004a04:	01013403          	ld	s0,16(sp)
    80004a08:	00000797          	auipc	a5,0x0
    80004a0c:	d9c78793          	addi	a5,a5,-612 # 800047a4 <consoleread>
    80004a10:	0af4bc23          	sd	a5,184(s1)
    80004a14:	00000797          	auipc	a5,0x0
    80004a18:	cec78793          	addi	a5,a5,-788 # 80004700 <consolewrite>
    80004a1c:	0cf4b023          	sd	a5,192(s1)
    80004a20:	00813483          	ld	s1,8(sp)
    80004a24:	02010113          	addi	sp,sp,32
    80004a28:	00008067          	ret

0000000080004a2c <console_read>:
    80004a2c:	ff010113          	addi	sp,sp,-16
    80004a30:	00813423          	sd	s0,8(sp)
    80004a34:	01010413          	addi	s0,sp,16
    80004a38:	00813403          	ld	s0,8(sp)
    80004a3c:	00004317          	auipc	t1,0x4
    80004a40:	7a433303          	ld	t1,1956(t1) # 800091e0 <devsw+0x10>
    80004a44:	01010113          	addi	sp,sp,16
    80004a48:	00030067          	jr	t1

0000000080004a4c <console_write>:
    80004a4c:	ff010113          	addi	sp,sp,-16
    80004a50:	00813423          	sd	s0,8(sp)
    80004a54:	01010413          	addi	s0,sp,16
    80004a58:	00813403          	ld	s0,8(sp)
    80004a5c:	00004317          	auipc	t1,0x4
    80004a60:	78c33303          	ld	t1,1932(t1) # 800091e8 <devsw+0x18>
    80004a64:	01010113          	addi	sp,sp,16
    80004a68:	00030067          	jr	t1

0000000080004a6c <panic>:
    80004a6c:	fe010113          	addi	sp,sp,-32
    80004a70:	00113c23          	sd	ra,24(sp)
    80004a74:	00813823          	sd	s0,16(sp)
    80004a78:	00913423          	sd	s1,8(sp)
    80004a7c:	02010413          	addi	s0,sp,32
    80004a80:	00050493          	mv	s1,a0
    80004a84:	00003517          	auipc	a0,0x3
    80004a88:	a0c50513          	addi	a0,a0,-1524 # 80007490 <CONSOLE_STATUS+0x480>
    80004a8c:	00004797          	auipc	a5,0x4
    80004a90:	7e07ae23          	sw	zero,2044(a5) # 80009288 <pr+0x18>
    80004a94:	00000097          	auipc	ra,0x0
    80004a98:	034080e7          	jalr	52(ra) # 80004ac8 <__printf>
    80004a9c:	00048513          	mv	a0,s1
    80004aa0:	00000097          	auipc	ra,0x0
    80004aa4:	028080e7          	jalr	40(ra) # 80004ac8 <__printf>
    80004aa8:	00003517          	auipc	a0,0x3
    80004aac:	9c850513          	addi	a0,a0,-1592 # 80007470 <CONSOLE_STATUS+0x460>
    80004ab0:	00000097          	auipc	ra,0x0
    80004ab4:	018080e7          	jalr	24(ra) # 80004ac8 <__printf>
    80004ab8:	00100793          	li	a5,1
    80004abc:	00003717          	auipc	a4,0x3
    80004ac0:	52f72e23          	sw	a5,1340(a4) # 80007ff8 <panicked>
    80004ac4:	0000006f          	j	80004ac4 <panic+0x58>

0000000080004ac8 <__printf>:
    80004ac8:	f3010113          	addi	sp,sp,-208
    80004acc:	08813023          	sd	s0,128(sp)
    80004ad0:	07313423          	sd	s3,104(sp)
    80004ad4:	09010413          	addi	s0,sp,144
    80004ad8:	05813023          	sd	s8,64(sp)
    80004adc:	08113423          	sd	ra,136(sp)
    80004ae0:	06913c23          	sd	s1,120(sp)
    80004ae4:	07213823          	sd	s2,112(sp)
    80004ae8:	07413023          	sd	s4,96(sp)
    80004aec:	05513c23          	sd	s5,88(sp)
    80004af0:	05613823          	sd	s6,80(sp)
    80004af4:	05713423          	sd	s7,72(sp)
    80004af8:	03913c23          	sd	s9,56(sp)
    80004afc:	03a13823          	sd	s10,48(sp)
    80004b00:	03b13423          	sd	s11,40(sp)
    80004b04:	00004317          	auipc	t1,0x4
    80004b08:	76c30313          	addi	t1,t1,1900 # 80009270 <pr>
    80004b0c:	01832c03          	lw	s8,24(t1)
    80004b10:	00b43423          	sd	a1,8(s0)
    80004b14:	00c43823          	sd	a2,16(s0)
    80004b18:	00d43c23          	sd	a3,24(s0)
    80004b1c:	02e43023          	sd	a4,32(s0)
    80004b20:	02f43423          	sd	a5,40(s0)
    80004b24:	03043823          	sd	a6,48(s0)
    80004b28:	03143c23          	sd	a7,56(s0)
    80004b2c:	00050993          	mv	s3,a0
    80004b30:	4a0c1663          	bnez	s8,80004fdc <__printf+0x514>
    80004b34:	60098c63          	beqz	s3,8000514c <__printf+0x684>
    80004b38:	0009c503          	lbu	a0,0(s3)
    80004b3c:	00840793          	addi	a5,s0,8
    80004b40:	f6f43c23          	sd	a5,-136(s0)
    80004b44:	00000493          	li	s1,0
    80004b48:	22050063          	beqz	a0,80004d68 <__printf+0x2a0>
    80004b4c:	00002a37          	lui	s4,0x2
    80004b50:	00018ab7          	lui	s5,0x18
    80004b54:	000f4b37          	lui	s6,0xf4
    80004b58:	00989bb7          	lui	s7,0x989
    80004b5c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004b60:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004b64:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004b68:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80004b6c:	00148c9b          	addiw	s9,s1,1
    80004b70:	02500793          	li	a5,37
    80004b74:	01998933          	add	s2,s3,s9
    80004b78:	38f51263          	bne	a0,a5,80004efc <__printf+0x434>
    80004b7c:	00094783          	lbu	a5,0(s2)
    80004b80:	00078c9b          	sext.w	s9,a5
    80004b84:	1e078263          	beqz	a5,80004d68 <__printf+0x2a0>
    80004b88:	0024849b          	addiw	s1,s1,2
    80004b8c:	07000713          	li	a4,112
    80004b90:	00998933          	add	s2,s3,s1
    80004b94:	38e78a63          	beq	a5,a4,80004f28 <__printf+0x460>
    80004b98:	20f76863          	bltu	a4,a5,80004da8 <__printf+0x2e0>
    80004b9c:	42a78863          	beq	a5,a0,80004fcc <__printf+0x504>
    80004ba0:	06400713          	li	a4,100
    80004ba4:	40e79663          	bne	a5,a4,80004fb0 <__printf+0x4e8>
    80004ba8:	f7843783          	ld	a5,-136(s0)
    80004bac:	0007a603          	lw	a2,0(a5)
    80004bb0:	00878793          	addi	a5,a5,8
    80004bb4:	f6f43c23          	sd	a5,-136(s0)
    80004bb8:	42064a63          	bltz	a2,80004fec <__printf+0x524>
    80004bbc:	00a00713          	li	a4,10
    80004bc0:	02e677bb          	remuw	a5,a2,a4
    80004bc4:	00003d97          	auipc	s11,0x3
    80004bc8:	8f4d8d93          	addi	s11,s11,-1804 # 800074b8 <digits>
    80004bcc:	00900593          	li	a1,9
    80004bd0:	0006051b          	sext.w	a0,a2
    80004bd4:	00000c93          	li	s9,0
    80004bd8:	02079793          	slli	a5,a5,0x20
    80004bdc:	0207d793          	srli	a5,a5,0x20
    80004be0:	00fd87b3          	add	a5,s11,a5
    80004be4:	0007c783          	lbu	a5,0(a5)
    80004be8:	02e656bb          	divuw	a3,a2,a4
    80004bec:	f8f40023          	sb	a5,-128(s0)
    80004bf0:	14c5d863          	bge	a1,a2,80004d40 <__printf+0x278>
    80004bf4:	06300593          	li	a1,99
    80004bf8:	00100c93          	li	s9,1
    80004bfc:	02e6f7bb          	remuw	a5,a3,a4
    80004c00:	02079793          	slli	a5,a5,0x20
    80004c04:	0207d793          	srli	a5,a5,0x20
    80004c08:	00fd87b3          	add	a5,s11,a5
    80004c0c:	0007c783          	lbu	a5,0(a5)
    80004c10:	02e6d73b          	divuw	a4,a3,a4
    80004c14:	f8f400a3          	sb	a5,-127(s0)
    80004c18:	12a5f463          	bgeu	a1,a0,80004d40 <__printf+0x278>
    80004c1c:	00a00693          	li	a3,10
    80004c20:	00900593          	li	a1,9
    80004c24:	02d777bb          	remuw	a5,a4,a3
    80004c28:	02079793          	slli	a5,a5,0x20
    80004c2c:	0207d793          	srli	a5,a5,0x20
    80004c30:	00fd87b3          	add	a5,s11,a5
    80004c34:	0007c503          	lbu	a0,0(a5)
    80004c38:	02d757bb          	divuw	a5,a4,a3
    80004c3c:	f8a40123          	sb	a0,-126(s0)
    80004c40:	48e5f263          	bgeu	a1,a4,800050c4 <__printf+0x5fc>
    80004c44:	06300513          	li	a0,99
    80004c48:	02d7f5bb          	remuw	a1,a5,a3
    80004c4c:	02059593          	slli	a1,a1,0x20
    80004c50:	0205d593          	srli	a1,a1,0x20
    80004c54:	00bd85b3          	add	a1,s11,a1
    80004c58:	0005c583          	lbu	a1,0(a1)
    80004c5c:	02d7d7bb          	divuw	a5,a5,a3
    80004c60:	f8b401a3          	sb	a1,-125(s0)
    80004c64:	48e57263          	bgeu	a0,a4,800050e8 <__printf+0x620>
    80004c68:	3e700513          	li	a0,999
    80004c6c:	02d7f5bb          	remuw	a1,a5,a3
    80004c70:	02059593          	slli	a1,a1,0x20
    80004c74:	0205d593          	srli	a1,a1,0x20
    80004c78:	00bd85b3          	add	a1,s11,a1
    80004c7c:	0005c583          	lbu	a1,0(a1)
    80004c80:	02d7d7bb          	divuw	a5,a5,a3
    80004c84:	f8b40223          	sb	a1,-124(s0)
    80004c88:	46e57663          	bgeu	a0,a4,800050f4 <__printf+0x62c>
    80004c8c:	02d7f5bb          	remuw	a1,a5,a3
    80004c90:	02059593          	slli	a1,a1,0x20
    80004c94:	0205d593          	srli	a1,a1,0x20
    80004c98:	00bd85b3          	add	a1,s11,a1
    80004c9c:	0005c583          	lbu	a1,0(a1)
    80004ca0:	02d7d7bb          	divuw	a5,a5,a3
    80004ca4:	f8b402a3          	sb	a1,-123(s0)
    80004ca8:	46ea7863          	bgeu	s4,a4,80005118 <__printf+0x650>
    80004cac:	02d7f5bb          	remuw	a1,a5,a3
    80004cb0:	02059593          	slli	a1,a1,0x20
    80004cb4:	0205d593          	srli	a1,a1,0x20
    80004cb8:	00bd85b3          	add	a1,s11,a1
    80004cbc:	0005c583          	lbu	a1,0(a1)
    80004cc0:	02d7d7bb          	divuw	a5,a5,a3
    80004cc4:	f8b40323          	sb	a1,-122(s0)
    80004cc8:	3eeaf863          	bgeu	s5,a4,800050b8 <__printf+0x5f0>
    80004ccc:	02d7f5bb          	remuw	a1,a5,a3
    80004cd0:	02059593          	slli	a1,a1,0x20
    80004cd4:	0205d593          	srli	a1,a1,0x20
    80004cd8:	00bd85b3          	add	a1,s11,a1
    80004cdc:	0005c583          	lbu	a1,0(a1)
    80004ce0:	02d7d7bb          	divuw	a5,a5,a3
    80004ce4:	f8b403a3          	sb	a1,-121(s0)
    80004ce8:	42eb7e63          	bgeu	s6,a4,80005124 <__printf+0x65c>
    80004cec:	02d7f5bb          	remuw	a1,a5,a3
    80004cf0:	02059593          	slli	a1,a1,0x20
    80004cf4:	0205d593          	srli	a1,a1,0x20
    80004cf8:	00bd85b3          	add	a1,s11,a1
    80004cfc:	0005c583          	lbu	a1,0(a1)
    80004d00:	02d7d7bb          	divuw	a5,a5,a3
    80004d04:	f8b40423          	sb	a1,-120(s0)
    80004d08:	42ebfc63          	bgeu	s7,a4,80005140 <__printf+0x678>
    80004d0c:	02079793          	slli	a5,a5,0x20
    80004d10:	0207d793          	srli	a5,a5,0x20
    80004d14:	00fd8db3          	add	s11,s11,a5
    80004d18:	000dc703          	lbu	a4,0(s11)
    80004d1c:	00a00793          	li	a5,10
    80004d20:	00900c93          	li	s9,9
    80004d24:	f8e404a3          	sb	a4,-119(s0)
    80004d28:	00065c63          	bgez	a2,80004d40 <__printf+0x278>
    80004d2c:	f9040713          	addi	a4,s0,-112
    80004d30:	00f70733          	add	a4,a4,a5
    80004d34:	02d00693          	li	a3,45
    80004d38:	fed70823          	sb	a3,-16(a4)
    80004d3c:	00078c93          	mv	s9,a5
    80004d40:	f8040793          	addi	a5,s0,-128
    80004d44:	01978cb3          	add	s9,a5,s9
    80004d48:	f7f40d13          	addi	s10,s0,-129
    80004d4c:	000cc503          	lbu	a0,0(s9)
    80004d50:	fffc8c93          	addi	s9,s9,-1
    80004d54:	00000097          	auipc	ra,0x0
    80004d58:	b90080e7          	jalr	-1136(ra) # 800048e4 <consputc>
    80004d5c:	ffac98e3          	bne	s9,s10,80004d4c <__printf+0x284>
    80004d60:	00094503          	lbu	a0,0(s2)
    80004d64:	e00514e3          	bnez	a0,80004b6c <__printf+0xa4>
    80004d68:	1a0c1663          	bnez	s8,80004f14 <__printf+0x44c>
    80004d6c:	08813083          	ld	ra,136(sp)
    80004d70:	08013403          	ld	s0,128(sp)
    80004d74:	07813483          	ld	s1,120(sp)
    80004d78:	07013903          	ld	s2,112(sp)
    80004d7c:	06813983          	ld	s3,104(sp)
    80004d80:	06013a03          	ld	s4,96(sp)
    80004d84:	05813a83          	ld	s5,88(sp)
    80004d88:	05013b03          	ld	s6,80(sp)
    80004d8c:	04813b83          	ld	s7,72(sp)
    80004d90:	04013c03          	ld	s8,64(sp)
    80004d94:	03813c83          	ld	s9,56(sp)
    80004d98:	03013d03          	ld	s10,48(sp)
    80004d9c:	02813d83          	ld	s11,40(sp)
    80004da0:	0d010113          	addi	sp,sp,208
    80004da4:	00008067          	ret
    80004da8:	07300713          	li	a4,115
    80004dac:	1ce78a63          	beq	a5,a4,80004f80 <__printf+0x4b8>
    80004db0:	07800713          	li	a4,120
    80004db4:	1ee79e63          	bne	a5,a4,80004fb0 <__printf+0x4e8>
    80004db8:	f7843783          	ld	a5,-136(s0)
    80004dbc:	0007a703          	lw	a4,0(a5)
    80004dc0:	00878793          	addi	a5,a5,8
    80004dc4:	f6f43c23          	sd	a5,-136(s0)
    80004dc8:	28074263          	bltz	a4,8000504c <__printf+0x584>
    80004dcc:	00002d97          	auipc	s11,0x2
    80004dd0:	6ecd8d93          	addi	s11,s11,1772 # 800074b8 <digits>
    80004dd4:	00f77793          	andi	a5,a4,15
    80004dd8:	00fd87b3          	add	a5,s11,a5
    80004ddc:	0007c683          	lbu	a3,0(a5)
    80004de0:	00f00613          	li	a2,15
    80004de4:	0007079b          	sext.w	a5,a4
    80004de8:	f8d40023          	sb	a3,-128(s0)
    80004dec:	0047559b          	srliw	a1,a4,0x4
    80004df0:	0047569b          	srliw	a3,a4,0x4
    80004df4:	00000c93          	li	s9,0
    80004df8:	0ee65063          	bge	a2,a4,80004ed8 <__printf+0x410>
    80004dfc:	00f6f693          	andi	a3,a3,15
    80004e00:	00dd86b3          	add	a3,s11,a3
    80004e04:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004e08:	0087d79b          	srliw	a5,a5,0x8
    80004e0c:	00100c93          	li	s9,1
    80004e10:	f8d400a3          	sb	a3,-127(s0)
    80004e14:	0cb67263          	bgeu	a2,a1,80004ed8 <__printf+0x410>
    80004e18:	00f7f693          	andi	a3,a5,15
    80004e1c:	00dd86b3          	add	a3,s11,a3
    80004e20:	0006c583          	lbu	a1,0(a3)
    80004e24:	00f00613          	li	a2,15
    80004e28:	0047d69b          	srliw	a3,a5,0x4
    80004e2c:	f8b40123          	sb	a1,-126(s0)
    80004e30:	0047d593          	srli	a1,a5,0x4
    80004e34:	28f67e63          	bgeu	a2,a5,800050d0 <__printf+0x608>
    80004e38:	00f6f693          	andi	a3,a3,15
    80004e3c:	00dd86b3          	add	a3,s11,a3
    80004e40:	0006c503          	lbu	a0,0(a3)
    80004e44:	0087d813          	srli	a6,a5,0x8
    80004e48:	0087d69b          	srliw	a3,a5,0x8
    80004e4c:	f8a401a3          	sb	a0,-125(s0)
    80004e50:	28b67663          	bgeu	a2,a1,800050dc <__printf+0x614>
    80004e54:	00f6f693          	andi	a3,a3,15
    80004e58:	00dd86b3          	add	a3,s11,a3
    80004e5c:	0006c583          	lbu	a1,0(a3)
    80004e60:	00c7d513          	srli	a0,a5,0xc
    80004e64:	00c7d69b          	srliw	a3,a5,0xc
    80004e68:	f8b40223          	sb	a1,-124(s0)
    80004e6c:	29067a63          	bgeu	a2,a6,80005100 <__printf+0x638>
    80004e70:	00f6f693          	andi	a3,a3,15
    80004e74:	00dd86b3          	add	a3,s11,a3
    80004e78:	0006c583          	lbu	a1,0(a3)
    80004e7c:	0107d813          	srli	a6,a5,0x10
    80004e80:	0107d69b          	srliw	a3,a5,0x10
    80004e84:	f8b402a3          	sb	a1,-123(s0)
    80004e88:	28a67263          	bgeu	a2,a0,8000510c <__printf+0x644>
    80004e8c:	00f6f693          	andi	a3,a3,15
    80004e90:	00dd86b3          	add	a3,s11,a3
    80004e94:	0006c683          	lbu	a3,0(a3)
    80004e98:	0147d79b          	srliw	a5,a5,0x14
    80004e9c:	f8d40323          	sb	a3,-122(s0)
    80004ea0:	21067663          	bgeu	a2,a6,800050ac <__printf+0x5e4>
    80004ea4:	02079793          	slli	a5,a5,0x20
    80004ea8:	0207d793          	srli	a5,a5,0x20
    80004eac:	00fd8db3          	add	s11,s11,a5
    80004eb0:	000dc683          	lbu	a3,0(s11)
    80004eb4:	00800793          	li	a5,8
    80004eb8:	00700c93          	li	s9,7
    80004ebc:	f8d403a3          	sb	a3,-121(s0)
    80004ec0:	00075c63          	bgez	a4,80004ed8 <__printf+0x410>
    80004ec4:	f9040713          	addi	a4,s0,-112
    80004ec8:	00f70733          	add	a4,a4,a5
    80004ecc:	02d00693          	li	a3,45
    80004ed0:	fed70823          	sb	a3,-16(a4)
    80004ed4:	00078c93          	mv	s9,a5
    80004ed8:	f8040793          	addi	a5,s0,-128
    80004edc:	01978cb3          	add	s9,a5,s9
    80004ee0:	f7f40d13          	addi	s10,s0,-129
    80004ee4:	000cc503          	lbu	a0,0(s9)
    80004ee8:	fffc8c93          	addi	s9,s9,-1
    80004eec:	00000097          	auipc	ra,0x0
    80004ef0:	9f8080e7          	jalr	-1544(ra) # 800048e4 <consputc>
    80004ef4:	ff9d18e3          	bne	s10,s9,80004ee4 <__printf+0x41c>
    80004ef8:	0100006f          	j	80004f08 <__printf+0x440>
    80004efc:	00000097          	auipc	ra,0x0
    80004f00:	9e8080e7          	jalr	-1560(ra) # 800048e4 <consputc>
    80004f04:	000c8493          	mv	s1,s9
    80004f08:	00094503          	lbu	a0,0(s2)
    80004f0c:	c60510e3          	bnez	a0,80004b6c <__printf+0xa4>
    80004f10:	e40c0ee3          	beqz	s8,80004d6c <__printf+0x2a4>
    80004f14:	00004517          	auipc	a0,0x4
    80004f18:	35c50513          	addi	a0,a0,860 # 80009270 <pr>
    80004f1c:	00001097          	auipc	ra,0x1
    80004f20:	94c080e7          	jalr	-1716(ra) # 80005868 <release>
    80004f24:	e49ff06f          	j	80004d6c <__printf+0x2a4>
    80004f28:	f7843783          	ld	a5,-136(s0)
    80004f2c:	03000513          	li	a0,48
    80004f30:	01000d13          	li	s10,16
    80004f34:	00878713          	addi	a4,a5,8
    80004f38:	0007bc83          	ld	s9,0(a5)
    80004f3c:	f6e43c23          	sd	a4,-136(s0)
    80004f40:	00000097          	auipc	ra,0x0
    80004f44:	9a4080e7          	jalr	-1628(ra) # 800048e4 <consputc>
    80004f48:	07800513          	li	a0,120
    80004f4c:	00000097          	auipc	ra,0x0
    80004f50:	998080e7          	jalr	-1640(ra) # 800048e4 <consputc>
    80004f54:	00002d97          	auipc	s11,0x2
    80004f58:	564d8d93          	addi	s11,s11,1380 # 800074b8 <digits>
    80004f5c:	03ccd793          	srli	a5,s9,0x3c
    80004f60:	00fd87b3          	add	a5,s11,a5
    80004f64:	0007c503          	lbu	a0,0(a5)
    80004f68:	fffd0d1b          	addiw	s10,s10,-1
    80004f6c:	004c9c93          	slli	s9,s9,0x4
    80004f70:	00000097          	auipc	ra,0x0
    80004f74:	974080e7          	jalr	-1676(ra) # 800048e4 <consputc>
    80004f78:	fe0d12e3          	bnez	s10,80004f5c <__printf+0x494>
    80004f7c:	f8dff06f          	j	80004f08 <__printf+0x440>
    80004f80:	f7843783          	ld	a5,-136(s0)
    80004f84:	0007bc83          	ld	s9,0(a5)
    80004f88:	00878793          	addi	a5,a5,8
    80004f8c:	f6f43c23          	sd	a5,-136(s0)
    80004f90:	000c9a63          	bnez	s9,80004fa4 <__printf+0x4dc>
    80004f94:	1080006f          	j	8000509c <__printf+0x5d4>
    80004f98:	001c8c93          	addi	s9,s9,1
    80004f9c:	00000097          	auipc	ra,0x0
    80004fa0:	948080e7          	jalr	-1720(ra) # 800048e4 <consputc>
    80004fa4:	000cc503          	lbu	a0,0(s9)
    80004fa8:	fe0518e3          	bnez	a0,80004f98 <__printf+0x4d0>
    80004fac:	f5dff06f          	j	80004f08 <__printf+0x440>
    80004fb0:	02500513          	li	a0,37
    80004fb4:	00000097          	auipc	ra,0x0
    80004fb8:	930080e7          	jalr	-1744(ra) # 800048e4 <consputc>
    80004fbc:	000c8513          	mv	a0,s9
    80004fc0:	00000097          	auipc	ra,0x0
    80004fc4:	924080e7          	jalr	-1756(ra) # 800048e4 <consputc>
    80004fc8:	f41ff06f          	j	80004f08 <__printf+0x440>
    80004fcc:	02500513          	li	a0,37
    80004fd0:	00000097          	auipc	ra,0x0
    80004fd4:	914080e7          	jalr	-1772(ra) # 800048e4 <consputc>
    80004fd8:	f31ff06f          	j	80004f08 <__printf+0x440>
    80004fdc:	00030513          	mv	a0,t1
    80004fe0:	00000097          	auipc	ra,0x0
    80004fe4:	7bc080e7          	jalr	1980(ra) # 8000579c <acquire>
    80004fe8:	b4dff06f          	j	80004b34 <__printf+0x6c>
    80004fec:	40c0053b          	negw	a0,a2
    80004ff0:	00a00713          	li	a4,10
    80004ff4:	02e576bb          	remuw	a3,a0,a4
    80004ff8:	00002d97          	auipc	s11,0x2
    80004ffc:	4c0d8d93          	addi	s11,s11,1216 # 800074b8 <digits>
    80005000:	ff700593          	li	a1,-9
    80005004:	02069693          	slli	a3,a3,0x20
    80005008:	0206d693          	srli	a3,a3,0x20
    8000500c:	00dd86b3          	add	a3,s11,a3
    80005010:	0006c683          	lbu	a3,0(a3)
    80005014:	02e557bb          	divuw	a5,a0,a4
    80005018:	f8d40023          	sb	a3,-128(s0)
    8000501c:	10b65e63          	bge	a2,a1,80005138 <__printf+0x670>
    80005020:	06300593          	li	a1,99
    80005024:	02e7f6bb          	remuw	a3,a5,a4
    80005028:	02069693          	slli	a3,a3,0x20
    8000502c:	0206d693          	srli	a3,a3,0x20
    80005030:	00dd86b3          	add	a3,s11,a3
    80005034:	0006c683          	lbu	a3,0(a3)
    80005038:	02e7d73b          	divuw	a4,a5,a4
    8000503c:	00200793          	li	a5,2
    80005040:	f8d400a3          	sb	a3,-127(s0)
    80005044:	bca5ece3          	bltu	a1,a0,80004c1c <__printf+0x154>
    80005048:	ce5ff06f          	j	80004d2c <__printf+0x264>
    8000504c:	40e007bb          	negw	a5,a4
    80005050:	00002d97          	auipc	s11,0x2
    80005054:	468d8d93          	addi	s11,s11,1128 # 800074b8 <digits>
    80005058:	00f7f693          	andi	a3,a5,15
    8000505c:	00dd86b3          	add	a3,s11,a3
    80005060:	0006c583          	lbu	a1,0(a3)
    80005064:	ff100613          	li	a2,-15
    80005068:	0047d69b          	srliw	a3,a5,0x4
    8000506c:	f8b40023          	sb	a1,-128(s0)
    80005070:	0047d59b          	srliw	a1,a5,0x4
    80005074:	0ac75e63          	bge	a4,a2,80005130 <__printf+0x668>
    80005078:	00f6f693          	andi	a3,a3,15
    8000507c:	00dd86b3          	add	a3,s11,a3
    80005080:	0006c603          	lbu	a2,0(a3)
    80005084:	00f00693          	li	a3,15
    80005088:	0087d79b          	srliw	a5,a5,0x8
    8000508c:	f8c400a3          	sb	a2,-127(s0)
    80005090:	d8b6e4e3          	bltu	a3,a1,80004e18 <__printf+0x350>
    80005094:	00200793          	li	a5,2
    80005098:	e2dff06f          	j	80004ec4 <__printf+0x3fc>
    8000509c:	00002c97          	auipc	s9,0x2
    800050a0:	3fcc8c93          	addi	s9,s9,1020 # 80007498 <CONSOLE_STATUS+0x488>
    800050a4:	02800513          	li	a0,40
    800050a8:	ef1ff06f          	j	80004f98 <__printf+0x4d0>
    800050ac:	00700793          	li	a5,7
    800050b0:	00600c93          	li	s9,6
    800050b4:	e0dff06f          	j	80004ec0 <__printf+0x3f8>
    800050b8:	00700793          	li	a5,7
    800050bc:	00600c93          	li	s9,6
    800050c0:	c69ff06f          	j	80004d28 <__printf+0x260>
    800050c4:	00300793          	li	a5,3
    800050c8:	00200c93          	li	s9,2
    800050cc:	c5dff06f          	j	80004d28 <__printf+0x260>
    800050d0:	00300793          	li	a5,3
    800050d4:	00200c93          	li	s9,2
    800050d8:	de9ff06f          	j	80004ec0 <__printf+0x3f8>
    800050dc:	00400793          	li	a5,4
    800050e0:	00300c93          	li	s9,3
    800050e4:	dddff06f          	j	80004ec0 <__printf+0x3f8>
    800050e8:	00400793          	li	a5,4
    800050ec:	00300c93          	li	s9,3
    800050f0:	c39ff06f          	j	80004d28 <__printf+0x260>
    800050f4:	00500793          	li	a5,5
    800050f8:	00400c93          	li	s9,4
    800050fc:	c2dff06f          	j	80004d28 <__printf+0x260>
    80005100:	00500793          	li	a5,5
    80005104:	00400c93          	li	s9,4
    80005108:	db9ff06f          	j	80004ec0 <__printf+0x3f8>
    8000510c:	00600793          	li	a5,6
    80005110:	00500c93          	li	s9,5
    80005114:	dadff06f          	j	80004ec0 <__printf+0x3f8>
    80005118:	00600793          	li	a5,6
    8000511c:	00500c93          	li	s9,5
    80005120:	c09ff06f          	j	80004d28 <__printf+0x260>
    80005124:	00800793          	li	a5,8
    80005128:	00700c93          	li	s9,7
    8000512c:	bfdff06f          	j	80004d28 <__printf+0x260>
    80005130:	00100793          	li	a5,1
    80005134:	d91ff06f          	j	80004ec4 <__printf+0x3fc>
    80005138:	00100793          	li	a5,1
    8000513c:	bf1ff06f          	j	80004d2c <__printf+0x264>
    80005140:	00900793          	li	a5,9
    80005144:	00800c93          	li	s9,8
    80005148:	be1ff06f          	j	80004d28 <__printf+0x260>
    8000514c:	00002517          	auipc	a0,0x2
    80005150:	35450513          	addi	a0,a0,852 # 800074a0 <CONSOLE_STATUS+0x490>
    80005154:	00000097          	auipc	ra,0x0
    80005158:	918080e7          	jalr	-1768(ra) # 80004a6c <panic>

000000008000515c <printfinit>:
    8000515c:	fe010113          	addi	sp,sp,-32
    80005160:	00813823          	sd	s0,16(sp)
    80005164:	00913423          	sd	s1,8(sp)
    80005168:	00113c23          	sd	ra,24(sp)
    8000516c:	02010413          	addi	s0,sp,32
    80005170:	00004497          	auipc	s1,0x4
    80005174:	10048493          	addi	s1,s1,256 # 80009270 <pr>
    80005178:	00048513          	mv	a0,s1
    8000517c:	00002597          	auipc	a1,0x2
    80005180:	33458593          	addi	a1,a1,820 # 800074b0 <CONSOLE_STATUS+0x4a0>
    80005184:	00000097          	auipc	ra,0x0
    80005188:	5f4080e7          	jalr	1524(ra) # 80005778 <initlock>
    8000518c:	01813083          	ld	ra,24(sp)
    80005190:	01013403          	ld	s0,16(sp)
    80005194:	0004ac23          	sw	zero,24(s1)
    80005198:	00813483          	ld	s1,8(sp)
    8000519c:	02010113          	addi	sp,sp,32
    800051a0:	00008067          	ret

00000000800051a4 <uartinit>:
    800051a4:	ff010113          	addi	sp,sp,-16
    800051a8:	00813423          	sd	s0,8(sp)
    800051ac:	01010413          	addi	s0,sp,16
    800051b0:	100007b7          	lui	a5,0x10000
    800051b4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800051b8:	f8000713          	li	a4,-128
    800051bc:	00e781a3          	sb	a4,3(a5)
    800051c0:	00300713          	li	a4,3
    800051c4:	00e78023          	sb	a4,0(a5)
    800051c8:	000780a3          	sb	zero,1(a5)
    800051cc:	00e781a3          	sb	a4,3(a5)
    800051d0:	00700693          	li	a3,7
    800051d4:	00d78123          	sb	a3,2(a5)
    800051d8:	00e780a3          	sb	a4,1(a5)
    800051dc:	00813403          	ld	s0,8(sp)
    800051e0:	01010113          	addi	sp,sp,16
    800051e4:	00008067          	ret

00000000800051e8 <uartputc>:
    800051e8:	00003797          	auipc	a5,0x3
    800051ec:	e107a783          	lw	a5,-496(a5) # 80007ff8 <panicked>
    800051f0:	00078463          	beqz	a5,800051f8 <uartputc+0x10>
    800051f4:	0000006f          	j	800051f4 <uartputc+0xc>
    800051f8:	fd010113          	addi	sp,sp,-48
    800051fc:	02813023          	sd	s0,32(sp)
    80005200:	00913c23          	sd	s1,24(sp)
    80005204:	01213823          	sd	s2,16(sp)
    80005208:	01313423          	sd	s3,8(sp)
    8000520c:	02113423          	sd	ra,40(sp)
    80005210:	03010413          	addi	s0,sp,48
    80005214:	00003917          	auipc	s2,0x3
    80005218:	dec90913          	addi	s2,s2,-532 # 80008000 <uart_tx_r>
    8000521c:	00093783          	ld	a5,0(s2)
    80005220:	00003497          	auipc	s1,0x3
    80005224:	de848493          	addi	s1,s1,-536 # 80008008 <uart_tx_w>
    80005228:	0004b703          	ld	a4,0(s1)
    8000522c:	02078693          	addi	a3,a5,32
    80005230:	00050993          	mv	s3,a0
    80005234:	02e69c63          	bne	a3,a4,8000526c <uartputc+0x84>
    80005238:	00001097          	auipc	ra,0x1
    8000523c:	834080e7          	jalr	-1996(ra) # 80005a6c <push_on>
    80005240:	00093783          	ld	a5,0(s2)
    80005244:	0004b703          	ld	a4,0(s1)
    80005248:	02078793          	addi	a5,a5,32
    8000524c:	00e79463          	bne	a5,a4,80005254 <uartputc+0x6c>
    80005250:	0000006f          	j	80005250 <uartputc+0x68>
    80005254:	00001097          	auipc	ra,0x1
    80005258:	88c080e7          	jalr	-1908(ra) # 80005ae0 <pop_on>
    8000525c:	00093783          	ld	a5,0(s2)
    80005260:	0004b703          	ld	a4,0(s1)
    80005264:	02078693          	addi	a3,a5,32
    80005268:	fce688e3          	beq	a3,a4,80005238 <uartputc+0x50>
    8000526c:	01f77693          	andi	a3,a4,31
    80005270:	00004597          	auipc	a1,0x4
    80005274:	02058593          	addi	a1,a1,32 # 80009290 <uart_tx_buf>
    80005278:	00d586b3          	add	a3,a1,a3
    8000527c:	00170713          	addi	a4,a4,1
    80005280:	01368023          	sb	s3,0(a3)
    80005284:	00e4b023          	sd	a4,0(s1)
    80005288:	10000637          	lui	a2,0x10000
    8000528c:	02f71063          	bne	a4,a5,800052ac <uartputc+0xc4>
    80005290:	0340006f          	j	800052c4 <uartputc+0xdc>
    80005294:	00074703          	lbu	a4,0(a4)
    80005298:	00f93023          	sd	a5,0(s2)
    8000529c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800052a0:	00093783          	ld	a5,0(s2)
    800052a4:	0004b703          	ld	a4,0(s1)
    800052a8:	00f70e63          	beq	a4,a5,800052c4 <uartputc+0xdc>
    800052ac:	00564683          	lbu	a3,5(a2)
    800052b0:	01f7f713          	andi	a4,a5,31
    800052b4:	00e58733          	add	a4,a1,a4
    800052b8:	0206f693          	andi	a3,a3,32
    800052bc:	00178793          	addi	a5,a5,1
    800052c0:	fc069ae3          	bnez	a3,80005294 <uartputc+0xac>
    800052c4:	02813083          	ld	ra,40(sp)
    800052c8:	02013403          	ld	s0,32(sp)
    800052cc:	01813483          	ld	s1,24(sp)
    800052d0:	01013903          	ld	s2,16(sp)
    800052d4:	00813983          	ld	s3,8(sp)
    800052d8:	03010113          	addi	sp,sp,48
    800052dc:	00008067          	ret

00000000800052e0 <uartputc_sync>:
    800052e0:	ff010113          	addi	sp,sp,-16
    800052e4:	00813423          	sd	s0,8(sp)
    800052e8:	01010413          	addi	s0,sp,16
    800052ec:	00003717          	auipc	a4,0x3
    800052f0:	d0c72703          	lw	a4,-756(a4) # 80007ff8 <panicked>
    800052f4:	02071663          	bnez	a4,80005320 <uartputc_sync+0x40>
    800052f8:	00050793          	mv	a5,a0
    800052fc:	100006b7          	lui	a3,0x10000
    80005300:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005304:	02077713          	andi	a4,a4,32
    80005308:	fe070ce3          	beqz	a4,80005300 <uartputc_sync+0x20>
    8000530c:	0ff7f793          	andi	a5,a5,255
    80005310:	00f68023          	sb	a5,0(a3)
    80005314:	00813403          	ld	s0,8(sp)
    80005318:	01010113          	addi	sp,sp,16
    8000531c:	00008067          	ret
    80005320:	0000006f          	j	80005320 <uartputc_sync+0x40>

0000000080005324 <uartstart>:
    80005324:	ff010113          	addi	sp,sp,-16
    80005328:	00813423          	sd	s0,8(sp)
    8000532c:	01010413          	addi	s0,sp,16
    80005330:	00003617          	auipc	a2,0x3
    80005334:	cd060613          	addi	a2,a2,-816 # 80008000 <uart_tx_r>
    80005338:	00003517          	auipc	a0,0x3
    8000533c:	cd050513          	addi	a0,a0,-816 # 80008008 <uart_tx_w>
    80005340:	00063783          	ld	a5,0(a2)
    80005344:	00053703          	ld	a4,0(a0)
    80005348:	04f70263          	beq	a4,a5,8000538c <uartstart+0x68>
    8000534c:	100005b7          	lui	a1,0x10000
    80005350:	00004817          	auipc	a6,0x4
    80005354:	f4080813          	addi	a6,a6,-192 # 80009290 <uart_tx_buf>
    80005358:	01c0006f          	j	80005374 <uartstart+0x50>
    8000535c:	0006c703          	lbu	a4,0(a3)
    80005360:	00f63023          	sd	a5,0(a2)
    80005364:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005368:	00063783          	ld	a5,0(a2)
    8000536c:	00053703          	ld	a4,0(a0)
    80005370:	00f70e63          	beq	a4,a5,8000538c <uartstart+0x68>
    80005374:	01f7f713          	andi	a4,a5,31
    80005378:	00e806b3          	add	a3,a6,a4
    8000537c:	0055c703          	lbu	a4,5(a1)
    80005380:	00178793          	addi	a5,a5,1
    80005384:	02077713          	andi	a4,a4,32
    80005388:	fc071ae3          	bnez	a4,8000535c <uartstart+0x38>
    8000538c:	00813403          	ld	s0,8(sp)
    80005390:	01010113          	addi	sp,sp,16
    80005394:	00008067          	ret

0000000080005398 <uartgetc>:
    80005398:	ff010113          	addi	sp,sp,-16
    8000539c:	00813423          	sd	s0,8(sp)
    800053a0:	01010413          	addi	s0,sp,16
    800053a4:	10000737          	lui	a4,0x10000
    800053a8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800053ac:	0017f793          	andi	a5,a5,1
    800053b0:	00078c63          	beqz	a5,800053c8 <uartgetc+0x30>
    800053b4:	00074503          	lbu	a0,0(a4)
    800053b8:	0ff57513          	andi	a0,a0,255
    800053bc:	00813403          	ld	s0,8(sp)
    800053c0:	01010113          	addi	sp,sp,16
    800053c4:	00008067          	ret
    800053c8:	fff00513          	li	a0,-1
    800053cc:	ff1ff06f          	j	800053bc <uartgetc+0x24>

00000000800053d0 <uartintr>:
    800053d0:	100007b7          	lui	a5,0x10000
    800053d4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800053d8:	0017f793          	andi	a5,a5,1
    800053dc:	0a078463          	beqz	a5,80005484 <uartintr+0xb4>
    800053e0:	fe010113          	addi	sp,sp,-32
    800053e4:	00813823          	sd	s0,16(sp)
    800053e8:	00913423          	sd	s1,8(sp)
    800053ec:	00113c23          	sd	ra,24(sp)
    800053f0:	02010413          	addi	s0,sp,32
    800053f4:	100004b7          	lui	s1,0x10000
    800053f8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800053fc:	0ff57513          	andi	a0,a0,255
    80005400:	fffff097          	auipc	ra,0xfffff
    80005404:	534080e7          	jalr	1332(ra) # 80004934 <consoleintr>
    80005408:	0054c783          	lbu	a5,5(s1)
    8000540c:	0017f793          	andi	a5,a5,1
    80005410:	fe0794e3          	bnez	a5,800053f8 <uartintr+0x28>
    80005414:	00003617          	auipc	a2,0x3
    80005418:	bec60613          	addi	a2,a2,-1044 # 80008000 <uart_tx_r>
    8000541c:	00003517          	auipc	a0,0x3
    80005420:	bec50513          	addi	a0,a0,-1044 # 80008008 <uart_tx_w>
    80005424:	00063783          	ld	a5,0(a2)
    80005428:	00053703          	ld	a4,0(a0)
    8000542c:	04f70263          	beq	a4,a5,80005470 <uartintr+0xa0>
    80005430:	100005b7          	lui	a1,0x10000
    80005434:	00004817          	auipc	a6,0x4
    80005438:	e5c80813          	addi	a6,a6,-420 # 80009290 <uart_tx_buf>
    8000543c:	01c0006f          	j	80005458 <uartintr+0x88>
    80005440:	0006c703          	lbu	a4,0(a3)
    80005444:	00f63023          	sd	a5,0(a2)
    80005448:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000544c:	00063783          	ld	a5,0(a2)
    80005450:	00053703          	ld	a4,0(a0)
    80005454:	00f70e63          	beq	a4,a5,80005470 <uartintr+0xa0>
    80005458:	01f7f713          	andi	a4,a5,31
    8000545c:	00e806b3          	add	a3,a6,a4
    80005460:	0055c703          	lbu	a4,5(a1)
    80005464:	00178793          	addi	a5,a5,1
    80005468:	02077713          	andi	a4,a4,32
    8000546c:	fc071ae3          	bnez	a4,80005440 <uartintr+0x70>
    80005470:	01813083          	ld	ra,24(sp)
    80005474:	01013403          	ld	s0,16(sp)
    80005478:	00813483          	ld	s1,8(sp)
    8000547c:	02010113          	addi	sp,sp,32
    80005480:	00008067          	ret
    80005484:	00003617          	auipc	a2,0x3
    80005488:	b7c60613          	addi	a2,a2,-1156 # 80008000 <uart_tx_r>
    8000548c:	00003517          	auipc	a0,0x3
    80005490:	b7c50513          	addi	a0,a0,-1156 # 80008008 <uart_tx_w>
    80005494:	00063783          	ld	a5,0(a2)
    80005498:	00053703          	ld	a4,0(a0)
    8000549c:	04f70263          	beq	a4,a5,800054e0 <uartintr+0x110>
    800054a0:	100005b7          	lui	a1,0x10000
    800054a4:	00004817          	auipc	a6,0x4
    800054a8:	dec80813          	addi	a6,a6,-532 # 80009290 <uart_tx_buf>
    800054ac:	01c0006f          	j	800054c8 <uartintr+0xf8>
    800054b0:	0006c703          	lbu	a4,0(a3)
    800054b4:	00f63023          	sd	a5,0(a2)
    800054b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800054bc:	00063783          	ld	a5,0(a2)
    800054c0:	00053703          	ld	a4,0(a0)
    800054c4:	02f70063          	beq	a4,a5,800054e4 <uartintr+0x114>
    800054c8:	01f7f713          	andi	a4,a5,31
    800054cc:	00e806b3          	add	a3,a6,a4
    800054d0:	0055c703          	lbu	a4,5(a1)
    800054d4:	00178793          	addi	a5,a5,1
    800054d8:	02077713          	andi	a4,a4,32
    800054dc:	fc071ae3          	bnez	a4,800054b0 <uartintr+0xe0>
    800054e0:	00008067          	ret
    800054e4:	00008067          	ret

00000000800054e8 <kinit>:
    800054e8:	fc010113          	addi	sp,sp,-64
    800054ec:	02913423          	sd	s1,40(sp)
    800054f0:	fffff7b7          	lui	a5,0xfffff
    800054f4:	00005497          	auipc	s1,0x5
    800054f8:	dbb48493          	addi	s1,s1,-581 # 8000a2af <end+0xfff>
    800054fc:	02813823          	sd	s0,48(sp)
    80005500:	01313c23          	sd	s3,24(sp)
    80005504:	00f4f4b3          	and	s1,s1,a5
    80005508:	02113c23          	sd	ra,56(sp)
    8000550c:	03213023          	sd	s2,32(sp)
    80005510:	01413823          	sd	s4,16(sp)
    80005514:	01513423          	sd	s5,8(sp)
    80005518:	04010413          	addi	s0,sp,64
    8000551c:	000017b7          	lui	a5,0x1
    80005520:	01100993          	li	s3,17
    80005524:	00f487b3          	add	a5,s1,a5
    80005528:	01b99993          	slli	s3,s3,0x1b
    8000552c:	06f9e063          	bltu	s3,a5,8000558c <kinit+0xa4>
    80005530:	00004a97          	auipc	s5,0x4
    80005534:	d80a8a93          	addi	s5,s5,-640 # 800092b0 <end>
    80005538:	0754ec63          	bltu	s1,s5,800055b0 <kinit+0xc8>
    8000553c:	0734fa63          	bgeu	s1,s3,800055b0 <kinit+0xc8>
    80005540:	00088a37          	lui	s4,0x88
    80005544:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80005548:	00003917          	auipc	s2,0x3
    8000554c:	ac890913          	addi	s2,s2,-1336 # 80008010 <kmem>
    80005550:	00ca1a13          	slli	s4,s4,0xc
    80005554:	0140006f          	j	80005568 <kinit+0x80>
    80005558:	000017b7          	lui	a5,0x1
    8000555c:	00f484b3          	add	s1,s1,a5
    80005560:	0554e863          	bltu	s1,s5,800055b0 <kinit+0xc8>
    80005564:	0534f663          	bgeu	s1,s3,800055b0 <kinit+0xc8>
    80005568:	00001637          	lui	a2,0x1
    8000556c:	00100593          	li	a1,1
    80005570:	00048513          	mv	a0,s1
    80005574:	00000097          	auipc	ra,0x0
    80005578:	5e4080e7          	jalr	1508(ra) # 80005b58 <__memset>
    8000557c:	00093783          	ld	a5,0(s2)
    80005580:	00f4b023          	sd	a5,0(s1)
    80005584:	00993023          	sd	s1,0(s2)
    80005588:	fd4498e3          	bne	s1,s4,80005558 <kinit+0x70>
    8000558c:	03813083          	ld	ra,56(sp)
    80005590:	03013403          	ld	s0,48(sp)
    80005594:	02813483          	ld	s1,40(sp)
    80005598:	02013903          	ld	s2,32(sp)
    8000559c:	01813983          	ld	s3,24(sp)
    800055a0:	01013a03          	ld	s4,16(sp)
    800055a4:	00813a83          	ld	s5,8(sp)
    800055a8:	04010113          	addi	sp,sp,64
    800055ac:	00008067          	ret
    800055b0:	00002517          	auipc	a0,0x2
    800055b4:	f2050513          	addi	a0,a0,-224 # 800074d0 <digits+0x18>
    800055b8:	fffff097          	auipc	ra,0xfffff
    800055bc:	4b4080e7          	jalr	1204(ra) # 80004a6c <panic>

00000000800055c0 <freerange>:
    800055c0:	fc010113          	addi	sp,sp,-64
    800055c4:	000017b7          	lui	a5,0x1
    800055c8:	02913423          	sd	s1,40(sp)
    800055cc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800055d0:	009504b3          	add	s1,a0,s1
    800055d4:	fffff537          	lui	a0,0xfffff
    800055d8:	02813823          	sd	s0,48(sp)
    800055dc:	02113c23          	sd	ra,56(sp)
    800055e0:	03213023          	sd	s2,32(sp)
    800055e4:	01313c23          	sd	s3,24(sp)
    800055e8:	01413823          	sd	s4,16(sp)
    800055ec:	01513423          	sd	s5,8(sp)
    800055f0:	01613023          	sd	s6,0(sp)
    800055f4:	04010413          	addi	s0,sp,64
    800055f8:	00a4f4b3          	and	s1,s1,a0
    800055fc:	00f487b3          	add	a5,s1,a5
    80005600:	06f5e463          	bltu	a1,a5,80005668 <freerange+0xa8>
    80005604:	00004a97          	auipc	s5,0x4
    80005608:	caca8a93          	addi	s5,s5,-852 # 800092b0 <end>
    8000560c:	0954e263          	bltu	s1,s5,80005690 <freerange+0xd0>
    80005610:	01100993          	li	s3,17
    80005614:	01b99993          	slli	s3,s3,0x1b
    80005618:	0734fc63          	bgeu	s1,s3,80005690 <freerange+0xd0>
    8000561c:	00058a13          	mv	s4,a1
    80005620:	00003917          	auipc	s2,0x3
    80005624:	9f090913          	addi	s2,s2,-1552 # 80008010 <kmem>
    80005628:	00002b37          	lui	s6,0x2
    8000562c:	0140006f          	j	80005640 <freerange+0x80>
    80005630:	000017b7          	lui	a5,0x1
    80005634:	00f484b3          	add	s1,s1,a5
    80005638:	0554ec63          	bltu	s1,s5,80005690 <freerange+0xd0>
    8000563c:	0534fa63          	bgeu	s1,s3,80005690 <freerange+0xd0>
    80005640:	00001637          	lui	a2,0x1
    80005644:	00100593          	li	a1,1
    80005648:	00048513          	mv	a0,s1
    8000564c:	00000097          	auipc	ra,0x0
    80005650:	50c080e7          	jalr	1292(ra) # 80005b58 <__memset>
    80005654:	00093703          	ld	a4,0(s2)
    80005658:	016487b3          	add	a5,s1,s6
    8000565c:	00e4b023          	sd	a4,0(s1)
    80005660:	00993023          	sd	s1,0(s2)
    80005664:	fcfa76e3          	bgeu	s4,a5,80005630 <freerange+0x70>
    80005668:	03813083          	ld	ra,56(sp)
    8000566c:	03013403          	ld	s0,48(sp)
    80005670:	02813483          	ld	s1,40(sp)
    80005674:	02013903          	ld	s2,32(sp)
    80005678:	01813983          	ld	s3,24(sp)
    8000567c:	01013a03          	ld	s4,16(sp)
    80005680:	00813a83          	ld	s5,8(sp)
    80005684:	00013b03          	ld	s6,0(sp)
    80005688:	04010113          	addi	sp,sp,64
    8000568c:	00008067          	ret
    80005690:	00002517          	auipc	a0,0x2
    80005694:	e4050513          	addi	a0,a0,-448 # 800074d0 <digits+0x18>
    80005698:	fffff097          	auipc	ra,0xfffff
    8000569c:	3d4080e7          	jalr	980(ra) # 80004a6c <panic>

00000000800056a0 <kfree>:
    800056a0:	fe010113          	addi	sp,sp,-32
    800056a4:	00813823          	sd	s0,16(sp)
    800056a8:	00113c23          	sd	ra,24(sp)
    800056ac:	00913423          	sd	s1,8(sp)
    800056b0:	02010413          	addi	s0,sp,32
    800056b4:	03451793          	slli	a5,a0,0x34
    800056b8:	04079c63          	bnez	a5,80005710 <kfree+0x70>
    800056bc:	00004797          	auipc	a5,0x4
    800056c0:	bf478793          	addi	a5,a5,-1036 # 800092b0 <end>
    800056c4:	00050493          	mv	s1,a0
    800056c8:	04f56463          	bltu	a0,a5,80005710 <kfree+0x70>
    800056cc:	01100793          	li	a5,17
    800056d0:	01b79793          	slli	a5,a5,0x1b
    800056d4:	02f57e63          	bgeu	a0,a5,80005710 <kfree+0x70>
    800056d8:	00001637          	lui	a2,0x1
    800056dc:	00100593          	li	a1,1
    800056e0:	00000097          	auipc	ra,0x0
    800056e4:	478080e7          	jalr	1144(ra) # 80005b58 <__memset>
    800056e8:	00003797          	auipc	a5,0x3
    800056ec:	92878793          	addi	a5,a5,-1752 # 80008010 <kmem>
    800056f0:	0007b703          	ld	a4,0(a5)
    800056f4:	01813083          	ld	ra,24(sp)
    800056f8:	01013403          	ld	s0,16(sp)
    800056fc:	00e4b023          	sd	a4,0(s1)
    80005700:	0097b023          	sd	s1,0(a5)
    80005704:	00813483          	ld	s1,8(sp)
    80005708:	02010113          	addi	sp,sp,32
    8000570c:	00008067          	ret
    80005710:	00002517          	auipc	a0,0x2
    80005714:	dc050513          	addi	a0,a0,-576 # 800074d0 <digits+0x18>
    80005718:	fffff097          	auipc	ra,0xfffff
    8000571c:	354080e7          	jalr	852(ra) # 80004a6c <panic>

0000000080005720 <kalloc>:
    80005720:	fe010113          	addi	sp,sp,-32
    80005724:	00813823          	sd	s0,16(sp)
    80005728:	00913423          	sd	s1,8(sp)
    8000572c:	00113c23          	sd	ra,24(sp)
    80005730:	02010413          	addi	s0,sp,32
    80005734:	00003797          	auipc	a5,0x3
    80005738:	8dc78793          	addi	a5,a5,-1828 # 80008010 <kmem>
    8000573c:	0007b483          	ld	s1,0(a5)
    80005740:	02048063          	beqz	s1,80005760 <kalloc+0x40>
    80005744:	0004b703          	ld	a4,0(s1)
    80005748:	00001637          	lui	a2,0x1
    8000574c:	00500593          	li	a1,5
    80005750:	00048513          	mv	a0,s1
    80005754:	00e7b023          	sd	a4,0(a5)
    80005758:	00000097          	auipc	ra,0x0
    8000575c:	400080e7          	jalr	1024(ra) # 80005b58 <__memset>
    80005760:	01813083          	ld	ra,24(sp)
    80005764:	01013403          	ld	s0,16(sp)
    80005768:	00048513          	mv	a0,s1
    8000576c:	00813483          	ld	s1,8(sp)
    80005770:	02010113          	addi	sp,sp,32
    80005774:	00008067          	ret

0000000080005778 <initlock>:
    80005778:	ff010113          	addi	sp,sp,-16
    8000577c:	00813423          	sd	s0,8(sp)
    80005780:	01010413          	addi	s0,sp,16
    80005784:	00813403          	ld	s0,8(sp)
    80005788:	00b53423          	sd	a1,8(a0)
    8000578c:	00052023          	sw	zero,0(a0)
    80005790:	00053823          	sd	zero,16(a0)
    80005794:	01010113          	addi	sp,sp,16
    80005798:	00008067          	ret

000000008000579c <acquire>:
    8000579c:	fe010113          	addi	sp,sp,-32
    800057a0:	00813823          	sd	s0,16(sp)
    800057a4:	00913423          	sd	s1,8(sp)
    800057a8:	00113c23          	sd	ra,24(sp)
    800057ac:	01213023          	sd	s2,0(sp)
    800057b0:	02010413          	addi	s0,sp,32
    800057b4:	00050493          	mv	s1,a0
    800057b8:	10002973          	csrr	s2,sstatus
    800057bc:	100027f3          	csrr	a5,sstatus
    800057c0:	ffd7f793          	andi	a5,a5,-3
    800057c4:	10079073          	csrw	sstatus,a5
    800057c8:	fffff097          	auipc	ra,0xfffff
    800057cc:	8ec080e7          	jalr	-1812(ra) # 800040b4 <mycpu>
    800057d0:	07852783          	lw	a5,120(a0)
    800057d4:	06078e63          	beqz	a5,80005850 <acquire+0xb4>
    800057d8:	fffff097          	auipc	ra,0xfffff
    800057dc:	8dc080e7          	jalr	-1828(ra) # 800040b4 <mycpu>
    800057e0:	07852783          	lw	a5,120(a0)
    800057e4:	0004a703          	lw	a4,0(s1)
    800057e8:	0017879b          	addiw	a5,a5,1
    800057ec:	06f52c23          	sw	a5,120(a0)
    800057f0:	04071063          	bnez	a4,80005830 <acquire+0x94>
    800057f4:	00100713          	li	a4,1
    800057f8:	00070793          	mv	a5,a4
    800057fc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005800:	0007879b          	sext.w	a5,a5
    80005804:	fe079ae3          	bnez	a5,800057f8 <acquire+0x5c>
    80005808:	0ff0000f          	fence
    8000580c:	fffff097          	auipc	ra,0xfffff
    80005810:	8a8080e7          	jalr	-1880(ra) # 800040b4 <mycpu>
    80005814:	01813083          	ld	ra,24(sp)
    80005818:	01013403          	ld	s0,16(sp)
    8000581c:	00a4b823          	sd	a0,16(s1)
    80005820:	00013903          	ld	s2,0(sp)
    80005824:	00813483          	ld	s1,8(sp)
    80005828:	02010113          	addi	sp,sp,32
    8000582c:	00008067          	ret
    80005830:	0104b903          	ld	s2,16(s1)
    80005834:	fffff097          	auipc	ra,0xfffff
    80005838:	880080e7          	jalr	-1920(ra) # 800040b4 <mycpu>
    8000583c:	faa91ce3          	bne	s2,a0,800057f4 <acquire+0x58>
    80005840:	00002517          	auipc	a0,0x2
    80005844:	c9850513          	addi	a0,a0,-872 # 800074d8 <digits+0x20>
    80005848:	fffff097          	auipc	ra,0xfffff
    8000584c:	224080e7          	jalr	548(ra) # 80004a6c <panic>
    80005850:	00195913          	srli	s2,s2,0x1
    80005854:	fffff097          	auipc	ra,0xfffff
    80005858:	860080e7          	jalr	-1952(ra) # 800040b4 <mycpu>
    8000585c:	00197913          	andi	s2,s2,1
    80005860:	07252e23          	sw	s2,124(a0)
    80005864:	f75ff06f          	j	800057d8 <acquire+0x3c>

0000000080005868 <release>:
    80005868:	fe010113          	addi	sp,sp,-32
    8000586c:	00813823          	sd	s0,16(sp)
    80005870:	00113c23          	sd	ra,24(sp)
    80005874:	00913423          	sd	s1,8(sp)
    80005878:	01213023          	sd	s2,0(sp)
    8000587c:	02010413          	addi	s0,sp,32
    80005880:	00052783          	lw	a5,0(a0)
    80005884:	00079a63          	bnez	a5,80005898 <release+0x30>
    80005888:	00002517          	auipc	a0,0x2
    8000588c:	c5850513          	addi	a0,a0,-936 # 800074e0 <digits+0x28>
    80005890:	fffff097          	auipc	ra,0xfffff
    80005894:	1dc080e7          	jalr	476(ra) # 80004a6c <panic>
    80005898:	01053903          	ld	s2,16(a0)
    8000589c:	00050493          	mv	s1,a0
    800058a0:	fffff097          	auipc	ra,0xfffff
    800058a4:	814080e7          	jalr	-2028(ra) # 800040b4 <mycpu>
    800058a8:	fea910e3          	bne	s2,a0,80005888 <release+0x20>
    800058ac:	0004b823          	sd	zero,16(s1)
    800058b0:	0ff0000f          	fence
    800058b4:	0f50000f          	fence	iorw,ow
    800058b8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800058bc:	ffffe097          	auipc	ra,0xffffe
    800058c0:	7f8080e7          	jalr	2040(ra) # 800040b4 <mycpu>
    800058c4:	100027f3          	csrr	a5,sstatus
    800058c8:	0027f793          	andi	a5,a5,2
    800058cc:	04079a63          	bnez	a5,80005920 <release+0xb8>
    800058d0:	07852783          	lw	a5,120(a0)
    800058d4:	02f05e63          	blez	a5,80005910 <release+0xa8>
    800058d8:	fff7871b          	addiw	a4,a5,-1
    800058dc:	06e52c23          	sw	a4,120(a0)
    800058e0:	00071c63          	bnez	a4,800058f8 <release+0x90>
    800058e4:	07c52783          	lw	a5,124(a0)
    800058e8:	00078863          	beqz	a5,800058f8 <release+0x90>
    800058ec:	100027f3          	csrr	a5,sstatus
    800058f0:	0027e793          	ori	a5,a5,2
    800058f4:	10079073          	csrw	sstatus,a5
    800058f8:	01813083          	ld	ra,24(sp)
    800058fc:	01013403          	ld	s0,16(sp)
    80005900:	00813483          	ld	s1,8(sp)
    80005904:	00013903          	ld	s2,0(sp)
    80005908:	02010113          	addi	sp,sp,32
    8000590c:	00008067          	ret
    80005910:	00002517          	auipc	a0,0x2
    80005914:	bf050513          	addi	a0,a0,-1040 # 80007500 <digits+0x48>
    80005918:	fffff097          	auipc	ra,0xfffff
    8000591c:	154080e7          	jalr	340(ra) # 80004a6c <panic>
    80005920:	00002517          	auipc	a0,0x2
    80005924:	bc850513          	addi	a0,a0,-1080 # 800074e8 <digits+0x30>
    80005928:	fffff097          	auipc	ra,0xfffff
    8000592c:	144080e7          	jalr	324(ra) # 80004a6c <panic>

0000000080005930 <holding>:
    80005930:	00052783          	lw	a5,0(a0)
    80005934:	00079663          	bnez	a5,80005940 <holding+0x10>
    80005938:	00000513          	li	a0,0
    8000593c:	00008067          	ret
    80005940:	fe010113          	addi	sp,sp,-32
    80005944:	00813823          	sd	s0,16(sp)
    80005948:	00913423          	sd	s1,8(sp)
    8000594c:	00113c23          	sd	ra,24(sp)
    80005950:	02010413          	addi	s0,sp,32
    80005954:	01053483          	ld	s1,16(a0)
    80005958:	ffffe097          	auipc	ra,0xffffe
    8000595c:	75c080e7          	jalr	1884(ra) # 800040b4 <mycpu>
    80005960:	01813083          	ld	ra,24(sp)
    80005964:	01013403          	ld	s0,16(sp)
    80005968:	40a48533          	sub	a0,s1,a0
    8000596c:	00153513          	seqz	a0,a0
    80005970:	00813483          	ld	s1,8(sp)
    80005974:	02010113          	addi	sp,sp,32
    80005978:	00008067          	ret

000000008000597c <push_off>:
    8000597c:	fe010113          	addi	sp,sp,-32
    80005980:	00813823          	sd	s0,16(sp)
    80005984:	00113c23          	sd	ra,24(sp)
    80005988:	00913423          	sd	s1,8(sp)
    8000598c:	02010413          	addi	s0,sp,32
    80005990:	100024f3          	csrr	s1,sstatus
    80005994:	100027f3          	csrr	a5,sstatus
    80005998:	ffd7f793          	andi	a5,a5,-3
    8000599c:	10079073          	csrw	sstatus,a5
    800059a0:	ffffe097          	auipc	ra,0xffffe
    800059a4:	714080e7          	jalr	1812(ra) # 800040b4 <mycpu>
    800059a8:	07852783          	lw	a5,120(a0)
    800059ac:	02078663          	beqz	a5,800059d8 <push_off+0x5c>
    800059b0:	ffffe097          	auipc	ra,0xffffe
    800059b4:	704080e7          	jalr	1796(ra) # 800040b4 <mycpu>
    800059b8:	07852783          	lw	a5,120(a0)
    800059bc:	01813083          	ld	ra,24(sp)
    800059c0:	01013403          	ld	s0,16(sp)
    800059c4:	0017879b          	addiw	a5,a5,1
    800059c8:	06f52c23          	sw	a5,120(a0)
    800059cc:	00813483          	ld	s1,8(sp)
    800059d0:	02010113          	addi	sp,sp,32
    800059d4:	00008067          	ret
    800059d8:	0014d493          	srli	s1,s1,0x1
    800059dc:	ffffe097          	auipc	ra,0xffffe
    800059e0:	6d8080e7          	jalr	1752(ra) # 800040b4 <mycpu>
    800059e4:	0014f493          	andi	s1,s1,1
    800059e8:	06952e23          	sw	s1,124(a0)
    800059ec:	fc5ff06f          	j	800059b0 <push_off+0x34>

00000000800059f0 <pop_off>:
    800059f0:	ff010113          	addi	sp,sp,-16
    800059f4:	00813023          	sd	s0,0(sp)
    800059f8:	00113423          	sd	ra,8(sp)
    800059fc:	01010413          	addi	s0,sp,16
    80005a00:	ffffe097          	auipc	ra,0xffffe
    80005a04:	6b4080e7          	jalr	1716(ra) # 800040b4 <mycpu>
    80005a08:	100027f3          	csrr	a5,sstatus
    80005a0c:	0027f793          	andi	a5,a5,2
    80005a10:	04079663          	bnez	a5,80005a5c <pop_off+0x6c>
    80005a14:	07852783          	lw	a5,120(a0)
    80005a18:	02f05a63          	blez	a5,80005a4c <pop_off+0x5c>
    80005a1c:	fff7871b          	addiw	a4,a5,-1
    80005a20:	06e52c23          	sw	a4,120(a0)
    80005a24:	00071c63          	bnez	a4,80005a3c <pop_off+0x4c>
    80005a28:	07c52783          	lw	a5,124(a0)
    80005a2c:	00078863          	beqz	a5,80005a3c <pop_off+0x4c>
    80005a30:	100027f3          	csrr	a5,sstatus
    80005a34:	0027e793          	ori	a5,a5,2
    80005a38:	10079073          	csrw	sstatus,a5
    80005a3c:	00813083          	ld	ra,8(sp)
    80005a40:	00013403          	ld	s0,0(sp)
    80005a44:	01010113          	addi	sp,sp,16
    80005a48:	00008067          	ret
    80005a4c:	00002517          	auipc	a0,0x2
    80005a50:	ab450513          	addi	a0,a0,-1356 # 80007500 <digits+0x48>
    80005a54:	fffff097          	auipc	ra,0xfffff
    80005a58:	018080e7          	jalr	24(ra) # 80004a6c <panic>
    80005a5c:	00002517          	auipc	a0,0x2
    80005a60:	a8c50513          	addi	a0,a0,-1396 # 800074e8 <digits+0x30>
    80005a64:	fffff097          	auipc	ra,0xfffff
    80005a68:	008080e7          	jalr	8(ra) # 80004a6c <panic>

0000000080005a6c <push_on>:
    80005a6c:	fe010113          	addi	sp,sp,-32
    80005a70:	00813823          	sd	s0,16(sp)
    80005a74:	00113c23          	sd	ra,24(sp)
    80005a78:	00913423          	sd	s1,8(sp)
    80005a7c:	02010413          	addi	s0,sp,32
    80005a80:	100024f3          	csrr	s1,sstatus
    80005a84:	100027f3          	csrr	a5,sstatus
    80005a88:	0027e793          	ori	a5,a5,2
    80005a8c:	10079073          	csrw	sstatus,a5
    80005a90:	ffffe097          	auipc	ra,0xffffe
    80005a94:	624080e7          	jalr	1572(ra) # 800040b4 <mycpu>
    80005a98:	07852783          	lw	a5,120(a0)
    80005a9c:	02078663          	beqz	a5,80005ac8 <push_on+0x5c>
    80005aa0:	ffffe097          	auipc	ra,0xffffe
    80005aa4:	614080e7          	jalr	1556(ra) # 800040b4 <mycpu>
    80005aa8:	07852783          	lw	a5,120(a0)
    80005aac:	01813083          	ld	ra,24(sp)
    80005ab0:	01013403          	ld	s0,16(sp)
    80005ab4:	0017879b          	addiw	a5,a5,1
    80005ab8:	06f52c23          	sw	a5,120(a0)
    80005abc:	00813483          	ld	s1,8(sp)
    80005ac0:	02010113          	addi	sp,sp,32
    80005ac4:	00008067          	ret
    80005ac8:	0014d493          	srli	s1,s1,0x1
    80005acc:	ffffe097          	auipc	ra,0xffffe
    80005ad0:	5e8080e7          	jalr	1512(ra) # 800040b4 <mycpu>
    80005ad4:	0014f493          	andi	s1,s1,1
    80005ad8:	06952e23          	sw	s1,124(a0)
    80005adc:	fc5ff06f          	j	80005aa0 <push_on+0x34>

0000000080005ae0 <pop_on>:
    80005ae0:	ff010113          	addi	sp,sp,-16
    80005ae4:	00813023          	sd	s0,0(sp)
    80005ae8:	00113423          	sd	ra,8(sp)
    80005aec:	01010413          	addi	s0,sp,16
    80005af0:	ffffe097          	auipc	ra,0xffffe
    80005af4:	5c4080e7          	jalr	1476(ra) # 800040b4 <mycpu>
    80005af8:	100027f3          	csrr	a5,sstatus
    80005afc:	0027f793          	andi	a5,a5,2
    80005b00:	04078463          	beqz	a5,80005b48 <pop_on+0x68>
    80005b04:	07852783          	lw	a5,120(a0)
    80005b08:	02f05863          	blez	a5,80005b38 <pop_on+0x58>
    80005b0c:	fff7879b          	addiw	a5,a5,-1
    80005b10:	06f52c23          	sw	a5,120(a0)
    80005b14:	07853783          	ld	a5,120(a0)
    80005b18:	00079863          	bnez	a5,80005b28 <pop_on+0x48>
    80005b1c:	100027f3          	csrr	a5,sstatus
    80005b20:	ffd7f793          	andi	a5,a5,-3
    80005b24:	10079073          	csrw	sstatus,a5
    80005b28:	00813083          	ld	ra,8(sp)
    80005b2c:	00013403          	ld	s0,0(sp)
    80005b30:	01010113          	addi	sp,sp,16
    80005b34:	00008067          	ret
    80005b38:	00002517          	auipc	a0,0x2
    80005b3c:	9f050513          	addi	a0,a0,-1552 # 80007528 <digits+0x70>
    80005b40:	fffff097          	auipc	ra,0xfffff
    80005b44:	f2c080e7          	jalr	-212(ra) # 80004a6c <panic>
    80005b48:	00002517          	auipc	a0,0x2
    80005b4c:	9c050513          	addi	a0,a0,-1600 # 80007508 <digits+0x50>
    80005b50:	fffff097          	auipc	ra,0xfffff
    80005b54:	f1c080e7          	jalr	-228(ra) # 80004a6c <panic>

0000000080005b58 <__memset>:
    80005b58:	ff010113          	addi	sp,sp,-16
    80005b5c:	00813423          	sd	s0,8(sp)
    80005b60:	01010413          	addi	s0,sp,16
    80005b64:	1a060e63          	beqz	a2,80005d20 <__memset+0x1c8>
    80005b68:	40a007b3          	neg	a5,a0
    80005b6c:	0077f793          	andi	a5,a5,7
    80005b70:	00778693          	addi	a3,a5,7
    80005b74:	00b00813          	li	a6,11
    80005b78:	0ff5f593          	andi	a1,a1,255
    80005b7c:	fff6071b          	addiw	a4,a2,-1
    80005b80:	1b06e663          	bltu	a3,a6,80005d2c <__memset+0x1d4>
    80005b84:	1cd76463          	bltu	a4,a3,80005d4c <__memset+0x1f4>
    80005b88:	1a078e63          	beqz	a5,80005d44 <__memset+0x1ec>
    80005b8c:	00b50023          	sb	a1,0(a0)
    80005b90:	00100713          	li	a4,1
    80005b94:	1ae78463          	beq	a5,a4,80005d3c <__memset+0x1e4>
    80005b98:	00b500a3          	sb	a1,1(a0)
    80005b9c:	00200713          	li	a4,2
    80005ba0:	1ae78a63          	beq	a5,a4,80005d54 <__memset+0x1fc>
    80005ba4:	00b50123          	sb	a1,2(a0)
    80005ba8:	00300713          	li	a4,3
    80005bac:	18e78463          	beq	a5,a4,80005d34 <__memset+0x1dc>
    80005bb0:	00b501a3          	sb	a1,3(a0)
    80005bb4:	00400713          	li	a4,4
    80005bb8:	1ae78263          	beq	a5,a4,80005d5c <__memset+0x204>
    80005bbc:	00b50223          	sb	a1,4(a0)
    80005bc0:	00500713          	li	a4,5
    80005bc4:	1ae78063          	beq	a5,a4,80005d64 <__memset+0x20c>
    80005bc8:	00b502a3          	sb	a1,5(a0)
    80005bcc:	00700713          	li	a4,7
    80005bd0:	18e79e63          	bne	a5,a4,80005d6c <__memset+0x214>
    80005bd4:	00b50323          	sb	a1,6(a0)
    80005bd8:	00700e93          	li	t4,7
    80005bdc:	00859713          	slli	a4,a1,0x8
    80005be0:	00e5e733          	or	a4,a1,a4
    80005be4:	01059e13          	slli	t3,a1,0x10
    80005be8:	01c76e33          	or	t3,a4,t3
    80005bec:	01859313          	slli	t1,a1,0x18
    80005bf0:	006e6333          	or	t1,t3,t1
    80005bf4:	02059893          	slli	a7,a1,0x20
    80005bf8:	40f60e3b          	subw	t3,a2,a5
    80005bfc:	011368b3          	or	a7,t1,a7
    80005c00:	02859813          	slli	a6,a1,0x28
    80005c04:	0108e833          	or	a6,a7,a6
    80005c08:	03059693          	slli	a3,a1,0x30
    80005c0c:	003e589b          	srliw	a7,t3,0x3
    80005c10:	00d866b3          	or	a3,a6,a3
    80005c14:	03859713          	slli	a4,a1,0x38
    80005c18:	00389813          	slli	a6,a7,0x3
    80005c1c:	00f507b3          	add	a5,a0,a5
    80005c20:	00e6e733          	or	a4,a3,a4
    80005c24:	000e089b          	sext.w	a7,t3
    80005c28:	00f806b3          	add	a3,a6,a5
    80005c2c:	00e7b023          	sd	a4,0(a5)
    80005c30:	00878793          	addi	a5,a5,8
    80005c34:	fed79ce3          	bne	a5,a3,80005c2c <__memset+0xd4>
    80005c38:	ff8e7793          	andi	a5,t3,-8
    80005c3c:	0007871b          	sext.w	a4,a5
    80005c40:	01d787bb          	addw	a5,a5,t4
    80005c44:	0ce88e63          	beq	a7,a4,80005d20 <__memset+0x1c8>
    80005c48:	00f50733          	add	a4,a0,a5
    80005c4c:	00b70023          	sb	a1,0(a4)
    80005c50:	0017871b          	addiw	a4,a5,1
    80005c54:	0cc77663          	bgeu	a4,a2,80005d20 <__memset+0x1c8>
    80005c58:	00e50733          	add	a4,a0,a4
    80005c5c:	00b70023          	sb	a1,0(a4)
    80005c60:	0027871b          	addiw	a4,a5,2
    80005c64:	0ac77e63          	bgeu	a4,a2,80005d20 <__memset+0x1c8>
    80005c68:	00e50733          	add	a4,a0,a4
    80005c6c:	00b70023          	sb	a1,0(a4)
    80005c70:	0037871b          	addiw	a4,a5,3
    80005c74:	0ac77663          	bgeu	a4,a2,80005d20 <__memset+0x1c8>
    80005c78:	00e50733          	add	a4,a0,a4
    80005c7c:	00b70023          	sb	a1,0(a4)
    80005c80:	0047871b          	addiw	a4,a5,4
    80005c84:	08c77e63          	bgeu	a4,a2,80005d20 <__memset+0x1c8>
    80005c88:	00e50733          	add	a4,a0,a4
    80005c8c:	00b70023          	sb	a1,0(a4)
    80005c90:	0057871b          	addiw	a4,a5,5
    80005c94:	08c77663          	bgeu	a4,a2,80005d20 <__memset+0x1c8>
    80005c98:	00e50733          	add	a4,a0,a4
    80005c9c:	00b70023          	sb	a1,0(a4)
    80005ca0:	0067871b          	addiw	a4,a5,6
    80005ca4:	06c77e63          	bgeu	a4,a2,80005d20 <__memset+0x1c8>
    80005ca8:	00e50733          	add	a4,a0,a4
    80005cac:	00b70023          	sb	a1,0(a4)
    80005cb0:	0077871b          	addiw	a4,a5,7
    80005cb4:	06c77663          	bgeu	a4,a2,80005d20 <__memset+0x1c8>
    80005cb8:	00e50733          	add	a4,a0,a4
    80005cbc:	00b70023          	sb	a1,0(a4)
    80005cc0:	0087871b          	addiw	a4,a5,8
    80005cc4:	04c77e63          	bgeu	a4,a2,80005d20 <__memset+0x1c8>
    80005cc8:	00e50733          	add	a4,a0,a4
    80005ccc:	00b70023          	sb	a1,0(a4)
    80005cd0:	0097871b          	addiw	a4,a5,9
    80005cd4:	04c77663          	bgeu	a4,a2,80005d20 <__memset+0x1c8>
    80005cd8:	00e50733          	add	a4,a0,a4
    80005cdc:	00b70023          	sb	a1,0(a4)
    80005ce0:	00a7871b          	addiw	a4,a5,10
    80005ce4:	02c77e63          	bgeu	a4,a2,80005d20 <__memset+0x1c8>
    80005ce8:	00e50733          	add	a4,a0,a4
    80005cec:	00b70023          	sb	a1,0(a4)
    80005cf0:	00b7871b          	addiw	a4,a5,11
    80005cf4:	02c77663          	bgeu	a4,a2,80005d20 <__memset+0x1c8>
    80005cf8:	00e50733          	add	a4,a0,a4
    80005cfc:	00b70023          	sb	a1,0(a4)
    80005d00:	00c7871b          	addiw	a4,a5,12
    80005d04:	00c77e63          	bgeu	a4,a2,80005d20 <__memset+0x1c8>
    80005d08:	00e50733          	add	a4,a0,a4
    80005d0c:	00b70023          	sb	a1,0(a4)
    80005d10:	00d7879b          	addiw	a5,a5,13
    80005d14:	00c7f663          	bgeu	a5,a2,80005d20 <__memset+0x1c8>
    80005d18:	00f507b3          	add	a5,a0,a5
    80005d1c:	00b78023          	sb	a1,0(a5)
    80005d20:	00813403          	ld	s0,8(sp)
    80005d24:	01010113          	addi	sp,sp,16
    80005d28:	00008067          	ret
    80005d2c:	00b00693          	li	a3,11
    80005d30:	e55ff06f          	j	80005b84 <__memset+0x2c>
    80005d34:	00300e93          	li	t4,3
    80005d38:	ea5ff06f          	j	80005bdc <__memset+0x84>
    80005d3c:	00100e93          	li	t4,1
    80005d40:	e9dff06f          	j	80005bdc <__memset+0x84>
    80005d44:	00000e93          	li	t4,0
    80005d48:	e95ff06f          	j	80005bdc <__memset+0x84>
    80005d4c:	00000793          	li	a5,0
    80005d50:	ef9ff06f          	j	80005c48 <__memset+0xf0>
    80005d54:	00200e93          	li	t4,2
    80005d58:	e85ff06f          	j	80005bdc <__memset+0x84>
    80005d5c:	00400e93          	li	t4,4
    80005d60:	e7dff06f          	j	80005bdc <__memset+0x84>
    80005d64:	00500e93          	li	t4,5
    80005d68:	e75ff06f          	j	80005bdc <__memset+0x84>
    80005d6c:	00600e93          	li	t4,6
    80005d70:	e6dff06f          	j	80005bdc <__memset+0x84>

0000000080005d74 <__memmove>:
    80005d74:	ff010113          	addi	sp,sp,-16
    80005d78:	00813423          	sd	s0,8(sp)
    80005d7c:	01010413          	addi	s0,sp,16
    80005d80:	0e060863          	beqz	a2,80005e70 <__memmove+0xfc>
    80005d84:	fff6069b          	addiw	a3,a2,-1
    80005d88:	0006881b          	sext.w	a6,a3
    80005d8c:	0ea5e863          	bltu	a1,a0,80005e7c <__memmove+0x108>
    80005d90:	00758713          	addi	a4,a1,7
    80005d94:	00a5e7b3          	or	a5,a1,a0
    80005d98:	40a70733          	sub	a4,a4,a0
    80005d9c:	0077f793          	andi	a5,a5,7
    80005da0:	00f73713          	sltiu	a4,a4,15
    80005da4:	00174713          	xori	a4,a4,1
    80005da8:	0017b793          	seqz	a5,a5
    80005dac:	00e7f7b3          	and	a5,a5,a4
    80005db0:	10078863          	beqz	a5,80005ec0 <__memmove+0x14c>
    80005db4:	00900793          	li	a5,9
    80005db8:	1107f463          	bgeu	a5,a6,80005ec0 <__memmove+0x14c>
    80005dbc:	0036581b          	srliw	a6,a2,0x3
    80005dc0:	fff8081b          	addiw	a6,a6,-1
    80005dc4:	02081813          	slli	a6,a6,0x20
    80005dc8:	01d85893          	srli	a7,a6,0x1d
    80005dcc:	00858813          	addi	a6,a1,8
    80005dd0:	00058793          	mv	a5,a1
    80005dd4:	00050713          	mv	a4,a0
    80005dd8:	01088833          	add	a6,a7,a6
    80005ddc:	0007b883          	ld	a7,0(a5)
    80005de0:	00878793          	addi	a5,a5,8
    80005de4:	00870713          	addi	a4,a4,8
    80005de8:	ff173c23          	sd	a7,-8(a4)
    80005dec:	ff0798e3          	bne	a5,a6,80005ddc <__memmove+0x68>
    80005df0:	ff867713          	andi	a4,a2,-8
    80005df4:	02071793          	slli	a5,a4,0x20
    80005df8:	0207d793          	srli	a5,a5,0x20
    80005dfc:	00f585b3          	add	a1,a1,a5
    80005e00:	40e686bb          	subw	a3,a3,a4
    80005e04:	00f507b3          	add	a5,a0,a5
    80005e08:	06e60463          	beq	a2,a4,80005e70 <__memmove+0xfc>
    80005e0c:	0005c703          	lbu	a4,0(a1)
    80005e10:	00e78023          	sb	a4,0(a5)
    80005e14:	04068e63          	beqz	a3,80005e70 <__memmove+0xfc>
    80005e18:	0015c603          	lbu	a2,1(a1)
    80005e1c:	00100713          	li	a4,1
    80005e20:	00c780a3          	sb	a2,1(a5)
    80005e24:	04e68663          	beq	a3,a4,80005e70 <__memmove+0xfc>
    80005e28:	0025c603          	lbu	a2,2(a1)
    80005e2c:	00200713          	li	a4,2
    80005e30:	00c78123          	sb	a2,2(a5)
    80005e34:	02e68e63          	beq	a3,a4,80005e70 <__memmove+0xfc>
    80005e38:	0035c603          	lbu	a2,3(a1)
    80005e3c:	00300713          	li	a4,3
    80005e40:	00c781a3          	sb	a2,3(a5)
    80005e44:	02e68663          	beq	a3,a4,80005e70 <__memmove+0xfc>
    80005e48:	0045c603          	lbu	a2,4(a1)
    80005e4c:	00400713          	li	a4,4
    80005e50:	00c78223          	sb	a2,4(a5)
    80005e54:	00e68e63          	beq	a3,a4,80005e70 <__memmove+0xfc>
    80005e58:	0055c603          	lbu	a2,5(a1)
    80005e5c:	00500713          	li	a4,5
    80005e60:	00c782a3          	sb	a2,5(a5)
    80005e64:	00e68663          	beq	a3,a4,80005e70 <__memmove+0xfc>
    80005e68:	0065c703          	lbu	a4,6(a1)
    80005e6c:	00e78323          	sb	a4,6(a5)
    80005e70:	00813403          	ld	s0,8(sp)
    80005e74:	01010113          	addi	sp,sp,16
    80005e78:	00008067          	ret
    80005e7c:	02061713          	slli	a4,a2,0x20
    80005e80:	02075713          	srli	a4,a4,0x20
    80005e84:	00e587b3          	add	a5,a1,a4
    80005e88:	f0f574e3          	bgeu	a0,a5,80005d90 <__memmove+0x1c>
    80005e8c:	02069613          	slli	a2,a3,0x20
    80005e90:	02065613          	srli	a2,a2,0x20
    80005e94:	fff64613          	not	a2,a2
    80005e98:	00e50733          	add	a4,a0,a4
    80005e9c:	00c78633          	add	a2,a5,a2
    80005ea0:	fff7c683          	lbu	a3,-1(a5)
    80005ea4:	fff78793          	addi	a5,a5,-1
    80005ea8:	fff70713          	addi	a4,a4,-1
    80005eac:	00d70023          	sb	a3,0(a4)
    80005eb0:	fec798e3          	bne	a5,a2,80005ea0 <__memmove+0x12c>
    80005eb4:	00813403          	ld	s0,8(sp)
    80005eb8:	01010113          	addi	sp,sp,16
    80005ebc:	00008067          	ret
    80005ec0:	02069713          	slli	a4,a3,0x20
    80005ec4:	02075713          	srli	a4,a4,0x20
    80005ec8:	00170713          	addi	a4,a4,1
    80005ecc:	00e50733          	add	a4,a0,a4
    80005ed0:	00050793          	mv	a5,a0
    80005ed4:	0005c683          	lbu	a3,0(a1)
    80005ed8:	00178793          	addi	a5,a5,1
    80005edc:	00158593          	addi	a1,a1,1
    80005ee0:	fed78fa3          	sb	a3,-1(a5)
    80005ee4:	fee798e3          	bne	a5,a4,80005ed4 <__memmove+0x160>
    80005ee8:	f89ff06f          	j	80005e70 <__memmove+0xfc>

0000000080005eec <__putc>:
    80005eec:	fe010113          	addi	sp,sp,-32
    80005ef0:	00813823          	sd	s0,16(sp)
    80005ef4:	00113c23          	sd	ra,24(sp)
    80005ef8:	02010413          	addi	s0,sp,32
    80005efc:	00050793          	mv	a5,a0
    80005f00:	fef40593          	addi	a1,s0,-17
    80005f04:	00100613          	li	a2,1
    80005f08:	00000513          	li	a0,0
    80005f0c:	fef407a3          	sb	a5,-17(s0)
    80005f10:	fffff097          	auipc	ra,0xfffff
    80005f14:	b3c080e7          	jalr	-1220(ra) # 80004a4c <console_write>
    80005f18:	01813083          	ld	ra,24(sp)
    80005f1c:	01013403          	ld	s0,16(sp)
    80005f20:	02010113          	addi	sp,sp,32
    80005f24:	00008067          	ret

0000000080005f28 <__getc>:
    80005f28:	fe010113          	addi	sp,sp,-32
    80005f2c:	00813823          	sd	s0,16(sp)
    80005f30:	00113c23          	sd	ra,24(sp)
    80005f34:	02010413          	addi	s0,sp,32
    80005f38:	fe840593          	addi	a1,s0,-24
    80005f3c:	00100613          	li	a2,1
    80005f40:	00000513          	li	a0,0
    80005f44:	fffff097          	auipc	ra,0xfffff
    80005f48:	ae8080e7          	jalr	-1304(ra) # 80004a2c <console_read>
    80005f4c:	fe844503          	lbu	a0,-24(s0)
    80005f50:	01813083          	ld	ra,24(sp)
    80005f54:	01013403          	ld	s0,16(sp)
    80005f58:	02010113          	addi	sp,sp,32
    80005f5c:	00008067          	ret

0000000080005f60 <console_handler>:
    80005f60:	fe010113          	addi	sp,sp,-32
    80005f64:	00813823          	sd	s0,16(sp)
    80005f68:	00113c23          	sd	ra,24(sp)
    80005f6c:	00913423          	sd	s1,8(sp)
    80005f70:	02010413          	addi	s0,sp,32
    80005f74:	14202773          	csrr	a4,scause
    80005f78:	100027f3          	csrr	a5,sstatus
    80005f7c:	0027f793          	andi	a5,a5,2
    80005f80:	06079e63          	bnez	a5,80005ffc <console_handler+0x9c>
    80005f84:	00074c63          	bltz	a4,80005f9c <console_handler+0x3c>
    80005f88:	01813083          	ld	ra,24(sp)
    80005f8c:	01013403          	ld	s0,16(sp)
    80005f90:	00813483          	ld	s1,8(sp)
    80005f94:	02010113          	addi	sp,sp,32
    80005f98:	00008067          	ret
    80005f9c:	0ff77713          	andi	a4,a4,255
    80005fa0:	00900793          	li	a5,9
    80005fa4:	fef712e3          	bne	a4,a5,80005f88 <console_handler+0x28>
    80005fa8:	ffffe097          	auipc	ra,0xffffe
    80005fac:	6dc080e7          	jalr	1756(ra) # 80004684 <plic_claim>
    80005fb0:	00a00793          	li	a5,10
    80005fb4:	00050493          	mv	s1,a0
    80005fb8:	02f50c63          	beq	a0,a5,80005ff0 <console_handler+0x90>
    80005fbc:	fc0506e3          	beqz	a0,80005f88 <console_handler+0x28>
    80005fc0:	00050593          	mv	a1,a0
    80005fc4:	00001517          	auipc	a0,0x1
    80005fc8:	46c50513          	addi	a0,a0,1132 # 80007430 <CONSOLE_STATUS+0x420>
    80005fcc:	fffff097          	auipc	ra,0xfffff
    80005fd0:	afc080e7          	jalr	-1284(ra) # 80004ac8 <__printf>
    80005fd4:	01013403          	ld	s0,16(sp)
    80005fd8:	01813083          	ld	ra,24(sp)
    80005fdc:	00048513          	mv	a0,s1
    80005fe0:	00813483          	ld	s1,8(sp)
    80005fe4:	02010113          	addi	sp,sp,32
    80005fe8:	ffffe317          	auipc	t1,0xffffe
    80005fec:	6d430067          	jr	1748(t1) # 800046bc <plic_complete>
    80005ff0:	fffff097          	auipc	ra,0xfffff
    80005ff4:	3e0080e7          	jalr	992(ra) # 800053d0 <uartintr>
    80005ff8:	fddff06f          	j	80005fd4 <console_handler+0x74>
    80005ffc:	00001517          	auipc	a0,0x1
    80006000:	53450513          	addi	a0,a0,1332 # 80007530 <digits+0x78>
    80006004:	fffff097          	auipc	ra,0xfffff
    80006008:	a68080e7          	jalr	-1432(ra) # 80004a6c <panic>
	...
