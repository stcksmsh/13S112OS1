
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000e117          	auipc	sp,0xe
    80000004:	0f813103          	ld	sp,248(sp) # 8000e0f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	089080ef          	jal	ra,800088a4 <start>

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
    8000107c:	648030ef          	jal	ra,800046c4 <exceptionHandler>


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
    80001160:	d5478793          	addi	a5,a5,-684 # 8000deb0 <_ZTV6Thread+0x10>
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
    80001198:	d4478793          	addi	a5,a5,-700 # 8000ded8 <_ZTV9Semaphore+0x10>
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
    8000129c:	c1878793          	addi	a5,a5,-1000 # 8000deb0 <_ZTV6Thread+0x10>
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
    800013b0:	b0478793          	addi	a5,a5,-1276 # 8000deb0 <_ZTV6Thread+0x10>
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
    800013e8:	af478793          	addi	a5,a5,-1292 # 8000ded8 <_ZTV9Semaphore+0x10>
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
    800014a8:	a5478793          	addi	a5,a5,-1452 # 8000def8 <_ZTV14PeriodicThread+0x10>
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
    80001568:	99478793          	addi	a5,a5,-1644 # 8000def8 <_ZTV14PeriodicThread+0x10>
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
    800015a4:	95878793          	addi	a5,a5,-1704 # 8000def8 <_ZTV14PeriodicThread+0x10>
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
    800015f0:	b747b783          	ld	a5,-1164(a5) # 8000e160 <_ZN5Timer8instanceE>
    800015f4:	02079463          	bnez	a5,8000161c <_ZN5TimerC1Ev+0x48>
    instance = this;
    800015f8:	0000d797          	auipc	a5,0xd
    800015fc:	b697b423          	sd	s1,-1176(a5) # 8000e160 <_ZN5Timer8instanceE>
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
    80001668:	a8c7b783          	ld	a5,-1396(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000166c:	0007b503          	ld	a0,0(a5)
    80001670:	00002097          	auipc	ra,0x2
    80001674:	790080e7          	jalr	1936(ra) # 80003e00 <_ZN11HeapManager8heapFreeEPv>
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
    8000169c:	ac87b783          	ld	a5,-1336(a5) # 8000e160 <_ZN5Timer8instanceE>
    800016a0:	00078863          	beqz	a5,800016b0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800016a4:	0000d517          	auipc	a0,0xd
    800016a8:	abc53503          	ld	a0,-1348(a0) # 8000e160 <_ZN5Timer8instanceE>
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
    800016e8:	a7c53503          	ld	a0,-1412(a0) # 8000e160 <_ZN5Timer8instanceE>
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
    80001744:	95c080e7          	jalr	-1700(ra) # 8000309c <_ZN7_thread11setSleepingEb>
        Scheduler::put(sleepingHead->thread);
    80001748:	0004b783          	ld	a5,0(s1)
    8000174c:	0007b503          	ld	a0,0(a5)
    80001750:	00003097          	auipc	ra,0x3
    80001754:	638080e7          	jalr	1592(ra) # 80004d88 <_ZN9Scheduler3putEP7_thread>
        threadSleepWrapper* next = sleepingHead->next;
    80001758:	0004b583          	ld	a1,0(s1)
    8000175c:	0105b903          	ld	s2,16(a1)
        HeapManager::getInstance().heapFree(sleepingHead);
    80001760:	0000d797          	auipc	a5,0xd
    80001764:	9907b783          	ld	a5,-1648(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001768:	0007b503          	ld	a0,0(a5)
    8000176c:	00002097          	auipc	ra,0x2
    80001770:	694080e7          	jalr	1684(ra) # 80003e00 <_ZN11HeapManager8heapFreeEPv>
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
    800017bc:	9587b783          	ld	a5,-1704(a5) # 8000e110 <_GLOBAL_OFFSET_TABLE_+0x48>
    800017c0:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)HeapManager::getInstance().heapAllocate(sizeof(threadSleepWrapper));
    800017c4:	01800593          	li	a1,24
    800017c8:	0000d797          	auipc	a5,0xd
    800017cc:	9287b783          	ld	a5,-1752(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017d0:	0007b503          	ld	a0,0(a5)
    800017d4:	00002097          	auipc	ra,0x2
    800017d8:	fac080e7          	jalr	-84(ra) # 80003780 <_ZN11HeapManager12heapAllocateEm>
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
    80001828:	878080e7          	jalr	-1928(ra) # 8000309c <_ZN7_thread11setSleepingEb>
    _thread::dispatch();
    8000182c:	00002097          	auipc	ra,0x2
    80001830:	938080e7          	jalr	-1736(ra) # 80003164 <_ZN7_thread8dispatchEv>
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
    80001b3c:	5b87b783          	ld	a5,1464(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001b40:	0007b503          	ld	a0,0(a5)
    80001b44:	00002097          	auipc	ra,0x2
    80001b48:	c3c080e7          	jalr	-964(ra) # 80003780 <_ZN11HeapManager12heapAllocateEm>
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
    80001ba8:	4cc080e7          	jalr	1228(ra) # 80003070 <_ZN7_thread9setClosedEb>
        HeapManager::getInstance().heapFree(id->blockHead);
    80001bac:	0004b583          	ld	a1,0(s1)
    80001bb0:	0000c797          	auipc	a5,0xc
    80001bb4:	5407b783          	ld	a5,1344(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001bb8:	0007b503          	ld	a0,0(a5)
    80001bbc:	00002097          	auipc	ra,0x2
    80001bc0:	244080e7          	jalr	580(ra) # 80003e00 <_ZN11HeapManager8heapFreeEPv>
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
    80001c20:	4d47b783          	ld	a5,1236(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c24:	0007b503          	ld	a0,0(a5)
    80001c28:	00002097          	auipc	ra,0x2
    80001c2c:	b58080e7          	jalr	-1192(ra) # 80003780 <_ZN11HeapManager12heapAllocateEm>
        pNewBlock->pThread = _thread::currentThread;
    80001c30:	0000c797          	auipc	a5,0xc
    80001c34:	4e07b783          	ld	a5,1248(a5) # 8000e110 <_GLOBAL_OFFSET_TABLE_+0x48>
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
    80001c60:	4b47b783          	ld	a5,1204(a5) # 8000e110 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001c64:	0007b503          	ld	a0,0(a5)
    80001c68:	00001097          	auipc	ra,0x1
    80001c6c:	3d8080e7          	jalr	984(ra) # 80003040 <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    80001c70:	00001097          	auipc	ra,0x1
    80001c74:	4f4080e7          	jalr	1268(ra) # 80003164 <_ZN7_thread8dispatchEv>
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
    80001ce0:	364080e7          	jalr	868(ra) # 80003040 <_ZN7_thread10setBlockedEb>
        HeapManager::getInstance().heapFree(pUnblock);
    80001ce4:	00048593          	mv	a1,s1
    80001ce8:	0000c797          	auipc	a5,0xc
    80001cec:	4087b783          	ld	a5,1032(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001cf0:	0007b503          	ld	a0,0(a5)
    80001cf4:	00002097          	auipc	ra,0x2
    80001cf8:	10c080e7          	jalr	268(ra) # 80003e00 <_ZN11HeapManager8heapFreeEPv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    80001cfc:	0004b503          	ld	a0,0(s1)
    80001d00:	00003097          	auipc	ra,0x3
    80001d04:	088080e7          	jalr	136(ra) # 80004d88 <_ZN9Scheduler3putEP7_thread>
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
    80001fdc:	00002097          	auipc	ra,0x2
    80001fe0:	5f4080e7          	jalr	1524(ra) # 800045d0 <_ZN14ConsoleManager13outputHandlerEv>
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
    80002048:	274080e7          	jalr	628(ra) # 8000f2b8 <_Unwind_Resume>

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
    80002068:	00002097          	auipc	ra,0x2
    8000206c:	2e0080e7          	jalr	736(ra) # 80004348 <_ZN14ConsoleManagerD1Ev>
    80002070:	01848513          	addi	a0,s1,24
    80002074:	fffff097          	auipc	ra,0xfffff
    80002078:	5d0080e7          	jalr	1488(ra) # 80001644 <_ZN5TimerD1Ev>
    8000207c:	00048513          	mv	a0,s1
    80002080:	00001097          	auipc	ra,0x1
    80002084:	46c080e7          	jalr	1132(ra) # 800034ec <_ZN11HeapManagerD1Ev>
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
    800023d8:	00005097          	auipc	ra,0x5
    800023dc:	7e8080e7          	jalr	2024(ra) # 80007bc0 <_Z8userMainv>
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
    80002404:	1d0080e7          	jalr	464(ra) # 800045d0 <_ZN14ConsoleManager13outputHandlerEv>
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
    8000243c:	04c080e7          	jalr	76(ra) # 80003484 <_ZN11HeapManagerC1Ev>
    80002440:	00848513          	addi	a0,s1,8
    80002444:	00003097          	auipc	ra,0x3
    80002448:	8ac080e7          	jalr	-1876(ra) # 80004cf0 <_ZN9SchedulerC1Ev>
    8000244c:	01848913          	addi	s2,s1,24
    80002450:	00090513          	mv	a0,s2
    80002454:	fffff097          	auipc	ra,0xfffff
    80002458:	180080e7          	jalr	384(ra) # 800015d4 <_ZN5TimerC1Ev>
    8000245c:	02848513          	addi	a0,s1,40
    80002460:	00002097          	auipc	ra,0x2
    80002464:	e2c080e7          	jalr	-468(ra) # 8000428c <_ZN14ConsoleManagerC1Ev>
    80002468:	0380006f          	j	800024a0 <_ZN6KernelC1Ev+0x88>
    8000246c:	00050993          	mv	s3,a0
    80002470:	00090513          	mv	a0,s2
    80002474:	fffff097          	auipc	ra,0xfffff
    80002478:	1d0080e7          	jalr	464(ra) # 80001644 <_ZN5TimerD1Ev>
    8000247c:	00098913          	mv	s2,s3
    80002480:	00048513          	mv	a0,s1
    80002484:	00001097          	auipc	ra,0x1
    80002488:	068080e7          	jalr	104(ra) # 800034ec <_ZN11HeapManagerD1Ev>
    8000248c:	00090513          	mv	a0,s2
    80002490:	0000d097          	auipc	ra,0xd
    80002494:	e28080e7          	jalr	-472(ra) # 8000f2b8 <_Unwind_Resume>
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
    800024d0:	c347b783          	ld	a5,-972(a5) # 8000e100 <_GLOBAL_OFFSET_TABLE_+0x38>
    800024d4:	10579073          	csrw	stvec,a5
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );
    800024d8:	0000c797          	auipc	a5,0xc
    800024dc:	c307b783          	ld	a5,-976(a5) # 8000e108 <_GLOBAL_OFFSET_TABLE_+0x40>
    800024e0:	0007b603          	ld	a2,0(a5)
    800024e4:	0000c797          	auipc	a5,0xc
    800024e8:	bfc7b783          	ld	a5,-1028(a5) # 8000e0e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800024ec:	0007b583          	ld	a1,0(a5)
    800024f0:	00001097          	auipc	ra,0x1
    800024f4:	014080e7          	jalr	20(ra) # 80003504 <_ZN11HeapManager4initEmm>
    console.getInstance().init();
    800024f8:	00002097          	auipc	ra,0x2
    800024fc:	d04080e7          	jalr	-764(ra) # 800041fc <_ZN14ConsoleManager11getInstanceEv>
    80002500:	00002097          	auipc	ra,0x2
    80002504:	eb8080e7          	jalr	-328(ra) # 800043b8 <_ZN14ConsoleManager4initEv>
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
    
    _thread::create(&kernelThread, 0, 0, mem_alloc(DEFAULT_STACK_SIZE), false);
    80002528:	00001537          	lui	a0,0x1
    8000252c:	fffff097          	auipc	ra,0xfffff
    80002530:	378080e7          	jalr	888(ra) # 800018a4 <_Z9mem_allocm>
    80002534:	00050693          	mv	a3,a0
    80002538:	00000713          	li	a4,0
    8000253c:	00000613          	li	a2,0
    80002540:	00000593          	li	a1,0
    80002544:	fe840513          	addi	a0,s0,-24
    80002548:	00001097          	auipc	ra,0x1
    8000254c:	918080e7          	jalr	-1768(ra) # 80002e60 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
    _thread::currentThread = kernelThread;
    80002550:	0000c797          	auipc	a5,0xc
    80002554:	bc07b783          	ld	a5,-1088(a5) # 8000e110 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002558:	fe843703          	ld	a4,-24(s0)
    8000255c:	00e7b023          	sd	a4,0(a5)


    thread_t consoleThread;
    thread_create(&consoleThread, consoleConsumer, 0);
    80002560:	00000613          	li	a2,0
    80002564:	00000597          	auipc	a1,0x0
    80002568:	e8c58593          	addi	a1,a1,-372 # 800023f0 <_Z15consoleConsumerPv>
    8000256c:	fe040513          	addi	a0,s0,-32
    80002570:	fffff097          	auipc	ra,0xfffff
    80002574:	390080e7          	jalr	912(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>

    /// enable external hardware interrupts
    __asm__ volatile ("csrs sie, %0" :: "r"(1<<9));
    80002578:	20000793          	li	a5,512
    8000257c:	1047a073          	csrs	sie,a5

    /// enable software interrupts
    __asm__ volatile ("csrs sstatus, %0" :: "r"(1<<1));
    80002580:	00200793          	li	a5,2
    80002584:	1007a073          	csrs	sstatus,a5

    thread_t userThread;
    thread_create(&userThread, test, 0);
    80002588:	00000613          	li	a2,0
    8000258c:	00000597          	auipc	a1,0x0
    80002590:	e3c58593          	addi	a1,a1,-452 # 800023c8 <_Z4testPv>
    80002594:	fd840513          	addi	a0,s0,-40
    80002598:	fffff097          	auipc	ra,0xfffff
    8000259c:	368080e7          	jalr	872(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    // thread_create(&userThread, usermain, 0);
    while(!userThread->finished){
    800025a0:	fd843783          	ld	a5,-40(s0)
    800025a4:	0a07b783          	ld	a5,160(a5)
    800025a8:	0087f793          	andi	a5,a5,8
    800025ac:	00079863          	bnez	a5,800025bc <_ZN6Kernel3runEv+0xa4>
        thread_dispatch();
    800025b0:	fffff097          	auipc	ra,0xfffff
    800025b4:	3ec080e7          	jalr	1004(ra) # 8000199c <_Z15thread_dispatchv>
    800025b8:	fe9ff06f          	j	800025a0 <_ZN6Kernel3runEv+0x88>
        // ConsoleManager::putc('K');
    }

    return EXIT_SUCCESS;
}
    800025bc:	00000513          	li	a0,0
    800025c0:	02813083          	ld	ra,40(sp)
    800025c4:	02013403          	ld	s0,32(sp)
    800025c8:	03010113          	addi	sp,sp,48
    800025cc:	00008067          	ret

00000000800025d0 <_Z13thread_test_1Pv>:

sem_t sem1, sem2;

char c;

void thread_test_1(void* args){
    800025d0:	ff010113          	addi	sp,sp,-16
    800025d4:	00113423          	sd	ra,8(sp)
    800025d8:	00813023          	sd	s0,0(sp)
    800025dc:	01010413          	addi	s0,sp,16
    putc('1');
    800025e0:	03100513          	li	a0,49
    800025e4:	fffff097          	auipc	ra,0xfffff
    800025e8:	50c080e7          	jalr	1292(ra) # 80001af0 <_Z4putcc>
    putc('s');
    800025ec:	07300513          	li	a0,115
    800025f0:	fffff097          	auipc	ra,0xfffff
    800025f4:	500080e7          	jalr	1280(ra) # 80001af0 <_Z4putcc>
    if(c != 's')time_sleep(60);
    800025f8:	0000c717          	auipc	a4,0xc
    800025fc:	b7074703          	lbu	a4,-1168(a4) # 8000e168 <c>
    80002600:	07300793          	li	a5,115
    80002604:	02f71e63          	bne	a4,a5,80002640 <_Z13thread_test_1Pv+0x70>
    putc('1');
    80002608:	03100513          	li	a0,49
    8000260c:	fffff097          	auipc	ra,0xfffff
    80002610:	4e4080e7          	jalr	1252(ra) # 80001af0 <_Z4putcc>
    if(c == 's')sem_signal(sem1);
    80002614:	0000c717          	auipc	a4,0xc
    80002618:	b5474703          	lbu	a4,-1196(a4) # 8000e168 <c>
    8000261c:	07300793          	li	a5,115
    80002620:	02f70863          	beq	a4,a5,80002650 <_Z13thread_test_1Pv+0x80>
    putc('S');
    80002624:	05300513          	li	a0,83
    80002628:	fffff097          	auipc	ra,0xfffff
    8000262c:	4c8080e7          	jalr	1224(ra) # 80001af0 <_Z4putcc>
}
    80002630:	00813083          	ld	ra,8(sp)
    80002634:	00013403          	ld	s0,0(sp)
    80002638:	01010113          	addi	sp,sp,16
    8000263c:	00008067          	ret
    if(c != 's')time_sleep(60);
    80002640:	03c00513          	li	a0,60
    80002644:	fffff097          	auipc	ra,0xfffff
    80002648:	39c080e7          	jalr	924(ra) # 800019e0 <_Z10time_sleepm>
    8000264c:	fbdff06f          	j	80002608 <_Z13thread_test_1Pv+0x38>
    if(c == 's')sem_signal(sem1);
    80002650:	0000c517          	auipc	a0,0xc
    80002654:	b2053503          	ld	a0,-1248(a0) # 8000e170 <sem1>
    80002658:	fffff097          	auipc	ra,0xfffff
    8000265c:	444080e7          	jalr	1092(ra) # 80001a9c <_Z10sem_signalP4_sem>
    80002660:	fc5ff06f          	j	80002624 <_Z13thread_test_1Pv+0x54>

0000000080002664 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80002664:	ff010113          	addi	sp,sp,-16
    80002668:	00113423          	sd	ra,8(sp)
    8000266c:	00813023          	sd	s0,0(sp)
    80002670:	01010413          	addi	s0,sp,16
    putc('2');
    80002674:	03200513          	li	a0,50
    80002678:	fffff097          	auipc	ra,0xfffff
    8000267c:	478080e7          	jalr	1144(ra) # 80001af0 <_Z4putcc>
    putc('s');
    80002680:	07300513          	li	a0,115
    80002684:	fffff097          	auipc	ra,0xfffff
    80002688:	46c080e7          	jalr	1132(ra) # 80001af0 <_Z4putcc>
    if(c != 's')time_sleep(30);
    8000268c:	0000c717          	auipc	a4,0xc
    80002690:	adc74703          	lbu	a4,-1316(a4) # 8000e168 <c>
    80002694:	07300793          	li	a5,115
    80002698:	02f71e63          	bne	a4,a5,800026d4 <_Z13thread_test_2Pv+0x70>
    putc('2');
    8000269c:	03200513          	li	a0,50
    800026a0:	fffff097          	auipc	ra,0xfffff
    800026a4:	450080e7          	jalr	1104(ra) # 80001af0 <_Z4putcc>
    putc('S');
    800026a8:	05300513          	li	a0,83
    800026ac:	fffff097          	auipc	ra,0xfffff
    800026b0:	444080e7          	jalr	1092(ra) # 80001af0 <_Z4putcc>
    if(c == 's')sem_signal(sem2);
    800026b4:	0000c717          	auipc	a4,0xc
    800026b8:	ab474703          	lbu	a4,-1356(a4) # 8000e168 <c>
    800026bc:	07300793          	li	a5,115
    800026c0:	02f70263          	beq	a4,a5,800026e4 <_Z13thread_test_2Pv+0x80>
}
    800026c4:	00813083          	ld	ra,8(sp)
    800026c8:	00013403          	ld	s0,0(sp)
    800026cc:	01010113          	addi	sp,sp,16
    800026d0:	00008067          	ret
    if(c != 's')time_sleep(30);
    800026d4:	01e00513          	li	a0,30
    800026d8:	fffff097          	auipc	ra,0xfffff
    800026dc:	308080e7          	jalr	776(ra) # 800019e0 <_Z10time_sleepm>
    800026e0:	fbdff06f          	j	8000269c <_Z13thread_test_2Pv+0x38>
    if(c == 's')sem_signal(sem2);
    800026e4:	0000c517          	auipc	a0,0xc
    800026e8:	a9453503          	ld	a0,-1388(a0) # 8000e178 <sem2>
    800026ec:	fffff097          	auipc	ra,0xfffff
    800026f0:	3b0080e7          	jalr	944(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    800026f4:	fd1ff06f          	j	800026c4 <_Z13thread_test_2Pv+0x60>

00000000800026f8 <_Z7memTestv>:

void memTest(){
    800026f8:	fd010113          	addi	sp,sp,-48
    800026fc:	02113423          	sd	ra,40(sp)
    80002700:	02813023          	sd	s0,32(sp)
    80002704:	00913c23          	sd	s1,24(sp)
    80002708:	01213823          	sd	s2,16(sp)
    8000270c:	01313423          	sd	s3,8(sp)
    80002710:	01413023          	sd	s4,0(sp)
    80002714:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002718:	0000c797          	auipc	a5,0xc
    8000271c:	9d87b783          	ld	a5,-1576(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002720:	0007b503          	ld	a0,0(a5)
    80002724:	00001097          	auipc	ra,0x1
    80002728:	f04080e7          	jalr	-252(ra) # 80003628 <_ZN11HeapManager17getHeapFreeMemoryEv>
    8000272c:	00050993          	mv	s3,a0
    putc('F');
    80002730:	04600513          	li	a0,70
    80002734:	fffff097          	auipc	ra,0xfffff
    80002738:	3bc080e7          	jalr	956(ra) # 80001af0 <_Z4putcc>
    putc('r');
    8000273c:	07200513          	li	a0,114
    80002740:	fffff097          	auipc	ra,0xfffff
    80002744:	3b0080e7          	jalr	944(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002748:	06500513          	li	a0,101
    8000274c:	fffff097          	auipc	ra,0xfffff
    80002750:	3a4080e7          	jalr	932(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002754:	06500513          	li	a0,101
    80002758:	fffff097          	auipc	ra,0xfffff
    8000275c:	398080e7          	jalr	920(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    80002760:	02000513          	li	a0,32
    80002764:	fffff097          	auipc	ra,0xfffff
    80002768:	38c080e7          	jalr	908(ra) # 80001af0 <_Z4putcc>
    putc('m');
    8000276c:	06d00513          	li	a0,109
    80002770:	fffff097          	auipc	ra,0xfffff
    80002774:	380080e7          	jalr	896(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002778:	06500513          	li	a0,101
    8000277c:	fffff097          	auipc	ra,0xfffff
    80002780:	374080e7          	jalr	884(ra) # 80001af0 <_Z4putcc>
    putc('m');
    80002784:	06d00513          	li	a0,109
    80002788:	fffff097          	auipc	ra,0xfffff
    8000278c:	368080e7          	jalr	872(ra) # 80001af0 <_Z4putcc>
    putc('o');
    80002790:	06f00513          	li	a0,111
    80002794:	fffff097          	auipc	ra,0xfffff
    80002798:	35c080e7          	jalr	860(ra) # 80001af0 <_Z4putcc>
    putc('r');
    8000279c:	07200513          	li	a0,114
    800027a0:	fffff097          	auipc	ra,0xfffff
    800027a4:	350080e7          	jalr	848(ra) # 80001af0 <_Z4putcc>
    putc('y');
    800027a8:	07900513          	li	a0,121
    800027ac:	fffff097          	auipc	ra,0xfffff
    800027b0:	344080e7          	jalr	836(ra) # 80001af0 <_Z4putcc>
    putc(':');
    800027b4:	03a00513          	li	a0,58
    800027b8:	fffff097          	auipc	ra,0xfffff
    800027bc:	338080e7          	jalr	824(ra) # 80001af0 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800027c0:	00f00493          	li	s1,15
    800027c4:	0140006f          	j	800027d8 <_Z7memTestv+0xe0>
        int digit = (freeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    800027c8:	05750513          	addi	a0,a0,87
    800027cc:	fffff097          	auipc	ra,0xfffff
    800027d0:	324080e7          	jalr	804(ra) # 80001af0 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800027d4:	fff4849b          	addiw	s1,s1,-1
    800027d8:	0204c463          	bltz	s1,80002800 <_Z7memTestv+0x108>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    800027dc:	0024951b          	slliw	a0,s1,0x2
    800027e0:	00a9d533          	srl	a0,s3,a0
    800027e4:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800027e8:	00900793          	li	a5,9
    800027ec:	fca7cee3          	blt	a5,a0,800027c8 <_Z7memTestv+0xd0>
            putc('0' + digit);
    800027f0:	03050513          	addi	a0,a0,48
    800027f4:	fffff097          	auipc	ra,0xfffff
    800027f8:	2fc080e7          	jalr	764(ra) # 80001af0 <_Z4putcc>
    800027fc:	fd9ff06f          	j	800027d4 <_Z7memTestv+0xdc>
        }
    }

    putc('\n');
    80002800:	00a00513          	li	a0,10
    80002804:	fffff097          	auipc	ra,0xfffff
    80002808:	2ec080e7          	jalr	748(ra) # 80001af0 <_Z4putcc>
    int n = 100;
    int k = 100;
    int** matrix = (int**)mem_alloc(sizeof(int*) * n);
    8000280c:	32000513          	li	a0,800
    80002810:	fffff097          	auipc	ra,0xfffff
    80002814:	094080e7          	jalr	148(ra) # 800018a4 <_Z9mem_allocm>
    80002818:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    8000281c:	00000493          	li	s1,0
    80002820:	0080006f          	j	80002828 <_Z7memTestv+0x130>
    80002824:	0014849b          	addiw	s1,s1,1
    80002828:	06300793          	li	a5,99
    8000282c:	0497c663          	blt	a5,s1,80002878 <_Z7memTestv+0x180>
        matrix[i] = (int*)mem_alloc(sizeof(int) * k);
    80002830:	00349a13          	slli	s4,s1,0x3
    80002834:	01490a33          	add	s4,s2,s4
    80002838:	19000513          	li	a0,400
    8000283c:	fffff097          	auipc	ra,0xfffff
    80002840:	068080e7          	jalr	104(ra) # 800018a4 <_Z9mem_allocm>
    80002844:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    80002848:	00000713          	li	a4,0
    8000284c:	06300793          	li	a5,99
    80002850:	fce7cae3          	blt	a5,a4,80002824 <_Z7memTestv+0x12c>
            matrix[i][j] = i * k + j;
    80002854:	06400793          	li	a5,100
    80002858:	029787bb          	mulw	a5,a5,s1
    8000285c:	000a3683          	ld	a3,0(s4)
    80002860:	00271613          	slli	a2,a4,0x2
    80002864:	00c686b3          	add	a3,a3,a2
    80002868:	00e787bb          	addw	a5,a5,a4
    8000286c:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80002870:	0017071b          	addiw	a4,a4,1
    80002874:	fd9ff06f          	j	8000284c <_Z7memTestv+0x154>
        }
    }
    for(int i = 0; i < n; i++){
    80002878:	00000a13          	li	s4,0
    8000287c:	0780006f          	j	800028f4 <_Z7memTestv+0x1fc>
        for(int j = 0; j < k; j++){
    80002880:	0014849b          	addiw	s1,s1,1
    80002884:	06300793          	li	a5,99
    80002888:	0497ca63          	blt	a5,s1,800028dc <_Z7memTestv+0x1e4>
            assert(matrix[i][j] == i * k + j);
    8000288c:	003a1793          	slli	a5,s4,0x3
    80002890:	00f907b3          	add	a5,s2,a5
    80002894:	0007b783          	ld	a5,0(a5)
    80002898:	00249713          	slli	a4,s1,0x2
    8000289c:	00e787b3          	add	a5,a5,a4
    800028a0:	0007a703          	lw	a4,0(a5)
    800028a4:	06400793          	li	a5,100
    800028a8:	034787bb          	mulw	a5,a5,s4
    800028ac:	009787bb          	addw	a5,a5,s1
    800028b0:	fcf708e3          	beq	a4,a5,80002880 <_Z7memTestv+0x188>
    800028b4:	00009697          	auipc	a3,0x9
    800028b8:	81c68693          	addi	a3,a3,-2020 # 8000b0d0 <CONSOLE_STATUS+0xc0>
    800028bc:	04200613          	li	a2,66
    800028c0:	00009597          	auipc	a1,0x9
    800028c4:	82058593          	addi	a1,a1,-2016 # 8000b0e0 <CONSOLE_STATUS+0xd0>
    800028c8:	00009517          	auipc	a0,0x9
    800028cc:	83050513          	addi	a0,a0,-2000 # 8000b0f8 <CONSOLE_STATUS+0xe8>
    800028d0:	fffff097          	auipc	ra,0xfffff
    800028d4:	7cc080e7          	jalr	1996(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    800028d8:	fa9ff06f          	j	80002880 <_Z7memTestv+0x188>
        }
        mem_free(matrix[i]);
    800028dc:	003a1793          	slli	a5,s4,0x3
    800028e0:	00f907b3          	add	a5,s2,a5
    800028e4:	0007b503          	ld	a0,0(a5)
    800028e8:	fffff097          	auipc	ra,0xfffff
    800028ec:	fec080e7          	jalr	-20(ra) # 800018d4 <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    800028f0:	001a0a1b          	addiw	s4,s4,1
    800028f4:	06300793          	li	a5,99
    800028f8:	0147c663          	blt	a5,s4,80002904 <_Z7memTestv+0x20c>
        for(int j = 0; j < k; j++){
    800028fc:	00000493          	li	s1,0
    80002900:	f85ff06f          	j	80002884 <_Z7memTestv+0x18c>
    }
    mem_free(matrix);
    80002904:	00090513          	mv	a0,s2
    80002908:	fffff097          	auipc	ra,0xfffff
    8000290c:	fcc080e7          	jalr	-52(ra) # 800018d4 <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002910:	0000b797          	auipc	a5,0xb
    80002914:	7e07b783          	ld	a5,2016(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002918:	0007b503          	ld	a0,0(a5)
    8000291c:	00001097          	auipc	ra,0x1
    80002920:	d0c080e7          	jalr	-756(ra) # 80003628 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002924:	00050493          	mv	s1,a0
    putc('F');
    80002928:	04600513          	li	a0,70
    8000292c:	fffff097          	auipc	ra,0xfffff
    80002930:	1c4080e7          	jalr	452(ra) # 80001af0 <_Z4putcc>
    putc('r');
    80002934:	07200513          	li	a0,114
    80002938:	fffff097          	auipc	ra,0xfffff
    8000293c:	1b8080e7          	jalr	440(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002940:	06500513          	li	a0,101
    80002944:	fffff097          	auipc	ra,0xfffff
    80002948:	1ac080e7          	jalr	428(ra) # 80001af0 <_Z4putcc>
    putc('e');
    8000294c:	06500513          	li	a0,101
    80002950:	fffff097          	auipc	ra,0xfffff
    80002954:	1a0080e7          	jalr	416(ra) # 80001af0 <_Z4putcc>
    putc(' ');
    80002958:	02000513          	li	a0,32
    8000295c:	fffff097          	auipc	ra,0xfffff
    80002960:	194080e7          	jalr	404(ra) # 80001af0 <_Z4putcc>
    putc('m');
    80002964:	06d00513          	li	a0,109
    80002968:	fffff097          	auipc	ra,0xfffff
    8000296c:	188080e7          	jalr	392(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002970:	06500513          	li	a0,101
    80002974:	fffff097          	auipc	ra,0xfffff
    80002978:	17c080e7          	jalr	380(ra) # 80001af0 <_Z4putcc>
    putc('m');
    8000297c:	06d00513          	li	a0,109
    80002980:	fffff097          	auipc	ra,0xfffff
    80002984:	170080e7          	jalr	368(ra) # 80001af0 <_Z4putcc>
    putc('o');
    80002988:	06f00513          	li	a0,111
    8000298c:	fffff097          	auipc	ra,0xfffff
    80002990:	164080e7          	jalr	356(ra) # 80001af0 <_Z4putcc>
    putc('r');
    80002994:	07200513          	li	a0,114
    80002998:	fffff097          	auipc	ra,0xfffff
    8000299c:	158080e7          	jalr	344(ra) # 80001af0 <_Z4putcc>
    putc('y');
    800029a0:	07900513          	li	a0,121
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	14c080e7          	jalr	332(ra) # 80001af0 <_Z4putcc>
    putc(':');
    800029ac:	03a00513          	li	a0,58
    800029b0:	fffff097          	auipc	ra,0xfffff
    800029b4:	140080e7          	jalr	320(ra) # 80001af0 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800029b8:	00f00913          	li	s2,15
    800029bc:	0140006f          	j	800029d0 <_Z7memTestv+0x2d8>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    800029c0:	05750513          	addi	a0,a0,87
    800029c4:	fffff097          	auipc	ra,0xfffff
    800029c8:	12c080e7          	jalr	300(ra) # 80001af0 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800029cc:	fff9091b          	addiw	s2,s2,-1
    800029d0:	02094463          	bltz	s2,800029f8 <_Z7memTestv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    800029d4:	0029151b          	slliw	a0,s2,0x2
    800029d8:	00a4d533          	srl	a0,s1,a0
    800029dc:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800029e0:	00900793          	li	a5,9
    800029e4:	fca7cee3          	blt	a5,a0,800029c0 <_Z7memTestv+0x2c8>
            putc('0' + digit);
    800029e8:	03050513          	addi	a0,a0,48
    800029ec:	fffff097          	auipc	ra,0xfffff
    800029f0:	104080e7          	jalr	260(ra) # 80001af0 <_Z4putcc>
    800029f4:	fd9ff06f          	j	800029cc <_Z7memTestv+0x2d4>
        }
    }
    putc('\n');
    800029f8:	00a00513          	li	a0,10
    800029fc:	fffff097          	auipc	ra,0xfffff
    80002a00:	0f4080e7          	jalr	244(ra) # 80001af0 <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    80002a04:	409989b3          	sub	s3,s3,s1
    putc('D');
    80002a08:	04400513          	li	a0,68
    80002a0c:	fffff097          	auipc	ra,0xfffff
    80002a10:	0e4080e7          	jalr	228(ra) # 80001af0 <_Z4putcc>
    putc('i');
    80002a14:	06900513          	li	a0,105
    80002a18:	fffff097          	auipc	ra,0xfffff
    80002a1c:	0d8080e7          	jalr	216(ra) # 80001af0 <_Z4putcc>
    putc('f');
    80002a20:	06600513          	li	a0,102
    80002a24:	fffff097          	auipc	ra,0xfffff
    80002a28:	0cc080e7          	jalr	204(ra) # 80001af0 <_Z4putcc>
    putc('f');
    80002a2c:	06600513          	li	a0,102
    80002a30:	fffff097          	auipc	ra,0xfffff
    80002a34:	0c0080e7          	jalr	192(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002a38:	06500513          	li	a0,101
    80002a3c:	fffff097          	auipc	ra,0xfffff
    80002a40:	0b4080e7          	jalr	180(ra) # 80001af0 <_Z4putcc>
    putc('r');
    80002a44:	07200513          	li	a0,114
    80002a48:	fffff097          	auipc	ra,0xfffff
    80002a4c:	0a8080e7          	jalr	168(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002a50:	06500513          	li	a0,101
    80002a54:	fffff097          	auipc	ra,0xfffff
    80002a58:	09c080e7          	jalr	156(ra) # 80001af0 <_Z4putcc>
    putc('n');
    80002a5c:	06e00513          	li	a0,110
    80002a60:	fffff097          	auipc	ra,0xfffff
    80002a64:	090080e7          	jalr	144(ra) # 80001af0 <_Z4putcc>
    putc('c');
    80002a68:	06300513          	li	a0,99
    80002a6c:	fffff097          	auipc	ra,0xfffff
    80002a70:	084080e7          	jalr	132(ra) # 80001af0 <_Z4putcc>
    putc('e');
    80002a74:	06500513          	li	a0,101
    80002a78:	fffff097          	auipc	ra,0xfffff
    80002a7c:	078080e7          	jalr	120(ra) # 80001af0 <_Z4putcc>
    putc(':');
    80002a80:	03a00513          	li	a0,58
    80002a84:	fffff097          	auipc	ra,0xfffff
    80002a88:	06c080e7          	jalr	108(ra) # 80001af0 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002a8c:	00f00493          	li	s1,15
    80002a90:	0140006f          	j	80002aa4 <_Z7memTestv+0x3ac>
        int digit = (difference >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002a94:	05750513          	addi	a0,a0,87
    80002a98:	fffff097          	auipc	ra,0xfffff
    80002a9c:	058080e7          	jalr	88(ra) # 80001af0 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002aa0:	fff4849b          	addiw	s1,s1,-1
    80002aa4:	0204c463          	bltz	s1,80002acc <_Z7memTestv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    80002aa8:	0024951b          	slliw	a0,s1,0x2
    80002aac:	00a9d533          	srl	a0,s3,a0
    80002ab0:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002ab4:	00900793          	li	a5,9
    80002ab8:	fca7cee3          	blt	a5,a0,80002a94 <_Z7memTestv+0x39c>
            putc('0' + digit);
    80002abc:	03050513          	addi	a0,a0,48
    80002ac0:	fffff097          	auipc	ra,0xfffff
    80002ac4:	030080e7          	jalr	48(ra) # 80001af0 <_Z4putcc>
    80002ac8:	fd9ff06f          	j	80002aa0 <_Z7memTestv+0x3a8>
        }
    }
    putc('\n');
    80002acc:	00a00513          	li	a0,10
    80002ad0:	fffff097          	auipc	ra,0xfffff
    80002ad4:	020080e7          	jalr	32(ra) # 80001af0 <_Z4putcc>
    putc('\n');
    80002ad8:	00a00513          	li	a0,10
    80002adc:	fffff097          	auipc	ra,0xfffff
    80002ae0:	014080e7          	jalr	20(ra) # 80001af0 <_Z4putcc>
    putc('\n');
    80002ae4:	00a00513          	li	a0,10
    80002ae8:	fffff097          	auipc	ra,0xfffff
    80002aec:	008080e7          	jalr	8(ra) # 80001af0 <_Z4putcc>
}
    80002af0:	02813083          	ld	ra,40(sp)
    80002af4:	02013403          	ld	s0,32(sp)
    80002af8:	01813483          	ld	s1,24(sp)
    80002afc:	01013903          	ld	s2,16(sp)
    80002b00:	00813983          	ld	s3,8(sp)
    80002b04:	00013a03          	ld	s4,0(sp)
    80002b08:	03010113          	addi	sp,sp,48
    80002b0c:	00008067          	ret

0000000080002b10 <_Z8usermainPv>:

void usermain(void* arg){
    80002b10:	fd010113          	addi	sp,sp,-48
    80002b14:	02113423          	sd	ra,40(sp)
    80002b18:	02813023          	sd	s0,32(sp)
    80002b1c:	00913c23          	sd	s1,24(sp)
    80002b20:	03010413          	addi	s0,sp,48
    putc('0');
    80002b24:	03000513          	li	a0,48
    80002b28:	fffff097          	auipc	ra,0xfffff
    80002b2c:	fc8080e7          	jalr	-56(ra) # 80001af0 <_Z4putcc>
    // memTest();
    c = '-';
    80002b30:	0000b497          	auipc	s1,0xb
    80002b34:	63848493          	addi	s1,s1,1592 # 8000e168 <c>
    80002b38:	02d00793          	li	a5,45
    80002b3c:	00f48023          	sb	a5,0(s1)
    thread_t t1, t2;
    if(c == 's'){
        sem_open(&sem1, 0);
        sem_open(&sem2, 0);
    }
    thread_create(&t1, thread_test_1, 0);
    80002b40:	00000613          	li	a2,0
    80002b44:	00000597          	auipc	a1,0x0
    80002b48:	a8c58593          	addi	a1,a1,-1396 # 800025d0 <_Z13thread_test_1Pv>
    80002b4c:	fd840513          	addi	a0,s0,-40
    80002b50:	fffff097          	auipc	ra,0xfffff
    80002b54:	db0080e7          	jalr	-592(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002b58:	00000613          	li	a2,0
    80002b5c:	00000597          	auipc	a1,0x0
    80002b60:	b0858593          	addi	a1,a1,-1272 # 80002664 <_Z13thread_test_2Pv>
    80002b64:	fd040513          	addi	a0,s0,-48
    80002b68:	fffff097          	auipc	ra,0xfffff
    80002b6c:	d98080e7          	jalr	-616(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    if(c == 's')sem_wait(sem1);
    80002b70:	0004c703          	lbu	a4,0(s1)
    80002b74:	07300793          	li	a5,115
    80002b78:	08f70663          	beq	a4,a5,80002c04 <_Z8usermainPv+0xf4>
    putc('3');
    80002b7c:	03300513          	li	a0,51
    80002b80:	fffff097          	auipc	ra,0xfffff
    80002b84:	f70080e7          	jalr	-144(ra) # 80001af0 <_Z4putcc>
    if(c != 's')thread_join(t2);
    80002b88:	0000b717          	auipc	a4,0xb
    80002b8c:	5e074703          	lbu	a4,1504(a4) # 8000e168 <c>
    80002b90:	07300793          	li	a5,115
    80002b94:	08f71263          	bne	a4,a5,80002c18 <_Z8usermainPv+0x108>
    putc('4');
    80002b98:	03400513          	li	a0,52
    80002b9c:	fffff097          	auipc	ra,0xfffff
    80002ba0:	f54080e7          	jalr	-172(ra) # 80001af0 <_Z4putcc>
    if(c != 's')thread_join(t1);
    80002ba4:	0000b717          	auipc	a4,0xb
    80002ba8:	5c474703          	lbu	a4,1476(a4) # 8000e168 <c>
    80002bac:	07300793          	li	a5,115
    80002bb0:	06f71c63          	bne	a4,a5,80002c28 <_Z8usermainPv+0x118>
    if(c == 's')sem_wait(sem2);
    80002bb4:	0000b717          	auipc	a4,0xb
    80002bb8:	5b474703          	lbu	a4,1460(a4) # 8000e168 <c>
    80002bbc:	07300793          	li	a5,115
    80002bc0:	06f70c63          	beq	a4,a5,80002c38 <_Z8usermainPv+0x128>
    putc('5');
    80002bc4:	03500513          	li	a0,53
    80002bc8:	fffff097          	auipc	ra,0xfffff
    80002bcc:	f28080e7          	jalr	-216(ra) # 80001af0 <_Z4putcc>
    if(c == 's')sem_close(sem1);
    80002bd0:	0000b717          	auipc	a4,0xb
    80002bd4:	59874703          	lbu	a4,1432(a4) # 8000e168 <c>
    80002bd8:	07300793          	li	a5,115
    80002bdc:	06f70863          	beq	a4,a5,80002c4c <_Z8usermainPv+0x13c>
    if(c == 's')sem_close(sem2);
    80002be0:	0000b717          	auipc	a4,0xb
    80002be4:	58874703          	lbu	a4,1416(a4) # 8000e168 <c>
    80002be8:	07300793          	li	a5,115
    80002bec:	06f70a63          	beq	a4,a5,80002c60 <_Z8usermainPv+0x150>
    80002bf0:	02813083          	ld	ra,40(sp)
    80002bf4:	02013403          	ld	s0,32(sp)
    80002bf8:	01813483          	ld	s1,24(sp)
    80002bfc:	03010113          	addi	sp,sp,48
    80002c00:	00008067          	ret
    if(c == 's')sem_wait(sem1);
    80002c04:	0000b517          	auipc	a0,0xb
    80002c08:	56c53503          	ld	a0,1388(a0) # 8000e170 <sem1>
    80002c0c:	fffff097          	auipc	ra,0xfffff
    80002c10:	e64080e7          	jalr	-412(ra) # 80001a70 <_Z8sem_waitP4_sem>
    80002c14:	f69ff06f          	j	80002b7c <_Z8usermainPv+0x6c>
    if(c != 's')thread_join(t2);
    80002c18:	fd043503          	ld	a0,-48(s0)
    80002c1c:	fffff097          	auipc	ra,0xfffff
    80002c20:	da0080e7          	jalr	-608(ra) # 800019bc <_Z11thread_joinP7_thread>
    80002c24:	f75ff06f          	j	80002b98 <_Z8usermainPv+0x88>
    if(c != 's')thread_join(t1);
    80002c28:	fd843503          	ld	a0,-40(s0)
    80002c2c:	fffff097          	auipc	ra,0xfffff
    80002c30:	d90080e7          	jalr	-624(ra) # 800019bc <_Z11thread_joinP7_thread>
    80002c34:	f81ff06f          	j	80002bb4 <_Z8usermainPv+0xa4>
    if(c == 's')sem_wait(sem2);
    80002c38:	0000b517          	auipc	a0,0xb
    80002c3c:	54053503          	ld	a0,1344(a0) # 8000e178 <sem2>
    80002c40:	fffff097          	auipc	ra,0xfffff
    80002c44:	e30080e7          	jalr	-464(ra) # 80001a70 <_Z8sem_waitP4_sem>
    80002c48:	f7dff06f          	j	80002bc4 <_Z8usermainPv+0xb4>
    if(c == 's')sem_close(sem1);
    80002c4c:	0000b517          	auipc	a0,0xb
    80002c50:	52453503          	ld	a0,1316(a0) # 8000e170 <sem1>
    80002c54:	fffff097          	auipc	ra,0xfffff
    80002c58:	df0080e7          	jalr	-528(ra) # 80001a44 <_Z9sem_closeP4_sem>
    80002c5c:	f85ff06f          	j	80002be0 <_Z8usermainPv+0xd0>
    if(c == 's')sem_close(sem2);
    80002c60:	0000b517          	auipc	a0,0xb
    80002c64:	51853503          	ld	a0,1304(a0) # 8000e178 <sem2>
    80002c68:	fffff097          	auipc	ra,0xfffff
    80002c6c:	ddc080e7          	jalr	-548(ra) # 80001a44 <_Z9sem_closeP4_sem>
    80002c70:	f81ff06f          	j	80002bf0 <_Z8usermainPv+0xe0>

0000000080002c74 <_ZN7_threadC1EPFvPvES0_>:
#include "consoleManager.h"
#include "heapManager.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    80002c74:	ff010113          	addi	sp,sp,-16
    80002c78:	00813423          	sd	s0,8(sp)
    80002c7c:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80002c80:	00053823          	sd	zero,16(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80002c84:	0000b717          	auipc	a4,0xb
    80002c88:	4fc70713          	addi	a4,a4,1276 # 8000e180 <_ZN7_thread6nextIDE>
    80002c8c:	00072783          	lw	a5,0(a4)
    80002c90:	0017869b          	addiw	a3,a5,1
    80002c94:	00d72023          	sw	a3,0(a4)
    80002c98:	00f52023          	sw	a5,0(a0)
    closed = 0;
    80002c9c:	0a053783          	ld	a5,160(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002ca0:	0015b593          	seqz	a1,a1
    80002ca4:	00459593          	slli	a1,a1,0x4
    80002ca8:	fe07f793          	andi	a5,a5,-32
    80002cac:	00b7e7b3          	or	a5,a5,a1
    reserved = 0;
    80002cb0:	00008717          	auipc	a4,0x8
    80002cb4:	46873703          	ld	a4,1128(a4) # 8000b118 <CONSOLE_STATUS+0x108>
    80002cb8:	00e7f7b3          	and	a5,a5,a4
    80002cbc:	0af53023          	sd	a5,160(a0)
    joinHead = 0;
    80002cc0:	08053023          	sd	zero,128(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    80002cc4:	00200793          	li	a5,2
    80002cc8:	08f53823          	sd	a5,144(a0)
    stackStart = 0;
    80002ccc:	08053c23          	sd	zero,152(a0)
    
    context.s0 = 0;
    80002cd0:	00053c23          	sd	zero,24(a0)
    context.s1 = 0;
    80002cd4:	02053023          	sd	zero,32(a0)
    context.s2 = 0;
    80002cd8:	02053423          	sd	zero,40(a0)
    context.s3 = 0;
    80002cdc:	02053823          	sd	zero,48(a0)
    context.s4 = 0;
    80002ce0:	02053c23          	sd	zero,56(a0)
    context.s5 = 0;
    80002ce4:	04053023          	sd	zero,64(a0)
    context.s6 = 0;
    80002ce8:	04053423          	sd	zero,72(a0)
    context.s7 = 0;
    80002cec:	04053823          	sd	zero,80(a0)
    context.s8 = 0;
    80002cf0:	04053c23          	sd	zero,88(a0)
    context.s9 = 0;
    80002cf4:	06053023          	sd	zero,96(a0)
    context.s10 = 0;
    80002cf8:	06053423          	sd	zero,104(a0)
    context.s11 = 0;
    80002cfc:	06053823          	sd	zero,112(a0)

    context.sstatus = 0;
    80002d00:	06053c23          	sd	zero,120(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002d04:	00000797          	auipc	a5,0x0
    80002d08:	72478793          	addi	a5,a5,1828 # 80003428 <_ZN7_thread7wrapperEv>
    80002d0c:	00f53423          	sd	a5,8(a0)
}
    80002d10:	00813403          	ld	s0,8(sp)
    80002d14:	01010113          	addi	sp,sp,16
    80002d18:	00008067          	ret

0000000080002d1c <_Z10popSppSpiev>:

void popSppSpie(){
    80002d1c:	ff010113          	addi	sp,sp,-16
    80002d20:	00813423          	sd	s0,8(sp)
    80002d24:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002d28:	14109073          	csrw	sepc,ra
    __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002d2c:	10000793          	li	a5,256
    80002d30:	1007b073          	csrc	sstatus,a5
    __asm__ volatile ("sret");
    80002d34:	10200073          	sret
}
    80002d38:	00813403          	ld	s0,8(sp)
    80002d3c:	01010113          	addi	sp,sp,16
    80002d40:	00008067          	ret

0000000080002d44 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002d44:	fe010113          	addi	sp,sp,-32
    80002d48:	00113c23          	sd	ra,24(sp)
    80002d4c:	00813823          	sd	s0,16(sp)
    80002d50:	00913423          	sd	s1,8(sp)
    80002d54:	01213023          	sd	s2,0(sp)
    80002d58:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80002d5c:	08053483          	ld	s1,128(a0)
    while(current != 0){
    80002d60:	0e048463          	beqz	s1,80002e48 <_ZN7_thread6unJoinEv+0x104>
        thread_t thread = current->thread;
    80002d64:	0004c503          	lbu	a0,0(s1)
    80002d68:	0014c783          	lbu	a5,1(s1)
    80002d6c:	00879793          	slli	a5,a5,0x8
    80002d70:	00a7e7b3          	or	a5,a5,a0
    80002d74:	0024c503          	lbu	a0,2(s1)
    80002d78:	01051513          	slli	a0,a0,0x10
    80002d7c:	00f567b3          	or	a5,a0,a5
    80002d80:	0034c503          	lbu	a0,3(s1)
    80002d84:	01851513          	slli	a0,a0,0x18
    80002d88:	00f56533          	or	a0,a0,a5
    80002d8c:	0044c783          	lbu	a5,4(s1)
    80002d90:	02079793          	slli	a5,a5,0x20
    80002d94:	00a7e533          	or	a0,a5,a0
    80002d98:	0054c783          	lbu	a5,5(s1)
    80002d9c:	02879793          	slli	a5,a5,0x28
    80002da0:	00a7e7b3          	or	a5,a5,a0
    80002da4:	0064c503          	lbu	a0,6(s1)
    80002da8:	03051513          	slli	a0,a0,0x30
    80002dac:	00f567b3          	or	a5,a0,a5
    80002db0:	0074c503          	lbu	a0,7(s1)
    80002db4:	03851513          	slli	a0,a0,0x38
    80002db8:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80002dbc:	0a053783          	ld	a5,160(a0)
    80002dc0:	ffd7f793          	andi	a5,a5,-3
    80002dc4:	0af53023          	sd	a5,160(a0)
        Scheduler::put(thread);
    80002dc8:	00002097          	auipc	ra,0x2
    80002dcc:	fc0080e7          	jalr	-64(ra) # 80004d88 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80002dd0:	0084c903          	lbu	s2,8(s1)
    80002dd4:	0094c783          	lbu	a5,9(s1)
    80002dd8:	00879793          	slli	a5,a5,0x8
    80002ddc:	0127e7b3          	or	a5,a5,s2
    80002de0:	00a4c903          	lbu	s2,10(s1)
    80002de4:	01091913          	slli	s2,s2,0x10
    80002de8:	00f967b3          	or	a5,s2,a5
    80002dec:	00b4c903          	lbu	s2,11(s1)
    80002df0:	01891913          	slli	s2,s2,0x18
    80002df4:	00f96933          	or	s2,s2,a5
    80002df8:	00c4c783          	lbu	a5,12(s1)
    80002dfc:	02079793          	slli	a5,a5,0x20
    80002e00:	0127e933          	or	s2,a5,s2
    80002e04:	00d4c783          	lbu	a5,13(s1)
    80002e08:	02879793          	slli	a5,a5,0x28
    80002e0c:	0127e7b3          	or	a5,a5,s2
    80002e10:	00e4c903          	lbu	s2,14(s1)
    80002e14:	03091913          	slli	s2,s2,0x30
    80002e18:	00f967b3          	or	a5,s2,a5
    80002e1c:	00f4c903          	lbu	s2,15(s1)
    80002e20:	03891913          	slli	s2,s2,0x38
    80002e24:	00f96933          	or	s2,s2,a5
        HeapManager::getInstance().heapFree(current);
    80002e28:	00048593          	mv	a1,s1
    80002e2c:	0000b797          	auipc	a5,0xb
    80002e30:	2c47b783          	ld	a5,708(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002e34:	0007b503          	ld	a0,0(a5)
    80002e38:	00001097          	auipc	ra,0x1
    80002e3c:	fc8080e7          	jalr	-56(ra) # 80003e00 <_ZN11HeapManager8heapFreeEPv>
        current = next;
    80002e40:	00090493          	mv	s1,s2
    while(current != 0){
    80002e44:	f1dff06f          	j	80002d60 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80002e48:	01813083          	ld	ra,24(sp)
    80002e4c:	01013403          	ld	s0,16(sp)
    80002e50:	00813483          	ld	s1,8(sp)
    80002e54:	00013903          	ld	s2,0(sp)
    80002e58:	02010113          	addi	sp,sp,32
    80002e5c:	00008067          	ret

0000000080002e60 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80002e60:	fc010113          	addi	sp,sp,-64
    80002e64:	02113c23          	sd	ra,56(sp)
    80002e68:	02813823          	sd	s0,48(sp)
    80002e6c:	02913423          	sd	s1,40(sp)
    80002e70:	03213023          	sd	s2,32(sp)
    80002e74:	01313c23          	sd	s3,24(sp)
    80002e78:	01413823          	sd	s4,16(sp)
    80002e7c:	01513423          	sd	s5,8(sp)
    80002e80:	04010413          	addi	s0,sp,64
    80002e84:	00050493          	mv	s1,a0
    80002e88:	00058913          	mv	s2,a1
    80002e8c:	00060a93          	mv	s5,a2
    80002e90:	00068993          	mv	s3,a3
    80002e94:	00070a13          	mv	s4,a4

    *thread = (_thread*)HeapManager::getInstance().heapAllocate((sizeof(_thread) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80002e98:	00300593          	li	a1,3
    80002e9c:	0000b797          	auipc	a5,0xb
    80002ea0:	2547b783          	ld	a5,596(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002ea4:	0007b503          	ld	a0,0(a5)
    80002ea8:	00001097          	auipc	ra,0x1
    80002eac:	8d8080e7          	jalr	-1832(ra) # 80003780 <_ZN11HeapManager12heapAllocateEm>
    80002eb0:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80002eb4:	18050263          	beqz	a0,80003038 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1d8>
        return -1;
    }
    (*thread)->function = function;
    80002eb8:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    80002ebc:	0004b783          	ld	a5,0(s1)
    80002ec0:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80002ec4:	0000b717          	auipc	a4,0xb
    80002ec8:	2bc70713          	addi	a4,a4,700 # 8000e180 <_ZN7_thread6nextIDE>
    80002ecc:	00072783          	lw	a5,0(a4)
    80002ed0:	0017869b          	addiw	a3,a5,1
    80002ed4:	00d72023          	sw	a3,0(a4)
    80002ed8:	0004b703          	ld	a4,0(s1)
    80002edc:	00f72023          	sw	a5,0(a4)
    (*thread)->closed = false;
    80002ee0:	0004b703          	ld	a4,0(s1)
    80002ee4:	0a073783          	ld	a5,160(a4)
    80002ee8:	ffe7f793          	andi	a5,a5,-2
    80002eec:	0af73023          	sd	a5,160(a4)
    (*thread)->blocked = false;
    80002ef0:	0004b703          	ld	a4,0(s1)
    80002ef4:	0a073783          	ld	a5,160(a4)
    80002ef8:	ffd7f793          	andi	a5,a5,-3
    80002efc:	0af73023          	sd	a5,160(a4)
    (*thread)->sleeping = false;
    80002f00:	0004b703          	ld	a4,0(s1)
    80002f04:	0a073783          	ld	a5,160(a4)
    80002f08:	ffb7f793          	andi	a5,a5,-5
    80002f0c:	0af73023          	sd	a5,160(a4)
    (*thread)->finished = false;
    80002f10:	0004b703          	ld	a4,0(s1)
    80002f14:	0a073783          	ld	a5,160(a4)
    80002f18:	ff77f793          	andi	a5,a5,-9
    80002f1c:	0af73023          	sd	a5,160(a4)
    (*thread)->kernel = (function == 0);
    80002f20:	0004b703          	ld	a4,0(s1)
    80002f24:	00193913          	seqz	s2,s2
    80002f28:	00491913          	slli	s2,s2,0x4
    80002f2c:	0a073783          	ld	a5,160(a4)
    80002f30:	fef7f793          	andi	a5,a5,-17
    80002f34:	0127e933          	or	s2,a5,s2
    80002f38:	0b273023          	sd	s2,160(a4)
    (*thread)->reserved = 0;
    80002f3c:	0004b703          	ld	a4,0(s1)
    80002f40:	0a073783          	ld	a5,160(a4)
    80002f44:	00008697          	auipc	a3,0x8
    80002f48:	1d46b683          	ld	a3,468(a3) # 8000b118 <CONSOLE_STATUS+0x108>
    80002f4c:	00d7f7b3          	and	a5,a5,a3
    80002f50:	0af73023          	sd	a5,160(a4)
    (*thread)->joinHead = 0;
    80002f54:	0004b783          	ld	a5,0(s1)
    80002f58:	0807b023          	sd	zero,128(a5)
    (*thread)->joinTail = 0;
    80002f5c:	0004b783          	ld	a5,0(s1)
    80002f60:	0807b423          	sd	zero,136(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    80002f64:	0004b783          	ld	a5,0(s1)
    80002f68:	00200713          	li	a4,2
    80002f6c:	08e7b823          	sd	a4,144(a5)
    (*thread)->stackStart = 0;
    80002f70:	0004b783          	ld	a5,0(s1)
    80002f74:	0807bc23          	sd	zero,152(a5)

    (*thread)->context.s0 = 0;
    80002f78:	0004b783          	ld	a5,0(s1)
    80002f7c:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s1 = 0;
    80002f80:	0004b783          	ld	a5,0(s1)
    80002f84:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s2 = 0;
    80002f88:	0004b783          	ld	a5,0(s1)
    80002f8c:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s3 = 0;
    80002f90:	0004b783          	ld	a5,0(s1)
    80002f94:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s4 = 0;
    80002f98:	0004b783          	ld	a5,0(s1)
    80002f9c:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s5 = 0;
    80002fa0:	0004b783          	ld	a5,0(s1)
    80002fa4:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s6 = 0;
    80002fa8:	0004b783          	ld	a5,0(s1)
    80002fac:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s7 = 0;
    80002fb0:	0004b783          	ld	a5,0(s1)
    80002fb4:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s8 = 0;
    80002fb8:	0004b783          	ld	a5,0(s1)
    80002fbc:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s9 = 0;
    80002fc0:	0004b783          	ld	a5,0(s1)
    80002fc4:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s10 = 0;
    80002fc8:	0004b783          	ld	a5,0(s1)
    80002fcc:	0607b423          	sd	zero,104(a5)
    (*thread)->context.s11 = 0;
    80002fd0:	0004b783          	ld	a5,0(s1)
    80002fd4:	0607b823          	sd	zero,112(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80002fd8:	0004b783          	ld	a5,0(s1)
    80002fdc:	0137b823          	sd	s3,16(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80002fe0:	0004b783          	ld	a5,0(s1)
    80002fe4:	00000717          	auipc	a4,0x0
    80002fe8:	44470713          	addi	a4,a4,1092 # 80003428 <_ZN7_thread7wrapperEv>
    80002fec:	00e7b423          	sd	a4,8(a5)

    (*thread)->stackStart = stack;
    80002ff0:	0004b783          	ld	a5,0(s1)
    80002ff4:	0937bc23          	sd	s3,152(a5)
    // ConsoleManager::putc('C');
    // ConsoleManager::putc((*thread)->ID + '0');
    // ConsoleManager::putc('\n');
    if(start){
    80002ff8:	020a1663          	bnez	s4,80003024 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c4>
        Scheduler::put(*thread);
    }
    return 0;
    80002ffc:	00000513          	li	a0,0
}
    80003000:	03813083          	ld	ra,56(sp)
    80003004:	03013403          	ld	s0,48(sp)
    80003008:	02813483          	ld	s1,40(sp)
    8000300c:	02013903          	ld	s2,32(sp)
    80003010:	01813983          	ld	s3,24(sp)
    80003014:	01013a03          	ld	s4,16(sp)
    80003018:	00813a83          	ld	s5,8(sp)
    8000301c:	04010113          	addi	sp,sp,64
    80003020:	00008067          	ret
        Scheduler::put(*thread);
    80003024:	0004b503          	ld	a0,0(s1)
    80003028:	00002097          	auipc	ra,0x2
    8000302c:	d60080e7          	jalr	-672(ra) # 80004d88 <_ZN9Scheduler3putEP7_thread>
    return 0;
    80003030:	00000513          	li	a0,0
    80003034:	fcdff06f          	j	80003000 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1a0>
        return -1;
    80003038:	fff00513          	li	a0,-1
    8000303c:	fc5ff06f          	j	80003000 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1a0>

0000000080003040 <_ZN7_thread10setBlockedEb>:
    currentThread->finished = 1;
    dispatch();
    return 0;
}

void _thread::setBlocked(bool blocked){
    80003040:	ff010113          	addi	sp,sp,-16
    80003044:	00813423          	sd	s0,8(sp)
    80003048:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    8000304c:	0015f593          	andi	a1,a1,1
    80003050:	00159793          	slli	a5,a1,0x1
    80003054:	0a053583          	ld	a1,160(a0)
    80003058:	ffd5f593          	andi	a1,a1,-3
    8000305c:	00f5e5b3          	or	a1,a1,a5
    80003060:	0ab53023          	sd	a1,160(a0)
}
    80003064:	00813403          	ld	s0,8(sp)
    80003068:	01010113          	addi	sp,sp,16
    8000306c:	00008067          	ret

0000000080003070 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80003070:	ff010113          	addi	sp,sp,-16
    80003074:	00813423          	sd	s0,8(sp)
    80003078:	01010413          	addi	s0,sp,16
    this->closed = closed;
    8000307c:	0015f793          	andi	a5,a1,1
    80003080:	0a053583          	ld	a1,160(a0)
    80003084:	ffe5f593          	andi	a1,a1,-2
    80003088:	00f5e5b3          	or	a1,a1,a5
    8000308c:	0ab53023          	sd	a1,160(a0)
}
    80003090:	00813403          	ld	s0,8(sp)
    80003094:	01010113          	addi	sp,sp,16
    80003098:	00008067          	ret

000000008000309c <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    8000309c:	ff010113          	addi	sp,sp,-16
    800030a0:	00813423          	sd	s0,8(sp)
    800030a4:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    800030a8:	0015f593          	andi	a1,a1,1
    800030ac:	00259793          	slli	a5,a1,0x2
    800030b0:	0a053583          	ld	a1,160(a0)
    800030b4:	ffb5f593          	andi	a1,a1,-5
    800030b8:	00f5e5b3          	or	a1,a1,a5
    800030bc:	0ab53023          	sd	a1,160(a0)
}
    800030c0:	00813403          	ld	s0,8(sp)
    800030c4:	01010113          	addi	sp,sp,16
    800030c8:	00008067          	ret

00000000800030cc <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
        Scheduler::put(oldThread);
    }
    contextSwitch(&(oldThread->context), &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    800030cc:	ff010113          	addi	sp,sp,-16
    800030d0:	00813423          	sd	s0,8(sp)
    800030d4:	01010413          	addi	s0,sp,16


    // if(oldContext != 0){
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    800030d8:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    800030dc:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    800030e0:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    800030e4:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    800030e8:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    800030ec:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    800030f0:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    800030f4:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    800030f8:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    800030fc:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    80003100:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    80003104:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    80003108:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    8000310c:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80003110:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    80003114:	06853823          	sd	s0,112(a0)
    // }
    
    
    __asm__ volatile ("ld ra, 0*8(a1)");
    80003118:	0005b083          	ld	ra,0(a1)
    __asm__ volatile ("ld sp, 1*8(a1)");
    8000311c:	0085b103          	ld	sp,8(a1)

    __asm__ volatile ("ld s0, 14 * 8(a1)");
    80003120:	0705b403          	ld	s0,112(a1)
    __asm__ volatile("csrw sstatus, s0");
    80003124:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80003128:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    8000312c:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80003130:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80003134:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80003138:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    8000313c:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80003140:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80003144:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    80003148:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    8000314c:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    80003150:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    80003154:	0685bd83          	ld	s11,104(a1)

    return;
}
    80003158:	00813403          	ld	s0,8(sp)
    8000315c:	01010113          	addi	sp,sp,16
    80003160:	00008067          	ret

0000000080003164 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80003164:	fe010113          	addi	sp,sp,-32
    80003168:	00113c23          	sd	ra,24(sp)
    8000316c:	00813823          	sd	s0,16(sp)
    80003170:	00913423          	sd	s1,8(sp)
    80003174:	01213023          	sd	s2,0(sp)
    80003178:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    8000317c:	0000b917          	auipc	s2,0xb
    80003180:	00490913          	addi	s2,s2,4 # 8000e180 <_ZN7_thread6nextIDE>
    80003184:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    80003188:	00002097          	auipc	ra,0x2
    8000318c:	e04080e7          	jalr	-508(ra) # 80004f8c <_ZN9Scheduler3getEv>
    80003190:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    80003194:	00200793          	li	a5,2
    80003198:	08f4b823          	sd	a5,144(s1)
    if(currentThread == 0){
    8000319c:	04050263          	beqz	a0,800031e0 <_ZN7_thread8dispatchEv+0x7c>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    800031a0:	00048863          	beqz	s1,800031b0 <_ZN7_thread8dispatchEv+0x4c>
    800031a4:	0a04b783          	ld	a5,160(s1)
    800031a8:	00f7f793          	andi	a5,a5,15
    800031ac:	04078063          	beqz	a5,800031ec <_ZN7_thread8dispatchEv+0x88>
    contextSwitch(&(oldThread->context), &(currentThread->context));
    800031b0:	0000b597          	auipc	a1,0xb
    800031b4:	fd85b583          	ld	a1,-40(a1) # 8000e188 <_ZN7_thread13currentThreadE>
    800031b8:	00858593          	addi	a1,a1,8
    800031bc:	00848513          	addi	a0,s1,8
    800031c0:	00000097          	auipc	ra,0x0
    800031c4:	f0c080e7          	jalr	-244(ra) # 800030cc <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    800031c8:	01813083          	ld	ra,24(sp)
    800031cc:	01013403          	ld	s0,16(sp)
    800031d0:	00813483          	ld	s1,8(sp)
    800031d4:	00013903          	ld	s2,0(sp)
    800031d8:	02010113          	addi	sp,sp,32
    800031dc:	00008067          	ret
        currentThread = oldThread;
    800031e0:	0000b797          	auipc	a5,0xb
    800031e4:	fa97b423          	sd	s1,-88(a5) # 8000e188 <_ZN7_thread13currentThreadE>
        return;
    800031e8:	fe1ff06f          	j	800031c8 <_ZN7_thread8dispatchEv+0x64>
        Scheduler::put(oldThread);
    800031ec:	00048513          	mv	a0,s1
    800031f0:	00002097          	auipc	ra,0x2
    800031f4:	b98080e7          	jalr	-1128(ra) # 80004d88 <_ZN9Scheduler3putEP7_thread>
    800031f8:	fb9ff06f          	j	800031b0 <_ZN7_thread8dispatchEv+0x4c>

00000000800031fc <_ZN7_thread4joinEPS_>:
    if(thread->finished || thread->closed){
    800031fc:	0a05b783          	ld	a5,160(a1)
    80003200:	0097f793          	andi	a5,a5,9
    80003204:	00078463          	beqz	a5,8000320c <_ZN7_thread4joinEPS_+0x10>
    80003208:	00008067          	ret
void _thread::join(thread_t thread){
    8000320c:	fe010113          	addi	sp,sp,-32
    80003210:	00113c23          	sd	ra,24(sp)
    80003214:	00813823          	sd	s0,16(sp)
    80003218:	00913423          	sd	s1,8(sp)
    8000321c:	01213023          	sd	s2,0(sp)
    80003220:	02010413          	addi	s0,sp,32
    80003224:	00050493          	mv	s1,a0
    80003228:	00058913          	mv	s2,a1
    ThreadJoinList* newJoin = (ThreadJoinList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadJoinList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    8000322c:	00100593          	li	a1,1
    80003230:	0000b797          	auipc	a5,0xb
    80003234:	ec07b783          	ld	a5,-320(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003238:	0007b503          	ld	a0,0(a5)
    8000323c:	00000097          	auipc	ra,0x0
    80003240:	544080e7          	jalr	1348(ra) # 80003780 <_ZN11HeapManager12heapAllocateEm>
    this->blocked = true;
    80003244:	0a04b703          	ld	a4,160(s1)
    80003248:	00276713          	ori	a4,a4,2
    8000324c:	0ae4b023          	sd	a4,160(s1)
    newJoin->thread = this;
    80003250:	00950023          	sb	s1,0(a0)
    80003254:	0084d713          	srli	a4,s1,0x8
    80003258:	00e500a3          	sb	a4,1(a0)
    8000325c:	0104d713          	srli	a4,s1,0x10
    80003260:	00e50123          	sb	a4,2(a0)
    80003264:	0184d71b          	srliw	a4,s1,0x18
    80003268:	00e501a3          	sb	a4,3(a0)
    8000326c:	0204d713          	srli	a4,s1,0x20
    80003270:	00e50223          	sb	a4,4(a0)
    80003274:	0284d713          	srli	a4,s1,0x28
    80003278:	00e502a3          	sb	a4,5(a0)
    8000327c:	0304d713          	srli	a4,s1,0x30
    80003280:	00e50323          	sb	a4,6(a0)
    80003284:	0384d493          	srli	s1,s1,0x38
    80003288:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    8000328c:	00050423          	sb	zero,8(a0)
    80003290:	000504a3          	sb	zero,9(a0)
    80003294:	00050523          	sb	zero,10(a0)
    80003298:	000505a3          	sb	zero,11(a0)
    8000329c:	00050623          	sb	zero,12(a0)
    800032a0:	000506a3          	sb	zero,13(a0)
    800032a4:	00050723          	sb	zero,14(a0)
    800032a8:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    800032ac:	08093703          	ld	a4,128(s2)
    800032b0:	06070463          	beqz	a4,80003318 <_ZN7_thread4joinEPS_+0x11c>
        thread->joinTail->next = newJoin;
    800032b4:	08893703          	ld	a4,136(s2)
    800032b8:	00a70423          	sb	a0,8(a4)
    800032bc:	00855693          	srli	a3,a0,0x8
    800032c0:	00d704a3          	sb	a3,9(a4)
    800032c4:	01055693          	srli	a3,a0,0x10
    800032c8:	00d70523          	sb	a3,10(a4)
    800032cc:	0185569b          	srliw	a3,a0,0x18
    800032d0:	00d705a3          	sb	a3,11(a4)
    800032d4:	02055693          	srli	a3,a0,0x20
    800032d8:	00d70623          	sb	a3,12(a4)
    800032dc:	02855693          	srli	a3,a0,0x28
    800032e0:	00d706a3          	sb	a3,13(a4)
    800032e4:	03055693          	srli	a3,a0,0x30
    800032e8:	00d70723          	sb	a3,14(a4)
    800032ec:	03855693          	srli	a3,a0,0x38
    800032f0:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    800032f4:	08a93423          	sd	a0,136(s2)
    dispatch();
    800032f8:	00000097          	auipc	ra,0x0
    800032fc:	e6c080e7          	jalr	-404(ra) # 80003164 <_ZN7_thread8dispatchEv>
}
    80003300:	01813083          	ld	ra,24(sp)
    80003304:	01013403          	ld	s0,16(sp)
    80003308:	00813483          	ld	s1,8(sp)
    8000330c:	00013903          	ld	s2,0(sp)
    80003310:	02010113          	addi	sp,sp,32
    80003314:	00008067          	ret
        thread->joinHead = newJoin;
    80003318:	08a93023          	sd	a0,128(s2)
        thread->joinTail = newJoin;
    8000331c:	08a93423          	sd	a0,136(s2)
    80003320:	fd9ff06f          	j	800032f8 <_ZN7_thread4joinEPS_+0xfc>

0000000080003324 <_ZN7_thread4tickEv>:
    if(currentThread->blocked){
    80003324:	0000b797          	auipc	a5,0xb
    80003328:	e647b783          	ld	a5,-412(a5) # 8000e188 <_ZN7_thread13currentThreadE>
    8000332c:	0a07b783          	ld	a5,160(a5)
    80003330:	0027f713          	andi	a4,a5,2
    80003334:	06071063          	bnez	a4,80003394 <_ZN7_thread4tickEv+0x70>
    if(currentThread->closed){
    80003338:	0017f713          	andi	a4,a5,1
    8000333c:	06071063          	bnez	a4,8000339c <_ZN7_thread4tickEv+0x78>
    if(currentThread->sleeping){
    80003340:	0047f713          	andi	a4,a5,4
    80003344:	06071063          	bnez	a4,800033a4 <_ZN7_thread4tickEv+0x80>
    if(currentThread->finished){
    80003348:	0087f793          	andi	a5,a5,8
    8000334c:	06079063          	bnez	a5,800033ac <_ZN7_thread4tickEv+0x88>
    timeLeft --;
    80003350:	09053783          	ld	a5,144(a0)
    80003354:	fff78793          	addi	a5,a5,-1
    80003358:	08f53823          	sd	a5,144(a0)
    if(timeLeft == 0){
    8000335c:	00078663          	beqz	a5,80003368 <_ZN7_thread4tickEv+0x44>
    return 0;
    80003360:	00000513          	li	a0,0
}
    80003364:	00008067          	ret
int _thread::tick(){
    80003368:	ff010113          	addi	sp,sp,-16
    8000336c:	00113423          	sd	ra,8(sp)
    80003370:	00813023          	sd	s0,0(sp)
    80003374:	01010413          	addi	s0,sp,16
        dispatch();
    80003378:	00000097          	auipc	ra,0x0
    8000337c:	dec080e7          	jalr	-532(ra) # 80003164 <_ZN7_thread8dispatchEv>
    return 0;
    80003380:	00000513          	li	a0,0
}
    80003384:	00813083          	ld	ra,8(sp)
    80003388:	00013403          	ld	s0,0(sp)
    8000338c:	01010113          	addi	sp,sp,16
    80003390:	00008067          	ret
        return -1;
    80003394:	fff00513          	li	a0,-1
    80003398:	00008067          	ret
        return -2;
    8000339c:	ffe00513          	li	a0,-2
    800033a0:	00008067          	ret
        return -3;
    800033a4:	ffd00513          	li	a0,-3
    800033a8:	00008067          	ret
        return -4;
    800033ac:	ffc00513          	li	a0,-4
    800033b0:	00008067          	ret

00000000800033b4 <_ZN7_thread4exitEv>:
    if(currentThread->closed){
    800033b4:	0000b717          	auipc	a4,0xb
    800033b8:	dd473703          	ld	a4,-556(a4) # 8000e188 <_ZN7_thread13currentThreadE>
    800033bc:	0a073783          	ld	a5,160(a4)
    800033c0:	0017f693          	andi	a3,a5,1
    800033c4:	04069663          	bnez	a3,80003410 <_ZN7_thread4exitEv+0x5c>
    if(currentThread->blocked){
    800033c8:	0027f693          	andi	a3,a5,2
    800033cc:	04069663          	bnez	a3,80003418 <_ZN7_thread4exitEv+0x64>
    if(currentThread->sleeping){
    800033d0:	0047f793          	andi	a5,a5,4
    800033d4:	04079663          	bnez	a5,80003420 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    800033d8:	ff010113          	addi	sp,sp,-16
    800033dc:	00113423          	sd	ra,8(sp)
    800033e0:	00813023          	sd	s0,0(sp)
    800033e4:	01010413          	addi	s0,sp,16
    currentThread->finished = 1;
    800033e8:	0a073783          	ld	a5,160(a4)
    800033ec:	0087e793          	ori	a5,a5,8
    800033f0:	0af73023          	sd	a5,160(a4)
    dispatch();
    800033f4:	00000097          	auipc	ra,0x0
    800033f8:	d70080e7          	jalr	-656(ra) # 80003164 <_ZN7_thread8dispatchEv>
    return 0;
    800033fc:	00000513          	li	a0,0
}
    80003400:	00813083          	ld	ra,8(sp)
    80003404:	00013403          	ld	s0,0(sp)
    80003408:	01010113          	addi	sp,sp,16
    8000340c:	00008067          	ret
        return -1;
    80003410:	fff00513          	li	a0,-1
    80003414:	00008067          	ret
        return -2;
    80003418:	ffe00513          	li	a0,-2
    8000341c:	00008067          	ret
        return -3;
    80003420:	ffd00513          	li	a0,-3
}
    80003424:	00008067          	ret

0000000080003428 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80003428:	fe010113          	addi	sp,sp,-32
    8000342c:	00113c23          	sd	ra,24(sp)
    80003430:	00813823          	sd	s0,16(sp)
    80003434:	00913423          	sd	s1,8(sp)
    80003438:	02010413          	addi	s0,sp,32
    popSppSpie();
    8000343c:	00000097          	auipc	ra,0x0
    80003440:	8e0080e7          	jalr	-1824(ra) # 80002d1c <_Z10popSppSpiev>
    currentThread->function(currentThread->arg);
    80003444:	0000b497          	auipc	s1,0xb
    80003448:	d3c48493          	addi	s1,s1,-708 # 8000e180 <_ZN7_thread6nextIDE>
    8000344c:	0084b783          	ld	a5,8(s1)
    80003450:	0a87b703          	ld	a4,168(a5)
    80003454:	0b07b503          	ld	a0,176(a5)
    80003458:	000700e7          	jalr	a4
    currentThread->unJoin();
    8000345c:	0084b503          	ld	a0,8(s1)
    80003460:	00000097          	auipc	ra,0x0
    80003464:	8e4080e7          	jalr	-1820(ra) # 80002d44 <_ZN7_thread6unJoinEv>
    exit();
    80003468:	00000097          	auipc	ra,0x0
    8000346c:	f4c080e7          	jalr	-180(ra) # 800033b4 <_ZN7_thread4exitEv>
}
    80003470:	01813083          	ld	ra,24(sp)
    80003474:	01013403          	ld	s0,16(sp)
    80003478:	00813483          	ld	s1,8(sp)
    8000347c:	02010113          	addi	sp,sp,32
    80003480:	00008067          	ret

0000000080003484 <_ZN11HeapManagerC1Ev>:
#include "heapManager.h"
#include "consoleManager.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80003484:	fe010113          	addi	sp,sp,-32
    80003488:	00113c23          	sd	ra,24(sp)
    8000348c:	00813823          	sd	s0,16(sp)
    80003490:	00913423          	sd	s1,8(sp)
    80003494:	02010413          	addi	s0,sp,32
    80003498:	00050493          	mv	s1,a0
    assert(instance == 0);
    8000349c:	0000b797          	auipc	a5,0xb
    800034a0:	cf47b783          	ld	a5,-780(a5) # 8000e190 <_ZN11HeapManager8instanceE>
    800034a4:	02079063          	bnez	a5,800034c4 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    800034a8:	0000b797          	auipc	a5,0xb
    800034ac:	ce97b423          	sd	s1,-792(a5) # 8000e190 <_ZN11HeapManager8instanceE>
}
    800034b0:	01813083          	ld	ra,24(sp)
    800034b4:	01013403          	ld	s0,16(sp)
    800034b8:	00813483          	ld	s1,8(sp)
    800034bc:	02010113          	addi	sp,sp,32
    800034c0:	00008067          	ret
    assert(instance == 0);
    800034c4:	00008697          	auipc	a3,0x8
    800034c8:	c5c68693          	addi	a3,a3,-932 # 8000b120 <CONSOLE_STATUS+0x110>
    800034cc:	01200613          	li	a2,18
    800034d0:	00008597          	auipc	a1,0x8
    800034d4:	c7058593          	addi	a1,a1,-912 # 8000b140 <CONSOLE_STATUS+0x130>
    800034d8:	00008517          	auipc	a0,0x8
    800034dc:	b6850513          	addi	a0,a0,-1176 # 8000b040 <CONSOLE_STATUS+0x30>
    800034e0:	fffff097          	auipc	ra,0xfffff
    800034e4:	bbc080e7          	jalr	-1092(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    800034e8:	fc1ff06f          	j	800034a8 <_ZN11HeapManagerC1Ev+0x24>

00000000800034ec <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    800034ec:	ff010113          	addi	sp,sp,-16
    800034f0:	00813423          	sd	s0,8(sp)
    800034f4:	01010413          	addi	s0,sp,16
    
}
    800034f8:	00813403          	ld	s0,8(sp)
    800034fc:	01010113          	addi	sp,sp,16
    80003500:	00008067          	ret

0000000080003504 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uint64 nStart, size_t nEnd){
    80003504:	fd010113          	addi	sp,sp,-48
    80003508:	02113423          	sd	ra,40(sp)
    8000350c:	02813023          	sd	s0,32(sp)
    80003510:	00913c23          	sd	s1,24(sp)
    80003514:	01213823          	sd	s2,16(sp)
    80003518:	01313423          	sd	s3,8(sp)
    8000351c:	03010413          	addi	s0,sp,48
    80003520:	00050993          	mv	s3,a0
    80003524:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003528:	40b604b3          	sub	s1,a2,a1
    8000352c:	0414b793          	sltiu	a5,s1,65
    80003530:	0c079863          	bnez	a5,80003600 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80003534:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80003538:	fde00793          	li	a5,-34
    8000353c:	00f90c23          	sb	a5,24(s2)
    80003540:	fc000713          	li	a4,-64
    80003544:	00e90ca3          	sb	a4,25(s2)
    80003548:	fad00713          	li	a4,-83
    8000354c:	00e90d23          	sb	a4,26(s2)
    80003550:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    80003554:	0064d613          	srli	a2,s1,0x6
    80003558:	0009b783          	ld	a5,0(s3)
    8000355c:	fff60613          	addi	a2,a2,-1
    80003560:	00c78823          	sb	a2,16(a5)
    80003564:	00865713          	srli	a4,a2,0x8
    80003568:	00e788a3          	sb	a4,17(a5)
    8000356c:	01065713          	srli	a4,a2,0x10
    80003570:	00e78923          	sb	a4,18(a5)
    80003574:	0186571b          	srliw	a4,a2,0x18
    80003578:	00e789a3          	sb	a4,19(a5)
    8000357c:	02065713          	srli	a4,a2,0x20
    80003580:	00e78a23          	sb	a4,20(a5)
    80003584:	02865713          	srli	a4,a2,0x28
    80003588:	00e78aa3          	sb	a4,21(a5)
    8000358c:	03065713          	srli	a4,a2,0x30
    80003590:	00e78b23          	sb	a4,22(a5)
    80003594:	03865613          	srli	a2,a2,0x38
    80003598:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    8000359c:	0009b783          	ld	a5,0(s3)
    800035a0:	00078023          	sb	zero,0(a5)
    800035a4:	000780a3          	sb	zero,1(a5)
    800035a8:	00078123          	sb	zero,2(a5)
    800035ac:	000781a3          	sb	zero,3(a5)
    800035b0:	00078223          	sb	zero,4(a5)
    800035b4:	000782a3          	sb	zero,5(a5)
    800035b8:	00078323          	sb	zero,6(a5)
    800035bc:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    800035c0:	0009b783          	ld	a5,0(s3)
    800035c4:	00078423          	sb	zero,8(a5)
    800035c8:	000784a3          	sb	zero,9(a5)
    800035cc:	00078523          	sb	zero,10(a5)
    800035d0:	000785a3          	sb	zero,11(a5)
    800035d4:	00078623          	sb	zero,12(a5)
    800035d8:	000786a3          	sb	zero,13(a5)
    800035dc:	00078723          	sb	zero,14(a5)
    800035e0:	000787a3          	sb	zero,15(a5)
}
    800035e4:	02813083          	ld	ra,40(sp)
    800035e8:	02013403          	ld	s0,32(sp)
    800035ec:	01813483          	ld	s1,24(sp)
    800035f0:	01013903          	ld	s2,16(sp)
    800035f4:	00813983          	ld	s3,8(sp)
    800035f8:	03010113          	addi	sp,sp,48
    800035fc:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003600:	00008697          	auipc	a3,0x8
    80003604:	b5868693          	addi	a3,a3,-1192 # 8000b158 <CONSOLE_STATUS+0x148>
    80003608:	01b00613          	li	a2,27
    8000360c:	00008597          	auipc	a1,0x8
    80003610:	b3458593          	addi	a1,a1,-1228 # 8000b140 <CONSOLE_STATUS+0x130>
    80003614:	00008517          	auipc	a0,0x8
    80003618:	b6c50513          	addi	a0,a0,-1172 # 8000b180 <CONSOLE_STATUS+0x170>
    8000361c:	fffff097          	auipc	ra,0xfffff
    80003620:	a80080e7          	jalr	-1408(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80003624:	f11ff06f          	j	80003534 <_ZN11HeapManager4initEmm+0x30>

0000000080003628 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80003628:	fe010113          	addi	sp,sp,-32
    8000362c:	00113c23          	sd	ra,24(sp)
    80003630:	00813823          	sd	s0,16(sp)
    80003634:	00913423          	sd	s1,8(sp)
    80003638:	01213023          	sd	s2,0(sp)
    8000363c:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003640:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80003644:	00000913          	li	s2,0
    80003648:	0b80006f          	j	80003700 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    8000364c:	0104c783          	lbu	a5,16(s1)
    80003650:	0114c703          	lbu	a4,17(s1)
    80003654:	00871713          	slli	a4,a4,0x8
    80003658:	00f76733          	or	a4,a4,a5
    8000365c:	0124c783          	lbu	a5,18(s1)
    80003660:	01079793          	slli	a5,a5,0x10
    80003664:	00e7e733          	or	a4,a5,a4
    80003668:	0134c783          	lbu	a5,19(s1)
    8000366c:	01879793          	slli	a5,a5,0x18
    80003670:	00e7e7b3          	or	a5,a5,a4
    80003674:	0144c703          	lbu	a4,20(s1)
    80003678:	02071713          	slli	a4,a4,0x20
    8000367c:	00f767b3          	or	a5,a4,a5
    80003680:	0154c703          	lbu	a4,21(s1)
    80003684:	02871713          	slli	a4,a4,0x28
    80003688:	00f76733          	or	a4,a4,a5
    8000368c:	0164c783          	lbu	a5,22(s1)
    80003690:	03079793          	slli	a5,a5,0x30
    80003694:	00e7e733          	or	a4,a5,a4
    80003698:	0174c783          	lbu	a5,23(s1)
    8000369c:	03879793          	slli	a5,a5,0x38
    800036a0:	00e7e7b3          	or	a5,a5,a4
    800036a4:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    800036a8:	0004c703          	lbu	a4,0(s1)
    800036ac:	0014c783          	lbu	a5,1(s1)
    800036b0:	00879793          	slli	a5,a5,0x8
    800036b4:	00e7e733          	or	a4,a5,a4
    800036b8:	0024c783          	lbu	a5,2(s1)
    800036bc:	01079793          	slli	a5,a5,0x10
    800036c0:	00e7e7b3          	or	a5,a5,a4
    800036c4:	0034c703          	lbu	a4,3(s1)
    800036c8:	01871713          	slli	a4,a4,0x18
    800036cc:	00f767b3          	or	a5,a4,a5
    800036d0:	0044c703          	lbu	a4,4(s1)
    800036d4:	02071713          	slli	a4,a4,0x20
    800036d8:	00f76733          	or	a4,a4,a5
    800036dc:	0054c783          	lbu	a5,5(s1)
    800036e0:	02879793          	slli	a5,a5,0x28
    800036e4:	00e7e733          	or	a4,a5,a4
    800036e8:	0064c783          	lbu	a5,6(s1)
    800036ec:	03079793          	slli	a5,a5,0x30
    800036f0:	00e7e7b3          	or	a5,a5,a4
    800036f4:	0074c483          	lbu	s1,7(s1)
    800036f8:	03849493          	slli	s1,s1,0x38
    800036fc:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003700:	06048263          	beqz	s1,80003764 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003704:	0184c783          	lbu	a5,24(s1)
    80003708:	0194c703          	lbu	a4,25(s1)
    8000370c:	00871713          	slli	a4,a4,0x8
    80003710:	00f76733          	or	a4,a4,a5
    80003714:	01a4c783          	lbu	a5,26(s1)
    80003718:	01079793          	slli	a5,a5,0x10
    8000371c:	00e7e733          	or	a4,a5,a4
    80003720:	01b4c783          	lbu	a5,27(s1)
    80003724:	01879793          	slli	a5,a5,0x18
    80003728:	00e7e7b3          	or	a5,a5,a4
    8000372c:	0007879b          	sext.w	a5,a5
    80003730:	deadc737          	lui	a4,0xdeadc
    80003734:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eaccc8e>
    80003738:	f0e78ae3          	beq	a5,a4,8000364c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    8000373c:	00008697          	auipc	a3,0x8
    80003740:	a6468693          	addi	a3,a3,-1436 # 8000b1a0 <CONSOLE_STATUS+0x190>
    80003744:	02800613          	li	a2,40
    80003748:	00008597          	auipc	a1,0x8
    8000374c:	9f858593          	addi	a1,a1,-1544 # 8000b140 <CONSOLE_STATUS+0x130>
    80003750:	00008517          	auipc	a0,0x8
    80003754:	a7850513          	addi	a0,a0,-1416 # 8000b1c8 <CONSOLE_STATUS+0x1b8>
    80003758:	fffff097          	auipc	ra,0xfffff
    8000375c:	944080e7          	jalr	-1724(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80003760:	eedff06f          	j	8000364c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80003764:	00090513          	mv	a0,s2
    80003768:	01813083          	ld	ra,24(sp)
    8000376c:	01013403          	ld	s0,16(sp)
    80003770:	00813483          	ld	s1,8(sp)
    80003774:	00013903          	ld	s2,0(sp)
    80003778:	02010113          	addi	sp,sp,32
    8000377c:	00008067          	ret

0000000080003780 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80003780:	fd010113          	addi	sp,sp,-48
    80003784:	02113423          	sd	ra,40(sp)
    80003788:	02813023          	sd	s0,32(sp)
    8000378c:	00913c23          	sd	s1,24(sp)
    80003790:	01213823          	sd	s2,16(sp)
    80003794:	01313423          	sd	s3,8(sp)
    80003798:	03010413          	addi	s0,sp,48
    8000379c:	00050993          	mv	s3,a0
    800037a0:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    800037a4:	00053483          	ld	s1,0(a0)
    800037a8:	0b80006f          	j	80003860 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    800037ac:	0104c783          	lbu	a5,16(s1)
    800037b0:	0114c703          	lbu	a4,17(s1)
    800037b4:	00871713          	slli	a4,a4,0x8
    800037b8:	00f76733          	or	a4,a4,a5
    800037bc:	0124c783          	lbu	a5,18(s1)
    800037c0:	01079793          	slli	a5,a5,0x10
    800037c4:	00e7e733          	or	a4,a5,a4
    800037c8:	0134c783          	lbu	a5,19(s1)
    800037cc:	01879793          	slli	a5,a5,0x18
    800037d0:	00e7e7b3          	or	a5,a5,a4
    800037d4:	0144c703          	lbu	a4,20(s1)
    800037d8:	02071713          	slli	a4,a4,0x20
    800037dc:	00f767b3          	or	a5,a4,a5
    800037e0:	0154c703          	lbu	a4,21(s1)
    800037e4:	02871713          	slli	a4,a4,0x28
    800037e8:	00f76733          	or	a4,a4,a5
    800037ec:	0164c783          	lbu	a5,22(s1)
    800037f0:	03079793          	slli	a5,a5,0x30
    800037f4:	00e7e733          	or	a4,a5,a4
    800037f8:	0174c783          	lbu	a5,23(s1)
    800037fc:	03879793          	slli	a5,a5,0x38
    80003800:	00e7e7b3          	or	a5,a5,a4
    80003804:	0d27f063          	bgeu	a5,s2,800038c4 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80003808:	0004c703          	lbu	a4,0(s1)
    8000380c:	0014c783          	lbu	a5,1(s1)
    80003810:	00879793          	slli	a5,a5,0x8
    80003814:	00e7e733          	or	a4,a5,a4
    80003818:	0024c783          	lbu	a5,2(s1)
    8000381c:	01079793          	slli	a5,a5,0x10
    80003820:	00e7e7b3          	or	a5,a5,a4
    80003824:	0034c703          	lbu	a4,3(s1)
    80003828:	01871713          	slli	a4,a4,0x18
    8000382c:	00f767b3          	or	a5,a4,a5
    80003830:	0044c703          	lbu	a4,4(s1)
    80003834:	02071713          	slli	a4,a4,0x20
    80003838:	00f76733          	or	a4,a4,a5
    8000383c:	0054c783          	lbu	a5,5(s1)
    80003840:	02879793          	slli	a5,a5,0x28
    80003844:	00e7e733          	or	a4,a5,a4
    80003848:	0064c783          	lbu	a5,6(s1)
    8000384c:	03079793          	slli	a5,a5,0x30
    80003850:	00e7e7b3          	or	a5,a5,a4
    80003854:	0074c483          	lbu	s1,7(s1)
    80003858:	03849493          	slli	s1,s1,0x38
    8000385c:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003860:	54048e63          	beqz	s1,80003dbc <_ZN11HeapManager12heapAllocateEm+0x63c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003864:	0184c783          	lbu	a5,24(s1)
    80003868:	0194c703          	lbu	a4,25(s1)
    8000386c:	00871713          	slli	a4,a4,0x8
    80003870:	00f76733          	or	a4,a4,a5
    80003874:	01a4c783          	lbu	a5,26(s1)
    80003878:	01079793          	slli	a5,a5,0x10
    8000387c:	00e7e733          	or	a4,a5,a4
    80003880:	01b4c783          	lbu	a5,27(s1)
    80003884:	01879793          	slli	a5,a5,0x18
    80003888:	00e7e7b3          	or	a5,a5,a4
    8000388c:	0007879b          	sext.w	a5,a5
    80003890:	deadc737          	lui	a4,0xdeadc
    80003894:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eaccc8e>
    80003898:	f0e78ae3          	beq	a5,a4,800037ac <_ZN11HeapManager12heapAllocateEm+0x2c>
    8000389c:	00008697          	auipc	a3,0x8
    800038a0:	95468693          	addi	a3,a3,-1708 # 8000b1f0 <CONSOLE_STATUS+0x1e0>
    800038a4:	03200613          	li	a2,50
    800038a8:	00008597          	auipc	a1,0x8
    800038ac:	89858593          	addi	a1,a1,-1896 # 8000b140 <CONSOLE_STATUS+0x130>
    800038b0:	00008517          	auipc	a0,0x8
    800038b4:	91850513          	addi	a0,a0,-1768 # 8000b1c8 <CONSOLE_STATUS+0x1b8>
    800038b8:	ffffe097          	auipc	ra,0xffffe
    800038bc:	7e4080e7          	jalr	2020(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    800038c0:	eedff06f          	j	800037ac <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    800038c4:	00190713          	addi	a4,s2,1
    800038c8:	2af77263          	bgeu	a4,a5,80003b6c <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    800038cc:	00671793          	slli	a5,a4,0x6
    800038d0:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    800038d4:	fde00713          	li	a4,-34
    800038d8:	00e78c23          	sb	a4,24(a5)
    800038dc:	fc000693          	li	a3,-64
    800038e0:	00d78ca3          	sb	a3,25(a5)
    800038e4:	fad00693          	li	a3,-83
    800038e8:	00d78d23          	sb	a3,26(a5)
    800038ec:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    800038f0:	0104c703          	lbu	a4,16(s1)
    800038f4:	0114c683          	lbu	a3,17(s1)
    800038f8:	00869693          	slli	a3,a3,0x8
    800038fc:	00e6e6b3          	or	a3,a3,a4
    80003900:	0124c703          	lbu	a4,18(s1)
    80003904:	01071713          	slli	a4,a4,0x10
    80003908:	00d766b3          	or	a3,a4,a3
    8000390c:	0134c703          	lbu	a4,19(s1)
    80003910:	01871713          	slli	a4,a4,0x18
    80003914:	00d76733          	or	a4,a4,a3
    80003918:	0144c683          	lbu	a3,20(s1)
    8000391c:	02069693          	slli	a3,a3,0x20
    80003920:	00e6e733          	or	a4,a3,a4
    80003924:	0154c683          	lbu	a3,21(s1)
    80003928:	02869693          	slli	a3,a3,0x28
    8000392c:	00e6e6b3          	or	a3,a3,a4
    80003930:	0164c703          	lbu	a4,22(s1)
    80003934:	03071713          	slli	a4,a4,0x30
    80003938:	00d766b3          	or	a3,a4,a3
    8000393c:	0174c703          	lbu	a4,23(s1)
    80003940:	03871713          	slli	a4,a4,0x38
    80003944:	00d76733          	or	a4,a4,a3
    80003948:	41270733          	sub	a4,a4,s2
    8000394c:	fff70713          	addi	a4,a4,-1
    80003950:	00e78823          	sb	a4,16(a5)
    80003954:	00875693          	srli	a3,a4,0x8
    80003958:	00d788a3          	sb	a3,17(a5)
    8000395c:	01075693          	srli	a3,a4,0x10
    80003960:	00d78923          	sb	a3,18(a5)
    80003964:	0187569b          	srliw	a3,a4,0x18
    80003968:	00d789a3          	sb	a3,19(a5)
    8000396c:	02075693          	srli	a3,a4,0x20
    80003970:	00d78a23          	sb	a3,20(a5)
    80003974:	02875693          	srli	a3,a4,0x28
    80003978:	00d78aa3          	sb	a3,21(a5)
    8000397c:	03075693          	srli	a3,a4,0x30
    80003980:	00d78b23          	sb	a3,22(a5)
    80003984:	03875713          	srli	a4,a4,0x38
    80003988:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    8000398c:	0004c703          	lbu	a4,0(s1)
    80003990:	0014c683          	lbu	a3,1(s1)
    80003994:	00869693          	slli	a3,a3,0x8
    80003998:	00e6e733          	or	a4,a3,a4
    8000399c:	0024c683          	lbu	a3,2(s1)
    800039a0:	01069693          	slli	a3,a3,0x10
    800039a4:	00e6e6b3          	or	a3,a3,a4
    800039a8:	0034c703          	lbu	a4,3(s1)
    800039ac:	01871713          	slli	a4,a4,0x18
    800039b0:	00d766b3          	or	a3,a4,a3
    800039b4:	0044c703          	lbu	a4,4(s1)
    800039b8:	02071713          	slli	a4,a4,0x20
    800039bc:	00d76733          	or	a4,a4,a3
    800039c0:	0054c683          	lbu	a3,5(s1)
    800039c4:	02869693          	slli	a3,a3,0x28
    800039c8:	00e6e733          	or	a4,a3,a4
    800039cc:	0064c683          	lbu	a3,6(s1)
    800039d0:	03069693          	slli	a3,a3,0x30
    800039d4:	00e6e6b3          	or	a3,a3,a4
    800039d8:	0074c703          	lbu	a4,7(s1)
    800039dc:	03871713          	slli	a4,a4,0x38
    800039e0:	00d76733          	or	a4,a4,a3
    800039e4:	00d78023          	sb	a3,0(a5)
    800039e8:	00875693          	srli	a3,a4,0x8
    800039ec:	00d780a3          	sb	a3,1(a5)
    800039f0:	01075693          	srli	a3,a4,0x10
    800039f4:	00d78123          	sb	a3,2(a5)
    800039f8:	0187569b          	srliw	a3,a4,0x18
    800039fc:	00d781a3          	sb	a3,3(a5)
    80003a00:	02075693          	srli	a3,a4,0x20
    80003a04:	00d78223          	sb	a3,4(a5)
    80003a08:	02875693          	srli	a3,a4,0x28
    80003a0c:	00d782a3          	sb	a3,5(a5)
    80003a10:	03075693          	srli	a3,a4,0x30
    80003a14:	00d78323          	sb	a3,6(a5)
    80003a18:	03875713          	srli	a4,a4,0x38
    80003a1c:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80003a20:	00978423          	sb	s1,8(a5)
    80003a24:	0084d713          	srli	a4,s1,0x8
    80003a28:	00e784a3          	sb	a4,9(a5)
    80003a2c:	0104d713          	srli	a4,s1,0x10
    80003a30:	00e78523          	sb	a4,10(a5)
    80003a34:	0184d71b          	srliw	a4,s1,0x18
    80003a38:	00e785a3          	sb	a4,11(a5)
    80003a3c:	0204d713          	srli	a4,s1,0x20
    80003a40:	00e78623          	sb	a4,12(a5)
    80003a44:	0284d713          	srli	a4,s1,0x28
    80003a48:	00e786a3          	sb	a4,13(a5)
    80003a4c:	0304d713          	srli	a4,s1,0x30
    80003a50:	00e78723          	sb	a4,14(a5)
    80003a54:	0384d713          	srli	a4,s1,0x38
    80003a58:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    80003a5c:	0004c703          	lbu	a4,0(s1)
    80003a60:	0014c683          	lbu	a3,1(s1)
    80003a64:	00869693          	slli	a3,a3,0x8
    80003a68:	00e6e6b3          	or	a3,a3,a4
    80003a6c:	0024c703          	lbu	a4,2(s1)
    80003a70:	01071713          	slli	a4,a4,0x10
    80003a74:	00d766b3          	or	a3,a4,a3
    80003a78:	0034c703          	lbu	a4,3(s1)
    80003a7c:	01871713          	slli	a4,a4,0x18
    80003a80:	00d76733          	or	a4,a4,a3
    80003a84:	0044c683          	lbu	a3,4(s1)
    80003a88:	02069693          	slli	a3,a3,0x20
    80003a8c:	00e6e733          	or	a4,a3,a4
    80003a90:	0054c683          	lbu	a3,5(s1)
    80003a94:	02869693          	slli	a3,a3,0x28
    80003a98:	00e6e6b3          	or	a3,a3,a4
    80003a9c:	0064c703          	lbu	a4,6(s1)
    80003aa0:	03071713          	slli	a4,a4,0x30
    80003aa4:	00d766b3          	or	a3,a4,a3
    80003aa8:	0074c703          	lbu	a4,7(s1)
    80003aac:	03871713          	slli	a4,a4,0x38
    80003ab0:	00d76733          	or	a4,a4,a3
    80003ab4:	04070063          	beqz	a4,80003af4 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003ab8:	00f70423          	sb	a5,8(a4)
    80003abc:	0087d693          	srli	a3,a5,0x8
    80003ac0:	00d704a3          	sb	a3,9(a4)
    80003ac4:	0107d693          	srli	a3,a5,0x10
    80003ac8:	00d70523          	sb	a3,10(a4)
    80003acc:	0187d69b          	srliw	a3,a5,0x18
    80003ad0:	00d705a3          	sb	a3,11(a4)
    80003ad4:	0207d693          	srli	a3,a5,0x20
    80003ad8:	00d70623          	sb	a3,12(a4)
    80003adc:	0287d693          	srli	a3,a5,0x28
    80003ae0:	00d706a3          	sb	a3,13(a4)
    80003ae4:	0307d693          	srli	a3,a5,0x30
    80003ae8:	00d70723          	sb	a3,14(a4)
    80003aec:	0387d693          	srli	a3,a5,0x38
    80003af0:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80003af4:	00f48023          	sb	a5,0(s1)
    80003af8:	0087d713          	srli	a4,a5,0x8
    80003afc:	00e480a3          	sb	a4,1(s1)
    80003b00:	0107d713          	srli	a4,a5,0x10
    80003b04:	00e48123          	sb	a4,2(s1)
    80003b08:	0187d71b          	srliw	a4,a5,0x18
    80003b0c:	00e481a3          	sb	a4,3(s1)
    80003b10:	0207d713          	srli	a4,a5,0x20
    80003b14:	00e48223          	sb	a4,4(s1)
    80003b18:	0287d713          	srli	a4,a5,0x28
    80003b1c:	00e482a3          	sb	a4,5(s1)
    80003b20:	0307d713          	srli	a4,a5,0x30
    80003b24:	00e48323          	sb	a4,6(s1)
    80003b28:	0387d793          	srli	a5,a5,0x38
    80003b2c:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80003b30:	01248823          	sb	s2,16(s1)
    80003b34:	00895793          	srli	a5,s2,0x8
    80003b38:	00f488a3          	sb	a5,17(s1)
    80003b3c:	01095793          	srli	a5,s2,0x10
    80003b40:	00f48923          	sb	a5,18(s1)
    80003b44:	0189579b          	srliw	a5,s2,0x18
    80003b48:	00f489a3          	sb	a5,19(s1)
    80003b4c:	02095793          	srli	a5,s2,0x20
    80003b50:	00f48a23          	sb	a5,20(s1)
    80003b54:	02895793          	srli	a5,s2,0x28
    80003b58:	00f48aa3          	sb	a5,21(s1)
    80003b5c:	03095793          	srli	a5,s2,0x30
    80003b60:	00f48b23          	sb	a5,22(s1)
    80003b64:	03895913          	srli	s2,s2,0x38
    80003b68:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80003b6c:	0009b783          	ld	a5,0(s3)
    80003b70:	1e978663          	beq	a5,s1,80003d5c <_ZN11HeapManager12heapAllocateEm+0x5dc>
            if(pCurrent->pPrev != 0){
    80003b74:	0084c783          	lbu	a5,8(s1)
    80003b78:	0094c703          	lbu	a4,9(s1)
    80003b7c:	00871713          	slli	a4,a4,0x8
    80003b80:	00f76733          	or	a4,a4,a5
    80003b84:	00a4c783          	lbu	a5,10(s1)
    80003b88:	01079793          	slli	a5,a5,0x10
    80003b8c:	00e7e733          	or	a4,a5,a4
    80003b90:	00b4c783          	lbu	a5,11(s1)
    80003b94:	01879793          	slli	a5,a5,0x18
    80003b98:	00e7e7b3          	or	a5,a5,a4
    80003b9c:	00c4c703          	lbu	a4,12(s1)
    80003ba0:	02071713          	slli	a4,a4,0x20
    80003ba4:	00f767b3          	or	a5,a4,a5
    80003ba8:	00d4c703          	lbu	a4,13(s1)
    80003bac:	02871713          	slli	a4,a4,0x28
    80003bb0:	00f76733          	or	a4,a4,a5
    80003bb4:	00e4c783          	lbu	a5,14(s1)
    80003bb8:	03079793          	slli	a5,a5,0x30
    80003bbc:	00e7e733          	or	a4,a5,a4
    80003bc0:	00f4c783          	lbu	a5,15(s1)
    80003bc4:	03879793          	slli	a5,a5,0x38
    80003bc8:	00e7e7b3          	or	a5,a5,a4
    80003bcc:	08078c63          	beqz	a5,80003c64 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80003bd0:	0004c703          	lbu	a4,0(s1)
    80003bd4:	0014c683          	lbu	a3,1(s1)
    80003bd8:	00869693          	slli	a3,a3,0x8
    80003bdc:	00e6e733          	or	a4,a3,a4
    80003be0:	0024c683          	lbu	a3,2(s1)
    80003be4:	01069693          	slli	a3,a3,0x10
    80003be8:	00e6e6b3          	or	a3,a3,a4
    80003bec:	0034c703          	lbu	a4,3(s1)
    80003bf0:	01871713          	slli	a4,a4,0x18
    80003bf4:	00d766b3          	or	a3,a4,a3
    80003bf8:	0044c703          	lbu	a4,4(s1)
    80003bfc:	02071713          	slli	a4,a4,0x20
    80003c00:	00d76733          	or	a4,a4,a3
    80003c04:	0054c683          	lbu	a3,5(s1)
    80003c08:	02869693          	slli	a3,a3,0x28
    80003c0c:	00e6e733          	or	a4,a3,a4
    80003c10:	0064c683          	lbu	a3,6(s1)
    80003c14:	03069693          	slli	a3,a3,0x30
    80003c18:	00e6e6b3          	or	a3,a3,a4
    80003c1c:	0074c703          	lbu	a4,7(s1)
    80003c20:	03871713          	slli	a4,a4,0x38
    80003c24:	00d76733          	or	a4,a4,a3
    80003c28:	00d78023          	sb	a3,0(a5)
    80003c2c:	00875693          	srli	a3,a4,0x8
    80003c30:	00d780a3          	sb	a3,1(a5)
    80003c34:	01075693          	srli	a3,a4,0x10
    80003c38:	00d78123          	sb	a3,2(a5)
    80003c3c:	0187569b          	srliw	a3,a4,0x18
    80003c40:	00d781a3          	sb	a3,3(a5)
    80003c44:	02075693          	srli	a3,a4,0x20
    80003c48:	00d78223          	sb	a3,4(a5)
    80003c4c:	02875693          	srli	a3,a4,0x28
    80003c50:	00d782a3          	sb	a3,5(a5)
    80003c54:	03075693          	srli	a3,a4,0x30
    80003c58:	00d78323          	sb	a3,6(a5)
    80003c5c:	03875713          	srli	a4,a4,0x38
    80003c60:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003c64:	0004c783          	lbu	a5,0(s1)
    80003c68:	0014c703          	lbu	a4,1(s1)
    80003c6c:	00871713          	slli	a4,a4,0x8
    80003c70:	00f76733          	or	a4,a4,a5
    80003c74:	0024c783          	lbu	a5,2(s1)
    80003c78:	01079793          	slli	a5,a5,0x10
    80003c7c:	00e7e733          	or	a4,a5,a4
    80003c80:	0034c783          	lbu	a5,3(s1)
    80003c84:	01879793          	slli	a5,a5,0x18
    80003c88:	00e7e7b3          	or	a5,a5,a4
    80003c8c:	0044c703          	lbu	a4,4(s1)
    80003c90:	02071713          	slli	a4,a4,0x20
    80003c94:	00f767b3          	or	a5,a4,a5
    80003c98:	0054c703          	lbu	a4,5(s1)
    80003c9c:	02871713          	slli	a4,a4,0x28
    80003ca0:	00f76733          	or	a4,a4,a5
    80003ca4:	0064c783          	lbu	a5,6(s1)
    80003ca8:	03079793          	slli	a5,a5,0x30
    80003cac:	00e7e733          	or	a4,a5,a4
    80003cb0:	0074c783          	lbu	a5,7(s1)
    80003cb4:	03879793          	slli	a5,a5,0x38
    80003cb8:	00e7e7b3          	or	a5,a5,a4
    80003cbc:	08078c63          	beqz	a5,80003d54 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003cc0:	0084c703          	lbu	a4,8(s1)
    80003cc4:	0094c683          	lbu	a3,9(s1)
    80003cc8:	00869693          	slli	a3,a3,0x8
    80003ccc:	00e6e733          	or	a4,a3,a4
    80003cd0:	00a4c683          	lbu	a3,10(s1)
    80003cd4:	01069693          	slli	a3,a3,0x10
    80003cd8:	00e6e6b3          	or	a3,a3,a4
    80003cdc:	00b4c703          	lbu	a4,11(s1)
    80003ce0:	01871713          	slli	a4,a4,0x18
    80003ce4:	00d766b3          	or	a3,a4,a3
    80003ce8:	00c4c703          	lbu	a4,12(s1)
    80003cec:	02071713          	slli	a4,a4,0x20
    80003cf0:	00d76733          	or	a4,a4,a3
    80003cf4:	00d4c683          	lbu	a3,13(s1)
    80003cf8:	02869693          	slli	a3,a3,0x28
    80003cfc:	00e6e733          	or	a4,a3,a4
    80003d00:	00e4c683          	lbu	a3,14(s1)
    80003d04:	03069693          	slli	a3,a3,0x30
    80003d08:	00e6e6b3          	or	a3,a3,a4
    80003d0c:	00f4c703          	lbu	a4,15(s1)
    80003d10:	03871713          	slli	a4,a4,0x38
    80003d14:	00d76733          	or	a4,a4,a3
    80003d18:	00d78423          	sb	a3,8(a5)
    80003d1c:	00875693          	srli	a3,a4,0x8
    80003d20:	00d784a3          	sb	a3,9(a5)
    80003d24:	01075693          	srli	a3,a4,0x10
    80003d28:	00d78523          	sb	a3,10(a5)
    80003d2c:	0187569b          	srliw	a3,a4,0x18
    80003d30:	00d785a3          	sb	a3,11(a5)
    80003d34:	02075693          	srli	a3,a4,0x20
    80003d38:	00d78623          	sb	a3,12(a5)
    80003d3c:	02875693          	srli	a3,a4,0x28
    80003d40:	00d786a3          	sb	a3,13(a5)
    80003d44:	03075693          	srli	a3,a4,0x30
    80003d48:	00d78723          	sb	a3,14(a5)
    80003d4c:	03875713          	srli	a4,a4,0x38
    80003d50:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    80003d54:	04048493          	addi	s1,s1,64
    80003d58:	0880006f          	j	80003de0 <_ZN11HeapManager12heapAllocateEm+0x660>
                m_pHead = pCurrent->pNext;
    80003d5c:	0004c703          	lbu	a4,0(s1)
    80003d60:	0014c783          	lbu	a5,1(s1)
    80003d64:	00879793          	slli	a5,a5,0x8
    80003d68:	00e7e7b3          	or	a5,a5,a4
    80003d6c:	0024c703          	lbu	a4,2(s1)
    80003d70:	01071713          	slli	a4,a4,0x10
    80003d74:	00f76733          	or	a4,a4,a5
    80003d78:	0034c783          	lbu	a5,3(s1)
    80003d7c:	01879793          	slli	a5,a5,0x18
    80003d80:	00e7e733          	or	a4,a5,a4
    80003d84:	0044c783          	lbu	a5,4(s1)
    80003d88:	02079793          	slli	a5,a5,0x20
    80003d8c:	00e7e7b3          	or	a5,a5,a4
    80003d90:	0054c703          	lbu	a4,5(s1)
    80003d94:	02871713          	slli	a4,a4,0x28
    80003d98:	00f76733          	or	a4,a4,a5
    80003d9c:	0064c783          	lbu	a5,6(s1)
    80003da0:	03079793          	slli	a5,a5,0x30
    80003da4:	00e7e733          	or	a4,a5,a4
    80003da8:	0074c783          	lbu	a5,7(s1)
    80003dac:	03879793          	slli	a5,a5,0x38
    80003db0:	00e7e7b3          	or	a5,a5,a4
    80003db4:	00f9b023          	sd	a5,0(s3)
    80003db8:	dbdff06f          	j	80003b74 <_ZN11HeapManager12heapAllocateEm+0x3f4>
    }
    assert(0);
    80003dbc:	00007697          	auipc	a3,0x7
    80003dc0:	43468693          	addi	a3,a3,1076 # 8000b1f0 <CONSOLE_STATUS+0x1e0>
    80003dc4:	04e00613          	li	a2,78
    80003dc8:	00007597          	auipc	a1,0x7
    80003dcc:	37858593          	addi	a1,a1,888 # 8000b140 <CONSOLE_STATUS+0x130>
    80003dd0:	00007517          	auipc	a0,0x7
    80003dd4:	44850513          	addi	a0,a0,1096 # 8000b218 <CONSOLE_STATUS+0x208>
    80003dd8:	ffffe097          	auipc	ra,0xffffe
    80003ddc:	2c4080e7          	jalr	708(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    return 0;
}
    80003de0:	00048513          	mv	a0,s1
    80003de4:	02813083          	ld	ra,40(sp)
    80003de8:	02013403          	ld	s0,32(sp)
    80003dec:	01813483          	ld	s1,24(sp)
    80003df0:	01013903          	ld	s2,16(sp)
    80003df4:	00813983          	ld	s3,8(sp)
    80003df8:	03010113          	addi	sp,sp,48
    80003dfc:	00008067          	ret

0000000080003e00 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003e00:	fd010113          	addi	sp,sp,-48
    80003e04:	02113423          	sd	ra,40(sp)
    80003e08:	02813023          	sd	s0,32(sp)
    80003e0c:	00913c23          	sd	s1,24(sp)
    80003e10:	01213823          	sd	s2,16(sp)
    80003e14:	01313423          	sd	s3,8(sp)
    80003e18:	01413023          	sd	s4,0(sp)
    80003e1c:	03010413          	addi	s0,sp,48
    80003e20:	00050a13          	mv	s4,a0
    80003e24:	00058993          	mv	s3,a1
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pAddress) - MEM_BLOCK_SIZE);
    80003e28:	fc058913          	addi	s2,a1,-64
    
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003e2c:	fd85c783          	lbu	a5,-40(a1)
    80003e30:	fd95c703          	lbu	a4,-39(a1)
    80003e34:	00871713          	slli	a4,a4,0x8
    80003e38:	00f76733          	or	a4,a4,a5
    80003e3c:	fda5c783          	lbu	a5,-38(a1)
    80003e40:	01079793          	slli	a5,a5,0x10
    80003e44:	00e7e733          	or	a4,a5,a4
    80003e48:	fdb5c783          	lbu	a5,-37(a1)
    80003e4c:	01879793          	slli	a5,a5,0x18
    80003e50:	00e7e7b3          	or	a5,a5,a4
    80003e54:	0007879b          	sext.w	a5,a5
    80003e58:	deadc737          	lui	a4,0xdeadc
    80003e5c:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eaccc8e>
    80003e60:	10e79663          	bne	a5,a4,80003f6c <_ZN11HeapManager8heapFreeEPv+0x16c>
    HeapFreeSectionHeader* pInsert = m_pHead;
    80003e64:	000a3483          	ld	s1,0(s4)

    if(pInsert == 0 || pInsert->pNext >= pAddress){
    80003e68:	06048063          	beqz	s1,80003ec8 <_ZN11HeapManager8heapFreeEPv+0xc8>
    80003e6c:	0004c783          	lbu	a5,0(s1)
    80003e70:	0014c703          	lbu	a4,1(s1)
    80003e74:	00871713          	slli	a4,a4,0x8
    80003e78:	00f76733          	or	a4,a4,a5
    80003e7c:	0024c783          	lbu	a5,2(s1)
    80003e80:	01079793          	slli	a5,a5,0x10
    80003e84:	00e7e733          	or	a4,a5,a4
    80003e88:	0034c783          	lbu	a5,3(s1)
    80003e8c:	01879793          	slli	a5,a5,0x18
    80003e90:	00e7e7b3          	or	a5,a5,a4
    80003e94:	0044c703          	lbu	a4,4(s1)
    80003e98:	02071713          	slli	a4,a4,0x20
    80003e9c:	00f767b3          	or	a5,a4,a5
    80003ea0:	0054c703          	lbu	a4,5(s1)
    80003ea4:	02871713          	slli	a4,a4,0x28
    80003ea8:	00f76733          	or	a4,a4,a5
    80003eac:	0064c783          	lbu	a5,6(s1)
    80003eb0:	03079793          	slli	a5,a5,0x30
    80003eb4:	00e7e733          	or	a4,a5,a4
    80003eb8:	0074c783          	lbu	a5,7(s1)
    80003ebc:	03879793          	slli	a5,a5,0x38
    80003ec0:	00e7e7b3          	or	a5,a5,a4
    80003ec4:	1337e463          	bltu	a5,s3,80003fec <_ZN11HeapManager8heapFreeEPv+0x1ec>
        pFree->pNext = m_pHead;
    80003ec8:	fc998023          	sb	s1,-64(s3)
    80003ecc:	0084d793          	srli	a5,s1,0x8
    80003ed0:	00f900a3          	sb	a5,1(s2)
    80003ed4:	0104d793          	srli	a5,s1,0x10
    80003ed8:	00f90123          	sb	a5,2(s2)
    80003edc:	0184d79b          	srliw	a5,s1,0x18
    80003ee0:	00f901a3          	sb	a5,3(s2)
    80003ee4:	0204d793          	srli	a5,s1,0x20
    80003ee8:	00f90223          	sb	a5,4(s2)
    80003eec:	0284d793          	srli	a5,s1,0x28
    80003ef0:	00f902a3          	sb	a5,5(s2)
    80003ef4:	0304d793          	srli	a5,s1,0x30
    80003ef8:	00f90323          	sb	a5,6(s2)
    80003efc:	0384d493          	srli	s1,s1,0x38
    80003f00:	009903a3          	sb	s1,7(s2)
        m_pHead->pPrev = pFree;
    80003f04:	000a3783          	ld	a5,0(s4)
    80003f08:	01278423          	sb	s2,8(a5)
    80003f0c:	00895713          	srli	a4,s2,0x8
    80003f10:	00e784a3          	sb	a4,9(a5)
    80003f14:	01095713          	srli	a4,s2,0x10
    80003f18:	00e78523          	sb	a4,10(a5)
    80003f1c:	0189571b          	srliw	a4,s2,0x18
    80003f20:	00e785a3          	sb	a4,11(a5)
    80003f24:	02095713          	srli	a4,s2,0x20
    80003f28:	00e78623          	sb	a4,12(a5)
    80003f2c:	02895713          	srli	a4,s2,0x28
    80003f30:	00e786a3          	sb	a4,13(a5)
    80003f34:	03095713          	srli	a4,s2,0x30
    80003f38:	00e78723          	sb	a4,14(a5)
    80003f3c:	03895713          	srli	a4,s2,0x38
    80003f40:	00e787a3          	sb	a4,15(a5)
        m_pHead = pFree;
    80003f44:	012a3023          	sd	s2,0(s4)
    //     if(pFree->pNext != 0){
    //         pFree->pNext->pPrev = pFree;
    //     }
    // }
    return 0;
}
    80003f48:	00000513          	li	a0,0
    80003f4c:	02813083          	ld	ra,40(sp)
    80003f50:	02013403          	ld	s0,32(sp)
    80003f54:	01813483          	ld	s1,24(sp)
    80003f58:	01013903          	ld	s2,16(sp)
    80003f5c:	00813983          	ld	s3,8(sp)
    80003f60:	00013a03          	ld	s4,0(sp)
    80003f64:	03010113          	addi	sp,sp,48
    80003f68:	00008067          	ret
    assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003f6c:	00007697          	auipc	a3,0x7
    80003f70:	2b468693          	addi	a3,a3,692 # 8000b220 <CONSOLE_STATUS+0x210>
    80003f74:	05500613          	li	a2,85
    80003f78:	00007597          	auipc	a1,0x7
    80003f7c:	1c858593          	addi	a1,a1,456 # 8000b140 <CONSOLE_STATUS+0x130>
    80003f80:	00007517          	auipc	a0,0x7
    80003f84:	2c850513          	addi	a0,a0,712 # 8000b248 <CONSOLE_STATUS+0x238>
    80003f88:	ffffe097          	auipc	ra,0xffffe
    80003f8c:	114080e7          	jalr	276(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80003f90:	ed5ff06f          	j	80003e64 <_ZN11HeapManager8heapFreeEPv+0x64>
            pInsert = pInsert->pNext;
    80003f94:	0004c703          	lbu	a4,0(s1)
    80003f98:	0014c783          	lbu	a5,1(s1)
    80003f9c:	00879793          	slli	a5,a5,0x8
    80003fa0:	00e7e733          	or	a4,a5,a4
    80003fa4:	0024c783          	lbu	a5,2(s1)
    80003fa8:	01079793          	slli	a5,a5,0x10
    80003fac:	00e7e7b3          	or	a5,a5,a4
    80003fb0:	0034c703          	lbu	a4,3(s1)
    80003fb4:	01871713          	slli	a4,a4,0x18
    80003fb8:	00f767b3          	or	a5,a4,a5
    80003fbc:	0044c703          	lbu	a4,4(s1)
    80003fc0:	02071713          	slli	a4,a4,0x20
    80003fc4:	00f76733          	or	a4,a4,a5
    80003fc8:	0054c783          	lbu	a5,5(s1)
    80003fcc:	02879793          	slli	a5,a5,0x28
    80003fd0:	00e7e733          	or	a4,a5,a4
    80003fd4:	0064c783          	lbu	a5,6(s1)
    80003fd8:	03079793          	slli	a5,a5,0x30
    80003fdc:	00e7e7b3          	or	a5,a5,a4
    80003fe0:	0074c483          	lbu	s1,7(s1)
    80003fe4:	03849493          	slli	s1,s1,0x38
    80003fe8:	00f4e4b3          	or	s1,s1,a5
        while(pInsert->pNext != 0 && pInsert->pNext < pAddress){
    80003fec:	0004c783          	lbu	a5,0(s1)
    80003ff0:	0014c703          	lbu	a4,1(s1)
    80003ff4:	00871713          	slli	a4,a4,0x8
    80003ff8:	00f76733          	or	a4,a4,a5
    80003ffc:	0024c783          	lbu	a5,2(s1)
    80004000:	01079793          	slli	a5,a5,0x10
    80004004:	00e7e733          	or	a4,a5,a4
    80004008:	0034c783          	lbu	a5,3(s1)
    8000400c:	01879793          	slli	a5,a5,0x18
    80004010:	00e7e7b3          	or	a5,a5,a4
    80004014:	0044c703          	lbu	a4,4(s1)
    80004018:	02071713          	slli	a4,a4,0x20
    8000401c:	00f767b3          	or	a5,a4,a5
    80004020:	0054c703          	lbu	a4,5(s1)
    80004024:	02871713          	slli	a4,a4,0x28
    80004028:	00f76733          	or	a4,a4,a5
    8000402c:	0064c783          	lbu	a5,6(s1)
    80004030:	03079793          	slli	a5,a5,0x30
    80004034:	00e7e733          	or	a4,a5,a4
    80004038:	0074c783          	lbu	a5,7(s1)
    8000403c:	03879793          	slli	a5,a5,0x38
    80004040:	00e7e7b3          	or	a5,a5,a4
    80004044:	06078463          	beqz	a5,800040ac <_ZN11HeapManager8heapFreeEPv+0x2ac>
    80004048:	0737f263          	bgeu	a5,s3,800040ac <_ZN11HeapManager8heapFreeEPv+0x2ac>
            assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    8000404c:	0184c783          	lbu	a5,24(s1)
    80004050:	0194c703          	lbu	a4,25(s1)
    80004054:	00871713          	slli	a4,a4,0x8
    80004058:	00f76733          	or	a4,a4,a5
    8000405c:	01a4c783          	lbu	a5,26(s1)
    80004060:	01079793          	slli	a5,a5,0x10
    80004064:	00e7e733          	or	a4,a5,a4
    80004068:	01b4c783          	lbu	a5,27(s1)
    8000406c:	01879793          	slli	a5,a5,0x18
    80004070:	00e7e7b3          	or	a5,a5,a4
    80004074:	0007879b          	sext.w	a5,a5
    80004078:	deadc737          	lui	a4,0xdeadc
    8000407c:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eaccc8e>
    80004080:	f0e78ae3          	beq	a5,a4,80003f94 <_ZN11HeapManager8heapFreeEPv+0x194>
    80004084:	00007697          	auipc	a3,0x7
    80004088:	19c68693          	addi	a3,a3,412 # 8000b220 <CONSOLE_STATUS+0x210>
    8000408c:	05e00613          	li	a2,94
    80004090:	00007597          	auipc	a1,0x7
    80004094:	0b058593          	addi	a1,a1,176 # 8000b140 <CONSOLE_STATUS+0x130>
    80004098:	00007517          	auipc	a0,0x7
    8000409c:	1d850513          	addi	a0,a0,472 # 8000b270 <CONSOLE_STATUS+0x260>
    800040a0:	ffffe097          	auipc	ra,0xffffe
    800040a4:	ffc080e7          	jalr	-4(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    800040a8:	eedff06f          	j	80003f94 <_ZN11HeapManager8heapFreeEPv+0x194>
        pFree->pNext = pInsert->pNext;
    800040ac:	fcf98023          	sb	a5,-64(s3)
    800040b0:	0087d713          	srli	a4,a5,0x8
    800040b4:	00e900a3          	sb	a4,1(s2)
    800040b8:	0107d713          	srli	a4,a5,0x10
    800040bc:	00e90123          	sb	a4,2(s2)
    800040c0:	0187d71b          	srliw	a4,a5,0x18
    800040c4:	00e901a3          	sb	a4,3(s2)
    800040c8:	0207d713          	srli	a4,a5,0x20
    800040cc:	00e90223          	sb	a4,4(s2)
    800040d0:	0287d713          	srli	a4,a5,0x28
    800040d4:	00e902a3          	sb	a4,5(s2)
    800040d8:	0307d713          	srli	a4,a5,0x30
    800040dc:	00e90323          	sb	a4,6(s2)
    800040e0:	0387d793          	srli	a5,a5,0x38
    800040e4:	00f903a3          	sb	a5,7(s2)
        pFree->pPrev = pInsert;
    800040e8:	00990423          	sb	s1,8(s2)
    800040ec:	0084d793          	srli	a5,s1,0x8
    800040f0:	00f904a3          	sb	a5,9(s2)
    800040f4:	0104d793          	srli	a5,s1,0x10
    800040f8:	00f90523          	sb	a5,10(s2)
    800040fc:	0184d79b          	srliw	a5,s1,0x18
    80004100:	00f905a3          	sb	a5,11(s2)
    80004104:	0204d793          	srli	a5,s1,0x20
    80004108:	00f90623          	sb	a5,12(s2)
    8000410c:	0284d793          	srli	a5,s1,0x28
    80004110:	00f906a3          	sb	a5,13(s2)
    80004114:	0304d793          	srli	a5,s1,0x30
    80004118:	00f90723          	sb	a5,14(s2)
    8000411c:	0384d793          	srli	a5,s1,0x38
    80004120:	00f907a3          	sb	a5,15(s2)
        if(pInsert->pNext != 0){
    80004124:	0004c783          	lbu	a5,0(s1)
    80004128:	0014c703          	lbu	a4,1(s1)
    8000412c:	00871713          	slli	a4,a4,0x8
    80004130:	00f76733          	or	a4,a4,a5
    80004134:	0024c783          	lbu	a5,2(s1)
    80004138:	01079793          	slli	a5,a5,0x10
    8000413c:	00e7e733          	or	a4,a5,a4
    80004140:	0034c783          	lbu	a5,3(s1)
    80004144:	01879793          	slli	a5,a5,0x18
    80004148:	00e7e7b3          	or	a5,a5,a4
    8000414c:	0044c703          	lbu	a4,4(s1)
    80004150:	02071713          	slli	a4,a4,0x20
    80004154:	00f767b3          	or	a5,a4,a5
    80004158:	0054c703          	lbu	a4,5(s1)
    8000415c:	02871713          	slli	a4,a4,0x28
    80004160:	00f76733          	or	a4,a4,a5
    80004164:	0064c783          	lbu	a5,6(s1)
    80004168:	03079793          	slli	a5,a5,0x30
    8000416c:	00e7e733          	or	a4,a5,a4
    80004170:	0074c783          	lbu	a5,7(s1)
    80004174:	03879793          	slli	a5,a5,0x38
    80004178:	00e7e7b3          	or	a5,a5,a4
    8000417c:	04078063          	beqz	a5,800041bc <_ZN11HeapManager8heapFreeEPv+0x3bc>
            pInsert->pNext->pPrev = pFree;
    80004180:	01278423          	sb	s2,8(a5)
    80004184:	00895713          	srli	a4,s2,0x8
    80004188:	00e784a3          	sb	a4,9(a5)
    8000418c:	01095713          	srli	a4,s2,0x10
    80004190:	00e78523          	sb	a4,10(a5)
    80004194:	0189571b          	srliw	a4,s2,0x18
    80004198:	00e785a3          	sb	a4,11(a5)
    8000419c:	02095713          	srli	a4,s2,0x20
    800041a0:	00e78623          	sb	a4,12(a5)
    800041a4:	02895713          	srli	a4,s2,0x28
    800041a8:	00e786a3          	sb	a4,13(a5)
    800041ac:	03095713          	srli	a4,s2,0x30
    800041b0:	00e78723          	sb	a4,14(a5)
    800041b4:	03895713          	srli	a4,s2,0x38
    800041b8:	00e787a3          	sb	a4,15(a5)
        pInsert->pNext = pFree;
    800041bc:	01248023          	sb	s2,0(s1)
    800041c0:	00895793          	srli	a5,s2,0x8
    800041c4:	00f480a3          	sb	a5,1(s1)
    800041c8:	01095793          	srli	a5,s2,0x10
    800041cc:	00f48123          	sb	a5,2(s1)
    800041d0:	0189579b          	srliw	a5,s2,0x18
    800041d4:	00f481a3          	sb	a5,3(s1)
    800041d8:	02095793          	srli	a5,s2,0x20
    800041dc:	00f48223          	sb	a5,4(s1)
    800041e0:	02895793          	srli	a5,s2,0x28
    800041e4:	00f482a3          	sb	a5,5(s1)
    800041e8:	03095793          	srli	a5,s2,0x30
    800041ec:	00f48323          	sb	a5,6(s1)
    800041f0:	03895913          	srli	s2,s2,0x38
    800041f4:	012483a3          	sb	s2,7(s1)
    800041f8:	d51ff06f          	j	80003f48 <_ZN11HeapManager8heapFreeEPv+0x148>

00000000800041fc <_ZN14ConsoleManager11getInstanceEv>:
    outBuffer.init();
    waitingThreads = 0;
}

ConsoleManager& ConsoleManager::getInstance(){
    assert(instance != 0);
    800041fc:	0000a797          	auipc	a5,0xa
    80004200:	f9c7b783          	ld	a5,-100(a5) # 8000e198 <_ZN14ConsoleManager8instanceE>
    80004204:	00078863          	beqz	a5,80004214 <_ZN14ConsoleManager11getInstanceEv+0x18>
    return *instance;
}
    80004208:	0000a517          	auipc	a0,0xa
    8000420c:	f9053503          	ld	a0,-112(a0) # 8000e198 <_ZN14ConsoleManager8instanceE>
    80004210:	00008067          	ret
ConsoleManager& ConsoleManager::getInstance(){
    80004214:	ff010113          	addi	sp,sp,-16
    80004218:	00113423          	sd	ra,8(sp)
    8000421c:	00813023          	sd	s0,0(sp)
    80004220:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80004224:	00007697          	auipc	a3,0x7
    80004228:	07468693          	addi	a3,a3,116 # 8000b298 <CONSOLE_STATUS+0x288>
    8000422c:	02200613          	li	a2,34
    80004230:	00007597          	auipc	a1,0x7
    80004234:	0a058593          	addi	a1,a1,160 # 8000b2d0 <CONSOLE_STATUS+0x2c0>
    80004238:	00007517          	auipc	a0,0x7
    8000423c:	e4050513          	addi	a0,a0,-448 # 8000b078 <CONSOLE_STATUS+0x68>
    80004240:	ffffe097          	auipc	ra,0xffffe
    80004244:	e5c080e7          	jalr	-420(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
}
    80004248:	0000a517          	auipc	a0,0xa
    8000424c:	f5053503          	ld	a0,-176(a0) # 8000e198 <_ZN14ConsoleManager8instanceE>
    80004250:	00813083          	ld	ra,8(sp)
    80004254:	00013403          	ld	s0,0(sp)
    80004258:	01010113          	addi	sp,sp,16
    8000425c:	00008067          	ret

0000000080004260 <_ZN14ConsoleManager13consoleBufferD1Ev>:

ConsoleManager::consoleBuffer::~consoleBuffer(){
    80004260:	ff010113          	addi	sp,sp,-16
    80004264:	00113423          	sd	ra,8(sp)
    80004268:	00813023          	sd	s0,0(sp)
    8000426c:	01010413          	addi	s0,sp,16
    sem_close(sem);
    80004270:	00053503          	ld	a0,0(a0)
    80004274:	ffffd097          	auipc	ra,0xffffd
    80004278:	7d0080e7          	jalr	2000(ra) # 80001a44 <_Z9sem_closeP4_sem>
}
    8000427c:	00813083          	ld	ra,8(sp)
    80004280:	00013403          	ld	s0,0(sp)
    80004284:	01010113          	addi	sp,sp,16
    80004288:	00008067          	ret

000000008000428c <_ZN14ConsoleManagerC1Ev>:
ConsoleManager::ConsoleManager(){
    8000428c:	fd010113          	addi	sp,sp,-48
    80004290:	02113423          	sd	ra,40(sp)
    80004294:	02813023          	sd	s0,32(sp)
    80004298:	00913c23          	sd	s1,24(sp)
    8000429c:	01213823          	sd	s2,16(sp)
    800042a0:	01313423          	sd	s3,8(sp)
    800042a4:	03010413          	addi	s0,sp,48
    800042a8:	00050493          	mv	s1,a0

    static ConsoleManager* instance;
    
    struct consoleBuffer{
    public:
        consoleBuffer(): head(0), tail(0), size(0){}
    800042ac:	20053423          	sd	zero,520(a0)
    800042b0:	20053823          	sd	zero,528(a0)
    800042b4:	20053c23          	sd	zero,536(a0)
    800042b8:	42053423          	sd	zero,1064(a0)
    800042bc:	42053823          	sd	zero,1072(a0)
    800042c0:	42053c23          	sd	zero,1080(a0)
    assert(instance == 0);
    800042c4:	0000a797          	auipc	a5,0xa
    800042c8:	ed47b783          	ld	a5,-300(a5) # 8000e198 <_ZN14ConsoleManager8instanceE>
    800042cc:	02079463          	bnez	a5,800042f4 <_ZN14ConsoleManagerC1Ev+0x68>
    instance = this;
    800042d0:	0000a797          	auipc	a5,0xa
    800042d4:	ec97b423          	sd	s1,-312(a5) # 8000e198 <_ZN14ConsoleManager8instanceE>
}
    800042d8:	02813083          	ld	ra,40(sp)
    800042dc:	02013403          	ld	s0,32(sp)
    800042e0:	01813483          	ld	s1,24(sp)
    800042e4:	01013903          	ld	s2,16(sp)
    800042e8:	00813983          	ld	s3,8(sp)
    800042ec:	03010113          	addi	sp,sp,48
    800042f0:	00008067          	ret
    800042f4:	22050913          	addi	s2,a0,544
    assert(instance == 0);
    800042f8:	00007697          	auipc	a3,0x7
    800042fc:	ff068693          	addi	a3,a3,-16 # 8000b2e8 <CONSOLE_STATUS+0x2d8>
    80004300:	01400613          	li	a2,20
    80004304:	00007597          	auipc	a1,0x7
    80004308:	fcc58593          	addi	a1,a1,-52 # 8000b2d0 <CONSOLE_STATUS+0x2c0>
    8000430c:	00007517          	auipc	a0,0x7
    80004310:	d3450513          	addi	a0,a0,-716 # 8000b040 <CONSOLE_STATUS+0x30>
    80004314:	ffffe097          	auipc	ra,0xffffe
    80004318:	d88080e7          	jalr	-632(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    8000431c:	fb5ff06f          	j	800042d0 <_ZN14ConsoleManagerC1Ev+0x44>
    80004320:	00050993          	mv	s3,a0
ConsoleManager::ConsoleManager(){
    80004324:	00090513          	mv	a0,s2
    80004328:	00000097          	auipc	ra,0x0
    8000432c:	f38080e7          	jalr	-200(ra) # 80004260 <_ZN14ConsoleManager13consoleBufferD1Ev>
    80004330:	00048513          	mv	a0,s1
    80004334:	00000097          	auipc	ra,0x0
    80004338:	f2c080e7          	jalr	-212(ra) # 80004260 <_ZN14ConsoleManager13consoleBufferD1Ev>
    8000433c:	00098513          	mv	a0,s3
    80004340:	0000b097          	auipc	ra,0xb
    80004344:	f78080e7          	jalr	-136(ra) # 8000f2b8 <_Unwind_Resume>

0000000080004348 <_ZN14ConsoleManagerD1Ev>:
ConsoleManager::~ConsoleManager(){
    80004348:	fe010113          	addi	sp,sp,-32
    8000434c:	00113c23          	sd	ra,24(sp)
    80004350:	00813823          	sd	s0,16(sp)
    80004354:	00913423          	sd	s1,8(sp)
    80004358:	02010413          	addi	s0,sp,32
    8000435c:	00050493          	mv	s1,a0
    80004360:	22050513          	addi	a0,a0,544
    80004364:	00000097          	auipc	ra,0x0
    80004368:	efc080e7          	jalr	-260(ra) # 80004260 <_ZN14ConsoleManager13consoleBufferD1Ev>
    8000436c:	00048513          	mv	a0,s1
    80004370:	00000097          	auipc	ra,0x0
    80004374:	ef0080e7          	jalr	-272(ra) # 80004260 <_ZN14ConsoleManager13consoleBufferD1Ev>
}
    80004378:	01813083          	ld	ra,24(sp)
    8000437c:	01013403          	ld	s0,16(sp)
    80004380:	00813483          	ld	s1,8(sp)
    80004384:	02010113          	addi	sp,sp,32
    80004388:	00008067          	ret

000000008000438c <_ZN14ConsoleManager13consoleBuffer4initEv>:

void ConsoleManager::consoleBuffer::init(){
    8000438c:	ff010113          	addi	sp,sp,-16
    80004390:	00113423          	sd	ra,8(sp)
    80004394:	00813023          	sd	s0,0(sp)
    80004398:	01010413          	addi	s0,sp,16
    _sem::open(&sem, 0);
    8000439c:	00000593          	li	a1,0
    800043a0:	ffffd097          	auipc	ra,0xffffd
    800043a4:	774080e7          	jalr	1908(ra) # 80001b14 <_ZN4_sem4openEPPS_j>
}
    800043a8:	00813083          	ld	ra,8(sp)
    800043ac:	00013403          	ld	s0,0(sp)
    800043b0:	01010113          	addi	sp,sp,16
    800043b4:	00008067          	ret

00000000800043b8 <_ZN14ConsoleManager4initEv>:
void ConsoleManager::init(){
    800043b8:	fe010113          	addi	sp,sp,-32
    800043bc:	00113c23          	sd	ra,24(sp)
    800043c0:	00813823          	sd	s0,16(sp)
    800043c4:	00913423          	sd	s1,8(sp)
    800043c8:	02010413          	addi	s0,sp,32
    800043cc:	00050493          	mv	s1,a0
    inBuffer.init();
    800043d0:	00000097          	auipc	ra,0x0
    800043d4:	fbc080e7          	jalr	-68(ra) # 8000438c <_ZN14ConsoleManager13consoleBuffer4initEv>
    outBuffer.init();
    800043d8:	22048513          	addi	a0,s1,544
    800043dc:	00000097          	auipc	ra,0x0
    800043e0:	fb0080e7          	jalr	-80(ra) # 8000438c <_ZN14ConsoleManager13consoleBuffer4initEv>
    waitingThreads = 0;
    800043e4:	4404a023          	sw	zero,1088(s1)
}
    800043e8:	01813083          	ld	ra,24(sp)
    800043ec:	01013403          	ld	s0,16(sp)
    800043f0:	00813483          	ld	s1,8(sp)
    800043f4:	02010113          	addi	sp,sp,32
    800043f8:	00008067          	ret

00000000800043fc <_ZN14ConsoleManager13consoleBuffer3putEc>:

void ConsoleManager::consoleBuffer::put(char c){
    800043fc:	ff010113          	addi	sp,sp,-16
    80004400:	00113423          	sd	ra,8(sp)
    80004404:	00813023          	sd	s0,0(sp)
    80004408:	01010413          	addi	s0,sp,16
    buffer[tail] = c;
    8000440c:	21053783          	ld	a5,528(a0)
    80004410:	00f50733          	add	a4,a0,a5
    80004414:	00b70423          	sb	a1,8(a4)
    tail = (tail + 1) % BUFFER_SIZE;
    80004418:	00178793          	addi	a5,a5,1
    8000441c:	1ff7f793          	andi	a5,a5,511
    80004420:	20f53823          	sd	a5,528(a0)
    size++;
    80004424:	21853783          	ld	a5,536(a0)
    80004428:	00178793          	addi	a5,a5,1
    8000442c:	20f53c23          	sd	a5,536(a0)
    sem_signal(sem);
    80004430:	00053503          	ld	a0,0(a0)
    80004434:	ffffd097          	auipc	ra,0xffffd
    80004438:	668080e7          	jalr	1640(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    8000443c:	00813083          	ld	ra,8(sp)
    80004440:	00013403          	ld	s0,0(sp)
    80004444:	01010113          	addi	sp,sp,16
    80004448:	00008067          	ret

000000008000444c <_ZN14ConsoleManager13consoleBuffer3getEv>:

char ConsoleManager::consoleBuffer::get(){
    8000444c:	fe010113          	addi	sp,sp,-32
    80004450:	00113c23          	sd	ra,24(sp)
    80004454:	00813823          	sd	s0,16(sp)
    80004458:	00913423          	sd	s1,8(sp)
    8000445c:	02010413          	addi	s0,sp,32
    80004460:	00050493          	mv	s1,a0
    sem_wait(sem);
    80004464:	00053503          	ld	a0,0(a0)
    80004468:	ffffd097          	auipc	ra,0xffffd
    8000446c:	608080e7          	jalr	1544(ra) # 80001a70 <_Z8sem_waitP4_sem>
    char c = buffer[head];
    80004470:	2084b783          	ld	a5,520(s1)
    80004474:	00f48733          	add	a4,s1,a5
    80004478:	00874503          	lbu	a0,8(a4)
    head = (head + 1) % BUFFER_SIZE;
    8000447c:	00178793          	addi	a5,a5,1
    80004480:	1ff7f793          	andi	a5,a5,511
    80004484:	20f4b423          	sd	a5,520(s1)
    size--;
    80004488:	2184b783          	ld	a5,536(s1)
    8000448c:	fff78793          	addi	a5,a5,-1
    80004490:	20f4bc23          	sd	a5,536(s1)
    return c;
}
    80004494:	01813083          	ld	ra,24(sp)
    80004498:	01013403          	ld	s0,16(sp)
    8000449c:	00813483          	ld	s1,8(sp)
    800044a0:	02010113          	addi	sp,sp,32
    800044a4:	00008067          	ret

00000000800044a8 <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>:

bool ConsoleManager::consoleBuffer::isEmpty(){
    800044a8:	ff010113          	addi	sp,sp,-16
    800044ac:	00813423          	sd	s0,8(sp)
    800044b0:	01010413          	addi	s0,sp,16
    return size == 0;
    800044b4:	21853503          	ld	a0,536(a0)
}
    800044b8:	00153513          	seqz	a0,a0
    800044bc:	00813403          	ld	s0,8(sp)
    800044c0:	01010113          	addi	sp,sp,16
    800044c4:	00008067          	ret

00000000800044c8 <_ZN14ConsoleManager13consoleBuffer6isFullEv>:

bool ConsoleManager::consoleBuffer::isFull(){
    800044c8:	ff010113          	addi	sp,sp,-16
    800044cc:	00813423          	sd	s0,8(sp)
    800044d0:	01010413          	addi	s0,sp,16
    return size == BUFFER_SIZE;
    800044d4:	21853503          	ld	a0,536(a0)
    800044d8:	e0050513          	addi	a0,a0,-512
}
    800044dc:	00153513          	seqz	a0,a0
    800044e0:	00813403          	ld	s0,8(sp)
    800044e4:	01010113          	addi	sp,sp,16
    800044e8:	00008067          	ret

00000000800044ec <_ZN14ConsoleManager4putcEc>:

void ConsoleManager::putc(char c){
    800044ec:	ff010113          	addi	sp,sp,-16
    800044f0:	00113423          	sd	ra,8(sp)
    800044f4:	00813023          	sd	s0,0(sp)
    800044f8:	01010413          	addi	s0,sp,16
    800044fc:	00050593          	mv	a1,a0
    instance->outBuffer.put(c);
    80004500:	0000a517          	auipc	a0,0xa
    80004504:	c9853503          	ld	a0,-872(a0) # 8000e198 <_ZN14ConsoleManager8instanceE>
    80004508:	22050513          	addi	a0,a0,544
    8000450c:	00000097          	auipc	ra,0x0
    80004510:	ef0080e7          	jalr	-272(ra) # 800043fc <_ZN14ConsoleManager13consoleBuffer3putEc>
}
    80004514:	00813083          	ld	ra,8(sp)
    80004518:	00013403          	ld	s0,0(sp)
    8000451c:	01010113          	addi	sp,sp,16
    80004520:	00008067          	ret

0000000080004524 <_ZN14ConsoleManager4getcEv>:

char ConsoleManager::getc(){
    80004524:	fe010113          	addi	sp,sp,-32
    80004528:	00113c23          	sd	ra,24(sp)
    8000452c:	00813823          	sd	s0,16(sp)
    80004530:	00913423          	sd	s1,8(sp)
    80004534:	02010413          	addi	s0,sp,32
    instance->waitingThreads++;
    80004538:	0000a497          	auipc	s1,0xa
    8000453c:	c6048493          	addi	s1,s1,-928 # 8000e198 <_ZN14ConsoleManager8instanceE>
    80004540:	0004b503          	ld	a0,0(s1)
    80004544:	44052783          	lw	a5,1088(a0)
    80004548:	0017879b          	addiw	a5,a5,1
    8000454c:	44f52023          	sw	a5,1088(a0)
    char c = instance->inBuffer.get();
    80004550:	00000097          	auipc	ra,0x0
    80004554:	efc080e7          	jalr	-260(ra) # 8000444c <_ZN14ConsoleManager13consoleBuffer3getEv>
    instance->waitingThreads--;
    80004558:	0004b703          	ld	a4,0(s1)
    8000455c:	44072783          	lw	a5,1088(a4)
    80004560:	fff7879b          	addiw	a5,a5,-1
    80004564:	44f72023          	sw	a5,1088(a4)
    return c;
}
    80004568:	01813083          	ld	ra,24(sp)
    8000456c:	01013403          	ld	s0,16(sp)
    80004570:	00813483          	ld	s1,8(sp)
    80004574:	02010113          	addi	sp,sp,32
    80004578:	00008067          	ret

000000008000457c <_ZN14ConsoleManager8finishedEv>:

bool ConsoleManager::finished(){
    8000457c:	fe010113          	addi	sp,sp,-32
    80004580:	00113c23          	sd	ra,24(sp)
    80004584:	00813823          	sd	s0,16(sp)
    80004588:	00913423          	sd	s1,8(sp)
    8000458c:	02010413          	addi	s0,sp,32
    return instance->outBuffer.isEmpty() && instance->waitingThreads == 0;
    80004590:	0000a497          	auipc	s1,0xa
    80004594:	c084b483          	ld	s1,-1016(s1) # 8000e198 <_ZN14ConsoleManager8instanceE>
    80004598:	22048513          	addi	a0,s1,544
    8000459c:	00000097          	auipc	ra,0x0
    800045a0:	f0c080e7          	jalr	-244(ra) # 800044a8 <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>
    800045a4:	00050a63          	beqz	a0,800045b8 <_ZN14ConsoleManager8finishedEv+0x3c>
    800045a8:	4404a783          	lw	a5,1088(s1)
    800045ac:	00078863          	beqz	a5,800045bc <_ZN14ConsoleManager8finishedEv+0x40>
    800045b0:	00000513          	li	a0,0
    800045b4:	0080006f          	j	800045bc <_ZN14ConsoleManager8finishedEv+0x40>
    800045b8:	00000513          	li	a0,0
}
    800045bc:	01813083          	ld	ra,24(sp)
    800045c0:	01013403          	ld	s0,16(sp)
    800045c4:	00813483          	ld	s1,8(sp)
    800045c8:	02010113          	addi	sp,sp,32
    800045cc:	00008067          	ret

00000000800045d0 <_ZN14ConsoleManager13outputHandlerEv>:

void ConsoleManager::outputHandler(){
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
    800045d0:	0000a797          	auipc	a5,0xa
    800045d4:	b087b783          	ld	a5,-1272(a5) # 8000e0d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800045d8:	0007b783          	ld	a5,0(a5)
    800045dc:	0007c783          	lbu	a5,0(a5)
    800045e0:	0207f793          	andi	a5,a5,32
    800045e4:	06078463          	beqz	a5,8000464c <_ZN14ConsoleManager13outputHandlerEv+0x7c>
void ConsoleManager::outputHandler(){
    800045e8:	fe010113          	addi	sp,sp,-32
    800045ec:	00113c23          	sd	ra,24(sp)
    800045f0:	00813823          	sd	s0,16(sp)
    800045f4:	00913423          	sd	s1,8(sp)
    800045f8:	02010413          	addi	s0,sp,32
        (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
    800045fc:	0000a797          	auipc	a5,0xa
    80004600:	aec7b783          	ld	a5,-1300(a5) # 8000e0e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80004604:	0007b483          	ld	s1,0(a5)
    80004608:	0000a517          	auipc	a0,0xa
    8000460c:	b9053503          	ld	a0,-1136(a0) # 8000e198 <_ZN14ConsoleManager8instanceE>
    80004610:	22050513          	addi	a0,a0,544
    80004614:	00000097          	auipc	ra,0x0
    80004618:	e38080e7          	jalr	-456(ra) # 8000444c <_ZN14ConsoleManager13consoleBuffer3getEv>
    8000461c:	00a48023          	sb	a0,0(s1)
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
    80004620:	0000a797          	auipc	a5,0xa
    80004624:	ab87b783          	ld	a5,-1352(a5) # 8000e0d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80004628:	0007b783          	ld	a5,0(a5)
    8000462c:	0007c783          	lbu	a5,0(a5)
    80004630:	0207f793          	andi	a5,a5,32
    80004634:	fc0794e3          	bnez	a5,800045fc <_ZN14ConsoleManager13outputHandlerEv+0x2c>
    }
}
    80004638:	01813083          	ld	ra,24(sp)
    8000463c:	01013403          	ld	s0,16(sp)
    80004640:	00813483          	ld	s1,8(sp)
    80004644:	02010113          	addi	sp,sp,32
    80004648:	00008067          	ret
    8000464c:	00008067          	ret

0000000080004650 <_ZN14ConsoleManager12inputHandlerEv>:

void ConsoleManager::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80004650:	0000a797          	auipc	a5,0xa
    80004654:	a887b783          	ld	a5,-1400(a5) # 8000e0d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80004658:	0007b783          	ld	a5,0(a5)
    8000465c:	0007c783          	lbu	a5,0(a5)
    80004660:	0017f793          	andi	a5,a5,1
    80004664:	04078e63          	beqz	a5,800046c0 <_ZN14ConsoleManager12inputHandlerEv+0x70>
void ConsoleManager::inputHandler(){
    80004668:	ff010113          	addi	sp,sp,-16
    8000466c:	00113423          	sd	ra,8(sp)
    80004670:	00813023          	sd	s0,0(sp)
    80004674:	01010413          	addi	s0,sp,16
        char ch =(*(char*)CONSOLE_RX_DATA);
    80004678:	0000a797          	auipc	a5,0xa
    8000467c:	a587b783          	ld	a5,-1448(a5) # 8000e0d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80004680:	0007b783          	ld	a5,0(a5)
        instance->inBuffer.put(ch);
    80004684:	0007c583          	lbu	a1,0(a5)
    80004688:	0000a517          	auipc	a0,0xa
    8000468c:	b1053503          	ld	a0,-1264(a0) # 8000e198 <_ZN14ConsoleManager8instanceE>
    80004690:	00000097          	auipc	ra,0x0
    80004694:	d6c080e7          	jalr	-660(ra) # 800043fc <_ZN14ConsoleManager13consoleBuffer3putEc>
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80004698:	0000a797          	auipc	a5,0xa
    8000469c:	a407b783          	ld	a5,-1472(a5) # 8000e0d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800046a0:	0007b783          	ld	a5,0(a5)
    800046a4:	0007c783          	lbu	a5,0(a5)
    800046a8:	0017f793          	andi	a5,a5,1
    800046ac:	fc0796e3          	bnez	a5,80004678 <_ZN14ConsoleManager12inputHandlerEv+0x28>
    }
    800046b0:	00813083          	ld	ra,8(sp)
    800046b4:	00013403          	ld	s0,0(sp)
    800046b8:	01010113          	addi	sp,sp,16
    800046bc:	00008067          	ret
    800046c0:	00008067          	ret

00000000800046c4 <exceptionHandler>:
#include "timer.h"
#include "assert.h"

// #include "console.h"

extern "C" void exceptionHandler(){
    800046c4:	fb010113          	addi	sp,sp,-80
    800046c8:	04113423          	sd	ra,72(sp)
    800046cc:	04813023          	sd	s0,64(sp)
    800046d0:	02913c23          	sd	s1,56(sp)
    800046d4:	03213823          	sd	s2,48(sp)
    800046d8:	03313423          	sd	s3,40(sp)
    800046dc:	03413023          	sd	s4,32(sp)
    800046e0:	01513c23          	sd	s5,24(sp)
    800046e4:	01613823          	sd	s6,16(sp)
    800046e8:	01713423          	sd	s7,8(sp)
    800046ec:	05010413          	addi	s0,sp,80
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    800046f0:	00070b93          	mv	s7,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    800046f4:	00068b13          	mv	s6,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    800046f8:	00060a93          	mv	s5,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    800046fc:	00058a13          	mv	s4,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80004700:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80004704:	14202973          	csrr	s2,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80004708:	100029f3          	csrr	s3,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    8000470c:	141024f3          	csrr	s1,sepc


    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80004710:	ff890693          	addi	a3,s2,-8
    80004714:	00100713          	li	a4,1
    80004718:	04d77c63          	bgeu	a4,a3,80004770 <exceptionHandler+0xac>
        __asm__ volatile("csrw scause, %0" :: "r"(scause));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    8000471c:	00500793          	li	a5,5
    80004720:	1ef90263          	beq	s2,a5,80004904 <exceptionHandler+0x240>
                ConsoleManager::putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    80004724:	00700793          	li	a5,7
    80004728:	38f90a63          	beq	s2,a5,80004abc <exceptionHandler+0x3f8>
                ConsoleManager::putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    8000472c:	fff00793          	li	a5,-1
    80004730:	03f79793          	slli	a5,a5,0x3f
    80004734:	00178793          	addi	a5,a5,1
    80004738:	54f90463          	beq	s2,a5,80004c80 <exceptionHandler+0x5bc>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    8000473c:	fff00793          	li	a5,-1
    80004740:	03f79793          	slli	a5,a5,0x3f
    80004744:	00978793          	addi	a5,a5,9
    80004748:	06f91c63          	bne	s2,a5,800047c0 <exceptionHandler+0xfc>
    {   
        int irq = plic_claim();
    8000474c:	00005097          	auipc	ra,0x5
    80004750:	9b8080e7          	jalr	-1608(ra) # 80009104 <plic_claim>
    80004754:	00050493          	mv	s1,a0
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    80004758:	00a00793          	li	a5,10
    8000475c:	58f50463          	beq	a0,a5,80004ce4 <exceptionHandler+0x620>
        plic_complete(irq);
    80004760:	00048513          	mv	a0,s1
    80004764:	00005097          	auipc	ra,0x5
    80004768:	9d8080e7          	jalr	-1576(ra) # 8000913c <plic_complete>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    8000476c:	0540006f          	j	800047c0 <exceptionHandler+0xfc>
        switch(a0){
    80004770:	04200713          	li	a4,66
    80004774:	18f76463          	bltu	a4,a5,800048fc <exceptionHandler+0x238>
    80004778:	00279793          	slli	a5,a5,0x2
    8000477c:	00007717          	auipc	a4,0x7
    80004780:	bf870713          	addi	a4,a4,-1032 # 8000b374 <CONSOLE_STATUS+0x364>
    80004784:	00e787b3          	add	a5,a5,a4
    80004788:	0007a783          	lw	a5,0(a5)
    8000478c:	00e787b3          	add	a5,a5,a4
    80004790:	00078067          	jr	a5
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80004794:	000a0593          	mv	a1,s4
    80004798:	0000a797          	auipc	a5,0xa
    8000479c:	9587b783          	ld	a5,-1704(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800047a0:	0007b503          	ld	a0,0(a5)
    800047a4:	fffff097          	auipc	ra,0xfffff
    800047a8:	fdc080e7          	jalr	-36(ra) # 80003780 <_ZN11HeapManager12heapAllocateEm>
        __asm__ volatile("csrw scause, %0" :: "r"(scause));
    800047ac:	14291073          	csrw	scause,s2
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800047b0:	00448493          	addi	s1,s1,4
    800047b4:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800047b8:	10099073          	csrw	sstatus,s3
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800047bc:	00050513          	mv	a0,a0
    800047c0:	04813083          	ld	ra,72(sp)
    800047c4:	04013403          	ld	s0,64(sp)
    800047c8:	03813483          	ld	s1,56(sp)
    800047cc:	03013903          	ld	s2,48(sp)
    800047d0:	02813983          	ld	s3,40(sp)
    800047d4:	02013a03          	ld	s4,32(sp)
    800047d8:	01813a83          	ld	s5,24(sp)
    800047dc:	01013b03          	ld	s6,16(sp)
    800047e0:	00813b83          	ld	s7,8(sp)
    800047e4:	05010113          	addi	sp,sp,80
    800047e8:	00008067          	ret
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    800047ec:	000a0593          	mv	a1,s4
    800047f0:	0000a797          	auipc	a5,0xa
    800047f4:	9007b783          	ld	a5,-1792(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800047f8:	0007b503          	ld	a0,0(a5)
    800047fc:	fffff097          	auipc	ra,0xfffff
    80004800:	604080e7          	jalr	1540(ra) # 80003e00 <_ZN11HeapManager8heapFreeEPv>
                break;
    80004804:	fa9ff06f          	j	800047ac <exceptionHandler+0xe8>
                ConsoleManager::putc('\0'); /// removing this line causes everything to break
    80004808:	00000513          	li	a0,0
    8000480c:	00000097          	auipc	ra,0x0
    80004810:	ce0080e7          	jalr	-800(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    80004814:	00100713          	li	a4,1
    80004818:	000b8693          	mv	a3,s7
    8000481c:	000b0613          	mv	a2,s6
    80004820:	000a8593          	mv	a1,s5
    80004824:	000a0513          	mv	a0,s4
    80004828:	ffffe097          	auipc	ra,0xffffe
    8000482c:	638080e7          	jalr	1592(ra) # 80002e60 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80004830:	f7dff06f          	j	800047ac <exceptionHandler+0xe8>
                returnVal = _thread::currentThread->exit();
    80004834:	fffff097          	auipc	ra,0xfffff
    80004838:	b80080e7          	jalr	-1152(ra) # 800033b4 <_ZN7_thread4exitEv>
                break;
    8000483c:	f71ff06f          	j	800047ac <exceptionHandler+0xe8>
                _thread::dispatch();
    80004840:	fffff097          	auipc	ra,0xfffff
    80004844:	924080e7          	jalr	-1756(ra) # 80003164 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80004848:	00000513          	li	a0,0
                break;
    8000484c:	f61ff06f          	j	800047ac <exceptionHandler+0xe8>
                _thread::currentThread->join((thread_t)a1);
    80004850:	000a0593          	mv	a1,s4
    80004854:	0000a797          	auipc	a5,0xa
    80004858:	8bc7b783          	ld	a5,-1860(a5) # 8000e110 <_GLOBAL_OFFSET_TABLE_+0x48>
    8000485c:	0007b503          	ld	a0,0(a5)
    80004860:	fffff097          	auipc	ra,0xfffff
    80004864:	99c080e7          	jalr	-1636(ra) # 800031fc <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80004868:	00000513          	li	a0,0
                break;
    8000486c:	f41ff06f          	j	800047ac <exceptionHandler+0xe8>
                _sem::open((sem_t*)a1, unsigned(a2));
    80004870:	000a859b          	sext.w	a1,s5
    80004874:	000a0513          	mv	a0,s4
    80004878:	ffffd097          	auipc	ra,0xffffd
    8000487c:	29c080e7          	jalr	668(ra) # 80001b14 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80004880:	00000513          	li	a0,0
                break;
    80004884:	f29ff06f          	j	800047ac <exceptionHandler+0xe8>
                _sem::close((sem_t)a1);
    80004888:	000a0513          	mv	a0,s4
    8000488c:	ffffd097          	auipc	ra,0xffffd
    80004890:	2f0080e7          	jalr	752(ra) # 80001b7c <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80004894:	00000513          	li	a0,0
                break;
    80004898:	f15ff06f          	j	800047ac <exceptionHandler+0xe8>
                _sem::wait((sem_t)a1);
    8000489c:	000a0513          	mv	a0,s4
    800048a0:	ffffd097          	auipc	ra,0xffffd
    800048a4:	348080e7          	jalr	840(ra) # 80001be8 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    800048a8:	00000513          	li	a0,0
                break;
    800048ac:	f01ff06f          	j	800047ac <exceptionHandler+0xe8>
                _sem::signal((sem_t)a1);
    800048b0:	000a0513          	mv	a0,s4
    800048b4:	ffffd097          	auipc	ra,0xffffd
    800048b8:	3e4080e7          	jalr	996(ra) # 80001c98 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    800048bc:	00000513          	li	a0,0
                break;
    800048c0:	eedff06f          	j	800047ac <exceptionHandler+0xe8>
                returnVal = Timer::getInstance().sleep(a1);
    800048c4:	ffffd097          	auipc	ra,0xffffd
    800048c8:	dd4080e7          	jalr	-556(ra) # 80001698 <_ZN5Timer11getInstanceEv>
    800048cc:	000a0593          	mv	a1,s4
    800048d0:	ffffd097          	auipc	ra,0xffffd
    800048d4:	ec4080e7          	jalr	-316(ra) # 80001794 <_ZN5Timer5sleepEm>
                break;
    800048d8:	ed5ff06f          	j	800047ac <exceptionHandler+0xe8>
                returnVal = ConsoleManager::getc();
    800048dc:	00000097          	auipc	ra,0x0
    800048e0:	c48080e7          	jalr	-952(ra) # 80004524 <_ZN14ConsoleManager4getcEv>
                break;
    800048e4:	ec9ff06f          	j	800047ac <exceptionHandler+0xe8>
                ConsoleManager::putc(a1);
    800048e8:	0ffa7513          	andi	a0,s4,255
    800048ec:	00000097          	auipc	ra,0x0
    800048f0:	c00080e7          	jalr	-1024(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
    uint64 returnVal = 0;
    800048f4:	00000513          	li	a0,0
                break;
    800048f8:	eb5ff06f          	j	800047ac <exceptionHandler+0xe8>
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    800048fc:	00000513          	li	a0,0
    80004900:	eadff06f          	j	800047ac <exceptionHandler+0xe8>
        ConsoleManager::putc('\n');
    80004904:	00a00513          	li	a0,10
    80004908:	00000097          	auipc	ra,0x0
    8000490c:	be4080e7          	jalr	-1052(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('E');
    80004910:	04500513          	li	a0,69
    80004914:	00000097          	auipc	ra,0x0
    80004918:	bd8080e7          	jalr	-1064(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    8000491c:	07200513          	li	a0,114
    80004920:	00000097          	auipc	ra,0x0
    80004924:	bcc080e7          	jalr	-1076(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004928:	07200513          	li	a0,114
    8000492c:	00000097          	auipc	ra,0x0
    80004930:	bc0080e7          	jalr	-1088(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('o');
    80004934:	06f00513          	li	a0,111
    80004938:	00000097          	auipc	ra,0x0
    8000493c:	bb4080e7          	jalr	-1100(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004940:	07200513          	li	a0,114
    80004944:	00000097          	auipc	ra,0x0
    80004948:	ba8080e7          	jalr	-1112(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    8000494c:	03a00513          	li	a0,58
    80004950:	00000097          	auipc	ra,0x0
    80004954:	b9c080e7          	jalr	-1124(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004958:	02000513          	li	a0,32
    8000495c:	00000097          	auipc	ra,0x0
    80004960:	b90080e7          	jalr	-1136(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80004964:	06900513          	li	a0,105
    80004968:	00000097          	auipc	ra,0x0
    8000496c:	b84080e7          	jalr	-1148(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004970:	06c00513          	li	a0,108
    80004974:	00000097          	auipc	ra,0x0
    80004978:	b78080e7          	jalr	-1160(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    8000497c:	06c00513          	li	a0,108
    80004980:	00000097          	auipc	ra,0x0
    80004984:	b6c080e7          	jalr	-1172(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004988:	06500513          	li	a0,101
    8000498c:	00000097          	auipc	ra,0x0
    80004990:	b60080e7          	jalr	-1184(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('g');
    80004994:	06700513          	li	a0,103
    80004998:	00000097          	auipc	ra,0x0
    8000499c:	b54080e7          	jalr	-1196(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    800049a0:	06100513          	li	a0,97
    800049a4:	00000097          	auipc	ra,0x0
    800049a8:	b48080e7          	jalr	-1208(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    800049ac:	06c00513          	li	a0,108
    800049b0:	00000097          	auipc	ra,0x0
    800049b4:	b3c080e7          	jalr	-1220(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    800049b8:	02000513          	li	a0,32
    800049bc:	00000097          	auipc	ra,0x0
    800049c0:	b30080e7          	jalr	-1232(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800049c4:	07200513          	li	a0,114
    800049c8:	00000097          	auipc	ra,0x0
    800049cc:	b24080e7          	jalr	-1244(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    800049d0:	06500513          	li	a0,101
    800049d4:	00000097          	auipc	ra,0x0
    800049d8:	b18080e7          	jalr	-1256(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    800049dc:	06100513          	li	a0,97
    800049e0:	00000097          	auipc	ra,0x0
    800049e4:	b0c080e7          	jalr	-1268(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('d');
    800049e8:	06400513          	li	a0,100
    800049ec:	00000097          	auipc	ra,0x0
    800049f0:	b00080e7          	jalr	-1280(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('!');
    800049f4:	02100513          	li	a0,33
    800049f8:	00000097          	auipc	ra,0x0
    800049fc:	af4080e7          	jalr	-1292(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('\n');
    80004a00:	00a00513          	li	a0,10
    80004a04:	00000097          	auipc	ra,0x0
    80004a08:	ae8080e7          	jalr	-1304(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('P');
    80004a0c:	05000513          	li	a0,80
    80004a10:	00000097          	auipc	ra,0x0
    80004a14:	adc080e7          	jalr	-1316(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('C');
    80004a18:	04300513          	li	a0,67
    80004a1c:	00000097          	auipc	ra,0x0
    80004a20:	ad0080e7          	jalr	-1328(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004a24:	03a00513          	li	a0,58
    80004a28:	00000097          	auipc	ra,0x0
    80004a2c:	ac4080e7          	jalr	-1340(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004a30:	02000513          	li	a0,32
    80004a34:	00000097          	auipc	ra,0x0
    80004a38:	ab8080e7          	jalr	-1352(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('0');
    80004a3c:	03000513          	li	a0,48
    80004a40:	00000097          	auipc	ra,0x0
    80004a44:	aac080e7          	jalr	-1364(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('x');
    80004a48:	07800513          	li	a0,120
    80004a4c:	00000097          	auipc	ra,0x0
    80004a50:	aa0080e7          	jalr	-1376(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004a54:	00f00913          	li	s2,15
    80004a58:	0140006f          	j	80004a6c <exceptionHandler+0x3a8>
                ConsoleManager::putc('A' + tmp - 10);
    80004a5c:	03750513          	addi	a0,a0,55
    80004a60:	00000097          	auipc	ra,0x0
    80004a64:	a8c080e7          	jalr	-1396(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004a68:	fff9091b          	addiw	s2,s2,-1
    80004a6c:	02094463          	bltz	s2,80004a94 <exceptionHandler+0x3d0>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80004a70:	0029151b          	slliw	a0,s2,0x2
    80004a74:	00a4d533          	srl	a0,s1,a0
    80004a78:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004a7c:	00900793          	li	a5,9
    80004a80:	fca7eee3          	bltu	a5,a0,80004a5c <exceptionHandler+0x398>
                ConsoleManager::putc('0' + tmp);
    80004a84:	03050513          	addi	a0,a0,48
    80004a88:	00000097          	auipc	ra,0x0
    80004a8c:	a64080e7          	jalr	-1436(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
    80004a90:	fd9ff06f          	j	80004a68 <exceptionHandler+0x3a4>
        assert(false);
    80004a94:	00007697          	auipc	a3,0x7
    80004a98:	87c68693          	addi	a3,a3,-1924 # 8000b310 <CONSOLE_STATUS+0x300>
    80004a9c:	07f00613          	li	a2,127
    80004aa0:	00007597          	auipc	a1,0x7
    80004aa4:	88858593          	addi	a1,a1,-1912 # 8000b328 <CONSOLE_STATUS+0x318>
    80004aa8:	00007517          	auipc	a0,0x7
    80004aac:	8a050513          	addi	a0,a0,-1888 # 8000b348 <CONSOLE_STATUS+0x338>
    80004ab0:	ffffd097          	auipc	ra,0xffffd
    80004ab4:	5ec080e7          	jalr	1516(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80004ab8:	d09ff06f          	j	800047c0 <exceptionHandler+0xfc>
        ConsoleManager::putc('\n');
    80004abc:	00a00513          	li	a0,10
    80004ac0:	00000097          	auipc	ra,0x0
    80004ac4:	a2c080e7          	jalr	-1492(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('E');
    80004ac8:	04500513          	li	a0,69
    80004acc:	00000097          	auipc	ra,0x0
    80004ad0:	a20080e7          	jalr	-1504(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004ad4:	07200513          	li	a0,114
    80004ad8:	00000097          	auipc	ra,0x0
    80004adc:	a14080e7          	jalr	-1516(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004ae0:	07200513          	li	a0,114
    80004ae4:	00000097          	auipc	ra,0x0
    80004ae8:	a08080e7          	jalr	-1528(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('o');
    80004aec:	06f00513          	li	a0,111
    80004af0:	00000097          	auipc	ra,0x0
    80004af4:	9fc080e7          	jalr	-1540(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004af8:	07200513          	li	a0,114
    80004afc:	00000097          	auipc	ra,0x0
    80004b00:	9f0080e7          	jalr	-1552(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004b04:	03a00513          	li	a0,58
    80004b08:	00000097          	auipc	ra,0x0
    80004b0c:	9e4080e7          	jalr	-1564(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004b10:	02000513          	li	a0,32
    80004b14:	00000097          	auipc	ra,0x0
    80004b18:	9d8080e7          	jalr	-1576(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80004b1c:	06900513          	li	a0,105
    80004b20:	00000097          	auipc	ra,0x0
    80004b24:	9cc080e7          	jalr	-1588(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004b28:	06c00513          	li	a0,108
    80004b2c:	00000097          	auipc	ra,0x0
    80004b30:	9c0080e7          	jalr	-1600(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004b34:	06c00513          	li	a0,108
    80004b38:	00000097          	auipc	ra,0x0
    80004b3c:	9b4080e7          	jalr	-1612(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004b40:	06500513          	li	a0,101
    80004b44:	00000097          	auipc	ra,0x0
    80004b48:	9a8080e7          	jalr	-1624(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('g');
    80004b4c:	06700513          	li	a0,103
    80004b50:	00000097          	auipc	ra,0x0
    80004b54:	99c080e7          	jalr	-1636(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    80004b58:	06100513          	li	a0,97
    80004b5c:	00000097          	auipc	ra,0x0
    80004b60:	990080e7          	jalr	-1648(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004b64:	06c00513          	li	a0,108
    80004b68:	00000097          	auipc	ra,0x0
    80004b6c:	984080e7          	jalr	-1660(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004b70:	02000513          	li	a0,32
    80004b74:	00000097          	auipc	ra,0x0
    80004b78:	978080e7          	jalr	-1672(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('w');
    80004b7c:	07700513          	li	a0,119
    80004b80:	00000097          	auipc	ra,0x0
    80004b84:	96c080e7          	jalr	-1684(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004b88:	07200513          	li	a0,114
    80004b8c:	00000097          	auipc	ra,0x0
    80004b90:	960080e7          	jalr	-1696(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80004b94:	06900513          	li	a0,105
    80004b98:	00000097          	auipc	ra,0x0
    80004b9c:	954080e7          	jalr	-1708(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('t');
    80004ba0:	07400513          	li	a0,116
    80004ba4:	00000097          	auipc	ra,0x0
    80004ba8:	948080e7          	jalr	-1720(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004bac:	06500513          	li	a0,101
    80004bb0:	00000097          	auipc	ra,0x0
    80004bb4:	93c080e7          	jalr	-1732(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('!');
    80004bb8:	02100513          	li	a0,33
    80004bbc:	00000097          	auipc	ra,0x0
    80004bc0:	930080e7          	jalr	-1744(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('\n');
    80004bc4:	00a00513          	li	a0,10
    80004bc8:	00000097          	auipc	ra,0x0
    80004bcc:	924080e7          	jalr	-1756(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('P');
    80004bd0:	05000513          	li	a0,80
    80004bd4:	00000097          	auipc	ra,0x0
    80004bd8:	918080e7          	jalr	-1768(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('C');
    80004bdc:	04300513          	li	a0,67
    80004be0:	00000097          	auipc	ra,0x0
    80004be4:	90c080e7          	jalr	-1780(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004be8:	03a00513          	li	a0,58
    80004bec:	00000097          	auipc	ra,0x0
    80004bf0:	900080e7          	jalr	-1792(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004bf4:	02000513          	li	a0,32
    80004bf8:	00000097          	auipc	ra,0x0
    80004bfc:	8f4080e7          	jalr	-1804(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('0');
    80004c00:	03000513          	li	a0,48
    80004c04:	00000097          	auipc	ra,0x0
    80004c08:	8e8080e7          	jalr	-1816(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('x');
    80004c0c:	07800513          	li	a0,120
    80004c10:	00000097          	auipc	ra,0x0
    80004c14:	8dc080e7          	jalr	-1828(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004c18:	00f00913          	li	s2,15
    80004c1c:	0140006f          	j	80004c30 <exceptionHandler+0x56c>
                ConsoleManager::putc('A' + tmp - 10);
    80004c20:	03750513          	addi	a0,a0,55
    80004c24:	00000097          	auipc	ra,0x0
    80004c28:	8c8080e7          	jalr	-1848(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004c2c:	fff9091b          	addiw	s2,s2,-1
    80004c30:	02094463          	bltz	s2,80004c58 <exceptionHandler+0x594>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80004c34:	0029151b          	slliw	a0,s2,0x2
    80004c38:	00a4d533          	srl	a0,s1,a0
    80004c3c:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004c40:	00900793          	li	a5,9
    80004c44:	fca7eee3          	bltu	a5,a0,80004c20 <exceptionHandler+0x55c>
                ConsoleManager::putc('0' + tmp);
    80004c48:	03050513          	addi	a0,a0,48
    80004c4c:	00000097          	auipc	ra,0x0
    80004c50:	8a0080e7          	jalr	-1888(ra) # 800044ec <_ZN14ConsoleManager4putcEc>
    80004c54:	fd9ff06f          	j	80004c2c <exceptionHandler+0x568>
        assert(false);
    80004c58:	00006697          	auipc	a3,0x6
    80004c5c:	6b868693          	addi	a3,a3,1720 # 8000b310 <CONSOLE_STATUS+0x300>
    80004c60:	0a700613          	li	a2,167
    80004c64:	00006597          	auipc	a1,0x6
    80004c68:	6c458593          	addi	a1,a1,1732 # 8000b328 <CONSOLE_STATUS+0x318>
    80004c6c:	00006517          	auipc	a0,0x6
    80004c70:	6dc50513          	addi	a0,a0,1756 # 8000b348 <CONSOLE_STATUS+0x338>
    80004c74:	ffffd097          	auipc	ra,0xffffd
    80004c78:	428080e7          	jalr	1064(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80004c7c:	b45ff06f          	j	800047c0 <exceptionHandler+0xfc>
        Timer::getInstance().tick();
    80004c80:	ffffd097          	auipc	ra,0xffffd
    80004c84:	a18080e7          	jalr	-1512(ra) # 80001698 <_ZN5Timer11getInstanceEv>
    80004c88:	ffffd097          	auipc	ra,0xffffd
    80004c8c:	a74080e7          	jalr	-1420(ra) # 800016fc <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    80004c90:	00009797          	auipc	a5,0x9
    80004c94:	4807b783          	ld	a5,1152(a5) # 8000e110 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004c98:	0007b503          	ld	a0,0(a5)
    80004c9c:	ffffe097          	auipc	ra,0xffffe
    80004ca0:	688080e7          	jalr	1672(ra) # 80003324 <_ZN7_thread4tickEv>
    80004ca4:	00051c63          	bnez	a0,80004cbc <exceptionHandler+0x5f8>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80004ca8:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004cac:	10099073          	csrw	sstatus,s3
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80004cb0:	00200793          	li	a5,2
    80004cb4:	1447b073          	csrc	sip,a5
    80004cb8:	b09ff06f          	j	800047c0 <exceptionHandler+0xfc>
        assert(_thread::currentThread->tick() == 0);
    80004cbc:	00006697          	auipc	a3,0x6
    80004cc0:	65468693          	addi	a3,a3,1620 # 8000b310 <CONSOLE_STATUS+0x300>
    80004cc4:	0ab00613          	li	a2,171
    80004cc8:	00006597          	auipc	a1,0x6
    80004ccc:	66058593          	addi	a1,a1,1632 # 8000b328 <CONSOLE_STATUS+0x318>
    80004cd0:	00006517          	auipc	a0,0x6
    80004cd4:	68050513          	addi	a0,a0,1664 # 8000b350 <CONSOLE_STATUS+0x340>
    80004cd8:	ffffd097          	auipc	ra,0xffffd
    80004cdc:	3c4080e7          	jalr	964(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80004ce0:	fc9ff06f          	j	80004ca8 <exceptionHandler+0x5e4>
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    80004ce4:	00000097          	auipc	ra,0x0
    80004ce8:	96c080e7          	jalr	-1684(ra) # 80004650 <_ZN14ConsoleManager12inputHandlerEv>
    80004cec:	a75ff06f          	j	80004760 <exceptionHandler+0x9c>

0000000080004cf0 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80004cf0:	fe010113          	addi	sp,sp,-32
    80004cf4:	00113c23          	sd	ra,24(sp)
    80004cf8:	00813823          	sd	s0,16(sp)
    80004cfc:	00913423          	sd	s1,8(sp)
    80004d00:	02010413          	addi	s0,sp,32
    80004d04:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80004d08:	00009797          	auipc	a5,0x9
    80004d0c:	4987b783          	ld	a5,1176(a5) # 8000e1a0 <_ZN9Scheduler9singletonE>
    80004d10:	02079463          	bnez	a5,80004d38 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80004d14:	00009797          	auipc	a5,0x9
    80004d18:	4897b623          	sd	s1,1164(a5) # 8000e1a0 <_ZN9Scheduler9singletonE>
    head = 0;
    80004d1c:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80004d20:	0004b423          	sd	zero,8(s1)
}
    80004d24:	01813083          	ld	ra,24(sp)
    80004d28:	01013403          	ld	s0,16(sp)
    80004d2c:	00813483          	ld	s1,8(sp)
    80004d30:	02010113          	addi	sp,sp,32
    80004d34:	00008067          	ret
    assert(singleton == 0);
    80004d38:	00006697          	auipc	a3,0x6
    80004d3c:	74868693          	addi	a3,a3,1864 # 8000b480 <CONSOLE_STATUS+0x470>
    80004d40:	01800613          	li	a2,24
    80004d44:	00006597          	auipc	a1,0x6
    80004d48:	75458593          	addi	a1,a1,1876 # 8000b498 <CONSOLE_STATUS+0x488>
    80004d4c:	00006517          	auipc	a0,0x6
    80004d50:	75c50513          	addi	a0,a0,1884 # 8000b4a8 <CONSOLE_STATUS+0x498>
    80004d54:	ffffd097          	auipc	ra,0xffffd
    80004d58:	348080e7          	jalr	840(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80004d5c:	fb9ff06f          	j	80004d14 <_ZN9SchedulerC1Ev+0x24>

0000000080004d60 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80004d60:	ff010113          	addi	sp,sp,-16
    80004d64:	00813423          	sd	s0,8(sp)
    80004d68:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80004d6c:	00009797          	auipc	a5,0x9
    80004d70:	4347b783          	ld	a5,1076(a5) # 8000e1a0 <_ZN9Scheduler9singletonE>
    80004d74:	0007b503          	ld	a0,0(a5)
}
    80004d78:	00153513          	seqz	a0,a0
    80004d7c:	00813403          	ld	s0,8(sp)
    80004d80:	01010113          	addi	sp,sp,16
    80004d84:	00008067          	ret

0000000080004d88 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80004d88:	fe010113          	addi	sp,sp,-32
    80004d8c:	00113c23          	sd	ra,24(sp)
    80004d90:	00813823          	sd	s0,16(sp)
    80004d94:	00913423          	sd	s1,8(sp)
    80004d98:	01213023          	sd	s2,0(sp)
    80004d9c:	02010413          	addi	s0,sp,32
    80004da0:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80004da4:	00009917          	auipc	s2,0x9
    80004da8:	3fc93903          	ld	s2,1020(s2) # 8000e1a0 <_ZN9Scheduler9singletonE>
    80004dac:	00093783          	ld	a5,0(s2)
    80004db0:	14078263          	beqz	a5,80004ef4 <_ZN9Scheduler3putEP7_thread+0x16c>
        singleton->head = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
        singleton->tail = singleton->head;
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80004db4:	00893903          	ld	s2,8(s2)
    80004db8:	00100593          	li	a1,1
    80004dbc:	00009797          	auipc	a5,0x9
    80004dc0:	3347b783          	ld	a5,820(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004dc4:	0007b503          	ld	a0,0(a5)
    80004dc8:	fffff097          	auipc	ra,0xfffff
    80004dcc:	9b8080e7          	jalr	-1608(ra) # 80003780 <_ZN11HeapManager12heapAllocateEm>
    80004dd0:	00a90423          	sb	a0,8(s2)
    80004dd4:	00855793          	srli	a5,a0,0x8
    80004dd8:	00f904a3          	sb	a5,9(s2)
    80004ddc:	01055793          	srli	a5,a0,0x10
    80004de0:	00f90523          	sb	a5,10(s2)
    80004de4:	0185579b          	srliw	a5,a0,0x18
    80004de8:	00f905a3          	sb	a5,11(s2)
    80004dec:	02055793          	srli	a5,a0,0x20
    80004df0:	00f90623          	sb	a5,12(s2)
    80004df4:	02855793          	srli	a5,a0,0x28
    80004df8:	00f906a3          	sb	a5,13(s2)
    80004dfc:	03055793          	srli	a5,a0,0x30
    80004e00:	00f90723          	sb	a5,14(s2)
    80004e04:	03855513          	srli	a0,a0,0x38
    80004e08:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80004e0c:	00009617          	auipc	a2,0x9
    80004e10:	39460613          	addi	a2,a2,916 # 8000e1a0 <_ZN9Scheduler9singletonE>
    80004e14:	00063583          	ld	a1,0(a2)
    80004e18:	0085b703          	ld	a4,8(a1)
    80004e1c:	00874783          	lbu	a5,8(a4)
    80004e20:	00974683          	lbu	a3,9(a4)
    80004e24:	00869693          	slli	a3,a3,0x8
    80004e28:	00f6e6b3          	or	a3,a3,a5
    80004e2c:	00a74783          	lbu	a5,10(a4)
    80004e30:	01079793          	slli	a5,a5,0x10
    80004e34:	00d7e6b3          	or	a3,a5,a3
    80004e38:	00b74783          	lbu	a5,11(a4)
    80004e3c:	01879793          	slli	a5,a5,0x18
    80004e40:	00d7e7b3          	or	a5,a5,a3
    80004e44:	00c74683          	lbu	a3,12(a4)
    80004e48:	02069693          	slli	a3,a3,0x20
    80004e4c:	00f6e7b3          	or	a5,a3,a5
    80004e50:	00d74683          	lbu	a3,13(a4)
    80004e54:	02869693          	slli	a3,a3,0x28
    80004e58:	00f6e6b3          	or	a3,a3,a5
    80004e5c:	00e74783          	lbu	a5,14(a4)
    80004e60:	03079793          	slli	a5,a5,0x30
    80004e64:	00d7e6b3          	or	a3,a5,a3
    80004e68:	00f74783          	lbu	a5,15(a4)
    80004e6c:	03879793          	slli	a5,a5,0x38
    80004e70:	00d7e7b3          	or	a5,a5,a3
    80004e74:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80004e78:	00978023          	sb	s1,0(a5)
    80004e7c:	0084d713          	srli	a4,s1,0x8
    80004e80:	00e780a3          	sb	a4,1(a5)
    80004e84:	0104d713          	srli	a4,s1,0x10
    80004e88:	00e78123          	sb	a4,2(a5)
    80004e8c:	0184d71b          	srliw	a4,s1,0x18
    80004e90:	00e781a3          	sb	a4,3(a5)
    80004e94:	0204d713          	srli	a4,s1,0x20
    80004e98:	00e78223          	sb	a4,4(a5)
    80004e9c:	0284d713          	srli	a4,s1,0x28
    80004ea0:	00e782a3          	sb	a4,5(a5)
    80004ea4:	0304d713          	srli	a4,s1,0x30
    80004ea8:	00e78323          	sb	a4,6(a5)
    80004eac:	0384d493          	srli	s1,s1,0x38
    80004eb0:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80004eb4:	00063783          	ld	a5,0(a2)
    80004eb8:	0087b783          	ld	a5,8(a5)
    80004ebc:	00078423          	sb	zero,8(a5)
    80004ec0:	000784a3          	sb	zero,9(a5)
    80004ec4:	00078523          	sb	zero,10(a5)
    80004ec8:	000785a3          	sb	zero,11(a5)
    80004ecc:	00078623          	sb	zero,12(a5)
    80004ed0:	000786a3          	sb	zero,13(a5)
    80004ed4:	00078723          	sb	zero,14(a5)
    80004ed8:	000787a3          	sb	zero,15(a5)
    }
}
    80004edc:	01813083          	ld	ra,24(sp)
    80004ee0:	01013403          	ld	s0,16(sp)
    80004ee4:	00813483          	ld	s1,8(sp)
    80004ee8:	00013903          	ld	s2,0(sp)
    80004eec:	02010113          	addi	sp,sp,32
    80004ef0:	00008067          	ret
        singleton->head = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80004ef4:	00100593          	li	a1,1
    80004ef8:	00009797          	auipc	a5,0x9
    80004efc:	1f87b783          	ld	a5,504(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004f00:	0007b503          	ld	a0,0(a5)
    80004f04:	fffff097          	auipc	ra,0xfffff
    80004f08:	87c080e7          	jalr	-1924(ra) # 80003780 <_ZN11HeapManager12heapAllocateEm>
    80004f0c:	00a93023          	sd	a0,0(s2)
        singleton->tail = singleton->head;
    80004f10:	00009717          	auipc	a4,0x9
    80004f14:	29070713          	addi	a4,a4,656 # 8000e1a0 <_ZN9Scheduler9singletonE>
    80004f18:	00073683          	ld	a3,0(a4)
    80004f1c:	0006b783          	ld	a5,0(a3)
    80004f20:	00f6b423          	sd	a5,8(a3)
        singleton->head->thread = thread;
    80004f24:	00978023          	sb	s1,0(a5)
    80004f28:	0084d693          	srli	a3,s1,0x8
    80004f2c:	00d780a3          	sb	a3,1(a5)
    80004f30:	0104d693          	srli	a3,s1,0x10
    80004f34:	00d78123          	sb	a3,2(a5)
    80004f38:	0184d69b          	srliw	a3,s1,0x18
    80004f3c:	00d781a3          	sb	a3,3(a5)
    80004f40:	0204d693          	srli	a3,s1,0x20
    80004f44:	00d78223          	sb	a3,4(a5)
    80004f48:	0284d693          	srli	a3,s1,0x28
    80004f4c:	00d782a3          	sb	a3,5(a5)
    80004f50:	0304d693          	srli	a3,s1,0x30
    80004f54:	00d78323          	sb	a3,6(a5)
    80004f58:	0384d493          	srli	s1,s1,0x38
    80004f5c:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80004f60:	00073783          	ld	a5,0(a4)
    80004f64:	0007b783          	ld	a5,0(a5)
    80004f68:	00078423          	sb	zero,8(a5)
    80004f6c:	000784a3          	sb	zero,9(a5)
    80004f70:	00078523          	sb	zero,10(a5)
    80004f74:	000785a3          	sb	zero,11(a5)
    80004f78:	00078623          	sb	zero,12(a5)
    80004f7c:	000786a3          	sb	zero,13(a5)
    80004f80:	00078723          	sb	zero,14(a5)
    80004f84:	000787a3          	sb	zero,15(a5)
    80004f88:	f55ff06f          	j	80004edc <_ZN9Scheduler3putEP7_thread+0x154>

0000000080004f8c <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80004f8c:	fe010113          	addi	sp,sp,-32
    80004f90:	00113c23          	sd	ra,24(sp)
    80004f94:	00813823          	sd	s0,16(sp)
    80004f98:	00913423          	sd	s1,8(sp)
    80004f9c:	02010413          	addi	s0,sp,32
    if(singleton->head == 0){
    80004fa0:	00009697          	auipc	a3,0x9
    80004fa4:	2006b683          	ld	a3,512(a3) # 8000e1a0 <_ZN9Scheduler9singletonE>
    80004fa8:	0006b583          	ld	a1,0(a3)
    80004fac:	0e058e63          	beqz	a1,800050a8 <_ZN9Scheduler3getEv+0x11c>
        return 0;
    }
    ThreadList* tmp = singleton->head;
    singleton->head = singleton->head->next;
    80004fb0:	0085c783          	lbu	a5,8(a1)
    80004fb4:	0095c703          	lbu	a4,9(a1)
    80004fb8:	00871713          	slli	a4,a4,0x8
    80004fbc:	00f76733          	or	a4,a4,a5
    80004fc0:	00a5c783          	lbu	a5,10(a1)
    80004fc4:	01079793          	slli	a5,a5,0x10
    80004fc8:	00e7e733          	or	a4,a5,a4
    80004fcc:	00b5c783          	lbu	a5,11(a1)
    80004fd0:	01879793          	slli	a5,a5,0x18
    80004fd4:	00e7e7b3          	or	a5,a5,a4
    80004fd8:	00c5c703          	lbu	a4,12(a1)
    80004fdc:	02071713          	slli	a4,a4,0x20
    80004fe0:	00f767b3          	or	a5,a4,a5
    80004fe4:	00d5c703          	lbu	a4,13(a1)
    80004fe8:	02871713          	slli	a4,a4,0x28
    80004fec:	00f76733          	or	a4,a4,a5
    80004ff0:	00e5c783          	lbu	a5,14(a1)
    80004ff4:	03079793          	slli	a5,a5,0x30
    80004ff8:	00e7e733          	or	a4,a5,a4
    80004ffc:	00f5c783          	lbu	a5,15(a1)
    80005000:	03879793          	slli	a5,a5,0x38
    80005004:	00e7e7b3          	or	a5,a5,a4
    80005008:	00f6b023          	sd	a5,0(a3)
    if(singleton->head == 0){
    8000500c:	00009797          	auipc	a5,0x9
    80005010:	1947b783          	ld	a5,404(a5) # 8000e1a0 <_ZN9Scheduler9singletonE>
    80005014:	0007b703          	ld	a4,0(a5)
    80005018:	08070463          	beqz	a4,800050a0 <_ZN9Scheduler3getEv+0x114>
        singleton->tail = 0;
    }
    thread_t thread = tmp->thread;
    8000501c:	0005c483          	lbu	s1,0(a1)
    80005020:	0015c783          	lbu	a5,1(a1)
    80005024:	00879793          	slli	a5,a5,0x8
    80005028:	0097e7b3          	or	a5,a5,s1
    8000502c:	0025c483          	lbu	s1,2(a1)
    80005030:	01049493          	slli	s1,s1,0x10
    80005034:	00f4e7b3          	or	a5,s1,a5
    80005038:	0035c483          	lbu	s1,3(a1)
    8000503c:	01849493          	slli	s1,s1,0x18
    80005040:	00f4e4b3          	or	s1,s1,a5
    80005044:	0045c783          	lbu	a5,4(a1)
    80005048:	02079793          	slli	a5,a5,0x20
    8000504c:	0097e4b3          	or	s1,a5,s1
    80005050:	0055c783          	lbu	a5,5(a1)
    80005054:	02879793          	slli	a5,a5,0x28
    80005058:	0097e7b3          	or	a5,a5,s1
    8000505c:	0065c483          	lbu	s1,6(a1)
    80005060:	03049493          	slli	s1,s1,0x30
    80005064:	00f4e7b3          	or	a5,s1,a5
    80005068:	0075c483          	lbu	s1,7(a1)
    8000506c:	03849493          	slli	s1,s1,0x38
    80005070:	00f4e4b3          	or	s1,s1,a5
    HeapManager::getInstance().heapFree(tmp);
    80005074:	00009797          	auipc	a5,0x9
    80005078:	07c7b783          	ld	a5,124(a5) # 8000e0f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000507c:	0007b503          	ld	a0,0(a5)
    80005080:	fffff097          	auipc	ra,0xfffff
    80005084:	d80080e7          	jalr	-640(ra) # 80003e00 <_ZN11HeapManager8heapFreeEPv>
    return thread;
}
    80005088:	00048513          	mv	a0,s1
    8000508c:	01813083          	ld	ra,24(sp)
    80005090:	01013403          	ld	s0,16(sp)
    80005094:	00813483          	ld	s1,8(sp)
    80005098:	02010113          	addi	sp,sp,32
    8000509c:	00008067          	ret
        singleton->tail = 0;
    800050a0:	0007b423          	sd	zero,8(a5)
    800050a4:	f79ff06f          	j	8000501c <_ZN9Scheduler3getEv+0x90>
        return 0;
    800050a8:	00058493          	mv	s1,a1
    800050ac:	fddff06f          	j	80005088 <_ZN9Scheduler3getEv+0xfc>

00000000800050b0 <_ZN9Scheduler8getCountEv>:

int Scheduler::getCount(){
    800050b0:	ff010113          	addi	sp,sp,-16
    800050b4:	00813423          	sd	s0,8(sp)
    800050b8:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    800050bc:	00009797          	auipc	a5,0x9
    800050c0:	0e47b783          	ld	a5,228(a5) # 8000e1a0 <_ZN9Scheduler9singletonE>
    800050c4:	0007b783          	ld	a5,0(a5)
    int count = 0;
    800050c8:	00000513          	li	a0,0
    while(tmp != 0){
    800050cc:	06078263          	beqz	a5,80005130 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    800050d0:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    800050d4:	0087c683          	lbu	a3,8(a5)
    800050d8:	0097c703          	lbu	a4,9(a5)
    800050dc:	00871713          	slli	a4,a4,0x8
    800050e0:	00d766b3          	or	a3,a4,a3
    800050e4:	00a7c703          	lbu	a4,10(a5)
    800050e8:	01071713          	slli	a4,a4,0x10
    800050ec:	00d76733          	or	a4,a4,a3
    800050f0:	00b7c683          	lbu	a3,11(a5)
    800050f4:	01869693          	slli	a3,a3,0x18
    800050f8:	00e6e733          	or	a4,a3,a4
    800050fc:	00c7c683          	lbu	a3,12(a5)
    80005100:	02069693          	slli	a3,a3,0x20
    80005104:	00e6e6b3          	or	a3,a3,a4
    80005108:	00d7c703          	lbu	a4,13(a5)
    8000510c:	02871713          	slli	a4,a4,0x28
    80005110:	00d766b3          	or	a3,a4,a3
    80005114:	00e7c703          	lbu	a4,14(a5)
    80005118:	03071713          	slli	a4,a4,0x30
    8000511c:	00d76733          	or	a4,a4,a3
    80005120:	00f7c783          	lbu	a5,15(a5)
    80005124:	03879793          	slli	a5,a5,0x38
    80005128:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    8000512c:	fa1ff06f          	j	800050cc <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80005130:	00813403          	ld	s0,8(sp)
    80005134:	01010113          	addi	sp,sp,16
    80005138:	00008067          	ret

000000008000513c <_ZN6BufferC1Ei>:
#include "../test_h/buffer.h"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000513c:	fe010113          	addi	sp,sp,-32
    80005140:	00113c23          	sd	ra,24(sp)
    80005144:	00813823          	sd	s0,16(sp)
    80005148:	00913423          	sd	s1,8(sp)
    8000514c:	01213023          	sd	s2,0(sp)
    80005150:	02010413          	addi	s0,sp,32
    80005154:	00050493          	mv	s1,a0
    80005158:	00058913          	mv	s2,a1
    8000515c:	0015879b          	addiw	a5,a1,1
    80005160:	0007851b          	sext.w	a0,a5
    80005164:	00f4a023          	sw	a5,0(s1)
    80005168:	0004a823          	sw	zero,16(s1)
    8000516c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005170:	00251513          	slli	a0,a0,0x2
    80005174:	ffffc097          	auipc	ra,0xffffc
    80005178:	730080e7          	jalr	1840(ra) # 800018a4 <_Z9mem_allocm>
    8000517c:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80005180:	00000593          	li	a1,0
    80005184:	02048513          	addi	a0,s1,32
    80005188:	ffffd097          	auipc	ra,0xffffd
    8000518c:	884080e7          	jalr	-1916(ra) # 80001a0c <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80005190:	00090593          	mv	a1,s2
    80005194:	01848513          	addi	a0,s1,24
    80005198:	ffffd097          	auipc	ra,0xffffd
    8000519c:	874080e7          	jalr	-1932(ra) # 80001a0c <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    800051a0:	00100593          	li	a1,1
    800051a4:	02848513          	addi	a0,s1,40
    800051a8:	ffffd097          	auipc	ra,0xffffd
    800051ac:	864080e7          	jalr	-1948(ra) # 80001a0c <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    800051b0:	00100593          	li	a1,1
    800051b4:	03048513          	addi	a0,s1,48
    800051b8:	ffffd097          	auipc	ra,0xffffd
    800051bc:	854080e7          	jalr	-1964(ra) # 80001a0c <_Z8sem_openPP4_semj>
}
    800051c0:	01813083          	ld	ra,24(sp)
    800051c4:	01013403          	ld	s0,16(sp)
    800051c8:	00813483          	ld	s1,8(sp)
    800051cc:	00013903          	ld	s2,0(sp)
    800051d0:	02010113          	addi	sp,sp,32
    800051d4:	00008067          	ret

00000000800051d8 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800051d8:	fe010113          	addi	sp,sp,-32
    800051dc:	00113c23          	sd	ra,24(sp)
    800051e0:	00813823          	sd	s0,16(sp)
    800051e4:	00913423          	sd	s1,8(sp)
    800051e8:	01213023          	sd	s2,0(sp)
    800051ec:	02010413          	addi	s0,sp,32
    800051f0:	00050493          	mv	s1,a0
    800051f4:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800051f8:	01853503          	ld	a0,24(a0)
    800051fc:	ffffd097          	auipc	ra,0xffffd
    80005200:	874080e7          	jalr	-1932(ra) # 80001a70 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80005204:	0304b503          	ld	a0,48(s1)
    80005208:	ffffd097          	auipc	ra,0xffffd
    8000520c:	868080e7          	jalr	-1944(ra) # 80001a70 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80005210:	0084b783          	ld	a5,8(s1)
    80005214:	0144a703          	lw	a4,20(s1)
    80005218:	00271713          	slli	a4,a4,0x2
    8000521c:	00e787b3          	add	a5,a5,a4
    80005220:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005224:	0144a783          	lw	a5,20(s1)
    80005228:	0017879b          	addiw	a5,a5,1
    8000522c:	0004a703          	lw	a4,0(s1)
    80005230:	02e7e7bb          	remw	a5,a5,a4
    80005234:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80005238:	0304b503          	ld	a0,48(s1)
    8000523c:	ffffd097          	auipc	ra,0xffffd
    80005240:	860080e7          	jalr	-1952(ra) # 80001a9c <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80005244:	0204b503          	ld	a0,32(s1)
    80005248:	ffffd097          	auipc	ra,0xffffd
    8000524c:	854080e7          	jalr	-1964(ra) # 80001a9c <_Z10sem_signalP4_sem>

}
    80005250:	01813083          	ld	ra,24(sp)
    80005254:	01013403          	ld	s0,16(sp)
    80005258:	00813483          	ld	s1,8(sp)
    8000525c:	00013903          	ld	s2,0(sp)
    80005260:	02010113          	addi	sp,sp,32
    80005264:	00008067          	ret

0000000080005268 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80005268:	fe010113          	addi	sp,sp,-32
    8000526c:	00113c23          	sd	ra,24(sp)
    80005270:	00813823          	sd	s0,16(sp)
    80005274:	00913423          	sd	s1,8(sp)
    80005278:	01213023          	sd	s2,0(sp)
    8000527c:	02010413          	addi	s0,sp,32
    80005280:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80005284:	02053503          	ld	a0,32(a0)
    80005288:	ffffc097          	auipc	ra,0xffffc
    8000528c:	7e8080e7          	jalr	2024(ra) # 80001a70 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80005290:	0284b503          	ld	a0,40(s1)
    80005294:	ffffc097          	auipc	ra,0xffffc
    80005298:	7dc080e7          	jalr	2012(ra) # 80001a70 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    8000529c:	0084b703          	ld	a4,8(s1)
    800052a0:	0104a783          	lw	a5,16(s1)
    800052a4:	00279693          	slli	a3,a5,0x2
    800052a8:	00d70733          	add	a4,a4,a3
    800052ac:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800052b0:	0017879b          	addiw	a5,a5,1
    800052b4:	0004a703          	lw	a4,0(s1)
    800052b8:	02e7e7bb          	remw	a5,a5,a4
    800052bc:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800052c0:	0284b503          	ld	a0,40(s1)
    800052c4:	ffffc097          	auipc	ra,0xffffc
    800052c8:	7d8080e7          	jalr	2008(ra) # 80001a9c <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    800052cc:	0184b503          	ld	a0,24(s1)
    800052d0:	ffffc097          	auipc	ra,0xffffc
    800052d4:	7cc080e7          	jalr	1996(ra) # 80001a9c <_Z10sem_signalP4_sem>

    return ret;
}
    800052d8:	00090513          	mv	a0,s2
    800052dc:	01813083          	ld	ra,24(sp)
    800052e0:	01013403          	ld	s0,16(sp)
    800052e4:	00813483          	ld	s1,8(sp)
    800052e8:	00013903          	ld	s2,0(sp)
    800052ec:	02010113          	addi	sp,sp,32
    800052f0:	00008067          	ret

00000000800052f4 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800052f4:	fe010113          	addi	sp,sp,-32
    800052f8:	00113c23          	sd	ra,24(sp)
    800052fc:	00813823          	sd	s0,16(sp)
    80005300:	00913423          	sd	s1,8(sp)
    80005304:	01213023          	sd	s2,0(sp)
    80005308:	02010413          	addi	s0,sp,32
    8000530c:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80005310:	02853503          	ld	a0,40(a0)
    80005314:	ffffc097          	auipc	ra,0xffffc
    80005318:	75c080e7          	jalr	1884(ra) # 80001a70 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    8000531c:	0304b503          	ld	a0,48(s1)
    80005320:	ffffc097          	auipc	ra,0xffffc
    80005324:	750080e7          	jalr	1872(ra) # 80001a70 <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80005328:	0144a783          	lw	a5,20(s1)
    8000532c:	0104a903          	lw	s2,16(s1)
    80005330:	0327ce63          	blt	a5,s2,8000536c <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80005334:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80005338:	0304b503          	ld	a0,48(s1)
    8000533c:	ffffc097          	auipc	ra,0xffffc
    80005340:	760080e7          	jalr	1888(ra) # 80001a9c <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80005344:	0284b503          	ld	a0,40(s1)
    80005348:	ffffc097          	auipc	ra,0xffffc
    8000534c:	754080e7          	jalr	1876(ra) # 80001a9c <_Z10sem_signalP4_sem>

    return ret;
}
    80005350:	00090513          	mv	a0,s2
    80005354:	01813083          	ld	ra,24(sp)
    80005358:	01013403          	ld	s0,16(sp)
    8000535c:	00813483          	ld	s1,8(sp)
    80005360:	00013903          	ld	s2,0(sp)
    80005364:	02010113          	addi	sp,sp,32
    80005368:	00008067          	ret
        ret = cap - head + tail;
    8000536c:	0004a703          	lw	a4,0(s1)
    80005370:	4127093b          	subw	s2,a4,s2
    80005374:	00f9093b          	addw	s2,s2,a5
    80005378:	fc1ff06f          	j	80005338 <_ZN6Buffer6getCntEv+0x44>

000000008000537c <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    8000537c:	fe010113          	addi	sp,sp,-32
    80005380:	00113c23          	sd	ra,24(sp)
    80005384:	00813823          	sd	s0,16(sp)
    80005388:	00913423          	sd	s1,8(sp)
    8000538c:	02010413          	addi	s0,sp,32
    80005390:	00050493          	mv	s1,a0
    putc('\n');
    80005394:	00a00513          	li	a0,10
    80005398:	ffffc097          	auipc	ra,0xffffc
    8000539c:	758080e7          	jalr	1880(ra) # 80001af0 <_Z4putcc>
    printString("Buffer deleted!\n");
    800053a0:	00006517          	auipc	a0,0x6
    800053a4:	11850513          	addi	a0,a0,280 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    800053a8:	00003097          	auipc	ra,0x3
    800053ac:	9a0080e7          	jalr	-1632(ra) # 80007d48 <_Z11printStringPKc>
    while (getCnt() > 0) {
    800053b0:	00048513          	mv	a0,s1
    800053b4:	00000097          	auipc	ra,0x0
    800053b8:	f40080e7          	jalr	-192(ra) # 800052f4 <_ZN6Buffer6getCntEv>
    800053bc:	02a05c63          	blez	a0,800053f4 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800053c0:	0084b783          	ld	a5,8(s1)
    800053c4:	0104a703          	lw	a4,16(s1)
    800053c8:	00271713          	slli	a4,a4,0x2
    800053cc:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800053d0:	0007c503          	lbu	a0,0(a5)
    800053d4:	ffffc097          	auipc	ra,0xffffc
    800053d8:	71c080e7          	jalr	1820(ra) # 80001af0 <_Z4putcc>
        head = (head + 1) % cap;
    800053dc:	0104a783          	lw	a5,16(s1)
    800053e0:	0017879b          	addiw	a5,a5,1
    800053e4:	0004a703          	lw	a4,0(s1)
    800053e8:	02e7e7bb          	remw	a5,a5,a4
    800053ec:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800053f0:	fc1ff06f          	j	800053b0 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800053f4:	02100513          	li	a0,33
    800053f8:	ffffc097          	auipc	ra,0xffffc
    800053fc:	6f8080e7          	jalr	1784(ra) # 80001af0 <_Z4putcc>
    putc('\n');
    80005400:	00a00513          	li	a0,10
    80005404:	ffffc097          	auipc	ra,0xffffc
    80005408:	6ec080e7          	jalr	1772(ra) # 80001af0 <_Z4putcc>
    mem_free(buffer);
    8000540c:	0084b503          	ld	a0,8(s1)
    80005410:	ffffc097          	auipc	ra,0xffffc
    80005414:	4c4080e7          	jalr	1220(ra) # 800018d4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80005418:	0204b503          	ld	a0,32(s1)
    8000541c:	ffffc097          	auipc	ra,0xffffc
    80005420:	628080e7          	jalr	1576(ra) # 80001a44 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80005424:	0184b503          	ld	a0,24(s1)
    80005428:	ffffc097          	auipc	ra,0xffffc
    8000542c:	61c080e7          	jalr	1564(ra) # 80001a44 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80005430:	0304b503          	ld	a0,48(s1)
    80005434:	ffffc097          	auipc	ra,0xffffc
    80005438:	610080e7          	jalr	1552(ra) # 80001a44 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    8000543c:	0284b503          	ld	a0,40(s1)
    80005440:	ffffc097          	auipc	ra,0xffffc
    80005444:	604080e7          	jalr	1540(ra) # 80001a44 <_Z9sem_closeP4_sem>
}
    80005448:	01813083          	ld	ra,24(sp)
    8000544c:	01013403          	ld	s0,16(sp)
    80005450:	00813483          	ld	s1,8(sp)
    80005454:	02010113          	addi	sp,sp,32
    80005458:	00008067          	ret

000000008000545c <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    8000545c:	fe010113          	addi	sp,sp,-32
    80005460:	00113c23          	sd	ra,24(sp)
    80005464:	00813823          	sd	s0,16(sp)
    80005468:	00913423          	sd	s1,8(sp)
    8000546c:	01213023          	sd	s2,0(sp)
    80005470:	02010413          	addi	s0,sp,32
    80005474:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005478:	00000913          	li	s2,0
    8000547c:	00c0006f          	j	80005488 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80005480:	ffffc097          	auipc	ra,0xffffc
    80005484:	51c080e7          	jalr	1308(ra) # 8000199c <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80005488:	ffffc097          	auipc	ra,0xffffc
    8000548c:	640080e7          	jalr	1600(ra) # 80001ac8 <_Z4getcv>
    80005490:	0005059b          	sext.w	a1,a0
    80005494:	01b00793          	li	a5,27
    80005498:	02f58a63          	beq	a1,a5,800054cc <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    8000549c:	0084b503          	ld	a0,8(s1)
    800054a0:	00000097          	auipc	ra,0x0
    800054a4:	d38080e7          	jalr	-712(ra) # 800051d8 <_ZN6Buffer3putEi>
        i++;
    800054a8:	0019071b          	addiw	a4,s2,1
    800054ac:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800054b0:	0004a683          	lw	a3,0(s1)
    800054b4:	0026979b          	slliw	a5,a3,0x2
    800054b8:	00d787bb          	addw	a5,a5,a3
    800054bc:	0017979b          	slliw	a5,a5,0x1
    800054c0:	02f767bb          	remw	a5,a4,a5
    800054c4:	fc0792e3          	bnez	a5,80005488 <_ZL16producerKeyboardPv+0x2c>
    800054c8:	fb9ff06f          	j	80005480 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800054cc:	00100793          	li	a5,1
    800054d0:	00009717          	auipc	a4,0x9
    800054d4:	ccf72c23          	sw	a5,-808(a4) # 8000e1a8 <_ZL9threadEnd>
    data->buffer->put('!');
    800054d8:	02100593          	li	a1,33
    800054dc:	0084b503          	ld	a0,8(s1)
    800054e0:	00000097          	auipc	ra,0x0
    800054e4:	cf8080e7          	jalr	-776(ra) # 800051d8 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800054e8:	0104b503          	ld	a0,16(s1)
    800054ec:	ffffc097          	auipc	ra,0xffffc
    800054f0:	5b0080e7          	jalr	1456(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    800054f4:	01813083          	ld	ra,24(sp)
    800054f8:	01013403          	ld	s0,16(sp)
    800054fc:	00813483          	ld	s1,8(sp)
    80005500:	00013903          	ld	s2,0(sp)
    80005504:	02010113          	addi	sp,sp,32
    80005508:	00008067          	ret

000000008000550c <_ZL8producerPv>:

static void producer(void *arg) {
    8000550c:	fe010113          	addi	sp,sp,-32
    80005510:	00113c23          	sd	ra,24(sp)
    80005514:	00813823          	sd	s0,16(sp)
    80005518:	00913423          	sd	s1,8(sp)
    8000551c:	01213023          	sd	s2,0(sp)
    80005520:	02010413          	addi	s0,sp,32
    80005524:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005528:	00000913          	li	s2,0
    8000552c:	00c0006f          	j	80005538 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80005530:	ffffc097          	auipc	ra,0xffffc
    80005534:	46c080e7          	jalr	1132(ra) # 8000199c <_Z15thread_dispatchv>
    while (!threadEnd) {
    80005538:	00009797          	auipc	a5,0x9
    8000553c:	c707a783          	lw	a5,-912(a5) # 8000e1a8 <_ZL9threadEnd>
    80005540:	02079e63          	bnez	a5,8000557c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80005544:	0004a583          	lw	a1,0(s1)
    80005548:	0305859b          	addiw	a1,a1,48
    8000554c:	0084b503          	ld	a0,8(s1)
    80005550:	00000097          	auipc	ra,0x0
    80005554:	c88080e7          	jalr	-888(ra) # 800051d8 <_ZN6Buffer3putEi>
        i++;
    80005558:	0019071b          	addiw	a4,s2,1
    8000555c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005560:	0004a683          	lw	a3,0(s1)
    80005564:	0026979b          	slliw	a5,a3,0x2
    80005568:	00d787bb          	addw	a5,a5,a3
    8000556c:	0017979b          	slliw	a5,a5,0x1
    80005570:	02f767bb          	remw	a5,a4,a5
    80005574:	fc0792e3          	bnez	a5,80005538 <_ZL8producerPv+0x2c>
    80005578:	fb9ff06f          	j	80005530 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    8000557c:	0104b503          	ld	a0,16(s1)
    80005580:	ffffc097          	auipc	ra,0xffffc
    80005584:	51c080e7          	jalr	1308(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    80005588:	01813083          	ld	ra,24(sp)
    8000558c:	01013403          	ld	s0,16(sp)
    80005590:	00813483          	ld	s1,8(sp)
    80005594:	00013903          	ld	s2,0(sp)
    80005598:	02010113          	addi	sp,sp,32
    8000559c:	00008067          	ret

00000000800055a0 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800055a0:	fd010113          	addi	sp,sp,-48
    800055a4:	02113423          	sd	ra,40(sp)
    800055a8:	02813023          	sd	s0,32(sp)
    800055ac:	00913c23          	sd	s1,24(sp)
    800055b0:	01213823          	sd	s2,16(sp)
    800055b4:	01313423          	sd	s3,8(sp)
    800055b8:	03010413          	addi	s0,sp,48
    800055bc:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800055c0:	00000993          	li	s3,0
    800055c4:	01c0006f          	j	800055e0 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800055c8:	ffffc097          	auipc	ra,0xffffc
    800055cc:	3d4080e7          	jalr	980(ra) # 8000199c <_Z15thread_dispatchv>
    800055d0:	0500006f          	j	80005620 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800055d4:	00a00513          	li	a0,10
    800055d8:	ffffc097          	auipc	ra,0xffffc
    800055dc:	518080e7          	jalr	1304(ra) # 80001af0 <_Z4putcc>
    while (!threadEnd) {
    800055e0:	00009797          	auipc	a5,0x9
    800055e4:	bc87a783          	lw	a5,-1080(a5) # 8000e1a8 <_ZL9threadEnd>
    800055e8:	06079063          	bnez	a5,80005648 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800055ec:	00893503          	ld	a0,8(s2)
    800055f0:	00000097          	auipc	ra,0x0
    800055f4:	c78080e7          	jalr	-904(ra) # 80005268 <_ZN6Buffer3getEv>
        i++;
    800055f8:	0019849b          	addiw	s1,s3,1
    800055fc:	0004899b          	sext.w	s3,s1
        putc(key);
    80005600:	0ff57513          	andi	a0,a0,255
    80005604:	ffffc097          	auipc	ra,0xffffc
    80005608:	4ec080e7          	jalr	1260(ra) # 80001af0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    8000560c:	00092703          	lw	a4,0(s2)
    80005610:	0027179b          	slliw	a5,a4,0x2
    80005614:	00e787bb          	addw	a5,a5,a4
    80005618:	02f4e7bb          	remw	a5,s1,a5
    8000561c:	fa0786e3          	beqz	a5,800055c8 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80005620:	05000793          	li	a5,80
    80005624:	02f4e4bb          	remw	s1,s1,a5
    80005628:	fa049ce3          	bnez	s1,800055e0 <_ZL8consumerPv+0x40>
    8000562c:	fa9ff06f          	j	800055d4 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80005630:	00893503          	ld	a0,8(s2)
    80005634:	00000097          	auipc	ra,0x0
    80005638:	c34080e7          	jalr	-972(ra) # 80005268 <_ZN6Buffer3getEv>
        putc(key);
    8000563c:	0ff57513          	andi	a0,a0,255
    80005640:	ffffc097          	auipc	ra,0xffffc
    80005644:	4b0080e7          	jalr	1200(ra) # 80001af0 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80005648:	00893503          	ld	a0,8(s2)
    8000564c:	00000097          	auipc	ra,0x0
    80005650:	ca8080e7          	jalr	-856(ra) # 800052f4 <_ZN6Buffer6getCntEv>
    80005654:	fca04ee3          	bgtz	a0,80005630 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80005658:	01093503          	ld	a0,16(s2)
    8000565c:	ffffc097          	auipc	ra,0xffffc
    80005660:	440080e7          	jalr	1088(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    80005664:	02813083          	ld	ra,40(sp)
    80005668:	02013403          	ld	s0,32(sp)
    8000566c:	01813483          	ld	s1,24(sp)
    80005670:	01013903          	ld	s2,16(sp)
    80005674:	00813983          	ld	s3,8(sp)
    80005678:	03010113          	addi	sp,sp,48
    8000567c:	00008067          	ret

0000000080005680 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80005680:	f9010113          	addi	sp,sp,-112
    80005684:	06113423          	sd	ra,104(sp)
    80005688:	06813023          	sd	s0,96(sp)
    8000568c:	04913c23          	sd	s1,88(sp)
    80005690:	05213823          	sd	s2,80(sp)
    80005694:	05313423          	sd	s3,72(sp)
    80005698:	05413023          	sd	s4,64(sp)
    8000569c:	03513c23          	sd	s5,56(sp)
    800056a0:	03613823          	sd	s6,48(sp)
    800056a4:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800056a8:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800056ac:	00006517          	auipc	a0,0x6
    800056b0:	e2450513          	addi	a0,a0,-476 # 8000b4d0 <CONSOLE_STATUS+0x4c0>
    800056b4:	00002097          	auipc	ra,0x2
    800056b8:	694080e7          	jalr	1684(ra) # 80007d48 <_Z11printStringPKc>
    getString(input, 30);
    800056bc:	01e00593          	li	a1,30
    800056c0:	fa040493          	addi	s1,s0,-96
    800056c4:	00048513          	mv	a0,s1
    800056c8:	00002097          	auipc	ra,0x2
    800056cc:	708080e7          	jalr	1800(ra) # 80007dd0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800056d0:	00048513          	mv	a0,s1
    800056d4:	00002097          	auipc	ra,0x2
    800056d8:	7d4080e7          	jalr	2004(ra) # 80007ea8 <_Z11stringToIntPKc>
    800056dc:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800056e0:	00006517          	auipc	a0,0x6
    800056e4:	e1050513          	addi	a0,a0,-496 # 8000b4f0 <CONSOLE_STATUS+0x4e0>
    800056e8:	00002097          	auipc	ra,0x2
    800056ec:	660080e7          	jalr	1632(ra) # 80007d48 <_Z11printStringPKc>
    getString(input, 30);
    800056f0:	01e00593          	li	a1,30
    800056f4:	00048513          	mv	a0,s1
    800056f8:	00002097          	auipc	ra,0x2
    800056fc:	6d8080e7          	jalr	1752(ra) # 80007dd0 <_Z9getStringPci>
    n = stringToInt(input);
    80005700:	00048513          	mv	a0,s1
    80005704:	00002097          	auipc	ra,0x2
    80005708:	7a4080e7          	jalr	1956(ra) # 80007ea8 <_Z11stringToIntPKc>
    8000570c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005710:	00006517          	auipc	a0,0x6
    80005714:	e0050513          	addi	a0,a0,-512 # 8000b510 <CONSOLE_STATUS+0x500>
    80005718:	00002097          	auipc	ra,0x2
    8000571c:	630080e7          	jalr	1584(ra) # 80007d48 <_Z11printStringPKc>
    80005720:	00000613          	li	a2,0
    80005724:	00a00593          	li	a1,10
    80005728:	00090513          	mv	a0,s2
    8000572c:	00002097          	auipc	ra,0x2
    80005730:	7cc080e7          	jalr	1996(ra) # 80007ef8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005734:	00006517          	auipc	a0,0x6
    80005738:	df450513          	addi	a0,a0,-524 # 8000b528 <CONSOLE_STATUS+0x518>
    8000573c:	00002097          	auipc	ra,0x2
    80005740:	60c080e7          	jalr	1548(ra) # 80007d48 <_Z11printStringPKc>
    80005744:	00000613          	li	a2,0
    80005748:	00a00593          	li	a1,10
    8000574c:	00048513          	mv	a0,s1
    80005750:	00002097          	auipc	ra,0x2
    80005754:	7a8080e7          	jalr	1960(ra) # 80007ef8 <_Z8printIntiii>
    printString(".\n");
    80005758:	00006517          	auipc	a0,0x6
    8000575c:	de850513          	addi	a0,a0,-536 # 8000b540 <CONSOLE_STATUS+0x530>
    80005760:	00002097          	auipc	ra,0x2
    80005764:	5e8080e7          	jalr	1512(ra) # 80007d48 <_Z11printStringPKc>
    if(threadNum > n) {
    80005768:	0324c463          	blt	s1,s2,80005790 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    8000576c:	03205c63          	blez	s2,800057a4 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80005770:	03800513          	li	a0,56
    80005774:	ffffc097          	auipc	ra,0xffffc
    80005778:	a48080e7          	jalr	-1464(ra) # 800011bc <_Znwm>
    8000577c:	00050a13          	mv	s4,a0
    80005780:	00048593          	mv	a1,s1
    80005784:	00000097          	auipc	ra,0x0
    80005788:	9b8080e7          	jalr	-1608(ra) # 8000513c <_ZN6BufferC1Ei>
    8000578c:	0300006f          	j	800057bc <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005790:	00006517          	auipc	a0,0x6
    80005794:	db850513          	addi	a0,a0,-584 # 8000b548 <CONSOLE_STATUS+0x538>
    80005798:	00002097          	auipc	ra,0x2
    8000579c:	5b0080e7          	jalr	1456(ra) # 80007d48 <_Z11printStringPKc>
        return;
    800057a0:	0140006f          	j	800057b4 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800057a4:	00006517          	auipc	a0,0x6
    800057a8:	de450513          	addi	a0,a0,-540 # 8000b588 <CONSOLE_STATUS+0x578>
    800057ac:	00002097          	auipc	ra,0x2
    800057b0:	59c080e7          	jalr	1436(ra) # 80007d48 <_Z11printStringPKc>
        return;
    800057b4:	000b0113          	mv	sp,s6
    800057b8:	1500006f          	j	80005908 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800057bc:	00000593          	li	a1,0
    800057c0:	00009517          	auipc	a0,0x9
    800057c4:	9f050513          	addi	a0,a0,-1552 # 8000e1b0 <_ZL10waitForAll>
    800057c8:	ffffc097          	auipc	ra,0xffffc
    800057cc:	244080e7          	jalr	580(ra) # 80001a0c <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    800057d0:	00391793          	slli	a5,s2,0x3
    800057d4:	00f78793          	addi	a5,a5,15
    800057d8:	ff07f793          	andi	a5,a5,-16
    800057dc:	40f10133          	sub	sp,sp,a5
    800057e0:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800057e4:	0019071b          	addiw	a4,s2,1
    800057e8:	00171793          	slli	a5,a4,0x1
    800057ec:	00e787b3          	add	a5,a5,a4
    800057f0:	00379793          	slli	a5,a5,0x3
    800057f4:	00f78793          	addi	a5,a5,15
    800057f8:	ff07f793          	andi	a5,a5,-16
    800057fc:	40f10133          	sub	sp,sp,a5
    80005800:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80005804:	00191613          	slli	a2,s2,0x1
    80005808:	012607b3          	add	a5,a2,s2
    8000580c:	00379793          	slli	a5,a5,0x3
    80005810:	00f987b3          	add	a5,s3,a5
    80005814:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005818:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    8000581c:	00009717          	auipc	a4,0x9
    80005820:	99473703          	ld	a4,-1644(a4) # 8000e1b0 <_ZL10waitForAll>
    80005824:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80005828:	00078613          	mv	a2,a5
    8000582c:	00000597          	auipc	a1,0x0
    80005830:	d7458593          	addi	a1,a1,-652 # 800055a0 <_ZL8consumerPv>
    80005834:	f9840513          	addi	a0,s0,-104
    80005838:	ffffc097          	auipc	ra,0xffffc
    8000583c:	0c8080e7          	jalr	200(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80005840:	00000493          	li	s1,0
    80005844:	0280006f          	j	8000586c <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80005848:	00000597          	auipc	a1,0x0
    8000584c:	c1458593          	addi	a1,a1,-1004 # 8000545c <_ZL16producerKeyboardPv>
                      data + i);
    80005850:	00179613          	slli	a2,a5,0x1
    80005854:	00f60633          	add	a2,a2,a5
    80005858:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    8000585c:	00c98633          	add	a2,s3,a2
    80005860:	ffffc097          	auipc	ra,0xffffc
    80005864:	0a0080e7          	jalr	160(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80005868:	0014849b          	addiw	s1,s1,1
    8000586c:	0524d263          	bge	s1,s2,800058b0 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80005870:	00149793          	slli	a5,s1,0x1
    80005874:	009787b3          	add	a5,a5,s1
    80005878:	00379793          	slli	a5,a5,0x3
    8000587c:	00f987b3          	add	a5,s3,a5
    80005880:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005884:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80005888:	00009717          	auipc	a4,0x9
    8000588c:	92873703          	ld	a4,-1752(a4) # 8000e1b0 <_ZL10waitForAll>
    80005890:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80005894:	00048793          	mv	a5,s1
    80005898:	00349513          	slli	a0,s1,0x3
    8000589c:	00aa8533          	add	a0,s5,a0
    800058a0:	fa9054e3          	blez	s1,80005848 <_Z22producerConsumer_C_APIv+0x1c8>
    800058a4:	00000597          	auipc	a1,0x0
    800058a8:	c6858593          	addi	a1,a1,-920 # 8000550c <_ZL8producerPv>
    800058ac:	fa5ff06f          	j	80005850 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800058b0:	ffffc097          	auipc	ra,0xffffc
    800058b4:	0ec080e7          	jalr	236(ra) # 8000199c <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800058b8:	00000493          	li	s1,0
    800058bc:	00994e63          	blt	s2,s1,800058d8 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800058c0:	00009517          	auipc	a0,0x9
    800058c4:	8f053503          	ld	a0,-1808(a0) # 8000e1b0 <_ZL10waitForAll>
    800058c8:	ffffc097          	auipc	ra,0xffffc
    800058cc:	1a8080e7          	jalr	424(ra) # 80001a70 <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    800058d0:	0014849b          	addiw	s1,s1,1
    800058d4:	fe9ff06f          	j	800058bc <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800058d8:	00009517          	auipc	a0,0x9
    800058dc:	8d853503          	ld	a0,-1832(a0) # 8000e1b0 <_ZL10waitForAll>
    800058e0:	ffffc097          	auipc	ra,0xffffc
    800058e4:	164080e7          	jalr	356(ra) # 80001a44 <_Z9sem_closeP4_sem>
    delete buffer;
    800058e8:	000a0e63          	beqz	s4,80005904 <_Z22producerConsumer_C_APIv+0x284>
    800058ec:	000a0513          	mv	a0,s4
    800058f0:	00000097          	auipc	ra,0x0
    800058f4:	a8c080e7          	jalr	-1396(ra) # 8000537c <_ZN6BufferD1Ev>
    800058f8:	000a0513          	mv	a0,s4
    800058fc:	ffffc097          	auipc	ra,0xffffc
    80005900:	8e8080e7          	jalr	-1816(ra) # 800011e4 <_ZdlPv>
    80005904:	000b0113          	mv	sp,s6
}
    80005908:	f9040113          	addi	sp,s0,-112
    8000590c:	06813083          	ld	ra,104(sp)
    80005910:	06013403          	ld	s0,96(sp)
    80005914:	05813483          	ld	s1,88(sp)
    80005918:	05013903          	ld	s2,80(sp)
    8000591c:	04813983          	ld	s3,72(sp)
    80005920:	04013a03          	ld	s4,64(sp)
    80005924:	03813a83          	ld	s5,56(sp)
    80005928:	03013b03          	ld	s6,48(sp)
    8000592c:	07010113          	addi	sp,sp,112
    80005930:	00008067          	ret
    80005934:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80005938:	000a0513          	mv	a0,s4
    8000593c:	ffffc097          	auipc	ra,0xffffc
    80005940:	8a8080e7          	jalr	-1880(ra) # 800011e4 <_ZdlPv>
    80005944:	00048513          	mv	a0,s1
    80005948:	0000a097          	auipc	ra,0xa
    8000594c:	970080e7          	jalr	-1680(ra) # 8000f2b8 <_Unwind_Resume>

0000000080005950 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80005950:	f8010113          	addi	sp,sp,-128
    80005954:	06113c23          	sd	ra,120(sp)
    80005958:	06813823          	sd	s0,112(sp)
    8000595c:	06913423          	sd	s1,104(sp)
    80005960:	07213023          	sd	s2,96(sp)
    80005964:	05313c23          	sd	s3,88(sp)
    80005968:	05413823          	sd	s4,80(sp)
    8000596c:	05513423          	sd	s5,72(sp)
    80005970:	05613023          	sd	s6,64(sp)
    80005974:	03713c23          	sd	s7,56(sp)
    80005978:	03813823          	sd	s8,48(sp)
    8000597c:	03913423          	sd	s9,40(sp)
    80005980:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80005984:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80005988:	00006517          	auipc	a0,0x6
    8000598c:	b4850513          	addi	a0,a0,-1208 # 8000b4d0 <CONSOLE_STATUS+0x4c0>
    80005990:	00002097          	auipc	ra,0x2
    80005994:	3b8080e7          	jalr	952(ra) # 80007d48 <_Z11printStringPKc>
    getString(input, 30);
    80005998:	01e00593          	li	a1,30
    8000599c:	f8040493          	addi	s1,s0,-128
    800059a0:	00048513          	mv	a0,s1
    800059a4:	00002097          	auipc	ra,0x2
    800059a8:	42c080e7          	jalr	1068(ra) # 80007dd0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800059ac:	00048513          	mv	a0,s1
    800059b0:	00002097          	auipc	ra,0x2
    800059b4:	4f8080e7          	jalr	1272(ra) # 80007ea8 <_Z11stringToIntPKc>
    800059b8:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    800059bc:	00006517          	auipc	a0,0x6
    800059c0:	b3450513          	addi	a0,a0,-1228 # 8000b4f0 <CONSOLE_STATUS+0x4e0>
    800059c4:	00002097          	auipc	ra,0x2
    800059c8:	384080e7          	jalr	900(ra) # 80007d48 <_Z11printStringPKc>
    getString(input, 30);
    800059cc:	01e00593          	li	a1,30
    800059d0:	00048513          	mv	a0,s1
    800059d4:	00002097          	auipc	ra,0x2
    800059d8:	3fc080e7          	jalr	1020(ra) # 80007dd0 <_Z9getStringPci>
    n = stringToInt(input);
    800059dc:	00048513          	mv	a0,s1
    800059e0:	00002097          	auipc	ra,0x2
    800059e4:	4c8080e7          	jalr	1224(ra) # 80007ea8 <_Z11stringToIntPKc>
    800059e8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800059ec:	00006517          	auipc	a0,0x6
    800059f0:	b2450513          	addi	a0,a0,-1244 # 8000b510 <CONSOLE_STATUS+0x500>
    800059f4:	00002097          	auipc	ra,0x2
    800059f8:	354080e7          	jalr	852(ra) # 80007d48 <_Z11printStringPKc>
    printInt(threadNum);
    800059fc:	00000613          	li	a2,0
    80005a00:	00a00593          	li	a1,10
    80005a04:	00098513          	mv	a0,s3
    80005a08:	00002097          	auipc	ra,0x2
    80005a0c:	4f0080e7          	jalr	1264(ra) # 80007ef8 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80005a10:	00006517          	auipc	a0,0x6
    80005a14:	b1850513          	addi	a0,a0,-1256 # 8000b528 <CONSOLE_STATUS+0x518>
    80005a18:	00002097          	auipc	ra,0x2
    80005a1c:	330080e7          	jalr	816(ra) # 80007d48 <_Z11printStringPKc>
    printInt(n);
    80005a20:	00000613          	li	a2,0
    80005a24:	00a00593          	li	a1,10
    80005a28:	00048513          	mv	a0,s1
    80005a2c:	00002097          	auipc	ra,0x2
    80005a30:	4cc080e7          	jalr	1228(ra) # 80007ef8 <_Z8printIntiii>
    printString(".\n");
    80005a34:	00006517          	auipc	a0,0x6
    80005a38:	b0c50513          	addi	a0,a0,-1268 # 8000b540 <CONSOLE_STATUS+0x530>
    80005a3c:	00002097          	auipc	ra,0x2
    80005a40:	30c080e7          	jalr	780(ra) # 80007d48 <_Z11printStringPKc>
    if (threadNum > n) {
    80005a44:	0334c463          	blt	s1,s3,80005a6c <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80005a48:	03305c63          	blez	s3,80005a80 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005a4c:	03800513          	li	a0,56
    80005a50:	ffffb097          	auipc	ra,0xffffb
    80005a54:	76c080e7          	jalr	1900(ra) # 800011bc <_Znwm>
    80005a58:	00050a93          	mv	s5,a0
    80005a5c:	00048593          	mv	a1,s1
    80005a60:	00001097          	auipc	ra,0x1
    80005a64:	3cc080e7          	jalr	972(ra) # 80006e2c <_ZN9BufferCPPC1Ei>
    80005a68:	0300006f          	j	80005a98 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005a6c:	00006517          	auipc	a0,0x6
    80005a70:	adc50513          	addi	a0,a0,-1316 # 8000b548 <CONSOLE_STATUS+0x538>
    80005a74:	00002097          	auipc	ra,0x2
    80005a78:	2d4080e7          	jalr	724(ra) # 80007d48 <_Z11printStringPKc>
        return;
    80005a7c:	0140006f          	j	80005a90 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005a80:	00006517          	auipc	a0,0x6
    80005a84:	b0850513          	addi	a0,a0,-1272 # 8000b588 <CONSOLE_STATUS+0x578>
    80005a88:	00002097          	auipc	ra,0x2
    80005a8c:	2c0080e7          	jalr	704(ra) # 80007d48 <_Z11printStringPKc>
        return;
    80005a90:	000c0113          	mv	sp,s8
    80005a94:	2440006f          	j	80005cd8 <_Z20testConsumerProducerv+0x388>
    waitForAll = new Semaphore(0);
    80005a98:	01000513          	li	a0,16
    80005a9c:	ffffb097          	auipc	ra,0xffffb
    80005aa0:	720080e7          	jalr	1824(ra) # 800011bc <_Znwm>
    80005aa4:	00050913          	mv	s2,a0
    80005aa8:	00000593          	li	a1,0
    80005aac:	ffffc097          	auipc	ra,0xffffc
    80005ab0:	928080e7          	jalr	-1752(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80005ab4:	00008797          	auipc	a5,0x8
    80005ab8:	7127b623          	sd	s2,1804(a5) # 8000e1c0 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80005abc:	00399793          	slli	a5,s3,0x3
    80005ac0:	00f78793          	addi	a5,a5,15
    80005ac4:	ff07f793          	andi	a5,a5,-16
    80005ac8:	40f10133          	sub	sp,sp,a5
    80005acc:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80005ad0:	0019871b          	addiw	a4,s3,1
    80005ad4:	00171793          	slli	a5,a4,0x1
    80005ad8:	00e787b3          	add	a5,a5,a4
    80005adc:	00379793          	slli	a5,a5,0x3
    80005ae0:	00f78793          	addi	a5,a5,15
    80005ae4:	ff07f793          	andi	a5,a5,-16
    80005ae8:	40f10133          	sub	sp,sp,a5
    80005aec:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80005af0:	00199493          	slli	s1,s3,0x1
    80005af4:	013484b3          	add	s1,s1,s3
    80005af8:	00349493          	slli	s1,s1,0x3
    80005afc:	009b04b3          	add	s1,s6,s1
    80005b00:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80005b04:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80005b08:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005b0c:	02800513          	li	a0,40
    80005b10:	ffffb097          	auipc	ra,0xffffb
    80005b14:	6ac080e7          	jalr	1708(ra) # 800011bc <_Znwm>
    80005b18:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80005b1c:	ffffc097          	auipc	ra,0xffffc
    80005b20:	884080e7          	jalr	-1916(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80005b24:	00008797          	auipc	a5,0x8
    80005b28:	45c78793          	addi	a5,a5,1116 # 8000df80 <_ZTV8Consumer+0x10>
    80005b2c:	00fbb023          	sd	a5,0(s7)
    80005b30:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80005b34:	000b8513          	mv	a0,s7
    80005b38:	ffffb097          	auipc	ra,0xffffb
    80005b3c:	780080e7          	jalr	1920(ra) # 800012b8 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80005b40:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80005b44:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80005b48:	00008797          	auipc	a5,0x8
    80005b4c:	6787b783          	ld	a5,1656(a5) # 8000e1c0 <_ZL10waitForAll>
    80005b50:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005b54:	02800513          	li	a0,40
    80005b58:	ffffb097          	auipc	ra,0xffffb
    80005b5c:	664080e7          	jalr	1636(ra) # 800011bc <_Znwm>
    80005b60:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80005b64:	ffffc097          	auipc	ra,0xffffc
    80005b68:	83c080e7          	jalr	-1988(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80005b6c:	00008797          	auipc	a5,0x8
    80005b70:	3c478793          	addi	a5,a5,964 # 8000df30 <_ZTV16ProducerKeyborad+0x10>
    80005b74:	00f4b023          	sd	a5,0(s1)
    80005b78:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005b7c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80005b80:	00048513          	mv	a0,s1
    80005b84:	ffffb097          	auipc	ra,0xffffb
    80005b88:	734080e7          	jalr	1844(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80005b8c:	00100913          	li	s2,1
    80005b90:	0300006f          	j	80005bc0 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80005b94:	00008797          	auipc	a5,0x8
    80005b98:	3c478793          	addi	a5,a5,964 # 8000df58 <_ZTV8Producer+0x10>
    80005b9c:	00fcb023          	sd	a5,0(s9)
    80005ba0:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80005ba4:	00391793          	slli	a5,s2,0x3
    80005ba8:	00fa07b3          	add	a5,s4,a5
    80005bac:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80005bb0:	000c8513          	mv	a0,s9
    80005bb4:	ffffb097          	auipc	ra,0xffffb
    80005bb8:	704080e7          	jalr	1796(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80005bbc:	0019091b          	addiw	s2,s2,1
    80005bc0:	05395263          	bge	s2,s3,80005c04 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80005bc4:	00191493          	slli	s1,s2,0x1
    80005bc8:	012484b3          	add	s1,s1,s2
    80005bcc:	00349493          	slli	s1,s1,0x3
    80005bd0:	009b04b3          	add	s1,s6,s1
    80005bd4:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80005bd8:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80005bdc:	00008797          	auipc	a5,0x8
    80005be0:	5e47b783          	ld	a5,1508(a5) # 8000e1c0 <_ZL10waitForAll>
    80005be4:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80005be8:	02800513          	li	a0,40
    80005bec:	ffffb097          	auipc	ra,0xffffb
    80005bf0:	5d0080e7          	jalr	1488(ra) # 800011bc <_Znwm>
    80005bf4:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80005bf8:	ffffb097          	auipc	ra,0xffffb
    80005bfc:	7a8080e7          	jalr	1960(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80005c00:	f95ff06f          	j	80005b94 <_Z20testConsumerProducerv+0x244>
    putc('.');
    80005c04:	02e00513          	li	a0,46
    80005c08:	ffffc097          	auipc	ra,0xffffc
    80005c0c:	ee8080e7          	jalr	-280(ra) # 80001af0 <_Z4putcc>
    Thread::dispatch();
    80005c10:	ffffb097          	auipc	ra,0xffffb
    80005c14:	708080e7          	jalr	1800(ra) # 80001318 <_ZN6Thread8dispatchEv>
    putc('.');
    80005c18:	02e00513          	li	a0,46
    80005c1c:	ffffc097          	auipc	ra,0xffffc
    80005c20:	ed4080e7          	jalr	-300(ra) # 80001af0 <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    80005c24:	00000493          	li	s1,0
    80005c28:	0299c463          	blt	s3,s1,80005c50 <_Z20testConsumerProducerv+0x300>
        waitForAll->wait();
    80005c2c:	00008517          	auipc	a0,0x8
    80005c30:	59453503          	ld	a0,1428(a0) # 8000e1c0 <_ZL10waitForAll>
    80005c34:	ffffb097          	auipc	ra,0xffffb
    80005c38:	7d8080e7          	jalr	2008(ra) # 8000140c <_ZN9Semaphore4waitEv>
        putc('x');
    80005c3c:	07800513          	li	a0,120
    80005c40:	ffffc097          	auipc	ra,0xffffc
    80005c44:	eb0080e7          	jalr	-336(ra) # 80001af0 <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    80005c48:	0014849b          	addiw	s1,s1,1
    80005c4c:	fddff06f          	j	80005c28 <_Z20testConsumerProducerv+0x2d8>
    putc('.');
    80005c50:	02e00513          	li	a0,46
    80005c54:	ffffc097          	auipc	ra,0xffffc
    80005c58:	e9c080e7          	jalr	-356(ra) # 80001af0 <_Z4putcc>
    delete waitForAll;
    80005c5c:	00008517          	auipc	a0,0x8
    80005c60:	56453503          	ld	a0,1380(a0) # 8000e1c0 <_ZL10waitForAll>
    80005c64:	00050863          	beqz	a0,80005c74 <_Z20testConsumerProducerv+0x324>
    80005c68:	00053783          	ld	a5,0(a0)
    80005c6c:	0087b783          	ld	a5,8(a5)
    80005c70:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80005c74:	00000493          	li	s1,0
    80005c78:	0080006f          	j	80005c80 <_Z20testConsumerProducerv+0x330>
    for (int i = 0; i < threadNum; i++) {
    80005c7c:	0014849b          	addiw	s1,s1,1
    80005c80:	0334d263          	bge	s1,s3,80005ca4 <_Z20testConsumerProducerv+0x354>
        delete producers[i];
    80005c84:	00349793          	slli	a5,s1,0x3
    80005c88:	00fa07b3          	add	a5,s4,a5
    80005c8c:	0007b503          	ld	a0,0(a5)
    80005c90:	fe0506e3          	beqz	a0,80005c7c <_Z20testConsumerProducerv+0x32c>
    80005c94:	00053783          	ld	a5,0(a0)
    80005c98:	0087b783          	ld	a5,8(a5)
    80005c9c:	000780e7          	jalr	a5
    80005ca0:	fddff06f          	j	80005c7c <_Z20testConsumerProducerv+0x32c>
    delete consumer;
    80005ca4:	000b8a63          	beqz	s7,80005cb8 <_Z20testConsumerProducerv+0x368>
    80005ca8:	000bb783          	ld	a5,0(s7)
    80005cac:	0087b783          	ld	a5,8(a5)
    80005cb0:	000b8513          	mv	a0,s7
    80005cb4:	000780e7          	jalr	a5
    delete buffer;
    80005cb8:	000a8e63          	beqz	s5,80005cd4 <_Z20testConsumerProducerv+0x384>
    80005cbc:	000a8513          	mv	a0,s5
    80005cc0:	00001097          	auipc	ra,0x1
    80005cc4:	464080e7          	jalr	1124(ra) # 80007124 <_ZN9BufferCPPD1Ev>
    80005cc8:	000a8513          	mv	a0,s5
    80005ccc:	ffffb097          	auipc	ra,0xffffb
    80005cd0:	518080e7          	jalr	1304(ra) # 800011e4 <_ZdlPv>
    80005cd4:	000c0113          	mv	sp,s8
}
    80005cd8:	f8040113          	addi	sp,s0,-128
    80005cdc:	07813083          	ld	ra,120(sp)
    80005ce0:	07013403          	ld	s0,112(sp)
    80005ce4:	06813483          	ld	s1,104(sp)
    80005ce8:	06013903          	ld	s2,96(sp)
    80005cec:	05813983          	ld	s3,88(sp)
    80005cf0:	05013a03          	ld	s4,80(sp)
    80005cf4:	04813a83          	ld	s5,72(sp)
    80005cf8:	04013b03          	ld	s6,64(sp)
    80005cfc:	03813b83          	ld	s7,56(sp)
    80005d00:	03013c03          	ld	s8,48(sp)
    80005d04:	02813c83          	ld	s9,40(sp)
    80005d08:	08010113          	addi	sp,sp,128
    80005d0c:	00008067          	ret
    80005d10:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005d14:	000a8513          	mv	a0,s5
    80005d18:	ffffb097          	auipc	ra,0xffffb
    80005d1c:	4cc080e7          	jalr	1228(ra) # 800011e4 <_ZdlPv>
    80005d20:	00048513          	mv	a0,s1
    80005d24:	00009097          	auipc	ra,0x9
    80005d28:	594080e7          	jalr	1428(ra) # 8000f2b8 <_Unwind_Resume>
    80005d2c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80005d30:	00090513          	mv	a0,s2
    80005d34:	ffffb097          	auipc	ra,0xffffb
    80005d38:	4b0080e7          	jalr	1200(ra) # 800011e4 <_ZdlPv>
    80005d3c:	00048513          	mv	a0,s1
    80005d40:	00009097          	auipc	ra,0x9
    80005d44:	578080e7          	jalr	1400(ra) # 8000f2b8 <_Unwind_Resume>
    80005d48:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005d4c:	000b8513          	mv	a0,s7
    80005d50:	ffffb097          	auipc	ra,0xffffb
    80005d54:	494080e7          	jalr	1172(ra) # 800011e4 <_ZdlPv>
    80005d58:	00048513          	mv	a0,s1
    80005d5c:	00009097          	auipc	ra,0x9
    80005d60:	55c080e7          	jalr	1372(ra) # 8000f2b8 <_Unwind_Resume>
    80005d64:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005d68:	00048513          	mv	a0,s1
    80005d6c:	ffffb097          	auipc	ra,0xffffb
    80005d70:	478080e7          	jalr	1144(ra) # 800011e4 <_ZdlPv>
    80005d74:	00090513          	mv	a0,s2
    80005d78:	00009097          	auipc	ra,0x9
    80005d7c:	540080e7          	jalr	1344(ra) # 8000f2b8 <_Unwind_Resume>
    80005d80:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80005d84:	000c8513          	mv	a0,s9
    80005d88:	ffffb097          	auipc	ra,0xffffb
    80005d8c:	45c080e7          	jalr	1116(ra) # 800011e4 <_ZdlPv>
    80005d90:	00048513          	mv	a0,s1
    80005d94:	00009097          	auipc	ra,0x9
    80005d98:	524080e7          	jalr	1316(ra) # 8000f2b8 <_Unwind_Resume>

0000000080005d9c <_ZN8Consumer3runEv>:
    void run() override {
    80005d9c:	fd010113          	addi	sp,sp,-48
    80005da0:	02113423          	sd	ra,40(sp)
    80005da4:	02813023          	sd	s0,32(sp)
    80005da8:	00913c23          	sd	s1,24(sp)
    80005dac:	01213823          	sd	s2,16(sp)
    80005db0:	01313423          	sd	s3,8(sp)
    80005db4:	03010413          	addi	s0,sp,48
    80005db8:	00050913          	mv	s2,a0
        int i = 0;
    80005dbc:	00000993          	li	s3,0
    80005dc0:	0100006f          	j	80005dd0 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80005dc4:	00a00513          	li	a0,10
    80005dc8:	ffffb097          	auipc	ra,0xffffb
    80005dcc:	70c080e7          	jalr	1804(ra) # 800014d4 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80005dd0:	00008797          	auipc	a5,0x8
    80005dd4:	3e87a783          	lw	a5,1000(a5) # 8000e1b8 <_ZL9threadEnd>
    80005dd8:	04079a63          	bnez	a5,80005e2c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80005ddc:	02093783          	ld	a5,32(s2)
    80005de0:	0087b503          	ld	a0,8(a5)
    80005de4:	00001097          	auipc	ra,0x1
    80005de8:	22c080e7          	jalr	556(ra) # 80007010 <_ZN9BufferCPP3getEv>
            i++;
    80005dec:	0019849b          	addiw	s1,s3,1
    80005df0:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80005df4:	0ff57513          	andi	a0,a0,255
    80005df8:	ffffb097          	auipc	ra,0xffffb
    80005dfc:	6dc080e7          	jalr	1756(ra) # 800014d4 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80005e00:	05000793          	li	a5,80
    80005e04:	02f4e4bb          	remw	s1,s1,a5
    80005e08:	fc0494e3          	bnez	s1,80005dd0 <_ZN8Consumer3runEv+0x34>
    80005e0c:	fb9ff06f          	j	80005dc4 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80005e10:	02093783          	ld	a5,32(s2)
    80005e14:	0087b503          	ld	a0,8(a5)
    80005e18:	00001097          	auipc	ra,0x1
    80005e1c:	1f8080e7          	jalr	504(ra) # 80007010 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80005e20:	0ff57513          	andi	a0,a0,255
    80005e24:	ffffb097          	auipc	ra,0xffffb
    80005e28:	6b0080e7          	jalr	1712(ra) # 800014d4 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005e2c:	02093783          	ld	a5,32(s2)
    80005e30:	0087b503          	ld	a0,8(a5)
    80005e34:	00001097          	auipc	ra,0x1
    80005e38:	268080e7          	jalr	616(ra) # 8000709c <_ZN9BufferCPP6getCntEv>
    80005e3c:	fca04ae3          	bgtz	a0,80005e10 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80005e40:	02093783          	ld	a5,32(s2)
    80005e44:	0107b503          	ld	a0,16(a5)
    80005e48:	ffffb097          	auipc	ra,0xffffb
    80005e4c:	5f0080e7          	jalr	1520(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005e50:	02813083          	ld	ra,40(sp)
    80005e54:	02013403          	ld	s0,32(sp)
    80005e58:	01813483          	ld	s1,24(sp)
    80005e5c:	01013903          	ld	s2,16(sp)
    80005e60:	00813983          	ld	s3,8(sp)
    80005e64:	03010113          	addi	sp,sp,48
    80005e68:	00008067          	ret

0000000080005e6c <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80005e6c:	ff010113          	addi	sp,sp,-16
    80005e70:	00113423          	sd	ra,8(sp)
    80005e74:	00813023          	sd	s0,0(sp)
    80005e78:	01010413          	addi	s0,sp,16
    80005e7c:	00008797          	auipc	a5,0x8
    80005e80:	10478793          	addi	a5,a5,260 # 8000df80 <_ZTV8Consumer+0x10>
    80005e84:	00f53023          	sd	a5,0(a0)
    80005e88:	ffffb097          	auipc	ra,0xffffb
    80005e8c:	2c4080e7          	jalr	708(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005e90:	00813083          	ld	ra,8(sp)
    80005e94:	00013403          	ld	s0,0(sp)
    80005e98:	01010113          	addi	sp,sp,16
    80005e9c:	00008067          	ret

0000000080005ea0 <_ZN8ConsumerD0Ev>:
    80005ea0:	fe010113          	addi	sp,sp,-32
    80005ea4:	00113c23          	sd	ra,24(sp)
    80005ea8:	00813823          	sd	s0,16(sp)
    80005eac:	00913423          	sd	s1,8(sp)
    80005eb0:	02010413          	addi	s0,sp,32
    80005eb4:	00050493          	mv	s1,a0
    80005eb8:	00008797          	auipc	a5,0x8
    80005ebc:	0c878793          	addi	a5,a5,200 # 8000df80 <_ZTV8Consumer+0x10>
    80005ec0:	00f53023          	sd	a5,0(a0)
    80005ec4:	ffffb097          	auipc	ra,0xffffb
    80005ec8:	288080e7          	jalr	648(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005ecc:	00048513          	mv	a0,s1
    80005ed0:	ffffb097          	auipc	ra,0xffffb
    80005ed4:	314080e7          	jalr	788(ra) # 800011e4 <_ZdlPv>
    80005ed8:	01813083          	ld	ra,24(sp)
    80005edc:	01013403          	ld	s0,16(sp)
    80005ee0:	00813483          	ld	s1,8(sp)
    80005ee4:	02010113          	addi	sp,sp,32
    80005ee8:	00008067          	ret

0000000080005eec <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80005eec:	ff010113          	addi	sp,sp,-16
    80005ef0:	00113423          	sd	ra,8(sp)
    80005ef4:	00813023          	sd	s0,0(sp)
    80005ef8:	01010413          	addi	s0,sp,16
    80005efc:	00008797          	auipc	a5,0x8
    80005f00:	03478793          	addi	a5,a5,52 # 8000df30 <_ZTV16ProducerKeyborad+0x10>
    80005f04:	00f53023          	sd	a5,0(a0)
    80005f08:	ffffb097          	auipc	ra,0xffffb
    80005f0c:	244080e7          	jalr	580(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005f10:	00813083          	ld	ra,8(sp)
    80005f14:	00013403          	ld	s0,0(sp)
    80005f18:	01010113          	addi	sp,sp,16
    80005f1c:	00008067          	ret

0000000080005f20 <_ZN16ProducerKeyboradD0Ev>:
    80005f20:	fe010113          	addi	sp,sp,-32
    80005f24:	00113c23          	sd	ra,24(sp)
    80005f28:	00813823          	sd	s0,16(sp)
    80005f2c:	00913423          	sd	s1,8(sp)
    80005f30:	02010413          	addi	s0,sp,32
    80005f34:	00050493          	mv	s1,a0
    80005f38:	00008797          	auipc	a5,0x8
    80005f3c:	ff878793          	addi	a5,a5,-8 # 8000df30 <_ZTV16ProducerKeyborad+0x10>
    80005f40:	00f53023          	sd	a5,0(a0)
    80005f44:	ffffb097          	auipc	ra,0xffffb
    80005f48:	208080e7          	jalr	520(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005f4c:	00048513          	mv	a0,s1
    80005f50:	ffffb097          	auipc	ra,0xffffb
    80005f54:	294080e7          	jalr	660(ra) # 800011e4 <_ZdlPv>
    80005f58:	01813083          	ld	ra,24(sp)
    80005f5c:	01013403          	ld	s0,16(sp)
    80005f60:	00813483          	ld	s1,8(sp)
    80005f64:	02010113          	addi	sp,sp,32
    80005f68:	00008067          	ret

0000000080005f6c <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005f6c:	ff010113          	addi	sp,sp,-16
    80005f70:	00113423          	sd	ra,8(sp)
    80005f74:	00813023          	sd	s0,0(sp)
    80005f78:	01010413          	addi	s0,sp,16
    80005f7c:	00008797          	auipc	a5,0x8
    80005f80:	fdc78793          	addi	a5,a5,-36 # 8000df58 <_ZTV8Producer+0x10>
    80005f84:	00f53023          	sd	a5,0(a0)
    80005f88:	ffffb097          	auipc	ra,0xffffb
    80005f8c:	1c4080e7          	jalr	452(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005f90:	00813083          	ld	ra,8(sp)
    80005f94:	00013403          	ld	s0,0(sp)
    80005f98:	01010113          	addi	sp,sp,16
    80005f9c:	00008067          	ret

0000000080005fa0 <_ZN8ProducerD0Ev>:
    80005fa0:	fe010113          	addi	sp,sp,-32
    80005fa4:	00113c23          	sd	ra,24(sp)
    80005fa8:	00813823          	sd	s0,16(sp)
    80005fac:	00913423          	sd	s1,8(sp)
    80005fb0:	02010413          	addi	s0,sp,32
    80005fb4:	00050493          	mv	s1,a0
    80005fb8:	00008797          	auipc	a5,0x8
    80005fbc:	fa078793          	addi	a5,a5,-96 # 8000df58 <_ZTV8Producer+0x10>
    80005fc0:	00f53023          	sd	a5,0(a0)
    80005fc4:	ffffb097          	auipc	ra,0xffffb
    80005fc8:	188080e7          	jalr	392(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005fcc:	00048513          	mv	a0,s1
    80005fd0:	ffffb097          	auipc	ra,0xffffb
    80005fd4:	214080e7          	jalr	532(ra) # 800011e4 <_ZdlPv>
    80005fd8:	01813083          	ld	ra,24(sp)
    80005fdc:	01013403          	ld	s0,16(sp)
    80005fe0:	00813483          	ld	s1,8(sp)
    80005fe4:	02010113          	addi	sp,sp,32
    80005fe8:	00008067          	ret

0000000080005fec <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80005fec:	fe010113          	addi	sp,sp,-32
    80005ff0:	00113c23          	sd	ra,24(sp)
    80005ff4:	00813823          	sd	s0,16(sp)
    80005ff8:	00913423          	sd	s1,8(sp)
    80005ffc:	02010413          	addi	s0,sp,32
    80006000:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80006004:	ffffc097          	auipc	ra,0xffffc
    80006008:	ac4080e7          	jalr	-1340(ra) # 80001ac8 <_Z4getcv>
    8000600c:	0005059b          	sext.w	a1,a0
    80006010:	01b00793          	li	a5,27
    80006014:	00f58c63          	beq	a1,a5,8000602c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80006018:	0204b783          	ld	a5,32(s1)
    8000601c:	0087b503          	ld	a0,8(a5)
    80006020:	00001097          	auipc	ra,0x1
    80006024:	f60080e7          	jalr	-160(ra) # 80006f80 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80006028:	fddff06f          	j	80006004 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    8000602c:	00100793          	li	a5,1
    80006030:	00008717          	auipc	a4,0x8
    80006034:	18f72423          	sw	a5,392(a4) # 8000e1b8 <_ZL9threadEnd>
        td->buffer->put('!');
    80006038:	0204b783          	ld	a5,32(s1)
    8000603c:	02100593          	li	a1,33
    80006040:	0087b503          	ld	a0,8(a5)
    80006044:	00001097          	auipc	ra,0x1
    80006048:	f3c080e7          	jalr	-196(ra) # 80006f80 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    8000604c:	0204b783          	ld	a5,32(s1)
    80006050:	0107b503          	ld	a0,16(a5)
    80006054:	ffffb097          	auipc	ra,0xffffb
    80006058:	3e4080e7          	jalr	996(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    8000605c:	01813083          	ld	ra,24(sp)
    80006060:	01013403          	ld	s0,16(sp)
    80006064:	00813483          	ld	s1,8(sp)
    80006068:	02010113          	addi	sp,sp,32
    8000606c:	00008067          	ret

0000000080006070 <_ZN8Producer3runEv>:
    void run() override {
    80006070:	fe010113          	addi	sp,sp,-32
    80006074:	00113c23          	sd	ra,24(sp)
    80006078:	00813823          	sd	s0,16(sp)
    8000607c:	00913423          	sd	s1,8(sp)
    80006080:	01213023          	sd	s2,0(sp)
    80006084:	02010413          	addi	s0,sp,32
    80006088:	00050493          	mv	s1,a0
        int i = 0;
    8000608c:	00000913          	li	s2,0
        while (!threadEnd) {
    80006090:	00008797          	auipc	a5,0x8
    80006094:	1287a783          	lw	a5,296(a5) # 8000e1b8 <_ZL9threadEnd>
    80006098:	04079263          	bnez	a5,800060dc <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    8000609c:	0204b783          	ld	a5,32(s1)
    800060a0:	0007a583          	lw	a1,0(a5)
    800060a4:	0305859b          	addiw	a1,a1,48
    800060a8:	0087b503          	ld	a0,8(a5)
    800060ac:	00001097          	auipc	ra,0x1
    800060b0:	ed4080e7          	jalr	-300(ra) # 80006f80 <_ZN9BufferCPP3putEi>
            i++;
    800060b4:	0019071b          	addiw	a4,s2,1
    800060b8:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800060bc:	0204b783          	ld	a5,32(s1)
    800060c0:	0007a783          	lw	a5,0(a5)
    800060c4:	00e787bb          	addw	a5,a5,a4
    800060c8:	00500513          	li	a0,5
    800060cc:	02a7e53b          	remw	a0,a5,a0
    800060d0:	ffffb097          	auipc	ra,0xffffb
    800060d4:	270080e7          	jalr	624(ra) # 80001340 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    800060d8:	fb9ff06f          	j	80006090 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    800060dc:	0204b783          	ld	a5,32(s1)
    800060e0:	0107b503          	ld	a0,16(a5)
    800060e4:	ffffb097          	auipc	ra,0xffffb
    800060e8:	354080e7          	jalr	852(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    800060ec:	01813083          	ld	ra,24(sp)
    800060f0:	01013403          	ld	s0,16(sp)
    800060f4:	00813483          	ld	s1,8(sp)
    800060f8:	00013903          	ld	s2,0(sp)
    800060fc:	02010113          	addi	sp,sp,32
    80006100:	00008067          	ret

0000000080006104 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006104:	fe010113          	addi	sp,sp,-32
    80006108:	00113c23          	sd	ra,24(sp)
    8000610c:	00813823          	sd	s0,16(sp)
    80006110:	00913423          	sd	s1,8(sp)
    80006114:	01213023          	sd	s2,0(sp)
    80006118:	02010413          	addi	s0,sp,32
    8000611c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006120:	00100793          	li	a5,1
    80006124:	02a7f863          	bgeu	a5,a0,80006154 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006128:	00a00793          	li	a5,10
    8000612c:	02f577b3          	remu	a5,a0,a5
    80006130:	02078e63          	beqz	a5,8000616c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006134:	fff48513          	addi	a0,s1,-1
    80006138:	00000097          	auipc	ra,0x0
    8000613c:	fcc080e7          	jalr	-52(ra) # 80006104 <_ZL9fibonaccim>
    80006140:	00050913          	mv	s2,a0
    80006144:	ffe48513          	addi	a0,s1,-2
    80006148:	00000097          	auipc	ra,0x0
    8000614c:	fbc080e7          	jalr	-68(ra) # 80006104 <_ZL9fibonaccim>
    80006150:	00a90533          	add	a0,s2,a0
}
    80006154:	01813083          	ld	ra,24(sp)
    80006158:	01013403          	ld	s0,16(sp)
    8000615c:	00813483          	ld	s1,8(sp)
    80006160:	00013903          	ld	s2,0(sp)
    80006164:	02010113          	addi	sp,sp,32
    80006168:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000616c:	ffffc097          	auipc	ra,0xffffc
    80006170:	830080e7          	jalr	-2000(ra) # 8000199c <_Z15thread_dispatchv>
    80006174:	fc1ff06f          	j	80006134 <_ZL9fibonaccim+0x30>

0000000080006178 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006178:	fe010113          	addi	sp,sp,-32
    8000617c:	00113c23          	sd	ra,24(sp)
    80006180:	00813823          	sd	s0,16(sp)
    80006184:	00913423          	sd	s1,8(sp)
    80006188:	01213023          	sd	s2,0(sp)
    8000618c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006190:	00a00493          	li	s1,10
    80006194:	0400006f          	j	800061d4 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006198:	00005517          	auipc	a0,0x5
    8000619c:	42050513          	addi	a0,a0,1056 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    800061a0:	00002097          	auipc	ra,0x2
    800061a4:	ba8080e7          	jalr	-1112(ra) # 80007d48 <_Z11printStringPKc>
    800061a8:	00000613          	li	a2,0
    800061ac:	00a00593          	li	a1,10
    800061b0:	00048513          	mv	a0,s1
    800061b4:	00002097          	auipc	ra,0x2
    800061b8:	d44080e7          	jalr	-700(ra) # 80007ef8 <_Z8printIntiii>
    800061bc:	00005517          	auipc	a0,0x5
    800061c0:	6c450513          	addi	a0,a0,1732 # 8000b880 <CONSOLE_STATUS+0x870>
    800061c4:	00002097          	auipc	ra,0x2
    800061c8:	b84080e7          	jalr	-1148(ra) # 80007d48 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800061cc:	0014849b          	addiw	s1,s1,1
    800061d0:	0ff4f493          	andi	s1,s1,255
    800061d4:	00c00793          	li	a5,12
    800061d8:	fc97f0e3          	bgeu	a5,s1,80006198 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800061dc:	00005517          	auipc	a0,0x5
    800061e0:	3e450513          	addi	a0,a0,996 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    800061e4:	00002097          	auipc	ra,0x2
    800061e8:	b64080e7          	jalr	-1180(ra) # 80007d48 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800061ec:	00500313          	li	t1,5
    thread_dispatch();
    800061f0:	ffffb097          	auipc	ra,0xffffb
    800061f4:	7ac080e7          	jalr	1964(ra) # 8000199c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800061f8:	01000513          	li	a0,16
    800061fc:	00000097          	auipc	ra,0x0
    80006200:	f08080e7          	jalr	-248(ra) # 80006104 <_ZL9fibonaccim>
    80006204:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006208:	00005517          	auipc	a0,0x5
    8000620c:	3c850513          	addi	a0,a0,968 # 8000b5d0 <CONSOLE_STATUS+0x5c0>
    80006210:	00002097          	auipc	ra,0x2
    80006214:	b38080e7          	jalr	-1224(ra) # 80007d48 <_Z11printStringPKc>
    80006218:	00000613          	li	a2,0
    8000621c:	00a00593          	li	a1,10
    80006220:	0009051b          	sext.w	a0,s2
    80006224:	00002097          	auipc	ra,0x2
    80006228:	cd4080e7          	jalr	-812(ra) # 80007ef8 <_Z8printIntiii>
    8000622c:	00005517          	auipc	a0,0x5
    80006230:	65450513          	addi	a0,a0,1620 # 8000b880 <CONSOLE_STATUS+0x870>
    80006234:	00002097          	auipc	ra,0x2
    80006238:	b14080e7          	jalr	-1260(ra) # 80007d48 <_Z11printStringPKc>
    8000623c:	0400006f          	j	8000627c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006240:	00005517          	auipc	a0,0x5
    80006244:	37850513          	addi	a0,a0,888 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80006248:	00002097          	auipc	ra,0x2
    8000624c:	b00080e7          	jalr	-1280(ra) # 80007d48 <_Z11printStringPKc>
    80006250:	00000613          	li	a2,0
    80006254:	00a00593          	li	a1,10
    80006258:	00048513          	mv	a0,s1
    8000625c:	00002097          	auipc	ra,0x2
    80006260:	c9c080e7          	jalr	-868(ra) # 80007ef8 <_Z8printIntiii>
    80006264:	00005517          	auipc	a0,0x5
    80006268:	61c50513          	addi	a0,a0,1564 # 8000b880 <CONSOLE_STATUS+0x870>
    8000626c:	00002097          	auipc	ra,0x2
    80006270:	adc080e7          	jalr	-1316(ra) # 80007d48 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006274:	0014849b          	addiw	s1,s1,1
    80006278:	0ff4f493          	andi	s1,s1,255
    8000627c:	00f00793          	li	a5,15
    80006280:	fc97f0e3          	bgeu	a5,s1,80006240 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006284:	00005517          	auipc	a0,0x5
    80006288:	35c50513          	addi	a0,a0,860 # 8000b5e0 <CONSOLE_STATUS+0x5d0>
    8000628c:	00002097          	auipc	ra,0x2
    80006290:	abc080e7          	jalr	-1348(ra) # 80007d48 <_Z11printStringPKc>
    finishedD = true;
    80006294:	00100793          	li	a5,1
    80006298:	00008717          	auipc	a4,0x8
    8000629c:	f2f70823          	sb	a5,-208(a4) # 8000e1c8 <_ZL9finishedD>
    thread_dispatch();
    800062a0:	ffffb097          	auipc	ra,0xffffb
    800062a4:	6fc080e7          	jalr	1788(ra) # 8000199c <_Z15thread_dispatchv>
}
    800062a8:	01813083          	ld	ra,24(sp)
    800062ac:	01013403          	ld	s0,16(sp)
    800062b0:	00813483          	ld	s1,8(sp)
    800062b4:	00013903          	ld	s2,0(sp)
    800062b8:	02010113          	addi	sp,sp,32
    800062bc:	00008067          	ret

00000000800062c0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800062c0:	fe010113          	addi	sp,sp,-32
    800062c4:	00113c23          	sd	ra,24(sp)
    800062c8:	00813823          	sd	s0,16(sp)
    800062cc:	00913423          	sd	s1,8(sp)
    800062d0:	01213023          	sd	s2,0(sp)
    800062d4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800062d8:	00000493          	li	s1,0
    800062dc:	0400006f          	j	8000631c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800062e0:	00005517          	auipc	a0,0x5
    800062e4:	31050513          	addi	a0,a0,784 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    800062e8:	00002097          	auipc	ra,0x2
    800062ec:	a60080e7          	jalr	-1440(ra) # 80007d48 <_Z11printStringPKc>
    800062f0:	00000613          	li	a2,0
    800062f4:	00a00593          	li	a1,10
    800062f8:	00048513          	mv	a0,s1
    800062fc:	00002097          	auipc	ra,0x2
    80006300:	bfc080e7          	jalr	-1028(ra) # 80007ef8 <_Z8printIntiii>
    80006304:	00005517          	auipc	a0,0x5
    80006308:	57c50513          	addi	a0,a0,1404 # 8000b880 <CONSOLE_STATUS+0x870>
    8000630c:	00002097          	auipc	ra,0x2
    80006310:	a3c080e7          	jalr	-1476(ra) # 80007d48 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006314:	0014849b          	addiw	s1,s1,1
    80006318:	0ff4f493          	andi	s1,s1,255
    8000631c:	00200793          	li	a5,2
    80006320:	fc97f0e3          	bgeu	a5,s1,800062e0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006324:	00005517          	auipc	a0,0x5
    80006328:	2d450513          	addi	a0,a0,724 # 8000b5f8 <CONSOLE_STATUS+0x5e8>
    8000632c:	00002097          	auipc	ra,0x2
    80006330:	a1c080e7          	jalr	-1508(ra) # 80007d48 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006334:	00700313          	li	t1,7
    thread_dispatch();
    80006338:	ffffb097          	auipc	ra,0xffffb
    8000633c:	664080e7          	jalr	1636(ra) # 8000199c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006340:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006344:	00005517          	auipc	a0,0x5
    80006348:	2c450513          	addi	a0,a0,708 # 8000b608 <CONSOLE_STATUS+0x5f8>
    8000634c:	00002097          	auipc	ra,0x2
    80006350:	9fc080e7          	jalr	-1540(ra) # 80007d48 <_Z11printStringPKc>
    80006354:	00000613          	li	a2,0
    80006358:	00a00593          	li	a1,10
    8000635c:	0009051b          	sext.w	a0,s2
    80006360:	00002097          	auipc	ra,0x2
    80006364:	b98080e7          	jalr	-1128(ra) # 80007ef8 <_Z8printIntiii>
    80006368:	00005517          	auipc	a0,0x5
    8000636c:	51850513          	addi	a0,a0,1304 # 8000b880 <CONSOLE_STATUS+0x870>
    80006370:	00002097          	auipc	ra,0x2
    80006374:	9d8080e7          	jalr	-1576(ra) # 80007d48 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006378:	00c00513          	li	a0,12
    8000637c:	00000097          	auipc	ra,0x0
    80006380:	d88080e7          	jalr	-632(ra) # 80006104 <_ZL9fibonaccim>
    80006384:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006388:	00005517          	auipc	a0,0x5
    8000638c:	28850513          	addi	a0,a0,648 # 8000b610 <CONSOLE_STATUS+0x600>
    80006390:	00002097          	auipc	ra,0x2
    80006394:	9b8080e7          	jalr	-1608(ra) # 80007d48 <_Z11printStringPKc>
    80006398:	00000613          	li	a2,0
    8000639c:	00a00593          	li	a1,10
    800063a0:	0009051b          	sext.w	a0,s2
    800063a4:	00002097          	auipc	ra,0x2
    800063a8:	b54080e7          	jalr	-1196(ra) # 80007ef8 <_Z8printIntiii>
    800063ac:	00005517          	auipc	a0,0x5
    800063b0:	4d450513          	addi	a0,a0,1236 # 8000b880 <CONSOLE_STATUS+0x870>
    800063b4:	00002097          	auipc	ra,0x2
    800063b8:	994080e7          	jalr	-1644(ra) # 80007d48 <_Z11printStringPKc>
    800063bc:	0400006f          	j	800063fc <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800063c0:	00005517          	auipc	a0,0x5
    800063c4:	23050513          	addi	a0,a0,560 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    800063c8:	00002097          	auipc	ra,0x2
    800063cc:	980080e7          	jalr	-1664(ra) # 80007d48 <_Z11printStringPKc>
    800063d0:	00000613          	li	a2,0
    800063d4:	00a00593          	li	a1,10
    800063d8:	00048513          	mv	a0,s1
    800063dc:	00002097          	auipc	ra,0x2
    800063e0:	b1c080e7          	jalr	-1252(ra) # 80007ef8 <_Z8printIntiii>
    800063e4:	00005517          	auipc	a0,0x5
    800063e8:	49c50513          	addi	a0,a0,1180 # 8000b880 <CONSOLE_STATUS+0x870>
    800063ec:	00002097          	auipc	ra,0x2
    800063f0:	95c080e7          	jalr	-1700(ra) # 80007d48 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800063f4:	0014849b          	addiw	s1,s1,1
    800063f8:	0ff4f493          	andi	s1,s1,255
    800063fc:	00500793          	li	a5,5
    80006400:	fc97f0e3          	bgeu	a5,s1,800063c0 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80006404:	00005517          	auipc	a0,0x5
    80006408:	21c50513          	addi	a0,a0,540 # 8000b620 <CONSOLE_STATUS+0x610>
    8000640c:	00002097          	auipc	ra,0x2
    80006410:	93c080e7          	jalr	-1732(ra) # 80007d48 <_Z11printStringPKc>
    finishedC = true;
    80006414:	00100793          	li	a5,1
    80006418:	00008717          	auipc	a4,0x8
    8000641c:	daf708a3          	sb	a5,-591(a4) # 8000e1c9 <_ZL9finishedC>
    thread_dispatch();
    80006420:	ffffb097          	auipc	ra,0xffffb
    80006424:	57c080e7          	jalr	1404(ra) # 8000199c <_Z15thread_dispatchv>
}
    80006428:	01813083          	ld	ra,24(sp)
    8000642c:	01013403          	ld	s0,16(sp)
    80006430:	00813483          	ld	s1,8(sp)
    80006434:	00013903          	ld	s2,0(sp)
    80006438:	02010113          	addi	sp,sp,32
    8000643c:	00008067          	ret

0000000080006440 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006440:	fe010113          	addi	sp,sp,-32
    80006444:	00113c23          	sd	ra,24(sp)
    80006448:	00813823          	sd	s0,16(sp)
    8000644c:	00913423          	sd	s1,8(sp)
    80006450:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006454:	00000493          	li	s1,0
    80006458:	0340006f          	j	8000648c <_ZL11workerBodyBPv+0x4c>
        for (uint64 j = 0; j < 100; j++) {
    8000645c:	00168693          	addi	a3,a3,1
    80006460:	06300793          	li	a5,99
    80006464:	00d7ee63          	bltu	a5,a3,80006480 <_ZL11workerBodyBPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006468:	00000713          	li	a4,0
    8000646c:	000077b7          	lui	a5,0x7
    80006470:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006474:	fee7e4e3          	bltu	a5,a4,8000645c <_ZL11workerBodyBPv+0x1c>
    80006478:	00170713          	addi	a4,a4,1
    8000647c:	ff1ff06f          	j	8000646c <_ZL11workerBodyBPv+0x2c>
        if (i == 10) {
    80006480:	00a00793          	li	a5,10
    80006484:	04f48663          	beq	s1,a5,800064d0 <_ZL11workerBodyBPv+0x90>
    for (uint64 i = 0; i < 16; i++) {
    80006488:	00148493          	addi	s1,s1,1
    8000648c:	00f00793          	li	a5,15
    80006490:	0497e463          	bltu	a5,s1,800064d8 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80006494:	00005517          	auipc	a0,0x5
    80006498:	19c50513          	addi	a0,a0,412 # 8000b630 <CONSOLE_STATUS+0x620>
    8000649c:	00002097          	auipc	ra,0x2
    800064a0:	8ac080e7          	jalr	-1876(ra) # 80007d48 <_Z11printStringPKc>
    800064a4:	00000613          	li	a2,0
    800064a8:	00a00593          	li	a1,10
    800064ac:	0004851b          	sext.w	a0,s1
    800064b0:	00002097          	auipc	ra,0x2
    800064b4:	a48080e7          	jalr	-1464(ra) # 80007ef8 <_Z8printIntiii>
    800064b8:	00005517          	auipc	a0,0x5
    800064bc:	3c850513          	addi	a0,a0,968 # 8000b880 <CONSOLE_STATUS+0x870>
    800064c0:	00002097          	auipc	ra,0x2
    800064c4:	888080e7          	jalr	-1912(ra) # 80007d48 <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    800064c8:	00000693          	li	a3,0
    800064cc:	f95ff06f          	j	80006460 <_ZL11workerBodyBPv+0x20>
            asm volatile("csrr t6, sepc");
    800064d0:	14102ff3          	csrr	t6,sepc
    800064d4:	fb5ff06f          	j	80006488 <_ZL11workerBodyBPv+0x48>
    printString("B finished!\n");
    800064d8:	00005517          	auipc	a0,0x5
    800064dc:	16050513          	addi	a0,a0,352 # 8000b638 <CONSOLE_STATUS+0x628>
    800064e0:	00002097          	auipc	ra,0x2
    800064e4:	868080e7          	jalr	-1944(ra) # 80007d48 <_Z11printStringPKc>
    finishedB = true;
    800064e8:	00100793          	li	a5,1
    800064ec:	00008717          	auipc	a4,0x8
    800064f0:	ccf70f23          	sb	a5,-802(a4) # 8000e1ca <_ZL9finishedB>
    thread_dispatch();
    800064f4:	ffffb097          	auipc	ra,0xffffb
    800064f8:	4a8080e7          	jalr	1192(ra) # 8000199c <_Z15thread_dispatchv>
}
    800064fc:	01813083          	ld	ra,24(sp)
    80006500:	01013403          	ld	s0,16(sp)
    80006504:	00813483          	ld	s1,8(sp)
    80006508:	02010113          	addi	sp,sp,32
    8000650c:	00008067          	ret

0000000080006510 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006510:	fe010113          	addi	sp,sp,-32
    80006514:	00113c23          	sd	ra,24(sp)
    80006518:	00813823          	sd	s0,16(sp)
    8000651c:	00913423          	sd	s1,8(sp)
    80006520:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006524:	00000493          	li	s1,0
    80006528:	02c0006f          	j	80006554 <_ZL11workerBodyAPv+0x44>
        for (uint64 j = 0; j < 100; j++) {
    8000652c:	00168693          	addi	a3,a3,1
    80006530:	06300793          	li	a5,99
    80006534:	00d7ee63          	bltu	a5,a3,80006550 <_ZL11workerBodyAPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006538:	00000713          	li	a4,0
    8000653c:	000077b7          	lui	a5,0x7
    80006540:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006544:	fee7e4e3          	bltu	a5,a4,8000652c <_ZL11workerBodyAPv+0x1c>
    80006548:	00170713          	addi	a4,a4,1
    8000654c:	ff1ff06f          	j	8000653c <_ZL11workerBodyAPv+0x2c>
    for (uint64 i = 0; i < 10; i++) {
    80006550:	00148493          	addi	s1,s1,1
    80006554:	00900793          	li	a5,9
    80006558:	0497e063          	bltu	a5,s1,80006598 <_ZL11workerBodyAPv+0x88>
        printString("A: i="); printInt(i); printString("\n");
    8000655c:	00005517          	auipc	a0,0x5
    80006560:	0ec50513          	addi	a0,a0,236 # 8000b648 <CONSOLE_STATUS+0x638>
    80006564:	00001097          	auipc	ra,0x1
    80006568:	7e4080e7          	jalr	2020(ra) # 80007d48 <_Z11printStringPKc>
    8000656c:	00000613          	li	a2,0
    80006570:	00a00593          	li	a1,10
    80006574:	0004851b          	sext.w	a0,s1
    80006578:	00002097          	auipc	ra,0x2
    8000657c:	980080e7          	jalr	-1664(ra) # 80007ef8 <_Z8printIntiii>
    80006580:	00005517          	auipc	a0,0x5
    80006584:	30050513          	addi	a0,a0,768 # 8000b880 <CONSOLE_STATUS+0x870>
    80006588:	00001097          	auipc	ra,0x1
    8000658c:	7c0080e7          	jalr	1984(ra) # 80007d48 <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80006590:	00000693          	li	a3,0
    80006594:	f9dff06f          	j	80006530 <_ZL11workerBodyAPv+0x20>
    printString("A finished!\n");
    80006598:	00005517          	auipc	a0,0x5
    8000659c:	0b850513          	addi	a0,a0,184 # 8000b650 <CONSOLE_STATUS+0x640>
    800065a0:	00001097          	auipc	ra,0x1
    800065a4:	7a8080e7          	jalr	1960(ra) # 80007d48 <_Z11printStringPKc>
    finishedA = true;
    800065a8:	00100793          	li	a5,1
    800065ac:	00008717          	auipc	a4,0x8
    800065b0:	c0f70fa3          	sb	a5,-993(a4) # 8000e1cb <_ZL9finishedA>
}
    800065b4:	01813083          	ld	ra,24(sp)
    800065b8:	01013403          	ld	s0,16(sp)
    800065bc:	00813483          	ld	s1,8(sp)
    800065c0:	02010113          	addi	sp,sp,32
    800065c4:	00008067          	ret

00000000800065c8 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800065c8:	fd010113          	addi	sp,sp,-48
    800065cc:	02113423          	sd	ra,40(sp)
    800065d0:	02813023          	sd	s0,32(sp)
    800065d4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800065d8:	00000613          	li	a2,0
    800065dc:	00000597          	auipc	a1,0x0
    800065e0:	f3458593          	addi	a1,a1,-204 # 80006510 <_ZL11workerBodyAPv>
    800065e4:	fd040513          	addi	a0,s0,-48
    800065e8:	ffffb097          	auipc	ra,0xffffb
    800065ec:	318080e7          	jalr	792(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800065f0:	00005517          	auipc	a0,0x5
    800065f4:	07050513          	addi	a0,a0,112 # 8000b660 <CONSOLE_STATUS+0x650>
    800065f8:	00001097          	auipc	ra,0x1
    800065fc:	750080e7          	jalr	1872(ra) # 80007d48 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[1], workerBodyB, nullptr);
    80006600:	00000613          	li	a2,0
    80006604:	00000597          	auipc	a1,0x0
    80006608:	e3c58593          	addi	a1,a1,-452 # 80006440 <_ZL11workerBodyBPv>
    8000660c:	fd840513          	addi	a0,s0,-40
    80006610:	ffffb097          	auipc	ra,0xffffb
    80006614:	2f0080e7          	jalr	752(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80006618:	00005517          	auipc	a0,0x5
    8000661c:	06050513          	addi	a0,a0,96 # 8000b678 <CONSOLE_STATUS+0x668>
    80006620:	00001097          	auipc	ra,0x1
    80006624:	728080e7          	jalr	1832(ra) # 80007d48 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[2], workerBodyC, nullptr);
    80006628:	00000613          	li	a2,0
    8000662c:	00000597          	auipc	a1,0x0
    80006630:	c9458593          	addi	a1,a1,-876 # 800062c0 <_ZL11workerBodyCPv>
    80006634:	fe040513          	addi	a0,s0,-32
    80006638:	ffffb097          	auipc	ra,0xffffb
    8000663c:	2c8080e7          	jalr	712(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80006640:	00005517          	auipc	a0,0x5
    80006644:	05050513          	addi	a0,a0,80 # 8000b690 <CONSOLE_STATUS+0x680>
    80006648:	00001097          	auipc	ra,0x1
    8000664c:	700080e7          	jalr	1792(ra) # 80007d48 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[3], workerBodyD, nullptr);
    80006650:	00000613          	li	a2,0
    80006654:	00000597          	auipc	a1,0x0
    80006658:	b2458593          	addi	a1,a1,-1244 # 80006178 <_ZL11workerBodyDPv>
    8000665c:	fe840513          	addi	a0,s0,-24
    80006660:	ffffb097          	auipc	ra,0xffffb
    80006664:	2a0080e7          	jalr	672(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006668:	00005517          	auipc	a0,0x5
    8000666c:	04050513          	addi	a0,a0,64 # 8000b6a8 <CONSOLE_STATUS+0x698>
    80006670:	00001097          	auipc	ra,0x1
    80006674:	6d8080e7          	jalr	1752(ra) # 80007d48 <_Z11printStringPKc>
    80006678:	00c0006f          	j	80006684 <_Z16System_Mode_testv+0xbc>
    // testUser();

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    8000667c:	ffffb097          	auipc	ra,0xffffb
    80006680:	320080e7          	jalr	800(ra) # 8000199c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006684:	00008797          	auipc	a5,0x8
    80006688:	b477c783          	lbu	a5,-1209(a5) # 8000e1cb <_ZL9finishedA>
    8000668c:	fe0788e3          	beqz	a5,8000667c <_Z16System_Mode_testv+0xb4>
    80006690:	00008797          	auipc	a5,0x8
    80006694:	b3a7c783          	lbu	a5,-1222(a5) # 8000e1ca <_ZL9finishedB>
    80006698:	fe0782e3          	beqz	a5,8000667c <_Z16System_Mode_testv+0xb4>
    8000669c:	00008797          	auipc	a5,0x8
    800066a0:	b2d7c783          	lbu	a5,-1235(a5) # 8000e1c9 <_ZL9finishedC>
    800066a4:	fc078ce3          	beqz	a5,8000667c <_Z16System_Mode_testv+0xb4>
    800066a8:	00008797          	auipc	a5,0x8
    800066ac:	b207c783          	lbu	a5,-1248(a5) # 8000e1c8 <_ZL9finishedD>
    800066b0:	fc0786e3          	beqz	a5,8000667c <_Z16System_Mode_testv+0xb4>
    }

}
    800066b4:	02813083          	ld	ra,40(sp)
    800066b8:	02013403          	ld	s0,32(sp)
    800066bc:	03010113          	addi	sp,sp,48
    800066c0:	00008067          	ret

00000000800066c4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800066c4:	fe010113          	addi	sp,sp,-32
    800066c8:	00113c23          	sd	ra,24(sp)
    800066cc:	00813823          	sd	s0,16(sp)
    800066d0:	00913423          	sd	s1,8(sp)
    800066d4:	01213023          	sd	s2,0(sp)
    800066d8:	02010413          	addi	s0,sp,32
    800066dc:	00050493          	mv	s1,a0
    // putc('F');
    // putc('-');
    // putc('0' + n / 10);
    // putc('0' + n % 10);
    // putc('\n');
    if (n == 0 || n == 1) { return n; }
    800066e0:	00100793          	li	a5,1
    800066e4:	02a7f863          	bgeu	a5,a0,80006714 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800066e8:	00a00793          	li	a5,10
    800066ec:	02f577b3          	remu	a5,a0,a5
    800066f0:	02078e63          	beqz	a5,8000672c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800066f4:	fff48513          	addi	a0,s1,-1
    800066f8:	00000097          	auipc	ra,0x0
    800066fc:	fcc080e7          	jalr	-52(ra) # 800066c4 <_ZL9fibonaccim>
    80006700:	00050913          	mv	s2,a0
    80006704:	ffe48513          	addi	a0,s1,-2
    80006708:	00000097          	auipc	ra,0x0
    8000670c:	fbc080e7          	jalr	-68(ra) # 800066c4 <_ZL9fibonaccim>
    80006710:	00a90533          	add	a0,s2,a0
}
    80006714:	01813083          	ld	ra,24(sp)
    80006718:	01013403          	ld	s0,16(sp)
    8000671c:	00813483          	ld	s1,8(sp)
    80006720:	00013903          	ld	s2,0(sp)
    80006724:	02010113          	addi	sp,sp,32
    80006728:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000672c:	ffffb097          	auipc	ra,0xffffb
    80006730:	270080e7          	jalr	624(ra) # 8000199c <_Z15thread_dispatchv>
    80006734:	fc1ff06f          	j	800066f4 <_ZL9fibonaccim+0x30>

0000000080006738 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006738:	fe010113          	addi	sp,sp,-32
    8000673c:	00113c23          	sd	ra,24(sp)
    80006740:	00813823          	sd	s0,16(sp)
    80006744:	00913423          	sd	s1,8(sp)
    80006748:	01213023          	sd	s2,0(sp)
    8000674c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006750:	00a00493          	li	s1,10
    80006754:	0400006f          	j	80006794 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006758:	00005517          	auipc	a0,0x5
    8000675c:	e6050513          	addi	a0,a0,-416 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80006760:	00001097          	auipc	ra,0x1
    80006764:	5e8080e7          	jalr	1512(ra) # 80007d48 <_Z11printStringPKc>
    80006768:	00000613          	li	a2,0
    8000676c:	00a00593          	li	a1,10
    80006770:	00048513          	mv	a0,s1
    80006774:	00001097          	auipc	ra,0x1
    80006778:	784080e7          	jalr	1924(ra) # 80007ef8 <_Z8printIntiii>
    8000677c:	00005517          	auipc	a0,0x5
    80006780:	10450513          	addi	a0,a0,260 # 8000b880 <CONSOLE_STATUS+0x870>
    80006784:	00001097          	auipc	ra,0x1
    80006788:	5c4080e7          	jalr	1476(ra) # 80007d48 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000678c:	0014849b          	addiw	s1,s1,1
    80006790:	0ff4f493          	andi	s1,s1,255
    80006794:	00c00793          	li	a5,12
    80006798:	fc97f0e3          	bgeu	a5,s1,80006758 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000679c:	00005517          	auipc	a0,0x5
    800067a0:	e2450513          	addi	a0,a0,-476 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    800067a4:	00001097          	auipc	ra,0x1
    800067a8:	5a4080e7          	jalr	1444(ra) # 80007d48 <_Z11printStringPKc>
    __asm__ volatile("li t1, 5");
    800067ac:	00500313          	li	t1,5
    thread_dispatch();
    800067b0:	ffffb097          	auipc	ra,0xffffb
    800067b4:	1ec080e7          	jalr	492(ra) # 8000199c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800067b8:	01000513          	li	a0,16
    800067bc:	00000097          	auipc	ra,0x0
    800067c0:	f08080e7          	jalr	-248(ra) # 800066c4 <_ZL9fibonaccim>
    800067c4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800067c8:	00005517          	auipc	a0,0x5
    800067cc:	e0850513          	addi	a0,a0,-504 # 8000b5d0 <CONSOLE_STATUS+0x5c0>
    800067d0:	00001097          	auipc	ra,0x1
    800067d4:	578080e7          	jalr	1400(ra) # 80007d48 <_Z11printStringPKc>
    800067d8:	00000613          	li	a2,0
    800067dc:	00a00593          	li	a1,10
    800067e0:	0009051b          	sext.w	a0,s2
    800067e4:	00001097          	auipc	ra,0x1
    800067e8:	714080e7          	jalr	1812(ra) # 80007ef8 <_Z8printIntiii>
    800067ec:	00005517          	auipc	a0,0x5
    800067f0:	09450513          	addi	a0,a0,148 # 8000b880 <CONSOLE_STATUS+0x870>
    800067f4:	00001097          	auipc	ra,0x1
    800067f8:	554080e7          	jalr	1364(ra) # 80007d48 <_Z11printStringPKc>
    800067fc:	0400006f          	j	8000683c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006800:	00005517          	auipc	a0,0x5
    80006804:	db850513          	addi	a0,a0,-584 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80006808:	00001097          	auipc	ra,0x1
    8000680c:	540080e7          	jalr	1344(ra) # 80007d48 <_Z11printStringPKc>
    80006810:	00000613          	li	a2,0
    80006814:	00a00593          	li	a1,10
    80006818:	00048513          	mv	a0,s1
    8000681c:	00001097          	auipc	ra,0x1
    80006820:	6dc080e7          	jalr	1756(ra) # 80007ef8 <_Z8printIntiii>
    80006824:	00005517          	auipc	a0,0x5
    80006828:	05c50513          	addi	a0,a0,92 # 8000b880 <CONSOLE_STATUS+0x870>
    8000682c:	00001097          	auipc	ra,0x1
    80006830:	51c080e7          	jalr	1308(ra) # 80007d48 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006834:	0014849b          	addiw	s1,s1,1
    80006838:	0ff4f493          	andi	s1,s1,255
    8000683c:	00f00793          	li	a5,15
    80006840:	fc97f0e3          	bgeu	a5,s1,80006800 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006844:	00005517          	auipc	a0,0x5
    80006848:	d9c50513          	addi	a0,a0,-612 # 8000b5e0 <CONSOLE_STATUS+0x5d0>
    8000684c:	00001097          	auipc	ra,0x1
    80006850:	4fc080e7          	jalr	1276(ra) # 80007d48 <_Z11printStringPKc>
    finishedD = true;
    80006854:	00100793          	li	a5,1
    80006858:	00008717          	auipc	a4,0x8
    8000685c:	96f70a23          	sb	a5,-1676(a4) # 8000e1cc <_ZL9finishedD>
    thread_dispatch();
    80006860:	ffffb097          	auipc	ra,0xffffb
    80006864:	13c080e7          	jalr	316(ra) # 8000199c <_Z15thread_dispatchv>
}
    80006868:	01813083          	ld	ra,24(sp)
    8000686c:	01013403          	ld	s0,16(sp)
    80006870:	00813483          	ld	s1,8(sp)
    80006874:	00013903          	ld	s2,0(sp)
    80006878:	02010113          	addi	sp,sp,32
    8000687c:	00008067          	ret

0000000080006880 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006880:	fe010113          	addi	sp,sp,-32
    80006884:	00113c23          	sd	ra,24(sp)
    80006888:	00813823          	sd	s0,16(sp)
    8000688c:	00913423          	sd	s1,8(sp)
    80006890:	01213023          	sd	s2,0(sp)
    80006894:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006898:	00000493          	li	s1,0
    8000689c:	0400006f          	j	800068dc <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800068a0:	00005517          	auipc	a0,0x5
    800068a4:	d5050513          	addi	a0,a0,-688 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    800068a8:	00001097          	auipc	ra,0x1
    800068ac:	4a0080e7          	jalr	1184(ra) # 80007d48 <_Z11printStringPKc>
    800068b0:	00000613          	li	a2,0
    800068b4:	00a00593          	li	a1,10
    800068b8:	00048513          	mv	a0,s1
    800068bc:	00001097          	auipc	ra,0x1
    800068c0:	63c080e7          	jalr	1596(ra) # 80007ef8 <_Z8printIntiii>
    800068c4:	00005517          	auipc	a0,0x5
    800068c8:	fbc50513          	addi	a0,a0,-68 # 8000b880 <CONSOLE_STATUS+0x870>
    800068cc:	00001097          	auipc	ra,0x1
    800068d0:	47c080e7          	jalr	1148(ra) # 80007d48 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800068d4:	0014849b          	addiw	s1,s1,1
    800068d8:	0ff4f493          	andi	s1,s1,255
    800068dc:	00200793          	li	a5,2
    800068e0:	fc97f0e3          	bgeu	a5,s1,800068a0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800068e4:	00005517          	auipc	a0,0x5
    800068e8:	d1450513          	addi	a0,a0,-748 # 8000b5f8 <CONSOLE_STATUS+0x5e8>
    800068ec:	00001097          	auipc	ra,0x1
    800068f0:	45c080e7          	jalr	1116(ra) # 80007d48 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800068f4:	00700313          	li	t1,7
    thread_dispatch();
    800068f8:	ffffb097          	auipc	ra,0xffffb
    800068fc:	0a4080e7          	jalr	164(ra) # 8000199c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006900:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006904:	00005517          	auipc	a0,0x5
    80006908:	d0450513          	addi	a0,a0,-764 # 8000b608 <CONSOLE_STATUS+0x5f8>
    8000690c:	00001097          	auipc	ra,0x1
    80006910:	43c080e7          	jalr	1084(ra) # 80007d48 <_Z11printStringPKc>
    80006914:	00000613          	li	a2,0
    80006918:	00a00593          	li	a1,10
    8000691c:	0009051b          	sext.w	a0,s2
    80006920:	00001097          	auipc	ra,0x1
    80006924:	5d8080e7          	jalr	1496(ra) # 80007ef8 <_Z8printIntiii>
    80006928:	00005517          	auipc	a0,0x5
    8000692c:	f5850513          	addi	a0,a0,-168 # 8000b880 <CONSOLE_STATUS+0x870>
    80006930:	00001097          	auipc	ra,0x1
    80006934:	418080e7          	jalr	1048(ra) # 80007d48 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006938:	00c00513          	li	a0,12
    8000693c:	00000097          	auipc	ra,0x0
    80006940:	d88080e7          	jalr	-632(ra) # 800066c4 <_ZL9fibonaccim>
    80006944:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006948:	00005517          	auipc	a0,0x5
    8000694c:	cc850513          	addi	a0,a0,-824 # 8000b610 <CONSOLE_STATUS+0x600>
    80006950:	00001097          	auipc	ra,0x1
    80006954:	3f8080e7          	jalr	1016(ra) # 80007d48 <_Z11printStringPKc>
    80006958:	00000613          	li	a2,0
    8000695c:	00a00593          	li	a1,10
    80006960:	0009051b          	sext.w	a0,s2
    80006964:	00001097          	auipc	ra,0x1
    80006968:	594080e7          	jalr	1428(ra) # 80007ef8 <_Z8printIntiii>
    8000696c:	00005517          	auipc	a0,0x5
    80006970:	f1450513          	addi	a0,a0,-236 # 8000b880 <CONSOLE_STATUS+0x870>
    80006974:	00001097          	auipc	ra,0x1
    80006978:	3d4080e7          	jalr	980(ra) # 80007d48 <_Z11printStringPKc>
    8000697c:	0400006f          	j	800069bc <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006980:	00005517          	auipc	a0,0x5
    80006984:	c7050513          	addi	a0,a0,-912 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    80006988:	00001097          	auipc	ra,0x1
    8000698c:	3c0080e7          	jalr	960(ra) # 80007d48 <_Z11printStringPKc>
    80006990:	00000613          	li	a2,0
    80006994:	00a00593          	li	a1,10
    80006998:	00048513          	mv	a0,s1
    8000699c:	00001097          	auipc	ra,0x1
    800069a0:	55c080e7          	jalr	1372(ra) # 80007ef8 <_Z8printIntiii>
    800069a4:	00005517          	auipc	a0,0x5
    800069a8:	edc50513          	addi	a0,a0,-292 # 8000b880 <CONSOLE_STATUS+0x870>
    800069ac:	00001097          	auipc	ra,0x1
    800069b0:	39c080e7          	jalr	924(ra) # 80007d48 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800069b4:	0014849b          	addiw	s1,s1,1
    800069b8:	0ff4f493          	andi	s1,s1,255
    800069bc:	00500793          	li	a5,5
    800069c0:	fc97f0e3          	bgeu	a5,s1,80006980 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    800069c4:	00005517          	auipc	a0,0x5
    800069c8:	c5c50513          	addi	a0,a0,-932 # 8000b620 <CONSOLE_STATUS+0x610>
    800069cc:	00001097          	auipc	ra,0x1
    800069d0:	37c080e7          	jalr	892(ra) # 80007d48 <_Z11printStringPKc>
    finishedC = true;
    800069d4:	00100793          	li	a5,1
    800069d8:	00007717          	auipc	a4,0x7
    800069dc:	7ef70aa3          	sb	a5,2037(a4) # 8000e1cd <_ZL9finishedC>
    thread_dispatch();
    800069e0:	ffffb097          	auipc	ra,0xffffb
    800069e4:	fbc080e7          	jalr	-68(ra) # 8000199c <_Z15thread_dispatchv>
}
    800069e8:	01813083          	ld	ra,24(sp)
    800069ec:	01013403          	ld	s0,16(sp)
    800069f0:	00813483          	ld	s1,8(sp)
    800069f4:	00013903          	ld	s2,0(sp)
    800069f8:	02010113          	addi	sp,sp,32
    800069fc:	00008067          	ret

0000000080006a00 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006a00:	fe010113          	addi	sp,sp,-32
    80006a04:	00113c23          	sd	ra,24(sp)
    80006a08:	00813823          	sd	s0,16(sp)
    80006a0c:	00913423          	sd	s1,8(sp)
    80006a10:	01213023          	sd	s2,0(sp)
    80006a14:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006a18:	00000913          	li	s2,0
    80006a1c:	0340006f          	j	80006a50 <_ZL11workerBodyBPv+0x50>
            thread_dispatch();
    80006a20:	ffffb097          	auipc	ra,0xffffb
    80006a24:	f7c080e7          	jalr	-132(ra) # 8000199c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 1000; j++) {
    80006a28:	00148493          	addi	s1,s1,1
    80006a2c:	3e700793          	li	a5,999
    80006a30:	0097ee63          	bltu	a5,s1,80006a4c <_ZL11workerBodyBPv+0x4c>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006a34:	00000713          	li	a4,0
    80006a38:	000077b7          	lui	a5,0x7
    80006a3c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006a40:	fee7e0e3          	bltu	a5,a4,80006a20 <_ZL11workerBodyBPv+0x20>
    80006a44:	00170713          	addi	a4,a4,1
    80006a48:	ff1ff06f          	j	80006a38 <_ZL11workerBodyBPv+0x38>
    for (uint64 i = 0; i < 16; i++) {
    80006a4c:	00190913          	addi	s2,s2,1
    80006a50:	00f00793          	li	a5,15
    80006a54:	0527e063          	bltu	a5,s2,80006a94 <_ZL11workerBodyBPv+0x94>
        printString("B: i="); printInt(i); printString("\n");
    80006a58:	00005517          	auipc	a0,0x5
    80006a5c:	bd850513          	addi	a0,a0,-1064 # 8000b630 <CONSOLE_STATUS+0x620>
    80006a60:	00001097          	auipc	ra,0x1
    80006a64:	2e8080e7          	jalr	744(ra) # 80007d48 <_Z11printStringPKc>
    80006a68:	00000613          	li	a2,0
    80006a6c:	00a00593          	li	a1,10
    80006a70:	0009051b          	sext.w	a0,s2
    80006a74:	00001097          	auipc	ra,0x1
    80006a78:	484080e7          	jalr	1156(ra) # 80007ef8 <_Z8printIntiii>
    80006a7c:	00005517          	auipc	a0,0x5
    80006a80:	e0450513          	addi	a0,a0,-508 # 8000b880 <CONSOLE_STATUS+0x870>
    80006a84:	00001097          	auipc	ra,0x1
    80006a88:	2c4080e7          	jalr	708(ra) # 80007d48 <_Z11printStringPKc>
        for (uint64 j = 0; j < 1000; j++) {
    80006a8c:	00000493          	li	s1,0
    80006a90:	f9dff06f          	j	80006a2c <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80006a94:	00005517          	auipc	a0,0x5
    80006a98:	ba450513          	addi	a0,a0,-1116 # 8000b638 <CONSOLE_STATUS+0x628>
    80006a9c:	00001097          	auipc	ra,0x1
    80006aa0:	2ac080e7          	jalr	684(ra) # 80007d48 <_Z11printStringPKc>
    finishedB = true;
    80006aa4:	00100793          	li	a5,1
    80006aa8:	00007717          	auipc	a4,0x7
    80006aac:	72f70323          	sb	a5,1830(a4) # 8000e1ce <_ZL9finishedB>
    thread_dispatch();
    80006ab0:	ffffb097          	auipc	ra,0xffffb
    80006ab4:	eec080e7          	jalr	-276(ra) # 8000199c <_Z15thread_dispatchv>
}
    80006ab8:	01813083          	ld	ra,24(sp)
    80006abc:	01013403          	ld	s0,16(sp)
    80006ac0:	00813483          	ld	s1,8(sp)
    80006ac4:	00013903          	ld	s2,0(sp)
    80006ac8:	02010113          	addi	sp,sp,32
    80006acc:	00008067          	ret

0000000080006ad0 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006ad0:	fe010113          	addi	sp,sp,-32
    80006ad4:	00113c23          	sd	ra,24(sp)
    80006ad8:	00813823          	sd	s0,16(sp)
    80006adc:	00913423          	sd	s1,8(sp)
    80006ae0:	01213023          	sd	s2,0(sp)
    80006ae4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006ae8:	00000913          	li	s2,0
    80006aec:	0340006f          	j	80006b20 <_ZL11workerBodyAPv+0x50>
            thread_dispatch();
    80006af0:	ffffb097          	auipc	ra,0xffffb
    80006af4:	eac080e7          	jalr	-340(ra) # 8000199c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 1000; j++) {
    80006af8:	00148493          	addi	s1,s1,1
    80006afc:	3e700793          	li	a5,999
    80006b00:	0097ee63          	bltu	a5,s1,80006b1c <_ZL11workerBodyAPv+0x4c>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006b04:	00000713          	li	a4,0
    80006b08:	000077b7          	lui	a5,0x7
    80006b0c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006b10:	fee7e0e3          	bltu	a5,a4,80006af0 <_ZL11workerBodyAPv+0x20>
    80006b14:	00170713          	addi	a4,a4,1
    80006b18:	ff1ff06f          	j	80006b08 <_ZL11workerBodyAPv+0x38>
    for (uint64 i = 0; i < 10; i++) {
    80006b1c:	00190913          	addi	s2,s2,1
    80006b20:	00900793          	li	a5,9
    80006b24:	0527e063          	bltu	a5,s2,80006b64 <_ZL11workerBodyAPv+0x94>
        printString("A: i="); printInt(i); printString("\n");
    80006b28:	00005517          	auipc	a0,0x5
    80006b2c:	b2050513          	addi	a0,a0,-1248 # 8000b648 <CONSOLE_STATUS+0x638>
    80006b30:	00001097          	auipc	ra,0x1
    80006b34:	218080e7          	jalr	536(ra) # 80007d48 <_Z11printStringPKc>
    80006b38:	00000613          	li	a2,0
    80006b3c:	00a00593          	li	a1,10
    80006b40:	0009051b          	sext.w	a0,s2
    80006b44:	00001097          	auipc	ra,0x1
    80006b48:	3b4080e7          	jalr	948(ra) # 80007ef8 <_Z8printIntiii>
    80006b4c:	00005517          	auipc	a0,0x5
    80006b50:	d3450513          	addi	a0,a0,-716 # 8000b880 <CONSOLE_STATUS+0x870>
    80006b54:	00001097          	auipc	ra,0x1
    80006b58:	1f4080e7          	jalr	500(ra) # 80007d48 <_Z11printStringPKc>
        for (uint64 j = 0; j < 1000; j++) {
    80006b5c:	00000493          	li	s1,0
    80006b60:	f9dff06f          	j	80006afc <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006b64:	00005517          	auipc	a0,0x5
    80006b68:	aec50513          	addi	a0,a0,-1300 # 8000b650 <CONSOLE_STATUS+0x640>
    80006b6c:	00001097          	auipc	ra,0x1
    80006b70:	1dc080e7          	jalr	476(ra) # 80007d48 <_Z11printStringPKc>
    finishedA = true;
    80006b74:	00100793          	li	a5,1
    80006b78:	00007717          	auipc	a4,0x7
    80006b7c:	64f70ba3          	sb	a5,1623(a4) # 8000e1cf <_ZL9finishedA>
}
    80006b80:	01813083          	ld	ra,24(sp)
    80006b84:	01013403          	ld	s0,16(sp)
    80006b88:	00813483          	ld	s1,8(sp)
    80006b8c:	00013903          	ld	s2,0(sp)
    80006b90:	02010113          	addi	sp,sp,32
    80006b94:	00008067          	ret

0000000080006b98 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80006b98:	fd010113          	addi	sp,sp,-48
    80006b9c:	02113423          	sd	ra,40(sp)
    80006ba0:	02813023          	sd	s0,32(sp)
    80006ba4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006ba8:	00000613          	li	a2,0
    80006bac:	00000597          	auipc	a1,0x0
    80006bb0:	f2458593          	addi	a1,a1,-220 # 80006ad0 <_ZL11workerBodyAPv>
    80006bb4:	fd040513          	addi	a0,s0,-48
    80006bb8:	ffffb097          	auipc	ra,0xffffb
    80006bbc:	d48080e7          	jalr	-696(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80006bc0:	00005517          	auipc	a0,0x5
    80006bc4:	aa050513          	addi	a0,a0,-1376 # 8000b660 <CONSOLE_STATUS+0x650>
    80006bc8:	00001097          	auipc	ra,0x1
    80006bcc:	180080e7          	jalr	384(ra) # 80007d48 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006bd0:	00000613          	li	a2,0
    80006bd4:	00000597          	auipc	a1,0x0
    80006bd8:	e2c58593          	addi	a1,a1,-468 # 80006a00 <_ZL11workerBodyBPv>
    80006bdc:	fd840513          	addi	a0,s0,-40
    80006be0:	ffffb097          	auipc	ra,0xffffb
    80006be4:	d20080e7          	jalr	-736(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80006be8:	00005517          	auipc	a0,0x5
    80006bec:	a9050513          	addi	a0,a0,-1392 # 8000b678 <CONSOLE_STATUS+0x668>
    80006bf0:	00001097          	auipc	ra,0x1
    80006bf4:	158080e7          	jalr	344(ra) # 80007d48 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006bf8:	00000613          	li	a2,0
    80006bfc:	00000597          	auipc	a1,0x0
    80006c00:	c8458593          	addi	a1,a1,-892 # 80006880 <_ZL11workerBodyCPv>
    80006c04:	fe040513          	addi	a0,s0,-32
    80006c08:	ffffb097          	auipc	ra,0xffffb
    80006c0c:	cf8080e7          	jalr	-776(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80006c10:	00005517          	auipc	a0,0x5
    80006c14:	a8050513          	addi	a0,a0,-1408 # 8000b690 <CONSOLE_STATUS+0x680>
    80006c18:	00001097          	auipc	ra,0x1
    80006c1c:	130080e7          	jalr	304(ra) # 80007d48 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006c20:	00000613          	li	a2,0
    80006c24:	00000597          	auipc	a1,0x0
    80006c28:	b1458593          	addi	a1,a1,-1260 # 80006738 <_ZL11workerBodyDPv>
    80006c2c:	fe840513          	addi	a0,s0,-24
    80006c30:	ffffb097          	auipc	ra,0xffffb
    80006c34:	cd0080e7          	jalr	-816(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006c38:	00005517          	auipc	a0,0x5
    80006c3c:	a7050513          	addi	a0,a0,-1424 # 8000b6a8 <CONSOLE_STATUS+0x698>
    80006c40:	00001097          	auipc	ra,0x1
    80006c44:	108080e7          	jalr	264(ra) # 80007d48 <_Z11printStringPKc>
    80006c48:	00c0006f          	j	80006c54 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006c4c:	ffffb097          	auipc	ra,0xffffb
    80006c50:	d50080e7          	jalr	-688(ra) # 8000199c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006c54:	00007797          	auipc	a5,0x7
    80006c58:	57b7c783          	lbu	a5,1403(a5) # 8000e1cf <_ZL9finishedA>
    80006c5c:	fe0788e3          	beqz	a5,80006c4c <_Z18Threads_C_API_testv+0xb4>
    80006c60:	00007797          	auipc	a5,0x7
    80006c64:	56e7c783          	lbu	a5,1390(a5) # 8000e1ce <_ZL9finishedB>
    80006c68:	fe0782e3          	beqz	a5,80006c4c <_Z18Threads_C_API_testv+0xb4>
    80006c6c:	00007797          	auipc	a5,0x7
    80006c70:	5617c783          	lbu	a5,1377(a5) # 8000e1cd <_ZL9finishedC>
    80006c74:	fc078ce3          	beqz	a5,80006c4c <_Z18Threads_C_API_testv+0xb4>
    80006c78:	00007797          	auipc	a5,0x7
    80006c7c:	5547c783          	lbu	a5,1364(a5) # 8000e1cc <_ZL9finishedD>
    80006c80:	fc0786e3          	beqz	a5,80006c4c <_Z18Threads_C_API_testv+0xb4>
    }
}
    80006c84:	02813083          	ld	ra,40(sp)
    80006c88:	02013403          	ld	s0,32(sp)
    80006c8c:	03010113          	addi	sp,sp,48
    80006c90:	00008067          	ret

0000000080006c94 <_ZL9sleepyRunPv>:

#include "../test_h/printing.h"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006c94:	fe010113          	addi	sp,sp,-32
    80006c98:	00113c23          	sd	ra,24(sp)
    80006c9c:	00813823          	sd	s0,16(sp)
    80006ca0:	00913423          	sd	s1,8(sp)
    80006ca4:	01213023          	sd	s2,0(sp)
    80006ca8:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006cac:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006cb0:	00600493          	li	s1,6
    while (--i > 0) {
    80006cb4:	fff4849b          	addiw	s1,s1,-1
    80006cb8:	04905a63          	blez	s1,80006d0c <_ZL9sleepyRunPv+0x78>

        printString("Hello ");
    80006cbc:	00005517          	auipc	a0,0x5
    80006cc0:	a0450513          	addi	a0,a0,-1532 # 8000b6c0 <CONSOLE_STATUS+0x6b0>
    80006cc4:	00001097          	auipc	ra,0x1
    80006cc8:	084080e7          	jalr	132(ra) # 80007d48 <_Z11printStringPKc>
        printInt(sleep_time);
    80006ccc:	00000613          	li	a2,0
    80006cd0:	00a00593          	li	a1,10
    80006cd4:	0009051b          	sext.w	a0,s2
    80006cd8:	00001097          	auipc	ra,0x1
    80006cdc:	220080e7          	jalr	544(ra) # 80007ef8 <_Z8printIntiii>
        printString(" !\n");
    80006ce0:	00005517          	auipc	a0,0x5
    80006ce4:	9e850513          	addi	a0,a0,-1560 # 8000b6c8 <CONSOLE_STATUS+0x6b8>
    80006ce8:	00001097          	auipc	ra,0x1
    80006cec:	060080e7          	jalr	96(ra) # 80007d48 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006cf0:	00090513          	mv	a0,s2
    80006cf4:	ffffb097          	auipc	ra,0xffffb
    80006cf8:	cec080e7          	jalr	-788(ra) # 800019e0 <_Z10time_sleepm>
        putc('.');
    80006cfc:	02e00513          	li	a0,46
    80006d00:	ffffb097          	auipc	ra,0xffffb
    80006d04:	df0080e7          	jalr	-528(ra) # 80001af0 <_Z4putcc>
    while (--i > 0) {
    80006d08:	fadff06f          	j	80006cb4 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/100-1] = true;
    80006d0c:	06400793          	li	a5,100
    80006d10:	02f95933          	divu	s2,s2,a5
    80006d14:	fff90913          	addi	s2,s2,-1
    80006d18:	00007797          	auipc	a5,0x7
    80006d1c:	4b878793          	addi	a5,a5,1208 # 8000e1d0 <_ZL8finished>
    80006d20:	01278933          	add	s2,a5,s2
    80006d24:	00100793          	li	a5,1
    80006d28:	00f90023          	sb	a5,0(s2)
}
    80006d2c:	01813083          	ld	ra,24(sp)
    80006d30:	01013403          	ld	s0,16(sp)
    80006d34:	00813483          	ld	s1,8(sp)
    80006d38:	00013903          	ld	s2,0(sp)
    80006d3c:	02010113          	addi	sp,sp,32
    80006d40:	00008067          	ret

0000000080006d44 <_Z12testSleepingv>:

void testSleeping() {
    80006d44:	fc010113          	addi	sp,sp,-64
    80006d48:	02113c23          	sd	ra,56(sp)
    80006d4c:	02813823          	sd	s0,48(sp)
    80006d50:	02913423          	sd	s1,40(sp)
    80006d54:	04010413          	addi	s0,sp,64
    printString("Starting...\n");
    80006d58:	00005517          	auipc	a0,0x5
    80006d5c:	97850513          	addi	a0,a0,-1672 # 8000b6d0 <CONSOLE_STATUS+0x6c0>
    80006d60:	00001097          	auipc	ra,0x1
    80006d64:	fe8080e7          	jalr	-24(ra) # 80007d48 <_Z11printStringPKc>
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {200, 400};
    80006d68:	0c800793          	li	a5,200
    80006d6c:	fcf43823          	sd	a5,-48(s0)
    80006d70:	19000793          	li	a5,400
    80006d74:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    printString("Creating threads: ");
    80006d78:	00005517          	auipc	a0,0x5
    80006d7c:	96850513          	addi	a0,a0,-1688 # 8000b6e0 <CONSOLE_STATUS+0x6d0>
    80006d80:	00001097          	auipc	ra,0x1
    80006d84:	fc8080e7          	jalr	-56(ra) # 80007d48 <_Z11printStringPKc>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006d88:	00000493          	li	s1,0
    80006d8c:	0500006f          	j	80006ddc <_Z12testSleepingv+0x98>
        printInt(i);
    80006d90:	00000613          	li	a2,0
    80006d94:	00a00593          	li	a1,10
    80006d98:	00048513          	mv	a0,s1
    80006d9c:	00001097          	auipc	ra,0x1
    80006da0:	15c080e7          	jalr	348(ra) # 80007ef8 <_Z8printIntiii>
        printString(" ");
    80006da4:	00005517          	auipc	a0,0x5
    80006da8:	95450513          	addi	a0,a0,-1708 # 8000b6f8 <CONSOLE_STATUS+0x6e8>
    80006dac:	00001097          	auipc	ra,0x1
    80006db0:	f9c080e7          	jalr	-100(ra) # 80007d48 <_Z11printStringPKc>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006db4:	00349793          	slli	a5,s1,0x3
    80006db8:	fd040613          	addi	a2,s0,-48
    80006dbc:	00f60633          	add	a2,a2,a5
    80006dc0:	00000597          	auipc	a1,0x0
    80006dc4:	ed458593          	addi	a1,a1,-300 # 80006c94 <_ZL9sleepyRunPv>
    80006dc8:	fc040513          	addi	a0,s0,-64
    80006dcc:	00f50533          	add	a0,a0,a5
    80006dd0:	ffffb097          	auipc	ra,0xffffb
    80006dd4:	b30080e7          	jalr	-1232(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006dd8:	0014849b          	addiw	s1,s1,1
    80006ddc:	00100793          	li	a5,1
    80006de0:	fa97d8e3          	bge	a5,s1,80006d90 <_Z12testSleepingv+0x4c>
    }
    printString("\nSuccesfully created all threads, now waiting for them to end\n");
    80006de4:	00005517          	auipc	a0,0x5
    80006de8:	91c50513          	addi	a0,a0,-1764 # 8000b700 <CONSOLE_STATUS+0x6f0>
    80006dec:	00001097          	auipc	ra,0x1
    80006df0:	f5c080e7          	jalr	-164(ra) # 80007d48 <_Z11printStringPKc>
    80006df4:	00c0006f          	j	80006e00 <_Z12testSleepingv+0xbc>
    while (!(finished[0] && finished[1])) {thread_dispatch();}
    80006df8:	ffffb097          	auipc	ra,0xffffb
    80006dfc:	ba4080e7          	jalr	-1116(ra) # 8000199c <_Z15thread_dispatchv>
    80006e00:	00007797          	auipc	a5,0x7
    80006e04:	3d07c783          	lbu	a5,976(a5) # 8000e1d0 <_ZL8finished>
    80006e08:	fe0788e3          	beqz	a5,80006df8 <_Z12testSleepingv+0xb4>
    80006e0c:	00007797          	auipc	a5,0x7
    80006e10:	3c57c783          	lbu	a5,965(a5) # 8000e1d1 <_ZL8finished+0x1>
    80006e14:	fe0782e3          	beqz	a5,80006df8 <_Z12testSleepingv+0xb4>
}
    80006e18:	03813083          	ld	ra,56(sp)
    80006e1c:	03013403          	ld	s0,48(sp)
    80006e20:	02813483          	ld	s1,40(sp)
    80006e24:	04010113          	addi	sp,sp,64
    80006e28:	00008067          	ret

0000000080006e2c <_ZN9BufferCPPC1Ei>:
#include "../test_h/buffer_CPP_API.h"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006e2c:	fd010113          	addi	sp,sp,-48
    80006e30:	02113423          	sd	ra,40(sp)
    80006e34:	02813023          	sd	s0,32(sp)
    80006e38:	00913c23          	sd	s1,24(sp)
    80006e3c:	01213823          	sd	s2,16(sp)
    80006e40:	01313423          	sd	s3,8(sp)
    80006e44:	03010413          	addi	s0,sp,48
    80006e48:	00050493          	mv	s1,a0
    80006e4c:	00058913          	mv	s2,a1
    80006e50:	0015879b          	addiw	a5,a1,1
    80006e54:	0007851b          	sext.w	a0,a5
    80006e58:	00f4a023          	sw	a5,0(s1)
    80006e5c:	0004a823          	sw	zero,16(s1)
    80006e60:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006e64:	00251513          	slli	a0,a0,0x2
    80006e68:	ffffb097          	auipc	ra,0xffffb
    80006e6c:	a3c080e7          	jalr	-1476(ra) # 800018a4 <_Z9mem_allocm>
    80006e70:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006e74:	01000513          	li	a0,16
    80006e78:	ffffa097          	auipc	ra,0xffffa
    80006e7c:	344080e7          	jalr	836(ra) # 800011bc <_Znwm>
    80006e80:	00050993          	mv	s3,a0
    80006e84:	00000593          	li	a1,0
    80006e88:	ffffa097          	auipc	ra,0xffffa
    80006e8c:	54c080e7          	jalr	1356(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006e90:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006e94:	01000513          	li	a0,16
    80006e98:	ffffa097          	auipc	ra,0xffffa
    80006e9c:	324080e7          	jalr	804(ra) # 800011bc <_Znwm>
    80006ea0:	00050993          	mv	s3,a0
    80006ea4:	00090593          	mv	a1,s2
    80006ea8:	ffffa097          	auipc	ra,0xffffa
    80006eac:	52c080e7          	jalr	1324(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006eb0:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006eb4:	01000513          	li	a0,16
    80006eb8:	ffffa097          	auipc	ra,0xffffa
    80006ebc:	304080e7          	jalr	772(ra) # 800011bc <_Znwm>
    80006ec0:	00050913          	mv	s2,a0
    80006ec4:	00100593          	li	a1,1
    80006ec8:	ffffa097          	auipc	ra,0xffffa
    80006ecc:	50c080e7          	jalr	1292(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006ed0:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006ed4:	01000513          	li	a0,16
    80006ed8:	ffffa097          	auipc	ra,0xffffa
    80006edc:	2e4080e7          	jalr	740(ra) # 800011bc <_Znwm>
    80006ee0:	00050913          	mv	s2,a0
    80006ee4:	00100593          	li	a1,1
    80006ee8:	ffffa097          	auipc	ra,0xffffa
    80006eec:	4ec080e7          	jalr	1260(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006ef0:	0324b823          	sd	s2,48(s1)
}
    80006ef4:	02813083          	ld	ra,40(sp)
    80006ef8:	02013403          	ld	s0,32(sp)
    80006efc:	01813483          	ld	s1,24(sp)
    80006f00:	01013903          	ld	s2,16(sp)
    80006f04:	00813983          	ld	s3,8(sp)
    80006f08:	03010113          	addi	sp,sp,48
    80006f0c:	00008067          	ret
    80006f10:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006f14:	00098513          	mv	a0,s3
    80006f18:	ffffa097          	auipc	ra,0xffffa
    80006f1c:	2cc080e7          	jalr	716(ra) # 800011e4 <_ZdlPv>
    80006f20:	00048513          	mv	a0,s1
    80006f24:	00008097          	auipc	ra,0x8
    80006f28:	394080e7          	jalr	916(ra) # 8000f2b8 <_Unwind_Resume>
    80006f2c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006f30:	00098513          	mv	a0,s3
    80006f34:	ffffa097          	auipc	ra,0xffffa
    80006f38:	2b0080e7          	jalr	688(ra) # 800011e4 <_ZdlPv>
    80006f3c:	00048513          	mv	a0,s1
    80006f40:	00008097          	auipc	ra,0x8
    80006f44:	378080e7          	jalr	888(ra) # 8000f2b8 <_Unwind_Resume>
    80006f48:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006f4c:	00090513          	mv	a0,s2
    80006f50:	ffffa097          	auipc	ra,0xffffa
    80006f54:	294080e7          	jalr	660(ra) # 800011e4 <_ZdlPv>
    80006f58:	00048513          	mv	a0,s1
    80006f5c:	00008097          	auipc	ra,0x8
    80006f60:	35c080e7          	jalr	860(ra) # 8000f2b8 <_Unwind_Resume>
    80006f64:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006f68:	00090513          	mv	a0,s2
    80006f6c:	ffffa097          	auipc	ra,0xffffa
    80006f70:	278080e7          	jalr	632(ra) # 800011e4 <_ZdlPv>
    80006f74:	00048513          	mv	a0,s1
    80006f78:	00008097          	auipc	ra,0x8
    80006f7c:	340080e7          	jalr	832(ra) # 8000f2b8 <_Unwind_Resume>

0000000080006f80 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006f80:	fe010113          	addi	sp,sp,-32
    80006f84:	00113c23          	sd	ra,24(sp)
    80006f88:	00813823          	sd	s0,16(sp)
    80006f8c:	00913423          	sd	s1,8(sp)
    80006f90:	01213023          	sd	s2,0(sp)
    80006f94:	02010413          	addi	s0,sp,32
    80006f98:	00050493          	mv	s1,a0
    80006f9c:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80006fa0:	01853503          	ld	a0,24(a0)
    80006fa4:	ffffa097          	auipc	ra,0xffffa
    80006fa8:	468080e7          	jalr	1128(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006fac:	0304b503          	ld	a0,48(s1)
    80006fb0:	ffffa097          	auipc	ra,0xffffa
    80006fb4:	45c080e7          	jalr	1116(ra) # 8000140c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80006fb8:	0084b783          	ld	a5,8(s1)
    80006fbc:	0144a703          	lw	a4,20(s1)
    80006fc0:	00271713          	slli	a4,a4,0x2
    80006fc4:	00e787b3          	add	a5,a5,a4
    80006fc8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006fcc:	0144a783          	lw	a5,20(s1)
    80006fd0:	0017879b          	addiw	a5,a5,1
    80006fd4:	0004a703          	lw	a4,0(s1)
    80006fd8:	02e7e7bb          	remw	a5,a5,a4
    80006fdc:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006fe0:	0304b503          	ld	a0,48(s1)
    80006fe4:	ffffa097          	auipc	ra,0xffffa
    80006fe8:	454080e7          	jalr	1108(ra) # 80001438 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006fec:	0204b503          	ld	a0,32(s1)
    80006ff0:	ffffa097          	auipc	ra,0xffffa
    80006ff4:	448080e7          	jalr	1096(ra) # 80001438 <_ZN9Semaphore6signalEv>

}
    80006ff8:	01813083          	ld	ra,24(sp)
    80006ffc:	01013403          	ld	s0,16(sp)
    80007000:	00813483          	ld	s1,8(sp)
    80007004:	00013903          	ld	s2,0(sp)
    80007008:	02010113          	addi	sp,sp,32
    8000700c:	00008067          	ret

0000000080007010 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80007010:	fe010113          	addi	sp,sp,-32
    80007014:	00113c23          	sd	ra,24(sp)
    80007018:	00813823          	sd	s0,16(sp)
    8000701c:	00913423          	sd	s1,8(sp)
    80007020:	01213023          	sd	s2,0(sp)
    80007024:	02010413          	addi	s0,sp,32
    80007028:	00050493          	mv	s1,a0
    itemAvailable->wait();
    8000702c:	02053503          	ld	a0,32(a0)
    80007030:	ffffa097          	auipc	ra,0xffffa
    80007034:	3dc080e7          	jalr	988(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80007038:	0284b503          	ld	a0,40(s1)
    8000703c:	ffffa097          	auipc	ra,0xffffa
    80007040:	3d0080e7          	jalr	976(ra) # 8000140c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80007044:	0084b703          	ld	a4,8(s1)
    80007048:	0104a783          	lw	a5,16(s1)
    8000704c:	00279693          	slli	a3,a5,0x2
    80007050:	00d70733          	add	a4,a4,a3
    80007054:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80007058:	0017879b          	addiw	a5,a5,1
    8000705c:	0004a703          	lw	a4,0(s1)
    80007060:	02e7e7bb          	remw	a5,a5,a4
    80007064:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80007068:	0284b503          	ld	a0,40(s1)
    8000706c:	ffffa097          	auipc	ra,0xffffa
    80007070:	3cc080e7          	jalr	972(ra) # 80001438 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80007074:	0184b503          	ld	a0,24(s1)
    80007078:	ffffa097          	auipc	ra,0xffffa
    8000707c:	3c0080e7          	jalr	960(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    80007080:	00090513          	mv	a0,s2
    80007084:	01813083          	ld	ra,24(sp)
    80007088:	01013403          	ld	s0,16(sp)
    8000708c:	00813483          	ld	s1,8(sp)
    80007090:	00013903          	ld	s2,0(sp)
    80007094:	02010113          	addi	sp,sp,32
    80007098:	00008067          	ret

000000008000709c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    8000709c:	fe010113          	addi	sp,sp,-32
    800070a0:	00113c23          	sd	ra,24(sp)
    800070a4:	00813823          	sd	s0,16(sp)
    800070a8:	00913423          	sd	s1,8(sp)
    800070ac:	01213023          	sd	s2,0(sp)
    800070b0:	02010413          	addi	s0,sp,32
    800070b4:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800070b8:	02853503          	ld	a0,40(a0)
    800070bc:	ffffa097          	auipc	ra,0xffffa
    800070c0:	350080e7          	jalr	848(ra) # 8000140c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800070c4:	0304b503          	ld	a0,48(s1)
    800070c8:	ffffa097          	auipc	ra,0xffffa
    800070cc:	344080e7          	jalr	836(ra) # 8000140c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800070d0:	0144a783          	lw	a5,20(s1)
    800070d4:	0104a903          	lw	s2,16(s1)
    800070d8:	0327ce63          	blt	a5,s2,80007114 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800070dc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800070e0:	0304b503          	ld	a0,48(s1)
    800070e4:	ffffa097          	auipc	ra,0xffffa
    800070e8:	354080e7          	jalr	852(ra) # 80001438 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    800070ec:	0284b503          	ld	a0,40(s1)
    800070f0:	ffffa097          	auipc	ra,0xffffa
    800070f4:	348080e7          	jalr	840(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    800070f8:	00090513          	mv	a0,s2
    800070fc:	01813083          	ld	ra,24(sp)
    80007100:	01013403          	ld	s0,16(sp)
    80007104:	00813483          	ld	s1,8(sp)
    80007108:	00013903          	ld	s2,0(sp)
    8000710c:	02010113          	addi	sp,sp,32
    80007110:	00008067          	ret
        ret = cap - head + tail;
    80007114:	0004a703          	lw	a4,0(s1)
    80007118:	4127093b          	subw	s2,a4,s2
    8000711c:	00f9093b          	addw	s2,s2,a5
    80007120:	fc1ff06f          	j	800070e0 <_ZN9BufferCPP6getCntEv+0x44>

0000000080007124 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80007124:	fe010113          	addi	sp,sp,-32
    80007128:	00113c23          	sd	ra,24(sp)
    8000712c:	00813823          	sd	s0,16(sp)
    80007130:	00913423          	sd	s1,8(sp)
    80007134:	02010413          	addi	s0,sp,32
    80007138:	00050493          	mv	s1,a0
    Console::putc('\n');
    8000713c:	00a00513          	li	a0,10
    80007140:	ffffa097          	auipc	ra,0xffffa
    80007144:	394080e7          	jalr	916(ra) # 800014d4 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80007148:	00004517          	auipc	a0,0x4
    8000714c:	37050513          	addi	a0,a0,880 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    80007150:	00001097          	auipc	ra,0x1
    80007154:	bf8080e7          	jalr	-1032(ra) # 80007d48 <_Z11printStringPKc>
    while (getCnt()) {
    80007158:	00048513          	mv	a0,s1
    8000715c:	00000097          	auipc	ra,0x0
    80007160:	f40080e7          	jalr	-192(ra) # 8000709c <_ZN9BufferCPP6getCntEv>
    80007164:	02050c63          	beqz	a0,8000719c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80007168:	0084b783          	ld	a5,8(s1)
    8000716c:	0104a703          	lw	a4,16(s1)
    80007170:	00271713          	slli	a4,a4,0x2
    80007174:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80007178:	0007c503          	lbu	a0,0(a5)
    8000717c:	ffffa097          	auipc	ra,0xffffa
    80007180:	358080e7          	jalr	856(ra) # 800014d4 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80007184:	0104a783          	lw	a5,16(s1)
    80007188:	0017879b          	addiw	a5,a5,1
    8000718c:	0004a703          	lw	a4,0(s1)
    80007190:	02e7e7bb          	remw	a5,a5,a4
    80007194:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80007198:	fc1ff06f          	j	80007158 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    8000719c:	02100513          	li	a0,33
    800071a0:	ffffa097          	auipc	ra,0xffffa
    800071a4:	334080e7          	jalr	820(ra) # 800014d4 <_ZN7Console4putcEc>
    Console::putc('\n');
    800071a8:	00a00513          	li	a0,10
    800071ac:	ffffa097          	auipc	ra,0xffffa
    800071b0:	328080e7          	jalr	808(ra) # 800014d4 <_ZN7Console4putcEc>
    mem_free(buffer);
    800071b4:	0084b503          	ld	a0,8(s1)
    800071b8:	ffffa097          	auipc	ra,0xffffa
    800071bc:	71c080e7          	jalr	1820(ra) # 800018d4 <_Z8mem_freePv>
    delete itemAvailable;
    800071c0:	0204b503          	ld	a0,32(s1)
    800071c4:	00050863          	beqz	a0,800071d4 <_ZN9BufferCPPD1Ev+0xb0>
    800071c8:	00053783          	ld	a5,0(a0)
    800071cc:	0087b783          	ld	a5,8(a5)
    800071d0:	000780e7          	jalr	a5
    delete spaceAvailable;
    800071d4:	0184b503          	ld	a0,24(s1)
    800071d8:	00050863          	beqz	a0,800071e8 <_ZN9BufferCPPD1Ev+0xc4>
    800071dc:	00053783          	ld	a5,0(a0)
    800071e0:	0087b783          	ld	a5,8(a5)
    800071e4:	000780e7          	jalr	a5
    delete mutexTail;
    800071e8:	0304b503          	ld	a0,48(s1)
    800071ec:	00050863          	beqz	a0,800071fc <_ZN9BufferCPPD1Ev+0xd8>
    800071f0:	00053783          	ld	a5,0(a0)
    800071f4:	0087b783          	ld	a5,8(a5)
    800071f8:	000780e7          	jalr	a5
    delete mutexHead;
    800071fc:	0284b503          	ld	a0,40(s1)
    80007200:	00050863          	beqz	a0,80007210 <_ZN9BufferCPPD1Ev+0xec>
    80007204:	00053783          	ld	a5,0(a0)
    80007208:	0087b783          	ld	a5,8(a5)
    8000720c:	000780e7          	jalr	a5
}
    80007210:	01813083          	ld	ra,24(sp)
    80007214:	01013403          	ld	s0,16(sp)
    80007218:	00813483          	ld	s1,8(sp)
    8000721c:	02010113          	addi	sp,sp,32
    80007220:	00008067          	ret

0000000080007224 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80007224:	fe010113          	addi	sp,sp,-32
    80007228:	00113c23          	sd	ra,24(sp)
    8000722c:	00813823          	sd	s0,16(sp)
    80007230:	00913423          	sd	s1,8(sp)
    80007234:	01213023          	sd	s2,0(sp)
    80007238:	02010413          	addi	s0,sp,32
    8000723c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80007240:	00100793          	li	a5,1
    80007244:	02a7f863          	bgeu	a5,a0,80007274 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80007248:	00a00793          	li	a5,10
    8000724c:	02f577b3          	remu	a5,a0,a5
    80007250:	02078e63          	beqz	a5,8000728c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80007254:	fff48513          	addi	a0,s1,-1
    80007258:	00000097          	auipc	ra,0x0
    8000725c:	fcc080e7          	jalr	-52(ra) # 80007224 <_ZL9fibonaccim>
    80007260:	00050913          	mv	s2,a0
    80007264:	ffe48513          	addi	a0,s1,-2
    80007268:	00000097          	auipc	ra,0x0
    8000726c:	fbc080e7          	jalr	-68(ra) # 80007224 <_ZL9fibonaccim>
    80007270:	00a90533          	add	a0,s2,a0
}
    80007274:	01813083          	ld	ra,24(sp)
    80007278:	01013403          	ld	s0,16(sp)
    8000727c:	00813483          	ld	s1,8(sp)
    80007280:	00013903          	ld	s2,0(sp)
    80007284:	02010113          	addi	sp,sp,32
    80007288:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000728c:	ffffa097          	auipc	ra,0xffffa
    80007290:	710080e7          	jalr	1808(ra) # 8000199c <_Z15thread_dispatchv>
    80007294:	fc1ff06f          	j	80007254 <_ZL9fibonaccim+0x30>

0000000080007298 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80007298:	fe010113          	addi	sp,sp,-32
    8000729c:	00113c23          	sd	ra,24(sp)
    800072a0:	00813823          	sd	s0,16(sp)
    800072a4:	00913423          	sd	s1,8(sp)
    800072a8:	01213023          	sd	s2,0(sp)
    800072ac:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800072b0:	00000913          	li	s2,0
    800072b4:	0380006f          	j	800072ec <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800072b8:	ffffa097          	auipc	ra,0xffffa
    800072bc:	6e4080e7          	jalr	1764(ra) # 8000199c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800072c0:	00148493          	addi	s1,s1,1
    800072c4:	000027b7          	lui	a5,0x2
    800072c8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800072cc:	0097ee63          	bltu	a5,s1,800072e8 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800072d0:	00000713          	li	a4,0
    800072d4:	000077b7          	lui	a5,0x7
    800072d8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800072dc:	fce7eee3          	bltu	a5,a4,800072b8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800072e0:	00170713          	addi	a4,a4,1
    800072e4:	ff1ff06f          	j	800072d4 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800072e8:	00190913          	addi	s2,s2,1
    800072ec:	00900793          	li	a5,9
    800072f0:	0527e063          	bltu	a5,s2,80007330 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800072f4:	00004517          	auipc	a0,0x4
    800072f8:	35450513          	addi	a0,a0,852 # 8000b648 <CONSOLE_STATUS+0x638>
    800072fc:	00001097          	auipc	ra,0x1
    80007300:	a4c080e7          	jalr	-1460(ra) # 80007d48 <_Z11printStringPKc>
    80007304:	00000613          	li	a2,0
    80007308:	00a00593          	li	a1,10
    8000730c:	0009051b          	sext.w	a0,s2
    80007310:	00001097          	auipc	ra,0x1
    80007314:	be8080e7          	jalr	-1048(ra) # 80007ef8 <_Z8printIntiii>
    80007318:	00004517          	auipc	a0,0x4
    8000731c:	56850513          	addi	a0,a0,1384 # 8000b880 <CONSOLE_STATUS+0x870>
    80007320:	00001097          	auipc	ra,0x1
    80007324:	a28080e7          	jalr	-1496(ra) # 80007d48 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80007328:	00000493          	li	s1,0
    8000732c:	f99ff06f          	j	800072c4 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80007330:	00004517          	auipc	a0,0x4
    80007334:	32050513          	addi	a0,a0,800 # 8000b650 <CONSOLE_STATUS+0x640>
    80007338:	00001097          	auipc	ra,0x1
    8000733c:	a10080e7          	jalr	-1520(ra) # 80007d48 <_Z11printStringPKc>
    finishedA = true;
    80007340:	00100793          	li	a5,1
    80007344:	00007717          	auipc	a4,0x7
    80007348:	e8f70723          	sb	a5,-370(a4) # 8000e1d2 <_ZL9finishedA>
}
    8000734c:	01813083          	ld	ra,24(sp)
    80007350:	01013403          	ld	s0,16(sp)
    80007354:	00813483          	ld	s1,8(sp)
    80007358:	00013903          	ld	s2,0(sp)
    8000735c:	02010113          	addi	sp,sp,32
    80007360:	00008067          	ret

0000000080007364 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80007364:	fe010113          	addi	sp,sp,-32
    80007368:	00113c23          	sd	ra,24(sp)
    8000736c:	00813823          	sd	s0,16(sp)
    80007370:	00913423          	sd	s1,8(sp)
    80007374:	01213023          	sd	s2,0(sp)
    80007378:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000737c:	00000913          	li	s2,0
    80007380:	0380006f          	j	800073b8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80007384:	ffffa097          	auipc	ra,0xffffa
    80007388:	618080e7          	jalr	1560(ra) # 8000199c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000738c:	00148493          	addi	s1,s1,1
    80007390:	000027b7          	lui	a5,0x2
    80007394:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80007398:	0097ee63          	bltu	a5,s1,800073b4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000739c:	00000713          	li	a4,0
    800073a0:	000077b7          	lui	a5,0x7
    800073a4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800073a8:	fce7eee3          	bltu	a5,a4,80007384 <_ZN7WorkerB11workerBodyBEPv+0x20>
    800073ac:	00170713          	addi	a4,a4,1
    800073b0:	ff1ff06f          	j	800073a0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800073b4:	00190913          	addi	s2,s2,1
    800073b8:	00f00793          	li	a5,15
    800073bc:	0527e063          	bltu	a5,s2,800073fc <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800073c0:	00004517          	auipc	a0,0x4
    800073c4:	27050513          	addi	a0,a0,624 # 8000b630 <CONSOLE_STATUS+0x620>
    800073c8:	00001097          	auipc	ra,0x1
    800073cc:	980080e7          	jalr	-1664(ra) # 80007d48 <_Z11printStringPKc>
    800073d0:	00000613          	li	a2,0
    800073d4:	00a00593          	li	a1,10
    800073d8:	0009051b          	sext.w	a0,s2
    800073dc:	00001097          	auipc	ra,0x1
    800073e0:	b1c080e7          	jalr	-1252(ra) # 80007ef8 <_Z8printIntiii>
    800073e4:	00004517          	auipc	a0,0x4
    800073e8:	49c50513          	addi	a0,a0,1180 # 8000b880 <CONSOLE_STATUS+0x870>
    800073ec:	00001097          	auipc	ra,0x1
    800073f0:	95c080e7          	jalr	-1700(ra) # 80007d48 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800073f4:	00000493          	li	s1,0
    800073f8:	f99ff06f          	j	80007390 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800073fc:	00004517          	auipc	a0,0x4
    80007400:	23c50513          	addi	a0,a0,572 # 8000b638 <CONSOLE_STATUS+0x628>
    80007404:	00001097          	auipc	ra,0x1
    80007408:	944080e7          	jalr	-1724(ra) # 80007d48 <_Z11printStringPKc>
    finishedB = true;
    8000740c:	00100793          	li	a5,1
    80007410:	00007717          	auipc	a4,0x7
    80007414:	dcf701a3          	sb	a5,-573(a4) # 8000e1d3 <_ZL9finishedB>
    thread_dispatch();
    80007418:	ffffa097          	auipc	ra,0xffffa
    8000741c:	584080e7          	jalr	1412(ra) # 8000199c <_Z15thread_dispatchv>
}
    80007420:	01813083          	ld	ra,24(sp)
    80007424:	01013403          	ld	s0,16(sp)
    80007428:	00813483          	ld	s1,8(sp)
    8000742c:	00013903          	ld	s2,0(sp)
    80007430:	02010113          	addi	sp,sp,32
    80007434:	00008067          	ret

0000000080007438 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80007438:	fe010113          	addi	sp,sp,-32
    8000743c:	00113c23          	sd	ra,24(sp)
    80007440:	00813823          	sd	s0,16(sp)
    80007444:	00913423          	sd	s1,8(sp)
    80007448:	01213023          	sd	s2,0(sp)
    8000744c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80007450:	00000493          	li	s1,0
    80007454:	0400006f          	j	80007494 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80007458:	00004517          	auipc	a0,0x4
    8000745c:	19850513          	addi	a0,a0,408 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    80007460:	00001097          	auipc	ra,0x1
    80007464:	8e8080e7          	jalr	-1816(ra) # 80007d48 <_Z11printStringPKc>
    80007468:	00000613          	li	a2,0
    8000746c:	00a00593          	li	a1,10
    80007470:	00048513          	mv	a0,s1
    80007474:	00001097          	auipc	ra,0x1
    80007478:	a84080e7          	jalr	-1404(ra) # 80007ef8 <_Z8printIntiii>
    8000747c:	00004517          	auipc	a0,0x4
    80007480:	40450513          	addi	a0,a0,1028 # 8000b880 <CONSOLE_STATUS+0x870>
    80007484:	00001097          	auipc	ra,0x1
    80007488:	8c4080e7          	jalr	-1852(ra) # 80007d48 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000748c:	0014849b          	addiw	s1,s1,1
    80007490:	0ff4f493          	andi	s1,s1,255
    80007494:	00200793          	li	a5,2
    80007498:	fc97f0e3          	bgeu	a5,s1,80007458 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    8000749c:	00004517          	auipc	a0,0x4
    800074a0:	15c50513          	addi	a0,a0,348 # 8000b5f8 <CONSOLE_STATUS+0x5e8>
    800074a4:	00001097          	auipc	ra,0x1
    800074a8:	8a4080e7          	jalr	-1884(ra) # 80007d48 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800074ac:	00700313          	li	t1,7
    thread_dispatch();
    800074b0:	ffffa097          	auipc	ra,0xffffa
    800074b4:	4ec080e7          	jalr	1260(ra) # 8000199c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800074b8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800074bc:	00004517          	auipc	a0,0x4
    800074c0:	14c50513          	addi	a0,a0,332 # 8000b608 <CONSOLE_STATUS+0x5f8>
    800074c4:	00001097          	auipc	ra,0x1
    800074c8:	884080e7          	jalr	-1916(ra) # 80007d48 <_Z11printStringPKc>
    800074cc:	00000613          	li	a2,0
    800074d0:	00a00593          	li	a1,10
    800074d4:	0009051b          	sext.w	a0,s2
    800074d8:	00001097          	auipc	ra,0x1
    800074dc:	a20080e7          	jalr	-1504(ra) # 80007ef8 <_Z8printIntiii>
    800074e0:	00004517          	auipc	a0,0x4
    800074e4:	3a050513          	addi	a0,a0,928 # 8000b880 <CONSOLE_STATUS+0x870>
    800074e8:	00001097          	auipc	ra,0x1
    800074ec:	860080e7          	jalr	-1952(ra) # 80007d48 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800074f0:	00c00513          	li	a0,12
    800074f4:	00000097          	auipc	ra,0x0
    800074f8:	d30080e7          	jalr	-720(ra) # 80007224 <_ZL9fibonaccim>
    800074fc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80007500:	00004517          	auipc	a0,0x4
    80007504:	11050513          	addi	a0,a0,272 # 8000b610 <CONSOLE_STATUS+0x600>
    80007508:	00001097          	auipc	ra,0x1
    8000750c:	840080e7          	jalr	-1984(ra) # 80007d48 <_Z11printStringPKc>
    80007510:	00000613          	li	a2,0
    80007514:	00a00593          	li	a1,10
    80007518:	0009051b          	sext.w	a0,s2
    8000751c:	00001097          	auipc	ra,0x1
    80007520:	9dc080e7          	jalr	-1572(ra) # 80007ef8 <_Z8printIntiii>
    80007524:	00004517          	auipc	a0,0x4
    80007528:	35c50513          	addi	a0,a0,860 # 8000b880 <CONSOLE_STATUS+0x870>
    8000752c:	00001097          	auipc	ra,0x1
    80007530:	81c080e7          	jalr	-2020(ra) # 80007d48 <_Z11printStringPKc>
    80007534:	0400006f          	j	80007574 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80007538:	00004517          	auipc	a0,0x4
    8000753c:	0b850513          	addi	a0,a0,184 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    80007540:	00001097          	auipc	ra,0x1
    80007544:	808080e7          	jalr	-2040(ra) # 80007d48 <_Z11printStringPKc>
    80007548:	00000613          	li	a2,0
    8000754c:	00a00593          	li	a1,10
    80007550:	00048513          	mv	a0,s1
    80007554:	00001097          	auipc	ra,0x1
    80007558:	9a4080e7          	jalr	-1628(ra) # 80007ef8 <_Z8printIntiii>
    8000755c:	00004517          	auipc	a0,0x4
    80007560:	32450513          	addi	a0,a0,804 # 8000b880 <CONSOLE_STATUS+0x870>
    80007564:	00000097          	auipc	ra,0x0
    80007568:	7e4080e7          	jalr	2020(ra) # 80007d48 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000756c:	0014849b          	addiw	s1,s1,1
    80007570:	0ff4f493          	andi	s1,s1,255
    80007574:	00500793          	li	a5,5
    80007578:	fc97f0e3          	bgeu	a5,s1,80007538 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    8000757c:	00004517          	auipc	a0,0x4
    80007580:	0d450513          	addi	a0,a0,212 # 8000b650 <CONSOLE_STATUS+0x640>
    80007584:	00000097          	auipc	ra,0x0
    80007588:	7c4080e7          	jalr	1988(ra) # 80007d48 <_Z11printStringPKc>
    finishedC = true;
    8000758c:	00100793          	li	a5,1
    80007590:	00007717          	auipc	a4,0x7
    80007594:	c4f70223          	sb	a5,-956(a4) # 8000e1d4 <_ZL9finishedC>
    thread_dispatch();
    80007598:	ffffa097          	auipc	ra,0xffffa
    8000759c:	404080e7          	jalr	1028(ra) # 8000199c <_Z15thread_dispatchv>
}
    800075a0:	01813083          	ld	ra,24(sp)
    800075a4:	01013403          	ld	s0,16(sp)
    800075a8:	00813483          	ld	s1,8(sp)
    800075ac:	00013903          	ld	s2,0(sp)
    800075b0:	02010113          	addi	sp,sp,32
    800075b4:	00008067          	ret

00000000800075b8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800075b8:	fe010113          	addi	sp,sp,-32
    800075bc:	00113c23          	sd	ra,24(sp)
    800075c0:	00813823          	sd	s0,16(sp)
    800075c4:	00913423          	sd	s1,8(sp)
    800075c8:	01213023          	sd	s2,0(sp)
    800075cc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800075d0:	00a00493          	li	s1,10
    800075d4:	0400006f          	j	80007614 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800075d8:	00004517          	auipc	a0,0x4
    800075dc:	fe050513          	addi	a0,a0,-32 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    800075e0:	00000097          	auipc	ra,0x0
    800075e4:	768080e7          	jalr	1896(ra) # 80007d48 <_Z11printStringPKc>
    800075e8:	00000613          	li	a2,0
    800075ec:	00a00593          	li	a1,10
    800075f0:	00048513          	mv	a0,s1
    800075f4:	00001097          	auipc	ra,0x1
    800075f8:	904080e7          	jalr	-1788(ra) # 80007ef8 <_Z8printIntiii>
    800075fc:	00004517          	auipc	a0,0x4
    80007600:	28450513          	addi	a0,a0,644 # 8000b880 <CONSOLE_STATUS+0x870>
    80007604:	00000097          	auipc	ra,0x0
    80007608:	744080e7          	jalr	1860(ra) # 80007d48 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000760c:	0014849b          	addiw	s1,s1,1
    80007610:	0ff4f493          	andi	s1,s1,255
    80007614:	00c00793          	li	a5,12
    80007618:	fc97f0e3          	bgeu	a5,s1,800075d8 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    8000761c:	00004517          	auipc	a0,0x4
    80007620:	fa450513          	addi	a0,a0,-92 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80007624:	00000097          	auipc	ra,0x0
    80007628:	724080e7          	jalr	1828(ra) # 80007d48 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000762c:	00500313          	li	t1,5
    thread_dispatch();
    80007630:	ffffa097          	auipc	ra,0xffffa
    80007634:	36c080e7          	jalr	876(ra) # 8000199c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80007638:	01000513          	li	a0,16
    8000763c:	00000097          	auipc	ra,0x0
    80007640:	be8080e7          	jalr	-1048(ra) # 80007224 <_ZL9fibonaccim>
    80007644:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80007648:	00004517          	auipc	a0,0x4
    8000764c:	f8850513          	addi	a0,a0,-120 # 8000b5d0 <CONSOLE_STATUS+0x5c0>
    80007650:	00000097          	auipc	ra,0x0
    80007654:	6f8080e7          	jalr	1784(ra) # 80007d48 <_Z11printStringPKc>
    80007658:	00000613          	li	a2,0
    8000765c:	00a00593          	li	a1,10
    80007660:	0009051b          	sext.w	a0,s2
    80007664:	00001097          	auipc	ra,0x1
    80007668:	894080e7          	jalr	-1900(ra) # 80007ef8 <_Z8printIntiii>
    8000766c:	00004517          	auipc	a0,0x4
    80007670:	21450513          	addi	a0,a0,532 # 8000b880 <CONSOLE_STATUS+0x870>
    80007674:	00000097          	auipc	ra,0x0
    80007678:	6d4080e7          	jalr	1748(ra) # 80007d48 <_Z11printStringPKc>
    8000767c:	0400006f          	j	800076bc <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80007680:	00004517          	auipc	a0,0x4
    80007684:	f3850513          	addi	a0,a0,-200 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80007688:	00000097          	auipc	ra,0x0
    8000768c:	6c0080e7          	jalr	1728(ra) # 80007d48 <_Z11printStringPKc>
    80007690:	00000613          	li	a2,0
    80007694:	00a00593          	li	a1,10
    80007698:	00048513          	mv	a0,s1
    8000769c:	00001097          	auipc	ra,0x1
    800076a0:	85c080e7          	jalr	-1956(ra) # 80007ef8 <_Z8printIntiii>
    800076a4:	00004517          	auipc	a0,0x4
    800076a8:	1dc50513          	addi	a0,a0,476 # 8000b880 <CONSOLE_STATUS+0x870>
    800076ac:	00000097          	auipc	ra,0x0
    800076b0:	69c080e7          	jalr	1692(ra) # 80007d48 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800076b4:	0014849b          	addiw	s1,s1,1
    800076b8:	0ff4f493          	andi	s1,s1,255
    800076bc:	00f00793          	li	a5,15
    800076c0:	fc97f0e3          	bgeu	a5,s1,80007680 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800076c4:	00004517          	auipc	a0,0x4
    800076c8:	f1c50513          	addi	a0,a0,-228 # 8000b5e0 <CONSOLE_STATUS+0x5d0>
    800076cc:	00000097          	auipc	ra,0x0
    800076d0:	67c080e7          	jalr	1660(ra) # 80007d48 <_Z11printStringPKc>
    finishedD = true;
    800076d4:	00100793          	li	a5,1
    800076d8:	00007717          	auipc	a4,0x7
    800076dc:	aef70ea3          	sb	a5,-1283(a4) # 8000e1d5 <_ZL9finishedD>
    thread_dispatch();
    800076e0:	ffffa097          	auipc	ra,0xffffa
    800076e4:	2bc080e7          	jalr	700(ra) # 8000199c <_Z15thread_dispatchv>
}
    800076e8:	01813083          	ld	ra,24(sp)
    800076ec:	01013403          	ld	s0,16(sp)
    800076f0:	00813483          	ld	s1,8(sp)
    800076f4:	00013903          	ld	s2,0(sp)
    800076f8:	02010113          	addi	sp,sp,32
    800076fc:	00008067          	ret

0000000080007700 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80007700:	fc010113          	addi	sp,sp,-64
    80007704:	02113c23          	sd	ra,56(sp)
    80007708:	02813823          	sd	s0,48(sp)
    8000770c:	02913423          	sd	s1,40(sp)
    80007710:	03213023          	sd	s2,32(sp)
    80007714:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80007718:	02000513          	li	a0,32
    8000771c:	ffffa097          	auipc	ra,0xffffa
    80007720:	aa0080e7          	jalr	-1376(ra) # 800011bc <_Znwm>
    80007724:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80007728:	ffffa097          	auipc	ra,0xffffa
    8000772c:	c78080e7          	jalr	-904(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007730:	00007797          	auipc	a5,0x7
    80007734:	87878793          	addi	a5,a5,-1928 # 8000dfa8 <_ZTV7WorkerA+0x10>
    80007738:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000773c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80007740:	00004517          	auipc	a0,0x4
    80007744:	f2050513          	addi	a0,a0,-224 # 8000b660 <CONSOLE_STATUS+0x650>
    80007748:	00000097          	auipc	ra,0x0
    8000774c:	600080e7          	jalr	1536(ra) # 80007d48 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80007750:	02000513          	li	a0,32
    80007754:	ffffa097          	auipc	ra,0xffffa
    80007758:	a68080e7          	jalr	-1432(ra) # 800011bc <_Znwm>
    8000775c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80007760:	ffffa097          	auipc	ra,0xffffa
    80007764:	c40080e7          	jalr	-960(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007768:	00007797          	auipc	a5,0x7
    8000776c:	86878793          	addi	a5,a5,-1944 # 8000dfd0 <_ZTV7WorkerB+0x10>
    80007770:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80007774:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80007778:	00004517          	auipc	a0,0x4
    8000777c:	f0050513          	addi	a0,a0,-256 # 8000b678 <CONSOLE_STATUS+0x668>
    80007780:	00000097          	auipc	ra,0x0
    80007784:	5c8080e7          	jalr	1480(ra) # 80007d48 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80007788:	02000513          	li	a0,32
    8000778c:	ffffa097          	auipc	ra,0xffffa
    80007790:	a30080e7          	jalr	-1488(ra) # 800011bc <_Znwm>
    80007794:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80007798:	ffffa097          	auipc	ra,0xffffa
    8000779c:	c08080e7          	jalr	-1016(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800077a0:	00007797          	auipc	a5,0x7
    800077a4:	85878793          	addi	a5,a5,-1960 # 8000dff8 <_ZTV7WorkerC+0x10>
    800077a8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800077ac:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800077b0:	00004517          	auipc	a0,0x4
    800077b4:	ee050513          	addi	a0,a0,-288 # 8000b690 <CONSOLE_STATUS+0x680>
    800077b8:	00000097          	auipc	ra,0x0
    800077bc:	590080e7          	jalr	1424(ra) # 80007d48 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800077c0:	02000513          	li	a0,32
    800077c4:	ffffa097          	auipc	ra,0xffffa
    800077c8:	9f8080e7          	jalr	-1544(ra) # 800011bc <_Znwm>
    800077cc:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800077d0:	ffffa097          	auipc	ra,0xffffa
    800077d4:	bd0080e7          	jalr	-1072(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800077d8:	00007797          	auipc	a5,0x7
    800077dc:	84878793          	addi	a5,a5,-1976 # 8000e020 <_ZTV7WorkerD+0x10>
    800077e0:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800077e4:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800077e8:	00004517          	auipc	a0,0x4
    800077ec:	ec050513          	addi	a0,a0,-320 # 8000b6a8 <CONSOLE_STATUS+0x698>
    800077f0:	00000097          	auipc	ra,0x0
    800077f4:	558080e7          	jalr	1368(ra) # 80007d48 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800077f8:	00000493          	li	s1,0
    800077fc:	00300793          	li	a5,3
    80007800:	0297c663          	blt	a5,s1,8000782c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80007804:	00349793          	slli	a5,s1,0x3
    80007808:	fe040713          	addi	a4,s0,-32
    8000780c:	00f707b3          	add	a5,a4,a5
    80007810:	fe07b503          	ld	a0,-32(a5)
    80007814:	ffffa097          	auipc	ra,0xffffa
    80007818:	aa4080e7          	jalr	-1372(ra) # 800012b8 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000781c:	0014849b          	addiw	s1,s1,1
    80007820:	fddff06f          	j	800077fc <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80007824:	ffffa097          	auipc	ra,0xffffa
    80007828:	af4080e7          	jalr	-1292(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000782c:	00007797          	auipc	a5,0x7
    80007830:	9a67c783          	lbu	a5,-1626(a5) # 8000e1d2 <_ZL9finishedA>
    80007834:	fe0788e3          	beqz	a5,80007824 <_Z20Threads_CPP_API_testv+0x124>
    80007838:	00007797          	auipc	a5,0x7
    8000783c:	99b7c783          	lbu	a5,-1637(a5) # 8000e1d3 <_ZL9finishedB>
    80007840:	fe0782e3          	beqz	a5,80007824 <_Z20Threads_CPP_API_testv+0x124>
    80007844:	00007797          	auipc	a5,0x7
    80007848:	9907c783          	lbu	a5,-1648(a5) # 8000e1d4 <_ZL9finishedC>
    8000784c:	fc078ce3          	beqz	a5,80007824 <_Z20Threads_CPP_API_testv+0x124>
    80007850:	00007797          	auipc	a5,0x7
    80007854:	9857c783          	lbu	a5,-1659(a5) # 8000e1d5 <_ZL9finishedD>
    80007858:	fc0786e3          	beqz	a5,80007824 <_Z20Threads_CPP_API_testv+0x124>
    8000785c:	fc040493          	addi	s1,s0,-64
    80007860:	0080006f          	j	80007868 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80007864:	00848493          	addi	s1,s1,8
    80007868:	fe040793          	addi	a5,s0,-32
    8000786c:	08f48663          	beq	s1,a5,800078f8 <_Z20Threads_CPP_API_testv+0x1f8>
    80007870:	0004b503          	ld	a0,0(s1)
    80007874:	fe0508e3          	beqz	a0,80007864 <_Z20Threads_CPP_API_testv+0x164>
    80007878:	00053783          	ld	a5,0(a0)
    8000787c:	0087b783          	ld	a5,8(a5)
    80007880:	000780e7          	jalr	a5
    80007884:	fe1ff06f          	j	80007864 <_Z20Threads_CPP_API_testv+0x164>
    80007888:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    8000788c:	00048513          	mv	a0,s1
    80007890:	ffffa097          	auipc	ra,0xffffa
    80007894:	954080e7          	jalr	-1708(ra) # 800011e4 <_ZdlPv>
    80007898:	00090513          	mv	a0,s2
    8000789c:	00008097          	auipc	ra,0x8
    800078a0:	a1c080e7          	jalr	-1508(ra) # 8000f2b8 <_Unwind_Resume>
    800078a4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800078a8:	00048513          	mv	a0,s1
    800078ac:	ffffa097          	auipc	ra,0xffffa
    800078b0:	938080e7          	jalr	-1736(ra) # 800011e4 <_ZdlPv>
    800078b4:	00090513          	mv	a0,s2
    800078b8:	00008097          	auipc	ra,0x8
    800078bc:	a00080e7          	jalr	-1536(ra) # 8000f2b8 <_Unwind_Resume>
    800078c0:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800078c4:	00048513          	mv	a0,s1
    800078c8:	ffffa097          	auipc	ra,0xffffa
    800078cc:	91c080e7          	jalr	-1764(ra) # 800011e4 <_ZdlPv>
    800078d0:	00090513          	mv	a0,s2
    800078d4:	00008097          	auipc	ra,0x8
    800078d8:	9e4080e7          	jalr	-1564(ra) # 8000f2b8 <_Unwind_Resume>
    800078dc:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800078e0:	00048513          	mv	a0,s1
    800078e4:	ffffa097          	auipc	ra,0xffffa
    800078e8:	900080e7          	jalr	-1792(ra) # 800011e4 <_ZdlPv>
    800078ec:	00090513          	mv	a0,s2
    800078f0:	00008097          	auipc	ra,0x8
    800078f4:	9c8080e7          	jalr	-1592(ra) # 8000f2b8 <_Unwind_Resume>
}
    800078f8:	03813083          	ld	ra,56(sp)
    800078fc:	03013403          	ld	s0,48(sp)
    80007900:	02813483          	ld	s1,40(sp)
    80007904:	02013903          	ld	s2,32(sp)
    80007908:	04010113          	addi	sp,sp,64
    8000790c:	00008067          	ret

0000000080007910 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80007910:	ff010113          	addi	sp,sp,-16
    80007914:	00113423          	sd	ra,8(sp)
    80007918:	00813023          	sd	s0,0(sp)
    8000791c:	01010413          	addi	s0,sp,16
    80007920:	00006797          	auipc	a5,0x6
    80007924:	68878793          	addi	a5,a5,1672 # 8000dfa8 <_ZTV7WorkerA+0x10>
    80007928:	00f53023          	sd	a5,0(a0)
    8000792c:	ffffa097          	auipc	ra,0xffffa
    80007930:	820080e7          	jalr	-2016(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007934:	00813083          	ld	ra,8(sp)
    80007938:	00013403          	ld	s0,0(sp)
    8000793c:	01010113          	addi	sp,sp,16
    80007940:	00008067          	ret

0000000080007944 <_ZN7WorkerAD0Ev>:
    80007944:	fe010113          	addi	sp,sp,-32
    80007948:	00113c23          	sd	ra,24(sp)
    8000794c:	00813823          	sd	s0,16(sp)
    80007950:	00913423          	sd	s1,8(sp)
    80007954:	02010413          	addi	s0,sp,32
    80007958:	00050493          	mv	s1,a0
    8000795c:	00006797          	auipc	a5,0x6
    80007960:	64c78793          	addi	a5,a5,1612 # 8000dfa8 <_ZTV7WorkerA+0x10>
    80007964:	00f53023          	sd	a5,0(a0)
    80007968:	ffff9097          	auipc	ra,0xffff9
    8000796c:	7e4080e7          	jalr	2020(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007970:	00048513          	mv	a0,s1
    80007974:	ffffa097          	auipc	ra,0xffffa
    80007978:	870080e7          	jalr	-1936(ra) # 800011e4 <_ZdlPv>
    8000797c:	01813083          	ld	ra,24(sp)
    80007980:	01013403          	ld	s0,16(sp)
    80007984:	00813483          	ld	s1,8(sp)
    80007988:	02010113          	addi	sp,sp,32
    8000798c:	00008067          	ret

0000000080007990 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80007990:	ff010113          	addi	sp,sp,-16
    80007994:	00113423          	sd	ra,8(sp)
    80007998:	00813023          	sd	s0,0(sp)
    8000799c:	01010413          	addi	s0,sp,16
    800079a0:	00006797          	auipc	a5,0x6
    800079a4:	63078793          	addi	a5,a5,1584 # 8000dfd0 <_ZTV7WorkerB+0x10>
    800079a8:	00f53023          	sd	a5,0(a0)
    800079ac:	ffff9097          	auipc	ra,0xffff9
    800079b0:	7a0080e7          	jalr	1952(ra) # 8000114c <_ZN6ThreadD1Ev>
    800079b4:	00813083          	ld	ra,8(sp)
    800079b8:	00013403          	ld	s0,0(sp)
    800079bc:	01010113          	addi	sp,sp,16
    800079c0:	00008067          	ret

00000000800079c4 <_ZN7WorkerBD0Ev>:
    800079c4:	fe010113          	addi	sp,sp,-32
    800079c8:	00113c23          	sd	ra,24(sp)
    800079cc:	00813823          	sd	s0,16(sp)
    800079d0:	00913423          	sd	s1,8(sp)
    800079d4:	02010413          	addi	s0,sp,32
    800079d8:	00050493          	mv	s1,a0
    800079dc:	00006797          	auipc	a5,0x6
    800079e0:	5f478793          	addi	a5,a5,1524 # 8000dfd0 <_ZTV7WorkerB+0x10>
    800079e4:	00f53023          	sd	a5,0(a0)
    800079e8:	ffff9097          	auipc	ra,0xffff9
    800079ec:	764080e7          	jalr	1892(ra) # 8000114c <_ZN6ThreadD1Ev>
    800079f0:	00048513          	mv	a0,s1
    800079f4:	ffff9097          	auipc	ra,0xffff9
    800079f8:	7f0080e7          	jalr	2032(ra) # 800011e4 <_ZdlPv>
    800079fc:	01813083          	ld	ra,24(sp)
    80007a00:	01013403          	ld	s0,16(sp)
    80007a04:	00813483          	ld	s1,8(sp)
    80007a08:	02010113          	addi	sp,sp,32
    80007a0c:	00008067          	ret

0000000080007a10 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80007a10:	ff010113          	addi	sp,sp,-16
    80007a14:	00113423          	sd	ra,8(sp)
    80007a18:	00813023          	sd	s0,0(sp)
    80007a1c:	01010413          	addi	s0,sp,16
    80007a20:	00006797          	auipc	a5,0x6
    80007a24:	5d878793          	addi	a5,a5,1496 # 8000dff8 <_ZTV7WorkerC+0x10>
    80007a28:	00f53023          	sd	a5,0(a0)
    80007a2c:	ffff9097          	auipc	ra,0xffff9
    80007a30:	720080e7          	jalr	1824(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007a34:	00813083          	ld	ra,8(sp)
    80007a38:	00013403          	ld	s0,0(sp)
    80007a3c:	01010113          	addi	sp,sp,16
    80007a40:	00008067          	ret

0000000080007a44 <_ZN7WorkerCD0Ev>:
    80007a44:	fe010113          	addi	sp,sp,-32
    80007a48:	00113c23          	sd	ra,24(sp)
    80007a4c:	00813823          	sd	s0,16(sp)
    80007a50:	00913423          	sd	s1,8(sp)
    80007a54:	02010413          	addi	s0,sp,32
    80007a58:	00050493          	mv	s1,a0
    80007a5c:	00006797          	auipc	a5,0x6
    80007a60:	59c78793          	addi	a5,a5,1436 # 8000dff8 <_ZTV7WorkerC+0x10>
    80007a64:	00f53023          	sd	a5,0(a0)
    80007a68:	ffff9097          	auipc	ra,0xffff9
    80007a6c:	6e4080e7          	jalr	1764(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007a70:	00048513          	mv	a0,s1
    80007a74:	ffff9097          	auipc	ra,0xffff9
    80007a78:	770080e7          	jalr	1904(ra) # 800011e4 <_ZdlPv>
    80007a7c:	01813083          	ld	ra,24(sp)
    80007a80:	01013403          	ld	s0,16(sp)
    80007a84:	00813483          	ld	s1,8(sp)
    80007a88:	02010113          	addi	sp,sp,32
    80007a8c:	00008067          	ret

0000000080007a90 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80007a90:	ff010113          	addi	sp,sp,-16
    80007a94:	00113423          	sd	ra,8(sp)
    80007a98:	00813023          	sd	s0,0(sp)
    80007a9c:	01010413          	addi	s0,sp,16
    80007aa0:	00006797          	auipc	a5,0x6
    80007aa4:	58078793          	addi	a5,a5,1408 # 8000e020 <_ZTV7WorkerD+0x10>
    80007aa8:	00f53023          	sd	a5,0(a0)
    80007aac:	ffff9097          	auipc	ra,0xffff9
    80007ab0:	6a0080e7          	jalr	1696(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007ab4:	00813083          	ld	ra,8(sp)
    80007ab8:	00013403          	ld	s0,0(sp)
    80007abc:	01010113          	addi	sp,sp,16
    80007ac0:	00008067          	ret

0000000080007ac4 <_ZN7WorkerDD0Ev>:
    80007ac4:	fe010113          	addi	sp,sp,-32
    80007ac8:	00113c23          	sd	ra,24(sp)
    80007acc:	00813823          	sd	s0,16(sp)
    80007ad0:	00913423          	sd	s1,8(sp)
    80007ad4:	02010413          	addi	s0,sp,32
    80007ad8:	00050493          	mv	s1,a0
    80007adc:	00006797          	auipc	a5,0x6
    80007ae0:	54478793          	addi	a5,a5,1348 # 8000e020 <_ZTV7WorkerD+0x10>
    80007ae4:	00f53023          	sd	a5,0(a0)
    80007ae8:	ffff9097          	auipc	ra,0xffff9
    80007aec:	664080e7          	jalr	1636(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007af0:	00048513          	mv	a0,s1
    80007af4:	ffff9097          	auipc	ra,0xffff9
    80007af8:	6f0080e7          	jalr	1776(ra) # 800011e4 <_ZdlPv>
    80007afc:	01813083          	ld	ra,24(sp)
    80007b00:	01013403          	ld	s0,16(sp)
    80007b04:	00813483          	ld	s1,8(sp)
    80007b08:	02010113          	addi	sp,sp,32
    80007b0c:	00008067          	ret

0000000080007b10 <_ZN7WorkerA3runEv>:
    void run() override {
    80007b10:	ff010113          	addi	sp,sp,-16
    80007b14:	00113423          	sd	ra,8(sp)
    80007b18:	00813023          	sd	s0,0(sp)
    80007b1c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80007b20:	00000593          	li	a1,0
    80007b24:	fffff097          	auipc	ra,0xfffff
    80007b28:	774080e7          	jalr	1908(ra) # 80007298 <_ZN7WorkerA11workerBodyAEPv>
    }
    80007b2c:	00813083          	ld	ra,8(sp)
    80007b30:	00013403          	ld	s0,0(sp)
    80007b34:	01010113          	addi	sp,sp,16
    80007b38:	00008067          	ret

0000000080007b3c <_ZN7WorkerB3runEv>:
    void run() override {
    80007b3c:	ff010113          	addi	sp,sp,-16
    80007b40:	00113423          	sd	ra,8(sp)
    80007b44:	00813023          	sd	s0,0(sp)
    80007b48:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80007b4c:	00000593          	li	a1,0
    80007b50:	00000097          	auipc	ra,0x0
    80007b54:	814080e7          	jalr	-2028(ra) # 80007364 <_ZN7WorkerB11workerBodyBEPv>
    }
    80007b58:	00813083          	ld	ra,8(sp)
    80007b5c:	00013403          	ld	s0,0(sp)
    80007b60:	01010113          	addi	sp,sp,16
    80007b64:	00008067          	ret

0000000080007b68 <_ZN7WorkerC3runEv>:
    void run() override {
    80007b68:	ff010113          	addi	sp,sp,-16
    80007b6c:	00113423          	sd	ra,8(sp)
    80007b70:	00813023          	sd	s0,0(sp)
    80007b74:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80007b78:	00000593          	li	a1,0
    80007b7c:	00000097          	auipc	ra,0x0
    80007b80:	8bc080e7          	jalr	-1860(ra) # 80007438 <_ZN7WorkerC11workerBodyCEPv>
    }
    80007b84:	00813083          	ld	ra,8(sp)
    80007b88:	00013403          	ld	s0,0(sp)
    80007b8c:	01010113          	addi	sp,sp,16
    80007b90:	00008067          	ret

0000000080007b94 <_ZN7WorkerD3runEv>:
    void run() override {
    80007b94:	ff010113          	addi	sp,sp,-16
    80007b98:	00113423          	sd	ra,8(sp)
    80007b9c:	00813023          	sd	s0,0(sp)
    80007ba0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80007ba4:	00000593          	li	a1,0
    80007ba8:	00000097          	auipc	ra,0x0
    80007bac:	a10080e7          	jalr	-1520(ra) # 800075b8 <_ZN7WorkerD11workerBodyDEPv>
    }
    80007bb0:	00813083          	ld	ra,8(sp)
    80007bb4:	00013403          	ld	s0,0(sp)
    80007bb8:	01010113          	addi	sp,sp,16
    80007bbc:	00008067          	ret

0000000080007bc0 <_Z8userMainv>:
#include "../test_h/ConsumerProducer_CPP_API_test.h"
#include "../test_h/System_Mode_test.h"

#endif

void userMain() {
    80007bc0:	fe010113          	addi	sp,sp,-32
    80007bc4:	00113c23          	sd	ra,24(sp)
    80007bc8:	00813823          	sd	s0,16(sp)
    80007bcc:	00913423          	sd	s1,8(sp)
    80007bd0:	01213023          	sd	s2,0(sp)
    80007bd4:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80007bd8:	00004517          	auipc	a0,0x4
    80007bdc:	b6850513          	addi	a0,a0,-1176 # 8000b740 <CONSOLE_STATUS+0x730>
    80007be0:	00000097          	auipc	ra,0x0
    80007be4:	168080e7          	jalr	360(ra) # 80007d48 <_Z11printStringPKc>
    int test = getc() - '0';
    80007be8:	ffffa097          	auipc	ra,0xffffa
    80007bec:	ee0080e7          	jalr	-288(ra) # 80001ac8 <_Z4getcv>
    80007bf0:	00050913          	mv	s2,a0
    80007bf4:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80007bf8:	ffffa097          	auipc	ra,0xffffa
    80007bfc:	ed0080e7          	jalr	-304(ra) # 80001ac8 <_Z4getcv>
    // int test = 3;
    putc('0' + test);
    80007c00:	00090513          	mv	a0,s2
    80007c04:	ffffa097          	auipc	ra,0xffffa
    80007c08:	eec080e7          	jalr	-276(ra) # 80001af0 <_Z4putcc>
    putc('\n');
    80007c0c:	00a00513          	li	a0,10
    80007c10:	ffffa097          	auipc	ra,0xffffa
    80007c14:	ee0080e7          	jalr	-288(ra) # 80001af0 <_Z4putcc>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80007c18:	00700793          	li	a5,7
    80007c1c:	1097ec63          	bltu	a5,s1,80007d34 <_Z8userMainv+0x174>
    80007c20:	00249493          	slli	s1,s1,0x2
    80007c24:	00004717          	auipc	a4,0x4
    80007c28:	d8870713          	addi	a4,a4,-632 # 8000b9ac <CONSOLE_STATUS+0x99c>
    80007c2c:	00e484b3          	add	s1,s1,a4
    80007c30:	0004a783          	lw	a5,0(s1)
    80007c34:	00e787b3          	add	a5,a5,a4
    80007c38:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80007c3c:	fffff097          	auipc	ra,0xfffff
    80007c40:	f5c080e7          	jalr	-164(ra) # 80006b98 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80007c44:	00004517          	auipc	a0,0x4
    80007c48:	b1c50513          	addi	a0,a0,-1252 # 8000b760 <CONSOLE_STATUS+0x750>
    80007c4c:	00000097          	auipc	ra,0x0
    80007c50:	0fc080e7          	jalr	252(ra) # 80007d48 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    printString("Kraj izvrsavanja");
    80007c54:	00004517          	auipc	a0,0x4
    80007c58:	d4450513          	addi	a0,a0,-700 # 8000b998 <CONSOLE_STATUS+0x988>
    80007c5c:	00000097          	auipc	ra,0x0
    80007c60:	0ec080e7          	jalr	236(ra) # 80007d48 <_Z11printStringPKc>
    80007c64:	01813083          	ld	ra,24(sp)
    80007c68:	01013403          	ld	s0,16(sp)
    80007c6c:	00813483          	ld	s1,8(sp)
    80007c70:	00013903          	ld	s2,0(sp)
    80007c74:	02010113          	addi	sp,sp,32
    80007c78:	00008067          	ret
            Threads_CPP_API_test();
    80007c7c:	00000097          	auipc	ra,0x0
    80007c80:	a84080e7          	jalr	-1404(ra) # 80007700 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80007c84:	00004517          	auipc	a0,0x4
    80007c88:	b1c50513          	addi	a0,a0,-1252 # 8000b7a0 <CONSOLE_STATUS+0x790>
    80007c8c:	00000097          	auipc	ra,0x0
    80007c90:	0bc080e7          	jalr	188(ra) # 80007d48 <_Z11printStringPKc>
            break;
    80007c94:	fc1ff06f          	j	80007c54 <_Z8userMainv+0x94>
            producerConsumer_C_API();
    80007c98:	ffffe097          	auipc	ra,0xffffe
    80007c9c:	9e8080e7          	jalr	-1560(ra) # 80005680 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80007ca0:	00004517          	auipc	a0,0x4
    80007ca4:	b4050513          	addi	a0,a0,-1216 # 8000b7e0 <CONSOLE_STATUS+0x7d0>
    80007ca8:	00000097          	auipc	ra,0x0
    80007cac:	0a0080e7          	jalr	160(ra) # 80007d48 <_Z11printStringPKc>
            break;
    80007cb0:	fa5ff06f          	j	80007c54 <_Z8userMainv+0x94>
            producerConsumer_CPP_Sync_API();
    80007cb4:	00000097          	auipc	ra,0x0
    80007cb8:	5ac080e7          	jalr	1452(ra) # 80008260 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80007cbc:	00004517          	auipc	a0,0x4
    80007cc0:	b7450513          	addi	a0,a0,-1164 # 8000b830 <CONSOLE_STATUS+0x820>
    80007cc4:	00000097          	auipc	ra,0x0
    80007cc8:	084080e7          	jalr	132(ra) # 80007d48 <_Z11printStringPKc>
            break;
    80007ccc:	f89ff06f          	j	80007c54 <_Z8userMainv+0x94>
            testSleeping();
    80007cd0:	fffff097          	auipc	ra,0xfffff
    80007cd4:	074080e7          	jalr	116(ra) # 80006d44 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., time_sleep test C API)\n");
    80007cd8:	00004517          	auipc	a0,0x4
    80007cdc:	bb050513          	addi	a0,a0,-1104 # 8000b888 <CONSOLE_STATUS+0x878>
    80007ce0:	00000097          	auipc	ra,0x0
    80007ce4:	068080e7          	jalr	104(ra) # 80007d48 <_Z11printStringPKc>
            break;
    80007ce8:	f6dff06f          	j	80007c54 <_Z8userMainv+0x94>
            testConsumerProducer();
    80007cec:	ffffe097          	auipc	ra,0xffffe
    80007cf0:	c64080e7          	jalr	-924(ra) # 80005950 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80007cf4:	00004517          	auipc	a0,0x4
    80007cf8:	bc450513          	addi	a0,a0,-1084 # 8000b8b8 <CONSOLE_STATUS+0x8a8>
    80007cfc:	00000097          	auipc	ra,0x0
    80007d00:	04c080e7          	jalr	76(ra) # 80007d48 <_Z11printStringPKc>
            break;
    80007d04:	f51ff06f          	j	80007c54 <_Z8userMainv+0x94>
            System_Mode_test();
    80007d08:	fffff097          	auipc	ra,0xfffff
    80007d0c:	8c0080e7          	jalr	-1856(ra) # 800065c8 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80007d10:	00004517          	auipc	a0,0x4
    80007d14:	be850513          	addi	a0,a0,-1048 # 8000b8f8 <CONSOLE_STATUS+0x8e8>
    80007d18:	00000097          	auipc	ra,0x0
    80007d1c:	030080e7          	jalr	48(ra) # 80007d48 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80007d20:	00004517          	auipc	a0,0x4
    80007d24:	bf850513          	addi	a0,a0,-1032 # 8000b918 <CONSOLE_STATUS+0x908>
    80007d28:	00000097          	auipc	ra,0x0
    80007d2c:	020080e7          	jalr	32(ra) # 80007d48 <_Z11printStringPKc>
            break;
    80007d30:	f25ff06f          	j	80007c54 <_Z8userMainv+0x94>
            printString("Niste uneli odgovarajuci broj za test\n");
    80007d34:	00004517          	auipc	a0,0x4
    80007d38:	c3c50513          	addi	a0,a0,-964 # 8000b970 <CONSOLE_STATUS+0x960>
    80007d3c:	00000097          	auipc	ra,0x0
    80007d40:	00c080e7          	jalr	12(ra) # 80007d48 <_Z11printStringPKc>
    80007d44:	f11ff06f          	j	80007c54 <_Z8userMainv+0x94>

0000000080007d48 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80007d48:	fe010113          	addi	sp,sp,-32
    80007d4c:	00113c23          	sd	ra,24(sp)
    80007d50:	00813823          	sd	s0,16(sp)
    80007d54:	00913423          	sd	s1,8(sp)
    80007d58:	02010413          	addi	s0,sp,32
    80007d5c:	00050493          	mv	s1,a0
    LOCK();
    80007d60:	00100613          	li	a2,1
    80007d64:	00000593          	li	a1,0
    80007d68:	00006517          	auipc	a0,0x6
    80007d6c:	47050513          	addi	a0,a0,1136 # 8000e1d8 <lockPrint>
    80007d70:	ffff9097          	auipc	ra,0xffff9
    80007d74:	390080e7          	jalr	912(ra) # 80001100 <copy_and_swap>
    80007d78:	00050863          	beqz	a0,80007d88 <_Z11printStringPKc+0x40>
    80007d7c:	ffffa097          	auipc	ra,0xffffa
    80007d80:	c20080e7          	jalr	-992(ra) # 8000199c <_Z15thread_dispatchv>
    80007d84:	fddff06f          	j	80007d60 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80007d88:	0004c503          	lbu	a0,0(s1)
    80007d8c:	00050a63          	beqz	a0,80007da0 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80007d90:	ffffa097          	auipc	ra,0xffffa
    80007d94:	d60080e7          	jalr	-672(ra) # 80001af0 <_Z4putcc>
        string++;
    80007d98:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80007d9c:	fedff06f          	j	80007d88 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80007da0:	00000613          	li	a2,0
    80007da4:	00100593          	li	a1,1
    80007da8:	00006517          	auipc	a0,0x6
    80007dac:	43050513          	addi	a0,a0,1072 # 8000e1d8 <lockPrint>
    80007db0:	ffff9097          	auipc	ra,0xffff9
    80007db4:	350080e7          	jalr	848(ra) # 80001100 <copy_and_swap>
    80007db8:	fe0514e3          	bnez	a0,80007da0 <_Z11printStringPKc+0x58>
}
    80007dbc:	01813083          	ld	ra,24(sp)
    80007dc0:	01013403          	ld	s0,16(sp)
    80007dc4:	00813483          	ld	s1,8(sp)
    80007dc8:	02010113          	addi	sp,sp,32
    80007dcc:	00008067          	ret

0000000080007dd0 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80007dd0:	fd010113          	addi	sp,sp,-48
    80007dd4:	02113423          	sd	ra,40(sp)
    80007dd8:	02813023          	sd	s0,32(sp)
    80007ddc:	00913c23          	sd	s1,24(sp)
    80007de0:	01213823          	sd	s2,16(sp)
    80007de4:	01313423          	sd	s3,8(sp)
    80007de8:	01413023          	sd	s4,0(sp)
    80007dec:	03010413          	addi	s0,sp,48
    80007df0:	00050993          	mv	s3,a0
    80007df4:	00058a13          	mv	s4,a1
    LOCK();
    80007df8:	00100613          	li	a2,1
    80007dfc:	00000593          	li	a1,0
    80007e00:	00006517          	auipc	a0,0x6
    80007e04:	3d850513          	addi	a0,a0,984 # 8000e1d8 <lockPrint>
    80007e08:	ffff9097          	auipc	ra,0xffff9
    80007e0c:	2f8080e7          	jalr	760(ra) # 80001100 <copy_and_swap>
    80007e10:	00050863          	beqz	a0,80007e20 <_Z9getStringPci+0x50>
    80007e14:	ffffa097          	auipc	ra,0xffffa
    80007e18:	b88080e7          	jalr	-1144(ra) # 8000199c <_Z15thread_dispatchv>
    80007e1c:	fddff06f          	j	80007df8 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80007e20:	00000913          	li	s2,0
    80007e24:	00090493          	mv	s1,s2
    80007e28:	0019091b          	addiw	s2,s2,1
    80007e2c:	03495a63          	bge	s2,s4,80007e60 <_Z9getStringPci+0x90>
        cc = getc();
    80007e30:	ffffa097          	auipc	ra,0xffffa
    80007e34:	c98080e7          	jalr	-872(ra) # 80001ac8 <_Z4getcv>
        if(cc < 1)
    80007e38:	02050463          	beqz	a0,80007e60 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80007e3c:	009984b3          	add	s1,s3,s1
    80007e40:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80007e44:	00a00793          	li	a5,10
    80007e48:	00f50a63          	beq	a0,a5,80007e5c <_Z9getStringPci+0x8c>
    80007e4c:	00d00793          	li	a5,13
    80007e50:	fcf51ae3          	bne	a0,a5,80007e24 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80007e54:	00090493          	mv	s1,s2
    80007e58:	0080006f          	j	80007e60 <_Z9getStringPci+0x90>
    80007e5c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80007e60:	009984b3          	add	s1,s3,s1
    80007e64:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80007e68:	00000613          	li	a2,0
    80007e6c:	00100593          	li	a1,1
    80007e70:	00006517          	auipc	a0,0x6
    80007e74:	36850513          	addi	a0,a0,872 # 8000e1d8 <lockPrint>
    80007e78:	ffff9097          	auipc	ra,0xffff9
    80007e7c:	288080e7          	jalr	648(ra) # 80001100 <copy_and_swap>
    80007e80:	fe0514e3          	bnez	a0,80007e68 <_Z9getStringPci+0x98>
    return buf;
}
    80007e84:	00098513          	mv	a0,s3
    80007e88:	02813083          	ld	ra,40(sp)
    80007e8c:	02013403          	ld	s0,32(sp)
    80007e90:	01813483          	ld	s1,24(sp)
    80007e94:	01013903          	ld	s2,16(sp)
    80007e98:	00813983          	ld	s3,8(sp)
    80007e9c:	00013a03          	ld	s4,0(sp)
    80007ea0:	03010113          	addi	sp,sp,48
    80007ea4:	00008067          	ret

0000000080007ea8 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80007ea8:	ff010113          	addi	sp,sp,-16
    80007eac:	00813423          	sd	s0,8(sp)
    80007eb0:	01010413          	addi	s0,sp,16
    80007eb4:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80007eb8:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80007ebc:	0006c603          	lbu	a2,0(a3)
    80007ec0:	fd06071b          	addiw	a4,a2,-48
    80007ec4:	0ff77713          	andi	a4,a4,255
    80007ec8:	00900793          	li	a5,9
    80007ecc:	02e7e063          	bltu	a5,a4,80007eec <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80007ed0:	0025179b          	slliw	a5,a0,0x2
    80007ed4:	00a787bb          	addw	a5,a5,a0
    80007ed8:	0017979b          	slliw	a5,a5,0x1
    80007edc:	00168693          	addi	a3,a3,1
    80007ee0:	00c787bb          	addw	a5,a5,a2
    80007ee4:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80007ee8:	fd5ff06f          	j	80007ebc <_Z11stringToIntPKc+0x14>
    return n;
}
    80007eec:	00813403          	ld	s0,8(sp)
    80007ef0:	01010113          	addi	sp,sp,16
    80007ef4:	00008067          	ret

0000000080007ef8 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80007ef8:	fc010113          	addi	sp,sp,-64
    80007efc:	02113c23          	sd	ra,56(sp)
    80007f00:	02813823          	sd	s0,48(sp)
    80007f04:	02913423          	sd	s1,40(sp)
    80007f08:	03213023          	sd	s2,32(sp)
    80007f0c:	01313c23          	sd	s3,24(sp)
    80007f10:	04010413          	addi	s0,sp,64
    80007f14:	00050493          	mv	s1,a0
    80007f18:	00058913          	mv	s2,a1
    80007f1c:	00060993          	mv	s3,a2
    LOCK();
    80007f20:	00100613          	li	a2,1
    80007f24:	00000593          	li	a1,0
    80007f28:	00006517          	auipc	a0,0x6
    80007f2c:	2b050513          	addi	a0,a0,688 # 8000e1d8 <lockPrint>
    80007f30:	ffff9097          	auipc	ra,0xffff9
    80007f34:	1d0080e7          	jalr	464(ra) # 80001100 <copy_and_swap>
    80007f38:	00050863          	beqz	a0,80007f48 <_Z8printIntiii+0x50>
    80007f3c:	ffffa097          	auipc	ra,0xffffa
    80007f40:	a60080e7          	jalr	-1440(ra) # 8000199c <_Z15thread_dispatchv>
    80007f44:	fddff06f          	j	80007f20 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80007f48:	00098463          	beqz	s3,80007f50 <_Z8printIntiii+0x58>
    80007f4c:	0804c463          	bltz	s1,80007fd4 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80007f50:	0004851b          	sext.w	a0,s1
    neg = 0;
    80007f54:	00000593          	li	a1,0
    }

    i = 0;
    80007f58:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80007f5c:	0009079b          	sext.w	a5,s2
    80007f60:	0325773b          	remuw	a4,a0,s2
    80007f64:	00048613          	mv	a2,s1
    80007f68:	0014849b          	addiw	s1,s1,1
    80007f6c:	02071693          	slli	a3,a4,0x20
    80007f70:	0206d693          	srli	a3,a3,0x20
    80007f74:	00006717          	auipc	a4,0x6
    80007f78:	0c470713          	addi	a4,a4,196 # 8000e038 <digits>
    80007f7c:	00d70733          	add	a4,a4,a3
    80007f80:	00074683          	lbu	a3,0(a4)
    80007f84:	fd040713          	addi	a4,s0,-48
    80007f88:	00c70733          	add	a4,a4,a2
    80007f8c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80007f90:	0005071b          	sext.w	a4,a0
    80007f94:	0325553b          	divuw	a0,a0,s2
    80007f98:	fcf772e3          	bgeu	a4,a5,80007f5c <_Z8printIntiii+0x64>
    if(neg)
    80007f9c:	00058c63          	beqz	a1,80007fb4 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80007fa0:	fd040793          	addi	a5,s0,-48
    80007fa4:	009784b3          	add	s1,a5,s1
    80007fa8:	02d00793          	li	a5,45
    80007fac:	fef48823          	sb	a5,-16(s1)
    80007fb0:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80007fb4:	fff4849b          	addiw	s1,s1,-1
    80007fb8:	0204c463          	bltz	s1,80007fe0 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80007fbc:	fd040793          	addi	a5,s0,-48
    80007fc0:	009787b3          	add	a5,a5,s1
    80007fc4:	ff07c503          	lbu	a0,-16(a5)
    80007fc8:	ffffa097          	auipc	ra,0xffffa
    80007fcc:	b28080e7          	jalr	-1240(ra) # 80001af0 <_Z4putcc>
    80007fd0:	fe5ff06f          	j	80007fb4 <_Z8printIntiii+0xbc>
        x = -xx;
    80007fd4:	4090053b          	negw	a0,s1
        neg = 1;
    80007fd8:	00100593          	li	a1,1
        x = -xx;
    80007fdc:	f7dff06f          	j	80007f58 <_Z8printIntiii+0x60>

    UNLOCK();
    80007fe0:	00000613          	li	a2,0
    80007fe4:	00100593          	li	a1,1
    80007fe8:	00006517          	auipc	a0,0x6
    80007fec:	1f050513          	addi	a0,a0,496 # 8000e1d8 <lockPrint>
    80007ff0:	ffff9097          	auipc	ra,0xffff9
    80007ff4:	110080e7          	jalr	272(ra) # 80001100 <copy_and_swap>
    80007ff8:	fe0514e3          	bnez	a0,80007fe0 <_Z8printIntiii+0xe8>
    80007ffc:	03813083          	ld	ra,56(sp)
    80008000:	03013403          	ld	s0,48(sp)
    80008004:	02813483          	ld	s1,40(sp)
    80008008:	02013903          	ld	s2,32(sp)
    8000800c:	01813983          	ld	s3,24(sp)
    80008010:	04010113          	addi	sp,sp,64
    80008014:	00008067          	ret

0000000080008018 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80008018:	fd010113          	addi	sp,sp,-48
    8000801c:	02113423          	sd	ra,40(sp)
    80008020:	02813023          	sd	s0,32(sp)
    80008024:	00913c23          	sd	s1,24(sp)
    80008028:	01213823          	sd	s2,16(sp)
    8000802c:	01313423          	sd	s3,8(sp)
    80008030:	03010413          	addi	s0,sp,48
    80008034:	00050993          	mv	s3,a0
    80008038:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000803c:	00000913          	li	s2,0
    80008040:	00c0006f          	j	8000804c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80008044:	ffff9097          	auipc	ra,0xffff9
    80008048:	2d4080e7          	jalr	724(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    8000804c:	ffffa097          	auipc	ra,0xffffa
    80008050:	a7c080e7          	jalr	-1412(ra) # 80001ac8 <_Z4getcv>
    80008054:	0005059b          	sext.w	a1,a0
    80008058:	01b00793          	li	a5,27
    8000805c:	02f58a63          	beq	a1,a5,80008090 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80008060:	0084b503          	ld	a0,8(s1)
    80008064:	fffff097          	auipc	ra,0xfffff
    80008068:	f1c080e7          	jalr	-228(ra) # 80006f80 <_ZN9BufferCPP3putEi>
        i++;
    8000806c:	0019071b          	addiw	a4,s2,1
    80008070:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80008074:	0004a683          	lw	a3,0(s1)
    80008078:	0026979b          	slliw	a5,a3,0x2
    8000807c:	00d787bb          	addw	a5,a5,a3
    80008080:	0017979b          	slliw	a5,a5,0x1
    80008084:	02f767bb          	remw	a5,a4,a5
    80008088:	fc0792e3          	bnez	a5,8000804c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000808c:	fb9ff06f          	j	80008044 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80008090:	00100793          	li	a5,1
    80008094:	00006717          	auipc	a4,0x6
    80008098:	14f72623          	sw	a5,332(a4) # 8000e1e0 <_ZL9threadEnd>
    td->buffer->put('!');
    8000809c:	0209b783          	ld	a5,32(s3)
    800080a0:	02100593          	li	a1,33
    800080a4:	0087b503          	ld	a0,8(a5)
    800080a8:	fffff097          	auipc	ra,0xfffff
    800080ac:	ed8080e7          	jalr	-296(ra) # 80006f80 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800080b0:	0104b503          	ld	a0,16(s1)
    800080b4:	ffff9097          	auipc	ra,0xffff9
    800080b8:	384080e7          	jalr	900(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    800080bc:	02813083          	ld	ra,40(sp)
    800080c0:	02013403          	ld	s0,32(sp)
    800080c4:	01813483          	ld	s1,24(sp)
    800080c8:	01013903          	ld	s2,16(sp)
    800080cc:	00813983          	ld	s3,8(sp)
    800080d0:	03010113          	addi	sp,sp,48
    800080d4:	00008067          	ret

00000000800080d8 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800080d8:	fe010113          	addi	sp,sp,-32
    800080dc:	00113c23          	sd	ra,24(sp)
    800080e0:	00813823          	sd	s0,16(sp)
    800080e4:	00913423          	sd	s1,8(sp)
    800080e8:	01213023          	sd	s2,0(sp)
    800080ec:	02010413          	addi	s0,sp,32
    800080f0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800080f4:	00000913          	li	s2,0
    800080f8:	00c0006f          	j	80008104 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800080fc:	ffff9097          	auipc	ra,0xffff9
    80008100:	21c080e7          	jalr	540(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80008104:	00006797          	auipc	a5,0x6
    80008108:	0dc7a783          	lw	a5,220(a5) # 8000e1e0 <_ZL9threadEnd>
    8000810c:	02079e63          	bnez	a5,80008148 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80008110:	0004a583          	lw	a1,0(s1)
    80008114:	0305859b          	addiw	a1,a1,48
    80008118:	0084b503          	ld	a0,8(s1)
    8000811c:	fffff097          	auipc	ra,0xfffff
    80008120:	e64080e7          	jalr	-412(ra) # 80006f80 <_ZN9BufferCPP3putEi>
        i++;
    80008124:	0019071b          	addiw	a4,s2,1
    80008128:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000812c:	0004a683          	lw	a3,0(s1)
    80008130:	0026979b          	slliw	a5,a3,0x2
    80008134:	00d787bb          	addw	a5,a5,a3
    80008138:	0017979b          	slliw	a5,a5,0x1
    8000813c:	02f767bb          	remw	a5,a4,a5
    80008140:	fc0792e3          	bnez	a5,80008104 <_ZN12ProducerSync8producerEPv+0x2c>
    80008144:	fb9ff06f          	j	800080fc <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80008148:	0104b503          	ld	a0,16(s1)
    8000814c:	ffff9097          	auipc	ra,0xffff9
    80008150:	2ec080e7          	jalr	748(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80008154:	01813083          	ld	ra,24(sp)
    80008158:	01013403          	ld	s0,16(sp)
    8000815c:	00813483          	ld	s1,8(sp)
    80008160:	00013903          	ld	s2,0(sp)
    80008164:	02010113          	addi	sp,sp,32
    80008168:	00008067          	ret

000000008000816c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    8000816c:	fd010113          	addi	sp,sp,-48
    80008170:	02113423          	sd	ra,40(sp)
    80008174:	02813023          	sd	s0,32(sp)
    80008178:	00913c23          	sd	s1,24(sp)
    8000817c:	01213823          	sd	s2,16(sp)
    80008180:	01313423          	sd	s3,8(sp)
    80008184:	01413023          	sd	s4,0(sp)
    80008188:	03010413          	addi	s0,sp,48
    8000818c:	00050993          	mv	s3,a0
    80008190:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80008194:	00000a13          	li	s4,0
    80008198:	01c0006f          	j	800081b4 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    8000819c:	ffff9097          	auipc	ra,0xffff9
    800081a0:	17c080e7          	jalr	380(ra) # 80001318 <_ZN6Thread8dispatchEv>
    800081a4:	0500006f          	j	800081f4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800081a8:	00a00513          	li	a0,10
    800081ac:	ffffa097          	auipc	ra,0xffffa
    800081b0:	944080e7          	jalr	-1724(ra) # 80001af0 <_Z4putcc>
    while (!threadEnd) {
    800081b4:	00006797          	auipc	a5,0x6
    800081b8:	02c7a783          	lw	a5,44(a5) # 8000e1e0 <_ZL9threadEnd>
    800081bc:	06079263          	bnez	a5,80008220 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800081c0:	00893503          	ld	a0,8(s2)
    800081c4:	fffff097          	auipc	ra,0xfffff
    800081c8:	e4c080e7          	jalr	-436(ra) # 80007010 <_ZN9BufferCPP3getEv>
        i++;
    800081cc:	001a049b          	addiw	s1,s4,1
    800081d0:	00048a1b          	sext.w	s4,s1
        putc(key);
    800081d4:	0ff57513          	andi	a0,a0,255
    800081d8:	ffffa097          	auipc	ra,0xffffa
    800081dc:	918080e7          	jalr	-1768(ra) # 80001af0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800081e0:	00092703          	lw	a4,0(s2)
    800081e4:	0027179b          	slliw	a5,a4,0x2
    800081e8:	00e787bb          	addw	a5,a5,a4
    800081ec:	02f4e7bb          	remw	a5,s1,a5
    800081f0:	fa0786e3          	beqz	a5,8000819c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800081f4:	05000793          	li	a5,80
    800081f8:	02f4e4bb          	remw	s1,s1,a5
    800081fc:	fa049ce3          	bnez	s1,800081b4 <_ZN12ConsumerSync8consumerEPv+0x48>
    80008200:	fa9ff06f          	j	800081a8 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80008204:	0209b783          	ld	a5,32(s3)
    80008208:	0087b503          	ld	a0,8(a5)
    8000820c:	fffff097          	auipc	ra,0xfffff
    80008210:	e04080e7          	jalr	-508(ra) # 80007010 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80008214:	0ff57513          	andi	a0,a0,255
    80008218:	ffff9097          	auipc	ra,0xffff9
    8000821c:	2bc080e7          	jalr	700(ra) # 800014d4 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80008220:	0209b783          	ld	a5,32(s3)
    80008224:	0087b503          	ld	a0,8(a5)
    80008228:	fffff097          	auipc	ra,0xfffff
    8000822c:	e74080e7          	jalr	-396(ra) # 8000709c <_ZN9BufferCPP6getCntEv>
    80008230:	fca04ae3          	bgtz	a0,80008204 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80008234:	01093503          	ld	a0,16(s2)
    80008238:	ffff9097          	auipc	ra,0xffff9
    8000823c:	200080e7          	jalr	512(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80008240:	02813083          	ld	ra,40(sp)
    80008244:	02013403          	ld	s0,32(sp)
    80008248:	01813483          	ld	s1,24(sp)
    8000824c:	01013903          	ld	s2,16(sp)
    80008250:	00813983          	ld	s3,8(sp)
    80008254:	00013a03          	ld	s4,0(sp)
    80008258:	03010113          	addi	sp,sp,48
    8000825c:	00008067          	ret

0000000080008260 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80008260:	f8010113          	addi	sp,sp,-128
    80008264:	06113c23          	sd	ra,120(sp)
    80008268:	06813823          	sd	s0,112(sp)
    8000826c:	06913423          	sd	s1,104(sp)
    80008270:	07213023          	sd	s2,96(sp)
    80008274:	05313c23          	sd	s3,88(sp)
    80008278:	05413823          	sd	s4,80(sp)
    8000827c:	05513423          	sd	s5,72(sp)
    80008280:	05613023          	sd	s6,64(sp)
    80008284:	03713c23          	sd	s7,56(sp)
    80008288:	03813823          	sd	s8,48(sp)
    8000828c:	03913423          	sd	s9,40(sp)
    80008290:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80008294:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80008298:	00003517          	auipc	a0,0x3
    8000829c:	23850513          	addi	a0,a0,568 # 8000b4d0 <CONSOLE_STATUS+0x4c0>
    800082a0:	00000097          	auipc	ra,0x0
    800082a4:	aa8080e7          	jalr	-1368(ra) # 80007d48 <_Z11printStringPKc>
    getString(input, 30);
    800082a8:	01e00593          	li	a1,30
    800082ac:	f8040493          	addi	s1,s0,-128
    800082b0:	00048513          	mv	a0,s1
    800082b4:	00000097          	auipc	ra,0x0
    800082b8:	b1c080e7          	jalr	-1252(ra) # 80007dd0 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800082bc:	00048513          	mv	a0,s1
    800082c0:	00000097          	auipc	ra,0x0
    800082c4:	be8080e7          	jalr	-1048(ra) # 80007ea8 <_Z11stringToIntPKc>
    800082c8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800082cc:	00003517          	auipc	a0,0x3
    800082d0:	22450513          	addi	a0,a0,548 # 8000b4f0 <CONSOLE_STATUS+0x4e0>
    800082d4:	00000097          	auipc	ra,0x0
    800082d8:	a74080e7          	jalr	-1420(ra) # 80007d48 <_Z11printStringPKc>
    getString(input, 30);
    800082dc:	01e00593          	li	a1,30
    800082e0:	00048513          	mv	a0,s1
    800082e4:	00000097          	auipc	ra,0x0
    800082e8:	aec080e7          	jalr	-1300(ra) # 80007dd0 <_Z9getStringPci>
    n = stringToInt(input);
    800082ec:	00048513          	mv	a0,s1
    800082f0:	00000097          	auipc	ra,0x0
    800082f4:	bb8080e7          	jalr	-1096(ra) # 80007ea8 <_Z11stringToIntPKc>
    800082f8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800082fc:	00003517          	auipc	a0,0x3
    80008300:	21450513          	addi	a0,a0,532 # 8000b510 <CONSOLE_STATUS+0x500>
    80008304:	00000097          	auipc	ra,0x0
    80008308:	a44080e7          	jalr	-1468(ra) # 80007d48 <_Z11printStringPKc>
    8000830c:	00000613          	li	a2,0
    80008310:	00a00593          	li	a1,10
    80008314:	00090513          	mv	a0,s2
    80008318:	00000097          	auipc	ra,0x0
    8000831c:	be0080e7          	jalr	-1056(ra) # 80007ef8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80008320:	00003517          	auipc	a0,0x3
    80008324:	20850513          	addi	a0,a0,520 # 8000b528 <CONSOLE_STATUS+0x518>
    80008328:	00000097          	auipc	ra,0x0
    8000832c:	a20080e7          	jalr	-1504(ra) # 80007d48 <_Z11printStringPKc>
    80008330:	00000613          	li	a2,0
    80008334:	00a00593          	li	a1,10
    80008338:	00048513          	mv	a0,s1
    8000833c:	00000097          	auipc	ra,0x0
    80008340:	bbc080e7          	jalr	-1092(ra) # 80007ef8 <_Z8printIntiii>
    printString(".\n");
    80008344:	00003517          	auipc	a0,0x3
    80008348:	1fc50513          	addi	a0,a0,508 # 8000b540 <CONSOLE_STATUS+0x530>
    8000834c:	00000097          	auipc	ra,0x0
    80008350:	9fc080e7          	jalr	-1540(ra) # 80007d48 <_Z11printStringPKc>
    if(threadNum > n) {
    80008354:	0324c463          	blt	s1,s2,8000837c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80008358:	03205c63          	blez	s2,80008390 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000835c:	03800513          	li	a0,56
    80008360:	ffff9097          	auipc	ra,0xffff9
    80008364:	e5c080e7          	jalr	-420(ra) # 800011bc <_Znwm>
    80008368:	00050a93          	mv	s5,a0
    8000836c:	00048593          	mv	a1,s1
    80008370:	fffff097          	auipc	ra,0xfffff
    80008374:	abc080e7          	jalr	-1348(ra) # 80006e2c <_ZN9BufferCPPC1Ei>
    80008378:	0300006f          	j	800083a8 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000837c:	00003517          	auipc	a0,0x3
    80008380:	1cc50513          	addi	a0,a0,460 # 8000b548 <CONSOLE_STATUS+0x538>
    80008384:	00000097          	auipc	ra,0x0
    80008388:	9c4080e7          	jalr	-1596(ra) # 80007d48 <_Z11printStringPKc>
        return;
    8000838c:	0140006f          	j	800083a0 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80008390:	00003517          	auipc	a0,0x3
    80008394:	1f850513          	addi	a0,a0,504 # 8000b588 <CONSOLE_STATUS+0x578>
    80008398:	00000097          	auipc	ra,0x0
    8000839c:	9b0080e7          	jalr	-1616(ra) # 80007d48 <_Z11printStringPKc>
        return;
    800083a0:	000b8113          	mv	sp,s7
    800083a4:	2380006f          	j	800085dc <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800083a8:	01000513          	li	a0,16
    800083ac:	ffff9097          	auipc	ra,0xffff9
    800083b0:	e10080e7          	jalr	-496(ra) # 800011bc <_Znwm>
    800083b4:	00050493          	mv	s1,a0
    800083b8:	00000593          	li	a1,0
    800083bc:	ffff9097          	auipc	ra,0xffff9
    800083c0:	018080e7          	jalr	24(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800083c4:	00006797          	auipc	a5,0x6
    800083c8:	e297b223          	sd	s1,-476(a5) # 8000e1e8 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800083cc:	00391793          	slli	a5,s2,0x3
    800083d0:	00f78793          	addi	a5,a5,15
    800083d4:	ff07f793          	andi	a5,a5,-16
    800083d8:	40f10133          	sub	sp,sp,a5
    800083dc:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800083e0:	0019071b          	addiw	a4,s2,1
    800083e4:	00171793          	slli	a5,a4,0x1
    800083e8:	00e787b3          	add	a5,a5,a4
    800083ec:	00379793          	slli	a5,a5,0x3
    800083f0:	00f78793          	addi	a5,a5,15
    800083f4:	ff07f793          	andi	a5,a5,-16
    800083f8:	40f10133          	sub	sp,sp,a5
    800083fc:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80008400:	00191c13          	slli	s8,s2,0x1
    80008404:	012c07b3          	add	a5,s8,s2
    80008408:	00379793          	slli	a5,a5,0x3
    8000840c:	00fa07b3          	add	a5,s4,a5
    80008410:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80008414:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80008418:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    8000841c:	02800513          	li	a0,40
    80008420:	ffff9097          	auipc	ra,0xffff9
    80008424:	d9c080e7          	jalr	-612(ra) # 800011bc <_Znwm>
    80008428:	00050b13          	mv	s6,a0
    8000842c:	012c0c33          	add	s8,s8,s2
    80008430:	003c1c13          	slli	s8,s8,0x3
    80008434:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80008438:	ffff9097          	auipc	ra,0xffff9
    8000843c:	f68080e7          	jalr	-152(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80008440:	00006797          	auipc	a5,0x6
    80008444:	c7078793          	addi	a5,a5,-912 # 8000e0b0 <_ZTV12ConsumerSync+0x10>
    80008448:	00fb3023          	sd	a5,0(s6)
    8000844c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80008450:	000b0513          	mv	a0,s6
    80008454:	ffff9097          	auipc	ra,0xffff9
    80008458:	e64080e7          	jalr	-412(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000845c:	00000493          	li	s1,0
    80008460:	0380006f          	j	80008498 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80008464:	00006797          	auipc	a5,0x6
    80008468:	c2478793          	addi	a5,a5,-988 # 8000e088 <_ZTV12ProducerSync+0x10>
    8000846c:	00fcb023          	sd	a5,0(s9)
    80008470:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80008474:	00349793          	slli	a5,s1,0x3
    80008478:	00f987b3          	add	a5,s3,a5
    8000847c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80008480:	00349793          	slli	a5,s1,0x3
    80008484:	00f987b3          	add	a5,s3,a5
    80008488:	0007b503          	ld	a0,0(a5)
    8000848c:	ffff9097          	auipc	ra,0xffff9
    80008490:	e2c080e7          	jalr	-468(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80008494:	0014849b          	addiw	s1,s1,1
    80008498:	0b24d063          	bge	s1,s2,80008538 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    8000849c:	00149793          	slli	a5,s1,0x1
    800084a0:	009787b3          	add	a5,a5,s1
    800084a4:	00379793          	slli	a5,a5,0x3
    800084a8:	00fa07b3          	add	a5,s4,a5
    800084ac:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800084b0:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800084b4:	00006717          	auipc	a4,0x6
    800084b8:	d3473703          	ld	a4,-716(a4) # 8000e1e8 <_ZL10waitForAll>
    800084bc:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800084c0:	02905863          	blez	s1,800084f0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800084c4:	02800513          	li	a0,40
    800084c8:	ffff9097          	auipc	ra,0xffff9
    800084cc:	cf4080e7          	jalr	-780(ra) # 800011bc <_Znwm>
    800084d0:	00050c93          	mv	s9,a0
    800084d4:	00149c13          	slli	s8,s1,0x1
    800084d8:	009c0c33          	add	s8,s8,s1
    800084dc:	003c1c13          	slli	s8,s8,0x3
    800084e0:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800084e4:	ffff9097          	auipc	ra,0xffff9
    800084e8:	ebc080e7          	jalr	-324(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800084ec:	f79ff06f          	j	80008464 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800084f0:	02800513          	li	a0,40
    800084f4:	ffff9097          	auipc	ra,0xffff9
    800084f8:	cc8080e7          	jalr	-824(ra) # 800011bc <_Znwm>
    800084fc:	00050c93          	mv	s9,a0
    80008500:	00149c13          	slli	s8,s1,0x1
    80008504:	009c0c33          	add	s8,s8,s1
    80008508:	003c1c13          	slli	s8,s8,0x3
    8000850c:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80008510:	ffff9097          	auipc	ra,0xffff9
    80008514:	e90080e7          	jalr	-368(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80008518:	00006797          	auipc	a5,0x6
    8000851c:	b4878793          	addi	a5,a5,-1208 # 8000e060 <_ZTV16ProducerKeyboard+0x10>
    80008520:	00fcb023          	sd	a5,0(s9)
    80008524:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80008528:	00349793          	slli	a5,s1,0x3
    8000852c:	00f987b3          	add	a5,s3,a5
    80008530:	0197b023          	sd	s9,0(a5)
    80008534:	f4dff06f          	j	80008480 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80008538:	ffff9097          	auipc	ra,0xffff9
    8000853c:	de0080e7          	jalr	-544(ra) # 80001318 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80008540:	00000493          	li	s1,0
    80008544:	00994e63          	blt	s2,s1,80008560 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80008548:	00006517          	auipc	a0,0x6
    8000854c:	ca053503          	ld	a0,-864(a0) # 8000e1e8 <_ZL10waitForAll>
    80008550:	ffff9097          	auipc	ra,0xffff9
    80008554:	ebc080e7          	jalr	-324(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80008558:	0014849b          	addiw	s1,s1,1
    8000855c:	fe9ff06f          	j	80008544 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80008560:	00000493          	li	s1,0
    80008564:	0080006f          	j	8000856c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80008568:	0014849b          	addiw	s1,s1,1
    8000856c:	0324d263          	bge	s1,s2,80008590 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80008570:	00349793          	slli	a5,s1,0x3
    80008574:	00f987b3          	add	a5,s3,a5
    80008578:	0007b503          	ld	a0,0(a5)
    8000857c:	fe0506e3          	beqz	a0,80008568 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80008580:	00053783          	ld	a5,0(a0)
    80008584:	0087b783          	ld	a5,8(a5)
    80008588:	000780e7          	jalr	a5
    8000858c:	fddff06f          	j	80008568 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80008590:	000b0a63          	beqz	s6,800085a4 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80008594:	000b3783          	ld	a5,0(s6)
    80008598:	0087b783          	ld	a5,8(a5)
    8000859c:	000b0513          	mv	a0,s6
    800085a0:	000780e7          	jalr	a5
    delete waitForAll;
    800085a4:	00006517          	auipc	a0,0x6
    800085a8:	c4453503          	ld	a0,-956(a0) # 8000e1e8 <_ZL10waitForAll>
    800085ac:	00050863          	beqz	a0,800085bc <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800085b0:	00053783          	ld	a5,0(a0)
    800085b4:	0087b783          	ld	a5,8(a5)
    800085b8:	000780e7          	jalr	a5
    delete buffer;
    800085bc:	000a8e63          	beqz	s5,800085d8 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800085c0:	000a8513          	mv	a0,s5
    800085c4:	fffff097          	auipc	ra,0xfffff
    800085c8:	b60080e7          	jalr	-1184(ra) # 80007124 <_ZN9BufferCPPD1Ev>
    800085cc:	000a8513          	mv	a0,s5
    800085d0:	ffff9097          	auipc	ra,0xffff9
    800085d4:	c14080e7          	jalr	-1004(ra) # 800011e4 <_ZdlPv>
    800085d8:	000b8113          	mv	sp,s7

}
    800085dc:	f8040113          	addi	sp,s0,-128
    800085e0:	07813083          	ld	ra,120(sp)
    800085e4:	07013403          	ld	s0,112(sp)
    800085e8:	06813483          	ld	s1,104(sp)
    800085ec:	06013903          	ld	s2,96(sp)
    800085f0:	05813983          	ld	s3,88(sp)
    800085f4:	05013a03          	ld	s4,80(sp)
    800085f8:	04813a83          	ld	s5,72(sp)
    800085fc:	04013b03          	ld	s6,64(sp)
    80008600:	03813b83          	ld	s7,56(sp)
    80008604:	03013c03          	ld	s8,48(sp)
    80008608:	02813c83          	ld	s9,40(sp)
    8000860c:	08010113          	addi	sp,sp,128
    80008610:	00008067          	ret
    80008614:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80008618:	000a8513          	mv	a0,s5
    8000861c:	ffff9097          	auipc	ra,0xffff9
    80008620:	bc8080e7          	jalr	-1080(ra) # 800011e4 <_ZdlPv>
    80008624:	00048513          	mv	a0,s1
    80008628:	00007097          	auipc	ra,0x7
    8000862c:	c90080e7          	jalr	-880(ra) # 8000f2b8 <_Unwind_Resume>
    80008630:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80008634:	00048513          	mv	a0,s1
    80008638:	ffff9097          	auipc	ra,0xffff9
    8000863c:	bac080e7          	jalr	-1108(ra) # 800011e4 <_ZdlPv>
    80008640:	00090513          	mv	a0,s2
    80008644:	00007097          	auipc	ra,0x7
    80008648:	c74080e7          	jalr	-908(ra) # 8000f2b8 <_Unwind_Resume>
    8000864c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80008650:	000b0513          	mv	a0,s6
    80008654:	ffff9097          	auipc	ra,0xffff9
    80008658:	b90080e7          	jalr	-1136(ra) # 800011e4 <_ZdlPv>
    8000865c:	00048513          	mv	a0,s1
    80008660:	00007097          	auipc	ra,0x7
    80008664:	c58080e7          	jalr	-936(ra) # 8000f2b8 <_Unwind_Resume>
    80008668:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    8000866c:	000c8513          	mv	a0,s9
    80008670:	ffff9097          	auipc	ra,0xffff9
    80008674:	b74080e7          	jalr	-1164(ra) # 800011e4 <_ZdlPv>
    80008678:	00048513          	mv	a0,s1
    8000867c:	00007097          	auipc	ra,0x7
    80008680:	c3c080e7          	jalr	-964(ra) # 8000f2b8 <_Unwind_Resume>
    80008684:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80008688:	000c8513          	mv	a0,s9
    8000868c:	ffff9097          	auipc	ra,0xffff9
    80008690:	b58080e7          	jalr	-1192(ra) # 800011e4 <_ZdlPv>
    80008694:	00048513          	mv	a0,s1
    80008698:	00007097          	auipc	ra,0x7
    8000869c:	c20080e7          	jalr	-992(ra) # 8000f2b8 <_Unwind_Resume>

00000000800086a0 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800086a0:	ff010113          	addi	sp,sp,-16
    800086a4:	00113423          	sd	ra,8(sp)
    800086a8:	00813023          	sd	s0,0(sp)
    800086ac:	01010413          	addi	s0,sp,16
    800086b0:	00006797          	auipc	a5,0x6
    800086b4:	a0078793          	addi	a5,a5,-1536 # 8000e0b0 <_ZTV12ConsumerSync+0x10>
    800086b8:	00f53023          	sd	a5,0(a0)
    800086bc:	ffff9097          	auipc	ra,0xffff9
    800086c0:	a90080e7          	jalr	-1392(ra) # 8000114c <_ZN6ThreadD1Ev>
    800086c4:	00813083          	ld	ra,8(sp)
    800086c8:	00013403          	ld	s0,0(sp)
    800086cc:	01010113          	addi	sp,sp,16
    800086d0:	00008067          	ret

00000000800086d4 <_ZN12ConsumerSyncD0Ev>:
    800086d4:	fe010113          	addi	sp,sp,-32
    800086d8:	00113c23          	sd	ra,24(sp)
    800086dc:	00813823          	sd	s0,16(sp)
    800086e0:	00913423          	sd	s1,8(sp)
    800086e4:	02010413          	addi	s0,sp,32
    800086e8:	00050493          	mv	s1,a0
    800086ec:	00006797          	auipc	a5,0x6
    800086f0:	9c478793          	addi	a5,a5,-1596 # 8000e0b0 <_ZTV12ConsumerSync+0x10>
    800086f4:	00f53023          	sd	a5,0(a0)
    800086f8:	ffff9097          	auipc	ra,0xffff9
    800086fc:	a54080e7          	jalr	-1452(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008700:	00048513          	mv	a0,s1
    80008704:	ffff9097          	auipc	ra,0xffff9
    80008708:	ae0080e7          	jalr	-1312(ra) # 800011e4 <_ZdlPv>
    8000870c:	01813083          	ld	ra,24(sp)
    80008710:	01013403          	ld	s0,16(sp)
    80008714:	00813483          	ld	s1,8(sp)
    80008718:	02010113          	addi	sp,sp,32
    8000871c:	00008067          	ret

0000000080008720 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80008720:	ff010113          	addi	sp,sp,-16
    80008724:	00113423          	sd	ra,8(sp)
    80008728:	00813023          	sd	s0,0(sp)
    8000872c:	01010413          	addi	s0,sp,16
    80008730:	00006797          	auipc	a5,0x6
    80008734:	95878793          	addi	a5,a5,-1704 # 8000e088 <_ZTV12ProducerSync+0x10>
    80008738:	00f53023          	sd	a5,0(a0)
    8000873c:	ffff9097          	auipc	ra,0xffff9
    80008740:	a10080e7          	jalr	-1520(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008744:	00813083          	ld	ra,8(sp)
    80008748:	00013403          	ld	s0,0(sp)
    8000874c:	01010113          	addi	sp,sp,16
    80008750:	00008067          	ret

0000000080008754 <_ZN12ProducerSyncD0Ev>:
    80008754:	fe010113          	addi	sp,sp,-32
    80008758:	00113c23          	sd	ra,24(sp)
    8000875c:	00813823          	sd	s0,16(sp)
    80008760:	00913423          	sd	s1,8(sp)
    80008764:	02010413          	addi	s0,sp,32
    80008768:	00050493          	mv	s1,a0
    8000876c:	00006797          	auipc	a5,0x6
    80008770:	91c78793          	addi	a5,a5,-1764 # 8000e088 <_ZTV12ProducerSync+0x10>
    80008774:	00f53023          	sd	a5,0(a0)
    80008778:	ffff9097          	auipc	ra,0xffff9
    8000877c:	9d4080e7          	jalr	-1580(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008780:	00048513          	mv	a0,s1
    80008784:	ffff9097          	auipc	ra,0xffff9
    80008788:	a60080e7          	jalr	-1440(ra) # 800011e4 <_ZdlPv>
    8000878c:	01813083          	ld	ra,24(sp)
    80008790:	01013403          	ld	s0,16(sp)
    80008794:	00813483          	ld	s1,8(sp)
    80008798:	02010113          	addi	sp,sp,32
    8000879c:	00008067          	ret

00000000800087a0 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800087a0:	ff010113          	addi	sp,sp,-16
    800087a4:	00113423          	sd	ra,8(sp)
    800087a8:	00813023          	sd	s0,0(sp)
    800087ac:	01010413          	addi	s0,sp,16
    800087b0:	00006797          	auipc	a5,0x6
    800087b4:	8b078793          	addi	a5,a5,-1872 # 8000e060 <_ZTV16ProducerKeyboard+0x10>
    800087b8:	00f53023          	sd	a5,0(a0)
    800087bc:	ffff9097          	auipc	ra,0xffff9
    800087c0:	990080e7          	jalr	-1648(ra) # 8000114c <_ZN6ThreadD1Ev>
    800087c4:	00813083          	ld	ra,8(sp)
    800087c8:	00013403          	ld	s0,0(sp)
    800087cc:	01010113          	addi	sp,sp,16
    800087d0:	00008067          	ret

00000000800087d4 <_ZN16ProducerKeyboardD0Ev>:
    800087d4:	fe010113          	addi	sp,sp,-32
    800087d8:	00113c23          	sd	ra,24(sp)
    800087dc:	00813823          	sd	s0,16(sp)
    800087e0:	00913423          	sd	s1,8(sp)
    800087e4:	02010413          	addi	s0,sp,32
    800087e8:	00050493          	mv	s1,a0
    800087ec:	00006797          	auipc	a5,0x6
    800087f0:	87478793          	addi	a5,a5,-1932 # 8000e060 <_ZTV16ProducerKeyboard+0x10>
    800087f4:	00f53023          	sd	a5,0(a0)
    800087f8:	ffff9097          	auipc	ra,0xffff9
    800087fc:	954080e7          	jalr	-1708(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008800:	00048513          	mv	a0,s1
    80008804:	ffff9097          	auipc	ra,0xffff9
    80008808:	9e0080e7          	jalr	-1568(ra) # 800011e4 <_ZdlPv>
    8000880c:	01813083          	ld	ra,24(sp)
    80008810:	01013403          	ld	s0,16(sp)
    80008814:	00813483          	ld	s1,8(sp)
    80008818:	02010113          	addi	sp,sp,32
    8000881c:	00008067          	ret

0000000080008820 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80008820:	ff010113          	addi	sp,sp,-16
    80008824:	00113423          	sd	ra,8(sp)
    80008828:	00813023          	sd	s0,0(sp)
    8000882c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80008830:	02053583          	ld	a1,32(a0)
    80008834:	fffff097          	auipc	ra,0xfffff
    80008838:	7e4080e7          	jalr	2020(ra) # 80008018 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    8000883c:	00813083          	ld	ra,8(sp)
    80008840:	00013403          	ld	s0,0(sp)
    80008844:	01010113          	addi	sp,sp,16
    80008848:	00008067          	ret

000000008000884c <_ZN12ProducerSync3runEv>:
    void run() override {
    8000884c:	ff010113          	addi	sp,sp,-16
    80008850:	00113423          	sd	ra,8(sp)
    80008854:	00813023          	sd	s0,0(sp)
    80008858:	01010413          	addi	s0,sp,16
        producer(td);
    8000885c:	02053583          	ld	a1,32(a0)
    80008860:	00000097          	auipc	ra,0x0
    80008864:	878080e7          	jalr	-1928(ra) # 800080d8 <_ZN12ProducerSync8producerEPv>
    }
    80008868:	00813083          	ld	ra,8(sp)
    8000886c:	00013403          	ld	s0,0(sp)
    80008870:	01010113          	addi	sp,sp,16
    80008874:	00008067          	ret

0000000080008878 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80008878:	ff010113          	addi	sp,sp,-16
    8000887c:	00113423          	sd	ra,8(sp)
    80008880:	00813023          	sd	s0,0(sp)
    80008884:	01010413          	addi	s0,sp,16
        consumer(td);
    80008888:	02053583          	ld	a1,32(a0)
    8000888c:	00000097          	auipc	ra,0x0
    80008890:	8e0080e7          	jalr	-1824(ra) # 8000816c <_ZN12ConsumerSync8consumerEPv>
    }
    80008894:	00813083          	ld	ra,8(sp)
    80008898:	00013403          	ld	s0,0(sp)
    8000889c:	01010113          	addi	sp,sp,16
    800088a0:	00008067          	ret

00000000800088a4 <start>:
    800088a4:	ff010113          	addi	sp,sp,-16
    800088a8:	00813423          	sd	s0,8(sp)
    800088ac:	01010413          	addi	s0,sp,16
    800088b0:	300027f3          	csrr	a5,mstatus
    800088b4:	ffffe737          	lui	a4,0xffffe
    800088b8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffef3af>
    800088bc:	00e7f7b3          	and	a5,a5,a4
    800088c0:	00001737          	lui	a4,0x1
    800088c4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800088c8:	00e7e7b3          	or	a5,a5,a4
    800088cc:	30079073          	csrw	mstatus,a5
    800088d0:	00000797          	auipc	a5,0x0
    800088d4:	16078793          	addi	a5,a5,352 # 80008a30 <system_main>
    800088d8:	34179073          	csrw	mepc,a5
    800088dc:	00000793          	li	a5,0
    800088e0:	18079073          	csrw	satp,a5
    800088e4:	000107b7          	lui	a5,0x10
    800088e8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800088ec:	30279073          	csrw	medeleg,a5
    800088f0:	30379073          	csrw	mideleg,a5
    800088f4:	104027f3          	csrr	a5,sie
    800088f8:	2227e793          	ori	a5,a5,546
    800088fc:	10479073          	csrw	sie,a5
    80008900:	fff00793          	li	a5,-1
    80008904:	00a7d793          	srli	a5,a5,0xa
    80008908:	3b079073          	csrw	pmpaddr0,a5
    8000890c:	00f00793          	li	a5,15
    80008910:	3a079073          	csrw	pmpcfg0,a5
    80008914:	f14027f3          	csrr	a5,mhartid
    80008918:	0200c737          	lui	a4,0x200c
    8000891c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80008920:	0007869b          	sext.w	a3,a5
    80008924:	00269713          	slli	a4,a3,0x2
    80008928:	000f4637          	lui	a2,0xf4
    8000892c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80008930:	00d70733          	add	a4,a4,a3
    80008934:	0037979b          	slliw	a5,a5,0x3
    80008938:	020046b7          	lui	a3,0x2004
    8000893c:	00d787b3          	add	a5,a5,a3
    80008940:	00c585b3          	add	a1,a1,a2
    80008944:	00371693          	slli	a3,a4,0x3
    80008948:	00006717          	auipc	a4,0x6
    8000894c:	8a870713          	addi	a4,a4,-1880 # 8000e1f0 <timer_scratch>
    80008950:	00b7b023          	sd	a1,0(a5)
    80008954:	00d70733          	add	a4,a4,a3
    80008958:	00f73c23          	sd	a5,24(a4)
    8000895c:	02c73023          	sd	a2,32(a4)
    80008960:	34071073          	csrw	mscratch,a4
    80008964:	00000797          	auipc	a5,0x0
    80008968:	6ec78793          	addi	a5,a5,1772 # 80009050 <timervec>
    8000896c:	30579073          	csrw	mtvec,a5
    80008970:	300027f3          	csrr	a5,mstatus
    80008974:	0087e793          	ori	a5,a5,8
    80008978:	30079073          	csrw	mstatus,a5
    8000897c:	304027f3          	csrr	a5,mie
    80008980:	0807e793          	ori	a5,a5,128
    80008984:	30479073          	csrw	mie,a5
    80008988:	f14027f3          	csrr	a5,mhartid
    8000898c:	0007879b          	sext.w	a5,a5
    80008990:	00078213          	mv	tp,a5
    80008994:	30200073          	mret
    80008998:	00813403          	ld	s0,8(sp)
    8000899c:	01010113          	addi	sp,sp,16
    800089a0:	00008067          	ret

00000000800089a4 <timerinit>:
    800089a4:	ff010113          	addi	sp,sp,-16
    800089a8:	00813423          	sd	s0,8(sp)
    800089ac:	01010413          	addi	s0,sp,16
    800089b0:	f14027f3          	csrr	a5,mhartid
    800089b4:	0200c737          	lui	a4,0x200c
    800089b8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800089bc:	0007869b          	sext.w	a3,a5
    800089c0:	00269713          	slli	a4,a3,0x2
    800089c4:	000f4637          	lui	a2,0xf4
    800089c8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800089cc:	00d70733          	add	a4,a4,a3
    800089d0:	0037979b          	slliw	a5,a5,0x3
    800089d4:	020046b7          	lui	a3,0x2004
    800089d8:	00d787b3          	add	a5,a5,a3
    800089dc:	00c585b3          	add	a1,a1,a2
    800089e0:	00371693          	slli	a3,a4,0x3
    800089e4:	00006717          	auipc	a4,0x6
    800089e8:	80c70713          	addi	a4,a4,-2036 # 8000e1f0 <timer_scratch>
    800089ec:	00b7b023          	sd	a1,0(a5)
    800089f0:	00d70733          	add	a4,a4,a3
    800089f4:	00f73c23          	sd	a5,24(a4)
    800089f8:	02c73023          	sd	a2,32(a4)
    800089fc:	34071073          	csrw	mscratch,a4
    80008a00:	00000797          	auipc	a5,0x0
    80008a04:	65078793          	addi	a5,a5,1616 # 80009050 <timervec>
    80008a08:	30579073          	csrw	mtvec,a5
    80008a0c:	300027f3          	csrr	a5,mstatus
    80008a10:	0087e793          	ori	a5,a5,8
    80008a14:	30079073          	csrw	mstatus,a5
    80008a18:	304027f3          	csrr	a5,mie
    80008a1c:	0807e793          	ori	a5,a5,128
    80008a20:	30479073          	csrw	mie,a5
    80008a24:	00813403          	ld	s0,8(sp)
    80008a28:	01010113          	addi	sp,sp,16
    80008a2c:	00008067          	ret

0000000080008a30 <system_main>:
    80008a30:	fe010113          	addi	sp,sp,-32
    80008a34:	00813823          	sd	s0,16(sp)
    80008a38:	00913423          	sd	s1,8(sp)
    80008a3c:	00113c23          	sd	ra,24(sp)
    80008a40:	02010413          	addi	s0,sp,32
    80008a44:	00000097          	auipc	ra,0x0
    80008a48:	0c4080e7          	jalr	196(ra) # 80008b08 <cpuid>
    80008a4c:	00005497          	auipc	s1,0x5
    80008a50:	6e448493          	addi	s1,s1,1764 # 8000e130 <started>
    80008a54:	02050263          	beqz	a0,80008a78 <system_main+0x48>
    80008a58:	0004a783          	lw	a5,0(s1)
    80008a5c:	0007879b          	sext.w	a5,a5
    80008a60:	fe078ce3          	beqz	a5,80008a58 <system_main+0x28>
    80008a64:	0ff0000f          	fence
    80008a68:	00003517          	auipc	a0,0x3
    80008a6c:	f9850513          	addi	a0,a0,-104 # 8000ba00 <CONSOLE_STATUS+0x9f0>
    80008a70:	00001097          	auipc	ra,0x1
    80008a74:	a7c080e7          	jalr	-1412(ra) # 800094ec <panic>
    80008a78:	00001097          	auipc	ra,0x1
    80008a7c:	9d0080e7          	jalr	-1584(ra) # 80009448 <consoleinit>
    80008a80:	00001097          	auipc	ra,0x1
    80008a84:	15c080e7          	jalr	348(ra) # 80009bdc <printfinit>
    80008a88:	00003517          	auipc	a0,0x3
    80008a8c:	df850513          	addi	a0,a0,-520 # 8000b880 <CONSOLE_STATUS+0x870>
    80008a90:	00001097          	auipc	ra,0x1
    80008a94:	ab8080e7          	jalr	-1352(ra) # 80009548 <__printf>
    80008a98:	00003517          	auipc	a0,0x3
    80008a9c:	f3850513          	addi	a0,a0,-200 # 8000b9d0 <CONSOLE_STATUS+0x9c0>
    80008aa0:	00001097          	auipc	ra,0x1
    80008aa4:	aa8080e7          	jalr	-1368(ra) # 80009548 <__printf>
    80008aa8:	00003517          	auipc	a0,0x3
    80008aac:	dd850513          	addi	a0,a0,-552 # 8000b880 <CONSOLE_STATUS+0x870>
    80008ab0:	00001097          	auipc	ra,0x1
    80008ab4:	a98080e7          	jalr	-1384(ra) # 80009548 <__printf>
    80008ab8:	00001097          	auipc	ra,0x1
    80008abc:	4b0080e7          	jalr	1200(ra) # 80009f68 <kinit>
    80008ac0:	00000097          	auipc	ra,0x0
    80008ac4:	148080e7          	jalr	328(ra) # 80008c08 <trapinit>
    80008ac8:	00000097          	auipc	ra,0x0
    80008acc:	16c080e7          	jalr	364(ra) # 80008c34 <trapinithart>
    80008ad0:	00000097          	auipc	ra,0x0
    80008ad4:	5c0080e7          	jalr	1472(ra) # 80009090 <plicinit>
    80008ad8:	00000097          	auipc	ra,0x0
    80008adc:	5e0080e7          	jalr	1504(ra) # 800090b8 <plicinithart>
    80008ae0:	00000097          	auipc	ra,0x0
    80008ae4:	078080e7          	jalr	120(ra) # 80008b58 <userinit>
    80008ae8:	0ff0000f          	fence
    80008aec:	00100793          	li	a5,1
    80008af0:	00003517          	auipc	a0,0x3
    80008af4:	ef850513          	addi	a0,a0,-264 # 8000b9e8 <CONSOLE_STATUS+0x9d8>
    80008af8:	00f4a023          	sw	a5,0(s1)
    80008afc:	00001097          	auipc	ra,0x1
    80008b00:	a4c080e7          	jalr	-1460(ra) # 80009548 <__printf>
    80008b04:	0000006f          	j	80008b04 <system_main+0xd4>

0000000080008b08 <cpuid>:
    80008b08:	ff010113          	addi	sp,sp,-16
    80008b0c:	00813423          	sd	s0,8(sp)
    80008b10:	01010413          	addi	s0,sp,16
    80008b14:	00020513          	mv	a0,tp
    80008b18:	00813403          	ld	s0,8(sp)
    80008b1c:	0005051b          	sext.w	a0,a0
    80008b20:	01010113          	addi	sp,sp,16
    80008b24:	00008067          	ret

0000000080008b28 <mycpu>:
    80008b28:	ff010113          	addi	sp,sp,-16
    80008b2c:	00813423          	sd	s0,8(sp)
    80008b30:	01010413          	addi	s0,sp,16
    80008b34:	00020793          	mv	a5,tp
    80008b38:	00813403          	ld	s0,8(sp)
    80008b3c:	0007879b          	sext.w	a5,a5
    80008b40:	00779793          	slli	a5,a5,0x7
    80008b44:	00006517          	auipc	a0,0x6
    80008b48:	6dc50513          	addi	a0,a0,1756 # 8000f220 <cpus>
    80008b4c:	00f50533          	add	a0,a0,a5
    80008b50:	01010113          	addi	sp,sp,16
    80008b54:	00008067          	ret

0000000080008b58 <userinit>:
    80008b58:	ff010113          	addi	sp,sp,-16
    80008b5c:	00813423          	sd	s0,8(sp)
    80008b60:	01010413          	addi	s0,sp,16
    80008b64:	00813403          	ld	s0,8(sp)
    80008b68:	01010113          	addi	sp,sp,16
    80008b6c:	ffff9317          	auipc	t1,0xffff9
    80008b70:	1b830067          	jr	440(t1) # 80001d24 <main>

0000000080008b74 <either_copyout>:
    80008b74:	ff010113          	addi	sp,sp,-16
    80008b78:	00813023          	sd	s0,0(sp)
    80008b7c:	00113423          	sd	ra,8(sp)
    80008b80:	01010413          	addi	s0,sp,16
    80008b84:	02051663          	bnez	a0,80008bb0 <either_copyout+0x3c>
    80008b88:	00058513          	mv	a0,a1
    80008b8c:	00060593          	mv	a1,a2
    80008b90:	0006861b          	sext.w	a2,a3
    80008b94:	00002097          	auipc	ra,0x2
    80008b98:	c60080e7          	jalr	-928(ra) # 8000a7f4 <__memmove>
    80008b9c:	00813083          	ld	ra,8(sp)
    80008ba0:	00013403          	ld	s0,0(sp)
    80008ba4:	00000513          	li	a0,0
    80008ba8:	01010113          	addi	sp,sp,16
    80008bac:	00008067          	ret
    80008bb0:	00003517          	auipc	a0,0x3
    80008bb4:	e7850513          	addi	a0,a0,-392 # 8000ba28 <CONSOLE_STATUS+0xa18>
    80008bb8:	00001097          	auipc	ra,0x1
    80008bbc:	934080e7          	jalr	-1740(ra) # 800094ec <panic>

0000000080008bc0 <either_copyin>:
    80008bc0:	ff010113          	addi	sp,sp,-16
    80008bc4:	00813023          	sd	s0,0(sp)
    80008bc8:	00113423          	sd	ra,8(sp)
    80008bcc:	01010413          	addi	s0,sp,16
    80008bd0:	02059463          	bnez	a1,80008bf8 <either_copyin+0x38>
    80008bd4:	00060593          	mv	a1,a2
    80008bd8:	0006861b          	sext.w	a2,a3
    80008bdc:	00002097          	auipc	ra,0x2
    80008be0:	c18080e7          	jalr	-1000(ra) # 8000a7f4 <__memmove>
    80008be4:	00813083          	ld	ra,8(sp)
    80008be8:	00013403          	ld	s0,0(sp)
    80008bec:	00000513          	li	a0,0
    80008bf0:	01010113          	addi	sp,sp,16
    80008bf4:	00008067          	ret
    80008bf8:	00003517          	auipc	a0,0x3
    80008bfc:	e5850513          	addi	a0,a0,-424 # 8000ba50 <CONSOLE_STATUS+0xa40>
    80008c00:	00001097          	auipc	ra,0x1
    80008c04:	8ec080e7          	jalr	-1812(ra) # 800094ec <panic>

0000000080008c08 <trapinit>:
    80008c08:	ff010113          	addi	sp,sp,-16
    80008c0c:	00813423          	sd	s0,8(sp)
    80008c10:	01010413          	addi	s0,sp,16
    80008c14:	00813403          	ld	s0,8(sp)
    80008c18:	00003597          	auipc	a1,0x3
    80008c1c:	e6058593          	addi	a1,a1,-416 # 8000ba78 <CONSOLE_STATUS+0xa68>
    80008c20:	00006517          	auipc	a0,0x6
    80008c24:	68050513          	addi	a0,a0,1664 # 8000f2a0 <tickslock>
    80008c28:	01010113          	addi	sp,sp,16
    80008c2c:	00001317          	auipc	t1,0x1
    80008c30:	5cc30067          	jr	1484(t1) # 8000a1f8 <initlock>

0000000080008c34 <trapinithart>:
    80008c34:	ff010113          	addi	sp,sp,-16
    80008c38:	00813423          	sd	s0,8(sp)
    80008c3c:	01010413          	addi	s0,sp,16
    80008c40:	00000797          	auipc	a5,0x0
    80008c44:	30078793          	addi	a5,a5,768 # 80008f40 <kernelvec>
    80008c48:	10579073          	csrw	stvec,a5
    80008c4c:	00813403          	ld	s0,8(sp)
    80008c50:	01010113          	addi	sp,sp,16
    80008c54:	00008067          	ret

0000000080008c58 <usertrap>:
    80008c58:	ff010113          	addi	sp,sp,-16
    80008c5c:	00813423          	sd	s0,8(sp)
    80008c60:	01010413          	addi	s0,sp,16
    80008c64:	00813403          	ld	s0,8(sp)
    80008c68:	01010113          	addi	sp,sp,16
    80008c6c:	00008067          	ret

0000000080008c70 <usertrapret>:
    80008c70:	ff010113          	addi	sp,sp,-16
    80008c74:	00813423          	sd	s0,8(sp)
    80008c78:	01010413          	addi	s0,sp,16
    80008c7c:	00813403          	ld	s0,8(sp)
    80008c80:	01010113          	addi	sp,sp,16
    80008c84:	00008067          	ret

0000000080008c88 <kerneltrap>:
    80008c88:	fe010113          	addi	sp,sp,-32
    80008c8c:	00813823          	sd	s0,16(sp)
    80008c90:	00113c23          	sd	ra,24(sp)
    80008c94:	00913423          	sd	s1,8(sp)
    80008c98:	02010413          	addi	s0,sp,32
    80008c9c:	142025f3          	csrr	a1,scause
    80008ca0:	100027f3          	csrr	a5,sstatus
    80008ca4:	0027f793          	andi	a5,a5,2
    80008ca8:	10079c63          	bnez	a5,80008dc0 <kerneltrap+0x138>
    80008cac:	142027f3          	csrr	a5,scause
    80008cb0:	0207ce63          	bltz	a5,80008cec <kerneltrap+0x64>
    80008cb4:	00003517          	auipc	a0,0x3
    80008cb8:	e0c50513          	addi	a0,a0,-500 # 8000bac0 <CONSOLE_STATUS+0xab0>
    80008cbc:	00001097          	auipc	ra,0x1
    80008cc0:	88c080e7          	jalr	-1908(ra) # 80009548 <__printf>
    80008cc4:	141025f3          	csrr	a1,sepc
    80008cc8:	14302673          	csrr	a2,stval
    80008ccc:	00003517          	auipc	a0,0x3
    80008cd0:	e0450513          	addi	a0,a0,-508 # 8000bad0 <CONSOLE_STATUS+0xac0>
    80008cd4:	00001097          	auipc	ra,0x1
    80008cd8:	874080e7          	jalr	-1932(ra) # 80009548 <__printf>
    80008cdc:	00003517          	auipc	a0,0x3
    80008ce0:	e0c50513          	addi	a0,a0,-500 # 8000bae8 <CONSOLE_STATUS+0xad8>
    80008ce4:	00001097          	auipc	ra,0x1
    80008ce8:	808080e7          	jalr	-2040(ra) # 800094ec <panic>
    80008cec:	0ff7f713          	andi	a4,a5,255
    80008cf0:	00900693          	li	a3,9
    80008cf4:	04d70063          	beq	a4,a3,80008d34 <kerneltrap+0xac>
    80008cf8:	fff00713          	li	a4,-1
    80008cfc:	03f71713          	slli	a4,a4,0x3f
    80008d00:	00170713          	addi	a4,a4,1
    80008d04:	fae798e3          	bne	a5,a4,80008cb4 <kerneltrap+0x2c>
    80008d08:	00000097          	auipc	ra,0x0
    80008d0c:	e00080e7          	jalr	-512(ra) # 80008b08 <cpuid>
    80008d10:	06050663          	beqz	a0,80008d7c <kerneltrap+0xf4>
    80008d14:	144027f3          	csrr	a5,sip
    80008d18:	ffd7f793          	andi	a5,a5,-3
    80008d1c:	14479073          	csrw	sip,a5
    80008d20:	01813083          	ld	ra,24(sp)
    80008d24:	01013403          	ld	s0,16(sp)
    80008d28:	00813483          	ld	s1,8(sp)
    80008d2c:	02010113          	addi	sp,sp,32
    80008d30:	00008067          	ret
    80008d34:	00000097          	auipc	ra,0x0
    80008d38:	3d0080e7          	jalr	976(ra) # 80009104 <plic_claim>
    80008d3c:	00a00793          	li	a5,10
    80008d40:	00050493          	mv	s1,a0
    80008d44:	06f50863          	beq	a0,a5,80008db4 <kerneltrap+0x12c>
    80008d48:	fc050ce3          	beqz	a0,80008d20 <kerneltrap+0x98>
    80008d4c:	00050593          	mv	a1,a0
    80008d50:	00003517          	auipc	a0,0x3
    80008d54:	d5050513          	addi	a0,a0,-688 # 8000baa0 <CONSOLE_STATUS+0xa90>
    80008d58:	00000097          	auipc	ra,0x0
    80008d5c:	7f0080e7          	jalr	2032(ra) # 80009548 <__printf>
    80008d60:	01013403          	ld	s0,16(sp)
    80008d64:	01813083          	ld	ra,24(sp)
    80008d68:	00048513          	mv	a0,s1
    80008d6c:	00813483          	ld	s1,8(sp)
    80008d70:	02010113          	addi	sp,sp,32
    80008d74:	00000317          	auipc	t1,0x0
    80008d78:	3c830067          	jr	968(t1) # 8000913c <plic_complete>
    80008d7c:	00006517          	auipc	a0,0x6
    80008d80:	52450513          	addi	a0,a0,1316 # 8000f2a0 <tickslock>
    80008d84:	00001097          	auipc	ra,0x1
    80008d88:	498080e7          	jalr	1176(ra) # 8000a21c <acquire>
    80008d8c:	00005717          	auipc	a4,0x5
    80008d90:	3a870713          	addi	a4,a4,936 # 8000e134 <ticks>
    80008d94:	00072783          	lw	a5,0(a4)
    80008d98:	00006517          	auipc	a0,0x6
    80008d9c:	50850513          	addi	a0,a0,1288 # 8000f2a0 <tickslock>
    80008da0:	0017879b          	addiw	a5,a5,1
    80008da4:	00f72023          	sw	a5,0(a4)
    80008da8:	00001097          	auipc	ra,0x1
    80008dac:	540080e7          	jalr	1344(ra) # 8000a2e8 <release>
    80008db0:	f65ff06f          	j	80008d14 <kerneltrap+0x8c>
    80008db4:	00001097          	auipc	ra,0x1
    80008db8:	09c080e7          	jalr	156(ra) # 80009e50 <uartintr>
    80008dbc:	fa5ff06f          	j	80008d60 <kerneltrap+0xd8>
    80008dc0:	00003517          	auipc	a0,0x3
    80008dc4:	cc050513          	addi	a0,a0,-832 # 8000ba80 <CONSOLE_STATUS+0xa70>
    80008dc8:	00000097          	auipc	ra,0x0
    80008dcc:	724080e7          	jalr	1828(ra) # 800094ec <panic>

0000000080008dd0 <clockintr>:
    80008dd0:	fe010113          	addi	sp,sp,-32
    80008dd4:	00813823          	sd	s0,16(sp)
    80008dd8:	00913423          	sd	s1,8(sp)
    80008ddc:	00113c23          	sd	ra,24(sp)
    80008de0:	02010413          	addi	s0,sp,32
    80008de4:	00006497          	auipc	s1,0x6
    80008de8:	4bc48493          	addi	s1,s1,1212 # 8000f2a0 <tickslock>
    80008dec:	00048513          	mv	a0,s1
    80008df0:	00001097          	auipc	ra,0x1
    80008df4:	42c080e7          	jalr	1068(ra) # 8000a21c <acquire>
    80008df8:	00005717          	auipc	a4,0x5
    80008dfc:	33c70713          	addi	a4,a4,828 # 8000e134 <ticks>
    80008e00:	00072783          	lw	a5,0(a4)
    80008e04:	01013403          	ld	s0,16(sp)
    80008e08:	01813083          	ld	ra,24(sp)
    80008e0c:	00048513          	mv	a0,s1
    80008e10:	0017879b          	addiw	a5,a5,1
    80008e14:	00813483          	ld	s1,8(sp)
    80008e18:	00f72023          	sw	a5,0(a4)
    80008e1c:	02010113          	addi	sp,sp,32
    80008e20:	00001317          	auipc	t1,0x1
    80008e24:	4c830067          	jr	1224(t1) # 8000a2e8 <release>

0000000080008e28 <devintr>:
    80008e28:	142027f3          	csrr	a5,scause
    80008e2c:	00000513          	li	a0,0
    80008e30:	0007c463          	bltz	a5,80008e38 <devintr+0x10>
    80008e34:	00008067          	ret
    80008e38:	fe010113          	addi	sp,sp,-32
    80008e3c:	00813823          	sd	s0,16(sp)
    80008e40:	00113c23          	sd	ra,24(sp)
    80008e44:	00913423          	sd	s1,8(sp)
    80008e48:	02010413          	addi	s0,sp,32
    80008e4c:	0ff7f713          	andi	a4,a5,255
    80008e50:	00900693          	li	a3,9
    80008e54:	04d70c63          	beq	a4,a3,80008eac <devintr+0x84>
    80008e58:	fff00713          	li	a4,-1
    80008e5c:	03f71713          	slli	a4,a4,0x3f
    80008e60:	00170713          	addi	a4,a4,1
    80008e64:	00e78c63          	beq	a5,a4,80008e7c <devintr+0x54>
    80008e68:	01813083          	ld	ra,24(sp)
    80008e6c:	01013403          	ld	s0,16(sp)
    80008e70:	00813483          	ld	s1,8(sp)
    80008e74:	02010113          	addi	sp,sp,32
    80008e78:	00008067          	ret
    80008e7c:	00000097          	auipc	ra,0x0
    80008e80:	c8c080e7          	jalr	-884(ra) # 80008b08 <cpuid>
    80008e84:	06050663          	beqz	a0,80008ef0 <devintr+0xc8>
    80008e88:	144027f3          	csrr	a5,sip
    80008e8c:	ffd7f793          	andi	a5,a5,-3
    80008e90:	14479073          	csrw	sip,a5
    80008e94:	01813083          	ld	ra,24(sp)
    80008e98:	01013403          	ld	s0,16(sp)
    80008e9c:	00813483          	ld	s1,8(sp)
    80008ea0:	00200513          	li	a0,2
    80008ea4:	02010113          	addi	sp,sp,32
    80008ea8:	00008067          	ret
    80008eac:	00000097          	auipc	ra,0x0
    80008eb0:	258080e7          	jalr	600(ra) # 80009104 <plic_claim>
    80008eb4:	00a00793          	li	a5,10
    80008eb8:	00050493          	mv	s1,a0
    80008ebc:	06f50663          	beq	a0,a5,80008f28 <devintr+0x100>
    80008ec0:	00100513          	li	a0,1
    80008ec4:	fa0482e3          	beqz	s1,80008e68 <devintr+0x40>
    80008ec8:	00048593          	mv	a1,s1
    80008ecc:	00003517          	auipc	a0,0x3
    80008ed0:	bd450513          	addi	a0,a0,-1068 # 8000baa0 <CONSOLE_STATUS+0xa90>
    80008ed4:	00000097          	auipc	ra,0x0
    80008ed8:	674080e7          	jalr	1652(ra) # 80009548 <__printf>
    80008edc:	00048513          	mv	a0,s1
    80008ee0:	00000097          	auipc	ra,0x0
    80008ee4:	25c080e7          	jalr	604(ra) # 8000913c <plic_complete>
    80008ee8:	00100513          	li	a0,1
    80008eec:	f7dff06f          	j	80008e68 <devintr+0x40>
    80008ef0:	00006517          	auipc	a0,0x6
    80008ef4:	3b050513          	addi	a0,a0,944 # 8000f2a0 <tickslock>
    80008ef8:	00001097          	auipc	ra,0x1
    80008efc:	324080e7          	jalr	804(ra) # 8000a21c <acquire>
    80008f00:	00005717          	auipc	a4,0x5
    80008f04:	23470713          	addi	a4,a4,564 # 8000e134 <ticks>
    80008f08:	00072783          	lw	a5,0(a4)
    80008f0c:	00006517          	auipc	a0,0x6
    80008f10:	39450513          	addi	a0,a0,916 # 8000f2a0 <tickslock>
    80008f14:	0017879b          	addiw	a5,a5,1
    80008f18:	00f72023          	sw	a5,0(a4)
    80008f1c:	00001097          	auipc	ra,0x1
    80008f20:	3cc080e7          	jalr	972(ra) # 8000a2e8 <release>
    80008f24:	f65ff06f          	j	80008e88 <devintr+0x60>
    80008f28:	00001097          	auipc	ra,0x1
    80008f2c:	f28080e7          	jalr	-216(ra) # 80009e50 <uartintr>
    80008f30:	fadff06f          	j	80008edc <devintr+0xb4>
	...

0000000080008f40 <kernelvec>:
    80008f40:	f0010113          	addi	sp,sp,-256
    80008f44:	00113023          	sd	ra,0(sp)
    80008f48:	00213423          	sd	sp,8(sp)
    80008f4c:	00313823          	sd	gp,16(sp)
    80008f50:	00413c23          	sd	tp,24(sp)
    80008f54:	02513023          	sd	t0,32(sp)
    80008f58:	02613423          	sd	t1,40(sp)
    80008f5c:	02713823          	sd	t2,48(sp)
    80008f60:	02813c23          	sd	s0,56(sp)
    80008f64:	04913023          	sd	s1,64(sp)
    80008f68:	04a13423          	sd	a0,72(sp)
    80008f6c:	04b13823          	sd	a1,80(sp)
    80008f70:	04c13c23          	sd	a2,88(sp)
    80008f74:	06d13023          	sd	a3,96(sp)
    80008f78:	06e13423          	sd	a4,104(sp)
    80008f7c:	06f13823          	sd	a5,112(sp)
    80008f80:	07013c23          	sd	a6,120(sp)
    80008f84:	09113023          	sd	a7,128(sp)
    80008f88:	09213423          	sd	s2,136(sp)
    80008f8c:	09313823          	sd	s3,144(sp)
    80008f90:	09413c23          	sd	s4,152(sp)
    80008f94:	0b513023          	sd	s5,160(sp)
    80008f98:	0b613423          	sd	s6,168(sp)
    80008f9c:	0b713823          	sd	s7,176(sp)
    80008fa0:	0b813c23          	sd	s8,184(sp)
    80008fa4:	0d913023          	sd	s9,192(sp)
    80008fa8:	0da13423          	sd	s10,200(sp)
    80008fac:	0db13823          	sd	s11,208(sp)
    80008fb0:	0dc13c23          	sd	t3,216(sp)
    80008fb4:	0fd13023          	sd	t4,224(sp)
    80008fb8:	0fe13423          	sd	t5,232(sp)
    80008fbc:	0ff13823          	sd	t6,240(sp)
    80008fc0:	cc9ff0ef          	jal	ra,80008c88 <kerneltrap>
    80008fc4:	00013083          	ld	ra,0(sp)
    80008fc8:	00813103          	ld	sp,8(sp)
    80008fcc:	01013183          	ld	gp,16(sp)
    80008fd0:	02013283          	ld	t0,32(sp)
    80008fd4:	02813303          	ld	t1,40(sp)
    80008fd8:	03013383          	ld	t2,48(sp)
    80008fdc:	03813403          	ld	s0,56(sp)
    80008fe0:	04013483          	ld	s1,64(sp)
    80008fe4:	04813503          	ld	a0,72(sp)
    80008fe8:	05013583          	ld	a1,80(sp)
    80008fec:	05813603          	ld	a2,88(sp)
    80008ff0:	06013683          	ld	a3,96(sp)
    80008ff4:	06813703          	ld	a4,104(sp)
    80008ff8:	07013783          	ld	a5,112(sp)
    80008ffc:	07813803          	ld	a6,120(sp)
    80009000:	08013883          	ld	a7,128(sp)
    80009004:	08813903          	ld	s2,136(sp)
    80009008:	09013983          	ld	s3,144(sp)
    8000900c:	09813a03          	ld	s4,152(sp)
    80009010:	0a013a83          	ld	s5,160(sp)
    80009014:	0a813b03          	ld	s6,168(sp)
    80009018:	0b013b83          	ld	s7,176(sp)
    8000901c:	0b813c03          	ld	s8,184(sp)
    80009020:	0c013c83          	ld	s9,192(sp)
    80009024:	0c813d03          	ld	s10,200(sp)
    80009028:	0d013d83          	ld	s11,208(sp)
    8000902c:	0d813e03          	ld	t3,216(sp)
    80009030:	0e013e83          	ld	t4,224(sp)
    80009034:	0e813f03          	ld	t5,232(sp)
    80009038:	0f013f83          	ld	t6,240(sp)
    8000903c:	10010113          	addi	sp,sp,256
    80009040:	10200073          	sret
    80009044:	00000013          	nop
    80009048:	00000013          	nop
    8000904c:	00000013          	nop

0000000080009050 <timervec>:
    80009050:	34051573          	csrrw	a0,mscratch,a0
    80009054:	00b53023          	sd	a1,0(a0)
    80009058:	00c53423          	sd	a2,8(a0)
    8000905c:	00d53823          	sd	a3,16(a0)
    80009060:	01853583          	ld	a1,24(a0)
    80009064:	02053603          	ld	a2,32(a0)
    80009068:	0005b683          	ld	a3,0(a1)
    8000906c:	00c686b3          	add	a3,a3,a2
    80009070:	00d5b023          	sd	a3,0(a1)
    80009074:	00200593          	li	a1,2
    80009078:	14459073          	csrw	sip,a1
    8000907c:	01053683          	ld	a3,16(a0)
    80009080:	00853603          	ld	a2,8(a0)
    80009084:	00053583          	ld	a1,0(a0)
    80009088:	34051573          	csrrw	a0,mscratch,a0
    8000908c:	30200073          	mret

0000000080009090 <plicinit>:
    80009090:	ff010113          	addi	sp,sp,-16
    80009094:	00813423          	sd	s0,8(sp)
    80009098:	01010413          	addi	s0,sp,16
    8000909c:	00813403          	ld	s0,8(sp)
    800090a0:	0c0007b7          	lui	a5,0xc000
    800090a4:	00100713          	li	a4,1
    800090a8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800090ac:	00e7a223          	sw	a4,4(a5)
    800090b0:	01010113          	addi	sp,sp,16
    800090b4:	00008067          	ret

00000000800090b8 <plicinithart>:
    800090b8:	ff010113          	addi	sp,sp,-16
    800090bc:	00813023          	sd	s0,0(sp)
    800090c0:	00113423          	sd	ra,8(sp)
    800090c4:	01010413          	addi	s0,sp,16
    800090c8:	00000097          	auipc	ra,0x0
    800090cc:	a40080e7          	jalr	-1472(ra) # 80008b08 <cpuid>
    800090d0:	0085171b          	slliw	a4,a0,0x8
    800090d4:	0c0027b7          	lui	a5,0xc002
    800090d8:	00e787b3          	add	a5,a5,a4
    800090dc:	40200713          	li	a4,1026
    800090e0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800090e4:	00813083          	ld	ra,8(sp)
    800090e8:	00013403          	ld	s0,0(sp)
    800090ec:	00d5151b          	slliw	a0,a0,0xd
    800090f0:	0c2017b7          	lui	a5,0xc201
    800090f4:	00a78533          	add	a0,a5,a0
    800090f8:	00052023          	sw	zero,0(a0)
    800090fc:	01010113          	addi	sp,sp,16
    80009100:	00008067          	ret

0000000080009104 <plic_claim>:
    80009104:	ff010113          	addi	sp,sp,-16
    80009108:	00813023          	sd	s0,0(sp)
    8000910c:	00113423          	sd	ra,8(sp)
    80009110:	01010413          	addi	s0,sp,16
    80009114:	00000097          	auipc	ra,0x0
    80009118:	9f4080e7          	jalr	-1548(ra) # 80008b08 <cpuid>
    8000911c:	00813083          	ld	ra,8(sp)
    80009120:	00013403          	ld	s0,0(sp)
    80009124:	00d5151b          	slliw	a0,a0,0xd
    80009128:	0c2017b7          	lui	a5,0xc201
    8000912c:	00a78533          	add	a0,a5,a0
    80009130:	00452503          	lw	a0,4(a0)
    80009134:	01010113          	addi	sp,sp,16
    80009138:	00008067          	ret

000000008000913c <plic_complete>:
    8000913c:	fe010113          	addi	sp,sp,-32
    80009140:	00813823          	sd	s0,16(sp)
    80009144:	00913423          	sd	s1,8(sp)
    80009148:	00113c23          	sd	ra,24(sp)
    8000914c:	02010413          	addi	s0,sp,32
    80009150:	00050493          	mv	s1,a0
    80009154:	00000097          	auipc	ra,0x0
    80009158:	9b4080e7          	jalr	-1612(ra) # 80008b08 <cpuid>
    8000915c:	01813083          	ld	ra,24(sp)
    80009160:	01013403          	ld	s0,16(sp)
    80009164:	00d5179b          	slliw	a5,a0,0xd
    80009168:	0c201737          	lui	a4,0xc201
    8000916c:	00f707b3          	add	a5,a4,a5
    80009170:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80009174:	00813483          	ld	s1,8(sp)
    80009178:	02010113          	addi	sp,sp,32
    8000917c:	00008067          	ret

0000000080009180 <consolewrite>:
    80009180:	fb010113          	addi	sp,sp,-80
    80009184:	04813023          	sd	s0,64(sp)
    80009188:	04113423          	sd	ra,72(sp)
    8000918c:	02913c23          	sd	s1,56(sp)
    80009190:	03213823          	sd	s2,48(sp)
    80009194:	03313423          	sd	s3,40(sp)
    80009198:	03413023          	sd	s4,32(sp)
    8000919c:	01513c23          	sd	s5,24(sp)
    800091a0:	05010413          	addi	s0,sp,80
    800091a4:	06c05c63          	blez	a2,8000921c <consolewrite+0x9c>
    800091a8:	00060993          	mv	s3,a2
    800091ac:	00050a13          	mv	s4,a0
    800091b0:	00058493          	mv	s1,a1
    800091b4:	00000913          	li	s2,0
    800091b8:	fff00a93          	li	s5,-1
    800091bc:	01c0006f          	j	800091d8 <consolewrite+0x58>
    800091c0:	fbf44503          	lbu	a0,-65(s0)
    800091c4:	0019091b          	addiw	s2,s2,1
    800091c8:	00148493          	addi	s1,s1,1
    800091cc:	00001097          	auipc	ra,0x1
    800091d0:	a9c080e7          	jalr	-1380(ra) # 80009c68 <uartputc>
    800091d4:	03298063          	beq	s3,s2,800091f4 <consolewrite+0x74>
    800091d8:	00048613          	mv	a2,s1
    800091dc:	00100693          	li	a3,1
    800091e0:	000a0593          	mv	a1,s4
    800091e4:	fbf40513          	addi	a0,s0,-65
    800091e8:	00000097          	auipc	ra,0x0
    800091ec:	9d8080e7          	jalr	-1576(ra) # 80008bc0 <either_copyin>
    800091f0:	fd5518e3          	bne	a0,s5,800091c0 <consolewrite+0x40>
    800091f4:	04813083          	ld	ra,72(sp)
    800091f8:	04013403          	ld	s0,64(sp)
    800091fc:	03813483          	ld	s1,56(sp)
    80009200:	02813983          	ld	s3,40(sp)
    80009204:	02013a03          	ld	s4,32(sp)
    80009208:	01813a83          	ld	s5,24(sp)
    8000920c:	00090513          	mv	a0,s2
    80009210:	03013903          	ld	s2,48(sp)
    80009214:	05010113          	addi	sp,sp,80
    80009218:	00008067          	ret
    8000921c:	00000913          	li	s2,0
    80009220:	fd5ff06f          	j	800091f4 <consolewrite+0x74>

0000000080009224 <consoleread>:
    80009224:	f9010113          	addi	sp,sp,-112
    80009228:	06813023          	sd	s0,96(sp)
    8000922c:	04913c23          	sd	s1,88(sp)
    80009230:	05213823          	sd	s2,80(sp)
    80009234:	05313423          	sd	s3,72(sp)
    80009238:	05413023          	sd	s4,64(sp)
    8000923c:	03513c23          	sd	s5,56(sp)
    80009240:	03613823          	sd	s6,48(sp)
    80009244:	03713423          	sd	s7,40(sp)
    80009248:	03813023          	sd	s8,32(sp)
    8000924c:	06113423          	sd	ra,104(sp)
    80009250:	01913c23          	sd	s9,24(sp)
    80009254:	07010413          	addi	s0,sp,112
    80009258:	00060b93          	mv	s7,a2
    8000925c:	00050913          	mv	s2,a0
    80009260:	00058c13          	mv	s8,a1
    80009264:	00060b1b          	sext.w	s6,a2
    80009268:	00006497          	auipc	s1,0x6
    8000926c:	06048493          	addi	s1,s1,96 # 8000f2c8 <cons>
    80009270:	00400993          	li	s3,4
    80009274:	fff00a13          	li	s4,-1
    80009278:	00a00a93          	li	s5,10
    8000927c:	05705e63          	blez	s7,800092d8 <consoleread+0xb4>
    80009280:	09c4a703          	lw	a4,156(s1)
    80009284:	0984a783          	lw	a5,152(s1)
    80009288:	0007071b          	sext.w	a4,a4
    8000928c:	08e78463          	beq	a5,a4,80009314 <consoleread+0xf0>
    80009290:	07f7f713          	andi	a4,a5,127
    80009294:	00e48733          	add	a4,s1,a4
    80009298:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000929c:	0017869b          	addiw	a3,a5,1
    800092a0:	08d4ac23          	sw	a3,152(s1)
    800092a4:	00070c9b          	sext.w	s9,a4
    800092a8:	0b370663          	beq	a4,s3,80009354 <consoleread+0x130>
    800092ac:	00100693          	li	a3,1
    800092b0:	f9f40613          	addi	a2,s0,-97
    800092b4:	000c0593          	mv	a1,s8
    800092b8:	00090513          	mv	a0,s2
    800092bc:	f8e40fa3          	sb	a4,-97(s0)
    800092c0:	00000097          	auipc	ra,0x0
    800092c4:	8b4080e7          	jalr	-1868(ra) # 80008b74 <either_copyout>
    800092c8:	01450863          	beq	a0,s4,800092d8 <consoleread+0xb4>
    800092cc:	001c0c13          	addi	s8,s8,1
    800092d0:	fffb8b9b          	addiw	s7,s7,-1
    800092d4:	fb5c94e3          	bne	s9,s5,8000927c <consoleread+0x58>
    800092d8:	000b851b          	sext.w	a0,s7
    800092dc:	06813083          	ld	ra,104(sp)
    800092e0:	06013403          	ld	s0,96(sp)
    800092e4:	05813483          	ld	s1,88(sp)
    800092e8:	05013903          	ld	s2,80(sp)
    800092ec:	04813983          	ld	s3,72(sp)
    800092f0:	04013a03          	ld	s4,64(sp)
    800092f4:	03813a83          	ld	s5,56(sp)
    800092f8:	02813b83          	ld	s7,40(sp)
    800092fc:	02013c03          	ld	s8,32(sp)
    80009300:	01813c83          	ld	s9,24(sp)
    80009304:	40ab053b          	subw	a0,s6,a0
    80009308:	03013b03          	ld	s6,48(sp)
    8000930c:	07010113          	addi	sp,sp,112
    80009310:	00008067          	ret
    80009314:	00001097          	auipc	ra,0x1
    80009318:	1d8080e7          	jalr	472(ra) # 8000a4ec <push_on>
    8000931c:	0984a703          	lw	a4,152(s1)
    80009320:	09c4a783          	lw	a5,156(s1)
    80009324:	0007879b          	sext.w	a5,a5
    80009328:	fef70ce3          	beq	a4,a5,80009320 <consoleread+0xfc>
    8000932c:	00001097          	auipc	ra,0x1
    80009330:	234080e7          	jalr	564(ra) # 8000a560 <pop_on>
    80009334:	0984a783          	lw	a5,152(s1)
    80009338:	07f7f713          	andi	a4,a5,127
    8000933c:	00e48733          	add	a4,s1,a4
    80009340:	01874703          	lbu	a4,24(a4)
    80009344:	0017869b          	addiw	a3,a5,1
    80009348:	08d4ac23          	sw	a3,152(s1)
    8000934c:	00070c9b          	sext.w	s9,a4
    80009350:	f5371ee3          	bne	a4,s3,800092ac <consoleread+0x88>
    80009354:	000b851b          	sext.w	a0,s7
    80009358:	f96bf2e3          	bgeu	s7,s6,800092dc <consoleread+0xb8>
    8000935c:	08f4ac23          	sw	a5,152(s1)
    80009360:	f7dff06f          	j	800092dc <consoleread+0xb8>

0000000080009364 <consputc>:
    80009364:	10000793          	li	a5,256
    80009368:	00f50663          	beq	a0,a5,80009374 <consputc+0x10>
    8000936c:	00001317          	auipc	t1,0x1
    80009370:	9f430067          	jr	-1548(t1) # 80009d60 <uartputc_sync>
    80009374:	ff010113          	addi	sp,sp,-16
    80009378:	00113423          	sd	ra,8(sp)
    8000937c:	00813023          	sd	s0,0(sp)
    80009380:	01010413          	addi	s0,sp,16
    80009384:	00800513          	li	a0,8
    80009388:	00001097          	auipc	ra,0x1
    8000938c:	9d8080e7          	jalr	-1576(ra) # 80009d60 <uartputc_sync>
    80009390:	02000513          	li	a0,32
    80009394:	00001097          	auipc	ra,0x1
    80009398:	9cc080e7          	jalr	-1588(ra) # 80009d60 <uartputc_sync>
    8000939c:	00013403          	ld	s0,0(sp)
    800093a0:	00813083          	ld	ra,8(sp)
    800093a4:	00800513          	li	a0,8
    800093a8:	01010113          	addi	sp,sp,16
    800093ac:	00001317          	auipc	t1,0x1
    800093b0:	9b430067          	jr	-1612(t1) # 80009d60 <uartputc_sync>

00000000800093b4 <consoleintr>:
    800093b4:	fe010113          	addi	sp,sp,-32
    800093b8:	00813823          	sd	s0,16(sp)
    800093bc:	00913423          	sd	s1,8(sp)
    800093c0:	01213023          	sd	s2,0(sp)
    800093c4:	00113c23          	sd	ra,24(sp)
    800093c8:	02010413          	addi	s0,sp,32
    800093cc:	00006917          	auipc	s2,0x6
    800093d0:	efc90913          	addi	s2,s2,-260 # 8000f2c8 <cons>
    800093d4:	00050493          	mv	s1,a0
    800093d8:	00090513          	mv	a0,s2
    800093dc:	00001097          	auipc	ra,0x1
    800093e0:	e40080e7          	jalr	-448(ra) # 8000a21c <acquire>
    800093e4:	02048c63          	beqz	s1,8000941c <consoleintr+0x68>
    800093e8:	0a092783          	lw	a5,160(s2)
    800093ec:	09892703          	lw	a4,152(s2)
    800093f0:	07f00693          	li	a3,127
    800093f4:	40e7873b          	subw	a4,a5,a4
    800093f8:	02e6e263          	bltu	a3,a4,8000941c <consoleintr+0x68>
    800093fc:	00d00713          	li	a4,13
    80009400:	04e48063          	beq	s1,a4,80009440 <consoleintr+0x8c>
    80009404:	07f7f713          	andi	a4,a5,127
    80009408:	00e90733          	add	a4,s2,a4
    8000940c:	0017879b          	addiw	a5,a5,1
    80009410:	0af92023          	sw	a5,160(s2)
    80009414:	00970c23          	sb	s1,24(a4)
    80009418:	08f92e23          	sw	a5,156(s2)
    8000941c:	01013403          	ld	s0,16(sp)
    80009420:	01813083          	ld	ra,24(sp)
    80009424:	00813483          	ld	s1,8(sp)
    80009428:	00013903          	ld	s2,0(sp)
    8000942c:	00006517          	auipc	a0,0x6
    80009430:	e9c50513          	addi	a0,a0,-356 # 8000f2c8 <cons>
    80009434:	02010113          	addi	sp,sp,32
    80009438:	00001317          	auipc	t1,0x1
    8000943c:	eb030067          	jr	-336(t1) # 8000a2e8 <release>
    80009440:	00a00493          	li	s1,10
    80009444:	fc1ff06f          	j	80009404 <consoleintr+0x50>

0000000080009448 <consoleinit>:
    80009448:	fe010113          	addi	sp,sp,-32
    8000944c:	00113c23          	sd	ra,24(sp)
    80009450:	00813823          	sd	s0,16(sp)
    80009454:	00913423          	sd	s1,8(sp)
    80009458:	02010413          	addi	s0,sp,32
    8000945c:	00006497          	auipc	s1,0x6
    80009460:	e6c48493          	addi	s1,s1,-404 # 8000f2c8 <cons>
    80009464:	00048513          	mv	a0,s1
    80009468:	00002597          	auipc	a1,0x2
    8000946c:	69058593          	addi	a1,a1,1680 # 8000baf8 <CONSOLE_STATUS+0xae8>
    80009470:	00001097          	auipc	ra,0x1
    80009474:	d88080e7          	jalr	-632(ra) # 8000a1f8 <initlock>
    80009478:	00000097          	auipc	ra,0x0
    8000947c:	7ac080e7          	jalr	1964(ra) # 80009c24 <uartinit>
    80009480:	01813083          	ld	ra,24(sp)
    80009484:	01013403          	ld	s0,16(sp)
    80009488:	00000797          	auipc	a5,0x0
    8000948c:	d9c78793          	addi	a5,a5,-612 # 80009224 <consoleread>
    80009490:	0af4bc23          	sd	a5,184(s1)
    80009494:	00000797          	auipc	a5,0x0
    80009498:	cec78793          	addi	a5,a5,-788 # 80009180 <consolewrite>
    8000949c:	0cf4b023          	sd	a5,192(s1)
    800094a0:	00813483          	ld	s1,8(sp)
    800094a4:	02010113          	addi	sp,sp,32
    800094a8:	00008067          	ret

00000000800094ac <console_read>:
    800094ac:	ff010113          	addi	sp,sp,-16
    800094b0:	00813423          	sd	s0,8(sp)
    800094b4:	01010413          	addi	s0,sp,16
    800094b8:	00813403          	ld	s0,8(sp)
    800094bc:	00006317          	auipc	t1,0x6
    800094c0:	ec433303          	ld	t1,-316(t1) # 8000f380 <devsw+0x10>
    800094c4:	01010113          	addi	sp,sp,16
    800094c8:	00030067          	jr	t1

00000000800094cc <console_write>:
    800094cc:	ff010113          	addi	sp,sp,-16
    800094d0:	00813423          	sd	s0,8(sp)
    800094d4:	01010413          	addi	s0,sp,16
    800094d8:	00813403          	ld	s0,8(sp)
    800094dc:	00006317          	auipc	t1,0x6
    800094e0:	eac33303          	ld	t1,-340(t1) # 8000f388 <devsw+0x18>
    800094e4:	01010113          	addi	sp,sp,16
    800094e8:	00030067          	jr	t1

00000000800094ec <panic>:
    800094ec:	fe010113          	addi	sp,sp,-32
    800094f0:	00113c23          	sd	ra,24(sp)
    800094f4:	00813823          	sd	s0,16(sp)
    800094f8:	00913423          	sd	s1,8(sp)
    800094fc:	02010413          	addi	s0,sp,32
    80009500:	00050493          	mv	s1,a0
    80009504:	00002517          	auipc	a0,0x2
    80009508:	5fc50513          	addi	a0,a0,1532 # 8000bb00 <CONSOLE_STATUS+0xaf0>
    8000950c:	00006797          	auipc	a5,0x6
    80009510:	f007ae23          	sw	zero,-228(a5) # 8000f428 <pr+0x18>
    80009514:	00000097          	auipc	ra,0x0
    80009518:	034080e7          	jalr	52(ra) # 80009548 <__printf>
    8000951c:	00048513          	mv	a0,s1
    80009520:	00000097          	auipc	ra,0x0
    80009524:	028080e7          	jalr	40(ra) # 80009548 <__printf>
    80009528:	00002517          	auipc	a0,0x2
    8000952c:	35850513          	addi	a0,a0,856 # 8000b880 <CONSOLE_STATUS+0x870>
    80009530:	00000097          	auipc	ra,0x0
    80009534:	018080e7          	jalr	24(ra) # 80009548 <__printf>
    80009538:	00100793          	li	a5,1
    8000953c:	00005717          	auipc	a4,0x5
    80009540:	bef72e23          	sw	a5,-1028(a4) # 8000e138 <panicked>
    80009544:	0000006f          	j	80009544 <panic+0x58>

0000000080009548 <__printf>:
    80009548:	f3010113          	addi	sp,sp,-208
    8000954c:	08813023          	sd	s0,128(sp)
    80009550:	07313423          	sd	s3,104(sp)
    80009554:	09010413          	addi	s0,sp,144
    80009558:	05813023          	sd	s8,64(sp)
    8000955c:	08113423          	sd	ra,136(sp)
    80009560:	06913c23          	sd	s1,120(sp)
    80009564:	07213823          	sd	s2,112(sp)
    80009568:	07413023          	sd	s4,96(sp)
    8000956c:	05513c23          	sd	s5,88(sp)
    80009570:	05613823          	sd	s6,80(sp)
    80009574:	05713423          	sd	s7,72(sp)
    80009578:	03913c23          	sd	s9,56(sp)
    8000957c:	03a13823          	sd	s10,48(sp)
    80009580:	03b13423          	sd	s11,40(sp)
    80009584:	00006317          	auipc	t1,0x6
    80009588:	e8c30313          	addi	t1,t1,-372 # 8000f410 <pr>
    8000958c:	01832c03          	lw	s8,24(t1)
    80009590:	00b43423          	sd	a1,8(s0)
    80009594:	00c43823          	sd	a2,16(s0)
    80009598:	00d43c23          	sd	a3,24(s0)
    8000959c:	02e43023          	sd	a4,32(s0)
    800095a0:	02f43423          	sd	a5,40(s0)
    800095a4:	03043823          	sd	a6,48(s0)
    800095a8:	03143c23          	sd	a7,56(s0)
    800095ac:	00050993          	mv	s3,a0
    800095b0:	4a0c1663          	bnez	s8,80009a5c <__printf+0x514>
    800095b4:	60098c63          	beqz	s3,80009bcc <__printf+0x684>
    800095b8:	0009c503          	lbu	a0,0(s3)
    800095bc:	00840793          	addi	a5,s0,8
    800095c0:	f6f43c23          	sd	a5,-136(s0)
    800095c4:	00000493          	li	s1,0
    800095c8:	22050063          	beqz	a0,800097e8 <__printf+0x2a0>
    800095cc:	00002a37          	lui	s4,0x2
    800095d0:	00018ab7          	lui	s5,0x18
    800095d4:	000f4b37          	lui	s6,0xf4
    800095d8:	00989bb7          	lui	s7,0x989
    800095dc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800095e0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800095e4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800095e8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800095ec:	00148c9b          	addiw	s9,s1,1
    800095f0:	02500793          	li	a5,37
    800095f4:	01998933          	add	s2,s3,s9
    800095f8:	38f51263          	bne	a0,a5,8000997c <__printf+0x434>
    800095fc:	00094783          	lbu	a5,0(s2)
    80009600:	00078c9b          	sext.w	s9,a5
    80009604:	1e078263          	beqz	a5,800097e8 <__printf+0x2a0>
    80009608:	0024849b          	addiw	s1,s1,2
    8000960c:	07000713          	li	a4,112
    80009610:	00998933          	add	s2,s3,s1
    80009614:	38e78a63          	beq	a5,a4,800099a8 <__printf+0x460>
    80009618:	20f76863          	bltu	a4,a5,80009828 <__printf+0x2e0>
    8000961c:	42a78863          	beq	a5,a0,80009a4c <__printf+0x504>
    80009620:	06400713          	li	a4,100
    80009624:	40e79663          	bne	a5,a4,80009a30 <__printf+0x4e8>
    80009628:	f7843783          	ld	a5,-136(s0)
    8000962c:	0007a603          	lw	a2,0(a5)
    80009630:	00878793          	addi	a5,a5,8
    80009634:	f6f43c23          	sd	a5,-136(s0)
    80009638:	42064a63          	bltz	a2,80009a6c <__printf+0x524>
    8000963c:	00a00713          	li	a4,10
    80009640:	02e677bb          	remuw	a5,a2,a4
    80009644:	00002d97          	auipc	s11,0x2
    80009648:	4e4d8d93          	addi	s11,s11,1252 # 8000bb28 <digits>
    8000964c:	00900593          	li	a1,9
    80009650:	0006051b          	sext.w	a0,a2
    80009654:	00000c93          	li	s9,0
    80009658:	02079793          	slli	a5,a5,0x20
    8000965c:	0207d793          	srli	a5,a5,0x20
    80009660:	00fd87b3          	add	a5,s11,a5
    80009664:	0007c783          	lbu	a5,0(a5)
    80009668:	02e656bb          	divuw	a3,a2,a4
    8000966c:	f8f40023          	sb	a5,-128(s0)
    80009670:	14c5d863          	bge	a1,a2,800097c0 <__printf+0x278>
    80009674:	06300593          	li	a1,99
    80009678:	00100c93          	li	s9,1
    8000967c:	02e6f7bb          	remuw	a5,a3,a4
    80009680:	02079793          	slli	a5,a5,0x20
    80009684:	0207d793          	srli	a5,a5,0x20
    80009688:	00fd87b3          	add	a5,s11,a5
    8000968c:	0007c783          	lbu	a5,0(a5)
    80009690:	02e6d73b          	divuw	a4,a3,a4
    80009694:	f8f400a3          	sb	a5,-127(s0)
    80009698:	12a5f463          	bgeu	a1,a0,800097c0 <__printf+0x278>
    8000969c:	00a00693          	li	a3,10
    800096a0:	00900593          	li	a1,9
    800096a4:	02d777bb          	remuw	a5,a4,a3
    800096a8:	02079793          	slli	a5,a5,0x20
    800096ac:	0207d793          	srli	a5,a5,0x20
    800096b0:	00fd87b3          	add	a5,s11,a5
    800096b4:	0007c503          	lbu	a0,0(a5)
    800096b8:	02d757bb          	divuw	a5,a4,a3
    800096bc:	f8a40123          	sb	a0,-126(s0)
    800096c0:	48e5f263          	bgeu	a1,a4,80009b44 <__printf+0x5fc>
    800096c4:	06300513          	li	a0,99
    800096c8:	02d7f5bb          	remuw	a1,a5,a3
    800096cc:	02059593          	slli	a1,a1,0x20
    800096d0:	0205d593          	srli	a1,a1,0x20
    800096d4:	00bd85b3          	add	a1,s11,a1
    800096d8:	0005c583          	lbu	a1,0(a1)
    800096dc:	02d7d7bb          	divuw	a5,a5,a3
    800096e0:	f8b401a3          	sb	a1,-125(s0)
    800096e4:	48e57263          	bgeu	a0,a4,80009b68 <__printf+0x620>
    800096e8:	3e700513          	li	a0,999
    800096ec:	02d7f5bb          	remuw	a1,a5,a3
    800096f0:	02059593          	slli	a1,a1,0x20
    800096f4:	0205d593          	srli	a1,a1,0x20
    800096f8:	00bd85b3          	add	a1,s11,a1
    800096fc:	0005c583          	lbu	a1,0(a1)
    80009700:	02d7d7bb          	divuw	a5,a5,a3
    80009704:	f8b40223          	sb	a1,-124(s0)
    80009708:	46e57663          	bgeu	a0,a4,80009b74 <__printf+0x62c>
    8000970c:	02d7f5bb          	remuw	a1,a5,a3
    80009710:	02059593          	slli	a1,a1,0x20
    80009714:	0205d593          	srli	a1,a1,0x20
    80009718:	00bd85b3          	add	a1,s11,a1
    8000971c:	0005c583          	lbu	a1,0(a1)
    80009720:	02d7d7bb          	divuw	a5,a5,a3
    80009724:	f8b402a3          	sb	a1,-123(s0)
    80009728:	46ea7863          	bgeu	s4,a4,80009b98 <__printf+0x650>
    8000972c:	02d7f5bb          	remuw	a1,a5,a3
    80009730:	02059593          	slli	a1,a1,0x20
    80009734:	0205d593          	srli	a1,a1,0x20
    80009738:	00bd85b3          	add	a1,s11,a1
    8000973c:	0005c583          	lbu	a1,0(a1)
    80009740:	02d7d7bb          	divuw	a5,a5,a3
    80009744:	f8b40323          	sb	a1,-122(s0)
    80009748:	3eeaf863          	bgeu	s5,a4,80009b38 <__printf+0x5f0>
    8000974c:	02d7f5bb          	remuw	a1,a5,a3
    80009750:	02059593          	slli	a1,a1,0x20
    80009754:	0205d593          	srli	a1,a1,0x20
    80009758:	00bd85b3          	add	a1,s11,a1
    8000975c:	0005c583          	lbu	a1,0(a1)
    80009760:	02d7d7bb          	divuw	a5,a5,a3
    80009764:	f8b403a3          	sb	a1,-121(s0)
    80009768:	42eb7e63          	bgeu	s6,a4,80009ba4 <__printf+0x65c>
    8000976c:	02d7f5bb          	remuw	a1,a5,a3
    80009770:	02059593          	slli	a1,a1,0x20
    80009774:	0205d593          	srli	a1,a1,0x20
    80009778:	00bd85b3          	add	a1,s11,a1
    8000977c:	0005c583          	lbu	a1,0(a1)
    80009780:	02d7d7bb          	divuw	a5,a5,a3
    80009784:	f8b40423          	sb	a1,-120(s0)
    80009788:	42ebfc63          	bgeu	s7,a4,80009bc0 <__printf+0x678>
    8000978c:	02079793          	slli	a5,a5,0x20
    80009790:	0207d793          	srli	a5,a5,0x20
    80009794:	00fd8db3          	add	s11,s11,a5
    80009798:	000dc703          	lbu	a4,0(s11)
    8000979c:	00a00793          	li	a5,10
    800097a0:	00900c93          	li	s9,9
    800097a4:	f8e404a3          	sb	a4,-119(s0)
    800097a8:	00065c63          	bgez	a2,800097c0 <__printf+0x278>
    800097ac:	f9040713          	addi	a4,s0,-112
    800097b0:	00f70733          	add	a4,a4,a5
    800097b4:	02d00693          	li	a3,45
    800097b8:	fed70823          	sb	a3,-16(a4)
    800097bc:	00078c93          	mv	s9,a5
    800097c0:	f8040793          	addi	a5,s0,-128
    800097c4:	01978cb3          	add	s9,a5,s9
    800097c8:	f7f40d13          	addi	s10,s0,-129
    800097cc:	000cc503          	lbu	a0,0(s9)
    800097d0:	fffc8c93          	addi	s9,s9,-1
    800097d4:	00000097          	auipc	ra,0x0
    800097d8:	b90080e7          	jalr	-1136(ra) # 80009364 <consputc>
    800097dc:	ffac98e3          	bne	s9,s10,800097cc <__printf+0x284>
    800097e0:	00094503          	lbu	a0,0(s2)
    800097e4:	e00514e3          	bnez	a0,800095ec <__printf+0xa4>
    800097e8:	1a0c1663          	bnez	s8,80009994 <__printf+0x44c>
    800097ec:	08813083          	ld	ra,136(sp)
    800097f0:	08013403          	ld	s0,128(sp)
    800097f4:	07813483          	ld	s1,120(sp)
    800097f8:	07013903          	ld	s2,112(sp)
    800097fc:	06813983          	ld	s3,104(sp)
    80009800:	06013a03          	ld	s4,96(sp)
    80009804:	05813a83          	ld	s5,88(sp)
    80009808:	05013b03          	ld	s6,80(sp)
    8000980c:	04813b83          	ld	s7,72(sp)
    80009810:	04013c03          	ld	s8,64(sp)
    80009814:	03813c83          	ld	s9,56(sp)
    80009818:	03013d03          	ld	s10,48(sp)
    8000981c:	02813d83          	ld	s11,40(sp)
    80009820:	0d010113          	addi	sp,sp,208
    80009824:	00008067          	ret
    80009828:	07300713          	li	a4,115
    8000982c:	1ce78a63          	beq	a5,a4,80009a00 <__printf+0x4b8>
    80009830:	07800713          	li	a4,120
    80009834:	1ee79e63          	bne	a5,a4,80009a30 <__printf+0x4e8>
    80009838:	f7843783          	ld	a5,-136(s0)
    8000983c:	0007a703          	lw	a4,0(a5)
    80009840:	00878793          	addi	a5,a5,8
    80009844:	f6f43c23          	sd	a5,-136(s0)
    80009848:	28074263          	bltz	a4,80009acc <__printf+0x584>
    8000984c:	00002d97          	auipc	s11,0x2
    80009850:	2dcd8d93          	addi	s11,s11,732 # 8000bb28 <digits>
    80009854:	00f77793          	andi	a5,a4,15
    80009858:	00fd87b3          	add	a5,s11,a5
    8000985c:	0007c683          	lbu	a3,0(a5)
    80009860:	00f00613          	li	a2,15
    80009864:	0007079b          	sext.w	a5,a4
    80009868:	f8d40023          	sb	a3,-128(s0)
    8000986c:	0047559b          	srliw	a1,a4,0x4
    80009870:	0047569b          	srliw	a3,a4,0x4
    80009874:	00000c93          	li	s9,0
    80009878:	0ee65063          	bge	a2,a4,80009958 <__printf+0x410>
    8000987c:	00f6f693          	andi	a3,a3,15
    80009880:	00dd86b3          	add	a3,s11,a3
    80009884:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80009888:	0087d79b          	srliw	a5,a5,0x8
    8000988c:	00100c93          	li	s9,1
    80009890:	f8d400a3          	sb	a3,-127(s0)
    80009894:	0cb67263          	bgeu	a2,a1,80009958 <__printf+0x410>
    80009898:	00f7f693          	andi	a3,a5,15
    8000989c:	00dd86b3          	add	a3,s11,a3
    800098a0:	0006c583          	lbu	a1,0(a3)
    800098a4:	00f00613          	li	a2,15
    800098a8:	0047d69b          	srliw	a3,a5,0x4
    800098ac:	f8b40123          	sb	a1,-126(s0)
    800098b0:	0047d593          	srli	a1,a5,0x4
    800098b4:	28f67e63          	bgeu	a2,a5,80009b50 <__printf+0x608>
    800098b8:	00f6f693          	andi	a3,a3,15
    800098bc:	00dd86b3          	add	a3,s11,a3
    800098c0:	0006c503          	lbu	a0,0(a3)
    800098c4:	0087d813          	srli	a6,a5,0x8
    800098c8:	0087d69b          	srliw	a3,a5,0x8
    800098cc:	f8a401a3          	sb	a0,-125(s0)
    800098d0:	28b67663          	bgeu	a2,a1,80009b5c <__printf+0x614>
    800098d4:	00f6f693          	andi	a3,a3,15
    800098d8:	00dd86b3          	add	a3,s11,a3
    800098dc:	0006c583          	lbu	a1,0(a3)
    800098e0:	00c7d513          	srli	a0,a5,0xc
    800098e4:	00c7d69b          	srliw	a3,a5,0xc
    800098e8:	f8b40223          	sb	a1,-124(s0)
    800098ec:	29067a63          	bgeu	a2,a6,80009b80 <__printf+0x638>
    800098f0:	00f6f693          	andi	a3,a3,15
    800098f4:	00dd86b3          	add	a3,s11,a3
    800098f8:	0006c583          	lbu	a1,0(a3)
    800098fc:	0107d813          	srli	a6,a5,0x10
    80009900:	0107d69b          	srliw	a3,a5,0x10
    80009904:	f8b402a3          	sb	a1,-123(s0)
    80009908:	28a67263          	bgeu	a2,a0,80009b8c <__printf+0x644>
    8000990c:	00f6f693          	andi	a3,a3,15
    80009910:	00dd86b3          	add	a3,s11,a3
    80009914:	0006c683          	lbu	a3,0(a3)
    80009918:	0147d79b          	srliw	a5,a5,0x14
    8000991c:	f8d40323          	sb	a3,-122(s0)
    80009920:	21067663          	bgeu	a2,a6,80009b2c <__printf+0x5e4>
    80009924:	02079793          	slli	a5,a5,0x20
    80009928:	0207d793          	srli	a5,a5,0x20
    8000992c:	00fd8db3          	add	s11,s11,a5
    80009930:	000dc683          	lbu	a3,0(s11)
    80009934:	00800793          	li	a5,8
    80009938:	00700c93          	li	s9,7
    8000993c:	f8d403a3          	sb	a3,-121(s0)
    80009940:	00075c63          	bgez	a4,80009958 <__printf+0x410>
    80009944:	f9040713          	addi	a4,s0,-112
    80009948:	00f70733          	add	a4,a4,a5
    8000994c:	02d00693          	li	a3,45
    80009950:	fed70823          	sb	a3,-16(a4)
    80009954:	00078c93          	mv	s9,a5
    80009958:	f8040793          	addi	a5,s0,-128
    8000995c:	01978cb3          	add	s9,a5,s9
    80009960:	f7f40d13          	addi	s10,s0,-129
    80009964:	000cc503          	lbu	a0,0(s9)
    80009968:	fffc8c93          	addi	s9,s9,-1
    8000996c:	00000097          	auipc	ra,0x0
    80009970:	9f8080e7          	jalr	-1544(ra) # 80009364 <consputc>
    80009974:	ff9d18e3          	bne	s10,s9,80009964 <__printf+0x41c>
    80009978:	0100006f          	j	80009988 <__printf+0x440>
    8000997c:	00000097          	auipc	ra,0x0
    80009980:	9e8080e7          	jalr	-1560(ra) # 80009364 <consputc>
    80009984:	000c8493          	mv	s1,s9
    80009988:	00094503          	lbu	a0,0(s2)
    8000998c:	c60510e3          	bnez	a0,800095ec <__printf+0xa4>
    80009990:	e40c0ee3          	beqz	s8,800097ec <__printf+0x2a4>
    80009994:	00006517          	auipc	a0,0x6
    80009998:	a7c50513          	addi	a0,a0,-1412 # 8000f410 <pr>
    8000999c:	00001097          	auipc	ra,0x1
    800099a0:	94c080e7          	jalr	-1716(ra) # 8000a2e8 <release>
    800099a4:	e49ff06f          	j	800097ec <__printf+0x2a4>
    800099a8:	f7843783          	ld	a5,-136(s0)
    800099ac:	03000513          	li	a0,48
    800099b0:	01000d13          	li	s10,16
    800099b4:	00878713          	addi	a4,a5,8
    800099b8:	0007bc83          	ld	s9,0(a5)
    800099bc:	f6e43c23          	sd	a4,-136(s0)
    800099c0:	00000097          	auipc	ra,0x0
    800099c4:	9a4080e7          	jalr	-1628(ra) # 80009364 <consputc>
    800099c8:	07800513          	li	a0,120
    800099cc:	00000097          	auipc	ra,0x0
    800099d0:	998080e7          	jalr	-1640(ra) # 80009364 <consputc>
    800099d4:	00002d97          	auipc	s11,0x2
    800099d8:	154d8d93          	addi	s11,s11,340 # 8000bb28 <digits>
    800099dc:	03ccd793          	srli	a5,s9,0x3c
    800099e0:	00fd87b3          	add	a5,s11,a5
    800099e4:	0007c503          	lbu	a0,0(a5)
    800099e8:	fffd0d1b          	addiw	s10,s10,-1
    800099ec:	004c9c93          	slli	s9,s9,0x4
    800099f0:	00000097          	auipc	ra,0x0
    800099f4:	974080e7          	jalr	-1676(ra) # 80009364 <consputc>
    800099f8:	fe0d12e3          	bnez	s10,800099dc <__printf+0x494>
    800099fc:	f8dff06f          	j	80009988 <__printf+0x440>
    80009a00:	f7843783          	ld	a5,-136(s0)
    80009a04:	0007bc83          	ld	s9,0(a5)
    80009a08:	00878793          	addi	a5,a5,8
    80009a0c:	f6f43c23          	sd	a5,-136(s0)
    80009a10:	000c9a63          	bnez	s9,80009a24 <__printf+0x4dc>
    80009a14:	1080006f          	j	80009b1c <__printf+0x5d4>
    80009a18:	001c8c93          	addi	s9,s9,1
    80009a1c:	00000097          	auipc	ra,0x0
    80009a20:	948080e7          	jalr	-1720(ra) # 80009364 <consputc>
    80009a24:	000cc503          	lbu	a0,0(s9)
    80009a28:	fe0518e3          	bnez	a0,80009a18 <__printf+0x4d0>
    80009a2c:	f5dff06f          	j	80009988 <__printf+0x440>
    80009a30:	02500513          	li	a0,37
    80009a34:	00000097          	auipc	ra,0x0
    80009a38:	930080e7          	jalr	-1744(ra) # 80009364 <consputc>
    80009a3c:	000c8513          	mv	a0,s9
    80009a40:	00000097          	auipc	ra,0x0
    80009a44:	924080e7          	jalr	-1756(ra) # 80009364 <consputc>
    80009a48:	f41ff06f          	j	80009988 <__printf+0x440>
    80009a4c:	02500513          	li	a0,37
    80009a50:	00000097          	auipc	ra,0x0
    80009a54:	914080e7          	jalr	-1772(ra) # 80009364 <consputc>
    80009a58:	f31ff06f          	j	80009988 <__printf+0x440>
    80009a5c:	00030513          	mv	a0,t1
    80009a60:	00000097          	auipc	ra,0x0
    80009a64:	7bc080e7          	jalr	1980(ra) # 8000a21c <acquire>
    80009a68:	b4dff06f          	j	800095b4 <__printf+0x6c>
    80009a6c:	40c0053b          	negw	a0,a2
    80009a70:	00a00713          	li	a4,10
    80009a74:	02e576bb          	remuw	a3,a0,a4
    80009a78:	00002d97          	auipc	s11,0x2
    80009a7c:	0b0d8d93          	addi	s11,s11,176 # 8000bb28 <digits>
    80009a80:	ff700593          	li	a1,-9
    80009a84:	02069693          	slli	a3,a3,0x20
    80009a88:	0206d693          	srli	a3,a3,0x20
    80009a8c:	00dd86b3          	add	a3,s11,a3
    80009a90:	0006c683          	lbu	a3,0(a3)
    80009a94:	02e557bb          	divuw	a5,a0,a4
    80009a98:	f8d40023          	sb	a3,-128(s0)
    80009a9c:	10b65e63          	bge	a2,a1,80009bb8 <__printf+0x670>
    80009aa0:	06300593          	li	a1,99
    80009aa4:	02e7f6bb          	remuw	a3,a5,a4
    80009aa8:	02069693          	slli	a3,a3,0x20
    80009aac:	0206d693          	srli	a3,a3,0x20
    80009ab0:	00dd86b3          	add	a3,s11,a3
    80009ab4:	0006c683          	lbu	a3,0(a3)
    80009ab8:	02e7d73b          	divuw	a4,a5,a4
    80009abc:	00200793          	li	a5,2
    80009ac0:	f8d400a3          	sb	a3,-127(s0)
    80009ac4:	bca5ece3          	bltu	a1,a0,8000969c <__printf+0x154>
    80009ac8:	ce5ff06f          	j	800097ac <__printf+0x264>
    80009acc:	40e007bb          	negw	a5,a4
    80009ad0:	00002d97          	auipc	s11,0x2
    80009ad4:	058d8d93          	addi	s11,s11,88 # 8000bb28 <digits>
    80009ad8:	00f7f693          	andi	a3,a5,15
    80009adc:	00dd86b3          	add	a3,s11,a3
    80009ae0:	0006c583          	lbu	a1,0(a3)
    80009ae4:	ff100613          	li	a2,-15
    80009ae8:	0047d69b          	srliw	a3,a5,0x4
    80009aec:	f8b40023          	sb	a1,-128(s0)
    80009af0:	0047d59b          	srliw	a1,a5,0x4
    80009af4:	0ac75e63          	bge	a4,a2,80009bb0 <__printf+0x668>
    80009af8:	00f6f693          	andi	a3,a3,15
    80009afc:	00dd86b3          	add	a3,s11,a3
    80009b00:	0006c603          	lbu	a2,0(a3)
    80009b04:	00f00693          	li	a3,15
    80009b08:	0087d79b          	srliw	a5,a5,0x8
    80009b0c:	f8c400a3          	sb	a2,-127(s0)
    80009b10:	d8b6e4e3          	bltu	a3,a1,80009898 <__printf+0x350>
    80009b14:	00200793          	li	a5,2
    80009b18:	e2dff06f          	j	80009944 <__printf+0x3fc>
    80009b1c:	00002c97          	auipc	s9,0x2
    80009b20:	fecc8c93          	addi	s9,s9,-20 # 8000bb08 <CONSOLE_STATUS+0xaf8>
    80009b24:	02800513          	li	a0,40
    80009b28:	ef1ff06f          	j	80009a18 <__printf+0x4d0>
    80009b2c:	00700793          	li	a5,7
    80009b30:	00600c93          	li	s9,6
    80009b34:	e0dff06f          	j	80009940 <__printf+0x3f8>
    80009b38:	00700793          	li	a5,7
    80009b3c:	00600c93          	li	s9,6
    80009b40:	c69ff06f          	j	800097a8 <__printf+0x260>
    80009b44:	00300793          	li	a5,3
    80009b48:	00200c93          	li	s9,2
    80009b4c:	c5dff06f          	j	800097a8 <__printf+0x260>
    80009b50:	00300793          	li	a5,3
    80009b54:	00200c93          	li	s9,2
    80009b58:	de9ff06f          	j	80009940 <__printf+0x3f8>
    80009b5c:	00400793          	li	a5,4
    80009b60:	00300c93          	li	s9,3
    80009b64:	dddff06f          	j	80009940 <__printf+0x3f8>
    80009b68:	00400793          	li	a5,4
    80009b6c:	00300c93          	li	s9,3
    80009b70:	c39ff06f          	j	800097a8 <__printf+0x260>
    80009b74:	00500793          	li	a5,5
    80009b78:	00400c93          	li	s9,4
    80009b7c:	c2dff06f          	j	800097a8 <__printf+0x260>
    80009b80:	00500793          	li	a5,5
    80009b84:	00400c93          	li	s9,4
    80009b88:	db9ff06f          	j	80009940 <__printf+0x3f8>
    80009b8c:	00600793          	li	a5,6
    80009b90:	00500c93          	li	s9,5
    80009b94:	dadff06f          	j	80009940 <__printf+0x3f8>
    80009b98:	00600793          	li	a5,6
    80009b9c:	00500c93          	li	s9,5
    80009ba0:	c09ff06f          	j	800097a8 <__printf+0x260>
    80009ba4:	00800793          	li	a5,8
    80009ba8:	00700c93          	li	s9,7
    80009bac:	bfdff06f          	j	800097a8 <__printf+0x260>
    80009bb0:	00100793          	li	a5,1
    80009bb4:	d91ff06f          	j	80009944 <__printf+0x3fc>
    80009bb8:	00100793          	li	a5,1
    80009bbc:	bf1ff06f          	j	800097ac <__printf+0x264>
    80009bc0:	00900793          	li	a5,9
    80009bc4:	00800c93          	li	s9,8
    80009bc8:	be1ff06f          	j	800097a8 <__printf+0x260>
    80009bcc:	00002517          	auipc	a0,0x2
    80009bd0:	f4450513          	addi	a0,a0,-188 # 8000bb10 <CONSOLE_STATUS+0xb00>
    80009bd4:	00000097          	auipc	ra,0x0
    80009bd8:	918080e7          	jalr	-1768(ra) # 800094ec <panic>

0000000080009bdc <printfinit>:
    80009bdc:	fe010113          	addi	sp,sp,-32
    80009be0:	00813823          	sd	s0,16(sp)
    80009be4:	00913423          	sd	s1,8(sp)
    80009be8:	00113c23          	sd	ra,24(sp)
    80009bec:	02010413          	addi	s0,sp,32
    80009bf0:	00006497          	auipc	s1,0x6
    80009bf4:	82048493          	addi	s1,s1,-2016 # 8000f410 <pr>
    80009bf8:	00048513          	mv	a0,s1
    80009bfc:	00002597          	auipc	a1,0x2
    80009c00:	f2458593          	addi	a1,a1,-220 # 8000bb20 <CONSOLE_STATUS+0xb10>
    80009c04:	00000097          	auipc	ra,0x0
    80009c08:	5f4080e7          	jalr	1524(ra) # 8000a1f8 <initlock>
    80009c0c:	01813083          	ld	ra,24(sp)
    80009c10:	01013403          	ld	s0,16(sp)
    80009c14:	0004ac23          	sw	zero,24(s1)
    80009c18:	00813483          	ld	s1,8(sp)
    80009c1c:	02010113          	addi	sp,sp,32
    80009c20:	00008067          	ret

0000000080009c24 <uartinit>:
    80009c24:	ff010113          	addi	sp,sp,-16
    80009c28:	00813423          	sd	s0,8(sp)
    80009c2c:	01010413          	addi	s0,sp,16
    80009c30:	100007b7          	lui	a5,0x10000
    80009c34:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80009c38:	f8000713          	li	a4,-128
    80009c3c:	00e781a3          	sb	a4,3(a5)
    80009c40:	00300713          	li	a4,3
    80009c44:	00e78023          	sb	a4,0(a5)
    80009c48:	000780a3          	sb	zero,1(a5)
    80009c4c:	00e781a3          	sb	a4,3(a5)
    80009c50:	00700693          	li	a3,7
    80009c54:	00d78123          	sb	a3,2(a5)
    80009c58:	00e780a3          	sb	a4,1(a5)
    80009c5c:	00813403          	ld	s0,8(sp)
    80009c60:	01010113          	addi	sp,sp,16
    80009c64:	00008067          	ret

0000000080009c68 <uartputc>:
    80009c68:	00004797          	auipc	a5,0x4
    80009c6c:	4d07a783          	lw	a5,1232(a5) # 8000e138 <panicked>
    80009c70:	00078463          	beqz	a5,80009c78 <uartputc+0x10>
    80009c74:	0000006f          	j	80009c74 <uartputc+0xc>
    80009c78:	fd010113          	addi	sp,sp,-48
    80009c7c:	02813023          	sd	s0,32(sp)
    80009c80:	00913c23          	sd	s1,24(sp)
    80009c84:	01213823          	sd	s2,16(sp)
    80009c88:	01313423          	sd	s3,8(sp)
    80009c8c:	02113423          	sd	ra,40(sp)
    80009c90:	03010413          	addi	s0,sp,48
    80009c94:	00004917          	auipc	s2,0x4
    80009c98:	4ac90913          	addi	s2,s2,1196 # 8000e140 <uart_tx_r>
    80009c9c:	00093783          	ld	a5,0(s2)
    80009ca0:	00004497          	auipc	s1,0x4
    80009ca4:	4a848493          	addi	s1,s1,1192 # 8000e148 <uart_tx_w>
    80009ca8:	0004b703          	ld	a4,0(s1)
    80009cac:	02078693          	addi	a3,a5,32
    80009cb0:	00050993          	mv	s3,a0
    80009cb4:	02e69c63          	bne	a3,a4,80009cec <uartputc+0x84>
    80009cb8:	00001097          	auipc	ra,0x1
    80009cbc:	834080e7          	jalr	-1996(ra) # 8000a4ec <push_on>
    80009cc0:	00093783          	ld	a5,0(s2)
    80009cc4:	0004b703          	ld	a4,0(s1)
    80009cc8:	02078793          	addi	a5,a5,32
    80009ccc:	00e79463          	bne	a5,a4,80009cd4 <uartputc+0x6c>
    80009cd0:	0000006f          	j	80009cd0 <uartputc+0x68>
    80009cd4:	00001097          	auipc	ra,0x1
    80009cd8:	88c080e7          	jalr	-1908(ra) # 8000a560 <pop_on>
    80009cdc:	00093783          	ld	a5,0(s2)
    80009ce0:	0004b703          	ld	a4,0(s1)
    80009ce4:	02078693          	addi	a3,a5,32
    80009ce8:	fce688e3          	beq	a3,a4,80009cb8 <uartputc+0x50>
    80009cec:	01f77693          	andi	a3,a4,31
    80009cf0:	00005597          	auipc	a1,0x5
    80009cf4:	74058593          	addi	a1,a1,1856 # 8000f430 <uart_tx_buf>
    80009cf8:	00d586b3          	add	a3,a1,a3
    80009cfc:	00170713          	addi	a4,a4,1
    80009d00:	01368023          	sb	s3,0(a3)
    80009d04:	00e4b023          	sd	a4,0(s1)
    80009d08:	10000637          	lui	a2,0x10000
    80009d0c:	02f71063          	bne	a4,a5,80009d2c <uartputc+0xc4>
    80009d10:	0340006f          	j	80009d44 <uartputc+0xdc>
    80009d14:	00074703          	lbu	a4,0(a4)
    80009d18:	00f93023          	sd	a5,0(s2)
    80009d1c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80009d20:	00093783          	ld	a5,0(s2)
    80009d24:	0004b703          	ld	a4,0(s1)
    80009d28:	00f70e63          	beq	a4,a5,80009d44 <uartputc+0xdc>
    80009d2c:	00564683          	lbu	a3,5(a2)
    80009d30:	01f7f713          	andi	a4,a5,31
    80009d34:	00e58733          	add	a4,a1,a4
    80009d38:	0206f693          	andi	a3,a3,32
    80009d3c:	00178793          	addi	a5,a5,1
    80009d40:	fc069ae3          	bnez	a3,80009d14 <uartputc+0xac>
    80009d44:	02813083          	ld	ra,40(sp)
    80009d48:	02013403          	ld	s0,32(sp)
    80009d4c:	01813483          	ld	s1,24(sp)
    80009d50:	01013903          	ld	s2,16(sp)
    80009d54:	00813983          	ld	s3,8(sp)
    80009d58:	03010113          	addi	sp,sp,48
    80009d5c:	00008067          	ret

0000000080009d60 <uartputc_sync>:
    80009d60:	ff010113          	addi	sp,sp,-16
    80009d64:	00813423          	sd	s0,8(sp)
    80009d68:	01010413          	addi	s0,sp,16
    80009d6c:	00004717          	auipc	a4,0x4
    80009d70:	3cc72703          	lw	a4,972(a4) # 8000e138 <panicked>
    80009d74:	02071663          	bnez	a4,80009da0 <uartputc_sync+0x40>
    80009d78:	00050793          	mv	a5,a0
    80009d7c:	100006b7          	lui	a3,0x10000
    80009d80:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80009d84:	02077713          	andi	a4,a4,32
    80009d88:	fe070ce3          	beqz	a4,80009d80 <uartputc_sync+0x20>
    80009d8c:	0ff7f793          	andi	a5,a5,255
    80009d90:	00f68023          	sb	a5,0(a3)
    80009d94:	00813403          	ld	s0,8(sp)
    80009d98:	01010113          	addi	sp,sp,16
    80009d9c:	00008067          	ret
    80009da0:	0000006f          	j	80009da0 <uartputc_sync+0x40>

0000000080009da4 <uartstart>:
    80009da4:	ff010113          	addi	sp,sp,-16
    80009da8:	00813423          	sd	s0,8(sp)
    80009dac:	01010413          	addi	s0,sp,16
    80009db0:	00004617          	auipc	a2,0x4
    80009db4:	39060613          	addi	a2,a2,912 # 8000e140 <uart_tx_r>
    80009db8:	00004517          	auipc	a0,0x4
    80009dbc:	39050513          	addi	a0,a0,912 # 8000e148 <uart_tx_w>
    80009dc0:	00063783          	ld	a5,0(a2)
    80009dc4:	00053703          	ld	a4,0(a0)
    80009dc8:	04f70263          	beq	a4,a5,80009e0c <uartstart+0x68>
    80009dcc:	100005b7          	lui	a1,0x10000
    80009dd0:	00005817          	auipc	a6,0x5
    80009dd4:	66080813          	addi	a6,a6,1632 # 8000f430 <uart_tx_buf>
    80009dd8:	01c0006f          	j	80009df4 <uartstart+0x50>
    80009ddc:	0006c703          	lbu	a4,0(a3)
    80009de0:	00f63023          	sd	a5,0(a2)
    80009de4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009de8:	00063783          	ld	a5,0(a2)
    80009dec:	00053703          	ld	a4,0(a0)
    80009df0:	00f70e63          	beq	a4,a5,80009e0c <uartstart+0x68>
    80009df4:	01f7f713          	andi	a4,a5,31
    80009df8:	00e806b3          	add	a3,a6,a4
    80009dfc:	0055c703          	lbu	a4,5(a1)
    80009e00:	00178793          	addi	a5,a5,1
    80009e04:	02077713          	andi	a4,a4,32
    80009e08:	fc071ae3          	bnez	a4,80009ddc <uartstart+0x38>
    80009e0c:	00813403          	ld	s0,8(sp)
    80009e10:	01010113          	addi	sp,sp,16
    80009e14:	00008067          	ret

0000000080009e18 <uartgetc>:
    80009e18:	ff010113          	addi	sp,sp,-16
    80009e1c:	00813423          	sd	s0,8(sp)
    80009e20:	01010413          	addi	s0,sp,16
    80009e24:	10000737          	lui	a4,0x10000
    80009e28:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80009e2c:	0017f793          	andi	a5,a5,1
    80009e30:	00078c63          	beqz	a5,80009e48 <uartgetc+0x30>
    80009e34:	00074503          	lbu	a0,0(a4)
    80009e38:	0ff57513          	andi	a0,a0,255
    80009e3c:	00813403          	ld	s0,8(sp)
    80009e40:	01010113          	addi	sp,sp,16
    80009e44:	00008067          	ret
    80009e48:	fff00513          	li	a0,-1
    80009e4c:	ff1ff06f          	j	80009e3c <uartgetc+0x24>

0000000080009e50 <uartintr>:
    80009e50:	100007b7          	lui	a5,0x10000
    80009e54:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80009e58:	0017f793          	andi	a5,a5,1
    80009e5c:	0a078463          	beqz	a5,80009f04 <uartintr+0xb4>
    80009e60:	fe010113          	addi	sp,sp,-32
    80009e64:	00813823          	sd	s0,16(sp)
    80009e68:	00913423          	sd	s1,8(sp)
    80009e6c:	00113c23          	sd	ra,24(sp)
    80009e70:	02010413          	addi	s0,sp,32
    80009e74:	100004b7          	lui	s1,0x10000
    80009e78:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80009e7c:	0ff57513          	andi	a0,a0,255
    80009e80:	fffff097          	auipc	ra,0xfffff
    80009e84:	534080e7          	jalr	1332(ra) # 800093b4 <consoleintr>
    80009e88:	0054c783          	lbu	a5,5(s1)
    80009e8c:	0017f793          	andi	a5,a5,1
    80009e90:	fe0794e3          	bnez	a5,80009e78 <uartintr+0x28>
    80009e94:	00004617          	auipc	a2,0x4
    80009e98:	2ac60613          	addi	a2,a2,684 # 8000e140 <uart_tx_r>
    80009e9c:	00004517          	auipc	a0,0x4
    80009ea0:	2ac50513          	addi	a0,a0,684 # 8000e148 <uart_tx_w>
    80009ea4:	00063783          	ld	a5,0(a2)
    80009ea8:	00053703          	ld	a4,0(a0)
    80009eac:	04f70263          	beq	a4,a5,80009ef0 <uartintr+0xa0>
    80009eb0:	100005b7          	lui	a1,0x10000
    80009eb4:	00005817          	auipc	a6,0x5
    80009eb8:	57c80813          	addi	a6,a6,1404 # 8000f430 <uart_tx_buf>
    80009ebc:	01c0006f          	j	80009ed8 <uartintr+0x88>
    80009ec0:	0006c703          	lbu	a4,0(a3)
    80009ec4:	00f63023          	sd	a5,0(a2)
    80009ec8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009ecc:	00063783          	ld	a5,0(a2)
    80009ed0:	00053703          	ld	a4,0(a0)
    80009ed4:	00f70e63          	beq	a4,a5,80009ef0 <uartintr+0xa0>
    80009ed8:	01f7f713          	andi	a4,a5,31
    80009edc:	00e806b3          	add	a3,a6,a4
    80009ee0:	0055c703          	lbu	a4,5(a1)
    80009ee4:	00178793          	addi	a5,a5,1
    80009ee8:	02077713          	andi	a4,a4,32
    80009eec:	fc071ae3          	bnez	a4,80009ec0 <uartintr+0x70>
    80009ef0:	01813083          	ld	ra,24(sp)
    80009ef4:	01013403          	ld	s0,16(sp)
    80009ef8:	00813483          	ld	s1,8(sp)
    80009efc:	02010113          	addi	sp,sp,32
    80009f00:	00008067          	ret
    80009f04:	00004617          	auipc	a2,0x4
    80009f08:	23c60613          	addi	a2,a2,572 # 8000e140 <uart_tx_r>
    80009f0c:	00004517          	auipc	a0,0x4
    80009f10:	23c50513          	addi	a0,a0,572 # 8000e148 <uart_tx_w>
    80009f14:	00063783          	ld	a5,0(a2)
    80009f18:	00053703          	ld	a4,0(a0)
    80009f1c:	04f70263          	beq	a4,a5,80009f60 <uartintr+0x110>
    80009f20:	100005b7          	lui	a1,0x10000
    80009f24:	00005817          	auipc	a6,0x5
    80009f28:	50c80813          	addi	a6,a6,1292 # 8000f430 <uart_tx_buf>
    80009f2c:	01c0006f          	j	80009f48 <uartintr+0xf8>
    80009f30:	0006c703          	lbu	a4,0(a3)
    80009f34:	00f63023          	sd	a5,0(a2)
    80009f38:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009f3c:	00063783          	ld	a5,0(a2)
    80009f40:	00053703          	ld	a4,0(a0)
    80009f44:	02f70063          	beq	a4,a5,80009f64 <uartintr+0x114>
    80009f48:	01f7f713          	andi	a4,a5,31
    80009f4c:	00e806b3          	add	a3,a6,a4
    80009f50:	0055c703          	lbu	a4,5(a1)
    80009f54:	00178793          	addi	a5,a5,1
    80009f58:	02077713          	andi	a4,a4,32
    80009f5c:	fc071ae3          	bnez	a4,80009f30 <uartintr+0xe0>
    80009f60:	00008067          	ret
    80009f64:	00008067          	ret

0000000080009f68 <kinit>:
    80009f68:	fc010113          	addi	sp,sp,-64
    80009f6c:	02913423          	sd	s1,40(sp)
    80009f70:	fffff7b7          	lui	a5,0xfffff
    80009f74:	00006497          	auipc	s1,0x6
    80009f78:	4db48493          	addi	s1,s1,1243 # 8001044f <end+0xfff>
    80009f7c:	02813823          	sd	s0,48(sp)
    80009f80:	01313c23          	sd	s3,24(sp)
    80009f84:	00f4f4b3          	and	s1,s1,a5
    80009f88:	02113c23          	sd	ra,56(sp)
    80009f8c:	03213023          	sd	s2,32(sp)
    80009f90:	01413823          	sd	s4,16(sp)
    80009f94:	01513423          	sd	s5,8(sp)
    80009f98:	04010413          	addi	s0,sp,64
    80009f9c:	000017b7          	lui	a5,0x1
    80009fa0:	01100993          	li	s3,17
    80009fa4:	00f487b3          	add	a5,s1,a5
    80009fa8:	01b99993          	slli	s3,s3,0x1b
    80009fac:	06f9e063          	bltu	s3,a5,8000a00c <kinit+0xa4>
    80009fb0:	00005a97          	auipc	s5,0x5
    80009fb4:	4a0a8a93          	addi	s5,s5,1184 # 8000f450 <end>
    80009fb8:	0754ec63          	bltu	s1,s5,8000a030 <kinit+0xc8>
    80009fbc:	0734fa63          	bgeu	s1,s3,8000a030 <kinit+0xc8>
    80009fc0:	00088a37          	lui	s4,0x88
    80009fc4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80009fc8:	00004917          	auipc	s2,0x4
    80009fcc:	18890913          	addi	s2,s2,392 # 8000e150 <kmem>
    80009fd0:	00ca1a13          	slli	s4,s4,0xc
    80009fd4:	0140006f          	j	80009fe8 <kinit+0x80>
    80009fd8:	000017b7          	lui	a5,0x1
    80009fdc:	00f484b3          	add	s1,s1,a5
    80009fe0:	0554e863          	bltu	s1,s5,8000a030 <kinit+0xc8>
    80009fe4:	0534f663          	bgeu	s1,s3,8000a030 <kinit+0xc8>
    80009fe8:	00001637          	lui	a2,0x1
    80009fec:	00100593          	li	a1,1
    80009ff0:	00048513          	mv	a0,s1
    80009ff4:	00000097          	auipc	ra,0x0
    80009ff8:	5e4080e7          	jalr	1508(ra) # 8000a5d8 <__memset>
    80009ffc:	00093783          	ld	a5,0(s2)
    8000a000:	00f4b023          	sd	a5,0(s1)
    8000a004:	00993023          	sd	s1,0(s2)
    8000a008:	fd4498e3          	bne	s1,s4,80009fd8 <kinit+0x70>
    8000a00c:	03813083          	ld	ra,56(sp)
    8000a010:	03013403          	ld	s0,48(sp)
    8000a014:	02813483          	ld	s1,40(sp)
    8000a018:	02013903          	ld	s2,32(sp)
    8000a01c:	01813983          	ld	s3,24(sp)
    8000a020:	01013a03          	ld	s4,16(sp)
    8000a024:	00813a83          	ld	s5,8(sp)
    8000a028:	04010113          	addi	sp,sp,64
    8000a02c:	00008067          	ret
    8000a030:	00002517          	auipc	a0,0x2
    8000a034:	b1050513          	addi	a0,a0,-1264 # 8000bb40 <digits+0x18>
    8000a038:	fffff097          	auipc	ra,0xfffff
    8000a03c:	4b4080e7          	jalr	1204(ra) # 800094ec <panic>

000000008000a040 <freerange>:
    8000a040:	fc010113          	addi	sp,sp,-64
    8000a044:	000017b7          	lui	a5,0x1
    8000a048:	02913423          	sd	s1,40(sp)
    8000a04c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    8000a050:	009504b3          	add	s1,a0,s1
    8000a054:	fffff537          	lui	a0,0xfffff
    8000a058:	02813823          	sd	s0,48(sp)
    8000a05c:	02113c23          	sd	ra,56(sp)
    8000a060:	03213023          	sd	s2,32(sp)
    8000a064:	01313c23          	sd	s3,24(sp)
    8000a068:	01413823          	sd	s4,16(sp)
    8000a06c:	01513423          	sd	s5,8(sp)
    8000a070:	01613023          	sd	s6,0(sp)
    8000a074:	04010413          	addi	s0,sp,64
    8000a078:	00a4f4b3          	and	s1,s1,a0
    8000a07c:	00f487b3          	add	a5,s1,a5
    8000a080:	06f5e463          	bltu	a1,a5,8000a0e8 <freerange+0xa8>
    8000a084:	00005a97          	auipc	s5,0x5
    8000a088:	3cca8a93          	addi	s5,s5,972 # 8000f450 <end>
    8000a08c:	0954e263          	bltu	s1,s5,8000a110 <freerange+0xd0>
    8000a090:	01100993          	li	s3,17
    8000a094:	01b99993          	slli	s3,s3,0x1b
    8000a098:	0734fc63          	bgeu	s1,s3,8000a110 <freerange+0xd0>
    8000a09c:	00058a13          	mv	s4,a1
    8000a0a0:	00004917          	auipc	s2,0x4
    8000a0a4:	0b090913          	addi	s2,s2,176 # 8000e150 <kmem>
    8000a0a8:	00002b37          	lui	s6,0x2
    8000a0ac:	0140006f          	j	8000a0c0 <freerange+0x80>
    8000a0b0:	000017b7          	lui	a5,0x1
    8000a0b4:	00f484b3          	add	s1,s1,a5
    8000a0b8:	0554ec63          	bltu	s1,s5,8000a110 <freerange+0xd0>
    8000a0bc:	0534fa63          	bgeu	s1,s3,8000a110 <freerange+0xd0>
    8000a0c0:	00001637          	lui	a2,0x1
    8000a0c4:	00100593          	li	a1,1
    8000a0c8:	00048513          	mv	a0,s1
    8000a0cc:	00000097          	auipc	ra,0x0
    8000a0d0:	50c080e7          	jalr	1292(ra) # 8000a5d8 <__memset>
    8000a0d4:	00093703          	ld	a4,0(s2)
    8000a0d8:	016487b3          	add	a5,s1,s6
    8000a0dc:	00e4b023          	sd	a4,0(s1)
    8000a0e0:	00993023          	sd	s1,0(s2)
    8000a0e4:	fcfa76e3          	bgeu	s4,a5,8000a0b0 <freerange+0x70>
    8000a0e8:	03813083          	ld	ra,56(sp)
    8000a0ec:	03013403          	ld	s0,48(sp)
    8000a0f0:	02813483          	ld	s1,40(sp)
    8000a0f4:	02013903          	ld	s2,32(sp)
    8000a0f8:	01813983          	ld	s3,24(sp)
    8000a0fc:	01013a03          	ld	s4,16(sp)
    8000a100:	00813a83          	ld	s5,8(sp)
    8000a104:	00013b03          	ld	s6,0(sp)
    8000a108:	04010113          	addi	sp,sp,64
    8000a10c:	00008067          	ret
    8000a110:	00002517          	auipc	a0,0x2
    8000a114:	a3050513          	addi	a0,a0,-1488 # 8000bb40 <digits+0x18>
    8000a118:	fffff097          	auipc	ra,0xfffff
    8000a11c:	3d4080e7          	jalr	980(ra) # 800094ec <panic>

000000008000a120 <kfree>:
    8000a120:	fe010113          	addi	sp,sp,-32
    8000a124:	00813823          	sd	s0,16(sp)
    8000a128:	00113c23          	sd	ra,24(sp)
    8000a12c:	00913423          	sd	s1,8(sp)
    8000a130:	02010413          	addi	s0,sp,32
    8000a134:	03451793          	slli	a5,a0,0x34
    8000a138:	04079c63          	bnez	a5,8000a190 <kfree+0x70>
    8000a13c:	00005797          	auipc	a5,0x5
    8000a140:	31478793          	addi	a5,a5,788 # 8000f450 <end>
    8000a144:	00050493          	mv	s1,a0
    8000a148:	04f56463          	bltu	a0,a5,8000a190 <kfree+0x70>
    8000a14c:	01100793          	li	a5,17
    8000a150:	01b79793          	slli	a5,a5,0x1b
    8000a154:	02f57e63          	bgeu	a0,a5,8000a190 <kfree+0x70>
    8000a158:	00001637          	lui	a2,0x1
    8000a15c:	00100593          	li	a1,1
    8000a160:	00000097          	auipc	ra,0x0
    8000a164:	478080e7          	jalr	1144(ra) # 8000a5d8 <__memset>
    8000a168:	00004797          	auipc	a5,0x4
    8000a16c:	fe878793          	addi	a5,a5,-24 # 8000e150 <kmem>
    8000a170:	0007b703          	ld	a4,0(a5)
    8000a174:	01813083          	ld	ra,24(sp)
    8000a178:	01013403          	ld	s0,16(sp)
    8000a17c:	00e4b023          	sd	a4,0(s1)
    8000a180:	0097b023          	sd	s1,0(a5)
    8000a184:	00813483          	ld	s1,8(sp)
    8000a188:	02010113          	addi	sp,sp,32
    8000a18c:	00008067          	ret
    8000a190:	00002517          	auipc	a0,0x2
    8000a194:	9b050513          	addi	a0,a0,-1616 # 8000bb40 <digits+0x18>
    8000a198:	fffff097          	auipc	ra,0xfffff
    8000a19c:	354080e7          	jalr	852(ra) # 800094ec <panic>

000000008000a1a0 <kalloc>:
    8000a1a0:	fe010113          	addi	sp,sp,-32
    8000a1a4:	00813823          	sd	s0,16(sp)
    8000a1a8:	00913423          	sd	s1,8(sp)
    8000a1ac:	00113c23          	sd	ra,24(sp)
    8000a1b0:	02010413          	addi	s0,sp,32
    8000a1b4:	00004797          	auipc	a5,0x4
    8000a1b8:	f9c78793          	addi	a5,a5,-100 # 8000e150 <kmem>
    8000a1bc:	0007b483          	ld	s1,0(a5)
    8000a1c0:	02048063          	beqz	s1,8000a1e0 <kalloc+0x40>
    8000a1c4:	0004b703          	ld	a4,0(s1)
    8000a1c8:	00001637          	lui	a2,0x1
    8000a1cc:	00500593          	li	a1,5
    8000a1d0:	00048513          	mv	a0,s1
    8000a1d4:	00e7b023          	sd	a4,0(a5)
    8000a1d8:	00000097          	auipc	ra,0x0
    8000a1dc:	400080e7          	jalr	1024(ra) # 8000a5d8 <__memset>
    8000a1e0:	01813083          	ld	ra,24(sp)
    8000a1e4:	01013403          	ld	s0,16(sp)
    8000a1e8:	00048513          	mv	a0,s1
    8000a1ec:	00813483          	ld	s1,8(sp)
    8000a1f0:	02010113          	addi	sp,sp,32
    8000a1f4:	00008067          	ret

000000008000a1f8 <initlock>:
    8000a1f8:	ff010113          	addi	sp,sp,-16
    8000a1fc:	00813423          	sd	s0,8(sp)
    8000a200:	01010413          	addi	s0,sp,16
    8000a204:	00813403          	ld	s0,8(sp)
    8000a208:	00b53423          	sd	a1,8(a0)
    8000a20c:	00052023          	sw	zero,0(a0)
    8000a210:	00053823          	sd	zero,16(a0)
    8000a214:	01010113          	addi	sp,sp,16
    8000a218:	00008067          	ret

000000008000a21c <acquire>:
    8000a21c:	fe010113          	addi	sp,sp,-32
    8000a220:	00813823          	sd	s0,16(sp)
    8000a224:	00913423          	sd	s1,8(sp)
    8000a228:	00113c23          	sd	ra,24(sp)
    8000a22c:	01213023          	sd	s2,0(sp)
    8000a230:	02010413          	addi	s0,sp,32
    8000a234:	00050493          	mv	s1,a0
    8000a238:	10002973          	csrr	s2,sstatus
    8000a23c:	100027f3          	csrr	a5,sstatus
    8000a240:	ffd7f793          	andi	a5,a5,-3
    8000a244:	10079073          	csrw	sstatus,a5
    8000a248:	fffff097          	auipc	ra,0xfffff
    8000a24c:	8e0080e7          	jalr	-1824(ra) # 80008b28 <mycpu>
    8000a250:	07852783          	lw	a5,120(a0)
    8000a254:	06078e63          	beqz	a5,8000a2d0 <acquire+0xb4>
    8000a258:	fffff097          	auipc	ra,0xfffff
    8000a25c:	8d0080e7          	jalr	-1840(ra) # 80008b28 <mycpu>
    8000a260:	07852783          	lw	a5,120(a0)
    8000a264:	0004a703          	lw	a4,0(s1)
    8000a268:	0017879b          	addiw	a5,a5,1
    8000a26c:	06f52c23          	sw	a5,120(a0)
    8000a270:	04071063          	bnez	a4,8000a2b0 <acquire+0x94>
    8000a274:	00100713          	li	a4,1
    8000a278:	00070793          	mv	a5,a4
    8000a27c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    8000a280:	0007879b          	sext.w	a5,a5
    8000a284:	fe079ae3          	bnez	a5,8000a278 <acquire+0x5c>
    8000a288:	0ff0000f          	fence
    8000a28c:	fffff097          	auipc	ra,0xfffff
    8000a290:	89c080e7          	jalr	-1892(ra) # 80008b28 <mycpu>
    8000a294:	01813083          	ld	ra,24(sp)
    8000a298:	01013403          	ld	s0,16(sp)
    8000a29c:	00a4b823          	sd	a0,16(s1)
    8000a2a0:	00013903          	ld	s2,0(sp)
    8000a2a4:	00813483          	ld	s1,8(sp)
    8000a2a8:	02010113          	addi	sp,sp,32
    8000a2ac:	00008067          	ret
    8000a2b0:	0104b903          	ld	s2,16(s1)
    8000a2b4:	fffff097          	auipc	ra,0xfffff
    8000a2b8:	874080e7          	jalr	-1932(ra) # 80008b28 <mycpu>
    8000a2bc:	faa91ce3          	bne	s2,a0,8000a274 <acquire+0x58>
    8000a2c0:	00002517          	auipc	a0,0x2
    8000a2c4:	88850513          	addi	a0,a0,-1912 # 8000bb48 <digits+0x20>
    8000a2c8:	fffff097          	auipc	ra,0xfffff
    8000a2cc:	224080e7          	jalr	548(ra) # 800094ec <panic>
    8000a2d0:	00195913          	srli	s2,s2,0x1
    8000a2d4:	fffff097          	auipc	ra,0xfffff
    8000a2d8:	854080e7          	jalr	-1964(ra) # 80008b28 <mycpu>
    8000a2dc:	00197913          	andi	s2,s2,1
    8000a2e0:	07252e23          	sw	s2,124(a0)
    8000a2e4:	f75ff06f          	j	8000a258 <acquire+0x3c>

000000008000a2e8 <release>:
    8000a2e8:	fe010113          	addi	sp,sp,-32
    8000a2ec:	00813823          	sd	s0,16(sp)
    8000a2f0:	00113c23          	sd	ra,24(sp)
    8000a2f4:	00913423          	sd	s1,8(sp)
    8000a2f8:	01213023          	sd	s2,0(sp)
    8000a2fc:	02010413          	addi	s0,sp,32
    8000a300:	00052783          	lw	a5,0(a0)
    8000a304:	00079a63          	bnez	a5,8000a318 <release+0x30>
    8000a308:	00002517          	auipc	a0,0x2
    8000a30c:	84850513          	addi	a0,a0,-1976 # 8000bb50 <digits+0x28>
    8000a310:	fffff097          	auipc	ra,0xfffff
    8000a314:	1dc080e7          	jalr	476(ra) # 800094ec <panic>
    8000a318:	01053903          	ld	s2,16(a0)
    8000a31c:	00050493          	mv	s1,a0
    8000a320:	fffff097          	auipc	ra,0xfffff
    8000a324:	808080e7          	jalr	-2040(ra) # 80008b28 <mycpu>
    8000a328:	fea910e3          	bne	s2,a0,8000a308 <release+0x20>
    8000a32c:	0004b823          	sd	zero,16(s1)
    8000a330:	0ff0000f          	fence
    8000a334:	0f50000f          	fence	iorw,ow
    8000a338:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000a33c:	ffffe097          	auipc	ra,0xffffe
    8000a340:	7ec080e7          	jalr	2028(ra) # 80008b28 <mycpu>
    8000a344:	100027f3          	csrr	a5,sstatus
    8000a348:	0027f793          	andi	a5,a5,2
    8000a34c:	04079a63          	bnez	a5,8000a3a0 <release+0xb8>
    8000a350:	07852783          	lw	a5,120(a0)
    8000a354:	02f05e63          	blez	a5,8000a390 <release+0xa8>
    8000a358:	fff7871b          	addiw	a4,a5,-1
    8000a35c:	06e52c23          	sw	a4,120(a0)
    8000a360:	00071c63          	bnez	a4,8000a378 <release+0x90>
    8000a364:	07c52783          	lw	a5,124(a0)
    8000a368:	00078863          	beqz	a5,8000a378 <release+0x90>
    8000a36c:	100027f3          	csrr	a5,sstatus
    8000a370:	0027e793          	ori	a5,a5,2
    8000a374:	10079073          	csrw	sstatus,a5
    8000a378:	01813083          	ld	ra,24(sp)
    8000a37c:	01013403          	ld	s0,16(sp)
    8000a380:	00813483          	ld	s1,8(sp)
    8000a384:	00013903          	ld	s2,0(sp)
    8000a388:	02010113          	addi	sp,sp,32
    8000a38c:	00008067          	ret
    8000a390:	00001517          	auipc	a0,0x1
    8000a394:	7e050513          	addi	a0,a0,2016 # 8000bb70 <digits+0x48>
    8000a398:	fffff097          	auipc	ra,0xfffff
    8000a39c:	154080e7          	jalr	340(ra) # 800094ec <panic>
    8000a3a0:	00001517          	auipc	a0,0x1
    8000a3a4:	7b850513          	addi	a0,a0,1976 # 8000bb58 <digits+0x30>
    8000a3a8:	fffff097          	auipc	ra,0xfffff
    8000a3ac:	144080e7          	jalr	324(ra) # 800094ec <panic>

000000008000a3b0 <holding>:
    8000a3b0:	00052783          	lw	a5,0(a0)
    8000a3b4:	00079663          	bnez	a5,8000a3c0 <holding+0x10>
    8000a3b8:	00000513          	li	a0,0
    8000a3bc:	00008067          	ret
    8000a3c0:	fe010113          	addi	sp,sp,-32
    8000a3c4:	00813823          	sd	s0,16(sp)
    8000a3c8:	00913423          	sd	s1,8(sp)
    8000a3cc:	00113c23          	sd	ra,24(sp)
    8000a3d0:	02010413          	addi	s0,sp,32
    8000a3d4:	01053483          	ld	s1,16(a0)
    8000a3d8:	ffffe097          	auipc	ra,0xffffe
    8000a3dc:	750080e7          	jalr	1872(ra) # 80008b28 <mycpu>
    8000a3e0:	01813083          	ld	ra,24(sp)
    8000a3e4:	01013403          	ld	s0,16(sp)
    8000a3e8:	40a48533          	sub	a0,s1,a0
    8000a3ec:	00153513          	seqz	a0,a0
    8000a3f0:	00813483          	ld	s1,8(sp)
    8000a3f4:	02010113          	addi	sp,sp,32
    8000a3f8:	00008067          	ret

000000008000a3fc <push_off>:
    8000a3fc:	fe010113          	addi	sp,sp,-32
    8000a400:	00813823          	sd	s0,16(sp)
    8000a404:	00113c23          	sd	ra,24(sp)
    8000a408:	00913423          	sd	s1,8(sp)
    8000a40c:	02010413          	addi	s0,sp,32
    8000a410:	100024f3          	csrr	s1,sstatus
    8000a414:	100027f3          	csrr	a5,sstatus
    8000a418:	ffd7f793          	andi	a5,a5,-3
    8000a41c:	10079073          	csrw	sstatus,a5
    8000a420:	ffffe097          	auipc	ra,0xffffe
    8000a424:	708080e7          	jalr	1800(ra) # 80008b28 <mycpu>
    8000a428:	07852783          	lw	a5,120(a0)
    8000a42c:	02078663          	beqz	a5,8000a458 <push_off+0x5c>
    8000a430:	ffffe097          	auipc	ra,0xffffe
    8000a434:	6f8080e7          	jalr	1784(ra) # 80008b28 <mycpu>
    8000a438:	07852783          	lw	a5,120(a0)
    8000a43c:	01813083          	ld	ra,24(sp)
    8000a440:	01013403          	ld	s0,16(sp)
    8000a444:	0017879b          	addiw	a5,a5,1
    8000a448:	06f52c23          	sw	a5,120(a0)
    8000a44c:	00813483          	ld	s1,8(sp)
    8000a450:	02010113          	addi	sp,sp,32
    8000a454:	00008067          	ret
    8000a458:	0014d493          	srli	s1,s1,0x1
    8000a45c:	ffffe097          	auipc	ra,0xffffe
    8000a460:	6cc080e7          	jalr	1740(ra) # 80008b28 <mycpu>
    8000a464:	0014f493          	andi	s1,s1,1
    8000a468:	06952e23          	sw	s1,124(a0)
    8000a46c:	fc5ff06f          	j	8000a430 <push_off+0x34>

000000008000a470 <pop_off>:
    8000a470:	ff010113          	addi	sp,sp,-16
    8000a474:	00813023          	sd	s0,0(sp)
    8000a478:	00113423          	sd	ra,8(sp)
    8000a47c:	01010413          	addi	s0,sp,16
    8000a480:	ffffe097          	auipc	ra,0xffffe
    8000a484:	6a8080e7          	jalr	1704(ra) # 80008b28 <mycpu>
    8000a488:	100027f3          	csrr	a5,sstatus
    8000a48c:	0027f793          	andi	a5,a5,2
    8000a490:	04079663          	bnez	a5,8000a4dc <pop_off+0x6c>
    8000a494:	07852783          	lw	a5,120(a0)
    8000a498:	02f05a63          	blez	a5,8000a4cc <pop_off+0x5c>
    8000a49c:	fff7871b          	addiw	a4,a5,-1
    8000a4a0:	06e52c23          	sw	a4,120(a0)
    8000a4a4:	00071c63          	bnez	a4,8000a4bc <pop_off+0x4c>
    8000a4a8:	07c52783          	lw	a5,124(a0)
    8000a4ac:	00078863          	beqz	a5,8000a4bc <pop_off+0x4c>
    8000a4b0:	100027f3          	csrr	a5,sstatus
    8000a4b4:	0027e793          	ori	a5,a5,2
    8000a4b8:	10079073          	csrw	sstatus,a5
    8000a4bc:	00813083          	ld	ra,8(sp)
    8000a4c0:	00013403          	ld	s0,0(sp)
    8000a4c4:	01010113          	addi	sp,sp,16
    8000a4c8:	00008067          	ret
    8000a4cc:	00001517          	auipc	a0,0x1
    8000a4d0:	6a450513          	addi	a0,a0,1700 # 8000bb70 <digits+0x48>
    8000a4d4:	fffff097          	auipc	ra,0xfffff
    8000a4d8:	018080e7          	jalr	24(ra) # 800094ec <panic>
    8000a4dc:	00001517          	auipc	a0,0x1
    8000a4e0:	67c50513          	addi	a0,a0,1660 # 8000bb58 <digits+0x30>
    8000a4e4:	fffff097          	auipc	ra,0xfffff
    8000a4e8:	008080e7          	jalr	8(ra) # 800094ec <panic>

000000008000a4ec <push_on>:
    8000a4ec:	fe010113          	addi	sp,sp,-32
    8000a4f0:	00813823          	sd	s0,16(sp)
    8000a4f4:	00113c23          	sd	ra,24(sp)
    8000a4f8:	00913423          	sd	s1,8(sp)
    8000a4fc:	02010413          	addi	s0,sp,32
    8000a500:	100024f3          	csrr	s1,sstatus
    8000a504:	100027f3          	csrr	a5,sstatus
    8000a508:	0027e793          	ori	a5,a5,2
    8000a50c:	10079073          	csrw	sstatus,a5
    8000a510:	ffffe097          	auipc	ra,0xffffe
    8000a514:	618080e7          	jalr	1560(ra) # 80008b28 <mycpu>
    8000a518:	07852783          	lw	a5,120(a0)
    8000a51c:	02078663          	beqz	a5,8000a548 <push_on+0x5c>
    8000a520:	ffffe097          	auipc	ra,0xffffe
    8000a524:	608080e7          	jalr	1544(ra) # 80008b28 <mycpu>
    8000a528:	07852783          	lw	a5,120(a0)
    8000a52c:	01813083          	ld	ra,24(sp)
    8000a530:	01013403          	ld	s0,16(sp)
    8000a534:	0017879b          	addiw	a5,a5,1
    8000a538:	06f52c23          	sw	a5,120(a0)
    8000a53c:	00813483          	ld	s1,8(sp)
    8000a540:	02010113          	addi	sp,sp,32
    8000a544:	00008067          	ret
    8000a548:	0014d493          	srli	s1,s1,0x1
    8000a54c:	ffffe097          	auipc	ra,0xffffe
    8000a550:	5dc080e7          	jalr	1500(ra) # 80008b28 <mycpu>
    8000a554:	0014f493          	andi	s1,s1,1
    8000a558:	06952e23          	sw	s1,124(a0)
    8000a55c:	fc5ff06f          	j	8000a520 <push_on+0x34>

000000008000a560 <pop_on>:
    8000a560:	ff010113          	addi	sp,sp,-16
    8000a564:	00813023          	sd	s0,0(sp)
    8000a568:	00113423          	sd	ra,8(sp)
    8000a56c:	01010413          	addi	s0,sp,16
    8000a570:	ffffe097          	auipc	ra,0xffffe
    8000a574:	5b8080e7          	jalr	1464(ra) # 80008b28 <mycpu>
    8000a578:	100027f3          	csrr	a5,sstatus
    8000a57c:	0027f793          	andi	a5,a5,2
    8000a580:	04078463          	beqz	a5,8000a5c8 <pop_on+0x68>
    8000a584:	07852783          	lw	a5,120(a0)
    8000a588:	02f05863          	blez	a5,8000a5b8 <pop_on+0x58>
    8000a58c:	fff7879b          	addiw	a5,a5,-1
    8000a590:	06f52c23          	sw	a5,120(a0)
    8000a594:	07853783          	ld	a5,120(a0)
    8000a598:	00079863          	bnez	a5,8000a5a8 <pop_on+0x48>
    8000a59c:	100027f3          	csrr	a5,sstatus
    8000a5a0:	ffd7f793          	andi	a5,a5,-3
    8000a5a4:	10079073          	csrw	sstatus,a5
    8000a5a8:	00813083          	ld	ra,8(sp)
    8000a5ac:	00013403          	ld	s0,0(sp)
    8000a5b0:	01010113          	addi	sp,sp,16
    8000a5b4:	00008067          	ret
    8000a5b8:	00001517          	auipc	a0,0x1
    8000a5bc:	5e050513          	addi	a0,a0,1504 # 8000bb98 <digits+0x70>
    8000a5c0:	fffff097          	auipc	ra,0xfffff
    8000a5c4:	f2c080e7          	jalr	-212(ra) # 800094ec <panic>
    8000a5c8:	00001517          	auipc	a0,0x1
    8000a5cc:	5b050513          	addi	a0,a0,1456 # 8000bb78 <digits+0x50>
    8000a5d0:	fffff097          	auipc	ra,0xfffff
    8000a5d4:	f1c080e7          	jalr	-228(ra) # 800094ec <panic>

000000008000a5d8 <__memset>:
    8000a5d8:	ff010113          	addi	sp,sp,-16
    8000a5dc:	00813423          	sd	s0,8(sp)
    8000a5e0:	01010413          	addi	s0,sp,16
    8000a5e4:	1a060e63          	beqz	a2,8000a7a0 <__memset+0x1c8>
    8000a5e8:	40a007b3          	neg	a5,a0
    8000a5ec:	0077f793          	andi	a5,a5,7
    8000a5f0:	00778693          	addi	a3,a5,7
    8000a5f4:	00b00813          	li	a6,11
    8000a5f8:	0ff5f593          	andi	a1,a1,255
    8000a5fc:	fff6071b          	addiw	a4,a2,-1
    8000a600:	1b06e663          	bltu	a3,a6,8000a7ac <__memset+0x1d4>
    8000a604:	1cd76463          	bltu	a4,a3,8000a7cc <__memset+0x1f4>
    8000a608:	1a078e63          	beqz	a5,8000a7c4 <__memset+0x1ec>
    8000a60c:	00b50023          	sb	a1,0(a0)
    8000a610:	00100713          	li	a4,1
    8000a614:	1ae78463          	beq	a5,a4,8000a7bc <__memset+0x1e4>
    8000a618:	00b500a3          	sb	a1,1(a0)
    8000a61c:	00200713          	li	a4,2
    8000a620:	1ae78a63          	beq	a5,a4,8000a7d4 <__memset+0x1fc>
    8000a624:	00b50123          	sb	a1,2(a0)
    8000a628:	00300713          	li	a4,3
    8000a62c:	18e78463          	beq	a5,a4,8000a7b4 <__memset+0x1dc>
    8000a630:	00b501a3          	sb	a1,3(a0)
    8000a634:	00400713          	li	a4,4
    8000a638:	1ae78263          	beq	a5,a4,8000a7dc <__memset+0x204>
    8000a63c:	00b50223          	sb	a1,4(a0)
    8000a640:	00500713          	li	a4,5
    8000a644:	1ae78063          	beq	a5,a4,8000a7e4 <__memset+0x20c>
    8000a648:	00b502a3          	sb	a1,5(a0)
    8000a64c:	00700713          	li	a4,7
    8000a650:	18e79e63          	bne	a5,a4,8000a7ec <__memset+0x214>
    8000a654:	00b50323          	sb	a1,6(a0)
    8000a658:	00700e93          	li	t4,7
    8000a65c:	00859713          	slli	a4,a1,0x8
    8000a660:	00e5e733          	or	a4,a1,a4
    8000a664:	01059e13          	slli	t3,a1,0x10
    8000a668:	01c76e33          	or	t3,a4,t3
    8000a66c:	01859313          	slli	t1,a1,0x18
    8000a670:	006e6333          	or	t1,t3,t1
    8000a674:	02059893          	slli	a7,a1,0x20
    8000a678:	40f60e3b          	subw	t3,a2,a5
    8000a67c:	011368b3          	or	a7,t1,a7
    8000a680:	02859813          	slli	a6,a1,0x28
    8000a684:	0108e833          	or	a6,a7,a6
    8000a688:	03059693          	slli	a3,a1,0x30
    8000a68c:	003e589b          	srliw	a7,t3,0x3
    8000a690:	00d866b3          	or	a3,a6,a3
    8000a694:	03859713          	slli	a4,a1,0x38
    8000a698:	00389813          	slli	a6,a7,0x3
    8000a69c:	00f507b3          	add	a5,a0,a5
    8000a6a0:	00e6e733          	or	a4,a3,a4
    8000a6a4:	000e089b          	sext.w	a7,t3
    8000a6a8:	00f806b3          	add	a3,a6,a5
    8000a6ac:	00e7b023          	sd	a4,0(a5)
    8000a6b0:	00878793          	addi	a5,a5,8
    8000a6b4:	fed79ce3          	bne	a5,a3,8000a6ac <__memset+0xd4>
    8000a6b8:	ff8e7793          	andi	a5,t3,-8
    8000a6bc:	0007871b          	sext.w	a4,a5
    8000a6c0:	01d787bb          	addw	a5,a5,t4
    8000a6c4:	0ce88e63          	beq	a7,a4,8000a7a0 <__memset+0x1c8>
    8000a6c8:	00f50733          	add	a4,a0,a5
    8000a6cc:	00b70023          	sb	a1,0(a4)
    8000a6d0:	0017871b          	addiw	a4,a5,1
    8000a6d4:	0cc77663          	bgeu	a4,a2,8000a7a0 <__memset+0x1c8>
    8000a6d8:	00e50733          	add	a4,a0,a4
    8000a6dc:	00b70023          	sb	a1,0(a4)
    8000a6e0:	0027871b          	addiw	a4,a5,2
    8000a6e4:	0ac77e63          	bgeu	a4,a2,8000a7a0 <__memset+0x1c8>
    8000a6e8:	00e50733          	add	a4,a0,a4
    8000a6ec:	00b70023          	sb	a1,0(a4)
    8000a6f0:	0037871b          	addiw	a4,a5,3
    8000a6f4:	0ac77663          	bgeu	a4,a2,8000a7a0 <__memset+0x1c8>
    8000a6f8:	00e50733          	add	a4,a0,a4
    8000a6fc:	00b70023          	sb	a1,0(a4)
    8000a700:	0047871b          	addiw	a4,a5,4
    8000a704:	08c77e63          	bgeu	a4,a2,8000a7a0 <__memset+0x1c8>
    8000a708:	00e50733          	add	a4,a0,a4
    8000a70c:	00b70023          	sb	a1,0(a4)
    8000a710:	0057871b          	addiw	a4,a5,5
    8000a714:	08c77663          	bgeu	a4,a2,8000a7a0 <__memset+0x1c8>
    8000a718:	00e50733          	add	a4,a0,a4
    8000a71c:	00b70023          	sb	a1,0(a4)
    8000a720:	0067871b          	addiw	a4,a5,6
    8000a724:	06c77e63          	bgeu	a4,a2,8000a7a0 <__memset+0x1c8>
    8000a728:	00e50733          	add	a4,a0,a4
    8000a72c:	00b70023          	sb	a1,0(a4)
    8000a730:	0077871b          	addiw	a4,a5,7
    8000a734:	06c77663          	bgeu	a4,a2,8000a7a0 <__memset+0x1c8>
    8000a738:	00e50733          	add	a4,a0,a4
    8000a73c:	00b70023          	sb	a1,0(a4)
    8000a740:	0087871b          	addiw	a4,a5,8
    8000a744:	04c77e63          	bgeu	a4,a2,8000a7a0 <__memset+0x1c8>
    8000a748:	00e50733          	add	a4,a0,a4
    8000a74c:	00b70023          	sb	a1,0(a4)
    8000a750:	0097871b          	addiw	a4,a5,9
    8000a754:	04c77663          	bgeu	a4,a2,8000a7a0 <__memset+0x1c8>
    8000a758:	00e50733          	add	a4,a0,a4
    8000a75c:	00b70023          	sb	a1,0(a4)
    8000a760:	00a7871b          	addiw	a4,a5,10
    8000a764:	02c77e63          	bgeu	a4,a2,8000a7a0 <__memset+0x1c8>
    8000a768:	00e50733          	add	a4,a0,a4
    8000a76c:	00b70023          	sb	a1,0(a4)
    8000a770:	00b7871b          	addiw	a4,a5,11
    8000a774:	02c77663          	bgeu	a4,a2,8000a7a0 <__memset+0x1c8>
    8000a778:	00e50733          	add	a4,a0,a4
    8000a77c:	00b70023          	sb	a1,0(a4)
    8000a780:	00c7871b          	addiw	a4,a5,12
    8000a784:	00c77e63          	bgeu	a4,a2,8000a7a0 <__memset+0x1c8>
    8000a788:	00e50733          	add	a4,a0,a4
    8000a78c:	00b70023          	sb	a1,0(a4)
    8000a790:	00d7879b          	addiw	a5,a5,13
    8000a794:	00c7f663          	bgeu	a5,a2,8000a7a0 <__memset+0x1c8>
    8000a798:	00f507b3          	add	a5,a0,a5
    8000a79c:	00b78023          	sb	a1,0(a5)
    8000a7a0:	00813403          	ld	s0,8(sp)
    8000a7a4:	01010113          	addi	sp,sp,16
    8000a7a8:	00008067          	ret
    8000a7ac:	00b00693          	li	a3,11
    8000a7b0:	e55ff06f          	j	8000a604 <__memset+0x2c>
    8000a7b4:	00300e93          	li	t4,3
    8000a7b8:	ea5ff06f          	j	8000a65c <__memset+0x84>
    8000a7bc:	00100e93          	li	t4,1
    8000a7c0:	e9dff06f          	j	8000a65c <__memset+0x84>
    8000a7c4:	00000e93          	li	t4,0
    8000a7c8:	e95ff06f          	j	8000a65c <__memset+0x84>
    8000a7cc:	00000793          	li	a5,0
    8000a7d0:	ef9ff06f          	j	8000a6c8 <__memset+0xf0>
    8000a7d4:	00200e93          	li	t4,2
    8000a7d8:	e85ff06f          	j	8000a65c <__memset+0x84>
    8000a7dc:	00400e93          	li	t4,4
    8000a7e0:	e7dff06f          	j	8000a65c <__memset+0x84>
    8000a7e4:	00500e93          	li	t4,5
    8000a7e8:	e75ff06f          	j	8000a65c <__memset+0x84>
    8000a7ec:	00600e93          	li	t4,6
    8000a7f0:	e6dff06f          	j	8000a65c <__memset+0x84>

000000008000a7f4 <__memmove>:
    8000a7f4:	ff010113          	addi	sp,sp,-16
    8000a7f8:	00813423          	sd	s0,8(sp)
    8000a7fc:	01010413          	addi	s0,sp,16
    8000a800:	0e060863          	beqz	a2,8000a8f0 <__memmove+0xfc>
    8000a804:	fff6069b          	addiw	a3,a2,-1
    8000a808:	0006881b          	sext.w	a6,a3
    8000a80c:	0ea5e863          	bltu	a1,a0,8000a8fc <__memmove+0x108>
    8000a810:	00758713          	addi	a4,a1,7
    8000a814:	00a5e7b3          	or	a5,a1,a0
    8000a818:	40a70733          	sub	a4,a4,a0
    8000a81c:	0077f793          	andi	a5,a5,7
    8000a820:	00f73713          	sltiu	a4,a4,15
    8000a824:	00174713          	xori	a4,a4,1
    8000a828:	0017b793          	seqz	a5,a5
    8000a82c:	00e7f7b3          	and	a5,a5,a4
    8000a830:	10078863          	beqz	a5,8000a940 <__memmove+0x14c>
    8000a834:	00900793          	li	a5,9
    8000a838:	1107f463          	bgeu	a5,a6,8000a940 <__memmove+0x14c>
    8000a83c:	0036581b          	srliw	a6,a2,0x3
    8000a840:	fff8081b          	addiw	a6,a6,-1
    8000a844:	02081813          	slli	a6,a6,0x20
    8000a848:	01d85893          	srli	a7,a6,0x1d
    8000a84c:	00858813          	addi	a6,a1,8
    8000a850:	00058793          	mv	a5,a1
    8000a854:	00050713          	mv	a4,a0
    8000a858:	01088833          	add	a6,a7,a6
    8000a85c:	0007b883          	ld	a7,0(a5)
    8000a860:	00878793          	addi	a5,a5,8
    8000a864:	00870713          	addi	a4,a4,8
    8000a868:	ff173c23          	sd	a7,-8(a4)
    8000a86c:	ff0798e3          	bne	a5,a6,8000a85c <__memmove+0x68>
    8000a870:	ff867713          	andi	a4,a2,-8
    8000a874:	02071793          	slli	a5,a4,0x20
    8000a878:	0207d793          	srli	a5,a5,0x20
    8000a87c:	00f585b3          	add	a1,a1,a5
    8000a880:	40e686bb          	subw	a3,a3,a4
    8000a884:	00f507b3          	add	a5,a0,a5
    8000a888:	06e60463          	beq	a2,a4,8000a8f0 <__memmove+0xfc>
    8000a88c:	0005c703          	lbu	a4,0(a1)
    8000a890:	00e78023          	sb	a4,0(a5)
    8000a894:	04068e63          	beqz	a3,8000a8f0 <__memmove+0xfc>
    8000a898:	0015c603          	lbu	a2,1(a1)
    8000a89c:	00100713          	li	a4,1
    8000a8a0:	00c780a3          	sb	a2,1(a5)
    8000a8a4:	04e68663          	beq	a3,a4,8000a8f0 <__memmove+0xfc>
    8000a8a8:	0025c603          	lbu	a2,2(a1)
    8000a8ac:	00200713          	li	a4,2
    8000a8b0:	00c78123          	sb	a2,2(a5)
    8000a8b4:	02e68e63          	beq	a3,a4,8000a8f0 <__memmove+0xfc>
    8000a8b8:	0035c603          	lbu	a2,3(a1)
    8000a8bc:	00300713          	li	a4,3
    8000a8c0:	00c781a3          	sb	a2,3(a5)
    8000a8c4:	02e68663          	beq	a3,a4,8000a8f0 <__memmove+0xfc>
    8000a8c8:	0045c603          	lbu	a2,4(a1)
    8000a8cc:	00400713          	li	a4,4
    8000a8d0:	00c78223          	sb	a2,4(a5)
    8000a8d4:	00e68e63          	beq	a3,a4,8000a8f0 <__memmove+0xfc>
    8000a8d8:	0055c603          	lbu	a2,5(a1)
    8000a8dc:	00500713          	li	a4,5
    8000a8e0:	00c782a3          	sb	a2,5(a5)
    8000a8e4:	00e68663          	beq	a3,a4,8000a8f0 <__memmove+0xfc>
    8000a8e8:	0065c703          	lbu	a4,6(a1)
    8000a8ec:	00e78323          	sb	a4,6(a5)
    8000a8f0:	00813403          	ld	s0,8(sp)
    8000a8f4:	01010113          	addi	sp,sp,16
    8000a8f8:	00008067          	ret
    8000a8fc:	02061713          	slli	a4,a2,0x20
    8000a900:	02075713          	srli	a4,a4,0x20
    8000a904:	00e587b3          	add	a5,a1,a4
    8000a908:	f0f574e3          	bgeu	a0,a5,8000a810 <__memmove+0x1c>
    8000a90c:	02069613          	slli	a2,a3,0x20
    8000a910:	02065613          	srli	a2,a2,0x20
    8000a914:	fff64613          	not	a2,a2
    8000a918:	00e50733          	add	a4,a0,a4
    8000a91c:	00c78633          	add	a2,a5,a2
    8000a920:	fff7c683          	lbu	a3,-1(a5)
    8000a924:	fff78793          	addi	a5,a5,-1
    8000a928:	fff70713          	addi	a4,a4,-1
    8000a92c:	00d70023          	sb	a3,0(a4)
    8000a930:	fec798e3          	bne	a5,a2,8000a920 <__memmove+0x12c>
    8000a934:	00813403          	ld	s0,8(sp)
    8000a938:	01010113          	addi	sp,sp,16
    8000a93c:	00008067          	ret
    8000a940:	02069713          	slli	a4,a3,0x20
    8000a944:	02075713          	srli	a4,a4,0x20
    8000a948:	00170713          	addi	a4,a4,1
    8000a94c:	00e50733          	add	a4,a0,a4
    8000a950:	00050793          	mv	a5,a0
    8000a954:	0005c683          	lbu	a3,0(a1)
    8000a958:	00178793          	addi	a5,a5,1
    8000a95c:	00158593          	addi	a1,a1,1
    8000a960:	fed78fa3          	sb	a3,-1(a5)
    8000a964:	fee798e3          	bne	a5,a4,8000a954 <__memmove+0x160>
    8000a968:	f89ff06f          	j	8000a8f0 <__memmove+0xfc>
	...
