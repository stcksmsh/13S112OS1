
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000e117          	auipc	sp,0xe
    80000004:	f1013103          	ld	sp,-240(sp) # 8000df10 <_GLOBAL_OFFSET_TABLE_+0x38>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	27c080ef          	jal	ra,80008298 <start>

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
    8000107c:	040030ef          	jal	ra,800040bc <exceptionHandler>


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
    80001160:	b6478793          	addi	a5,a5,-1180 # 8000dcc0 <_ZTV6Thread+0x10>
    80001164:	00f53023          	sd	a5,0(a0)
    mem_free(myHandle);
    80001168:	00853503          	ld	a0,8(a0)
    8000116c:	00000097          	auipc	ra,0x0
    80001170:	6f4080e7          	jalr	1780(ra) # 80001860 <_Z8mem_freePv>
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
    80001198:	b5478793          	addi	a5,a5,-1196 # 8000dce8 <_ZTV9Semaphore+0x10>
    8000119c:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800011a0:	00853503          	ld	a0,8(a0)
    800011a4:	00001097          	auipc	ra,0x1
    800011a8:	82c080e7          	jalr	-2004(ra) # 800019d0 <_Z9sem_closeP4_sem>
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
    800011d0:	664080e7          	jalr	1636(ra) # 80001830 <_Z9mem_allocm>
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
    800011f8:	66c080e7          	jalr	1644(ra) # 80001860 <_Z8mem_freePv>
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
    8000129c:	a2878793          	addi	a5,a5,-1496 # 8000dcc0 <_ZTV6Thread+0x10>
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
    800012d8:	5b8080e7          	jalr	1464(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
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
    80001304:	648080e7          	jalr	1608(ra) # 80001948 <_Z11thread_joinP7_thread>
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
    8000132c:	600080e7          	jalr	1536(ra) # 80001928 <_Z15thread_dispatchv>
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
    80001354:	61c080e7          	jalr	1564(ra) # 8000196c <_Z10time_sleepm>
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
    800013b0:	91478793          	addi	a5,a5,-1772 # 8000dcc0 <_ZTV6Thread+0x10>
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
    800013e8:	90478793          	addi	a5,a5,-1788 # 8000dce8 <_ZTV9Semaphore+0x10>
    800013ec:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800013f0:	00850513          	addi	a0,a0,8
    800013f4:	00000097          	auipc	ra,0x0
    800013f8:	5a4080e7          	jalr	1444(ra) # 80001998 <_Z8sem_openPP4_semj>
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
    80001424:	5dc080e7          	jalr	1500(ra) # 800019fc <_Z8sem_waitP4_sem>
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
    80001450:	5dc080e7          	jalr	1500(ra) # 80001a28 <_Z10sem_signalP4_sem>
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
    800014a8:	86478793          	addi	a5,a5,-1948 # 8000dd08 <_ZTV14PeriodicThread+0x10>
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

00000000800014d4 <_ZN6Thread3runEv>:
    void join();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
    800014d4:	ff010113          	addi	sp,sp,-16
    800014d8:	00813423          	sd	s0,8(sp)
    800014dc:	01010413          	addi	s0,sp,16
    800014e0:	00813403          	ld	s0,8(sp)
    800014e4:	01010113          	addi	sp,sp,16
    800014e8:	00008067          	ret

00000000800014ec <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate ();
protected:
    void run () override;
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    800014ec:	ff010113          	addi	sp,sp,-16
    800014f0:	00813423          	sd	s0,8(sp)
    800014f4:	01010413          	addi	s0,sp,16
    800014f8:	00813403          	ld	s0,8(sp)
    800014fc:	01010113          	addi	sp,sp,16
    80001500:	00008067          	ret

0000000080001504 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80001504:	ff010113          	addi	sp,sp,-16
    80001508:	00113423          	sd	ra,8(sp)
    8000150c:	00813023          	sd	s0,0(sp)
    80001510:	01010413          	addi	s0,sp,16
    80001514:	0000c797          	auipc	a5,0xc
    80001518:	7f478793          	addi	a5,a5,2036 # 8000dd08 <_ZTV14PeriodicThread+0x10>
    8000151c:	00f53023          	sd	a5,0(a0)
    80001520:	00000097          	auipc	ra,0x0
    80001524:	c2c080e7          	jalr	-980(ra) # 8000114c <_ZN6ThreadD1Ev>
    80001528:	00813083          	ld	ra,8(sp)
    8000152c:	00013403          	ld	s0,0(sp)
    80001530:	01010113          	addi	sp,sp,16
    80001534:	00008067          	ret

0000000080001538 <_ZN14PeriodicThreadD0Ev>:
    80001538:	fe010113          	addi	sp,sp,-32
    8000153c:	00113c23          	sd	ra,24(sp)
    80001540:	00813823          	sd	s0,16(sp)
    80001544:	00913423          	sd	s1,8(sp)
    80001548:	02010413          	addi	s0,sp,32
    8000154c:	00050493          	mv	s1,a0
    80001550:	0000c797          	auipc	a5,0xc
    80001554:	7b878793          	addi	a5,a5,1976 # 8000dd08 <_ZTV14PeriodicThread+0x10>
    80001558:	00f53023          	sd	a5,0(a0)
    8000155c:	00000097          	auipc	ra,0x0
    80001560:	bf0080e7          	jalr	-1040(ra) # 8000114c <_ZN6ThreadD1Ev>
    80001564:	00048513          	mv	a0,s1
    80001568:	00000097          	auipc	ra,0x0
    8000156c:	c7c080e7          	jalr	-900(ra) # 800011e4 <_ZdlPv>
    80001570:	01813083          	ld	ra,24(sp)
    80001574:	01013403          	ld	s0,16(sp)
    80001578:	00813483          	ld	s1,8(sp)
    8000157c:	02010113          	addi	sp,sp,32
    80001580:	00008067          	ret

0000000080001584 <_ZN5TimerC1Ev>:
#include "sched.h"
#include "assert.h"

Timer* Timer::instance = 0;

Timer::Timer(){
    80001584:	fe010113          	addi	sp,sp,-32
    80001588:	00113c23          	sd	ra,24(sp)
    8000158c:	00813823          	sd	s0,16(sp)
    80001590:	00913423          	sd	s1,8(sp)
    80001594:	02010413          	addi	s0,sp,32
    80001598:	00050493          	mv	s1,a0
    assert(instance == 0);
    8000159c:	0000d797          	auipc	a5,0xd
    800015a0:	9d47b783          	ld	a5,-1580(a5) # 8000df70 <_ZN5Timer8instanceE>
    800015a4:	02079463          	bnez	a5,800015cc <_ZN5TimerC1Ev+0x48>
    instance = this;
    800015a8:	0000d797          	auipc	a5,0xd
    800015ac:	9c97b423          	sd	s1,-1592(a5) # 8000df70 <_ZN5Timer8instanceE>
    sleepingHead = 0;
    800015b0:	0004b023          	sd	zero,0(s1)
    time = 0;
    800015b4:	0004b423          	sd	zero,8(s1)
}
    800015b8:	01813083          	ld	ra,24(sp)
    800015bc:	01013403          	ld	s0,16(sp)
    800015c0:	00813483          	ld	s1,8(sp)
    800015c4:	02010113          	addi	sp,sp,32
    800015c8:	00008067          	ret
    assert(instance == 0);
    800015cc:	0000a697          	auipc	a3,0xa
    800015d0:	a5468693          	addi	a3,a3,-1452 # 8000b020 <CONSOLE_STATUS+0x10>
    800015d4:	01400613          	li	a2,20
    800015d8:	0000a597          	auipc	a1,0xa
    800015dc:	a5858593          	addi	a1,a1,-1448 # 8000b030 <CONSOLE_STATUS+0x20>
    800015e0:	0000a517          	auipc	a0,0xa
    800015e4:	a6050513          	addi	a0,a0,-1440 # 8000b040 <CONSOLE_STATUS+0x30>
    800015e8:	00001097          	auipc	ra,0x1
    800015ec:	a44080e7          	jalr	-1468(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800015f0:	fb9ff06f          	j	800015a8 <_ZN5TimerC1Ev+0x24>

00000000800015f4 <_ZN5TimerD1Ev>:

Timer::~Timer(){
    threadSleepWrapper* current = sleepingHead;
    800015f4:	00053503          	ld	a0,0(a0)
    while(current != 0){
    800015f8:	04050063          	beqz	a0,80001638 <_ZN5TimerD1Ev+0x44>
Timer::~Timer(){
    800015fc:	fe010113          	addi	sp,sp,-32
    80001600:	00113c23          	sd	ra,24(sp)
    80001604:	00813823          	sd	s0,16(sp)
    80001608:	00913423          	sd	s1,8(sp)
    8000160c:	02010413          	addi	s0,sp,32
        threadSleepWrapper* next = current->next;
    80001610:	01053483          	ld	s1,16(a0)
        mem_free(current);
    80001614:	00000097          	auipc	ra,0x0
    80001618:	24c080e7          	jalr	588(ra) # 80001860 <_Z8mem_freePv>
        current = next;
    8000161c:	00048513          	mv	a0,s1
    while(current != 0){
    80001620:	fe0498e3          	bnez	s1,80001610 <_ZN5TimerD1Ev+0x1c>
    }
}
    80001624:	01813083          	ld	ra,24(sp)
    80001628:	01013403          	ld	s0,16(sp)
    8000162c:	00813483          	ld	s1,8(sp)
    80001630:	02010113          	addi	sp,sp,32
    80001634:	00008067          	ret
    80001638:	00008067          	ret

000000008000163c <_ZN5Timer11getInstanceEv>:

Timer& Timer::getInstance(){
    assert(instance != 0);
    8000163c:	0000d797          	auipc	a5,0xd
    80001640:	9347b783          	ld	a5,-1740(a5) # 8000df70 <_ZN5Timer8instanceE>
    80001644:	00078863          	beqz	a5,80001654 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    80001648:	0000d517          	auipc	a0,0xd
    8000164c:	92853503          	ld	a0,-1752(a0) # 8000df70 <_ZN5Timer8instanceE>
    80001650:	00008067          	ret
Timer& Timer::getInstance(){
    80001654:	ff010113          	addi	sp,sp,-16
    80001658:	00113423          	sd	ra,8(sp)
    8000165c:	00813023          	sd	s0,0(sp)
    80001660:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80001664:	0000a697          	auipc	a3,0xa
    80001668:	9ec68693          	addi	a3,a3,-1556 # 8000b050 <CONSOLE_STATUS+0x40>
    8000166c:	02400613          	li	a2,36
    80001670:	0000a597          	auipc	a1,0xa
    80001674:	9c058593          	addi	a1,a1,-1600 # 8000b030 <CONSOLE_STATUS+0x20>
    80001678:	0000a517          	auipc	a0,0xa
    8000167c:	a0050513          	addi	a0,a0,-1536 # 8000b078 <CONSOLE_STATUS+0x68>
    80001680:	00001097          	auipc	ra,0x1
    80001684:	9ac080e7          	jalr	-1620(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
}
    80001688:	0000d517          	auipc	a0,0xd
    8000168c:	8e853503          	ld	a0,-1816(a0) # 8000df70 <_ZN5Timer8instanceE>
    80001690:	00813083          	ld	ra,8(sp)
    80001694:	00013403          	ld	s0,0(sp)
    80001698:	01010113          	addi	sp,sp,16
    8000169c:	00008067          	ret

00000000800016a0 <_ZN5Timer4tickEv>:

void Timer::tick(){
    800016a0:	fd010113          	addi	sp,sp,-48
    800016a4:	02113423          	sd	ra,40(sp)
    800016a8:	02813023          	sd	s0,32(sp)
    800016ac:	00913c23          	sd	s1,24(sp)
    800016b0:	01213823          	sd	s2,16(sp)
    800016b4:	01313423          	sd	s3,8(sp)
    800016b8:	03010413          	addi	s0,sp,48
    800016bc:	00050913          	mv	s2,a0
    time += 1;
    800016c0:	00853783          	ld	a5,8(a0)
    800016c4:	00178793          	addi	a5,a5,1
    800016c8:	00f53423          	sd	a5,8(a0)
    // if(time % 10 == 0){
    //     putc('t');
    // }
    threadSleepWrapper* current = sleepingHead;
    800016cc:	00053483          	ld	s1,0(a0)
    800016d0:	0180006f          	j	800016e8 <_ZN5Timer4tickEv+0x48>
        if(current->wakeUpTime <= time){
            current->thread->setSleeping(false);
            Scheduler::put(current->thread);
            threadSleepWrapper* next = current->next;
            if(current == sleepingHead){
                sleepingHead = next;
    800016d4:	01393023          	sd	s3,0(s2)
            }
            mem_free(current);
    800016d8:	00048513          	mv	a0,s1
    800016dc:	00000097          	auipc	ra,0x0
    800016e0:	184080e7          	jalr	388(ra) # 80001860 <_Z8mem_freePv>
            current = next;
    800016e4:	00098493          	mv	s1,s3
    while(current != 0){
    800016e8:	02048e63          	beqz	s1,80001724 <_ZN5Timer4tickEv+0x84>
        if(current->wakeUpTime <= time){
    800016ec:	0084b703          	ld	a4,8(s1)
    800016f0:	00893783          	ld	a5,8(s2)
    800016f4:	02e7e863          	bltu	a5,a4,80001724 <_ZN5Timer4tickEv+0x84>
            current->thread->setSleeping(false);
    800016f8:	00000593          	li	a1,0
    800016fc:	0004b503          	ld	a0,0(s1)
    80001700:	00002097          	auipc	ra,0x2
    80001704:	edc080e7          	jalr	-292(ra) # 800035dc <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    80001708:	0004b503          	ld	a0,0(s1)
    8000170c:	00003097          	auipc	ra,0x3
    80001710:	0d4080e7          	jalr	212(ra) # 800047e0 <_ZN9Scheduler3putEP7_thread>
            threadSleepWrapper* next = current->next;
    80001714:	0104b983          	ld	s3,16(s1)
            if(current == sleepingHead){
    80001718:	00093783          	ld	a5,0(s2)
    8000171c:	fa979ee3          	bne	a5,s1,800016d8 <_ZN5Timer4tickEv+0x38>
    80001720:	fb5ff06f          	j	800016d4 <_ZN5Timer4tickEv+0x34>
        }else{
            break;
        }
    }
}
    80001724:	02813083          	ld	ra,40(sp)
    80001728:	02013403          	ld	s0,32(sp)
    8000172c:	01813483          	ld	s1,24(sp)
    80001730:	01013903          	ld	s2,16(sp)
    80001734:	00813983          	ld	s3,8(sp)
    80001738:	03010113          	addi	sp,sp,48
    8000173c:	00008067          	ret

0000000080001740 <_ZN5Timer5sleepEm>:

int Timer::sleep(time_t timeToSleep){
    80001740:	fd010113          	addi	sp,sp,-48
    80001744:	02113423          	sd	ra,40(sp)
    80001748:	02813023          	sd	s0,32(sp)
    8000174c:	00913c23          	sd	s1,24(sp)
    80001750:	01213823          	sd	s2,16(sp)
    80001754:	01313423          	sd	s3,8(sp)
    80001758:	03010413          	addi	s0,sp,48
    8000175c:	00050493          	mv	s1,a0
    80001760:	00058913          	mv	s2,a1
    thread_t thread = _thread::currentThread;
    80001764:	0000c797          	auipc	a5,0xc
    80001768:	7c47b783          	ld	a5,1988(a5) # 8000df28 <_GLOBAL_OFFSET_TABLE_+0x50>
    8000176c:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)mem_alloc(sizeof(threadSleepWrapper));
    80001770:	01800513          	li	a0,24
    80001774:	00000097          	auipc	ra,0x0
    80001778:	0bc080e7          	jalr	188(ra) # 80001830 <_Z9mem_allocm>
    newSleepingThread->thread = thread;
    8000177c:	01353023          	sd	s3,0(a0)
    newSleepingThread->wakeUpTime = time + timeToSleep;
    80001780:	0084b783          	ld	a5,8(s1)
    80001784:	012785b3          	add	a1,a5,s2
    80001788:	00b53423          	sd	a1,8(a0)
    newSleepingThread->next = 0;
    8000178c:	00053823          	sd	zero,16(a0)

    if(sleepingHead == 0){
    80001790:	0004b783          	ld	a5,0(s1)
    80001794:	04078c63          	beqz	a5,800017ec <_ZN5Timer5sleepEm+0xac>
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
    80001798:	00078693          	mv	a3,a5
    8000179c:	0107b783          	ld	a5,16(a5)
    800017a0:	00078663          	beqz	a5,800017ac <_ZN5Timer5sleepEm+0x6c>
    800017a4:	0087b703          	ld	a4,8(a5)
    800017a8:	feb768e3          	bltu	a4,a1,80001798 <_ZN5Timer5sleepEm+0x58>
            current = current->next;
        }
        newSleepingThread->next = current->next;
    800017ac:	00f53823          	sd	a5,16(a0)
        current->next = newSleepingThread;
    800017b0:	00a6b823          	sd	a0,16(a3)
    }
    thread->setSleeping(true);
    800017b4:	00100593          	li	a1,1
    800017b8:	00098513          	mv	a0,s3
    800017bc:	00002097          	auipc	ra,0x2
    800017c0:	e20080e7          	jalr	-480(ra) # 800035dc <_ZN7_thread11setSleepingEb>
    thread_dispatch();
    800017c4:	00000097          	auipc	ra,0x0
    800017c8:	164080e7          	jalr	356(ra) # 80001928 <_Z15thread_dispatchv>
    return 0;
}
    800017cc:	00000513          	li	a0,0
    800017d0:	02813083          	ld	ra,40(sp)
    800017d4:	02013403          	ld	s0,32(sp)
    800017d8:	01813483          	ld	s1,24(sp)
    800017dc:	01013903          	ld	s2,16(sp)
    800017e0:	00813983          	ld	s3,8(sp)
    800017e4:	03010113          	addi	sp,sp,48
    800017e8:	00008067          	ret
        sleepingHead = newSleepingThread;
    800017ec:	00a4b023          	sd	a0,0(s1)
    800017f0:	fc5ff06f          	j	800017b4 <_ZN5Timer5sleepEm+0x74>

00000000800017f4 <_ZN5Timer17noSleepingThreadsEv>:

bool Timer::noSleepingThreads(){
    800017f4:	ff010113          	addi	sp,sp,-16
    800017f8:	00813423          	sd	s0,8(sp)
    800017fc:	01010413          	addi	s0,sp,16
    return sleepingHead == 0;
    80001800:	00053503          	ld	a0,0(a0)
}
    80001804:	00153513          	seqz	a0,a0
    80001808:	00813403          	ld	s0,8(sp)
    8000180c:	01010113          	addi	sp,sp,16
    80001810:	00008067          	ret

0000000080001814 <_ZN5Timer7getTimeEv>:

time_t Timer::getTime(){
    80001814:	ff010113          	addi	sp,sp,-16
    80001818:	00813423          	sd	s0,8(sp)
    8000181c:	01010413          	addi	s0,sp,16
    return time;
    80001820:	00853503          	ld	a0,8(a0)
    80001824:	00813403          	ld	s0,8(sp)
    80001828:	01010113          	addi	sp,sp,16
    8000182c:	00008067          	ret

0000000080001830 <_Z9mem_allocm>:
 */

#include "syscall_c.h"
#include "console.h"

void* mem_alloc ( size_t nSize ){
    80001830:	ff010113          	addi	sp,sp,-16
    80001834:	00813423          	sd	s0,8(sp)
    80001838:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    8000183c:	03f50513          	addi	a0,a0,63
    80001840:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    80001844:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    80001848:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    8000184c:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    80001850:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    80001854:	00813403          	ld	s0,8(sp)
    80001858:	01010113          	addi	sp,sp,16
    8000185c:	00008067          	ret

0000000080001860 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    80001860:	ff010113          	addi	sp,sp,-16
    80001864:	00813423          	sd	s0,8(sp)
    80001868:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    8000186c:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    80001870:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    80001874:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    80001878:	00050513          	mv	a0,a0
    return nResult;

}
    8000187c:	0005051b          	sext.w	a0,a0
    80001880:	00813403          	ld	s0,8(sp)
    80001884:	01010113          	addi	sp,sp,16
    80001888:	00008067          	ret

000000008000188c <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg ) {
    8000188c:	fd010113          	addi	sp,sp,-48
    80001890:	02113423          	sd	ra,40(sp)
    80001894:	02813023          	sd	s0,32(sp)
    80001898:	00913c23          	sd	s1,24(sp)
    8000189c:	01213823          	sd	s2,16(sp)
    800018a0:	01313423          	sd	s3,8(sp)
    800018a4:	03010413          	addi	s0,sp,48
    800018a8:	00050493          	mv	s1,a0
    800018ac:	00058913          	mv	s2,a1
    800018b0:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    800018b4:	00001537          	lui	a0,0x1
    800018b8:	00000097          	auipc	ra,0x0
    800018bc:	f78080e7          	jalr	-136(ra) # 80001830 <_Z9mem_allocm>
    /// now we move the pointer up, since SP points to the first free location, and grows down
    __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space + DEFAULT_STACK_SIZE));
    800018c0:	000017b7          	lui	a5,0x1
    800018c4:	00f50533          	add	a0,a0,a5
    800018c8:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    800018cc:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    800018d0:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    800018d4:	00048593          	mv	a1,s1
    __asm__ volatile("li a0,0x11");
    800018d8:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    800018dc:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800018e0:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800018e4:	0005051b          	sext.w	a0,a0
    800018e8:	02813083          	ld	ra,40(sp)
    800018ec:	02013403          	ld	s0,32(sp)
    800018f0:	01813483          	ld	s1,24(sp)
    800018f4:	01013903          	ld	s2,16(sp)
    800018f8:	00813983          	ld	s3,8(sp)
    800018fc:	03010113          	addi	sp,sp,48
    80001900:	00008067          	ret

0000000080001904 <_Z11thread_exitv>:

int thread_exit (){
    80001904:	ff010113          	addi	sp,sp,-16
    80001908:	00813423          	sd	s0,8(sp)
    8000190c:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    80001910:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80001914:	00000073          	ecall
    return 0;
}
    80001918:	00000513          	li	a0,0
    8000191c:	00813403          	ld	s0,8(sp)
    80001920:	01010113          	addi	sp,sp,16
    80001924:	00008067          	ret

0000000080001928 <_Z15thread_dispatchv>:

void thread_dispatch () {
    80001928:	ff010113          	addi	sp,sp,-16
    8000192c:	00813423          	sd	s0,8(sp)
    80001930:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    80001934:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    80001938:	00000073          	ecall
}
    8000193c:	00813403          	ld	s0,8(sp)
    80001940:	01010113          	addi	sp,sp,16
    80001944:	00008067          	ret

0000000080001948 <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    80001948:	ff010113          	addi	sp,sp,-16
    8000194c:	00813423          	sd	s0,8(sp)
    80001950:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    80001954:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    80001958:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    8000195c:	00000073          	ecall
}
    80001960:	00813403          	ld	s0,8(sp)
    80001964:	01010113          	addi	sp,sp,16
    80001968:	00008067          	ret

000000008000196c <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    8000196c:	ff010113          	addi	sp,sp,-16
    80001970:	00813423          	sd	s0,8(sp)
    80001974:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    80001978:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    8000197c:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001980:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001984:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001988:	0005051b          	sext.w	a0,a0
    8000198c:	00813403          	ld	s0,8(sp)
    80001990:	01010113          	addi	sp,sp,16
    80001994:	00008067          	ret

0000000080001998 <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    80001998:	ff010113          	addi	sp,sp,-16
    8000199c:	00813423          	sd	s0,8(sp)
    800019a0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    800019a4:	02059593          	slli	a1,a1,0x20
    800019a8:	0205d593          	srli	a1,a1,0x20
    800019ac:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    800019b0:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    800019b4:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    800019b8:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800019bc:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800019c0:	0005051b          	sext.w	a0,a0
    800019c4:	00813403          	ld	s0,8(sp)
    800019c8:	01010113          	addi	sp,sp,16
    800019cc:	00008067          	ret

00000000800019d0 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    800019d0:	ff010113          	addi	sp,sp,-16
    800019d4:	00813423          	sd	s0,8(sp)
    800019d8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800019dc:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    800019e0:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    800019e4:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800019e8:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800019ec:	0005051b          	sext.w	a0,a0
    800019f0:	00813403          	ld	s0,8(sp)
    800019f4:	01010113          	addi	sp,sp,16
    800019f8:	00008067          	ret

00000000800019fc <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    800019fc:	ff010113          	addi	sp,sp,-16
    80001a00:	00813423          	sd	s0,8(sp)
    80001a04:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001a08:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    80001a0c:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001a10:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001a14:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001a18:	0005051b          	sext.w	a0,a0
    80001a1c:	00813403          	ld	s0,8(sp)
    80001a20:	01010113          	addi	sp,sp,16
    80001a24:	00008067          	ret

0000000080001a28 <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    80001a28:	ff010113          	addi	sp,sp,-16
    80001a2c:	00813423          	sd	s0,8(sp)
    80001a30:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001a34:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    80001a38:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    80001a3c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001a40:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001a44:	0005051b          	sext.w	a0,a0
    80001a48:	00813403          	ld	s0,8(sp)
    80001a4c:	01010113          	addi	sp,sp,16
    80001a50:	00008067          	ret

0000000080001a54 <_Z4getcv>:

char getc() {
    80001a54:	ff010113          	addi	sp,sp,-16
    80001a58:	00813423          	sd	s0,8(sp)
    80001a5c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    80001a60:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    80001a64:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    80001a68:	00050513          	mv	a0,a0
    return chr;
}
    80001a6c:	0ff57513          	andi	a0,a0,255
    80001a70:	00813403          	ld	s0,8(sp)
    80001a74:	01010113          	addi	sp,sp,16
    80001a78:	00008067          	ret

0000000080001a7c <_Z4putcc>:

#include "console.h"

void putc(char chr ) {
    80001a7c:	ff010113          	addi	sp,sp,-16
    80001a80:	00813423          	sd	s0,8(sp)
    80001a84:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    80001a88:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    80001a8c:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80001a90:	00000073          	ecall
    80001a94:	00813403          	ld	s0,8(sp)
    80001a98:	01010113          	addi	sp,sp,16
    80001a9c:	00008067          	ret

0000000080001aa0 <_ZN4_sem4openEPPS_j>:
#include "syscall_c.h"
#include "assert.h"
#include "sched.h"
#include "console.h"

void _sem::open(_sem** handle, unsigned init){
    80001aa0:	fe010113          	addi	sp,sp,-32
    80001aa4:	00113c23          	sd	ra,24(sp)
    80001aa8:	00813823          	sd	s0,16(sp)
    80001aac:	00913423          	sd	s1,8(sp)
    80001ab0:	01213023          	sd	s2,0(sp)
    80001ab4:	02010413          	addi	s0,sp,32
    80001ab8:	00050493          	mv	s1,a0
    80001abc:	00058913          	mv	s2,a1
    (*handle) = (sem_t)mem_alloc(sizeof(_sem));
    80001ac0:	01800513          	li	a0,24
    80001ac4:	00000097          	auipc	ra,0x0
    80001ac8:	d6c080e7          	jalr	-660(ra) # 80001830 <_Z9mem_allocm>
    80001acc:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    80001ad0:	00053023          	sd	zero,0(a0) # 1000 <_entry-0x7ffff000>
    (*handle)->blockTail = 0;
    80001ad4:	0004b783          	ld	a5,0(s1)
    80001ad8:	0007b423          	sd	zero,8(a5) # 1008 <_entry-0x7fffeff8>
    (*handle)->value = init;
    80001adc:	0004b783          	ld	a5,0(s1)
    80001ae0:	0127a823          	sw	s2,16(a5)
}
    80001ae4:	01813083          	ld	ra,24(sp)
    80001ae8:	01013403          	ld	s0,16(sp)
    80001aec:	00813483          	ld	s1,8(sp)
    80001af0:	00013903          	ld	s2,0(sp)
    80001af4:	02010113          	addi	sp,sp,32
    80001af8:	00008067          	ret

0000000080001afc <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    80001afc:	fe010113          	addi	sp,sp,-32
    80001b00:	00113c23          	sd	ra,24(sp)
    80001b04:	00813823          	sd	s0,16(sp)
    80001b08:	00913423          	sd	s1,8(sp)
    80001b0c:	02010413          	addi	s0,sp,32
    80001b10:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    80001b14:	0004b783          	ld	a5,0(s1)
    80001b18:	02078863          	beqz	a5,80001b48 <_ZN4_sem5closeEPS_+0x4c>
        id->blockHead->pThread->setClosed(true);
    80001b1c:	00100593          	li	a1,1
    80001b20:	0007b503          	ld	a0,0(a5)
    80001b24:	00002097          	auipc	ra,0x2
    80001b28:	a8c080e7          	jalr	-1396(ra) # 800035b0 <_ZN7_thread9setClosedEb>
        mem_free(id->blockHead);
    80001b2c:	0004b503          	ld	a0,0(s1)
    80001b30:	00000097          	auipc	ra,0x0
    80001b34:	d30080e7          	jalr	-720(ra) # 80001860 <_Z8mem_freePv>
        id->blockHead = id->blockHead->pNext;
    80001b38:	0004b783          	ld	a5,0(s1)
    80001b3c:	0087b783          	ld	a5,8(a5)
    80001b40:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    80001b44:	fd1ff06f          	j	80001b14 <_ZN4_sem5closeEPS_+0x18>
    }
}
    80001b48:	01813083          	ld	ra,24(sp)
    80001b4c:	01013403          	ld	s0,16(sp)
    80001b50:	00813483          	ld	s1,8(sp)
    80001b54:	02010113          	addi	sp,sp,32
    80001b58:	00008067          	ret

0000000080001b5c <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    80001b5c:	01052783          	lw	a5,16(a0)
    80001b60:	fff7879b          	addiw	a5,a5,-1
    80001b64:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    80001b68:	02079713          	slli	a4,a5,0x20
    80001b6c:	00074463          	bltz	a4,80001b74 <_ZN4_sem4waitEPS_+0x18>
    80001b70:	00008067          	ret
void _sem::wait(sem_t id){
    80001b74:	fe010113          	addi	sp,sp,-32
    80001b78:	00113c23          	sd	ra,24(sp)
    80001b7c:	00813823          	sd	s0,16(sp)
    80001b80:	00913423          	sd	s1,8(sp)
    80001b84:	02010413          	addi	s0,sp,32
    80001b88:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    80001b8c:	01000513          	li	a0,16
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	ca0080e7          	jalr	-864(ra) # 80001830 <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    80001b98:	0000c797          	auipc	a5,0xc
    80001b9c:	3907b783          	ld	a5,912(a5) # 8000df28 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001ba0:	0007b783          	ld	a5,0(a5)
    80001ba4:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    80001ba8:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    80001bac:	0004b783          	ld	a5,0(s1)
    80001bb0:	04078263          	beqz	a5,80001bf4 <_ZN4_sem4waitEPS_+0x98>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    80001bb4:	0084b783          	ld	a5,8(s1)
    80001bb8:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    80001bbc:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    80001bc0:	00100593          	li	a1,1
    80001bc4:	0000c797          	auipc	a5,0xc
    80001bc8:	3647b783          	ld	a5,868(a5) # 8000df28 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001bcc:	0007b503          	ld	a0,0(a5)
    80001bd0:	00002097          	auipc	ra,0x2
    80001bd4:	9b0080e7          	jalr	-1616(ra) # 80003580 <_ZN7_thread10setBlockedEb>
        thread_dispatch();
    80001bd8:	00000097          	auipc	ra,0x0
    80001bdc:	d50080e7          	jalr	-688(ra) # 80001928 <_Z15thread_dispatchv>
    }
}
    80001be0:	01813083          	ld	ra,24(sp)
    80001be4:	01013403          	ld	s0,16(sp)
    80001be8:	00813483          	ld	s1,8(sp)
    80001bec:	02010113          	addi	sp,sp,32
    80001bf0:	00008067          	ret
            id->blockHead = pNewBlock;
    80001bf4:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    80001bf8:	00a4b423          	sd	a0,8(s1)
    80001bfc:	fc5ff06f          	j	80001bc0 <_ZN4_sem4waitEPS_+0x64>

0000000080001c00 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    80001c00:	01052783          	lw	a5,16(a0)
    80001c04:	0017879b          	addiw	a5,a5,1
    80001c08:	0007871b          	sext.w	a4,a5
    80001c0c:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    80001c10:	00e05463          	blez	a4,80001c18 <_ZN4_sem6signalEPS_+0x18>
    80001c14:	00008067          	ret
void _sem::signal(sem_t id){
    80001c18:	fe010113          	addi	sp,sp,-32
    80001c1c:	00113c23          	sd	ra,24(sp)
    80001c20:	00813823          	sd	s0,16(sp)
    80001c24:	00913423          	sd	s1,8(sp)
    80001c28:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    80001c2c:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    80001c30:	0084b783          	ld	a5,8(s1)
    80001c34:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    80001c38:	04078063          	beqz	a5,80001c78 <_ZN4_sem6signalEPS_+0x78>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    80001c3c:	00000593          	li	a1,0
    80001c40:	0004b503          	ld	a0,0(s1)
    80001c44:	00002097          	auipc	ra,0x2
    80001c48:	93c080e7          	jalr	-1732(ra) # 80003580 <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    80001c4c:	00048513          	mv	a0,s1
    80001c50:	00000097          	auipc	ra,0x0
    80001c54:	c10080e7          	jalr	-1008(ra) # 80001860 <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    80001c58:	0004b503          	ld	a0,0(s1)
    80001c5c:	00003097          	auipc	ra,0x3
    80001c60:	b84080e7          	jalr	-1148(ra) # 800047e0 <_ZN9Scheduler3putEP7_thread>
    }
    80001c64:	01813083          	ld	ra,24(sp)
    80001c68:	01013403          	ld	s0,16(sp)
    80001c6c:	00813483          	ld	s1,8(sp)
    80001c70:	02010113          	addi	sp,sp,32
    80001c74:	00008067          	ret
            id->blockTail = 0;
    80001c78:	00053423          	sd	zero,8(a0)
    80001c7c:	fc1ff06f          	j	80001c3c <_ZN4_sem6signalEPS_+0x3c>

0000000080001c80 <main>:
#include "assert.h"
#include "syscall_c.h"
#include "console.h"

/// @brief first function to be called
void main(){
    80001c80:	f8010113          	addi	sp,sp,-128
    80001c84:	06113c23          	sd	ra,120(sp)
    80001c88:	06813823          	sd	s0,112(sp)
    80001c8c:	06913423          	sd	s1,104(sp)
    80001c90:	08010413          	addi	s0,sp,128
    80001c94:	ffffe2b7          	lui	t0,0xffffe
    80001c98:	00510133          	add	sp,sp,t0
    Kernel kernel = Kernel();
    80001c9c:	ffffe4b7          	lui	s1,0xffffe
    80001ca0:	fa048493          	addi	s1,s1,-96 # ffffffffffffdfa0 <end+0xffffffff7ffeed40>
    80001ca4:	fe040793          	addi	a5,s0,-32
    80001ca8:	009784b3          	add	s1,a5,s1
    80001cac:	00048513          	mv	a0,s1
    80001cb0:	00001097          	auipc	ra,0x1
    80001cb4:	aa4080e7          	jalr	-1372(ra) # 80002754 <_ZN6KernelC1Ev>
    kernel.initialise();
    80001cb8:	00048513          	mv	a0,s1
    80001cbc:	00001097          	auipc	ra,0x1
    80001cc0:	b3c080e7          	jalr	-1220(ra) # 800027f8 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    80001cc4:	00048513          	mv	a0,s1
    80001cc8:	00001097          	auipc	ra,0x1
    80001ccc:	bb4080e7          	jalr	-1100(ra) # 8000287c <_ZN6Kernel3runEv>
    80001cd0:	00050493          	mv	s1,a0
    putc('\n');
    80001cd4:	00a00513          	li	a0,10
    80001cd8:	00000097          	auipc	ra,0x0
    80001cdc:	da4080e7          	jalr	-604(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001ce0:	02d00513          	li	a0,45
    80001ce4:	00000097          	auipc	ra,0x0
    80001ce8:	d98080e7          	jalr	-616(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001cec:	02d00513          	li	a0,45
    80001cf0:	00000097          	auipc	ra,0x0
    80001cf4:	d8c080e7          	jalr	-628(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001cf8:	02d00513          	li	a0,45
    80001cfc:	00000097          	auipc	ra,0x0
    80001d00:	d80080e7          	jalr	-640(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d04:	02d00513          	li	a0,45
    80001d08:	00000097          	auipc	ra,0x0
    80001d0c:	d74080e7          	jalr	-652(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d10:	02d00513          	li	a0,45
    80001d14:	00000097          	auipc	ra,0x0
    80001d18:	d68080e7          	jalr	-664(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d1c:	02d00513          	li	a0,45
    80001d20:	00000097          	auipc	ra,0x0
    80001d24:	d5c080e7          	jalr	-676(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d28:	02d00513          	li	a0,45
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	d50080e7          	jalr	-688(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d34:	02d00513          	li	a0,45
    80001d38:	00000097          	auipc	ra,0x0
    80001d3c:	d44080e7          	jalr	-700(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d40:	02d00513          	li	a0,45
    80001d44:	00000097          	auipc	ra,0x0
    80001d48:	d38080e7          	jalr	-712(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d4c:	02d00513          	li	a0,45
    80001d50:	00000097          	auipc	ra,0x0
    80001d54:	d2c080e7          	jalr	-724(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d58:	02d00513          	li	a0,45
    80001d5c:	00000097          	auipc	ra,0x0
    80001d60:	d20080e7          	jalr	-736(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d64:	02d00513          	li	a0,45
    80001d68:	00000097          	auipc	ra,0x0
    80001d6c:	d14080e7          	jalr	-748(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d70:	02d00513          	li	a0,45
    80001d74:	00000097          	auipc	ra,0x0
    80001d78:	d08080e7          	jalr	-760(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d7c:	02d00513          	li	a0,45
    80001d80:	00000097          	auipc	ra,0x0
    80001d84:	cfc080e7          	jalr	-772(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d88:	02d00513          	li	a0,45
    80001d8c:	00000097          	auipc	ra,0x0
    80001d90:	cf0080e7          	jalr	-784(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001d94:	02d00513          	li	a0,45
    80001d98:	00000097          	auipc	ra,0x0
    80001d9c:	ce4080e7          	jalr	-796(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001da0:	02d00513          	li	a0,45
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	cd8080e7          	jalr	-808(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001dac:	02d00513          	li	a0,45
    80001db0:	00000097          	auipc	ra,0x0
    80001db4:	ccc080e7          	jalr	-820(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001db8:	02d00513          	li	a0,45
    80001dbc:	00000097          	auipc	ra,0x0
    80001dc0:	cc0080e7          	jalr	-832(ra) # 80001a7c <_Z4putcc>
    putc('-');
    80001dc4:	02d00513          	li	a0,45
    80001dc8:	00000097          	auipc	ra,0x0
    80001dcc:	cb4080e7          	jalr	-844(ra) # 80001a7c <_Z4putcc>
    putc('\n');
    80001dd0:	00a00513          	li	a0,10
    80001dd4:	00000097          	auipc	ra,0x0
    80001dd8:	ca8080e7          	jalr	-856(ra) # 80001a7c <_Z4putcc>
    putc('\n');
    80001ddc:	00a00513          	li	a0,10
    80001de0:	00000097          	auipc	ra,0x0
    80001de4:	c9c080e7          	jalr	-868(ra) # 80001a7c <_Z4putcc>
    putc('K');
    80001de8:	04b00513          	li	a0,75
    80001dec:	00000097          	auipc	ra,0x0
    80001df0:	c90080e7          	jalr	-880(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80001df4:	06500513          	li	a0,101
    80001df8:	00000097          	auipc	ra,0x0
    80001dfc:	c84080e7          	jalr	-892(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80001e00:	07200513          	li	a0,114
    80001e04:	00000097          	auipc	ra,0x0
    80001e08:	c78080e7          	jalr	-904(ra) # 80001a7c <_Z4putcc>
    putc('n');
    80001e0c:	06e00513          	li	a0,110
    80001e10:	00000097          	auipc	ra,0x0
    80001e14:	c6c080e7          	jalr	-916(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80001e18:	06500513          	li	a0,101
    80001e1c:	00000097          	auipc	ra,0x0
    80001e20:	c60080e7          	jalr	-928(ra) # 80001a7c <_Z4putcc>
    putc('l');
    80001e24:	06c00513          	li	a0,108
    80001e28:	00000097          	auipc	ra,0x0
    80001e2c:	c54080e7          	jalr	-940(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    80001e30:	02000513          	li	a0,32
    80001e34:	00000097          	auipc	ra,0x0
    80001e38:	c48080e7          	jalr	-952(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80001e3c:	06500513          	li	a0,101
    80001e40:	00000097          	auipc	ra,0x0
    80001e44:	c3c080e7          	jalr	-964(ra) # 80001a7c <_Z4putcc>
    putc('x');
    80001e48:	07800513          	li	a0,120
    80001e4c:	00000097          	auipc	ra,0x0
    80001e50:	c30080e7          	jalr	-976(ra) # 80001a7c <_Z4putcc>
    putc('i');
    80001e54:	06900513          	li	a0,105
    80001e58:	00000097          	auipc	ra,0x0
    80001e5c:	c24080e7          	jalr	-988(ra) # 80001a7c <_Z4putcc>
    putc('t');
    80001e60:	07400513          	li	a0,116
    80001e64:	00000097          	auipc	ra,0x0
    80001e68:	c18080e7          	jalr	-1000(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80001e6c:	06500513          	li	a0,101
    80001e70:	00000097          	auipc	ra,0x0
    80001e74:	c0c080e7          	jalr	-1012(ra) # 80001a7c <_Z4putcc>
    putc('d');
    80001e78:	06400513          	li	a0,100
    80001e7c:	00000097          	auipc	ra,0x0
    80001e80:	c00080e7          	jalr	-1024(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    80001e84:	02000513          	li	a0,32
    80001e88:	00000097          	auipc	ra,0x0
    80001e8c:	bf4080e7          	jalr	-1036(ra) # 80001a7c <_Z4putcc>
    putc('w');
    80001e90:	07700513          	li	a0,119
    80001e94:	00000097          	auipc	ra,0x0
    80001e98:	be8080e7          	jalr	-1048(ra) # 80001a7c <_Z4putcc>
    putc('i');
    80001e9c:	06900513          	li	a0,105
    80001ea0:	00000097          	auipc	ra,0x0
    80001ea4:	bdc080e7          	jalr	-1060(ra) # 80001a7c <_Z4putcc>
    putc('t');
    80001ea8:	07400513          	li	a0,116
    80001eac:	00000097          	auipc	ra,0x0
    80001eb0:	bd0080e7          	jalr	-1072(ra) # 80001a7c <_Z4putcc>
    putc('h');
    80001eb4:	06800513          	li	a0,104
    80001eb8:	00000097          	auipc	ra,0x0
    80001ebc:	bc4080e7          	jalr	-1084(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    80001ec0:	02000513          	li	a0,32
    80001ec4:	00000097          	auipc	ra,0x0
    80001ec8:	bb8080e7          	jalr	-1096(ra) # 80001a7c <_Z4putcc>
    putc('c');
    80001ecc:	06300513          	li	a0,99
    80001ed0:	00000097          	auipc	ra,0x0
    80001ed4:	bac080e7          	jalr	-1108(ra) # 80001a7c <_Z4putcc>
    putc('o');
    80001ed8:	06f00513          	li	a0,111
    80001edc:	00000097          	auipc	ra,0x0
    80001ee0:	ba0080e7          	jalr	-1120(ra) # 80001a7c <_Z4putcc>
    putc('d');
    80001ee4:	06400513          	li	a0,100
    80001ee8:	00000097          	auipc	ra,0x0
    80001eec:	b94080e7          	jalr	-1132(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80001ef0:	06500513          	li	a0,101
    80001ef4:	00000097          	auipc	ra,0x0
    80001ef8:	b88080e7          	jalr	-1144(ra) # 80001a7c <_Z4putcc>
    putc(':');
    80001efc:	03a00513          	li	a0,58
    80001f00:	00000097          	auipc	ra,0x0
    80001f04:	b7c080e7          	jalr	-1156(ra) # 80001a7c <_Z4putcc>
    switch(exitCode){
    80001f08:	00048e63          	beqz	s1,80001f24 <main+0x2a4>
    80001f0c:	00100793          	li	a5,1
    80001f10:	02f48263          	beq	s1,a5,80001f34 <main+0x2b4>
            break;
        case Kernel::EXIT_FAILURE:
            putc('1');
            break;
        default:
            putc('2');
    80001f14:	03200513          	li	a0,50
    80001f18:	00000097          	auipc	ra,0x0
    80001f1c:	b64080e7          	jalr	-1180(ra) # 80001a7c <_Z4putcc>
    80001f20:	0200006f          	j	80001f40 <main+0x2c0>
            putc('0');
    80001f24:	03000513          	li	a0,48
    80001f28:	00000097          	auipc	ra,0x0
    80001f2c:	b54080e7          	jalr	-1196(ra) # 80001a7c <_Z4putcc>
    80001f30:	0100006f          	j	80001f40 <main+0x2c0>
            putc('1');
    80001f34:	03100513          	li	a0,49
    80001f38:	00000097          	auipc	ra,0x0
    80001f3c:	b44080e7          	jalr	-1212(ra) # 80001a7c <_Z4putcc>
            break;
    }
    putc('\n');
    80001f40:	00a00513          	li	a0,10
    80001f44:	00000097          	auipc	ra,0x0
    80001f48:	b38080e7          	jalr	-1224(ra) # 80001a7c <_Z4putcc>
    Console::outputHandler();
    80001f4c:	00000097          	auipc	ra,0x0
    80001f50:	6c8080e7          	jalr	1736(ra) # 80002614 <_ZN7Console13outputHandlerEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001f54:	02049c63          	bnez	s1,80001f8c <main+0x30c>
    Kernel kernel = Kernel();
    80001f58:	ffffe537          	lui	a0,0xffffe
    80001f5c:	fa050513          	addi	a0,a0,-96 # ffffffffffffdfa0 <end+0xffffffff7ffeed40>
    80001f60:	fe040793          	addi	a5,s0,-32
    80001f64:	00a78533          	add	a0,a5,a0
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	074080e7          	jalr	116(ra) # 80001fdc <_ZN6KernelD1Ev>
    80001f70:	000022b7          	lui	t0,0x2
    80001f74:	00510133          	add	sp,sp,t0
    80001f78:	07813083          	ld	ra,120(sp)
    80001f7c:	07013403          	ld	s0,112(sp)
    80001f80:	06813483          	ld	s1,104(sp)
    80001f84:	08010113          	addi	sp,sp,128
    80001f88:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001f8c:	00009697          	auipc	a3,0x9
    80001f90:	0fc68693          	addi	a3,a3,252 # 8000b088 <CONSOLE_STATUS+0x78>
    80001f94:	05200613          	li	a2,82
    80001f98:	00009597          	auipc	a1,0x9
    80001f9c:	10058593          	addi	a1,a1,256 # 8000b098 <CONSOLE_STATUS+0x88>
    80001fa0:	00009517          	auipc	a0,0x9
    80001fa4:	10850513          	addi	a0,a0,264 # 8000b0a8 <CONSOLE_STATUS+0x98>
    80001fa8:	00000097          	auipc	ra,0x0
    80001fac:	084080e7          	jalr	132(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80001fb0:	fa9ff06f          	j	80001f58 <main+0x2d8>
    80001fb4:	00050493          	mv	s1,a0
    Kernel kernel = Kernel();
    80001fb8:	ffffe537          	lui	a0,0xffffe
    80001fbc:	fa050513          	addi	a0,a0,-96 # ffffffffffffdfa0 <end+0xffffffff7ffeed40>
    80001fc0:	fe040793          	addi	a5,s0,-32
    80001fc4:	00a78533          	add	a0,a5,a0
    80001fc8:	00000097          	auipc	ra,0x0
    80001fcc:	014080e7          	jalr	20(ra) # 80001fdc <_ZN6KernelD1Ev>
    80001fd0:	00048513          	mv	a0,s1
    80001fd4:	0000d097          	auipc	ra,0xd
    80001fd8:	0f4080e7          	jalr	244(ra) # 8000f0c8 <_Unwind_Resume>

0000000080001fdc <_ZN6KernelD1Ev>:
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    80001fdc:	fe010113          	addi	sp,sp,-32
    80001fe0:	00113c23          	sd	ra,24(sp)
    80001fe4:	00813823          	sd	s0,16(sp)
    80001fe8:	00913423          	sd	s1,8(sp)
    80001fec:	02010413          	addi	s0,sp,32
    80001ff0:	00050493          	mv	s1,a0
    80001ff4:	02850513          	addi	a0,a0,40
    80001ff8:	00000097          	auipc	ra,0x0
    80001ffc:	3ec080e7          	jalr	1004(ra) # 800023e4 <_ZN7ConsoleD1Ev>
    80002000:	01848513          	addi	a0,s1,24
    80002004:	fffff097          	auipc	ra,0xfffff
    80002008:	5f0080e7          	jalr	1520(ra) # 800015f4 <_ZN5TimerD1Ev>
    8000200c:	00048513          	mv	a0,s1
    80002010:	00001097          	auipc	ra,0x1
    80002014:	7a4080e7          	jalr	1956(ra) # 800037b4 <_ZN11HeapManagerD1Ev>
    80002018:	01813083          	ld	ra,24(sp)
    8000201c:	01013403          	ld	s0,16(sp)
    80002020:	00813483          	ld	s1,8(sp)
    80002024:	02010113          	addi	sp,sp,32
    80002028:	00008067          	ret

000000008000202c <_Z13assert_failedPKcS0_jS0_>:
 * 
 */
#include "assert.h"
#include "syscall_c.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    8000202c:	fb010113          	addi	sp,sp,-80
    80002030:	04113423          	sd	ra,72(sp)
    80002034:	04813023          	sd	s0,64(sp)
    80002038:	02913c23          	sd	s1,56(sp)
    8000203c:	03213823          	sd	s2,48(sp)
    80002040:	03313423          	sd	s3,40(sp)
    80002044:	03413023          	sd	s4,32(sp)
    80002048:	05010413          	addi	s0,sp,80
    8000204c:	00050993          	mv	s3,a0
    80002050:	00058493          	mv	s1,a1
    80002054:	00060913          	mv	s2,a2
    80002058:	00068a13          	mv	s4,a3
    putc('\n');
    8000205c:	00a00513          	li	a0,10
    80002060:	00000097          	auipc	ra,0x0
    80002064:	a1c080e7          	jalr	-1508(ra) # 80001a7c <_Z4putcc>
    putc('A');
    80002068:	04100513          	li	a0,65
    8000206c:	00000097          	auipc	ra,0x0
    80002070:	a10080e7          	jalr	-1520(ra) # 80001a7c <_Z4putcc>
    putc('s');
    80002074:	07300513          	li	a0,115
    80002078:	00000097          	auipc	ra,0x0
    8000207c:	a04080e7          	jalr	-1532(ra) # 80001a7c <_Z4putcc>
    putc('s');
    80002080:	07300513          	li	a0,115
    80002084:	00000097          	auipc	ra,0x0
    80002088:	9f8080e7          	jalr	-1544(ra) # 80001a7c <_Z4putcc>
    putc('e');
    8000208c:	06500513          	li	a0,101
    80002090:	00000097          	auipc	ra,0x0
    80002094:	9ec080e7          	jalr	-1556(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002098:	07200513          	li	a0,114
    8000209c:	00000097          	auipc	ra,0x0
    800020a0:	9e0080e7          	jalr	-1568(ra) # 80001a7c <_Z4putcc>
    putc('t');
    800020a4:	07400513          	li	a0,116
    800020a8:	00000097          	auipc	ra,0x0
    800020ac:	9d4080e7          	jalr	-1580(ra) # 80001a7c <_Z4putcc>
    putc('i');
    800020b0:	06900513          	li	a0,105
    800020b4:	00000097          	auipc	ra,0x0
    800020b8:	9c8080e7          	jalr	-1592(ra) # 80001a7c <_Z4putcc>
    putc('o');
    800020bc:	06f00513          	li	a0,111
    800020c0:	00000097          	auipc	ra,0x0
    800020c4:	9bc080e7          	jalr	-1604(ra) # 80001a7c <_Z4putcc>
    putc('n');
    800020c8:	06e00513          	li	a0,110
    800020cc:	00000097          	auipc	ra,0x0
    800020d0:	9b0080e7          	jalr	-1616(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    800020d4:	02000513          	li	a0,32
    800020d8:	00000097          	auipc	ra,0x0
    800020dc:	9a4080e7          	jalr	-1628(ra) # 80001a7c <_Z4putcc>
    putc('\'');
    800020e0:	02700513          	li	a0,39
    800020e4:	00000097          	auipc	ra,0x0
    800020e8:	998080e7          	jalr	-1640(ra) # 80001a7c <_Z4putcc>
    while(*__assertion != 0){
    800020ec:	0009c503          	lbu	a0,0(s3)
    800020f0:	00050a63          	beqz	a0,80002104 <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    800020f4:	00000097          	auipc	ra,0x0
    800020f8:	988080e7          	jalr	-1656(ra) # 80001a7c <_Z4putcc>
        __assertion++;
    800020fc:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    80002100:	fedff06f          	j	800020ec <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    80002104:	02700513          	li	a0,39
    80002108:	00000097          	auipc	ra,0x0
    8000210c:	974080e7          	jalr	-1676(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    80002110:	02000513          	li	a0,32
    80002114:	00000097          	auipc	ra,0x0
    80002118:	968080e7          	jalr	-1688(ra) # 80001a7c <_Z4putcc>
    putc('f');
    8000211c:	06600513          	li	a0,102
    80002120:	00000097          	auipc	ra,0x0
    80002124:	95c080e7          	jalr	-1700(ra) # 80001a7c <_Z4putcc>
    putc('a');
    80002128:	06100513          	li	a0,97
    8000212c:	00000097          	auipc	ra,0x0
    80002130:	950080e7          	jalr	-1712(ra) # 80001a7c <_Z4putcc>
    putc('i');
    80002134:	06900513          	li	a0,105
    80002138:	00000097          	auipc	ra,0x0
    8000213c:	944080e7          	jalr	-1724(ra) # 80001a7c <_Z4putcc>
    putc('l');
    80002140:	06c00513          	li	a0,108
    80002144:	00000097          	auipc	ra,0x0
    80002148:	938080e7          	jalr	-1736(ra) # 80001a7c <_Z4putcc>
    putc('e');
    8000214c:	06500513          	li	a0,101
    80002150:	00000097          	auipc	ra,0x0
    80002154:	92c080e7          	jalr	-1748(ra) # 80001a7c <_Z4putcc>
    putc('d');
    80002158:	06400513          	li	a0,100
    8000215c:	00000097          	auipc	ra,0x0
    80002160:	920080e7          	jalr	-1760(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    80002164:	02000513          	li	a0,32
    80002168:	00000097          	auipc	ra,0x0
    8000216c:	914080e7          	jalr	-1772(ra) # 80001a7c <_Z4putcc>
    putc('i');
    80002170:	06900513          	li	a0,105
    80002174:	00000097          	auipc	ra,0x0
    80002178:	908080e7          	jalr	-1784(ra) # 80001a7c <_Z4putcc>
    putc('n');
    8000217c:	06e00513          	li	a0,110
    80002180:	00000097          	auipc	ra,0x0
    80002184:	8fc080e7          	jalr	-1796(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    80002188:	02000513          	li	a0,32
    8000218c:	00000097          	auipc	ra,0x0
    80002190:	8f0080e7          	jalr	-1808(ra) # 80001a7c <_Z4putcc>
    putc('f');
    80002194:	06600513          	li	a0,102
    80002198:	00000097          	auipc	ra,0x0
    8000219c:	8e4080e7          	jalr	-1820(ra) # 80001a7c <_Z4putcc>
    putc('i');
    800021a0:	06900513          	li	a0,105
    800021a4:	00000097          	auipc	ra,0x0
    800021a8:	8d8080e7          	jalr	-1832(ra) # 80001a7c <_Z4putcc>
    putc('l');
    800021ac:	06c00513          	li	a0,108
    800021b0:	00000097          	auipc	ra,0x0
    800021b4:	8cc080e7          	jalr	-1844(ra) # 80001a7c <_Z4putcc>
    putc('e');
    800021b8:	06500513          	li	a0,101
    800021bc:	00000097          	auipc	ra,0x0
    800021c0:	8c0080e7          	jalr	-1856(ra) # 80001a7c <_Z4putcc>
    putc(':');
    800021c4:	03a00513          	li	a0,58
    800021c8:	00000097          	auipc	ra,0x0
    800021cc:	8b4080e7          	jalr	-1868(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    800021d0:	02000513          	li	a0,32
    800021d4:	00000097          	auipc	ra,0x0
    800021d8:	8a8080e7          	jalr	-1880(ra) # 80001a7c <_Z4putcc>
    while(*__file != 0){
    800021dc:	0004c503          	lbu	a0,0(s1)
    800021e0:	00050a63          	beqz	a0,800021f4 <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    800021e4:	00000097          	auipc	ra,0x0
    800021e8:	898080e7          	jalr	-1896(ra) # 80001a7c <_Z4putcc>
        __file++;
    800021ec:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    800021f0:	fedff06f          	j	800021dc <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    800021f4:	00a00513          	li	a0,10
    800021f8:	00000097          	auipc	ra,0x0
    800021fc:	884080e7          	jalr	-1916(ra) # 80001a7c <_Z4putcc>
    putc('l');
    80002200:	06c00513          	li	a0,108
    80002204:	00000097          	auipc	ra,0x0
    80002208:	878080e7          	jalr	-1928(ra) # 80001a7c <_Z4putcc>
    putc('i');
    8000220c:	06900513          	li	a0,105
    80002210:	00000097          	auipc	ra,0x0
    80002214:	86c080e7          	jalr	-1940(ra) # 80001a7c <_Z4putcc>
    putc('n');
    80002218:	06e00513          	li	a0,110
    8000221c:	00000097          	auipc	ra,0x0
    80002220:	860080e7          	jalr	-1952(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002224:	06500513          	li	a0,101
    80002228:	00000097          	auipc	ra,0x0
    8000222c:	854080e7          	jalr	-1964(ra) # 80001a7c <_Z4putcc>
    putc(':');
    80002230:	03a00513          	li	a0,58
    80002234:	00000097          	auipc	ra,0x0
    80002238:	848080e7          	jalr	-1976(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    8000223c:	02000513          	li	a0,32
    80002240:	00000097          	auipc	ra,0x0
    80002244:	83c080e7          	jalr	-1988(ra) # 80001a7c <_Z4putcc>
    char buffer[20];
    int i = 0;
    80002248:	00000493          	li	s1,0
    while(__line != 0){
    8000224c:	02090463          	beqz	s2,80002274 <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80002250:	00a00713          	li	a4,10
    80002254:	02e977bb          	remuw	a5,s2,a4
    80002258:	0307879b          	addiw	a5,a5,48
    8000225c:	fd040693          	addi	a3,s0,-48
    80002260:	009686b3          	add	a3,a3,s1
    80002264:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    80002268:	02e9593b          	divuw	s2,s2,a4
        i++;
    8000226c:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    80002270:	fddff06f          	j	8000224c <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    80002274:	02048063          	beqz	s1,80002294 <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    80002278:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    8000227c:	fd040793          	addi	a5,s0,-48
    80002280:	009787b3          	add	a5,a5,s1
    80002284:	fe87c503          	lbu	a0,-24(a5)
    80002288:	fffff097          	auipc	ra,0xfffff
    8000228c:	7f4080e7          	jalr	2036(ra) # 80001a7c <_Z4putcc>
    80002290:	fe5ff06f          	j	80002274 <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80002294:	00a00513          	li	a0,10
    80002298:	fffff097          	auipc	ra,0xfffff
    8000229c:	7e4080e7          	jalr	2020(ra) # 80001a7c <_Z4putcc>
    putc('f');
    800022a0:	06600513          	li	a0,102
    800022a4:	fffff097          	auipc	ra,0xfffff
    800022a8:	7d8080e7          	jalr	2008(ra) # 80001a7c <_Z4putcc>
    putc('u');
    800022ac:	07500513          	li	a0,117
    800022b0:	fffff097          	auipc	ra,0xfffff
    800022b4:	7cc080e7          	jalr	1996(ra) # 80001a7c <_Z4putcc>
    putc('n');
    800022b8:	06e00513          	li	a0,110
    800022bc:	fffff097          	auipc	ra,0xfffff
    800022c0:	7c0080e7          	jalr	1984(ra) # 80001a7c <_Z4putcc>
    putc('c');
    800022c4:	06300513          	li	a0,99
    800022c8:	fffff097          	auipc	ra,0xfffff
    800022cc:	7b4080e7          	jalr	1972(ra) # 80001a7c <_Z4putcc>
    putc('t');
    800022d0:	07400513          	li	a0,116
    800022d4:	fffff097          	auipc	ra,0xfffff
    800022d8:	7a8080e7          	jalr	1960(ra) # 80001a7c <_Z4putcc>
    putc('i');
    800022dc:	06900513          	li	a0,105
    800022e0:	fffff097          	auipc	ra,0xfffff
    800022e4:	79c080e7          	jalr	1948(ra) # 80001a7c <_Z4putcc>
    putc('o');
    800022e8:	06f00513          	li	a0,111
    800022ec:	fffff097          	auipc	ra,0xfffff
    800022f0:	790080e7          	jalr	1936(ra) # 80001a7c <_Z4putcc>
    putc('n');
    800022f4:	06e00513          	li	a0,110
    800022f8:	fffff097          	auipc	ra,0xfffff
    800022fc:	784080e7          	jalr	1924(ra) # 80001a7c <_Z4putcc>
    putc(':');
    80002300:	03a00513          	li	a0,58
    80002304:	fffff097          	auipc	ra,0xfffff
    80002308:	778080e7          	jalr	1912(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    8000230c:	02000513          	li	a0,32
    80002310:	fffff097          	auipc	ra,0xfffff
    80002314:	76c080e7          	jalr	1900(ra) # 80001a7c <_Z4putcc>
    putc('\'');
    80002318:	02700513          	li	a0,39
    8000231c:	fffff097          	auipc	ra,0xfffff
    80002320:	760080e7          	jalr	1888(ra) # 80001a7c <_Z4putcc>
    while(*__function != 0){
    80002324:	000a4503          	lbu	a0,0(s4)
    80002328:	00050a63          	beqz	a0,8000233c <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    8000232c:	fffff097          	auipc	ra,0xfffff
    80002330:	750080e7          	jalr	1872(ra) # 80001a7c <_Z4putcc>
        __function ++;
    80002334:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80002338:	fedff06f          	j	80002324 <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    8000233c:	02700513          	li	a0,39
    80002340:	fffff097          	auipc	ra,0xfffff
    80002344:	73c080e7          	jalr	1852(ra) # 80001a7c <_Z4putcc>
    putc('\n');
    80002348:	00a00513          	li	a0,10
    8000234c:	fffff097          	auipc	ra,0xfffff
    80002350:	730080e7          	jalr	1840(ra) # 80001a7c <_Z4putcc>
    while(1);
    80002354:	0000006f          	j	80002354 <_Z13assert_failedPKcS0_jS0_+0x328>

0000000080002358 <_ZN7ConsoleC1Ev>:
#include "syscall_c.h"
#include "assert.h"

Console* Console::instance = 0;

Console::Console(){
    80002358:	fe010113          	addi	sp,sp,-32
    8000235c:	00113c23          	sd	ra,24(sp)
    80002360:	00813823          	sd	s0,16(sp)
    80002364:	00913423          	sd	s1,8(sp)
    80002368:	02010413          	addi	s0,sp,32
    8000236c:	00050493          	mv	s1,a0
    
    sem_t inSem;

    struct consoleBuffer{
    public:
        consoleBuffer(): head(0), tail(0), size(0){}
    80002370:	00001737          	lui	a4,0x1
    80002374:	00e507b3          	add	a5,a0,a4
    80002378:	0007b423          	sd	zero,8(a5)
    8000237c:	0007b823          	sd	zero,16(a5)
    80002380:	0007bc23          	sd	zero,24(a5)
    80002384:	00e787b3          	add	a5,a5,a4
    80002388:	0207b023          	sd	zero,32(a5)
    8000238c:	0207b423          	sd	zero,40(a5)
    80002390:	0207b823          	sd	zero,48(a5)
    assert(instance == 0);
    80002394:	0000c797          	auipc	a5,0xc
    80002398:	be47b783          	ld	a5,-1052(a5) # 8000df78 <_ZN7Console8instanceE>
    8000239c:	02079063          	bnez	a5,800023bc <_ZN7ConsoleC1Ev+0x64>
    instance = this;
    800023a0:	0000c797          	auipc	a5,0xc
    800023a4:	bc97bc23          	sd	s1,-1064(a5) # 8000df78 <_ZN7Console8instanceE>
}
    800023a8:	01813083          	ld	ra,24(sp)
    800023ac:	01013403          	ld	s0,16(sp)
    800023b0:	00813483          	ld	s1,8(sp)
    800023b4:	02010113          	addi	sp,sp,32
    800023b8:	00008067          	ret
    assert(instance == 0);
    800023bc:	00009697          	auipc	a3,0x9
    800023c0:	d1468693          	addi	a3,a3,-748 # 8000b0d0 <CONSOLE_STATUS+0xc0>
    800023c4:	01300613          	li	a2,19
    800023c8:	00009597          	auipc	a1,0x9
    800023cc:	d2058593          	addi	a1,a1,-736 # 8000b0e8 <CONSOLE_STATUS+0xd8>
    800023d0:	00009517          	auipc	a0,0x9
    800023d4:	c7050513          	addi	a0,a0,-912 # 8000b040 <CONSOLE_STATUS+0x30>
    800023d8:	00000097          	auipc	ra,0x0
    800023dc:	c54080e7          	jalr	-940(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800023e0:	fc1ff06f          	j	800023a0 <_ZN7ConsoleC1Ev+0x48>

00000000800023e4 <_ZN7ConsoleD1Ev>:

Console::~Console(){
    800023e4:	ff010113          	addi	sp,sp,-16
    800023e8:	00113423          	sd	ra,8(sp)
    800023ec:	00813023          	sd	s0,0(sp)
    800023f0:	01010413          	addi	s0,sp,16
    sem_close(inSem);
    800023f4:	00053503          	ld	a0,0(a0)
    800023f8:	fffff097          	auipc	ra,0xfffff
    800023fc:	5d8080e7          	jalr	1496(ra) # 800019d0 <_Z9sem_closeP4_sem>
}
    80002400:	00813083          	ld	ra,8(sp)
    80002404:	00013403          	ld	s0,0(sp)
    80002408:	01010113          	addi	sp,sp,16
    8000240c:	00008067          	ret

0000000080002410 <_ZN7Console4initEv>:

void Console::init(){
    80002410:	ff010113          	addi	sp,sp,-16
    80002414:	00113423          	sd	ra,8(sp)
    80002418:	00813023          	sd	s0,0(sp)
    8000241c:	01010413          	addi	s0,sp,16
    sem_open(&inSem, 0);
    80002420:	00000593          	li	a1,0
    80002424:	fffff097          	auipc	ra,0xfffff
    80002428:	574080e7          	jalr	1396(ra) # 80001998 <_Z8sem_openPP4_semj>
}
    8000242c:	00813083          	ld	ra,8(sp)
    80002430:	00013403          	ld	s0,0(sp)
    80002434:	01010113          	addi	sp,sp,16
    80002438:	00008067          	ret

000000008000243c <_ZN7Console11getInstanceEv>:

Console& Console::getInstance(){
    assert(instance != 0);
    8000243c:	0000c797          	auipc	a5,0xc
    80002440:	b3c7b783          	ld	a5,-1220(a5) # 8000df78 <_ZN7Console8instanceE>
    80002444:	00078863          	beqz	a5,80002454 <_ZN7Console11getInstanceEv+0x18>
    return *instance;
}
    80002448:	0000c517          	auipc	a0,0xc
    8000244c:	b3053503          	ld	a0,-1232(a0) # 8000df78 <_ZN7Console8instanceE>
    80002450:	00008067          	ret
Console& Console::getInstance(){
    80002454:	ff010113          	addi	sp,sp,-16
    80002458:	00113423          	sd	ra,8(sp)
    8000245c:	00813023          	sd	s0,0(sp)
    80002460:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80002464:	00009697          	auipc	a3,0x9
    80002468:	c9468693          	addi	a3,a3,-876 # 8000b0f8 <CONSOLE_STATUS+0xe8>
    8000246c:	02000613          	li	a2,32
    80002470:	00009597          	auipc	a1,0x9
    80002474:	c7858593          	addi	a1,a1,-904 # 8000b0e8 <CONSOLE_STATUS+0xd8>
    80002478:	00009517          	auipc	a0,0x9
    8000247c:	c0050513          	addi	a0,a0,-1024 # 8000b078 <CONSOLE_STATUS+0x68>
    80002480:	00000097          	auipc	ra,0x0
    80002484:	bac080e7          	jalr	-1108(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
}
    80002488:	0000c517          	auipc	a0,0xc
    8000248c:	af053503          	ld	a0,-1296(a0) # 8000df78 <_ZN7Console8instanceE>
    80002490:	00813083          	ld	ra,8(sp)
    80002494:	00013403          	ld	s0,0(sp)
    80002498:	01010113          	addi	sp,sp,16
    8000249c:	00008067          	ret

00000000800024a0 <_ZN7Console13consoleBuffer3putEc>:

void Console::consoleBuffer::put(char c){
    800024a0:	ff010113          	addi	sp,sp,-16
    800024a4:	00813423          	sd	s0,8(sp)
    800024a8:	01010413          	addi	s0,sp,16
    buffer[tail] = c;
    800024ac:	000016b7          	lui	a3,0x1
    800024b0:	00d50733          	add	a4,a0,a3
    800024b4:	00873783          	ld	a5,8(a4) # 1008 <_entry-0x7fffeff8>
    800024b8:	00f50533          	add	a0,a0,a5
    800024bc:	00b50023          	sb	a1,0(a0)
    tail = (tail + 1) % BUFFER_SIZE;
    800024c0:	00178793          	addi	a5,a5,1
    800024c4:	fff68693          	addi	a3,a3,-1 # fff <_entry-0x7ffff001>
    800024c8:	00d7f7b3          	and	a5,a5,a3
    800024cc:	00f73423          	sd	a5,8(a4)
    size++;
    800024d0:	01073783          	ld	a5,16(a4)
    800024d4:	00178793          	addi	a5,a5,1
    800024d8:	00f73823          	sd	a5,16(a4)
}
    800024dc:	00813403          	ld	s0,8(sp)
    800024e0:	01010113          	addi	sp,sp,16
    800024e4:	00008067          	ret

00000000800024e8 <_ZN7Console13consoleBuffer3getEv>:

char Console::consoleBuffer::get(){
    800024e8:	ff010113          	addi	sp,sp,-16
    800024ec:	00813423          	sd	s0,8(sp)
    800024f0:	01010413          	addi	s0,sp,16
    char c = buffer[head];
    800024f4:	000016b7          	lui	a3,0x1
    800024f8:	00d50733          	add	a4,a0,a3
    800024fc:	00073783          	ld	a5,0(a4)
    80002500:	00f50533          	add	a0,a0,a5
    80002504:	00054503          	lbu	a0,0(a0)
    head = (head + 1) % BUFFER_SIZE;
    80002508:	00178793          	addi	a5,a5,1
    8000250c:	fff68693          	addi	a3,a3,-1 # fff <_entry-0x7ffff001>
    80002510:	00d7f7b3          	and	a5,a5,a3
    80002514:	00f73023          	sd	a5,0(a4)
    size--;
    80002518:	01073783          	ld	a5,16(a4)
    8000251c:	fff78793          	addi	a5,a5,-1
    80002520:	00f73823          	sd	a5,16(a4)
    return c;
}
    80002524:	00813403          	ld	s0,8(sp)
    80002528:	01010113          	addi	sp,sp,16
    8000252c:	00008067          	ret

0000000080002530 <_ZN7Console13consoleBuffer7isEmptyEv>:

bool Console::consoleBuffer::isEmpty(){
    80002530:	ff010113          	addi	sp,sp,-16
    80002534:	00813423          	sd	s0,8(sp)
    80002538:	01010413          	addi	s0,sp,16
    return size == 0;
    8000253c:	000017b7          	lui	a5,0x1
    80002540:	00f50533          	add	a0,a0,a5
    80002544:	01053503          	ld	a0,16(a0)
}
    80002548:	00153513          	seqz	a0,a0
    8000254c:	00813403          	ld	s0,8(sp)
    80002550:	01010113          	addi	sp,sp,16
    80002554:	00008067          	ret

0000000080002558 <_ZN7Console13consoleBuffer6isFullEv>:

bool Console::consoleBuffer::isFull(){
    80002558:	ff010113          	addi	sp,sp,-16
    8000255c:	00813423          	sd	s0,8(sp)
    80002560:	01010413          	addi	s0,sp,16
    return size == BUFFER_SIZE;
    80002564:	000017b7          	lui	a5,0x1
    80002568:	00f50533          	add	a0,a0,a5
    8000256c:	01053503          	ld	a0,16(a0)
    80002570:	40f50533          	sub	a0,a0,a5
}
    80002574:	00153513          	seqz	a0,a0
    80002578:	00813403          	ld	s0,8(sp)
    8000257c:	01010113          	addi	sp,sp,16
    80002580:	00008067          	ret

0000000080002584 <_ZN7Console4putcEc>:

void Console::putc(char c){
    80002584:	ff010113          	addi	sp,sp,-16
    80002588:	00113423          	sd	ra,8(sp)
    8000258c:	00813023          	sd	s0,0(sp)
    80002590:	01010413          	addi	s0,sp,16
    80002594:	00050593          	mv	a1,a0
    instance->outBuffer.put(c);
    80002598:	0000c517          	auipc	a0,0xc
    8000259c:	9e053503          	ld	a0,-1568(a0) # 8000df78 <_ZN7Console8instanceE>
    800025a0:	000017b7          	lui	a5,0x1
    800025a4:	02078793          	addi	a5,a5,32 # 1020 <_entry-0x7fffefe0>
    800025a8:	00f50533          	add	a0,a0,a5
    800025ac:	00000097          	auipc	ra,0x0
    800025b0:	ef4080e7          	jalr	-268(ra) # 800024a0 <_ZN7Console13consoleBuffer3putEc>
}
    800025b4:	00813083          	ld	ra,8(sp)
    800025b8:	00013403          	ld	s0,0(sp)
    800025bc:	01010113          	addi	sp,sp,16
    800025c0:	00008067          	ret

00000000800025c4 <_ZN7Console4getcEv>:

char Console::getc(){
    800025c4:	fe010113          	addi	sp,sp,-32
    800025c8:	00113c23          	sd	ra,24(sp)
    800025cc:	00813823          	sd	s0,16(sp)
    800025d0:	00913423          	sd	s1,8(sp)
    800025d4:	02010413          	addi	s0,sp,32
    sem_wait(instance->inSem);
    800025d8:	0000c497          	auipc	s1,0xc
    800025dc:	9a048493          	addi	s1,s1,-1632 # 8000df78 <_ZN7Console8instanceE>
    800025e0:	0004b783          	ld	a5,0(s1)
    800025e4:	0007b503          	ld	a0,0(a5)
    800025e8:	fffff097          	auipc	ra,0xfffff
    800025ec:	414080e7          	jalr	1044(ra) # 800019fc <_Z8sem_waitP4_sem>
    return instance->inBuffer.get();
    800025f0:	0004b503          	ld	a0,0(s1)
    800025f4:	00850513          	addi	a0,a0,8
    800025f8:	00000097          	auipc	ra,0x0
    800025fc:	ef0080e7          	jalr	-272(ra) # 800024e8 <_ZN7Console13consoleBuffer3getEv>
}
    80002600:	01813083          	ld	ra,24(sp)
    80002604:	01013403          	ld	s0,16(sp)
    80002608:	00813483          	ld	s1,8(sp)
    8000260c:	02010113          	addi	sp,sp,32
    80002610:	00008067          	ret

0000000080002614 <_ZN7Console13outputHandlerEv>:

void Console::outputHandler(){
    80002614:	fe010113          	addi	sp,sp,-32
    80002618:	00113c23          	sd	ra,24(sp)
    8000261c:	00813823          	sd	s0,16(sp)
    80002620:	00913423          	sd	s1,8(sp)
    80002624:	01213023          	sd	s2,0(sp)
    80002628:	02010413          	addi	s0,sp,32
    while(!instance->outBuffer.isEmpty()){
    8000262c:	0000c517          	auipc	a0,0xc
    80002630:	94c53503          	ld	a0,-1716(a0) # 8000df78 <_ZN7Console8instanceE>
    80002634:	000017b7          	lui	a5,0x1
    80002638:	02078793          	addi	a5,a5,32 # 1020 <_entry-0x7fffefe0>
    8000263c:	00f50533          	add	a0,a0,a5
    80002640:	00000097          	auipc	ra,0x0
    80002644:	ef0080e7          	jalr	-272(ra) # 80002530 <_ZN7Console13consoleBuffer7isEmptyEv>
    80002648:	06051063          	bnez	a0,800026a8 <_ZN7Console13outputHandlerEv+0x94>
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
    8000264c:	0000c797          	auipc	a5,0xc
    80002650:	89c7b783          	ld	a5,-1892(a5) # 8000dee8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002654:	0007b783          	ld	a5,0(a5)
    80002658:	0007c783          	lbu	a5,0(a5)
    8000265c:	0207f793          	andi	a5,a5,32
    80002660:	fc0786e3          	beqz	a5,8000262c <_ZN7Console13outputHandlerEv+0x18>
    80002664:	0000c497          	auipc	s1,0xc
    80002668:	9144b483          	ld	s1,-1772(s1) # 8000df78 <_ZN7Console8instanceE>
    8000266c:	000017b7          	lui	a5,0x1
    80002670:	02078793          	addi	a5,a5,32 # 1020 <_entry-0x7fffefe0>
    80002674:	00f484b3          	add	s1,s1,a5
    80002678:	00048513          	mv	a0,s1
    8000267c:	00000097          	auipc	ra,0x0
    80002680:	eb4080e7          	jalr	-332(ra) # 80002530 <_ZN7Console13consoleBuffer7isEmptyEv>
    80002684:	fa0514e3          	bnez	a0,8000262c <_ZN7Console13outputHandlerEv+0x18>
            (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
    80002688:	0000c797          	auipc	a5,0xc
    8000268c:	8787b783          	ld	a5,-1928(a5) # 8000df00 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002690:	0007b903          	ld	s2,0(a5)
    80002694:	00048513          	mv	a0,s1
    80002698:	00000097          	auipc	ra,0x0
    8000269c:	e50080e7          	jalr	-432(ra) # 800024e8 <_ZN7Console13consoleBuffer3getEv>
    800026a0:	00a90023          	sb	a0,0(s2)
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
    800026a4:	fa9ff06f          	j	8000264c <_ZN7Console13outputHandlerEv+0x38>
        }
    }
}
    800026a8:	01813083          	ld	ra,24(sp)
    800026ac:	01013403          	ld	s0,16(sp)
    800026b0:	00813483          	ld	s1,8(sp)
    800026b4:	00013903          	ld	s2,0(sp)
    800026b8:	02010113          	addi	sp,sp,32
    800026bc:	00008067          	ret

00000000800026c0 <_ZN7Console12inputHandlerEv>:

void Console::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    800026c0:	0000c797          	auipc	a5,0xc
    800026c4:	8287b783          	ld	a5,-2008(a5) # 8000dee8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800026c8:	0007b783          	ld	a5,0(a5)
    800026cc:	0007c783          	lbu	a5,0(a5)
    800026d0:	0017f793          	andi	a5,a5,1
    800026d4:	06078e63          	beqz	a5,80002750 <_ZN7Console12inputHandlerEv+0x90>
void Console::inputHandler(){
    800026d8:	fe010113          	addi	sp,sp,-32
    800026dc:	00113c23          	sd	ra,24(sp)
    800026e0:	00813823          	sd	s0,16(sp)
    800026e4:	00913423          	sd	s1,8(sp)
    800026e8:	02010413          	addi	s0,sp,32
        char ch =(*(char*)CONSOLE_RX_DATA);
    800026ec:	0000b797          	auipc	a5,0xb
    800026f0:	7f47b783          	ld	a5,2036(a5) # 8000dee0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800026f4:	0007b783          	ld	a5,0(a5)
        instance->inBuffer.put(ch);
    800026f8:	0000c497          	auipc	s1,0xc
    800026fc:	88048493          	addi	s1,s1,-1920 # 8000df78 <_ZN7Console8instanceE>
    80002700:	0004b503          	ld	a0,0(s1)
    80002704:	0007c583          	lbu	a1,0(a5)
    80002708:	00850513          	addi	a0,a0,8
    8000270c:	00000097          	auipc	ra,0x0
    80002710:	d94080e7          	jalr	-620(ra) # 800024a0 <_ZN7Console13consoleBuffer3putEc>
        sem_signal(instance->inSem);
    80002714:	0004b783          	ld	a5,0(s1)
    80002718:	0007b503          	ld	a0,0(a5)
    8000271c:	fffff097          	auipc	ra,0xfffff
    80002720:	30c080e7          	jalr	780(ra) # 80001a28 <_Z10sem_signalP4_sem>
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80002724:	0000b797          	auipc	a5,0xb
    80002728:	7c47b783          	ld	a5,1988(a5) # 8000dee8 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000272c:	0007b783          	ld	a5,0(a5)
    80002730:	0007c783          	lbu	a5,0(a5)
    80002734:	0017f793          	andi	a5,a5,1
    80002738:	fa079ae3          	bnez	a5,800026ec <_ZN7Console12inputHandlerEv+0x2c>
    }
    8000273c:	01813083          	ld	ra,24(sp)
    80002740:	01013403          	ld	s0,16(sp)
    80002744:	00813483          	ld	s1,8(sp)
    80002748:	02010113          	addi	sp,sp,32
    8000274c:	00008067          	ret
    80002750:	00008067          	ret

0000000080002754 <_ZN6KernelC1Ev>:
#include "../test_h/userMain.h"


extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80002754:	fd010113          	addi	sp,sp,-48
    80002758:	02113423          	sd	ra,40(sp)
    8000275c:	02813023          	sd	s0,32(sp)
    80002760:	00913c23          	sd	s1,24(sp)
    80002764:	01213823          	sd	s2,16(sp)
    80002768:	01313423          	sd	s3,8(sp)
    8000276c:	03010413          	addi	s0,sp,48
    80002770:	00050493          	mv	s1,a0
    80002774:	00001097          	auipc	ra,0x1
    80002778:	fd8080e7          	jalr	-40(ra) # 8000374c <_ZN11HeapManagerC1Ev>
    8000277c:	00848513          	addi	a0,s1,8
    80002780:	00002097          	auipc	ra,0x2
    80002784:	fc8080e7          	jalr	-56(ra) # 80004748 <_ZN9SchedulerC1Ev>
    80002788:	01848913          	addi	s2,s1,24
    8000278c:	00090513          	mv	a0,s2
    80002790:	fffff097          	auipc	ra,0xfffff
    80002794:	df4080e7          	jalr	-524(ra) # 80001584 <_ZN5TimerC1Ev>
    80002798:	02848513          	addi	a0,s1,40
    8000279c:	00000097          	auipc	ra,0x0
    800027a0:	bbc080e7          	jalr	-1092(ra) # 80002358 <_ZN7ConsoleC1Ev>
    800027a4:	0380006f          	j	800027dc <_ZN6KernelC1Ev+0x88>
    800027a8:	00050993          	mv	s3,a0
    800027ac:	00090513          	mv	a0,s2
    800027b0:	fffff097          	auipc	ra,0xfffff
    800027b4:	e44080e7          	jalr	-444(ra) # 800015f4 <_ZN5TimerD1Ev>
    800027b8:	00098913          	mv	s2,s3
    800027bc:	00048513          	mv	a0,s1
    800027c0:	00001097          	auipc	ra,0x1
    800027c4:	ff4080e7          	jalr	-12(ra) # 800037b4 <_ZN11HeapManagerD1Ev>
    800027c8:	00090513          	mv	a0,s2
    800027cc:	0000d097          	auipc	ra,0xd
    800027d0:	8fc080e7          	jalr	-1796(ra) # 8000f0c8 <_Unwind_Resume>
    800027d4:	00050913          	mv	s2,a0
    800027d8:	fe5ff06f          	j	800027bc <_ZN6KernelC1Ev+0x68>
    800027dc:	02813083          	ld	ra,40(sp)
    800027e0:	02013403          	ld	s0,32(sp)
    800027e4:	01813483          	ld	s1,24(sp)
    800027e8:	01013903          	ld	s2,16(sp)
    800027ec:	00813983          	ld	s3,8(sp)
    800027f0:	03010113          	addi	sp,sp,48
    800027f4:	00008067          	ret

00000000800027f8 <_ZN6Kernel10initialiseEv>:
 
void Kernel::initialise(){
    800027f8:	ff010113          	addi	sp,sp,-16
    800027fc:	00113423          	sd	ra,8(sp)
    80002800:	00813023          	sd	s0,0(sp)
    80002804:	01010413          	addi	s0,sp,16
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80002808:	0000b797          	auipc	a5,0xb
    8000280c:	7107b783          	ld	a5,1808(a5) # 8000df18 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002810:	10579073          	csrw	stvec,a5

    
    /// initialise the heap manager
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );
    80002814:	0000b797          	auipc	a5,0xb
    80002818:	70c7b783          	ld	a5,1804(a5) # 8000df20 <_GLOBAL_OFFSET_TABLE_+0x48>
    8000281c:	0007b603          	ld	a2,0(a5)
    80002820:	0000b797          	auipc	a5,0xb
    80002824:	6d07b783          	ld	a5,1744(a5) # 8000def0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002828:	0007b583          	ld	a1,0(a5)
    8000282c:	00001097          	auipc	ra,0x1
    80002830:	fa0080e7          	jalr	-96(ra) # 800037cc <_ZN11HeapManager4initEmm>
    console.getInstance().init();
    80002834:	00000097          	auipc	ra,0x0
    80002838:	c08080e7          	jalr	-1016(ra) # 8000243c <_ZN7Console11getInstanceEv>
    8000283c:	00000097          	auipc	ra,0x0
    80002840:	bd4080e7          	jalr	-1068(ra) # 80002410 <_ZN7Console4initEv>
    return;
}
    80002844:	00813083          	ld	ra,8(sp)
    80002848:	00013403          	ld	s0,0(sp)
    8000284c:	01010113          	addi	sp,sp,16
    80002850:	00008067          	ret

0000000080002854 <_Z4testPv>:

void test(void* arg){
    80002854:	ff010113          	addi	sp,sp,-16
    80002858:	00113423          	sd	ra,8(sp)
    8000285c:	00813023          	sd	s0,0(sp)
    80002860:	01010413          	addi	s0,sp,16
    userMain();
    80002864:	00005097          	auipc	ra,0x5
    80002868:	d58080e7          	jalr	-680(ra) # 800075bc <_Z8userMainv>
}
    8000286c:	00813083          	ld	ra,8(sp)
    80002870:	00013403          	ld	s0,0(sp)
    80002874:	01010113          	addi	sp,sp,16
    80002878:	00008067          	ret

000000008000287c <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    8000287c:	fe010113          	addi	sp,sp,-32
    80002880:	00113c23          	sd	ra,24(sp)
    80002884:	00813823          	sd	s0,16(sp)
    80002888:	02010413          	addi	s0,sp,32

    thread_t kernelThread;
    
    thread_create(&kernelThread, 0, 0);
    8000288c:	00000613          	li	a2,0
    80002890:	00000593          	li	a1,0
    80002894:	fe840513          	addi	a0,s0,-24
    80002898:	fffff097          	auipc	ra,0xfffff
    8000289c:	ff4080e7          	jalr	-12(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    800028a0:	00002097          	auipc	ra,0x2
    800028a4:	130080e7          	jalr	304(ra) # 800049d0 <_ZN9Scheduler3getEv>
    800028a8:	0000b797          	auipc	a5,0xb
    800028ac:	6807b783          	ld	a5,1664(a5) # 8000df28 <_GLOBAL_OFFSET_TABLE_+0x50>
    800028b0:	00a7b023          	sd	a0,0(a5)
    
    /// change to user mode
    __asm__ volatile ("li a0, 0xff");
    800028b4:	0ff00513          	li	a0,255
    __asm__ volatile ("ecall");
    800028b8:	00000073          	ecall
    //     Console::outputHandler();
    // }

    thread_t userThread;
    // thread_create(&userThread, test, 0);
    thread_create(&userThread, usermain, 0);
    800028bc:	00000613          	li	a2,0
    800028c0:	0000b597          	auipc	a1,0xb
    800028c4:	6385b583          	ld	a1,1592(a1) # 8000def8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800028c8:	fe040513          	addi	a0,s0,-32
    800028cc:	fffff097          	auipc	ra,0xfffff
    800028d0:	fc0080e7          	jalr	-64(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    do{
        // putc('K');
        Console::outputHandler();
    800028d4:	00000097          	auipc	ra,0x0
    800028d8:	d40080e7          	jalr	-704(ra) # 80002614 <_ZN7Console13outputHandlerEv>
        // putc('K');
        thread_dispatch();
    800028dc:	fffff097          	auipc	ra,0xfffff
    800028e0:	04c080e7          	jalr	76(ra) # 80001928 <_Z15thread_dispatchv>
        // putc('K');
    }while(!(Scheduler::isEmpty() && Timer::getInstance().noSleepingThreads()));
    800028e4:	00002097          	auipc	ra,0x2
    800028e8:	ed4080e7          	jalr	-300(ra) # 800047b8 <_ZN9Scheduler7isEmptyEv>
    800028ec:	fe0504e3          	beqz	a0,800028d4 <_ZN6Kernel3runEv+0x58>
    800028f0:	fffff097          	auipc	ra,0xfffff
    800028f4:	d4c080e7          	jalr	-692(ra) # 8000163c <_ZN5Timer11getInstanceEv>
    800028f8:	fffff097          	auipc	ra,0xfffff
    800028fc:	efc080e7          	jalr	-260(ra) # 800017f4 <_ZN5Timer17noSleepingThreadsEv>
    80002900:	fc050ae3          	beqz	a0,800028d4 <_ZN6Kernel3runEv+0x58>

    return EXIT_SUCCESS;
}
    80002904:	00000513          	li	a0,0
    80002908:	01813083          	ld	ra,24(sp)
    8000290c:	01013403          	ld	s0,16(sp)
    80002910:	02010113          	addi	sp,sp,32
    80002914:	00008067          	ret

0000000080002918 <_Z13thread_test_1Pv>:
#include "console.h"

sem_t sem1;
sem_t sem2;

void thread_test_1(void* args){
    80002918:	ff010113          	addi	sp,sp,-16
    8000291c:	00113423          	sd	ra,8(sp)
    80002920:	00813023          	sd	s0,0(sp)
    80002924:	01010413          	addi	s0,sp,16
    putc('1');
    80002928:	03100513          	li	a0,49
    8000292c:	fffff097          	auipc	ra,0xfffff
    80002930:	150080e7          	jalr	336(ra) # 80001a7c <_Z4putcc>
    putc('s');
    80002934:	07300513          	li	a0,115
    80002938:	fffff097          	auipc	ra,0xfffff
    8000293c:	144080e7          	jalr	324(ra) # 80001a7c <_Z4putcc>
    time_sleep(30);
    80002940:	01e00513          	li	a0,30
    80002944:	fffff097          	auipc	ra,0xfffff
    80002948:	028080e7          	jalr	40(ra) # 8000196c <_Z10time_sleepm>
    putc('1');
    8000294c:	03100513          	li	a0,49
    80002950:	fffff097          	auipc	ra,0xfffff
    80002954:	12c080e7          	jalr	300(ra) # 80001a7c <_Z4putcc>
    sem_signal(sem1);
    80002958:	0000b517          	auipc	a0,0xb
    8000295c:	62853503          	ld	a0,1576(a0) # 8000df80 <sem1>
    80002960:	fffff097          	auipc	ra,0xfffff
    80002964:	0c8080e7          	jalr	200(ra) # 80001a28 <_Z10sem_signalP4_sem>
    putc('S');
    80002968:	05300513          	li	a0,83
    8000296c:	fffff097          	auipc	ra,0xfffff
    80002970:	110080e7          	jalr	272(ra) # 80001a7c <_Z4putcc>
}
    80002974:	00813083          	ld	ra,8(sp)
    80002978:	00013403          	ld	s0,0(sp)
    8000297c:	01010113          	addi	sp,sp,16
    80002980:	00008067          	ret

0000000080002984 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80002984:	ff010113          	addi	sp,sp,-16
    80002988:	00113423          	sd	ra,8(sp)
    8000298c:	00813023          	sd	s0,0(sp)
    80002990:	01010413          	addi	s0,sp,16
    putc('2');
    80002994:	03200513          	li	a0,50
    80002998:	fffff097          	auipc	ra,0xfffff
    8000299c:	0e4080e7          	jalr	228(ra) # 80001a7c <_Z4putcc>
    putc('s');
    800029a0:	07300513          	li	a0,115
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	0d8080e7          	jalr	216(ra) # 80001a7c <_Z4putcc>
    time_sleep(60);
    800029ac:	03c00513          	li	a0,60
    800029b0:	fffff097          	auipc	ra,0xfffff
    800029b4:	fbc080e7          	jalr	-68(ra) # 8000196c <_Z10time_sleepm>
    putc('2');
    800029b8:	03200513          	li	a0,50
    800029bc:	fffff097          	auipc	ra,0xfffff
    800029c0:	0c0080e7          	jalr	192(ra) # 80001a7c <_Z4putcc>
    putc('S');
    800029c4:	05300513          	li	a0,83
    800029c8:	fffff097          	auipc	ra,0xfffff
    800029cc:	0b4080e7          	jalr	180(ra) # 80001a7c <_Z4putcc>
    sem_signal(sem2);
    800029d0:	0000b517          	auipc	a0,0xb
    800029d4:	5b853503          	ld	a0,1464(a0) # 8000df88 <sem2>
    800029d8:	fffff097          	auipc	ra,0xfffff
    800029dc:	050080e7          	jalr	80(ra) # 80001a28 <_Z10sem_signalP4_sem>
    for(int i = 0; i < 1 << 20; i++){
    800029e0:	00000793          	li	a5,0
    800029e4:	00100737          	lui	a4,0x100
    800029e8:	00e7d863          	bge	a5,a4,800029f8 <_Z13thread_test_2Pv+0x74>
        __asm__ volatile("nop");
    800029ec:	00000013          	nop
    for(int i = 0; i < 1 << 20; i++){
    800029f0:	0017879b          	addiw	a5,a5,1
    800029f4:	ff1ff06f          	j	800029e4 <_Z13thread_test_2Pv+0x60>
    }
}
    800029f8:	00813083          	ld	ra,8(sp)
    800029fc:	00013403          	ld	s0,0(sp)
    80002a00:	01010113          	addi	sp,sp,16
    80002a04:	00008067          	ret

0000000080002a08 <_Z7memTestv>:

void memTest(){
    80002a08:	fd010113          	addi	sp,sp,-48
    80002a0c:	02113423          	sd	ra,40(sp)
    80002a10:	02813023          	sd	s0,32(sp)
    80002a14:	00913c23          	sd	s1,24(sp)
    80002a18:	01213823          	sd	s2,16(sp)
    80002a1c:	01313423          	sd	s3,8(sp)
    80002a20:	01413023          	sd	s4,0(sp)
    80002a24:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002a28:	0000b797          	auipc	a5,0xb
    80002a2c:	4e07b783          	ld	a5,1248(a5) # 8000df08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002a30:	0007b503          	ld	a0,0(a5)
    80002a34:	00001097          	auipc	ra,0x1
    80002a38:	ebc080e7          	jalr	-324(ra) # 800038f0 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002a3c:	00050993          	mv	s3,a0
    putc('F');
    80002a40:	04600513          	li	a0,70
    80002a44:	fffff097          	auipc	ra,0xfffff
    80002a48:	038080e7          	jalr	56(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002a4c:	07200513          	li	a0,114
    80002a50:	fffff097          	auipc	ra,0xfffff
    80002a54:	02c080e7          	jalr	44(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002a58:	06500513          	li	a0,101
    80002a5c:	fffff097          	auipc	ra,0xfffff
    80002a60:	020080e7          	jalr	32(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002a64:	06500513          	li	a0,101
    80002a68:	fffff097          	auipc	ra,0xfffff
    80002a6c:	014080e7          	jalr	20(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    80002a70:	02000513          	li	a0,32
    80002a74:	fffff097          	auipc	ra,0xfffff
    80002a78:	008080e7          	jalr	8(ra) # 80001a7c <_Z4putcc>
    putc('m');
    80002a7c:	06d00513          	li	a0,109
    80002a80:	fffff097          	auipc	ra,0xfffff
    80002a84:	ffc080e7          	jalr	-4(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002a88:	06500513          	li	a0,101
    80002a8c:	fffff097          	auipc	ra,0xfffff
    80002a90:	ff0080e7          	jalr	-16(ra) # 80001a7c <_Z4putcc>
    putc('m');
    80002a94:	06d00513          	li	a0,109
    80002a98:	fffff097          	auipc	ra,0xfffff
    80002a9c:	fe4080e7          	jalr	-28(ra) # 80001a7c <_Z4putcc>
    putc('o');
    80002aa0:	06f00513          	li	a0,111
    80002aa4:	fffff097          	auipc	ra,0xfffff
    80002aa8:	fd8080e7          	jalr	-40(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002aac:	07200513          	li	a0,114
    80002ab0:	fffff097          	auipc	ra,0xfffff
    80002ab4:	fcc080e7          	jalr	-52(ra) # 80001a7c <_Z4putcc>
    putc('y');
    80002ab8:	07900513          	li	a0,121
    80002abc:	fffff097          	auipc	ra,0xfffff
    80002ac0:	fc0080e7          	jalr	-64(ra) # 80001a7c <_Z4putcc>
    putc(':');
    80002ac4:	03a00513          	li	a0,58
    80002ac8:	fffff097          	auipc	ra,0xfffff
    80002acc:	fb4080e7          	jalr	-76(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002ad0:	00f00493          	li	s1,15
    80002ad4:	0140006f          	j	80002ae8 <_Z7memTestv+0xe0>
        int digit = (freeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002ad8:	05750513          	addi	a0,a0,87
    80002adc:	fffff097          	auipc	ra,0xfffff
    80002ae0:	fa0080e7          	jalr	-96(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002ae4:	fff4849b          	addiw	s1,s1,-1
    80002ae8:	0204c463          	bltz	s1,80002b10 <_Z7memTestv+0x108>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    80002aec:	0024951b          	slliw	a0,s1,0x2
    80002af0:	00a9d533          	srl	a0,s3,a0
    80002af4:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002af8:	00900793          	li	a5,9
    80002afc:	fca7cee3          	blt	a5,a0,80002ad8 <_Z7memTestv+0xd0>
            putc('0' + digit);
    80002b00:	03050513          	addi	a0,a0,48
    80002b04:	fffff097          	auipc	ra,0xfffff
    80002b08:	f78080e7          	jalr	-136(ra) # 80001a7c <_Z4putcc>
    80002b0c:	fd9ff06f          	j	80002ae4 <_Z7memTestv+0xdc>
        }
    }
    putc('\n');
    80002b10:	00a00513          	li	a0,10
    80002b14:	fffff097          	auipc	ra,0xfffff
    80002b18:	f68080e7          	jalr	-152(ra) # 80001a7c <_Z4putcc>
    int n = 100;
    int k = 100;
    int** matrix = (int**)mem_alloc(sizeof(int*) * n);
    80002b1c:	32000513          	li	a0,800
    80002b20:	fffff097          	auipc	ra,0xfffff
    80002b24:	d10080e7          	jalr	-752(ra) # 80001830 <_Z9mem_allocm>
    80002b28:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    80002b2c:	00000493          	li	s1,0
    80002b30:	0080006f          	j	80002b38 <_Z7memTestv+0x130>
    80002b34:	0014849b          	addiw	s1,s1,1
    80002b38:	06300793          	li	a5,99
    80002b3c:	0497c663          	blt	a5,s1,80002b88 <_Z7memTestv+0x180>
        matrix[i] = (int*)mem_alloc(sizeof(int) * k);
    80002b40:	00349a13          	slli	s4,s1,0x3
    80002b44:	01490a33          	add	s4,s2,s4
    80002b48:	19000513          	li	a0,400
    80002b4c:	fffff097          	auipc	ra,0xfffff
    80002b50:	ce4080e7          	jalr	-796(ra) # 80001830 <_Z9mem_allocm>
    80002b54:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    80002b58:	00000713          	li	a4,0
    80002b5c:	06300793          	li	a5,99
    80002b60:	fce7cae3          	blt	a5,a4,80002b34 <_Z7memTestv+0x12c>
            matrix[i][j] = i * k + j;
    80002b64:	06400793          	li	a5,100
    80002b68:	029787bb          	mulw	a5,a5,s1
    80002b6c:	000a3683          	ld	a3,0(s4)
    80002b70:	00271613          	slli	a2,a4,0x2
    80002b74:	00c686b3          	add	a3,a3,a2
    80002b78:	00e787bb          	addw	a5,a5,a4
    80002b7c:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80002b80:	0017071b          	addiw	a4,a4,1
    80002b84:	fd9ff06f          	j	80002b5c <_Z7memTestv+0x154>
        }
    }
    for(int i = 0; i < n; i++){
    80002b88:	00000a13          	li	s4,0
    80002b8c:	0780006f          	j	80002c04 <_Z7memTestv+0x1fc>
        for(int j = 0; j < k; j++){
    80002b90:	0014849b          	addiw	s1,s1,1
    80002b94:	06300793          	li	a5,99
    80002b98:	0497ca63          	blt	a5,s1,80002bec <_Z7memTestv+0x1e4>
            assert(matrix[i][j] == i * k + j);
    80002b9c:	003a1793          	slli	a5,s4,0x3
    80002ba0:	00f907b3          	add	a5,s2,a5
    80002ba4:	0007b783          	ld	a5,0(a5)
    80002ba8:	00249713          	slli	a4,s1,0x2
    80002bac:	00e787b3          	add	a5,a5,a4
    80002bb0:	0007a703          	lw	a4,0(a5)
    80002bb4:	06400793          	li	a5,100
    80002bb8:	034787bb          	mulw	a5,a5,s4
    80002bbc:	009787bb          	addw	a5,a5,s1
    80002bc0:	fcf708e3          	beq	a4,a5,80002b90 <_Z7memTestv+0x188>
    80002bc4:	00008697          	auipc	a3,0x8
    80002bc8:	55c68693          	addi	a3,a3,1372 # 8000b120 <CONSOLE_STATUS+0x110>
    80002bcc:	04400613          	li	a2,68
    80002bd0:	00008597          	auipc	a1,0x8
    80002bd4:	56058593          	addi	a1,a1,1376 # 8000b130 <CONSOLE_STATUS+0x120>
    80002bd8:	00008517          	auipc	a0,0x8
    80002bdc:	57050513          	addi	a0,a0,1392 # 8000b148 <CONSOLE_STATUS+0x138>
    80002be0:	fffff097          	auipc	ra,0xfffff
    80002be4:	44c080e7          	jalr	1100(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80002be8:	fa9ff06f          	j	80002b90 <_Z7memTestv+0x188>
        }
        mem_free(matrix[i]);
    80002bec:	003a1793          	slli	a5,s4,0x3
    80002bf0:	00f907b3          	add	a5,s2,a5
    80002bf4:	0007b503          	ld	a0,0(a5)
    80002bf8:	fffff097          	auipc	ra,0xfffff
    80002bfc:	c68080e7          	jalr	-920(ra) # 80001860 <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    80002c00:	001a0a1b          	addiw	s4,s4,1
    80002c04:	06300793          	li	a5,99
    80002c08:	0147c663          	blt	a5,s4,80002c14 <_Z7memTestv+0x20c>
        for(int j = 0; j < k; j++){
    80002c0c:	00000493          	li	s1,0
    80002c10:	f85ff06f          	j	80002b94 <_Z7memTestv+0x18c>
    }
    mem_free(matrix);
    80002c14:	00090513          	mv	a0,s2
    80002c18:	fffff097          	auipc	ra,0xfffff
    80002c1c:	c48080e7          	jalr	-952(ra) # 80001860 <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002c20:	0000b797          	auipc	a5,0xb
    80002c24:	2e87b783          	ld	a5,744(a5) # 8000df08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002c28:	0007b503          	ld	a0,0(a5)
    80002c2c:	00001097          	auipc	ra,0x1
    80002c30:	cc4080e7          	jalr	-828(ra) # 800038f0 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002c34:	00050493          	mv	s1,a0
    putc('F');
    80002c38:	04600513          	li	a0,70
    80002c3c:	fffff097          	auipc	ra,0xfffff
    80002c40:	e40080e7          	jalr	-448(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002c44:	07200513          	li	a0,114
    80002c48:	fffff097          	auipc	ra,0xfffff
    80002c4c:	e34080e7          	jalr	-460(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002c50:	06500513          	li	a0,101
    80002c54:	fffff097          	auipc	ra,0xfffff
    80002c58:	e28080e7          	jalr	-472(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002c5c:	06500513          	li	a0,101
    80002c60:	fffff097          	auipc	ra,0xfffff
    80002c64:	e1c080e7          	jalr	-484(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    80002c68:	02000513          	li	a0,32
    80002c6c:	fffff097          	auipc	ra,0xfffff
    80002c70:	e10080e7          	jalr	-496(ra) # 80001a7c <_Z4putcc>
    putc('m');
    80002c74:	06d00513          	li	a0,109
    80002c78:	fffff097          	auipc	ra,0xfffff
    80002c7c:	e04080e7          	jalr	-508(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002c80:	06500513          	li	a0,101
    80002c84:	fffff097          	auipc	ra,0xfffff
    80002c88:	df8080e7          	jalr	-520(ra) # 80001a7c <_Z4putcc>
    putc('m');
    80002c8c:	06d00513          	li	a0,109
    80002c90:	fffff097          	auipc	ra,0xfffff
    80002c94:	dec080e7          	jalr	-532(ra) # 80001a7c <_Z4putcc>
    putc('o');
    80002c98:	06f00513          	li	a0,111
    80002c9c:	fffff097          	auipc	ra,0xfffff
    80002ca0:	de0080e7          	jalr	-544(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002ca4:	07200513          	li	a0,114
    80002ca8:	fffff097          	auipc	ra,0xfffff
    80002cac:	dd4080e7          	jalr	-556(ra) # 80001a7c <_Z4putcc>
    putc('y');
    80002cb0:	07900513          	li	a0,121
    80002cb4:	fffff097          	auipc	ra,0xfffff
    80002cb8:	dc8080e7          	jalr	-568(ra) # 80001a7c <_Z4putcc>
    putc(':');
    80002cbc:	03a00513          	li	a0,58
    80002cc0:	fffff097          	auipc	ra,0xfffff
    80002cc4:	dbc080e7          	jalr	-580(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002cc8:	00f00913          	li	s2,15
    80002ccc:	0140006f          	j	80002ce0 <_Z7memTestv+0x2d8>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002cd0:	05750513          	addi	a0,a0,87
    80002cd4:	fffff097          	auipc	ra,0xfffff
    80002cd8:	da8080e7          	jalr	-600(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002cdc:	fff9091b          	addiw	s2,s2,-1
    80002ce0:	02094463          	bltz	s2,80002d08 <_Z7memTestv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    80002ce4:	0029151b          	slliw	a0,s2,0x2
    80002ce8:	00a4d533          	srl	a0,s1,a0
    80002cec:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002cf0:	00900793          	li	a5,9
    80002cf4:	fca7cee3          	blt	a5,a0,80002cd0 <_Z7memTestv+0x2c8>
            putc('0' + digit);
    80002cf8:	03050513          	addi	a0,a0,48
    80002cfc:	fffff097          	auipc	ra,0xfffff
    80002d00:	d80080e7          	jalr	-640(ra) # 80001a7c <_Z4putcc>
    80002d04:	fd9ff06f          	j	80002cdc <_Z7memTestv+0x2d4>
        }
    }
    putc('\n');
    80002d08:	00a00513          	li	a0,10
    80002d0c:	fffff097          	auipc	ra,0xfffff
    80002d10:	d70080e7          	jalr	-656(ra) # 80001a7c <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    80002d14:	409989b3          	sub	s3,s3,s1
    putc('D');
    80002d18:	04400513          	li	a0,68
    80002d1c:	fffff097          	auipc	ra,0xfffff
    80002d20:	d60080e7          	jalr	-672(ra) # 80001a7c <_Z4putcc>
    putc('i');
    80002d24:	06900513          	li	a0,105
    80002d28:	fffff097          	auipc	ra,0xfffff
    80002d2c:	d54080e7          	jalr	-684(ra) # 80001a7c <_Z4putcc>
    putc('f');
    80002d30:	06600513          	li	a0,102
    80002d34:	fffff097          	auipc	ra,0xfffff
    80002d38:	d48080e7          	jalr	-696(ra) # 80001a7c <_Z4putcc>
    putc('f');
    80002d3c:	06600513          	li	a0,102
    80002d40:	fffff097          	auipc	ra,0xfffff
    80002d44:	d3c080e7          	jalr	-708(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002d48:	06500513          	li	a0,101
    80002d4c:	fffff097          	auipc	ra,0xfffff
    80002d50:	d30080e7          	jalr	-720(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002d54:	07200513          	li	a0,114
    80002d58:	fffff097          	auipc	ra,0xfffff
    80002d5c:	d24080e7          	jalr	-732(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002d60:	06500513          	li	a0,101
    80002d64:	fffff097          	auipc	ra,0xfffff
    80002d68:	d18080e7          	jalr	-744(ra) # 80001a7c <_Z4putcc>
    putc('n');
    80002d6c:	06e00513          	li	a0,110
    80002d70:	fffff097          	auipc	ra,0xfffff
    80002d74:	d0c080e7          	jalr	-756(ra) # 80001a7c <_Z4putcc>
    putc('c');
    80002d78:	06300513          	li	a0,99
    80002d7c:	fffff097          	auipc	ra,0xfffff
    80002d80:	d00080e7          	jalr	-768(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002d84:	06500513          	li	a0,101
    80002d88:	fffff097          	auipc	ra,0xfffff
    80002d8c:	cf4080e7          	jalr	-780(ra) # 80001a7c <_Z4putcc>
    putc(':');
    80002d90:	03a00513          	li	a0,58
    80002d94:	fffff097          	auipc	ra,0xfffff
    80002d98:	ce8080e7          	jalr	-792(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002d9c:	00f00493          	li	s1,15
    80002da0:	0140006f          	j	80002db4 <_Z7memTestv+0x3ac>
        int digit = (difference >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002da4:	05750513          	addi	a0,a0,87
    80002da8:	fffff097          	auipc	ra,0xfffff
    80002dac:	cd4080e7          	jalr	-812(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002db0:	fff4849b          	addiw	s1,s1,-1
    80002db4:	0204c463          	bltz	s1,80002ddc <_Z7memTestv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    80002db8:	0024951b          	slliw	a0,s1,0x2
    80002dbc:	00a9d533          	srl	a0,s3,a0
    80002dc0:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002dc4:	00900793          	li	a5,9
    80002dc8:	fca7cee3          	blt	a5,a0,80002da4 <_Z7memTestv+0x39c>
            putc('0' + digit);
    80002dcc:	03050513          	addi	a0,a0,48
    80002dd0:	fffff097          	auipc	ra,0xfffff
    80002dd4:	cac080e7          	jalr	-852(ra) # 80001a7c <_Z4putcc>
    80002dd8:	fd9ff06f          	j	80002db0 <_Z7memTestv+0x3a8>
        }
    }
    putc('\n');
    80002ddc:	00a00513          	li	a0,10
    80002de0:	fffff097          	auipc	ra,0xfffff
    80002de4:	c9c080e7          	jalr	-868(ra) # 80001a7c <_Z4putcc>
    putc('\n');
    80002de8:	00a00513          	li	a0,10
    80002dec:	fffff097          	auipc	ra,0xfffff
    80002df0:	c90080e7          	jalr	-880(ra) # 80001a7c <_Z4putcc>
    putc('\n');
    80002df4:	00a00513          	li	a0,10
    80002df8:	fffff097          	auipc	ra,0xfffff
    80002dfc:	c84080e7          	jalr	-892(ra) # 80001a7c <_Z4putcc>
}
    80002e00:	02813083          	ld	ra,40(sp)
    80002e04:	02013403          	ld	s0,32(sp)
    80002e08:	01813483          	ld	s1,24(sp)
    80002e0c:	01013903          	ld	s2,16(sp)
    80002e10:	00813983          	ld	s3,8(sp)
    80002e14:	00013a03          	ld	s4,0(sp)
    80002e18:	03010113          	addi	sp,sp,48
    80002e1c:	00008067          	ret

0000000080002e20 <_Z8usermainPv>:

void usermain(void* arg){
    80002e20:	fd010113          	addi	sp,sp,-48
    80002e24:	02113423          	sd	ra,40(sp)
    80002e28:	02813023          	sd	s0,32(sp)
    80002e2c:	00913c23          	sd	s1,24(sp)
    80002e30:	03010413          	addi	s0,sp,48
    memTest();    
    80002e34:	00000097          	auipc	ra,0x0
    80002e38:	bd4080e7          	jalr	-1068(ra) # 80002a08 <_Z7memTestv>
    putc('0');
    80002e3c:	03000513          	li	a0,48
    80002e40:	fffff097          	auipc	ra,0xfffff
    80002e44:	c3c080e7          	jalr	-964(ra) # 80001a7c <_Z4putcc>
    thread_t t1, t2;
    sem_open(&sem1, 0);
    80002e48:	0000b497          	auipc	s1,0xb
    80002e4c:	13848493          	addi	s1,s1,312 # 8000df80 <sem1>
    80002e50:	00000593          	li	a1,0
    80002e54:	00048513          	mv	a0,s1
    80002e58:	fffff097          	auipc	ra,0xfffff
    80002e5c:	b40080e7          	jalr	-1216(ra) # 80001998 <_Z8sem_openPP4_semj>
    sem_open(&sem2, 0);
    80002e60:	00000593          	li	a1,0
    80002e64:	0000b517          	auipc	a0,0xb
    80002e68:	12450513          	addi	a0,a0,292 # 8000df88 <sem2>
    80002e6c:	fffff097          	auipc	ra,0xfffff
    80002e70:	b2c080e7          	jalr	-1236(ra) # 80001998 <_Z8sem_openPP4_semj>
    thread_create(&t1, thread_test_1, 0);
    80002e74:	00000613          	li	a2,0
    80002e78:	00000597          	auipc	a1,0x0
    80002e7c:	aa058593          	addi	a1,a1,-1376 # 80002918 <_Z13thread_test_1Pv>
    80002e80:	fd840513          	addi	a0,s0,-40
    80002e84:	fffff097          	auipc	ra,0xfffff
    80002e88:	a08080e7          	jalr	-1528(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002e8c:	00000613          	li	a2,0
    80002e90:	00000597          	auipc	a1,0x0
    80002e94:	af458593          	addi	a1,a1,-1292 # 80002984 <_Z13thread_test_2Pv>
    80002e98:	fd040513          	addi	a0,s0,-48
    80002e9c:	fffff097          	auipc	ra,0xfffff
    80002ea0:	9f0080e7          	jalr	-1552(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    sem_wait(sem1);
    80002ea4:	0004b503          	ld	a0,0(s1)
    80002ea8:	fffff097          	auipc	ra,0xfffff
    80002eac:	b54080e7          	jalr	-1196(ra) # 800019fc <_Z8sem_waitP4_sem>
    putc('3');
    80002eb0:	03300513          	li	a0,51
    80002eb4:	fffff097          	auipc	ra,0xfffff
    80002eb8:	bc8080e7          	jalr	-1080(ra) # 80001a7c <_Z4putcc>
    // thread_join(t2);
    // if(getc() == 'a')putc('x');
    putc('4');
    80002ebc:	03400513          	li	a0,52
    80002ec0:	fffff097          	auipc	ra,0xfffff
    80002ec4:	bbc080e7          	jalr	-1092(ra) # 80001a7c <_Z4putcc>
    thread_join(t1);
    80002ec8:	fd843503          	ld	a0,-40(s0)
    80002ecc:	fffff097          	auipc	ra,0xfffff
    80002ed0:	a7c080e7          	jalr	-1412(ra) # 80001948 <_Z11thread_joinP7_thread>
    // thread_dispatch();
    // thread_dispatch();
    sem_wait(sem2);
    80002ed4:	0084b503          	ld	a0,8(s1)
    80002ed8:	fffff097          	auipc	ra,0xfffff
    80002edc:	b24080e7          	jalr	-1244(ra) # 800019fc <_Z8sem_waitP4_sem>
    putc('5');
    80002ee0:	03500513          	li	a0,53
    80002ee4:	fffff097          	auipc	ra,0xfffff
    80002ee8:	b98080e7          	jalr	-1128(ra) # 80001a7c <_Z4putcc>
    sem_close(sem1);
    80002eec:	0004b503          	ld	a0,0(s1)
    80002ef0:	fffff097          	auipc	ra,0xfffff
    80002ef4:	ae0080e7          	jalr	-1312(ra) # 800019d0 <_Z9sem_closeP4_sem>
    sem_close(sem2);
    80002ef8:	0084b503          	ld	a0,8(s1)
    80002efc:	fffff097          	auipc	ra,0xfffff
    80002f00:	ad4080e7          	jalr	-1324(ra) # 800019d0 <_Z9sem_closeP4_sem>


    putc('\n');
    80002f04:	00a00513          	li	a0,10
    80002f08:	fffff097          	auipc	ra,0xfffff
    80002f0c:	b74080e7          	jalr	-1164(ra) # 80001a7c <_Z4putcc>
    80002f10:	02813083          	ld	ra,40(sp)
    80002f14:	02013403          	ld	s0,32(sp)
    80002f18:	01813483          	ld	s1,24(sp)
    80002f1c:	03010113          	addi	sp,sp,48
    80002f20:	00008067          	ret

0000000080002f24 <_ZN7_threadC1EPFvPvES0_>:
#include "syscall_c.h"
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    80002f24:	ff010113          	addi	sp,sp,-16
    80002f28:	00813423          	sd	s0,8(sp)
    80002f2c:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80002f30:	00053023          	sd	zero,0(a0)
    80002f34:	00053423          	sd	zero,8(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80002f38:	0000b717          	auipc	a4,0xb
    80002f3c:	05870713          	addi	a4,a4,88 # 8000df90 <_ZN7_thread6nextIDE>
    80002f40:	00072783          	lw	a5,0(a4)
    80002f44:	0017869b          	addiw	a3,a5,1
    80002f48:	00d72023          	sw	a3,0(a4)
    80002f4c:	08f52c23          	sw	a5,152(a0)
    closed = 0;
    80002f50:	09c52783          	lw	a5,156(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002f54:	0015b593          	seqz	a1,a1
    80002f58:	0045959b          	slliw	a1,a1,0x4
    80002f5c:	fe07f793          	andi	a5,a5,-32
    80002f60:	00b7e7b3          	or	a5,a5,a1
    80002f64:	08f52e23          	sw	a5,156(a0)
    reserved = 0;
    80002f68:	0a052783          	lw	a5,160(a0)
    80002f6c:	f0000737          	lui	a4,0xf0000
    80002f70:	00e7f7b3          	and	a5,a5,a4
    80002f74:	0af52023          	sw	a5,160(a0)
    joinHead = 0;
    80002f78:	06053c23          	sd	zero,120(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    80002f7c:	00200793          	li	a5,2
    80002f80:	08f53423          	sd	a5,136(a0)
    stackStart = 0;
    80002f84:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    80002f88:	00053823          	sd	zero,16(a0)
    context.s1 = 0;
    80002f8c:	00053c23          	sd	zero,24(a0)
    context.s2 = 0;
    80002f90:	02053023          	sd	zero,32(a0)
    context.s3 = 0;
    80002f94:	02053423          	sd	zero,40(a0)
    context.s4 = 0;
    80002f98:	02053823          	sd	zero,48(a0)
    context.s5 = 0;
    80002f9c:	02053c23          	sd	zero,56(a0)
    context.s6 = 0;
    80002fa0:	04053023          	sd	zero,64(a0)
    context.s7 = 0;
    80002fa4:	04053423          	sd	zero,72(a0)
    context.s8 = 0;
    80002fa8:	04053823          	sd	zero,80(a0)
    context.s9 = 0;
    80002fac:	04053c23          	sd	zero,88(a0)
    context.s10 = 0;
    80002fb0:	06053023          	sd	zero,96(a0)
    context.s11 = 0;
    80002fb4:	06053423          	sd	zero,104(a0)

    context.sstatus = 0;
    80002fb8:	06053823          	sd	zero,112(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002fbc:	00000797          	auipc	a5,0x0
    80002fc0:	55878793          	addi	a5,a5,1368 # 80003514 <_ZN7_thread7wrapperEv>
    80002fc4:	00f53023          	sd	a5,0(a0)
}
    80002fc8:	00813403          	ld	s0,8(sp)
    80002fcc:	01010113          	addi	sp,sp,16
    80002fd0:	00008067          	ret

0000000080002fd4 <_Z10popSppSpieb>:

void popSppSpie(bool kernel = false){
    80002fd4:	ff010113          	addi	sp,sp,-16
    80002fd8:	00813423          	sd	s0,8(sp)
    80002fdc:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002fe0:	14109073          	csrw	sepc,ra
    // if(kernel){
    //     __asm__ volatile ("csrs sstatus, %0" :: "r" (1 << 8));
    // }else{
    // __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    // }
    __asm__ volatile ("sret");
    80002fe4:	10200073          	sret
}
    80002fe8:	00813403          	ld	s0,8(sp)
    80002fec:	01010113          	addi	sp,sp,16
    80002ff0:	00008067          	ret

0000000080002ff4 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002ff4:	fe010113          	addi	sp,sp,-32
    80002ff8:	00113c23          	sd	ra,24(sp)
    80002ffc:	00813823          	sd	s0,16(sp)
    80003000:	00913423          	sd	s1,8(sp)
    80003004:	01213023          	sd	s2,0(sp)
    80003008:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    8000300c:	07853483          	ld	s1,120(a0)
    while(current != 0){
    80003010:	0c048e63          	beqz	s1,800030ec <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    80003014:	0004c503          	lbu	a0,0(s1)
    80003018:	0014c783          	lbu	a5,1(s1)
    8000301c:	00879793          	slli	a5,a5,0x8
    80003020:	00a7e7b3          	or	a5,a5,a0
    80003024:	0024c503          	lbu	a0,2(s1)
    80003028:	01051513          	slli	a0,a0,0x10
    8000302c:	00f567b3          	or	a5,a0,a5
    80003030:	0034c503          	lbu	a0,3(s1)
    80003034:	01851513          	slli	a0,a0,0x18
    80003038:	00f56533          	or	a0,a0,a5
    8000303c:	0044c783          	lbu	a5,4(s1)
    80003040:	02079793          	slli	a5,a5,0x20
    80003044:	00a7e533          	or	a0,a5,a0
    80003048:	0054c783          	lbu	a5,5(s1)
    8000304c:	02879793          	slli	a5,a5,0x28
    80003050:	00a7e7b3          	or	a5,a5,a0
    80003054:	0064c503          	lbu	a0,6(s1)
    80003058:	03051513          	slli	a0,a0,0x30
    8000305c:	00f567b3          	or	a5,a0,a5
    80003060:	0074c503          	lbu	a0,7(s1)
    80003064:	03851513          	slli	a0,a0,0x38
    80003068:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    8000306c:	09c52783          	lw	a5,156(a0)
    80003070:	ffd7f793          	andi	a5,a5,-3
    80003074:	08f52e23          	sw	a5,156(a0)
        Scheduler::put(thread);
    80003078:	00001097          	auipc	ra,0x1
    8000307c:	768080e7          	jalr	1896(ra) # 800047e0 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80003080:	0084c903          	lbu	s2,8(s1)
    80003084:	0094c783          	lbu	a5,9(s1)
    80003088:	00879793          	slli	a5,a5,0x8
    8000308c:	0127e7b3          	or	a5,a5,s2
    80003090:	00a4c903          	lbu	s2,10(s1)
    80003094:	01091913          	slli	s2,s2,0x10
    80003098:	00f967b3          	or	a5,s2,a5
    8000309c:	00b4c903          	lbu	s2,11(s1)
    800030a0:	01891913          	slli	s2,s2,0x18
    800030a4:	00f96933          	or	s2,s2,a5
    800030a8:	00c4c783          	lbu	a5,12(s1)
    800030ac:	02079793          	slli	a5,a5,0x20
    800030b0:	0127e933          	or	s2,a5,s2
    800030b4:	00d4c783          	lbu	a5,13(s1)
    800030b8:	02879793          	slli	a5,a5,0x28
    800030bc:	0127e7b3          	or	a5,a5,s2
    800030c0:	00e4c903          	lbu	s2,14(s1)
    800030c4:	03091913          	slli	s2,s2,0x30
    800030c8:	00f967b3          	or	a5,s2,a5
    800030cc:	00f4c903          	lbu	s2,15(s1)
    800030d0:	03891913          	slli	s2,s2,0x38
    800030d4:	00f96933          	or	s2,s2,a5
        mem_free(current);
    800030d8:	00048513          	mv	a0,s1
    800030dc:	ffffe097          	auipc	ra,0xffffe
    800030e0:	784080e7          	jalr	1924(ra) # 80001860 <_Z8mem_freePv>
        current = next;
    800030e4:	00090493          	mv	s1,s2
    while(current != 0){
    800030e8:	f29ff06f          	j	80003010 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    800030ec:	01813083          	ld	ra,24(sp)
    800030f0:	01013403          	ld	s0,16(sp)
    800030f4:	00813483          	ld	s1,8(sp)
    800030f8:	00013903          	ld	s2,0(sp)
    800030fc:	02010113          	addi	sp,sp,32
    80003100:	00008067          	ret

0000000080003104 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80003104:	fc010113          	addi	sp,sp,-64
    80003108:	02113c23          	sd	ra,56(sp)
    8000310c:	02813823          	sd	s0,48(sp)
    80003110:	02913423          	sd	s1,40(sp)
    80003114:	03213023          	sd	s2,32(sp)
    80003118:	01313c23          	sd	s3,24(sp)
    8000311c:	01413823          	sd	s4,16(sp)
    80003120:	01513423          	sd	s5,8(sp)
    80003124:	04010413          	addi	s0,sp,64
    80003128:	00050493          	mv	s1,a0
    8000312c:	00058913          	mv	s2,a1
    80003130:	00060a93          	mv	s5,a2
    80003134:	00068993          	mv	s3,a3
    80003138:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    8000313c:	0b800513          	li	a0,184
    80003140:	ffffe097          	auipc	ra,0xffffe
    80003144:	6f0080e7          	jalr	1776(ra) # 80001830 <_Z9mem_allocm>
    80003148:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    8000314c:	18050063          	beqz	a0,800032cc <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    80003150:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    80003154:	0004b783          	ld	a5,0(s1)
    80003158:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    8000315c:	0000b717          	auipc	a4,0xb
    80003160:	e3470713          	addi	a4,a4,-460 # 8000df90 <_ZN7_thread6nextIDE>
    80003164:	00072783          	lw	a5,0(a4)
    80003168:	0017869b          	addiw	a3,a5,1
    8000316c:	00d72023          	sw	a3,0(a4)
    80003170:	0004b703          	ld	a4,0(s1)
    80003174:	08f72c23          	sw	a5,152(a4)
    (*thread)->closed = false;
    80003178:	0004b703          	ld	a4,0(s1)
    8000317c:	09c72783          	lw	a5,156(a4)
    80003180:	ffe7f793          	andi	a5,a5,-2
    80003184:	08f72e23          	sw	a5,156(a4)
    (*thread)->blocked = false;
    80003188:	0004b703          	ld	a4,0(s1)
    8000318c:	09c72783          	lw	a5,156(a4)
    80003190:	ffd7f793          	andi	a5,a5,-3
    80003194:	08f72e23          	sw	a5,156(a4)
    (*thread)->sleeping = false;
    80003198:	0004b703          	ld	a4,0(s1)
    8000319c:	09c72783          	lw	a5,156(a4)
    800031a0:	ffb7f793          	andi	a5,a5,-5
    800031a4:	08f72e23          	sw	a5,156(a4)
    (*thread)->finished = false;
    800031a8:	0004b703          	ld	a4,0(s1)
    800031ac:	09c72783          	lw	a5,156(a4)
    800031b0:	ff77f793          	andi	a5,a5,-9
    800031b4:	08f72e23          	sw	a5,156(a4)
    (*thread)->kernel = (function == 0);
    800031b8:	0004b703          	ld	a4,0(s1)
    800031bc:	00193913          	seqz	s2,s2
    800031c0:	0049191b          	slliw	s2,s2,0x4
    800031c4:	09c72783          	lw	a5,156(a4)
    800031c8:	fef7f793          	andi	a5,a5,-17
    800031cc:	0127e933          	or	s2,a5,s2
    800031d0:	09272e23          	sw	s2,156(a4)
    (*thread)->reserved = 0;
    800031d4:	0004b703          	ld	a4,0(s1)
    800031d8:	0a072783          	lw	a5,160(a4)
    800031dc:	f00006b7          	lui	a3,0xf0000
    800031e0:	00d7f7b3          	and	a5,a5,a3
    800031e4:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = 0;
    800031e8:	0004b783          	ld	a5,0(s1)
    800031ec:	0607bc23          	sd	zero,120(a5)
    (*thread)->joinTail = 0;
    800031f0:	0004b783          	ld	a5,0(s1)
    800031f4:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    800031f8:	0004b783          	ld	a5,0(s1)
    800031fc:	00200713          	li	a4,2
    80003200:	08e7b423          	sd	a4,136(a5)
    (*thread)->stackStart = 0;
    80003204:	0004b783          	ld	a5,0(s1)
    80003208:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    8000320c:	0004b783          	ld	a5,0(s1)
    80003210:	0007b823          	sd	zero,16(a5)
    (*thread)->context.s1 = 0;
    80003214:	0004b783          	ld	a5,0(s1)
    80003218:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s2 = 0;
    8000321c:	0004b783          	ld	a5,0(s1)
    80003220:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s3 = 0;
    80003224:	0004b783          	ld	a5,0(s1)
    80003228:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s4 = 0;
    8000322c:	0004b783          	ld	a5,0(s1)
    80003230:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s5 = 0;
    80003234:	0004b783          	ld	a5,0(s1)
    80003238:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s6 = 0;
    8000323c:	0004b783          	ld	a5,0(s1)
    80003240:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s7 = 0;
    80003244:	0004b783          	ld	a5,0(s1)
    80003248:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s8 = 0;
    8000324c:	0004b783          	ld	a5,0(s1)
    80003250:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s9 = 0;
    80003254:	0004b783          	ld	a5,0(s1)
    80003258:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s10 = 0;
    8000325c:	0004b783          	ld	a5,0(s1)
    80003260:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s11 = 0;
    80003264:	0004b783          	ld	a5,0(s1)
    80003268:	0607b423          	sd	zero,104(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    8000326c:	0004b783          	ld	a5,0(s1)
    80003270:	0137b423          	sd	s3,8(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80003274:	0004b783          	ld	a5,0(s1)
    80003278:	00000717          	auipc	a4,0x0
    8000327c:	29c70713          	addi	a4,a4,668 # 80003514 <_ZN7_thread7wrapperEv>
    80003280:	00e7b023          	sd	a4,0(a5)

    (*thread)->stackStart = stack;
    80003284:	0004b783          	ld	a5,0(s1)
    80003288:	0937b823          	sd	s3,144(a5)
    if(start){
    8000328c:	020a1663          	bnez	s4,800032b8 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    80003290:	00000513          	li	a0,0
}
    80003294:	03813083          	ld	ra,56(sp)
    80003298:	03013403          	ld	s0,48(sp)
    8000329c:	02813483          	ld	s1,40(sp)
    800032a0:	02013903          	ld	s2,32(sp)
    800032a4:	01813983          	ld	s3,24(sp)
    800032a8:	01013a03          	ld	s4,16(sp)
    800032ac:	00813a83          	ld	s5,8(sp)
    800032b0:	04010113          	addi	sp,sp,64
    800032b4:	00008067          	ret
        Scheduler::put(*thread);
    800032b8:	0004b503          	ld	a0,0(s1)
    800032bc:	00001097          	auipc	ra,0x1
    800032c0:	524080e7          	jalr	1316(ra) # 800047e0 <_ZN9Scheduler3putEP7_thread>
    return 0;
    800032c4:	00000513          	li	a0,0
    800032c8:	fcdff06f          	j	80003294 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    800032cc:	fff00513          	li	a0,-1
    800032d0:	fc5ff06f          	j	80003294 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

00000000800032d4 <_ZN7_thread4joinEPS_>:

void _thread::join(thread_t thread){
    /// cannot join to a finished or closed thread
    if(thread->finished || thread->closed){
    800032d4:	0985b783          	ld	a5,152(a1)
    800032d8:	00900713          	li	a4,9
    800032dc:	02071713          	slli	a4,a4,0x20
    800032e0:	00e7f7b3          	and	a5,a5,a4
    800032e4:	00078463          	beqz	a5,800032ec <_ZN7_thread4joinEPS_+0x18>
    800032e8:	00008067          	ret
void _thread::join(thread_t thread){
    800032ec:	fe010113          	addi	sp,sp,-32
    800032f0:	00113c23          	sd	ra,24(sp)
    800032f4:	00813823          	sd	s0,16(sp)
    800032f8:	00913423          	sd	s1,8(sp)
    800032fc:	01213023          	sd	s2,0(sp)
    80003300:	02010413          	addi	s0,sp,32
    80003304:	00050493          	mv	s1,a0
    80003308:	00058913          	mv	s2,a1
        return;
    }
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    8000330c:	01000513          	li	a0,16
    80003310:	ffffe097          	auipc	ra,0xffffe
    80003314:	520080e7          	jalr	1312(ra) # 80001830 <_Z9mem_allocm>
    this->blocked = true;
    80003318:	09c4a703          	lw	a4,156(s1)
    8000331c:	00276713          	ori	a4,a4,2
    80003320:	08e4ae23          	sw	a4,156(s1)
    newJoin->thread = this;
    80003324:	00950023          	sb	s1,0(a0)
    80003328:	0084d713          	srli	a4,s1,0x8
    8000332c:	00e500a3          	sb	a4,1(a0)
    80003330:	0104d713          	srli	a4,s1,0x10
    80003334:	00e50123          	sb	a4,2(a0)
    80003338:	0184d71b          	srliw	a4,s1,0x18
    8000333c:	00e501a3          	sb	a4,3(a0)
    80003340:	0204d713          	srli	a4,s1,0x20
    80003344:	00e50223          	sb	a4,4(a0)
    80003348:	0284d713          	srli	a4,s1,0x28
    8000334c:	00e502a3          	sb	a4,5(a0)
    80003350:	0304d713          	srli	a4,s1,0x30
    80003354:	00e50323          	sb	a4,6(a0)
    80003358:	0384d493          	srli	s1,s1,0x38
    8000335c:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80003360:	00050423          	sb	zero,8(a0)
    80003364:	000504a3          	sb	zero,9(a0)
    80003368:	00050523          	sb	zero,10(a0)
    8000336c:	000505a3          	sb	zero,11(a0)
    80003370:	00050623          	sb	zero,12(a0)
    80003374:	000506a3          	sb	zero,13(a0)
    80003378:	00050723          	sb	zero,14(a0)
    8000337c:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    80003380:	07893703          	ld	a4,120(s2)
    80003384:	06070463          	beqz	a4,800033ec <_ZN7_thread4joinEPS_+0x118>
        thread->joinHead = newJoin;
        thread->joinTail = newJoin;
    }else{
        thread->joinTail->next = newJoin;
    80003388:	08093703          	ld	a4,128(s2)
    8000338c:	00a70423          	sb	a0,8(a4)
    80003390:	00855693          	srli	a3,a0,0x8
    80003394:	00d704a3          	sb	a3,9(a4)
    80003398:	01055693          	srli	a3,a0,0x10
    8000339c:	00d70523          	sb	a3,10(a4)
    800033a0:	0185569b          	srliw	a3,a0,0x18
    800033a4:	00d705a3          	sb	a3,11(a4)
    800033a8:	02055693          	srli	a3,a0,0x20
    800033ac:	00d70623          	sb	a3,12(a4)
    800033b0:	02855693          	srli	a3,a0,0x28
    800033b4:	00d706a3          	sb	a3,13(a4)
    800033b8:	03055693          	srli	a3,a0,0x30
    800033bc:	00d70723          	sb	a3,14(a4)
    800033c0:	03855693          	srli	a3,a0,0x38
    800033c4:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    800033c8:	08a93023          	sd	a0,128(s2)
    }
    thread_dispatch();
    800033cc:	ffffe097          	auipc	ra,0xffffe
    800033d0:	55c080e7          	jalr	1372(ra) # 80001928 <_Z15thread_dispatchv>
}
    800033d4:	01813083          	ld	ra,24(sp)
    800033d8:	01013403          	ld	s0,16(sp)
    800033dc:	00813483          	ld	s1,8(sp)
    800033e0:	00013903          	ld	s2,0(sp)
    800033e4:	02010113          	addi	sp,sp,32
    800033e8:	00008067          	ret
        thread->joinHead = newJoin;
    800033ec:	06a93c23          	sd	a0,120(s2)
        thread->joinTail = newJoin;
    800033f0:	08a93023          	sd	a0,128(s2)
    800033f4:	fd9ff06f          	j	800033cc <_ZN7_thread4joinEPS_+0xf8>

00000000800033f8 <_ZN7_thread4tickEv>:

int _thread::tick(){
    800033f8:	fe010113          	addi	sp,sp,-32
    800033fc:	00113c23          	sd	ra,24(sp)
    80003400:	00813823          	sd	s0,16(sp)
    80003404:	00913423          	sd	s1,8(sp)
    80003408:	02010413          	addi	s0,sp,32
    8000340c:	00050493          	mv	s1,a0
    putc('T');
    80003410:	05400513          	li	a0,84
    80003414:	ffffe097          	auipc	ra,0xffffe
    80003418:	668080e7          	jalr	1640(ra) # 80001a7c <_Z4putcc>
    if(currentThread->blocked){
    8000341c:	0000b797          	auipc	a5,0xb
    80003420:	b7c7b783          	ld	a5,-1156(a5) # 8000df98 <_ZN7_thread13currentThreadE>
    80003424:	09c7a783          	lw	a5,156(a5)
    80003428:	0027f713          	andi	a4,a5,2
    8000342c:	04071a63          	bnez	a4,80003480 <_ZN7_thread4tickEv+0x88>
        return -1;
    }
    if(currentThread->closed){
    80003430:	0017f713          	andi	a4,a5,1
    80003434:	04071a63          	bnez	a4,80003488 <_ZN7_thread4tickEv+0x90>
        return -2;
    }
    if(currentThread->sleeping){
    80003438:	0047f713          	andi	a4,a5,4
    8000343c:	04071a63          	bnez	a4,80003490 <_ZN7_thread4tickEv+0x98>
        return -3;
    }
    if(currentThread->finished){
    80003440:	0087f793          	andi	a5,a5,8
    80003444:	04079a63          	bnez	a5,80003498 <_ZN7_thread4tickEv+0xa0>
        return -4;
    }
    timeLeft --;
    80003448:	0884b783          	ld	a5,136(s1)
    8000344c:	fff78793          	addi	a5,a5,-1
    80003450:	08f4b423          	sd	a5,136(s1)
    if(timeLeft == 0){
    80003454:	00078e63          	beqz	a5,80003470 <_ZN7_thread4tickEv+0x78>
        thread_dispatch();
    }
    return 0;
    80003458:	00000513          	li	a0,0
}
    8000345c:	01813083          	ld	ra,24(sp)
    80003460:	01013403          	ld	s0,16(sp)
    80003464:	00813483          	ld	s1,8(sp)
    80003468:	02010113          	addi	sp,sp,32
    8000346c:	00008067          	ret
        thread_dispatch();
    80003470:	ffffe097          	auipc	ra,0xffffe
    80003474:	4b8080e7          	jalr	1208(ra) # 80001928 <_Z15thread_dispatchv>
    return 0;
    80003478:	00000513          	li	a0,0
    8000347c:	fe1ff06f          	j	8000345c <_ZN7_thread4tickEv+0x64>
        return -1;
    80003480:	fff00513          	li	a0,-1
    80003484:	fd9ff06f          	j	8000345c <_ZN7_thread4tickEv+0x64>
        return -2;
    80003488:	ffe00513          	li	a0,-2
    8000348c:	fd1ff06f          	j	8000345c <_ZN7_thread4tickEv+0x64>
        return -3;
    80003490:	ffd00513          	li	a0,-3
    80003494:	fc9ff06f          	j	8000345c <_ZN7_thread4tickEv+0x64>
        return -4;
    80003498:	ffc00513          	li	a0,-4
    8000349c:	fc1ff06f          	j	8000345c <_ZN7_thread4tickEv+0x64>

00000000800034a0 <_ZN7_thread4exitEv>:

int _thread::exit(){
    if(currentThread->closed){
    800034a0:	0000b717          	auipc	a4,0xb
    800034a4:	af873703          	ld	a4,-1288(a4) # 8000df98 <_ZN7_thread13currentThreadE>
    800034a8:	09c72783          	lw	a5,156(a4)
    800034ac:	0017f693          	andi	a3,a5,1
    800034b0:	04069663          	bnez	a3,800034fc <_ZN7_thread4exitEv+0x5c>
        return -1;
    }
    if(currentThread->blocked){
    800034b4:	0027f693          	andi	a3,a5,2
    800034b8:	04069663          	bnez	a3,80003504 <_ZN7_thread4exitEv+0x64>
        return -2;
    }
    if(currentThread->sleeping){
    800034bc:	0047f793          	andi	a5,a5,4
    800034c0:	04079663          	bnez	a5,8000350c <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    800034c4:	ff010113          	addi	sp,sp,-16
    800034c8:	00113423          	sd	ra,8(sp)
    800034cc:	00813023          	sd	s0,0(sp)
    800034d0:	01010413          	addi	s0,sp,16
        return -3;
    }
    currentThread->finished = 1;
    800034d4:	09c72783          	lw	a5,156(a4)
    800034d8:	0087e793          	ori	a5,a5,8
    800034dc:	08f72e23          	sw	a5,156(a4)
    thread_dispatch();
    800034e0:	ffffe097          	auipc	ra,0xffffe
    800034e4:	448080e7          	jalr	1096(ra) # 80001928 <_Z15thread_dispatchv>
    return 0;
    800034e8:	00000513          	li	a0,0
}
    800034ec:	00813083          	ld	ra,8(sp)
    800034f0:	00013403          	ld	s0,0(sp)
    800034f4:	01010113          	addi	sp,sp,16
    800034f8:	00008067          	ret
        return -1;
    800034fc:	fff00513          	li	a0,-1
    80003500:	00008067          	ret
        return -2;
    80003504:	ffe00513          	li	a0,-2
    80003508:	00008067          	ret
        return -3;
    8000350c:	ffd00513          	li	a0,-3
}
    80003510:	00008067          	ret

0000000080003514 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80003514:	fe010113          	addi	sp,sp,-32
    80003518:	00113c23          	sd	ra,24(sp)
    8000351c:	00813823          	sd	s0,16(sp)
    80003520:	00913423          	sd	s1,8(sp)
    80003524:	02010413          	addi	s0,sp,32
    popSppSpie(currentThread->kernel);
    80003528:	0000b497          	auipc	s1,0xb
    8000352c:	a6848493          	addi	s1,s1,-1432 # 8000df90 <_ZN7_thread6nextIDE>
    80003530:	0084b783          	ld	a5,8(s1)
    80003534:	09c7a503          	lw	a0,156(a5)
    80003538:	4045551b          	sraiw	a0,a0,0x4
    8000353c:	00157513          	andi	a0,a0,1
    80003540:	00000097          	auipc	ra,0x0
    80003544:	a94080e7          	jalr	-1388(ra) # 80002fd4 <_Z10popSppSpieb>
    currentThread->function(currentThread->arg);
    80003548:	0084b783          	ld	a5,8(s1)
    8000354c:	0a87b703          	ld	a4,168(a5)
    80003550:	0b07b503          	ld	a0,176(a5)
    80003554:	000700e7          	jalr	a4
    currentThread->unJoin();
    80003558:	0084b503          	ld	a0,8(s1)
    8000355c:	00000097          	auipc	ra,0x0
    80003560:	a98080e7          	jalr	-1384(ra) # 80002ff4 <_ZN7_thread6unJoinEv>
    exit();
    80003564:	00000097          	auipc	ra,0x0
    80003568:	f3c080e7          	jalr	-196(ra) # 800034a0 <_ZN7_thread4exitEv>
}
    8000356c:	01813083          	ld	ra,24(sp)
    80003570:	01013403          	ld	s0,16(sp)
    80003574:	00813483          	ld	s1,8(sp)
    80003578:	02010113          	addi	sp,sp,32
    8000357c:	00008067          	ret

0000000080003580 <_ZN7_thread10setBlockedEb>:

void _thread::setBlocked(bool blocked){
    80003580:	ff010113          	addi	sp,sp,-16
    80003584:	00813423          	sd	s0,8(sp)
    80003588:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    8000358c:	0015f593          	andi	a1,a1,1
    80003590:	0015979b          	slliw	a5,a1,0x1
    80003594:	09c52583          	lw	a1,156(a0)
    80003598:	ffd5f593          	andi	a1,a1,-3
    8000359c:	00f5e5b3          	or	a1,a1,a5
    800035a0:	08b52e23          	sw	a1,156(a0)
}
    800035a4:	00813403          	ld	s0,8(sp)
    800035a8:	01010113          	addi	sp,sp,16
    800035ac:	00008067          	ret

00000000800035b0 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    800035b0:	ff010113          	addi	sp,sp,-16
    800035b4:	00813423          	sd	s0,8(sp)
    800035b8:	01010413          	addi	s0,sp,16
    this->closed = closed;
    800035bc:	0015f793          	andi	a5,a1,1
    800035c0:	09c52583          	lw	a1,156(a0)
    800035c4:	ffe5f593          	andi	a1,a1,-2
    800035c8:	00f5e5b3          	or	a1,a1,a5
    800035cc:	08b52e23          	sw	a1,156(a0)
}
    800035d0:	00813403          	ld	s0,8(sp)
    800035d4:	01010113          	addi	sp,sp,16
    800035d8:	00008067          	ret

00000000800035dc <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    800035dc:	ff010113          	addi	sp,sp,-16
    800035e0:	00813423          	sd	s0,8(sp)
    800035e4:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    800035e8:	0015f593          	andi	a1,a1,1
    800035ec:	0025979b          	slliw	a5,a1,0x2
    800035f0:	09c52583          	lw	a1,156(a0)
    800035f4:	ffb5f593          	andi	a1,a1,-5
    800035f8:	00f5e5b3          	or	a1,a1,a5
    800035fc:	08b52e23          	sw	a1,156(a0)
}
    80003600:	00813403          	ld	s0,8(sp)
    80003604:	01010113          	addi	sp,sp,16
    80003608:	00008067          	ret

000000008000360c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
        Scheduler::put(oldThread);
    }
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    8000360c:	ff010113          	addi	sp,sp,-16
    80003610:	00813423          	sd	s0,8(sp)
    80003614:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    80003618:	04050263          	beqz	a0,8000365c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    8000361c:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    80003620:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    80003624:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    80003628:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    8000362c:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    80003630:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    80003634:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    80003638:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    8000363c:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    80003640:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    80003644:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    80003648:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    8000364c:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    80003650:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80003654:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    80003658:	06853823          	sd	s0,112(a0)
    }
    
    
    if(newContext->sp != 0){
    8000365c:	0085b783          	ld	a5,8(a1)
    80003660:	00078463          	beqz	a5,80003668 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    80003664:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    80003668:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    8000366c:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    80003670:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80003674:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    80003678:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    8000367c:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80003680:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80003684:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80003688:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    8000368c:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80003690:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    80003694:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    80003698:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    8000369c:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    800036a0:	0685bd83          	ld	s11,104(a1)

    return;

}
    800036a4:	00813403          	ld	s0,8(sp)
    800036a8:	01010113          	addi	sp,sp,16
    800036ac:	00008067          	ret

00000000800036b0 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    800036b0:	fe010113          	addi	sp,sp,-32
    800036b4:	00113c23          	sd	ra,24(sp)
    800036b8:	00813823          	sd	s0,16(sp)
    800036bc:	00913423          	sd	s1,8(sp)
    800036c0:	01213023          	sd	s2,0(sp)
    800036c4:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    800036c8:	0000b917          	auipc	s2,0xb
    800036cc:	8c890913          	addi	s2,s2,-1848 # 8000df90 <_ZN7_thread6nextIDE>
    800036d0:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    800036d4:	00001097          	auipc	ra,0x1
    800036d8:	2fc080e7          	jalr	764(ra) # 800049d0 <_ZN9Scheduler3getEv>
    800036dc:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    800036e0:	00200793          	li	a5,2
    800036e4:	08f4b423          	sd	a5,136(s1)
    if(currentThread == 0){
    800036e8:	04050463          	beqz	a0,80003730 <_ZN7_thread8dispatchEv+0x80>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    800036ec:	00048c63          	beqz	s1,80003704 <_ZN7_thread8dispatchEv+0x54>
    800036f0:	0984b783          	ld	a5,152(s1)
    800036f4:	00f00713          	li	a4,15
    800036f8:	02071713          	slli	a4,a4,0x20
    800036fc:	00e7f7b3          	and	a5,a5,a4
    80003700:	02078e63          	beqz	a5,8000373c <_ZN7_thread8dispatchEv+0x8c>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    80003704:	0000b597          	auipc	a1,0xb
    80003708:	8945b583          	ld	a1,-1900(a1) # 8000df98 <_ZN7_thread13currentThreadE>
    8000370c:	00048513          	mv	a0,s1
    80003710:	00000097          	auipc	ra,0x0
    80003714:	efc080e7          	jalr	-260(ra) # 8000360c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    80003718:	01813083          	ld	ra,24(sp)
    8000371c:	01013403          	ld	s0,16(sp)
    80003720:	00813483          	ld	s1,8(sp)
    80003724:	00013903          	ld	s2,0(sp)
    80003728:	02010113          	addi	sp,sp,32
    8000372c:	00008067          	ret
        currentThread = oldThread;
    80003730:	0000b797          	auipc	a5,0xb
    80003734:	8697b423          	sd	s1,-1944(a5) # 8000df98 <_ZN7_thread13currentThreadE>
        return;
    80003738:	fe1ff06f          	j	80003718 <_ZN7_thread8dispatchEv+0x68>
        Scheduler::put(oldThread);
    8000373c:	00048513          	mv	a0,s1
    80003740:	00001097          	auipc	ra,0x1
    80003744:	0a0080e7          	jalr	160(ra) # 800047e0 <_ZN9Scheduler3putEP7_thread>
    80003748:	fbdff06f          	j	80003704 <_ZN7_thread8dispatchEv+0x54>

000000008000374c <_ZN11HeapManagerC1Ev>:
#include "heapManager.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    8000374c:	fe010113          	addi	sp,sp,-32
    80003750:	00113c23          	sd	ra,24(sp)
    80003754:	00813823          	sd	s0,16(sp)
    80003758:	00913423          	sd	s1,8(sp)
    8000375c:	02010413          	addi	s0,sp,32
    80003760:	00050493          	mv	s1,a0
    assert(instance == 0);
    80003764:	0000b797          	auipc	a5,0xb
    80003768:	83c7b783          	ld	a5,-1988(a5) # 8000dfa0 <_ZN11HeapManager8instanceE>
    8000376c:	02079063          	bnez	a5,8000378c <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80003770:	0000b797          	auipc	a5,0xb
    80003774:	8297b823          	sd	s1,-2000(a5) # 8000dfa0 <_ZN11HeapManager8instanceE>
}
    80003778:	01813083          	ld	ra,24(sp)
    8000377c:	01013403          	ld	s0,16(sp)
    80003780:	00813483          	ld	s1,8(sp)
    80003784:	02010113          	addi	sp,sp,32
    80003788:	00008067          	ret
    assert(instance == 0);
    8000378c:	00008697          	auipc	a3,0x8
    80003790:	9dc68693          	addi	a3,a3,-1572 # 8000b168 <CONSOLE_STATUS+0x158>
    80003794:	01200613          	li	a2,18
    80003798:	00008597          	auipc	a1,0x8
    8000379c:	9f058593          	addi	a1,a1,-1552 # 8000b188 <CONSOLE_STATUS+0x178>
    800037a0:	00008517          	auipc	a0,0x8
    800037a4:	8a050513          	addi	a0,a0,-1888 # 8000b040 <CONSOLE_STATUS+0x30>
    800037a8:	fffff097          	auipc	ra,0xfffff
    800037ac:	884080e7          	jalr	-1916(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800037b0:	fc1ff06f          	j	80003770 <_ZN11HeapManagerC1Ev+0x24>

00000000800037b4 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    800037b4:	ff010113          	addi	sp,sp,-16
    800037b8:	00813423          	sd	s0,8(sp)
    800037bc:	01010413          	addi	s0,sp,16
    
}
    800037c0:	00813403          	ld	s0,8(sp)
    800037c4:	01010113          	addi	sp,sp,16
    800037c8:	00008067          	ret

00000000800037cc <_ZN11HeapManager4initEmm>:

void HeapManager::init(uint64 nStart, size_t nEnd){
    800037cc:	fd010113          	addi	sp,sp,-48
    800037d0:	02113423          	sd	ra,40(sp)
    800037d4:	02813023          	sd	s0,32(sp)
    800037d8:	00913c23          	sd	s1,24(sp)
    800037dc:	01213823          	sd	s2,16(sp)
    800037e0:	01313423          	sd	s3,8(sp)
    800037e4:	03010413          	addi	s0,sp,48
    800037e8:	00050993          	mv	s3,a0
    800037ec:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    800037f0:	40b604b3          	sub	s1,a2,a1
    800037f4:	0414b793          	sltiu	a5,s1,65
    800037f8:	0c079863          	bnez	a5,800038c8 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    800037fc:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80003800:	fde00793          	li	a5,-34
    80003804:	00f90c23          	sb	a5,24(s2)
    80003808:	fc000713          	li	a4,-64
    8000380c:	00e90ca3          	sb	a4,25(s2)
    80003810:	fad00713          	li	a4,-83
    80003814:	00e90d23          	sb	a4,26(s2)
    80003818:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    8000381c:	0064d613          	srli	a2,s1,0x6
    80003820:	0009b783          	ld	a5,0(s3)
    80003824:	fff60613          	addi	a2,a2,-1
    80003828:	00c78823          	sb	a2,16(a5)
    8000382c:	00865713          	srli	a4,a2,0x8
    80003830:	00e788a3          	sb	a4,17(a5)
    80003834:	01065713          	srli	a4,a2,0x10
    80003838:	00e78923          	sb	a4,18(a5)
    8000383c:	0186571b          	srliw	a4,a2,0x18
    80003840:	00e789a3          	sb	a4,19(a5)
    80003844:	02065713          	srli	a4,a2,0x20
    80003848:	00e78a23          	sb	a4,20(a5)
    8000384c:	02865713          	srli	a4,a2,0x28
    80003850:	00e78aa3          	sb	a4,21(a5)
    80003854:	03065713          	srli	a4,a2,0x30
    80003858:	00e78b23          	sb	a4,22(a5)
    8000385c:	03865613          	srli	a2,a2,0x38
    80003860:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80003864:	0009b783          	ld	a5,0(s3)
    80003868:	00078023          	sb	zero,0(a5)
    8000386c:	000780a3          	sb	zero,1(a5)
    80003870:	00078123          	sb	zero,2(a5)
    80003874:	000781a3          	sb	zero,3(a5)
    80003878:	00078223          	sb	zero,4(a5)
    8000387c:	000782a3          	sb	zero,5(a5)
    80003880:	00078323          	sb	zero,6(a5)
    80003884:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80003888:	0009b783          	ld	a5,0(s3)
    8000388c:	00078423          	sb	zero,8(a5)
    80003890:	000784a3          	sb	zero,9(a5)
    80003894:	00078523          	sb	zero,10(a5)
    80003898:	000785a3          	sb	zero,11(a5)
    8000389c:	00078623          	sb	zero,12(a5)
    800038a0:	000786a3          	sb	zero,13(a5)
    800038a4:	00078723          	sb	zero,14(a5)
    800038a8:	000787a3          	sb	zero,15(a5)
}
    800038ac:	02813083          	ld	ra,40(sp)
    800038b0:	02013403          	ld	s0,32(sp)
    800038b4:	01813483          	ld	s1,24(sp)
    800038b8:	01013903          	ld	s2,16(sp)
    800038bc:	00813983          	ld	s3,8(sp)
    800038c0:	03010113          	addi	sp,sp,48
    800038c4:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    800038c8:	00008697          	auipc	a3,0x8
    800038cc:	8d868693          	addi	a3,a3,-1832 # 8000b1a0 <CONSOLE_STATUS+0x190>
    800038d0:	01b00613          	li	a2,27
    800038d4:	00008597          	auipc	a1,0x8
    800038d8:	8b458593          	addi	a1,a1,-1868 # 8000b188 <CONSOLE_STATUS+0x178>
    800038dc:	00008517          	auipc	a0,0x8
    800038e0:	8ec50513          	addi	a0,a0,-1812 # 8000b1c8 <CONSOLE_STATUS+0x1b8>
    800038e4:	ffffe097          	auipc	ra,0xffffe
    800038e8:	748080e7          	jalr	1864(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800038ec:	f11ff06f          	j	800037fc <_ZN11HeapManager4initEmm+0x30>

00000000800038f0 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    800038f0:	fe010113          	addi	sp,sp,-32
    800038f4:	00113c23          	sd	ra,24(sp)
    800038f8:	00813823          	sd	s0,16(sp)
    800038fc:	00913423          	sd	s1,8(sp)
    80003900:	01213023          	sd	s2,0(sp)
    80003904:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003908:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    8000390c:	00000913          	li	s2,0
    80003910:	0b80006f          	j	800039c8 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80003914:	0104c783          	lbu	a5,16(s1)
    80003918:	0114c703          	lbu	a4,17(s1)
    8000391c:	00871713          	slli	a4,a4,0x8
    80003920:	00f76733          	or	a4,a4,a5
    80003924:	0124c783          	lbu	a5,18(s1)
    80003928:	01079793          	slli	a5,a5,0x10
    8000392c:	00e7e733          	or	a4,a5,a4
    80003930:	0134c783          	lbu	a5,19(s1)
    80003934:	01879793          	slli	a5,a5,0x18
    80003938:	00e7e7b3          	or	a5,a5,a4
    8000393c:	0144c703          	lbu	a4,20(s1)
    80003940:	02071713          	slli	a4,a4,0x20
    80003944:	00f767b3          	or	a5,a4,a5
    80003948:	0154c703          	lbu	a4,21(s1)
    8000394c:	02871713          	slli	a4,a4,0x28
    80003950:	00f76733          	or	a4,a4,a5
    80003954:	0164c783          	lbu	a5,22(s1)
    80003958:	03079793          	slli	a5,a5,0x30
    8000395c:	00e7e733          	or	a4,a5,a4
    80003960:	0174c783          	lbu	a5,23(s1)
    80003964:	03879793          	slli	a5,a5,0x38
    80003968:	00e7e7b3          	or	a5,a5,a4
    8000396c:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80003970:	0004c703          	lbu	a4,0(s1)
    80003974:	0014c783          	lbu	a5,1(s1)
    80003978:	00879793          	slli	a5,a5,0x8
    8000397c:	00e7e733          	or	a4,a5,a4
    80003980:	0024c783          	lbu	a5,2(s1)
    80003984:	01079793          	slli	a5,a5,0x10
    80003988:	00e7e7b3          	or	a5,a5,a4
    8000398c:	0034c703          	lbu	a4,3(s1)
    80003990:	01871713          	slli	a4,a4,0x18
    80003994:	00f767b3          	or	a5,a4,a5
    80003998:	0044c703          	lbu	a4,4(s1)
    8000399c:	02071713          	slli	a4,a4,0x20
    800039a0:	00f76733          	or	a4,a4,a5
    800039a4:	0054c783          	lbu	a5,5(s1)
    800039a8:	02879793          	slli	a5,a5,0x28
    800039ac:	00e7e733          	or	a4,a5,a4
    800039b0:	0064c783          	lbu	a5,6(s1)
    800039b4:	03079793          	slli	a5,a5,0x30
    800039b8:	00e7e7b3          	or	a5,a5,a4
    800039bc:	0074c483          	lbu	s1,7(s1)
    800039c0:	03849493          	slli	s1,s1,0x38
    800039c4:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    800039c8:	06048263          	beqz	s1,80003a2c <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    800039cc:	0184c783          	lbu	a5,24(s1)
    800039d0:	0194c703          	lbu	a4,25(s1)
    800039d4:	00871713          	slli	a4,a4,0x8
    800039d8:	00f76733          	or	a4,a4,a5
    800039dc:	01a4c783          	lbu	a5,26(s1)
    800039e0:	01079793          	slli	a5,a5,0x10
    800039e4:	00e7e733          	or	a4,a5,a4
    800039e8:	01b4c783          	lbu	a5,27(s1)
    800039ec:	01879793          	slli	a5,a5,0x18
    800039f0:	00e7e7b3          	or	a5,a5,a4
    800039f4:	0007879b          	sext.w	a5,a5
    800039f8:	deadc737          	lui	a4,0xdeadc
    800039fc:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eacce7e>
    80003a00:	f0e78ae3          	beq	a5,a4,80003914 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80003a04:	00007697          	auipc	a3,0x7
    80003a08:	7e468693          	addi	a3,a3,2020 # 8000b1e8 <CONSOLE_STATUS+0x1d8>
    80003a0c:	02800613          	li	a2,40
    80003a10:	00007597          	auipc	a1,0x7
    80003a14:	77858593          	addi	a1,a1,1912 # 8000b188 <CONSOLE_STATUS+0x178>
    80003a18:	00007517          	auipc	a0,0x7
    80003a1c:	7f850513          	addi	a0,a0,2040 # 8000b210 <CONSOLE_STATUS+0x200>
    80003a20:	ffffe097          	auipc	ra,0xffffe
    80003a24:	60c080e7          	jalr	1548(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80003a28:	eedff06f          	j	80003914 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80003a2c:	00090513          	mv	a0,s2
    80003a30:	01813083          	ld	ra,24(sp)
    80003a34:	01013403          	ld	s0,16(sp)
    80003a38:	00813483          	ld	s1,8(sp)
    80003a3c:	00013903          	ld	s2,0(sp)
    80003a40:	02010113          	addi	sp,sp,32
    80003a44:	00008067          	ret

0000000080003a48 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80003a48:	fd010113          	addi	sp,sp,-48
    80003a4c:	02113423          	sd	ra,40(sp)
    80003a50:	02813023          	sd	s0,32(sp)
    80003a54:	00913c23          	sd	s1,24(sp)
    80003a58:	01213823          	sd	s2,16(sp)
    80003a5c:	01313423          	sd	s3,8(sp)
    80003a60:	03010413          	addi	s0,sp,48
    80003a64:	00050993          	mv	s3,a0
    80003a68:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003a6c:	00053483          	ld	s1,0(a0)
    80003a70:	0b80006f          	j	80003b28 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80003a74:	0104c783          	lbu	a5,16(s1)
    80003a78:	0114c703          	lbu	a4,17(s1)
    80003a7c:	00871713          	slli	a4,a4,0x8
    80003a80:	00f76733          	or	a4,a4,a5
    80003a84:	0124c783          	lbu	a5,18(s1)
    80003a88:	01079793          	slli	a5,a5,0x10
    80003a8c:	00e7e733          	or	a4,a5,a4
    80003a90:	0134c783          	lbu	a5,19(s1)
    80003a94:	01879793          	slli	a5,a5,0x18
    80003a98:	00e7e7b3          	or	a5,a5,a4
    80003a9c:	0144c703          	lbu	a4,20(s1)
    80003aa0:	02071713          	slli	a4,a4,0x20
    80003aa4:	00f767b3          	or	a5,a4,a5
    80003aa8:	0154c703          	lbu	a4,21(s1)
    80003aac:	02871713          	slli	a4,a4,0x28
    80003ab0:	00f76733          	or	a4,a4,a5
    80003ab4:	0164c783          	lbu	a5,22(s1)
    80003ab8:	03079793          	slli	a5,a5,0x30
    80003abc:	00e7e733          	or	a4,a5,a4
    80003ac0:	0174c783          	lbu	a5,23(s1)
    80003ac4:	03879793          	slli	a5,a5,0x38
    80003ac8:	00e7e7b3          	or	a5,a5,a4
    80003acc:	0d27f063          	bgeu	a5,s2,80003b8c <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80003ad0:	0004c703          	lbu	a4,0(s1)
    80003ad4:	0014c783          	lbu	a5,1(s1)
    80003ad8:	00879793          	slli	a5,a5,0x8
    80003adc:	00e7e733          	or	a4,a5,a4
    80003ae0:	0024c783          	lbu	a5,2(s1)
    80003ae4:	01079793          	slli	a5,a5,0x10
    80003ae8:	00e7e7b3          	or	a5,a5,a4
    80003aec:	0034c703          	lbu	a4,3(s1)
    80003af0:	01871713          	slli	a4,a4,0x18
    80003af4:	00f767b3          	or	a5,a4,a5
    80003af8:	0044c703          	lbu	a4,4(s1)
    80003afc:	02071713          	slli	a4,a4,0x20
    80003b00:	00f76733          	or	a4,a4,a5
    80003b04:	0054c783          	lbu	a5,5(s1)
    80003b08:	02879793          	slli	a5,a5,0x28
    80003b0c:	00e7e733          	or	a4,a5,a4
    80003b10:	0064c783          	lbu	a5,6(s1)
    80003b14:	03079793          	slli	a5,a5,0x30
    80003b18:	00e7e7b3          	or	a5,a5,a4
    80003b1c:	0074c483          	lbu	s1,7(s1)
    80003b20:	03849493          	slli	s1,s1,0x38
    80003b24:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003b28:	4e048c63          	beqz	s1,80004020 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003b2c:	0184c783          	lbu	a5,24(s1)
    80003b30:	0194c703          	lbu	a4,25(s1)
    80003b34:	00871713          	slli	a4,a4,0x8
    80003b38:	00f76733          	or	a4,a4,a5
    80003b3c:	01a4c783          	lbu	a5,26(s1)
    80003b40:	01079793          	slli	a5,a5,0x10
    80003b44:	00e7e733          	or	a4,a5,a4
    80003b48:	01b4c783          	lbu	a5,27(s1)
    80003b4c:	01879793          	slli	a5,a5,0x18
    80003b50:	00e7e7b3          	or	a5,a5,a4
    80003b54:	0007879b          	sext.w	a5,a5
    80003b58:	deadc737          	lui	a4,0xdeadc
    80003b5c:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eacce7e>
    80003b60:	f0e78ae3          	beq	a5,a4,80003a74 <_ZN11HeapManager12heapAllocateEm+0x2c>
    80003b64:	00007697          	auipc	a3,0x7
    80003b68:	6d468693          	addi	a3,a3,1748 # 8000b238 <CONSOLE_STATUS+0x228>
    80003b6c:	03200613          	li	a2,50
    80003b70:	00007597          	auipc	a1,0x7
    80003b74:	61858593          	addi	a1,a1,1560 # 8000b188 <CONSOLE_STATUS+0x178>
    80003b78:	00007517          	auipc	a0,0x7
    80003b7c:	69850513          	addi	a0,a0,1688 # 8000b210 <CONSOLE_STATUS+0x200>
    80003b80:	ffffe097          	auipc	ra,0xffffe
    80003b84:	4ac080e7          	jalr	1196(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80003b88:	eedff06f          	j	80003a74 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80003b8c:	00190713          	addi	a4,s2,1
    80003b90:	2af77263          	bgeu	a4,a5,80003e34 <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80003b94:	00671793          	slli	a5,a4,0x6
    80003b98:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80003b9c:	fde00713          	li	a4,-34
    80003ba0:	00e78c23          	sb	a4,24(a5)
    80003ba4:	fc000693          	li	a3,-64
    80003ba8:	00d78ca3          	sb	a3,25(a5)
    80003bac:	fad00693          	li	a3,-83
    80003bb0:	00d78d23          	sb	a3,26(a5)
    80003bb4:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80003bb8:	0104c703          	lbu	a4,16(s1)
    80003bbc:	0114c683          	lbu	a3,17(s1)
    80003bc0:	00869693          	slli	a3,a3,0x8
    80003bc4:	00e6e6b3          	or	a3,a3,a4
    80003bc8:	0124c703          	lbu	a4,18(s1)
    80003bcc:	01071713          	slli	a4,a4,0x10
    80003bd0:	00d766b3          	or	a3,a4,a3
    80003bd4:	0134c703          	lbu	a4,19(s1)
    80003bd8:	01871713          	slli	a4,a4,0x18
    80003bdc:	00d76733          	or	a4,a4,a3
    80003be0:	0144c683          	lbu	a3,20(s1)
    80003be4:	02069693          	slli	a3,a3,0x20
    80003be8:	00e6e733          	or	a4,a3,a4
    80003bec:	0154c683          	lbu	a3,21(s1)
    80003bf0:	02869693          	slli	a3,a3,0x28
    80003bf4:	00e6e6b3          	or	a3,a3,a4
    80003bf8:	0164c703          	lbu	a4,22(s1)
    80003bfc:	03071713          	slli	a4,a4,0x30
    80003c00:	00d766b3          	or	a3,a4,a3
    80003c04:	0174c703          	lbu	a4,23(s1)
    80003c08:	03871713          	slli	a4,a4,0x38
    80003c0c:	00d76733          	or	a4,a4,a3
    80003c10:	41270733          	sub	a4,a4,s2
    80003c14:	fff70713          	addi	a4,a4,-1
    80003c18:	00e78823          	sb	a4,16(a5)
    80003c1c:	00875693          	srli	a3,a4,0x8
    80003c20:	00d788a3          	sb	a3,17(a5)
    80003c24:	01075693          	srli	a3,a4,0x10
    80003c28:	00d78923          	sb	a3,18(a5)
    80003c2c:	0187569b          	srliw	a3,a4,0x18
    80003c30:	00d789a3          	sb	a3,19(a5)
    80003c34:	02075693          	srli	a3,a4,0x20
    80003c38:	00d78a23          	sb	a3,20(a5)
    80003c3c:	02875693          	srli	a3,a4,0x28
    80003c40:	00d78aa3          	sb	a3,21(a5)
    80003c44:	03075693          	srli	a3,a4,0x30
    80003c48:	00d78b23          	sb	a3,22(a5)
    80003c4c:	03875713          	srli	a4,a4,0x38
    80003c50:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80003c54:	0004c703          	lbu	a4,0(s1)
    80003c58:	0014c683          	lbu	a3,1(s1)
    80003c5c:	00869693          	slli	a3,a3,0x8
    80003c60:	00e6e733          	or	a4,a3,a4
    80003c64:	0024c683          	lbu	a3,2(s1)
    80003c68:	01069693          	slli	a3,a3,0x10
    80003c6c:	00e6e6b3          	or	a3,a3,a4
    80003c70:	0034c703          	lbu	a4,3(s1)
    80003c74:	01871713          	slli	a4,a4,0x18
    80003c78:	00d766b3          	or	a3,a4,a3
    80003c7c:	0044c703          	lbu	a4,4(s1)
    80003c80:	02071713          	slli	a4,a4,0x20
    80003c84:	00d76733          	or	a4,a4,a3
    80003c88:	0054c683          	lbu	a3,5(s1)
    80003c8c:	02869693          	slli	a3,a3,0x28
    80003c90:	00e6e733          	or	a4,a3,a4
    80003c94:	0064c683          	lbu	a3,6(s1)
    80003c98:	03069693          	slli	a3,a3,0x30
    80003c9c:	00e6e6b3          	or	a3,a3,a4
    80003ca0:	0074c703          	lbu	a4,7(s1)
    80003ca4:	03871713          	slli	a4,a4,0x38
    80003ca8:	00d76733          	or	a4,a4,a3
    80003cac:	00d78023          	sb	a3,0(a5)
    80003cb0:	00875693          	srli	a3,a4,0x8
    80003cb4:	00d780a3          	sb	a3,1(a5)
    80003cb8:	01075693          	srli	a3,a4,0x10
    80003cbc:	00d78123          	sb	a3,2(a5)
    80003cc0:	0187569b          	srliw	a3,a4,0x18
    80003cc4:	00d781a3          	sb	a3,3(a5)
    80003cc8:	02075693          	srli	a3,a4,0x20
    80003ccc:	00d78223          	sb	a3,4(a5)
    80003cd0:	02875693          	srli	a3,a4,0x28
    80003cd4:	00d782a3          	sb	a3,5(a5)
    80003cd8:	03075693          	srli	a3,a4,0x30
    80003cdc:	00d78323          	sb	a3,6(a5)
    80003ce0:	03875713          	srli	a4,a4,0x38
    80003ce4:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80003ce8:	00978423          	sb	s1,8(a5)
    80003cec:	0084d713          	srli	a4,s1,0x8
    80003cf0:	00e784a3          	sb	a4,9(a5)
    80003cf4:	0104d713          	srli	a4,s1,0x10
    80003cf8:	00e78523          	sb	a4,10(a5)
    80003cfc:	0184d71b          	srliw	a4,s1,0x18
    80003d00:	00e785a3          	sb	a4,11(a5)
    80003d04:	0204d713          	srli	a4,s1,0x20
    80003d08:	00e78623          	sb	a4,12(a5)
    80003d0c:	0284d713          	srli	a4,s1,0x28
    80003d10:	00e786a3          	sb	a4,13(a5)
    80003d14:	0304d713          	srli	a4,s1,0x30
    80003d18:	00e78723          	sb	a4,14(a5)
    80003d1c:	0384d713          	srli	a4,s1,0x38
    80003d20:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    80003d24:	0004c703          	lbu	a4,0(s1)
    80003d28:	0014c683          	lbu	a3,1(s1)
    80003d2c:	00869693          	slli	a3,a3,0x8
    80003d30:	00e6e6b3          	or	a3,a3,a4
    80003d34:	0024c703          	lbu	a4,2(s1)
    80003d38:	01071713          	slli	a4,a4,0x10
    80003d3c:	00d766b3          	or	a3,a4,a3
    80003d40:	0034c703          	lbu	a4,3(s1)
    80003d44:	01871713          	slli	a4,a4,0x18
    80003d48:	00d76733          	or	a4,a4,a3
    80003d4c:	0044c683          	lbu	a3,4(s1)
    80003d50:	02069693          	slli	a3,a3,0x20
    80003d54:	00e6e733          	or	a4,a3,a4
    80003d58:	0054c683          	lbu	a3,5(s1)
    80003d5c:	02869693          	slli	a3,a3,0x28
    80003d60:	00e6e6b3          	or	a3,a3,a4
    80003d64:	0064c703          	lbu	a4,6(s1)
    80003d68:	03071713          	slli	a4,a4,0x30
    80003d6c:	00d766b3          	or	a3,a4,a3
    80003d70:	0074c703          	lbu	a4,7(s1)
    80003d74:	03871713          	slli	a4,a4,0x38
    80003d78:	00d76733          	or	a4,a4,a3
    80003d7c:	04070063          	beqz	a4,80003dbc <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003d80:	00f70423          	sb	a5,8(a4)
    80003d84:	0087d693          	srli	a3,a5,0x8
    80003d88:	00d704a3          	sb	a3,9(a4)
    80003d8c:	0107d693          	srli	a3,a5,0x10
    80003d90:	00d70523          	sb	a3,10(a4)
    80003d94:	0187d69b          	srliw	a3,a5,0x18
    80003d98:	00d705a3          	sb	a3,11(a4)
    80003d9c:	0207d693          	srli	a3,a5,0x20
    80003da0:	00d70623          	sb	a3,12(a4)
    80003da4:	0287d693          	srli	a3,a5,0x28
    80003da8:	00d706a3          	sb	a3,13(a4)
    80003dac:	0307d693          	srli	a3,a5,0x30
    80003db0:	00d70723          	sb	a3,14(a4)
    80003db4:	0387d693          	srli	a3,a5,0x38
    80003db8:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80003dbc:	00f48023          	sb	a5,0(s1)
    80003dc0:	0087d713          	srli	a4,a5,0x8
    80003dc4:	00e480a3          	sb	a4,1(s1)
    80003dc8:	0107d713          	srli	a4,a5,0x10
    80003dcc:	00e48123          	sb	a4,2(s1)
    80003dd0:	0187d71b          	srliw	a4,a5,0x18
    80003dd4:	00e481a3          	sb	a4,3(s1)
    80003dd8:	0207d713          	srli	a4,a5,0x20
    80003ddc:	00e48223          	sb	a4,4(s1)
    80003de0:	0287d713          	srli	a4,a5,0x28
    80003de4:	00e482a3          	sb	a4,5(s1)
    80003de8:	0307d713          	srli	a4,a5,0x30
    80003dec:	00e48323          	sb	a4,6(s1)
    80003df0:	0387d793          	srli	a5,a5,0x38
    80003df4:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80003df8:	01248823          	sb	s2,16(s1)
    80003dfc:	00895793          	srli	a5,s2,0x8
    80003e00:	00f488a3          	sb	a5,17(s1)
    80003e04:	01095793          	srli	a5,s2,0x10
    80003e08:	00f48923          	sb	a5,18(s1)
    80003e0c:	0189579b          	srliw	a5,s2,0x18
    80003e10:	00f489a3          	sb	a5,19(s1)
    80003e14:	02095793          	srli	a5,s2,0x20
    80003e18:	00f48a23          	sb	a5,20(s1)
    80003e1c:	02895793          	srli	a5,s2,0x28
    80003e20:	00f48aa3          	sb	a5,21(s1)
    80003e24:	03095793          	srli	a5,s2,0x30
    80003e28:	00f48b23          	sb	a5,22(s1)
    80003e2c:	03895913          	srli	s2,s2,0x38
    80003e30:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80003e34:	0009b783          	ld	a5,0(s3)
    80003e38:	20978463          	beq	a5,s1,80004040 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80003e3c:	0084c783          	lbu	a5,8(s1)
    80003e40:	0094c703          	lbu	a4,9(s1)
    80003e44:	00871713          	slli	a4,a4,0x8
    80003e48:	00f76733          	or	a4,a4,a5
    80003e4c:	00a4c783          	lbu	a5,10(s1)
    80003e50:	01079793          	slli	a5,a5,0x10
    80003e54:	00e7e733          	or	a4,a5,a4
    80003e58:	00b4c783          	lbu	a5,11(s1)
    80003e5c:	01879793          	slli	a5,a5,0x18
    80003e60:	00e7e7b3          	or	a5,a5,a4
    80003e64:	00c4c703          	lbu	a4,12(s1)
    80003e68:	02071713          	slli	a4,a4,0x20
    80003e6c:	00f767b3          	or	a5,a4,a5
    80003e70:	00d4c703          	lbu	a4,13(s1)
    80003e74:	02871713          	slli	a4,a4,0x28
    80003e78:	00f76733          	or	a4,a4,a5
    80003e7c:	00e4c783          	lbu	a5,14(s1)
    80003e80:	03079793          	slli	a5,a5,0x30
    80003e84:	00e7e733          	or	a4,a5,a4
    80003e88:	00f4c783          	lbu	a5,15(s1)
    80003e8c:	03879793          	slli	a5,a5,0x38
    80003e90:	00e7e7b3          	or	a5,a5,a4
    80003e94:	08078c63          	beqz	a5,80003f2c <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80003e98:	0004c703          	lbu	a4,0(s1)
    80003e9c:	0014c683          	lbu	a3,1(s1)
    80003ea0:	00869693          	slli	a3,a3,0x8
    80003ea4:	00e6e733          	or	a4,a3,a4
    80003ea8:	0024c683          	lbu	a3,2(s1)
    80003eac:	01069693          	slli	a3,a3,0x10
    80003eb0:	00e6e6b3          	or	a3,a3,a4
    80003eb4:	0034c703          	lbu	a4,3(s1)
    80003eb8:	01871713          	slli	a4,a4,0x18
    80003ebc:	00d766b3          	or	a3,a4,a3
    80003ec0:	0044c703          	lbu	a4,4(s1)
    80003ec4:	02071713          	slli	a4,a4,0x20
    80003ec8:	00d76733          	or	a4,a4,a3
    80003ecc:	0054c683          	lbu	a3,5(s1)
    80003ed0:	02869693          	slli	a3,a3,0x28
    80003ed4:	00e6e733          	or	a4,a3,a4
    80003ed8:	0064c683          	lbu	a3,6(s1)
    80003edc:	03069693          	slli	a3,a3,0x30
    80003ee0:	00e6e6b3          	or	a3,a3,a4
    80003ee4:	0074c703          	lbu	a4,7(s1)
    80003ee8:	03871713          	slli	a4,a4,0x38
    80003eec:	00d76733          	or	a4,a4,a3
    80003ef0:	00d78023          	sb	a3,0(a5)
    80003ef4:	00875693          	srli	a3,a4,0x8
    80003ef8:	00d780a3          	sb	a3,1(a5)
    80003efc:	01075693          	srli	a3,a4,0x10
    80003f00:	00d78123          	sb	a3,2(a5)
    80003f04:	0187569b          	srliw	a3,a4,0x18
    80003f08:	00d781a3          	sb	a3,3(a5)
    80003f0c:	02075693          	srli	a3,a4,0x20
    80003f10:	00d78223          	sb	a3,4(a5)
    80003f14:	02875693          	srli	a3,a4,0x28
    80003f18:	00d782a3          	sb	a3,5(a5)
    80003f1c:	03075693          	srli	a3,a4,0x30
    80003f20:	00d78323          	sb	a3,6(a5)
    80003f24:	03875713          	srli	a4,a4,0x38
    80003f28:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003f2c:	0004c783          	lbu	a5,0(s1)
    80003f30:	0014c703          	lbu	a4,1(s1)
    80003f34:	00871713          	slli	a4,a4,0x8
    80003f38:	00f76733          	or	a4,a4,a5
    80003f3c:	0024c783          	lbu	a5,2(s1)
    80003f40:	01079793          	slli	a5,a5,0x10
    80003f44:	00e7e733          	or	a4,a5,a4
    80003f48:	0034c783          	lbu	a5,3(s1)
    80003f4c:	01879793          	slli	a5,a5,0x18
    80003f50:	00e7e7b3          	or	a5,a5,a4
    80003f54:	0044c703          	lbu	a4,4(s1)
    80003f58:	02071713          	slli	a4,a4,0x20
    80003f5c:	00f767b3          	or	a5,a4,a5
    80003f60:	0054c703          	lbu	a4,5(s1)
    80003f64:	02871713          	slli	a4,a4,0x28
    80003f68:	00f76733          	or	a4,a4,a5
    80003f6c:	0064c783          	lbu	a5,6(s1)
    80003f70:	03079793          	slli	a5,a5,0x30
    80003f74:	00e7e733          	or	a4,a5,a4
    80003f78:	0074c783          	lbu	a5,7(s1)
    80003f7c:	03879793          	slli	a5,a5,0x38
    80003f80:	00e7e7b3          	or	a5,a5,a4
    80003f84:	08078c63          	beqz	a5,8000401c <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003f88:	0084c703          	lbu	a4,8(s1)
    80003f8c:	0094c683          	lbu	a3,9(s1)
    80003f90:	00869693          	slli	a3,a3,0x8
    80003f94:	00e6e733          	or	a4,a3,a4
    80003f98:	00a4c683          	lbu	a3,10(s1)
    80003f9c:	01069693          	slli	a3,a3,0x10
    80003fa0:	00e6e6b3          	or	a3,a3,a4
    80003fa4:	00b4c703          	lbu	a4,11(s1)
    80003fa8:	01871713          	slli	a4,a4,0x18
    80003fac:	00d766b3          	or	a3,a4,a3
    80003fb0:	00c4c703          	lbu	a4,12(s1)
    80003fb4:	02071713          	slli	a4,a4,0x20
    80003fb8:	00d76733          	or	a4,a4,a3
    80003fbc:	00d4c683          	lbu	a3,13(s1)
    80003fc0:	02869693          	slli	a3,a3,0x28
    80003fc4:	00e6e733          	or	a4,a3,a4
    80003fc8:	00e4c683          	lbu	a3,14(s1)
    80003fcc:	03069693          	slli	a3,a3,0x30
    80003fd0:	00e6e6b3          	or	a3,a3,a4
    80003fd4:	00f4c703          	lbu	a4,15(s1)
    80003fd8:	03871713          	slli	a4,a4,0x38
    80003fdc:	00d76733          	or	a4,a4,a3
    80003fe0:	00d78423          	sb	a3,8(a5)
    80003fe4:	00875693          	srli	a3,a4,0x8
    80003fe8:	00d784a3          	sb	a3,9(a5)
    80003fec:	01075693          	srli	a3,a4,0x10
    80003ff0:	00d78523          	sb	a3,10(a5)
    80003ff4:	0187569b          	srliw	a3,a4,0x18
    80003ff8:	00d785a3          	sb	a3,11(a5)
    80003ffc:	02075693          	srli	a3,a4,0x20
    80004000:	00d78623          	sb	a3,12(a5)
    80004004:	02875693          	srli	a3,a4,0x28
    80004008:	00d786a3          	sb	a3,13(a5)
    8000400c:	03075693          	srli	a3,a4,0x30
    80004010:	00d78723          	sb	a3,14(a5)
    80004014:	03875713          	srli	a4,a4,0x38
    80004018:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    8000401c:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80004020:	00048513          	mv	a0,s1
    80004024:	02813083          	ld	ra,40(sp)
    80004028:	02013403          	ld	s0,32(sp)
    8000402c:	01813483          	ld	s1,24(sp)
    80004030:	01013903          	ld	s2,16(sp)
    80004034:	00813983          	ld	s3,8(sp)
    80004038:	03010113          	addi	sp,sp,48
    8000403c:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80004040:	0004c703          	lbu	a4,0(s1)
    80004044:	0014c783          	lbu	a5,1(s1)
    80004048:	00879793          	slli	a5,a5,0x8
    8000404c:	00e7e7b3          	or	a5,a5,a4
    80004050:	0024c703          	lbu	a4,2(s1)
    80004054:	01071713          	slli	a4,a4,0x10
    80004058:	00f76733          	or	a4,a4,a5
    8000405c:	0034c783          	lbu	a5,3(s1)
    80004060:	01879793          	slli	a5,a5,0x18
    80004064:	00e7e733          	or	a4,a5,a4
    80004068:	0044c783          	lbu	a5,4(s1)
    8000406c:	02079793          	slli	a5,a5,0x20
    80004070:	00e7e7b3          	or	a5,a5,a4
    80004074:	0054c703          	lbu	a4,5(s1)
    80004078:	02871713          	slli	a4,a4,0x28
    8000407c:	00f76733          	or	a4,a4,a5
    80004080:	0064c783          	lbu	a5,6(s1)
    80004084:	03079793          	slli	a5,a5,0x30
    80004088:	00e7e733          	or	a4,a5,a4
    8000408c:	0074c783          	lbu	a5,7(s1)
    80004090:	03879793          	slli	a5,a5,0x38
    80004094:	00e7e7b3          	or	a5,a5,a4
    80004098:	00f9b023          	sd	a5,0(s3)
    8000409c:	da1ff06f          	j	80003e3c <_ZN11HeapManager12heapAllocateEm+0x3f4>

00000000800040a0 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    800040a0:	ff010113          	addi	sp,sp,-16
    800040a4:	00813423          	sd	s0,8(sp)
    800040a8:	01010413          	addi	s0,sp,16
    //     if(pFree->pNext != 0){
    //         pFree->pNext->pPrev = pFree;
    //     }
    // }
    return 0;
}
    800040ac:	00000513          	li	a0,0
    800040b0:	00813403          	ld	s0,8(sp)
    800040b4:	01010113          	addi	sp,sp,16
    800040b8:	00008067          	ret

00000000800040bc <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"
#include "assert.h"

extern "C" void exceptionHandler(){
    800040bc:	fc010113          	addi	sp,sp,-64
    800040c0:	02113c23          	sd	ra,56(sp)
    800040c4:	02813823          	sd	s0,48(sp)
    800040c8:	02913423          	sd	s1,40(sp)
    800040cc:	03213023          	sd	s2,32(sp)
    800040d0:	01313c23          	sd	s3,24(sp)
    800040d4:	01413823          	sd	s4,16(sp)
    800040d8:	01513423          	sd	s5,8(sp)
    800040dc:	01613023          	sd	s6,0(sp)
    800040e0:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    800040e4:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    800040e8:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    800040ec:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    800040f0:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    800040f4:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    800040f8:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    800040fc:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80004100:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    80004104:	ff870613          	addi	a2,a4,-8
    80004108:	00100693          	li	a3,1
    8000410c:	04c6fc63          	bgeu	a3,a2,80004164 <exceptionHandler+0xa8>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    80004110:	00500793          	li	a5,5
    80004114:	22f70663          	beq	a4,a5,80004340 <exceptionHandler+0x284>
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
        putc('\n');
        putc('E');
    80004118:	00700793          	li	a5,7
    8000411c:	3ef70063          	beq	a4,a5,800044fc <exceptionHandler+0x440>
    }
    else if(scause == 0x8000000000000001UL){    /// timer
        putc('t');
        Console::outputHandler();
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
    80004120:	fff00793          	li	a5,-1
    80004124:	03f79793          	slli	a5,a5,0x3f
    80004128:	00178793          	addi	a5,a5,1
    8000412c:	58f70c63          	beq	a4,a5,800046c4 <exceptionHandler+0x608>
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    {   
        int irq = plic_claim();
        if(irq == CONSOLE_IRQ)Console::inputHandler();
        plic_complete(irq);
    80004130:	fff00793          	li	a5,-1
    80004134:	03f79793          	slli	a5,a5,0x3f
    80004138:	00978793          	addi	a5,a5,9
    8000413c:	0af71063          	bne	a4,a5,800041dc <exceptionHandler+0x120>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    80004140:	00005097          	auipc	ra,0x5
    80004144:	9b4080e7          	jalr	-1612(ra) # 80008af4 <plic_claim>
    80004148:	00050493          	mv	s1,a0
    8000414c:	00a00793          	li	a5,10
    80004150:	5ef50663          	beq	a0,a5,8000473c <exceptionHandler+0x680>
    80004154:	00048513          	mv	a0,s1
    80004158:	00005097          	auipc	ra,0x5
    8000415c:	9d4080e7          	jalr	-1580(ra) # 80008b2c <plic_complete>
    80004160:	07c0006f          	j	800041dc <exceptionHandler+0x120>
        switch(a0){
    80004164:	04200713          	li	a4,66
    80004168:	02f76463          	bltu	a4,a5,80004190 <exceptionHandler+0xd4>
    8000416c:	1c078263          	beqz	a5,80004330 <exceptionHandler+0x274>
    80004170:	1cf76463          	bltu	a4,a5,80004338 <exceptionHandler+0x27c>
    80004174:	00279793          	slli	a5,a5,0x2
    80004178:	00007717          	auipc	a4,0x7
    8000417c:	14c70713          	addi	a4,a4,332 # 8000b2c4 <CONSOLE_STATUS+0x2b4>
    80004180:	00e787b3          	add	a5,a5,a4
    80004184:	0007a783          	lw	a5,0(a5)
    80004188:	00e787b3          	add	a5,a5,a4
    8000418c:	00078067          	jr	a5
    80004190:	0ff00713          	li	a4,255
    80004194:	02e79663          	bne	a5,a4,800041c0 <exceptionHandler+0x104>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80004198:	00000793          	li	a5,0
    8000419c:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800041a0:	00448493          	addi	s1,s1,4
    800041a4:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800041a8:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    800041ac:	10000793          	li	a5,256
    800041b0:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800041b4:	00200793          	li	a5,2
    800041b8:	1447b073          	csrc	sip,a5
                return;
    800041bc:	0200006f          	j	800041dc <exceptionHandler+0x120>
        switch(a0){
    800041c0:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800041c4:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800041c8:	00448493          	addi	s1,s1,4
    800041cc:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800041d0:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800041d4:	00200793          	li	a5,2
    800041d8:	1447b073          	csrc	sip,a5
    800041dc:	03813083          	ld	ra,56(sp)
    800041e0:	03013403          	ld	s0,48(sp)
    800041e4:	02813483          	ld	s1,40(sp)
    800041e8:	02013903          	ld	s2,32(sp)
    800041ec:	01813983          	ld	s3,24(sp)
    800041f0:	01013a03          	ld	s4,16(sp)
    800041f4:	00813a83          	ld	s5,8(sp)
    800041f8:	00013b03          	ld	s6,0(sp)
    800041fc:	04010113          	addi	sp,sp,64
    80004200:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80004204:	00098593          	mv	a1,s3
    80004208:	0000a797          	auipc	a5,0xa
    8000420c:	d007b783          	ld	a5,-768(a5) # 8000df08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80004210:	0007b503          	ld	a0,0(a5)
    80004214:	00000097          	auipc	ra,0x0
    80004218:	834080e7          	jalr	-1996(ra) # 80003a48 <_ZN11HeapManager12heapAllocateEm>
                break;
    8000421c:	fa9ff06f          	j	800041c4 <exceptionHandler+0x108>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    80004220:	00098593          	mv	a1,s3
    80004224:	0000a797          	auipc	a5,0xa
    80004228:	ce47b783          	ld	a5,-796(a5) # 8000df08 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000422c:	0007b503          	ld	a0,0(a5)
    80004230:	00000097          	auipc	ra,0x0
    80004234:	e70080e7          	jalr	-400(ra) # 800040a0 <_ZN11HeapManager8heapFreeEPv>
                break;
    80004238:	f8dff06f          	j	800041c4 <exceptionHandler+0x108>
                putc('\0'); /// removing this line causes everything to break
    8000423c:	00000513          	li	a0,0
    80004240:	ffffe097          	auipc	ra,0xffffe
    80004244:	83c080e7          	jalr	-1988(ra) # 80001a7c <_Z4putcc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    80004248:	00100713          	li	a4,1
    8000424c:	000b0693          	mv	a3,s6
    80004250:	000a8613          	mv	a2,s5
    80004254:	000a0593          	mv	a1,s4
    80004258:	00098513          	mv	a0,s3
    8000425c:	fffff097          	auipc	ra,0xfffff
    80004260:	ea8080e7          	jalr	-344(ra) # 80003104 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80004264:	f61ff06f          	j	800041c4 <exceptionHandler+0x108>
                returnVal = _thread::currentThread->exit();
    80004268:	fffff097          	auipc	ra,0xfffff
    8000426c:	238080e7          	jalr	568(ra) # 800034a0 <_ZN7_thread4exitEv>
                break;
    80004270:	f55ff06f          	j	800041c4 <exceptionHandler+0x108>
                _thread::dispatch();
    80004274:	fffff097          	auipc	ra,0xfffff
    80004278:	43c080e7          	jalr	1084(ra) # 800036b0 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    8000427c:	00000513          	li	a0,0
                break;
    80004280:	f45ff06f          	j	800041c4 <exceptionHandler+0x108>
                _thread::currentThread->join((thread_t)a1);
    80004284:	00098593          	mv	a1,s3
    80004288:	0000a797          	auipc	a5,0xa
    8000428c:	ca07b783          	ld	a5,-864(a5) # 8000df28 <_GLOBAL_OFFSET_TABLE_+0x50>
    80004290:	0007b503          	ld	a0,0(a5)
    80004294:	fffff097          	auipc	ra,0xfffff
    80004298:	040080e7          	jalr	64(ra) # 800032d4 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    8000429c:	00000513          	li	a0,0
                break;
    800042a0:	f25ff06f          	j	800041c4 <exceptionHandler+0x108>
                _sem::open((sem_t*)a1, unsigned(a2));
    800042a4:	000a059b          	sext.w	a1,s4
    800042a8:	00098513          	mv	a0,s3
    800042ac:	ffffd097          	auipc	ra,0xffffd
    800042b0:	7f4080e7          	jalr	2036(ra) # 80001aa0 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    800042b4:	00000513          	li	a0,0
                break;
    800042b8:	f0dff06f          	j	800041c4 <exceptionHandler+0x108>
                _sem::close((sem_t)a1);
    800042bc:	00098513          	mv	a0,s3
    800042c0:	ffffe097          	auipc	ra,0xffffe
    800042c4:	83c080e7          	jalr	-1988(ra) # 80001afc <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    800042c8:	00000513          	li	a0,0
                break;
    800042cc:	ef9ff06f          	j	800041c4 <exceptionHandler+0x108>
                _sem::wait((sem_t)a1);
    800042d0:	00098513          	mv	a0,s3
    800042d4:	ffffe097          	auipc	ra,0xffffe
    800042d8:	888080e7          	jalr	-1912(ra) # 80001b5c <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    800042dc:	00000513          	li	a0,0
                break;
    800042e0:	ee5ff06f          	j	800041c4 <exceptionHandler+0x108>
                _sem::signal((sem_t)a1);
    800042e4:	00098513          	mv	a0,s3
    800042e8:	ffffe097          	auipc	ra,0xffffe
    800042ec:	918080e7          	jalr	-1768(ra) # 80001c00 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    800042f0:	00000513          	li	a0,0
                break;
    800042f4:	ed1ff06f          	j	800041c4 <exceptionHandler+0x108>
                returnVal = Timer::getInstance().sleep(a1);
    800042f8:	ffffd097          	auipc	ra,0xffffd
    800042fc:	344080e7          	jalr	836(ra) # 8000163c <_ZN5Timer11getInstanceEv>
    80004300:	00098593          	mv	a1,s3
    80004304:	ffffd097          	auipc	ra,0xffffd
    80004308:	43c080e7          	jalr	1084(ra) # 80001740 <_ZN5Timer5sleepEm>
                break;
    8000430c:	eb9ff06f          	j	800041c4 <exceptionHandler+0x108>
                returnVal = Console::getc();
    80004310:	ffffe097          	auipc	ra,0xffffe
    80004314:	2b4080e7          	jalr	692(ra) # 800025c4 <_ZN7Console4getcEv>
                break;
    80004318:	eadff06f          	j	800041c4 <exceptionHandler+0x108>
                Console::putc(a1);
    8000431c:	0ff9f513          	andi	a0,s3,255
    80004320:	ffffe097          	auipc	ra,0xffffe
    80004324:	264080e7          	jalr	612(ra) # 80002584 <_ZN7Console4putcEc>
    uint64 returnVal = 0;
    80004328:	00000513          	li	a0,0
                break;
    8000432c:	e99ff06f          	j	800041c4 <exceptionHandler+0x108>
        switch(a0){
    80004330:	00000513          	li	a0,0
    80004334:	e91ff06f          	j	800041c4 <exceptionHandler+0x108>
    80004338:	00000513          	li	a0,0
    8000433c:	e89ff06f          	j	800041c4 <exceptionHandler+0x108>
        putc('\n');
    80004340:	00a00513          	li	a0,10
    80004344:	ffffd097          	auipc	ra,0xffffd
    80004348:	738080e7          	jalr	1848(ra) # 80001a7c <_Z4putcc>
        putc('E');
    8000434c:	04500513          	li	a0,69
    80004350:	ffffd097          	auipc	ra,0xffffd
    80004354:	72c080e7          	jalr	1836(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004358:	07200513          	li	a0,114
    8000435c:	ffffd097          	auipc	ra,0xffffd
    80004360:	720080e7          	jalr	1824(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004364:	07200513          	li	a0,114
    80004368:	ffffd097          	auipc	ra,0xffffd
    8000436c:	714080e7          	jalr	1812(ra) # 80001a7c <_Z4putcc>
        putc('o');
    80004370:	06f00513          	li	a0,111
    80004374:	ffffd097          	auipc	ra,0xffffd
    80004378:	708080e7          	jalr	1800(ra) # 80001a7c <_Z4putcc>
        putc('r');
    8000437c:	07200513          	li	a0,114
    80004380:	ffffd097          	auipc	ra,0xffffd
    80004384:	6fc080e7          	jalr	1788(ra) # 80001a7c <_Z4putcc>
        putc(':');
    80004388:	03a00513          	li	a0,58
    8000438c:	ffffd097          	auipc	ra,0xffffd
    80004390:	6f0080e7          	jalr	1776(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    80004394:	02000513          	li	a0,32
    80004398:	ffffd097          	auipc	ra,0xffffd
    8000439c:	6e4080e7          	jalr	1764(ra) # 80001a7c <_Z4putcc>
        putc('i');
    800043a0:	06900513          	li	a0,105
    800043a4:	ffffd097          	auipc	ra,0xffffd
    800043a8:	6d8080e7          	jalr	1752(ra) # 80001a7c <_Z4putcc>
        putc('l');
    800043ac:	06c00513          	li	a0,108
    800043b0:	ffffd097          	auipc	ra,0xffffd
    800043b4:	6cc080e7          	jalr	1740(ra) # 80001a7c <_Z4putcc>
        putc('l');
    800043b8:	06c00513          	li	a0,108
    800043bc:	ffffd097          	auipc	ra,0xffffd
    800043c0:	6c0080e7          	jalr	1728(ra) # 80001a7c <_Z4putcc>
        putc('e');
    800043c4:	06500513          	li	a0,101
    800043c8:	ffffd097          	auipc	ra,0xffffd
    800043cc:	6b4080e7          	jalr	1716(ra) # 80001a7c <_Z4putcc>
        putc('g');
    800043d0:	06700513          	li	a0,103
    800043d4:	ffffd097          	auipc	ra,0xffffd
    800043d8:	6a8080e7          	jalr	1704(ra) # 80001a7c <_Z4putcc>
        putc('a');
    800043dc:	06100513          	li	a0,97
    800043e0:	ffffd097          	auipc	ra,0xffffd
    800043e4:	69c080e7          	jalr	1692(ra) # 80001a7c <_Z4putcc>
        putc('l');
    800043e8:	06c00513          	li	a0,108
    800043ec:	ffffd097          	auipc	ra,0xffffd
    800043f0:	690080e7          	jalr	1680(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    800043f4:	02000513          	li	a0,32
    800043f8:	ffffd097          	auipc	ra,0xffffd
    800043fc:	684080e7          	jalr	1668(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004400:	07200513          	li	a0,114
    80004404:	ffffd097          	auipc	ra,0xffffd
    80004408:	678080e7          	jalr	1656(ra) # 80001a7c <_Z4putcc>
        putc('e');
    8000440c:	06500513          	li	a0,101
    80004410:	ffffd097          	auipc	ra,0xffffd
    80004414:	66c080e7          	jalr	1644(ra) # 80001a7c <_Z4putcc>
        putc('a');
    80004418:	06100513          	li	a0,97
    8000441c:	ffffd097          	auipc	ra,0xffffd
    80004420:	660080e7          	jalr	1632(ra) # 80001a7c <_Z4putcc>
        putc('d');
    80004424:	06400513          	li	a0,100
    80004428:	ffffd097          	auipc	ra,0xffffd
    8000442c:	654080e7          	jalr	1620(ra) # 80001a7c <_Z4putcc>
        putc('!');
    80004430:	02100513          	li	a0,33
    80004434:	ffffd097          	auipc	ra,0xffffd
    80004438:	648080e7          	jalr	1608(ra) # 80001a7c <_Z4putcc>
        putc('P');
    8000443c:	14102973          	csrr	s2,sepc
        putc('C');
    80004440:	00a00513          	li	a0,10
    80004444:	ffffd097          	auipc	ra,0xffffd
    80004448:	638080e7          	jalr	1592(ra) # 80001a7c <_Z4putcc>
        putc(':');
    8000444c:	05000513          	li	a0,80
    80004450:	ffffd097          	auipc	ra,0xffffd
    80004454:	62c080e7          	jalr	1580(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    80004458:	04300513          	li	a0,67
    8000445c:	ffffd097          	auipc	ra,0xffffd
    80004460:	620080e7          	jalr	1568(ra) # 80001a7c <_Z4putcc>
        putc('0');
    80004464:	03a00513          	li	a0,58
    80004468:	ffffd097          	auipc	ra,0xffffd
    8000446c:	614080e7          	jalr	1556(ra) # 80001a7c <_Z4putcc>
        putc('x');
    80004470:	02000513          	li	a0,32
    80004474:	ffffd097          	auipc	ra,0xffffd
    80004478:	608080e7          	jalr	1544(ra) # 80001a7c <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    8000447c:	03000513          	li	a0,48
    80004480:	ffffd097          	auipc	ra,0xffffd
    80004484:	5fc080e7          	jalr	1532(ra) # 80001a7c <_Z4putcc>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80004488:	07800513          	li	a0,120
    8000448c:	ffffd097          	auipc	ra,0xffffd
    80004490:	5f0080e7          	jalr	1520(ra) # 80001a7c <_Z4putcc>
            if(tmp < 10){
    80004494:	00f00493          	li	s1,15
    80004498:	0140006f          	j	800044ac <exceptionHandler+0x3f0>
        }
    8000449c:	03750513          	addi	a0,a0,55
    800044a0:	ffffd097          	auipc	ra,0xffffd
    800044a4:	5dc080e7          	jalr	1500(ra) # 80001a7c <_Z4putcc>
            if(tmp < 10){
    800044a8:	fff4849b          	addiw	s1,s1,-1
    800044ac:	0204c463          	bltz	s1,800044d4 <exceptionHandler+0x418>
                putc('0' + tmp);
    800044b0:	0024951b          	slliw	a0,s1,0x2
    800044b4:	00a95533          	srl	a0,s2,a0
    800044b8:	00f57513          	andi	a0,a0,15
            }else{
    800044bc:	00900793          	li	a5,9
    800044c0:	fca7eee3          	bltu	a5,a0,8000449c <exceptionHandler+0x3e0>
                putc('A' + tmp - 10);
    800044c4:	03050513          	addi	a0,a0,48
    800044c8:	ffffd097          	auipc	ra,0xffffd
    800044cc:	5b4080e7          	jalr	1460(ra) # 80001a7c <_Z4putcc>
    800044d0:	fd9ff06f          	j	800044a8 <exceptionHandler+0x3ec>
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    800044d4:	00007697          	auipc	a3,0x7
    800044d8:	d8c68693          	addi	a3,a3,-628 # 8000b260 <CONSOLE_STATUS+0x250>
    800044dc:	08800613          	li	a2,136
    800044e0:	00007597          	auipc	a1,0x7
    800044e4:	d9858593          	addi	a1,a1,-616 # 8000b278 <CONSOLE_STATUS+0x268>
    800044e8:	00007517          	auipc	a0,0x7
    800044ec:	db050513          	addi	a0,a0,-592 # 8000b298 <CONSOLE_STATUS+0x288>
    800044f0:	ffffe097          	auipc	ra,0xffffe
    800044f4:	b3c080e7          	jalr	-1220(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800044f8:	ce5ff06f          	j	800041dc <exceptionHandler+0x120>
        putc('r');
    800044fc:	00a00513          	li	a0,10
    80004500:	ffffd097          	auipc	ra,0xffffd
    80004504:	57c080e7          	jalr	1404(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004508:	04500513          	li	a0,69
    8000450c:	ffffd097          	auipc	ra,0xffffd
    80004510:	570080e7          	jalr	1392(ra) # 80001a7c <_Z4putcc>
        putc('o');
    80004514:	07200513          	li	a0,114
    80004518:	ffffd097          	auipc	ra,0xffffd
    8000451c:	564080e7          	jalr	1380(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004520:	07200513          	li	a0,114
    80004524:	ffffd097          	auipc	ra,0xffffd
    80004528:	558080e7          	jalr	1368(ra) # 80001a7c <_Z4putcc>
        putc(':');
    8000452c:	06f00513          	li	a0,111
    80004530:	ffffd097          	auipc	ra,0xffffd
    80004534:	54c080e7          	jalr	1356(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    80004538:	07200513          	li	a0,114
    8000453c:	ffffd097          	auipc	ra,0xffffd
    80004540:	540080e7          	jalr	1344(ra) # 80001a7c <_Z4putcc>
        putc('i');
    80004544:	03a00513          	li	a0,58
    80004548:	ffffd097          	auipc	ra,0xffffd
    8000454c:	534080e7          	jalr	1332(ra) # 80001a7c <_Z4putcc>
        putc('l');
    80004550:	02000513          	li	a0,32
    80004554:	ffffd097          	auipc	ra,0xffffd
    80004558:	528080e7          	jalr	1320(ra) # 80001a7c <_Z4putcc>
        putc('l');
    8000455c:	06900513          	li	a0,105
    80004560:	ffffd097          	auipc	ra,0xffffd
    80004564:	51c080e7          	jalr	1308(ra) # 80001a7c <_Z4putcc>
        putc('e');
    80004568:	06c00513          	li	a0,108
    8000456c:	ffffd097          	auipc	ra,0xffffd
    80004570:	510080e7          	jalr	1296(ra) # 80001a7c <_Z4putcc>
        putc('g');
    80004574:	06c00513          	li	a0,108
    80004578:	ffffd097          	auipc	ra,0xffffd
    8000457c:	504080e7          	jalr	1284(ra) # 80001a7c <_Z4putcc>
        putc('a');
    80004580:	06500513          	li	a0,101
    80004584:	ffffd097          	auipc	ra,0xffffd
    80004588:	4f8080e7          	jalr	1272(ra) # 80001a7c <_Z4putcc>
        putc('l');
    8000458c:	06700513          	li	a0,103
    80004590:	ffffd097          	auipc	ra,0xffffd
    80004594:	4ec080e7          	jalr	1260(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    80004598:	06100513          	li	a0,97
    8000459c:	ffffd097          	auipc	ra,0xffffd
    800045a0:	4e0080e7          	jalr	1248(ra) # 80001a7c <_Z4putcc>
        putc('w');
    800045a4:	06c00513          	li	a0,108
    800045a8:	ffffd097          	auipc	ra,0xffffd
    800045ac:	4d4080e7          	jalr	1236(ra) # 80001a7c <_Z4putcc>
        putc('r');
    800045b0:	02000513          	li	a0,32
    800045b4:	ffffd097          	auipc	ra,0xffffd
    800045b8:	4c8080e7          	jalr	1224(ra) # 80001a7c <_Z4putcc>
        putc('i');
    800045bc:	07700513          	li	a0,119
    800045c0:	ffffd097          	auipc	ra,0xffffd
    800045c4:	4bc080e7          	jalr	1212(ra) # 80001a7c <_Z4putcc>
        putc('t');
    800045c8:	07200513          	li	a0,114
    800045cc:	ffffd097          	auipc	ra,0xffffd
    800045d0:	4b0080e7          	jalr	1200(ra) # 80001a7c <_Z4putcc>
        putc('e');
    800045d4:	06900513          	li	a0,105
    800045d8:	ffffd097          	auipc	ra,0xffffd
    800045dc:	4a4080e7          	jalr	1188(ra) # 80001a7c <_Z4putcc>
        putc('!');
    800045e0:	07400513          	li	a0,116
    800045e4:	ffffd097          	auipc	ra,0xffffd
    800045e8:	498080e7          	jalr	1176(ra) # 80001a7c <_Z4putcc>
        putc('\n');
    800045ec:	06500513          	li	a0,101
    800045f0:	ffffd097          	auipc	ra,0xffffd
    800045f4:	48c080e7          	jalr	1164(ra) # 80001a7c <_Z4putcc>
        putc('P');
    800045f8:	02100513          	li	a0,33
    800045fc:	ffffd097          	auipc	ra,0xffffd
    80004600:	480080e7          	jalr	1152(ra) # 80001a7c <_Z4putcc>
        putc(':');
    80004604:	14102973          	csrr	s2,sepc
        putc(' ');
    80004608:	00a00513          	li	a0,10
    8000460c:	ffffd097          	auipc	ra,0xffffd
    80004610:	470080e7          	jalr	1136(ra) # 80001a7c <_Z4putcc>
        putc('0');
    80004614:	05000513          	li	a0,80
    80004618:	ffffd097          	auipc	ra,0xffffd
    8000461c:	464080e7          	jalr	1124(ra) # 80001a7c <_Z4putcc>
        putc('x');
    80004620:	04300513          	li	a0,67
    80004624:	ffffd097          	auipc	ra,0xffffd
    80004628:	458080e7          	jalr	1112(ra) # 80001a7c <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    8000462c:	03a00513          	li	a0,58
    80004630:	ffffd097          	auipc	ra,0xffffd
    80004634:	44c080e7          	jalr	1100(ra) # 80001a7c <_Z4putcc>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80004638:	02000513          	li	a0,32
    8000463c:	ffffd097          	auipc	ra,0xffffd
    80004640:	440080e7          	jalr	1088(ra) # 80001a7c <_Z4putcc>
            if(tmp < 10){
    80004644:	03000513          	li	a0,48
    80004648:	ffffd097          	auipc	ra,0xffffd
    8000464c:	434080e7          	jalr	1076(ra) # 80001a7c <_Z4putcc>
                putc('0' + tmp);
    80004650:	07800513          	li	a0,120
    80004654:	ffffd097          	auipc	ra,0xffffd
    80004658:	428080e7          	jalr	1064(ra) # 80001a7c <_Z4putcc>
            }else{
    8000465c:	00f00493          	li	s1,15
    80004660:	0140006f          	j	80004674 <exceptionHandler+0x5b8>
    }
    80004664:	03750513          	addi	a0,a0,55
    80004668:	ffffd097          	auipc	ra,0xffffd
    8000466c:	414080e7          	jalr	1044(ra) # 80001a7c <_Z4putcc>
            }else{
    80004670:	fff4849b          	addiw	s1,s1,-1
    80004674:	0204c463          	bltz	s1,8000469c <exceptionHandler+0x5e0>
                putc('A' + tmp - 10);
    80004678:	0024951b          	slliw	a0,s1,0x2
    8000467c:	00a95533          	srl	a0,s2,a0
    80004680:	00f57513          	andi	a0,a0,15
            }
    80004684:	00900793          	li	a5,9
    80004688:	fca7eee3          	bltu	a5,a0,80004664 <exceptionHandler+0x5a8>
        }        
    8000468c:	03050513          	addi	a0,a0,48
    80004690:	ffffd097          	auipc	ra,0xffffd
    80004694:	3ec080e7          	jalr	1004(ra) # 80001a7c <_Z4putcc>
    80004698:	fd9ff06f          	j	80004670 <exceptionHandler+0x5b4>
        Console::outputHandler();
    8000469c:	00007697          	auipc	a3,0x7
    800046a0:	bc468693          	addi	a3,a3,-1084 # 8000b260 <CONSOLE_STATUS+0x250>
    800046a4:	0b200613          	li	a2,178
    800046a8:	00007597          	auipc	a1,0x7
    800046ac:	bd058593          	addi	a1,a1,-1072 # 8000b278 <CONSOLE_STATUS+0x268>
    800046b0:	00007517          	auipc	a0,0x7
    800046b4:	be850513          	addi	a0,a0,-1048 # 8000b298 <CONSOLE_STATUS+0x288>
    800046b8:	ffffe097          	auipc	ra,0xffffe
    800046bc:	974080e7          	jalr	-1676(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800046c0:	b1dff06f          	j	800041dc <exceptionHandler+0x120>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    800046c4:	07400513          	li	a0,116
    800046c8:	ffffd097          	auipc	ra,0xffffd
    800046cc:	3b4080e7          	jalr	948(ra) # 80001a7c <_Z4putcc>
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800046d0:	ffffe097          	auipc	ra,0xffffe
    800046d4:	f44080e7          	jalr	-188(ra) # 80002614 <_ZN7Console13outputHandlerEv>
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800046d8:	ffffd097          	auipc	ra,0xffffd
    800046dc:	f64080e7          	jalr	-156(ra) # 8000163c <_ZN5Timer11getInstanceEv>
    800046e0:	ffffd097          	auipc	ra,0xffffd
    800046e4:	fc0080e7          	jalr	-64(ra) # 800016a0 <_ZN5Timer4tickEv>
    }else if (scause== 0x8000000000000009UL)
    800046e8:	0000a797          	auipc	a5,0xa
    800046ec:	8407b783          	ld	a5,-1984(a5) # 8000df28 <_GLOBAL_OFFSET_TABLE_+0x50>
    800046f0:	0007b503          	ld	a0,0(a5)
    800046f4:	fffff097          	auipc	ra,0xfffff
    800046f8:	d04080e7          	jalr	-764(ra) # 800033f8 <_ZN7_thread4tickEv>
    800046fc:	00051c63          	bnez	a0,80004714 <exceptionHandler+0x658>
    {   
    80004700:	14149073          	csrw	sepc,s1
        int irq = plic_claim();
    80004704:	10091073          	csrw	sstatus,s2
        if(irq == CONSOLE_IRQ)Console::inputHandler();
    80004708:	00200793          	li	a5,2
    8000470c:	1447b073          	csrc	sip,a5
    80004710:	acdff06f          	j	800041dc <exceptionHandler+0x120>
    }else if (scause== 0x8000000000000009UL)
    80004714:	00007697          	auipc	a3,0x7
    80004718:	b4c68693          	addi	a3,a3,-1204 # 8000b260 <CONSOLE_STATUS+0x250>
    8000471c:	0b800613          	li	a2,184
    80004720:	00007597          	auipc	a1,0x7
    80004724:	b5858593          	addi	a1,a1,-1192 # 8000b278 <CONSOLE_STATUS+0x268>
    80004728:	00007517          	auipc	a0,0x7
    8000472c:	b7850513          	addi	a0,a0,-1160 # 8000b2a0 <CONSOLE_STATUS+0x290>
    80004730:	ffffe097          	auipc	ra,0xffffe
    80004734:	8fc080e7          	jalr	-1796(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80004738:	fc9ff06f          	j	80004700 <exceptionHandler+0x644>
    8000473c:	ffffe097          	auipc	ra,0xffffe
    80004740:	f84080e7          	jalr	-124(ra) # 800026c0 <_ZN7Console12inputHandlerEv>
    80004744:	a11ff06f          	j	80004154 <exceptionHandler+0x98>

0000000080004748 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80004748:	fe010113          	addi	sp,sp,-32
    8000474c:	00113c23          	sd	ra,24(sp)
    80004750:	00813823          	sd	s0,16(sp)
    80004754:	00913423          	sd	s1,8(sp)
    80004758:	02010413          	addi	s0,sp,32
    8000475c:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80004760:	0000a797          	auipc	a5,0xa
    80004764:	8487b783          	ld	a5,-1976(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004768:	02079463          	bnez	a5,80004790 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    8000476c:	0000a797          	auipc	a5,0xa
    80004770:	8297be23          	sd	s1,-1988(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    head = 0;
    80004774:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80004778:	0004b423          	sd	zero,8(s1)
}
    8000477c:	01813083          	ld	ra,24(sp)
    80004780:	01013403          	ld	s0,16(sp)
    80004784:	00813483          	ld	s1,8(sp)
    80004788:	02010113          	addi	sp,sp,32
    8000478c:	00008067          	ret
    assert(singleton == 0);
    80004790:	00007697          	auipc	a3,0x7
    80004794:	c4068693          	addi	a3,a3,-960 # 8000b3d0 <CONSOLE_STATUS+0x3c0>
    80004798:	01800613          	li	a2,24
    8000479c:	00007597          	auipc	a1,0x7
    800047a0:	c4c58593          	addi	a1,a1,-948 # 8000b3e8 <CONSOLE_STATUS+0x3d8>
    800047a4:	00007517          	auipc	a0,0x7
    800047a8:	c5450513          	addi	a0,a0,-940 # 8000b3f8 <CONSOLE_STATUS+0x3e8>
    800047ac:	ffffe097          	auipc	ra,0xffffe
    800047b0:	880080e7          	jalr	-1920(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800047b4:	fb9ff06f          	j	8000476c <_ZN9SchedulerC1Ev+0x24>

00000000800047b8 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    800047b8:	ff010113          	addi	sp,sp,-16
    800047bc:	00813423          	sd	s0,8(sp)
    800047c0:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    800047c4:	00009797          	auipc	a5,0x9
    800047c8:	7e47b783          	ld	a5,2020(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    800047cc:	0007b503          	ld	a0,0(a5)
}
    800047d0:	00153513          	seqz	a0,a0
    800047d4:	00813403          	ld	s0,8(sp)
    800047d8:	01010113          	addi	sp,sp,16
    800047dc:	00008067          	ret

00000000800047e0 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    800047e0:	fe010113          	addi	sp,sp,-32
    800047e4:	00113c23          	sd	ra,24(sp)
    800047e8:	00813823          	sd	s0,16(sp)
    800047ec:	00913423          	sd	s1,8(sp)
    800047f0:	01213023          	sd	s2,0(sp)
    800047f4:	02010413          	addi	s0,sp,32
    800047f8:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    800047fc:	00009917          	auipc	s2,0x9
    80004800:	7ac93903          	ld	s2,1964(s2) # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004804:	00093783          	ld	a5,0(s2)
    80004808:	12078c63          	beqz	a5,80004940 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    8000480c:	00893903          	ld	s2,8(s2)
    80004810:	01000513          	li	a0,16
    80004814:	ffffd097          	auipc	ra,0xffffd
    80004818:	01c080e7          	jalr	28(ra) # 80001830 <_Z9mem_allocm>
    8000481c:	00a90423          	sb	a0,8(s2)
    80004820:	00855793          	srli	a5,a0,0x8
    80004824:	00f904a3          	sb	a5,9(s2)
    80004828:	01055793          	srli	a5,a0,0x10
    8000482c:	00f90523          	sb	a5,10(s2)
    80004830:	0185579b          	srliw	a5,a0,0x18
    80004834:	00f905a3          	sb	a5,11(s2)
    80004838:	02055793          	srli	a5,a0,0x20
    8000483c:	00f90623          	sb	a5,12(s2)
    80004840:	02855793          	srli	a5,a0,0x28
    80004844:	00f906a3          	sb	a5,13(s2)
    80004848:	03055793          	srli	a5,a0,0x30
    8000484c:	00f90723          	sb	a5,14(s2)
    80004850:	03855513          	srli	a0,a0,0x38
    80004854:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80004858:	00009617          	auipc	a2,0x9
    8000485c:	75060613          	addi	a2,a2,1872 # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004860:	00063583          	ld	a1,0(a2)
    80004864:	0085b703          	ld	a4,8(a1)
    80004868:	00874783          	lbu	a5,8(a4)
    8000486c:	00974683          	lbu	a3,9(a4)
    80004870:	00869693          	slli	a3,a3,0x8
    80004874:	00f6e6b3          	or	a3,a3,a5
    80004878:	00a74783          	lbu	a5,10(a4)
    8000487c:	01079793          	slli	a5,a5,0x10
    80004880:	00d7e6b3          	or	a3,a5,a3
    80004884:	00b74783          	lbu	a5,11(a4)
    80004888:	01879793          	slli	a5,a5,0x18
    8000488c:	00d7e7b3          	or	a5,a5,a3
    80004890:	00c74683          	lbu	a3,12(a4)
    80004894:	02069693          	slli	a3,a3,0x20
    80004898:	00f6e7b3          	or	a5,a3,a5
    8000489c:	00d74683          	lbu	a3,13(a4)
    800048a0:	02869693          	slli	a3,a3,0x28
    800048a4:	00f6e6b3          	or	a3,a3,a5
    800048a8:	00e74783          	lbu	a5,14(a4)
    800048ac:	03079793          	slli	a5,a5,0x30
    800048b0:	00d7e6b3          	or	a3,a5,a3
    800048b4:	00f74783          	lbu	a5,15(a4)
    800048b8:	03879793          	slli	a5,a5,0x38
    800048bc:	00d7e7b3          	or	a5,a5,a3
    800048c0:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    800048c4:	00978023          	sb	s1,0(a5)
    800048c8:	0084d713          	srli	a4,s1,0x8
    800048cc:	00e780a3          	sb	a4,1(a5)
    800048d0:	0104d713          	srli	a4,s1,0x10
    800048d4:	00e78123          	sb	a4,2(a5)
    800048d8:	0184d71b          	srliw	a4,s1,0x18
    800048dc:	00e781a3          	sb	a4,3(a5)
    800048e0:	0204d713          	srli	a4,s1,0x20
    800048e4:	00e78223          	sb	a4,4(a5)
    800048e8:	0284d713          	srli	a4,s1,0x28
    800048ec:	00e782a3          	sb	a4,5(a5)
    800048f0:	0304d713          	srli	a4,s1,0x30
    800048f4:	00e78323          	sb	a4,6(a5)
    800048f8:	0384d493          	srli	s1,s1,0x38
    800048fc:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80004900:	00063783          	ld	a5,0(a2)
    80004904:	0087b783          	ld	a5,8(a5)
    80004908:	00078423          	sb	zero,8(a5)
    8000490c:	000784a3          	sb	zero,9(a5)
    80004910:	00078523          	sb	zero,10(a5)
    80004914:	000785a3          	sb	zero,11(a5)
    80004918:	00078623          	sb	zero,12(a5)
    8000491c:	000786a3          	sb	zero,13(a5)
    80004920:	00078723          	sb	zero,14(a5)
    80004924:	000787a3          	sb	zero,15(a5)
    }
}
    80004928:	01813083          	ld	ra,24(sp)
    8000492c:	01013403          	ld	s0,16(sp)
    80004930:	00813483          	ld	s1,8(sp)
    80004934:	00013903          	ld	s2,0(sp)
    80004938:	02010113          	addi	sp,sp,32
    8000493c:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80004940:	01000513          	li	a0,16
    80004944:	ffffd097          	auipc	ra,0xffffd
    80004948:	eec080e7          	jalr	-276(ra) # 80001830 <_Z9mem_allocm>
    8000494c:	00a93423          	sd	a0,8(s2)
    80004950:	00009717          	auipc	a4,0x9
    80004954:	65870713          	addi	a4,a4,1624 # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004958:	00073783          	ld	a5,0(a4)
    8000495c:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80004960:	00073783          	ld	a5,0(a4)
    80004964:	0007b783          	ld	a5,0(a5)
    80004968:	00978023          	sb	s1,0(a5)
    8000496c:	0084d693          	srli	a3,s1,0x8
    80004970:	00d780a3          	sb	a3,1(a5)
    80004974:	0104d693          	srli	a3,s1,0x10
    80004978:	00d78123          	sb	a3,2(a5)
    8000497c:	0184d69b          	srliw	a3,s1,0x18
    80004980:	00d781a3          	sb	a3,3(a5)
    80004984:	0204d693          	srli	a3,s1,0x20
    80004988:	00d78223          	sb	a3,4(a5)
    8000498c:	0284d693          	srli	a3,s1,0x28
    80004990:	00d782a3          	sb	a3,5(a5)
    80004994:	0304d693          	srli	a3,s1,0x30
    80004998:	00d78323          	sb	a3,6(a5)
    8000499c:	0384d493          	srli	s1,s1,0x38
    800049a0:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    800049a4:	00073783          	ld	a5,0(a4)
    800049a8:	0007b783          	ld	a5,0(a5)
    800049ac:	00078423          	sb	zero,8(a5)
    800049b0:	000784a3          	sb	zero,9(a5)
    800049b4:	00078523          	sb	zero,10(a5)
    800049b8:	000785a3          	sb	zero,11(a5)
    800049bc:	00078623          	sb	zero,12(a5)
    800049c0:	000786a3          	sb	zero,13(a5)
    800049c4:	00078723          	sb	zero,14(a5)
    800049c8:	000787a3          	sb	zero,15(a5)
    800049cc:	f5dff06f          	j	80004928 <_ZN9Scheduler3putEP7_thread+0x148>

00000000800049d0 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    800049d0:	fe010113          	addi	sp,sp,-32
    800049d4:	00113c23          	sd	ra,24(sp)
    800049d8:	00813823          	sd	s0,16(sp)
    800049dc:	00913423          	sd	s1,8(sp)
    800049e0:	02010413          	addi	s0,sp,32
    ThreadList* tmp = singleton->head;
    800049e4:	00009697          	auipc	a3,0x9
    800049e8:	5c46b683          	ld	a3,1476(a3) # 8000dfa8 <_ZN9Scheduler9singletonE>
    800049ec:	0006b503          	ld	a0,0(a3)
    if(tmp == 0){
    800049f0:	0e050863          	beqz	a0,80004ae0 <_ZN9Scheduler3getEv+0x110>
        return 0;
    }
    thread_t thread = tmp->thread;
    800049f4:	00054483          	lbu	s1,0(a0)
    800049f8:	00154783          	lbu	a5,1(a0)
    800049fc:	00879793          	slli	a5,a5,0x8
    80004a00:	0097e7b3          	or	a5,a5,s1
    80004a04:	00254483          	lbu	s1,2(a0)
    80004a08:	01049493          	slli	s1,s1,0x10
    80004a0c:	00f4e7b3          	or	a5,s1,a5
    80004a10:	00354483          	lbu	s1,3(a0)
    80004a14:	01849493          	slli	s1,s1,0x18
    80004a18:	00f4e4b3          	or	s1,s1,a5
    80004a1c:	00454783          	lbu	a5,4(a0)
    80004a20:	02079793          	slli	a5,a5,0x20
    80004a24:	0097e4b3          	or	s1,a5,s1
    80004a28:	00554783          	lbu	a5,5(a0)
    80004a2c:	02879793          	slli	a5,a5,0x28
    80004a30:	0097e7b3          	or	a5,a5,s1
    80004a34:	00654483          	lbu	s1,6(a0)
    80004a38:	03049493          	slli	s1,s1,0x30
    80004a3c:	00f4e7b3          	or	a5,s1,a5
    80004a40:	00754483          	lbu	s1,7(a0)
    80004a44:	03849493          	slli	s1,s1,0x38
    80004a48:	00f4e4b3          	or	s1,s1,a5
    singleton->head = tmp->next;
    80004a4c:	00854783          	lbu	a5,8(a0)
    80004a50:	00954703          	lbu	a4,9(a0)
    80004a54:	00871713          	slli	a4,a4,0x8
    80004a58:	00f76733          	or	a4,a4,a5
    80004a5c:	00a54783          	lbu	a5,10(a0)
    80004a60:	01079793          	slli	a5,a5,0x10
    80004a64:	00e7e733          	or	a4,a5,a4
    80004a68:	00b54783          	lbu	a5,11(a0)
    80004a6c:	01879793          	slli	a5,a5,0x18
    80004a70:	00e7e7b3          	or	a5,a5,a4
    80004a74:	00c54703          	lbu	a4,12(a0)
    80004a78:	02071713          	slli	a4,a4,0x20
    80004a7c:	00f767b3          	or	a5,a4,a5
    80004a80:	00d54703          	lbu	a4,13(a0)
    80004a84:	02871713          	slli	a4,a4,0x28
    80004a88:	00f76733          	or	a4,a4,a5
    80004a8c:	00e54783          	lbu	a5,14(a0)
    80004a90:	03079793          	slli	a5,a5,0x30
    80004a94:	00e7e733          	or	a4,a5,a4
    80004a98:	00f54783          	lbu	a5,15(a0)
    80004a9c:	03879793          	slli	a5,a5,0x38
    80004aa0:	00e7e7b3          	or	a5,a5,a4
    80004aa4:	00f6b023          	sd	a5,0(a3)
    if(singleton->head == 0){
    80004aa8:	00009797          	auipc	a5,0x9
    80004aac:	5007b783          	ld	a5,1280(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004ab0:	0007b703          	ld	a4,0(a5)
    80004ab4:	02070263          	beqz	a4,80004ad8 <_ZN9Scheduler3getEv+0x108>
        singleton->tail = 0;
    }
    mem_free(tmp);
    80004ab8:	ffffd097          	auipc	ra,0xffffd
    80004abc:	da8080e7          	jalr	-600(ra) # 80001860 <_Z8mem_freePv>
    return thread;
}
    80004ac0:	00048513          	mv	a0,s1
    80004ac4:	01813083          	ld	ra,24(sp)
    80004ac8:	01013403          	ld	s0,16(sp)
    80004acc:	00813483          	ld	s1,8(sp)
    80004ad0:	02010113          	addi	sp,sp,32
    80004ad4:	00008067          	ret
        singleton->tail = 0;
    80004ad8:	0007b423          	sd	zero,8(a5)
    80004adc:	fddff06f          	j	80004ab8 <_ZN9Scheduler3getEv+0xe8>
        return 0;
    80004ae0:	00050493          	mv	s1,a0
    80004ae4:	fddff06f          	j	80004ac0 <_ZN9Scheduler3getEv+0xf0>

0000000080004ae8 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80004ae8:	ff010113          	addi	sp,sp,-16
    80004aec:	00813423          	sd	s0,8(sp)
    80004af0:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80004af4:	00009797          	auipc	a5,0x9
    80004af8:	4b47b783          	ld	a5,1204(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004afc:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80004b00:	00000513          	li	a0,0
    while(tmp != 0){
    80004b04:	06078263          	beqz	a5,80004b68 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80004b08:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80004b0c:	0087c683          	lbu	a3,8(a5)
    80004b10:	0097c703          	lbu	a4,9(a5)
    80004b14:	00871713          	slli	a4,a4,0x8
    80004b18:	00d766b3          	or	a3,a4,a3
    80004b1c:	00a7c703          	lbu	a4,10(a5)
    80004b20:	01071713          	slli	a4,a4,0x10
    80004b24:	00d76733          	or	a4,a4,a3
    80004b28:	00b7c683          	lbu	a3,11(a5)
    80004b2c:	01869693          	slli	a3,a3,0x18
    80004b30:	00e6e733          	or	a4,a3,a4
    80004b34:	00c7c683          	lbu	a3,12(a5)
    80004b38:	02069693          	slli	a3,a3,0x20
    80004b3c:	00e6e6b3          	or	a3,a3,a4
    80004b40:	00d7c703          	lbu	a4,13(a5)
    80004b44:	02871713          	slli	a4,a4,0x28
    80004b48:	00d766b3          	or	a3,a4,a3
    80004b4c:	00e7c703          	lbu	a4,14(a5)
    80004b50:	03071713          	slli	a4,a4,0x30
    80004b54:	00d76733          	or	a4,a4,a3
    80004b58:	00f7c783          	lbu	a5,15(a5)
    80004b5c:	03879793          	slli	a5,a5,0x38
    80004b60:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80004b64:	fa1ff06f          	j	80004b04 <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80004b68:	00813403          	ld	s0,8(sp)
    80004b6c:	01010113          	addi	sp,sp,16
    80004b70:	00008067          	ret

0000000080004b74 <_ZN6BufferC1Ei>:
#include "../test_h/buffer.h"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004b74:	fe010113          	addi	sp,sp,-32
    80004b78:	00113c23          	sd	ra,24(sp)
    80004b7c:	00813823          	sd	s0,16(sp)
    80004b80:	00913423          	sd	s1,8(sp)
    80004b84:	01213023          	sd	s2,0(sp)
    80004b88:	02010413          	addi	s0,sp,32
    80004b8c:	00050493          	mv	s1,a0
    80004b90:	00058913          	mv	s2,a1
    80004b94:	0015879b          	addiw	a5,a1,1
    80004b98:	0007851b          	sext.w	a0,a5
    80004b9c:	00f4a023          	sw	a5,0(s1)
    80004ba0:	0004a823          	sw	zero,16(s1)
    80004ba4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004ba8:	00251513          	slli	a0,a0,0x2
    80004bac:	ffffd097          	auipc	ra,0xffffd
    80004bb0:	c84080e7          	jalr	-892(ra) # 80001830 <_Z9mem_allocm>
    80004bb4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80004bb8:	00000593          	li	a1,0
    80004bbc:	02048513          	addi	a0,s1,32
    80004bc0:	ffffd097          	auipc	ra,0xffffd
    80004bc4:	dd8080e7          	jalr	-552(ra) # 80001998 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80004bc8:	00090593          	mv	a1,s2
    80004bcc:	01848513          	addi	a0,s1,24
    80004bd0:	ffffd097          	auipc	ra,0xffffd
    80004bd4:	dc8080e7          	jalr	-568(ra) # 80001998 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80004bd8:	00100593          	li	a1,1
    80004bdc:	02848513          	addi	a0,s1,40
    80004be0:	ffffd097          	auipc	ra,0xffffd
    80004be4:	db8080e7          	jalr	-584(ra) # 80001998 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80004be8:	00100593          	li	a1,1
    80004bec:	03048513          	addi	a0,s1,48
    80004bf0:	ffffd097          	auipc	ra,0xffffd
    80004bf4:	da8080e7          	jalr	-600(ra) # 80001998 <_Z8sem_openPP4_semj>
}
    80004bf8:	01813083          	ld	ra,24(sp)
    80004bfc:	01013403          	ld	s0,16(sp)
    80004c00:	00813483          	ld	s1,8(sp)
    80004c04:	00013903          	ld	s2,0(sp)
    80004c08:	02010113          	addi	sp,sp,32
    80004c0c:	00008067          	ret

0000000080004c10 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80004c10:	fe010113          	addi	sp,sp,-32
    80004c14:	00113c23          	sd	ra,24(sp)
    80004c18:	00813823          	sd	s0,16(sp)
    80004c1c:	00913423          	sd	s1,8(sp)
    80004c20:	01213023          	sd	s2,0(sp)
    80004c24:	02010413          	addi	s0,sp,32
    80004c28:	00050493          	mv	s1,a0
    80004c2c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80004c30:	01853503          	ld	a0,24(a0)
    80004c34:	ffffd097          	auipc	ra,0xffffd
    80004c38:	dc8080e7          	jalr	-568(ra) # 800019fc <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80004c3c:	0304b503          	ld	a0,48(s1)
    80004c40:	ffffd097          	auipc	ra,0xffffd
    80004c44:	dbc080e7          	jalr	-580(ra) # 800019fc <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80004c48:	0084b783          	ld	a5,8(s1)
    80004c4c:	0144a703          	lw	a4,20(s1)
    80004c50:	00271713          	slli	a4,a4,0x2
    80004c54:	00e787b3          	add	a5,a5,a4
    80004c58:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004c5c:	0144a783          	lw	a5,20(s1)
    80004c60:	0017879b          	addiw	a5,a5,1
    80004c64:	0004a703          	lw	a4,0(s1)
    80004c68:	02e7e7bb          	remw	a5,a5,a4
    80004c6c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80004c70:	0304b503          	ld	a0,48(s1)
    80004c74:	ffffd097          	auipc	ra,0xffffd
    80004c78:	db4080e7          	jalr	-588(ra) # 80001a28 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80004c7c:	0204b503          	ld	a0,32(s1)
    80004c80:	ffffd097          	auipc	ra,0xffffd
    80004c84:	da8080e7          	jalr	-600(ra) # 80001a28 <_Z10sem_signalP4_sem>

}
    80004c88:	01813083          	ld	ra,24(sp)
    80004c8c:	01013403          	ld	s0,16(sp)
    80004c90:	00813483          	ld	s1,8(sp)
    80004c94:	00013903          	ld	s2,0(sp)
    80004c98:	02010113          	addi	sp,sp,32
    80004c9c:	00008067          	ret

0000000080004ca0 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80004ca0:	fe010113          	addi	sp,sp,-32
    80004ca4:	00113c23          	sd	ra,24(sp)
    80004ca8:	00813823          	sd	s0,16(sp)
    80004cac:	00913423          	sd	s1,8(sp)
    80004cb0:	01213023          	sd	s2,0(sp)
    80004cb4:	02010413          	addi	s0,sp,32
    80004cb8:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80004cbc:	02053503          	ld	a0,32(a0)
    80004cc0:	ffffd097          	auipc	ra,0xffffd
    80004cc4:	d3c080e7          	jalr	-708(ra) # 800019fc <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80004cc8:	0284b503          	ld	a0,40(s1)
    80004ccc:	ffffd097          	auipc	ra,0xffffd
    80004cd0:	d30080e7          	jalr	-720(ra) # 800019fc <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80004cd4:	0084b703          	ld	a4,8(s1)
    80004cd8:	0104a783          	lw	a5,16(s1)
    80004cdc:	00279693          	slli	a3,a5,0x2
    80004ce0:	00d70733          	add	a4,a4,a3
    80004ce4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004ce8:	0017879b          	addiw	a5,a5,1
    80004cec:	0004a703          	lw	a4,0(s1)
    80004cf0:	02e7e7bb          	remw	a5,a5,a4
    80004cf4:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80004cf8:	0284b503          	ld	a0,40(s1)
    80004cfc:	ffffd097          	auipc	ra,0xffffd
    80004d00:	d2c080e7          	jalr	-724(ra) # 80001a28 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80004d04:	0184b503          	ld	a0,24(s1)
    80004d08:	ffffd097          	auipc	ra,0xffffd
    80004d0c:	d20080e7          	jalr	-736(ra) # 80001a28 <_Z10sem_signalP4_sem>

    return ret;
}
    80004d10:	00090513          	mv	a0,s2
    80004d14:	01813083          	ld	ra,24(sp)
    80004d18:	01013403          	ld	s0,16(sp)
    80004d1c:	00813483          	ld	s1,8(sp)
    80004d20:	00013903          	ld	s2,0(sp)
    80004d24:	02010113          	addi	sp,sp,32
    80004d28:	00008067          	ret

0000000080004d2c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80004d2c:	fe010113          	addi	sp,sp,-32
    80004d30:	00113c23          	sd	ra,24(sp)
    80004d34:	00813823          	sd	s0,16(sp)
    80004d38:	00913423          	sd	s1,8(sp)
    80004d3c:	01213023          	sd	s2,0(sp)
    80004d40:	02010413          	addi	s0,sp,32
    80004d44:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80004d48:	02853503          	ld	a0,40(a0)
    80004d4c:	ffffd097          	auipc	ra,0xffffd
    80004d50:	cb0080e7          	jalr	-848(ra) # 800019fc <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80004d54:	0304b503          	ld	a0,48(s1)
    80004d58:	ffffd097          	auipc	ra,0xffffd
    80004d5c:	ca4080e7          	jalr	-860(ra) # 800019fc <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80004d60:	0144a783          	lw	a5,20(s1)
    80004d64:	0104a903          	lw	s2,16(s1)
    80004d68:	0327ce63          	blt	a5,s2,80004da4 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80004d6c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80004d70:	0304b503          	ld	a0,48(s1)
    80004d74:	ffffd097          	auipc	ra,0xffffd
    80004d78:	cb4080e7          	jalr	-844(ra) # 80001a28 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80004d7c:	0284b503          	ld	a0,40(s1)
    80004d80:	ffffd097          	auipc	ra,0xffffd
    80004d84:	ca8080e7          	jalr	-856(ra) # 80001a28 <_Z10sem_signalP4_sem>

    return ret;
}
    80004d88:	00090513          	mv	a0,s2
    80004d8c:	01813083          	ld	ra,24(sp)
    80004d90:	01013403          	ld	s0,16(sp)
    80004d94:	00813483          	ld	s1,8(sp)
    80004d98:	00013903          	ld	s2,0(sp)
    80004d9c:	02010113          	addi	sp,sp,32
    80004da0:	00008067          	ret
        ret = cap - head + tail;
    80004da4:	0004a703          	lw	a4,0(s1)
    80004da8:	4127093b          	subw	s2,a4,s2
    80004dac:	00f9093b          	addw	s2,s2,a5
    80004db0:	fc1ff06f          	j	80004d70 <_ZN6Buffer6getCntEv+0x44>

0000000080004db4 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80004db4:	fe010113          	addi	sp,sp,-32
    80004db8:	00113c23          	sd	ra,24(sp)
    80004dbc:	00813823          	sd	s0,16(sp)
    80004dc0:	00913423          	sd	s1,8(sp)
    80004dc4:	02010413          	addi	s0,sp,32
    80004dc8:	00050493          	mv	s1,a0
    putc('\n');
    80004dcc:	00a00513          	li	a0,10
    80004dd0:	ffffd097          	auipc	ra,0xffffd
    80004dd4:	cac080e7          	jalr	-852(ra) # 80001a7c <_Z4putcc>
    printString("Buffer deleted!\n");
    80004dd8:	00006517          	auipc	a0,0x6
    80004ddc:	63050513          	addi	a0,a0,1584 # 8000b408 <CONSOLE_STATUS+0x3f8>
    80004de0:	00003097          	auipc	ra,0x3
    80004de4:	95c080e7          	jalr	-1700(ra) # 8000773c <_Z11printStringPKc>
    while (getCnt() > 0) {
    80004de8:	00048513          	mv	a0,s1
    80004dec:	00000097          	auipc	ra,0x0
    80004df0:	f40080e7          	jalr	-192(ra) # 80004d2c <_ZN6Buffer6getCntEv>
    80004df4:	02a05c63          	blez	a0,80004e2c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80004df8:	0084b783          	ld	a5,8(s1)
    80004dfc:	0104a703          	lw	a4,16(s1)
    80004e00:	00271713          	slli	a4,a4,0x2
    80004e04:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80004e08:	0007c503          	lbu	a0,0(a5)
    80004e0c:	ffffd097          	auipc	ra,0xffffd
    80004e10:	c70080e7          	jalr	-912(ra) # 80001a7c <_Z4putcc>
        head = (head + 1) % cap;
    80004e14:	0104a783          	lw	a5,16(s1)
    80004e18:	0017879b          	addiw	a5,a5,1
    80004e1c:	0004a703          	lw	a4,0(s1)
    80004e20:	02e7e7bb          	remw	a5,a5,a4
    80004e24:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80004e28:	fc1ff06f          	j	80004de8 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80004e2c:	02100513          	li	a0,33
    80004e30:	ffffd097          	auipc	ra,0xffffd
    80004e34:	c4c080e7          	jalr	-948(ra) # 80001a7c <_Z4putcc>
    putc('\n');
    80004e38:	00a00513          	li	a0,10
    80004e3c:	ffffd097          	auipc	ra,0xffffd
    80004e40:	c40080e7          	jalr	-960(ra) # 80001a7c <_Z4putcc>
    mem_free(buffer);
    80004e44:	0084b503          	ld	a0,8(s1)
    80004e48:	ffffd097          	auipc	ra,0xffffd
    80004e4c:	a18080e7          	jalr	-1512(ra) # 80001860 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80004e50:	0204b503          	ld	a0,32(s1)
    80004e54:	ffffd097          	auipc	ra,0xffffd
    80004e58:	b7c080e7          	jalr	-1156(ra) # 800019d0 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80004e5c:	0184b503          	ld	a0,24(s1)
    80004e60:	ffffd097          	auipc	ra,0xffffd
    80004e64:	b70080e7          	jalr	-1168(ra) # 800019d0 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80004e68:	0304b503          	ld	a0,48(s1)
    80004e6c:	ffffd097          	auipc	ra,0xffffd
    80004e70:	b64080e7          	jalr	-1180(ra) # 800019d0 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80004e74:	0284b503          	ld	a0,40(s1)
    80004e78:	ffffd097          	auipc	ra,0xffffd
    80004e7c:	b58080e7          	jalr	-1192(ra) # 800019d0 <_Z9sem_closeP4_sem>
}
    80004e80:	01813083          	ld	ra,24(sp)
    80004e84:	01013403          	ld	s0,16(sp)
    80004e88:	00813483          	ld	s1,8(sp)
    80004e8c:	02010113          	addi	sp,sp,32
    80004e90:	00008067          	ret

0000000080004e94 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80004e94:	fe010113          	addi	sp,sp,-32
    80004e98:	00113c23          	sd	ra,24(sp)
    80004e9c:	00813823          	sd	s0,16(sp)
    80004ea0:	00913423          	sd	s1,8(sp)
    80004ea4:	01213023          	sd	s2,0(sp)
    80004ea8:	02010413          	addi	s0,sp,32
    80004eac:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004eb0:	00000913          	li	s2,0
    80004eb4:	00c0006f          	j	80004ec0 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80004eb8:	ffffd097          	auipc	ra,0xffffd
    80004ebc:	a70080e7          	jalr	-1424(ra) # 80001928 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80004ec0:	ffffd097          	auipc	ra,0xffffd
    80004ec4:	b94080e7          	jalr	-1132(ra) # 80001a54 <_Z4getcv>
    80004ec8:	0005059b          	sext.w	a1,a0
    80004ecc:	01b00793          	li	a5,27
    80004ed0:	02f58a63          	beq	a1,a5,80004f04 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80004ed4:	0084b503          	ld	a0,8(s1)
    80004ed8:	00000097          	auipc	ra,0x0
    80004edc:	d38080e7          	jalr	-712(ra) # 80004c10 <_ZN6Buffer3putEi>
        i++;
    80004ee0:	0019071b          	addiw	a4,s2,1
    80004ee4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004ee8:	0004a683          	lw	a3,0(s1)
    80004eec:	0026979b          	slliw	a5,a3,0x2
    80004ef0:	00d787bb          	addw	a5,a5,a3
    80004ef4:	0017979b          	slliw	a5,a5,0x1
    80004ef8:	02f767bb          	remw	a5,a4,a5
    80004efc:	fc0792e3          	bnez	a5,80004ec0 <_ZL16producerKeyboardPv+0x2c>
    80004f00:	fb9ff06f          	j	80004eb8 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80004f04:	00100793          	li	a5,1
    80004f08:	00009717          	auipc	a4,0x9
    80004f0c:	0af72423          	sw	a5,168(a4) # 8000dfb0 <_ZL9threadEnd>
    data->buffer->put('!');
    80004f10:	02100593          	li	a1,33
    80004f14:	0084b503          	ld	a0,8(s1)
    80004f18:	00000097          	auipc	ra,0x0
    80004f1c:	cf8080e7          	jalr	-776(ra) # 80004c10 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80004f20:	0104b503          	ld	a0,16(s1)
    80004f24:	ffffd097          	auipc	ra,0xffffd
    80004f28:	b04080e7          	jalr	-1276(ra) # 80001a28 <_Z10sem_signalP4_sem>
}
    80004f2c:	01813083          	ld	ra,24(sp)
    80004f30:	01013403          	ld	s0,16(sp)
    80004f34:	00813483          	ld	s1,8(sp)
    80004f38:	00013903          	ld	s2,0(sp)
    80004f3c:	02010113          	addi	sp,sp,32
    80004f40:	00008067          	ret

0000000080004f44 <_ZL8producerPv>:

static void producer(void *arg) {
    80004f44:	fe010113          	addi	sp,sp,-32
    80004f48:	00113c23          	sd	ra,24(sp)
    80004f4c:	00813823          	sd	s0,16(sp)
    80004f50:	00913423          	sd	s1,8(sp)
    80004f54:	01213023          	sd	s2,0(sp)
    80004f58:	02010413          	addi	s0,sp,32
    80004f5c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004f60:	00000913          	li	s2,0
    80004f64:	00c0006f          	j	80004f70 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80004f68:	ffffd097          	auipc	ra,0xffffd
    80004f6c:	9c0080e7          	jalr	-1600(ra) # 80001928 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80004f70:	00009797          	auipc	a5,0x9
    80004f74:	0407a783          	lw	a5,64(a5) # 8000dfb0 <_ZL9threadEnd>
    80004f78:	02079e63          	bnez	a5,80004fb4 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80004f7c:	0004a583          	lw	a1,0(s1)
    80004f80:	0305859b          	addiw	a1,a1,48
    80004f84:	0084b503          	ld	a0,8(s1)
    80004f88:	00000097          	auipc	ra,0x0
    80004f8c:	c88080e7          	jalr	-888(ra) # 80004c10 <_ZN6Buffer3putEi>
        i++;
    80004f90:	0019071b          	addiw	a4,s2,1
    80004f94:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004f98:	0004a683          	lw	a3,0(s1)
    80004f9c:	0026979b          	slliw	a5,a3,0x2
    80004fa0:	00d787bb          	addw	a5,a5,a3
    80004fa4:	0017979b          	slliw	a5,a5,0x1
    80004fa8:	02f767bb          	remw	a5,a4,a5
    80004fac:	fc0792e3          	bnez	a5,80004f70 <_ZL8producerPv+0x2c>
    80004fb0:	fb9ff06f          	j	80004f68 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80004fb4:	0104b503          	ld	a0,16(s1)
    80004fb8:	ffffd097          	auipc	ra,0xffffd
    80004fbc:	a70080e7          	jalr	-1424(ra) # 80001a28 <_Z10sem_signalP4_sem>
}
    80004fc0:	01813083          	ld	ra,24(sp)
    80004fc4:	01013403          	ld	s0,16(sp)
    80004fc8:	00813483          	ld	s1,8(sp)
    80004fcc:	00013903          	ld	s2,0(sp)
    80004fd0:	02010113          	addi	sp,sp,32
    80004fd4:	00008067          	ret

0000000080004fd8 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80004fd8:	fd010113          	addi	sp,sp,-48
    80004fdc:	02113423          	sd	ra,40(sp)
    80004fe0:	02813023          	sd	s0,32(sp)
    80004fe4:	00913c23          	sd	s1,24(sp)
    80004fe8:	01213823          	sd	s2,16(sp)
    80004fec:	01313423          	sd	s3,8(sp)
    80004ff0:	03010413          	addi	s0,sp,48
    80004ff4:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004ff8:	00000993          	li	s3,0
    80004ffc:	01c0006f          	j	80005018 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80005000:	ffffd097          	auipc	ra,0xffffd
    80005004:	928080e7          	jalr	-1752(ra) # 80001928 <_Z15thread_dispatchv>
    80005008:	0500006f          	j	80005058 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    8000500c:	00a00513          	li	a0,10
    80005010:	ffffd097          	auipc	ra,0xffffd
    80005014:	a6c080e7          	jalr	-1428(ra) # 80001a7c <_Z4putcc>
    while (!threadEnd) {
    80005018:	00009797          	auipc	a5,0x9
    8000501c:	f987a783          	lw	a5,-104(a5) # 8000dfb0 <_ZL9threadEnd>
    80005020:	06079063          	bnez	a5,80005080 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80005024:	00893503          	ld	a0,8(s2)
    80005028:	00000097          	auipc	ra,0x0
    8000502c:	c78080e7          	jalr	-904(ra) # 80004ca0 <_ZN6Buffer3getEv>
        i++;
    80005030:	0019849b          	addiw	s1,s3,1
    80005034:	0004899b          	sext.w	s3,s1
        putc(key);
    80005038:	0ff57513          	andi	a0,a0,255
    8000503c:	ffffd097          	auipc	ra,0xffffd
    80005040:	a40080e7          	jalr	-1472(ra) # 80001a7c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005044:	00092703          	lw	a4,0(s2)
    80005048:	0027179b          	slliw	a5,a4,0x2
    8000504c:	00e787bb          	addw	a5,a5,a4
    80005050:	02f4e7bb          	remw	a5,s1,a5
    80005054:	fa0786e3          	beqz	a5,80005000 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80005058:	05000793          	li	a5,80
    8000505c:	02f4e4bb          	remw	s1,s1,a5
    80005060:	fa049ce3          	bnez	s1,80005018 <_ZL8consumerPv+0x40>
    80005064:	fa9ff06f          	j	8000500c <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80005068:	00893503          	ld	a0,8(s2)
    8000506c:	00000097          	auipc	ra,0x0
    80005070:	c34080e7          	jalr	-972(ra) # 80004ca0 <_ZN6Buffer3getEv>
        putc(key);
    80005074:	0ff57513          	andi	a0,a0,255
    80005078:	ffffd097          	auipc	ra,0xffffd
    8000507c:	a04080e7          	jalr	-1532(ra) # 80001a7c <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80005080:	00893503          	ld	a0,8(s2)
    80005084:	00000097          	auipc	ra,0x0
    80005088:	ca8080e7          	jalr	-856(ra) # 80004d2c <_ZN6Buffer6getCntEv>
    8000508c:	fca04ee3          	bgtz	a0,80005068 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80005090:	01093503          	ld	a0,16(s2)
    80005094:	ffffd097          	auipc	ra,0xffffd
    80005098:	994080e7          	jalr	-1644(ra) # 80001a28 <_Z10sem_signalP4_sem>
}
    8000509c:	02813083          	ld	ra,40(sp)
    800050a0:	02013403          	ld	s0,32(sp)
    800050a4:	01813483          	ld	s1,24(sp)
    800050a8:	01013903          	ld	s2,16(sp)
    800050ac:	00813983          	ld	s3,8(sp)
    800050b0:	03010113          	addi	sp,sp,48
    800050b4:	00008067          	ret

00000000800050b8 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800050b8:	f9010113          	addi	sp,sp,-112
    800050bc:	06113423          	sd	ra,104(sp)
    800050c0:	06813023          	sd	s0,96(sp)
    800050c4:	04913c23          	sd	s1,88(sp)
    800050c8:	05213823          	sd	s2,80(sp)
    800050cc:	05313423          	sd	s3,72(sp)
    800050d0:	05413023          	sd	s4,64(sp)
    800050d4:	03513c23          	sd	s5,56(sp)
    800050d8:	03613823          	sd	s6,48(sp)
    800050dc:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800050e0:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800050e4:	00006517          	auipc	a0,0x6
    800050e8:	33c50513          	addi	a0,a0,828 # 8000b420 <CONSOLE_STATUS+0x410>
    800050ec:	00002097          	auipc	ra,0x2
    800050f0:	650080e7          	jalr	1616(ra) # 8000773c <_Z11printStringPKc>
    getString(input, 30);
    800050f4:	01e00593          	li	a1,30
    800050f8:	fa040493          	addi	s1,s0,-96
    800050fc:	00048513          	mv	a0,s1
    80005100:	00002097          	auipc	ra,0x2
    80005104:	6c4080e7          	jalr	1732(ra) # 800077c4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005108:	00048513          	mv	a0,s1
    8000510c:	00002097          	auipc	ra,0x2
    80005110:	790080e7          	jalr	1936(ra) # 8000789c <_Z11stringToIntPKc>
    80005114:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005118:	00006517          	auipc	a0,0x6
    8000511c:	32850513          	addi	a0,a0,808 # 8000b440 <CONSOLE_STATUS+0x430>
    80005120:	00002097          	auipc	ra,0x2
    80005124:	61c080e7          	jalr	1564(ra) # 8000773c <_Z11printStringPKc>
    getString(input, 30);
    80005128:	01e00593          	li	a1,30
    8000512c:	00048513          	mv	a0,s1
    80005130:	00002097          	auipc	ra,0x2
    80005134:	694080e7          	jalr	1684(ra) # 800077c4 <_Z9getStringPci>
    n = stringToInt(input);
    80005138:	00048513          	mv	a0,s1
    8000513c:	00002097          	auipc	ra,0x2
    80005140:	760080e7          	jalr	1888(ra) # 8000789c <_Z11stringToIntPKc>
    80005144:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005148:	00006517          	auipc	a0,0x6
    8000514c:	31850513          	addi	a0,a0,792 # 8000b460 <CONSOLE_STATUS+0x450>
    80005150:	00002097          	auipc	ra,0x2
    80005154:	5ec080e7          	jalr	1516(ra) # 8000773c <_Z11printStringPKc>
    80005158:	00000613          	li	a2,0
    8000515c:	00a00593          	li	a1,10
    80005160:	00090513          	mv	a0,s2
    80005164:	00002097          	auipc	ra,0x2
    80005168:	788080e7          	jalr	1928(ra) # 800078ec <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    8000516c:	00006517          	auipc	a0,0x6
    80005170:	30c50513          	addi	a0,a0,780 # 8000b478 <CONSOLE_STATUS+0x468>
    80005174:	00002097          	auipc	ra,0x2
    80005178:	5c8080e7          	jalr	1480(ra) # 8000773c <_Z11printStringPKc>
    8000517c:	00000613          	li	a2,0
    80005180:	00a00593          	li	a1,10
    80005184:	00048513          	mv	a0,s1
    80005188:	00002097          	auipc	ra,0x2
    8000518c:	764080e7          	jalr	1892(ra) # 800078ec <_Z8printIntiii>
    printString(".\n");
    80005190:	00006517          	auipc	a0,0x6
    80005194:	30050513          	addi	a0,a0,768 # 8000b490 <CONSOLE_STATUS+0x480>
    80005198:	00002097          	auipc	ra,0x2
    8000519c:	5a4080e7          	jalr	1444(ra) # 8000773c <_Z11printStringPKc>
    if(threadNum > n) {
    800051a0:	0324c463          	blt	s1,s2,800051c8 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    800051a4:	03205c63          	blez	s2,800051dc <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    800051a8:	03800513          	li	a0,56
    800051ac:	ffffc097          	auipc	ra,0xffffc
    800051b0:	010080e7          	jalr	16(ra) # 800011bc <_Znwm>
    800051b4:	00050a13          	mv	s4,a0
    800051b8:	00048593          	mv	a1,s1
    800051bc:	00000097          	auipc	ra,0x0
    800051c0:	9b8080e7          	jalr	-1608(ra) # 80004b74 <_ZN6BufferC1Ei>
    800051c4:	0300006f          	j	800051f4 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800051c8:	00006517          	auipc	a0,0x6
    800051cc:	2d050513          	addi	a0,a0,720 # 8000b498 <CONSOLE_STATUS+0x488>
    800051d0:	00002097          	auipc	ra,0x2
    800051d4:	56c080e7          	jalr	1388(ra) # 8000773c <_Z11printStringPKc>
        return;
    800051d8:	0140006f          	j	800051ec <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800051dc:	00006517          	auipc	a0,0x6
    800051e0:	2fc50513          	addi	a0,a0,764 # 8000b4d8 <CONSOLE_STATUS+0x4c8>
    800051e4:	00002097          	auipc	ra,0x2
    800051e8:	558080e7          	jalr	1368(ra) # 8000773c <_Z11printStringPKc>
        return;
    800051ec:	000b0113          	mv	sp,s6
    800051f0:	1500006f          	j	80005340 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800051f4:	00000593          	li	a1,0
    800051f8:	00009517          	auipc	a0,0x9
    800051fc:	dc050513          	addi	a0,a0,-576 # 8000dfb8 <_ZL10waitForAll>
    80005200:	ffffc097          	auipc	ra,0xffffc
    80005204:	798080e7          	jalr	1944(ra) # 80001998 <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    80005208:	00391793          	slli	a5,s2,0x3
    8000520c:	00f78793          	addi	a5,a5,15
    80005210:	ff07f793          	andi	a5,a5,-16
    80005214:	40f10133          	sub	sp,sp,a5
    80005218:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    8000521c:	0019071b          	addiw	a4,s2,1
    80005220:	00171793          	slli	a5,a4,0x1
    80005224:	00e787b3          	add	a5,a5,a4
    80005228:	00379793          	slli	a5,a5,0x3
    8000522c:	00f78793          	addi	a5,a5,15
    80005230:	ff07f793          	andi	a5,a5,-16
    80005234:	40f10133          	sub	sp,sp,a5
    80005238:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    8000523c:	00191613          	slli	a2,s2,0x1
    80005240:	012607b3          	add	a5,a2,s2
    80005244:	00379793          	slli	a5,a5,0x3
    80005248:	00f987b3          	add	a5,s3,a5
    8000524c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005250:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80005254:	00009717          	auipc	a4,0x9
    80005258:	d6473703          	ld	a4,-668(a4) # 8000dfb8 <_ZL10waitForAll>
    8000525c:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80005260:	00078613          	mv	a2,a5
    80005264:	00000597          	auipc	a1,0x0
    80005268:	d7458593          	addi	a1,a1,-652 # 80004fd8 <_ZL8consumerPv>
    8000526c:	f9840513          	addi	a0,s0,-104
    80005270:	ffffc097          	auipc	ra,0xffffc
    80005274:	61c080e7          	jalr	1564(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80005278:	00000493          	li	s1,0
    8000527c:	0280006f          	j	800052a4 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80005280:	00000597          	auipc	a1,0x0
    80005284:	c1458593          	addi	a1,a1,-1004 # 80004e94 <_ZL16producerKeyboardPv>
                      data + i);
    80005288:	00179613          	slli	a2,a5,0x1
    8000528c:	00f60633          	add	a2,a2,a5
    80005290:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80005294:	00c98633          	add	a2,s3,a2
    80005298:	ffffc097          	auipc	ra,0xffffc
    8000529c:	5f4080e7          	jalr	1524(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800052a0:	0014849b          	addiw	s1,s1,1
    800052a4:	0524d263          	bge	s1,s2,800052e8 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800052a8:	00149793          	slli	a5,s1,0x1
    800052ac:	009787b3          	add	a5,a5,s1
    800052b0:	00379793          	slli	a5,a5,0x3
    800052b4:	00f987b3          	add	a5,s3,a5
    800052b8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800052bc:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    800052c0:	00009717          	auipc	a4,0x9
    800052c4:	cf873703          	ld	a4,-776(a4) # 8000dfb8 <_ZL10waitForAll>
    800052c8:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    800052cc:	00048793          	mv	a5,s1
    800052d0:	00349513          	slli	a0,s1,0x3
    800052d4:	00aa8533          	add	a0,s5,a0
    800052d8:	fa9054e3          	blez	s1,80005280 <_Z22producerConsumer_C_APIv+0x1c8>
    800052dc:	00000597          	auipc	a1,0x0
    800052e0:	c6858593          	addi	a1,a1,-920 # 80004f44 <_ZL8producerPv>
    800052e4:	fa5ff06f          	j	80005288 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800052e8:	ffffc097          	auipc	ra,0xffffc
    800052ec:	640080e7          	jalr	1600(ra) # 80001928 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800052f0:	00000493          	li	s1,0
    800052f4:	00994e63          	blt	s2,s1,80005310 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800052f8:	00009517          	auipc	a0,0x9
    800052fc:	cc053503          	ld	a0,-832(a0) # 8000dfb8 <_ZL10waitForAll>
    80005300:	ffffc097          	auipc	ra,0xffffc
    80005304:	6fc080e7          	jalr	1788(ra) # 800019fc <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80005308:	0014849b          	addiw	s1,s1,1
    8000530c:	fe9ff06f          	j	800052f4 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80005310:	00009517          	auipc	a0,0x9
    80005314:	ca853503          	ld	a0,-856(a0) # 8000dfb8 <_ZL10waitForAll>
    80005318:	ffffc097          	auipc	ra,0xffffc
    8000531c:	6b8080e7          	jalr	1720(ra) # 800019d0 <_Z9sem_closeP4_sem>
    delete buffer;
    80005320:	000a0e63          	beqz	s4,8000533c <_Z22producerConsumer_C_APIv+0x284>
    80005324:	000a0513          	mv	a0,s4
    80005328:	00000097          	auipc	ra,0x0
    8000532c:	a8c080e7          	jalr	-1396(ra) # 80004db4 <_ZN6BufferD1Ev>
    80005330:	000a0513          	mv	a0,s4
    80005334:	ffffc097          	auipc	ra,0xffffc
    80005338:	eb0080e7          	jalr	-336(ra) # 800011e4 <_ZdlPv>
    8000533c:	000b0113          	mv	sp,s6
}
    80005340:	f9040113          	addi	sp,s0,-112
    80005344:	06813083          	ld	ra,104(sp)
    80005348:	06013403          	ld	s0,96(sp)
    8000534c:	05813483          	ld	s1,88(sp)
    80005350:	05013903          	ld	s2,80(sp)
    80005354:	04813983          	ld	s3,72(sp)
    80005358:	04013a03          	ld	s4,64(sp)
    8000535c:	03813a83          	ld	s5,56(sp)
    80005360:	03013b03          	ld	s6,48(sp)
    80005364:	07010113          	addi	sp,sp,112
    80005368:	00008067          	ret
    8000536c:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80005370:	000a0513          	mv	a0,s4
    80005374:	ffffc097          	auipc	ra,0xffffc
    80005378:	e70080e7          	jalr	-400(ra) # 800011e4 <_ZdlPv>
    8000537c:	00048513          	mv	a0,s1
    80005380:	0000a097          	auipc	ra,0xa
    80005384:	d48080e7          	jalr	-696(ra) # 8000f0c8 <_Unwind_Resume>

0000000080005388 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80005388:	f8010113          	addi	sp,sp,-128
    8000538c:	06113c23          	sd	ra,120(sp)
    80005390:	06813823          	sd	s0,112(sp)
    80005394:	06913423          	sd	s1,104(sp)
    80005398:	07213023          	sd	s2,96(sp)
    8000539c:	05313c23          	sd	s3,88(sp)
    800053a0:	05413823          	sd	s4,80(sp)
    800053a4:	05513423          	sd	s5,72(sp)
    800053a8:	05613023          	sd	s6,64(sp)
    800053ac:	03713c23          	sd	s7,56(sp)
    800053b0:	03813823          	sd	s8,48(sp)
    800053b4:	03913423          	sd	s9,40(sp)
    800053b8:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800053bc:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800053c0:	00006517          	auipc	a0,0x6
    800053c4:	06050513          	addi	a0,a0,96 # 8000b420 <CONSOLE_STATUS+0x410>
    800053c8:	00002097          	auipc	ra,0x2
    800053cc:	374080e7          	jalr	884(ra) # 8000773c <_Z11printStringPKc>
    getString(input, 30);
    800053d0:	01e00593          	li	a1,30
    800053d4:	f8040493          	addi	s1,s0,-128
    800053d8:	00048513          	mv	a0,s1
    800053dc:	00002097          	auipc	ra,0x2
    800053e0:	3e8080e7          	jalr	1000(ra) # 800077c4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800053e4:	00048513          	mv	a0,s1
    800053e8:	00002097          	auipc	ra,0x2
    800053ec:	4b4080e7          	jalr	1204(ra) # 8000789c <_Z11stringToIntPKc>
    800053f0:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    800053f4:	00006517          	auipc	a0,0x6
    800053f8:	04c50513          	addi	a0,a0,76 # 8000b440 <CONSOLE_STATUS+0x430>
    800053fc:	00002097          	auipc	ra,0x2
    80005400:	340080e7          	jalr	832(ra) # 8000773c <_Z11printStringPKc>
    getString(input, 30);
    80005404:	01e00593          	li	a1,30
    80005408:	00048513          	mv	a0,s1
    8000540c:	00002097          	auipc	ra,0x2
    80005410:	3b8080e7          	jalr	952(ra) # 800077c4 <_Z9getStringPci>
    n = stringToInt(input);
    80005414:	00048513          	mv	a0,s1
    80005418:	00002097          	auipc	ra,0x2
    8000541c:	484080e7          	jalr	1156(ra) # 8000789c <_Z11stringToIntPKc>
    80005420:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80005424:	00006517          	auipc	a0,0x6
    80005428:	03c50513          	addi	a0,a0,60 # 8000b460 <CONSOLE_STATUS+0x450>
    8000542c:	00002097          	auipc	ra,0x2
    80005430:	310080e7          	jalr	784(ra) # 8000773c <_Z11printStringPKc>
    printInt(threadNum);
    80005434:	00000613          	li	a2,0
    80005438:	00a00593          	li	a1,10
    8000543c:	00098513          	mv	a0,s3
    80005440:	00002097          	auipc	ra,0x2
    80005444:	4ac080e7          	jalr	1196(ra) # 800078ec <_Z8printIntiii>
    printString(" i velicina bafera ");
    80005448:	00006517          	auipc	a0,0x6
    8000544c:	03050513          	addi	a0,a0,48 # 8000b478 <CONSOLE_STATUS+0x468>
    80005450:	00002097          	auipc	ra,0x2
    80005454:	2ec080e7          	jalr	748(ra) # 8000773c <_Z11printStringPKc>
    printInt(n);
    80005458:	00000613          	li	a2,0
    8000545c:	00a00593          	li	a1,10
    80005460:	00048513          	mv	a0,s1
    80005464:	00002097          	auipc	ra,0x2
    80005468:	488080e7          	jalr	1160(ra) # 800078ec <_Z8printIntiii>
    printString(".\n");
    8000546c:	00006517          	auipc	a0,0x6
    80005470:	02450513          	addi	a0,a0,36 # 8000b490 <CONSOLE_STATUS+0x480>
    80005474:	00002097          	auipc	ra,0x2
    80005478:	2c8080e7          	jalr	712(ra) # 8000773c <_Z11printStringPKc>
    if (threadNum > n) {
    8000547c:	0334c463          	blt	s1,s3,800054a4 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80005480:	03305c63          	blez	s3,800054b8 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005484:	03800513          	li	a0,56
    80005488:	ffffc097          	auipc	ra,0xffffc
    8000548c:	d34080e7          	jalr	-716(ra) # 800011bc <_Znwm>
    80005490:	00050a93          	mv	s5,a0
    80005494:	00048593          	mv	a1,s1
    80005498:	00001097          	auipc	ra,0x1
    8000549c:	390080e7          	jalr	912(ra) # 80006828 <_ZN9BufferCPPC1Ei>
    800054a0:	0300006f          	j	800054d0 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800054a4:	00006517          	auipc	a0,0x6
    800054a8:	ff450513          	addi	a0,a0,-12 # 8000b498 <CONSOLE_STATUS+0x488>
    800054ac:	00002097          	auipc	ra,0x2
    800054b0:	290080e7          	jalr	656(ra) # 8000773c <_Z11printStringPKc>
        return;
    800054b4:	0140006f          	j	800054c8 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800054b8:	00006517          	auipc	a0,0x6
    800054bc:	02050513          	addi	a0,a0,32 # 8000b4d8 <CONSOLE_STATUS+0x4c8>
    800054c0:	00002097          	auipc	ra,0x2
    800054c4:	27c080e7          	jalr	636(ra) # 8000773c <_Z11printStringPKc>
        return;
    800054c8:	000c0113          	mv	sp,s8
    800054cc:	2380006f          	j	80005704 <_Z20testConsumerProducerv+0x37c>
    waitForAll = new Semaphore(0);
    800054d0:	01000513          	li	a0,16
    800054d4:	ffffc097          	auipc	ra,0xffffc
    800054d8:	ce8080e7          	jalr	-792(ra) # 800011bc <_Znwm>
    800054dc:	00050913          	mv	s2,a0
    800054e0:	00000593          	li	a1,0
    800054e4:	ffffc097          	auipc	ra,0xffffc
    800054e8:	ef0080e7          	jalr	-272(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800054ec:	00009797          	auipc	a5,0x9
    800054f0:	ad27be23          	sd	s2,-1316(a5) # 8000dfc8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800054f4:	00399793          	slli	a5,s3,0x3
    800054f8:	00f78793          	addi	a5,a5,15
    800054fc:	ff07f793          	andi	a5,a5,-16
    80005500:	40f10133          	sub	sp,sp,a5
    80005504:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80005508:	0019871b          	addiw	a4,s3,1
    8000550c:	00171793          	slli	a5,a4,0x1
    80005510:	00e787b3          	add	a5,a5,a4
    80005514:	00379793          	slli	a5,a5,0x3
    80005518:	00f78793          	addi	a5,a5,15
    8000551c:	ff07f793          	andi	a5,a5,-16
    80005520:	40f10133          	sub	sp,sp,a5
    80005524:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80005528:	00199493          	slli	s1,s3,0x1
    8000552c:	013484b3          	add	s1,s1,s3
    80005530:	00349493          	slli	s1,s1,0x3
    80005534:	009b04b3          	add	s1,s6,s1
    80005538:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    8000553c:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80005540:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005544:	02800513          	li	a0,40
    80005548:	ffffc097          	auipc	ra,0xffffc
    8000554c:	c74080e7          	jalr	-908(ra) # 800011bc <_Znwm>
    80005550:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80005554:	ffffc097          	auipc	ra,0xffffc
    80005558:	e4c080e7          	jalr	-436(ra) # 800013a0 <_ZN6ThreadC1Ev>
    8000555c:	00009797          	auipc	a5,0x9
    80005560:	83478793          	addi	a5,a5,-1996 # 8000dd90 <_ZTV8Consumer+0x10>
    80005564:	00fbb023          	sd	a5,0(s7)
    80005568:	029bb023          	sd	s1,32(s7)
    consumer->start();
    8000556c:	000b8513          	mv	a0,s7
    80005570:	ffffc097          	auipc	ra,0xffffc
    80005574:	d48080e7          	jalr	-696(ra) # 800012b8 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80005578:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    8000557c:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80005580:	00009797          	auipc	a5,0x9
    80005584:	a487b783          	ld	a5,-1464(a5) # 8000dfc8 <_ZL10waitForAll>
    80005588:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000558c:	02800513          	li	a0,40
    80005590:	ffffc097          	auipc	ra,0xffffc
    80005594:	c2c080e7          	jalr	-980(ra) # 800011bc <_Znwm>
    80005598:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    8000559c:	ffffc097          	auipc	ra,0xffffc
    800055a0:	e04080e7          	jalr	-508(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800055a4:	00008797          	auipc	a5,0x8
    800055a8:	79c78793          	addi	a5,a5,1948 # 8000dd40 <_ZTV16ProducerKeyborad+0x10>
    800055ac:	00f4b023          	sd	a5,0(s1)
    800055b0:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800055b4:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800055b8:	00048513          	mv	a0,s1
    800055bc:	ffffc097          	auipc	ra,0xffffc
    800055c0:	cfc080e7          	jalr	-772(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800055c4:	00100913          	li	s2,1
    800055c8:	0300006f          	j	800055f8 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800055cc:	00008797          	auipc	a5,0x8
    800055d0:	79c78793          	addi	a5,a5,1948 # 8000dd68 <_ZTV8Producer+0x10>
    800055d4:	00fcb023          	sd	a5,0(s9)
    800055d8:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800055dc:	00391793          	slli	a5,s2,0x3
    800055e0:	00fa07b3          	add	a5,s4,a5
    800055e4:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    800055e8:	000c8513          	mv	a0,s9
    800055ec:	ffffc097          	auipc	ra,0xffffc
    800055f0:	ccc080e7          	jalr	-820(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800055f4:	0019091b          	addiw	s2,s2,1
    800055f8:	05395263          	bge	s2,s3,8000563c <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    800055fc:	00191493          	slli	s1,s2,0x1
    80005600:	012484b3          	add	s1,s1,s2
    80005604:	00349493          	slli	s1,s1,0x3
    80005608:	009b04b3          	add	s1,s6,s1
    8000560c:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80005610:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80005614:	00009797          	auipc	a5,0x9
    80005618:	9b47b783          	ld	a5,-1612(a5) # 8000dfc8 <_ZL10waitForAll>
    8000561c:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80005620:	02800513          	li	a0,40
    80005624:	ffffc097          	auipc	ra,0xffffc
    80005628:	b98080e7          	jalr	-1128(ra) # 800011bc <_Znwm>
    8000562c:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80005630:	ffffc097          	auipc	ra,0xffffc
    80005634:	d70080e7          	jalr	-656(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80005638:	f95ff06f          	j	800055cc <_Z20testConsumerProducerv+0x244>
    putc('.');
    8000563c:	02e00513          	li	a0,46
    80005640:	ffffc097          	auipc	ra,0xffffc
    80005644:	43c080e7          	jalr	1084(ra) # 80001a7c <_Z4putcc>
    Thread::dispatch();
    80005648:	ffffc097          	auipc	ra,0xffffc
    8000564c:	cd0080e7          	jalr	-816(ra) # 80001318 <_ZN6Thread8dispatchEv>
    putc('.');
    80005650:	02e00513          	li	a0,46
    80005654:	ffffc097          	auipc	ra,0xffffc
    80005658:	428080e7          	jalr	1064(ra) # 80001a7c <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    8000565c:	00000493          	li	s1,0
    80005660:	0099ce63          	blt	s3,s1,8000567c <_Z20testConsumerProducerv+0x2f4>
        waitForAll->wait();
    80005664:	00009517          	auipc	a0,0x9
    80005668:	96453503          	ld	a0,-1692(a0) # 8000dfc8 <_ZL10waitForAll>
    8000566c:	ffffc097          	auipc	ra,0xffffc
    80005670:	da0080e7          	jalr	-608(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005674:	0014849b          	addiw	s1,s1,1
    80005678:	fe9ff06f          	j	80005660 <_Z20testConsumerProducerv+0x2d8>
    putc('.');
    8000567c:	02e00513          	li	a0,46
    80005680:	ffffc097          	auipc	ra,0xffffc
    80005684:	3fc080e7          	jalr	1020(ra) # 80001a7c <_Z4putcc>
    delete waitForAll;
    80005688:	00009517          	auipc	a0,0x9
    8000568c:	94053503          	ld	a0,-1728(a0) # 8000dfc8 <_ZL10waitForAll>
    80005690:	00050863          	beqz	a0,800056a0 <_Z20testConsumerProducerv+0x318>
    80005694:	00053783          	ld	a5,0(a0)
    80005698:	0087b783          	ld	a5,8(a5)
    8000569c:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800056a0:	00000493          	li	s1,0
    800056a4:	0080006f          	j	800056ac <_Z20testConsumerProducerv+0x324>
    for (int i = 0; i < threadNum; i++) {
    800056a8:	0014849b          	addiw	s1,s1,1
    800056ac:	0334d263          	bge	s1,s3,800056d0 <_Z20testConsumerProducerv+0x348>
        delete producers[i];
    800056b0:	00349793          	slli	a5,s1,0x3
    800056b4:	00fa07b3          	add	a5,s4,a5
    800056b8:	0007b503          	ld	a0,0(a5)
    800056bc:	fe0506e3          	beqz	a0,800056a8 <_Z20testConsumerProducerv+0x320>
    800056c0:	00053783          	ld	a5,0(a0)
    800056c4:	0087b783          	ld	a5,8(a5)
    800056c8:	000780e7          	jalr	a5
    800056cc:	fddff06f          	j	800056a8 <_Z20testConsumerProducerv+0x320>
    delete consumer;
    800056d0:	000b8a63          	beqz	s7,800056e4 <_Z20testConsumerProducerv+0x35c>
    800056d4:	000bb783          	ld	a5,0(s7)
    800056d8:	0087b783          	ld	a5,8(a5)
    800056dc:	000b8513          	mv	a0,s7
    800056e0:	000780e7          	jalr	a5
    delete buffer;
    800056e4:	000a8e63          	beqz	s5,80005700 <_Z20testConsumerProducerv+0x378>
    800056e8:	000a8513          	mv	a0,s5
    800056ec:	00001097          	auipc	ra,0x1
    800056f0:	434080e7          	jalr	1076(ra) # 80006b20 <_ZN9BufferCPPD1Ev>
    800056f4:	000a8513          	mv	a0,s5
    800056f8:	ffffc097          	auipc	ra,0xffffc
    800056fc:	aec080e7          	jalr	-1300(ra) # 800011e4 <_ZdlPv>
    80005700:	000c0113          	mv	sp,s8
}
    80005704:	f8040113          	addi	sp,s0,-128
    80005708:	07813083          	ld	ra,120(sp)
    8000570c:	07013403          	ld	s0,112(sp)
    80005710:	06813483          	ld	s1,104(sp)
    80005714:	06013903          	ld	s2,96(sp)
    80005718:	05813983          	ld	s3,88(sp)
    8000571c:	05013a03          	ld	s4,80(sp)
    80005720:	04813a83          	ld	s5,72(sp)
    80005724:	04013b03          	ld	s6,64(sp)
    80005728:	03813b83          	ld	s7,56(sp)
    8000572c:	03013c03          	ld	s8,48(sp)
    80005730:	02813c83          	ld	s9,40(sp)
    80005734:	08010113          	addi	sp,sp,128
    80005738:	00008067          	ret
    8000573c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005740:	000a8513          	mv	a0,s5
    80005744:	ffffc097          	auipc	ra,0xffffc
    80005748:	aa0080e7          	jalr	-1376(ra) # 800011e4 <_ZdlPv>
    8000574c:	00048513          	mv	a0,s1
    80005750:	0000a097          	auipc	ra,0xa
    80005754:	978080e7          	jalr	-1672(ra) # 8000f0c8 <_Unwind_Resume>
    80005758:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    8000575c:	00090513          	mv	a0,s2
    80005760:	ffffc097          	auipc	ra,0xffffc
    80005764:	a84080e7          	jalr	-1404(ra) # 800011e4 <_ZdlPv>
    80005768:	00048513          	mv	a0,s1
    8000576c:	0000a097          	auipc	ra,0xa
    80005770:	95c080e7          	jalr	-1700(ra) # 8000f0c8 <_Unwind_Resume>
    80005774:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005778:	000b8513          	mv	a0,s7
    8000577c:	ffffc097          	auipc	ra,0xffffc
    80005780:	a68080e7          	jalr	-1432(ra) # 800011e4 <_ZdlPv>
    80005784:	00048513          	mv	a0,s1
    80005788:	0000a097          	auipc	ra,0xa
    8000578c:	940080e7          	jalr	-1728(ra) # 8000f0c8 <_Unwind_Resume>
    80005790:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005794:	00048513          	mv	a0,s1
    80005798:	ffffc097          	auipc	ra,0xffffc
    8000579c:	a4c080e7          	jalr	-1460(ra) # 800011e4 <_ZdlPv>
    800057a0:	00090513          	mv	a0,s2
    800057a4:	0000a097          	auipc	ra,0xa
    800057a8:	924080e7          	jalr	-1756(ra) # 8000f0c8 <_Unwind_Resume>
    800057ac:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800057b0:	000c8513          	mv	a0,s9
    800057b4:	ffffc097          	auipc	ra,0xffffc
    800057b8:	a30080e7          	jalr	-1488(ra) # 800011e4 <_ZdlPv>
    800057bc:	00048513          	mv	a0,s1
    800057c0:	0000a097          	auipc	ra,0xa
    800057c4:	908080e7          	jalr	-1784(ra) # 8000f0c8 <_Unwind_Resume>

00000000800057c8 <_ZN8Consumer3runEv>:
    void run() override {
    800057c8:	fd010113          	addi	sp,sp,-48
    800057cc:	02113423          	sd	ra,40(sp)
    800057d0:	02813023          	sd	s0,32(sp)
    800057d4:	00913c23          	sd	s1,24(sp)
    800057d8:	01213823          	sd	s2,16(sp)
    800057dc:	01313423          	sd	s3,8(sp)
    800057e0:	03010413          	addi	s0,sp,48
    800057e4:	00050913          	mv	s2,a0
        int i = 0;
    800057e8:	00000993          	li	s3,0
    800057ec:	0100006f          	j	800057fc <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800057f0:	00a00513          	li	a0,10
    800057f4:	ffffd097          	auipc	ra,0xffffd
    800057f8:	d90080e7          	jalr	-624(ra) # 80002584 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800057fc:	00008797          	auipc	a5,0x8
    80005800:	7c47a783          	lw	a5,1988(a5) # 8000dfc0 <_ZL9threadEnd>
    80005804:	04079a63          	bnez	a5,80005858 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80005808:	02093783          	ld	a5,32(s2)
    8000580c:	0087b503          	ld	a0,8(a5)
    80005810:	00001097          	auipc	ra,0x1
    80005814:	1fc080e7          	jalr	508(ra) # 80006a0c <_ZN9BufferCPP3getEv>
            i++;
    80005818:	0019849b          	addiw	s1,s3,1
    8000581c:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80005820:	0ff57513          	andi	a0,a0,255
    80005824:	ffffd097          	auipc	ra,0xffffd
    80005828:	d60080e7          	jalr	-672(ra) # 80002584 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    8000582c:	05000793          	li	a5,80
    80005830:	02f4e4bb          	remw	s1,s1,a5
    80005834:	fc0494e3          	bnez	s1,800057fc <_ZN8Consumer3runEv+0x34>
    80005838:	fb9ff06f          	j	800057f0 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    8000583c:	02093783          	ld	a5,32(s2)
    80005840:	0087b503          	ld	a0,8(a5)
    80005844:	00001097          	auipc	ra,0x1
    80005848:	1c8080e7          	jalr	456(ra) # 80006a0c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    8000584c:	0ff57513          	andi	a0,a0,255
    80005850:	ffffd097          	auipc	ra,0xffffd
    80005854:	d34080e7          	jalr	-716(ra) # 80002584 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005858:	02093783          	ld	a5,32(s2)
    8000585c:	0087b503          	ld	a0,8(a5)
    80005860:	00001097          	auipc	ra,0x1
    80005864:	238080e7          	jalr	568(ra) # 80006a98 <_ZN9BufferCPP6getCntEv>
    80005868:	fca04ae3          	bgtz	a0,8000583c <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    8000586c:	02093783          	ld	a5,32(s2)
    80005870:	0107b503          	ld	a0,16(a5)
    80005874:	ffffc097          	auipc	ra,0xffffc
    80005878:	bc4080e7          	jalr	-1084(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    8000587c:	02813083          	ld	ra,40(sp)
    80005880:	02013403          	ld	s0,32(sp)
    80005884:	01813483          	ld	s1,24(sp)
    80005888:	01013903          	ld	s2,16(sp)
    8000588c:	00813983          	ld	s3,8(sp)
    80005890:	03010113          	addi	sp,sp,48
    80005894:	00008067          	ret

0000000080005898 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80005898:	ff010113          	addi	sp,sp,-16
    8000589c:	00113423          	sd	ra,8(sp)
    800058a0:	00813023          	sd	s0,0(sp)
    800058a4:	01010413          	addi	s0,sp,16
    800058a8:	00008797          	auipc	a5,0x8
    800058ac:	4e878793          	addi	a5,a5,1256 # 8000dd90 <_ZTV8Consumer+0x10>
    800058b0:	00f53023          	sd	a5,0(a0)
    800058b4:	ffffc097          	auipc	ra,0xffffc
    800058b8:	898080e7          	jalr	-1896(ra) # 8000114c <_ZN6ThreadD1Ev>
    800058bc:	00813083          	ld	ra,8(sp)
    800058c0:	00013403          	ld	s0,0(sp)
    800058c4:	01010113          	addi	sp,sp,16
    800058c8:	00008067          	ret

00000000800058cc <_ZN8ConsumerD0Ev>:
    800058cc:	fe010113          	addi	sp,sp,-32
    800058d0:	00113c23          	sd	ra,24(sp)
    800058d4:	00813823          	sd	s0,16(sp)
    800058d8:	00913423          	sd	s1,8(sp)
    800058dc:	02010413          	addi	s0,sp,32
    800058e0:	00050493          	mv	s1,a0
    800058e4:	00008797          	auipc	a5,0x8
    800058e8:	4ac78793          	addi	a5,a5,1196 # 8000dd90 <_ZTV8Consumer+0x10>
    800058ec:	00f53023          	sd	a5,0(a0)
    800058f0:	ffffc097          	auipc	ra,0xffffc
    800058f4:	85c080e7          	jalr	-1956(ra) # 8000114c <_ZN6ThreadD1Ev>
    800058f8:	00048513          	mv	a0,s1
    800058fc:	ffffc097          	auipc	ra,0xffffc
    80005900:	8e8080e7          	jalr	-1816(ra) # 800011e4 <_ZdlPv>
    80005904:	01813083          	ld	ra,24(sp)
    80005908:	01013403          	ld	s0,16(sp)
    8000590c:	00813483          	ld	s1,8(sp)
    80005910:	02010113          	addi	sp,sp,32
    80005914:	00008067          	ret

0000000080005918 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80005918:	ff010113          	addi	sp,sp,-16
    8000591c:	00113423          	sd	ra,8(sp)
    80005920:	00813023          	sd	s0,0(sp)
    80005924:	01010413          	addi	s0,sp,16
    80005928:	00008797          	auipc	a5,0x8
    8000592c:	41878793          	addi	a5,a5,1048 # 8000dd40 <_ZTV16ProducerKeyborad+0x10>
    80005930:	00f53023          	sd	a5,0(a0)
    80005934:	ffffc097          	auipc	ra,0xffffc
    80005938:	818080e7          	jalr	-2024(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000593c:	00813083          	ld	ra,8(sp)
    80005940:	00013403          	ld	s0,0(sp)
    80005944:	01010113          	addi	sp,sp,16
    80005948:	00008067          	ret

000000008000594c <_ZN16ProducerKeyboradD0Ev>:
    8000594c:	fe010113          	addi	sp,sp,-32
    80005950:	00113c23          	sd	ra,24(sp)
    80005954:	00813823          	sd	s0,16(sp)
    80005958:	00913423          	sd	s1,8(sp)
    8000595c:	02010413          	addi	s0,sp,32
    80005960:	00050493          	mv	s1,a0
    80005964:	00008797          	auipc	a5,0x8
    80005968:	3dc78793          	addi	a5,a5,988 # 8000dd40 <_ZTV16ProducerKeyborad+0x10>
    8000596c:	00f53023          	sd	a5,0(a0)
    80005970:	ffffb097          	auipc	ra,0xffffb
    80005974:	7dc080e7          	jalr	2012(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005978:	00048513          	mv	a0,s1
    8000597c:	ffffc097          	auipc	ra,0xffffc
    80005980:	868080e7          	jalr	-1944(ra) # 800011e4 <_ZdlPv>
    80005984:	01813083          	ld	ra,24(sp)
    80005988:	01013403          	ld	s0,16(sp)
    8000598c:	00813483          	ld	s1,8(sp)
    80005990:	02010113          	addi	sp,sp,32
    80005994:	00008067          	ret

0000000080005998 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005998:	ff010113          	addi	sp,sp,-16
    8000599c:	00113423          	sd	ra,8(sp)
    800059a0:	00813023          	sd	s0,0(sp)
    800059a4:	01010413          	addi	s0,sp,16
    800059a8:	00008797          	auipc	a5,0x8
    800059ac:	3c078793          	addi	a5,a5,960 # 8000dd68 <_ZTV8Producer+0x10>
    800059b0:	00f53023          	sd	a5,0(a0)
    800059b4:	ffffb097          	auipc	ra,0xffffb
    800059b8:	798080e7          	jalr	1944(ra) # 8000114c <_ZN6ThreadD1Ev>
    800059bc:	00813083          	ld	ra,8(sp)
    800059c0:	00013403          	ld	s0,0(sp)
    800059c4:	01010113          	addi	sp,sp,16
    800059c8:	00008067          	ret

00000000800059cc <_ZN8ProducerD0Ev>:
    800059cc:	fe010113          	addi	sp,sp,-32
    800059d0:	00113c23          	sd	ra,24(sp)
    800059d4:	00813823          	sd	s0,16(sp)
    800059d8:	00913423          	sd	s1,8(sp)
    800059dc:	02010413          	addi	s0,sp,32
    800059e0:	00050493          	mv	s1,a0
    800059e4:	00008797          	auipc	a5,0x8
    800059e8:	38478793          	addi	a5,a5,900 # 8000dd68 <_ZTV8Producer+0x10>
    800059ec:	00f53023          	sd	a5,0(a0)
    800059f0:	ffffb097          	auipc	ra,0xffffb
    800059f4:	75c080e7          	jalr	1884(ra) # 8000114c <_ZN6ThreadD1Ev>
    800059f8:	00048513          	mv	a0,s1
    800059fc:	ffffb097          	auipc	ra,0xffffb
    80005a00:	7e8080e7          	jalr	2024(ra) # 800011e4 <_ZdlPv>
    80005a04:	01813083          	ld	ra,24(sp)
    80005a08:	01013403          	ld	s0,16(sp)
    80005a0c:	00813483          	ld	s1,8(sp)
    80005a10:	02010113          	addi	sp,sp,32
    80005a14:	00008067          	ret

0000000080005a18 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80005a18:	fe010113          	addi	sp,sp,-32
    80005a1c:	00113c23          	sd	ra,24(sp)
    80005a20:	00813823          	sd	s0,16(sp)
    80005a24:	00913423          	sd	s1,8(sp)
    80005a28:	02010413          	addi	s0,sp,32
    80005a2c:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80005a30:	ffffc097          	auipc	ra,0xffffc
    80005a34:	024080e7          	jalr	36(ra) # 80001a54 <_Z4getcv>
    80005a38:	0005059b          	sext.w	a1,a0
    80005a3c:	01b00793          	li	a5,27
    80005a40:	00f58c63          	beq	a1,a5,80005a58 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80005a44:	0204b783          	ld	a5,32(s1)
    80005a48:	0087b503          	ld	a0,8(a5)
    80005a4c:	00001097          	auipc	ra,0x1
    80005a50:	f30080e7          	jalr	-208(ra) # 8000697c <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80005a54:	fddff06f          	j	80005a30 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005a58:	00100793          	li	a5,1
    80005a5c:	00008717          	auipc	a4,0x8
    80005a60:	56f72223          	sw	a5,1380(a4) # 8000dfc0 <_ZL9threadEnd>
        td->buffer->put('!');
    80005a64:	0204b783          	ld	a5,32(s1)
    80005a68:	02100593          	li	a1,33
    80005a6c:	0087b503          	ld	a0,8(a5)
    80005a70:	00001097          	auipc	ra,0x1
    80005a74:	f0c080e7          	jalr	-244(ra) # 8000697c <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80005a78:	0204b783          	ld	a5,32(s1)
    80005a7c:	0107b503          	ld	a0,16(a5)
    80005a80:	ffffc097          	auipc	ra,0xffffc
    80005a84:	9b8080e7          	jalr	-1608(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005a88:	01813083          	ld	ra,24(sp)
    80005a8c:	01013403          	ld	s0,16(sp)
    80005a90:	00813483          	ld	s1,8(sp)
    80005a94:	02010113          	addi	sp,sp,32
    80005a98:	00008067          	ret

0000000080005a9c <_ZN8Producer3runEv>:
    void run() override {
    80005a9c:	fe010113          	addi	sp,sp,-32
    80005aa0:	00113c23          	sd	ra,24(sp)
    80005aa4:	00813823          	sd	s0,16(sp)
    80005aa8:	00913423          	sd	s1,8(sp)
    80005aac:	01213023          	sd	s2,0(sp)
    80005ab0:	02010413          	addi	s0,sp,32
    80005ab4:	00050493          	mv	s1,a0
        int i = 0;
    80005ab8:	00000913          	li	s2,0
        while (!threadEnd) {
    80005abc:	00008797          	auipc	a5,0x8
    80005ac0:	5047a783          	lw	a5,1284(a5) # 8000dfc0 <_ZL9threadEnd>
    80005ac4:	04079263          	bnez	a5,80005b08 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80005ac8:	0204b783          	ld	a5,32(s1)
    80005acc:	0007a583          	lw	a1,0(a5)
    80005ad0:	0305859b          	addiw	a1,a1,48
    80005ad4:	0087b503          	ld	a0,8(a5)
    80005ad8:	00001097          	auipc	ra,0x1
    80005adc:	ea4080e7          	jalr	-348(ra) # 8000697c <_ZN9BufferCPP3putEi>
            i++;
    80005ae0:	0019071b          	addiw	a4,s2,1
    80005ae4:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80005ae8:	0204b783          	ld	a5,32(s1)
    80005aec:	0007a783          	lw	a5,0(a5)
    80005af0:	00e787bb          	addw	a5,a5,a4
    80005af4:	00500513          	li	a0,5
    80005af8:	02a7e53b          	remw	a0,a5,a0
    80005afc:	ffffc097          	auipc	ra,0xffffc
    80005b00:	844080e7          	jalr	-1980(ra) # 80001340 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80005b04:	fb9ff06f          	j	80005abc <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80005b08:	0204b783          	ld	a5,32(s1)
    80005b0c:	0107b503          	ld	a0,16(a5)
    80005b10:	ffffc097          	auipc	ra,0xffffc
    80005b14:	928080e7          	jalr	-1752(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005b18:	01813083          	ld	ra,24(sp)
    80005b1c:	01013403          	ld	s0,16(sp)
    80005b20:	00813483          	ld	s1,8(sp)
    80005b24:	00013903          	ld	s2,0(sp)
    80005b28:	02010113          	addi	sp,sp,32
    80005b2c:	00008067          	ret

0000000080005b30 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005b30:	fe010113          	addi	sp,sp,-32
    80005b34:	00113c23          	sd	ra,24(sp)
    80005b38:	00813823          	sd	s0,16(sp)
    80005b3c:	00913423          	sd	s1,8(sp)
    80005b40:	01213023          	sd	s2,0(sp)
    80005b44:	02010413          	addi	s0,sp,32
    80005b48:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005b4c:	00100793          	li	a5,1
    80005b50:	02a7f863          	bgeu	a5,a0,80005b80 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005b54:	00a00793          	li	a5,10
    80005b58:	02f577b3          	remu	a5,a0,a5
    80005b5c:	02078e63          	beqz	a5,80005b98 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005b60:	fff48513          	addi	a0,s1,-1
    80005b64:	00000097          	auipc	ra,0x0
    80005b68:	fcc080e7          	jalr	-52(ra) # 80005b30 <_ZL9fibonaccim>
    80005b6c:	00050913          	mv	s2,a0
    80005b70:	ffe48513          	addi	a0,s1,-2
    80005b74:	00000097          	auipc	ra,0x0
    80005b78:	fbc080e7          	jalr	-68(ra) # 80005b30 <_ZL9fibonaccim>
    80005b7c:	00a90533          	add	a0,s2,a0
}
    80005b80:	01813083          	ld	ra,24(sp)
    80005b84:	01013403          	ld	s0,16(sp)
    80005b88:	00813483          	ld	s1,8(sp)
    80005b8c:	00013903          	ld	s2,0(sp)
    80005b90:	02010113          	addi	sp,sp,32
    80005b94:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005b98:	ffffc097          	auipc	ra,0xffffc
    80005b9c:	d90080e7          	jalr	-624(ra) # 80001928 <_Z15thread_dispatchv>
    80005ba0:	fc1ff06f          	j	80005b60 <_ZL9fibonaccim+0x30>

0000000080005ba4 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005ba4:	fe010113          	addi	sp,sp,-32
    80005ba8:	00113c23          	sd	ra,24(sp)
    80005bac:	00813823          	sd	s0,16(sp)
    80005bb0:	00913423          	sd	s1,8(sp)
    80005bb4:	01213023          	sd	s2,0(sp)
    80005bb8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005bbc:	00a00493          	li	s1,10
    80005bc0:	0400006f          	j	80005c00 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005bc4:	00006517          	auipc	a0,0x6
    80005bc8:	94450513          	addi	a0,a0,-1724 # 8000b508 <CONSOLE_STATUS+0x4f8>
    80005bcc:	00002097          	auipc	ra,0x2
    80005bd0:	b70080e7          	jalr	-1168(ra) # 8000773c <_Z11printStringPKc>
    80005bd4:	00000613          	li	a2,0
    80005bd8:	00a00593          	li	a1,10
    80005bdc:	00048513          	mv	a0,s1
    80005be0:	00002097          	auipc	ra,0x2
    80005be4:	d0c080e7          	jalr	-756(ra) # 800078ec <_Z8printIntiii>
    80005be8:	00006517          	auipc	a0,0x6
    80005bec:	be850513          	addi	a0,a0,-1048 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005bf0:	00002097          	auipc	ra,0x2
    80005bf4:	b4c080e7          	jalr	-1204(ra) # 8000773c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005bf8:	0014849b          	addiw	s1,s1,1
    80005bfc:	0ff4f493          	andi	s1,s1,255
    80005c00:	00c00793          	li	a5,12
    80005c04:	fc97f0e3          	bgeu	a5,s1,80005bc4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005c08:	00006517          	auipc	a0,0x6
    80005c0c:	90850513          	addi	a0,a0,-1784 # 8000b510 <CONSOLE_STATUS+0x500>
    80005c10:	00002097          	auipc	ra,0x2
    80005c14:	b2c080e7          	jalr	-1236(ra) # 8000773c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005c18:	00500313          	li	t1,5
    thread_dispatch();
    80005c1c:	ffffc097          	auipc	ra,0xffffc
    80005c20:	d0c080e7          	jalr	-756(ra) # 80001928 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005c24:	01000513          	li	a0,16
    80005c28:	00000097          	auipc	ra,0x0
    80005c2c:	f08080e7          	jalr	-248(ra) # 80005b30 <_ZL9fibonaccim>
    80005c30:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005c34:	00006517          	auipc	a0,0x6
    80005c38:	8ec50513          	addi	a0,a0,-1812 # 8000b520 <CONSOLE_STATUS+0x510>
    80005c3c:	00002097          	auipc	ra,0x2
    80005c40:	b00080e7          	jalr	-1280(ra) # 8000773c <_Z11printStringPKc>
    80005c44:	00000613          	li	a2,0
    80005c48:	00a00593          	li	a1,10
    80005c4c:	0009051b          	sext.w	a0,s2
    80005c50:	00002097          	auipc	ra,0x2
    80005c54:	c9c080e7          	jalr	-868(ra) # 800078ec <_Z8printIntiii>
    80005c58:	00006517          	auipc	a0,0x6
    80005c5c:	b7850513          	addi	a0,a0,-1160 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005c60:	00002097          	auipc	ra,0x2
    80005c64:	adc080e7          	jalr	-1316(ra) # 8000773c <_Z11printStringPKc>
    80005c68:	0400006f          	j	80005ca8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005c6c:	00006517          	auipc	a0,0x6
    80005c70:	89c50513          	addi	a0,a0,-1892 # 8000b508 <CONSOLE_STATUS+0x4f8>
    80005c74:	00002097          	auipc	ra,0x2
    80005c78:	ac8080e7          	jalr	-1336(ra) # 8000773c <_Z11printStringPKc>
    80005c7c:	00000613          	li	a2,0
    80005c80:	00a00593          	li	a1,10
    80005c84:	00048513          	mv	a0,s1
    80005c88:	00002097          	auipc	ra,0x2
    80005c8c:	c64080e7          	jalr	-924(ra) # 800078ec <_Z8printIntiii>
    80005c90:	00006517          	auipc	a0,0x6
    80005c94:	b4050513          	addi	a0,a0,-1216 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005c98:	00002097          	auipc	ra,0x2
    80005c9c:	aa4080e7          	jalr	-1372(ra) # 8000773c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005ca0:	0014849b          	addiw	s1,s1,1
    80005ca4:	0ff4f493          	andi	s1,s1,255
    80005ca8:	00f00793          	li	a5,15
    80005cac:	fc97f0e3          	bgeu	a5,s1,80005c6c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005cb0:	00006517          	auipc	a0,0x6
    80005cb4:	88050513          	addi	a0,a0,-1920 # 8000b530 <CONSOLE_STATUS+0x520>
    80005cb8:	00002097          	auipc	ra,0x2
    80005cbc:	a84080e7          	jalr	-1404(ra) # 8000773c <_Z11printStringPKc>
    finishedD = true;
    80005cc0:	00100793          	li	a5,1
    80005cc4:	00008717          	auipc	a4,0x8
    80005cc8:	30f70623          	sb	a5,780(a4) # 8000dfd0 <_ZL9finishedD>
    thread_dispatch();
    80005ccc:	ffffc097          	auipc	ra,0xffffc
    80005cd0:	c5c080e7          	jalr	-932(ra) # 80001928 <_Z15thread_dispatchv>
}
    80005cd4:	01813083          	ld	ra,24(sp)
    80005cd8:	01013403          	ld	s0,16(sp)
    80005cdc:	00813483          	ld	s1,8(sp)
    80005ce0:	00013903          	ld	s2,0(sp)
    80005ce4:	02010113          	addi	sp,sp,32
    80005ce8:	00008067          	ret

0000000080005cec <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005cec:	fe010113          	addi	sp,sp,-32
    80005cf0:	00113c23          	sd	ra,24(sp)
    80005cf4:	00813823          	sd	s0,16(sp)
    80005cf8:	00913423          	sd	s1,8(sp)
    80005cfc:	01213023          	sd	s2,0(sp)
    80005d00:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005d04:	00000493          	li	s1,0
    80005d08:	0400006f          	j	80005d48 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005d0c:	00006517          	auipc	a0,0x6
    80005d10:	83450513          	addi	a0,a0,-1996 # 8000b540 <CONSOLE_STATUS+0x530>
    80005d14:	00002097          	auipc	ra,0x2
    80005d18:	a28080e7          	jalr	-1496(ra) # 8000773c <_Z11printStringPKc>
    80005d1c:	00000613          	li	a2,0
    80005d20:	00a00593          	li	a1,10
    80005d24:	00048513          	mv	a0,s1
    80005d28:	00002097          	auipc	ra,0x2
    80005d2c:	bc4080e7          	jalr	-1084(ra) # 800078ec <_Z8printIntiii>
    80005d30:	00006517          	auipc	a0,0x6
    80005d34:	aa050513          	addi	a0,a0,-1376 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005d38:	00002097          	auipc	ra,0x2
    80005d3c:	a04080e7          	jalr	-1532(ra) # 8000773c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005d40:	0014849b          	addiw	s1,s1,1
    80005d44:	0ff4f493          	andi	s1,s1,255
    80005d48:	00200793          	li	a5,2
    80005d4c:	fc97f0e3          	bgeu	a5,s1,80005d0c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005d50:	00005517          	auipc	a0,0x5
    80005d54:	7f850513          	addi	a0,a0,2040 # 8000b548 <CONSOLE_STATUS+0x538>
    80005d58:	00002097          	auipc	ra,0x2
    80005d5c:	9e4080e7          	jalr	-1564(ra) # 8000773c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005d60:	00700313          	li	t1,7
    thread_dispatch();
    80005d64:	ffffc097          	auipc	ra,0xffffc
    80005d68:	bc4080e7          	jalr	-1084(ra) # 80001928 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005d6c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005d70:	00005517          	auipc	a0,0x5
    80005d74:	7e850513          	addi	a0,a0,2024 # 8000b558 <CONSOLE_STATUS+0x548>
    80005d78:	00002097          	auipc	ra,0x2
    80005d7c:	9c4080e7          	jalr	-1596(ra) # 8000773c <_Z11printStringPKc>
    80005d80:	00000613          	li	a2,0
    80005d84:	00a00593          	li	a1,10
    80005d88:	0009051b          	sext.w	a0,s2
    80005d8c:	00002097          	auipc	ra,0x2
    80005d90:	b60080e7          	jalr	-1184(ra) # 800078ec <_Z8printIntiii>
    80005d94:	00006517          	auipc	a0,0x6
    80005d98:	a3c50513          	addi	a0,a0,-1476 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005d9c:	00002097          	auipc	ra,0x2
    80005da0:	9a0080e7          	jalr	-1632(ra) # 8000773c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005da4:	00c00513          	li	a0,12
    80005da8:	00000097          	auipc	ra,0x0
    80005dac:	d88080e7          	jalr	-632(ra) # 80005b30 <_ZL9fibonaccim>
    80005db0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005db4:	00005517          	auipc	a0,0x5
    80005db8:	7ac50513          	addi	a0,a0,1964 # 8000b560 <CONSOLE_STATUS+0x550>
    80005dbc:	00002097          	auipc	ra,0x2
    80005dc0:	980080e7          	jalr	-1664(ra) # 8000773c <_Z11printStringPKc>
    80005dc4:	00000613          	li	a2,0
    80005dc8:	00a00593          	li	a1,10
    80005dcc:	0009051b          	sext.w	a0,s2
    80005dd0:	00002097          	auipc	ra,0x2
    80005dd4:	b1c080e7          	jalr	-1252(ra) # 800078ec <_Z8printIntiii>
    80005dd8:	00006517          	auipc	a0,0x6
    80005ddc:	9f850513          	addi	a0,a0,-1544 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005de0:	00002097          	auipc	ra,0x2
    80005de4:	95c080e7          	jalr	-1700(ra) # 8000773c <_Z11printStringPKc>
    80005de8:	0400006f          	j	80005e28 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005dec:	00005517          	auipc	a0,0x5
    80005df0:	75450513          	addi	a0,a0,1876 # 8000b540 <CONSOLE_STATUS+0x530>
    80005df4:	00002097          	auipc	ra,0x2
    80005df8:	948080e7          	jalr	-1720(ra) # 8000773c <_Z11printStringPKc>
    80005dfc:	00000613          	li	a2,0
    80005e00:	00a00593          	li	a1,10
    80005e04:	00048513          	mv	a0,s1
    80005e08:	00002097          	auipc	ra,0x2
    80005e0c:	ae4080e7          	jalr	-1308(ra) # 800078ec <_Z8printIntiii>
    80005e10:	00006517          	auipc	a0,0x6
    80005e14:	9c050513          	addi	a0,a0,-1600 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005e18:	00002097          	auipc	ra,0x2
    80005e1c:	924080e7          	jalr	-1756(ra) # 8000773c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005e20:	0014849b          	addiw	s1,s1,1
    80005e24:	0ff4f493          	andi	s1,s1,255
    80005e28:	00500793          	li	a5,5
    80005e2c:	fc97f0e3          	bgeu	a5,s1,80005dec <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005e30:	00005517          	auipc	a0,0x5
    80005e34:	74050513          	addi	a0,a0,1856 # 8000b570 <CONSOLE_STATUS+0x560>
    80005e38:	00002097          	auipc	ra,0x2
    80005e3c:	904080e7          	jalr	-1788(ra) # 8000773c <_Z11printStringPKc>
    finishedC = true;
    80005e40:	00100793          	li	a5,1
    80005e44:	00008717          	auipc	a4,0x8
    80005e48:	18f706a3          	sb	a5,397(a4) # 8000dfd1 <_ZL9finishedC>
    thread_dispatch();
    80005e4c:	ffffc097          	auipc	ra,0xffffc
    80005e50:	adc080e7          	jalr	-1316(ra) # 80001928 <_Z15thread_dispatchv>
}
    80005e54:	01813083          	ld	ra,24(sp)
    80005e58:	01013403          	ld	s0,16(sp)
    80005e5c:	00813483          	ld	s1,8(sp)
    80005e60:	00013903          	ld	s2,0(sp)
    80005e64:	02010113          	addi	sp,sp,32
    80005e68:	00008067          	ret

0000000080005e6c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005e6c:	fe010113          	addi	sp,sp,-32
    80005e70:	00113c23          	sd	ra,24(sp)
    80005e74:	00813823          	sd	s0,16(sp)
    80005e78:	00913423          	sd	s1,8(sp)
    80005e7c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005e80:	00000493          	li	s1,0
    80005e84:	0340006f          	j	80005eb8 <_ZL11workerBodyBPv+0x4c>
        for (uint64 j = 0; j < 100; j++) {
    80005e88:	00168693          	addi	a3,a3,1
    80005e8c:	06300793          	li	a5,99
    80005e90:	00d7ee63          	bltu	a5,a3,80005eac <_ZL11workerBodyBPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005e94:	00000713          	li	a4,0
    80005e98:	000077b7          	lui	a5,0x7
    80005e9c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005ea0:	fee7e4e3          	bltu	a5,a4,80005e88 <_ZL11workerBodyBPv+0x1c>
    80005ea4:	00170713          	addi	a4,a4,1
    80005ea8:	ff1ff06f          	j	80005e98 <_ZL11workerBodyBPv+0x2c>
        if (i == 10) {
    80005eac:	00a00793          	li	a5,10
    80005eb0:	04f48663          	beq	s1,a5,80005efc <_ZL11workerBodyBPv+0x90>
    for (uint64 i = 0; i < 16; i++) {
    80005eb4:	00148493          	addi	s1,s1,1
    80005eb8:	00f00793          	li	a5,15
    80005ebc:	0497e463          	bltu	a5,s1,80005f04 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005ec0:	00005517          	auipc	a0,0x5
    80005ec4:	6c050513          	addi	a0,a0,1728 # 8000b580 <CONSOLE_STATUS+0x570>
    80005ec8:	00002097          	auipc	ra,0x2
    80005ecc:	874080e7          	jalr	-1932(ra) # 8000773c <_Z11printStringPKc>
    80005ed0:	00000613          	li	a2,0
    80005ed4:	00a00593          	li	a1,10
    80005ed8:	0004851b          	sext.w	a0,s1
    80005edc:	00002097          	auipc	ra,0x2
    80005ee0:	a10080e7          	jalr	-1520(ra) # 800078ec <_Z8printIntiii>
    80005ee4:	00006517          	auipc	a0,0x6
    80005ee8:	8ec50513          	addi	a0,a0,-1812 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005eec:	00002097          	auipc	ra,0x2
    80005ef0:	850080e7          	jalr	-1968(ra) # 8000773c <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80005ef4:	00000693          	li	a3,0
    80005ef8:	f95ff06f          	j	80005e8c <_ZL11workerBodyBPv+0x20>
            asm volatile("csrr t6, sepc");
    80005efc:	14102ff3          	csrr	t6,sepc
    80005f00:	fb5ff06f          	j	80005eb4 <_ZL11workerBodyBPv+0x48>
    printString("B finished!\n");
    80005f04:	00005517          	auipc	a0,0x5
    80005f08:	68450513          	addi	a0,a0,1668 # 8000b588 <CONSOLE_STATUS+0x578>
    80005f0c:	00002097          	auipc	ra,0x2
    80005f10:	830080e7          	jalr	-2000(ra) # 8000773c <_Z11printStringPKc>
    finishedB = true;
    80005f14:	00100793          	li	a5,1
    80005f18:	00008717          	auipc	a4,0x8
    80005f1c:	0af70d23          	sb	a5,186(a4) # 8000dfd2 <_ZL9finishedB>
    thread_dispatch();
    80005f20:	ffffc097          	auipc	ra,0xffffc
    80005f24:	a08080e7          	jalr	-1528(ra) # 80001928 <_Z15thread_dispatchv>
}
    80005f28:	01813083          	ld	ra,24(sp)
    80005f2c:	01013403          	ld	s0,16(sp)
    80005f30:	00813483          	ld	s1,8(sp)
    80005f34:	02010113          	addi	sp,sp,32
    80005f38:	00008067          	ret

0000000080005f3c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005f3c:	fe010113          	addi	sp,sp,-32
    80005f40:	00113c23          	sd	ra,24(sp)
    80005f44:	00813823          	sd	s0,16(sp)
    80005f48:	00913423          	sd	s1,8(sp)
    80005f4c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005f50:	00000493          	li	s1,0
    80005f54:	02c0006f          	j	80005f80 <_ZL11workerBodyAPv+0x44>
        for (uint64 j = 0; j < 100; j++) {
    80005f58:	00168693          	addi	a3,a3,1
    80005f5c:	06300793          	li	a5,99
    80005f60:	00d7ee63          	bltu	a5,a3,80005f7c <_ZL11workerBodyAPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005f64:	00000713          	li	a4,0
    80005f68:	000077b7          	lui	a5,0x7
    80005f6c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005f70:	fee7e4e3          	bltu	a5,a4,80005f58 <_ZL11workerBodyAPv+0x1c>
    80005f74:	00170713          	addi	a4,a4,1
    80005f78:	ff1ff06f          	j	80005f68 <_ZL11workerBodyAPv+0x2c>
    for (uint64 i = 0; i < 10; i++) {
    80005f7c:	00148493          	addi	s1,s1,1
    80005f80:	00900793          	li	a5,9
    80005f84:	0497e063          	bltu	a5,s1,80005fc4 <_ZL11workerBodyAPv+0x88>
        printString("A: i="); printInt(i); printString("\n");
    80005f88:	00005517          	auipc	a0,0x5
    80005f8c:	61050513          	addi	a0,a0,1552 # 8000b598 <CONSOLE_STATUS+0x588>
    80005f90:	00001097          	auipc	ra,0x1
    80005f94:	7ac080e7          	jalr	1964(ra) # 8000773c <_Z11printStringPKc>
    80005f98:	00000613          	li	a2,0
    80005f9c:	00a00593          	li	a1,10
    80005fa0:	0004851b          	sext.w	a0,s1
    80005fa4:	00002097          	auipc	ra,0x2
    80005fa8:	948080e7          	jalr	-1720(ra) # 800078ec <_Z8printIntiii>
    80005fac:	00006517          	auipc	a0,0x6
    80005fb0:	82450513          	addi	a0,a0,-2012 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005fb4:	00001097          	auipc	ra,0x1
    80005fb8:	788080e7          	jalr	1928(ra) # 8000773c <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80005fbc:	00000693          	li	a3,0
    80005fc0:	f9dff06f          	j	80005f5c <_ZL11workerBodyAPv+0x20>
    printString("A finished!\n");
    80005fc4:	00005517          	auipc	a0,0x5
    80005fc8:	5dc50513          	addi	a0,a0,1500 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80005fcc:	00001097          	auipc	ra,0x1
    80005fd0:	770080e7          	jalr	1904(ra) # 8000773c <_Z11printStringPKc>
    finishedA = true;
    80005fd4:	00100793          	li	a5,1
    80005fd8:	00008717          	auipc	a4,0x8
    80005fdc:	fef70da3          	sb	a5,-5(a4) # 8000dfd3 <_ZL9finishedA>
}
    80005fe0:	01813083          	ld	ra,24(sp)
    80005fe4:	01013403          	ld	s0,16(sp)
    80005fe8:	00813483          	ld	s1,8(sp)
    80005fec:	02010113          	addi	sp,sp,32
    80005ff0:	00008067          	ret

0000000080005ff4 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80005ff4:	fd010113          	addi	sp,sp,-48
    80005ff8:	02113423          	sd	ra,40(sp)
    80005ffc:	02813023          	sd	s0,32(sp)
    80006000:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006004:	00000613          	li	a2,0
    80006008:	00000597          	auipc	a1,0x0
    8000600c:	f3458593          	addi	a1,a1,-204 # 80005f3c <_ZL11workerBodyAPv>
    80006010:	fd040513          	addi	a0,s0,-48
    80006014:	ffffc097          	auipc	ra,0xffffc
    80006018:	878080e7          	jalr	-1928(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    8000601c:	00005517          	auipc	a0,0x5
    80006020:	59450513          	addi	a0,a0,1428 # 8000b5b0 <CONSOLE_STATUS+0x5a0>
    80006024:	00001097          	auipc	ra,0x1
    80006028:	718080e7          	jalr	1816(ra) # 8000773c <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[1], workerBodyB, nullptr);
    8000602c:	00000613          	li	a2,0
    80006030:	00000597          	auipc	a1,0x0
    80006034:	e3c58593          	addi	a1,a1,-452 # 80005e6c <_ZL11workerBodyBPv>
    80006038:	fd840513          	addi	a0,s0,-40
    8000603c:	ffffc097          	auipc	ra,0xffffc
    80006040:	850080e7          	jalr	-1968(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80006044:	00005517          	auipc	a0,0x5
    80006048:	58450513          	addi	a0,a0,1412 # 8000b5c8 <CONSOLE_STATUS+0x5b8>
    8000604c:	00001097          	auipc	ra,0x1
    80006050:	6f0080e7          	jalr	1776(ra) # 8000773c <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[2], workerBodyC, nullptr);
    80006054:	00000613          	li	a2,0
    80006058:	00000597          	auipc	a1,0x0
    8000605c:	c9458593          	addi	a1,a1,-876 # 80005cec <_ZL11workerBodyCPv>
    80006060:	fe040513          	addi	a0,s0,-32
    80006064:	ffffc097          	auipc	ra,0xffffc
    80006068:	828080e7          	jalr	-2008(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    8000606c:	00005517          	auipc	a0,0x5
    80006070:	57450513          	addi	a0,a0,1396 # 8000b5e0 <CONSOLE_STATUS+0x5d0>
    80006074:	00001097          	auipc	ra,0x1
    80006078:	6c8080e7          	jalr	1736(ra) # 8000773c <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[3], workerBodyD, nullptr);
    8000607c:	00000613          	li	a2,0
    80006080:	00000597          	auipc	a1,0x0
    80006084:	b2458593          	addi	a1,a1,-1244 # 80005ba4 <_ZL11workerBodyDPv>
    80006088:	fe840513          	addi	a0,s0,-24
    8000608c:	ffffc097          	auipc	ra,0xffffc
    80006090:	800080e7          	jalr	-2048(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006094:	00005517          	auipc	a0,0x5
    80006098:	56450513          	addi	a0,a0,1380 # 8000b5f8 <CONSOLE_STATUS+0x5e8>
    8000609c:	00001097          	auipc	ra,0x1
    800060a0:	6a0080e7          	jalr	1696(ra) # 8000773c <_Z11printStringPKc>
    800060a4:	00c0006f          	j	800060b0 <_Z16System_Mode_testv+0xbc>
    // testUser();

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800060a8:	ffffc097          	auipc	ra,0xffffc
    800060ac:	880080e7          	jalr	-1920(ra) # 80001928 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800060b0:	00008797          	auipc	a5,0x8
    800060b4:	f237c783          	lbu	a5,-221(a5) # 8000dfd3 <_ZL9finishedA>
    800060b8:	fe0788e3          	beqz	a5,800060a8 <_Z16System_Mode_testv+0xb4>
    800060bc:	00008797          	auipc	a5,0x8
    800060c0:	f167c783          	lbu	a5,-234(a5) # 8000dfd2 <_ZL9finishedB>
    800060c4:	fe0782e3          	beqz	a5,800060a8 <_Z16System_Mode_testv+0xb4>
    800060c8:	00008797          	auipc	a5,0x8
    800060cc:	f097c783          	lbu	a5,-247(a5) # 8000dfd1 <_ZL9finishedC>
    800060d0:	fc078ce3          	beqz	a5,800060a8 <_Z16System_Mode_testv+0xb4>
    800060d4:	00008797          	auipc	a5,0x8
    800060d8:	efc7c783          	lbu	a5,-260(a5) # 8000dfd0 <_ZL9finishedD>
    800060dc:	fc0786e3          	beqz	a5,800060a8 <_Z16System_Mode_testv+0xb4>
    }

}
    800060e0:	02813083          	ld	ra,40(sp)
    800060e4:	02013403          	ld	s0,32(sp)
    800060e8:	03010113          	addi	sp,sp,48
    800060ec:	00008067          	ret

00000000800060f0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800060f0:	fe010113          	addi	sp,sp,-32
    800060f4:	00113c23          	sd	ra,24(sp)
    800060f8:	00813823          	sd	s0,16(sp)
    800060fc:	00913423          	sd	s1,8(sp)
    80006100:	01213023          	sd	s2,0(sp)
    80006104:	02010413          	addi	s0,sp,32
    80006108:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000610c:	00100793          	li	a5,1
    80006110:	02a7f863          	bgeu	a5,a0,80006140 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006114:	00a00793          	li	a5,10
    80006118:	02f577b3          	remu	a5,a0,a5
    8000611c:	02078e63          	beqz	a5,80006158 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006120:	fff48513          	addi	a0,s1,-1
    80006124:	00000097          	auipc	ra,0x0
    80006128:	fcc080e7          	jalr	-52(ra) # 800060f0 <_ZL9fibonaccim>
    8000612c:	00050913          	mv	s2,a0
    80006130:	ffe48513          	addi	a0,s1,-2
    80006134:	00000097          	auipc	ra,0x0
    80006138:	fbc080e7          	jalr	-68(ra) # 800060f0 <_ZL9fibonaccim>
    8000613c:	00a90533          	add	a0,s2,a0
}
    80006140:	01813083          	ld	ra,24(sp)
    80006144:	01013403          	ld	s0,16(sp)
    80006148:	00813483          	ld	s1,8(sp)
    8000614c:	00013903          	ld	s2,0(sp)
    80006150:	02010113          	addi	sp,sp,32
    80006154:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006158:	ffffb097          	auipc	ra,0xffffb
    8000615c:	7d0080e7          	jalr	2000(ra) # 80001928 <_Z15thread_dispatchv>
    80006160:	fc1ff06f          	j	80006120 <_ZL9fibonaccim+0x30>

0000000080006164 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006164:	fe010113          	addi	sp,sp,-32
    80006168:	00113c23          	sd	ra,24(sp)
    8000616c:	00813823          	sd	s0,16(sp)
    80006170:	00913423          	sd	s1,8(sp)
    80006174:	01213023          	sd	s2,0(sp)
    80006178:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000617c:	00a00493          	li	s1,10
    80006180:	0400006f          	j	800061c0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006184:	00005517          	auipc	a0,0x5
    80006188:	38450513          	addi	a0,a0,900 # 8000b508 <CONSOLE_STATUS+0x4f8>
    8000618c:	00001097          	auipc	ra,0x1
    80006190:	5b0080e7          	jalr	1456(ra) # 8000773c <_Z11printStringPKc>
    80006194:	00000613          	li	a2,0
    80006198:	00a00593          	li	a1,10
    8000619c:	00048513          	mv	a0,s1
    800061a0:	00001097          	auipc	ra,0x1
    800061a4:	74c080e7          	jalr	1868(ra) # 800078ec <_Z8printIntiii>
    800061a8:	00005517          	auipc	a0,0x5
    800061ac:	62850513          	addi	a0,a0,1576 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    800061b0:	00001097          	auipc	ra,0x1
    800061b4:	58c080e7          	jalr	1420(ra) # 8000773c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800061b8:	0014849b          	addiw	s1,s1,1
    800061bc:	0ff4f493          	andi	s1,s1,255
    800061c0:	00c00793          	li	a5,12
    800061c4:	fc97f0e3          	bgeu	a5,s1,80006184 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800061c8:	00005517          	auipc	a0,0x5
    800061cc:	34850513          	addi	a0,a0,840 # 8000b510 <CONSOLE_STATUS+0x500>
    800061d0:	00001097          	auipc	ra,0x1
    800061d4:	56c080e7          	jalr	1388(ra) # 8000773c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800061d8:	00500313          	li	t1,5
    thread_dispatch();
    800061dc:	ffffb097          	auipc	ra,0xffffb
    800061e0:	74c080e7          	jalr	1868(ra) # 80001928 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800061e4:	01000513          	li	a0,16
    800061e8:	00000097          	auipc	ra,0x0
    800061ec:	f08080e7          	jalr	-248(ra) # 800060f0 <_ZL9fibonaccim>
    800061f0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800061f4:	00005517          	auipc	a0,0x5
    800061f8:	32c50513          	addi	a0,a0,812 # 8000b520 <CONSOLE_STATUS+0x510>
    800061fc:	00001097          	auipc	ra,0x1
    80006200:	540080e7          	jalr	1344(ra) # 8000773c <_Z11printStringPKc>
    80006204:	00000613          	li	a2,0
    80006208:	00a00593          	li	a1,10
    8000620c:	0009051b          	sext.w	a0,s2
    80006210:	00001097          	auipc	ra,0x1
    80006214:	6dc080e7          	jalr	1756(ra) # 800078ec <_Z8printIntiii>
    80006218:	00005517          	auipc	a0,0x5
    8000621c:	5b850513          	addi	a0,a0,1464 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006220:	00001097          	auipc	ra,0x1
    80006224:	51c080e7          	jalr	1308(ra) # 8000773c <_Z11printStringPKc>
    80006228:	0400006f          	j	80006268 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000622c:	00005517          	auipc	a0,0x5
    80006230:	2dc50513          	addi	a0,a0,732 # 8000b508 <CONSOLE_STATUS+0x4f8>
    80006234:	00001097          	auipc	ra,0x1
    80006238:	508080e7          	jalr	1288(ra) # 8000773c <_Z11printStringPKc>
    8000623c:	00000613          	li	a2,0
    80006240:	00a00593          	li	a1,10
    80006244:	00048513          	mv	a0,s1
    80006248:	00001097          	auipc	ra,0x1
    8000624c:	6a4080e7          	jalr	1700(ra) # 800078ec <_Z8printIntiii>
    80006250:	00005517          	auipc	a0,0x5
    80006254:	58050513          	addi	a0,a0,1408 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006258:	00001097          	auipc	ra,0x1
    8000625c:	4e4080e7          	jalr	1252(ra) # 8000773c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006260:	0014849b          	addiw	s1,s1,1
    80006264:	0ff4f493          	andi	s1,s1,255
    80006268:	00f00793          	li	a5,15
    8000626c:	fc97f0e3          	bgeu	a5,s1,8000622c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006270:	00005517          	auipc	a0,0x5
    80006274:	2c050513          	addi	a0,a0,704 # 8000b530 <CONSOLE_STATUS+0x520>
    80006278:	00001097          	auipc	ra,0x1
    8000627c:	4c4080e7          	jalr	1220(ra) # 8000773c <_Z11printStringPKc>
    finishedD = true;
    80006280:	00100793          	li	a5,1
    80006284:	00008717          	auipc	a4,0x8
    80006288:	d4f70823          	sb	a5,-688(a4) # 8000dfd4 <_ZL9finishedD>
    thread_dispatch();
    8000628c:	ffffb097          	auipc	ra,0xffffb
    80006290:	69c080e7          	jalr	1692(ra) # 80001928 <_Z15thread_dispatchv>
}
    80006294:	01813083          	ld	ra,24(sp)
    80006298:	01013403          	ld	s0,16(sp)
    8000629c:	00813483          	ld	s1,8(sp)
    800062a0:	00013903          	ld	s2,0(sp)
    800062a4:	02010113          	addi	sp,sp,32
    800062a8:	00008067          	ret

00000000800062ac <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800062ac:	fe010113          	addi	sp,sp,-32
    800062b0:	00113c23          	sd	ra,24(sp)
    800062b4:	00813823          	sd	s0,16(sp)
    800062b8:	00913423          	sd	s1,8(sp)
    800062bc:	01213023          	sd	s2,0(sp)
    800062c0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800062c4:	00000493          	li	s1,0
    800062c8:	0400006f          	j	80006308 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800062cc:	00005517          	auipc	a0,0x5
    800062d0:	27450513          	addi	a0,a0,628 # 8000b540 <CONSOLE_STATUS+0x530>
    800062d4:	00001097          	auipc	ra,0x1
    800062d8:	468080e7          	jalr	1128(ra) # 8000773c <_Z11printStringPKc>
    800062dc:	00000613          	li	a2,0
    800062e0:	00a00593          	li	a1,10
    800062e4:	00048513          	mv	a0,s1
    800062e8:	00001097          	auipc	ra,0x1
    800062ec:	604080e7          	jalr	1540(ra) # 800078ec <_Z8printIntiii>
    800062f0:	00005517          	auipc	a0,0x5
    800062f4:	4e050513          	addi	a0,a0,1248 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    800062f8:	00001097          	auipc	ra,0x1
    800062fc:	444080e7          	jalr	1092(ra) # 8000773c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006300:	0014849b          	addiw	s1,s1,1
    80006304:	0ff4f493          	andi	s1,s1,255
    80006308:	00200793          	li	a5,2
    8000630c:	fc97f0e3          	bgeu	a5,s1,800062cc <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006310:	00005517          	auipc	a0,0x5
    80006314:	23850513          	addi	a0,a0,568 # 8000b548 <CONSOLE_STATUS+0x538>
    80006318:	00001097          	auipc	ra,0x1
    8000631c:	424080e7          	jalr	1060(ra) # 8000773c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006320:	00700313          	li	t1,7
    thread_dispatch();
    80006324:	ffffb097          	auipc	ra,0xffffb
    80006328:	604080e7          	jalr	1540(ra) # 80001928 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000632c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006330:	00005517          	auipc	a0,0x5
    80006334:	22850513          	addi	a0,a0,552 # 8000b558 <CONSOLE_STATUS+0x548>
    80006338:	00001097          	auipc	ra,0x1
    8000633c:	404080e7          	jalr	1028(ra) # 8000773c <_Z11printStringPKc>
    80006340:	00000613          	li	a2,0
    80006344:	00a00593          	li	a1,10
    80006348:	0009051b          	sext.w	a0,s2
    8000634c:	00001097          	auipc	ra,0x1
    80006350:	5a0080e7          	jalr	1440(ra) # 800078ec <_Z8printIntiii>
    80006354:	00005517          	auipc	a0,0x5
    80006358:	47c50513          	addi	a0,a0,1148 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    8000635c:	00001097          	auipc	ra,0x1
    80006360:	3e0080e7          	jalr	992(ra) # 8000773c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006364:	00c00513          	li	a0,12
    80006368:	00000097          	auipc	ra,0x0
    8000636c:	d88080e7          	jalr	-632(ra) # 800060f0 <_ZL9fibonaccim>
    80006370:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006374:	00005517          	auipc	a0,0x5
    80006378:	1ec50513          	addi	a0,a0,492 # 8000b560 <CONSOLE_STATUS+0x550>
    8000637c:	00001097          	auipc	ra,0x1
    80006380:	3c0080e7          	jalr	960(ra) # 8000773c <_Z11printStringPKc>
    80006384:	00000613          	li	a2,0
    80006388:	00a00593          	li	a1,10
    8000638c:	0009051b          	sext.w	a0,s2
    80006390:	00001097          	auipc	ra,0x1
    80006394:	55c080e7          	jalr	1372(ra) # 800078ec <_Z8printIntiii>
    80006398:	00005517          	auipc	a0,0x5
    8000639c:	43850513          	addi	a0,a0,1080 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    800063a0:	00001097          	auipc	ra,0x1
    800063a4:	39c080e7          	jalr	924(ra) # 8000773c <_Z11printStringPKc>
    800063a8:	0400006f          	j	800063e8 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800063ac:	00005517          	auipc	a0,0x5
    800063b0:	19450513          	addi	a0,a0,404 # 8000b540 <CONSOLE_STATUS+0x530>
    800063b4:	00001097          	auipc	ra,0x1
    800063b8:	388080e7          	jalr	904(ra) # 8000773c <_Z11printStringPKc>
    800063bc:	00000613          	li	a2,0
    800063c0:	00a00593          	li	a1,10
    800063c4:	00048513          	mv	a0,s1
    800063c8:	00001097          	auipc	ra,0x1
    800063cc:	524080e7          	jalr	1316(ra) # 800078ec <_Z8printIntiii>
    800063d0:	00005517          	auipc	a0,0x5
    800063d4:	40050513          	addi	a0,a0,1024 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    800063d8:	00001097          	auipc	ra,0x1
    800063dc:	364080e7          	jalr	868(ra) # 8000773c <_Z11printStringPKc>
    for (; i < 6; i++) {
    800063e0:	0014849b          	addiw	s1,s1,1
    800063e4:	0ff4f493          	andi	s1,s1,255
    800063e8:	00500793          	li	a5,5
    800063ec:	fc97f0e3          	bgeu	a5,s1,800063ac <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    800063f0:	00005517          	auipc	a0,0x5
    800063f4:	18050513          	addi	a0,a0,384 # 8000b570 <CONSOLE_STATUS+0x560>
    800063f8:	00001097          	auipc	ra,0x1
    800063fc:	344080e7          	jalr	836(ra) # 8000773c <_Z11printStringPKc>
    finishedC = true;
    80006400:	00100793          	li	a5,1
    80006404:	00008717          	auipc	a4,0x8
    80006408:	bcf708a3          	sb	a5,-1071(a4) # 8000dfd5 <_ZL9finishedC>
    thread_dispatch();
    8000640c:	ffffb097          	auipc	ra,0xffffb
    80006410:	51c080e7          	jalr	1308(ra) # 80001928 <_Z15thread_dispatchv>
}
    80006414:	01813083          	ld	ra,24(sp)
    80006418:	01013403          	ld	s0,16(sp)
    8000641c:	00813483          	ld	s1,8(sp)
    80006420:	00013903          	ld	s2,0(sp)
    80006424:	02010113          	addi	sp,sp,32
    80006428:	00008067          	ret

000000008000642c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000642c:	fe010113          	addi	sp,sp,-32
    80006430:	00113c23          	sd	ra,24(sp)
    80006434:	00813823          	sd	s0,16(sp)
    80006438:	00913423          	sd	s1,8(sp)
    8000643c:	01213023          	sd	s2,0(sp)
    80006440:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006444:	00000913          	li	s2,0
    80006448:	0080006f          	j	80006450 <_ZL11workerBodyBPv+0x24>
    8000644c:	00190913          	addi	s2,s2,1
    80006450:	00f00793          	li	a5,15
    80006454:	0527ea63          	bltu	a5,s2,800064a8 <_ZL11workerBodyBPv+0x7c>
        printString("B: i="); printInt(i); printString("\n");
    80006458:	00005517          	auipc	a0,0x5
    8000645c:	12850513          	addi	a0,a0,296 # 8000b580 <CONSOLE_STATUS+0x570>
    80006460:	00001097          	auipc	ra,0x1
    80006464:	2dc080e7          	jalr	732(ra) # 8000773c <_Z11printStringPKc>
    80006468:	00000613          	li	a2,0
    8000646c:	00a00593          	li	a1,10
    80006470:	0009051b          	sext.w	a0,s2
    80006474:	00001097          	auipc	ra,0x1
    80006478:	478080e7          	jalr	1144(ra) # 800078ec <_Z8printIntiii>
    8000647c:	00005517          	auipc	a0,0x5
    80006480:	35450513          	addi	a0,a0,852 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006484:	00001097          	auipc	ra,0x1
    80006488:	2b8080e7          	jalr	696(ra) # 8000773c <_Z11printStringPKc>
        for (uint64 j = 0; j < 1000; j++) {
    8000648c:	00000493          	li	s1,0
    80006490:	3e700793          	li	a5,999
    80006494:	fa97ece3          	bltu	a5,s1,8000644c <_ZL11workerBodyBPv+0x20>
            thread_dispatch();
    80006498:	ffffb097          	auipc	ra,0xffffb
    8000649c:	490080e7          	jalr	1168(ra) # 80001928 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 1000; j++) {
    800064a0:	00148493          	addi	s1,s1,1
    800064a4:	fedff06f          	j	80006490 <_ZL11workerBodyBPv+0x64>
    printString("B finished!\n");
    800064a8:	00005517          	auipc	a0,0x5
    800064ac:	0e050513          	addi	a0,a0,224 # 8000b588 <CONSOLE_STATUS+0x578>
    800064b0:	00001097          	auipc	ra,0x1
    800064b4:	28c080e7          	jalr	652(ra) # 8000773c <_Z11printStringPKc>
    finishedB = true;
    800064b8:	00100793          	li	a5,1
    800064bc:	00008717          	auipc	a4,0x8
    800064c0:	b0f70d23          	sb	a5,-1254(a4) # 8000dfd6 <_ZL9finishedB>
    thread_dispatch();
    800064c4:	ffffb097          	auipc	ra,0xffffb
    800064c8:	464080e7          	jalr	1124(ra) # 80001928 <_Z15thread_dispatchv>
}
    800064cc:	01813083          	ld	ra,24(sp)
    800064d0:	01013403          	ld	s0,16(sp)
    800064d4:	00813483          	ld	s1,8(sp)
    800064d8:	00013903          	ld	s2,0(sp)
    800064dc:	02010113          	addi	sp,sp,32
    800064e0:	00008067          	ret

00000000800064e4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800064e4:	fe010113          	addi	sp,sp,-32
    800064e8:	00113c23          	sd	ra,24(sp)
    800064ec:	00813823          	sd	s0,16(sp)
    800064f0:	00913423          	sd	s1,8(sp)
    800064f4:	01213023          	sd	s2,0(sp)
    800064f8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800064fc:	00000913          	li	s2,0
    80006500:	0080006f          	j	80006508 <_ZL11workerBodyAPv+0x24>
    80006504:	00190913          	addi	s2,s2,1
    80006508:	00900793          	li	a5,9
    8000650c:	0527ea63          	bltu	a5,s2,80006560 <_ZL11workerBodyAPv+0x7c>
        printString("A: i="); printInt(i); printString("\n");
    80006510:	00005517          	auipc	a0,0x5
    80006514:	08850513          	addi	a0,a0,136 # 8000b598 <CONSOLE_STATUS+0x588>
    80006518:	00001097          	auipc	ra,0x1
    8000651c:	224080e7          	jalr	548(ra) # 8000773c <_Z11printStringPKc>
    80006520:	00000613          	li	a2,0
    80006524:	00a00593          	li	a1,10
    80006528:	0009051b          	sext.w	a0,s2
    8000652c:	00001097          	auipc	ra,0x1
    80006530:	3c0080e7          	jalr	960(ra) # 800078ec <_Z8printIntiii>
    80006534:	00005517          	auipc	a0,0x5
    80006538:	29c50513          	addi	a0,a0,668 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    8000653c:	00001097          	auipc	ra,0x1
    80006540:	200080e7          	jalr	512(ra) # 8000773c <_Z11printStringPKc>
        for (uint64 j = 0; j < 1000; j++) {
    80006544:	00000493          	li	s1,0
    80006548:	3e700793          	li	a5,999
    8000654c:	fa97ece3          	bltu	a5,s1,80006504 <_ZL11workerBodyAPv+0x20>
            thread_dispatch();
    80006550:	ffffb097          	auipc	ra,0xffffb
    80006554:	3d8080e7          	jalr	984(ra) # 80001928 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 1000; j++) {
    80006558:	00148493          	addi	s1,s1,1
    8000655c:	fedff06f          	j	80006548 <_ZL11workerBodyAPv+0x64>
    printString("A finished!\n");
    80006560:	00005517          	auipc	a0,0x5
    80006564:	04050513          	addi	a0,a0,64 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80006568:	00001097          	auipc	ra,0x1
    8000656c:	1d4080e7          	jalr	468(ra) # 8000773c <_Z11printStringPKc>
    finishedA = true;
    80006570:	00100793          	li	a5,1
    80006574:	00008717          	auipc	a4,0x8
    80006578:	a6f701a3          	sb	a5,-1437(a4) # 8000dfd7 <_ZL9finishedA>
}
    8000657c:	01813083          	ld	ra,24(sp)
    80006580:	01013403          	ld	s0,16(sp)
    80006584:	00813483          	ld	s1,8(sp)
    80006588:	00013903          	ld	s2,0(sp)
    8000658c:	02010113          	addi	sp,sp,32
    80006590:	00008067          	ret

0000000080006594 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80006594:	fd010113          	addi	sp,sp,-48
    80006598:	02113423          	sd	ra,40(sp)
    8000659c:	02813023          	sd	s0,32(sp)
    800065a0:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800065a4:	00000613          	li	a2,0
    800065a8:	00000597          	auipc	a1,0x0
    800065ac:	f3c58593          	addi	a1,a1,-196 # 800064e4 <_ZL11workerBodyAPv>
    800065b0:	fd040513          	addi	a0,s0,-48
    800065b4:	ffffb097          	auipc	ra,0xffffb
    800065b8:	2d8080e7          	jalr	728(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800065bc:	00005517          	auipc	a0,0x5
    800065c0:	ff450513          	addi	a0,a0,-12 # 8000b5b0 <CONSOLE_STATUS+0x5a0>
    800065c4:	00001097          	auipc	ra,0x1
    800065c8:	178080e7          	jalr	376(ra) # 8000773c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800065cc:	00000613          	li	a2,0
    800065d0:	00000597          	auipc	a1,0x0
    800065d4:	e5c58593          	addi	a1,a1,-420 # 8000642c <_ZL11workerBodyBPv>
    800065d8:	fd840513          	addi	a0,s0,-40
    800065dc:	ffffb097          	auipc	ra,0xffffb
    800065e0:	2b0080e7          	jalr	688(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    800065e4:	00005517          	auipc	a0,0x5
    800065e8:	fe450513          	addi	a0,a0,-28 # 8000b5c8 <CONSOLE_STATUS+0x5b8>
    800065ec:	00001097          	auipc	ra,0x1
    800065f0:	150080e7          	jalr	336(ra) # 8000773c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800065f4:	00000613          	li	a2,0
    800065f8:	00000597          	auipc	a1,0x0
    800065fc:	cb458593          	addi	a1,a1,-844 # 800062ac <_ZL11workerBodyCPv>
    80006600:	fe040513          	addi	a0,s0,-32
    80006604:	ffffb097          	auipc	ra,0xffffb
    80006608:	288080e7          	jalr	648(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    8000660c:	00005517          	auipc	a0,0x5
    80006610:	fd450513          	addi	a0,a0,-44 # 8000b5e0 <CONSOLE_STATUS+0x5d0>
    80006614:	00001097          	auipc	ra,0x1
    80006618:	128080e7          	jalr	296(ra) # 8000773c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000661c:	00000613          	li	a2,0
    80006620:	00000597          	auipc	a1,0x0
    80006624:	b4458593          	addi	a1,a1,-1212 # 80006164 <_ZL11workerBodyDPv>
    80006628:	fe840513          	addi	a0,s0,-24
    8000662c:	ffffb097          	auipc	ra,0xffffb
    80006630:	260080e7          	jalr	608(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006634:	00005517          	auipc	a0,0x5
    80006638:	fc450513          	addi	a0,a0,-60 # 8000b5f8 <CONSOLE_STATUS+0x5e8>
    8000663c:	00001097          	auipc	ra,0x1
    80006640:	100080e7          	jalr	256(ra) # 8000773c <_Z11printStringPKc>
    80006644:	00c0006f          	j	80006650 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006648:	ffffb097          	auipc	ra,0xffffb
    8000664c:	2e0080e7          	jalr	736(ra) # 80001928 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006650:	00008797          	auipc	a5,0x8
    80006654:	9877c783          	lbu	a5,-1657(a5) # 8000dfd7 <_ZL9finishedA>
    80006658:	fe0788e3          	beqz	a5,80006648 <_Z18Threads_C_API_testv+0xb4>
    8000665c:	00008797          	auipc	a5,0x8
    80006660:	97a7c783          	lbu	a5,-1670(a5) # 8000dfd6 <_ZL9finishedB>
    80006664:	fe0782e3          	beqz	a5,80006648 <_Z18Threads_C_API_testv+0xb4>
    80006668:	00008797          	auipc	a5,0x8
    8000666c:	96d7c783          	lbu	a5,-1683(a5) # 8000dfd5 <_ZL9finishedC>
    80006670:	fc078ce3          	beqz	a5,80006648 <_Z18Threads_C_API_testv+0xb4>
    80006674:	00008797          	auipc	a5,0x8
    80006678:	9607c783          	lbu	a5,-1696(a5) # 8000dfd4 <_ZL9finishedD>
    8000667c:	fc0786e3          	beqz	a5,80006648 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80006680:	02813083          	ld	ra,40(sp)
    80006684:	02013403          	ld	s0,32(sp)
    80006688:	03010113          	addi	sp,sp,48
    8000668c:	00008067          	ret

0000000080006690 <_ZL9sleepyRunPv>:

#include "../test_h/printing.h"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006690:	fe010113          	addi	sp,sp,-32
    80006694:	00113c23          	sd	ra,24(sp)
    80006698:	00813823          	sd	s0,16(sp)
    8000669c:	00913423          	sd	s1,8(sp)
    800066a0:	01213023          	sd	s2,0(sp)
    800066a4:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800066a8:	00053903          	ld	s2,0(a0)
    int i = 6;
    800066ac:	00600493          	li	s1,6
    while (--i > 0) {
    800066b0:	fff4849b          	addiw	s1,s1,-1
    800066b4:	04905a63          	blez	s1,80006708 <_ZL9sleepyRunPv+0x78>

        printString("Hello ");
    800066b8:	00005517          	auipc	a0,0x5
    800066bc:	f5850513          	addi	a0,a0,-168 # 8000b610 <CONSOLE_STATUS+0x600>
    800066c0:	00001097          	auipc	ra,0x1
    800066c4:	07c080e7          	jalr	124(ra) # 8000773c <_Z11printStringPKc>
        printInt(sleep_time);
    800066c8:	00000613          	li	a2,0
    800066cc:	00a00593          	li	a1,10
    800066d0:	0009051b          	sext.w	a0,s2
    800066d4:	00001097          	auipc	ra,0x1
    800066d8:	218080e7          	jalr	536(ra) # 800078ec <_Z8printIntiii>
        printString(" !\n");
    800066dc:	00005517          	auipc	a0,0x5
    800066e0:	f3c50513          	addi	a0,a0,-196 # 8000b618 <CONSOLE_STATUS+0x608>
    800066e4:	00001097          	auipc	ra,0x1
    800066e8:	058080e7          	jalr	88(ra) # 8000773c <_Z11printStringPKc>
        time_sleep(sleep_time);
    800066ec:	00090513          	mv	a0,s2
    800066f0:	ffffb097          	auipc	ra,0xffffb
    800066f4:	27c080e7          	jalr	636(ra) # 8000196c <_Z10time_sleepm>
        putc('.');
    800066f8:	02e00513          	li	a0,46
    800066fc:	ffffb097          	auipc	ra,0xffffb
    80006700:	380080e7          	jalr	896(ra) # 80001a7c <_Z4putcc>
    while (--i > 0) {
    80006704:	fadff06f          	j	800066b0 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/100-1] = true;
    80006708:	06400793          	li	a5,100
    8000670c:	02f95933          	divu	s2,s2,a5
    80006710:	fff90913          	addi	s2,s2,-1
    80006714:	00008797          	auipc	a5,0x8
    80006718:	8c478793          	addi	a5,a5,-1852 # 8000dfd8 <_ZL8finished>
    8000671c:	01278933          	add	s2,a5,s2
    80006720:	00100793          	li	a5,1
    80006724:	00f90023          	sb	a5,0(s2)
}
    80006728:	01813083          	ld	ra,24(sp)
    8000672c:	01013403          	ld	s0,16(sp)
    80006730:	00813483          	ld	s1,8(sp)
    80006734:	00013903          	ld	s2,0(sp)
    80006738:	02010113          	addi	sp,sp,32
    8000673c:	00008067          	ret

0000000080006740 <_Z12testSleepingv>:

void testSleeping() {
    80006740:	fc010113          	addi	sp,sp,-64
    80006744:	02113c23          	sd	ra,56(sp)
    80006748:	02813823          	sd	s0,48(sp)
    8000674c:	02913423          	sd	s1,40(sp)
    80006750:	04010413          	addi	s0,sp,64
    printString("Starting...\n");
    80006754:	00005517          	auipc	a0,0x5
    80006758:	ecc50513          	addi	a0,a0,-308 # 8000b620 <CONSOLE_STATUS+0x610>
    8000675c:	00001097          	auipc	ra,0x1
    80006760:	fe0080e7          	jalr	-32(ra) # 8000773c <_Z11printStringPKc>
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {100, 200};
    80006764:	06400793          	li	a5,100
    80006768:	fcf43823          	sd	a5,-48(s0)
    8000676c:	0c800793          	li	a5,200
    80006770:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    printString("Creating threads: ");
    80006774:	00005517          	auipc	a0,0x5
    80006778:	ebc50513          	addi	a0,a0,-324 # 8000b630 <CONSOLE_STATUS+0x620>
    8000677c:	00001097          	auipc	ra,0x1
    80006780:	fc0080e7          	jalr	-64(ra) # 8000773c <_Z11printStringPKc>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006784:	00000493          	li	s1,0
    80006788:	0500006f          	j	800067d8 <_Z12testSleepingv+0x98>
        printInt(i);
    8000678c:	00000613          	li	a2,0
    80006790:	00a00593          	li	a1,10
    80006794:	00048513          	mv	a0,s1
    80006798:	00001097          	auipc	ra,0x1
    8000679c:	154080e7          	jalr	340(ra) # 800078ec <_Z8printIntiii>
        printString(" ");
    800067a0:	00005517          	auipc	a0,0x5
    800067a4:	ea850513          	addi	a0,a0,-344 # 8000b648 <CONSOLE_STATUS+0x638>
    800067a8:	00001097          	auipc	ra,0x1
    800067ac:	f94080e7          	jalr	-108(ra) # 8000773c <_Z11printStringPKc>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800067b0:	00349793          	slli	a5,s1,0x3
    800067b4:	fd040613          	addi	a2,s0,-48
    800067b8:	00f60633          	add	a2,a2,a5
    800067bc:	00000597          	auipc	a1,0x0
    800067c0:	ed458593          	addi	a1,a1,-300 # 80006690 <_ZL9sleepyRunPv>
    800067c4:	fc040513          	addi	a0,s0,-64
    800067c8:	00f50533          	add	a0,a0,a5
    800067cc:	ffffb097          	auipc	ra,0xffffb
    800067d0:	0c0080e7          	jalr	192(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800067d4:	0014849b          	addiw	s1,s1,1
    800067d8:	00100793          	li	a5,1
    800067dc:	fa97d8e3          	bge	a5,s1,8000678c <_Z12testSleepingv+0x4c>
    }
    printString("\nSuccesfully created all threads, now waiting for them to end\n");
    800067e0:	00005517          	auipc	a0,0x5
    800067e4:	e7050513          	addi	a0,a0,-400 # 8000b650 <CONSOLE_STATUS+0x640>
    800067e8:	00001097          	auipc	ra,0x1
    800067ec:	f54080e7          	jalr	-172(ra) # 8000773c <_Z11printStringPKc>
    800067f0:	00c0006f          	j	800067fc <_Z12testSleepingv+0xbc>
    while (!(finished[0] && finished[1])) {thread_dispatch();}
    800067f4:	ffffb097          	auipc	ra,0xffffb
    800067f8:	134080e7          	jalr	308(ra) # 80001928 <_Z15thread_dispatchv>
    800067fc:	00007797          	auipc	a5,0x7
    80006800:	7dc7c783          	lbu	a5,2012(a5) # 8000dfd8 <_ZL8finished>
    80006804:	fe0788e3          	beqz	a5,800067f4 <_Z12testSleepingv+0xb4>
    80006808:	00007797          	auipc	a5,0x7
    8000680c:	7d17c783          	lbu	a5,2001(a5) # 8000dfd9 <_ZL8finished+0x1>
    80006810:	fe0782e3          	beqz	a5,800067f4 <_Z12testSleepingv+0xb4>
}
    80006814:	03813083          	ld	ra,56(sp)
    80006818:	03013403          	ld	s0,48(sp)
    8000681c:	02813483          	ld	s1,40(sp)
    80006820:	04010113          	addi	sp,sp,64
    80006824:	00008067          	ret

0000000080006828 <_ZN9BufferCPPC1Ei>:
#include "../test_h/buffer_CPP_API.h"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006828:	fd010113          	addi	sp,sp,-48
    8000682c:	02113423          	sd	ra,40(sp)
    80006830:	02813023          	sd	s0,32(sp)
    80006834:	00913c23          	sd	s1,24(sp)
    80006838:	01213823          	sd	s2,16(sp)
    8000683c:	01313423          	sd	s3,8(sp)
    80006840:	03010413          	addi	s0,sp,48
    80006844:	00050493          	mv	s1,a0
    80006848:	00058913          	mv	s2,a1
    8000684c:	0015879b          	addiw	a5,a1,1
    80006850:	0007851b          	sext.w	a0,a5
    80006854:	00f4a023          	sw	a5,0(s1)
    80006858:	0004a823          	sw	zero,16(s1)
    8000685c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006860:	00251513          	slli	a0,a0,0x2
    80006864:	ffffb097          	auipc	ra,0xffffb
    80006868:	fcc080e7          	jalr	-52(ra) # 80001830 <_Z9mem_allocm>
    8000686c:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006870:	01000513          	li	a0,16
    80006874:	ffffb097          	auipc	ra,0xffffb
    80006878:	948080e7          	jalr	-1720(ra) # 800011bc <_Znwm>
    8000687c:	00050993          	mv	s3,a0
    80006880:	00000593          	li	a1,0
    80006884:	ffffb097          	auipc	ra,0xffffb
    80006888:	b50080e7          	jalr	-1200(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    8000688c:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006890:	01000513          	li	a0,16
    80006894:	ffffb097          	auipc	ra,0xffffb
    80006898:	928080e7          	jalr	-1752(ra) # 800011bc <_Znwm>
    8000689c:	00050993          	mv	s3,a0
    800068a0:	00090593          	mv	a1,s2
    800068a4:	ffffb097          	auipc	ra,0xffffb
    800068a8:	b30080e7          	jalr	-1232(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800068ac:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800068b0:	01000513          	li	a0,16
    800068b4:	ffffb097          	auipc	ra,0xffffb
    800068b8:	908080e7          	jalr	-1784(ra) # 800011bc <_Znwm>
    800068bc:	00050913          	mv	s2,a0
    800068c0:	00100593          	li	a1,1
    800068c4:	ffffb097          	auipc	ra,0xffffb
    800068c8:	b10080e7          	jalr	-1264(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800068cc:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800068d0:	01000513          	li	a0,16
    800068d4:	ffffb097          	auipc	ra,0xffffb
    800068d8:	8e8080e7          	jalr	-1816(ra) # 800011bc <_Znwm>
    800068dc:	00050913          	mv	s2,a0
    800068e0:	00100593          	li	a1,1
    800068e4:	ffffb097          	auipc	ra,0xffffb
    800068e8:	af0080e7          	jalr	-1296(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800068ec:	0324b823          	sd	s2,48(s1)
}
    800068f0:	02813083          	ld	ra,40(sp)
    800068f4:	02013403          	ld	s0,32(sp)
    800068f8:	01813483          	ld	s1,24(sp)
    800068fc:	01013903          	ld	s2,16(sp)
    80006900:	00813983          	ld	s3,8(sp)
    80006904:	03010113          	addi	sp,sp,48
    80006908:	00008067          	ret
    8000690c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006910:	00098513          	mv	a0,s3
    80006914:	ffffb097          	auipc	ra,0xffffb
    80006918:	8d0080e7          	jalr	-1840(ra) # 800011e4 <_ZdlPv>
    8000691c:	00048513          	mv	a0,s1
    80006920:	00008097          	auipc	ra,0x8
    80006924:	7a8080e7          	jalr	1960(ra) # 8000f0c8 <_Unwind_Resume>
    80006928:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    8000692c:	00098513          	mv	a0,s3
    80006930:	ffffb097          	auipc	ra,0xffffb
    80006934:	8b4080e7          	jalr	-1868(ra) # 800011e4 <_ZdlPv>
    80006938:	00048513          	mv	a0,s1
    8000693c:	00008097          	auipc	ra,0x8
    80006940:	78c080e7          	jalr	1932(ra) # 8000f0c8 <_Unwind_Resume>
    80006944:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006948:	00090513          	mv	a0,s2
    8000694c:	ffffb097          	auipc	ra,0xffffb
    80006950:	898080e7          	jalr	-1896(ra) # 800011e4 <_ZdlPv>
    80006954:	00048513          	mv	a0,s1
    80006958:	00008097          	auipc	ra,0x8
    8000695c:	770080e7          	jalr	1904(ra) # 8000f0c8 <_Unwind_Resume>
    80006960:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006964:	00090513          	mv	a0,s2
    80006968:	ffffb097          	auipc	ra,0xffffb
    8000696c:	87c080e7          	jalr	-1924(ra) # 800011e4 <_ZdlPv>
    80006970:	00048513          	mv	a0,s1
    80006974:	00008097          	auipc	ra,0x8
    80006978:	754080e7          	jalr	1876(ra) # 8000f0c8 <_Unwind_Resume>

000000008000697c <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    8000697c:	fe010113          	addi	sp,sp,-32
    80006980:	00113c23          	sd	ra,24(sp)
    80006984:	00813823          	sd	s0,16(sp)
    80006988:	00913423          	sd	s1,8(sp)
    8000698c:	01213023          	sd	s2,0(sp)
    80006990:	02010413          	addi	s0,sp,32
    80006994:	00050493          	mv	s1,a0
    80006998:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    8000699c:	01853503          	ld	a0,24(a0)
    800069a0:	ffffb097          	auipc	ra,0xffffb
    800069a4:	a6c080e7          	jalr	-1428(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800069a8:	0304b503          	ld	a0,48(s1)
    800069ac:	ffffb097          	auipc	ra,0xffffb
    800069b0:	a60080e7          	jalr	-1440(ra) # 8000140c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800069b4:	0084b783          	ld	a5,8(s1)
    800069b8:	0144a703          	lw	a4,20(s1)
    800069bc:	00271713          	slli	a4,a4,0x2
    800069c0:	00e787b3          	add	a5,a5,a4
    800069c4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800069c8:	0144a783          	lw	a5,20(s1)
    800069cc:	0017879b          	addiw	a5,a5,1
    800069d0:	0004a703          	lw	a4,0(s1)
    800069d4:	02e7e7bb          	remw	a5,a5,a4
    800069d8:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800069dc:	0304b503          	ld	a0,48(s1)
    800069e0:	ffffb097          	auipc	ra,0xffffb
    800069e4:	a58080e7          	jalr	-1448(ra) # 80001438 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    800069e8:	0204b503          	ld	a0,32(s1)
    800069ec:	ffffb097          	auipc	ra,0xffffb
    800069f0:	a4c080e7          	jalr	-1460(ra) # 80001438 <_ZN9Semaphore6signalEv>

}
    800069f4:	01813083          	ld	ra,24(sp)
    800069f8:	01013403          	ld	s0,16(sp)
    800069fc:	00813483          	ld	s1,8(sp)
    80006a00:	00013903          	ld	s2,0(sp)
    80006a04:	02010113          	addi	sp,sp,32
    80006a08:	00008067          	ret

0000000080006a0c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006a0c:	fe010113          	addi	sp,sp,-32
    80006a10:	00113c23          	sd	ra,24(sp)
    80006a14:	00813823          	sd	s0,16(sp)
    80006a18:	00913423          	sd	s1,8(sp)
    80006a1c:	01213023          	sd	s2,0(sp)
    80006a20:	02010413          	addi	s0,sp,32
    80006a24:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006a28:	02053503          	ld	a0,32(a0)
    80006a2c:	ffffb097          	auipc	ra,0xffffb
    80006a30:	9e0080e7          	jalr	-1568(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006a34:	0284b503          	ld	a0,40(s1)
    80006a38:	ffffb097          	auipc	ra,0xffffb
    80006a3c:	9d4080e7          	jalr	-1580(ra) # 8000140c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006a40:	0084b703          	ld	a4,8(s1)
    80006a44:	0104a783          	lw	a5,16(s1)
    80006a48:	00279693          	slli	a3,a5,0x2
    80006a4c:	00d70733          	add	a4,a4,a3
    80006a50:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006a54:	0017879b          	addiw	a5,a5,1
    80006a58:	0004a703          	lw	a4,0(s1)
    80006a5c:	02e7e7bb          	remw	a5,a5,a4
    80006a60:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006a64:	0284b503          	ld	a0,40(s1)
    80006a68:	ffffb097          	auipc	ra,0xffffb
    80006a6c:	9d0080e7          	jalr	-1584(ra) # 80001438 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006a70:	0184b503          	ld	a0,24(s1)
    80006a74:	ffffb097          	auipc	ra,0xffffb
    80006a78:	9c4080e7          	jalr	-1596(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006a7c:	00090513          	mv	a0,s2
    80006a80:	01813083          	ld	ra,24(sp)
    80006a84:	01013403          	ld	s0,16(sp)
    80006a88:	00813483          	ld	s1,8(sp)
    80006a8c:	00013903          	ld	s2,0(sp)
    80006a90:	02010113          	addi	sp,sp,32
    80006a94:	00008067          	ret

0000000080006a98 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006a98:	fe010113          	addi	sp,sp,-32
    80006a9c:	00113c23          	sd	ra,24(sp)
    80006aa0:	00813823          	sd	s0,16(sp)
    80006aa4:	00913423          	sd	s1,8(sp)
    80006aa8:	01213023          	sd	s2,0(sp)
    80006aac:	02010413          	addi	s0,sp,32
    80006ab0:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006ab4:	02853503          	ld	a0,40(a0)
    80006ab8:	ffffb097          	auipc	ra,0xffffb
    80006abc:	954080e7          	jalr	-1708(ra) # 8000140c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006ac0:	0304b503          	ld	a0,48(s1)
    80006ac4:	ffffb097          	auipc	ra,0xffffb
    80006ac8:	948080e7          	jalr	-1720(ra) # 8000140c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006acc:	0144a783          	lw	a5,20(s1)
    80006ad0:	0104a903          	lw	s2,16(s1)
    80006ad4:	0327ce63          	blt	a5,s2,80006b10 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006ad8:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006adc:	0304b503          	ld	a0,48(s1)
    80006ae0:	ffffb097          	auipc	ra,0xffffb
    80006ae4:	958080e7          	jalr	-1704(ra) # 80001438 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006ae8:	0284b503          	ld	a0,40(s1)
    80006aec:	ffffb097          	auipc	ra,0xffffb
    80006af0:	94c080e7          	jalr	-1716(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006af4:	00090513          	mv	a0,s2
    80006af8:	01813083          	ld	ra,24(sp)
    80006afc:	01013403          	ld	s0,16(sp)
    80006b00:	00813483          	ld	s1,8(sp)
    80006b04:	00013903          	ld	s2,0(sp)
    80006b08:	02010113          	addi	sp,sp,32
    80006b0c:	00008067          	ret
        ret = cap - head + tail;
    80006b10:	0004a703          	lw	a4,0(s1)
    80006b14:	4127093b          	subw	s2,a4,s2
    80006b18:	00f9093b          	addw	s2,s2,a5
    80006b1c:	fc1ff06f          	j	80006adc <_ZN9BufferCPP6getCntEv+0x44>

0000000080006b20 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006b20:	fe010113          	addi	sp,sp,-32
    80006b24:	00113c23          	sd	ra,24(sp)
    80006b28:	00813823          	sd	s0,16(sp)
    80006b2c:	00913423          	sd	s1,8(sp)
    80006b30:	02010413          	addi	s0,sp,32
    80006b34:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006b38:	00a00513          	li	a0,10
    80006b3c:	ffffc097          	auipc	ra,0xffffc
    80006b40:	a48080e7          	jalr	-1464(ra) # 80002584 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006b44:	00005517          	auipc	a0,0x5
    80006b48:	8c450513          	addi	a0,a0,-1852 # 8000b408 <CONSOLE_STATUS+0x3f8>
    80006b4c:	00001097          	auipc	ra,0x1
    80006b50:	bf0080e7          	jalr	-1040(ra) # 8000773c <_Z11printStringPKc>
    while (getCnt()) {
    80006b54:	00048513          	mv	a0,s1
    80006b58:	00000097          	auipc	ra,0x0
    80006b5c:	f40080e7          	jalr	-192(ra) # 80006a98 <_ZN9BufferCPP6getCntEv>
    80006b60:	02050c63          	beqz	a0,80006b98 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006b64:	0084b783          	ld	a5,8(s1)
    80006b68:	0104a703          	lw	a4,16(s1)
    80006b6c:	00271713          	slli	a4,a4,0x2
    80006b70:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006b74:	0007c503          	lbu	a0,0(a5)
    80006b78:	ffffc097          	auipc	ra,0xffffc
    80006b7c:	a0c080e7          	jalr	-1524(ra) # 80002584 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006b80:	0104a783          	lw	a5,16(s1)
    80006b84:	0017879b          	addiw	a5,a5,1
    80006b88:	0004a703          	lw	a4,0(s1)
    80006b8c:	02e7e7bb          	remw	a5,a5,a4
    80006b90:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006b94:	fc1ff06f          	j	80006b54 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006b98:	02100513          	li	a0,33
    80006b9c:	ffffc097          	auipc	ra,0xffffc
    80006ba0:	9e8080e7          	jalr	-1560(ra) # 80002584 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006ba4:	00a00513          	li	a0,10
    80006ba8:	ffffc097          	auipc	ra,0xffffc
    80006bac:	9dc080e7          	jalr	-1572(ra) # 80002584 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006bb0:	0084b503          	ld	a0,8(s1)
    80006bb4:	ffffb097          	auipc	ra,0xffffb
    80006bb8:	cac080e7          	jalr	-852(ra) # 80001860 <_Z8mem_freePv>
    delete itemAvailable;
    80006bbc:	0204b503          	ld	a0,32(s1)
    80006bc0:	00050863          	beqz	a0,80006bd0 <_ZN9BufferCPPD1Ev+0xb0>
    80006bc4:	00053783          	ld	a5,0(a0)
    80006bc8:	0087b783          	ld	a5,8(a5)
    80006bcc:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006bd0:	0184b503          	ld	a0,24(s1)
    80006bd4:	00050863          	beqz	a0,80006be4 <_ZN9BufferCPPD1Ev+0xc4>
    80006bd8:	00053783          	ld	a5,0(a0)
    80006bdc:	0087b783          	ld	a5,8(a5)
    80006be0:	000780e7          	jalr	a5
    delete mutexTail;
    80006be4:	0304b503          	ld	a0,48(s1)
    80006be8:	00050863          	beqz	a0,80006bf8 <_ZN9BufferCPPD1Ev+0xd8>
    80006bec:	00053783          	ld	a5,0(a0)
    80006bf0:	0087b783          	ld	a5,8(a5)
    80006bf4:	000780e7          	jalr	a5
    delete mutexHead;
    80006bf8:	0284b503          	ld	a0,40(s1)
    80006bfc:	00050863          	beqz	a0,80006c0c <_ZN9BufferCPPD1Ev+0xec>
    80006c00:	00053783          	ld	a5,0(a0)
    80006c04:	0087b783          	ld	a5,8(a5)
    80006c08:	000780e7          	jalr	a5
}
    80006c0c:	01813083          	ld	ra,24(sp)
    80006c10:	01013403          	ld	s0,16(sp)
    80006c14:	00813483          	ld	s1,8(sp)
    80006c18:	02010113          	addi	sp,sp,32
    80006c1c:	00008067          	ret

0000000080006c20 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006c20:	fe010113          	addi	sp,sp,-32
    80006c24:	00113c23          	sd	ra,24(sp)
    80006c28:	00813823          	sd	s0,16(sp)
    80006c2c:	00913423          	sd	s1,8(sp)
    80006c30:	01213023          	sd	s2,0(sp)
    80006c34:	02010413          	addi	s0,sp,32
    80006c38:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006c3c:	00100793          	li	a5,1
    80006c40:	02a7f863          	bgeu	a5,a0,80006c70 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006c44:	00a00793          	li	a5,10
    80006c48:	02f577b3          	remu	a5,a0,a5
    80006c4c:	02078e63          	beqz	a5,80006c88 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006c50:	fff48513          	addi	a0,s1,-1
    80006c54:	00000097          	auipc	ra,0x0
    80006c58:	fcc080e7          	jalr	-52(ra) # 80006c20 <_ZL9fibonaccim>
    80006c5c:	00050913          	mv	s2,a0
    80006c60:	ffe48513          	addi	a0,s1,-2
    80006c64:	00000097          	auipc	ra,0x0
    80006c68:	fbc080e7          	jalr	-68(ra) # 80006c20 <_ZL9fibonaccim>
    80006c6c:	00a90533          	add	a0,s2,a0
}
    80006c70:	01813083          	ld	ra,24(sp)
    80006c74:	01013403          	ld	s0,16(sp)
    80006c78:	00813483          	ld	s1,8(sp)
    80006c7c:	00013903          	ld	s2,0(sp)
    80006c80:	02010113          	addi	sp,sp,32
    80006c84:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006c88:	ffffb097          	auipc	ra,0xffffb
    80006c8c:	ca0080e7          	jalr	-864(ra) # 80001928 <_Z15thread_dispatchv>
    80006c90:	fc1ff06f          	j	80006c50 <_ZL9fibonaccim+0x30>

0000000080006c94 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80006c94:	fe010113          	addi	sp,sp,-32
    80006c98:	00113c23          	sd	ra,24(sp)
    80006c9c:	00813823          	sd	s0,16(sp)
    80006ca0:	00913423          	sd	s1,8(sp)
    80006ca4:	01213023          	sd	s2,0(sp)
    80006ca8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006cac:	00000913          	li	s2,0
    80006cb0:	0380006f          	j	80006ce8 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80006cb4:	ffffb097          	auipc	ra,0xffffb
    80006cb8:	c74080e7          	jalr	-908(ra) # 80001928 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006cbc:	00148493          	addi	s1,s1,1
    80006cc0:	000027b7          	lui	a5,0x2
    80006cc4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006cc8:	0097ee63          	bltu	a5,s1,80006ce4 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006ccc:	00000713          	li	a4,0
    80006cd0:	000077b7          	lui	a5,0x7
    80006cd4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006cd8:	fce7eee3          	bltu	a5,a4,80006cb4 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80006cdc:	00170713          	addi	a4,a4,1
    80006ce0:	ff1ff06f          	j	80006cd0 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006ce4:	00190913          	addi	s2,s2,1
    80006ce8:	00900793          	li	a5,9
    80006cec:	0527e063          	bltu	a5,s2,80006d2c <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006cf0:	00005517          	auipc	a0,0x5
    80006cf4:	8a850513          	addi	a0,a0,-1880 # 8000b598 <CONSOLE_STATUS+0x588>
    80006cf8:	00001097          	auipc	ra,0x1
    80006cfc:	a44080e7          	jalr	-1468(ra) # 8000773c <_Z11printStringPKc>
    80006d00:	00000613          	li	a2,0
    80006d04:	00a00593          	li	a1,10
    80006d08:	0009051b          	sext.w	a0,s2
    80006d0c:	00001097          	auipc	ra,0x1
    80006d10:	be0080e7          	jalr	-1056(ra) # 800078ec <_Z8printIntiii>
    80006d14:	00005517          	auipc	a0,0x5
    80006d18:	abc50513          	addi	a0,a0,-1348 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006d1c:	00001097          	auipc	ra,0x1
    80006d20:	a20080e7          	jalr	-1504(ra) # 8000773c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006d24:	00000493          	li	s1,0
    80006d28:	f99ff06f          	j	80006cc0 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80006d2c:	00005517          	auipc	a0,0x5
    80006d30:	87450513          	addi	a0,a0,-1932 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80006d34:	00001097          	auipc	ra,0x1
    80006d38:	a08080e7          	jalr	-1528(ra) # 8000773c <_Z11printStringPKc>
    finishedA = true;
    80006d3c:	00100793          	li	a5,1
    80006d40:	00007717          	auipc	a4,0x7
    80006d44:	28f70d23          	sb	a5,666(a4) # 8000dfda <_ZL9finishedA>
}
    80006d48:	01813083          	ld	ra,24(sp)
    80006d4c:	01013403          	ld	s0,16(sp)
    80006d50:	00813483          	ld	s1,8(sp)
    80006d54:	00013903          	ld	s2,0(sp)
    80006d58:	02010113          	addi	sp,sp,32
    80006d5c:	00008067          	ret

0000000080006d60 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80006d60:	fe010113          	addi	sp,sp,-32
    80006d64:	00113c23          	sd	ra,24(sp)
    80006d68:	00813823          	sd	s0,16(sp)
    80006d6c:	00913423          	sd	s1,8(sp)
    80006d70:	01213023          	sd	s2,0(sp)
    80006d74:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006d78:	00000913          	li	s2,0
    80006d7c:	0380006f          	j	80006db4 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80006d80:	ffffb097          	auipc	ra,0xffffb
    80006d84:	ba8080e7          	jalr	-1112(ra) # 80001928 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006d88:	00148493          	addi	s1,s1,1
    80006d8c:	000027b7          	lui	a5,0x2
    80006d90:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006d94:	0097ee63          	bltu	a5,s1,80006db0 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006d98:	00000713          	li	a4,0
    80006d9c:	000077b7          	lui	a5,0x7
    80006da0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006da4:	fce7eee3          	bltu	a5,a4,80006d80 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80006da8:	00170713          	addi	a4,a4,1
    80006dac:	ff1ff06f          	j	80006d9c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80006db0:	00190913          	addi	s2,s2,1
    80006db4:	00f00793          	li	a5,15
    80006db8:	0527e063          	bltu	a5,s2,80006df8 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80006dbc:	00004517          	auipc	a0,0x4
    80006dc0:	7c450513          	addi	a0,a0,1988 # 8000b580 <CONSOLE_STATUS+0x570>
    80006dc4:	00001097          	auipc	ra,0x1
    80006dc8:	978080e7          	jalr	-1672(ra) # 8000773c <_Z11printStringPKc>
    80006dcc:	00000613          	li	a2,0
    80006dd0:	00a00593          	li	a1,10
    80006dd4:	0009051b          	sext.w	a0,s2
    80006dd8:	00001097          	auipc	ra,0x1
    80006ddc:	b14080e7          	jalr	-1260(ra) # 800078ec <_Z8printIntiii>
    80006de0:	00005517          	auipc	a0,0x5
    80006de4:	9f050513          	addi	a0,a0,-1552 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006de8:	00001097          	auipc	ra,0x1
    80006dec:	954080e7          	jalr	-1708(ra) # 8000773c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006df0:	00000493          	li	s1,0
    80006df4:	f99ff06f          	j	80006d8c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80006df8:	00004517          	auipc	a0,0x4
    80006dfc:	79050513          	addi	a0,a0,1936 # 8000b588 <CONSOLE_STATUS+0x578>
    80006e00:	00001097          	auipc	ra,0x1
    80006e04:	93c080e7          	jalr	-1732(ra) # 8000773c <_Z11printStringPKc>
    finishedB = true;
    80006e08:	00100793          	li	a5,1
    80006e0c:	00007717          	auipc	a4,0x7
    80006e10:	1cf707a3          	sb	a5,463(a4) # 8000dfdb <_ZL9finishedB>
    thread_dispatch();
    80006e14:	ffffb097          	auipc	ra,0xffffb
    80006e18:	b14080e7          	jalr	-1260(ra) # 80001928 <_Z15thread_dispatchv>
}
    80006e1c:	01813083          	ld	ra,24(sp)
    80006e20:	01013403          	ld	s0,16(sp)
    80006e24:	00813483          	ld	s1,8(sp)
    80006e28:	00013903          	ld	s2,0(sp)
    80006e2c:	02010113          	addi	sp,sp,32
    80006e30:	00008067          	ret

0000000080006e34 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80006e34:	fe010113          	addi	sp,sp,-32
    80006e38:	00113c23          	sd	ra,24(sp)
    80006e3c:	00813823          	sd	s0,16(sp)
    80006e40:	00913423          	sd	s1,8(sp)
    80006e44:	01213023          	sd	s2,0(sp)
    80006e48:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006e4c:	00000493          	li	s1,0
    80006e50:	0400006f          	j	80006e90 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80006e54:	00004517          	auipc	a0,0x4
    80006e58:	6ec50513          	addi	a0,a0,1772 # 8000b540 <CONSOLE_STATUS+0x530>
    80006e5c:	00001097          	auipc	ra,0x1
    80006e60:	8e0080e7          	jalr	-1824(ra) # 8000773c <_Z11printStringPKc>
    80006e64:	00000613          	li	a2,0
    80006e68:	00a00593          	li	a1,10
    80006e6c:	00048513          	mv	a0,s1
    80006e70:	00001097          	auipc	ra,0x1
    80006e74:	a7c080e7          	jalr	-1412(ra) # 800078ec <_Z8printIntiii>
    80006e78:	00005517          	auipc	a0,0x5
    80006e7c:	95850513          	addi	a0,a0,-1704 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006e80:	00001097          	auipc	ra,0x1
    80006e84:	8bc080e7          	jalr	-1860(ra) # 8000773c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006e88:	0014849b          	addiw	s1,s1,1
    80006e8c:	0ff4f493          	andi	s1,s1,255
    80006e90:	00200793          	li	a5,2
    80006e94:	fc97f0e3          	bgeu	a5,s1,80006e54 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80006e98:	00004517          	auipc	a0,0x4
    80006e9c:	6b050513          	addi	a0,a0,1712 # 8000b548 <CONSOLE_STATUS+0x538>
    80006ea0:	00001097          	auipc	ra,0x1
    80006ea4:	89c080e7          	jalr	-1892(ra) # 8000773c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006ea8:	00700313          	li	t1,7
    thread_dispatch();
    80006eac:	ffffb097          	auipc	ra,0xffffb
    80006eb0:	a7c080e7          	jalr	-1412(ra) # 80001928 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006eb4:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80006eb8:	00004517          	auipc	a0,0x4
    80006ebc:	6a050513          	addi	a0,a0,1696 # 8000b558 <CONSOLE_STATUS+0x548>
    80006ec0:	00001097          	auipc	ra,0x1
    80006ec4:	87c080e7          	jalr	-1924(ra) # 8000773c <_Z11printStringPKc>
    80006ec8:	00000613          	li	a2,0
    80006ecc:	00a00593          	li	a1,10
    80006ed0:	0009051b          	sext.w	a0,s2
    80006ed4:	00001097          	auipc	ra,0x1
    80006ed8:	a18080e7          	jalr	-1512(ra) # 800078ec <_Z8printIntiii>
    80006edc:	00005517          	auipc	a0,0x5
    80006ee0:	8f450513          	addi	a0,a0,-1804 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006ee4:	00001097          	auipc	ra,0x1
    80006ee8:	858080e7          	jalr	-1960(ra) # 8000773c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80006eec:	00c00513          	li	a0,12
    80006ef0:	00000097          	auipc	ra,0x0
    80006ef4:	d30080e7          	jalr	-720(ra) # 80006c20 <_ZL9fibonaccim>
    80006ef8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006efc:	00004517          	auipc	a0,0x4
    80006f00:	66450513          	addi	a0,a0,1636 # 8000b560 <CONSOLE_STATUS+0x550>
    80006f04:	00001097          	auipc	ra,0x1
    80006f08:	838080e7          	jalr	-1992(ra) # 8000773c <_Z11printStringPKc>
    80006f0c:	00000613          	li	a2,0
    80006f10:	00a00593          	li	a1,10
    80006f14:	0009051b          	sext.w	a0,s2
    80006f18:	00001097          	auipc	ra,0x1
    80006f1c:	9d4080e7          	jalr	-1580(ra) # 800078ec <_Z8printIntiii>
    80006f20:	00005517          	auipc	a0,0x5
    80006f24:	8b050513          	addi	a0,a0,-1872 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006f28:	00001097          	auipc	ra,0x1
    80006f2c:	814080e7          	jalr	-2028(ra) # 8000773c <_Z11printStringPKc>
    80006f30:	0400006f          	j	80006f70 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80006f34:	00004517          	auipc	a0,0x4
    80006f38:	60c50513          	addi	a0,a0,1548 # 8000b540 <CONSOLE_STATUS+0x530>
    80006f3c:	00001097          	auipc	ra,0x1
    80006f40:	800080e7          	jalr	-2048(ra) # 8000773c <_Z11printStringPKc>
    80006f44:	00000613          	li	a2,0
    80006f48:	00a00593          	li	a1,10
    80006f4c:	00048513          	mv	a0,s1
    80006f50:	00001097          	auipc	ra,0x1
    80006f54:	99c080e7          	jalr	-1636(ra) # 800078ec <_Z8printIntiii>
    80006f58:	00005517          	auipc	a0,0x5
    80006f5c:	87850513          	addi	a0,a0,-1928 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006f60:	00000097          	auipc	ra,0x0
    80006f64:	7dc080e7          	jalr	2012(ra) # 8000773c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006f68:	0014849b          	addiw	s1,s1,1
    80006f6c:	0ff4f493          	andi	s1,s1,255
    80006f70:	00500793          	li	a5,5
    80006f74:	fc97f0e3          	bgeu	a5,s1,80006f34 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80006f78:	00004517          	auipc	a0,0x4
    80006f7c:	62850513          	addi	a0,a0,1576 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80006f80:	00000097          	auipc	ra,0x0
    80006f84:	7bc080e7          	jalr	1980(ra) # 8000773c <_Z11printStringPKc>
    finishedC = true;
    80006f88:	00100793          	li	a5,1
    80006f8c:	00007717          	auipc	a4,0x7
    80006f90:	04f70823          	sb	a5,80(a4) # 8000dfdc <_ZL9finishedC>
    thread_dispatch();
    80006f94:	ffffb097          	auipc	ra,0xffffb
    80006f98:	994080e7          	jalr	-1644(ra) # 80001928 <_Z15thread_dispatchv>
}
    80006f9c:	01813083          	ld	ra,24(sp)
    80006fa0:	01013403          	ld	s0,16(sp)
    80006fa4:	00813483          	ld	s1,8(sp)
    80006fa8:	00013903          	ld	s2,0(sp)
    80006fac:	02010113          	addi	sp,sp,32
    80006fb0:	00008067          	ret

0000000080006fb4 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80006fb4:	fe010113          	addi	sp,sp,-32
    80006fb8:	00113c23          	sd	ra,24(sp)
    80006fbc:	00813823          	sd	s0,16(sp)
    80006fc0:	00913423          	sd	s1,8(sp)
    80006fc4:	01213023          	sd	s2,0(sp)
    80006fc8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006fcc:	00a00493          	li	s1,10
    80006fd0:	0400006f          	j	80007010 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006fd4:	00004517          	auipc	a0,0x4
    80006fd8:	53450513          	addi	a0,a0,1332 # 8000b508 <CONSOLE_STATUS+0x4f8>
    80006fdc:	00000097          	auipc	ra,0x0
    80006fe0:	760080e7          	jalr	1888(ra) # 8000773c <_Z11printStringPKc>
    80006fe4:	00000613          	li	a2,0
    80006fe8:	00a00593          	li	a1,10
    80006fec:	00048513          	mv	a0,s1
    80006ff0:	00001097          	auipc	ra,0x1
    80006ff4:	8fc080e7          	jalr	-1796(ra) # 800078ec <_Z8printIntiii>
    80006ff8:	00004517          	auipc	a0,0x4
    80006ffc:	7d850513          	addi	a0,a0,2008 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80007000:	00000097          	auipc	ra,0x0
    80007004:	73c080e7          	jalr	1852(ra) # 8000773c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80007008:	0014849b          	addiw	s1,s1,1
    8000700c:	0ff4f493          	andi	s1,s1,255
    80007010:	00c00793          	li	a5,12
    80007014:	fc97f0e3          	bgeu	a5,s1,80006fd4 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80007018:	00004517          	auipc	a0,0x4
    8000701c:	4f850513          	addi	a0,a0,1272 # 8000b510 <CONSOLE_STATUS+0x500>
    80007020:	00000097          	auipc	ra,0x0
    80007024:	71c080e7          	jalr	1820(ra) # 8000773c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80007028:	00500313          	li	t1,5
    thread_dispatch();
    8000702c:	ffffb097          	auipc	ra,0xffffb
    80007030:	8fc080e7          	jalr	-1796(ra) # 80001928 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80007034:	01000513          	li	a0,16
    80007038:	00000097          	auipc	ra,0x0
    8000703c:	be8080e7          	jalr	-1048(ra) # 80006c20 <_ZL9fibonaccim>
    80007040:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80007044:	00004517          	auipc	a0,0x4
    80007048:	4dc50513          	addi	a0,a0,1244 # 8000b520 <CONSOLE_STATUS+0x510>
    8000704c:	00000097          	auipc	ra,0x0
    80007050:	6f0080e7          	jalr	1776(ra) # 8000773c <_Z11printStringPKc>
    80007054:	00000613          	li	a2,0
    80007058:	00a00593          	li	a1,10
    8000705c:	0009051b          	sext.w	a0,s2
    80007060:	00001097          	auipc	ra,0x1
    80007064:	88c080e7          	jalr	-1908(ra) # 800078ec <_Z8printIntiii>
    80007068:	00004517          	auipc	a0,0x4
    8000706c:	76850513          	addi	a0,a0,1896 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80007070:	00000097          	auipc	ra,0x0
    80007074:	6cc080e7          	jalr	1740(ra) # 8000773c <_Z11printStringPKc>
    80007078:	0400006f          	j	800070b8 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000707c:	00004517          	auipc	a0,0x4
    80007080:	48c50513          	addi	a0,a0,1164 # 8000b508 <CONSOLE_STATUS+0x4f8>
    80007084:	00000097          	auipc	ra,0x0
    80007088:	6b8080e7          	jalr	1720(ra) # 8000773c <_Z11printStringPKc>
    8000708c:	00000613          	li	a2,0
    80007090:	00a00593          	li	a1,10
    80007094:	00048513          	mv	a0,s1
    80007098:	00001097          	auipc	ra,0x1
    8000709c:	854080e7          	jalr	-1964(ra) # 800078ec <_Z8printIntiii>
    800070a0:	00004517          	auipc	a0,0x4
    800070a4:	73050513          	addi	a0,a0,1840 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    800070a8:	00000097          	auipc	ra,0x0
    800070ac:	694080e7          	jalr	1684(ra) # 8000773c <_Z11printStringPKc>
    for (; i < 16; i++) {
    800070b0:	0014849b          	addiw	s1,s1,1
    800070b4:	0ff4f493          	andi	s1,s1,255
    800070b8:	00f00793          	li	a5,15
    800070bc:	fc97f0e3          	bgeu	a5,s1,8000707c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800070c0:	00004517          	auipc	a0,0x4
    800070c4:	47050513          	addi	a0,a0,1136 # 8000b530 <CONSOLE_STATUS+0x520>
    800070c8:	00000097          	auipc	ra,0x0
    800070cc:	674080e7          	jalr	1652(ra) # 8000773c <_Z11printStringPKc>
    finishedD = true;
    800070d0:	00100793          	li	a5,1
    800070d4:	00007717          	auipc	a4,0x7
    800070d8:	f0f704a3          	sb	a5,-247(a4) # 8000dfdd <_ZL9finishedD>
    thread_dispatch();
    800070dc:	ffffb097          	auipc	ra,0xffffb
    800070e0:	84c080e7          	jalr	-1972(ra) # 80001928 <_Z15thread_dispatchv>
}
    800070e4:	01813083          	ld	ra,24(sp)
    800070e8:	01013403          	ld	s0,16(sp)
    800070ec:	00813483          	ld	s1,8(sp)
    800070f0:	00013903          	ld	s2,0(sp)
    800070f4:	02010113          	addi	sp,sp,32
    800070f8:	00008067          	ret

00000000800070fc <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800070fc:	fc010113          	addi	sp,sp,-64
    80007100:	02113c23          	sd	ra,56(sp)
    80007104:	02813823          	sd	s0,48(sp)
    80007108:	02913423          	sd	s1,40(sp)
    8000710c:	03213023          	sd	s2,32(sp)
    80007110:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80007114:	02000513          	li	a0,32
    80007118:	ffffa097          	auipc	ra,0xffffa
    8000711c:	0a4080e7          	jalr	164(ra) # 800011bc <_Znwm>
    80007120:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80007124:	ffffa097          	auipc	ra,0xffffa
    80007128:	27c080e7          	jalr	636(ra) # 800013a0 <_ZN6ThreadC1Ev>
    8000712c:	00007797          	auipc	a5,0x7
    80007130:	c8c78793          	addi	a5,a5,-884 # 8000ddb8 <_ZTV7WorkerA+0x10>
    80007134:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80007138:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    8000713c:	00004517          	auipc	a0,0x4
    80007140:	47450513          	addi	a0,a0,1140 # 8000b5b0 <CONSOLE_STATUS+0x5a0>
    80007144:	00000097          	auipc	ra,0x0
    80007148:	5f8080e7          	jalr	1528(ra) # 8000773c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    8000714c:	02000513          	li	a0,32
    80007150:	ffffa097          	auipc	ra,0xffffa
    80007154:	06c080e7          	jalr	108(ra) # 800011bc <_Znwm>
    80007158:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    8000715c:	ffffa097          	auipc	ra,0xffffa
    80007160:	244080e7          	jalr	580(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007164:	00007797          	auipc	a5,0x7
    80007168:	c7c78793          	addi	a5,a5,-900 # 8000dde0 <_ZTV7WorkerB+0x10>
    8000716c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80007170:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80007174:	00004517          	auipc	a0,0x4
    80007178:	45450513          	addi	a0,a0,1108 # 8000b5c8 <CONSOLE_STATUS+0x5b8>
    8000717c:	00000097          	auipc	ra,0x0
    80007180:	5c0080e7          	jalr	1472(ra) # 8000773c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80007184:	02000513          	li	a0,32
    80007188:	ffffa097          	auipc	ra,0xffffa
    8000718c:	034080e7          	jalr	52(ra) # 800011bc <_Znwm>
    80007190:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80007194:	ffffa097          	auipc	ra,0xffffa
    80007198:	20c080e7          	jalr	524(ra) # 800013a0 <_ZN6ThreadC1Ev>
    8000719c:	00007797          	auipc	a5,0x7
    800071a0:	c6c78793          	addi	a5,a5,-916 # 8000de08 <_ZTV7WorkerC+0x10>
    800071a4:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800071a8:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800071ac:	00004517          	auipc	a0,0x4
    800071b0:	43450513          	addi	a0,a0,1076 # 8000b5e0 <CONSOLE_STATUS+0x5d0>
    800071b4:	00000097          	auipc	ra,0x0
    800071b8:	588080e7          	jalr	1416(ra) # 8000773c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800071bc:	02000513          	li	a0,32
    800071c0:	ffffa097          	auipc	ra,0xffffa
    800071c4:	ffc080e7          	jalr	-4(ra) # 800011bc <_Znwm>
    800071c8:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800071cc:	ffffa097          	auipc	ra,0xffffa
    800071d0:	1d4080e7          	jalr	468(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800071d4:	00007797          	auipc	a5,0x7
    800071d8:	c5c78793          	addi	a5,a5,-932 # 8000de30 <_ZTV7WorkerD+0x10>
    800071dc:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800071e0:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800071e4:	00004517          	auipc	a0,0x4
    800071e8:	41450513          	addi	a0,a0,1044 # 8000b5f8 <CONSOLE_STATUS+0x5e8>
    800071ec:	00000097          	auipc	ra,0x0
    800071f0:	550080e7          	jalr	1360(ra) # 8000773c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800071f4:	00000493          	li	s1,0
    800071f8:	00300793          	li	a5,3
    800071fc:	0297c663          	blt	a5,s1,80007228 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80007200:	00349793          	slli	a5,s1,0x3
    80007204:	fe040713          	addi	a4,s0,-32
    80007208:	00f707b3          	add	a5,a4,a5
    8000720c:	fe07b503          	ld	a0,-32(a5)
    80007210:	ffffa097          	auipc	ra,0xffffa
    80007214:	0a8080e7          	jalr	168(ra) # 800012b8 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80007218:	0014849b          	addiw	s1,s1,1
    8000721c:	fddff06f          	j	800071f8 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80007220:	ffffa097          	auipc	ra,0xffffa
    80007224:	0f8080e7          	jalr	248(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80007228:	00007797          	auipc	a5,0x7
    8000722c:	db27c783          	lbu	a5,-590(a5) # 8000dfda <_ZL9finishedA>
    80007230:	fe0788e3          	beqz	a5,80007220 <_Z20Threads_CPP_API_testv+0x124>
    80007234:	00007797          	auipc	a5,0x7
    80007238:	da77c783          	lbu	a5,-601(a5) # 8000dfdb <_ZL9finishedB>
    8000723c:	fe0782e3          	beqz	a5,80007220 <_Z20Threads_CPP_API_testv+0x124>
    80007240:	00007797          	auipc	a5,0x7
    80007244:	d9c7c783          	lbu	a5,-612(a5) # 8000dfdc <_ZL9finishedC>
    80007248:	fc078ce3          	beqz	a5,80007220 <_Z20Threads_CPP_API_testv+0x124>
    8000724c:	00007797          	auipc	a5,0x7
    80007250:	d917c783          	lbu	a5,-623(a5) # 8000dfdd <_ZL9finishedD>
    80007254:	fc0786e3          	beqz	a5,80007220 <_Z20Threads_CPP_API_testv+0x124>
    80007258:	fc040493          	addi	s1,s0,-64
    8000725c:	0080006f          	j	80007264 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80007260:	00848493          	addi	s1,s1,8
    80007264:	fe040793          	addi	a5,s0,-32
    80007268:	08f48663          	beq	s1,a5,800072f4 <_Z20Threads_CPP_API_testv+0x1f8>
    8000726c:	0004b503          	ld	a0,0(s1)
    80007270:	fe0508e3          	beqz	a0,80007260 <_Z20Threads_CPP_API_testv+0x164>
    80007274:	00053783          	ld	a5,0(a0)
    80007278:	0087b783          	ld	a5,8(a5)
    8000727c:	000780e7          	jalr	a5
    80007280:	fe1ff06f          	j	80007260 <_Z20Threads_CPP_API_testv+0x164>
    80007284:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80007288:	00048513          	mv	a0,s1
    8000728c:	ffffa097          	auipc	ra,0xffffa
    80007290:	f58080e7          	jalr	-168(ra) # 800011e4 <_ZdlPv>
    80007294:	00090513          	mv	a0,s2
    80007298:	00008097          	auipc	ra,0x8
    8000729c:	e30080e7          	jalr	-464(ra) # 8000f0c8 <_Unwind_Resume>
    800072a0:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800072a4:	00048513          	mv	a0,s1
    800072a8:	ffffa097          	auipc	ra,0xffffa
    800072ac:	f3c080e7          	jalr	-196(ra) # 800011e4 <_ZdlPv>
    800072b0:	00090513          	mv	a0,s2
    800072b4:	00008097          	auipc	ra,0x8
    800072b8:	e14080e7          	jalr	-492(ra) # 8000f0c8 <_Unwind_Resume>
    800072bc:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800072c0:	00048513          	mv	a0,s1
    800072c4:	ffffa097          	auipc	ra,0xffffa
    800072c8:	f20080e7          	jalr	-224(ra) # 800011e4 <_ZdlPv>
    800072cc:	00090513          	mv	a0,s2
    800072d0:	00008097          	auipc	ra,0x8
    800072d4:	df8080e7          	jalr	-520(ra) # 8000f0c8 <_Unwind_Resume>
    800072d8:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800072dc:	00048513          	mv	a0,s1
    800072e0:	ffffa097          	auipc	ra,0xffffa
    800072e4:	f04080e7          	jalr	-252(ra) # 800011e4 <_ZdlPv>
    800072e8:	00090513          	mv	a0,s2
    800072ec:	00008097          	auipc	ra,0x8
    800072f0:	ddc080e7          	jalr	-548(ra) # 8000f0c8 <_Unwind_Resume>
}
    800072f4:	03813083          	ld	ra,56(sp)
    800072f8:	03013403          	ld	s0,48(sp)
    800072fc:	02813483          	ld	s1,40(sp)
    80007300:	02013903          	ld	s2,32(sp)
    80007304:	04010113          	addi	sp,sp,64
    80007308:	00008067          	ret

000000008000730c <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    8000730c:	ff010113          	addi	sp,sp,-16
    80007310:	00113423          	sd	ra,8(sp)
    80007314:	00813023          	sd	s0,0(sp)
    80007318:	01010413          	addi	s0,sp,16
    8000731c:	00007797          	auipc	a5,0x7
    80007320:	a9c78793          	addi	a5,a5,-1380 # 8000ddb8 <_ZTV7WorkerA+0x10>
    80007324:	00f53023          	sd	a5,0(a0)
    80007328:	ffffa097          	auipc	ra,0xffffa
    8000732c:	e24080e7          	jalr	-476(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007330:	00813083          	ld	ra,8(sp)
    80007334:	00013403          	ld	s0,0(sp)
    80007338:	01010113          	addi	sp,sp,16
    8000733c:	00008067          	ret

0000000080007340 <_ZN7WorkerAD0Ev>:
    80007340:	fe010113          	addi	sp,sp,-32
    80007344:	00113c23          	sd	ra,24(sp)
    80007348:	00813823          	sd	s0,16(sp)
    8000734c:	00913423          	sd	s1,8(sp)
    80007350:	02010413          	addi	s0,sp,32
    80007354:	00050493          	mv	s1,a0
    80007358:	00007797          	auipc	a5,0x7
    8000735c:	a6078793          	addi	a5,a5,-1440 # 8000ddb8 <_ZTV7WorkerA+0x10>
    80007360:	00f53023          	sd	a5,0(a0)
    80007364:	ffffa097          	auipc	ra,0xffffa
    80007368:	de8080e7          	jalr	-536(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000736c:	00048513          	mv	a0,s1
    80007370:	ffffa097          	auipc	ra,0xffffa
    80007374:	e74080e7          	jalr	-396(ra) # 800011e4 <_ZdlPv>
    80007378:	01813083          	ld	ra,24(sp)
    8000737c:	01013403          	ld	s0,16(sp)
    80007380:	00813483          	ld	s1,8(sp)
    80007384:	02010113          	addi	sp,sp,32
    80007388:	00008067          	ret

000000008000738c <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    8000738c:	ff010113          	addi	sp,sp,-16
    80007390:	00113423          	sd	ra,8(sp)
    80007394:	00813023          	sd	s0,0(sp)
    80007398:	01010413          	addi	s0,sp,16
    8000739c:	00007797          	auipc	a5,0x7
    800073a0:	a4478793          	addi	a5,a5,-1468 # 8000dde0 <_ZTV7WorkerB+0x10>
    800073a4:	00f53023          	sd	a5,0(a0)
    800073a8:	ffffa097          	auipc	ra,0xffffa
    800073ac:	da4080e7          	jalr	-604(ra) # 8000114c <_ZN6ThreadD1Ev>
    800073b0:	00813083          	ld	ra,8(sp)
    800073b4:	00013403          	ld	s0,0(sp)
    800073b8:	01010113          	addi	sp,sp,16
    800073bc:	00008067          	ret

00000000800073c0 <_ZN7WorkerBD0Ev>:
    800073c0:	fe010113          	addi	sp,sp,-32
    800073c4:	00113c23          	sd	ra,24(sp)
    800073c8:	00813823          	sd	s0,16(sp)
    800073cc:	00913423          	sd	s1,8(sp)
    800073d0:	02010413          	addi	s0,sp,32
    800073d4:	00050493          	mv	s1,a0
    800073d8:	00007797          	auipc	a5,0x7
    800073dc:	a0878793          	addi	a5,a5,-1528 # 8000dde0 <_ZTV7WorkerB+0x10>
    800073e0:	00f53023          	sd	a5,0(a0)
    800073e4:	ffffa097          	auipc	ra,0xffffa
    800073e8:	d68080e7          	jalr	-664(ra) # 8000114c <_ZN6ThreadD1Ev>
    800073ec:	00048513          	mv	a0,s1
    800073f0:	ffffa097          	auipc	ra,0xffffa
    800073f4:	df4080e7          	jalr	-524(ra) # 800011e4 <_ZdlPv>
    800073f8:	01813083          	ld	ra,24(sp)
    800073fc:	01013403          	ld	s0,16(sp)
    80007400:	00813483          	ld	s1,8(sp)
    80007404:	02010113          	addi	sp,sp,32
    80007408:	00008067          	ret

000000008000740c <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    8000740c:	ff010113          	addi	sp,sp,-16
    80007410:	00113423          	sd	ra,8(sp)
    80007414:	00813023          	sd	s0,0(sp)
    80007418:	01010413          	addi	s0,sp,16
    8000741c:	00007797          	auipc	a5,0x7
    80007420:	9ec78793          	addi	a5,a5,-1556 # 8000de08 <_ZTV7WorkerC+0x10>
    80007424:	00f53023          	sd	a5,0(a0)
    80007428:	ffffa097          	auipc	ra,0xffffa
    8000742c:	d24080e7          	jalr	-732(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007430:	00813083          	ld	ra,8(sp)
    80007434:	00013403          	ld	s0,0(sp)
    80007438:	01010113          	addi	sp,sp,16
    8000743c:	00008067          	ret

0000000080007440 <_ZN7WorkerCD0Ev>:
    80007440:	fe010113          	addi	sp,sp,-32
    80007444:	00113c23          	sd	ra,24(sp)
    80007448:	00813823          	sd	s0,16(sp)
    8000744c:	00913423          	sd	s1,8(sp)
    80007450:	02010413          	addi	s0,sp,32
    80007454:	00050493          	mv	s1,a0
    80007458:	00007797          	auipc	a5,0x7
    8000745c:	9b078793          	addi	a5,a5,-1616 # 8000de08 <_ZTV7WorkerC+0x10>
    80007460:	00f53023          	sd	a5,0(a0)
    80007464:	ffffa097          	auipc	ra,0xffffa
    80007468:	ce8080e7          	jalr	-792(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000746c:	00048513          	mv	a0,s1
    80007470:	ffffa097          	auipc	ra,0xffffa
    80007474:	d74080e7          	jalr	-652(ra) # 800011e4 <_ZdlPv>
    80007478:	01813083          	ld	ra,24(sp)
    8000747c:	01013403          	ld	s0,16(sp)
    80007480:	00813483          	ld	s1,8(sp)
    80007484:	02010113          	addi	sp,sp,32
    80007488:	00008067          	ret

000000008000748c <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    8000748c:	ff010113          	addi	sp,sp,-16
    80007490:	00113423          	sd	ra,8(sp)
    80007494:	00813023          	sd	s0,0(sp)
    80007498:	01010413          	addi	s0,sp,16
    8000749c:	00007797          	auipc	a5,0x7
    800074a0:	99478793          	addi	a5,a5,-1644 # 8000de30 <_ZTV7WorkerD+0x10>
    800074a4:	00f53023          	sd	a5,0(a0)
    800074a8:	ffffa097          	auipc	ra,0xffffa
    800074ac:	ca4080e7          	jalr	-860(ra) # 8000114c <_ZN6ThreadD1Ev>
    800074b0:	00813083          	ld	ra,8(sp)
    800074b4:	00013403          	ld	s0,0(sp)
    800074b8:	01010113          	addi	sp,sp,16
    800074bc:	00008067          	ret

00000000800074c0 <_ZN7WorkerDD0Ev>:
    800074c0:	fe010113          	addi	sp,sp,-32
    800074c4:	00113c23          	sd	ra,24(sp)
    800074c8:	00813823          	sd	s0,16(sp)
    800074cc:	00913423          	sd	s1,8(sp)
    800074d0:	02010413          	addi	s0,sp,32
    800074d4:	00050493          	mv	s1,a0
    800074d8:	00007797          	auipc	a5,0x7
    800074dc:	95878793          	addi	a5,a5,-1704 # 8000de30 <_ZTV7WorkerD+0x10>
    800074e0:	00f53023          	sd	a5,0(a0)
    800074e4:	ffffa097          	auipc	ra,0xffffa
    800074e8:	c68080e7          	jalr	-920(ra) # 8000114c <_ZN6ThreadD1Ev>
    800074ec:	00048513          	mv	a0,s1
    800074f0:	ffffa097          	auipc	ra,0xffffa
    800074f4:	cf4080e7          	jalr	-780(ra) # 800011e4 <_ZdlPv>
    800074f8:	01813083          	ld	ra,24(sp)
    800074fc:	01013403          	ld	s0,16(sp)
    80007500:	00813483          	ld	s1,8(sp)
    80007504:	02010113          	addi	sp,sp,32
    80007508:	00008067          	ret

000000008000750c <_ZN7WorkerA3runEv>:
    void run() override {
    8000750c:	ff010113          	addi	sp,sp,-16
    80007510:	00113423          	sd	ra,8(sp)
    80007514:	00813023          	sd	s0,0(sp)
    80007518:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    8000751c:	00000593          	li	a1,0
    80007520:	fffff097          	auipc	ra,0xfffff
    80007524:	774080e7          	jalr	1908(ra) # 80006c94 <_ZN7WorkerA11workerBodyAEPv>
    }
    80007528:	00813083          	ld	ra,8(sp)
    8000752c:	00013403          	ld	s0,0(sp)
    80007530:	01010113          	addi	sp,sp,16
    80007534:	00008067          	ret

0000000080007538 <_ZN7WorkerB3runEv>:
    void run() override {
    80007538:	ff010113          	addi	sp,sp,-16
    8000753c:	00113423          	sd	ra,8(sp)
    80007540:	00813023          	sd	s0,0(sp)
    80007544:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80007548:	00000593          	li	a1,0
    8000754c:	00000097          	auipc	ra,0x0
    80007550:	814080e7          	jalr	-2028(ra) # 80006d60 <_ZN7WorkerB11workerBodyBEPv>
    }
    80007554:	00813083          	ld	ra,8(sp)
    80007558:	00013403          	ld	s0,0(sp)
    8000755c:	01010113          	addi	sp,sp,16
    80007560:	00008067          	ret

0000000080007564 <_ZN7WorkerC3runEv>:
    void run() override {
    80007564:	ff010113          	addi	sp,sp,-16
    80007568:	00113423          	sd	ra,8(sp)
    8000756c:	00813023          	sd	s0,0(sp)
    80007570:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80007574:	00000593          	li	a1,0
    80007578:	00000097          	auipc	ra,0x0
    8000757c:	8bc080e7          	jalr	-1860(ra) # 80006e34 <_ZN7WorkerC11workerBodyCEPv>
    }
    80007580:	00813083          	ld	ra,8(sp)
    80007584:	00013403          	ld	s0,0(sp)
    80007588:	01010113          	addi	sp,sp,16
    8000758c:	00008067          	ret

0000000080007590 <_ZN7WorkerD3runEv>:
    void run() override {
    80007590:	ff010113          	addi	sp,sp,-16
    80007594:	00113423          	sd	ra,8(sp)
    80007598:	00813023          	sd	s0,0(sp)
    8000759c:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800075a0:	00000593          	li	a1,0
    800075a4:	00000097          	auipc	ra,0x0
    800075a8:	a10080e7          	jalr	-1520(ra) # 80006fb4 <_ZN7WorkerD11workerBodyDEPv>
    }
    800075ac:	00813083          	ld	ra,8(sp)
    800075b0:	00013403          	ld	s0,0(sp)
    800075b4:	01010113          	addi	sp,sp,16
    800075b8:	00008067          	ret

00000000800075bc <_Z8userMainv>:
#include "../test_h/ConsumerProducer_CPP_API_test.h"
#include "../test_h/System_Mode_test.h"

#endif

void userMain() {
    800075bc:	fe010113          	addi	sp,sp,-32
    800075c0:	00113c23          	sd	ra,24(sp)
    800075c4:	00813823          	sd	s0,16(sp)
    800075c8:	00913423          	sd	s1,8(sp)
    800075cc:	01213023          	sd	s2,0(sp)
    800075d0:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800075d4:	00004517          	auipc	a0,0x4
    800075d8:	0bc50513          	addi	a0,a0,188 # 8000b690 <CONSOLE_STATUS+0x680>
    800075dc:	00000097          	auipc	ra,0x0
    800075e0:	160080e7          	jalr	352(ra) # 8000773c <_Z11printStringPKc>
    int test = getc() - '0';
    800075e4:	ffffa097          	auipc	ra,0xffffa
    800075e8:	470080e7          	jalr	1136(ra) # 80001a54 <_Z4getcv>
    800075ec:	00050913          	mv	s2,a0
    800075f0:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800075f4:	ffffa097          	auipc	ra,0xffffa
    800075f8:	460080e7          	jalr	1120(ra) # 80001a54 <_Z4getcv>
    putc(test);
    800075fc:	fd09051b          	addiw	a0,s2,-48
    80007600:	0ff57513          	andi	a0,a0,255
    80007604:	ffffa097          	auipc	ra,0xffffa
    80007608:	478080e7          	jalr	1144(ra) # 80001a7c <_Z4putcc>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    8000760c:	00700793          	li	a5,7
    80007610:	1097ec63          	bltu	a5,s1,80007728 <_Z8userMainv+0x16c>
    80007614:	00249493          	slli	s1,s1,0x2
    80007618:	00004717          	auipc	a4,0x4
    8000761c:	2e470713          	addi	a4,a4,740 # 8000b8fc <CONSOLE_STATUS+0x8ec>
    80007620:	00e484b3          	add	s1,s1,a4
    80007624:	0004a783          	lw	a5,0(s1)
    80007628:	00e787b3          	add	a5,a5,a4
    8000762c:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80007630:	fffff097          	auipc	ra,0xfffff
    80007634:	f64080e7          	jalr	-156(ra) # 80006594 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80007638:	00004517          	auipc	a0,0x4
    8000763c:	07850513          	addi	a0,a0,120 # 8000b6b0 <CONSOLE_STATUS+0x6a0>
    80007640:	00000097          	auipc	ra,0x0
    80007644:	0fc080e7          	jalr	252(ra) # 8000773c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    printString("Kraj izvrsavanja");
    80007648:	00004517          	auipc	a0,0x4
    8000764c:	2a050513          	addi	a0,a0,672 # 8000b8e8 <CONSOLE_STATUS+0x8d8>
    80007650:	00000097          	auipc	ra,0x0
    80007654:	0ec080e7          	jalr	236(ra) # 8000773c <_Z11printStringPKc>
    80007658:	01813083          	ld	ra,24(sp)
    8000765c:	01013403          	ld	s0,16(sp)
    80007660:	00813483          	ld	s1,8(sp)
    80007664:	00013903          	ld	s2,0(sp)
    80007668:	02010113          	addi	sp,sp,32
    8000766c:	00008067          	ret
            Threads_CPP_API_test();
    80007670:	00000097          	auipc	ra,0x0
    80007674:	a8c080e7          	jalr	-1396(ra) # 800070fc <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80007678:	00004517          	auipc	a0,0x4
    8000767c:	07850513          	addi	a0,a0,120 # 8000b6f0 <CONSOLE_STATUS+0x6e0>
    80007680:	00000097          	auipc	ra,0x0
    80007684:	0bc080e7          	jalr	188(ra) # 8000773c <_Z11printStringPKc>
            break;
    80007688:	fc1ff06f          	j	80007648 <_Z8userMainv+0x8c>
            producerConsumer_C_API();
    8000768c:	ffffe097          	auipc	ra,0xffffe
    80007690:	a2c080e7          	jalr	-1492(ra) # 800050b8 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80007694:	00004517          	auipc	a0,0x4
    80007698:	09c50513          	addi	a0,a0,156 # 8000b730 <CONSOLE_STATUS+0x720>
    8000769c:	00000097          	auipc	ra,0x0
    800076a0:	0a0080e7          	jalr	160(ra) # 8000773c <_Z11printStringPKc>
            break;
    800076a4:	fa5ff06f          	j	80007648 <_Z8userMainv+0x8c>
            producerConsumer_CPP_Sync_API();
    800076a8:	00000097          	auipc	ra,0x0
    800076ac:	5ac080e7          	jalr	1452(ra) # 80007c54 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    800076b0:	00004517          	auipc	a0,0x4
    800076b4:	0d050513          	addi	a0,a0,208 # 8000b780 <CONSOLE_STATUS+0x770>
    800076b8:	00000097          	auipc	ra,0x0
    800076bc:	084080e7          	jalr	132(ra) # 8000773c <_Z11printStringPKc>
            break;
    800076c0:	f89ff06f          	j	80007648 <_Z8userMainv+0x8c>
            testSleeping();
    800076c4:	fffff097          	auipc	ra,0xfffff
    800076c8:	07c080e7          	jalr	124(ra) # 80006740 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., time_sleep test C API)\n");
    800076cc:	00004517          	auipc	a0,0x4
    800076d0:	10c50513          	addi	a0,a0,268 # 8000b7d8 <CONSOLE_STATUS+0x7c8>
    800076d4:	00000097          	auipc	ra,0x0
    800076d8:	068080e7          	jalr	104(ra) # 8000773c <_Z11printStringPKc>
            break;
    800076dc:	f6dff06f          	j	80007648 <_Z8userMainv+0x8c>
            testConsumerProducer();
    800076e0:	ffffe097          	auipc	ra,0xffffe
    800076e4:	ca8080e7          	jalr	-856(ra) # 80005388 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800076e8:	00004517          	auipc	a0,0x4
    800076ec:	12050513          	addi	a0,a0,288 # 8000b808 <CONSOLE_STATUS+0x7f8>
    800076f0:	00000097          	auipc	ra,0x0
    800076f4:	04c080e7          	jalr	76(ra) # 8000773c <_Z11printStringPKc>
            break;
    800076f8:	f51ff06f          	j	80007648 <_Z8userMainv+0x8c>
            System_Mode_test();
    800076fc:	fffff097          	auipc	ra,0xfffff
    80007700:	8f8080e7          	jalr	-1800(ra) # 80005ff4 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80007704:	00004517          	auipc	a0,0x4
    80007708:	14450513          	addi	a0,a0,324 # 8000b848 <CONSOLE_STATUS+0x838>
    8000770c:	00000097          	auipc	ra,0x0
    80007710:	030080e7          	jalr	48(ra) # 8000773c <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80007714:	00004517          	auipc	a0,0x4
    80007718:	15450513          	addi	a0,a0,340 # 8000b868 <CONSOLE_STATUS+0x858>
    8000771c:	00000097          	auipc	ra,0x0
    80007720:	020080e7          	jalr	32(ra) # 8000773c <_Z11printStringPKc>
            break;
    80007724:	f25ff06f          	j	80007648 <_Z8userMainv+0x8c>
            printString("Niste uneli odgovarajuci broj za test\n");
    80007728:	00004517          	auipc	a0,0x4
    8000772c:	19850513          	addi	a0,a0,408 # 8000b8c0 <CONSOLE_STATUS+0x8b0>
    80007730:	00000097          	auipc	ra,0x0
    80007734:	00c080e7          	jalr	12(ra) # 8000773c <_Z11printStringPKc>
    80007738:	f11ff06f          	j	80007648 <_Z8userMainv+0x8c>

000000008000773c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000773c:	fe010113          	addi	sp,sp,-32
    80007740:	00113c23          	sd	ra,24(sp)
    80007744:	00813823          	sd	s0,16(sp)
    80007748:	00913423          	sd	s1,8(sp)
    8000774c:	02010413          	addi	s0,sp,32
    80007750:	00050493          	mv	s1,a0
    LOCK();
    80007754:	00100613          	li	a2,1
    80007758:	00000593          	li	a1,0
    8000775c:	00007517          	auipc	a0,0x7
    80007760:	88450513          	addi	a0,a0,-1916 # 8000dfe0 <lockPrint>
    80007764:	ffffa097          	auipc	ra,0xffffa
    80007768:	99c080e7          	jalr	-1636(ra) # 80001100 <copy_and_swap>
    8000776c:	00050863          	beqz	a0,8000777c <_Z11printStringPKc+0x40>
    80007770:	ffffa097          	auipc	ra,0xffffa
    80007774:	1b8080e7          	jalr	440(ra) # 80001928 <_Z15thread_dispatchv>
    80007778:	fddff06f          	j	80007754 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000777c:	0004c503          	lbu	a0,0(s1)
    80007780:	00050a63          	beqz	a0,80007794 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80007784:	ffffa097          	auipc	ra,0xffffa
    80007788:	2f8080e7          	jalr	760(ra) # 80001a7c <_Z4putcc>
        string++;
    8000778c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80007790:	fedff06f          	j	8000777c <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80007794:	00000613          	li	a2,0
    80007798:	00100593          	li	a1,1
    8000779c:	00007517          	auipc	a0,0x7
    800077a0:	84450513          	addi	a0,a0,-1980 # 8000dfe0 <lockPrint>
    800077a4:	ffffa097          	auipc	ra,0xffffa
    800077a8:	95c080e7          	jalr	-1700(ra) # 80001100 <copy_and_swap>
    800077ac:	fe0514e3          	bnez	a0,80007794 <_Z11printStringPKc+0x58>
}
    800077b0:	01813083          	ld	ra,24(sp)
    800077b4:	01013403          	ld	s0,16(sp)
    800077b8:	00813483          	ld	s1,8(sp)
    800077bc:	02010113          	addi	sp,sp,32
    800077c0:	00008067          	ret

00000000800077c4 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800077c4:	fd010113          	addi	sp,sp,-48
    800077c8:	02113423          	sd	ra,40(sp)
    800077cc:	02813023          	sd	s0,32(sp)
    800077d0:	00913c23          	sd	s1,24(sp)
    800077d4:	01213823          	sd	s2,16(sp)
    800077d8:	01313423          	sd	s3,8(sp)
    800077dc:	01413023          	sd	s4,0(sp)
    800077e0:	03010413          	addi	s0,sp,48
    800077e4:	00050993          	mv	s3,a0
    800077e8:	00058a13          	mv	s4,a1
    LOCK();
    800077ec:	00100613          	li	a2,1
    800077f0:	00000593          	li	a1,0
    800077f4:	00006517          	auipc	a0,0x6
    800077f8:	7ec50513          	addi	a0,a0,2028 # 8000dfe0 <lockPrint>
    800077fc:	ffffa097          	auipc	ra,0xffffa
    80007800:	904080e7          	jalr	-1788(ra) # 80001100 <copy_and_swap>
    80007804:	00050863          	beqz	a0,80007814 <_Z9getStringPci+0x50>
    80007808:	ffffa097          	auipc	ra,0xffffa
    8000780c:	120080e7          	jalr	288(ra) # 80001928 <_Z15thread_dispatchv>
    80007810:	fddff06f          	j	800077ec <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80007814:	00000913          	li	s2,0
    80007818:	00090493          	mv	s1,s2
    8000781c:	0019091b          	addiw	s2,s2,1
    80007820:	03495a63          	bge	s2,s4,80007854 <_Z9getStringPci+0x90>
        cc = getc();
    80007824:	ffffa097          	auipc	ra,0xffffa
    80007828:	230080e7          	jalr	560(ra) # 80001a54 <_Z4getcv>
        if(cc < 1)
    8000782c:	02050463          	beqz	a0,80007854 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80007830:	009984b3          	add	s1,s3,s1
    80007834:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80007838:	00a00793          	li	a5,10
    8000783c:	00f50a63          	beq	a0,a5,80007850 <_Z9getStringPci+0x8c>
    80007840:	00d00793          	li	a5,13
    80007844:	fcf51ae3          	bne	a0,a5,80007818 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80007848:	00090493          	mv	s1,s2
    8000784c:	0080006f          	j	80007854 <_Z9getStringPci+0x90>
    80007850:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80007854:	009984b3          	add	s1,s3,s1
    80007858:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000785c:	00000613          	li	a2,0
    80007860:	00100593          	li	a1,1
    80007864:	00006517          	auipc	a0,0x6
    80007868:	77c50513          	addi	a0,a0,1916 # 8000dfe0 <lockPrint>
    8000786c:	ffffa097          	auipc	ra,0xffffa
    80007870:	894080e7          	jalr	-1900(ra) # 80001100 <copy_and_swap>
    80007874:	fe0514e3          	bnez	a0,8000785c <_Z9getStringPci+0x98>
    return buf;
}
    80007878:	00098513          	mv	a0,s3
    8000787c:	02813083          	ld	ra,40(sp)
    80007880:	02013403          	ld	s0,32(sp)
    80007884:	01813483          	ld	s1,24(sp)
    80007888:	01013903          	ld	s2,16(sp)
    8000788c:	00813983          	ld	s3,8(sp)
    80007890:	00013a03          	ld	s4,0(sp)
    80007894:	03010113          	addi	sp,sp,48
    80007898:	00008067          	ret

000000008000789c <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    8000789c:	ff010113          	addi	sp,sp,-16
    800078a0:	00813423          	sd	s0,8(sp)
    800078a4:	01010413          	addi	s0,sp,16
    800078a8:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800078ac:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800078b0:	0006c603          	lbu	a2,0(a3)
    800078b4:	fd06071b          	addiw	a4,a2,-48
    800078b8:	0ff77713          	andi	a4,a4,255
    800078bc:	00900793          	li	a5,9
    800078c0:	02e7e063          	bltu	a5,a4,800078e0 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800078c4:	0025179b          	slliw	a5,a0,0x2
    800078c8:	00a787bb          	addw	a5,a5,a0
    800078cc:	0017979b          	slliw	a5,a5,0x1
    800078d0:	00168693          	addi	a3,a3,1
    800078d4:	00c787bb          	addw	a5,a5,a2
    800078d8:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800078dc:	fd5ff06f          	j	800078b0 <_Z11stringToIntPKc+0x14>
    return n;
}
    800078e0:	00813403          	ld	s0,8(sp)
    800078e4:	01010113          	addi	sp,sp,16
    800078e8:	00008067          	ret

00000000800078ec <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800078ec:	fc010113          	addi	sp,sp,-64
    800078f0:	02113c23          	sd	ra,56(sp)
    800078f4:	02813823          	sd	s0,48(sp)
    800078f8:	02913423          	sd	s1,40(sp)
    800078fc:	03213023          	sd	s2,32(sp)
    80007900:	01313c23          	sd	s3,24(sp)
    80007904:	04010413          	addi	s0,sp,64
    80007908:	00050493          	mv	s1,a0
    8000790c:	00058913          	mv	s2,a1
    80007910:	00060993          	mv	s3,a2
    LOCK();
    80007914:	00100613          	li	a2,1
    80007918:	00000593          	li	a1,0
    8000791c:	00006517          	auipc	a0,0x6
    80007920:	6c450513          	addi	a0,a0,1732 # 8000dfe0 <lockPrint>
    80007924:	ffff9097          	auipc	ra,0xffff9
    80007928:	7dc080e7          	jalr	2012(ra) # 80001100 <copy_and_swap>
    8000792c:	00050863          	beqz	a0,8000793c <_Z8printIntiii+0x50>
    80007930:	ffffa097          	auipc	ra,0xffffa
    80007934:	ff8080e7          	jalr	-8(ra) # 80001928 <_Z15thread_dispatchv>
    80007938:	fddff06f          	j	80007914 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000793c:	00098463          	beqz	s3,80007944 <_Z8printIntiii+0x58>
    80007940:	0804c463          	bltz	s1,800079c8 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80007944:	0004851b          	sext.w	a0,s1
    neg = 0;
    80007948:	00000593          	li	a1,0
    }

    i = 0;
    8000794c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80007950:	0009079b          	sext.w	a5,s2
    80007954:	0325773b          	remuw	a4,a0,s2
    80007958:	00048613          	mv	a2,s1
    8000795c:	0014849b          	addiw	s1,s1,1
    80007960:	02071693          	slli	a3,a4,0x20
    80007964:	0206d693          	srli	a3,a3,0x20
    80007968:	00006717          	auipc	a4,0x6
    8000796c:	4e070713          	addi	a4,a4,1248 # 8000de48 <digits>
    80007970:	00d70733          	add	a4,a4,a3
    80007974:	00074683          	lbu	a3,0(a4)
    80007978:	fd040713          	addi	a4,s0,-48
    8000797c:	00c70733          	add	a4,a4,a2
    80007980:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80007984:	0005071b          	sext.w	a4,a0
    80007988:	0325553b          	divuw	a0,a0,s2
    8000798c:	fcf772e3          	bgeu	a4,a5,80007950 <_Z8printIntiii+0x64>
    if(neg)
    80007990:	00058c63          	beqz	a1,800079a8 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80007994:	fd040793          	addi	a5,s0,-48
    80007998:	009784b3          	add	s1,a5,s1
    8000799c:	02d00793          	li	a5,45
    800079a0:	fef48823          	sb	a5,-16(s1)
    800079a4:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800079a8:	fff4849b          	addiw	s1,s1,-1
    800079ac:	0204c463          	bltz	s1,800079d4 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800079b0:	fd040793          	addi	a5,s0,-48
    800079b4:	009787b3          	add	a5,a5,s1
    800079b8:	ff07c503          	lbu	a0,-16(a5)
    800079bc:	ffffa097          	auipc	ra,0xffffa
    800079c0:	0c0080e7          	jalr	192(ra) # 80001a7c <_Z4putcc>
    800079c4:	fe5ff06f          	j	800079a8 <_Z8printIntiii+0xbc>
        x = -xx;
    800079c8:	4090053b          	negw	a0,s1
        neg = 1;
    800079cc:	00100593          	li	a1,1
        x = -xx;
    800079d0:	f7dff06f          	j	8000794c <_Z8printIntiii+0x60>

    UNLOCK();
    800079d4:	00000613          	li	a2,0
    800079d8:	00100593          	li	a1,1
    800079dc:	00006517          	auipc	a0,0x6
    800079e0:	60450513          	addi	a0,a0,1540 # 8000dfe0 <lockPrint>
    800079e4:	ffff9097          	auipc	ra,0xffff9
    800079e8:	71c080e7          	jalr	1820(ra) # 80001100 <copy_and_swap>
    800079ec:	fe0514e3          	bnez	a0,800079d4 <_Z8printIntiii+0xe8>
    800079f0:	03813083          	ld	ra,56(sp)
    800079f4:	03013403          	ld	s0,48(sp)
    800079f8:	02813483          	ld	s1,40(sp)
    800079fc:	02013903          	ld	s2,32(sp)
    80007a00:	01813983          	ld	s3,24(sp)
    80007a04:	04010113          	addi	sp,sp,64
    80007a08:	00008067          	ret

0000000080007a0c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80007a0c:	fd010113          	addi	sp,sp,-48
    80007a10:	02113423          	sd	ra,40(sp)
    80007a14:	02813023          	sd	s0,32(sp)
    80007a18:	00913c23          	sd	s1,24(sp)
    80007a1c:	01213823          	sd	s2,16(sp)
    80007a20:	01313423          	sd	s3,8(sp)
    80007a24:	03010413          	addi	s0,sp,48
    80007a28:	00050993          	mv	s3,a0
    80007a2c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80007a30:	00000913          	li	s2,0
    80007a34:	00c0006f          	j	80007a40 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007a38:	ffffa097          	auipc	ra,0xffffa
    80007a3c:	8e0080e7          	jalr	-1824(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80007a40:	ffffa097          	auipc	ra,0xffffa
    80007a44:	014080e7          	jalr	20(ra) # 80001a54 <_Z4getcv>
    80007a48:	0005059b          	sext.w	a1,a0
    80007a4c:	01b00793          	li	a5,27
    80007a50:	02f58a63          	beq	a1,a5,80007a84 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80007a54:	0084b503          	ld	a0,8(s1)
    80007a58:	fffff097          	auipc	ra,0xfffff
    80007a5c:	f24080e7          	jalr	-220(ra) # 8000697c <_ZN9BufferCPP3putEi>
        i++;
    80007a60:	0019071b          	addiw	a4,s2,1
    80007a64:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007a68:	0004a683          	lw	a3,0(s1)
    80007a6c:	0026979b          	slliw	a5,a3,0x2
    80007a70:	00d787bb          	addw	a5,a5,a3
    80007a74:	0017979b          	slliw	a5,a5,0x1
    80007a78:	02f767bb          	remw	a5,a4,a5
    80007a7c:	fc0792e3          	bnez	a5,80007a40 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80007a80:	fb9ff06f          	j	80007a38 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80007a84:	00100793          	li	a5,1
    80007a88:	00006717          	auipc	a4,0x6
    80007a8c:	56f72023          	sw	a5,1376(a4) # 8000dfe8 <_ZL9threadEnd>
    td->buffer->put('!');
    80007a90:	0209b783          	ld	a5,32(s3)
    80007a94:	02100593          	li	a1,33
    80007a98:	0087b503          	ld	a0,8(a5)
    80007a9c:	fffff097          	auipc	ra,0xfffff
    80007aa0:	ee0080e7          	jalr	-288(ra) # 8000697c <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80007aa4:	0104b503          	ld	a0,16(s1)
    80007aa8:	ffffa097          	auipc	ra,0xffffa
    80007aac:	990080e7          	jalr	-1648(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007ab0:	02813083          	ld	ra,40(sp)
    80007ab4:	02013403          	ld	s0,32(sp)
    80007ab8:	01813483          	ld	s1,24(sp)
    80007abc:	01013903          	ld	s2,16(sp)
    80007ac0:	00813983          	ld	s3,8(sp)
    80007ac4:	03010113          	addi	sp,sp,48
    80007ac8:	00008067          	ret

0000000080007acc <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80007acc:	fe010113          	addi	sp,sp,-32
    80007ad0:	00113c23          	sd	ra,24(sp)
    80007ad4:	00813823          	sd	s0,16(sp)
    80007ad8:	00913423          	sd	s1,8(sp)
    80007adc:	01213023          	sd	s2,0(sp)
    80007ae0:	02010413          	addi	s0,sp,32
    80007ae4:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007ae8:	00000913          	li	s2,0
    80007aec:	00c0006f          	j	80007af8 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007af0:	ffffa097          	auipc	ra,0xffffa
    80007af4:	828080e7          	jalr	-2008(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80007af8:	00006797          	auipc	a5,0x6
    80007afc:	4f07a783          	lw	a5,1264(a5) # 8000dfe8 <_ZL9threadEnd>
    80007b00:	02079e63          	bnez	a5,80007b3c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80007b04:	0004a583          	lw	a1,0(s1)
    80007b08:	0305859b          	addiw	a1,a1,48
    80007b0c:	0084b503          	ld	a0,8(s1)
    80007b10:	fffff097          	auipc	ra,0xfffff
    80007b14:	e6c080e7          	jalr	-404(ra) # 8000697c <_ZN9BufferCPP3putEi>
        i++;
    80007b18:	0019071b          	addiw	a4,s2,1
    80007b1c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007b20:	0004a683          	lw	a3,0(s1)
    80007b24:	0026979b          	slliw	a5,a3,0x2
    80007b28:	00d787bb          	addw	a5,a5,a3
    80007b2c:	0017979b          	slliw	a5,a5,0x1
    80007b30:	02f767bb          	remw	a5,a4,a5
    80007b34:	fc0792e3          	bnez	a5,80007af8 <_ZN12ProducerSync8producerEPv+0x2c>
    80007b38:	fb9ff06f          	j	80007af0 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80007b3c:	0104b503          	ld	a0,16(s1)
    80007b40:	ffffa097          	auipc	ra,0xffffa
    80007b44:	8f8080e7          	jalr	-1800(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007b48:	01813083          	ld	ra,24(sp)
    80007b4c:	01013403          	ld	s0,16(sp)
    80007b50:	00813483          	ld	s1,8(sp)
    80007b54:	00013903          	ld	s2,0(sp)
    80007b58:	02010113          	addi	sp,sp,32
    80007b5c:	00008067          	ret

0000000080007b60 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80007b60:	fd010113          	addi	sp,sp,-48
    80007b64:	02113423          	sd	ra,40(sp)
    80007b68:	02813023          	sd	s0,32(sp)
    80007b6c:	00913c23          	sd	s1,24(sp)
    80007b70:	01213823          	sd	s2,16(sp)
    80007b74:	01313423          	sd	s3,8(sp)
    80007b78:	01413023          	sd	s4,0(sp)
    80007b7c:	03010413          	addi	s0,sp,48
    80007b80:	00050993          	mv	s3,a0
    80007b84:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007b88:	00000a13          	li	s4,0
    80007b8c:	01c0006f          	j	80007ba8 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80007b90:	ffff9097          	auipc	ra,0xffff9
    80007b94:	788080e7          	jalr	1928(ra) # 80001318 <_ZN6Thread8dispatchEv>
    80007b98:	0500006f          	j	80007be8 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80007b9c:	00a00513          	li	a0,10
    80007ba0:	ffffa097          	auipc	ra,0xffffa
    80007ba4:	edc080e7          	jalr	-292(ra) # 80001a7c <_Z4putcc>
    while (!threadEnd) {
    80007ba8:	00006797          	auipc	a5,0x6
    80007bac:	4407a783          	lw	a5,1088(a5) # 8000dfe8 <_ZL9threadEnd>
    80007bb0:	06079263          	bnez	a5,80007c14 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80007bb4:	00893503          	ld	a0,8(s2)
    80007bb8:	fffff097          	auipc	ra,0xfffff
    80007bbc:	e54080e7          	jalr	-428(ra) # 80006a0c <_ZN9BufferCPP3getEv>
        i++;
    80007bc0:	001a049b          	addiw	s1,s4,1
    80007bc4:	00048a1b          	sext.w	s4,s1
        putc(key);
    80007bc8:	0ff57513          	andi	a0,a0,255
    80007bcc:	ffffa097          	auipc	ra,0xffffa
    80007bd0:	eb0080e7          	jalr	-336(ra) # 80001a7c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80007bd4:	00092703          	lw	a4,0(s2)
    80007bd8:	0027179b          	slliw	a5,a4,0x2
    80007bdc:	00e787bb          	addw	a5,a5,a4
    80007be0:	02f4e7bb          	remw	a5,s1,a5
    80007be4:	fa0786e3          	beqz	a5,80007b90 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80007be8:	05000793          	li	a5,80
    80007bec:	02f4e4bb          	remw	s1,s1,a5
    80007bf0:	fa049ce3          	bnez	s1,80007ba8 <_ZN12ConsumerSync8consumerEPv+0x48>
    80007bf4:	fa9ff06f          	j	80007b9c <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80007bf8:	0209b783          	ld	a5,32(s3)
    80007bfc:	0087b503          	ld	a0,8(a5)
    80007c00:	fffff097          	auipc	ra,0xfffff
    80007c04:	e0c080e7          	jalr	-500(ra) # 80006a0c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80007c08:	0ff57513          	andi	a0,a0,255
    80007c0c:	ffffb097          	auipc	ra,0xffffb
    80007c10:	978080e7          	jalr	-1672(ra) # 80002584 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80007c14:	0209b783          	ld	a5,32(s3)
    80007c18:	0087b503          	ld	a0,8(a5)
    80007c1c:	fffff097          	auipc	ra,0xfffff
    80007c20:	e7c080e7          	jalr	-388(ra) # 80006a98 <_ZN9BufferCPP6getCntEv>
    80007c24:	fca04ae3          	bgtz	a0,80007bf8 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80007c28:	01093503          	ld	a0,16(s2)
    80007c2c:	ffffa097          	auipc	ra,0xffffa
    80007c30:	80c080e7          	jalr	-2036(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007c34:	02813083          	ld	ra,40(sp)
    80007c38:	02013403          	ld	s0,32(sp)
    80007c3c:	01813483          	ld	s1,24(sp)
    80007c40:	01013903          	ld	s2,16(sp)
    80007c44:	00813983          	ld	s3,8(sp)
    80007c48:	00013a03          	ld	s4,0(sp)
    80007c4c:	03010113          	addi	sp,sp,48
    80007c50:	00008067          	ret

0000000080007c54 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80007c54:	f8010113          	addi	sp,sp,-128
    80007c58:	06113c23          	sd	ra,120(sp)
    80007c5c:	06813823          	sd	s0,112(sp)
    80007c60:	06913423          	sd	s1,104(sp)
    80007c64:	07213023          	sd	s2,96(sp)
    80007c68:	05313c23          	sd	s3,88(sp)
    80007c6c:	05413823          	sd	s4,80(sp)
    80007c70:	05513423          	sd	s5,72(sp)
    80007c74:	05613023          	sd	s6,64(sp)
    80007c78:	03713c23          	sd	s7,56(sp)
    80007c7c:	03813823          	sd	s8,48(sp)
    80007c80:	03913423          	sd	s9,40(sp)
    80007c84:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80007c88:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80007c8c:	00003517          	auipc	a0,0x3
    80007c90:	79450513          	addi	a0,a0,1940 # 8000b420 <CONSOLE_STATUS+0x410>
    80007c94:	00000097          	auipc	ra,0x0
    80007c98:	aa8080e7          	jalr	-1368(ra) # 8000773c <_Z11printStringPKc>
    getString(input, 30);
    80007c9c:	01e00593          	li	a1,30
    80007ca0:	f8040493          	addi	s1,s0,-128
    80007ca4:	00048513          	mv	a0,s1
    80007ca8:	00000097          	auipc	ra,0x0
    80007cac:	b1c080e7          	jalr	-1252(ra) # 800077c4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80007cb0:	00048513          	mv	a0,s1
    80007cb4:	00000097          	auipc	ra,0x0
    80007cb8:	be8080e7          	jalr	-1048(ra) # 8000789c <_Z11stringToIntPKc>
    80007cbc:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80007cc0:	00003517          	auipc	a0,0x3
    80007cc4:	78050513          	addi	a0,a0,1920 # 8000b440 <CONSOLE_STATUS+0x430>
    80007cc8:	00000097          	auipc	ra,0x0
    80007ccc:	a74080e7          	jalr	-1420(ra) # 8000773c <_Z11printStringPKc>
    getString(input, 30);
    80007cd0:	01e00593          	li	a1,30
    80007cd4:	00048513          	mv	a0,s1
    80007cd8:	00000097          	auipc	ra,0x0
    80007cdc:	aec080e7          	jalr	-1300(ra) # 800077c4 <_Z9getStringPci>
    n = stringToInt(input);
    80007ce0:	00048513          	mv	a0,s1
    80007ce4:	00000097          	auipc	ra,0x0
    80007ce8:	bb8080e7          	jalr	-1096(ra) # 8000789c <_Z11stringToIntPKc>
    80007cec:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80007cf0:	00003517          	auipc	a0,0x3
    80007cf4:	77050513          	addi	a0,a0,1904 # 8000b460 <CONSOLE_STATUS+0x450>
    80007cf8:	00000097          	auipc	ra,0x0
    80007cfc:	a44080e7          	jalr	-1468(ra) # 8000773c <_Z11printStringPKc>
    80007d00:	00000613          	li	a2,0
    80007d04:	00a00593          	li	a1,10
    80007d08:	00090513          	mv	a0,s2
    80007d0c:	00000097          	auipc	ra,0x0
    80007d10:	be0080e7          	jalr	-1056(ra) # 800078ec <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80007d14:	00003517          	auipc	a0,0x3
    80007d18:	76450513          	addi	a0,a0,1892 # 8000b478 <CONSOLE_STATUS+0x468>
    80007d1c:	00000097          	auipc	ra,0x0
    80007d20:	a20080e7          	jalr	-1504(ra) # 8000773c <_Z11printStringPKc>
    80007d24:	00000613          	li	a2,0
    80007d28:	00a00593          	li	a1,10
    80007d2c:	00048513          	mv	a0,s1
    80007d30:	00000097          	auipc	ra,0x0
    80007d34:	bbc080e7          	jalr	-1092(ra) # 800078ec <_Z8printIntiii>
    printString(".\n");
    80007d38:	00003517          	auipc	a0,0x3
    80007d3c:	75850513          	addi	a0,a0,1880 # 8000b490 <CONSOLE_STATUS+0x480>
    80007d40:	00000097          	auipc	ra,0x0
    80007d44:	9fc080e7          	jalr	-1540(ra) # 8000773c <_Z11printStringPKc>
    if(threadNum > n) {
    80007d48:	0324c463          	blt	s1,s2,80007d70 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80007d4c:	03205c63          	blez	s2,80007d84 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80007d50:	03800513          	li	a0,56
    80007d54:	ffff9097          	auipc	ra,0xffff9
    80007d58:	468080e7          	jalr	1128(ra) # 800011bc <_Znwm>
    80007d5c:	00050a93          	mv	s5,a0
    80007d60:	00048593          	mv	a1,s1
    80007d64:	fffff097          	auipc	ra,0xfffff
    80007d68:	ac4080e7          	jalr	-1340(ra) # 80006828 <_ZN9BufferCPPC1Ei>
    80007d6c:	0300006f          	j	80007d9c <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80007d70:	00003517          	auipc	a0,0x3
    80007d74:	72850513          	addi	a0,a0,1832 # 8000b498 <CONSOLE_STATUS+0x488>
    80007d78:	00000097          	auipc	ra,0x0
    80007d7c:	9c4080e7          	jalr	-1596(ra) # 8000773c <_Z11printStringPKc>
        return;
    80007d80:	0140006f          	j	80007d94 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80007d84:	00003517          	auipc	a0,0x3
    80007d88:	75450513          	addi	a0,a0,1876 # 8000b4d8 <CONSOLE_STATUS+0x4c8>
    80007d8c:	00000097          	auipc	ra,0x0
    80007d90:	9b0080e7          	jalr	-1616(ra) # 8000773c <_Z11printStringPKc>
        return;
    80007d94:	000b8113          	mv	sp,s7
    80007d98:	2380006f          	j	80007fd0 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80007d9c:	01000513          	li	a0,16
    80007da0:	ffff9097          	auipc	ra,0xffff9
    80007da4:	41c080e7          	jalr	1052(ra) # 800011bc <_Znwm>
    80007da8:	00050493          	mv	s1,a0
    80007dac:	00000593          	li	a1,0
    80007db0:	ffff9097          	auipc	ra,0xffff9
    80007db4:	624080e7          	jalr	1572(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80007db8:	00006797          	auipc	a5,0x6
    80007dbc:	2297bc23          	sd	s1,568(a5) # 8000dff0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80007dc0:	00391793          	slli	a5,s2,0x3
    80007dc4:	00f78793          	addi	a5,a5,15
    80007dc8:	ff07f793          	andi	a5,a5,-16
    80007dcc:	40f10133          	sub	sp,sp,a5
    80007dd0:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80007dd4:	0019071b          	addiw	a4,s2,1
    80007dd8:	00171793          	slli	a5,a4,0x1
    80007ddc:	00e787b3          	add	a5,a5,a4
    80007de0:	00379793          	slli	a5,a5,0x3
    80007de4:	00f78793          	addi	a5,a5,15
    80007de8:	ff07f793          	andi	a5,a5,-16
    80007dec:	40f10133          	sub	sp,sp,a5
    80007df0:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80007df4:	00191c13          	slli	s8,s2,0x1
    80007df8:	012c07b3          	add	a5,s8,s2
    80007dfc:	00379793          	slli	a5,a5,0x3
    80007e00:	00fa07b3          	add	a5,s4,a5
    80007e04:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80007e08:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80007e0c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80007e10:	02800513          	li	a0,40
    80007e14:	ffff9097          	auipc	ra,0xffff9
    80007e18:	3a8080e7          	jalr	936(ra) # 800011bc <_Znwm>
    80007e1c:	00050b13          	mv	s6,a0
    80007e20:	012c0c33          	add	s8,s8,s2
    80007e24:	003c1c13          	slli	s8,s8,0x3
    80007e28:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80007e2c:	ffff9097          	auipc	ra,0xffff9
    80007e30:	574080e7          	jalr	1396(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007e34:	00006797          	auipc	a5,0x6
    80007e38:	08c78793          	addi	a5,a5,140 # 8000dec0 <_ZTV12ConsumerSync+0x10>
    80007e3c:	00fb3023          	sd	a5,0(s6)
    80007e40:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80007e44:	000b0513          	mv	a0,s6
    80007e48:	ffff9097          	auipc	ra,0xffff9
    80007e4c:	470080e7          	jalr	1136(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80007e50:	00000493          	li	s1,0
    80007e54:	0380006f          	j	80007e8c <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80007e58:	00006797          	auipc	a5,0x6
    80007e5c:	04078793          	addi	a5,a5,64 # 8000de98 <_ZTV12ProducerSync+0x10>
    80007e60:	00fcb023          	sd	a5,0(s9)
    80007e64:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80007e68:	00349793          	slli	a5,s1,0x3
    80007e6c:	00f987b3          	add	a5,s3,a5
    80007e70:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80007e74:	00349793          	slli	a5,s1,0x3
    80007e78:	00f987b3          	add	a5,s3,a5
    80007e7c:	0007b503          	ld	a0,0(a5)
    80007e80:	ffff9097          	auipc	ra,0xffff9
    80007e84:	438080e7          	jalr	1080(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80007e88:	0014849b          	addiw	s1,s1,1
    80007e8c:	0b24d063          	bge	s1,s2,80007f2c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80007e90:	00149793          	slli	a5,s1,0x1
    80007e94:	009787b3          	add	a5,a5,s1
    80007e98:	00379793          	slli	a5,a5,0x3
    80007e9c:	00fa07b3          	add	a5,s4,a5
    80007ea0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80007ea4:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80007ea8:	00006717          	auipc	a4,0x6
    80007eac:	14873703          	ld	a4,328(a4) # 8000dff0 <_ZL10waitForAll>
    80007eb0:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80007eb4:	02905863          	blez	s1,80007ee4 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80007eb8:	02800513          	li	a0,40
    80007ebc:	ffff9097          	auipc	ra,0xffff9
    80007ec0:	300080e7          	jalr	768(ra) # 800011bc <_Znwm>
    80007ec4:	00050c93          	mv	s9,a0
    80007ec8:	00149c13          	slli	s8,s1,0x1
    80007ecc:	009c0c33          	add	s8,s8,s1
    80007ed0:	003c1c13          	slli	s8,s8,0x3
    80007ed4:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80007ed8:	ffff9097          	auipc	ra,0xffff9
    80007edc:	4c8080e7          	jalr	1224(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007ee0:	f79ff06f          	j	80007e58 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80007ee4:	02800513          	li	a0,40
    80007ee8:	ffff9097          	auipc	ra,0xffff9
    80007eec:	2d4080e7          	jalr	724(ra) # 800011bc <_Znwm>
    80007ef0:	00050c93          	mv	s9,a0
    80007ef4:	00149c13          	slli	s8,s1,0x1
    80007ef8:	009c0c33          	add	s8,s8,s1
    80007efc:	003c1c13          	slli	s8,s8,0x3
    80007f00:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80007f04:	ffff9097          	auipc	ra,0xffff9
    80007f08:	49c080e7          	jalr	1180(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007f0c:	00006797          	auipc	a5,0x6
    80007f10:	f6478793          	addi	a5,a5,-156 # 8000de70 <_ZTV16ProducerKeyboard+0x10>
    80007f14:	00fcb023          	sd	a5,0(s9)
    80007f18:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80007f1c:	00349793          	slli	a5,s1,0x3
    80007f20:	00f987b3          	add	a5,s3,a5
    80007f24:	0197b023          	sd	s9,0(a5)
    80007f28:	f4dff06f          	j	80007e74 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80007f2c:	ffff9097          	auipc	ra,0xffff9
    80007f30:	3ec080e7          	jalr	1004(ra) # 80001318 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80007f34:	00000493          	li	s1,0
    80007f38:	00994e63          	blt	s2,s1,80007f54 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80007f3c:	00006517          	auipc	a0,0x6
    80007f40:	0b453503          	ld	a0,180(a0) # 8000dff0 <_ZL10waitForAll>
    80007f44:	ffff9097          	auipc	ra,0xffff9
    80007f48:	4c8080e7          	jalr	1224(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80007f4c:	0014849b          	addiw	s1,s1,1
    80007f50:	fe9ff06f          	j	80007f38 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80007f54:	00000493          	li	s1,0
    80007f58:	0080006f          	j	80007f60 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80007f5c:	0014849b          	addiw	s1,s1,1
    80007f60:	0324d263          	bge	s1,s2,80007f84 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80007f64:	00349793          	slli	a5,s1,0x3
    80007f68:	00f987b3          	add	a5,s3,a5
    80007f6c:	0007b503          	ld	a0,0(a5)
    80007f70:	fe0506e3          	beqz	a0,80007f5c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80007f74:	00053783          	ld	a5,0(a0)
    80007f78:	0087b783          	ld	a5,8(a5)
    80007f7c:	000780e7          	jalr	a5
    80007f80:	fddff06f          	j	80007f5c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80007f84:	000b0a63          	beqz	s6,80007f98 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80007f88:	000b3783          	ld	a5,0(s6)
    80007f8c:	0087b783          	ld	a5,8(a5)
    80007f90:	000b0513          	mv	a0,s6
    80007f94:	000780e7          	jalr	a5
    delete waitForAll;
    80007f98:	00006517          	auipc	a0,0x6
    80007f9c:	05853503          	ld	a0,88(a0) # 8000dff0 <_ZL10waitForAll>
    80007fa0:	00050863          	beqz	a0,80007fb0 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80007fa4:	00053783          	ld	a5,0(a0)
    80007fa8:	0087b783          	ld	a5,8(a5)
    80007fac:	000780e7          	jalr	a5
    delete buffer;
    80007fb0:	000a8e63          	beqz	s5,80007fcc <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80007fb4:	000a8513          	mv	a0,s5
    80007fb8:	fffff097          	auipc	ra,0xfffff
    80007fbc:	b68080e7          	jalr	-1176(ra) # 80006b20 <_ZN9BufferCPPD1Ev>
    80007fc0:	000a8513          	mv	a0,s5
    80007fc4:	ffff9097          	auipc	ra,0xffff9
    80007fc8:	220080e7          	jalr	544(ra) # 800011e4 <_ZdlPv>
    80007fcc:	000b8113          	mv	sp,s7

}
    80007fd0:	f8040113          	addi	sp,s0,-128
    80007fd4:	07813083          	ld	ra,120(sp)
    80007fd8:	07013403          	ld	s0,112(sp)
    80007fdc:	06813483          	ld	s1,104(sp)
    80007fe0:	06013903          	ld	s2,96(sp)
    80007fe4:	05813983          	ld	s3,88(sp)
    80007fe8:	05013a03          	ld	s4,80(sp)
    80007fec:	04813a83          	ld	s5,72(sp)
    80007ff0:	04013b03          	ld	s6,64(sp)
    80007ff4:	03813b83          	ld	s7,56(sp)
    80007ff8:	03013c03          	ld	s8,48(sp)
    80007ffc:	02813c83          	ld	s9,40(sp)
    80008000:	08010113          	addi	sp,sp,128
    80008004:	00008067          	ret
    80008008:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000800c:	000a8513          	mv	a0,s5
    80008010:	ffff9097          	auipc	ra,0xffff9
    80008014:	1d4080e7          	jalr	468(ra) # 800011e4 <_ZdlPv>
    80008018:	00048513          	mv	a0,s1
    8000801c:	00007097          	auipc	ra,0x7
    80008020:	0ac080e7          	jalr	172(ra) # 8000f0c8 <_Unwind_Resume>
    80008024:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80008028:	00048513          	mv	a0,s1
    8000802c:	ffff9097          	auipc	ra,0xffff9
    80008030:	1b8080e7          	jalr	440(ra) # 800011e4 <_ZdlPv>
    80008034:	00090513          	mv	a0,s2
    80008038:	00007097          	auipc	ra,0x7
    8000803c:	090080e7          	jalr	144(ra) # 8000f0c8 <_Unwind_Resume>
    80008040:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80008044:	000b0513          	mv	a0,s6
    80008048:	ffff9097          	auipc	ra,0xffff9
    8000804c:	19c080e7          	jalr	412(ra) # 800011e4 <_ZdlPv>
    80008050:	00048513          	mv	a0,s1
    80008054:	00007097          	auipc	ra,0x7
    80008058:	074080e7          	jalr	116(ra) # 8000f0c8 <_Unwind_Resume>
    8000805c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80008060:	000c8513          	mv	a0,s9
    80008064:	ffff9097          	auipc	ra,0xffff9
    80008068:	180080e7          	jalr	384(ra) # 800011e4 <_ZdlPv>
    8000806c:	00048513          	mv	a0,s1
    80008070:	00007097          	auipc	ra,0x7
    80008074:	058080e7          	jalr	88(ra) # 8000f0c8 <_Unwind_Resume>
    80008078:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    8000807c:	000c8513          	mv	a0,s9
    80008080:	ffff9097          	auipc	ra,0xffff9
    80008084:	164080e7          	jalr	356(ra) # 800011e4 <_ZdlPv>
    80008088:	00048513          	mv	a0,s1
    8000808c:	00007097          	auipc	ra,0x7
    80008090:	03c080e7          	jalr	60(ra) # 8000f0c8 <_Unwind_Resume>

0000000080008094 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80008094:	ff010113          	addi	sp,sp,-16
    80008098:	00113423          	sd	ra,8(sp)
    8000809c:	00813023          	sd	s0,0(sp)
    800080a0:	01010413          	addi	s0,sp,16
    800080a4:	00006797          	auipc	a5,0x6
    800080a8:	e1c78793          	addi	a5,a5,-484 # 8000dec0 <_ZTV12ConsumerSync+0x10>
    800080ac:	00f53023          	sd	a5,0(a0)
    800080b0:	ffff9097          	auipc	ra,0xffff9
    800080b4:	09c080e7          	jalr	156(ra) # 8000114c <_ZN6ThreadD1Ev>
    800080b8:	00813083          	ld	ra,8(sp)
    800080bc:	00013403          	ld	s0,0(sp)
    800080c0:	01010113          	addi	sp,sp,16
    800080c4:	00008067          	ret

00000000800080c8 <_ZN12ConsumerSyncD0Ev>:
    800080c8:	fe010113          	addi	sp,sp,-32
    800080cc:	00113c23          	sd	ra,24(sp)
    800080d0:	00813823          	sd	s0,16(sp)
    800080d4:	00913423          	sd	s1,8(sp)
    800080d8:	02010413          	addi	s0,sp,32
    800080dc:	00050493          	mv	s1,a0
    800080e0:	00006797          	auipc	a5,0x6
    800080e4:	de078793          	addi	a5,a5,-544 # 8000dec0 <_ZTV12ConsumerSync+0x10>
    800080e8:	00f53023          	sd	a5,0(a0)
    800080ec:	ffff9097          	auipc	ra,0xffff9
    800080f0:	060080e7          	jalr	96(ra) # 8000114c <_ZN6ThreadD1Ev>
    800080f4:	00048513          	mv	a0,s1
    800080f8:	ffff9097          	auipc	ra,0xffff9
    800080fc:	0ec080e7          	jalr	236(ra) # 800011e4 <_ZdlPv>
    80008100:	01813083          	ld	ra,24(sp)
    80008104:	01013403          	ld	s0,16(sp)
    80008108:	00813483          	ld	s1,8(sp)
    8000810c:	02010113          	addi	sp,sp,32
    80008110:	00008067          	ret

0000000080008114 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80008114:	ff010113          	addi	sp,sp,-16
    80008118:	00113423          	sd	ra,8(sp)
    8000811c:	00813023          	sd	s0,0(sp)
    80008120:	01010413          	addi	s0,sp,16
    80008124:	00006797          	auipc	a5,0x6
    80008128:	d7478793          	addi	a5,a5,-652 # 8000de98 <_ZTV12ProducerSync+0x10>
    8000812c:	00f53023          	sd	a5,0(a0)
    80008130:	ffff9097          	auipc	ra,0xffff9
    80008134:	01c080e7          	jalr	28(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008138:	00813083          	ld	ra,8(sp)
    8000813c:	00013403          	ld	s0,0(sp)
    80008140:	01010113          	addi	sp,sp,16
    80008144:	00008067          	ret

0000000080008148 <_ZN12ProducerSyncD0Ev>:
    80008148:	fe010113          	addi	sp,sp,-32
    8000814c:	00113c23          	sd	ra,24(sp)
    80008150:	00813823          	sd	s0,16(sp)
    80008154:	00913423          	sd	s1,8(sp)
    80008158:	02010413          	addi	s0,sp,32
    8000815c:	00050493          	mv	s1,a0
    80008160:	00006797          	auipc	a5,0x6
    80008164:	d3878793          	addi	a5,a5,-712 # 8000de98 <_ZTV12ProducerSync+0x10>
    80008168:	00f53023          	sd	a5,0(a0)
    8000816c:	ffff9097          	auipc	ra,0xffff9
    80008170:	fe0080e7          	jalr	-32(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008174:	00048513          	mv	a0,s1
    80008178:	ffff9097          	auipc	ra,0xffff9
    8000817c:	06c080e7          	jalr	108(ra) # 800011e4 <_ZdlPv>
    80008180:	01813083          	ld	ra,24(sp)
    80008184:	01013403          	ld	s0,16(sp)
    80008188:	00813483          	ld	s1,8(sp)
    8000818c:	02010113          	addi	sp,sp,32
    80008190:	00008067          	ret

0000000080008194 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80008194:	ff010113          	addi	sp,sp,-16
    80008198:	00113423          	sd	ra,8(sp)
    8000819c:	00813023          	sd	s0,0(sp)
    800081a0:	01010413          	addi	s0,sp,16
    800081a4:	00006797          	auipc	a5,0x6
    800081a8:	ccc78793          	addi	a5,a5,-820 # 8000de70 <_ZTV16ProducerKeyboard+0x10>
    800081ac:	00f53023          	sd	a5,0(a0)
    800081b0:	ffff9097          	auipc	ra,0xffff9
    800081b4:	f9c080e7          	jalr	-100(ra) # 8000114c <_ZN6ThreadD1Ev>
    800081b8:	00813083          	ld	ra,8(sp)
    800081bc:	00013403          	ld	s0,0(sp)
    800081c0:	01010113          	addi	sp,sp,16
    800081c4:	00008067          	ret

00000000800081c8 <_ZN16ProducerKeyboardD0Ev>:
    800081c8:	fe010113          	addi	sp,sp,-32
    800081cc:	00113c23          	sd	ra,24(sp)
    800081d0:	00813823          	sd	s0,16(sp)
    800081d4:	00913423          	sd	s1,8(sp)
    800081d8:	02010413          	addi	s0,sp,32
    800081dc:	00050493          	mv	s1,a0
    800081e0:	00006797          	auipc	a5,0x6
    800081e4:	c9078793          	addi	a5,a5,-880 # 8000de70 <_ZTV16ProducerKeyboard+0x10>
    800081e8:	00f53023          	sd	a5,0(a0)
    800081ec:	ffff9097          	auipc	ra,0xffff9
    800081f0:	f60080e7          	jalr	-160(ra) # 8000114c <_ZN6ThreadD1Ev>
    800081f4:	00048513          	mv	a0,s1
    800081f8:	ffff9097          	auipc	ra,0xffff9
    800081fc:	fec080e7          	jalr	-20(ra) # 800011e4 <_ZdlPv>
    80008200:	01813083          	ld	ra,24(sp)
    80008204:	01013403          	ld	s0,16(sp)
    80008208:	00813483          	ld	s1,8(sp)
    8000820c:	02010113          	addi	sp,sp,32
    80008210:	00008067          	ret

0000000080008214 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80008214:	ff010113          	addi	sp,sp,-16
    80008218:	00113423          	sd	ra,8(sp)
    8000821c:	00813023          	sd	s0,0(sp)
    80008220:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80008224:	02053583          	ld	a1,32(a0)
    80008228:	fffff097          	auipc	ra,0xfffff
    8000822c:	7e4080e7          	jalr	2020(ra) # 80007a0c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80008230:	00813083          	ld	ra,8(sp)
    80008234:	00013403          	ld	s0,0(sp)
    80008238:	01010113          	addi	sp,sp,16
    8000823c:	00008067          	ret

0000000080008240 <_ZN12ProducerSync3runEv>:
    void run() override {
    80008240:	ff010113          	addi	sp,sp,-16
    80008244:	00113423          	sd	ra,8(sp)
    80008248:	00813023          	sd	s0,0(sp)
    8000824c:	01010413          	addi	s0,sp,16
        producer(td);
    80008250:	02053583          	ld	a1,32(a0)
    80008254:	00000097          	auipc	ra,0x0
    80008258:	878080e7          	jalr	-1928(ra) # 80007acc <_ZN12ProducerSync8producerEPv>
    }
    8000825c:	00813083          	ld	ra,8(sp)
    80008260:	00013403          	ld	s0,0(sp)
    80008264:	01010113          	addi	sp,sp,16
    80008268:	00008067          	ret

000000008000826c <_ZN12ConsumerSync3runEv>:
    void run() override {
    8000826c:	ff010113          	addi	sp,sp,-16
    80008270:	00113423          	sd	ra,8(sp)
    80008274:	00813023          	sd	s0,0(sp)
    80008278:	01010413          	addi	s0,sp,16
        consumer(td);
    8000827c:	02053583          	ld	a1,32(a0)
    80008280:	00000097          	auipc	ra,0x0
    80008284:	8e0080e7          	jalr	-1824(ra) # 80007b60 <_ZN12ConsumerSync8consumerEPv>
    }
    80008288:	00813083          	ld	ra,8(sp)
    8000828c:	00013403          	ld	s0,0(sp)
    80008290:	01010113          	addi	sp,sp,16
    80008294:	00008067          	ret

0000000080008298 <start>:
    80008298:	ff010113          	addi	sp,sp,-16
    8000829c:	00813423          	sd	s0,8(sp)
    800082a0:	01010413          	addi	s0,sp,16
    800082a4:	300027f3          	csrr	a5,mstatus
    800082a8:	ffffe737          	lui	a4,0xffffe
    800082ac:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffef59f>
    800082b0:	00e7f7b3          	and	a5,a5,a4
    800082b4:	00001737          	lui	a4,0x1
    800082b8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800082bc:	00e7e7b3          	or	a5,a5,a4
    800082c0:	30079073          	csrw	mstatus,a5
    800082c4:	00000797          	auipc	a5,0x0
    800082c8:	16078793          	addi	a5,a5,352 # 80008424 <system_main>
    800082cc:	34179073          	csrw	mepc,a5
    800082d0:	00000793          	li	a5,0
    800082d4:	18079073          	csrw	satp,a5
    800082d8:	000107b7          	lui	a5,0x10
    800082dc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800082e0:	30279073          	csrw	medeleg,a5
    800082e4:	30379073          	csrw	mideleg,a5
    800082e8:	104027f3          	csrr	a5,sie
    800082ec:	2227e793          	ori	a5,a5,546
    800082f0:	10479073          	csrw	sie,a5
    800082f4:	fff00793          	li	a5,-1
    800082f8:	00a7d793          	srli	a5,a5,0xa
    800082fc:	3b079073          	csrw	pmpaddr0,a5
    80008300:	00f00793          	li	a5,15
    80008304:	3a079073          	csrw	pmpcfg0,a5
    80008308:	f14027f3          	csrr	a5,mhartid
    8000830c:	0200c737          	lui	a4,0x200c
    80008310:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80008314:	0007869b          	sext.w	a3,a5
    80008318:	00269713          	slli	a4,a3,0x2
    8000831c:	000f4637          	lui	a2,0xf4
    80008320:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80008324:	00d70733          	add	a4,a4,a3
    80008328:	0037979b          	slliw	a5,a5,0x3
    8000832c:	020046b7          	lui	a3,0x2004
    80008330:	00d787b3          	add	a5,a5,a3
    80008334:	00c585b3          	add	a1,a1,a2
    80008338:	00371693          	slli	a3,a4,0x3
    8000833c:	00006717          	auipc	a4,0x6
    80008340:	cc470713          	addi	a4,a4,-828 # 8000e000 <timer_scratch>
    80008344:	00b7b023          	sd	a1,0(a5)
    80008348:	00d70733          	add	a4,a4,a3
    8000834c:	00f73c23          	sd	a5,24(a4)
    80008350:	02c73023          	sd	a2,32(a4)
    80008354:	34071073          	csrw	mscratch,a4
    80008358:	00000797          	auipc	a5,0x0
    8000835c:	6e878793          	addi	a5,a5,1768 # 80008a40 <timervec>
    80008360:	30579073          	csrw	mtvec,a5
    80008364:	300027f3          	csrr	a5,mstatus
    80008368:	0087e793          	ori	a5,a5,8
    8000836c:	30079073          	csrw	mstatus,a5
    80008370:	304027f3          	csrr	a5,mie
    80008374:	0807e793          	ori	a5,a5,128
    80008378:	30479073          	csrw	mie,a5
    8000837c:	f14027f3          	csrr	a5,mhartid
    80008380:	0007879b          	sext.w	a5,a5
    80008384:	00078213          	mv	tp,a5
    80008388:	30200073          	mret
    8000838c:	00813403          	ld	s0,8(sp)
    80008390:	01010113          	addi	sp,sp,16
    80008394:	00008067          	ret

0000000080008398 <timerinit>:
    80008398:	ff010113          	addi	sp,sp,-16
    8000839c:	00813423          	sd	s0,8(sp)
    800083a0:	01010413          	addi	s0,sp,16
    800083a4:	f14027f3          	csrr	a5,mhartid
    800083a8:	0200c737          	lui	a4,0x200c
    800083ac:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800083b0:	0007869b          	sext.w	a3,a5
    800083b4:	00269713          	slli	a4,a3,0x2
    800083b8:	000f4637          	lui	a2,0xf4
    800083bc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800083c0:	00d70733          	add	a4,a4,a3
    800083c4:	0037979b          	slliw	a5,a5,0x3
    800083c8:	020046b7          	lui	a3,0x2004
    800083cc:	00d787b3          	add	a5,a5,a3
    800083d0:	00c585b3          	add	a1,a1,a2
    800083d4:	00371693          	slli	a3,a4,0x3
    800083d8:	00006717          	auipc	a4,0x6
    800083dc:	c2870713          	addi	a4,a4,-984 # 8000e000 <timer_scratch>
    800083e0:	00b7b023          	sd	a1,0(a5)
    800083e4:	00d70733          	add	a4,a4,a3
    800083e8:	00f73c23          	sd	a5,24(a4)
    800083ec:	02c73023          	sd	a2,32(a4)
    800083f0:	34071073          	csrw	mscratch,a4
    800083f4:	00000797          	auipc	a5,0x0
    800083f8:	64c78793          	addi	a5,a5,1612 # 80008a40 <timervec>
    800083fc:	30579073          	csrw	mtvec,a5
    80008400:	300027f3          	csrr	a5,mstatus
    80008404:	0087e793          	ori	a5,a5,8
    80008408:	30079073          	csrw	mstatus,a5
    8000840c:	304027f3          	csrr	a5,mie
    80008410:	0807e793          	ori	a5,a5,128
    80008414:	30479073          	csrw	mie,a5
    80008418:	00813403          	ld	s0,8(sp)
    8000841c:	01010113          	addi	sp,sp,16
    80008420:	00008067          	ret

0000000080008424 <system_main>:
    80008424:	fe010113          	addi	sp,sp,-32
    80008428:	00813823          	sd	s0,16(sp)
    8000842c:	00913423          	sd	s1,8(sp)
    80008430:	00113c23          	sd	ra,24(sp)
    80008434:	02010413          	addi	s0,sp,32
    80008438:	00000097          	auipc	ra,0x0
    8000843c:	0c4080e7          	jalr	196(ra) # 800084fc <cpuid>
    80008440:	00006497          	auipc	s1,0x6
    80008444:	b0048493          	addi	s1,s1,-1280 # 8000df40 <started>
    80008448:	02050263          	beqz	a0,8000846c <system_main+0x48>
    8000844c:	0004a783          	lw	a5,0(s1)
    80008450:	0007879b          	sext.w	a5,a5
    80008454:	fe078ce3          	beqz	a5,8000844c <system_main+0x28>
    80008458:	0ff0000f          	fence
    8000845c:	00003517          	auipc	a0,0x3
    80008460:	4f450513          	addi	a0,a0,1268 # 8000b950 <CONSOLE_STATUS+0x940>
    80008464:	00001097          	auipc	ra,0x1
    80008468:	a78080e7          	jalr	-1416(ra) # 80008edc <panic>
    8000846c:	00001097          	auipc	ra,0x1
    80008470:	9cc080e7          	jalr	-1588(ra) # 80008e38 <consoleinit>
    80008474:	00001097          	auipc	ra,0x1
    80008478:	158080e7          	jalr	344(ra) # 800095cc <printfinit>
    8000847c:	00003517          	auipc	a0,0x3
    80008480:	35450513          	addi	a0,a0,852 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80008484:	00001097          	auipc	ra,0x1
    80008488:	ab4080e7          	jalr	-1356(ra) # 80008f38 <__printf>
    8000848c:	00003517          	auipc	a0,0x3
    80008490:	49450513          	addi	a0,a0,1172 # 8000b920 <CONSOLE_STATUS+0x910>
    80008494:	00001097          	auipc	ra,0x1
    80008498:	aa4080e7          	jalr	-1372(ra) # 80008f38 <__printf>
    8000849c:	00003517          	auipc	a0,0x3
    800084a0:	33450513          	addi	a0,a0,820 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    800084a4:	00001097          	auipc	ra,0x1
    800084a8:	a94080e7          	jalr	-1388(ra) # 80008f38 <__printf>
    800084ac:	00001097          	auipc	ra,0x1
    800084b0:	4ac080e7          	jalr	1196(ra) # 80009958 <kinit>
    800084b4:	00000097          	auipc	ra,0x0
    800084b8:	148080e7          	jalr	328(ra) # 800085fc <trapinit>
    800084bc:	00000097          	auipc	ra,0x0
    800084c0:	16c080e7          	jalr	364(ra) # 80008628 <trapinithart>
    800084c4:	00000097          	auipc	ra,0x0
    800084c8:	5bc080e7          	jalr	1468(ra) # 80008a80 <plicinit>
    800084cc:	00000097          	auipc	ra,0x0
    800084d0:	5dc080e7          	jalr	1500(ra) # 80008aa8 <plicinithart>
    800084d4:	00000097          	auipc	ra,0x0
    800084d8:	078080e7          	jalr	120(ra) # 8000854c <userinit>
    800084dc:	0ff0000f          	fence
    800084e0:	00100793          	li	a5,1
    800084e4:	00003517          	auipc	a0,0x3
    800084e8:	45450513          	addi	a0,a0,1108 # 8000b938 <CONSOLE_STATUS+0x928>
    800084ec:	00f4a023          	sw	a5,0(s1)
    800084f0:	00001097          	auipc	ra,0x1
    800084f4:	a48080e7          	jalr	-1464(ra) # 80008f38 <__printf>
    800084f8:	0000006f          	j	800084f8 <system_main+0xd4>

00000000800084fc <cpuid>:
    800084fc:	ff010113          	addi	sp,sp,-16
    80008500:	00813423          	sd	s0,8(sp)
    80008504:	01010413          	addi	s0,sp,16
    80008508:	00020513          	mv	a0,tp
    8000850c:	00813403          	ld	s0,8(sp)
    80008510:	0005051b          	sext.w	a0,a0
    80008514:	01010113          	addi	sp,sp,16
    80008518:	00008067          	ret

000000008000851c <mycpu>:
    8000851c:	ff010113          	addi	sp,sp,-16
    80008520:	00813423          	sd	s0,8(sp)
    80008524:	01010413          	addi	s0,sp,16
    80008528:	00020793          	mv	a5,tp
    8000852c:	00813403          	ld	s0,8(sp)
    80008530:	0007879b          	sext.w	a5,a5
    80008534:	00779793          	slli	a5,a5,0x7
    80008538:	00007517          	auipc	a0,0x7
    8000853c:	af850513          	addi	a0,a0,-1288 # 8000f030 <cpus>
    80008540:	00f50533          	add	a0,a0,a5
    80008544:	01010113          	addi	sp,sp,16
    80008548:	00008067          	ret

000000008000854c <userinit>:
    8000854c:	ff010113          	addi	sp,sp,-16
    80008550:	00813423          	sd	s0,8(sp)
    80008554:	01010413          	addi	s0,sp,16
    80008558:	00813403          	ld	s0,8(sp)
    8000855c:	01010113          	addi	sp,sp,16
    80008560:	ffff9317          	auipc	t1,0xffff9
    80008564:	72030067          	jr	1824(t1) # 80001c80 <main>

0000000080008568 <either_copyout>:
    80008568:	ff010113          	addi	sp,sp,-16
    8000856c:	00813023          	sd	s0,0(sp)
    80008570:	00113423          	sd	ra,8(sp)
    80008574:	01010413          	addi	s0,sp,16
    80008578:	02051663          	bnez	a0,800085a4 <either_copyout+0x3c>
    8000857c:	00058513          	mv	a0,a1
    80008580:	00060593          	mv	a1,a2
    80008584:	0006861b          	sext.w	a2,a3
    80008588:	00002097          	auipc	ra,0x2
    8000858c:	c5c080e7          	jalr	-932(ra) # 8000a1e4 <__memmove>
    80008590:	00813083          	ld	ra,8(sp)
    80008594:	00013403          	ld	s0,0(sp)
    80008598:	00000513          	li	a0,0
    8000859c:	01010113          	addi	sp,sp,16
    800085a0:	00008067          	ret
    800085a4:	00003517          	auipc	a0,0x3
    800085a8:	3d450513          	addi	a0,a0,980 # 8000b978 <CONSOLE_STATUS+0x968>
    800085ac:	00001097          	auipc	ra,0x1
    800085b0:	930080e7          	jalr	-1744(ra) # 80008edc <panic>

00000000800085b4 <either_copyin>:
    800085b4:	ff010113          	addi	sp,sp,-16
    800085b8:	00813023          	sd	s0,0(sp)
    800085bc:	00113423          	sd	ra,8(sp)
    800085c0:	01010413          	addi	s0,sp,16
    800085c4:	02059463          	bnez	a1,800085ec <either_copyin+0x38>
    800085c8:	00060593          	mv	a1,a2
    800085cc:	0006861b          	sext.w	a2,a3
    800085d0:	00002097          	auipc	ra,0x2
    800085d4:	c14080e7          	jalr	-1004(ra) # 8000a1e4 <__memmove>
    800085d8:	00813083          	ld	ra,8(sp)
    800085dc:	00013403          	ld	s0,0(sp)
    800085e0:	00000513          	li	a0,0
    800085e4:	01010113          	addi	sp,sp,16
    800085e8:	00008067          	ret
    800085ec:	00003517          	auipc	a0,0x3
    800085f0:	3b450513          	addi	a0,a0,948 # 8000b9a0 <CONSOLE_STATUS+0x990>
    800085f4:	00001097          	auipc	ra,0x1
    800085f8:	8e8080e7          	jalr	-1816(ra) # 80008edc <panic>

00000000800085fc <trapinit>:
    800085fc:	ff010113          	addi	sp,sp,-16
    80008600:	00813423          	sd	s0,8(sp)
    80008604:	01010413          	addi	s0,sp,16
    80008608:	00813403          	ld	s0,8(sp)
    8000860c:	00003597          	auipc	a1,0x3
    80008610:	3bc58593          	addi	a1,a1,956 # 8000b9c8 <CONSOLE_STATUS+0x9b8>
    80008614:	00007517          	auipc	a0,0x7
    80008618:	a9c50513          	addi	a0,a0,-1380 # 8000f0b0 <tickslock>
    8000861c:	01010113          	addi	sp,sp,16
    80008620:	00001317          	auipc	t1,0x1
    80008624:	5c830067          	jr	1480(t1) # 80009be8 <initlock>

0000000080008628 <trapinithart>:
    80008628:	ff010113          	addi	sp,sp,-16
    8000862c:	00813423          	sd	s0,8(sp)
    80008630:	01010413          	addi	s0,sp,16
    80008634:	00000797          	auipc	a5,0x0
    80008638:	2fc78793          	addi	a5,a5,764 # 80008930 <kernelvec>
    8000863c:	10579073          	csrw	stvec,a5
    80008640:	00813403          	ld	s0,8(sp)
    80008644:	01010113          	addi	sp,sp,16
    80008648:	00008067          	ret

000000008000864c <usertrap>:
    8000864c:	ff010113          	addi	sp,sp,-16
    80008650:	00813423          	sd	s0,8(sp)
    80008654:	01010413          	addi	s0,sp,16
    80008658:	00813403          	ld	s0,8(sp)
    8000865c:	01010113          	addi	sp,sp,16
    80008660:	00008067          	ret

0000000080008664 <usertrapret>:
    80008664:	ff010113          	addi	sp,sp,-16
    80008668:	00813423          	sd	s0,8(sp)
    8000866c:	01010413          	addi	s0,sp,16
    80008670:	00813403          	ld	s0,8(sp)
    80008674:	01010113          	addi	sp,sp,16
    80008678:	00008067          	ret

000000008000867c <kerneltrap>:
    8000867c:	fe010113          	addi	sp,sp,-32
    80008680:	00813823          	sd	s0,16(sp)
    80008684:	00113c23          	sd	ra,24(sp)
    80008688:	00913423          	sd	s1,8(sp)
    8000868c:	02010413          	addi	s0,sp,32
    80008690:	142025f3          	csrr	a1,scause
    80008694:	100027f3          	csrr	a5,sstatus
    80008698:	0027f793          	andi	a5,a5,2
    8000869c:	10079c63          	bnez	a5,800087b4 <kerneltrap+0x138>
    800086a0:	142027f3          	csrr	a5,scause
    800086a4:	0207ce63          	bltz	a5,800086e0 <kerneltrap+0x64>
    800086a8:	00003517          	auipc	a0,0x3
    800086ac:	36850513          	addi	a0,a0,872 # 8000ba10 <CONSOLE_STATUS+0xa00>
    800086b0:	00001097          	auipc	ra,0x1
    800086b4:	888080e7          	jalr	-1912(ra) # 80008f38 <__printf>
    800086b8:	141025f3          	csrr	a1,sepc
    800086bc:	14302673          	csrr	a2,stval
    800086c0:	00003517          	auipc	a0,0x3
    800086c4:	36050513          	addi	a0,a0,864 # 8000ba20 <CONSOLE_STATUS+0xa10>
    800086c8:	00001097          	auipc	ra,0x1
    800086cc:	870080e7          	jalr	-1936(ra) # 80008f38 <__printf>
    800086d0:	00003517          	auipc	a0,0x3
    800086d4:	36850513          	addi	a0,a0,872 # 8000ba38 <CONSOLE_STATUS+0xa28>
    800086d8:	00001097          	auipc	ra,0x1
    800086dc:	804080e7          	jalr	-2044(ra) # 80008edc <panic>
    800086e0:	0ff7f713          	andi	a4,a5,255
    800086e4:	00900693          	li	a3,9
    800086e8:	04d70063          	beq	a4,a3,80008728 <kerneltrap+0xac>
    800086ec:	fff00713          	li	a4,-1
    800086f0:	03f71713          	slli	a4,a4,0x3f
    800086f4:	00170713          	addi	a4,a4,1
    800086f8:	fae798e3          	bne	a5,a4,800086a8 <kerneltrap+0x2c>
    800086fc:	00000097          	auipc	ra,0x0
    80008700:	e00080e7          	jalr	-512(ra) # 800084fc <cpuid>
    80008704:	06050663          	beqz	a0,80008770 <kerneltrap+0xf4>
    80008708:	144027f3          	csrr	a5,sip
    8000870c:	ffd7f793          	andi	a5,a5,-3
    80008710:	14479073          	csrw	sip,a5
    80008714:	01813083          	ld	ra,24(sp)
    80008718:	01013403          	ld	s0,16(sp)
    8000871c:	00813483          	ld	s1,8(sp)
    80008720:	02010113          	addi	sp,sp,32
    80008724:	00008067          	ret
    80008728:	00000097          	auipc	ra,0x0
    8000872c:	3cc080e7          	jalr	972(ra) # 80008af4 <plic_claim>
    80008730:	00a00793          	li	a5,10
    80008734:	00050493          	mv	s1,a0
    80008738:	06f50863          	beq	a0,a5,800087a8 <kerneltrap+0x12c>
    8000873c:	fc050ce3          	beqz	a0,80008714 <kerneltrap+0x98>
    80008740:	00050593          	mv	a1,a0
    80008744:	00003517          	auipc	a0,0x3
    80008748:	2ac50513          	addi	a0,a0,684 # 8000b9f0 <CONSOLE_STATUS+0x9e0>
    8000874c:	00000097          	auipc	ra,0x0
    80008750:	7ec080e7          	jalr	2028(ra) # 80008f38 <__printf>
    80008754:	01013403          	ld	s0,16(sp)
    80008758:	01813083          	ld	ra,24(sp)
    8000875c:	00048513          	mv	a0,s1
    80008760:	00813483          	ld	s1,8(sp)
    80008764:	02010113          	addi	sp,sp,32
    80008768:	00000317          	auipc	t1,0x0
    8000876c:	3c430067          	jr	964(t1) # 80008b2c <plic_complete>
    80008770:	00007517          	auipc	a0,0x7
    80008774:	94050513          	addi	a0,a0,-1728 # 8000f0b0 <tickslock>
    80008778:	00001097          	auipc	ra,0x1
    8000877c:	494080e7          	jalr	1172(ra) # 80009c0c <acquire>
    80008780:	00005717          	auipc	a4,0x5
    80008784:	7c470713          	addi	a4,a4,1988 # 8000df44 <ticks>
    80008788:	00072783          	lw	a5,0(a4)
    8000878c:	00007517          	auipc	a0,0x7
    80008790:	92450513          	addi	a0,a0,-1756 # 8000f0b0 <tickslock>
    80008794:	0017879b          	addiw	a5,a5,1
    80008798:	00f72023          	sw	a5,0(a4)
    8000879c:	00001097          	auipc	ra,0x1
    800087a0:	53c080e7          	jalr	1340(ra) # 80009cd8 <release>
    800087a4:	f65ff06f          	j	80008708 <kerneltrap+0x8c>
    800087a8:	00001097          	auipc	ra,0x1
    800087ac:	098080e7          	jalr	152(ra) # 80009840 <uartintr>
    800087b0:	fa5ff06f          	j	80008754 <kerneltrap+0xd8>
    800087b4:	00003517          	auipc	a0,0x3
    800087b8:	21c50513          	addi	a0,a0,540 # 8000b9d0 <CONSOLE_STATUS+0x9c0>
    800087bc:	00000097          	auipc	ra,0x0
    800087c0:	720080e7          	jalr	1824(ra) # 80008edc <panic>

00000000800087c4 <clockintr>:
    800087c4:	fe010113          	addi	sp,sp,-32
    800087c8:	00813823          	sd	s0,16(sp)
    800087cc:	00913423          	sd	s1,8(sp)
    800087d0:	00113c23          	sd	ra,24(sp)
    800087d4:	02010413          	addi	s0,sp,32
    800087d8:	00007497          	auipc	s1,0x7
    800087dc:	8d848493          	addi	s1,s1,-1832 # 8000f0b0 <tickslock>
    800087e0:	00048513          	mv	a0,s1
    800087e4:	00001097          	auipc	ra,0x1
    800087e8:	428080e7          	jalr	1064(ra) # 80009c0c <acquire>
    800087ec:	00005717          	auipc	a4,0x5
    800087f0:	75870713          	addi	a4,a4,1880 # 8000df44 <ticks>
    800087f4:	00072783          	lw	a5,0(a4)
    800087f8:	01013403          	ld	s0,16(sp)
    800087fc:	01813083          	ld	ra,24(sp)
    80008800:	00048513          	mv	a0,s1
    80008804:	0017879b          	addiw	a5,a5,1
    80008808:	00813483          	ld	s1,8(sp)
    8000880c:	00f72023          	sw	a5,0(a4)
    80008810:	02010113          	addi	sp,sp,32
    80008814:	00001317          	auipc	t1,0x1
    80008818:	4c430067          	jr	1220(t1) # 80009cd8 <release>

000000008000881c <devintr>:
    8000881c:	142027f3          	csrr	a5,scause
    80008820:	00000513          	li	a0,0
    80008824:	0007c463          	bltz	a5,8000882c <devintr+0x10>
    80008828:	00008067          	ret
    8000882c:	fe010113          	addi	sp,sp,-32
    80008830:	00813823          	sd	s0,16(sp)
    80008834:	00113c23          	sd	ra,24(sp)
    80008838:	00913423          	sd	s1,8(sp)
    8000883c:	02010413          	addi	s0,sp,32
    80008840:	0ff7f713          	andi	a4,a5,255
    80008844:	00900693          	li	a3,9
    80008848:	04d70c63          	beq	a4,a3,800088a0 <devintr+0x84>
    8000884c:	fff00713          	li	a4,-1
    80008850:	03f71713          	slli	a4,a4,0x3f
    80008854:	00170713          	addi	a4,a4,1
    80008858:	00e78c63          	beq	a5,a4,80008870 <devintr+0x54>
    8000885c:	01813083          	ld	ra,24(sp)
    80008860:	01013403          	ld	s0,16(sp)
    80008864:	00813483          	ld	s1,8(sp)
    80008868:	02010113          	addi	sp,sp,32
    8000886c:	00008067          	ret
    80008870:	00000097          	auipc	ra,0x0
    80008874:	c8c080e7          	jalr	-884(ra) # 800084fc <cpuid>
    80008878:	06050663          	beqz	a0,800088e4 <devintr+0xc8>
    8000887c:	144027f3          	csrr	a5,sip
    80008880:	ffd7f793          	andi	a5,a5,-3
    80008884:	14479073          	csrw	sip,a5
    80008888:	01813083          	ld	ra,24(sp)
    8000888c:	01013403          	ld	s0,16(sp)
    80008890:	00813483          	ld	s1,8(sp)
    80008894:	00200513          	li	a0,2
    80008898:	02010113          	addi	sp,sp,32
    8000889c:	00008067          	ret
    800088a0:	00000097          	auipc	ra,0x0
    800088a4:	254080e7          	jalr	596(ra) # 80008af4 <plic_claim>
    800088a8:	00a00793          	li	a5,10
    800088ac:	00050493          	mv	s1,a0
    800088b0:	06f50663          	beq	a0,a5,8000891c <devintr+0x100>
    800088b4:	00100513          	li	a0,1
    800088b8:	fa0482e3          	beqz	s1,8000885c <devintr+0x40>
    800088bc:	00048593          	mv	a1,s1
    800088c0:	00003517          	auipc	a0,0x3
    800088c4:	13050513          	addi	a0,a0,304 # 8000b9f0 <CONSOLE_STATUS+0x9e0>
    800088c8:	00000097          	auipc	ra,0x0
    800088cc:	670080e7          	jalr	1648(ra) # 80008f38 <__printf>
    800088d0:	00048513          	mv	a0,s1
    800088d4:	00000097          	auipc	ra,0x0
    800088d8:	258080e7          	jalr	600(ra) # 80008b2c <plic_complete>
    800088dc:	00100513          	li	a0,1
    800088e0:	f7dff06f          	j	8000885c <devintr+0x40>
    800088e4:	00006517          	auipc	a0,0x6
    800088e8:	7cc50513          	addi	a0,a0,1996 # 8000f0b0 <tickslock>
    800088ec:	00001097          	auipc	ra,0x1
    800088f0:	320080e7          	jalr	800(ra) # 80009c0c <acquire>
    800088f4:	00005717          	auipc	a4,0x5
    800088f8:	65070713          	addi	a4,a4,1616 # 8000df44 <ticks>
    800088fc:	00072783          	lw	a5,0(a4)
    80008900:	00006517          	auipc	a0,0x6
    80008904:	7b050513          	addi	a0,a0,1968 # 8000f0b0 <tickslock>
    80008908:	0017879b          	addiw	a5,a5,1
    8000890c:	00f72023          	sw	a5,0(a4)
    80008910:	00001097          	auipc	ra,0x1
    80008914:	3c8080e7          	jalr	968(ra) # 80009cd8 <release>
    80008918:	f65ff06f          	j	8000887c <devintr+0x60>
    8000891c:	00001097          	auipc	ra,0x1
    80008920:	f24080e7          	jalr	-220(ra) # 80009840 <uartintr>
    80008924:	fadff06f          	j	800088d0 <devintr+0xb4>
	...

0000000080008930 <kernelvec>:
    80008930:	f0010113          	addi	sp,sp,-256
    80008934:	00113023          	sd	ra,0(sp)
    80008938:	00213423          	sd	sp,8(sp)
    8000893c:	00313823          	sd	gp,16(sp)
    80008940:	00413c23          	sd	tp,24(sp)
    80008944:	02513023          	sd	t0,32(sp)
    80008948:	02613423          	sd	t1,40(sp)
    8000894c:	02713823          	sd	t2,48(sp)
    80008950:	02813c23          	sd	s0,56(sp)
    80008954:	04913023          	sd	s1,64(sp)
    80008958:	04a13423          	sd	a0,72(sp)
    8000895c:	04b13823          	sd	a1,80(sp)
    80008960:	04c13c23          	sd	a2,88(sp)
    80008964:	06d13023          	sd	a3,96(sp)
    80008968:	06e13423          	sd	a4,104(sp)
    8000896c:	06f13823          	sd	a5,112(sp)
    80008970:	07013c23          	sd	a6,120(sp)
    80008974:	09113023          	sd	a7,128(sp)
    80008978:	09213423          	sd	s2,136(sp)
    8000897c:	09313823          	sd	s3,144(sp)
    80008980:	09413c23          	sd	s4,152(sp)
    80008984:	0b513023          	sd	s5,160(sp)
    80008988:	0b613423          	sd	s6,168(sp)
    8000898c:	0b713823          	sd	s7,176(sp)
    80008990:	0b813c23          	sd	s8,184(sp)
    80008994:	0d913023          	sd	s9,192(sp)
    80008998:	0da13423          	sd	s10,200(sp)
    8000899c:	0db13823          	sd	s11,208(sp)
    800089a0:	0dc13c23          	sd	t3,216(sp)
    800089a4:	0fd13023          	sd	t4,224(sp)
    800089a8:	0fe13423          	sd	t5,232(sp)
    800089ac:	0ff13823          	sd	t6,240(sp)
    800089b0:	ccdff0ef          	jal	ra,8000867c <kerneltrap>
    800089b4:	00013083          	ld	ra,0(sp)
    800089b8:	00813103          	ld	sp,8(sp)
    800089bc:	01013183          	ld	gp,16(sp)
    800089c0:	02013283          	ld	t0,32(sp)
    800089c4:	02813303          	ld	t1,40(sp)
    800089c8:	03013383          	ld	t2,48(sp)
    800089cc:	03813403          	ld	s0,56(sp)
    800089d0:	04013483          	ld	s1,64(sp)
    800089d4:	04813503          	ld	a0,72(sp)
    800089d8:	05013583          	ld	a1,80(sp)
    800089dc:	05813603          	ld	a2,88(sp)
    800089e0:	06013683          	ld	a3,96(sp)
    800089e4:	06813703          	ld	a4,104(sp)
    800089e8:	07013783          	ld	a5,112(sp)
    800089ec:	07813803          	ld	a6,120(sp)
    800089f0:	08013883          	ld	a7,128(sp)
    800089f4:	08813903          	ld	s2,136(sp)
    800089f8:	09013983          	ld	s3,144(sp)
    800089fc:	09813a03          	ld	s4,152(sp)
    80008a00:	0a013a83          	ld	s5,160(sp)
    80008a04:	0a813b03          	ld	s6,168(sp)
    80008a08:	0b013b83          	ld	s7,176(sp)
    80008a0c:	0b813c03          	ld	s8,184(sp)
    80008a10:	0c013c83          	ld	s9,192(sp)
    80008a14:	0c813d03          	ld	s10,200(sp)
    80008a18:	0d013d83          	ld	s11,208(sp)
    80008a1c:	0d813e03          	ld	t3,216(sp)
    80008a20:	0e013e83          	ld	t4,224(sp)
    80008a24:	0e813f03          	ld	t5,232(sp)
    80008a28:	0f013f83          	ld	t6,240(sp)
    80008a2c:	10010113          	addi	sp,sp,256
    80008a30:	10200073          	sret
    80008a34:	00000013          	nop
    80008a38:	00000013          	nop
    80008a3c:	00000013          	nop

0000000080008a40 <timervec>:
    80008a40:	34051573          	csrrw	a0,mscratch,a0
    80008a44:	00b53023          	sd	a1,0(a0)
    80008a48:	00c53423          	sd	a2,8(a0)
    80008a4c:	00d53823          	sd	a3,16(a0)
    80008a50:	01853583          	ld	a1,24(a0)
    80008a54:	02053603          	ld	a2,32(a0)
    80008a58:	0005b683          	ld	a3,0(a1)
    80008a5c:	00c686b3          	add	a3,a3,a2
    80008a60:	00d5b023          	sd	a3,0(a1)
    80008a64:	00200593          	li	a1,2
    80008a68:	14459073          	csrw	sip,a1
    80008a6c:	01053683          	ld	a3,16(a0)
    80008a70:	00853603          	ld	a2,8(a0)
    80008a74:	00053583          	ld	a1,0(a0)
    80008a78:	34051573          	csrrw	a0,mscratch,a0
    80008a7c:	30200073          	mret

0000000080008a80 <plicinit>:
    80008a80:	ff010113          	addi	sp,sp,-16
    80008a84:	00813423          	sd	s0,8(sp)
    80008a88:	01010413          	addi	s0,sp,16
    80008a8c:	00813403          	ld	s0,8(sp)
    80008a90:	0c0007b7          	lui	a5,0xc000
    80008a94:	00100713          	li	a4,1
    80008a98:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80008a9c:	00e7a223          	sw	a4,4(a5)
    80008aa0:	01010113          	addi	sp,sp,16
    80008aa4:	00008067          	ret

0000000080008aa8 <plicinithart>:
    80008aa8:	ff010113          	addi	sp,sp,-16
    80008aac:	00813023          	sd	s0,0(sp)
    80008ab0:	00113423          	sd	ra,8(sp)
    80008ab4:	01010413          	addi	s0,sp,16
    80008ab8:	00000097          	auipc	ra,0x0
    80008abc:	a44080e7          	jalr	-1468(ra) # 800084fc <cpuid>
    80008ac0:	0085171b          	slliw	a4,a0,0x8
    80008ac4:	0c0027b7          	lui	a5,0xc002
    80008ac8:	00e787b3          	add	a5,a5,a4
    80008acc:	40200713          	li	a4,1026
    80008ad0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80008ad4:	00813083          	ld	ra,8(sp)
    80008ad8:	00013403          	ld	s0,0(sp)
    80008adc:	00d5151b          	slliw	a0,a0,0xd
    80008ae0:	0c2017b7          	lui	a5,0xc201
    80008ae4:	00a78533          	add	a0,a5,a0
    80008ae8:	00052023          	sw	zero,0(a0)
    80008aec:	01010113          	addi	sp,sp,16
    80008af0:	00008067          	ret

0000000080008af4 <plic_claim>:
    80008af4:	ff010113          	addi	sp,sp,-16
    80008af8:	00813023          	sd	s0,0(sp)
    80008afc:	00113423          	sd	ra,8(sp)
    80008b00:	01010413          	addi	s0,sp,16
    80008b04:	00000097          	auipc	ra,0x0
    80008b08:	9f8080e7          	jalr	-1544(ra) # 800084fc <cpuid>
    80008b0c:	00813083          	ld	ra,8(sp)
    80008b10:	00013403          	ld	s0,0(sp)
    80008b14:	00d5151b          	slliw	a0,a0,0xd
    80008b18:	0c2017b7          	lui	a5,0xc201
    80008b1c:	00a78533          	add	a0,a5,a0
    80008b20:	00452503          	lw	a0,4(a0)
    80008b24:	01010113          	addi	sp,sp,16
    80008b28:	00008067          	ret

0000000080008b2c <plic_complete>:
    80008b2c:	fe010113          	addi	sp,sp,-32
    80008b30:	00813823          	sd	s0,16(sp)
    80008b34:	00913423          	sd	s1,8(sp)
    80008b38:	00113c23          	sd	ra,24(sp)
    80008b3c:	02010413          	addi	s0,sp,32
    80008b40:	00050493          	mv	s1,a0
    80008b44:	00000097          	auipc	ra,0x0
    80008b48:	9b8080e7          	jalr	-1608(ra) # 800084fc <cpuid>
    80008b4c:	01813083          	ld	ra,24(sp)
    80008b50:	01013403          	ld	s0,16(sp)
    80008b54:	00d5179b          	slliw	a5,a0,0xd
    80008b58:	0c201737          	lui	a4,0xc201
    80008b5c:	00f707b3          	add	a5,a4,a5
    80008b60:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80008b64:	00813483          	ld	s1,8(sp)
    80008b68:	02010113          	addi	sp,sp,32
    80008b6c:	00008067          	ret

0000000080008b70 <consolewrite>:
    80008b70:	fb010113          	addi	sp,sp,-80
    80008b74:	04813023          	sd	s0,64(sp)
    80008b78:	04113423          	sd	ra,72(sp)
    80008b7c:	02913c23          	sd	s1,56(sp)
    80008b80:	03213823          	sd	s2,48(sp)
    80008b84:	03313423          	sd	s3,40(sp)
    80008b88:	03413023          	sd	s4,32(sp)
    80008b8c:	01513c23          	sd	s5,24(sp)
    80008b90:	05010413          	addi	s0,sp,80
    80008b94:	06c05c63          	blez	a2,80008c0c <consolewrite+0x9c>
    80008b98:	00060993          	mv	s3,a2
    80008b9c:	00050a13          	mv	s4,a0
    80008ba0:	00058493          	mv	s1,a1
    80008ba4:	00000913          	li	s2,0
    80008ba8:	fff00a93          	li	s5,-1
    80008bac:	01c0006f          	j	80008bc8 <consolewrite+0x58>
    80008bb0:	fbf44503          	lbu	a0,-65(s0)
    80008bb4:	0019091b          	addiw	s2,s2,1
    80008bb8:	00148493          	addi	s1,s1,1
    80008bbc:	00001097          	auipc	ra,0x1
    80008bc0:	a9c080e7          	jalr	-1380(ra) # 80009658 <uartputc>
    80008bc4:	03298063          	beq	s3,s2,80008be4 <consolewrite+0x74>
    80008bc8:	00048613          	mv	a2,s1
    80008bcc:	00100693          	li	a3,1
    80008bd0:	000a0593          	mv	a1,s4
    80008bd4:	fbf40513          	addi	a0,s0,-65
    80008bd8:	00000097          	auipc	ra,0x0
    80008bdc:	9dc080e7          	jalr	-1572(ra) # 800085b4 <either_copyin>
    80008be0:	fd5518e3          	bne	a0,s5,80008bb0 <consolewrite+0x40>
    80008be4:	04813083          	ld	ra,72(sp)
    80008be8:	04013403          	ld	s0,64(sp)
    80008bec:	03813483          	ld	s1,56(sp)
    80008bf0:	02813983          	ld	s3,40(sp)
    80008bf4:	02013a03          	ld	s4,32(sp)
    80008bf8:	01813a83          	ld	s5,24(sp)
    80008bfc:	00090513          	mv	a0,s2
    80008c00:	03013903          	ld	s2,48(sp)
    80008c04:	05010113          	addi	sp,sp,80
    80008c08:	00008067          	ret
    80008c0c:	00000913          	li	s2,0
    80008c10:	fd5ff06f          	j	80008be4 <consolewrite+0x74>

0000000080008c14 <consoleread>:
    80008c14:	f9010113          	addi	sp,sp,-112
    80008c18:	06813023          	sd	s0,96(sp)
    80008c1c:	04913c23          	sd	s1,88(sp)
    80008c20:	05213823          	sd	s2,80(sp)
    80008c24:	05313423          	sd	s3,72(sp)
    80008c28:	05413023          	sd	s4,64(sp)
    80008c2c:	03513c23          	sd	s5,56(sp)
    80008c30:	03613823          	sd	s6,48(sp)
    80008c34:	03713423          	sd	s7,40(sp)
    80008c38:	03813023          	sd	s8,32(sp)
    80008c3c:	06113423          	sd	ra,104(sp)
    80008c40:	01913c23          	sd	s9,24(sp)
    80008c44:	07010413          	addi	s0,sp,112
    80008c48:	00060b93          	mv	s7,a2
    80008c4c:	00050913          	mv	s2,a0
    80008c50:	00058c13          	mv	s8,a1
    80008c54:	00060b1b          	sext.w	s6,a2
    80008c58:	00006497          	auipc	s1,0x6
    80008c5c:	48048493          	addi	s1,s1,1152 # 8000f0d8 <cons>
    80008c60:	00400993          	li	s3,4
    80008c64:	fff00a13          	li	s4,-1
    80008c68:	00a00a93          	li	s5,10
    80008c6c:	05705e63          	blez	s7,80008cc8 <consoleread+0xb4>
    80008c70:	09c4a703          	lw	a4,156(s1)
    80008c74:	0984a783          	lw	a5,152(s1)
    80008c78:	0007071b          	sext.w	a4,a4
    80008c7c:	08e78463          	beq	a5,a4,80008d04 <consoleread+0xf0>
    80008c80:	07f7f713          	andi	a4,a5,127
    80008c84:	00e48733          	add	a4,s1,a4
    80008c88:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80008c8c:	0017869b          	addiw	a3,a5,1
    80008c90:	08d4ac23          	sw	a3,152(s1)
    80008c94:	00070c9b          	sext.w	s9,a4
    80008c98:	0b370663          	beq	a4,s3,80008d44 <consoleread+0x130>
    80008c9c:	00100693          	li	a3,1
    80008ca0:	f9f40613          	addi	a2,s0,-97
    80008ca4:	000c0593          	mv	a1,s8
    80008ca8:	00090513          	mv	a0,s2
    80008cac:	f8e40fa3          	sb	a4,-97(s0)
    80008cb0:	00000097          	auipc	ra,0x0
    80008cb4:	8b8080e7          	jalr	-1864(ra) # 80008568 <either_copyout>
    80008cb8:	01450863          	beq	a0,s4,80008cc8 <consoleread+0xb4>
    80008cbc:	001c0c13          	addi	s8,s8,1
    80008cc0:	fffb8b9b          	addiw	s7,s7,-1
    80008cc4:	fb5c94e3          	bne	s9,s5,80008c6c <consoleread+0x58>
    80008cc8:	000b851b          	sext.w	a0,s7
    80008ccc:	06813083          	ld	ra,104(sp)
    80008cd0:	06013403          	ld	s0,96(sp)
    80008cd4:	05813483          	ld	s1,88(sp)
    80008cd8:	05013903          	ld	s2,80(sp)
    80008cdc:	04813983          	ld	s3,72(sp)
    80008ce0:	04013a03          	ld	s4,64(sp)
    80008ce4:	03813a83          	ld	s5,56(sp)
    80008ce8:	02813b83          	ld	s7,40(sp)
    80008cec:	02013c03          	ld	s8,32(sp)
    80008cf0:	01813c83          	ld	s9,24(sp)
    80008cf4:	40ab053b          	subw	a0,s6,a0
    80008cf8:	03013b03          	ld	s6,48(sp)
    80008cfc:	07010113          	addi	sp,sp,112
    80008d00:	00008067          	ret
    80008d04:	00001097          	auipc	ra,0x1
    80008d08:	1d8080e7          	jalr	472(ra) # 80009edc <push_on>
    80008d0c:	0984a703          	lw	a4,152(s1)
    80008d10:	09c4a783          	lw	a5,156(s1)
    80008d14:	0007879b          	sext.w	a5,a5
    80008d18:	fef70ce3          	beq	a4,a5,80008d10 <consoleread+0xfc>
    80008d1c:	00001097          	auipc	ra,0x1
    80008d20:	234080e7          	jalr	564(ra) # 80009f50 <pop_on>
    80008d24:	0984a783          	lw	a5,152(s1)
    80008d28:	07f7f713          	andi	a4,a5,127
    80008d2c:	00e48733          	add	a4,s1,a4
    80008d30:	01874703          	lbu	a4,24(a4)
    80008d34:	0017869b          	addiw	a3,a5,1
    80008d38:	08d4ac23          	sw	a3,152(s1)
    80008d3c:	00070c9b          	sext.w	s9,a4
    80008d40:	f5371ee3          	bne	a4,s3,80008c9c <consoleread+0x88>
    80008d44:	000b851b          	sext.w	a0,s7
    80008d48:	f96bf2e3          	bgeu	s7,s6,80008ccc <consoleread+0xb8>
    80008d4c:	08f4ac23          	sw	a5,152(s1)
    80008d50:	f7dff06f          	j	80008ccc <consoleread+0xb8>

0000000080008d54 <consputc>:
    80008d54:	10000793          	li	a5,256
    80008d58:	00f50663          	beq	a0,a5,80008d64 <consputc+0x10>
    80008d5c:	00001317          	auipc	t1,0x1
    80008d60:	9f430067          	jr	-1548(t1) # 80009750 <uartputc_sync>
    80008d64:	ff010113          	addi	sp,sp,-16
    80008d68:	00113423          	sd	ra,8(sp)
    80008d6c:	00813023          	sd	s0,0(sp)
    80008d70:	01010413          	addi	s0,sp,16
    80008d74:	00800513          	li	a0,8
    80008d78:	00001097          	auipc	ra,0x1
    80008d7c:	9d8080e7          	jalr	-1576(ra) # 80009750 <uartputc_sync>
    80008d80:	02000513          	li	a0,32
    80008d84:	00001097          	auipc	ra,0x1
    80008d88:	9cc080e7          	jalr	-1588(ra) # 80009750 <uartputc_sync>
    80008d8c:	00013403          	ld	s0,0(sp)
    80008d90:	00813083          	ld	ra,8(sp)
    80008d94:	00800513          	li	a0,8
    80008d98:	01010113          	addi	sp,sp,16
    80008d9c:	00001317          	auipc	t1,0x1
    80008da0:	9b430067          	jr	-1612(t1) # 80009750 <uartputc_sync>

0000000080008da4 <consoleintr>:
    80008da4:	fe010113          	addi	sp,sp,-32
    80008da8:	00813823          	sd	s0,16(sp)
    80008dac:	00913423          	sd	s1,8(sp)
    80008db0:	01213023          	sd	s2,0(sp)
    80008db4:	00113c23          	sd	ra,24(sp)
    80008db8:	02010413          	addi	s0,sp,32
    80008dbc:	00006917          	auipc	s2,0x6
    80008dc0:	31c90913          	addi	s2,s2,796 # 8000f0d8 <cons>
    80008dc4:	00050493          	mv	s1,a0
    80008dc8:	00090513          	mv	a0,s2
    80008dcc:	00001097          	auipc	ra,0x1
    80008dd0:	e40080e7          	jalr	-448(ra) # 80009c0c <acquire>
    80008dd4:	02048c63          	beqz	s1,80008e0c <consoleintr+0x68>
    80008dd8:	0a092783          	lw	a5,160(s2)
    80008ddc:	09892703          	lw	a4,152(s2)
    80008de0:	07f00693          	li	a3,127
    80008de4:	40e7873b          	subw	a4,a5,a4
    80008de8:	02e6e263          	bltu	a3,a4,80008e0c <consoleintr+0x68>
    80008dec:	00d00713          	li	a4,13
    80008df0:	04e48063          	beq	s1,a4,80008e30 <consoleintr+0x8c>
    80008df4:	07f7f713          	andi	a4,a5,127
    80008df8:	00e90733          	add	a4,s2,a4
    80008dfc:	0017879b          	addiw	a5,a5,1
    80008e00:	0af92023          	sw	a5,160(s2)
    80008e04:	00970c23          	sb	s1,24(a4)
    80008e08:	08f92e23          	sw	a5,156(s2)
    80008e0c:	01013403          	ld	s0,16(sp)
    80008e10:	01813083          	ld	ra,24(sp)
    80008e14:	00813483          	ld	s1,8(sp)
    80008e18:	00013903          	ld	s2,0(sp)
    80008e1c:	00006517          	auipc	a0,0x6
    80008e20:	2bc50513          	addi	a0,a0,700 # 8000f0d8 <cons>
    80008e24:	02010113          	addi	sp,sp,32
    80008e28:	00001317          	auipc	t1,0x1
    80008e2c:	eb030067          	jr	-336(t1) # 80009cd8 <release>
    80008e30:	00a00493          	li	s1,10
    80008e34:	fc1ff06f          	j	80008df4 <consoleintr+0x50>

0000000080008e38 <consoleinit>:
    80008e38:	fe010113          	addi	sp,sp,-32
    80008e3c:	00113c23          	sd	ra,24(sp)
    80008e40:	00813823          	sd	s0,16(sp)
    80008e44:	00913423          	sd	s1,8(sp)
    80008e48:	02010413          	addi	s0,sp,32
    80008e4c:	00006497          	auipc	s1,0x6
    80008e50:	28c48493          	addi	s1,s1,652 # 8000f0d8 <cons>
    80008e54:	00048513          	mv	a0,s1
    80008e58:	00003597          	auipc	a1,0x3
    80008e5c:	bf058593          	addi	a1,a1,-1040 # 8000ba48 <CONSOLE_STATUS+0xa38>
    80008e60:	00001097          	auipc	ra,0x1
    80008e64:	d88080e7          	jalr	-632(ra) # 80009be8 <initlock>
    80008e68:	00000097          	auipc	ra,0x0
    80008e6c:	7ac080e7          	jalr	1964(ra) # 80009614 <uartinit>
    80008e70:	01813083          	ld	ra,24(sp)
    80008e74:	01013403          	ld	s0,16(sp)
    80008e78:	00000797          	auipc	a5,0x0
    80008e7c:	d9c78793          	addi	a5,a5,-612 # 80008c14 <consoleread>
    80008e80:	0af4bc23          	sd	a5,184(s1)
    80008e84:	00000797          	auipc	a5,0x0
    80008e88:	cec78793          	addi	a5,a5,-788 # 80008b70 <consolewrite>
    80008e8c:	0cf4b023          	sd	a5,192(s1)
    80008e90:	00813483          	ld	s1,8(sp)
    80008e94:	02010113          	addi	sp,sp,32
    80008e98:	00008067          	ret

0000000080008e9c <console_read>:
    80008e9c:	ff010113          	addi	sp,sp,-16
    80008ea0:	00813423          	sd	s0,8(sp)
    80008ea4:	01010413          	addi	s0,sp,16
    80008ea8:	00813403          	ld	s0,8(sp)
    80008eac:	00006317          	auipc	t1,0x6
    80008eb0:	2e433303          	ld	t1,740(t1) # 8000f190 <devsw+0x10>
    80008eb4:	01010113          	addi	sp,sp,16
    80008eb8:	00030067          	jr	t1

0000000080008ebc <console_write>:
    80008ebc:	ff010113          	addi	sp,sp,-16
    80008ec0:	00813423          	sd	s0,8(sp)
    80008ec4:	01010413          	addi	s0,sp,16
    80008ec8:	00813403          	ld	s0,8(sp)
    80008ecc:	00006317          	auipc	t1,0x6
    80008ed0:	2cc33303          	ld	t1,716(t1) # 8000f198 <devsw+0x18>
    80008ed4:	01010113          	addi	sp,sp,16
    80008ed8:	00030067          	jr	t1

0000000080008edc <panic>:
    80008edc:	fe010113          	addi	sp,sp,-32
    80008ee0:	00113c23          	sd	ra,24(sp)
    80008ee4:	00813823          	sd	s0,16(sp)
    80008ee8:	00913423          	sd	s1,8(sp)
    80008eec:	02010413          	addi	s0,sp,32
    80008ef0:	00050493          	mv	s1,a0
    80008ef4:	00003517          	auipc	a0,0x3
    80008ef8:	b5c50513          	addi	a0,a0,-1188 # 8000ba50 <CONSOLE_STATUS+0xa40>
    80008efc:	00006797          	auipc	a5,0x6
    80008f00:	3207ae23          	sw	zero,828(a5) # 8000f238 <pr+0x18>
    80008f04:	00000097          	auipc	ra,0x0
    80008f08:	034080e7          	jalr	52(ra) # 80008f38 <__printf>
    80008f0c:	00048513          	mv	a0,s1
    80008f10:	00000097          	auipc	ra,0x0
    80008f14:	028080e7          	jalr	40(ra) # 80008f38 <__printf>
    80008f18:	00003517          	auipc	a0,0x3
    80008f1c:	8b850513          	addi	a0,a0,-1864 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80008f20:	00000097          	auipc	ra,0x0
    80008f24:	018080e7          	jalr	24(ra) # 80008f38 <__printf>
    80008f28:	00100793          	li	a5,1
    80008f2c:	00005717          	auipc	a4,0x5
    80008f30:	00f72e23          	sw	a5,28(a4) # 8000df48 <panicked>
    80008f34:	0000006f          	j	80008f34 <panic+0x58>

0000000080008f38 <__printf>:
    80008f38:	f3010113          	addi	sp,sp,-208
    80008f3c:	08813023          	sd	s0,128(sp)
    80008f40:	07313423          	sd	s3,104(sp)
    80008f44:	09010413          	addi	s0,sp,144
    80008f48:	05813023          	sd	s8,64(sp)
    80008f4c:	08113423          	sd	ra,136(sp)
    80008f50:	06913c23          	sd	s1,120(sp)
    80008f54:	07213823          	sd	s2,112(sp)
    80008f58:	07413023          	sd	s4,96(sp)
    80008f5c:	05513c23          	sd	s5,88(sp)
    80008f60:	05613823          	sd	s6,80(sp)
    80008f64:	05713423          	sd	s7,72(sp)
    80008f68:	03913c23          	sd	s9,56(sp)
    80008f6c:	03a13823          	sd	s10,48(sp)
    80008f70:	03b13423          	sd	s11,40(sp)
    80008f74:	00006317          	auipc	t1,0x6
    80008f78:	2ac30313          	addi	t1,t1,684 # 8000f220 <pr>
    80008f7c:	01832c03          	lw	s8,24(t1)
    80008f80:	00b43423          	sd	a1,8(s0)
    80008f84:	00c43823          	sd	a2,16(s0)
    80008f88:	00d43c23          	sd	a3,24(s0)
    80008f8c:	02e43023          	sd	a4,32(s0)
    80008f90:	02f43423          	sd	a5,40(s0)
    80008f94:	03043823          	sd	a6,48(s0)
    80008f98:	03143c23          	sd	a7,56(s0)
    80008f9c:	00050993          	mv	s3,a0
    80008fa0:	4a0c1663          	bnez	s8,8000944c <__printf+0x514>
    80008fa4:	60098c63          	beqz	s3,800095bc <__printf+0x684>
    80008fa8:	0009c503          	lbu	a0,0(s3)
    80008fac:	00840793          	addi	a5,s0,8
    80008fb0:	f6f43c23          	sd	a5,-136(s0)
    80008fb4:	00000493          	li	s1,0
    80008fb8:	22050063          	beqz	a0,800091d8 <__printf+0x2a0>
    80008fbc:	00002a37          	lui	s4,0x2
    80008fc0:	00018ab7          	lui	s5,0x18
    80008fc4:	000f4b37          	lui	s6,0xf4
    80008fc8:	00989bb7          	lui	s7,0x989
    80008fcc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80008fd0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80008fd4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80008fd8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80008fdc:	00148c9b          	addiw	s9,s1,1
    80008fe0:	02500793          	li	a5,37
    80008fe4:	01998933          	add	s2,s3,s9
    80008fe8:	38f51263          	bne	a0,a5,8000936c <__printf+0x434>
    80008fec:	00094783          	lbu	a5,0(s2)
    80008ff0:	00078c9b          	sext.w	s9,a5
    80008ff4:	1e078263          	beqz	a5,800091d8 <__printf+0x2a0>
    80008ff8:	0024849b          	addiw	s1,s1,2
    80008ffc:	07000713          	li	a4,112
    80009000:	00998933          	add	s2,s3,s1
    80009004:	38e78a63          	beq	a5,a4,80009398 <__printf+0x460>
    80009008:	20f76863          	bltu	a4,a5,80009218 <__printf+0x2e0>
    8000900c:	42a78863          	beq	a5,a0,8000943c <__printf+0x504>
    80009010:	06400713          	li	a4,100
    80009014:	40e79663          	bne	a5,a4,80009420 <__printf+0x4e8>
    80009018:	f7843783          	ld	a5,-136(s0)
    8000901c:	0007a603          	lw	a2,0(a5)
    80009020:	00878793          	addi	a5,a5,8
    80009024:	f6f43c23          	sd	a5,-136(s0)
    80009028:	42064a63          	bltz	a2,8000945c <__printf+0x524>
    8000902c:	00a00713          	li	a4,10
    80009030:	02e677bb          	remuw	a5,a2,a4
    80009034:	00003d97          	auipc	s11,0x3
    80009038:	a44d8d93          	addi	s11,s11,-1468 # 8000ba78 <digits>
    8000903c:	00900593          	li	a1,9
    80009040:	0006051b          	sext.w	a0,a2
    80009044:	00000c93          	li	s9,0
    80009048:	02079793          	slli	a5,a5,0x20
    8000904c:	0207d793          	srli	a5,a5,0x20
    80009050:	00fd87b3          	add	a5,s11,a5
    80009054:	0007c783          	lbu	a5,0(a5)
    80009058:	02e656bb          	divuw	a3,a2,a4
    8000905c:	f8f40023          	sb	a5,-128(s0)
    80009060:	14c5d863          	bge	a1,a2,800091b0 <__printf+0x278>
    80009064:	06300593          	li	a1,99
    80009068:	00100c93          	li	s9,1
    8000906c:	02e6f7bb          	remuw	a5,a3,a4
    80009070:	02079793          	slli	a5,a5,0x20
    80009074:	0207d793          	srli	a5,a5,0x20
    80009078:	00fd87b3          	add	a5,s11,a5
    8000907c:	0007c783          	lbu	a5,0(a5)
    80009080:	02e6d73b          	divuw	a4,a3,a4
    80009084:	f8f400a3          	sb	a5,-127(s0)
    80009088:	12a5f463          	bgeu	a1,a0,800091b0 <__printf+0x278>
    8000908c:	00a00693          	li	a3,10
    80009090:	00900593          	li	a1,9
    80009094:	02d777bb          	remuw	a5,a4,a3
    80009098:	02079793          	slli	a5,a5,0x20
    8000909c:	0207d793          	srli	a5,a5,0x20
    800090a0:	00fd87b3          	add	a5,s11,a5
    800090a4:	0007c503          	lbu	a0,0(a5)
    800090a8:	02d757bb          	divuw	a5,a4,a3
    800090ac:	f8a40123          	sb	a0,-126(s0)
    800090b0:	48e5f263          	bgeu	a1,a4,80009534 <__printf+0x5fc>
    800090b4:	06300513          	li	a0,99
    800090b8:	02d7f5bb          	remuw	a1,a5,a3
    800090bc:	02059593          	slli	a1,a1,0x20
    800090c0:	0205d593          	srli	a1,a1,0x20
    800090c4:	00bd85b3          	add	a1,s11,a1
    800090c8:	0005c583          	lbu	a1,0(a1)
    800090cc:	02d7d7bb          	divuw	a5,a5,a3
    800090d0:	f8b401a3          	sb	a1,-125(s0)
    800090d4:	48e57263          	bgeu	a0,a4,80009558 <__printf+0x620>
    800090d8:	3e700513          	li	a0,999
    800090dc:	02d7f5bb          	remuw	a1,a5,a3
    800090e0:	02059593          	slli	a1,a1,0x20
    800090e4:	0205d593          	srli	a1,a1,0x20
    800090e8:	00bd85b3          	add	a1,s11,a1
    800090ec:	0005c583          	lbu	a1,0(a1)
    800090f0:	02d7d7bb          	divuw	a5,a5,a3
    800090f4:	f8b40223          	sb	a1,-124(s0)
    800090f8:	46e57663          	bgeu	a0,a4,80009564 <__printf+0x62c>
    800090fc:	02d7f5bb          	remuw	a1,a5,a3
    80009100:	02059593          	slli	a1,a1,0x20
    80009104:	0205d593          	srli	a1,a1,0x20
    80009108:	00bd85b3          	add	a1,s11,a1
    8000910c:	0005c583          	lbu	a1,0(a1)
    80009110:	02d7d7bb          	divuw	a5,a5,a3
    80009114:	f8b402a3          	sb	a1,-123(s0)
    80009118:	46ea7863          	bgeu	s4,a4,80009588 <__printf+0x650>
    8000911c:	02d7f5bb          	remuw	a1,a5,a3
    80009120:	02059593          	slli	a1,a1,0x20
    80009124:	0205d593          	srli	a1,a1,0x20
    80009128:	00bd85b3          	add	a1,s11,a1
    8000912c:	0005c583          	lbu	a1,0(a1)
    80009130:	02d7d7bb          	divuw	a5,a5,a3
    80009134:	f8b40323          	sb	a1,-122(s0)
    80009138:	3eeaf863          	bgeu	s5,a4,80009528 <__printf+0x5f0>
    8000913c:	02d7f5bb          	remuw	a1,a5,a3
    80009140:	02059593          	slli	a1,a1,0x20
    80009144:	0205d593          	srli	a1,a1,0x20
    80009148:	00bd85b3          	add	a1,s11,a1
    8000914c:	0005c583          	lbu	a1,0(a1)
    80009150:	02d7d7bb          	divuw	a5,a5,a3
    80009154:	f8b403a3          	sb	a1,-121(s0)
    80009158:	42eb7e63          	bgeu	s6,a4,80009594 <__printf+0x65c>
    8000915c:	02d7f5bb          	remuw	a1,a5,a3
    80009160:	02059593          	slli	a1,a1,0x20
    80009164:	0205d593          	srli	a1,a1,0x20
    80009168:	00bd85b3          	add	a1,s11,a1
    8000916c:	0005c583          	lbu	a1,0(a1)
    80009170:	02d7d7bb          	divuw	a5,a5,a3
    80009174:	f8b40423          	sb	a1,-120(s0)
    80009178:	42ebfc63          	bgeu	s7,a4,800095b0 <__printf+0x678>
    8000917c:	02079793          	slli	a5,a5,0x20
    80009180:	0207d793          	srli	a5,a5,0x20
    80009184:	00fd8db3          	add	s11,s11,a5
    80009188:	000dc703          	lbu	a4,0(s11)
    8000918c:	00a00793          	li	a5,10
    80009190:	00900c93          	li	s9,9
    80009194:	f8e404a3          	sb	a4,-119(s0)
    80009198:	00065c63          	bgez	a2,800091b0 <__printf+0x278>
    8000919c:	f9040713          	addi	a4,s0,-112
    800091a0:	00f70733          	add	a4,a4,a5
    800091a4:	02d00693          	li	a3,45
    800091a8:	fed70823          	sb	a3,-16(a4)
    800091ac:	00078c93          	mv	s9,a5
    800091b0:	f8040793          	addi	a5,s0,-128
    800091b4:	01978cb3          	add	s9,a5,s9
    800091b8:	f7f40d13          	addi	s10,s0,-129
    800091bc:	000cc503          	lbu	a0,0(s9)
    800091c0:	fffc8c93          	addi	s9,s9,-1
    800091c4:	00000097          	auipc	ra,0x0
    800091c8:	b90080e7          	jalr	-1136(ra) # 80008d54 <consputc>
    800091cc:	ffac98e3          	bne	s9,s10,800091bc <__printf+0x284>
    800091d0:	00094503          	lbu	a0,0(s2)
    800091d4:	e00514e3          	bnez	a0,80008fdc <__printf+0xa4>
    800091d8:	1a0c1663          	bnez	s8,80009384 <__printf+0x44c>
    800091dc:	08813083          	ld	ra,136(sp)
    800091e0:	08013403          	ld	s0,128(sp)
    800091e4:	07813483          	ld	s1,120(sp)
    800091e8:	07013903          	ld	s2,112(sp)
    800091ec:	06813983          	ld	s3,104(sp)
    800091f0:	06013a03          	ld	s4,96(sp)
    800091f4:	05813a83          	ld	s5,88(sp)
    800091f8:	05013b03          	ld	s6,80(sp)
    800091fc:	04813b83          	ld	s7,72(sp)
    80009200:	04013c03          	ld	s8,64(sp)
    80009204:	03813c83          	ld	s9,56(sp)
    80009208:	03013d03          	ld	s10,48(sp)
    8000920c:	02813d83          	ld	s11,40(sp)
    80009210:	0d010113          	addi	sp,sp,208
    80009214:	00008067          	ret
    80009218:	07300713          	li	a4,115
    8000921c:	1ce78a63          	beq	a5,a4,800093f0 <__printf+0x4b8>
    80009220:	07800713          	li	a4,120
    80009224:	1ee79e63          	bne	a5,a4,80009420 <__printf+0x4e8>
    80009228:	f7843783          	ld	a5,-136(s0)
    8000922c:	0007a703          	lw	a4,0(a5)
    80009230:	00878793          	addi	a5,a5,8
    80009234:	f6f43c23          	sd	a5,-136(s0)
    80009238:	28074263          	bltz	a4,800094bc <__printf+0x584>
    8000923c:	00003d97          	auipc	s11,0x3
    80009240:	83cd8d93          	addi	s11,s11,-1988 # 8000ba78 <digits>
    80009244:	00f77793          	andi	a5,a4,15
    80009248:	00fd87b3          	add	a5,s11,a5
    8000924c:	0007c683          	lbu	a3,0(a5)
    80009250:	00f00613          	li	a2,15
    80009254:	0007079b          	sext.w	a5,a4
    80009258:	f8d40023          	sb	a3,-128(s0)
    8000925c:	0047559b          	srliw	a1,a4,0x4
    80009260:	0047569b          	srliw	a3,a4,0x4
    80009264:	00000c93          	li	s9,0
    80009268:	0ee65063          	bge	a2,a4,80009348 <__printf+0x410>
    8000926c:	00f6f693          	andi	a3,a3,15
    80009270:	00dd86b3          	add	a3,s11,a3
    80009274:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80009278:	0087d79b          	srliw	a5,a5,0x8
    8000927c:	00100c93          	li	s9,1
    80009280:	f8d400a3          	sb	a3,-127(s0)
    80009284:	0cb67263          	bgeu	a2,a1,80009348 <__printf+0x410>
    80009288:	00f7f693          	andi	a3,a5,15
    8000928c:	00dd86b3          	add	a3,s11,a3
    80009290:	0006c583          	lbu	a1,0(a3)
    80009294:	00f00613          	li	a2,15
    80009298:	0047d69b          	srliw	a3,a5,0x4
    8000929c:	f8b40123          	sb	a1,-126(s0)
    800092a0:	0047d593          	srli	a1,a5,0x4
    800092a4:	28f67e63          	bgeu	a2,a5,80009540 <__printf+0x608>
    800092a8:	00f6f693          	andi	a3,a3,15
    800092ac:	00dd86b3          	add	a3,s11,a3
    800092b0:	0006c503          	lbu	a0,0(a3)
    800092b4:	0087d813          	srli	a6,a5,0x8
    800092b8:	0087d69b          	srliw	a3,a5,0x8
    800092bc:	f8a401a3          	sb	a0,-125(s0)
    800092c0:	28b67663          	bgeu	a2,a1,8000954c <__printf+0x614>
    800092c4:	00f6f693          	andi	a3,a3,15
    800092c8:	00dd86b3          	add	a3,s11,a3
    800092cc:	0006c583          	lbu	a1,0(a3)
    800092d0:	00c7d513          	srli	a0,a5,0xc
    800092d4:	00c7d69b          	srliw	a3,a5,0xc
    800092d8:	f8b40223          	sb	a1,-124(s0)
    800092dc:	29067a63          	bgeu	a2,a6,80009570 <__printf+0x638>
    800092e0:	00f6f693          	andi	a3,a3,15
    800092e4:	00dd86b3          	add	a3,s11,a3
    800092e8:	0006c583          	lbu	a1,0(a3)
    800092ec:	0107d813          	srli	a6,a5,0x10
    800092f0:	0107d69b          	srliw	a3,a5,0x10
    800092f4:	f8b402a3          	sb	a1,-123(s0)
    800092f8:	28a67263          	bgeu	a2,a0,8000957c <__printf+0x644>
    800092fc:	00f6f693          	andi	a3,a3,15
    80009300:	00dd86b3          	add	a3,s11,a3
    80009304:	0006c683          	lbu	a3,0(a3)
    80009308:	0147d79b          	srliw	a5,a5,0x14
    8000930c:	f8d40323          	sb	a3,-122(s0)
    80009310:	21067663          	bgeu	a2,a6,8000951c <__printf+0x5e4>
    80009314:	02079793          	slli	a5,a5,0x20
    80009318:	0207d793          	srli	a5,a5,0x20
    8000931c:	00fd8db3          	add	s11,s11,a5
    80009320:	000dc683          	lbu	a3,0(s11)
    80009324:	00800793          	li	a5,8
    80009328:	00700c93          	li	s9,7
    8000932c:	f8d403a3          	sb	a3,-121(s0)
    80009330:	00075c63          	bgez	a4,80009348 <__printf+0x410>
    80009334:	f9040713          	addi	a4,s0,-112
    80009338:	00f70733          	add	a4,a4,a5
    8000933c:	02d00693          	li	a3,45
    80009340:	fed70823          	sb	a3,-16(a4)
    80009344:	00078c93          	mv	s9,a5
    80009348:	f8040793          	addi	a5,s0,-128
    8000934c:	01978cb3          	add	s9,a5,s9
    80009350:	f7f40d13          	addi	s10,s0,-129
    80009354:	000cc503          	lbu	a0,0(s9)
    80009358:	fffc8c93          	addi	s9,s9,-1
    8000935c:	00000097          	auipc	ra,0x0
    80009360:	9f8080e7          	jalr	-1544(ra) # 80008d54 <consputc>
    80009364:	ff9d18e3          	bne	s10,s9,80009354 <__printf+0x41c>
    80009368:	0100006f          	j	80009378 <__printf+0x440>
    8000936c:	00000097          	auipc	ra,0x0
    80009370:	9e8080e7          	jalr	-1560(ra) # 80008d54 <consputc>
    80009374:	000c8493          	mv	s1,s9
    80009378:	00094503          	lbu	a0,0(s2)
    8000937c:	c60510e3          	bnez	a0,80008fdc <__printf+0xa4>
    80009380:	e40c0ee3          	beqz	s8,800091dc <__printf+0x2a4>
    80009384:	00006517          	auipc	a0,0x6
    80009388:	e9c50513          	addi	a0,a0,-356 # 8000f220 <pr>
    8000938c:	00001097          	auipc	ra,0x1
    80009390:	94c080e7          	jalr	-1716(ra) # 80009cd8 <release>
    80009394:	e49ff06f          	j	800091dc <__printf+0x2a4>
    80009398:	f7843783          	ld	a5,-136(s0)
    8000939c:	03000513          	li	a0,48
    800093a0:	01000d13          	li	s10,16
    800093a4:	00878713          	addi	a4,a5,8
    800093a8:	0007bc83          	ld	s9,0(a5)
    800093ac:	f6e43c23          	sd	a4,-136(s0)
    800093b0:	00000097          	auipc	ra,0x0
    800093b4:	9a4080e7          	jalr	-1628(ra) # 80008d54 <consputc>
    800093b8:	07800513          	li	a0,120
    800093bc:	00000097          	auipc	ra,0x0
    800093c0:	998080e7          	jalr	-1640(ra) # 80008d54 <consputc>
    800093c4:	00002d97          	auipc	s11,0x2
    800093c8:	6b4d8d93          	addi	s11,s11,1716 # 8000ba78 <digits>
    800093cc:	03ccd793          	srli	a5,s9,0x3c
    800093d0:	00fd87b3          	add	a5,s11,a5
    800093d4:	0007c503          	lbu	a0,0(a5)
    800093d8:	fffd0d1b          	addiw	s10,s10,-1
    800093dc:	004c9c93          	slli	s9,s9,0x4
    800093e0:	00000097          	auipc	ra,0x0
    800093e4:	974080e7          	jalr	-1676(ra) # 80008d54 <consputc>
    800093e8:	fe0d12e3          	bnez	s10,800093cc <__printf+0x494>
    800093ec:	f8dff06f          	j	80009378 <__printf+0x440>
    800093f0:	f7843783          	ld	a5,-136(s0)
    800093f4:	0007bc83          	ld	s9,0(a5)
    800093f8:	00878793          	addi	a5,a5,8
    800093fc:	f6f43c23          	sd	a5,-136(s0)
    80009400:	000c9a63          	bnez	s9,80009414 <__printf+0x4dc>
    80009404:	1080006f          	j	8000950c <__printf+0x5d4>
    80009408:	001c8c93          	addi	s9,s9,1
    8000940c:	00000097          	auipc	ra,0x0
    80009410:	948080e7          	jalr	-1720(ra) # 80008d54 <consputc>
    80009414:	000cc503          	lbu	a0,0(s9)
    80009418:	fe0518e3          	bnez	a0,80009408 <__printf+0x4d0>
    8000941c:	f5dff06f          	j	80009378 <__printf+0x440>
    80009420:	02500513          	li	a0,37
    80009424:	00000097          	auipc	ra,0x0
    80009428:	930080e7          	jalr	-1744(ra) # 80008d54 <consputc>
    8000942c:	000c8513          	mv	a0,s9
    80009430:	00000097          	auipc	ra,0x0
    80009434:	924080e7          	jalr	-1756(ra) # 80008d54 <consputc>
    80009438:	f41ff06f          	j	80009378 <__printf+0x440>
    8000943c:	02500513          	li	a0,37
    80009440:	00000097          	auipc	ra,0x0
    80009444:	914080e7          	jalr	-1772(ra) # 80008d54 <consputc>
    80009448:	f31ff06f          	j	80009378 <__printf+0x440>
    8000944c:	00030513          	mv	a0,t1
    80009450:	00000097          	auipc	ra,0x0
    80009454:	7bc080e7          	jalr	1980(ra) # 80009c0c <acquire>
    80009458:	b4dff06f          	j	80008fa4 <__printf+0x6c>
    8000945c:	40c0053b          	negw	a0,a2
    80009460:	00a00713          	li	a4,10
    80009464:	02e576bb          	remuw	a3,a0,a4
    80009468:	00002d97          	auipc	s11,0x2
    8000946c:	610d8d93          	addi	s11,s11,1552 # 8000ba78 <digits>
    80009470:	ff700593          	li	a1,-9
    80009474:	02069693          	slli	a3,a3,0x20
    80009478:	0206d693          	srli	a3,a3,0x20
    8000947c:	00dd86b3          	add	a3,s11,a3
    80009480:	0006c683          	lbu	a3,0(a3)
    80009484:	02e557bb          	divuw	a5,a0,a4
    80009488:	f8d40023          	sb	a3,-128(s0)
    8000948c:	10b65e63          	bge	a2,a1,800095a8 <__printf+0x670>
    80009490:	06300593          	li	a1,99
    80009494:	02e7f6bb          	remuw	a3,a5,a4
    80009498:	02069693          	slli	a3,a3,0x20
    8000949c:	0206d693          	srli	a3,a3,0x20
    800094a0:	00dd86b3          	add	a3,s11,a3
    800094a4:	0006c683          	lbu	a3,0(a3)
    800094a8:	02e7d73b          	divuw	a4,a5,a4
    800094ac:	00200793          	li	a5,2
    800094b0:	f8d400a3          	sb	a3,-127(s0)
    800094b4:	bca5ece3          	bltu	a1,a0,8000908c <__printf+0x154>
    800094b8:	ce5ff06f          	j	8000919c <__printf+0x264>
    800094bc:	40e007bb          	negw	a5,a4
    800094c0:	00002d97          	auipc	s11,0x2
    800094c4:	5b8d8d93          	addi	s11,s11,1464 # 8000ba78 <digits>
    800094c8:	00f7f693          	andi	a3,a5,15
    800094cc:	00dd86b3          	add	a3,s11,a3
    800094d0:	0006c583          	lbu	a1,0(a3)
    800094d4:	ff100613          	li	a2,-15
    800094d8:	0047d69b          	srliw	a3,a5,0x4
    800094dc:	f8b40023          	sb	a1,-128(s0)
    800094e0:	0047d59b          	srliw	a1,a5,0x4
    800094e4:	0ac75e63          	bge	a4,a2,800095a0 <__printf+0x668>
    800094e8:	00f6f693          	andi	a3,a3,15
    800094ec:	00dd86b3          	add	a3,s11,a3
    800094f0:	0006c603          	lbu	a2,0(a3)
    800094f4:	00f00693          	li	a3,15
    800094f8:	0087d79b          	srliw	a5,a5,0x8
    800094fc:	f8c400a3          	sb	a2,-127(s0)
    80009500:	d8b6e4e3          	bltu	a3,a1,80009288 <__printf+0x350>
    80009504:	00200793          	li	a5,2
    80009508:	e2dff06f          	j	80009334 <__printf+0x3fc>
    8000950c:	00002c97          	auipc	s9,0x2
    80009510:	54cc8c93          	addi	s9,s9,1356 # 8000ba58 <CONSOLE_STATUS+0xa48>
    80009514:	02800513          	li	a0,40
    80009518:	ef1ff06f          	j	80009408 <__printf+0x4d0>
    8000951c:	00700793          	li	a5,7
    80009520:	00600c93          	li	s9,6
    80009524:	e0dff06f          	j	80009330 <__printf+0x3f8>
    80009528:	00700793          	li	a5,7
    8000952c:	00600c93          	li	s9,6
    80009530:	c69ff06f          	j	80009198 <__printf+0x260>
    80009534:	00300793          	li	a5,3
    80009538:	00200c93          	li	s9,2
    8000953c:	c5dff06f          	j	80009198 <__printf+0x260>
    80009540:	00300793          	li	a5,3
    80009544:	00200c93          	li	s9,2
    80009548:	de9ff06f          	j	80009330 <__printf+0x3f8>
    8000954c:	00400793          	li	a5,4
    80009550:	00300c93          	li	s9,3
    80009554:	dddff06f          	j	80009330 <__printf+0x3f8>
    80009558:	00400793          	li	a5,4
    8000955c:	00300c93          	li	s9,3
    80009560:	c39ff06f          	j	80009198 <__printf+0x260>
    80009564:	00500793          	li	a5,5
    80009568:	00400c93          	li	s9,4
    8000956c:	c2dff06f          	j	80009198 <__printf+0x260>
    80009570:	00500793          	li	a5,5
    80009574:	00400c93          	li	s9,4
    80009578:	db9ff06f          	j	80009330 <__printf+0x3f8>
    8000957c:	00600793          	li	a5,6
    80009580:	00500c93          	li	s9,5
    80009584:	dadff06f          	j	80009330 <__printf+0x3f8>
    80009588:	00600793          	li	a5,6
    8000958c:	00500c93          	li	s9,5
    80009590:	c09ff06f          	j	80009198 <__printf+0x260>
    80009594:	00800793          	li	a5,8
    80009598:	00700c93          	li	s9,7
    8000959c:	bfdff06f          	j	80009198 <__printf+0x260>
    800095a0:	00100793          	li	a5,1
    800095a4:	d91ff06f          	j	80009334 <__printf+0x3fc>
    800095a8:	00100793          	li	a5,1
    800095ac:	bf1ff06f          	j	8000919c <__printf+0x264>
    800095b0:	00900793          	li	a5,9
    800095b4:	00800c93          	li	s9,8
    800095b8:	be1ff06f          	j	80009198 <__printf+0x260>
    800095bc:	00002517          	auipc	a0,0x2
    800095c0:	4a450513          	addi	a0,a0,1188 # 8000ba60 <CONSOLE_STATUS+0xa50>
    800095c4:	00000097          	auipc	ra,0x0
    800095c8:	918080e7          	jalr	-1768(ra) # 80008edc <panic>

00000000800095cc <printfinit>:
    800095cc:	fe010113          	addi	sp,sp,-32
    800095d0:	00813823          	sd	s0,16(sp)
    800095d4:	00913423          	sd	s1,8(sp)
    800095d8:	00113c23          	sd	ra,24(sp)
    800095dc:	02010413          	addi	s0,sp,32
    800095e0:	00006497          	auipc	s1,0x6
    800095e4:	c4048493          	addi	s1,s1,-960 # 8000f220 <pr>
    800095e8:	00048513          	mv	a0,s1
    800095ec:	00002597          	auipc	a1,0x2
    800095f0:	48458593          	addi	a1,a1,1156 # 8000ba70 <CONSOLE_STATUS+0xa60>
    800095f4:	00000097          	auipc	ra,0x0
    800095f8:	5f4080e7          	jalr	1524(ra) # 80009be8 <initlock>
    800095fc:	01813083          	ld	ra,24(sp)
    80009600:	01013403          	ld	s0,16(sp)
    80009604:	0004ac23          	sw	zero,24(s1)
    80009608:	00813483          	ld	s1,8(sp)
    8000960c:	02010113          	addi	sp,sp,32
    80009610:	00008067          	ret

0000000080009614 <uartinit>:
    80009614:	ff010113          	addi	sp,sp,-16
    80009618:	00813423          	sd	s0,8(sp)
    8000961c:	01010413          	addi	s0,sp,16
    80009620:	100007b7          	lui	a5,0x10000
    80009624:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80009628:	f8000713          	li	a4,-128
    8000962c:	00e781a3          	sb	a4,3(a5)
    80009630:	00300713          	li	a4,3
    80009634:	00e78023          	sb	a4,0(a5)
    80009638:	000780a3          	sb	zero,1(a5)
    8000963c:	00e781a3          	sb	a4,3(a5)
    80009640:	00700693          	li	a3,7
    80009644:	00d78123          	sb	a3,2(a5)
    80009648:	00e780a3          	sb	a4,1(a5)
    8000964c:	00813403          	ld	s0,8(sp)
    80009650:	01010113          	addi	sp,sp,16
    80009654:	00008067          	ret

0000000080009658 <uartputc>:
    80009658:	00005797          	auipc	a5,0x5
    8000965c:	8f07a783          	lw	a5,-1808(a5) # 8000df48 <panicked>
    80009660:	00078463          	beqz	a5,80009668 <uartputc+0x10>
    80009664:	0000006f          	j	80009664 <uartputc+0xc>
    80009668:	fd010113          	addi	sp,sp,-48
    8000966c:	02813023          	sd	s0,32(sp)
    80009670:	00913c23          	sd	s1,24(sp)
    80009674:	01213823          	sd	s2,16(sp)
    80009678:	01313423          	sd	s3,8(sp)
    8000967c:	02113423          	sd	ra,40(sp)
    80009680:	03010413          	addi	s0,sp,48
    80009684:	00005917          	auipc	s2,0x5
    80009688:	8cc90913          	addi	s2,s2,-1844 # 8000df50 <uart_tx_r>
    8000968c:	00093783          	ld	a5,0(s2)
    80009690:	00005497          	auipc	s1,0x5
    80009694:	8c848493          	addi	s1,s1,-1848 # 8000df58 <uart_tx_w>
    80009698:	0004b703          	ld	a4,0(s1)
    8000969c:	02078693          	addi	a3,a5,32
    800096a0:	00050993          	mv	s3,a0
    800096a4:	02e69c63          	bne	a3,a4,800096dc <uartputc+0x84>
    800096a8:	00001097          	auipc	ra,0x1
    800096ac:	834080e7          	jalr	-1996(ra) # 80009edc <push_on>
    800096b0:	00093783          	ld	a5,0(s2)
    800096b4:	0004b703          	ld	a4,0(s1)
    800096b8:	02078793          	addi	a5,a5,32
    800096bc:	00e79463          	bne	a5,a4,800096c4 <uartputc+0x6c>
    800096c0:	0000006f          	j	800096c0 <uartputc+0x68>
    800096c4:	00001097          	auipc	ra,0x1
    800096c8:	88c080e7          	jalr	-1908(ra) # 80009f50 <pop_on>
    800096cc:	00093783          	ld	a5,0(s2)
    800096d0:	0004b703          	ld	a4,0(s1)
    800096d4:	02078693          	addi	a3,a5,32
    800096d8:	fce688e3          	beq	a3,a4,800096a8 <uartputc+0x50>
    800096dc:	01f77693          	andi	a3,a4,31
    800096e0:	00006597          	auipc	a1,0x6
    800096e4:	b6058593          	addi	a1,a1,-1184 # 8000f240 <uart_tx_buf>
    800096e8:	00d586b3          	add	a3,a1,a3
    800096ec:	00170713          	addi	a4,a4,1
    800096f0:	01368023          	sb	s3,0(a3)
    800096f4:	00e4b023          	sd	a4,0(s1)
    800096f8:	10000637          	lui	a2,0x10000
    800096fc:	02f71063          	bne	a4,a5,8000971c <uartputc+0xc4>
    80009700:	0340006f          	j	80009734 <uartputc+0xdc>
    80009704:	00074703          	lbu	a4,0(a4)
    80009708:	00f93023          	sd	a5,0(s2)
    8000970c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80009710:	00093783          	ld	a5,0(s2)
    80009714:	0004b703          	ld	a4,0(s1)
    80009718:	00f70e63          	beq	a4,a5,80009734 <uartputc+0xdc>
    8000971c:	00564683          	lbu	a3,5(a2)
    80009720:	01f7f713          	andi	a4,a5,31
    80009724:	00e58733          	add	a4,a1,a4
    80009728:	0206f693          	andi	a3,a3,32
    8000972c:	00178793          	addi	a5,a5,1
    80009730:	fc069ae3          	bnez	a3,80009704 <uartputc+0xac>
    80009734:	02813083          	ld	ra,40(sp)
    80009738:	02013403          	ld	s0,32(sp)
    8000973c:	01813483          	ld	s1,24(sp)
    80009740:	01013903          	ld	s2,16(sp)
    80009744:	00813983          	ld	s3,8(sp)
    80009748:	03010113          	addi	sp,sp,48
    8000974c:	00008067          	ret

0000000080009750 <uartputc_sync>:
    80009750:	ff010113          	addi	sp,sp,-16
    80009754:	00813423          	sd	s0,8(sp)
    80009758:	01010413          	addi	s0,sp,16
    8000975c:	00004717          	auipc	a4,0x4
    80009760:	7ec72703          	lw	a4,2028(a4) # 8000df48 <panicked>
    80009764:	02071663          	bnez	a4,80009790 <uartputc_sync+0x40>
    80009768:	00050793          	mv	a5,a0
    8000976c:	100006b7          	lui	a3,0x10000
    80009770:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80009774:	02077713          	andi	a4,a4,32
    80009778:	fe070ce3          	beqz	a4,80009770 <uartputc_sync+0x20>
    8000977c:	0ff7f793          	andi	a5,a5,255
    80009780:	00f68023          	sb	a5,0(a3)
    80009784:	00813403          	ld	s0,8(sp)
    80009788:	01010113          	addi	sp,sp,16
    8000978c:	00008067          	ret
    80009790:	0000006f          	j	80009790 <uartputc_sync+0x40>

0000000080009794 <uartstart>:
    80009794:	ff010113          	addi	sp,sp,-16
    80009798:	00813423          	sd	s0,8(sp)
    8000979c:	01010413          	addi	s0,sp,16
    800097a0:	00004617          	auipc	a2,0x4
    800097a4:	7b060613          	addi	a2,a2,1968 # 8000df50 <uart_tx_r>
    800097a8:	00004517          	auipc	a0,0x4
    800097ac:	7b050513          	addi	a0,a0,1968 # 8000df58 <uart_tx_w>
    800097b0:	00063783          	ld	a5,0(a2)
    800097b4:	00053703          	ld	a4,0(a0)
    800097b8:	04f70263          	beq	a4,a5,800097fc <uartstart+0x68>
    800097bc:	100005b7          	lui	a1,0x10000
    800097c0:	00006817          	auipc	a6,0x6
    800097c4:	a8080813          	addi	a6,a6,-1408 # 8000f240 <uart_tx_buf>
    800097c8:	01c0006f          	j	800097e4 <uartstart+0x50>
    800097cc:	0006c703          	lbu	a4,0(a3)
    800097d0:	00f63023          	sd	a5,0(a2)
    800097d4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800097d8:	00063783          	ld	a5,0(a2)
    800097dc:	00053703          	ld	a4,0(a0)
    800097e0:	00f70e63          	beq	a4,a5,800097fc <uartstart+0x68>
    800097e4:	01f7f713          	andi	a4,a5,31
    800097e8:	00e806b3          	add	a3,a6,a4
    800097ec:	0055c703          	lbu	a4,5(a1)
    800097f0:	00178793          	addi	a5,a5,1
    800097f4:	02077713          	andi	a4,a4,32
    800097f8:	fc071ae3          	bnez	a4,800097cc <uartstart+0x38>
    800097fc:	00813403          	ld	s0,8(sp)
    80009800:	01010113          	addi	sp,sp,16
    80009804:	00008067          	ret

0000000080009808 <uartgetc>:
    80009808:	ff010113          	addi	sp,sp,-16
    8000980c:	00813423          	sd	s0,8(sp)
    80009810:	01010413          	addi	s0,sp,16
    80009814:	10000737          	lui	a4,0x10000
    80009818:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000981c:	0017f793          	andi	a5,a5,1
    80009820:	00078c63          	beqz	a5,80009838 <uartgetc+0x30>
    80009824:	00074503          	lbu	a0,0(a4)
    80009828:	0ff57513          	andi	a0,a0,255
    8000982c:	00813403          	ld	s0,8(sp)
    80009830:	01010113          	addi	sp,sp,16
    80009834:	00008067          	ret
    80009838:	fff00513          	li	a0,-1
    8000983c:	ff1ff06f          	j	8000982c <uartgetc+0x24>

0000000080009840 <uartintr>:
    80009840:	100007b7          	lui	a5,0x10000
    80009844:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80009848:	0017f793          	andi	a5,a5,1
    8000984c:	0a078463          	beqz	a5,800098f4 <uartintr+0xb4>
    80009850:	fe010113          	addi	sp,sp,-32
    80009854:	00813823          	sd	s0,16(sp)
    80009858:	00913423          	sd	s1,8(sp)
    8000985c:	00113c23          	sd	ra,24(sp)
    80009860:	02010413          	addi	s0,sp,32
    80009864:	100004b7          	lui	s1,0x10000
    80009868:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000986c:	0ff57513          	andi	a0,a0,255
    80009870:	fffff097          	auipc	ra,0xfffff
    80009874:	534080e7          	jalr	1332(ra) # 80008da4 <consoleintr>
    80009878:	0054c783          	lbu	a5,5(s1)
    8000987c:	0017f793          	andi	a5,a5,1
    80009880:	fe0794e3          	bnez	a5,80009868 <uartintr+0x28>
    80009884:	00004617          	auipc	a2,0x4
    80009888:	6cc60613          	addi	a2,a2,1740 # 8000df50 <uart_tx_r>
    8000988c:	00004517          	auipc	a0,0x4
    80009890:	6cc50513          	addi	a0,a0,1740 # 8000df58 <uart_tx_w>
    80009894:	00063783          	ld	a5,0(a2)
    80009898:	00053703          	ld	a4,0(a0)
    8000989c:	04f70263          	beq	a4,a5,800098e0 <uartintr+0xa0>
    800098a0:	100005b7          	lui	a1,0x10000
    800098a4:	00006817          	auipc	a6,0x6
    800098a8:	99c80813          	addi	a6,a6,-1636 # 8000f240 <uart_tx_buf>
    800098ac:	01c0006f          	j	800098c8 <uartintr+0x88>
    800098b0:	0006c703          	lbu	a4,0(a3)
    800098b4:	00f63023          	sd	a5,0(a2)
    800098b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800098bc:	00063783          	ld	a5,0(a2)
    800098c0:	00053703          	ld	a4,0(a0)
    800098c4:	00f70e63          	beq	a4,a5,800098e0 <uartintr+0xa0>
    800098c8:	01f7f713          	andi	a4,a5,31
    800098cc:	00e806b3          	add	a3,a6,a4
    800098d0:	0055c703          	lbu	a4,5(a1)
    800098d4:	00178793          	addi	a5,a5,1
    800098d8:	02077713          	andi	a4,a4,32
    800098dc:	fc071ae3          	bnez	a4,800098b0 <uartintr+0x70>
    800098e0:	01813083          	ld	ra,24(sp)
    800098e4:	01013403          	ld	s0,16(sp)
    800098e8:	00813483          	ld	s1,8(sp)
    800098ec:	02010113          	addi	sp,sp,32
    800098f0:	00008067          	ret
    800098f4:	00004617          	auipc	a2,0x4
    800098f8:	65c60613          	addi	a2,a2,1628 # 8000df50 <uart_tx_r>
    800098fc:	00004517          	auipc	a0,0x4
    80009900:	65c50513          	addi	a0,a0,1628 # 8000df58 <uart_tx_w>
    80009904:	00063783          	ld	a5,0(a2)
    80009908:	00053703          	ld	a4,0(a0)
    8000990c:	04f70263          	beq	a4,a5,80009950 <uartintr+0x110>
    80009910:	100005b7          	lui	a1,0x10000
    80009914:	00006817          	auipc	a6,0x6
    80009918:	92c80813          	addi	a6,a6,-1748 # 8000f240 <uart_tx_buf>
    8000991c:	01c0006f          	j	80009938 <uartintr+0xf8>
    80009920:	0006c703          	lbu	a4,0(a3)
    80009924:	00f63023          	sd	a5,0(a2)
    80009928:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000992c:	00063783          	ld	a5,0(a2)
    80009930:	00053703          	ld	a4,0(a0)
    80009934:	02f70063          	beq	a4,a5,80009954 <uartintr+0x114>
    80009938:	01f7f713          	andi	a4,a5,31
    8000993c:	00e806b3          	add	a3,a6,a4
    80009940:	0055c703          	lbu	a4,5(a1)
    80009944:	00178793          	addi	a5,a5,1
    80009948:	02077713          	andi	a4,a4,32
    8000994c:	fc071ae3          	bnez	a4,80009920 <uartintr+0xe0>
    80009950:	00008067          	ret
    80009954:	00008067          	ret

0000000080009958 <kinit>:
    80009958:	fc010113          	addi	sp,sp,-64
    8000995c:	02913423          	sd	s1,40(sp)
    80009960:	fffff7b7          	lui	a5,0xfffff
    80009964:	00007497          	auipc	s1,0x7
    80009968:	8fb48493          	addi	s1,s1,-1797 # 8001025f <end+0xfff>
    8000996c:	02813823          	sd	s0,48(sp)
    80009970:	01313c23          	sd	s3,24(sp)
    80009974:	00f4f4b3          	and	s1,s1,a5
    80009978:	02113c23          	sd	ra,56(sp)
    8000997c:	03213023          	sd	s2,32(sp)
    80009980:	01413823          	sd	s4,16(sp)
    80009984:	01513423          	sd	s5,8(sp)
    80009988:	04010413          	addi	s0,sp,64
    8000998c:	000017b7          	lui	a5,0x1
    80009990:	01100993          	li	s3,17
    80009994:	00f487b3          	add	a5,s1,a5
    80009998:	01b99993          	slli	s3,s3,0x1b
    8000999c:	06f9e063          	bltu	s3,a5,800099fc <kinit+0xa4>
    800099a0:	00006a97          	auipc	s5,0x6
    800099a4:	8c0a8a93          	addi	s5,s5,-1856 # 8000f260 <end>
    800099a8:	0754ec63          	bltu	s1,s5,80009a20 <kinit+0xc8>
    800099ac:	0734fa63          	bgeu	s1,s3,80009a20 <kinit+0xc8>
    800099b0:	00088a37          	lui	s4,0x88
    800099b4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800099b8:	00004917          	auipc	s2,0x4
    800099bc:	5a890913          	addi	s2,s2,1448 # 8000df60 <kmem>
    800099c0:	00ca1a13          	slli	s4,s4,0xc
    800099c4:	0140006f          	j	800099d8 <kinit+0x80>
    800099c8:	000017b7          	lui	a5,0x1
    800099cc:	00f484b3          	add	s1,s1,a5
    800099d0:	0554e863          	bltu	s1,s5,80009a20 <kinit+0xc8>
    800099d4:	0534f663          	bgeu	s1,s3,80009a20 <kinit+0xc8>
    800099d8:	00001637          	lui	a2,0x1
    800099dc:	00100593          	li	a1,1
    800099e0:	00048513          	mv	a0,s1
    800099e4:	00000097          	auipc	ra,0x0
    800099e8:	5e4080e7          	jalr	1508(ra) # 80009fc8 <__memset>
    800099ec:	00093783          	ld	a5,0(s2)
    800099f0:	00f4b023          	sd	a5,0(s1)
    800099f4:	00993023          	sd	s1,0(s2)
    800099f8:	fd4498e3          	bne	s1,s4,800099c8 <kinit+0x70>
    800099fc:	03813083          	ld	ra,56(sp)
    80009a00:	03013403          	ld	s0,48(sp)
    80009a04:	02813483          	ld	s1,40(sp)
    80009a08:	02013903          	ld	s2,32(sp)
    80009a0c:	01813983          	ld	s3,24(sp)
    80009a10:	01013a03          	ld	s4,16(sp)
    80009a14:	00813a83          	ld	s5,8(sp)
    80009a18:	04010113          	addi	sp,sp,64
    80009a1c:	00008067          	ret
    80009a20:	00002517          	auipc	a0,0x2
    80009a24:	07050513          	addi	a0,a0,112 # 8000ba90 <digits+0x18>
    80009a28:	fffff097          	auipc	ra,0xfffff
    80009a2c:	4b4080e7          	jalr	1204(ra) # 80008edc <panic>

0000000080009a30 <freerange>:
    80009a30:	fc010113          	addi	sp,sp,-64
    80009a34:	000017b7          	lui	a5,0x1
    80009a38:	02913423          	sd	s1,40(sp)
    80009a3c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80009a40:	009504b3          	add	s1,a0,s1
    80009a44:	fffff537          	lui	a0,0xfffff
    80009a48:	02813823          	sd	s0,48(sp)
    80009a4c:	02113c23          	sd	ra,56(sp)
    80009a50:	03213023          	sd	s2,32(sp)
    80009a54:	01313c23          	sd	s3,24(sp)
    80009a58:	01413823          	sd	s4,16(sp)
    80009a5c:	01513423          	sd	s5,8(sp)
    80009a60:	01613023          	sd	s6,0(sp)
    80009a64:	04010413          	addi	s0,sp,64
    80009a68:	00a4f4b3          	and	s1,s1,a0
    80009a6c:	00f487b3          	add	a5,s1,a5
    80009a70:	06f5e463          	bltu	a1,a5,80009ad8 <freerange+0xa8>
    80009a74:	00005a97          	auipc	s5,0x5
    80009a78:	7eca8a93          	addi	s5,s5,2028 # 8000f260 <end>
    80009a7c:	0954e263          	bltu	s1,s5,80009b00 <freerange+0xd0>
    80009a80:	01100993          	li	s3,17
    80009a84:	01b99993          	slli	s3,s3,0x1b
    80009a88:	0734fc63          	bgeu	s1,s3,80009b00 <freerange+0xd0>
    80009a8c:	00058a13          	mv	s4,a1
    80009a90:	00004917          	auipc	s2,0x4
    80009a94:	4d090913          	addi	s2,s2,1232 # 8000df60 <kmem>
    80009a98:	00002b37          	lui	s6,0x2
    80009a9c:	0140006f          	j	80009ab0 <freerange+0x80>
    80009aa0:	000017b7          	lui	a5,0x1
    80009aa4:	00f484b3          	add	s1,s1,a5
    80009aa8:	0554ec63          	bltu	s1,s5,80009b00 <freerange+0xd0>
    80009aac:	0534fa63          	bgeu	s1,s3,80009b00 <freerange+0xd0>
    80009ab0:	00001637          	lui	a2,0x1
    80009ab4:	00100593          	li	a1,1
    80009ab8:	00048513          	mv	a0,s1
    80009abc:	00000097          	auipc	ra,0x0
    80009ac0:	50c080e7          	jalr	1292(ra) # 80009fc8 <__memset>
    80009ac4:	00093703          	ld	a4,0(s2)
    80009ac8:	016487b3          	add	a5,s1,s6
    80009acc:	00e4b023          	sd	a4,0(s1)
    80009ad0:	00993023          	sd	s1,0(s2)
    80009ad4:	fcfa76e3          	bgeu	s4,a5,80009aa0 <freerange+0x70>
    80009ad8:	03813083          	ld	ra,56(sp)
    80009adc:	03013403          	ld	s0,48(sp)
    80009ae0:	02813483          	ld	s1,40(sp)
    80009ae4:	02013903          	ld	s2,32(sp)
    80009ae8:	01813983          	ld	s3,24(sp)
    80009aec:	01013a03          	ld	s4,16(sp)
    80009af0:	00813a83          	ld	s5,8(sp)
    80009af4:	00013b03          	ld	s6,0(sp)
    80009af8:	04010113          	addi	sp,sp,64
    80009afc:	00008067          	ret
    80009b00:	00002517          	auipc	a0,0x2
    80009b04:	f9050513          	addi	a0,a0,-112 # 8000ba90 <digits+0x18>
    80009b08:	fffff097          	auipc	ra,0xfffff
    80009b0c:	3d4080e7          	jalr	980(ra) # 80008edc <panic>

0000000080009b10 <kfree>:
    80009b10:	fe010113          	addi	sp,sp,-32
    80009b14:	00813823          	sd	s0,16(sp)
    80009b18:	00113c23          	sd	ra,24(sp)
    80009b1c:	00913423          	sd	s1,8(sp)
    80009b20:	02010413          	addi	s0,sp,32
    80009b24:	03451793          	slli	a5,a0,0x34
    80009b28:	04079c63          	bnez	a5,80009b80 <kfree+0x70>
    80009b2c:	00005797          	auipc	a5,0x5
    80009b30:	73478793          	addi	a5,a5,1844 # 8000f260 <end>
    80009b34:	00050493          	mv	s1,a0
    80009b38:	04f56463          	bltu	a0,a5,80009b80 <kfree+0x70>
    80009b3c:	01100793          	li	a5,17
    80009b40:	01b79793          	slli	a5,a5,0x1b
    80009b44:	02f57e63          	bgeu	a0,a5,80009b80 <kfree+0x70>
    80009b48:	00001637          	lui	a2,0x1
    80009b4c:	00100593          	li	a1,1
    80009b50:	00000097          	auipc	ra,0x0
    80009b54:	478080e7          	jalr	1144(ra) # 80009fc8 <__memset>
    80009b58:	00004797          	auipc	a5,0x4
    80009b5c:	40878793          	addi	a5,a5,1032 # 8000df60 <kmem>
    80009b60:	0007b703          	ld	a4,0(a5)
    80009b64:	01813083          	ld	ra,24(sp)
    80009b68:	01013403          	ld	s0,16(sp)
    80009b6c:	00e4b023          	sd	a4,0(s1)
    80009b70:	0097b023          	sd	s1,0(a5)
    80009b74:	00813483          	ld	s1,8(sp)
    80009b78:	02010113          	addi	sp,sp,32
    80009b7c:	00008067          	ret
    80009b80:	00002517          	auipc	a0,0x2
    80009b84:	f1050513          	addi	a0,a0,-240 # 8000ba90 <digits+0x18>
    80009b88:	fffff097          	auipc	ra,0xfffff
    80009b8c:	354080e7          	jalr	852(ra) # 80008edc <panic>

0000000080009b90 <kalloc>:
    80009b90:	fe010113          	addi	sp,sp,-32
    80009b94:	00813823          	sd	s0,16(sp)
    80009b98:	00913423          	sd	s1,8(sp)
    80009b9c:	00113c23          	sd	ra,24(sp)
    80009ba0:	02010413          	addi	s0,sp,32
    80009ba4:	00004797          	auipc	a5,0x4
    80009ba8:	3bc78793          	addi	a5,a5,956 # 8000df60 <kmem>
    80009bac:	0007b483          	ld	s1,0(a5)
    80009bb0:	02048063          	beqz	s1,80009bd0 <kalloc+0x40>
    80009bb4:	0004b703          	ld	a4,0(s1)
    80009bb8:	00001637          	lui	a2,0x1
    80009bbc:	00500593          	li	a1,5
    80009bc0:	00048513          	mv	a0,s1
    80009bc4:	00e7b023          	sd	a4,0(a5)
    80009bc8:	00000097          	auipc	ra,0x0
    80009bcc:	400080e7          	jalr	1024(ra) # 80009fc8 <__memset>
    80009bd0:	01813083          	ld	ra,24(sp)
    80009bd4:	01013403          	ld	s0,16(sp)
    80009bd8:	00048513          	mv	a0,s1
    80009bdc:	00813483          	ld	s1,8(sp)
    80009be0:	02010113          	addi	sp,sp,32
    80009be4:	00008067          	ret

0000000080009be8 <initlock>:
    80009be8:	ff010113          	addi	sp,sp,-16
    80009bec:	00813423          	sd	s0,8(sp)
    80009bf0:	01010413          	addi	s0,sp,16
    80009bf4:	00813403          	ld	s0,8(sp)
    80009bf8:	00b53423          	sd	a1,8(a0)
    80009bfc:	00052023          	sw	zero,0(a0)
    80009c00:	00053823          	sd	zero,16(a0)
    80009c04:	01010113          	addi	sp,sp,16
    80009c08:	00008067          	ret

0000000080009c0c <acquire>:
    80009c0c:	fe010113          	addi	sp,sp,-32
    80009c10:	00813823          	sd	s0,16(sp)
    80009c14:	00913423          	sd	s1,8(sp)
    80009c18:	00113c23          	sd	ra,24(sp)
    80009c1c:	01213023          	sd	s2,0(sp)
    80009c20:	02010413          	addi	s0,sp,32
    80009c24:	00050493          	mv	s1,a0
    80009c28:	10002973          	csrr	s2,sstatus
    80009c2c:	100027f3          	csrr	a5,sstatus
    80009c30:	ffd7f793          	andi	a5,a5,-3
    80009c34:	10079073          	csrw	sstatus,a5
    80009c38:	fffff097          	auipc	ra,0xfffff
    80009c3c:	8e4080e7          	jalr	-1820(ra) # 8000851c <mycpu>
    80009c40:	07852783          	lw	a5,120(a0)
    80009c44:	06078e63          	beqz	a5,80009cc0 <acquire+0xb4>
    80009c48:	fffff097          	auipc	ra,0xfffff
    80009c4c:	8d4080e7          	jalr	-1836(ra) # 8000851c <mycpu>
    80009c50:	07852783          	lw	a5,120(a0)
    80009c54:	0004a703          	lw	a4,0(s1)
    80009c58:	0017879b          	addiw	a5,a5,1
    80009c5c:	06f52c23          	sw	a5,120(a0)
    80009c60:	04071063          	bnez	a4,80009ca0 <acquire+0x94>
    80009c64:	00100713          	li	a4,1
    80009c68:	00070793          	mv	a5,a4
    80009c6c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80009c70:	0007879b          	sext.w	a5,a5
    80009c74:	fe079ae3          	bnez	a5,80009c68 <acquire+0x5c>
    80009c78:	0ff0000f          	fence
    80009c7c:	fffff097          	auipc	ra,0xfffff
    80009c80:	8a0080e7          	jalr	-1888(ra) # 8000851c <mycpu>
    80009c84:	01813083          	ld	ra,24(sp)
    80009c88:	01013403          	ld	s0,16(sp)
    80009c8c:	00a4b823          	sd	a0,16(s1)
    80009c90:	00013903          	ld	s2,0(sp)
    80009c94:	00813483          	ld	s1,8(sp)
    80009c98:	02010113          	addi	sp,sp,32
    80009c9c:	00008067          	ret
    80009ca0:	0104b903          	ld	s2,16(s1)
    80009ca4:	fffff097          	auipc	ra,0xfffff
    80009ca8:	878080e7          	jalr	-1928(ra) # 8000851c <mycpu>
    80009cac:	faa91ce3          	bne	s2,a0,80009c64 <acquire+0x58>
    80009cb0:	00002517          	auipc	a0,0x2
    80009cb4:	de850513          	addi	a0,a0,-536 # 8000ba98 <digits+0x20>
    80009cb8:	fffff097          	auipc	ra,0xfffff
    80009cbc:	224080e7          	jalr	548(ra) # 80008edc <panic>
    80009cc0:	00195913          	srli	s2,s2,0x1
    80009cc4:	fffff097          	auipc	ra,0xfffff
    80009cc8:	858080e7          	jalr	-1960(ra) # 8000851c <mycpu>
    80009ccc:	00197913          	andi	s2,s2,1
    80009cd0:	07252e23          	sw	s2,124(a0)
    80009cd4:	f75ff06f          	j	80009c48 <acquire+0x3c>

0000000080009cd8 <release>:
    80009cd8:	fe010113          	addi	sp,sp,-32
    80009cdc:	00813823          	sd	s0,16(sp)
    80009ce0:	00113c23          	sd	ra,24(sp)
    80009ce4:	00913423          	sd	s1,8(sp)
    80009ce8:	01213023          	sd	s2,0(sp)
    80009cec:	02010413          	addi	s0,sp,32
    80009cf0:	00052783          	lw	a5,0(a0)
    80009cf4:	00079a63          	bnez	a5,80009d08 <release+0x30>
    80009cf8:	00002517          	auipc	a0,0x2
    80009cfc:	da850513          	addi	a0,a0,-600 # 8000baa0 <digits+0x28>
    80009d00:	fffff097          	auipc	ra,0xfffff
    80009d04:	1dc080e7          	jalr	476(ra) # 80008edc <panic>
    80009d08:	01053903          	ld	s2,16(a0)
    80009d0c:	00050493          	mv	s1,a0
    80009d10:	fffff097          	auipc	ra,0xfffff
    80009d14:	80c080e7          	jalr	-2036(ra) # 8000851c <mycpu>
    80009d18:	fea910e3          	bne	s2,a0,80009cf8 <release+0x20>
    80009d1c:	0004b823          	sd	zero,16(s1)
    80009d20:	0ff0000f          	fence
    80009d24:	0f50000f          	fence	iorw,ow
    80009d28:	0804a02f          	amoswap.w	zero,zero,(s1)
    80009d2c:	ffffe097          	auipc	ra,0xffffe
    80009d30:	7f0080e7          	jalr	2032(ra) # 8000851c <mycpu>
    80009d34:	100027f3          	csrr	a5,sstatus
    80009d38:	0027f793          	andi	a5,a5,2
    80009d3c:	04079a63          	bnez	a5,80009d90 <release+0xb8>
    80009d40:	07852783          	lw	a5,120(a0)
    80009d44:	02f05e63          	blez	a5,80009d80 <release+0xa8>
    80009d48:	fff7871b          	addiw	a4,a5,-1
    80009d4c:	06e52c23          	sw	a4,120(a0)
    80009d50:	00071c63          	bnez	a4,80009d68 <release+0x90>
    80009d54:	07c52783          	lw	a5,124(a0)
    80009d58:	00078863          	beqz	a5,80009d68 <release+0x90>
    80009d5c:	100027f3          	csrr	a5,sstatus
    80009d60:	0027e793          	ori	a5,a5,2
    80009d64:	10079073          	csrw	sstatus,a5
    80009d68:	01813083          	ld	ra,24(sp)
    80009d6c:	01013403          	ld	s0,16(sp)
    80009d70:	00813483          	ld	s1,8(sp)
    80009d74:	00013903          	ld	s2,0(sp)
    80009d78:	02010113          	addi	sp,sp,32
    80009d7c:	00008067          	ret
    80009d80:	00002517          	auipc	a0,0x2
    80009d84:	d4050513          	addi	a0,a0,-704 # 8000bac0 <digits+0x48>
    80009d88:	fffff097          	auipc	ra,0xfffff
    80009d8c:	154080e7          	jalr	340(ra) # 80008edc <panic>
    80009d90:	00002517          	auipc	a0,0x2
    80009d94:	d1850513          	addi	a0,a0,-744 # 8000baa8 <digits+0x30>
    80009d98:	fffff097          	auipc	ra,0xfffff
    80009d9c:	144080e7          	jalr	324(ra) # 80008edc <panic>

0000000080009da0 <holding>:
    80009da0:	00052783          	lw	a5,0(a0)
    80009da4:	00079663          	bnez	a5,80009db0 <holding+0x10>
    80009da8:	00000513          	li	a0,0
    80009dac:	00008067          	ret
    80009db0:	fe010113          	addi	sp,sp,-32
    80009db4:	00813823          	sd	s0,16(sp)
    80009db8:	00913423          	sd	s1,8(sp)
    80009dbc:	00113c23          	sd	ra,24(sp)
    80009dc0:	02010413          	addi	s0,sp,32
    80009dc4:	01053483          	ld	s1,16(a0)
    80009dc8:	ffffe097          	auipc	ra,0xffffe
    80009dcc:	754080e7          	jalr	1876(ra) # 8000851c <mycpu>
    80009dd0:	01813083          	ld	ra,24(sp)
    80009dd4:	01013403          	ld	s0,16(sp)
    80009dd8:	40a48533          	sub	a0,s1,a0
    80009ddc:	00153513          	seqz	a0,a0
    80009de0:	00813483          	ld	s1,8(sp)
    80009de4:	02010113          	addi	sp,sp,32
    80009de8:	00008067          	ret

0000000080009dec <push_off>:
    80009dec:	fe010113          	addi	sp,sp,-32
    80009df0:	00813823          	sd	s0,16(sp)
    80009df4:	00113c23          	sd	ra,24(sp)
    80009df8:	00913423          	sd	s1,8(sp)
    80009dfc:	02010413          	addi	s0,sp,32
    80009e00:	100024f3          	csrr	s1,sstatus
    80009e04:	100027f3          	csrr	a5,sstatus
    80009e08:	ffd7f793          	andi	a5,a5,-3
    80009e0c:	10079073          	csrw	sstatus,a5
    80009e10:	ffffe097          	auipc	ra,0xffffe
    80009e14:	70c080e7          	jalr	1804(ra) # 8000851c <mycpu>
    80009e18:	07852783          	lw	a5,120(a0)
    80009e1c:	02078663          	beqz	a5,80009e48 <push_off+0x5c>
    80009e20:	ffffe097          	auipc	ra,0xffffe
    80009e24:	6fc080e7          	jalr	1788(ra) # 8000851c <mycpu>
    80009e28:	07852783          	lw	a5,120(a0)
    80009e2c:	01813083          	ld	ra,24(sp)
    80009e30:	01013403          	ld	s0,16(sp)
    80009e34:	0017879b          	addiw	a5,a5,1
    80009e38:	06f52c23          	sw	a5,120(a0)
    80009e3c:	00813483          	ld	s1,8(sp)
    80009e40:	02010113          	addi	sp,sp,32
    80009e44:	00008067          	ret
    80009e48:	0014d493          	srli	s1,s1,0x1
    80009e4c:	ffffe097          	auipc	ra,0xffffe
    80009e50:	6d0080e7          	jalr	1744(ra) # 8000851c <mycpu>
    80009e54:	0014f493          	andi	s1,s1,1
    80009e58:	06952e23          	sw	s1,124(a0)
    80009e5c:	fc5ff06f          	j	80009e20 <push_off+0x34>

0000000080009e60 <pop_off>:
    80009e60:	ff010113          	addi	sp,sp,-16
    80009e64:	00813023          	sd	s0,0(sp)
    80009e68:	00113423          	sd	ra,8(sp)
    80009e6c:	01010413          	addi	s0,sp,16
    80009e70:	ffffe097          	auipc	ra,0xffffe
    80009e74:	6ac080e7          	jalr	1708(ra) # 8000851c <mycpu>
    80009e78:	100027f3          	csrr	a5,sstatus
    80009e7c:	0027f793          	andi	a5,a5,2
    80009e80:	04079663          	bnez	a5,80009ecc <pop_off+0x6c>
    80009e84:	07852783          	lw	a5,120(a0)
    80009e88:	02f05a63          	blez	a5,80009ebc <pop_off+0x5c>
    80009e8c:	fff7871b          	addiw	a4,a5,-1
    80009e90:	06e52c23          	sw	a4,120(a0)
    80009e94:	00071c63          	bnez	a4,80009eac <pop_off+0x4c>
    80009e98:	07c52783          	lw	a5,124(a0)
    80009e9c:	00078863          	beqz	a5,80009eac <pop_off+0x4c>
    80009ea0:	100027f3          	csrr	a5,sstatus
    80009ea4:	0027e793          	ori	a5,a5,2
    80009ea8:	10079073          	csrw	sstatus,a5
    80009eac:	00813083          	ld	ra,8(sp)
    80009eb0:	00013403          	ld	s0,0(sp)
    80009eb4:	01010113          	addi	sp,sp,16
    80009eb8:	00008067          	ret
    80009ebc:	00002517          	auipc	a0,0x2
    80009ec0:	c0450513          	addi	a0,a0,-1020 # 8000bac0 <digits+0x48>
    80009ec4:	fffff097          	auipc	ra,0xfffff
    80009ec8:	018080e7          	jalr	24(ra) # 80008edc <panic>
    80009ecc:	00002517          	auipc	a0,0x2
    80009ed0:	bdc50513          	addi	a0,a0,-1060 # 8000baa8 <digits+0x30>
    80009ed4:	fffff097          	auipc	ra,0xfffff
    80009ed8:	008080e7          	jalr	8(ra) # 80008edc <panic>

0000000080009edc <push_on>:
    80009edc:	fe010113          	addi	sp,sp,-32
    80009ee0:	00813823          	sd	s0,16(sp)
    80009ee4:	00113c23          	sd	ra,24(sp)
    80009ee8:	00913423          	sd	s1,8(sp)
    80009eec:	02010413          	addi	s0,sp,32
    80009ef0:	100024f3          	csrr	s1,sstatus
    80009ef4:	100027f3          	csrr	a5,sstatus
    80009ef8:	0027e793          	ori	a5,a5,2
    80009efc:	10079073          	csrw	sstatus,a5
    80009f00:	ffffe097          	auipc	ra,0xffffe
    80009f04:	61c080e7          	jalr	1564(ra) # 8000851c <mycpu>
    80009f08:	07852783          	lw	a5,120(a0)
    80009f0c:	02078663          	beqz	a5,80009f38 <push_on+0x5c>
    80009f10:	ffffe097          	auipc	ra,0xffffe
    80009f14:	60c080e7          	jalr	1548(ra) # 8000851c <mycpu>
    80009f18:	07852783          	lw	a5,120(a0)
    80009f1c:	01813083          	ld	ra,24(sp)
    80009f20:	01013403          	ld	s0,16(sp)
    80009f24:	0017879b          	addiw	a5,a5,1
    80009f28:	06f52c23          	sw	a5,120(a0)
    80009f2c:	00813483          	ld	s1,8(sp)
    80009f30:	02010113          	addi	sp,sp,32
    80009f34:	00008067          	ret
    80009f38:	0014d493          	srli	s1,s1,0x1
    80009f3c:	ffffe097          	auipc	ra,0xffffe
    80009f40:	5e0080e7          	jalr	1504(ra) # 8000851c <mycpu>
    80009f44:	0014f493          	andi	s1,s1,1
    80009f48:	06952e23          	sw	s1,124(a0)
    80009f4c:	fc5ff06f          	j	80009f10 <push_on+0x34>

0000000080009f50 <pop_on>:
    80009f50:	ff010113          	addi	sp,sp,-16
    80009f54:	00813023          	sd	s0,0(sp)
    80009f58:	00113423          	sd	ra,8(sp)
    80009f5c:	01010413          	addi	s0,sp,16
    80009f60:	ffffe097          	auipc	ra,0xffffe
    80009f64:	5bc080e7          	jalr	1468(ra) # 8000851c <mycpu>
    80009f68:	100027f3          	csrr	a5,sstatus
    80009f6c:	0027f793          	andi	a5,a5,2
    80009f70:	04078463          	beqz	a5,80009fb8 <pop_on+0x68>
    80009f74:	07852783          	lw	a5,120(a0)
    80009f78:	02f05863          	blez	a5,80009fa8 <pop_on+0x58>
    80009f7c:	fff7879b          	addiw	a5,a5,-1
    80009f80:	06f52c23          	sw	a5,120(a0)
    80009f84:	07853783          	ld	a5,120(a0)
    80009f88:	00079863          	bnez	a5,80009f98 <pop_on+0x48>
    80009f8c:	100027f3          	csrr	a5,sstatus
    80009f90:	ffd7f793          	andi	a5,a5,-3
    80009f94:	10079073          	csrw	sstatus,a5
    80009f98:	00813083          	ld	ra,8(sp)
    80009f9c:	00013403          	ld	s0,0(sp)
    80009fa0:	01010113          	addi	sp,sp,16
    80009fa4:	00008067          	ret
    80009fa8:	00002517          	auipc	a0,0x2
    80009fac:	b4050513          	addi	a0,a0,-1216 # 8000bae8 <digits+0x70>
    80009fb0:	fffff097          	auipc	ra,0xfffff
    80009fb4:	f2c080e7          	jalr	-212(ra) # 80008edc <panic>
    80009fb8:	00002517          	auipc	a0,0x2
    80009fbc:	b1050513          	addi	a0,a0,-1264 # 8000bac8 <digits+0x50>
    80009fc0:	fffff097          	auipc	ra,0xfffff
    80009fc4:	f1c080e7          	jalr	-228(ra) # 80008edc <panic>

0000000080009fc8 <__memset>:
    80009fc8:	ff010113          	addi	sp,sp,-16
    80009fcc:	00813423          	sd	s0,8(sp)
    80009fd0:	01010413          	addi	s0,sp,16
    80009fd4:	1a060e63          	beqz	a2,8000a190 <__memset+0x1c8>
    80009fd8:	40a007b3          	neg	a5,a0
    80009fdc:	0077f793          	andi	a5,a5,7
    80009fe0:	00778693          	addi	a3,a5,7
    80009fe4:	00b00813          	li	a6,11
    80009fe8:	0ff5f593          	andi	a1,a1,255
    80009fec:	fff6071b          	addiw	a4,a2,-1
    80009ff0:	1b06e663          	bltu	a3,a6,8000a19c <__memset+0x1d4>
    80009ff4:	1cd76463          	bltu	a4,a3,8000a1bc <__memset+0x1f4>
    80009ff8:	1a078e63          	beqz	a5,8000a1b4 <__memset+0x1ec>
    80009ffc:	00b50023          	sb	a1,0(a0)
    8000a000:	00100713          	li	a4,1
    8000a004:	1ae78463          	beq	a5,a4,8000a1ac <__memset+0x1e4>
    8000a008:	00b500a3          	sb	a1,1(a0)
    8000a00c:	00200713          	li	a4,2
    8000a010:	1ae78a63          	beq	a5,a4,8000a1c4 <__memset+0x1fc>
    8000a014:	00b50123          	sb	a1,2(a0)
    8000a018:	00300713          	li	a4,3
    8000a01c:	18e78463          	beq	a5,a4,8000a1a4 <__memset+0x1dc>
    8000a020:	00b501a3          	sb	a1,3(a0)
    8000a024:	00400713          	li	a4,4
    8000a028:	1ae78263          	beq	a5,a4,8000a1cc <__memset+0x204>
    8000a02c:	00b50223          	sb	a1,4(a0)
    8000a030:	00500713          	li	a4,5
    8000a034:	1ae78063          	beq	a5,a4,8000a1d4 <__memset+0x20c>
    8000a038:	00b502a3          	sb	a1,5(a0)
    8000a03c:	00700713          	li	a4,7
    8000a040:	18e79e63          	bne	a5,a4,8000a1dc <__memset+0x214>
    8000a044:	00b50323          	sb	a1,6(a0)
    8000a048:	00700e93          	li	t4,7
    8000a04c:	00859713          	slli	a4,a1,0x8
    8000a050:	00e5e733          	or	a4,a1,a4
    8000a054:	01059e13          	slli	t3,a1,0x10
    8000a058:	01c76e33          	or	t3,a4,t3
    8000a05c:	01859313          	slli	t1,a1,0x18
    8000a060:	006e6333          	or	t1,t3,t1
    8000a064:	02059893          	slli	a7,a1,0x20
    8000a068:	40f60e3b          	subw	t3,a2,a5
    8000a06c:	011368b3          	or	a7,t1,a7
    8000a070:	02859813          	slli	a6,a1,0x28
    8000a074:	0108e833          	or	a6,a7,a6
    8000a078:	03059693          	slli	a3,a1,0x30
    8000a07c:	003e589b          	srliw	a7,t3,0x3
    8000a080:	00d866b3          	or	a3,a6,a3
    8000a084:	03859713          	slli	a4,a1,0x38
    8000a088:	00389813          	slli	a6,a7,0x3
    8000a08c:	00f507b3          	add	a5,a0,a5
    8000a090:	00e6e733          	or	a4,a3,a4
    8000a094:	000e089b          	sext.w	a7,t3
    8000a098:	00f806b3          	add	a3,a6,a5
    8000a09c:	00e7b023          	sd	a4,0(a5)
    8000a0a0:	00878793          	addi	a5,a5,8
    8000a0a4:	fed79ce3          	bne	a5,a3,8000a09c <__memset+0xd4>
    8000a0a8:	ff8e7793          	andi	a5,t3,-8
    8000a0ac:	0007871b          	sext.w	a4,a5
    8000a0b0:	01d787bb          	addw	a5,a5,t4
    8000a0b4:	0ce88e63          	beq	a7,a4,8000a190 <__memset+0x1c8>
    8000a0b8:	00f50733          	add	a4,a0,a5
    8000a0bc:	00b70023          	sb	a1,0(a4)
    8000a0c0:	0017871b          	addiw	a4,a5,1
    8000a0c4:	0cc77663          	bgeu	a4,a2,8000a190 <__memset+0x1c8>
    8000a0c8:	00e50733          	add	a4,a0,a4
    8000a0cc:	00b70023          	sb	a1,0(a4)
    8000a0d0:	0027871b          	addiw	a4,a5,2
    8000a0d4:	0ac77e63          	bgeu	a4,a2,8000a190 <__memset+0x1c8>
    8000a0d8:	00e50733          	add	a4,a0,a4
    8000a0dc:	00b70023          	sb	a1,0(a4)
    8000a0e0:	0037871b          	addiw	a4,a5,3
    8000a0e4:	0ac77663          	bgeu	a4,a2,8000a190 <__memset+0x1c8>
    8000a0e8:	00e50733          	add	a4,a0,a4
    8000a0ec:	00b70023          	sb	a1,0(a4)
    8000a0f0:	0047871b          	addiw	a4,a5,4
    8000a0f4:	08c77e63          	bgeu	a4,a2,8000a190 <__memset+0x1c8>
    8000a0f8:	00e50733          	add	a4,a0,a4
    8000a0fc:	00b70023          	sb	a1,0(a4)
    8000a100:	0057871b          	addiw	a4,a5,5
    8000a104:	08c77663          	bgeu	a4,a2,8000a190 <__memset+0x1c8>
    8000a108:	00e50733          	add	a4,a0,a4
    8000a10c:	00b70023          	sb	a1,0(a4)
    8000a110:	0067871b          	addiw	a4,a5,6
    8000a114:	06c77e63          	bgeu	a4,a2,8000a190 <__memset+0x1c8>
    8000a118:	00e50733          	add	a4,a0,a4
    8000a11c:	00b70023          	sb	a1,0(a4)
    8000a120:	0077871b          	addiw	a4,a5,7
    8000a124:	06c77663          	bgeu	a4,a2,8000a190 <__memset+0x1c8>
    8000a128:	00e50733          	add	a4,a0,a4
    8000a12c:	00b70023          	sb	a1,0(a4)
    8000a130:	0087871b          	addiw	a4,a5,8
    8000a134:	04c77e63          	bgeu	a4,a2,8000a190 <__memset+0x1c8>
    8000a138:	00e50733          	add	a4,a0,a4
    8000a13c:	00b70023          	sb	a1,0(a4)
    8000a140:	0097871b          	addiw	a4,a5,9
    8000a144:	04c77663          	bgeu	a4,a2,8000a190 <__memset+0x1c8>
    8000a148:	00e50733          	add	a4,a0,a4
    8000a14c:	00b70023          	sb	a1,0(a4)
    8000a150:	00a7871b          	addiw	a4,a5,10
    8000a154:	02c77e63          	bgeu	a4,a2,8000a190 <__memset+0x1c8>
    8000a158:	00e50733          	add	a4,a0,a4
    8000a15c:	00b70023          	sb	a1,0(a4)
    8000a160:	00b7871b          	addiw	a4,a5,11
    8000a164:	02c77663          	bgeu	a4,a2,8000a190 <__memset+0x1c8>
    8000a168:	00e50733          	add	a4,a0,a4
    8000a16c:	00b70023          	sb	a1,0(a4)
    8000a170:	00c7871b          	addiw	a4,a5,12
    8000a174:	00c77e63          	bgeu	a4,a2,8000a190 <__memset+0x1c8>
    8000a178:	00e50733          	add	a4,a0,a4
    8000a17c:	00b70023          	sb	a1,0(a4)
    8000a180:	00d7879b          	addiw	a5,a5,13
    8000a184:	00c7f663          	bgeu	a5,a2,8000a190 <__memset+0x1c8>
    8000a188:	00f507b3          	add	a5,a0,a5
    8000a18c:	00b78023          	sb	a1,0(a5)
    8000a190:	00813403          	ld	s0,8(sp)
    8000a194:	01010113          	addi	sp,sp,16
    8000a198:	00008067          	ret
    8000a19c:	00b00693          	li	a3,11
    8000a1a0:	e55ff06f          	j	80009ff4 <__memset+0x2c>
    8000a1a4:	00300e93          	li	t4,3
    8000a1a8:	ea5ff06f          	j	8000a04c <__memset+0x84>
    8000a1ac:	00100e93          	li	t4,1
    8000a1b0:	e9dff06f          	j	8000a04c <__memset+0x84>
    8000a1b4:	00000e93          	li	t4,0
    8000a1b8:	e95ff06f          	j	8000a04c <__memset+0x84>
    8000a1bc:	00000793          	li	a5,0
    8000a1c0:	ef9ff06f          	j	8000a0b8 <__memset+0xf0>
    8000a1c4:	00200e93          	li	t4,2
    8000a1c8:	e85ff06f          	j	8000a04c <__memset+0x84>
    8000a1cc:	00400e93          	li	t4,4
    8000a1d0:	e7dff06f          	j	8000a04c <__memset+0x84>
    8000a1d4:	00500e93          	li	t4,5
    8000a1d8:	e75ff06f          	j	8000a04c <__memset+0x84>
    8000a1dc:	00600e93          	li	t4,6
    8000a1e0:	e6dff06f          	j	8000a04c <__memset+0x84>

000000008000a1e4 <__memmove>:
    8000a1e4:	ff010113          	addi	sp,sp,-16
    8000a1e8:	00813423          	sd	s0,8(sp)
    8000a1ec:	01010413          	addi	s0,sp,16
    8000a1f0:	0e060863          	beqz	a2,8000a2e0 <__memmove+0xfc>
    8000a1f4:	fff6069b          	addiw	a3,a2,-1
    8000a1f8:	0006881b          	sext.w	a6,a3
    8000a1fc:	0ea5e863          	bltu	a1,a0,8000a2ec <__memmove+0x108>
    8000a200:	00758713          	addi	a4,a1,7
    8000a204:	00a5e7b3          	or	a5,a1,a0
    8000a208:	40a70733          	sub	a4,a4,a0
    8000a20c:	0077f793          	andi	a5,a5,7
    8000a210:	00f73713          	sltiu	a4,a4,15
    8000a214:	00174713          	xori	a4,a4,1
    8000a218:	0017b793          	seqz	a5,a5
    8000a21c:	00e7f7b3          	and	a5,a5,a4
    8000a220:	10078863          	beqz	a5,8000a330 <__memmove+0x14c>
    8000a224:	00900793          	li	a5,9
    8000a228:	1107f463          	bgeu	a5,a6,8000a330 <__memmove+0x14c>
    8000a22c:	0036581b          	srliw	a6,a2,0x3
    8000a230:	fff8081b          	addiw	a6,a6,-1
    8000a234:	02081813          	slli	a6,a6,0x20
    8000a238:	01d85893          	srli	a7,a6,0x1d
    8000a23c:	00858813          	addi	a6,a1,8
    8000a240:	00058793          	mv	a5,a1
    8000a244:	00050713          	mv	a4,a0
    8000a248:	01088833          	add	a6,a7,a6
    8000a24c:	0007b883          	ld	a7,0(a5)
    8000a250:	00878793          	addi	a5,a5,8
    8000a254:	00870713          	addi	a4,a4,8
    8000a258:	ff173c23          	sd	a7,-8(a4)
    8000a25c:	ff0798e3          	bne	a5,a6,8000a24c <__memmove+0x68>
    8000a260:	ff867713          	andi	a4,a2,-8
    8000a264:	02071793          	slli	a5,a4,0x20
    8000a268:	0207d793          	srli	a5,a5,0x20
    8000a26c:	00f585b3          	add	a1,a1,a5
    8000a270:	40e686bb          	subw	a3,a3,a4
    8000a274:	00f507b3          	add	a5,a0,a5
    8000a278:	06e60463          	beq	a2,a4,8000a2e0 <__memmove+0xfc>
    8000a27c:	0005c703          	lbu	a4,0(a1)
    8000a280:	00e78023          	sb	a4,0(a5)
    8000a284:	04068e63          	beqz	a3,8000a2e0 <__memmove+0xfc>
    8000a288:	0015c603          	lbu	a2,1(a1)
    8000a28c:	00100713          	li	a4,1
    8000a290:	00c780a3          	sb	a2,1(a5)
    8000a294:	04e68663          	beq	a3,a4,8000a2e0 <__memmove+0xfc>
    8000a298:	0025c603          	lbu	a2,2(a1)
    8000a29c:	00200713          	li	a4,2
    8000a2a0:	00c78123          	sb	a2,2(a5)
    8000a2a4:	02e68e63          	beq	a3,a4,8000a2e0 <__memmove+0xfc>
    8000a2a8:	0035c603          	lbu	a2,3(a1)
    8000a2ac:	00300713          	li	a4,3
    8000a2b0:	00c781a3          	sb	a2,3(a5)
    8000a2b4:	02e68663          	beq	a3,a4,8000a2e0 <__memmove+0xfc>
    8000a2b8:	0045c603          	lbu	a2,4(a1)
    8000a2bc:	00400713          	li	a4,4
    8000a2c0:	00c78223          	sb	a2,4(a5)
    8000a2c4:	00e68e63          	beq	a3,a4,8000a2e0 <__memmove+0xfc>
    8000a2c8:	0055c603          	lbu	a2,5(a1)
    8000a2cc:	00500713          	li	a4,5
    8000a2d0:	00c782a3          	sb	a2,5(a5)
    8000a2d4:	00e68663          	beq	a3,a4,8000a2e0 <__memmove+0xfc>
    8000a2d8:	0065c703          	lbu	a4,6(a1)
    8000a2dc:	00e78323          	sb	a4,6(a5)
    8000a2e0:	00813403          	ld	s0,8(sp)
    8000a2e4:	01010113          	addi	sp,sp,16
    8000a2e8:	00008067          	ret
    8000a2ec:	02061713          	slli	a4,a2,0x20
    8000a2f0:	02075713          	srli	a4,a4,0x20
    8000a2f4:	00e587b3          	add	a5,a1,a4
    8000a2f8:	f0f574e3          	bgeu	a0,a5,8000a200 <__memmove+0x1c>
    8000a2fc:	02069613          	slli	a2,a3,0x20
    8000a300:	02065613          	srli	a2,a2,0x20
    8000a304:	fff64613          	not	a2,a2
    8000a308:	00e50733          	add	a4,a0,a4
    8000a30c:	00c78633          	add	a2,a5,a2
    8000a310:	fff7c683          	lbu	a3,-1(a5)
    8000a314:	fff78793          	addi	a5,a5,-1
    8000a318:	fff70713          	addi	a4,a4,-1
    8000a31c:	00d70023          	sb	a3,0(a4)
    8000a320:	fec798e3          	bne	a5,a2,8000a310 <__memmove+0x12c>
    8000a324:	00813403          	ld	s0,8(sp)
    8000a328:	01010113          	addi	sp,sp,16
    8000a32c:	00008067          	ret
    8000a330:	02069713          	slli	a4,a3,0x20
    8000a334:	02075713          	srli	a4,a4,0x20
    8000a338:	00170713          	addi	a4,a4,1
    8000a33c:	00e50733          	add	a4,a0,a4
    8000a340:	00050793          	mv	a5,a0
    8000a344:	0005c683          	lbu	a3,0(a1)
    8000a348:	00178793          	addi	a5,a5,1
    8000a34c:	00158593          	addi	a1,a1,1
    8000a350:	fed78fa3          	sb	a3,-1(a5)
    8000a354:	fee798e3          	bne	a5,a4,8000a344 <__memmove+0x160>
    8000a358:	f89ff06f          	j	8000a2e0 <__memmove+0xfc>
	...
