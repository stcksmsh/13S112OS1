
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000e117          	auipc	sp,0xe
    80000004:	0e813103          	ld	sp,232(sp) # 8000e0e8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	679080ef          	jal	ra,80008e94 <start>

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
    8000107c:	42d030ef          	jal	ra,80004ca8 <exceptionHandler>


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

0000000080001100 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001100:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001104:	00b29a63          	bne	t0,a1,80001118 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001108:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000110c:	fe029ae3          	bnez	t0,80001100 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001110:	00000513          	li	a0,0
    jr ra                  # Return.
    80001114:	00008067          	ret

0000000080001118 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001118:	00100513          	li	a0,1
    8000111c:	00008067          	ret

0000000080001120 <_Z9threadRunPv>:

int Thread::sleep (time_t time){
    return time_sleep(time);
}

void threadRun(void* arg){
    80001120:	ff010113          	addi	sp,sp,-16
    80001124:	00113423          	sd	ra,8(sp)
    80001128:	00813023          	sd	s0,0(sp)
    8000112c:	01010413          	addi	s0,sp,16
    Thread* thread = (Thread*)arg;
    thread->run();
    80001130:	00053783          	ld	a5,0(a0) # 1000 <_entry-0x7ffff000>
    80001134:	0107b783          	ld	a5,16(a5)
    80001138:	000780e7          	jalr	a5
}
    8000113c:	00813083          	ld	ra,8(sp)
    80001140:	00013403          	ld	s0,0(sp)
    80001144:	01010113          	addi	sp,sp,16
    80001148:	00008067          	ret

000000008000114c <_ZN6ThreadD1Ev>:
Thread::~Thread (){
    8000114c:	ff010113          	addi	sp,sp,-16
    80001150:	00113423          	sd	ra,8(sp)
    80001154:	00813023          	sd	s0,0(sp)
    80001158:	01010413          	addi	s0,sp,16
    8000115c:	0000d797          	auipc	a5,0xd
    80001160:	d4478793          	addi	a5,a5,-700 # 8000dea0 <_ZTV6Thread+0x10>
    80001164:	00f53023          	sd	a5,0(a0)
    mem_free(myHandle);
    80001168:	00853503          	ld	a0,8(a0)
    8000116c:	00000097          	auipc	ra,0x0
    80001170:	768080e7          	jalr	1896(ra) # 800018d4 <_Z8mem_freePv>
}
    80001174:	00813083          	ld	ra,8(sp)
    80001178:	00013403          	ld	s0,0(sp)
    8000117c:	01010113          	addi	sp,sp,16
    80001180:	00008067          	ret

0000000080001184 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore (unsigned init){
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore (){
    80001184:	ff010113          	addi	sp,sp,-16
    80001188:	00113423          	sd	ra,8(sp)
    8000118c:	00813023          	sd	s0,0(sp)
    80001190:	01010413          	addi	s0,sp,16
    80001194:	0000d797          	auipc	a5,0xd
    80001198:	d3478793          	addi	a5,a5,-716 # 8000dec8 <_ZTV9Semaphore+0x10>
    8000119c:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800011a0:	00853503          	ld	a0,8(a0)
    800011a4:	00001097          	auipc	ra,0x1
    800011a8:	8a0080e7          	jalr	-1888(ra) # 80001a44 <_Z9sem_closeP4_sem>
}
    800011ac:	00813083          	ld	ra,8(sp)
    800011b0:	00013403          	ld	s0,0(sp)
    800011b4:	01010113          	addi	sp,sp,16
    800011b8:	00008067          	ret

00000000800011bc <_Znwm>:
void* operator new (size_t nSize){
    800011bc:	ff010113          	addi	sp,sp,-16
    800011c0:	00113423          	sd	ra,8(sp)
    800011c4:	00813023          	sd	s0,0(sp)
    800011c8:	01010413          	addi	s0,sp,16
    return mem_alloc(nSize);
    800011cc:	00000097          	auipc	ra,0x0
    800011d0:	6d8080e7          	jalr	1752(ra) # 800018a4 <_Z9mem_allocm>
}
    800011d4:	00813083          	ld	ra,8(sp)
    800011d8:	00013403          	ld	s0,0(sp)
    800011dc:	01010113          	addi	sp,sp,16
    800011e0:	00008067          	ret

00000000800011e4 <_ZdlPv>:
void  operator delete (void* pAddress){
    800011e4:	ff010113          	addi	sp,sp,-16
    800011e8:	00113423          	sd	ra,8(sp)
    800011ec:	00813023          	sd	s0,0(sp)
    800011f0:	01010413          	addi	s0,sp,16
    mem_free(pAddress);
    800011f4:	00000097          	auipc	ra,0x0
    800011f8:	6e0080e7          	jalr	1760(ra) # 800018d4 <_Z8mem_freePv>
}
    800011fc:	00813083          	ld	ra,8(sp)
    80001200:	00013403          	ld	s0,0(sp)
    80001204:	01010113          	addi	sp,sp,16
    80001208:	00008067          	ret

000000008000120c <_ZN6ThreadD0Ev>:
Thread::~Thread (){
    8000120c:	fe010113          	addi	sp,sp,-32
    80001210:	00113c23          	sd	ra,24(sp)
    80001214:	00813823          	sd	s0,16(sp)
    80001218:	00913423          	sd	s1,8(sp)
    8000121c:	02010413          	addi	s0,sp,32
    80001220:	00050493          	mv	s1,a0
}
    80001224:	00000097          	auipc	ra,0x0
    80001228:	f28080e7          	jalr	-216(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000122c:	00048513          	mv	a0,s1
    80001230:	00000097          	auipc	ra,0x0
    80001234:	fb4080e7          	jalr	-76(ra) # 800011e4 <_ZdlPv>
    80001238:	01813083          	ld	ra,24(sp)
    8000123c:	01013403          	ld	s0,16(sp)
    80001240:	00813483          	ld	s1,8(sp)
    80001244:	02010113          	addi	sp,sp,32
    80001248:	00008067          	ret

000000008000124c <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore (){
    8000124c:	fe010113          	addi	sp,sp,-32
    80001250:	00113c23          	sd	ra,24(sp)
    80001254:	00813823          	sd	s0,16(sp)
    80001258:	00913423          	sd	s1,8(sp)
    8000125c:	02010413          	addi	s0,sp,32
    80001260:	00050493          	mv	s1,a0
}
    80001264:	00000097          	auipc	ra,0x0
    80001268:	f20080e7          	jalr	-224(ra) # 80001184 <_ZN9SemaphoreD1Ev>
    8000126c:	00048513          	mv	a0,s1
    80001270:	00000097          	auipc	ra,0x0
    80001274:	f74080e7          	jalr	-140(ra) # 800011e4 <_ZdlPv>
    80001278:	01813083          	ld	ra,24(sp)
    8000127c:	01013403          	ld	s0,16(sp)
    80001280:	00813483          	ld	s1,8(sp)
    80001284:	02010113          	addi	sp,sp,32
    80001288:	00008067          	ret

000000008000128c <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread (void (*body)(void*), void* arg): body(body), arg(arg){
    8000128c:	ff010113          	addi	sp,sp,-16
    80001290:	00813423          	sd	s0,8(sp)
    80001294:	01010413          	addi	s0,sp,16
    80001298:	0000d797          	auipc	a5,0xd
    8000129c:	c0878793          	addi	a5,a5,-1016 # 8000dea0 <_ZTV6Thread+0x10>
    800012a0:	00f53023          	sd	a5,0(a0)
    800012a4:	00b53823          	sd	a1,16(a0)
    800012a8:	00c53c23          	sd	a2,24(a0)
}
    800012ac:	00813403          	ld	s0,8(sp)
    800012b0:	01010113          	addi	sp,sp,16
    800012b4:	00008067          	ret

00000000800012b8 <_ZN6Thread5startEv>:
int Thread::start (){
    800012b8:	ff010113          	addi	sp,sp,-16
    800012bc:	00113423          	sd	ra,8(sp)
    800012c0:	00813023          	sd	s0,0(sp)
    800012c4:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, body, arg);
    800012c8:	01853603          	ld	a2,24(a0)
    800012cc:	01053583          	ld	a1,16(a0)
    800012d0:	00850513          	addi	a0,a0,8
    800012d4:	00000097          	auipc	ra,0x0
    800012d8:	62c080e7          	jalr	1580(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
}
    800012dc:	00813083          	ld	ra,8(sp)
    800012e0:	00013403          	ld	s0,0(sp)
    800012e4:	01010113          	addi	sp,sp,16
    800012e8:	00008067          	ret

00000000800012ec <_ZN6Thread4joinEv>:
void Thread::join(){
    800012ec:	ff010113          	addi	sp,sp,-16
    800012f0:	00113423          	sd	ra,8(sp)
    800012f4:	00813023          	sd	s0,0(sp)
    800012f8:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    800012fc:	00853503          	ld	a0,8(a0)
    80001300:	00000097          	auipc	ra,0x0
    80001304:	6bc080e7          	jalr	1724(ra) # 800019bc <_Z11thread_joinP7_thread>
}
    80001308:	00813083          	ld	ra,8(sp)
    8000130c:	00013403          	ld	s0,0(sp)
    80001310:	01010113          	addi	sp,sp,16
    80001314:	00008067          	ret

0000000080001318 <_ZN6Thread8dispatchEv>:
void Thread::dispatch (){
    80001318:	ff010113          	addi	sp,sp,-16
    8000131c:	00113423          	sd	ra,8(sp)
    80001320:	00813023          	sd	s0,0(sp)
    80001324:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001328:	00000097          	auipc	ra,0x0
    8000132c:	674080e7          	jalr	1652(ra) # 8000199c <_Z15thread_dispatchv>
}
    80001330:	00813083          	ld	ra,8(sp)
    80001334:	00013403          	ld	s0,0(sp)
    80001338:	01010113          	addi	sp,sp,16
    8000133c:	00008067          	ret

0000000080001340 <_ZN6Thread5sleepEm>:
int Thread::sleep (time_t time){
    80001340:	ff010113          	addi	sp,sp,-16
    80001344:	00113423          	sd	ra,8(sp)
    80001348:	00813023          	sd	s0,0(sp)
    8000134c:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    80001350:	00000097          	auipc	ra,0x0
    80001354:	690080e7          	jalr	1680(ra) # 800019e0 <_Z10time_sleepm>
}
    80001358:	00813083          	ld	ra,8(sp)
    8000135c:	00013403          	ld	s0,0(sp)
    80001360:	01010113          	addi	sp,sp,16
    80001364:	00008067          	ret

0000000080001368 <_ZN14PeriodicThread3runEv>:
PeriodicThread::PeriodicThread (time_t period): period(period){
    this->period = period;
    active = true;
}

void PeriodicThread::run (){
    80001368:	fe010113          	addi	sp,sp,-32
    8000136c:	00113c23          	sd	ra,24(sp)
    80001370:	00813823          	sd	s0,16(sp)
    80001374:	00913423          	sd	s1,8(sp)
    80001378:	02010413          	addi	s0,sp,32
    8000137c:	00050493          	mv	s1,a0
    while(1){
        periodicActivation();
    80001380:	0004b783          	ld	a5,0(s1)
    80001384:	0187b783          	ld	a5,24(a5)
    80001388:	00048513          	mv	a0,s1
    8000138c:	000780e7          	jalr	a5
        sleep(period);
    80001390:	0204b503          	ld	a0,32(s1)
    80001394:	00000097          	auipc	ra,0x0
    80001398:	fac080e7          	jalr	-84(ra) # 80001340 <_ZN6Thread5sleepEm>
    while(1){
    8000139c:	fe5ff06f          	j	80001380 <_ZN14PeriodicThread3runEv+0x18>

00000000800013a0 <_ZN6ThreadC1Ev>:
Thread::Thread (){
    800013a0:	ff010113          	addi	sp,sp,-16
    800013a4:	00813423          	sd	s0,8(sp)
    800013a8:	01010413          	addi	s0,sp,16
    800013ac:	0000d797          	auipc	a5,0xd
    800013b0:	af478793          	addi	a5,a5,-1292 # 8000dea0 <_ZTV6Thread+0x10>
    800013b4:	00f53023          	sd	a5,0(a0)
    body = &threadRun;
    800013b8:	00000797          	auipc	a5,0x0
    800013bc:	d6878793          	addi	a5,a5,-664 # 80001120 <_Z9threadRunPv>
    800013c0:	00f53823          	sd	a5,16(a0)
    arg = this;
    800013c4:	00a53c23          	sd	a0,24(a0)
}
    800013c8:	00813403          	ld	s0,8(sp)
    800013cc:	01010113          	addi	sp,sp,16
    800013d0:	00008067          	ret

00000000800013d4 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore (unsigned init){
    800013d4:	ff010113          	addi	sp,sp,-16
    800013d8:	00113423          	sd	ra,8(sp)
    800013dc:	00813023          	sd	s0,0(sp)
    800013e0:	01010413          	addi	s0,sp,16
    800013e4:	0000d797          	auipc	a5,0xd
    800013e8:	ae478793          	addi	a5,a5,-1308 # 8000dec8 <_ZTV9Semaphore+0x10>
    800013ec:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800013f0:	00850513          	addi	a0,a0,8
    800013f4:	00000097          	auipc	ra,0x0
    800013f8:	618080e7          	jalr	1560(ra) # 80001a0c <_Z8sem_openPP4_semj>
}
    800013fc:	00813083          	ld	ra,8(sp)
    80001400:	00013403          	ld	s0,0(sp)
    80001404:	01010113          	addi	sp,sp,16
    80001408:	00008067          	ret

000000008000140c <_ZN9Semaphore4waitEv>:
int Semaphore::wait (){
    8000140c:	ff010113          	addi	sp,sp,-16
    80001410:	00113423          	sd	ra,8(sp)
    80001414:	00813023          	sd	s0,0(sp)
    80001418:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    8000141c:	00853503          	ld	a0,8(a0)
    80001420:	00000097          	auipc	ra,0x0
    80001424:	650080e7          	jalr	1616(ra) # 80001a70 <_Z8sem_waitP4_sem>
}
    80001428:	00813083          	ld	ra,8(sp)
    8000142c:	00013403          	ld	s0,0(sp)
    80001430:	01010113          	addi	sp,sp,16
    80001434:	00008067          	ret

0000000080001438 <_ZN9Semaphore6signalEv>:
int Semaphore::signal (){
    80001438:	ff010113          	addi	sp,sp,-16
    8000143c:	00113423          	sd	ra,8(sp)
    80001440:	00813023          	sd	s0,0(sp)
    80001444:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80001448:	00853503          	ld	a0,8(a0)
    8000144c:	00000097          	auipc	ra,0x0
    80001450:	650080e7          	jalr	1616(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    80001454:	00813083          	ld	ra,8(sp)
    80001458:	00013403          	ld	s0,0(sp)
    8000145c:	01010113          	addi	sp,sp,16
    80001460:	00008067          	ret

0000000080001464 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate (){
    80001464:	ff010113          	addi	sp,sp,-16
    80001468:	00813423          	sd	s0,8(sp)
    8000146c:	01010413          	addi	s0,sp,16
}
    80001470:	00813403          	ld	s0,8(sp)
    80001474:	01010113          	addi	sp,sp,16
    80001478:	00008067          	ret

000000008000147c <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread (time_t period): period(period){
    8000147c:	fe010113          	addi	sp,sp,-32
    80001480:	00113c23          	sd	ra,24(sp)
    80001484:	00813823          	sd	s0,16(sp)
    80001488:	00913423          	sd	s1,8(sp)
    8000148c:	01213023          	sd	s2,0(sp)
    80001490:	02010413          	addi	s0,sp,32
    80001494:	00050493          	mv	s1,a0
    80001498:	00058913          	mv	s2,a1
    8000149c:	00000097          	auipc	ra,0x0
    800014a0:	f04080e7          	jalr	-252(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800014a4:	0000d797          	auipc	a5,0xd
    800014a8:	a4478793          	addi	a5,a5,-1468 # 8000dee8 <_ZTV14PeriodicThread+0x10>
    800014ac:	00f4b023          	sd	a5,0(s1)
    800014b0:	0324b023          	sd	s2,32(s1)
    active = true;
    800014b4:	00100793          	li	a5,1
    800014b8:	02f48423          	sb	a5,40(s1)
}
    800014bc:	01813083          	ld	ra,24(sp)
    800014c0:	01013403          	ld	s0,16(sp)
    800014c4:	00813483          	ld	s1,8(sp)
    800014c8:	00013903          	ld	s2,0(sp)
    800014cc:	02010113          	addi	sp,sp,32
    800014d0:	00008067          	ret

00000000800014d4 <_ZN7Console4putcEc>:
    }
}



void Console::putc (char c){
    800014d4:	ff010113          	addi	sp,sp,-16
    800014d8:	00113423          	sd	ra,8(sp)
    800014dc:	00813023          	sd	s0,0(sp)
    800014e0:	01010413          	addi	s0,sp,16
    putc(c);
    800014e4:	00000097          	auipc	ra,0x0
    800014e8:	ff0080e7          	jalr	-16(ra) # 800014d4 <_ZN7Console4putcEc>
}
    800014ec:	00813083          	ld	ra,8(sp)
    800014f0:	00013403          	ld	s0,0(sp)
    800014f4:	01010113          	addi	sp,sp,16
    800014f8:	00008067          	ret

00000000800014fc <_ZN7Console4getcEv>:

char Console::getc (){
    800014fc:	ff010113          	addi	sp,sp,-16
    80001500:	00113423          	sd	ra,8(sp)
    80001504:	00813023          	sd	s0,0(sp)
    80001508:	01010413          	addi	s0,sp,16
    return getc();
    8000150c:	00000097          	auipc	ra,0x0
    80001510:	ff0080e7          	jalr	-16(ra) # 800014fc <_ZN7Console4getcEv>
    80001514:	00813083          	ld	ra,8(sp)
    80001518:	00013403          	ld	s0,0(sp)
    8000151c:	01010113          	addi	sp,sp,16
    80001520:	00008067          	ret

0000000080001524 <_ZN6Thread3runEv>:
    void join();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
    80001524:	ff010113          	addi	sp,sp,-16
    80001528:	00813423          	sd	s0,8(sp)
    8000152c:	01010413          	addi	s0,sp,16
    80001530:	00813403          	ld	s0,8(sp)
    80001534:	01010113          	addi	sp,sp,16
    80001538:	00008067          	ret

000000008000153c <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate ();
protected:
    void run () override;
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    8000153c:	ff010113          	addi	sp,sp,-16
    80001540:	00813423          	sd	s0,8(sp)
    80001544:	01010413          	addi	s0,sp,16
    80001548:	00813403          	ld	s0,8(sp)
    8000154c:	01010113          	addi	sp,sp,16
    80001550:	00008067          	ret

0000000080001554 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80001554:	ff010113          	addi	sp,sp,-16
    80001558:	00113423          	sd	ra,8(sp)
    8000155c:	00813023          	sd	s0,0(sp)
    80001560:	01010413          	addi	s0,sp,16
    80001564:	0000d797          	auipc	a5,0xd
    80001568:	98478793          	addi	a5,a5,-1660 # 8000dee8 <_ZTV14PeriodicThread+0x10>
    8000156c:	00f53023          	sd	a5,0(a0)
    80001570:	00000097          	auipc	ra,0x0
    80001574:	bdc080e7          	jalr	-1060(ra) # 8000114c <_ZN6ThreadD1Ev>
    80001578:	00813083          	ld	ra,8(sp)
    8000157c:	00013403          	ld	s0,0(sp)
    80001580:	01010113          	addi	sp,sp,16
    80001584:	00008067          	ret

0000000080001588 <_ZN14PeriodicThreadD0Ev>:
    80001588:	fe010113          	addi	sp,sp,-32
    8000158c:	00113c23          	sd	ra,24(sp)
    80001590:	00813823          	sd	s0,16(sp)
    80001594:	00913423          	sd	s1,8(sp)
    80001598:	02010413          	addi	s0,sp,32
    8000159c:	00050493          	mv	s1,a0
    800015a0:	0000d797          	auipc	a5,0xd
    800015a4:	94878793          	addi	a5,a5,-1720 # 8000dee8 <_ZTV14PeriodicThread+0x10>
    800015a8:	00f53023          	sd	a5,0(a0)
    800015ac:	00000097          	auipc	ra,0x0
    800015b0:	ba0080e7          	jalr	-1120(ra) # 8000114c <_ZN6ThreadD1Ev>
    800015b4:	00048513          	mv	a0,s1
    800015b8:	00000097          	auipc	ra,0x0
    800015bc:	c2c080e7          	jalr	-980(ra) # 800011e4 <_ZdlPv>
    800015c0:	01813083          	ld	ra,24(sp)
    800015c4:	01013403          	ld	s0,16(sp)
    800015c8:	00813483          	ld	s1,8(sp)
    800015cc:	02010113          	addi	sp,sp,32
    800015d0:	00008067          	ret

00000000800015d4 <_ZN5TimerC1Ev>:

#include "consoleManager.h"

Timer* Timer::instance = 0;

Timer::Timer(){
    800015d4:	fe010113          	addi	sp,sp,-32
    800015d8:	00113c23          	sd	ra,24(sp)
    800015dc:	00813823          	sd	s0,16(sp)
    800015e0:	00913423          	sd	s1,8(sp)
    800015e4:	02010413          	addi	s0,sp,32
    800015e8:	00050493          	mv	s1,a0
    assert(instance == 0);
    800015ec:	0000d797          	auipc	a5,0xd
    800015f0:	b647b783          	ld	a5,-1180(a5) # 8000e150 <_ZN5Timer8instanceE>
    800015f4:	02079463          	bnez	a5,8000161c <_ZN5TimerC1Ev+0x48>
    instance = this;
    800015f8:	0000d797          	auipc	a5,0xd
    800015fc:	b497bc23          	sd	s1,-1192(a5) # 8000e150 <_ZN5Timer8instanceE>
    sleepingHead = 0;
    80001600:	0004b023          	sd	zero,0(s1)
    time = 0;
    80001604:	0004b423          	sd	zero,8(s1)
}
    80001608:	01813083          	ld	ra,24(sp)
    8000160c:	01013403          	ld	s0,16(sp)
    80001610:	00813483          	ld	s1,8(sp)
    80001614:	02010113          	addi	sp,sp,32
    80001618:	00008067          	ret
    assert(instance == 0);
    8000161c:	0000a697          	auipc	a3,0xa
    80001620:	a0468693          	addi	a3,a3,-1532 # 8000b020 <CONSOLE_STATUS+0x10>
    80001624:	01700613          	li	a2,23
    80001628:	0000a597          	auipc	a1,0xa
    8000162c:	a0858593          	addi	a1,a1,-1528 # 8000b030 <CONSOLE_STATUS+0x20>
    80001630:	0000a517          	auipc	a0,0xa
    80001634:	a1050513          	addi	a0,a0,-1520 # 8000b040 <CONSOLE_STATUS+0x30>
    80001638:	00001097          	auipc	ra,0x1
    8000163c:	a64080e7          	jalr	-1436(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80001640:	fb9ff06f          	j	800015f8 <_ZN5TimerC1Ev+0x24>

0000000080001644 <_ZN5TimerD1Ev>:

Timer::~Timer(){
    threadSleepWrapper* current = sleepingHead;
    80001644:	00053583          	ld	a1,0(a0)
    while(current != 0){
    80001648:	04058663          	beqz	a1,80001694 <_ZN5TimerD1Ev+0x50>
Timer::~Timer(){
    8000164c:	fe010113          	addi	sp,sp,-32
    80001650:	00113c23          	sd	ra,24(sp)
    80001654:	00813823          	sd	s0,16(sp)
    80001658:	00913423          	sd	s1,8(sp)
    8000165c:	02010413          	addi	s0,sp,32
        threadSleepWrapper* next = current->next;
    80001660:	0105b483          	ld	s1,16(a1)
        HeapManager::getInstance().heapFree(current);
    80001664:	0000d797          	auipc	a5,0xd
    80001668:	a7c7b783          	ld	a5,-1412(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000166c:	0007b503          	ld	a0,0(a5)
    80001670:	00002097          	auipc	ra,0x2
    80001674:	798080e7          	jalr	1944(ra) # 80003e08 <_ZN11HeapManager8heapFreeEPv>
        current = next;
    80001678:	00048593          	mv	a1,s1
    while(current != 0){
    8000167c:	fe0492e3          	bnez	s1,80001660 <_ZN5TimerD1Ev+0x1c>
    }
}
    80001680:	01813083          	ld	ra,24(sp)
    80001684:	01013403          	ld	s0,16(sp)
    80001688:	00813483          	ld	s1,8(sp)
    8000168c:	02010113          	addi	sp,sp,32
    80001690:	00008067          	ret
    80001694:	00008067          	ret

0000000080001698 <_ZN5Timer11getInstanceEv>:

Timer& Timer::getInstance(){
    assert(instance != 0);
    80001698:	0000d797          	auipc	a5,0xd
    8000169c:	ab87b783          	ld	a5,-1352(a5) # 8000e150 <_ZN5Timer8instanceE>
    800016a0:	00078863          	beqz	a5,800016b0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800016a4:	0000d517          	auipc	a0,0xd
    800016a8:	aac53503          	ld	a0,-1364(a0) # 8000e150 <_ZN5Timer8instanceE>
    800016ac:	00008067          	ret
Timer& Timer::getInstance(){
    800016b0:	ff010113          	addi	sp,sp,-16
    800016b4:	00113423          	sd	ra,8(sp)
    800016b8:	00813023          	sd	s0,0(sp)
    800016bc:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    800016c0:	0000a697          	auipc	a3,0xa
    800016c4:	99068693          	addi	a3,a3,-1648 # 8000b050 <CONSOLE_STATUS+0x40>
    800016c8:	02700613          	li	a2,39
    800016cc:	0000a597          	auipc	a1,0xa
    800016d0:	96458593          	addi	a1,a1,-1692 # 8000b030 <CONSOLE_STATUS+0x20>
    800016d4:	0000a517          	auipc	a0,0xa
    800016d8:	9a450513          	addi	a0,a0,-1628 # 8000b078 <CONSOLE_STATUS+0x68>
    800016dc:	00001097          	auipc	ra,0x1
    800016e0:	9c0080e7          	jalr	-1600(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
}
    800016e4:	0000d517          	auipc	a0,0xd
    800016e8:	a6c53503          	ld	a0,-1428(a0) # 8000e150 <_ZN5Timer8instanceE>
    800016ec:	00813083          	ld	ra,8(sp)
    800016f0:	00013403          	ld	s0,0(sp)
    800016f4:	01010113          	addi	sp,sp,16
    800016f8:	00008067          	ret

00000000800016fc <_ZN5Timer4tickEv>:

void Timer::tick(){
    800016fc:	fe010113          	addi	sp,sp,-32
    80001700:	00113c23          	sd	ra,24(sp)
    80001704:	00813823          	sd	s0,16(sp)
    80001708:	00913423          	sd	s1,8(sp)
    8000170c:	01213023          	sd	s2,0(sp)
    80001710:	02010413          	addi	s0,sp,32
    80001714:	00050493          	mv	s1,a0
    time += 1;
    80001718:	00853783          	ld	a5,8(a0)
    8000171c:	00178793          	addi	a5,a5,1
    80001720:	00f53423          	sd	a5,8(a0)
    while(sleepingHead != 0 && sleepingHead->wakeUpTime <= time){
    80001724:	0004b783          	ld	a5,0(s1)
    80001728:	04078a63          	beqz	a5,8000177c <_ZN5Timer4tickEv+0x80>
    8000172c:	0087b683          	ld	a3,8(a5)
    80001730:	0084b703          	ld	a4,8(s1)
    80001734:	04d76463          	bltu	a4,a3,8000177c <_ZN5Timer4tickEv+0x80>
        sleepingHead->thread->setSleeping(false);
    80001738:	00000593          	li	a1,0
    8000173c:	0007b503          	ld	a0,0(a5)
    80001740:	00002097          	auipc	ra,0x2
    80001744:	94c080e7          	jalr	-1716(ra) # 8000308c <_ZN7_thread11setSleepingEb>
        Scheduler::put(sleepingHead->thread);
    80001748:	0004b783          	ld	a5,0(s1)
    8000174c:	0007b503          	ld	a0,0(a5)
    80001750:	00004097          	auipc	ra,0x4
    80001754:	c1c080e7          	jalr	-996(ra) # 8000536c <_ZN9Scheduler3putEP7_thread>
        threadSleepWrapper* next = sleepingHead->next;
    80001758:	0004b583          	ld	a1,0(s1)
    8000175c:	0105b903          	ld	s2,16(a1)
        HeapManager::getInstance().heapFree(sleepingHead);
    80001760:	0000d797          	auipc	a5,0xd
    80001764:	9807b783          	ld	a5,-1664(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001768:	0007b503          	ld	a0,0(a5)
    8000176c:	00002097          	auipc	ra,0x2
    80001770:	69c080e7          	jalr	1692(ra) # 80003e08 <_ZN11HeapManager8heapFreeEPv>
        sleepingHead = next;
    80001774:	0124b023          	sd	s2,0(s1)
    while(sleepingHead != 0 && sleepingHead->wakeUpTime <= time){
    80001778:	fadff06f          	j	80001724 <_ZN5Timer4tickEv+0x28>
    }
}
    8000177c:	01813083          	ld	ra,24(sp)
    80001780:	01013403          	ld	s0,16(sp)
    80001784:	00813483          	ld	s1,8(sp)
    80001788:	00013903          	ld	s2,0(sp)
    8000178c:	02010113          	addi	sp,sp,32
    80001790:	00008067          	ret

0000000080001794 <_ZN5Timer5sleepEm>:

int Timer::sleep(time_t timeToSleep){
    80001794:	fd010113          	addi	sp,sp,-48
    80001798:	02113423          	sd	ra,40(sp)
    8000179c:	02813023          	sd	s0,32(sp)
    800017a0:	00913c23          	sd	s1,24(sp)
    800017a4:	01213823          	sd	s2,16(sp)
    800017a8:	01313423          	sd	s3,8(sp)
    800017ac:	03010413          	addi	s0,sp,48
    800017b0:	00050493          	mv	s1,a0
    800017b4:	00058913          	mv	s2,a1
    thread_t thread = _thread::currentThread;
    800017b8:	0000d797          	auipc	a5,0xd
    800017bc:	9487b783          	ld	a5,-1720(a5) # 8000e100 <_GLOBAL_OFFSET_TABLE_+0x48>
    800017c0:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)HeapManager::getInstance().heapAllocate(sizeof(threadSleepWrapper));
    800017c4:	01800593          	li	a1,24
    800017c8:	0000d797          	auipc	a5,0xd
    800017cc:	9187b783          	ld	a5,-1768(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017d0:	0007b503          	ld	a0,0(a5)
    800017d4:	00002097          	auipc	ra,0x2
    800017d8:	fb4080e7          	jalr	-76(ra) # 80003788 <_ZN11HeapManager12heapAllocateEm>
    newSleepingThread->thread = thread;
    800017dc:	01353023          	sd	s3,0(a0)
    newSleepingThread->wakeUpTime = time + timeToSleep;
    800017e0:	0084b783          	ld	a5,8(s1)
    800017e4:	012785b3          	add	a1,a5,s2
    800017e8:	00b53423          	sd	a1,8(a0)
    newSleepingThread->next = 0;
    800017ec:	00053823          	sd	zero,16(a0)

    if(sleepingHead == 0){
    800017f0:	0004b783          	ld	a5,0(s1)
    800017f4:	06078063          	beqz	a5,80001854 <_ZN5Timer5sleepEm+0xc0>
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
    800017f8:	00078693          	mv	a3,a5
    800017fc:	0107b783          	ld	a5,16(a5)
    80001800:	00078663          	beqz	a5,8000180c <_ZN5Timer5sleepEm+0x78>
    80001804:	0087b703          	ld	a4,8(a5)
    80001808:	feb768e3          	bltu	a4,a1,800017f8 <_ZN5Timer5sleepEm+0x64>
            current = current->next;
        }
        if(current->wakeUpTime > newSleepingThread->wakeUpTime){
    8000180c:	0086b703          	ld	a4,8(a3)
    80001810:	04e5f663          	bgeu	a1,a4,8000185c <_ZN5Timer5sleepEm+0xc8>
            sleepingHead = newSleepingThread;
    80001814:	00a4b023          	sd	a0,0(s1)
            newSleepingThread->next = current;
    80001818:	00d53823          	sd	a3,16(a0)
        }else{
            newSleepingThread->next = current->next;
            current->next = newSleepingThread;
        }
    }
    thread->setSleeping(true);
    8000181c:	00100593          	li	a1,1
    80001820:	00098513          	mv	a0,s3
    80001824:	00002097          	auipc	ra,0x2
    80001828:	868080e7          	jalr	-1944(ra) # 8000308c <_ZN7_thread11setSleepingEb>
    _thread::dispatch();
    8000182c:	00002097          	auipc	ra,0x2
    80001830:	92c080e7          	jalr	-1748(ra) # 80003158 <_ZN7_thread8dispatchEv>
    return 0;
}
    80001834:	00000513          	li	a0,0
    80001838:	02813083          	ld	ra,40(sp)
    8000183c:	02013403          	ld	s0,32(sp)
    80001840:	01813483          	ld	s1,24(sp)
    80001844:	01013903          	ld	s2,16(sp)
    80001848:	00813983          	ld	s3,8(sp)
    8000184c:	03010113          	addi	sp,sp,48
    80001850:	00008067          	ret
        sleepingHead = newSleepingThread;
    80001854:	00a4b023          	sd	a0,0(s1)
    80001858:	fc5ff06f          	j	8000181c <_ZN5Timer5sleepEm+0x88>
            newSleepingThread->next = current->next;
    8000185c:	00f53823          	sd	a5,16(a0)
            current->next = newSleepingThread;
    80001860:	00a6b823          	sd	a0,16(a3)
    80001864:	fb9ff06f          	j	8000181c <_ZN5Timer5sleepEm+0x88>

0000000080001868 <_ZN5Timer17noSleepingThreadsEv>:

bool Timer::noSleepingThreads(){
    80001868:	ff010113          	addi	sp,sp,-16
    8000186c:	00813423          	sd	s0,8(sp)
    80001870:	01010413          	addi	s0,sp,16
    return sleepingHead == 0;
    80001874:	00053503          	ld	a0,0(a0)
}
    80001878:	00153513          	seqz	a0,a0
    8000187c:	00813403          	ld	s0,8(sp)
    80001880:	01010113          	addi	sp,sp,16
    80001884:	00008067          	ret

0000000080001888 <_ZN5Timer7getTimeEv>:

time_t Timer::getTime(){
    80001888:	ff010113          	addi	sp,sp,-16
    8000188c:	00813423          	sd	s0,8(sp)
    80001890:	01010413          	addi	s0,sp,16
    return time;
    80001894:	00853503          	ld	a0,8(a0)
    80001898:	00813403          	ld	s0,8(sp)
    8000189c:	01010113          	addi	sp,sp,16
    800018a0:	00008067          	ret

00000000800018a4 <_Z9mem_allocm>:
 */

#include "syscall_c.h"
#include "consoleManager.h"

void* mem_alloc ( size_t nSize ){
    800018a4:	ff010113          	addi	sp,sp,-16
    800018a8:	00813423          	sd	s0,8(sp)
    800018ac:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    800018b0:	03f50513          	addi	a0,a0,63
    800018b4:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    800018b8:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    800018bc:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    800018c0:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    800018c4:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    800018c8:	00813403          	ld	s0,8(sp)
    800018cc:	01010113          	addi	sp,sp,16
    800018d0:	00008067          	ret

00000000800018d4 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    800018d4:	ff010113          	addi	sp,sp,-16
    800018d8:	00813423          	sd	s0,8(sp)
    800018dc:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    800018e0:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    800018e4:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    800018e8:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    800018ec:	00050513          	mv	a0,a0
    return nResult;

}
    800018f0:	0005051b          	sext.w	a0,a0
    800018f4:	00813403          	ld	s0,8(sp)
    800018f8:	01010113          	addi	sp,sp,16
    800018fc:	00008067          	ret

0000000080001900 <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg ) {
    80001900:	fd010113          	addi	sp,sp,-48
    80001904:	02113423          	sd	ra,40(sp)
    80001908:	02813023          	sd	s0,32(sp)
    8000190c:	00913c23          	sd	s1,24(sp)
    80001910:	01213823          	sd	s2,16(sp)
    80001914:	01313423          	sd	s3,8(sp)
    80001918:	03010413          	addi	s0,sp,48
    8000191c:	00050493          	mv	s1,a0
    80001920:	00058913          	mv	s2,a1
    80001924:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE * 16);
    80001928:	00010537          	lui	a0,0x10
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	f78080e7          	jalr	-136(ra) # 800018a4 <_Z9mem_allocm>
    /// now we move the pointer up, since SP points to the first free location, and grows down
    __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space + DEFAULT_STACK_SIZE));
    80001934:	000017b7          	lui	a5,0x1
    80001938:	00f50533          	add	a0,a0,a5
    8000193c:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    80001940:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    80001944:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    80001948:	00048593          	mv	a1,s1
    __asm__ volatile("li a0,0x11");
    8000194c:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    80001950:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001954:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001958:	0005051b          	sext.w	a0,a0
    8000195c:	02813083          	ld	ra,40(sp)
    80001960:	02013403          	ld	s0,32(sp)
    80001964:	01813483          	ld	s1,24(sp)
    80001968:	01013903          	ld	s2,16(sp)
    8000196c:	00813983          	ld	s3,8(sp)
    80001970:	03010113          	addi	sp,sp,48
    80001974:	00008067          	ret

0000000080001978 <_Z11thread_exitv>:

int thread_exit (){
    80001978:	ff010113          	addi	sp,sp,-16
    8000197c:	00813423          	sd	s0,8(sp)
    80001980:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    80001984:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80001988:	00000073          	ecall
    return 0;
}
    8000198c:	00000513          	li	a0,0
    80001990:	00813403          	ld	s0,8(sp)
    80001994:	01010113          	addi	sp,sp,16
    80001998:	00008067          	ret

000000008000199c <_Z15thread_dispatchv>:

void thread_dispatch () {
    8000199c:	ff010113          	addi	sp,sp,-16
    800019a0:	00813423          	sd	s0,8(sp)
    800019a4:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    800019a8:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    800019ac:	00000073          	ecall
}
    800019b0:	00813403          	ld	s0,8(sp)
    800019b4:	01010113          	addi	sp,sp,16
    800019b8:	00008067          	ret

00000000800019bc <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    800019bc:	ff010113          	addi	sp,sp,-16
    800019c0:	00813423          	sd	s0,8(sp)
    800019c4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    800019c8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    800019cc:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    800019d0:	00000073          	ecall
}
    800019d4:	00813403          	ld	s0,8(sp)
    800019d8:	01010113          	addi	sp,sp,16
    800019dc:	00008067          	ret

00000000800019e0 <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    800019e0:	ff010113          	addi	sp,sp,-16
    800019e4:	00813423          	sd	s0,8(sp)
    800019e8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    800019ec:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    800019f0:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    800019f4:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    800019f8:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800019fc:	0005051b          	sext.w	a0,a0
    80001a00:	00813403          	ld	s0,8(sp)
    80001a04:	01010113          	addi	sp,sp,16
    80001a08:	00008067          	ret

0000000080001a0c <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    80001a0c:	ff010113          	addi	sp,sp,-16
    80001a10:	00813423          	sd	s0,8(sp)
    80001a14:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    80001a18:	02059593          	slli	a1,a1,0x20
    80001a1c:	0205d593          	srli	a1,a1,0x20
    80001a20:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    80001a24:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    80001a28:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    80001a2c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001a30:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001a34:	0005051b          	sext.w	a0,a0
    80001a38:	00813403          	ld	s0,8(sp)
    80001a3c:	01010113          	addi	sp,sp,16
    80001a40:	00008067          	ret

0000000080001a44 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    80001a44:	ff010113          	addi	sp,sp,-16
    80001a48:	00813423          	sd	s0,8(sp)
    80001a4c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001a50:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    80001a54:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    80001a58:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001a5c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001a60:	0005051b          	sext.w	a0,a0
    80001a64:	00813403          	ld	s0,8(sp)
    80001a68:	01010113          	addi	sp,sp,16
    80001a6c:	00008067          	ret

0000000080001a70 <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    80001a70:	ff010113          	addi	sp,sp,-16
    80001a74:	00813423          	sd	s0,8(sp)
    80001a78:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001a7c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    80001a80:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001a84:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001a88:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001a8c:	0005051b          	sext.w	a0,a0
    80001a90:	00813403          	ld	s0,8(sp)
    80001a94:	01010113          	addi	sp,sp,16
    80001a98:	00008067          	ret

0000000080001a9c <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    80001a9c:	ff010113          	addi	sp,sp,-16
    80001aa0:	00813423          	sd	s0,8(sp)
    80001aa4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001aa8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    80001aac:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    80001ab0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001ab4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001ab8:	0005051b          	sext.w	a0,a0
    80001abc:	00813403          	ld	s0,8(sp)
    80001ac0:	01010113          	addi	sp,sp,16
    80001ac4:	00008067          	ret

0000000080001ac8 <_Z4getcv>:

char getc() {
    80001ac8:	ff010113          	addi	sp,sp,-16
    80001acc:	00813423          	sd	s0,8(sp)
    80001ad0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    80001ad4:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    80001ad8:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    80001adc:	00050513          	mv	a0,a0
    return chr;
}
    80001ae0:	0ff57513          	andi	a0,a0,255
    80001ae4:	00813403          	ld	s0,8(sp)
    80001ae8:	01010113          	addi	sp,sp,16
    80001aec:	00008067          	ret

0000000080001af0 <_Z4putcc>:

#include "consoleManager.h"

void putc(char chr ) {
    80001af0:	ff010113          	addi	sp,sp,-16
    80001af4:	00813423          	sd	s0,8(sp)
    80001af8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    80001afc:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    80001b00:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80001b04:	00000073          	ecall
    80001b08:	00813403          	ld	s0,8(sp)
    80001b0c:	01010113          	addi	sp,sp,16
    80001b10:	00008067          	ret

0000000080001b14 <_ZN4_sem4openEPPS_j>:
#include "sched.h"
#include "heapManager.h"
#include "thread.h"
#include "consoleManager.h"

void _sem::open(_sem** handle, unsigned init){
    80001b14:	fe010113          	addi	sp,sp,-32
    80001b18:	00113c23          	sd	ra,24(sp)
    80001b1c:	00813823          	sd	s0,16(sp)
    80001b20:	00913423          	sd	s1,8(sp)
    80001b24:	01213023          	sd	s2,0(sp)
    80001b28:	02010413          	addi	s0,sp,32
    80001b2c:	00050493          	mv	s1,a0
    80001b30:	00058913          	mv	s2,a1
    (*handle) = (sem_t)HeapManager::getInstance().heapAllocate((sizeof(_sem) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80001b34:	00100593          	li	a1,1
    80001b38:	0000c797          	auipc	a5,0xc
    80001b3c:	5a87b783          	ld	a5,1448(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001b40:	0007b503          	ld	a0,0(a5)
    80001b44:	00002097          	auipc	ra,0x2
    80001b48:	c44080e7          	jalr	-956(ra) # 80003788 <_ZN11HeapManager12heapAllocateEm>
    80001b4c:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    80001b50:	00053023          	sd	zero,0(a0) # 10000 <_entry-0x7fff0000>
    (*handle)->blockTail = 0;
    80001b54:	0004b783          	ld	a5,0(s1)
    80001b58:	0007b423          	sd	zero,8(a5)
    (*handle)->value = init;
    80001b5c:	0004b783          	ld	a5,0(s1)
    80001b60:	0127a823          	sw	s2,16(a5)
}
    80001b64:	01813083          	ld	ra,24(sp)
    80001b68:	01013403          	ld	s0,16(sp)
    80001b6c:	00813483          	ld	s1,8(sp)
    80001b70:	00013903          	ld	s2,0(sp)
    80001b74:	02010113          	addi	sp,sp,32
    80001b78:	00008067          	ret

0000000080001b7c <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    80001b7c:	fe010113          	addi	sp,sp,-32
    80001b80:	00113c23          	sd	ra,24(sp)
    80001b84:	00813823          	sd	s0,16(sp)
    80001b88:	00913423          	sd	s1,8(sp)
    80001b8c:	02010413          	addi	s0,sp,32
    80001b90:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    80001b94:	0004b783          	ld	a5,0(s1)
    80001b98:	02078e63          	beqz	a5,80001bd4 <_ZN4_sem5closeEPS_+0x58>
        id->blockHead->pThread->setClosed(true);
    80001b9c:	00100593          	li	a1,1
    80001ba0:	0007b503          	ld	a0,0(a5)
    80001ba4:	00001097          	auipc	ra,0x1
    80001ba8:	4bc080e7          	jalr	1212(ra) # 80003060 <_ZN7_thread9setClosedEb>
        HeapManager::getInstance().heapFree(id->blockHead);
    80001bac:	0004b583          	ld	a1,0(s1)
    80001bb0:	0000c797          	auipc	a5,0xc
    80001bb4:	5307b783          	ld	a5,1328(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001bb8:	0007b503          	ld	a0,0(a5)
    80001bbc:	00002097          	auipc	ra,0x2
    80001bc0:	24c080e7          	jalr	588(ra) # 80003e08 <_ZN11HeapManager8heapFreeEPv>
        id->blockHead = id->blockHead->pNext;
    80001bc4:	0004b783          	ld	a5,0(s1)
    80001bc8:	0087b783          	ld	a5,8(a5)
    80001bcc:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    80001bd0:	fc5ff06f          	j	80001b94 <_ZN4_sem5closeEPS_+0x18>
    }
}
    80001bd4:	01813083          	ld	ra,24(sp)
    80001bd8:	01013403          	ld	s0,16(sp)
    80001bdc:	00813483          	ld	s1,8(sp)
    80001be0:	02010113          	addi	sp,sp,32
    80001be4:	00008067          	ret

0000000080001be8 <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    80001be8:	01052783          	lw	a5,16(a0)
    80001bec:	fff7879b          	addiw	a5,a5,-1
    80001bf0:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    80001bf4:	02079713          	slli	a4,a5,0x20
    80001bf8:	00074463          	bltz	a4,80001c00 <_ZN4_sem4waitEPS_+0x18>
    80001bfc:	00008067          	ret
void _sem::wait(sem_t id){
    80001c00:	fe010113          	addi	sp,sp,-32
    80001c04:	00113c23          	sd	ra,24(sp)
    80001c08:	00813823          	sd	s0,16(sp)
    80001c0c:	00913423          	sd	s1,8(sp)
    80001c10:	02010413          	addi	s0,sp,32
    80001c14:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)HeapManager::getInstance().heapAllocate((sizeof(blockedThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80001c18:	00100593          	li	a1,1
    80001c1c:	0000c797          	auipc	a5,0xc
    80001c20:	4c47b783          	ld	a5,1220(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c24:	0007b503          	ld	a0,0(a5)
    80001c28:	00002097          	auipc	ra,0x2
    80001c2c:	b60080e7          	jalr	-1184(ra) # 80003788 <_ZN11HeapManager12heapAllocateEm>
        pNewBlock->pThread = _thread::currentThread;
    80001c30:	0000c797          	auipc	a5,0xc
    80001c34:	4d07b783          	ld	a5,1232(a5) # 8000e100 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001c38:	0007b783          	ld	a5,0(a5)
    80001c3c:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    80001c40:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    80001c44:	0004b783          	ld	a5,0(s1)
    80001c48:	04078263          	beqz	a5,80001c8c <_ZN4_sem4waitEPS_+0xa4>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    80001c4c:	0084b783          	ld	a5,8(s1)
    80001c50:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    80001c54:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    80001c58:	00100593          	li	a1,1
    80001c5c:	0000c797          	auipc	a5,0xc
    80001c60:	4a47b783          	ld	a5,1188(a5) # 8000e100 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001c64:	0007b503          	ld	a0,0(a5)
    80001c68:	00001097          	auipc	ra,0x1
    80001c6c:	3c8080e7          	jalr	968(ra) # 80003030 <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    80001c70:	00001097          	auipc	ra,0x1
    80001c74:	4e8080e7          	jalr	1256(ra) # 80003158 <_ZN7_thread8dispatchEv>
    }
}
    80001c78:	01813083          	ld	ra,24(sp)
    80001c7c:	01013403          	ld	s0,16(sp)
    80001c80:	00813483          	ld	s1,8(sp)
    80001c84:	02010113          	addi	sp,sp,32
    80001c88:	00008067          	ret
            id->blockHead = pNewBlock;
    80001c8c:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    80001c90:	00a4b423          	sd	a0,8(s1)
    80001c94:	fc5ff06f          	j	80001c58 <_ZN4_sem4waitEPS_+0x70>

0000000080001c98 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    80001c98:	01052783          	lw	a5,16(a0)
    80001c9c:	0017879b          	addiw	a5,a5,1
    80001ca0:	0007871b          	sext.w	a4,a5
    80001ca4:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    80001ca8:	00e05463          	blez	a4,80001cb0 <_ZN4_sem6signalEPS_+0x18>
    80001cac:	00008067          	ret
void _sem::signal(sem_t id){
    80001cb0:	fe010113          	addi	sp,sp,-32
    80001cb4:	00113c23          	sd	ra,24(sp)
    80001cb8:	00813823          	sd	s0,16(sp)
    80001cbc:	00913423          	sd	s1,8(sp)
    80001cc0:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    80001cc4:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    80001cc8:	0084b783          	ld	a5,8(s1)
    80001ccc:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    80001cd0:	04078663          	beqz	a5,80001d1c <_ZN4_sem6signalEPS_+0x84>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    80001cd4:	00000593          	li	a1,0
    80001cd8:	0004b503          	ld	a0,0(s1)
    80001cdc:	00001097          	auipc	ra,0x1
    80001ce0:	354080e7          	jalr	852(ra) # 80003030 <_ZN7_thread10setBlockedEb>
        HeapManager::getInstance().heapFree(pUnblock);
    80001ce4:	00048593          	mv	a1,s1
    80001ce8:	0000c797          	auipc	a5,0xc
    80001cec:	3f87b783          	ld	a5,1016(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001cf0:	0007b503          	ld	a0,0(a5)
    80001cf4:	00002097          	auipc	ra,0x2
    80001cf8:	114080e7          	jalr	276(ra) # 80003e08 <_ZN11HeapManager8heapFreeEPv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    80001cfc:	0004b503          	ld	a0,0(s1)
    80001d00:	00003097          	auipc	ra,0x3
    80001d04:	66c080e7          	jalr	1644(ra) # 8000536c <_ZN9Scheduler3putEP7_thread>
    }
    80001d08:	01813083          	ld	ra,24(sp)
    80001d0c:	01013403          	ld	s0,16(sp)
    80001d10:	00813483          	ld	s1,8(sp)
    80001d14:	02010113          	addi	sp,sp,32
    80001d18:	00008067          	ret
            id->blockTail = 0;
    80001d1c:	00053423          	sd	zero,8(a0)
    80001d20:	fb5ff06f          	j	80001cd4 <_ZN4_sem6signalEPS_+0x3c>

0000000080001d24 <main>:
#include "assert.h"
#include "syscall_c.h"
#include "consoleManager.h"

/// @brief first function to be called
void main(){
    80001d24:	b7010113          	addi	sp,sp,-1168
    80001d28:	48113423          	sd	ra,1160(sp)
    80001d2c:	48813023          	sd	s0,1152(sp)
    80001d30:	46913c23          	sd	s1,1144(sp)
    80001d34:	49010413          	addi	s0,sp,1168
    Kernel kernel = Kernel();
    80001d38:	b7040493          	addi	s1,s0,-1168
    80001d3c:	00048513          	mv	a0,s1
    80001d40:	00000097          	auipc	ra,0x0
    80001d44:	6d8080e7          	jalr	1752(ra) # 80002418 <_ZN6KernelC1Ev>
    kernel.initialise();
    80001d48:	00048513          	mv	a0,s1
    80001d4c:	00000097          	auipc	ra,0x0
    80001d50:	770080e7          	jalr	1904(ra) # 800024bc <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    80001d54:	00048513          	mv	a0,s1
    80001d58:	00000097          	auipc	ra,0x0
    80001d5c:	7c0080e7          	jalr	1984(ra) # 80002518 <_ZN6Kernel3runEv>
    80001d60:	00050493          	mv	s1,a0
    putc('\n');
    80001d64:	00a00513          	li	a0,10
    80001d68:	00000097          	auipc	ra,0x0
    80001d6c:	d88080e7          	jalr	-632(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001d70:	02d00513          	li	a0,45
    80001d74:	00000097          	auipc	ra,0x0
    80001d78:	d7c080e7          	jalr	-644(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001d7c:	02d00513          	li	a0,45
    80001d80:	00000097          	auipc	ra,0x0
    80001d84:	d70080e7          	jalr	-656(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001d88:	02d00513          	li	a0,45
    80001d8c:	00000097          	auipc	ra,0x0
    80001d90:	d64080e7          	jalr	-668(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001d94:	02d00513          	li	a0,45
    80001d98:	00000097          	auipc	ra,0x0
    80001d9c:	d58080e7          	jalr	-680(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001da0:	02d00513          	li	a0,45
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	d4c080e7          	jalr	-692(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001dac:	02d00513          	li	a0,45
    80001db0:	00000097          	auipc	ra,0x0
    80001db4:	d40080e7          	jalr	-704(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001db8:	02d00513          	li	a0,45
    80001dbc:	00000097          	auipc	ra,0x0
    80001dc0:	d34080e7          	jalr	-716(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001dc4:	02d00513          	li	a0,45
    80001dc8:	00000097          	auipc	ra,0x0
    80001dcc:	d28080e7          	jalr	-728(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001dd0:	02d00513          	li	a0,45
    80001dd4:	00000097          	auipc	ra,0x0
    80001dd8:	d1c080e7          	jalr	-740(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001ddc:	02d00513          	li	a0,45
    80001de0:	00000097          	auipc	ra,0x0
    80001de4:	d10080e7          	jalr	-752(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001de8:	02d00513          	li	a0,45
    80001dec:	00000097          	auipc	ra,0x0
    80001df0:	d04080e7          	jalr	-764(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001df4:	02d00513          	li	a0,45
    80001df8:	00000097          	auipc	ra,0x0
    80001dfc:	cf8080e7          	jalr	-776(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001e00:	02d00513          	li	a0,45
    80001e04:	00000097          	auipc	ra,0x0
    80001e08:	cec080e7          	jalr	-788(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001e0c:	02d00513          	li	a0,45
    80001e10:	00000097          	auipc	ra,0x0
    80001e14:	ce0080e7          	jalr	-800(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001e18:	02d00513          	li	a0,45
    80001e1c:	00000097          	auipc	ra,0x0
    80001e20:	cd4080e7          	jalr	-812(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001e24:	02d00513          	li	a0,45
    80001e28:	00000097          	auipc	ra,0x0
    80001e2c:	cc8080e7          	jalr	-824(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001e30:	02d00513          	li	a0,45
    80001e34:	00000097          	auipc	ra,0x0
    80001e38:	cbc080e7          	jalr	-836(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001e3c:	02d00513          	li	a0,45
    80001e40:	00000097          	auipc	ra,0x0
    80001e44:	cb0080e7          	jalr	-848(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001e48:	02d00513          	li	a0,45
    80001e4c:	00000097          	auipc	ra,0x0
    80001e50:	ca4080e7          	jalr	-860(ra) # 80001af0 <_Z4putcc>
    putc('-');
    80001e54:	02d00513          	li	a0,45
    80001e58:	00000097          	auipc	ra,0x0
    80001e5c:	c98080e7          	jalr	-872(ra) # 80001af0 <_Z4putcc>
    putc('\n');
    80001e60:	00a00513          	li	a0,10
    80001e64:	00000097          	auipc	ra,0x0
    80001e68:	c8c080e7          	jalr	-884(ra) # 80001af0 <_Z4putcc>
    putc('\n');
    80001e6c:	00a00513          	li	a0,10
    80001e70:	00000097          	auipc	ra,0x0
    80001e74:	c80080e7          	jalr	-896(ra) # 80001af0 <_Z4putcc>
    putc('K');
    80001e78:	04b00513          	li	a0,75
    80001e7c:	00000097          	auipc	ra,0x0
    80001e80:	c74080e7          	jalr	-908(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80001e84:	06500513          	li	a0,101
    80001e88:	00000097          	auipc	ra,0x0
    80001e8c:	c68080e7          	jalr	-920(ra) # 80001af0 <_Z4putcc>
    putc('r');
    80001e90:	07200513          	li	a0,114
    80001e94:	00000097          	auipc	ra,0x0
    80001e98:	c5c080e7          	jalr	-932(ra) # 80001af0 <_Z4putcc>
    putc('n');
    80001e9c:	06e00513          	li	a0,110
    80001ea0:	00000097          	auipc	ra,0x0
    80001ea4:	c50080e7          	jalr	-944(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80001ea8:	06500513          	li	a0,101
    80001eac:	00000097          	auipc	ra,0x0
    80001eb0:	c44080e7          	jalr	-956(ra) # 80001af0 <_Z4putcc>
    putc('l');
    80001eb4:	06c00513          	li	a0,108
    80001eb8:	00000097          	auipc	ra,0x0
    80001ebc:	c38080e7          	jalr	-968(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    80001ec0:	02000513          	li	a0,32
    80001ec4:	00000097          	auipc	ra,0x0
    80001ec8:	c2c080e7          	jalr	-980(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80001ecc:	06500513          	li	a0,101
    80001ed0:	00000097          	auipc	ra,0x0
    80001ed4:	c20080e7          	jalr	-992(ra) # 80001af0 <_Z4putcc>
    putc('x');
    80001ed8:	07800513          	li	a0,120
    80001edc:	00000097          	auipc	ra,0x0
    80001ee0:	c14080e7          	jalr	-1004(ra) # 80001af0 <_Z4putcc>
    putc('i');
    80001ee4:	06900513          	li	a0,105
    80001ee8:	00000097          	auipc	ra,0x0
    80001eec:	c08080e7          	jalr	-1016(ra) # 80001af0 <_Z4putcc>
    putc('t');
    80001ef0:	07400513          	li	a0,116
    80001ef4:	00000097          	auipc	ra,0x0
    80001ef8:	bfc080e7          	jalr	-1028(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80001efc:	06500513          	li	a0,101
    80001f00:	00000097          	auipc	ra,0x0
    80001f04:	bf0080e7          	jalr	-1040(ra) # 80001af0 <_Z4putcc>
    putc('d');
    80001f08:	06400513          	li	a0,100
    80001f0c:	00000097          	auipc	ra,0x0
    80001f10:	be4080e7          	jalr	-1052(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    80001f14:	02000513          	li	a0,32
    80001f18:	00000097          	auipc	ra,0x0
    80001f1c:	bd8080e7          	jalr	-1064(ra) # 80001af0 <_Z4putcc>
    putc('w');
    80001f20:	07700513          	li	a0,119
    80001f24:	00000097          	auipc	ra,0x0
    80001f28:	bcc080e7          	jalr	-1076(ra) # 80001af0 <_Z4putcc>
    putc('i');
    80001f2c:	06900513          	li	a0,105
    80001f30:	00000097          	auipc	ra,0x0
    80001f34:	bc0080e7          	jalr	-1088(ra) # 80001af0 <_Z4putcc>
    putc('t');
    80001f38:	07400513          	li	a0,116
    80001f3c:	00000097          	auipc	ra,0x0
    80001f40:	bb4080e7          	jalr	-1100(ra) # 80001af0 <_Z4putcc>
    putc('h');
    80001f44:	06800513          	li	a0,104
    80001f48:	00000097          	auipc	ra,0x0
    80001f4c:	ba8080e7          	jalr	-1112(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    80001f50:	02000513          	li	a0,32
    80001f54:	00000097          	auipc	ra,0x0
    80001f58:	b9c080e7          	jalr	-1124(ra) # 80001af0 <_Z4putcc>
    putc('c');
    80001f5c:	06300513          	li	a0,99
    80001f60:	00000097          	auipc	ra,0x0
    80001f64:	b90080e7          	jalr	-1136(ra) # 80001af0 <_Z4putcc>
    putc('o');
    80001f68:	06f00513          	li	a0,111
    80001f6c:	00000097          	auipc	ra,0x0
    80001f70:	b84080e7          	jalr	-1148(ra) # 80001af0 <_Z4putcc>
    putc('d');
    80001f74:	06400513          	li	a0,100
    80001f78:	00000097          	auipc	ra,0x0
    80001f7c:	b78080e7          	jalr	-1160(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80001f80:	06500513          	li	a0,101
    80001f84:	00000097          	auipc	ra,0x0
    80001f88:	b6c080e7          	jalr	-1172(ra) # 80001af0 <_Z4putcc>
    putc(':');
    80001f8c:	03a00513          	li	a0,58
    80001f90:	00000097          	auipc	ra,0x0
    80001f94:	b60080e7          	jalr	-1184(ra) # 80001af0 <_Z4putcc>
    switch(exitCode){
    80001f98:	00048e63          	beqz	s1,80001fb4 <main+0x290>
    80001f9c:	00100793          	li	a5,1
    80001fa0:	02f48263          	beq	s1,a5,80001fc4 <main+0x2a0>
            break;
        case Kernel::EXIT_FAILURE:
            putc('1');
            break;
        default:
            putc('2');
    80001fa4:	03200513          	li	a0,50
    80001fa8:	00000097          	auipc	ra,0x0
    80001fac:	b48080e7          	jalr	-1208(ra) # 80001af0 <_Z4putcc>
    80001fb0:	0200006f          	j	80001fd0 <main+0x2ac>
            putc('0');
    80001fb4:	03000513          	li	a0,48
    80001fb8:	00000097          	auipc	ra,0x0
    80001fbc:	b38080e7          	jalr	-1224(ra) # 80001af0 <_Z4putcc>
    80001fc0:	0100006f          	j	80001fd0 <main+0x2ac>
            putc('1');
    80001fc4:	03100513          	li	a0,49
    80001fc8:	00000097          	auipc	ra,0x0
    80001fcc:	b28080e7          	jalr	-1240(ra) # 80001af0 <_Z4putcc>
            break;
    }
    putc('\n');
    80001fd0:	00a00513          	li	a0,10
    80001fd4:	00000097          	auipc	ra,0x0
    80001fd8:	b1c080e7          	jalr	-1252(ra) # 80001af0 <_Z4putcc>
    ConsoleManager::outputHandler();
    80001fdc:	00003097          	auipc	ra,0x3
    80001fe0:	bd8080e7          	jalr	-1064(ra) # 80004bb4 <_ZN14ConsoleManager13outputHandlerEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001fe4:	02049263          	bnez	s1,80002008 <main+0x2e4>
    Kernel kernel = Kernel();
    80001fe8:	b7040513          	addi	a0,s0,-1168
    80001fec:	00000097          	auipc	ra,0x0
    80001ff0:	060080e7          	jalr	96(ra) # 8000204c <_ZN6KernelD1Ev>
    80001ff4:	48813083          	ld	ra,1160(sp)
    80001ff8:	48013403          	ld	s0,1152(sp)
    80001ffc:	47813483          	ld	s1,1144(sp)
    80002000:	49010113          	addi	sp,sp,1168
    80002004:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80002008:	00009697          	auipc	a3,0x9
    8000200c:	08068693          	addi	a3,a3,128 # 8000b088 <CONSOLE_STATUS+0x78>
    80002010:	05200613          	li	a2,82
    80002014:	00009597          	auipc	a1,0x9
    80002018:	08458593          	addi	a1,a1,132 # 8000b098 <CONSOLE_STATUS+0x88>
    8000201c:	00009517          	auipc	a0,0x9
    80002020:	08c50513          	addi	a0,a0,140 # 8000b0a8 <CONSOLE_STATUS+0x98>
    80002024:	00000097          	auipc	ra,0x0
    80002028:	078080e7          	jalr	120(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    8000202c:	fbdff06f          	j	80001fe8 <main+0x2c4>
    80002030:	00050493          	mv	s1,a0
    Kernel kernel = Kernel();
    80002034:	b7040513          	addi	a0,s0,-1168
    80002038:	00000097          	auipc	ra,0x0
    8000203c:	014080e7          	jalr	20(ra) # 8000204c <_ZN6KernelD1Ev>
    80002040:	00048513          	mv	a0,s1
    80002044:	0000d097          	auipc	ra,0xd
    80002048:	264080e7          	jalr	612(ra) # 8000f2a8 <_Unwind_Resume>

000000008000204c <_ZN6KernelD1Ev>:
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    8000204c:	fe010113          	addi	sp,sp,-32
    80002050:	00113c23          	sd	ra,24(sp)
    80002054:	00813823          	sd	s0,16(sp)
    80002058:	00913423          	sd	s1,8(sp)
    8000205c:	02010413          	addi	s0,sp,32
    80002060:	00050493          	mv	s1,a0
    80002064:	02850513          	addi	a0,a0,40
    80002068:	00003097          	auipc	ra,0x3
    8000206c:	8c4080e7          	jalr	-1852(ra) # 8000492c <_ZN14ConsoleManagerD1Ev>
    80002070:	01848513          	addi	a0,s1,24
    80002074:	fffff097          	auipc	ra,0xfffff
    80002078:	5d0080e7          	jalr	1488(ra) # 80001644 <_ZN5TimerD1Ev>
    8000207c:	00048513          	mv	a0,s1
    80002080:	00001097          	auipc	ra,0x1
    80002084:	474080e7          	jalr	1140(ra) # 800034f4 <_ZN11HeapManagerD1Ev>
    80002088:	01813083          	ld	ra,24(sp)
    8000208c:	01013403          	ld	s0,16(sp)
    80002090:	00813483          	ld	s1,8(sp)
    80002094:	02010113          	addi	sp,sp,32
    80002098:	00008067          	ret

000000008000209c <_Z13assert_failedPKcS0_jS0_>:
 */
#include "assert.h"
#include "syscall_c.h"
#include "consoleManager.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    8000209c:	fb010113          	addi	sp,sp,-80
    800020a0:	04113423          	sd	ra,72(sp)
    800020a4:	04813023          	sd	s0,64(sp)
    800020a8:	02913c23          	sd	s1,56(sp)
    800020ac:	03213823          	sd	s2,48(sp)
    800020b0:	03313423          	sd	s3,40(sp)
    800020b4:	03413023          	sd	s4,32(sp)
    800020b8:	05010413          	addi	s0,sp,80
    800020bc:	00050993          	mv	s3,a0
    800020c0:	00058493          	mv	s1,a1
    800020c4:	00060913          	mv	s2,a2
    800020c8:	00068a13          	mv	s4,a3
    putc('\n');
    800020cc:	00a00513          	li	a0,10
    800020d0:	00000097          	auipc	ra,0x0
    800020d4:	a20080e7          	jalr	-1504(ra) # 80001af0 <_Z4putcc>
    putc('A');
    800020d8:	04100513          	li	a0,65
    800020dc:	00000097          	auipc	ra,0x0
    800020e0:	a14080e7          	jalr	-1516(ra) # 80001af0 <_Z4putcc>
    putc('s');
    800020e4:	07300513          	li	a0,115
    800020e8:	00000097          	auipc	ra,0x0
    800020ec:	a08080e7          	jalr	-1528(ra) # 80001af0 <_Z4putcc>
    putc('s');
    800020f0:	07300513          	li	a0,115
    800020f4:	00000097          	auipc	ra,0x0
    800020f8:	9fc080e7          	jalr	-1540(ra) # 80001af0 <_Z4putcc>
    putc('e');
    800020fc:	06500513          	li	a0,101
    80002100:	00000097          	auipc	ra,0x0
    80002104:	9f0080e7          	jalr	-1552(ra) # 80001af0 <_Z4putcc>
    putc('r');
    80002108:	07200513          	li	a0,114
    8000210c:	00000097          	auipc	ra,0x0
    80002110:	9e4080e7          	jalr	-1564(ra) # 80001af0 <_Z4putcc>
    putc('t');
    80002114:	07400513          	li	a0,116
    80002118:	00000097          	auipc	ra,0x0
    8000211c:	9d8080e7          	jalr	-1576(ra) # 80001af0 <_Z4putcc>
    putc('i');
    80002120:	06900513          	li	a0,105
    80002124:	00000097          	auipc	ra,0x0
    80002128:	9cc080e7          	jalr	-1588(ra) # 80001af0 <_Z4putcc>
    putc('o');
    8000212c:	06f00513          	li	a0,111
    80002130:	00000097          	auipc	ra,0x0
    80002134:	9c0080e7          	jalr	-1600(ra) # 80001af0 <_Z4putcc>
    putc('n');
    80002138:	06e00513          	li	a0,110
    8000213c:	00000097          	auipc	ra,0x0
    80002140:	9b4080e7          	jalr	-1612(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    80002144:	02000513          	li	a0,32
    80002148:	00000097          	auipc	ra,0x0
    8000214c:	9a8080e7          	jalr	-1624(ra) # 80001af0 <_Z4putcc>
    putc('\'');
    80002150:	02700513          	li	a0,39
    80002154:	00000097          	auipc	ra,0x0
    80002158:	99c080e7          	jalr	-1636(ra) # 80001af0 <_Z4putcc>
    while(*__assertion != 0){
    8000215c:	0009c503          	lbu	a0,0(s3)
    80002160:	00050a63          	beqz	a0,80002174 <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    80002164:	00000097          	auipc	ra,0x0
    80002168:	98c080e7          	jalr	-1652(ra) # 80001af0 <_Z4putcc>
        __assertion++;
    8000216c:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    80002170:	fedff06f          	j	8000215c <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    80002174:	02700513          	li	a0,39
    80002178:	00000097          	auipc	ra,0x0
    8000217c:	978080e7          	jalr	-1672(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    80002180:	02000513          	li	a0,32
    80002184:	00000097          	auipc	ra,0x0
    80002188:	96c080e7          	jalr	-1684(ra) # 80001af0 <_Z4putcc>
    putc('f');
    8000218c:	06600513          	li	a0,102
    80002190:	00000097          	auipc	ra,0x0
    80002194:	960080e7          	jalr	-1696(ra) # 80001af0 <_Z4putcc>
    putc('a');
    80002198:	06100513          	li	a0,97
    8000219c:	00000097          	auipc	ra,0x0
    800021a0:	954080e7          	jalr	-1708(ra) # 80001af0 <_Z4putcc>
    putc('i');
    800021a4:	06900513          	li	a0,105
    800021a8:	00000097          	auipc	ra,0x0
    800021ac:	948080e7          	jalr	-1720(ra) # 80001af0 <_Z4putcc>
    putc('l');
    800021b0:	06c00513          	li	a0,108
    800021b4:	00000097          	auipc	ra,0x0
    800021b8:	93c080e7          	jalr	-1732(ra) # 80001af0 <_Z4putcc>
    putc('e');
    800021bc:	06500513          	li	a0,101
    800021c0:	00000097          	auipc	ra,0x0
    800021c4:	930080e7          	jalr	-1744(ra) # 80001af0 <_Z4putcc>
    putc('d');
    800021c8:	06400513          	li	a0,100
    800021cc:	00000097          	auipc	ra,0x0
    800021d0:	924080e7          	jalr	-1756(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    800021d4:	02000513          	li	a0,32
    800021d8:	00000097          	auipc	ra,0x0
    800021dc:	918080e7          	jalr	-1768(ra) # 80001af0 <_Z4putcc>
    putc('i');
    800021e0:	06900513          	li	a0,105
    800021e4:	00000097          	auipc	ra,0x0
    800021e8:	90c080e7          	jalr	-1780(ra) # 80001af0 <_Z4putcc>
    putc('n');
    800021ec:	06e00513          	li	a0,110
    800021f0:	00000097          	auipc	ra,0x0
    800021f4:	900080e7          	jalr	-1792(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    800021f8:	02000513          	li	a0,32
    800021fc:	00000097          	auipc	ra,0x0
    80002200:	8f4080e7          	jalr	-1804(ra) # 80001af0 <_Z4putcc>
    putc('f');
    80002204:	06600513          	li	a0,102
    80002208:	00000097          	auipc	ra,0x0
    8000220c:	8e8080e7          	jalr	-1816(ra) # 80001af0 <_Z4putcc>
    putc('i');
    80002210:	06900513          	li	a0,105
    80002214:	00000097          	auipc	ra,0x0
    80002218:	8dc080e7          	jalr	-1828(ra) # 80001af0 <_Z4putcc>
    putc('l');
    8000221c:	06c00513          	li	a0,108
    80002220:	00000097          	auipc	ra,0x0
    80002224:	8d0080e7          	jalr	-1840(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002228:	06500513          	li	a0,101
    8000222c:	00000097          	auipc	ra,0x0
    80002230:	8c4080e7          	jalr	-1852(ra) # 80001af0 <_Z4putcc>
    putc(':');
    80002234:	03a00513          	li	a0,58
    80002238:	00000097          	auipc	ra,0x0
    8000223c:	8b8080e7          	jalr	-1864(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    80002240:	02000513          	li	a0,32
    80002244:	00000097          	auipc	ra,0x0
    80002248:	8ac080e7          	jalr	-1876(ra) # 80001af0 <_Z4putcc>
    while(*__file != 0){
    8000224c:	0004c503          	lbu	a0,0(s1)
    80002250:	00050a63          	beqz	a0,80002264 <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    80002254:	00000097          	auipc	ra,0x0
    80002258:	89c080e7          	jalr	-1892(ra) # 80001af0 <_Z4putcc>
        __file++;
    8000225c:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80002260:	fedff06f          	j	8000224c <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    80002264:	00a00513          	li	a0,10
    80002268:	00000097          	auipc	ra,0x0
    8000226c:	888080e7          	jalr	-1912(ra) # 80001af0 <_Z4putcc>
    putc('l');
    80002270:	06c00513          	li	a0,108
    80002274:	00000097          	auipc	ra,0x0
    80002278:	87c080e7          	jalr	-1924(ra) # 80001af0 <_Z4putcc>
    putc('i');
    8000227c:	06900513          	li	a0,105
    80002280:	00000097          	auipc	ra,0x0
    80002284:	870080e7          	jalr	-1936(ra) # 80001af0 <_Z4putcc>
    putc('n');
    80002288:	06e00513          	li	a0,110
    8000228c:	00000097          	auipc	ra,0x0
    80002290:	864080e7          	jalr	-1948(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002294:	06500513          	li	a0,101
    80002298:	00000097          	auipc	ra,0x0
    8000229c:	858080e7          	jalr	-1960(ra) # 80001af0 <_Z4putcc>
    putc(':');
    800022a0:	03a00513          	li	a0,58
    800022a4:	00000097          	auipc	ra,0x0
    800022a8:	84c080e7          	jalr	-1972(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    800022ac:	02000513          	li	a0,32
    800022b0:	00000097          	auipc	ra,0x0
    800022b4:	840080e7          	jalr	-1984(ra) # 80001af0 <_Z4putcc>
    char buffer[20];
    int i = 0;
    800022b8:	00000493          	li	s1,0
    while(__line != 0){
    800022bc:	02090463          	beqz	s2,800022e4 <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    800022c0:	00a00713          	li	a4,10
    800022c4:	02e977bb          	remuw	a5,s2,a4
    800022c8:	0307879b          	addiw	a5,a5,48
    800022cc:	fd040693          	addi	a3,s0,-48
    800022d0:	009686b3          	add	a3,a3,s1
    800022d4:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    800022d8:	02e9593b          	divuw	s2,s2,a4
        i++;
    800022dc:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    800022e0:	fddff06f          	j	800022bc <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    800022e4:	02048063          	beqz	s1,80002304 <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    800022e8:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    800022ec:	fd040793          	addi	a5,s0,-48
    800022f0:	009787b3          	add	a5,a5,s1
    800022f4:	fe87c503          	lbu	a0,-24(a5)
    800022f8:	fffff097          	auipc	ra,0xfffff
    800022fc:	7f8080e7          	jalr	2040(ra) # 80001af0 <_Z4putcc>
    80002300:	fe5ff06f          	j	800022e4 <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80002304:	00a00513          	li	a0,10
    80002308:	fffff097          	auipc	ra,0xfffff
    8000230c:	7e8080e7          	jalr	2024(ra) # 80001af0 <_Z4putcc>
    putc('f');
    80002310:	06600513          	li	a0,102
    80002314:	fffff097          	auipc	ra,0xfffff
    80002318:	7dc080e7          	jalr	2012(ra) # 80001af0 <_Z4putcc>
    putc('u');
    8000231c:	07500513          	li	a0,117
    80002320:	fffff097          	auipc	ra,0xfffff
    80002324:	7d0080e7          	jalr	2000(ra) # 80001af0 <_Z4putcc>
    putc('n');
    80002328:	06e00513          	li	a0,110
    8000232c:	fffff097          	auipc	ra,0xfffff
    80002330:	7c4080e7          	jalr	1988(ra) # 80001af0 <_Z4putcc>
    putc('c');
    80002334:	06300513          	li	a0,99
    80002338:	fffff097          	auipc	ra,0xfffff
    8000233c:	7b8080e7          	jalr	1976(ra) # 80001af0 <_Z4putcc>
    putc('t');
    80002340:	07400513          	li	a0,116
    80002344:	fffff097          	auipc	ra,0xfffff
    80002348:	7ac080e7          	jalr	1964(ra) # 80001af0 <_Z4putcc>
    putc('i');
    8000234c:	06900513          	li	a0,105
    80002350:	fffff097          	auipc	ra,0xfffff
    80002354:	7a0080e7          	jalr	1952(ra) # 80001af0 <_Z4putcc>
    putc('o');
    80002358:	06f00513          	li	a0,111
    8000235c:	fffff097          	auipc	ra,0xfffff
    80002360:	794080e7          	jalr	1940(ra) # 80001af0 <_Z4putcc>
    putc('n');
    80002364:	06e00513          	li	a0,110
    80002368:	fffff097          	auipc	ra,0xfffff
    8000236c:	788080e7          	jalr	1928(ra) # 80001af0 <_Z4putcc>
    putc(':');
    80002370:	03a00513          	li	a0,58
    80002374:	fffff097          	auipc	ra,0xfffff
    80002378:	77c080e7          	jalr	1916(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    8000237c:	02000513          	li	a0,32
    80002380:	fffff097          	auipc	ra,0xfffff
    80002384:	770080e7          	jalr	1904(ra) # 80001af0 <_Z4putcc>
    putc('\'');
    80002388:	02700513          	li	a0,39
    8000238c:	fffff097          	auipc	ra,0xfffff
    80002390:	764080e7          	jalr	1892(ra) # 80001af0 <_Z4putcc>
    while(*__function != 0){
    80002394:	000a4503          	lbu	a0,0(s4)
    80002398:	00050a63          	beqz	a0,800023ac <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    8000239c:	fffff097          	auipc	ra,0xfffff
    800023a0:	754080e7          	jalr	1876(ra) # 80001af0 <_Z4putcc>
        __function ++;
    800023a4:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    800023a8:	fedff06f          	j	80002394 <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    800023ac:	02700513          	li	a0,39
    800023b0:	fffff097          	auipc	ra,0xfffff
    800023b4:	740080e7          	jalr	1856(ra) # 80001af0 <_Z4putcc>
    putc('\n');
    800023b8:	00a00513          	li	a0,10
    800023bc:	fffff097          	auipc	ra,0xfffff
    800023c0:	734080e7          	jalr	1844(ra) # 80001af0 <_Z4putcc>
    while(1);
    800023c4:	0000006f          	j	800023c4 <_Z13assert_failedPKcS0_jS0_+0x328>

00000000800023c8 <_Z4testPv>:
    /// initialise the console
    console.getInstance().init();
    return;
}

void test(void* arg){
    800023c8:	ff010113          	addi	sp,sp,-16
    800023cc:	00113423          	sd	ra,8(sp)
    800023d0:	00813023          	sd	s0,0(sp)
    800023d4:	01010413          	addi	s0,sp,16
    userMain();
    800023d8:	00006097          	auipc	ra,0x6
    800023dc:	dd8080e7          	jalr	-552(ra) # 800081b0 <_Z8userMainv>
    // testSleeping();
}
    800023e0:	00813083          	ld	ra,8(sp)
    800023e4:	00013403          	ld	s0,0(sp)
    800023e8:	01010113          	addi	sp,sp,16
    800023ec:	00008067          	ret

00000000800023f0 <_Z15consoleConsumerPv>:

void consoleConsumer(void* arg){
    800023f0:	ff010113          	addi	sp,sp,-16
    800023f4:	00113423          	sd	ra,8(sp)
    800023f8:	00813023          	sd	s0,0(sp)
    800023fc:	01010413          	addi	s0,sp,16
    ConsoleManager::outputHandler();
    80002400:	00002097          	auipc	ra,0x2
    80002404:	7b4080e7          	jalr	1972(ra) # 80004bb4 <_ZN14ConsoleManager13outputHandlerEv>
}
    80002408:	00813083          	ld	ra,8(sp)
    8000240c:	00013403          	ld	s0,0(sp)
    80002410:	01010113          	addi	sp,sp,16
    80002414:	00008067          	ret

0000000080002418 <_ZN6KernelC1Ev>:
Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80002418:	fd010113          	addi	sp,sp,-48
    8000241c:	02113423          	sd	ra,40(sp)
    80002420:	02813023          	sd	s0,32(sp)
    80002424:	00913c23          	sd	s1,24(sp)
    80002428:	01213823          	sd	s2,16(sp)
    8000242c:	01313423          	sd	s3,8(sp)
    80002430:	03010413          	addi	s0,sp,48
    80002434:	00050493          	mv	s1,a0
    80002438:	00001097          	auipc	ra,0x1
    8000243c:	054080e7          	jalr	84(ra) # 8000348c <_ZN11HeapManagerC1Ev>
    80002440:	00848513          	addi	a0,s1,8
    80002444:	00003097          	auipc	ra,0x3
    80002448:	e90080e7          	jalr	-368(ra) # 800052d4 <_ZN9SchedulerC1Ev>
    8000244c:	01848913          	addi	s2,s1,24
    80002450:	00090513          	mv	a0,s2
    80002454:	fffff097          	auipc	ra,0xfffff
    80002458:	180080e7          	jalr	384(ra) # 800015d4 <_ZN5TimerC1Ev>
    8000245c:	02848513          	addi	a0,s1,40
    80002460:	00002097          	auipc	ra,0x2
    80002464:	410080e7          	jalr	1040(ra) # 80004870 <_ZN14ConsoleManagerC1Ev>
    80002468:	0380006f          	j	800024a0 <_ZN6KernelC1Ev+0x88>
    8000246c:	00050993          	mv	s3,a0
    80002470:	00090513          	mv	a0,s2
    80002474:	fffff097          	auipc	ra,0xfffff
    80002478:	1d0080e7          	jalr	464(ra) # 80001644 <_ZN5TimerD1Ev>
    8000247c:	00098913          	mv	s2,s3
    80002480:	00048513          	mv	a0,s1
    80002484:	00001097          	auipc	ra,0x1
    80002488:	070080e7          	jalr	112(ra) # 800034f4 <_ZN11HeapManagerD1Ev>
    8000248c:	00090513          	mv	a0,s2
    80002490:	0000d097          	auipc	ra,0xd
    80002494:	e18080e7          	jalr	-488(ra) # 8000f2a8 <_Unwind_Resume>
    80002498:	00050913          	mv	s2,a0
    8000249c:	fe5ff06f          	j	80002480 <_ZN6KernelC1Ev+0x68>
    800024a0:	02813083          	ld	ra,40(sp)
    800024a4:	02013403          	ld	s0,32(sp)
    800024a8:	01813483          	ld	s1,24(sp)
    800024ac:	01013903          	ld	s2,16(sp)
    800024b0:	00813983          	ld	s3,8(sp)
    800024b4:	03010113          	addi	sp,sp,48
    800024b8:	00008067          	ret

00000000800024bc <_ZN6Kernel10initialiseEv>:
void Kernel::initialise(){
    800024bc:	ff010113          	addi	sp,sp,-16
    800024c0:	00113423          	sd	ra,8(sp)
    800024c4:	00813023          	sd	s0,0(sp)
    800024c8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    800024cc:	0000c797          	auipc	a5,0xc
    800024d0:	c247b783          	ld	a5,-988(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800024d4:	10579073          	csrw	stvec,a5
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );
    800024d8:	0000c797          	auipc	a5,0xc
    800024dc:	c207b783          	ld	a5,-992(a5) # 8000e0f8 <_GLOBAL_OFFSET_TABLE_+0x40>
    800024e0:	0007b603          	ld	a2,0(a5)
    800024e4:	0000c797          	auipc	a5,0xc
    800024e8:	bec7b783          	ld	a5,-1044(a5) # 8000e0d0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800024ec:	0007b583          	ld	a1,0(a5)
    800024f0:	00001097          	auipc	ra,0x1
    800024f4:	01c080e7          	jalr	28(ra) # 8000350c <_ZN11HeapManager4initEmm>
    console.getInstance().init();
    800024f8:	00002097          	auipc	ra,0x2
    800024fc:	2e8080e7          	jalr	744(ra) # 800047e0 <_ZN14ConsoleManager11getInstanceEv>
    80002500:	00002097          	auipc	ra,0x2
    80002504:	49c080e7          	jalr	1180(ra) # 8000499c <_ZN14ConsoleManager4initEv>
}
    80002508:	00813083          	ld	ra,8(sp)
    8000250c:	00013403          	ld	s0,0(sp)
    80002510:	01010113          	addi	sp,sp,16
    80002514:	00008067          	ret

0000000080002518 <_ZN6Kernel3runEv>:


Kernel::EXIT_CODE Kernel::run(){
    80002518:	fd010113          	addi	sp,sp,-48
    8000251c:	02113423          	sd	ra,40(sp)
    80002520:	02813023          	sd	s0,32(sp)
    80002524:	03010413          	addi	s0,sp,48

    thread_t kernelThread;
    
    thread_create(&kernelThread, 0, 0);
    80002528:	00000613          	li	a2,0
    8000252c:	00000593          	li	a1,0
    80002530:	fe840513          	addi	a0,s0,-24
    80002534:	fffff097          	auipc	ra,0xfffff
    80002538:	3cc080e7          	jalr	972(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    8000253c:	00003097          	auipc	ra,0x3
    80002540:	038080e7          	jalr	56(ra) # 80005574 <_ZN9Scheduler3getEv>
    80002544:	0000c797          	auipc	a5,0xc
    80002548:	bbc7b783          	ld	a5,-1092(a5) # 8000e100 <_GLOBAL_OFFSET_TABLE_+0x48>
    8000254c:	00a7b023          	sd	a0,0(a5)


    thread_t consoleThread;
    thread_create(&consoleThread, consoleConsumer, 0);
    80002550:	00000613          	li	a2,0
    80002554:	00000597          	auipc	a1,0x0
    80002558:	e9c58593          	addi	a1,a1,-356 # 800023f0 <_Z15consoleConsumerPv>
    8000255c:	fe040513          	addi	a0,s0,-32
    80002560:	fffff097          	auipc	ra,0xfffff
    80002564:	3a0080e7          	jalr	928(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>

    /// enable external hardware interrupts
    __asm__ volatile ("csrs sie, %0" :: "r"(1<<9));
    80002568:	20000793          	li	a5,512
    8000256c:	1047a073          	csrs	sie,a5

    /// enable software interrupts
    __asm__ volatile ("csrs sstatus, %0" :: "r"(1<<1));
    80002570:	00200793          	li	a5,2
    80002574:	1007a073          	csrs	sstatus,a5

    thread_t userThread;
    thread_create(&userThread, test, 0);
    80002578:	00000613          	li	a2,0
    8000257c:	00000597          	auipc	a1,0x0
    80002580:	e4c58593          	addi	a1,a1,-436 # 800023c8 <_Z4testPv>
    80002584:	fd840513          	addi	a0,s0,-40
    80002588:	fffff097          	auipc	ra,0xfffff
    8000258c:	378080e7          	jalr	888(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    // thread_create(&userThread, usermain, 0);
    while(!userThread->finished){
    80002590:	fd843783          	ld	a5,-40(s0)
    80002594:	0a07b783          	ld	a5,160(a5)
    80002598:	0087f793          	andi	a5,a5,8
    8000259c:	00079863          	bnez	a5,800025ac <_ZN6Kernel3runEv+0x94>
        thread_dispatch();
    800025a0:	fffff097          	auipc	ra,0xfffff
    800025a4:	3fc080e7          	jalr	1020(ra) # 8000199c <_Z15thread_dispatchv>
    800025a8:	fe9ff06f          	j	80002590 <_ZN6Kernel3runEv+0x78>
        // ConsoleManager::putc('K');
    }

    return EXIT_SUCCESS;
}
    800025ac:	00000513          	li	a0,0
    800025b0:	02813083          	ld	ra,40(sp)
    800025b4:	02013403          	ld	s0,32(sp)
    800025b8:	03010113          	addi	sp,sp,48
    800025bc:	00008067          	ret

00000000800025c0 <_Z13thread_test_1Pv>:

sem_t sem1, sem2;

char c;

void thread_test_1(void* args){
    800025c0:	ff010113          	addi	sp,sp,-16
    800025c4:	00113423          	sd	ra,8(sp)
    800025c8:	00813023          	sd	s0,0(sp)
    800025cc:	01010413          	addi	s0,sp,16
    putc('1');
    800025d0:	03100513          	li	a0,49
    800025d4:	fffff097          	auipc	ra,0xfffff
    800025d8:	51c080e7          	jalr	1308(ra) # 80001af0 <_Z4putcc>
    putc('s');
    800025dc:	07300513          	li	a0,115
    800025e0:	fffff097          	auipc	ra,0xfffff
    800025e4:	510080e7          	jalr	1296(ra) # 80001af0 <_Z4putcc>
    if(c != 's')time_sleep(60);
    800025e8:	0000c717          	auipc	a4,0xc
    800025ec:	b7074703          	lbu	a4,-1168(a4) # 8000e158 <c>
    800025f0:	07300793          	li	a5,115
    800025f4:	02f71e63          	bne	a4,a5,80002630 <_Z13thread_test_1Pv+0x70>
    putc('1');
    800025f8:	03100513          	li	a0,49
    800025fc:	fffff097          	auipc	ra,0xfffff
    80002600:	4f4080e7          	jalr	1268(ra) # 80001af0 <_Z4putcc>
    if(c == 's')sem_signal(sem1);
    80002604:	0000c717          	auipc	a4,0xc
    80002608:	b5474703          	lbu	a4,-1196(a4) # 8000e158 <c>
    8000260c:	07300793          	li	a5,115
    80002610:	02f70863          	beq	a4,a5,80002640 <_Z13thread_test_1Pv+0x80>
    putc('S');
    80002614:	05300513          	li	a0,83
    80002618:	fffff097          	auipc	ra,0xfffff
    8000261c:	4d8080e7          	jalr	1240(ra) # 80001af0 <_Z4putcc>
}
    80002620:	00813083          	ld	ra,8(sp)
    80002624:	00013403          	ld	s0,0(sp)
    80002628:	01010113          	addi	sp,sp,16
    8000262c:	00008067          	ret
    if(c != 's')time_sleep(60);
    80002630:	03c00513          	li	a0,60
    80002634:	fffff097          	auipc	ra,0xfffff
    80002638:	3ac080e7          	jalr	940(ra) # 800019e0 <_Z10time_sleepm>
    8000263c:	fbdff06f          	j	800025f8 <_Z13thread_test_1Pv+0x38>
    if(c == 's')sem_signal(sem1);
    80002640:	0000c517          	auipc	a0,0xc
    80002644:	b2053503          	ld	a0,-1248(a0) # 8000e160 <sem1>
    80002648:	fffff097          	auipc	ra,0xfffff
    8000264c:	454080e7          	jalr	1108(ra) # 80001a9c <_Z10sem_signalP4_sem>
    80002650:	fc5ff06f          	j	80002614 <_Z13thread_test_1Pv+0x54>

0000000080002654 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80002654:	ff010113          	addi	sp,sp,-16
    80002658:	00113423          	sd	ra,8(sp)
    8000265c:	00813023          	sd	s0,0(sp)
    80002660:	01010413          	addi	s0,sp,16
    putc('2');
    80002664:	03200513          	li	a0,50
    80002668:	fffff097          	auipc	ra,0xfffff
    8000266c:	488080e7          	jalr	1160(ra) # 80001af0 <_Z4putcc>
    putc('s');
    80002670:	07300513          	li	a0,115
    80002674:	fffff097          	auipc	ra,0xfffff
    80002678:	47c080e7          	jalr	1148(ra) # 80001af0 <_Z4putcc>
    if(c != 's')time_sleep(30);
    8000267c:	0000c717          	auipc	a4,0xc
    80002680:	adc74703          	lbu	a4,-1316(a4) # 8000e158 <c>
    80002684:	07300793          	li	a5,115
    80002688:	02f71e63          	bne	a4,a5,800026c4 <_Z13thread_test_2Pv+0x70>
    putc('2');
    8000268c:	03200513          	li	a0,50
    80002690:	fffff097          	auipc	ra,0xfffff
    80002694:	460080e7          	jalr	1120(ra) # 80001af0 <_Z4putcc>
    putc('S');
    80002698:	05300513          	li	a0,83
    8000269c:	fffff097          	auipc	ra,0xfffff
    800026a0:	454080e7          	jalr	1108(ra) # 80001af0 <_Z4putcc>
    if(c == 's')sem_signal(sem2);
    800026a4:	0000c717          	auipc	a4,0xc
    800026a8:	ab474703          	lbu	a4,-1356(a4) # 8000e158 <c>
    800026ac:	07300793          	li	a5,115
    800026b0:	02f70263          	beq	a4,a5,800026d4 <_Z13thread_test_2Pv+0x80>
}
    800026b4:	00813083          	ld	ra,8(sp)
    800026b8:	00013403          	ld	s0,0(sp)
    800026bc:	01010113          	addi	sp,sp,16
    800026c0:	00008067          	ret
    if(c != 's')time_sleep(30);
    800026c4:	01e00513          	li	a0,30
    800026c8:	fffff097          	auipc	ra,0xfffff
    800026cc:	318080e7          	jalr	792(ra) # 800019e0 <_Z10time_sleepm>
    800026d0:	fbdff06f          	j	8000268c <_Z13thread_test_2Pv+0x38>
    if(c == 's')sem_signal(sem2);
    800026d4:	0000c517          	auipc	a0,0xc
    800026d8:	a9453503          	ld	a0,-1388(a0) # 8000e168 <sem2>
    800026dc:	fffff097          	auipc	ra,0xfffff
    800026e0:	3c0080e7          	jalr	960(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    800026e4:	fd1ff06f          	j	800026b4 <_Z13thread_test_2Pv+0x60>

00000000800026e8 <_Z7memTestv>:

void memTest(){
    800026e8:	fd010113          	addi	sp,sp,-48
    800026ec:	02113423          	sd	ra,40(sp)
    800026f0:	02813023          	sd	s0,32(sp)
    800026f4:	00913c23          	sd	s1,24(sp)
    800026f8:	01213823          	sd	s2,16(sp)
    800026fc:	01313423          	sd	s3,8(sp)
    80002700:	01413023          	sd	s4,0(sp)
    80002704:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002708:	0000c797          	auipc	a5,0xc
    8000270c:	9d87b783          	ld	a5,-1576(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002710:	0007b503          	ld	a0,0(a5)
    80002714:	00001097          	auipc	ra,0x1
    80002718:	f1c080e7          	jalr	-228(ra) # 80003630 <_ZN11HeapManager17getHeapFreeMemoryEv>
    8000271c:	00050993          	mv	s3,a0
    putc('F');
    80002720:	04600513          	li	a0,70
    80002724:	fffff097          	auipc	ra,0xfffff
    80002728:	3cc080e7          	jalr	972(ra) # 80001af0 <_Z4putcc>
    putc('r');
    8000272c:	07200513          	li	a0,114
    80002730:	fffff097          	auipc	ra,0xfffff
    80002734:	3c0080e7          	jalr	960(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002738:	06500513          	li	a0,101
    8000273c:	fffff097          	auipc	ra,0xfffff
    80002740:	3b4080e7          	jalr	948(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002744:	06500513          	li	a0,101
    80002748:	fffff097          	auipc	ra,0xfffff
    8000274c:	3a8080e7          	jalr	936(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    80002750:	02000513          	li	a0,32
    80002754:	fffff097          	auipc	ra,0xfffff
    80002758:	39c080e7          	jalr	924(ra) # 80001af0 <_Z4putcc>
    putc('m');
    8000275c:	06d00513          	li	a0,109
    80002760:	fffff097          	auipc	ra,0xfffff
    80002764:	390080e7          	jalr	912(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002768:	06500513          	li	a0,101
    8000276c:	fffff097          	auipc	ra,0xfffff
    80002770:	384080e7          	jalr	900(ra) # 80001af0 <_Z4putcc>
    putc('m');
    80002774:	06d00513          	li	a0,109
    80002778:	fffff097          	auipc	ra,0xfffff
    8000277c:	378080e7          	jalr	888(ra) # 80001af0 <_Z4putcc>
    putc('o');
    80002780:	06f00513          	li	a0,111
    80002784:	fffff097          	auipc	ra,0xfffff
    80002788:	36c080e7          	jalr	876(ra) # 80001af0 <_Z4putcc>
    putc('r');
    8000278c:	07200513          	li	a0,114
    80002790:	fffff097          	auipc	ra,0xfffff
    80002794:	360080e7          	jalr	864(ra) # 80001af0 <_Z4putcc>
    putc('y');
    80002798:	07900513          	li	a0,121
    8000279c:	fffff097          	auipc	ra,0xfffff
    800027a0:	354080e7          	jalr	852(ra) # 80001af0 <_Z4putcc>
    putc(':');
    800027a4:	03a00513          	li	a0,58
    800027a8:	fffff097          	auipc	ra,0xfffff
    800027ac:	348080e7          	jalr	840(ra) # 80001af0 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800027b0:	00f00493          	li	s1,15
    800027b4:	0140006f          	j	800027c8 <_Z7memTestv+0xe0>
        int digit = (freeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    800027b8:	05750513          	addi	a0,a0,87
    800027bc:	fffff097          	auipc	ra,0xfffff
    800027c0:	334080e7          	jalr	820(ra) # 80001af0 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800027c4:	fff4849b          	addiw	s1,s1,-1
    800027c8:	0204c463          	bltz	s1,800027f0 <_Z7memTestv+0x108>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    800027cc:	0024951b          	slliw	a0,s1,0x2
    800027d0:	00a9d533          	srl	a0,s3,a0
    800027d4:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800027d8:	00900793          	li	a5,9
    800027dc:	fca7cee3          	blt	a5,a0,800027b8 <_Z7memTestv+0xd0>
            putc('0' + digit);
    800027e0:	03050513          	addi	a0,a0,48
    800027e4:	fffff097          	auipc	ra,0xfffff
    800027e8:	30c080e7          	jalr	780(ra) # 80001af0 <_Z4putcc>
    800027ec:	fd9ff06f          	j	800027c4 <_Z7memTestv+0xdc>
        }
    }

    putc('\n');
    800027f0:	00a00513          	li	a0,10
    800027f4:	fffff097          	auipc	ra,0xfffff
    800027f8:	2fc080e7          	jalr	764(ra) # 80001af0 <_Z4putcc>
    int n = 100;
    int k = 100;
    int** matrix = (int**)mem_alloc(sizeof(int*) * n);
    800027fc:	32000513          	li	a0,800
    80002800:	fffff097          	auipc	ra,0xfffff
    80002804:	0a4080e7          	jalr	164(ra) # 800018a4 <_Z9mem_allocm>
    80002808:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    8000280c:	00000493          	li	s1,0
    80002810:	0080006f          	j	80002818 <_Z7memTestv+0x130>
    80002814:	0014849b          	addiw	s1,s1,1
    80002818:	06300793          	li	a5,99
    8000281c:	0497c663          	blt	a5,s1,80002868 <_Z7memTestv+0x180>
        matrix[i] = (int*)mem_alloc(sizeof(int) * k);
    80002820:	00349a13          	slli	s4,s1,0x3
    80002824:	01490a33          	add	s4,s2,s4
    80002828:	19000513          	li	a0,400
    8000282c:	fffff097          	auipc	ra,0xfffff
    80002830:	078080e7          	jalr	120(ra) # 800018a4 <_Z9mem_allocm>
    80002834:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    80002838:	00000713          	li	a4,0
    8000283c:	06300793          	li	a5,99
    80002840:	fce7cae3          	blt	a5,a4,80002814 <_Z7memTestv+0x12c>
            matrix[i][j] = i * k + j;
    80002844:	06400793          	li	a5,100
    80002848:	029787bb          	mulw	a5,a5,s1
    8000284c:	000a3683          	ld	a3,0(s4)
    80002850:	00271613          	slli	a2,a4,0x2
    80002854:	00c686b3          	add	a3,a3,a2
    80002858:	00e787bb          	addw	a5,a5,a4
    8000285c:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80002860:	0017071b          	addiw	a4,a4,1
    80002864:	fd9ff06f          	j	8000283c <_Z7memTestv+0x154>
        }
    }
    for(int i = 0; i < n; i++){
    80002868:	00000a13          	li	s4,0
    8000286c:	0780006f          	j	800028e4 <_Z7memTestv+0x1fc>
        for(int j = 0; j < k; j++){
    80002870:	0014849b          	addiw	s1,s1,1
    80002874:	06300793          	li	a5,99
    80002878:	0497ca63          	blt	a5,s1,800028cc <_Z7memTestv+0x1e4>
            assert(matrix[i][j] == i * k + j);
    8000287c:	003a1793          	slli	a5,s4,0x3
    80002880:	00f907b3          	add	a5,s2,a5
    80002884:	0007b783          	ld	a5,0(a5)
    80002888:	00249713          	slli	a4,s1,0x2
    8000288c:	00e787b3          	add	a5,a5,a4
    80002890:	0007a703          	lw	a4,0(a5)
    80002894:	06400793          	li	a5,100
    80002898:	034787bb          	mulw	a5,a5,s4
    8000289c:	009787bb          	addw	a5,a5,s1
    800028a0:	fcf708e3          	beq	a4,a5,80002870 <_Z7memTestv+0x188>
    800028a4:	00009697          	auipc	a3,0x9
    800028a8:	82c68693          	addi	a3,a3,-2004 # 8000b0d0 <CONSOLE_STATUS+0xc0>
    800028ac:	04200613          	li	a2,66
    800028b0:	00009597          	auipc	a1,0x9
    800028b4:	83058593          	addi	a1,a1,-2000 # 8000b0e0 <CONSOLE_STATUS+0xd0>
    800028b8:	00009517          	auipc	a0,0x9
    800028bc:	84050513          	addi	a0,a0,-1984 # 8000b0f8 <CONSOLE_STATUS+0xe8>
    800028c0:	fffff097          	auipc	ra,0xfffff
    800028c4:	7dc080e7          	jalr	2012(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    800028c8:	fa9ff06f          	j	80002870 <_Z7memTestv+0x188>
        }
        mem_free(matrix[i]);
    800028cc:	003a1793          	slli	a5,s4,0x3
    800028d0:	00f907b3          	add	a5,s2,a5
    800028d4:	0007b503          	ld	a0,0(a5)
    800028d8:	fffff097          	auipc	ra,0xfffff
    800028dc:	ffc080e7          	jalr	-4(ra) # 800018d4 <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    800028e0:	001a0a1b          	addiw	s4,s4,1
    800028e4:	06300793          	li	a5,99
    800028e8:	0147c663          	blt	a5,s4,800028f4 <_Z7memTestv+0x20c>
        for(int j = 0; j < k; j++){
    800028ec:	00000493          	li	s1,0
    800028f0:	f85ff06f          	j	80002874 <_Z7memTestv+0x18c>
    }
    mem_free(matrix);
    800028f4:	00090513          	mv	a0,s2
    800028f8:	fffff097          	auipc	ra,0xfffff
    800028fc:	fdc080e7          	jalr	-36(ra) # 800018d4 <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002900:	0000b797          	auipc	a5,0xb
    80002904:	7e07b783          	ld	a5,2016(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002908:	0007b503          	ld	a0,0(a5)
    8000290c:	00001097          	auipc	ra,0x1
    80002910:	d24080e7          	jalr	-732(ra) # 80003630 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002914:	00050493          	mv	s1,a0
    putc('F');
    80002918:	04600513          	li	a0,70
    8000291c:	fffff097          	auipc	ra,0xfffff
    80002920:	1d4080e7          	jalr	468(ra) # 80001af0 <_Z4putcc>
    putc('r');
    80002924:	07200513          	li	a0,114
    80002928:	fffff097          	auipc	ra,0xfffff
    8000292c:	1c8080e7          	jalr	456(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002930:	06500513          	li	a0,101
    80002934:	fffff097          	auipc	ra,0xfffff
    80002938:	1bc080e7          	jalr	444(ra) # 80001af0 <_Z4putcc>
    putc('e');
    8000293c:	06500513          	li	a0,101
    80002940:	fffff097          	auipc	ra,0xfffff
    80002944:	1b0080e7          	jalr	432(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    80002948:	02000513          	li	a0,32
    8000294c:	fffff097          	auipc	ra,0xfffff
    80002950:	1a4080e7          	jalr	420(ra) # 80001af0 <_Z4putcc>
    putc('m');
    80002954:	06d00513          	li	a0,109
    80002958:	fffff097          	auipc	ra,0xfffff
    8000295c:	198080e7          	jalr	408(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002960:	06500513          	li	a0,101
    80002964:	fffff097          	auipc	ra,0xfffff
    80002968:	18c080e7          	jalr	396(ra) # 80001af0 <_Z4putcc>
    putc('m');
    8000296c:	06d00513          	li	a0,109
    80002970:	fffff097          	auipc	ra,0xfffff
    80002974:	180080e7          	jalr	384(ra) # 80001af0 <_Z4putcc>
    putc('o');
    80002978:	06f00513          	li	a0,111
    8000297c:	fffff097          	auipc	ra,0xfffff
    80002980:	174080e7          	jalr	372(ra) # 80001af0 <_Z4putcc>
    putc('r');
    80002984:	07200513          	li	a0,114
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	168080e7          	jalr	360(ra) # 80001af0 <_Z4putcc>
    putc('y');
    80002990:	07900513          	li	a0,121
    80002994:	fffff097          	auipc	ra,0xfffff
    80002998:	15c080e7          	jalr	348(ra) # 80001af0 <_Z4putcc>
    putc(':');
    8000299c:	03a00513          	li	a0,58
    800029a0:	fffff097          	auipc	ra,0xfffff
    800029a4:	150080e7          	jalr	336(ra) # 80001af0 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800029a8:	00f00913          	li	s2,15
    800029ac:	0140006f          	j	800029c0 <_Z7memTestv+0x2d8>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    800029b0:	05750513          	addi	a0,a0,87
    800029b4:	fffff097          	auipc	ra,0xfffff
    800029b8:	13c080e7          	jalr	316(ra) # 80001af0 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800029bc:	fff9091b          	addiw	s2,s2,-1
    800029c0:	02094463          	bltz	s2,800029e8 <_Z7memTestv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    800029c4:	0029151b          	slliw	a0,s2,0x2
    800029c8:	00a4d533          	srl	a0,s1,a0
    800029cc:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800029d0:	00900793          	li	a5,9
    800029d4:	fca7cee3          	blt	a5,a0,800029b0 <_Z7memTestv+0x2c8>
            putc('0' + digit);
    800029d8:	03050513          	addi	a0,a0,48
    800029dc:	fffff097          	auipc	ra,0xfffff
    800029e0:	114080e7          	jalr	276(ra) # 80001af0 <_Z4putcc>
    800029e4:	fd9ff06f          	j	800029bc <_Z7memTestv+0x2d4>
        }
    }
    putc('\n');
    800029e8:	00a00513          	li	a0,10
    800029ec:	fffff097          	auipc	ra,0xfffff
    800029f0:	104080e7          	jalr	260(ra) # 80001af0 <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    800029f4:	409989b3          	sub	s3,s3,s1
    putc('D');
    800029f8:	04400513          	li	a0,68
    800029fc:	fffff097          	auipc	ra,0xfffff
    80002a00:	0f4080e7          	jalr	244(ra) # 80001af0 <_Z4putcc>
    putc('i');
    80002a04:	06900513          	li	a0,105
    80002a08:	fffff097          	auipc	ra,0xfffff
    80002a0c:	0e8080e7          	jalr	232(ra) # 80001af0 <_Z4putcc>
    putc('f');
    80002a10:	06600513          	li	a0,102
    80002a14:	fffff097          	auipc	ra,0xfffff
    80002a18:	0dc080e7          	jalr	220(ra) # 80001af0 <_Z4putcc>
    putc('f');
    80002a1c:	06600513          	li	a0,102
    80002a20:	fffff097          	auipc	ra,0xfffff
    80002a24:	0d0080e7          	jalr	208(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002a28:	06500513          	li	a0,101
    80002a2c:	fffff097          	auipc	ra,0xfffff
    80002a30:	0c4080e7          	jalr	196(ra) # 80001af0 <_Z4putcc>
    putc('r');
    80002a34:	07200513          	li	a0,114
    80002a38:	fffff097          	auipc	ra,0xfffff
    80002a3c:	0b8080e7          	jalr	184(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002a40:	06500513          	li	a0,101
    80002a44:	fffff097          	auipc	ra,0xfffff
    80002a48:	0ac080e7          	jalr	172(ra) # 80001af0 <_Z4putcc>
    putc('n');
    80002a4c:	06e00513          	li	a0,110
    80002a50:	fffff097          	auipc	ra,0xfffff
    80002a54:	0a0080e7          	jalr	160(ra) # 80001af0 <_Z4putcc>
    putc('c');
    80002a58:	06300513          	li	a0,99
    80002a5c:	fffff097          	auipc	ra,0xfffff
    80002a60:	094080e7          	jalr	148(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002a64:	06500513          	li	a0,101
    80002a68:	fffff097          	auipc	ra,0xfffff
    80002a6c:	088080e7          	jalr	136(ra) # 80001af0 <_Z4putcc>
    putc(':');
    80002a70:	03a00513          	li	a0,58
    80002a74:	fffff097          	auipc	ra,0xfffff
    80002a78:	07c080e7          	jalr	124(ra) # 80001af0 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002a7c:	00f00493          	li	s1,15
    80002a80:	0140006f          	j	80002a94 <_Z7memTestv+0x3ac>
        int digit = (difference >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002a84:	05750513          	addi	a0,a0,87
    80002a88:	fffff097          	auipc	ra,0xfffff
    80002a8c:	068080e7          	jalr	104(ra) # 80001af0 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002a90:	fff4849b          	addiw	s1,s1,-1
    80002a94:	0204c463          	bltz	s1,80002abc <_Z7memTestv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    80002a98:	0024951b          	slliw	a0,s1,0x2
    80002a9c:	00a9d533          	srl	a0,s3,a0
    80002aa0:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002aa4:	00900793          	li	a5,9
    80002aa8:	fca7cee3          	blt	a5,a0,80002a84 <_Z7memTestv+0x39c>
            putc('0' + digit);
    80002aac:	03050513          	addi	a0,a0,48
    80002ab0:	fffff097          	auipc	ra,0xfffff
    80002ab4:	040080e7          	jalr	64(ra) # 80001af0 <_Z4putcc>
    80002ab8:	fd9ff06f          	j	80002a90 <_Z7memTestv+0x3a8>
        }
    }
    putc('\n');
    80002abc:	00a00513          	li	a0,10
    80002ac0:	fffff097          	auipc	ra,0xfffff
    80002ac4:	030080e7          	jalr	48(ra) # 80001af0 <_Z4putcc>
    putc('\n');
    80002ac8:	00a00513          	li	a0,10
    80002acc:	fffff097          	auipc	ra,0xfffff
    80002ad0:	024080e7          	jalr	36(ra) # 80001af0 <_Z4putcc>
    putc('\n');
    80002ad4:	00a00513          	li	a0,10
    80002ad8:	fffff097          	auipc	ra,0xfffff
    80002adc:	018080e7          	jalr	24(ra) # 80001af0 <_Z4putcc>
}
    80002ae0:	02813083          	ld	ra,40(sp)
    80002ae4:	02013403          	ld	s0,32(sp)
    80002ae8:	01813483          	ld	s1,24(sp)
    80002aec:	01013903          	ld	s2,16(sp)
    80002af0:	00813983          	ld	s3,8(sp)
    80002af4:	00013a03          	ld	s4,0(sp)
    80002af8:	03010113          	addi	sp,sp,48
    80002afc:	00008067          	ret

0000000080002b00 <_Z8usermainPv>:

void usermain(void* arg){
    80002b00:	fd010113          	addi	sp,sp,-48
    80002b04:	02113423          	sd	ra,40(sp)
    80002b08:	02813023          	sd	s0,32(sp)
    80002b0c:	00913c23          	sd	s1,24(sp)
    80002b10:	03010413          	addi	s0,sp,48
    putc('0');
    80002b14:	03000513          	li	a0,48
    80002b18:	fffff097          	auipc	ra,0xfffff
    80002b1c:	fd8080e7          	jalr	-40(ra) # 80001af0 <_Z4putcc>
    // memTest();
    c = '-';
    80002b20:	0000b497          	auipc	s1,0xb
    80002b24:	63848493          	addi	s1,s1,1592 # 8000e158 <c>
    80002b28:	02d00793          	li	a5,45
    80002b2c:	00f48023          	sb	a5,0(s1)
    thread_t t1, t2;
    if(c == 's'){
        sem_open(&sem1, 0);
        sem_open(&sem2, 0);
    }
    thread_create(&t1, thread_test_1, 0);
    80002b30:	00000613          	li	a2,0
    80002b34:	00000597          	auipc	a1,0x0
    80002b38:	a8c58593          	addi	a1,a1,-1396 # 800025c0 <_Z13thread_test_1Pv>
    80002b3c:	fd840513          	addi	a0,s0,-40
    80002b40:	fffff097          	auipc	ra,0xfffff
    80002b44:	dc0080e7          	jalr	-576(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002b48:	00000613          	li	a2,0
    80002b4c:	00000597          	auipc	a1,0x0
    80002b50:	b0858593          	addi	a1,a1,-1272 # 80002654 <_Z13thread_test_2Pv>
    80002b54:	fd040513          	addi	a0,s0,-48
    80002b58:	fffff097          	auipc	ra,0xfffff
    80002b5c:	da8080e7          	jalr	-600(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    if(c == 's')sem_wait(sem1);
    80002b60:	0004c703          	lbu	a4,0(s1)
    80002b64:	07300793          	li	a5,115
    80002b68:	08f70663          	beq	a4,a5,80002bf4 <_Z8usermainPv+0xf4>
    putc('3');
    80002b6c:	03300513          	li	a0,51
    80002b70:	fffff097          	auipc	ra,0xfffff
    80002b74:	f80080e7          	jalr	-128(ra) # 80001af0 <_Z4putcc>
    if(c != 's')thread_join(t2);
    80002b78:	0000b717          	auipc	a4,0xb
    80002b7c:	5e074703          	lbu	a4,1504(a4) # 8000e158 <c>
    80002b80:	07300793          	li	a5,115
    80002b84:	08f71263          	bne	a4,a5,80002c08 <_Z8usermainPv+0x108>
    putc('4');
    80002b88:	03400513          	li	a0,52
    80002b8c:	fffff097          	auipc	ra,0xfffff
    80002b90:	f64080e7          	jalr	-156(ra) # 80001af0 <_Z4putcc>
    if(c != 's')thread_join(t1);
    80002b94:	0000b717          	auipc	a4,0xb
    80002b98:	5c474703          	lbu	a4,1476(a4) # 8000e158 <c>
    80002b9c:	07300793          	li	a5,115
    80002ba0:	06f71c63          	bne	a4,a5,80002c18 <_Z8usermainPv+0x118>
    if(c == 's')sem_wait(sem2);
    80002ba4:	0000b717          	auipc	a4,0xb
    80002ba8:	5b474703          	lbu	a4,1460(a4) # 8000e158 <c>
    80002bac:	07300793          	li	a5,115
    80002bb0:	06f70c63          	beq	a4,a5,80002c28 <_Z8usermainPv+0x128>
    putc('5');
    80002bb4:	03500513          	li	a0,53
    80002bb8:	fffff097          	auipc	ra,0xfffff
    80002bbc:	f38080e7          	jalr	-200(ra) # 80001af0 <_Z4putcc>
    if(c == 's')sem_close(sem1);
    80002bc0:	0000b717          	auipc	a4,0xb
    80002bc4:	59874703          	lbu	a4,1432(a4) # 8000e158 <c>
    80002bc8:	07300793          	li	a5,115
    80002bcc:	06f70863          	beq	a4,a5,80002c3c <_Z8usermainPv+0x13c>
    if(c == 's')sem_close(sem2);
    80002bd0:	0000b717          	auipc	a4,0xb
    80002bd4:	58874703          	lbu	a4,1416(a4) # 8000e158 <c>
    80002bd8:	07300793          	li	a5,115
    80002bdc:	06f70a63          	beq	a4,a5,80002c50 <_Z8usermainPv+0x150>
    80002be0:	02813083          	ld	ra,40(sp)
    80002be4:	02013403          	ld	s0,32(sp)
    80002be8:	01813483          	ld	s1,24(sp)
    80002bec:	03010113          	addi	sp,sp,48
    80002bf0:	00008067          	ret
    if(c == 's')sem_wait(sem1);
    80002bf4:	0000b517          	auipc	a0,0xb
    80002bf8:	56c53503          	ld	a0,1388(a0) # 8000e160 <sem1>
    80002bfc:	fffff097          	auipc	ra,0xfffff
    80002c00:	e74080e7          	jalr	-396(ra) # 80001a70 <_Z8sem_waitP4_sem>
    80002c04:	f69ff06f          	j	80002b6c <_Z8usermainPv+0x6c>
    if(c != 's')thread_join(t2);
    80002c08:	fd043503          	ld	a0,-48(s0)
    80002c0c:	fffff097          	auipc	ra,0xfffff
    80002c10:	db0080e7          	jalr	-592(ra) # 800019bc <_Z11thread_joinP7_thread>
    80002c14:	f75ff06f          	j	80002b88 <_Z8usermainPv+0x88>
    if(c != 's')thread_join(t1);
    80002c18:	fd843503          	ld	a0,-40(s0)
    80002c1c:	fffff097          	auipc	ra,0xfffff
    80002c20:	da0080e7          	jalr	-608(ra) # 800019bc <_Z11thread_joinP7_thread>
    80002c24:	f81ff06f          	j	80002ba4 <_Z8usermainPv+0xa4>
    if(c == 's')sem_wait(sem2);
    80002c28:	0000b517          	auipc	a0,0xb
    80002c2c:	54053503          	ld	a0,1344(a0) # 8000e168 <sem2>
    80002c30:	fffff097          	auipc	ra,0xfffff
    80002c34:	e40080e7          	jalr	-448(ra) # 80001a70 <_Z8sem_waitP4_sem>
    80002c38:	f7dff06f          	j	80002bb4 <_Z8usermainPv+0xb4>
    if(c == 's')sem_close(sem1);
    80002c3c:	0000b517          	auipc	a0,0xb
    80002c40:	52453503          	ld	a0,1316(a0) # 8000e160 <sem1>
    80002c44:	fffff097          	auipc	ra,0xfffff
    80002c48:	e00080e7          	jalr	-512(ra) # 80001a44 <_Z9sem_closeP4_sem>
    80002c4c:	f85ff06f          	j	80002bd0 <_Z8usermainPv+0xd0>
    if(c == 's')sem_close(sem2);
    80002c50:	0000b517          	auipc	a0,0xb
    80002c54:	51853503          	ld	a0,1304(a0) # 8000e168 <sem2>
    80002c58:	fffff097          	auipc	ra,0xfffff
    80002c5c:	dec080e7          	jalr	-532(ra) # 80001a44 <_Z9sem_closeP4_sem>
    80002c60:	f81ff06f          	j	80002be0 <_Z8usermainPv+0xe0>

0000000080002c64 <_ZN7_threadC1EPFvPvES0_>:
#include "consoleManager.h"
#include "heapManager.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    80002c64:	ff010113          	addi	sp,sp,-16
    80002c68:	00813423          	sd	s0,8(sp)
    80002c6c:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80002c70:	00053823          	sd	zero,16(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80002c74:	0000b717          	auipc	a4,0xb
    80002c78:	4fc70713          	addi	a4,a4,1276 # 8000e170 <_ZN7_thread6nextIDE>
    80002c7c:	00072783          	lw	a5,0(a4)
    80002c80:	0017869b          	addiw	a3,a5,1
    80002c84:	00d72023          	sw	a3,0(a4)
    80002c88:	00f52023          	sw	a5,0(a0)
    closed = 0;
    80002c8c:	0a053783          	ld	a5,160(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002c90:	0015b593          	seqz	a1,a1
    80002c94:	00459593          	slli	a1,a1,0x4
    80002c98:	fe07f793          	andi	a5,a5,-32
    80002c9c:	00b7e7b3          	or	a5,a5,a1
    reserved = 0;
    80002ca0:	00008717          	auipc	a4,0x8
    80002ca4:	47873703          	ld	a4,1144(a4) # 8000b118 <CONSOLE_STATUS+0x108>
    80002ca8:	00e7f7b3          	and	a5,a5,a4
    80002cac:	0af53023          	sd	a5,160(a0)
    joinHead = 0;
    80002cb0:	08053023          	sd	zero,128(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    80002cb4:	00200793          	li	a5,2
    80002cb8:	08f53823          	sd	a5,144(a0)
    stackStart = 0;
    80002cbc:	08053c23          	sd	zero,152(a0)
    
    context.s0 = 0;
    80002cc0:	00053c23          	sd	zero,24(a0)
    context.s1 = 0;
    80002cc4:	02053023          	sd	zero,32(a0)
    context.s2 = 0;
    80002cc8:	02053423          	sd	zero,40(a0)
    context.s3 = 0;
    80002ccc:	02053823          	sd	zero,48(a0)
    context.s4 = 0;
    80002cd0:	02053c23          	sd	zero,56(a0)
    context.s5 = 0;
    80002cd4:	04053023          	sd	zero,64(a0)
    context.s6 = 0;
    80002cd8:	04053423          	sd	zero,72(a0)
    context.s7 = 0;
    80002cdc:	04053823          	sd	zero,80(a0)
    context.s8 = 0;
    80002ce0:	04053c23          	sd	zero,88(a0)
    context.s9 = 0;
    80002ce4:	06053023          	sd	zero,96(a0)
    context.s10 = 0;
    80002ce8:	06053423          	sd	zero,104(a0)
    context.s11 = 0;
    80002cec:	06053823          	sd	zero,112(a0)

    context.sstatus = 0;
    80002cf0:	06053c23          	sd	zero,120(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002cf4:	00000797          	auipc	a5,0x0
    80002cf8:	73c78793          	addi	a5,a5,1852 # 80003430 <_ZN7_thread7wrapperEv>
    80002cfc:	00f53423          	sd	a5,8(a0)
}
    80002d00:	00813403          	ld	s0,8(sp)
    80002d04:	01010113          	addi	sp,sp,16
    80002d08:	00008067          	ret

0000000080002d0c <_Z10popSppSpiev>:

void popSppSpie(){
    80002d0c:	ff010113          	addi	sp,sp,-16
    80002d10:	00813423          	sd	s0,8(sp)
    80002d14:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002d18:	14109073          	csrw	sepc,ra
    __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002d1c:	10000793          	li	a5,256
    80002d20:	1007b073          	csrc	sstatus,a5
    __asm__ volatile ("sret");
    80002d24:	10200073          	sret
}
    80002d28:	00813403          	ld	s0,8(sp)
    80002d2c:	01010113          	addi	sp,sp,16
    80002d30:	00008067          	ret

0000000080002d34 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002d34:	fe010113          	addi	sp,sp,-32
    80002d38:	00113c23          	sd	ra,24(sp)
    80002d3c:	00813823          	sd	s0,16(sp)
    80002d40:	00913423          	sd	s1,8(sp)
    80002d44:	01213023          	sd	s2,0(sp)
    80002d48:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80002d4c:	08053483          	ld	s1,128(a0)
    while(current != 0){
    80002d50:	0e048463          	beqz	s1,80002e38 <_ZN7_thread6unJoinEv+0x104>
        thread_t thread = current->thread;
    80002d54:	0004c503          	lbu	a0,0(s1)
    80002d58:	0014c783          	lbu	a5,1(s1)
    80002d5c:	00879793          	slli	a5,a5,0x8
    80002d60:	00a7e7b3          	or	a5,a5,a0
    80002d64:	0024c503          	lbu	a0,2(s1)
    80002d68:	01051513          	slli	a0,a0,0x10
    80002d6c:	00f567b3          	or	a5,a0,a5
    80002d70:	0034c503          	lbu	a0,3(s1)
    80002d74:	01851513          	slli	a0,a0,0x18
    80002d78:	00f56533          	or	a0,a0,a5
    80002d7c:	0044c783          	lbu	a5,4(s1)
    80002d80:	02079793          	slli	a5,a5,0x20
    80002d84:	00a7e533          	or	a0,a5,a0
    80002d88:	0054c783          	lbu	a5,5(s1)
    80002d8c:	02879793          	slli	a5,a5,0x28
    80002d90:	00a7e7b3          	or	a5,a5,a0
    80002d94:	0064c503          	lbu	a0,6(s1)
    80002d98:	03051513          	slli	a0,a0,0x30
    80002d9c:	00f567b3          	or	a5,a0,a5
    80002da0:	0074c503          	lbu	a0,7(s1)
    80002da4:	03851513          	slli	a0,a0,0x38
    80002da8:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80002dac:	0a053783          	ld	a5,160(a0)
    80002db0:	ffd7f793          	andi	a5,a5,-3
    80002db4:	0af53023          	sd	a5,160(a0)
        Scheduler::put(thread);
    80002db8:	00002097          	auipc	ra,0x2
    80002dbc:	5b4080e7          	jalr	1460(ra) # 8000536c <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80002dc0:	0084c903          	lbu	s2,8(s1)
    80002dc4:	0094c783          	lbu	a5,9(s1)
    80002dc8:	00879793          	slli	a5,a5,0x8
    80002dcc:	0127e7b3          	or	a5,a5,s2
    80002dd0:	00a4c903          	lbu	s2,10(s1)
    80002dd4:	01091913          	slli	s2,s2,0x10
    80002dd8:	00f967b3          	or	a5,s2,a5
    80002ddc:	00b4c903          	lbu	s2,11(s1)
    80002de0:	01891913          	slli	s2,s2,0x18
    80002de4:	00f96933          	or	s2,s2,a5
    80002de8:	00c4c783          	lbu	a5,12(s1)
    80002dec:	02079793          	slli	a5,a5,0x20
    80002df0:	0127e933          	or	s2,a5,s2
    80002df4:	00d4c783          	lbu	a5,13(s1)
    80002df8:	02879793          	slli	a5,a5,0x28
    80002dfc:	0127e7b3          	or	a5,a5,s2
    80002e00:	00e4c903          	lbu	s2,14(s1)
    80002e04:	03091913          	slli	s2,s2,0x30
    80002e08:	00f967b3          	or	a5,s2,a5
    80002e0c:	00f4c903          	lbu	s2,15(s1)
    80002e10:	03891913          	slli	s2,s2,0x38
    80002e14:	00f96933          	or	s2,s2,a5
        HeapManager::getInstance().heapFree(current);
    80002e18:	00048593          	mv	a1,s1
    80002e1c:	0000b797          	auipc	a5,0xb
    80002e20:	2c47b783          	ld	a5,708(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002e24:	0007b503          	ld	a0,0(a5)
    80002e28:	00001097          	auipc	ra,0x1
    80002e2c:	fe0080e7          	jalr	-32(ra) # 80003e08 <_ZN11HeapManager8heapFreeEPv>
        current = next;
    80002e30:	00090493          	mv	s1,s2
    while(current != 0){
    80002e34:	f1dff06f          	j	80002d50 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80002e38:	01813083          	ld	ra,24(sp)
    80002e3c:	01013403          	ld	s0,16(sp)
    80002e40:	00813483          	ld	s1,8(sp)
    80002e44:	00013903          	ld	s2,0(sp)
    80002e48:	02010113          	addi	sp,sp,32
    80002e4c:	00008067          	ret

0000000080002e50 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80002e50:	fc010113          	addi	sp,sp,-64
    80002e54:	02113c23          	sd	ra,56(sp)
    80002e58:	02813823          	sd	s0,48(sp)
    80002e5c:	02913423          	sd	s1,40(sp)
    80002e60:	03213023          	sd	s2,32(sp)
    80002e64:	01313c23          	sd	s3,24(sp)
    80002e68:	01413823          	sd	s4,16(sp)
    80002e6c:	01513423          	sd	s5,8(sp)
    80002e70:	04010413          	addi	s0,sp,64
    80002e74:	00050493          	mv	s1,a0
    80002e78:	00058913          	mv	s2,a1
    80002e7c:	00060a93          	mv	s5,a2
    80002e80:	00068993          	mv	s3,a3
    80002e84:	00070a13          	mv	s4,a4

    *thread = (_thread*)HeapManager::getInstance().heapAllocate((sizeof(_thread) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80002e88:	00300593          	li	a1,3
    80002e8c:	0000b797          	auipc	a5,0xb
    80002e90:	2547b783          	ld	a5,596(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002e94:	0007b503          	ld	a0,0(a5)
    80002e98:	00001097          	auipc	ra,0x1
    80002e9c:	8f0080e7          	jalr	-1808(ra) # 80003788 <_ZN11HeapManager12heapAllocateEm>
    80002ea0:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80002ea4:	18050263          	beqz	a0,80003028 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1d8>
        return -1;
    }
    (*thread)->function = function;
    80002ea8:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    80002eac:	0004b783          	ld	a5,0(s1)
    80002eb0:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80002eb4:	0000b717          	auipc	a4,0xb
    80002eb8:	2bc70713          	addi	a4,a4,700 # 8000e170 <_ZN7_thread6nextIDE>
    80002ebc:	00072783          	lw	a5,0(a4)
    80002ec0:	0017869b          	addiw	a3,a5,1
    80002ec4:	00d72023          	sw	a3,0(a4)
    80002ec8:	0004b703          	ld	a4,0(s1)
    80002ecc:	00f72023          	sw	a5,0(a4)
    (*thread)->closed = false;
    80002ed0:	0004b703          	ld	a4,0(s1)
    80002ed4:	0a073783          	ld	a5,160(a4)
    80002ed8:	ffe7f793          	andi	a5,a5,-2
    80002edc:	0af73023          	sd	a5,160(a4)
    (*thread)->blocked = false;
    80002ee0:	0004b703          	ld	a4,0(s1)
    80002ee4:	0a073783          	ld	a5,160(a4)
    80002ee8:	ffd7f793          	andi	a5,a5,-3
    80002eec:	0af73023          	sd	a5,160(a4)
    (*thread)->sleeping = false;
    80002ef0:	0004b703          	ld	a4,0(s1)
    80002ef4:	0a073783          	ld	a5,160(a4)
    80002ef8:	ffb7f793          	andi	a5,a5,-5
    80002efc:	0af73023          	sd	a5,160(a4)
    (*thread)->finished = false;
    80002f00:	0004b703          	ld	a4,0(s1)
    80002f04:	0a073783          	ld	a5,160(a4)
    80002f08:	ff77f793          	andi	a5,a5,-9
    80002f0c:	0af73023          	sd	a5,160(a4)
    (*thread)->kernel = (function == 0);
    80002f10:	0004b703          	ld	a4,0(s1)
    80002f14:	00193913          	seqz	s2,s2
    80002f18:	00491913          	slli	s2,s2,0x4
    80002f1c:	0a073783          	ld	a5,160(a4)
    80002f20:	fef7f793          	andi	a5,a5,-17
    80002f24:	0127e933          	or	s2,a5,s2
    80002f28:	0b273023          	sd	s2,160(a4)
    (*thread)->reserved = 0;
    80002f2c:	0004b703          	ld	a4,0(s1)
    80002f30:	0a073783          	ld	a5,160(a4)
    80002f34:	00008697          	auipc	a3,0x8
    80002f38:	1e46b683          	ld	a3,484(a3) # 8000b118 <CONSOLE_STATUS+0x108>
    80002f3c:	00d7f7b3          	and	a5,a5,a3
    80002f40:	0af73023          	sd	a5,160(a4)
    (*thread)->joinHead = 0;
    80002f44:	0004b783          	ld	a5,0(s1)
    80002f48:	0807b023          	sd	zero,128(a5)
    (*thread)->joinTail = 0;
    80002f4c:	0004b783          	ld	a5,0(s1)
    80002f50:	0807b423          	sd	zero,136(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    80002f54:	0004b783          	ld	a5,0(s1)
    80002f58:	00200713          	li	a4,2
    80002f5c:	08e7b823          	sd	a4,144(a5)
    (*thread)->stackStart = 0;
    80002f60:	0004b783          	ld	a5,0(s1)
    80002f64:	0807bc23          	sd	zero,152(a5)

    (*thread)->context.s0 = 0;
    80002f68:	0004b783          	ld	a5,0(s1)
    80002f6c:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s1 = 0;
    80002f70:	0004b783          	ld	a5,0(s1)
    80002f74:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s2 = 0;
    80002f78:	0004b783          	ld	a5,0(s1)
    80002f7c:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s3 = 0;
    80002f80:	0004b783          	ld	a5,0(s1)
    80002f84:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s4 = 0;
    80002f88:	0004b783          	ld	a5,0(s1)
    80002f8c:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s5 = 0;
    80002f90:	0004b783          	ld	a5,0(s1)
    80002f94:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s6 = 0;
    80002f98:	0004b783          	ld	a5,0(s1)
    80002f9c:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s7 = 0;
    80002fa0:	0004b783          	ld	a5,0(s1)
    80002fa4:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s8 = 0;
    80002fa8:	0004b783          	ld	a5,0(s1)
    80002fac:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s9 = 0;
    80002fb0:	0004b783          	ld	a5,0(s1)
    80002fb4:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s10 = 0;
    80002fb8:	0004b783          	ld	a5,0(s1)
    80002fbc:	0607b423          	sd	zero,104(a5)
    (*thread)->context.s11 = 0;
    80002fc0:	0004b783          	ld	a5,0(s1)
    80002fc4:	0607b823          	sd	zero,112(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80002fc8:	0004b783          	ld	a5,0(s1)
    80002fcc:	0137b823          	sd	s3,16(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80002fd0:	0004b783          	ld	a5,0(s1)
    80002fd4:	00000717          	auipc	a4,0x0
    80002fd8:	45c70713          	addi	a4,a4,1116 # 80003430 <_ZN7_thread7wrapperEv>
    80002fdc:	00e7b423          	sd	a4,8(a5)

    (*thread)->stackStart = stack;
    80002fe0:	0004b783          	ld	a5,0(s1)
    80002fe4:	0937bc23          	sd	s3,152(a5)
    // ConsoleManager::putc('C');
    // ConsoleManager::putc((*thread)->ID + '0');
    // ConsoleManager::putc('\n');
    if(start){
    80002fe8:	020a1663          	bnez	s4,80003014 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c4>
        Scheduler::put(*thread);
    }
    return 0;
    80002fec:	00000513          	li	a0,0
}
    80002ff0:	03813083          	ld	ra,56(sp)
    80002ff4:	03013403          	ld	s0,48(sp)
    80002ff8:	02813483          	ld	s1,40(sp)
    80002ffc:	02013903          	ld	s2,32(sp)
    80003000:	01813983          	ld	s3,24(sp)
    80003004:	01013a03          	ld	s4,16(sp)
    80003008:	00813a83          	ld	s5,8(sp)
    8000300c:	04010113          	addi	sp,sp,64
    80003010:	00008067          	ret
        Scheduler::put(*thread);
    80003014:	0004b503          	ld	a0,0(s1)
    80003018:	00002097          	auipc	ra,0x2
    8000301c:	354080e7          	jalr	852(ra) # 8000536c <_ZN9Scheduler3putEP7_thread>
    return 0;
    80003020:	00000513          	li	a0,0
    80003024:	fcdff06f          	j	80002ff0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1a0>
        return -1;
    80003028:	fff00513          	li	a0,-1
    8000302c:	fc5ff06f          	j	80002ff0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1a0>

0000000080003030 <_ZN7_thread10setBlockedEb>:
    ConsoleManager::putc('x');
    dispatch();
    return 0;
}

void _thread::setBlocked(bool blocked){
    80003030:	ff010113          	addi	sp,sp,-16
    80003034:	00813423          	sd	s0,8(sp)
    80003038:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    8000303c:	0015f593          	andi	a1,a1,1
    80003040:	00159793          	slli	a5,a1,0x1
    80003044:	0a053583          	ld	a1,160(a0)
    80003048:	ffd5f593          	andi	a1,a1,-3
    8000304c:	00f5e5b3          	or	a1,a1,a5
    80003050:	0ab53023          	sd	a1,160(a0)
}
    80003054:	00813403          	ld	s0,8(sp)
    80003058:	01010113          	addi	sp,sp,16
    8000305c:	00008067          	ret

0000000080003060 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80003060:	ff010113          	addi	sp,sp,-16
    80003064:	00813423          	sd	s0,8(sp)
    80003068:	01010413          	addi	s0,sp,16
    this->closed = closed;
    8000306c:	0015f793          	andi	a5,a1,1
    80003070:	0a053583          	ld	a1,160(a0)
    80003074:	ffe5f593          	andi	a1,a1,-2
    80003078:	00f5e5b3          	or	a1,a1,a5
    8000307c:	0ab53023          	sd	a1,160(a0)
}
    80003080:	00813403          	ld	s0,8(sp)
    80003084:	01010113          	addi	sp,sp,16
    80003088:	00008067          	ret

000000008000308c <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    8000308c:	ff010113          	addi	sp,sp,-16
    80003090:	00813423          	sd	s0,8(sp)
    80003094:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    80003098:	0015f593          	andi	a1,a1,1
    8000309c:	00259793          	slli	a5,a1,0x2
    800030a0:	0a053583          	ld	a1,160(a0)
    800030a4:	ffb5f593          	andi	a1,a1,-5
    800030a8:	00f5e5b3          	or	a1,a1,a5
    800030ac:	0ab53023          	sd	a1,160(a0)
}
    800030b0:	00813403          	ld	s0,8(sp)
    800030b4:	01010113          	addi	sp,sp,16
    800030b8:	00008067          	ret

00000000800030bc <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
        Scheduler::put(oldThread);
    }
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    800030bc:	ff010113          	addi	sp,sp,-16
    800030c0:	00813423          	sd	s0,8(sp)
    800030c4:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    800030c8:	04050263          	beqz	a0,8000310c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    800030cc:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    800030d0:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    800030d4:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    800030d8:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    800030dc:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    800030e0:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    800030e4:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    800030e8:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    800030ec:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    800030f0:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    800030f4:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    800030f8:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    800030fc:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    80003100:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80003104:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    80003108:	06853823          	sd	s0,112(a0)
    }
    
    
    __asm__ volatile ("ld sp, 8(a1)");
    8000310c:	0085b103          	ld	sp,8(a1)
    __asm__ volatile ("ld ra, 0(a1)");
    80003110:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    80003114:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    80003118:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    8000311c:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    80003120:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80003124:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80003128:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    8000312c:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80003130:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80003134:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80003138:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    8000313c:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    80003140:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    80003144:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    80003148:	0685bd83          	ld	s11,104(a1)

    return;
}
    8000314c:	00813403          	ld	s0,8(sp)
    80003150:	01010113          	addi	sp,sp,16
    80003154:	00008067          	ret

0000000080003158 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80003158:	fe010113          	addi	sp,sp,-32
    8000315c:	00113c23          	sd	ra,24(sp)
    80003160:	00813823          	sd	s0,16(sp)
    80003164:	00913423          	sd	s1,8(sp)
    80003168:	01213023          	sd	s2,0(sp)
    8000316c:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    80003170:	0000b917          	auipc	s2,0xb
    80003174:	00090913          	mv	s2,s2
    80003178:	00893483          	ld	s1,8(s2) # 8000e178 <_ZN7_thread13currentThreadE>
    currentThread =  Scheduler::get();
    8000317c:	00002097          	auipc	ra,0x2
    80003180:	3f8080e7          	jalr	1016(ra) # 80005574 <_ZN9Scheduler3getEv>
    80003184:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    80003188:	00200793          	li	a5,2
    8000318c:	08f4b823          	sd	a5,144(s1)
    if(currentThread == 0){
    80003190:	04050663          	beqz	a0,800031dc <_ZN7_thread8dispatchEv+0x84>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80003194:	00048863          	beqz	s1,800031a4 <_ZN7_thread8dispatchEv+0x4c>
    80003198:	0a04b783          	ld	a5,160(s1)
    8000319c:	00f7f793          	andi	a5,a5,15
    800031a0:	04078463          	beqz	a5,800031e8 <_ZN7_thread8dispatchEv+0x90>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    800031a4:	00048463          	beqz	s1,800031ac <_ZN7_thread8dispatchEv+0x54>
    800031a8:	00848493          	addi	s1,s1,8
    800031ac:	0000b597          	auipc	a1,0xb
    800031b0:	fcc5b583          	ld	a1,-52(a1) # 8000e178 <_ZN7_thread13currentThreadE>
    800031b4:	00858593          	addi	a1,a1,8
    800031b8:	00048513          	mv	a0,s1
    800031bc:	00000097          	auipc	ra,0x0
    800031c0:	f00080e7          	jalr	-256(ra) # 800030bc <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    800031c4:	01813083          	ld	ra,24(sp)
    800031c8:	01013403          	ld	s0,16(sp)
    800031cc:	00813483          	ld	s1,8(sp)
    800031d0:	00013903          	ld	s2,0(sp)
    800031d4:	02010113          	addi	sp,sp,32
    800031d8:	00008067          	ret
        currentThread = oldThread;
    800031dc:	0000b797          	auipc	a5,0xb
    800031e0:	f897be23          	sd	s1,-100(a5) # 8000e178 <_ZN7_thread13currentThreadE>
        return;
    800031e4:	fe1ff06f          	j	800031c4 <_ZN7_thread8dispatchEv+0x6c>
        Scheduler::put(oldThread);
    800031e8:	00048513          	mv	a0,s1
    800031ec:	00002097          	auipc	ra,0x2
    800031f0:	180080e7          	jalr	384(ra) # 8000536c <_ZN9Scheduler3putEP7_thread>
    800031f4:	fb1ff06f          	j	800031a4 <_ZN7_thread8dispatchEv+0x4c>

00000000800031f8 <_ZN7_thread4joinEPS_>:
    if(thread->finished || thread->closed){
    800031f8:	0a05b783          	ld	a5,160(a1)
    800031fc:	0097f793          	andi	a5,a5,9
    80003200:	00078463          	beqz	a5,80003208 <_ZN7_thread4joinEPS_+0x10>
    80003204:	00008067          	ret
void _thread::join(thread_t thread){
    80003208:	fe010113          	addi	sp,sp,-32
    8000320c:	00113c23          	sd	ra,24(sp)
    80003210:	00813823          	sd	s0,16(sp)
    80003214:	00913423          	sd	s1,8(sp)
    80003218:	01213023          	sd	s2,0(sp)
    8000321c:	02010413          	addi	s0,sp,32
    80003220:	00050493          	mv	s1,a0
    80003224:	00058913          	mv	s2,a1
    ThreadJoinList* newJoin = (ThreadJoinList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadJoinList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80003228:	00100593          	li	a1,1
    8000322c:	0000b797          	auipc	a5,0xb
    80003230:	eb47b783          	ld	a5,-332(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003234:	0007b503          	ld	a0,0(a5)
    80003238:	00000097          	auipc	ra,0x0
    8000323c:	550080e7          	jalr	1360(ra) # 80003788 <_ZN11HeapManager12heapAllocateEm>
    this->blocked = true;
    80003240:	0a04b703          	ld	a4,160(s1)
    80003244:	00276713          	ori	a4,a4,2
    80003248:	0ae4b023          	sd	a4,160(s1)
    newJoin->thread = this;
    8000324c:	00950023          	sb	s1,0(a0)
    80003250:	0084d713          	srli	a4,s1,0x8
    80003254:	00e500a3          	sb	a4,1(a0)
    80003258:	0104d713          	srli	a4,s1,0x10
    8000325c:	00e50123          	sb	a4,2(a0)
    80003260:	0184d71b          	srliw	a4,s1,0x18
    80003264:	00e501a3          	sb	a4,3(a0)
    80003268:	0204d713          	srli	a4,s1,0x20
    8000326c:	00e50223          	sb	a4,4(a0)
    80003270:	0284d713          	srli	a4,s1,0x28
    80003274:	00e502a3          	sb	a4,5(a0)
    80003278:	0304d713          	srli	a4,s1,0x30
    8000327c:	00e50323          	sb	a4,6(a0)
    80003280:	0384d493          	srli	s1,s1,0x38
    80003284:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80003288:	00050423          	sb	zero,8(a0)
    8000328c:	000504a3          	sb	zero,9(a0)
    80003290:	00050523          	sb	zero,10(a0)
    80003294:	000505a3          	sb	zero,11(a0)
    80003298:	00050623          	sb	zero,12(a0)
    8000329c:	000506a3          	sb	zero,13(a0)
    800032a0:	00050723          	sb	zero,14(a0)
    800032a4:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    800032a8:	08093703          	ld	a4,128(s2)
    800032ac:	06070463          	beqz	a4,80003314 <_ZN7_thread4joinEPS_+0x11c>
        thread->joinTail->next = newJoin;
    800032b0:	08893703          	ld	a4,136(s2)
    800032b4:	00a70423          	sb	a0,8(a4)
    800032b8:	00855693          	srli	a3,a0,0x8
    800032bc:	00d704a3          	sb	a3,9(a4)
    800032c0:	01055693          	srli	a3,a0,0x10
    800032c4:	00d70523          	sb	a3,10(a4)
    800032c8:	0185569b          	srliw	a3,a0,0x18
    800032cc:	00d705a3          	sb	a3,11(a4)
    800032d0:	02055693          	srli	a3,a0,0x20
    800032d4:	00d70623          	sb	a3,12(a4)
    800032d8:	02855693          	srli	a3,a0,0x28
    800032dc:	00d706a3          	sb	a3,13(a4)
    800032e0:	03055693          	srli	a3,a0,0x30
    800032e4:	00d70723          	sb	a3,14(a4)
    800032e8:	03855693          	srli	a3,a0,0x38
    800032ec:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    800032f0:	08a93423          	sd	a0,136(s2)
    dispatch();
    800032f4:	00000097          	auipc	ra,0x0
    800032f8:	e64080e7          	jalr	-412(ra) # 80003158 <_ZN7_thread8dispatchEv>
}
    800032fc:	01813083          	ld	ra,24(sp)
    80003300:	01013403          	ld	s0,16(sp)
    80003304:	00813483          	ld	s1,8(sp)
    80003308:	00013903          	ld	s2,0(sp)
    8000330c:	02010113          	addi	sp,sp,32
    80003310:	00008067          	ret
        thread->joinHead = newJoin;
    80003314:	08a93023          	sd	a0,128(s2)
        thread->joinTail = newJoin;
    80003318:	08a93423          	sd	a0,136(s2)
    8000331c:	fd9ff06f          	j	800032f4 <_ZN7_thread4joinEPS_+0xfc>

0000000080003320 <_ZN7_thread4tickEv>:
    if(currentThread->blocked){
    80003320:	0000b797          	auipc	a5,0xb
    80003324:	e587b783          	ld	a5,-424(a5) # 8000e178 <_ZN7_thread13currentThreadE>
    80003328:	0a07b783          	ld	a5,160(a5)
    8000332c:	0027f713          	andi	a4,a5,2
    80003330:	06071063          	bnez	a4,80003390 <_ZN7_thread4tickEv+0x70>
    if(currentThread->closed){
    80003334:	0017f713          	andi	a4,a5,1
    80003338:	06071063          	bnez	a4,80003398 <_ZN7_thread4tickEv+0x78>
    if(currentThread->sleeping){
    8000333c:	0047f713          	andi	a4,a5,4
    80003340:	06071063          	bnez	a4,800033a0 <_ZN7_thread4tickEv+0x80>
    if(currentThread->finished){
    80003344:	0087f793          	andi	a5,a5,8
    80003348:	06079063          	bnez	a5,800033a8 <_ZN7_thread4tickEv+0x88>
    timeLeft --;
    8000334c:	09053783          	ld	a5,144(a0)
    80003350:	fff78793          	addi	a5,a5,-1
    80003354:	08f53823          	sd	a5,144(a0)
    if(timeLeft == 0){
    80003358:	00078663          	beqz	a5,80003364 <_ZN7_thread4tickEv+0x44>
    return 0;
    8000335c:	00000513          	li	a0,0
}
    80003360:	00008067          	ret
int _thread::tick(){
    80003364:	ff010113          	addi	sp,sp,-16
    80003368:	00113423          	sd	ra,8(sp)
    8000336c:	00813023          	sd	s0,0(sp)
    80003370:	01010413          	addi	s0,sp,16
        dispatch();
    80003374:	00000097          	auipc	ra,0x0
    80003378:	de4080e7          	jalr	-540(ra) # 80003158 <_ZN7_thread8dispatchEv>
    return 0;
    8000337c:	00000513          	li	a0,0
}
    80003380:	00813083          	ld	ra,8(sp)
    80003384:	00013403          	ld	s0,0(sp)
    80003388:	01010113          	addi	sp,sp,16
    8000338c:	00008067          	ret
        return -1;
    80003390:	fff00513          	li	a0,-1
    80003394:	00008067          	ret
        return -2;
    80003398:	ffe00513          	li	a0,-2
    8000339c:	00008067          	ret
        return -3;
    800033a0:	ffd00513          	li	a0,-3
    800033a4:	00008067          	ret
        return -4;
    800033a8:	ffc00513          	li	a0,-4
    800033ac:	00008067          	ret

00000000800033b0 <_ZN7_thread4exitEv>:
    if(currentThread->closed){
    800033b0:	0000b717          	auipc	a4,0xb
    800033b4:	dc873703          	ld	a4,-568(a4) # 8000e178 <_ZN7_thread13currentThreadE>
    800033b8:	0a073783          	ld	a5,160(a4)
    800033bc:	0017f693          	andi	a3,a5,1
    800033c0:	04069c63          	bnez	a3,80003418 <_ZN7_thread4exitEv+0x68>
    if(currentThread->blocked){
    800033c4:	0027f693          	andi	a3,a5,2
    800033c8:	04069c63          	bnez	a3,80003420 <_ZN7_thread4exitEv+0x70>
    if(currentThread->sleeping){
    800033cc:	0047f793          	andi	a5,a5,4
    800033d0:	04079c63          	bnez	a5,80003428 <_ZN7_thread4exitEv+0x78>
int _thread::exit(){
    800033d4:	ff010113          	addi	sp,sp,-16
    800033d8:	00113423          	sd	ra,8(sp)
    800033dc:	00813023          	sd	s0,0(sp)
    800033e0:	01010413          	addi	s0,sp,16
    currentThread->finished = 1;
    800033e4:	0a073783          	ld	a5,160(a4)
    800033e8:	0087e793          	ori	a5,a5,8
    800033ec:	0af73023          	sd	a5,160(a4)
    ConsoleManager::putc('x');
    800033f0:	07800513          	li	a0,120
    800033f4:	00001097          	auipc	ra,0x1
    800033f8:	6dc080e7          	jalr	1756(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
    dispatch();
    800033fc:	00000097          	auipc	ra,0x0
    80003400:	d5c080e7          	jalr	-676(ra) # 80003158 <_ZN7_thread8dispatchEv>
    return 0;
    80003404:	00000513          	li	a0,0
}
    80003408:	00813083          	ld	ra,8(sp)
    8000340c:	00013403          	ld	s0,0(sp)
    80003410:	01010113          	addi	sp,sp,16
    80003414:	00008067          	ret
        return -1;
    80003418:	fff00513          	li	a0,-1
    8000341c:	00008067          	ret
        return -2;
    80003420:	ffe00513          	li	a0,-2
    80003424:	00008067          	ret
        return -3;
    80003428:	ffd00513          	li	a0,-3
}
    8000342c:	00008067          	ret

0000000080003430 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80003430:	fe010113          	addi	sp,sp,-32
    80003434:	00113c23          	sd	ra,24(sp)
    80003438:	00813823          	sd	s0,16(sp)
    8000343c:	00913423          	sd	s1,8(sp)
    80003440:	02010413          	addi	s0,sp,32
    popSppSpie();
    80003444:	00000097          	auipc	ra,0x0
    80003448:	8c8080e7          	jalr	-1848(ra) # 80002d0c <_Z10popSppSpiev>
    currentThread->function(currentThread->arg);
    8000344c:	0000b497          	auipc	s1,0xb
    80003450:	d2448493          	addi	s1,s1,-732 # 8000e170 <_ZN7_thread6nextIDE>
    80003454:	0084b783          	ld	a5,8(s1)
    80003458:	0a87b703          	ld	a4,168(a5)
    8000345c:	0b07b503          	ld	a0,176(a5)
    80003460:	000700e7          	jalr	a4
    currentThread->unJoin();
    80003464:	0084b503          	ld	a0,8(s1)
    80003468:	00000097          	auipc	ra,0x0
    8000346c:	8cc080e7          	jalr	-1844(ra) # 80002d34 <_ZN7_thread6unJoinEv>
    exit();
    80003470:	00000097          	auipc	ra,0x0
    80003474:	f40080e7          	jalr	-192(ra) # 800033b0 <_ZN7_thread4exitEv>
}
    80003478:	01813083          	ld	ra,24(sp)
    8000347c:	01013403          	ld	s0,16(sp)
    80003480:	00813483          	ld	s1,8(sp)
    80003484:	02010113          	addi	sp,sp,32
    80003488:	00008067          	ret

000000008000348c <_ZN11HeapManagerC1Ev>:
#include "heapManager.h"
#include "consoleManager.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    8000348c:	fe010113          	addi	sp,sp,-32
    80003490:	00113c23          	sd	ra,24(sp)
    80003494:	00813823          	sd	s0,16(sp)
    80003498:	00913423          	sd	s1,8(sp)
    8000349c:	02010413          	addi	s0,sp,32
    800034a0:	00050493          	mv	s1,a0
    assert(instance == 0);
    800034a4:	0000b797          	auipc	a5,0xb
    800034a8:	cdc7b783          	ld	a5,-804(a5) # 8000e180 <_ZN11HeapManager8instanceE>
    800034ac:	02079063          	bnez	a5,800034cc <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    800034b0:	0000b797          	auipc	a5,0xb
    800034b4:	cc97b823          	sd	s1,-816(a5) # 8000e180 <_ZN11HeapManager8instanceE>
}
    800034b8:	01813083          	ld	ra,24(sp)
    800034bc:	01013403          	ld	s0,16(sp)
    800034c0:	00813483          	ld	s1,8(sp)
    800034c4:	02010113          	addi	sp,sp,32
    800034c8:	00008067          	ret
    assert(instance == 0);
    800034cc:	00008697          	auipc	a3,0x8
    800034d0:	c5468693          	addi	a3,a3,-940 # 8000b120 <CONSOLE_STATUS+0x110>
    800034d4:	01200613          	li	a2,18
    800034d8:	00008597          	auipc	a1,0x8
    800034dc:	c6858593          	addi	a1,a1,-920 # 8000b140 <CONSOLE_STATUS+0x130>
    800034e0:	00008517          	auipc	a0,0x8
    800034e4:	b6050513          	addi	a0,a0,-1184 # 8000b040 <CONSOLE_STATUS+0x30>
    800034e8:	fffff097          	auipc	ra,0xfffff
    800034ec:	bb4080e7          	jalr	-1100(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    800034f0:	fc1ff06f          	j	800034b0 <_ZN11HeapManagerC1Ev+0x24>

00000000800034f4 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    800034f4:	ff010113          	addi	sp,sp,-16
    800034f8:	00813423          	sd	s0,8(sp)
    800034fc:	01010413          	addi	s0,sp,16
    
}
    80003500:	00813403          	ld	s0,8(sp)
    80003504:	01010113          	addi	sp,sp,16
    80003508:	00008067          	ret

000000008000350c <_ZN11HeapManager4initEmm>:

void HeapManager::init(uint64 nStart, size_t nEnd){
    8000350c:	fd010113          	addi	sp,sp,-48
    80003510:	02113423          	sd	ra,40(sp)
    80003514:	02813023          	sd	s0,32(sp)
    80003518:	00913c23          	sd	s1,24(sp)
    8000351c:	01213823          	sd	s2,16(sp)
    80003520:	01313423          	sd	s3,8(sp)
    80003524:	03010413          	addi	s0,sp,48
    80003528:	00050993          	mv	s3,a0
    8000352c:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003530:	40b604b3          	sub	s1,a2,a1
    80003534:	0414b793          	sltiu	a5,s1,65
    80003538:	0c079863          	bnez	a5,80003608 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    8000353c:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80003540:	fde00793          	li	a5,-34
    80003544:	00f90c23          	sb	a5,24(s2)
    80003548:	fc000713          	li	a4,-64
    8000354c:	00e90ca3          	sb	a4,25(s2)
    80003550:	fad00713          	li	a4,-83
    80003554:	00e90d23          	sb	a4,26(s2)
    80003558:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    8000355c:	0064d613          	srli	a2,s1,0x6
    80003560:	0009b783          	ld	a5,0(s3)
    80003564:	fff60613          	addi	a2,a2,-1
    80003568:	00c78823          	sb	a2,16(a5)
    8000356c:	00865713          	srli	a4,a2,0x8
    80003570:	00e788a3          	sb	a4,17(a5)
    80003574:	01065713          	srli	a4,a2,0x10
    80003578:	00e78923          	sb	a4,18(a5)
    8000357c:	0186571b          	srliw	a4,a2,0x18
    80003580:	00e789a3          	sb	a4,19(a5)
    80003584:	02065713          	srli	a4,a2,0x20
    80003588:	00e78a23          	sb	a4,20(a5)
    8000358c:	02865713          	srli	a4,a2,0x28
    80003590:	00e78aa3          	sb	a4,21(a5)
    80003594:	03065713          	srli	a4,a2,0x30
    80003598:	00e78b23          	sb	a4,22(a5)
    8000359c:	03865613          	srli	a2,a2,0x38
    800035a0:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    800035a4:	0009b783          	ld	a5,0(s3)
    800035a8:	00078023          	sb	zero,0(a5)
    800035ac:	000780a3          	sb	zero,1(a5)
    800035b0:	00078123          	sb	zero,2(a5)
    800035b4:	000781a3          	sb	zero,3(a5)
    800035b8:	00078223          	sb	zero,4(a5)
    800035bc:	000782a3          	sb	zero,5(a5)
    800035c0:	00078323          	sb	zero,6(a5)
    800035c4:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    800035c8:	0009b783          	ld	a5,0(s3)
    800035cc:	00078423          	sb	zero,8(a5)
    800035d0:	000784a3          	sb	zero,9(a5)
    800035d4:	00078523          	sb	zero,10(a5)
    800035d8:	000785a3          	sb	zero,11(a5)
    800035dc:	00078623          	sb	zero,12(a5)
    800035e0:	000786a3          	sb	zero,13(a5)
    800035e4:	00078723          	sb	zero,14(a5)
    800035e8:	000787a3          	sb	zero,15(a5)
}
    800035ec:	02813083          	ld	ra,40(sp)
    800035f0:	02013403          	ld	s0,32(sp)
    800035f4:	01813483          	ld	s1,24(sp)
    800035f8:	01013903          	ld	s2,16(sp)
    800035fc:	00813983          	ld	s3,8(sp)
    80003600:	03010113          	addi	sp,sp,48
    80003604:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003608:	00008697          	auipc	a3,0x8
    8000360c:	b5068693          	addi	a3,a3,-1200 # 8000b158 <CONSOLE_STATUS+0x148>
    80003610:	01b00613          	li	a2,27
    80003614:	00008597          	auipc	a1,0x8
    80003618:	b2c58593          	addi	a1,a1,-1236 # 8000b140 <CONSOLE_STATUS+0x130>
    8000361c:	00008517          	auipc	a0,0x8
    80003620:	b6450513          	addi	a0,a0,-1180 # 8000b180 <CONSOLE_STATUS+0x170>
    80003624:	fffff097          	auipc	ra,0xfffff
    80003628:	a78080e7          	jalr	-1416(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    8000362c:	f11ff06f          	j	8000353c <_ZN11HeapManager4initEmm+0x30>

0000000080003630 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80003630:	fe010113          	addi	sp,sp,-32
    80003634:	00113c23          	sd	ra,24(sp)
    80003638:	00813823          	sd	s0,16(sp)
    8000363c:	00913423          	sd	s1,8(sp)
    80003640:	01213023          	sd	s2,0(sp)
    80003644:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003648:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    8000364c:	00000913          	li	s2,0
    80003650:	0b80006f          	j	80003708 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80003654:	0104c783          	lbu	a5,16(s1)
    80003658:	0114c703          	lbu	a4,17(s1)
    8000365c:	00871713          	slli	a4,a4,0x8
    80003660:	00f76733          	or	a4,a4,a5
    80003664:	0124c783          	lbu	a5,18(s1)
    80003668:	01079793          	slli	a5,a5,0x10
    8000366c:	00e7e733          	or	a4,a5,a4
    80003670:	0134c783          	lbu	a5,19(s1)
    80003674:	01879793          	slli	a5,a5,0x18
    80003678:	00e7e7b3          	or	a5,a5,a4
    8000367c:	0144c703          	lbu	a4,20(s1)
    80003680:	02071713          	slli	a4,a4,0x20
    80003684:	00f767b3          	or	a5,a4,a5
    80003688:	0154c703          	lbu	a4,21(s1)
    8000368c:	02871713          	slli	a4,a4,0x28
    80003690:	00f76733          	or	a4,a4,a5
    80003694:	0164c783          	lbu	a5,22(s1)
    80003698:	03079793          	slli	a5,a5,0x30
    8000369c:	00e7e733          	or	a4,a5,a4
    800036a0:	0174c783          	lbu	a5,23(s1)
    800036a4:	03879793          	slli	a5,a5,0x38
    800036a8:	00e7e7b3          	or	a5,a5,a4
    800036ac:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    800036b0:	0004c703          	lbu	a4,0(s1)
    800036b4:	0014c783          	lbu	a5,1(s1)
    800036b8:	00879793          	slli	a5,a5,0x8
    800036bc:	00e7e733          	or	a4,a5,a4
    800036c0:	0024c783          	lbu	a5,2(s1)
    800036c4:	01079793          	slli	a5,a5,0x10
    800036c8:	00e7e7b3          	or	a5,a5,a4
    800036cc:	0034c703          	lbu	a4,3(s1)
    800036d0:	01871713          	slli	a4,a4,0x18
    800036d4:	00f767b3          	or	a5,a4,a5
    800036d8:	0044c703          	lbu	a4,4(s1)
    800036dc:	02071713          	slli	a4,a4,0x20
    800036e0:	00f76733          	or	a4,a4,a5
    800036e4:	0054c783          	lbu	a5,5(s1)
    800036e8:	02879793          	slli	a5,a5,0x28
    800036ec:	00e7e733          	or	a4,a5,a4
    800036f0:	0064c783          	lbu	a5,6(s1)
    800036f4:	03079793          	slli	a5,a5,0x30
    800036f8:	00e7e7b3          	or	a5,a5,a4
    800036fc:	0074c483          	lbu	s1,7(s1)
    80003700:	03849493          	slli	s1,s1,0x38
    80003704:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003708:	06048263          	beqz	s1,8000376c <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    8000370c:	0184c783          	lbu	a5,24(s1)
    80003710:	0194c703          	lbu	a4,25(s1)
    80003714:	00871713          	slli	a4,a4,0x8
    80003718:	00f76733          	or	a4,a4,a5
    8000371c:	01a4c783          	lbu	a5,26(s1)
    80003720:	01079793          	slli	a5,a5,0x10
    80003724:	00e7e733          	or	a4,a5,a4
    80003728:	01b4c783          	lbu	a5,27(s1)
    8000372c:	01879793          	slli	a5,a5,0x18
    80003730:	00e7e7b3          	or	a5,a5,a4
    80003734:	0007879b          	sext.w	a5,a5
    80003738:	deadc737          	lui	a4,0xdeadc
    8000373c:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eaccc9e>
    80003740:	f0e78ae3          	beq	a5,a4,80003654 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80003744:	00008697          	auipc	a3,0x8
    80003748:	a5c68693          	addi	a3,a3,-1444 # 8000b1a0 <CONSOLE_STATUS+0x190>
    8000374c:	02800613          	li	a2,40
    80003750:	00008597          	auipc	a1,0x8
    80003754:	9f058593          	addi	a1,a1,-1552 # 8000b140 <CONSOLE_STATUS+0x130>
    80003758:	00008517          	auipc	a0,0x8
    8000375c:	a7050513          	addi	a0,a0,-1424 # 8000b1c8 <CONSOLE_STATUS+0x1b8>
    80003760:	fffff097          	auipc	ra,0xfffff
    80003764:	93c080e7          	jalr	-1732(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80003768:	eedff06f          	j	80003654 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    8000376c:	00090513          	mv	a0,s2
    80003770:	01813083          	ld	ra,24(sp)
    80003774:	01013403          	ld	s0,16(sp)
    80003778:	00813483          	ld	s1,8(sp)
    8000377c:	00013903          	ld	s2,0(sp)
    80003780:	02010113          	addi	sp,sp,32
    80003784:	00008067          	ret

0000000080003788 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80003788:	fd010113          	addi	sp,sp,-48
    8000378c:	02113423          	sd	ra,40(sp)
    80003790:	02813023          	sd	s0,32(sp)
    80003794:	00913c23          	sd	s1,24(sp)
    80003798:	01213823          	sd	s2,16(sp)
    8000379c:	01313423          	sd	s3,8(sp)
    800037a0:	03010413          	addi	s0,sp,48
    800037a4:	00050993          	mv	s3,a0
    800037a8:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    800037ac:	00053483          	ld	s1,0(a0)
    800037b0:	0b80006f          	j	80003868 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    800037b4:	0104c783          	lbu	a5,16(s1)
    800037b8:	0114c703          	lbu	a4,17(s1)
    800037bc:	00871713          	slli	a4,a4,0x8
    800037c0:	00f76733          	or	a4,a4,a5
    800037c4:	0124c783          	lbu	a5,18(s1)
    800037c8:	01079793          	slli	a5,a5,0x10
    800037cc:	00e7e733          	or	a4,a5,a4
    800037d0:	0134c783          	lbu	a5,19(s1)
    800037d4:	01879793          	slli	a5,a5,0x18
    800037d8:	00e7e7b3          	or	a5,a5,a4
    800037dc:	0144c703          	lbu	a4,20(s1)
    800037e0:	02071713          	slli	a4,a4,0x20
    800037e4:	00f767b3          	or	a5,a4,a5
    800037e8:	0154c703          	lbu	a4,21(s1)
    800037ec:	02871713          	slli	a4,a4,0x28
    800037f0:	00f76733          	or	a4,a4,a5
    800037f4:	0164c783          	lbu	a5,22(s1)
    800037f8:	03079793          	slli	a5,a5,0x30
    800037fc:	00e7e733          	or	a4,a5,a4
    80003800:	0174c783          	lbu	a5,23(s1)
    80003804:	03879793          	slli	a5,a5,0x38
    80003808:	00e7e7b3          	or	a5,a5,a4
    8000380c:	0d27f063          	bgeu	a5,s2,800038cc <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80003810:	0004c703          	lbu	a4,0(s1)
    80003814:	0014c783          	lbu	a5,1(s1)
    80003818:	00879793          	slli	a5,a5,0x8
    8000381c:	00e7e733          	or	a4,a5,a4
    80003820:	0024c783          	lbu	a5,2(s1)
    80003824:	01079793          	slli	a5,a5,0x10
    80003828:	00e7e7b3          	or	a5,a5,a4
    8000382c:	0034c703          	lbu	a4,3(s1)
    80003830:	01871713          	slli	a4,a4,0x18
    80003834:	00f767b3          	or	a5,a4,a5
    80003838:	0044c703          	lbu	a4,4(s1)
    8000383c:	02071713          	slli	a4,a4,0x20
    80003840:	00f76733          	or	a4,a4,a5
    80003844:	0054c783          	lbu	a5,5(s1)
    80003848:	02879793          	slli	a5,a5,0x28
    8000384c:	00e7e733          	or	a4,a5,a4
    80003850:	0064c783          	lbu	a5,6(s1)
    80003854:	03079793          	slli	a5,a5,0x30
    80003858:	00e7e7b3          	or	a5,a5,a4
    8000385c:	0074c483          	lbu	s1,7(s1)
    80003860:	03849493          	slli	s1,s1,0x38
    80003864:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003868:	54048e63          	beqz	s1,80003dc4 <_ZN11HeapManager12heapAllocateEm+0x63c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    8000386c:	0184c783          	lbu	a5,24(s1)
    80003870:	0194c703          	lbu	a4,25(s1)
    80003874:	00871713          	slli	a4,a4,0x8
    80003878:	00f76733          	or	a4,a4,a5
    8000387c:	01a4c783          	lbu	a5,26(s1)
    80003880:	01079793          	slli	a5,a5,0x10
    80003884:	00e7e733          	or	a4,a5,a4
    80003888:	01b4c783          	lbu	a5,27(s1)
    8000388c:	01879793          	slli	a5,a5,0x18
    80003890:	00e7e7b3          	or	a5,a5,a4
    80003894:	0007879b          	sext.w	a5,a5
    80003898:	deadc737          	lui	a4,0xdeadc
    8000389c:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eaccc9e>
    800038a0:	f0e78ae3          	beq	a5,a4,800037b4 <_ZN11HeapManager12heapAllocateEm+0x2c>
    800038a4:	00008697          	auipc	a3,0x8
    800038a8:	94c68693          	addi	a3,a3,-1716 # 8000b1f0 <CONSOLE_STATUS+0x1e0>
    800038ac:	03200613          	li	a2,50
    800038b0:	00008597          	auipc	a1,0x8
    800038b4:	89058593          	addi	a1,a1,-1904 # 8000b140 <CONSOLE_STATUS+0x130>
    800038b8:	00008517          	auipc	a0,0x8
    800038bc:	91050513          	addi	a0,a0,-1776 # 8000b1c8 <CONSOLE_STATUS+0x1b8>
    800038c0:	ffffe097          	auipc	ra,0xffffe
    800038c4:	7dc080e7          	jalr	2012(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    800038c8:	eedff06f          	j	800037b4 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    800038cc:	00190713          	addi	a4,s2,1
    800038d0:	2af77263          	bgeu	a4,a5,80003b74 <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    800038d4:	00671793          	slli	a5,a4,0x6
    800038d8:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    800038dc:	fde00713          	li	a4,-34
    800038e0:	00e78c23          	sb	a4,24(a5)
    800038e4:	fc000693          	li	a3,-64
    800038e8:	00d78ca3          	sb	a3,25(a5)
    800038ec:	fad00693          	li	a3,-83
    800038f0:	00d78d23          	sb	a3,26(a5)
    800038f4:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    800038f8:	0104c703          	lbu	a4,16(s1)
    800038fc:	0114c683          	lbu	a3,17(s1)
    80003900:	00869693          	slli	a3,a3,0x8
    80003904:	00e6e6b3          	or	a3,a3,a4
    80003908:	0124c703          	lbu	a4,18(s1)
    8000390c:	01071713          	slli	a4,a4,0x10
    80003910:	00d766b3          	or	a3,a4,a3
    80003914:	0134c703          	lbu	a4,19(s1)
    80003918:	01871713          	slli	a4,a4,0x18
    8000391c:	00d76733          	or	a4,a4,a3
    80003920:	0144c683          	lbu	a3,20(s1)
    80003924:	02069693          	slli	a3,a3,0x20
    80003928:	00e6e733          	or	a4,a3,a4
    8000392c:	0154c683          	lbu	a3,21(s1)
    80003930:	02869693          	slli	a3,a3,0x28
    80003934:	00e6e6b3          	or	a3,a3,a4
    80003938:	0164c703          	lbu	a4,22(s1)
    8000393c:	03071713          	slli	a4,a4,0x30
    80003940:	00d766b3          	or	a3,a4,a3
    80003944:	0174c703          	lbu	a4,23(s1)
    80003948:	03871713          	slli	a4,a4,0x38
    8000394c:	00d76733          	or	a4,a4,a3
    80003950:	41270733          	sub	a4,a4,s2
    80003954:	fff70713          	addi	a4,a4,-1
    80003958:	00e78823          	sb	a4,16(a5)
    8000395c:	00875693          	srli	a3,a4,0x8
    80003960:	00d788a3          	sb	a3,17(a5)
    80003964:	01075693          	srli	a3,a4,0x10
    80003968:	00d78923          	sb	a3,18(a5)
    8000396c:	0187569b          	srliw	a3,a4,0x18
    80003970:	00d789a3          	sb	a3,19(a5)
    80003974:	02075693          	srli	a3,a4,0x20
    80003978:	00d78a23          	sb	a3,20(a5)
    8000397c:	02875693          	srli	a3,a4,0x28
    80003980:	00d78aa3          	sb	a3,21(a5)
    80003984:	03075693          	srli	a3,a4,0x30
    80003988:	00d78b23          	sb	a3,22(a5)
    8000398c:	03875713          	srli	a4,a4,0x38
    80003990:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80003994:	0004c703          	lbu	a4,0(s1)
    80003998:	0014c683          	lbu	a3,1(s1)
    8000399c:	00869693          	slli	a3,a3,0x8
    800039a0:	00e6e733          	or	a4,a3,a4
    800039a4:	0024c683          	lbu	a3,2(s1)
    800039a8:	01069693          	slli	a3,a3,0x10
    800039ac:	00e6e6b3          	or	a3,a3,a4
    800039b0:	0034c703          	lbu	a4,3(s1)
    800039b4:	01871713          	slli	a4,a4,0x18
    800039b8:	00d766b3          	or	a3,a4,a3
    800039bc:	0044c703          	lbu	a4,4(s1)
    800039c0:	02071713          	slli	a4,a4,0x20
    800039c4:	00d76733          	or	a4,a4,a3
    800039c8:	0054c683          	lbu	a3,5(s1)
    800039cc:	02869693          	slli	a3,a3,0x28
    800039d0:	00e6e733          	or	a4,a3,a4
    800039d4:	0064c683          	lbu	a3,6(s1)
    800039d8:	03069693          	slli	a3,a3,0x30
    800039dc:	00e6e6b3          	or	a3,a3,a4
    800039e0:	0074c703          	lbu	a4,7(s1)
    800039e4:	03871713          	slli	a4,a4,0x38
    800039e8:	00d76733          	or	a4,a4,a3
    800039ec:	00d78023          	sb	a3,0(a5)
    800039f0:	00875693          	srli	a3,a4,0x8
    800039f4:	00d780a3          	sb	a3,1(a5)
    800039f8:	01075693          	srli	a3,a4,0x10
    800039fc:	00d78123          	sb	a3,2(a5)
    80003a00:	0187569b          	srliw	a3,a4,0x18
    80003a04:	00d781a3          	sb	a3,3(a5)
    80003a08:	02075693          	srli	a3,a4,0x20
    80003a0c:	00d78223          	sb	a3,4(a5)
    80003a10:	02875693          	srli	a3,a4,0x28
    80003a14:	00d782a3          	sb	a3,5(a5)
    80003a18:	03075693          	srli	a3,a4,0x30
    80003a1c:	00d78323          	sb	a3,6(a5)
    80003a20:	03875713          	srli	a4,a4,0x38
    80003a24:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80003a28:	00978423          	sb	s1,8(a5)
    80003a2c:	0084d713          	srli	a4,s1,0x8
    80003a30:	00e784a3          	sb	a4,9(a5)
    80003a34:	0104d713          	srli	a4,s1,0x10
    80003a38:	00e78523          	sb	a4,10(a5)
    80003a3c:	0184d71b          	srliw	a4,s1,0x18
    80003a40:	00e785a3          	sb	a4,11(a5)
    80003a44:	0204d713          	srli	a4,s1,0x20
    80003a48:	00e78623          	sb	a4,12(a5)
    80003a4c:	0284d713          	srli	a4,s1,0x28
    80003a50:	00e786a3          	sb	a4,13(a5)
    80003a54:	0304d713          	srli	a4,s1,0x30
    80003a58:	00e78723          	sb	a4,14(a5)
    80003a5c:	0384d713          	srli	a4,s1,0x38
    80003a60:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    80003a64:	0004c703          	lbu	a4,0(s1)
    80003a68:	0014c683          	lbu	a3,1(s1)
    80003a6c:	00869693          	slli	a3,a3,0x8
    80003a70:	00e6e6b3          	or	a3,a3,a4
    80003a74:	0024c703          	lbu	a4,2(s1)
    80003a78:	01071713          	slli	a4,a4,0x10
    80003a7c:	00d766b3          	or	a3,a4,a3
    80003a80:	0034c703          	lbu	a4,3(s1)
    80003a84:	01871713          	slli	a4,a4,0x18
    80003a88:	00d76733          	or	a4,a4,a3
    80003a8c:	0044c683          	lbu	a3,4(s1)
    80003a90:	02069693          	slli	a3,a3,0x20
    80003a94:	00e6e733          	or	a4,a3,a4
    80003a98:	0054c683          	lbu	a3,5(s1)
    80003a9c:	02869693          	slli	a3,a3,0x28
    80003aa0:	00e6e6b3          	or	a3,a3,a4
    80003aa4:	0064c703          	lbu	a4,6(s1)
    80003aa8:	03071713          	slli	a4,a4,0x30
    80003aac:	00d766b3          	or	a3,a4,a3
    80003ab0:	0074c703          	lbu	a4,7(s1)
    80003ab4:	03871713          	slli	a4,a4,0x38
    80003ab8:	00d76733          	or	a4,a4,a3
    80003abc:	04070063          	beqz	a4,80003afc <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003ac0:	00f70423          	sb	a5,8(a4)
    80003ac4:	0087d693          	srli	a3,a5,0x8
    80003ac8:	00d704a3          	sb	a3,9(a4)
    80003acc:	0107d693          	srli	a3,a5,0x10
    80003ad0:	00d70523          	sb	a3,10(a4)
    80003ad4:	0187d69b          	srliw	a3,a5,0x18
    80003ad8:	00d705a3          	sb	a3,11(a4)
    80003adc:	0207d693          	srli	a3,a5,0x20
    80003ae0:	00d70623          	sb	a3,12(a4)
    80003ae4:	0287d693          	srli	a3,a5,0x28
    80003ae8:	00d706a3          	sb	a3,13(a4)
    80003aec:	0307d693          	srli	a3,a5,0x30
    80003af0:	00d70723          	sb	a3,14(a4)
    80003af4:	0387d693          	srli	a3,a5,0x38
    80003af8:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80003afc:	00f48023          	sb	a5,0(s1)
    80003b00:	0087d713          	srli	a4,a5,0x8
    80003b04:	00e480a3          	sb	a4,1(s1)
    80003b08:	0107d713          	srli	a4,a5,0x10
    80003b0c:	00e48123          	sb	a4,2(s1)
    80003b10:	0187d71b          	srliw	a4,a5,0x18
    80003b14:	00e481a3          	sb	a4,3(s1)
    80003b18:	0207d713          	srli	a4,a5,0x20
    80003b1c:	00e48223          	sb	a4,4(s1)
    80003b20:	0287d713          	srli	a4,a5,0x28
    80003b24:	00e482a3          	sb	a4,5(s1)
    80003b28:	0307d713          	srli	a4,a5,0x30
    80003b2c:	00e48323          	sb	a4,6(s1)
    80003b30:	0387d793          	srli	a5,a5,0x38
    80003b34:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80003b38:	01248823          	sb	s2,16(s1)
    80003b3c:	00895793          	srli	a5,s2,0x8
    80003b40:	00f488a3          	sb	a5,17(s1)
    80003b44:	01095793          	srli	a5,s2,0x10
    80003b48:	00f48923          	sb	a5,18(s1)
    80003b4c:	0189579b          	srliw	a5,s2,0x18
    80003b50:	00f489a3          	sb	a5,19(s1)
    80003b54:	02095793          	srli	a5,s2,0x20
    80003b58:	00f48a23          	sb	a5,20(s1)
    80003b5c:	02895793          	srli	a5,s2,0x28
    80003b60:	00f48aa3          	sb	a5,21(s1)
    80003b64:	03095793          	srli	a5,s2,0x30
    80003b68:	00f48b23          	sb	a5,22(s1)
    80003b6c:	03895913          	srli	s2,s2,0x38
    80003b70:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80003b74:	0009b783          	ld	a5,0(s3)
    80003b78:	1e978663          	beq	a5,s1,80003d64 <_ZN11HeapManager12heapAllocateEm+0x5dc>
            if(pCurrent->pPrev != 0){
    80003b7c:	0084c783          	lbu	a5,8(s1)
    80003b80:	0094c703          	lbu	a4,9(s1)
    80003b84:	00871713          	slli	a4,a4,0x8
    80003b88:	00f76733          	or	a4,a4,a5
    80003b8c:	00a4c783          	lbu	a5,10(s1)
    80003b90:	01079793          	slli	a5,a5,0x10
    80003b94:	00e7e733          	or	a4,a5,a4
    80003b98:	00b4c783          	lbu	a5,11(s1)
    80003b9c:	01879793          	slli	a5,a5,0x18
    80003ba0:	00e7e7b3          	or	a5,a5,a4
    80003ba4:	00c4c703          	lbu	a4,12(s1)
    80003ba8:	02071713          	slli	a4,a4,0x20
    80003bac:	00f767b3          	or	a5,a4,a5
    80003bb0:	00d4c703          	lbu	a4,13(s1)
    80003bb4:	02871713          	slli	a4,a4,0x28
    80003bb8:	00f76733          	or	a4,a4,a5
    80003bbc:	00e4c783          	lbu	a5,14(s1)
    80003bc0:	03079793          	slli	a5,a5,0x30
    80003bc4:	00e7e733          	or	a4,a5,a4
    80003bc8:	00f4c783          	lbu	a5,15(s1)
    80003bcc:	03879793          	slli	a5,a5,0x38
    80003bd0:	00e7e7b3          	or	a5,a5,a4
    80003bd4:	08078c63          	beqz	a5,80003c6c <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80003bd8:	0004c703          	lbu	a4,0(s1)
    80003bdc:	0014c683          	lbu	a3,1(s1)
    80003be0:	00869693          	slli	a3,a3,0x8
    80003be4:	00e6e733          	or	a4,a3,a4
    80003be8:	0024c683          	lbu	a3,2(s1)
    80003bec:	01069693          	slli	a3,a3,0x10
    80003bf0:	00e6e6b3          	or	a3,a3,a4
    80003bf4:	0034c703          	lbu	a4,3(s1)
    80003bf8:	01871713          	slli	a4,a4,0x18
    80003bfc:	00d766b3          	or	a3,a4,a3
    80003c00:	0044c703          	lbu	a4,4(s1)
    80003c04:	02071713          	slli	a4,a4,0x20
    80003c08:	00d76733          	or	a4,a4,a3
    80003c0c:	0054c683          	lbu	a3,5(s1)
    80003c10:	02869693          	slli	a3,a3,0x28
    80003c14:	00e6e733          	or	a4,a3,a4
    80003c18:	0064c683          	lbu	a3,6(s1)
    80003c1c:	03069693          	slli	a3,a3,0x30
    80003c20:	00e6e6b3          	or	a3,a3,a4
    80003c24:	0074c703          	lbu	a4,7(s1)
    80003c28:	03871713          	slli	a4,a4,0x38
    80003c2c:	00d76733          	or	a4,a4,a3
    80003c30:	00d78023          	sb	a3,0(a5)
    80003c34:	00875693          	srli	a3,a4,0x8
    80003c38:	00d780a3          	sb	a3,1(a5)
    80003c3c:	01075693          	srli	a3,a4,0x10
    80003c40:	00d78123          	sb	a3,2(a5)
    80003c44:	0187569b          	srliw	a3,a4,0x18
    80003c48:	00d781a3          	sb	a3,3(a5)
    80003c4c:	02075693          	srli	a3,a4,0x20
    80003c50:	00d78223          	sb	a3,4(a5)
    80003c54:	02875693          	srli	a3,a4,0x28
    80003c58:	00d782a3          	sb	a3,5(a5)
    80003c5c:	03075693          	srli	a3,a4,0x30
    80003c60:	00d78323          	sb	a3,6(a5)
    80003c64:	03875713          	srli	a4,a4,0x38
    80003c68:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003c6c:	0004c783          	lbu	a5,0(s1)
    80003c70:	0014c703          	lbu	a4,1(s1)
    80003c74:	00871713          	slli	a4,a4,0x8
    80003c78:	00f76733          	or	a4,a4,a5
    80003c7c:	0024c783          	lbu	a5,2(s1)
    80003c80:	01079793          	slli	a5,a5,0x10
    80003c84:	00e7e733          	or	a4,a5,a4
    80003c88:	0034c783          	lbu	a5,3(s1)
    80003c8c:	01879793          	slli	a5,a5,0x18
    80003c90:	00e7e7b3          	or	a5,a5,a4
    80003c94:	0044c703          	lbu	a4,4(s1)
    80003c98:	02071713          	slli	a4,a4,0x20
    80003c9c:	00f767b3          	or	a5,a4,a5
    80003ca0:	0054c703          	lbu	a4,5(s1)
    80003ca4:	02871713          	slli	a4,a4,0x28
    80003ca8:	00f76733          	or	a4,a4,a5
    80003cac:	0064c783          	lbu	a5,6(s1)
    80003cb0:	03079793          	slli	a5,a5,0x30
    80003cb4:	00e7e733          	or	a4,a5,a4
    80003cb8:	0074c783          	lbu	a5,7(s1)
    80003cbc:	03879793          	slli	a5,a5,0x38
    80003cc0:	00e7e7b3          	or	a5,a5,a4
    80003cc4:	08078c63          	beqz	a5,80003d5c <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003cc8:	0084c703          	lbu	a4,8(s1)
    80003ccc:	0094c683          	lbu	a3,9(s1)
    80003cd0:	00869693          	slli	a3,a3,0x8
    80003cd4:	00e6e733          	or	a4,a3,a4
    80003cd8:	00a4c683          	lbu	a3,10(s1)
    80003cdc:	01069693          	slli	a3,a3,0x10
    80003ce0:	00e6e6b3          	or	a3,a3,a4
    80003ce4:	00b4c703          	lbu	a4,11(s1)
    80003ce8:	01871713          	slli	a4,a4,0x18
    80003cec:	00d766b3          	or	a3,a4,a3
    80003cf0:	00c4c703          	lbu	a4,12(s1)
    80003cf4:	02071713          	slli	a4,a4,0x20
    80003cf8:	00d76733          	or	a4,a4,a3
    80003cfc:	00d4c683          	lbu	a3,13(s1)
    80003d00:	02869693          	slli	a3,a3,0x28
    80003d04:	00e6e733          	or	a4,a3,a4
    80003d08:	00e4c683          	lbu	a3,14(s1)
    80003d0c:	03069693          	slli	a3,a3,0x30
    80003d10:	00e6e6b3          	or	a3,a3,a4
    80003d14:	00f4c703          	lbu	a4,15(s1)
    80003d18:	03871713          	slli	a4,a4,0x38
    80003d1c:	00d76733          	or	a4,a4,a3
    80003d20:	00d78423          	sb	a3,8(a5)
    80003d24:	00875693          	srli	a3,a4,0x8
    80003d28:	00d784a3          	sb	a3,9(a5)
    80003d2c:	01075693          	srli	a3,a4,0x10
    80003d30:	00d78523          	sb	a3,10(a5)
    80003d34:	0187569b          	srliw	a3,a4,0x18
    80003d38:	00d785a3          	sb	a3,11(a5)
    80003d3c:	02075693          	srli	a3,a4,0x20
    80003d40:	00d78623          	sb	a3,12(a5)
    80003d44:	02875693          	srli	a3,a4,0x28
    80003d48:	00d786a3          	sb	a3,13(a5)
    80003d4c:	03075693          	srli	a3,a4,0x30
    80003d50:	00d78723          	sb	a3,14(a5)
    80003d54:	03875713          	srli	a4,a4,0x38
    80003d58:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    80003d5c:	04048493          	addi	s1,s1,64
    80003d60:	0880006f          	j	80003de8 <_ZN11HeapManager12heapAllocateEm+0x660>
                m_pHead = pCurrent->pNext;
    80003d64:	0004c703          	lbu	a4,0(s1)
    80003d68:	0014c783          	lbu	a5,1(s1)
    80003d6c:	00879793          	slli	a5,a5,0x8
    80003d70:	00e7e7b3          	or	a5,a5,a4
    80003d74:	0024c703          	lbu	a4,2(s1)
    80003d78:	01071713          	slli	a4,a4,0x10
    80003d7c:	00f76733          	or	a4,a4,a5
    80003d80:	0034c783          	lbu	a5,3(s1)
    80003d84:	01879793          	slli	a5,a5,0x18
    80003d88:	00e7e733          	or	a4,a5,a4
    80003d8c:	0044c783          	lbu	a5,4(s1)
    80003d90:	02079793          	slli	a5,a5,0x20
    80003d94:	00e7e7b3          	or	a5,a5,a4
    80003d98:	0054c703          	lbu	a4,5(s1)
    80003d9c:	02871713          	slli	a4,a4,0x28
    80003da0:	00f76733          	or	a4,a4,a5
    80003da4:	0064c783          	lbu	a5,6(s1)
    80003da8:	03079793          	slli	a5,a5,0x30
    80003dac:	00e7e733          	or	a4,a5,a4
    80003db0:	0074c783          	lbu	a5,7(s1)
    80003db4:	03879793          	slli	a5,a5,0x38
    80003db8:	00e7e7b3          	or	a5,a5,a4
    80003dbc:	00f9b023          	sd	a5,0(s3)
    80003dc0:	dbdff06f          	j	80003b7c <_ZN11HeapManager12heapAllocateEm+0x3f4>
    }
    assert(0);
    80003dc4:	00007697          	auipc	a3,0x7
    80003dc8:	42c68693          	addi	a3,a3,1068 # 8000b1f0 <CONSOLE_STATUS+0x1e0>
    80003dcc:	04e00613          	li	a2,78
    80003dd0:	00007597          	auipc	a1,0x7
    80003dd4:	37058593          	addi	a1,a1,880 # 8000b140 <CONSOLE_STATUS+0x130>
    80003dd8:	00007517          	auipc	a0,0x7
    80003ddc:	44050513          	addi	a0,a0,1088 # 8000b218 <CONSOLE_STATUS+0x208>
    80003de0:	ffffe097          	auipc	ra,0xffffe
    80003de4:	2bc080e7          	jalr	700(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    return 0;
}
    80003de8:	00048513          	mv	a0,s1
    80003dec:	02813083          	ld	ra,40(sp)
    80003df0:	02013403          	ld	s0,32(sp)
    80003df4:	01813483          	ld	s1,24(sp)
    80003df8:	01013903          	ld	s2,16(sp)
    80003dfc:	00813983          	ld	s3,8(sp)
    80003e00:	03010113          	addi	sp,sp,48
    80003e04:	00008067          	ret

0000000080003e08 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003e08:	fc010113          	addi	sp,sp,-64
    80003e0c:	02113c23          	sd	ra,56(sp)
    80003e10:	02813823          	sd	s0,48(sp)
    80003e14:	02913423          	sd	s1,40(sp)
    80003e18:	03213023          	sd	s2,32(sp)
    80003e1c:	01313c23          	sd	s3,24(sp)
    80003e20:	01413823          	sd	s4,16(sp)
    80003e24:	01513423          	sd	s5,8(sp)
    80003e28:	04010413          	addi	s0,sp,64
    80003e2c:	00050a93          	mv	s5,a0
    80003e30:	00058a13          	mv	s4,a1
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pAddress) - MEM_BLOCK_SIZE);
    80003e34:	fc058913          	addi	s2,a1,-64
    80003e38:	00090993          	mv	s3,s2
    
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003e3c:	01894783          	lbu	a5,24(s2)
    80003e40:	01994703          	lbu	a4,25(s2)
    80003e44:	00871713          	slli	a4,a4,0x8
    80003e48:	00f76733          	or	a4,a4,a5
    80003e4c:	01a94783          	lbu	a5,26(s2)
    80003e50:	01079793          	slli	a5,a5,0x10
    80003e54:	00e7e733          	or	a4,a5,a4
    80003e58:	01b94783          	lbu	a5,27(s2)
    80003e5c:	01879793          	slli	a5,a5,0x18
    80003e60:	00e7e7b3          	or	a5,a5,a4
    80003e64:	0007879b          	sext.w	a5,a5
    80003e68:	deadc737          	lui	a4,0xdeadc
    80003e6c:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eaccc9e>
    80003e70:	28e79c63          	bne	a5,a4,80004108 <_ZN11HeapManager8heapFreeEPv+0x300>
    HeapFreeSectionHeader* pInsert = m_pHead;
    80003e74:	000ab483          	ld	s1,0(s5)

    if(pInsert == 0 || pInsert->pNext >= pAddress){
    80003e78:	06048063          	beqz	s1,80003ed8 <_ZN11HeapManager8heapFreeEPv+0xd0>
    80003e7c:	0004c783          	lbu	a5,0(s1)
    80003e80:	0014c703          	lbu	a4,1(s1)
    80003e84:	00871713          	slli	a4,a4,0x8
    80003e88:	00f76733          	or	a4,a4,a5
    80003e8c:	0024c783          	lbu	a5,2(s1)
    80003e90:	01079793          	slli	a5,a5,0x10
    80003e94:	00e7e733          	or	a4,a5,a4
    80003e98:	0034c783          	lbu	a5,3(s1)
    80003e9c:	01879793          	slli	a5,a5,0x18
    80003ea0:	00e7e7b3          	or	a5,a5,a4
    80003ea4:	0044c703          	lbu	a4,4(s1)
    80003ea8:	02071713          	slli	a4,a4,0x20
    80003eac:	00f767b3          	or	a5,a4,a5
    80003eb0:	0054c703          	lbu	a4,5(s1)
    80003eb4:	02871713          	slli	a4,a4,0x28
    80003eb8:	00f76733          	or	a4,a4,a5
    80003ebc:	0064c783          	lbu	a5,6(s1)
    80003ec0:	03079793          	slli	a5,a5,0x30
    80003ec4:	00e7e733          	or	a4,a5,a4
    80003ec8:	0074c783          	lbu	a5,7(s1)
    80003ecc:	03879793          	slli	a5,a5,0x38
    80003ed0:	00e7e7b3          	or	a5,a5,a4
    80003ed4:	2b47ea63          	bltu	a5,s4,80004188 <_ZN11HeapManager8heapFreeEPv+0x380>
        pFree->pNext = m_pHead;
    80003ed8:	fc9a0023          	sb	s1,-64(s4)
    80003edc:	0084d793          	srli	a5,s1,0x8
    80003ee0:	00f900a3          	sb	a5,1(s2)
    80003ee4:	0104d793          	srli	a5,s1,0x10
    80003ee8:	00f90123          	sb	a5,2(s2)
    80003eec:	0184d79b          	srliw	a5,s1,0x18
    80003ef0:	00f901a3          	sb	a5,3(s2)
    80003ef4:	0204d793          	srli	a5,s1,0x20
    80003ef8:	00f90223          	sb	a5,4(s2)
    80003efc:	0284d793          	srli	a5,s1,0x28
    80003f00:	00f902a3          	sb	a5,5(s2)
    80003f04:	0304d793          	srli	a5,s1,0x30
    80003f08:	00f90323          	sb	a5,6(s2)
    80003f0c:	0384d493          	srli	s1,s1,0x38
    80003f10:	009903a3          	sb	s1,7(s2)
        m_pHead->pPrev = pFree;
    80003f14:	000ab783          	ld	a5,0(s5)
    80003f18:	01278423          	sb	s2,8(a5)
    80003f1c:	00895713          	srli	a4,s2,0x8
    80003f20:	00e784a3          	sb	a4,9(a5)
    80003f24:	01095713          	srli	a4,s2,0x10
    80003f28:	00e78523          	sb	a4,10(a5)
    80003f2c:	0189571b          	srliw	a4,s2,0x18
    80003f30:	00e785a3          	sb	a4,11(a5)
    80003f34:	02095713          	srli	a4,s2,0x20
    80003f38:	00e78623          	sb	a4,12(a5)
    80003f3c:	02895713          	srli	a4,s2,0x28
    80003f40:	00e786a3          	sb	a4,13(a5)
    80003f44:	03095713          	srli	a4,s2,0x30
    80003f48:	00e78723          	sb	a4,14(a5)
    80003f4c:	03895713          	srli	a4,s2,0x38
    80003f50:	00e787a3          	sb	a4,15(a5)
        m_pHead = pFree;
    80003f54:	012ab023          	sd	s2,0(s5)
    }



    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uint64>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uint64>(pFree)){
    80003f58:	00894783          	lbu	a5,8(s2)
    80003f5c:	00994703          	lbu	a4,9(s2)
    80003f60:	00871713          	slli	a4,a4,0x8
    80003f64:	00f76733          	or	a4,a4,a5
    80003f68:	00a94783          	lbu	a5,10(s2)
    80003f6c:	01079793          	slli	a5,a5,0x10
    80003f70:	00e7e733          	or	a4,a5,a4
    80003f74:	00b94783          	lbu	a5,11(s2)
    80003f78:	01879793          	slli	a5,a5,0x18
    80003f7c:	00e7e7b3          	or	a5,a5,a4
    80003f80:	00c94703          	lbu	a4,12(s2)
    80003f84:	02071713          	slli	a4,a4,0x20
    80003f88:	00f767b3          	or	a5,a4,a5
    80003f8c:	00d94703          	lbu	a4,13(s2)
    80003f90:	02871713          	slli	a4,a4,0x28
    80003f94:	00f76733          	or	a4,a4,a5
    80003f98:	00e94783          	lbu	a5,14(s2)
    80003f9c:	03079793          	slli	a5,a5,0x30
    80003fa0:	00e7e733          	or	a4,a5,a4
    80003fa4:	00f94783          	lbu	a5,15(s2)
    80003fa8:	03879793          	slli	a5,a5,0x38
    80003fac:	00e7e7b3          	or	a5,a5,a4
    80003fb0:	06078663          	beqz	a5,8000401c <_ZN11HeapManager8heapFreeEPv+0x214>
    80003fb4:	0107c703          	lbu	a4,16(a5)
    80003fb8:	0117c683          	lbu	a3,17(a5)
    80003fbc:	00869693          	slli	a3,a3,0x8
    80003fc0:	00e6e6b3          	or	a3,a3,a4
    80003fc4:	0127c703          	lbu	a4,18(a5)
    80003fc8:	01071713          	slli	a4,a4,0x10
    80003fcc:	00d766b3          	or	a3,a4,a3
    80003fd0:	0137c703          	lbu	a4,19(a5)
    80003fd4:	01871713          	slli	a4,a4,0x18
    80003fd8:	00d76733          	or	a4,a4,a3
    80003fdc:	0147c683          	lbu	a3,20(a5)
    80003fe0:	02069693          	slli	a3,a3,0x20
    80003fe4:	00e6e733          	or	a4,a3,a4
    80003fe8:	0157c683          	lbu	a3,21(a5)
    80003fec:	02869693          	slli	a3,a3,0x28
    80003ff0:	00e6e6b3          	or	a3,a3,a4
    80003ff4:	0167c703          	lbu	a4,22(a5)
    80003ff8:	03071713          	slli	a4,a4,0x30
    80003ffc:	00d766b3          	or	a3,a4,a3
    80004000:	0177c703          	lbu	a4,23(a5)
    80004004:	03871713          	slli	a4,a4,0x38
    80004008:	00d76733          	or	a4,a4,a3
    8000400c:	00170693          	addi	a3,a4,1
    80004010:	00669693          	slli	a3,a3,0x6
    80004014:	00d786b3          	add	a3,a5,a3
    80004018:	38d90063          	beq	s2,a3,80004398 <_ZN11HeapManager8heapFreeEPv+0x590>
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree->pPrev;
        }pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uint64>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uint64>(pFree->pNext)){
    8000401c:	0009c783          	lbu	a5,0(s3)
    80004020:	0019c703          	lbu	a4,1(s3)
    80004024:	00871713          	slli	a4,a4,0x8
    80004028:	00f76733          	or	a4,a4,a5
    8000402c:	0029c783          	lbu	a5,2(s3)
    80004030:	01079793          	slli	a5,a5,0x10
    80004034:	00e7e733          	or	a4,a5,a4
    80004038:	0039c783          	lbu	a5,3(s3)
    8000403c:	01879793          	slli	a5,a5,0x18
    80004040:	00e7e7b3          	or	a5,a5,a4
    80004044:	0049c703          	lbu	a4,4(s3)
    80004048:	02071713          	slli	a4,a4,0x20
    8000404c:	00f767b3          	or	a5,a4,a5
    80004050:	0059c703          	lbu	a4,5(s3)
    80004054:	02871713          	slli	a4,a4,0x28
    80004058:	00f76733          	or	a4,a4,a5
    8000405c:	0069c783          	lbu	a5,6(s3)
    80004060:	03079793          	slli	a5,a5,0x30
    80004064:	00e7e733          	or	a4,a5,a4
    80004068:	0079c783          	lbu	a5,7(s3)
    8000406c:	03879793          	slli	a5,a5,0x38
    80004070:	00e7e7b3          	or	a5,a5,a4
    80004074:	06078663          	beqz	a5,800040e0 <_ZN11HeapManager8heapFreeEPv+0x2d8>
    80004078:	0109c703          	lbu	a4,16(s3)
    8000407c:	0119c683          	lbu	a3,17(s3)
    80004080:	00869693          	slli	a3,a3,0x8
    80004084:	00e6e6b3          	or	a3,a3,a4
    80004088:	0129c703          	lbu	a4,18(s3)
    8000408c:	01071713          	slli	a4,a4,0x10
    80004090:	00d766b3          	or	a3,a4,a3
    80004094:	0139c703          	lbu	a4,19(s3)
    80004098:	01871713          	slli	a4,a4,0x18
    8000409c:	00d76733          	or	a4,a4,a3
    800040a0:	0149c683          	lbu	a3,20(s3)
    800040a4:	02069693          	slli	a3,a3,0x20
    800040a8:	00e6e733          	or	a4,a3,a4
    800040ac:	0159c683          	lbu	a3,21(s3)
    800040b0:	02869693          	slli	a3,a3,0x28
    800040b4:	00e6e6b3          	or	a3,a3,a4
    800040b8:	0169c703          	lbu	a4,22(s3)
    800040bc:	03071713          	slli	a4,a4,0x30
    800040c0:	00d766b3          	or	a3,a4,a3
    800040c4:	0179c703          	lbu	a4,23(s3)
    800040c8:	03871713          	slli	a4,a4,0x38
    800040cc:	00d76733          	or	a4,a4,a3
    800040d0:	00170693          	addi	a3,a4,1
    800040d4:	00669693          	slli	a3,a3,0x6
    800040d8:	00d986b3          	add	a3,s3,a3
    800040dc:	58f68863          	beq	a3,a5,8000466c <_ZN11HeapManager8heapFreeEPv+0x864>
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree;
        }
    }
    return 0;
}
    800040e0:	00000513          	li	a0,0
    800040e4:	03813083          	ld	ra,56(sp)
    800040e8:	03013403          	ld	s0,48(sp)
    800040ec:	02813483          	ld	s1,40(sp)
    800040f0:	02013903          	ld	s2,32(sp)
    800040f4:	01813983          	ld	s3,24(sp)
    800040f8:	01013a03          	ld	s4,16(sp)
    800040fc:	00813a83          	ld	s5,8(sp)
    80004100:	04010113          	addi	sp,sp,64
    80004104:	00008067          	ret
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80004108:	00007697          	auipc	a3,0x7
    8000410c:	11868693          	addi	a3,a3,280 # 8000b220 <CONSOLE_STATUS+0x210>
    80004110:	05500613          	li	a2,85
    80004114:	00007597          	auipc	a1,0x7
    80004118:	02c58593          	addi	a1,a1,44 # 8000b140 <CONSOLE_STATUS+0x130>
    8000411c:	00007517          	auipc	a0,0x7
    80004120:	12c50513          	addi	a0,a0,300 # 8000b248 <CONSOLE_STATUS+0x238>
    80004124:	ffffe097          	auipc	ra,0xffffe
    80004128:	f78080e7          	jalr	-136(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    8000412c:	d49ff06f          	j	80003e74 <_ZN11HeapManager8heapFreeEPv+0x6c>
            pInsert = pInsert->pNext;
    80004130:	0004c703          	lbu	a4,0(s1)
    80004134:	0014c783          	lbu	a5,1(s1)
    80004138:	00879793          	slli	a5,a5,0x8
    8000413c:	00e7e733          	or	a4,a5,a4
    80004140:	0024c783          	lbu	a5,2(s1)
    80004144:	01079793          	slli	a5,a5,0x10
    80004148:	00e7e7b3          	or	a5,a5,a4
    8000414c:	0034c703          	lbu	a4,3(s1)
    80004150:	01871713          	slli	a4,a4,0x18
    80004154:	00f767b3          	or	a5,a4,a5
    80004158:	0044c703          	lbu	a4,4(s1)
    8000415c:	02071713          	slli	a4,a4,0x20
    80004160:	00f76733          	or	a4,a4,a5
    80004164:	0054c783          	lbu	a5,5(s1)
    80004168:	02879793          	slli	a5,a5,0x28
    8000416c:	00e7e733          	or	a4,a5,a4
    80004170:	0064c783          	lbu	a5,6(s1)
    80004174:	03079793          	slli	a5,a5,0x30
    80004178:	00e7e7b3          	or	a5,a5,a4
    8000417c:	0074c483          	lbu	s1,7(s1)
    80004180:	03849493          	slli	s1,s1,0x38
    80004184:	00f4e4b3          	or	s1,s1,a5
        while(pInsert->pNext != 0 && pInsert->pNext < pAddress){
    80004188:	0004c783          	lbu	a5,0(s1)
    8000418c:	0014c703          	lbu	a4,1(s1)
    80004190:	00871713          	slli	a4,a4,0x8
    80004194:	00f76733          	or	a4,a4,a5
    80004198:	0024c783          	lbu	a5,2(s1)
    8000419c:	01079793          	slli	a5,a5,0x10
    800041a0:	00e7e733          	or	a4,a5,a4
    800041a4:	0034c783          	lbu	a5,3(s1)
    800041a8:	01879793          	slli	a5,a5,0x18
    800041ac:	00e7e7b3          	or	a5,a5,a4
    800041b0:	0044c703          	lbu	a4,4(s1)
    800041b4:	02071713          	slli	a4,a4,0x20
    800041b8:	00f767b3          	or	a5,a4,a5
    800041bc:	0054c703          	lbu	a4,5(s1)
    800041c0:	02871713          	slli	a4,a4,0x28
    800041c4:	00f76733          	or	a4,a4,a5
    800041c8:	0064c783          	lbu	a5,6(s1)
    800041cc:	03079793          	slli	a5,a5,0x30
    800041d0:	00e7e733          	or	a4,a5,a4
    800041d4:	0074c783          	lbu	a5,7(s1)
    800041d8:	03879793          	slli	a5,a5,0x38
    800041dc:	00e7e7b3          	or	a5,a5,a4
    800041e0:	06078463          	beqz	a5,80004248 <_ZN11HeapManager8heapFreeEPv+0x440>
    800041e4:	0747f263          	bgeu	a5,s4,80004248 <_ZN11HeapManager8heapFreeEPv+0x440>
            assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    800041e8:	0184c783          	lbu	a5,24(s1)
    800041ec:	0194c703          	lbu	a4,25(s1)
    800041f0:	00871713          	slli	a4,a4,0x8
    800041f4:	00f76733          	or	a4,a4,a5
    800041f8:	01a4c783          	lbu	a5,26(s1)
    800041fc:	01079793          	slli	a5,a5,0x10
    80004200:	00e7e733          	or	a4,a5,a4
    80004204:	01b4c783          	lbu	a5,27(s1)
    80004208:	01879793          	slli	a5,a5,0x18
    8000420c:	00e7e7b3          	or	a5,a5,a4
    80004210:	0007879b          	sext.w	a5,a5
    80004214:	deadc737          	lui	a4,0xdeadc
    80004218:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eaccc9e>
    8000421c:	f0e78ae3          	beq	a5,a4,80004130 <_ZN11HeapManager8heapFreeEPv+0x328>
    80004220:	00007697          	auipc	a3,0x7
    80004224:	00068693          	mv	a3,a3
    80004228:	05e00613          	li	a2,94
    8000422c:	00007597          	auipc	a1,0x7
    80004230:	f1458593          	addi	a1,a1,-236 # 8000b140 <CONSOLE_STATUS+0x130>
    80004234:	00007517          	auipc	a0,0x7
    80004238:	03c50513          	addi	a0,a0,60 # 8000b270 <CONSOLE_STATUS+0x260>
    8000423c:	ffffe097          	auipc	ra,0xffffe
    80004240:	e60080e7          	jalr	-416(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80004244:	eedff06f          	j	80004130 <_ZN11HeapManager8heapFreeEPv+0x328>
        pFree->pNext = pInsert->pNext;
    80004248:	fcfa0023          	sb	a5,-64(s4)
    8000424c:	0087d713          	srli	a4,a5,0x8
    80004250:	00e900a3          	sb	a4,1(s2)
    80004254:	0107d713          	srli	a4,a5,0x10
    80004258:	00e90123          	sb	a4,2(s2)
    8000425c:	0187d71b          	srliw	a4,a5,0x18
    80004260:	00e901a3          	sb	a4,3(s2)
    80004264:	0207d713          	srli	a4,a5,0x20
    80004268:	00e90223          	sb	a4,4(s2)
    8000426c:	0287d713          	srli	a4,a5,0x28
    80004270:	00e902a3          	sb	a4,5(s2)
    80004274:	0307d713          	srli	a4,a5,0x30
    80004278:	00e90323          	sb	a4,6(s2)
    8000427c:	0387d793          	srli	a5,a5,0x38
    80004280:	00f903a3          	sb	a5,7(s2)
        pFree->pPrev = pInsert;
    80004284:	00990423          	sb	s1,8(s2)
    80004288:	0084d793          	srli	a5,s1,0x8
    8000428c:	00f904a3          	sb	a5,9(s2)
    80004290:	0104d793          	srli	a5,s1,0x10
    80004294:	00f90523          	sb	a5,10(s2)
    80004298:	0184d79b          	srliw	a5,s1,0x18
    8000429c:	00f905a3          	sb	a5,11(s2)
    800042a0:	0204d793          	srli	a5,s1,0x20
    800042a4:	00f90623          	sb	a5,12(s2)
    800042a8:	0284d793          	srli	a5,s1,0x28
    800042ac:	00f906a3          	sb	a5,13(s2)
    800042b0:	0304d793          	srli	a5,s1,0x30
    800042b4:	00f90723          	sb	a5,14(s2)
    800042b8:	0384d793          	srli	a5,s1,0x38
    800042bc:	00f907a3          	sb	a5,15(s2)
        if(pInsert->pNext != 0){
    800042c0:	0004c783          	lbu	a5,0(s1)
    800042c4:	0014c703          	lbu	a4,1(s1)
    800042c8:	00871713          	slli	a4,a4,0x8
    800042cc:	00f76733          	or	a4,a4,a5
    800042d0:	0024c783          	lbu	a5,2(s1)
    800042d4:	01079793          	slli	a5,a5,0x10
    800042d8:	00e7e733          	or	a4,a5,a4
    800042dc:	0034c783          	lbu	a5,3(s1)
    800042e0:	01879793          	slli	a5,a5,0x18
    800042e4:	00e7e7b3          	or	a5,a5,a4
    800042e8:	0044c703          	lbu	a4,4(s1)
    800042ec:	02071713          	slli	a4,a4,0x20
    800042f0:	00f767b3          	or	a5,a4,a5
    800042f4:	0054c703          	lbu	a4,5(s1)
    800042f8:	02871713          	slli	a4,a4,0x28
    800042fc:	00f76733          	or	a4,a4,a5
    80004300:	0064c783          	lbu	a5,6(s1)
    80004304:	03079793          	slli	a5,a5,0x30
    80004308:	00e7e733          	or	a4,a5,a4
    8000430c:	0074c783          	lbu	a5,7(s1)
    80004310:	03879793          	slli	a5,a5,0x38
    80004314:	00e7e7b3          	or	a5,a5,a4
    80004318:	04078063          	beqz	a5,80004358 <_ZN11HeapManager8heapFreeEPv+0x550>
            pInsert->pNext->pPrev = pFree;
    8000431c:	01278423          	sb	s2,8(a5)
    80004320:	00895713          	srli	a4,s2,0x8
    80004324:	00e784a3          	sb	a4,9(a5)
    80004328:	01095713          	srli	a4,s2,0x10
    8000432c:	00e78523          	sb	a4,10(a5)
    80004330:	0189571b          	srliw	a4,s2,0x18
    80004334:	00e785a3          	sb	a4,11(a5)
    80004338:	02095713          	srli	a4,s2,0x20
    8000433c:	00e78623          	sb	a4,12(a5)
    80004340:	02895713          	srli	a4,s2,0x28
    80004344:	00e786a3          	sb	a4,13(a5)
    80004348:	03095713          	srli	a4,s2,0x30
    8000434c:	00e78723          	sb	a4,14(a5)
    80004350:	03895713          	srli	a4,s2,0x38
    80004354:	00e787a3          	sb	a4,15(a5)
        pInsert->pNext = pFree;
    80004358:	01248023          	sb	s2,0(s1)
    8000435c:	00895793          	srli	a5,s2,0x8
    80004360:	00f480a3          	sb	a5,1(s1)
    80004364:	01095793          	srli	a5,s2,0x10
    80004368:	00f48123          	sb	a5,2(s1)
    8000436c:	0189579b          	srliw	a5,s2,0x18
    80004370:	00f481a3          	sb	a5,3(s1)
    80004374:	02095793          	srli	a5,s2,0x20
    80004378:	00f48223          	sb	a5,4(s1)
    8000437c:	02895793          	srli	a5,s2,0x28
    80004380:	00f482a3          	sb	a5,5(s1)
    80004384:	03095793          	srli	a5,s2,0x30
    80004388:	00f48323          	sb	a5,6(s1)
    8000438c:	03895793          	srli	a5,s2,0x38
    80004390:	00f483a3          	sb	a5,7(s1)
    80004394:	bc5ff06f          	j	80003f58 <_ZN11HeapManager8heapFreeEPv+0x150>
        pFree->pPrev->nSize += pFree->nSize + 1;
    80004398:	01094683          	lbu	a3,16(s2)
    8000439c:	01194603          	lbu	a2,17(s2)
    800043a0:	00861613          	slli	a2,a2,0x8
    800043a4:	00d66633          	or	a2,a2,a3
    800043a8:	01294683          	lbu	a3,18(s2)
    800043ac:	01069693          	slli	a3,a3,0x10
    800043b0:	00c6e633          	or	a2,a3,a2
    800043b4:	01394683          	lbu	a3,19(s2)
    800043b8:	01869693          	slli	a3,a3,0x18
    800043bc:	00c6e6b3          	or	a3,a3,a2
    800043c0:	01494603          	lbu	a2,20(s2)
    800043c4:	02061613          	slli	a2,a2,0x20
    800043c8:	00d666b3          	or	a3,a2,a3
    800043cc:	01594603          	lbu	a2,21(s2)
    800043d0:	02861613          	slli	a2,a2,0x28
    800043d4:	00d66633          	or	a2,a2,a3
    800043d8:	01694683          	lbu	a3,22(s2)
    800043dc:	03069693          	slli	a3,a3,0x30
    800043e0:	00c6e633          	or	a2,a3,a2
    800043e4:	01794683          	lbu	a3,23(s2)
    800043e8:	03869693          	slli	a3,a3,0x38
    800043ec:	00c6e6b3          	or	a3,a3,a2
    800043f0:	00d70733          	add	a4,a4,a3
    800043f4:	00170713          	addi	a4,a4,1
    800043f8:	00e78823          	sb	a4,16(a5)
    800043fc:	00875693          	srli	a3,a4,0x8
    80004400:	00d788a3          	sb	a3,17(a5)
    80004404:	01075693          	srli	a3,a4,0x10
    80004408:	00d78923          	sb	a3,18(a5)
    8000440c:	0187569b          	srliw	a3,a4,0x18
    80004410:	00d789a3          	sb	a3,19(a5)
    80004414:	02075693          	srli	a3,a4,0x20
    80004418:	00d78a23          	sb	a3,20(a5)
    8000441c:	02875693          	srli	a3,a4,0x28
    80004420:	00d78aa3          	sb	a3,21(a5)
    80004424:	03075693          	srli	a3,a4,0x30
    80004428:	00d78b23          	sb	a3,22(a5)
    8000442c:	03875713          	srli	a4,a4,0x38
    80004430:	00e78ba3          	sb	a4,23(a5)
        pFree->pPrev->pNext = pFree->pNext;
    80004434:	00894703          	lbu	a4,8(s2)
    80004438:	00994783          	lbu	a5,9(s2)
    8000443c:	00879793          	slli	a5,a5,0x8
    80004440:	00e7e7b3          	or	a5,a5,a4
    80004444:	00a94703          	lbu	a4,10(s2)
    80004448:	01071713          	slli	a4,a4,0x10
    8000444c:	00f767b3          	or	a5,a4,a5
    80004450:	00b94703          	lbu	a4,11(s2)
    80004454:	01871713          	slli	a4,a4,0x18
    80004458:	00f76733          	or	a4,a4,a5
    8000445c:	00c94783          	lbu	a5,12(s2)
    80004460:	02079793          	slli	a5,a5,0x20
    80004464:	00e7e733          	or	a4,a5,a4
    80004468:	00d94783          	lbu	a5,13(s2)
    8000446c:	02879793          	slli	a5,a5,0x28
    80004470:	00e7e7b3          	or	a5,a5,a4
    80004474:	00e94703          	lbu	a4,14(s2)
    80004478:	03071713          	slli	a4,a4,0x30
    8000447c:	00f767b3          	or	a5,a4,a5
    80004480:	00f94703          	lbu	a4,15(s2)
    80004484:	03871713          	slli	a4,a4,0x38
    80004488:	00f76733          	or	a4,a4,a5
    8000448c:	fc0a4783          	lbu	a5,-64(s4)
    80004490:	00194683          	lbu	a3,1(s2)
    80004494:	00869693          	slli	a3,a3,0x8
    80004498:	00f6e7b3          	or	a5,a3,a5
    8000449c:	00294683          	lbu	a3,2(s2)
    800044a0:	01069693          	slli	a3,a3,0x10
    800044a4:	00f6e6b3          	or	a3,a3,a5
    800044a8:	00394783          	lbu	a5,3(s2)
    800044ac:	01879793          	slli	a5,a5,0x18
    800044b0:	00d7e6b3          	or	a3,a5,a3
    800044b4:	00494783          	lbu	a5,4(s2)
    800044b8:	02079793          	slli	a5,a5,0x20
    800044bc:	00d7e7b3          	or	a5,a5,a3
    800044c0:	00594683          	lbu	a3,5(s2)
    800044c4:	02869693          	slli	a3,a3,0x28
    800044c8:	00f6e7b3          	or	a5,a3,a5
    800044cc:	00694683          	lbu	a3,6(s2)
    800044d0:	03069693          	slli	a3,a3,0x30
    800044d4:	00f6e6b3          	or	a3,a3,a5
    800044d8:	00794783          	lbu	a5,7(s2)
    800044dc:	03879793          	slli	a5,a5,0x38
    800044e0:	00d7e7b3          	or	a5,a5,a3
    800044e4:	00d70023          	sb	a3,0(a4)
    800044e8:	0087d693          	srli	a3,a5,0x8
    800044ec:	00d700a3          	sb	a3,1(a4)
    800044f0:	0107d693          	srli	a3,a5,0x10
    800044f4:	00d70123          	sb	a3,2(a4)
    800044f8:	0187d69b          	srliw	a3,a5,0x18
    800044fc:	00d701a3          	sb	a3,3(a4)
    80004500:	0207d693          	srli	a3,a5,0x20
    80004504:	00d70223          	sb	a3,4(a4)
    80004508:	0287d693          	srli	a3,a5,0x28
    8000450c:	00d702a3          	sb	a3,5(a4)
    80004510:	0307d693          	srli	a3,a5,0x30
    80004514:	00d70323          	sb	a3,6(a4)
    80004518:	0387d793          	srli	a5,a5,0x38
    8000451c:	00f703a3          	sb	a5,7(a4)
        if(pFree->pNext != 0){
    80004520:	fc0a4783          	lbu	a5,-64(s4)
    80004524:	00194703          	lbu	a4,1(s2)
    80004528:	00871713          	slli	a4,a4,0x8
    8000452c:	00f76733          	or	a4,a4,a5
    80004530:	00294783          	lbu	a5,2(s2)
    80004534:	01079793          	slli	a5,a5,0x10
    80004538:	00e7e733          	or	a4,a5,a4
    8000453c:	00394783          	lbu	a5,3(s2)
    80004540:	01879793          	slli	a5,a5,0x18
    80004544:	00e7e7b3          	or	a5,a5,a4
    80004548:	00494703          	lbu	a4,4(s2)
    8000454c:	02071713          	slli	a4,a4,0x20
    80004550:	00f767b3          	or	a5,a4,a5
    80004554:	00594703          	lbu	a4,5(s2)
    80004558:	02871713          	slli	a4,a4,0x28
    8000455c:	00f76733          	or	a4,a4,a5
    80004560:	00694783          	lbu	a5,6(s2)
    80004564:	03079793          	slli	a5,a5,0x30
    80004568:	00e7e733          	or	a4,a5,a4
    8000456c:	00794783          	lbu	a5,7(s2)
    80004570:	03879793          	slli	a5,a5,0x38
    80004574:	00e7e7b3          	or	a5,a5,a4
    80004578:	08078c63          	beqz	a5,80004610 <_ZN11HeapManager8heapFreeEPv+0x808>
            pFree->pNext->pPrev = pFree->pPrev;
    8000457c:	00894703          	lbu	a4,8(s2)
    80004580:	00994683          	lbu	a3,9(s2)
    80004584:	00869693          	slli	a3,a3,0x8
    80004588:	00e6e733          	or	a4,a3,a4
    8000458c:	00a94683          	lbu	a3,10(s2)
    80004590:	01069693          	slli	a3,a3,0x10
    80004594:	00e6e6b3          	or	a3,a3,a4
    80004598:	00b94703          	lbu	a4,11(s2)
    8000459c:	01871713          	slli	a4,a4,0x18
    800045a0:	00d766b3          	or	a3,a4,a3
    800045a4:	00c94703          	lbu	a4,12(s2)
    800045a8:	02071713          	slli	a4,a4,0x20
    800045ac:	00d76733          	or	a4,a4,a3
    800045b0:	00d94683          	lbu	a3,13(s2)
    800045b4:	02869693          	slli	a3,a3,0x28
    800045b8:	00e6e733          	or	a4,a3,a4
    800045bc:	00e94683          	lbu	a3,14(s2)
    800045c0:	03069693          	slli	a3,a3,0x30
    800045c4:	00e6e6b3          	or	a3,a3,a4
    800045c8:	00f94703          	lbu	a4,15(s2)
    800045cc:	03871713          	slli	a4,a4,0x38
    800045d0:	00d76733          	or	a4,a4,a3
    800045d4:	00d78423          	sb	a3,8(a5)
    800045d8:	00875693          	srli	a3,a4,0x8
    800045dc:	00d784a3          	sb	a3,9(a5)
    800045e0:	01075693          	srli	a3,a4,0x10
    800045e4:	00d78523          	sb	a3,10(a5)
    800045e8:	0187569b          	srliw	a3,a4,0x18
    800045ec:	00d785a3          	sb	a3,11(a5)
    800045f0:	02075693          	srli	a3,a4,0x20
    800045f4:	00d78623          	sb	a3,12(a5)
    800045f8:	02875693          	srli	a3,a4,0x28
    800045fc:	00d786a3          	sb	a3,13(a5)
    80004600:	03075693          	srli	a3,a4,0x30
    80004604:	00d78723          	sb	a3,14(a5)
    80004608:	03875713          	srli	a4,a4,0x38
    8000460c:	00e787a3          	sb	a4,15(a5)
        }pFree = pFree->pPrev;
    80004610:	00894983          	lbu	s3,8(s2)
    80004614:	00994783          	lbu	a5,9(s2)
    80004618:	00879793          	slli	a5,a5,0x8
    8000461c:	0137e7b3          	or	a5,a5,s3
    80004620:	00a94983          	lbu	s3,10(s2)
    80004624:	01099993          	slli	s3,s3,0x10
    80004628:	00f9e7b3          	or	a5,s3,a5
    8000462c:	00b94983          	lbu	s3,11(s2)
    80004630:	01899993          	slli	s3,s3,0x18
    80004634:	00f9e9b3          	or	s3,s3,a5
    80004638:	00c94783          	lbu	a5,12(s2)
    8000463c:	02079793          	slli	a5,a5,0x20
    80004640:	0137e9b3          	or	s3,a5,s3
    80004644:	00d94783          	lbu	a5,13(s2)
    80004648:	02879793          	slli	a5,a5,0x28
    8000464c:	0137e7b3          	or	a5,a5,s3
    80004650:	00e94983          	lbu	s3,14(s2)
    80004654:	03099993          	slli	s3,s3,0x30
    80004658:	00f9e7b3          	or	a5,s3,a5
    8000465c:	00f94983          	lbu	s3,15(s2)
    80004660:	03899993          	slli	s3,s3,0x38
    80004664:	00f9e9b3          	or	s3,s3,a5
    80004668:	9b5ff06f          	j	8000401c <_ZN11HeapManager8heapFreeEPv+0x214>
        pFree->nSize += pFree->pNext->nSize + 1;
    8000466c:	0107c683          	lbu	a3,16(a5)
    80004670:	0117c603          	lbu	a2,17(a5)
    80004674:	00861613          	slli	a2,a2,0x8
    80004678:	00d66633          	or	a2,a2,a3
    8000467c:	0127c683          	lbu	a3,18(a5)
    80004680:	01069693          	slli	a3,a3,0x10
    80004684:	00c6e633          	or	a2,a3,a2
    80004688:	0137c683          	lbu	a3,19(a5)
    8000468c:	01869693          	slli	a3,a3,0x18
    80004690:	00c6e6b3          	or	a3,a3,a2
    80004694:	0147c603          	lbu	a2,20(a5)
    80004698:	02061613          	slli	a2,a2,0x20
    8000469c:	00d666b3          	or	a3,a2,a3
    800046a0:	0157c603          	lbu	a2,21(a5)
    800046a4:	02861613          	slli	a2,a2,0x28
    800046a8:	00d66633          	or	a2,a2,a3
    800046ac:	0167c683          	lbu	a3,22(a5)
    800046b0:	03069693          	slli	a3,a3,0x30
    800046b4:	00c6e633          	or	a2,a3,a2
    800046b8:	0177c683          	lbu	a3,23(a5)
    800046bc:	03869693          	slli	a3,a3,0x38
    800046c0:	00c6e6b3          	or	a3,a3,a2
    800046c4:	00d70733          	add	a4,a4,a3
    800046c8:	00170713          	addi	a4,a4,1
    800046cc:	00e98823          	sb	a4,16(s3)
    800046d0:	00875693          	srli	a3,a4,0x8
    800046d4:	00d988a3          	sb	a3,17(s3)
    800046d8:	01075693          	srli	a3,a4,0x10
    800046dc:	00d98923          	sb	a3,18(s3)
    800046e0:	0187569b          	srliw	a3,a4,0x18
    800046e4:	00d989a3          	sb	a3,19(s3)
    800046e8:	02075693          	srli	a3,a4,0x20
    800046ec:	00d98a23          	sb	a3,20(s3)
    800046f0:	02875693          	srli	a3,a4,0x28
    800046f4:	00d98aa3          	sb	a3,21(s3)
    800046f8:	03075693          	srli	a3,a4,0x30
    800046fc:	00d98b23          	sb	a3,22(s3)
    80004700:	03875713          	srli	a4,a4,0x38
    80004704:	00e98ba3          	sb	a4,23(s3)
        pFree->pNext = pFree->pNext->pNext;
    80004708:	0007c683          	lbu	a3,0(a5)
    8000470c:	0017c703          	lbu	a4,1(a5)
    80004710:	00871713          	slli	a4,a4,0x8
    80004714:	00d766b3          	or	a3,a4,a3
    80004718:	0027c703          	lbu	a4,2(a5)
    8000471c:	01071713          	slli	a4,a4,0x10
    80004720:	00d76733          	or	a4,a4,a3
    80004724:	0037c683          	lbu	a3,3(a5)
    80004728:	01869693          	slli	a3,a3,0x18
    8000472c:	00e6e733          	or	a4,a3,a4
    80004730:	0047c683          	lbu	a3,4(a5)
    80004734:	02069693          	slli	a3,a3,0x20
    80004738:	00e6e6b3          	or	a3,a3,a4
    8000473c:	0057c703          	lbu	a4,5(a5)
    80004740:	02871713          	slli	a4,a4,0x28
    80004744:	00d766b3          	or	a3,a4,a3
    80004748:	0067c703          	lbu	a4,6(a5)
    8000474c:	03071713          	slli	a4,a4,0x30
    80004750:	00d76733          	or	a4,a4,a3
    80004754:	0077c783          	lbu	a5,7(a5)
    80004758:	03879793          	slli	a5,a5,0x38
    8000475c:	00e7e7b3          	or	a5,a5,a4
    80004760:	00e98023          	sb	a4,0(s3)
    80004764:	0087d713          	srli	a4,a5,0x8
    80004768:	00e980a3          	sb	a4,1(s3)
    8000476c:	0107d713          	srli	a4,a5,0x10
    80004770:	00e98123          	sb	a4,2(s3)
    80004774:	0187d71b          	srliw	a4,a5,0x18
    80004778:	00e981a3          	sb	a4,3(s3)
    8000477c:	0207d713          	srli	a4,a5,0x20
    80004780:	00e98223          	sb	a4,4(s3)
    80004784:	0287d713          	srli	a4,a5,0x28
    80004788:	00e982a3          	sb	a4,5(s3)
    8000478c:	0307d713          	srli	a4,a5,0x30
    80004790:	00e98323          	sb	a4,6(s3)
    80004794:	0387d713          	srli	a4,a5,0x38
    80004798:	00e983a3          	sb	a4,7(s3)
        if(pFree->pNext != 0){
    8000479c:	940782e3          	beqz	a5,800040e0 <_ZN11HeapManager8heapFreeEPv+0x2d8>
            pFree->pNext->pPrev = pFree;
    800047a0:	01378423          	sb	s3,8(a5)
    800047a4:	0089d713          	srli	a4,s3,0x8
    800047a8:	00e784a3          	sb	a4,9(a5)
    800047ac:	0109d713          	srli	a4,s3,0x10
    800047b0:	00e78523          	sb	a4,10(a5)
    800047b4:	0189d71b          	srliw	a4,s3,0x18
    800047b8:	00e785a3          	sb	a4,11(a5)
    800047bc:	0209d713          	srli	a4,s3,0x20
    800047c0:	00e78623          	sb	a4,12(a5)
    800047c4:	0289d713          	srli	a4,s3,0x28
    800047c8:	00e786a3          	sb	a4,13(a5)
    800047cc:	0309d713          	srli	a4,s3,0x30
    800047d0:	00e78723          	sb	a4,14(a5)
    800047d4:	0389d993          	srli	s3,s3,0x38
    800047d8:	013787a3          	sb	s3,15(a5)
    800047dc:	905ff06f          	j	800040e0 <_ZN11HeapManager8heapFreeEPv+0x2d8>

00000000800047e0 <_ZN14ConsoleManager11getInstanceEv>:
    outBuffer.init();
    waitingThreads = 0;
}

ConsoleManager& ConsoleManager::getInstance(){
    assert(instance != 0);
    800047e0:	0000a797          	auipc	a5,0xa
    800047e4:	9a87b783          	ld	a5,-1624(a5) # 8000e188 <_ZN14ConsoleManager8instanceE>
    800047e8:	00078863          	beqz	a5,800047f8 <_ZN14ConsoleManager11getInstanceEv+0x18>
    return *instance;
}
    800047ec:	0000a517          	auipc	a0,0xa
    800047f0:	99c53503          	ld	a0,-1636(a0) # 8000e188 <_ZN14ConsoleManager8instanceE>
    800047f4:	00008067          	ret
ConsoleManager& ConsoleManager::getInstance(){
    800047f8:	ff010113          	addi	sp,sp,-16
    800047fc:	00113423          	sd	ra,8(sp)
    80004800:	00813023          	sd	s0,0(sp)
    80004804:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80004808:	00007697          	auipc	a3,0x7
    8000480c:	a9068693          	addi	a3,a3,-1392 # 8000b298 <CONSOLE_STATUS+0x288>
    80004810:	02200613          	li	a2,34
    80004814:	00007597          	auipc	a1,0x7
    80004818:	abc58593          	addi	a1,a1,-1348 # 8000b2d0 <CONSOLE_STATUS+0x2c0>
    8000481c:	00007517          	auipc	a0,0x7
    80004820:	85c50513          	addi	a0,a0,-1956 # 8000b078 <CONSOLE_STATUS+0x68>
    80004824:	ffffe097          	auipc	ra,0xffffe
    80004828:	878080e7          	jalr	-1928(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
}
    8000482c:	0000a517          	auipc	a0,0xa
    80004830:	95c53503          	ld	a0,-1700(a0) # 8000e188 <_ZN14ConsoleManager8instanceE>
    80004834:	00813083          	ld	ra,8(sp)
    80004838:	00013403          	ld	s0,0(sp)
    8000483c:	01010113          	addi	sp,sp,16
    80004840:	00008067          	ret

0000000080004844 <_ZN14ConsoleManager13consoleBufferD1Ev>:

ConsoleManager::consoleBuffer::~consoleBuffer(){
    80004844:	ff010113          	addi	sp,sp,-16
    80004848:	00113423          	sd	ra,8(sp)
    8000484c:	00813023          	sd	s0,0(sp)
    80004850:	01010413          	addi	s0,sp,16
    sem_close(sem);
    80004854:	00053503          	ld	a0,0(a0)
    80004858:	ffffd097          	auipc	ra,0xffffd
    8000485c:	1ec080e7          	jalr	492(ra) # 80001a44 <_Z9sem_closeP4_sem>
}
    80004860:	00813083          	ld	ra,8(sp)
    80004864:	00013403          	ld	s0,0(sp)
    80004868:	01010113          	addi	sp,sp,16
    8000486c:	00008067          	ret

0000000080004870 <_ZN14ConsoleManagerC1Ev>:
ConsoleManager::ConsoleManager(){
    80004870:	fd010113          	addi	sp,sp,-48
    80004874:	02113423          	sd	ra,40(sp)
    80004878:	02813023          	sd	s0,32(sp)
    8000487c:	00913c23          	sd	s1,24(sp)
    80004880:	01213823          	sd	s2,16(sp)
    80004884:	01313423          	sd	s3,8(sp)
    80004888:	03010413          	addi	s0,sp,48
    8000488c:	00050493          	mv	s1,a0

    static ConsoleManager* instance;
    
    struct consoleBuffer{
    public:
        consoleBuffer(): head(0), tail(0), size(0){}
    80004890:	20053423          	sd	zero,520(a0)
    80004894:	20053823          	sd	zero,528(a0)
    80004898:	20053c23          	sd	zero,536(a0)
    8000489c:	42053423          	sd	zero,1064(a0)
    800048a0:	42053823          	sd	zero,1072(a0)
    800048a4:	42053c23          	sd	zero,1080(a0)
    assert(instance == 0);
    800048a8:	0000a797          	auipc	a5,0xa
    800048ac:	8e07b783          	ld	a5,-1824(a5) # 8000e188 <_ZN14ConsoleManager8instanceE>
    800048b0:	02079463          	bnez	a5,800048d8 <_ZN14ConsoleManagerC1Ev+0x68>
    instance = this;
    800048b4:	0000a797          	auipc	a5,0xa
    800048b8:	8c97ba23          	sd	s1,-1836(a5) # 8000e188 <_ZN14ConsoleManager8instanceE>
}
    800048bc:	02813083          	ld	ra,40(sp)
    800048c0:	02013403          	ld	s0,32(sp)
    800048c4:	01813483          	ld	s1,24(sp)
    800048c8:	01013903          	ld	s2,16(sp)
    800048cc:	00813983          	ld	s3,8(sp)
    800048d0:	03010113          	addi	sp,sp,48
    800048d4:	00008067          	ret
    800048d8:	22050913          	addi	s2,a0,544
    assert(instance == 0);
    800048dc:	00007697          	auipc	a3,0x7
    800048e0:	a0c68693          	addi	a3,a3,-1524 # 8000b2e8 <CONSOLE_STATUS+0x2d8>
    800048e4:	01400613          	li	a2,20
    800048e8:	00007597          	auipc	a1,0x7
    800048ec:	9e858593          	addi	a1,a1,-1560 # 8000b2d0 <CONSOLE_STATUS+0x2c0>
    800048f0:	00006517          	auipc	a0,0x6
    800048f4:	75050513          	addi	a0,a0,1872 # 8000b040 <CONSOLE_STATUS+0x30>
    800048f8:	ffffd097          	auipc	ra,0xffffd
    800048fc:	7a4080e7          	jalr	1956(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80004900:	fb5ff06f          	j	800048b4 <_ZN14ConsoleManagerC1Ev+0x44>
    80004904:	00050993          	mv	s3,a0
ConsoleManager::ConsoleManager(){
    80004908:	00090513          	mv	a0,s2
    8000490c:	00000097          	auipc	ra,0x0
    80004910:	f38080e7          	jalr	-200(ra) # 80004844 <_ZN14ConsoleManager13consoleBufferD1Ev>
    80004914:	00048513          	mv	a0,s1
    80004918:	00000097          	auipc	ra,0x0
    8000491c:	f2c080e7          	jalr	-212(ra) # 80004844 <_ZN14ConsoleManager13consoleBufferD1Ev>
    80004920:	00098513          	mv	a0,s3
    80004924:	0000b097          	auipc	ra,0xb
    80004928:	984080e7          	jalr	-1660(ra) # 8000f2a8 <_Unwind_Resume>

000000008000492c <_ZN14ConsoleManagerD1Ev>:
ConsoleManager::~ConsoleManager(){
    8000492c:	fe010113          	addi	sp,sp,-32
    80004930:	00113c23          	sd	ra,24(sp)
    80004934:	00813823          	sd	s0,16(sp)
    80004938:	00913423          	sd	s1,8(sp)
    8000493c:	02010413          	addi	s0,sp,32
    80004940:	00050493          	mv	s1,a0
    80004944:	22050513          	addi	a0,a0,544
    80004948:	00000097          	auipc	ra,0x0
    8000494c:	efc080e7          	jalr	-260(ra) # 80004844 <_ZN14ConsoleManager13consoleBufferD1Ev>
    80004950:	00048513          	mv	a0,s1
    80004954:	00000097          	auipc	ra,0x0
    80004958:	ef0080e7          	jalr	-272(ra) # 80004844 <_ZN14ConsoleManager13consoleBufferD1Ev>
}
    8000495c:	01813083          	ld	ra,24(sp)
    80004960:	01013403          	ld	s0,16(sp)
    80004964:	00813483          	ld	s1,8(sp)
    80004968:	02010113          	addi	sp,sp,32
    8000496c:	00008067          	ret

0000000080004970 <_ZN14ConsoleManager13consoleBuffer4initEv>:

void ConsoleManager::consoleBuffer::init(){
    80004970:	ff010113          	addi	sp,sp,-16
    80004974:	00113423          	sd	ra,8(sp)
    80004978:	00813023          	sd	s0,0(sp)
    8000497c:	01010413          	addi	s0,sp,16
    _sem::open(&sem, 0);
    80004980:	00000593          	li	a1,0
    80004984:	ffffd097          	auipc	ra,0xffffd
    80004988:	190080e7          	jalr	400(ra) # 80001b14 <_ZN4_sem4openEPPS_j>
}
    8000498c:	00813083          	ld	ra,8(sp)
    80004990:	00013403          	ld	s0,0(sp)
    80004994:	01010113          	addi	sp,sp,16
    80004998:	00008067          	ret

000000008000499c <_ZN14ConsoleManager4initEv>:
void ConsoleManager::init(){
    8000499c:	fe010113          	addi	sp,sp,-32
    800049a0:	00113c23          	sd	ra,24(sp)
    800049a4:	00813823          	sd	s0,16(sp)
    800049a8:	00913423          	sd	s1,8(sp)
    800049ac:	02010413          	addi	s0,sp,32
    800049b0:	00050493          	mv	s1,a0
    inBuffer.init();
    800049b4:	00000097          	auipc	ra,0x0
    800049b8:	fbc080e7          	jalr	-68(ra) # 80004970 <_ZN14ConsoleManager13consoleBuffer4initEv>
    outBuffer.init();
    800049bc:	22048513          	addi	a0,s1,544
    800049c0:	00000097          	auipc	ra,0x0
    800049c4:	fb0080e7          	jalr	-80(ra) # 80004970 <_ZN14ConsoleManager13consoleBuffer4initEv>
    waitingThreads = 0;
    800049c8:	4404a023          	sw	zero,1088(s1)
}
    800049cc:	01813083          	ld	ra,24(sp)
    800049d0:	01013403          	ld	s0,16(sp)
    800049d4:	00813483          	ld	s1,8(sp)
    800049d8:	02010113          	addi	sp,sp,32
    800049dc:	00008067          	ret

00000000800049e0 <_ZN14ConsoleManager13consoleBuffer3putEc>:

void ConsoleManager::consoleBuffer::put(char c){
    800049e0:	ff010113          	addi	sp,sp,-16
    800049e4:	00113423          	sd	ra,8(sp)
    800049e8:	00813023          	sd	s0,0(sp)
    800049ec:	01010413          	addi	s0,sp,16
    buffer[tail] = c;
    800049f0:	21053783          	ld	a5,528(a0)
    800049f4:	00f50733          	add	a4,a0,a5
    800049f8:	00b70423          	sb	a1,8(a4)
    tail = (tail + 1) % BUFFER_SIZE;
    800049fc:	00178793          	addi	a5,a5,1
    80004a00:	1ff7f793          	andi	a5,a5,511
    80004a04:	20f53823          	sd	a5,528(a0)
    size++;
    80004a08:	21853783          	ld	a5,536(a0)
    80004a0c:	00178793          	addi	a5,a5,1
    80004a10:	20f53c23          	sd	a5,536(a0)
    sem_signal(sem);
    80004a14:	00053503          	ld	a0,0(a0)
    80004a18:	ffffd097          	auipc	ra,0xffffd
    80004a1c:	084080e7          	jalr	132(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    80004a20:	00813083          	ld	ra,8(sp)
    80004a24:	00013403          	ld	s0,0(sp)
    80004a28:	01010113          	addi	sp,sp,16
    80004a2c:	00008067          	ret

0000000080004a30 <_ZN14ConsoleManager13consoleBuffer3getEv>:

char ConsoleManager::consoleBuffer::get(){
    80004a30:	fe010113          	addi	sp,sp,-32
    80004a34:	00113c23          	sd	ra,24(sp)
    80004a38:	00813823          	sd	s0,16(sp)
    80004a3c:	00913423          	sd	s1,8(sp)
    80004a40:	02010413          	addi	s0,sp,32
    80004a44:	00050493          	mv	s1,a0
    sem_wait(sem);
    80004a48:	00053503          	ld	a0,0(a0)
    80004a4c:	ffffd097          	auipc	ra,0xffffd
    80004a50:	024080e7          	jalr	36(ra) # 80001a70 <_Z8sem_waitP4_sem>
    char c = buffer[head];
    80004a54:	2084b783          	ld	a5,520(s1)
    80004a58:	00f48733          	add	a4,s1,a5
    80004a5c:	00874503          	lbu	a0,8(a4)
    head = (head + 1) % BUFFER_SIZE;
    80004a60:	00178793          	addi	a5,a5,1
    80004a64:	1ff7f793          	andi	a5,a5,511
    80004a68:	20f4b423          	sd	a5,520(s1)
    size--;
    80004a6c:	2184b783          	ld	a5,536(s1)
    80004a70:	fff78793          	addi	a5,a5,-1
    80004a74:	20f4bc23          	sd	a5,536(s1)
    return c;
}
    80004a78:	01813083          	ld	ra,24(sp)
    80004a7c:	01013403          	ld	s0,16(sp)
    80004a80:	00813483          	ld	s1,8(sp)
    80004a84:	02010113          	addi	sp,sp,32
    80004a88:	00008067          	ret

0000000080004a8c <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>:

bool ConsoleManager::consoleBuffer::isEmpty(){
    80004a8c:	ff010113          	addi	sp,sp,-16
    80004a90:	00813423          	sd	s0,8(sp)
    80004a94:	01010413          	addi	s0,sp,16
    return size == 0;
    80004a98:	21853503          	ld	a0,536(a0)
}
    80004a9c:	00153513          	seqz	a0,a0
    80004aa0:	00813403          	ld	s0,8(sp)
    80004aa4:	01010113          	addi	sp,sp,16
    80004aa8:	00008067          	ret

0000000080004aac <_ZN14ConsoleManager13consoleBuffer6isFullEv>:

bool ConsoleManager::consoleBuffer::isFull(){
    80004aac:	ff010113          	addi	sp,sp,-16
    80004ab0:	00813423          	sd	s0,8(sp)
    80004ab4:	01010413          	addi	s0,sp,16
    return size == BUFFER_SIZE;
    80004ab8:	21853503          	ld	a0,536(a0)
    80004abc:	e0050513          	addi	a0,a0,-512
}
    80004ac0:	00153513          	seqz	a0,a0
    80004ac4:	00813403          	ld	s0,8(sp)
    80004ac8:	01010113          	addi	sp,sp,16
    80004acc:	00008067          	ret

0000000080004ad0 <_ZN14ConsoleManager4putcEc>:

void ConsoleManager::putc(char c){
    80004ad0:	ff010113          	addi	sp,sp,-16
    80004ad4:	00113423          	sd	ra,8(sp)
    80004ad8:	00813023          	sd	s0,0(sp)
    80004adc:	01010413          	addi	s0,sp,16
    80004ae0:	00050593          	mv	a1,a0
    instance->outBuffer.put(c);
    80004ae4:	00009517          	auipc	a0,0x9
    80004ae8:	6a453503          	ld	a0,1700(a0) # 8000e188 <_ZN14ConsoleManager8instanceE>
    80004aec:	22050513          	addi	a0,a0,544
    80004af0:	00000097          	auipc	ra,0x0
    80004af4:	ef0080e7          	jalr	-272(ra) # 800049e0 <_ZN14ConsoleManager13consoleBuffer3putEc>
}
    80004af8:	00813083          	ld	ra,8(sp)
    80004afc:	00013403          	ld	s0,0(sp)
    80004b00:	01010113          	addi	sp,sp,16
    80004b04:	00008067          	ret

0000000080004b08 <_ZN14ConsoleManager4getcEv>:

char ConsoleManager::getc(){
    80004b08:	fe010113          	addi	sp,sp,-32
    80004b0c:	00113c23          	sd	ra,24(sp)
    80004b10:	00813823          	sd	s0,16(sp)
    80004b14:	00913423          	sd	s1,8(sp)
    80004b18:	02010413          	addi	s0,sp,32
    instance->waitingThreads++;
    80004b1c:	00009497          	auipc	s1,0x9
    80004b20:	66c48493          	addi	s1,s1,1644 # 8000e188 <_ZN14ConsoleManager8instanceE>
    80004b24:	0004b503          	ld	a0,0(s1)
    80004b28:	44052783          	lw	a5,1088(a0)
    80004b2c:	0017879b          	addiw	a5,a5,1
    80004b30:	44f52023          	sw	a5,1088(a0)
    char c = instance->inBuffer.get();
    80004b34:	00000097          	auipc	ra,0x0
    80004b38:	efc080e7          	jalr	-260(ra) # 80004a30 <_ZN14ConsoleManager13consoleBuffer3getEv>
    instance->waitingThreads--;
    80004b3c:	0004b703          	ld	a4,0(s1)
    80004b40:	44072783          	lw	a5,1088(a4)
    80004b44:	fff7879b          	addiw	a5,a5,-1
    80004b48:	44f72023          	sw	a5,1088(a4)
    return c;
}
    80004b4c:	01813083          	ld	ra,24(sp)
    80004b50:	01013403          	ld	s0,16(sp)
    80004b54:	00813483          	ld	s1,8(sp)
    80004b58:	02010113          	addi	sp,sp,32
    80004b5c:	00008067          	ret

0000000080004b60 <_ZN14ConsoleManager8finishedEv>:

bool ConsoleManager::finished(){
    80004b60:	fe010113          	addi	sp,sp,-32
    80004b64:	00113c23          	sd	ra,24(sp)
    80004b68:	00813823          	sd	s0,16(sp)
    80004b6c:	00913423          	sd	s1,8(sp)
    80004b70:	02010413          	addi	s0,sp,32
    return instance->outBuffer.isEmpty() && instance->waitingThreads == 0;
    80004b74:	00009497          	auipc	s1,0x9
    80004b78:	6144b483          	ld	s1,1556(s1) # 8000e188 <_ZN14ConsoleManager8instanceE>
    80004b7c:	22048513          	addi	a0,s1,544
    80004b80:	00000097          	auipc	ra,0x0
    80004b84:	f0c080e7          	jalr	-244(ra) # 80004a8c <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>
    80004b88:	00050a63          	beqz	a0,80004b9c <_ZN14ConsoleManager8finishedEv+0x3c>
    80004b8c:	4404a783          	lw	a5,1088(s1)
    80004b90:	00078863          	beqz	a5,80004ba0 <_ZN14ConsoleManager8finishedEv+0x40>
    80004b94:	00000513          	li	a0,0
    80004b98:	0080006f          	j	80004ba0 <_ZN14ConsoleManager8finishedEv+0x40>
    80004b9c:	00000513          	li	a0,0
}
    80004ba0:	01813083          	ld	ra,24(sp)
    80004ba4:	01013403          	ld	s0,16(sp)
    80004ba8:	00813483          	ld	s1,8(sp)
    80004bac:	02010113          	addi	sp,sp,32
    80004bb0:	00008067          	ret

0000000080004bb4 <_ZN14ConsoleManager13outputHandlerEv>:

void ConsoleManager::outputHandler(){
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
    80004bb4:	00009797          	auipc	a5,0x9
    80004bb8:	5147b783          	ld	a5,1300(a5) # 8000e0c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80004bbc:	0007b783          	ld	a5,0(a5)
    80004bc0:	0007c783          	lbu	a5,0(a5)
    80004bc4:	0207f793          	andi	a5,a5,32
    80004bc8:	06078463          	beqz	a5,80004c30 <_ZN14ConsoleManager13outputHandlerEv+0x7c>
void ConsoleManager::outputHandler(){
    80004bcc:	fe010113          	addi	sp,sp,-32
    80004bd0:	00113c23          	sd	ra,24(sp)
    80004bd4:	00813823          	sd	s0,16(sp)
    80004bd8:	00913423          	sd	s1,8(sp)
    80004bdc:	02010413          	addi	s0,sp,32
        (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
    80004be0:	00009797          	auipc	a5,0x9
    80004be4:	4f87b783          	ld	a5,1272(a5) # 8000e0d8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80004be8:	0007b483          	ld	s1,0(a5)
    80004bec:	00009517          	auipc	a0,0x9
    80004bf0:	59c53503          	ld	a0,1436(a0) # 8000e188 <_ZN14ConsoleManager8instanceE>
    80004bf4:	22050513          	addi	a0,a0,544
    80004bf8:	00000097          	auipc	ra,0x0
    80004bfc:	e38080e7          	jalr	-456(ra) # 80004a30 <_ZN14ConsoleManager13consoleBuffer3getEv>
    80004c00:	00a48023          	sb	a0,0(s1)
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
    80004c04:	00009797          	auipc	a5,0x9
    80004c08:	4c47b783          	ld	a5,1220(a5) # 8000e0c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80004c0c:	0007b783          	ld	a5,0(a5)
    80004c10:	0007c783          	lbu	a5,0(a5)
    80004c14:	0207f793          	andi	a5,a5,32
    80004c18:	fc0794e3          	bnez	a5,80004be0 <_ZN14ConsoleManager13outputHandlerEv+0x2c>
    }
}
    80004c1c:	01813083          	ld	ra,24(sp)
    80004c20:	01013403          	ld	s0,16(sp)
    80004c24:	00813483          	ld	s1,8(sp)
    80004c28:	02010113          	addi	sp,sp,32
    80004c2c:	00008067          	ret
    80004c30:	00008067          	ret

0000000080004c34 <_ZN14ConsoleManager12inputHandlerEv>:

void ConsoleManager::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80004c34:	00009797          	auipc	a5,0x9
    80004c38:	4947b783          	ld	a5,1172(a5) # 8000e0c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80004c3c:	0007b783          	ld	a5,0(a5)
    80004c40:	0007c783          	lbu	a5,0(a5)
    80004c44:	0017f793          	andi	a5,a5,1
    80004c48:	04078e63          	beqz	a5,80004ca4 <_ZN14ConsoleManager12inputHandlerEv+0x70>
void ConsoleManager::inputHandler(){
    80004c4c:	ff010113          	addi	sp,sp,-16
    80004c50:	00113423          	sd	ra,8(sp)
    80004c54:	00813023          	sd	s0,0(sp)
    80004c58:	01010413          	addi	s0,sp,16
        char ch =(*(char*)CONSOLE_RX_DATA);
    80004c5c:	00009797          	auipc	a5,0x9
    80004c60:	4647b783          	ld	a5,1124(a5) # 8000e0c0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80004c64:	0007b783          	ld	a5,0(a5)
        instance->inBuffer.put(ch);
    80004c68:	0007c583          	lbu	a1,0(a5)
    80004c6c:	00009517          	auipc	a0,0x9
    80004c70:	51c53503          	ld	a0,1308(a0) # 8000e188 <_ZN14ConsoleManager8instanceE>
    80004c74:	00000097          	auipc	ra,0x0
    80004c78:	d6c080e7          	jalr	-660(ra) # 800049e0 <_ZN14ConsoleManager13consoleBuffer3putEc>
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80004c7c:	00009797          	auipc	a5,0x9
    80004c80:	44c7b783          	ld	a5,1100(a5) # 8000e0c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80004c84:	0007b783          	ld	a5,0(a5)
    80004c88:	0007c783          	lbu	a5,0(a5)
    80004c8c:	0017f793          	andi	a5,a5,1
    80004c90:	fc0796e3          	bnez	a5,80004c5c <_ZN14ConsoleManager12inputHandlerEv+0x28>
    }
    80004c94:	00813083          	ld	ra,8(sp)
    80004c98:	00013403          	ld	s0,0(sp)
    80004c9c:	01010113          	addi	sp,sp,16
    80004ca0:	00008067          	ret
    80004ca4:	00008067          	ret

0000000080004ca8 <exceptionHandler>:
#include "timer.h"
#include "assert.h"

// #include "console.h"

extern "C" void exceptionHandler(){
    80004ca8:	fb010113          	addi	sp,sp,-80
    80004cac:	04113423          	sd	ra,72(sp)
    80004cb0:	04813023          	sd	s0,64(sp)
    80004cb4:	02913c23          	sd	s1,56(sp)
    80004cb8:	03213823          	sd	s2,48(sp)
    80004cbc:	03313423          	sd	s3,40(sp)
    80004cc0:	03413023          	sd	s4,32(sp)
    80004cc4:	01513c23          	sd	s5,24(sp)
    80004cc8:	01613823          	sd	s6,16(sp)
    80004ccc:	01713423          	sd	s7,8(sp)
    80004cd0:	05010413          	addi	s0,sp,80
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    80004cd4:	00070b93          	mv	s7,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    80004cd8:	00068b13          	mv	s6,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    80004cdc:	00060a93          	mv	s5,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    80004ce0:	00058a13          	mv	s4,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80004ce4:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80004ce8:	14202973          	csrr	s2,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80004cec:	100029f3          	csrr	s3,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80004cf0:	141024f3          	csrr	s1,sepc


    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80004cf4:	ff890693          	addi	a3,s2,-8
    80004cf8:	00100713          	li	a4,1
    80004cfc:	04d77c63          	bgeu	a4,a3,80004d54 <exceptionHandler+0xac>
        __asm__ volatile("csrw scause, %0" :: "r"(scause));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    80004d00:	00500793          	li	a5,5
    80004d04:	1ef90263          	beq	s2,a5,80004ee8 <exceptionHandler+0x240>
                ConsoleManager::putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    80004d08:	00700793          	li	a5,7
    80004d0c:	38f90a63          	beq	s2,a5,800050a0 <exceptionHandler+0x3f8>
                ConsoleManager::putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    80004d10:	fff00793          	li	a5,-1
    80004d14:	03f79793          	slli	a5,a5,0x3f
    80004d18:	00178793          	addi	a5,a5,1
    80004d1c:	54f90463          	beq	s2,a5,80005264 <exceptionHandler+0x5bc>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    80004d20:	fff00793          	li	a5,-1
    80004d24:	03f79793          	slli	a5,a5,0x3f
    80004d28:	00978793          	addi	a5,a5,9
    80004d2c:	06f91c63          	bne	s2,a5,80004da4 <exceptionHandler+0xfc>
    {   
        int irq = plic_claim();
    80004d30:	00005097          	auipc	ra,0x5
    80004d34:	9c4080e7          	jalr	-1596(ra) # 800096f4 <plic_claim>
    80004d38:	00050493          	mv	s1,a0
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    80004d3c:	00a00793          	li	a5,10
    80004d40:	58f50463          	beq	a0,a5,800052c8 <exceptionHandler+0x620>
        plic_complete(irq);
    80004d44:	00048513          	mv	a0,s1
    80004d48:	00005097          	auipc	ra,0x5
    80004d4c:	9e4080e7          	jalr	-1564(ra) # 8000972c <plic_complete>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    80004d50:	0540006f          	j	80004da4 <exceptionHandler+0xfc>
        switch(a0){
    80004d54:	04200713          	li	a4,66
    80004d58:	18f76463          	bltu	a4,a5,80004ee0 <exceptionHandler+0x238>
    80004d5c:	00279793          	slli	a5,a5,0x2
    80004d60:	00006717          	auipc	a4,0x6
    80004d64:	61470713          	addi	a4,a4,1556 # 8000b374 <CONSOLE_STATUS+0x364>
    80004d68:	00e787b3          	add	a5,a5,a4
    80004d6c:	0007a783          	lw	a5,0(a5)
    80004d70:	00e787b3          	add	a5,a5,a4
    80004d74:	00078067          	jr	a5
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80004d78:	000a0593          	mv	a1,s4
    80004d7c:	00009797          	auipc	a5,0x9
    80004d80:	3647b783          	ld	a5,868(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004d84:	0007b503          	ld	a0,0(a5)
    80004d88:	fffff097          	auipc	ra,0xfffff
    80004d8c:	a00080e7          	jalr	-1536(ra) # 80003788 <_ZN11HeapManager12heapAllocateEm>
        __asm__ volatile("csrw scause, %0" :: "r"(scause));
    80004d90:	14291073          	csrw	scause,s2
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80004d94:	00448493          	addi	s1,s1,4
    80004d98:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004d9c:	10099073          	csrw	sstatus,s3
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80004da0:	00050513          	mv	a0,a0
    80004da4:	04813083          	ld	ra,72(sp)
    80004da8:	04013403          	ld	s0,64(sp)
    80004dac:	03813483          	ld	s1,56(sp)
    80004db0:	03013903          	ld	s2,48(sp)
    80004db4:	02813983          	ld	s3,40(sp)
    80004db8:	02013a03          	ld	s4,32(sp)
    80004dbc:	01813a83          	ld	s5,24(sp)
    80004dc0:	01013b03          	ld	s6,16(sp)
    80004dc4:	00813b83          	ld	s7,8(sp)
    80004dc8:	05010113          	addi	sp,sp,80
    80004dcc:	00008067          	ret
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    80004dd0:	000a0593          	mv	a1,s4
    80004dd4:	00009797          	auipc	a5,0x9
    80004dd8:	30c7b783          	ld	a5,780(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004ddc:	0007b503          	ld	a0,0(a5)
    80004de0:	fffff097          	auipc	ra,0xfffff
    80004de4:	028080e7          	jalr	40(ra) # 80003e08 <_ZN11HeapManager8heapFreeEPv>
                break;
    80004de8:	fa9ff06f          	j	80004d90 <exceptionHandler+0xe8>
                ConsoleManager::putc('\0'); /// removing this line causes everything to break
    80004dec:	00000513          	li	a0,0
    80004df0:	00000097          	auipc	ra,0x0
    80004df4:	ce0080e7          	jalr	-800(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    80004df8:	00100713          	li	a4,1
    80004dfc:	000b8693          	mv	a3,s7
    80004e00:	000b0613          	mv	a2,s6
    80004e04:	000a8593          	mv	a1,s5
    80004e08:	000a0513          	mv	a0,s4
    80004e0c:	ffffe097          	auipc	ra,0xffffe
    80004e10:	044080e7          	jalr	68(ra) # 80002e50 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80004e14:	f7dff06f          	j	80004d90 <exceptionHandler+0xe8>
                returnVal = _thread::currentThread->exit();
    80004e18:	ffffe097          	auipc	ra,0xffffe
    80004e1c:	598080e7          	jalr	1432(ra) # 800033b0 <_ZN7_thread4exitEv>
                break;
    80004e20:	f71ff06f          	j	80004d90 <exceptionHandler+0xe8>
                _thread::dispatch();
    80004e24:	ffffe097          	auipc	ra,0xffffe
    80004e28:	334080e7          	jalr	820(ra) # 80003158 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80004e2c:	00000513          	li	a0,0
                break;
    80004e30:	f61ff06f          	j	80004d90 <exceptionHandler+0xe8>
                _thread::currentThread->join((thread_t)a1);
    80004e34:	000a0593          	mv	a1,s4
    80004e38:	00009797          	auipc	a5,0x9
    80004e3c:	2c87b783          	ld	a5,712(a5) # 8000e100 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004e40:	0007b503          	ld	a0,0(a5)
    80004e44:	ffffe097          	auipc	ra,0xffffe
    80004e48:	3b4080e7          	jalr	948(ra) # 800031f8 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80004e4c:	00000513          	li	a0,0
                break;
    80004e50:	f41ff06f          	j	80004d90 <exceptionHandler+0xe8>
                _sem::open((sem_t*)a1, unsigned(a2));
    80004e54:	000a859b          	sext.w	a1,s5
    80004e58:	000a0513          	mv	a0,s4
    80004e5c:	ffffd097          	auipc	ra,0xffffd
    80004e60:	cb8080e7          	jalr	-840(ra) # 80001b14 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80004e64:	00000513          	li	a0,0
                break;
    80004e68:	f29ff06f          	j	80004d90 <exceptionHandler+0xe8>
                _sem::close((sem_t)a1);
    80004e6c:	000a0513          	mv	a0,s4
    80004e70:	ffffd097          	auipc	ra,0xffffd
    80004e74:	d0c080e7          	jalr	-756(ra) # 80001b7c <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80004e78:	00000513          	li	a0,0
                break;
    80004e7c:	f15ff06f          	j	80004d90 <exceptionHandler+0xe8>
                _sem::wait((sem_t)a1);
    80004e80:	000a0513          	mv	a0,s4
    80004e84:	ffffd097          	auipc	ra,0xffffd
    80004e88:	d64080e7          	jalr	-668(ra) # 80001be8 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    80004e8c:	00000513          	li	a0,0
                break;
    80004e90:	f01ff06f          	j	80004d90 <exceptionHandler+0xe8>
                _sem::signal((sem_t)a1);
    80004e94:	000a0513          	mv	a0,s4
    80004e98:	ffffd097          	auipc	ra,0xffffd
    80004e9c:	e00080e7          	jalr	-512(ra) # 80001c98 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80004ea0:	00000513          	li	a0,0
                break;
    80004ea4:	eedff06f          	j	80004d90 <exceptionHandler+0xe8>
                returnVal = Timer::getInstance().sleep(a1);
    80004ea8:	ffffc097          	auipc	ra,0xffffc
    80004eac:	7f0080e7          	jalr	2032(ra) # 80001698 <_ZN5Timer11getInstanceEv>
    80004eb0:	000a0593          	mv	a1,s4
    80004eb4:	ffffd097          	auipc	ra,0xffffd
    80004eb8:	8e0080e7          	jalr	-1824(ra) # 80001794 <_ZN5Timer5sleepEm>
                break;
    80004ebc:	ed5ff06f          	j	80004d90 <exceptionHandler+0xe8>
                returnVal = ConsoleManager::getc();
    80004ec0:	00000097          	auipc	ra,0x0
    80004ec4:	c48080e7          	jalr	-952(ra) # 80004b08 <_ZN14ConsoleManager4getcEv>
                break;
    80004ec8:	ec9ff06f          	j	80004d90 <exceptionHandler+0xe8>
                ConsoleManager::putc(a1);
    80004ecc:	0ffa7513          	andi	a0,s4,255
    80004ed0:	00000097          	auipc	ra,0x0
    80004ed4:	c00080e7          	jalr	-1024(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
    uint64 returnVal = 0;
    80004ed8:	00000513          	li	a0,0
                break;
    80004edc:	eb5ff06f          	j	80004d90 <exceptionHandler+0xe8>
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80004ee0:	00000513          	li	a0,0
    80004ee4:	eadff06f          	j	80004d90 <exceptionHandler+0xe8>
        ConsoleManager::putc('\n');
    80004ee8:	00a00513          	li	a0,10
    80004eec:	00000097          	auipc	ra,0x0
    80004ef0:	be4080e7          	jalr	-1052(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('E');
    80004ef4:	04500513          	li	a0,69
    80004ef8:	00000097          	auipc	ra,0x0
    80004efc:	bd8080e7          	jalr	-1064(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004f00:	07200513          	li	a0,114
    80004f04:	00000097          	auipc	ra,0x0
    80004f08:	bcc080e7          	jalr	-1076(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004f0c:	07200513          	li	a0,114
    80004f10:	00000097          	auipc	ra,0x0
    80004f14:	bc0080e7          	jalr	-1088(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('o');
    80004f18:	06f00513          	li	a0,111
    80004f1c:	00000097          	auipc	ra,0x0
    80004f20:	bb4080e7          	jalr	-1100(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004f24:	07200513          	li	a0,114
    80004f28:	00000097          	auipc	ra,0x0
    80004f2c:	ba8080e7          	jalr	-1112(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004f30:	03a00513          	li	a0,58
    80004f34:	00000097          	auipc	ra,0x0
    80004f38:	b9c080e7          	jalr	-1124(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004f3c:	02000513          	li	a0,32
    80004f40:	00000097          	auipc	ra,0x0
    80004f44:	b90080e7          	jalr	-1136(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80004f48:	06900513          	li	a0,105
    80004f4c:	00000097          	auipc	ra,0x0
    80004f50:	b84080e7          	jalr	-1148(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004f54:	06c00513          	li	a0,108
    80004f58:	00000097          	auipc	ra,0x0
    80004f5c:	b78080e7          	jalr	-1160(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004f60:	06c00513          	li	a0,108
    80004f64:	00000097          	auipc	ra,0x0
    80004f68:	b6c080e7          	jalr	-1172(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004f6c:	06500513          	li	a0,101
    80004f70:	00000097          	auipc	ra,0x0
    80004f74:	b60080e7          	jalr	-1184(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('g');
    80004f78:	06700513          	li	a0,103
    80004f7c:	00000097          	auipc	ra,0x0
    80004f80:	b54080e7          	jalr	-1196(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    80004f84:	06100513          	li	a0,97
    80004f88:	00000097          	auipc	ra,0x0
    80004f8c:	b48080e7          	jalr	-1208(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004f90:	06c00513          	li	a0,108
    80004f94:	00000097          	auipc	ra,0x0
    80004f98:	b3c080e7          	jalr	-1220(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004f9c:	02000513          	li	a0,32
    80004fa0:	00000097          	auipc	ra,0x0
    80004fa4:	b30080e7          	jalr	-1232(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004fa8:	07200513          	li	a0,114
    80004fac:	00000097          	auipc	ra,0x0
    80004fb0:	b24080e7          	jalr	-1244(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004fb4:	06500513          	li	a0,101
    80004fb8:	00000097          	auipc	ra,0x0
    80004fbc:	b18080e7          	jalr	-1256(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    80004fc0:	06100513          	li	a0,97
    80004fc4:	00000097          	auipc	ra,0x0
    80004fc8:	b0c080e7          	jalr	-1268(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('d');
    80004fcc:	06400513          	li	a0,100
    80004fd0:	00000097          	auipc	ra,0x0
    80004fd4:	b00080e7          	jalr	-1280(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('!');
    80004fd8:	02100513          	li	a0,33
    80004fdc:	00000097          	auipc	ra,0x0
    80004fe0:	af4080e7          	jalr	-1292(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('\n');
    80004fe4:	00a00513          	li	a0,10
    80004fe8:	00000097          	auipc	ra,0x0
    80004fec:	ae8080e7          	jalr	-1304(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('P');
    80004ff0:	05000513          	li	a0,80
    80004ff4:	00000097          	auipc	ra,0x0
    80004ff8:	adc080e7          	jalr	-1316(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('C');
    80004ffc:	04300513          	li	a0,67
    80005000:	00000097          	auipc	ra,0x0
    80005004:	ad0080e7          	jalr	-1328(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80005008:	03a00513          	li	a0,58
    8000500c:	00000097          	auipc	ra,0x0
    80005010:	ac4080e7          	jalr	-1340(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80005014:	02000513          	li	a0,32
    80005018:	00000097          	auipc	ra,0x0
    8000501c:	ab8080e7          	jalr	-1352(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('0');
    80005020:	03000513          	li	a0,48
    80005024:	00000097          	auipc	ra,0x0
    80005028:	aac080e7          	jalr	-1364(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('x');
    8000502c:	07800513          	li	a0,120
    80005030:	00000097          	auipc	ra,0x0
    80005034:	aa0080e7          	jalr	-1376(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80005038:	00f00913          	li	s2,15
    8000503c:	0140006f          	j	80005050 <exceptionHandler+0x3a8>
                ConsoleManager::putc('A' + tmp - 10);
    80005040:	03750513          	addi	a0,a0,55
    80005044:	00000097          	auipc	ra,0x0
    80005048:	a8c080e7          	jalr	-1396(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    8000504c:	fff9091b          	addiw	s2,s2,-1
    80005050:	02094463          	bltz	s2,80005078 <exceptionHandler+0x3d0>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80005054:	0029151b          	slliw	a0,s2,0x2
    80005058:	00a4d533          	srl	a0,s1,a0
    8000505c:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80005060:	00900793          	li	a5,9
    80005064:	fca7eee3          	bltu	a5,a0,80005040 <exceptionHandler+0x398>
                ConsoleManager::putc('0' + tmp);
    80005068:	03050513          	addi	a0,a0,48
    8000506c:	00000097          	auipc	ra,0x0
    80005070:	a64080e7          	jalr	-1436(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
    80005074:	fd9ff06f          	j	8000504c <exceptionHandler+0x3a4>
        assert(false);
    80005078:	00006697          	auipc	a3,0x6
    8000507c:	29868693          	addi	a3,a3,664 # 8000b310 <CONSOLE_STATUS+0x300>
    80005080:	07f00613          	li	a2,127
    80005084:	00006597          	auipc	a1,0x6
    80005088:	2a458593          	addi	a1,a1,676 # 8000b328 <CONSOLE_STATUS+0x318>
    8000508c:	00006517          	auipc	a0,0x6
    80005090:	2bc50513          	addi	a0,a0,700 # 8000b348 <CONSOLE_STATUS+0x338>
    80005094:	ffffd097          	auipc	ra,0xffffd
    80005098:	008080e7          	jalr	8(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    8000509c:	d09ff06f          	j	80004da4 <exceptionHandler+0xfc>
        ConsoleManager::putc('\n');
    800050a0:	00a00513          	li	a0,10
    800050a4:	00000097          	auipc	ra,0x0
    800050a8:	a2c080e7          	jalr	-1492(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('E');
    800050ac:	04500513          	li	a0,69
    800050b0:	00000097          	auipc	ra,0x0
    800050b4:	a20080e7          	jalr	-1504(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800050b8:	07200513          	li	a0,114
    800050bc:	00000097          	auipc	ra,0x0
    800050c0:	a14080e7          	jalr	-1516(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800050c4:	07200513          	li	a0,114
    800050c8:	00000097          	auipc	ra,0x0
    800050cc:	a08080e7          	jalr	-1528(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('o');
    800050d0:	06f00513          	li	a0,111
    800050d4:	00000097          	auipc	ra,0x0
    800050d8:	9fc080e7          	jalr	-1540(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800050dc:	07200513          	li	a0,114
    800050e0:	00000097          	auipc	ra,0x0
    800050e4:	9f0080e7          	jalr	-1552(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    800050e8:	03a00513          	li	a0,58
    800050ec:	00000097          	auipc	ra,0x0
    800050f0:	9e4080e7          	jalr	-1564(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    800050f4:	02000513          	li	a0,32
    800050f8:	00000097          	auipc	ra,0x0
    800050fc:	9d8080e7          	jalr	-1576(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80005100:	06900513          	li	a0,105
    80005104:	00000097          	auipc	ra,0x0
    80005108:	9cc080e7          	jalr	-1588(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    8000510c:	06c00513          	li	a0,108
    80005110:	00000097          	auipc	ra,0x0
    80005114:	9c0080e7          	jalr	-1600(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80005118:	06c00513          	li	a0,108
    8000511c:	00000097          	auipc	ra,0x0
    80005120:	9b4080e7          	jalr	-1612(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80005124:	06500513          	li	a0,101
    80005128:	00000097          	auipc	ra,0x0
    8000512c:	9a8080e7          	jalr	-1624(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('g');
    80005130:	06700513          	li	a0,103
    80005134:	00000097          	auipc	ra,0x0
    80005138:	99c080e7          	jalr	-1636(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    8000513c:	06100513          	li	a0,97
    80005140:	00000097          	auipc	ra,0x0
    80005144:	990080e7          	jalr	-1648(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80005148:	06c00513          	li	a0,108
    8000514c:	00000097          	auipc	ra,0x0
    80005150:	984080e7          	jalr	-1660(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80005154:	02000513          	li	a0,32
    80005158:	00000097          	auipc	ra,0x0
    8000515c:	978080e7          	jalr	-1672(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('w');
    80005160:	07700513          	li	a0,119
    80005164:	00000097          	auipc	ra,0x0
    80005168:	96c080e7          	jalr	-1684(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    8000516c:	07200513          	li	a0,114
    80005170:	00000097          	auipc	ra,0x0
    80005174:	960080e7          	jalr	-1696(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80005178:	06900513          	li	a0,105
    8000517c:	00000097          	auipc	ra,0x0
    80005180:	954080e7          	jalr	-1708(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('t');
    80005184:	07400513          	li	a0,116
    80005188:	00000097          	auipc	ra,0x0
    8000518c:	948080e7          	jalr	-1720(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80005190:	06500513          	li	a0,101
    80005194:	00000097          	auipc	ra,0x0
    80005198:	93c080e7          	jalr	-1732(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('!');
    8000519c:	02100513          	li	a0,33
    800051a0:	00000097          	auipc	ra,0x0
    800051a4:	930080e7          	jalr	-1744(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('\n');
    800051a8:	00a00513          	li	a0,10
    800051ac:	00000097          	auipc	ra,0x0
    800051b0:	924080e7          	jalr	-1756(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('P');
    800051b4:	05000513          	li	a0,80
    800051b8:	00000097          	auipc	ra,0x0
    800051bc:	918080e7          	jalr	-1768(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('C');
    800051c0:	04300513          	li	a0,67
    800051c4:	00000097          	auipc	ra,0x0
    800051c8:	90c080e7          	jalr	-1780(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    800051cc:	03a00513          	li	a0,58
    800051d0:	00000097          	auipc	ra,0x0
    800051d4:	900080e7          	jalr	-1792(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    800051d8:	02000513          	li	a0,32
    800051dc:	00000097          	auipc	ra,0x0
    800051e0:	8f4080e7          	jalr	-1804(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('0');
    800051e4:	03000513          	li	a0,48
    800051e8:	00000097          	auipc	ra,0x0
    800051ec:	8e8080e7          	jalr	-1816(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('x');
    800051f0:	07800513          	li	a0,120
    800051f4:	00000097          	auipc	ra,0x0
    800051f8:	8dc080e7          	jalr	-1828(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    800051fc:	00f00913          	li	s2,15
    80005200:	0140006f          	j	80005214 <exceptionHandler+0x56c>
                ConsoleManager::putc('A' + tmp - 10);
    80005204:	03750513          	addi	a0,a0,55
    80005208:	00000097          	auipc	ra,0x0
    8000520c:	8c8080e7          	jalr	-1848(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80005210:	fff9091b          	addiw	s2,s2,-1
    80005214:	02094463          	bltz	s2,8000523c <exceptionHandler+0x594>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80005218:	0029151b          	slliw	a0,s2,0x2
    8000521c:	00a4d533          	srl	a0,s1,a0
    80005220:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80005224:	00900793          	li	a5,9
    80005228:	fca7eee3          	bltu	a5,a0,80005204 <exceptionHandler+0x55c>
                ConsoleManager::putc('0' + tmp);
    8000522c:	03050513          	addi	a0,a0,48
    80005230:	00000097          	auipc	ra,0x0
    80005234:	8a0080e7          	jalr	-1888(ra) # 80004ad0 <_ZN14ConsoleManager4putcEc>
    80005238:	fd9ff06f          	j	80005210 <exceptionHandler+0x568>
        assert(false);
    8000523c:	00006697          	auipc	a3,0x6
    80005240:	0d468693          	addi	a3,a3,212 # 8000b310 <CONSOLE_STATUS+0x300>
    80005244:	0a700613          	li	a2,167
    80005248:	00006597          	auipc	a1,0x6
    8000524c:	0e058593          	addi	a1,a1,224 # 8000b328 <CONSOLE_STATUS+0x318>
    80005250:	00006517          	auipc	a0,0x6
    80005254:	0f850513          	addi	a0,a0,248 # 8000b348 <CONSOLE_STATUS+0x338>
    80005258:	ffffd097          	auipc	ra,0xffffd
    8000525c:	e44080e7          	jalr	-444(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80005260:	b45ff06f          	j	80004da4 <exceptionHandler+0xfc>
        Timer::getInstance().tick();
    80005264:	ffffc097          	auipc	ra,0xffffc
    80005268:	434080e7          	jalr	1076(ra) # 80001698 <_ZN5Timer11getInstanceEv>
    8000526c:	ffffc097          	auipc	ra,0xffffc
    80005270:	490080e7          	jalr	1168(ra) # 800016fc <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    80005274:	00009797          	auipc	a5,0x9
    80005278:	e8c7b783          	ld	a5,-372(a5) # 8000e100 <_GLOBAL_OFFSET_TABLE_+0x48>
    8000527c:	0007b503          	ld	a0,0(a5)
    80005280:	ffffe097          	auipc	ra,0xffffe
    80005284:	0a0080e7          	jalr	160(ra) # 80003320 <_ZN7_thread4tickEv>
    80005288:	00051c63          	bnez	a0,800052a0 <exceptionHandler+0x5f8>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    8000528c:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80005290:	10099073          	csrw	sstatus,s3
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80005294:	00200793          	li	a5,2
    80005298:	1447b073          	csrc	sip,a5
    8000529c:	b09ff06f          	j	80004da4 <exceptionHandler+0xfc>
        assert(_thread::currentThread->tick() == 0);
    800052a0:	00006697          	auipc	a3,0x6
    800052a4:	07068693          	addi	a3,a3,112 # 8000b310 <CONSOLE_STATUS+0x300>
    800052a8:	0ab00613          	li	a2,171
    800052ac:	00006597          	auipc	a1,0x6
    800052b0:	07c58593          	addi	a1,a1,124 # 8000b328 <CONSOLE_STATUS+0x318>
    800052b4:	00006517          	auipc	a0,0x6
    800052b8:	09c50513          	addi	a0,a0,156 # 8000b350 <CONSOLE_STATUS+0x340>
    800052bc:	ffffd097          	auipc	ra,0xffffd
    800052c0:	de0080e7          	jalr	-544(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    800052c4:	fc9ff06f          	j	8000528c <exceptionHandler+0x5e4>
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    800052c8:	00000097          	auipc	ra,0x0
    800052cc:	96c080e7          	jalr	-1684(ra) # 80004c34 <_ZN14ConsoleManager12inputHandlerEv>
    800052d0:	a75ff06f          	j	80004d44 <exceptionHandler+0x9c>

00000000800052d4 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    800052d4:	fe010113          	addi	sp,sp,-32
    800052d8:	00113c23          	sd	ra,24(sp)
    800052dc:	00813823          	sd	s0,16(sp)
    800052e0:	00913423          	sd	s1,8(sp)
    800052e4:	02010413          	addi	s0,sp,32
    800052e8:	00050493          	mv	s1,a0
    assert(singleton == 0);
    800052ec:	00009797          	auipc	a5,0x9
    800052f0:	ea47b783          	ld	a5,-348(a5) # 8000e190 <_ZN9Scheduler9singletonE>
    800052f4:	02079463          	bnez	a5,8000531c <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    800052f8:	00009797          	auipc	a5,0x9
    800052fc:	e897bc23          	sd	s1,-360(a5) # 8000e190 <_ZN9Scheduler9singletonE>
    head = 0;
    80005300:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80005304:	0004b423          	sd	zero,8(s1)
}
    80005308:	01813083          	ld	ra,24(sp)
    8000530c:	01013403          	ld	s0,16(sp)
    80005310:	00813483          	ld	s1,8(sp)
    80005314:	02010113          	addi	sp,sp,32
    80005318:	00008067          	ret
    assert(singleton == 0);
    8000531c:	00006697          	auipc	a3,0x6
    80005320:	16468693          	addi	a3,a3,356 # 8000b480 <CONSOLE_STATUS+0x470>
    80005324:	01800613          	li	a2,24
    80005328:	00006597          	auipc	a1,0x6
    8000532c:	17058593          	addi	a1,a1,368 # 8000b498 <CONSOLE_STATUS+0x488>
    80005330:	00006517          	auipc	a0,0x6
    80005334:	17850513          	addi	a0,a0,376 # 8000b4a8 <CONSOLE_STATUS+0x498>
    80005338:	ffffd097          	auipc	ra,0xffffd
    8000533c:	d64080e7          	jalr	-668(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80005340:	fb9ff06f          	j	800052f8 <_ZN9SchedulerC1Ev+0x24>

0000000080005344 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80005344:	ff010113          	addi	sp,sp,-16
    80005348:	00813423          	sd	s0,8(sp)
    8000534c:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80005350:	00009797          	auipc	a5,0x9
    80005354:	e407b783          	ld	a5,-448(a5) # 8000e190 <_ZN9Scheduler9singletonE>
    80005358:	0007b503          	ld	a0,0(a5)
}
    8000535c:	00153513          	seqz	a0,a0
    80005360:	00813403          	ld	s0,8(sp)
    80005364:	01010113          	addi	sp,sp,16
    80005368:	00008067          	ret

000000008000536c <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    8000536c:	fe010113          	addi	sp,sp,-32
    80005370:	00113c23          	sd	ra,24(sp)
    80005374:	00813823          	sd	s0,16(sp)
    80005378:	00913423          	sd	s1,8(sp)
    8000537c:	01213023          	sd	s2,0(sp)
    80005380:	02010413          	addi	s0,sp,32
    80005384:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80005388:	00009917          	auipc	s2,0x9
    8000538c:	e0893903          	ld	s2,-504(s2) # 8000e190 <_ZN9Scheduler9singletonE>
    80005390:	00093783          	ld	a5,0(s2)
    80005394:	14078263          	beqz	a5,800054d8 <_ZN9Scheduler3putEP7_thread+0x16c>
        singleton->head = singleton->tail = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80005398:	00893903          	ld	s2,8(s2)
    8000539c:	00100593          	li	a1,1
    800053a0:	00009797          	auipc	a5,0x9
    800053a4:	d407b783          	ld	a5,-704(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800053a8:	0007b503          	ld	a0,0(a5)
    800053ac:	ffffe097          	auipc	ra,0xffffe
    800053b0:	3dc080e7          	jalr	988(ra) # 80003788 <_ZN11HeapManager12heapAllocateEm>
    800053b4:	00a90423          	sb	a0,8(s2)
    800053b8:	00855793          	srli	a5,a0,0x8
    800053bc:	00f904a3          	sb	a5,9(s2)
    800053c0:	01055793          	srli	a5,a0,0x10
    800053c4:	00f90523          	sb	a5,10(s2)
    800053c8:	0185579b          	srliw	a5,a0,0x18
    800053cc:	00f905a3          	sb	a5,11(s2)
    800053d0:	02055793          	srli	a5,a0,0x20
    800053d4:	00f90623          	sb	a5,12(s2)
    800053d8:	02855793          	srli	a5,a0,0x28
    800053dc:	00f906a3          	sb	a5,13(s2)
    800053e0:	03055793          	srli	a5,a0,0x30
    800053e4:	00f90723          	sb	a5,14(s2)
    800053e8:	03855513          	srli	a0,a0,0x38
    800053ec:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    800053f0:	00009617          	auipc	a2,0x9
    800053f4:	da060613          	addi	a2,a2,-608 # 8000e190 <_ZN9Scheduler9singletonE>
    800053f8:	00063583          	ld	a1,0(a2)
    800053fc:	0085b703          	ld	a4,8(a1)
    80005400:	00874783          	lbu	a5,8(a4)
    80005404:	00974683          	lbu	a3,9(a4)
    80005408:	00869693          	slli	a3,a3,0x8
    8000540c:	00f6e6b3          	or	a3,a3,a5
    80005410:	00a74783          	lbu	a5,10(a4)
    80005414:	01079793          	slli	a5,a5,0x10
    80005418:	00d7e6b3          	or	a3,a5,a3
    8000541c:	00b74783          	lbu	a5,11(a4)
    80005420:	01879793          	slli	a5,a5,0x18
    80005424:	00d7e7b3          	or	a5,a5,a3
    80005428:	00c74683          	lbu	a3,12(a4)
    8000542c:	02069693          	slli	a3,a3,0x20
    80005430:	00f6e7b3          	or	a5,a3,a5
    80005434:	00d74683          	lbu	a3,13(a4)
    80005438:	02869693          	slli	a3,a3,0x28
    8000543c:	00f6e6b3          	or	a3,a3,a5
    80005440:	00e74783          	lbu	a5,14(a4)
    80005444:	03079793          	slli	a5,a5,0x30
    80005448:	00d7e6b3          	or	a3,a5,a3
    8000544c:	00f74783          	lbu	a5,15(a4)
    80005450:	03879793          	slli	a5,a5,0x38
    80005454:	00d7e7b3          	or	a5,a5,a3
    80005458:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    8000545c:	00978023          	sb	s1,0(a5)
    80005460:	0084d713          	srli	a4,s1,0x8
    80005464:	00e780a3          	sb	a4,1(a5)
    80005468:	0104d713          	srli	a4,s1,0x10
    8000546c:	00e78123          	sb	a4,2(a5)
    80005470:	0184d71b          	srliw	a4,s1,0x18
    80005474:	00e781a3          	sb	a4,3(a5)
    80005478:	0204d713          	srli	a4,s1,0x20
    8000547c:	00e78223          	sb	a4,4(a5)
    80005480:	0284d713          	srli	a4,s1,0x28
    80005484:	00e782a3          	sb	a4,5(a5)
    80005488:	0304d713          	srli	a4,s1,0x30
    8000548c:	00e78323          	sb	a4,6(a5)
    80005490:	0384d493          	srli	s1,s1,0x38
    80005494:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80005498:	00063783          	ld	a5,0(a2)
    8000549c:	0087b783          	ld	a5,8(a5)
    800054a0:	00078423          	sb	zero,8(a5)
    800054a4:	000784a3          	sb	zero,9(a5)
    800054a8:	00078523          	sb	zero,10(a5)
    800054ac:	000785a3          	sb	zero,11(a5)
    800054b0:	00078623          	sb	zero,12(a5)
    800054b4:	000786a3          	sb	zero,13(a5)
    800054b8:	00078723          	sb	zero,14(a5)
    800054bc:	000787a3          	sb	zero,15(a5)
    }
}
    800054c0:	01813083          	ld	ra,24(sp)
    800054c4:	01013403          	ld	s0,16(sp)
    800054c8:	00813483          	ld	s1,8(sp)
    800054cc:	00013903          	ld	s2,0(sp)
    800054d0:	02010113          	addi	sp,sp,32
    800054d4:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    800054d8:	00100593          	li	a1,1
    800054dc:	00009797          	auipc	a5,0x9
    800054e0:	c047b783          	ld	a5,-1020(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800054e4:	0007b503          	ld	a0,0(a5)
    800054e8:	ffffe097          	auipc	ra,0xffffe
    800054ec:	2a0080e7          	jalr	672(ra) # 80003788 <_ZN11HeapManager12heapAllocateEm>
    800054f0:	00a93423          	sd	a0,8(s2)
    800054f4:	00009717          	auipc	a4,0x9
    800054f8:	c9c70713          	addi	a4,a4,-868 # 8000e190 <_ZN9Scheduler9singletonE>
    800054fc:	00073783          	ld	a5,0(a4)
    80005500:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80005504:	00073783          	ld	a5,0(a4)
    80005508:	0007b783          	ld	a5,0(a5)
    8000550c:	00978023          	sb	s1,0(a5)
    80005510:	0084d693          	srli	a3,s1,0x8
    80005514:	00d780a3          	sb	a3,1(a5)
    80005518:	0104d693          	srli	a3,s1,0x10
    8000551c:	00d78123          	sb	a3,2(a5)
    80005520:	0184d69b          	srliw	a3,s1,0x18
    80005524:	00d781a3          	sb	a3,3(a5)
    80005528:	0204d693          	srli	a3,s1,0x20
    8000552c:	00d78223          	sb	a3,4(a5)
    80005530:	0284d693          	srli	a3,s1,0x28
    80005534:	00d782a3          	sb	a3,5(a5)
    80005538:	0304d693          	srli	a3,s1,0x30
    8000553c:	00d78323          	sb	a3,6(a5)
    80005540:	0384d493          	srli	s1,s1,0x38
    80005544:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80005548:	00073783          	ld	a5,0(a4)
    8000554c:	0007b783          	ld	a5,0(a5)
    80005550:	00078423          	sb	zero,8(a5)
    80005554:	000784a3          	sb	zero,9(a5)
    80005558:	00078523          	sb	zero,10(a5)
    8000555c:	000785a3          	sb	zero,11(a5)
    80005560:	00078623          	sb	zero,12(a5)
    80005564:	000786a3          	sb	zero,13(a5)
    80005568:	00078723          	sb	zero,14(a5)
    8000556c:	000787a3          	sb	zero,15(a5)
    80005570:	f51ff06f          	j	800054c0 <_ZN9Scheduler3putEP7_thread+0x154>

0000000080005574 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80005574:	fe010113          	addi	sp,sp,-32
    80005578:	00113c23          	sd	ra,24(sp)
    8000557c:	00813823          	sd	s0,16(sp)
    80005580:	00913423          	sd	s1,8(sp)
    80005584:	02010413          	addi	s0,sp,32
    if(singleton->head == 0){
    80005588:	00009697          	auipc	a3,0x9
    8000558c:	c086b683          	ld	a3,-1016(a3) # 8000e190 <_ZN9Scheduler9singletonE>
    80005590:	0006b583          	ld	a1,0(a3)
    80005594:	0e058e63          	beqz	a1,80005690 <_ZN9Scheduler3getEv+0x11c>
        return 0;
    }
    ThreadList* tmp = singleton->head;
    singleton->head = singleton->head->next;
    80005598:	0085c783          	lbu	a5,8(a1)
    8000559c:	0095c703          	lbu	a4,9(a1)
    800055a0:	00871713          	slli	a4,a4,0x8
    800055a4:	00f76733          	or	a4,a4,a5
    800055a8:	00a5c783          	lbu	a5,10(a1)
    800055ac:	01079793          	slli	a5,a5,0x10
    800055b0:	00e7e733          	or	a4,a5,a4
    800055b4:	00b5c783          	lbu	a5,11(a1)
    800055b8:	01879793          	slli	a5,a5,0x18
    800055bc:	00e7e7b3          	or	a5,a5,a4
    800055c0:	00c5c703          	lbu	a4,12(a1)
    800055c4:	02071713          	slli	a4,a4,0x20
    800055c8:	00f767b3          	or	a5,a4,a5
    800055cc:	00d5c703          	lbu	a4,13(a1)
    800055d0:	02871713          	slli	a4,a4,0x28
    800055d4:	00f76733          	or	a4,a4,a5
    800055d8:	00e5c783          	lbu	a5,14(a1)
    800055dc:	03079793          	slli	a5,a5,0x30
    800055e0:	00e7e733          	or	a4,a5,a4
    800055e4:	00f5c783          	lbu	a5,15(a1)
    800055e8:	03879793          	slli	a5,a5,0x38
    800055ec:	00e7e7b3          	or	a5,a5,a4
    800055f0:	00f6b023          	sd	a5,0(a3)
    if(singleton->head == 0){
    800055f4:	00009797          	auipc	a5,0x9
    800055f8:	b9c7b783          	ld	a5,-1124(a5) # 8000e190 <_ZN9Scheduler9singletonE>
    800055fc:	0007b703          	ld	a4,0(a5)
    80005600:	08070463          	beqz	a4,80005688 <_ZN9Scheduler3getEv+0x114>
        singleton->tail = 0;
    }
    thread_t thread = tmp->thread;
    80005604:	0005c483          	lbu	s1,0(a1)
    80005608:	0015c783          	lbu	a5,1(a1)
    8000560c:	00879793          	slli	a5,a5,0x8
    80005610:	0097e7b3          	or	a5,a5,s1
    80005614:	0025c483          	lbu	s1,2(a1)
    80005618:	01049493          	slli	s1,s1,0x10
    8000561c:	00f4e7b3          	or	a5,s1,a5
    80005620:	0035c483          	lbu	s1,3(a1)
    80005624:	01849493          	slli	s1,s1,0x18
    80005628:	00f4e4b3          	or	s1,s1,a5
    8000562c:	0045c783          	lbu	a5,4(a1)
    80005630:	02079793          	slli	a5,a5,0x20
    80005634:	0097e4b3          	or	s1,a5,s1
    80005638:	0055c783          	lbu	a5,5(a1)
    8000563c:	02879793          	slli	a5,a5,0x28
    80005640:	0097e7b3          	or	a5,a5,s1
    80005644:	0065c483          	lbu	s1,6(a1)
    80005648:	03049493          	slli	s1,s1,0x30
    8000564c:	00f4e7b3          	or	a5,s1,a5
    80005650:	0075c483          	lbu	s1,7(a1)
    80005654:	03849493          	slli	s1,s1,0x38
    80005658:	00f4e4b3          	or	s1,s1,a5
    HeapManager::getInstance().heapFree(tmp);
    8000565c:	00009797          	auipc	a5,0x9
    80005660:	a847b783          	ld	a5,-1404(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80005664:	0007b503          	ld	a0,0(a5)
    80005668:	ffffe097          	auipc	ra,0xffffe
    8000566c:	7a0080e7          	jalr	1952(ra) # 80003e08 <_ZN11HeapManager8heapFreeEPv>
    return thread;
}
    80005670:	00048513          	mv	a0,s1
    80005674:	01813083          	ld	ra,24(sp)
    80005678:	01013403          	ld	s0,16(sp)
    8000567c:	00813483          	ld	s1,8(sp)
    80005680:	02010113          	addi	sp,sp,32
    80005684:	00008067          	ret
        singleton->tail = 0;
    80005688:	0007b423          	sd	zero,8(a5)
    8000568c:	f79ff06f          	j	80005604 <_ZN9Scheduler3getEv+0x90>
        return 0;
    80005690:	00058493          	mv	s1,a1
    80005694:	fddff06f          	j	80005670 <_ZN9Scheduler3getEv+0xfc>

0000000080005698 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80005698:	ff010113          	addi	sp,sp,-16
    8000569c:	00813423          	sd	s0,8(sp)
    800056a0:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    800056a4:	00009797          	auipc	a5,0x9
    800056a8:	aec7b783          	ld	a5,-1300(a5) # 8000e190 <_ZN9Scheduler9singletonE>
    800056ac:	0007b783          	ld	a5,0(a5)
    int count = 0;
    800056b0:	00000513          	li	a0,0
    while(tmp != 0){
    800056b4:	06078263          	beqz	a5,80005718 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    800056b8:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    800056bc:	0087c683          	lbu	a3,8(a5)
    800056c0:	0097c703          	lbu	a4,9(a5)
    800056c4:	00871713          	slli	a4,a4,0x8
    800056c8:	00d766b3          	or	a3,a4,a3
    800056cc:	00a7c703          	lbu	a4,10(a5)
    800056d0:	01071713          	slli	a4,a4,0x10
    800056d4:	00d76733          	or	a4,a4,a3
    800056d8:	00b7c683          	lbu	a3,11(a5)
    800056dc:	01869693          	slli	a3,a3,0x18
    800056e0:	00e6e733          	or	a4,a3,a4
    800056e4:	00c7c683          	lbu	a3,12(a5)
    800056e8:	02069693          	slli	a3,a3,0x20
    800056ec:	00e6e6b3          	or	a3,a3,a4
    800056f0:	00d7c703          	lbu	a4,13(a5)
    800056f4:	02871713          	slli	a4,a4,0x28
    800056f8:	00d766b3          	or	a3,a4,a3
    800056fc:	00e7c703          	lbu	a4,14(a5)
    80005700:	03071713          	slli	a4,a4,0x30
    80005704:	00d76733          	or	a4,a4,a3
    80005708:	00f7c783          	lbu	a5,15(a5)
    8000570c:	03879793          	slli	a5,a5,0x38
    80005710:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80005714:	fa1ff06f          	j	800056b4 <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80005718:	00813403          	ld	s0,8(sp)
    8000571c:	01010113          	addi	sp,sp,16
    80005720:	00008067          	ret

0000000080005724 <_ZN6BufferC1Ei>:
#include "../test_h/buffer.h"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005724:	fe010113          	addi	sp,sp,-32
    80005728:	00113c23          	sd	ra,24(sp)
    8000572c:	00813823          	sd	s0,16(sp)
    80005730:	00913423          	sd	s1,8(sp)
    80005734:	01213023          	sd	s2,0(sp)
    80005738:	02010413          	addi	s0,sp,32
    8000573c:	00050493          	mv	s1,a0
    80005740:	00058913          	mv	s2,a1
    80005744:	0015879b          	addiw	a5,a1,1
    80005748:	0007851b          	sext.w	a0,a5
    8000574c:	00f4a023          	sw	a5,0(s1)
    80005750:	0004a823          	sw	zero,16(s1)
    80005754:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005758:	00251513          	slli	a0,a0,0x2
    8000575c:	ffffc097          	auipc	ra,0xffffc
    80005760:	148080e7          	jalr	328(ra) # 800018a4 <_Z9mem_allocm>
    80005764:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80005768:	00000593          	li	a1,0
    8000576c:	02048513          	addi	a0,s1,32
    80005770:	ffffc097          	auipc	ra,0xffffc
    80005774:	29c080e7          	jalr	668(ra) # 80001a0c <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80005778:	00090593          	mv	a1,s2
    8000577c:	01848513          	addi	a0,s1,24
    80005780:	ffffc097          	auipc	ra,0xffffc
    80005784:	28c080e7          	jalr	652(ra) # 80001a0c <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80005788:	00100593          	li	a1,1
    8000578c:	02848513          	addi	a0,s1,40
    80005790:	ffffc097          	auipc	ra,0xffffc
    80005794:	27c080e7          	jalr	636(ra) # 80001a0c <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80005798:	00100593          	li	a1,1
    8000579c:	03048513          	addi	a0,s1,48
    800057a0:	ffffc097          	auipc	ra,0xffffc
    800057a4:	26c080e7          	jalr	620(ra) # 80001a0c <_Z8sem_openPP4_semj>
}
    800057a8:	01813083          	ld	ra,24(sp)
    800057ac:	01013403          	ld	s0,16(sp)
    800057b0:	00813483          	ld	s1,8(sp)
    800057b4:	00013903          	ld	s2,0(sp)
    800057b8:	02010113          	addi	sp,sp,32
    800057bc:	00008067          	ret

00000000800057c0 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800057c0:	fe010113          	addi	sp,sp,-32
    800057c4:	00113c23          	sd	ra,24(sp)
    800057c8:	00813823          	sd	s0,16(sp)
    800057cc:	00913423          	sd	s1,8(sp)
    800057d0:	01213023          	sd	s2,0(sp)
    800057d4:	02010413          	addi	s0,sp,32
    800057d8:	00050493          	mv	s1,a0
    800057dc:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800057e0:	01853503          	ld	a0,24(a0)
    800057e4:	ffffc097          	auipc	ra,0xffffc
    800057e8:	28c080e7          	jalr	652(ra) # 80001a70 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    800057ec:	0304b503          	ld	a0,48(s1)
    800057f0:	ffffc097          	auipc	ra,0xffffc
    800057f4:	280080e7          	jalr	640(ra) # 80001a70 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    800057f8:	0084b783          	ld	a5,8(s1)
    800057fc:	0144a703          	lw	a4,20(s1)
    80005800:	00271713          	slli	a4,a4,0x2
    80005804:	00e787b3          	add	a5,a5,a4
    80005808:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000580c:	0144a783          	lw	a5,20(s1)
    80005810:	0017879b          	addiw	a5,a5,1
    80005814:	0004a703          	lw	a4,0(s1)
    80005818:	02e7e7bb          	remw	a5,a5,a4
    8000581c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80005820:	0304b503          	ld	a0,48(s1)
    80005824:	ffffc097          	auipc	ra,0xffffc
    80005828:	278080e7          	jalr	632(ra) # 80001a9c <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    8000582c:	0204b503          	ld	a0,32(s1)
    80005830:	ffffc097          	auipc	ra,0xffffc
    80005834:	26c080e7          	jalr	620(ra) # 80001a9c <_Z10sem_signalP4_sem>

}
    80005838:	01813083          	ld	ra,24(sp)
    8000583c:	01013403          	ld	s0,16(sp)
    80005840:	00813483          	ld	s1,8(sp)
    80005844:	00013903          	ld	s2,0(sp)
    80005848:	02010113          	addi	sp,sp,32
    8000584c:	00008067          	ret

0000000080005850 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80005850:	fe010113          	addi	sp,sp,-32
    80005854:	00113c23          	sd	ra,24(sp)
    80005858:	00813823          	sd	s0,16(sp)
    8000585c:	00913423          	sd	s1,8(sp)
    80005860:	01213023          	sd	s2,0(sp)
    80005864:	02010413          	addi	s0,sp,32
    80005868:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    8000586c:	02053503          	ld	a0,32(a0)
    80005870:	ffffc097          	auipc	ra,0xffffc
    80005874:	200080e7          	jalr	512(ra) # 80001a70 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80005878:	0284b503          	ld	a0,40(s1)
    8000587c:	ffffc097          	auipc	ra,0xffffc
    80005880:	1f4080e7          	jalr	500(ra) # 80001a70 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80005884:	0084b703          	ld	a4,8(s1)
    80005888:	0104a783          	lw	a5,16(s1)
    8000588c:	00279693          	slli	a3,a5,0x2
    80005890:	00d70733          	add	a4,a4,a3
    80005894:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005898:	0017879b          	addiw	a5,a5,1
    8000589c:	0004a703          	lw	a4,0(s1)
    800058a0:	02e7e7bb          	remw	a5,a5,a4
    800058a4:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800058a8:	0284b503          	ld	a0,40(s1)
    800058ac:	ffffc097          	auipc	ra,0xffffc
    800058b0:	1f0080e7          	jalr	496(ra) # 80001a9c <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    800058b4:	0184b503          	ld	a0,24(s1)
    800058b8:	ffffc097          	auipc	ra,0xffffc
    800058bc:	1e4080e7          	jalr	484(ra) # 80001a9c <_Z10sem_signalP4_sem>

    return ret;
}
    800058c0:	00090513          	mv	a0,s2
    800058c4:	01813083          	ld	ra,24(sp)
    800058c8:	01013403          	ld	s0,16(sp)
    800058cc:	00813483          	ld	s1,8(sp)
    800058d0:	00013903          	ld	s2,0(sp)
    800058d4:	02010113          	addi	sp,sp,32
    800058d8:	00008067          	ret

00000000800058dc <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800058dc:	fe010113          	addi	sp,sp,-32
    800058e0:	00113c23          	sd	ra,24(sp)
    800058e4:	00813823          	sd	s0,16(sp)
    800058e8:	00913423          	sd	s1,8(sp)
    800058ec:	01213023          	sd	s2,0(sp)
    800058f0:	02010413          	addi	s0,sp,32
    800058f4:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800058f8:	02853503          	ld	a0,40(a0)
    800058fc:	ffffc097          	auipc	ra,0xffffc
    80005900:	174080e7          	jalr	372(ra) # 80001a70 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80005904:	0304b503          	ld	a0,48(s1)
    80005908:	ffffc097          	auipc	ra,0xffffc
    8000590c:	168080e7          	jalr	360(ra) # 80001a70 <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80005910:	0144a783          	lw	a5,20(s1)
    80005914:	0104a903          	lw	s2,16(s1)
    80005918:	0327ce63          	blt	a5,s2,80005954 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    8000591c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80005920:	0304b503          	ld	a0,48(s1)
    80005924:	ffffc097          	auipc	ra,0xffffc
    80005928:	178080e7          	jalr	376(ra) # 80001a9c <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    8000592c:	0284b503          	ld	a0,40(s1)
    80005930:	ffffc097          	auipc	ra,0xffffc
    80005934:	16c080e7          	jalr	364(ra) # 80001a9c <_Z10sem_signalP4_sem>

    return ret;
}
    80005938:	00090513          	mv	a0,s2
    8000593c:	01813083          	ld	ra,24(sp)
    80005940:	01013403          	ld	s0,16(sp)
    80005944:	00813483          	ld	s1,8(sp)
    80005948:	00013903          	ld	s2,0(sp)
    8000594c:	02010113          	addi	sp,sp,32
    80005950:	00008067          	ret
        ret = cap - head + tail;
    80005954:	0004a703          	lw	a4,0(s1)
    80005958:	4127093b          	subw	s2,a4,s2
    8000595c:	00f9093b          	addw	s2,s2,a5
    80005960:	fc1ff06f          	j	80005920 <_ZN6Buffer6getCntEv+0x44>

0000000080005964 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80005964:	fe010113          	addi	sp,sp,-32
    80005968:	00113c23          	sd	ra,24(sp)
    8000596c:	00813823          	sd	s0,16(sp)
    80005970:	00913423          	sd	s1,8(sp)
    80005974:	02010413          	addi	s0,sp,32
    80005978:	00050493          	mv	s1,a0
    putc('\n');
    8000597c:	00a00513          	li	a0,10
    80005980:	ffffc097          	auipc	ra,0xffffc
    80005984:	170080e7          	jalr	368(ra) # 80001af0 <_Z4putcc>
    printString("Buffer deleted!\n");
    80005988:	00006517          	auipc	a0,0x6
    8000598c:	b3050513          	addi	a0,a0,-1232 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    80005990:	00003097          	auipc	ra,0x3
    80005994:	9a8080e7          	jalr	-1624(ra) # 80008338 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80005998:	00048513          	mv	a0,s1
    8000599c:	00000097          	auipc	ra,0x0
    800059a0:	f40080e7          	jalr	-192(ra) # 800058dc <_ZN6Buffer6getCntEv>
    800059a4:	02a05c63          	blez	a0,800059dc <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800059a8:	0084b783          	ld	a5,8(s1)
    800059ac:	0104a703          	lw	a4,16(s1)
    800059b0:	00271713          	slli	a4,a4,0x2
    800059b4:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800059b8:	0007c503          	lbu	a0,0(a5)
    800059bc:	ffffc097          	auipc	ra,0xffffc
    800059c0:	134080e7          	jalr	308(ra) # 80001af0 <_Z4putcc>
        head = (head + 1) % cap;
    800059c4:	0104a783          	lw	a5,16(s1)
    800059c8:	0017879b          	addiw	a5,a5,1
    800059cc:	0004a703          	lw	a4,0(s1)
    800059d0:	02e7e7bb          	remw	a5,a5,a4
    800059d4:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800059d8:	fc1ff06f          	j	80005998 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800059dc:	02100513          	li	a0,33
    800059e0:	ffffc097          	auipc	ra,0xffffc
    800059e4:	110080e7          	jalr	272(ra) # 80001af0 <_Z4putcc>
    putc('\n');
    800059e8:	00a00513          	li	a0,10
    800059ec:	ffffc097          	auipc	ra,0xffffc
    800059f0:	104080e7          	jalr	260(ra) # 80001af0 <_Z4putcc>
    mem_free(buffer);
    800059f4:	0084b503          	ld	a0,8(s1)
    800059f8:	ffffc097          	auipc	ra,0xffffc
    800059fc:	edc080e7          	jalr	-292(ra) # 800018d4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80005a00:	0204b503          	ld	a0,32(s1)
    80005a04:	ffffc097          	auipc	ra,0xffffc
    80005a08:	040080e7          	jalr	64(ra) # 80001a44 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80005a0c:	0184b503          	ld	a0,24(s1)
    80005a10:	ffffc097          	auipc	ra,0xffffc
    80005a14:	034080e7          	jalr	52(ra) # 80001a44 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80005a18:	0304b503          	ld	a0,48(s1)
    80005a1c:	ffffc097          	auipc	ra,0xffffc
    80005a20:	028080e7          	jalr	40(ra) # 80001a44 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80005a24:	0284b503          	ld	a0,40(s1)
    80005a28:	ffffc097          	auipc	ra,0xffffc
    80005a2c:	01c080e7          	jalr	28(ra) # 80001a44 <_Z9sem_closeP4_sem>
}
    80005a30:	01813083          	ld	ra,24(sp)
    80005a34:	01013403          	ld	s0,16(sp)
    80005a38:	00813483          	ld	s1,8(sp)
    80005a3c:	02010113          	addi	sp,sp,32
    80005a40:	00008067          	ret

0000000080005a44 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80005a44:	fe010113          	addi	sp,sp,-32
    80005a48:	00113c23          	sd	ra,24(sp)
    80005a4c:	00813823          	sd	s0,16(sp)
    80005a50:	00913423          	sd	s1,8(sp)
    80005a54:	01213023          	sd	s2,0(sp)
    80005a58:	02010413          	addi	s0,sp,32
    80005a5c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005a60:	00000913          	li	s2,0
    80005a64:	00c0006f          	j	80005a70 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80005a68:	ffffc097          	auipc	ra,0xffffc
    80005a6c:	f34080e7          	jalr	-204(ra) # 8000199c <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80005a70:	ffffc097          	auipc	ra,0xffffc
    80005a74:	058080e7          	jalr	88(ra) # 80001ac8 <_Z4getcv>
    80005a78:	0005059b          	sext.w	a1,a0
    80005a7c:	01b00793          	li	a5,27
    80005a80:	02f58a63          	beq	a1,a5,80005ab4 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80005a84:	0084b503          	ld	a0,8(s1)
    80005a88:	00000097          	auipc	ra,0x0
    80005a8c:	d38080e7          	jalr	-712(ra) # 800057c0 <_ZN6Buffer3putEi>
        i++;
    80005a90:	0019071b          	addiw	a4,s2,1
    80005a94:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005a98:	0004a683          	lw	a3,0(s1)
    80005a9c:	0026979b          	slliw	a5,a3,0x2
    80005aa0:	00d787bb          	addw	a5,a5,a3
    80005aa4:	0017979b          	slliw	a5,a5,0x1
    80005aa8:	02f767bb          	remw	a5,a4,a5
    80005aac:	fc0792e3          	bnez	a5,80005a70 <_ZL16producerKeyboardPv+0x2c>
    80005ab0:	fb9ff06f          	j	80005a68 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80005ab4:	00100793          	li	a5,1
    80005ab8:	00008717          	auipc	a4,0x8
    80005abc:	6ef72023          	sw	a5,1760(a4) # 8000e198 <_ZL9threadEnd>
    data->buffer->put('!');
    80005ac0:	02100593          	li	a1,33
    80005ac4:	0084b503          	ld	a0,8(s1)
    80005ac8:	00000097          	auipc	ra,0x0
    80005acc:	cf8080e7          	jalr	-776(ra) # 800057c0 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80005ad0:	0104b503          	ld	a0,16(s1)
    80005ad4:	ffffc097          	auipc	ra,0xffffc
    80005ad8:	fc8080e7          	jalr	-56(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    80005adc:	01813083          	ld	ra,24(sp)
    80005ae0:	01013403          	ld	s0,16(sp)
    80005ae4:	00813483          	ld	s1,8(sp)
    80005ae8:	00013903          	ld	s2,0(sp)
    80005aec:	02010113          	addi	sp,sp,32
    80005af0:	00008067          	ret

0000000080005af4 <_ZL8producerPv>:

static void producer(void *arg) {
    80005af4:	fe010113          	addi	sp,sp,-32
    80005af8:	00113c23          	sd	ra,24(sp)
    80005afc:	00813823          	sd	s0,16(sp)
    80005b00:	00913423          	sd	s1,8(sp)
    80005b04:	01213023          	sd	s2,0(sp)
    80005b08:	02010413          	addi	s0,sp,32
    80005b0c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005b10:	00000913          	li	s2,0
    80005b14:	00c0006f          	j	80005b20 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80005b18:	ffffc097          	auipc	ra,0xffffc
    80005b1c:	e84080e7          	jalr	-380(ra) # 8000199c <_Z15thread_dispatchv>
    while (!threadEnd) {
    80005b20:	00008797          	auipc	a5,0x8
    80005b24:	6787a783          	lw	a5,1656(a5) # 8000e198 <_ZL9threadEnd>
    80005b28:	02079e63          	bnez	a5,80005b64 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80005b2c:	0004a583          	lw	a1,0(s1)
    80005b30:	0305859b          	addiw	a1,a1,48
    80005b34:	0084b503          	ld	a0,8(s1)
    80005b38:	00000097          	auipc	ra,0x0
    80005b3c:	c88080e7          	jalr	-888(ra) # 800057c0 <_ZN6Buffer3putEi>
        i++;
    80005b40:	0019071b          	addiw	a4,s2,1
    80005b44:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005b48:	0004a683          	lw	a3,0(s1)
    80005b4c:	0026979b          	slliw	a5,a3,0x2
    80005b50:	00d787bb          	addw	a5,a5,a3
    80005b54:	0017979b          	slliw	a5,a5,0x1
    80005b58:	02f767bb          	remw	a5,a4,a5
    80005b5c:	fc0792e3          	bnez	a5,80005b20 <_ZL8producerPv+0x2c>
    80005b60:	fb9ff06f          	j	80005b18 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80005b64:	0104b503          	ld	a0,16(s1)
    80005b68:	ffffc097          	auipc	ra,0xffffc
    80005b6c:	f34080e7          	jalr	-204(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    80005b70:	01813083          	ld	ra,24(sp)
    80005b74:	01013403          	ld	s0,16(sp)
    80005b78:	00813483          	ld	s1,8(sp)
    80005b7c:	00013903          	ld	s2,0(sp)
    80005b80:	02010113          	addi	sp,sp,32
    80005b84:	00008067          	ret

0000000080005b88 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80005b88:	fd010113          	addi	sp,sp,-48
    80005b8c:	02113423          	sd	ra,40(sp)
    80005b90:	02813023          	sd	s0,32(sp)
    80005b94:	00913c23          	sd	s1,24(sp)
    80005b98:	01213823          	sd	s2,16(sp)
    80005b9c:	01313423          	sd	s3,8(sp)
    80005ba0:	03010413          	addi	s0,sp,48
    80005ba4:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005ba8:	00000993          	li	s3,0
    80005bac:	01c0006f          	j	80005bc8 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80005bb0:	ffffc097          	auipc	ra,0xffffc
    80005bb4:	dec080e7          	jalr	-532(ra) # 8000199c <_Z15thread_dispatchv>
    80005bb8:	0500006f          	j	80005c08 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005bbc:	00a00513          	li	a0,10
    80005bc0:	ffffc097          	auipc	ra,0xffffc
    80005bc4:	f30080e7          	jalr	-208(ra) # 80001af0 <_Z4putcc>
    while (!threadEnd) {
    80005bc8:	00008797          	auipc	a5,0x8
    80005bcc:	5d07a783          	lw	a5,1488(a5) # 8000e198 <_ZL9threadEnd>
    80005bd0:	06079063          	bnez	a5,80005c30 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80005bd4:	00893503          	ld	a0,8(s2)
    80005bd8:	00000097          	auipc	ra,0x0
    80005bdc:	c78080e7          	jalr	-904(ra) # 80005850 <_ZN6Buffer3getEv>
        i++;
    80005be0:	0019849b          	addiw	s1,s3,1
    80005be4:	0004899b          	sext.w	s3,s1
        putc(key);
    80005be8:	0ff57513          	andi	a0,a0,255
    80005bec:	ffffc097          	auipc	ra,0xffffc
    80005bf0:	f04080e7          	jalr	-252(ra) # 80001af0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005bf4:	00092703          	lw	a4,0(s2)
    80005bf8:	0027179b          	slliw	a5,a4,0x2
    80005bfc:	00e787bb          	addw	a5,a5,a4
    80005c00:	02f4e7bb          	remw	a5,s1,a5
    80005c04:	fa0786e3          	beqz	a5,80005bb0 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80005c08:	05000793          	li	a5,80
    80005c0c:	02f4e4bb          	remw	s1,s1,a5
    80005c10:	fa049ce3          	bnez	s1,80005bc8 <_ZL8consumerPv+0x40>
    80005c14:	fa9ff06f          	j	80005bbc <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80005c18:	00893503          	ld	a0,8(s2)
    80005c1c:	00000097          	auipc	ra,0x0
    80005c20:	c34080e7          	jalr	-972(ra) # 80005850 <_ZN6Buffer3getEv>
        putc(key);
    80005c24:	0ff57513          	andi	a0,a0,255
    80005c28:	ffffc097          	auipc	ra,0xffffc
    80005c2c:	ec8080e7          	jalr	-312(ra) # 80001af0 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80005c30:	00893503          	ld	a0,8(s2)
    80005c34:	00000097          	auipc	ra,0x0
    80005c38:	ca8080e7          	jalr	-856(ra) # 800058dc <_ZN6Buffer6getCntEv>
    80005c3c:	fca04ee3          	bgtz	a0,80005c18 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80005c40:	01093503          	ld	a0,16(s2)
    80005c44:	ffffc097          	auipc	ra,0xffffc
    80005c48:	e58080e7          	jalr	-424(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    80005c4c:	02813083          	ld	ra,40(sp)
    80005c50:	02013403          	ld	s0,32(sp)
    80005c54:	01813483          	ld	s1,24(sp)
    80005c58:	01013903          	ld	s2,16(sp)
    80005c5c:	00813983          	ld	s3,8(sp)
    80005c60:	03010113          	addi	sp,sp,48
    80005c64:	00008067          	ret

0000000080005c68 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80005c68:	f9010113          	addi	sp,sp,-112
    80005c6c:	06113423          	sd	ra,104(sp)
    80005c70:	06813023          	sd	s0,96(sp)
    80005c74:	04913c23          	sd	s1,88(sp)
    80005c78:	05213823          	sd	s2,80(sp)
    80005c7c:	05313423          	sd	s3,72(sp)
    80005c80:	05413023          	sd	s4,64(sp)
    80005c84:	03513c23          	sd	s5,56(sp)
    80005c88:	03613823          	sd	s6,48(sp)
    80005c8c:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80005c90:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80005c94:	00006517          	auipc	a0,0x6
    80005c98:	83c50513          	addi	a0,a0,-1988 # 8000b4d0 <CONSOLE_STATUS+0x4c0>
    80005c9c:	00002097          	auipc	ra,0x2
    80005ca0:	69c080e7          	jalr	1692(ra) # 80008338 <_Z11printStringPKc>
    getString(input, 30);
    80005ca4:	01e00593          	li	a1,30
    80005ca8:	fa040493          	addi	s1,s0,-96
    80005cac:	00048513          	mv	a0,s1
    80005cb0:	00002097          	auipc	ra,0x2
    80005cb4:	710080e7          	jalr	1808(ra) # 800083c0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005cb8:	00048513          	mv	a0,s1
    80005cbc:	00002097          	auipc	ra,0x2
    80005cc0:	7dc080e7          	jalr	2012(ra) # 80008498 <_Z11stringToIntPKc>
    80005cc4:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005cc8:	00006517          	auipc	a0,0x6
    80005ccc:	82850513          	addi	a0,a0,-2008 # 8000b4f0 <CONSOLE_STATUS+0x4e0>
    80005cd0:	00002097          	auipc	ra,0x2
    80005cd4:	668080e7          	jalr	1640(ra) # 80008338 <_Z11printStringPKc>
    getString(input, 30);
    80005cd8:	01e00593          	li	a1,30
    80005cdc:	00048513          	mv	a0,s1
    80005ce0:	00002097          	auipc	ra,0x2
    80005ce4:	6e0080e7          	jalr	1760(ra) # 800083c0 <_Z9getStringPci>
    n = stringToInt(input);
    80005ce8:	00048513          	mv	a0,s1
    80005cec:	00002097          	auipc	ra,0x2
    80005cf0:	7ac080e7          	jalr	1964(ra) # 80008498 <_Z11stringToIntPKc>
    80005cf4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005cf8:	00006517          	auipc	a0,0x6
    80005cfc:	81850513          	addi	a0,a0,-2024 # 8000b510 <CONSOLE_STATUS+0x500>
    80005d00:	00002097          	auipc	ra,0x2
    80005d04:	638080e7          	jalr	1592(ra) # 80008338 <_Z11printStringPKc>
    80005d08:	00000613          	li	a2,0
    80005d0c:	00a00593          	li	a1,10
    80005d10:	00090513          	mv	a0,s2
    80005d14:	00002097          	auipc	ra,0x2
    80005d18:	7d4080e7          	jalr	2004(ra) # 800084e8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005d1c:	00006517          	auipc	a0,0x6
    80005d20:	80c50513          	addi	a0,a0,-2036 # 8000b528 <CONSOLE_STATUS+0x518>
    80005d24:	00002097          	auipc	ra,0x2
    80005d28:	614080e7          	jalr	1556(ra) # 80008338 <_Z11printStringPKc>
    80005d2c:	00000613          	li	a2,0
    80005d30:	00a00593          	li	a1,10
    80005d34:	00048513          	mv	a0,s1
    80005d38:	00002097          	auipc	ra,0x2
    80005d3c:	7b0080e7          	jalr	1968(ra) # 800084e8 <_Z8printIntiii>
    printString(".\n");
    80005d40:	00006517          	auipc	a0,0x6
    80005d44:	80050513          	addi	a0,a0,-2048 # 8000b540 <CONSOLE_STATUS+0x530>
    80005d48:	00002097          	auipc	ra,0x2
    80005d4c:	5f0080e7          	jalr	1520(ra) # 80008338 <_Z11printStringPKc>
    if(threadNum > n) {
    80005d50:	0324c463          	blt	s1,s2,80005d78 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80005d54:	03205c63          	blez	s2,80005d8c <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80005d58:	03800513          	li	a0,56
    80005d5c:	ffffb097          	auipc	ra,0xffffb
    80005d60:	460080e7          	jalr	1120(ra) # 800011bc <_Znwm>
    80005d64:	00050a13          	mv	s4,a0
    80005d68:	00048593          	mv	a1,s1
    80005d6c:	00000097          	auipc	ra,0x0
    80005d70:	9b8080e7          	jalr	-1608(ra) # 80005724 <_ZN6BufferC1Ei>
    80005d74:	0300006f          	j	80005da4 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005d78:	00005517          	auipc	a0,0x5
    80005d7c:	7d050513          	addi	a0,a0,2000 # 8000b548 <CONSOLE_STATUS+0x538>
    80005d80:	00002097          	auipc	ra,0x2
    80005d84:	5b8080e7          	jalr	1464(ra) # 80008338 <_Z11printStringPKc>
        return;
    80005d88:	0140006f          	j	80005d9c <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005d8c:	00005517          	auipc	a0,0x5
    80005d90:	7fc50513          	addi	a0,a0,2044 # 8000b588 <CONSOLE_STATUS+0x578>
    80005d94:	00002097          	auipc	ra,0x2
    80005d98:	5a4080e7          	jalr	1444(ra) # 80008338 <_Z11printStringPKc>
        return;
    80005d9c:	000b0113          	mv	sp,s6
    80005da0:	1500006f          	j	80005ef0 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80005da4:	00000593          	li	a1,0
    80005da8:	00008517          	auipc	a0,0x8
    80005dac:	3f850513          	addi	a0,a0,1016 # 8000e1a0 <_ZL10waitForAll>
    80005db0:	ffffc097          	auipc	ra,0xffffc
    80005db4:	c5c080e7          	jalr	-932(ra) # 80001a0c <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    80005db8:	00391793          	slli	a5,s2,0x3
    80005dbc:	00f78793          	addi	a5,a5,15
    80005dc0:	ff07f793          	andi	a5,a5,-16
    80005dc4:	40f10133          	sub	sp,sp,a5
    80005dc8:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80005dcc:	0019071b          	addiw	a4,s2,1
    80005dd0:	00171793          	slli	a5,a4,0x1
    80005dd4:	00e787b3          	add	a5,a5,a4
    80005dd8:	00379793          	slli	a5,a5,0x3
    80005ddc:	00f78793          	addi	a5,a5,15
    80005de0:	ff07f793          	andi	a5,a5,-16
    80005de4:	40f10133          	sub	sp,sp,a5
    80005de8:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80005dec:	00191613          	slli	a2,s2,0x1
    80005df0:	012607b3          	add	a5,a2,s2
    80005df4:	00379793          	slli	a5,a5,0x3
    80005df8:	00f987b3          	add	a5,s3,a5
    80005dfc:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005e00:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80005e04:	00008717          	auipc	a4,0x8
    80005e08:	39c73703          	ld	a4,924(a4) # 8000e1a0 <_ZL10waitForAll>
    80005e0c:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80005e10:	00078613          	mv	a2,a5
    80005e14:	00000597          	auipc	a1,0x0
    80005e18:	d7458593          	addi	a1,a1,-652 # 80005b88 <_ZL8consumerPv>
    80005e1c:	f9840513          	addi	a0,s0,-104
    80005e20:	ffffc097          	auipc	ra,0xffffc
    80005e24:	ae0080e7          	jalr	-1312(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80005e28:	00000493          	li	s1,0
    80005e2c:	0280006f          	j	80005e54 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80005e30:	00000597          	auipc	a1,0x0
    80005e34:	c1458593          	addi	a1,a1,-1004 # 80005a44 <_ZL16producerKeyboardPv>
                      data + i);
    80005e38:	00179613          	slli	a2,a5,0x1
    80005e3c:	00f60633          	add	a2,a2,a5
    80005e40:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80005e44:	00c98633          	add	a2,s3,a2
    80005e48:	ffffc097          	auipc	ra,0xffffc
    80005e4c:	ab8080e7          	jalr	-1352(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80005e50:	0014849b          	addiw	s1,s1,1
    80005e54:	0524d263          	bge	s1,s2,80005e98 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80005e58:	00149793          	slli	a5,s1,0x1
    80005e5c:	009787b3          	add	a5,a5,s1
    80005e60:	00379793          	slli	a5,a5,0x3
    80005e64:	00f987b3          	add	a5,s3,a5
    80005e68:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005e6c:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80005e70:	00008717          	auipc	a4,0x8
    80005e74:	33073703          	ld	a4,816(a4) # 8000e1a0 <_ZL10waitForAll>
    80005e78:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80005e7c:	00048793          	mv	a5,s1
    80005e80:	00349513          	slli	a0,s1,0x3
    80005e84:	00aa8533          	add	a0,s5,a0
    80005e88:	fa9054e3          	blez	s1,80005e30 <_Z22producerConsumer_C_APIv+0x1c8>
    80005e8c:	00000597          	auipc	a1,0x0
    80005e90:	c6858593          	addi	a1,a1,-920 # 80005af4 <_ZL8producerPv>
    80005e94:	fa5ff06f          	j	80005e38 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80005e98:	ffffc097          	auipc	ra,0xffffc
    80005e9c:	b04080e7          	jalr	-1276(ra) # 8000199c <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80005ea0:	00000493          	li	s1,0
    80005ea4:	00994e63          	blt	s2,s1,80005ec0 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80005ea8:	00008517          	auipc	a0,0x8
    80005eac:	2f853503          	ld	a0,760(a0) # 8000e1a0 <_ZL10waitForAll>
    80005eb0:	ffffc097          	auipc	ra,0xffffc
    80005eb4:	bc0080e7          	jalr	-1088(ra) # 80001a70 <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80005eb8:	0014849b          	addiw	s1,s1,1
    80005ebc:	fe9ff06f          	j	80005ea4 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80005ec0:	00008517          	auipc	a0,0x8
    80005ec4:	2e053503          	ld	a0,736(a0) # 8000e1a0 <_ZL10waitForAll>
    80005ec8:	ffffc097          	auipc	ra,0xffffc
    80005ecc:	b7c080e7          	jalr	-1156(ra) # 80001a44 <_Z9sem_closeP4_sem>
    delete buffer;
    80005ed0:	000a0e63          	beqz	s4,80005eec <_Z22producerConsumer_C_APIv+0x284>
    80005ed4:	000a0513          	mv	a0,s4
    80005ed8:	00000097          	auipc	ra,0x0
    80005edc:	a8c080e7          	jalr	-1396(ra) # 80005964 <_ZN6BufferD1Ev>
    80005ee0:	000a0513          	mv	a0,s4
    80005ee4:	ffffb097          	auipc	ra,0xffffb
    80005ee8:	300080e7          	jalr	768(ra) # 800011e4 <_ZdlPv>
    80005eec:	000b0113          	mv	sp,s6
}
    80005ef0:	f9040113          	addi	sp,s0,-112
    80005ef4:	06813083          	ld	ra,104(sp)
    80005ef8:	06013403          	ld	s0,96(sp)
    80005efc:	05813483          	ld	s1,88(sp)
    80005f00:	05013903          	ld	s2,80(sp)
    80005f04:	04813983          	ld	s3,72(sp)
    80005f08:	04013a03          	ld	s4,64(sp)
    80005f0c:	03813a83          	ld	s5,56(sp)
    80005f10:	03013b03          	ld	s6,48(sp)
    80005f14:	07010113          	addi	sp,sp,112
    80005f18:	00008067          	ret
    80005f1c:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80005f20:	000a0513          	mv	a0,s4
    80005f24:	ffffb097          	auipc	ra,0xffffb
    80005f28:	2c0080e7          	jalr	704(ra) # 800011e4 <_ZdlPv>
    80005f2c:	00048513          	mv	a0,s1
    80005f30:	00009097          	auipc	ra,0x9
    80005f34:	378080e7          	jalr	888(ra) # 8000f2a8 <_Unwind_Resume>

0000000080005f38 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80005f38:	f8010113          	addi	sp,sp,-128
    80005f3c:	06113c23          	sd	ra,120(sp)
    80005f40:	06813823          	sd	s0,112(sp)
    80005f44:	06913423          	sd	s1,104(sp)
    80005f48:	07213023          	sd	s2,96(sp)
    80005f4c:	05313c23          	sd	s3,88(sp)
    80005f50:	05413823          	sd	s4,80(sp)
    80005f54:	05513423          	sd	s5,72(sp)
    80005f58:	05613023          	sd	s6,64(sp)
    80005f5c:	03713c23          	sd	s7,56(sp)
    80005f60:	03813823          	sd	s8,48(sp)
    80005f64:	03913423          	sd	s9,40(sp)
    80005f68:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80005f6c:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80005f70:	00005517          	auipc	a0,0x5
    80005f74:	56050513          	addi	a0,a0,1376 # 8000b4d0 <CONSOLE_STATUS+0x4c0>
    80005f78:	00002097          	auipc	ra,0x2
    80005f7c:	3c0080e7          	jalr	960(ra) # 80008338 <_Z11printStringPKc>
    getString(input, 30);
    80005f80:	01e00593          	li	a1,30
    80005f84:	f8040493          	addi	s1,s0,-128
    80005f88:	00048513          	mv	a0,s1
    80005f8c:	00002097          	auipc	ra,0x2
    80005f90:	434080e7          	jalr	1076(ra) # 800083c0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005f94:	00048513          	mv	a0,s1
    80005f98:	00002097          	auipc	ra,0x2
    80005f9c:	500080e7          	jalr	1280(ra) # 80008498 <_Z11stringToIntPKc>
    80005fa0:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80005fa4:	00005517          	auipc	a0,0x5
    80005fa8:	54c50513          	addi	a0,a0,1356 # 8000b4f0 <CONSOLE_STATUS+0x4e0>
    80005fac:	00002097          	auipc	ra,0x2
    80005fb0:	38c080e7          	jalr	908(ra) # 80008338 <_Z11printStringPKc>
    getString(input, 30);
    80005fb4:	01e00593          	li	a1,30
    80005fb8:	00048513          	mv	a0,s1
    80005fbc:	00002097          	auipc	ra,0x2
    80005fc0:	404080e7          	jalr	1028(ra) # 800083c0 <_Z9getStringPci>
    n = stringToInt(input);
    80005fc4:	00048513          	mv	a0,s1
    80005fc8:	00002097          	auipc	ra,0x2
    80005fcc:	4d0080e7          	jalr	1232(ra) # 80008498 <_Z11stringToIntPKc>
    80005fd0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80005fd4:	00005517          	auipc	a0,0x5
    80005fd8:	53c50513          	addi	a0,a0,1340 # 8000b510 <CONSOLE_STATUS+0x500>
    80005fdc:	00002097          	auipc	ra,0x2
    80005fe0:	35c080e7          	jalr	860(ra) # 80008338 <_Z11printStringPKc>
    printInt(threadNum);
    80005fe4:	00000613          	li	a2,0
    80005fe8:	00a00593          	li	a1,10
    80005fec:	00098513          	mv	a0,s3
    80005ff0:	00002097          	auipc	ra,0x2
    80005ff4:	4f8080e7          	jalr	1272(ra) # 800084e8 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80005ff8:	00005517          	auipc	a0,0x5
    80005ffc:	53050513          	addi	a0,a0,1328 # 8000b528 <CONSOLE_STATUS+0x518>
    80006000:	00002097          	auipc	ra,0x2
    80006004:	338080e7          	jalr	824(ra) # 80008338 <_Z11printStringPKc>
    printInt(n);
    80006008:	00000613          	li	a2,0
    8000600c:	00a00593          	li	a1,10
    80006010:	00048513          	mv	a0,s1
    80006014:	00002097          	auipc	ra,0x2
    80006018:	4d4080e7          	jalr	1236(ra) # 800084e8 <_Z8printIntiii>
    printString(".\n");
    8000601c:	00005517          	auipc	a0,0x5
    80006020:	52450513          	addi	a0,a0,1316 # 8000b540 <CONSOLE_STATUS+0x530>
    80006024:	00002097          	auipc	ra,0x2
    80006028:	314080e7          	jalr	788(ra) # 80008338 <_Z11printStringPKc>
    if (threadNum > n) {
    8000602c:	0334c463          	blt	s1,s3,80006054 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80006030:	03305c63          	blez	s3,80006068 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80006034:	03800513          	li	a0,56
    80006038:	ffffb097          	auipc	ra,0xffffb
    8000603c:	184080e7          	jalr	388(ra) # 800011bc <_Znwm>
    80006040:	00050a93          	mv	s5,a0
    80006044:	00048593          	mv	a1,s1
    80006048:	00001097          	auipc	ra,0x1
    8000604c:	3d4080e7          	jalr	980(ra) # 8000741c <_ZN9BufferCPPC1Ei>
    80006050:	0300006f          	j	80006080 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80006054:	00005517          	auipc	a0,0x5
    80006058:	4f450513          	addi	a0,a0,1268 # 8000b548 <CONSOLE_STATUS+0x538>
    8000605c:	00002097          	auipc	ra,0x2
    80006060:	2dc080e7          	jalr	732(ra) # 80008338 <_Z11printStringPKc>
        return;
    80006064:	0140006f          	j	80006078 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80006068:	00005517          	auipc	a0,0x5
    8000606c:	52050513          	addi	a0,a0,1312 # 8000b588 <CONSOLE_STATUS+0x578>
    80006070:	00002097          	auipc	ra,0x2
    80006074:	2c8080e7          	jalr	712(ra) # 80008338 <_Z11printStringPKc>
        return;
    80006078:	000c0113          	mv	sp,s8
    8000607c:	2440006f          	j	800062c0 <_Z20testConsumerProducerv+0x388>
    waitForAll = new Semaphore(0);
    80006080:	01000513          	li	a0,16
    80006084:	ffffb097          	auipc	ra,0xffffb
    80006088:	138080e7          	jalr	312(ra) # 800011bc <_Znwm>
    8000608c:	00050913          	mv	s2,a0
    80006090:	00000593          	li	a1,0
    80006094:	ffffb097          	auipc	ra,0xffffb
    80006098:	340080e7          	jalr	832(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    8000609c:	00008797          	auipc	a5,0x8
    800060a0:	1127ba23          	sd	s2,276(a5) # 8000e1b0 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800060a4:	00399793          	slli	a5,s3,0x3
    800060a8:	00f78793          	addi	a5,a5,15
    800060ac:	ff07f793          	andi	a5,a5,-16
    800060b0:	40f10133          	sub	sp,sp,a5
    800060b4:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    800060b8:	0019871b          	addiw	a4,s3,1
    800060bc:	00171793          	slli	a5,a4,0x1
    800060c0:	00e787b3          	add	a5,a5,a4
    800060c4:	00379793          	slli	a5,a5,0x3
    800060c8:	00f78793          	addi	a5,a5,15
    800060cc:	ff07f793          	andi	a5,a5,-16
    800060d0:	40f10133          	sub	sp,sp,a5
    800060d4:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    800060d8:	00199493          	slli	s1,s3,0x1
    800060dc:	013484b3          	add	s1,s1,s3
    800060e0:	00349493          	slli	s1,s1,0x3
    800060e4:	009b04b3          	add	s1,s6,s1
    800060e8:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800060ec:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800060f0:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800060f4:	02800513          	li	a0,40
    800060f8:	ffffb097          	auipc	ra,0xffffb
    800060fc:	0c4080e7          	jalr	196(ra) # 800011bc <_Znwm>
    80006100:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80006104:	ffffb097          	auipc	ra,0xffffb
    80006108:	29c080e7          	jalr	668(ra) # 800013a0 <_ZN6ThreadC1Ev>
    8000610c:	00008797          	auipc	a5,0x8
    80006110:	e6478793          	addi	a5,a5,-412 # 8000df70 <_ZTV8Consumer+0x10>
    80006114:	00fbb023          	sd	a5,0(s7)
    80006118:	029bb023          	sd	s1,32(s7)
    consumer->start();
    8000611c:	000b8513          	mv	a0,s7
    80006120:	ffffb097          	auipc	ra,0xffffb
    80006124:	198080e7          	jalr	408(ra) # 800012b8 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80006128:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    8000612c:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80006130:	00008797          	auipc	a5,0x8
    80006134:	0807b783          	ld	a5,128(a5) # 8000e1b0 <_ZL10waitForAll>
    80006138:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000613c:	02800513          	li	a0,40
    80006140:	ffffb097          	auipc	ra,0xffffb
    80006144:	07c080e7          	jalr	124(ra) # 800011bc <_Znwm>
    80006148:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    8000614c:	ffffb097          	auipc	ra,0xffffb
    80006150:	254080e7          	jalr	596(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80006154:	00008797          	auipc	a5,0x8
    80006158:	dcc78793          	addi	a5,a5,-564 # 8000df20 <_ZTV16ProducerKeyborad+0x10>
    8000615c:	00f4b023          	sd	a5,0(s1)
    80006160:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80006164:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80006168:	00048513          	mv	a0,s1
    8000616c:	ffffb097          	auipc	ra,0xffffb
    80006170:	14c080e7          	jalr	332(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80006174:	00100913          	li	s2,1
    80006178:	0300006f          	j	800061a8 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    8000617c:	00008797          	auipc	a5,0x8
    80006180:	dcc78793          	addi	a5,a5,-564 # 8000df48 <_ZTV8Producer+0x10>
    80006184:	00fcb023          	sd	a5,0(s9)
    80006188:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    8000618c:	00391793          	slli	a5,s2,0x3
    80006190:	00fa07b3          	add	a5,s4,a5
    80006194:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80006198:	000c8513          	mv	a0,s9
    8000619c:	ffffb097          	auipc	ra,0xffffb
    800061a0:	11c080e7          	jalr	284(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800061a4:	0019091b          	addiw	s2,s2,1
    800061a8:	05395263          	bge	s2,s3,800061ec <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    800061ac:	00191493          	slli	s1,s2,0x1
    800061b0:	012484b3          	add	s1,s1,s2
    800061b4:	00349493          	slli	s1,s1,0x3
    800061b8:	009b04b3          	add	s1,s6,s1
    800061bc:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    800061c0:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    800061c4:	00008797          	auipc	a5,0x8
    800061c8:	fec7b783          	ld	a5,-20(a5) # 8000e1b0 <_ZL10waitForAll>
    800061cc:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    800061d0:	02800513          	li	a0,40
    800061d4:	ffffb097          	auipc	ra,0xffffb
    800061d8:	fe8080e7          	jalr	-24(ra) # 800011bc <_Znwm>
    800061dc:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800061e0:	ffffb097          	auipc	ra,0xffffb
    800061e4:	1c0080e7          	jalr	448(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800061e8:	f95ff06f          	j	8000617c <_Z20testConsumerProducerv+0x244>
    putc('.');
    800061ec:	02e00513          	li	a0,46
    800061f0:	ffffc097          	auipc	ra,0xffffc
    800061f4:	900080e7          	jalr	-1792(ra) # 80001af0 <_Z4putcc>
    Thread::dispatch();
    800061f8:	ffffb097          	auipc	ra,0xffffb
    800061fc:	120080e7          	jalr	288(ra) # 80001318 <_ZN6Thread8dispatchEv>
    putc('.');
    80006200:	02e00513          	li	a0,46
    80006204:	ffffc097          	auipc	ra,0xffffc
    80006208:	8ec080e7          	jalr	-1812(ra) # 80001af0 <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    8000620c:	00000493          	li	s1,0
    80006210:	0299c463          	blt	s3,s1,80006238 <_Z20testConsumerProducerv+0x300>
        waitForAll->wait();
    80006214:	00008517          	auipc	a0,0x8
    80006218:	f9c53503          	ld	a0,-100(a0) # 8000e1b0 <_ZL10waitForAll>
    8000621c:	ffffb097          	auipc	ra,0xffffb
    80006220:	1f0080e7          	jalr	496(ra) # 8000140c <_ZN9Semaphore4waitEv>
        putc('x');
    80006224:	07800513          	li	a0,120
    80006228:	ffffc097          	auipc	ra,0xffffc
    8000622c:	8c8080e7          	jalr	-1848(ra) # 80001af0 <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    80006230:	0014849b          	addiw	s1,s1,1
    80006234:	fddff06f          	j	80006210 <_Z20testConsumerProducerv+0x2d8>
    putc('.');
    80006238:	02e00513          	li	a0,46
    8000623c:	ffffc097          	auipc	ra,0xffffc
    80006240:	8b4080e7          	jalr	-1868(ra) # 80001af0 <_Z4putcc>
    delete waitForAll;
    80006244:	00008517          	auipc	a0,0x8
    80006248:	f6c53503          	ld	a0,-148(a0) # 8000e1b0 <_ZL10waitForAll>
    8000624c:	00050863          	beqz	a0,8000625c <_Z20testConsumerProducerv+0x324>
    80006250:	00053783          	ld	a5,0(a0)
    80006254:	0087b783          	ld	a5,8(a5)
    80006258:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    8000625c:	00000493          	li	s1,0
    80006260:	0080006f          	j	80006268 <_Z20testConsumerProducerv+0x330>
    for (int i = 0; i < threadNum; i++) {
    80006264:	0014849b          	addiw	s1,s1,1
    80006268:	0334d263          	bge	s1,s3,8000628c <_Z20testConsumerProducerv+0x354>
        delete producers[i];
    8000626c:	00349793          	slli	a5,s1,0x3
    80006270:	00fa07b3          	add	a5,s4,a5
    80006274:	0007b503          	ld	a0,0(a5)
    80006278:	fe0506e3          	beqz	a0,80006264 <_Z20testConsumerProducerv+0x32c>
    8000627c:	00053783          	ld	a5,0(a0)
    80006280:	0087b783          	ld	a5,8(a5)
    80006284:	000780e7          	jalr	a5
    80006288:	fddff06f          	j	80006264 <_Z20testConsumerProducerv+0x32c>
    delete consumer;
    8000628c:	000b8a63          	beqz	s7,800062a0 <_Z20testConsumerProducerv+0x368>
    80006290:	000bb783          	ld	a5,0(s7)
    80006294:	0087b783          	ld	a5,8(a5)
    80006298:	000b8513          	mv	a0,s7
    8000629c:	000780e7          	jalr	a5
    delete buffer;
    800062a0:	000a8e63          	beqz	s5,800062bc <_Z20testConsumerProducerv+0x384>
    800062a4:	000a8513          	mv	a0,s5
    800062a8:	00001097          	auipc	ra,0x1
    800062ac:	46c080e7          	jalr	1132(ra) # 80007714 <_ZN9BufferCPPD1Ev>
    800062b0:	000a8513          	mv	a0,s5
    800062b4:	ffffb097          	auipc	ra,0xffffb
    800062b8:	f30080e7          	jalr	-208(ra) # 800011e4 <_ZdlPv>
    800062bc:	000c0113          	mv	sp,s8
}
    800062c0:	f8040113          	addi	sp,s0,-128
    800062c4:	07813083          	ld	ra,120(sp)
    800062c8:	07013403          	ld	s0,112(sp)
    800062cc:	06813483          	ld	s1,104(sp)
    800062d0:	06013903          	ld	s2,96(sp)
    800062d4:	05813983          	ld	s3,88(sp)
    800062d8:	05013a03          	ld	s4,80(sp)
    800062dc:	04813a83          	ld	s5,72(sp)
    800062e0:	04013b03          	ld	s6,64(sp)
    800062e4:	03813b83          	ld	s7,56(sp)
    800062e8:	03013c03          	ld	s8,48(sp)
    800062ec:	02813c83          	ld	s9,40(sp)
    800062f0:	08010113          	addi	sp,sp,128
    800062f4:	00008067          	ret
    800062f8:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800062fc:	000a8513          	mv	a0,s5
    80006300:	ffffb097          	auipc	ra,0xffffb
    80006304:	ee4080e7          	jalr	-284(ra) # 800011e4 <_ZdlPv>
    80006308:	00048513          	mv	a0,s1
    8000630c:	00009097          	auipc	ra,0x9
    80006310:	f9c080e7          	jalr	-100(ra) # 8000f2a8 <_Unwind_Resume>
    80006314:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80006318:	00090513          	mv	a0,s2
    8000631c:	ffffb097          	auipc	ra,0xffffb
    80006320:	ec8080e7          	jalr	-312(ra) # 800011e4 <_ZdlPv>
    80006324:	00048513          	mv	a0,s1
    80006328:	00009097          	auipc	ra,0x9
    8000632c:	f80080e7          	jalr	-128(ra) # 8000f2a8 <_Unwind_Resume>
    80006330:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80006334:	000b8513          	mv	a0,s7
    80006338:	ffffb097          	auipc	ra,0xffffb
    8000633c:	eac080e7          	jalr	-340(ra) # 800011e4 <_ZdlPv>
    80006340:	00048513          	mv	a0,s1
    80006344:	00009097          	auipc	ra,0x9
    80006348:	f64080e7          	jalr	-156(ra) # 8000f2a8 <_Unwind_Resume>
    8000634c:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80006350:	00048513          	mv	a0,s1
    80006354:	ffffb097          	auipc	ra,0xffffb
    80006358:	e90080e7          	jalr	-368(ra) # 800011e4 <_ZdlPv>
    8000635c:	00090513          	mv	a0,s2
    80006360:	00009097          	auipc	ra,0x9
    80006364:	f48080e7          	jalr	-184(ra) # 8000f2a8 <_Unwind_Resume>
    80006368:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    8000636c:	000c8513          	mv	a0,s9
    80006370:	ffffb097          	auipc	ra,0xffffb
    80006374:	e74080e7          	jalr	-396(ra) # 800011e4 <_ZdlPv>
    80006378:	00048513          	mv	a0,s1
    8000637c:	00009097          	auipc	ra,0x9
    80006380:	f2c080e7          	jalr	-212(ra) # 8000f2a8 <_Unwind_Resume>

0000000080006384 <_ZN8Consumer3runEv>:
    void run() override {
    80006384:	fd010113          	addi	sp,sp,-48
    80006388:	02113423          	sd	ra,40(sp)
    8000638c:	02813023          	sd	s0,32(sp)
    80006390:	00913c23          	sd	s1,24(sp)
    80006394:	01213823          	sd	s2,16(sp)
    80006398:	01313423          	sd	s3,8(sp)
    8000639c:	03010413          	addi	s0,sp,48
    800063a0:	00050913          	mv	s2,a0
        int i = 0;
    800063a4:	00000993          	li	s3,0
    800063a8:	0100006f          	j	800063b8 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800063ac:	00a00513          	li	a0,10
    800063b0:	ffffb097          	auipc	ra,0xffffb
    800063b4:	124080e7          	jalr	292(ra) # 800014d4 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800063b8:	00008797          	auipc	a5,0x8
    800063bc:	df07a783          	lw	a5,-528(a5) # 8000e1a8 <_ZL9threadEnd>
    800063c0:	04079a63          	bnez	a5,80006414 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800063c4:	02093783          	ld	a5,32(s2)
    800063c8:	0087b503          	ld	a0,8(a5)
    800063cc:	00001097          	auipc	ra,0x1
    800063d0:	234080e7          	jalr	564(ra) # 80007600 <_ZN9BufferCPP3getEv>
            i++;
    800063d4:	0019849b          	addiw	s1,s3,1
    800063d8:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    800063dc:	0ff57513          	andi	a0,a0,255
    800063e0:	ffffb097          	auipc	ra,0xffffb
    800063e4:	0f4080e7          	jalr	244(ra) # 800014d4 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    800063e8:	05000793          	li	a5,80
    800063ec:	02f4e4bb          	remw	s1,s1,a5
    800063f0:	fc0494e3          	bnez	s1,800063b8 <_ZN8Consumer3runEv+0x34>
    800063f4:	fb9ff06f          	j	800063ac <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    800063f8:	02093783          	ld	a5,32(s2)
    800063fc:	0087b503          	ld	a0,8(a5)
    80006400:	00001097          	auipc	ra,0x1
    80006404:	200080e7          	jalr	512(ra) # 80007600 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80006408:	0ff57513          	andi	a0,a0,255
    8000640c:	ffffb097          	auipc	ra,0xffffb
    80006410:	0c8080e7          	jalr	200(ra) # 800014d4 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80006414:	02093783          	ld	a5,32(s2)
    80006418:	0087b503          	ld	a0,8(a5)
    8000641c:	00001097          	auipc	ra,0x1
    80006420:	270080e7          	jalr	624(ra) # 8000768c <_ZN9BufferCPP6getCntEv>
    80006424:	fca04ae3          	bgtz	a0,800063f8 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80006428:	02093783          	ld	a5,32(s2)
    8000642c:	0107b503          	ld	a0,16(a5)
    80006430:	ffffb097          	auipc	ra,0xffffb
    80006434:	008080e7          	jalr	8(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80006438:	02813083          	ld	ra,40(sp)
    8000643c:	02013403          	ld	s0,32(sp)
    80006440:	01813483          	ld	s1,24(sp)
    80006444:	01013903          	ld	s2,16(sp)
    80006448:	00813983          	ld	s3,8(sp)
    8000644c:	03010113          	addi	sp,sp,48
    80006450:	00008067          	ret

0000000080006454 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80006454:	ff010113          	addi	sp,sp,-16
    80006458:	00113423          	sd	ra,8(sp)
    8000645c:	00813023          	sd	s0,0(sp)
    80006460:	01010413          	addi	s0,sp,16
    80006464:	00008797          	auipc	a5,0x8
    80006468:	b0c78793          	addi	a5,a5,-1268 # 8000df70 <_ZTV8Consumer+0x10>
    8000646c:	00f53023          	sd	a5,0(a0)
    80006470:	ffffb097          	auipc	ra,0xffffb
    80006474:	cdc080e7          	jalr	-804(ra) # 8000114c <_ZN6ThreadD1Ev>
    80006478:	00813083          	ld	ra,8(sp)
    8000647c:	00013403          	ld	s0,0(sp)
    80006480:	01010113          	addi	sp,sp,16
    80006484:	00008067          	ret

0000000080006488 <_ZN8ConsumerD0Ev>:
    80006488:	fe010113          	addi	sp,sp,-32
    8000648c:	00113c23          	sd	ra,24(sp)
    80006490:	00813823          	sd	s0,16(sp)
    80006494:	00913423          	sd	s1,8(sp)
    80006498:	02010413          	addi	s0,sp,32
    8000649c:	00050493          	mv	s1,a0
    800064a0:	00008797          	auipc	a5,0x8
    800064a4:	ad078793          	addi	a5,a5,-1328 # 8000df70 <_ZTV8Consumer+0x10>
    800064a8:	00f53023          	sd	a5,0(a0)
    800064ac:	ffffb097          	auipc	ra,0xffffb
    800064b0:	ca0080e7          	jalr	-864(ra) # 8000114c <_ZN6ThreadD1Ev>
    800064b4:	00048513          	mv	a0,s1
    800064b8:	ffffb097          	auipc	ra,0xffffb
    800064bc:	d2c080e7          	jalr	-724(ra) # 800011e4 <_ZdlPv>
    800064c0:	01813083          	ld	ra,24(sp)
    800064c4:	01013403          	ld	s0,16(sp)
    800064c8:	00813483          	ld	s1,8(sp)
    800064cc:	02010113          	addi	sp,sp,32
    800064d0:	00008067          	ret

00000000800064d4 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    800064d4:	ff010113          	addi	sp,sp,-16
    800064d8:	00113423          	sd	ra,8(sp)
    800064dc:	00813023          	sd	s0,0(sp)
    800064e0:	01010413          	addi	s0,sp,16
    800064e4:	00008797          	auipc	a5,0x8
    800064e8:	a3c78793          	addi	a5,a5,-1476 # 8000df20 <_ZTV16ProducerKeyborad+0x10>
    800064ec:	00f53023          	sd	a5,0(a0)
    800064f0:	ffffb097          	auipc	ra,0xffffb
    800064f4:	c5c080e7          	jalr	-932(ra) # 8000114c <_ZN6ThreadD1Ev>
    800064f8:	00813083          	ld	ra,8(sp)
    800064fc:	00013403          	ld	s0,0(sp)
    80006500:	01010113          	addi	sp,sp,16
    80006504:	00008067          	ret

0000000080006508 <_ZN16ProducerKeyboradD0Ev>:
    80006508:	fe010113          	addi	sp,sp,-32
    8000650c:	00113c23          	sd	ra,24(sp)
    80006510:	00813823          	sd	s0,16(sp)
    80006514:	00913423          	sd	s1,8(sp)
    80006518:	02010413          	addi	s0,sp,32
    8000651c:	00050493          	mv	s1,a0
    80006520:	00008797          	auipc	a5,0x8
    80006524:	a0078793          	addi	a5,a5,-1536 # 8000df20 <_ZTV16ProducerKeyborad+0x10>
    80006528:	00f53023          	sd	a5,0(a0)
    8000652c:	ffffb097          	auipc	ra,0xffffb
    80006530:	c20080e7          	jalr	-992(ra) # 8000114c <_ZN6ThreadD1Ev>
    80006534:	00048513          	mv	a0,s1
    80006538:	ffffb097          	auipc	ra,0xffffb
    8000653c:	cac080e7          	jalr	-852(ra) # 800011e4 <_ZdlPv>
    80006540:	01813083          	ld	ra,24(sp)
    80006544:	01013403          	ld	s0,16(sp)
    80006548:	00813483          	ld	s1,8(sp)
    8000654c:	02010113          	addi	sp,sp,32
    80006550:	00008067          	ret

0000000080006554 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80006554:	ff010113          	addi	sp,sp,-16
    80006558:	00113423          	sd	ra,8(sp)
    8000655c:	00813023          	sd	s0,0(sp)
    80006560:	01010413          	addi	s0,sp,16
    80006564:	00008797          	auipc	a5,0x8
    80006568:	9e478793          	addi	a5,a5,-1564 # 8000df48 <_ZTV8Producer+0x10>
    8000656c:	00f53023          	sd	a5,0(a0)
    80006570:	ffffb097          	auipc	ra,0xffffb
    80006574:	bdc080e7          	jalr	-1060(ra) # 8000114c <_ZN6ThreadD1Ev>
    80006578:	00813083          	ld	ra,8(sp)
    8000657c:	00013403          	ld	s0,0(sp)
    80006580:	01010113          	addi	sp,sp,16
    80006584:	00008067          	ret

0000000080006588 <_ZN8ProducerD0Ev>:
    80006588:	fe010113          	addi	sp,sp,-32
    8000658c:	00113c23          	sd	ra,24(sp)
    80006590:	00813823          	sd	s0,16(sp)
    80006594:	00913423          	sd	s1,8(sp)
    80006598:	02010413          	addi	s0,sp,32
    8000659c:	00050493          	mv	s1,a0
    800065a0:	00008797          	auipc	a5,0x8
    800065a4:	9a878793          	addi	a5,a5,-1624 # 8000df48 <_ZTV8Producer+0x10>
    800065a8:	00f53023          	sd	a5,0(a0)
    800065ac:	ffffb097          	auipc	ra,0xffffb
    800065b0:	ba0080e7          	jalr	-1120(ra) # 8000114c <_ZN6ThreadD1Ev>
    800065b4:	00048513          	mv	a0,s1
    800065b8:	ffffb097          	auipc	ra,0xffffb
    800065bc:	c2c080e7          	jalr	-980(ra) # 800011e4 <_ZdlPv>
    800065c0:	01813083          	ld	ra,24(sp)
    800065c4:	01013403          	ld	s0,16(sp)
    800065c8:	00813483          	ld	s1,8(sp)
    800065cc:	02010113          	addi	sp,sp,32
    800065d0:	00008067          	ret

00000000800065d4 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    800065d4:	fe010113          	addi	sp,sp,-32
    800065d8:	00113c23          	sd	ra,24(sp)
    800065dc:	00813823          	sd	s0,16(sp)
    800065e0:	00913423          	sd	s1,8(sp)
    800065e4:	02010413          	addi	s0,sp,32
    800065e8:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    800065ec:	ffffb097          	auipc	ra,0xffffb
    800065f0:	4dc080e7          	jalr	1244(ra) # 80001ac8 <_Z4getcv>
    800065f4:	0005059b          	sext.w	a1,a0
    800065f8:	01b00793          	li	a5,27
    800065fc:	00f58c63          	beq	a1,a5,80006614 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80006600:	0204b783          	ld	a5,32(s1)
    80006604:	0087b503          	ld	a0,8(a5)
    80006608:	00001097          	auipc	ra,0x1
    8000660c:	f68080e7          	jalr	-152(ra) # 80007570 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80006610:	fddff06f          	j	800065ec <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80006614:	00100793          	li	a5,1
    80006618:	00008717          	auipc	a4,0x8
    8000661c:	b8f72823          	sw	a5,-1136(a4) # 8000e1a8 <_ZL9threadEnd>
        td->buffer->put('!');
    80006620:	0204b783          	ld	a5,32(s1)
    80006624:	02100593          	li	a1,33
    80006628:	0087b503          	ld	a0,8(a5)
    8000662c:	00001097          	auipc	ra,0x1
    80006630:	f44080e7          	jalr	-188(ra) # 80007570 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80006634:	0204b783          	ld	a5,32(s1)
    80006638:	0107b503          	ld	a0,16(a5)
    8000663c:	ffffb097          	auipc	ra,0xffffb
    80006640:	dfc080e7          	jalr	-516(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80006644:	01813083          	ld	ra,24(sp)
    80006648:	01013403          	ld	s0,16(sp)
    8000664c:	00813483          	ld	s1,8(sp)
    80006650:	02010113          	addi	sp,sp,32
    80006654:	00008067          	ret

0000000080006658 <_ZN8Producer3runEv>:
    void run() override {
    80006658:	fe010113          	addi	sp,sp,-32
    8000665c:	00113c23          	sd	ra,24(sp)
    80006660:	00813823          	sd	s0,16(sp)
    80006664:	00913423          	sd	s1,8(sp)
    80006668:	01213023          	sd	s2,0(sp)
    8000666c:	02010413          	addi	s0,sp,32
    80006670:	00050493          	mv	s1,a0
        int i = 0;
    80006674:	00000913          	li	s2,0
        while (!threadEnd) {
    80006678:	00008797          	auipc	a5,0x8
    8000667c:	b307a783          	lw	a5,-1232(a5) # 8000e1a8 <_ZL9threadEnd>
    80006680:	04079263          	bnez	a5,800066c4 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80006684:	0204b783          	ld	a5,32(s1)
    80006688:	0007a583          	lw	a1,0(a5)
    8000668c:	0305859b          	addiw	a1,a1,48
    80006690:	0087b503          	ld	a0,8(a5)
    80006694:	00001097          	auipc	ra,0x1
    80006698:	edc080e7          	jalr	-292(ra) # 80007570 <_ZN9BufferCPP3putEi>
            i++;
    8000669c:	0019071b          	addiw	a4,s2,1
    800066a0:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800066a4:	0204b783          	ld	a5,32(s1)
    800066a8:	0007a783          	lw	a5,0(a5)
    800066ac:	00e787bb          	addw	a5,a5,a4
    800066b0:	00500513          	li	a0,5
    800066b4:	02a7e53b          	remw	a0,a5,a0
    800066b8:	ffffb097          	auipc	ra,0xffffb
    800066bc:	c88080e7          	jalr	-888(ra) # 80001340 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    800066c0:	fb9ff06f          	j	80006678 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    800066c4:	0204b783          	ld	a5,32(s1)
    800066c8:	0107b503          	ld	a0,16(a5)
    800066cc:	ffffb097          	auipc	ra,0xffffb
    800066d0:	d6c080e7          	jalr	-660(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    800066d4:	01813083          	ld	ra,24(sp)
    800066d8:	01013403          	ld	s0,16(sp)
    800066dc:	00813483          	ld	s1,8(sp)
    800066e0:	00013903          	ld	s2,0(sp)
    800066e4:	02010113          	addi	sp,sp,32
    800066e8:	00008067          	ret

00000000800066ec <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800066ec:	fe010113          	addi	sp,sp,-32
    800066f0:	00113c23          	sd	ra,24(sp)
    800066f4:	00813823          	sd	s0,16(sp)
    800066f8:	00913423          	sd	s1,8(sp)
    800066fc:	01213023          	sd	s2,0(sp)
    80006700:	02010413          	addi	s0,sp,32
    80006704:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006708:	00100793          	li	a5,1
    8000670c:	02a7f863          	bgeu	a5,a0,8000673c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006710:	00a00793          	li	a5,10
    80006714:	02f577b3          	remu	a5,a0,a5
    80006718:	02078e63          	beqz	a5,80006754 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000671c:	fff48513          	addi	a0,s1,-1
    80006720:	00000097          	auipc	ra,0x0
    80006724:	fcc080e7          	jalr	-52(ra) # 800066ec <_ZL9fibonaccim>
    80006728:	00050913          	mv	s2,a0
    8000672c:	ffe48513          	addi	a0,s1,-2
    80006730:	00000097          	auipc	ra,0x0
    80006734:	fbc080e7          	jalr	-68(ra) # 800066ec <_ZL9fibonaccim>
    80006738:	00a90533          	add	a0,s2,a0
}
    8000673c:	01813083          	ld	ra,24(sp)
    80006740:	01013403          	ld	s0,16(sp)
    80006744:	00813483          	ld	s1,8(sp)
    80006748:	00013903          	ld	s2,0(sp)
    8000674c:	02010113          	addi	sp,sp,32
    80006750:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006754:	ffffb097          	auipc	ra,0xffffb
    80006758:	248080e7          	jalr	584(ra) # 8000199c <_Z15thread_dispatchv>
    8000675c:	fc1ff06f          	j	8000671c <_ZL9fibonaccim+0x30>

0000000080006760 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006760:	fe010113          	addi	sp,sp,-32
    80006764:	00113c23          	sd	ra,24(sp)
    80006768:	00813823          	sd	s0,16(sp)
    8000676c:	00913423          	sd	s1,8(sp)
    80006770:	01213023          	sd	s2,0(sp)
    80006774:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006778:	00a00493          	li	s1,10
    8000677c:	0400006f          	j	800067bc <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006780:	00005517          	auipc	a0,0x5
    80006784:	e3850513          	addi	a0,a0,-456 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80006788:	00002097          	auipc	ra,0x2
    8000678c:	bb0080e7          	jalr	-1104(ra) # 80008338 <_Z11printStringPKc>
    80006790:	00000613          	li	a2,0
    80006794:	00a00593          	li	a1,10
    80006798:	00048513          	mv	a0,s1
    8000679c:	00002097          	auipc	ra,0x2
    800067a0:	d4c080e7          	jalr	-692(ra) # 800084e8 <_Z8printIntiii>
    800067a4:	00005517          	auipc	a0,0x5
    800067a8:	0dc50513          	addi	a0,a0,220 # 8000b880 <CONSOLE_STATUS+0x870>
    800067ac:	00002097          	auipc	ra,0x2
    800067b0:	b8c080e7          	jalr	-1140(ra) # 80008338 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800067b4:	0014849b          	addiw	s1,s1,1
    800067b8:	0ff4f493          	andi	s1,s1,255
    800067bc:	00c00793          	li	a5,12
    800067c0:	fc97f0e3          	bgeu	a5,s1,80006780 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800067c4:	00005517          	auipc	a0,0x5
    800067c8:	dfc50513          	addi	a0,a0,-516 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    800067cc:	00002097          	auipc	ra,0x2
    800067d0:	b6c080e7          	jalr	-1172(ra) # 80008338 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800067d4:	00500313          	li	t1,5
    thread_dispatch();
    800067d8:	ffffb097          	auipc	ra,0xffffb
    800067dc:	1c4080e7          	jalr	452(ra) # 8000199c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800067e0:	01000513          	li	a0,16
    800067e4:	00000097          	auipc	ra,0x0
    800067e8:	f08080e7          	jalr	-248(ra) # 800066ec <_ZL9fibonaccim>
    800067ec:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800067f0:	00005517          	auipc	a0,0x5
    800067f4:	de050513          	addi	a0,a0,-544 # 8000b5d0 <CONSOLE_STATUS+0x5c0>
    800067f8:	00002097          	auipc	ra,0x2
    800067fc:	b40080e7          	jalr	-1216(ra) # 80008338 <_Z11printStringPKc>
    80006800:	00000613          	li	a2,0
    80006804:	00a00593          	li	a1,10
    80006808:	0009051b          	sext.w	a0,s2
    8000680c:	00002097          	auipc	ra,0x2
    80006810:	cdc080e7          	jalr	-804(ra) # 800084e8 <_Z8printIntiii>
    80006814:	00005517          	auipc	a0,0x5
    80006818:	06c50513          	addi	a0,a0,108 # 8000b880 <CONSOLE_STATUS+0x870>
    8000681c:	00002097          	auipc	ra,0x2
    80006820:	b1c080e7          	jalr	-1252(ra) # 80008338 <_Z11printStringPKc>
    80006824:	0400006f          	j	80006864 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006828:	00005517          	auipc	a0,0x5
    8000682c:	d9050513          	addi	a0,a0,-624 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80006830:	00002097          	auipc	ra,0x2
    80006834:	b08080e7          	jalr	-1272(ra) # 80008338 <_Z11printStringPKc>
    80006838:	00000613          	li	a2,0
    8000683c:	00a00593          	li	a1,10
    80006840:	00048513          	mv	a0,s1
    80006844:	00002097          	auipc	ra,0x2
    80006848:	ca4080e7          	jalr	-860(ra) # 800084e8 <_Z8printIntiii>
    8000684c:	00005517          	auipc	a0,0x5
    80006850:	03450513          	addi	a0,a0,52 # 8000b880 <CONSOLE_STATUS+0x870>
    80006854:	00002097          	auipc	ra,0x2
    80006858:	ae4080e7          	jalr	-1308(ra) # 80008338 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000685c:	0014849b          	addiw	s1,s1,1
    80006860:	0ff4f493          	andi	s1,s1,255
    80006864:	00f00793          	li	a5,15
    80006868:	fc97f0e3          	bgeu	a5,s1,80006828 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000686c:	00005517          	auipc	a0,0x5
    80006870:	d7450513          	addi	a0,a0,-652 # 8000b5e0 <CONSOLE_STATUS+0x5d0>
    80006874:	00002097          	auipc	ra,0x2
    80006878:	ac4080e7          	jalr	-1340(ra) # 80008338 <_Z11printStringPKc>
    finishedD = true;
    8000687c:	00100793          	li	a5,1
    80006880:	00008717          	auipc	a4,0x8
    80006884:	92f70c23          	sb	a5,-1736(a4) # 8000e1b8 <_ZL9finishedD>
    thread_dispatch();
    80006888:	ffffb097          	auipc	ra,0xffffb
    8000688c:	114080e7          	jalr	276(ra) # 8000199c <_Z15thread_dispatchv>
}
    80006890:	01813083          	ld	ra,24(sp)
    80006894:	01013403          	ld	s0,16(sp)
    80006898:	00813483          	ld	s1,8(sp)
    8000689c:	00013903          	ld	s2,0(sp)
    800068a0:	02010113          	addi	sp,sp,32
    800068a4:	00008067          	ret

00000000800068a8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800068a8:	fe010113          	addi	sp,sp,-32
    800068ac:	00113c23          	sd	ra,24(sp)
    800068b0:	00813823          	sd	s0,16(sp)
    800068b4:	00913423          	sd	s1,8(sp)
    800068b8:	01213023          	sd	s2,0(sp)
    800068bc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800068c0:	00000493          	li	s1,0
    800068c4:	0400006f          	j	80006904 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800068c8:	00005517          	auipc	a0,0x5
    800068cc:	d2850513          	addi	a0,a0,-728 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    800068d0:	00002097          	auipc	ra,0x2
    800068d4:	a68080e7          	jalr	-1432(ra) # 80008338 <_Z11printStringPKc>
    800068d8:	00000613          	li	a2,0
    800068dc:	00a00593          	li	a1,10
    800068e0:	00048513          	mv	a0,s1
    800068e4:	00002097          	auipc	ra,0x2
    800068e8:	c04080e7          	jalr	-1020(ra) # 800084e8 <_Z8printIntiii>
    800068ec:	00005517          	auipc	a0,0x5
    800068f0:	f9450513          	addi	a0,a0,-108 # 8000b880 <CONSOLE_STATUS+0x870>
    800068f4:	00002097          	auipc	ra,0x2
    800068f8:	a44080e7          	jalr	-1468(ra) # 80008338 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800068fc:	0014849b          	addiw	s1,s1,1
    80006900:	0ff4f493          	andi	s1,s1,255
    80006904:	00200793          	li	a5,2
    80006908:	fc97f0e3          	bgeu	a5,s1,800068c8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    8000690c:	00005517          	auipc	a0,0x5
    80006910:	cec50513          	addi	a0,a0,-788 # 8000b5f8 <CONSOLE_STATUS+0x5e8>
    80006914:	00002097          	auipc	ra,0x2
    80006918:	a24080e7          	jalr	-1500(ra) # 80008338 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000691c:	00700313          	li	t1,7
    thread_dispatch();
    80006920:	ffffb097          	auipc	ra,0xffffb
    80006924:	07c080e7          	jalr	124(ra) # 8000199c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006928:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000692c:	00005517          	auipc	a0,0x5
    80006930:	cdc50513          	addi	a0,a0,-804 # 8000b608 <CONSOLE_STATUS+0x5f8>
    80006934:	00002097          	auipc	ra,0x2
    80006938:	a04080e7          	jalr	-1532(ra) # 80008338 <_Z11printStringPKc>
    8000693c:	00000613          	li	a2,0
    80006940:	00a00593          	li	a1,10
    80006944:	0009051b          	sext.w	a0,s2
    80006948:	00002097          	auipc	ra,0x2
    8000694c:	ba0080e7          	jalr	-1120(ra) # 800084e8 <_Z8printIntiii>
    80006950:	00005517          	auipc	a0,0x5
    80006954:	f3050513          	addi	a0,a0,-208 # 8000b880 <CONSOLE_STATUS+0x870>
    80006958:	00002097          	auipc	ra,0x2
    8000695c:	9e0080e7          	jalr	-1568(ra) # 80008338 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006960:	00c00513          	li	a0,12
    80006964:	00000097          	auipc	ra,0x0
    80006968:	d88080e7          	jalr	-632(ra) # 800066ec <_ZL9fibonaccim>
    8000696c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006970:	00005517          	auipc	a0,0x5
    80006974:	ca050513          	addi	a0,a0,-864 # 8000b610 <CONSOLE_STATUS+0x600>
    80006978:	00002097          	auipc	ra,0x2
    8000697c:	9c0080e7          	jalr	-1600(ra) # 80008338 <_Z11printStringPKc>
    80006980:	00000613          	li	a2,0
    80006984:	00a00593          	li	a1,10
    80006988:	0009051b          	sext.w	a0,s2
    8000698c:	00002097          	auipc	ra,0x2
    80006990:	b5c080e7          	jalr	-1188(ra) # 800084e8 <_Z8printIntiii>
    80006994:	00005517          	auipc	a0,0x5
    80006998:	eec50513          	addi	a0,a0,-276 # 8000b880 <CONSOLE_STATUS+0x870>
    8000699c:	00002097          	auipc	ra,0x2
    800069a0:	99c080e7          	jalr	-1636(ra) # 80008338 <_Z11printStringPKc>
    800069a4:	0400006f          	j	800069e4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800069a8:	00005517          	auipc	a0,0x5
    800069ac:	c4850513          	addi	a0,a0,-952 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    800069b0:	00002097          	auipc	ra,0x2
    800069b4:	988080e7          	jalr	-1656(ra) # 80008338 <_Z11printStringPKc>
    800069b8:	00000613          	li	a2,0
    800069bc:	00a00593          	li	a1,10
    800069c0:	00048513          	mv	a0,s1
    800069c4:	00002097          	auipc	ra,0x2
    800069c8:	b24080e7          	jalr	-1244(ra) # 800084e8 <_Z8printIntiii>
    800069cc:	00005517          	auipc	a0,0x5
    800069d0:	eb450513          	addi	a0,a0,-332 # 8000b880 <CONSOLE_STATUS+0x870>
    800069d4:	00002097          	auipc	ra,0x2
    800069d8:	964080e7          	jalr	-1692(ra) # 80008338 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800069dc:	0014849b          	addiw	s1,s1,1
    800069e0:	0ff4f493          	andi	s1,s1,255
    800069e4:	00500793          	li	a5,5
    800069e8:	fc97f0e3          	bgeu	a5,s1,800069a8 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    800069ec:	00005517          	auipc	a0,0x5
    800069f0:	c3450513          	addi	a0,a0,-972 # 8000b620 <CONSOLE_STATUS+0x610>
    800069f4:	00002097          	auipc	ra,0x2
    800069f8:	944080e7          	jalr	-1724(ra) # 80008338 <_Z11printStringPKc>
    finishedC = true;
    800069fc:	00100793          	li	a5,1
    80006a00:	00007717          	auipc	a4,0x7
    80006a04:	7af70ca3          	sb	a5,1977(a4) # 8000e1b9 <_ZL9finishedC>
    thread_dispatch();
    80006a08:	ffffb097          	auipc	ra,0xffffb
    80006a0c:	f94080e7          	jalr	-108(ra) # 8000199c <_Z15thread_dispatchv>
}
    80006a10:	01813083          	ld	ra,24(sp)
    80006a14:	01013403          	ld	s0,16(sp)
    80006a18:	00813483          	ld	s1,8(sp)
    80006a1c:	00013903          	ld	s2,0(sp)
    80006a20:	02010113          	addi	sp,sp,32
    80006a24:	00008067          	ret

0000000080006a28 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006a28:	fe010113          	addi	sp,sp,-32
    80006a2c:	00113c23          	sd	ra,24(sp)
    80006a30:	00813823          	sd	s0,16(sp)
    80006a34:	00913423          	sd	s1,8(sp)
    80006a38:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006a3c:	00000493          	li	s1,0
    80006a40:	0340006f          	j	80006a74 <_ZL11workerBodyBPv+0x4c>
        for (uint64 j = 0; j < 100; j++) {
    80006a44:	00168693          	addi	a3,a3,1
    80006a48:	06300793          	li	a5,99
    80006a4c:	00d7ee63          	bltu	a5,a3,80006a68 <_ZL11workerBodyBPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006a50:	00000713          	li	a4,0
    80006a54:	000077b7          	lui	a5,0x7
    80006a58:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006a5c:	fee7e4e3          	bltu	a5,a4,80006a44 <_ZL11workerBodyBPv+0x1c>
    80006a60:	00170713          	addi	a4,a4,1
    80006a64:	ff1ff06f          	j	80006a54 <_ZL11workerBodyBPv+0x2c>
        if (i == 10) {
    80006a68:	00a00793          	li	a5,10
    80006a6c:	04f48663          	beq	s1,a5,80006ab8 <_ZL11workerBodyBPv+0x90>
    for (uint64 i = 0; i < 16; i++) {
    80006a70:	00148493          	addi	s1,s1,1
    80006a74:	00f00793          	li	a5,15
    80006a78:	0497e463          	bltu	a5,s1,80006ac0 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80006a7c:	00005517          	auipc	a0,0x5
    80006a80:	bb450513          	addi	a0,a0,-1100 # 8000b630 <CONSOLE_STATUS+0x620>
    80006a84:	00002097          	auipc	ra,0x2
    80006a88:	8b4080e7          	jalr	-1868(ra) # 80008338 <_Z11printStringPKc>
    80006a8c:	00000613          	li	a2,0
    80006a90:	00a00593          	li	a1,10
    80006a94:	0004851b          	sext.w	a0,s1
    80006a98:	00002097          	auipc	ra,0x2
    80006a9c:	a50080e7          	jalr	-1456(ra) # 800084e8 <_Z8printIntiii>
    80006aa0:	00005517          	auipc	a0,0x5
    80006aa4:	de050513          	addi	a0,a0,-544 # 8000b880 <CONSOLE_STATUS+0x870>
    80006aa8:	00002097          	auipc	ra,0x2
    80006aac:	890080e7          	jalr	-1904(ra) # 80008338 <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80006ab0:	00000693          	li	a3,0
    80006ab4:	f95ff06f          	j	80006a48 <_ZL11workerBodyBPv+0x20>
            asm volatile("csrr t6, sepc");
    80006ab8:	14102ff3          	csrr	t6,sepc
    80006abc:	fb5ff06f          	j	80006a70 <_ZL11workerBodyBPv+0x48>
    printString("B finished!\n");
    80006ac0:	00005517          	auipc	a0,0x5
    80006ac4:	b7850513          	addi	a0,a0,-1160 # 8000b638 <CONSOLE_STATUS+0x628>
    80006ac8:	00002097          	auipc	ra,0x2
    80006acc:	870080e7          	jalr	-1936(ra) # 80008338 <_Z11printStringPKc>
    finishedB = true;
    80006ad0:	00100793          	li	a5,1
    80006ad4:	00007717          	auipc	a4,0x7
    80006ad8:	6ef70323          	sb	a5,1766(a4) # 8000e1ba <_ZL9finishedB>
    thread_dispatch();
    80006adc:	ffffb097          	auipc	ra,0xffffb
    80006ae0:	ec0080e7          	jalr	-320(ra) # 8000199c <_Z15thread_dispatchv>
}
    80006ae4:	01813083          	ld	ra,24(sp)
    80006ae8:	01013403          	ld	s0,16(sp)
    80006aec:	00813483          	ld	s1,8(sp)
    80006af0:	02010113          	addi	sp,sp,32
    80006af4:	00008067          	ret

0000000080006af8 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006af8:	fe010113          	addi	sp,sp,-32
    80006afc:	00113c23          	sd	ra,24(sp)
    80006b00:	00813823          	sd	s0,16(sp)
    80006b04:	00913423          	sd	s1,8(sp)
    80006b08:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006b0c:	00000493          	li	s1,0
    80006b10:	02c0006f          	j	80006b3c <_ZL11workerBodyAPv+0x44>
        for (uint64 j = 0; j < 100; j++) {
    80006b14:	00168693          	addi	a3,a3,1
    80006b18:	06300793          	li	a5,99
    80006b1c:	00d7ee63          	bltu	a5,a3,80006b38 <_ZL11workerBodyAPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006b20:	00000713          	li	a4,0
    80006b24:	000077b7          	lui	a5,0x7
    80006b28:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006b2c:	fee7e4e3          	bltu	a5,a4,80006b14 <_ZL11workerBodyAPv+0x1c>
    80006b30:	00170713          	addi	a4,a4,1
    80006b34:	ff1ff06f          	j	80006b24 <_ZL11workerBodyAPv+0x2c>
    for (uint64 i = 0; i < 10; i++) {
    80006b38:	00148493          	addi	s1,s1,1
    80006b3c:	00900793          	li	a5,9
    80006b40:	0497e063          	bltu	a5,s1,80006b80 <_ZL11workerBodyAPv+0x88>
        printString("A: i="); printInt(i); printString("\n");
    80006b44:	00005517          	auipc	a0,0x5
    80006b48:	b0450513          	addi	a0,a0,-1276 # 8000b648 <CONSOLE_STATUS+0x638>
    80006b4c:	00001097          	auipc	ra,0x1
    80006b50:	7ec080e7          	jalr	2028(ra) # 80008338 <_Z11printStringPKc>
    80006b54:	00000613          	li	a2,0
    80006b58:	00a00593          	li	a1,10
    80006b5c:	0004851b          	sext.w	a0,s1
    80006b60:	00002097          	auipc	ra,0x2
    80006b64:	988080e7          	jalr	-1656(ra) # 800084e8 <_Z8printIntiii>
    80006b68:	00005517          	auipc	a0,0x5
    80006b6c:	d1850513          	addi	a0,a0,-744 # 8000b880 <CONSOLE_STATUS+0x870>
    80006b70:	00001097          	auipc	ra,0x1
    80006b74:	7c8080e7          	jalr	1992(ra) # 80008338 <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80006b78:	00000693          	li	a3,0
    80006b7c:	f9dff06f          	j	80006b18 <_ZL11workerBodyAPv+0x20>
    printString("A finished!\n");
    80006b80:	00005517          	auipc	a0,0x5
    80006b84:	ad050513          	addi	a0,a0,-1328 # 8000b650 <CONSOLE_STATUS+0x640>
    80006b88:	00001097          	auipc	ra,0x1
    80006b8c:	7b0080e7          	jalr	1968(ra) # 80008338 <_Z11printStringPKc>
    finishedA = true;
    80006b90:	00100793          	li	a5,1
    80006b94:	00007717          	auipc	a4,0x7
    80006b98:	62f703a3          	sb	a5,1575(a4) # 8000e1bb <_ZL9finishedA>
}
    80006b9c:	01813083          	ld	ra,24(sp)
    80006ba0:	01013403          	ld	s0,16(sp)
    80006ba4:	00813483          	ld	s1,8(sp)
    80006ba8:	02010113          	addi	sp,sp,32
    80006bac:	00008067          	ret

0000000080006bb0 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006bb0:	fd010113          	addi	sp,sp,-48
    80006bb4:	02113423          	sd	ra,40(sp)
    80006bb8:	02813023          	sd	s0,32(sp)
    80006bbc:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006bc0:	00000613          	li	a2,0
    80006bc4:	00000597          	auipc	a1,0x0
    80006bc8:	f3458593          	addi	a1,a1,-204 # 80006af8 <_ZL11workerBodyAPv>
    80006bcc:	fd040513          	addi	a0,s0,-48
    80006bd0:	ffffb097          	auipc	ra,0xffffb
    80006bd4:	d30080e7          	jalr	-720(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80006bd8:	00005517          	auipc	a0,0x5
    80006bdc:	a8850513          	addi	a0,a0,-1400 # 8000b660 <CONSOLE_STATUS+0x650>
    80006be0:	00001097          	auipc	ra,0x1
    80006be4:	758080e7          	jalr	1880(ra) # 80008338 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[1], workerBodyB, nullptr);
    80006be8:	00000613          	li	a2,0
    80006bec:	00000597          	auipc	a1,0x0
    80006bf0:	e3c58593          	addi	a1,a1,-452 # 80006a28 <_ZL11workerBodyBPv>
    80006bf4:	fd840513          	addi	a0,s0,-40
    80006bf8:	ffffb097          	auipc	ra,0xffffb
    80006bfc:	d08080e7          	jalr	-760(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80006c00:	00005517          	auipc	a0,0x5
    80006c04:	a7850513          	addi	a0,a0,-1416 # 8000b678 <CONSOLE_STATUS+0x668>
    80006c08:	00001097          	auipc	ra,0x1
    80006c0c:	730080e7          	jalr	1840(ra) # 80008338 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[2], workerBodyC, nullptr);
    80006c10:	00000613          	li	a2,0
    80006c14:	00000597          	auipc	a1,0x0
    80006c18:	c9458593          	addi	a1,a1,-876 # 800068a8 <_ZL11workerBodyCPv>
    80006c1c:	fe040513          	addi	a0,s0,-32
    80006c20:	ffffb097          	auipc	ra,0xffffb
    80006c24:	ce0080e7          	jalr	-800(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80006c28:	00005517          	auipc	a0,0x5
    80006c2c:	a6850513          	addi	a0,a0,-1432 # 8000b690 <CONSOLE_STATUS+0x680>
    80006c30:	00001097          	auipc	ra,0x1
    80006c34:	708080e7          	jalr	1800(ra) # 80008338 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[3], workerBodyD, nullptr);
    80006c38:	00000613          	li	a2,0
    80006c3c:	00000597          	auipc	a1,0x0
    80006c40:	b2458593          	addi	a1,a1,-1244 # 80006760 <_ZL11workerBodyDPv>
    80006c44:	fe840513          	addi	a0,s0,-24
    80006c48:	ffffb097          	auipc	ra,0xffffb
    80006c4c:	cb8080e7          	jalr	-840(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006c50:	00005517          	auipc	a0,0x5
    80006c54:	a5850513          	addi	a0,a0,-1448 # 8000b6a8 <CONSOLE_STATUS+0x698>
    80006c58:	00001097          	auipc	ra,0x1
    80006c5c:	6e0080e7          	jalr	1760(ra) # 80008338 <_Z11printStringPKc>
    80006c60:	00c0006f          	j	80006c6c <_Z16System_Mode_testv+0xbc>
    // testUser();

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006c64:	ffffb097          	auipc	ra,0xffffb
    80006c68:	d38080e7          	jalr	-712(ra) # 8000199c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006c6c:	00007797          	auipc	a5,0x7
    80006c70:	54f7c783          	lbu	a5,1359(a5) # 8000e1bb <_ZL9finishedA>
    80006c74:	fe0788e3          	beqz	a5,80006c64 <_Z16System_Mode_testv+0xb4>
    80006c78:	00007797          	auipc	a5,0x7
    80006c7c:	5427c783          	lbu	a5,1346(a5) # 8000e1ba <_ZL9finishedB>
    80006c80:	fe0782e3          	beqz	a5,80006c64 <_Z16System_Mode_testv+0xb4>
    80006c84:	00007797          	auipc	a5,0x7
    80006c88:	5357c783          	lbu	a5,1333(a5) # 8000e1b9 <_ZL9finishedC>
    80006c8c:	fc078ce3          	beqz	a5,80006c64 <_Z16System_Mode_testv+0xb4>
    80006c90:	00007797          	auipc	a5,0x7
    80006c94:	5287c783          	lbu	a5,1320(a5) # 8000e1b8 <_ZL9finishedD>
    80006c98:	fc0786e3          	beqz	a5,80006c64 <_Z16System_Mode_testv+0xb4>
    }

}
    80006c9c:	02813083          	ld	ra,40(sp)
    80006ca0:	02013403          	ld	s0,32(sp)
    80006ca4:	03010113          	addi	sp,sp,48
    80006ca8:	00008067          	ret

0000000080006cac <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006cac:	fe010113          	addi	sp,sp,-32
    80006cb0:	00113c23          	sd	ra,24(sp)
    80006cb4:	00813823          	sd	s0,16(sp)
    80006cb8:	00913423          	sd	s1,8(sp)
    80006cbc:	01213023          	sd	s2,0(sp)
    80006cc0:	02010413          	addi	s0,sp,32
    80006cc4:	00050493          	mv	s1,a0
    // putc('F');
    if (n == 0 || n == 1) { return n; }
    80006cc8:	00100793          	li	a5,1
    80006ccc:	02a7f263          	bgeu	a5,a0,80006cf0 <_ZL9fibonaccim+0x44>
    // if (n % 10 == 0) { thread_dispatch(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006cd0:	fff50513          	addi	a0,a0,-1
    80006cd4:	00000097          	auipc	ra,0x0
    80006cd8:	fd8080e7          	jalr	-40(ra) # 80006cac <_ZL9fibonaccim>
    80006cdc:	00050913          	mv	s2,a0
    80006ce0:	ffe48513          	addi	a0,s1,-2
    80006ce4:	00000097          	auipc	ra,0x0
    80006ce8:	fc8080e7          	jalr	-56(ra) # 80006cac <_ZL9fibonaccim>
    80006cec:	00a90533          	add	a0,s2,a0
}
    80006cf0:	01813083          	ld	ra,24(sp)
    80006cf4:	01013403          	ld	s0,16(sp)
    80006cf8:	00813483          	ld	s1,8(sp)
    80006cfc:	00013903          	ld	s2,0(sp)
    80006d00:	02010113          	addi	sp,sp,32
    80006d04:	00008067          	ret

0000000080006d08 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006d08:	fe010113          	addi	sp,sp,-32
    80006d0c:	00113c23          	sd	ra,24(sp)
    80006d10:	00813823          	sd	s0,16(sp)
    80006d14:	00913423          	sd	s1,8(sp)
    80006d18:	01213023          	sd	s2,0(sp)
    80006d1c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006d20:	00a00493          	li	s1,10
    80006d24:	0400006f          	j	80006d64 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006d28:	00005517          	auipc	a0,0x5
    80006d2c:	89050513          	addi	a0,a0,-1904 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80006d30:	00001097          	auipc	ra,0x1
    80006d34:	608080e7          	jalr	1544(ra) # 80008338 <_Z11printStringPKc>
    80006d38:	00000613          	li	a2,0
    80006d3c:	00a00593          	li	a1,10
    80006d40:	00048513          	mv	a0,s1
    80006d44:	00001097          	auipc	ra,0x1
    80006d48:	7a4080e7          	jalr	1956(ra) # 800084e8 <_Z8printIntiii>
    80006d4c:	00005517          	auipc	a0,0x5
    80006d50:	b3450513          	addi	a0,a0,-1228 # 8000b880 <CONSOLE_STATUS+0x870>
    80006d54:	00001097          	auipc	ra,0x1
    80006d58:	5e4080e7          	jalr	1508(ra) # 80008338 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006d5c:	0014849b          	addiw	s1,s1,1
    80006d60:	0ff4f493          	andi	s1,s1,255
    80006d64:	00c00793          	li	a5,12
    80006d68:	fc97f0e3          	bgeu	a5,s1,80006d28 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006d6c:	00005517          	auipc	a0,0x5
    80006d70:	85450513          	addi	a0,a0,-1964 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80006d74:	00001097          	auipc	ra,0x1
    80006d78:	5c4080e7          	jalr	1476(ra) # 80008338 <_Z11printStringPKc>
    __asm__ volatile("li t1, 5");
    80006d7c:	00500313          	li	t1,5
    thread_dispatch();
    80006d80:	ffffb097          	auipc	ra,0xffffb
    80006d84:	c1c080e7          	jalr	-996(ra) # 8000199c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006d88:	01000513          	li	a0,16
    80006d8c:	00000097          	auipc	ra,0x0
    80006d90:	f20080e7          	jalr	-224(ra) # 80006cac <_ZL9fibonaccim>
    80006d94:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006d98:	00005517          	auipc	a0,0x5
    80006d9c:	83850513          	addi	a0,a0,-1992 # 8000b5d0 <CONSOLE_STATUS+0x5c0>
    80006da0:	00001097          	auipc	ra,0x1
    80006da4:	598080e7          	jalr	1432(ra) # 80008338 <_Z11printStringPKc>
    80006da8:	00000613          	li	a2,0
    80006dac:	00a00593          	li	a1,10
    80006db0:	0009051b          	sext.w	a0,s2
    80006db4:	00001097          	auipc	ra,0x1
    80006db8:	734080e7          	jalr	1844(ra) # 800084e8 <_Z8printIntiii>
    80006dbc:	00005517          	auipc	a0,0x5
    80006dc0:	ac450513          	addi	a0,a0,-1340 # 8000b880 <CONSOLE_STATUS+0x870>
    80006dc4:	00001097          	auipc	ra,0x1
    80006dc8:	574080e7          	jalr	1396(ra) # 80008338 <_Z11printStringPKc>
    80006dcc:	0400006f          	j	80006e0c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006dd0:	00004517          	auipc	a0,0x4
    80006dd4:	7e850513          	addi	a0,a0,2024 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80006dd8:	00001097          	auipc	ra,0x1
    80006ddc:	560080e7          	jalr	1376(ra) # 80008338 <_Z11printStringPKc>
    80006de0:	00000613          	li	a2,0
    80006de4:	00a00593          	li	a1,10
    80006de8:	00048513          	mv	a0,s1
    80006dec:	00001097          	auipc	ra,0x1
    80006df0:	6fc080e7          	jalr	1788(ra) # 800084e8 <_Z8printIntiii>
    80006df4:	00005517          	auipc	a0,0x5
    80006df8:	a8c50513          	addi	a0,a0,-1396 # 8000b880 <CONSOLE_STATUS+0x870>
    80006dfc:	00001097          	auipc	ra,0x1
    80006e00:	53c080e7          	jalr	1340(ra) # 80008338 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006e04:	0014849b          	addiw	s1,s1,1
    80006e08:	0ff4f493          	andi	s1,s1,255
    80006e0c:	00f00793          	li	a5,15
    80006e10:	fc97f0e3          	bgeu	a5,s1,80006dd0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006e14:	00004517          	auipc	a0,0x4
    80006e18:	7cc50513          	addi	a0,a0,1996 # 8000b5e0 <CONSOLE_STATUS+0x5d0>
    80006e1c:	00001097          	auipc	ra,0x1
    80006e20:	51c080e7          	jalr	1308(ra) # 80008338 <_Z11printStringPKc>
    finishedD = true;
    80006e24:	00100793          	li	a5,1
    80006e28:	00007717          	auipc	a4,0x7
    80006e2c:	38f70a23          	sb	a5,916(a4) # 8000e1bc <_ZL9finishedD>
    thread_dispatch();
    80006e30:	ffffb097          	auipc	ra,0xffffb
    80006e34:	b6c080e7          	jalr	-1172(ra) # 8000199c <_Z15thread_dispatchv>
}
    80006e38:	01813083          	ld	ra,24(sp)
    80006e3c:	01013403          	ld	s0,16(sp)
    80006e40:	00813483          	ld	s1,8(sp)
    80006e44:	00013903          	ld	s2,0(sp)
    80006e48:	02010113          	addi	sp,sp,32
    80006e4c:	00008067          	ret

0000000080006e50 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006e50:	fe010113          	addi	sp,sp,-32
    80006e54:	00113c23          	sd	ra,24(sp)
    80006e58:	00813823          	sd	s0,16(sp)
    80006e5c:	00913423          	sd	s1,8(sp)
    80006e60:	01213023          	sd	s2,0(sp)
    80006e64:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006e68:	00000493          	li	s1,0
    80006e6c:	0400006f          	j	80006eac <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006e70:	00004517          	auipc	a0,0x4
    80006e74:	78050513          	addi	a0,a0,1920 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    80006e78:	00001097          	auipc	ra,0x1
    80006e7c:	4c0080e7          	jalr	1216(ra) # 80008338 <_Z11printStringPKc>
    80006e80:	00000613          	li	a2,0
    80006e84:	00a00593          	li	a1,10
    80006e88:	00048513          	mv	a0,s1
    80006e8c:	00001097          	auipc	ra,0x1
    80006e90:	65c080e7          	jalr	1628(ra) # 800084e8 <_Z8printIntiii>
    80006e94:	00005517          	auipc	a0,0x5
    80006e98:	9ec50513          	addi	a0,a0,-1556 # 8000b880 <CONSOLE_STATUS+0x870>
    80006e9c:	00001097          	auipc	ra,0x1
    80006ea0:	49c080e7          	jalr	1180(ra) # 80008338 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006ea4:	0014849b          	addiw	s1,s1,1
    80006ea8:	0ff4f493          	andi	s1,s1,255
    80006eac:	00200793          	li	a5,2
    80006eb0:	fc97f0e3          	bgeu	a5,s1,80006e70 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006eb4:	00004517          	auipc	a0,0x4
    80006eb8:	74450513          	addi	a0,a0,1860 # 8000b5f8 <CONSOLE_STATUS+0x5e8>
    80006ebc:	00001097          	auipc	ra,0x1
    80006ec0:	47c080e7          	jalr	1148(ra) # 80008338 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006ec4:	00700313          	li	t1,7
    thread_dispatch();
    80006ec8:	ffffb097          	auipc	ra,0xffffb
    80006ecc:	ad4080e7          	jalr	-1324(ra) # 8000199c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006ed0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006ed4:	00004517          	auipc	a0,0x4
    80006ed8:	73450513          	addi	a0,a0,1844 # 8000b608 <CONSOLE_STATUS+0x5f8>
    80006edc:	00001097          	auipc	ra,0x1
    80006ee0:	45c080e7          	jalr	1116(ra) # 80008338 <_Z11printStringPKc>
    80006ee4:	00000613          	li	a2,0
    80006ee8:	00a00593          	li	a1,10
    80006eec:	0009051b          	sext.w	a0,s2
    80006ef0:	00001097          	auipc	ra,0x1
    80006ef4:	5f8080e7          	jalr	1528(ra) # 800084e8 <_Z8printIntiii>
    80006ef8:	00005517          	auipc	a0,0x5
    80006efc:	98850513          	addi	a0,a0,-1656 # 8000b880 <CONSOLE_STATUS+0x870>
    80006f00:	00001097          	auipc	ra,0x1
    80006f04:	438080e7          	jalr	1080(ra) # 80008338 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006f08:	00c00513          	li	a0,12
    80006f0c:	00000097          	auipc	ra,0x0
    80006f10:	da0080e7          	jalr	-608(ra) # 80006cac <_ZL9fibonaccim>
    80006f14:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006f18:	00004517          	auipc	a0,0x4
    80006f1c:	6f850513          	addi	a0,a0,1784 # 8000b610 <CONSOLE_STATUS+0x600>
    80006f20:	00001097          	auipc	ra,0x1
    80006f24:	418080e7          	jalr	1048(ra) # 80008338 <_Z11printStringPKc>
    80006f28:	00000613          	li	a2,0
    80006f2c:	00a00593          	li	a1,10
    80006f30:	0009051b          	sext.w	a0,s2
    80006f34:	00001097          	auipc	ra,0x1
    80006f38:	5b4080e7          	jalr	1460(ra) # 800084e8 <_Z8printIntiii>
    80006f3c:	00005517          	auipc	a0,0x5
    80006f40:	94450513          	addi	a0,a0,-1724 # 8000b880 <CONSOLE_STATUS+0x870>
    80006f44:	00001097          	auipc	ra,0x1
    80006f48:	3f4080e7          	jalr	1012(ra) # 80008338 <_Z11printStringPKc>
    80006f4c:	0400006f          	j	80006f8c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006f50:	00004517          	auipc	a0,0x4
    80006f54:	6a050513          	addi	a0,a0,1696 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    80006f58:	00001097          	auipc	ra,0x1
    80006f5c:	3e0080e7          	jalr	992(ra) # 80008338 <_Z11printStringPKc>
    80006f60:	00000613          	li	a2,0
    80006f64:	00a00593          	li	a1,10
    80006f68:	00048513          	mv	a0,s1
    80006f6c:	00001097          	auipc	ra,0x1
    80006f70:	57c080e7          	jalr	1404(ra) # 800084e8 <_Z8printIntiii>
    80006f74:	00005517          	auipc	a0,0x5
    80006f78:	90c50513          	addi	a0,a0,-1780 # 8000b880 <CONSOLE_STATUS+0x870>
    80006f7c:	00001097          	auipc	ra,0x1
    80006f80:	3bc080e7          	jalr	956(ra) # 80008338 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006f84:	0014849b          	addiw	s1,s1,1
    80006f88:	0ff4f493          	andi	s1,s1,255
    80006f8c:	00500793          	li	a5,5
    80006f90:	fc97f0e3          	bgeu	a5,s1,80006f50 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80006f94:	00004517          	auipc	a0,0x4
    80006f98:	68c50513          	addi	a0,a0,1676 # 8000b620 <CONSOLE_STATUS+0x610>
    80006f9c:	00001097          	auipc	ra,0x1
    80006fa0:	39c080e7          	jalr	924(ra) # 80008338 <_Z11printStringPKc>
    finishedC = true;
    80006fa4:	00100793          	li	a5,1
    80006fa8:	00007717          	auipc	a4,0x7
    80006fac:	20f70aa3          	sb	a5,533(a4) # 8000e1bd <_ZL9finishedC>
    thread_dispatch();
    80006fb0:	ffffb097          	auipc	ra,0xffffb
    80006fb4:	9ec080e7          	jalr	-1556(ra) # 8000199c <_Z15thread_dispatchv>
}
    80006fb8:	01813083          	ld	ra,24(sp)
    80006fbc:	01013403          	ld	s0,16(sp)
    80006fc0:	00813483          	ld	s1,8(sp)
    80006fc4:	00013903          	ld	s2,0(sp)
    80006fc8:	02010113          	addi	sp,sp,32
    80006fcc:	00008067          	ret

0000000080006fd0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006fd0:	fe010113          	addi	sp,sp,-32
    80006fd4:	00113c23          	sd	ra,24(sp)
    80006fd8:	00813823          	sd	s0,16(sp)
    80006fdc:	00913423          	sd	s1,8(sp)
    80006fe0:	01213023          	sd	s2,0(sp)
    80006fe4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006fe8:	00000913          	li	s2,0
    80006fec:	0440006f          	j	80007030 <_ZL11workerBodyBPv+0x60>
            thread_dispatch();
    80006ff0:	ffffb097          	auipc	ra,0xffffb
    80006ff4:	9ac080e7          	jalr	-1620(ra) # 8000199c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006ff8:	00148493          	addi	s1,s1,1
    80006ffc:	000027b7          	lui	a5,0x2
    80007000:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80007004:	0297e463          	bltu	a5,s1,8000702c <_ZL11workerBodyBPv+0x5c>
            putc('B');
    80007008:	04200513          	li	a0,66
    8000700c:	ffffb097          	auipc	ra,0xffffb
    80007010:	ae4080e7          	jalr	-1308(ra) # 80001af0 <_Z4putcc>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80007014:	00000713          	li	a4,0
    80007018:	000077b7          	lui	a5,0x7
    8000701c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80007020:	fce7e8e3          	bltu	a5,a4,80006ff0 <_ZL11workerBodyBPv+0x20>
    80007024:	00170713          	addi	a4,a4,1
    80007028:	ff1ff06f          	j	80007018 <_ZL11workerBodyBPv+0x48>
    for (uint64 i = 0; i < 16; i++) {
    8000702c:	00190913          	addi	s2,s2,1
    80007030:	00f00793          	li	a5,15
    80007034:	0527e063          	bltu	a5,s2,80007074 <_ZL11workerBodyBPv+0xa4>
        printString("B: i="); printInt(i); printString("\n");
    80007038:	00004517          	auipc	a0,0x4
    8000703c:	5f850513          	addi	a0,a0,1528 # 8000b630 <CONSOLE_STATUS+0x620>
    80007040:	00001097          	auipc	ra,0x1
    80007044:	2f8080e7          	jalr	760(ra) # 80008338 <_Z11printStringPKc>
    80007048:	00000613          	li	a2,0
    8000704c:	00a00593          	li	a1,10
    80007050:	0009051b          	sext.w	a0,s2
    80007054:	00001097          	auipc	ra,0x1
    80007058:	494080e7          	jalr	1172(ra) # 800084e8 <_Z8printIntiii>
    8000705c:	00005517          	auipc	a0,0x5
    80007060:	82450513          	addi	a0,a0,-2012 # 8000b880 <CONSOLE_STATUS+0x870>
    80007064:	00001097          	auipc	ra,0x1
    80007068:	2d4080e7          	jalr	724(ra) # 80008338 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000706c:	00000493          	li	s1,0
    80007070:	f8dff06f          	j	80006ffc <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80007074:	00004517          	auipc	a0,0x4
    80007078:	5c450513          	addi	a0,a0,1476 # 8000b638 <CONSOLE_STATUS+0x628>
    8000707c:	00001097          	auipc	ra,0x1
    80007080:	2bc080e7          	jalr	700(ra) # 80008338 <_Z11printStringPKc>
    finishedB = true;
    80007084:	00100793          	li	a5,1
    80007088:	00007717          	auipc	a4,0x7
    8000708c:	12f70b23          	sb	a5,310(a4) # 8000e1be <_ZL9finishedB>
    thread_dispatch();
    80007090:	ffffb097          	auipc	ra,0xffffb
    80007094:	90c080e7          	jalr	-1780(ra) # 8000199c <_Z15thread_dispatchv>
}
    80007098:	01813083          	ld	ra,24(sp)
    8000709c:	01013403          	ld	s0,16(sp)
    800070a0:	00813483          	ld	s1,8(sp)
    800070a4:	00013903          	ld	s2,0(sp)
    800070a8:	02010113          	addi	sp,sp,32
    800070ac:	00008067          	ret

00000000800070b0 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800070b0:	fe010113          	addi	sp,sp,-32
    800070b4:	00113c23          	sd	ra,24(sp)
    800070b8:	00813823          	sd	s0,16(sp)
    800070bc:	00913423          	sd	s1,8(sp)
    800070c0:	01213023          	sd	s2,0(sp)
    800070c4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800070c8:	00000913          	li	s2,0
    800070cc:	0440006f          	j	80007110 <_ZL11workerBodyAPv+0x60>
            thread_dispatch();
    800070d0:	ffffb097          	auipc	ra,0xffffb
    800070d4:	8cc080e7          	jalr	-1844(ra) # 8000199c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800070d8:	00148493          	addi	s1,s1,1
    800070dc:	000027b7          	lui	a5,0x2
    800070e0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800070e4:	0297e463          	bltu	a5,s1,8000710c <_ZL11workerBodyAPv+0x5c>
            putc('A');
    800070e8:	04100513          	li	a0,65
    800070ec:	ffffb097          	auipc	ra,0xffffb
    800070f0:	a04080e7          	jalr	-1532(ra) # 80001af0 <_Z4putcc>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800070f4:	00000713          	li	a4,0
    800070f8:	000077b7          	lui	a5,0x7
    800070fc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80007100:	fce7e8e3          	bltu	a5,a4,800070d0 <_ZL11workerBodyAPv+0x20>
    80007104:	00170713          	addi	a4,a4,1
    80007108:	ff1ff06f          	j	800070f8 <_ZL11workerBodyAPv+0x48>
    for (uint64 i = 0; i < 10; i++) {
    8000710c:	00190913          	addi	s2,s2,1
    80007110:	00900793          	li	a5,9
    80007114:	0527e063          	bltu	a5,s2,80007154 <_ZL11workerBodyAPv+0xa4>
        printString("A: i="); printInt(i); printString("\n");
    80007118:	00004517          	auipc	a0,0x4
    8000711c:	53050513          	addi	a0,a0,1328 # 8000b648 <CONSOLE_STATUS+0x638>
    80007120:	00001097          	auipc	ra,0x1
    80007124:	218080e7          	jalr	536(ra) # 80008338 <_Z11printStringPKc>
    80007128:	00000613          	li	a2,0
    8000712c:	00a00593          	li	a1,10
    80007130:	0009051b          	sext.w	a0,s2
    80007134:	00001097          	auipc	ra,0x1
    80007138:	3b4080e7          	jalr	948(ra) # 800084e8 <_Z8printIntiii>
    8000713c:	00004517          	auipc	a0,0x4
    80007140:	74450513          	addi	a0,a0,1860 # 8000b880 <CONSOLE_STATUS+0x870>
    80007144:	00001097          	auipc	ra,0x1
    80007148:	1f4080e7          	jalr	500(ra) # 80008338 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000714c:	00000493          	li	s1,0
    80007150:	f8dff06f          	j	800070dc <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80007154:	00004517          	auipc	a0,0x4
    80007158:	4fc50513          	addi	a0,a0,1276 # 8000b650 <CONSOLE_STATUS+0x640>
    8000715c:	00001097          	auipc	ra,0x1
    80007160:	1dc080e7          	jalr	476(ra) # 80008338 <_Z11printStringPKc>
    finishedA = true;
    80007164:	00100793          	li	a5,1
    80007168:	00007717          	auipc	a4,0x7
    8000716c:	04f70ba3          	sb	a5,87(a4) # 8000e1bf <_ZL9finishedA>
}
    80007170:	01813083          	ld	ra,24(sp)
    80007174:	01013403          	ld	s0,16(sp)
    80007178:	00813483          	ld	s1,8(sp)
    8000717c:	00013903          	ld	s2,0(sp)
    80007180:	02010113          	addi	sp,sp,32
    80007184:	00008067          	ret

0000000080007188 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80007188:	fd010113          	addi	sp,sp,-48
    8000718c:	02113423          	sd	ra,40(sp)
    80007190:	02813023          	sd	s0,32(sp)
    80007194:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80007198:	00000613          	li	a2,0
    8000719c:	00000597          	auipc	a1,0x0
    800071a0:	f1458593          	addi	a1,a1,-236 # 800070b0 <_ZL11workerBodyAPv>
    800071a4:	fd040513          	addi	a0,s0,-48
    800071a8:	ffffa097          	auipc	ra,0xffffa
    800071ac:	758080e7          	jalr	1880(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800071b0:	00004517          	auipc	a0,0x4
    800071b4:	4b050513          	addi	a0,a0,1200 # 8000b660 <CONSOLE_STATUS+0x650>
    800071b8:	00001097          	auipc	ra,0x1
    800071bc:	180080e7          	jalr	384(ra) # 80008338 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800071c0:	00000613          	li	a2,0
    800071c4:	00000597          	auipc	a1,0x0
    800071c8:	e0c58593          	addi	a1,a1,-500 # 80006fd0 <_ZL11workerBodyBPv>
    800071cc:	fd840513          	addi	a0,s0,-40
    800071d0:	ffffa097          	auipc	ra,0xffffa
    800071d4:	730080e7          	jalr	1840(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    800071d8:	00004517          	auipc	a0,0x4
    800071dc:	4a050513          	addi	a0,a0,1184 # 8000b678 <CONSOLE_STATUS+0x668>
    800071e0:	00001097          	auipc	ra,0x1
    800071e4:	158080e7          	jalr	344(ra) # 80008338 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800071e8:	00000613          	li	a2,0
    800071ec:	00000597          	auipc	a1,0x0
    800071f0:	c6458593          	addi	a1,a1,-924 # 80006e50 <_ZL11workerBodyCPv>
    800071f4:	fe040513          	addi	a0,s0,-32
    800071f8:	ffffa097          	auipc	ra,0xffffa
    800071fc:	708080e7          	jalr	1800(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80007200:	00004517          	auipc	a0,0x4
    80007204:	49050513          	addi	a0,a0,1168 # 8000b690 <CONSOLE_STATUS+0x680>
    80007208:	00001097          	auipc	ra,0x1
    8000720c:	130080e7          	jalr	304(ra) # 80008338 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80007210:	00000613          	li	a2,0
    80007214:	00000597          	auipc	a1,0x0
    80007218:	af458593          	addi	a1,a1,-1292 # 80006d08 <_ZL11workerBodyDPv>
    8000721c:	fe840513          	addi	a0,s0,-24
    80007220:	ffffa097          	auipc	ra,0xffffa
    80007224:	6e0080e7          	jalr	1760(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80007228:	00004517          	auipc	a0,0x4
    8000722c:	48050513          	addi	a0,a0,1152 # 8000b6a8 <CONSOLE_STATUS+0x698>
    80007230:	00001097          	auipc	ra,0x1
    80007234:	108080e7          	jalr	264(ra) # 80008338 <_Z11printStringPKc>
    80007238:	00c0006f          	j	80007244 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    8000723c:	ffffa097          	auipc	ra,0xffffa
    80007240:	760080e7          	jalr	1888(ra) # 8000199c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80007244:	00007797          	auipc	a5,0x7
    80007248:	f7b7c783          	lbu	a5,-133(a5) # 8000e1bf <_ZL9finishedA>
    8000724c:	fe0788e3          	beqz	a5,8000723c <_Z18Threads_C_API_testv+0xb4>
    80007250:	00007797          	auipc	a5,0x7
    80007254:	f6e7c783          	lbu	a5,-146(a5) # 8000e1be <_ZL9finishedB>
    80007258:	fe0782e3          	beqz	a5,8000723c <_Z18Threads_C_API_testv+0xb4>
    8000725c:	00007797          	auipc	a5,0x7
    80007260:	f617c783          	lbu	a5,-159(a5) # 8000e1bd <_ZL9finishedC>
    80007264:	fc078ce3          	beqz	a5,8000723c <_Z18Threads_C_API_testv+0xb4>
    80007268:	00007797          	auipc	a5,0x7
    8000726c:	f547c783          	lbu	a5,-172(a5) # 8000e1bc <_ZL9finishedD>
    80007270:	fc0786e3          	beqz	a5,8000723c <_Z18Threads_C_API_testv+0xb4>
    }
}
    80007274:	02813083          	ld	ra,40(sp)
    80007278:	02013403          	ld	s0,32(sp)
    8000727c:	03010113          	addi	sp,sp,48
    80007280:	00008067          	ret

0000000080007284 <_ZL9sleepyRunPv>:

#include "../test_h/printing.h"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80007284:	fe010113          	addi	sp,sp,-32
    80007288:	00113c23          	sd	ra,24(sp)
    8000728c:	00813823          	sd	s0,16(sp)
    80007290:	00913423          	sd	s1,8(sp)
    80007294:	01213023          	sd	s2,0(sp)
    80007298:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    8000729c:	00053903          	ld	s2,0(a0)
    int i = 6;
    800072a0:	00600493          	li	s1,6
    while (--i > 0) {
    800072a4:	fff4849b          	addiw	s1,s1,-1
    800072a8:	04905a63          	blez	s1,800072fc <_ZL9sleepyRunPv+0x78>

        printString("Hello ");
    800072ac:	00004517          	auipc	a0,0x4
    800072b0:	41450513          	addi	a0,a0,1044 # 8000b6c0 <CONSOLE_STATUS+0x6b0>
    800072b4:	00001097          	auipc	ra,0x1
    800072b8:	084080e7          	jalr	132(ra) # 80008338 <_Z11printStringPKc>
        printInt(sleep_time);
    800072bc:	00000613          	li	a2,0
    800072c0:	00a00593          	li	a1,10
    800072c4:	0009051b          	sext.w	a0,s2
    800072c8:	00001097          	auipc	ra,0x1
    800072cc:	220080e7          	jalr	544(ra) # 800084e8 <_Z8printIntiii>
        printString(" !\n");
    800072d0:	00004517          	auipc	a0,0x4
    800072d4:	3f850513          	addi	a0,a0,1016 # 8000b6c8 <CONSOLE_STATUS+0x6b8>
    800072d8:	00001097          	auipc	ra,0x1
    800072dc:	060080e7          	jalr	96(ra) # 80008338 <_Z11printStringPKc>
        time_sleep(sleep_time);
    800072e0:	00090513          	mv	a0,s2
    800072e4:	ffffa097          	auipc	ra,0xffffa
    800072e8:	6fc080e7          	jalr	1788(ra) # 800019e0 <_Z10time_sleepm>
        putc('.');
    800072ec:	02e00513          	li	a0,46
    800072f0:	ffffb097          	auipc	ra,0xffffb
    800072f4:	800080e7          	jalr	-2048(ra) # 80001af0 <_Z4putcc>
    while (--i > 0) {
    800072f8:	fadff06f          	j	800072a4 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/100-1] = true;
    800072fc:	06400793          	li	a5,100
    80007300:	02f95933          	divu	s2,s2,a5
    80007304:	fff90913          	addi	s2,s2,-1
    80007308:	00007797          	auipc	a5,0x7
    8000730c:	eb878793          	addi	a5,a5,-328 # 8000e1c0 <_ZL8finished>
    80007310:	01278933          	add	s2,a5,s2
    80007314:	00100793          	li	a5,1
    80007318:	00f90023          	sb	a5,0(s2)
}
    8000731c:	01813083          	ld	ra,24(sp)
    80007320:	01013403          	ld	s0,16(sp)
    80007324:	00813483          	ld	s1,8(sp)
    80007328:	00013903          	ld	s2,0(sp)
    8000732c:	02010113          	addi	sp,sp,32
    80007330:	00008067          	ret

0000000080007334 <_Z12testSleepingv>:

void testSleeping() {
    80007334:	fc010113          	addi	sp,sp,-64
    80007338:	02113c23          	sd	ra,56(sp)
    8000733c:	02813823          	sd	s0,48(sp)
    80007340:	02913423          	sd	s1,40(sp)
    80007344:	04010413          	addi	s0,sp,64
    printString("Starting...\n");
    80007348:	00004517          	auipc	a0,0x4
    8000734c:	38850513          	addi	a0,a0,904 # 8000b6d0 <CONSOLE_STATUS+0x6c0>
    80007350:	00001097          	auipc	ra,0x1
    80007354:	fe8080e7          	jalr	-24(ra) # 80008338 <_Z11printStringPKc>
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {200, 400};
    80007358:	0c800793          	li	a5,200
    8000735c:	fcf43823          	sd	a5,-48(s0)
    80007360:	19000793          	li	a5,400
    80007364:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    printString("Creating threads: ");
    80007368:	00004517          	auipc	a0,0x4
    8000736c:	37850513          	addi	a0,a0,888 # 8000b6e0 <CONSOLE_STATUS+0x6d0>
    80007370:	00001097          	auipc	ra,0x1
    80007374:	fc8080e7          	jalr	-56(ra) # 80008338 <_Z11printStringPKc>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80007378:	00000493          	li	s1,0
    8000737c:	0500006f          	j	800073cc <_Z12testSleepingv+0x98>
        printInt(i);
    80007380:	00000613          	li	a2,0
    80007384:	00a00593          	li	a1,10
    80007388:	00048513          	mv	a0,s1
    8000738c:	00001097          	auipc	ra,0x1
    80007390:	15c080e7          	jalr	348(ra) # 800084e8 <_Z8printIntiii>
        printString(" ");
    80007394:	00004517          	auipc	a0,0x4
    80007398:	36450513          	addi	a0,a0,868 # 8000b6f8 <CONSOLE_STATUS+0x6e8>
    8000739c:	00001097          	auipc	ra,0x1
    800073a0:	f9c080e7          	jalr	-100(ra) # 80008338 <_Z11printStringPKc>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800073a4:	00349793          	slli	a5,s1,0x3
    800073a8:	fd040613          	addi	a2,s0,-48
    800073ac:	00f60633          	add	a2,a2,a5
    800073b0:	00000597          	auipc	a1,0x0
    800073b4:	ed458593          	addi	a1,a1,-300 # 80007284 <_ZL9sleepyRunPv>
    800073b8:	fc040513          	addi	a0,s0,-64
    800073bc:	00f50533          	add	a0,a0,a5
    800073c0:	ffffa097          	auipc	ra,0xffffa
    800073c4:	540080e7          	jalr	1344(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800073c8:	0014849b          	addiw	s1,s1,1
    800073cc:	00100793          	li	a5,1
    800073d0:	fa97d8e3          	bge	a5,s1,80007380 <_Z12testSleepingv+0x4c>
    }
    printString("\nSuccesfully created all threads, now waiting for them to end\n");
    800073d4:	00004517          	auipc	a0,0x4
    800073d8:	32c50513          	addi	a0,a0,812 # 8000b700 <CONSOLE_STATUS+0x6f0>
    800073dc:	00001097          	auipc	ra,0x1
    800073e0:	f5c080e7          	jalr	-164(ra) # 80008338 <_Z11printStringPKc>
    800073e4:	00c0006f          	j	800073f0 <_Z12testSleepingv+0xbc>
    while (!(finished[0] && finished[1])) {thread_dispatch();}
    800073e8:	ffffa097          	auipc	ra,0xffffa
    800073ec:	5b4080e7          	jalr	1460(ra) # 8000199c <_Z15thread_dispatchv>
    800073f0:	00007797          	auipc	a5,0x7
    800073f4:	dd07c783          	lbu	a5,-560(a5) # 8000e1c0 <_ZL8finished>
    800073f8:	fe0788e3          	beqz	a5,800073e8 <_Z12testSleepingv+0xb4>
    800073fc:	00007797          	auipc	a5,0x7
    80007400:	dc57c783          	lbu	a5,-571(a5) # 8000e1c1 <_ZL8finished+0x1>
    80007404:	fe0782e3          	beqz	a5,800073e8 <_Z12testSleepingv+0xb4>
}
    80007408:	03813083          	ld	ra,56(sp)
    8000740c:	03013403          	ld	s0,48(sp)
    80007410:	02813483          	ld	s1,40(sp)
    80007414:	04010113          	addi	sp,sp,64
    80007418:	00008067          	ret

000000008000741c <_ZN9BufferCPPC1Ei>:
#include "../test_h/buffer_CPP_API.h"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000741c:	fd010113          	addi	sp,sp,-48
    80007420:	02113423          	sd	ra,40(sp)
    80007424:	02813023          	sd	s0,32(sp)
    80007428:	00913c23          	sd	s1,24(sp)
    8000742c:	01213823          	sd	s2,16(sp)
    80007430:	01313423          	sd	s3,8(sp)
    80007434:	03010413          	addi	s0,sp,48
    80007438:	00050493          	mv	s1,a0
    8000743c:	00058913          	mv	s2,a1
    80007440:	0015879b          	addiw	a5,a1,1
    80007444:	0007851b          	sext.w	a0,a5
    80007448:	00f4a023          	sw	a5,0(s1)
    8000744c:	0004a823          	sw	zero,16(s1)
    80007450:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80007454:	00251513          	slli	a0,a0,0x2
    80007458:	ffffa097          	auipc	ra,0xffffa
    8000745c:	44c080e7          	jalr	1100(ra) # 800018a4 <_Z9mem_allocm>
    80007460:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80007464:	01000513          	li	a0,16
    80007468:	ffffa097          	auipc	ra,0xffffa
    8000746c:	d54080e7          	jalr	-684(ra) # 800011bc <_Znwm>
    80007470:	00050993          	mv	s3,a0
    80007474:	00000593          	li	a1,0
    80007478:	ffffa097          	auipc	ra,0xffffa
    8000747c:	f5c080e7          	jalr	-164(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80007480:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80007484:	01000513          	li	a0,16
    80007488:	ffffa097          	auipc	ra,0xffffa
    8000748c:	d34080e7          	jalr	-716(ra) # 800011bc <_Znwm>
    80007490:	00050993          	mv	s3,a0
    80007494:	00090593          	mv	a1,s2
    80007498:	ffffa097          	auipc	ra,0xffffa
    8000749c:	f3c080e7          	jalr	-196(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800074a0:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800074a4:	01000513          	li	a0,16
    800074a8:	ffffa097          	auipc	ra,0xffffa
    800074ac:	d14080e7          	jalr	-748(ra) # 800011bc <_Znwm>
    800074b0:	00050913          	mv	s2,a0
    800074b4:	00100593          	li	a1,1
    800074b8:	ffffa097          	auipc	ra,0xffffa
    800074bc:	f1c080e7          	jalr	-228(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800074c0:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800074c4:	01000513          	li	a0,16
    800074c8:	ffffa097          	auipc	ra,0xffffa
    800074cc:	cf4080e7          	jalr	-780(ra) # 800011bc <_Znwm>
    800074d0:	00050913          	mv	s2,a0
    800074d4:	00100593          	li	a1,1
    800074d8:	ffffa097          	auipc	ra,0xffffa
    800074dc:	efc080e7          	jalr	-260(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800074e0:	0324b823          	sd	s2,48(s1)
}
    800074e4:	02813083          	ld	ra,40(sp)
    800074e8:	02013403          	ld	s0,32(sp)
    800074ec:	01813483          	ld	s1,24(sp)
    800074f0:	01013903          	ld	s2,16(sp)
    800074f4:	00813983          	ld	s3,8(sp)
    800074f8:	03010113          	addi	sp,sp,48
    800074fc:	00008067          	ret
    80007500:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80007504:	00098513          	mv	a0,s3
    80007508:	ffffa097          	auipc	ra,0xffffa
    8000750c:	cdc080e7          	jalr	-804(ra) # 800011e4 <_ZdlPv>
    80007510:	00048513          	mv	a0,s1
    80007514:	00008097          	auipc	ra,0x8
    80007518:	d94080e7          	jalr	-620(ra) # 8000f2a8 <_Unwind_Resume>
    8000751c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80007520:	00098513          	mv	a0,s3
    80007524:	ffffa097          	auipc	ra,0xffffa
    80007528:	cc0080e7          	jalr	-832(ra) # 800011e4 <_ZdlPv>
    8000752c:	00048513          	mv	a0,s1
    80007530:	00008097          	auipc	ra,0x8
    80007534:	d78080e7          	jalr	-648(ra) # 8000f2a8 <_Unwind_Resume>
    80007538:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    8000753c:	00090513          	mv	a0,s2
    80007540:	ffffa097          	auipc	ra,0xffffa
    80007544:	ca4080e7          	jalr	-860(ra) # 800011e4 <_ZdlPv>
    80007548:	00048513          	mv	a0,s1
    8000754c:	00008097          	auipc	ra,0x8
    80007550:	d5c080e7          	jalr	-676(ra) # 8000f2a8 <_Unwind_Resume>
    80007554:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80007558:	00090513          	mv	a0,s2
    8000755c:	ffffa097          	auipc	ra,0xffffa
    80007560:	c88080e7          	jalr	-888(ra) # 800011e4 <_ZdlPv>
    80007564:	00048513          	mv	a0,s1
    80007568:	00008097          	auipc	ra,0x8
    8000756c:	d40080e7          	jalr	-704(ra) # 8000f2a8 <_Unwind_Resume>

0000000080007570 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80007570:	fe010113          	addi	sp,sp,-32
    80007574:	00113c23          	sd	ra,24(sp)
    80007578:	00813823          	sd	s0,16(sp)
    8000757c:	00913423          	sd	s1,8(sp)
    80007580:	01213023          	sd	s2,0(sp)
    80007584:	02010413          	addi	s0,sp,32
    80007588:	00050493          	mv	s1,a0
    8000758c:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80007590:	01853503          	ld	a0,24(a0)
    80007594:	ffffa097          	auipc	ra,0xffffa
    80007598:	e78080e7          	jalr	-392(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    8000759c:	0304b503          	ld	a0,48(s1)
    800075a0:	ffffa097          	auipc	ra,0xffffa
    800075a4:	e6c080e7          	jalr	-404(ra) # 8000140c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800075a8:	0084b783          	ld	a5,8(s1)
    800075ac:	0144a703          	lw	a4,20(s1)
    800075b0:	00271713          	slli	a4,a4,0x2
    800075b4:	00e787b3          	add	a5,a5,a4
    800075b8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800075bc:	0144a783          	lw	a5,20(s1)
    800075c0:	0017879b          	addiw	a5,a5,1
    800075c4:	0004a703          	lw	a4,0(s1)
    800075c8:	02e7e7bb          	remw	a5,a5,a4
    800075cc:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800075d0:	0304b503          	ld	a0,48(s1)
    800075d4:	ffffa097          	auipc	ra,0xffffa
    800075d8:	e64080e7          	jalr	-412(ra) # 80001438 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    800075dc:	0204b503          	ld	a0,32(s1)
    800075e0:	ffffa097          	auipc	ra,0xffffa
    800075e4:	e58080e7          	jalr	-424(ra) # 80001438 <_ZN9Semaphore6signalEv>

}
    800075e8:	01813083          	ld	ra,24(sp)
    800075ec:	01013403          	ld	s0,16(sp)
    800075f0:	00813483          	ld	s1,8(sp)
    800075f4:	00013903          	ld	s2,0(sp)
    800075f8:	02010113          	addi	sp,sp,32
    800075fc:	00008067          	ret

0000000080007600 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80007600:	fe010113          	addi	sp,sp,-32
    80007604:	00113c23          	sd	ra,24(sp)
    80007608:	00813823          	sd	s0,16(sp)
    8000760c:	00913423          	sd	s1,8(sp)
    80007610:	01213023          	sd	s2,0(sp)
    80007614:	02010413          	addi	s0,sp,32
    80007618:	00050493          	mv	s1,a0
    itemAvailable->wait();
    8000761c:	02053503          	ld	a0,32(a0)
    80007620:	ffffa097          	auipc	ra,0xffffa
    80007624:	dec080e7          	jalr	-532(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80007628:	0284b503          	ld	a0,40(s1)
    8000762c:	ffffa097          	auipc	ra,0xffffa
    80007630:	de0080e7          	jalr	-544(ra) # 8000140c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80007634:	0084b703          	ld	a4,8(s1)
    80007638:	0104a783          	lw	a5,16(s1)
    8000763c:	00279693          	slli	a3,a5,0x2
    80007640:	00d70733          	add	a4,a4,a3
    80007644:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80007648:	0017879b          	addiw	a5,a5,1
    8000764c:	0004a703          	lw	a4,0(s1)
    80007650:	02e7e7bb          	remw	a5,a5,a4
    80007654:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80007658:	0284b503          	ld	a0,40(s1)
    8000765c:	ffffa097          	auipc	ra,0xffffa
    80007660:	ddc080e7          	jalr	-548(ra) # 80001438 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80007664:	0184b503          	ld	a0,24(s1)
    80007668:	ffffa097          	auipc	ra,0xffffa
    8000766c:	dd0080e7          	jalr	-560(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    80007670:	00090513          	mv	a0,s2
    80007674:	01813083          	ld	ra,24(sp)
    80007678:	01013403          	ld	s0,16(sp)
    8000767c:	00813483          	ld	s1,8(sp)
    80007680:	00013903          	ld	s2,0(sp)
    80007684:	02010113          	addi	sp,sp,32
    80007688:	00008067          	ret

000000008000768c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    8000768c:	fe010113          	addi	sp,sp,-32
    80007690:	00113c23          	sd	ra,24(sp)
    80007694:	00813823          	sd	s0,16(sp)
    80007698:	00913423          	sd	s1,8(sp)
    8000769c:	01213023          	sd	s2,0(sp)
    800076a0:	02010413          	addi	s0,sp,32
    800076a4:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800076a8:	02853503          	ld	a0,40(a0)
    800076ac:	ffffa097          	auipc	ra,0xffffa
    800076b0:	d60080e7          	jalr	-672(ra) # 8000140c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800076b4:	0304b503          	ld	a0,48(s1)
    800076b8:	ffffa097          	auipc	ra,0xffffa
    800076bc:	d54080e7          	jalr	-684(ra) # 8000140c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800076c0:	0144a783          	lw	a5,20(s1)
    800076c4:	0104a903          	lw	s2,16(s1)
    800076c8:	0327ce63          	blt	a5,s2,80007704 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800076cc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800076d0:	0304b503          	ld	a0,48(s1)
    800076d4:	ffffa097          	auipc	ra,0xffffa
    800076d8:	d64080e7          	jalr	-668(ra) # 80001438 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    800076dc:	0284b503          	ld	a0,40(s1)
    800076e0:	ffffa097          	auipc	ra,0xffffa
    800076e4:	d58080e7          	jalr	-680(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    800076e8:	00090513          	mv	a0,s2
    800076ec:	01813083          	ld	ra,24(sp)
    800076f0:	01013403          	ld	s0,16(sp)
    800076f4:	00813483          	ld	s1,8(sp)
    800076f8:	00013903          	ld	s2,0(sp)
    800076fc:	02010113          	addi	sp,sp,32
    80007700:	00008067          	ret
        ret = cap - head + tail;
    80007704:	0004a703          	lw	a4,0(s1)
    80007708:	4127093b          	subw	s2,a4,s2
    8000770c:	00f9093b          	addw	s2,s2,a5
    80007710:	fc1ff06f          	j	800076d0 <_ZN9BufferCPP6getCntEv+0x44>

0000000080007714 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80007714:	fe010113          	addi	sp,sp,-32
    80007718:	00113c23          	sd	ra,24(sp)
    8000771c:	00813823          	sd	s0,16(sp)
    80007720:	00913423          	sd	s1,8(sp)
    80007724:	02010413          	addi	s0,sp,32
    80007728:	00050493          	mv	s1,a0
    Console::putc('\n');
    8000772c:	00a00513          	li	a0,10
    80007730:	ffffa097          	auipc	ra,0xffffa
    80007734:	da4080e7          	jalr	-604(ra) # 800014d4 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80007738:	00004517          	auipc	a0,0x4
    8000773c:	d8050513          	addi	a0,a0,-640 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    80007740:	00001097          	auipc	ra,0x1
    80007744:	bf8080e7          	jalr	-1032(ra) # 80008338 <_Z11printStringPKc>
    while (getCnt()) {
    80007748:	00048513          	mv	a0,s1
    8000774c:	00000097          	auipc	ra,0x0
    80007750:	f40080e7          	jalr	-192(ra) # 8000768c <_ZN9BufferCPP6getCntEv>
    80007754:	02050c63          	beqz	a0,8000778c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80007758:	0084b783          	ld	a5,8(s1)
    8000775c:	0104a703          	lw	a4,16(s1)
    80007760:	00271713          	slli	a4,a4,0x2
    80007764:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80007768:	0007c503          	lbu	a0,0(a5)
    8000776c:	ffffa097          	auipc	ra,0xffffa
    80007770:	d68080e7          	jalr	-664(ra) # 800014d4 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80007774:	0104a783          	lw	a5,16(s1)
    80007778:	0017879b          	addiw	a5,a5,1
    8000777c:	0004a703          	lw	a4,0(s1)
    80007780:	02e7e7bb          	remw	a5,a5,a4
    80007784:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80007788:	fc1ff06f          	j	80007748 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    8000778c:	02100513          	li	a0,33
    80007790:	ffffa097          	auipc	ra,0xffffa
    80007794:	d44080e7          	jalr	-700(ra) # 800014d4 <_ZN7Console4putcEc>
    Console::putc('\n');
    80007798:	00a00513          	li	a0,10
    8000779c:	ffffa097          	auipc	ra,0xffffa
    800077a0:	d38080e7          	jalr	-712(ra) # 800014d4 <_ZN7Console4putcEc>
    mem_free(buffer);
    800077a4:	0084b503          	ld	a0,8(s1)
    800077a8:	ffffa097          	auipc	ra,0xffffa
    800077ac:	12c080e7          	jalr	300(ra) # 800018d4 <_Z8mem_freePv>
    delete itemAvailable;
    800077b0:	0204b503          	ld	a0,32(s1)
    800077b4:	00050863          	beqz	a0,800077c4 <_ZN9BufferCPPD1Ev+0xb0>
    800077b8:	00053783          	ld	a5,0(a0)
    800077bc:	0087b783          	ld	a5,8(a5)
    800077c0:	000780e7          	jalr	a5
    delete spaceAvailable;
    800077c4:	0184b503          	ld	a0,24(s1)
    800077c8:	00050863          	beqz	a0,800077d8 <_ZN9BufferCPPD1Ev+0xc4>
    800077cc:	00053783          	ld	a5,0(a0)
    800077d0:	0087b783          	ld	a5,8(a5)
    800077d4:	000780e7          	jalr	a5
    delete mutexTail;
    800077d8:	0304b503          	ld	a0,48(s1)
    800077dc:	00050863          	beqz	a0,800077ec <_ZN9BufferCPPD1Ev+0xd8>
    800077e0:	00053783          	ld	a5,0(a0)
    800077e4:	0087b783          	ld	a5,8(a5)
    800077e8:	000780e7          	jalr	a5
    delete mutexHead;
    800077ec:	0284b503          	ld	a0,40(s1)
    800077f0:	00050863          	beqz	a0,80007800 <_ZN9BufferCPPD1Ev+0xec>
    800077f4:	00053783          	ld	a5,0(a0)
    800077f8:	0087b783          	ld	a5,8(a5)
    800077fc:	000780e7          	jalr	a5
}
    80007800:	01813083          	ld	ra,24(sp)
    80007804:	01013403          	ld	s0,16(sp)
    80007808:	00813483          	ld	s1,8(sp)
    8000780c:	02010113          	addi	sp,sp,32
    80007810:	00008067          	ret

0000000080007814 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80007814:	fe010113          	addi	sp,sp,-32
    80007818:	00113c23          	sd	ra,24(sp)
    8000781c:	00813823          	sd	s0,16(sp)
    80007820:	00913423          	sd	s1,8(sp)
    80007824:	01213023          	sd	s2,0(sp)
    80007828:	02010413          	addi	s0,sp,32
    8000782c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80007830:	00100793          	li	a5,1
    80007834:	02a7f863          	bgeu	a5,a0,80007864 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80007838:	00a00793          	li	a5,10
    8000783c:	02f577b3          	remu	a5,a0,a5
    80007840:	02078e63          	beqz	a5,8000787c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80007844:	fff48513          	addi	a0,s1,-1
    80007848:	00000097          	auipc	ra,0x0
    8000784c:	fcc080e7          	jalr	-52(ra) # 80007814 <_ZL9fibonaccim>
    80007850:	00050913          	mv	s2,a0
    80007854:	ffe48513          	addi	a0,s1,-2
    80007858:	00000097          	auipc	ra,0x0
    8000785c:	fbc080e7          	jalr	-68(ra) # 80007814 <_ZL9fibonaccim>
    80007860:	00a90533          	add	a0,s2,a0
}
    80007864:	01813083          	ld	ra,24(sp)
    80007868:	01013403          	ld	s0,16(sp)
    8000786c:	00813483          	ld	s1,8(sp)
    80007870:	00013903          	ld	s2,0(sp)
    80007874:	02010113          	addi	sp,sp,32
    80007878:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000787c:	ffffa097          	auipc	ra,0xffffa
    80007880:	120080e7          	jalr	288(ra) # 8000199c <_Z15thread_dispatchv>
    80007884:	fc1ff06f          	j	80007844 <_ZL9fibonaccim+0x30>

0000000080007888 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80007888:	fe010113          	addi	sp,sp,-32
    8000788c:	00113c23          	sd	ra,24(sp)
    80007890:	00813823          	sd	s0,16(sp)
    80007894:	00913423          	sd	s1,8(sp)
    80007898:	01213023          	sd	s2,0(sp)
    8000789c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800078a0:	00000913          	li	s2,0
    800078a4:	0380006f          	j	800078dc <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800078a8:	ffffa097          	auipc	ra,0xffffa
    800078ac:	0f4080e7          	jalr	244(ra) # 8000199c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800078b0:	00148493          	addi	s1,s1,1
    800078b4:	000027b7          	lui	a5,0x2
    800078b8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800078bc:	0097ee63          	bltu	a5,s1,800078d8 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800078c0:	00000713          	li	a4,0
    800078c4:	000077b7          	lui	a5,0x7
    800078c8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800078cc:	fce7eee3          	bltu	a5,a4,800078a8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800078d0:	00170713          	addi	a4,a4,1
    800078d4:	ff1ff06f          	j	800078c4 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800078d8:	00190913          	addi	s2,s2,1
    800078dc:	00900793          	li	a5,9
    800078e0:	0527e063          	bltu	a5,s2,80007920 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800078e4:	00004517          	auipc	a0,0x4
    800078e8:	d6450513          	addi	a0,a0,-668 # 8000b648 <CONSOLE_STATUS+0x638>
    800078ec:	00001097          	auipc	ra,0x1
    800078f0:	a4c080e7          	jalr	-1460(ra) # 80008338 <_Z11printStringPKc>
    800078f4:	00000613          	li	a2,0
    800078f8:	00a00593          	li	a1,10
    800078fc:	0009051b          	sext.w	a0,s2
    80007900:	00001097          	auipc	ra,0x1
    80007904:	be8080e7          	jalr	-1048(ra) # 800084e8 <_Z8printIntiii>
    80007908:	00004517          	auipc	a0,0x4
    8000790c:	f7850513          	addi	a0,a0,-136 # 8000b880 <CONSOLE_STATUS+0x870>
    80007910:	00001097          	auipc	ra,0x1
    80007914:	a28080e7          	jalr	-1496(ra) # 80008338 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80007918:	00000493          	li	s1,0
    8000791c:	f99ff06f          	j	800078b4 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80007920:	00004517          	auipc	a0,0x4
    80007924:	d3050513          	addi	a0,a0,-720 # 8000b650 <CONSOLE_STATUS+0x640>
    80007928:	00001097          	auipc	ra,0x1
    8000792c:	a10080e7          	jalr	-1520(ra) # 80008338 <_Z11printStringPKc>
    finishedA = true;
    80007930:	00100793          	li	a5,1
    80007934:	00007717          	auipc	a4,0x7
    80007938:	88f70723          	sb	a5,-1906(a4) # 8000e1c2 <_ZL9finishedA>
}
    8000793c:	01813083          	ld	ra,24(sp)
    80007940:	01013403          	ld	s0,16(sp)
    80007944:	00813483          	ld	s1,8(sp)
    80007948:	00013903          	ld	s2,0(sp)
    8000794c:	02010113          	addi	sp,sp,32
    80007950:	00008067          	ret

0000000080007954 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80007954:	fe010113          	addi	sp,sp,-32
    80007958:	00113c23          	sd	ra,24(sp)
    8000795c:	00813823          	sd	s0,16(sp)
    80007960:	00913423          	sd	s1,8(sp)
    80007964:	01213023          	sd	s2,0(sp)
    80007968:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000796c:	00000913          	li	s2,0
    80007970:	0380006f          	j	800079a8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80007974:	ffffa097          	auipc	ra,0xffffa
    80007978:	028080e7          	jalr	40(ra) # 8000199c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000797c:	00148493          	addi	s1,s1,1
    80007980:	000027b7          	lui	a5,0x2
    80007984:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80007988:	0097ee63          	bltu	a5,s1,800079a4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000798c:	00000713          	li	a4,0
    80007990:	000077b7          	lui	a5,0x7
    80007994:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80007998:	fce7eee3          	bltu	a5,a4,80007974 <_ZN7WorkerB11workerBodyBEPv+0x20>
    8000799c:	00170713          	addi	a4,a4,1
    800079a0:	ff1ff06f          	j	80007990 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800079a4:	00190913          	addi	s2,s2,1
    800079a8:	00f00793          	li	a5,15
    800079ac:	0527e063          	bltu	a5,s2,800079ec <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800079b0:	00004517          	auipc	a0,0x4
    800079b4:	c8050513          	addi	a0,a0,-896 # 8000b630 <CONSOLE_STATUS+0x620>
    800079b8:	00001097          	auipc	ra,0x1
    800079bc:	980080e7          	jalr	-1664(ra) # 80008338 <_Z11printStringPKc>
    800079c0:	00000613          	li	a2,0
    800079c4:	00a00593          	li	a1,10
    800079c8:	0009051b          	sext.w	a0,s2
    800079cc:	00001097          	auipc	ra,0x1
    800079d0:	b1c080e7          	jalr	-1252(ra) # 800084e8 <_Z8printIntiii>
    800079d4:	00004517          	auipc	a0,0x4
    800079d8:	eac50513          	addi	a0,a0,-340 # 8000b880 <CONSOLE_STATUS+0x870>
    800079dc:	00001097          	auipc	ra,0x1
    800079e0:	95c080e7          	jalr	-1700(ra) # 80008338 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800079e4:	00000493          	li	s1,0
    800079e8:	f99ff06f          	j	80007980 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800079ec:	00004517          	auipc	a0,0x4
    800079f0:	c4c50513          	addi	a0,a0,-948 # 8000b638 <CONSOLE_STATUS+0x628>
    800079f4:	00001097          	auipc	ra,0x1
    800079f8:	944080e7          	jalr	-1724(ra) # 80008338 <_Z11printStringPKc>
    finishedB = true;
    800079fc:	00100793          	li	a5,1
    80007a00:	00006717          	auipc	a4,0x6
    80007a04:	7cf701a3          	sb	a5,1987(a4) # 8000e1c3 <_ZL9finishedB>
    thread_dispatch();
    80007a08:	ffffa097          	auipc	ra,0xffffa
    80007a0c:	f94080e7          	jalr	-108(ra) # 8000199c <_Z15thread_dispatchv>
}
    80007a10:	01813083          	ld	ra,24(sp)
    80007a14:	01013403          	ld	s0,16(sp)
    80007a18:	00813483          	ld	s1,8(sp)
    80007a1c:	00013903          	ld	s2,0(sp)
    80007a20:	02010113          	addi	sp,sp,32
    80007a24:	00008067          	ret

0000000080007a28 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80007a28:	fe010113          	addi	sp,sp,-32
    80007a2c:	00113c23          	sd	ra,24(sp)
    80007a30:	00813823          	sd	s0,16(sp)
    80007a34:	00913423          	sd	s1,8(sp)
    80007a38:	01213023          	sd	s2,0(sp)
    80007a3c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80007a40:	00000493          	li	s1,0
    80007a44:	0400006f          	j	80007a84 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80007a48:	00004517          	auipc	a0,0x4
    80007a4c:	ba850513          	addi	a0,a0,-1112 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    80007a50:	00001097          	auipc	ra,0x1
    80007a54:	8e8080e7          	jalr	-1816(ra) # 80008338 <_Z11printStringPKc>
    80007a58:	00000613          	li	a2,0
    80007a5c:	00a00593          	li	a1,10
    80007a60:	00048513          	mv	a0,s1
    80007a64:	00001097          	auipc	ra,0x1
    80007a68:	a84080e7          	jalr	-1404(ra) # 800084e8 <_Z8printIntiii>
    80007a6c:	00004517          	auipc	a0,0x4
    80007a70:	e1450513          	addi	a0,a0,-492 # 8000b880 <CONSOLE_STATUS+0x870>
    80007a74:	00001097          	auipc	ra,0x1
    80007a78:	8c4080e7          	jalr	-1852(ra) # 80008338 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80007a7c:	0014849b          	addiw	s1,s1,1
    80007a80:	0ff4f493          	andi	s1,s1,255
    80007a84:	00200793          	li	a5,2
    80007a88:	fc97f0e3          	bgeu	a5,s1,80007a48 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80007a8c:	00004517          	auipc	a0,0x4
    80007a90:	b6c50513          	addi	a0,a0,-1172 # 8000b5f8 <CONSOLE_STATUS+0x5e8>
    80007a94:	00001097          	auipc	ra,0x1
    80007a98:	8a4080e7          	jalr	-1884(ra) # 80008338 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80007a9c:	00700313          	li	t1,7
    thread_dispatch();
    80007aa0:	ffffa097          	auipc	ra,0xffffa
    80007aa4:	efc080e7          	jalr	-260(ra) # 8000199c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80007aa8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80007aac:	00004517          	auipc	a0,0x4
    80007ab0:	b5c50513          	addi	a0,a0,-1188 # 8000b608 <CONSOLE_STATUS+0x5f8>
    80007ab4:	00001097          	auipc	ra,0x1
    80007ab8:	884080e7          	jalr	-1916(ra) # 80008338 <_Z11printStringPKc>
    80007abc:	00000613          	li	a2,0
    80007ac0:	00a00593          	li	a1,10
    80007ac4:	0009051b          	sext.w	a0,s2
    80007ac8:	00001097          	auipc	ra,0x1
    80007acc:	a20080e7          	jalr	-1504(ra) # 800084e8 <_Z8printIntiii>
    80007ad0:	00004517          	auipc	a0,0x4
    80007ad4:	db050513          	addi	a0,a0,-592 # 8000b880 <CONSOLE_STATUS+0x870>
    80007ad8:	00001097          	auipc	ra,0x1
    80007adc:	860080e7          	jalr	-1952(ra) # 80008338 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80007ae0:	00c00513          	li	a0,12
    80007ae4:	00000097          	auipc	ra,0x0
    80007ae8:	d30080e7          	jalr	-720(ra) # 80007814 <_ZL9fibonaccim>
    80007aec:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80007af0:	00004517          	auipc	a0,0x4
    80007af4:	b2050513          	addi	a0,a0,-1248 # 8000b610 <CONSOLE_STATUS+0x600>
    80007af8:	00001097          	auipc	ra,0x1
    80007afc:	840080e7          	jalr	-1984(ra) # 80008338 <_Z11printStringPKc>
    80007b00:	00000613          	li	a2,0
    80007b04:	00a00593          	li	a1,10
    80007b08:	0009051b          	sext.w	a0,s2
    80007b0c:	00001097          	auipc	ra,0x1
    80007b10:	9dc080e7          	jalr	-1572(ra) # 800084e8 <_Z8printIntiii>
    80007b14:	00004517          	auipc	a0,0x4
    80007b18:	d6c50513          	addi	a0,a0,-660 # 8000b880 <CONSOLE_STATUS+0x870>
    80007b1c:	00001097          	auipc	ra,0x1
    80007b20:	81c080e7          	jalr	-2020(ra) # 80008338 <_Z11printStringPKc>
    80007b24:	0400006f          	j	80007b64 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80007b28:	00004517          	auipc	a0,0x4
    80007b2c:	ac850513          	addi	a0,a0,-1336 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    80007b30:	00001097          	auipc	ra,0x1
    80007b34:	808080e7          	jalr	-2040(ra) # 80008338 <_Z11printStringPKc>
    80007b38:	00000613          	li	a2,0
    80007b3c:	00a00593          	li	a1,10
    80007b40:	00048513          	mv	a0,s1
    80007b44:	00001097          	auipc	ra,0x1
    80007b48:	9a4080e7          	jalr	-1628(ra) # 800084e8 <_Z8printIntiii>
    80007b4c:	00004517          	auipc	a0,0x4
    80007b50:	d3450513          	addi	a0,a0,-716 # 8000b880 <CONSOLE_STATUS+0x870>
    80007b54:	00000097          	auipc	ra,0x0
    80007b58:	7e4080e7          	jalr	2020(ra) # 80008338 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80007b5c:	0014849b          	addiw	s1,s1,1
    80007b60:	0ff4f493          	andi	s1,s1,255
    80007b64:	00500793          	li	a5,5
    80007b68:	fc97f0e3          	bgeu	a5,s1,80007b28 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80007b6c:	00004517          	auipc	a0,0x4
    80007b70:	ae450513          	addi	a0,a0,-1308 # 8000b650 <CONSOLE_STATUS+0x640>
    80007b74:	00000097          	auipc	ra,0x0
    80007b78:	7c4080e7          	jalr	1988(ra) # 80008338 <_Z11printStringPKc>
    finishedC = true;
    80007b7c:	00100793          	li	a5,1
    80007b80:	00006717          	auipc	a4,0x6
    80007b84:	64f70223          	sb	a5,1604(a4) # 8000e1c4 <_ZL9finishedC>
    thread_dispatch();
    80007b88:	ffffa097          	auipc	ra,0xffffa
    80007b8c:	e14080e7          	jalr	-492(ra) # 8000199c <_Z15thread_dispatchv>
}
    80007b90:	01813083          	ld	ra,24(sp)
    80007b94:	01013403          	ld	s0,16(sp)
    80007b98:	00813483          	ld	s1,8(sp)
    80007b9c:	00013903          	ld	s2,0(sp)
    80007ba0:	02010113          	addi	sp,sp,32
    80007ba4:	00008067          	ret

0000000080007ba8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80007ba8:	fe010113          	addi	sp,sp,-32
    80007bac:	00113c23          	sd	ra,24(sp)
    80007bb0:	00813823          	sd	s0,16(sp)
    80007bb4:	00913423          	sd	s1,8(sp)
    80007bb8:	01213023          	sd	s2,0(sp)
    80007bbc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80007bc0:	00a00493          	li	s1,10
    80007bc4:	0400006f          	j	80007c04 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80007bc8:	00004517          	auipc	a0,0x4
    80007bcc:	9f050513          	addi	a0,a0,-1552 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80007bd0:	00000097          	auipc	ra,0x0
    80007bd4:	768080e7          	jalr	1896(ra) # 80008338 <_Z11printStringPKc>
    80007bd8:	00000613          	li	a2,0
    80007bdc:	00a00593          	li	a1,10
    80007be0:	00048513          	mv	a0,s1
    80007be4:	00001097          	auipc	ra,0x1
    80007be8:	904080e7          	jalr	-1788(ra) # 800084e8 <_Z8printIntiii>
    80007bec:	00004517          	auipc	a0,0x4
    80007bf0:	c9450513          	addi	a0,a0,-876 # 8000b880 <CONSOLE_STATUS+0x870>
    80007bf4:	00000097          	auipc	ra,0x0
    80007bf8:	744080e7          	jalr	1860(ra) # 80008338 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80007bfc:	0014849b          	addiw	s1,s1,1
    80007c00:	0ff4f493          	andi	s1,s1,255
    80007c04:	00c00793          	li	a5,12
    80007c08:	fc97f0e3          	bgeu	a5,s1,80007bc8 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80007c0c:	00004517          	auipc	a0,0x4
    80007c10:	9b450513          	addi	a0,a0,-1612 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80007c14:	00000097          	auipc	ra,0x0
    80007c18:	724080e7          	jalr	1828(ra) # 80008338 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80007c1c:	00500313          	li	t1,5
    thread_dispatch();
    80007c20:	ffffa097          	auipc	ra,0xffffa
    80007c24:	d7c080e7          	jalr	-644(ra) # 8000199c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80007c28:	01000513          	li	a0,16
    80007c2c:	00000097          	auipc	ra,0x0
    80007c30:	be8080e7          	jalr	-1048(ra) # 80007814 <_ZL9fibonaccim>
    80007c34:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80007c38:	00004517          	auipc	a0,0x4
    80007c3c:	99850513          	addi	a0,a0,-1640 # 8000b5d0 <CONSOLE_STATUS+0x5c0>
    80007c40:	00000097          	auipc	ra,0x0
    80007c44:	6f8080e7          	jalr	1784(ra) # 80008338 <_Z11printStringPKc>
    80007c48:	00000613          	li	a2,0
    80007c4c:	00a00593          	li	a1,10
    80007c50:	0009051b          	sext.w	a0,s2
    80007c54:	00001097          	auipc	ra,0x1
    80007c58:	894080e7          	jalr	-1900(ra) # 800084e8 <_Z8printIntiii>
    80007c5c:	00004517          	auipc	a0,0x4
    80007c60:	c2450513          	addi	a0,a0,-988 # 8000b880 <CONSOLE_STATUS+0x870>
    80007c64:	00000097          	auipc	ra,0x0
    80007c68:	6d4080e7          	jalr	1748(ra) # 80008338 <_Z11printStringPKc>
    80007c6c:	0400006f          	j	80007cac <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80007c70:	00004517          	auipc	a0,0x4
    80007c74:	94850513          	addi	a0,a0,-1720 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80007c78:	00000097          	auipc	ra,0x0
    80007c7c:	6c0080e7          	jalr	1728(ra) # 80008338 <_Z11printStringPKc>
    80007c80:	00000613          	li	a2,0
    80007c84:	00a00593          	li	a1,10
    80007c88:	00048513          	mv	a0,s1
    80007c8c:	00001097          	auipc	ra,0x1
    80007c90:	85c080e7          	jalr	-1956(ra) # 800084e8 <_Z8printIntiii>
    80007c94:	00004517          	auipc	a0,0x4
    80007c98:	bec50513          	addi	a0,a0,-1044 # 8000b880 <CONSOLE_STATUS+0x870>
    80007c9c:	00000097          	auipc	ra,0x0
    80007ca0:	69c080e7          	jalr	1692(ra) # 80008338 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80007ca4:	0014849b          	addiw	s1,s1,1
    80007ca8:	0ff4f493          	andi	s1,s1,255
    80007cac:	00f00793          	li	a5,15
    80007cb0:	fc97f0e3          	bgeu	a5,s1,80007c70 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80007cb4:	00004517          	auipc	a0,0x4
    80007cb8:	92c50513          	addi	a0,a0,-1748 # 8000b5e0 <CONSOLE_STATUS+0x5d0>
    80007cbc:	00000097          	auipc	ra,0x0
    80007cc0:	67c080e7          	jalr	1660(ra) # 80008338 <_Z11printStringPKc>
    finishedD = true;
    80007cc4:	00100793          	li	a5,1
    80007cc8:	00006717          	auipc	a4,0x6
    80007ccc:	4ef70ea3          	sb	a5,1277(a4) # 8000e1c5 <_ZL9finishedD>
    thread_dispatch();
    80007cd0:	ffffa097          	auipc	ra,0xffffa
    80007cd4:	ccc080e7          	jalr	-820(ra) # 8000199c <_Z15thread_dispatchv>
}
    80007cd8:	01813083          	ld	ra,24(sp)
    80007cdc:	01013403          	ld	s0,16(sp)
    80007ce0:	00813483          	ld	s1,8(sp)
    80007ce4:	00013903          	ld	s2,0(sp)
    80007ce8:	02010113          	addi	sp,sp,32
    80007cec:	00008067          	ret

0000000080007cf0 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80007cf0:	fc010113          	addi	sp,sp,-64
    80007cf4:	02113c23          	sd	ra,56(sp)
    80007cf8:	02813823          	sd	s0,48(sp)
    80007cfc:	02913423          	sd	s1,40(sp)
    80007d00:	03213023          	sd	s2,32(sp)
    80007d04:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80007d08:	02000513          	li	a0,32
    80007d0c:	ffff9097          	auipc	ra,0xffff9
    80007d10:	4b0080e7          	jalr	1200(ra) # 800011bc <_Znwm>
    80007d14:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80007d18:	ffff9097          	auipc	ra,0xffff9
    80007d1c:	688080e7          	jalr	1672(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007d20:	00006797          	auipc	a5,0x6
    80007d24:	27878793          	addi	a5,a5,632 # 8000df98 <_ZTV7WorkerA+0x10>
    80007d28:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80007d2c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80007d30:	00004517          	auipc	a0,0x4
    80007d34:	93050513          	addi	a0,a0,-1744 # 8000b660 <CONSOLE_STATUS+0x650>
    80007d38:	00000097          	auipc	ra,0x0
    80007d3c:	600080e7          	jalr	1536(ra) # 80008338 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80007d40:	02000513          	li	a0,32
    80007d44:	ffff9097          	auipc	ra,0xffff9
    80007d48:	478080e7          	jalr	1144(ra) # 800011bc <_Znwm>
    80007d4c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80007d50:	ffff9097          	auipc	ra,0xffff9
    80007d54:	650080e7          	jalr	1616(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007d58:	00006797          	auipc	a5,0x6
    80007d5c:	26878793          	addi	a5,a5,616 # 8000dfc0 <_ZTV7WorkerB+0x10>
    80007d60:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80007d64:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80007d68:	00004517          	auipc	a0,0x4
    80007d6c:	91050513          	addi	a0,a0,-1776 # 8000b678 <CONSOLE_STATUS+0x668>
    80007d70:	00000097          	auipc	ra,0x0
    80007d74:	5c8080e7          	jalr	1480(ra) # 80008338 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80007d78:	02000513          	li	a0,32
    80007d7c:	ffff9097          	auipc	ra,0xffff9
    80007d80:	440080e7          	jalr	1088(ra) # 800011bc <_Znwm>
    80007d84:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80007d88:	ffff9097          	auipc	ra,0xffff9
    80007d8c:	618080e7          	jalr	1560(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007d90:	00006797          	auipc	a5,0x6
    80007d94:	25878793          	addi	a5,a5,600 # 8000dfe8 <_ZTV7WorkerC+0x10>
    80007d98:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80007d9c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80007da0:	00004517          	auipc	a0,0x4
    80007da4:	8f050513          	addi	a0,a0,-1808 # 8000b690 <CONSOLE_STATUS+0x680>
    80007da8:	00000097          	auipc	ra,0x0
    80007dac:	590080e7          	jalr	1424(ra) # 80008338 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80007db0:	02000513          	li	a0,32
    80007db4:	ffff9097          	auipc	ra,0xffff9
    80007db8:	408080e7          	jalr	1032(ra) # 800011bc <_Znwm>
    80007dbc:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80007dc0:	ffff9097          	auipc	ra,0xffff9
    80007dc4:	5e0080e7          	jalr	1504(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007dc8:	00006797          	auipc	a5,0x6
    80007dcc:	24878793          	addi	a5,a5,584 # 8000e010 <_ZTV7WorkerD+0x10>
    80007dd0:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80007dd4:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80007dd8:	00004517          	auipc	a0,0x4
    80007ddc:	8d050513          	addi	a0,a0,-1840 # 8000b6a8 <CONSOLE_STATUS+0x698>
    80007de0:	00000097          	auipc	ra,0x0
    80007de4:	558080e7          	jalr	1368(ra) # 80008338 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80007de8:	00000493          	li	s1,0
    80007dec:	00300793          	li	a5,3
    80007df0:	0297c663          	blt	a5,s1,80007e1c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80007df4:	00349793          	slli	a5,s1,0x3
    80007df8:	fe040713          	addi	a4,s0,-32
    80007dfc:	00f707b3          	add	a5,a4,a5
    80007e00:	fe07b503          	ld	a0,-32(a5)
    80007e04:	ffff9097          	auipc	ra,0xffff9
    80007e08:	4b4080e7          	jalr	1204(ra) # 800012b8 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80007e0c:	0014849b          	addiw	s1,s1,1
    80007e10:	fddff06f          	j	80007dec <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80007e14:	ffff9097          	auipc	ra,0xffff9
    80007e18:	504080e7          	jalr	1284(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80007e1c:	00006797          	auipc	a5,0x6
    80007e20:	3a67c783          	lbu	a5,934(a5) # 8000e1c2 <_ZL9finishedA>
    80007e24:	fe0788e3          	beqz	a5,80007e14 <_Z20Threads_CPP_API_testv+0x124>
    80007e28:	00006797          	auipc	a5,0x6
    80007e2c:	39b7c783          	lbu	a5,923(a5) # 8000e1c3 <_ZL9finishedB>
    80007e30:	fe0782e3          	beqz	a5,80007e14 <_Z20Threads_CPP_API_testv+0x124>
    80007e34:	00006797          	auipc	a5,0x6
    80007e38:	3907c783          	lbu	a5,912(a5) # 8000e1c4 <_ZL9finishedC>
    80007e3c:	fc078ce3          	beqz	a5,80007e14 <_Z20Threads_CPP_API_testv+0x124>
    80007e40:	00006797          	auipc	a5,0x6
    80007e44:	3857c783          	lbu	a5,901(a5) # 8000e1c5 <_ZL9finishedD>
    80007e48:	fc0786e3          	beqz	a5,80007e14 <_Z20Threads_CPP_API_testv+0x124>
    80007e4c:	fc040493          	addi	s1,s0,-64
    80007e50:	0080006f          	j	80007e58 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80007e54:	00848493          	addi	s1,s1,8
    80007e58:	fe040793          	addi	a5,s0,-32
    80007e5c:	08f48663          	beq	s1,a5,80007ee8 <_Z20Threads_CPP_API_testv+0x1f8>
    80007e60:	0004b503          	ld	a0,0(s1)
    80007e64:	fe0508e3          	beqz	a0,80007e54 <_Z20Threads_CPP_API_testv+0x164>
    80007e68:	00053783          	ld	a5,0(a0)
    80007e6c:	0087b783          	ld	a5,8(a5)
    80007e70:	000780e7          	jalr	a5
    80007e74:	fe1ff06f          	j	80007e54 <_Z20Threads_CPP_API_testv+0x164>
    80007e78:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80007e7c:	00048513          	mv	a0,s1
    80007e80:	ffff9097          	auipc	ra,0xffff9
    80007e84:	364080e7          	jalr	868(ra) # 800011e4 <_ZdlPv>
    80007e88:	00090513          	mv	a0,s2
    80007e8c:	00007097          	auipc	ra,0x7
    80007e90:	41c080e7          	jalr	1052(ra) # 8000f2a8 <_Unwind_Resume>
    80007e94:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80007e98:	00048513          	mv	a0,s1
    80007e9c:	ffff9097          	auipc	ra,0xffff9
    80007ea0:	348080e7          	jalr	840(ra) # 800011e4 <_ZdlPv>
    80007ea4:	00090513          	mv	a0,s2
    80007ea8:	00007097          	auipc	ra,0x7
    80007eac:	400080e7          	jalr	1024(ra) # 8000f2a8 <_Unwind_Resume>
    80007eb0:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80007eb4:	00048513          	mv	a0,s1
    80007eb8:	ffff9097          	auipc	ra,0xffff9
    80007ebc:	32c080e7          	jalr	812(ra) # 800011e4 <_ZdlPv>
    80007ec0:	00090513          	mv	a0,s2
    80007ec4:	00007097          	auipc	ra,0x7
    80007ec8:	3e4080e7          	jalr	996(ra) # 8000f2a8 <_Unwind_Resume>
    80007ecc:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80007ed0:	00048513          	mv	a0,s1
    80007ed4:	ffff9097          	auipc	ra,0xffff9
    80007ed8:	310080e7          	jalr	784(ra) # 800011e4 <_ZdlPv>
    80007edc:	00090513          	mv	a0,s2
    80007ee0:	00007097          	auipc	ra,0x7
    80007ee4:	3c8080e7          	jalr	968(ra) # 8000f2a8 <_Unwind_Resume>
}
    80007ee8:	03813083          	ld	ra,56(sp)
    80007eec:	03013403          	ld	s0,48(sp)
    80007ef0:	02813483          	ld	s1,40(sp)
    80007ef4:	02013903          	ld	s2,32(sp)
    80007ef8:	04010113          	addi	sp,sp,64
    80007efc:	00008067          	ret

0000000080007f00 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80007f00:	ff010113          	addi	sp,sp,-16
    80007f04:	00113423          	sd	ra,8(sp)
    80007f08:	00813023          	sd	s0,0(sp)
    80007f0c:	01010413          	addi	s0,sp,16
    80007f10:	00006797          	auipc	a5,0x6
    80007f14:	08878793          	addi	a5,a5,136 # 8000df98 <_ZTV7WorkerA+0x10>
    80007f18:	00f53023          	sd	a5,0(a0)
    80007f1c:	ffff9097          	auipc	ra,0xffff9
    80007f20:	230080e7          	jalr	560(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007f24:	00813083          	ld	ra,8(sp)
    80007f28:	00013403          	ld	s0,0(sp)
    80007f2c:	01010113          	addi	sp,sp,16
    80007f30:	00008067          	ret

0000000080007f34 <_ZN7WorkerAD0Ev>:
    80007f34:	fe010113          	addi	sp,sp,-32
    80007f38:	00113c23          	sd	ra,24(sp)
    80007f3c:	00813823          	sd	s0,16(sp)
    80007f40:	00913423          	sd	s1,8(sp)
    80007f44:	02010413          	addi	s0,sp,32
    80007f48:	00050493          	mv	s1,a0
    80007f4c:	00006797          	auipc	a5,0x6
    80007f50:	04c78793          	addi	a5,a5,76 # 8000df98 <_ZTV7WorkerA+0x10>
    80007f54:	00f53023          	sd	a5,0(a0)
    80007f58:	ffff9097          	auipc	ra,0xffff9
    80007f5c:	1f4080e7          	jalr	500(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007f60:	00048513          	mv	a0,s1
    80007f64:	ffff9097          	auipc	ra,0xffff9
    80007f68:	280080e7          	jalr	640(ra) # 800011e4 <_ZdlPv>
    80007f6c:	01813083          	ld	ra,24(sp)
    80007f70:	01013403          	ld	s0,16(sp)
    80007f74:	00813483          	ld	s1,8(sp)
    80007f78:	02010113          	addi	sp,sp,32
    80007f7c:	00008067          	ret

0000000080007f80 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80007f80:	ff010113          	addi	sp,sp,-16
    80007f84:	00113423          	sd	ra,8(sp)
    80007f88:	00813023          	sd	s0,0(sp)
    80007f8c:	01010413          	addi	s0,sp,16
    80007f90:	00006797          	auipc	a5,0x6
    80007f94:	03078793          	addi	a5,a5,48 # 8000dfc0 <_ZTV7WorkerB+0x10>
    80007f98:	00f53023          	sd	a5,0(a0)
    80007f9c:	ffff9097          	auipc	ra,0xffff9
    80007fa0:	1b0080e7          	jalr	432(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007fa4:	00813083          	ld	ra,8(sp)
    80007fa8:	00013403          	ld	s0,0(sp)
    80007fac:	01010113          	addi	sp,sp,16
    80007fb0:	00008067          	ret

0000000080007fb4 <_ZN7WorkerBD0Ev>:
    80007fb4:	fe010113          	addi	sp,sp,-32
    80007fb8:	00113c23          	sd	ra,24(sp)
    80007fbc:	00813823          	sd	s0,16(sp)
    80007fc0:	00913423          	sd	s1,8(sp)
    80007fc4:	02010413          	addi	s0,sp,32
    80007fc8:	00050493          	mv	s1,a0
    80007fcc:	00006797          	auipc	a5,0x6
    80007fd0:	ff478793          	addi	a5,a5,-12 # 8000dfc0 <_ZTV7WorkerB+0x10>
    80007fd4:	00f53023          	sd	a5,0(a0)
    80007fd8:	ffff9097          	auipc	ra,0xffff9
    80007fdc:	174080e7          	jalr	372(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007fe0:	00048513          	mv	a0,s1
    80007fe4:	ffff9097          	auipc	ra,0xffff9
    80007fe8:	200080e7          	jalr	512(ra) # 800011e4 <_ZdlPv>
    80007fec:	01813083          	ld	ra,24(sp)
    80007ff0:	01013403          	ld	s0,16(sp)
    80007ff4:	00813483          	ld	s1,8(sp)
    80007ff8:	02010113          	addi	sp,sp,32
    80007ffc:	00008067          	ret

0000000080008000 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80008000:	ff010113          	addi	sp,sp,-16
    80008004:	00113423          	sd	ra,8(sp)
    80008008:	00813023          	sd	s0,0(sp)
    8000800c:	01010413          	addi	s0,sp,16
    80008010:	00006797          	auipc	a5,0x6
    80008014:	fd878793          	addi	a5,a5,-40 # 8000dfe8 <_ZTV7WorkerC+0x10>
    80008018:	00f53023          	sd	a5,0(a0)
    8000801c:	ffff9097          	auipc	ra,0xffff9
    80008020:	130080e7          	jalr	304(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008024:	00813083          	ld	ra,8(sp)
    80008028:	00013403          	ld	s0,0(sp)
    8000802c:	01010113          	addi	sp,sp,16
    80008030:	00008067          	ret

0000000080008034 <_ZN7WorkerCD0Ev>:
    80008034:	fe010113          	addi	sp,sp,-32
    80008038:	00113c23          	sd	ra,24(sp)
    8000803c:	00813823          	sd	s0,16(sp)
    80008040:	00913423          	sd	s1,8(sp)
    80008044:	02010413          	addi	s0,sp,32
    80008048:	00050493          	mv	s1,a0
    8000804c:	00006797          	auipc	a5,0x6
    80008050:	f9c78793          	addi	a5,a5,-100 # 8000dfe8 <_ZTV7WorkerC+0x10>
    80008054:	00f53023          	sd	a5,0(a0)
    80008058:	ffff9097          	auipc	ra,0xffff9
    8000805c:	0f4080e7          	jalr	244(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008060:	00048513          	mv	a0,s1
    80008064:	ffff9097          	auipc	ra,0xffff9
    80008068:	180080e7          	jalr	384(ra) # 800011e4 <_ZdlPv>
    8000806c:	01813083          	ld	ra,24(sp)
    80008070:	01013403          	ld	s0,16(sp)
    80008074:	00813483          	ld	s1,8(sp)
    80008078:	02010113          	addi	sp,sp,32
    8000807c:	00008067          	ret

0000000080008080 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80008080:	ff010113          	addi	sp,sp,-16
    80008084:	00113423          	sd	ra,8(sp)
    80008088:	00813023          	sd	s0,0(sp)
    8000808c:	01010413          	addi	s0,sp,16
    80008090:	00006797          	auipc	a5,0x6
    80008094:	f8078793          	addi	a5,a5,-128 # 8000e010 <_ZTV7WorkerD+0x10>
    80008098:	00f53023          	sd	a5,0(a0)
    8000809c:	ffff9097          	auipc	ra,0xffff9
    800080a0:	0b0080e7          	jalr	176(ra) # 8000114c <_ZN6ThreadD1Ev>
    800080a4:	00813083          	ld	ra,8(sp)
    800080a8:	00013403          	ld	s0,0(sp)
    800080ac:	01010113          	addi	sp,sp,16
    800080b0:	00008067          	ret

00000000800080b4 <_ZN7WorkerDD0Ev>:
    800080b4:	fe010113          	addi	sp,sp,-32
    800080b8:	00113c23          	sd	ra,24(sp)
    800080bc:	00813823          	sd	s0,16(sp)
    800080c0:	00913423          	sd	s1,8(sp)
    800080c4:	02010413          	addi	s0,sp,32
    800080c8:	00050493          	mv	s1,a0
    800080cc:	00006797          	auipc	a5,0x6
    800080d0:	f4478793          	addi	a5,a5,-188 # 8000e010 <_ZTV7WorkerD+0x10>
    800080d4:	00f53023          	sd	a5,0(a0)
    800080d8:	ffff9097          	auipc	ra,0xffff9
    800080dc:	074080e7          	jalr	116(ra) # 8000114c <_ZN6ThreadD1Ev>
    800080e0:	00048513          	mv	a0,s1
    800080e4:	ffff9097          	auipc	ra,0xffff9
    800080e8:	100080e7          	jalr	256(ra) # 800011e4 <_ZdlPv>
    800080ec:	01813083          	ld	ra,24(sp)
    800080f0:	01013403          	ld	s0,16(sp)
    800080f4:	00813483          	ld	s1,8(sp)
    800080f8:	02010113          	addi	sp,sp,32
    800080fc:	00008067          	ret

0000000080008100 <_ZN7WorkerA3runEv>:
    void run() override {
    80008100:	ff010113          	addi	sp,sp,-16
    80008104:	00113423          	sd	ra,8(sp)
    80008108:	00813023          	sd	s0,0(sp)
    8000810c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80008110:	00000593          	li	a1,0
    80008114:	fffff097          	auipc	ra,0xfffff
    80008118:	774080e7          	jalr	1908(ra) # 80007888 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000811c:	00813083          	ld	ra,8(sp)
    80008120:	00013403          	ld	s0,0(sp)
    80008124:	01010113          	addi	sp,sp,16
    80008128:	00008067          	ret

000000008000812c <_ZN7WorkerB3runEv>:
    void run() override {
    8000812c:	ff010113          	addi	sp,sp,-16
    80008130:	00113423          	sd	ra,8(sp)
    80008134:	00813023          	sd	s0,0(sp)
    80008138:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000813c:	00000593          	li	a1,0
    80008140:	00000097          	auipc	ra,0x0
    80008144:	814080e7          	jalr	-2028(ra) # 80007954 <_ZN7WorkerB11workerBodyBEPv>
    }
    80008148:	00813083          	ld	ra,8(sp)
    8000814c:	00013403          	ld	s0,0(sp)
    80008150:	01010113          	addi	sp,sp,16
    80008154:	00008067          	ret

0000000080008158 <_ZN7WorkerC3runEv>:
    void run() override {
    80008158:	ff010113          	addi	sp,sp,-16
    8000815c:	00113423          	sd	ra,8(sp)
    80008160:	00813023          	sd	s0,0(sp)
    80008164:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80008168:	00000593          	li	a1,0
    8000816c:	00000097          	auipc	ra,0x0
    80008170:	8bc080e7          	jalr	-1860(ra) # 80007a28 <_ZN7WorkerC11workerBodyCEPv>
    }
    80008174:	00813083          	ld	ra,8(sp)
    80008178:	00013403          	ld	s0,0(sp)
    8000817c:	01010113          	addi	sp,sp,16
    80008180:	00008067          	ret

0000000080008184 <_ZN7WorkerD3runEv>:
    void run() override {
    80008184:	ff010113          	addi	sp,sp,-16
    80008188:	00113423          	sd	ra,8(sp)
    8000818c:	00813023          	sd	s0,0(sp)
    80008190:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80008194:	00000593          	li	a1,0
    80008198:	00000097          	auipc	ra,0x0
    8000819c:	a10080e7          	jalr	-1520(ra) # 80007ba8 <_ZN7WorkerD11workerBodyDEPv>
    }
    800081a0:	00813083          	ld	ra,8(sp)
    800081a4:	00013403          	ld	s0,0(sp)
    800081a8:	01010113          	addi	sp,sp,16
    800081ac:	00008067          	ret

00000000800081b0 <_Z8userMainv>:
#include "../test_h/ConsumerProducer_CPP_API_test.h"
#include "../test_h/System_Mode_test.h"

#endif

void userMain() {
    800081b0:	fe010113          	addi	sp,sp,-32
    800081b4:	00113c23          	sd	ra,24(sp)
    800081b8:	00813823          	sd	s0,16(sp)
    800081bc:	00913423          	sd	s1,8(sp)
    800081c0:	01213023          	sd	s2,0(sp)
    800081c4:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800081c8:	00003517          	auipc	a0,0x3
    800081cc:	57850513          	addi	a0,a0,1400 # 8000b740 <CONSOLE_STATUS+0x730>
    800081d0:	00000097          	auipc	ra,0x0
    800081d4:	168080e7          	jalr	360(ra) # 80008338 <_Z11printStringPKc>
    int test = getc() - '0';
    800081d8:	ffffa097          	auipc	ra,0xffffa
    800081dc:	8f0080e7          	jalr	-1808(ra) # 80001ac8 <_Z4getcv>
    800081e0:	00050913          	mv	s2,a0
    800081e4:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800081e8:	ffffa097          	auipc	ra,0xffffa
    800081ec:	8e0080e7          	jalr	-1824(ra) # 80001ac8 <_Z4getcv>
    // int test = 3;
    putc('0' + test);
    800081f0:	00090513          	mv	a0,s2
    800081f4:	ffffa097          	auipc	ra,0xffffa
    800081f8:	8fc080e7          	jalr	-1796(ra) # 80001af0 <_Z4putcc>
    putc('\n');
    800081fc:	00a00513          	li	a0,10
    80008200:	ffffa097          	auipc	ra,0xffffa
    80008204:	8f0080e7          	jalr	-1808(ra) # 80001af0 <_Z4putcc>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80008208:	00700793          	li	a5,7
    8000820c:	1097ec63          	bltu	a5,s1,80008324 <_Z8userMainv+0x174>
    80008210:	00249493          	slli	s1,s1,0x2
    80008214:	00003717          	auipc	a4,0x3
    80008218:	79870713          	addi	a4,a4,1944 # 8000b9ac <CONSOLE_STATUS+0x99c>
    8000821c:	00e484b3          	add	s1,s1,a4
    80008220:	0004a783          	lw	a5,0(s1)
    80008224:	00e787b3          	add	a5,a5,a4
    80008228:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    8000822c:	fffff097          	auipc	ra,0xfffff
    80008230:	f5c080e7          	jalr	-164(ra) # 80007188 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80008234:	00003517          	auipc	a0,0x3
    80008238:	52c50513          	addi	a0,a0,1324 # 8000b760 <CONSOLE_STATUS+0x750>
    8000823c:	00000097          	auipc	ra,0x0
    80008240:	0fc080e7          	jalr	252(ra) # 80008338 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    printString("Kraj izvrsavanja");
    80008244:	00003517          	auipc	a0,0x3
    80008248:	75450513          	addi	a0,a0,1876 # 8000b998 <CONSOLE_STATUS+0x988>
    8000824c:	00000097          	auipc	ra,0x0
    80008250:	0ec080e7          	jalr	236(ra) # 80008338 <_Z11printStringPKc>
    80008254:	01813083          	ld	ra,24(sp)
    80008258:	01013403          	ld	s0,16(sp)
    8000825c:	00813483          	ld	s1,8(sp)
    80008260:	00013903          	ld	s2,0(sp)
    80008264:	02010113          	addi	sp,sp,32
    80008268:	00008067          	ret
            Threads_CPP_API_test();
    8000826c:	00000097          	auipc	ra,0x0
    80008270:	a84080e7          	jalr	-1404(ra) # 80007cf0 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80008274:	00003517          	auipc	a0,0x3
    80008278:	52c50513          	addi	a0,a0,1324 # 8000b7a0 <CONSOLE_STATUS+0x790>
    8000827c:	00000097          	auipc	ra,0x0
    80008280:	0bc080e7          	jalr	188(ra) # 80008338 <_Z11printStringPKc>
            break;
    80008284:	fc1ff06f          	j	80008244 <_Z8userMainv+0x94>
            producerConsumer_C_API();
    80008288:	ffffe097          	auipc	ra,0xffffe
    8000828c:	9e0080e7          	jalr	-1568(ra) # 80005c68 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80008290:	00003517          	auipc	a0,0x3
    80008294:	55050513          	addi	a0,a0,1360 # 8000b7e0 <CONSOLE_STATUS+0x7d0>
    80008298:	00000097          	auipc	ra,0x0
    8000829c:	0a0080e7          	jalr	160(ra) # 80008338 <_Z11printStringPKc>
            break;
    800082a0:	fa5ff06f          	j	80008244 <_Z8userMainv+0x94>
            producerConsumer_CPP_Sync_API();
    800082a4:	00000097          	auipc	ra,0x0
    800082a8:	5ac080e7          	jalr	1452(ra) # 80008850 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    800082ac:	00003517          	auipc	a0,0x3
    800082b0:	58450513          	addi	a0,a0,1412 # 8000b830 <CONSOLE_STATUS+0x820>
    800082b4:	00000097          	auipc	ra,0x0
    800082b8:	084080e7          	jalr	132(ra) # 80008338 <_Z11printStringPKc>
            break;
    800082bc:	f89ff06f          	j	80008244 <_Z8userMainv+0x94>
            testSleeping();
    800082c0:	fffff097          	auipc	ra,0xfffff
    800082c4:	074080e7          	jalr	116(ra) # 80007334 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., time_sleep test C API)\n");
    800082c8:	00003517          	auipc	a0,0x3
    800082cc:	5c050513          	addi	a0,a0,1472 # 8000b888 <CONSOLE_STATUS+0x878>
    800082d0:	00000097          	auipc	ra,0x0
    800082d4:	068080e7          	jalr	104(ra) # 80008338 <_Z11printStringPKc>
            break;
    800082d8:	f6dff06f          	j	80008244 <_Z8userMainv+0x94>
            testConsumerProducer();
    800082dc:	ffffe097          	auipc	ra,0xffffe
    800082e0:	c5c080e7          	jalr	-932(ra) # 80005f38 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800082e4:	00003517          	auipc	a0,0x3
    800082e8:	5d450513          	addi	a0,a0,1492 # 8000b8b8 <CONSOLE_STATUS+0x8a8>
    800082ec:	00000097          	auipc	ra,0x0
    800082f0:	04c080e7          	jalr	76(ra) # 80008338 <_Z11printStringPKc>
            break;
    800082f4:	f51ff06f          	j	80008244 <_Z8userMainv+0x94>
            System_Mode_test();
    800082f8:	fffff097          	auipc	ra,0xfffff
    800082fc:	8b8080e7          	jalr	-1864(ra) # 80006bb0 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80008300:	00003517          	auipc	a0,0x3
    80008304:	5f850513          	addi	a0,a0,1528 # 8000b8f8 <CONSOLE_STATUS+0x8e8>
    80008308:	00000097          	auipc	ra,0x0
    8000830c:	030080e7          	jalr	48(ra) # 80008338 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80008310:	00003517          	auipc	a0,0x3
    80008314:	60850513          	addi	a0,a0,1544 # 8000b918 <CONSOLE_STATUS+0x908>
    80008318:	00000097          	auipc	ra,0x0
    8000831c:	020080e7          	jalr	32(ra) # 80008338 <_Z11printStringPKc>
            break;
    80008320:	f25ff06f          	j	80008244 <_Z8userMainv+0x94>
            printString("Niste uneli odgovarajuci broj za test\n");
    80008324:	00003517          	auipc	a0,0x3
    80008328:	64c50513          	addi	a0,a0,1612 # 8000b970 <CONSOLE_STATUS+0x960>
    8000832c:	00000097          	auipc	ra,0x0
    80008330:	00c080e7          	jalr	12(ra) # 80008338 <_Z11printStringPKc>
    80008334:	f11ff06f          	j	80008244 <_Z8userMainv+0x94>

0000000080008338 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80008338:	fe010113          	addi	sp,sp,-32
    8000833c:	00113c23          	sd	ra,24(sp)
    80008340:	00813823          	sd	s0,16(sp)
    80008344:	00913423          	sd	s1,8(sp)
    80008348:	02010413          	addi	s0,sp,32
    8000834c:	00050493          	mv	s1,a0
    LOCK();
    80008350:	00100613          	li	a2,1
    80008354:	00000593          	li	a1,0
    80008358:	00006517          	auipc	a0,0x6
    8000835c:	e7050513          	addi	a0,a0,-400 # 8000e1c8 <lockPrint>
    80008360:	ffff9097          	auipc	ra,0xffff9
    80008364:	da0080e7          	jalr	-608(ra) # 80001100 <copy_and_swap>
    80008368:	00050863          	beqz	a0,80008378 <_Z11printStringPKc+0x40>
    8000836c:	ffff9097          	auipc	ra,0xffff9
    80008370:	630080e7          	jalr	1584(ra) # 8000199c <_Z15thread_dispatchv>
    80008374:	fddff06f          	j	80008350 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80008378:	0004c503          	lbu	a0,0(s1)
    8000837c:	00050a63          	beqz	a0,80008390 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80008380:	ffff9097          	auipc	ra,0xffff9
    80008384:	770080e7          	jalr	1904(ra) # 80001af0 <_Z4putcc>
        string++;
    80008388:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    8000838c:	fedff06f          	j	80008378 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80008390:	00000613          	li	a2,0
    80008394:	00100593          	li	a1,1
    80008398:	00006517          	auipc	a0,0x6
    8000839c:	e3050513          	addi	a0,a0,-464 # 8000e1c8 <lockPrint>
    800083a0:	ffff9097          	auipc	ra,0xffff9
    800083a4:	d60080e7          	jalr	-672(ra) # 80001100 <copy_and_swap>
    800083a8:	fe0514e3          	bnez	a0,80008390 <_Z11printStringPKc+0x58>
}
    800083ac:	01813083          	ld	ra,24(sp)
    800083b0:	01013403          	ld	s0,16(sp)
    800083b4:	00813483          	ld	s1,8(sp)
    800083b8:	02010113          	addi	sp,sp,32
    800083bc:	00008067          	ret

00000000800083c0 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800083c0:	fd010113          	addi	sp,sp,-48
    800083c4:	02113423          	sd	ra,40(sp)
    800083c8:	02813023          	sd	s0,32(sp)
    800083cc:	00913c23          	sd	s1,24(sp)
    800083d0:	01213823          	sd	s2,16(sp)
    800083d4:	01313423          	sd	s3,8(sp)
    800083d8:	01413023          	sd	s4,0(sp)
    800083dc:	03010413          	addi	s0,sp,48
    800083e0:	00050993          	mv	s3,a0
    800083e4:	00058a13          	mv	s4,a1
    LOCK();
    800083e8:	00100613          	li	a2,1
    800083ec:	00000593          	li	a1,0
    800083f0:	00006517          	auipc	a0,0x6
    800083f4:	dd850513          	addi	a0,a0,-552 # 8000e1c8 <lockPrint>
    800083f8:	ffff9097          	auipc	ra,0xffff9
    800083fc:	d08080e7          	jalr	-760(ra) # 80001100 <copy_and_swap>
    80008400:	00050863          	beqz	a0,80008410 <_Z9getStringPci+0x50>
    80008404:	ffff9097          	auipc	ra,0xffff9
    80008408:	598080e7          	jalr	1432(ra) # 8000199c <_Z15thread_dispatchv>
    8000840c:	fddff06f          	j	800083e8 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80008410:	00000913          	li	s2,0
    80008414:	00090493          	mv	s1,s2
    80008418:	0019091b          	addiw	s2,s2,1
    8000841c:	03495a63          	bge	s2,s4,80008450 <_Z9getStringPci+0x90>
        cc = getc();
    80008420:	ffff9097          	auipc	ra,0xffff9
    80008424:	6a8080e7          	jalr	1704(ra) # 80001ac8 <_Z4getcv>
        if(cc < 1)
    80008428:	02050463          	beqz	a0,80008450 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    8000842c:	009984b3          	add	s1,s3,s1
    80008430:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80008434:	00a00793          	li	a5,10
    80008438:	00f50a63          	beq	a0,a5,8000844c <_Z9getStringPci+0x8c>
    8000843c:	00d00793          	li	a5,13
    80008440:	fcf51ae3          	bne	a0,a5,80008414 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80008444:	00090493          	mv	s1,s2
    80008448:	0080006f          	j	80008450 <_Z9getStringPci+0x90>
    8000844c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80008450:	009984b3          	add	s1,s3,s1
    80008454:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80008458:	00000613          	li	a2,0
    8000845c:	00100593          	li	a1,1
    80008460:	00006517          	auipc	a0,0x6
    80008464:	d6850513          	addi	a0,a0,-664 # 8000e1c8 <lockPrint>
    80008468:	ffff9097          	auipc	ra,0xffff9
    8000846c:	c98080e7          	jalr	-872(ra) # 80001100 <copy_and_swap>
    80008470:	fe0514e3          	bnez	a0,80008458 <_Z9getStringPci+0x98>
    return buf;
}
    80008474:	00098513          	mv	a0,s3
    80008478:	02813083          	ld	ra,40(sp)
    8000847c:	02013403          	ld	s0,32(sp)
    80008480:	01813483          	ld	s1,24(sp)
    80008484:	01013903          	ld	s2,16(sp)
    80008488:	00813983          	ld	s3,8(sp)
    8000848c:	00013a03          	ld	s4,0(sp)
    80008490:	03010113          	addi	sp,sp,48
    80008494:	00008067          	ret

0000000080008498 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80008498:	ff010113          	addi	sp,sp,-16
    8000849c:	00813423          	sd	s0,8(sp)
    800084a0:	01010413          	addi	s0,sp,16
    800084a4:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800084a8:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800084ac:	0006c603          	lbu	a2,0(a3)
    800084b0:	fd06071b          	addiw	a4,a2,-48
    800084b4:	0ff77713          	andi	a4,a4,255
    800084b8:	00900793          	li	a5,9
    800084bc:	02e7e063          	bltu	a5,a4,800084dc <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800084c0:	0025179b          	slliw	a5,a0,0x2
    800084c4:	00a787bb          	addw	a5,a5,a0
    800084c8:	0017979b          	slliw	a5,a5,0x1
    800084cc:	00168693          	addi	a3,a3,1
    800084d0:	00c787bb          	addw	a5,a5,a2
    800084d4:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800084d8:	fd5ff06f          	j	800084ac <_Z11stringToIntPKc+0x14>
    return n;
}
    800084dc:	00813403          	ld	s0,8(sp)
    800084e0:	01010113          	addi	sp,sp,16
    800084e4:	00008067          	ret

00000000800084e8 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800084e8:	fc010113          	addi	sp,sp,-64
    800084ec:	02113c23          	sd	ra,56(sp)
    800084f0:	02813823          	sd	s0,48(sp)
    800084f4:	02913423          	sd	s1,40(sp)
    800084f8:	03213023          	sd	s2,32(sp)
    800084fc:	01313c23          	sd	s3,24(sp)
    80008500:	04010413          	addi	s0,sp,64
    80008504:	00050493          	mv	s1,a0
    80008508:	00058913          	mv	s2,a1
    8000850c:	00060993          	mv	s3,a2
    LOCK();
    80008510:	00100613          	li	a2,1
    80008514:	00000593          	li	a1,0
    80008518:	00006517          	auipc	a0,0x6
    8000851c:	cb050513          	addi	a0,a0,-848 # 8000e1c8 <lockPrint>
    80008520:	ffff9097          	auipc	ra,0xffff9
    80008524:	be0080e7          	jalr	-1056(ra) # 80001100 <copy_and_swap>
    80008528:	00050863          	beqz	a0,80008538 <_Z8printIntiii+0x50>
    8000852c:	ffff9097          	auipc	ra,0xffff9
    80008530:	470080e7          	jalr	1136(ra) # 8000199c <_Z15thread_dispatchv>
    80008534:	fddff06f          	j	80008510 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80008538:	00098463          	beqz	s3,80008540 <_Z8printIntiii+0x58>
    8000853c:	0804c463          	bltz	s1,800085c4 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80008540:	0004851b          	sext.w	a0,s1
    neg = 0;
    80008544:	00000593          	li	a1,0
    }

    i = 0;
    80008548:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    8000854c:	0009079b          	sext.w	a5,s2
    80008550:	0325773b          	remuw	a4,a0,s2
    80008554:	00048613          	mv	a2,s1
    80008558:	0014849b          	addiw	s1,s1,1
    8000855c:	02071693          	slli	a3,a4,0x20
    80008560:	0206d693          	srli	a3,a3,0x20
    80008564:	00006717          	auipc	a4,0x6
    80008568:	ac470713          	addi	a4,a4,-1340 # 8000e028 <digits>
    8000856c:	00d70733          	add	a4,a4,a3
    80008570:	00074683          	lbu	a3,0(a4)
    80008574:	fd040713          	addi	a4,s0,-48
    80008578:	00c70733          	add	a4,a4,a2
    8000857c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80008580:	0005071b          	sext.w	a4,a0
    80008584:	0325553b          	divuw	a0,a0,s2
    80008588:	fcf772e3          	bgeu	a4,a5,8000854c <_Z8printIntiii+0x64>
    if(neg)
    8000858c:	00058c63          	beqz	a1,800085a4 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80008590:	fd040793          	addi	a5,s0,-48
    80008594:	009784b3          	add	s1,a5,s1
    80008598:	02d00793          	li	a5,45
    8000859c:	fef48823          	sb	a5,-16(s1)
    800085a0:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800085a4:	fff4849b          	addiw	s1,s1,-1
    800085a8:	0204c463          	bltz	s1,800085d0 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800085ac:	fd040793          	addi	a5,s0,-48
    800085b0:	009787b3          	add	a5,a5,s1
    800085b4:	ff07c503          	lbu	a0,-16(a5)
    800085b8:	ffff9097          	auipc	ra,0xffff9
    800085bc:	538080e7          	jalr	1336(ra) # 80001af0 <_Z4putcc>
    800085c0:	fe5ff06f          	j	800085a4 <_Z8printIntiii+0xbc>
        x = -xx;
    800085c4:	4090053b          	negw	a0,s1
        neg = 1;
    800085c8:	00100593          	li	a1,1
        x = -xx;
    800085cc:	f7dff06f          	j	80008548 <_Z8printIntiii+0x60>

    UNLOCK();
    800085d0:	00000613          	li	a2,0
    800085d4:	00100593          	li	a1,1
    800085d8:	00006517          	auipc	a0,0x6
    800085dc:	bf050513          	addi	a0,a0,-1040 # 8000e1c8 <lockPrint>
    800085e0:	ffff9097          	auipc	ra,0xffff9
    800085e4:	b20080e7          	jalr	-1248(ra) # 80001100 <copy_and_swap>
    800085e8:	fe0514e3          	bnez	a0,800085d0 <_Z8printIntiii+0xe8>
    800085ec:	03813083          	ld	ra,56(sp)
    800085f0:	03013403          	ld	s0,48(sp)
    800085f4:	02813483          	ld	s1,40(sp)
    800085f8:	02013903          	ld	s2,32(sp)
    800085fc:	01813983          	ld	s3,24(sp)
    80008600:	04010113          	addi	sp,sp,64
    80008604:	00008067          	ret

0000000080008608 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80008608:	fd010113          	addi	sp,sp,-48
    8000860c:	02113423          	sd	ra,40(sp)
    80008610:	02813023          	sd	s0,32(sp)
    80008614:	00913c23          	sd	s1,24(sp)
    80008618:	01213823          	sd	s2,16(sp)
    8000861c:	01313423          	sd	s3,8(sp)
    80008620:	03010413          	addi	s0,sp,48
    80008624:	00050993          	mv	s3,a0
    80008628:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000862c:	00000913          	li	s2,0
    80008630:	00c0006f          	j	8000863c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80008634:	ffff9097          	auipc	ra,0xffff9
    80008638:	ce4080e7          	jalr	-796(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    8000863c:	ffff9097          	auipc	ra,0xffff9
    80008640:	48c080e7          	jalr	1164(ra) # 80001ac8 <_Z4getcv>
    80008644:	0005059b          	sext.w	a1,a0
    80008648:	01b00793          	li	a5,27
    8000864c:	02f58a63          	beq	a1,a5,80008680 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80008650:	0084b503          	ld	a0,8(s1)
    80008654:	fffff097          	auipc	ra,0xfffff
    80008658:	f1c080e7          	jalr	-228(ra) # 80007570 <_ZN9BufferCPP3putEi>
        i++;
    8000865c:	0019071b          	addiw	a4,s2,1
    80008660:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80008664:	0004a683          	lw	a3,0(s1)
    80008668:	0026979b          	slliw	a5,a3,0x2
    8000866c:	00d787bb          	addw	a5,a5,a3
    80008670:	0017979b          	slliw	a5,a5,0x1
    80008674:	02f767bb          	remw	a5,a4,a5
    80008678:	fc0792e3          	bnez	a5,8000863c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000867c:	fb9ff06f          	j	80008634 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80008680:	00100793          	li	a5,1
    80008684:	00006717          	auipc	a4,0x6
    80008688:	b4f72623          	sw	a5,-1204(a4) # 8000e1d0 <_ZL9threadEnd>
    td->buffer->put('!');
    8000868c:	0209b783          	ld	a5,32(s3)
    80008690:	02100593          	li	a1,33
    80008694:	0087b503          	ld	a0,8(a5)
    80008698:	fffff097          	auipc	ra,0xfffff
    8000869c:	ed8080e7          	jalr	-296(ra) # 80007570 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800086a0:	0104b503          	ld	a0,16(s1)
    800086a4:	ffff9097          	auipc	ra,0xffff9
    800086a8:	d94080e7          	jalr	-620(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    800086ac:	02813083          	ld	ra,40(sp)
    800086b0:	02013403          	ld	s0,32(sp)
    800086b4:	01813483          	ld	s1,24(sp)
    800086b8:	01013903          	ld	s2,16(sp)
    800086bc:	00813983          	ld	s3,8(sp)
    800086c0:	03010113          	addi	sp,sp,48
    800086c4:	00008067          	ret

00000000800086c8 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800086c8:	fe010113          	addi	sp,sp,-32
    800086cc:	00113c23          	sd	ra,24(sp)
    800086d0:	00813823          	sd	s0,16(sp)
    800086d4:	00913423          	sd	s1,8(sp)
    800086d8:	01213023          	sd	s2,0(sp)
    800086dc:	02010413          	addi	s0,sp,32
    800086e0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800086e4:	00000913          	li	s2,0
    800086e8:	00c0006f          	j	800086f4 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800086ec:	ffff9097          	auipc	ra,0xffff9
    800086f0:	c2c080e7          	jalr	-980(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800086f4:	00006797          	auipc	a5,0x6
    800086f8:	adc7a783          	lw	a5,-1316(a5) # 8000e1d0 <_ZL9threadEnd>
    800086fc:	02079e63          	bnez	a5,80008738 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80008700:	0004a583          	lw	a1,0(s1)
    80008704:	0305859b          	addiw	a1,a1,48
    80008708:	0084b503          	ld	a0,8(s1)
    8000870c:	fffff097          	auipc	ra,0xfffff
    80008710:	e64080e7          	jalr	-412(ra) # 80007570 <_ZN9BufferCPP3putEi>
        i++;
    80008714:	0019071b          	addiw	a4,s2,1
    80008718:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000871c:	0004a683          	lw	a3,0(s1)
    80008720:	0026979b          	slliw	a5,a3,0x2
    80008724:	00d787bb          	addw	a5,a5,a3
    80008728:	0017979b          	slliw	a5,a5,0x1
    8000872c:	02f767bb          	remw	a5,a4,a5
    80008730:	fc0792e3          	bnez	a5,800086f4 <_ZN12ProducerSync8producerEPv+0x2c>
    80008734:	fb9ff06f          	j	800086ec <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80008738:	0104b503          	ld	a0,16(s1)
    8000873c:	ffff9097          	auipc	ra,0xffff9
    80008740:	cfc080e7          	jalr	-772(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80008744:	01813083          	ld	ra,24(sp)
    80008748:	01013403          	ld	s0,16(sp)
    8000874c:	00813483          	ld	s1,8(sp)
    80008750:	00013903          	ld	s2,0(sp)
    80008754:	02010113          	addi	sp,sp,32
    80008758:	00008067          	ret

000000008000875c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    8000875c:	fd010113          	addi	sp,sp,-48
    80008760:	02113423          	sd	ra,40(sp)
    80008764:	02813023          	sd	s0,32(sp)
    80008768:	00913c23          	sd	s1,24(sp)
    8000876c:	01213823          	sd	s2,16(sp)
    80008770:	01313423          	sd	s3,8(sp)
    80008774:	01413023          	sd	s4,0(sp)
    80008778:	03010413          	addi	s0,sp,48
    8000877c:	00050993          	mv	s3,a0
    80008780:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80008784:	00000a13          	li	s4,0
    80008788:	01c0006f          	j	800087a4 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    8000878c:	ffff9097          	auipc	ra,0xffff9
    80008790:	b8c080e7          	jalr	-1140(ra) # 80001318 <_ZN6Thread8dispatchEv>
    80008794:	0500006f          	j	800087e4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80008798:	00a00513          	li	a0,10
    8000879c:	ffff9097          	auipc	ra,0xffff9
    800087a0:	354080e7          	jalr	852(ra) # 80001af0 <_Z4putcc>
    while (!threadEnd) {
    800087a4:	00006797          	auipc	a5,0x6
    800087a8:	a2c7a783          	lw	a5,-1492(a5) # 8000e1d0 <_ZL9threadEnd>
    800087ac:	06079263          	bnez	a5,80008810 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800087b0:	00893503          	ld	a0,8(s2)
    800087b4:	fffff097          	auipc	ra,0xfffff
    800087b8:	e4c080e7          	jalr	-436(ra) # 80007600 <_ZN9BufferCPP3getEv>
        i++;
    800087bc:	001a049b          	addiw	s1,s4,1
    800087c0:	00048a1b          	sext.w	s4,s1
        putc(key);
    800087c4:	0ff57513          	andi	a0,a0,255
    800087c8:	ffff9097          	auipc	ra,0xffff9
    800087cc:	328080e7          	jalr	808(ra) # 80001af0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800087d0:	00092703          	lw	a4,0(s2)
    800087d4:	0027179b          	slliw	a5,a4,0x2
    800087d8:	00e787bb          	addw	a5,a5,a4
    800087dc:	02f4e7bb          	remw	a5,s1,a5
    800087e0:	fa0786e3          	beqz	a5,8000878c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800087e4:	05000793          	li	a5,80
    800087e8:	02f4e4bb          	remw	s1,s1,a5
    800087ec:	fa049ce3          	bnez	s1,800087a4 <_ZN12ConsumerSync8consumerEPv+0x48>
    800087f0:	fa9ff06f          	j	80008798 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800087f4:	0209b783          	ld	a5,32(s3)
    800087f8:	0087b503          	ld	a0,8(a5)
    800087fc:	fffff097          	auipc	ra,0xfffff
    80008800:	e04080e7          	jalr	-508(ra) # 80007600 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80008804:	0ff57513          	andi	a0,a0,255
    80008808:	ffff9097          	auipc	ra,0xffff9
    8000880c:	ccc080e7          	jalr	-820(ra) # 800014d4 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80008810:	0209b783          	ld	a5,32(s3)
    80008814:	0087b503          	ld	a0,8(a5)
    80008818:	fffff097          	auipc	ra,0xfffff
    8000881c:	e74080e7          	jalr	-396(ra) # 8000768c <_ZN9BufferCPP6getCntEv>
    80008820:	fca04ae3          	bgtz	a0,800087f4 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80008824:	01093503          	ld	a0,16(s2)
    80008828:	ffff9097          	auipc	ra,0xffff9
    8000882c:	c10080e7          	jalr	-1008(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80008830:	02813083          	ld	ra,40(sp)
    80008834:	02013403          	ld	s0,32(sp)
    80008838:	01813483          	ld	s1,24(sp)
    8000883c:	01013903          	ld	s2,16(sp)
    80008840:	00813983          	ld	s3,8(sp)
    80008844:	00013a03          	ld	s4,0(sp)
    80008848:	03010113          	addi	sp,sp,48
    8000884c:	00008067          	ret

0000000080008850 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80008850:	f8010113          	addi	sp,sp,-128
    80008854:	06113c23          	sd	ra,120(sp)
    80008858:	06813823          	sd	s0,112(sp)
    8000885c:	06913423          	sd	s1,104(sp)
    80008860:	07213023          	sd	s2,96(sp)
    80008864:	05313c23          	sd	s3,88(sp)
    80008868:	05413823          	sd	s4,80(sp)
    8000886c:	05513423          	sd	s5,72(sp)
    80008870:	05613023          	sd	s6,64(sp)
    80008874:	03713c23          	sd	s7,56(sp)
    80008878:	03813823          	sd	s8,48(sp)
    8000887c:	03913423          	sd	s9,40(sp)
    80008880:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80008884:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80008888:	00003517          	auipc	a0,0x3
    8000888c:	c4850513          	addi	a0,a0,-952 # 8000b4d0 <CONSOLE_STATUS+0x4c0>
    80008890:	00000097          	auipc	ra,0x0
    80008894:	aa8080e7          	jalr	-1368(ra) # 80008338 <_Z11printStringPKc>
    getString(input, 30);
    80008898:	01e00593          	li	a1,30
    8000889c:	f8040493          	addi	s1,s0,-128
    800088a0:	00048513          	mv	a0,s1
    800088a4:	00000097          	auipc	ra,0x0
    800088a8:	b1c080e7          	jalr	-1252(ra) # 800083c0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800088ac:	00048513          	mv	a0,s1
    800088b0:	00000097          	auipc	ra,0x0
    800088b4:	be8080e7          	jalr	-1048(ra) # 80008498 <_Z11stringToIntPKc>
    800088b8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800088bc:	00003517          	auipc	a0,0x3
    800088c0:	c3450513          	addi	a0,a0,-972 # 8000b4f0 <CONSOLE_STATUS+0x4e0>
    800088c4:	00000097          	auipc	ra,0x0
    800088c8:	a74080e7          	jalr	-1420(ra) # 80008338 <_Z11printStringPKc>
    getString(input, 30);
    800088cc:	01e00593          	li	a1,30
    800088d0:	00048513          	mv	a0,s1
    800088d4:	00000097          	auipc	ra,0x0
    800088d8:	aec080e7          	jalr	-1300(ra) # 800083c0 <_Z9getStringPci>
    n = stringToInt(input);
    800088dc:	00048513          	mv	a0,s1
    800088e0:	00000097          	auipc	ra,0x0
    800088e4:	bb8080e7          	jalr	-1096(ra) # 80008498 <_Z11stringToIntPKc>
    800088e8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800088ec:	00003517          	auipc	a0,0x3
    800088f0:	c2450513          	addi	a0,a0,-988 # 8000b510 <CONSOLE_STATUS+0x500>
    800088f4:	00000097          	auipc	ra,0x0
    800088f8:	a44080e7          	jalr	-1468(ra) # 80008338 <_Z11printStringPKc>
    800088fc:	00000613          	li	a2,0
    80008900:	00a00593          	li	a1,10
    80008904:	00090513          	mv	a0,s2
    80008908:	00000097          	auipc	ra,0x0
    8000890c:	be0080e7          	jalr	-1056(ra) # 800084e8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80008910:	00003517          	auipc	a0,0x3
    80008914:	c1850513          	addi	a0,a0,-1000 # 8000b528 <CONSOLE_STATUS+0x518>
    80008918:	00000097          	auipc	ra,0x0
    8000891c:	a20080e7          	jalr	-1504(ra) # 80008338 <_Z11printStringPKc>
    80008920:	00000613          	li	a2,0
    80008924:	00a00593          	li	a1,10
    80008928:	00048513          	mv	a0,s1
    8000892c:	00000097          	auipc	ra,0x0
    80008930:	bbc080e7          	jalr	-1092(ra) # 800084e8 <_Z8printIntiii>
    printString(".\n");
    80008934:	00003517          	auipc	a0,0x3
    80008938:	c0c50513          	addi	a0,a0,-1012 # 8000b540 <CONSOLE_STATUS+0x530>
    8000893c:	00000097          	auipc	ra,0x0
    80008940:	9fc080e7          	jalr	-1540(ra) # 80008338 <_Z11printStringPKc>
    if(threadNum > n) {
    80008944:	0324c463          	blt	s1,s2,8000896c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80008948:	03205c63          	blez	s2,80008980 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000894c:	03800513          	li	a0,56
    80008950:	ffff9097          	auipc	ra,0xffff9
    80008954:	86c080e7          	jalr	-1940(ra) # 800011bc <_Znwm>
    80008958:	00050a93          	mv	s5,a0
    8000895c:	00048593          	mv	a1,s1
    80008960:	fffff097          	auipc	ra,0xfffff
    80008964:	abc080e7          	jalr	-1348(ra) # 8000741c <_ZN9BufferCPPC1Ei>
    80008968:	0300006f          	j	80008998 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000896c:	00003517          	auipc	a0,0x3
    80008970:	bdc50513          	addi	a0,a0,-1060 # 8000b548 <CONSOLE_STATUS+0x538>
    80008974:	00000097          	auipc	ra,0x0
    80008978:	9c4080e7          	jalr	-1596(ra) # 80008338 <_Z11printStringPKc>
        return;
    8000897c:	0140006f          	j	80008990 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80008980:	00003517          	auipc	a0,0x3
    80008984:	c0850513          	addi	a0,a0,-1016 # 8000b588 <CONSOLE_STATUS+0x578>
    80008988:	00000097          	auipc	ra,0x0
    8000898c:	9b0080e7          	jalr	-1616(ra) # 80008338 <_Z11printStringPKc>
        return;
    80008990:	000b8113          	mv	sp,s7
    80008994:	2380006f          	j	80008bcc <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80008998:	01000513          	li	a0,16
    8000899c:	ffff9097          	auipc	ra,0xffff9
    800089a0:	820080e7          	jalr	-2016(ra) # 800011bc <_Znwm>
    800089a4:	00050493          	mv	s1,a0
    800089a8:	00000593          	li	a1,0
    800089ac:	ffff9097          	auipc	ra,0xffff9
    800089b0:	a28080e7          	jalr	-1496(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800089b4:	00006797          	auipc	a5,0x6
    800089b8:	8297b223          	sd	s1,-2012(a5) # 8000e1d8 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800089bc:	00391793          	slli	a5,s2,0x3
    800089c0:	00f78793          	addi	a5,a5,15
    800089c4:	ff07f793          	andi	a5,a5,-16
    800089c8:	40f10133          	sub	sp,sp,a5
    800089cc:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800089d0:	0019071b          	addiw	a4,s2,1
    800089d4:	00171793          	slli	a5,a4,0x1
    800089d8:	00e787b3          	add	a5,a5,a4
    800089dc:	00379793          	slli	a5,a5,0x3
    800089e0:	00f78793          	addi	a5,a5,15
    800089e4:	ff07f793          	andi	a5,a5,-16
    800089e8:	40f10133          	sub	sp,sp,a5
    800089ec:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800089f0:	00191c13          	slli	s8,s2,0x1
    800089f4:	012c07b3          	add	a5,s8,s2
    800089f8:	00379793          	slli	a5,a5,0x3
    800089fc:	00fa07b3          	add	a5,s4,a5
    80008a00:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80008a04:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80008a08:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80008a0c:	02800513          	li	a0,40
    80008a10:	ffff8097          	auipc	ra,0xffff8
    80008a14:	7ac080e7          	jalr	1964(ra) # 800011bc <_Znwm>
    80008a18:	00050b13          	mv	s6,a0
    80008a1c:	012c0c33          	add	s8,s8,s2
    80008a20:	003c1c13          	slli	s8,s8,0x3
    80008a24:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80008a28:	ffff9097          	auipc	ra,0xffff9
    80008a2c:	978080e7          	jalr	-1672(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80008a30:	00005797          	auipc	a5,0x5
    80008a34:	67078793          	addi	a5,a5,1648 # 8000e0a0 <_ZTV12ConsumerSync+0x10>
    80008a38:	00fb3023          	sd	a5,0(s6)
    80008a3c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80008a40:	000b0513          	mv	a0,s6
    80008a44:	ffff9097          	auipc	ra,0xffff9
    80008a48:	874080e7          	jalr	-1932(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80008a4c:	00000493          	li	s1,0
    80008a50:	0380006f          	j	80008a88 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80008a54:	00005797          	auipc	a5,0x5
    80008a58:	62478793          	addi	a5,a5,1572 # 8000e078 <_ZTV12ProducerSync+0x10>
    80008a5c:	00fcb023          	sd	a5,0(s9)
    80008a60:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80008a64:	00349793          	slli	a5,s1,0x3
    80008a68:	00f987b3          	add	a5,s3,a5
    80008a6c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80008a70:	00349793          	slli	a5,s1,0x3
    80008a74:	00f987b3          	add	a5,s3,a5
    80008a78:	0007b503          	ld	a0,0(a5)
    80008a7c:	ffff9097          	auipc	ra,0xffff9
    80008a80:	83c080e7          	jalr	-1988(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80008a84:	0014849b          	addiw	s1,s1,1
    80008a88:	0b24d063          	bge	s1,s2,80008b28 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80008a8c:	00149793          	slli	a5,s1,0x1
    80008a90:	009787b3          	add	a5,a5,s1
    80008a94:	00379793          	slli	a5,a5,0x3
    80008a98:	00fa07b3          	add	a5,s4,a5
    80008a9c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80008aa0:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80008aa4:	00005717          	auipc	a4,0x5
    80008aa8:	73473703          	ld	a4,1844(a4) # 8000e1d8 <_ZL10waitForAll>
    80008aac:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80008ab0:	02905863          	blez	s1,80008ae0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80008ab4:	02800513          	li	a0,40
    80008ab8:	ffff8097          	auipc	ra,0xffff8
    80008abc:	704080e7          	jalr	1796(ra) # 800011bc <_Znwm>
    80008ac0:	00050c93          	mv	s9,a0
    80008ac4:	00149c13          	slli	s8,s1,0x1
    80008ac8:	009c0c33          	add	s8,s8,s1
    80008acc:	003c1c13          	slli	s8,s8,0x3
    80008ad0:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80008ad4:	ffff9097          	auipc	ra,0xffff9
    80008ad8:	8cc080e7          	jalr	-1844(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80008adc:	f79ff06f          	j	80008a54 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80008ae0:	02800513          	li	a0,40
    80008ae4:	ffff8097          	auipc	ra,0xffff8
    80008ae8:	6d8080e7          	jalr	1752(ra) # 800011bc <_Znwm>
    80008aec:	00050c93          	mv	s9,a0
    80008af0:	00149c13          	slli	s8,s1,0x1
    80008af4:	009c0c33          	add	s8,s8,s1
    80008af8:	003c1c13          	slli	s8,s8,0x3
    80008afc:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80008b00:	ffff9097          	auipc	ra,0xffff9
    80008b04:	8a0080e7          	jalr	-1888(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80008b08:	00005797          	auipc	a5,0x5
    80008b0c:	54878793          	addi	a5,a5,1352 # 8000e050 <_ZTV16ProducerKeyboard+0x10>
    80008b10:	00fcb023          	sd	a5,0(s9)
    80008b14:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80008b18:	00349793          	slli	a5,s1,0x3
    80008b1c:	00f987b3          	add	a5,s3,a5
    80008b20:	0197b023          	sd	s9,0(a5)
    80008b24:	f4dff06f          	j	80008a70 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80008b28:	ffff8097          	auipc	ra,0xffff8
    80008b2c:	7f0080e7          	jalr	2032(ra) # 80001318 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80008b30:	00000493          	li	s1,0
    80008b34:	00994e63          	blt	s2,s1,80008b50 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80008b38:	00005517          	auipc	a0,0x5
    80008b3c:	6a053503          	ld	a0,1696(a0) # 8000e1d8 <_ZL10waitForAll>
    80008b40:	ffff9097          	auipc	ra,0xffff9
    80008b44:	8cc080e7          	jalr	-1844(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80008b48:	0014849b          	addiw	s1,s1,1
    80008b4c:	fe9ff06f          	j	80008b34 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80008b50:	00000493          	li	s1,0
    80008b54:	0080006f          	j	80008b5c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80008b58:	0014849b          	addiw	s1,s1,1
    80008b5c:	0324d263          	bge	s1,s2,80008b80 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80008b60:	00349793          	slli	a5,s1,0x3
    80008b64:	00f987b3          	add	a5,s3,a5
    80008b68:	0007b503          	ld	a0,0(a5)
    80008b6c:	fe0506e3          	beqz	a0,80008b58 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80008b70:	00053783          	ld	a5,0(a0)
    80008b74:	0087b783          	ld	a5,8(a5)
    80008b78:	000780e7          	jalr	a5
    80008b7c:	fddff06f          	j	80008b58 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80008b80:	000b0a63          	beqz	s6,80008b94 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80008b84:	000b3783          	ld	a5,0(s6)
    80008b88:	0087b783          	ld	a5,8(a5)
    80008b8c:	000b0513          	mv	a0,s6
    80008b90:	000780e7          	jalr	a5
    delete waitForAll;
    80008b94:	00005517          	auipc	a0,0x5
    80008b98:	64453503          	ld	a0,1604(a0) # 8000e1d8 <_ZL10waitForAll>
    80008b9c:	00050863          	beqz	a0,80008bac <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80008ba0:	00053783          	ld	a5,0(a0)
    80008ba4:	0087b783          	ld	a5,8(a5)
    80008ba8:	000780e7          	jalr	a5
    delete buffer;
    80008bac:	000a8e63          	beqz	s5,80008bc8 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80008bb0:	000a8513          	mv	a0,s5
    80008bb4:	fffff097          	auipc	ra,0xfffff
    80008bb8:	b60080e7          	jalr	-1184(ra) # 80007714 <_ZN9BufferCPPD1Ev>
    80008bbc:	000a8513          	mv	a0,s5
    80008bc0:	ffff8097          	auipc	ra,0xffff8
    80008bc4:	624080e7          	jalr	1572(ra) # 800011e4 <_ZdlPv>
    80008bc8:	000b8113          	mv	sp,s7

}
    80008bcc:	f8040113          	addi	sp,s0,-128
    80008bd0:	07813083          	ld	ra,120(sp)
    80008bd4:	07013403          	ld	s0,112(sp)
    80008bd8:	06813483          	ld	s1,104(sp)
    80008bdc:	06013903          	ld	s2,96(sp)
    80008be0:	05813983          	ld	s3,88(sp)
    80008be4:	05013a03          	ld	s4,80(sp)
    80008be8:	04813a83          	ld	s5,72(sp)
    80008bec:	04013b03          	ld	s6,64(sp)
    80008bf0:	03813b83          	ld	s7,56(sp)
    80008bf4:	03013c03          	ld	s8,48(sp)
    80008bf8:	02813c83          	ld	s9,40(sp)
    80008bfc:	08010113          	addi	sp,sp,128
    80008c00:	00008067          	ret
    80008c04:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80008c08:	000a8513          	mv	a0,s5
    80008c0c:	ffff8097          	auipc	ra,0xffff8
    80008c10:	5d8080e7          	jalr	1496(ra) # 800011e4 <_ZdlPv>
    80008c14:	00048513          	mv	a0,s1
    80008c18:	00006097          	auipc	ra,0x6
    80008c1c:	690080e7          	jalr	1680(ra) # 8000f2a8 <_Unwind_Resume>
    80008c20:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80008c24:	00048513          	mv	a0,s1
    80008c28:	ffff8097          	auipc	ra,0xffff8
    80008c2c:	5bc080e7          	jalr	1468(ra) # 800011e4 <_ZdlPv>
    80008c30:	00090513          	mv	a0,s2
    80008c34:	00006097          	auipc	ra,0x6
    80008c38:	674080e7          	jalr	1652(ra) # 8000f2a8 <_Unwind_Resume>
    80008c3c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80008c40:	000b0513          	mv	a0,s6
    80008c44:	ffff8097          	auipc	ra,0xffff8
    80008c48:	5a0080e7          	jalr	1440(ra) # 800011e4 <_ZdlPv>
    80008c4c:	00048513          	mv	a0,s1
    80008c50:	00006097          	auipc	ra,0x6
    80008c54:	658080e7          	jalr	1624(ra) # 8000f2a8 <_Unwind_Resume>
    80008c58:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80008c5c:	000c8513          	mv	a0,s9
    80008c60:	ffff8097          	auipc	ra,0xffff8
    80008c64:	584080e7          	jalr	1412(ra) # 800011e4 <_ZdlPv>
    80008c68:	00048513          	mv	a0,s1
    80008c6c:	00006097          	auipc	ra,0x6
    80008c70:	63c080e7          	jalr	1596(ra) # 8000f2a8 <_Unwind_Resume>
    80008c74:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80008c78:	000c8513          	mv	a0,s9
    80008c7c:	ffff8097          	auipc	ra,0xffff8
    80008c80:	568080e7          	jalr	1384(ra) # 800011e4 <_ZdlPv>
    80008c84:	00048513          	mv	a0,s1
    80008c88:	00006097          	auipc	ra,0x6
    80008c8c:	620080e7          	jalr	1568(ra) # 8000f2a8 <_Unwind_Resume>

0000000080008c90 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80008c90:	ff010113          	addi	sp,sp,-16
    80008c94:	00113423          	sd	ra,8(sp)
    80008c98:	00813023          	sd	s0,0(sp)
    80008c9c:	01010413          	addi	s0,sp,16
    80008ca0:	00005797          	auipc	a5,0x5
    80008ca4:	40078793          	addi	a5,a5,1024 # 8000e0a0 <_ZTV12ConsumerSync+0x10>
    80008ca8:	00f53023          	sd	a5,0(a0)
    80008cac:	ffff8097          	auipc	ra,0xffff8
    80008cb0:	4a0080e7          	jalr	1184(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008cb4:	00813083          	ld	ra,8(sp)
    80008cb8:	00013403          	ld	s0,0(sp)
    80008cbc:	01010113          	addi	sp,sp,16
    80008cc0:	00008067          	ret

0000000080008cc4 <_ZN12ConsumerSyncD0Ev>:
    80008cc4:	fe010113          	addi	sp,sp,-32
    80008cc8:	00113c23          	sd	ra,24(sp)
    80008ccc:	00813823          	sd	s0,16(sp)
    80008cd0:	00913423          	sd	s1,8(sp)
    80008cd4:	02010413          	addi	s0,sp,32
    80008cd8:	00050493          	mv	s1,a0
    80008cdc:	00005797          	auipc	a5,0x5
    80008ce0:	3c478793          	addi	a5,a5,964 # 8000e0a0 <_ZTV12ConsumerSync+0x10>
    80008ce4:	00f53023          	sd	a5,0(a0)
    80008ce8:	ffff8097          	auipc	ra,0xffff8
    80008cec:	464080e7          	jalr	1124(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008cf0:	00048513          	mv	a0,s1
    80008cf4:	ffff8097          	auipc	ra,0xffff8
    80008cf8:	4f0080e7          	jalr	1264(ra) # 800011e4 <_ZdlPv>
    80008cfc:	01813083          	ld	ra,24(sp)
    80008d00:	01013403          	ld	s0,16(sp)
    80008d04:	00813483          	ld	s1,8(sp)
    80008d08:	02010113          	addi	sp,sp,32
    80008d0c:	00008067          	ret

0000000080008d10 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80008d10:	ff010113          	addi	sp,sp,-16
    80008d14:	00113423          	sd	ra,8(sp)
    80008d18:	00813023          	sd	s0,0(sp)
    80008d1c:	01010413          	addi	s0,sp,16
    80008d20:	00005797          	auipc	a5,0x5
    80008d24:	35878793          	addi	a5,a5,856 # 8000e078 <_ZTV12ProducerSync+0x10>
    80008d28:	00f53023          	sd	a5,0(a0)
    80008d2c:	ffff8097          	auipc	ra,0xffff8
    80008d30:	420080e7          	jalr	1056(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008d34:	00813083          	ld	ra,8(sp)
    80008d38:	00013403          	ld	s0,0(sp)
    80008d3c:	01010113          	addi	sp,sp,16
    80008d40:	00008067          	ret

0000000080008d44 <_ZN12ProducerSyncD0Ev>:
    80008d44:	fe010113          	addi	sp,sp,-32
    80008d48:	00113c23          	sd	ra,24(sp)
    80008d4c:	00813823          	sd	s0,16(sp)
    80008d50:	00913423          	sd	s1,8(sp)
    80008d54:	02010413          	addi	s0,sp,32
    80008d58:	00050493          	mv	s1,a0
    80008d5c:	00005797          	auipc	a5,0x5
    80008d60:	31c78793          	addi	a5,a5,796 # 8000e078 <_ZTV12ProducerSync+0x10>
    80008d64:	00f53023          	sd	a5,0(a0)
    80008d68:	ffff8097          	auipc	ra,0xffff8
    80008d6c:	3e4080e7          	jalr	996(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008d70:	00048513          	mv	a0,s1
    80008d74:	ffff8097          	auipc	ra,0xffff8
    80008d78:	470080e7          	jalr	1136(ra) # 800011e4 <_ZdlPv>
    80008d7c:	01813083          	ld	ra,24(sp)
    80008d80:	01013403          	ld	s0,16(sp)
    80008d84:	00813483          	ld	s1,8(sp)
    80008d88:	02010113          	addi	sp,sp,32
    80008d8c:	00008067          	ret

0000000080008d90 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80008d90:	ff010113          	addi	sp,sp,-16
    80008d94:	00113423          	sd	ra,8(sp)
    80008d98:	00813023          	sd	s0,0(sp)
    80008d9c:	01010413          	addi	s0,sp,16
    80008da0:	00005797          	auipc	a5,0x5
    80008da4:	2b078793          	addi	a5,a5,688 # 8000e050 <_ZTV16ProducerKeyboard+0x10>
    80008da8:	00f53023          	sd	a5,0(a0)
    80008dac:	ffff8097          	auipc	ra,0xffff8
    80008db0:	3a0080e7          	jalr	928(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008db4:	00813083          	ld	ra,8(sp)
    80008db8:	00013403          	ld	s0,0(sp)
    80008dbc:	01010113          	addi	sp,sp,16
    80008dc0:	00008067          	ret

0000000080008dc4 <_ZN16ProducerKeyboardD0Ev>:
    80008dc4:	fe010113          	addi	sp,sp,-32
    80008dc8:	00113c23          	sd	ra,24(sp)
    80008dcc:	00813823          	sd	s0,16(sp)
    80008dd0:	00913423          	sd	s1,8(sp)
    80008dd4:	02010413          	addi	s0,sp,32
    80008dd8:	00050493          	mv	s1,a0
    80008ddc:	00005797          	auipc	a5,0x5
    80008de0:	27478793          	addi	a5,a5,628 # 8000e050 <_ZTV16ProducerKeyboard+0x10>
    80008de4:	00f53023          	sd	a5,0(a0)
    80008de8:	ffff8097          	auipc	ra,0xffff8
    80008dec:	364080e7          	jalr	868(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008df0:	00048513          	mv	a0,s1
    80008df4:	ffff8097          	auipc	ra,0xffff8
    80008df8:	3f0080e7          	jalr	1008(ra) # 800011e4 <_ZdlPv>
    80008dfc:	01813083          	ld	ra,24(sp)
    80008e00:	01013403          	ld	s0,16(sp)
    80008e04:	00813483          	ld	s1,8(sp)
    80008e08:	02010113          	addi	sp,sp,32
    80008e0c:	00008067          	ret

0000000080008e10 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80008e10:	ff010113          	addi	sp,sp,-16
    80008e14:	00113423          	sd	ra,8(sp)
    80008e18:	00813023          	sd	s0,0(sp)
    80008e1c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80008e20:	02053583          	ld	a1,32(a0)
    80008e24:	fffff097          	auipc	ra,0xfffff
    80008e28:	7e4080e7          	jalr	2020(ra) # 80008608 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80008e2c:	00813083          	ld	ra,8(sp)
    80008e30:	00013403          	ld	s0,0(sp)
    80008e34:	01010113          	addi	sp,sp,16
    80008e38:	00008067          	ret

0000000080008e3c <_ZN12ProducerSync3runEv>:
    void run() override {
    80008e3c:	ff010113          	addi	sp,sp,-16
    80008e40:	00113423          	sd	ra,8(sp)
    80008e44:	00813023          	sd	s0,0(sp)
    80008e48:	01010413          	addi	s0,sp,16
        producer(td);
    80008e4c:	02053583          	ld	a1,32(a0)
    80008e50:	00000097          	auipc	ra,0x0
    80008e54:	878080e7          	jalr	-1928(ra) # 800086c8 <_ZN12ProducerSync8producerEPv>
    }
    80008e58:	00813083          	ld	ra,8(sp)
    80008e5c:	00013403          	ld	s0,0(sp)
    80008e60:	01010113          	addi	sp,sp,16
    80008e64:	00008067          	ret

0000000080008e68 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80008e68:	ff010113          	addi	sp,sp,-16
    80008e6c:	00113423          	sd	ra,8(sp)
    80008e70:	00813023          	sd	s0,0(sp)
    80008e74:	01010413          	addi	s0,sp,16
        consumer(td);
    80008e78:	02053583          	ld	a1,32(a0)
    80008e7c:	00000097          	auipc	ra,0x0
    80008e80:	8e0080e7          	jalr	-1824(ra) # 8000875c <_ZN12ConsumerSync8consumerEPv>
    }
    80008e84:	00813083          	ld	ra,8(sp)
    80008e88:	00013403          	ld	s0,0(sp)
    80008e8c:	01010113          	addi	sp,sp,16
    80008e90:	00008067          	ret

0000000080008e94 <start>:
    80008e94:	ff010113          	addi	sp,sp,-16
    80008e98:	00813423          	sd	s0,8(sp)
    80008e9c:	01010413          	addi	s0,sp,16
    80008ea0:	300027f3          	csrr	a5,mstatus
    80008ea4:	ffffe737          	lui	a4,0xffffe
    80008ea8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffef3bf>
    80008eac:	00e7f7b3          	and	a5,a5,a4
    80008eb0:	00001737          	lui	a4,0x1
    80008eb4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80008eb8:	00e7e7b3          	or	a5,a5,a4
    80008ebc:	30079073          	csrw	mstatus,a5
    80008ec0:	00000797          	auipc	a5,0x0
    80008ec4:	16078793          	addi	a5,a5,352 # 80009020 <system_main>
    80008ec8:	34179073          	csrw	mepc,a5
    80008ecc:	00000793          	li	a5,0
    80008ed0:	18079073          	csrw	satp,a5
    80008ed4:	000107b7          	lui	a5,0x10
    80008ed8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80008edc:	30279073          	csrw	medeleg,a5
    80008ee0:	30379073          	csrw	mideleg,a5
    80008ee4:	104027f3          	csrr	a5,sie
    80008ee8:	2227e793          	ori	a5,a5,546
    80008eec:	10479073          	csrw	sie,a5
    80008ef0:	fff00793          	li	a5,-1
    80008ef4:	00a7d793          	srli	a5,a5,0xa
    80008ef8:	3b079073          	csrw	pmpaddr0,a5
    80008efc:	00f00793          	li	a5,15
    80008f00:	3a079073          	csrw	pmpcfg0,a5
    80008f04:	f14027f3          	csrr	a5,mhartid
    80008f08:	0200c737          	lui	a4,0x200c
    80008f0c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80008f10:	0007869b          	sext.w	a3,a5
    80008f14:	00269713          	slli	a4,a3,0x2
    80008f18:	000f4637          	lui	a2,0xf4
    80008f1c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80008f20:	00d70733          	add	a4,a4,a3
    80008f24:	0037979b          	slliw	a5,a5,0x3
    80008f28:	020046b7          	lui	a3,0x2004
    80008f2c:	00d787b3          	add	a5,a5,a3
    80008f30:	00c585b3          	add	a1,a1,a2
    80008f34:	00371693          	slli	a3,a4,0x3
    80008f38:	00005717          	auipc	a4,0x5
    80008f3c:	2a870713          	addi	a4,a4,680 # 8000e1e0 <timer_scratch>
    80008f40:	00b7b023          	sd	a1,0(a5)
    80008f44:	00d70733          	add	a4,a4,a3
    80008f48:	00f73c23          	sd	a5,24(a4)
    80008f4c:	02c73023          	sd	a2,32(a4)
    80008f50:	34071073          	csrw	mscratch,a4
    80008f54:	00000797          	auipc	a5,0x0
    80008f58:	6ec78793          	addi	a5,a5,1772 # 80009640 <timervec>
    80008f5c:	30579073          	csrw	mtvec,a5
    80008f60:	300027f3          	csrr	a5,mstatus
    80008f64:	0087e793          	ori	a5,a5,8
    80008f68:	30079073          	csrw	mstatus,a5
    80008f6c:	304027f3          	csrr	a5,mie
    80008f70:	0807e793          	ori	a5,a5,128
    80008f74:	30479073          	csrw	mie,a5
    80008f78:	f14027f3          	csrr	a5,mhartid
    80008f7c:	0007879b          	sext.w	a5,a5
    80008f80:	00078213          	mv	tp,a5
    80008f84:	30200073          	mret
    80008f88:	00813403          	ld	s0,8(sp)
    80008f8c:	01010113          	addi	sp,sp,16
    80008f90:	00008067          	ret

0000000080008f94 <timerinit>:
    80008f94:	ff010113          	addi	sp,sp,-16
    80008f98:	00813423          	sd	s0,8(sp)
    80008f9c:	01010413          	addi	s0,sp,16
    80008fa0:	f14027f3          	csrr	a5,mhartid
    80008fa4:	0200c737          	lui	a4,0x200c
    80008fa8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80008fac:	0007869b          	sext.w	a3,a5
    80008fb0:	00269713          	slli	a4,a3,0x2
    80008fb4:	000f4637          	lui	a2,0xf4
    80008fb8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80008fbc:	00d70733          	add	a4,a4,a3
    80008fc0:	0037979b          	slliw	a5,a5,0x3
    80008fc4:	020046b7          	lui	a3,0x2004
    80008fc8:	00d787b3          	add	a5,a5,a3
    80008fcc:	00c585b3          	add	a1,a1,a2
    80008fd0:	00371693          	slli	a3,a4,0x3
    80008fd4:	00005717          	auipc	a4,0x5
    80008fd8:	20c70713          	addi	a4,a4,524 # 8000e1e0 <timer_scratch>
    80008fdc:	00b7b023          	sd	a1,0(a5)
    80008fe0:	00d70733          	add	a4,a4,a3
    80008fe4:	00f73c23          	sd	a5,24(a4)
    80008fe8:	02c73023          	sd	a2,32(a4)
    80008fec:	34071073          	csrw	mscratch,a4
    80008ff0:	00000797          	auipc	a5,0x0
    80008ff4:	65078793          	addi	a5,a5,1616 # 80009640 <timervec>
    80008ff8:	30579073          	csrw	mtvec,a5
    80008ffc:	300027f3          	csrr	a5,mstatus
    80009000:	0087e793          	ori	a5,a5,8
    80009004:	30079073          	csrw	mstatus,a5
    80009008:	304027f3          	csrr	a5,mie
    8000900c:	0807e793          	ori	a5,a5,128
    80009010:	30479073          	csrw	mie,a5
    80009014:	00813403          	ld	s0,8(sp)
    80009018:	01010113          	addi	sp,sp,16
    8000901c:	00008067          	ret

0000000080009020 <system_main>:
    80009020:	fe010113          	addi	sp,sp,-32
    80009024:	00813823          	sd	s0,16(sp)
    80009028:	00913423          	sd	s1,8(sp)
    8000902c:	00113c23          	sd	ra,24(sp)
    80009030:	02010413          	addi	s0,sp,32
    80009034:	00000097          	auipc	ra,0x0
    80009038:	0c4080e7          	jalr	196(ra) # 800090f8 <cpuid>
    8000903c:	00005497          	auipc	s1,0x5
    80009040:	0e448493          	addi	s1,s1,228 # 8000e120 <started>
    80009044:	02050263          	beqz	a0,80009068 <system_main+0x48>
    80009048:	0004a783          	lw	a5,0(s1)
    8000904c:	0007879b          	sext.w	a5,a5
    80009050:	fe078ce3          	beqz	a5,80009048 <system_main+0x28>
    80009054:	0ff0000f          	fence
    80009058:	00003517          	auipc	a0,0x3
    8000905c:	9a850513          	addi	a0,a0,-1624 # 8000ba00 <CONSOLE_STATUS+0x9f0>
    80009060:	00001097          	auipc	ra,0x1
    80009064:	a7c080e7          	jalr	-1412(ra) # 80009adc <panic>
    80009068:	00001097          	auipc	ra,0x1
    8000906c:	9d0080e7          	jalr	-1584(ra) # 80009a38 <consoleinit>
    80009070:	00001097          	auipc	ra,0x1
    80009074:	15c080e7          	jalr	348(ra) # 8000a1cc <printfinit>
    80009078:	00003517          	auipc	a0,0x3
    8000907c:	80850513          	addi	a0,a0,-2040 # 8000b880 <CONSOLE_STATUS+0x870>
    80009080:	00001097          	auipc	ra,0x1
    80009084:	ab8080e7          	jalr	-1352(ra) # 80009b38 <__printf>
    80009088:	00003517          	auipc	a0,0x3
    8000908c:	94850513          	addi	a0,a0,-1720 # 8000b9d0 <CONSOLE_STATUS+0x9c0>
    80009090:	00001097          	auipc	ra,0x1
    80009094:	aa8080e7          	jalr	-1368(ra) # 80009b38 <__printf>
    80009098:	00002517          	auipc	a0,0x2
    8000909c:	7e850513          	addi	a0,a0,2024 # 8000b880 <CONSOLE_STATUS+0x870>
    800090a0:	00001097          	auipc	ra,0x1
    800090a4:	a98080e7          	jalr	-1384(ra) # 80009b38 <__printf>
    800090a8:	00001097          	auipc	ra,0x1
    800090ac:	4b0080e7          	jalr	1200(ra) # 8000a558 <kinit>
    800090b0:	00000097          	auipc	ra,0x0
    800090b4:	148080e7          	jalr	328(ra) # 800091f8 <trapinit>
    800090b8:	00000097          	auipc	ra,0x0
    800090bc:	16c080e7          	jalr	364(ra) # 80009224 <trapinithart>
    800090c0:	00000097          	auipc	ra,0x0
    800090c4:	5c0080e7          	jalr	1472(ra) # 80009680 <plicinit>
    800090c8:	00000097          	auipc	ra,0x0
    800090cc:	5e0080e7          	jalr	1504(ra) # 800096a8 <plicinithart>
    800090d0:	00000097          	auipc	ra,0x0
    800090d4:	078080e7          	jalr	120(ra) # 80009148 <userinit>
    800090d8:	0ff0000f          	fence
    800090dc:	00100793          	li	a5,1
    800090e0:	00003517          	auipc	a0,0x3
    800090e4:	90850513          	addi	a0,a0,-1784 # 8000b9e8 <CONSOLE_STATUS+0x9d8>
    800090e8:	00f4a023          	sw	a5,0(s1)
    800090ec:	00001097          	auipc	ra,0x1
    800090f0:	a4c080e7          	jalr	-1460(ra) # 80009b38 <__printf>
    800090f4:	0000006f          	j	800090f4 <system_main+0xd4>

00000000800090f8 <cpuid>:
    800090f8:	ff010113          	addi	sp,sp,-16
    800090fc:	00813423          	sd	s0,8(sp)
    80009100:	01010413          	addi	s0,sp,16
    80009104:	00020513          	mv	a0,tp
    80009108:	00813403          	ld	s0,8(sp)
    8000910c:	0005051b          	sext.w	a0,a0
    80009110:	01010113          	addi	sp,sp,16
    80009114:	00008067          	ret

0000000080009118 <mycpu>:
    80009118:	ff010113          	addi	sp,sp,-16
    8000911c:	00813423          	sd	s0,8(sp)
    80009120:	01010413          	addi	s0,sp,16
    80009124:	00020793          	mv	a5,tp
    80009128:	00813403          	ld	s0,8(sp)
    8000912c:	0007879b          	sext.w	a5,a5
    80009130:	00779793          	slli	a5,a5,0x7
    80009134:	00006517          	auipc	a0,0x6
    80009138:	0dc50513          	addi	a0,a0,220 # 8000f210 <cpus>
    8000913c:	00f50533          	add	a0,a0,a5
    80009140:	01010113          	addi	sp,sp,16
    80009144:	00008067          	ret

0000000080009148 <userinit>:
    80009148:	ff010113          	addi	sp,sp,-16
    8000914c:	00813423          	sd	s0,8(sp)
    80009150:	01010413          	addi	s0,sp,16
    80009154:	00813403          	ld	s0,8(sp)
    80009158:	01010113          	addi	sp,sp,16
    8000915c:	ffff9317          	auipc	t1,0xffff9
    80009160:	bc830067          	jr	-1080(t1) # 80001d24 <main>

0000000080009164 <either_copyout>:
    80009164:	ff010113          	addi	sp,sp,-16
    80009168:	00813023          	sd	s0,0(sp)
    8000916c:	00113423          	sd	ra,8(sp)
    80009170:	01010413          	addi	s0,sp,16
    80009174:	02051663          	bnez	a0,800091a0 <either_copyout+0x3c>
    80009178:	00058513          	mv	a0,a1
    8000917c:	00060593          	mv	a1,a2
    80009180:	0006861b          	sext.w	a2,a3
    80009184:	00002097          	auipc	ra,0x2
    80009188:	c60080e7          	jalr	-928(ra) # 8000ade4 <__memmove>
    8000918c:	00813083          	ld	ra,8(sp)
    80009190:	00013403          	ld	s0,0(sp)
    80009194:	00000513          	li	a0,0
    80009198:	01010113          	addi	sp,sp,16
    8000919c:	00008067          	ret
    800091a0:	00003517          	auipc	a0,0x3
    800091a4:	88850513          	addi	a0,a0,-1912 # 8000ba28 <CONSOLE_STATUS+0xa18>
    800091a8:	00001097          	auipc	ra,0x1
    800091ac:	934080e7          	jalr	-1740(ra) # 80009adc <panic>

00000000800091b0 <either_copyin>:
    800091b0:	ff010113          	addi	sp,sp,-16
    800091b4:	00813023          	sd	s0,0(sp)
    800091b8:	00113423          	sd	ra,8(sp)
    800091bc:	01010413          	addi	s0,sp,16
    800091c0:	02059463          	bnez	a1,800091e8 <either_copyin+0x38>
    800091c4:	00060593          	mv	a1,a2
    800091c8:	0006861b          	sext.w	a2,a3
    800091cc:	00002097          	auipc	ra,0x2
    800091d0:	c18080e7          	jalr	-1000(ra) # 8000ade4 <__memmove>
    800091d4:	00813083          	ld	ra,8(sp)
    800091d8:	00013403          	ld	s0,0(sp)
    800091dc:	00000513          	li	a0,0
    800091e0:	01010113          	addi	sp,sp,16
    800091e4:	00008067          	ret
    800091e8:	00003517          	auipc	a0,0x3
    800091ec:	86850513          	addi	a0,a0,-1944 # 8000ba50 <CONSOLE_STATUS+0xa40>
    800091f0:	00001097          	auipc	ra,0x1
    800091f4:	8ec080e7          	jalr	-1812(ra) # 80009adc <panic>

00000000800091f8 <trapinit>:
    800091f8:	ff010113          	addi	sp,sp,-16
    800091fc:	00813423          	sd	s0,8(sp)
    80009200:	01010413          	addi	s0,sp,16
    80009204:	00813403          	ld	s0,8(sp)
    80009208:	00003597          	auipc	a1,0x3
    8000920c:	87058593          	addi	a1,a1,-1936 # 8000ba78 <CONSOLE_STATUS+0xa68>
    80009210:	00006517          	auipc	a0,0x6
    80009214:	08050513          	addi	a0,a0,128 # 8000f290 <tickslock>
    80009218:	01010113          	addi	sp,sp,16
    8000921c:	00001317          	auipc	t1,0x1
    80009220:	5cc30067          	jr	1484(t1) # 8000a7e8 <initlock>

0000000080009224 <trapinithart>:
    80009224:	ff010113          	addi	sp,sp,-16
    80009228:	00813423          	sd	s0,8(sp)
    8000922c:	01010413          	addi	s0,sp,16
    80009230:	00000797          	auipc	a5,0x0
    80009234:	30078793          	addi	a5,a5,768 # 80009530 <kernelvec>
    80009238:	10579073          	csrw	stvec,a5
    8000923c:	00813403          	ld	s0,8(sp)
    80009240:	01010113          	addi	sp,sp,16
    80009244:	00008067          	ret

0000000080009248 <usertrap>:
    80009248:	ff010113          	addi	sp,sp,-16
    8000924c:	00813423          	sd	s0,8(sp)
    80009250:	01010413          	addi	s0,sp,16
    80009254:	00813403          	ld	s0,8(sp)
    80009258:	01010113          	addi	sp,sp,16
    8000925c:	00008067          	ret

0000000080009260 <usertrapret>:
    80009260:	ff010113          	addi	sp,sp,-16
    80009264:	00813423          	sd	s0,8(sp)
    80009268:	01010413          	addi	s0,sp,16
    8000926c:	00813403          	ld	s0,8(sp)
    80009270:	01010113          	addi	sp,sp,16
    80009274:	00008067          	ret

0000000080009278 <kerneltrap>:
    80009278:	fe010113          	addi	sp,sp,-32
    8000927c:	00813823          	sd	s0,16(sp)
    80009280:	00113c23          	sd	ra,24(sp)
    80009284:	00913423          	sd	s1,8(sp)
    80009288:	02010413          	addi	s0,sp,32
    8000928c:	142025f3          	csrr	a1,scause
    80009290:	100027f3          	csrr	a5,sstatus
    80009294:	0027f793          	andi	a5,a5,2
    80009298:	10079c63          	bnez	a5,800093b0 <kerneltrap+0x138>
    8000929c:	142027f3          	csrr	a5,scause
    800092a0:	0207ce63          	bltz	a5,800092dc <kerneltrap+0x64>
    800092a4:	00003517          	auipc	a0,0x3
    800092a8:	81c50513          	addi	a0,a0,-2020 # 8000bac0 <CONSOLE_STATUS+0xab0>
    800092ac:	00001097          	auipc	ra,0x1
    800092b0:	88c080e7          	jalr	-1908(ra) # 80009b38 <__printf>
    800092b4:	141025f3          	csrr	a1,sepc
    800092b8:	14302673          	csrr	a2,stval
    800092bc:	00003517          	auipc	a0,0x3
    800092c0:	81450513          	addi	a0,a0,-2028 # 8000bad0 <CONSOLE_STATUS+0xac0>
    800092c4:	00001097          	auipc	ra,0x1
    800092c8:	874080e7          	jalr	-1932(ra) # 80009b38 <__printf>
    800092cc:	00003517          	auipc	a0,0x3
    800092d0:	81c50513          	addi	a0,a0,-2020 # 8000bae8 <CONSOLE_STATUS+0xad8>
    800092d4:	00001097          	auipc	ra,0x1
    800092d8:	808080e7          	jalr	-2040(ra) # 80009adc <panic>
    800092dc:	0ff7f713          	andi	a4,a5,255
    800092e0:	00900693          	li	a3,9
    800092e4:	04d70063          	beq	a4,a3,80009324 <kerneltrap+0xac>
    800092e8:	fff00713          	li	a4,-1
    800092ec:	03f71713          	slli	a4,a4,0x3f
    800092f0:	00170713          	addi	a4,a4,1
    800092f4:	fae798e3          	bne	a5,a4,800092a4 <kerneltrap+0x2c>
    800092f8:	00000097          	auipc	ra,0x0
    800092fc:	e00080e7          	jalr	-512(ra) # 800090f8 <cpuid>
    80009300:	06050663          	beqz	a0,8000936c <kerneltrap+0xf4>
    80009304:	144027f3          	csrr	a5,sip
    80009308:	ffd7f793          	andi	a5,a5,-3
    8000930c:	14479073          	csrw	sip,a5
    80009310:	01813083          	ld	ra,24(sp)
    80009314:	01013403          	ld	s0,16(sp)
    80009318:	00813483          	ld	s1,8(sp)
    8000931c:	02010113          	addi	sp,sp,32
    80009320:	00008067          	ret
    80009324:	00000097          	auipc	ra,0x0
    80009328:	3d0080e7          	jalr	976(ra) # 800096f4 <plic_claim>
    8000932c:	00a00793          	li	a5,10
    80009330:	00050493          	mv	s1,a0
    80009334:	06f50863          	beq	a0,a5,800093a4 <kerneltrap+0x12c>
    80009338:	fc050ce3          	beqz	a0,80009310 <kerneltrap+0x98>
    8000933c:	00050593          	mv	a1,a0
    80009340:	00002517          	auipc	a0,0x2
    80009344:	76050513          	addi	a0,a0,1888 # 8000baa0 <CONSOLE_STATUS+0xa90>
    80009348:	00000097          	auipc	ra,0x0
    8000934c:	7f0080e7          	jalr	2032(ra) # 80009b38 <__printf>
    80009350:	01013403          	ld	s0,16(sp)
    80009354:	01813083          	ld	ra,24(sp)
    80009358:	00048513          	mv	a0,s1
    8000935c:	00813483          	ld	s1,8(sp)
    80009360:	02010113          	addi	sp,sp,32
    80009364:	00000317          	auipc	t1,0x0
    80009368:	3c830067          	jr	968(t1) # 8000972c <plic_complete>
    8000936c:	00006517          	auipc	a0,0x6
    80009370:	f2450513          	addi	a0,a0,-220 # 8000f290 <tickslock>
    80009374:	00001097          	auipc	ra,0x1
    80009378:	498080e7          	jalr	1176(ra) # 8000a80c <acquire>
    8000937c:	00005717          	auipc	a4,0x5
    80009380:	da870713          	addi	a4,a4,-600 # 8000e124 <ticks>
    80009384:	00072783          	lw	a5,0(a4)
    80009388:	00006517          	auipc	a0,0x6
    8000938c:	f0850513          	addi	a0,a0,-248 # 8000f290 <tickslock>
    80009390:	0017879b          	addiw	a5,a5,1
    80009394:	00f72023          	sw	a5,0(a4)
    80009398:	00001097          	auipc	ra,0x1
    8000939c:	540080e7          	jalr	1344(ra) # 8000a8d8 <release>
    800093a0:	f65ff06f          	j	80009304 <kerneltrap+0x8c>
    800093a4:	00001097          	auipc	ra,0x1
    800093a8:	09c080e7          	jalr	156(ra) # 8000a440 <uartintr>
    800093ac:	fa5ff06f          	j	80009350 <kerneltrap+0xd8>
    800093b0:	00002517          	auipc	a0,0x2
    800093b4:	6d050513          	addi	a0,a0,1744 # 8000ba80 <CONSOLE_STATUS+0xa70>
    800093b8:	00000097          	auipc	ra,0x0
    800093bc:	724080e7          	jalr	1828(ra) # 80009adc <panic>

00000000800093c0 <clockintr>:
    800093c0:	fe010113          	addi	sp,sp,-32
    800093c4:	00813823          	sd	s0,16(sp)
    800093c8:	00913423          	sd	s1,8(sp)
    800093cc:	00113c23          	sd	ra,24(sp)
    800093d0:	02010413          	addi	s0,sp,32
    800093d4:	00006497          	auipc	s1,0x6
    800093d8:	ebc48493          	addi	s1,s1,-324 # 8000f290 <tickslock>
    800093dc:	00048513          	mv	a0,s1
    800093e0:	00001097          	auipc	ra,0x1
    800093e4:	42c080e7          	jalr	1068(ra) # 8000a80c <acquire>
    800093e8:	00005717          	auipc	a4,0x5
    800093ec:	d3c70713          	addi	a4,a4,-708 # 8000e124 <ticks>
    800093f0:	00072783          	lw	a5,0(a4)
    800093f4:	01013403          	ld	s0,16(sp)
    800093f8:	01813083          	ld	ra,24(sp)
    800093fc:	00048513          	mv	a0,s1
    80009400:	0017879b          	addiw	a5,a5,1
    80009404:	00813483          	ld	s1,8(sp)
    80009408:	00f72023          	sw	a5,0(a4)
    8000940c:	02010113          	addi	sp,sp,32
    80009410:	00001317          	auipc	t1,0x1
    80009414:	4c830067          	jr	1224(t1) # 8000a8d8 <release>

0000000080009418 <devintr>:
    80009418:	142027f3          	csrr	a5,scause
    8000941c:	00000513          	li	a0,0
    80009420:	0007c463          	bltz	a5,80009428 <devintr+0x10>
    80009424:	00008067          	ret
    80009428:	fe010113          	addi	sp,sp,-32
    8000942c:	00813823          	sd	s0,16(sp)
    80009430:	00113c23          	sd	ra,24(sp)
    80009434:	00913423          	sd	s1,8(sp)
    80009438:	02010413          	addi	s0,sp,32
    8000943c:	0ff7f713          	andi	a4,a5,255
    80009440:	00900693          	li	a3,9
    80009444:	04d70c63          	beq	a4,a3,8000949c <devintr+0x84>
    80009448:	fff00713          	li	a4,-1
    8000944c:	03f71713          	slli	a4,a4,0x3f
    80009450:	00170713          	addi	a4,a4,1
    80009454:	00e78c63          	beq	a5,a4,8000946c <devintr+0x54>
    80009458:	01813083          	ld	ra,24(sp)
    8000945c:	01013403          	ld	s0,16(sp)
    80009460:	00813483          	ld	s1,8(sp)
    80009464:	02010113          	addi	sp,sp,32
    80009468:	00008067          	ret
    8000946c:	00000097          	auipc	ra,0x0
    80009470:	c8c080e7          	jalr	-884(ra) # 800090f8 <cpuid>
    80009474:	06050663          	beqz	a0,800094e0 <devintr+0xc8>
    80009478:	144027f3          	csrr	a5,sip
    8000947c:	ffd7f793          	andi	a5,a5,-3
    80009480:	14479073          	csrw	sip,a5
    80009484:	01813083          	ld	ra,24(sp)
    80009488:	01013403          	ld	s0,16(sp)
    8000948c:	00813483          	ld	s1,8(sp)
    80009490:	00200513          	li	a0,2
    80009494:	02010113          	addi	sp,sp,32
    80009498:	00008067          	ret
    8000949c:	00000097          	auipc	ra,0x0
    800094a0:	258080e7          	jalr	600(ra) # 800096f4 <plic_claim>
    800094a4:	00a00793          	li	a5,10
    800094a8:	00050493          	mv	s1,a0
    800094ac:	06f50663          	beq	a0,a5,80009518 <devintr+0x100>
    800094b0:	00100513          	li	a0,1
    800094b4:	fa0482e3          	beqz	s1,80009458 <devintr+0x40>
    800094b8:	00048593          	mv	a1,s1
    800094bc:	00002517          	auipc	a0,0x2
    800094c0:	5e450513          	addi	a0,a0,1508 # 8000baa0 <CONSOLE_STATUS+0xa90>
    800094c4:	00000097          	auipc	ra,0x0
    800094c8:	674080e7          	jalr	1652(ra) # 80009b38 <__printf>
    800094cc:	00048513          	mv	a0,s1
    800094d0:	00000097          	auipc	ra,0x0
    800094d4:	25c080e7          	jalr	604(ra) # 8000972c <plic_complete>
    800094d8:	00100513          	li	a0,1
    800094dc:	f7dff06f          	j	80009458 <devintr+0x40>
    800094e0:	00006517          	auipc	a0,0x6
    800094e4:	db050513          	addi	a0,a0,-592 # 8000f290 <tickslock>
    800094e8:	00001097          	auipc	ra,0x1
    800094ec:	324080e7          	jalr	804(ra) # 8000a80c <acquire>
    800094f0:	00005717          	auipc	a4,0x5
    800094f4:	c3470713          	addi	a4,a4,-972 # 8000e124 <ticks>
    800094f8:	00072783          	lw	a5,0(a4)
    800094fc:	00006517          	auipc	a0,0x6
    80009500:	d9450513          	addi	a0,a0,-620 # 8000f290 <tickslock>
    80009504:	0017879b          	addiw	a5,a5,1
    80009508:	00f72023          	sw	a5,0(a4)
    8000950c:	00001097          	auipc	ra,0x1
    80009510:	3cc080e7          	jalr	972(ra) # 8000a8d8 <release>
    80009514:	f65ff06f          	j	80009478 <devintr+0x60>
    80009518:	00001097          	auipc	ra,0x1
    8000951c:	f28080e7          	jalr	-216(ra) # 8000a440 <uartintr>
    80009520:	fadff06f          	j	800094cc <devintr+0xb4>
	...

0000000080009530 <kernelvec>:
    80009530:	f0010113          	addi	sp,sp,-256
    80009534:	00113023          	sd	ra,0(sp)
    80009538:	00213423          	sd	sp,8(sp)
    8000953c:	00313823          	sd	gp,16(sp)
    80009540:	00413c23          	sd	tp,24(sp)
    80009544:	02513023          	sd	t0,32(sp)
    80009548:	02613423          	sd	t1,40(sp)
    8000954c:	02713823          	sd	t2,48(sp)
    80009550:	02813c23          	sd	s0,56(sp)
    80009554:	04913023          	sd	s1,64(sp)
    80009558:	04a13423          	sd	a0,72(sp)
    8000955c:	04b13823          	sd	a1,80(sp)
    80009560:	04c13c23          	sd	a2,88(sp)
    80009564:	06d13023          	sd	a3,96(sp)
    80009568:	06e13423          	sd	a4,104(sp)
    8000956c:	06f13823          	sd	a5,112(sp)
    80009570:	07013c23          	sd	a6,120(sp)
    80009574:	09113023          	sd	a7,128(sp)
    80009578:	09213423          	sd	s2,136(sp)
    8000957c:	09313823          	sd	s3,144(sp)
    80009580:	09413c23          	sd	s4,152(sp)
    80009584:	0b513023          	sd	s5,160(sp)
    80009588:	0b613423          	sd	s6,168(sp)
    8000958c:	0b713823          	sd	s7,176(sp)
    80009590:	0b813c23          	sd	s8,184(sp)
    80009594:	0d913023          	sd	s9,192(sp)
    80009598:	0da13423          	sd	s10,200(sp)
    8000959c:	0db13823          	sd	s11,208(sp)
    800095a0:	0dc13c23          	sd	t3,216(sp)
    800095a4:	0fd13023          	sd	t4,224(sp)
    800095a8:	0fe13423          	sd	t5,232(sp)
    800095ac:	0ff13823          	sd	t6,240(sp)
    800095b0:	cc9ff0ef          	jal	ra,80009278 <kerneltrap>
    800095b4:	00013083          	ld	ra,0(sp)
    800095b8:	00813103          	ld	sp,8(sp)
    800095bc:	01013183          	ld	gp,16(sp)
    800095c0:	02013283          	ld	t0,32(sp)
    800095c4:	02813303          	ld	t1,40(sp)
    800095c8:	03013383          	ld	t2,48(sp)
    800095cc:	03813403          	ld	s0,56(sp)
    800095d0:	04013483          	ld	s1,64(sp)
    800095d4:	04813503          	ld	a0,72(sp)
    800095d8:	05013583          	ld	a1,80(sp)
    800095dc:	05813603          	ld	a2,88(sp)
    800095e0:	06013683          	ld	a3,96(sp)
    800095e4:	06813703          	ld	a4,104(sp)
    800095e8:	07013783          	ld	a5,112(sp)
    800095ec:	07813803          	ld	a6,120(sp)
    800095f0:	08013883          	ld	a7,128(sp)
    800095f4:	08813903          	ld	s2,136(sp)
    800095f8:	09013983          	ld	s3,144(sp)
    800095fc:	09813a03          	ld	s4,152(sp)
    80009600:	0a013a83          	ld	s5,160(sp)
    80009604:	0a813b03          	ld	s6,168(sp)
    80009608:	0b013b83          	ld	s7,176(sp)
    8000960c:	0b813c03          	ld	s8,184(sp)
    80009610:	0c013c83          	ld	s9,192(sp)
    80009614:	0c813d03          	ld	s10,200(sp)
    80009618:	0d013d83          	ld	s11,208(sp)
    8000961c:	0d813e03          	ld	t3,216(sp)
    80009620:	0e013e83          	ld	t4,224(sp)
    80009624:	0e813f03          	ld	t5,232(sp)
    80009628:	0f013f83          	ld	t6,240(sp)
    8000962c:	10010113          	addi	sp,sp,256
    80009630:	10200073          	sret
    80009634:	00000013          	nop
    80009638:	00000013          	nop
    8000963c:	00000013          	nop

0000000080009640 <timervec>:
    80009640:	34051573          	csrrw	a0,mscratch,a0
    80009644:	00b53023          	sd	a1,0(a0)
    80009648:	00c53423          	sd	a2,8(a0)
    8000964c:	00d53823          	sd	a3,16(a0)
    80009650:	01853583          	ld	a1,24(a0)
    80009654:	02053603          	ld	a2,32(a0)
    80009658:	0005b683          	ld	a3,0(a1)
    8000965c:	00c686b3          	add	a3,a3,a2
    80009660:	00d5b023          	sd	a3,0(a1)
    80009664:	00200593          	li	a1,2
    80009668:	14459073          	csrw	sip,a1
    8000966c:	01053683          	ld	a3,16(a0)
    80009670:	00853603          	ld	a2,8(a0)
    80009674:	00053583          	ld	a1,0(a0)
    80009678:	34051573          	csrrw	a0,mscratch,a0
    8000967c:	30200073          	mret

0000000080009680 <plicinit>:
    80009680:	ff010113          	addi	sp,sp,-16
    80009684:	00813423          	sd	s0,8(sp)
    80009688:	01010413          	addi	s0,sp,16
    8000968c:	00813403          	ld	s0,8(sp)
    80009690:	0c0007b7          	lui	a5,0xc000
    80009694:	00100713          	li	a4,1
    80009698:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000969c:	00e7a223          	sw	a4,4(a5)
    800096a0:	01010113          	addi	sp,sp,16
    800096a4:	00008067          	ret

00000000800096a8 <plicinithart>:
    800096a8:	ff010113          	addi	sp,sp,-16
    800096ac:	00813023          	sd	s0,0(sp)
    800096b0:	00113423          	sd	ra,8(sp)
    800096b4:	01010413          	addi	s0,sp,16
    800096b8:	00000097          	auipc	ra,0x0
    800096bc:	a40080e7          	jalr	-1472(ra) # 800090f8 <cpuid>
    800096c0:	0085171b          	slliw	a4,a0,0x8
    800096c4:	0c0027b7          	lui	a5,0xc002
    800096c8:	00e787b3          	add	a5,a5,a4
    800096cc:	40200713          	li	a4,1026
    800096d0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800096d4:	00813083          	ld	ra,8(sp)
    800096d8:	00013403          	ld	s0,0(sp)
    800096dc:	00d5151b          	slliw	a0,a0,0xd
    800096e0:	0c2017b7          	lui	a5,0xc201
    800096e4:	00a78533          	add	a0,a5,a0
    800096e8:	00052023          	sw	zero,0(a0)
    800096ec:	01010113          	addi	sp,sp,16
    800096f0:	00008067          	ret

00000000800096f4 <plic_claim>:
    800096f4:	ff010113          	addi	sp,sp,-16
    800096f8:	00813023          	sd	s0,0(sp)
    800096fc:	00113423          	sd	ra,8(sp)
    80009700:	01010413          	addi	s0,sp,16
    80009704:	00000097          	auipc	ra,0x0
    80009708:	9f4080e7          	jalr	-1548(ra) # 800090f8 <cpuid>
    8000970c:	00813083          	ld	ra,8(sp)
    80009710:	00013403          	ld	s0,0(sp)
    80009714:	00d5151b          	slliw	a0,a0,0xd
    80009718:	0c2017b7          	lui	a5,0xc201
    8000971c:	00a78533          	add	a0,a5,a0
    80009720:	00452503          	lw	a0,4(a0)
    80009724:	01010113          	addi	sp,sp,16
    80009728:	00008067          	ret

000000008000972c <plic_complete>:
    8000972c:	fe010113          	addi	sp,sp,-32
    80009730:	00813823          	sd	s0,16(sp)
    80009734:	00913423          	sd	s1,8(sp)
    80009738:	00113c23          	sd	ra,24(sp)
    8000973c:	02010413          	addi	s0,sp,32
    80009740:	00050493          	mv	s1,a0
    80009744:	00000097          	auipc	ra,0x0
    80009748:	9b4080e7          	jalr	-1612(ra) # 800090f8 <cpuid>
    8000974c:	01813083          	ld	ra,24(sp)
    80009750:	01013403          	ld	s0,16(sp)
    80009754:	00d5179b          	slliw	a5,a0,0xd
    80009758:	0c201737          	lui	a4,0xc201
    8000975c:	00f707b3          	add	a5,a4,a5
    80009760:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80009764:	00813483          	ld	s1,8(sp)
    80009768:	02010113          	addi	sp,sp,32
    8000976c:	00008067          	ret

0000000080009770 <consolewrite>:
    80009770:	fb010113          	addi	sp,sp,-80
    80009774:	04813023          	sd	s0,64(sp)
    80009778:	04113423          	sd	ra,72(sp)
    8000977c:	02913c23          	sd	s1,56(sp)
    80009780:	03213823          	sd	s2,48(sp)
    80009784:	03313423          	sd	s3,40(sp)
    80009788:	03413023          	sd	s4,32(sp)
    8000978c:	01513c23          	sd	s5,24(sp)
    80009790:	05010413          	addi	s0,sp,80
    80009794:	06c05c63          	blez	a2,8000980c <consolewrite+0x9c>
    80009798:	00060993          	mv	s3,a2
    8000979c:	00050a13          	mv	s4,a0
    800097a0:	00058493          	mv	s1,a1
    800097a4:	00000913          	li	s2,0
    800097a8:	fff00a93          	li	s5,-1
    800097ac:	01c0006f          	j	800097c8 <consolewrite+0x58>
    800097b0:	fbf44503          	lbu	a0,-65(s0)
    800097b4:	0019091b          	addiw	s2,s2,1
    800097b8:	00148493          	addi	s1,s1,1
    800097bc:	00001097          	auipc	ra,0x1
    800097c0:	a9c080e7          	jalr	-1380(ra) # 8000a258 <uartputc>
    800097c4:	03298063          	beq	s3,s2,800097e4 <consolewrite+0x74>
    800097c8:	00048613          	mv	a2,s1
    800097cc:	00100693          	li	a3,1
    800097d0:	000a0593          	mv	a1,s4
    800097d4:	fbf40513          	addi	a0,s0,-65
    800097d8:	00000097          	auipc	ra,0x0
    800097dc:	9d8080e7          	jalr	-1576(ra) # 800091b0 <either_copyin>
    800097e0:	fd5518e3          	bne	a0,s5,800097b0 <consolewrite+0x40>
    800097e4:	04813083          	ld	ra,72(sp)
    800097e8:	04013403          	ld	s0,64(sp)
    800097ec:	03813483          	ld	s1,56(sp)
    800097f0:	02813983          	ld	s3,40(sp)
    800097f4:	02013a03          	ld	s4,32(sp)
    800097f8:	01813a83          	ld	s5,24(sp)
    800097fc:	00090513          	mv	a0,s2
    80009800:	03013903          	ld	s2,48(sp)
    80009804:	05010113          	addi	sp,sp,80
    80009808:	00008067          	ret
    8000980c:	00000913          	li	s2,0
    80009810:	fd5ff06f          	j	800097e4 <consolewrite+0x74>

0000000080009814 <consoleread>:
    80009814:	f9010113          	addi	sp,sp,-112
    80009818:	06813023          	sd	s0,96(sp)
    8000981c:	04913c23          	sd	s1,88(sp)
    80009820:	05213823          	sd	s2,80(sp)
    80009824:	05313423          	sd	s3,72(sp)
    80009828:	05413023          	sd	s4,64(sp)
    8000982c:	03513c23          	sd	s5,56(sp)
    80009830:	03613823          	sd	s6,48(sp)
    80009834:	03713423          	sd	s7,40(sp)
    80009838:	03813023          	sd	s8,32(sp)
    8000983c:	06113423          	sd	ra,104(sp)
    80009840:	01913c23          	sd	s9,24(sp)
    80009844:	07010413          	addi	s0,sp,112
    80009848:	00060b93          	mv	s7,a2
    8000984c:	00050913          	mv	s2,a0
    80009850:	00058c13          	mv	s8,a1
    80009854:	00060b1b          	sext.w	s6,a2
    80009858:	00006497          	auipc	s1,0x6
    8000985c:	a6048493          	addi	s1,s1,-1440 # 8000f2b8 <cons>
    80009860:	00400993          	li	s3,4
    80009864:	fff00a13          	li	s4,-1
    80009868:	00a00a93          	li	s5,10
    8000986c:	05705e63          	blez	s7,800098c8 <consoleread+0xb4>
    80009870:	09c4a703          	lw	a4,156(s1)
    80009874:	0984a783          	lw	a5,152(s1)
    80009878:	0007071b          	sext.w	a4,a4
    8000987c:	08e78463          	beq	a5,a4,80009904 <consoleread+0xf0>
    80009880:	07f7f713          	andi	a4,a5,127
    80009884:	00e48733          	add	a4,s1,a4
    80009888:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000988c:	0017869b          	addiw	a3,a5,1
    80009890:	08d4ac23          	sw	a3,152(s1)
    80009894:	00070c9b          	sext.w	s9,a4
    80009898:	0b370663          	beq	a4,s3,80009944 <consoleread+0x130>
    8000989c:	00100693          	li	a3,1
    800098a0:	f9f40613          	addi	a2,s0,-97
    800098a4:	000c0593          	mv	a1,s8
    800098a8:	00090513          	mv	a0,s2
    800098ac:	f8e40fa3          	sb	a4,-97(s0)
    800098b0:	00000097          	auipc	ra,0x0
    800098b4:	8b4080e7          	jalr	-1868(ra) # 80009164 <either_copyout>
    800098b8:	01450863          	beq	a0,s4,800098c8 <consoleread+0xb4>
    800098bc:	001c0c13          	addi	s8,s8,1
    800098c0:	fffb8b9b          	addiw	s7,s7,-1
    800098c4:	fb5c94e3          	bne	s9,s5,8000986c <consoleread+0x58>
    800098c8:	000b851b          	sext.w	a0,s7
    800098cc:	06813083          	ld	ra,104(sp)
    800098d0:	06013403          	ld	s0,96(sp)
    800098d4:	05813483          	ld	s1,88(sp)
    800098d8:	05013903          	ld	s2,80(sp)
    800098dc:	04813983          	ld	s3,72(sp)
    800098e0:	04013a03          	ld	s4,64(sp)
    800098e4:	03813a83          	ld	s5,56(sp)
    800098e8:	02813b83          	ld	s7,40(sp)
    800098ec:	02013c03          	ld	s8,32(sp)
    800098f0:	01813c83          	ld	s9,24(sp)
    800098f4:	40ab053b          	subw	a0,s6,a0
    800098f8:	03013b03          	ld	s6,48(sp)
    800098fc:	07010113          	addi	sp,sp,112
    80009900:	00008067          	ret
    80009904:	00001097          	auipc	ra,0x1
    80009908:	1d8080e7          	jalr	472(ra) # 8000aadc <push_on>
    8000990c:	0984a703          	lw	a4,152(s1)
    80009910:	09c4a783          	lw	a5,156(s1)
    80009914:	0007879b          	sext.w	a5,a5
    80009918:	fef70ce3          	beq	a4,a5,80009910 <consoleread+0xfc>
    8000991c:	00001097          	auipc	ra,0x1
    80009920:	234080e7          	jalr	564(ra) # 8000ab50 <pop_on>
    80009924:	0984a783          	lw	a5,152(s1)
    80009928:	07f7f713          	andi	a4,a5,127
    8000992c:	00e48733          	add	a4,s1,a4
    80009930:	01874703          	lbu	a4,24(a4)
    80009934:	0017869b          	addiw	a3,a5,1
    80009938:	08d4ac23          	sw	a3,152(s1)
    8000993c:	00070c9b          	sext.w	s9,a4
    80009940:	f5371ee3          	bne	a4,s3,8000989c <consoleread+0x88>
    80009944:	000b851b          	sext.w	a0,s7
    80009948:	f96bf2e3          	bgeu	s7,s6,800098cc <consoleread+0xb8>
    8000994c:	08f4ac23          	sw	a5,152(s1)
    80009950:	f7dff06f          	j	800098cc <consoleread+0xb8>

0000000080009954 <consputc>:
    80009954:	10000793          	li	a5,256
    80009958:	00f50663          	beq	a0,a5,80009964 <consputc+0x10>
    8000995c:	00001317          	auipc	t1,0x1
    80009960:	9f430067          	jr	-1548(t1) # 8000a350 <uartputc_sync>
    80009964:	ff010113          	addi	sp,sp,-16
    80009968:	00113423          	sd	ra,8(sp)
    8000996c:	00813023          	sd	s0,0(sp)
    80009970:	01010413          	addi	s0,sp,16
    80009974:	00800513          	li	a0,8
    80009978:	00001097          	auipc	ra,0x1
    8000997c:	9d8080e7          	jalr	-1576(ra) # 8000a350 <uartputc_sync>
    80009980:	02000513          	li	a0,32
    80009984:	00001097          	auipc	ra,0x1
    80009988:	9cc080e7          	jalr	-1588(ra) # 8000a350 <uartputc_sync>
    8000998c:	00013403          	ld	s0,0(sp)
    80009990:	00813083          	ld	ra,8(sp)
    80009994:	00800513          	li	a0,8
    80009998:	01010113          	addi	sp,sp,16
    8000999c:	00001317          	auipc	t1,0x1
    800099a0:	9b430067          	jr	-1612(t1) # 8000a350 <uartputc_sync>

00000000800099a4 <consoleintr>:
    800099a4:	fe010113          	addi	sp,sp,-32
    800099a8:	00813823          	sd	s0,16(sp)
    800099ac:	00913423          	sd	s1,8(sp)
    800099b0:	01213023          	sd	s2,0(sp)
    800099b4:	00113c23          	sd	ra,24(sp)
    800099b8:	02010413          	addi	s0,sp,32
    800099bc:	00006917          	auipc	s2,0x6
    800099c0:	8fc90913          	addi	s2,s2,-1796 # 8000f2b8 <cons>
    800099c4:	00050493          	mv	s1,a0
    800099c8:	00090513          	mv	a0,s2
    800099cc:	00001097          	auipc	ra,0x1
    800099d0:	e40080e7          	jalr	-448(ra) # 8000a80c <acquire>
    800099d4:	02048c63          	beqz	s1,80009a0c <consoleintr+0x68>
    800099d8:	0a092783          	lw	a5,160(s2)
    800099dc:	09892703          	lw	a4,152(s2)
    800099e0:	07f00693          	li	a3,127
    800099e4:	40e7873b          	subw	a4,a5,a4
    800099e8:	02e6e263          	bltu	a3,a4,80009a0c <consoleintr+0x68>
    800099ec:	00d00713          	li	a4,13
    800099f0:	04e48063          	beq	s1,a4,80009a30 <consoleintr+0x8c>
    800099f4:	07f7f713          	andi	a4,a5,127
    800099f8:	00e90733          	add	a4,s2,a4
    800099fc:	0017879b          	addiw	a5,a5,1
    80009a00:	0af92023          	sw	a5,160(s2)
    80009a04:	00970c23          	sb	s1,24(a4)
    80009a08:	08f92e23          	sw	a5,156(s2)
    80009a0c:	01013403          	ld	s0,16(sp)
    80009a10:	01813083          	ld	ra,24(sp)
    80009a14:	00813483          	ld	s1,8(sp)
    80009a18:	00013903          	ld	s2,0(sp)
    80009a1c:	00006517          	auipc	a0,0x6
    80009a20:	89c50513          	addi	a0,a0,-1892 # 8000f2b8 <cons>
    80009a24:	02010113          	addi	sp,sp,32
    80009a28:	00001317          	auipc	t1,0x1
    80009a2c:	eb030067          	jr	-336(t1) # 8000a8d8 <release>
    80009a30:	00a00493          	li	s1,10
    80009a34:	fc1ff06f          	j	800099f4 <consoleintr+0x50>

0000000080009a38 <consoleinit>:
    80009a38:	fe010113          	addi	sp,sp,-32
    80009a3c:	00113c23          	sd	ra,24(sp)
    80009a40:	00813823          	sd	s0,16(sp)
    80009a44:	00913423          	sd	s1,8(sp)
    80009a48:	02010413          	addi	s0,sp,32
    80009a4c:	00006497          	auipc	s1,0x6
    80009a50:	86c48493          	addi	s1,s1,-1940 # 8000f2b8 <cons>
    80009a54:	00048513          	mv	a0,s1
    80009a58:	00002597          	auipc	a1,0x2
    80009a5c:	0a058593          	addi	a1,a1,160 # 8000baf8 <CONSOLE_STATUS+0xae8>
    80009a60:	00001097          	auipc	ra,0x1
    80009a64:	d88080e7          	jalr	-632(ra) # 8000a7e8 <initlock>
    80009a68:	00000097          	auipc	ra,0x0
    80009a6c:	7ac080e7          	jalr	1964(ra) # 8000a214 <uartinit>
    80009a70:	01813083          	ld	ra,24(sp)
    80009a74:	01013403          	ld	s0,16(sp)
    80009a78:	00000797          	auipc	a5,0x0
    80009a7c:	d9c78793          	addi	a5,a5,-612 # 80009814 <consoleread>
    80009a80:	0af4bc23          	sd	a5,184(s1)
    80009a84:	00000797          	auipc	a5,0x0
    80009a88:	cec78793          	addi	a5,a5,-788 # 80009770 <consolewrite>
    80009a8c:	0cf4b023          	sd	a5,192(s1)
    80009a90:	00813483          	ld	s1,8(sp)
    80009a94:	02010113          	addi	sp,sp,32
    80009a98:	00008067          	ret

0000000080009a9c <console_read>:
    80009a9c:	ff010113          	addi	sp,sp,-16
    80009aa0:	00813423          	sd	s0,8(sp)
    80009aa4:	01010413          	addi	s0,sp,16
    80009aa8:	00813403          	ld	s0,8(sp)
    80009aac:	00006317          	auipc	t1,0x6
    80009ab0:	8c433303          	ld	t1,-1852(t1) # 8000f370 <devsw+0x10>
    80009ab4:	01010113          	addi	sp,sp,16
    80009ab8:	00030067          	jr	t1

0000000080009abc <console_write>:
    80009abc:	ff010113          	addi	sp,sp,-16
    80009ac0:	00813423          	sd	s0,8(sp)
    80009ac4:	01010413          	addi	s0,sp,16
    80009ac8:	00813403          	ld	s0,8(sp)
    80009acc:	00006317          	auipc	t1,0x6
    80009ad0:	8ac33303          	ld	t1,-1876(t1) # 8000f378 <devsw+0x18>
    80009ad4:	01010113          	addi	sp,sp,16
    80009ad8:	00030067          	jr	t1

0000000080009adc <panic>:
    80009adc:	fe010113          	addi	sp,sp,-32
    80009ae0:	00113c23          	sd	ra,24(sp)
    80009ae4:	00813823          	sd	s0,16(sp)
    80009ae8:	00913423          	sd	s1,8(sp)
    80009aec:	02010413          	addi	s0,sp,32
    80009af0:	00050493          	mv	s1,a0
    80009af4:	00002517          	auipc	a0,0x2
    80009af8:	00c50513          	addi	a0,a0,12 # 8000bb00 <CONSOLE_STATUS+0xaf0>
    80009afc:	00006797          	auipc	a5,0x6
    80009b00:	9007ae23          	sw	zero,-1764(a5) # 8000f418 <pr+0x18>
    80009b04:	00000097          	auipc	ra,0x0
    80009b08:	034080e7          	jalr	52(ra) # 80009b38 <__printf>
    80009b0c:	00048513          	mv	a0,s1
    80009b10:	00000097          	auipc	ra,0x0
    80009b14:	028080e7          	jalr	40(ra) # 80009b38 <__printf>
    80009b18:	00002517          	auipc	a0,0x2
    80009b1c:	d6850513          	addi	a0,a0,-664 # 8000b880 <CONSOLE_STATUS+0x870>
    80009b20:	00000097          	auipc	ra,0x0
    80009b24:	018080e7          	jalr	24(ra) # 80009b38 <__printf>
    80009b28:	00100793          	li	a5,1
    80009b2c:	00004717          	auipc	a4,0x4
    80009b30:	5ef72e23          	sw	a5,1532(a4) # 8000e128 <panicked>
    80009b34:	0000006f          	j	80009b34 <panic+0x58>

0000000080009b38 <__printf>:
    80009b38:	f3010113          	addi	sp,sp,-208
    80009b3c:	08813023          	sd	s0,128(sp)
    80009b40:	07313423          	sd	s3,104(sp)
    80009b44:	09010413          	addi	s0,sp,144
    80009b48:	05813023          	sd	s8,64(sp)
    80009b4c:	08113423          	sd	ra,136(sp)
    80009b50:	06913c23          	sd	s1,120(sp)
    80009b54:	07213823          	sd	s2,112(sp)
    80009b58:	07413023          	sd	s4,96(sp)
    80009b5c:	05513c23          	sd	s5,88(sp)
    80009b60:	05613823          	sd	s6,80(sp)
    80009b64:	05713423          	sd	s7,72(sp)
    80009b68:	03913c23          	sd	s9,56(sp)
    80009b6c:	03a13823          	sd	s10,48(sp)
    80009b70:	03b13423          	sd	s11,40(sp)
    80009b74:	00006317          	auipc	t1,0x6
    80009b78:	88c30313          	addi	t1,t1,-1908 # 8000f400 <pr>
    80009b7c:	01832c03          	lw	s8,24(t1)
    80009b80:	00b43423          	sd	a1,8(s0)
    80009b84:	00c43823          	sd	a2,16(s0)
    80009b88:	00d43c23          	sd	a3,24(s0)
    80009b8c:	02e43023          	sd	a4,32(s0)
    80009b90:	02f43423          	sd	a5,40(s0)
    80009b94:	03043823          	sd	a6,48(s0)
    80009b98:	03143c23          	sd	a7,56(s0)
    80009b9c:	00050993          	mv	s3,a0
    80009ba0:	4a0c1663          	bnez	s8,8000a04c <__printf+0x514>
    80009ba4:	60098c63          	beqz	s3,8000a1bc <__printf+0x684>
    80009ba8:	0009c503          	lbu	a0,0(s3)
    80009bac:	00840793          	addi	a5,s0,8
    80009bb0:	f6f43c23          	sd	a5,-136(s0)
    80009bb4:	00000493          	li	s1,0
    80009bb8:	22050063          	beqz	a0,80009dd8 <__printf+0x2a0>
    80009bbc:	00002a37          	lui	s4,0x2
    80009bc0:	00018ab7          	lui	s5,0x18
    80009bc4:	000f4b37          	lui	s6,0xf4
    80009bc8:	00989bb7          	lui	s7,0x989
    80009bcc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80009bd0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80009bd4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80009bd8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80009bdc:	00148c9b          	addiw	s9,s1,1
    80009be0:	02500793          	li	a5,37
    80009be4:	01998933          	add	s2,s3,s9
    80009be8:	38f51263          	bne	a0,a5,80009f6c <__printf+0x434>
    80009bec:	00094783          	lbu	a5,0(s2)
    80009bf0:	00078c9b          	sext.w	s9,a5
    80009bf4:	1e078263          	beqz	a5,80009dd8 <__printf+0x2a0>
    80009bf8:	0024849b          	addiw	s1,s1,2
    80009bfc:	07000713          	li	a4,112
    80009c00:	00998933          	add	s2,s3,s1
    80009c04:	38e78a63          	beq	a5,a4,80009f98 <__printf+0x460>
    80009c08:	20f76863          	bltu	a4,a5,80009e18 <__printf+0x2e0>
    80009c0c:	42a78863          	beq	a5,a0,8000a03c <__printf+0x504>
    80009c10:	06400713          	li	a4,100
    80009c14:	40e79663          	bne	a5,a4,8000a020 <__printf+0x4e8>
    80009c18:	f7843783          	ld	a5,-136(s0)
    80009c1c:	0007a603          	lw	a2,0(a5)
    80009c20:	00878793          	addi	a5,a5,8
    80009c24:	f6f43c23          	sd	a5,-136(s0)
    80009c28:	42064a63          	bltz	a2,8000a05c <__printf+0x524>
    80009c2c:	00a00713          	li	a4,10
    80009c30:	02e677bb          	remuw	a5,a2,a4
    80009c34:	00002d97          	auipc	s11,0x2
    80009c38:	ef4d8d93          	addi	s11,s11,-268 # 8000bb28 <digits>
    80009c3c:	00900593          	li	a1,9
    80009c40:	0006051b          	sext.w	a0,a2
    80009c44:	00000c93          	li	s9,0
    80009c48:	02079793          	slli	a5,a5,0x20
    80009c4c:	0207d793          	srli	a5,a5,0x20
    80009c50:	00fd87b3          	add	a5,s11,a5
    80009c54:	0007c783          	lbu	a5,0(a5)
    80009c58:	02e656bb          	divuw	a3,a2,a4
    80009c5c:	f8f40023          	sb	a5,-128(s0)
    80009c60:	14c5d863          	bge	a1,a2,80009db0 <__printf+0x278>
    80009c64:	06300593          	li	a1,99
    80009c68:	00100c93          	li	s9,1
    80009c6c:	02e6f7bb          	remuw	a5,a3,a4
    80009c70:	02079793          	slli	a5,a5,0x20
    80009c74:	0207d793          	srli	a5,a5,0x20
    80009c78:	00fd87b3          	add	a5,s11,a5
    80009c7c:	0007c783          	lbu	a5,0(a5)
    80009c80:	02e6d73b          	divuw	a4,a3,a4
    80009c84:	f8f400a3          	sb	a5,-127(s0)
    80009c88:	12a5f463          	bgeu	a1,a0,80009db0 <__printf+0x278>
    80009c8c:	00a00693          	li	a3,10
    80009c90:	00900593          	li	a1,9
    80009c94:	02d777bb          	remuw	a5,a4,a3
    80009c98:	02079793          	slli	a5,a5,0x20
    80009c9c:	0207d793          	srli	a5,a5,0x20
    80009ca0:	00fd87b3          	add	a5,s11,a5
    80009ca4:	0007c503          	lbu	a0,0(a5)
    80009ca8:	02d757bb          	divuw	a5,a4,a3
    80009cac:	f8a40123          	sb	a0,-126(s0)
    80009cb0:	48e5f263          	bgeu	a1,a4,8000a134 <__printf+0x5fc>
    80009cb4:	06300513          	li	a0,99
    80009cb8:	02d7f5bb          	remuw	a1,a5,a3
    80009cbc:	02059593          	slli	a1,a1,0x20
    80009cc0:	0205d593          	srli	a1,a1,0x20
    80009cc4:	00bd85b3          	add	a1,s11,a1
    80009cc8:	0005c583          	lbu	a1,0(a1)
    80009ccc:	02d7d7bb          	divuw	a5,a5,a3
    80009cd0:	f8b401a3          	sb	a1,-125(s0)
    80009cd4:	48e57263          	bgeu	a0,a4,8000a158 <__printf+0x620>
    80009cd8:	3e700513          	li	a0,999
    80009cdc:	02d7f5bb          	remuw	a1,a5,a3
    80009ce0:	02059593          	slli	a1,a1,0x20
    80009ce4:	0205d593          	srli	a1,a1,0x20
    80009ce8:	00bd85b3          	add	a1,s11,a1
    80009cec:	0005c583          	lbu	a1,0(a1)
    80009cf0:	02d7d7bb          	divuw	a5,a5,a3
    80009cf4:	f8b40223          	sb	a1,-124(s0)
    80009cf8:	46e57663          	bgeu	a0,a4,8000a164 <__printf+0x62c>
    80009cfc:	02d7f5bb          	remuw	a1,a5,a3
    80009d00:	02059593          	slli	a1,a1,0x20
    80009d04:	0205d593          	srli	a1,a1,0x20
    80009d08:	00bd85b3          	add	a1,s11,a1
    80009d0c:	0005c583          	lbu	a1,0(a1)
    80009d10:	02d7d7bb          	divuw	a5,a5,a3
    80009d14:	f8b402a3          	sb	a1,-123(s0)
    80009d18:	46ea7863          	bgeu	s4,a4,8000a188 <__printf+0x650>
    80009d1c:	02d7f5bb          	remuw	a1,a5,a3
    80009d20:	02059593          	slli	a1,a1,0x20
    80009d24:	0205d593          	srli	a1,a1,0x20
    80009d28:	00bd85b3          	add	a1,s11,a1
    80009d2c:	0005c583          	lbu	a1,0(a1)
    80009d30:	02d7d7bb          	divuw	a5,a5,a3
    80009d34:	f8b40323          	sb	a1,-122(s0)
    80009d38:	3eeaf863          	bgeu	s5,a4,8000a128 <__printf+0x5f0>
    80009d3c:	02d7f5bb          	remuw	a1,a5,a3
    80009d40:	02059593          	slli	a1,a1,0x20
    80009d44:	0205d593          	srli	a1,a1,0x20
    80009d48:	00bd85b3          	add	a1,s11,a1
    80009d4c:	0005c583          	lbu	a1,0(a1)
    80009d50:	02d7d7bb          	divuw	a5,a5,a3
    80009d54:	f8b403a3          	sb	a1,-121(s0)
    80009d58:	42eb7e63          	bgeu	s6,a4,8000a194 <__printf+0x65c>
    80009d5c:	02d7f5bb          	remuw	a1,a5,a3
    80009d60:	02059593          	slli	a1,a1,0x20
    80009d64:	0205d593          	srli	a1,a1,0x20
    80009d68:	00bd85b3          	add	a1,s11,a1
    80009d6c:	0005c583          	lbu	a1,0(a1)
    80009d70:	02d7d7bb          	divuw	a5,a5,a3
    80009d74:	f8b40423          	sb	a1,-120(s0)
    80009d78:	42ebfc63          	bgeu	s7,a4,8000a1b0 <__printf+0x678>
    80009d7c:	02079793          	slli	a5,a5,0x20
    80009d80:	0207d793          	srli	a5,a5,0x20
    80009d84:	00fd8db3          	add	s11,s11,a5
    80009d88:	000dc703          	lbu	a4,0(s11)
    80009d8c:	00a00793          	li	a5,10
    80009d90:	00900c93          	li	s9,9
    80009d94:	f8e404a3          	sb	a4,-119(s0)
    80009d98:	00065c63          	bgez	a2,80009db0 <__printf+0x278>
    80009d9c:	f9040713          	addi	a4,s0,-112
    80009da0:	00f70733          	add	a4,a4,a5
    80009da4:	02d00693          	li	a3,45
    80009da8:	fed70823          	sb	a3,-16(a4)
    80009dac:	00078c93          	mv	s9,a5
    80009db0:	f8040793          	addi	a5,s0,-128
    80009db4:	01978cb3          	add	s9,a5,s9
    80009db8:	f7f40d13          	addi	s10,s0,-129
    80009dbc:	000cc503          	lbu	a0,0(s9)
    80009dc0:	fffc8c93          	addi	s9,s9,-1
    80009dc4:	00000097          	auipc	ra,0x0
    80009dc8:	b90080e7          	jalr	-1136(ra) # 80009954 <consputc>
    80009dcc:	ffac98e3          	bne	s9,s10,80009dbc <__printf+0x284>
    80009dd0:	00094503          	lbu	a0,0(s2)
    80009dd4:	e00514e3          	bnez	a0,80009bdc <__printf+0xa4>
    80009dd8:	1a0c1663          	bnez	s8,80009f84 <__printf+0x44c>
    80009ddc:	08813083          	ld	ra,136(sp)
    80009de0:	08013403          	ld	s0,128(sp)
    80009de4:	07813483          	ld	s1,120(sp)
    80009de8:	07013903          	ld	s2,112(sp)
    80009dec:	06813983          	ld	s3,104(sp)
    80009df0:	06013a03          	ld	s4,96(sp)
    80009df4:	05813a83          	ld	s5,88(sp)
    80009df8:	05013b03          	ld	s6,80(sp)
    80009dfc:	04813b83          	ld	s7,72(sp)
    80009e00:	04013c03          	ld	s8,64(sp)
    80009e04:	03813c83          	ld	s9,56(sp)
    80009e08:	03013d03          	ld	s10,48(sp)
    80009e0c:	02813d83          	ld	s11,40(sp)
    80009e10:	0d010113          	addi	sp,sp,208
    80009e14:	00008067          	ret
    80009e18:	07300713          	li	a4,115
    80009e1c:	1ce78a63          	beq	a5,a4,80009ff0 <__printf+0x4b8>
    80009e20:	07800713          	li	a4,120
    80009e24:	1ee79e63          	bne	a5,a4,8000a020 <__printf+0x4e8>
    80009e28:	f7843783          	ld	a5,-136(s0)
    80009e2c:	0007a703          	lw	a4,0(a5)
    80009e30:	00878793          	addi	a5,a5,8
    80009e34:	f6f43c23          	sd	a5,-136(s0)
    80009e38:	28074263          	bltz	a4,8000a0bc <__printf+0x584>
    80009e3c:	00002d97          	auipc	s11,0x2
    80009e40:	cecd8d93          	addi	s11,s11,-788 # 8000bb28 <digits>
    80009e44:	00f77793          	andi	a5,a4,15
    80009e48:	00fd87b3          	add	a5,s11,a5
    80009e4c:	0007c683          	lbu	a3,0(a5)
    80009e50:	00f00613          	li	a2,15
    80009e54:	0007079b          	sext.w	a5,a4
    80009e58:	f8d40023          	sb	a3,-128(s0)
    80009e5c:	0047559b          	srliw	a1,a4,0x4
    80009e60:	0047569b          	srliw	a3,a4,0x4
    80009e64:	00000c93          	li	s9,0
    80009e68:	0ee65063          	bge	a2,a4,80009f48 <__printf+0x410>
    80009e6c:	00f6f693          	andi	a3,a3,15
    80009e70:	00dd86b3          	add	a3,s11,a3
    80009e74:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80009e78:	0087d79b          	srliw	a5,a5,0x8
    80009e7c:	00100c93          	li	s9,1
    80009e80:	f8d400a3          	sb	a3,-127(s0)
    80009e84:	0cb67263          	bgeu	a2,a1,80009f48 <__printf+0x410>
    80009e88:	00f7f693          	andi	a3,a5,15
    80009e8c:	00dd86b3          	add	a3,s11,a3
    80009e90:	0006c583          	lbu	a1,0(a3)
    80009e94:	00f00613          	li	a2,15
    80009e98:	0047d69b          	srliw	a3,a5,0x4
    80009e9c:	f8b40123          	sb	a1,-126(s0)
    80009ea0:	0047d593          	srli	a1,a5,0x4
    80009ea4:	28f67e63          	bgeu	a2,a5,8000a140 <__printf+0x608>
    80009ea8:	00f6f693          	andi	a3,a3,15
    80009eac:	00dd86b3          	add	a3,s11,a3
    80009eb0:	0006c503          	lbu	a0,0(a3)
    80009eb4:	0087d813          	srli	a6,a5,0x8
    80009eb8:	0087d69b          	srliw	a3,a5,0x8
    80009ebc:	f8a401a3          	sb	a0,-125(s0)
    80009ec0:	28b67663          	bgeu	a2,a1,8000a14c <__printf+0x614>
    80009ec4:	00f6f693          	andi	a3,a3,15
    80009ec8:	00dd86b3          	add	a3,s11,a3
    80009ecc:	0006c583          	lbu	a1,0(a3)
    80009ed0:	00c7d513          	srli	a0,a5,0xc
    80009ed4:	00c7d69b          	srliw	a3,a5,0xc
    80009ed8:	f8b40223          	sb	a1,-124(s0)
    80009edc:	29067a63          	bgeu	a2,a6,8000a170 <__printf+0x638>
    80009ee0:	00f6f693          	andi	a3,a3,15
    80009ee4:	00dd86b3          	add	a3,s11,a3
    80009ee8:	0006c583          	lbu	a1,0(a3)
    80009eec:	0107d813          	srli	a6,a5,0x10
    80009ef0:	0107d69b          	srliw	a3,a5,0x10
    80009ef4:	f8b402a3          	sb	a1,-123(s0)
    80009ef8:	28a67263          	bgeu	a2,a0,8000a17c <__printf+0x644>
    80009efc:	00f6f693          	andi	a3,a3,15
    80009f00:	00dd86b3          	add	a3,s11,a3
    80009f04:	0006c683          	lbu	a3,0(a3)
    80009f08:	0147d79b          	srliw	a5,a5,0x14
    80009f0c:	f8d40323          	sb	a3,-122(s0)
    80009f10:	21067663          	bgeu	a2,a6,8000a11c <__printf+0x5e4>
    80009f14:	02079793          	slli	a5,a5,0x20
    80009f18:	0207d793          	srli	a5,a5,0x20
    80009f1c:	00fd8db3          	add	s11,s11,a5
    80009f20:	000dc683          	lbu	a3,0(s11)
    80009f24:	00800793          	li	a5,8
    80009f28:	00700c93          	li	s9,7
    80009f2c:	f8d403a3          	sb	a3,-121(s0)
    80009f30:	00075c63          	bgez	a4,80009f48 <__printf+0x410>
    80009f34:	f9040713          	addi	a4,s0,-112
    80009f38:	00f70733          	add	a4,a4,a5
    80009f3c:	02d00693          	li	a3,45
    80009f40:	fed70823          	sb	a3,-16(a4)
    80009f44:	00078c93          	mv	s9,a5
    80009f48:	f8040793          	addi	a5,s0,-128
    80009f4c:	01978cb3          	add	s9,a5,s9
    80009f50:	f7f40d13          	addi	s10,s0,-129
    80009f54:	000cc503          	lbu	a0,0(s9)
    80009f58:	fffc8c93          	addi	s9,s9,-1
    80009f5c:	00000097          	auipc	ra,0x0
    80009f60:	9f8080e7          	jalr	-1544(ra) # 80009954 <consputc>
    80009f64:	ff9d18e3          	bne	s10,s9,80009f54 <__printf+0x41c>
    80009f68:	0100006f          	j	80009f78 <__printf+0x440>
    80009f6c:	00000097          	auipc	ra,0x0
    80009f70:	9e8080e7          	jalr	-1560(ra) # 80009954 <consputc>
    80009f74:	000c8493          	mv	s1,s9
    80009f78:	00094503          	lbu	a0,0(s2)
    80009f7c:	c60510e3          	bnez	a0,80009bdc <__printf+0xa4>
    80009f80:	e40c0ee3          	beqz	s8,80009ddc <__printf+0x2a4>
    80009f84:	00005517          	auipc	a0,0x5
    80009f88:	47c50513          	addi	a0,a0,1148 # 8000f400 <pr>
    80009f8c:	00001097          	auipc	ra,0x1
    80009f90:	94c080e7          	jalr	-1716(ra) # 8000a8d8 <release>
    80009f94:	e49ff06f          	j	80009ddc <__printf+0x2a4>
    80009f98:	f7843783          	ld	a5,-136(s0)
    80009f9c:	03000513          	li	a0,48
    80009fa0:	01000d13          	li	s10,16
    80009fa4:	00878713          	addi	a4,a5,8
    80009fa8:	0007bc83          	ld	s9,0(a5)
    80009fac:	f6e43c23          	sd	a4,-136(s0)
    80009fb0:	00000097          	auipc	ra,0x0
    80009fb4:	9a4080e7          	jalr	-1628(ra) # 80009954 <consputc>
    80009fb8:	07800513          	li	a0,120
    80009fbc:	00000097          	auipc	ra,0x0
    80009fc0:	998080e7          	jalr	-1640(ra) # 80009954 <consputc>
    80009fc4:	00002d97          	auipc	s11,0x2
    80009fc8:	b64d8d93          	addi	s11,s11,-1180 # 8000bb28 <digits>
    80009fcc:	03ccd793          	srli	a5,s9,0x3c
    80009fd0:	00fd87b3          	add	a5,s11,a5
    80009fd4:	0007c503          	lbu	a0,0(a5)
    80009fd8:	fffd0d1b          	addiw	s10,s10,-1
    80009fdc:	004c9c93          	slli	s9,s9,0x4
    80009fe0:	00000097          	auipc	ra,0x0
    80009fe4:	974080e7          	jalr	-1676(ra) # 80009954 <consputc>
    80009fe8:	fe0d12e3          	bnez	s10,80009fcc <__printf+0x494>
    80009fec:	f8dff06f          	j	80009f78 <__printf+0x440>
    80009ff0:	f7843783          	ld	a5,-136(s0)
    80009ff4:	0007bc83          	ld	s9,0(a5)
    80009ff8:	00878793          	addi	a5,a5,8
    80009ffc:	f6f43c23          	sd	a5,-136(s0)
    8000a000:	000c9a63          	bnez	s9,8000a014 <__printf+0x4dc>
    8000a004:	1080006f          	j	8000a10c <__printf+0x5d4>
    8000a008:	001c8c93          	addi	s9,s9,1
    8000a00c:	00000097          	auipc	ra,0x0
    8000a010:	948080e7          	jalr	-1720(ra) # 80009954 <consputc>
    8000a014:	000cc503          	lbu	a0,0(s9)
    8000a018:	fe0518e3          	bnez	a0,8000a008 <__printf+0x4d0>
    8000a01c:	f5dff06f          	j	80009f78 <__printf+0x440>
    8000a020:	02500513          	li	a0,37
    8000a024:	00000097          	auipc	ra,0x0
    8000a028:	930080e7          	jalr	-1744(ra) # 80009954 <consputc>
    8000a02c:	000c8513          	mv	a0,s9
    8000a030:	00000097          	auipc	ra,0x0
    8000a034:	924080e7          	jalr	-1756(ra) # 80009954 <consputc>
    8000a038:	f41ff06f          	j	80009f78 <__printf+0x440>
    8000a03c:	02500513          	li	a0,37
    8000a040:	00000097          	auipc	ra,0x0
    8000a044:	914080e7          	jalr	-1772(ra) # 80009954 <consputc>
    8000a048:	f31ff06f          	j	80009f78 <__printf+0x440>
    8000a04c:	00030513          	mv	a0,t1
    8000a050:	00000097          	auipc	ra,0x0
    8000a054:	7bc080e7          	jalr	1980(ra) # 8000a80c <acquire>
    8000a058:	b4dff06f          	j	80009ba4 <__printf+0x6c>
    8000a05c:	40c0053b          	negw	a0,a2
    8000a060:	00a00713          	li	a4,10
    8000a064:	02e576bb          	remuw	a3,a0,a4
    8000a068:	00002d97          	auipc	s11,0x2
    8000a06c:	ac0d8d93          	addi	s11,s11,-1344 # 8000bb28 <digits>
    8000a070:	ff700593          	li	a1,-9
    8000a074:	02069693          	slli	a3,a3,0x20
    8000a078:	0206d693          	srli	a3,a3,0x20
    8000a07c:	00dd86b3          	add	a3,s11,a3
    8000a080:	0006c683          	lbu	a3,0(a3)
    8000a084:	02e557bb          	divuw	a5,a0,a4
    8000a088:	f8d40023          	sb	a3,-128(s0)
    8000a08c:	10b65e63          	bge	a2,a1,8000a1a8 <__printf+0x670>
    8000a090:	06300593          	li	a1,99
    8000a094:	02e7f6bb          	remuw	a3,a5,a4
    8000a098:	02069693          	slli	a3,a3,0x20
    8000a09c:	0206d693          	srli	a3,a3,0x20
    8000a0a0:	00dd86b3          	add	a3,s11,a3
    8000a0a4:	0006c683          	lbu	a3,0(a3)
    8000a0a8:	02e7d73b          	divuw	a4,a5,a4
    8000a0ac:	00200793          	li	a5,2
    8000a0b0:	f8d400a3          	sb	a3,-127(s0)
    8000a0b4:	bca5ece3          	bltu	a1,a0,80009c8c <__printf+0x154>
    8000a0b8:	ce5ff06f          	j	80009d9c <__printf+0x264>
    8000a0bc:	40e007bb          	negw	a5,a4
    8000a0c0:	00002d97          	auipc	s11,0x2
    8000a0c4:	a68d8d93          	addi	s11,s11,-1432 # 8000bb28 <digits>
    8000a0c8:	00f7f693          	andi	a3,a5,15
    8000a0cc:	00dd86b3          	add	a3,s11,a3
    8000a0d0:	0006c583          	lbu	a1,0(a3)
    8000a0d4:	ff100613          	li	a2,-15
    8000a0d8:	0047d69b          	srliw	a3,a5,0x4
    8000a0dc:	f8b40023          	sb	a1,-128(s0)
    8000a0e0:	0047d59b          	srliw	a1,a5,0x4
    8000a0e4:	0ac75e63          	bge	a4,a2,8000a1a0 <__printf+0x668>
    8000a0e8:	00f6f693          	andi	a3,a3,15
    8000a0ec:	00dd86b3          	add	a3,s11,a3
    8000a0f0:	0006c603          	lbu	a2,0(a3)
    8000a0f4:	00f00693          	li	a3,15
    8000a0f8:	0087d79b          	srliw	a5,a5,0x8
    8000a0fc:	f8c400a3          	sb	a2,-127(s0)
    8000a100:	d8b6e4e3          	bltu	a3,a1,80009e88 <__printf+0x350>
    8000a104:	00200793          	li	a5,2
    8000a108:	e2dff06f          	j	80009f34 <__printf+0x3fc>
    8000a10c:	00002c97          	auipc	s9,0x2
    8000a110:	9fcc8c93          	addi	s9,s9,-1540 # 8000bb08 <CONSOLE_STATUS+0xaf8>
    8000a114:	02800513          	li	a0,40
    8000a118:	ef1ff06f          	j	8000a008 <__printf+0x4d0>
    8000a11c:	00700793          	li	a5,7
    8000a120:	00600c93          	li	s9,6
    8000a124:	e0dff06f          	j	80009f30 <__printf+0x3f8>
    8000a128:	00700793          	li	a5,7
    8000a12c:	00600c93          	li	s9,6
    8000a130:	c69ff06f          	j	80009d98 <__printf+0x260>
    8000a134:	00300793          	li	a5,3
    8000a138:	00200c93          	li	s9,2
    8000a13c:	c5dff06f          	j	80009d98 <__printf+0x260>
    8000a140:	00300793          	li	a5,3
    8000a144:	00200c93          	li	s9,2
    8000a148:	de9ff06f          	j	80009f30 <__printf+0x3f8>
    8000a14c:	00400793          	li	a5,4
    8000a150:	00300c93          	li	s9,3
    8000a154:	dddff06f          	j	80009f30 <__printf+0x3f8>
    8000a158:	00400793          	li	a5,4
    8000a15c:	00300c93          	li	s9,3
    8000a160:	c39ff06f          	j	80009d98 <__printf+0x260>
    8000a164:	00500793          	li	a5,5
    8000a168:	00400c93          	li	s9,4
    8000a16c:	c2dff06f          	j	80009d98 <__printf+0x260>
    8000a170:	00500793          	li	a5,5
    8000a174:	00400c93          	li	s9,4
    8000a178:	db9ff06f          	j	80009f30 <__printf+0x3f8>
    8000a17c:	00600793          	li	a5,6
    8000a180:	00500c93          	li	s9,5
    8000a184:	dadff06f          	j	80009f30 <__printf+0x3f8>
    8000a188:	00600793          	li	a5,6
    8000a18c:	00500c93          	li	s9,5
    8000a190:	c09ff06f          	j	80009d98 <__printf+0x260>
    8000a194:	00800793          	li	a5,8
    8000a198:	00700c93          	li	s9,7
    8000a19c:	bfdff06f          	j	80009d98 <__printf+0x260>
    8000a1a0:	00100793          	li	a5,1
    8000a1a4:	d91ff06f          	j	80009f34 <__printf+0x3fc>
    8000a1a8:	00100793          	li	a5,1
    8000a1ac:	bf1ff06f          	j	80009d9c <__printf+0x264>
    8000a1b0:	00900793          	li	a5,9
    8000a1b4:	00800c93          	li	s9,8
    8000a1b8:	be1ff06f          	j	80009d98 <__printf+0x260>
    8000a1bc:	00002517          	auipc	a0,0x2
    8000a1c0:	95450513          	addi	a0,a0,-1708 # 8000bb10 <CONSOLE_STATUS+0xb00>
    8000a1c4:	00000097          	auipc	ra,0x0
    8000a1c8:	918080e7          	jalr	-1768(ra) # 80009adc <panic>

000000008000a1cc <printfinit>:
    8000a1cc:	fe010113          	addi	sp,sp,-32
    8000a1d0:	00813823          	sd	s0,16(sp)
    8000a1d4:	00913423          	sd	s1,8(sp)
    8000a1d8:	00113c23          	sd	ra,24(sp)
    8000a1dc:	02010413          	addi	s0,sp,32
    8000a1e0:	00005497          	auipc	s1,0x5
    8000a1e4:	22048493          	addi	s1,s1,544 # 8000f400 <pr>
    8000a1e8:	00048513          	mv	a0,s1
    8000a1ec:	00002597          	auipc	a1,0x2
    8000a1f0:	93458593          	addi	a1,a1,-1740 # 8000bb20 <CONSOLE_STATUS+0xb10>
    8000a1f4:	00000097          	auipc	ra,0x0
    8000a1f8:	5f4080e7          	jalr	1524(ra) # 8000a7e8 <initlock>
    8000a1fc:	01813083          	ld	ra,24(sp)
    8000a200:	01013403          	ld	s0,16(sp)
    8000a204:	0004ac23          	sw	zero,24(s1)
    8000a208:	00813483          	ld	s1,8(sp)
    8000a20c:	02010113          	addi	sp,sp,32
    8000a210:	00008067          	ret

000000008000a214 <uartinit>:
    8000a214:	ff010113          	addi	sp,sp,-16
    8000a218:	00813423          	sd	s0,8(sp)
    8000a21c:	01010413          	addi	s0,sp,16
    8000a220:	100007b7          	lui	a5,0x10000
    8000a224:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    8000a228:	f8000713          	li	a4,-128
    8000a22c:	00e781a3          	sb	a4,3(a5)
    8000a230:	00300713          	li	a4,3
    8000a234:	00e78023          	sb	a4,0(a5)
    8000a238:	000780a3          	sb	zero,1(a5)
    8000a23c:	00e781a3          	sb	a4,3(a5)
    8000a240:	00700693          	li	a3,7
    8000a244:	00d78123          	sb	a3,2(a5)
    8000a248:	00e780a3          	sb	a4,1(a5)
    8000a24c:	00813403          	ld	s0,8(sp)
    8000a250:	01010113          	addi	sp,sp,16
    8000a254:	00008067          	ret

000000008000a258 <uartputc>:
    8000a258:	00004797          	auipc	a5,0x4
    8000a25c:	ed07a783          	lw	a5,-304(a5) # 8000e128 <panicked>
    8000a260:	00078463          	beqz	a5,8000a268 <uartputc+0x10>
    8000a264:	0000006f          	j	8000a264 <uartputc+0xc>
    8000a268:	fd010113          	addi	sp,sp,-48
    8000a26c:	02813023          	sd	s0,32(sp)
    8000a270:	00913c23          	sd	s1,24(sp)
    8000a274:	01213823          	sd	s2,16(sp)
    8000a278:	01313423          	sd	s3,8(sp)
    8000a27c:	02113423          	sd	ra,40(sp)
    8000a280:	03010413          	addi	s0,sp,48
    8000a284:	00004917          	auipc	s2,0x4
    8000a288:	eac90913          	addi	s2,s2,-340 # 8000e130 <uart_tx_r>
    8000a28c:	00093783          	ld	a5,0(s2)
    8000a290:	00004497          	auipc	s1,0x4
    8000a294:	ea848493          	addi	s1,s1,-344 # 8000e138 <uart_tx_w>
    8000a298:	0004b703          	ld	a4,0(s1)
    8000a29c:	02078693          	addi	a3,a5,32
    8000a2a0:	00050993          	mv	s3,a0
    8000a2a4:	02e69c63          	bne	a3,a4,8000a2dc <uartputc+0x84>
    8000a2a8:	00001097          	auipc	ra,0x1
    8000a2ac:	834080e7          	jalr	-1996(ra) # 8000aadc <push_on>
    8000a2b0:	00093783          	ld	a5,0(s2)
    8000a2b4:	0004b703          	ld	a4,0(s1)
    8000a2b8:	02078793          	addi	a5,a5,32
    8000a2bc:	00e79463          	bne	a5,a4,8000a2c4 <uartputc+0x6c>
    8000a2c0:	0000006f          	j	8000a2c0 <uartputc+0x68>
    8000a2c4:	00001097          	auipc	ra,0x1
    8000a2c8:	88c080e7          	jalr	-1908(ra) # 8000ab50 <pop_on>
    8000a2cc:	00093783          	ld	a5,0(s2)
    8000a2d0:	0004b703          	ld	a4,0(s1)
    8000a2d4:	02078693          	addi	a3,a5,32
    8000a2d8:	fce688e3          	beq	a3,a4,8000a2a8 <uartputc+0x50>
    8000a2dc:	01f77693          	andi	a3,a4,31
    8000a2e0:	00005597          	auipc	a1,0x5
    8000a2e4:	14058593          	addi	a1,a1,320 # 8000f420 <uart_tx_buf>
    8000a2e8:	00d586b3          	add	a3,a1,a3
    8000a2ec:	00170713          	addi	a4,a4,1
    8000a2f0:	01368023          	sb	s3,0(a3)
    8000a2f4:	00e4b023          	sd	a4,0(s1)
    8000a2f8:	10000637          	lui	a2,0x10000
    8000a2fc:	02f71063          	bne	a4,a5,8000a31c <uartputc+0xc4>
    8000a300:	0340006f          	j	8000a334 <uartputc+0xdc>
    8000a304:	00074703          	lbu	a4,0(a4)
    8000a308:	00f93023          	sd	a5,0(s2)
    8000a30c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    8000a310:	00093783          	ld	a5,0(s2)
    8000a314:	0004b703          	ld	a4,0(s1)
    8000a318:	00f70e63          	beq	a4,a5,8000a334 <uartputc+0xdc>
    8000a31c:	00564683          	lbu	a3,5(a2)
    8000a320:	01f7f713          	andi	a4,a5,31
    8000a324:	00e58733          	add	a4,a1,a4
    8000a328:	0206f693          	andi	a3,a3,32
    8000a32c:	00178793          	addi	a5,a5,1
    8000a330:	fc069ae3          	bnez	a3,8000a304 <uartputc+0xac>
    8000a334:	02813083          	ld	ra,40(sp)
    8000a338:	02013403          	ld	s0,32(sp)
    8000a33c:	01813483          	ld	s1,24(sp)
    8000a340:	01013903          	ld	s2,16(sp)
    8000a344:	00813983          	ld	s3,8(sp)
    8000a348:	03010113          	addi	sp,sp,48
    8000a34c:	00008067          	ret

000000008000a350 <uartputc_sync>:
    8000a350:	ff010113          	addi	sp,sp,-16
    8000a354:	00813423          	sd	s0,8(sp)
    8000a358:	01010413          	addi	s0,sp,16
    8000a35c:	00004717          	auipc	a4,0x4
    8000a360:	dcc72703          	lw	a4,-564(a4) # 8000e128 <panicked>
    8000a364:	02071663          	bnez	a4,8000a390 <uartputc_sync+0x40>
    8000a368:	00050793          	mv	a5,a0
    8000a36c:	100006b7          	lui	a3,0x10000
    8000a370:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    8000a374:	02077713          	andi	a4,a4,32
    8000a378:	fe070ce3          	beqz	a4,8000a370 <uartputc_sync+0x20>
    8000a37c:	0ff7f793          	andi	a5,a5,255
    8000a380:	00f68023          	sb	a5,0(a3)
    8000a384:	00813403          	ld	s0,8(sp)
    8000a388:	01010113          	addi	sp,sp,16
    8000a38c:	00008067          	ret
    8000a390:	0000006f          	j	8000a390 <uartputc_sync+0x40>

000000008000a394 <uartstart>:
    8000a394:	ff010113          	addi	sp,sp,-16
    8000a398:	00813423          	sd	s0,8(sp)
    8000a39c:	01010413          	addi	s0,sp,16
    8000a3a0:	00004617          	auipc	a2,0x4
    8000a3a4:	d9060613          	addi	a2,a2,-624 # 8000e130 <uart_tx_r>
    8000a3a8:	00004517          	auipc	a0,0x4
    8000a3ac:	d9050513          	addi	a0,a0,-624 # 8000e138 <uart_tx_w>
    8000a3b0:	00063783          	ld	a5,0(a2)
    8000a3b4:	00053703          	ld	a4,0(a0)
    8000a3b8:	04f70263          	beq	a4,a5,8000a3fc <uartstart+0x68>
    8000a3bc:	100005b7          	lui	a1,0x10000
    8000a3c0:	00005817          	auipc	a6,0x5
    8000a3c4:	06080813          	addi	a6,a6,96 # 8000f420 <uart_tx_buf>
    8000a3c8:	01c0006f          	j	8000a3e4 <uartstart+0x50>
    8000a3cc:	0006c703          	lbu	a4,0(a3)
    8000a3d0:	00f63023          	sd	a5,0(a2)
    8000a3d4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000a3d8:	00063783          	ld	a5,0(a2)
    8000a3dc:	00053703          	ld	a4,0(a0)
    8000a3e0:	00f70e63          	beq	a4,a5,8000a3fc <uartstart+0x68>
    8000a3e4:	01f7f713          	andi	a4,a5,31
    8000a3e8:	00e806b3          	add	a3,a6,a4
    8000a3ec:	0055c703          	lbu	a4,5(a1)
    8000a3f0:	00178793          	addi	a5,a5,1
    8000a3f4:	02077713          	andi	a4,a4,32
    8000a3f8:	fc071ae3          	bnez	a4,8000a3cc <uartstart+0x38>
    8000a3fc:	00813403          	ld	s0,8(sp)
    8000a400:	01010113          	addi	sp,sp,16
    8000a404:	00008067          	ret

000000008000a408 <uartgetc>:
    8000a408:	ff010113          	addi	sp,sp,-16
    8000a40c:	00813423          	sd	s0,8(sp)
    8000a410:	01010413          	addi	s0,sp,16
    8000a414:	10000737          	lui	a4,0x10000
    8000a418:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000a41c:	0017f793          	andi	a5,a5,1
    8000a420:	00078c63          	beqz	a5,8000a438 <uartgetc+0x30>
    8000a424:	00074503          	lbu	a0,0(a4)
    8000a428:	0ff57513          	andi	a0,a0,255
    8000a42c:	00813403          	ld	s0,8(sp)
    8000a430:	01010113          	addi	sp,sp,16
    8000a434:	00008067          	ret
    8000a438:	fff00513          	li	a0,-1
    8000a43c:	ff1ff06f          	j	8000a42c <uartgetc+0x24>

000000008000a440 <uartintr>:
    8000a440:	100007b7          	lui	a5,0x10000
    8000a444:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    8000a448:	0017f793          	andi	a5,a5,1
    8000a44c:	0a078463          	beqz	a5,8000a4f4 <uartintr+0xb4>
    8000a450:	fe010113          	addi	sp,sp,-32
    8000a454:	00813823          	sd	s0,16(sp)
    8000a458:	00913423          	sd	s1,8(sp)
    8000a45c:	00113c23          	sd	ra,24(sp)
    8000a460:	02010413          	addi	s0,sp,32
    8000a464:	100004b7          	lui	s1,0x10000
    8000a468:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000a46c:	0ff57513          	andi	a0,a0,255
    8000a470:	fffff097          	auipc	ra,0xfffff
    8000a474:	534080e7          	jalr	1332(ra) # 800099a4 <consoleintr>
    8000a478:	0054c783          	lbu	a5,5(s1)
    8000a47c:	0017f793          	andi	a5,a5,1
    8000a480:	fe0794e3          	bnez	a5,8000a468 <uartintr+0x28>
    8000a484:	00004617          	auipc	a2,0x4
    8000a488:	cac60613          	addi	a2,a2,-852 # 8000e130 <uart_tx_r>
    8000a48c:	00004517          	auipc	a0,0x4
    8000a490:	cac50513          	addi	a0,a0,-852 # 8000e138 <uart_tx_w>
    8000a494:	00063783          	ld	a5,0(a2)
    8000a498:	00053703          	ld	a4,0(a0)
    8000a49c:	04f70263          	beq	a4,a5,8000a4e0 <uartintr+0xa0>
    8000a4a0:	100005b7          	lui	a1,0x10000
    8000a4a4:	00005817          	auipc	a6,0x5
    8000a4a8:	f7c80813          	addi	a6,a6,-132 # 8000f420 <uart_tx_buf>
    8000a4ac:	01c0006f          	j	8000a4c8 <uartintr+0x88>
    8000a4b0:	0006c703          	lbu	a4,0(a3)
    8000a4b4:	00f63023          	sd	a5,0(a2)
    8000a4b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000a4bc:	00063783          	ld	a5,0(a2)
    8000a4c0:	00053703          	ld	a4,0(a0)
    8000a4c4:	00f70e63          	beq	a4,a5,8000a4e0 <uartintr+0xa0>
    8000a4c8:	01f7f713          	andi	a4,a5,31
    8000a4cc:	00e806b3          	add	a3,a6,a4
    8000a4d0:	0055c703          	lbu	a4,5(a1)
    8000a4d4:	00178793          	addi	a5,a5,1
    8000a4d8:	02077713          	andi	a4,a4,32
    8000a4dc:	fc071ae3          	bnez	a4,8000a4b0 <uartintr+0x70>
    8000a4e0:	01813083          	ld	ra,24(sp)
    8000a4e4:	01013403          	ld	s0,16(sp)
    8000a4e8:	00813483          	ld	s1,8(sp)
    8000a4ec:	02010113          	addi	sp,sp,32
    8000a4f0:	00008067          	ret
    8000a4f4:	00004617          	auipc	a2,0x4
    8000a4f8:	c3c60613          	addi	a2,a2,-964 # 8000e130 <uart_tx_r>
    8000a4fc:	00004517          	auipc	a0,0x4
    8000a500:	c3c50513          	addi	a0,a0,-964 # 8000e138 <uart_tx_w>
    8000a504:	00063783          	ld	a5,0(a2)
    8000a508:	00053703          	ld	a4,0(a0)
    8000a50c:	04f70263          	beq	a4,a5,8000a550 <uartintr+0x110>
    8000a510:	100005b7          	lui	a1,0x10000
    8000a514:	00005817          	auipc	a6,0x5
    8000a518:	f0c80813          	addi	a6,a6,-244 # 8000f420 <uart_tx_buf>
    8000a51c:	01c0006f          	j	8000a538 <uartintr+0xf8>
    8000a520:	0006c703          	lbu	a4,0(a3)
    8000a524:	00f63023          	sd	a5,0(a2)
    8000a528:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000a52c:	00063783          	ld	a5,0(a2)
    8000a530:	00053703          	ld	a4,0(a0)
    8000a534:	02f70063          	beq	a4,a5,8000a554 <uartintr+0x114>
    8000a538:	01f7f713          	andi	a4,a5,31
    8000a53c:	00e806b3          	add	a3,a6,a4
    8000a540:	0055c703          	lbu	a4,5(a1)
    8000a544:	00178793          	addi	a5,a5,1
    8000a548:	02077713          	andi	a4,a4,32
    8000a54c:	fc071ae3          	bnez	a4,8000a520 <uartintr+0xe0>
    8000a550:	00008067          	ret
    8000a554:	00008067          	ret

000000008000a558 <kinit>:
    8000a558:	fc010113          	addi	sp,sp,-64
    8000a55c:	02913423          	sd	s1,40(sp)
    8000a560:	fffff7b7          	lui	a5,0xfffff
    8000a564:	00006497          	auipc	s1,0x6
    8000a568:	edb48493          	addi	s1,s1,-293 # 8001043f <end+0xfff>
    8000a56c:	02813823          	sd	s0,48(sp)
    8000a570:	01313c23          	sd	s3,24(sp)
    8000a574:	00f4f4b3          	and	s1,s1,a5
    8000a578:	02113c23          	sd	ra,56(sp)
    8000a57c:	03213023          	sd	s2,32(sp)
    8000a580:	01413823          	sd	s4,16(sp)
    8000a584:	01513423          	sd	s5,8(sp)
    8000a588:	04010413          	addi	s0,sp,64
    8000a58c:	000017b7          	lui	a5,0x1
    8000a590:	01100993          	li	s3,17
    8000a594:	00f487b3          	add	a5,s1,a5
    8000a598:	01b99993          	slli	s3,s3,0x1b
    8000a59c:	06f9e063          	bltu	s3,a5,8000a5fc <kinit+0xa4>
    8000a5a0:	00005a97          	auipc	s5,0x5
    8000a5a4:	ea0a8a93          	addi	s5,s5,-352 # 8000f440 <end>
    8000a5a8:	0754ec63          	bltu	s1,s5,8000a620 <kinit+0xc8>
    8000a5ac:	0734fa63          	bgeu	s1,s3,8000a620 <kinit+0xc8>
    8000a5b0:	00088a37          	lui	s4,0x88
    8000a5b4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    8000a5b8:	00004917          	auipc	s2,0x4
    8000a5bc:	b8890913          	addi	s2,s2,-1144 # 8000e140 <kmem>
    8000a5c0:	00ca1a13          	slli	s4,s4,0xc
    8000a5c4:	0140006f          	j	8000a5d8 <kinit+0x80>
    8000a5c8:	000017b7          	lui	a5,0x1
    8000a5cc:	00f484b3          	add	s1,s1,a5
    8000a5d0:	0554e863          	bltu	s1,s5,8000a620 <kinit+0xc8>
    8000a5d4:	0534f663          	bgeu	s1,s3,8000a620 <kinit+0xc8>
    8000a5d8:	00001637          	lui	a2,0x1
    8000a5dc:	00100593          	li	a1,1
    8000a5e0:	00048513          	mv	a0,s1
    8000a5e4:	00000097          	auipc	ra,0x0
    8000a5e8:	5e4080e7          	jalr	1508(ra) # 8000abc8 <__memset>
    8000a5ec:	00093783          	ld	a5,0(s2)
    8000a5f0:	00f4b023          	sd	a5,0(s1)
    8000a5f4:	00993023          	sd	s1,0(s2)
    8000a5f8:	fd4498e3          	bne	s1,s4,8000a5c8 <kinit+0x70>
    8000a5fc:	03813083          	ld	ra,56(sp)
    8000a600:	03013403          	ld	s0,48(sp)
    8000a604:	02813483          	ld	s1,40(sp)
    8000a608:	02013903          	ld	s2,32(sp)
    8000a60c:	01813983          	ld	s3,24(sp)
    8000a610:	01013a03          	ld	s4,16(sp)
    8000a614:	00813a83          	ld	s5,8(sp)
    8000a618:	04010113          	addi	sp,sp,64
    8000a61c:	00008067          	ret
    8000a620:	00001517          	auipc	a0,0x1
    8000a624:	52050513          	addi	a0,a0,1312 # 8000bb40 <digits+0x18>
    8000a628:	fffff097          	auipc	ra,0xfffff
    8000a62c:	4b4080e7          	jalr	1204(ra) # 80009adc <panic>

000000008000a630 <freerange>:
    8000a630:	fc010113          	addi	sp,sp,-64
    8000a634:	000017b7          	lui	a5,0x1
    8000a638:	02913423          	sd	s1,40(sp)
    8000a63c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    8000a640:	009504b3          	add	s1,a0,s1
    8000a644:	fffff537          	lui	a0,0xfffff
    8000a648:	02813823          	sd	s0,48(sp)
    8000a64c:	02113c23          	sd	ra,56(sp)
    8000a650:	03213023          	sd	s2,32(sp)
    8000a654:	01313c23          	sd	s3,24(sp)
    8000a658:	01413823          	sd	s4,16(sp)
    8000a65c:	01513423          	sd	s5,8(sp)
    8000a660:	01613023          	sd	s6,0(sp)
    8000a664:	04010413          	addi	s0,sp,64
    8000a668:	00a4f4b3          	and	s1,s1,a0
    8000a66c:	00f487b3          	add	a5,s1,a5
    8000a670:	06f5e463          	bltu	a1,a5,8000a6d8 <freerange+0xa8>
    8000a674:	00005a97          	auipc	s5,0x5
    8000a678:	dcca8a93          	addi	s5,s5,-564 # 8000f440 <end>
    8000a67c:	0954e263          	bltu	s1,s5,8000a700 <freerange+0xd0>
    8000a680:	01100993          	li	s3,17
    8000a684:	01b99993          	slli	s3,s3,0x1b
    8000a688:	0734fc63          	bgeu	s1,s3,8000a700 <freerange+0xd0>
    8000a68c:	00058a13          	mv	s4,a1
    8000a690:	00004917          	auipc	s2,0x4
    8000a694:	ab090913          	addi	s2,s2,-1360 # 8000e140 <kmem>
    8000a698:	00002b37          	lui	s6,0x2
    8000a69c:	0140006f          	j	8000a6b0 <freerange+0x80>
    8000a6a0:	000017b7          	lui	a5,0x1
    8000a6a4:	00f484b3          	add	s1,s1,a5
    8000a6a8:	0554ec63          	bltu	s1,s5,8000a700 <freerange+0xd0>
    8000a6ac:	0534fa63          	bgeu	s1,s3,8000a700 <freerange+0xd0>
    8000a6b0:	00001637          	lui	a2,0x1
    8000a6b4:	00100593          	li	a1,1
    8000a6b8:	00048513          	mv	a0,s1
    8000a6bc:	00000097          	auipc	ra,0x0
    8000a6c0:	50c080e7          	jalr	1292(ra) # 8000abc8 <__memset>
    8000a6c4:	00093703          	ld	a4,0(s2)
    8000a6c8:	016487b3          	add	a5,s1,s6
    8000a6cc:	00e4b023          	sd	a4,0(s1)
    8000a6d0:	00993023          	sd	s1,0(s2)
    8000a6d4:	fcfa76e3          	bgeu	s4,a5,8000a6a0 <freerange+0x70>
    8000a6d8:	03813083          	ld	ra,56(sp)
    8000a6dc:	03013403          	ld	s0,48(sp)
    8000a6e0:	02813483          	ld	s1,40(sp)
    8000a6e4:	02013903          	ld	s2,32(sp)
    8000a6e8:	01813983          	ld	s3,24(sp)
    8000a6ec:	01013a03          	ld	s4,16(sp)
    8000a6f0:	00813a83          	ld	s5,8(sp)
    8000a6f4:	00013b03          	ld	s6,0(sp)
    8000a6f8:	04010113          	addi	sp,sp,64
    8000a6fc:	00008067          	ret
    8000a700:	00001517          	auipc	a0,0x1
    8000a704:	44050513          	addi	a0,a0,1088 # 8000bb40 <digits+0x18>
    8000a708:	fffff097          	auipc	ra,0xfffff
    8000a70c:	3d4080e7          	jalr	980(ra) # 80009adc <panic>

000000008000a710 <kfree>:
    8000a710:	fe010113          	addi	sp,sp,-32
    8000a714:	00813823          	sd	s0,16(sp)
    8000a718:	00113c23          	sd	ra,24(sp)
    8000a71c:	00913423          	sd	s1,8(sp)
    8000a720:	02010413          	addi	s0,sp,32
    8000a724:	03451793          	slli	a5,a0,0x34
    8000a728:	04079c63          	bnez	a5,8000a780 <kfree+0x70>
    8000a72c:	00005797          	auipc	a5,0x5
    8000a730:	d1478793          	addi	a5,a5,-748 # 8000f440 <end>
    8000a734:	00050493          	mv	s1,a0
    8000a738:	04f56463          	bltu	a0,a5,8000a780 <kfree+0x70>
    8000a73c:	01100793          	li	a5,17
    8000a740:	01b79793          	slli	a5,a5,0x1b
    8000a744:	02f57e63          	bgeu	a0,a5,8000a780 <kfree+0x70>
    8000a748:	00001637          	lui	a2,0x1
    8000a74c:	00100593          	li	a1,1
    8000a750:	00000097          	auipc	ra,0x0
    8000a754:	478080e7          	jalr	1144(ra) # 8000abc8 <__memset>
    8000a758:	00004797          	auipc	a5,0x4
    8000a75c:	9e878793          	addi	a5,a5,-1560 # 8000e140 <kmem>
    8000a760:	0007b703          	ld	a4,0(a5)
    8000a764:	01813083          	ld	ra,24(sp)
    8000a768:	01013403          	ld	s0,16(sp)
    8000a76c:	00e4b023          	sd	a4,0(s1)
    8000a770:	0097b023          	sd	s1,0(a5)
    8000a774:	00813483          	ld	s1,8(sp)
    8000a778:	02010113          	addi	sp,sp,32
    8000a77c:	00008067          	ret
    8000a780:	00001517          	auipc	a0,0x1
    8000a784:	3c050513          	addi	a0,a0,960 # 8000bb40 <digits+0x18>
    8000a788:	fffff097          	auipc	ra,0xfffff
    8000a78c:	354080e7          	jalr	852(ra) # 80009adc <panic>

000000008000a790 <kalloc>:
    8000a790:	fe010113          	addi	sp,sp,-32
    8000a794:	00813823          	sd	s0,16(sp)
    8000a798:	00913423          	sd	s1,8(sp)
    8000a79c:	00113c23          	sd	ra,24(sp)
    8000a7a0:	02010413          	addi	s0,sp,32
    8000a7a4:	00004797          	auipc	a5,0x4
    8000a7a8:	99c78793          	addi	a5,a5,-1636 # 8000e140 <kmem>
    8000a7ac:	0007b483          	ld	s1,0(a5)
    8000a7b0:	02048063          	beqz	s1,8000a7d0 <kalloc+0x40>
    8000a7b4:	0004b703          	ld	a4,0(s1)
    8000a7b8:	00001637          	lui	a2,0x1
    8000a7bc:	00500593          	li	a1,5
    8000a7c0:	00048513          	mv	a0,s1
    8000a7c4:	00e7b023          	sd	a4,0(a5)
    8000a7c8:	00000097          	auipc	ra,0x0
    8000a7cc:	400080e7          	jalr	1024(ra) # 8000abc8 <__memset>
    8000a7d0:	01813083          	ld	ra,24(sp)
    8000a7d4:	01013403          	ld	s0,16(sp)
    8000a7d8:	00048513          	mv	a0,s1
    8000a7dc:	00813483          	ld	s1,8(sp)
    8000a7e0:	02010113          	addi	sp,sp,32
    8000a7e4:	00008067          	ret

000000008000a7e8 <initlock>:
    8000a7e8:	ff010113          	addi	sp,sp,-16
    8000a7ec:	00813423          	sd	s0,8(sp)
    8000a7f0:	01010413          	addi	s0,sp,16
    8000a7f4:	00813403          	ld	s0,8(sp)
    8000a7f8:	00b53423          	sd	a1,8(a0)
    8000a7fc:	00052023          	sw	zero,0(a0)
    8000a800:	00053823          	sd	zero,16(a0)
    8000a804:	01010113          	addi	sp,sp,16
    8000a808:	00008067          	ret

000000008000a80c <acquire>:
    8000a80c:	fe010113          	addi	sp,sp,-32
    8000a810:	00813823          	sd	s0,16(sp)
    8000a814:	00913423          	sd	s1,8(sp)
    8000a818:	00113c23          	sd	ra,24(sp)
    8000a81c:	01213023          	sd	s2,0(sp)
    8000a820:	02010413          	addi	s0,sp,32
    8000a824:	00050493          	mv	s1,a0
    8000a828:	10002973          	csrr	s2,sstatus
    8000a82c:	100027f3          	csrr	a5,sstatus
    8000a830:	ffd7f793          	andi	a5,a5,-3
    8000a834:	10079073          	csrw	sstatus,a5
    8000a838:	fffff097          	auipc	ra,0xfffff
    8000a83c:	8e0080e7          	jalr	-1824(ra) # 80009118 <mycpu>
    8000a840:	07852783          	lw	a5,120(a0)
    8000a844:	06078e63          	beqz	a5,8000a8c0 <acquire+0xb4>
    8000a848:	fffff097          	auipc	ra,0xfffff
    8000a84c:	8d0080e7          	jalr	-1840(ra) # 80009118 <mycpu>
    8000a850:	07852783          	lw	a5,120(a0)
    8000a854:	0004a703          	lw	a4,0(s1)
    8000a858:	0017879b          	addiw	a5,a5,1
    8000a85c:	06f52c23          	sw	a5,120(a0)
    8000a860:	04071063          	bnez	a4,8000a8a0 <acquire+0x94>
    8000a864:	00100713          	li	a4,1
    8000a868:	00070793          	mv	a5,a4
    8000a86c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    8000a870:	0007879b          	sext.w	a5,a5
    8000a874:	fe079ae3          	bnez	a5,8000a868 <acquire+0x5c>
    8000a878:	0ff0000f          	fence
    8000a87c:	fffff097          	auipc	ra,0xfffff
    8000a880:	89c080e7          	jalr	-1892(ra) # 80009118 <mycpu>
    8000a884:	01813083          	ld	ra,24(sp)
    8000a888:	01013403          	ld	s0,16(sp)
    8000a88c:	00a4b823          	sd	a0,16(s1)
    8000a890:	00013903          	ld	s2,0(sp)
    8000a894:	00813483          	ld	s1,8(sp)
    8000a898:	02010113          	addi	sp,sp,32
    8000a89c:	00008067          	ret
    8000a8a0:	0104b903          	ld	s2,16(s1)
    8000a8a4:	fffff097          	auipc	ra,0xfffff
    8000a8a8:	874080e7          	jalr	-1932(ra) # 80009118 <mycpu>
    8000a8ac:	faa91ce3          	bne	s2,a0,8000a864 <acquire+0x58>
    8000a8b0:	00001517          	auipc	a0,0x1
    8000a8b4:	29850513          	addi	a0,a0,664 # 8000bb48 <digits+0x20>
    8000a8b8:	fffff097          	auipc	ra,0xfffff
    8000a8bc:	224080e7          	jalr	548(ra) # 80009adc <panic>
    8000a8c0:	00195913          	srli	s2,s2,0x1
    8000a8c4:	fffff097          	auipc	ra,0xfffff
    8000a8c8:	854080e7          	jalr	-1964(ra) # 80009118 <mycpu>
    8000a8cc:	00197913          	andi	s2,s2,1
    8000a8d0:	07252e23          	sw	s2,124(a0)
    8000a8d4:	f75ff06f          	j	8000a848 <acquire+0x3c>

000000008000a8d8 <release>:
    8000a8d8:	fe010113          	addi	sp,sp,-32
    8000a8dc:	00813823          	sd	s0,16(sp)
    8000a8e0:	00113c23          	sd	ra,24(sp)
    8000a8e4:	00913423          	sd	s1,8(sp)
    8000a8e8:	01213023          	sd	s2,0(sp)
    8000a8ec:	02010413          	addi	s0,sp,32
    8000a8f0:	00052783          	lw	a5,0(a0)
    8000a8f4:	00079a63          	bnez	a5,8000a908 <release+0x30>
    8000a8f8:	00001517          	auipc	a0,0x1
    8000a8fc:	25850513          	addi	a0,a0,600 # 8000bb50 <digits+0x28>
    8000a900:	fffff097          	auipc	ra,0xfffff
    8000a904:	1dc080e7          	jalr	476(ra) # 80009adc <panic>
    8000a908:	01053903          	ld	s2,16(a0)
    8000a90c:	00050493          	mv	s1,a0
    8000a910:	fffff097          	auipc	ra,0xfffff
    8000a914:	808080e7          	jalr	-2040(ra) # 80009118 <mycpu>
    8000a918:	fea910e3          	bne	s2,a0,8000a8f8 <release+0x20>
    8000a91c:	0004b823          	sd	zero,16(s1)
    8000a920:	0ff0000f          	fence
    8000a924:	0f50000f          	fence	iorw,ow
    8000a928:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000a92c:	ffffe097          	auipc	ra,0xffffe
    8000a930:	7ec080e7          	jalr	2028(ra) # 80009118 <mycpu>
    8000a934:	100027f3          	csrr	a5,sstatus
    8000a938:	0027f793          	andi	a5,a5,2
    8000a93c:	04079a63          	bnez	a5,8000a990 <release+0xb8>
    8000a940:	07852783          	lw	a5,120(a0)
    8000a944:	02f05e63          	blez	a5,8000a980 <release+0xa8>
    8000a948:	fff7871b          	addiw	a4,a5,-1
    8000a94c:	06e52c23          	sw	a4,120(a0)
    8000a950:	00071c63          	bnez	a4,8000a968 <release+0x90>
    8000a954:	07c52783          	lw	a5,124(a0)
    8000a958:	00078863          	beqz	a5,8000a968 <release+0x90>
    8000a95c:	100027f3          	csrr	a5,sstatus
    8000a960:	0027e793          	ori	a5,a5,2
    8000a964:	10079073          	csrw	sstatus,a5
    8000a968:	01813083          	ld	ra,24(sp)
    8000a96c:	01013403          	ld	s0,16(sp)
    8000a970:	00813483          	ld	s1,8(sp)
    8000a974:	00013903          	ld	s2,0(sp)
    8000a978:	02010113          	addi	sp,sp,32
    8000a97c:	00008067          	ret
    8000a980:	00001517          	auipc	a0,0x1
    8000a984:	1f050513          	addi	a0,a0,496 # 8000bb70 <digits+0x48>
    8000a988:	fffff097          	auipc	ra,0xfffff
    8000a98c:	154080e7          	jalr	340(ra) # 80009adc <panic>
    8000a990:	00001517          	auipc	a0,0x1
    8000a994:	1c850513          	addi	a0,a0,456 # 8000bb58 <digits+0x30>
    8000a998:	fffff097          	auipc	ra,0xfffff
    8000a99c:	144080e7          	jalr	324(ra) # 80009adc <panic>

000000008000a9a0 <holding>:
    8000a9a0:	00052783          	lw	a5,0(a0)
    8000a9a4:	00079663          	bnez	a5,8000a9b0 <holding+0x10>
    8000a9a8:	00000513          	li	a0,0
    8000a9ac:	00008067          	ret
    8000a9b0:	fe010113          	addi	sp,sp,-32
    8000a9b4:	00813823          	sd	s0,16(sp)
    8000a9b8:	00913423          	sd	s1,8(sp)
    8000a9bc:	00113c23          	sd	ra,24(sp)
    8000a9c0:	02010413          	addi	s0,sp,32
    8000a9c4:	01053483          	ld	s1,16(a0)
    8000a9c8:	ffffe097          	auipc	ra,0xffffe
    8000a9cc:	750080e7          	jalr	1872(ra) # 80009118 <mycpu>
    8000a9d0:	01813083          	ld	ra,24(sp)
    8000a9d4:	01013403          	ld	s0,16(sp)
    8000a9d8:	40a48533          	sub	a0,s1,a0
    8000a9dc:	00153513          	seqz	a0,a0
    8000a9e0:	00813483          	ld	s1,8(sp)
    8000a9e4:	02010113          	addi	sp,sp,32
    8000a9e8:	00008067          	ret

000000008000a9ec <push_off>:
    8000a9ec:	fe010113          	addi	sp,sp,-32
    8000a9f0:	00813823          	sd	s0,16(sp)
    8000a9f4:	00113c23          	sd	ra,24(sp)
    8000a9f8:	00913423          	sd	s1,8(sp)
    8000a9fc:	02010413          	addi	s0,sp,32
    8000aa00:	100024f3          	csrr	s1,sstatus
    8000aa04:	100027f3          	csrr	a5,sstatus
    8000aa08:	ffd7f793          	andi	a5,a5,-3
    8000aa0c:	10079073          	csrw	sstatus,a5
    8000aa10:	ffffe097          	auipc	ra,0xffffe
    8000aa14:	708080e7          	jalr	1800(ra) # 80009118 <mycpu>
    8000aa18:	07852783          	lw	a5,120(a0)
    8000aa1c:	02078663          	beqz	a5,8000aa48 <push_off+0x5c>
    8000aa20:	ffffe097          	auipc	ra,0xffffe
    8000aa24:	6f8080e7          	jalr	1784(ra) # 80009118 <mycpu>
    8000aa28:	07852783          	lw	a5,120(a0)
    8000aa2c:	01813083          	ld	ra,24(sp)
    8000aa30:	01013403          	ld	s0,16(sp)
    8000aa34:	0017879b          	addiw	a5,a5,1
    8000aa38:	06f52c23          	sw	a5,120(a0)
    8000aa3c:	00813483          	ld	s1,8(sp)
    8000aa40:	02010113          	addi	sp,sp,32
    8000aa44:	00008067          	ret
    8000aa48:	0014d493          	srli	s1,s1,0x1
    8000aa4c:	ffffe097          	auipc	ra,0xffffe
    8000aa50:	6cc080e7          	jalr	1740(ra) # 80009118 <mycpu>
    8000aa54:	0014f493          	andi	s1,s1,1
    8000aa58:	06952e23          	sw	s1,124(a0)
    8000aa5c:	fc5ff06f          	j	8000aa20 <push_off+0x34>

000000008000aa60 <pop_off>:
    8000aa60:	ff010113          	addi	sp,sp,-16
    8000aa64:	00813023          	sd	s0,0(sp)
    8000aa68:	00113423          	sd	ra,8(sp)
    8000aa6c:	01010413          	addi	s0,sp,16
    8000aa70:	ffffe097          	auipc	ra,0xffffe
    8000aa74:	6a8080e7          	jalr	1704(ra) # 80009118 <mycpu>
    8000aa78:	100027f3          	csrr	a5,sstatus
    8000aa7c:	0027f793          	andi	a5,a5,2
    8000aa80:	04079663          	bnez	a5,8000aacc <pop_off+0x6c>
    8000aa84:	07852783          	lw	a5,120(a0)
    8000aa88:	02f05a63          	blez	a5,8000aabc <pop_off+0x5c>
    8000aa8c:	fff7871b          	addiw	a4,a5,-1
    8000aa90:	06e52c23          	sw	a4,120(a0)
    8000aa94:	00071c63          	bnez	a4,8000aaac <pop_off+0x4c>
    8000aa98:	07c52783          	lw	a5,124(a0)
    8000aa9c:	00078863          	beqz	a5,8000aaac <pop_off+0x4c>
    8000aaa0:	100027f3          	csrr	a5,sstatus
    8000aaa4:	0027e793          	ori	a5,a5,2
    8000aaa8:	10079073          	csrw	sstatus,a5
    8000aaac:	00813083          	ld	ra,8(sp)
    8000aab0:	00013403          	ld	s0,0(sp)
    8000aab4:	01010113          	addi	sp,sp,16
    8000aab8:	00008067          	ret
    8000aabc:	00001517          	auipc	a0,0x1
    8000aac0:	0b450513          	addi	a0,a0,180 # 8000bb70 <digits+0x48>
    8000aac4:	fffff097          	auipc	ra,0xfffff
    8000aac8:	018080e7          	jalr	24(ra) # 80009adc <panic>
    8000aacc:	00001517          	auipc	a0,0x1
    8000aad0:	08c50513          	addi	a0,a0,140 # 8000bb58 <digits+0x30>
    8000aad4:	fffff097          	auipc	ra,0xfffff
    8000aad8:	008080e7          	jalr	8(ra) # 80009adc <panic>

000000008000aadc <push_on>:
    8000aadc:	fe010113          	addi	sp,sp,-32
    8000aae0:	00813823          	sd	s0,16(sp)
    8000aae4:	00113c23          	sd	ra,24(sp)
    8000aae8:	00913423          	sd	s1,8(sp)
    8000aaec:	02010413          	addi	s0,sp,32
    8000aaf0:	100024f3          	csrr	s1,sstatus
    8000aaf4:	100027f3          	csrr	a5,sstatus
    8000aaf8:	0027e793          	ori	a5,a5,2
    8000aafc:	10079073          	csrw	sstatus,a5
    8000ab00:	ffffe097          	auipc	ra,0xffffe
    8000ab04:	618080e7          	jalr	1560(ra) # 80009118 <mycpu>
    8000ab08:	07852783          	lw	a5,120(a0)
    8000ab0c:	02078663          	beqz	a5,8000ab38 <push_on+0x5c>
    8000ab10:	ffffe097          	auipc	ra,0xffffe
    8000ab14:	608080e7          	jalr	1544(ra) # 80009118 <mycpu>
    8000ab18:	07852783          	lw	a5,120(a0)
    8000ab1c:	01813083          	ld	ra,24(sp)
    8000ab20:	01013403          	ld	s0,16(sp)
    8000ab24:	0017879b          	addiw	a5,a5,1
    8000ab28:	06f52c23          	sw	a5,120(a0)
    8000ab2c:	00813483          	ld	s1,8(sp)
    8000ab30:	02010113          	addi	sp,sp,32
    8000ab34:	00008067          	ret
    8000ab38:	0014d493          	srli	s1,s1,0x1
    8000ab3c:	ffffe097          	auipc	ra,0xffffe
    8000ab40:	5dc080e7          	jalr	1500(ra) # 80009118 <mycpu>
    8000ab44:	0014f493          	andi	s1,s1,1
    8000ab48:	06952e23          	sw	s1,124(a0)
    8000ab4c:	fc5ff06f          	j	8000ab10 <push_on+0x34>

000000008000ab50 <pop_on>:
    8000ab50:	ff010113          	addi	sp,sp,-16
    8000ab54:	00813023          	sd	s0,0(sp)
    8000ab58:	00113423          	sd	ra,8(sp)
    8000ab5c:	01010413          	addi	s0,sp,16
    8000ab60:	ffffe097          	auipc	ra,0xffffe
    8000ab64:	5b8080e7          	jalr	1464(ra) # 80009118 <mycpu>
    8000ab68:	100027f3          	csrr	a5,sstatus
    8000ab6c:	0027f793          	andi	a5,a5,2
    8000ab70:	04078463          	beqz	a5,8000abb8 <pop_on+0x68>
    8000ab74:	07852783          	lw	a5,120(a0)
    8000ab78:	02f05863          	blez	a5,8000aba8 <pop_on+0x58>
    8000ab7c:	fff7879b          	addiw	a5,a5,-1
    8000ab80:	06f52c23          	sw	a5,120(a0)
    8000ab84:	07853783          	ld	a5,120(a0)
    8000ab88:	00079863          	bnez	a5,8000ab98 <pop_on+0x48>
    8000ab8c:	100027f3          	csrr	a5,sstatus
    8000ab90:	ffd7f793          	andi	a5,a5,-3
    8000ab94:	10079073          	csrw	sstatus,a5
    8000ab98:	00813083          	ld	ra,8(sp)
    8000ab9c:	00013403          	ld	s0,0(sp)
    8000aba0:	01010113          	addi	sp,sp,16
    8000aba4:	00008067          	ret
    8000aba8:	00001517          	auipc	a0,0x1
    8000abac:	ff050513          	addi	a0,a0,-16 # 8000bb98 <digits+0x70>
    8000abb0:	fffff097          	auipc	ra,0xfffff
    8000abb4:	f2c080e7          	jalr	-212(ra) # 80009adc <panic>
    8000abb8:	00001517          	auipc	a0,0x1
    8000abbc:	fc050513          	addi	a0,a0,-64 # 8000bb78 <digits+0x50>
    8000abc0:	fffff097          	auipc	ra,0xfffff
    8000abc4:	f1c080e7          	jalr	-228(ra) # 80009adc <panic>

000000008000abc8 <__memset>:
    8000abc8:	ff010113          	addi	sp,sp,-16
    8000abcc:	00813423          	sd	s0,8(sp)
    8000abd0:	01010413          	addi	s0,sp,16
    8000abd4:	1a060e63          	beqz	a2,8000ad90 <__memset+0x1c8>
    8000abd8:	40a007b3          	neg	a5,a0
    8000abdc:	0077f793          	andi	a5,a5,7
    8000abe0:	00778693          	addi	a3,a5,7
    8000abe4:	00b00813          	li	a6,11
    8000abe8:	0ff5f593          	andi	a1,a1,255
    8000abec:	fff6071b          	addiw	a4,a2,-1
    8000abf0:	1b06e663          	bltu	a3,a6,8000ad9c <__memset+0x1d4>
    8000abf4:	1cd76463          	bltu	a4,a3,8000adbc <__memset+0x1f4>
    8000abf8:	1a078e63          	beqz	a5,8000adb4 <__memset+0x1ec>
    8000abfc:	00b50023          	sb	a1,0(a0)
    8000ac00:	00100713          	li	a4,1
    8000ac04:	1ae78463          	beq	a5,a4,8000adac <__memset+0x1e4>
    8000ac08:	00b500a3          	sb	a1,1(a0)
    8000ac0c:	00200713          	li	a4,2
    8000ac10:	1ae78a63          	beq	a5,a4,8000adc4 <__memset+0x1fc>
    8000ac14:	00b50123          	sb	a1,2(a0)
    8000ac18:	00300713          	li	a4,3
    8000ac1c:	18e78463          	beq	a5,a4,8000ada4 <__memset+0x1dc>
    8000ac20:	00b501a3          	sb	a1,3(a0)
    8000ac24:	00400713          	li	a4,4
    8000ac28:	1ae78263          	beq	a5,a4,8000adcc <__memset+0x204>
    8000ac2c:	00b50223          	sb	a1,4(a0)
    8000ac30:	00500713          	li	a4,5
    8000ac34:	1ae78063          	beq	a5,a4,8000add4 <__memset+0x20c>
    8000ac38:	00b502a3          	sb	a1,5(a0)
    8000ac3c:	00700713          	li	a4,7
    8000ac40:	18e79e63          	bne	a5,a4,8000addc <__memset+0x214>
    8000ac44:	00b50323          	sb	a1,6(a0)
    8000ac48:	00700e93          	li	t4,7
    8000ac4c:	00859713          	slli	a4,a1,0x8
    8000ac50:	00e5e733          	or	a4,a1,a4
    8000ac54:	01059e13          	slli	t3,a1,0x10
    8000ac58:	01c76e33          	or	t3,a4,t3
    8000ac5c:	01859313          	slli	t1,a1,0x18
    8000ac60:	006e6333          	or	t1,t3,t1
    8000ac64:	02059893          	slli	a7,a1,0x20
    8000ac68:	40f60e3b          	subw	t3,a2,a5
    8000ac6c:	011368b3          	or	a7,t1,a7
    8000ac70:	02859813          	slli	a6,a1,0x28
    8000ac74:	0108e833          	or	a6,a7,a6
    8000ac78:	03059693          	slli	a3,a1,0x30
    8000ac7c:	003e589b          	srliw	a7,t3,0x3
    8000ac80:	00d866b3          	or	a3,a6,a3
    8000ac84:	03859713          	slli	a4,a1,0x38
    8000ac88:	00389813          	slli	a6,a7,0x3
    8000ac8c:	00f507b3          	add	a5,a0,a5
    8000ac90:	00e6e733          	or	a4,a3,a4
    8000ac94:	000e089b          	sext.w	a7,t3
    8000ac98:	00f806b3          	add	a3,a6,a5
    8000ac9c:	00e7b023          	sd	a4,0(a5)
    8000aca0:	00878793          	addi	a5,a5,8
    8000aca4:	fed79ce3          	bne	a5,a3,8000ac9c <__memset+0xd4>
    8000aca8:	ff8e7793          	andi	a5,t3,-8
    8000acac:	0007871b          	sext.w	a4,a5
    8000acb0:	01d787bb          	addw	a5,a5,t4
    8000acb4:	0ce88e63          	beq	a7,a4,8000ad90 <__memset+0x1c8>
    8000acb8:	00f50733          	add	a4,a0,a5
    8000acbc:	00b70023          	sb	a1,0(a4)
    8000acc0:	0017871b          	addiw	a4,a5,1
    8000acc4:	0cc77663          	bgeu	a4,a2,8000ad90 <__memset+0x1c8>
    8000acc8:	00e50733          	add	a4,a0,a4
    8000accc:	00b70023          	sb	a1,0(a4)
    8000acd0:	0027871b          	addiw	a4,a5,2
    8000acd4:	0ac77e63          	bgeu	a4,a2,8000ad90 <__memset+0x1c8>
    8000acd8:	00e50733          	add	a4,a0,a4
    8000acdc:	00b70023          	sb	a1,0(a4)
    8000ace0:	0037871b          	addiw	a4,a5,3
    8000ace4:	0ac77663          	bgeu	a4,a2,8000ad90 <__memset+0x1c8>
    8000ace8:	00e50733          	add	a4,a0,a4
    8000acec:	00b70023          	sb	a1,0(a4)
    8000acf0:	0047871b          	addiw	a4,a5,4
    8000acf4:	08c77e63          	bgeu	a4,a2,8000ad90 <__memset+0x1c8>
    8000acf8:	00e50733          	add	a4,a0,a4
    8000acfc:	00b70023          	sb	a1,0(a4)
    8000ad00:	0057871b          	addiw	a4,a5,5
    8000ad04:	08c77663          	bgeu	a4,a2,8000ad90 <__memset+0x1c8>
    8000ad08:	00e50733          	add	a4,a0,a4
    8000ad0c:	00b70023          	sb	a1,0(a4)
    8000ad10:	0067871b          	addiw	a4,a5,6
    8000ad14:	06c77e63          	bgeu	a4,a2,8000ad90 <__memset+0x1c8>
    8000ad18:	00e50733          	add	a4,a0,a4
    8000ad1c:	00b70023          	sb	a1,0(a4)
    8000ad20:	0077871b          	addiw	a4,a5,7
    8000ad24:	06c77663          	bgeu	a4,a2,8000ad90 <__memset+0x1c8>
    8000ad28:	00e50733          	add	a4,a0,a4
    8000ad2c:	00b70023          	sb	a1,0(a4)
    8000ad30:	0087871b          	addiw	a4,a5,8
    8000ad34:	04c77e63          	bgeu	a4,a2,8000ad90 <__memset+0x1c8>
    8000ad38:	00e50733          	add	a4,a0,a4
    8000ad3c:	00b70023          	sb	a1,0(a4)
    8000ad40:	0097871b          	addiw	a4,a5,9
    8000ad44:	04c77663          	bgeu	a4,a2,8000ad90 <__memset+0x1c8>
    8000ad48:	00e50733          	add	a4,a0,a4
    8000ad4c:	00b70023          	sb	a1,0(a4)
    8000ad50:	00a7871b          	addiw	a4,a5,10
    8000ad54:	02c77e63          	bgeu	a4,a2,8000ad90 <__memset+0x1c8>
    8000ad58:	00e50733          	add	a4,a0,a4
    8000ad5c:	00b70023          	sb	a1,0(a4)
    8000ad60:	00b7871b          	addiw	a4,a5,11
    8000ad64:	02c77663          	bgeu	a4,a2,8000ad90 <__memset+0x1c8>
    8000ad68:	00e50733          	add	a4,a0,a4
    8000ad6c:	00b70023          	sb	a1,0(a4)
    8000ad70:	00c7871b          	addiw	a4,a5,12
    8000ad74:	00c77e63          	bgeu	a4,a2,8000ad90 <__memset+0x1c8>
    8000ad78:	00e50733          	add	a4,a0,a4
    8000ad7c:	00b70023          	sb	a1,0(a4)
    8000ad80:	00d7879b          	addiw	a5,a5,13
    8000ad84:	00c7f663          	bgeu	a5,a2,8000ad90 <__memset+0x1c8>
    8000ad88:	00f507b3          	add	a5,a0,a5
    8000ad8c:	00b78023          	sb	a1,0(a5)
    8000ad90:	00813403          	ld	s0,8(sp)
    8000ad94:	01010113          	addi	sp,sp,16
    8000ad98:	00008067          	ret
    8000ad9c:	00b00693          	li	a3,11
    8000ada0:	e55ff06f          	j	8000abf4 <__memset+0x2c>
    8000ada4:	00300e93          	li	t4,3
    8000ada8:	ea5ff06f          	j	8000ac4c <__memset+0x84>
    8000adac:	00100e93          	li	t4,1
    8000adb0:	e9dff06f          	j	8000ac4c <__memset+0x84>
    8000adb4:	00000e93          	li	t4,0
    8000adb8:	e95ff06f          	j	8000ac4c <__memset+0x84>
    8000adbc:	00000793          	li	a5,0
    8000adc0:	ef9ff06f          	j	8000acb8 <__memset+0xf0>
    8000adc4:	00200e93          	li	t4,2
    8000adc8:	e85ff06f          	j	8000ac4c <__memset+0x84>
    8000adcc:	00400e93          	li	t4,4
    8000add0:	e7dff06f          	j	8000ac4c <__memset+0x84>
    8000add4:	00500e93          	li	t4,5
    8000add8:	e75ff06f          	j	8000ac4c <__memset+0x84>
    8000addc:	00600e93          	li	t4,6
    8000ade0:	e6dff06f          	j	8000ac4c <__memset+0x84>

000000008000ade4 <__memmove>:
    8000ade4:	ff010113          	addi	sp,sp,-16
    8000ade8:	00813423          	sd	s0,8(sp)
    8000adec:	01010413          	addi	s0,sp,16
    8000adf0:	0e060863          	beqz	a2,8000aee0 <__memmove+0xfc>
    8000adf4:	fff6069b          	addiw	a3,a2,-1
    8000adf8:	0006881b          	sext.w	a6,a3
    8000adfc:	0ea5e863          	bltu	a1,a0,8000aeec <__memmove+0x108>
    8000ae00:	00758713          	addi	a4,a1,7
    8000ae04:	00a5e7b3          	or	a5,a1,a0
    8000ae08:	40a70733          	sub	a4,a4,a0
    8000ae0c:	0077f793          	andi	a5,a5,7
    8000ae10:	00f73713          	sltiu	a4,a4,15
    8000ae14:	00174713          	xori	a4,a4,1
    8000ae18:	0017b793          	seqz	a5,a5
    8000ae1c:	00e7f7b3          	and	a5,a5,a4
    8000ae20:	10078863          	beqz	a5,8000af30 <__memmove+0x14c>
    8000ae24:	00900793          	li	a5,9
    8000ae28:	1107f463          	bgeu	a5,a6,8000af30 <__memmove+0x14c>
    8000ae2c:	0036581b          	srliw	a6,a2,0x3
    8000ae30:	fff8081b          	addiw	a6,a6,-1
    8000ae34:	02081813          	slli	a6,a6,0x20
    8000ae38:	01d85893          	srli	a7,a6,0x1d
    8000ae3c:	00858813          	addi	a6,a1,8
    8000ae40:	00058793          	mv	a5,a1
    8000ae44:	00050713          	mv	a4,a0
    8000ae48:	01088833          	add	a6,a7,a6
    8000ae4c:	0007b883          	ld	a7,0(a5)
    8000ae50:	00878793          	addi	a5,a5,8
    8000ae54:	00870713          	addi	a4,a4,8
    8000ae58:	ff173c23          	sd	a7,-8(a4)
    8000ae5c:	ff0798e3          	bne	a5,a6,8000ae4c <__memmove+0x68>
    8000ae60:	ff867713          	andi	a4,a2,-8
    8000ae64:	02071793          	slli	a5,a4,0x20
    8000ae68:	0207d793          	srli	a5,a5,0x20
    8000ae6c:	00f585b3          	add	a1,a1,a5
    8000ae70:	40e686bb          	subw	a3,a3,a4
    8000ae74:	00f507b3          	add	a5,a0,a5
    8000ae78:	06e60463          	beq	a2,a4,8000aee0 <__memmove+0xfc>
    8000ae7c:	0005c703          	lbu	a4,0(a1)
    8000ae80:	00e78023          	sb	a4,0(a5)
    8000ae84:	04068e63          	beqz	a3,8000aee0 <__memmove+0xfc>
    8000ae88:	0015c603          	lbu	a2,1(a1)
    8000ae8c:	00100713          	li	a4,1
    8000ae90:	00c780a3          	sb	a2,1(a5)
    8000ae94:	04e68663          	beq	a3,a4,8000aee0 <__memmove+0xfc>
    8000ae98:	0025c603          	lbu	a2,2(a1)
    8000ae9c:	00200713          	li	a4,2
    8000aea0:	00c78123          	sb	a2,2(a5)
    8000aea4:	02e68e63          	beq	a3,a4,8000aee0 <__memmove+0xfc>
    8000aea8:	0035c603          	lbu	a2,3(a1)
    8000aeac:	00300713          	li	a4,3
    8000aeb0:	00c781a3          	sb	a2,3(a5)
    8000aeb4:	02e68663          	beq	a3,a4,8000aee0 <__memmove+0xfc>
    8000aeb8:	0045c603          	lbu	a2,4(a1)
    8000aebc:	00400713          	li	a4,4
    8000aec0:	00c78223          	sb	a2,4(a5)
    8000aec4:	00e68e63          	beq	a3,a4,8000aee0 <__memmove+0xfc>
    8000aec8:	0055c603          	lbu	a2,5(a1)
    8000aecc:	00500713          	li	a4,5
    8000aed0:	00c782a3          	sb	a2,5(a5)
    8000aed4:	00e68663          	beq	a3,a4,8000aee0 <__memmove+0xfc>
    8000aed8:	0065c703          	lbu	a4,6(a1)
    8000aedc:	00e78323          	sb	a4,6(a5)
    8000aee0:	00813403          	ld	s0,8(sp)
    8000aee4:	01010113          	addi	sp,sp,16
    8000aee8:	00008067          	ret
    8000aeec:	02061713          	slli	a4,a2,0x20
    8000aef0:	02075713          	srli	a4,a4,0x20
    8000aef4:	00e587b3          	add	a5,a1,a4
    8000aef8:	f0f574e3          	bgeu	a0,a5,8000ae00 <__memmove+0x1c>
    8000aefc:	02069613          	slli	a2,a3,0x20
    8000af00:	02065613          	srli	a2,a2,0x20
    8000af04:	fff64613          	not	a2,a2
    8000af08:	00e50733          	add	a4,a0,a4
    8000af0c:	00c78633          	add	a2,a5,a2
    8000af10:	fff7c683          	lbu	a3,-1(a5)
    8000af14:	fff78793          	addi	a5,a5,-1
    8000af18:	fff70713          	addi	a4,a4,-1
    8000af1c:	00d70023          	sb	a3,0(a4)
    8000af20:	fec798e3          	bne	a5,a2,8000af10 <__memmove+0x12c>
    8000af24:	00813403          	ld	s0,8(sp)
    8000af28:	01010113          	addi	sp,sp,16
    8000af2c:	00008067          	ret
    8000af30:	02069713          	slli	a4,a3,0x20
    8000af34:	02075713          	srli	a4,a4,0x20
    8000af38:	00170713          	addi	a4,a4,1
    8000af3c:	00e50733          	add	a4,a0,a4
    8000af40:	00050793          	mv	a5,a0
    8000af44:	0005c683          	lbu	a3,0(a1)
    8000af48:	00178793          	addi	a5,a5,1
    8000af4c:	00158593          	addi	a1,a1,1
    8000af50:	fed78fa3          	sb	a3,-1(a5)
    8000af54:	fee798e3          	bne	a5,a4,8000af44 <__memmove+0x160>
    8000af58:	f89ff06f          	j	8000aee0 <__memmove+0xfc>
	...
