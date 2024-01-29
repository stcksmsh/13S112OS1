
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000e117          	auipc	sp,0xe
    80000004:	05813103          	ld	sp,88(sp) # 8000e058 <_GLOBAL_OFFSET_TABLE_+0x30>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	4b8080ef          	jal	ra,800084d4 <start>

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
    8000107c:	244030ef          	jal	ra,800042c0 <exceptionHandler>


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
    80001160:	cb478793          	addi	a5,a5,-844 # 8000de10 <_ZTV6Thread+0x10>
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
    80001198:	ca478793          	addi	a5,a5,-860 # 8000de38 <_ZTV9Semaphore+0x10>
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
    8000129c:	b7878793          	addi	a5,a5,-1160 # 8000de10 <_ZTV6Thread+0x10>
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
    800013b0:	a6478793          	addi	a5,a5,-1436 # 8000de10 <_ZTV6Thread+0x10>
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
    800013e8:	a5478793          	addi	a5,a5,-1452 # 8000de38 <_ZTV9Semaphore+0x10>
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
    800014a8:	9b478793          	addi	a5,a5,-1612 # 8000de58 <_ZTV14PeriodicThread+0x10>
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
    80001568:	8f478793          	addi	a5,a5,-1804 # 8000de58 <_ZTV14PeriodicThread+0x10>
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
    800015a4:	8b878793          	addi	a5,a5,-1864 # 8000de58 <_ZTV14PeriodicThread+0x10>
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
    800015f0:	ad47b783          	ld	a5,-1324(a5) # 8000e0c0 <_ZN5Timer8instanceE>
    800015f4:	02079463          	bnez	a5,8000161c <_ZN5TimerC1Ev+0x48>
    instance = this;
    800015f8:	0000d797          	auipc	a5,0xd
    800015fc:	ac97b423          	sd	s1,-1336(a5) # 8000e0c0 <_ZN5Timer8instanceE>
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
    80001668:	9ec7b783          	ld	a5,-1556(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000166c:	0007b503          	ld	a0,0(a5)
    80001670:	00002097          	auipc	ra,0x2
    80001674:	76c080e7          	jalr	1900(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
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
    8000169c:	a287b783          	ld	a5,-1496(a5) # 8000e0c0 <_ZN5Timer8instanceE>
    800016a0:	00078863          	beqz	a5,800016b0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    800016a4:	0000d517          	auipc	a0,0xd
    800016a8:	a1c53503          	ld	a0,-1508(a0) # 8000e0c0 <_ZN5Timer8instanceE>
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
    800016e8:	9dc53503          	ld	a0,-1572(a0) # 8000e0c0 <_ZN5Timer8instanceE>
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
    80001744:	950080e7          	jalr	-1712(ra) # 80003090 <_ZN7_thread11setSleepingEb>
        Scheduler::put(sleepingHead->thread);
    80001748:	0004b783          	ld	a5,0(s1)
    8000174c:	0007b503          	ld	a0,0(a5)
    80001750:	00003097          	auipc	ra,0x3
    80001754:	270080e7          	jalr	624(ra) # 800049c0 <_ZN9Scheduler3putEP7_thread>
        threadSleepWrapper* next = sleepingHead->next;
    80001758:	0004b583          	ld	a1,0(s1)
    8000175c:	0105b903          	ld	s2,16(a1)
        HeapManager::getInstance().heapFree(sleepingHead);
    80001760:	0000d797          	auipc	a5,0xd
    80001764:	8f07b783          	ld	a5,-1808(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001768:	0007b503          	ld	a0,0(a5)
    8000176c:	00002097          	auipc	ra,0x2
    80001770:	670080e7          	jalr	1648(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
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
    800017bc:	8b87b783          	ld	a5,-1864(a5) # 8000e070 <_GLOBAL_OFFSET_TABLE_+0x48>
    800017c0:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)HeapManager::getInstance().heapAllocate(sizeof(threadSleepWrapper));
    800017c4:	01800593          	li	a1,24
    800017c8:	0000d797          	auipc	a5,0xd
    800017cc:	8887b783          	ld	a5,-1912(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017d0:	0007b503          	ld	a0,0(a5)
    800017d4:	00002097          	auipc	ra,0x2
    800017d8:	fb0080e7          	jalr	-80(ra) # 80003784 <_ZN11HeapManager12heapAllocateEm>
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
    80001828:	86c080e7          	jalr	-1940(ra) # 80003090 <_ZN7_thread11setSleepingEb>
    _thread::dispatch();
    8000182c:	00002097          	auipc	ra,0x2
    80001830:	930080e7          	jalr	-1744(ra) # 8000315c <_ZN7_thread8dispatchEv>
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
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80001928:	00001537          	lui	a0,0x1
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
#include "assert.h"
#include "sched.h"
#include "heapManager.h"
#include "thread.h"

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
    80001b3c:	5187b783          	ld	a5,1304(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001b40:	0007b503          	ld	a0,0(a5)
    80001b44:	00002097          	auipc	ra,0x2
    80001b48:	c40080e7          	jalr	-960(ra) # 80003784 <_ZN11HeapManager12heapAllocateEm>
    80001b4c:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    80001b50:	00053023          	sd	zero,0(a0) # 1000 <_entry-0x7ffff000>
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
    80001ba8:	4c0080e7          	jalr	1216(ra) # 80003064 <_ZN7_thread9setClosedEb>
        HeapManager::getInstance().heapFree(id->blockHead);
    80001bac:	0004b583          	ld	a1,0(s1)
    80001bb0:	0000c797          	auipc	a5,0xc
    80001bb4:	4a07b783          	ld	a5,1184(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001bb8:	0007b503          	ld	a0,0(a5)
    80001bbc:	00002097          	auipc	ra,0x2
    80001bc0:	220080e7          	jalr	544(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
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
    80001c20:	4347b783          	ld	a5,1076(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c24:	0007b503          	ld	a0,0(a5)
    80001c28:	00002097          	auipc	ra,0x2
    80001c2c:	b5c080e7          	jalr	-1188(ra) # 80003784 <_ZN11HeapManager12heapAllocateEm>
        pNewBlock->pThread = _thread::currentThread;
    80001c30:	0000c797          	auipc	a5,0xc
    80001c34:	4407b783          	ld	a5,1088(a5) # 8000e070 <_GLOBAL_OFFSET_TABLE_+0x48>
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
    80001c60:	4147b783          	ld	a5,1044(a5) # 8000e070 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001c64:	0007b503          	ld	a0,0(a5)
    80001c68:	00001097          	auipc	ra,0x1
    80001c6c:	3cc080e7          	jalr	972(ra) # 80003034 <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    80001c70:	00001097          	auipc	ra,0x1
    80001c74:	4ec080e7          	jalr	1260(ra) # 8000315c <_ZN7_thread8dispatchEv>
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
    80001ce0:	358080e7          	jalr	856(ra) # 80003034 <_ZN7_thread10setBlockedEb>
        HeapManager::getInstance().heapFree(pUnblock);
    80001ce4:	00048593          	mv	a1,s1
    80001ce8:	0000c797          	auipc	a5,0xc
    80001cec:	3687b783          	ld	a5,872(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001cf0:	0007b503          	ld	a0,0(a5)
    80001cf4:	00002097          	auipc	ra,0x2
    80001cf8:	0e8080e7          	jalr	232(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    80001cfc:	0004b503          	ld	a0,0(s1)
    80001d00:	00003097          	auipc	ra,0x3
    80001d04:	cc0080e7          	jalr	-832(ra) # 800049c0 <_ZN9Scheduler3putEP7_thread>
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
    80001d24:	d7010113          	addi	sp,sp,-656
    80001d28:	28113423          	sd	ra,648(sp)
    80001d2c:	28813023          	sd	s0,640(sp)
    80001d30:	26913c23          	sd	s1,632(sp)
    80001d34:	29010413          	addi	s0,sp,656
    Kernel kernel = Kernel();
    80001d38:	d7040493          	addi	s1,s0,-656
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
    80001fe0:	1f0080e7          	jalr	496(ra) # 800041cc <_ZN14ConsoleManager13outputHandlerEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001fe4:	02049263          	bnez	s1,80002008 <main+0x2e4>
    Kernel kernel = Kernel();
    80001fe8:	d7040513          	addi	a0,s0,-656
    80001fec:	00000097          	auipc	ra,0x0
    80001ff0:	060080e7          	jalr	96(ra) # 8000204c <_ZN6KernelD1Ev>
    80001ff4:	28813083          	ld	ra,648(sp)
    80001ff8:	28013403          	ld	s0,640(sp)
    80001ffc:	27813483          	ld	s1,632(sp)
    80002000:	29010113          	addi	sp,sp,656
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
    80002034:	d7040513          	addi	a0,s0,-656
    80002038:	00000097          	auipc	ra,0x0
    8000203c:	014080e7          	jalr	20(ra) # 8000204c <_ZN6KernelD1Ev>
    80002040:	00048513          	mv	a0,s1
    80002044:	0000d097          	auipc	ra,0xd
    80002048:	1d4080e7          	jalr	468(ra) # 8000f218 <_Unwind_Resume>

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
    8000206c:	edc080e7          	jalr	-292(ra) # 80003f44 <_ZN14ConsoleManagerD1Ev>
    80002070:	01848513          	addi	a0,s1,24
    80002074:	fffff097          	auipc	ra,0xfffff
    80002078:	5d0080e7          	jalr	1488(ra) # 80001644 <_ZN5TimerD1Ev>
    8000207c:	00048513          	mv	a0,s1
    80002080:	00001097          	auipc	ra,0x1
    80002084:	470080e7          	jalr	1136(ra) # 800034f0 <_ZN11HeapManagerD1Ev>
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
    800023dc:	420080e7          	jalr	1056(ra) # 800077f8 <_Z8userMainv>
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
    80002404:	dcc080e7          	jalr	-564(ra) # 800041cc <_ZN14ConsoleManager13outputHandlerEv>
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
    8000243c:	050080e7          	jalr	80(ra) # 80003488 <_ZN11HeapManagerC1Ev>
    80002440:	00848513          	addi	a0,s1,8
    80002444:	00002097          	auipc	ra,0x2
    80002448:	4e4080e7          	jalr	1252(ra) # 80004928 <_ZN9SchedulerC1Ev>
    8000244c:	01848913          	addi	s2,s1,24
    80002450:	00090513          	mv	a0,s2
    80002454:	fffff097          	auipc	ra,0xfffff
    80002458:	180080e7          	jalr	384(ra) # 800015d4 <_ZN5TimerC1Ev>
    8000245c:	02848513          	addi	a0,s1,40
    80002460:	00002097          	auipc	ra,0x2
    80002464:	a28080e7          	jalr	-1496(ra) # 80003e88 <_ZN14ConsoleManagerC1Ev>
    80002468:	0380006f          	j	800024a0 <_ZN6KernelC1Ev+0x88>
    8000246c:	00050993          	mv	s3,a0
    80002470:	00090513          	mv	a0,s2
    80002474:	fffff097          	auipc	ra,0xfffff
    80002478:	1d0080e7          	jalr	464(ra) # 80001644 <_ZN5TimerD1Ev>
    8000247c:	00098913          	mv	s2,s3
    80002480:	00048513          	mv	a0,s1
    80002484:	00001097          	auipc	ra,0x1
    80002488:	06c080e7          	jalr	108(ra) # 800034f0 <_ZN11HeapManagerD1Ev>
    8000248c:	00090513          	mv	a0,s2
    80002490:	0000d097          	auipc	ra,0xd
    80002494:	d88080e7          	jalr	-632(ra) # 8000f218 <_Unwind_Resume>
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
    800024d0:	b947b783          	ld	a5,-1132(a5) # 8000e060 <_GLOBAL_OFFSET_TABLE_+0x38>
    800024d4:	10579073          	csrw	stvec,a5
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );
    800024d8:	0000c797          	auipc	a5,0xc
    800024dc:	b907b783          	ld	a5,-1136(a5) # 8000e068 <_GLOBAL_OFFSET_TABLE_+0x40>
    800024e0:	0007b603          	ld	a2,0(a5)
    800024e4:	0000c797          	auipc	a5,0xc
    800024e8:	b5c7b783          	ld	a5,-1188(a5) # 8000e040 <_GLOBAL_OFFSET_TABLE_+0x18>
    800024ec:	0007b583          	ld	a1,0(a5)
    800024f0:	00001097          	auipc	ra,0x1
    800024f4:	018080e7          	jalr	24(ra) # 80003508 <_ZN11HeapManager4initEmm>
    console.getInstance().init();
    800024f8:	00002097          	auipc	ra,0x2
    800024fc:	900080e7          	jalr	-1792(ra) # 80003df8 <_ZN14ConsoleManager11getInstanceEv>
    80002500:	00002097          	auipc	ra,0x2
    80002504:	ab4080e7          	jalr	-1356(ra) # 80003fb4 <_ZN14ConsoleManager4initEv>
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
    8000253c:	00002097          	auipc	ra,0x2
    80002540:	68c080e7          	jalr	1676(ra) # 80004bc8 <_ZN9Scheduler3getEv>
    80002544:	0000c797          	auipc	a5,0xc
    80002548:	b2c7b783          	ld	a5,-1236(a5) # 8000e070 <_GLOBAL_OFFSET_TABLE_+0x48>
    8000254c:	00a7b023          	sd	a0,0(a5)


    thread_t consoleThread;
    thread_create(&consoleThread, consoleConsumer, 0);
    80002550:	00000613          	li	a2,0
    80002554:	00000597          	auipc	a1,0x0
    80002558:	e9c58593          	addi	a1,a1,-356 # 800023f0 <_Z15consoleConsumerPv>
    8000255c:	fe040513          	addi	a0,s0,-32
    80002560:	fffff097          	auipc	ra,0xfffff
    80002564:	3a0080e7          	jalr	928(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>

    // __asm__ volatile ("li a0, 0xff");
    // __asm__ volatile ("ecall");

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
    80002594:	09c7a783          	lw	a5,156(a5)
    80002598:	0087f793          	andi	a5,a5,8
    8000259c:	00079863          	bnez	a5,800025ac <_ZN6Kernel3runEv+0x94>
        thread_dispatch();
    800025a0:	fffff097          	auipc	ra,0xfffff
    800025a4:	3fc080e7          	jalr	1020(ra) # 8000199c <_Z15thread_dispatchv>
    800025a8:	fe9ff06f          	j	80002590 <_ZN6Kernel3runEv+0x78>
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
    800025ec:	ae074703          	lbu	a4,-1312(a4) # 8000e0c8 <c>
    800025f0:	07300793          	li	a5,115
    800025f4:	02f71e63          	bne	a4,a5,80002630 <_Z13thread_test_1Pv+0x70>
    putc('1');
    800025f8:	03100513          	li	a0,49
    800025fc:	fffff097          	auipc	ra,0xfffff
    80002600:	4f4080e7          	jalr	1268(ra) # 80001af0 <_Z4putcc>
    if(c == 's')sem_signal(sem1);
    80002604:	0000c717          	auipc	a4,0xc
    80002608:	ac474703          	lbu	a4,-1340(a4) # 8000e0c8 <c>
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
    80002644:	a9053503          	ld	a0,-1392(a0) # 8000e0d0 <sem1>
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
    80002680:	a4c74703          	lbu	a4,-1460(a4) # 8000e0c8 <c>
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
    800026a8:	a2474703          	lbu	a4,-1500(a4) # 8000e0c8 <c>
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
    800026d8:	a0453503          	ld	a0,-1532(a0) # 8000e0d8 <sem2>
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
    8000270c:	9487b783          	ld	a5,-1720(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002710:	0007b503          	ld	a0,0(a5)
    80002714:	00001097          	auipc	ra,0x1
    80002718:	f18080e7          	jalr	-232(ra) # 8000362c <_ZN11HeapManager17getHeapFreeMemoryEv>
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
    80002904:	7507b783          	ld	a5,1872(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002908:	0007b503          	ld	a0,0(a5)
    8000290c:	00001097          	auipc	ra,0x1
    80002910:	d20080e7          	jalr	-736(ra) # 8000362c <_ZN11HeapManager17getHeapFreeMemoryEv>
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
    80002b24:	5a848493          	addi	s1,s1,1448 # 8000e0c8 <c>
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
    80002b7c:	55074703          	lbu	a4,1360(a4) # 8000e0c8 <c>
    80002b80:	07300793          	li	a5,115
    80002b84:	08f71263          	bne	a4,a5,80002c08 <_Z8usermainPv+0x108>
    putc('4');
    80002b88:	03400513          	li	a0,52
    80002b8c:	fffff097          	auipc	ra,0xfffff
    80002b90:	f64080e7          	jalr	-156(ra) # 80001af0 <_Z4putcc>
    if(c != 's')thread_join(t1);
    80002b94:	0000b717          	auipc	a4,0xb
    80002b98:	53474703          	lbu	a4,1332(a4) # 8000e0c8 <c>
    80002b9c:	07300793          	li	a5,115
    80002ba0:	06f71c63          	bne	a4,a5,80002c18 <_Z8usermainPv+0x118>
    if(c == 's')sem_wait(sem2);
    80002ba4:	0000b717          	auipc	a4,0xb
    80002ba8:	52474703          	lbu	a4,1316(a4) # 8000e0c8 <c>
    80002bac:	07300793          	li	a5,115
    80002bb0:	06f70c63          	beq	a4,a5,80002c28 <_Z8usermainPv+0x128>
    putc('5');
    80002bb4:	03500513          	li	a0,53
    80002bb8:	fffff097          	auipc	ra,0xfffff
    80002bbc:	f38080e7          	jalr	-200(ra) # 80001af0 <_Z4putcc>
    if(c == 's')sem_close(sem1);
    80002bc0:	0000b717          	auipc	a4,0xb
    80002bc4:	50874703          	lbu	a4,1288(a4) # 8000e0c8 <c>
    80002bc8:	07300793          	li	a5,115
    80002bcc:	06f70863          	beq	a4,a5,80002c3c <_Z8usermainPv+0x13c>
    if(c == 's')sem_close(sem2);
    80002bd0:	0000b717          	auipc	a4,0xb
    80002bd4:	4f874703          	lbu	a4,1272(a4) # 8000e0c8 <c>
    80002bd8:	07300793          	li	a5,115
    80002bdc:	06f70a63          	beq	a4,a5,80002c50 <_Z8usermainPv+0x150>
    80002be0:	02813083          	ld	ra,40(sp)
    80002be4:	02013403          	ld	s0,32(sp)
    80002be8:	01813483          	ld	s1,24(sp)
    80002bec:	03010113          	addi	sp,sp,48
    80002bf0:	00008067          	ret
    if(c == 's')sem_wait(sem1);
    80002bf4:	0000b517          	auipc	a0,0xb
    80002bf8:	4dc53503          	ld	a0,1244(a0) # 8000e0d0 <sem1>
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
    80002c2c:	4b053503          	ld	a0,1200(a0) # 8000e0d8 <sem2>
    80002c30:	fffff097          	auipc	ra,0xfffff
    80002c34:	e40080e7          	jalr	-448(ra) # 80001a70 <_Z8sem_waitP4_sem>
    80002c38:	f7dff06f          	j	80002bb4 <_Z8usermainPv+0xb4>
    if(c == 's')sem_close(sem1);
    80002c3c:	0000b517          	auipc	a0,0xb
    80002c40:	49453503          	ld	a0,1172(a0) # 8000e0d0 <sem1>
    80002c44:	fffff097          	auipc	ra,0xfffff
    80002c48:	e00080e7          	jalr	-512(ra) # 80001a44 <_Z9sem_closeP4_sem>
    80002c4c:	f85ff06f          	j	80002bd0 <_Z8usermainPv+0xd0>
    if(c == 's')sem_close(sem2);
    80002c50:	0000b517          	auipc	a0,0xb
    80002c54:	48853503          	ld	a0,1160(a0) # 8000e0d8 <sem2>
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
    80002c70:	00053023          	sd	zero,0(a0)
    80002c74:	00053423          	sd	zero,8(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80002c78:	0000b717          	auipc	a4,0xb
    80002c7c:	46870713          	addi	a4,a4,1128 # 8000e0e0 <_ZN7_thread6nextIDE>
    80002c80:	00072783          	lw	a5,0(a4)
    80002c84:	0017869b          	addiw	a3,a5,1
    80002c88:	00d72023          	sw	a3,0(a4)
    80002c8c:	08f52c23          	sw	a5,152(a0)
    closed = 0;
    80002c90:	09c52783          	lw	a5,156(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002c94:	0015b593          	seqz	a1,a1
    80002c98:	0045959b          	slliw	a1,a1,0x4
    80002c9c:	fe07f793          	andi	a5,a5,-32
    80002ca0:	00b7e7b3          	or	a5,a5,a1
    80002ca4:	08f52e23          	sw	a5,156(a0)
    reserved = 0;
    80002ca8:	0a052783          	lw	a5,160(a0)
    80002cac:	f0000737          	lui	a4,0xf0000
    80002cb0:	00e7f7b3          	and	a5,a5,a4
    80002cb4:	0af52023          	sw	a5,160(a0)
    joinHead = 0;
    80002cb8:	06053c23          	sd	zero,120(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    80002cbc:	00200793          	li	a5,2
    80002cc0:	08f53423          	sd	a5,136(a0)
    stackStart = 0;
    80002cc4:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    80002cc8:	00053823          	sd	zero,16(a0)
    context.s1 = 0;
    80002ccc:	00053c23          	sd	zero,24(a0)
    context.s2 = 0;
    80002cd0:	02053023          	sd	zero,32(a0)
    context.s3 = 0;
    80002cd4:	02053423          	sd	zero,40(a0)
    context.s4 = 0;
    80002cd8:	02053823          	sd	zero,48(a0)
    context.s5 = 0;
    80002cdc:	02053c23          	sd	zero,56(a0)
    context.s6 = 0;
    80002ce0:	04053023          	sd	zero,64(a0)
    context.s7 = 0;
    80002ce4:	04053423          	sd	zero,72(a0)
    context.s8 = 0;
    80002ce8:	04053823          	sd	zero,80(a0)
    context.s9 = 0;
    80002cec:	04053c23          	sd	zero,88(a0)
    context.s10 = 0;
    80002cf0:	06053023          	sd	zero,96(a0)
    context.s11 = 0;
    80002cf4:	06053423          	sd	zero,104(a0)

    context.sstatus = 0;
    80002cf8:	06053823          	sd	zero,112(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002cfc:	00000797          	auipc	a5,0x0
    80002d00:	73078793          	addi	a5,a5,1840 # 8000342c <_ZN7_thread7wrapperEv>
    80002d04:	00f53023          	sd	a5,0(a0)
}
    80002d08:	00813403          	ld	s0,8(sp)
    80002d0c:	01010113          	addi	sp,sp,16
    80002d10:	00008067          	ret

0000000080002d14 <_Z10popSppSpiev>:

void popSppSpie(){
    80002d14:	ff010113          	addi	sp,sp,-16
    80002d18:	00813423          	sd	s0,8(sp)
    80002d1c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002d20:	14109073          	csrw	sepc,ra
    __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002d24:	10000793          	li	a5,256
    80002d28:	1007b073          	csrc	sstatus,a5
    __asm__ volatile ("sret");
    80002d2c:	10200073          	sret
}
    80002d30:	00813403          	ld	s0,8(sp)
    80002d34:	01010113          	addi	sp,sp,16
    80002d38:	00008067          	ret

0000000080002d3c <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002d3c:	fe010113          	addi	sp,sp,-32
    80002d40:	00113c23          	sd	ra,24(sp)
    80002d44:	00813823          	sd	s0,16(sp)
    80002d48:	00913423          	sd	s1,8(sp)
    80002d4c:	01213023          	sd	s2,0(sp)
    80002d50:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80002d54:	07853483          	ld	s1,120(a0)
    while(current != 0){
    80002d58:	0e048463          	beqz	s1,80002e40 <_ZN7_thread6unJoinEv+0x104>
        thread_t thread = current->thread;
    80002d5c:	0004c503          	lbu	a0,0(s1)
    80002d60:	0014c783          	lbu	a5,1(s1)
    80002d64:	00879793          	slli	a5,a5,0x8
    80002d68:	00a7e7b3          	or	a5,a5,a0
    80002d6c:	0024c503          	lbu	a0,2(s1)
    80002d70:	01051513          	slli	a0,a0,0x10
    80002d74:	00f567b3          	or	a5,a0,a5
    80002d78:	0034c503          	lbu	a0,3(s1)
    80002d7c:	01851513          	slli	a0,a0,0x18
    80002d80:	00f56533          	or	a0,a0,a5
    80002d84:	0044c783          	lbu	a5,4(s1)
    80002d88:	02079793          	slli	a5,a5,0x20
    80002d8c:	00a7e533          	or	a0,a5,a0
    80002d90:	0054c783          	lbu	a5,5(s1)
    80002d94:	02879793          	slli	a5,a5,0x28
    80002d98:	00a7e7b3          	or	a5,a5,a0
    80002d9c:	0064c503          	lbu	a0,6(s1)
    80002da0:	03051513          	slli	a0,a0,0x30
    80002da4:	00f567b3          	or	a5,a0,a5
    80002da8:	0074c503          	lbu	a0,7(s1)
    80002dac:	03851513          	slli	a0,a0,0x38
    80002db0:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80002db4:	09c52783          	lw	a5,156(a0)
    80002db8:	ffd7f793          	andi	a5,a5,-3
    80002dbc:	08f52e23          	sw	a5,156(a0)
        Scheduler::put(thread);
    80002dc0:	00002097          	auipc	ra,0x2
    80002dc4:	c00080e7          	jalr	-1024(ra) # 800049c0 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80002dc8:	0084c903          	lbu	s2,8(s1)
    80002dcc:	0094c783          	lbu	a5,9(s1)
    80002dd0:	00879793          	slli	a5,a5,0x8
    80002dd4:	0127e7b3          	or	a5,a5,s2
    80002dd8:	00a4c903          	lbu	s2,10(s1)
    80002ddc:	01091913          	slli	s2,s2,0x10
    80002de0:	00f967b3          	or	a5,s2,a5
    80002de4:	00b4c903          	lbu	s2,11(s1)
    80002de8:	01891913          	slli	s2,s2,0x18
    80002dec:	00f96933          	or	s2,s2,a5
    80002df0:	00c4c783          	lbu	a5,12(s1)
    80002df4:	02079793          	slli	a5,a5,0x20
    80002df8:	0127e933          	or	s2,a5,s2
    80002dfc:	00d4c783          	lbu	a5,13(s1)
    80002e00:	02879793          	slli	a5,a5,0x28
    80002e04:	0127e7b3          	or	a5,a5,s2
    80002e08:	00e4c903          	lbu	s2,14(s1)
    80002e0c:	03091913          	slli	s2,s2,0x30
    80002e10:	00f967b3          	or	a5,s2,a5
    80002e14:	00f4c903          	lbu	s2,15(s1)
    80002e18:	03891913          	slli	s2,s2,0x38
    80002e1c:	00f96933          	or	s2,s2,a5
        HeapManager::getInstance().heapFree(current);
    80002e20:	00048593          	mv	a1,s1
    80002e24:	0000b797          	auipc	a5,0xb
    80002e28:	22c7b783          	ld	a5,556(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002e2c:	0007b503          	ld	a0,0(a5)
    80002e30:	00001097          	auipc	ra,0x1
    80002e34:	fac080e7          	jalr	-84(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
        current = next;
    80002e38:	00090493          	mv	s1,s2
    while(current != 0){
    80002e3c:	f1dff06f          	j	80002d58 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80002e40:	01813083          	ld	ra,24(sp)
    80002e44:	01013403          	ld	s0,16(sp)
    80002e48:	00813483          	ld	s1,8(sp)
    80002e4c:	00013903          	ld	s2,0(sp)
    80002e50:	02010113          	addi	sp,sp,32
    80002e54:	00008067          	ret

0000000080002e58 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80002e58:	fc010113          	addi	sp,sp,-64
    80002e5c:	02113c23          	sd	ra,56(sp)
    80002e60:	02813823          	sd	s0,48(sp)
    80002e64:	02913423          	sd	s1,40(sp)
    80002e68:	03213023          	sd	s2,32(sp)
    80002e6c:	01313c23          	sd	s3,24(sp)
    80002e70:	01413823          	sd	s4,16(sp)
    80002e74:	01513423          	sd	s5,8(sp)
    80002e78:	04010413          	addi	s0,sp,64
    80002e7c:	00050493          	mv	s1,a0
    80002e80:	00058913          	mv	s2,a1
    80002e84:	00060a93          	mv	s5,a2
    80002e88:	00068993          	mv	s3,a3
    80002e8c:	00070a13          	mv	s4,a4

    *thread = (_thread*)HeapManager::getInstance().heapAllocate((sizeof(_thread) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80002e90:	00300593          	li	a1,3
    80002e94:	0000b797          	auipc	a5,0xb
    80002e98:	1bc7b783          	ld	a5,444(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002e9c:	0007b503          	ld	a0,0(a5)
    80002ea0:	00001097          	auipc	ra,0x1
    80002ea4:	8e4080e7          	jalr	-1820(ra) # 80003784 <_ZN11HeapManager12heapAllocateEm>
    80002ea8:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80002eac:	18050063          	beqz	a0,8000302c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1d4>
        return -1;
    }
    (*thread)->function = function;
    80002eb0:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    80002eb4:	0004b783          	ld	a5,0(s1)
    80002eb8:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80002ebc:	0000b717          	auipc	a4,0xb
    80002ec0:	22470713          	addi	a4,a4,548 # 8000e0e0 <_ZN7_thread6nextIDE>
    80002ec4:	00072783          	lw	a5,0(a4)
    80002ec8:	0017869b          	addiw	a3,a5,1
    80002ecc:	00d72023          	sw	a3,0(a4)
    80002ed0:	0004b703          	ld	a4,0(s1)
    80002ed4:	08f72c23          	sw	a5,152(a4)
    (*thread)->closed = false;
    80002ed8:	0004b703          	ld	a4,0(s1)
    80002edc:	09c72783          	lw	a5,156(a4)
    80002ee0:	ffe7f793          	andi	a5,a5,-2
    80002ee4:	08f72e23          	sw	a5,156(a4)
    (*thread)->blocked = false;
    80002ee8:	0004b703          	ld	a4,0(s1)
    80002eec:	09c72783          	lw	a5,156(a4)
    80002ef0:	ffd7f793          	andi	a5,a5,-3
    80002ef4:	08f72e23          	sw	a5,156(a4)
    (*thread)->sleeping = false;
    80002ef8:	0004b703          	ld	a4,0(s1)
    80002efc:	09c72783          	lw	a5,156(a4)
    80002f00:	ffb7f793          	andi	a5,a5,-5
    80002f04:	08f72e23          	sw	a5,156(a4)
    (*thread)->finished = false;
    80002f08:	0004b703          	ld	a4,0(s1)
    80002f0c:	09c72783          	lw	a5,156(a4)
    80002f10:	ff77f793          	andi	a5,a5,-9
    80002f14:	08f72e23          	sw	a5,156(a4)
    (*thread)->kernel = (function == 0);
    80002f18:	0004b703          	ld	a4,0(s1)
    80002f1c:	00193913          	seqz	s2,s2
    80002f20:	0049191b          	slliw	s2,s2,0x4
    80002f24:	09c72783          	lw	a5,156(a4)
    80002f28:	fef7f793          	andi	a5,a5,-17
    80002f2c:	0127e933          	or	s2,a5,s2
    80002f30:	09272e23          	sw	s2,156(a4)
    (*thread)->reserved = 0;
    80002f34:	0004b703          	ld	a4,0(s1)
    80002f38:	0a072783          	lw	a5,160(a4)
    80002f3c:	f00006b7          	lui	a3,0xf0000
    80002f40:	00d7f7b3          	and	a5,a5,a3
    80002f44:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = 0;
    80002f48:	0004b783          	ld	a5,0(s1)
    80002f4c:	0607bc23          	sd	zero,120(a5)
    (*thread)->joinTail = 0;
    80002f50:	0004b783          	ld	a5,0(s1)
    80002f54:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    80002f58:	0004b783          	ld	a5,0(s1)
    80002f5c:	00200713          	li	a4,2
    80002f60:	08e7b423          	sd	a4,136(a5)
    (*thread)->stackStart = 0;
    80002f64:	0004b783          	ld	a5,0(s1)
    80002f68:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    80002f6c:	0004b783          	ld	a5,0(s1)
    80002f70:	0007b823          	sd	zero,16(a5)
    (*thread)->context.s1 = 0;
    80002f74:	0004b783          	ld	a5,0(s1)
    80002f78:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s2 = 0;
    80002f7c:	0004b783          	ld	a5,0(s1)
    80002f80:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s3 = 0;
    80002f84:	0004b783          	ld	a5,0(s1)
    80002f88:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s4 = 0;
    80002f8c:	0004b783          	ld	a5,0(s1)
    80002f90:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s5 = 0;
    80002f94:	0004b783          	ld	a5,0(s1)
    80002f98:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s6 = 0;
    80002f9c:	0004b783          	ld	a5,0(s1)
    80002fa0:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s7 = 0;
    80002fa4:	0004b783          	ld	a5,0(s1)
    80002fa8:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s8 = 0;
    80002fac:	0004b783          	ld	a5,0(s1)
    80002fb0:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s9 = 0;
    80002fb4:	0004b783          	ld	a5,0(s1)
    80002fb8:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s10 = 0;
    80002fbc:	0004b783          	ld	a5,0(s1)
    80002fc0:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s11 = 0;
    80002fc4:	0004b783          	ld	a5,0(s1)
    80002fc8:	0607b423          	sd	zero,104(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80002fcc:	0004b783          	ld	a5,0(s1)
    80002fd0:	0137b423          	sd	s3,8(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80002fd4:	0004b783          	ld	a5,0(s1)
    80002fd8:	00000717          	auipc	a4,0x0
    80002fdc:	45470713          	addi	a4,a4,1108 # 8000342c <_ZN7_thread7wrapperEv>
    80002fe0:	00e7b023          	sd	a4,0(a5)

    (*thread)->stackStart = stack;
    80002fe4:	0004b783          	ld	a5,0(s1)
    80002fe8:	0937b823          	sd	s3,144(a5)
    if(start){
    80002fec:	020a1663          	bnez	s4,80003018 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c0>
        Scheduler::put(*thread);
    }
    return 0;
    80002ff0:	00000513          	li	a0,0
}
    80002ff4:	03813083          	ld	ra,56(sp)
    80002ff8:	03013403          	ld	s0,48(sp)
    80002ffc:	02813483          	ld	s1,40(sp)
    80003000:	02013903          	ld	s2,32(sp)
    80003004:	01813983          	ld	s3,24(sp)
    80003008:	01013a03          	ld	s4,16(sp)
    8000300c:	00813a83          	ld	s5,8(sp)
    80003010:	04010113          	addi	sp,sp,64
    80003014:	00008067          	ret
        Scheduler::put(*thread);
    80003018:	0004b503          	ld	a0,0(s1)
    8000301c:	00002097          	auipc	ra,0x2
    80003020:	9a4080e7          	jalr	-1628(ra) # 800049c0 <_ZN9Scheduler3putEP7_thread>
    return 0;
    80003024:	00000513          	li	a0,0
    80003028:	fcdff06f          	j	80002ff4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x19c>
        return -1;
    8000302c:	fff00513          	li	a0,-1
    80003030:	fc5ff06f          	j	80002ff4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x19c>

0000000080003034 <_ZN7_thread10setBlockedEb>:
    currentThread->finished = 1;
    dispatch();
    return 0;
}

void _thread::setBlocked(bool blocked){
    80003034:	ff010113          	addi	sp,sp,-16
    80003038:	00813423          	sd	s0,8(sp)
    8000303c:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80003040:	0015f593          	andi	a1,a1,1
    80003044:	0015979b          	slliw	a5,a1,0x1
    80003048:	09c52583          	lw	a1,156(a0)
    8000304c:	ffd5f593          	andi	a1,a1,-3
    80003050:	00f5e5b3          	or	a1,a1,a5
    80003054:	08b52e23          	sw	a1,156(a0)
}
    80003058:	00813403          	ld	s0,8(sp)
    8000305c:	01010113          	addi	sp,sp,16
    80003060:	00008067          	ret

0000000080003064 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80003064:	ff010113          	addi	sp,sp,-16
    80003068:	00813423          	sd	s0,8(sp)
    8000306c:	01010413          	addi	s0,sp,16
    this->closed = closed;
    80003070:	0015f793          	andi	a5,a1,1
    80003074:	09c52583          	lw	a1,156(a0)
    80003078:	ffe5f593          	andi	a1,a1,-2
    8000307c:	00f5e5b3          	or	a1,a1,a5
    80003080:	08b52e23          	sw	a1,156(a0)
}
    80003084:	00813403          	ld	s0,8(sp)
    80003088:	01010113          	addi	sp,sp,16
    8000308c:	00008067          	ret

0000000080003090 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    80003090:	ff010113          	addi	sp,sp,-16
    80003094:	00813423          	sd	s0,8(sp)
    80003098:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    8000309c:	0015f593          	andi	a1,a1,1
    800030a0:	0025979b          	slliw	a5,a1,0x2
    800030a4:	09c52583          	lw	a1,156(a0)
    800030a8:	ffb5f593          	andi	a1,a1,-5
    800030ac:	00f5e5b3          	or	a1,a1,a5
    800030b0:	08b52e23          	sw	a1,156(a0)
}
    800030b4:	00813403          	ld	s0,8(sp)
    800030b8:	01010113          	addi	sp,sp,16
    800030bc:	00008067          	ret

00000000800030c0 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
        Scheduler::put(oldThread);
    }
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    800030c0:	ff010113          	addi	sp,sp,-16
    800030c4:	00813423          	sd	s0,8(sp)
    800030c8:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    800030cc:	04050263          	beqz	a0,80003110 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    800030d0:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    800030d4:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    800030d8:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    800030dc:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    800030e0:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    800030e4:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    800030e8:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    800030ec:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    800030f0:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    800030f4:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    800030f8:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    800030fc:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    80003100:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    80003104:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80003108:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    8000310c:	06853823          	sd	s0,112(a0)
    }
    
    
    __asm__ volatile ("ld sp, 8(a1)");
    80003110:	0085b103          	ld	sp,8(a1)
    __asm__ volatile ("ld ra, 0(a1)");
    80003114:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    80003118:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    8000311c:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80003120:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    80003124:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80003128:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    8000312c:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80003130:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80003134:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80003138:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    8000313c:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    80003140:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    80003144:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    80003148:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    8000314c:	0685bd83          	ld	s11,104(a1)

    return;
}
    80003150:	00813403          	ld	s0,8(sp)
    80003154:	01010113          	addi	sp,sp,16
    80003158:	00008067          	ret

000000008000315c <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    8000315c:	fe010113          	addi	sp,sp,-32
    80003160:	00113c23          	sd	ra,24(sp)
    80003164:	00813823          	sd	s0,16(sp)
    80003168:	00913423          	sd	s1,8(sp)
    8000316c:	01213023          	sd	s2,0(sp)
    80003170:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    80003174:	0000b917          	auipc	s2,0xb
    80003178:	f6c90913          	addi	s2,s2,-148 # 8000e0e0 <_ZN7_thread6nextIDE>
    8000317c:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    80003180:	00002097          	auipc	ra,0x2
    80003184:	a48080e7          	jalr	-1464(ra) # 80004bc8 <_ZN9Scheduler3getEv>
    80003188:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    8000318c:	00200793          	li	a5,2
    80003190:	08f4b423          	sd	a5,136(s1)
    if(currentThread == 0){
    80003194:	04050463          	beqz	a0,800031dc <_ZN7_thread8dispatchEv+0x80>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80003198:	00048c63          	beqz	s1,800031b0 <_ZN7_thread8dispatchEv+0x54>
    8000319c:	0984b783          	ld	a5,152(s1)
    800031a0:	00f00713          	li	a4,15
    800031a4:	02071713          	slli	a4,a4,0x20
    800031a8:	00e7f7b3          	and	a5,a5,a4
    800031ac:	02078e63          	beqz	a5,800031e8 <_ZN7_thread8dispatchEv+0x8c>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    800031b0:	0000b597          	auipc	a1,0xb
    800031b4:	f385b583          	ld	a1,-200(a1) # 8000e0e8 <_ZN7_thread13currentThreadE>
    800031b8:	00048513          	mv	a0,s1
    800031bc:	00000097          	auipc	ra,0x0
    800031c0:	f04080e7          	jalr	-252(ra) # 800030c0 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    800031c4:	01813083          	ld	ra,24(sp)
    800031c8:	01013403          	ld	s0,16(sp)
    800031cc:	00813483          	ld	s1,8(sp)
    800031d0:	00013903          	ld	s2,0(sp)
    800031d4:	02010113          	addi	sp,sp,32
    800031d8:	00008067          	ret
        currentThread = oldThread;
    800031dc:	0000b797          	auipc	a5,0xb
    800031e0:	f097b623          	sd	s1,-244(a5) # 8000e0e8 <_ZN7_thread13currentThreadE>
        return;
    800031e4:	fe1ff06f          	j	800031c4 <_ZN7_thread8dispatchEv+0x68>
        Scheduler::put(oldThread);
    800031e8:	00048513          	mv	a0,s1
    800031ec:	00001097          	auipc	ra,0x1
    800031f0:	7d4080e7          	jalr	2004(ra) # 800049c0 <_ZN9Scheduler3putEP7_thread>
    800031f4:	fbdff06f          	j	800031b0 <_ZN7_thread8dispatchEv+0x54>

00000000800031f8 <_ZN7_thread4joinEPS_>:
    if(thread->finished || thread->closed){
    800031f8:	0985b783          	ld	a5,152(a1)
    800031fc:	00900713          	li	a4,9
    80003200:	02071713          	slli	a4,a4,0x20
    80003204:	00e7f7b3          	and	a5,a5,a4
    80003208:	00078463          	beqz	a5,80003210 <_ZN7_thread4joinEPS_+0x18>
    8000320c:	00008067          	ret
void _thread::join(thread_t thread){
    80003210:	fe010113          	addi	sp,sp,-32
    80003214:	00113c23          	sd	ra,24(sp)
    80003218:	00813823          	sd	s0,16(sp)
    8000321c:	00913423          	sd	s1,8(sp)
    80003220:	01213023          	sd	s2,0(sp)
    80003224:	02010413          	addi	s0,sp,32
    80003228:	00050493          	mv	s1,a0
    8000322c:	00058913          	mv	s2,a1
    ThreadJoinList* newJoin = (ThreadJoinList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadJoinList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80003230:	00100593          	li	a1,1
    80003234:	0000b797          	auipc	a5,0xb
    80003238:	e1c7b783          	ld	a5,-484(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000323c:	0007b503          	ld	a0,0(a5)
    80003240:	00000097          	auipc	ra,0x0
    80003244:	544080e7          	jalr	1348(ra) # 80003784 <_ZN11HeapManager12heapAllocateEm>
    this->blocked = true;
    80003248:	09c4a703          	lw	a4,156(s1)
    8000324c:	00276713          	ori	a4,a4,2
    80003250:	08e4ae23          	sw	a4,156(s1)
    newJoin->thread = this;
    80003254:	00950023          	sb	s1,0(a0)
    80003258:	0084d713          	srli	a4,s1,0x8
    8000325c:	00e500a3          	sb	a4,1(a0)
    80003260:	0104d713          	srli	a4,s1,0x10
    80003264:	00e50123          	sb	a4,2(a0)
    80003268:	0184d71b          	srliw	a4,s1,0x18
    8000326c:	00e501a3          	sb	a4,3(a0)
    80003270:	0204d713          	srli	a4,s1,0x20
    80003274:	00e50223          	sb	a4,4(a0)
    80003278:	0284d713          	srli	a4,s1,0x28
    8000327c:	00e502a3          	sb	a4,5(a0)
    80003280:	0304d713          	srli	a4,s1,0x30
    80003284:	00e50323          	sb	a4,6(a0)
    80003288:	0384d493          	srli	s1,s1,0x38
    8000328c:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80003290:	00050423          	sb	zero,8(a0)
    80003294:	000504a3          	sb	zero,9(a0)
    80003298:	00050523          	sb	zero,10(a0)
    8000329c:	000505a3          	sb	zero,11(a0)
    800032a0:	00050623          	sb	zero,12(a0)
    800032a4:	000506a3          	sb	zero,13(a0)
    800032a8:	00050723          	sb	zero,14(a0)
    800032ac:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    800032b0:	07893703          	ld	a4,120(s2)
    800032b4:	06070463          	beqz	a4,8000331c <_ZN7_thread4joinEPS_+0x124>
        thread->joinTail->next = newJoin;
    800032b8:	08093703          	ld	a4,128(s2)
    800032bc:	00a70423          	sb	a0,8(a4)
    800032c0:	00855693          	srli	a3,a0,0x8
    800032c4:	00d704a3          	sb	a3,9(a4)
    800032c8:	01055693          	srli	a3,a0,0x10
    800032cc:	00d70523          	sb	a3,10(a4)
    800032d0:	0185569b          	srliw	a3,a0,0x18
    800032d4:	00d705a3          	sb	a3,11(a4)
    800032d8:	02055693          	srli	a3,a0,0x20
    800032dc:	00d70623          	sb	a3,12(a4)
    800032e0:	02855693          	srli	a3,a0,0x28
    800032e4:	00d706a3          	sb	a3,13(a4)
    800032e8:	03055693          	srli	a3,a0,0x30
    800032ec:	00d70723          	sb	a3,14(a4)
    800032f0:	03855693          	srli	a3,a0,0x38
    800032f4:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    800032f8:	08a93023          	sd	a0,128(s2)
    dispatch();
    800032fc:	00000097          	auipc	ra,0x0
    80003300:	e60080e7          	jalr	-416(ra) # 8000315c <_ZN7_thread8dispatchEv>
}
    80003304:	01813083          	ld	ra,24(sp)
    80003308:	01013403          	ld	s0,16(sp)
    8000330c:	00813483          	ld	s1,8(sp)
    80003310:	00013903          	ld	s2,0(sp)
    80003314:	02010113          	addi	sp,sp,32
    80003318:	00008067          	ret
        thread->joinHead = newJoin;
    8000331c:	06a93c23          	sd	a0,120(s2)
        thread->joinTail = newJoin;
    80003320:	08a93023          	sd	a0,128(s2)
    80003324:	fd9ff06f          	j	800032fc <_ZN7_thread4joinEPS_+0x104>

0000000080003328 <_ZN7_thread4tickEv>:
    if(currentThread->blocked){
    80003328:	0000b797          	auipc	a5,0xb
    8000332c:	dc07b783          	ld	a5,-576(a5) # 8000e0e8 <_ZN7_thread13currentThreadE>
    80003330:	09c7a783          	lw	a5,156(a5)
    80003334:	0027f713          	andi	a4,a5,2
    80003338:	06071063          	bnez	a4,80003398 <_ZN7_thread4tickEv+0x70>
    if(currentThread->closed){
    8000333c:	0017f713          	andi	a4,a5,1
    80003340:	06071063          	bnez	a4,800033a0 <_ZN7_thread4tickEv+0x78>
    if(currentThread->sleeping){
    80003344:	0047f713          	andi	a4,a5,4
    80003348:	06071063          	bnez	a4,800033a8 <_ZN7_thread4tickEv+0x80>
    if(currentThread->finished){
    8000334c:	0087f793          	andi	a5,a5,8
    80003350:	06079063          	bnez	a5,800033b0 <_ZN7_thread4tickEv+0x88>
    timeLeft --;
    80003354:	08853783          	ld	a5,136(a0)
    80003358:	fff78793          	addi	a5,a5,-1
    8000335c:	08f53423          	sd	a5,136(a0)
    if(timeLeft == 0){
    80003360:	00078663          	beqz	a5,8000336c <_ZN7_thread4tickEv+0x44>
    return 0;
    80003364:	00000513          	li	a0,0
}
    80003368:	00008067          	ret
int _thread::tick(){
    8000336c:	ff010113          	addi	sp,sp,-16
    80003370:	00113423          	sd	ra,8(sp)
    80003374:	00813023          	sd	s0,0(sp)
    80003378:	01010413          	addi	s0,sp,16
        dispatch();
    8000337c:	00000097          	auipc	ra,0x0
    80003380:	de0080e7          	jalr	-544(ra) # 8000315c <_ZN7_thread8dispatchEv>
    return 0;
    80003384:	00000513          	li	a0,0
}
    80003388:	00813083          	ld	ra,8(sp)
    8000338c:	00013403          	ld	s0,0(sp)
    80003390:	01010113          	addi	sp,sp,16
    80003394:	00008067          	ret
        return -1;
    80003398:	fff00513          	li	a0,-1
    8000339c:	00008067          	ret
        return -2;
    800033a0:	ffe00513          	li	a0,-2
    800033a4:	00008067          	ret
        return -3;
    800033a8:	ffd00513          	li	a0,-3
    800033ac:	00008067          	ret
        return -4;
    800033b0:	ffc00513          	li	a0,-4
    800033b4:	00008067          	ret

00000000800033b8 <_ZN7_thread4exitEv>:
    if(currentThread->closed){
    800033b8:	0000b717          	auipc	a4,0xb
    800033bc:	d3073703          	ld	a4,-720(a4) # 8000e0e8 <_ZN7_thread13currentThreadE>
    800033c0:	09c72783          	lw	a5,156(a4)
    800033c4:	0017f693          	andi	a3,a5,1
    800033c8:	04069663          	bnez	a3,80003414 <_ZN7_thread4exitEv+0x5c>
    if(currentThread->blocked){
    800033cc:	0027f693          	andi	a3,a5,2
    800033d0:	04069663          	bnez	a3,8000341c <_ZN7_thread4exitEv+0x64>
    if(currentThread->sleeping){
    800033d4:	0047f793          	andi	a5,a5,4
    800033d8:	04079663          	bnez	a5,80003424 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    800033dc:	ff010113          	addi	sp,sp,-16
    800033e0:	00113423          	sd	ra,8(sp)
    800033e4:	00813023          	sd	s0,0(sp)
    800033e8:	01010413          	addi	s0,sp,16
    currentThread->finished = 1;
    800033ec:	09c72783          	lw	a5,156(a4)
    800033f0:	0087e793          	ori	a5,a5,8
    800033f4:	08f72e23          	sw	a5,156(a4)
    dispatch();
    800033f8:	00000097          	auipc	ra,0x0
    800033fc:	d64080e7          	jalr	-668(ra) # 8000315c <_ZN7_thread8dispatchEv>
    return 0;
    80003400:	00000513          	li	a0,0
}
    80003404:	00813083          	ld	ra,8(sp)
    80003408:	00013403          	ld	s0,0(sp)
    8000340c:	01010113          	addi	sp,sp,16
    80003410:	00008067          	ret
        return -1;
    80003414:	fff00513          	li	a0,-1
    80003418:	00008067          	ret
        return -2;
    8000341c:	ffe00513          	li	a0,-2
    80003420:	00008067          	ret
        return -3;
    80003424:	ffd00513          	li	a0,-3
}
    80003428:	00008067          	ret

000000008000342c <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    8000342c:	fe010113          	addi	sp,sp,-32
    80003430:	00113c23          	sd	ra,24(sp)
    80003434:	00813823          	sd	s0,16(sp)
    80003438:	00913423          	sd	s1,8(sp)
    8000343c:	02010413          	addi	s0,sp,32
    popSppSpie();
    80003440:	00000097          	auipc	ra,0x0
    80003444:	8d4080e7          	jalr	-1836(ra) # 80002d14 <_Z10popSppSpiev>
    currentThread->function(currentThread->arg);
    80003448:	0000b497          	auipc	s1,0xb
    8000344c:	c9848493          	addi	s1,s1,-872 # 8000e0e0 <_ZN7_thread6nextIDE>
    80003450:	0084b783          	ld	a5,8(s1)
    80003454:	0a87b703          	ld	a4,168(a5)
    80003458:	0b07b503          	ld	a0,176(a5)
    8000345c:	000700e7          	jalr	a4
    currentThread->unJoin();
    80003460:	0084b503          	ld	a0,8(s1)
    80003464:	00000097          	auipc	ra,0x0
    80003468:	8d8080e7          	jalr	-1832(ra) # 80002d3c <_ZN7_thread6unJoinEv>
    exit();
    8000346c:	00000097          	auipc	ra,0x0
    80003470:	f4c080e7          	jalr	-180(ra) # 800033b8 <_ZN7_thread4exitEv>
}
    80003474:	01813083          	ld	ra,24(sp)
    80003478:	01013403          	ld	s0,16(sp)
    8000347c:	00813483          	ld	s1,8(sp)
    80003480:	02010113          	addi	sp,sp,32
    80003484:	00008067          	ret

0000000080003488 <_ZN11HeapManagerC1Ev>:
#include "assert.h"
#include "heapManager.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80003488:	fe010113          	addi	sp,sp,-32
    8000348c:	00113c23          	sd	ra,24(sp)
    80003490:	00813823          	sd	s0,16(sp)
    80003494:	00913423          	sd	s1,8(sp)
    80003498:	02010413          	addi	s0,sp,32
    8000349c:	00050493          	mv	s1,a0
    assert(instance == 0);
    800034a0:	0000b797          	auipc	a5,0xb
    800034a4:	c507b783          	ld	a5,-944(a5) # 8000e0f0 <_ZN11HeapManager8instanceE>
    800034a8:	02079063          	bnez	a5,800034c8 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    800034ac:	0000b797          	auipc	a5,0xb
    800034b0:	c497b223          	sd	s1,-956(a5) # 8000e0f0 <_ZN11HeapManager8instanceE>
}
    800034b4:	01813083          	ld	ra,24(sp)
    800034b8:	01013403          	ld	s0,16(sp)
    800034bc:	00813483          	ld	s1,8(sp)
    800034c0:	02010113          	addi	sp,sp,32
    800034c4:	00008067          	ret
    assert(instance == 0);
    800034c8:	00008697          	auipc	a3,0x8
    800034cc:	c5068693          	addi	a3,a3,-944 # 8000b118 <CONSOLE_STATUS+0x108>
    800034d0:	01100613          	li	a2,17
    800034d4:	00008597          	auipc	a1,0x8
    800034d8:	c6458593          	addi	a1,a1,-924 # 8000b138 <CONSOLE_STATUS+0x128>
    800034dc:	00008517          	auipc	a0,0x8
    800034e0:	b6450513          	addi	a0,a0,-1180 # 8000b040 <CONSOLE_STATUS+0x30>
    800034e4:	fffff097          	auipc	ra,0xfffff
    800034e8:	bb8080e7          	jalr	-1096(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    800034ec:	fc1ff06f          	j	800034ac <_ZN11HeapManagerC1Ev+0x24>

00000000800034f0 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    800034f0:	ff010113          	addi	sp,sp,-16
    800034f4:	00813423          	sd	s0,8(sp)
    800034f8:	01010413          	addi	s0,sp,16
    
}
    800034fc:	00813403          	ld	s0,8(sp)
    80003500:	01010113          	addi	sp,sp,16
    80003504:	00008067          	ret

0000000080003508 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uint64 nStart, size_t nEnd){
    80003508:	fd010113          	addi	sp,sp,-48
    8000350c:	02113423          	sd	ra,40(sp)
    80003510:	02813023          	sd	s0,32(sp)
    80003514:	00913c23          	sd	s1,24(sp)
    80003518:	01213823          	sd	s2,16(sp)
    8000351c:	01313423          	sd	s3,8(sp)
    80003520:	03010413          	addi	s0,sp,48
    80003524:	00050993          	mv	s3,a0
    80003528:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    8000352c:	40b604b3          	sub	s1,a2,a1
    80003530:	0414b793          	sltiu	a5,s1,65
    80003534:	0c079863          	bnez	a5,80003604 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80003538:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    8000353c:	fde00793          	li	a5,-34
    80003540:	00f90c23          	sb	a5,24(s2)
    80003544:	fc000713          	li	a4,-64
    80003548:	00e90ca3          	sb	a4,25(s2)
    8000354c:	fad00713          	li	a4,-83
    80003550:	00e90d23          	sb	a4,26(s2)
    80003554:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    80003558:	0064d613          	srli	a2,s1,0x6
    8000355c:	0009b783          	ld	a5,0(s3)
    80003560:	fff60613          	addi	a2,a2,-1
    80003564:	00c78823          	sb	a2,16(a5)
    80003568:	00865713          	srli	a4,a2,0x8
    8000356c:	00e788a3          	sb	a4,17(a5)
    80003570:	01065713          	srli	a4,a2,0x10
    80003574:	00e78923          	sb	a4,18(a5)
    80003578:	0186571b          	srliw	a4,a2,0x18
    8000357c:	00e789a3          	sb	a4,19(a5)
    80003580:	02065713          	srli	a4,a2,0x20
    80003584:	00e78a23          	sb	a4,20(a5)
    80003588:	02865713          	srli	a4,a2,0x28
    8000358c:	00e78aa3          	sb	a4,21(a5)
    80003590:	03065713          	srli	a4,a2,0x30
    80003594:	00e78b23          	sb	a4,22(a5)
    80003598:	03865613          	srli	a2,a2,0x38
    8000359c:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    800035a0:	0009b783          	ld	a5,0(s3)
    800035a4:	00078023          	sb	zero,0(a5)
    800035a8:	000780a3          	sb	zero,1(a5)
    800035ac:	00078123          	sb	zero,2(a5)
    800035b0:	000781a3          	sb	zero,3(a5)
    800035b4:	00078223          	sb	zero,4(a5)
    800035b8:	000782a3          	sb	zero,5(a5)
    800035bc:	00078323          	sb	zero,6(a5)
    800035c0:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    800035c4:	0009b783          	ld	a5,0(s3)
    800035c8:	00078423          	sb	zero,8(a5)
    800035cc:	000784a3          	sb	zero,9(a5)
    800035d0:	00078523          	sb	zero,10(a5)
    800035d4:	000785a3          	sb	zero,11(a5)
    800035d8:	00078623          	sb	zero,12(a5)
    800035dc:	000786a3          	sb	zero,13(a5)
    800035e0:	00078723          	sb	zero,14(a5)
    800035e4:	000787a3          	sb	zero,15(a5)
}
    800035e8:	02813083          	ld	ra,40(sp)
    800035ec:	02013403          	ld	s0,32(sp)
    800035f0:	01813483          	ld	s1,24(sp)
    800035f4:	01013903          	ld	s2,16(sp)
    800035f8:	00813983          	ld	s3,8(sp)
    800035fc:	03010113          	addi	sp,sp,48
    80003600:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003604:	00008697          	auipc	a3,0x8
    80003608:	b4c68693          	addi	a3,a3,-1204 # 8000b150 <CONSOLE_STATUS+0x140>
    8000360c:	01a00613          	li	a2,26
    80003610:	00008597          	auipc	a1,0x8
    80003614:	b2858593          	addi	a1,a1,-1240 # 8000b138 <CONSOLE_STATUS+0x128>
    80003618:	00008517          	auipc	a0,0x8
    8000361c:	b6050513          	addi	a0,a0,-1184 # 8000b178 <CONSOLE_STATUS+0x168>
    80003620:	fffff097          	auipc	ra,0xfffff
    80003624:	a7c080e7          	jalr	-1412(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80003628:	f11ff06f          	j	80003538 <_ZN11HeapManager4initEmm+0x30>

000000008000362c <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    8000362c:	fe010113          	addi	sp,sp,-32
    80003630:	00113c23          	sd	ra,24(sp)
    80003634:	00813823          	sd	s0,16(sp)
    80003638:	00913423          	sd	s1,8(sp)
    8000363c:	01213023          	sd	s2,0(sp)
    80003640:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003644:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80003648:	00000913          	li	s2,0
    8000364c:	0b80006f          	j	80003704 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80003650:	0104c783          	lbu	a5,16(s1)
    80003654:	0114c703          	lbu	a4,17(s1)
    80003658:	00871713          	slli	a4,a4,0x8
    8000365c:	00f76733          	or	a4,a4,a5
    80003660:	0124c783          	lbu	a5,18(s1)
    80003664:	01079793          	slli	a5,a5,0x10
    80003668:	00e7e733          	or	a4,a5,a4
    8000366c:	0134c783          	lbu	a5,19(s1)
    80003670:	01879793          	slli	a5,a5,0x18
    80003674:	00e7e7b3          	or	a5,a5,a4
    80003678:	0144c703          	lbu	a4,20(s1)
    8000367c:	02071713          	slli	a4,a4,0x20
    80003680:	00f767b3          	or	a5,a4,a5
    80003684:	0154c703          	lbu	a4,21(s1)
    80003688:	02871713          	slli	a4,a4,0x28
    8000368c:	00f76733          	or	a4,a4,a5
    80003690:	0164c783          	lbu	a5,22(s1)
    80003694:	03079793          	slli	a5,a5,0x30
    80003698:	00e7e733          	or	a4,a5,a4
    8000369c:	0174c783          	lbu	a5,23(s1)
    800036a0:	03879793          	slli	a5,a5,0x38
    800036a4:	00e7e7b3          	or	a5,a5,a4
    800036a8:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    800036ac:	0004c703          	lbu	a4,0(s1)
    800036b0:	0014c783          	lbu	a5,1(s1)
    800036b4:	00879793          	slli	a5,a5,0x8
    800036b8:	00e7e733          	or	a4,a5,a4
    800036bc:	0024c783          	lbu	a5,2(s1)
    800036c0:	01079793          	slli	a5,a5,0x10
    800036c4:	00e7e7b3          	or	a5,a5,a4
    800036c8:	0034c703          	lbu	a4,3(s1)
    800036cc:	01871713          	slli	a4,a4,0x18
    800036d0:	00f767b3          	or	a5,a4,a5
    800036d4:	0044c703          	lbu	a4,4(s1)
    800036d8:	02071713          	slli	a4,a4,0x20
    800036dc:	00f76733          	or	a4,a4,a5
    800036e0:	0054c783          	lbu	a5,5(s1)
    800036e4:	02879793          	slli	a5,a5,0x28
    800036e8:	00e7e733          	or	a4,a5,a4
    800036ec:	0064c783          	lbu	a5,6(s1)
    800036f0:	03079793          	slli	a5,a5,0x30
    800036f4:	00e7e7b3          	or	a5,a5,a4
    800036f8:	0074c483          	lbu	s1,7(s1)
    800036fc:	03849493          	slli	s1,s1,0x38
    80003700:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003704:	06048263          	beqz	s1,80003768 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003708:	0184c783          	lbu	a5,24(s1)
    8000370c:	0194c703          	lbu	a4,25(s1)
    80003710:	00871713          	slli	a4,a4,0x8
    80003714:	00f76733          	or	a4,a4,a5
    80003718:	01a4c783          	lbu	a5,26(s1)
    8000371c:	01079793          	slli	a5,a5,0x10
    80003720:	00e7e733          	or	a4,a5,a4
    80003724:	01b4c783          	lbu	a5,27(s1)
    80003728:	01879793          	slli	a5,a5,0x18
    8000372c:	00e7e7b3          	or	a5,a5,a4
    80003730:	0007879b          	sext.w	a5,a5
    80003734:	deadc737          	lui	a4,0xdeadc
    80003738:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eaccd2e>
    8000373c:	f0e78ae3          	beq	a5,a4,80003650 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80003740:	00008697          	auipc	a3,0x8
    80003744:	a5868693          	addi	a3,a3,-1448 # 8000b198 <CONSOLE_STATUS+0x188>
    80003748:	02700613          	li	a2,39
    8000374c:	00008597          	auipc	a1,0x8
    80003750:	9ec58593          	addi	a1,a1,-1556 # 8000b138 <CONSOLE_STATUS+0x128>
    80003754:	00008517          	auipc	a0,0x8
    80003758:	a6c50513          	addi	a0,a0,-1428 # 8000b1c0 <CONSOLE_STATUS+0x1b0>
    8000375c:	fffff097          	auipc	ra,0xfffff
    80003760:	940080e7          	jalr	-1728(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80003764:	eedff06f          	j	80003650 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80003768:	00090513          	mv	a0,s2
    8000376c:	01813083          	ld	ra,24(sp)
    80003770:	01013403          	ld	s0,16(sp)
    80003774:	00813483          	ld	s1,8(sp)
    80003778:	00013903          	ld	s2,0(sp)
    8000377c:	02010113          	addi	sp,sp,32
    80003780:	00008067          	ret

0000000080003784 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80003784:	fd010113          	addi	sp,sp,-48
    80003788:	02113423          	sd	ra,40(sp)
    8000378c:	02813023          	sd	s0,32(sp)
    80003790:	00913c23          	sd	s1,24(sp)
    80003794:	01213823          	sd	s2,16(sp)
    80003798:	01313423          	sd	s3,8(sp)
    8000379c:	03010413          	addi	s0,sp,48
    800037a0:	00050993          	mv	s3,a0
    800037a4:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    800037a8:	00053483          	ld	s1,0(a0)
    800037ac:	0b80006f          	j	80003864 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    800037b0:	0104c783          	lbu	a5,16(s1)
    800037b4:	0114c703          	lbu	a4,17(s1)
    800037b8:	00871713          	slli	a4,a4,0x8
    800037bc:	00f76733          	or	a4,a4,a5
    800037c0:	0124c783          	lbu	a5,18(s1)
    800037c4:	01079793          	slli	a5,a5,0x10
    800037c8:	00e7e733          	or	a4,a5,a4
    800037cc:	0134c783          	lbu	a5,19(s1)
    800037d0:	01879793          	slli	a5,a5,0x18
    800037d4:	00e7e7b3          	or	a5,a5,a4
    800037d8:	0144c703          	lbu	a4,20(s1)
    800037dc:	02071713          	slli	a4,a4,0x20
    800037e0:	00f767b3          	or	a5,a4,a5
    800037e4:	0154c703          	lbu	a4,21(s1)
    800037e8:	02871713          	slli	a4,a4,0x28
    800037ec:	00f76733          	or	a4,a4,a5
    800037f0:	0164c783          	lbu	a5,22(s1)
    800037f4:	03079793          	slli	a5,a5,0x30
    800037f8:	00e7e733          	or	a4,a5,a4
    800037fc:	0174c783          	lbu	a5,23(s1)
    80003800:	03879793          	slli	a5,a5,0x38
    80003804:	00e7e7b3          	or	a5,a5,a4
    80003808:	0d27f063          	bgeu	a5,s2,800038c8 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    8000380c:	0004c703          	lbu	a4,0(s1)
    80003810:	0014c783          	lbu	a5,1(s1)
    80003814:	00879793          	slli	a5,a5,0x8
    80003818:	00e7e733          	or	a4,a5,a4
    8000381c:	0024c783          	lbu	a5,2(s1)
    80003820:	01079793          	slli	a5,a5,0x10
    80003824:	00e7e7b3          	or	a5,a5,a4
    80003828:	0034c703          	lbu	a4,3(s1)
    8000382c:	01871713          	slli	a4,a4,0x18
    80003830:	00f767b3          	or	a5,a4,a5
    80003834:	0044c703          	lbu	a4,4(s1)
    80003838:	02071713          	slli	a4,a4,0x20
    8000383c:	00f76733          	or	a4,a4,a5
    80003840:	0054c783          	lbu	a5,5(s1)
    80003844:	02879793          	slli	a5,a5,0x28
    80003848:	00e7e733          	or	a4,a5,a4
    8000384c:	0064c783          	lbu	a5,6(s1)
    80003850:	03079793          	slli	a5,a5,0x30
    80003854:	00e7e7b3          	or	a5,a5,a4
    80003858:	0074c483          	lbu	s1,7(s1)
    8000385c:	03849493          	slli	s1,s1,0x38
    80003860:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003864:	4e048c63          	beqz	s1,80003d5c <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003868:	0184c783          	lbu	a5,24(s1)
    8000386c:	0194c703          	lbu	a4,25(s1)
    80003870:	00871713          	slli	a4,a4,0x8
    80003874:	00f76733          	or	a4,a4,a5
    80003878:	01a4c783          	lbu	a5,26(s1)
    8000387c:	01079793          	slli	a5,a5,0x10
    80003880:	00e7e733          	or	a4,a5,a4
    80003884:	01b4c783          	lbu	a5,27(s1)
    80003888:	01879793          	slli	a5,a5,0x18
    8000388c:	00e7e7b3          	or	a5,a5,a4
    80003890:	0007879b          	sext.w	a5,a5
    80003894:	deadc737          	lui	a4,0xdeadc
    80003898:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eaccd2e>
    8000389c:	f0e78ae3          	beq	a5,a4,800037b0 <_ZN11HeapManager12heapAllocateEm+0x2c>
    800038a0:	00008697          	auipc	a3,0x8
    800038a4:	94868693          	addi	a3,a3,-1720 # 8000b1e8 <CONSOLE_STATUS+0x1d8>
    800038a8:	03100613          	li	a2,49
    800038ac:	00008597          	auipc	a1,0x8
    800038b0:	88c58593          	addi	a1,a1,-1908 # 8000b138 <CONSOLE_STATUS+0x128>
    800038b4:	00008517          	auipc	a0,0x8
    800038b8:	90c50513          	addi	a0,a0,-1780 # 8000b1c0 <CONSOLE_STATUS+0x1b0>
    800038bc:	ffffe097          	auipc	ra,0xffffe
    800038c0:	7e0080e7          	jalr	2016(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    800038c4:	eedff06f          	j	800037b0 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    800038c8:	00190713          	addi	a4,s2,1
    800038cc:	2af77263          	bgeu	a4,a5,80003b70 <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    800038d0:	00671793          	slli	a5,a4,0x6
    800038d4:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    800038d8:	fde00713          	li	a4,-34
    800038dc:	00e78c23          	sb	a4,24(a5)
    800038e0:	fc000693          	li	a3,-64
    800038e4:	00d78ca3          	sb	a3,25(a5)
    800038e8:	fad00693          	li	a3,-83
    800038ec:	00d78d23          	sb	a3,26(a5)
    800038f0:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    800038f4:	0104c703          	lbu	a4,16(s1)
    800038f8:	0114c683          	lbu	a3,17(s1)
    800038fc:	00869693          	slli	a3,a3,0x8
    80003900:	00e6e6b3          	or	a3,a3,a4
    80003904:	0124c703          	lbu	a4,18(s1)
    80003908:	01071713          	slli	a4,a4,0x10
    8000390c:	00d766b3          	or	a3,a4,a3
    80003910:	0134c703          	lbu	a4,19(s1)
    80003914:	01871713          	slli	a4,a4,0x18
    80003918:	00d76733          	or	a4,a4,a3
    8000391c:	0144c683          	lbu	a3,20(s1)
    80003920:	02069693          	slli	a3,a3,0x20
    80003924:	00e6e733          	or	a4,a3,a4
    80003928:	0154c683          	lbu	a3,21(s1)
    8000392c:	02869693          	slli	a3,a3,0x28
    80003930:	00e6e6b3          	or	a3,a3,a4
    80003934:	0164c703          	lbu	a4,22(s1)
    80003938:	03071713          	slli	a4,a4,0x30
    8000393c:	00d766b3          	or	a3,a4,a3
    80003940:	0174c703          	lbu	a4,23(s1)
    80003944:	03871713          	slli	a4,a4,0x38
    80003948:	00d76733          	or	a4,a4,a3
    8000394c:	41270733          	sub	a4,a4,s2
    80003950:	fff70713          	addi	a4,a4,-1
    80003954:	00e78823          	sb	a4,16(a5)
    80003958:	00875693          	srli	a3,a4,0x8
    8000395c:	00d788a3          	sb	a3,17(a5)
    80003960:	01075693          	srli	a3,a4,0x10
    80003964:	00d78923          	sb	a3,18(a5)
    80003968:	0187569b          	srliw	a3,a4,0x18
    8000396c:	00d789a3          	sb	a3,19(a5)
    80003970:	02075693          	srli	a3,a4,0x20
    80003974:	00d78a23          	sb	a3,20(a5)
    80003978:	02875693          	srli	a3,a4,0x28
    8000397c:	00d78aa3          	sb	a3,21(a5)
    80003980:	03075693          	srli	a3,a4,0x30
    80003984:	00d78b23          	sb	a3,22(a5)
    80003988:	03875713          	srli	a4,a4,0x38
    8000398c:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80003990:	0004c703          	lbu	a4,0(s1)
    80003994:	0014c683          	lbu	a3,1(s1)
    80003998:	00869693          	slli	a3,a3,0x8
    8000399c:	00e6e733          	or	a4,a3,a4
    800039a0:	0024c683          	lbu	a3,2(s1)
    800039a4:	01069693          	slli	a3,a3,0x10
    800039a8:	00e6e6b3          	or	a3,a3,a4
    800039ac:	0034c703          	lbu	a4,3(s1)
    800039b0:	01871713          	slli	a4,a4,0x18
    800039b4:	00d766b3          	or	a3,a4,a3
    800039b8:	0044c703          	lbu	a4,4(s1)
    800039bc:	02071713          	slli	a4,a4,0x20
    800039c0:	00d76733          	or	a4,a4,a3
    800039c4:	0054c683          	lbu	a3,5(s1)
    800039c8:	02869693          	slli	a3,a3,0x28
    800039cc:	00e6e733          	or	a4,a3,a4
    800039d0:	0064c683          	lbu	a3,6(s1)
    800039d4:	03069693          	slli	a3,a3,0x30
    800039d8:	00e6e6b3          	or	a3,a3,a4
    800039dc:	0074c703          	lbu	a4,7(s1)
    800039e0:	03871713          	slli	a4,a4,0x38
    800039e4:	00d76733          	or	a4,a4,a3
    800039e8:	00d78023          	sb	a3,0(a5)
    800039ec:	00875693          	srli	a3,a4,0x8
    800039f0:	00d780a3          	sb	a3,1(a5)
    800039f4:	01075693          	srli	a3,a4,0x10
    800039f8:	00d78123          	sb	a3,2(a5)
    800039fc:	0187569b          	srliw	a3,a4,0x18
    80003a00:	00d781a3          	sb	a3,3(a5)
    80003a04:	02075693          	srli	a3,a4,0x20
    80003a08:	00d78223          	sb	a3,4(a5)
    80003a0c:	02875693          	srli	a3,a4,0x28
    80003a10:	00d782a3          	sb	a3,5(a5)
    80003a14:	03075693          	srli	a3,a4,0x30
    80003a18:	00d78323          	sb	a3,6(a5)
    80003a1c:	03875713          	srli	a4,a4,0x38
    80003a20:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80003a24:	00978423          	sb	s1,8(a5)
    80003a28:	0084d713          	srli	a4,s1,0x8
    80003a2c:	00e784a3          	sb	a4,9(a5)
    80003a30:	0104d713          	srli	a4,s1,0x10
    80003a34:	00e78523          	sb	a4,10(a5)
    80003a38:	0184d71b          	srliw	a4,s1,0x18
    80003a3c:	00e785a3          	sb	a4,11(a5)
    80003a40:	0204d713          	srli	a4,s1,0x20
    80003a44:	00e78623          	sb	a4,12(a5)
    80003a48:	0284d713          	srli	a4,s1,0x28
    80003a4c:	00e786a3          	sb	a4,13(a5)
    80003a50:	0304d713          	srli	a4,s1,0x30
    80003a54:	00e78723          	sb	a4,14(a5)
    80003a58:	0384d713          	srli	a4,s1,0x38
    80003a5c:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    80003a60:	0004c703          	lbu	a4,0(s1)
    80003a64:	0014c683          	lbu	a3,1(s1)
    80003a68:	00869693          	slli	a3,a3,0x8
    80003a6c:	00e6e6b3          	or	a3,a3,a4
    80003a70:	0024c703          	lbu	a4,2(s1)
    80003a74:	01071713          	slli	a4,a4,0x10
    80003a78:	00d766b3          	or	a3,a4,a3
    80003a7c:	0034c703          	lbu	a4,3(s1)
    80003a80:	01871713          	slli	a4,a4,0x18
    80003a84:	00d76733          	or	a4,a4,a3
    80003a88:	0044c683          	lbu	a3,4(s1)
    80003a8c:	02069693          	slli	a3,a3,0x20
    80003a90:	00e6e733          	or	a4,a3,a4
    80003a94:	0054c683          	lbu	a3,5(s1)
    80003a98:	02869693          	slli	a3,a3,0x28
    80003a9c:	00e6e6b3          	or	a3,a3,a4
    80003aa0:	0064c703          	lbu	a4,6(s1)
    80003aa4:	03071713          	slli	a4,a4,0x30
    80003aa8:	00d766b3          	or	a3,a4,a3
    80003aac:	0074c703          	lbu	a4,7(s1)
    80003ab0:	03871713          	slli	a4,a4,0x38
    80003ab4:	00d76733          	or	a4,a4,a3
    80003ab8:	04070063          	beqz	a4,80003af8 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003abc:	00f70423          	sb	a5,8(a4)
    80003ac0:	0087d693          	srli	a3,a5,0x8
    80003ac4:	00d704a3          	sb	a3,9(a4)
    80003ac8:	0107d693          	srli	a3,a5,0x10
    80003acc:	00d70523          	sb	a3,10(a4)
    80003ad0:	0187d69b          	srliw	a3,a5,0x18
    80003ad4:	00d705a3          	sb	a3,11(a4)
    80003ad8:	0207d693          	srli	a3,a5,0x20
    80003adc:	00d70623          	sb	a3,12(a4)
    80003ae0:	0287d693          	srli	a3,a5,0x28
    80003ae4:	00d706a3          	sb	a3,13(a4)
    80003ae8:	0307d693          	srli	a3,a5,0x30
    80003aec:	00d70723          	sb	a3,14(a4)
    80003af0:	0387d693          	srli	a3,a5,0x38
    80003af4:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80003af8:	00f48023          	sb	a5,0(s1)
    80003afc:	0087d713          	srli	a4,a5,0x8
    80003b00:	00e480a3          	sb	a4,1(s1)
    80003b04:	0107d713          	srli	a4,a5,0x10
    80003b08:	00e48123          	sb	a4,2(s1)
    80003b0c:	0187d71b          	srliw	a4,a5,0x18
    80003b10:	00e481a3          	sb	a4,3(s1)
    80003b14:	0207d713          	srli	a4,a5,0x20
    80003b18:	00e48223          	sb	a4,4(s1)
    80003b1c:	0287d713          	srli	a4,a5,0x28
    80003b20:	00e482a3          	sb	a4,5(s1)
    80003b24:	0307d713          	srli	a4,a5,0x30
    80003b28:	00e48323          	sb	a4,6(s1)
    80003b2c:	0387d793          	srli	a5,a5,0x38
    80003b30:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80003b34:	01248823          	sb	s2,16(s1)
    80003b38:	00895793          	srli	a5,s2,0x8
    80003b3c:	00f488a3          	sb	a5,17(s1)
    80003b40:	01095793          	srli	a5,s2,0x10
    80003b44:	00f48923          	sb	a5,18(s1)
    80003b48:	0189579b          	srliw	a5,s2,0x18
    80003b4c:	00f489a3          	sb	a5,19(s1)
    80003b50:	02095793          	srli	a5,s2,0x20
    80003b54:	00f48a23          	sb	a5,20(s1)
    80003b58:	02895793          	srli	a5,s2,0x28
    80003b5c:	00f48aa3          	sb	a5,21(s1)
    80003b60:	03095793          	srli	a5,s2,0x30
    80003b64:	00f48b23          	sb	a5,22(s1)
    80003b68:	03895913          	srli	s2,s2,0x38
    80003b6c:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80003b70:	0009b783          	ld	a5,0(s3)
    80003b74:	20978463          	beq	a5,s1,80003d7c <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80003b78:	0084c783          	lbu	a5,8(s1)
    80003b7c:	0094c703          	lbu	a4,9(s1)
    80003b80:	00871713          	slli	a4,a4,0x8
    80003b84:	00f76733          	or	a4,a4,a5
    80003b88:	00a4c783          	lbu	a5,10(s1)
    80003b8c:	01079793          	slli	a5,a5,0x10
    80003b90:	00e7e733          	or	a4,a5,a4
    80003b94:	00b4c783          	lbu	a5,11(s1)
    80003b98:	01879793          	slli	a5,a5,0x18
    80003b9c:	00e7e7b3          	or	a5,a5,a4
    80003ba0:	00c4c703          	lbu	a4,12(s1)
    80003ba4:	02071713          	slli	a4,a4,0x20
    80003ba8:	00f767b3          	or	a5,a4,a5
    80003bac:	00d4c703          	lbu	a4,13(s1)
    80003bb0:	02871713          	slli	a4,a4,0x28
    80003bb4:	00f76733          	or	a4,a4,a5
    80003bb8:	00e4c783          	lbu	a5,14(s1)
    80003bbc:	03079793          	slli	a5,a5,0x30
    80003bc0:	00e7e733          	or	a4,a5,a4
    80003bc4:	00f4c783          	lbu	a5,15(s1)
    80003bc8:	03879793          	slli	a5,a5,0x38
    80003bcc:	00e7e7b3          	or	a5,a5,a4
    80003bd0:	08078c63          	beqz	a5,80003c68 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80003bd4:	0004c703          	lbu	a4,0(s1)
    80003bd8:	0014c683          	lbu	a3,1(s1)
    80003bdc:	00869693          	slli	a3,a3,0x8
    80003be0:	00e6e733          	or	a4,a3,a4
    80003be4:	0024c683          	lbu	a3,2(s1)
    80003be8:	01069693          	slli	a3,a3,0x10
    80003bec:	00e6e6b3          	or	a3,a3,a4
    80003bf0:	0034c703          	lbu	a4,3(s1)
    80003bf4:	01871713          	slli	a4,a4,0x18
    80003bf8:	00d766b3          	or	a3,a4,a3
    80003bfc:	0044c703          	lbu	a4,4(s1)
    80003c00:	02071713          	slli	a4,a4,0x20
    80003c04:	00d76733          	or	a4,a4,a3
    80003c08:	0054c683          	lbu	a3,5(s1)
    80003c0c:	02869693          	slli	a3,a3,0x28
    80003c10:	00e6e733          	or	a4,a3,a4
    80003c14:	0064c683          	lbu	a3,6(s1)
    80003c18:	03069693          	slli	a3,a3,0x30
    80003c1c:	00e6e6b3          	or	a3,a3,a4
    80003c20:	0074c703          	lbu	a4,7(s1)
    80003c24:	03871713          	slli	a4,a4,0x38
    80003c28:	00d76733          	or	a4,a4,a3
    80003c2c:	00d78023          	sb	a3,0(a5)
    80003c30:	00875693          	srli	a3,a4,0x8
    80003c34:	00d780a3          	sb	a3,1(a5)
    80003c38:	01075693          	srli	a3,a4,0x10
    80003c3c:	00d78123          	sb	a3,2(a5)
    80003c40:	0187569b          	srliw	a3,a4,0x18
    80003c44:	00d781a3          	sb	a3,3(a5)
    80003c48:	02075693          	srli	a3,a4,0x20
    80003c4c:	00d78223          	sb	a3,4(a5)
    80003c50:	02875693          	srli	a3,a4,0x28
    80003c54:	00d782a3          	sb	a3,5(a5)
    80003c58:	03075693          	srli	a3,a4,0x30
    80003c5c:	00d78323          	sb	a3,6(a5)
    80003c60:	03875713          	srli	a4,a4,0x38
    80003c64:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003c68:	0004c783          	lbu	a5,0(s1)
    80003c6c:	0014c703          	lbu	a4,1(s1)
    80003c70:	00871713          	slli	a4,a4,0x8
    80003c74:	00f76733          	or	a4,a4,a5
    80003c78:	0024c783          	lbu	a5,2(s1)
    80003c7c:	01079793          	slli	a5,a5,0x10
    80003c80:	00e7e733          	or	a4,a5,a4
    80003c84:	0034c783          	lbu	a5,3(s1)
    80003c88:	01879793          	slli	a5,a5,0x18
    80003c8c:	00e7e7b3          	or	a5,a5,a4
    80003c90:	0044c703          	lbu	a4,4(s1)
    80003c94:	02071713          	slli	a4,a4,0x20
    80003c98:	00f767b3          	or	a5,a4,a5
    80003c9c:	0054c703          	lbu	a4,5(s1)
    80003ca0:	02871713          	slli	a4,a4,0x28
    80003ca4:	00f76733          	or	a4,a4,a5
    80003ca8:	0064c783          	lbu	a5,6(s1)
    80003cac:	03079793          	slli	a5,a5,0x30
    80003cb0:	00e7e733          	or	a4,a5,a4
    80003cb4:	0074c783          	lbu	a5,7(s1)
    80003cb8:	03879793          	slli	a5,a5,0x38
    80003cbc:	00e7e7b3          	or	a5,a5,a4
    80003cc0:	08078c63          	beqz	a5,80003d58 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003cc4:	0084c703          	lbu	a4,8(s1)
    80003cc8:	0094c683          	lbu	a3,9(s1)
    80003ccc:	00869693          	slli	a3,a3,0x8
    80003cd0:	00e6e733          	or	a4,a3,a4
    80003cd4:	00a4c683          	lbu	a3,10(s1)
    80003cd8:	01069693          	slli	a3,a3,0x10
    80003cdc:	00e6e6b3          	or	a3,a3,a4
    80003ce0:	00b4c703          	lbu	a4,11(s1)
    80003ce4:	01871713          	slli	a4,a4,0x18
    80003ce8:	00d766b3          	or	a3,a4,a3
    80003cec:	00c4c703          	lbu	a4,12(s1)
    80003cf0:	02071713          	slli	a4,a4,0x20
    80003cf4:	00d76733          	or	a4,a4,a3
    80003cf8:	00d4c683          	lbu	a3,13(s1)
    80003cfc:	02869693          	slli	a3,a3,0x28
    80003d00:	00e6e733          	or	a4,a3,a4
    80003d04:	00e4c683          	lbu	a3,14(s1)
    80003d08:	03069693          	slli	a3,a3,0x30
    80003d0c:	00e6e6b3          	or	a3,a3,a4
    80003d10:	00f4c703          	lbu	a4,15(s1)
    80003d14:	03871713          	slli	a4,a4,0x38
    80003d18:	00d76733          	or	a4,a4,a3
    80003d1c:	00d78423          	sb	a3,8(a5)
    80003d20:	00875693          	srli	a3,a4,0x8
    80003d24:	00d784a3          	sb	a3,9(a5)
    80003d28:	01075693          	srli	a3,a4,0x10
    80003d2c:	00d78523          	sb	a3,10(a5)
    80003d30:	0187569b          	srliw	a3,a4,0x18
    80003d34:	00d785a3          	sb	a3,11(a5)
    80003d38:	02075693          	srli	a3,a4,0x20
    80003d3c:	00d78623          	sb	a3,12(a5)
    80003d40:	02875693          	srli	a3,a4,0x28
    80003d44:	00d786a3          	sb	a3,13(a5)
    80003d48:	03075693          	srli	a3,a4,0x30
    80003d4c:	00d78723          	sb	a3,14(a5)
    80003d50:	03875713          	srli	a4,a4,0x38
    80003d54:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    80003d58:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80003d5c:	00048513          	mv	a0,s1
    80003d60:	02813083          	ld	ra,40(sp)
    80003d64:	02013403          	ld	s0,32(sp)
    80003d68:	01813483          	ld	s1,24(sp)
    80003d6c:	01013903          	ld	s2,16(sp)
    80003d70:	00813983          	ld	s3,8(sp)
    80003d74:	03010113          	addi	sp,sp,48
    80003d78:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80003d7c:	0004c703          	lbu	a4,0(s1)
    80003d80:	0014c783          	lbu	a5,1(s1)
    80003d84:	00879793          	slli	a5,a5,0x8
    80003d88:	00e7e7b3          	or	a5,a5,a4
    80003d8c:	0024c703          	lbu	a4,2(s1)
    80003d90:	01071713          	slli	a4,a4,0x10
    80003d94:	00f76733          	or	a4,a4,a5
    80003d98:	0034c783          	lbu	a5,3(s1)
    80003d9c:	01879793          	slli	a5,a5,0x18
    80003da0:	00e7e733          	or	a4,a5,a4
    80003da4:	0044c783          	lbu	a5,4(s1)
    80003da8:	02079793          	slli	a5,a5,0x20
    80003dac:	00e7e7b3          	or	a5,a5,a4
    80003db0:	0054c703          	lbu	a4,5(s1)
    80003db4:	02871713          	slli	a4,a4,0x28
    80003db8:	00f76733          	or	a4,a4,a5
    80003dbc:	0064c783          	lbu	a5,6(s1)
    80003dc0:	03079793          	slli	a5,a5,0x30
    80003dc4:	00e7e733          	or	a4,a5,a4
    80003dc8:	0074c783          	lbu	a5,7(s1)
    80003dcc:	03879793          	slli	a5,a5,0x38
    80003dd0:	00e7e7b3          	or	a5,a5,a4
    80003dd4:	00f9b023          	sd	a5,0(s3)
    80003dd8:	da1ff06f          	j	80003b78 <_ZN11HeapManager12heapAllocateEm+0x3f4>

0000000080003ddc <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003ddc:	ff010113          	addi	sp,sp,-16
    80003de0:	00813423          	sd	s0,8(sp)
    80003de4:	01010413          	addi	s0,sp,16
    //     if(pFree->pNext != 0){
    //         pFree->pNext->pPrev = pFree;
    //     }
    // }
    return 0;
}
    80003de8:	00000513          	li	a0,0
    80003dec:	00813403          	ld	s0,8(sp)
    80003df0:	01010113          	addi	sp,sp,16
    80003df4:	00008067          	ret

0000000080003df8 <_ZN14ConsoleManager11getInstanceEv>:
    outBuffer.init();
    waitingThreads = 0;
}

ConsoleManager& ConsoleManager::getInstance(){
    assert(instance != 0);
    80003df8:	0000a797          	auipc	a5,0xa
    80003dfc:	3007b783          	ld	a5,768(a5) # 8000e0f8 <_ZN14ConsoleManager8instanceE>
    80003e00:	00078863          	beqz	a5,80003e10 <_ZN14ConsoleManager11getInstanceEv+0x18>
    return *instance;
}
    80003e04:	0000a517          	auipc	a0,0xa
    80003e08:	2f453503          	ld	a0,756(a0) # 8000e0f8 <_ZN14ConsoleManager8instanceE>
    80003e0c:	00008067          	ret
ConsoleManager& ConsoleManager::getInstance(){
    80003e10:	ff010113          	addi	sp,sp,-16
    80003e14:	00113423          	sd	ra,8(sp)
    80003e18:	00813023          	sd	s0,0(sp)
    80003e1c:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80003e20:	00007697          	auipc	a3,0x7
    80003e24:	3f068693          	addi	a3,a3,1008 # 8000b210 <CONSOLE_STATUS+0x200>
    80003e28:	02200613          	li	a2,34
    80003e2c:	00007597          	auipc	a1,0x7
    80003e30:	41c58593          	addi	a1,a1,1052 # 8000b248 <CONSOLE_STATUS+0x238>
    80003e34:	00007517          	auipc	a0,0x7
    80003e38:	24450513          	addi	a0,a0,580 # 8000b078 <CONSOLE_STATUS+0x68>
    80003e3c:	ffffe097          	auipc	ra,0xffffe
    80003e40:	260080e7          	jalr	608(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
}
    80003e44:	0000a517          	auipc	a0,0xa
    80003e48:	2b453503          	ld	a0,692(a0) # 8000e0f8 <_ZN14ConsoleManager8instanceE>
    80003e4c:	00813083          	ld	ra,8(sp)
    80003e50:	00013403          	ld	s0,0(sp)
    80003e54:	01010113          	addi	sp,sp,16
    80003e58:	00008067          	ret

0000000080003e5c <_ZN14ConsoleManager13consoleBufferD1Ev>:

ConsoleManager::consoleBuffer::~consoleBuffer(){
    80003e5c:	ff010113          	addi	sp,sp,-16
    80003e60:	00113423          	sd	ra,8(sp)
    80003e64:	00813023          	sd	s0,0(sp)
    80003e68:	01010413          	addi	s0,sp,16
    sem_close(sem);
    80003e6c:	00053503          	ld	a0,0(a0)
    80003e70:	ffffe097          	auipc	ra,0xffffe
    80003e74:	bd4080e7          	jalr	-1068(ra) # 80001a44 <_Z9sem_closeP4_sem>
}
    80003e78:	00813083          	ld	ra,8(sp)
    80003e7c:	00013403          	ld	s0,0(sp)
    80003e80:	01010113          	addi	sp,sp,16
    80003e84:	00008067          	ret

0000000080003e88 <_ZN14ConsoleManagerC1Ev>:
ConsoleManager::ConsoleManager(){
    80003e88:	fd010113          	addi	sp,sp,-48
    80003e8c:	02113423          	sd	ra,40(sp)
    80003e90:	02813023          	sd	s0,32(sp)
    80003e94:	00913c23          	sd	s1,24(sp)
    80003e98:	01213823          	sd	s2,16(sp)
    80003e9c:	01313423          	sd	s3,8(sp)
    80003ea0:	03010413          	addi	s0,sp,48
    80003ea4:	00050493          	mv	s1,a0

    static ConsoleManager* instance;
    
    struct consoleBuffer{
    public:
        consoleBuffer(): head(0), tail(0), size(0){}
    80003ea8:	10053423          	sd	zero,264(a0)
    80003eac:	10053823          	sd	zero,272(a0)
    80003eb0:	10053c23          	sd	zero,280(a0)
    80003eb4:	22053423          	sd	zero,552(a0)
    80003eb8:	22053823          	sd	zero,560(a0)
    80003ebc:	22053c23          	sd	zero,568(a0)
    assert(instance == 0);
    80003ec0:	0000a797          	auipc	a5,0xa
    80003ec4:	2387b783          	ld	a5,568(a5) # 8000e0f8 <_ZN14ConsoleManager8instanceE>
    80003ec8:	02079463          	bnez	a5,80003ef0 <_ZN14ConsoleManagerC1Ev+0x68>
    instance = this;
    80003ecc:	0000a797          	auipc	a5,0xa
    80003ed0:	2297b623          	sd	s1,556(a5) # 8000e0f8 <_ZN14ConsoleManager8instanceE>
}
    80003ed4:	02813083          	ld	ra,40(sp)
    80003ed8:	02013403          	ld	s0,32(sp)
    80003edc:	01813483          	ld	s1,24(sp)
    80003ee0:	01013903          	ld	s2,16(sp)
    80003ee4:	00813983          	ld	s3,8(sp)
    80003ee8:	03010113          	addi	sp,sp,48
    80003eec:	00008067          	ret
    80003ef0:	12050913          	addi	s2,a0,288
    assert(instance == 0);
    80003ef4:	00007697          	auipc	a3,0x7
    80003ef8:	36c68693          	addi	a3,a3,876 # 8000b260 <CONSOLE_STATUS+0x250>
    80003efc:	01400613          	li	a2,20
    80003f00:	00007597          	auipc	a1,0x7
    80003f04:	34858593          	addi	a1,a1,840 # 8000b248 <CONSOLE_STATUS+0x238>
    80003f08:	00007517          	auipc	a0,0x7
    80003f0c:	13850513          	addi	a0,a0,312 # 8000b040 <CONSOLE_STATUS+0x30>
    80003f10:	ffffe097          	auipc	ra,0xffffe
    80003f14:	18c080e7          	jalr	396(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80003f18:	fb5ff06f          	j	80003ecc <_ZN14ConsoleManagerC1Ev+0x44>
    80003f1c:	00050993          	mv	s3,a0
ConsoleManager::ConsoleManager(){
    80003f20:	00090513          	mv	a0,s2
    80003f24:	00000097          	auipc	ra,0x0
    80003f28:	f38080e7          	jalr	-200(ra) # 80003e5c <_ZN14ConsoleManager13consoleBufferD1Ev>
    80003f2c:	00048513          	mv	a0,s1
    80003f30:	00000097          	auipc	ra,0x0
    80003f34:	f2c080e7          	jalr	-212(ra) # 80003e5c <_ZN14ConsoleManager13consoleBufferD1Ev>
    80003f38:	00098513          	mv	a0,s3
    80003f3c:	0000b097          	auipc	ra,0xb
    80003f40:	2dc080e7          	jalr	732(ra) # 8000f218 <_Unwind_Resume>

0000000080003f44 <_ZN14ConsoleManagerD1Ev>:
ConsoleManager::~ConsoleManager(){
    80003f44:	fe010113          	addi	sp,sp,-32
    80003f48:	00113c23          	sd	ra,24(sp)
    80003f4c:	00813823          	sd	s0,16(sp)
    80003f50:	00913423          	sd	s1,8(sp)
    80003f54:	02010413          	addi	s0,sp,32
    80003f58:	00050493          	mv	s1,a0
    80003f5c:	12050513          	addi	a0,a0,288
    80003f60:	00000097          	auipc	ra,0x0
    80003f64:	efc080e7          	jalr	-260(ra) # 80003e5c <_ZN14ConsoleManager13consoleBufferD1Ev>
    80003f68:	00048513          	mv	a0,s1
    80003f6c:	00000097          	auipc	ra,0x0
    80003f70:	ef0080e7          	jalr	-272(ra) # 80003e5c <_ZN14ConsoleManager13consoleBufferD1Ev>
}
    80003f74:	01813083          	ld	ra,24(sp)
    80003f78:	01013403          	ld	s0,16(sp)
    80003f7c:	00813483          	ld	s1,8(sp)
    80003f80:	02010113          	addi	sp,sp,32
    80003f84:	00008067          	ret

0000000080003f88 <_ZN14ConsoleManager13consoleBuffer4initEv>:

void ConsoleManager::consoleBuffer::init(){
    80003f88:	ff010113          	addi	sp,sp,-16
    80003f8c:	00113423          	sd	ra,8(sp)
    80003f90:	00813023          	sd	s0,0(sp)
    80003f94:	01010413          	addi	s0,sp,16
    _sem::open(&sem, 0);
    80003f98:	00000593          	li	a1,0
    80003f9c:	ffffe097          	auipc	ra,0xffffe
    80003fa0:	b78080e7          	jalr	-1160(ra) # 80001b14 <_ZN4_sem4openEPPS_j>
}
    80003fa4:	00813083          	ld	ra,8(sp)
    80003fa8:	00013403          	ld	s0,0(sp)
    80003fac:	01010113          	addi	sp,sp,16
    80003fb0:	00008067          	ret

0000000080003fb4 <_ZN14ConsoleManager4initEv>:
void ConsoleManager::init(){
    80003fb4:	fe010113          	addi	sp,sp,-32
    80003fb8:	00113c23          	sd	ra,24(sp)
    80003fbc:	00813823          	sd	s0,16(sp)
    80003fc0:	00913423          	sd	s1,8(sp)
    80003fc4:	02010413          	addi	s0,sp,32
    80003fc8:	00050493          	mv	s1,a0
    inBuffer.init();
    80003fcc:	00000097          	auipc	ra,0x0
    80003fd0:	fbc080e7          	jalr	-68(ra) # 80003f88 <_ZN14ConsoleManager13consoleBuffer4initEv>
    outBuffer.init();
    80003fd4:	12048513          	addi	a0,s1,288
    80003fd8:	00000097          	auipc	ra,0x0
    80003fdc:	fb0080e7          	jalr	-80(ra) # 80003f88 <_ZN14ConsoleManager13consoleBuffer4initEv>
    waitingThreads = 0;
    80003fe0:	2404a023          	sw	zero,576(s1)
}
    80003fe4:	01813083          	ld	ra,24(sp)
    80003fe8:	01013403          	ld	s0,16(sp)
    80003fec:	00813483          	ld	s1,8(sp)
    80003ff0:	02010113          	addi	sp,sp,32
    80003ff4:	00008067          	ret

0000000080003ff8 <_ZN14ConsoleManager13consoleBuffer3putEc>:

void ConsoleManager::consoleBuffer::put(char c){
    80003ff8:	ff010113          	addi	sp,sp,-16
    80003ffc:	00113423          	sd	ra,8(sp)
    80004000:	00813023          	sd	s0,0(sp)
    80004004:	01010413          	addi	s0,sp,16
    buffer[tail] = c;
    80004008:	11053783          	ld	a5,272(a0)
    8000400c:	00f50733          	add	a4,a0,a5
    80004010:	00b70423          	sb	a1,8(a4)
    tail = (tail + 1) % BUFFER_SIZE;
    80004014:	00178793          	addi	a5,a5,1
    80004018:	0ff7f793          	andi	a5,a5,255
    8000401c:	10f53823          	sd	a5,272(a0)
    size++;
    80004020:	11853783          	ld	a5,280(a0)
    80004024:	00178793          	addi	a5,a5,1
    80004028:	10f53c23          	sd	a5,280(a0)
    sem_signal(sem);
    8000402c:	00053503          	ld	a0,0(a0)
    80004030:	ffffe097          	auipc	ra,0xffffe
    80004034:	a6c080e7          	jalr	-1428(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    80004038:	00813083          	ld	ra,8(sp)
    8000403c:	00013403          	ld	s0,0(sp)
    80004040:	01010113          	addi	sp,sp,16
    80004044:	00008067          	ret

0000000080004048 <_ZN14ConsoleManager13consoleBuffer3getEv>:

char ConsoleManager::consoleBuffer::get(){
    80004048:	fe010113          	addi	sp,sp,-32
    8000404c:	00113c23          	sd	ra,24(sp)
    80004050:	00813823          	sd	s0,16(sp)
    80004054:	00913423          	sd	s1,8(sp)
    80004058:	02010413          	addi	s0,sp,32
    8000405c:	00050493          	mv	s1,a0
    sem_wait(sem);
    80004060:	00053503          	ld	a0,0(a0)
    80004064:	ffffe097          	auipc	ra,0xffffe
    80004068:	a0c080e7          	jalr	-1524(ra) # 80001a70 <_Z8sem_waitP4_sem>
    char c = buffer[head];
    8000406c:	1084b783          	ld	a5,264(s1)
    80004070:	00f48733          	add	a4,s1,a5
    80004074:	00874503          	lbu	a0,8(a4)
    head = (head + 1) % BUFFER_SIZE;
    80004078:	00178793          	addi	a5,a5,1
    8000407c:	0ff7f793          	andi	a5,a5,255
    80004080:	10f4b423          	sd	a5,264(s1)
    size--;
    80004084:	1184b783          	ld	a5,280(s1)
    80004088:	fff78793          	addi	a5,a5,-1
    8000408c:	10f4bc23          	sd	a5,280(s1)
    return c;
}
    80004090:	01813083          	ld	ra,24(sp)
    80004094:	01013403          	ld	s0,16(sp)
    80004098:	00813483          	ld	s1,8(sp)
    8000409c:	02010113          	addi	sp,sp,32
    800040a0:	00008067          	ret

00000000800040a4 <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>:

bool ConsoleManager::consoleBuffer::isEmpty(){
    800040a4:	ff010113          	addi	sp,sp,-16
    800040a8:	00813423          	sd	s0,8(sp)
    800040ac:	01010413          	addi	s0,sp,16
    return size == 0;
    800040b0:	11853503          	ld	a0,280(a0)
}
    800040b4:	00153513          	seqz	a0,a0
    800040b8:	00813403          	ld	s0,8(sp)
    800040bc:	01010113          	addi	sp,sp,16
    800040c0:	00008067          	ret

00000000800040c4 <_ZN14ConsoleManager13consoleBuffer6isFullEv>:

bool ConsoleManager::consoleBuffer::isFull(){
    800040c4:	ff010113          	addi	sp,sp,-16
    800040c8:	00813423          	sd	s0,8(sp)
    800040cc:	01010413          	addi	s0,sp,16
    return size == BUFFER_SIZE;
    800040d0:	11853503          	ld	a0,280(a0)
    800040d4:	f0050513          	addi	a0,a0,-256
}
    800040d8:	00153513          	seqz	a0,a0
    800040dc:	00813403          	ld	s0,8(sp)
    800040e0:	01010113          	addi	sp,sp,16
    800040e4:	00008067          	ret

00000000800040e8 <_ZN14ConsoleManager4putcEc>:

void ConsoleManager::putc(char c){
    800040e8:	ff010113          	addi	sp,sp,-16
    800040ec:	00113423          	sd	ra,8(sp)
    800040f0:	00813023          	sd	s0,0(sp)
    800040f4:	01010413          	addi	s0,sp,16
    800040f8:	00050593          	mv	a1,a0
    instance->outBuffer.put(c);
    800040fc:	0000a517          	auipc	a0,0xa
    80004100:	ffc53503          	ld	a0,-4(a0) # 8000e0f8 <_ZN14ConsoleManager8instanceE>
    80004104:	12050513          	addi	a0,a0,288
    80004108:	00000097          	auipc	ra,0x0
    8000410c:	ef0080e7          	jalr	-272(ra) # 80003ff8 <_ZN14ConsoleManager13consoleBuffer3putEc>
}
    80004110:	00813083          	ld	ra,8(sp)
    80004114:	00013403          	ld	s0,0(sp)
    80004118:	01010113          	addi	sp,sp,16
    8000411c:	00008067          	ret

0000000080004120 <_ZN14ConsoleManager4getcEv>:

char ConsoleManager::getc(){
    80004120:	fe010113          	addi	sp,sp,-32
    80004124:	00113c23          	sd	ra,24(sp)
    80004128:	00813823          	sd	s0,16(sp)
    8000412c:	00913423          	sd	s1,8(sp)
    80004130:	02010413          	addi	s0,sp,32
    instance->waitingThreads++;
    80004134:	0000a497          	auipc	s1,0xa
    80004138:	fc448493          	addi	s1,s1,-60 # 8000e0f8 <_ZN14ConsoleManager8instanceE>
    8000413c:	0004b503          	ld	a0,0(s1)
    80004140:	24052783          	lw	a5,576(a0)
    80004144:	0017879b          	addiw	a5,a5,1
    80004148:	24f52023          	sw	a5,576(a0)
    char c = instance->inBuffer.get();
    8000414c:	00000097          	auipc	ra,0x0
    80004150:	efc080e7          	jalr	-260(ra) # 80004048 <_ZN14ConsoleManager13consoleBuffer3getEv>
    instance->waitingThreads--;
    80004154:	0004b703          	ld	a4,0(s1)
    80004158:	24072783          	lw	a5,576(a4)
    8000415c:	fff7879b          	addiw	a5,a5,-1
    80004160:	24f72023          	sw	a5,576(a4)
    return c;
}
    80004164:	01813083          	ld	ra,24(sp)
    80004168:	01013403          	ld	s0,16(sp)
    8000416c:	00813483          	ld	s1,8(sp)
    80004170:	02010113          	addi	sp,sp,32
    80004174:	00008067          	ret

0000000080004178 <_ZN14ConsoleManager8finishedEv>:

bool ConsoleManager::finished(){
    80004178:	fe010113          	addi	sp,sp,-32
    8000417c:	00113c23          	sd	ra,24(sp)
    80004180:	00813823          	sd	s0,16(sp)
    80004184:	00913423          	sd	s1,8(sp)
    80004188:	02010413          	addi	s0,sp,32
    return instance->outBuffer.isEmpty() && instance->waitingThreads == 0;
    8000418c:	0000a497          	auipc	s1,0xa
    80004190:	f6c4b483          	ld	s1,-148(s1) # 8000e0f8 <_ZN14ConsoleManager8instanceE>
    80004194:	12048513          	addi	a0,s1,288
    80004198:	00000097          	auipc	ra,0x0
    8000419c:	f0c080e7          	jalr	-244(ra) # 800040a4 <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>
    800041a0:	00050a63          	beqz	a0,800041b4 <_ZN14ConsoleManager8finishedEv+0x3c>
    800041a4:	2404a783          	lw	a5,576(s1)
    800041a8:	00078863          	beqz	a5,800041b8 <_ZN14ConsoleManager8finishedEv+0x40>
    800041ac:	00000513          	li	a0,0
    800041b0:	0080006f          	j	800041b8 <_ZN14ConsoleManager8finishedEv+0x40>
    800041b4:	00000513          	li	a0,0
}
    800041b8:	01813083          	ld	ra,24(sp)
    800041bc:	01013403          	ld	s0,16(sp)
    800041c0:	00813483          	ld	s1,8(sp)
    800041c4:	02010113          	addi	sp,sp,32
    800041c8:	00008067          	ret

00000000800041cc <_ZN14ConsoleManager13outputHandlerEv>:

void ConsoleManager::outputHandler(){
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
    800041cc:	0000a797          	auipc	a5,0xa
    800041d0:	e6c7b783          	ld	a5,-404(a5) # 8000e038 <_GLOBAL_OFFSET_TABLE_+0x10>
    800041d4:	0007b783          	ld	a5,0(a5)
    800041d8:	0007c783          	lbu	a5,0(a5)
    800041dc:	0207f793          	andi	a5,a5,32
    800041e0:	06078463          	beqz	a5,80004248 <_ZN14ConsoleManager13outputHandlerEv+0x7c>
void ConsoleManager::outputHandler(){
    800041e4:	fe010113          	addi	sp,sp,-32
    800041e8:	00113c23          	sd	ra,24(sp)
    800041ec:	00813823          	sd	s0,16(sp)
    800041f0:	00913423          	sd	s1,8(sp)
    800041f4:	02010413          	addi	s0,sp,32
        (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
    800041f8:	0000a797          	auipc	a5,0xa
    800041fc:	e507b783          	ld	a5,-432(a5) # 8000e048 <_GLOBAL_OFFSET_TABLE_+0x20>
    80004200:	0007b483          	ld	s1,0(a5)
    80004204:	0000a517          	auipc	a0,0xa
    80004208:	ef453503          	ld	a0,-268(a0) # 8000e0f8 <_ZN14ConsoleManager8instanceE>
    8000420c:	12050513          	addi	a0,a0,288
    80004210:	00000097          	auipc	ra,0x0
    80004214:	e38080e7          	jalr	-456(ra) # 80004048 <_ZN14ConsoleManager13consoleBuffer3getEv>
    80004218:	00a48023          	sb	a0,0(s1)
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
    8000421c:	0000a797          	auipc	a5,0xa
    80004220:	e1c7b783          	ld	a5,-484(a5) # 8000e038 <_GLOBAL_OFFSET_TABLE_+0x10>
    80004224:	0007b783          	ld	a5,0(a5)
    80004228:	0007c783          	lbu	a5,0(a5)
    8000422c:	0207f793          	andi	a5,a5,32
    80004230:	fc0794e3          	bnez	a5,800041f8 <_ZN14ConsoleManager13outputHandlerEv+0x2c>
    }
}
    80004234:	01813083          	ld	ra,24(sp)
    80004238:	01013403          	ld	s0,16(sp)
    8000423c:	00813483          	ld	s1,8(sp)
    80004240:	02010113          	addi	sp,sp,32
    80004244:	00008067          	ret
    80004248:	00008067          	ret

000000008000424c <_ZN14ConsoleManager12inputHandlerEv>:

void ConsoleManager::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    8000424c:	0000a797          	auipc	a5,0xa
    80004250:	dec7b783          	ld	a5,-532(a5) # 8000e038 <_GLOBAL_OFFSET_TABLE_+0x10>
    80004254:	0007b783          	ld	a5,0(a5)
    80004258:	0007c783          	lbu	a5,0(a5)
    8000425c:	0017f793          	andi	a5,a5,1
    80004260:	04078e63          	beqz	a5,800042bc <_ZN14ConsoleManager12inputHandlerEv+0x70>
void ConsoleManager::inputHandler(){
    80004264:	ff010113          	addi	sp,sp,-16
    80004268:	00113423          	sd	ra,8(sp)
    8000426c:	00813023          	sd	s0,0(sp)
    80004270:	01010413          	addi	s0,sp,16
        char ch =(*(char*)CONSOLE_RX_DATA);
    80004274:	0000a797          	auipc	a5,0xa
    80004278:	dbc7b783          	ld	a5,-580(a5) # 8000e030 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000427c:	0007b783          	ld	a5,0(a5)
        instance->inBuffer.put(ch);
    80004280:	0007c583          	lbu	a1,0(a5)
    80004284:	0000a517          	auipc	a0,0xa
    80004288:	e7453503          	ld	a0,-396(a0) # 8000e0f8 <_ZN14ConsoleManager8instanceE>
    8000428c:	00000097          	auipc	ra,0x0
    80004290:	d6c080e7          	jalr	-660(ra) # 80003ff8 <_ZN14ConsoleManager13consoleBuffer3putEc>
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80004294:	0000a797          	auipc	a5,0xa
    80004298:	da47b783          	ld	a5,-604(a5) # 8000e038 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000429c:	0007b783          	ld	a5,0(a5)
    800042a0:	0007c783          	lbu	a5,0(a5)
    800042a4:	0017f793          	andi	a5,a5,1
    800042a8:	fc0796e3          	bnez	a5,80004274 <_ZN14ConsoleManager12inputHandlerEv+0x28>
    }
    800042ac:	00813083          	ld	ra,8(sp)
    800042b0:	00013403          	ld	s0,0(sp)
    800042b4:	01010113          	addi	sp,sp,16
    800042b8:	00008067          	ret
    800042bc:	00008067          	ret

00000000800042c0 <exceptionHandler>:
#include "timer.h"
#include "assert.h"

// #include "console.h"

extern "C" void exceptionHandler(){
    800042c0:	fc010113          	addi	sp,sp,-64
    800042c4:	02113c23          	sd	ra,56(sp)
    800042c8:	02813823          	sd	s0,48(sp)
    800042cc:	02913423          	sd	s1,40(sp)
    800042d0:	03213023          	sd	s2,32(sp)
    800042d4:	01313c23          	sd	s3,24(sp)
    800042d8:	01413823          	sd	s4,16(sp)
    800042dc:	01513423          	sd	s5,8(sp)
    800042e0:	01613023          	sd	s6,0(sp)
    800042e4:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    800042e8:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    800042ec:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    800042f0:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    800042f4:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    800042f8:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    800042fc:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80004300:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80004304:	141024f3          	csrr	s1,sepc


    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80004308:	ff870613          	addi	a2,a4,-8
    8000430c:	00100693          	li	a3,1
    80004310:	04c6fc63          	bgeu	a3,a2,80004368 <exceptionHandler+0xa8>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        // __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    80004314:	00500793          	li	a5,5
    80004318:	22f70263          	beq	a4,a5,8000453c <exceptionHandler+0x27c>
                ConsoleManager::putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    8000431c:	00700793          	li	a5,7
    80004320:	3cf70a63          	beq	a4,a5,800046f4 <exceptionHandler+0x434>
                ConsoleManager::putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    80004324:	fff00793          	li	a5,-1
    80004328:	03f79793          	slli	a5,a5,0x3f
    8000432c:	00178793          	addi	a5,a5,1
    80004330:	58f70463          	beq	a4,a5,800048b8 <exceptionHandler+0x5f8>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    80004334:	fff00793          	li	a5,-1
    80004338:	03f79793          	slli	a5,a5,0x3f
    8000433c:	00978793          	addi	a5,a5,9
    80004340:	08f71c63          	bne	a4,a5,800043d8 <exceptionHandler+0x118>
    {   
        int irq = plic_claim();
    80004344:	00005097          	auipc	ra,0x5
    80004348:	9f0080e7          	jalr	-1552(ra) # 80008d34 <plic_claim>
    8000434c:	00050493          	mv	s1,a0
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    80004350:	00a00793          	li	a5,10
    80004354:	5cf50463          	beq	a0,a5,8000491c <exceptionHandler+0x65c>
        plic_complete(irq);
    80004358:	00048513          	mv	a0,s1
    8000435c:	00005097          	auipc	ra,0x5
    80004360:	a10080e7          	jalr	-1520(ra) # 80008d6c <plic_complete>
    80004364:	0740006f          	j	800043d8 <exceptionHandler+0x118>
        switch(a0){
    80004368:	04200713          	li	a4,66
    8000436c:	02f76463          	bltu	a4,a5,80004394 <exceptionHandler+0xd4>
    80004370:	1a078e63          	beqz	a5,8000452c <exceptionHandler+0x26c>
    80004374:	1cf76063          	bltu	a4,a5,80004534 <exceptionHandler+0x274>
    80004378:	00279793          	slli	a5,a5,0x2
    8000437c:	00007717          	auipc	a4,0x7
    80004380:	f7070713          	addi	a4,a4,-144 # 8000b2ec <CONSOLE_STATUS+0x2dc>
    80004384:	00e787b3          	add	a5,a5,a4
    80004388:	0007a783          	lw	a5,0(a5)
    8000438c:	00e787b3          	add	a5,a5,a4
    80004390:	00078067          	jr	a5
    80004394:	0ff00713          	li	a4,255
    80004398:	02e79663          	bne	a5,a4,800043c4 <exceptionHandler+0x104>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    8000439c:	00000793          	li	a5,0
    800043a0:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800043a4:	00448493          	addi	s1,s1,4
    800043a8:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800043ac:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    800043b0:	10000793          	li	a5,256
    800043b4:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800043b8:	00200793          	li	a5,2
    800043bc:	1447b073          	csrc	sip,a5
                return;
    800043c0:	0180006f          	j	800043d8 <exceptionHandler+0x118>
        switch(a0){
    800043c4:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800043c8:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800043cc:	00448493          	addi	s1,s1,4
    800043d0:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800043d4:	10091073          	csrw	sstatus,s2
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    800043d8:	03813083          	ld	ra,56(sp)
    800043dc:	03013403          	ld	s0,48(sp)
    800043e0:	02813483          	ld	s1,40(sp)
    800043e4:	02013903          	ld	s2,32(sp)
    800043e8:	01813983          	ld	s3,24(sp)
    800043ec:	01013a03          	ld	s4,16(sp)
    800043f0:	00813a83          	ld	s5,8(sp)
    800043f4:	00013b03          	ld	s6,0(sp)
    800043f8:	04010113          	addi	sp,sp,64
    800043fc:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80004400:	00098593          	mv	a1,s3
    80004404:	0000a797          	auipc	a5,0xa
    80004408:	c4c7b783          	ld	a5,-948(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000440c:	0007b503          	ld	a0,0(a5)
    80004410:	fffff097          	auipc	ra,0xfffff
    80004414:	374080e7          	jalr	884(ra) # 80003784 <_ZN11HeapManager12heapAllocateEm>
                break;
    80004418:	fb1ff06f          	j	800043c8 <exceptionHandler+0x108>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    8000441c:	00098593          	mv	a1,s3
    80004420:	0000a797          	auipc	a5,0xa
    80004424:	c307b783          	ld	a5,-976(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004428:	0007b503          	ld	a0,0(a5)
    8000442c:	00000097          	auipc	ra,0x0
    80004430:	9b0080e7          	jalr	-1616(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
                break;
    80004434:	f95ff06f          	j	800043c8 <exceptionHandler+0x108>
                ConsoleManager::putc('\0'); /// removing this line causes everything to break
    80004438:	00000513          	li	a0,0
    8000443c:	00000097          	auipc	ra,0x0
    80004440:	cac080e7          	jalr	-852(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    80004444:	00100713          	li	a4,1
    80004448:	000b0693          	mv	a3,s6
    8000444c:	000a8613          	mv	a2,s5
    80004450:	000a0593          	mv	a1,s4
    80004454:	00098513          	mv	a0,s3
    80004458:	fffff097          	auipc	ra,0xfffff
    8000445c:	a00080e7          	jalr	-1536(ra) # 80002e58 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80004460:	f69ff06f          	j	800043c8 <exceptionHandler+0x108>
                returnVal = _thread::currentThread->exit();
    80004464:	fffff097          	auipc	ra,0xfffff
    80004468:	f54080e7          	jalr	-172(ra) # 800033b8 <_ZN7_thread4exitEv>
                break;
    8000446c:	f5dff06f          	j	800043c8 <exceptionHandler+0x108>
                _thread::dispatch();
    80004470:	fffff097          	auipc	ra,0xfffff
    80004474:	cec080e7          	jalr	-788(ra) # 8000315c <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80004478:	00000513          	li	a0,0
                break;
    8000447c:	f4dff06f          	j	800043c8 <exceptionHandler+0x108>
                _thread::currentThread->join((thread_t)a1);
    80004480:	00098593          	mv	a1,s3
    80004484:	0000a797          	auipc	a5,0xa
    80004488:	bec7b783          	ld	a5,-1044(a5) # 8000e070 <_GLOBAL_OFFSET_TABLE_+0x48>
    8000448c:	0007b503          	ld	a0,0(a5)
    80004490:	fffff097          	auipc	ra,0xfffff
    80004494:	d68080e7          	jalr	-664(ra) # 800031f8 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80004498:	00000513          	li	a0,0
                break;
    8000449c:	f2dff06f          	j	800043c8 <exceptionHandler+0x108>
                _sem::open((sem_t*)a1, unsigned(a2));
    800044a0:	000a059b          	sext.w	a1,s4
    800044a4:	00098513          	mv	a0,s3
    800044a8:	ffffd097          	auipc	ra,0xffffd
    800044ac:	66c080e7          	jalr	1644(ra) # 80001b14 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    800044b0:	00000513          	li	a0,0
                break;
    800044b4:	f15ff06f          	j	800043c8 <exceptionHandler+0x108>
                _sem::close((sem_t)a1);
    800044b8:	00098513          	mv	a0,s3
    800044bc:	ffffd097          	auipc	ra,0xffffd
    800044c0:	6c0080e7          	jalr	1728(ra) # 80001b7c <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    800044c4:	00000513          	li	a0,0
                break;
    800044c8:	f01ff06f          	j	800043c8 <exceptionHandler+0x108>
                _sem::wait((sem_t)a1);
    800044cc:	00098513          	mv	a0,s3
    800044d0:	ffffd097          	auipc	ra,0xffffd
    800044d4:	718080e7          	jalr	1816(ra) # 80001be8 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    800044d8:	00000513          	li	a0,0
                break;
    800044dc:	eedff06f          	j	800043c8 <exceptionHandler+0x108>
                _sem::signal((sem_t)a1);
    800044e0:	00098513          	mv	a0,s3
    800044e4:	ffffd097          	auipc	ra,0xffffd
    800044e8:	7b4080e7          	jalr	1972(ra) # 80001c98 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    800044ec:	00000513          	li	a0,0
                break;
    800044f0:	ed9ff06f          	j	800043c8 <exceptionHandler+0x108>
                returnVal = Timer::getInstance().sleep(a1);
    800044f4:	ffffd097          	auipc	ra,0xffffd
    800044f8:	1a4080e7          	jalr	420(ra) # 80001698 <_ZN5Timer11getInstanceEv>
    800044fc:	00098593          	mv	a1,s3
    80004500:	ffffd097          	auipc	ra,0xffffd
    80004504:	294080e7          	jalr	660(ra) # 80001794 <_ZN5Timer5sleepEm>
                break;
    80004508:	ec1ff06f          	j	800043c8 <exceptionHandler+0x108>
                returnVal = ConsoleManager::getc();
    8000450c:	00000097          	auipc	ra,0x0
    80004510:	c14080e7          	jalr	-1004(ra) # 80004120 <_ZN14ConsoleManager4getcEv>
                break;
    80004514:	eb5ff06f          	j	800043c8 <exceptionHandler+0x108>
                ConsoleManager::putc(a1);
    80004518:	0ff9f513          	andi	a0,s3,255
    8000451c:	00000097          	auipc	ra,0x0
    80004520:	bcc080e7          	jalr	-1076(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
    uint64 returnVal = 0;
    80004524:	00000513          	li	a0,0
                break;
    80004528:	ea1ff06f          	j	800043c8 <exceptionHandler+0x108>
        switch(a0){
    8000452c:	00000513          	li	a0,0
    80004530:	e99ff06f          	j	800043c8 <exceptionHandler+0x108>
    80004534:	00000513          	li	a0,0
    80004538:	e91ff06f          	j	800043c8 <exceptionHandler+0x108>
        ConsoleManager::putc('\n');
    8000453c:	00a00513          	li	a0,10
    80004540:	00000097          	auipc	ra,0x0
    80004544:	ba8080e7          	jalr	-1112(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('E');
    80004548:	04500513          	li	a0,69
    8000454c:	00000097          	auipc	ra,0x0
    80004550:	b9c080e7          	jalr	-1124(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004554:	07200513          	li	a0,114
    80004558:	00000097          	auipc	ra,0x0
    8000455c:	b90080e7          	jalr	-1136(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004560:	07200513          	li	a0,114
    80004564:	00000097          	auipc	ra,0x0
    80004568:	b84080e7          	jalr	-1148(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('o');
    8000456c:	06f00513          	li	a0,111
    80004570:	00000097          	auipc	ra,0x0
    80004574:	b78080e7          	jalr	-1160(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004578:	07200513          	li	a0,114
    8000457c:	00000097          	auipc	ra,0x0
    80004580:	b6c080e7          	jalr	-1172(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004584:	03a00513          	li	a0,58
    80004588:	00000097          	auipc	ra,0x0
    8000458c:	b60080e7          	jalr	-1184(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004590:	02000513          	li	a0,32
    80004594:	00000097          	auipc	ra,0x0
    80004598:	b54080e7          	jalr	-1196(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    8000459c:	06900513          	li	a0,105
    800045a0:	00000097          	auipc	ra,0x0
    800045a4:	b48080e7          	jalr	-1208(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    800045a8:	06c00513          	li	a0,108
    800045ac:	00000097          	auipc	ra,0x0
    800045b0:	b3c080e7          	jalr	-1220(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    800045b4:	06c00513          	li	a0,108
    800045b8:	00000097          	auipc	ra,0x0
    800045bc:	b30080e7          	jalr	-1232(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    800045c0:	06500513          	li	a0,101
    800045c4:	00000097          	auipc	ra,0x0
    800045c8:	b24080e7          	jalr	-1244(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('g');
    800045cc:	06700513          	li	a0,103
    800045d0:	00000097          	auipc	ra,0x0
    800045d4:	b18080e7          	jalr	-1256(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    800045d8:	06100513          	li	a0,97
    800045dc:	00000097          	auipc	ra,0x0
    800045e0:	b0c080e7          	jalr	-1268(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    800045e4:	06c00513          	li	a0,108
    800045e8:	00000097          	auipc	ra,0x0
    800045ec:	b00080e7          	jalr	-1280(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    800045f0:	02000513          	li	a0,32
    800045f4:	00000097          	auipc	ra,0x0
    800045f8:	af4080e7          	jalr	-1292(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800045fc:	07200513          	li	a0,114
    80004600:	00000097          	auipc	ra,0x0
    80004604:	ae8080e7          	jalr	-1304(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004608:	06500513          	li	a0,101
    8000460c:	00000097          	auipc	ra,0x0
    80004610:	adc080e7          	jalr	-1316(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    80004614:	06100513          	li	a0,97
    80004618:	00000097          	auipc	ra,0x0
    8000461c:	ad0080e7          	jalr	-1328(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('d');
    80004620:	06400513          	li	a0,100
    80004624:	00000097          	auipc	ra,0x0
    80004628:	ac4080e7          	jalr	-1340(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('!');
    8000462c:	02100513          	li	a0,33
    80004630:	00000097          	auipc	ra,0x0
    80004634:	ab8080e7          	jalr	-1352(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('\n');
    80004638:	00a00513          	li	a0,10
    8000463c:	00000097          	auipc	ra,0x0
    80004640:	aac080e7          	jalr	-1364(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('P');
    80004644:	05000513          	li	a0,80
    80004648:	00000097          	auipc	ra,0x0
    8000464c:	aa0080e7          	jalr	-1376(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('C');
    80004650:	04300513          	li	a0,67
    80004654:	00000097          	auipc	ra,0x0
    80004658:	a94080e7          	jalr	-1388(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    8000465c:	03a00513          	li	a0,58
    80004660:	00000097          	auipc	ra,0x0
    80004664:	a88080e7          	jalr	-1400(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004668:	02000513          	li	a0,32
    8000466c:	00000097          	auipc	ra,0x0
    80004670:	a7c080e7          	jalr	-1412(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('0');
    80004674:	03000513          	li	a0,48
    80004678:	00000097          	auipc	ra,0x0
    8000467c:	a70080e7          	jalr	-1424(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('x');
    80004680:	07800513          	li	a0,120
    80004684:	00000097          	auipc	ra,0x0
    80004688:	a64080e7          	jalr	-1436(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    8000468c:	00f00913          	li	s2,15
    80004690:	0140006f          	j	800046a4 <exceptionHandler+0x3e4>
                ConsoleManager::putc('A' + tmp - 10);
    80004694:	03750513          	addi	a0,a0,55
    80004698:	00000097          	auipc	ra,0x0
    8000469c:	a50080e7          	jalr	-1456(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    800046a0:	fff9091b          	addiw	s2,s2,-1
    800046a4:	02094463          	bltz	s2,800046cc <exceptionHandler+0x40c>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    800046a8:	0029151b          	slliw	a0,s2,0x2
    800046ac:	00a4d533          	srl	a0,s1,a0
    800046b0:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    800046b4:	00900793          	li	a5,9
    800046b8:	fca7eee3          	bltu	a5,a0,80004694 <exceptionHandler+0x3d4>
                ConsoleManager::putc('0' + tmp);
    800046bc:	03050513          	addi	a0,a0,48
    800046c0:	00000097          	auipc	ra,0x0
    800046c4:	a28080e7          	jalr	-1496(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
    800046c8:	fd9ff06f          	j	800046a0 <exceptionHandler+0x3e0>
        assert(false);
    800046cc:	00007697          	auipc	a3,0x7
    800046d0:	bbc68693          	addi	a3,a3,-1092 # 8000b288 <CONSOLE_STATUS+0x278>
    800046d4:	08700613          	li	a2,135
    800046d8:	00007597          	auipc	a1,0x7
    800046dc:	bc858593          	addi	a1,a1,-1080 # 8000b2a0 <CONSOLE_STATUS+0x290>
    800046e0:	00007517          	auipc	a0,0x7
    800046e4:	be050513          	addi	a0,a0,-1056 # 8000b2c0 <CONSOLE_STATUS+0x2b0>
    800046e8:	ffffe097          	auipc	ra,0xffffe
    800046ec:	9b4080e7          	jalr	-1612(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    800046f0:	ce9ff06f          	j	800043d8 <exceptionHandler+0x118>
        ConsoleManager::putc('\n');
    800046f4:	00a00513          	li	a0,10
    800046f8:	00000097          	auipc	ra,0x0
    800046fc:	9f0080e7          	jalr	-1552(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('E');
    80004700:	04500513          	li	a0,69
    80004704:	00000097          	auipc	ra,0x0
    80004708:	9e4080e7          	jalr	-1564(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    8000470c:	07200513          	li	a0,114
    80004710:	00000097          	auipc	ra,0x0
    80004714:	9d8080e7          	jalr	-1576(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004718:	07200513          	li	a0,114
    8000471c:	00000097          	auipc	ra,0x0
    80004720:	9cc080e7          	jalr	-1588(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('o');
    80004724:	06f00513          	li	a0,111
    80004728:	00000097          	auipc	ra,0x0
    8000472c:	9c0080e7          	jalr	-1600(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004730:	07200513          	li	a0,114
    80004734:	00000097          	auipc	ra,0x0
    80004738:	9b4080e7          	jalr	-1612(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    8000473c:	03a00513          	li	a0,58
    80004740:	00000097          	auipc	ra,0x0
    80004744:	9a8080e7          	jalr	-1624(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004748:	02000513          	li	a0,32
    8000474c:	00000097          	auipc	ra,0x0
    80004750:	99c080e7          	jalr	-1636(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80004754:	06900513          	li	a0,105
    80004758:	00000097          	auipc	ra,0x0
    8000475c:	990080e7          	jalr	-1648(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004760:	06c00513          	li	a0,108
    80004764:	00000097          	auipc	ra,0x0
    80004768:	984080e7          	jalr	-1660(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    8000476c:	06c00513          	li	a0,108
    80004770:	00000097          	auipc	ra,0x0
    80004774:	978080e7          	jalr	-1672(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004778:	06500513          	li	a0,101
    8000477c:	00000097          	auipc	ra,0x0
    80004780:	96c080e7          	jalr	-1684(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('g');
    80004784:	06700513          	li	a0,103
    80004788:	00000097          	auipc	ra,0x0
    8000478c:	960080e7          	jalr	-1696(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    80004790:	06100513          	li	a0,97
    80004794:	00000097          	auipc	ra,0x0
    80004798:	954080e7          	jalr	-1708(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    8000479c:	06c00513          	li	a0,108
    800047a0:	00000097          	auipc	ra,0x0
    800047a4:	948080e7          	jalr	-1720(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    800047a8:	02000513          	li	a0,32
    800047ac:	00000097          	auipc	ra,0x0
    800047b0:	93c080e7          	jalr	-1732(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('w');
    800047b4:	07700513          	li	a0,119
    800047b8:	00000097          	auipc	ra,0x0
    800047bc:	930080e7          	jalr	-1744(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800047c0:	07200513          	li	a0,114
    800047c4:	00000097          	auipc	ra,0x0
    800047c8:	924080e7          	jalr	-1756(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    800047cc:	06900513          	li	a0,105
    800047d0:	00000097          	auipc	ra,0x0
    800047d4:	918080e7          	jalr	-1768(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('t');
    800047d8:	07400513          	li	a0,116
    800047dc:	00000097          	auipc	ra,0x0
    800047e0:	90c080e7          	jalr	-1780(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    800047e4:	06500513          	li	a0,101
    800047e8:	00000097          	auipc	ra,0x0
    800047ec:	900080e7          	jalr	-1792(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('!');
    800047f0:	02100513          	li	a0,33
    800047f4:	00000097          	auipc	ra,0x0
    800047f8:	8f4080e7          	jalr	-1804(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('\n');
    800047fc:	00a00513          	li	a0,10
    80004800:	00000097          	auipc	ra,0x0
    80004804:	8e8080e7          	jalr	-1816(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('P');
    80004808:	05000513          	li	a0,80
    8000480c:	00000097          	auipc	ra,0x0
    80004810:	8dc080e7          	jalr	-1828(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('C');
    80004814:	04300513          	li	a0,67
    80004818:	00000097          	auipc	ra,0x0
    8000481c:	8d0080e7          	jalr	-1840(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004820:	03a00513          	li	a0,58
    80004824:	00000097          	auipc	ra,0x0
    80004828:	8c4080e7          	jalr	-1852(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    8000482c:	02000513          	li	a0,32
    80004830:	00000097          	auipc	ra,0x0
    80004834:	8b8080e7          	jalr	-1864(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('0');
    80004838:	03000513          	li	a0,48
    8000483c:	00000097          	auipc	ra,0x0
    80004840:	8ac080e7          	jalr	-1876(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('x');
    80004844:	07800513          	li	a0,120
    80004848:	00000097          	auipc	ra,0x0
    8000484c:	8a0080e7          	jalr	-1888(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004850:	00f00913          	li	s2,15
    80004854:	0140006f          	j	80004868 <exceptionHandler+0x5a8>
                ConsoleManager::putc('A' + tmp - 10);
    80004858:	03750513          	addi	a0,a0,55
    8000485c:	00000097          	auipc	ra,0x0
    80004860:	88c080e7          	jalr	-1908(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004864:	fff9091b          	addiw	s2,s2,-1
    80004868:	02094463          	bltz	s2,80004890 <exceptionHandler+0x5d0>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    8000486c:	0029151b          	slliw	a0,s2,0x2
    80004870:	00a4d533          	srl	a0,s1,a0
    80004874:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004878:	00900793          	li	a5,9
    8000487c:	fca7eee3          	bltu	a5,a0,80004858 <exceptionHandler+0x598>
                ConsoleManager::putc('0' + tmp);
    80004880:	03050513          	addi	a0,a0,48
    80004884:	00000097          	auipc	ra,0x0
    80004888:	864080e7          	jalr	-1948(ra) # 800040e8 <_ZN14ConsoleManager4putcEc>
    8000488c:	fd9ff06f          	j	80004864 <exceptionHandler+0x5a4>
        assert(false);
    80004890:	00007697          	auipc	a3,0x7
    80004894:	9f868693          	addi	a3,a3,-1544 # 8000b288 <CONSOLE_STATUS+0x278>
    80004898:	0af00613          	li	a2,175
    8000489c:	00007597          	auipc	a1,0x7
    800048a0:	a0458593          	addi	a1,a1,-1532 # 8000b2a0 <CONSOLE_STATUS+0x290>
    800048a4:	00007517          	auipc	a0,0x7
    800048a8:	a1c50513          	addi	a0,a0,-1508 # 8000b2c0 <CONSOLE_STATUS+0x2b0>
    800048ac:	ffffd097          	auipc	ra,0xffffd
    800048b0:	7f0080e7          	jalr	2032(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    800048b4:	b25ff06f          	j	800043d8 <exceptionHandler+0x118>
        Timer::getInstance().tick();
    800048b8:	ffffd097          	auipc	ra,0xffffd
    800048bc:	de0080e7          	jalr	-544(ra) # 80001698 <_ZN5Timer11getInstanceEv>
    800048c0:	ffffd097          	auipc	ra,0xffffd
    800048c4:	e3c080e7          	jalr	-452(ra) # 800016fc <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    800048c8:	00009797          	auipc	a5,0x9
    800048cc:	7a87b783          	ld	a5,1960(a5) # 8000e070 <_GLOBAL_OFFSET_TABLE_+0x48>
    800048d0:	0007b503          	ld	a0,0(a5)
    800048d4:	fffff097          	auipc	ra,0xfffff
    800048d8:	a54080e7          	jalr	-1452(ra) # 80003328 <_ZN7_thread4tickEv>
    800048dc:	00051c63          	bnez	a0,800048f4 <exceptionHandler+0x634>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    800048e0:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800048e4:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800048e8:	00200793          	li	a5,2
    800048ec:	1447b073          	csrc	sip,a5
    800048f0:	ae9ff06f          	j	800043d8 <exceptionHandler+0x118>
        assert(_thread::currentThread->tick() == 0);
    800048f4:	00007697          	auipc	a3,0x7
    800048f8:	99468693          	addi	a3,a3,-1644 # 8000b288 <CONSOLE_STATUS+0x278>
    800048fc:	0b300613          	li	a2,179
    80004900:	00007597          	auipc	a1,0x7
    80004904:	9a058593          	addi	a1,a1,-1632 # 8000b2a0 <CONSOLE_STATUS+0x290>
    80004908:	00007517          	auipc	a0,0x7
    8000490c:	9c050513          	addi	a0,a0,-1600 # 8000b2c8 <CONSOLE_STATUS+0x2b8>
    80004910:	ffffd097          	auipc	ra,0xffffd
    80004914:	78c080e7          	jalr	1932(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80004918:	fc9ff06f          	j	800048e0 <exceptionHandler+0x620>
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    8000491c:	00000097          	auipc	ra,0x0
    80004920:	930080e7          	jalr	-1744(ra) # 8000424c <_ZN14ConsoleManager12inputHandlerEv>
    80004924:	a35ff06f          	j	80004358 <exceptionHandler+0x98>

0000000080004928 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80004928:	fe010113          	addi	sp,sp,-32
    8000492c:	00113c23          	sd	ra,24(sp)
    80004930:	00813823          	sd	s0,16(sp)
    80004934:	00913423          	sd	s1,8(sp)
    80004938:	02010413          	addi	s0,sp,32
    8000493c:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80004940:	00009797          	auipc	a5,0x9
    80004944:	7c07b783          	ld	a5,1984(a5) # 8000e100 <_ZN9Scheduler9singletonE>
    80004948:	02079463          	bnez	a5,80004970 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    8000494c:	00009797          	auipc	a5,0x9
    80004950:	7a97ba23          	sd	s1,1972(a5) # 8000e100 <_ZN9Scheduler9singletonE>
    head = 0;
    80004954:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80004958:	0004b423          	sd	zero,8(s1)
}
    8000495c:	01813083          	ld	ra,24(sp)
    80004960:	01013403          	ld	s0,16(sp)
    80004964:	00813483          	ld	s1,8(sp)
    80004968:	02010113          	addi	sp,sp,32
    8000496c:	00008067          	ret
    assert(singleton == 0);
    80004970:	00007697          	auipc	a3,0x7
    80004974:	a8868693          	addi	a3,a3,-1400 # 8000b3f8 <CONSOLE_STATUS+0x3e8>
    80004978:	01700613          	li	a2,23
    8000497c:	00007597          	auipc	a1,0x7
    80004980:	a9458593          	addi	a1,a1,-1388 # 8000b410 <CONSOLE_STATUS+0x400>
    80004984:	00007517          	auipc	a0,0x7
    80004988:	a9c50513          	addi	a0,a0,-1380 # 8000b420 <CONSOLE_STATUS+0x410>
    8000498c:	ffffd097          	auipc	ra,0xffffd
    80004990:	710080e7          	jalr	1808(ra) # 8000209c <_Z13assert_failedPKcS0_jS0_>
    80004994:	fb9ff06f          	j	8000494c <_ZN9SchedulerC1Ev+0x24>

0000000080004998 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80004998:	ff010113          	addi	sp,sp,-16
    8000499c:	00813423          	sd	s0,8(sp)
    800049a0:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    800049a4:	00009797          	auipc	a5,0x9
    800049a8:	75c7b783          	ld	a5,1884(a5) # 8000e100 <_ZN9Scheduler9singletonE>
    800049ac:	0007b503          	ld	a0,0(a5)
}
    800049b0:	00153513          	seqz	a0,a0
    800049b4:	00813403          	ld	s0,8(sp)
    800049b8:	01010113          	addi	sp,sp,16
    800049bc:	00008067          	ret

00000000800049c0 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    800049c0:	fe010113          	addi	sp,sp,-32
    800049c4:	00113c23          	sd	ra,24(sp)
    800049c8:	00813823          	sd	s0,16(sp)
    800049cc:	00913423          	sd	s1,8(sp)
    800049d0:	01213023          	sd	s2,0(sp)
    800049d4:	02010413          	addi	s0,sp,32
    800049d8:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    800049dc:	00009917          	auipc	s2,0x9
    800049e0:	72493903          	ld	s2,1828(s2) # 8000e100 <_ZN9Scheduler9singletonE>
    800049e4:	00093783          	ld	a5,0(s2)
    800049e8:	14078263          	beqz	a5,80004b2c <_ZN9Scheduler3putEP7_thread+0x16c>
        singleton->head = singleton->tail = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    800049ec:	00893903          	ld	s2,8(s2)
    800049f0:	00100593          	li	a1,1
    800049f4:	00009797          	auipc	a5,0x9
    800049f8:	65c7b783          	ld	a5,1628(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    800049fc:	0007b503          	ld	a0,0(a5)
    80004a00:	fffff097          	auipc	ra,0xfffff
    80004a04:	d84080e7          	jalr	-636(ra) # 80003784 <_ZN11HeapManager12heapAllocateEm>
    80004a08:	00a90423          	sb	a0,8(s2)
    80004a0c:	00855793          	srli	a5,a0,0x8
    80004a10:	00f904a3          	sb	a5,9(s2)
    80004a14:	01055793          	srli	a5,a0,0x10
    80004a18:	00f90523          	sb	a5,10(s2)
    80004a1c:	0185579b          	srliw	a5,a0,0x18
    80004a20:	00f905a3          	sb	a5,11(s2)
    80004a24:	02055793          	srli	a5,a0,0x20
    80004a28:	00f90623          	sb	a5,12(s2)
    80004a2c:	02855793          	srli	a5,a0,0x28
    80004a30:	00f906a3          	sb	a5,13(s2)
    80004a34:	03055793          	srli	a5,a0,0x30
    80004a38:	00f90723          	sb	a5,14(s2)
    80004a3c:	03855513          	srli	a0,a0,0x38
    80004a40:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80004a44:	00009617          	auipc	a2,0x9
    80004a48:	6bc60613          	addi	a2,a2,1724 # 8000e100 <_ZN9Scheduler9singletonE>
    80004a4c:	00063583          	ld	a1,0(a2)
    80004a50:	0085b703          	ld	a4,8(a1)
    80004a54:	00874783          	lbu	a5,8(a4)
    80004a58:	00974683          	lbu	a3,9(a4)
    80004a5c:	00869693          	slli	a3,a3,0x8
    80004a60:	00f6e6b3          	or	a3,a3,a5
    80004a64:	00a74783          	lbu	a5,10(a4)
    80004a68:	01079793          	slli	a5,a5,0x10
    80004a6c:	00d7e6b3          	or	a3,a5,a3
    80004a70:	00b74783          	lbu	a5,11(a4)
    80004a74:	01879793          	slli	a5,a5,0x18
    80004a78:	00d7e7b3          	or	a5,a5,a3
    80004a7c:	00c74683          	lbu	a3,12(a4)
    80004a80:	02069693          	slli	a3,a3,0x20
    80004a84:	00f6e7b3          	or	a5,a3,a5
    80004a88:	00d74683          	lbu	a3,13(a4)
    80004a8c:	02869693          	slli	a3,a3,0x28
    80004a90:	00f6e6b3          	or	a3,a3,a5
    80004a94:	00e74783          	lbu	a5,14(a4)
    80004a98:	03079793          	slli	a5,a5,0x30
    80004a9c:	00d7e6b3          	or	a3,a5,a3
    80004aa0:	00f74783          	lbu	a5,15(a4)
    80004aa4:	03879793          	slli	a5,a5,0x38
    80004aa8:	00d7e7b3          	or	a5,a5,a3
    80004aac:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80004ab0:	00978023          	sb	s1,0(a5)
    80004ab4:	0084d713          	srli	a4,s1,0x8
    80004ab8:	00e780a3          	sb	a4,1(a5)
    80004abc:	0104d713          	srli	a4,s1,0x10
    80004ac0:	00e78123          	sb	a4,2(a5)
    80004ac4:	0184d71b          	srliw	a4,s1,0x18
    80004ac8:	00e781a3          	sb	a4,3(a5)
    80004acc:	0204d713          	srli	a4,s1,0x20
    80004ad0:	00e78223          	sb	a4,4(a5)
    80004ad4:	0284d713          	srli	a4,s1,0x28
    80004ad8:	00e782a3          	sb	a4,5(a5)
    80004adc:	0304d713          	srli	a4,s1,0x30
    80004ae0:	00e78323          	sb	a4,6(a5)
    80004ae4:	0384d493          	srli	s1,s1,0x38
    80004ae8:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80004aec:	00063783          	ld	a5,0(a2)
    80004af0:	0087b783          	ld	a5,8(a5)
    80004af4:	00078423          	sb	zero,8(a5)
    80004af8:	000784a3          	sb	zero,9(a5)
    80004afc:	00078523          	sb	zero,10(a5)
    80004b00:	000785a3          	sb	zero,11(a5)
    80004b04:	00078623          	sb	zero,12(a5)
    80004b08:	000786a3          	sb	zero,13(a5)
    80004b0c:	00078723          	sb	zero,14(a5)
    80004b10:	000787a3          	sb	zero,15(a5)
    }
}
    80004b14:	01813083          	ld	ra,24(sp)
    80004b18:	01013403          	ld	s0,16(sp)
    80004b1c:	00813483          	ld	s1,8(sp)
    80004b20:	00013903          	ld	s2,0(sp)
    80004b24:	02010113          	addi	sp,sp,32
    80004b28:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80004b2c:	00100593          	li	a1,1
    80004b30:	00009797          	auipc	a5,0x9
    80004b34:	5207b783          	ld	a5,1312(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004b38:	0007b503          	ld	a0,0(a5)
    80004b3c:	fffff097          	auipc	ra,0xfffff
    80004b40:	c48080e7          	jalr	-952(ra) # 80003784 <_ZN11HeapManager12heapAllocateEm>
    80004b44:	00a93423          	sd	a0,8(s2)
    80004b48:	00009717          	auipc	a4,0x9
    80004b4c:	5b870713          	addi	a4,a4,1464 # 8000e100 <_ZN9Scheduler9singletonE>
    80004b50:	00073783          	ld	a5,0(a4)
    80004b54:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80004b58:	00073783          	ld	a5,0(a4)
    80004b5c:	0007b783          	ld	a5,0(a5)
    80004b60:	00978023          	sb	s1,0(a5)
    80004b64:	0084d693          	srli	a3,s1,0x8
    80004b68:	00d780a3          	sb	a3,1(a5)
    80004b6c:	0104d693          	srli	a3,s1,0x10
    80004b70:	00d78123          	sb	a3,2(a5)
    80004b74:	0184d69b          	srliw	a3,s1,0x18
    80004b78:	00d781a3          	sb	a3,3(a5)
    80004b7c:	0204d693          	srli	a3,s1,0x20
    80004b80:	00d78223          	sb	a3,4(a5)
    80004b84:	0284d693          	srli	a3,s1,0x28
    80004b88:	00d782a3          	sb	a3,5(a5)
    80004b8c:	0304d693          	srli	a3,s1,0x30
    80004b90:	00d78323          	sb	a3,6(a5)
    80004b94:	0384d493          	srli	s1,s1,0x38
    80004b98:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80004b9c:	00073783          	ld	a5,0(a4)
    80004ba0:	0007b783          	ld	a5,0(a5)
    80004ba4:	00078423          	sb	zero,8(a5)
    80004ba8:	000784a3          	sb	zero,9(a5)
    80004bac:	00078523          	sb	zero,10(a5)
    80004bb0:	000785a3          	sb	zero,11(a5)
    80004bb4:	00078623          	sb	zero,12(a5)
    80004bb8:	000786a3          	sb	zero,13(a5)
    80004bbc:	00078723          	sb	zero,14(a5)
    80004bc0:	000787a3          	sb	zero,15(a5)
    80004bc4:	f51ff06f          	j	80004b14 <_ZN9Scheduler3putEP7_thread+0x154>

0000000080004bc8 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80004bc8:	fe010113          	addi	sp,sp,-32
    80004bcc:	00113c23          	sd	ra,24(sp)
    80004bd0:	00813823          	sd	s0,16(sp)
    80004bd4:	00913423          	sd	s1,8(sp)
    80004bd8:	02010413          	addi	s0,sp,32
    ThreadList* tmp = singleton->head;
    80004bdc:	00009697          	auipc	a3,0x9
    80004be0:	5246b683          	ld	a3,1316(a3) # 8000e100 <_ZN9Scheduler9singletonE>
    80004be4:	0006b583          	ld	a1,0(a3)
    if(tmp == 0){
    80004be8:	0e058e63          	beqz	a1,80004ce4 <_ZN9Scheduler3getEv+0x11c>
        return 0;
    }
    thread_t thread = tmp->thread;
    80004bec:	0005c483          	lbu	s1,0(a1)
    80004bf0:	0015c783          	lbu	a5,1(a1)
    80004bf4:	00879793          	slli	a5,a5,0x8
    80004bf8:	0097e7b3          	or	a5,a5,s1
    80004bfc:	0025c483          	lbu	s1,2(a1)
    80004c00:	01049493          	slli	s1,s1,0x10
    80004c04:	00f4e7b3          	or	a5,s1,a5
    80004c08:	0035c483          	lbu	s1,3(a1)
    80004c0c:	01849493          	slli	s1,s1,0x18
    80004c10:	00f4e4b3          	or	s1,s1,a5
    80004c14:	0045c783          	lbu	a5,4(a1)
    80004c18:	02079793          	slli	a5,a5,0x20
    80004c1c:	0097e4b3          	or	s1,a5,s1
    80004c20:	0055c783          	lbu	a5,5(a1)
    80004c24:	02879793          	slli	a5,a5,0x28
    80004c28:	0097e7b3          	or	a5,a5,s1
    80004c2c:	0065c483          	lbu	s1,6(a1)
    80004c30:	03049493          	slli	s1,s1,0x30
    80004c34:	00f4e7b3          	or	a5,s1,a5
    80004c38:	0075c483          	lbu	s1,7(a1)
    80004c3c:	03849493          	slli	s1,s1,0x38
    80004c40:	00f4e4b3          	or	s1,s1,a5
    singleton->head = tmp->next;
    80004c44:	0085c783          	lbu	a5,8(a1)
    80004c48:	0095c703          	lbu	a4,9(a1)
    80004c4c:	00871713          	slli	a4,a4,0x8
    80004c50:	00f76733          	or	a4,a4,a5
    80004c54:	00a5c783          	lbu	a5,10(a1)
    80004c58:	01079793          	slli	a5,a5,0x10
    80004c5c:	00e7e733          	or	a4,a5,a4
    80004c60:	00b5c783          	lbu	a5,11(a1)
    80004c64:	01879793          	slli	a5,a5,0x18
    80004c68:	00e7e7b3          	or	a5,a5,a4
    80004c6c:	00c5c703          	lbu	a4,12(a1)
    80004c70:	02071713          	slli	a4,a4,0x20
    80004c74:	00f767b3          	or	a5,a4,a5
    80004c78:	00d5c703          	lbu	a4,13(a1)
    80004c7c:	02871713          	slli	a4,a4,0x28
    80004c80:	00f76733          	or	a4,a4,a5
    80004c84:	00e5c783          	lbu	a5,14(a1)
    80004c88:	03079793          	slli	a5,a5,0x30
    80004c8c:	00e7e733          	or	a4,a5,a4
    80004c90:	00f5c783          	lbu	a5,15(a1)
    80004c94:	03879793          	slli	a5,a5,0x38
    80004c98:	00e7e7b3          	or	a5,a5,a4
    80004c9c:	00f6b023          	sd	a5,0(a3)
    if(singleton->head == 0){
    80004ca0:	00009797          	auipc	a5,0x9
    80004ca4:	4607b783          	ld	a5,1120(a5) # 8000e100 <_ZN9Scheduler9singletonE>
    80004ca8:	0007b703          	ld	a4,0(a5)
    80004cac:	02070863          	beqz	a4,80004cdc <_ZN9Scheduler3getEv+0x114>
        singleton->tail = 0;
    }
    HeapManager::getInstance().heapFree(tmp);
    80004cb0:	00009797          	auipc	a5,0x9
    80004cb4:	3a07b783          	ld	a5,928(a5) # 8000e050 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004cb8:	0007b503          	ld	a0,0(a5)
    80004cbc:	fffff097          	auipc	ra,0xfffff
    80004cc0:	120080e7          	jalr	288(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
    return thread;
}
    80004cc4:	00048513          	mv	a0,s1
    80004cc8:	01813083          	ld	ra,24(sp)
    80004ccc:	01013403          	ld	s0,16(sp)
    80004cd0:	00813483          	ld	s1,8(sp)
    80004cd4:	02010113          	addi	sp,sp,32
    80004cd8:	00008067          	ret
        singleton->tail = 0;
    80004cdc:	0007b423          	sd	zero,8(a5)
    80004ce0:	fd1ff06f          	j	80004cb0 <_ZN9Scheduler3getEv+0xe8>
        return 0;
    80004ce4:	00058493          	mv	s1,a1
    80004ce8:	fddff06f          	j	80004cc4 <_ZN9Scheduler3getEv+0xfc>

0000000080004cec <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80004cec:	ff010113          	addi	sp,sp,-16
    80004cf0:	00813423          	sd	s0,8(sp)
    80004cf4:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80004cf8:	00009797          	auipc	a5,0x9
    80004cfc:	4087b783          	ld	a5,1032(a5) # 8000e100 <_ZN9Scheduler9singletonE>
    80004d00:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80004d04:	00000513          	li	a0,0
    while(tmp != 0){
    80004d08:	06078263          	beqz	a5,80004d6c <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80004d0c:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80004d10:	0087c683          	lbu	a3,8(a5)
    80004d14:	0097c703          	lbu	a4,9(a5)
    80004d18:	00871713          	slli	a4,a4,0x8
    80004d1c:	00d766b3          	or	a3,a4,a3
    80004d20:	00a7c703          	lbu	a4,10(a5)
    80004d24:	01071713          	slli	a4,a4,0x10
    80004d28:	00d76733          	or	a4,a4,a3
    80004d2c:	00b7c683          	lbu	a3,11(a5)
    80004d30:	01869693          	slli	a3,a3,0x18
    80004d34:	00e6e733          	or	a4,a3,a4
    80004d38:	00c7c683          	lbu	a3,12(a5)
    80004d3c:	02069693          	slli	a3,a3,0x20
    80004d40:	00e6e6b3          	or	a3,a3,a4
    80004d44:	00d7c703          	lbu	a4,13(a5)
    80004d48:	02871713          	slli	a4,a4,0x28
    80004d4c:	00d766b3          	or	a3,a4,a3
    80004d50:	00e7c703          	lbu	a4,14(a5)
    80004d54:	03071713          	slli	a4,a4,0x30
    80004d58:	00d76733          	or	a4,a4,a3
    80004d5c:	00f7c783          	lbu	a5,15(a5)
    80004d60:	03879793          	slli	a5,a5,0x38
    80004d64:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80004d68:	fa1ff06f          	j	80004d08 <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80004d6c:	00813403          	ld	s0,8(sp)
    80004d70:	01010113          	addi	sp,sp,16
    80004d74:	00008067          	ret

0000000080004d78 <_ZN6BufferC1Ei>:
#include "../test_h/buffer.h"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004d78:	fe010113          	addi	sp,sp,-32
    80004d7c:	00113c23          	sd	ra,24(sp)
    80004d80:	00813823          	sd	s0,16(sp)
    80004d84:	00913423          	sd	s1,8(sp)
    80004d88:	01213023          	sd	s2,0(sp)
    80004d8c:	02010413          	addi	s0,sp,32
    80004d90:	00050493          	mv	s1,a0
    80004d94:	00058913          	mv	s2,a1
    80004d98:	0015879b          	addiw	a5,a1,1
    80004d9c:	0007851b          	sext.w	a0,a5
    80004da0:	00f4a023          	sw	a5,0(s1)
    80004da4:	0004a823          	sw	zero,16(s1)
    80004da8:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004dac:	00251513          	slli	a0,a0,0x2
    80004db0:	ffffd097          	auipc	ra,0xffffd
    80004db4:	af4080e7          	jalr	-1292(ra) # 800018a4 <_Z9mem_allocm>
    80004db8:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80004dbc:	00000593          	li	a1,0
    80004dc0:	02048513          	addi	a0,s1,32
    80004dc4:	ffffd097          	auipc	ra,0xffffd
    80004dc8:	c48080e7          	jalr	-952(ra) # 80001a0c <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80004dcc:	00090593          	mv	a1,s2
    80004dd0:	01848513          	addi	a0,s1,24
    80004dd4:	ffffd097          	auipc	ra,0xffffd
    80004dd8:	c38080e7          	jalr	-968(ra) # 80001a0c <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80004ddc:	00100593          	li	a1,1
    80004de0:	02848513          	addi	a0,s1,40
    80004de4:	ffffd097          	auipc	ra,0xffffd
    80004de8:	c28080e7          	jalr	-984(ra) # 80001a0c <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80004dec:	00100593          	li	a1,1
    80004df0:	03048513          	addi	a0,s1,48
    80004df4:	ffffd097          	auipc	ra,0xffffd
    80004df8:	c18080e7          	jalr	-1000(ra) # 80001a0c <_Z8sem_openPP4_semj>
}
    80004dfc:	01813083          	ld	ra,24(sp)
    80004e00:	01013403          	ld	s0,16(sp)
    80004e04:	00813483          	ld	s1,8(sp)
    80004e08:	00013903          	ld	s2,0(sp)
    80004e0c:	02010113          	addi	sp,sp,32
    80004e10:	00008067          	ret

0000000080004e14 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80004e14:	fe010113          	addi	sp,sp,-32
    80004e18:	00113c23          	sd	ra,24(sp)
    80004e1c:	00813823          	sd	s0,16(sp)
    80004e20:	00913423          	sd	s1,8(sp)
    80004e24:	01213023          	sd	s2,0(sp)
    80004e28:	02010413          	addi	s0,sp,32
    80004e2c:	00050493          	mv	s1,a0
    80004e30:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80004e34:	01853503          	ld	a0,24(a0)
    80004e38:	ffffd097          	auipc	ra,0xffffd
    80004e3c:	c38080e7          	jalr	-968(ra) # 80001a70 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80004e40:	0304b503          	ld	a0,48(s1)
    80004e44:	ffffd097          	auipc	ra,0xffffd
    80004e48:	c2c080e7          	jalr	-980(ra) # 80001a70 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80004e4c:	0084b783          	ld	a5,8(s1)
    80004e50:	0144a703          	lw	a4,20(s1)
    80004e54:	00271713          	slli	a4,a4,0x2
    80004e58:	00e787b3          	add	a5,a5,a4
    80004e5c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004e60:	0144a783          	lw	a5,20(s1)
    80004e64:	0017879b          	addiw	a5,a5,1
    80004e68:	0004a703          	lw	a4,0(s1)
    80004e6c:	02e7e7bb          	remw	a5,a5,a4
    80004e70:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80004e74:	0304b503          	ld	a0,48(s1)
    80004e78:	ffffd097          	auipc	ra,0xffffd
    80004e7c:	c24080e7          	jalr	-988(ra) # 80001a9c <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80004e80:	0204b503          	ld	a0,32(s1)
    80004e84:	ffffd097          	auipc	ra,0xffffd
    80004e88:	c18080e7          	jalr	-1000(ra) # 80001a9c <_Z10sem_signalP4_sem>

}
    80004e8c:	01813083          	ld	ra,24(sp)
    80004e90:	01013403          	ld	s0,16(sp)
    80004e94:	00813483          	ld	s1,8(sp)
    80004e98:	00013903          	ld	s2,0(sp)
    80004e9c:	02010113          	addi	sp,sp,32
    80004ea0:	00008067          	ret

0000000080004ea4 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80004ea4:	fe010113          	addi	sp,sp,-32
    80004ea8:	00113c23          	sd	ra,24(sp)
    80004eac:	00813823          	sd	s0,16(sp)
    80004eb0:	00913423          	sd	s1,8(sp)
    80004eb4:	01213023          	sd	s2,0(sp)
    80004eb8:	02010413          	addi	s0,sp,32
    80004ebc:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80004ec0:	02053503          	ld	a0,32(a0)
    80004ec4:	ffffd097          	auipc	ra,0xffffd
    80004ec8:	bac080e7          	jalr	-1108(ra) # 80001a70 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80004ecc:	0284b503          	ld	a0,40(s1)
    80004ed0:	ffffd097          	auipc	ra,0xffffd
    80004ed4:	ba0080e7          	jalr	-1120(ra) # 80001a70 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80004ed8:	0084b703          	ld	a4,8(s1)
    80004edc:	0104a783          	lw	a5,16(s1)
    80004ee0:	00279693          	slli	a3,a5,0x2
    80004ee4:	00d70733          	add	a4,a4,a3
    80004ee8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004eec:	0017879b          	addiw	a5,a5,1
    80004ef0:	0004a703          	lw	a4,0(s1)
    80004ef4:	02e7e7bb          	remw	a5,a5,a4
    80004ef8:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80004efc:	0284b503          	ld	a0,40(s1)
    80004f00:	ffffd097          	auipc	ra,0xffffd
    80004f04:	b9c080e7          	jalr	-1124(ra) # 80001a9c <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80004f08:	0184b503          	ld	a0,24(s1)
    80004f0c:	ffffd097          	auipc	ra,0xffffd
    80004f10:	b90080e7          	jalr	-1136(ra) # 80001a9c <_Z10sem_signalP4_sem>

    return ret;
}
    80004f14:	00090513          	mv	a0,s2
    80004f18:	01813083          	ld	ra,24(sp)
    80004f1c:	01013403          	ld	s0,16(sp)
    80004f20:	00813483          	ld	s1,8(sp)
    80004f24:	00013903          	ld	s2,0(sp)
    80004f28:	02010113          	addi	sp,sp,32
    80004f2c:	00008067          	ret

0000000080004f30 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80004f30:	fe010113          	addi	sp,sp,-32
    80004f34:	00113c23          	sd	ra,24(sp)
    80004f38:	00813823          	sd	s0,16(sp)
    80004f3c:	00913423          	sd	s1,8(sp)
    80004f40:	01213023          	sd	s2,0(sp)
    80004f44:	02010413          	addi	s0,sp,32
    80004f48:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80004f4c:	02853503          	ld	a0,40(a0)
    80004f50:	ffffd097          	auipc	ra,0xffffd
    80004f54:	b20080e7          	jalr	-1248(ra) # 80001a70 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80004f58:	0304b503          	ld	a0,48(s1)
    80004f5c:	ffffd097          	auipc	ra,0xffffd
    80004f60:	b14080e7          	jalr	-1260(ra) # 80001a70 <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80004f64:	0144a783          	lw	a5,20(s1)
    80004f68:	0104a903          	lw	s2,16(s1)
    80004f6c:	0327ce63          	blt	a5,s2,80004fa8 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80004f70:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80004f74:	0304b503          	ld	a0,48(s1)
    80004f78:	ffffd097          	auipc	ra,0xffffd
    80004f7c:	b24080e7          	jalr	-1244(ra) # 80001a9c <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80004f80:	0284b503          	ld	a0,40(s1)
    80004f84:	ffffd097          	auipc	ra,0xffffd
    80004f88:	b18080e7          	jalr	-1256(ra) # 80001a9c <_Z10sem_signalP4_sem>

    return ret;
}
    80004f8c:	00090513          	mv	a0,s2
    80004f90:	01813083          	ld	ra,24(sp)
    80004f94:	01013403          	ld	s0,16(sp)
    80004f98:	00813483          	ld	s1,8(sp)
    80004f9c:	00013903          	ld	s2,0(sp)
    80004fa0:	02010113          	addi	sp,sp,32
    80004fa4:	00008067          	ret
        ret = cap - head + tail;
    80004fa8:	0004a703          	lw	a4,0(s1)
    80004fac:	4127093b          	subw	s2,a4,s2
    80004fb0:	00f9093b          	addw	s2,s2,a5
    80004fb4:	fc1ff06f          	j	80004f74 <_ZN6Buffer6getCntEv+0x44>

0000000080004fb8 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80004fb8:	fe010113          	addi	sp,sp,-32
    80004fbc:	00113c23          	sd	ra,24(sp)
    80004fc0:	00813823          	sd	s0,16(sp)
    80004fc4:	00913423          	sd	s1,8(sp)
    80004fc8:	02010413          	addi	s0,sp,32
    80004fcc:	00050493          	mv	s1,a0
    putc('\n');
    80004fd0:	00a00513          	li	a0,10
    80004fd4:	ffffd097          	auipc	ra,0xffffd
    80004fd8:	b1c080e7          	jalr	-1252(ra) # 80001af0 <_Z4putcc>
    printString("Buffer deleted!\n");
    80004fdc:	00006517          	auipc	a0,0x6
    80004fe0:	45450513          	addi	a0,a0,1108 # 8000b430 <CONSOLE_STATUS+0x420>
    80004fe4:	00003097          	auipc	ra,0x3
    80004fe8:	994080e7          	jalr	-1644(ra) # 80007978 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80004fec:	00048513          	mv	a0,s1
    80004ff0:	00000097          	auipc	ra,0x0
    80004ff4:	f40080e7          	jalr	-192(ra) # 80004f30 <_ZN6Buffer6getCntEv>
    80004ff8:	02a05c63          	blez	a0,80005030 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80004ffc:	0084b783          	ld	a5,8(s1)
    80005000:	0104a703          	lw	a4,16(s1)
    80005004:	00271713          	slli	a4,a4,0x2
    80005008:	00e787b3          	add	a5,a5,a4
        putc(ch);
    8000500c:	0007c503          	lbu	a0,0(a5)
    80005010:	ffffd097          	auipc	ra,0xffffd
    80005014:	ae0080e7          	jalr	-1312(ra) # 80001af0 <_Z4putcc>
        head = (head + 1) % cap;
    80005018:	0104a783          	lw	a5,16(s1)
    8000501c:	0017879b          	addiw	a5,a5,1
    80005020:	0004a703          	lw	a4,0(s1)
    80005024:	02e7e7bb          	remw	a5,a5,a4
    80005028:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    8000502c:	fc1ff06f          	j	80004fec <_ZN6BufferD1Ev+0x34>
    putc('!');
    80005030:	02100513          	li	a0,33
    80005034:	ffffd097          	auipc	ra,0xffffd
    80005038:	abc080e7          	jalr	-1348(ra) # 80001af0 <_Z4putcc>
    putc('\n');
    8000503c:	00a00513          	li	a0,10
    80005040:	ffffd097          	auipc	ra,0xffffd
    80005044:	ab0080e7          	jalr	-1360(ra) # 80001af0 <_Z4putcc>
    mem_free(buffer);
    80005048:	0084b503          	ld	a0,8(s1)
    8000504c:	ffffd097          	auipc	ra,0xffffd
    80005050:	888080e7          	jalr	-1912(ra) # 800018d4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80005054:	0204b503          	ld	a0,32(s1)
    80005058:	ffffd097          	auipc	ra,0xffffd
    8000505c:	9ec080e7          	jalr	-1556(ra) # 80001a44 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80005060:	0184b503          	ld	a0,24(s1)
    80005064:	ffffd097          	auipc	ra,0xffffd
    80005068:	9e0080e7          	jalr	-1568(ra) # 80001a44 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    8000506c:	0304b503          	ld	a0,48(s1)
    80005070:	ffffd097          	auipc	ra,0xffffd
    80005074:	9d4080e7          	jalr	-1580(ra) # 80001a44 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80005078:	0284b503          	ld	a0,40(s1)
    8000507c:	ffffd097          	auipc	ra,0xffffd
    80005080:	9c8080e7          	jalr	-1592(ra) # 80001a44 <_Z9sem_closeP4_sem>
}
    80005084:	01813083          	ld	ra,24(sp)
    80005088:	01013403          	ld	s0,16(sp)
    8000508c:	00813483          	ld	s1,8(sp)
    80005090:	02010113          	addi	sp,sp,32
    80005094:	00008067          	ret

0000000080005098 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80005098:	fe010113          	addi	sp,sp,-32
    8000509c:	00113c23          	sd	ra,24(sp)
    800050a0:	00813823          	sd	s0,16(sp)
    800050a4:	00913423          	sd	s1,8(sp)
    800050a8:	01213023          	sd	s2,0(sp)
    800050ac:	02010413          	addi	s0,sp,32
    800050b0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800050b4:	00000913          	li	s2,0
    800050b8:	00c0006f          	j	800050c4 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800050bc:	ffffd097          	auipc	ra,0xffffd
    800050c0:	8e0080e7          	jalr	-1824(ra) # 8000199c <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    800050c4:	ffffd097          	auipc	ra,0xffffd
    800050c8:	a04080e7          	jalr	-1532(ra) # 80001ac8 <_Z4getcv>
    800050cc:	0005059b          	sext.w	a1,a0
    800050d0:	01b00793          	li	a5,27
    800050d4:	02f58a63          	beq	a1,a5,80005108 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800050d8:	0084b503          	ld	a0,8(s1)
    800050dc:	00000097          	auipc	ra,0x0
    800050e0:	d38080e7          	jalr	-712(ra) # 80004e14 <_ZN6Buffer3putEi>
        i++;
    800050e4:	0019071b          	addiw	a4,s2,1
    800050e8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800050ec:	0004a683          	lw	a3,0(s1)
    800050f0:	0026979b          	slliw	a5,a3,0x2
    800050f4:	00d787bb          	addw	a5,a5,a3
    800050f8:	0017979b          	slliw	a5,a5,0x1
    800050fc:	02f767bb          	remw	a5,a4,a5
    80005100:	fc0792e3          	bnez	a5,800050c4 <_ZL16producerKeyboardPv+0x2c>
    80005104:	fb9ff06f          	j	800050bc <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80005108:	00100793          	li	a5,1
    8000510c:	00009717          	auipc	a4,0x9
    80005110:	fef72e23          	sw	a5,-4(a4) # 8000e108 <_ZL9threadEnd>
    data->buffer->put('!');
    80005114:	02100593          	li	a1,33
    80005118:	0084b503          	ld	a0,8(s1)
    8000511c:	00000097          	auipc	ra,0x0
    80005120:	cf8080e7          	jalr	-776(ra) # 80004e14 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80005124:	0104b503          	ld	a0,16(s1)
    80005128:	ffffd097          	auipc	ra,0xffffd
    8000512c:	974080e7          	jalr	-1676(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    80005130:	01813083          	ld	ra,24(sp)
    80005134:	01013403          	ld	s0,16(sp)
    80005138:	00813483          	ld	s1,8(sp)
    8000513c:	00013903          	ld	s2,0(sp)
    80005140:	02010113          	addi	sp,sp,32
    80005144:	00008067          	ret

0000000080005148 <_ZL8producerPv>:

static void producer(void *arg) {
    80005148:	fe010113          	addi	sp,sp,-32
    8000514c:	00113c23          	sd	ra,24(sp)
    80005150:	00813823          	sd	s0,16(sp)
    80005154:	00913423          	sd	s1,8(sp)
    80005158:	01213023          	sd	s2,0(sp)
    8000515c:	02010413          	addi	s0,sp,32
    80005160:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005164:	00000913          	li	s2,0
    80005168:	00c0006f          	j	80005174 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000516c:	ffffd097          	auipc	ra,0xffffd
    80005170:	830080e7          	jalr	-2000(ra) # 8000199c <_Z15thread_dispatchv>
    while (!threadEnd) {
    80005174:	00009797          	auipc	a5,0x9
    80005178:	f947a783          	lw	a5,-108(a5) # 8000e108 <_ZL9threadEnd>
    8000517c:	02079e63          	bnez	a5,800051b8 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80005180:	0004a583          	lw	a1,0(s1)
    80005184:	0305859b          	addiw	a1,a1,48
    80005188:	0084b503          	ld	a0,8(s1)
    8000518c:	00000097          	auipc	ra,0x0
    80005190:	c88080e7          	jalr	-888(ra) # 80004e14 <_ZN6Buffer3putEi>
        i++;
    80005194:	0019071b          	addiw	a4,s2,1
    80005198:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000519c:	0004a683          	lw	a3,0(s1)
    800051a0:	0026979b          	slliw	a5,a3,0x2
    800051a4:	00d787bb          	addw	a5,a5,a3
    800051a8:	0017979b          	slliw	a5,a5,0x1
    800051ac:	02f767bb          	remw	a5,a4,a5
    800051b0:	fc0792e3          	bnez	a5,80005174 <_ZL8producerPv+0x2c>
    800051b4:	fb9ff06f          	j	8000516c <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    800051b8:	0104b503          	ld	a0,16(s1)
    800051bc:	ffffd097          	auipc	ra,0xffffd
    800051c0:	8e0080e7          	jalr	-1824(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    800051c4:	01813083          	ld	ra,24(sp)
    800051c8:	01013403          	ld	s0,16(sp)
    800051cc:	00813483          	ld	s1,8(sp)
    800051d0:	00013903          	ld	s2,0(sp)
    800051d4:	02010113          	addi	sp,sp,32
    800051d8:	00008067          	ret

00000000800051dc <_ZL8consumerPv>:

static void consumer(void *arg) {
    800051dc:	fd010113          	addi	sp,sp,-48
    800051e0:	02113423          	sd	ra,40(sp)
    800051e4:	02813023          	sd	s0,32(sp)
    800051e8:	00913c23          	sd	s1,24(sp)
    800051ec:	01213823          	sd	s2,16(sp)
    800051f0:	01313423          	sd	s3,8(sp)
    800051f4:	03010413          	addi	s0,sp,48
    800051f8:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800051fc:	00000993          	li	s3,0
    80005200:	01c0006f          	j	8000521c <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80005204:	ffffc097          	auipc	ra,0xffffc
    80005208:	798080e7          	jalr	1944(ra) # 8000199c <_Z15thread_dispatchv>
    8000520c:	0500006f          	j	8000525c <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005210:	00a00513          	li	a0,10
    80005214:	ffffd097          	auipc	ra,0xffffd
    80005218:	8dc080e7          	jalr	-1828(ra) # 80001af0 <_Z4putcc>
    while (!threadEnd) {
    8000521c:	00009797          	auipc	a5,0x9
    80005220:	eec7a783          	lw	a5,-276(a5) # 8000e108 <_ZL9threadEnd>
    80005224:	06079063          	bnez	a5,80005284 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80005228:	00893503          	ld	a0,8(s2)
    8000522c:	00000097          	auipc	ra,0x0
    80005230:	c78080e7          	jalr	-904(ra) # 80004ea4 <_ZN6Buffer3getEv>
        i++;
    80005234:	0019849b          	addiw	s1,s3,1
    80005238:	0004899b          	sext.w	s3,s1
        putc(key);
    8000523c:	0ff57513          	andi	a0,a0,255
    80005240:	ffffd097          	auipc	ra,0xffffd
    80005244:	8b0080e7          	jalr	-1872(ra) # 80001af0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005248:	00092703          	lw	a4,0(s2)
    8000524c:	0027179b          	slliw	a5,a4,0x2
    80005250:	00e787bb          	addw	a5,a5,a4
    80005254:	02f4e7bb          	remw	a5,s1,a5
    80005258:	fa0786e3          	beqz	a5,80005204 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    8000525c:	05000793          	li	a5,80
    80005260:	02f4e4bb          	remw	s1,s1,a5
    80005264:	fa049ce3          	bnez	s1,8000521c <_ZL8consumerPv+0x40>
    80005268:	fa9ff06f          	j	80005210 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    8000526c:	00893503          	ld	a0,8(s2)
    80005270:	00000097          	auipc	ra,0x0
    80005274:	c34080e7          	jalr	-972(ra) # 80004ea4 <_ZN6Buffer3getEv>
        putc(key);
    80005278:	0ff57513          	andi	a0,a0,255
    8000527c:	ffffd097          	auipc	ra,0xffffd
    80005280:	874080e7          	jalr	-1932(ra) # 80001af0 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80005284:	00893503          	ld	a0,8(s2)
    80005288:	00000097          	auipc	ra,0x0
    8000528c:	ca8080e7          	jalr	-856(ra) # 80004f30 <_ZN6Buffer6getCntEv>
    80005290:	fca04ee3          	bgtz	a0,8000526c <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80005294:	01093503          	ld	a0,16(s2)
    80005298:	ffffd097          	auipc	ra,0xffffd
    8000529c:	804080e7          	jalr	-2044(ra) # 80001a9c <_Z10sem_signalP4_sem>
}
    800052a0:	02813083          	ld	ra,40(sp)
    800052a4:	02013403          	ld	s0,32(sp)
    800052a8:	01813483          	ld	s1,24(sp)
    800052ac:	01013903          	ld	s2,16(sp)
    800052b0:	00813983          	ld	s3,8(sp)
    800052b4:	03010113          	addi	sp,sp,48
    800052b8:	00008067          	ret

00000000800052bc <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800052bc:	f9010113          	addi	sp,sp,-112
    800052c0:	06113423          	sd	ra,104(sp)
    800052c4:	06813023          	sd	s0,96(sp)
    800052c8:	04913c23          	sd	s1,88(sp)
    800052cc:	05213823          	sd	s2,80(sp)
    800052d0:	05313423          	sd	s3,72(sp)
    800052d4:	05413023          	sd	s4,64(sp)
    800052d8:	03513c23          	sd	s5,56(sp)
    800052dc:	03613823          	sd	s6,48(sp)
    800052e0:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800052e4:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800052e8:	00006517          	auipc	a0,0x6
    800052ec:	16050513          	addi	a0,a0,352 # 8000b448 <CONSOLE_STATUS+0x438>
    800052f0:	00002097          	auipc	ra,0x2
    800052f4:	688080e7          	jalr	1672(ra) # 80007978 <_Z11printStringPKc>
    getString(input, 30);
    800052f8:	01e00593          	li	a1,30
    800052fc:	fa040493          	addi	s1,s0,-96
    80005300:	00048513          	mv	a0,s1
    80005304:	00002097          	auipc	ra,0x2
    80005308:	6fc080e7          	jalr	1788(ra) # 80007a00 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000530c:	00048513          	mv	a0,s1
    80005310:	00002097          	auipc	ra,0x2
    80005314:	7c8080e7          	jalr	1992(ra) # 80007ad8 <_Z11stringToIntPKc>
    80005318:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000531c:	00006517          	auipc	a0,0x6
    80005320:	14c50513          	addi	a0,a0,332 # 8000b468 <CONSOLE_STATUS+0x458>
    80005324:	00002097          	auipc	ra,0x2
    80005328:	654080e7          	jalr	1620(ra) # 80007978 <_Z11printStringPKc>
    getString(input, 30);
    8000532c:	01e00593          	li	a1,30
    80005330:	00048513          	mv	a0,s1
    80005334:	00002097          	auipc	ra,0x2
    80005338:	6cc080e7          	jalr	1740(ra) # 80007a00 <_Z9getStringPci>
    n = stringToInt(input);
    8000533c:	00048513          	mv	a0,s1
    80005340:	00002097          	auipc	ra,0x2
    80005344:	798080e7          	jalr	1944(ra) # 80007ad8 <_Z11stringToIntPKc>
    80005348:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    8000534c:	00006517          	auipc	a0,0x6
    80005350:	13c50513          	addi	a0,a0,316 # 8000b488 <CONSOLE_STATUS+0x478>
    80005354:	00002097          	auipc	ra,0x2
    80005358:	624080e7          	jalr	1572(ra) # 80007978 <_Z11printStringPKc>
    8000535c:	00000613          	li	a2,0
    80005360:	00a00593          	li	a1,10
    80005364:	00090513          	mv	a0,s2
    80005368:	00002097          	auipc	ra,0x2
    8000536c:	7c0080e7          	jalr	1984(ra) # 80007b28 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005370:	00006517          	auipc	a0,0x6
    80005374:	13050513          	addi	a0,a0,304 # 8000b4a0 <CONSOLE_STATUS+0x490>
    80005378:	00002097          	auipc	ra,0x2
    8000537c:	600080e7          	jalr	1536(ra) # 80007978 <_Z11printStringPKc>
    80005380:	00000613          	li	a2,0
    80005384:	00a00593          	li	a1,10
    80005388:	00048513          	mv	a0,s1
    8000538c:	00002097          	auipc	ra,0x2
    80005390:	79c080e7          	jalr	1948(ra) # 80007b28 <_Z8printIntiii>
    printString(".\n");
    80005394:	00006517          	auipc	a0,0x6
    80005398:	12450513          	addi	a0,a0,292 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    8000539c:	00002097          	auipc	ra,0x2
    800053a0:	5dc080e7          	jalr	1500(ra) # 80007978 <_Z11printStringPKc>
    if(threadNum > n) {
    800053a4:	0324c463          	blt	s1,s2,800053cc <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    800053a8:	03205c63          	blez	s2,800053e0 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    800053ac:	03800513          	li	a0,56
    800053b0:	ffffc097          	auipc	ra,0xffffc
    800053b4:	e0c080e7          	jalr	-500(ra) # 800011bc <_Znwm>
    800053b8:	00050a13          	mv	s4,a0
    800053bc:	00048593          	mv	a1,s1
    800053c0:	00000097          	auipc	ra,0x0
    800053c4:	9b8080e7          	jalr	-1608(ra) # 80004d78 <_ZN6BufferC1Ei>
    800053c8:	0300006f          	j	800053f8 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800053cc:	00006517          	auipc	a0,0x6
    800053d0:	0f450513          	addi	a0,a0,244 # 8000b4c0 <CONSOLE_STATUS+0x4b0>
    800053d4:	00002097          	auipc	ra,0x2
    800053d8:	5a4080e7          	jalr	1444(ra) # 80007978 <_Z11printStringPKc>
        return;
    800053dc:	0140006f          	j	800053f0 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800053e0:	00006517          	auipc	a0,0x6
    800053e4:	12050513          	addi	a0,a0,288 # 8000b500 <CONSOLE_STATUS+0x4f0>
    800053e8:	00002097          	auipc	ra,0x2
    800053ec:	590080e7          	jalr	1424(ra) # 80007978 <_Z11printStringPKc>
        return;
    800053f0:	000b0113          	mv	sp,s6
    800053f4:	1500006f          	j	80005544 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800053f8:	00000593          	li	a1,0
    800053fc:	00009517          	auipc	a0,0x9
    80005400:	d1450513          	addi	a0,a0,-748 # 8000e110 <_ZL10waitForAll>
    80005404:	ffffc097          	auipc	ra,0xffffc
    80005408:	608080e7          	jalr	1544(ra) # 80001a0c <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    8000540c:	00391793          	slli	a5,s2,0x3
    80005410:	00f78793          	addi	a5,a5,15
    80005414:	ff07f793          	andi	a5,a5,-16
    80005418:	40f10133          	sub	sp,sp,a5
    8000541c:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80005420:	0019071b          	addiw	a4,s2,1
    80005424:	00171793          	slli	a5,a4,0x1
    80005428:	00e787b3          	add	a5,a5,a4
    8000542c:	00379793          	slli	a5,a5,0x3
    80005430:	00f78793          	addi	a5,a5,15
    80005434:	ff07f793          	andi	a5,a5,-16
    80005438:	40f10133          	sub	sp,sp,a5
    8000543c:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80005440:	00191613          	slli	a2,s2,0x1
    80005444:	012607b3          	add	a5,a2,s2
    80005448:	00379793          	slli	a5,a5,0x3
    8000544c:	00f987b3          	add	a5,s3,a5
    80005450:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005454:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80005458:	00009717          	auipc	a4,0x9
    8000545c:	cb873703          	ld	a4,-840(a4) # 8000e110 <_ZL10waitForAll>
    80005460:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80005464:	00078613          	mv	a2,a5
    80005468:	00000597          	auipc	a1,0x0
    8000546c:	d7458593          	addi	a1,a1,-652 # 800051dc <_ZL8consumerPv>
    80005470:	f9840513          	addi	a0,s0,-104
    80005474:	ffffc097          	auipc	ra,0xffffc
    80005478:	48c080e7          	jalr	1164(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000547c:	00000493          	li	s1,0
    80005480:	0280006f          	j	800054a8 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80005484:	00000597          	auipc	a1,0x0
    80005488:	c1458593          	addi	a1,a1,-1004 # 80005098 <_ZL16producerKeyboardPv>
                      data + i);
    8000548c:	00179613          	slli	a2,a5,0x1
    80005490:	00f60633          	add	a2,a2,a5
    80005494:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80005498:	00c98633          	add	a2,s3,a2
    8000549c:	ffffc097          	auipc	ra,0xffffc
    800054a0:	464080e7          	jalr	1124(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800054a4:	0014849b          	addiw	s1,s1,1
    800054a8:	0524d263          	bge	s1,s2,800054ec <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800054ac:	00149793          	slli	a5,s1,0x1
    800054b0:	009787b3          	add	a5,a5,s1
    800054b4:	00379793          	slli	a5,a5,0x3
    800054b8:	00f987b3          	add	a5,s3,a5
    800054bc:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800054c0:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    800054c4:	00009717          	auipc	a4,0x9
    800054c8:	c4c73703          	ld	a4,-948(a4) # 8000e110 <_ZL10waitForAll>
    800054cc:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    800054d0:	00048793          	mv	a5,s1
    800054d4:	00349513          	slli	a0,s1,0x3
    800054d8:	00aa8533          	add	a0,s5,a0
    800054dc:	fa9054e3          	blez	s1,80005484 <_Z22producerConsumer_C_APIv+0x1c8>
    800054e0:	00000597          	auipc	a1,0x0
    800054e4:	c6858593          	addi	a1,a1,-920 # 80005148 <_ZL8producerPv>
    800054e8:	fa5ff06f          	j	8000548c <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800054ec:	ffffc097          	auipc	ra,0xffffc
    800054f0:	4b0080e7          	jalr	1200(ra) # 8000199c <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800054f4:	00000493          	li	s1,0
    800054f8:	00994e63          	blt	s2,s1,80005514 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800054fc:	00009517          	auipc	a0,0x9
    80005500:	c1453503          	ld	a0,-1004(a0) # 8000e110 <_ZL10waitForAll>
    80005504:	ffffc097          	auipc	ra,0xffffc
    80005508:	56c080e7          	jalr	1388(ra) # 80001a70 <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    8000550c:	0014849b          	addiw	s1,s1,1
    80005510:	fe9ff06f          	j	800054f8 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80005514:	00009517          	auipc	a0,0x9
    80005518:	bfc53503          	ld	a0,-1028(a0) # 8000e110 <_ZL10waitForAll>
    8000551c:	ffffc097          	auipc	ra,0xffffc
    80005520:	528080e7          	jalr	1320(ra) # 80001a44 <_Z9sem_closeP4_sem>
    delete buffer;
    80005524:	000a0e63          	beqz	s4,80005540 <_Z22producerConsumer_C_APIv+0x284>
    80005528:	000a0513          	mv	a0,s4
    8000552c:	00000097          	auipc	ra,0x0
    80005530:	a8c080e7          	jalr	-1396(ra) # 80004fb8 <_ZN6BufferD1Ev>
    80005534:	000a0513          	mv	a0,s4
    80005538:	ffffc097          	auipc	ra,0xffffc
    8000553c:	cac080e7          	jalr	-852(ra) # 800011e4 <_ZdlPv>
    80005540:	000b0113          	mv	sp,s6
}
    80005544:	f9040113          	addi	sp,s0,-112
    80005548:	06813083          	ld	ra,104(sp)
    8000554c:	06013403          	ld	s0,96(sp)
    80005550:	05813483          	ld	s1,88(sp)
    80005554:	05013903          	ld	s2,80(sp)
    80005558:	04813983          	ld	s3,72(sp)
    8000555c:	04013a03          	ld	s4,64(sp)
    80005560:	03813a83          	ld	s5,56(sp)
    80005564:	03013b03          	ld	s6,48(sp)
    80005568:	07010113          	addi	sp,sp,112
    8000556c:	00008067          	ret
    80005570:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80005574:	000a0513          	mv	a0,s4
    80005578:	ffffc097          	auipc	ra,0xffffc
    8000557c:	c6c080e7          	jalr	-916(ra) # 800011e4 <_ZdlPv>
    80005580:	00048513          	mv	a0,s1
    80005584:	0000a097          	auipc	ra,0xa
    80005588:	c94080e7          	jalr	-876(ra) # 8000f218 <_Unwind_Resume>

000000008000558c <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    8000558c:	f8010113          	addi	sp,sp,-128
    80005590:	06113c23          	sd	ra,120(sp)
    80005594:	06813823          	sd	s0,112(sp)
    80005598:	06913423          	sd	s1,104(sp)
    8000559c:	07213023          	sd	s2,96(sp)
    800055a0:	05313c23          	sd	s3,88(sp)
    800055a4:	05413823          	sd	s4,80(sp)
    800055a8:	05513423          	sd	s5,72(sp)
    800055ac:	05613023          	sd	s6,64(sp)
    800055b0:	03713c23          	sd	s7,56(sp)
    800055b4:	03813823          	sd	s8,48(sp)
    800055b8:	03913423          	sd	s9,40(sp)
    800055bc:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800055c0:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800055c4:	00006517          	auipc	a0,0x6
    800055c8:	e8450513          	addi	a0,a0,-380 # 8000b448 <CONSOLE_STATUS+0x438>
    800055cc:	00002097          	auipc	ra,0x2
    800055d0:	3ac080e7          	jalr	940(ra) # 80007978 <_Z11printStringPKc>
    getString(input, 30);
    800055d4:	01e00593          	li	a1,30
    800055d8:	f8040493          	addi	s1,s0,-128
    800055dc:	00048513          	mv	a0,s1
    800055e0:	00002097          	auipc	ra,0x2
    800055e4:	420080e7          	jalr	1056(ra) # 80007a00 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800055e8:	00048513          	mv	a0,s1
    800055ec:	00002097          	auipc	ra,0x2
    800055f0:	4ec080e7          	jalr	1260(ra) # 80007ad8 <_Z11stringToIntPKc>
    800055f4:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    800055f8:	00006517          	auipc	a0,0x6
    800055fc:	e7050513          	addi	a0,a0,-400 # 8000b468 <CONSOLE_STATUS+0x458>
    80005600:	00002097          	auipc	ra,0x2
    80005604:	378080e7          	jalr	888(ra) # 80007978 <_Z11printStringPKc>
    getString(input, 30);
    80005608:	01e00593          	li	a1,30
    8000560c:	00048513          	mv	a0,s1
    80005610:	00002097          	auipc	ra,0x2
    80005614:	3f0080e7          	jalr	1008(ra) # 80007a00 <_Z9getStringPci>
    n = stringToInt(input);
    80005618:	00048513          	mv	a0,s1
    8000561c:	00002097          	auipc	ra,0x2
    80005620:	4bc080e7          	jalr	1212(ra) # 80007ad8 <_Z11stringToIntPKc>
    80005624:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80005628:	00006517          	auipc	a0,0x6
    8000562c:	e6050513          	addi	a0,a0,-416 # 8000b488 <CONSOLE_STATUS+0x478>
    80005630:	00002097          	auipc	ra,0x2
    80005634:	348080e7          	jalr	840(ra) # 80007978 <_Z11printStringPKc>
    printInt(threadNum);
    80005638:	00000613          	li	a2,0
    8000563c:	00a00593          	li	a1,10
    80005640:	00098513          	mv	a0,s3
    80005644:	00002097          	auipc	ra,0x2
    80005648:	4e4080e7          	jalr	1252(ra) # 80007b28 <_Z8printIntiii>
    printString(" i velicina bafera ");
    8000564c:	00006517          	auipc	a0,0x6
    80005650:	e5450513          	addi	a0,a0,-428 # 8000b4a0 <CONSOLE_STATUS+0x490>
    80005654:	00002097          	auipc	ra,0x2
    80005658:	324080e7          	jalr	804(ra) # 80007978 <_Z11printStringPKc>
    printInt(n);
    8000565c:	00000613          	li	a2,0
    80005660:	00a00593          	li	a1,10
    80005664:	00048513          	mv	a0,s1
    80005668:	00002097          	auipc	ra,0x2
    8000566c:	4c0080e7          	jalr	1216(ra) # 80007b28 <_Z8printIntiii>
    printString(".\n");
    80005670:	00006517          	auipc	a0,0x6
    80005674:	e4850513          	addi	a0,a0,-440 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    80005678:	00002097          	auipc	ra,0x2
    8000567c:	300080e7          	jalr	768(ra) # 80007978 <_Z11printStringPKc>
    if (threadNum > n) {
    80005680:	0334c463          	blt	s1,s3,800056a8 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80005684:	03305c63          	blez	s3,800056bc <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005688:	03800513          	li	a0,56
    8000568c:	ffffc097          	auipc	ra,0xffffc
    80005690:	b30080e7          	jalr	-1232(ra) # 800011bc <_Znwm>
    80005694:	00050a93          	mv	s5,a0
    80005698:	00048593          	mv	a1,s1
    8000569c:	00001097          	auipc	ra,0x1
    800056a0:	3c8080e7          	jalr	968(ra) # 80006a64 <_ZN9BufferCPPC1Ei>
    800056a4:	0300006f          	j	800056d4 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800056a8:	00006517          	auipc	a0,0x6
    800056ac:	e1850513          	addi	a0,a0,-488 # 8000b4c0 <CONSOLE_STATUS+0x4b0>
    800056b0:	00002097          	auipc	ra,0x2
    800056b4:	2c8080e7          	jalr	712(ra) # 80007978 <_Z11printStringPKc>
        return;
    800056b8:	0140006f          	j	800056cc <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800056bc:	00006517          	auipc	a0,0x6
    800056c0:	e4450513          	addi	a0,a0,-444 # 8000b500 <CONSOLE_STATUS+0x4f0>
    800056c4:	00002097          	auipc	ra,0x2
    800056c8:	2b4080e7          	jalr	692(ra) # 80007978 <_Z11printStringPKc>
        return;
    800056cc:	000c0113          	mv	sp,s8
    800056d0:	2380006f          	j	80005908 <_Z20testConsumerProducerv+0x37c>
    waitForAll = new Semaphore(0);
    800056d4:	01000513          	li	a0,16
    800056d8:	ffffc097          	auipc	ra,0xffffc
    800056dc:	ae4080e7          	jalr	-1308(ra) # 800011bc <_Znwm>
    800056e0:	00050913          	mv	s2,a0
    800056e4:	00000593          	li	a1,0
    800056e8:	ffffc097          	auipc	ra,0xffffc
    800056ec:	cec080e7          	jalr	-788(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800056f0:	00009797          	auipc	a5,0x9
    800056f4:	a327b823          	sd	s2,-1488(a5) # 8000e120 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800056f8:	00399793          	slli	a5,s3,0x3
    800056fc:	00f78793          	addi	a5,a5,15
    80005700:	ff07f793          	andi	a5,a5,-16
    80005704:	40f10133          	sub	sp,sp,a5
    80005708:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    8000570c:	0019871b          	addiw	a4,s3,1
    80005710:	00171793          	slli	a5,a4,0x1
    80005714:	00e787b3          	add	a5,a5,a4
    80005718:	00379793          	slli	a5,a5,0x3
    8000571c:	00f78793          	addi	a5,a5,15
    80005720:	ff07f793          	andi	a5,a5,-16
    80005724:	40f10133          	sub	sp,sp,a5
    80005728:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    8000572c:	00199493          	slli	s1,s3,0x1
    80005730:	013484b3          	add	s1,s1,s3
    80005734:	00349493          	slli	s1,s1,0x3
    80005738:	009b04b3          	add	s1,s6,s1
    8000573c:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80005740:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80005744:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005748:	02800513          	li	a0,40
    8000574c:	ffffc097          	auipc	ra,0xffffc
    80005750:	a70080e7          	jalr	-1424(ra) # 800011bc <_Znwm>
    80005754:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80005758:	ffffc097          	auipc	ra,0xffffc
    8000575c:	c48080e7          	jalr	-952(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80005760:	00008797          	auipc	a5,0x8
    80005764:	78078793          	addi	a5,a5,1920 # 8000dee0 <_ZTV8Consumer+0x10>
    80005768:	00fbb023          	sd	a5,0(s7)
    8000576c:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80005770:	000b8513          	mv	a0,s7
    80005774:	ffffc097          	auipc	ra,0xffffc
    80005778:	b44080e7          	jalr	-1212(ra) # 800012b8 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    8000577c:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80005780:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80005784:	00009797          	auipc	a5,0x9
    80005788:	99c7b783          	ld	a5,-1636(a5) # 8000e120 <_ZL10waitForAll>
    8000578c:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005790:	02800513          	li	a0,40
    80005794:	ffffc097          	auipc	ra,0xffffc
    80005798:	a28080e7          	jalr	-1496(ra) # 800011bc <_Znwm>
    8000579c:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800057a0:	ffffc097          	auipc	ra,0xffffc
    800057a4:	c00080e7          	jalr	-1024(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800057a8:	00008797          	auipc	a5,0x8
    800057ac:	6e878793          	addi	a5,a5,1768 # 8000de90 <_ZTV16ProducerKeyborad+0x10>
    800057b0:	00f4b023          	sd	a5,0(s1)
    800057b4:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800057b8:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800057bc:	00048513          	mv	a0,s1
    800057c0:	ffffc097          	auipc	ra,0xffffc
    800057c4:	af8080e7          	jalr	-1288(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800057c8:	00100913          	li	s2,1
    800057cc:	0300006f          	j	800057fc <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800057d0:	00008797          	auipc	a5,0x8
    800057d4:	6e878793          	addi	a5,a5,1768 # 8000deb8 <_ZTV8Producer+0x10>
    800057d8:	00fcb023          	sd	a5,0(s9)
    800057dc:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800057e0:	00391793          	slli	a5,s2,0x3
    800057e4:	00fa07b3          	add	a5,s4,a5
    800057e8:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    800057ec:	000c8513          	mv	a0,s9
    800057f0:	ffffc097          	auipc	ra,0xffffc
    800057f4:	ac8080e7          	jalr	-1336(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800057f8:	0019091b          	addiw	s2,s2,1
    800057fc:	05395263          	bge	s2,s3,80005840 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80005800:	00191493          	slli	s1,s2,0x1
    80005804:	012484b3          	add	s1,s1,s2
    80005808:	00349493          	slli	s1,s1,0x3
    8000580c:	009b04b3          	add	s1,s6,s1
    80005810:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80005814:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80005818:	00009797          	auipc	a5,0x9
    8000581c:	9087b783          	ld	a5,-1784(a5) # 8000e120 <_ZL10waitForAll>
    80005820:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80005824:	02800513          	li	a0,40
    80005828:	ffffc097          	auipc	ra,0xffffc
    8000582c:	994080e7          	jalr	-1644(ra) # 800011bc <_Znwm>
    80005830:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80005834:	ffffc097          	auipc	ra,0xffffc
    80005838:	b6c080e7          	jalr	-1172(ra) # 800013a0 <_ZN6ThreadC1Ev>
    8000583c:	f95ff06f          	j	800057d0 <_Z20testConsumerProducerv+0x244>
    putc('.');
    80005840:	02e00513          	li	a0,46
    80005844:	ffffc097          	auipc	ra,0xffffc
    80005848:	2ac080e7          	jalr	684(ra) # 80001af0 <_Z4putcc>
    Thread::dispatch();
    8000584c:	ffffc097          	auipc	ra,0xffffc
    80005850:	acc080e7          	jalr	-1332(ra) # 80001318 <_ZN6Thread8dispatchEv>
    putc('.');
    80005854:	02e00513          	li	a0,46
    80005858:	ffffc097          	auipc	ra,0xffffc
    8000585c:	298080e7          	jalr	664(ra) # 80001af0 <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    80005860:	00000493          	li	s1,0
    80005864:	0099ce63          	blt	s3,s1,80005880 <_Z20testConsumerProducerv+0x2f4>
        waitForAll->wait();
    80005868:	00009517          	auipc	a0,0x9
    8000586c:	8b853503          	ld	a0,-1864(a0) # 8000e120 <_ZL10waitForAll>
    80005870:	ffffc097          	auipc	ra,0xffffc
    80005874:	b9c080e7          	jalr	-1124(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005878:	0014849b          	addiw	s1,s1,1
    8000587c:	fe9ff06f          	j	80005864 <_Z20testConsumerProducerv+0x2d8>
    putc('.');
    80005880:	02e00513          	li	a0,46
    80005884:	ffffc097          	auipc	ra,0xffffc
    80005888:	26c080e7          	jalr	620(ra) # 80001af0 <_Z4putcc>
    delete waitForAll;
    8000588c:	00009517          	auipc	a0,0x9
    80005890:	89453503          	ld	a0,-1900(a0) # 8000e120 <_ZL10waitForAll>
    80005894:	00050863          	beqz	a0,800058a4 <_Z20testConsumerProducerv+0x318>
    80005898:	00053783          	ld	a5,0(a0)
    8000589c:	0087b783          	ld	a5,8(a5)
    800058a0:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800058a4:	00000493          	li	s1,0
    800058a8:	0080006f          	j	800058b0 <_Z20testConsumerProducerv+0x324>
    for (int i = 0; i < threadNum; i++) {
    800058ac:	0014849b          	addiw	s1,s1,1
    800058b0:	0334d263          	bge	s1,s3,800058d4 <_Z20testConsumerProducerv+0x348>
        delete producers[i];
    800058b4:	00349793          	slli	a5,s1,0x3
    800058b8:	00fa07b3          	add	a5,s4,a5
    800058bc:	0007b503          	ld	a0,0(a5)
    800058c0:	fe0506e3          	beqz	a0,800058ac <_Z20testConsumerProducerv+0x320>
    800058c4:	00053783          	ld	a5,0(a0)
    800058c8:	0087b783          	ld	a5,8(a5)
    800058cc:	000780e7          	jalr	a5
    800058d0:	fddff06f          	j	800058ac <_Z20testConsumerProducerv+0x320>
    delete consumer;
    800058d4:	000b8a63          	beqz	s7,800058e8 <_Z20testConsumerProducerv+0x35c>
    800058d8:	000bb783          	ld	a5,0(s7)
    800058dc:	0087b783          	ld	a5,8(a5)
    800058e0:	000b8513          	mv	a0,s7
    800058e4:	000780e7          	jalr	a5
    delete buffer;
    800058e8:	000a8e63          	beqz	s5,80005904 <_Z20testConsumerProducerv+0x378>
    800058ec:	000a8513          	mv	a0,s5
    800058f0:	00001097          	auipc	ra,0x1
    800058f4:	46c080e7          	jalr	1132(ra) # 80006d5c <_ZN9BufferCPPD1Ev>
    800058f8:	000a8513          	mv	a0,s5
    800058fc:	ffffc097          	auipc	ra,0xffffc
    80005900:	8e8080e7          	jalr	-1816(ra) # 800011e4 <_ZdlPv>
    80005904:	000c0113          	mv	sp,s8
}
    80005908:	f8040113          	addi	sp,s0,-128
    8000590c:	07813083          	ld	ra,120(sp)
    80005910:	07013403          	ld	s0,112(sp)
    80005914:	06813483          	ld	s1,104(sp)
    80005918:	06013903          	ld	s2,96(sp)
    8000591c:	05813983          	ld	s3,88(sp)
    80005920:	05013a03          	ld	s4,80(sp)
    80005924:	04813a83          	ld	s5,72(sp)
    80005928:	04013b03          	ld	s6,64(sp)
    8000592c:	03813b83          	ld	s7,56(sp)
    80005930:	03013c03          	ld	s8,48(sp)
    80005934:	02813c83          	ld	s9,40(sp)
    80005938:	08010113          	addi	sp,sp,128
    8000593c:	00008067          	ret
    80005940:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005944:	000a8513          	mv	a0,s5
    80005948:	ffffc097          	auipc	ra,0xffffc
    8000594c:	89c080e7          	jalr	-1892(ra) # 800011e4 <_ZdlPv>
    80005950:	00048513          	mv	a0,s1
    80005954:	0000a097          	auipc	ra,0xa
    80005958:	8c4080e7          	jalr	-1852(ra) # 8000f218 <_Unwind_Resume>
    8000595c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80005960:	00090513          	mv	a0,s2
    80005964:	ffffc097          	auipc	ra,0xffffc
    80005968:	880080e7          	jalr	-1920(ra) # 800011e4 <_ZdlPv>
    8000596c:	00048513          	mv	a0,s1
    80005970:	0000a097          	auipc	ra,0xa
    80005974:	8a8080e7          	jalr	-1880(ra) # 8000f218 <_Unwind_Resume>
    80005978:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    8000597c:	000b8513          	mv	a0,s7
    80005980:	ffffc097          	auipc	ra,0xffffc
    80005984:	864080e7          	jalr	-1948(ra) # 800011e4 <_ZdlPv>
    80005988:	00048513          	mv	a0,s1
    8000598c:	0000a097          	auipc	ra,0xa
    80005990:	88c080e7          	jalr	-1908(ra) # 8000f218 <_Unwind_Resume>
    80005994:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005998:	00048513          	mv	a0,s1
    8000599c:	ffffc097          	auipc	ra,0xffffc
    800059a0:	848080e7          	jalr	-1976(ra) # 800011e4 <_ZdlPv>
    800059a4:	00090513          	mv	a0,s2
    800059a8:	0000a097          	auipc	ra,0xa
    800059ac:	870080e7          	jalr	-1936(ra) # 8000f218 <_Unwind_Resume>
    800059b0:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800059b4:	000c8513          	mv	a0,s9
    800059b8:	ffffc097          	auipc	ra,0xffffc
    800059bc:	82c080e7          	jalr	-2004(ra) # 800011e4 <_ZdlPv>
    800059c0:	00048513          	mv	a0,s1
    800059c4:	0000a097          	auipc	ra,0xa
    800059c8:	854080e7          	jalr	-1964(ra) # 8000f218 <_Unwind_Resume>

00000000800059cc <_ZN8Consumer3runEv>:
    void run() override {
    800059cc:	fd010113          	addi	sp,sp,-48
    800059d0:	02113423          	sd	ra,40(sp)
    800059d4:	02813023          	sd	s0,32(sp)
    800059d8:	00913c23          	sd	s1,24(sp)
    800059dc:	01213823          	sd	s2,16(sp)
    800059e0:	01313423          	sd	s3,8(sp)
    800059e4:	03010413          	addi	s0,sp,48
    800059e8:	00050913          	mv	s2,a0
        int i = 0;
    800059ec:	00000993          	li	s3,0
    800059f0:	0100006f          	j	80005a00 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800059f4:	00a00513          	li	a0,10
    800059f8:	ffffc097          	auipc	ra,0xffffc
    800059fc:	adc080e7          	jalr	-1316(ra) # 800014d4 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80005a00:	00008797          	auipc	a5,0x8
    80005a04:	7187a783          	lw	a5,1816(a5) # 8000e118 <_ZL9threadEnd>
    80005a08:	04079a63          	bnez	a5,80005a5c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80005a0c:	02093783          	ld	a5,32(s2)
    80005a10:	0087b503          	ld	a0,8(a5)
    80005a14:	00001097          	auipc	ra,0x1
    80005a18:	234080e7          	jalr	564(ra) # 80006c48 <_ZN9BufferCPP3getEv>
            i++;
    80005a1c:	0019849b          	addiw	s1,s3,1
    80005a20:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80005a24:	0ff57513          	andi	a0,a0,255
    80005a28:	ffffc097          	auipc	ra,0xffffc
    80005a2c:	aac080e7          	jalr	-1364(ra) # 800014d4 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80005a30:	05000793          	li	a5,80
    80005a34:	02f4e4bb          	remw	s1,s1,a5
    80005a38:	fc0494e3          	bnez	s1,80005a00 <_ZN8Consumer3runEv+0x34>
    80005a3c:	fb9ff06f          	j	800059f4 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80005a40:	02093783          	ld	a5,32(s2)
    80005a44:	0087b503          	ld	a0,8(a5)
    80005a48:	00001097          	auipc	ra,0x1
    80005a4c:	200080e7          	jalr	512(ra) # 80006c48 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80005a50:	0ff57513          	andi	a0,a0,255
    80005a54:	ffffc097          	auipc	ra,0xffffc
    80005a58:	a80080e7          	jalr	-1408(ra) # 800014d4 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005a5c:	02093783          	ld	a5,32(s2)
    80005a60:	0087b503          	ld	a0,8(a5)
    80005a64:	00001097          	auipc	ra,0x1
    80005a68:	270080e7          	jalr	624(ra) # 80006cd4 <_ZN9BufferCPP6getCntEv>
    80005a6c:	fca04ae3          	bgtz	a0,80005a40 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80005a70:	02093783          	ld	a5,32(s2)
    80005a74:	0107b503          	ld	a0,16(a5)
    80005a78:	ffffc097          	auipc	ra,0xffffc
    80005a7c:	9c0080e7          	jalr	-1600(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005a80:	02813083          	ld	ra,40(sp)
    80005a84:	02013403          	ld	s0,32(sp)
    80005a88:	01813483          	ld	s1,24(sp)
    80005a8c:	01013903          	ld	s2,16(sp)
    80005a90:	00813983          	ld	s3,8(sp)
    80005a94:	03010113          	addi	sp,sp,48
    80005a98:	00008067          	ret

0000000080005a9c <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80005a9c:	ff010113          	addi	sp,sp,-16
    80005aa0:	00113423          	sd	ra,8(sp)
    80005aa4:	00813023          	sd	s0,0(sp)
    80005aa8:	01010413          	addi	s0,sp,16
    80005aac:	00008797          	auipc	a5,0x8
    80005ab0:	43478793          	addi	a5,a5,1076 # 8000dee0 <_ZTV8Consumer+0x10>
    80005ab4:	00f53023          	sd	a5,0(a0)
    80005ab8:	ffffb097          	auipc	ra,0xffffb
    80005abc:	694080e7          	jalr	1684(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005ac0:	00813083          	ld	ra,8(sp)
    80005ac4:	00013403          	ld	s0,0(sp)
    80005ac8:	01010113          	addi	sp,sp,16
    80005acc:	00008067          	ret

0000000080005ad0 <_ZN8ConsumerD0Ev>:
    80005ad0:	fe010113          	addi	sp,sp,-32
    80005ad4:	00113c23          	sd	ra,24(sp)
    80005ad8:	00813823          	sd	s0,16(sp)
    80005adc:	00913423          	sd	s1,8(sp)
    80005ae0:	02010413          	addi	s0,sp,32
    80005ae4:	00050493          	mv	s1,a0
    80005ae8:	00008797          	auipc	a5,0x8
    80005aec:	3f878793          	addi	a5,a5,1016 # 8000dee0 <_ZTV8Consumer+0x10>
    80005af0:	00f53023          	sd	a5,0(a0)
    80005af4:	ffffb097          	auipc	ra,0xffffb
    80005af8:	658080e7          	jalr	1624(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005afc:	00048513          	mv	a0,s1
    80005b00:	ffffb097          	auipc	ra,0xffffb
    80005b04:	6e4080e7          	jalr	1764(ra) # 800011e4 <_ZdlPv>
    80005b08:	01813083          	ld	ra,24(sp)
    80005b0c:	01013403          	ld	s0,16(sp)
    80005b10:	00813483          	ld	s1,8(sp)
    80005b14:	02010113          	addi	sp,sp,32
    80005b18:	00008067          	ret

0000000080005b1c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80005b1c:	ff010113          	addi	sp,sp,-16
    80005b20:	00113423          	sd	ra,8(sp)
    80005b24:	00813023          	sd	s0,0(sp)
    80005b28:	01010413          	addi	s0,sp,16
    80005b2c:	00008797          	auipc	a5,0x8
    80005b30:	36478793          	addi	a5,a5,868 # 8000de90 <_ZTV16ProducerKeyborad+0x10>
    80005b34:	00f53023          	sd	a5,0(a0)
    80005b38:	ffffb097          	auipc	ra,0xffffb
    80005b3c:	614080e7          	jalr	1556(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005b40:	00813083          	ld	ra,8(sp)
    80005b44:	00013403          	ld	s0,0(sp)
    80005b48:	01010113          	addi	sp,sp,16
    80005b4c:	00008067          	ret

0000000080005b50 <_ZN16ProducerKeyboradD0Ev>:
    80005b50:	fe010113          	addi	sp,sp,-32
    80005b54:	00113c23          	sd	ra,24(sp)
    80005b58:	00813823          	sd	s0,16(sp)
    80005b5c:	00913423          	sd	s1,8(sp)
    80005b60:	02010413          	addi	s0,sp,32
    80005b64:	00050493          	mv	s1,a0
    80005b68:	00008797          	auipc	a5,0x8
    80005b6c:	32878793          	addi	a5,a5,808 # 8000de90 <_ZTV16ProducerKeyborad+0x10>
    80005b70:	00f53023          	sd	a5,0(a0)
    80005b74:	ffffb097          	auipc	ra,0xffffb
    80005b78:	5d8080e7          	jalr	1496(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005b7c:	00048513          	mv	a0,s1
    80005b80:	ffffb097          	auipc	ra,0xffffb
    80005b84:	664080e7          	jalr	1636(ra) # 800011e4 <_ZdlPv>
    80005b88:	01813083          	ld	ra,24(sp)
    80005b8c:	01013403          	ld	s0,16(sp)
    80005b90:	00813483          	ld	s1,8(sp)
    80005b94:	02010113          	addi	sp,sp,32
    80005b98:	00008067          	ret

0000000080005b9c <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005b9c:	ff010113          	addi	sp,sp,-16
    80005ba0:	00113423          	sd	ra,8(sp)
    80005ba4:	00813023          	sd	s0,0(sp)
    80005ba8:	01010413          	addi	s0,sp,16
    80005bac:	00008797          	auipc	a5,0x8
    80005bb0:	30c78793          	addi	a5,a5,780 # 8000deb8 <_ZTV8Producer+0x10>
    80005bb4:	00f53023          	sd	a5,0(a0)
    80005bb8:	ffffb097          	auipc	ra,0xffffb
    80005bbc:	594080e7          	jalr	1428(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005bc0:	00813083          	ld	ra,8(sp)
    80005bc4:	00013403          	ld	s0,0(sp)
    80005bc8:	01010113          	addi	sp,sp,16
    80005bcc:	00008067          	ret

0000000080005bd0 <_ZN8ProducerD0Ev>:
    80005bd0:	fe010113          	addi	sp,sp,-32
    80005bd4:	00113c23          	sd	ra,24(sp)
    80005bd8:	00813823          	sd	s0,16(sp)
    80005bdc:	00913423          	sd	s1,8(sp)
    80005be0:	02010413          	addi	s0,sp,32
    80005be4:	00050493          	mv	s1,a0
    80005be8:	00008797          	auipc	a5,0x8
    80005bec:	2d078793          	addi	a5,a5,720 # 8000deb8 <_ZTV8Producer+0x10>
    80005bf0:	00f53023          	sd	a5,0(a0)
    80005bf4:	ffffb097          	auipc	ra,0xffffb
    80005bf8:	558080e7          	jalr	1368(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005bfc:	00048513          	mv	a0,s1
    80005c00:	ffffb097          	auipc	ra,0xffffb
    80005c04:	5e4080e7          	jalr	1508(ra) # 800011e4 <_ZdlPv>
    80005c08:	01813083          	ld	ra,24(sp)
    80005c0c:	01013403          	ld	s0,16(sp)
    80005c10:	00813483          	ld	s1,8(sp)
    80005c14:	02010113          	addi	sp,sp,32
    80005c18:	00008067          	ret

0000000080005c1c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80005c1c:	fe010113          	addi	sp,sp,-32
    80005c20:	00113c23          	sd	ra,24(sp)
    80005c24:	00813823          	sd	s0,16(sp)
    80005c28:	00913423          	sd	s1,8(sp)
    80005c2c:	02010413          	addi	s0,sp,32
    80005c30:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80005c34:	ffffc097          	auipc	ra,0xffffc
    80005c38:	e94080e7          	jalr	-364(ra) # 80001ac8 <_Z4getcv>
    80005c3c:	0005059b          	sext.w	a1,a0
    80005c40:	01b00793          	li	a5,27
    80005c44:	00f58c63          	beq	a1,a5,80005c5c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80005c48:	0204b783          	ld	a5,32(s1)
    80005c4c:	0087b503          	ld	a0,8(a5)
    80005c50:	00001097          	auipc	ra,0x1
    80005c54:	f68080e7          	jalr	-152(ra) # 80006bb8 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80005c58:	fddff06f          	j	80005c34 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005c5c:	00100793          	li	a5,1
    80005c60:	00008717          	auipc	a4,0x8
    80005c64:	4af72c23          	sw	a5,1208(a4) # 8000e118 <_ZL9threadEnd>
        td->buffer->put('!');
    80005c68:	0204b783          	ld	a5,32(s1)
    80005c6c:	02100593          	li	a1,33
    80005c70:	0087b503          	ld	a0,8(a5)
    80005c74:	00001097          	auipc	ra,0x1
    80005c78:	f44080e7          	jalr	-188(ra) # 80006bb8 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80005c7c:	0204b783          	ld	a5,32(s1)
    80005c80:	0107b503          	ld	a0,16(a5)
    80005c84:	ffffb097          	auipc	ra,0xffffb
    80005c88:	7b4080e7          	jalr	1972(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005c8c:	01813083          	ld	ra,24(sp)
    80005c90:	01013403          	ld	s0,16(sp)
    80005c94:	00813483          	ld	s1,8(sp)
    80005c98:	02010113          	addi	sp,sp,32
    80005c9c:	00008067          	ret

0000000080005ca0 <_ZN8Producer3runEv>:
    void run() override {
    80005ca0:	fe010113          	addi	sp,sp,-32
    80005ca4:	00113c23          	sd	ra,24(sp)
    80005ca8:	00813823          	sd	s0,16(sp)
    80005cac:	00913423          	sd	s1,8(sp)
    80005cb0:	01213023          	sd	s2,0(sp)
    80005cb4:	02010413          	addi	s0,sp,32
    80005cb8:	00050493          	mv	s1,a0
        int i = 0;
    80005cbc:	00000913          	li	s2,0
        while (!threadEnd) {
    80005cc0:	00008797          	auipc	a5,0x8
    80005cc4:	4587a783          	lw	a5,1112(a5) # 8000e118 <_ZL9threadEnd>
    80005cc8:	04079263          	bnez	a5,80005d0c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80005ccc:	0204b783          	ld	a5,32(s1)
    80005cd0:	0007a583          	lw	a1,0(a5)
    80005cd4:	0305859b          	addiw	a1,a1,48
    80005cd8:	0087b503          	ld	a0,8(a5)
    80005cdc:	00001097          	auipc	ra,0x1
    80005ce0:	edc080e7          	jalr	-292(ra) # 80006bb8 <_ZN9BufferCPP3putEi>
            i++;
    80005ce4:	0019071b          	addiw	a4,s2,1
    80005ce8:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80005cec:	0204b783          	ld	a5,32(s1)
    80005cf0:	0007a783          	lw	a5,0(a5)
    80005cf4:	00e787bb          	addw	a5,a5,a4
    80005cf8:	00500513          	li	a0,5
    80005cfc:	02a7e53b          	remw	a0,a5,a0
    80005d00:	ffffb097          	auipc	ra,0xffffb
    80005d04:	640080e7          	jalr	1600(ra) # 80001340 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80005d08:	fb9ff06f          	j	80005cc0 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80005d0c:	0204b783          	ld	a5,32(s1)
    80005d10:	0107b503          	ld	a0,16(a5)
    80005d14:	ffffb097          	auipc	ra,0xffffb
    80005d18:	724080e7          	jalr	1828(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005d1c:	01813083          	ld	ra,24(sp)
    80005d20:	01013403          	ld	s0,16(sp)
    80005d24:	00813483          	ld	s1,8(sp)
    80005d28:	00013903          	ld	s2,0(sp)
    80005d2c:	02010113          	addi	sp,sp,32
    80005d30:	00008067          	ret

0000000080005d34 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005d34:	fe010113          	addi	sp,sp,-32
    80005d38:	00113c23          	sd	ra,24(sp)
    80005d3c:	00813823          	sd	s0,16(sp)
    80005d40:	00913423          	sd	s1,8(sp)
    80005d44:	01213023          	sd	s2,0(sp)
    80005d48:	02010413          	addi	s0,sp,32
    80005d4c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005d50:	00100793          	li	a5,1
    80005d54:	02a7f863          	bgeu	a5,a0,80005d84 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005d58:	00a00793          	li	a5,10
    80005d5c:	02f577b3          	remu	a5,a0,a5
    80005d60:	02078e63          	beqz	a5,80005d9c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005d64:	fff48513          	addi	a0,s1,-1
    80005d68:	00000097          	auipc	ra,0x0
    80005d6c:	fcc080e7          	jalr	-52(ra) # 80005d34 <_ZL9fibonaccim>
    80005d70:	00050913          	mv	s2,a0
    80005d74:	ffe48513          	addi	a0,s1,-2
    80005d78:	00000097          	auipc	ra,0x0
    80005d7c:	fbc080e7          	jalr	-68(ra) # 80005d34 <_ZL9fibonaccim>
    80005d80:	00a90533          	add	a0,s2,a0
}
    80005d84:	01813083          	ld	ra,24(sp)
    80005d88:	01013403          	ld	s0,16(sp)
    80005d8c:	00813483          	ld	s1,8(sp)
    80005d90:	00013903          	ld	s2,0(sp)
    80005d94:	02010113          	addi	sp,sp,32
    80005d98:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005d9c:	ffffc097          	auipc	ra,0xffffc
    80005da0:	c00080e7          	jalr	-1024(ra) # 8000199c <_Z15thread_dispatchv>
    80005da4:	fc1ff06f          	j	80005d64 <_ZL9fibonaccim+0x30>

0000000080005da8 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005da8:	fe010113          	addi	sp,sp,-32
    80005dac:	00113c23          	sd	ra,24(sp)
    80005db0:	00813823          	sd	s0,16(sp)
    80005db4:	00913423          	sd	s1,8(sp)
    80005db8:	01213023          	sd	s2,0(sp)
    80005dbc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005dc0:	00a00493          	li	s1,10
    80005dc4:	0400006f          	j	80005e04 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005dc8:	00005517          	auipc	a0,0x5
    80005dcc:	76850513          	addi	a0,a0,1896 # 8000b530 <CONSOLE_STATUS+0x520>
    80005dd0:	00002097          	auipc	ra,0x2
    80005dd4:	ba8080e7          	jalr	-1112(ra) # 80007978 <_Z11printStringPKc>
    80005dd8:	00000613          	li	a2,0
    80005ddc:	00a00593          	li	a1,10
    80005de0:	00048513          	mv	a0,s1
    80005de4:	00002097          	auipc	ra,0x2
    80005de8:	d44080e7          	jalr	-700(ra) # 80007b28 <_Z8printIntiii>
    80005dec:	00006517          	auipc	a0,0x6
    80005df0:	a0c50513          	addi	a0,a0,-1524 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80005df4:	00002097          	auipc	ra,0x2
    80005df8:	b84080e7          	jalr	-1148(ra) # 80007978 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005dfc:	0014849b          	addiw	s1,s1,1
    80005e00:	0ff4f493          	andi	s1,s1,255
    80005e04:	00c00793          	li	a5,12
    80005e08:	fc97f0e3          	bgeu	a5,s1,80005dc8 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005e0c:	00005517          	auipc	a0,0x5
    80005e10:	72c50513          	addi	a0,a0,1836 # 8000b538 <CONSOLE_STATUS+0x528>
    80005e14:	00002097          	auipc	ra,0x2
    80005e18:	b64080e7          	jalr	-1180(ra) # 80007978 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005e1c:	00500313          	li	t1,5
    thread_dispatch();
    80005e20:	ffffc097          	auipc	ra,0xffffc
    80005e24:	b7c080e7          	jalr	-1156(ra) # 8000199c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005e28:	01000513          	li	a0,16
    80005e2c:	00000097          	auipc	ra,0x0
    80005e30:	f08080e7          	jalr	-248(ra) # 80005d34 <_ZL9fibonaccim>
    80005e34:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005e38:	00005517          	auipc	a0,0x5
    80005e3c:	71050513          	addi	a0,a0,1808 # 8000b548 <CONSOLE_STATUS+0x538>
    80005e40:	00002097          	auipc	ra,0x2
    80005e44:	b38080e7          	jalr	-1224(ra) # 80007978 <_Z11printStringPKc>
    80005e48:	00000613          	li	a2,0
    80005e4c:	00a00593          	li	a1,10
    80005e50:	0009051b          	sext.w	a0,s2
    80005e54:	00002097          	auipc	ra,0x2
    80005e58:	cd4080e7          	jalr	-812(ra) # 80007b28 <_Z8printIntiii>
    80005e5c:	00006517          	auipc	a0,0x6
    80005e60:	99c50513          	addi	a0,a0,-1636 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80005e64:	00002097          	auipc	ra,0x2
    80005e68:	b14080e7          	jalr	-1260(ra) # 80007978 <_Z11printStringPKc>
    80005e6c:	0400006f          	j	80005eac <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005e70:	00005517          	auipc	a0,0x5
    80005e74:	6c050513          	addi	a0,a0,1728 # 8000b530 <CONSOLE_STATUS+0x520>
    80005e78:	00002097          	auipc	ra,0x2
    80005e7c:	b00080e7          	jalr	-1280(ra) # 80007978 <_Z11printStringPKc>
    80005e80:	00000613          	li	a2,0
    80005e84:	00a00593          	li	a1,10
    80005e88:	00048513          	mv	a0,s1
    80005e8c:	00002097          	auipc	ra,0x2
    80005e90:	c9c080e7          	jalr	-868(ra) # 80007b28 <_Z8printIntiii>
    80005e94:	00006517          	auipc	a0,0x6
    80005e98:	96450513          	addi	a0,a0,-1692 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80005e9c:	00002097          	auipc	ra,0x2
    80005ea0:	adc080e7          	jalr	-1316(ra) # 80007978 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005ea4:	0014849b          	addiw	s1,s1,1
    80005ea8:	0ff4f493          	andi	s1,s1,255
    80005eac:	00f00793          	li	a5,15
    80005eb0:	fc97f0e3          	bgeu	a5,s1,80005e70 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005eb4:	00005517          	auipc	a0,0x5
    80005eb8:	6a450513          	addi	a0,a0,1700 # 8000b558 <CONSOLE_STATUS+0x548>
    80005ebc:	00002097          	auipc	ra,0x2
    80005ec0:	abc080e7          	jalr	-1348(ra) # 80007978 <_Z11printStringPKc>
    finishedD = true;
    80005ec4:	00100793          	li	a5,1
    80005ec8:	00008717          	auipc	a4,0x8
    80005ecc:	26f70023          	sb	a5,608(a4) # 8000e128 <_ZL9finishedD>
    thread_dispatch();
    80005ed0:	ffffc097          	auipc	ra,0xffffc
    80005ed4:	acc080e7          	jalr	-1332(ra) # 8000199c <_Z15thread_dispatchv>
}
    80005ed8:	01813083          	ld	ra,24(sp)
    80005edc:	01013403          	ld	s0,16(sp)
    80005ee0:	00813483          	ld	s1,8(sp)
    80005ee4:	00013903          	ld	s2,0(sp)
    80005ee8:	02010113          	addi	sp,sp,32
    80005eec:	00008067          	ret

0000000080005ef0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005ef0:	fe010113          	addi	sp,sp,-32
    80005ef4:	00113c23          	sd	ra,24(sp)
    80005ef8:	00813823          	sd	s0,16(sp)
    80005efc:	00913423          	sd	s1,8(sp)
    80005f00:	01213023          	sd	s2,0(sp)
    80005f04:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005f08:	00000493          	li	s1,0
    80005f0c:	0400006f          	j	80005f4c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005f10:	00005517          	auipc	a0,0x5
    80005f14:	65850513          	addi	a0,a0,1624 # 8000b568 <CONSOLE_STATUS+0x558>
    80005f18:	00002097          	auipc	ra,0x2
    80005f1c:	a60080e7          	jalr	-1440(ra) # 80007978 <_Z11printStringPKc>
    80005f20:	00000613          	li	a2,0
    80005f24:	00a00593          	li	a1,10
    80005f28:	00048513          	mv	a0,s1
    80005f2c:	00002097          	auipc	ra,0x2
    80005f30:	bfc080e7          	jalr	-1028(ra) # 80007b28 <_Z8printIntiii>
    80005f34:	00006517          	auipc	a0,0x6
    80005f38:	8c450513          	addi	a0,a0,-1852 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80005f3c:	00002097          	auipc	ra,0x2
    80005f40:	a3c080e7          	jalr	-1476(ra) # 80007978 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005f44:	0014849b          	addiw	s1,s1,1
    80005f48:	0ff4f493          	andi	s1,s1,255
    80005f4c:	00200793          	li	a5,2
    80005f50:	fc97f0e3          	bgeu	a5,s1,80005f10 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005f54:	00005517          	auipc	a0,0x5
    80005f58:	61c50513          	addi	a0,a0,1564 # 8000b570 <CONSOLE_STATUS+0x560>
    80005f5c:	00002097          	auipc	ra,0x2
    80005f60:	a1c080e7          	jalr	-1508(ra) # 80007978 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005f64:	00700313          	li	t1,7
    thread_dispatch();
    80005f68:	ffffc097          	auipc	ra,0xffffc
    80005f6c:	a34080e7          	jalr	-1484(ra) # 8000199c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005f70:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005f74:	00005517          	auipc	a0,0x5
    80005f78:	60c50513          	addi	a0,a0,1548 # 8000b580 <CONSOLE_STATUS+0x570>
    80005f7c:	00002097          	auipc	ra,0x2
    80005f80:	9fc080e7          	jalr	-1540(ra) # 80007978 <_Z11printStringPKc>
    80005f84:	00000613          	li	a2,0
    80005f88:	00a00593          	li	a1,10
    80005f8c:	0009051b          	sext.w	a0,s2
    80005f90:	00002097          	auipc	ra,0x2
    80005f94:	b98080e7          	jalr	-1128(ra) # 80007b28 <_Z8printIntiii>
    80005f98:	00006517          	auipc	a0,0x6
    80005f9c:	86050513          	addi	a0,a0,-1952 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80005fa0:	00002097          	auipc	ra,0x2
    80005fa4:	9d8080e7          	jalr	-1576(ra) # 80007978 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005fa8:	00c00513          	li	a0,12
    80005fac:	00000097          	auipc	ra,0x0
    80005fb0:	d88080e7          	jalr	-632(ra) # 80005d34 <_ZL9fibonaccim>
    80005fb4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005fb8:	00005517          	auipc	a0,0x5
    80005fbc:	5d050513          	addi	a0,a0,1488 # 8000b588 <CONSOLE_STATUS+0x578>
    80005fc0:	00002097          	auipc	ra,0x2
    80005fc4:	9b8080e7          	jalr	-1608(ra) # 80007978 <_Z11printStringPKc>
    80005fc8:	00000613          	li	a2,0
    80005fcc:	00a00593          	li	a1,10
    80005fd0:	0009051b          	sext.w	a0,s2
    80005fd4:	00002097          	auipc	ra,0x2
    80005fd8:	b54080e7          	jalr	-1196(ra) # 80007b28 <_Z8printIntiii>
    80005fdc:	00006517          	auipc	a0,0x6
    80005fe0:	81c50513          	addi	a0,a0,-2020 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80005fe4:	00002097          	auipc	ra,0x2
    80005fe8:	994080e7          	jalr	-1644(ra) # 80007978 <_Z11printStringPKc>
    80005fec:	0400006f          	j	8000602c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005ff0:	00005517          	auipc	a0,0x5
    80005ff4:	57850513          	addi	a0,a0,1400 # 8000b568 <CONSOLE_STATUS+0x558>
    80005ff8:	00002097          	auipc	ra,0x2
    80005ffc:	980080e7          	jalr	-1664(ra) # 80007978 <_Z11printStringPKc>
    80006000:	00000613          	li	a2,0
    80006004:	00a00593          	li	a1,10
    80006008:	00048513          	mv	a0,s1
    8000600c:	00002097          	auipc	ra,0x2
    80006010:	b1c080e7          	jalr	-1252(ra) # 80007b28 <_Z8printIntiii>
    80006014:	00005517          	auipc	a0,0x5
    80006018:	7e450513          	addi	a0,a0,2020 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    8000601c:	00002097          	auipc	ra,0x2
    80006020:	95c080e7          	jalr	-1700(ra) # 80007978 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006024:	0014849b          	addiw	s1,s1,1
    80006028:	0ff4f493          	andi	s1,s1,255
    8000602c:	00500793          	li	a5,5
    80006030:	fc97f0e3          	bgeu	a5,s1,80005ff0 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80006034:	00005517          	auipc	a0,0x5
    80006038:	56450513          	addi	a0,a0,1380 # 8000b598 <CONSOLE_STATUS+0x588>
    8000603c:	00002097          	auipc	ra,0x2
    80006040:	93c080e7          	jalr	-1732(ra) # 80007978 <_Z11printStringPKc>
    finishedC = true;
    80006044:	00100793          	li	a5,1
    80006048:	00008717          	auipc	a4,0x8
    8000604c:	0ef700a3          	sb	a5,225(a4) # 8000e129 <_ZL9finishedC>
    thread_dispatch();
    80006050:	ffffc097          	auipc	ra,0xffffc
    80006054:	94c080e7          	jalr	-1716(ra) # 8000199c <_Z15thread_dispatchv>
}
    80006058:	01813083          	ld	ra,24(sp)
    8000605c:	01013403          	ld	s0,16(sp)
    80006060:	00813483          	ld	s1,8(sp)
    80006064:	00013903          	ld	s2,0(sp)
    80006068:	02010113          	addi	sp,sp,32
    8000606c:	00008067          	ret

0000000080006070 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006070:	fe010113          	addi	sp,sp,-32
    80006074:	00113c23          	sd	ra,24(sp)
    80006078:	00813823          	sd	s0,16(sp)
    8000607c:	00913423          	sd	s1,8(sp)
    80006080:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006084:	00000493          	li	s1,0
    80006088:	0340006f          	j	800060bc <_ZL11workerBodyBPv+0x4c>
        for (uint64 j = 0; j < 100; j++) {
    8000608c:	00168693          	addi	a3,a3,1
    80006090:	06300793          	li	a5,99
    80006094:	00d7ee63          	bltu	a5,a3,800060b0 <_ZL11workerBodyBPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006098:	00000713          	li	a4,0
    8000609c:	000077b7          	lui	a5,0x7
    800060a0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800060a4:	fee7e4e3          	bltu	a5,a4,8000608c <_ZL11workerBodyBPv+0x1c>
    800060a8:	00170713          	addi	a4,a4,1
    800060ac:	ff1ff06f          	j	8000609c <_ZL11workerBodyBPv+0x2c>
        if (i == 10) {
    800060b0:	00a00793          	li	a5,10
    800060b4:	04f48663          	beq	s1,a5,80006100 <_ZL11workerBodyBPv+0x90>
    for (uint64 i = 0; i < 16; i++) {
    800060b8:	00148493          	addi	s1,s1,1
    800060bc:	00f00793          	li	a5,15
    800060c0:	0497e463          	bltu	a5,s1,80006108 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800060c4:	00005517          	auipc	a0,0x5
    800060c8:	4e450513          	addi	a0,a0,1252 # 8000b5a8 <CONSOLE_STATUS+0x598>
    800060cc:	00002097          	auipc	ra,0x2
    800060d0:	8ac080e7          	jalr	-1876(ra) # 80007978 <_Z11printStringPKc>
    800060d4:	00000613          	li	a2,0
    800060d8:	00a00593          	li	a1,10
    800060dc:	0004851b          	sext.w	a0,s1
    800060e0:	00002097          	auipc	ra,0x2
    800060e4:	a48080e7          	jalr	-1464(ra) # 80007b28 <_Z8printIntiii>
    800060e8:	00005517          	auipc	a0,0x5
    800060ec:	71050513          	addi	a0,a0,1808 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800060f0:	00002097          	auipc	ra,0x2
    800060f4:	888080e7          	jalr	-1912(ra) # 80007978 <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    800060f8:	00000693          	li	a3,0
    800060fc:	f95ff06f          	j	80006090 <_ZL11workerBodyBPv+0x20>
            asm volatile("csrr t6, sepc");
    80006100:	14102ff3          	csrr	t6,sepc
    80006104:	fb5ff06f          	j	800060b8 <_ZL11workerBodyBPv+0x48>
    printString("B finished!\n");
    80006108:	00005517          	auipc	a0,0x5
    8000610c:	4a850513          	addi	a0,a0,1192 # 8000b5b0 <CONSOLE_STATUS+0x5a0>
    80006110:	00002097          	auipc	ra,0x2
    80006114:	868080e7          	jalr	-1944(ra) # 80007978 <_Z11printStringPKc>
    finishedB = true;
    80006118:	00100793          	li	a5,1
    8000611c:	00008717          	auipc	a4,0x8
    80006120:	00f70723          	sb	a5,14(a4) # 8000e12a <_ZL9finishedB>
    thread_dispatch();
    80006124:	ffffc097          	auipc	ra,0xffffc
    80006128:	878080e7          	jalr	-1928(ra) # 8000199c <_Z15thread_dispatchv>
}
    8000612c:	01813083          	ld	ra,24(sp)
    80006130:	01013403          	ld	s0,16(sp)
    80006134:	00813483          	ld	s1,8(sp)
    80006138:	02010113          	addi	sp,sp,32
    8000613c:	00008067          	ret

0000000080006140 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006140:	fe010113          	addi	sp,sp,-32
    80006144:	00113c23          	sd	ra,24(sp)
    80006148:	00813823          	sd	s0,16(sp)
    8000614c:	00913423          	sd	s1,8(sp)
    80006150:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006154:	00000493          	li	s1,0
    80006158:	02c0006f          	j	80006184 <_ZL11workerBodyAPv+0x44>
        for (uint64 j = 0; j < 100; j++) {
    8000615c:	00168693          	addi	a3,a3,1
    80006160:	06300793          	li	a5,99
    80006164:	00d7ee63          	bltu	a5,a3,80006180 <_ZL11workerBodyAPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006168:	00000713          	li	a4,0
    8000616c:	000077b7          	lui	a5,0x7
    80006170:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006174:	fee7e4e3          	bltu	a5,a4,8000615c <_ZL11workerBodyAPv+0x1c>
    80006178:	00170713          	addi	a4,a4,1
    8000617c:	ff1ff06f          	j	8000616c <_ZL11workerBodyAPv+0x2c>
    for (uint64 i = 0; i < 10; i++) {
    80006180:	00148493          	addi	s1,s1,1
    80006184:	00900793          	li	a5,9
    80006188:	0497e063          	bltu	a5,s1,800061c8 <_ZL11workerBodyAPv+0x88>
        printString("A: i="); printInt(i); printString("\n");
    8000618c:	00005517          	auipc	a0,0x5
    80006190:	43450513          	addi	a0,a0,1076 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80006194:	00001097          	auipc	ra,0x1
    80006198:	7e4080e7          	jalr	2020(ra) # 80007978 <_Z11printStringPKc>
    8000619c:	00000613          	li	a2,0
    800061a0:	00a00593          	li	a1,10
    800061a4:	0004851b          	sext.w	a0,s1
    800061a8:	00002097          	auipc	ra,0x2
    800061ac:	980080e7          	jalr	-1664(ra) # 80007b28 <_Z8printIntiii>
    800061b0:	00005517          	auipc	a0,0x5
    800061b4:	64850513          	addi	a0,a0,1608 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800061b8:	00001097          	auipc	ra,0x1
    800061bc:	7c0080e7          	jalr	1984(ra) # 80007978 <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    800061c0:	00000693          	li	a3,0
    800061c4:	f9dff06f          	j	80006160 <_ZL11workerBodyAPv+0x20>
    printString("A finished!\n");
    800061c8:	00005517          	auipc	a0,0x5
    800061cc:	40050513          	addi	a0,a0,1024 # 8000b5c8 <CONSOLE_STATUS+0x5b8>
    800061d0:	00001097          	auipc	ra,0x1
    800061d4:	7a8080e7          	jalr	1960(ra) # 80007978 <_Z11printStringPKc>
    finishedA = true;
    800061d8:	00100793          	li	a5,1
    800061dc:	00008717          	auipc	a4,0x8
    800061e0:	f4f707a3          	sb	a5,-177(a4) # 8000e12b <_ZL9finishedA>
}
    800061e4:	01813083          	ld	ra,24(sp)
    800061e8:	01013403          	ld	s0,16(sp)
    800061ec:	00813483          	ld	s1,8(sp)
    800061f0:	02010113          	addi	sp,sp,32
    800061f4:	00008067          	ret

00000000800061f8 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800061f8:	fd010113          	addi	sp,sp,-48
    800061fc:	02113423          	sd	ra,40(sp)
    80006200:	02813023          	sd	s0,32(sp)
    80006204:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006208:	00000613          	li	a2,0
    8000620c:	00000597          	auipc	a1,0x0
    80006210:	f3458593          	addi	a1,a1,-204 # 80006140 <_ZL11workerBodyAPv>
    80006214:	fd040513          	addi	a0,s0,-48
    80006218:	ffffb097          	auipc	ra,0xffffb
    8000621c:	6e8080e7          	jalr	1768(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80006220:	00005517          	auipc	a0,0x5
    80006224:	3b850513          	addi	a0,a0,952 # 8000b5d8 <CONSOLE_STATUS+0x5c8>
    80006228:	00001097          	auipc	ra,0x1
    8000622c:	750080e7          	jalr	1872(ra) # 80007978 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[1], workerBodyB, nullptr);
    80006230:	00000613          	li	a2,0
    80006234:	00000597          	auipc	a1,0x0
    80006238:	e3c58593          	addi	a1,a1,-452 # 80006070 <_ZL11workerBodyBPv>
    8000623c:	fd840513          	addi	a0,s0,-40
    80006240:	ffffb097          	auipc	ra,0xffffb
    80006244:	6c0080e7          	jalr	1728(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80006248:	00005517          	auipc	a0,0x5
    8000624c:	3a850513          	addi	a0,a0,936 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    80006250:	00001097          	auipc	ra,0x1
    80006254:	728080e7          	jalr	1832(ra) # 80007978 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[2], workerBodyC, nullptr);
    80006258:	00000613          	li	a2,0
    8000625c:	00000597          	auipc	a1,0x0
    80006260:	c9458593          	addi	a1,a1,-876 # 80005ef0 <_ZL11workerBodyCPv>
    80006264:	fe040513          	addi	a0,s0,-32
    80006268:	ffffb097          	auipc	ra,0xffffb
    8000626c:	698080e7          	jalr	1688(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80006270:	00005517          	auipc	a0,0x5
    80006274:	39850513          	addi	a0,a0,920 # 8000b608 <CONSOLE_STATUS+0x5f8>
    80006278:	00001097          	auipc	ra,0x1
    8000627c:	700080e7          	jalr	1792(ra) # 80007978 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[3], workerBodyD, nullptr);
    80006280:	00000613          	li	a2,0
    80006284:	00000597          	auipc	a1,0x0
    80006288:	b2458593          	addi	a1,a1,-1244 # 80005da8 <_ZL11workerBodyDPv>
    8000628c:	fe840513          	addi	a0,s0,-24
    80006290:	ffffb097          	auipc	ra,0xffffb
    80006294:	670080e7          	jalr	1648(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006298:	00005517          	auipc	a0,0x5
    8000629c:	38850513          	addi	a0,a0,904 # 8000b620 <CONSOLE_STATUS+0x610>
    800062a0:	00001097          	auipc	ra,0x1
    800062a4:	6d8080e7          	jalr	1752(ra) # 80007978 <_Z11printStringPKc>
    800062a8:	00c0006f          	j	800062b4 <_Z16System_Mode_testv+0xbc>
    // testUser();

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800062ac:	ffffb097          	auipc	ra,0xffffb
    800062b0:	6f0080e7          	jalr	1776(ra) # 8000199c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800062b4:	00008797          	auipc	a5,0x8
    800062b8:	e777c783          	lbu	a5,-393(a5) # 8000e12b <_ZL9finishedA>
    800062bc:	fe0788e3          	beqz	a5,800062ac <_Z16System_Mode_testv+0xb4>
    800062c0:	00008797          	auipc	a5,0x8
    800062c4:	e6a7c783          	lbu	a5,-406(a5) # 8000e12a <_ZL9finishedB>
    800062c8:	fe0782e3          	beqz	a5,800062ac <_Z16System_Mode_testv+0xb4>
    800062cc:	00008797          	auipc	a5,0x8
    800062d0:	e5d7c783          	lbu	a5,-419(a5) # 8000e129 <_ZL9finishedC>
    800062d4:	fc078ce3          	beqz	a5,800062ac <_Z16System_Mode_testv+0xb4>
    800062d8:	00008797          	auipc	a5,0x8
    800062dc:	e507c783          	lbu	a5,-432(a5) # 8000e128 <_ZL9finishedD>
    800062e0:	fc0786e3          	beqz	a5,800062ac <_Z16System_Mode_testv+0xb4>
    }

}
    800062e4:	02813083          	ld	ra,40(sp)
    800062e8:	02013403          	ld	s0,32(sp)
    800062ec:	03010113          	addi	sp,sp,48
    800062f0:	00008067          	ret

00000000800062f4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800062f4:	fe010113          	addi	sp,sp,-32
    800062f8:	00113c23          	sd	ra,24(sp)
    800062fc:	00813823          	sd	s0,16(sp)
    80006300:	00913423          	sd	s1,8(sp)
    80006304:	01213023          	sd	s2,0(sp)
    80006308:	02010413          	addi	s0,sp,32
    8000630c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006310:	00100793          	li	a5,1
    80006314:	02a7f863          	bgeu	a5,a0,80006344 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006318:	00a00793          	li	a5,10
    8000631c:	02f577b3          	remu	a5,a0,a5
    80006320:	02078e63          	beqz	a5,8000635c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006324:	fff48513          	addi	a0,s1,-1
    80006328:	00000097          	auipc	ra,0x0
    8000632c:	fcc080e7          	jalr	-52(ra) # 800062f4 <_ZL9fibonaccim>
    80006330:	00050913          	mv	s2,a0
    80006334:	ffe48513          	addi	a0,s1,-2
    80006338:	00000097          	auipc	ra,0x0
    8000633c:	fbc080e7          	jalr	-68(ra) # 800062f4 <_ZL9fibonaccim>
    80006340:	00a90533          	add	a0,s2,a0
}
    80006344:	01813083          	ld	ra,24(sp)
    80006348:	01013403          	ld	s0,16(sp)
    8000634c:	00813483          	ld	s1,8(sp)
    80006350:	00013903          	ld	s2,0(sp)
    80006354:	02010113          	addi	sp,sp,32
    80006358:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000635c:	ffffb097          	auipc	ra,0xffffb
    80006360:	640080e7          	jalr	1600(ra) # 8000199c <_Z15thread_dispatchv>
    80006364:	fc1ff06f          	j	80006324 <_ZL9fibonaccim+0x30>

0000000080006368 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006368:	fe010113          	addi	sp,sp,-32
    8000636c:	00113c23          	sd	ra,24(sp)
    80006370:	00813823          	sd	s0,16(sp)
    80006374:	00913423          	sd	s1,8(sp)
    80006378:	01213023          	sd	s2,0(sp)
    8000637c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006380:	00a00493          	li	s1,10
    80006384:	0400006f          	j	800063c4 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006388:	00005517          	auipc	a0,0x5
    8000638c:	1a850513          	addi	a0,a0,424 # 8000b530 <CONSOLE_STATUS+0x520>
    80006390:	00001097          	auipc	ra,0x1
    80006394:	5e8080e7          	jalr	1512(ra) # 80007978 <_Z11printStringPKc>
    80006398:	00000613          	li	a2,0
    8000639c:	00a00593          	li	a1,10
    800063a0:	00048513          	mv	a0,s1
    800063a4:	00001097          	auipc	ra,0x1
    800063a8:	784080e7          	jalr	1924(ra) # 80007b28 <_Z8printIntiii>
    800063ac:	00005517          	auipc	a0,0x5
    800063b0:	44c50513          	addi	a0,a0,1100 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800063b4:	00001097          	auipc	ra,0x1
    800063b8:	5c4080e7          	jalr	1476(ra) # 80007978 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800063bc:	0014849b          	addiw	s1,s1,1
    800063c0:	0ff4f493          	andi	s1,s1,255
    800063c4:	00c00793          	li	a5,12
    800063c8:	fc97f0e3          	bgeu	a5,s1,80006388 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800063cc:	00005517          	auipc	a0,0x5
    800063d0:	16c50513          	addi	a0,a0,364 # 8000b538 <CONSOLE_STATUS+0x528>
    800063d4:	00001097          	auipc	ra,0x1
    800063d8:	5a4080e7          	jalr	1444(ra) # 80007978 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800063dc:	00500313          	li	t1,5
    thread_dispatch();
    800063e0:	ffffb097          	auipc	ra,0xffffb
    800063e4:	5bc080e7          	jalr	1468(ra) # 8000199c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800063e8:	01000513          	li	a0,16
    800063ec:	00000097          	auipc	ra,0x0
    800063f0:	f08080e7          	jalr	-248(ra) # 800062f4 <_ZL9fibonaccim>
    800063f4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800063f8:	00005517          	auipc	a0,0x5
    800063fc:	15050513          	addi	a0,a0,336 # 8000b548 <CONSOLE_STATUS+0x538>
    80006400:	00001097          	auipc	ra,0x1
    80006404:	578080e7          	jalr	1400(ra) # 80007978 <_Z11printStringPKc>
    80006408:	00000613          	li	a2,0
    8000640c:	00a00593          	li	a1,10
    80006410:	0009051b          	sext.w	a0,s2
    80006414:	00001097          	auipc	ra,0x1
    80006418:	714080e7          	jalr	1812(ra) # 80007b28 <_Z8printIntiii>
    8000641c:	00005517          	auipc	a0,0x5
    80006420:	3dc50513          	addi	a0,a0,988 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80006424:	00001097          	auipc	ra,0x1
    80006428:	554080e7          	jalr	1364(ra) # 80007978 <_Z11printStringPKc>
    8000642c:	0400006f          	j	8000646c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006430:	00005517          	auipc	a0,0x5
    80006434:	10050513          	addi	a0,a0,256 # 8000b530 <CONSOLE_STATUS+0x520>
    80006438:	00001097          	auipc	ra,0x1
    8000643c:	540080e7          	jalr	1344(ra) # 80007978 <_Z11printStringPKc>
    80006440:	00000613          	li	a2,0
    80006444:	00a00593          	li	a1,10
    80006448:	00048513          	mv	a0,s1
    8000644c:	00001097          	auipc	ra,0x1
    80006450:	6dc080e7          	jalr	1756(ra) # 80007b28 <_Z8printIntiii>
    80006454:	00005517          	auipc	a0,0x5
    80006458:	3a450513          	addi	a0,a0,932 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    8000645c:	00001097          	auipc	ra,0x1
    80006460:	51c080e7          	jalr	1308(ra) # 80007978 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006464:	0014849b          	addiw	s1,s1,1
    80006468:	0ff4f493          	andi	s1,s1,255
    8000646c:	00f00793          	li	a5,15
    80006470:	fc97f0e3          	bgeu	a5,s1,80006430 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006474:	00005517          	auipc	a0,0x5
    80006478:	0e450513          	addi	a0,a0,228 # 8000b558 <CONSOLE_STATUS+0x548>
    8000647c:	00001097          	auipc	ra,0x1
    80006480:	4fc080e7          	jalr	1276(ra) # 80007978 <_Z11printStringPKc>
    finishedD = true;
    80006484:	00100793          	li	a5,1
    80006488:	00008717          	auipc	a4,0x8
    8000648c:	caf70223          	sb	a5,-860(a4) # 8000e12c <_ZL9finishedD>
    thread_dispatch();
    80006490:	ffffb097          	auipc	ra,0xffffb
    80006494:	50c080e7          	jalr	1292(ra) # 8000199c <_Z15thread_dispatchv>
}
    80006498:	01813083          	ld	ra,24(sp)
    8000649c:	01013403          	ld	s0,16(sp)
    800064a0:	00813483          	ld	s1,8(sp)
    800064a4:	00013903          	ld	s2,0(sp)
    800064a8:	02010113          	addi	sp,sp,32
    800064ac:	00008067          	ret

00000000800064b0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800064b0:	fe010113          	addi	sp,sp,-32
    800064b4:	00113c23          	sd	ra,24(sp)
    800064b8:	00813823          	sd	s0,16(sp)
    800064bc:	00913423          	sd	s1,8(sp)
    800064c0:	01213023          	sd	s2,0(sp)
    800064c4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800064c8:	00000493          	li	s1,0
    800064cc:	0400006f          	j	8000650c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800064d0:	00005517          	auipc	a0,0x5
    800064d4:	09850513          	addi	a0,a0,152 # 8000b568 <CONSOLE_STATUS+0x558>
    800064d8:	00001097          	auipc	ra,0x1
    800064dc:	4a0080e7          	jalr	1184(ra) # 80007978 <_Z11printStringPKc>
    800064e0:	00000613          	li	a2,0
    800064e4:	00a00593          	li	a1,10
    800064e8:	00048513          	mv	a0,s1
    800064ec:	00001097          	auipc	ra,0x1
    800064f0:	63c080e7          	jalr	1596(ra) # 80007b28 <_Z8printIntiii>
    800064f4:	00005517          	auipc	a0,0x5
    800064f8:	30450513          	addi	a0,a0,772 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800064fc:	00001097          	auipc	ra,0x1
    80006500:	47c080e7          	jalr	1148(ra) # 80007978 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006504:	0014849b          	addiw	s1,s1,1
    80006508:	0ff4f493          	andi	s1,s1,255
    8000650c:	00200793          	li	a5,2
    80006510:	fc97f0e3          	bgeu	a5,s1,800064d0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006514:	00005517          	auipc	a0,0x5
    80006518:	05c50513          	addi	a0,a0,92 # 8000b570 <CONSOLE_STATUS+0x560>
    8000651c:	00001097          	auipc	ra,0x1
    80006520:	45c080e7          	jalr	1116(ra) # 80007978 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006524:	00700313          	li	t1,7
    thread_dispatch();
    80006528:	ffffb097          	auipc	ra,0xffffb
    8000652c:	474080e7          	jalr	1140(ra) # 8000199c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006530:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006534:	00005517          	auipc	a0,0x5
    80006538:	04c50513          	addi	a0,a0,76 # 8000b580 <CONSOLE_STATUS+0x570>
    8000653c:	00001097          	auipc	ra,0x1
    80006540:	43c080e7          	jalr	1084(ra) # 80007978 <_Z11printStringPKc>
    80006544:	00000613          	li	a2,0
    80006548:	00a00593          	li	a1,10
    8000654c:	0009051b          	sext.w	a0,s2
    80006550:	00001097          	auipc	ra,0x1
    80006554:	5d8080e7          	jalr	1496(ra) # 80007b28 <_Z8printIntiii>
    80006558:	00005517          	auipc	a0,0x5
    8000655c:	2a050513          	addi	a0,a0,672 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80006560:	00001097          	auipc	ra,0x1
    80006564:	418080e7          	jalr	1048(ra) # 80007978 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006568:	00c00513          	li	a0,12
    8000656c:	00000097          	auipc	ra,0x0
    80006570:	d88080e7          	jalr	-632(ra) # 800062f4 <_ZL9fibonaccim>
    80006574:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006578:	00005517          	auipc	a0,0x5
    8000657c:	01050513          	addi	a0,a0,16 # 8000b588 <CONSOLE_STATUS+0x578>
    80006580:	00001097          	auipc	ra,0x1
    80006584:	3f8080e7          	jalr	1016(ra) # 80007978 <_Z11printStringPKc>
    80006588:	00000613          	li	a2,0
    8000658c:	00a00593          	li	a1,10
    80006590:	0009051b          	sext.w	a0,s2
    80006594:	00001097          	auipc	ra,0x1
    80006598:	594080e7          	jalr	1428(ra) # 80007b28 <_Z8printIntiii>
    8000659c:	00005517          	auipc	a0,0x5
    800065a0:	25c50513          	addi	a0,a0,604 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800065a4:	00001097          	auipc	ra,0x1
    800065a8:	3d4080e7          	jalr	980(ra) # 80007978 <_Z11printStringPKc>
    800065ac:	0400006f          	j	800065ec <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800065b0:	00005517          	auipc	a0,0x5
    800065b4:	fb850513          	addi	a0,a0,-72 # 8000b568 <CONSOLE_STATUS+0x558>
    800065b8:	00001097          	auipc	ra,0x1
    800065bc:	3c0080e7          	jalr	960(ra) # 80007978 <_Z11printStringPKc>
    800065c0:	00000613          	li	a2,0
    800065c4:	00a00593          	li	a1,10
    800065c8:	00048513          	mv	a0,s1
    800065cc:	00001097          	auipc	ra,0x1
    800065d0:	55c080e7          	jalr	1372(ra) # 80007b28 <_Z8printIntiii>
    800065d4:	00005517          	auipc	a0,0x5
    800065d8:	22450513          	addi	a0,a0,548 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800065dc:	00001097          	auipc	ra,0x1
    800065e0:	39c080e7          	jalr	924(ra) # 80007978 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800065e4:	0014849b          	addiw	s1,s1,1
    800065e8:	0ff4f493          	andi	s1,s1,255
    800065ec:	00500793          	li	a5,5
    800065f0:	fc97f0e3          	bgeu	a5,s1,800065b0 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    800065f4:	00005517          	auipc	a0,0x5
    800065f8:	fa450513          	addi	a0,a0,-92 # 8000b598 <CONSOLE_STATUS+0x588>
    800065fc:	00001097          	auipc	ra,0x1
    80006600:	37c080e7          	jalr	892(ra) # 80007978 <_Z11printStringPKc>
    finishedC = true;
    80006604:	00100793          	li	a5,1
    80006608:	00008717          	auipc	a4,0x8
    8000660c:	b2f702a3          	sb	a5,-1243(a4) # 8000e12d <_ZL9finishedC>
    thread_dispatch();
    80006610:	ffffb097          	auipc	ra,0xffffb
    80006614:	38c080e7          	jalr	908(ra) # 8000199c <_Z15thread_dispatchv>
}
    80006618:	01813083          	ld	ra,24(sp)
    8000661c:	01013403          	ld	s0,16(sp)
    80006620:	00813483          	ld	s1,8(sp)
    80006624:	00013903          	ld	s2,0(sp)
    80006628:	02010113          	addi	sp,sp,32
    8000662c:	00008067          	ret

0000000080006630 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006630:	fe010113          	addi	sp,sp,-32
    80006634:	00113c23          	sd	ra,24(sp)
    80006638:	00813823          	sd	s0,16(sp)
    8000663c:	00913423          	sd	s1,8(sp)
    80006640:	01213023          	sd	s2,0(sp)
    80006644:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006648:	00000913          	li	s2,0
    8000664c:	0380006f          	j	80006684 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80006650:	ffffb097          	auipc	ra,0xffffb
    80006654:	34c080e7          	jalr	844(ra) # 8000199c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006658:	00148493          	addi	s1,s1,1
    8000665c:	000027b7          	lui	a5,0x2
    80006660:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006664:	0097ee63          	bltu	a5,s1,80006680 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006668:	00000713          	li	a4,0
    8000666c:	000077b7          	lui	a5,0x7
    80006670:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006674:	fce7eee3          	bltu	a5,a4,80006650 <_ZL11workerBodyBPv+0x20>
    80006678:	00170713          	addi	a4,a4,1
    8000667c:	ff1ff06f          	j	8000666c <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80006680:	00190913          	addi	s2,s2,1
    80006684:	00f00793          	li	a5,15
    80006688:	0527e063          	bltu	a5,s2,800066c8 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    8000668c:	00005517          	auipc	a0,0x5
    80006690:	f1c50513          	addi	a0,a0,-228 # 8000b5a8 <CONSOLE_STATUS+0x598>
    80006694:	00001097          	auipc	ra,0x1
    80006698:	2e4080e7          	jalr	740(ra) # 80007978 <_Z11printStringPKc>
    8000669c:	00000613          	li	a2,0
    800066a0:	00a00593          	li	a1,10
    800066a4:	0009051b          	sext.w	a0,s2
    800066a8:	00001097          	auipc	ra,0x1
    800066ac:	480080e7          	jalr	1152(ra) # 80007b28 <_Z8printIntiii>
    800066b0:	00005517          	auipc	a0,0x5
    800066b4:	14850513          	addi	a0,a0,328 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800066b8:	00001097          	auipc	ra,0x1
    800066bc:	2c0080e7          	jalr	704(ra) # 80007978 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800066c0:	00000493          	li	s1,0
    800066c4:	f99ff06f          	j	8000665c <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800066c8:	00005517          	auipc	a0,0x5
    800066cc:	ee850513          	addi	a0,a0,-280 # 8000b5b0 <CONSOLE_STATUS+0x5a0>
    800066d0:	00001097          	auipc	ra,0x1
    800066d4:	2a8080e7          	jalr	680(ra) # 80007978 <_Z11printStringPKc>
    finishedB = true;
    800066d8:	00100793          	li	a5,1
    800066dc:	00008717          	auipc	a4,0x8
    800066e0:	a4f70923          	sb	a5,-1454(a4) # 8000e12e <_ZL9finishedB>
    thread_dispatch();
    800066e4:	ffffb097          	auipc	ra,0xffffb
    800066e8:	2b8080e7          	jalr	696(ra) # 8000199c <_Z15thread_dispatchv>
}
    800066ec:	01813083          	ld	ra,24(sp)
    800066f0:	01013403          	ld	s0,16(sp)
    800066f4:	00813483          	ld	s1,8(sp)
    800066f8:	00013903          	ld	s2,0(sp)
    800066fc:	02010113          	addi	sp,sp,32
    80006700:	00008067          	ret

0000000080006704 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006704:	fe010113          	addi	sp,sp,-32
    80006708:	00113c23          	sd	ra,24(sp)
    8000670c:	00813823          	sd	s0,16(sp)
    80006710:	00913423          	sd	s1,8(sp)
    80006714:	01213023          	sd	s2,0(sp)
    80006718:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000671c:	00000913          	li	s2,0
    80006720:	0380006f          	j	80006758 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006724:	ffffb097          	auipc	ra,0xffffb
    80006728:	278080e7          	jalr	632(ra) # 8000199c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000672c:	00148493          	addi	s1,s1,1
    80006730:	000027b7          	lui	a5,0x2
    80006734:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006738:	0097ee63          	bltu	a5,s1,80006754 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000673c:	00000713          	li	a4,0
    80006740:	000077b7          	lui	a5,0x7
    80006744:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006748:	fce7eee3          	bltu	a5,a4,80006724 <_ZL11workerBodyAPv+0x20>
    8000674c:	00170713          	addi	a4,a4,1
    80006750:	ff1ff06f          	j	80006740 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006754:	00190913          	addi	s2,s2,1
    80006758:	00900793          	li	a5,9
    8000675c:	0527e063          	bltu	a5,s2,8000679c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006760:	00005517          	auipc	a0,0x5
    80006764:	e6050513          	addi	a0,a0,-416 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80006768:	00001097          	auipc	ra,0x1
    8000676c:	210080e7          	jalr	528(ra) # 80007978 <_Z11printStringPKc>
    80006770:	00000613          	li	a2,0
    80006774:	00a00593          	li	a1,10
    80006778:	0009051b          	sext.w	a0,s2
    8000677c:	00001097          	auipc	ra,0x1
    80006780:	3ac080e7          	jalr	940(ra) # 80007b28 <_Z8printIntiii>
    80006784:	00005517          	auipc	a0,0x5
    80006788:	07450513          	addi	a0,a0,116 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    8000678c:	00001097          	auipc	ra,0x1
    80006790:	1ec080e7          	jalr	492(ra) # 80007978 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006794:	00000493          	li	s1,0
    80006798:	f99ff06f          	j	80006730 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000679c:	00005517          	auipc	a0,0x5
    800067a0:	e2c50513          	addi	a0,a0,-468 # 8000b5c8 <CONSOLE_STATUS+0x5b8>
    800067a4:	00001097          	auipc	ra,0x1
    800067a8:	1d4080e7          	jalr	468(ra) # 80007978 <_Z11printStringPKc>
    finishedA = true;
    800067ac:	00100793          	li	a5,1
    800067b0:	00008717          	auipc	a4,0x8
    800067b4:	96f70fa3          	sb	a5,-1665(a4) # 8000e12f <_ZL9finishedA>
}
    800067b8:	01813083          	ld	ra,24(sp)
    800067bc:	01013403          	ld	s0,16(sp)
    800067c0:	00813483          	ld	s1,8(sp)
    800067c4:	00013903          	ld	s2,0(sp)
    800067c8:	02010113          	addi	sp,sp,32
    800067cc:	00008067          	ret

00000000800067d0 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800067d0:	fd010113          	addi	sp,sp,-48
    800067d4:	02113423          	sd	ra,40(sp)
    800067d8:	02813023          	sd	s0,32(sp)
    800067dc:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800067e0:	00000613          	li	a2,0
    800067e4:	00000597          	auipc	a1,0x0
    800067e8:	f2058593          	addi	a1,a1,-224 # 80006704 <_ZL11workerBodyAPv>
    800067ec:	fd040513          	addi	a0,s0,-48
    800067f0:	ffffb097          	auipc	ra,0xffffb
    800067f4:	110080e7          	jalr	272(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800067f8:	00005517          	auipc	a0,0x5
    800067fc:	de050513          	addi	a0,a0,-544 # 8000b5d8 <CONSOLE_STATUS+0x5c8>
    80006800:	00001097          	auipc	ra,0x1
    80006804:	178080e7          	jalr	376(ra) # 80007978 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006808:	00000613          	li	a2,0
    8000680c:	00000597          	auipc	a1,0x0
    80006810:	e2458593          	addi	a1,a1,-476 # 80006630 <_ZL11workerBodyBPv>
    80006814:	fd840513          	addi	a0,s0,-40
    80006818:	ffffb097          	auipc	ra,0xffffb
    8000681c:	0e8080e7          	jalr	232(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80006820:	00005517          	auipc	a0,0x5
    80006824:	dd050513          	addi	a0,a0,-560 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    80006828:	00001097          	auipc	ra,0x1
    8000682c:	150080e7          	jalr	336(ra) # 80007978 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006830:	00000613          	li	a2,0
    80006834:	00000597          	auipc	a1,0x0
    80006838:	c7c58593          	addi	a1,a1,-900 # 800064b0 <_ZL11workerBodyCPv>
    8000683c:	fe040513          	addi	a0,s0,-32
    80006840:	ffffb097          	auipc	ra,0xffffb
    80006844:	0c0080e7          	jalr	192(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80006848:	00005517          	auipc	a0,0x5
    8000684c:	dc050513          	addi	a0,a0,-576 # 8000b608 <CONSOLE_STATUS+0x5f8>
    80006850:	00001097          	auipc	ra,0x1
    80006854:	128080e7          	jalr	296(ra) # 80007978 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006858:	00000613          	li	a2,0
    8000685c:	00000597          	auipc	a1,0x0
    80006860:	b0c58593          	addi	a1,a1,-1268 # 80006368 <_ZL11workerBodyDPv>
    80006864:	fe840513          	addi	a0,s0,-24
    80006868:	ffffb097          	auipc	ra,0xffffb
    8000686c:	098080e7          	jalr	152(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006870:	00005517          	auipc	a0,0x5
    80006874:	db050513          	addi	a0,a0,-592 # 8000b620 <CONSOLE_STATUS+0x610>
    80006878:	00001097          	auipc	ra,0x1
    8000687c:	100080e7          	jalr	256(ra) # 80007978 <_Z11printStringPKc>
    80006880:	00c0006f          	j	8000688c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006884:	ffffb097          	auipc	ra,0xffffb
    80006888:	118080e7          	jalr	280(ra) # 8000199c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000688c:	00008797          	auipc	a5,0x8
    80006890:	8a37c783          	lbu	a5,-1885(a5) # 8000e12f <_ZL9finishedA>
    80006894:	fe0788e3          	beqz	a5,80006884 <_Z18Threads_C_API_testv+0xb4>
    80006898:	00008797          	auipc	a5,0x8
    8000689c:	8967c783          	lbu	a5,-1898(a5) # 8000e12e <_ZL9finishedB>
    800068a0:	fe0782e3          	beqz	a5,80006884 <_Z18Threads_C_API_testv+0xb4>
    800068a4:	00008797          	auipc	a5,0x8
    800068a8:	8897c783          	lbu	a5,-1911(a5) # 8000e12d <_ZL9finishedC>
    800068ac:	fc078ce3          	beqz	a5,80006884 <_Z18Threads_C_API_testv+0xb4>
    800068b0:	00008797          	auipc	a5,0x8
    800068b4:	87c7c783          	lbu	a5,-1924(a5) # 8000e12c <_ZL9finishedD>
    800068b8:	fc0786e3          	beqz	a5,80006884 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800068bc:	02813083          	ld	ra,40(sp)
    800068c0:	02013403          	ld	s0,32(sp)
    800068c4:	03010113          	addi	sp,sp,48
    800068c8:	00008067          	ret

00000000800068cc <_ZL9sleepyRunPv>:

#include "../test_h/printing.h"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800068cc:	fe010113          	addi	sp,sp,-32
    800068d0:	00113c23          	sd	ra,24(sp)
    800068d4:	00813823          	sd	s0,16(sp)
    800068d8:	00913423          	sd	s1,8(sp)
    800068dc:	01213023          	sd	s2,0(sp)
    800068e0:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800068e4:	00053903          	ld	s2,0(a0)
    int i = 6;
    800068e8:	00600493          	li	s1,6
    while (--i > 0) {
    800068ec:	fff4849b          	addiw	s1,s1,-1
    800068f0:	04905a63          	blez	s1,80006944 <_ZL9sleepyRunPv+0x78>

        printString("Hello ");
    800068f4:	00005517          	auipc	a0,0x5
    800068f8:	d4450513          	addi	a0,a0,-700 # 8000b638 <CONSOLE_STATUS+0x628>
    800068fc:	00001097          	auipc	ra,0x1
    80006900:	07c080e7          	jalr	124(ra) # 80007978 <_Z11printStringPKc>
        printInt(sleep_time);
    80006904:	00000613          	li	a2,0
    80006908:	00a00593          	li	a1,10
    8000690c:	0009051b          	sext.w	a0,s2
    80006910:	00001097          	auipc	ra,0x1
    80006914:	218080e7          	jalr	536(ra) # 80007b28 <_Z8printIntiii>
        printString(" !\n");
    80006918:	00005517          	auipc	a0,0x5
    8000691c:	d2850513          	addi	a0,a0,-728 # 8000b640 <CONSOLE_STATUS+0x630>
    80006920:	00001097          	auipc	ra,0x1
    80006924:	058080e7          	jalr	88(ra) # 80007978 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006928:	00090513          	mv	a0,s2
    8000692c:	ffffb097          	auipc	ra,0xffffb
    80006930:	0b4080e7          	jalr	180(ra) # 800019e0 <_Z10time_sleepm>
        putc('.');
    80006934:	02e00513          	li	a0,46
    80006938:	ffffb097          	auipc	ra,0xffffb
    8000693c:	1b8080e7          	jalr	440(ra) # 80001af0 <_Z4putcc>
    while (--i > 0) {
    80006940:	fadff06f          	j	800068ec <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/100-1] = true;
    80006944:	06400793          	li	a5,100
    80006948:	02f95933          	divu	s2,s2,a5
    8000694c:	fff90913          	addi	s2,s2,-1
    80006950:	00007797          	auipc	a5,0x7
    80006954:	7e078793          	addi	a5,a5,2016 # 8000e130 <_ZL8finished>
    80006958:	01278933          	add	s2,a5,s2
    8000695c:	00100793          	li	a5,1
    80006960:	00f90023          	sb	a5,0(s2)
}
    80006964:	01813083          	ld	ra,24(sp)
    80006968:	01013403          	ld	s0,16(sp)
    8000696c:	00813483          	ld	s1,8(sp)
    80006970:	00013903          	ld	s2,0(sp)
    80006974:	02010113          	addi	sp,sp,32
    80006978:	00008067          	ret

000000008000697c <_Z12testSleepingv>:

void testSleeping() {
    8000697c:	fc010113          	addi	sp,sp,-64
    80006980:	02113c23          	sd	ra,56(sp)
    80006984:	02813823          	sd	s0,48(sp)
    80006988:	02913423          	sd	s1,40(sp)
    8000698c:	04010413          	addi	s0,sp,64
    printString("Starting...\n");
    80006990:	00005517          	auipc	a0,0x5
    80006994:	cb850513          	addi	a0,a0,-840 # 8000b648 <CONSOLE_STATUS+0x638>
    80006998:	00001097          	auipc	ra,0x1
    8000699c:	fe0080e7          	jalr	-32(ra) # 80007978 <_Z11printStringPKc>
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {200, 400};
    800069a0:	0c800793          	li	a5,200
    800069a4:	fcf43823          	sd	a5,-48(s0)
    800069a8:	19000793          	li	a5,400
    800069ac:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    printString("Creating threads: ");
    800069b0:	00005517          	auipc	a0,0x5
    800069b4:	ca850513          	addi	a0,a0,-856 # 8000b658 <CONSOLE_STATUS+0x648>
    800069b8:	00001097          	auipc	ra,0x1
    800069bc:	fc0080e7          	jalr	-64(ra) # 80007978 <_Z11printStringPKc>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800069c0:	00000493          	li	s1,0
    800069c4:	0500006f          	j	80006a14 <_Z12testSleepingv+0x98>
        printInt(i);
    800069c8:	00000613          	li	a2,0
    800069cc:	00a00593          	li	a1,10
    800069d0:	00048513          	mv	a0,s1
    800069d4:	00001097          	auipc	ra,0x1
    800069d8:	154080e7          	jalr	340(ra) # 80007b28 <_Z8printIntiii>
        printString(" ");
    800069dc:	00005517          	auipc	a0,0x5
    800069e0:	c9450513          	addi	a0,a0,-876 # 8000b670 <CONSOLE_STATUS+0x660>
    800069e4:	00001097          	auipc	ra,0x1
    800069e8:	f94080e7          	jalr	-108(ra) # 80007978 <_Z11printStringPKc>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800069ec:	00349793          	slli	a5,s1,0x3
    800069f0:	fd040613          	addi	a2,s0,-48
    800069f4:	00f60633          	add	a2,a2,a5
    800069f8:	00000597          	auipc	a1,0x0
    800069fc:	ed458593          	addi	a1,a1,-300 # 800068cc <_ZL9sleepyRunPv>
    80006a00:	fc040513          	addi	a0,s0,-64
    80006a04:	00f50533          	add	a0,a0,a5
    80006a08:	ffffb097          	auipc	ra,0xffffb
    80006a0c:	ef8080e7          	jalr	-264(ra) # 80001900 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006a10:	0014849b          	addiw	s1,s1,1
    80006a14:	00100793          	li	a5,1
    80006a18:	fa97d8e3          	bge	a5,s1,800069c8 <_Z12testSleepingv+0x4c>
    }
    printString("\nSuccesfully created all threads, now waiting for them to end\n");
    80006a1c:	00005517          	auipc	a0,0x5
    80006a20:	c5c50513          	addi	a0,a0,-932 # 8000b678 <CONSOLE_STATUS+0x668>
    80006a24:	00001097          	auipc	ra,0x1
    80006a28:	f54080e7          	jalr	-172(ra) # 80007978 <_Z11printStringPKc>
    80006a2c:	00c0006f          	j	80006a38 <_Z12testSleepingv+0xbc>
    while (!(finished[0] && finished[1])) {thread_dispatch();}
    80006a30:	ffffb097          	auipc	ra,0xffffb
    80006a34:	f6c080e7          	jalr	-148(ra) # 8000199c <_Z15thread_dispatchv>
    80006a38:	00007797          	auipc	a5,0x7
    80006a3c:	6f87c783          	lbu	a5,1784(a5) # 8000e130 <_ZL8finished>
    80006a40:	fe0788e3          	beqz	a5,80006a30 <_Z12testSleepingv+0xb4>
    80006a44:	00007797          	auipc	a5,0x7
    80006a48:	6ed7c783          	lbu	a5,1773(a5) # 8000e131 <_ZL8finished+0x1>
    80006a4c:	fe0782e3          	beqz	a5,80006a30 <_Z12testSleepingv+0xb4>
}
    80006a50:	03813083          	ld	ra,56(sp)
    80006a54:	03013403          	ld	s0,48(sp)
    80006a58:	02813483          	ld	s1,40(sp)
    80006a5c:	04010113          	addi	sp,sp,64
    80006a60:	00008067          	ret

0000000080006a64 <_ZN9BufferCPPC1Ei>:
#include "../test_h/buffer_CPP_API.h"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006a64:	fd010113          	addi	sp,sp,-48
    80006a68:	02113423          	sd	ra,40(sp)
    80006a6c:	02813023          	sd	s0,32(sp)
    80006a70:	00913c23          	sd	s1,24(sp)
    80006a74:	01213823          	sd	s2,16(sp)
    80006a78:	01313423          	sd	s3,8(sp)
    80006a7c:	03010413          	addi	s0,sp,48
    80006a80:	00050493          	mv	s1,a0
    80006a84:	00058913          	mv	s2,a1
    80006a88:	0015879b          	addiw	a5,a1,1
    80006a8c:	0007851b          	sext.w	a0,a5
    80006a90:	00f4a023          	sw	a5,0(s1)
    80006a94:	0004a823          	sw	zero,16(s1)
    80006a98:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006a9c:	00251513          	slli	a0,a0,0x2
    80006aa0:	ffffb097          	auipc	ra,0xffffb
    80006aa4:	e04080e7          	jalr	-508(ra) # 800018a4 <_Z9mem_allocm>
    80006aa8:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006aac:	01000513          	li	a0,16
    80006ab0:	ffffa097          	auipc	ra,0xffffa
    80006ab4:	70c080e7          	jalr	1804(ra) # 800011bc <_Znwm>
    80006ab8:	00050993          	mv	s3,a0
    80006abc:	00000593          	li	a1,0
    80006ac0:	ffffb097          	auipc	ra,0xffffb
    80006ac4:	914080e7          	jalr	-1772(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006ac8:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006acc:	01000513          	li	a0,16
    80006ad0:	ffffa097          	auipc	ra,0xffffa
    80006ad4:	6ec080e7          	jalr	1772(ra) # 800011bc <_Znwm>
    80006ad8:	00050993          	mv	s3,a0
    80006adc:	00090593          	mv	a1,s2
    80006ae0:	ffffb097          	auipc	ra,0xffffb
    80006ae4:	8f4080e7          	jalr	-1804(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006ae8:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006aec:	01000513          	li	a0,16
    80006af0:	ffffa097          	auipc	ra,0xffffa
    80006af4:	6cc080e7          	jalr	1740(ra) # 800011bc <_Znwm>
    80006af8:	00050913          	mv	s2,a0
    80006afc:	00100593          	li	a1,1
    80006b00:	ffffb097          	auipc	ra,0xffffb
    80006b04:	8d4080e7          	jalr	-1836(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006b08:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006b0c:	01000513          	li	a0,16
    80006b10:	ffffa097          	auipc	ra,0xffffa
    80006b14:	6ac080e7          	jalr	1708(ra) # 800011bc <_Znwm>
    80006b18:	00050913          	mv	s2,a0
    80006b1c:	00100593          	li	a1,1
    80006b20:	ffffb097          	auipc	ra,0xffffb
    80006b24:	8b4080e7          	jalr	-1868(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006b28:	0324b823          	sd	s2,48(s1)
}
    80006b2c:	02813083          	ld	ra,40(sp)
    80006b30:	02013403          	ld	s0,32(sp)
    80006b34:	01813483          	ld	s1,24(sp)
    80006b38:	01013903          	ld	s2,16(sp)
    80006b3c:	00813983          	ld	s3,8(sp)
    80006b40:	03010113          	addi	sp,sp,48
    80006b44:	00008067          	ret
    80006b48:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006b4c:	00098513          	mv	a0,s3
    80006b50:	ffffa097          	auipc	ra,0xffffa
    80006b54:	694080e7          	jalr	1684(ra) # 800011e4 <_ZdlPv>
    80006b58:	00048513          	mv	a0,s1
    80006b5c:	00008097          	auipc	ra,0x8
    80006b60:	6bc080e7          	jalr	1724(ra) # 8000f218 <_Unwind_Resume>
    80006b64:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006b68:	00098513          	mv	a0,s3
    80006b6c:	ffffa097          	auipc	ra,0xffffa
    80006b70:	678080e7          	jalr	1656(ra) # 800011e4 <_ZdlPv>
    80006b74:	00048513          	mv	a0,s1
    80006b78:	00008097          	auipc	ra,0x8
    80006b7c:	6a0080e7          	jalr	1696(ra) # 8000f218 <_Unwind_Resume>
    80006b80:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006b84:	00090513          	mv	a0,s2
    80006b88:	ffffa097          	auipc	ra,0xffffa
    80006b8c:	65c080e7          	jalr	1628(ra) # 800011e4 <_ZdlPv>
    80006b90:	00048513          	mv	a0,s1
    80006b94:	00008097          	auipc	ra,0x8
    80006b98:	684080e7          	jalr	1668(ra) # 8000f218 <_Unwind_Resume>
    80006b9c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006ba0:	00090513          	mv	a0,s2
    80006ba4:	ffffa097          	auipc	ra,0xffffa
    80006ba8:	640080e7          	jalr	1600(ra) # 800011e4 <_ZdlPv>
    80006bac:	00048513          	mv	a0,s1
    80006bb0:	00008097          	auipc	ra,0x8
    80006bb4:	668080e7          	jalr	1640(ra) # 8000f218 <_Unwind_Resume>

0000000080006bb8 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006bb8:	fe010113          	addi	sp,sp,-32
    80006bbc:	00113c23          	sd	ra,24(sp)
    80006bc0:	00813823          	sd	s0,16(sp)
    80006bc4:	00913423          	sd	s1,8(sp)
    80006bc8:	01213023          	sd	s2,0(sp)
    80006bcc:	02010413          	addi	s0,sp,32
    80006bd0:	00050493          	mv	s1,a0
    80006bd4:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80006bd8:	01853503          	ld	a0,24(a0)
    80006bdc:	ffffb097          	auipc	ra,0xffffb
    80006be0:	830080e7          	jalr	-2000(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006be4:	0304b503          	ld	a0,48(s1)
    80006be8:	ffffb097          	auipc	ra,0xffffb
    80006bec:	824080e7          	jalr	-2012(ra) # 8000140c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80006bf0:	0084b783          	ld	a5,8(s1)
    80006bf4:	0144a703          	lw	a4,20(s1)
    80006bf8:	00271713          	slli	a4,a4,0x2
    80006bfc:	00e787b3          	add	a5,a5,a4
    80006c00:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006c04:	0144a783          	lw	a5,20(s1)
    80006c08:	0017879b          	addiw	a5,a5,1
    80006c0c:	0004a703          	lw	a4,0(s1)
    80006c10:	02e7e7bb          	remw	a5,a5,a4
    80006c14:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006c18:	0304b503          	ld	a0,48(s1)
    80006c1c:	ffffb097          	auipc	ra,0xffffb
    80006c20:	81c080e7          	jalr	-2020(ra) # 80001438 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006c24:	0204b503          	ld	a0,32(s1)
    80006c28:	ffffb097          	auipc	ra,0xffffb
    80006c2c:	810080e7          	jalr	-2032(ra) # 80001438 <_ZN9Semaphore6signalEv>

}
    80006c30:	01813083          	ld	ra,24(sp)
    80006c34:	01013403          	ld	s0,16(sp)
    80006c38:	00813483          	ld	s1,8(sp)
    80006c3c:	00013903          	ld	s2,0(sp)
    80006c40:	02010113          	addi	sp,sp,32
    80006c44:	00008067          	ret

0000000080006c48 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006c48:	fe010113          	addi	sp,sp,-32
    80006c4c:	00113c23          	sd	ra,24(sp)
    80006c50:	00813823          	sd	s0,16(sp)
    80006c54:	00913423          	sd	s1,8(sp)
    80006c58:	01213023          	sd	s2,0(sp)
    80006c5c:	02010413          	addi	s0,sp,32
    80006c60:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006c64:	02053503          	ld	a0,32(a0)
    80006c68:	ffffa097          	auipc	ra,0xffffa
    80006c6c:	7a4080e7          	jalr	1956(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006c70:	0284b503          	ld	a0,40(s1)
    80006c74:	ffffa097          	auipc	ra,0xffffa
    80006c78:	798080e7          	jalr	1944(ra) # 8000140c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006c7c:	0084b703          	ld	a4,8(s1)
    80006c80:	0104a783          	lw	a5,16(s1)
    80006c84:	00279693          	slli	a3,a5,0x2
    80006c88:	00d70733          	add	a4,a4,a3
    80006c8c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006c90:	0017879b          	addiw	a5,a5,1
    80006c94:	0004a703          	lw	a4,0(s1)
    80006c98:	02e7e7bb          	remw	a5,a5,a4
    80006c9c:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006ca0:	0284b503          	ld	a0,40(s1)
    80006ca4:	ffffa097          	auipc	ra,0xffffa
    80006ca8:	794080e7          	jalr	1940(ra) # 80001438 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006cac:	0184b503          	ld	a0,24(s1)
    80006cb0:	ffffa097          	auipc	ra,0xffffa
    80006cb4:	788080e7          	jalr	1928(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006cb8:	00090513          	mv	a0,s2
    80006cbc:	01813083          	ld	ra,24(sp)
    80006cc0:	01013403          	ld	s0,16(sp)
    80006cc4:	00813483          	ld	s1,8(sp)
    80006cc8:	00013903          	ld	s2,0(sp)
    80006ccc:	02010113          	addi	sp,sp,32
    80006cd0:	00008067          	ret

0000000080006cd4 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006cd4:	fe010113          	addi	sp,sp,-32
    80006cd8:	00113c23          	sd	ra,24(sp)
    80006cdc:	00813823          	sd	s0,16(sp)
    80006ce0:	00913423          	sd	s1,8(sp)
    80006ce4:	01213023          	sd	s2,0(sp)
    80006ce8:	02010413          	addi	s0,sp,32
    80006cec:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006cf0:	02853503          	ld	a0,40(a0)
    80006cf4:	ffffa097          	auipc	ra,0xffffa
    80006cf8:	718080e7          	jalr	1816(ra) # 8000140c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006cfc:	0304b503          	ld	a0,48(s1)
    80006d00:	ffffa097          	auipc	ra,0xffffa
    80006d04:	70c080e7          	jalr	1804(ra) # 8000140c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006d08:	0144a783          	lw	a5,20(s1)
    80006d0c:	0104a903          	lw	s2,16(s1)
    80006d10:	0327ce63          	blt	a5,s2,80006d4c <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006d14:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006d18:	0304b503          	ld	a0,48(s1)
    80006d1c:	ffffa097          	auipc	ra,0xffffa
    80006d20:	71c080e7          	jalr	1820(ra) # 80001438 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006d24:	0284b503          	ld	a0,40(s1)
    80006d28:	ffffa097          	auipc	ra,0xffffa
    80006d2c:	710080e7          	jalr	1808(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006d30:	00090513          	mv	a0,s2
    80006d34:	01813083          	ld	ra,24(sp)
    80006d38:	01013403          	ld	s0,16(sp)
    80006d3c:	00813483          	ld	s1,8(sp)
    80006d40:	00013903          	ld	s2,0(sp)
    80006d44:	02010113          	addi	sp,sp,32
    80006d48:	00008067          	ret
        ret = cap - head + tail;
    80006d4c:	0004a703          	lw	a4,0(s1)
    80006d50:	4127093b          	subw	s2,a4,s2
    80006d54:	00f9093b          	addw	s2,s2,a5
    80006d58:	fc1ff06f          	j	80006d18 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006d5c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006d5c:	fe010113          	addi	sp,sp,-32
    80006d60:	00113c23          	sd	ra,24(sp)
    80006d64:	00813823          	sd	s0,16(sp)
    80006d68:	00913423          	sd	s1,8(sp)
    80006d6c:	02010413          	addi	s0,sp,32
    80006d70:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006d74:	00a00513          	li	a0,10
    80006d78:	ffffa097          	auipc	ra,0xffffa
    80006d7c:	75c080e7          	jalr	1884(ra) # 800014d4 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006d80:	00004517          	auipc	a0,0x4
    80006d84:	6b050513          	addi	a0,a0,1712 # 8000b430 <CONSOLE_STATUS+0x420>
    80006d88:	00001097          	auipc	ra,0x1
    80006d8c:	bf0080e7          	jalr	-1040(ra) # 80007978 <_Z11printStringPKc>
    while (getCnt()) {
    80006d90:	00048513          	mv	a0,s1
    80006d94:	00000097          	auipc	ra,0x0
    80006d98:	f40080e7          	jalr	-192(ra) # 80006cd4 <_ZN9BufferCPP6getCntEv>
    80006d9c:	02050c63          	beqz	a0,80006dd4 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006da0:	0084b783          	ld	a5,8(s1)
    80006da4:	0104a703          	lw	a4,16(s1)
    80006da8:	00271713          	slli	a4,a4,0x2
    80006dac:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006db0:	0007c503          	lbu	a0,0(a5)
    80006db4:	ffffa097          	auipc	ra,0xffffa
    80006db8:	720080e7          	jalr	1824(ra) # 800014d4 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006dbc:	0104a783          	lw	a5,16(s1)
    80006dc0:	0017879b          	addiw	a5,a5,1
    80006dc4:	0004a703          	lw	a4,0(s1)
    80006dc8:	02e7e7bb          	remw	a5,a5,a4
    80006dcc:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006dd0:	fc1ff06f          	j	80006d90 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006dd4:	02100513          	li	a0,33
    80006dd8:	ffffa097          	auipc	ra,0xffffa
    80006ddc:	6fc080e7          	jalr	1788(ra) # 800014d4 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006de0:	00a00513          	li	a0,10
    80006de4:	ffffa097          	auipc	ra,0xffffa
    80006de8:	6f0080e7          	jalr	1776(ra) # 800014d4 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006dec:	0084b503          	ld	a0,8(s1)
    80006df0:	ffffb097          	auipc	ra,0xffffb
    80006df4:	ae4080e7          	jalr	-1308(ra) # 800018d4 <_Z8mem_freePv>
    delete itemAvailable;
    80006df8:	0204b503          	ld	a0,32(s1)
    80006dfc:	00050863          	beqz	a0,80006e0c <_ZN9BufferCPPD1Ev+0xb0>
    80006e00:	00053783          	ld	a5,0(a0)
    80006e04:	0087b783          	ld	a5,8(a5)
    80006e08:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006e0c:	0184b503          	ld	a0,24(s1)
    80006e10:	00050863          	beqz	a0,80006e20 <_ZN9BufferCPPD1Ev+0xc4>
    80006e14:	00053783          	ld	a5,0(a0)
    80006e18:	0087b783          	ld	a5,8(a5)
    80006e1c:	000780e7          	jalr	a5
    delete mutexTail;
    80006e20:	0304b503          	ld	a0,48(s1)
    80006e24:	00050863          	beqz	a0,80006e34 <_ZN9BufferCPPD1Ev+0xd8>
    80006e28:	00053783          	ld	a5,0(a0)
    80006e2c:	0087b783          	ld	a5,8(a5)
    80006e30:	000780e7          	jalr	a5
    delete mutexHead;
    80006e34:	0284b503          	ld	a0,40(s1)
    80006e38:	00050863          	beqz	a0,80006e48 <_ZN9BufferCPPD1Ev+0xec>
    80006e3c:	00053783          	ld	a5,0(a0)
    80006e40:	0087b783          	ld	a5,8(a5)
    80006e44:	000780e7          	jalr	a5
}
    80006e48:	01813083          	ld	ra,24(sp)
    80006e4c:	01013403          	ld	s0,16(sp)
    80006e50:	00813483          	ld	s1,8(sp)
    80006e54:	02010113          	addi	sp,sp,32
    80006e58:	00008067          	ret

0000000080006e5c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006e5c:	fe010113          	addi	sp,sp,-32
    80006e60:	00113c23          	sd	ra,24(sp)
    80006e64:	00813823          	sd	s0,16(sp)
    80006e68:	00913423          	sd	s1,8(sp)
    80006e6c:	01213023          	sd	s2,0(sp)
    80006e70:	02010413          	addi	s0,sp,32
    80006e74:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006e78:	00100793          	li	a5,1
    80006e7c:	02a7f863          	bgeu	a5,a0,80006eac <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006e80:	00a00793          	li	a5,10
    80006e84:	02f577b3          	remu	a5,a0,a5
    80006e88:	02078e63          	beqz	a5,80006ec4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006e8c:	fff48513          	addi	a0,s1,-1
    80006e90:	00000097          	auipc	ra,0x0
    80006e94:	fcc080e7          	jalr	-52(ra) # 80006e5c <_ZL9fibonaccim>
    80006e98:	00050913          	mv	s2,a0
    80006e9c:	ffe48513          	addi	a0,s1,-2
    80006ea0:	00000097          	auipc	ra,0x0
    80006ea4:	fbc080e7          	jalr	-68(ra) # 80006e5c <_ZL9fibonaccim>
    80006ea8:	00a90533          	add	a0,s2,a0
}
    80006eac:	01813083          	ld	ra,24(sp)
    80006eb0:	01013403          	ld	s0,16(sp)
    80006eb4:	00813483          	ld	s1,8(sp)
    80006eb8:	00013903          	ld	s2,0(sp)
    80006ebc:	02010113          	addi	sp,sp,32
    80006ec0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006ec4:	ffffb097          	auipc	ra,0xffffb
    80006ec8:	ad8080e7          	jalr	-1320(ra) # 8000199c <_Z15thread_dispatchv>
    80006ecc:	fc1ff06f          	j	80006e8c <_ZL9fibonaccim+0x30>

0000000080006ed0 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80006ed0:	fe010113          	addi	sp,sp,-32
    80006ed4:	00113c23          	sd	ra,24(sp)
    80006ed8:	00813823          	sd	s0,16(sp)
    80006edc:	00913423          	sd	s1,8(sp)
    80006ee0:	01213023          	sd	s2,0(sp)
    80006ee4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006ee8:	00000913          	li	s2,0
    80006eec:	0380006f          	j	80006f24 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80006ef0:	ffffb097          	auipc	ra,0xffffb
    80006ef4:	aac080e7          	jalr	-1364(ra) # 8000199c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006ef8:	00148493          	addi	s1,s1,1
    80006efc:	000027b7          	lui	a5,0x2
    80006f00:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006f04:	0097ee63          	bltu	a5,s1,80006f20 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006f08:	00000713          	li	a4,0
    80006f0c:	000077b7          	lui	a5,0x7
    80006f10:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006f14:	fce7eee3          	bltu	a5,a4,80006ef0 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80006f18:	00170713          	addi	a4,a4,1
    80006f1c:	ff1ff06f          	j	80006f0c <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006f20:	00190913          	addi	s2,s2,1
    80006f24:	00900793          	li	a5,9
    80006f28:	0527e063          	bltu	a5,s2,80006f68 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006f2c:	00004517          	auipc	a0,0x4
    80006f30:	69450513          	addi	a0,a0,1684 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80006f34:	00001097          	auipc	ra,0x1
    80006f38:	a44080e7          	jalr	-1468(ra) # 80007978 <_Z11printStringPKc>
    80006f3c:	00000613          	li	a2,0
    80006f40:	00a00593          	li	a1,10
    80006f44:	0009051b          	sext.w	a0,s2
    80006f48:	00001097          	auipc	ra,0x1
    80006f4c:	be0080e7          	jalr	-1056(ra) # 80007b28 <_Z8printIntiii>
    80006f50:	00005517          	auipc	a0,0x5
    80006f54:	8a850513          	addi	a0,a0,-1880 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80006f58:	00001097          	auipc	ra,0x1
    80006f5c:	a20080e7          	jalr	-1504(ra) # 80007978 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006f60:	00000493          	li	s1,0
    80006f64:	f99ff06f          	j	80006efc <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80006f68:	00004517          	auipc	a0,0x4
    80006f6c:	66050513          	addi	a0,a0,1632 # 8000b5c8 <CONSOLE_STATUS+0x5b8>
    80006f70:	00001097          	auipc	ra,0x1
    80006f74:	a08080e7          	jalr	-1528(ra) # 80007978 <_Z11printStringPKc>
    finishedA = true;
    80006f78:	00100793          	li	a5,1
    80006f7c:	00007717          	auipc	a4,0x7
    80006f80:	1af70b23          	sb	a5,438(a4) # 8000e132 <_ZL9finishedA>
}
    80006f84:	01813083          	ld	ra,24(sp)
    80006f88:	01013403          	ld	s0,16(sp)
    80006f8c:	00813483          	ld	s1,8(sp)
    80006f90:	00013903          	ld	s2,0(sp)
    80006f94:	02010113          	addi	sp,sp,32
    80006f98:	00008067          	ret

0000000080006f9c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80006f9c:	fe010113          	addi	sp,sp,-32
    80006fa0:	00113c23          	sd	ra,24(sp)
    80006fa4:	00813823          	sd	s0,16(sp)
    80006fa8:	00913423          	sd	s1,8(sp)
    80006fac:	01213023          	sd	s2,0(sp)
    80006fb0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006fb4:	00000913          	li	s2,0
    80006fb8:	0380006f          	j	80006ff0 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80006fbc:	ffffb097          	auipc	ra,0xffffb
    80006fc0:	9e0080e7          	jalr	-1568(ra) # 8000199c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006fc4:	00148493          	addi	s1,s1,1
    80006fc8:	000027b7          	lui	a5,0x2
    80006fcc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006fd0:	0097ee63          	bltu	a5,s1,80006fec <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006fd4:	00000713          	li	a4,0
    80006fd8:	000077b7          	lui	a5,0x7
    80006fdc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006fe0:	fce7eee3          	bltu	a5,a4,80006fbc <_ZN7WorkerB11workerBodyBEPv+0x20>
    80006fe4:	00170713          	addi	a4,a4,1
    80006fe8:	ff1ff06f          	j	80006fd8 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80006fec:	00190913          	addi	s2,s2,1
    80006ff0:	00f00793          	li	a5,15
    80006ff4:	0527e063          	bltu	a5,s2,80007034 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80006ff8:	00004517          	auipc	a0,0x4
    80006ffc:	5b050513          	addi	a0,a0,1456 # 8000b5a8 <CONSOLE_STATUS+0x598>
    80007000:	00001097          	auipc	ra,0x1
    80007004:	978080e7          	jalr	-1672(ra) # 80007978 <_Z11printStringPKc>
    80007008:	00000613          	li	a2,0
    8000700c:	00a00593          	li	a1,10
    80007010:	0009051b          	sext.w	a0,s2
    80007014:	00001097          	auipc	ra,0x1
    80007018:	b14080e7          	jalr	-1260(ra) # 80007b28 <_Z8printIntiii>
    8000701c:	00004517          	auipc	a0,0x4
    80007020:	7dc50513          	addi	a0,a0,2012 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80007024:	00001097          	auipc	ra,0x1
    80007028:	954080e7          	jalr	-1708(ra) # 80007978 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000702c:	00000493          	li	s1,0
    80007030:	f99ff06f          	j	80006fc8 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80007034:	00004517          	auipc	a0,0x4
    80007038:	57c50513          	addi	a0,a0,1404 # 8000b5b0 <CONSOLE_STATUS+0x5a0>
    8000703c:	00001097          	auipc	ra,0x1
    80007040:	93c080e7          	jalr	-1732(ra) # 80007978 <_Z11printStringPKc>
    finishedB = true;
    80007044:	00100793          	li	a5,1
    80007048:	00007717          	auipc	a4,0x7
    8000704c:	0ef705a3          	sb	a5,235(a4) # 8000e133 <_ZL9finishedB>
    thread_dispatch();
    80007050:	ffffb097          	auipc	ra,0xffffb
    80007054:	94c080e7          	jalr	-1716(ra) # 8000199c <_Z15thread_dispatchv>
}
    80007058:	01813083          	ld	ra,24(sp)
    8000705c:	01013403          	ld	s0,16(sp)
    80007060:	00813483          	ld	s1,8(sp)
    80007064:	00013903          	ld	s2,0(sp)
    80007068:	02010113          	addi	sp,sp,32
    8000706c:	00008067          	ret

0000000080007070 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80007070:	fe010113          	addi	sp,sp,-32
    80007074:	00113c23          	sd	ra,24(sp)
    80007078:	00813823          	sd	s0,16(sp)
    8000707c:	00913423          	sd	s1,8(sp)
    80007080:	01213023          	sd	s2,0(sp)
    80007084:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80007088:	00000493          	li	s1,0
    8000708c:	0400006f          	j	800070cc <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80007090:	00004517          	auipc	a0,0x4
    80007094:	4d850513          	addi	a0,a0,1240 # 8000b568 <CONSOLE_STATUS+0x558>
    80007098:	00001097          	auipc	ra,0x1
    8000709c:	8e0080e7          	jalr	-1824(ra) # 80007978 <_Z11printStringPKc>
    800070a0:	00000613          	li	a2,0
    800070a4:	00a00593          	li	a1,10
    800070a8:	00048513          	mv	a0,s1
    800070ac:	00001097          	auipc	ra,0x1
    800070b0:	a7c080e7          	jalr	-1412(ra) # 80007b28 <_Z8printIntiii>
    800070b4:	00004517          	auipc	a0,0x4
    800070b8:	74450513          	addi	a0,a0,1860 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800070bc:	00001097          	auipc	ra,0x1
    800070c0:	8bc080e7          	jalr	-1860(ra) # 80007978 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800070c4:	0014849b          	addiw	s1,s1,1
    800070c8:	0ff4f493          	andi	s1,s1,255
    800070cc:	00200793          	li	a5,2
    800070d0:	fc97f0e3          	bgeu	a5,s1,80007090 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    800070d4:	00004517          	auipc	a0,0x4
    800070d8:	49c50513          	addi	a0,a0,1180 # 8000b570 <CONSOLE_STATUS+0x560>
    800070dc:	00001097          	auipc	ra,0x1
    800070e0:	89c080e7          	jalr	-1892(ra) # 80007978 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800070e4:	00700313          	li	t1,7
    thread_dispatch();
    800070e8:	ffffb097          	auipc	ra,0xffffb
    800070ec:	8b4080e7          	jalr	-1868(ra) # 8000199c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800070f0:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800070f4:	00004517          	auipc	a0,0x4
    800070f8:	48c50513          	addi	a0,a0,1164 # 8000b580 <CONSOLE_STATUS+0x570>
    800070fc:	00001097          	auipc	ra,0x1
    80007100:	87c080e7          	jalr	-1924(ra) # 80007978 <_Z11printStringPKc>
    80007104:	00000613          	li	a2,0
    80007108:	00a00593          	li	a1,10
    8000710c:	0009051b          	sext.w	a0,s2
    80007110:	00001097          	auipc	ra,0x1
    80007114:	a18080e7          	jalr	-1512(ra) # 80007b28 <_Z8printIntiii>
    80007118:	00004517          	auipc	a0,0x4
    8000711c:	6e050513          	addi	a0,a0,1760 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80007120:	00001097          	auipc	ra,0x1
    80007124:	858080e7          	jalr	-1960(ra) # 80007978 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80007128:	00c00513          	li	a0,12
    8000712c:	00000097          	auipc	ra,0x0
    80007130:	d30080e7          	jalr	-720(ra) # 80006e5c <_ZL9fibonaccim>
    80007134:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80007138:	00004517          	auipc	a0,0x4
    8000713c:	45050513          	addi	a0,a0,1104 # 8000b588 <CONSOLE_STATUS+0x578>
    80007140:	00001097          	auipc	ra,0x1
    80007144:	838080e7          	jalr	-1992(ra) # 80007978 <_Z11printStringPKc>
    80007148:	00000613          	li	a2,0
    8000714c:	00a00593          	li	a1,10
    80007150:	0009051b          	sext.w	a0,s2
    80007154:	00001097          	auipc	ra,0x1
    80007158:	9d4080e7          	jalr	-1580(ra) # 80007b28 <_Z8printIntiii>
    8000715c:	00004517          	auipc	a0,0x4
    80007160:	69c50513          	addi	a0,a0,1692 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80007164:	00001097          	auipc	ra,0x1
    80007168:	814080e7          	jalr	-2028(ra) # 80007978 <_Z11printStringPKc>
    8000716c:	0400006f          	j	800071ac <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80007170:	00004517          	auipc	a0,0x4
    80007174:	3f850513          	addi	a0,a0,1016 # 8000b568 <CONSOLE_STATUS+0x558>
    80007178:	00001097          	auipc	ra,0x1
    8000717c:	800080e7          	jalr	-2048(ra) # 80007978 <_Z11printStringPKc>
    80007180:	00000613          	li	a2,0
    80007184:	00a00593          	li	a1,10
    80007188:	00048513          	mv	a0,s1
    8000718c:	00001097          	auipc	ra,0x1
    80007190:	99c080e7          	jalr	-1636(ra) # 80007b28 <_Z8printIntiii>
    80007194:	00004517          	auipc	a0,0x4
    80007198:	66450513          	addi	a0,a0,1636 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    8000719c:	00000097          	auipc	ra,0x0
    800071a0:	7dc080e7          	jalr	2012(ra) # 80007978 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800071a4:	0014849b          	addiw	s1,s1,1
    800071a8:	0ff4f493          	andi	s1,s1,255
    800071ac:	00500793          	li	a5,5
    800071b0:	fc97f0e3          	bgeu	a5,s1,80007170 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    800071b4:	00004517          	auipc	a0,0x4
    800071b8:	41450513          	addi	a0,a0,1044 # 8000b5c8 <CONSOLE_STATUS+0x5b8>
    800071bc:	00000097          	auipc	ra,0x0
    800071c0:	7bc080e7          	jalr	1980(ra) # 80007978 <_Z11printStringPKc>
    finishedC = true;
    800071c4:	00100793          	li	a5,1
    800071c8:	00007717          	auipc	a4,0x7
    800071cc:	f6f70623          	sb	a5,-148(a4) # 8000e134 <_ZL9finishedC>
    thread_dispatch();
    800071d0:	ffffa097          	auipc	ra,0xffffa
    800071d4:	7cc080e7          	jalr	1996(ra) # 8000199c <_Z15thread_dispatchv>
}
    800071d8:	01813083          	ld	ra,24(sp)
    800071dc:	01013403          	ld	s0,16(sp)
    800071e0:	00813483          	ld	s1,8(sp)
    800071e4:	00013903          	ld	s2,0(sp)
    800071e8:	02010113          	addi	sp,sp,32
    800071ec:	00008067          	ret

00000000800071f0 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800071f0:	fe010113          	addi	sp,sp,-32
    800071f4:	00113c23          	sd	ra,24(sp)
    800071f8:	00813823          	sd	s0,16(sp)
    800071fc:	00913423          	sd	s1,8(sp)
    80007200:	01213023          	sd	s2,0(sp)
    80007204:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80007208:	00a00493          	li	s1,10
    8000720c:	0400006f          	j	8000724c <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80007210:	00004517          	auipc	a0,0x4
    80007214:	32050513          	addi	a0,a0,800 # 8000b530 <CONSOLE_STATUS+0x520>
    80007218:	00000097          	auipc	ra,0x0
    8000721c:	760080e7          	jalr	1888(ra) # 80007978 <_Z11printStringPKc>
    80007220:	00000613          	li	a2,0
    80007224:	00a00593          	li	a1,10
    80007228:	00048513          	mv	a0,s1
    8000722c:	00001097          	auipc	ra,0x1
    80007230:	8fc080e7          	jalr	-1796(ra) # 80007b28 <_Z8printIntiii>
    80007234:	00004517          	auipc	a0,0x4
    80007238:	5c450513          	addi	a0,a0,1476 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    8000723c:	00000097          	auipc	ra,0x0
    80007240:	73c080e7          	jalr	1852(ra) # 80007978 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80007244:	0014849b          	addiw	s1,s1,1
    80007248:	0ff4f493          	andi	s1,s1,255
    8000724c:	00c00793          	li	a5,12
    80007250:	fc97f0e3          	bgeu	a5,s1,80007210 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80007254:	00004517          	auipc	a0,0x4
    80007258:	2e450513          	addi	a0,a0,740 # 8000b538 <CONSOLE_STATUS+0x528>
    8000725c:	00000097          	auipc	ra,0x0
    80007260:	71c080e7          	jalr	1820(ra) # 80007978 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80007264:	00500313          	li	t1,5
    thread_dispatch();
    80007268:	ffffa097          	auipc	ra,0xffffa
    8000726c:	734080e7          	jalr	1844(ra) # 8000199c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80007270:	01000513          	li	a0,16
    80007274:	00000097          	auipc	ra,0x0
    80007278:	be8080e7          	jalr	-1048(ra) # 80006e5c <_ZL9fibonaccim>
    8000727c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80007280:	00004517          	auipc	a0,0x4
    80007284:	2c850513          	addi	a0,a0,712 # 8000b548 <CONSOLE_STATUS+0x538>
    80007288:	00000097          	auipc	ra,0x0
    8000728c:	6f0080e7          	jalr	1776(ra) # 80007978 <_Z11printStringPKc>
    80007290:	00000613          	li	a2,0
    80007294:	00a00593          	li	a1,10
    80007298:	0009051b          	sext.w	a0,s2
    8000729c:	00001097          	auipc	ra,0x1
    800072a0:	88c080e7          	jalr	-1908(ra) # 80007b28 <_Z8printIntiii>
    800072a4:	00004517          	auipc	a0,0x4
    800072a8:	55450513          	addi	a0,a0,1364 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800072ac:	00000097          	auipc	ra,0x0
    800072b0:	6cc080e7          	jalr	1740(ra) # 80007978 <_Z11printStringPKc>
    800072b4:	0400006f          	j	800072f4 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800072b8:	00004517          	auipc	a0,0x4
    800072bc:	27850513          	addi	a0,a0,632 # 8000b530 <CONSOLE_STATUS+0x520>
    800072c0:	00000097          	auipc	ra,0x0
    800072c4:	6b8080e7          	jalr	1720(ra) # 80007978 <_Z11printStringPKc>
    800072c8:	00000613          	li	a2,0
    800072cc:	00a00593          	li	a1,10
    800072d0:	00048513          	mv	a0,s1
    800072d4:	00001097          	auipc	ra,0x1
    800072d8:	854080e7          	jalr	-1964(ra) # 80007b28 <_Z8printIntiii>
    800072dc:	00004517          	auipc	a0,0x4
    800072e0:	51c50513          	addi	a0,a0,1308 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800072e4:	00000097          	auipc	ra,0x0
    800072e8:	694080e7          	jalr	1684(ra) # 80007978 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800072ec:	0014849b          	addiw	s1,s1,1
    800072f0:	0ff4f493          	andi	s1,s1,255
    800072f4:	00f00793          	li	a5,15
    800072f8:	fc97f0e3          	bgeu	a5,s1,800072b8 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800072fc:	00004517          	auipc	a0,0x4
    80007300:	25c50513          	addi	a0,a0,604 # 8000b558 <CONSOLE_STATUS+0x548>
    80007304:	00000097          	auipc	ra,0x0
    80007308:	674080e7          	jalr	1652(ra) # 80007978 <_Z11printStringPKc>
    finishedD = true;
    8000730c:	00100793          	li	a5,1
    80007310:	00007717          	auipc	a4,0x7
    80007314:	e2f702a3          	sb	a5,-475(a4) # 8000e135 <_ZL9finishedD>
    thread_dispatch();
    80007318:	ffffa097          	auipc	ra,0xffffa
    8000731c:	684080e7          	jalr	1668(ra) # 8000199c <_Z15thread_dispatchv>
}
    80007320:	01813083          	ld	ra,24(sp)
    80007324:	01013403          	ld	s0,16(sp)
    80007328:	00813483          	ld	s1,8(sp)
    8000732c:	00013903          	ld	s2,0(sp)
    80007330:	02010113          	addi	sp,sp,32
    80007334:	00008067          	ret

0000000080007338 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80007338:	fc010113          	addi	sp,sp,-64
    8000733c:	02113c23          	sd	ra,56(sp)
    80007340:	02813823          	sd	s0,48(sp)
    80007344:	02913423          	sd	s1,40(sp)
    80007348:	03213023          	sd	s2,32(sp)
    8000734c:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80007350:	02000513          	li	a0,32
    80007354:	ffffa097          	auipc	ra,0xffffa
    80007358:	e68080e7          	jalr	-408(ra) # 800011bc <_Znwm>
    8000735c:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80007360:	ffffa097          	auipc	ra,0xffffa
    80007364:	040080e7          	jalr	64(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007368:	00007797          	auipc	a5,0x7
    8000736c:	ba078793          	addi	a5,a5,-1120 # 8000df08 <_ZTV7WorkerA+0x10>
    80007370:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80007374:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80007378:	00004517          	auipc	a0,0x4
    8000737c:	26050513          	addi	a0,a0,608 # 8000b5d8 <CONSOLE_STATUS+0x5c8>
    80007380:	00000097          	auipc	ra,0x0
    80007384:	5f8080e7          	jalr	1528(ra) # 80007978 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80007388:	02000513          	li	a0,32
    8000738c:	ffffa097          	auipc	ra,0xffffa
    80007390:	e30080e7          	jalr	-464(ra) # 800011bc <_Znwm>
    80007394:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80007398:	ffffa097          	auipc	ra,0xffffa
    8000739c:	008080e7          	jalr	8(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800073a0:	00007797          	auipc	a5,0x7
    800073a4:	b9078793          	addi	a5,a5,-1136 # 8000df30 <_ZTV7WorkerB+0x10>
    800073a8:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800073ac:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800073b0:	00004517          	auipc	a0,0x4
    800073b4:	24050513          	addi	a0,a0,576 # 8000b5f0 <CONSOLE_STATUS+0x5e0>
    800073b8:	00000097          	auipc	ra,0x0
    800073bc:	5c0080e7          	jalr	1472(ra) # 80007978 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800073c0:	02000513          	li	a0,32
    800073c4:	ffffa097          	auipc	ra,0xffffa
    800073c8:	df8080e7          	jalr	-520(ra) # 800011bc <_Znwm>
    800073cc:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800073d0:	ffffa097          	auipc	ra,0xffffa
    800073d4:	fd0080e7          	jalr	-48(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800073d8:	00007797          	auipc	a5,0x7
    800073dc:	b8078793          	addi	a5,a5,-1152 # 8000df58 <_ZTV7WorkerC+0x10>
    800073e0:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800073e4:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800073e8:	00004517          	auipc	a0,0x4
    800073ec:	22050513          	addi	a0,a0,544 # 8000b608 <CONSOLE_STATUS+0x5f8>
    800073f0:	00000097          	auipc	ra,0x0
    800073f4:	588080e7          	jalr	1416(ra) # 80007978 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800073f8:	02000513          	li	a0,32
    800073fc:	ffffa097          	auipc	ra,0xffffa
    80007400:	dc0080e7          	jalr	-576(ra) # 800011bc <_Znwm>
    80007404:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80007408:	ffffa097          	auipc	ra,0xffffa
    8000740c:	f98080e7          	jalr	-104(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007410:	00007797          	auipc	a5,0x7
    80007414:	b7078793          	addi	a5,a5,-1168 # 8000df80 <_ZTV7WorkerD+0x10>
    80007418:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    8000741c:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80007420:	00004517          	auipc	a0,0x4
    80007424:	20050513          	addi	a0,a0,512 # 8000b620 <CONSOLE_STATUS+0x610>
    80007428:	00000097          	auipc	ra,0x0
    8000742c:	550080e7          	jalr	1360(ra) # 80007978 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80007430:	00000493          	li	s1,0
    80007434:	00300793          	li	a5,3
    80007438:	0297c663          	blt	a5,s1,80007464 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    8000743c:	00349793          	slli	a5,s1,0x3
    80007440:	fe040713          	addi	a4,s0,-32
    80007444:	00f707b3          	add	a5,a4,a5
    80007448:	fe07b503          	ld	a0,-32(a5)
    8000744c:	ffffa097          	auipc	ra,0xffffa
    80007450:	e6c080e7          	jalr	-404(ra) # 800012b8 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80007454:	0014849b          	addiw	s1,s1,1
    80007458:	fddff06f          	j	80007434 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    8000745c:	ffffa097          	auipc	ra,0xffffa
    80007460:	ebc080e7          	jalr	-324(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80007464:	00007797          	auipc	a5,0x7
    80007468:	cce7c783          	lbu	a5,-818(a5) # 8000e132 <_ZL9finishedA>
    8000746c:	fe0788e3          	beqz	a5,8000745c <_Z20Threads_CPP_API_testv+0x124>
    80007470:	00007797          	auipc	a5,0x7
    80007474:	cc37c783          	lbu	a5,-829(a5) # 8000e133 <_ZL9finishedB>
    80007478:	fe0782e3          	beqz	a5,8000745c <_Z20Threads_CPP_API_testv+0x124>
    8000747c:	00007797          	auipc	a5,0x7
    80007480:	cb87c783          	lbu	a5,-840(a5) # 8000e134 <_ZL9finishedC>
    80007484:	fc078ce3          	beqz	a5,8000745c <_Z20Threads_CPP_API_testv+0x124>
    80007488:	00007797          	auipc	a5,0x7
    8000748c:	cad7c783          	lbu	a5,-851(a5) # 8000e135 <_ZL9finishedD>
    80007490:	fc0786e3          	beqz	a5,8000745c <_Z20Threads_CPP_API_testv+0x124>
    80007494:	fc040493          	addi	s1,s0,-64
    80007498:	0080006f          	j	800074a0 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    8000749c:	00848493          	addi	s1,s1,8
    800074a0:	fe040793          	addi	a5,s0,-32
    800074a4:	08f48663          	beq	s1,a5,80007530 <_Z20Threads_CPP_API_testv+0x1f8>
    800074a8:	0004b503          	ld	a0,0(s1)
    800074ac:	fe0508e3          	beqz	a0,8000749c <_Z20Threads_CPP_API_testv+0x164>
    800074b0:	00053783          	ld	a5,0(a0)
    800074b4:	0087b783          	ld	a5,8(a5)
    800074b8:	000780e7          	jalr	a5
    800074bc:	fe1ff06f          	j	8000749c <_Z20Threads_CPP_API_testv+0x164>
    800074c0:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800074c4:	00048513          	mv	a0,s1
    800074c8:	ffffa097          	auipc	ra,0xffffa
    800074cc:	d1c080e7          	jalr	-740(ra) # 800011e4 <_ZdlPv>
    800074d0:	00090513          	mv	a0,s2
    800074d4:	00008097          	auipc	ra,0x8
    800074d8:	d44080e7          	jalr	-700(ra) # 8000f218 <_Unwind_Resume>
    800074dc:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800074e0:	00048513          	mv	a0,s1
    800074e4:	ffffa097          	auipc	ra,0xffffa
    800074e8:	d00080e7          	jalr	-768(ra) # 800011e4 <_ZdlPv>
    800074ec:	00090513          	mv	a0,s2
    800074f0:	00008097          	auipc	ra,0x8
    800074f4:	d28080e7          	jalr	-728(ra) # 8000f218 <_Unwind_Resume>
    800074f8:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800074fc:	00048513          	mv	a0,s1
    80007500:	ffffa097          	auipc	ra,0xffffa
    80007504:	ce4080e7          	jalr	-796(ra) # 800011e4 <_ZdlPv>
    80007508:	00090513          	mv	a0,s2
    8000750c:	00008097          	auipc	ra,0x8
    80007510:	d0c080e7          	jalr	-756(ra) # 8000f218 <_Unwind_Resume>
    80007514:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80007518:	00048513          	mv	a0,s1
    8000751c:	ffffa097          	auipc	ra,0xffffa
    80007520:	cc8080e7          	jalr	-824(ra) # 800011e4 <_ZdlPv>
    80007524:	00090513          	mv	a0,s2
    80007528:	00008097          	auipc	ra,0x8
    8000752c:	cf0080e7          	jalr	-784(ra) # 8000f218 <_Unwind_Resume>
}
    80007530:	03813083          	ld	ra,56(sp)
    80007534:	03013403          	ld	s0,48(sp)
    80007538:	02813483          	ld	s1,40(sp)
    8000753c:	02013903          	ld	s2,32(sp)
    80007540:	04010113          	addi	sp,sp,64
    80007544:	00008067          	ret

0000000080007548 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80007548:	ff010113          	addi	sp,sp,-16
    8000754c:	00113423          	sd	ra,8(sp)
    80007550:	00813023          	sd	s0,0(sp)
    80007554:	01010413          	addi	s0,sp,16
    80007558:	00007797          	auipc	a5,0x7
    8000755c:	9b078793          	addi	a5,a5,-1616 # 8000df08 <_ZTV7WorkerA+0x10>
    80007560:	00f53023          	sd	a5,0(a0)
    80007564:	ffffa097          	auipc	ra,0xffffa
    80007568:	be8080e7          	jalr	-1048(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000756c:	00813083          	ld	ra,8(sp)
    80007570:	00013403          	ld	s0,0(sp)
    80007574:	01010113          	addi	sp,sp,16
    80007578:	00008067          	ret

000000008000757c <_ZN7WorkerAD0Ev>:
    8000757c:	fe010113          	addi	sp,sp,-32
    80007580:	00113c23          	sd	ra,24(sp)
    80007584:	00813823          	sd	s0,16(sp)
    80007588:	00913423          	sd	s1,8(sp)
    8000758c:	02010413          	addi	s0,sp,32
    80007590:	00050493          	mv	s1,a0
    80007594:	00007797          	auipc	a5,0x7
    80007598:	97478793          	addi	a5,a5,-1676 # 8000df08 <_ZTV7WorkerA+0x10>
    8000759c:	00f53023          	sd	a5,0(a0)
    800075a0:	ffffa097          	auipc	ra,0xffffa
    800075a4:	bac080e7          	jalr	-1108(ra) # 8000114c <_ZN6ThreadD1Ev>
    800075a8:	00048513          	mv	a0,s1
    800075ac:	ffffa097          	auipc	ra,0xffffa
    800075b0:	c38080e7          	jalr	-968(ra) # 800011e4 <_ZdlPv>
    800075b4:	01813083          	ld	ra,24(sp)
    800075b8:	01013403          	ld	s0,16(sp)
    800075bc:	00813483          	ld	s1,8(sp)
    800075c0:	02010113          	addi	sp,sp,32
    800075c4:	00008067          	ret

00000000800075c8 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800075c8:	ff010113          	addi	sp,sp,-16
    800075cc:	00113423          	sd	ra,8(sp)
    800075d0:	00813023          	sd	s0,0(sp)
    800075d4:	01010413          	addi	s0,sp,16
    800075d8:	00007797          	auipc	a5,0x7
    800075dc:	95878793          	addi	a5,a5,-1704 # 8000df30 <_ZTV7WorkerB+0x10>
    800075e0:	00f53023          	sd	a5,0(a0)
    800075e4:	ffffa097          	auipc	ra,0xffffa
    800075e8:	b68080e7          	jalr	-1176(ra) # 8000114c <_ZN6ThreadD1Ev>
    800075ec:	00813083          	ld	ra,8(sp)
    800075f0:	00013403          	ld	s0,0(sp)
    800075f4:	01010113          	addi	sp,sp,16
    800075f8:	00008067          	ret

00000000800075fc <_ZN7WorkerBD0Ev>:
    800075fc:	fe010113          	addi	sp,sp,-32
    80007600:	00113c23          	sd	ra,24(sp)
    80007604:	00813823          	sd	s0,16(sp)
    80007608:	00913423          	sd	s1,8(sp)
    8000760c:	02010413          	addi	s0,sp,32
    80007610:	00050493          	mv	s1,a0
    80007614:	00007797          	auipc	a5,0x7
    80007618:	91c78793          	addi	a5,a5,-1764 # 8000df30 <_ZTV7WorkerB+0x10>
    8000761c:	00f53023          	sd	a5,0(a0)
    80007620:	ffffa097          	auipc	ra,0xffffa
    80007624:	b2c080e7          	jalr	-1236(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007628:	00048513          	mv	a0,s1
    8000762c:	ffffa097          	auipc	ra,0xffffa
    80007630:	bb8080e7          	jalr	-1096(ra) # 800011e4 <_ZdlPv>
    80007634:	01813083          	ld	ra,24(sp)
    80007638:	01013403          	ld	s0,16(sp)
    8000763c:	00813483          	ld	s1,8(sp)
    80007640:	02010113          	addi	sp,sp,32
    80007644:	00008067          	ret

0000000080007648 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80007648:	ff010113          	addi	sp,sp,-16
    8000764c:	00113423          	sd	ra,8(sp)
    80007650:	00813023          	sd	s0,0(sp)
    80007654:	01010413          	addi	s0,sp,16
    80007658:	00007797          	auipc	a5,0x7
    8000765c:	90078793          	addi	a5,a5,-1792 # 8000df58 <_ZTV7WorkerC+0x10>
    80007660:	00f53023          	sd	a5,0(a0)
    80007664:	ffffa097          	auipc	ra,0xffffa
    80007668:	ae8080e7          	jalr	-1304(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000766c:	00813083          	ld	ra,8(sp)
    80007670:	00013403          	ld	s0,0(sp)
    80007674:	01010113          	addi	sp,sp,16
    80007678:	00008067          	ret

000000008000767c <_ZN7WorkerCD0Ev>:
    8000767c:	fe010113          	addi	sp,sp,-32
    80007680:	00113c23          	sd	ra,24(sp)
    80007684:	00813823          	sd	s0,16(sp)
    80007688:	00913423          	sd	s1,8(sp)
    8000768c:	02010413          	addi	s0,sp,32
    80007690:	00050493          	mv	s1,a0
    80007694:	00007797          	auipc	a5,0x7
    80007698:	8c478793          	addi	a5,a5,-1852 # 8000df58 <_ZTV7WorkerC+0x10>
    8000769c:	00f53023          	sd	a5,0(a0)
    800076a0:	ffffa097          	auipc	ra,0xffffa
    800076a4:	aac080e7          	jalr	-1364(ra) # 8000114c <_ZN6ThreadD1Ev>
    800076a8:	00048513          	mv	a0,s1
    800076ac:	ffffa097          	auipc	ra,0xffffa
    800076b0:	b38080e7          	jalr	-1224(ra) # 800011e4 <_ZdlPv>
    800076b4:	01813083          	ld	ra,24(sp)
    800076b8:	01013403          	ld	s0,16(sp)
    800076bc:	00813483          	ld	s1,8(sp)
    800076c0:	02010113          	addi	sp,sp,32
    800076c4:	00008067          	ret

00000000800076c8 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800076c8:	ff010113          	addi	sp,sp,-16
    800076cc:	00113423          	sd	ra,8(sp)
    800076d0:	00813023          	sd	s0,0(sp)
    800076d4:	01010413          	addi	s0,sp,16
    800076d8:	00007797          	auipc	a5,0x7
    800076dc:	8a878793          	addi	a5,a5,-1880 # 8000df80 <_ZTV7WorkerD+0x10>
    800076e0:	00f53023          	sd	a5,0(a0)
    800076e4:	ffffa097          	auipc	ra,0xffffa
    800076e8:	a68080e7          	jalr	-1432(ra) # 8000114c <_ZN6ThreadD1Ev>
    800076ec:	00813083          	ld	ra,8(sp)
    800076f0:	00013403          	ld	s0,0(sp)
    800076f4:	01010113          	addi	sp,sp,16
    800076f8:	00008067          	ret

00000000800076fc <_ZN7WorkerDD0Ev>:
    800076fc:	fe010113          	addi	sp,sp,-32
    80007700:	00113c23          	sd	ra,24(sp)
    80007704:	00813823          	sd	s0,16(sp)
    80007708:	00913423          	sd	s1,8(sp)
    8000770c:	02010413          	addi	s0,sp,32
    80007710:	00050493          	mv	s1,a0
    80007714:	00007797          	auipc	a5,0x7
    80007718:	86c78793          	addi	a5,a5,-1940 # 8000df80 <_ZTV7WorkerD+0x10>
    8000771c:	00f53023          	sd	a5,0(a0)
    80007720:	ffffa097          	auipc	ra,0xffffa
    80007724:	a2c080e7          	jalr	-1492(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007728:	00048513          	mv	a0,s1
    8000772c:	ffffa097          	auipc	ra,0xffffa
    80007730:	ab8080e7          	jalr	-1352(ra) # 800011e4 <_ZdlPv>
    80007734:	01813083          	ld	ra,24(sp)
    80007738:	01013403          	ld	s0,16(sp)
    8000773c:	00813483          	ld	s1,8(sp)
    80007740:	02010113          	addi	sp,sp,32
    80007744:	00008067          	ret

0000000080007748 <_ZN7WorkerA3runEv>:
    void run() override {
    80007748:	ff010113          	addi	sp,sp,-16
    8000774c:	00113423          	sd	ra,8(sp)
    80007750:	00813023          	sd	s0,0(sp)
    80007754:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80007758:	00000593          	li	a1,0
    8000775c:	fffff097          	auipc	ra,0xfffff
    80007760:	774080e7          	jalr	1908(ra) # 80006ed0 <_ZN7WorkerA11workerBodyAEPv>
    }
    80007764:	00813083          	ld	ra,8(sp)
    80007768:	00013403          	ld	s0,0(sp)
    8000776c:	01010113          	addi	sp,sp,16
    80007770:	00008067          	ret

0000000080007774 <_ZN7WorkerB3runEv>:
    void run() override {
    80007774:	ff010113          	addi	sp,sp,-16
    80007778:	00113423          	sd	ra,8(sp)
    8000777c:	00813023          	sd	s0,0(sp)
    80007780:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80007784:	00000593          	li	a1,0
    80007788:	00000097          	auipc	ra,0x0
    8000778c:	814080e7          	jalr	-2028(ra) # 80006f9c <_ZN7WorkerB11workerBodyBEPv>
    }
    80007790:	00813083          	ld	ra,8(sp)
    80007794:	00013403          	ld	s0,0(sp)
    80007798:	01010113          	addi	sp,sp,16
    8000779c:	00008067          	ret

00000000800077a0 <_ZN7WorkerC3runEv>:
    void run() override {
    800077a0:	ff010113          	addi	sp,sp,-16
    800077a4:	00113423          	sd	ra,8(sp)
    800077a8:	00813023          	sd	s0,0(sp)
    800077ac:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800077b0:	00000593          	li	a1,0
    800077b4:	00000097          	auipc	ra,0x0
    800077b8:	8bc080e7          	jalr	-1860(ra) # 80007070 <_ZN7WorkerC11workerBodyCEPv>
    }
    800077bc:	00813083          	ld	ra,8(sp)
    800077c0:	00013403          	ld	s0,0(sp)
    800077c4:	01010113          	addi	sp,sp,16
    800077c8:	00008067          	ret

00000000800077cc <_ZN7WorkerD3runEv>:
    void run() override {
    800077cc:	ff010113          	addi	sp,sp,-16
    800077d0:	00113423          	sd	ra,8(sp)
    800077d4:	00813023          	sd	s0,0(sp)
    800077d8:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800077dc:	00000593          	li	a1,0
    800077e0:	00000097          	auipc	ra,0x0
    800077e4:	a10080e7          	jalr	-1520(ra) # 800071f0 <_ZN7WorkerD11workerBodyDEPv>
    }
    800077e8:	00813083          	ld	ra,8(sp)
    800077ec:	00013403          	ld	s0,0(sp)
    800077f0:	01010113          	addi	sp,sp,16
    800077f4:	00008067          	ret

00000000800077f8 <_Z8userMainv>:
#include "../test_h/ConsumerProducer_CPP_API_test.h"
#include "../test_h/System_Mode_test.h"

#endif

void userMain() {
    800077f8:	fe010113          	addi	sp,sp,-32
    800077fc:	00113c23          	sd	ra,24(sp)
    80007800:	00813823          	sd	s0,16(sp)
    80007804:	00913423          	sd	s1,8(sp)
    80007808:	01213023          	sd	s2,0(sp)
    8000780c:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80007810:	00004517          	auipc	a0,0x4
    80007814:	ea850513          	addi	a0,a0,-344 # 8000b6b8 <CONSOLE_STATUS+0x6a8>
    80007818:	00000097          	auipc	ra,0x0
    8000781c:	160080e7          	jalr	352(ra) # 80007978 <_Z11printStringPKc>
    int test = getc() - '0';
    80007820:	ffffa097          	auipc	ra,0xffffa
    80007824:	2a8080e7          	jalr	680(ra) # 80001ac8 <_Z4getcv>
    80007828:	00050913          	mv	s2,a0
    8000782c:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80007830:	ffffa097          	auipc	ra,0xffffa
    80007834:	298080e7          	jalr	664(ra) # 80001ac8 <_Z4getcv>
    // int test = 3;
    putc(test);
    80007838:	fd09051b          	addiw	a0,s2,-48
    8000783c:	0ff57513          	andi	a0,a0,255
    80007840:	ffffa097          	auipc	ra,0xffffa
    80007844:	2b0080e7          	jalr	688(ra) # 80001af0 <_Z4putcc>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80007848:	00700793          	li	a5,7
    8000784c:	1097ec63          	bltu	a5,s1,80007964 <_Z8userMainv+0x16c>
    80007850:	00249493          	slli	s1,s1,0x2
    80007854:	00004717          	auipc	a4,0x4
    80007858:	0d070713          	addi	a4,a4,208 # 8000b924 <CONSOLE_STATUS+0x914>
    8000785c:	00e484b3          	add	s1,s1,a4
    80007860:	0004a783          	lw	a5,0(s1)
    80007864:	00e787b3          	add	a5,a5,a4
    80007868:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    8000786c:	fffff097          	auipc	ra,0xfffff
    80007870:	f64080e7          	jalr	-156(ra) # 800067d0 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80007874:	00004517          	auipc	a0,0x4
    80007878:	e6450513          	addi	a0,a0,-412 # 8000b6d8 <CONSOLE_STATUS+0x6c8>
    8000787c:	00000097          	auipc	ra,0x0
    80007880:	0fc080e7          	jalr	252(ra) # 80007978 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    printString("Kraj izvrsavanja");
    80007884:	00004517          	auipc	a0,0x4
    80007888:	08c50513          	addi	a0,a0,140 # 8000b910 <CONSOLE_STATUS+0x900>
    8000788c:	00000097          	auipc	ra,0x0
    80007890:	0ec080e7          	jalr	236(ra) # 80007978 <_Z11printStringPKc>
    80007894:	01813083          	ld	ra,24(sp)
    80007898:	01013403          	ld	s0,16(sp)
    8000789c:	00813483          	ld	s1,8(sp)
    800078a0:	00013903          	ld	s2,0(sp)
    800078a4:	02010113          	addi	sp,sp,32
    800078a8:	00008067          	ret
            Threads_CPP_API_test();
    800078ac:	00000097          	auipc	ra,0x0
    800078b0:	a8c080e7          	jalr	-1396(ra) # 80007338 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800078b4:	00004517          	auipc	a0,0x4
    800078b8:	e6450513          	addi	a0,a0,-412 # 8000b718 <CONSOLE_STATUS+0x708>
    800078bc:	00000097          	auipc	ra,0x0
    800078c0:	0bc080e7          	jalr	188(ra) # 80007978 <_Z11printStringPKc>
            break;
    800078c4:	fc1ff06f          	j	80007884 <_Z8userMainv+0x8c>
            producerConsumer_C_API();
    800078c8:	ffffe097          	auipc	ra,0xffffe
    800078cc:	9f4080e7          	jalr	-1548(ra) # 800052bc <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    800078d0:	00004517          	auipc	a0,0x4
    800078d4:	e8850513          	addi	a0,a0,-376 # 8000b758 <CONSOLE_STATUS+0x748>
    800078d8:	00000097          	auipc	ra,0x0
    800078dc:	0a0080e7          	jalr	160(ra) # 80007978 <_Z11printStringPKc>
            break;
    800078e0:	fa5ff06f          	j	80007884 <_Z8userMainv+0x8c>
            producerConsumer_CPP_Sync_API();
    800078e4:	00000097          	auipc	ra,0x0
    800078e8:	5ac080e7          	jalr	1452(ra) # 80007e90 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    800078ec:	00004517          	auipc	a0,0x4
    800078f0:	ebc50513          	addi	a0,a0,-324 # 8000b7a8 <CONSOLE_STATUS+0x798>
    800078f4:	00000097          	auipc	ra,0x0
    800078f8:	084080e7          	jalr	132(ra) # 80007978 <_Z11printStringPKc>
            break;
    800078fc:	f89ff06f          	j	80007884 <_Z8userMainv+0x8c>
            testSleeping();
    80007900:	fffff097          	auipc	ra,0xfffff
    80007904:	07c080e7          	jalr	124(ra) # 8000697c <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., time_sleep test C API)\n");
    80007908:	00004517          	auipc	a0,0x4
    8000790c:	ef850513          	addi	a0,a0,-264 # 8000b800 <CONSOLE_STATUS+0x7f0>
    80007910:	00000097          	auipc	ra,0x0
    80007914:	068080e7          	jalr	104(ra) # 80007978 <_Z11printStringPKc>
            break;
    80007918:	f6dff06f          	j	80007884 <_Z8userMainv+0x8c>
            testConsumerProducer();
    8000791c:	ffffe097          	auipc	ra,0xffffe
    80007920:	c70080e7          	jalr	-912(ra) # 8000558c <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80007924:	00004517          	auipc	a0,0x4
    80007928:	f0c50513          	addi	a0,a0,-244 # 8000b830 <CONSOLE_STATUS+0x820>
    8000792c:	00000097          	auipc	ra,0x0
    80007930:	04c080e7          	jalr	76(ra) # 80007978 <_Z11printStringPKc>
            break;
    80007934:	f51ff06f          	j	80007884 <_Z8userMainv+0x8c>
            System_Mode_test();
    80007938:	fffff097          	auipc	ra,0xfffff
    8000793c:	8c0080e7          	jalr	-1856(ra) # 800061f8 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80007940:	00004517          	auipc	a0,0x4
    80007944:	f3050513          	addi	a0,a0,-208 # 8000b870 <CONSOLE_STATUS+0x860>
    80007948:	00000097          	auipc	ra,0x0
    8000794c:	030080e7          	jalr	48(ra) # 80007978 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80007950:	00004517          	auipc	a0,0x4
    80007954:	f4050513          	addi	a0,a0,-192 # 8000b890 <CONSOLE_STATUS+0x880>
    80007958:	00000097          	auipc	ra,0x0
    8000795c:	020080e7          	jalr	32(ra) # 80007978 <_Z11printStringPKc>
            break;
    80007960:	f25ff06f          	j	80007884 <_Z8userMainv+0x8c>
            printString("Niste uneli odgovarajuci broj za test\n");
    80007964:	00004517          	auipc	a0,0x4
    80007968:	f8450513          	addi	a0,a0,-124 # 8000b8e8 <CONSOLE_STATUS+0x8d8>
    8000796c:	00000097          	auipc	ra,0x0
    80007970:	00c080e7          	jalr	12(ra) # 80007978 <_Z11printStringPKc>
    80007974:	f11ff06f          	j	80007884 <_Z8userMainv+0x8c>

0000000080007978 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80007978:	fe010113          	addi	sp,sp,-32
    8000797c:	00113c23          	sd	ra,24(sp)
    80007980:	00813823          	sd	s0,16(sp)
    80007984:	00913423          	sd	s1,8(sp)
    80007988:	02010413          	addi	s0,sp,32
    8000798c:	00050493          	mv	s1,a0
    LOCK();
    80007990:	00100613          	li	a2,1
    80007994:	00000593          	li	a1,0
    80007998:	00006517          	auipc	a0,0x6
    8000799c:	7a050513          	addi	a0,a0,1952 # 8000e138 <lockPrint>
    800079a0:	ffff9097          	auipc	ra,0xffff9
    800079a4:	760080e7          	jalr	1888(ra) # 80001100 <copy_and_swap>
    800079a8:	00050863          	beqz	a0,800079b8 <_Z11printStringPKc+0x40>
    800079ac:	ffffa097          	auipc	ra,0xffffa
    800079b0:	ff0080e7          	jalr	-16(ra) # 8000199c <_Z15thread_dispatchv>
    800079b4:	fddff06f          	j	80007990 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800079b8:	0004c503          	lbu	a0,0(s1)
    800079bc:	00050a63          	beqz	a0,800079d0 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800079c0:	ffffa097          	auipc	ra,0xffffa
    800079c4:	130080e7          	jalr	304(ra) # 80001af0 <_Z4putcc>
        string++;
    800079c8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800079cc:	fedff06f          	j	800079b8 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800079d0:	00000613          	li	a2,0
    800079d4:	00100593          	li	a1,1
    800079d8:	00006517          	auipc	a0,0x6
    800079dc:	76050513          	addi	a0,a0,1888 # 8000e138 <lockPrint>
    800079e0:	ffff9097          	auipc	ra,0xffff9
    800079e4:	720080e7          	jalr	1824(ra) # 80001100 <copy_and_swap>
    800079e8:	fe0514e3          	bnez	a0,800079d0 <_Z11printStringPKc+0x58>
}
    800079ec:	01813083          	ld	ra,24(sp)
    800079f0:	01013403          	ld	s0,16(sp)
    800079f4:	00813483          	ld	s1,8(sp)
    800079f8:	02010113          	addi	sp,sp,32
    800079fc:	00008067          	ret

0000000080007a00 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80007a00:	fd010113          	addi	sp,sp,-48
    80007a04:	02113423          	sd	ra,40(sp)
    80007a08:	02813023          	sd	s0,32(sp)
    80007a0c:	00913c23          	sd	s1,24(sp)
    80007a10:	01213823          	sd	s2,16(sp)
    80007a14:	01313423          	sd	s3,8(sp)
    80007a18:	01413023          	sd	s4,0(sp)
    80007a1c:	03010413          	addi	s0,sp,48
    80007a20:	00050993          	mv	s3,a0
    80007a24:	00058a13          	mv	s4,a1
    LOCK();
    80007a28:	00100613          	li	a2,1
    80007a2c:	00000593          	li	a1,0
    80007a30:	00006517          	auipc	a0,0x6
    80007a34:	70850513          	addi	a0,a0,1800 # 8000e138 <lockPrint>
    80007a38:	ffff9097          	auipc	ra,0xffff9
    80007a3c:	6c8080e7          	jalr	1736(ra) # 80001100 <copy_and_swap>
    80007a40:	00050863          	beqz	a0,80007a50 <_Z9getStringPci+0x50>
    80007a44:	ffffa097          	auipc	ra,0xffffa
    80007a48:	f58080e7          	jalr	-168(ra) # 8000199c <_Z15thread_dispatchv>
    80007a4c:	fddff06f          	j	80007a28 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80007a50:	00000913          	li	s2,0
    80007a54:	00090493          	mv	s1,s2
    80007a58:	0019091b          	addiw	s2,s2,1
    80007a5c:	03495a63          	bge	s2,s4,80007a90 <_Z9getStringPci+0x90>
        cc = getc();
    80007a60:	ffffa097          	auipc	ra,0xffffa
    80007a64:	068080e7          	jalr	104(ra) # 80001ac8 <_Z4getcv>
        if(cc < 1)
    80007a68:	02050463          	beqz	a0,80007a90 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80007a6c:	009984b3          	add	s1,s3,s1
    80007a70:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80007a74:	00a00793          	li	a5,10
    80007a78:	00f50a63          	beq	a0,a5,80007a8c <_Z9getStringPci+0x8c>
    80007a7c:	00d00793          	li	a5,13
    80007a80:	fcf51ae3          	bne	a0,a5,80007a54 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80007a84:	00090493          	mv	s1,s2
    80007a88:	0080006f          	j	80007a90 <_Z9getStringPci+0x90>
    80007a8c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80007a90:	009984b3          	add	s1,s3,s1
    80007a94:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80007a98:	00000613          	li	a2,0
    80007a9c:	00100593          	li	a1,1
    80007aa0:	00006517          	auipc	a0,0x6
    80007aa4:	69850513          	addi	a0,a0,1688 # 8000e138 <lockPrint>
    80007aa8:	ffff9097          	auipc	ra,0xffff9
    80007aac:	658080e7          	jalr	1624(ra) # 80001100 <copy_and_swap>
    80007ab0:	fe0514e3          	bnez	a0,80007a98 <_Z9getStringPci+0x98>
    return buf;
}
    80007ab4:	00098513          	mv	a0,s3
    80007ab8:	02813083          	ld	ra,40(sp)
    80007abc:	02013403          	ld	s0,32(sp)
    80007ac0:	01813483          	ld	s1,24(sp)
    80007ac4:	01013903          	ld	s2,16(sp)
    80007ac8:	00813983          	ld	s3,8(sp)
    80007acc:	00013a03          	ld	s4,0(sp)
    80007ad0:	03010113          	addi	sp,sp,48
    80007ad4:	00008067          	ret

0000000080007ad8 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80007ad8:	ff010113          	addi	sp,sp,-16
    80007adc:	00813423          	sd	s0,8(sp)
    80007ae0:	01010413          	addi	s0,sp,16
    80007ae4:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80007ae8:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80007aec:	0006c603          	lbu	a2,0(a3)
    80007af0:	fd06071b          	addiw	a4,a2,-48
    80007af4:	0ff77713          	andi	a4,a4,255
    80007af8:	00900793          	li	a5,9
    80007afc:	02e7e063          	bltu	a5,a4,80007b1c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80007b00:	0025179b          	slliw	a5,a0,0x2
    80007b04:	00a787bb          	addw	a5,a5,a0
    80007b08:	0017979b          	slliw	a5,a5,0x1
    80007b0c:	00168693          	addi	a3,a3,1
    80007b10:	00c787bb          	addw	a5,a5,a2
    80007b14:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80007b18:	fd5ff06f          	j	80007aec <_Z11stringToIntPKc+0x14>
    return n;
}
    80007b1c:	00813403          	ld	s0,8(sp)
    80007b20:	01010113          	addi	sp,sp,16
    80007b24:	00008067          	ret

0000000080007b28 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80007b28:	fc010113          	addi	sp,sp,-64
    80007b2c:	02113c23          	sd	ra,56(sp)
    80007b30:	02813823          	sd	s0,48(sp)
    80007b34:	02913423          	sd	s1,40(sp)
    80007b38:	03213023          	sd	s2,32(sp)
    80007b3c:	01313c23          	sd	s3,24(sp)
    80007b40:	04010413          	addi	s0,sp,64
    80007b44:	00050493          	mv	s1,a0
    80007b48:	00058913          	mv	s2,a1
    80007b4c:	00060993          	mv	s3,a2
    LOCK();
    80007b50:	00100613          	li	a2,1
    80007b54:	00000593          	li	a1,0
    80007b58:	00006517          	auipc	a0,0x6
    80007b5c:	5e050513          	addi	a0,a0,1504 # 8000e138 <lockPrint>
    80007b60:	ffff9097          	auipc	ra,0xffff9
    80007b64:	5a0080e7          	jalr	1440(ra) # 80001100 <copy_and_swap>
    80007b68:	00050863          	beqz	a0,80007b78 <_Z8printIntiii+0x50>
    80007b6c:	ffffa097          	auipc	ra,0xffffa
    80007b70:	e30080e7          	jalr	-464(ra) # 8000199c <_Z15thread_dispatchv>
    80007b74:	fddff06f          	j	80007b50 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80007b78:	00098463          	beqz	s3,80007b80 <_Z8printIntiii+0x58>
    80007b7c:	0804c463          	bltz	s1,80007c04 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80007b80:	0004851b          	sext.w	a0,s1
    neg = 0;
    80007b84:	00000593          	li	a1,0
    }

    i = 0;
    80007b88:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80007b8c:	0009079b          	sext.w	a5,s2
    80007b90:	0325773b          	remuw	a4,a0,s2
    80007b94:	00048613          	mv	a2,s1
    80007b98:	0014849b          	addiw	s1,s1,1
    80007b9c:	02071693          	slli	a3,a4,0x20
    80007ba0:	0206d693          	srli	a3,a3,0x20
    80007ba4:	00006717          	auipc	a4,0x6
    80007ba8:	3f470713          	addi	a4,a4,1012 # 8000df98 <digits>
    80007bac:	00d70733          	add	a4,a4,a3
    80007bb0:	00074683          	lbu	a3,0(a4)
    80007bb4:	fd040713          	addi	a4,s0,-48
    80007bb8:	00c70733          	add	a4,a4,a2
    80007bbc:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80007bc0:	0005071b          	sext.w	a4,a0
    80007bc4:	0325553b          	divuw	a0,a0,s2
    80007bc8:	fcf772e3          	bgeu	a4,a5,80007b8c <_Z8printIntiii+0x64>
    if(neg)
    80007bcc:	00058c63          	beqz	a1,80007be4 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80007bd0:	fd040793          	addi	a5,s0,-48
    80007bd4:	009784b3          	add	s1,a5,s1
    80007bd8:	02d00793          	li	a5,45
    80007bdc:	fef48823          	sb	a5,-16(s1)
    80007be0:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80007be4:	fff4849b          	addiw	s1,s1,-1
    80007be8:	0204c463          	bltz	s1,80007c10 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80007bec:	fd040793          	addi	a5,s0,-48
    80007bf0:	009787b3          	add	a5,a5,s1
    80007bf4:	ff07c503          	lbu	a0,-16(a5)
    80007bf8:	ffffa097          	auipc	ra,0xffffa
    80007bfc:	ef8080e7          	jalr	-264(ra) # 80001af0 <_Z4putcc>
    80007c00:	fe5ff06f          	j	80007be4 <_Z8printIntiii+0xbc>
        x = -xx;
    80007c04:	4090053b          	negw	a0,s1
        neg = 1;
    80007c08:	00100593          	li	a1,1
        x = -xx;
    80007c0c:	f7dff06f          	j	80007b88 <_Z8printIntiii+0x60>

    UNLOCK();
    80007c10:	00000613          	li	a2,0
    80007c14:	00100593          	li	a1,1
    80007c18:	00006517          	auipc	a0,0x6
    80007c1c:	52050513          	addi	a0,a0,1312 # 8000e138 <lockPrint>
    80007c20:	ffff9097          	auipc	ra,0xffff9
    80007c24:	4e0080e7          	jalr	1248(ra) # 80001100 <copy_and_swap>
    80007c28:	fe0514e3          	bnez	a0,80007c10 <_Z8printIntiii+0xe8>
    80007c2c:	03813083          	ld	ra,56(sp)
    80007c30:	03013403          	ld	s0,48(sp)
    80007c34:	02813483          	ld	s1,40(sp)
    80007c38:	02013903          	ld	s2,32(sp)
    80007c3c:	01813983          	ld	s3,24(sp)
    80007c40:	04010113          	addi	sp,sp,64
    80007c44:	00008067          	ret

0000000080007c48 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80007c48:	fd010113          	addi	sp,sp,-48
    80007c4c:	02113423          	sd	ra,40(sp)
    80007c50:	02813023          	sd	s0,32(sp)
    80007c54:	00913c23          	sd	s1,24(sp)
    80007c58:	01213823          	sd	s2,16(sp)
    80007c5c:	01313423          	sd	s3,8(sp)
    80007c60:	03010413          	addi	s0,sp,48
    80007c64:	00050993          	mv	s3,a0
    80007c68:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80007c6c:	00000913          	li	s2,0
    80007c70:	00c0006f          	j	80007c7c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007c74:	ffff9097          	auipc	ra,0xffff9
    80007c78:	6a4080e7          	jalr	1700(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80007c7c:	ffffa097          	auipc	ra,0xffffa
    80007c80:	e4c080e7          	jalr	-436(ra) # 80001ac8 <_Z4getcv>
    80007c84:	0005059b          	sext.w	a1,a0
    80007c88:	01b00793          	li	a5,27
    80007c8c:	02f58a63          	beq	a1,a5,80007cc0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80007c90:	0084b503          	ld	a0,8(s1)
    80007c94:	fffff097          	auipc	ra,0xfffff
    80007c98:	f24080e7          	jalr	-220(ra) # 80006bb8 <_ZN9BufferCPP3putEi>
        i++;
    80007c9c:	0019071b          	addiw	a4,s2,1
    80007ca0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007ca4:	0004a683          	lw	a3,0(s1)
    80007ca8:	0026979b          	slliw	a5,a3,0x2
    80007cac:	00d787bb          	addw	a5,a5,a3
    80007cb0:	0017979b          	slliw	a5,a5,0x1
    80007cb4:	02f767bb          	remw	a5,a4,a5
    80007cb8:	fc0792e3          	bnez	a5,80007c7c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80007cbc:	fb9ff06f          	j	80007c74 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80007cc0:	00100793          	li	a5,1
    80007cc4:	00006717          	auipc	a4,0x6
    80007cc8:	46f72e23          	sw	a5,1148(a4) # 8000e140 <_ZL9threadEnd>
    td->buffer->put('!');
    80007ccc:	0209b783          	ld	a5,32(s3)
    80007cd0:	02100593          	li	a1,33
    80007cd4:	0087b503          	ld	a0,8(a5)
    80007cd8:	fffff097          	auipc	ra,0xfffff
    80007cdc:	ee0080e7          	jalr	-288(ra) # 80006bb8 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80007ce0:	0104b503          	ld	a0,16(s1)
    80007ce4:	ffff9097          	auipc	ra,0xffff9
    80007ce8:	754080e7          	jalr	1876(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007cec:	02813083          	ld	ra,40(sp)
    80007cf0:	02013403          	ld	s0,32(sp)
    80007cf4:	01813483          	ld	s1,24(sp)
    80007cf8:	01013903          	ld	s2,16(sp)
    80007cfc:	00813983          	ld	s3,8(sp)
    80007d00:	03010113          	addi	sp,sp,48
    80007d04:	00008067          	ret

0000000080007d08 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80007d08:	fe010113          	addi	sp,sp,-32
    80007d0c:	00113c23          	sd	ra,24(sp)
    80007d10:	00813823          	sd	s0,16(sp)
    80007d14:	00913423          	sd	s1,8(sp)
    80007d18:	01213023          	sd	s2,0(sp)
    80007d1c:	02010413          	addi	s0,sp,32
    80007d20:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007d24:	00000913          	li	s2,0
    80007d28:	00c0006f          	j	80007d34 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007d2c:	ffff9097          	auipc	ra,0xffff9
    80007d30:	5ec080e7          	jalr	1516(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80007d34:	00006797          	auipc	a5,0x6
    80007d38:	40c7a783          	lw	a5,1036(a5) # 8000e140 <_ZL9threadEnd>
    80007d3c:	02079e63          	bnez	a5,80007d78 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80007d40:	0004a583          	lw	a1,0(s1)
    80007d44:	0305859b          	addiw	a1,a1,48
    80007d48:	0084b503          	ld	a0,8(s1)
    80007d4c:	fffff097          	auipc	ra,0xfffff
    80007d50:	e6c080e7          	jalr	-404(ra) # 80006bb8 <_ZN9BufferCPP3putEi>
        i++;
    80007d54:	0019071b          	addiw	a4,s2,1
    80007d58:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007d5c:	0004a683          	lw	a3,0(s1)
    80007d60:	0026979b          	slliw	a5,a3,0x2
    80007d64:	00d787bb          	addw	a5,a5,a3
    80007d68:	0017979b          	slliw	a5,a5,0x1
    80007d6c:	02f767bb          	remw	a5,a4,a5
    80007d70:	fc0792e3          	bnez	a5,80007d34 <_ZN12ProducerSync8producerEPv+0x2c>
    80007d74:	fb9ff06f          	j	80007d2c <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80007d78:	0104b503          	ld	a0,16(s1)
    80007d7c:	ffff9097          	auipc	ra,0xffff9
    80007d80:	6bc080e7          	jalr	1724(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007d84:	01813083          	ld	ra,24(sp)
    80007d88:	01013403          	ld	s0,16(sp)
    80007d8c:	00813483          	ld	s1,8(sp)
    80007d90:	00013903          	ld	s2,0(sp)
    80007d94:	02010113          	addi	sp,sp,32
    80007d98:	00008067          	ret

0000000080007d9c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80007d9c:	fd010113          	addi	sp,sp,-48
    80007da0:	02113423          	sd	ra,40(sp)
    80007da4:	02813023          	sd	s0,32(sp)
    80007da8:	00913c23          	sd	s1,24(sp)
    80007dac:	01213823          	sd	s2,16(sp)
    80007db0:	01313423          	sd	s3,8(sp)
    80007db4:	01413023          	sd	s4,0(sp)
    80007db8:	03010413          	addi	s0,sp,48
    80007dbc:	00050993          	mv	s3,a0
    80007dc0:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007dc4:	00000a13          	li	s4,0
    80007dc8:	01c0006f          	j	80007de4 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80007dcc:	ffff9097          	auipc	ra,0xffff9
    80007dd0:	54c080e7          	jalr	1356(ra) # 80001318 <_ZN6Thread8dispatchEv>
    80007dd4:	0500006f          	j	80007e24 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80007dd8:	00a00513          	li	a0,10
    80007ddc:	ffffa097          	auipc	ra,0xffffa
    80007de0:	d14080e7          	jalr	-748(ra) # 80001af0 <_Z4putcc>
    while (!threadEnd) {
    80007de4:	00006797          	auipc	a5,0x6
    80007de8:	35c7a783          	lw	a5,860(a5) # 8000e140 <_ZL9threadEnd>
    80007dec:	06079263          	bnez	a5,80007e50 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80007df0:	00893503          	ld	a0,8(s2)
    80007df4:	fffff097          	auipc	ra,0xfffff
    80007df8:	e54080e7          	jalr	-428(ra) # 80006c48 <_ZN9BufferCPP3getEv>
        i++;
    80007dfc:	001a049b          	addiw	s1,s4,1
    80007e00:	00048a1b          	sext.w	s4,s1
        putc(key);
    80007e04:	0ff57513          	andi	a0,a0,255
    80007e08:	ffffa097          	auipc	ra,0xffffa
    80007e0c:	ce8080e7          	jalr	-792(ra) # 80001af0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80007e10:	00092703          	lw	a4,0(s2)
    80007e14:	0027179b          	slliw	a5,a4,0x2
    80007e18:	00e787bb          	addw	a5,a5,a4
    80007e1c:	02f4e7bb          	remw	a5,s1,a5
    80007e20:	fa0786e3          	beqz	a5,80007dcc <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80007e24:	05000793          	li	a5,80
    80007e28:	02f4e4bb          	remw	s1,s1,a5
    80007e2c:	fa049ce3          	bnez	s1,80007de4 <_ZN12ConsumerSync8consumerEPv+0x48>
    80007e30:	fa9ff06f          	j	80007dd8 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80007e34:	0209b783          	ld	a5,32(s3)
    80007e38:	0087b503          	ld	a0,8(a5)
    80007e3c:	fffff097          	auipc	ra,0xfffff
    80007e40:	e0c080e7          	jalr	-500(ra) # 80006c48 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80007e44:	0ff57513          	andi	a0,a0,255
    80007e48:	ffff9097          	auipc	ra,0xffff9
    80007e4c:	68c080e7          	jalr	1676(ra) # 800014d4 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80007e50:	0209b783          	ld	a5,32(s3)
    80007e54:	0087b503          	ld	a0,8(a5)
    80007e58:	fffff097          	auipc	ra,0xfffff
    80007e5c:	e7c080e7          	jalr	-388(ra) # 80006cd4 <_ZN9BufferCPP6getCntEv>
    80007e60:	fca04ae3          	bgtz	a0,80007e34 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80007e64:	01093503          	ld	a0,16(s2)
    80007e68:	ffff9097          	auipc	ra,0xffff9
    80007e6c:	5d0080e7          	jalr	1488(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007e70:	02813083          	ld	ra,40(sp)
    80007e74:	02013403          	ld	s0,32(sp)
    80007e78:	01813483          	ld	s1,24(sp)
    80007e7c:	01013903          	ld	s2,16(sp)
    80007e80:	00813983          	ld	s3,8(sp)
    80007e84:	00013a03          	ld	s4,0(sp)
    80007e88:	03010113          	addi	sp,sp,48
    80007e8c:	00008067          	ret

0000000080007e90 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80007e90:	f8010113          	addi	sp,sp,-128
    80007e94:	06113c23          	sd	ra,120(sp)
    80007e98:	06813823          	sd	s0,112(sp)
    80007e9c:	06913423          	sd	s1,104(sp)
    80007ea0:	07213023          	sd	s2,96(sp)
    80007ea4:	05313c23          	sd	s3,88(sp)
    80007ea8:	05413823          	sd	s4,80(sp)
    80007eac:	05513423          	sd	s5,72(sp)
    80007eb0:	05613023          	sd	s6,64(sp)
    80007eb4:	03713c23          	sd	s7,56(sp)
    80007eb8:	03813823          	sd	s8,48(sp)
    80007ebc:	03913423          	sd	s9,40(sp)
    80007ec0:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80007ec4:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80007ec8:	00003517          	auipc	a0,0x3
    80007ecc:	58050513          	addi	a0,a0,1408 # 8000b448 <CONSOLE_STATUS+0x438>
    80007ed0:	00000097          	auipc	ra,0x0
    80007ed4:	aa8080e7          	jalr	-1368(ra) # 80007978 <_Z11printStringPKc>
    getString(input, 30);
    80007ed8:	01e00593          	li	a1,30
    80007edc:	f8040493          	addi	s1,s0,-128
    80007ee0:	00048513          	mv	a0,s1
    80007ee4:	00000097          	auipc	ra,0x0
    80007ee8:	b1c080e7          	jalr	-1252(ra) # 80007a00 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80007eec:	00048513          	mv	a0,s1
    80007ef0:	00000097          	auipc	ra,0x0
    80007ef4:	be8080e7          	jalr	-1048(ra) # 80007ad8 <_Z11stringToIntPKc>
    80007ef8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80007efc:	00003517          	auipc	a0,0x3
    80007f00:	56c50513          	addi	a0,a0,1388 # 8000b468 <CONSOLE_STATUS+0x458>
    80007f04:	00000097          	auipc	ra,0x0
    80007f08:	a74080e7          	jalr	-1420(ra) # 80007978 <_Z11printStringPKc>
    getString(input, 30);
    80007f0c:	01e00593          	li	a1,30
    80007f10:	00048513          	mv	a0,s1
    80007f14:	00000097          	auipc	ra,0x0
    80007f18:	aec080e7          	jalr	-1300(ra) # 80007a00 <_Z9getStringPci>
    n = stringToInt(input);
    80007f1c:	00048513          	mv	a0,s1
    80007f20:	00000097          	auipc	ra,0x0
    80007f24:	bb8080e7          	jalr	-1096(ra) # 80007ad8 <_Z11stringToIntPKc>
    80007f28:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80007f2c:	00003517          	auipc	a0,0x3
    80007f30:	55c50513          	addi	a0,a0,1372 # 8000b488 <CONSOLE_STATUS+0x478>
    80007f34:	00000097          	auipc	ra,0x0
    80007f38:	a44080e7          	jalr	-1468(ra) # 80007978 <_Z11printStringPKc>
    80007f3c:	00000613          	li	a2,0
    80007f40:	00a00593          	li	a1,10
    80007f44:	00090513          	mv	a0,s2
    80007f48:	00000097          	auipc	ra,0x0
    80007f4c:	be0080e7          	jalr	-1056(ra) # 80007b28 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80007f50:	00003517          	auipc	a0,0x3
    80007f54:	55050513          	addi	a0,a0,1360 # 8000b4a0 <CONSOLE_STATUS+0x490>
    80007f58:	00000097          	auipc	ra,0x0
    80007f5c:	a20080e7          	jalr	-1504(ra) # 80007978 <_Z11printStringPKc>
    80007f60:	00000613          	li	a2,0
    80007f64:	00a00593          	li	a1,10
    80007f68:	00048513          	mv	a0,s1
    80007f6c:	00000097          	auipc	ra,0x0
    80007f70:	bbc080e7          	jalr	-1092(ra) # 80007b28 <_Z8printIntiii>
    printString(".\n");
    80007f74:	00003517          	auipc	a0,0x3
    80007f78:	54450513          	addi	a0,a0,1348 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    80007f7c:	00000097          	auipc	ra,0x0
    80007f80:	9fc080e7          	jalr	-1540(ra) # 80007978 <_Z11printStringPKc>
    if(threadNum > n) {
    80007f84:	0324c463          	blt	s1,s2,80007fac <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80007f88:	03205c63          	blez	s2,80007fc0 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80007f8c:	03800513          	li	a0,56
    80007f90:	ffff9097          	auipc	ra,0xffff9
    80007f94:	22c080e7          	jalr	556(ra) # 800011bc <_Znwm>
    80007f98:	00050a93          	mv	s5,a0
    80007f9c:	00048593          	mv	a1,s1
    80007fa0:	fffff097          	auipc	ra,0xfffff
    80007fa4:	ac4080e7          	jalr	-1340(ra) # 80006a64 <_ZN9BufferCPPC1Ei>
    80007fa8:	0300006f          	j	80007fd8 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80007fac:	00003517          	auipc	a0,0x3
    80007fb0:	51450513          	addi	a0,a0,1300 # 8000b4c0 <CONSOLE_STATUS+0x4b0>
    80007fb4:	00000097          	auipc	ra,0x0
    80007fb8:	9c4080e7          	jalr	-1596(ra) # 80007978 <_Z11printStringPKc>
        return;
    80007fbc:	0140006f          	j	80007fd0 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80007fc0:	00003517          	auipc	a0,0x3
    80007fc4:	54050513          	addi	a0,a0,1344 # 8000b500 <CONSOLE_STATUS+0x4f0>
    80007fc8:	00000097          	auipc	ra,0x0
    80007fcc:	9b0080e7          	jalr	-1616(ra) # 80007978 <_Z11printStringPKc>
        return;
    80007fd0:	000b8113          	mv	sp,s7
    80007fd4:	2380006f          	j	8000820c <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80007fd8:	01000513          	li	a0,16
    80007fdc:	ffff9097          	auipc	ra,0xffff9
    80007fe0:	1e0080e7          	jalr	480(ra) # 800011bc <_Znwm>
    80007fe4:	00050493          	mv	s1,a0
    80007fe8:	00000593          	li	a1,0
    80007fec:	ffff9097          	auipc	ra,0xffff9
    80007ff0:	3e8080e7          	jalr	1000(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80007ff4:	00006797          	auipc	a5,0x6
    80007ff8:	1497ba23          	sd	s1,340(a5) # 8000e148 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80007ffc:	00391793          	slli	a5,s2,0x3
    80008000:	00f78793          	addi	a5,a5,15
    80008004:	ff07f793          	andi	a5,a5,-16
    80008008:	40f10133          	sub	sp,sp,a5
    8000800c:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80008010:	0019071b          	addiw	a4,s2,1
    80008014:	00171793          	slli	a5,a4,0x1
    80008018:	00e787b3          	add	a5,a5,a4
    8000801c:	00379793          	slli	a5,a5,0x3
    80008020:	00f78793          	addi	a5,a5,15
    80008024:	ff07f793          	andi	a5,a5,-16
    80008028:	40f10133          	sub	sp,sp,a5
    8000802c:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80008030:	00191c13          	slli	s8,s2,0x1
    80008034:	012c07b3          	add	a5,s8,s2
    80008038:	00379793          	slli	a5,a5,0x3
    8000803c:	00fa07b3          	add	a5,s4,a5
    80008040:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80008044:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80008048:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    8000804c:	02800513          	li	a0,40
    80008050:	ffff9097          	auipc	ra,0xffff9
    80008054:	16c080e7          	jalr	364(ra) # 800011bc <_Znwm>
    80008058:	00050b13          	mv	s6,a0
    8000805c:	012c0c33          	add	s8,s8,s2
    80008060:	003c1c13          	slli	s8,s8,0x3
    80008064:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80008068:	ffff9097          	auipc	ra,0xffff9
    8000806c:	338080e7          	jalr	824(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80008070:	00006797          	auipc	a5,0x6
    80008074:	fa078793          	addi	a5,a5,-96 # 8000e010 <_ZTV12ConsumerSync+0x10>
    80008078:	00fb3023          	sd	a5,0(s6)
    8000807c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80008080:	000b0513          	mv	a0,s6
    80008084:	ffff9097          	auipc	ra,0xffff9
    80008088:	234080e7          	jalr	564(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000808c:	00000493          	li	s1,0
    80008090:	0380006f          	j	800080c8 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80008094:	00006797          	auipc	a5,0x6
    80008098:	f5478793          	addi	a5,a5,-172 # 8000dfe8 <_ZTV12ProducerSync+0x10>
    8000809c:	00fcb023          	sd	a5,0(s9)
    800080a0:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800080a4:	00349793          	slli	a5,s1,0x3
    800080a8:	00f987b3          	add	a5,s3,a5
    800080ac:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800080b0:	00349793          	slli	a5,s1,0x3
    800080b4:	00f987b3          	add	a5,s3,a5
    800080b8:	0007b503          	ld	a0,0(a5)
    800080bc:	ffff9097          	auipc	ra,0xffff9
    800080c0:	1fc080e7          	jalr	508(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800080c4:	0014849b          	addiw	s1,s1,1
    800080c8:	0b24d063          	bge	s1,s2,80008168 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800080cc:	00149793          	slli	a5,s1,0x1
    800080d0:	009787b3          	add	a5,a5,s1
    800080d4:	00379793          	slli	a5,a5,0x3
    800080d8:	00fa07b3          	add	a5,s4,a5
    800080dc:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800080e0:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800080e4:	00006717          	auipc	a4,0x6
    800080e8:	06473703          	ld	a4,100(a4) # 8000e148 <_ZL10waitForAll>
    800080ec:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800080f0:	02905863          	blez	s1,80008120 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800080f4:	02800513          	li	a0,40
    800080f8:	ffff9097          	auipc	ra,0xffff9
    800080fc:	0c4080e7          	jalr	196(ra) # 800011bc <_Znwm>
    80008100:	00050c93          	mv	s9,a0
    80008104:	00149c13          	slli	s8,s1,0x1
    80008108:	009c0c33          	add	s8,s8,s1
    8000810c:	003c1c13          	slli	s8,s8,0x3
    80008110:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80008114:	ffff9097          	auipc	ra,0xffff9
    80008118:	28c080e7          	jalr	652(ra) # 800013a0 <_ZN6ThreadC1Ev>
    8000811c:	f79ff06f          	j	80008094 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80008120:	02800513          	li	a0,40
    80008124:	ffff9097          	auipc	ra,0xffff9
    80008128:	098080e7          	jalr	152(ra) # 800011bc <_Znwm>
    8000812c:	00050c93          	mv	s9,a0
    80008130:	00149c13          	slli	s8,s1,0x1
    80008134:	009c0c33          	add	s8,s8,s1
    80008138:	003c1c13          	slli	s8,s8,0x3
    8000813c:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80008140:	ffff9097          	auipc	ra,0xffff9
    80008144:	260080e7          	jalr	608(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80008148:	00006797          	auipc	a5,0x6
    8000814c:	e7878793          	addi	a5,a5,-392 # 8000dfc0 <_ZTV16ProducerKeyboard+0x10>
    80008150:	00fcb023          	sd	a5,0(s9)
    80008154:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80008158:	00349793          	slli	a5,s1,0x3
    8000815c:	00f987b3          	add	a5,s3,a5
    80008160:	0197b023          	sd	s9,0(a5)
    80008164:	f4dff06f          	j	800080b0 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80008168:	ffff9097          	auipc	ra,0xffff9
    8000816c:	1b0080e7          	jalr	432(ra) # 80001318 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80008170:	00000493          	li	s1,0
    80008174:	00994e63          	blt	s2,s1,80008190 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80008178:	00006517          	auipc	a0,0x6
    8000817c:	fd053503          	ld	a0,-48(a0) # 8000e148 <_ZL10waitForAll>
    80008180:	ffff9097          	auipc	ra,0xffff9
    80008184:	28c080e7          	jalr	652(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80008188:	0014849b          	addiw	s1,s1,1
    8000818c:	fe9ff06f          	j	80008174 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80008190:	00000493          	li	s1,0
    80008194:	0080006f          	j	8000819c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80008198:	0014849b          	addiw	s1,s1,1
    8000819c:	0324d263          	bge	s1,s2,800081c0 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800081a0:	00349793          	slli	a5,s1,0x3
    800081a4:	00f987b3          	add	a5,s3,a5
    800081a8:	0007b503          	ld	a0,0(a5)
    800081ac:	fe0506e3          	beqz	a0,80008198 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800081b0:	00053783          	ld	a5,0(a0)
    800081b4:	0087b783          	ld	a5,8(a5)
    800081b8:	000780e7          	jalr	a5
    800081bc:	fddff06f          	j	80008198 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800081c0:	000b0a63          	beqz	s6,800081d4 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800081c4:	000b3783          	ld	a5,0(s6)
    800081c8:	0087b783          	ld	a5,8(a5)
    800081cc:	000b0513          	mv	a0,s6
    800081d0:	000780e7          	jalr	a5
    delete waitForAll;
    800081d4:	00006517          	auipc	a0,0x6
    800081d8:	f7453503          	ld	a0,-140(a0) # 8000e148 <_ZL10waitForAll>
    800081dc:	00050863          	beqz	a0,800081ec <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800081e0:	00053783          	ld	a5,0(a0)
    800081e4:	0087b783          	ld	a5,8(a5)
    800081e8:	000780e7          	jalr	a5
    delete buffer;
    800081ec:	000a8e63          	beqz	s5,80008208 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800081f0:	000a8513          	mv	a0,s5
    800081f4:	fffff097          	auipc	ra,0xfffff
    800081f8:	b68080e7          	jalr	-1176(ra) # 80006d5c <_ZN9BufferCPPD1Ev>
    800081fc:	000a8513          	mv	a0,s5
    80008200:	ffff9097          	auipc	ra,0xffff9
    80008204:	fe4080e7          	jalr	-28(ra) # 800011e4 <_ZdlPv>
    80008208:	000b8113          	mv	sp,s7

}
    8000820c:	f8040113          	addi	sp,s0,-128
    80008210:	07813083          	ld	ra,120(sp)
    80008214:	07013403          	ld	s0,112(sp)
    80008218:	06813483          	ld	s1,104(sp)
    8000821c:	06013903          	ld	s2,96(sp)
    80008220:	05813983          	ld	s3,88(sp)
    80008224:	05013a03          	ld	s4,80(sp)
    80008228:	04813a83          	ld	s5,72(sp)
    8000822c:	04013b03          	ld	s6,64(sp)
    80008230:	03813b83          	ld	s7,56(sp)
    80008234:	03013c03          	ld	s8,48(sp)
    80008238:	02813c83          	ld	s9,40(sp)
    8000823c:	08010113          	addi	sp,sp,128
    80008240:	00008067          	ret
    80008244:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80008248:	000a8513          	mv	a0,s5
    8000824c:	ffff9097          	auipc	ra,0xffff9
    80008250:	f98080e7          	jalr	-104(ra) # 800011e4 <_ZdlPv>
    80008254:	00048513          	mv	a0,s1
    80008258:	00007097          	auipc	ra,0x7
    8000825c:	fc0080e7          	jalr	-64(ra) # 8000f218 <_Unwind_Resume>
    80008260:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80008264:	00048513          	mv	a0,s1
    80008268:	ffff9097          	auipc	ra,0xffff9
    8000826c:	f7c080e7          	jalr	-132(ra) # 800011e4 <_ZdlPv>
    80008270:	00090513          	mv	a0,s2
    80008274:	00007097          	auipc	ra,0x7
    80008278:	fa4080e7          	jalr	-92(ra) # 8000f218 <_Unwind_Resume>
    8000827c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80008280:	000b0513          	mv	a0,s6
    80008284:	ffff9097          	auipc	ra,0xffff9
    80008288:	f60080e7          	jalr	-160(ra) # 800011e4 <_ZdlPv>
    8000828c:	00048513          	mv	a0,s1
    80008290:	00007097          	auipc	ra,0x7
    80008294:	f88080e7          	jalr	-120(ra) # 8000f218 <_Unwind_Resume>
    80008298:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    8000829c:	000c8513          	mv	a0,s9
    800082a0:	ffff9097          	auipc	ra,0xffff9
    800082a4:	f44080e7          	jalr	-188(ra) # 800011e4 <_ZdlPv>
    800082a8:	00048513          	mv	a0,s1
    800082ac:	00007097          	auipc	ra,0x7
    800082b0:	f6c080e7          	jalr	-148(ra) # 8000f218 <_Unwind_Resume>
    800082b4:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800082b8:	000c8513          	mv	a0,s9
    800082bc:	ffff9097          	auipc	ra,0xffff9
    800082c0:	f28080e7          	jalr	-216(ra) # 800011e4 <_ZdlPv>
    800082c4:	00048513          	mv	a0,s1
    800082c8:	00007097          	auipc	ra,0x7
    800082cc:	f50080e7          	jalr	-176(ra) # 8000f218 <_Unwind_Resume>

00000000800082d0 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800082d0:	ff010113          	addi	sp,sp,-16
    800082d4:	00113423          	sd	ra,8(sp)
    800082d8:	00813023          	sd	s0,0(sp)
    800082dc:	01010413          	addi	s0,sp,16
    800082e0:	00006797          	auipc	a5,0x6
    800082e4:	d3078793          	addi	a5,a5,-720 # 8000e010 <_ZTV12ConsumerSync+0x10>
    800082e8:	00f53023          	sd	a5,0(a0)
    800082ec:	ffff9097          	auipc	ra,0xffff9
    800082f0:	e60080e7          	jalr	-416(ra) # 8000114c <_ZN6ThreadD1Ev>
    800082f4:	00813083          	ld	ra,8(sp)
    800082f8:	00013403          	ld	s0,0(sp)
    800082fc:	01010113          	addi	sp,sp,16
    80008300:	00008067          	ret

0000000080008304 <_ZN12ConsumerSyncD0Ev>:
    80008304:	fe010113          	addi	sp,sp,-32
    80008308:	00113c23          	sd	ra,24(sp)
    8000830c:	00813823          	sd	s0,16(sp)
    80008310:	00913423          	sd	s1,8(sp)
    80008314:	02010413          	addi	s0,sp,32
    80008318:	00050493          	mv	s1,a0
    8000831c:	00006797          	auipc	a5,0x6
    80008320:	cf478793          	addi	a5,a5,-780 # 8000e010 <_ZTV12ConsumerSync+0x10>
    80008324:	00f53023          	sd	a5,0(a0)
    80008328:	ffff9097          	auipc	ra,0xffff9
    8000832c:	e24080e7          	jalr	-476(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008330:	00048513          	mv	a0,s1
    80008334:	ffff9097          	auipc	ra,0xffff9
    80008338:	eb0080e7          	jalr	-336(ra) # 800011e4 <_ZdlPv>
    8000833c:	01813083          	ld	ra,24(sp)
    80008340:	01013403          	ld	s0,16(sp)
    80008344:	00813483          	ld	s1,8(sp)
    80008348:	02010113          	addi	sp,sp,32
    8000834c:	00008067          	ret

0000000080008350 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80008350:	ff010113          	addi	sp,sp,-16
    80008354:	00113423          	sd	ra,8(sp)
    80008358:	00813023          	sd	s0,0(sp)
    8000835c:	01010413          	addi	s0,sp,16
    80008360:	00006797          	auipc	a5,0x6
    80008364:	c8878793          	addi	a5,a5,-888 # 8000dfe8 <_ZTV12ProducerSync+0x10>
    80008368:	00f53023          	sd	a5,0(a0)
    8000836c:	ffff9097          	auipc	ra,0xffff9
    80008370:	de0080e7          	jalr	-544(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008374:	00813083          	ld	ra,8(sp)
    80008378:	00013403          	ld	s0,0(sp)
    8000837c:	01010113          	addi	sp,sp,16
    80008380:	00008067          	ret

0000000080008384 <_ZN12ProducerSyncD0Ev>:
    80008384:	fe010113          	addi	sp,sp,-32
    80008388:	00113c23          	sd	ra,24(sp)
    8000838c:	00813823          	sd	s0,16(sp)
    80008390:	00913423          	sd	s1,8(sp)
    80008394:	02010413          	addi	s0,sp,32
    80008398:	00050493          	mv	s1,a0
    8000839c:	00006797          	auipc	a5,0x6
    800083a0:	c4c78793          	addi	a5,a5,-948 # 8000dfe8 <_ZTV12ProducerSync+0x10>
    800083a4:	00f53023          	sd	a5,0(a0)
    800083a8:	ffff9097          	auipc	ra,0xffff9
    800083ac:	da4080e7          	jalr	-604(ra) # 8000114c <_ZN6ThreadD1Ev>
    800083b0:	00048513          	mv	a0,s1
    800083b4:	ffff9097          	auipc	ra,0xffff9
    800083b8:	e30080e7          	jalr	-464(ra) # 800011e4 <_ZdlPv>
    800083bc:	01813083          	ld	ra,24(sp)
    800083c0:	01013403          	ld	s0,16(sp)
    800083c4:	00813483          	ld	s1,8(sp)
    800083c8:	02010113          	addi	sp,sp,32
    800083cc:	00008067          	ret

00000000800083d0 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800083d0:	ff010113          	addi	sp,sp,-16
    800083d4:	00113423          	sd	ra,8(sp)
    800083d8:	00813023          	sd	s0,0(sp)
    800083dc:	01010413          	addi	s0,sp,16
    800083e0:	00006797          	auipc	a5,0x6
    800083e4:	be078793          	addi	a5,a5,-1056 # 8000dfc0 <_ZTV16ProducerKeyboard+0x10>
    800083e8:	00f53023          	sd	a5,0(a0)
    800083ec:	ffff9097          	auipc	ra,0xffff9
    800083f0:	d60080e7          	jalr	-672(ra) # 8000114c <_ZN6ThreadD1Ev>
    800083f4:	00813083          	ld	ra,8(sp)
    800083f8:	00013403          	ld	s0,0(sp)
    800083fc:	01010113          	addi	sp,sp,16
    80008400:	00008067          	ret

0000000080008404 <_ZN16ProducerKeyboardD0Ev>:
    80008404:	fe010113          	addi	sp,sp,-32
    80008408:	00113c23          	sd	ra,24(sp)
    8000840c:	00813823          	sd	s0,16(sp)
    80008410:	00913423          	sd	s1,8(sp)
    80008414:	02010413          	addi	s0,sp,32
    80008418:	00050493          	mv	s1,a0
    8000841c:	00006797          	auipc	a5,0x6
    80008420:	ba478793          	addi	a5,a5,-1116 # 8000dfc0 <_ZTV16ProducerKeyboard+0x10>
    80008424:	00f53023          	sd	a5,0(a0)
    80008428:	ffff9097          	auipc	ra,0xffff9
    8000842c:	d24080e7          	jalr	-732(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008430:	00048513          	mv	a0,s1
    80008434:	ffff9097          	auipc	ra,0xffff9
    80008438:	db0080e7          	jalr	-592(ra) # 800011e4 <_ZdlPv>
    8000843c:	01813083          	ld	ra,24(sp)
    80008440:	01013403          	ld	s0,16(sp)
    80008444:	00813483          	ld	s1,8(sp)
    80008448:	02010113          	addi	sp,sp,32
    8000844c:	00008067          	ret

0000000080008450 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80008450:	ff010113          	addi	sp,sp,-16
    80008454:	00113423          	sd	ra,8(sp)
    80008458:	00813023          	sd	s0,0(sp)
    8000845c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80008460:	02053583          	ld	a1,32(a0)
    80008464:	fffff097          	auipc	ra,0xfffff
    80008468:	7e4080e7          	jalr	2020(ra) # 80007c48 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    8000846c:	00813083          	ld	ra,8(sp)
    80008470:	00013403          	ld	s0,0(sp)
    80008474:	01010113          	addi	sp,sp,16
    80008478:	00008067          	ret

000000008000847c <_ZN12ProducerSync3runEv>:
    void run() override {
    8000847c:	ff010113          	addi	sp,sp,-16
    80008480:	00113423          	sd	ra,8(sp)
    80008484:	00813023          	sd	s0,0(sp)
    80008488:	01010413          	addi	s0,sp,16
        producer(td);
    8000848c:	02053583          	ld	a1,32(a0)
    80008490:	00000097          	auipc	ra,0x0
    80008494:	878080e7          	jalr	-1928(ra) # 80007d08 <_ZN12ProducerSync8producerEPv>
    }
    80008498:	00813083          	ld	ra,8(sp)
    8000849c:	00013403          	ld	s0,0(sp)
    800084a0:	01010113          	addi	sp,sp,16
    800084a4:	00008067          	ret

00000000800084a8 <_ZN12ConsumerSync3runEv>:
    void run() override {
    800084a8:	ff010113          	addi	sp,sp,-16
    800084ac:	00113423          	sd	ra,8(sp)
    800084b0:	00813023          	sd	s0,0(sp)
    800084b4:	01010413          	addi	s0,sp,16
        consumer(td);
    800084b8:	02053583          	ld	a1,32(a0)
    800084bc:	00000097          	auipc	ra,0x0
    800084c0:	8e0080e7          	jalr	-1824(ra) # 80007d9c <_ZN12ConsumerSync8consumerEPv>
    }
    800084c4:	00813083          	ld	ra,8(sp)
    800084c8:	00013403          	ld	s0,0(sp)
    800084cc:	01010113          	addi	sp,sp,16
    800084d0:	00008067          	ret

00000000800084d4 <start>:
    800084d4:	ff010113          	addi	sp,sp,-16
    800084d8:	00813423          	sd	s0,8(sp)
    800084dc:	01010413          	addi	s0,sp,16
    800084e0:	300027f3          	csrr	a5,mstatus
    800084e4:	ffffe737          	lui	a4,0xffffe
    800084e8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffef44f>
    800084ec:	00e7f7b3          	and	a5,a5,a4
    800084f0:	00001737          	lui	a4,0x1
    800084f4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800084f8:	00e7e7b3          	or	a5,a5,a4
    800084fc:	30079073          	csrw	mstatus,a5
    80008500:	00000797          	auipc	a5,0x0
    80008504:	16078793          	addi	a5,a5,352 # 80008660 <system_main>
    80008508:	34179073          	csrw	mepc,a5
    8000850c:	00000793          	li	a5,0
    80008510:	18079073          	csrw	satp,a5
    80008514:	000107b7          	lui	a5,0x10
    80008518:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000851c:	30279073          	csrw	medeleg,a5
    80008520:	30379073          	csrw	mideleg,a5
    80008524:	104027f3          	csrr	a5,sie
    80008528:	2227e793          	ori	a5,a5,546
    8000852c:	10479073          	csrw	sie,a5
    80008530:	fff00793          	li	a5,-1
    80008534:	00a7d793          	srli	a5,a5,0xa
    80008538:	3b079073          	csrw	pmpaddr0,a5
    8000853c:	00f00793          	li	a5,15
    80008540:	3a079073          	csrw	pmpcfg0,a5
    80008544:	f14027f3          	csrr	a5,mhartid
    80008548:	0200c737          	lui	a4,0x200c
    8000854c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80008550:	0007869b          	sext.w	a3,a5
    80008554:	00269713          	slli	a4,a3,0x2
    80008558:	000f4637          	lui	a2,0xf4
    8000855c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80008560:	00d70733          	add	a4,a4,a3
    80008564:	0037979b          	slliw	a5,a5,0x3
    80008568:	020046b7          	lui	a3,0x2004
    8000856c:	00d787b3          	add	a5,a5,a3
    80008570:	00c585b3          	add	a1,a1,a2
    80008574:	00371693          	slli	a3,a4,0x3
    80008578:	00006717          	auipc	a4,0x6
    8000857c:	bd870713          	addi	a4,a4,-1064 # 8000e150 <timer_scratch>
    80008580:	00b7b023          	sd	a1,0(a5)
    80008584:	00d70733          	add	a4,a4,a3
    80008588:	00f73c23          	sd	a5,24(a4)
    8000858c:	02c73023          	sd	a2,32(a4)
    80008590:	34071073          	csrw	mscratch,a4
    80008594:	00000797          	auipc	a5,0x0
    80008598:	6ec78793          	addi	a5,a5,1772 # 80008c80 <timervec>
    8000859c:	30579073          	csrw	mtvec,a5
    800085a0:	300027f3          	csrr	a5,mstatus
    800085a4:	0087e793          	ori	a5,a5,8
    800085a8:	30079073          	csrw	mstatus,a5
    800085ac:	304027f3          	csrr	a5,mie
    800085b0:	0807e793          	ori	a5,a5,128
    800085b4:	30479073          	csrw	mie,a5
    800085b8:	f14027f3          	csrr	a5,mhartid
    800085bc:	0007879b          	sext.w	a5,a5
    800085c0:	00078213          	mv	tp,a5
    800085c4:	30200073          	mret
    800085c8:	00813403          	ld	s0,8(sp)
    800085cc:	01010113          	addi	sp,sp,16
    800085d0:	00008067          	ret

00000000800085d4 <timerinit>:
    800085d4:	ff010113          	addi	sp,sp,-16
    800085d8:	00813423          	sd	s0,8(sp)
    800085dc:	01010413          	addi	s0,sp,16
    800085e0:	f14027f3          	csrr	a5,mhartid
    800085e4:	0200c737          	lui	a4,0x200c
    800085e8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800085ec:	0007869b          	sext.w	a3,a5
    800085f0:	00269713          	slli	a4,a3,0x2
    800085f4:	000f4637          	lui	a2,0xf4
    800085f8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800085fc:	00d70733          	add	a4,a4,a3
    80008600:	0037979b          	slliw	a5,a5,0x3
    80008604:	020046b7          	lui	a3,0x2004
    80008608:	00d787b3          	add	a5,a5,a3
    8000860c:	00c585b3          	add	a1,a1,a2
    80008610:	00371693          	slli	a3,a4,0x3
    80008614:	00006717          	auipc	a4,0x6
    80008618:	b3c70713          	addi	a4,a4,-1220 # 8000e150 <timer_scratch>
    8000861c:	00b7b023          	sd	a1,0(a5)
    80008620:	00d70733          	add	a4,a4,a3
    80008624:	00f73c23          	sd	a5,24(a4)
    80008628:	02c73023          	sd	a2,32(a4)
    8000862c:	34071073          	csrw	mscratch,a4
    80008630:	00000797          	auipc	a5,0x0
    80008634:	65078793          	addi	a5,a5,1616 # 80008c80 <timervec>
    80008638:	30579073          	csrw	mtvec,a5
    8000863c:	300027f3          	csrr	a5,mstatus
    80008640:	0087e793          	ori	a5,a5,8
    80008644:	30079073          	csrw	mstatus,a5
    80008648:	304027f3          	csrr	a5,mie
    8000864c:	0807e793          	ori	a5,a5,128
    80008650:	30479073          	csrw	mie,a5
    80008654:	00813403          	ld	s0,8(sp)
    80008658:	01010113          	addi	sp,sp,16
    8000865c:	00008067          	ret

0000000080008660 <system_main>:
    80008660:	fe010113          	addi	sp,sp,-32
    80008664:	00813823          	sd	s0,16(sp)
    80008668:	00913423          	sd	s1,8(sp)
    8000866c:	00113c23          	sd	ra,24(sp)
    80008670:	02010413          	addi	s0,sp,32
    80008674:	00000097          	auipc	ra,0x0
    80008678:	0c4080e7          	jalr	196(ra) # 80008738 <cpuid>
    8000867c:	00006497          	auipc	s1,0x6
    80008680:	a1448493          	addi	s1,s1,-1516 # 8000e090 <started>
    80008684:	02050263          	beqz	a0,800086a8 <system_main+0x48>
    80008688:	0004a783          	lw	a5,0(s1)
    8000868c:	0007879b          	sext.w	a5,a5
    80008690:	fe078ce3          	beqz	a5,80008688 <system_main+0x28>
    80008694:	0ff0000f          	fence
    80008698:	00003517          	auipc	a0,0x3
    8000869c:	2e050513          	addi	a0,a0,736 # 8000b978 <CONSOLE_STATUS+0x968>
    800086a0:	00001097          	auipc	ra,0x1
    800086a4:	a7c080e7          	jalr	-1412(ra) # 8000911c <panic>
    800086a8:	00001097          	auipc	ra,0x1
    800086ac:	9d0080e7          	jalr	-1584(ra) # 80009078 <consoleinit>
    800086b0:	00001097          	auipc	ra,0x1
    800086b4:	15c080e7          	jalr	348(ra) # 8000980c <printfinit>
    800086b8:	00003517          	auipc	a0,0x3
    800086bc:	14050513          	addi	a0,a0,320 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800086c0:	00001097          	auipc	ra,0x1
    800086c4:	ab8080e7          	jalr	-1352(ra) # 80009178 <__printf>
    800086c8:	00003517          	auipc	a0,0x3
    800086cc:	28050513          	addi	a0,a0,640 # 8000b948 <CONSOLE_STATUS+0x938>
    800086d0:	00001097          	auipc	ra,0x1
    800086d4:	aa8080e7          	jalr	-1368(ra) # 80009178 <__printf>
    800086d8:	00003517          	auipc	a0,0x3
    800086dc:	12050513          	addi	a0,a0,288 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800086e0:	00001097          	auipc	ra,0x1
    800086e4:	a98080e7          	jalr	-1384(ra) # 80009178 <__printf>
    800086e8:	00001097          	auipc	ra,0x1
    800086ec:	4b0080e7          	jalr	1200(ra) # 80009b98 <kinit>
    800086f0:	00000097          	auipc	ra,0x0
    800086f4:	148080e7          	jalr	328(ra) # 80008838 <trapinit>
    800086f8:	00000097          	auipc	ra,0x0
    800086fc:	16c080e7          	jalr	364(ra) # 80008864 <trapinithart>
    80008700:	00000097          	auipc	ra,0x0
    80008704:	5c0080e7          	jalr	1472(ra) # 80008cc0 <plicinit>
    80008708:	00000097          	auipc	ra,0x0
    8000870c:	5e0080e7          	jalr	1504(ra) # 80008ce8 <plicinithart>
    80008710:	00000097          	auipc	ra,0x0
    80008714:	078080e7          	jalr	120(ra) # 80008788 <userinit>
    80008718:	0ff0000f          	fence
    8000871c:	00100793          	li	a5,1
    80008720:	00003517          	auipc	a0,0x3
    80008724:	24050513          	addi	a0,a0,576 # 8000b960 <CONSOLE_STATUS+0x950>
    80008728:	00f4a023          	sw	a5,0(s1)
    8000872c:	00001097          	auipc	ra,0x1
    80008730:	a4c080e7          	jalr	-1460(ra) # 80009178 <__printf>
    80008734:	0000006f          	j	80008734 <system_main+0xd4>

0000000080008738 <cpuid>:
    80008738:	ff010113          	addi	sp,sp,-16
    8000873c:	00813423          	sd	s0,8(sp)
    80008740:	01010413          	addi	s0,sp,16
    80008744:	00020513          	mv	a0,tp
    80008748:	00813403          	ld	s0,8(sp)
    8000874c:	0005051b          	sext.w	a0,a0
    80008750:	01010113          	addi	sp,sp,16
    80008754:	00008067          	ret

0000000080008758 <mycpu>:
    80008758:	ff010113          	addi	sp,sp,-16
    8000875c:	00813423          	sd	s0,8(sp)
    80008760:	01010413          	addi	s0,sp,16
    80008764:	00020793          	mv	a5,tp
    80008768:	00813403          	ld	s0,8(sp)
    8000876c:	0007879b          	sext.w	a5,a5
    80008770:	00779793          	slli	a5,a5,0x7
    80008774:	00007517          	auipc	a0,0x7
    80008778:	a0c50513          	addi	a0,a0,-1524 # 8000f180 <cpus>
    8000877c:	00f50533          	add	a0,a0,a5
    80008780:	01010113          	addi	sp,sp,16
    80008784:	00008067          	ret

0000000080008788 <userinit>:
    80008788:	ff010113          	addi	sp,sp,-16
    8000878c:	00813423          	sd	s0,8(sp)
    80008790:	01010413          	addi	s0,sp,16
    80008794:	00813403          	ld	s0,8(sp)
    80008798:	01010113          	addi	sp,sp,16
    8000879c:	ffff9317          	auipc	t1,0xffff9
    800087a0:	58830067          	jr	1416(t1) # 80001d24 <main>

00000000800087a4 <either_copyout>:
    800087a4:	ff010113          	addi	sp,sp,-16
    800087a8:	00813023          	sd	s0,0(sp)
    800087ac:	00113423          	sd	ra,8(sp)
    800087b0:	01010413          	addi	s0,sp,16
    800087b4:	02051663          	bnez	a0,800087e0 <either_copyout+0x3c>
    800087b8:	00058513          	mv	a0,a1
    800087bc:	00060593          	mv	a1,a2
    800087c0:	0006861b          	sext.w	a2,a3
    800087c4:	00002097          	auipc	ra,0x2
    800087c8:	c60080e7          	jalr	-928(ra) # 8000a424 <__memmove>
    800087cc:	00813083          	ld	ra,8(sp)
    800087d0:	00013403          	ld	s0,0(sp)
    800087d4:	00000513          	li	a0,0
    800087d8:	01010113          	addi	sp,sp,16
    800087dc:	00008067          	ret
    800087e0:	00003517          	auipc	a0,0x3
    800087e4:	1c050513          	addi	a0,a0,448 # 8000b9a0 <CONSOLE_STATUS+0x990>
    800087e8:	00001097          	auipc	ra,0x1
    800087ec:	934080e7          	jalr	-1740(ra) # 8000911c <panic>

00000000800087f0 <either_copyin>:
    800087f0:	ff010113          	addi	sp,sp,-16
    800087f4:	00813023          	sd	s0,0(sp)
    800087f8:	00113423          	sd	ra,8(sp)
    800087fc:	01010413          	addi	s0,sp,16
    80008800:	02059463          	bnez	a1,80008828 <either_copyin+0x38>
    80008804:	00060593          	mv	a1,a2
    80008808:	0006861b          	sext.w	a2,a3
    8000880c:	00002097          	auipc	ra,0x2
    80008810:	c18080e7          	jalr	-1000(ra) # 8000a424 <__memmove>
    80008814:	00813083          	ld	ra,8(sp)
    80008818:	00013403          	ld	s0,0(sp)
    8000881c:	00000513          	li	a0,0
    80008820:	01010113          	addi	sp,sp,16
    80008824:	00008067          	ret
    80008828:	00003517          	auipc	a0,0x3
    8000882c:	1a050513          	addi	a0,a0,416 # 8000b9c8 <CONSOLE_STATUS+0x9b8>
    80008830:	00001097          	auipc	ra,0x1
    80008834:	8ec080e7          	jalr	-1812(ra) # 8000911c <panic>

0000000080008838 <trapinit>:
    80008838:	ff010113          	addi	sp,sp,-16
    8000883c:	00813423          	sd	s0,8(sp)
    80008840:	01010413          	addi	s0,sp,16
    80008844:	00813403          	ld	s0,8(sp)
    80008848:	00003597          	auipc	a1,0x3
    8000884c:	1a858593          	addi	a1,a1,424 # 8000b9f0 <CONSOLE_STATUS+0x9e0>
    80008850:	00007517          	auipc	a0,0x7
    80008854:	9b050513          	addi	a0,a0,-1616 # 8000f200 <tickslock>
    80008858:	01010113          	addi	sp,sp,16
    8000885c:	00001317          	auipc	t1,0x1
    80008860:	5cc30067          	jr	1484(t1) # 80009e28 <initlock>

0000000080008864 <trapinithart>:
    80008864:	ff010113          	addi	sp,sp,-16
    80008868:	00813423          	sd	s0,8(sp)
    8000886c:	01010413          	addi	s0,sp,16
    80008870:	00000797          	auipc	a5,0x0
    80008874:	30078793          	addi	a5,a5,768 # 80008b70 <kernelvec>
    80008878:	10579073          	csrw	stvec,a5
    8000887c:	00813403          	ld	s0,8(sp)
    80008880:	01010113          	addi	sp,sp,16
    80008884:	00008067          	ret

0000000080008888 <usertrap>:
    80008888:	ff010113          	addi	sp,sp,-16
    8000888c:	00813423          	sd	s0,8(sp)
    80008890:	01010413          	addi	s0,sp,16
    80008894:	00813403          	ld	s0,8(sp)
    80008898:	01010113          	addi	sp,sp,16
    8000889c:	00008067          	ret

00000000800088a0 <usertrapret>:
    800088a0:	ff010113          	addi	sp,sp,-16
    800088a4:	00813423          	sd	s0,8(sp)
    800088a8:	01010413          	addi	s0,sp,16
    800088ac:	00813403          	ld	s0,8(sp)
    800088b0:	01010113          	addi	sp,sp,16
    800088b4:	00008067          	ret

00000000800088b8 <kerneltrap>:
    800088b8:	fe010113          	addi	sp,sp,-32
    800088bc:	00813823          	sd	s0,16(sp)
    800088c0:	00113c23          	sd	ra,24(sp)
    800088c4:	00913423          	sd	s1,8(sp)
    800088c8:	02010413          	addi	s0,sp,32
    800088cc:	142025f3          	csrr	a1,scause
    800088d0:	100027f3          	csrr	a5,sstatus
    800088d4:	0027f793          	andi	a5,a5,2
    800088d8:	10079c63          	bnez	a5,800089f0 <kerneltrap+0x138>
    800088dc:	142027f3          	csrr	a5,scause
    800088e0:	0207ce63          	bltz	a5,8000891c <kerneltrap+0x64>
    800088e4:	00003517          	auipc	a0,0x3
    800088e8:	15450513          	addi	a0,a0,340 # 8000ba38 <CONSOLE_STATUS+0xa28>
    800088ec:	00001097          	auipc	ra,0x1
    800088f0:	88c080e7          	jalr	-1908(ra) # 80009178 <__printf>
    800088f4:	141025f3          	csrr	a1,sepc
    800088f8:	14302673          	csrr	a2,stval
    800088fc:	00003517          	auipc	a0,0x3
    80008900:	14c50513          	addi	a0,a0,332 # 8000ba48 <CONSOLE_STATUS+0xa38>
    80008904:	00001097          	auipc	ra,0x1
    80008908:	874080e7          	jalr	-1932(ra) # 80009178 <__printf>
    8000890c:	00003517          	auipc	a0,0x3
    80008910:	15450513          	addi	a0,a0,340 # 8000ba60 <CONSOLE_STATUS+0xa50>
    80008914:	00001097          	auipc	ra,0x1
    80008918:	808080e7          	jalr	-2040(ra) # 8000911c <panic>
    8000891c:	0ff7f713          	andi	a4,a5,255
    80008920:	00900693          	li	a3,9
    80008924:	04d70063          	beq	a4,a3,80008964 <kerneltrap+0xac>
    80008928:	fff00713          	li	a4,-1
    8000892c:	03f71713          	slli	a4,a4,0x3f
    80008930:	00170713          	addi	a4,a4,1
    80008934:	fae798e3          	bne	a5,a4,800088e4 <kerneltrap+0x2c>
    80008938:	00000097          	auipc	ra,0x0
    8000893c:	e00080e7          	jalr	-512(ra) # 80008738 <cpuid>
    80008940:	06050663          	beqz	a0,800089ac <kerneltrap+0xf4>
    80008944:	144027f3          	csrr	a5,sip
    80008948:	ffd7f793          	andi	a5,a5,-3
    8000894c:	14479073          	csrw	sip,a5
    80008950:	01813083          	ld	ra,24(sp)
    80008954:	01013403          	ld	s0,16(sp)
    80008958:	00813483          	ld	s1,8(sp)
    8000895c:	02010113          	addi	sp,sp,32
    80008960:	00008067          	ret
    80008964:	00000097          	auipc	ra,0x0
    80008968:	3d0080e7          	jalr	976(ra) # 80008d34 <plic_claim>
    8000896c:	00a00793          	li	a5,10
    80008970:	00050493          	mv	s1,a0
    80008974:	06f50863          	beq	a0,a5,800089e4 <kerneltrap+0x12c>
    80008978:	fc050ce3          	beqz	a0,80008950 <kerneltrap+0x98>
    8000897c:	00050593          	mv	a1,a0
    80008980:	00003517          	auipc	a0,0x3
    80008984:	09850513          	addi	a0,a0,152 # 8000ba18 <CONSOLE_STATUS+0xa08>
    80008988:	00000097          	auipc	ra,0x0
    8000898c:	7f0080e7          	jalr	2032(ra) # 80009178 <__printf>
    80008990:	01013403          	ld	s0,16(sp)
    80008994:	01813083          	ld	ra,24(sp)
    80008998:	00048513          	mv	a0,s1
    8000899c:	00813483          	ld	s1,8(sp)
    800089a0:	02010113          	addi	sp,sp,32
    800089a4:	00000317          	auipc	t1,0x0
    800089a8:	3c830067          	jr	968(t1) # 80008d6c <plic_complete>
    800089ac:	00007517          	auipc	a0,0x7
    800089b0:	85450513          	addi	a0,a0,-1964 # 8000f200 <tickslock>
    800089b4:	00001097          	auipc	ra,0x1
    800089b8:	498080e7          	jalr	1176(ra) # 80009e4c <acquire>
    800089bc:	00005717          	auipc	a4,0x5
    800089c0:	6d870713          	addi	a4,a4,1752 # 8000e094 <ticks>
    800089c4:	00072783          	lw	a5,0(a4)
    800089c8:	00007517          	auipc	a0,0x7
    800089cc:	83850513          	addi	a0,a0,-1992 # 8000f200 <tickslock>
    800089d0:	0017879b          	addiw	a5,a5,1
    800089d4:	00f72023          	sw	a5,0(a4)
    800089d8:	00001097          	auipc	ra,0x1
    800089dc:	540080e7          	jalr	1344(ra) # 80009f18 <release>
    800089e0:	f65ff06f          	j	80008944 <kerneltrap+0x8c>
    800089e4:	00001097          	auipc	ra,0x1
    800089e8:	09c080e7          	jalr	156(ra) # 80009a80 <uartintr>
    800089ec:	fa5ff06f          	j	80008990 <kerneltrap+0xd8>
    800089f0:	00003517          	auipc	a0,0x3
    800089f4:	00850513          	addi	a0,a0,8 # 8000b9f8 <CONSOLE_STATUS+0x9e8>
    800089f8:	00000097          	auipc	ra,0x0
    800089fc:	724080e7          	jalr	1828(ra) # 8000911c <panic>

0000000080008a00 <clockintr>:
    80008a00:	fe010113          	addi	sp,sp,-32
    80008a04:	00813823          	sd	s0,16(sp)
    80008a08:	00913423          	sd	s1,8(sp)
    80008a0c:	00113c23          	sd	ra,24(sp)
    80008a10:	02010413          	addi	s0,sp,32
    80008a14:	00006497          	auipc	s1,0x6
    80008a18:	7ec48493          	addi	s1,s1,2028 # 8000f200 <tickslock>
    80008a1c:	00048513          	mv	a0,s1
    80008a20:	00001097          	auipc	ra,0x1
    80008a24:	42c080e7          	jalr	1068(ra) # 80009e4c <acquire>
    80008a28:	00005717          	auipc	a4,0x5
    80008a2c:	66c70713          	addi	a4,a4,1644 # 8000e094 <ticks>
    80008a30:	00072783          	lw	a5,0(a4)
    80008a34:	01013403          	ld	s0,16(sp)
    80008a38:	01813083          	ld	ra,24(sp)
    80008a3c:	00048513          	mv	a0,s1
    80008a40:	0017879b          	addiw	a5,a5,1
    80008a44:	00813483          	ld	s1,8(sp)
    80008a48:	00f72023          	sw	a5,0(a4)
    80008a4c:	02010113          	addi	sp,sp,32
    80008a50:	00001317          	auipc	t1,0x1
    80008a54:	4c830067          	jr	1224(t1) # 80009f18 <release>

0000000080008a58 <devintr>:
    80008a58:	142027f3          	csrr	a5,scause
    80008a5c:	00000513          	li	a0,0
    80008a60:	0007c463          	bltz	a5,80008a68 <devintr+0x10>
    80008a64:	00008067          	ret
    80008a68:	fe010113          	addi	sp,sp,-32
    80008a6c:	00813823          	sd	s0,16(sp)
    80008a70:	00113c23          	sd	ra,24(sp)
    80008a74:	00913423          	sd	s1,8(sp)
    80008a78:	02010413          	addi	s0,sp,32
    80008a7c:	0ff7f713          	andi	a4,a5,255
    80008a80:	00900693          	li	a3,9
    80008a84:	04d70c63          	beq	a4,a3,80008adc <devintr+0x84>
    80008a88:	fff00713          	li	a4,-1
    80008a8c:	03f71713          	slli	a4,a4,0x3f
    80008a90:	00170713          	addi	a4,a4,1
    80008a94:	00e78c63          	beq	a5,a4,80008aac <devintr+0x54>
    80008a98:	01813083          	ld	ra,24(sp)
    80008a9c:	01013403          	ld	s0,16(sp)
    80008aa0:	00813483          	ld	s1,8(sp)
    80008aa4:	02010113          	addi	sp,sp,32
    80008aa8:	00008067          	ret
    80008aac:	00000097          	auipc	ra,0x0
    80008ab0:	c8c080e7          	jalr	-884(ra) # 80008738 <cpuid>
    80008ab4:	06050663          	beqz	a0,80008b20 <devintr+0xc8>
    80008ab8:	144027f3          	csrr	a5,sip
    80008abc:	ffd7f793          	andi	a5,a5,-3
    80008ac0:	14479073          	csrw	sip,a5
    80008ac4:	01813083          	ld	ra,24(sp)
    80008ac8:	01013403          	ld	s0,16(sp)
    80008acc:	00813483          	ld	s1,8(sp)
    80008ad0:	00200513          	li	a0,2
    80008ad4:	02010113          	addi	sp,sp,32
    80008ad8:	00008067          	ret
    80008adc:	00000097          	auipc	ra,0x0
    80008ae0:	258080e7          	jalr	600(ra) # 80008d34 <plic_claim>
    80008ae4:	00a00793          	li	a5,10
    80008ae8:	00050493          	mv	s1,a0
    80008aec:	06f50663          	beq	a0,a5,80008b58 <devintr+0x100>
    80008af0:	00100513          	li	a0,1
    80008af4:	fa0482e3          	beqz	s1,80008a98 <devintr+0x40>
    80008af8:	00048593          	mv	a1,s1
    80008afc:	00003517          	auipc	a0,0x3
    80008b00:	f1c50513          	addi	a0,a0,-228 # 8000ba18 <CONSOLE_STATUS+0xa08>
    80008b04:	00000097          	auipc	ra,0x0
    80008b08:	674080e7          	jalr	1652(ra) # 80009178 <__printf>
    80008b0c:	00048513          	mv	a0,s1
    80008b10:	00000097          	auipc	ra,0x0
    80008b14:	25c080e7          	jalr	604(ra) # 80008d6c <plic_complete>
    80008b18:	00100513          	li	a0,1
    80008b1c:	f7dff06f          	j	80008a98 <devintr+0x40>
    80008b20:	00006517          	auipc	a0,0x6
    80008b24:	6e050513          	addi	a0,a0,1760 # 8000f200 <tickslock>
    80008b28:	00001097          	auipc	ra,0x1
    80008b2c:	324080e7          	jalr	804(ra) # 80009e4c <acquire>
    80008b30:	00005717          	auipc	a4,0x5
    80008b34:	56470713          	addi	a4,a4,1380 # 8000e094 <ticks>
    80008b38:	00072783          	lw	a5,0(a4)
    80008b3c:	00006517          	auipc	a0,0x6
    80008b40:	6c450513          	addi	a0,a0,1732 # 8000f200 <tickslock>
    80008b44:	0017879b          	addiw	a5,a5,1
    80008b48:	00f72023          	sw	a5,0(a4)
    80008b4c:	00001097          	auipc	ra,0x1
    80008b50:	3cc080e7          	jalr	972(ra) # 80009f18 <release>
    80008b54:	f65ff06f          	j	80008ab8 <devintr+0x60>
    80008b58:	00001097          	auipc	ra,0x1
    80008b5c:	f28080e7          	jalr	-216(ra) # 80009a80 <uartintr>
    80008b60:	fadff06f          	j	80008b0c <devintr+0xb4>
	...

0000000080008b70 <kernelvec>:
    80008b70:	f0010113          	addi	sp,sp,-256
    80008b74:	00113023          	sd	ra,0(sp)
    80008b78:	00213423          	sd	sp,8(sp)
    80008b7c:	00313823          	sd	gp,16(sp)
    80008b80:	00413c23          	sd	tp,24(sp)
    80008b84:	02513023          	sd	t0,32(sp)
    80008b88:	02613423          	sd	t1,40(sp)
    80008b8c:	02713823          	sd	t2,48(sp)
    80008b90:	02813c23          	sd	s0,56(sp)
    80008b94:	04913023          	sd	s1,64(sp)
    80008b98:	04a13423          	sd	a0,72(sp)
    80008b9c:	04b13823          	sd	a1,80(sp)
    80008ba0:	04c13c23          	sd	a2,88(sp)
    80008ba4:	06d13023          	sd	a3,96(sp)
    80008ba8:	06e13423          	sd	a4,104(sp)
    80008bac:	06f13823          	sd	a5,112(sp)
    80008bb0:	07013c23          	sd	a6,120(sp)
    80008bb4:	09113023          	sd	a7,128(sp)
    80008bb8:	09213423          	sd	s2,136(sp)
    80008bbc:	09313823          	sd	s3,144(sp)
    80008bc0:	09413c23          	sd	s4,152(sp)
    80008bc4:	0b513023          	sd	s5,160(sp)
    80008bc8:	0b613423          	sd	s6,168(sp)
    80008bcc:	0b713823          	sd	s7,176(sp)
    80008bd0:	0b813c23          	sd	s8,184(sp)
    80008bd4:	0d913023          	sd	s9,192(sp)
    80008bd8:	0da13423          	sd	s10,200(sp)
    80008bdc:	0db13823          	sd	s11,208(sp)
    80008be0:	0dc13c23          	sd	t3,216(sp)
    80008be4:	0fd13023          	sd	t4,224(sp)
    80008be8:	0fe13423          	sd	t5,232(sp)
    80008bec:	0ff13823          	sd	t6,240(sp)
    80008bf0:	cc9ff0ef          	jal	ra,800088b8 <kerneltrap>
    80008bf4:	00013083          	ld	ra,0(sp)
    80008bf8:	00813103          	ld	sp,8(sp)
    80008bfc:	01013183          	ld	gp,16(sp)
    80008c00:	02013283          	ld	t0,32(sp)
    80008c04:	02813303          	ld	t1,40(sp)
    80008c08:	03013383          	ld	t2,48(sp)
    80008c0c:	03813403          	ld	s0,56(sp)
    80008c10:	04013483          	ld	s1,64(sp)
    80008c14:	04813503          	ld	a0,72(sp)
    80008c18:	05013583          	ld	a1,80(sp)
    80008c1c:	05813603          	ld	a2,88(sp)
    80008c20:	06013683          	ld	a3,96(sp)
    80008c24:	06813703          	ld	a4,104(sp)
    80008c28:	07013783          	ld	a5,112(sp)
    80008c2c:	07813803          	ld	a6,120(sp)
    80008c30:	08013883          	ld	a7,128(sp)
    80008c34:	08813903          	ld	s2,136(sp)
    80008c38:	09013983          	ld	s3,144(sp)
    80008c3c:	09813a03          	ld	s4,152(sp)
    80008c40:	0a013a83          	ld	s5,160(sp)
    80008c44:	0a813b03          	ld	s6,168(sp)
    80008c48:	0b013b83          	ld	s7,176(sp)
    80008c4c:	0b813c03          	ld	s8,184(sp)
    80008c50:	0c013c83          	ld	s9,192(sp)
    80008c54:	0c813d03          	ld	s10,200(sp)
    80008c58:	0d013d83          	ld	s11,208(sp)
    80008c5c:	0d813e03          	ld	t3,216(sp)
    80008c60:	0e013e83          	ld	t4,224(sp)
    80008c64:	0e813f03          	ld	t5,232(sp)
    80008c68:	0f013f83          	ld	t6,240(sp)
    80008c6c:	10010113          	addi	sp,sp,256
    80008c70:	10200073          	sret
    80008c74:	00000013          	nop
    80008c78:	00000013          	nop
    80008c7c:	00000013          	nop

0000000080008c80 <timervec>:
    80008c80:	34051573          	csrrw	a0,mscratch,a0
    80008c84:	00b53023          	sd	a1,0(a0)
    80008c88:	00c53423          	sd	a2,8(a0)
    80008c8c:	00d53823          	sd	a3,16(a0)
    80008c90:	01853583          	ld	a1,24(a0)
    80008c94:	02053603          	ld	a2,32(a0)
    80008c98:	0005b683          	ld	a3,0(a1)
    80008c9c:	00c686b3          	add	a3,a3,a2
    80008ca0:	00d5b023          	sd	a3,0(a1)
    80008ca4:	00200593          	li	a1,2
    80008ca8:	14459073          	csrw	sip,a1
    80008cac:	01053683          	ld	a3,16(a0)
    80008cb0:	00853603          	ld	a2,8(a0)
    80008cb4:	00053583          	ld	a1,0(a0)
    80008cb8:	34051573          	csrrw	a0,mscratch,a0
    80008cbc:	30200073          	mret

0000000080008cc0 <plicinit>:
    80008cc0:	ff010113          	addi	sp,sp,-16
    80008cc4:	00813423          	sd	s0,8(sp)
    80008cc8:	01010413          	addi	s0,sp,16
    80008ccc:	00813403          	ld	s0,8(sp)
    80008cd0:	0c0007b7          	lui	a5,0xc000
    80008cd4:	00100713          	li	a4,1
    80008cd8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80008cdc:	00e7a223          	sw	a4,4(a5)
    80008ce0:	01010113          	addi	sp,sp,16
    80008ce4:	00008067          	ret

0000000080008ce8 <plicinithart>:
    80008ce8:	ff010113          	addi	sp,sp,-16
    80008cec:	00813023          	sd	s0,0(sp)
    80008cf0:	00113423          	sd	ra,8(sp)
    80008cf4:	01010413          	addi	s0,sp,16
    80008cf8:	00000097          	auipc	ra,0x0
    80008cfc:	a40080e7          	jalr	-1472(ra) # 80008738 <cpuid>
    80008d00:	0085171b          	slliw	a4,a0,0x8
    80008d04:	0c0027b7          	lui	a5,0xc002
    80008d08:	00e787b3          	add	a5,a5,a4
    80008d0c:	40200713          	li	a4,1026
    80008d10:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80008d14:	00813083          	ld	ra,8(sp)
    80008d18:	00013403          	ld	s0,0(sp)
    80008d1c:	00d5151b          	slliw	a0,a0,0xd
    80008d20:	0c2017b7          	lui	a5,0xc201
    80008d24:	00a78533          	add	a0,a5,a0
    80008d28:	00052023          	sw	zero,0(a0)
    80008d2c:	01010113          	addi	sp,sp,16
    80008d30:	00008067          	ret

0000000080008d34 <plic_claim>:
    80008d34:	ff010113          	addi	sp,sp,-16
    80008d38:	00813023          	sd	s0,0(sp)
    80008d3c:	00113423          	sd	ra,8(sp)
    80008d40:	01010413          	addi	s0,sp,16
    80008d44:	00000097          	auipc	ra,0x0
    80008d48:	9f4080e7          	jalr	-1548(ra) # 80008738 <cpuid>
    80008d4c:	00813083          	ld	ra,8(sp)
    80008d50:	00013403          	ld	s0,0(sp)
    80008d54:	00d5151b          	slliw	a0,a0,0xd
    80008d58:	0c2017b7          	lui	a5,0xc201
    80008d5c:	00a78533          	add	a0,a5,a0
    80008d60:	00452503          	lw	a0,4(a0)
    80008d64:	01010113          	addi	sp,sp,16
    80008d68:	00008067          	ret

0000000080008d6c <plic_complete>:
    80008d6c:	fe010113          	addi	sp,sp,-32
    80008d70:	00813823          	sd	s0,16(sp)
    80008d74:	00913423          	sd	s1,8(sp)
    80008d78:	00113c23          	sd	ra,24(sp)
    80008d7c:	02010413          	addi	s0,sp,32
    80008d80:	00050493          	mv	s1,a0
    80008d84:	00000097          	auipc	ra,0x0
    80008d88:	9b4080e7          	jalr	-1612(ra) # 80008738 <cpuid>
    80008d8c:	01813083          	ld	ra,24(sp)
    80008d90:	01013403          	ld	s0,16(sp)
    80008d94:	00d5179b          	slliw	a5,a0,0xd
    80008d98:	0c201737          	lui	a4,0xc201
    80008d9c:	00f707b3          	add	a5,a4,a5
    80008da0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80008da4:	00813483          	ld	s1,8(sp)
    80008da8:	02010113          	addi	sp,sp,32
    80008dac:	00008067          	ret

0000000080008db0 <consolewrite>:
    80008db0:	fb010113          	addi	sp,sp,-80
    80008db4:	04813023          	sd	s0,64(sp)
    80008db8:	04113423          	sd	ra,72(sp)
    80008dbc:	02913c23          	sd	s1,56(sp)
    80008dc0:	03213823          	sd	s2,48(sp)
    80008dc4:	03313423          	sd	s3,40(sp)
    80008dc8:	03413023          	sd	s4,32(sp)
    80008dcc:	01513c23          	sd	s5,24(sp)
    80008dd0:	05010413          	addi	s0,sp,80
    80008dd4:	06c05c63          	blez	a2,80008e4c <consolewrite+0x9c>
    80008dd8:	00060993          	mv	s3,a2
    80008ddc:	00050a13          	mv	s4,a0
    80008de0:	00058493          	mv	s1,a1
    80008de4:	00000913          	li	s2,0
    80008de8:	fff00a93          	li	s5,-1
    80008dec:	01c0006f          	j	80008e08 <consolewrite+0x58>
    80008df0:	fbf44503          	lbu	a0,-65(s0)
    80008df4:	0019091b          	addiw	s2,s2,1
    80008df8:	00148493          	addi	s1,s1,1
    80008dfc:	00001097          	auipc	ra,0x1
    80008e00:	a9c080e7          	jalr	-1380(ra) # 80009898 <uartputc>
    80008e04:	03298063          	beq	s3,s2,80008e24 <consolewrite+0x74>
    80008e08:	00048613          	mv	a2,s1
    80008e0c:	00100693          	li	a3,1
    80008e10:	000a0593          	mv	a1,s4
    80008e14:	fbf40513          	addi	a0,s0,-65
    80008e18:	00000097          	auipc	ra,0x0
    80008e1c:	9d8080e7          	jalr	-1576(ra) # 800087f0 <either_copyin>
    80008e20:	fd5518e3          	bne	a0,s5,80008df0 <consolewrite+0x40>
    80008e24:	04813083          	ld	ra,72(sp)
    80008e28:	04013403          	ld	s0,64(sp)
    80008e2c:	03813483          	ld	s1,56(sp)
    80008e30:	02813983          	ld	s3,40(sp)
    80008e34:	02013a03          	ld	s4,32(sp)
    80008e38:	01813a83          	ld	s5,24(sp)
    80008e3c:	00090513          	mv	a0,s2
    80008e40:	03013903          	ld	s2,48(sp)
    80008e44:	05010113          	addi	sp,sp,80
    80008e48:	00008067          	ret
    80008e4c:	00000913          	li	s2,0
    80008e50:	fd5ff06f          	j	80008e24 <consolewrite+0x74>

0000000080008e54 <consoleread>:
    80008e54:	f9010113          	addi	sp,sp,-112
    80008e58:	06813023          	sd	s0,96(sp)
    80008e5c:	04913c23          	sd	s1,88(sp)
    80008e60:	05213823          	sd	s2,80(sp)
    80008e64:	05313423          	sd	s3,72(sp)
    80008e68:	05413023          	sd	s4,64(sp)
    80008e6c:	03513c23          	sd	s5,56(sp)
    80008e70:	03613823          	sd	s6,48(sp)
    80008e74:	03713423          	sd	s7,40(sp)
    80008e78:	03813023          	sd	s8,32(sp)
    80008e7c:	06113423          	sd	ra,104(sp)
    80008e80:	01913c23          	sd	s9,24(sp)
    80008e84:	07010413          	addi	s0,sp,112
    80008e88:	00060b93          	mv	s7,a2
    80008e8c:	00050913          	mv	s2,a0
    80008e90:	00058c13          	mv	s8,a1
    80008e94:	00060b1b          	sext.w	s6,a2
    80008e98:	00006497          	auipc	s1,0x6
    80008e9c:	39048493          	addi	s1,s1,912 # 8000f228 <cons>
    80008ea0:	00400993          	li	s3,4
    80008ea4:	fff00a13          	li	s4,-1
    80008ea8:	00a00a93          	li	s5,10
    80008eac:	05705e63          	blez	s7,80008f08 <consoleread+0xb4>
    80008eb0:	09c4a703          	lw	a4,156(s1)
    80008eb4:	0984a783          	lw	a5,152(s1)
    80008eb8:	0007071b          	sext.w	a4,a4
    80008ebc:	08e78463          	beq	a5,a4,80008f44 <consoleread+0xf0>
    80008ec0:	07f7f713          	andi	a4,a5,127
    80008ec4:	00e48733          	add	a4,s1,a4
    80008ec8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80008ecc:	0017869b          	addiw	a3,a5,1
    80008ed0:	08d4ac23          	sw	a3,152(s1)
    80008ed4:	00070c9b          	sext.w	s9,a4
    80008ed8:	0b370663          	beq	a4,s3,80008f84 <consoleread+0x130>
    80008edc:	00100693          	li	a3,1
    80008ee0:	f9f40613          	addi	a2,s0,-97
    80008ee4:	000c0593          	mv	a1,s8
    80008ee8:	00090513          	mv	a0,s2
    80008eec:	f8e40fa3          	sb	a4,-97(s0)
    80008ef0:	00000097          	auipc	ra,0x0
    80008ef4:	8b4080e7          	jalr	-1868(ra) # 800087a4 <either_copyout>
    80008ef8:	01450863          	beq	a0,s4,80008f08 <consoleread+0xb4>
    80008efc:	001c0c13          	addi	s8,s8,1
    80008f00:	fffb8b9b          	addiw	s7,s7,-1
    80008f04:	fb5c94e3          	bne	s9,s5,80008eac <consoleread+0x58>
    80008f08:	000b851b          	sext.w	a0,s7
    80008f0c:	06813083          	ld	ra,104(sp)
    80008f10:	06013403          	ld	s0,96(sp)
    80008f14:	05813483          	ld	s1,88(sp)
    80008f18:	05013903          	ld	s2,80(sp)
    80008f1c:	04813983          	ld	s3,72(sp)
    80008f20:	04013a03          	ld	s4,64(sp)
    80008f24:	03813a83          	ld	s5,56(sp)
    80008f28:	02813b83          	ld	s7,40(sp)
    80008f2c:	02013c03          	ld	s8,32(sp)
    80008f30:	01813c83          	ld	s9,24(sp)
    80008f34:	40ab053b          	subw	a0,s6,a0
    80008f38:	03013b03          	ld	s6,48(sp)
    80008f3c:	07010113          	addi	sp,sp,112
    80008f40:	00008067          	ret
    80008f44:	00001097          	auipc	ra,0x1
    80008f48:	1d8080e7          	jalr	472(ra) # 8000a11c <push_on>
    80008f4c:	0984a703          	lw	a4,152(s1)
    80008f50:	09c4a783          	lw	a5,156(s1)
    80008f54:	0007879b          	sext.w	a5,a5
    80008f58:	fef70ce3          	beq	a4,a5,80008f50 <consoleread+0xfc>
    80008f5c:	00001097          	auipc	ra,0x1
    80008f60:	234080e7          	jalr	564(ra) # 8000a190 <pop_on>
    80008f64:	0984a783          	lw	a5,152(s1)
    80008f68:	07f7f713          	andi	a4,a5,127
    80008f6c:	00e48733          	add	a4,s1,a4
    80008f70:	01874703          	lbu	a4,24(a4)
    80008f74:	0017869b          	addiw	a3,a5,1
    80008f78:	08d4ac23          	sw	a3,152(s1)
    80008f7c:	00070c9b          	sext.w	s9,a4
    80008f80:	f5371ee3          	bne	a4,s3,80008edc <consoleread+0x88>
    80008f84:	000b851b          	sext.w	a0,s7
    80008f88:	f96bf2e3          	bgeu	s7,s6,80008f0c <consoleread+0xb8>
    80008f8c:	08f4ac23          	sw	a5,152(s1)
    80008f90:	f7dff06f          	j	80008f0c <consoleread+0xb8>

0000000080008f94 <consputc>:
    80008f94:	10000793          	li	a5,256
    80008f98:	00f50663          	beq	a0,a5,80008fa4 <consputc+0x10>
    80008f9c:	00001317          	auipc	t1,0x1
    80008fa0:	9f430067          	jr	-1548(t1) # 80009990 <uartputc_sync>
    80008fa4:	ff010113          	addi	sp,sp,-16
    80008fa8:	00113423          	sd	ra,8(sp)
    80008fac:	00813023          	sd	s0,0(sp)
    80008fb0:	01010413          	addi	s0,sp,16
    80008fb4:	00800513          	li	a0,8
    80008fb8:	00001097          	auipc	ra,0x1
    80008fbc:	9d8080e7          	jalr	-1576(ra) # 80009990 <uartputc_sync>
    80008fc0:	02000513          	li	a0,32
    80008fc4:	00001097          	auipc	ra,0x1
    80008fc8:	9cc080e7          	jalr	-1588(ra) # 80009990 <uartputc_sync>
    80008fcc:	00013403          	ld	s0,0(sp)
    80008fd0:	00813083          	ld	ra,8(sp)
    80008fd4:	00800513          	li	a0,8
    80008fd8:	01010113          	addi	sp,sp,16
    80008fdc:	00001317          	auipc	t1,0x1
    80008fe0:	9b430067          	jr	-1612(t1) # 80009990 <uartputc_sync>

0000000080008fe4 <consoleintr>:
    80008fe4:	fe010113          	addi	sp,sp,-32
    80008fe8:	00813823          	sd	s0,16(sp)
    80008fec:	00913423          	sd	s1,8(sp)
    80008ff0:	01213023          	sd	s2,0(sp)
    80008ff4:	00113c23          	sd	ra,24(sp)
    80008ff8:	02010413          	addi	s0,sp,32
    80008ffc:	00006917          	auipc	s2,0x6
    80009000:	22c90913          	addi	s2,s2,556 # 8000f228 <cons>
    80009004:	00050493          	mv	s1,a0
    80009008:	00090513          	mv	a0,s2
    8000900c:	00001097          	auipc	ra,0x1
    80009010:	e40080e7          	jalr	-448(ra) # 80009e4c <acquire>
    80009014:	02048c63          	beqz	s1,8000904c <consoleintr+0x68>
    80009018:	0a092783          	lw	a5,160(s2)
    8000901c:	09892703          	lw	a4,152(s2)
    80009020:	07f00693          	li	a3,127
    80009024:	40e7873b          	subw	a4,a5,a4
    80009028:	02e6e263          	bltu	a3,a4,8000904c <consoleintr+0x68>
    8000902c:	00d00713          	li	a4,13
    80009030:	04e48063          	beq	s1,a4,80009070 <consoleintr+0x8c>
    80009034:	07f7f713          	andi	a4,a5,127
    80009038:	00e90733          	add	a4,s2,a4
    8000903c:	0017879b          	addiw	a5,a5,1
    80009040:	0af92023          	sw	a5,160(s2)
    80009044:	00970c23          	sb	s1,24(a4)
    80009048:	08f92e23          	sw	a5,156(s2)
    8000904c:	01013403          	ld	s0,16(sp)
    80009050:	01813083          	ld	ra,24(sp)
    80009054:	00813483          	ld	s1,8(sp)
    80009058:	00013903          	ld	s2,0(sp)
    8000905c:	00006517          	auipc	a0,0x6
    80009060:	1cc50513          	addi	a0,a0,460 # 8000f228 <cons>
    80009064:	02010113          	addi	sp,sp,32
    80009068:	00001317          	auipc	t1,0x1
    8000906c:	eb030067          	jr	-336(t1) # 80009f18 <release>
    80009070:	00a00493          	li	s1,10
    80009074:	fc1ff06f          	j	80009034 <consoleintr+0x50>

0000000080009078 <consoleinit>:
    80009078:	fe010113          	addi	sp,sp,-32
    8000907c:	00113c23          	sd	ra,24(sp)
    80009080:	00813823          	sd	s0,16(sp)
    80009084:	00913423          	sd	s1,8(sp)
    80009088:	02010413          	addi	s0,sp,32
    8000908c:	00006497          	auipc	s1,0x6
    80009090:	19c48493          	addi	s1,s1,412 # 8000f228 <cons>
    80009094:	00048513          	mv	a0,s1
    80009098:	00003597          	auipc	a1,0x3
    8000909c:	9d858593          	addi	a1,a1,-1576 # 8000ba70 <CONSOLE_STATUS+0xa60>
    800090a0:	00001097          	auipc	ra,0x1
    800090a4:	d88080e7          	jalr	-632(ra) # 80009e28 <initlock>
    800090a8:	00000097          	auipc	ra,0x0
    800090ac:	7ac080e7          	jalr	1964(ra) # 80009854 <uartinit>
    800090b0:	01813083          	ld	ra,24(sp)
    800090b4:	01013403          	ld	s0,16(sp)
    800090b8:	00000797          	auipc	a5,0x0
    800090bc:	d9c78793          	addi	a5,a5,-612 # 80008e54 <consoleread>
    800090c0:	0af4bc23          	sd	a5,184(s1)
    800090c4:	00000797          	auipc	a5,0x0
    800090c8:	cec78793          	addi	a5,a5,-788 # 80008db0 <consolewrite>
    800090cc:	0cf4b023          	sd	a5,192(s1)
    800090d0:	00813483          	ld	s1,8(sp)
    800090d4:	02010113          	addi	sp,sp,32
    800090d8:	00008067          	ret

00000000800090dc <console_read>:
    800090dc:	ff010113          	addi	sp,sp,-16
    800090e0:	00813423          	sd	s0,8(sp)
    800090e4:	01010413          	addi	s0,sp,16
    800090e8:	00813403          	ld	s0,8(sp)
    800090ec:	00006317          	auipc	t1,0x6
    800090f0:	1f433303          	ld	t1,500(t1) # 8000f2e0 <devsw+0x10>
    800090f4:	01010113          	addi	sp,sp,16
    800090f8:	00030067          	jr	t1

00000000800090fc <console_write>:
    800090fc:	ff010113          	addi	sp,sp,-16
    80009100:	00813423          	sd	s0,8(sp)
    80009104:	01010413          	addi	s0,sp,16
    80009108:	00813403          	ld	s0,8(sp)
    8000910c:	00006317          	auipc	t1,0x6
    80009110:	1dc33303          	ld	t1,476(t1) # 8000f2e8 <devsw+0x18>
    80009114:	01010113          	addi	sp,sp,16
    80009118:	00030067          	jr	t1

000000008000911c <panic>:
    8000911c:	fe010113          	addi	sp,sp,-32
    80009120:	00113c23          	sd	ra,24(sp)
    80009124:	00813823          	sd	s0,16(sp)
    80009128:	00913423          	sd	s1,8(sp)
    8000912c:	02010413          	addi	s0,sp,32
    80009130:	00050493          	mv	s1,a0
    80009134:	00003517          	auipc	a0,0x3
    80009138:	94450513          	addi	a0,a0,-1724 # 8000ba78 <CONSOLE_STATUS+0xa68>
    8000913c:	00006797          	auipc	a5,0x6
    80009140:	2407a623          	sw	zero,588(a5) # 8000f388 <pr+0x18>
    80009144:	00000097          	auipc	ra,0x0
    80009148:	034080e7          	jalr	52(ra) # 80009178 <__printf>
    8000914c:	00048513          	mv	a0,s1
    80009150:	00000097          	auipc	ra,0x0
    80009154:	028080e7          	jalr	40(ra) # 80009178 <__printf>
    80009158:	00002517          	auipc	a0,0x2
    8000915c:	6a050513          	addi	a0,a0,1696 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80009160:	00000097          	auipc	ra,0x0
    80009164:	018080e7          	jalr	24(ra) # 80009178 <__printf>
    80009168:	00100793          	li	a5,1
    8000916c:	00005717          	auipc	a4,0x5
    80009170:	f2f72623          	sw	a5,-212(a4) # 8000e098 <panicked>
    80009174:	0000006f          	j	80009174 <panic+0x58>

0000000080009178 <__printf>:
    80009178:	f3010113          	addi	sp,sp,-208
    8000917c:	08813023          	sd	s0,128(sp)
    80009180:	07313423          	sd	s3,104(sp)
    80009184:	09010413          	addi	s0,sp,144
    80009188:	05813023          	sd	s8,64(sp)
    8000918c:	08113423          	sd	ra,136(sp)
    80009190:	06913c23          	sd	s1,120(sp)
    80009194:	07213823          	sd	s2,112(sp)
    80009198:	07413023          	sd	s4,96(sp)
    8000919c:	05513c23          	sd	s5,88(sp)
    800091a0:	05613823          	sd	s6,80(sp)
    800091a4:	05713423          	sd	s7,72(sp)
    800091a8:	03913c23          	sd	s9,56(sp)
    800091ac:	03a13823          	sd	s10,48(sp)
    800091b0:	03b13423          	sd	s11,40(sp)
    800091b4:	00006317          	auipc	t1,0x6
    800091b8:	1bc30313          	addi	t1,t1,444 # 8000f370 <pr>
    800091bc:	01832c03          	lw	s8,24(t1)
    800091c0:	00b43423          	sd	a1,8(s0)
    800091c4:	00c43823          	sd	a2,16(s0)
    800091c8:	00d43c23          	sd	a3,24(s0)
    800091cc:	02e43023          	sd	a4,32(s0)
    800091d0:	02f43423          	sd	a5,40(s0)
    800091d4:	03043823          	sd	a6,48(s0)
    800091d8:	03143c23          	sd	a7,56(s0)
    800091dc:	00050993          	mv	s3,a0
    800091e0:	4a0c1663          	bnez	s8,8000968c <__printf+0x514>
    800091e4:	60098c63          	beqz	s3,800097fc <__printf+0x684>
    800091e8:	0009c503          	lbu	a0,0(s3)
    800091ec:	00840793          	addi	a5,s0,8
    800091f0:	f6f43c23          	sd	a5,-136(s0)
    800091f4:	00000493          	li	s1,0
    800091f8:	22050063          	beqz	a0,80009418 <__printf+0x2a0>
    800091fc:	00002a37          	lui	s4,0x2
    80009200:	00018ab7          	lui	s5,0x18
    80009204:	000f4b37          	lui	s6,0xf4
    80009208:	00989bb7          	lui	s7,0x989
    8000920c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80009210:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80009214:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80009218:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000921c:	00148c9b          	addiw	s9,s1,1
    80009220:	02500793          	li	a5,37
    80009224:	01998933          	add	s2,s3,s9
    80009228:	38f51263          	bne	a0,a5,800095ac <__printf+0x434>
    8000922c:	00094783          	lbu	a5,0(s2)
    80009230:	00078c9b          	sext.w	s9,a5
    80009234:	1e078263          	beqz	a5,80009418 <__printf+0x2a0>
    80009238:	0024849b          	addiw	s1,s1,2
    8000923c:	07000713          	li	a4,112
    80009240:	00998933          	add	s2,s3,s1
    80009244:	38e78a63          	beq	a5,a4,800095d8 <__printf+0x460>
    80009248:	20f76863          	bltu	a4,a5,80009458 <__printf+0x2e0>
    8000924c:	42a78863          	beq	a5,a0,8000967c <__printf+0x504>
    80009250:	06400713          	li	a4,100
    80009254:	40e79663          	bne	a5,a4,80009660 <__printf+0x4e8>
    80009258:	f7843783          	ld	a5,-136(s0)
    8000925c:	0007a603          	lw	a2,0(a5)
    80009260:	00878793          	addi	a5,a5,8
    80009264:	f6f43c23          	sd	a5,-136(s0)
    80009268:	42064a63          	bltz	a2,8000969c <__printf+0x524>
    8000926c:	00a00713          	li	a4,10
    80009270:	02e677bb          	remuw	a5,a2,a4
    80009274:	00003d97          	auipc	s11,0x3
    80009278:	82cd8d93          	addi	s11,s11,-2004 # 8000baa0 <digits>
    8000927c:	00900593          	li	a1,9
    80009280:	0006051b          	sext.w	a0,a2
    80009284:	00000c93          	li	s9,0
    80009288:	02079793          	slli	a5,a5,0x20
    8000928c:	0207d793          	srli	a5,a5,0x20
    80009290:	00fd87b3          	add	a5,s11,a5
    80009294:	0007c783          	lbu	a5,0(a5)
    80009298:	02e656bb          	divuw	a3,a2,a4
    8000929c:	f8f40023          	sb	a5,-128(s0)
    800092a0:	14c5d863          	bge	a1,a2,800093f0 <__printf+0x278>
    800092a4:	06300593          	li	a1,99
    800092a8:	00100c93          	li	s9,1
    800092ac:	02e6f7bb          	remuw	a5,a3,a4
    800092b0:	02079793          	slli	a5,a5,0x20
    800092b4:	0207d793          	srli	a5,a5,0x20
    800092b8:	00fd87b3          	add	a5,s11,a5
    800092bc:	0007c783          	lbu	a5,0(a5)
    800092c0:	02e6d73b          	divuw	a4,a3,a4
    800092c4:	f8f400a3          	sb	a5,-127(s0)
    800092c8:	12a5f463          	bgeu	a1,a0,800093f0 <__printf+0x278>
    800092cc:	00a00693          	li	a3,10
    800092d0:	00900593          	li	a1,9
    800092d4:	02d777bb          	remuw	a5,a4,a3
    800092d8:	02079793          	slli	a5,a5,0x20
    800092dc:	0207d793          	srli	a5,a5,0x20
    800092e0:	00fd87b3          	add	a5,s11,a5
    800092e4:	0007c503          	lbu	a0,0(a5)
    800092e8:	02d757bb          	divuw	a5,a4,a3
    800092ec:	f8a40123          	sb	a0,-126(s0)
    800092f0:	48e5f263          	bgeu	a1,a4,80009774 <__printf+0x5fc>
    800092f4:	06300513          	li	a0,99
    800092f8:	02d7f5bb          	remuw	a1,a5,a3
    800092fc:	02059593          	slli	a1,a1,0x20
    80009300:	0205d593          	srli	a1,a1,0x20
    80009304:	00bd85b3          	add	a1,s11,a1
    80009308:	0005c583          	lbu	a1,0(a1)
    8000930c:	02d7d7bb          	divuw	a5,a5,a3
    80009310:	f8b401a3          	sb	a1,-125(s0)
    80009314:	48e57263          	bgeu	a0,a4,80009798 <__printf+0x620>
    80009318:	3e700513          	li	a0,999
    8000931c:	02d7f5bb          	remuw	a1,a5,a3
    80009320:	02059593          	slli	a1,a1,0x20
    80009324:	0205d593          	srli	a1,a1,0x20
    80009328:	00bd85b3          	add	a1,s11,a1
    8000932c:	0005c583          	lbu	a1,0(a1)
    80009330:	02d7d7bb          	divuw	a5,a5,a3
    80009334:	f8b40223          	sb	a1,-124(s0)
    80009338:	46e57663          	bgeu	a0,a4,800097a4 <__printf+0x62c>
    8000933c:	02d7f5bb          	remuw	a1,a5,a3
    80009340:	02059593          	slli	a1,a1,0x20
    80009344:	0205d593          	srli	a1,a1,0x20
    80009348:	00bd85b3          	add	a1,s11,a1
    8000934c:	0005c583          	lbu	a1,0(a1)
    80009350:	02d7d7bb          	divuw	a5,a5,a3
    80009354:	f8b402a3          	sb	a1,-123(s0)
    80009358:	46ea7863          	bgeu	s4,a4,800097c8 <__printf+0x650>
    8000935c:	02d7f5bb          	remuw	a1,a5,a3
    80009360:	02059593          	slli	a1,a1,0x20
    80009364:	0205d593          	srli	a1,a1,0x20
    80009368:	00bd85b3          	add	a1,s11,a1
    8000936c:	0005c583          	lbu	a1,0(a1)
    80009370:	02d7d7bb          	divuw	a5,a5,a3
    80009374:	f8b40323          	sb	a1,-122(s0)
    80009378:	3eeaf863          	bgeu	s5,a4,80009768 <__printf+0x5f0>
    8000937c:	02d7f5bb          	remuw	a1,a5,a3
    80009380:	02059593          	slli	a1,a1,0x20
    80009384:	0205d593          	srli	a1,a1,0x20
    80009388:	00bd85b3          	add	a1,s11,a1
    8000938c:	0005c583          	lbu	a1,0(a1)
    80009390:	02d7d7bb          	divuw	a5,a5,a3
    80009394:	f8b403a3          	sb	a1,-121(s0)
    80009398:	42eb7e63          	bgeu	s6,a4,800097d4 <__printf+0x65c>
    8000939c:	02d7f5bb          	remuw	a1,a5,a3
    800093a0:	02059593          	slli	a1,a1,0x20
    800093a4:	0205d593          	srli	a1,a1,0x20
    800093a8:	00bd85b3          	add	a1,s11,a1
    800093ac:	0005c583          	lbu	a1,0(a1)
    800093b0:	02d7d7bb          	divuw	a5,a5,a3
    800093b4:	f8b40423          	sb	a1,-120(s0)
    800093b8:	42ebfc63          	bgeu	s7,a4,800097f0 <__printf+0x678>
    800093bc:	02079793          	slli	a5,a5,0x20
    800093c0:	0207d793          	srli	a5,a5,0x20
    800093c4:	00fd8db3          	add	s11,s11,a5
    800093c8:	000dc703          	lbu	a4,0(s11)
    800093cc:	00a00793          	li	a5,10
    800093d0:	00900c93          	li	s9,9
    800093d4:	f8e404a3          	sb	a4,-119(s0)
    800093d8:	00065c63          	bgez	a2,800093f0 <__printf+0x278>
    800093dc:	f9040713          	addi	a4,s0,-112
    800093e0:	00f70733          	add	a4,a4,a5
    800093e4:	02d00693          	li	a3,45
    800093e8:	fed70823          	sb	a3,-16(a4)
    800093ec:	00078c93          	mv	s9,a5
    800093f0:	f8040793          	addi	a5,s0,-128
    800093f4:	01978cb3          	add	s9,a5,s9
    800093f8:	f7f40d13          	addi	s10,s0,-129
    800093fc:	000cc503          	lbu	a0,0(s9)
    80009400:	fffc8c93          	addi	s9,s9,-1
    80009404:	00000097          	auipc	ra,0x0
    80009408:	b90080e7          	jalr	-1136(ra) # 80008f94 <consputc>
    8000940c:	ffac98e3          	bne	s9,s10,800093fc <__printf+0x284>
    80009410:	00094503          	lbu	a0,0(s2)
    80009414:	e00514e3          	bnez	a0,8000921c <__printf+0xa4>
    80009418:	1a0c1663          	bnez	s8,800095c4 <__printf+0x44c>
    8000941c:	08813083          	ld	ra,136(sp)
    80009420:	08013403          	ld	s0,128(sp)
    80009424:	07813483          	ld	s1,120(sp)
    80009428:	07013903          	ld	s2,112(sp)
    8000942c:	06813983          	ld	s3,104(sp)
    80009430:	06013a03          	ld	s4,96(sp)
    80009434:	05813a83          	ld	s5,88(sp)
    80009438:	05013b03          	ld	s6,80(sp)
    8000943c:	04813b83          	ld	s7,72(sp)
    80009440:	04013c03          	ld	s8,64(sp)
    80009444:	03813c83          	ld	s9,56(sp)
    80009448:	03013d03          	ld	s10,48(sp)
    8000944c:	02813d83          	ld	s11,40(sp)
    80009450:	0d010113          	addi	sp,sp,208
    80009454:	00008067          	ret
    80009458:	07300713          	li	a4,115
    8000945c:	1ce78a63          	beq	a5,a4,80009630 <__printf+0x4b8>
    80009460:	07800713          	li	a4,120
    80009464:	1ee79e63          	bne	a5,a4,80009660 <__printf+0x4e8>
    80009468:	f7843783          	ld	a5,-136(s0)
    8000946c:	0007a703          	lw	a4,0(a5)
    80009470:	00878793          	addi	a5,a5,8
    80009474:	f6f43c23          	sd	a5,-136(s0)
    80009478:	28074263          	bltz	a4,800096fc <__printf+0x584>
    8000947c:	00002d97          	auipc	s11,0x2
    80009480:	624d8d93          	addi	s11,s11,1572 # 8000baa0 <digits>
    80009484:	00f77793          	andi	a5,a4,15
    80009488:	00fd87b3          	add	a5,s11,a5
    8000948c:	0007c683          	lbu	a3,0(a5)
    80009490:	00f00613          	li	a2,15
    80009494:	0007079b          	sext.w	a5,a4
    80009498:	f8d40023          	sb	a3,-128(s0)
    8000949c:	0047559b          	srliw	a1,a4,0x4
    800094a0:	0047569b          	srliw	a3,a4,0x4
    800094a4:	00000c93          	li	s9,0
    800094a8:	0ee65063          	bge	a2,a4,80009588 <__printf+0x410>
    800094ac:	00f6f693          	andi	a3,a3,15
    800094b0:	00dd86b3          	add	a3,s11,a3
    800094b4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800094b8:	0087d79b          	srliw	a5,a5,0x8
    800094bc:	00100c93          	li	s9,1
    800094c0:	f8d400a3          	sb	a3,-127(s0)
    800094c4:	0cb67263          	bgeu	a2,a1,80009588 <__printf+0x410>
    800094c8:	00f7f693          	andi	a3,a5,15
    800094cc:	00dd86b3          	add	a3,s11,a3
    800094d0:	0006c583          	lbu	a1,0(a3)
    800094d4:	00f00613          	li	a2,15
    800094d8:	0047d69b          	srliw	a3,a5,0x4
    800094dc:	f8b40123          	sb	a1,-126(s0)
    800094e0:	0047d593          	srli	a1,a5,0x4
    800094e4:	28f67e63          	bgeu	a2,a5,80009780 <__printf+0x608>
    800094e8:	00f6f693          	andi	a3,a3,15
    800094ec:	00dd86b3          	add	a3,s11,a3
    800094f0:	0006c503          	lbu	a0,0(a3)
    800094f4:	0087d813          	srli	a6,a5,0x8
    800094f8:	0087d69b          	srliw	a3,a5,0x8
    800094fc:	f8a401a3          	sb	a0,-125(s0)
    80009500:	28b67663          	bgeu	a2,a1,8000978c <__printf+0x614>
    80009504:	00f6f693          	andi	a3,a3,15
    80009508:	00dd86b3          	add	a3,s11,a3
    8000950c:	0006c583          	lbu	a1,0(a3)
    80009510:	00c7d513          	srli	a0,a5,0xc
    80009514:	00c7d69b          	srliw	a3,a5,0xc
    80009518:	f8b40223          	sb	a1,-124(s0)
    8000951c:	29067a63          	bgeu	a2,a6,800097b0 <__printf+0x638>
    80009520:	00f6f693          	andi	a3,a3,15
    80009524:	00dd86b3          	add	a3,s11,a3
    80009528:	0006c583          	lbu	a1,0(a3)
    8000952c:	0107d813          	srli	a6,a5,0x10
    80009530:	0107d69b          	srliw	a3,a5,0x10
    80009534:	f8b402a3          	sb	a1,-123(s0)
    80009538:	28a67263          	bgeu	a2,a0,800097bc <__printf+0x644>
    8000953c:	00f6f693          	andi	a3,a3,15
    80009540:	00dd86b3          	add	a3,s11,a3
    80009544:	0006c683          	lbu	a3,0(a3)
    80009548:	0147d79b          	srliw	a5,a5,0x14
    8000954c:	f8d40323          	sb	a3,-122(s0)
    80009550:	21067663          	bgeu	a2,a6,8000975c <__printf+0x5e4>
    80009554:	02079793          	slli	a5,a5,0x20
    80009558:	0207d793          	srli	a5,a5,0x20
    8000955c:	00fd8db3          	add	s11,s11,a5
    80009560:	000dc683          	lbu	a3,0(s11)
    80009564:	00800793          	li	a5,8
    80009568:	00700c93          	li	s9,7
    8000956c:	f8d403a3          	sb	a3,-121(s0)
    80009570:	00075c63          	bgez	a4,80009588 <__printf+0x410>
    80009574:	f9040713          	addi	a4,s0,-112
    80009578:	00f70733          	add	a4,a4,a5
    8000957c:	02d00693          	li	a3,45
    80009580:	fed70823          	sb	a3,-16(a4)
    80009584:	00078c93          	mv	s9,a5
    80009588:	f8040793          	addi	a5,s0,-128
    8000958c:	01978cb3          	add	s9,a5,s9
    80009590:	f7f40d13          	addi	s10,s0,-129
    80009594:	000cc503          	lbu	a0,0(s9)
    80009598:	fffc8c93          	addi	s9,s9,-1
    8000959c:	00000097          	auipc	ra,0x0
    800095a0:	9f8080e7          	jalr	-1544(ra) # 80008f94 <consputc>
    800095a4:	ff9d18e3          	bne	s10,s9,80009594 <__printf+0x41c>
    800095a8:	0100006f          	j	800095b8 <__printf+0x440>
    800095ac:	00000097          	auipc	ra,0x0
    800095b0:	9e8080e7          	jalr	-1560(ra) # 80008f94 <consputc>
    800095b4:	000c8493          	mv	s1,s9
    800095b8:	00094503          	lbu	a0,0(s2)
    800095bc:	c60510e3          	bnez	a0,8000921c <__printf+0xa4>
    800095c0:	e40c0ee3          	beqz	s8,8000941c <__printf+0x2a4>
    800095c4:	00006517          	auipc	a0,0x6
    800095c8:	dac50513          	addi	a0,a0,-596 # 8000f370 <pr>
    800095cc:	00001097          	auipc	ra,0x1
    800095d0:	94c080e7          	jalr	-1716(ra) # 80009f18 <release>
    800095d4:	e49ff06f          	j	8000941c <__printf+0x2a4>
    800095d8:	f7843783          	ld	a5,-136(s0)
    800095dc:	03000513          	li	a0,48
    800095e0:	01000d13          	li	s10,16
    800095e4:	00878713          	addi	a4,a5,8
    800095e8:	0007bc83          	ld	s9,0(a5)
    800095ec:	f6e43c23          	sd	a4,-136(s0)
    800095f0:	00000097          	auipc	ra,0x0
    800095f4:	9a4080e7          	jalr	-1628(ra) # 80008f94 <consputc>
    800095f8:	07800513          	li	a0,120
    800095fc:	00000097          	auipc	ra,0x0
    80009600:	998080e7          	jalr	-1640(ra) # 80008f94 <consputc>
    80009604:	00002d97          	auipc	s11,0x2
    80009608:	49cd8d93          	addi	s11,s11,1180 # 8000baa0 <digits>
    8000960c:	03ccd793          	srli	a5,s9,0x3c
    80009610:	00fd87b3          	add	a5,s11,a5
    80009614:	0007c503          	lbu	a0,0(a5)
    80009618:	fffd0d1b          	addiw	s10,s10,-1
    8000961c:	004c9c93          	slli	s9,s9,0x4
    80009620:	00000097          	auipc	ra,0x0
    80009624:	974080e7          	jalr	-1676(ra) # 80008f94 <consputc>
    80009628:	fe0d12e3          	bnez	s10,8000960c <__printf+0x494>
    8000962c:	f8dff06f          	j	800095b8 <__printf+0x440>
    80009630:	f7843783          	ld	a5,-136(s0)
    80009634:	0007bc83          	ld	s9,0(a5)
    80009638:	00878793          	addi	a5,a5,8
    8000963c:	f6f43c23          	sd	a5,-136(s0)
    80009640:	000c9a63          	bnez	s9,80009654 <__printf+0x4dc>
    80009644:	1080006f          	j	8000974c <__printf+0x5d4>
    80009648:	001c8c93          	addi	s9,s9,1
    8000964c:	00000097          	auipc	ra,0x0
    80009650:	948080e7          	jalr	-1720(ra) # 80008f94 <consputc>
    80009654:	000cc503          	lbu	a0,0(s9)
    80009658:	fe0518e3          	bnez	a0,80009648 <__printf+0x4d0>
    8000965c:	f5dff06f          	j	800095b8 <__printf+0x440>
    80009660:	02500513          	li	a0,37
    80009664:	00000097          	auipc	ra,0x0
    80009668:	930080e7          	jalr	-1744(ra) # 80008f94 <consputc>
    8000966c:	000c8513          	mv	a0,s9
    80009670:	00000097          	auipc	ra,0x0
    80009674:	924080e7          	jalr	-1756(ra) # 80008f94 <consputc>
    80009678:	f41ff06f          	j	800095b8 <__printf+0x440>
    8000967c:	02500513          	li	a0,37
    80009680:	00000097          	auipc	ra,0x0
    80009684:	914080e7          	jalr	-1772(ra) # 80008f94 <consputc>
    80009688:	f31ff06f          	j	800095b8 <__printf+0x440>
    8000968c:	00030513          	mv	a0,t1
    80009690:	00000097          	auipc	ra,0x0
    80009694:	7bc080e7          	jalr	1980(ra) # 80009e4c <acquire>
    80009698:	b4dff06f          	j	800091e4 <__printf+0x6c>
    8000969c:	40c0053b          	negw	a0,a2
    800096a0:	00a00713          	li	a4,10
    800096a4:	02e576bb          	remuw	a3,a0,a4
    800096a8:	00002d97          	auipc	s11,0x2
    800096ac:	3f8d8d93          	addi	s11,s11,1016 # 8000baa0 <digits>
    800096b0:	ff700593          	li	a1,-9
    800096b4:	02069693          	slli	a3,a3,0x20
    800096b8:	0206d693          	srli	a3,a3,0x20
    800096bc:	00dd86b3          	add	a3,s11,a3
    800096c0:	0006c683          	lbu	a3,0(a3)
    800096c4:	02e557bb          	divuw	a5,a0,a4
    800096c8:	f8d40023          	sb	a3,-128(s0)
    800096cc:	10b65e63          	bge	a2,a1,800097e8 <__printf+0x670>
    800096d0:	06300593          	li	a1,99
    800096d4:	02e7f6bb          	remuw	a3,a5,a4
    800096d8:	02069693          	slli	a3,a3,0x20
    800096dc:	0206d693          	srli	a3,a3,0x20
    800096e0:	00dd86b3          	add	a3,s11,a3
    800096e4:	0006c683          	lbu	a3,0(a3)
    800096e8:	02e7d73b          	divuw	a4,a5,a4
    800096ec:	00200793          	li	a5,2
    800096f0:	f8d400a3          	sb	a3,-127(s0)
    800096f4:	bca5ece3          	bltu	a1,a0,800092cc <__printf+0x154>
    800096f8:	ce5ff06f          	j	800093dc <__printf+0x264>
    800096fc:	40e007bb          	negw	a5,a4
    80009700:	00002d97          	auipc	s11,0x2
    80009704:	3a0d8d93          	addi	s11,s11,928 # 8000baa0 <digits>
    80009708:	00f7f693          	andi	a3,a5,15
    8000970c:	00dd86b3          	add	a3,s11,a3
    80009710:	0006c583          	lbu	a1,0(a3)
    80009714:	ff100613          	li	a2,-15
    80009718:	0047d69b          	srliw	a3,a5,0x4
    8000971c:	f8b40023          	sb	a1,-128(s0)
    80009720:	0047d59b          	srliw	a1,a5,0x4
    80009724:	0ac75e63          	bge	a4,a2,800097e0 <__printf+0x668>
    80009728:	00f6f693          	andi	a3,a3,15
    8000972c:	00dd86b3          	add	a3,s11,a3
    80009730:	0006c603          	lbu	a2,0(a3)
    80009734:	00f00693          	li	a3,15
    80009738:	0087d79b          	srliw	a5,a5,0x8
    8000973c:	f8c400a3          	sb	a2,-127(s0)
    80009740:	d8b6e4e3          	bltu	a3,a1,800094c8 <__printf+0x350>
    80009744:	00200793          	li	a5,2
    80009748:	e2dff06f          	j	80009574 <__printf+0x3fc>
    8000974c:	00002c97          	auipc	s9,0x2
    80009750:	334c8c93          	addi	s9,s9,820 # 8000ba80 <CONSOLE_STATUS+0xa70>
    80009754:	02800513          	li	a0,40
    80009758:	ef1ff06f          	j	80009648 <__printf+0x4d0>
    8000975c:	00700793          	li	a5,7
    80009760:	00600c93          	li	s9,6
    80009764:	e0dff06f          	j	80009570 <__printf+0x3f8>
    80009768:	00700793          	li	a5,7
    8000976c:	00600c93          	li	s9,6
    80009770:	c69ff06f          	j	800093d8 <__printf+0x260>
    80009774:	00300793          	li	a5,3
    80009778:	00200c93          	li	s9,2
    8000977c:	c5dff06f          	j	800093d8 <__printf+0x260>
    80009780:	00300793          	li	a5,3
    80009784:	00200c93          	li	s9,2
    80009788:	de9ff06f          	j	80009570 <__printf+0x3f8>
    8000978c:	00400793          	li	a5,4
    80009790:	00300c93          	li	s9,3
    80009794:	dddff06f          	j	80009570 <__printf+0x3f8>
    80009798:	00400793          	li	a5,4
    8000979c:	00300c93          	li	s9,3
    800097a0:	c39ff06f          	j	800093d8 <__printf+0x260>
    800097a4:	00500793          	li	a5,5
    800097a8:	00400c93          	li	s9,4
    800097ac:	c2dff06f          	j	800093d8 <__printf+0x260>
    800097b0:	00500793          	li	a5,5
    800097b4:	00400c93          	li	s9,4
    800097b8:	db9ff06f          	j	80009570 <__printf+0x3f8>
    800097bc:	00600793          	li	a5,6
    800097c0:	00500c93          	li	s9,5
    800097c4:	dadff06f          	j	80009570 <__printf+0x3f8>
    800097c8:	00600793          	li	a5,6
    800097cc:	00500c93          	li	s9,5
    800097d0:	c09ff06f          	j	800093d8 <__printf+0x260>
    800097d4:	00800793          	li	a5,8
    800097d8:	00700c93          	li	s9,7
    800097dc:	bfdff06f          	j	800093d8 <__printf+0x260>
    800097e0:	00100793          	li	a5,1
    800097e4:	d91ff06f          	j	80009574 <__printf+0x3fc>
    800097e8:	00100793          	li	a5,1
    800097ec:	bf1ff06f          	j	800093dc <__printf+0x264>
    800097f0:	00900793          	li	a5,9
    800097f4:	00800c93          	li	s9,8
    800097f8:	be1ff06f          	j	800093d8 <__printf+0x260>
    800097fc:	00002517          	auipc	a0,0x2
    80009800:	28c50513          	addi	a0,a0,652 # 8000ba88 <CONSOLE_STATUS+0xa78>
    80009804:	00000097          	auipc	ra,0x0
    80009808:	918080e7          	jalr	-1768(ra) # 8000911c <panic>

000000008000980c <printfinit>:
    8000980c:	fe010113          	addi	sp,sp,-32
    80009810:	00813823          	sd	s0,16(sp)
    80009814:	00913423          	sd	s1,8(sp)
    80009818:	00113c23          	sd	ra,24(sp)
    8000981c:	02010413          	addi	s0,sp,32
    80009820:	00006497          	auipc	s1,0x6
    80009824:	b5048493          	addi	s1,s1,-1200 # 8000f370 <pr>
    80009828:	00048513          	mv	a0,s1
    8000982c:	00002597          	auipc	a1,0x2
    80009830:	26c58593          	addi	a1,a1,620 # 8000ba98 <CONSOLE_STATUS+0xa88>
    80009834:	00000097          	auipc	ra,0x0
    80009838:	5f4080e7          	jalr	1524(ra) # 80009e28 <initlock>
    8000983c:	01813083          	ld	ra,24(sp)
    80009840:	01013403          	ld	s0,16(sp)
    80009844:	0004ac23          	sw	zero,24(s1)
    80009848:	00813483          	ld	s1,8(sp)
    8000984c:	02010113          	addi	sp,sp,32
    80009850:	00008067          	ret

0000000080009854 <uartinit>:
    80009854:	ff010113          	addi	sp,sp,-16
    80009858:	00813423          	sd	s0,8(sp)
    8000985c:	01010413          	addi	s0,sp,16
    80009860:	100007b7          	lui	a5,0x10000
    80009864:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80009868:	f8000713          	li	a4,-128
    8000986c:	00e781a3          	sb	a4,3(a5)
    80009870:	00300713          	li	a4,3
    80009874:	00e78023          	sb	a4,0(a5)
    80009878:	000780a3          	sb	zero,1(a5)
    8000987c:	00e781a3          	sb	a4,3(a5)
    80009880:	00700693          	li	a3,7
    80009884:	00d78123          	sb	a3,2(a5)
    80009888:	00e780a3          	sb	a4,1(a5)
    8000988c:	00813403          	ld	s0,8(sp)
    80009890:	01010113          	addi	sp,sp,16
    80009894:	00008067          	ret

0000000080009898 <uartputc>:
    80009898:	00005797          	auipc	a5,0x5
    8000989c:	8007a783          	lw	a5,-2048(a5) # 8000e098 <panicked>
    800098a0:	00078463          	beqz	a5,800098a8 <uartputc+0x10>
    800098a4:	0000006f          	j	800098a4 <uartputc+0xc>
    800098a8:	fd010113          	addi	sp,sp,-48
    800098ac:	02813023          	sd	s0,32(sp)
    800098b0:	00913c23          	sd	s1,24(sp)
    800098b4:	01213823          	sd	s2,16(sp)
    800098b8:	01313423          	sd	s3,8(sp)
    800098bc:	02113423          	sd	ra,40(sp)
    800098c0:	03010413          	addi	s0,sp,48
    800098c4:	00004917          	auipc	s2,0x4
    800098c8:	7dc90913          	addi	s2,s2,2012 # 8000e0a0 <uart_tx_r>
    800098cc:	00093783          	ld	a5,0(s2)
    800098d0:	00004497          	auipc	s1,0x4
    800098d4:	7d848493          	addi	s1,s1,2008 # 8000e0a8 <uart_tx_w>
    800098d8:	0004b703          	ld	a4,0(s1)
    800098dc:	02078693          	addi	a3,a5,32
    800098e0:	00050993          	mv	s3,a0
    800098e4:	02e69c63          	bne	a3,a4,8000991c <uartputc+0x84>
    800098e8:	00001097          	auipc	ra,0x1
    800098ec:	834080e7          	jalr	-1996(ra) # 8000a11c <push_on>
    800098f0:	00093783          	ld	a5,0(s2)
    800098f4:	0004b703          	ld	a4,0(s1)
    800098f8:	02078793          	addi	a5,a5,32
    800098fc:	00e79463          	bne	a5,a4,80009904 <uartputc+0x6c>
    80009900:	0000006f          	j	80009900 <uartputc+0x68>
    80009904:	00001097          	auipc	ra,0x1
    80009908:	88c080e7          	jalr	-1908(ra) # 8000a190 <pop_on>
    8000990c:	00093783          	ld	a5,0(s2)
    80009910:	0004b703          	ld	a4,0(s1)
    80009914:	02078693          	addi	a3,a5,32
    80009918:	fce688e3          	beq	a3,a4,800098e8 <uartputc+0x50>
    8000991c:	01f77693          	andi	a3,a4,31
    80009920:	00006597          	auipc	a1,0x6
    80009924:	a7058593          	addi	a1,a1,-1424 # 8000f390 <uart_tx_buf>
    80009928:	00d586b3          	add	a3,a1,a3
    8000992c:	00170713          	addi	a4,a4,1
    80009930:	01368023          	sb	s3,0(a3)
    80009934:	00e4b023          	sd	a4,0(s1)
    80009938:	10000637          	lui	a2,0x10000
    8000993c:	02f71063          	bne	a4,a5,8000995c <uartputc+0xc4>
    80009940:	0340006f          	j	80009974 <uartputc+0xdc>
    80009944:	00074703          	lbu	a4,0(a4)
    80009948:	00f93023          	sd	a5,0(s2)
    8000994c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80009950:	00093783          	ld	a5,0(s2)
    80009954:	0004b703          	ld	a4,0(s1)
    80009958:	00f70e63          	beq	a4,a5,80009974 <uartputc+0xdc>
    8000995c:	00564683          	lbu	a3,5(a2)
    80009960:	01f7f713          	andi	a4,a5,31
    80009964:	00e58733          	add	a4,a1,a4
    80009968:	0206f693          	andi	a3,a3,32
    8000996c:	00178793          	addi	a5,a5,1
    80009970:	fc069ae3          	bnez	a3,80009944 <uartputc+0xac>
    80009974:	02813083          	ld	ra,40(sp)
    80009978:	02013403          	ld	s0,32(sp)
    8000997c:	01813483          	ld	s1,24(sp)
    80009980:	01013903          	ld	s2,16(sp)
    80009984:	00813983          	ld	s3,8(sp)
    80009988:	03010113          	addi	sp,sp,48
    8000998c:	00008067          	ret

0000000080009990 <uartputc_sync>:
    80009990:	ff010113          	addi	sp,sp,-16
    80009994:	00813423          	sd	s0,8(sp)
    80009998:	01010413          	addi	s0,sp,16
    8000999c:	00004717          	auipc	a4,0x4
    800099a0:	6fc72703          	lw	a4,1788(a4) # 8000e098 <panicked>
    800099a4:	02071663          	bnez	a4,800099d0 <uartputc_sync+0x40>
    800099a8:	00050793          	mv	a5,a0
    800099ac:	100006b7          	lui	a3,0x10000
    800099b0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800099b4:	02077713          	andi	a4,a4,32
    800099b8:	fe070ce3          	beqz	a4,800099b0 <uartputc_sync+0x20>
    800099bc:	0ff7f793          	andi	a5,a5,255
    800099c0:	00f68023          	sb	a5,0(a3)
    800099c4:	00813403          	ld	s0,8(sp)
    800099c8:	01010113          	addi	sp,sp,16
    800099cc:	00008067          	ret
    800099d0:	0000006f          	j	800099d0 <uartputc_sync+0x40>

00000000800099d4 <uartstart>:
    800099d4:	ff010113          	addi	sp,sp,-16
    800099d8:	00813423          	sd	s0,8(sp)
    800099dc:	01010413          	addi	s0,sp,16
    800099e0:	00004617          	auipc	a2,0x4
    800099e4:	6c060613          	addi	a2,a2,1728 # 8000e0a0 <uart_tx_r>
    800099e8:	00004517          	auipc	a0,0x4
    800099ec:	6c050513          	addi	a0,a0,1728 # 8000e0a8 <uart_tx_w>
    800099f0:	00063783          	ld	a5,0(a2)
    800099f4:	00053703          	ld	a4,0(a0)
    800099f8:	04f70263          	beq	a4,a5,80009a3c <uartstart+0x68>
    800099fc:	100005b7          	lui	a1,0x10000
    80009a00:	00006817          	auipc	a6,0x6
    80009a04:	99080813          	addi	a6,a6,-1648 # 8000f390 <uart_tx_buf>
    80009a08:	01c0006f          	j	80009a24 <uartstart+0x50>
    80009a0c:	0006c703          	lbu	a4,0(a3)
    80009a10:	00f63023          	sd	a5,0(a2)
    80009a14:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009a18:	00063783          	ld	a5,0(a2)
    80009a1c:	00053703          	ld	a4,0(a0)
    80009a20:	00f70e63          	beq	a4,a5,80009a3c <uartstart+0x68>
    80009a24:	01f7f713          	andi	a4,a5,31
    80009a28:	00e806b3          	add	a3,a6,a4
    80009a2c:	0055c703          	lbu	a4,5(a1)
    80009a30:	00178793          	addi	a5,a5,1
    80009a34:	02077713          	andi	a4,a4,32
    80009a38:	fc071ae3          	bnez	a4,80009a0c <uartstart+0x38>
    80009a3c:	00813403          	ld	s0,8(sp)
    80009a40:	01010113          	addi	sp,sp,16
    80009a44:	00008067          	ret

0000000080009a48 <uartgetc>:
    80009a48:	ff010113          	addi	sp,sp,-16
    80009a4c:	00813423          	sd	s0,8(sp)
    80009a50:	01010413          	addi	s0,sp,16
    80009a54:	10000737          	lui	a4,0x10000
    80009a58:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80009a5c:	0017f793          	andi	a5,a5,1
    80009a60:	00078c63          	beqz	a5,80009a78 <uartgetc+0x30>
    80009a64:	00074503          	lbu	a0,0(a4)
    80009a68:	0ff57513          	andi	a0,a0,255
    80009a6c:	00813403          	ld	s0,8(sp)
    80009a70:	01010113          	addi	sp,sp,16
    80009a74:	00008067          	ret
    80009a78:	fff00513          	li	a0,-1
    80009a7c:	ff1ff06f          	j	80009a6c <uartgetc+0x24>

0000000080009a80 <uartintr>:
    80009a80:	100007b7          	lui	a5,0x10000
    80009a84:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80009a88:	0017f793          	andi	a5,a5,1
    80009a8c:	0a078463          	beqz	a5,80009b34 <uartintr+0xb4>
    80009a90:	fe010113          	addi	sp,sp,-32
    80009a94:	00813823          	sd	s0,16(sp)
    80009a98:	00913423          	sd	s1,8(sp)
    80009a9c:	00113c23          	sd	ra,24(sp)
    80009aa0:	02010413          	addi	s0,sp,32
    80009aa4:	100004b7          	lui	s1,0x10000
    80009aa8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80009aac:	0ff57513          	andi	a0,a0,255
    80009ab0:	fffff097          	auipc	ra,0xfffff
    80009ab4:	534080e7          	jalr	1332(ra) # 80008fe4 <consoleintr>
    80009ab8:	0054c783          	lbu	a5,5(s1)
    80009abc:	0017f793          	andi	a5,a5,1
    80009ac0:	fe0794e3          	bnez	a5,80009aa8 <uartintr+0x28>
    80009ac4:	00004617          	auipc	a2,0x4
    80009ac8:	5dc60613          	addi	a2,a2,1500 # 8000e0a0 <uart_tx_r>
    80009acc:	00004517          	auipc	a0,0x4
    80009ad0:	5dc50513          	addi	a0,a0,1500 # 8000e0a8 <uart_tx_w>
    80009ad4:	00063783          	ld	a5,0(a2)
    80009ad8:	00053703          	ld	a4,0(a0)
    80009adc:	04f70263          	beq	a4,a5,80009b20 <uartintr+0xa0>
    80009ae0:	100005b7          	lui	a1,0x10000
    80009ae4:	00006817          	auipc	a6,0x6
    80009ae8:	8ac80813          	addi	a6,a6,-1876 # 8000f390 <uart_tx_buf>
    80009aec:	01c0006f          	j	80009b08 <uartintr+0x88>
    80009af0:	0006c703          	lbu	a4,0(a3)
    80009af4:	00f63023          	sd	a5,0(a2)
    80009af8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009afc:	00063783          	ld	a5,0(a2)
    80009b00:	00053703          	ld	a4,0(a0)
    80009b04:	00f70e63          	beq	a4,a5,80009b20 <uartintr+0xa0>
    80009b08:	01f7f713          	andi	a4,a5,31
    80009b0c:	00e806b3          	add	a3,a6,a4
    80009b10:	0055c703          	lbu	a4,5(a1)
    80009b14:	00178793          	addi	a5,a5,1
    80009b18:	02077713          	andi	a4,a4,32
    80009b1c:	fc071ae3          	bnez	a4,80009af0 <uartintr+0x70>
    80009b20:	01813083          	ld	ra,24(sp)
    80009b24:	01013403          	ld	s0,16(sp)
    80009b28:	00813483          	ld	s1,8(sp)
    80009b2c:	02010113          	addi	sp,sp,32
    80009b30:	00008067          	ret
    80009b34:	00004617          	auipc	a2,0x4
    80009b38:	56c60613          	addi	a2,a2,1388 # 8000e0a0 <uart_tx_r>
    80009b3c:	00004517          	auipc	a0,0x4
    80009b40:	56c50513          	addi	a0,a0,1388 # 8000e0a8 <uart_tx_w>
    80009b44:	00063783          	ld	a5,0(a2)
    80009b48:	00053703          	ld	a4,0(a0)
    80009b4c:	04f70263          	beq	a4,a5,80009b90 <uartintr+0x110>
    80009b50:	100005b7          	lui	a1,0x10000
    80009b54:	00006817          	auipc	a6,0x6
    80009b58:	83c80813          	addi	a6,a6,-1988 # 8000f390 <uart_tx_buf>
    80009b5c:	01c0006f          	j	80009b78 <uartintr+0xf8>
    80009b60:	0006c703          	lbu	a4,0(a3)
    80009b64:	00f63023          	sd	a5,0(a2)
    80009b68:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009b6c:	00063783          	ld	a5,0(a2)
    80009b70:	00053703          	ld	a4,0(a0)
    80009b74:	02f70063          	beq	a4,a5,80009b94 <uartintr+0x114>
    80009b78:	01f7f713          	andi	a4,a5,31
    80009b7c:	00e806b3          	add	a3,a6,a4
    80009b80:	0055c703          	lbu	a4,5(a1)
    80009b84:	00178793          	addi	a5,a5,1
    80009b88:	02077713          	andi	a4,a4,32
    80009b8c:	fc071ae3          	bnez	a4,80009b60 <uartintr+0xe0>
    80009b90:	00008067          	ret
    80009b94:	00008067          	ret

0000000080009b98 <kinit>:
    80009b98:	fc010113          	addi	sp,sp,-64
    80009b9c:	02913423          	sd	s1,40(sp)
    80009ba0:	fffff7b7          	lui	a5,0xfffff
    80009ba4:	00007497          	auipc	s1,0x7
    80009ba8:	80b48493          	addi	s1,s1,-2037 # 800103af <end+0xfff>
    80009bac:	02813823          	sd	s0,48(sp)
    80009bb0:	01313c23          	sd	s3,24(sp)
    80009bb4:	00f4f4b3          	and	s1,s1,a5
    80009bb8:	02113c23          	sd	ra,56(sp)
    80009bbc:	03213023          	sd	s2,32(sp)
    80009bc0:	01413823          	sd	s4,16(sp)
    80009bc4:	01513423          	sd	s5,8(sp)
    80009bc8:	04010413          	addi	s0,sp,64
    80009bcc:	000017b7          	lui	a5,0x1
    80009bd0:	01100993          	li	s3,17
    80009bd4:	00f487b3          	add	a5,s1,a5
    80009bd8:	01b99993          	slli	s3,s3,0x1b
    80009bdc:	06f9e063          	bltu	s3,a5,80009c3c <kinit+0xa4>
    80009be0:	00005a97          	auipc	s5,0x5
    80009be4:	7d0a8a93          	addi	s5,s5,2000 # 8000f3b0 <end>
    80009be8:	0754ec63          	bltu	s1,s5,80009c60 <kinit+0xc8>
    80009bec:	0734fa63          	bgeu	s1,s3,80009c60 <kinit+0xc8>
    80009bf0:	00088a37          	lui	s4,0x88
    80009bf4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80009bf8:	00004917          	auipc	s2,0x4
    80009bfc:	4b890913          	addi	s2,s2,1208 # 8000e0b0 <kmem>
    80009c00:	00ca1a13          	slli	s4,s4,0xc
    80009c04:	0140006f          	j	80009c18 <kinit+0x80>
    80009c08:	000017b7          	lui	a5,0x1
    80009c0c:	00f484b3          	add	s1,s1,a5
    80009c10:	0554e863          	bltu	s1,s5,80009c60 <kinit+0xc8>
    80009c14:	0534f663          	bgeu	s1,s3,80009c60 <kinit+0xc8>
    80009c18:	00001637          	lui	a2,0x1
    80009c1c:	00100593          	li	a1,1
    80009c20:	00048513          	mv	a0,s1
    80009c24:	00000097          	auipc	ra,0x0
    80009c28:	5e4080e7          	jalr	1508(ra) # 8000a208 <__memset>
    80009c2c:	00093783          	ld	a5,0(s2)
    80009c30:	00f4b023          	sd	a5,0(s1)
    80009c34:	00993023          	sd	s1,0(s2)
    80009c38:	fd4498e3          	bne	s1,s4,80009c08 <kinit+0x70>
    80009c3c:	03813083          	ld	ra,56(sp)
    80009c40:	03013403          	ld	s0,48(sp)
    80009c44:	02813483          	ld	s1,40(sp)
    80009c48:	02013903          	ld	s2,32(sp)
    80009c4c:	01813983          	ld	s3,24(sp)
    80009c50:	01013a03          	ld	s4,16(sp)
    80009c54:	00813a83          	ld	s5,8(sp)
    80009c58:	04010113          	addi	sp,sp,64
    80009c5c:	00008067          	ret
    80009c60:	00002517          	auipc	a0,0x2
    80009c64:	e5850513          	addi	a0,a0,-424 # 8000bab8 <digits+0x18>
    80009c68:	fffff097          	auipc	ra,0xfffff
    80009c6c:	4b4080e7          	jalr	1204(ra) # 8000911c <panic>

0000000080009c70 <freerange>:
    80009c70:	fc010113          	addi	sp,sp,-64
    80009c74:	000017b7          	lui	a5,0x1
    80009c78:	02913423          	sd	s1,40(sp)
    80009c7c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80009c80:	009504b3          	add	s1,a0,s1
    80009c84:	fffff537          	lui	a0,0xfffff
    80009c88:	02813823          	sd	s0,48(sp)
    80009c8c:	02113c23          	sd	ra,56(sp)
    80009c90:	03213023          	sd	s2,32(sp)
    80009c94:	01313c23          	sd	s3,24(sp)
    80009c98:	01413823          	sd	s4,16(sp)
    80009c9c:	01513423          	sd	s5,8(sp)
    80009ca0:	01613023          	sd	s6,0(sp)
    80009ca4:	04010413          	addi	s0,sp,64
    80009ca8:	00a4f4b3          	and	s1,s1,a0
    80009cac:	00f487b3          	add	a5,s1,a5
    80009cb0:	06f5e463          	bltu	a1,a5,80009d18 <freerange+0xa8>
    80009cb4:	00005a97          	auipc	s5,0x5
    80009cb8:	6fca8a93          	addi	s5,s5,1788 # 8000f3b0 <end>
    80009cbc:	0954e263          	bltu	s1,s5,80009d40 <freerange+0xd0>
    80009cc0:	01100993          	li	s3,17
    80009cc4:	01b99993          	slli	s3,s3,0x1b
    80009cc8:	0734fc63          	bgeu	s1,s3,80009d40 <freerange+0xd0>
    80009ccc:	00058a13          	mv	s4,a1
    80009cd0:	00004917          	auipc	s2,0x4
    80009cd4:	3e090913          	addi	s2,s2,992 # 8000e0b0 <kmem>
    80009cd8:	00002b37          	lui	s6,0x2
    80009cdc:	0140006f          	j	80009cf0 <freerange+0x80>
    80009ce0:	000017b7          	lui	a5,0x1
    80009ce4:	00f484b3          	add	s1,s1,a5
    80009ce8:	0554ec63          	bltu	s1,s5,80009d40 <freerange+0xd0>
    80009cec:	0534fa63          	bgeu	s1,s3,80009d40 <freerange+0xd0>
    80009cf0:	00001637          	lui	a2,0x1
    80009cf4:	00100593          	li	a1,1
    80009cf8:	00048513          	mv	a0,s1
    80009cfc:	00000097          	auipc	ra,0x0
    80009d00:	50c080e7          	jalr	1292(ra) # 8000a208 <__memset>
    80009d04:	00093703          	ld	a4,0(s2)
    80009d08:	016487b3          	add	a5,s1,s6
    80009d0c:	00e4b023          	sd	a4,0(s1)
    80009d10:	00993023          	sd	s1,0(s2)
    80009d14:	fcfa76e3          	bgeu	s4,a5,80009ce0 <freerange+0x70>
    80009d18:	03813083          	ld	ra,56(sp)
    80009d1c:	03013403          	ld	s0,48(sp)
    80009d20:	02813483          	ld	s1,40(sp)
    80009d24:	02013903          	ld	s2,32(sp)
    80009d28:	01813983          	ld	s3,24(sp)
    80009d2c:	01013a03          	ld	s4,16(sp)
    80009d30:	00813a83          	ld	s5,8(sp)
    80009d34:	00013b03          	ld	s6,0(sp)
    80009d38:	04010113          	addi	sp,sp,64
    80009d3c:	00008067          	ret
    80009d40:	00002517          	auipc	a0,0x2
    80009d44:	d7850513          	addi	a0,a0,-648 # 8000bab8 <digits+0x18>
    80009d48:	fffff097          	auipc	ra,0xfffff
    80009d4c:	3d4080e7          	jalr	980(ra) # 8000911c <panic>

0000000080009d50 <kfree>:
    80009d50:	fe010113          	addi	sp,sp,-32
    80009d54:	00813823          	sd	s0,16(sp)
    80009d58:	00113c23          	sd	ra,24(sp)
    80009d5c:	00913423          	sd	s1,8(sp)
    80009d60:	02010413          	addi	s0,sp,32
    80009d64:	03451793          	slli	a5,a0,0x34
    80009d68:	04079c63          	bnez	a5,80009dc0 <kfree+0x70>
    80009d6c:	00005797          	auipc	a5,0x5
    80009d70:	64478793          	addi	a5,a5,1604 # 8000f3b0 <end>
    80009d74:	00050493          	mv	s1,a0
    80009d78:	04f56463          	bltu	a0,a5,80009dc0 <kfree+0x70>
    80009d7c:	01100793          	li	a5,17
    80009d80:	01b79793          	slli	a5,a5,0x1b
    80009d84:	02f57e63          	bgeu	a0,a5,80009dc0 <kfree+0x70>
    80009d88:	00001637          	lui	a2,0x1
    80009d8c:	00100593          	li	a1,1
    80009d90:	00000097          	auipc	ra,0x0
    80009d94:	478080e7          	jalr	1144(ra) # 8000a208 <__memset>
    80009d98:	00004797          	auipc	a5,0x4
    80009d9c:	31878793          	addi	a5,a5,792 # 8000e0b0 <kmem>
    80009da0:	0007b703          	ld	a4,0(a5)
    80009da4:	01813083          	ld	ra,24(sp)
    80009da8:	01013403          	ld	s0,16(sp)
    80009dac:	00e4b023          	sd	a4,0(s1)
    80009db0:	0097b023          	sd	s1,0(a5)
    80009db4:	00813483          	ld	s1,8(sp)
    80009db8:	02010113          	addi	sp,sp,32
    80009dbc:	00008067          	ret
    80009dc0:	00002517          	auipc	a0,0x2
    80009dc4:	cf850513          	addi	a0,a0,-776 # 8000bab8 <digits+0x18>
    80009dc8:	fffff097          	auipc	ra,0xfffff
    80009dcc:	354080e7          	jalr	852(ra) # 8000911c <panic>

0000000080009dd0 <kalloc>:
    80009dd0:	fe010113          	addi	sp,sp,-32
    80009dd4:	00813823          	sd	s0,16(sp)
    80009dd8:	00913423          	sd	s1,8(sp)
    80009ddc:	00113c23          	sd	ra,24(sp)
    80009de0:	02010413          	addi	s0,sp,32
    80009de4:	00004797          	auipc	a5,0x4
    80009de8:	2cc78793          	addi	a5,a5,716 # 8000e0b0 <kmem>
    80009dec:	0007b483          	ld	s1,0(a5)
    80009df0:	02048063          	beqz	s1,80009e10 <kalloc+0x40>
    80009df4:	0004b703          	ld	a4,0(s1)
    80009df8:	00001637          	lui	a2,0x1
    80009dfc:	00500593          	li	a1,5
    80009e00:	00048513          	mv	a0,s1
    80009e04:	00e7b023          	sd	a4,0(a5)
    80009e08:	00000097          	auipc	ra,0x0
    80009e0c:	400080e7          	jalr	1024(ra) # 8000a208 <__memset>
    80009e10:	01813083          	ld	ra,24(sp)
    80009e14:	01013403          	ld	s0,16(sp)
    80009e18:	00048513          	mv	a0,s1
    80009e1c:	00813483          	ld	s1,8(sp)
    80009e20:	02010113          	addi	sp,sp,32
    80009e24:	00008067          	ret

0000000080009e28 <initlock>:
    80009e28:	ff010113          	addi	sp,sp,-16
    80009e2c:	00813423          	sd	s0,8(sp)
    80009e30:	01010413          	addi	s0,sp,16
    80009e34:	00813403          	ld	s0,8(sp)
    80009e38:	00b53423          	sd	a1,8(a0)
    80009e3c:	00052023          	sw	zero,0(a0)
    80009e40:	00053823          	sd	zero,16(a0)
    80009e44:	01010113          	addi	sp,sp,16
    80009e48:	00008067          	ret

0000000080009e4c <acquire>:
    80009e4c:	fe010113          	addi	sp,sp,-32
    80009e50:	00813823          	sd	s0,16(sp)
    80009e54:	00913423          	sd	s1,8(sp)
    80009e58:	00113c23          	sd	ra,24(sp)
    80009e5c:	01213023          	sd	s2,0(sp)
    80009e60:	02010413          	addi	s0,sp,32
    80009e64:	00050493          	mv	s1,a0
    80009e68:	10002973          	csrr	s2,sstatus
    80009e6c:	100027f3          	csrr	a5,sstatus
    80009e70:	ffd7f793          	andi	a5,a5,-3
    80009e74:	10079073          	csrw	sstatus,a5
    80009e78:	fffff097          	auipc	ra,0xfffff
    80009e7c:	8e0080e7          	jalr	-1824(ra) # 80008758 <mycpu>
    80009e80:	07852783          	lw	a5,120(a0)
    80009e84:	06078e63          	beqz	a5,80009f00 <acquire+0xb4>
    80009e88:	fffff097          	auipc	ra,0xfffff
    80009e8c:	8d0080e7          	jalr	-1840(ra) # 80008758 <mycpu>
    80009e90:	07852783          	lw	a5,120(a0)
    80009e94:	0004a703          	lw	a4,0(s1)
    80009e98:	0017879b          	addiw	a5,a5,1
    80009e9c:	06f52c23          	sw	a5,120(a0)
    80009ea0:	04071063          	bnez	a4,80009ee0 <acquire+0x94>
    80009ea4:	00100713          	li	a4,1
    80009ea8:	00070793          	mv	a5,a4
    80009eac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80009eb0:	0007879b          	sext.w	a5,a5
    80009eb4:	fe079ae3          	bnez	a5,80009ea8 <acquire+0x5c>
    80009eb8:	0ff0000f          	fence
    80009ebc:	fffff097          	auipc	ra,0xfffff
    80009ec0:	89c080e7          	jalr	-1892(ra) # 80008758 <mycpu>
    80009ec4:	01813083          	ld	ra,24(sp)
    80009ec8:	01013403          	ld	s0,16(sp)
    80009ecc:	00a4b823          	sd	a0,16(s1)
    80009ed0:	00013903          	ld	s2,0(sp)
    80009ed4:	00813483          	ld	s1,8(sp)
    80009ed8:	02010113          	addi	sp,sp,32
    80009edc:	00008067          	ret
    80009ee0:	0104b903          	ld	s2,16(s1)
    80009ee4:	fffff097          	auipc	ra,0xfffff
    80009ee8:	874080e7          	jalr	-1932(ra) # 80008758 <mycpu>
    80009eec:	faa91ce3          	bne	s2,a0,80009ea4 <acquire+0x58>
    80009ef0:	00002517          	auipc	a0,0x2
    80009ef4:	bd050513          	addi	a0,a0,-1072 # 8000bac0 <digits+0x20>
    80009ef8:	fffff097          	auipc	ra,0xfffff
    80009efc:	224080e7          	jalr	548(ra) # 8000911c <panic>
    80009f00:	00195913          	srli	s2,s2,0x1
    80009f04:	fffff097          	auipc	ra,0xfffff
    80009f08:	854080e7          	jalr	-1964(ra) # 80008758 <mycpu>
    80009f0c:	00197913          	andi	s2,s2,1
    80009f10:	07252e23          	sw	s2,124(a0)
    80009f14:	f75ff06f          	j	80009e88 <acquire+0x3c>

0000000080009f18 <release>:
    80009f18:	fe010113          	addi	sp,sp,-32
    80009f1c:	00813823          	sd	s0,16(sp)
    80009f20:	00113c23          	sd	ra,24(sp)
    80009f24:	00913423          	sd	s1,8(sp)
    80009f28:	01213023          	sd	s2,0(sp)
    80009f2c:	02010413          	addi	s0,sp,32
    80009f30:	00052783          	lw	a5,0(a0)
    80009f34:	00079a63          	bnez	a5,80009f48 <release+0x30>
    80009f38:	00002517          	auipc	a0,0x2
    80009f3c:	b9050513          	addi	a0,a0,-1136 # 8000bac8 <digits+0x28>
    80009f40:	fffff097          	auipc	ra,0xfffff
    80009f44:	1dc080e7          	jalr	476(ra) # 8000911c <panic>
    80009f48:	01053903          	ld	s2,16(a0)
    80009f4c:	00050493          	mv	s1,a0
    80009f50:	fffff097          	auipc	ra,0xfffff
    80009f54:	808080e7          	jalr	-2040(ra) # 80008758 <mycpu>
    80009f58:	fea910e3          	bne	s2,a0,80009f38 <release+0x20>
    80009f5c:	0004b823          	sd	zero,16(s1)
    80009f60:	0ff0000f          	fence
    80009f64:	0f50000f          	fence	iorw,ow
    80009f68:	0804a02f          	amoswap.w	zero,zero,(s1)
    80009f6c:	ffffe097          	auipc	ra,0xffffe
    80009f70:	7ec080e7          	jalr	2028(ra) # 80008758 <mycpu>
    80009f74:	100027f3          	csrr	a5,sstatus
    80009f78:	0027f793          	andi	a5,a5,2
    80009f7c:	04079a63          	bnez	a5,80009fd0 <release+0xb8>
    80009f80:	07852783          	lw	a5,120(a0)
    80009f84:	02f05e63          	blez	a5,80009fc0 <release+0xa8>
    80009f88:	fff7871b          	addiw	a4,a5,-1
    80009f8c:	06e52c23          	sw	a4,120(a0)
    80009f90:	00071c63          	bnez	a4,80009fa8 <release+0x90>
    80009f94:	07c52783          	lw	a5,124(a0)
    80009f98:	00078863          	beqz	a5,80009fa8 <release+0x90>
    80009f9c:	100027f3          	csrr	a5,sstatus
    80009fa0:	0027e793          	ori	a5,a5,2
    80009fa4:	10079073          	csrw	sstatus,a5
    80009fa8:	01813083          	ld	ra,24(sp)
    80009fac:	01013403          	ld	s0,16(sp)
    80009fb0:	00813483          	ld	s1,8(sp)
    80009fb4:	00013903          	ld	s2,0(sp)
    80009fb8:	02010113          	addi	sp,sp,32
    80009fbc:	00008067          	ret
    80009fc0:	00002517          	auipc	a0,0x2
    80009fc4:	b2850513          	addi	a0,a0,-1240 # 8000bae8 <digits+0x48>
    80009fc8:	fffff097          	auipc	ra,0xfffff
    80009fcc:	154080e7          	jalr	340(ra) # 8000911c <panic>
    80009fd0:	00002517          	auipc	a0,0x2
    80009fd4:	b0050513          	addi	a0,a0,-1280 # 8000bad0 <digits+0x30>
    80009fd8:	fffff097          	auipc	ra,0xfffff
    80009fdc:	144080e7          	jalr	324(ra) # 8000911c <panic>

0000000080009fe0 <holding>:
    80009fe0:	00052783          	lw	a5,0(a0)
    80009fe4:	00079663          	bnez	a5,80009ff0 <holding+0x10>
    80009fe8:	00000513          	li	a0,0
    80009fec:	00008067          	ret
    80009ff0:	fe010113          	addi	sp,sp,-32
    80009ff4:	00813823          	sd	s0,16(sp)
    80009ff8:	00913423          	sd	s1,8(sp)
    80009ffc:	00113c23          	sd	ra,24(sp)
    8000a000:	02010413          	addi	s0,sp,32
    8000a004:	01053483          	ld	s1,16(a0)
    8000a008:	ffffe097          	auipc	ra,0xffffe
    8000a00c:	750080e7          	jalr	1872(ra) # 80008758 <mycpu>
    8000a010:	01813083          	ld	ra,24(sp)
    8000a014:	01013403          	ld	s0,16(sp)
    8000a018:	40a48533          	sub	a0,s1,a0
    8000a01c:	00153513          	seqz	a0,a0
    8000a020:	00813483          	ld	s1,8(sp)
    8000a024:	02010113          	addi	sp,sp,32
    8000a028:	00008067          	ret

000000008000a02c <push_off>:
    8000a02c:	fe010113          	addi	sp,sp,-32
    8000a030:	00813823          	sd	s0,16(sp)
    8000a034:	00113c23          	sd	ra,24(sp)
    8000a038:	00913423          	sd	s1,8(sp)
    8000a03c:	02010413          	addi	s0,sp,32
    8000a040:	100024f3          	csrr	s1,sstatus
    8000a044:	100027f3          	csrr	a5,sstatus
    8000a048:	ffd7f793          	andi	a5,a5,-3
    8000a04c:	10079073          	csrw	sstatus,a5
    8000a050:	ffffe097          	auipc	ra,0xffffe
    8000a054:	708080e7          	jalr	1800(ra) # 80008758 <mycpu>
    8000a058:	07852783          	lw	a5,120(a0)
    8000a05c:	02078663          	beqz	a5,8000a088 <push_off+0x5c>
    8000a060:	ffffe097          	auipc	ra,0xffffe
    8000a064:	6f8080e7          	jalr	1784(ra) # 80008758 <mycpu>
    8000a068:	07852783          	lw	a5,120(a0)
    8000a06c:	01813083          	ld	ra,24(sp)
    8000a070:	01013403          	ld	s0,16(sp)
    8000a074:	0017879b          	addiw	a5,a5,1
    8000a078:	06f52c23          	sw	a5,120(a0)
    8000a07c:	00813483          	ld	s1,8(sp)
    8000a080:	02010113          	addi	sp,sp,32
    8000a084:	00008067          	ret
    8000a088:	0014d493          	srli	s1,s1,0x1
    8000a08c:	ffffe097          	auipc	ra,0xffffe
    8000a090:	6cc080e7          	jalr	1740(ra) # 80008758 <mycpu>
    8000a094:	0014f493          	andi	s1,s1,1
    8000a098:	06952e23          	sw	s1,124(a0)
    8000a09c:	fc5ff06f          	j	8000a060 <push_off+0x34>

000000008000a0a0 <pop_off>:
    8000a0a0:	ff010113          	addi	sp,sp,-16
    8000a0a4:	00813023          	sd	s0,0(sp)
    8000a0a8:	00113423          	sd	ra,8(sp)
    8000a0ac:	01010413          	addi	s0,sp,16
    8000a0b0:	ffffe097          	auipc	ra,0xffffe
    8000a0b4:	6a8080e7          	jalr	1704(ra) # 80008758 <mycpu>
    8000a0b8:	100027f3          	csrr	a5,sstatus
    8000a0bc:	0027f793          	andi	a5,a5,2
    8000a0c0:	04079663          	bnez	a5,8000a10c <pop_off+0x6c>
    8000a0c4:	07852783          	lw	a5,120(a0)
    8000a0c8:	02f05a63          	blez	a5,8000a0fc <pop_off+0x5c>
    8000a0cc:	fff7871b          	addiw	a4,a5,-1
    8000a0d0:	06e52c23          	sw	a4,120(a0)
    8000a0d4:	00071c63          	bnez	a4,8000a0ec <pop_off+0x4c>
    8000a0d8:	07c52783          	lw	a5,124(a0)
    8000a0dc:	00078863          	beqz	a5,8000a0ec <pop_off+0x4c>
    8000a0e0:	100027f3          	csrr	a5,sstatus
    8000a0e4:	0027e793          	ori	a5,a5,2
    8000a0e8:	10079073          	csrw	sstatus,a5
    8000a0ec:	00813083          	ld	ra,8(sp)
    8000a0f0:	00013403          	ld	s0,0(sp)
    8000a0f4:	01010113          	addi	sp,sp,16
    8000a0f8:	00008067          	ret
    8000a0fc:	00002517          	auipc	a0,0x2
    8000a100:	9ec50513          	addi	a0,a0,-1556 # 8000bae8 <digits+0x48>
    8000a104:	fffff097          	auipc	ra,0xfffff
    8000a108:	018080e7          	jalr	24(ra) # 8000911c <panic>
    8000a10c:	00002517          	auipc	a0,0x2
    8000a110:	9c450513          	addi	a0,a0,-1596 # 8000bad0 <digits+0x30>
    8000a114:	fffff097          	auipc	ra,0xfffff
    8000a118:	008080e7          	jalr	8(ra) # 8000911c <panic>

000000008000a11c <push_on>:
    8000a11c:	fe010113          	addi	sp,sp,-32
    8000a120:	00813823          	sd	s0,16(sp)
    8000a124:	00113c23          	sd	ra,24(sp)
    8000a128:	00913423          	sd	s1,8(sp)
    8000a12c:	02010413          	addi	s0,sp,32
    8000a130:	100024f3          	csrr	s1,sstatus
    8000a134:	100027f3          	csrr	a5,sstatus
    8000a138:	0027e793          	ori	a5,a5,2
    8000a13c:	10079073          	csrw	sstatus,a5
    8000a140:	ffffe097          	auipc	ra,0xffffe
    8000a144:	618080e7          	jalr	1560(ra) # 80008758 <mycpu>
    8000a148:	07852783          	lw	a5,120(a0)
    8000a14c:	02078663          	beqz	a5,8000a178 <push_on+0x5c>
    8000a150:	ffffe097          	auipc	ra,0xffffe
    8000a154:	608080e7          	jalr	1544(ra) # 80008758 <mycpu>
    8000a158:	07852783          	lw	a5,120(a0)
    8000a15c:	01813083          	ld	ra,24(sp)
    8000a160:	01013403          	ld	s0,16(sp)
    8000a164:	0017879b          	addiw	a5,a5,1
    8000a168:	06f52c23          	sw	a5,120(a0)
    8000a16c:	00813483          	ld	s1,8(sp)
    8000a170:	02010113          	addi	sp,sp,32
    8000a174:	00008067          	ret
    8000a178:	0014d493          	srli	s1,s1,0x1
    8000a17c:	ffffe097          	auipc	ra,0xffffe
    8000a180:	5dc080e7          	jalr	1500(ra) # 80008758 <mycpu>
    8000a184:	0014f493          	andi	s1,s1,1
    8000a188:	06952e23          	sw	s1,124(a0)
    8000a18c:	fc5ff06f          	j	8000a150 <push_on+0x34>

000000008000a190 <pop_on>:
    8000a190:	ff010113          	addi	sp,sp,-16
    8000a194:	00813023          	sd	s0,0(sp)
    8000a198:	00113423          	sd	ra,8(sp)
    8000a19c:	01010413          	addi	s0,sp,16
    8000a1a0:	ffffe097          	auipc	ra,0xffffe
    8000a1a4:	5b8080e7          	jalr	1464(ra) # 80008758 <mycpu>
    8000a1a8:	100027f3          	csrr	a5,sstatus
    8000a1ac:	0027f793          	andi	a5,a5,2
    8000a1b0:	04078463          	beqz	a5,8000a1f8 <pop_on+0x68>
    8000a1b4:	07852783          	lw	a5,120(a0)
    8000a1b8:	02f05863          	blez	a5,8000a1e8 <pop_on+0x58>
    8000a1bc:	fff7879b          	addiw	a5,a5,-1
    8000a1c0:	06f52c23          	sw	a5,120(a0)
    8000a1c4:	07853783          	ld	a5,120(a0)
    8000a1c8:	00079863          	bnez	a5,8000a1d8 <pop_on+0x48>
    8000a1cc:	100027f3          	csrr	a5,sstatus
    8000a1d0:	ffd7f793          	andi	a5,a5,-3
    8000a1d4:	10079073          	csrw	sstatus,a5
    8000a1d8:	00813083          	ld	ra,8(sp)
    8000a1dc:	00013403          	ld	s0,0(sp)
    8000a1e0:	01010113          	addi	sp,sp,16
    8000a1e4:	00008067          	ret
    8000a1e8:	00002517          	auipc	a0,0x2
    8000a1ec:	92850513          	addi	a0,a0,-1752 # 8000bb10 <digits+0x70>
    8000a1f0:	fffff097          	auipc	ra,0xfffff
    8000a1f4:	f2c080e7          	jalr	-212(ra) # 8000911c <panic>
    8000a1f8:	00002517          	auipc	a0,0x2
    8000a1fc:	8f850513          	addi	a0,a0,-1800 # 8000baf0 <digits+0x50>
    8000a200:	fffff097          	auipc	ra,0xfffff
    8000a204:	f1c080e7          	jalr	-228(ra) # 8000911c <panic>

000000008000a208 <__memset>:
    8000a208:	ff010113          	addi	sp,sp,-16
    8000a20c:	00813423          	sd	s0,8(sp)
    8000a210:	01010413          	addi	s0,sp,16
    8000a214:	1a060e63          	beqz	a2,8000a3d0 <__memset+0x1c8>
    8000a218:	40a007b3          	neg	a5,a0
    8000a21c:	0077f793          	andi	a5,a5,7
    8000a220:	00778693          	addi	a3,a5,7
    8000a224:	00b00813          	li	a6,11
    8000a228:	0ff5f593          	andi	a1,a1,255
    8000a22c:	fff6071b          	addiw	a4,a2,-1
    8000a230:	1b06e663          	bltu	a3,a6,8000a3dc <__memset+0x1d4>
    8000a234:	1cd76463          	bltu	a4,a3,8000a3fc <__memset+0x1f4>
    8000a238:	1a078e63          	beqz	a5,8000a3f4 <__memset+0x1ec>
    8000a23c:	00b50023          	sb	a1,0(a0)
    8000a240:	00100713          	li	a4,1
    8000a244:	1ae78463          	beq	a5,a4,8000a3ec <__memset+0x1e4>
    8000a248:	00b500a3          	sb	a1,1(a0)
    8000a24c:	00200713          	li	a4,2
    8000a250:	1ae78a63          	beq	a5,a4,8000a404 <__memset+0x1fc>
    8000a254:	00b50123          	sb	a1,2(a0)
    8000a258:	00300713          	li	a4,3
    8000a25c:	18e78463          	beq	a5,a4,8000a3e4 <__memset+0x1dc>
    8000a260:	00b501a3          	sb	a1,3(a0)
    8000a264:	00400713          	li	a4,4
    8000a268:	1ae78263          	beq	a5,a4,8000a40c <__memset+0x204>
    8000a26c:	00b50223          	sb	a1,4(a0)
    8000a270:	00500713          	li	a4,5
    8000a274:	1ae78063          	beq	a5,a4,8000a414 <__memset+0x20c>
    8000a278:	00b502a3          	sb	a1,5(a0)
    8000a27c:	00700713          	li	a4,7
    8000a280:	18e79e63          	bne	a5,a4,8000a41c <__memset+0x214>
    8000a284:	00b50323          	sb	a1,6(a0)
    8000a288:	00700e93          	li	t4,7
    8000a28c:	00859713          	slli	a4,a1,0x8
    8000a290:	00e5e733          	or	a4,a1,a4
    8000a294:	01059e13          	slli	t3,a1,0x10
    8000a298:	01c76e33          	or	t3,a4,t3
    8000a29c:	01859313          	slli	t1,a1,0x18
    8000a2a0:	006e6333          	or	t1,t3,t1
    8000a2a4:	02059893          	slli	a7,a1,0x20
    8000a2a8:	40f60e3b          	subw	t3,a2,a5
    8000a2ac:	011368b3          	or	a7,t1,a7
    8000a2b0:	02859813          	slli	a6,a1,0x28
    8000a2b4:	0108e833          	or	a6,a7,a6
    8000a2b8:	03059693          	slli	a3,a1,0x30
    8000a2bc:	003e589b          	srliw	a7,t3,0x3
    8000a2c0:	00d866b3          	or	a3,a6,a3
    8000a2c4:	03859713          	slli	a4,a1,0x38
    8000a2c8:	00389813          	slli	a6,a7,0x3
    8000a2cc:	00f507b3          	add	a5,a0,a5
    8000a2d0:	00e6e733          	or	a4,a3,a4
    8000a2d4:	000e089b          	sext.w	a7,t3
    8000a2d8:	00f806b3          	add	a3,a6,a5
    8000a2dc:	00e7b023          	sd	a4,0(a5)
    8000a2e0:	00878793          	addi	a5,a5,8
    8000a2e4:	fed79ce3          	bne	a5,a3,8000a2dc <__memset+0xd4>
    8000a2e8:	ff8e7793          	andi	a5,t3,-8
    8000a2ec:	0007871b          	sext.w	a4,a5
    8000a2f0:	01d787bb          	addw	a5,a5,t4
    8000a2f4:	0ce88e63          	beq	a7,a4,8000a3d0 <__memset+0x1c8>
    8000a2f8:	00f50733          	add	a4,a0,a5
    8000a2fc:	00b70023          	sb	a1,0(a4)
    8000a300:	0017871b          	addiw	a4,a5,1
    8000a304:	0cc77663          	bgeu	a4,a2,8000a3d0 <__memset+0x1c8>
    8000a308:	00e50733          	add	a4,a0,a4
    8000a30c:	00b70023          	sb	a1,0(a4)
    8000a310:	0027871b          	addiw	a4,a5,2
    8000a314:	0ac77e63          	bgeu	a4,a2,8000a3d0 <__memset+0x1c8>
    8000a318:	00e50733          	add	a4,a0,a4
    8000a31c:	00b70023          	sb	a1,0(a4)
    8000a320:	0037871b          	addiw	a4,a5,3
    8000a324:	0ac77663          	bgeu	a4,a2,8000a3d0 <__memset+0x1c8>
    8000a328:	00e50733          	add	a4,a0,a4
    8000a32c:	00b70023          	sb	a1,0(a4)
    8000a330:	0047871b          	addiw	a4,a5,4
    8000a334:	08c77e63          	bgeu	a4,a2,8000a3d0 <__memset+0x1c8>
    8000a338:	00e50733          	add	a4,a0,a4
    8000a33c:	00b70023          	sb	a1,0(a4)
    8000a340:	0057871b          	addiw	a4,a5,5
    8000a344:	08c77663          	bgeu	a4,a2,8000a3d0 <__memset+0x1c8>
    8000a348:	00e50733          	add	a4,a0,a4
    8000a34c:	00b70023          	sb	a1,0(a4)
    8000a350:	0067871b          	addiw	a4,a5,6
    8000a354:	06c77e63          	bgeu	a4,a2,8000a3d0 <__memset+0x1c8>
    8000a358:	00e50733          	add	a4,a0,a4
    8000a35c:	00b70023          	sb	a1,0(a4)
    8000a360:	0077871b          	addiw	a4,a5,7
    8000a364:	06c77663          	bgeu	a4,a2,8000a3d0 <__memset+0x1c8>
    8000a368:	00e50733          	add	a4,a0,a4
    8000a36c:	00b70023          	sb	a1,0(a4)
    8000a370:	0087871b          	addiw	a4,a5,8
    8000a374:	04c77e63          	bgeu	a4,a2,8000a3d0 <__memset+0x1c8>
    8000a378:	00e50733          	add	a4,a0,a4
    8000a37c:	00b70023          	sb	a1,0(a4)
    8000a380:	0097871b          	addiw	a4,a5,9
    8000a384:	04c77663          	bgeu	a4,a2,8000a3d0 <__memset+0x1c8>
    8000a388:	00e50733          	add	a4,a0,a4
    8000a38c:	00b70023          	sb	a1,0(a4)
    8000a390:	00a7871b          	addiw	a4,a5,10
    8000a394:	02c77e63          	bgeu	a4,a2,8000a3d0 <__memset+0x1c8>
    8000a398:	00e50733          	add	a4,a0,a4
    8000a39c:	00b70023          	sb	a1,0(a4)
    8000a3a0:	00b7871b          	addiw	a4,a5,11
    8000a3a4:	02c77663          	bgeu	a4,a2,8000a3d0 <__memset+0x1c8>
    8000a3a8:	00e50733          	add	a4,a0,a4
    8000a3ac:	00b70023          	sb	a1,0(a4)
    8000a3b0:	00c7871b          	addiw	a4,a5,12
    8000a3b4:	00c77e63          	bgeu	a4,a2,8000a3d0 <__memset+0x1c8>
    8000a3b8:	00e50733          	add	a4,a0,a4
    8000a3bc:	00b70023          	sb	a1,0(a4)
    8000a3c0:	00d7879b          	addiw	a5,a5,13
    8000a3c4:	00c7f663          	bgeu	a5,a2,8000a3d0 <__memset+0x1c8>
    8000a3c8:	00f507b3          	add	a5,a0,a5
    8000a3cc:	00b78023          	sb	a1,0(a5)
    8000a3d0:	00813403          	ld	s0,8(sp)
    8000a3d4:	01010113          	addi	sp,sp,16
    8000a3d8:	00008067          	ret
    8000a3dc:	00b00693          	li	a3,11
    8000a3e0:	e55ff06f          	j	8000a234 <__memset+0x2c>
    8000a3e4:	00300e93          	li	t4,3
    8000a3e8:	ea5ff06f          	j	8000a28c <__memset+0x84>
    8000a3ec:	00100e93          	li	t4,1
    8000a3f0:	e9dff06f          	j	8000a28c <__memset+0x84>
    8000a3f4:	00000e93          	li	t4,0
    8000a3f8:	e95ff06f          	j	8000a28c <__memset+0x84>
    8000a3fc:	00000793          	li	a5,0
    8000a400:	ef9ff06f          	j	8000a2f8 <__memset+0xf0>
    8000a404:	00200e93          	li	t4,2
    8000a408:	e85ff06f          	j	8000a28c <__memset+0x84>
    8000a40c:	00400e93          	li	t4,4
    8000a410:	e7dff06f          	j	8000a28c <__memset+0x84>
    8000a414:	00500e93          	li	t4,5
    8000a418:	e75ff06f          	j	8000a28c <__memset+0x84>
    8000a41c:	00600e93          	li	t4,6
    8000a420:	e6dff06f          	j	8000a28c <__memset+0x84>

000000008000a424 <__memmove>:
    8000a424:	ff010113          	addi	sp,sp,-16
    8000a428:	00813423          	sd	s0,8(sp)
    8000a42c:	01010413          	addi	s0,sp,16
    8000a430:	0e060863          	beqz	a2,8000a520 <__memmove+0xfc>
    8000a434:	fff6069b          	addiw	a3,a2,-1
    8000a438:	0006881b          	sext.w	a6,a3
    8000a43c:	0ea5e863          	bltu	a1,a0,8000a52c <__memmove+0x108>
    8000a440:	00758713          	addi	a4,a1,7
    8000a444:	00a5e7b3          	or	a5,a1,a0
    8000a448:	40a70733          	sub	a4,a4,a0
    8000a44c:	0077f793          	andi	a5,a5,7
    8000a450:	00f73713          	sltiu	a4,a4,15
    8000a454:	00174713          	xori	a4,a4,1
    8000a458:	0017b793          	seqz	a5,a5
    8000a45c:	00e7f7b3          	and	a5,a5,a4
    8000a460:	10078863          	beqz	a5,8000a570 <__memmove+0x14c>
    8000a464:	00900793          	li	a5,9
    8000a468:	1107f463          	bgeu	a5,a6,8000a570 <__memmove+0x14c>
    8000a46c:	0036581b          	srliw	a6,a2,0x3
    8000a470:	fff8081b          	addiw	a6,a6,-1
    8000a474:	02081813          	slli	a6,a6,0x20
    8000a478:	01d85893          	srli	a7,a6,0x1d
    8000a47c:	00858813          	addi	a6,a1,8
    8000a480:	00058793          	mv	a5,a1
    8000a484:	00050713          	mv	a4,a0
    8000a488:	01088833          	add	a6,a7,a6
    8000a48c:	0007b883          	ld	a7,0(a5)
    8000a490:	00878793          	addi	a5,a5,8
    8000a494:	00870713          	addi	a4,a4,8
    8000a498:	ff173c23          	sd	a7,-8(a4)
    8000a49c:	ff0798e3          	bne	a5,a6,8000a48c <__memmove+0x68>
    8000a4a0:	ff867713          	andi	a4,a2,-8
    8000a4a4:	02071793          	slli	a5,a4,0x20
    8000a4a8:	0207d793          	srli	a5,a5,0x20
    8000a4ac:	00f585b3          	add	a1,a1,a5
    8000a4b0:	40e686bb          	subw	a3,a3,a4
    8000a4b4:	00f507b3          	add	a5,a0,a5
    8000a4b8:	06e60463          	beq	a2,a4,8000a520 <__memmove+0xfc>
    8000a4bc:	0005c703          	lbu	a4,0(a1)
    8000a4c0:	00e78023          	sb	a4,0(a5)
    8000a4c4:	04068e63          	beqz	a3,8000a520 <__memmove+0xfc>
    8000a4c8:	0015c603          	lbu	a2,1(a1)
    8000a4cc:	00100713          	li	a4,1
    8000a4d0:	00c780a3          	sb	a2,1(a5)
    8000a4d4:	04e68663          	beq	a3,a4,8000a520 <__memmove+0xfc>
    8000a4d8:	0025c603          	lbu	a2,2(a1)
    8000a4dc:	00200713          	li	a4,2
    8000a4e0:	00c78123          	sb	a2,2(a5)
    8000a4e4:	02e68e63          	beq	a3,a4,8000a520 <__memmove+0xfc>
    8000a4e8:	0035c603          	lbu	a2,3(a1)
    8000a4ec:	00300713          	li	a4,3
    8000a4f0:	00c781a3          	sb	a2,3(a5)
    8000a4f4:	02e68663          	beq	a3,a4,8000a520 <__memmove+0xfc>
    8000a4f8:	0045c603          	lbu	a2,4(a1)
    8000a4fc:	00400713          	li	a4,4
    8000a500:	00c78223          	sb	a2,4(a5)
    8000a504:	00e68e63          	beq	a3,a4,8000a520 <__memmove+0xfc>
    8000a508:	0055c603          	lbu	a2,5(a1)
    8000a50c:	00500713          	li	a4,5
    8000a510:	00c782a3          	sb	a2,5(a5)
    8000a514:	00e68663          	beq	a3,a4,8000a520 <__memmove+0xfc>
    8000a518:	0065c703          	lbu	a4,6(a1)
    8000a51c:	00e78323          	sb	a4,6(a5)
    8000a520:	00813403          	ld	s0,8(sp)
    8000a524:	01010113          	addi	sp,sp,16
    8000a528:	00008067          	ret
    8000a52c:	02061713          	slli	a4,a2,0x20
    8000a530:	02075713          	srli	a4,a4,0x20
    8000a534:	00e587b3          	add	a5,a1,a4
    8000a538:	f0f574e3          	bgeu	a0,a5,8000a440 <__memmove+0x1c>
    8000a53c:	02069613          	slli	a2,a3,0x20
    8000a540:	02065613          	srli	a2,a2,0x20
    8000a544:	fff64613          	not	a2,a2
    8000a548:	00e50733          	add	a4,a0,a4
    8000a54c:	00c78633          	add	a2,a5,a2
    8000a550:	fff7c683          	lbu	a3,-1(a5)
    8000a554:	fff78793          	addi	a5,a5,-1
    8000a558:	fff70713          	addi	a4,a4,-1
    8000a55c:	00d70023          	sb	a3,0(a4)
    8000a560:	fec798e3          	bne	a5,a2,8000a550 <__memmove+0x12c>
    8000a564:	00813403          	ld	s0,8(sp)
    8000a568:	01010113          	addi	sp,sp,16
    8000a56c:	00008067          	ret
    8000a570:	02069713          	slli	a4,a3,0x20
    8000a574:	02075713          	srli	a4,a4,0x20
    8000a578:	00170713          	addi	a4,a4,1
    8000a57c:	00e50733          	add	a4,a0,a4
    8000a580:	00050793          	mv	a5,a0
    8000a584:	0005c683          	lbu	a3,0(a1)
    8000a588:	00178793          	addi	a5,a5,1
    8000a58c:	00158593          	addi	a1,a1,1
    8000a590:	fed78fa3          	sb	a3,-1(a5)
    8000a594:	fee798e3          	bne	a5,a4,8000a584 <__memmove+0x160>
    8000a598:	f89ff06f          	j	8000a520 <__memmove+0xfc>
	...
