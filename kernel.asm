
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
    8000001c:	1ac080ef          	jal	ra,800081c8 <start>

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
    8000107c:	779020ef          	jal	ra,80003ff4 <exceptionHandler>


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
    80001704:	e14080e7          	jalr	-492(ra) # 80003514 <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    80001708:	0004b503          	ld	a0,0(s1)
    8000170c:	00003097          	auipc	ra,0x3
    80001710:	004080e7          	jalr	4(ra) # 80004710 <_ZN9Scheduler3putEP7_thread>
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
    800017c0:	d58080e7          	jalr	-680(ra) # 80003514 <_ZN7_thread11setSleepingEb>
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
    80001b28:	9c4080e7          	jalr	-1596(ra) # 800034e8 <_ZN7_thread9setClosedEb>
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
    80001bd4:	8e8080e7          	jalr	-1816(ra) # 800034b8 <_ZN7_thread10setBlockedEb>
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
    80001c48:	874080e7          	jalr	-1932(ra) # 800034b8 <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    80001c4c:	00048513          	mv	a0,s1
    80001c50:	00000097          	auipc	ra,0x0
    80001c54:	c10080e7          	jalr	-1008(ra) # 80001860 <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    80001c58:	0004b503          	ld	a0,0(s1)
    80001c5c:	00003097          	auipc	ra,0x3
    80001c60:	ab4080e7          	jalr	-1356(ra) # 80004710 <_ZN9Scheduler3putEP7_thread>
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
    80001cb4:	ac8080e7          	jalr	-1336(ra) # 80002778 <_ZN6KernelC1Ev>
    kernel.initialise();
    80001cb8:	00048513          	mv	a0,s1
    80001cbc:	00001097          	auipc	ra,0x1
    80001cc0:	b60080e7          	jalr	-1184(ra) # 8000281c <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    80001cc4:	00048513          	mv	a0,s1
    80001cc8:	00001097          	auipc	ra,0x1
    80001ccc:	bdc080e7          	jalr	-1060(ra) # 800028a4 <_ZN6Kernel3runEv>
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
    80001f50:	6ec080e7          	jalr	1772(ra) # 80002638 <_ZN7Console13outputHandlerEv>
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
    80002014:	6dc080e7          	jalr	1756(ra) # 800036ec <_ZN11HeapManagerD1Ev>
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
    assert(false);
    800025d8:	00009697          	auipc	a3,0x9
    800025dc:	b4868693          	addi	a3,a3,-1208 # 8000b120 <CONSOLE_STATUS+0x110>
    800025e0:	03e00613          	li	a2,62
    800025e4:	00009597          	auipc	a1,0x9
    800025e8:	b0458593          	addi	a1,a1,-1276 # 8000b0e8 <CONSOLE_STATUS+0xd8>
    800025ec:	00009517          	auipc	a0,0x9
    800025f0:	b5450513          	addi	a0,a0,-1196 # 8000b140 <CONSOLE_STATUS+0x130>
    800025f4:	00000097          	auipc	ra,0x0
    800025f8:	a38080e7          	jalr	-1480(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    sem_wait(instance->inSem);
    800025fc:	0000c497          	auipc	s1,0xc
    80002600:	97c48493          	addi	s1,s1,-1668 # 8000df78 <_ZN7Console8instanceE>
    80002604:	0004b783          	ld	a5,0(s1)
    80002608:	0007b503          	ld	a0,0(a5)
    8000260c:	fffff097          	auipc	ra,0xfffff
    80002610:	3f0080e7          	jalr	1008(ra) # 800019fc <_Z8sem_waitP4_sem>
    return instance->inBuffer.get();
    80002614:	0004b503          	ld	a0,0(s1)
    80002618:	00850513          	addi	a0,a0,8
    8000261c:	00000097          	auipc	ra,0x0
    80002620:	ecc080e7          	jalr	-308(ra) # 800024e8 <_ZN7Console13consoleBuffer3getEv>
}
    80002624:	01813083          	ld	ra,24(sp)
    80002628:	01013403          	ld	s0,16(sp)
    8000262c:	00813483          	ld	s1,8(sp)
    80002630:	02010113          	addi	sp,sp,32
    80002634:	00008067          	ret

0000000080002638 <_ZN7Console13outputHandlerEv>:

void Console::outputHandler(){
    80002638:	fe010113          	addi	sp,sp,-32
    8000263c:	00113c23          	sd	ra,24(sp)
    80002640:	00813823          	sd	s0,16(sp)
    80002644:	00913423          	sd	s1,8(sp)
    80002648:	01213023          	sd	s2,0(sp)
    8000264c:	02010413          	addi	s0,sp,32
    while(!instance->outBuffer.isEmpty()){
    80002650:	0000c517          	auipc	a0,0xc
    80002654:	92853503          	ld	a0,-1752(a0) # 8000df78 <_ZN7Console8instanceE>
    80002658:	000017b7          	lui	a5,0x1
    8000265c:	02078793          	addi	a5,a5,32 # 1020 <_entry-0x7fffefe0>
    80002660:	00f50533          	add	a0,a0,a5
    80002664:	00000097          	auipc	ra,0x0
    80002668:	ecc080e7          	jalr	-308(ra) # 80002530 <_ZN7Console13consoleBuffer7isEmptyEv>
    8000266c:	06051063          	bnez	a0,800026cc <_ZN7Console13outputHandlerEv+0x94>
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
    80002670:	0000c797          	auipc	a5,0xc
    80002674:	8787b783          	ld	a5,-1928(a5) # 8000dee8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002678:	0007b783          	ld	a5,0(a5)
    8000267c:	0007c783          	lbu	a5,0(a5)
    80002680:	0207f793          	andi	a5,a5,32
    80002684:	fc0786e3          	beqz	a5,80002650 <_ZN7Console13outputHandlerEv+0x18>
    80002688:	0000c497          	auipc	s1,0xc
    8000268c:	8f04b483          	ld	s1,-1808(s1) # 8000df78 <_ZN7Console8instanceE>
    80002690:	000017b7          	lui	a5,0x1
    80002694:	02078793          	addi	a5,a5,32 # 1020 <_entry-0x7fffefe0>
    80002698:	00f484b3          	add	s1,s1,a5
    8000269c:	00048513          	mv	a0,s1
    800026a0:	00000097          	auipc	ra,0x0
    800026a4:	e90080e7          	jalr	-368(ra) # 80002530 <_ZN7Console13consoleBuffer7isEmptyEv>
    800026a8:	fa0514e3          	bnez	a0,80002650 <_ZN7Console13outputHandlerEv+0x18>
            (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
    800026ac:	0000c797          	auipc	a5,0xc
    800026b0:	8547b783          	ld	a5,-1964(a5) # 8000df00 <_GLOBAL_OFFSET_TABLE_+0x28>
    800026b4:	0007b903          	ld	s2,0(a5)
    800026b8:	00048513          	mv	a0,s1
    800026bc:	00000097          	auipc	ra,0x0
    800026c0:	e2c080e7          	jalr	-468(ra) # 800024e8 <_ZN7Console13consoleBuffer3getEv>
    800026c4:	00a90023          	sb	a0,0(s2)
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
    800026c8:	fa9ff06f          	j	80002670 <_ZN7Console13outputHandlerEv+0x38>
        }
    }
}
    800026cc:	01813083          	ld	ra,24(sp)
    800026d0:	01013403          	ld	s0,16(sp)
    800026d4:	00813483          	ld	s1,8(sp)
    800026d8:	00013903          	ld	s2,0(sp)
    800026dc:	02010113          	addi	sp,sp,32
    800026e0:	00008067          	ret

00000000800026e4 <_ZN7Console12inputHandlerEv>:

void Console::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    800026e4:	0000c797          	auipc	a5,0xc
    800026e8:	8047b783          	ld	a5,-2044(a5) # 8000dee8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800026ec:	0007b783          	ld	a5,0(a5)
    800026f0:	0007c783          	lbu	a5,0(a5)
    800026f4:	0017f793          	andi	a5,a5,1
    800026f8:	06078e63          	beqz	a5,80002774 <_ZN7Console12inputHandlerEv+0x90>
void Console::inputHandler(){
    800026fc:	fe010113          	addi	sp,sp,-32
    80002700:	00113c23          	sd	ra,24(sp)
    80002704:	00813823          	sd	s0,16(sp)
    80002708:	00913423          	sd	s1,8(sp)
    8000270c:	02010413          	addi	s0,sp,32
        char ch =(*(char*)CONSOLE_RX_DATA);
    80002710:	0000b797          	auipc	a5,0xb
    80002714:	7d07b783          	ld	a5,2000(a5) # 8000dee0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002718:	0007b783          	ld	a5,0(a5)
        instance->inBuffer.put(ch);
    8000271c:	0000c497          	auipc	s1,0xc
    80002720:	85c48493          	addi	s1,s1,-1956 # 8000df78 <_ZN7Console8instanceE>
    80002724:	0004b503          	ld	a0,0(s1)
    80002728:	0007c583          	lbu	a1,0(a5)
    8000272c:	00850513          	addi	a0,a0,8
    80002730:	00000097          	auipc	ra,0x0
    80002734:	d70080e7          	jalr	-656(ra) # 800024a0 <_ZN7Console13consoleBuffer3putEc>
        sem_signal(instance->inSem);
    80002738:	0004b783          	ld	a5,0(s1)
    8000273c:	0007b503          	ld	a0,0(a5)
    80002740:	fffff097          	auipc	ra,0xfffff
    80002744:	2e8080e7          	jalr	744(ra) # 80001a28 <_Z10sem_signalP4_sem>
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80002748:	0000b797          	auipc	a5,0xb
    8000274c:	7a07b783          	ld	a5,1952(a5) # 8000dee8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002750:	0007b783          	ld	a5,0(a5)
    80002754:	0007c783          	lbu	a5,0(a5)
    80002758:	0017f793          	andi	a5,a5,1
    8000275c:	fa079ae3          	bnez	a5,80002710 <_ZN7Console12inputHandlerEv+0x2c>
    }
    80002760:	01813083          	ld	ra,24(sp)
    80002764:	01013403          	ld	s0,16(sp)
    80002768:	00813483          	ld	s1,8(sp)
    8000276c:	02010113          	addi	sp,sp,32
    80002770:	00008067          	ret
    80002774:	00008067          	ret

0000000080002778 <_ZN6KernelC1Ev>:
#include "../test_h/userMain.h"


extern "C" void trap();

Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80002778:	fd010113          	addi	sp,sp,-48
    8000277c:	02113423          	sd	ra,40(sp)
    80002780:	02813023          	sd	s0,32(sp)
    80002784:	00913c23          	sd	s1,24(sp)
    80002788:	01213823          	sd	s2,16(sp)
    8000278c:	01313423          	sd	s3,8(sp)
    80002790:	03010413          	addi	s0,sp,48
    80002794:	00050493          	mv	s1,a0
    80002798:	00001097          	auipc	ra,0x1
    8000279c:	eec080e7          	jalr	-276(ra) # 80003684 <_ZN11HeapManagerC1Ev>
    800027a0:	00848513          	addi	a0,s1,8
    800027a4:	00002097          	auipc	ra,0x2
    800027a8:	ed4080e7          	jalr	-300(ra) # 80004678 <_ZN9SchedulerC1Ev>
    800027ac:	01848913          	addi	s2,s1,24
    800027b0:	00090513          	mv	a0,s2
    800027b4:	fffff097          	auipc	ra,0xfffff
    800027b8:	dd0080e7          	jalr	-560(ra) # 80001584 <_ZN5TimerC1Ev>
    800027bc:	02848513          	addi	a0,s1,40
    800027c0:	00000097          	auipc	ra,0x0
    800027c4:	b98080e7          	jalr	-1128(ra) # 80002358 <_ZN7ConsoleC1Ev>
    800027c8:	0380006f          	j	80002800 <_ZN6KernelC1Ev+0x88>
    800027cc:	00050993          	mv	s3,a0
    800027d0:	00090513          	mv	a0,s2
    800027d4:	fffff097          	auipc	ra,0xfffff
    800027d8:	e20080e7          	jalr	-480(ra) # 800015f4 <_ZN5TimerD1Ev>
    800027dc:	00098913          	mv	s2,s3
    800027e0:	00048513          	mv	a0,s1
    800027e4:	00001097          	auipc	ra,0x1
    800027e8:	f08080e7          	jalr	-248(ra) # 800036ec <_ZN11HeapManagerD1Ev>
    800027ec:	00090513          	mv	a0,s2
    800027f0:	0000d097          	auipc	ra,0xd
    800027f4:	8d8080e7          	jalr	-1832(ra) # 8000f0c8 <_Unwind_Resume>
    800027f8:	00050913          	mv	s2,a0
    800027fc:	fe5ff06f          	j	800027e0 <_ZN6KernelC1Ev+0x68>
    80002800:	02813083          	ld	ra,40(sp)
    80002804:	02013403          	ld	s0,32(sp)
    80002808:	01813483          	ld	s1,24(sp)
    8000280c:	01013903          	ld	s2,16(sp)
    80002810:	00813983          	ld	s3,8(sp)
    80002814:	03010113          	addi	sp,sp,48
    80002818:	00008067          	ret

000000008000281c <_ZN6Kernel10initialiseEv>:
 
void Kernel::initialise(){
    8000281c:	ff010113          	addi	sp,sp,-16
    80002820:	00113423          	sd	ra,8(sp)
    80002824:	00813023          	sd	s0,0(sp)
    80002828:	01010413          	addi	s0,sp,16
    /// set the trap vector
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    8000282c:	0000b797          	auipc	a5,0xb
    80002830:	6ec7b783          	ld	a5,1772(a5) # 8000df18 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002834:	10579073          	csrw	stvec,a5

    
    /// initialise the heap manager
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );
    80002838:	0000b797          	auipc	a5,0xb
    8000283c:	6e87b783          	ld	a5,1768(a5) # 8000df20 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002840:	0007b603          	ld	a2,0(a5)
    80002844:	0000b797          	auipc	a5,0xb
    80002848:	6ac7b783          	ld	a5,1708(a5) # 8000def0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000284c:	0007b583          	ld	a1,0(a5)
    80002850:	00001097          	auipc	ra,0x1
    80002854:	eb4080e7          	jalr	-332(ra) # 80003704 <_ZN11HeapManager4initEmm>
    console.getInstance().init();
    80002858:	00000097          	auipc	ra,0x0
    8000285c:	be4080e7          	jalr	-1052(ra) # 8000243c <_ZN7Console11getInstanceEv>
    80002860:	00000097          	auipc	ra,0x0
    80002864:	bb0080e7          	jalr	-1104(ra) # 80002410 <_ZN7Console4initEv>
    return;
}
    80002868:	00813083          	ld	ra,8(sp)
    8000286c:	00013403          	ld	s0,0(sp)
    80002870:	01010113          	addi	sp,sp,16
    80002874:	00008067          	ret

0000000080002878 <_Z4testPv>:

void test(void* arg){
    80002878:	ff010113          	addi	sp,sp,-16
    8000287c:	00113423          	sd	ra,8(sp)
    80002880:	00813023          	sd	s0,0(sp)
    80002884:	01010413          	addi	s0,sp,16
    // userMain();
    usermain(0);
    80002888:	00000513          	li	a0,0
    8000288c:	00000097          	auipc	ra,0x0
    80002890:	5a0080e7          	jalr	1440(ra) # 80002e2c <_Z8usermainPv>
}
    80002894:	00813083          	ld	ra,8(sp)
    80002898:	00013403          	ld	s0,0(sp)
    8000289c:	01010113          	addi	sp,sp,16
    800028a0:	00008067          	ret

00000000800028a4 <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    800028a4:	fe010113          	addi	sp,sp,-32
    800028a8:	00113c23          	sd	ra,24(sp)
    800028ac:	00813823          	sd	s0,16(sp)
    800028b0:	02010413          	addi	s0,sp,32

    thread_t kernelThread;
    
    thread_create(&kernelThread, 0, 0);
    800028b4:	00000613          	li	a2,0
    800028b8:	00000593          	li	a1,0
    800028bc:	fe840513          	addi	a0,s0,-24
    800028c0:	fffff097          	auipc	ra,0xfffff
    800028c4:	fcc080e7          	jalr	-52(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    800028c8:	00002097          	auipc	ra,0x2
    800028cc:	038080e7          	jalr	56(ra) # 80004900 <_ZN9Scheduler3getEv>
    800028d0:	0000b797          	auipc	a5,0xb
    800028d4:	6587b783          	ld	a5,1624(a5) # 8000df28 <_GLOBAL_OFFSET_TABLE_+0x50>
    800028d8:	00a7b023          	sd	a0,0(a5)
    
    /// change to user mode
    __asm__ volatile ("li a0, 0xff");
    800028dc:	0ff00513          	li	a0,255
    __asm__ volatile ("ecall");
    800028e0:	00000073          	ecall
    /// NOW WE ARE IN USER MODE
    
    thread_t userThread;
    // thread_create(&userThread, test, 0);
    thread_create(&userThread, usermain, 0);
    800028e4:	00000613          	li	a2,0
    800028e8:	0000b597          	auipc	a1,0xb
    800028ec:	6105b583          	ld	a1,1552(a1) # 8000def8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800028f0:	fe040513          	addi	a0,s0,-32
    800028f4:	fffff097          	auipc	ra,0xfffff
    800028f8:	f98080e7          	jalr	-104(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    do{
        Console::outputHandler();
    800028fc:	00000097          	auipc	ra,0x0
    80002900:	d3c080e7          	jalr	-708(ra) # 80002638 <_ZN7Console13outputHandlerEv>
        thread_dispatch();
    80002904:	fffff097          	auipc	ra,0xfffff
    80002908:	024080e7          	jalr	36(ra) # 80001928 <_Z15thread_dispatchv>
    }while(!(Scheduler::isEmpty() && Timer::getInstance().noSleepingThreads()));
    8000290c:	00002097          	auipc	ra,0x2
    80002910:	ddc080e7          	jalr	-548(ra) # 800046e8 <_ZN9Scheduler7isEmptyEv>
    80002914:	fe0504e3          	beqz	a0,800028fc <_ZN6Kernel3runEv+0x58>
    80002918:	fffff097          	auipc	ra,0xfffff
    8000291c:	d24080e7          	jalr	-732(ra) # 8000163c <_ZN5Timer11getInstanceEv>
    80002920:	fffff097          	auipc	ra,0xfffff
    80002924:	ed4080e7          	jalr	-300(ra) # 800017f4 <_ZN5Timer17noSleepingThreadsEv>
    80002928:	fc050ae3          	beqz	a0,800028fc <_ZN6Kernel3runEv+0x58>

    return EXIT_SUCCESS;
}
    8000292c:	00000513          	li	a0,0
    80002930:	01813083          	ld	ra,24(sp)
    80002934:	01013403          	ld	s0,16(sp)
    80002938:	02010113          	addi	sp,sp,32
    8000293c:	00008067          	ret

0000000080002940 <_Z13thread_test_1Pv>:
#include "assert.h"

sem_t sem1;
sem_t sem2;

void thread_test_1(void* args){
    80002940:	ff010113          	addi	sp,sp,-16
    80002944:	00113423          	sd	ra,8(sp)
    80002948:	00813023          	sd	s0,0(sp)
    8000294c:	01010413          	addi	s0,sp,16
    putc('1');
    80002950:	03100513          	li	a0,49
    80002954:	fffff097          	auipc	ra,0xfffff
    80002958:	128080e7          	jalr	296(ra) # 80001a7c <_Z4putcc>
    putc('s');
    8000295c:	07300513          	li	a0,115
    80002960:	fffff097          	auipc	ra,0xfffff
    80002964:	11c080e7          	jalr	284(ra) # 80001a7c <_Z4putcc>
    time_sleep(30);
    80002968:	01e00513          	li	a0,30
    8000296c:	fffff097          	auipc	ra,0xfffff
    80002970:	000080e7          	jalr	ra # 8000196c <_Z10time_sleepm>
    putc('1');
    80002974:	03100513          	li	a0,49
    80002978:	fffff097          	auipc	ra,0xfffff
    8000297c:	104080e7          	jalr	260(ra) # 80001a7c <_Z4putcc>
    sem_signal(sem1);
    80002980:	0000b517          	auipc	a0,0xb
    80002984:	60053503          	ld	a0,1536(a0) # 8000df80 <sem1>
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	0a0080e7          	jalr	160(ra) # 80001a28 <_Z10sem_signalP4_sem>
    putc('S');
    80002990:	05300513          	li	a0,83
    80002994:	fffff097          	auipc	ra,0xfffff
    80002998:	0e8080e7          	jalr	232(ra) # 80001a7c <_Z4putcc>
}
    8000299c:	00813083          	ld	ra,8(sp)
    800029a0:	00013403          	ld	s0,0(sp)
    800029a4:	01010113          	addi	sp,sp,16
    800029a8:	00008067          	ret

00000000800029ac <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    800029ac:	ff010113          	addi	sp,sp,-16
    800029b0:	00113423          	sd	ra,8(sp)
    800029b4:	00813023          	sd	s0,0(sp)
    800029b8:	01010413          	addi	s0,sp,16
    putc('2');
    800029bc:	03200513          	li	a0,50
    800029c0:	fffff097          	auipc	ra,0xfffff
    800029c4:	0bc080e7          	jalr	188(ra) # 80001a7c <_Z4putcc>
    putc('s');
    800029c8:	07300513          	li	a0,115
    800029cc:	fffff097          	auipc	ra,0xfffff
    800029d0:	0b0080e7          	jalr	176(ra) # 80001a7c <_Z4putcc>
    time_sleep(60);
    800029d4:	03c00513          	li	a0,60
    800029d8:	fffff097          	auipc	ra,0xfffff
    800029dc:	f94080e7          	jalr	-108(ra) # 8000196c <_Z10time_sleepm>
    putc('2');
    800029e0:	03200513          	li	a0,50
    800029e4:	fffff097          	auipc	ra,0xfffff
    800029e8:	098080e7          	jalr	152(ra) # 80001a7c <_Z4putcc>
    putc('S');
    800029ec:	05300513          	li	a0,83
    800029f0:	fffff097          	auipc	ra,0xfffff
    800029f4:	08c080e7          	jalr	140(ra) # 80001a7c <_Z4putcc>
    sem_signal(sem2);
    800029f8:	0000b517          	auipc	a0,0xb
    800029fc:	59053503          	ld	a0,1424(a0) # 8000df88 <sem2>
    80002a00:	fffff097          	auipc	ra,0xfffff
    80002a04:	028080e7          	jalr	40(ra) # 80001a28 <_Z10sem_signalP4_sem>
    for(int i = 0; i < 1 << 20; i++){
    80002a08:	00000793          	li	a5,0
    80002a0c:	00100737          	lui	a4,0x100
    80002a10:	00e7d863          	bge	a5,a4,80002a20 <_Z13thread_test_2Pv+0x74>
        __asm__ volatile("nop");
    80002a14:	00000013          	nop
    for(int i = 0; i < 1 << 20; i++){
    80002a18:	0017879b          	addiw	a5,a5,1
    80002a1c:	ff1ff06f          	j	80002a0c <_Z13thread_test_2Pv+0x60>
    }
}
    80002a20:	00813083          	ld	ra,8(sp)
    80002a24:	00013403          	ld	s0,0(sp)
    80002a28:	01010113          	addi	sp,sp,16
    80002a2c:	00008067          	ret

0000000080002a30 <_Z7memTestv>:

void memTest(){
    80002a30:	fd010113          	addi	sp,sp,-48
    80002a34:	02113423          	sd	ra,40(sp)
    80002a38:	02813023          	sd	s0,32(sp)
    80002a3c:	00913c23          	sd	s1,24(sp)
    80002a40:	01213823          	sd	s2,16(sp)
    80002a44:	01313423          	sd	s3,8(sp)
    80002a48:	01413023          	sd	s4,0(sp)
    80002a4c:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002a50:	0000b797          	auipc	a5,0xb
    80002a54:	4b87b783          	ld	a5,1208(a5) # 8000df08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002a58:	0007b503          	ld	a0,0(a5)
    80002a5c:	00001097          	auipc	ra,0x1
    80002a60:	dcc080e7          	jalr	-564(ra) # 80003828 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002a64:	00050993          	mv	s3,a0
    putc('F');
    80002a68:	04600513          	li	a0,70
    80002a6c:	fffff097          	auipc	ra,0xfffff
    80002a70:	010080e7          	jalr	16(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002a74:	07200513          	li	a0,114
    80002a78:	fffff097          	auipc	ra,0xfffff
    80002a7c:	004080e7          	jalr	4(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002a80:	06500513          	li	a0,101
    80002a84:	fffff097          	auipc	ra,0xfffff
    80002a88:	ff8080e7          	jalr	-8(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002a8c:	06500513          	li	a0,101
    80002a90:	fffff097          	auipc	ra,0xfffff
    80002a94:	fec080e7          	jalr	-20(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    80002a98:	02000513          	li	a0,32
    80002a9c:	fffff097          	auipc	ra,0xfffff
    80002aa0:	fe0080e7          	jalr	-32(ra) # 80001a7c <_Z4putcc>
    putc('m');
    80002aa4:	06d00513          	li	a0,109
    80002aa8:	fffff097          	auipc	ra,0xfffff
    80002aac:	fd4080e7          	jalr	-44(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002ab0:	06500513          	li	a0,101
    80002ab4:	fffff097          	auipc	ra,0xfffff
    80002ab8:	fc8080e7          	jalr	-56(ra) # 80001a7c <_Z4putcc>
    putc('m');
    80002abc:	06d00513          	li	a0,109
    80002ac0:	fffff097          	auipc	ra,0xfffff
    80002ac4:	fbc080e7          	jalr	-68(ra) # 80001a7c <_Z4putcc>
    putc('o');
    80002ac8:	06f00513          	li	a0,111
    80002acc:	fffff097          	auipc	ra,0xfffff
    80002ad0:	fb0080e7          	jalr	-80(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002ad4:	07200513          	li	a0,114
    80002ad8:	fffff097          	auipc	ra,0xfffff
    80002adc:	fa4080e7          	jalr	-92(ra) # 80001a7c <_Z4putcc>
    putc('y');
    80002ae0:	07900513          	li	a0,121
    80002ae4:	fffff097          	auipc	ra,0xfffff
    80002ae8:	f98080e7          	jalr	-104(ra) # 80001a7c <_Z4putcc>
    putc(':');
    80002aec:	03a00513          	li	a0,58
    80002af0:	fffff097          	auipc	ra,0xfffff
    80002af4:	f8c080e7          	jalr	-116(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002af8:	00f00493          	li	s1,15
    80002afc:	0140006f          	j	80002b10 <_Z7memTestv+0xe0>
        int digit = (freeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002b00:	05750513          	addi	a0,a0,87
    80002b04:	fffff097          	auipc	ra,0xfffff
    80002b08:	f78080e7          	jalr	-136(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002b0c:	fff4849b          	addiw	s1,s1,-1
    80002b10:	0204c463          	bltz	s1,80002b38 <_Z7memTestv+0x108>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    80002b14:	0024951b          	slliw	a0,s1,0x2
    80002b18:	00a9d533          	srl	a0,s3,a0
    80002b1c:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002b20:	00900793          	li	a5,9
    80002b24:	fca7cee3          	blt	a5,a0,80002b00 <_Z7memTestv+0xd0>
            putc('0' + digit);
    80002b28:	03050513          	addi	a0,a0,48
    80002b2c:	fffff097          	auipc	ra,0xfffff
    80002b30:	f50080e7          	jalr	-176(ra) # 80001a7c <_Z4putcc>
    80002b34:	fd9ff06f          	j	80002b0c <_Z7memTestv+0xdc>
        }
    }
    putc('\n');
    80002b38:	00a00513          	li	a0,10
    80002b3c:	fffff097          	auipc	ra,0xfffff
    80002b40:	f40080e7          	jalr	-192(ra) # 80001a7c <_Z4putcc>
    int n = 100;
    int k = 100;
    int** matrix = (int**)mem_alloc(sizeof(int*) * n);
    80002b44:	32000513          	li	a0,800
    80002b48:	fffff097          	auipc	ra,0xfffff
    80002b4c:	ce8080e7          	jalr	-792(ra) # 80001830 <_Z9mem_allocm>
    80002b50:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    80002b54:	00000493          	li	s1,0
    80002b58:	0080006f          	j	80002b60 <_Z7memTestv+0x130>
    80002b5c:	0014849b          	addiw	s1,s1,1
    80002b60:	06300793          	li	a5,99
    80002b64:	0497c663          	blt	a5,s1,80002bb0 <_Z7memTestv+0x180>
        matrix[i] = (int*)mem_alloc(sizeof(int) * k);
    80002b68:	00349a13          	slli	s4,s1,0x3
    80002b6c:	01490a33          	add	s4,s2,s4
    80002b70:	19000513          	li	a0,400
    80002b74:	fffff097          	auipc	ra,0xfffff
    80002b78:	cbc080e7          	jalr	-836(ra) # 80001830 <_Z9mem_allocm>
    80002b7c:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    80002b80:	00000713          	li	a4,0
    80002b84:	06300793          	li	a5,99
    80002b88:	fce7cae3          	blt	a5,a4,80002b5c <_Z7memTestv+0x12c>
            matrix[i][j] = i * k + j;
    80002b8c:	06400793          	li	a5,100
    80002b90:	029787bb          	mulw	a5,a5,s1
    80002b94:	000a3683          	ld	a3,0(s4)
    80002b98:	00271613          	slli	a2,a4,0x2
    80002b9c:	00c686b3          	add	a3,a3,a2
    80002ba0:	00e787bb          	addw	a5,a5,a4
    80002ba4:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80002ba8:	0017071b          	addiw	a4,a4,1
    80002bac:	fd9ff06f          	j	80002b84 <_Z7memTestv+0x154>
        }
    }
    for(int i = 0; i < n; i++){
    80002bb0:	00000a13          	li	s4,0
    80002bb4:	0780006f          	j	80002c2c <_Z7memTestv+0x1fc>
        for(int j = 0; j < k; j++){
    80002bb8:	0014849b          	addiw	s1,s1,1
    80002bbc:	06300793          	li	a5,99
    80002bc0:	0497ca63          	blt	a5,s1,80002c14 <_Z7memTestv+0x1e4>
            assert(matrix[i][j] == i * k + j);
    80002bc4:	003a1793          	slli	a5,s4,0x3
    80002bc8:	00f907b3          	add	a5,s2,a5
    80002bcc:	0007b783          	ld	a5,0(a5)
    80002bd0:	00249713          	slli	a4,s1,0x2
    80002bd4:	00e787b3          	add	a5,a5,a4
    80002bd8:	0007a703          	lw	a4,0(a5)
    80002bdc:	06400793          	li	a5,100
    80002be0:	034787bb          	mulw	a5,a5,s4
    80002be4:	009787bb          	addw	a5,a5,s1
    80002be8:	fcf708e3          	beq	a4,a5,80002bb8 <_Z7memTestv+0x188>
    80002bec:	00008697          	auipc	a3,0x8
    80002bf0:	55c68693          	addi	a3,a3,1372 # 8000b148 <CONSOLE_STATUS+0x138>
    80002bf4:	04300613          	li	a2,67
    80002bf8:	00008597          	auipc	a1,0x8
    80002bfc:	56058593          	addi	a1,a1,1376 # 8000b158 <CONSOLE_STATUS+0x148>
    80002c00:	00008517          	auipc	a0,0x8
    80002c04:	57050513          	addi	a0,a0,1392 # 8000b170 <CONSOLE_STATUS+0x160>
    80002c08:	fffff097          	auipc	ra,0xfffff
    80002c0c:	424080e7          	jalr	1060(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80002c10:	fa9ff06f          	j	80002bb8 <_Z7memTestv+0x188>
        }
        mem_free(matrix[i]);
    80002c14:	003a1793          	slli	a5,s4,0x3
    80002c18:	00f907b3          	add	a5,s2,a5
    80002c1c:	0007b503          	ld	a0,0(a5)
    80002c20:	fffff097          	auipc	ra,0xfffff
    80002c24:	c40080e7          	jalr	-960(ra) # 80001860 <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    80002c28:	001a0a1b          	addiw	s4,s4,1
    80002c2c:	06300793          	li	a5,99
    80002c30:	0147c663          	blt	a5,s4,80002c3c <_Z7memTestv+0x20c>
        for(int j = 0; j < k; j++){
    80002c34:	00000493          	li	s1,0
    80002c38:	f85ff06f          	j	80002bbc <_Z7memTestv+0x18c>
    }
    mem_free(matrix);
    80002c3c:	00090513          	mv	a0,s2
    80002c40:	fffff097          	auipc	ra,0xfffff
    80002c44:	c20080e7          	jalr	-992(ra) # 80001860 <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002c48:	0000b797          	auipc	a5,0xb
    80002c4c:	2c07b783          	ld	a5,704(a5) # 8000df08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002c50:	0007b503          	ld	a0,0(a5)
    80002c54:	00001097          	auipc	ra,0x1
    80002c58:	bd4080e7          	jalr	-1068(ra) # 80003828 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002c5c:	00050493          	mv	s1,a0
    putc('F');
    80002c60:	04600513          	li	a0,70
    80002c64:	fffff097          	auipc	ra,0xfffff
    80002c68:	e18080e7          	jalr	-488(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002c6c:	07200513          	li	a0,114
    80002c70:	fffff097          	auipc	ra,0xfffff
    80002c74:	e0c080e7          	jalr	-500(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002c78:	06500513          	li	a0,101
    80002c7c:	fffff097          	auipc	ra,0xfffff
    80002c80:	e00080e7          	jalr	-512(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002c84:	06500513          	li	a0,101
    80002c88:	fffff097          	auipc	ra,0xfffff
    80002c8c:	df4080e7          	jalr	-524(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    80002c90:	02000513          	li	a0,32
    80002c94:	fffff097          	auipc	ra,0xfffff
    80002c98:	de8080e7          	jalr	-536(ra) # 80001a7c <_Z4putcc>
    putc('m');
    80002c9c:	06d00513          	li	a0,109
    80002ca0:	fffff097          	auipc	ra,0xfffff
    80002ca4:	ddc080e7          	jalr	-548(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002ca8:	06500513          	li	a0,101
    80002cac:	fffff097          	auipc	ra,0xfffff
    80002cb0:	dd0080e7          	jalr	-560(ra) # 80001a7c <_Z4putcc>
    putc('m');
    80002cb4:	06d00513          	li	a0,109
    80002cb8:	fffff097          	auipc	ra,0xfffff
    80002cbc:	dc4080e7          	jalr	-572(ra) # 80001a7c <_Z4putcc>
    putc('o');
    80002cc0:	06f00513          	li	a0,111
    80002cc4:	fffff097          	auipc	ra,0xfffff
    80002cc8:	db8080e7          	jalr	-584(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002ccc:	07200513          	li	a0,114
    80002cd0:	fffff097          	auipc	ra,0xfffff
    80002cd4:	dac080e7          	jalr	-596(ra) # 80001a7c <_Z4putcc>
    putc('y');
    80002cd8:	07900513          	li	a0,121
    80002cdc:	fffff097          	auipc	ra,0xfffff
    80002ce0:	da0080e7          	jalr	-608(ra) # 80001a7c <_Z4putcc>
    putc(':');
    80002ce4:	03a00513          	li	a0,58
    80002ce8:	fffff097          	auipc	ra,0xfffff
    80002cec:	d94080e7          	jalr	-620(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002cf0:	00f00913          	li	s2,15
    80002cf4:	0140006f          	j	80002d08 <_Z7memTestv+0x2d8>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002cf8:	05750513          	addi	a0,a0,87
    80002cfc:	fffff097          	auipc	ra,0xfffff
    80002d00:	d80080e7          	jalr	-640(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002d04:	fff9091b          	addiw	s2,s2,-1
    80002d08:	02094463          	bltz	s2,80002d30 <_Z7memTestv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    80002d0c:	0029151b          	slliw	a0,s2,0x2
    80002d10:	00a4d533          	srl	a0,s1,a0
    80002d14:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002d18:	00900793          	li	a5,9
    80002d1c:	fca7cee3          	blt	a5,a0,80002cf8 <_Z7memTestv+0x2c8>
            putc('0' + digit);
    80002d20:	03050513          	addi	a0,a0,48
    80002d24:	fffff097          	auipc	ra,0xfffff
    80002d28:	d58080e7          	jalr	-680(ra) # 80001a7c <_Z4putcc>
    80002d2c:	fd9ff06f          	j	80002d04 <_Z7memTestv+0x2d4>
        }
    }
    putc('\n');
    80002d30:	00a00513          	li	a0,10
    80002d34:	fffff097          	auipc	ra,0xfffff
    80002d38:	d48080e7          	jalr	-696(ra) # 80001a7c <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    80002d3c:	409989b3          	sub	s3,s3,s1
    putc('D');
    80002d40:	04400513          	li	a0,68
    80002d44:	fffff097          	auipc	ra,0xfffff
    80002d48:	d38080e7          	jalr	-712(ra) # 80001a7c <_Z4putcc>
    putc('i');
    80002d4c:	06900513          	li	a0,105
    80002d50:	fffff097          	auipc	ra,0xfffff
    80002d54:	d2c080e7          	jalr	-724(ra) # 80001a7c <_Z4putcc>
    putc('f');
    80002d58:	06600513          	li	a0,102
    80002d5c:	fffff097          	auipc	ra,0xfffff
    80002d60:	d20080e7          	jalr	-736(ra) # 80001a7c <_Z4putcc>
    putc('f');
    80002d64:	06600513          	li	a0,102
    80002d68:	fffff097          	auipc	ra,0xfffff
    80002d6c:	d14080e7          	jalr	-748(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002d70:	06500513          	li	a0,101
    80002d74:	fffff097          	auipc	ra,0xfffff
    80002d78:	d08080e7          	jalr	-760(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002d7c:	07200513          	li	a0,114
    80002d80:	fffff097          	auipc	ra,0xfffff
    80002d84:	cfc080e7          	jalr	-772(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002d88:	06500513          	li	a0,101
    80002d8c:	fffff097          	auipc	ra,0xfffff
    80002d90:	cf0080e7          	jalr	-784(ra) # 80001a7c <_Z4putcc>
    putc('n');
    80002d94:	06e00513          	li	a0,110
    80002d98:	fffff097          	auipc	ra,0xfffff
    80002d9c:	ce4080e7          	jalr	-796(ra) # 80001a7c <_Z4putcc>
    putc('c');
    80002da0:	06300513          	li	a0,99
    80002da4:	fffff097          	auipc	ra,0xfffff
    80002da8:	cd8080e7          	jalr	-808(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002dac:	06500513          	li	a0,101
    80002db0:	fffff097          	auipc	ra,0xfffff
    80002db4:	ccc080e7          	jalr	-820(ra) # 80001a7c <_Z4putcc>
    putc(':');
    80002db8:	03a00513          	li	a0,58
    80002dbc:	fffff097          	auipc	ra,0xfffff
    80002dc0:	cc0080e7          	jalr	-832(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002dc4:	00f00493          	li	s1,15
    80002dc8:	0140006f          	j	80002ddc <_Z7memTestv+0x3ac>
        int digit = (difference >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002dcc:	05750513          	addi	a0,a0,87
    80002dd0:	fffff097          	auipc	ra,0xfffff
    80002dd4:	cac080e7          	jalr	-852(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002dd8:	fff4849b          	addiw	s1,s1,-1
    80002ddc:	0204c463          	bltz	s1,80002e04 <_Z7memTestv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    80002de0:	0024951b          	slliw	a0,s1,0x2
    80002de4:	00a9d533          	srl	a0,s3,a0
    80002de8:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002dec:	00900793          	li	a5,9
    80002df0:	fca7cee3          	blt	a5,a0,80002dcc <_Z7memTestv+0x39c>
            putc('0' + digit);
    80002df4:	03050513          	addi	a0,a0,48
    80002df8:	fffff097          	auipc	ra,0xfffff
    80002dfc:	c84080e7          	jalr	-892(ra) # 80001a7c <_Z4putcc>
    80002e00:	fd9ff06f          	j	80002dd8 <_Z7memTestv+0x3a8>
        }
    }
    putc('\n');
    80002e04:	00a00513          	li	a0,10
    80002e08:	fffff097          	auipc	ra,0xfffff
    80002e0c:	c74080e7          	jalr	-908(ra) # 80001a7c <_Z4putcc>
    putc('\n');
    80002e10:	00a00513          	li	a0,10
    80002e14:	fffff097          	auipc	ra,0xfffff
    80002e18:	c68080e7          	jalr	-920(ra) # 80001a7c <_Z4putcc>
    putc('\n');
    80002e1c:	00a00513          	li	a0,10
    80002e20:	fffff097          	auipc	ra,0xfffff
    80002e24:	c5c080e7          	jalr	-932(ra) # 80001a7c <_Z4putcc>
    while(1){};
    80002e28:	0000006f          	j	80002e28 <_Z7memTestv+0x3f8>

0000000080002e2c <_Z8usermainPv>:
}

void usermain(void* arg){
    80002e2c:	ff010113          	addi	sp,sp,-16
    80002e30:	00113423          	sd	ra,8(sp)
    80002e34:	00813023          	sd	s0,0(sp)
    80002e38:	01010413          	addi	s0,sp,16
    memTest();    
    80002e3c:	00000097          	auipc	ra,0x0
    80002e40:	bf4080e7          	jalr	-1036(ra) # 80002a30 <_Z7memTestv>

0000000080002e44 <_ZN7_threadC1EPFvPvES0_>:
#include "syscall_c.h"
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    80002e44:	ff010113          	addi	sp,sp,-16
    80002e48:	00813423          	sd	s0,8(sp)
    80002e4c:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80002e50:	00053023          	sd	zero,0(a0)
    80002e54:	00053423          	sd	zero,8(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80002e58:	0000b717          	auipc	a4,0xb
    80002e5c:	13870713          	addi	a4,a4,312 # 8000df90 <_ZN7_thread6nextIDE>
    80002e60:	00072783          	lw	a5,0(a4)
    80002e64:	0017869b          	addiw	a3,a5,1
    80002e68:	00d72023          	sw	a3,0(a4)
    80002e6c:	08f52c23          	sw	a5,152(a0)
    closed = 0;
    80002e70:	09c52783          	lw	a5,156(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002e74:	0015b593          	seqz	a1,a1
    80002e78:	0045959b          	slliw	a1,a1,0x4
    80002e7c:	fe07f793          	andi	a5,a5,-32
    80002e80:	00b7e7b3          	or	a5,a5,a1
    80002e84:	08f52e23          	sw	a5,156(a0)
    reserved = 0;
    80002e88:	0a052783          	lw	a5,160(a0)
    80002e8c:	f0000737          	lui	a4,0xf0000
    80002e90:	00e7f7b3          	and	a5,a5,a4
    80002e94:	0af52023          	sw	a5,160(a0)
    joinHead = 0;
    80002e98:	06053c23          	sd	zero,120(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    80002e9c:	00200793          	li	a5,2
    80002ea0:	08f53423          	sd	a5,136(a0)
    stackStart = 0;
    80002ea4:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    80002ea8:	00053823          	sd	zero,16(a0)
    context.s1 = 0;
    80002eac:	00053c23          	sd	zero,24(a0)
    context.s2 = 0;
    80002eb0:	02053023          	sd	zero,32(a0)
    context.s3 = 0;
    80002eb4:	02053423          	sd	zero,40(a0)
    context.s4 = 0;
    80002eb8:	02053823          	sd	zero,48(a0)
    context.s5 = 0;
    80002ebc:	02053c23          	sd	zero,56(a0)
    context.s6 = 0;
    80002ec0:	04053023          	sd	zero,64(a0)
    context.s7 = 0;
    80002ec4:	04053423          	sd	zero,72(a0)
    context.s8 = 0;
    80002ec8:	04053823          	sd	zero,80(a0)
    context.s9 = 0;
    80002ecc:	04053c23          	sd	zero,88(a0)
    context.s10 = 0;
    80002ed0:	06053023          	sd	zero,96(a0)
    context.s11 = 0;
    80002ed4:	06053423          	sd	zero,104(a0)

    context.sstatus = 0;
    80002ed8:	06053823          	sd	zero,112(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002edc:	00000797          	auipc	a5,0x0
    80002ee0:	57078793          	addi	a5,a5,1392 # 8000344c <_ZN7_thread7wrapperEv>
    80002ee4:	00f53023          	sd	a5,0(a0)
}
    80002ee8:	00813403          	ld	s0,8(sp)
    80002eec:	01010113          	addi	sp,sp,16
    80002ef0:	00008067          	ret

0000000080002ef4 <_Z10popSppSpieb>:

void popSppSpie(bool kernel = false){
    80002ef4:	ff010113          	addi	sp,sp,-16
    80002ef8:	00813423          	sd	s0,8(sp)
    80002efc:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002f00:	14109073          	csrw	sepc,ra
    if(kernel){
    80002f04:	00050e63          	beqz	a0,80002f20 <_Z10popSppSpieb+0x2c>
        __asm__ volatile ("csrs sstatus, %0" :: "r" (1 << 8));
    80002f08:	10000793          	li	a5,256
    80002f0c:	1007a073          	csrs	sstatus,a5
    }else{
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    }
    __asm__ volatile ("sret");
    80002f10:	10200073          	sret
}
    80002f14:	00813403          	ld	s0,8(sp)
    80002f18:	01010113          	addi	sp,sp,16
    80002f1c:	00008067          	ret
        __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002f20:	10000793          	li	a5,256
    80002f24:	1007b073          	csrc	sstatus,a5
    80002f28:	fe9ff06f          	j	80002f10 <_Z10popSppSpieb+0x1c>

0000000080002f2c <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002f2c:	fe010113          	addi	sp,sp,-32
    80002f30:	00113c23          	sd	ra,24(sp)
    80002f34:	00813823          	sd	s0,16(sp)
    80002f38:	00913423          	sd	s1,8(sp)
    80002f3c:	01213023          	sd	s2,0(sp)
    80002f40:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80002f44:	07853483          	ld	s1,120(a0)
    while(current != 0){
    80002f48:	0c048e63          	beqz	s1,80003024 <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    80002f4c:	0004c503          	lbu	a0,0(s1)
    80002f50:	0014c783          	lbu	a5,1(s1)
    80002f54:	00879793          	slli	a5,a5,0x8
    80002f58:	00a7e7b3          	or	a5,a5,a0
    80002f5c:	0024c503          	lbu	a0,2(s1)
    80002f60:	01051513          	slli	a0,a0,0x10
    80002f64:	00f567b3          	or	a5,a0,a5
    80002f68:	0034c503          	lbu	a0,3(s1)
    80002f6c:	01851513          	slli	a0,a0,0x18
    80002f70:	00f56533          	or	a0,a0,a5
    80002f74:	0044c783          	lbu	a5,4(s1)
    80002f78:	02079793          	slli	a5,a5,0x20
    80002f7c:	00a7e533          	or	a0,a5,a0
    80002f80:	0054c783          	lbu	a5,5(s1)
    80002f84:	02879793          	slli	a5,a5,0x28
    80002f88:	00a7e7b3          	or	a5,a5,a0
    80002f8c:	0064c503          	lbu	a0,6(s1)
    80002f90:	03051513          	slli	a0,a0,0x30
    80002f94:	00f567b3          	or	a5,a0,a5
    80002f98:	0074c503          	lbu	a0,7(s1)
    80002f9c:	03851513          	slli	a0,a0,0x38
    80002fa0:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80002fa4:	09c52783          	lw	a5,156(a0)
    80002fa8:	ffd7f793          	andi	a5,a5,-3
    80002fac:	08f52e23          	sw	a5,156(a0)
        Scheduler::put(thread);
    80002fb0:	00001097          	auipc	ra,0x1
    80002fb4:	760080e7          	jalr	1888(ra) # 80004710 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80002fb8:	0084c903          	lbu	s2,8(s1)
    80002fbc:	0094c783          	lbu	a5,9(s1)
    80002fc0:	00879793          	slli	a5,a5,0x8
    80002fc4:	0127e7b3          	or	a5,a5,s2
    80002fc8:	00a4c903          	lbu	s2,10(s1)
    80002fcc:	01091913          	slli	s2,s2,0x10
    80002fd0:	00f967b3          	or	a5,s2,a5
    80002fd4:	00b4c903          	lbu	s2,11(s1)
    80002fd8:	01891913          	slli	s2,s2,0x18
    80002fdc:	00f96933          	or	s2,s2,a5
    80002fe0:	00c4c783          	lbu	a5,12(s1)
    80002fe4:	02079793          	slli	a5,a5,0x20
    80002fe8:	0127e933          	or	s2,a5,s2
    80002fec:	00d4c783          	lbu	a5,13(s1)
    80002ff0:	02879793          	slli	a5,a5,0x28
    80002ff4:	0127e7b3          	or	a5,a5,s2
    80002ff8:	00e4c903          	lbu	s2,14(s1)
    80002ffc:	03091913          	slli	s2,s2,0x30
    80003000:	00f967b3          	or	a5,s2,a5
    80003004:	00f4c903          	lbu	s2,15(s1)
    80003008:	03891913          	slli	s2,s2,0x38
    8000300c:	00f96933          	or	s2,s2,a5
        mem_free(current);
    80003010:	00048513          	mv	a0,s1
    80003014:	fffff097          	auipc	ra,0xfffff
    80003018:	84c080e7          	jalr	-1972(ra) # 80001860 <_Z8mem_freePv>
        current = next;
    8000301c:	00090493          	mv	s1,s2
    while(current != 0){
    80003020:	f29ff06f          	j	80002f48 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80003024:	01813083          	ld	ra,24(sp)
    80003028:	01013403          	ld	s0,16(sp)
    8000302c:	00813483          	ld	s1,8(sp)
    80003030:	00013903          	ld	s2,0(sp)
    80003034:	02010113          	addi	sp,sp,32
    80003038:	00008067          	ret

000000008000303c <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    8000303c:	fc010113          	addi	sp,sp,-64
    80003040:	02113c23          	sd	ra,56(sp)
    80003044:	02813823          	sd	s0,48(sp)
    80003048:	02913423          	sd	s1,40(sp)
    8000304c:	03213023          	sd	s2,32(sp)
    80003050:	01313c23          	sd	s3,24(sp)
    80003054:	01413823          	sd	s4,16(sp)
    80003058:	01513423          	sd	s5,8(sp)
    8000305c:	04010413          	addi	s0,sp,64
    80003060:	00050493          	mv	s1,a0
    80003064:	00058913          	mv	s2,a1
    80003068:	00060a93          	mv	s5,a2
    8000306c:	00068993          	mv	s3,a3
    80003070:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    80003074:	0b800513          	li	a0,184
    80003078:	ffffe097          	auipc	ra,0xffffe
    8000307c:	7b8080e7          	jalr	1976(ra) # 80001830 <_Z9mem_allocm>
    80003080:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80003084:	18050063          	beqz	a0,80003204 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    80003088:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    8000308c:	0004b783          	ld	a5,0(s1)
    80003090:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80003094:	0000b717          	auipc	a4,0xb
    80003098:	efc70713          	addi	a4,a4,-260 # 8000df90 <_ZN7_thread6nextIDE>
    8000309c:	00072783          	lw	a5,0(a4)
    800030a0:	0017869b          	addiw	a3,a5,1
    800030a4:	00d72023          	sw	a3,0(a4)
    800030a8:	0004b703          	ld	a4,0(s1)
    800030ac:	08f72c23          	sw	a5,152(a4)
    (*thread)->closed = false;
    800030b0:	0004b703          	ld	a4,0(s1)
    800030b4:	09c72783          	lw	a5,156(a4)
    800030b8:	ffe7f793          	andi	a5,a5,-2
    800030bc:	08f72e23          	sw	a5,156(a4)
    (*thread)->blocked = false;
    800030c0:	0004b703          	ld	a4,0(s1)
    800030c4:	09c72783          	lw	a5,156(a4)
    800030c8:	ffd7f793          	andi	a5,a5,-3
    800030cc:	08f72e23          	sw	a5,156(a4)
    (*thread)->sleeping = false;
    800030d0:	0004b703          	ld	a4,0(s1)
    800030d4:	09c72783          	lw	a5,156(a4)
    800030d8:	ffb7f793          	andi	a5,a5,-5
    800030dc:	08f72e23          	sw	a5,156(a4)
    (*thread)->finished = false;
    800030e0:	0004b703          	ld	a4,0(s1)
    800030e4:	09c72783          	lw	a5,156(a4)
    800030e8:	ff77f793          	andi	a5,a5,-9
    800030ec:	08f72e23          	sw	a5,156(a4)
    (*thread)->kernel = (function == 0);
    800030f0:	0004b703          	ld	a4,0(s1)
    800030f4:	00193913          	seqz	s2,s2
    800030f8:	0049191b          	slliw	s2,s2,0x4
    800030fc:	09c72783          	lw	a5,156(a4)
    80003100:	fef7f793          	andi	a5,a5,-17
    80003104:	0127e933          	or	s2,a5,s2
    80003108:	09272e23          	sw	s2,156(a4)
    (*thread)->reserved = 0;
    8000310c:	0004b703          	ld	a4,0(s1)
    80003110:	0a072783          	lw	a5,160(a4)
    80003114:	f00006b7          	lui	a3,0xf0000
    80003118:	00d7f7b3          	and	a5,a5,a3
    8000311c:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = 0;
    80003120:	0004b783          	ld	a5,0(s1)
    80003124:	0607bc23          	sd	zero,120(a5)
    (*thread)->joinTail = 0;
    80003128:	0004b783          	ld	a5,0(s1)
    8000312c:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    80003130:	0004b783          	ld	a5,0(s1)
    80003134:	00200713          	li	a4,2
    80003138:	08e7b423          	sd	a4,136(a5)
    (*thread)->stackStart = 0;
    8000313c:	0004b783          	ld	a5,0(s1)
    80003140:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    80003144:	0004b783          	ld	a5,0(s1)
    80003148:	0007b823          	sd	zero,16(a5)
    (*thread)->context.s1 = 0;
    8000314c:	0004b783          	ld	a5,0(s1)
    80003150:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s2 = 0;
    80003154:	0004b783          	ld	a5,0(s1)
    80003158:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s3 = 0;
    8000315c:	0004b783          	ld	a5,0(s1)
    80003160:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s4 = 0;
    80003164:	0004b783          	ld	a5,0(s1)
    80003168:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s5 = 0;
    8000316c:	0004b783          	ld	a5,0(s1)
    80003170:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s6 = 0;
    80003174:	0004b783          	ld	a5,0(s1)
    80003178:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s7 = 0;
    8000317c:	0004b783          	ld	a5,0(s1)
    80003180:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s8 = 0;
    80003184:	0004b783          	ld	a5,0(s1)
    80003188:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s9 = 0;
    8000318c:	0004b783          	ld	a5,0(s1)
    80003190:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s10 = 0;
    80003194:	0004b783          	ld	a5,0(s1)
    80003198:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s11 = 0;
    8000319c:	0004b783          	ld	a5,0(s1)
    800031a0:	0607b423          	sd	zero,104(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    800031a4:	0004b783          	ld	a5,0(s1)
    800031a8:	0137b423          	sd	s3,8(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    800031ac:	0004b783          	ld	a5,0(s1)
    800031b0:	00000717          	auipc	a4,0x0
    800031b4:	29c70713          	addi	a4,a4,668 # 8000344c <_ZN7_thread7wrapperEv>
    800031b8:	00e7b023          	sd	a4,0(a5)

    (*thread)->stackStart = stack;
    800031bc:	0004b783          	ld	a5,0(s1)
    800031c0:	0937b823          	sd	s3,144(a5)
    if(start){
    800031c4:	020a1663          	bnez	s4,800031f0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    800031c8:	00000513          	li	a0,0
}
    800031cc:	03813083          	ld	ra,56(sp)
    800031d0:	03013403          	ld	s0,48(sp)
    800031d4:	02813483          	ld	s1,40(sp)
    800031d8:	02013903          	ld	s2,32(sp)
    800031dc:	01813983          	ld	s3,24(sp)
    800031e0:	01013a03          	ld	s4,16(sp)
    800031e4:	00813a83          	ld	s5,8(sp)
    800031e8:	04010113          	addi	sp,sp,64
    800031ec:	00008067          	ret
        Scheduler::put(*thread);
    800031f0:	0004b503          	ld	a0,0(s1)
    800031f4:	00001097          	auipc	ra,0x1
    800031f8:	51c080e7          	jalr	1308(ra) # 80004710 <_ZN9Scheduler3putEP7_thread>
    return 0;
    800031fc:	00000513          	li	a0,0
    80003200:	fcdff06f          	j	800031cc <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    80003204:	fff00513          	li	a0,-1
    80003208:	fc5ff06f          	j	800031cc <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

000000008000320c <_ZN7_thread4joinEPS_>:

void _thread::join(thread_t thread){
    /// cannot join to a finished or closed thread
    if(thread->finished || thread->closed){
    8000320c:	0985b783          	ld	a5,152(a1)
    80003210:	00900713          	li	a4,9
    80003214:	02071713          	slli	a4,a4,0x20
    80003218:	00e7f7b3          	and	a5,a5,a4
    8000321c:	00078463          	beqz	a5,80003224 <_ZN7_thread4joinEPS_+0x18>
    80003220:	00008067          	ret
void _thread::join(thread_t thread){
    80003224:	fe010113          	addi	sp,sp,-32
    80003228:	00113c23          	sd	ra,24(sp)
    8000322c:	00813823          	sd	s0,16(sp)
    80003230:	00913423          	sd	s1,8(sp)
    80003234:	01213023          	sd	s2,0(sp)
    80003238:	02010413          	addi	s0,sp,32
    8000323c:	00050493          	mv	s1,a0
    80003240:	00058913          	mv	s2,a1
        return;
    }
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    80003244:	01000513          	li	a0,16
    80003248:	ffffe097          	auipc	ra,0xffffe
    8000324c:	5e8080e7          	jalr	1512(ra) # 80001830 <_Z9mem_allocm>
    this->blocked = true;
    80003250:	09c4a703          	lw	a4,156(s1)
    80003254:	00276713          	ori	a4,a4,2
    80003258:	08e4ae23          	sw	a4,156(s1)
    newJoin->thread = this;
    8000325c:	00950023          	sb	s1,0(a0)
    80003260:	0084d713          	srli	a4,s1,0x8
    80003264:	00e500a3          	sb	a4,1(a0)
    80003268:	0104d713          	srli	a4,s1,0x10
    8000326c:	00e50123          	sb	a4,2(a0)
    80003270:	0184d71b          	srliw	a4,s1,0x18
    80003274:	00e501a3          	sb	a4,3(a0)
    80003278:	0204d713          	srli	a4,s1,0x20
    8000327c:	00e50223          	sb	a4,4(a0)
    80003280:	0284d713          	srli	a4,s1,0x28
    80003284:	00e502a3          	sb	a4,5(a0)
    80003288:	0304d713          	srli	a4,s1,0x30
    8000328c:	00e50323          	sb	a4,6(a0)
    80003290:	0384d493          	srli	s1,s1,0x38
    80003294:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80003298:	00050423          	sb	zero,8(a0)
    8000329c:	000504a3          	sb	zero,9(a0)
    800032a0:	00050523          	sb	zero,10(a0)
    800032a4:	000505a3          	sb	zero,11(a0)
    800032a8:	00050623          	sb	zero,12(a0)
    800032ac:	000506a3          	sb	zero,13(a0)
    800032b0:	00050723          	sb	zero,14(a0)
    800032b4:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    800032b8:	07893703          	ld	a4,120(s2)
    800032bc:	06070463          	beqz	a4,80003324 <_ZN7_thread4joinEPS_+0x118>
        thread->joinHead = newJoin;
        thread->joinTail = newJoin;
    }else{
        thread->joinTail->next = newJoin;
    800032c0:	08093703          	ld	a4,128(s2)
    800032c4:	00a70423          	sb	a0,8(a4)
    800032c8:	00855693          	srli	a3,a0,0x8
    800032cc:	00d704a3          	sb	a3,9(a4)
    800032d0:	01055693          	srli	a3,a0,0x10
    800032d4:	00d70523          	sb	a3,10(a4)
    800032d8:	0185569b          	srliw	a3,a0,0x18
    800032dc:	00d705a3          	sb	a3,11(a4)
    800032e0:	02055693          	srli	a3,a0,0x20
    800032e4:	00d70623          	sb	a3,12(a4)
    800032e8:	02855693          	srli	a3,a0,0x28
    800032ec:	00d706a3          	sb	a3,13(a4)
    800032f0:	03055693          	srli	a3,a0,0x30
    800032f4:	00d70723          	sb	a3,14(a4)
    800032f8:	03855693          	srli	a3,a0,0x38
    800032fc:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    80003300:	08a93023          	sd	a0,128(s2)
    }
    thread_dispatch();
    80003304:	ffffe097          	auipc	ra,0xffffe
    80003308:	624080e7          	jalr	1572(ra) # 80001928 <_Z15thread_dispatchv>
}
    8000330c:	01813083          	ld	ra,24(sp)
    80003310:	01013403          	ld	s0,16(sp)
    80003314:	00813483          	ld	s1,8(sp)
    80003318:	00013903          	ld	s2,0(sp)
    8000331c:	02010113          	addi	sp,sp,32
    80003320:	00008067          	ret
        thread->joinHead = newJoin;
    80003324:	06a93c23          	sd	a0,120(s2)
        thread->joinTail = newJoin;
    80003328:	08a93023          	sd	a0,128(s2)
    8000332c:	fd9ff06f          	j	80003304 <_ZN7_thread4joinEPS_+0xf8>

0000000080003330 <_ZN7_thread4tickEv>:

int _thread::tick(){
    80003330:	fe010113          	addi	sp,sp,-32
    80003334:	00113c23          	sd	ra,24(sp)
    80003338:	00813823          	sd	s0,16(sp)
    8000333c:	00913423          	sd	s1,8(sp)
    80003340:	02010413          	addi	s0,sp,32
    80003344:	00050493          	mv	s1,a0
    putc('T');
    80003348:	05400513          	li	a0,84
    8000334c:	ffffe097          	auipc	ra,0xffffe
    80003350:	730080e7          	jalr	1840(ra) # 80001a7c <_Z4putcc>
    if(currentThread->blocked){
    80003354:	0000b797          	auipc	a5,0xb
    80003358:	c447b783          	ld	a5,-956(a5) # 8000df98 <_ZN7_thread13currentThreadE>
    8000335c:	09c7a783          	lw	a5,156(a5)
    80003360:	0027f713          	andi	a4,a5,2
    80003364:	04071a63          	bnez	a4,800033b8 <_ZN7_thread4tickEv+0x88>
        return -1;
    }
    if(currentThread->closed){
    80003368:	0017f713          	andi	a4,a5,1
    8000336c:	04071a63          	bnez	a4,800033c0 <_ZN7_thread4tickEv+0x90>
        return -2;
    }
    if(currentThread->sleeping){
    80003370:	0047f713          	andi	a4,a5,4
    80003374:	04071a63          	bnez	a4,800033c8 <_ZN7_thread4tickEv+0x98>
        return -3;
    }
    if(currentThread->finished){
    80003378:	0087f793          	andi	a5,a5,8
    8000337c:	04079a63          	bnez	a5,800033d0 <_ZN7_thread4tickEv+0xa0>
        return -4;
    }
    timeLeft --;
    80003380:	0884b783          	ld	a5,136(s1)
    80003384:	fff78793          	addi	a5,a5,-1
    80003388:	08f4b423          	sd	a5,136(s1)
    if(timeLeft == 0){
    8000338c:	00078e63          	beqz	a5,800033a8 <_ZN7_thread4tickEv+0x78>
        thread_dispatch();
    }
    return 0;
    80003390:	00000513          	li	a0,0
}
    80003394:	01813083          	ld	ra,24(sp)
    80003398:	01013403          	ld	s0,16(sp)
    8000339c:	00813483          	ld	s1,8(sp)
    800033a0:	02010113          	addi	sp,sp,32
    800033a4:	00008067          	ret
        thread_dispatch();
    800033a8:	ffffe097          	auipc	ra,0xffffe
    800033ac:	580080e7          	jalr	1408(ra) # 80001928 <_Z15thread_dispatchv>
    return 0;
    800033b0:	00000513          	li	a0,0
    800033b4:	fe1ff06f          	j	80003394 <_ZN7_thread4tickEv+0x64>
        return -1;
    800033b8:	fff00513          	li	a0,-1
    800033bc:	fd9ff06f          	j	80003394 <_ZN7_thread4tickEv+0x64>
        return -2;
    800033c0:	ffe00513          	li	a0,-2
    800033c4:	fd1ff06f          	j	80003394 <_ZN7_thread4tickEv+0x64>
        return -3;
    800033c8:	ffd00513          	li	a0,-3
    800033cc:	fc9ff06f          	j	80003394 <_ZN7_thread4tickEv+0x64>
        return -4;
    800033d0:	ffc00513          	li	a0,-4
    800033d4:	fc1ff06f          	j	80003394 <_ZN7_thread4tickEv+0x64>

00000000800033d8 <_ZN7_thread4exitEv>:

int _thread::exit(){
    if(currentThread->closed){
    800033d8:	0000b717          	auipc	a4,0xb
    800033dc:	bc073703          	ld	a4,-1088(a4) # 8000df98 <_ZN7_thread13currentThreadE>
    800033e0:	09c72783          	lw	a5,156(a4)
    800033e4:	0017f693          	andi	a3,a5,1
    800033e8:	04069663          	bnez	a3,80003434 <_ZN7_thread4exitEv+0x5c>
        return -1;
    }
    if(currentThread->blocked){
    800033ec:	0027f693          	andi	a3,a5,2
    800033f0:	04069663          	bnez	a3,8000343c <_ZN7_thread4exitEv+0x64>
        return -2;
    }
    if(currentThread->sleeping){
    800033f4:	0047f793          	andi	a5,a5,4
    800033f8:	04079663          	bnez	a5,80003444 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    800033fc:	ff010113          	addi	sp,sp,-16
    80003400:	00113423          	sd	ra,8(sp)
    80003404:	00813023          	sd	s0,0(sp)
    80003408:	01010413          	addi	s0,sp,16
        return -3;
    }
    currentThread->finished = 1;
    8000340c:	09c72783          	lw	a5,156(a4)
    80003410:	0087e793          	ori	a5,a5,8
    80003414:	08f72e23          	sw	a5,156(a4)
    thread_dispatch();
    80003418:	ffffe097          	auipc	ra,0xffffe
    8000341c:	510080e7          	jalr	1296(ra) # 80001928 <_Z15thread_dispatchv>
    return 0;
    80003420:	00000513          	li	a0,0
}
    80003424:	00813083          	ld	ra,8(sp)
    80003428:	00013403          	ld	s0,0(sp)
    8000342c:	01010113          	addi	sp,sp,16
    80003430:	00008067          	ret
        return -1;
    80003434:	fff00513          	li	a0,-1
    80003438:	00008067          	ret
        return -2;
    8000343c:	ffe00513          	li	a0,-2
    80003440:	00008067          	ret
        return -3;
    80003444:	ffd00513          	li	a0,-3
}
    80003448:	00008067          	ret

000000008000344c <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    8000344c:	fe010113          	addi	sp,sp,-32
    80003450:	00113c23          	sd	ra,24(sp)
    80003454:	00813823          	sd	s0,16(sp)
    80003458:	00913423          	sd	s1,8(sp)
    8000345c:	02010413          	addi	s0,sp,32
    popSppSpie(currentThread->kernel);
    80003460:	0000b497          	auipc	s1,0xb
    80003464:	b3048493          	addi	s1,s1,-1232 # 8000df90 <_ZN7_thread6nextIDE>
    80003468:	0084b783          	ld	a5,8(s1)
    8000346c:	09c7a503          	lw	a0,156(a5)
    80003470:	4045551b          	sraiw	a0,a0,0x4
    80003474:	00157513          	andi	a0,a0,1
    80003478:	00000097          	auipc	ra,0x0
    8000347c:	a7c080e7          	jalr	-1412(ra) # 80002ef4 <_Z10popSppSpieb>
    currentThread->function(currentThread->arg);
    80003480:	0084b783          	ld	a5,8(s1)
    80003484:	0a87b703          	ld	a4,168(a5)
    80003488:	0b07b503          	ld	a0,176(a5)
    8000348c:	000700e7          	jalr	a4
    currentThread->unJoin();
    80003490:	0084b503          	ld	a0,8(s1)
    80003494:	00000097          	auipc	ra,0x0
    80003498:	a98080e7          	jalr	-1384(ra) # 80002f2c <_ZN7_thread6unJoinEv>
    exit();
    8000349c:	00000097          	auipc	ra,0x0
    800034a0:	f3c080e7          	jalr	-196(ra) # 800033d8 <_ZN7_thread4exitEv>
}
    800034a4:	01813083          	ld	ra,24(sp)
    800034a8:	01013403          	ld	s0,16(sp)
    800034ac:	00813483          	ld	s1,8(sp)
    800034b0:	02010113          	addi	sp,sp,32
    800034b4:	00008067          	ret

00000000800034b8 <_ZN7_thread10setBlockedEb>:

void _thread::setBlocked(bool blocked){
    800034b8:	ff010113          	addi	sp,sp,-16
    800034bc:	00813423          	sd	s0,8(sp)
    800034c0:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    800034c4:	0015f593          	andi	a1,a1,1
    800034c8:	0015979b          	slliw	a5,a1,0x1
    800034cc:	09c52583          	lw	a1,156(a0)
    800034d0:	ffd5f593          	andi	a1,a1,-3
    800034d4:	00f5e5b3          	or	a1,a1,a5
    800034d8:	08b52e23          	sw	a1,156(a0)
}
    800034dc:	00813403          	ld	s0,8(sp)
    800034e0:	01010113          	addi	sp,sp,16
    800034e4:	00008067          	ret

00000000800034e8 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    800034e8:	ff010113          	addi	sp,sp,-16
    800034ec:	00813423          	sd	s0,8(sp)
    800034f0:	01010413          	addi	s0,sp,16
    this->closed = closed;
    800034f4:	0015f793          	andi	a5,a1,1
    800034f8:	09c52583          	lw	a1,156(a0)
    800034fc:	ffe5f593          	andi	a1,a1,-2
    80003500:	00f5e5b3          	or	a1,a1,a5
    80003504:	08b52e23          	sw	a1,156(a0)
}
    80003508:	00813403          	ld	s0,8(sp)
    8000350c:	01010113          	addi	sp,sp,16
    80003510:	00008067          	ret

0000000080003514 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    80003514:	ff010113          	addi	sp,sp,-16
    80003518:	00813423          	sd	s0,8(sp)
    8000351c:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    80003520:	0015f593          	andi	a1,a1,1
    80003524:	0025979b          	slliw	a5,a1,0x2
    80003528:	09c52583          	lw	a1,156(a0)
    8000352c:	ffb5f593          	andi	a1,a1,-5
    80003530:	00f5e5b3          	or	a1,a1,a5
    80003534:	08b52e23          	sw	a1,156(a0)
}
    80003538:	00813403          	ld	s0,8(sp)
    8000353c:	01010113          	addi	sp,sp,16
    80003540:	00008067          	ret

0000000080003544 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
        Scheduler::put(oldThread);
    }
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    80003544:	ff010113          	addi	sp,sp,-16
    80003548:	00813423          	sd	s0,8(sp)
    8000354c:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    80003550:	04050263          	beqz	a0,80003594 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    80003554:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    80003558:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    8000355c:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    80003560:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    80003564:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    80003568:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    8000356c:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    80003570:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    80003574:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    80003578:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    8000357c:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    80003580:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    80003584:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    80003588:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    8000358c:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    80003590:	06853823          	sd	s0,112(a0)
    }
    
    
    if(newContext->sp != 0){
    80003594:	0085b783          	ld	a5,8(a1)
    80003598:	00078463          	beqz	a5,800035a0 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    8000359c:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    800035a0:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    800035a4:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    800035a8:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    800035ac:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    800035b0:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    800035b4:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    800035b8:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    800035bc:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    800035c0:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    800035c4:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    800035c8:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    800035cc:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    800035d0:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    800035d4:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    800035d8:	0685bd83          	ld	s11,104(a1)

    return;

}
    800035dc:	00813403          	ld	s0,8(sp)
    800035e0:	01010113          	addi	sp,sp,16
    800035e4:	00008067          	ret

00000000800035e8 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    800035e8:	fe010113          	addi	sp,sp,-32
    800035ec:	00113c23          	sd	ra,24(sp)
    800035f0:	00813823          	sd	s0,16(sp)
    800035f4:	00913423          	sd	s1,8(sp)
    800035f8:	01213023          	sd	s2,0(sp)
    800035fc:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    80003600:	0000b917          	auipc	s2,0xb
    80003604:	99090913          	addi	s2,s2,-1648 # 8000df90 <_ZN7_thread6nextIDE>
    80003608:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    8000360c:	00001097          	auipc	ra,0x1
    80003610:	2f4080e7          	jalr	756(ra) # 80004900 <_ZN9Scheduler3getEv>
    80003614:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    80003618:	00200793          	li	a5,2
    8000361c:	08f4b423          	sd	a5,136(s1)
    if(currentThread == 0){
    80003620:	04050463          	beqz	a0,80003668 <_ZN7_thread8dispatchEv+0x80>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    80003624:	00048c63          	beqz	s1,8000363c <_ZN7_thread8dispatchEv+0x54>
    80003628:	0984b783          	ld	a5,152(s1)
    8000362c:	00f00713          	li	a4,15
    80003630:	02071713          	slli	a4,a4,0x20
    80003634:	00e7f7b3          	and	a5,a5,a4
    80003638:	02078e63          	beqz	a5,80003674 <_ZN7_thread8dispatchEv+0x8c>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    8000363c:	0000b597          	auipc	a1,0xb
    80003640:	95c5b583          	ld	a1,-1700(a1) # 8000df98 <_ZN7_thread13currentThreadE>
    80003644:	00048513          	mv	a0,s1
    80003648:	00000097          	auipc	ra,0x0
    8000364c:	efc080e7          	jalr	-260(ra) # 80003544 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    80003650:	01813083          	ld	ra,24(sp)
    80003654:	01013403          	ld	s0,16(sp)
    80003658:	00813483          	ld	s1,8(sp)
    8000365c:	00013903          	ld	s2,0(sp)
    80003660:	02010113          	addi	sp,sp,32
    80003664:	00008067          	ret
        currentThread = oldThread;
    80003668:	0000b797          	auipc	a5,0xb
    8000366c:	9297b823          	sd	s1,-1744(a5) # 8000df98 <_ZN7_thread13currentThreadE>
        return;
    80003670:	fe1ff06f          	j	80003650 <_ZN7_thread8dispatchEv+0x68>
        Scheduler::put(oldThread);
    80003674:	00048513          	mv	a0,s1
    80003678:	00001097          	auipc	ra,0x1
    8000367c:	098080e7          	jalr	152(ra) # 80004710 <_ZN9Scheduler3putEP7_thread>
    80003680:	fbdff06f          	j	8000363c <_ZN7_thread8dispatchEv+0x54>

0000000080003684 <_ZN11HeapManagerC1Ev>:
#include "heapManager.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80003684:	fe010113          	addi	sp,sp,-32
    80003688:	00113c23          	sd	ra,24(sp)
    8000368c:	00813823          	sd	s0,16(sp)
    80003690:	00913423          	sd	s1,8(sp)
    80003694:	02010413          	addi	s0,sp,32
    80003698:	00050493          	mv	s1,a0
    assert(instance == 0);
    8000369c:	0000b797          	auipc	a5,0xb
    800036a0:	9047b783          	ld	a5,-1788(a5) # 8000dfa0 <_ZN11HeapManager8instanceE>
    800036a4:	02079063          	bnez	a5,800036c4 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    800036a8:	0000b797          	auipc	a5,0xb
    800036ac:	8e97bc23          	sd	s1,-1800(a5) # 8000dfa0 <_ZN11HeapManager8instanceE>
}
    800036b0:	01813083          	ld	ra,24(sp)
    800036b4:	01013403          	ld	s0,16(sp)
    800036b8:	00813483          	ld	s1,8(sp)
    800036bc:	02010113          	addi	sp,sp,32
    800036c0:	00008067          	ret
    assert(instance == 0);
    800036c4:	00008697          	auipc	a3,0x8
    800036c8:	acc68693          	addi	a3,a3,-1332 # 8000b190 <CONSOLE_STATUS+0x180>
    800036cc:	01200613          	li	a2,18
    800036d0:	00008597          	auipc	a1,0x8
    800036d4:	ae058593          	addi	a1,a1,-1312 # 8000b1b0 <CONSOLE_STATUS+0x1a0>
    800036d8:	00008517          	auipc	a0,0x8
    800036dc:	96850513          	addi	a0,a0,-1688 # 8000b040 <CONSOLE_STATUS+0x30>
    800036e0:	fffff097          	auipc	ra,0xfffff
    800036e4:	94c080e7          	jalr	-1716(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800036e8:	fc1ff06f          	j	800036a8 <_ZN11HeapManagerC1Ev+0x24>

00000000800036ec <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    800036ec:	ff010113          	addi	sp,sp,-16
    800036f0:	00813423          	sd	s0,8(sp)
    800036f4:	01010413          	addi	s0,sp,16
    
}
    800036f8:	00813403          	ld	s0,8(sp)
    800036fc:	01010113          	addi	sp,sp,16
    80003700:	00008067          	ret

0000000080003704 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uint64 nStart, size_t nEnd){
    80003704:	fd010113          	addi	sp,sp,-48
    80003708:	02113423          	sd	ra,40(sp)
    8000370c:	02813023          	sd	s0,32(sp)
    80003710:	00913c23          	sd	s1,24(sp)
    80003714:	01213823          	sd	s2,16(sp)
    80003718:	01313423          	sd	s3,8(sp)
    8000371c:	03010413          	addi	s0,sp,48
    80003720:	00050993          	mv	s3,a0
    80003724:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003728:	40b604b3          	sub	s1,a2,a1
    8000372c:	0414b793          	sltiu	a5,s1,65
    80003730:	0c079863          	bnez	a5,80003800 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80003734:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80003738:	fde00793          	li	a5,-34
    8000373c:	00f90c23          	sb	a5,24(s2)
    80003740:	fc000713          	li	a4,-64
    80003744:	00e90ca3          	sb	a4,25(s2)
    80003748:	fad00713          	li	a4,-83
    8000374c:	00e90d23          	sb	a4,26(s2)
    80003750:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    80003754:	0064d613          	srli	a2,s1,0x6
    80003758:	0009b783          	ld	a5,0(s3)
    8000375c:	fff60613          	addi	a2,a2,-1
    80003760:	00c78823          	sb	a2,16(a5)
    80003764:	00865713          	srli	a4,a2,0x8
    80003768:	00e788a3          	sb	a4,17(a5)
    8000376c:	01065713          	srli	a4,a2,0x10
    80003770:	00e78923          	sb	a4,18(a5)
    80003774:	0186571b          	srliw	a4,a2,0x18
    80003778:	00e789a3          	sb	a4,19(a5)
    8000377c:	02065713          	srli	a4,a2,0x20
    80003780:	00e78a23          	sb	a4,20(a5)
    80003784:	02865713          	srli	a4,a2,0x28
    80003788:	00e78aa3          	sb	a4,21(a5)
    8000378c:	03065713          	srli	a4,a2,0x30
    80003790:	00e78b23          	sb	a4,22(a5)
    80003794:	03865613          	srli	a2,a2,0x38
    80003798:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    8000379c:	0009b783          	ld	a5,0(s3)
    800037a0:	00078023          	sb	zero,0(a5)
    800037a4:	000780a3          	sb	zero,1(a5)
    800037a8:	00078123          	sb	zero,2(a5)
    800037ac:	000781a3          	sb	zero,3(a5)
    800037b0:	00078223          	sb	zero,4(a5)
    800037b4:	000782a3          	sb	zero,5(a5)
    800037b8:	00078323          	sb	zero,6(a5)
    800037bc:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    800037c0:	0009b783          	ld	a5,0(s3)
    800037c4:	00078423          	sb	zero,8(a5)
    800037c8:	000784a3          	sb	zero,9(a5)
    800037cc:	00078523          	sb	zero,10(a5)
    800037d0:	000785a3          	sb	zero,11(a5)
    800037d4:	00078623          	sb	zero,12(a5)
    800037d8:	000786a3          	sb	zero,13(a5)
    800037dc:	00078723          	sb	zero,14(a5)
    800037e0:	000787a3          	sb	zero,15(a5)
}
    800037e4:	02813083          	ld	ra,40(sp)
    800037e8:	02013403          	ld	s0,32(sp)
    800037ec:	01813483          	ld	s1,24(sp)
    800037f0:	01013903          	ld	s2,16(sp)
    800037f4:	00813983          	ld	s3,8(sp)
    800037f8:	03010113          	addi	sp,sp,48
    800037fc:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003800:	00008697          	auipc	a3,0x8
    80003804:	9c868693          	addi	a3,a3,-1592 # 8000b1c8 <CONSOLE_STATUS+0x1b8>
    80003808:	01b00613          	li	a2,27
    8000380c:	00008597          	auipc	a1,0x8
    80003810:	9a458593          	addi	a1,a1,-1628 # 8000b1b0 <CONSOLE_STATUS+0x1a0>
    80003814:	00008517          	auipc	a0,0x8
    80003818:	9dc50513          	addi	a0,a0,-1572 # 8000b1f0 <CONSOLE_STATUS+0x1e0>
    8000381c:	fffff097          	auipc	ra,0xfffff
    80003820:	810080e7          	jalr	-2032(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80003824:	f11ff06f          	j	80003734 <_ZN11HeapManager4initEmm+0x30>

0000000080003828 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80003828:	fe010113          	addi	sp,sp,-32
    8000382c:	00113c23          	sd	ra,24(sp)
    80003830:	00813823          	sd	s0,16(sp)
    80003834:	00913423          	sd	s1,8(sp)
    80003838:	01213023          	sd	s2,0(sp)
    8000383c:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003840:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80003844:	00000913          	li	s2,0
    80003848:	0b80006f          	j	80003900 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    8000384c:	0104c783          	lbu	a5,16(s1)
    80003850:	0114c703          	lbu	a4,17(s1)
    80003854:	00871713          	slli	a4,a4,0x8
    80003858:	00f76733          	or	a4,a4,a5
    8000385c:	0124c783          	lbu	a5,18(s1)
    80003860:	01079793          	slli	a5,a5,0x10
    80003864:	00e7e733          	or	a4,a5,a4
    80003868:	0134c783          	lbu	a5,19(s1)
    8000386c:	01879793          	slli	a5,a5,0x18
    80003870:	00e7e7b3          	or	a5,a5,a4
    80003874:	0144c703          	lbu	a4,20(s1)
    80003878:	02071713          	slli	a4,a4,0x20
    8000387c:	00f767b3          	or	a5,a4,a5
    80003880:	0154c703          	lbu	a4,21(s1)
    80003884:	02871713          	slli	a4,a4,0x28
    80003888:	00f76733          	or	a4,a4,a5
    8000388c:	0164c783          	lbu	a5,22(s1)
    80003890:	03079793          	slli	a5,a5,0x30
    80003894:	00e7e733          	or	a4,a5,a4
    80003898:	0174c783          	lbu	a5,23(s1)
    8000389c:	03879793          	slli	a5,a5,0x38
    800038a0:	00e7e7b3          	or	a5,a5,a4
    800038a4:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    800038a8:	0004c703          	lbu	a4,0(s1)
    800038ac:	0014c783          	lbu	a5,1(s1)
    800038b0:	00879793          	slli	a5,a5,0x8
    800038b4:	00e7e733          	or	a4,a5,a4
    800038b8:	0024c783          	lbu	a5,2(s1)
    800038bc:	01079793          	slli	a5,a5,0x10
    800038c0:	00e7e7b3          	or	a5,a5,a4
    800038c4:	0034c703          	lbu	a4,3(s1)
    800038c8:	01871713          	slli	a4,a4,0x18
    800038cc:	00f767b3          	or	a5,a4,a5
    800038d0:	0044c703          	lbu	a4,4(s1)
    800038d4:	02071713          	slli	a4,a4,0x20
    800038d8:	00f76733          	or	a4,a4,a5
    800038dc:	0054c783          	lbu	a5,5(s1)
    800038e0:	02879793          	slli	a5,a5,0x28
    800038e4:	00e7e733          	or	a4,a5,a4
    800038e8:	0064c783          	lbu	a5,6(s1)
    800038ec:	03079793          	slli	a5,a5,0x30
    800038f0:	00e7e7b3          	or	a5,a5,a4
    800038f4:	0074c483          	lbu	s1,7(s1)
    800038f8:	03849493          	slli	s1,s1,0x38
    800038fc:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003900:	06048263          	beqz	s1,80003964 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003904:	0184c783          	lbu	a5,24(s1)
    80003908:	0194c703          	lbu	a4,25(s1)
    8000390c:	00871713          	slli	a4,a4,0x8
    80003910:	00f76733          	or	a4,a4,a5
    80003914:	01a4c783          	lbu	a5,26(s1)
    80003918:	01079793          	slli	a5,a5,0x10
    8000391c:	00e7e733          	or	a4,a5,a4
    80003920:	01b4c783          	lbu	a5,27(s1)
    80003924:	01879793          	slli	a5,a5,0x18
    80003928:	00e7e7b3          	or	a5,a5,a4
    8000392c:	0007879b          	sext.w	a5,a5
    80003930:	deadc737          	lui	a4,0xdeadc
    80003934:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eacce7e>
    80003938:	f0e78ae3          	beq	a5,a4,8000384c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    8000393c:	00008697          	auipc	a3,0x8
    80003940:	8d468693          	addi	a3,a3,-1836 # 8000b210 <CONSOLE_STATUS+0x200>
    80003944:	02800613          	li	a2,40
    80003948:	00008597          	auipc	a1,0x8
    8000394c:	86858593          	addi	a1,a1,-1944 # 8000b1b0 <CONSOLE_STATUS+0x1a0>
    80003950:	00008517          	auipc	a0,0x8
    80003954:	8e850513          	addi	a0,a0,-1816 # 8000b238 <CONSOLE_STATUS+0x228>
    80003958:	ffffe097          	auipc	ra,0xffffe
    8000395c:	6d4080e7          	jalr	1748(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80003960:	eedff06f          	j	8000384c <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80003964:	00090513          	mv	a0,s2
    80003968:	01813083          	ld	ra,24(sp)
    8000396c:	01013403          	ld	s0,16(sp)
    80003970:	00813483          	ld	s1,8(sp)
    80003974:	00013903          	ld	s2,0(sp)
    80003978:	02010113          	addi	sp,sp,32
    8000397c:	00008067          	ret

0000000080003980 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80003980:	fd010113          	addi	sp,sp,-48
    80003984:	02113423          	sd	ra,40(sp)
    80003988:	02813023          	sd	s0,32(sp)
    8000398c:	00913c23          	sd	s1,24(sp)
    80003990:	01213823          	sd	s2,16(sp)
    80003994:	01313423          	sd	s3,8(sp)
    80003998:	03010413          	addi	s0,sp,48
    8000399c:	00050993          	mv	s3,a0
    800039a0:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    800039a4:	00053483          	ld	s1,0(a0)
    800039a8:	0b80006f          	j	80003a60 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    800039ac:	0104c783          	lbu	a5,16(s1)
    800039b0:	0114c703          	lbu	a4,17(s1)
    800039b4:	00871713          	slli	a4,a4,0x8
    800039b8:	00f76733          	or	a4,a4,a5
    800039bc:	0124c783          	lbu	a5,18(s1)
    800039c0:	01079793          	slli	a5,a5,0x10
    800039c4:	00e7e733          	or	a4,a5,a4
    800039c8:	0134c783          	lbu	a5,19(s1)
    800039cc:	01879793          	slli	a5,a5,0x18
    800039d0:	00e7e7b3          	or	a5,a5,a4
    800039d4:	0144c703          	lbu	a4,20(s1)
    800039d8:	02071713          	slli	a4,a4,0x20
    800039dc:	00f767b3          	or	a5,a4,a5
    800039e0:	0154c703          	lbu	a4,21(s1)
    800039e4:	02871713          	slli	a4,a4,0x28
    800039e8:	00f76733          	or	a4,a4,a5
    800039ec:	0164c783          	lbu	a5,22(s1)
    800039f0:	03079793          	slli	a5,a5,0x30
    800039f4:	00e7e733          	or	a4,a5,a4
    800039f8:	0174c783          	lbu	a5,23(s1)
    800039fc:	03879793          	slli	a5,a5,0x38
    80003a00:	00e7e7b3          	or	a5,a5,a4
    80003a04:	0d27f063          	bgeu	a5,s2,80003ac4 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80003a08:	0004c703          	lbu	a4,0(s1)
    80003a0c:	0014c783          	lbu	a5,1(s1)
    80003a10:	00879793          	slli	a5,a5,0x8
    80003a14:	00e7e733          	or	a4,a5,a4
    80003a18:	0024c783          	lbu	a5,2(s1)
    80003a1c:	01079793          	slli	a5,a5,0x10
    80003a20:	00e7e7b3          	or	a5,a5,a4
    80003a24:	0034c703          	lbu	a4,3(s1)
    80003a28:	01871713          	slli	a4,a4,0x18
    80003a2c:	00f767b3          	or	a5,a4,a5
    80003a30:	0044c703          	lbu	a4,4(s1)
    80003a34:	02071713          	slli	a4,a4,0x20
    80003a38:	00f76733          	or	a4,a4,a5
    80003a3c:	0054c783          	lbu	a5,5(s1)
    80003a40:	02879793          	slli	a5,a5,0x28
    80003a44:	00e7e733          	or	a4,a5,a4
    80003a48:	0064c783          	lbu	a5,6(s1)
    80003a4c:	03079793          	slli	a5,a5,0x30
    80003a50:	00e7e7b3          	or	a5,a5,a4
    80003a54:	0074c483          	lbu	s1,7(s1)
    80003a58:	03849493          	slli	s1,s1,0x38
    80003a5c:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003a60:	4e048c63          	beqz	s1,80003f58 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003a64:	0184c783          	lbu	a5,24(s1)
    80003a68:	0194c703          	lbu	a4,25(s1)
    80003a6c:	00871713          	slli	a4,a4,0x8
    80003a70:	00f76733          	or	a4,a4,a5
    80003a74:	01a4c783          	lbu	a5,26(s1)
    80003a78:	01079793          	slli	a5,a5,0x10
    80003a7c:	00e7e733          	or	a4,a5,a4
    80003a80:	01b4c783          	lbu	a5,27(s1)
    80003a84:	01879793          	slli	a5,a5,0x18
    80003a88:	00e7e7b3          	or	a5,a5,a4
    80003a8c:	0007879b          	sext.w	a5,a5
    80003a90:	deadc737          	lui	a4,0xdeadc
    80003a94:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eacce7e>
    80003a98:	f0e78ae3          	beq	a5,a4,800039ac <_ZN11HeapManager12heapAllocateEm+0x2c>
    80003a9c:	00007697          	auipc	a3,0x7
    80003aa0:	7c468693          	addi	a3,a3,1988 # 8000b260 <CONSOLE_STATUS+0x250>
    80003aa4:	03200613          	li	a2,50
    80003aa8:	00007597          	auipc	a1,0x7
    80003aac:	70858593          	addi	a1,a1,1800 # 8000b1b0 <CONSOLE_STATUS+0x1a0>
    80003ab0:	00007517          	auipc	a0,0x7
    80003ab4:	78850513          	addi	a0,a0,1928 # 8000b238 <CONSOLE_STATUS+0x228>
    80003ab8:	ffffe097          	auipc	ra,0xffffe
    80003abc:	574080e7          	jalr	1396(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80003ac0:	eedff06f          	j	800039ac <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80003ac4:	00190713          	addi	a4,s2,1
    80003ac8:	2af77263          	bgeu	a4,a5,80003d6c <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80003acc:	00671793          	slli	a5,a4,0x6
    80003ad0:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80003ad4:	fde00713          	li	a4,-34
    80003ad8:	00e78c23          	sb	a4,24(a5)
    80003adc:	fc000693          	li	a3,-64
    80003ae0:	00d78ca3          	sb	a3,25(a5)
    80003ae4:	fad00693          	li	a3,-83
    80003ae8:	00d78d23          	sb	a3,26(a5)
    80003aec:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80003af0:	0104c703          	lbu	a4,16(s1)
    80003af4:	0114c683          	lbu	a3,17(s1)
    80003af8:	00869693          	slli	a3,a3,0x8
    80003afc:	00e6e6b3          	or	a3,a3,a4
    80003b00:	0124c703          	lbu	a4,18(s1)
    80003b04:	01071713          	slli	a4,a4,0x10
    80003b08:	00d766b3          	or	a3,a4,a3
    80003b0c:	0134c703          	lbu	a4,19(s1)
    80003b10:	01871713          	slli	a4,a4,0x18
    80003b14:	00d76733          	or	a4,a4,a3
    80003b18:	0144c683          	lbu	a3,20(s1)
    80003b1c:	02069693          	slli	a3,a3,0x20
    80003b20:	00e6e733          	or	a4,a3,a4
    80003b24:	0154c683          	lbu	a3,21(s1)
    80003b28:	02869693          	slli	a3,a3,0x28
    80003b2c:	00e6e6b3          	or	a3,a3,a4
    80003b30:	0164c703          	lbu	a4,22(s1)
    80003b34:	03071713          	slli	a4,a4,0x30
    80003b38:	00d766b3          	or	a3,a4,a3
    80003b3c:	0174c703          	lbu	a4,23(s1)
    80003b40:	03871713          	slli	a4,a4,0x38
    80003b44:	00d76733          	or	a4,a4,a3
    80003b48:	41270733          	sub	a4,a4,s2
    80003b4c:	fff70713          	addi	a4,a4,-1
    80003b50:	00e78823          	sb	a4,16(a5)
    80003b54:	00875693          	srli	a3,a4,0x8
    80003b58:	00d788a3          	sb	a3,17(a5)
    80003b5c:	01075693          	srli	a3,a4,0x10
    80003b60:	00d78923          	sb	a3,18(a5)
    80003b64:	0187569b          	srliw	a3,a4,0x18
    80003b68:	00d789a3          	sb	a3,19(a5)
    80003b6c:	02075693          	srli	a3,a4,0x20
    80003b70:	00d78a23          	sb	a3,20(a5)
    80003b74:	02875693          	srli	a3,a4,0x28
    80003b78:	00d78aa3          	sb	a3,21(a5)
    80003b7c:	03075693          	srli	a3,a4,0x30
    80003b80:	00d78b23          	sb	a3,22(a5)
    80003b84:	03875713          	srli	a4,a4,0x38
    80003b88:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80003b8c:	0004c703          	lbu	a4,0(s1)
    80003b90:	0014c683          	lbu	a3,1(s1)
    80003b94:	00869693          	slli	a3,a3,0x8
    80003b98:	00e6e733          	or	a4,a3,a4
    80003b9c:	0024c683          	lbu	a3,2(s1)
    80003ba0:	01069693          	slli	a3,a3,0x10
    80003ba4:	00e6e6b3          	or	a3,a3,a4
    80003ba8:	0034c703          	lbu	a4,3(s1)
    80003bac:	01871713          	slli	a4,a4,0x18
    80003bb0:	00d766b3          	or	a3,a4,a3
    80003bb4:	0044c703          	lbu	a4,4(s1)
    80003bb8:	02071713          	slli	a4,a4,0x20
    80003bbc:	00d76733          	or	a4,a4,a3
    80003bc0:	0054c683          	lbu	a3,5(s1)
    80003bc4:	02869693          	slli	a3,a3,0x28
    80003bc8:	00e6e733          	or	a4,a3,a4
    80003bcc:	0064c683          	lbu	a3,6(s1)
    80003bd0:	03069693          	slli	a3,a3,0x30
    80003bd4:	00e6e6b3          	or	a3,a3,a4
    80003bd8:	0074c703          	lbu	a4,7(s1)
    80003bdc:	03871713          	slli	a4,a4,0x38
    80003be0:	00d76733          	or	a4,a4,a3
    80003be4:	00d78023          	sb	a3,0(a5)
    80003be8:	00875693          	srli	a3,a4,0x8
    80003bec:	00d780a3          	sb	a3,1(a5)
    80003bf0:	01075693          	srli	a3,a4,0x10
    80003bf4:	00d78123          	sb	a3,2(a5)
    80003bf8:	0187569b          	srliw	a3,a4,0x18
    80003bfc:	00d781a3          	sb	a3,3(a5)
    80003c00:	02075693          	srli	a3,a4,0x20
    80003c04:	00d78223          	sb	a3,4(a5)
    80003c08:	02875693          	srli	a3,a4,0x28
    80003c0c:	00d782a3          	sb	a3,5(a5)
    80003c10:	03075693          	srli	a3,a4,0x30
    80003c14:	00d78323          	sb	a3,6(a5)
    80003c18:	03875713          	srli	a4,a4,0x38
    80003c1c:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80003c20:	00978423          	sb	s1,8(a5)
    80003c24:	0084d713          	srli	a4,s1,0x8
    80003c28:	00e784a3          	sb	a4,9(a5)
    80003c2c:	0104d713          	srli	a4,s1,0x10
    80003c30:	00e78523          	sb	a4,10(a5)
    80003c34:	0184d71b          	srliw	a4,s1,0x18
    80003c38:	00e785a3          	sb	a4,11(a5)
    80003c3c:	0204d713          	srli	a4,s1,0x20
    80003c40:	00e78623          	sb	a4,12(a5)
    80003c44:	0284d713          	srli	a4,s1,0x28
    80003c48:	00e786a3          	sb	a4,13(a5)
    80003c4c:	0304d713          	srli	a4,s1,0x30
    80003c50:	00e78723          	sb	a4,14(a5)
    80003c54:	0384d713          	srli	a4,s1,0x38
    80003c58:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    80003c5c:	0004c703          	lbu	a4,0(s1)
    80003c60:	0014c683          	lbu	a3,1(s1)
    80003c64:	00869693          	slli	a3,a3,0x8
    80003c68:	00e6e6b3          	or	a3,a3,a4
    80003c6c:	0024c703          	lbu	a4,2(s1)
    80003c70:	01071713          	slli	a4,a4,0x10
    80003c74:	00d766b3          	or	a3,a4,a3
    80003c78:	0034c703          	lbu	a4,3(s1)
    80003c7c:	01871713          	slli	a4,a4,0x18
    80003c80:	00d76733          	or	a4,a4,a3
    80003c84:	0044c683          	lbu	a3,4(s1)
    80003c88:	02069693          	slli	a3,a3,0x20
    80003c8c:	00e6e733          	or	a4,a3,a4
    80003c90:	0054c683          	lbu	a3,5(s1)
    80003c94:	02869693          	slli	a3,a3,0x28
    80003c98:	00e6e6b3          	or	a3,a3,a4
    80003c9c:	0064c703          	lbu	a4,6(s1)
    80003ca0:	03071713          	slli	a4,a4,0x30
    80003ca4:	00d766b3          	or	a3,a4,a3
    80003ca8:	0074c703          	lbu	a4,7(s1)
    80003cac:	03871713          	slli	a4,a4,0x38
    80003cb0:	00d76733          	or	a4,a4,a3
    80003cb4:	04070063          	beqz	a4,80003cf4 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003cb8:	00f70423          	sb	a5,8(a4)
    80003cbc:	0087d693          	srli	a3,a5,0x8
    80003cc0:	00d704a3          	sb	a3,9(a4)
    80003cc4:	0107d693          	srli	a3,a5,0x10
    80003cc8:	00d70523          	sb	a3,10(a4)
    80003ccc:	0187d69b          	srliw	a3,a5,0x18
    80003cd0:	00d705a3          	sb	a3,11(a4)
    80003cd4:	0207d693          	srli	a3,a5,0x20
    80003cd8:	00d70623          	sb	a3,12(a4)
    80003cdc:	0287d693          	srli	a3,a5,0x28
    80003ce0:	00d706a3          	sb	a3,13(a4)
    80003ce4:	0307d693          	srli	a3,a5,0x30
    80003ce8:	00d70723          	sb	a3,14(a4)
    80003cec:	0387d693          	srli	a3,a5,0x38
    80003cf0:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80003cf4:	00f48023          	sb	a5,0(s1)
    80003cf8:	0087d713          	srli	a4,a5,0x8
    80003cfc:	00e480a3          	sb	a4,1(s1)
    80003d00:	0107d713          	srli	a4,a5,0x10
    80003d04:	00e48123          	sb	a4,2(s1)
    80003d08:	0187d71b          	srliw	a4,a5,0x18
    80003d0c:	00e481a3          	sb	a4,3(s1)
    80003d10:	0207d713          	srli	a4,a5,0x20
    80003d14:	00e48223          	sb	a4,4(s1)
    80003d18:	0287d713          	srli	a4,a5,0x28
    80003d1c:	00e482a3          	sb	a4,5(s1)
    80003d20:	0307d713          	srli	a4,a5,0x30
    80003d24:	00e48323          	sb	a4,6(s1)
    80003d28:	0387d793          	srli	a5,a5,0x38
    80003d2c:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80003d30:	01248823          	sb	s2,16(s1)
    80003d34:	00895793          	srli	a5,s2,0x8
    80003d38:	00f488a3          	sb	a5,17(s1)
    80003d3c:	01095793          	srli	a5,s2,0x10
    80003d40:	00f48923          	sb	a5,18(s1)
    80003d44:	0189579b          	srliw	a5,s2,0x18
    80003d48:	00f489a3          	sb	a5,19(s1)
    80003d4c:	02095793          	srli	a5,s2,0x20
    80003d50:	00f48a23          	sb	a5,20(s1)
    80003d54:	02895793          	srli	a5,s2,0x28
    80003d58:	00f48aa3          	sb	a5,21(s1)
    80003d5c:	03095793          	srli	a5,s2,0x30
    80003d60:	00f48b23          	sb	a5,22(s1)
    80003d64:	03895913          	srli	s2,s2,0x38
    80003d68:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80003d6c:	0009b783          	ld	a5,0(s3)
    80003d70:	20978463          	beq	a5,s1,80003f78 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80003d74:	0084c783          	lbu	a5,8(s1)
    80003d78:	0094c703          	lbu	a4,9(s1)
    80003d7c:	00871713          	slli	a4,a4,0x8
    80003d80:	00f76733          	or	a4,a4,a5
    80003d84:	00a4c783          	lbu	a5,10(s1)
    80003d88:	01079793          	slli	a5,a5,0x10
    80003d8c:	00e7e733          	or	a4,a5,a4
    80003d90:	00b4c783          	lbu	a5,11(s1)
    80003d94:	01879793          	slli	a5,a5,0x18
    80003d98:	00e7e7b3          	or	a5,a5,a4
    80003d9c:	00c4c703          	lbu	a4,12(s1)
    80003da0:	02071713          	slli	a4,a4,0x20
    80003da4:	00f767b3          	or	a5,a4,a5
    80003da8:	00d4c703          	lbu	a4,13(s1)
    80003dac:	02871713          	slli	a4,a4,0x28
    80003db0:	00f76733          	or	a4,a4,a5
    80003db4:	00e4c783          	lbu	a5,14(s1)
    80003db8:	03079793          	slli	a5,a5,0x30
    80003dbc:	00e7e733          	or	a4,a5,a4
    80003dc0:	00f4c783          	lbu	a5,15(s1)
    80003dc4:	03879793          	slli	a5,a5,0x38
    80003dc8:	00e7e7b3          	or	a5,a5,a4
    80003dcc:	08078c63          	beqz	a5,80003e64 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80003dd0:	0004c703          	lbu	a4,0(s1)
    80003dd4:	0014c683          	lbu	a3,1(s1)
    80003dd8:	00869693          	slli	a3,a3,0x8
    80003ddc:	00e6e733          	or	a4,a3,a4
    80003de0:	0024c683          	lbu	a3,2(s1)
    80003de4:	01069693          	slli	a3,a3,0x10
    80003de8:	00e6e6b3          	or	a3,a3,a4
    80003dec:	0034c703          	lbu	a4,3(s1)
    80003df0:	01871713          	slli	a4,a4,0x18
    80003df4:	00d766b3          	or	a3,a4,a3
    80003df8:	0044c703          	lbu	a4,4(s1)
    80003dfc:	02071713          	slli	a4,a4,0x20
    80003e00:	00d76733          	or	a4,a4,a3
    80003e04:	0054c683          	lbu	a3,5(s1)
    80003e08:	02869693          	slli	a3,a3,0x28
    80003e0c:	00e6e733          	or	a4,a3,a4
    80003e10:	0064c683          	lbu	a3,6(s1)
    80003e14:	03069693          	slli	a3,a3,0x30
    80003e18:	00e6e6b3          	or	a3,a3,a4
    80003e1c:	0074c703          	lbu	a4,7(s1)
    80003e20:	03871713          	slli	a4,a4,0x38
    80003e24:	00d76733          	or	a4,a4,a3
    80003e28:	00d78023          	sb	a3,0(a5)
    80003e2c:	00875693          	srli	a3,a4,0x8
    80003e30:	00d780a3          	sb	a3,1(a5)
    80003e34:	01075693          	srli	a3,a4,0x10
    80003e38:	00d78123          	sb	a3,2(a5)
    80003e3c:	0187569b          	srliw	a3,a4,0x18
    80003e40:	00d781a3          	sb	a3,3(a5)
    80003e44:	02075693          	srli	a3,a4,0x20
    80003e48:	00d78223          	sb	a3,4(a5)
    80003e4c:	02875693          	srli	a3,a4,0x28
    80003e50:	00d782a3          	sb	a3,5(a5)
    80003e54:	03075693          	srli	a3,a4,0x30
    80003e58:	00d78323          	sb	a3,6(a5)
    80003e5c:	03875713          	srli	a4,a4,0x38
    80003e60:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003e64:	0004c783          	lbu	a5,0(s1)
    80003e68:	0014c703          	lbu	a4,1(s1)
    80003e6c:	00871713          	slli	a4,a4,0x8
    80003e70:	00f76733          	or	a4,a4,a5
    80003e74:	0024c783          	lbu	a5,2(s1)
    80003e78:	01079793          	slli	a5,a5,0x10
    80003e7c:	00e7e733          	or	a4,a5,a4
    80003e80:	0034c783          	lbu	a5,3(s1)
    80003e84:	01879793          	slli	a5,a5,0x18
    80003e88:	00e7e7b3          	or	a5,a5,a4
    80003e8c:	0044c703          	lbu	a4,4(s1)
    80003e90:	02071713          	slli	a4,a4,0x20
    80003e94:	00f767b3          	or	a5,a4,a5
    80003e98:	0054c703          	lbu	a4,5(s1)
    80003e9c:	02871713          	slli	a4,a4,0x28
    80003ea0:	00f76733          	or	a4,a4,a5
    80003ea4:	0064c783          	lbu	a5,6(s1)
    80003ea8:	03079793          	slli	a5,a5,0x30
    80003eac:	00e7e733          	or	a4,a5,a4
    80003eb0:	0074c783          	lbu	a5,7(s1)
    80003eb4:	03879793          	slli	a5,a5,0x38
    80003eb8:	00e7e7b3          	or	a5,a5,a4
    80003ebc:	08078c63          	beqz	a5,80003f54 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003ec0:	0084c703          	lbu	a4,8(s1)
    80003ec4:	0094c683          	lbu	a3,9(s1)
    80003ec8:	00869693          	slli	a3,a3,0x8
    80003ecc:	00e6e733          	or	a4,a3,a4
    80003ed0:	00a4c683          	lbu	a3,10(s1)
    80003ed4:	01069693          	slli	a3,a3,0x10
    80003ed8:	00e6e6b3          	or	a3,a3,a4
    80003edc:	00b4c703          	lbu	a4,11(s1)
    80003ee0:	01871713          	slli	a4,a4,0x18
    80003ee4:	00d766b3          	or	a3,a4,a3
    80003ee8:	00c4c703          	lbu	a4,12(s1)
    80003eec:	02071713          	slli	a4,a4,0x20
    80003ef0:	00d76733          	or	a4,a4,a3
    80003ef4:	00d4c683          	lbu	a3,13(s1)
    80003ef8:	02869693          	slli	a3,a3,0x28
    80003efc:	00e6e733          	or	a4,a3,a4
    80003f00:	00e4c683          	lbu	a3,14(s1)
    80003f04:	03069693          	slli	a3,a3,0x30
    80003f08:	00e6e6b3          	or	a3,a3,a4
    80003f0c:	00f4c703          	lbu	a4,15(s1)
    80003f10:	03871713          	slli	a4,a4,0x38
    80003f14:	00d76733          	or	a4,a4,a3
    80003f18:	00d78423          	sb	a3,8(a5)
    80003f1c:	00875693          	srli	a3,a4,0x8
    80003f20:	00d784a3          	sb	a3,9(a5)
    80003f24:	01075693          	srli	a3,a4,0x10
    80003f28:	00d78523          	sb	a3,10(a5)
    80003f2c:	0187569b          	srliw	a3,a4,0x18
    80003f30:	00d785a3          	sb	a3,11(a5)
    80003f34:	02075693          	srli	a3,a4,0x20
    80003f38:	00d78623          	sb	a3,12(a5)
    80003f3c:	02875693          	srli	a3,a4,0x28
    80003f40:	00d786a3          	sb	a3,13(a5)
    80003f44:	03075693          	srli	a3,a4,0x30
    80003f48:	00d78723          	sb	a3,14(a5)
    80003f4c:	03875713          	srli	a4,a4,0x38
    80003f50:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    80003f54:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80003f58:	00048513          	mv	a0,s1
    80003f5c:	02813083          	ld	ra,40(sp)
    80003f60:	02013403          	ld	s0,32(sp)
    80003f64:	01813483          	ld	s1,24(sp)
    80003f68:	01013903          	ld	s2,16(sp)
    80003f6c:	00813983          	ld	s3,8(sp)
    80003f70:	03010113          	addi	sp,sp,48
    80003f74:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80003f78:	0004c703          	lbu	a4,0(s1)
    80003f7c:	0014c783          	lbu	a5,1(s1)
    80003f80:	00879793          	slli	a5,a5,0x8
    80003f84:	00e7e7b3          	or	a5,a5,a4
    80003f88:	0024c703          	lbu	a4,2(s1)
    80003f8c:	01071713          	slli	a4,a4,0x10
    80003f90:	00f76733          	or	a4,a4,a5
    80003f94:	0034c783          	lbu	a5,3(s1)
    80003f98:	01879793          	slli	a5,a5,0x18
    80003f9c:	00e7e733          	or	a4,a5,a4
    80003fa0:	0044c783          	lbu	a5,4(s1)
    80003fa4:	02079793          	slli	a5,a5,0x20
    80003fa8:	00e7e7b3          	or	a5,a5,a4
    80003fac:	0054c703          	lbu	a4,5(s1)
    80003fb0:	02871713          	slli	a4,a4,0x28
    80003fb4:	00f76733          	or	a4,a4,a5
    80003fb8:	0064c783          	lbu	a5,6(s1)
    80003fbc:	03079793          	slli	a5,a5,0x30
    80003fc0:	00e7e733          	or	a4,a5,a4
    80003fc4:	0074c783          	lbu	a5,7(s1)
    80003fc8:	03879793          	slli	a5,a5,0x38
    80003fcc:	00e7e7b3          	or	a5,a5,a4
    80003fd0:	00f9b023          	sd	a5,0(s3)
    80003fd4:	da1ff06f          	j	80003d74 <_ZN11HeapManager12heapAllocateEm+0x3f4>

0000000080003fd8 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003fd8:	ff010113          	addi	sp,sp,-16
    80003fdc:	00813423          	sd	s0,8(sp)
    80003fe0:	01010413          	addi	s0,sp,16
    //     if(pFree->pNext != 0){
    //         pFree->pNext->pPrev = pFree;
    //     }
    // }
    return 0;
}
    80003fe4:	00000513          	li	a0,0
    80003fe8:	00813403          	ld	s0,8(sp)
    80003fec:	01010113          	addi	sp,sp,16
    80003ff0:	00008067          	ret

0000000080003ff4 <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"
#include "assert.h"

extern "C" void exceptionHandler(){
    80003ff4:	fc010113          	addi	sp,sp,-64
    80003ff8:	02113c23          	sd	ra,56(sp)
    80003ffc:	02813823          	sd	s0,48(sp)
    80004000:	02913423          	sd	s1,40(sp)
    80004004:	03213023          	sd	s2,32(sp)
    80004008:	01313c23          	sd	s3,24(sp)
    8000400c:	01413823          	sd	s4,16(sp)
    80004010:	01513423          	sd	s5,8(sp)
    80004014:	01613023          	sd	s6,0(sp)
    80004018:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    8000401c:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    80004020:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    80004024:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    80004028:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    8000402c:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80004030:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    80004034:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    80004038:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    8000403c:	ff870613          	addi	a2,a4,-8
    80004040:	00100693          	li	a3,1
    80004044:	04c6fc63          	bgeu	a3,a2,8000409c <exceptionHandler+0xa8>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    80004048:	00500793          	li	a5,5
    8000404c:	22f70663          	beq	a4,a5,80004278 <exceptionHandler+0x284>
                putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    80004050:	00700793          	li	a5,7
    80004054:	3ef70063          	beq	a4,a5,80004434 <exceptionHandler+0x440>
                putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    80004058:	fff00793          	li	a5,-1
    8000405c:	03f79793          	slli	a5,a5,0x3f
    80004060:	00178793          	addi	a5,a5,1
    80004064:	58f70c63          	beq	a4,a5,800045fc <exceptionHandler+0x608>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    80004068:	fff00793          	li	a5,-1
    8000406c:	03f79793          	slli	a5,a5,0x3f
    80004070:	00978793          	addi	a5,a5,9
    80004074:	0af71063          	bne	a4,a5,80004114 <exceptionHandler+0x120>
    {   
        int irq = plic_claim();
    80004078:	00005097          	auipc	ra,0x5
    8000407c:	9ac080e7          	jalr	-1620(ra) # 80008a24 <plic_claim>
    80004080:	00050493          	mv	s1,a0
        if(irq == CONSOLE_IRQ)Console::inputHandler();
    80004084:	00a00793          	li	a5,10
    80004088:	5ef50263          	beq	a0,a5,8000466c <exceptionHandler+0x678>
        plic_complete(irq);
    8000408c:	00048513          	mv	a0,s1
    80004090:	00005097          	auipc	ra,0x5
    80004094:	9cc080e7          	jalr	-1588(ra) # 80008a5c <plic_complete>
    80004098:	07c0006f          	j	80004114 <exceptionHandler+0x120>
        switch(a0){
    8000409c:	04200713          	li	a4,66
    800040a0:	02f76463          	bltu	a4,a5,800040c8 <exceptionHandler+0xd4>
    800040a4:	1c078263          	beqz	a5,80004268 <exceptionHandler+0x274>
    800040a8:	1cf76463          	bltu	a4,a5,80004270 <exceptionHandler+0x27c>
    800040ac:	00279793          	slli	a5,a5,0x2
    800040b0:	00007717          	auipc	a4,0x7
    800040b4:	23470713          	addi	a4,a4,564 # 8000b2e4 <CONSOLE_STATUS+0x2d4>
    800040b8:	00e787b3          	add	a5,a5,a4
    800040bc:	0007a783          	lw	a5,0(a5)
    800040c0:	00e787b3          	add	a5,a5,a4
    800040c4:	00078067          	jr	a5
    800040c8:	0ff00713          	li	a4,255
    800040cc:	02e79663          	bne	a5,a4,800040f8 <exceptionHandler+0x104>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800040d0:	00000793          	li	a5,0
    800040d4:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    800040d8:	00448493          	addi	s1,s1,4
    800040dc:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800040e0:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    800040e4:	10000793          	li	a5,256
    800040e8:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800040ec:	00200793          	li	a5,2
    800040f0:	1447b073          	csrc	sip,a5
                return;
    800040f4:	0200006f          	j	80004114 <exceptionHandler+0x120>
        switch(a0){
    800040f8:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    800040fc:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80004100:	00448493          	addi	s1,s1,4
    80004104:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004108:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    8000410c:	00200793          	li	a5,2
    80004110:	1447b073          	csrc	sip,a5
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    80004114:	03813083          	ld	ra,56(sp)
    80004118:	03013403          	ld	s0,48(sp)
    8000411c:	02813483          	ld	s1,40(sp)
    80004120:	02013903          	ld	s2,32(sp)
    80004124:	01813983          	ld	s3,24(sp)
    80004128:	01013a03          	ld	s4,16(sp)
    8000412c:	00813a83          	ld	s5,8(sp)
    80004130:	00013b03          	ld	s6,0(sp)
    80004134:	04010113          	addi	sp,sp,64
    80004138:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    8000413c:	00098593          	mv	a1,s3
    80004140:	0000a797          	auipc	a5,0xa
    80004144:	dc87b783          	ld	a5,-568(a5) # 8000df08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80004148:	0007b503          	ld	a0,0(a5)
    8000414c:	00000097          	auipc	ra,0x0
    80004150:	834080e7          	jalr	-1996(ra) # 80003980 <_ZN11HeapManager12heapAllocateEm>
                break;
    80004154:	fa9ff06f          	j	800040fc <exceptionHandler+0x108>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    80004158:	00098593          	mv	a1,s3
    8000415c:	0000a797          	auipc	a5,0xa
    80004160:	dac7b783          	ld	a5,-596(a5) # 8000df08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80004164:	0007b503          	ld	a0,0(a5)
    80004168:	00000097          	auipc	ra,0x0
    8000416c:	e70080e7          	jalr	-400(ra) # 80003fd8 <_ZN11HeapManager8heapFreeEPv>
                break;
    80004170:	f8dff06f          	j	800040fc <exceptionHandler+0x108>
                putc('\0'); /// removing this line causes everything to break
    80004174:	00000513          	li	a0,0
    80004178:	ffffe097          	auipc	ra,0xffffe
    8000417c:	904080e7          	jalr	-1788(ra) # 80001a7c <_Z4putcc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    80004180:	00100713          	li	a4,1
    80004184:	000b0693          	mv	a3,s6
    80004188:	000a8613          	mv	a2,s5
    8000418c:	000a0593          	mv	a1,s4
    80004190:	00098513          	mv	a0,s3
    80004194:	fffff097          	auipc	ra,0xfffff
    80004198:	ea8080e7          	jalr	-344(ra) # 8000303c <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    8000419c:	f61ff06f          	j	800040fc <exceptionHandler+0x108>
                returnVal = _thread::currentThread->exit();
    800041a0:	fffff097          	auipc	ra,0xfffff
    800041a4:	238080e7          	jalr	568(ra) # 800033d8 <_ZN7_thread4exitEv>
                break;
    800041a8:	f55ff06f          	j	800040fc <exceptionHandler+0x108>
                _thread::dispatch();
    800041ac:	fffff097          	auipc	ra,0xfffff
    800041b0:	43c080e7          	jalr	1084(ra) # 800035e8 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    800041b4:	00000513          	li	a0,0
                break;
    800041b8:	f45ff06f          	j	800040fc <exceptionHandler+0x108>
                _thread::currentThread->join((thread_t)a1);
    800041bc:	00098593          	mv	a1,s3
    800041c0:	0000a797          	auipc	a5,0xa
    800041c4:	d687b783          	ld	a5,-664(a5) # 8000df28 <_GLOBAL_OFFSET_TABLE_+0x50>
    800041c8:	0007b503          	ld	a0,0(a5)
    800041cc:	fffff097          	auipc	ra,0xfffff
    800041d0:	040080e7          	jalr	64(ra) # 8000320c <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    800041d4:	00000513          	li	a0,0
                break;
    800041d8:	f25ff06f          	j	800040fc <exceptionHandler+0x108>
                _sem::open((sem_t*)a1, unsigned(a2));
    800041dc:	000a059b          	sext.w	a1,s4
    800041e0:	00098513          	mv	a0,s3
    800041e4:	ffffe097          	auipc	ra,0xffffe
    800041e8:	8bc080e7          	jalr	-1860(ra) # 80001aa0 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    800041ec:	00000513          	li	a0,0
                break;
    800041f0:	f0dff06f          	j	800040fc <exceptionHandler+0x108>
                _sem::close((sem_t)a1);
    800041f4:	00098513          	mv	a0,s3
    800041f8:	ffffe097          	auipc	ra,0xffffe
    800041fc:	904080e7          	jalr	-1788(ra) # 80001afc <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80004200:	00000513          	li	a0,0
                break;
    80004204:	ef9ff06f          	j	800040fc <exceptionHandler+0x108>
                _sem::wait((sem_t)a1);
    80004208:	00098513          	mv	a0,s3
    8000420c:	ffffe097          	auipc	ra,0xffffe
    80004210:	950080e7          	jalr	-1712(ra) # 80001b5c <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    80004214:	00000513          	li	a0,0
                break;
    80004218:	ee5ff06f          	j	800040fc <exceptionHandler+0x108>
                _sem::signal((sem_t)a1);
    8000421c:	00098513          	mv	a0,s3
    80004220:	ffffe097          	auipc	ra,0xffffe
    80004224:	9e0080e7          	jalr	-1568(ra) # 80001c00 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80004228:	00000513          	li	a0,0
                break;
    8000422c:	ed1ff06f          	j	800040fc <exceptionHandler+0x108>
                returnVal = Timer::getInstance().sleep(a1);
    80004230:	ffffd097          	auipc	ra,0xffffd
    80004234:	40c080e7          	jalr	1036(ra) # 8000163c <_ZN5Timer11getInstanceEv>
    80004238:	00098593          	mv	a1,s3
    8000423c:	ffffd097          	auipc	ra,0xffffd
    80004240:	504080e7          	jalr	1284(ra) # 80001740 <_ZN5Timer5sleepEm>
                break;
    80004244:	eb9ff06f          	j	800040fc <exceptionHandler+0x108>
                returnVal = Console::getc();
    80004248:	ffffe097          	auipc	ra,0xffffe
    8000424c:	37c080e7          	jalr	892(ra) # 800025c4 <_ZN7Console4getcEv>
                break;
    80004250:	eadff06f          	j	800040fc <exceptionHandler+0x108>
                Console::putc(a1);
    80004254:	0ff9f513          	andi	a0,s3,255
    80004258:	ffffe097          	auipc	ra,0xffffe
    8000425c:	32c080e7          	jalr	812(ra) # 80002584 <_ZN7Console4putcEc>
    uint64 returnVal = 0;
    80004260:	00000513          	li	a0,0
                break;
    80004264:	e99ff06f          	j	800040fc <exceptionHandler+0x108>
        switch(a0){
    80004268:	00000513          	li	a0,0
    8000426c:	e91ff06f          	j	800040fc <exceptionHandler+0x108>
    80004270:	00000513          	li	a0,0
    80004274:	e89ff06f          	j	800040fc <exceptionHandler+0x108>
        putc('\n');
    80004278:	00a00513          	li	a0,10
    8000427c:	ffffe097          	auipc	ra,0xffffe
    80004280:	800080e7          	jalr	-2048(ra) # 80001a7c <_Z4putcc>
        putc('E');
    80004284:	04500513          	li	a0,69
    80004288:	ffffd097          	auipc	ra,0xffffd
    8000428c:	7f4080e7          	jalr	2036(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004290:	07200513          	li	a0,114
    80004294:	ffffd097          	auipc	ra,0xffffd
    80004298:	7e8080e7          	jalr	2024(ra) # 80001a7c <_Z4putcc>
        putc('r');
    8000429c:	07200513          	li	a0,114
    800042a0:	ffffd097          	auipc	ra,0xffffd
    800042a4:	7dc080e7          	jalr	2012(ra) # 80001a7c <_Z4putcc>
        putc('o');
    800042a8:	06f00513          	li	a0,111
    800042ac:	ffffd097          	auipc	ra,0xffffd
    800042b0:	7d0080e7          	jalr	2000(ra) # 80001a7c <_Z4putcc>
        putc('r');
    800042b4:	07200513          	li	a0,114
    800042b8:	ffffd097          	auipc	ra,0xffffd
    800042bc:	7c4080e7          	jalr	1988(ra) # 80001a7c <_Z4putcc>
        putc(':');
    800042c0:	03a00513          	li	a0,58
    800042c4:	ffffd097          	auipc	ra,0xffffd
    800042c8:	7b8080e7          	jalr	1976(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    800042cc:	02000513          	li	a0,32
    800042d0:	ffffd097          	auipc	ra,0xffffd
    800042d4:	7ac080e7          	jalr	1964(ra) # 80001a7c <_Z4putcc>
        putc('i');
    800042d8:	06900513          	li	a0,105
    800042dc:	ffffd097          	auipc	ra,0xffffd
    800042e0:	7a0080e7          	jalr	1952(ra) # 80001a7c <_Z4putcc>
        putc('l');
    800042e4:	06c00513          	li	a0,108
    800042e8:	ffffd097          	auipc	ra,0xffffd
    800042ec:	794080e7          	jalr	1940(ra) # 80001a7c <_Z4putcc>
        putc('l');
    800042f0:	06c00513          	li	a0,108
    800042f4:	ffffd097          	auipc	ra,0xffffd
    800042f8:	788080e7          	jalr	1928(ra) # 80001a7c <_Z4putcc>
        putc('e');
    800042fc:	06500513          	li	a0,101
    80004300:	ffffd097          	auipc	ra,0xffffd
    80004304:	77c080e7          	jalr	1916(ra) # 80001a7c <_Z4putcc>
        putc('g');
    80004308:	06700513          	li	a0,103
    8000430c:	ffffd097          	auipc	ra,0xffffd
    80004310:	770080e7          	jalr	1904(ra) # 80001a7c <_Z4putcc>
        putc('a');
    80004314:	06100513          	li	a0,97
    80004318:	ffffd097          	auipc	ra,0xffffd
    8000431c:	764080e7          	jalr	1892(ra) # 80001a7c <_Z4putcc>
        putc('l');
    80004320:	06c00513          	li	a0,108
    80004324:	ffffd097          	auipc	ra,0xffffd
    80004328:	758080e7          	jalr	1880(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    8000432c:	02000513          	li	a0,32
    80004330:	ffffd097          	auipc	ra,0xffffd
    80004334:	74c080e7          	jalr	1868(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004338:	07200513          	li	a0,114
    8000433c:	ffffd097          	auipc	ra,0xffffd
    80004340:	740080e7          	jalr	1856(ra) # 80001a7c <_Z4putcc>
        putc('e');
    80004344:	06500513          	li	a0,101
    80004348:	ffffd097          	auipc	ra,0xffffd
    8000434c:	734080e7          	jalr	1844(ra) # 80001a7c <_Z4putcc>
        putc('a');
    80004350:	06100513          	li	a0,97
    80004354:	ffffd097          	auipc	ra,0xffffd
    80004358:	728080e7          	jalr	1832(ra) # 80001a7c <_Z4putcc>
        putc('d');
    8000435c:	06400513          	li	a0,100
    80004360:	ffffd097          	auipc	ra,0xffffd
    80004364:	71c080e7          	jalr	1820(ra) # 80001a7c <_Z4putcc>
        putc('!');
    80004368:	02100513          	li	a0,33
    8000436c:	ffffd097          	auipc	ra,0xffffd
    80004370:	710080e7          	jalr	1808(ra) # 80001a7c <_Z4putcc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    80004374:	14102973          	csrr	s2,sepc
        putc('\n');
    80004378:	00a00513          	li	a0,10
    8000437c:	ffffd097          	auipc	ra,0xffffd
    80004380:	700080e7          	jalr	1792(ra) # 80001a7c <_Z4putcc>
        putc('P');
    80004384:	05000513          	li	a0,80
    80004388:	ffffd097          	auipc	ra,0xffffd
    8000438c:	6f4080e7          	jalr	1780(ra) # 80001a7c <_Z4putcc>
        putc('C');
    80004390:	04300513          	li	a0,67
    80004394:	ffffd097          	auipc	ra,0xffffd
    80004398:	6e8080e7          	jalr	1768(ra) # 80001a7c <_Z4putcc>
        putc(':');
    8000439c:	03a00513          	li	a0,58
    800043a0:	ffffd097          	auipc	ra,0xffffd
    800043a4:	6dc080e7          	jalr	1756(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    800043a8:	02000513          	li	a0,32
    800043ac:	ffffd097          	auipc	ra,0xffffd
    800043b0:	6d0080e7          	jalr	1744(ra) # 80001a7c <_Z4putcc>
        putc('0');
    800043b4:	03000513          	li	a0,48
    800043b8:	ffffd097          	auipc	ra,0xffffd
    800043bc:	6c4080e7          	jalr	1732(ra) # 80001a7c <_Z4putcc>
        putc('x');
    800043c0:	07800513          	li	a0,120
    800043c4:	ffffd097          	auipc	ra,0xffffd
    800043c8:	6b8080e7          	jalr	1720(ra) # 80001a7c <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    800043cc:	00f00493          	li	s1,15
    800043d0:	0140006f          	j	800043e4 <exceptionHandler+0x3f0>
                putc('A' + tmp - 10);
    800043d4:	03750513          	addi	a0,a0,55
    800043d8:	ffffd097          	auipc	ra,0xffffd
    800043dc:	6a4080e7          	jalr	1700(ra) # 80001a7c <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    800043e0:	fff4849b          	addiw	s1,s1,-1
    800043e4:	0204c463          	bltz	s1,8000440c <exceptionHandler+0x418>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    800043e8:	0024951b          	slliw	a0,s1,0x2
    800043ec:	00a95533          	srl	a0,s2,a0
    800043f0:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    800043f4:	00900793          	li	a5,9
    800043f8:	fca7eee3          	bltu	a5,a0,800043d4 <exceptionHandler+0x3e0>
                putc('0' + tmp);
    800043fc:	03050513          	addi	a0,a0,48
    80004400:	ffffd097          	auipc	ra,0xffffd
    80004404:	67c080e7          	jalr	1660(ra) # 80001a7c <_Z4putcc>
    80004408:	fd9ff06f          	j	800043e0 <exceptionHandler+0x3ec>
        assert(false);
    8000440c:	00007697          	auipc	a3,0x7
    80004410:	e7c68693          	addi	a3,a3,-388 # 8000b288 <CONSOLE_STATUS+0x278>
    80004414:	08900613          	li	a2,137
    80004418:	00007597          	auipc	a1,0x7
    8000441c:	e8858593          	addi	a1,a1,-376 # 8000b2a0 <CONSOLE_STATUS+0x290>
    80004420:	00007517          	auipc	a0,0x7
    80004424:	d2050513          	addi	a0,a0,-736 # 8000b140 <CONSOLE_STATUS+0x130>
    80004428:	ffffe097          	auipc	ra,0xffffe
    8000442c:	c04080e7          	jalr	-1020(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80004430:	ce5ff06f          	j	80004114 <exceptionHandler+0x120>
        putc('\n');
    80004434:	00a00513          	li	a0,10
    80004438:	ffffd097          	auipc	ra,0xffffd
    8000443c:	644080e7          	jalr	1604(ra) # 80001a7c <_Z4putcc>
        putc('E');
    80004440:	04500513          	li	a0,69
    80004444:	ffffd097          	auipc	ra,0xffffd
    80004448:	638080e7          	jalr	1592(ra) # 80001a7c <_Z4putcc>
        putc('r');
    8000444c:	07200513          	li	a0,114
    80004450:	ffffd097          	auipc	ra,0xffffd
    80004454:	62c080e7          	jalr	1580(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004458:	07200513          	li	a0,114
    8000445c:	ffffd097          	auipc	ra,0xffffd
    80004460:	620080e7          	jalr	1568(ra) # 80001a7c <_Z4putcc>
        putc('o');
    80004464:	06f00513          	li	a0,111
    80004468:	ffffd097          	auipc	ra,0xffffd
    8000446c:	614080e7          	jalr	1556(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004470:	07200513          	li	a0,114
    80004474:	ffffd097          	auipc	ra,0xffffd
    80004478:	608080e7          	jalr	1544(ra) # 80001a7c <_Z4putcc>
        putc(':');
    8000447c:	03a00513          	li	a0,58
    80004480:	ffffd097          	auipc	ra,0xffffd
    80004484:	5fc080e7          	jalr	1532(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    80004488:	02000513          	li	a0,32
    8000448c:	ffffd097          	auipc	ra,0xffffd
    80004490:	5f0080e7          	jalr	1520(ra) # 80001a7c <_Z4putcc>
        putc('i');
    80004494:	06900513          	li	a0,105
    80004498:	ffffd097          	auipc	ra,0xffffd
    8000449c:	5e4080e7          	jalr	1508(ra) # 80001a7c <_Z4putcc>
        putc('l');
    800044a0:	06c00513          	li	a0,108
    800044a4:	ffffd097          	auipc	ra,0xffffd
    800044a8:	5d8080e7          	jalr	1496(ra) # 80001a7c <_Z4putcc>
        putc('l');
    800044ac:	06c00513          	li	a0,108
    800044b0:	ffffd097          	auipc	ra,0xffffd
    800044b4:	5cc080e7          	jalr	1484(ra) # 80001a7c <_Z4putcc>
        putc('e');
    800044b8:	06500513          	li	a0,101
    800044bc:	ffffd097          	auipc	ra,0xffffd
    800044c0:	5c0080e7          	jalr	1472(ra) # 80001a7c <_Z4putcc>
        putc('g');
    800044c4:	06700513          	li	a0,103
    800044c8:	ffffd097          	auipc	ra,0xffffd
    800044cc:	5b4080e7          	jalr	1460(ra) # 80001a7c <_Z4putcc>
        putc('a');
    800044d0:	06100513          	li	a0,97
    800044d4:	ffffd097          	auipc	ra,0xffffd
    800044d8:	5a8080e7          	jalr	1448(ra) # 80001a7c <_Z4putcc>
        putc('l');
    800044dc:	06c00513          	li	a0,108
    800044e0:	ffffd097          	auipc	ra,0xffffd
    800044e4:	59c080e7          	jalr	1436(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    800044e8:	02000513          	li	a0,32
    800044ec:	ffffd097          	auipc	ra,0xffffd
    800044f0:	590080e7          	jalr	1424(ra) # 80001a7c <_Z4putcc>
        putc('w');
    800044f4:	07700513          	li	a0,119
    800044f8:	ffffd097          	auipc	ra,0xffffd
    800044fc:	584080e7          	jalr	1412(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004500:	07200513          	li	a0,114
    80004504:	ffffd097          	auipc	ra,0xffffd
    80004508:	578080e7          	jalr	1400(ra) # 80001a7c <_Z4putcc>
        putc('i');
    8000450c:	06900513          	li	a0,105
    80004510:	ffffd097          	auipc	ra,0xffffd
    80004514:	56c080e7          	jalr	1388(ra) # 80001a7c <_Z4putcc>
        putc('t');
    80004518:	07400513          	li	a0,116
    8000451c:	ffffd097          	auipc	ra,0xffffd
    80004520:	560080e7          	jalr	1376(ra) # 80001a7c <_Z4putcc>
        putc('e');
    80004524:	06500513          	li	a0,101
    80004528:	ffffd097          	auipc	ra,0xffffd
    8000452c:	554080e7          	jalr	1364(ra) # 80001a7c <_Z4putcc>
        putc('!');
    80004530:	02100513          	li	a0,33
    80004534:	ffffd097          	auipc	ra,0xffffd
    80004538:	548080e7          	jalr	1352(ra) # 80001a7c <_Z4putcc>
        __asm__ volatile("csrr %0, sepc" : "=r"(pc));
    8000453c:	14102973          	csrr	s2,sepc
        putc('\n');
    80004540:	00a00513          	li	a0,10
    80004544:	ffffd097          	auipc	ra,0xffffd
    80004548:	538080e7          	jalr	1336(ra) # 80001a7c <_Z4putcc>
        putc('P');
    8000454c:	05000513          	li	a0,80
    80004550:	ffffd097          	auipc	ra,0xffffd
    80004554:	52c080e7          	jalr	1324(ra) # 80001a7c <_Z4putcc>
        putc('C');
    80004558:	04300513          	li	a0,67
    8000455c:	ffffd097          	auipc	ra,0xffffd
    80004560:	520080e7          	jalr	1312(ra) # 80001a7c <_Z4putcc>
        putc(':');
    80004564:	03a00513          	li	a0,58
    80004568:	ffffd097          	auipc	ra,0xffffd
    8000456c:	514080e7          	jalr	1300(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    80004570:	02000513          	li	a0,32
    80004574:	ffffd097          	auipc	ra,0xffffd
    80004578:	508080e7          	jalr	1288(ra) # 80001a7c <_Z4putcc>
        putc('0');
    8000457c:	03000513          	li	a0,48
    80004580:	ffffd097          	auipc	ra,0xffffd
    80004584:	4fc080e7          	jalr	1276(ra) # 80001a7c <_Z4putcc>
        putc('x');
    80004588:	07800513          	li	a0,120
    8000458c:	ffffd097          	auipc	ra,0xffffd
    80004590:	4f0080e7          	jalr	1264(ra) # 80001a7c <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004594:	00f00493          	li	s1,15
    80004598:	0140006f          	j	800045ac <exceptionHandler+0x5b8>
                putc('A' + tmp - 10);
    8000459c:	03750513          	addi	a0,a0,55
    800045a0:	ffffd097          	auipc	ra,0xffffd
    800045a4:	4dc080e7          	jalr	1244(ra) # 80001a7c <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    800045a8:	fff4849b          	addiw	s1,s1,-1
    800045ac:	0204c463          	bltz	s1,800045d4 <exceptionHandler+0x5e0>
            uint64 tmp = (pc >> (i * 4)) & 0xF;
    800045b0:	0024951b          	slliw	a0,s1,0x2
    800045b4:	00a95533          	srl	a0,s2,a0
    800045b8:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    800045bc:	00900793          	li	a5,9
    800045c0:	fca7eee3          	bltu	a5,a0,8000459c <exceptionHandler+0x5a8>
                putc('0' + tmp);
    800045c4:	03050513          	addi	a0,a0,48
    800045c8:	ffffd097          	auipc	ra,0xffffd
    800045cc:	4b4080e7          	jalr	1204(ra) # 80001a7c <_Z4putcc>
    800045d0:	fd9ff06f          	j	800045a8 <exceptionHandler+0x5b4>
        assert(false);
    800045d4:	00007697          	auipc	a3,0x7
    800045d8:	cb468693          	addi	a3,a3,-844 # 8000b288 <CONSOLE_STATUS+0x278>
    800045dc:	0b300613          	li	a2,179
    800045e0:	00007597          	auipc	a1,0x7
    800045e4:	cc058593          	addi	a1,a1,-832 # 8000b2a0 <CONSOLE_STATUS+0x290>
    800045e8:	00007517          	auipc	a0,0x7
    800045ec:	b5850513          	addi	a0,a0,-1192 # 8000b140 <CONSOLE_STATUS+0x130>
    800045f0:	ffffe097          	auipc	ra,0xffffe
    800045f4:	a3c080e7          	jalr	-1476(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800045f8:	b1dff06f          	j	80004114 <exceptionHandler+0x120>
        putc('t');
    800045fc:	07400513          	li	a0,116
    80004600:	ffffd097          	auipc	ra,0xffffd
    80004604:	47c080e7          	jalr	1148(ra) # 80001a7c <_Z4putcc>
        Timer::getInstance().tick();
    80004608:	ffffd097          	auipc	ra,0xffffd
    8000460c:	034080e7          	jalr	52(ra) # 8000163c <_ZN5Timer11getInstanceEv>
    80004610:	ffffd097          	auipc	ra,0xffffd
    80004614:	090080e7          	jalr	144(ra) # 800016a0 <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    80004618:	0000a797          	auipc	a5,0xa
    8000461c:	9107b783          	ld	a5,-1776(a5) # 8000df28 <_GLOBAL_OFFSET_TABLE_+0x50>
    80004620:	0007b503          	ld	a0,0(a5)
    80004624:	fffff097          	auipc	ra,0xfffff
    80004628:	d0c080e7          	jalr	-756(ra) # 80003330 <_ZN7_thread4tickEv>
    8000462c:	00051c63          	bnez	a0,80004644 <exceptionHandler+0x650>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80004630:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004634:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80004638:	00200793          	li	a5,2
    8000463c:	1447b073          	csrc	sip,a5
    80004640:	ad5ff06f          	j	80004114 <exceptionHandler+0x120>
        assert(_thread::currentThread->tick() == 0);
    80004644:	00007697          	auipc	a3,0x7
    80004648:	c4468693          	addi	a3,a3,-956 # 8000b288 <CONSOLE_STATUS+0x278>
    8000464c:	0b800613          	li	a2,184
    80004650:	00007597          	auipc	a1,0x7
    80004654:	c5058593          	addi	a1,a1,-944 # 8000b2a0 <CONSOLE_STATUS+0x290>
    80004658:	00007517          	auipc	a0,0x7
    8000465c:	c6850513          	addi	a0,a0,-920 # 8000b2c0 <CONSOLE_STATUS+0x2b0>
    80004660:	ffffe097          	auipc	ra,0xffffe
    80004664:	9cc080e7          	jalr	-1588(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80004668:	fc9ff06f          	j	80004630 <exceptionHandler+0x63c>
        if(irq == CONSOLE_IRQ)Console::inputHandler();
    8000466c:	ffffe097          	auipc	ra,0xffffe
    80004670:	078080e7          	jalr	120(ra) # 800026e4 <_ZN7Console12inputHandlerEv>
    80004674:	a19ff06f          	j	8000408c <exceptionHandler+0x98>

0000000080004678 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80004678:	fe010113          	addi	sp,sp,-32
    8000467c:	00113c23          	sd	ra,24(sp)
    80004680:	00813823          	sd	s0,16(sp)
    80004684:	00913423          	sd	s1,8(sp)
    80004688:	02010413          	addi	s0,sp,32
    8000468c:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80004690:	0000a797          	auipc	a5,0xa
    80004694:	9187b783          	ld	a5,-1768(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004698:	02079463          	bnez	a5,800046c0 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    8000469c:	0000a797          	auipc	a5,0xa
    800046a0:	9097b623          	sd	s1,-1780(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    head = 0;
    800046a4:	0004b023          	sd	zero,0(s1)
    tail = 0;
    800046a8:	0004b423          	sd	zero,8(s1)
}
    800046ac:	01813083          	ld	ra,24(sp)
    800046b0:	01013403          	ld	s0,16(sp)
    800046b4:	00813483          	ld	s1,8(sp)
    800046b8:	02010113          	addi	sp,sp,32
    800046bc:	00008067          	ret
    assert(singleton == 0);
    800046c0:	00007697          	auipc	a3,0x7
    800046c4:	d3068693          	addi	a3,a3,-720 # 8000b3f0 <CONSOLE_STATUS+0x3e0>
    800046c8:	01800613          	li	a2,24
    800046cc:	00007597          	auipc	a1,0x7
    800046d0:	d3c58593          	addi	a1,a1,-708 # 8000b408 <CONSOLE_STATUS+0x3f8>
    800046d4:	00007517          	auipc	a0,0x7
    800046d8:	d4450513          	addi	a0,a0,-700 # 8000b418 <CONSOLE_STATUS+0x408>
    800046dc:	ffffe097          	auipc	ra,0xffffe
    800046e0:	950080e7          	jalr	-1712(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800046e4:	fb9ff06f          	j	8000469c <_ZN9SchedulerC1Ev+0x24>

00000000800046e8 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    800046e8:	ff010113          	addi	sp,sp,-16
    800046ec:	00813423          	sd	s0,8(sp)
    800046f0:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    800046f4:	0000a797          	auipc	a5,0xa
    800046f8:	8b47b783          	ld	a5,-1868(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    800046fc:	0007b503          	ld	a0,0(a5)
}
    80004700:	00153513          	seqz	a0,a0
    80004704:	00813403          	ld	s0,8(sp)
    80004708:	01010113          	addi	sp,sp,16
    8000470c:	00008067          	ret

0000000080004710 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80004710:	fe010113          	addi	sp,sp,-32
    80004714:	00113c23          	sd	ra,24(sp)
    80004718:	00813823          	sd	s0,16(sp)
    8000471c:	00913423          	sd	s1,8(sp)
    80004720:	01213023          	sd	s2,0(sp)
    80004724:	02010413          	addi	s0,sp,32
    80004728:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    8000472c:	0000a917          	auipc	s2,0xa
    80004730:	87c93903          	ld	s2,-1924(s2) # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004734:	00093783          	ld	a5,0(s2)
    80004738:	12078c63          	beqz	a5,80004870 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    8000473c:	00893903          	ld	s2,8(s2)
    80004740:	01000513          	li	a0,16
    80004744:	ffffd097          	auipc	ra,0xffffd
    80004748:	0ec080e7          	jalr	236(ra) # 80001830 <_Z9mem_allocm>
    8000474c:	00a90423          	sb	a0,8(s2)
    80004750:	00855793          	srli	a5,a0,0x8
    80004754:	00f904a3          	sb	a5,9(s2)
    80004758:	01055793          	srli	a5,a0,0x10
    8000475c:	00f90523          	sb	a5,10(s2)
    80004760:	0185579b          	srliw	a5,a0,0x18
    80004764:	00f905a3          	sb	a5,11(s2)
    80004768:	02055793          	srli	a5,a0,0x20
    8000476c:	00f90623          	sb	a5,12(s2)
    80004770:	02855793          	srli	a5,a0,0x28
    80004774:	00f906a3          	sb	a5,13(s2)
    80004778:	03055793          	srli	a5,a0,0x30
    8000477c:	00f90723          	sb	a5,14(s2)
    80004780:	03855513          	srli	a0,a0,0x38
    80004784:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80004788:	0000a617          	auipc	a2,0xa
    8000478c:	82060613          	addi	a2,a2,-2016 # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004790:	00063583          	ld	a1,0(a2)
    80004794:	0085b703          	ld	a4,8(a1)
    80004798:	00874783          	lbu	a5,8(a4)
    8000479c:	00974683          	lbu	a3,9(a4)
    800047a0:	00869693          	slli	a3,a3,0x8
    800047a4:	00f6e6b3          	or	a3,a3,a5
    800047a8:	00a74783          	lbu	a5,10(a4)
    800047ac:	01079793          	slli	a5,a5,0x10
    800047b0:	00d7e6b3          	or	a3,a5,a3
    800047b4:	00b74783          	lbu	a5,11(a4)
    800047b8:	01879793          	slli	a5,a5,0x18
    800047bc:	00d7e7b3          	or	a5,a5,a3
    800047c0:	00c74683          	lbu	a3,12(a4)
    800047c4:	02069693          	slli	a3,a3,0x20
    800047c8:	00f6e7b3          	or	a5,a3,a5
    800047cc:	00d74683          	lbu	a3,13(a4)
    800047d0:	02869693          	slli	a3,a3,0x28
    800047d4:	00f6e6b3          	or	a3,a3,a5
    800047d8:	00e74783          	lbu	a5,14(a4)
    800047dc:	03079793          	slli	a5,a5,0x30
    800047e0:	00d7e6b3          	or	a3,a5,a3
    800047e4:	00f74783          	lbu	a5,15(a4)
    800047e8:	03879793          	slli	a5,a5,0x38
    800047ec:	00d7e7b3          	or	a5,a5,a3
    800047f0:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    800047f4:	00978023          	sb	s1,0(a5)
    800047f8:	0084d713          	srli	a4,s1,0x8
    800047fc:	00e780a3          	sb	a4,1(a5)
    80004800:	0104d713          	srli	a4,s1,0x10
    80004804:	00e78123          	sb	a4,2(a5)
    80004808:	0184d71b          	srliw	a4,s1,0x18
    8000480c:	00e781a3          	sb	a4,3(a5)
    80004810:	0204d713          	srli	a4,s1,0x20
    80004814:	00e78223          	sb	a4,4(a5)
    80004818:	0284d713          	srli	a4,s1,0x28
    8000481c:	00e782a3          	sb	a4,5(a5)
    80004820:	0304d713          	srli	a4,s1,0x30
    80004824:	00e78323          	sb	a4,6(a5)
    80004828:	0384d493          	srli	s1,s1,0x38
    8000482c:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80004830:	00063783          	ld	a5,0(a2)
    80004834:	0087b783          	ld	a5,8(a5)
    80004838:	00078423          	sb	zero,8(a5)
    8000483c:	000784a3          	sb	zero,9(a5)
    80004840:	00078523          	sb	zero,10(a5)
    80004844:	000785a3          	sb	zero,11(a5)
    80004848:	00078623          	sb	zero,12(a5)
    8000484c:	000786a3          	sb	zero,13(a5)
    80004850:	00078723          	sb	zero,14(a5)
    80004854:	000787a3          	sb	zero,15(a5)
    }
}
    80004858:	01813083          	ld	ra,24(sp)
    8000485c:	01013403          	ld	s0,16(sp)
    80004860:	00813483          	ld	s1,8(sp)
    80004864:	00013903          	ld	s2,0(sp)
    80004868:	02010113          	addi	sp,sp,32
    8000486c:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80004870:	01000513          	li	a0,16
    80004874:	ffffd097          	auipc	ra,0xffffd
    80004878:	fbc080e7          	jalr	-68(ra) # 80001830 <_Z9mem_allocm>
    8000487c:	00a93423          	sd	a0,8(s2)
    80004880:	00009717          	auipc	a4,0x9
    80004884:	72870713          	addi	a4,a4,1832 # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004888:	00073783          	ld	a5,0(a4)
    8000488c:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80004890:	00073783          	ld	a5,0(a4)
    80004894:	0007b783          	ld	a5,0(a5)
    80004898:	00978023          	sb	s1,0(a5)
    8000489c:	0084d693          	srli	a3,s1,0x8
    800048a0:	00d780a3          	sb	a3,1(a5)
    800048a4:	0104d693          	srli	a3,s1,0x10
    800048a8:	00d78123          	sb	a3,2(a5)
    800048ac:	0184d69b          	srliw	a3,s1,0x18
    800048b0:	00d781a3          	sb	a3,3(a5)
    800048b4:	0204d693          	srli	a3,s1,0x20
    800048b8:	00d78223          	sb	a3,4(a5)
    800048bc:	0284d693          	srli	a3,s1,0x28
    800048c0:	00d782a3          	sb	a3,5(a5)
    800048c4:	0304d693          	srli	a3,s1,0x30
    800048c8:	00d78323          	sb	a3,6(a5)
    800048cc:	0384d493          	srli	s1,s1,0x38
    800048d0:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    800048d4:	00073783          	ld	a5,0(a4)
    800048d8:	0007b783          	ld	a5,0(a5)
    800048dc:	00078423          	sb	zero,8(a5)
    800048e0:	000784a3          	sb	zero,9(a5)
    800048e4:	00078523          	sb	zero,10(a5)
    800048e8:	000785a3          	sb	zero,11(a5)
    800048ec:	00078623          	sb	zero,12(a5)
    800048f0:	000786a3          	sb	zero,13(a5)
    800048f4:	00078723          	sb	zero,14(a5)
    800048f8:	000787a3          	sb	zero,15(a5)
    800048fc:	f5dff06f          	j	80004858 <_ZN9Scheduler3putEP7_thread+0x148>

0000000080004900 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80004900:	fe010113          	addi	sp,sp,-32
    80004904:	00113c23          	sd	ra,24(sp)
    80004908:	00813823          	sd	s0,16(sp)
    8000490c:	00913423          	sd	s1,8(sp)
    80004910:	02010413          	addi	s0,sp,32
    ThreadList* tmp = singleton->head;
    80004914:	00009697          	auipc	a3,0x9
    80004918:	6946b683          	ld	a3,1684(a3) # 8000dfa8 <_ZN9Scheduler9singletonE>
    8000491c:	0006b503          	ld	a0,0(a3)
    if(tmp == 0){
    80004920:	0e050863          	beqz	a0,80004a10 <_ZN9Scheduler3getEv+0x110>
        return 0;
    }
    thread_t thread = tmp->thread;
    80004924:	00054483          	lbu	s1,0(a0)
    80004928:	00154783          	lbu	a5,1(a0)
    8000492c:	00879793          	slli	a5,a5,0x8
    80004930:	0097e7b3          	or	a5,a5,s1
    80004934:	00254483          	lbu	s1,2(a0)
    80004938:	01049493          	slli	s1,s1,0x10
    8000493c:	00f4e7b3          	or	a5,s1,a5
    80004940:	00354483          	lbu	s1,3(a0)
    80004944:	01849493          	slli	s1,s1,0x18
    80004948:	00f4e4b3          	or	s1,s1,a5
    8000494c:	00454783          	lbu	a5,4(a0)
    80004950:	02079793          	slli	a5,a5,0x20
    80004954:	0097e4b3          	or	s1,a5,s1
    80004958:	00554783          	lbu	a5,5(a0)
    8000495c:	02879793          	slli	a5,a5,0x28
    80004960:	0097e7b3          	or	a5,a5,s1
    80004964:	00654483          	lbu	s1,6(a0)
    80004968:	03049493          	slli	s1,s1,0x30
    8000496c:	00f4e7b3          	or	a5,s1,a5
    80004970:	00754483          	lbu	s1,7(a0)
    80004974:	03849493          	slli	s1,s1,0x38
    80004978:	00f4e4b3          	or	s1,s1,a5
    singleton->head = tmp->next;
    8000497c:	00854783          	lbu	a5,8(a0)
    80004980:	00954703          	lbu	a4,9(a0)
    80004984:	00871713          	slli	a4,a4,0x8
    80004988:	00f76733          	or	a4,a4,a5
    8000498c:	00a54783          	lbu	a5,10(a0)
    80004990:	01079793          	slli	a5,a5,0x10
    80004994:	00e7e733          	or	a4,a5,a4
    80004998:	00b54783          	lbu	a5,11(a0)
    8000499c:	01879793          	slli	a5,a5,0x18
    800049a0:	00e7e7b3          	or	a5,a5,a4
    800049a4:	00c54703          	lbu	a4,12(a0)
    800049a8:	02071713          	slli	a4,a4,0x20
    800049ac:	00f767b3          	or	a5,a4,a5
    800049b0:	00d54703          	lbu	a4,13(a0)
    800049b4:	02871713          	slli	a4,a4,0x28
    800049b8:	00f76733          	or	a4,a4,a5
    800049bc:	00e54783          	lbu	a5,14(a0)
    800049c0:	03079793          	slli	a5,a5,0x30
    800049c4:	00e7e733          	or	a4,a5,a4
    800049c8:	00f54783          	lbu	a5,15(a0)
    800049cc:	03879793          	slli	a5,a5,0x38
    800049d0:	00e7e7b3          	or	a5,a5,a4
    800049d4:	00f6b023          	sd	a5,0(a3)
    if(singleton->head == 0){
    800049d8:	00009797          	auipc	a5,0x9
    800049dc:	5d07b783          	ld	a5,1488(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    800049e0:	0007b703          	ld	a4,0(a5)
    800049e4:	02070263          	beqz	a4,80004a08 <_ZN9Scheduler3getEv+0x108>
        singleton->tail = 0;
    }
    mem_free(tmp);
    800049e8:	ffffd097          	auipc	ra,0xffffd
    800049ec:	e78080e7          	jalr	-392(ra) # 80001860 <_Z8mem_freePv>
    return thread;
}
    800049f0:	00048513          	mv	a0,s1
    800049f4:	01813083          	ld	ra,24(sp)
    800049f8:	01013403          	ld	s0,16(sp)
    800049fc:	00813483          	ld	s1,8(sp)
    80004a00:	02010113          	addi	sp,sp,32
    80004a04:	00008067          	ret
        singleton->tail = 0;
    80004a08:	0007b423          	sd	zero,8(a5)
    80004a0c:	fddff06f          	j	800049e8 <_ZN9Scheduler3getEv+0xe8>
        return 0;
    80004a10:	00050493          	mv	s1,a0
    80004a14:	fddff06f          	j	800049f0 <_ZN9Scheduler3getEv+0xf0>

0000000080004a18 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80004a18:	ff010113          	addi	sp,sp,-16
    80004a1c:	00813423          	sd	s0,8(sp)
    80004a20:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80004a24:	00009797          	auipc	a5,0x9
    80004a28:	5847b783          	ld	a5,1412(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004a2c:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80004a30:	00000513          	li	a0,0
    while(tmp != 0){
    80004a34:	06078263          	beqz	a5,80004a98 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80004a38:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80004a3c:	0087c683          	lbu	a3,8(a5)
    80004a40:	0097c703          	lbu	a4,9(a5)
    80004a44:	00871713          	slli	a4,a4,0x8
    80004a48:	00d766b3          	or	a3,a4,a3
    80004a4c:	00a7c703          	lbu	a4,10(a5)
    80004a50:	01071713          	slli	a4,a4,0x10
    80004a54:	00d76733          	or	a4,a4,a3
    80004a58:	00b7c683          	lbu	a3,11(a5)
    80004a5c:	01869693          	slli	a3,a3,0x18
    80004a60:	00e6e733          	or	a4,a3,a4
    80004a64:	00c7c683          	lbu	a3,12(a5)
    80004a68:	02069693          	slli	a3,a3,0x20
    80004a6c:	00e6e6b3          	or	a3,a3,a4
    80004a70:	00d7c703          	lbu	a4,13(a5)
    80004a74:	02871713          	slli	a4,a4,0x28
    80004a78:	00d766b3          	or	a3,a4,a3
    80004a7c:	00e7c703          	lbu	a4,14(a5)
    80004a80:	03071713          	slli	a4,a4,0x30
    80004a84:	00d76733          	or	a4,a4,a3
    80004a88:	00f7c783          	lbu	a5,15(a5)
    80004a8c:	03879793          	slli	a5,a5,0x38
    80004a90:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80004a94:	fa1ff06f          	j	80004a34 <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80004a98:	00813403          	ld	s0,8(sp)
    80004a9c:	01010113          	addi	sp,sp,16
    80004aa0:	00008067          	ret

0000000080004aa4 <_ZN6BufferC1Ei>:
#include "../test_h/buffer.h"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004aa4:	fe010113          	addi	sp,sp,-32
    80004aa8:	00113c23          	sd	ra,24(sp)
    80004aac:	00813823          	sd	s0,16(sp)
    80004ab0:	00913423          	sd	s1,8(sp)
    80004ab4:	01213023          	sd	s2,0(sp)
    80004ab8:	02010413          	addi	s0,sp,32
    80004abc:	00050493          	mv	s1,a0
    80004ac0:	00058913          	mv	s2,a1
    80004ac4:	0015879b          	addiw	a5,a1,1
    80004ac8:	0007851b          	sext.w	a0,a5
    80004acc:	00f4a023          	sw	a5,0(s1)
    80004ad0:	0004a823          	sw	zero,16(s1)
    80004ad4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004ad8:	00251513          	slli	a0,a0,0x2
    80004adc:	ffffd097          	auipc	ra,0xffffd
    80004ae0:	d54080e7          	jalr	-684(ra) # 80001830 <_Z9mem_allocm>
    80004ae4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80004ae8:	00000593          	li	a1,0
    80004aec:	02048513          	addi	a0,s1,32
    80004af0:	ffffd097          	auipc	ra,0xffffd
    80004af4:	ea8080e7          	jalr	-344(ra) # 80001998 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80004af8:	00090593          	mv	a1,s2
    80004afc:	01848513          	addi	a0,s1,24
    80004b00:	ffffd097          	auipc	ra,0xffffd
    80004b04:	e98080e7          	jalr	-360(ra) # 80001998 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80004b08:	00100593          	li	a1,1
    80004b0c:	02848513          	addi	a0,s1,40
    80004b10:	ffffd097          	auipc	ra,0xffffd
    80004b14:	e88080e7          	jalr	-376(ra) # 80001998 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80004b18:	00100593          	li	a1,1
    80004b1c:	03048513          	addi	a0,s1,48
    80004b20:	ffffd097          	auipc	ra,0xffffd
    80004b24:	e78080e7          	jalr	-392(ra) # 80001998 <_Z8sem_openPP4_semj>
}
    80004b28:	01813083          	ld	ra,24(sp)
    80004b2c:	01013403          	ld	s0,16(sp)
    80004b30:	00813483          	ld	s1,8(sp)
    80004b34:	00013903          	ld	s2,0(sp)
    80004b38:	02010113          	addi	sp,sp,32
    80004b3c:	00008067          	ret

0000000080004b40 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80004b40:	fe010113          	addi	sp,sp,-32
    80004b44:	00113c23          	sd	ra,24(sp)
    80004b48:	00813823          	sd	s0,16(sp)
    80004b4c:	00913423          	sd	s1,8(sp)
    80004b50:	01213023          	sd	s2,0(sp)
    80004b54:	02010413          	addi	s0,sp,32
    80004b58:	00050493          	mv	s1,a0
    80004b5c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80004b60:	01853503          	ld	a0,24(a0)
    80004b64:	ffffd097          	auipc	ra,0xffffd
    80004b68:	e98080e7          	jalr	-360(ra) # 800019fc <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80004b6c:	0304b503          	ld	a0,48(s1)
    80004b70:	ffffd097          	auipc	ra,0xffffd
    80004b74:	e8c080e7          	jalr	-372(ra) # 800019fc <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80004b78:	0084b783          	ld	a5,8(s1)
    80004b7c:	0144a703          	lw	a4,20(s1)
    80004b80:	00271713          	slli	a4,a4,0x2
    80004b84:	00e787b3          	add	a5,a5,a4
    80004b88:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004b8c:	0144a783          	lw	a5,20(s1)
    80004b90:	0017879b          	addiw	a5,a5,1
    80004b94:	0004a703          	lw	a4,0(s1)
    80004b98:	02e7e7bb          	remw	a5,a5,a4
    80004b9c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80004ba0:	0304b503          	ld	a0,48(s1)
    80004ba4:	ffffd097          	auipc	ra,0xffffd
    80004ba8:	e84080e7          	jalr	-380(ra) # 80001a28 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80004bac:	0204b503          	ld	a0,32(s1)
    80004bb0:	ffffd097          	auipc	ra,0xffffd
    80004bb4:	e78080e7          	jalr	-392(ra) # 80001a28 <_Z10sem_signalP4_sem>

}
    80004bb8:	01813083          	ld	ra,24(sp)
    80004bbc:	01013403          	ld	s0,16(sp)
    80004bc0:	00813483          	ld	s1,8(sp)
    80004bc4:	00013903          	ld	s2,0(sp)
    80004bc8:	02010113          	addi	sp,sp,32
    80004bcc:	00008067          	ret

0000000080004bd0 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80004bd0:	fe010113          	addi	sp,sp,-32
    80004bd4:	00113c23          	sd	ra,24(sp)
    80004bd8:	00813823          	sd	s0,16(sp)
    80004bdc:	00913423          	sd	s1,8(sp)
    80004be0:	01213023          	sd	s2,0(sp)
    80004be4:	02010413          	addi	s0,sp,32
    80004be8:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80004bec:	02053503          	ld	a0,32(a0)
    80004bf0:	ffffd097          	auipc	ra,0xffffd
    80004bf4:	e0c080e7          	jalr	-500(ra) # 800019fc <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80004bf8:	0284b503          	ld	a0,40(s1)
    80004bfc:	ffffd097          	auipc	ra,0xffffd
    80004c00:	e00080e7          	jalr	-512(ra) # 800019fc <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80004c04:	0084b703          	ld	a4,8(s1)
    80004c08:	0104a783          	lw	a5,16(s1)
    80004c0c:	00279693          	slli	a3,a5,0x2
    80004c10:	00d70733          	add	a4,a4,a3
    80004c14:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004c18:	0017879b          	addiw	a5,a5,1
    80004c1c:	0004a703          	lw	a4,0(s1)
    80004c20:	02e7e7bb          	remw	a5,a5,a4
    80004c24:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80004c28:	0284b503          	ld	a0,40(s1)
    80004c2c:	ffffd097          	auipc	ra,0xffffd
    80004c30:	dfc080e7          	jalr	-516(ra) # 80001a28 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80004c34:	0184b503          	ld	a0,24(s1)
    80004c38:	ffffd097          	auipc	ra,0xffffd
    80004c3c:	df0080e7          	jalr	-528(ra) # 80001a28 <_Z10sem_signalP4_sem>

    return ret;
}
    80004c40:	00090513          	mv	a0,s2
    80004c44:	01813083          	ld	ra,24(sp)
    80004c48:	01013403          	ld	s0,16(sp)
    80004c4c:	00813483          	ld	s1,8(sp)
    80004c50:	00013903          	ld	s2,0(sp)
    80004c54:	02010113          	addi	sp,sp,32
    80004c58:	00008067          	ret

0000000080004c5c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80004c5c:	fe010113          	addi	sp,sp,-32
    80004c60:	00113c23          	sd	ra,24(sp)
    80004c64:	00813823          	sd	s0,16(sp)
    80004c68:	00913423          	sd	s1,8(sp)
    80004c6c:	01213023          	sd	s2,0(sp)
    80004c70:	02010413          	addi	s0,sp,32
    80004c74:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80004c78:	02853503          	ld	a0,40(a0)
    80004c7c:	ffffd097          	auipc	ra,0xffffd
    80004c80:	d80080e7          	jalr	-640(ra) # 800019fc <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80004c84:	0304b503          	ld	a0,48(s1)
    80004c88:	ffffd097          	auipc	ra,0xffffd
    80004c8c:	d74080e7          	jalr	-652(ra) # 800019fc <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80004c90:	0144a783          	lw	a5,20(s1)
    80004c94:	0104a903          	lw	s2,16(s1)
    80004c98:	0327ce63          	blt	a5,s2,80004cd4 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80004c9c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80004ca0:	0304b503          	ld	a0,48(s1)
    80004ca4:	ffffd097          	auipc	ra,0xffffd
    80004ca8:	d84080e7          	jalr	-636(ra) # 80001a28 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80004cac:	0284b503          	ld	a0,40(s1)
    80004cb0:	ffffd097          	auipc	ra,0xffffd
    80004cb4:	d78080e7          	jalr	-648(ra) # 80001a28 <_Z10sem_signalP4_sem>

    return ret;
}
    80004cb8:	00090513          	mv	a0,s2
    80004cbc:	01813083          	ld	ra,24(sp)
    80004cc0:	01013403          	ld	s0,16(sp)
    80004cc4:	00813483          	ld	s1,8(sp)
    80004cc8:	00013903          	ld	s2,0(sp)
    80004ccc:	02010113          	addi	sp,sp,32
    80004cd0:	00008067          	ret
        ret = cap - head + tail;
    80004cd4:	0004a703          	lw	a4,0(s1)
    80004cd8:	4127093b          	subw	s2,a4,s2
    80004cdc:	00f9093b          	addw	s2,s2,a5
    80004ce0:	fc1ff06f          	j	80004ca0 <_ZN6Buffer6getCntEv+0x44>

0000000080004ce4 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80004ce4:	fe010113          	addi	sp,sp,-32
    80004ce8:	00113c23          	sd	ra,24(sp)
    80004cec:	00813823          	sd	s0,16(sp)
    80004cf0:	00913423          	sd	s1,8(sp)
    80004cf4:	02010413          	addi	s0,sp,32
    80004cf8:	00050493          	mv	s1,a0
    putc('\n');
    80004cfc:	00a00513          	li	a0,10
    80004d00:	ffffd097          	auipc	ra,0xffffd
    80004d04:	d7c080e7          	jalr	-644(ra) # 80001a7c <_Z4putcc>
    printString("Buffer deleted!\n");
    80004d08:	00006517          	auipc	a0,0x6
    80004d0c:	72050513          	addi	a0,a0,1824 # 8000b428 <CONSOLE_STATUS+0x418>
    80004d10:	00003097          	auipc	ra,0x3
    80004d14:	95c080e7          	jalr	-1700(ra) # 8000766c <_Z11printStringPKc>
    while (getCnt() > 0) {
    80004d18:	00048513          	mv	a0,s1
    80004d1c:	00000097          	auipc	ra,0x0
    80004d20:	f40080e7          	jalr	-192(ra) # 80004c5c <_ZN6Buffer6getCntEv>
    80004d24:	02a05c63          	blez	a0,80004d5c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80004d28:	0084b783          	ld	a5,8(s1)
    80004d2c:	0104a703          	lw	a4,16(s1)
    80004d30:	00271713          	slli	a4,a4,0x2
    80004d34:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80004d38:	0007c503          	lbu	a0,0(a5)
    80004d3c:	ffffd097          	auipc	ra,0xffffd
    80004d40:	d40080e7          	jalr	-704(ra) # 80001a7c <_Z4putcc>
        head = (head + 1) % cap;
    80004d44:	0104a783          	lw	a5,16(s1)
    80004d48:	0017879b          	addiw	a5,a5,1
    80004d4c:	0004a703          	lw	a4,0(s1)
    80004d50:	02e7e7bb          	remw	a5,a5,a4
    80004d54:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80004d58:	fc1ff06f          	j	80004d18 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80004d5c:	02100513          	li	a0,33
    80004d60:	ffffd097          	auipc	ra,0xffffd
    80004d64:	d1c080e7          	jalr	-740(ra) # 80001a7c <_Z4putcc>
    putc('\n');
    80004d68:	00a00513          	li	a0,10
    80004d6c:	ffffd097          	auipc	ra,0xffffd
    80004d70:	d10080e7          	jalr	-752(ra) # 80001a7c <_Z4putcc>
    mem_free(buffer);
    80004d74:	0084b503          	ld	a0,8(s1)
    80004d78:	ffffd097          	auipc	ra,0xffffd
    80004d7c:	ae8080e7          	jalr	-1304(ra) # 80001860 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80004d80:	0204b503          	ld	a0,32(s1)
    80004d84:	ffffd097          	auipc	ra,0xffffd
    80004d88:	c4c080e7          	jalr	-948(ra) # 800019d0 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80004d8c:	0184b503          	ld	a0,24(s1)
    80004d90:	ffffd097          	auipc	ra,0xffffd
    80004d94:	c40080e7          	jalr	-960(ra) # 800019d0 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80004d98:	0304b503          	ld	a0,48(s1)
    80004d9c:	ffffd097          	auipc	ra,0xffffd
    80004da0:	c34080e7          	jalr	-972(ra) # 800019d0 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80004da4:	0284b503          	ld	a0,40(s1)
    80004da8:	ffffd097          	auipc	ra,0xffffd
    80004dac:	c28080e7          	jalr	-984(ra) # 800019d0 <_Z9sem_closeP4_sem>
}
    80004db0:	01813083          	ld	ra,24(sp)
    80004db4:	01013403          	ld	s0,16(sp)
    80004db8:	00813483          	ld	s1,8(sp)
    80004dbc:	02010113          	addi	sp,sp,32
    80004dc0:	00008067          	ret

0000000080004dc4 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80004dc4:	fe010113          	addi	sp,sp,-32
    80004dc8:	00113c23          	sd	ra,24(sp)
    80004dcc:	00813823          	sd	s0,16(sp)
    80004dd0:	00913423          	sd	s1,8(sp)
    80004dd4:	01213023          	sd	s2,0(sp)
    80004dd8:	02010413          	addi	s0,sp,32
    80004ddc:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004de0:	00000913          	li	s2,0
    80004de4:	00c0006f          	j	80004df0 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80004de8:	ffffd097          	auipc	ra,0xffffd
    80004dec:	b40080e7          	jalr	-1216(ra) # 80001928 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80004df0:	ffffd097          	auipc	ra,0xffffd
    80004df4:	c64080e7          	jalr	-924(ra) # 80001a54 <_Z4getcv>
    80004df8:	0005059b          	sext.w	a1,a0
    80004dfc:	01b00793          	li	a5,27
    80004e00:	02f58a63          	beq	a1,a5,80004e34 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80004e04:	0084b503          	ld	a0,8(s1)
    80004e08:	00000097          	auipc	ra,0x0
    80004e0c:	d38080e7          	jalr	-712(ra) # 80004b40 <_ZN6Buffer3putEi>
        i++;
    80004e10:	0019071b          	addiw	a4,s2,1
    80004e14:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004e18:	0004a683          	lw	a3,0(s1)
    80004e1c:	0026979b          	slliw	a5,a3,0x2
    80004e20:	00d787bb          	addw	a5,a5,a3
    80004e24:	0017979b          	slliw	a5,a5,0x1
    80004e28:	02f767bb          	remw	a5,a4,a5
    80004e2c:	fc0792e3          	bnez	a5,80004df0 <_ZL16producerKeyboardPv+0x2c>
    80004e30:	fb9ff06f          	j	80004de8 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80004e34:	00100793          	li	a5,1
    80004e38:	00009717          	auipc	a4,0x9
    80004e3c:	16f72c23          	sw	a5,376(a4) # 8000dfb0 <_ZL9threadEnd>
    data->buffer->put('!');
    80004e40:	02100593          	li	a1,33
    80004e44:	0084b503          	ld	a0,8(s1)
    80004e48:	00000097          	auipc	ra,0x0
    80004e4c:	cf8080e7          	jalr	-776(ra) # 80004b40 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80004e50:	0104b503          	ld	a0,16(s1)
    80004e54:	ffffd097          	auipc	ra,0xffffd
    80004e58:	bd4080e7          	jalr	-1068(ra) # 80001a28 <_Z10sem_signalP4_sem>
}
    80004e5c:	01813083          	ld	ra,24(sp)
    80004e60:	01013403          	ld	s0,16(sp)
    80004e64:	00813483          	ld	s1,8(sp)
    80004e68:	00013903          	ld	s2,0(sp)
    80004e6c:	02010113          	addi	sp,sp,32
    80004e70:	00008067          	ret

0000000080004e74 <_ZL8producerPv>:

static void producer(void *arg) {
    80004e74:	fe010113          	addi	sp,sp,-32
    80004e78:	00113c23          	sd	ra,24(sp)
    80004e7c:	00813823          	sd	s0,16(sp)
    80004e80:	00913423          	sd	s1,8(sp)
    80004e84:	01213023          	sd	s2,0(sp)
    80004e88:	02010413          	addi	s0,sp,32
    80004e8c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004e90:	00000913          	li	s2,0
    80004e94:	00c0006f          	j	80004ea0 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80004e98:	ffffd097          	auipc	ra,0xffffd
    80004e9c:	a90080e7          	jalr	-1392(ra) # 80001928 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80004ea0:	00009797          	auipc	a5,0x9
    80004ea4:	1107a783          	lw	a5,272(a5) # 8000dfb0 <_ZL9threadEnd>
    80004ea8:	02079e63          	bnez	a5,80004ee4 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80004eac:	0004a583          	lw	a1,0(s1)
    80004eb0:	0305859b          	addiw	a1,a1,48
    80004eb4:	0084b503          	ld	a0,8(s1)
    80004eb8:	00000097          	auipc	ra,0x0
    80004ebc:	c88080e7          	jalr	-888(ra) # 80004b40 <_ZN6Buffer3putEi>
        i++;
    80004ec0:	0019071b          	addiw	a4,s2,1
    80004ec4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004ec8:	0004a683          	lw	a3,0(s1)
    80004ecc:	0026979b          	slliw	a5,a3,0x2
    80004ed0:	00d787bb          	addw	a5,a5,a3
    80004ed4:	0017979b          	slliw	a5,a5,0x1
    80004ed8:	02f767bb          	remw	a5,a4,a5
    80004edc:	fc0792e3          	bnez	a5,80004ea0 <_ZL8producerPv+0x2c>
    80004ee0:	fb9ff06f          	j	80004e98 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80004ee4:	0104b503          	ld	a0,16(s1)
    80004ee8:	ffffd097          	auipc	ra,0xffffd
    80004eec:	b40080e7          	jalr	-1216(ra) # 80001a28 <_Z10sem_signalP4_sem>
}
    80004ef0:	01813083          	ld	ra,24(sp)
    80004ef4:	01013403          	ld	s0,16(sp)
    80004ef8:	00813483          	ld	s1,8(sp)
    80004efc:	00013903          	ld	s2,0(sp)
    80004f00:	02010113          	addi	sp,sp,32
    80004f04:	00008067          	ret

0000000080004f08 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80004f08:	fd010113          	addi	sp,sp,-48
    80004f0c:	02113423          	sd	ra,40(sp)
    80004f10:	02813023          	sd	s0,32(sp)
    80004f14:	00913c23          	sd	s1,24(sp)
    80004f18:	01213823          	sd	s2,16(sp)
    80004f1c:	01313423          	sd	s3,8(sp)
    80004f20:	03010413          	addi	s0,sp,48
    80004f24:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004f28:	00000993          	li	s3,0
    80004f2c:	01c0006f          	j	80004f48 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80004f30:	ffffd097          	auipc	ra,0xffffd
    80004f34:	9f8080e7          	jalr	-1544(ra) # 80001928 <_Z15thread_dispatchv>
    80004f38:	0500006f          	j	80004f88 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80004f3c:	00a00513          	li	a0,10
    80004f40:	ffffd097          	auipc	ra,0xffffd
    80004f44:	b3c080e7          	jalr	-1220(ra) # 80001a7c <_Z4putcc>
    while (!threadEnd) {
    80004f48:	00009797          	auipc	a5,0x9
    80004f4c:	0687a783          	lw	a5,104(a5) # 8000dfb0 <_ZL9threadEnd>
    80004f50:	06079063          	bnez	a5,80004fb0 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80004f54:	00893503          	ld	a0,8(s2)
    80004f58:	00000097          	auipc	ra,0x0
    80004f5c:	c78080e7          	jalr	-904(ra) # 80004bd0 <_ZN6Buffer3getEv>
        i++;
    80004f60:	0019849b          	addiw	s1,s3,1
    80004f64:	0004899b          	sext.w	s3,s1
        putc(key);
    80004f68:	0ff57513          	andi	a0,a0,255
    80004f6c:	ffffd097          	auipc	ra,0xffffd
    80004f70:	b10080e7          	jalr	-1264(ra) # 80001a7c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80004f74:	00092703          	lw	a4,0(s2)
    80004f78:	0027179b          	slliw	a5,a4,0x2
    80004f7c:	00e787bb          	addw	a5,a5,a4
    80004f80:	02f4e7bb          	remw	a5,s1,a5
    80004f84:	fa0786e3          	beqz	a5,80004f30 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80004f88:	05000793          	li	a5,80
    80004f8c:	02f4e4bb          	remw	s1,s1,a5
    80004f90:	fa049ce3          	bnez	s1,80004f48 <_ZL8consumerPv+0x40>
    80004f94:	fa9ff06f          	j	80004f3c <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80004f98:	00893503          	ld	a0,8(s2)
    80004f9c:	00000097          	auipc	ra,0x0
    80004fa0:	c34080e7          	jalr	-972(ra) # 80004bd0 <_ZN6Buffer3getEv>
        putc(key);
    80004fa4:	0ff57513          	andi	a0,a0,255
    80004fa8:	ffffd097          	auipc	ra,0xffffd
    80004fac:	ad4080e7          	jalr	-1324(ra) # 80001a7c <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80004fb0:	00893503          	ld	a0,8(s2)
    80004fb4:	00000097          	auipc	ra,0x0
    80004fb8:	ca8080e7          	jalr	-856(ra) # 80004c5c <_ZN6Buffer6getCntEv>
    80004fbc:	fca04ee3          	bgtz	a0,80004f98 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80004fc0:	01093503          	ld	a0,16(s2)
    80004fc4:	ffffd097          	auipc	ra,0xffffd
    80004fc8:	a64080e7          	jalr	-1436(ra) # 80001a28 <_Z10sem_signalP4_sem>
}
    80004fcc:	02813083          	ld	ra,40(sp)
    80004fd0:	02013403          	ld	s0,32(sp)
    80004fd4:	01813483          	ld	s1,24(sp)
    80004fd8:	01013903          	ld	s2,16(sp)
    80004fdc:	00813983          	ld	s3,8(sp)
    80004fe0:	03010113          	addi	sp,sp,48
    80004fe4:	00008067          	ret

0000000080004fe8 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80004fe8:	f9010113          	addi	sp,sp,-112
    80004fec:	06113423          	sd	ra,104(sp)
    80004ff0:	06813023          	sd	s0,96(sp)
    80004ff4:	04913c23          	sd	s1,88(sp)
    80004ff8:	05213823          	sd	s2,80(sp)
    80004ffc:	05313423          	sd	s3,72(sp)
    80005000:	05413023          	sd	s4,64(sp)
    80005004:	03513c23          	sd	s5,56(sp)
    80005008:	03613823          	sd	s6,48(sp)
    8000500c:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80005010:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80005014:	00006517          	auipc	a0,0x6
    80005018:	42c50513          	addi	a0,a0,1068 # 8000b440 <CONSOLE_STATUS+0x430>
    8000501c:	00002097          	auipc	ra,0x2
    80005020:	650080e7          	jalr	1616(ra) # 8000766c <_Z11printStringPKc>
    getString(input, 30);
    80005024:	01e00593          	li	a1,30
    80005028:	fa040493          	addi	s1,s0,-96
    8000502c:	00048513          	mv	a0,s1
    80005030:	00002097          	auipc	ra,0x2
    80005034:	6c4080e7          	jalr	1732(ra) # 800076f4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005038:	00048513          	mv	a0,s1
    8000503c:	00002097          	auipc	ra,0x2
    80005040:	790080e7          	jalr	1936(ra) # 800077cc <_Z11stringToIntPKc>
    80005044:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005048:	00006517          	auipc	a0,0x6
    8000504c:	41850513          	addi	a0,a0,1048 # 8000b460 <CONSOLE_STATUS+0x450>
    80005050:	00002097          	auipc	ra,0x2
    80005054:	61c080e7          	jalr	1564(ra) # 8000766c <_Z11printStringPKc>
    getString(input, 30);
    80005058:	01e00593          	li	a1,30
    8000505c:	00048513          	mv	a0,s1
    80005060:	00002097          	auipc	ra,0x2
    80005064:	694080e7          	jalr	1684(ra) # 800076f4 <_Z9getStringPci>
    n = stringToInt(input);
    80005068:	00048513          	mv	a0,s1
    8000506c:	00002097          	auipc	ra,0x2
    80005070:	760080e7          	jalr	1888(ra) # 800077cc <_Z11stringToIntPKc>
    80005074:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005078:	00006517          	auipc	a0,0x6
    8000507c:	40850513          	addi	a0,a0,1032 # 8000b480 <CONSOLE_STATUS+0x470>
    80005080:	00002097          	auipc	ra,0x2
    80005084:	5ec080e7          	jalr	1516(ra) # 8000766c <_Z11printStringPKc>
    80005088:	00000613          	li	a2,0
    8000508c:	00a00593          	li	a1,10
    80005090:	00090513          	mv	a0,s2
    80005094:	00002097          	auipc	ra,0x2
    80005098:	788080e7          	jalr	1928(ra) # 8000781c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    8000509c:	00006517          	auipc	a0,0x6
    800050a0:	3fc50513          	addi	a0,a0,1020 # 8000b498 <CONSOLE_STATUS+0x488>
    800050a4:	00002097          	auipc	ra,0x2
    800050a8:	5c8080e7          	jalr	1480(ra) # 8000766c <_Z11printStringPKc>
    800050ac:	00000613          	li	a2,0
    800050b0:	00a00593          	li	a1,10
    800050b4:	00048513          	mv	a0,s1
    800050b8:	00002097          	auipc	ra,0x2
    800050bc:	764080e7          	jalr	1892(ra) # 8000781c <_Z8printIntiii>
    printString(".\n");
    800050c0:	00006517          	auipc	a0,0x6
    800050c4:	3f050513          	addi	a0,a0,1008 # 8000b4b0 <CONSOLE_STATUS+0x4a0>
    800050c8:	00002097          	auipc	ra,0x2
    800050cc:	5a4080e7          	jalr	1444(ra) # 8000766c <_Z11printStringPKc>
    if(threadNum > n) {
    800050d0:	0324c463          	blt	s1,s2,800050f8 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    800050d4:	03205c63          	blez	s2,8000510c <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    800050d8:	03800513          	li	a0,56
    800050dc:	ffffc097          	auipc	ra,0xffffc
    800050e0:	0e0080e7          	jalr	224(ra) # 800011bc <_Znwm>
    800050e4:	00050a13          	mv	s4,a0
    800050e8:	00048593          	mv	a1,s1
    800050ec:	00000097          	auipc	ra,0x0
    800050f0:	9b8080e7          	jalr	-1608(ra) # 80004aa4 <_ZN6BufferC1Ei>
    800050f4:	0300006f          	j	80005124 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800050f8:	00006517          	auipc	a0,0x6
    800050fc:	3c050513          	addi	a0,a0,960 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    80005100:	00002097          	auipc	ra,0x2
    80005104:	56c080e7          	jalr	1388(ra) # 8000766c <_Z11printStringPKc>
        return;
    80005108:	0140006f          	j	8000511c <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000510c:	00006517          	auipc	a0,0x6
    80005110:	3ec50513          	addi	a0,a0,1004 # 8000b4f8 <CONSOLE_STATUS+0x4e8>
    80005114:	00002097          	auipc	ra,0x2
    80005118:	558080e7          	jalr	1368(ra) # 8000766c <_Z11printStringPKc>
        return;
    8000511c:	000b0113          	mv	sp,s6
    80005120:	1500006f          	j	80005270 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80005124:	00000593          	li	a1,0
    80005128:	00009517          	auipc	a0,0x9
    8000512c:	e9050513          	addi	a0,a0,-368 # 8000dfb8 <_ZL10waitForAll>
    80005130:	ffffd097          	auipc	ra,0xffffd
    80005134:	868080e7          	jalr	-1944(ra) # 80001998 <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    80005138:	00391793          	slli	a5,s2,0x3
    8000513c:	00f78793          	addi	a5,a5,15
    80005140:	ff07f793          	andi	a5,a5,-16
    80005144:	40f10133          	sub	sp,sp,a5
    80005148:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    8000514c:	0019071b          	addiw	a4,s2,1
    80005150:	00171793          	slli	a5,a4,0x1
    80005154:	00e787b3          	add	a5,a5,a4
    80005158:	00379793          	slli	a5,a5,0x3
    8000515c:	00f78793          	addi	a5,a5,15
    80005160:	ff07f793          	andi	a5,a5,-16
    80005164:	40f10133          	sub	sp,sp,a5
    80005168:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    8000516c:	00191613          	slli	a2,s2,0x1
    80005170:	012607b3          	add	a5,a2,s2
    80005174:	00379793          	slli	a5,a5,0x3
    80005178:	00f987b3          	add	a5,s3,a5
    8000517c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005180:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80005184:	00009717          	auipc	a4,0x9
    80005188:	e3473703          	ld	a4,-460(a4) # 8000dfb8 <_ZL10waitForAll>
    8000518c:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80005190:	00078613          	mv	a2,a5
    80005194:	00000597          	auipc	a1,0x0
    80005198:	d7458593          	addi	a1,a1,-652 # 80004f08 <_ZL8consumerPv>
    8000519c:	f9840513          	addi	a0,s0,-104
    800051a0:	ffffc097          	auipc	ra,0xffffc
    800051a4:	6ec080e7          	jalr	1772(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800051a8:	00000493          	li	s1,0
    800051ac:	0280006f          	j	800051d4 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800051b0:	00000597          	auipc	a1,0x0
    800051b4:	c1458593          	addi	a1,a1,-1004 # 80004dc4 <_ZL16producerKeyboardPv>
                      data + i);
    800051b8:	00179613          	slli	a2,a5,0x1
    800051bc:	00f60633          	add	a2,a2,a5
    800051c0:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800051c4:	00c98633          	add	a2,s3,a2
    800051c8:	ffffc097          	auipc	ra,0xffffc
    800051cc:	6c4080e7          	jalr	1732(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800051d0:	0014849b          	addiw	s1,s1,1
    800051d4:	0524d263          	bge	s1,s2,80005218 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800051d8:	00149793          	slli	a5,s1,0x1
    800051dc:	009787b3          	add	a5,a5,s1
    800051e0:	00379793          	slli	a5,a5,0x3
    800051e4:	00f987b3          	add	a5,s3,a5
    800051e8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800051ec:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    800051f0:	00009717          	auipc	a4,0x9
    800051f4:	dc873703          	ld	a4,-568(a4) # 8000dfb8 <_ZL10waitForAll>
    800051f8:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    800051fc:	00048793          	mv	a5,s1
    80005200:	00349513          	slli	a0,s1,0x3
    80005204:	00aa8533          	add	a0,s5,a0
    80005208:	fa9054e3          	blez	s1,800051b0 <_Z22producerConsumer_C_APIv+0x1c8>
    8000520c:	00000597          	auipc	a1,0x0
    80005210:	c6858593          	addi	a1,a1,-920 # 80004e74 <_ZL8producerPv>
    80005214:	fa5ff06f          	j	800051b8 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80005218:	ffffc097          	auipc	ra,0xffffc
    8000521c:	710080e7          	jalr	1808(ra) # 80001928 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80005220:	00000493          	li	s1,0
    80005224:	00994e63          	blt	s2,s1,80005240 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80005228:	00009517          	auipc	a0,0x9
    8000522c:	d9053503          	ld	a0,-624(a0) # 8000dfb8 <_ZL10waitForAll>
    80005230:	ffffc097          	auipc	ra,0xffffc
    80005234:	7cc080e7          	jalr	1996(ra) # 800019fc <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80005238:	0014849b          	addiw	s1,s1,1
    8000523c:	fe9ff06f          	j	80005224 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80005240:	00009517          	auipc	a0,0x9
    80005244:	d7853503          	ld	a0,-648(a0) # 8000dfb8 <_ZL10waitForAll>
    80005248:	ffffc097          	auipc	ra,0xffffc
    8000524c:	788080e7          	jalr	1928(ra) # 800019d0 <_Z9sem_closeP4_sem>
    delete buffer;
    80005250:	000a0e63          	beqz	s4,8000526c <_Z22producerConsumer_C_APIv+0x284>
    80005254:	000a0513          	mv	a0,s4
    80005258:	00000097          	auipc	ra,0x0
    8000525c:	a8c080e7          	jalr	-1396(ra) # 80004ce4 <_ZN6BufferD1Ev>
    80005260:	000a0513          	mv	a0,s4
    80005264:	ffffc097          	auipc	ra,0xffffc
    80005268:	f80080e7          	jalr	-128(ra) # 800011e4 <_ZdlPv>
    8000526c:	000b0113          	mv	sp,s6
}
    80005270:	f9040113          	addi	sp,s0,-112
    80005274:	06813083          	ld	ra,104(sp)
    80005278:	06013403          	ld	s0,96(sp)
    8000527c:	05813483          	ld	s1,88(sp)
    80005280:	05013903          	ld	s2,80(sp)
    80005284:	04813983          	ld	s3,72(sp)
    80005288:	04013a03          	ld	s4,64(sp)
    8000528c:	03813a83          	ld	s5,56(sp)
    80005290:	03013b03          	ld	s6,48(sp)
    80005294:	07010113          	addi	sp,sp,112
    80005298:	00008067          	ret
    8000529c:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800052a0:	000a0513          	mv	a0,s4
    800052a4:	ffffc097          	auipc	ra,0xffffc
    800052a8:	f40080e7          	jalr	-192(ra) # 800011e4 <_ZdlPv>
    800052ac:	00048513          	mv	a0,s1
    800052b0:	0000a097          	auipc	ra,0xa
    800052b4:	e18080e7          	jalr	-488(ra) # 8000f0c8 <_Unwind_Resume>

00000000800052b8 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800052b8:	f8010113          	addi	sp,sp,-128
    800052bc:	06113c23          	sd	ra,120(sp)
    800052c0:	06813823          	sd	s0,112(sp)
    800052c4:	06913423          	sd	s1,104(sp)
    800052c8:	07213023          	sd	s2,96(sp)
    800052cc:	05313c23          	sd	s3,88(sp)
    800052d0:	05413823          	sd	s4,80(sp)
    800052d4:	05513423          	sd	s5,72(sp)
    800052d8:	05613023          	sd	s6,64(sp)
    800052dc:	03713c23          	sd	s7,56(sp)
    800052e0:	03813823          	sd	s8,48(sp)
    800052e4:	03913423          	sd	s9,40(sp)
    800052e8:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800052ec:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800052f0:	00006517          	auipc	a0,0x6
    800052f4:	15050513          	addi	a0,a0,336 # 8000b440 <CONSOLE_STATUS+0x430>
    800052f8:	00002097          	auipc	ra,0x2
    800052fc:	374080e7          	jalr	884(ra) # 8000766c <_Z11printStringPKc>
    getString(input, 30);
    80005300:	01e00593          	li	a1,30
    80005304:	f8040493          	addi	s1,s0,-128
    80005308:	00048513          	mv	a0,s1
    8000530c:	00002097          	auipc	ra,0x2
    80005310:	3e8080e7          	jalr	1000(ra) # 800076f4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005314:	00048513          	mv	a0,s1
    80005318:	00002097          	auipc	ra,0x2
    8000531c:	4b4080e7          	jalr	1204(ra) # 800077cc <_Z11stringToIntPKc>
    80005320:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80005324:	00006517          	auipc	a0,0x6
    80005328:	13c50513          	addi	a0,a0,316 # 8000b460 <CONSOLE_STATUS+0x450>
    8000532c:	00002097          	auipc	ra,0x2
    80005330:	340080e7          	jalr	832(ra) # 8000766c <_Z11printStringPKc>
    getString(input, 30);
    80005334:	01e00593          	li	a1,30
    80005338:	00048513          	mv	a0,s1
    8000533c:	00002097          	auipc	ra,0x2
    80005340:	3b8080e7          	jalr	952(ra) # 800076f4 <_Z9getStringPci>
    n = stringToInt(input);
    80005344:	00048513          	mv	a0,s1
    80005348:	00002097          	auipc	ra,0x2
    8000534c:	484080e7          	jalr	1156(ra) # 800077cc <_Z11stringToIntPKc>
    80005350:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80005354:	00006517          	auipc	a0,0x6
    80005358:	12c50513          	addi	a0,a0,300 # 8000b480 <CONSOLE_STATUS+0x470>
    8000535c:	00002097          	auipc	ra,0x2
    80005360:	310080e7          	jalr	784(ra) # 8000766c <_Z11printStringPKc>
    printInt(threadNum);
    80005364:	00000613          	li	a2,0
    80005368:	00a00593          	li	a1,10
    8000536c:	00098513          	mv	a0,s3
    80005370:	00002097          	auipc	ra,0x2
    80005374:	4ac080e7          	jalr	1196(ra) # 8000781c <_Z8printIntiii>
    printString(" i velicina bafera ");
    80005378:	00006517          	auipc	a0,0x6
    8000537c:	12050513          	addi	a0,a0,288 # 8000b498 <CONSOLE_STATUS+0x488>
    80005380:	00002097          	auipc	ra,0x2
    80005384:	2ec080e7          	jalr	748(ra) # 8000766c <_Z11printStringPKc>
    printInt(n);
    80005388:	00000613          	li	a2,0
    8000538c:	00a00593          	li	a1,10
    80005390:	00048513          	mv	a0,s1
    80005394:	00002097          	auipc	ra,0x2
    80005398:	488080e7          	jalr	1160(ra) # 8000781c <_Z8printIntiii>
    printString(".\n");
    8000539c:	00006517          	auipc	a0,0x6
    800053a0:	11450513          	addi	a0,a0,276 # 8000b4b0 <CONSOLE_STATUS+0x4a0>
    800053a4:	00002097          	auipc	ra,0x2
    800053a8:	2c8080e7          	jalr	712(ra) # 8000766c <_Z11printStringPKc>
    if (threadNum > n) {
    800053ac:	0334c463          	blt	s1,s3,800053d4 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800053b0:	03305c63          	blez	s3,800053e8 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800053b4:	03800513          	li	a0,56
    800053b8:	ffffc097          	auipc	ra,0xffffc
    800053bc:	e04080e7          	jalr	-508(ra) # 800011bc <_Znwm>
    800053c0:	00050a93          	mv	s5,a0
    800053c4:	00048593          	mv	a1,s1
    800053c8:	00001097          	auipc	ra,0x1
    800053cc:	390080e7          	jalr	912(ra) # 80006758 <_ZN9BufferCPPC1Ei>
    800053d0:	0300006f          	j	80005400 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800053d4:	00006517          	auipc	a0,0x6
    800053d8:	0e450513          	addi	a0,a0,228 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    800053dc:	00002097          	auipc	ra,0x2
    800053e0:	290080e7          	jalr	656(ra) # 8000766c <_Z11printStringPKc>
        return;
    800053e4:	0140006f          	j	800053f8 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800053e8:	00006517          	auipc	a0,0x6
    800053ec:	11050513          	addi	a0,a0,272 # 8000b4f8 <CONSOLE_STATUS+0x4e8>
    800053f0:	00002097          	auipc	ra,0x2
    800053f4:	27c080e7          	jalr	636(ra) # 8000766c <_Z11printStringPKc>
        return;
    800053f8:	000c0113          	mv	sp,s8
    800053fc:	2380006f          	j	80005634 <_Z20testConsumerProducerv+0x37c>
    waitForAll = new Semaphore(0);
    80005400:	01000513          	li	a0,16
    80005404:	ffffc097          	auipc	ra,0xffffc
    80005408:	db8080e7          	jalr	-584(ra) # 800011bc <_Znwm>
    8000540c:	00050913          	mv	s2,a0
    80005410:	00000593          	li	a1,0
    80005414:	ffffc097          	auipc	ra,0xffffc
    80005418:	fc0080e7          	jalr	-64(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    8000541c:	00009797          	auipc	a5,0x9
    80005420:	bb27b623          	sd	s2,-1108(a5) # 8000dfc8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80005424:	00399793          	slli	a5,s3,0x3
    80005428:	00f78793          	addi	a5,a5,15
    8000542c:	ff07f793          	andi	a5,a5,-16
    80005430:	40f10133          	sub	sp,sp,a5
    80005434:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80005438:	0019871b          	addiw	a4,s3,1
    8000543c:	00171793          	slli	a5,a4,0x1
    80005440:	00e787b3          	add	a5,a5,a4
    80005444:	00379793          	slli	a5,a5,0x3
    80005448:	00f78793          	addi	a5,a5,15
    8000544c:	ff07f793          	andi	a5,a5,-16
    80005450:	40f10133          	sub	sp,sp,a5
    80005454:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80005458:	00199493          	slli	s1,s3,0x1
    8000545c:	013484b3          	add	s1,s1,s3
    80005460:	00349493          	slli	s1,s1,0x3
    80005464:	009b04b3          	add	s1,s6,s1
    80005468:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    8000546c:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80005470:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005474:	02800513          	li	a0,40
    80005478:	ffffc097          	auipc	ra,0xffffc
    8000547c:	d44080e7          	jalr	-700(ra) # 800011bc <_Znwm>
    80005480:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80005484:	ffffc097          	auipc	ra,0xffffc
    80005488:	f1c080e7          	jalr	-228(ra) # 800013a0 <_ZN6ThreadC1Ev>
    8000548c:	00009797          	auipc	a5,0x9
    80005490:	90478793          	addi	a5,a5,-1788 # 8000dd90 <_ZTV8Consumer+0x10>
    80005494:	00fbb023          	sd	a5,0(s7)
    80005498:	029bb023          	sd	s1,32(s7)
    consumer->start();
    8000549c:	000b8513          	mv	a0,s7
    800054a0:	ffffc097          	auipc	ra,0xffffc
    800054a4:	e18080e7          	jalr	-488(ra) # 800012b8 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800054a8:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800054ac:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800054b0:	00009797          	auipc	a5,0x9
    800054b4:	b187b783          	ld	a5,-1256(a5) # 8000dfc8 <_ZL10waitForAll>
    800054b8:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800054bc:	02800513          	li	a0,40
    800054c0:	ffffc097          	auipc	ra,0xffffc
    800054c4:	cfc080e7          	jalr	-772(ra) # 800011bc <_Znwm>
    800054c8:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800054cc:	ffffc097          	auipc	ra,0xffffc
    800054d0:	ed4080e7          	jalr	-300(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800054d4:	00009797          	auipc	a5,0x9
    800054d8:	86c78793          	addi	a5,a5,-1940 # 8000dd40 <_ZTV16ProducerKeyborad+0x10>
    800054dc:	00f4b023          	sd	a5,0(s1)
    800054e0:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800054e4:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800054e8:	00048513          	mv	a0,s1
    800054ec:	ffffc097          	auipc	ra,0xffffc
    800054f0:	dcc080e7          	jalr	-564(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800054f4:	00100913          	li	s2,1
    800054f8:	0300006f          	j	80005528 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800054fc:	00009797          	auipc	a5,0x9
    80005500:	86c78793          	addi	a5,a5,-1940 # 8000dd68 <_ZTV8Producer+0x10>
    80005504:	00fcb023          	sd	a5,0(s9)
    80005508:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    8000550c:	00391793          	slli	a5,s2,0x3
    80005510:	00fa07b3          	add	a5,s4,a5
    80005514:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80005518:	000c8513          	mv	a0,s9
    8000551c:	ffffc097          	auipc	ra,0xffffc
    80005520:	d9c080e7          	jalr	-612(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80005524:	0019091b          	addiw	s2,s2,1
    80005528:	05395263          	bge	s2,s3,8000556c <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    8000552c:	00191493          	slli	s1,s2,0x1
    80005530:	012484b3          	add	s1,s1,s2
    80005534:	00349493          	slli	s1,s1,0x3
    80005538:	009b04b3          	add	s1,s6,s1
    8000553c:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80005540:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80005544:	00009797          	auipc	a5,0x9
    80005548:	a847b783          	ld	a5,-1404(a5) # 8000dfc8 <_ZL10waitForAll>
    8000554c:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80005550:	02800513          	li	a0,40
    80005554:	ffffc097          	auipc	ra,0xffffc
    80005558:	c68080e7          	jalr	-920(ra) # 800011bc <_Znwm>
    8000555c:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80005560:	ffffc097          	auipc	ra,0xffffc
    80005564:	e40080e7          	jalr	-448(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80005568:	f95ff06f          	j	800054fc <_Z20testConsumerProducerv+0x244>
    putc('.');
    8000556c:	02e00513          	li	a0,46
    80005570:	ffffc097          	auipc	ra,0xffffc
    80005574:	50c080e7          	jalr	1292(ra) # 80001a7c <_Z4putcc>
    Thread::dispatch();
    80005578:	ffffc097          	auipc	ra,0xffffc
    8000557c:	da0080e7          	jalr	-608(ra) # 80001318 <_ZN6Thread8dispatchEv>
    putc('.');
    80005580:	02e00513          	li	a0,46
    80005584:	ffffc097          	auipc	ra,0xffffc
    80005588:	4f8080e7          	jalr	1272(ra) # 80001a7c <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    8000558c:	00000493          	li	s1,0
    80005590:	0099ce63          	blt	s3,s1,800055ac <_Z20testConsumerProducerv+0x2f4>
        waitForAll->wait();
    80005594:	00009517          	auipc	a0,0x9
    80005598:	a3453503          	ld	a0,-1484(a0) # 8000dfc8 <_ZL10waitForAll>
    8000559c:	ffffc097          	auipc	ra,0xffffc
    800055a0:	e70080e7          	jalr	-400(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800055a4:	0014849b          	addiw	s1,s1,1
    800055a8:	fe9ff06f          	j	80005590 <_Z20testConsumerProducerv+0x2d8>
    putc('.');
    800055ac:	02e00513          	li	a0,46
    800055b0:	ffffc097          	auipc	ra,0xffffc
    800055b4:	4cc080e7          	jalr	1228(ra) # 80001a7c <_Z4putcc>
    delete waitForAll;
    800055b8:	00009517          	auipc	a0,0x9
    800055bc:	a1053503          	ld	a0,-1520(a0) # 8000dfc8 <_ZL10waitForAll>
    800055c0:	00050863          	beqz	a0,800055d0 <_Z20testConsumerProducerv+0x318>
    800055c4:	00053783          	ld	a5,0(a0)
    800055c8:	0087b783          	ld	a5,8(a5)
    800055cc:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800055d0:	00000493          	li	s1,0
    800055d4:	0080006f          	j	800055dc <_Z20testConsumerProducerv+0x324>
    for (int i = 0; i < threadNum; i++) {
    800055d8:	0014849b          	addiw	s1,s1,1
    800055dc:	0334d263          	bge	s1,s3,80005600 <_Z20testConsumerProducerv+0x348>
        delete producers[i];
    800055e0:	00349793          	slli	a5,s1,0x3
    800055e4:	00fa07b3          	add	a5,s4,a5
    800055e8:	0007b503          	ld	a0,0(a5)
    800055ec:	fe0506e3          	beqz	a0,800055d8 <_Z20testConsumerProducerv+0x320>
    800055f0:	00053783          	ld	a5,0(a0)
    800055f4:	0087b783          	ld	a5,8(a5)
    800055f8:	000780e7          	jalr	a5
    800055fc:	fddff06f          	j	800055d8 <_Z20testConsumerProducerv+0x320>
    delete consumer;
    80005600:	000b8a63          	beqz	s7,80005614 <_Z20testConsumerProducerv+0x35c>
    80005604:	000bb783          	ld	a5,0(s7)
    80005608:	0087b783          	ld	a5,8(a5)
    8000560c:	000b8513          	mv	a0,s7
    80005610:	000780e7          	jalr	a5
    delete buffer;
    80005614:	000a8e63          	beqz	s5,80005630 <_Z20testConsumerProducerv+0x378>
    80005618:	000a8513          	mv	a0,s5
    8000561c:	00001097          	auipc	ra,0x1
    80005620:	434080e7          	jalr	1076(ra) # 80006a50 <_ZN9BufferCPPD1Ev>
    80005624:	000a8513          	mv	a0,s5
    80005628:	ffffc097          	auipc	ra,0xffffc
    8000562c:	bbc080e7          	jalr	-1092(ra) # 800011e4 <_ZdlPv>
    80005630:	000c0113          	mv	sp,s8
}
    80005634:	f8040113          	addi	sp,s0,-128
    80005638:	07813083          	ld	ra,120(sp)
    8000563c:	07013403          	ld	s0,112(sp)
    80005640:	06813483          	ld	s1,104(sp)
    80005644:	06013903          	ld	s2,96(sp)
    80005648:	05813983          	ld	s3,88(sp)
    8000564c:	05013a03          	ld	s4,80(sp)
    80005650:	04813a83          	ld	s5,72(sp)
    80005654:	04013b03          	ld	s6,64(sp)
    80005658:	03813b83          	ld	s7,56(sp)
    8000565c:	03013c03          	ld	s8,48(sp)
    80005660:	02813c83          	ld	s9,40(sp)
    80005664:	08010113          	addi	sp,sp,128
    80005668:	00008067          	ret
    8000566c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005670:	000a8513          	mv	a0,s5
    80005674:	ffffc097          	auipc	ra,0xffffc
    80005678:	b70080e7          	jalr	-1168(ra) # 800011e4 <_ZdlPv>
    8000567c:	00048513          	mv	a0,s1
    80005680:	0000a097          	auipc	ra,0xa
    80005684:	a48080e7          	jalr	-1464(ra) # 8000f0c8 <_Unwind_Resume>
    80005688:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    8000568c:	00090513          	mv	a0,s2
    80005690:	ffffc097          	auipc	ra,0xffffc
    80005694:	b54080e7          	jalr	-1196(ra) # 800011e4 <_ZdlPv>
    80005698:	00048513          	mv	a0,s1
    8000569c:	0000a097          	auipc	ra,0xa
    800056a0:	a2c080e7          	jalr	-1492(ra) # 8000f0c8 <_Unwind_Resume>
    800056a4:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800056a8:	000b8513          	mv	a0,s7
    800056ac:	ffffc097          	auipc	ra,0xffffc
    800056b0:	b38080e7          	jalr	-1224(ra) # 800011e4 <_ZdlPv>
    800056b4:	00048513          	mv	a0,s1
    800056b8:	0000a097          	auipc	ra,0xa
    800056bc:	a10080e7          	jalr	-1520(ra) # 8000f0c8 <_Unwind_Resume>
    800056c0:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800056c4:	00048513          	mv	a0,s1
    800056c8:	ffffc097          	auipc	ra,0xffffc
    800056cc:	b1c080e7          	jalr	-1252(ra) # 800011e4 <_ZdlPv>
    800056d0:	00090513          	mv	a0,s2
    800056d4:	0000a097          	auipc	ra,0xa
    800056d8:	9f4080e7          	jalr	-1548(ra) # 8000f0c8 <_Unwind_Resume>
    800056dc:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800056e0:	000c8513          	mv	a0,s9
    800056e4:	ffffc097          	auipc	ra,0xffffc
    800056e8:	b00080e7          	jalr	-1280(ra) # 800011e4 <_ZdlPv>
    800056ec:	00048513          	mv	a0,s1
    800056f0:	0000a097          	auipc	ra,0xa
    800056f4:	9d8080e7          	jalr	-1576(ra) # 8000f0c8 <_Unwind_Resume>

00000000800056f8 <_ZN8Consumer3runEv>:
    void run() override {
    800056f8:	fd010113          	addi	sp,sp,-48
    800056fc:	02113423          	sd	ra,40(sp)
    80005700:	02813023          	sd	s0,32(sp)
    80005704:	00913c23          	sd	s1,24(sp)
    80005708:	01213823          	sd	s2,16(sp)
    8000570c:	01313423          	sd	s3,8(sp)
    80005710:	03010413          	addi	s0,sp,48
    80005714:	00050913          	mv	s2,a0
        int i = 0;
    80005718:	00000993          	li	s3,0
    8000571c:	0100006f          	j	8000572c <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80005720:	00a00513          	li	a0,10
    80005724:	ffffd097          	auipc	ra,0xffffd
    80005728:	e60080e7          	jalr	-416(ra) # 80002584 <_ZN7Console4putcEc>
        while (!threadEnd) {
    8000572c:	00009797          	auipc	a5,0x9
    80005730:	8947a783          	lw	a5,-1900(a5) # 8000dfc0 <_ZL9threadEnd>
    80005734:	04079a63          	bnez	a5,80005788 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80005738:	02093783          	ld	a5,32(s2)
    8000573c:	0087b503          	ld	a0,8(a5)
    80005740:	00001097          	auipc	ra,0x1
    80005744:	1fc080e7          	jalr	508(ra) # 8000693c <_ZN9BufferCPP3getEv>
            i++;
    80005748:	0019849b          	addiw	s1,s3,1
    8000574c:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80005750:	0ff57513          	andi	a0,a0,255
    80005754:	ffffd097          	auipc	ra,0xffffd
    80005758:	e30080e7          	jalr	-464(ra) # 80002584 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    8000575c:	05000793          	li	a5,80
    80005760:	02f4e4bb          	remw	s1,s1,a5
    80005764:	fc0494e3          	bnez	s1,8000572c <_ZN8Consumer3runEv+0x34>
    80005768:	fb9ff06f          	j	80005720 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    8000576c:	02093783          	ld	a5,32(s2)
    80005770:	0087b503          	ld	a0,8(a5)
    80005774:	00001097          	auipc	ra,0x1
    80005778:	1c8080e7          	jalr	456(ra) # 8000693c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    8000577c:	0ff57513          	andi	a0,a0,255
    80005780:	ffffd097          	auipc	ra,0xffffd
    80005784:	e04080e7          	jalr	-508(ra) # 80002584 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005788:	02093783          	ld	a5,32(s2)
    8000578c:	0087b503          	ld	a0,8(a5)
    80005790:	00001097          	auipc	ra,0x1
    80005794:	238080e7          	jalr	568(ra) # 800069c8 <_ZN9BufferCPP6getCntEv>
    80005798:	fca04ae3          	bgtz	a0,8000576c <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    8000579c:	02093783          	ld	a5,32(s2)
    800057a0:	0107b503          	ld	a0,16(a5)
    800057a4:	ffffc097          	auipc	ra,0xffffc
    800057a8:	c94080e7          	jalr	-876(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    800057ac:	02813083          	ld	ra,40(sp)
    800057b0:	02013403          	ld	s0,32(sp)
    800057b4:	01813483          	ld	s1,24(sp)
    800057b8:	01013903          	ld	s2,16(sp)
    800057bc:	00813983          	ld	s3,8(sp)
    800057c0:	03010113          	addi	sp,sp,48
    800057c4:	00008067          	ret

00000000800057c8 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    800057c8:	ff010113          	addi	sp,sp,-16
    800057cc:	00113423          	sd	ra,8(sp)
    800057d0:	00813023          	sd	s0,0(sp)
    800057d4:	01010413          	addi	s0,sp,16
    800057d8:	00008797          	auipc	a5,0x8
    800057dc:	5b878793          	addi	a5,a5,1464 # 8000dd90 <_ZTV8Consumer+0x10>
    800057e0:	00f53023          	sd	a5,0(a0)
    800057e4:	ffffc097          	auipc	ra,0xffffc
    800057e8:	968080e7          	jalr	-1688(ra) # 8000114c <_ZN6ThreadD1Ev>
    800057ec:	00813083          	ld	ra,8(sp)
    800057f0:	00013403          	ld	s0,0(sp)
    800057f4:	01010113          	addi	sp,sp,16
    800057f8:	00008067          	ret

00000000800057fc <_ZN8ConsumerD0Ev>:
    800057fc:	fe010113          	addi	sp,sp,-32
    80005800:	00113c23          	sd	ra,24(sp)
    80005804:	00813823          	sd	s0,16(sp)
    80005808:	00913423          	sd	s1,8(sp)
    8000580c:	02010413          	addi	s0,sp,32
    80005810:	00050493          	mv	s1,a0
    80005814:	00008797          	auipc	a5,0x8
    80005818:	57c78793          	addi	a5,a5,1404 # 8000dd90 <_ZTV8Consumer+0x10>
    8000581c:	00f53023          	sd	a5,0(a0)
    80005820:	ffffc097          	auipc	ra,0xffffc
    80005824:	92c080e7          	jalr	-1748(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005828:	00048513          	mv	a0,s1
    8000582c:	ffffc097          	auipc	ra,0xffffc
    80005830:	9b8080e7          	jalr	-1608(ra) # 800011e4 <_ZdlPv>
    80005834:	01813083          	ld	ra,24(sp)
    80005838:	01013403          	ld	s0,16(sp)
    8000583c:	00813483          	ld	s1,8(sp)
    80005840:	02010113          	addi	sp,sp,32
    80005844:	00008067          	ret

0000000080005848 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80005848:	ff010113          	addi	sp,sp,-16
    8000584c:	00113423          	sd	ra,8(sp)
    80005850:	00813023          	sd	s0,0(sp)
    80005854:	01010413          	addi	s0,sp,16
    80005858:	00008797          	auipc	a5,0x8
    8000585c:	4e878793          	addi	a5,a5,1256 # 8000dd40 <_ZTV16ProducerKeyborad+0x10>
    80005860:	00f53023          	sd	a5,0(a0)
    80005864:	ffffc097          	auipc	ra,0xffffc
    80005868:	8e8080e7          	jalr	-1816(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000586c:	00813083          	ld	ra,8(sp)
    80005870:	00013403          	ld	s0,0(sp)
    80005874:	01010113          	addi	sp,sp,16
    80005878:	00008067          	ret

000000008000587c <_ZN16ProducerKeyboradD0Ev>:
    8000587c:	fe010113          	addi	sp,sp,-32
    80005880:	00113c23          	sd	ra,24(sp)
    80005884:	00813823          	sd	s0,16(sp)
    80005888:	00913423          	sd	s1,8(sp)
    8000588c:	02010413          	addi	s0,sp,32
    80005890:	00050493          	mv	s1,a0
    80005894:	00008797          	auipc	a5,0x8
    80005898:	4ac78793          	addi	a5,a5,1196 # 8000dd40 <_ZTV16ProducerKeyborad+0x10>
    8000589c:	00f53023          	sd	a5,0(a0)
    800058a0:	ffffc097          	auipc	ra,0xffffc
    800058a4:	8ac080e7          	jalr	-1876(ra) # 8000114c <_ZN6ThreadD1Ev>
    800058a8:	00048513          	mv	a0,s1
    800058ac:	ffffc097          	auipc	ra,0xffffc
    800058b0:	938080e7          	jalr	-1736(ra) # 800011e4 <_ZdlPv>
    800058b4:	01813083          	ld	ra,24(sp)
    800058b8:	01013403          	ld	s0,16(sp)
    800058bc:	00813483          	ld	s1,8(sp)
    800058c0:	02010113          	addi	sp,sp,32
    800058c4:	00008067          	ret

00000000800058c8 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    800058c8:	ff010113          	addi	sp,sp,-16
    800058cc:	00113423          	sd	ra,8(sp)
    800058d0:	00813023          	sd	s0,0(sp)
    800058d4:	01010413          	addi	s0,sp,16
    800058d8:	00008797          	auipc	a5,0x8
    800058dc:	49078793          	addi	a5,a5,1168 # 8000dd68 <_ZTV8Producer+0x10>
    800058e0:	00f53023          	sd	a5,0(a0)
    800058e4:	ffffc097          	auipc	ra,0xffffc
    800058e8:	868080e7          	jalr	-1944(ra) # 8000114c <_ZN6ThreadD1Ev>
    800058ec:	00813083          	ld	ra,8(sp)
    800058f0:	00013403          	ld	s0,0(sp)
    800058f4:	01010113          	addi	sp,sp,16
    800058f8:	00008067          	ret

00000000800058fc <_ZN8ProducerD0Ev>:
    800058fc:	fe010113          	addi	sp,sp,-32
    80005900:	00113c23          	sd	ra,24(sp)
    80005904:	00813823          	sd	s0,16(sp)
    80005908:	00913423          	sd	s1,8(sp)
    8000590c:	02010413          	addi	s0,sp,32
    80005910:	00050493          	mv	s1,a0
    80005914:	00008797          	auipc	a5,0x8
    80005918:	45478793          	addi	a5,a5,1108 # 8000dd68 <_ZTV8Producer+0x10>
    8000591c:	00f53023          	sd	a5,0(a0)
    80005920:	ffffc097          	auipc	ra,0xffffc
    80005924:	82c080e7          	jalr	-2004(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005928:	00048513          	mv	a0,s1
    8000592c:	ffffc097          	auipc	ra,0xffffc
    80005930:	8b8080e7          	jalr	-1864(ra) # 800011e4 <_ZdlPv>
    80005934:	01813083          	ld	ra,24(sp)
    80005938:	01013403          	ld	s0,16(sp)
    8000593c:	00813483          	ld	s1,8(sp)
    80005940:	02010113          	addi	sp,sp,32
    80005944:	00008067          	ret

0000000080005948 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80005948:	fe010113          	addi	sp,sp,-32
    8000594c:	00113c23          	sd	ra,24(sp)
    80005950:	00813823          	sd	s0,16(sp)
    80005954:	00913423          	sd	s1,8(sp)
    80005958:	02010413          	addi	s0,sp,32
    8000595c:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80005960:	ffffc097          	auipc	ra,0xffffc
    80005964:	0f4080e7          	jalr	244(ra) # 80001a54 <_Z4getcv>
    80005968:	0005059b          	sext.w	a1,a0
    8000596c:	01b00793          	li	a5,27
    80005970:	00f58c63          	beq	a1,a5,80005988 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80005974:	0204b783          	ld	a5,32(s1)
    80005978:	0087b503          	ld	a0,8(a5)
    8000597c:	00001097          	auipc	ra,0x1
    80005980:	f30080e7          	jalr	-208(ra) # 800068ac <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80005984:	fddff06f          	j	80005960 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005988:	00100793          	li	a5,1
    8000598c:	00008717          	auipc	a4,0x8
    80005990:	62f72a23          	sw	a5,1588(a4) # 8000dfc0 <_ZL9threadEnd>
        td->buffer->put('!');
    80005994:	0204b783          	ld	a5,32(s1)
    80005998:	02100593          	li	a1,33
    8000599c:	0087b503          	ld	a0,8(a5)
    800059a0:	00001097          	auipc	ra,0x1
    800059a4:	f0c080e7          	jalr	-244(ra) # 800068ac <_ZN9BufferCPP3putEi>
        td->sem->signal();
    800059a8:	0204b783          	ld	a5,32(s1)
    800059ac:	0107b503          	ld	a0,16(a5)
    800059b0:	ffffc097          	auipc	ra,0xffffc
    800059b4:	a88080e7          	jalr	-1400(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    800059b8:	01813083          	ld	ra,24(sp)
    800059bc:	01013403          	ld	s0,16(sp)
    800059c0:	00813483          	ld	s1,8(sp)
    800059c4:	02010113          	addi	sp,sp,32
    800059c8:	00008067          	ret

00000000800059cc <_ZN8Producer3runEv>:
    void run() override {
    800059cc:	fe010113          	addi	sp,sp,-32
    800059d0:	00113c23          	sd	ra,24(sp)
    800059d4:	00813823          	sd	s0,16(sp)
    800059d8:	00913423          	sd	s1,8(sp)
    800059dc:	01213023          	sd	s2,0(sp)
    800059e0:	02010413          	addi	s0,sp,32
    800059e4:	00050493          	mv	s1,a0
        int i = 0;
    800059e8:	00000913          	li	s2,0
        while (!threadEnd) {
    800059ec:	00008797          	auipc	a5,0x8
    800059f0:	5d47a783          	lw	a5,1492(a5) # 8000dfc0 <_ZL9threadEnd>
    800059f4:	04079263          	bnez	a5,80005a38 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800059f8:	0204b783          	ld	a5,32(s1)
    800059fc:	0007a583          	lw	a1,0(a5)
    80005a00:	0305859b          	addiw	a1,a1,48
    80005a04:	0087b503          	ld	a0,8(a5)
    80005a08:	00001097          	auipc	ra,0x1
    80005a0c:	ea4080e7          	jalr	-348(ra) # 800068ac <_ZN9BufferCPP3putEi>
            i++;
    80005a10:	0019071b          	addiw	a4,s2,1
    80005a14:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80005a18:	0204b783          	ld	a5,32(s1)
    80005a1c:	0007a783          	lw	a5,0(a5)
    80005a20:	00e787bb          	addw	a5,a5,a4
    80005a24:	00500513          	li	a0,5
    80005a28:	02a7e53b          	remw	a0,a5,a0
    80005a2c:	ffffc097          	auipc	ra,0xffffc
    80005a30:	914080e7          	jalr	-1772(ra) # 80001340 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80005a34:	fb9ff06f          	j	800059ec <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80005a38:	0204b783          	ld	a5,32(s1)
    80005a3c:	0107b503          	ld	a0,16(a5)
    80005a40:	ffffc097          	auipc	ra,0xffffc
    80005a44:	9f8080e7          	jalr	-1544(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005a48:	01813083          	ld	ra,24(sp)
    80005a4c:	01013403          	ld	s0,16(sp)
    80005a50:	00813483          	ld	s1,8(sp)
    80005a54:	00013903          	ld	s2,0(sp)
    80005a58:	02010113          	addi	sp,sp,32
    80005a5c:	00008067          	ret

0000000080005a60 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005a60:	fe010113          	addi	sp,sp,-32
    80005a64:	00113c23          	sd	ra,24(sp)
    80005a68:	00813823          	sd	s0,16(sp)
    80005a6c:	00913423          	sd	s1,8(sp)
    80005a70:	01213023          	sd	s2,0(sp)
    80005a74:	02010413          	addi	s0,sp,32
    80005a78:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005a7c:	00100793          	li	a5,1
    80005a80:	02a7f863          	bgeu	a5,a0,80005ab0 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005a84:	00a00793          	li	a5,10
    80005a88:	02f577b3          	remu	a5,a0,a5
    80005a8c:	02078e63          	beqz	a5,80005ac8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005a90:	fff48513          	addi	a0,s1,-1
    80005a94:	00000097          	auipc	ra,0x0
    80005a98:	fcc080e7          	jalr	-52(ra) # 80005a60 <_ZL9fibonaccim>
    80005a9c:	00050913          	mv	s2,a0
    80005aa0:	ffe48513          	addi	a0,s1,-2
    80005aa4:	00000097          	auipc	ra,0x0
    80005aa8:	fbc080e7          	jalr	-68(ra) # 80005a60 <_ZL9fibonaccim>
    80005aac:	00a90533          	add	a0,s2,a0
}
    80005ab0:	01813083          	ld	ra,24(sp)
    80005ab4:	01013403          	ld	s0,16(sp)
    80005ab8:	00813483          	ld	s1,8(sp)
    80005abc:	00013903          	ld	s2,0(sp)
    80005ac0:	02010113          	addi	sp,sp,32
    80005ac4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005ac8:	ffffc097          	auipc	ra,0xffffc
    80005acc:	e60080e7          	jalr	-416(ra) # 80001928 <_Z15thread_dispatchv>
    80005ad0:	fc1ff06f          	j	80005a90 <_ZL9fibonaccim+0x30>

0000000080005ad4 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005ad4:	fe010113          	addi	sp,sp,-32
    80005ad8:	00113c23          	sd	ra,24(sp)
    80005adc:	00813823          	sd	s0,16(sp)
    80005ae0:	00913423          	sd	s1,8(sp)
    80005ae4:	01213023          	sd	s2,0(sp)
    80005ae8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005aec:	00a00493          	li	s1,10
    80005af0:	0400006f          	j	80005b30 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005af4:	00006517          	auipc	a0,0x6
    80005af8:	a3450513          	addi	a0,a0,-1484 # 8000b528 <CONSOLE_STATUS+0x518>
    80005afc:	00002097          	auipc	ra,0x2
    80005b00:	b70080e7          	jalr	-1168(ra) # 8000766c <_Z11printStringPKc>
    80005b04:	00000613          	li	a2,0
    80005b08:	00a00593          	li	a1,10
    80005b0c:	00048513          	mv	a0,s1
    80005b10:	00002097          	auipc	ra,0x2
    80005b14:	d0c080e7          	jalr	-756(ra) # 8000781c <_Z8printIntiii>
    80005b18:	00006517          	auipc	a0,0x6
    80005b1c:	cd850513          	addi	a0,a0,-808 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005b20:	00002097          	auipc	ra,0x2
    80005b24:	b4c080e7          	jalr	-1204(ra) # 8000766c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005b28:	0014849b          	addiw	s1,s1,1
    80005b2c:	0ff4f493          	andi	s1,s1,255
    80005b30:	00c00793          	li	a5,12
    80005b34:	fc97f0e3          	bgeu	a5,s1,80005af4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005b38:	00006517          	auipc	a0,0x6
    80005b3c:	9f850513          	addi	a0,a0,-1544 # 8000b530 <CONSOLE_STATUS+0x520>
    80005b40:	00002097          	auipc	ra,0x2
    80005b44:	b2c080e7          	jalr	-1236(ra) # 8000766c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005b48:	00500313          	li	t1,5
    thread_dispatch();
    80005b4c:	ffffc097          	auipc	ra,0xffffc
    80005b50:	ddc080e7          	jalr	-548(ra) # 80001928 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005b54:	01000513          	li	a0,16
    80005b58:	00000097          	auipc	ra,0x0
    80005b5c:	f08080e7          	jalr	-248(ra) # 80005a60 <_ZL9fibonaccim>
    80005b60:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005b64:	00006517          	auipc	a0,0x6
    80005b68:	9dc50513          	addi	a0,a0,-1572 # 8000b540 <CONSOLE_STATUS+0x530>
    80005b6c:	00002097          	auipc	ra,0x2
    80005b70:	b00080e7          	jalr	-1280(ra) # 8000766c <_Z11printStringPKc>
    80005b74:	00000613          	li	a2,0
    80005b78:	00a00593          	li	a1,10
    80005b7c:	0009051b          	sext.w	a0,s2
    80005b80:	00002097          	auipc	ra,0x2
    80005b84:	c9c080e7          	jalr	-868(ra) # 8000781c <_Z8printIntiii>
    80005b88:	00006517          	auipc	a0,0x6
    80005b8c:	c6850513          	addi	a0,a0,-920 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005b90:	00002097          	auipc	ra,0x2
    80005b94:	adc080e7          	jalr	-1316(ra) # 8000766c <_Z11printStringPKc>
    80005b98:	0400006f          	j	80005bd8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005b9c:	00006517          	auipc	a0,0x6
    80005ba0:	98c50513          	addi	a0,a0,-1652 # 8000b528 <CONSOLE_STATUS+0x518>
    80005ba4:	00002097          	auipc	ra,0x2
    80005ba8:	ac8080e7          	jalr	-1336(ra) # 8000766c <_Z11printStringPKc>
    80005bac:	00000613          	li	a2,0
    80005bb0:	00a00593          	li	a1,10
    80005bb4:	00048513          	mv	a0,s1
    80005bb8:	00002097          	auipc	ra,0x2
    80005bbc:	c64080e7          	jalr	-924(ra) # 8000781c <_Z8printIntiii>
    80005bc0:	00006517          	auipc	a0,0x6
    80005bc4:	c3050513          	addi	a0,a0,-976 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005bc8:	00002097          	auipc	ra,0x2
    80005bcc:	aa4080e7          	jalr	-1372(ra) # 8000766c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005bd0:	0014849b          	addiw	s1,s1,1
    80005bd4:	0ff4f493          	andi	s1,s1,255
    80005bd8:	00f00793          	li	a5,15
    80005bdc:	fc97f0e3          	bgeu	a5,s1,80005b9c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005be0:	00006517          	auipc	a0,0x6
    80005be4:	97050513          	addi	a0,a0,-1680 # 8000b550 <CONSOLE_STATUS+0x540>
    80005be8:	00002097          	auipc	ra,0x2
    80005bec:	a84080e7          	jalr	-1404(ra) # 8000766c <_Z11printStringPKc>
    finishedD = true;
    80005bf0:	00100793          	li	a5,1
    80005bf4:	00008717          	auipc	a4,0x8
    80005bf8:	3cf70e23          	sb	a5,988(a4) # 8000dfd0 <_ZL9finishedD>
    thread_dispatch();
    80005bfc:	ffffc097          	auipc	ra,0xffffc
    80005c00:	d2c080e7          	jalr	-724(ra) # 80001928 <_Z15thread_dispatchv>
}
    80005c04:	01813083          	ld	ra,24(sp)
    80005c08:	01013403          	ld	s0,16(sp)
    80005c0c:	00813483          	ld	s1,8(sp)
    80005c10:	00013903          	ld	s2,0(sp)
    80005c14:	02010113          	addi	sp,sp,32
    80005c18:	00008067          	ret

0000000080005c1c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005c1c:	fe010113          	addi	sp,sp,-32
    80005c20:	00113c23          	sd	ra,24(sp)
    80005c24:	00813823          	sd	s0,16(sp)
    80005c28:	00913423          	sd	s1,8(sp)
    80005c2c:	01213023          	sd	s2,0(sp)
    80005c30:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005c34:	00000493          	li	s1,0
    80005c38:	0400006f          	j	80005c78 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005c3c:	00006517          	auipc	a0,0x6
    80005c40:	92450513          	addi	a0,a0,-1756 # 8000b560 <CONSOLE_STATUS+0x550>
    80005c44:	00002097          	auipc	ra,0x2
    80005c48:	a28080e7          	jalr	-1496(ra) # 8000766c <_Z11printStringPKc>
    80005c4c:	00000613          	li	a2,0
    80005c50:	00a00593          	li	a1,10
    80005c54:	00048513          	mv	a0,s1
    80005c58:	00002097          	auipc	ra,0x2
    80005c5c:	bc4080e7          	jalr	-1084(ra) # 8000781c <_Z8printIntiii>
    80005c60:	00006517          	auipc	a0,0x6
    80005c64:	b9050513          	addi	a0,a0,-1136 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005c68:	00002097          	auipc	ra,0x2
    80005c6c:	a04080e7          	jalr	-1532(ra) # 8000766c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005c70:	0014849b          	addiw	s1,s1,1
    80005c74:	0ff4f493          	andi	s1,s1,255
    80005c78:	00200793          	li	a5,2
    80005c7c:	fc97f0e3          	bgeu	a5,s1,80005c3c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005c80:	00006517          	auipc	a0,0x6
    80005c84:	8e850513          	addi	a0,a0,-1816 # 8000b568 <CONSOLE_STATUS+0x558>
    80005c88:	00002097          	auipc	ra,0x2
    80005c8c:	9e4080e7          	jalr	-1564(ra) # 8000766c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005c90:	00700313          	li	t1,7
    thread_dispatch();
    80005c94:	ffffc097          	auipc	ra,0xffffc
    80005c98:	c94080e7          	jalr	-876(ra) # 80001928 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005c9c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005ca0:	00006517          	auipc	a0,0x6
    80005ca4:	8d850513          	addi	a0,a0,-1832 # 8000b578 <CONSOLE_STATUS+0x568>
    80005ca8:	00002097          	auipc	ra,0x2
    80005cac:	9c4080e7          	jalr	-1596(ra) # 8000766c <_Z11printStringPKc>
    80005cb0:	00000613          	li	a2,0
    80005cb4:	00a00593          	li	a1,10
    80005cb8:	0009051b          	sext.w	a0,s2
    80005cbc:	00002097          	auipc	ra,0x2
    80005cc0:	b60080e7          	jalr	-1184(ra) # 8000781c <_Z8printIntiii>
    80005cc4:	00006517          	auipc	a0,0x6
    80005cc8:	b2c50513          	addi	a0,a0,-1236 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005ccc:	00002097          	auipc	ra,0x2
    80005cd0:	9a0080e7          	jalr	-1632(ra) # 8000766c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005cd4:	00c00513          	li	a0,12
    80005cd8:	00000097          	auipc	ra,0x0
    80005cdc:	d88080e7          	jalr	-632(ra) # 80005a60 <_ZL9fibonaccim>
    80005ce0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005ce4:	00006517          	auipc	a0,0x6
    80005ce8:	89c50513          	addi	a0,a0,-1892 # 8000b580 <CONSOLE_STATUS+0x570>
    80005cec:	00002097          	auipc	ra,0x2
    80005cf0:	980080e7          	jalr	-1664(ra) # 8000766c <_Z11printStringPKc>
    80005cf4:	00000613          	li	a2,0
    80005cf8:	00a00593          	li	a1,10
    80005cfc:	0009051b          	sext.w	a0,s2
    80005d00:	00002097          	auipc	ra,0x2
    80005d04:	b1c080e7          	jalr	-1252(ra) # 8000781c <_Z8printIntiii>
    80005d08:	00006517          	auipc	a0,0x6
    80005d0c:	ae850513          	addi	a0,a0,-1304 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005d10:	00002097          	auipc	ra,0x2
    80005d14:	95c080e7          	jalr	-1700(ra) # 8000766c <_Z11printStringPKc>
    80005d18:	0400006f          	j	80005d58 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005d1c:	00006517          	auipc	a0,0x6
    80005d20:	84450513          	addi	a0,a0,-1980 # 8000b560 <CONSOLE_STATUS+0x550>
    80005d24:	00002097          	auipc	ra,0x2
    80005d28:	948080e7          	jalr	-1720(ra) # 8000766c <_Z11printStringPKc>
    80005d2c:	00000613          	li	a2,0
    80005d30:	00a00593          	li	a1,10
    80005d34:	00048513          	mv	a0,s1
    80005d38:	00002097          	auipc	ra,0x2
    80005d3c:	ae4080e7          	jalr	-1308(ra) # 8000781c <_Z8printIntiii>
    80005d40:	00006517          	auipc	a0,0x6
    80005d44:	ab050513          	addi	a0,a0,-1360 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005d48:	00002097          	auipc	ra,0x2
    80005d4c:	924080e7          	jalr	-1756(ra) # 8000766c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005d50:	0014849b          	addiw	s1,s1,1
    80005d54:	0ff4f493          	andi	s1,s1,255
    80005d58:	00500793          	li	a5,5
    80005d5c:	fc97f0e3          	bgeu	a5,s1,80005d1c <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005d60:	00006517          	auipc	a0,0x6
    80005d64:	83050513          	addi	a0,a0,-2000 # 8000b590 <CONSOLE_STATUS+0x580>
    80005d68:	00002097          	auipc	ra,0x2
    80005d6c:	904080e7          	jalr	-1788(ra) # 8000766c <_Z11printStringPKc>
    finishedC = true;
    80005d70:	00100793          	li	a5,1
    80005d74:	00008717          	auipc	a4,0x8
    80005d78:	24f70ea3          	sb	a5,605(a4) # 8000dfd1 <_ZL9finishedC>
    thread_dispatch();
    80005d7c:	ffffc097          	auipc	ra,0xffffc
    80005d80:	bac080e7          	jalr	-1108(ra) # 80001928 <_Z15thread_dispatchv>
}
    80005d84:	01813083          	ld	ra,24(sp)
    80005d88:	01013403          	ld	s0,16(sp)
    80005d8c:	00813483          	ld	s1,8(sp)
    80005d90:	00013903          	ld	s2,0(sp)
    80005d94:	02010113          	addi	sp,sp,32
    80005d98:	00008067          	ret

0000000080005d9c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005d9c:	fe010113          	addi	sp,sp,-32
    80005da0:	00113c23          	sd	ra,24(sp)
    80005da4:	00813823          	sd	s0,16(sp)
    80005da8:	00913423          	sd	s1,8(sp)
    80005dac:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005db0:	00000493          	li	s1,0
    80005db4:	0340006f          	j	80005de8 <_ZL11workerBodyBPv+0x4c>
        for (uint64 j = 0; j < 100; j++) {
    80005db8:	00168693          	addi	a3,a3,1
    80005dbc:	06300793          	li	a5,99
    80005dc0:	00d7ee63          	bltu	a5,a3,80005ddc <_ZL11workerBodyBPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005dc4:	00000713          	li	a4,0
    80005dc8:	000077b7          	lui	a5,0x7
    80005dcc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005dd0:	fee7e4e3          	bltu	a5,a4,80005db8 <_ZL11workerBodyBPv+0x1c>
    80005dd4:	00170713          	addi	a4,a4,1
    80005dd8:	ff1ff06f          	j	80005dc8 <_ZL11workerBodyBPv+0x2c>
        if (i == 10) {
    80005ddc:	00a00793          	li	a5,10
    80005de0:	04f48663          	beq	s1,a5,80005e2c <_ZL11workerBodyBPv+0x90>
    for (uint64 i = 0; i < 16; i++) {
    80005de4:	00148493          	addi	s1,s1,1
    80005de8:	00f00793          	li	a5,15
    80005dec:	0497e463          	bltu	a5,s1,80005e34 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005df0:	00005517          	auipc	a0,0x5
    80005df4:	7b050513          	addi	a0,a0,1968 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80005df8:	00002097          	auipc	ra,0x2
    80005dfc:	874080e7          	jalr	-1932(ra) # 8000766c <_Z11printStringPKc>
    80005e00:	00000613          	li	a2,0
    80005e04:	00a00593          	li	a1,10
    80005e08:	0004851b          	sext.w	a0,s1
    80005e0c:	00002097          	auipc	ra,0x2
    80005e10:	a10080e7          	jalr	-1520(ra) # 8000781c <_Z8printIntiii>
    80005e14:	00006517          	auipc	a0,0x6
    80005e18:	9dc50513          	addi	a0,a0,-1572 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005e1c:	00002097          	auipc	ra,0x2
    80005e20:	850080e7          	jalr	-1968(ra) # 8000766c <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80005e24:	00000693          	li	a3,0
    80005e28:	f95ff06f          	j	80005dbc <_ZL11workerBodyBPv+0x20>
            asm volatile("csrr t6, sepc");
    80005e2c:	14102ff3          	csrr	t6,sepc
    80005e30:	fb5ff06f          	j	80005de4 <_ZL11workerBodyBPv+0x48>
    printString("B finished!\n");
    80005e34:	00005517          	auipc	a0,0x5
    80005e38:	77450513          	addi	a0,a0,1908 # 8000b5a8 <CONSOLE_STATUS+0x598>
    80005e3c:	00002097          	auipc	ra,0x2
    80005e40:	830080e7          	jalr	-2000(ra) # 8000766c <_Z11printStringPKc>
    finishedB = true;
    80005e44:	00100793          	li	a5,1
    80005e48:	00008717          	auipc	a4,0x8
    80005e4c:	18f70523          	sb	a5,394(a4) # 8000dfd2 <_ZL9finishedB>
    thread_dispatch();
    80005e50:	ffffc097          	auipc	ra,0xffffc
    80005e54:	ad8080e7          	jalr	-1320(ra) # 80001928 <_Z15thread_dispatchv>
}
    80005e58:	01813083          	ld	ra,24(sp)
    80005e5c:	01013403          	ld	s0,16(sp)
    80005e60:	00813483          	ld	s1,8(sp)
    80005e64:	02010113          	addi	sp,sp,32
    80005e68:	00008067          	ret

0000000080005e6c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005e6c:	fe010113          	addi	sp,sp,-32
    80005e70:	00113c23          	sd	ra,24(sp)
    80005e74:	00813823          	sd	s0,16(sp)
    80005e78:	00913423          	sd	s1,8(sp)
    80005e7c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005e80:	00000493          	li	s1,0
    80005e84:	02c0006f          	j	80005eb0 <_ZL11workerBodyAPv+0x44>
        for (uint64 j = 0; j < 100; j++) {
    80005e88:	00168693          	addi	a3,a3,1
    80005e8c:	06300793          	li	a5,99
    80005e90:	00d7ee63          	bltu	a5,a3,80005eac <_ZL11workerBodyAPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005e94:	00000713          	li	a4,0
    80005e98:	000077b7          	lui	a5,0x7
    80005e9c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005ea0:	fee7e4e3          	bltu	a5,a4,80005e88 <_ZL11workerBodyAPv+0x1c>
    80005ea4:	00170713          	addi	a4,a4,1
    80005ea8:	ff1ff06f          	j	80005e98 <_ZL11workerBodyAPv+0x2c>
    for (uint64 i = 0; i < 10; i++) {
    80005eac:	00148493          	addi	s1,s1,1
    80005eb0:	00900793          	li	a5,9
    80005eb4:	0497e063          	bltu	a5,s1,80005ef4 <_ZL11workerBodyAPv+0x88>
        printString("A: i="); printInt(i); printString("\n");
    80005eb8:	00005517          	auipc	a0,0x5
    80005ebc:	70050513          	addi	a0,a0,1792 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80005ec0:	00001097          	auipc	ra,0x1
    80005ec4:	7ac080e7          	jalr	1964(ra) # 8000766c <_Z11printStringPKc>
    80005ec8:	00000613          	li	a2,0
    80005ecc:	00a00593          	li	a1,10
    80005ed0:	0004851b          	sext.w	a0,s1
    80005ed4:	00002097          	auipc	ra,0x2
    80005ed8:	948080e7          	jalr	-1720(ra) # 8000781c <_Z8printIntiii>
    80005edc:	00006517          	auipc	a0,0x6
    80005ee0:	91450513          	addi	a0,a0,-1772 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005ee4:	00001097          	auipc	ra,0x1
    80005ee8:	788080e7          	jalr	1928(ra) # 8000766c <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80005eec:	00000693          	li	a3,0
    80005ef0:	f9dff06f          	j	80005e8c <_ZL11workerBodyAPv+0x20>
    printString("A finished!\n");
    80005ef4:	00005517          	auipc	a0,0x5
    80005ef8:	6cc50513          	addi	a0,a0,1740 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80005efc:	00001097          	auipc	ra,0x1
    80005f00:	770080e7          	jalr	1904(ra) # 8000766c <_Z11printStringPKc>
    finishedA = true;
    80005f04:	00100793          	li	a5,1
    80005f08:	00008717          	auipc	a4,0x8
    80005f0c:	0cf705a3          	sb	a5,203(a4) # 8000dfd3 <_ZL9finishedA>
}
    80005f10:	01813083          	ld	ra,24(sp)
    80005f14:	01013403          	ld	s0,16(sp)
    80005f18:	00813483          	ld	s1,8(sp)
    80005f1c:	02010113          	addi	sp,sp,32
    80005f20:	00008067          	ret

0000000080005f24 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80005f24:	fd010113          	addi	sp,sp,-48
    80005f28:	02113423          	sd	ra,40(sp)
    80005f2c:	02813023          	sd	s0,32(sp)
    80005f30:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005f34:	00000613          	li	a2,0
    80005f38:	00000597          	auipc	a1,0x0
    80005f3c:	f3458593          	addi	a1,a1,-204 # 80005e6c <_ZL11workerBodyAPv>
    80005f40:	fd040513          	addi	a0,s0,-48
    80005f44:	ffffc097          	auipc	ra,0xffffc
    80005f48:	948080e7          	jalr	-1720(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80005f4c:	00005517          	auipc	a0,0x5
    80005f50:	68450513          	addi	a0,a0,1668 # 8000b5d0 <CONSOLE_STATUS+0x5c0>
    80005f54:	00001097          	auipc	ra,0x1
    80005f58:	718080e7          	jalr	1816(ra) # 8000766c <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[1], workerBodyB, nullptr);
    80005f5c:	00000613          	li	a2,0
    80005f60:	00000597          	auipc	a1,0x0
    80005f64:	e3c58593          	addi	a1,a1,-452 # 80005d9c <_ZL11workerBodyBPv>
    80005f68:	fd840513          	addi	a0,s0,-40
    80005f6c:	ffffc097          	auipc	ra,0xffffc
    80005f70:	920080e7          	jalr	-1760(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80005f74:	00005517          	auipc	a0,0x5
    80005f78:	67450513          	addi	a0,a0,1652 # 8000b5e8 <CONSOLE_STATUS+0x5d8>
    80005f7c:	00001097          	auipc	ra,0x1
    80005f80:	6f0080e7          	jalr	1776(ra) # 8000766c <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[2], workerBodyC, nullptr);
    80005f84:	00000613          	li	a2,0
    80005f88:	00000597          	auipc	a1,0x0
    80005f8c:	c9458593          	addi	a1,a1,-876 # 80005c1c <_ZL11workerBodyCPv>
    80005f90:	fe040513          	addi	a0,s0,-32
    80005f94:	ffffc097          	auipc	ra,0xffffc
    80005f98:	8f8080e7          	jalr	-1800(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80005f9c:	00005517          	auipc	a0,0x5
    80005fa0:	66450513          	addi	a0,a0,1636 # 8000b600 <CONSOLE_STATUS+0x5f0>
    80005fa4:	00001097          	auipc	ra,0x1
    80005fa8:	6c8080e7          	jalr	1736(ra) # 8000766c <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[3], workerBodyD, nullptr);
    80005fac:	00000613          	li	a2,0
    80005fb0:	00000597          	auipc	a1,0x0
    80005fb4:	b2458593          	addi	a1,a1,-1244 # 80005ad4 <_ZL11workerBodyDPv>
    80005fb8:	fe840513          	addi	a0,s0,-24
    80005fbc:	ffffc097          	auipc	ra,0xffffc
    80005fc0:	8d0080e7          	jalr	-1840(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80005fc4:	00005517          	auipc	a0,0x5
    80005fc8:	65450513          	addi	a0,a0,1620 # 8000b618 <CONSOLE_STATUS+0x608>
    80005fcc:	00001097          	auipc	ra,0x1
    80005fd0:	6a0080e7          	jalr	1696(ra) # 8000766c <_Z11printStringPKc>
    80005fd4:	00c0006f          	j	80005fe0 <_Z16System_Mode_testv+0xbc>
    // testUser();

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005fd8:	ffffc097          	auipc	ra,0xffffc
    80005fdc:	950080e7          	jalr	-1712(ra) # 80001928 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005fe0:	00008797          	auipc	a5,0x8
    80005fe4:	ff37c783          	lbu	a5,-13(a5) # 8000dfd3 <_ZL9finishedA>
    80005fe8:	fe0788e3          	beqz	a5,80005fd8 <_Z16System_Mode_testv+0xb4>
    80005fec:	00008797          	auipc	a5,0x8
    80005ff0:	fe67c783          	lbu	a5,-26(a5) # 8000dfd2 <_ZL9finishedB>
    80005ff4:	fe0782e3          	beqz	a5,80005fd8 <_Z16System_Mode_testv+0xb4>
    80005ff8:	00008797          	auipc	a5,0x8
    80005ffc:	fd97c783          	lbu	a5,-39(a5) # 8000dfd1 <_ZL9finishedC>
    80006000:	fc078ce3          	beqz	a5,80005fd8 <_Z16System_Mode_testv+0xb4>
    80006004:	00008797          	auipc	a5,0x8
    80006008:	fcc7c783          	lbu	a5,-52(a5) # 8000dfd0 <_ZL9finishedD>
    8000600c:	fc0786e3          	beqz	a5,80005fd8 <_Z16System_Mode_testv+0xb4>
    }

}
    80006010:	02813083          	ld	ra,40(sp)
    80006014:	02013403          	ld	s0,32(sp)
    80006018:	03010113          	addi	sp,sp,48
    8000601c:	00008067          	ret

0000000080006020 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006020:	fe010113          	addi	sp,sp,-32
    80006024:	00113c23          	sd	ra,24(sp)
    80006028:	00813823          	sd	s0,16(sp)
    8000602c:	00913423          	sd	s1,8(sp)
    80006030:	01213023          	sd	s2,0(sp)
    80006034:	02010413          	addi	s0,sp,32
    80006038:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000603c:	00100793          	li	a5,1
    80006040:	02a7f863          	bgeu	a5,a0,80006070 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006044:	00a00793          	li	a5,10
    80006048:	02f577b3          	remu	a5,a0,a5
    8000604c:	02078e63          	beqz	a5,80006088 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006050:	fff48513          	addi	a0,s1,-1
    80006054:	00000097          	auipc	ra,0x0
    80006058:	fcc080e7          	jalr	-52(ra) # 80006020 <_ZL9fibonaccim>
    8000605c:	00050913          	mv	s2,a0
    80006060:	ffe48513          	addi	a0,s1,-2
    80006064:	00000097          	auipc	ra,0x0
    80006068:	fbc080e7          	jalr	-68(ra) # 80006020 <_ZL9fibonaccim>
    8000606c:	00a90533          	add	a0,s2,a0
}
    80006070:	01813083          	ld	ra,24(sp)
    80006074:	01013403          	ld	s0,16(sp)
    80006078:	00813483          	ld	s1,8(sp)
    8000607c:	00013903          	ld	s2,0(sp)
    80006080:	02010113          	addi	sp,sp,32
    80006084:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006088:	ffffc097          	auipc	ra,0xffffc
    8000608c:	8a0080e7          	jalr	-1888(ra) # 80001928 <_Z15thread_dispatchv>
    80006090:	fc1ff06f          	j	80006050 <_ZL9fibonaccim+0x30>

0000000080006094 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006094:	fe010113          	addi	sp,sp,-32
    80006098:	00113c23          	sd	ra,24(sp)
    8000609c:	00813823          	sd	s0,16(sp)
    800060a0:	00913423          	sd	s1,8(sp)
    800060a4:	01213023          	sd	s2,0(sp)
    800060a8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800060ac:	00a00493          	li	s1,10
    800060b0:	0400006f          	j	800060f0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800060b4:	00005517          	auipc	a0,0x5
    800060b8:	47450513          	addi	a0,a0,1140 # 8000b528 <CONSOLE_STATUS+0x518>
    800060bc:	00001097          	auipc	ra,0x1
    800060c0:	5b0080e7          	jalr	1456(ra) # 8000766c <_Z11printStringPKc>
    800060c4:	00000613          	li	a2,0
    800060c8:	00a00593          	li	a1,10
    800060cc:	00048513          	mv	a0,s1
    800060d0:	00001097          	auipc	ra,0x1
    800060d4:	74c080e7          	jalr	1868(ra) # 8000781c <_Z8printIntiii>
    800060d8:	00005517          	auipc	a0,0x5
    800060dc:	71850513          	addi	a0,a0,1816 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    800060e0:	00001097          	auipc	ra,0x1
    800060e4:	58c080e7          	jalr	1420(ra) # 8000766c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800060e8:	0014849b          	addiw	s1,s1,1
    800060ec:	0ff4f493          	andi	s1,s1,255
    800060f0:	00c00793          	li	a5,12
    800060f4:	fc97f0e3          	bgeu	a5,s1,800060b4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800060f8:	00005517          	auipc	a0,0x5
    800060fc:	43850513          	addi	a0,a0,1080 # 8000b530 <CONSOLE_STATUS+0x520>
    80006100:	00001097          	auipc	ra,0x1
    80006104:	56c080e7          	jalr	1388(ra) # 8000766c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006108:	00500313          	li	t1,5
    thread_dispatch();
    8000610c:	ffffc097          	auipc	ra,0xffffc
    80006110:	81c080e7          	jalr	-2020(ra) # 80001928 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006114:	01000513          	li	a0,16
    80006118:	00000097          	auipc	ra,0x0
    8000611c:	f08080e7          	jalr	-248(ra) # 80006020 <_ZL9fibonaccim>
    80006120:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006124:	00005517          	auipc	a0,0x5
    80006128:	41c50513          	addi	a0,a0,1052 # 8000b540 <CONSOLE_STATUS+0x530>
    8000612c:	00001097          	auipc	ra,0x1
    80006130:	540080e7          	jalr	1344(ra) # 8000766c <_Z11printStringPKc>
    80006134:	00000613          	li	a2,0
    80006138:	00a00593          	li	a1,10
    8000613c:	0009051b          	sext.w	a0,s2
    80006140:	00001097          	auipc	ra,0x1
    80006144:	6dc080e7          	jalr	1756(ra) # 8000781c <_Z8printIntiii>
    80006148:	00005517          	auipc	a0,0x5
    8000614c:	6a850513          	addi	a0,a0,1704 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006150:	00001097          	auipc	ra,0x1
    80006154:	51c080e7          	jalr	1308(ra) # 8000766c <_Z11printStringPKc>
    80006158:	0400006f          	j	80006198 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000615c:	00005517          	auipc	a0,0x5
    80006160:	3cc50513          	addi	a0,a0,972 # 8000b528 <CONSOLE_STATUS+0x518>
    80006164:	00001097          	auipc	ra,0x1
    80006168:	508080e7          	jalr	1288(ra) # 8000766c <_Z11printStringPKc>
    8000616c:	00000613          	li	a2,0
    80006170:	00a00593          	li	a1,10
    80006174:	00048513          	mv	a0,s1
    80006178:	00001097          	auipc	ra,0x1
    8000617c:	6a4080e7          	jalr	1700(ra) # 8000781c <_Z8printIntiii>
    80006180:	00005517          	auipc	a0,0x5
    80006184:	67050513          	addi	a0,a0,1648 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006188:	00001097          	auipc	ra,0x1
    8000618c:	4e4080e7          	jalr	1252(ra) # 8000766c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006190:	0014849b          	addiw	s1,s1,1
    80006194:	0ff4f493          	andi	s1,s1,255
    80006198:	00f00793          	li	a5,15
    8000619c:	fc97f0e3          	bgeu	a5,s1,8000615c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800061a0:	00005517          	auipc	a0,0x5
    800061a4:	3b050513          	addi	a0,a0,944 # 8000b550 <CONSOLE_STATUS+0x540>
    800061a8:	00001097          	auipc	ra,0x1
    800061ac:	4c4080e7          	jalr	1220(ra) # 8000766c <_Z11printStringPKc>
    finishedD = true;
    800061b0:	00100793          	li	a5,1
    800061b4:	00008717          	auipc	a4,0x8
    800061b8:	e2f70023          	sb	a5,-480(a4) # 8000dfd4 <_ZL9finishedD>
    thread_dispatch();
    800061bc:	ffffb097          	auipc	ra,0xffffb
    800061c0:	76c080e7          	jalr	1900(ra) # 80001928 <_Z15thread_dispatchv>
}
    800061c4:	01813083          	ld	ra,24(sp)
    800061c8:	01013403          	ld	s0,16(sp)
    800061cc:	00813483          	ld	s1,8(sp)
    800061d0:	00013903          	ld	s2,0(sp)
    800061d4:	02010113          	addi	sp,sp,32
    800061d8:	00008067          	ret

00000000800061dc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800061dc:	fe010113          	addi	sp,sp,-32
    800061e0:	00113c23          	sd	ra,24(sp)
    800061e4:	00813823          	sd	s0,16(sp)
    800061e8:	00913423          	sd	s1,8(sp)
    800061ec:	01213023          	sd	s2,0(sp)
    800061f0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800061f4:	00000493          	li	s1,0
    800061f8:	0400006f          	j	80006238 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800061fc:	00005517          	auipc	a0,0x5
    80006200:	36450513          	addi	a0,a0,868 # 8000b560 <CONSOLE_STATUS+0x550>
    80006204:	00001097          	auipc	ra,0x1
    80006208:	468080e7          	jalr	1128(ra) # 8000766c <_Z11printStringPKc>
    8000620c:	00000613          	li	a2,0
    80006210:	00a00593          	li	a1,10
    80006214:	00048513          	mv	a0,s1
    80006218:	00001097          	auipc	ra,0x1
    8000621c:	604080e7          	jalr	1540(ra) # 8000781c <_Z8printIntiii>
    80006220:	00005517          	auipc	a0,0x5
    80006224:	5d050513          	addi	a0,a0,1488 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006228:	00001097          	auipc	ra,0x1
    8000622c:	444080e7          	jalr	1092(ra) # 8000766c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006230:	0014849b          	addiw	s1,s1,1
    80006234:	0ff4f493          	andi	s1,s1,255
    80006238:	00200793          	li	a5,2
    8000623c:	fc97f0e3          	bgeu	a5,s1,800061fc <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006240:	00005517          	auipc	a0,0x5
    80006244:	32850513          	addi	a0,a0,808 # 8000b568 <CONSOLE_STATUS+0x558>
    80006248:	00001097          	auipc	ra,0x1
    8000624c:	424080e7          	jalr	1060(ra) # 8000766c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006250:	00700313          	li	t1,7
    thread_dispatch();
    80006254:	ffffb097          	auipc	ra,0xffffb
    80006258:	6d4080e7          	jalr	1748(ra) # 80001928 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000625c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006260:	00005517          	auipc	a0,0x5
    80006264:	31850513          	addi	a0,a0,792 # 8000b578 <CONSOLE_STATUS+0x568>
    80006268:	00001097          	auipc	ra,0x1
    8000626c:	404080e7          	jalr	1028(ra) # 8000766c <_Z11printStringPKc>
    80006270:	00000613          	li	a2,0
    80006274:	00a00593          	li	a1,10
    80006278:	0009051b          	sext.w	a0,s2
    8000627c:	00001097          	auipc	ra,0x1
    80006280:	5a0080e7          	jalr	1440(ra) # 8000781c <_Z8printIntiii>
    80006284:	00005517          	auipc	a0,0x5
    80006288:	56c50513          	addi	a0,a0,1388 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    8000628c:	00001097          	auipc	ra,0x1
    80006290:	3e0080e7          	jalr	992(ra) # 8000766c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006294:	00c00513          	li	a0,12
    80006298:	00000097          	auipc	ra,0x0
    8000629c:	d88080e7          	jalr	-632(ra) # 80006020 <_ZL9fibonaccim>
    800062a0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800062a4:	00005517          	auipc	a0,0x5
    800062a8:	2dc50513          	addi	a0,a0,732 # 8000b580 <CONSOLE_STATUS+0x570>
    800062ac:	00001097          	auipc	ra,0x1
    800062b0:	3c0080e7          	jalr	960(ra) # 8000766c <_Z11printStringPKc>
    800062b4:	00000613          	li	a2,0
    800062b8:	00a00593          	li	a1,10
    800062bc:	0009051b          	sext.w	a0,s2
    800062c0:	00001097          	auipc	ra,0x1
    800062c4:	55c080e7          	jalr	1372(ra) # 8000781c <_Z8printIntiii>
    800062c8:	00005517          	auipc	a0,0x5
    800062cc:	52850513          	addi	a0,a0,1320 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    800062d0:	00001097          	auipc	ra,0x1
    800062d4:	39c080e7          	jalr	924(ra) # 8000766c <_Z11printStringPKc>
    800062d8:	0400006f          	j	80006318 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800062dc:	00005517          	auipc	a0,0x5
    800062e0:	28450513          	addi	a0,a0,644 # 8000b560 <CONSOLE_STATUS+0x550>
    800062e4:	00001097          	auipc	ra,0x1
    800062e8:	388080e7          	jalr	904(ra) # 8000766c <_Z11printStringPKc>
    800062ec:	00000613          	li	a2,0
    800062f0:	00a00593          	li	a1,10
    800062f4:	00048513          	mv	a0,s1
    800062f8:	00001097          	auipc	ra,0x1
    800062fc:	524080e7          	jalr	1316(ra) # 8000781c <_Z8printIntiii>
    80006300:	00005517          	auipc	a0,0x5
    80006304:	4f050513          	addi	a0,a0,1264 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006308:	00001097          	auipc	ra,0x1
    8000630c:	364080e7          	jalr	868(ra) # 8000766c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006310:	0014849b          	addiw	s1,s1,1
    80006314:	0ff4f493          	andi	s1,s1,255
    80006318:	00500793          	li	a5,5
    8000631c:	fc97f0e3          	bgeu	a5,s1,800062dc <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80006320:	00005517          	auipc	a0,0x5
    80006324:	27050513          	addi	a0,a0,624 # 8000b590 <CONSOLE_STATUS+0x580>
    80006328:	00001097          	auipc	ra,0x1
    8000632c:	344080e7          	jalr	836(ra) # 8000766c <_Z11printStringPKc>
    finishedC = true;
    80006330:	00100793          	li	a5,1
    80006334:	00008717          	auipc	a4,0x8
    80006338:	caf700a3          	sb	a5,-863(a4) # 8000dfd5 <_ZL9finishedC>
    thread_dispatch();
    8000633c:	ffffb097          	auipc	ra,0xffffb
    80006340:	5ec080e7          	jalr	1516(ra) # 80001928 <_Z15thread_dispatchv>
}
    80006344:	01813083          	ld	ra,24(sp)
    80006348:	01013403          	ld	s0,16(sp)
    8000634c:	00813483          	ld	s1,8(sp)
    80006350:	00013903          	ld	s2,0(sp)
    80006354:	02010113          	addi	sp,sp,32
    80006358:	00008067          	ret

000000008000635c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000635c:	fe010113          	addi	sp,sp,-32
    80006360:	00113c23          	sd	ra,24(sp)
    80006364:	00813823          	sd	s0,16(sp)
    80006368:	00913423          	sd	s1,8(sp)
    8000636c:	01213023          	sd	s2,0(sp)
    80006370:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006374:	00000913          	li	s2,0
    80006378:	0080006f          	j	80006380 <_ZL11workerBodyBPv+0x24>
    8000637c:	00190913          	addi	s2,s2,1
    80006380:	00f00793          	li	a5,15
    80006384:	0527ea63          	bltu	a5,s2,800063d8 <_ZL11workerBodyBPv+0x7c>
        printString("B: i="); printInt(i); printString("\n");
    80006388:	00005517          	auipc	a0,0x5
    8000638c:	21850513          	addi	a0,a0,536 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80006390:	00001097          	auipc	ra,0x1
    80006394:	2dc080e7          	jalr	732(ra) # 8000766c <_Z11printStringPKc>
    80006398:	00000613          	li	a2,0
    8000639c:	00a00593          	li	a1,10
    800063a0:	0009051b          	sext.w	a0,s2
    800063a4:	00001097          	auipc	ra,0x1
    800063a8:	478080e7          	jalr	1144(ra) # 8000781c <_Z8printIntiii>
    800063ac:	00005517          	auipc	a0,0x5
    800063b0:	44450513          	addi	a0,a0,1092 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    800063b4:	00001097          	auipc	ra,0x1
    800063b8:	2b8080e7          	jalr	696(ra) # 8000766c <_Z11printStringPKc>
        for (uint64 j = 0; j < 1000; j++) {
    800063bc:	00000493          	li	s1,0
    800063c0:	3e700793          	li	a5,999
    800063c4:	fa97ece3          	bltu	a5,s1,8000637c <_ZL11workerBodyBPv+0x20>
            thread_dispatch();
    800063c8:	ffffb097          	auipc	ra,0xffffb
    800063cc:	560080e7          	jalr	1376(ra) # 80001928 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 1000; j++) {
    800063d0:	00148493          	addi	s1,s1,1
    800063d4:	fedff06f          	j	800063c0 <_ZL11workerBodyBPv+0x64>
    printString("B finished!\n");
    800063d8:	00005517          	auipc	a0,0x5
    800063dc:	1d050513          	addi	a0,a0,464 # 8000b5a8 <CONSOLE_STATUS+0x598>
    800063e0:	00001097          	auipc	ra,0x1
    800063e4:	28c080e7          	jalr	652(ra) # 8000766c <_Z11printStringPKc>
    finishedB = true;
    800063e8:	00100793          	li	a5,1
    800063ec:	00008717          	auipc	a4,0x8
    800063f0:	bef70523          	sb	a5,-1046(a4) # 8000dfd6 <_ZL9finishedB>
    thread_dispatch();
    800063f4:	ffffb097          	auipc	ra,0xffffb
    800063f8:	534080e7          	jalr	1332(ra) # 80001928 <_Z15thread_dispatchv>
}
    800063fc:	01813083          	ld	ra,24(sp)
    80006400:	01013403          	ld	s0,16(sp)
    80006404:	00813483          	ld	s1,8(sp)
    80006408:	00013903          	ld	s2,0(sp)
    8000640c:	02010113          	addi	sp,sp,32
    80006410:	00008067          	ret

0000000080006414 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006414:	fe010113          	addi	sp,sp,-32
    80006418:	00113c23          	sd	ra,24(sp)
    8000641c:	00813823          	sd	s0,16(sp)
    80006420:	00913423          	sd	s1,8(sp)
    80006424:	01213023          	sd	s2,0(sp)
    80006428:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000642c:	00000913          	li	s2,0
    80006430:	0080006f          	j	80006438 <_ZL11workerBodyAPv+0x24>
    80006434:	00190913          	addi	s2,s2,1
    80006438:	00900793          	li	a5,9
    8000643c:	0527ea63          	bltu	a5,s2,80006490 <_ZL11workerBodyAPv+0x7c>
        printString("A: i="); printInt(i); printString("\n");
    80006440:	00005517          	auipc	a0,0x5
    80006444:	17850513          	addi	a0,a0,376 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80006448:	00001097          	auipc	ra,0x1
    8000644c:	224080e7          	jalr	548(ra) # 8000766c <_Z11printStringPKc>
    80006450:	00000613          	li	a2,0
    80006454:	00a00593          	li	a1,10
    80006458:	0009051b          	sext.w	a0,s2
    8000645c:	00001097          	auipc	ra,0x1
    80006460:	3c0080e7          	jalr	960(ra) # 8000781c <_Z8printIntiii>
    80006464:	00005517          	auipc	a0,0x5
    80006468:	38c50513          	addi	a0,a0,908 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    8000646c:	00001097          	auipc	ra,0x1
    80006470:	200080e7          	jalr	512(ra) # 8000766c <_Z11printStringPKc>
        for (uint64 j = 0; j < 1000; j++) {
    80006474:	00000493          	li	s1,0
    80006478:	3e700793          	li	a5,999
    8000647c:	fa97ece3          	bltu	a5,s1,80006434 <_ZL11workerBodyAPv+0x20>
            thread_dispatch();
    80006480:	ffffb097          	auipc	ra,0xffffb
    80006484:	4a8080e7          	jalr	1192(ra) # 80001928 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 1000; j++) {
    80006488:	00148493          	addi	s1,s1,1
    8000648c:	fedff06f          	j	80006478 <_ZL11workerBodyAPv+0x64>
    printString("A finished!\n");
    80006490:	00005517          	auipc	a0,0x5
    80006494:	13050513          	addi	a0,a0,304 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80006498:	00001097          	auipc	ra,0x1
    8000649c:	1d4080e7          	jalr	468(ra) # 8000766c <_Z11printStringPKc>
    finishedA = true;
    800064a0:	00100793          	li	a5,1
    800064a4:	00008717          	auipc	a4,0x8
    800064a8:	b2f709a3          	sb	a5,-1229(a4) # 8000dfd7 <_ZL9finishedA>
}
    800064ac:	01813083          	ld	ra,24(sp)
    800064b0:	01013403          	ld	s0,16(sp)
    800064b4:	00813483          	ld	s1,8(sp)
    800064b8:	00013903          	ld	s2,0(sp)
    800064bc:	02010113          	addi	sp,sp,32
    800064c0:	00008067          	ret

00000000800064c4 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800064c4:	fd010113          	addi	sp,sp,-48
    800064c8:	02113423          	sd	ra,40(sp)
    800064cc:	02813023          	sd	s0,32(sp)
    800064d0:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800064d4:	00000613          	li	a2,0
    800064d8:	00000597          	auipc	a1,0x0
    800064dc:	f3c58593          	addi	a1,a1,-196 # 80006414 <_ZL11workerBodyAPv>
    800064e0:	fd040513          	addi	a0,s0,-48
    800064e4:	ffffb097          	auipc	ra,0xffffb
    800064e8:	3a8080e7          	jalr	936(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800064ec:	00005517          	auipc	a0,0x5
    800064f0:	0e450513          	addi	a0,a0,228 # 8000b5d0 <CONSOLE_STATUS+0x5c0>
    800064f4:	00001097          	auipc	ra,0x1
    800064f8:	178080e7          	jalr	376(ra) # 8000766c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800064fc:	00000613          	li	a2,0
    80006500:	00000597          	auipc	a1,0x0
    80006504:	e5c58593          	addi	a1,a1,-420 # 8000635c <_ZL11workerBodyBPv>
    80006508:	fd840513          	addi	a0,s0,-40
    8000650c:	ffffb097          	auipc	ra,0xffffb
    80006510:	380080e7          	jalr	896(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80006514:	00005517          	auipc	a0,0x5
    80006518:	0d450513          	addi	a0,a0,212 # 8000b5e8 <CONSOLE_STATUS+0x5d8>
    8000651c:	00001097          	auipc	ra,0x1
    80006520:	150080e7          	jalr	336(ra) # 8000766c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006524:	00000613          	li	a2,0
    80006528:	00000597          	auipc	a1,0x0
    8000652c:	cb458593          	addi	a1,a1,-844 # 800061dc <_ZL11workerBodyCPv>
    80006530:	fe040513          	addi	a0,s0,-32
    80006534:	ffffb097          	auipc	ra,0xffffb
    80006538:	358080e7          	jalr	856(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    8000653c:	00005517          	auipc	a0,0x5
    80006540:	0c450513          	addi	a0,a0,196 # 8000b600 <CONSOLE_STATUS+0x5f0>
    80006544:	00001097          	auipc	ra,0x1
    80006548:	128080e7          	jalr	296(ra) # 8000766c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000654c:	00000613          	li	a2,0
    80006550:	00000597          	auipc	a1,0x0
    80006554:	b4458593          	addi	a1,a1,-1212 # 80006094 <_ZL11workerBodyDPv>
    80006558:	fe840513          	addi	a0,s0,-24
    8000655c:	ffffb097          	auipc	ra,0xffffb
    80006560:	330080e7          	jalr	816(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006564:	00005517          	auipc	a0,0x5
    80006568:	0b450513          	addi	a0,a0,180 # 8000b618 <CONSOLE_STATUS+0x608>
    8000656c:	00001097          	auipc	ra,0x1
    80006570:	100080e7          	jalr	256(ra) # 8000766c <_Z11printStringPKc>
    80006574:	00c0006f          	j	80006580 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006578:	ffffb097          	auipc	ra,0xffffb
    8000657c:	3b0080e7          	jalr	944(ra) # 80001928 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006580:	00008797          	auipc	a5,0x8
    80006584:	a577c783          	lbu	a5,-1449(a5) # 8000dfd7 <_ZL9finishedA>
    80006588:	fe0788e3          	beqz	a5,80006578 <_Z18Threads_C_API_testv+0xb4>
    8000658c:	00008797          	auipc	a5,0x8
    80006590:	a4a7c783          	lbu	a5,-1462(a5) # 8000dfd6 <_ZL9finishedB>
    80006594:	fe0782e3          	beqz	a5,80006578 <_Z18Threads_C_API_testv+0xb4>
    80006598:	00008797          	auipc	a5,0x8
    8000659c:	a3d7c783          	lbu	a5,-1475(a5) # 8000dfd5 <_ZL9finishedC>
    800065a0:	fc078ce3          	beqz	a5,80006578 <_Z18Threads_C_API_testv+0xb4>
    800065a4:	00008797          	auipc	a5,0x8
    800065a8:	a307c783          	lbu	a5,-1488(a5) # 8000dfd4 <_ZL9finishedD>
    800065ac:	fc0786e3          	beqz	a5,80006578 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800065b0:	02813083          	ld	ra,40(sp)
    800065b4:	02013403          	ld	s0,32(sp)
    800065b8:	03010113          	addi	sp,sp,48
    800065bc:	00008067          	ret

00000000800065c0 <_ZL9sleepyRunPv>:

#include "../test_h/printing.h"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800065c0:	fe010113          	addi	sp,sp,-32
    800065c4:	00113c23          	sd	ra,24(sp)
    800065c8:	00813823          	sd	s0,16(sp)
    800065cc:	00913423          	sd	s1,8(sp)
    800065d0:	01213023          	sd	s2,0(sp)
    800065d4:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800065d8:	00053903          	ld	s2,0(a0)
    int i = 6;
    800065dc:	00600493          	li	s1,6
    while (--i > 0) {
    800065e0:	fff4849b          	addiw	s1,s1,-1
    800065e4:	04905a63          	blez	s1,80006638 <_ZL9sleepyRunPv+0x78>

        printString("Hello ");
    800065e8:	00005517          	auipc	a0,0x5
    800065ec:	04850513          	addi	a0,a0,72 # 8000b630 <CONSOLE_STATUS+0x620>
    800065f0:	00001097          	auipc	ra,0x1
    800065f4:	07c080e7          	jalr	124(ra) # 8000766c <_Z11printStringPKc>
        printInt(sleep_time);
    800065f8:	00000613          	li	a2,0
    800065fc:	00a00593          	li	a1,10
    80006600:	0009051b          	sext.w	a0,s2
    80006604:	00001097          	auipc	ra,0x1
    80006608:	218080e7          	jalr	536(ra) # 8000781c <_Z8printIntiii>
        printString(" !\n");
    8000660c:	00005517          	auipc	a0,0x5
    80006610:	02c50513          	addi	a0,a0,44 # 8000b638 <CONSOLE_STATUS+0x628>
    80006614:	00001097          	auipc	ra,0x1
    80006618:	058080e7          	jalr	88(ra) # 8000766c <_Z11printStringPKc>
        time_sleep(sleep_time);
    8000661c:	00090513          	mv	a0,s2
    80006620:	ffffb097          	auipc	ra,0xffffb
    80006624:	34c080e7          	jalr	844(ra) # 8000196c <_Z10time_sleepm>
        putc('.');
    80006628:	02e00513          	li	a0,46
    8000662c:	ffffb097          	auipc	ra,0xffffb
    80006630:	450080e7          	jalr	1104(ra) # 80001a7c <_Z4putcc>
    while (--i > 0) {
    80006634:	fadff06f          	j	800065e0 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/100-1] = true;
    80006638:	06400793          	li	a5,100
    8000663c:	02f95933          	divu	s2,s2,a5
    80006640:	fff90913          	addi	s2,s2,-1
    80006644:	00008797          	auipc	a5,0x8
    80006648:	99478793          	addi	a5,a5,-1644 # 8000dfd8 <_ZL8finished>
    8000664c:	01278933          	add	s2,a5,s2
    80006650:	00100793          	li	a5,1
    80006654:	00f90023          	sb	a5,0(s2)
}
    80006658:	01813083          	ld	ra,24(sp)
    8000665c:	01013403          	ld	s0,16(sp)
    80006660:	00813483          	ld	s1,8(sp)
    80006664:	00013903          	ld	s2,0(sp)
    80006668:	02010113          	addi	sp,sp,32
    8000666c:	00008067          	ret

0000000080006670 <_Z12testSleepingv>:

void testSleeping() {
    80006670:	fc010113          	addi	sp,sp,-64
    80006674:	02113c23          	sd	ra,56(sp)
    80006678:	02813823          	sd	s0,48(sp)
    8000667c:	02913423          	sd	s1,40(sp)
    80006680:	04010413          	addi	s0,sp,64
    printString("Starting...\n");
    80006684:	00005517          	auipc	a0,0x5
    80006688:	fbc50513          	addi	a0,a0,-68 # 8000b640 <CONSOLE_STATUS+0x630>
    8000668c:	00001097          	auipc	ra,0x1
    80006690:	fe0080e7          	jalr	-32(ra) # 8000766c <_Z11printStringPKc>
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {100, 200};
    80006694:	06400793          	li	a5,100
    80006698:	fcf43823          	sd	a5,-48(s0)
    8000669c:	0c800793          	li	a5,200
    800066a0:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    printString("Creating threads: ");
    800066a4:	00005517          	auipc	a0,0x5
    800066a8:	fac50513          	addi	a0,a0,-84 # 8000b650 <CONSOLE_STATUS+0x640>
    800066ac:	00001097          	auipc	ra,0x1
    800066b0:	fc0080e7          	jalr	-64(ra) # 8000766c <_Z11printStringPKc>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800066b4:	00000493          	li	s1,0
    800066b8:	0500006f          	j	80006708 <_Z12testSleepingv+0x98>
        printInt(i);
    800066bc:	00000613          	li	a2,0
    800066c0:	00a00593          	li	a1,10
    800066c4:	00048513          	mv	a0,s1
    800066c8:	00001097          	auipc	ra,0x1
    800066cc:	154080e7          	jalr	340(ra) # 8000781c <_Z8printIntiii>
        printString(" ");
    800066d0:	00005517          	auipc	a0,0x5
    800066d4:	f9850513          	addi	a0,a0,-104 # 8000b668 <CONSOLE_STATUS+0x658>
    800066d8:	00001097          	auipc	ra,0x1
    800066dc:	f94080e7          	jalr	-108(ra) # 8000766c <_Z11printStringPKc>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800066e0:	00349793          	slli	a5,s1,0x3
    800066e4:	fd040613          	addi	a2,s0,-48
    800066e8:	00f60633          	add	a2,a2,a5
    800066ec:	00000597          	auipc	a1,0x0
    800066f0:	ed458593          	addi	a1,a1,-300 # 800065c0 <_ZL9sleepyRunPv>
    800066f4:	fc040513          	addi	a0,s0,-64
    800066f8:	00f50533          	add	a0,a0,a5
    800066fc:	ffffb097          	auipc	ra,0xffffb
    80006700:	190080e7          	jalr	400(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006704:	0014849b          	addiw	s1,s1,1
    80006708:	00100793          	li	a5,1
    8000670c:	fa97d8e3          	bge	a5,s1,800066bc <_Z12testSleepingv+0x4c>
    }
    printString("\nSuccesfully created all threads, now waiting for them to end\n");
    80006710:	00005517          	auipc	a0,0x5
    80006714:	f6050513          	addi	a0,a0,-160 # 8000b670 <CONSOLE_STATUS+0x660>
    80006718:	00001097          	auipc	ra,0x1
    8000671c:	f54080e7          	jalr	-172(ra) # 8000766c <_Z11printStringPKc>
    80006720:	00c0006f          	j	8000672c <_Z12testSleepingv+0xbc>
    while (!(finished[0] && finished[1])) {thread_dispatch();}
    80006724:	ffffb097          	auipc	ra,0xffffb
    80006728:	204080e7          	jalr	516(ra) # 80001928 <_Z15thread_dispatchv>
    8000672c:	00008797          	auipc	a5,0x8
    80006730:	8ac7c783          	lbu	a5,-1876(a5) # 8000dfd8 <_ZL8finished>
    80006734:	fe0788e3          	beqz	a5,80006724 <_Z12testSleepingv+0xb4>
    80006738:	00008797          	auipc	a5,0x8
    8000673c:	8a17c783          	lbu	a5,-1887(a5) # 8000dfd9 <_ZL8finished+0x1>
    80006740:	fe0782e3          	beqz	a5,80006724 <_Z12testSleepingv+0xb4>
}
    80006744:	03813083          	ld	ra,56(sp)
    80006748:	03013403          	ld	s0,48(sp)
    8000674c:	02813483          	ld	s1,40(sp)
    80006750:	04010113          	addi	sp,sp,64
    80006754:	00008067          	ret

0000000080006758 <_ZN9BufferCPPC1Ei>:
#include "../test_h/buffer_CPP_API.h"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006758:	fd010113          	addi	sp,sp,-48
    8000675c:	02113423          	sd	ra,40(sp)
    80006760:	02813023          	sd	s0,32(sp)
    80006764:	00913c23          	sd	s1,24(sp)
    80006768:	01213823          	sd	s2,16(sp)
    8000676c:	01313423          	sd	s3,8(sp)
    80006770:	03010413          	addi	s0,sp,48
    80006774:	00050493          	mv	s1,a0
    80006778:	00058913          	mv	s2,a1
    8000677c:	0015879b          	addiw	a5,a1,1
    80006780:	0007851b          	sext.w	a0,a5
    80006784:	00f4a023          	sw	a5,0(s1)
    80006788:	0004a823          	sw	zero,16(s1)
    8000678c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006790:	00251513          	slli	a0,a0,0x2
    80006794:	ffffb097          	auipc	ra,0xffffb
    80006798:	09c080e7          	jalr	156(ra) # 80001830 <_Z9mem_allocm>
    8000679c:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800067a0:	01000513          	li	a0,16
    800067a4:	ffffb097          	auipc	ra,0xffffb
    800067a8:	a18080e7          	jalr	-1512(ra) # 800011bc <_Znwm>
    800067ac:	00050993          	mv	s3,a0
    800067b0:	00000593          	li	a1,0
    800067b4:	ffffb097          	auipc	ra,0xffffb
    800067b8:	c20080e7          	jalr	-992(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800067bc:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800067c0:	01000513          	li	a0,16
    800067c4:	ffffb097          	auipc	ra,0xffffb
    800067c8:	9f8080e7          	jalr	-1544(ra) # 800011bc <_Znwm>
    800067cc:	00050993          	mv	s3,a0
    800067d0:	00090593          	mv	a1,s2
    800067d4:	ffffb097          	auipc	ra,0xffffb
    800067d8:	c00080e7          	jalr	-1024(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800067dc:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800067e0:	01000513          	li	a0,16
    800067e4:	ffffb097          	auipc	ra,0xffffb
    800067e8:	9d8080e7          	jalr	-1576(ra) # 800011bc <_Znwm>
    800067ec:	00050913          	mv	s2,a0
    800067f0:	00100593          	li	a1,1
    800067f4:	ffffb097          	auipc	ra,0xffffb
    800067f8:	be0080e7          	jalr	-1056(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800067fc:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006800:	01000513          	li	a0,16
    80006804:	ffffb097          	auipc	ra,0xffffb
    80006808:	9b8080e7          	jalr	-1608(ra) # 800011bc <_Znwm>
    8000680c:	00050913          	mv	s2,a0
    80006810:	00100593          	li	a1,1
    80006814:	ffffb097          	auipc	ra,0xffffb
    80006818:	bc0080e7          	jalr	-1088(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    8000681c:	0324b823          	sd	s2,48(s1)
}
    80006820:	02813083          	ld	ra,40(sp)
    80006824:	02013403          	ld	s0,32(sp)
    80006828:	01813483          	ld	s1,24(sp)
    8000682c:	01013903          	ld	s2,16(sp)
    80006830:	00813983          	ld	s3,8(sp)
    80006834:	03010113          	addi	sp,sp,48
    80006838:	00008067          	ret
    8000683c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006840:	00098513          	mv	a0,s3
    80006844:	ffffb097          	auipc	ra,0xffffb
    80006848:	9a0080e7          	jalr	-1632(ra) # 800011e4 <_ZdlPv>
    8000684c:	00048513          	mv	a0,s1
    80006850:	00009097          	auipc	ra,0x9
    80006854:	878080e7          	jalr	-1928(ra) # 8000f0c8 <_Unwind_Resume>
    80006858:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    8000685c:	00098513          	mv	a0,s3
    80006860:	ffffb097          	auipc	ra,0xffffb
    80006864:	984080e7          	jalr	-1660(ra) # 800011e4 <_ZdlPv>
    80006868:	00048513          	mv	a0,s1
    8000686c:	00009097          	auipc	ra,0x9
    80006870:	85c080e7          	jalr	-1956(ra) # 8000f0c8 <_Unwind_Resume>
    80006874:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006878:	00090513          	mv	a0,s2
    8000687c:	ffffb097          	auipc	ra,0xffffb
    80006880:	968080e7          	jalr	-1688(ra) # 800011e4 <_ZdlPv>
    80006884:	00048513          	mv	a0,s1
    80006888:	00009097          	auipc	ra,0x9
    8000688c:	840080e7          	jalr	-1984(ra) # 8000f0c8 <_Unwind_Resume>
    80006890:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006894:	00090513          	mv	a0,s2
    80006898:	ffffb097          	auipc	ra,0xffffb
    8000689c:	94c080e7          	jalr	-1716(ra) # 800011e4 <_ZdlPv>
    800068a0:	00048513          	mv	a0,s1
    800068a4:	00009097          	auipc	ra,0x9
    800068a8:	824080e7          	jalr	-2012(ra) # 8000f0c8 <_Unwind_Resume>

00000000800068ac <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800068ac:	fe010113          	addi	sp,sp,-32
    800068b0:	00113c23          	sd	ra,24(sp)
    800068b4:	00813823          	sd	s0,16(sp)
    800068b8:	00913423          	sd	s1,8(sp)
    800068bc:	01213023          	sd	s2,0(sp)
    800068c0:	02010413          	addi	s0,sp,32
    800068c4:	00050493          	mv	s1,a0
    800068c8:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800068cc:	01853503          	ld	a0,24(a0)
    800068d0:	ffffb097          	auipc	ra,0xffffb
    800068d4:	b3c080e7          	jalr	-1220(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800068d8:	0304b503          	ld	a0,48(s1)
    800068dc:	ffffb097          	auipc	ra,0xffffb
    800068e0:	b30080e7          	jalr	-1232(ra) # 8000140c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800068e4:	0084b783          	ld	a5,8(s1)
    800068e8:	0144a703          	lw	a4,20(s1)
    800068ec:	00271713          	slli	a4,a4,0x2
    800068f0:	00e787b3          	add	a5,a5,a4
    800068f4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800068f8:	0144a783          	lw	a5,20(s1)
    800068fc:	0017879b          	addiw	a5,a5,1
    80006900:	0004a703          	lw	a4,0(s1)
    80006904:	02e7e7bb          	remw	a5,a5,a4
    80006908:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000690c:	0304b503          	ld	a0,48(s1)
    80006910:	ffffb097          	auipc	ra,0xffffb
    80006914:	b28080e7          	jalr	-1240(ra) # 80001438 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006918:	0204b503          	ld	a0,32(s1)
    8000691c:	ffffb097          	auipc	ra,0xffffb
    80006920:	b1c080e7          	jalr	-1252(ra) # 80001438 <_ZN9Semaphore6signalEv>

}
    80006924:	01813083          	ld	ra,24(sp)
    80006928:	01013403          	ld	s0,16(sp)
    8000692c:	00813483          	ld	s1,8(sp)
    80006930:	00013903          	ld	s2,0(sp)
    80006934:	02010113          	addi	sp,sp,32
    80006938:	00008067          	ret

000000008000693c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    8000693c:	fe010113          	addi	sp,sp,-32
    80006940:	00113c23          	sd	ra,24(sp)
    80006944:	00813823          	sd	s0,16(sp)
    80006948:	00913423          	sd	s1,8(sp)
    8000694c:	01213023          	sd	s2,0(sp)
    80006950:	02010413          	addi	s0,sp,32
    80006954:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006958:	02053503          	ld	a0,32(a0)
    8000695c:	ffffb097          	auipc	ra,0xffffb
    80006960:	ab0080e7          	jalr	-1360(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006964:	0284b503          	ld	a0,40(s1)
    80006968:	ffffb097          	auipc	ra,0xffffb
    8000696c:	aa4080e7          	jalr	-1372(ra) # 8000140c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006970:	0084b703          	ld	a4,8(s1)
    80006974:	0104a783          	lw	a5,16(s1)
    80006978:	00279693          	slli	a3,a5,0x2
    8000697c:	00d70733          	add	a4,a4,a3
    80006980:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006984:	0017879b          	addiw	a5,a5,1
    80006988:	0004a703          	lw	a4,0(s1)
    8000698c:	02e7e7bb          	remw	a5,a5,a4
    80006990:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006994:	0284b503          	ld	a0,40(s1)
    80006998:	ffffb097          	auipc	ra,0xffffb
    8000699c:	aa0080e7          	jalr	-1376(ra) # 80001438 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800069a0:	0184b503          	ld	a0,24(s1)
    800069a4:	ffffb097          	auipc	ra,0xffffb
    800069a8:	a94080e7          	jalr	-1388(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    800069ac:	00090513          	mv	a0,s2
    800069b0:	01813083          	ld	ra,24(sp)
    800069b4:	01013403          	ld	s0,16(sp)
    800069b8:	00813483          	ld	s1,8(sp)
    800069bc:	00013903          	ld	s2,0(sp)
    800069c0:	02010113          	addi	sp,sp,32
    800069c4:	00008067          	ret

00000000800069c8 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800069c8:	fe010113          	addi	sp,sp,-32
    800069cc:	00113c23          	sd	ra,24(sp)
    800069d0:	00813823          	sd	s0,16(sp)
    800069d4:	00913423          	sd	s1,8(sp)
    800069d8:	01213023          	sd	s2,0(sp)
    800069dc:	02010413          	addi	s0,sp,32
    800069e0:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800069e4:	02853503          	ld	a0,40(a0)
    800069e8:	ffffb097          	auipc	ra,0xffffb
    800069ec:	a24080e7          	jalr	-1500(ra) # 8000140c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800069f0:	0304b503          	ld	a0,48(s1)
    800069f4:	ffffb097          	auipc	ra,0xffffb
    800069f8:	a18080e7          	jalr	-1512(ra) # 8000140c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800069fc:	0144a783          	lw	a5,20(s1)
    80006a00:	0104a903          	lw	s2,16(s1)
    80006a04:	0327ce63          	blt	a5,s2,80006a40 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006a08:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006a0c:	0304b503          	ld	a0,48(s1)
    80006a10:	ffffb097          	auipc	ra,0xffffb
    80006a14:	a28080e7          	jalr	-1496(ra) # 80001438 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006a18:	0284b503          	ld	a0,40(s1)
    80006a1c:	ffffb097          	auipc	ra,0xffffb
    80006a20:	a1c080e7          	jalr	-1508(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006a24:	00090513          	mv	a0,s2
    80006a28:	01813083          	ld	ra,24(sp)
    80006a2c:	01013403          	ld	s0,16(sp)
    80006a30:	00813483          	ld	s1,8(sp)
    80006a34:	00013903          	ld	s2,0(sp)
    80006a38:	02010113          	addi	sp,sp,32
    80006a3c:	00008067          	ret
        ret = cap - head + tail;
    80006a40:	0004a703          	lw	a4,0(s1)
    80006a44:	4127093b          	subw	s2,a4,s2
    80006a48:	00f9093b          	addw	s2,s2,a5
    80006a4c:	fc1ff06f          	j	80006a0c <_ZN9BufferCPP6getCntEv+0x44>

0000000080006a50 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006a50:	fe010113          	addi	sp,sp,-32
    80006a54:	00113c23          	sd	ra,24(sp)
    80006a58:	00813823          	sd	s0,16(sp)
    80006a5c:	00913423          	sd	s1,8(sp)
    80006a60:	02010413          	addi	s0,sp,32
    80006a64:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006a68:	00a00513          	li	a0,10
    80006a6c:	ffffc097          	auipc	ra,0xffffc
    80006a70:	b18080e7          	jalr	-1256(ra) # 80002584 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006a74:	00005517          	auipc	a0,0x5
    80006a78:	9b450513          	addi	a0,a0,-1612 # 8000b428 <CONSOLE_STATUS+0x418>
    80006a7c:	00001097          	auipc	ra,0x1
    80006a80:	bf0080e7          	jalr	-1040(ra) # 8000766c <_Z11printStringPKc>
    while (getCnt()) {
    80006a84:	00048513          	mv	a0,s1
    80006a88:	00000097          	auipc	ra,0x0
    80006a8c:	f40080e7          	jalr	-192(ra) # 800069c8 <_ZN9BufferCPP6getCntEv>
    80006a90:	02050c63          	beqz	a0,80006ac8 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006a94:	0084b783          	ld	a5,8(s1)
    80006a98:	0104a703          	lw	a4,16(s1)
    80006a9c:	00271713          	slli	a4,a4,0x2
    80006aa0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006aa4:	0007c503          	lbu	a0,0(a5)
    80006aa8:	ffffc097          	auipc	ra,0xffffc
    80006aac:	adc080e7          	jalr	-1316(ra) # 80002584 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006ab0:	0104a783          	lw	a5,16(s1)
    80006ab4:	0017879b          	addiw	a5,a5,1
    80006ab8:	0004a703          	lw	a4,0(s1)
    80006abc:	02e7e7bb          	remw	a5,a5,a4
    80006ac0:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006ac4:	fc1ff06f          	j	80006a84 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006ac8:	02100513          	li	a0,33
    80006acc:	ffffc097          	auipc	ra,0xffffc
    80006ad0:	ab8080e7          	jalr	-1352(ra) # 80002584 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006ad4:	00a00513          	li	a0,10
    80006ad8:	ffffc097          	auipc	ra,0xffffc
    80006adc:	aac080e7          	jalr	-1364(ra) # 80002584 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006ae0:	0084b503          	ld	a0,8(s1)
    80006ae4:	ffffb097          	auipc	ra,0xffffb
    80006ae8:	d7c080e7          	jalr	-644(ra) # 80001860 <_Z8mem_freePv>
    delete itemAvailable;
    80006aec:	0204b503          	ld	a0,32(s1)
    80006af0:	00050863          	beqz	a0,80006b00 <_ZN9BufferCPPD1Ev+0xb0>
    80006af4:	00053783          	ld	a5,0(a0)
    80006af8:	0087b783          	ld	a5,8(a5)
    80006afc:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006b00:	0184b503          	ld	a0,24(s1)
    80006b04:	00050863          	beqz	a0,80006b14 <_ZN9BufferCPPD1Ev+0xc4>
    80006b08:	00053783          	ld	a5,0(a0)
    80006b0c:	0087b783          	ld	a5,8(a5)
    80006b10:	000780e7          	jalr	a5
    delete mutexTail;
    80006b14:	0304b503          	ld	a0,48(s1)
    80006b18:	00050863          	beqz	a0,80006b28 <_ZN9BufferCPPD1Ev+0xd8>
    80006b1c:	00053783          	ld	a5,0(a0)
    80006b20:	0087b783          	ld	a5,8(a5)
    80006b24:	000780e7          	jalr	a5
    delete mutexHead;
    80006b28:	0284b503          	ld	a0,40(s1)
    80006b2c:	00050863          	beqz	a0,80006b3c <_ZN9BufferCPPD1Ev+0xec>
    80006b30:	00053783          	ld	a5,0(a0)
    80006b34:	0087b783          	ld	a5,8(a5)
    80006b38:	000780e7          	jalr	a5
}
    80006b3c:	01813083          	ld	ra,24(sp)
    80006b40:	01013403          	ld	s0,16(sp)
    80006b44:	00813483          	ld	s1,8(sp)
    80006b48:	02010113          	addi	sp,sp,32
    80006b4c:	00008067          	ret

0000000080006b50 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006b50:	fe010113          	addi	sp,sp,-32
    80006b54:	00113c23          	sd	ra,24(sp)
    80006b58:	00813823          	sd	s0,16(sp)
    80006b5c:	00913423          	sd	s1,8(sp)
    80006b60:	01213023          	sd	s2,0(sp)
    80006b64:	02010413          	addi	s0,sp,32
    80006b68:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006b6c:	00100793          	li	a5,1
    80006b70:	02a7f863          	bgeu	a5,a0,80006ba0 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006b74:	00a00793          	li	a5,10
    80006b78:	02f577b3          	remu	a5,a0,a5
    80006b7c:	02078e63          	beqz	a5,80006bb8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006b80:	fff48513          	addi	a0,s1,-1
    80006b84:	00000097          	auipc	ra,0x0
    80006b88:	fcc080e7          	jalr	-52(ra) # 80006b50 <_ZL9fibonaccim>
    80006b8c:	00050913          	mv	s2,a0
    80006b90:	ffe48513          	addi	a0,s1,-2
    80006b94:	00000097          	auipc	ra,0x0
    80006b98:	fbc080e7          	jalr	-68(ra) # 80006b50 <_ZL9fibonaccim>
    80006b9c:	00a90533          	add	a0,s2,a0
}
    80006ba0:	01813083          	ld	ra,24(sp)
    80006ba4:	01013403          	ld	s0,16(sp)
    80006ba8:	00813483          	ld	s1,8(sp)
    80006bac:	00013903          	ld	s2,0(sp)
    80006bb0:	02010113          	addi	sp,sp,32
    80006bb4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006bb8:	ffffb097          	auipc	ra,0xffffb
    80006bbc:	d70080e7          	jalr	-656(ra) # 80001928 <_Z15thread_dispatchv>
    80006bc0:	fc1ff06f          	j	80006b80 <_ZL9fibonaccim+0x30>

0000000080006bc4 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80006bc4:	fe010113          	addi	sp,sp,-32
    80006bc8:	00113c23          	sd	ra,24(sp)
    80006bcc:	00813823          	sd	s0,16(sp)
    80006bd0:	00913423          	sd	s1,8(sp)
    80006bd4:	01213023          	sd	s2,0(sp)
    80006bd8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006bdc:	00000913          	li	s2,0
    80006be0:	0380006f          	j	80006c18 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80006be4:	ffffb097          	auipc	ra,0xffffb
    80006be8:	d44080e7          	jalr	-700(ra) # 80001928 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006bec:	00148493          	addi	s1,s1,1
    80006bf0:	000027b7          	lui	a5,0x2
    80006bf4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006bf8:	0097ee63          	bltu	a5,s1,80006c14 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006bfc:	00000713          	li	a4,0
    80006c00:	000077b7          	lui	a5,0x7
    80006c04:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006c08:	fce7eee3          	bltu	a5,a4,80006be4 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80006c0c:	00170713          	addi	a4,a4,1
    80006c10:	ff1ff06f          	j	80006c00 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006c14:	00190913          	addi	s2,s2,1
    80006c18:	00900793          	li	a5,9
    80006c1c:	0527e063          	bltu	a5,s2,80006c5c <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006c20:	00005517          	auipc	a0,0x5
    80006c24:	99850513          	addi	a0,a0,-1640 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80006c28:	00001097          	auipc	ra,0x1
    80006c2c:	a44080e7          	jalr	-1468(ra) # 8000766c <_Z11printStringPKc>
    80006c30:	00000613          	li	a2,0
    80006c34:	00a00593          	li	a1,10
    80006c38:	0009051b          	sext.w	a0,s2
    80006c3c:	00001097          	auipc	ra,0x1
    80006c40:	be0080e7          	jalr	-1056(ra) # 8000781c <_Z8printIntiii>
    80006c44:	00005517          	auipc	a0,0x5
    80006c48:	bac50513          	addi	a0,a0,-1108 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006c4c:	00001097          	auipc	ra,0x1
    80006c50:	a20080e7          	jalr	-1504(ra) # 8000766c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006c54:	00000493          	li	s1,0
    80006c58:	f99ff06f          	j	80006bf0 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80006c5c:	00005517          	auipc	a0,0x5
    80006c60:	96450513          	addi	a0,a0,-1692 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80006c64:	00001097          	auipc	ra,0x1
    80006c68:	a08080e7          	jalr	-1528(ra) # 8000766c <_Z11printStringPKc>
    finishedA = true;
    80006c6c:	00100793          	li	a5,1
    80006c70:	00007717          	auipc	a4,0x7
    80006c74:	36f70523          	sb	a5,874(a4) # 8000dfda <_ZL9finishedA>
}
    80006c78:	01813083          	ld	ra,24(sp)
    80006c7c:	01013403          	ld	s0,16(sp)
    80006c80:	00813483          	ld	s1,8(sp)
    80006c84:	00013903          	ld	s2,0(sp)
    80006c88:	02010113          	addi	sp,sp,32
    80006c8c:	00008067          	ret

0000000080006c90 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80006c90:	fe010113          	addi	sp,sp,-32
    80006c94:	00113c23          	sd	ra,24(sp)
    80006c98:	00813823          	sd	s0,16(sp)
    80006c9c:	00913423          	sd	s1,8(sp)
    80006ca0:	01213023          	sd	s2,0(sp)
    80006ca4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006ca8:	00000913          	li	s2,0
    80006cac:	0380006f          	j	80006ce4 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80006cb0:	ffffb097          	auipc	ra,0xffffb
    80006cb4:	c78080e7          	jalr	-904(ra) # 80001928 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006cb8:	00148493          	addi	s1,s1,1
    80006cbc:	000027b7          	lui	a5,0x2
    80006cc0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006cc4:	0097ee63          	bltu	a5,s1,80006ce0 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006cc8:	00000713          	li	a4,0
    80006ccc:	000077b7          	lui	a5,0x7
    80006cd0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006cd4:	fce7eee3          	bltu	a5,a4,80006cb0 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80006cd8:	00170713          	addi	a4,a4,1
    80006cdc:	ff1ff06f          	j	80006ccc <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80006ce0:	00190913          	addi	s2,s2,1
    80006ce4:	00f00793          	li	a5,15
    80006ce8:	0527e063          	bltu	a5,s2,80006d28 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80006cec:	00005517          	auipc	a0,0x5
    80006cf0:	8b450513          	addi	a0,a0,-1868 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80006cf4:	00001097          	auipc	ra,0x1
    80006cf8:	978080e7          	jalr	-1672(ra) # 8000766c <_Z11printStringPKc>
    80006cfc:	00000613          	li	a2,0
    80006d00:	00a00593          	li	a1,10
    80006d04:	0009051b          	sext.w	a0,s2
    80006d08:	00001097          	auipc	ra,0x1
    80006d0c:	b14080e7          	jalr	-1260(ra) # 8000781c <_Z8printIntiii>
    80006d10:	00005517          	auipc	a0,0x5
    80006d14:	ae050513          	addi	a0,a0,-1312 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006d18:	00001097          	auipc	ra,0x1
    80006d1c:	954080e7          	jalr	-1708(ra) # 8000766c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006d20:	00000493          	li	s1,0
    80006d24:	f99ff06f          	j	80006cbc <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80006d28:	00005517          	auipc	a0,0x5
    80006d2c:	88050513          	addi	a0,a0,-1920 # 8000b5a8 <CONSOLE_STATUS+0x598>
    80006d30:	00001097          	auipc	ra,0x1
    80006d34:	93c080e7          	jalr	-1732(ra) # 8000766c <_Z11printStringPKc>
    finishedB = true;
    80006d38:	00100793          	li	a5,1
    80006d3c:	00007717          	auipc	a4,0x7
    80006d40:	28f70fa3          	sb	a5,671(a4) # 8000dfdb <_ZL9finishedB>
    thread_dispatch();
    80006d44:	ffffb097          	auipc	ra,0xffffb
    80006d48:	be4080e7          	jalr	-1052(ra) # 80001928 <_Z15thread_dispatchv>
}
    80006d4c:	01813083          	ld	ra,24(sp)
    80006d50:	01013403          	ld	s0,16(sp)
    80006d54:	00813483          	ld	s1,8(sp)
    80006d58:	00013903          	ld	s2,0(sp)
    80006d5c:	02010113          	addi	sp,sp,32
    80006d60:	00008067          	ret

0000000080006d64 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80006d64:	fe010113          	addi	sp,sp,-32
    80006d68:	00113c23          	sd	ra,24(sp)
    80006d6c:	00813823          	sd	s0,16(sp)
    80006d70:	00913423          	sd	s1,8(sp)
    80006d74:	01213023          	sd	s2,0(sp)
    80006d78:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006d7c:	00000493          	li	s1,0
    80006d80:	0400006f          	j	80006dc0 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80006d84:	00004517          	auipc	a0,0x4
    80006d88:	7dc50513          	addi	a0,a0,2012 # 8000b560 <CONSOLE_STATUS+0x550>
    80006d8c:	00001097          	auipc	ra,0x1
    80006d90:	8e0080e7          	jalr	-1824(ra) # 8000766c <_Z11printStringPKc>
    80006d94:	00000613          	li	a2,0
    80006d98:	00a00593          	li	a1,10
    80006d9c:	00048513          	mv	a0,s1
    80006da0:	00001097          	auipc	ra,0x1
    80006da4:	a7c080e7          	jalr	-1412(ra) # 8000781c <_Z8printIntiii>
    80006da8:	00005517          	auipc	a0,0x5
    80006dac:	a4850513          	addi	a0,a0,-1464 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006db0:	00001097          	auipc	ra,0x1
    80006db4:	8bc080e7          	jalr	-1860(ra) # 8000766c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006db8:	0014849b          	addiw	s1,s1,1
    80006dbc:	0ff4f493          	andi	s1,s1,255
    80006dc0:	00200793          	li	a5,2
    80006dc4:	fc97f0e3          	bgeu	a5,s1,80006d84 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80006dc8:	00004517          	auipc	a0,0x4
    80006dcc:	7a050513          	addi	a0,a0,1952 # 8000b568 <CONSOLE_STATUS+0x558>
    80006dd0:	00001097          	auipc	ra,0x1
    80006dd4:	89c080e7          	jalr	-1892(ra) # 8000766c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006dd8:	00700313          	li	t1,7
    thread_dispatch();
    80006ddc:	ffffb097          	auipc	ra,0xffffb
    80006de0:	b4c080e7          	jalr	-1204(ra) # 80001928 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006de4:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80006de8:	00004517          	auipc	a0,0x4
    80006dec:	79050513          	addi	a0,a0,1936 # 8000b578 <CONSOLE_STATUS+0x568>
    80006df0:	00001097          	auipc	ra,0x1
    80006df4:	87c080e7          	jalr	-1924(ra) # 8000766c <_Z11printStringPKc>
    80006df8:	00000613          	li	a2,0
    80006dfc:	00a00593          	li	a1,10
    80006e00:	0009051b          	sext.w	a0,s2
    80006e04:	00001097          	auipc	ra,0x1
    80006e08:	a18080e7          	jalr	-1512(ra) # 8000781c <_Z8printIntiii>
    80006e0c:	00005517          	auipc	a0,0x5
    80006e10:	9e450513          	addi	a0,a0,-1564 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006e14:	00001097          	auipc	ra,0x1
    80006e18:	858080e7          	jalr	-1960(ra) # 8000766c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80006e1c:	00c00513          	li	a0,12
    80006e20:	00000097          	auipc	ra,0x0
    80006e24:	d30080e7          	jalr	-720(ra) # 80006b50 <_ZL9fibonaccim>
    80006e28:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006e2c:	00004517          	auipc	a0,0x4
    80006e30:	75450513          	addi	a0,a0,1876 # 8000b580 <CONSOLE_STATUS+0x570>
    80006e34:	00001097          	auipc	ra,0x1
    80006e38:	838080e7          	jalr	-1992(ra) # 8000766c <_Z11printStringPKc>
    80006e3c:	00000613          	li	a2,0
    80006e40:	00a00593          	li	a1,10
    80006e44:	0009051b          	sext.w	a0,s2
    80006e48:	00001097          	auipc	ra,0x1
    80006e4c:	9d4080e7          	jalr	-1580(ra) # 8000781c <_Z8printIntiii>
    80006e50:	00005517          	auipc	a0,0x5
    80006e54:	9a050513          	addi	a0,a0,-1632 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006e58:	00001097          	auipc	ra,0x1
    80006e5c:	814080e7          	jalr	-2028(ra) # 8000766c <_Z11printStringPKc>
    80006e60:	0400006f          	j	80006ea0 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80006e64:	00004517          	auipc	a0,0x4
    80006e68:	6fc50513          	addi	a0,a0,1788 # 8000b560 <CONSOLE_STATUS+0x550>
    80006e6c:	00001097          	auipc	ra,0x1
    80006e70:	800080e7          	jalr	-2048(ra) # 8000766c <_Z11printStringPKc>
    80006e74:	00000613          	li	a2,0
    80006e78:	00a00593          	li	a1,10
    80006e7c:	00048513          	mv	a0,s1
    80006e80:	00001097          	auipc	ra,0x1
    80006e84:	99c080e7          	jalr	-1636(ra) # 8000781c <_Z8printIntiii>
    80006e88:	00005517          	auipc	a0,0x5
    80006e8c:	96850513          	addi	a0,a0,-1688 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006e90:	00000097          	auipc	ra,0x0
    80006e94:	7dc080e7          	jalr	2012(ra) # 8000766c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006e98:	0014849b          	addiw	s1,s1,1
    80006e9c:	0ff4f493          	andi	s1,s1,255
    80006ea0:	00500793          	li	a5,5
    80006ea4:	fc97f0e3          	bgeu	a5,s1,80006e64 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80006ea8:	00004517          	auipc	a0,0x4
    80006eac:	71850513          	addi	a0,a0,1816 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80006eb0:	00000097          	auipc	ra,0x0
    80006eb4:	7bc080e7          	jalr	1980(ra) # 8000766c <_Z11printStringPKc>
    finishedC = true;
    80006eb8:	00100793          	li	a5,1
    80006ebc:	00007717          	auipc	a4,0x7
    80006ec0:	12f70023          	sb	a5,288(a4) # 8000dfdc <_ZL9finishedC>
    thread_dispatch();
    80006ec4:	ffffb097          	auipc	ra,0xffffb
    80006ec8:	a64080e7          	jalr	-1436(ra) # 80001928 <_Z15thread_dispatchv>
}
    80006ecc:	01813083          	ld	ra,24(sp)
    80006ed0:	01013403          	ld	s0,16(sp)
    80006ed4:	00813483          	ld	s1,8(sp)
    80006ed8:	00013903          	ld	s2,0(sp)
    80006edc:	02010113          	addi	sp,sp,32
    80006ee0:	00008067          	ret

0000000080006ee4 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80006ee4:	fe010113          	addi	sp,sp,-32
    80006ee8:	00113c23          	sd	ra,24(sp)
    80006eec:	00813823          	sd	s0,16(sp)
    80006ef0:	00913423          	sd	s1,8(sp)
    80006ef4:	01213023          	sd	s2,0(sp)
    80006ef8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006efc:	00a00493          	li	s1,10
    80006f00:	0400006f          	j	80006f40 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006f04:	00004517          	auipc	a0,0x4
    80006f08:	62450513          	addi	a0,a0,1572 # 8000b528 <CONSOLE_STATUS+0x518>
    80006f0c:	00000097          	auipc	ra,0x0
    80006f10:	760080e7          	jalr	1888(ra) # 8000766c <_Z11printStringPKc>
    80006f14:	00000613          	li	a2,0
    80006f18:	00a00593          	li	a1,10
    80006f1c:	00048513          	mv	a0,s1
    80006f20:	00001097          	auipc	ra,0x1
    80006f24:	8fc080e7          	jalr	-1796(ra) # 8000781c <_Z8printIntiii>
    80006f28:	00005517          	auipc	a0,0x5
    80006f2c:	8c850513          	addi	a0,a0,-1848 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006f30:	00000097          	auipc	ra,0x0
    80006f34:	73c080e7          	jalr	1852(ra) # 8000766c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006f38:	0014849b          	addiw	s1,s1,1
    80006f3c:	0ff4f493          	andi	s1,s1,255
    80006f40:	00c00793          	li	a5,12
    80006f44:	fc97f0e3          	bgeu	a5,s1,80006f04 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80006f48:	00004517          	auipc	a0,0x4
    80006f4c:	5e850513          	addi	a0,a0,1512 # 8000b530 <CONSOLE_STATUS+0x520>
    80006f50:	00000097          	auipc	ra,0x0
    80006f54:	71c080e7          	jalr	1820(ra) # 8000766c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006f58:	00500313          	li	t1,5
    thread_dispatch();
    80006f5c:	ffffb097          	auipc	ra,0xffffb
    80006f60:	9cc080e7          	jalr	-1588(ra) # 80001928 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006f64:	01000513          	li	a0,16
    80006f68:	00000097          	auipc	ra,0x0
    80006f6c:	be8080e7          	jalr	-1048(ra) # 80006b50 <_ZL9fibonaccim>
    80006f70:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006f74:	00004517          	auipc	a0,0x4
    80006f78:	5cc50513          	addi	a0,a0,1484 # 8000b540 <CONSOLE_STATUS+0x530>
    80006f7c:	00000097          	auipc	ra,0x0
    80006f80:	6f0080e7          	jalr	1776(ra) # 8000766c <_Z11printStringPKc>
    80006f84:	00000613          	li	a2,0
    80006f88:	00a00593          	li	a1,10
    80006f8c:	0009051b          	sext.w	a0,s2
    80006f90:	00001097          	auipc	ra,0x1
    80006f94:	88c080e7          	jalr	-1908(ra) # 8000781c <_Z8printIntiii>
    80006f98:	00005517          	auipc	a0,0x5
    80006f9c:	85850513          	addi	a0,a0,-1960 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006fa0:	00000097          	auipc	ra,0x0
    80006fa4:	6cc080e7          	jalr	1740(ra) # 8000766c <_Z11printStringPKc>
    80006fa8:	0400006f          	j	80006fe8 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006fac:	00004517          	auipc	a0,0x4
    80006fb0:	57c50513          	addi	a0,a0,1404 # 8000b528 <CONSOLE_STATUS+0x518>
    80006fb4:	00000097          	auipc	ra,0x0
    80006fb8:	6b8080e7          	jalr	1720(ra) # 8000766c <_Z11printStringPKc>
    80006fbc:	00000613          	li	a2,0
    80006fc0:	00a00593          	li	a1,10
    80006fc4:	00048513          	mv	a0,s1
    80006fc8:	00001097          	auipc	ra,0x1
    80006fcc:	854080e7          	jalr	-1964(ra) # 8000781c <_Z8printIntiii>
    80006fd0:	00005517          	auipc	a0,0x5
    80006fd4:	82050513          	addi	a0,a0,-2016 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006fd8:	00000097          	auipc	ra,0x0
    80006fdc:	694080e7          	jalr	1684(ra) # 8000766c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006fe0:	0014849b          	addiw	s1,s1,1
    80006fe4:	0ff4f493          	andi	s1,s1,255
    80006fe8:	00f00793          	li	a5,15
    80006fec:	fc97f0e3          	bgeu	a5,s1,80006fac <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80006ff0:	00004517          	auipc	a0,0x4
    80006ff4:	56050513          	addi	a0,a0,1376 # 8000b550 <CONSOLE_STATUS+0x540>
    80006ff8:	00000097          	auipc	ra,0x0
    80006ffc:	674080e7          	jalr	1652(ra) # 8000766c <_Z11printStringPKc>
    finishedD = true;
    80007000:	00100793          	li	a5,1
    80007004:	00007717          	auipc	a4,0x7
    80007008:	fcf70ca3          	sb	a5,-39(a4) # 8000dfdd <_ZL9finishedD>
    thread_dispatch();
    8000700c:	ffffb097          	auipc	ra,0xffffb
    80007010:	91c080e7          	jalr	-1764(ra) # 80001928 <_Z15thread_dispatchv>
}
    80007014:	01813083          	ld	ra,24(sp)
    80007018:	01013403          	ld	s0,16(sp)
    8000701c:	00813483          	ld	s1,8(sp)
    80007020:	00013903          	ld	s2,0(sp)
    80007024:	02010113          	addi	sp,sp,32
    80007028:	00008067          	ret

000000008000702c <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    8000702c:	fc010113          	addi	sp,sp,-64
    80007030:	02113c23          	sd	ra,56(sp)
    80007034:	02813823          	sd	s0,48(sp)
    80007038:	02913423          	sd	s1,40(sp)
    8000703c:	03213023          	sd	s2,32(sp)
    80007040:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80007044:	02000513          	li	a0,32
    80007048:	ffffa097          	auipc	ra,0xffffa
    8000704c:	174080e7          	jalr	372(ra) # 800011bc <_Znwm>
    80007050:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80007054:	ffffa097          	auipc	ra,0xffffa
    80007058:	34c080e7          	jalr	844(ra) # 800013a0 <_ZN6ThreadC1Ev>
    8000705c:	00007797          	auipc	a5,0x7
    80007060:	d5c78793          	addi	a5,a5,-676 # 8000ddb8 <_ZTV7WorkerA+0x10>
    80007064:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80007068:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    8000706c:	00004517          	auipc	a0,0x4
    80007070:	56450513          	addi	a0,a0,1380 # 8000b5d0 <CONSOLE_STATUS+0x5c0>
    80007074:	00000097          	auipc	ra,0x0
    80007078:	5f8080e7          	jalr	1528(ra) # 8000766c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    8000707c:	02000513          	li	a0,32
    80007080:	ffffa097          	auipc	ra,0xffffa
    80007084:	13c080e7          	jalr	316(ra) # 800011bc <_Znwm>
    80007088:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    8000708c:	ffffa097          	auipc	ra,0xffffa
    80007090:	314080e7          	jalr	788(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007094:	00007797          	auipc	a5,0x7
    80007098:	d4c78793          	addi	a5,a5,-692 # 8000dde0 <_ZTV7WorkerB+0x10>
    8000709c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800070a0:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800070a4:	00004517          	auipc	a0,0x4
    800070a8:	54450513          	addi	a0,a0,1348 # 8000b5e8 <CONSOLE_STATUS+0x5d8>
    800070ac:	00000097          	auipc	ra,0x0
    800070b0:	5c0080e7          	jalr	1472(ra) # 8000766c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800070b4:	02000513          	li	a0,32
    800070b8:	ffffa097          	auipc	ra,0xffffa
    800070bc:	104080e7          	jalr	260(ra) # 800011bc <_Znwm>
    800070c0:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800070c4:	ffffa097          	auipc	ra,0xffffa
    800070c8:	2dc080e7          	jalr	732(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800070cc:	00007797          	auipc	a5,0x7
    800070d0:	d3c78793          	addi	a5,a5,-708 # 8000de08 <_ZTV7WorkerC+0x10>
    800070d4:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800070d8:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800070dc:	00004517          	auipc	a0,0x4
    800070e0:	52450513          	addi	a0,a0,1316 # 8000b600 <CONSOLE_STATUS+0x5f0>
    800070e4:	00000097          	auipc	ra,0x0
    800070e8:	588080e7          	jalr	1416(ra) # 8000766c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800070ec:	02000513          	li	a0,32
    800070f0:	ffffa097          	auipc	ra,0xffffa
    800070f4:	0cc080e7          	jalr	204(ra) # 800011bc <_Znwm>
    800070f8:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800070fc:	ffffa097          	auipc	ra,0xffffa
    80007100:	2a4080e7          	jalr	676(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007104:	00007797          	auipc	a5,0x7
    80007108:	d2c78793          	addi	a5,a5,-724 # 8000de30 <_ZTV7WorkerD+0x10>
    8000710c:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80007110:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80007114:	00004517          	auipc	a0,0x4
    80007118:	50450513          	addi	a0,a0,1284 # 8000b618 <CONSOLE_STATUS+0x608>
    8000711c:	00000097          	auipc	ra,0x0
    80007120:	550080e7          	jalr	1360(ra) # 8000766c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80007124:	00000493          	li	s1,0
    80007128:	00300793          	li	a5,3
    8000712c:	0297c663          	blt	a5,s1,80007158 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80007130:	00349793          	slli	a5,s1,0x3
    80007134:	fe040713          	addi	a4,s0,-32
    80007138:	00f707b3          	add	a5,a4,a5
    8000713c:	fe07b503          	ld	a0,-32(a5)
    80007140:	ffffa097          	auipc	ra,0xffffa
    80007144:	178080e7          	jalr	376(ra) # 800012b8 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80007148:	0014849b          	addiw	s1,s1,1
    8000714c:	fddff06f          	j	80007128 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80007150:	ffffa097          	auipc	ra,0xffffa
    80007154:	1c8080e7          	jalr	456(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80007158:	00007797          	auipc	a5,0x7
    8000715c:	e827c783          	lbu	a5,-382(a5) # 8000dfda <_ZL9finishedA>
    80007160:	fe0788e3          	beqz	a5,80007150 <_Z20Threads_CPP_API_testv+0x124>
    80007164:	00007797          	auipc	a5,0x7
    80007168:	e777c783          	lbu	a5,-393(a5) # 8000dfdb <_ZL9finishedB>
    8000716c:	fe0782e3          	beqz	a5,80007150 <_Z20Threads_CPP_API_testv+0x124>
    80007170:	00007797          	auipc	a5,0x7
    80007174:	e6c7c783          	lbu	a5,-404(a5) # 8000dfdc <_ZL9finishedC>
    80007178:	fc078ce3          	beqz	a5,80007150 <_Z20Threads_CPP_API_testv+0x124>
    8000717c:	00007797          	auipc	a5,0x7
    80007180:	e617c783          	lbu	a5,-415(a5) # 8000dfdd <_ZL9finishedD>
    80007184:	fc0786e3          	beqz	a5,80007150 <_Z20Threads_CPP_API_testv+0x124>
    80007188:	fc040493          	addi	s1,s0,-64
    8000718c:	0080006f          	j	80007194 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80007190:	00848493          	addi	s1,s1,8
    80007194:	fe040793          	addi	a5,s0,-32
    80007198:	08f48663          	beq	s1,a5,80007224 <_Z20Threads_CPP_API_testv+0x1f8>
    8000719c:	0004b503          	ld	a0,0(s1)
    800071a0:	fe0508e3          	beqz	a0,80007190 <_Z20Threads_CPP_API_testv+0x164>
    800071a4:	00053783          	ld	a5,0(a0)
    800071a8:	0087b783          	ld	a5,8(a5)
    800071ac:	000780e7          	jalr	a5
    800071b0:	fe1ff06f          	j	80007190 <_Z20Threads_CPP_API_testv+0x164>
    800071b4:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800071b8:	00048513          	mv	a0,s1
    800071bc:	ffffa097          	auipc	ra,0xffffa
    800071c0:	028080e7          	jalr	40(ra) # 800011e4 <_ZdlPv>
    800071c4:	00090513          	mv	a0,s2
    800071c8:	00008097          	auipc	ra,0x8
    800071cc:	f00080e7          	jalr	-256(ra) # 8000f0c8 <_Unwind_Resume>
    800071d0:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800071d4:	00048513          	mv	a0,s1
    800071d8:	ffffa097          	auipc	ra,0xffffa
    800071dc:	00c080e7          	jalr	12(ra) # 800011e4 <_ZdlPv>
    800071e0:	00090513          	mv	a0,s2
    800071e4:	00008097          	auipc	ra,0x8
    800071e8:	ee4080e7          	jalr	-284(ra) # 8000f0c8 <_Unwind_Resume>
    800071ec:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800071f0:	00048513          	mv	a0,s1
    800071f4:	ffffa097          	auipc	ra,0xffffa
    800071f8:	ff0080e7          	jalr	-16(ra) # 800011e4 <_ZdlPv>
    800071fc:	00090513          	mv	a0,s2
    80007200:	00008097          	auipc	ra,0x8
    80007204:	ec8080e7          	jalr	-312(ra) # 8000f0c8 <_Unwind_Resume>
    80007208:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    8000720c:	00048513          	mv	a0,s1
    80007210:	ffffa097          	auipc	ra,0xffffa
    80007214:	fd4080e7          	jalr	-44(ra) # 800011e4 <_ZdlPv>
    80007218:	00090513          	mv	a0,s2
    8000721c:	00008097          	auipc	ra,0x8
    80007220:	eac080e7          	jalr	-340(ra) # 8000f0c8 <_Unwind_Resume>
}
    80007224:	03813083          	ld	ra,56(sp)
    80007228:	03013403          	ld	s0,48(sp)
    8000722c:	02813483          	ld	s1,40(sp)
    80007230:	02013903          	ld	s2,32(sp)
    80007234:	04010113          	addi	sp,sp,64
    80007238:	00008067          	ret

000000008000723c <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    8000723c:	ff010113          	addi	sp,sp,-16
    80007240:	00113423          	sd	ra,8(sp)
    80007244:	00813023          	sd	s0,0(sp)
    80007248:	01010413          	addi	s0,sp,16
    8000724c:	00007797          	auipc	a5,0x7
    80007250:	b6c78793          	addi	a5,a5,-1172 # 8000ddb8 <_ZTV7WorkerA+0x10>
    80007254:	00f53023          	sd	a5,0(a0)
    80007258:	ffffa097          	auipc	ra,0xffffa
    8000725c:	ef4080e7          	jalr	-268(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007260:	00813083          	ld	ra,8(sp)
    80007264:	00013403          	ld	s0,0(sp)
    80007268:	01010113          	addi	sp,sp,16
    8000726c:	00008067          	ret

0000000080007270 <_ZN7WorkerAD0Ev>:
    80007270:	fe010113          	addi	sp,sp,-32
    80007274:	00113c23          	sd	ra,24(sp)
    80007278:	00813823          	sd	s0,16(sp)
    8000727c:	00913423          	sd	s1,8(sp)
    80007280:	02010413          	addi	s0,sp,32
    80007284:	00050493          	mv	s1,a0
    80007288:	00007797          	auipc	a5,0x7
    8000728c:	b3078793          	addi	a5,a5,-1232 # 8000ddb8 <_ZTV7WorkerA+0x10>
    80007290:	00f53023          	sd	a5,0(a0)
    80007294:	ffffa097          	auipc	ra,0xffffa
    80007298:	eb8080e7          	jalr	-328(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000729c:	00048513          	mv	a0,s1
    800072a0:	ffffa097          	auipc	ra,0xffffa
    800072a4:	f44080e7          	jalr	-188(ra) # 800011e4 <_ZdlPv>
    800072a8:	01813083          	ld	ra,24(sp)
    800072ac:	01013403          	ld	s0,16(sp)
    800072b0:	00813483          	ld	s1,8(sp)
    800072b4:	02010113          	addi	sp,sp,32
    800072b8:	00008067          	ret

00000000800072bc <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800072bc:	ff010113          	addi	sp,sp,-16
    800072c0:	00113423          	sd	ra,8(sp)
    800072c4:	00813023          	sd	s0,0(sp)
    800072c8:	01010413          	addi	s0,sp,16
    800072cc:	00007797          	auipc	a5,0x7
    800072d0:	b1478793          	addi	a5,a5,-1260 # 8000dde0 <_ZTV7WorkerB+0x10>
    800072d4:	00f53023          	sd	a5,0(a0)
    800072d8:	ffffa097          	auipc	ra,0xffffa
    800072dc:	e74080e7          	jalr	-396(ra) # 8000114c <_ZN6ThreadD1Ev>
    800072e0:	00813083          	ld	ra,8(sp)
    800072e4:	00013403          	ld	s0,0(sp)
    800072e8:	01010113          	addi	sp,sp,16
    800072ec:	00008067          	ret

00000000800072f0 <_ZN7WorkerBD0Ev>:
    800072f0:	fe010113          	addi	sp,sp,-32
    800072f4:	00113c23          	sd	ra,24(sp)
    800072f8:	00813823          	sd	s0,16(sp)
    800072fc:	00913423          	sd	s1,8(sp)
    80007300:	02010413          	addi	s0,sp,32
    80007304:	00050493          	mv	s1,a0
    80007308:	00007797          	auipc	a5,0x7
    8000730c:	ad878793          	addi	a5,a5,-1320 # 8000dde0 <_ZTV7WorkerB+0x10>
    80007310:	00f53023          	sd	a5,0(a0)
    80007314:	ffffa097          	auipc	ra,0xffffa
    80007318:	e38080e7          	jalr	-456(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000731c:	00048513          	mv	a0,s1
    80007320:	ffffa097          	auipc	ra,0xffffa
    80007324:	ec4080e7          	jalr	-316(ra) # 800011e4 <_ZdlPv>
    80007328:	01813083          	ld	ra,24(sp)
    8000732c:	01013403          	ld	s0,16(sp)
    80007330:	00813483          	ld	s1,8(sp)
    80007334:	02010113          	addi	sp,sp,32
    80007338:	00008067          	ret

000000008000733c <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    8000733c:	ff010113          	addi	sp,sp,-16
    80007340:	00113423          	sd	ra,8(sp)
    80007344:	00813023          	sd	s0,0(sp)
    80007348:	01010413          	addi	s0,sp,16
    8000734c:	00007797          	auipc	a5,0x7
    80007350:	abc78793          	addi	a5,a5,-1348 # 8000de08 <_ZTV7WorkerC+0x10>
    80007354:	00f53023          	sd	a5,0(a0)
    80007358:	ffffa097          	auipc	ra,0xffffa
    8000735c:	df4080e7          	jalr	-524(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007360:	00813083          	ld	ra,8(sp)
    80007364:	00013403          	ld	s0,0(sp)
    80007368:	01010113          	addi	sp,sp,16
    8000736c:	00008067          	ret

0000000080007370 <_ZN7WorkerCD0Ev>:
    80007370:	fe010113          	addi	sp,sp,-32
    80007374:	00113c23          	sd	ra,24(sp)
    80007378:	00813823          	sd	s0,16(sp)
    8000737c:	00913423          	sd	s1,8(sp)
    80007380:	02010413          	addi	s0,sp,32
    80007384:	00050493          	mv	s1,a0
    80007388:	00007797          	auipc	a5,0x7
    8000738c:	a8078793          	addi	a5,a5,-1408 # 8000de08 <_ZTV7WorkerC+0x10>
    80007390:	00f53023          	sd	a5,0(a0)
    80007394:	ffffa097          	auipc	ra,0xffffa
    80007398:	db8080e7          	jalr	-584(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000739c:	00048513          	mv	a0,s1
    800073a0:	ffffa097          	auipc	ra,0xffffa
    800073a4:	e44080e7          	jalr	-444(ra) # 800011e4 <_ZdlPv>
    800073a8:	01813083          	ld	ra,24(sp)
    800073ac:	01013403          	ld	s0,16(sp)
    800073b0:	00813483          	ld	s1,8(sp)
    800073b4:	02010113          	addi	sp,sp,32
    800073b8:	00008067          	ret

00000000800073bc <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800073bc:	ff010113          	addi	sp,sp,-16
    800073c0:	00113423          	sd	ra,8(sp)
    800073c4:	00813023          	sd	s0,0(sp)
    800073c8:	01010413          	addi	s0,sp,16
    800073cc:	00007797          	auipc	a5,0x7
    800073d0:	a6478793          	addi	a5,a5,-1436 # 8000de30 <_ZTV7WorkerD+0x10>
    800073d4:	00f53023          	sd	a5,0(a0)
    800073d8:	ffffa097          	auipc	ra,0xffffa
    800073dc:	d74080e7          	jalr	-652(ra) # 8000114c <_ZN6ThreadD1Ev>
    800073e0:	00813083          	ld	ra,8(sp)
    800073e4:	00013403          	ld	s0,0(sp)
    800073e8:	01010113          	addi	sp,sp,16
    800073ec:	00008067          	ret

00000000800073f0 <_ZN7WorkerDD0Ev>:
    800073f0:	fe010113          	addi	sp,sp,-32
    800073f4:	00113c23          	sd	ra,24(sp)
    800073f8:	00813823          	sd	s0,16(sp)
    800073fc:	00913423          	sd	s1,8(sp)
    80007400:	02010413          	addi	s0,sp,32
    80007404:	00050493          	mv	s1,a0
    80007408:	00007797          	auipc	a5,0x7
    8000740c:	a2878793          	addi	a5,a5,-1496 # 8000de30 <_ZTV7WorkerD+0x10>
    80007410:	00f53023          	sd	a5,0(a0)
    80007414:	ffffa097          	auipc	ra,0xffffa
    80007418:	d38080e7          	jalr	-712(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000741c:	00048513          	mv	a0,s1
    80007420:	ffffa097          	auipc	ra,0xffffa
    80007424:	dc4080e7          	jalr	-572(ra) # 800011e4 <_ZdlPv>
    80007428:	01813083          	ld	ra,24(sp)
    8000742c:	01013403          	ld	s0,16(sp)
    80007430:	00813483          	ld	s1,8(sp)
    80007434:	02010113          	addi	sp,sp,32
    80007438:	00008067          	ret

000000008000743c <_ZN7WorkerA3runEv>:
    void run() override {
    8000743c:	ff010113          	addi	sp,sp,-16
    80007440:	00113423          	sd	ra,8(sp)
    80007444:	00813023          	sd	s0,0(sp)
    80007448:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    8000744c:	00000593          	li	a1,0
    80007450:	fffff097          	auipc	ra,0xfffff
    80007454:	774080e7          	jalr	1908(ra) # 80006bc4 <_ZN7WorkerA11workerBodyAEPv>
    }
    80007458:	00813083          	ld	ra,8(sp)
    8000745c:	00013403          	ld	s0,0(sp)
    80007460:	01010113          	addi	sp,sp,16
    80007464:	00008067          	ret

0000000080007468 <_ZN7WorkerB3runEv>:
    void run() override {
    80007468:	ff010113          	addi	sp,sp,-16
    8000746c:	00113423          	sd	ra,8(sp)
    80007470:	00813023          	sd	s0,0(sp)
    80007474:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80007478:	00000593          	li	a1,0
    8000747c:	00000097          	auipc	ra,0x0
    80007480:	814080e7          	jalr	-2028(ra) # 80006c90 <_ZN7WorkerB11workerBodyBEPv>
    }
    80007484:	00813083          	ld	ra,8(sp)
    80007488:	00013403          	ld	s0,0(sp)
    8000748c:	01010113          	addi	sp,sp,16
    80007490:	00008067          	ret

0000000080007494 <_ZN7WorkerC3runEv>:
    void run() override {
    80007494:	ff010113          	addi	sp,sp,-16
    80007498:	00113423          	sd	ra,8(sp)
    8000749c:	00813023          	sd	s0,0(sp)
    800074a0:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800074a4:	00000593          	li	a1,0
    800074a8:	00000097          	auipc	ra,0x0
    800074ac:	8bc080e7          	jalr	-1860(ra) # 80006d64 <_ZN7WorkerC11workerBodyCEPv>
    }
    800074b0:	00813083          	ld	ra,8(sp)
    800074b4:	00013403          	ld	s0,0(sp)
    800074b8:	01010113          	addi	sp,sp,16
    800074bc:	00008067          	ret

00000000800074c0 <_ZN7WorkerD3runEv>:
    void run() override {
    800074c0:	ff010113          	addi	sp,sp,-16
    800074c4:	00113423          	sd	ra,8(sp)
    800074c8:	00813023          	sd	s0,0(sp)
    800074cc:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800074d0:	00000593          	li	a1,0
    800074d4:	00000097          	auipc	ra,0x0
    800074d8:	a10080e7          	jalr	-1520(ra) # 80006ee4 <_ZN7WorkerD11workerBodyDEPv>
    }
    800074dc:	00813083          	ld	ra,8(sp)
    800074e0:	00013403          	ld	s0,0(sp)
    800074e4:	01010113          	addi	sp,sp,16
    800074e8:	00008067          	ret

00000000800074ec <_Z8userMainv>:
#include "../test_h/ConsumerProducer_CPP_API_test.h"
#include "../test_h/System_Mode_test.h"

#endif

void userMain() {
    800074ec:	fe010113          	addi	sp,sp,-32
    800074f0:	00113c23          	sd	ra,24(sp)
    800074f4:	00813823          	sd	s0,16(sp)
    800074f8:	00913423          	sd	s1,8(sp)
    800074fc:	01213023          	sd	s2,0(sp)
    80007500:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80007504:	00004517          	auipc	a0,0x4
    80007508:	1ac50513          	addi	a0,a0,428 # 8000b6b0 <CONSOLE_STATUS+0x6a0>
    8000750c:	00000097          	auipc	ra,0x0
    80007510:	160080e7          	jalr	352(ra) # 8000766c <_Z11printStringPKc>
    int test = getc() - '0';
    80007514:	ffffa097          	auipc	ra,0xffffa
    80007518:	540080e7          	jalr	1344(ra) # 80001a54 <_Z4getcv>
    8000751c:	00050913          	mv	s2,a0
    80007520:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80007524:	ffffa097          	auipc	ra,0xffffa
    80007528:	530080e7          	jalr	1328(ra) # 80001a54 <_Z4getcv>
    putc(test);
    8000752c:	fd09051b          	addiw	a0,s2,-48
    80007530:	0ff57513          	andi	a0,a0,255
    80007534:	ffffa097          	auipc	ra,0xffffa
    80007538:	548080e7          	jalr	1352(ra) # 80001a7c <_Z4putcc>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    8000753c:	00700793          	li	a5,7
    80007540:	1097ec63          	bltu	a5,s1,80007658 <_Z8userMainv+0x16c>
    80007544:	00249493          	slli	s1,s1,0x2
    80007548:	00004717          	auipc	a4,0x4
    8000754c:	3d470713          	addi	a4,a4,980 # 8000b91c <CONSOLE_STATUS+0x90c>
    80007550:	00e484b3          	add	s1,s1,a4
    80007554:	0004a783          	lw	a5,0(s1)
    80007558:	00e787b3          	add	a5,a5,a4
    8000755c:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80007560:	fffff097          	auipc	ra,0xfffff
    80007564:	f64080e7          	jalr	-156(ra) # 800064c4 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80007568:	00004517          	auipc	a0,0x4
    8000756c:	16850513          	addi	a0,a0,360 # 8000b6d0 <CONSOLE_STATUS+0x6c0>
    80007570:	00000097          	auipc	ra,0x0
    80007574:	0fc080e7          	jalr	252(ra) # 8000766c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    printString("Kraj izvrsavanja");
    80007578:	00004517          	auipc	a0,0x4
    8000757c:	39050513          	addi	a0,a0,912 # 8000b908 <CONSOLE_STATUS+0x8f8>
    80007580:	00000097          	auipc	ra,0x0
    80007584:	0ec080e7          	jalr	236(ra) # 8000766c <_Z11printStringPKc>
    80007588:	01813083          	ld	ra,24(sp)
    8000758c:	01013403          	ld	s0,16(sp)
    80007590:	00813483          	ld	s1,8(sp)
    80007594:	00013903          	ld	s2,0(sp)
    80007598:	02010113          	addi	sp,sp,32
    8000759c:	00008067          	ret
            Threads_CPP_API_test();
    800075a0:	00000097          	auipc	ra,0x0
    800075a4:	a8c080e7          	jalr	-1396(ra) # 8000702c <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800075a8:	00004517          	auipc	a0,0x4
    800075ac:	16850513          	addi	a0,a0,360 # 8000b710 <CONSOLE_STATUS+0x700>
    800075b0:	00000097          	auipc	ra,0x0
    800075b4:	0bc080e7          	jalr	188(ra) # 8000766c <_Z11printStringPKc>
            break;
    800075b8:	fc1ff06f          	j	80007578 <_Z8userMainv+0x8c>
            producerConsumer_C_API();
    800075bc:	ffffe097          	auipc	ra,0xffffe
    800075c0:	a2c080e7          	jalr	-1492(ra) # 80004fe8 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    800075c4:	00004517          	auipc	a0,0x4
    800075c8:	18c50513          	addi	a0,a0,396 # 8000b750 <CONSOLE_STATUS+0x740>
    800075cc:	00000097          	auipc	ra,0x0
    800075d0:	0a0080e7          	jalr	160(ra) # 8000766c <_Z11printStringPKc>
            break;
    800075d4:	fa5ff06f          	j	80007578 <_Z8userMainv+0x8c>
            producerConsumer_CPP_Sync_API();
    800075d8:	00000097          	auipc	ra,0x0
    800075dc:	5ac080e7          	jalr	1452(ra) # 80007b84 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    800075e0:	00004517          	auipc	a0,0x4
    800075e4:	1c050513          	addi	a0,a0,448 # 8000b7a0 <CONSOLE_STATUS+0x790>
    800075e8:	00000097          	auipc	ra,0x0
    800075ec:	084080e7          	jalr	132(ra) # 8000766c <_Z11printStringPKc>
            break;
    800075f0:	f89ff06f          	j	80007578 <_Z8userMainv+0x8c>
            testSleeping();
    800075f4:	fffff097          	auipc	ra,0xfffff
    800075f8:	07c080e7          	jalr	124(ra) # 80006670 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., time_sleep test C API)\n");
    800075fc:	00004517          	auipc	a0,0x4
    80007600:	1fc50513          	addi	a0,a0,508 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    80007604:	00000097          	auipc	ra,0x0
    80007608:	068080e7          	jalr	104(ra) # 8000766c <_Z11printStringPKc>
            break;
    8000760c:	f6dff06f          	j	80007578 <_Z8userMainv+0x8c>
            testConsumerProducer();
    80007610:	ffffe097          	auipc	ra,0xffffe
    80007614:	ca8080e7          	jalr	-856(ra) # 800052b8 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80007618:	00004517          	auipc	a0,0x4
    8000761c:	21050513          	addi	a0,a0,528 # 8000b828 <CONSOLE_STATUS+0x818>
    80007620:	00000097          	auipc	ra,0x0
    80007624:	04c080e7          	jalr	76(ra) # 8000766c <_Z11printStringPKc>
            break;
    80007628:	f51ff06f          	j	80007578 <_Z8userMainv+0x8c>
            System_Mode_test();
    8000762c:	fffff097          	auipc	ra,0xfffff
    80007630:	8f8080e7          	jalr	-1800(ra) # 80005f24 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80007634:	00004517          	auipc	a0,0x4
    80007638:	23450513          	addi	a0,a0,564 # 8000b868 <CONSOLE_STATUS+0x858>
    8000763c:	00000097          	auipc	ra,0x0
    80007640:	030080e7          	jalr	48(ra) # 8000766c <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80007644:	00004517          	auipc	a0,0x4
    80007648:	24450513          	addi	a0,a0,580 # 8000b888 <CONSOLE_STATUS+0x878>
    8000764c:	00000097          	auipc	ra,0x0
    80007650:	020080e7          	jalr	32(ra) # 8000766c <_Z11printStringPKc>
            break;
    80007654:	f25ff06f          	j	80007578 <_Z8userMainv+0x8c>
            printString("Niste uneli odgovarajuci broj za test\n");
    80007658:	00004517          	auipc	a0,0x4
    8000765c:	28850513          	addi	a0,a0,648 # 8000b8e0 <CONSOLE_STATUS+0x8d0>
    80007660:	00000097          	auipc	ra,0x0
    80007664:	00c080e7          	jalr	12(ra) # 8000766c <_Z11printStringPKc>
    80007668:	f11ff06f          	j	80007578 <_Z8userMainv+0x8c>

000000008000766c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000766c:	fe010113          	addi	sp,sp,-32
    80007670:	00113c23          	sd	ra,24(sp)
    80007674:	00813823          	sd	s0,16(sp)
    80007678:	00913423          	sd	s1,8(sp)
    8000767c:	02010413          	addi	s0,sp,32
    80007680:	00050493          	mv	s1,a0
    LOCK();
    80007684:	00100613          	li	a2,1
    80007688:	00000593          	li	a1,0
    8000768c:	00007517          	auipc	a0,0x7
    80007690:	95450513          	addi	a0,a0,-1708 # 8000dfe0 <lockPrint>
    80007694:	ffffa097          	auipc	ra,0xffffa
    80007698:	a6c080e7          	jalr	-1428(ra) # 80001100 <copy_and_swap>
    8000769c:	00050863          	beqz	a0,800076ac <_Z11printStringPKc+0x40>
    800076a0:	ffffa097          	auipc	ra,0xffffa
    800076a4:	288080e7          	jalr	648(ra) # 80001928 <_Z15thread_dispatchv>
    800076a8:	fddff06f          	j	80007684 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800076ac:	0004c503          	lbu	a0,0(s1)
    800076b0:	00050a63          	beqz	a0,800076c4 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800076b4:	ffffa097          	auipc	ra,0xffffa
    800076b8:	3c8080e7          	jalr	968(ra) # 80001a7c <_Z4putcc>
        string++;
    800076bc:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800076c0:	fedff06f          	j	800076ac <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800076c4:	00000613          	li	a2,0
    800076c8:	00100593          	li	a1,1
    800076cc:	00007517          	auipc	a0,0x7
    800076d0:	91450513          	addi	a0,a0,-1772 # 8000dfe0 <lockPrint>
    800076d4:	ffffa097          	auipc	ra,0xffffa
    800076d8:	a2c080e7          	jalr	-1492(ra) # 80001100 <copy_and_swap>
    800076dc:	fe0514e3          	bnez	a0,800076c4 <_Z11printStringPKc+0x58>
}
    800076e0:	01813083          	ld	ra,24(sp)
    800076e4:	01013403          	ld	s0,16(sp)
    800076e8:	00813483          	ld	s1,8(sp)
    800076ec:	02010113          	addi	sp,sp,32
    800076f0:	00008067          	ret

00000000800076f4 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800076f4:	fd010113          	addi	sp,sp,-48
    800076f8:	02113423          	sd	ra,40(sp)
    800076fc:	02813023          	sd	s0,32(sp)
    80007700:	00913c23          	sd	s1,24(sp)
    80007704:	01213823          	sd	s2,16(sp)
    80007708:	01313423          	sd	s3,8(sp)
    8000770c:	01413023          	sd	s4,0(sp)
    80007710:	03010413          	addi	s0,sp,48
    80007714:	00050993          	mv	s3,a0
    80007718:	00058a13          	mv	s4,a1
    LOCK();
    8000771c:	00100613          	li	a2,1
    80007720:	00000593          	li	a1,0
    80007724:	00007517          	auipc	a0,0x7
    80007728:	8bc50513          	addi	a0,a0,-1860 # 8000dfe0 <lockPrint>
    8000772c:	ffffa097          	auipc	ra,0xffffa
    80007730:	9d4080e7          	jalr	-1580(ra) # 80001100 <copy_and_swap>
    80007734:	00050863          	beqz	a0,80007744 <_Z9getStringPci+0x50>
    80007738:	ffffa097          	auipc	ra,0xffffa
    8000773c:	1f0080e7          	jalr	496(ra) # 80001928 <_Z15thread_dispatchv>
    80007740:	fddff06f          	j	8000771c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80007744:	00000913          	li	s2,0
    80007748:	00090493          	mv	s1,s2
    8000774c:	0019091b          	addiw	s2,s2,1
    80007750:	03495a63          	bge	s2,s4,80007784 <_Z9getStringPci+0x90>
        cc = getc();
    80007754:	ffffa097          	auipc	ra,0xffffa
    80007758:	300080e7          	jalr	768(ra) # 80001a54 <_Z4getcv>
        if(cc < 1)
    8000775c:	02050463          	beqz	a0,80007784 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80007760:	009984b3          	add	s1,s3,s1
    80007764:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80007768:	00a00793          	li	a5,10
    8000776c:	00f50a63          	beq	a0,a5,80007780 <_Z9getStringPci+0x8c>
    80007770:	00d00793          	li	a5,13
    80007774:	fcf51ae3          	bne	a0,a5,80007748 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80007778:	00090493          	mv	s1,s2
    8000777c:	0080006f          	j	80007784 <_Z9getStringPci+0x90>
    80007780:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80007784:	009984b3          	add	s1,s3,s1
    80007788:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000778c:	00000613          	li	a2,0
    80007790:	00100593          	li	a1,1
    80007794:	00007517          	auipc	a0,0x7
    80007798:	84c50513          	addi	a0,a0,-1972 # 8000dfe0 <lockPrint>
    8000779c:	ffffa097          	auipc	ra,0xffffa
    800077a0:	964080e7          	jalr	-1692(ra) # 80001100 <copy_and_swap>
    800077a4:	fe0514e3          	bnez	a0,8000778c <_Z9getStringPci+0x98>
    return buf;
}
    800077a8:	00098513          	mv	a0,s3
    800077ac:	02813083          	ld	ra,40(sp)
    800077b0:	02013403          	ld	s0,32(sp)
    800077b4:	01813483          	ld	s1,24(sp)
    800077b8:	01013903          	ld	s2,16(sp)
    800077bc:	00813983          	ld	s3,8(sp)
    800077c0:	00013a03          	ld	s4,0(sp)
    800077c4:	03010113          	addi	sp,sp,48
    800077c8:	00008067          	ret

00000000800077cc <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800077cc:	ff010113          	addi	sp,sp,-16
    800077d0:	00813423          	sd	s0,8(sp)
    800077d4:	01010413          	addi	s0,sp,16
    800077d8:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800077dc:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800077e0:	0006c603          	lbu	a2,0(a3)
    800077e4:	fd06071b          	addiw	a4,a2,-48
    800077e8:	0ff77713          	andi	a4,a4,255
    800077ec:	00900793          	li	a5,9
    800077f0:	02e7e063          	bltu	a5,a4,80007810 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800077f4:	0025179b          	slliw	a5,a0,0x2
    800077f8:	00a787bb          	addw	a5,a5,a0
    800077fc:	0017979b          	slliw	a5,a5,0x1
    80007800:	00168693          	addi	a3,a3,1
    80007804:	00c787bb          	addw	a5,a5,a2
    80007808:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    8000780c:	fd5ff06f          	j	800077e0 <_Z11stringToIntPKc+0x14>
    return n;
}
    80007810:	00813403          	ld	s0,8(sp)
    80007814:	01010113          	addi	sp,sp,16
    80007818:	00008067          	ret

000000008000781c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    8000781c:	fc010113          	addi	sp,sp,-64
    80007820:	02113c23          	sd	ra,56(sp)
    80007824:	02813823          	sd	s0,48(sp)
    80007828:	02913423          	sd	s1,40(sp)
    8000782c:	03213023          	sd	s2,32(sp)
    80007830:	01313c23          	sd	s3,24(sp)
    80007834:	04010413          	addi	s0,sp,64
    80007838:	00050493          	mv	s1,a0
    8000783c:	00058913          	mv	s2,a1
    80007840:	00060993          	mv	s3,a2
    LOCK();
    80007844:	00100613          	li	a2,1
    80007848:	00000593          	li	a1,0
    8000784c:	00006517          	auipc	a0,0x6
    80007850:	79450513          	addi	a0,a0,1940 # 8000dfe0 <lockPrint>
    80007854:	ffffa097          	auipc	ra,0xffffa
    80007858:	8ac080e7          	jalr	-1876(ra) # 80001100 <copy_and_swap>
    8000785c:	00050863          	beqz	a0,8000786c <_Z8printIntiii+0x50>
    80007860:	ffffa097          	auipc	ra,0xffffa
    80007864:	0c8080e7          	jalr	200(ra) # 80001928 <_Z15thread_dispatchv>
    80007868:	fddff06f          	j	80007844 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000786c:	00098463          	beqz	s3,80007874 <_Z8printIntiii+0x58>
    80007870:	0804c463          	bltz	s1,800078f8 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80007874:	0004851b          	sext.w	a0,s1
    neg = 0;
    80007878:	00000593          	li	a1,0
    }

    i = 0;
    8000787c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80007880:	0009079b          	sext.w	a5,s2
    80007884:	0325773b          	remuw	a4,a0,s2
    80007888:	00048613          	mv	a2,s1
    8000788c:	0014849b          	addiw	s1,s1,1
    80007890:	02071693          	slli	a3,a4,0x20
    80007894:	0206d693          	srli	a3,a3,0x20
    80007898:	00006717          	auipc	a4,0x6
    8000789c:	5b070713          	addi	a4,a4,1456 # 8000de48 <digits>
    800078a0:	00d70733          	add	a4,a4,a3
    800078a4:	00074683          	lbu	a3,0(a4)
    800078a8:	fd040713          	addi	a4,s0,-48
    800078ac:	00c70733          	add	a4,a4,a2
    800078b0:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800078b4:	0005071b          	sext.w	a4,a0
    800078b8:	0325553b          	divuw	a0,a0,s2
    800078bc:	fcf772e3          	bgeu	a4,a5,80007880 <_Z8printIntiii+0x64>
    if(neg)
    800078c0:	00058c63          	beqz	a1,800078d8 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800078c4:	fd040793          	addi	a5,s0,-48
    800078c8:	009784b3          	add	s1,a5,s1
    800078cc:	02d00793          	li	a5,45
    800078d0:	fef48823          	sb	a5,-16(s1)
    800078d4:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800078d8:	fff4849b          	addiw	s1,s1,-1
    800078dc:	0204c463          	bltz	s1,80007904 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800078e0:	fd040793          	addi	a5,s0,-48
    800078e4:	009787b3          	add	a5,a5,s1
    800078e8:	ff07c503          	lbu	a0,-16(a5)
    800078ec:	ffffa097          	auipc	ra,0xffffa
    800078f0:	190080e7          	jalr	400(ra) # 80001a7c <_Z4putcc>
    800078f4:	fe5ff06f          	j	800078d8 <_Z8printIntiii+0xbc>
        x = -xx;
    800078f8:	4090053b          	negw	a0,s1
        neg = 1;
    800078fc:	00100593          	li	a1,1
        x = -xx;
    80007900:	f7dff06f          	j	8000787c <_Z8printIntiii+0x60>

    UNLOCK();
    80007904:	00000613          	li	a2,0
    80007908:	00100593          	li	a1,1
    8000790c:	00006517          	auipc	a0,0x6
    80007910:	6d450513          	addi	a0,a0,1748 # 8000dfe0 <lockPrint>
    80007914:	ffff9097          	auipc	ra,0xffff9
    80007918:	7ec080e7          	jalr	2028(ra) # 80001100 <copy_and_swap>
    8000791c:	fe0514e3          	bnez	a0,80007904 <_Z8printIntiii+0xe8>
    80007920:	03813083          	ld	ra,56(sp)
    80007924:	03013403          	ld	s0,48(sp)
    80007928:	02813483          	ld	s1,40(sp)
    8000792c:	02013903          	ld	s2,32(sp)
    80007930:	01813983          	ld	s3,24(sp)
    80007934:	04010113          	addi	sp,sp,64
    80007938:	00008067          	ret

000000008000793c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    8000793c:	fd010113          	addi	sp,sp,-48
    80007940:	02113423          	sd	ra,40(sp)
    80007944:	02813023          	sd	s0,32(sp)
    80007948:	00913c23          	sd	s1,24(sp)
    8000794c:	01213823          	sd	s2,16(sp)
    80007950:	01313423          	sd	s3,8(sp)
    80007954:	03010413          	addi	s0,sp,48
    80007958:	00050993          	mv	s3,a0
    8000795c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80007960:	00000913          	li	s2,0
    80007964:	00c0006f          	j	80007970 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007968:	ffffa097          	auipc	ra,0xffffa
    8000796c:	9b0080e7          	jalr	-1616(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80007970:	ffffa097          	auipc	ra,0xffffa
    80007974:	0e4080e7          	jalr	228(ra) # 80001a54 <_Z4getcv>
    80007978:	0005059b          	sext.w	a1,a0
    8000797c:	01b00793          	li	a5,27
    80007980:	02f58a63          	beq	a1,a5,800079b4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80007984:	0084b503          	ld	a0,8(s1)
    80007988:	fffff097          	auipc	ra,0xfffff
    8000798c:	f24080e7          	jalr	-220(ra) # 800068ac <_ZN9BufferCPP3putEi>
        i++;
    80007990:	0019071b          	addiw	a4,s2,1
    80007994:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007998:	0004a683          	lw	a3,0(s1)
    8000799c:	0026979b          	slliw	a5,a3,0x2
    800079a0:	00d787bb          	addw	a5,a5,a3
    800079a4:	0017979b          	slliw	a5,a5,0x1
    800079a8:	02f767bb          	remw	a5,a4,a5
    800079ac:	fc0792e3          	bnez	a5,80007970 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800079b0:	fb9ff06f          	j	80007968 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800079b4:	00100793          	li	a5,1
    800079b8:	00006717          	auipc	a4,0x6
    800079bc:	62f72823          	sw	a5,1584(a4) # 8000dfe8 <_ZL9threadEnd>
    td->buffer->put('!');
    800079c0:	0209b783          	ld	a5,32(s3)
    800079c4:	02100593          	li	a1,33
    800079c8:	0087b503          	ld	a0,8(a5)
    800079cc:	fffff097          	auipc	ra,0xfffff
    800079d0:	ee0080e7          	jalr	-288(ra) # 800068ac <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800079d4:	0104b503          	ld	a0,16(s1)
    800079d8:	ffffa097          	auipc	ra,0xffffa
    800079dc:	a60080e7          	jalr	-1440(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    800079e0:	02813083          	ld	ra,40(sp)
    800079e4:	02013403          	ld	s0,32(sp)
    800079e8:	01813483          	ld	s1,24(sp)
    800079ec:	01013903          	ld	s2,16(sp)
    800079f0:	00813983          	ld	s3,8(sp)
    800079f4:	03010113          	addi	sp,sp,48
    800079f8:	00008067          	ret

00000000800079fc <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800079fc:	fe010113          	addi	sp,sp,-32
    80007a00:	00113c23          	sd	ra,24(sp)
    80007a04:	00813823          	sd	s0,16(sp)
    80007a08:	00913423          	sd	s1,8(sp)
    80007a0c:	01213023          	sd	s2,0(sp)
    80007a10:	02010413          	addi	s0,sp,32
    80007a14:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007a18:	00000913          	li	s2,0
    80007a1c:	00c0006f          	j	80007a28 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007a20:	ffffa097          	auipc	ra,0xffffa
    80007a24:	8f8080e7          	jalr	-1800(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80007a28:	00006797          	auipc	a5,0x6
    80007a2c:	5c07a783          	lw	a5,1472(a5) # 8000dfe8 <_ZL9threadEnd>
    80007a30:	02079e63          	bnez	a5,80007a6c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80007a34:	0004a583          	lw	a1,0(s1)
    80007a38:	0305859b          	addiw	a1,a1,48
    80007a3c:	0084b503          	ld	a0,8(s1)
    80007a40:	fffff097          	auipc	ra,0xfffff
    80007a44:	e6c080e7          	jalr	-404(ra) # 800068ac <_ZN9BufferCPP3putEi>
        i++;
    80007a48:	0019071b          	addiw	a4,s2,1
    80007a4c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007a50:	0004a683          	lw	a3,0(s1)
    80007a54:	0026979b          	slliw	a5,a3,0x2
    80007a58:	00d787bb          	addw	a5,a5,a3
    80007a5c:	0017979b          	slliw	a5,a5,0x1
    80007a60:	02f767bb          	remw	a5,a4,a5
    80007a64:	fc0792e3          	bnez	a5,80007a28 <_ZN12ProducerSync8producerEPv+0x2c>
    80007a68:	fb9ff06f          	j	80007a20 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80007a6c:	0104b503          	ld	a0,16(s1)
    80007a70:	ffffa097          	auipc	ra,0xffffa
    80007a74:	9c8080e7          	jalr	-1592(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007a78:	01813083          	ld	ra,24(sp)
    80007a7c:	01013403          	ld	s0,16(sp)
    80007a80:	00813483          	ld	s1,8(sp)
    80007a84:	00013903          	ld	s2,0(sp)
    80007a88:	02010113          	addi	sp,sp,32
    80007a8c:	00008067          	ret

0000000080007a90 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80007a90:	fd010113          	addi	sp,sp,-48
    80007a94:	02113423          	sd	ra,40(sp)
    80007a98:	02813023          	sd	s0,32(sp)
    80007a9c:	00913c23          	sd	s1,24(sp)
    80007aa0:	01213823          	sd	s2,16(sp)
    80007aa4:	01313423          	sd	s3,8(sp)
    80007aa8:	01413023          	sd	s4,0(sp)
    80007aac:	03010413          	addi	s0,sp,48
    80007ab0:	00050993          	mv	s3,a0
    80007ab4:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007ab8:	00000a13          	li	s4,0
    80007abc:	01c0006f          	j	80007ad8 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80007ac0:	ffffa097          	auipc	ra,0xffffa
    80007ac4:	858080e7          	jalr	-1960(ra) # 80001318 <_ZN6Thread8dispatchEv>
    80007ac8:	0500006f          	j	80007b18 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80007acc:	00a00513          	li	a0,10
    80007ad0:	ffffa097          	auipc	ra,0xffffa
    80007ad4:	fac080e7          	jalr	-84(ra) # 80001a7c <_Z4putcc>
    while (!threadEnd) {
    80007ad8:	00006797          	auipc	a5,0x6
    80007adc:	5107a783          	lw	a5,1296(a5) # 8000dfe8 <_ZL9threadEnd>
    80007ae0:	06079263          	bnez	a5,80007b44 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80007ae4:	00893503          	ld	a0,8(s2)
    80007ae8:	fffff097          	auipc	ra,0xfffff
    80007aec:	e54080e7          	jalr	-428(ra) # 8000693c <_ZN9BufferCPP3getEv>
        i++;
    80007af0:	001a049b          	addiw	s1,s4,1
    80007af4:	00048a1b          	sext.w	s4,s1
        putc(key);
    80007af8:	0ff57513          	andi	a0,a0,255
    80007afc:	ffffa097          	auipc	ra,0xffffa
    80007b00:	f80080e7          	jalr	-128(ra) # 80001a7c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80007b04:	00092703          	lw	a4,0(s2)
    80007b08:	0027179b          	slliw	a5,a4,0x2
    80007b0c:	00e787bb          	addw	a5,a5,a4
    80007b10:	02f4e7bb          	remw	a5,s1,a5
    80007b14:	fa0786e3          	beqz	a5,80007ac0 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80007b18:	05000793          	li	a5,80
    80007b1c:	02f4e4bb          	remw	s1,s1,a5
    80007b20:	fa049ce3          	bnez	s1,80007ad8 <_ZN12ConsumerSync8consumerEPv+0x48>
    80007b24:	fa9ff06f          	j	80007acc <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80007b28:	0209b783          	ld	a5,32(s3)
    80007b2c:	0087b503          	ld	a0,8(a5)
    80007b30:	fffff097          	auipc	ra,0xfffff
    80007b34:	e0c080e7          	jalr	-500(ra) # 8000693c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80007b38:	0ff57513          	andi	a0,a0,255
    80007b3c:	ffffb097          	auipc	ra,0xffffb
    80007b40:	a48080e7          	jalr	-1464(ra) # 80002584 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80007b44:	0209b783          	ld	a5,32(s3)
    80007b48:	0087b503          	ld	a0,8(a5)
    80007b4c:	fffff097          	auipc	ra,0xfffff
    80007b50:	e7c080e7          	jalr	-388(ra) # 800069c8 <_ZN9BufferCPP6getCntEv>
    80007b54:	fca04ae3          	bgtz	a0,80007b28 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80007b58:	01093503          	ld	a0,16(s2)
    80007b5c:	ffffa097          	auipc	ra,0xffffa
    80007b60:	8dc080e7          	jalr	-1828(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007b64:	02813083          	ld	ra,40(sp)
    80007b68:	02013403          	ld	s0,32(sp)
    80007b6c:	01813483          	ld	s1,24(sp)
    80007b70:	01013903          	ld	s2,16(sp)
    80007b74:	00813983          	ld	s3,8(sp)
    80007b78:	00013a03          	ld	s4,0(sp)
    80007b7c:	03010113          	addi	sp,sp,48
    80007b80:	00008067          	ret

0000000080007b84 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80007b84:	f8010113          	addi	sp,sp,-128
    80007b88:	06113c23          	sd	ra,120(sp)
    80007b8c:	06813823          	sd	s0,112(sp)
    80007b90:	06913423          	sd	s1,104(sp)
    80007b94:	07213023          	sd	s2,96(sp)
    80007b98:	05313c23          	sd	s3,88(sp)
    80007b9c:	05413823          	sd	s4,80(sp)
    80007ba0:	05513423          	sd	s5,72(sp)
    80007ba4:	05613023          	sd	s6,64(sp)
    80007ba8:	03713c23          	sd	s7,56(sp)
    80007bac:	03813823          	sd	s8,48(sp)
    80007bb0:	03913423          	sd	s9,40(sp)
    80007bb4:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80007bb8:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80007bbc:	00004517          	auipc	a0,0x4
    80007bc0:	88450513          	addi	a0,a0,-1916 # 8000b440 <CONSOLE_STATUS+0x430>
    80007bc4:	00000097          	auipc	ra,0x0
    80007bc8:	aa8080e7          	jalr	-1368(ra) # 8000766c <_Z11printStringPKc>
    getString(input, 30);
    80007bcc:	01e00593          	li	a1,30
    80007bd0:	f8040493          	addi	s1,s0,-128
    80007bd4:	00048513          	mv	a0,s1
    80007bd8:	00000097          	auipc	ra,0x0
    80007bdc:	b1c080e7          	jalr	-1252(ra) # 800076f4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80007be0:	00048513          	mv	a0,s1
    80007be4:	00000097          	auipc	ra,0x0
    80007be8:	be8080e7          	jalr	-1048(ra) # 800077cc <_Z11stringToIntPKc>
    80007bec:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80007bf0:	00004517          	auipc	a0,0x4
    80007bf4:	87050513          	addi	a0,a0,-1936 # 8000b460 <CONSOLE_STATUS+0x450>
    80007bf8:	00000097          	auipc	ra,0x0
    80007bfc:	a74080e7          	jalr	-1420(ra) # 8000766c <_Z11printStringPKc>
    getString(input, 30);
    80007c00:	01e00593          	li	a1,30
    80007c04:	00048513          	mv	a0,s1
    80007c08:	00000097          	auipc	ra,0x0
    80007c0c:	aec080e7          	jalr	-1300(ra) # 800076f4 <_Z9getStringPci>
    n = stringToInt(input);
    80007c10:	00048513          	mv	a0,s1
    80007c14:	00000097          	auipc	ra,0x0
    80007c18:	bb8080e7          	jalr	-1096(ra) # 800077cc <_Z11stringToIntPKc>
    80007c1c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80007c20:	00004517          	auipc	a0,0x4
    80007c24:	86050513          	addi	a0,a0,-1952 # 8000b480 <CONSOLE_STATUS+0x470>
    80007c28:	00000097          	auipc	ra,0x0
    80007c2c:	a44080e7          	jalr	-1468(ra) # 8000766c <_Z11printStringPKc>
    80007c30:	00000613          	li	a2,0
    80007c34:	00a00593          	li	a1,10
    80007c38:	00090513          	mv	a0,s2
    80007c3c:	00000097          	auipc	ra,0x0
    80007c40:	be0080e7          	jalr	-1056(ra) # 8000781c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80007c44:	00004517          	auipc	a0,0x4
    80007c48:	85450513          	addi	a0,a0,-1964 # 8000b498 <CONSOLE_STATUS+0x488>
    80007c4c:	00000097          	auipc	ra,0x0
    80007c50:	a20080e7          	jalr	-1504(ra) # 8000766c <_Z11printStringPKc>
    80007c54:	00000613          	li	a2,0
    80007c58:	00a00593          	li	a1,10
    80007c5c:	00048513          	mv	a0,s1
    80007c60:	00000097          	auipc	ra,0x0
    80007c64:	bbc080e7          	jalr	-1092(ra) # 8000781c <_Z8printIntiii>
    printString(".\n");
    80007c68:	00004517          	auipc	a0,0x4
    80007c6c:	84850513          	addi	a0,a0,-1976 # 8000b4b0 <CONSOLE_STATUS+0x4a0>
    80007c70:	00000097          	auipc	ra,0x0
    80007c74:	9fc080e7          	jalr	-1540(ra) # 8000766c <_Z11printStringPKc>
    if(threadNum > n) {
    80007c78:	0324c463          	blt	s1,s2,80007ca0 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80007c7c:	03205c63          	blez	s2,80007cb4 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80007c80:	03800513          	li	a0,56
    80007c84:	ffff9097          	auipc	ra,0xffff9
    80007c88:	538080e7          	jalr	1336(ra) # 800011bc <_Znwm>
    80007c8c:	00050a93          	mv	s5,a0
    80007c90:	00048593          	mv	a1,s1
    80007c94:	fffff097          	auipc	ra,0xfffff
    80007c98:	ac4080e7          	jalr	-1340(ra) # 80006758 <_ZN9BufferCPPC1Ei>
    80007c9c:	0300006f          	j	80007ccc <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80007ca0:	00004517          	auipc	a0,0x4
    80007ca4:	81850513          	addi	a0,a0,-2024 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    80007ca8:	00000097          	auipc	ra,0x0
    80007cac:	9c4080e7          	jalr	-1596(ra) # 8000766c <_Z11printStringPKc>
        return;
    80007cb0:	0140006f          	j	80007cc4 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80007cb4:	00004517          	auipc	a0,0x4
    80007cb8:	84450513          	addi	a0,a0,-1980 # 8000b4f8 <CONSOLE_STATUS+0x4e8>
    80007cbc:	00000097          	auipc	ra,0x0
    80007cc0:	9b0080e7          	jalr	-1616(ra) # 8000766c <_Z11printStringPKc>
        return;
    80007cc4:	000b8113          	mv	sp,s7
    80007cc8:	2380006f          	j	80007f00 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80007ccc:	01000513          	li	a0,16
    80007cd0:	ffff9097          	auipc	ra,0xffff9
    80007cd4:	4ec080e7          	jalr	1260(ra) # 800011bc <_Znwm>
    80007cd8:	00050493          	mv	s1,a0
    80007cdc:	00000593          	li	a1,0
    80007ce0:	ffff9097          	auipc	ra,0xffff9
    80007ce4:	6f4080e7          	jalr	1780(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80007ce8:	00006797          	auipc	a5,0x6
    80007cec:	3097b423          	sd	s1,776(a5) # 8000dff0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80007cf0:	00391793          	slli	a5,s2,0x3
    80007cf4:	00f78793          	addi	a5,a5,15
    80007cf8:	ff07f793          	andi	a5,a5,-16
    80007cfc:	40f10133          	sub	sp,sp,a5
    80007d00:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80007d04:	0019071b          	addiw	a4,s2,1
    80007d08:	00171793          	slli	a5,a4,0x1
    80007d0c:	00e787b3          	add	a5,a5,a4
    80007d10:	00379793          	slli	a5,a5,0x3
    80007d14:	00f78793          	addi	a5,a5,15
    80007d18:	ff07f793          	andi	a5,a5,-16
    80007d1c:	40f10133          	sub	sp,sp,a5
    80007d20:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80007d24:	00191c13          	slli	s8,s2,0x1
    80007d28:	012c07b3          	add	a5,s8,s2
    80007d2c:	00379793          	slli	a5,a5,0x3
    80007d30:	00fa07b3          	add	a5,s4,a5
    80007d34:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80007d38:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80007d3c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80007d40:	02800513          	li	a0,40
    80007d44:	ffff9097          	auipc	ra,0xffff9
    80007d48:	478080e7          	jalr	1144(ra) # 800011bc <_Znwm>
    80007d4c:	00050b13          	mv	s6,a0
    80007d50:	012c0c33          	add	s8,s8,s2
    80007d54:	003c1c13          	slli	s8,s8,0x3
    80007d58:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80007d5c:	ffff9097          	auipc	ra,0xffff9
    80007d60:	644080e7          	jalr	1604(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007d64:	00006797          	auipc	a5,0x6
    80007d68:	15c78793          	addi	a5,a5,348 # 8000dec0 <_ZTV12ConsumerSync+0x10>
    80007d6c:	00fb3023          	sd	a5,0(s6)
    80007d70:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80007d74:	000b0513          	mv	a0,s6
    80007d78:	ffff9097          	auipc	ra,0xffff9
    80007d7c:	540080e7          	jalr	1344(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80007d80:	00000493          	li	s1,0
    80007d84:	0380006f          	j	80007dbc <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80007d88:	00006797          	auipc	a5,0x6
    80007d8c:	11078793          	addi	a5,a5,272 # 8000de98 <_ZTV12ProducerSync+0x10>
    80007d90:	00fcb023          	sd	a5,0(s9)
    80007d94:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80007d98:	00349793          	slli	a5,s1,0x3
    80007d9c:	00f987b3          	add	a5,s3,a5
    80007da0:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80007da4:	00349793          	slli	a5,s1,0x3
    80007da8:	00f987b3          	add	a5,s3,a5
    80007dac:	0007b503          	ld	a0,0(a5)
    80007db0:	ffff9097          	auipc	ra,0xffff9
    80007db4:	508080e7          	jalr	1288(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80007db8:	0014849b          	addiw	s1,s1,1
    80007dbc:	0b24d063          	bge	s1,s2,80007e5c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80007dc0:	00149793          	slli	a5,s1,0x1
    80007dc4:	009787b3          	add	a5,a5,s1
    80007dc8:	00379793          	slli	a5,a5,0x3
    80007dcc:	00fa07b3          	add	a5,s4,a5
    80007dd0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80007dd4:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80007dd8:	00006717          	auipc	a4,0x6
    80007ddc:	21873703          	ld	a4,536(a4) # 8000dff0 <_ZL10waitForAll>
    80007de0:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80007de4:	02905863          	blez	s1,80007e14 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80007de8:	02800513          	li	a0,40
    80007dec:	ffff9097          	auipc	ra,0xffff9
    80007df0:	3d0080e7          	jalr	976(ra) # 800011bc <_Znwm>
    80007df4:	00050c93          	mv	s9,a0
    80007df8:	00149c13          	slli	s8,s1,0x1
    80007dfc:	009c0c33          	add	s8,s8,s1
    80007e00:	003c1c13          	slli	s8,s8,0x3
    80007e04:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80007e08:	ffff9097          	auipc	ra,0xffff9
    80007e0c:	598080e7          	jalr	1432(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007e10:	f79ff06f          	j	80007d88 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80007e14:	02800513          	li	a0,40
    80007e18:	ffff9097          	auipc	ra,0xffff9
    80007e1c:	3a4080e7          	jalr	932(ra) # 800011bc <_Znwm>
    80007e20:	00050c93          	mv	s9,a0
    80007e24:	00149c13          	slli	s8,s1,0x1
    80007e28:	009c0c33          	add	s8,s8,s1
    80007e2c:	003c1c13          	slli	s8,s8,0x3
    80007e30:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80007e34:	ffff9097          	auipc	ra,0xffff9
    80007e38:	56c080e7          	jalr	1388(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007e3c:	00006797          	auipc	a5,0x6
    80007e40:	03478793          	addi	a5,a5,52 # 8000de70 <_ZTV16ProducerKeyboard+0x10>
    80007e44:	00fcb023          	sd	a5,0(s9)
    80007e48:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80007e4c:	00349793          	slli	a5,s1,0x3
    80007e50:	00f987b3          	add	a5,s3,a5
    80007e54:	0197b023          	sd	s9,0(a5)
    80007e58:	f4dff06f          	j	80007da4 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80007e5c:	ffff9097          	auipc	ra,0xffff9
    80007e60:	4bc080e7          	jalr	1212(ra) # 80001318 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80007e64:	00000493          	li	s1,0
    80007e68:	00994e63          	blt	s2,s1,80007e84 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80007e6c:	00006517          	auipc	a0,0x6
    80007e70:	18453503          	ld	a0,388(a0) # 8000dff0 <_ZL10waitForAll>
    80007e74:	ffff9097          	auipc	ra,0xffff9
    80007e78:	598080e7          	jalr	1432(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80007e7c:	0014849b          	addiw	s1,s1,1
    80007e80:	fe9ff06f          	j	80007e68 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80007e84:	00000493          	li	s1,0
    80007e88:	0080006f          	j	80007e90 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80007e8c:	0014849b          	addiw	s1,s1,1
    80007e90:	0324d263          	bge	s1,s2,80007eb4 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80007e94:	00349793          	slli	a5,s1,0x3
    80007e98:	00f987b3          	add	a5,s3,a5
    80007e9c:	0007b503          	ld	a0,0(a5)
    80007ea0:	fe0506e3          	beqz	a0,80007e8c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80007ea4:	00053783          	ld	a5,0(a0)
    80007ea8:	0087b783          	ld	a5,8(a5)
    80007eac:	000780e7          	jalr	a5
    80007eb0:	fddff06f          	j	80007e8c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80007eb4:	000b0a63          	beqz	s6,80007ec8 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80007eb8:	000b3783          	ld	a5,0(s6)
    80007ebc:	0087b783          	ld	a5,8(a5)
    80007ec0:	000b0513          	mv	a0,s6
    80007ec4:	000780e7          	jalr	a5
    delete waitForAll;
    80007ec8:	00006517          	auipc	a0,0x6
    80007ecc:	12853503          	ld	a0,296(a0) # 8000dff0 <_ZL10waitForAll>
    80007ed0:	00050863          	beqz	a0,80007ee0 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80007ed4:	00053783          	ld	a5,0(a0)
    80007ed8:	0087b783          	ld	a5,8(a5)
    80007edc:	000780e7          	jalr	a5
    delete buffer;
    80007ee0:	000a8e63          	beqz	s5,80007efc <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80007ee4:	000a8513          	mv	a0,s5
    80007ee8:	fffff097          	auipc	ra,0xfffff
    80007eec:	b68080e7          	jalr	-1176(ra) # 80006a50 <_ZN9BufferCPPD1Ev>
    80007ef0:	000a8513          	mv	a0,s5
    80007ef4:	ffff9097          	auipc	ra,0xffff9
    80007ef8:	2f0080e7          	jalr	752(ra) # 800011e4 <_ZdlPv>
    80007efc:	000b8113          	mv	sp,s7

}
    80007f00:	f8040113          	addi	sp,s0,-128
    80007f04:	07813083          	ld	ra,120(sp)
    80007f08:	07013403          	ld	s0,112(sp)
    80007f0c:	06813483          	ld	s1,104(sp)
    80007f10:	06013903          	ld	s2,96(sp)
    80007f14:	05813983          	ld	s3,88(sp)
    80007f18:	05013a03          	ld	s4,80(sp)
    80007f1c:	04813a83          	ld	s5,72(sp)
    80007f20:	04013b03          	ld	s6,64(sp)
    80007f24:	03813b83          	ld	s7,56(sp)
    80007f28:	03013c03          	ld	s8,48(sp)
    80007f2c:	02813c83          	ld	s9,40(sp)
    80007f30:	08010113          	addi	sp,sp,128
    80007f34:	00008067          	ret
    80007f38:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80007f3c:	000a8513          	mv	a0,s5
    80007f40:	ffff9097          	auipc	ra,0xffff9
    80007f44:	2a4080e7          	jalr	676(ra) # 800011e4 <_ZdlPv>
    80007f48:	00048513          	mv	a0,s1
    80007f4c:	00007097          	auipc	ra,0x7
    80007f50:	17c080e7          	jalr	380(ra) # 8000f0c8 <_Unwind_Resume>
    80007f54:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80007f58:	00048513          	mv	a0,s1
    80007f5c:	ffff9097          	auipc	ra,0xffff9
    80007f60:	288080e7          	jalr	648(ra) # 800011e4 <_ZdlPv>
    80007f64:	00090513          	mv	a0,s2
    80007f68:	00007097          	auipc	ra,0x7
    80007f6c:	160080e7          	jalr	352(ra) # 8000f0c8 <_Unwind_Resume>
    80007f70:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80007f74:	000b0513          	mv	a0,s6
    80007f78:	ffff9097          	auipc	ra,0xffff9
    80007f7c:	26c080e7          	jalr	620(ra) # 800011e4 <_ZdlPv>
    80007f80:	00048513          	mv	a0,s1
    80007f84:	00007097          	auipc	ra,0x7
    80007f88:	144080e7          	jalr	324(ra) # 8000f0c8 <_Unwind_Resume>
    80007f8c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80007f90:	000c8513          	mv	a0,s9
    80007f94:	ffff9097          	auipc	ra,0xffff9
    80007f98:	250080e7          	jalr	592(ra) # 800011e4 <_ZdlPv>
    80007f9c:	00048513          	mv	a0,s1
    80007fa0:	00007097          	auipc	ra,0x7
    80007fa4:	128080e7          	jalr	296(ra) # 8000f0c8 <_Unwind_Resume>
    80007fa8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80007fac:	000c8513          	mv	a0,s9
    80007fb0:	ffff9097          	auipc	ra,0xffff9
    80007fb4:	234080e7          	jalr	564(ra) # 800011e4 <_ZdlPv>
    80007fb8:	00048513          	mv	a0,s1
    80007fbc:	00007097          	auipc	ra,0x7
    80007fc0:	10c080e7          	jalr	268(ra) # 8000f0c8 <_Unwind_Resume>

0000000080007fc4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80007fc4:	ff010113          	addi	sp,sp,-16
    80007fc8:	00113423          	sd	ra,8(sp)
    80007fcc:	00813023          	sd	s0,0(sp)
    80007fd0:	01010413          	addi	s0,sp,16
    80007fd4:	00006797          	auipc	a5,0x6
    80007fd8:	eec78793          	addi	a5,a5,-276 # 8000dec0 <_ZTV12ConsumerSync+0x10>
    80007fdc:	00f53023          	sd	a5,0(a0)
    80007fe0:	ffff9097          	auipc	ra,0xffff9
    80007fe4:	16c080e7          	jalr	364(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007fe8:	00813083          	ld	ra,8(sp)
    80007fec:	00013403          	ld	s0,0(sp)
    80007ff0:	01010113          	addi	sp,sp,16
    80007ff4:	00008067          	ret

0000000080007ff8 <_ZN12ConsumerSyncD0Ev>:
    80007ff8:	fe010113          	addi	sp,sp,-32
    80007ffc:	00113c23          	sd	ra,24(sp)
    80008000:	00813823          	sd	s0,16(sp)
    80008004:	00913423          	sd	s1,8(sp)
    80008008:	02010413          	addi	s0,sp,32
    8000800c:	00050493          	mv	s1,a0
    80008010:	00006797          	auipc	a5,0x6
    80008014:	eb078793          	addi	a5,a5,-336 # 8000dec0 <_ZTV12ConsumerSync+0x10>
    80008018:	00f53023          	sd	a5,0(a0)
    8000801c:	ffff9097          	auipc	ra,0xffff9
    80008020:	130080e7          	jalr	304(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008024:	00048513          	mv	a0,s1
    80008028:	ffff9097          	auipc	ra,0xffff9
    8000802c:	1bc080e7          	jalr	444(ra) # 800011e4 <_ZdlPv>
    80008030:	01813083          	ld	ra,24(sp)
    80008034:	01013403          	ld	s0,16(sp)
    80008038:	00813483          	ld	s1,8(sp)
    8000803c:	02010113          	addi	sp,sp,32
    80008040:	00008067          	ret

0000000080008044 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80008044:	ff010113          	addi	sp,sp,-16
    80008048:	00113423          	sd	ra,8(sp)
    8000804c:	00813023          	sd	s0,0(sp)
    80008050:	01010413          	addi	s0,sp,16
    80008054:	00006797          	auipc	a5,0x6
    80008058:	e4478793          	addi	a5,a5,-444 # 8000de98 <_ZTV12ProducerSync+0x10>
    8000805c:	00f53023          	sd	a5,0(a0)
    80008060:	ffff9097          	auipc	ra,0xffff9
    80008064:	0ec080e7          	jalr	236(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008068:	00813083          	ld	ra,8(sp)
    8000806c:	00013403          	ld	s0,0(sp)
    80008070:	01010113          	addi	sp,sp,16
    80008074:	00008067          	ret

0000000080008078 <_ZN12ProducerSyncD0Ev>:
    80008078:	fe010113          	addi	sp,sp,-32
    8000807c:	00113c23          	sd	ra,24(sp)
    80008080:	00813823          	sd	s0,16(sp)
    80008084:	00913423          	sd	s1,8(sp)
    80008088:	02010413          	addi	s0,sp,32
    8000808c:	00050493          	mv	s1,a0
    80008090:	00006797          	auipc	a5,0x6
    80008094:	e0878793          	addi	a5,a5,-504 # 8000de98 <_ZTV12ProducerSync+0x10>
    80008098:	00f53023          	sd	a5,0(a0)
    8000809c:	ffff9097          	auipc	ra,0xffff9
    800080a0:	0b0080e7          	jalr	176(ra) # 8000114c <_ZN6ThreadD1Ev>
    800080a4:	00048513          	mv	a0,s1
    800080a8:	ffff9097          	auipc	ra,0xffff9
    800080ac:	13c080e7          	jalr	316(ra) # 800011e4 <_ZdlPv>
    800080b0:	01813083          	ld	ra,24(sp)
    800080b4:	01013403          	ld	s0,16(sp)
    800080b8:	00813483          	ld	s1,8(sp)
    800080bc:	02010113          	addi	sp,sp,32
    800080c0:	00008067          	ret

00000000800080c4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800080c4:	ff010113          	addi	sp,sp,-16
    800080c8:	00113423          	sd	ra,8(sp)
    800080cc:	00813023          	sd	s0,0(sp)
    800080d0:	01010413          	addi	s0,sp,16
    800080d4:	00006797          	auipc	a5,0x6
    800080d8:	d9c78793          	addi	a5,a5,-612 # 8000de70 <_ZTV16ProducerKeyboard+0x10>
    800080dc:	00f53023          	sd	a5,0(a0)
    800080e0:	ffff9097          	auipc	ra,0xffff9
    800080e4:	06c080e7          	jalr	108(ra) # 8000114c <_ZN6ThreadD1Ev>
    800080e8:	00813083          	ld	ra,8(sp)
    800080ec:	00013403          	ld	s0,0(sp)
    800080f0:	01010113          	addi	sp,sp,16
    800080f4:	00008067          	ret

00000000800080f8 <_ZN16ProducerKeyboardD0Ev>:
    800080f8:	fe010113          	addi	sp,sp,-32
    800080fc:	00113c23          	sd	ra,24(sp)
    80008100:	00813823          	sd	s0,16(sp)
    80008104:	00913423          	sd	s1,8(sp)
    80008108:	02010413          	addi	s0,sp,32
    8000810c:	00050493          	mv	s1,a0
    80008110:	00006797          	auipc	a5,0x6
    80008114:	d6078793          	addi	a5,a5,-672 # 8000de70 <_ZTV16ProducerKeyboard+0x10>
    80008118:	00f53023          	sd	a5,0(a0)
    8000811c:	ffff9097          	auipc	ra,0xffff9
    80008120:	030080e7          	jalr	48(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008124:	00048513          	mv	a0,s1
    80008128:	ffff9097          	auipc	ra,0xffff9
    8000812c:	0bc080e7          	jalr	188(ra) # 800011e4 <_ZdlPv>
    80008130:	01813083          	ld	ra,24(sp)
    80008134:	01013403          	ld	s0,16(sp)
    80008138:	00813483          	ld	s1,8(sp)
    8000813c:	02010113          	addi	sp,sp,32
    80008140:	00008067          	ret

0000000080008144 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80008144:	ff010113          	addi	sp,sp,-16
    80008148:	00113423          	sd	ra,8(sp)
    8000814c:	00813023          	sd	s0,0(sp)
    80008150:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80008154:	02053583          	ld	a1,32(a0)
    80008158:	fffff097          	auipc	ra,0xfffff
    8000815c:	7e4080e7          	jalr	2020(ra) # 8000793c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80008160:	00813083          	ld	ra,8(sp)
    80008164:	00013403          	ld	s0,0(sp)
    80008168:	01010113          	addi	sp,sp,16
    8000816c:	00008067          	ret

0000000080008170 <_ZN12ProducerSync3runEv>:
    void run() override {
    80008170:	ff010113          	addi	sp,sp,-16
    80008174:	00113423          	sd	ra,8(sp)
    80008178:	00813023          	sd	s0,0(sp)
    8000817c:	01010413          	addi	s0,sp,16
        producer(td);
    80008180:	02053583          	ld	a1,32(a0)
    80008184:	00000097          	auipc	ra,0x0
    80008188:	878080e7          	jalr	-1928(ra) # 800079fc <_ZN12ProducerSync8producerEPv>
    }
    8000818c:	00813083          	ld	ra,8(sp)
    80008190:	00013403          	ld	s0,0(sp)
    80008194:	01010113          	addi	sp,sp,16
    80008198:	00008067          	ret

000000008000819c <_ZN12ConsumerSync3runEv>:
    void run() override {
    8000819c:	ff010113          	addi	sp,sp,-16
    800081a0:	00113423          	sd	ra,8(sp)
    800081a4:	00813023          	sd	s0,0(sp)
    800081a8:	01010413          	addi	s0,sp,16
        consumer(td);
    800081ac:	02053583          	ld	a1,32(a0)
    800081b0:	00000097          	auipc	ra,0x0
    800081b4:	8e0080e7          	jalr	-1824(ra) # 80007a90 <_ZN12ConsumerSync8consumerEPv>
    }
    800081b8:	00813083          	ld	ra,8(sp)
    800081bc:	00013403          	ld	s0,0(sp)
    800081c0:	01010113          	addi	sp,sp,16
    800081c4:	00008067          	ret

00000000800081c8 <start>:
    800081c8:	ff010113          	addi	sp,sp,-16
    800081cc:	00813423          	sd	s0,8(sp)
    800081d0:	01010413          	addi	s0,sp,16
    800081d4:	300027f3          	csrr	a5,mstatus
    800081d8:	ffffe737          	lui	a4,0xffffe
    800081dc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffef59f>
    800081e0:	00e7f7b3          	and	a5,a5,a4
    800081e4:	00001737          	lui	a4,0x1
    800081e8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800081ec:	00e7e7b3          	or	a5,a5,a4
    800081f0:	30079073          	csrw	mstatus,a5
    800081f4:	00000797          	auipc	a5,0x0
    800081f8:	16078793          	addi	a5,a5,352 # 80008354 <system_main>
    800081fc:	34179073          	csrw	mepc,a5
    80008200:	00000793          	li	a5,0
    80008204:	18079073          	csrw	satp,a5
    80008208:	000107b7          	lui	a5,0x10
    8000820c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80008210:	30279073          	csrw	medeleg,a5
    80008214:	30379073          	csrw	mideleg,a5
    80008218:	104027f3          	csrr	a5,sie
    8000821c:	2227e793          	ori	a5,a5,546
    80008220:	10479073          	csrw	sie,a5
    80008224:	fff00793          	li	a5,-1
    80008228:	00a7d793          	srli	a5,a5,0xa
    8000822c:	3b079073          	csrw	pmpaddr0,a5
    80008230:	00f00793          	li	a5,15
    80008234:	3a079073          	csrw	pmpcfg0,a5
    80008238:	f14027f3          	csrr	a5,mhartid
    8000823c:	0200c737          	lui	a4,0x200c
    80008240:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80008244:	0007869b          	sext.w	a3,a5
    80008248:	00269713          	slli	a4,a3,0x2
    8000824c:	000f4637          	lui	a2,0xf4
    80008250:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80008254:	00d70733          	add	a4,a4,a3
    80008258:	0037979b          	slliw	a5,a5,0x3
    8000825c:	020046b7          	lui	a3,0x2004
    80008260:	00d787b3          	add	a5,a5,a3
    80008264:	00c585b3          	add	a1,a1,a2
    80008268:	00371693          	slli	a3,a4,0x3
    8000826c:	00006717          	auipc	a4,0x6
    80008270:	d9470713          	addi	a4,a4,-620 # 8000e000 <timer_scratch>
    80008274:	00b7b023          	sd	a1,0(a5)
    80008278:	00d70733          	add	a4,a4,a3
    8000827c:	00f73c23          	sd	a5,24(a4)
    80008280:	02c73023          	sd	a2,32(a4)
    80008284:	34071073          	csrw	mscratch,a4
    80008288:	00000797          	auipc	a5,0x0
    8000828c:	6e878793          	addi	a5,a5,1768 # 80008970 <timervec>
    80008290:	30579073          	csrw	mtvec,a5
    80008294:	300027f3          	csrr	a5,mstatus
    80008298:	0087e793          	ori	a5,a5,8
    8000829c:	30079073          	csrw	mstatus,a5
    800082a0:	304027f3          	csrr	a5,mie
    800082a4:	0807e793          	ori	a5,a5,128
    800082a8:	30479073          	csrw	mie,a5
    800082ac:	f14027f3          	csrr	a5,mhartid
    800082b0:	0007879b          	sext.w	a5,a5
    800082b4:	00078213          	mv	tp,a5
    800082b8:	30200073          	mret
    800082bc:	00813403          	ld	s0,8(sp)
    800082c0:	01010113          	addi	sp,sp,16
    800082c4:	00008067          	ret

00000000800082c8 <timerinit>:
    800082c8:	ff010113          	addi	sp,sp,-16
    800082cc:	00813423          	sd	s0,8(sp)
    800082d0:	01010413          	addi	s0,sp,16
    800082d4:	f14027f3          	csrr	a5,mhartid
    800082d8:	0200c737          	lui	a4,0x200c
    800082dc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800082e0:	0007869b          	sext.w	a3,a5
    800082e4:	00269713          	slli	a4,a3,0x2
    800082e8:	000f4637          	lui	a2,0xf4
    800082ec:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800082f0:	00d70733          	add	a4,a4,a3
    800082f4:	0037979b          	slliw	a5,a5,0x3
    800082f8:	020046b7          	lui	a3,0x2004
    800082fc:	00d787b3          	add	a5,a5,a3
    80008300:	00c585b3          	add	a1,a1,a2
    80008304:	00371693          	slli	a3,a4,0x3
    80008308:	00006717          	auipc	a4,0x6
    8000830c:	cf870713          	addi	a4,a4,-776 # 8000e000 <timer_scratch>
    80008310:	00b7b023          	sd	a1,0(a5)
    80008314:	00d70733          	add	a4,a4,a3
    80008318:	00f73c23          	sd	a5,24(a4)
    8000831c:	02c73023          	sd	a2,32(a4)
    80008320:	34071073          	csrw	mscratch,a4
    80008324:	00000797          	auipc	a5,0x0
    80008328:	64c78793          	addi	a5,a5,1612 # 80008970 <timervec>
    8000832c:	30579073          	csrw	mtvec,a5
    80008330:	300027f3          	csrr	a5,mstatus
    80008334:	0087e793          	ori	a5,a5,8
    80008338:	30079073          	csrw	mstatus,a5
    8000833c:	304027f3          	csrr	a5,mie
    80008340:	0807e793          	ori	a5,a5,128
    80008344:	30479073          	csrw	mie,a5
    80008348:	00813403          	ld	s0,8(sp)
    8000834c:	01010113          	addi	sp,sp,16
    80008350:	00008067          	ret

0000000080008354 <system_main>:
    80008354:	fe010113          	addi	sp,sp,-32
    80008358:	00813823          	sd	s0,16(sp)
    8000835c:	00913423          	sd	s1,8(sp)
    80008360:	00113c23          	sd	ra,24(sp)
    80008364:	02010413          	addi	s0,sp,32
    80008368:	00000097          	auipc	ra,0x0
    8000836c:	0c4080e7          	jalr	196(ra) # 8000842c <cpuid>
    80008370:	00006497          	auipc	s1,0x6
    80008374:	bd048493          	addi	s1,s1,-1072 # 8000df40 <started>
    80008378:	02050263          	beqz	a0,8000839c <system_main+0x48>
    8000837c:	0004a783          	lw	a5,0(s1)
    80008380:	0007879b          	sext.w	a5,a5
    80008384:	fe078ce3          	beqz	a5,8000837c <system_main+0x28>
    80008388:	0ff0000f          	fence
    8000838c:	00003517          	auipc	a0,0x3
    80008390:	5e450513          	addi	a0,a0,1508 # 8000b970 <CONSOLE_STATUS+0x960>
    80008394:	00001097          	auipc	ra,0x1
    80008398:	a78080e7          	jalr	-1416(ra) # 80008e0c <panic>
    8000839c:	00001097          	auipc	ra,0x1
    800083a0:	9cc080e7          	jalr	-1588(ra) # 80008d68 <consoleinit>
    800083a4:	00001097          	auipc	ra,0x1
    800083a8:	158080e7          	jalr	344(ra) # 800094fc <printfinit>
    800083ac:	00003517          	auipc	a0,0x3
    800083b0:	44450513          	addi	a0,a0,1092 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    800083b4:	00001097          	auipc	ra,0x1
    800083b8:	ab4080e7          	jalr	-1356(ra) # 80008e68 <__printf>
    800083bc:	00003517          	auipc	a0,0x3
    800083c0:	58450513          	addi	a0,a0,1412 # 8000b940 <CONSOLE_STATUS+0x930>
    800083c4:	00001097          	auipc	ra,0x1
    800083c8:	aa4080e7          	jalr	-1372(ra) # 80008e68 <__printf>
    800083cc:	00003517          	auipc	a0,0x3
    800083d0:	42450513          	addi	a0,a0,1060 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    800083d4:	00001097          	auipc	ra,0x1
    800083d8:	a94080e7          	jalr	-1388(ra) # 80008e68 <__printf>
    800083dc:	00001097          	auipc	ra,0x1
    800083e0:	4ac080e7          	jalr	1196(ra) # 80009888 <kinit>
    800083e4:	00000097          	auipc	ra,0x0
    800083e8:	148080e7          	jalr	328(ra) # 8000852c <trapinit>
    800083ec:	00000097          	auipc	ra,0x0
    800083f0:	16c080e7          	jalr	364(ra) # 80008558 <trapinithart>
    800083f4:	00000097          	auipc	ra,0x0
    800083f8:	5bc080e7          	jalr	1468(ra) # 800089b0 <plicinit>
    800083fc:	00000097          	auipc	ra,0x0
    80008400:	5dc080e7          	jalr	1500(ra) # 800089d8 <plicinithart>
    80008404:	00000097          	auipc	ra,0x0
    80008408:	078080e7          	jalr	120(ra) # 8000847c <userinit>
    8000840c:	0ff0000f          	fence
    80008410:	00100793          	li	a5,1
    80008414:	00003517          	auipc	a0,0x3
    80008418:	54450513          	addi	a0,a0,1348 # 8000b958 <CONSOLE_STATUS+0x948>
    8000841c:	00f4a023          	sw	a5,0(s1)
    80008420:	00001097          	auipc	ra,0x1
    80008424:	a48080e7          	jalr	-1464(ra) # 80008e68 <__printf>
    80008428:	0000006f          	j	80008428 <system_main+0xd4>

000000008000842c <cpuid>:
    8000842c:	ff010113          	addi	sp,sp,-16
    80008430:	00813423          	sd	s0,8(sp)
    80008434:	01010413          	addi	s0,sp,16
    80008438:	00020513          	mv	a0,tp
    8000843c:	00813403          	ld	s0,8(sp)
    80008440:	0005051b          	sext.w	a0,a0
    80008444:	01010113          	addi	sp,sp,16
    80008448:	00008067          	ret

000000008000844c <mycpu>:
    8000844c:	ff010113          	addi	sp,sp,-16
    80008450:	00813423          	sd	s0,8(sp)
    80008454:	01010413          	addi	s0,sp,16
    80008458:	00020793          	mv	a5,tp
    8000845c:	00813403          	ld	s0,8(sp)
    80008460:	0007879b          	sext.w	a5,a5
    80008464:	00779793          	slli	a5,a5,0x7
    80008468:	00007517          	auipc	a0,0x7
    8000846c:	bc850513          	addi	a0,a0,-1080 # 8000f030 <cpus>
    80008470:	00f50533          	add	a0,a0,a5
    80008474:	01010113          	addi	sp,sp,16
    80008478:	00008067          	ret

000000008000847c <userinit>:
    8000847c:	ff010113          	addi	sp,sp,-16
    80008480:	00813423          	sd	s0,8(sp)
    80008484:	01010413          	addi	s0,sp,16
    80008488:	00813403          	ld	s0,8(sp)
    8000848c:	01010113          	addi	sp,sp,16
    80008490:	ffff9317          	auipc	t1,0xffff9
    80008494:	7f030067          	jr	2032(t1) # 80001c80 <main>

0000000080008498 <either_copyout>:
    80008498:	ff010113          	addi	sp,sp,-16
    8000849c:	00813023          	sd	s0,0(sp)
    800084a0:	00113423          	sd	ra,8(sp)
    800084a4:	01010413          	addi	s0,sp,16
    800084a8:	02051663          	bnez	a0,800084d4 <either_copyout+0x3c>
    800084ac:	00058513          	mv	a0,a1
    800084b0:	00060593          	mv	a1,a2
    800084b4:	0006861b          	sext.w	a2,a3
    800084b8:	00002097          	auipc	ra,0x2
    800084bc:	c5c080e7          	jalr	-932(ra) # 8000a114 <__memmove>
    800084c0:	00813083          	ld	ra,8(sp)
    800084c4:	00013403          	ld	s0,0(sp)
    800084c8:	00000513          	li	a0,0
    800084cc:	01010113          	addi	sp,sp,16
    800084d0:	00008067          	ret
    800084d4:	00003517          	auipc	a0,0x3
    800084d8:	4c450513          	addi	a0,a0,1220 # 8000b998 <CONSOLE_STATUS+0x988>
    800084dc:	00001097          	auipc	ra,0x1
    800084e0:	930080e7          	jalr	-1744(ra) # 80008e0c <panic>

00000000800084e4 <either_copyin>:
    800084e4:	ff010113          	addi	sp,sp,-16
    800084e8:	00813023          	sd	s0,0(sp)
    800084ec:	00113423          	sd	ra,8(sp)
    800084f0:	01010413          	addi	s0,sp,16
    800084f4:	02059463          	bnez	a1,8000851c <either_copyin+0x38>
    800084f8:	00060593          	mv	a1,a2
    800084fc:	0006861b          	sext.w	a2,a3
    80008500:	00002097          	auipc	ra,0x2
    80008504:	c14080e7          	jalr	-1004(ra) # 8000a114 <__memmove>
    80008508:	00813083          	ld	ra,8(sp)
    8000850c:	00013403          	ld	s0,0(sp)
    80008510:	00000513          	li	a0,0
    80008514:	01010113          	addi	sp,sp,16
    80008518:	00008067          	ret
    8000851c:	00003517          	auipc	a0,0x3
    80008520:	4a450513          	addi	a0,a0,1188 # 8000b9c0 <CONSOLE_STATUS+0x9b0>
    80008524:	00001097          	auipc	ra,0x1
    80008528:	8e8080e7          	jalr	-1816(ra) # 80008e0c <panic>

000000008000852c <trapinit>:
    8000852c:	ff010113          	addi	sp,sp,-16
    80008530:	00813423          	sd	s0,8(sp)
    80008534:	01010413          	addi	s0,sp,16
    80008538:	00813403          	ld	s0,8(sp)
    8000853c:	00003597          	auipc	a1,0x3
    80008540:	4ac58593          	addi	a1,a1,1196 # 8000b9e8 <CONSOLE_STATUS+0x9d8>
    80008544:	00007517          	auipc	a0,0x7
    80008548:	b6c50513          	addi	a0,a0,-1172 # 8000f0b0 <tickslock>
    8000854c:	01010113          	addi	sp,sp,16
    80008550:	00001317          	auipc	t1,0x1
    80008554:	5c830067          	jr	1480(t1) # 80009b18 <initlock>

0000000080008558 <trapinithart>:
    80008558:	ff010113          	addi	sp,sp,-16
    8000855c:	00813423          	sd	s0,8(sp)
    80008560:	01010413          	addi	s0,sp,16
    80008564:	00000797          	auipc	a5,0x0
    80008568:	2fc78793          	addi	a5,a5,764 # 80008860 <kernelvec>
    8000856c:	10579073          	csrw	stvec,a5
    80008570:	00813403          	ld	s0,8(sp)
    80008574:	01010113          	addi	sp,sp,16
    80008578:	00008067          	ret

000000008000857c <usertrap>:
    8000857c:	ff010113          	addi	sp,sp,-16
    80008580:	00813423          	sd	s0,8(sp)
    80008584:	01010413          	addi	s0,sp,16
    80008588:	00813403          	ld	s0,8(sp)
    8000858c:	01010113          	addi	sp,sp,16
    80008590:	00008067          	ret

0000000080008594 <usertrapret>:
    80008594:	ff010113          	addi	sp,sp,-16
    80008598:	00813423          	sd	s0,8(sp)
    8000859c:	01010413          	addi	s0,sp,16
    800085a0:	00813403          	ld	s0,8(sp)
    800085a4:	01010113          	addi	sp,sp,16
    800085a8:	00008067          	ret

00000000800085ac <kerneltrap>:
    800085ac:	fe010113          	addi	sp,sp,-32
    800085b0:	00813823          	sd	s0,16(sp)
    800085b4:	00113c23          	sd	ra,24(sp)
    800085b8:	00913423          	sd	s1,8(sp)
    800085bc:	02010413          	addi	s0,sp,32
    800085c0:	142025f3          	csrr	a1,scause
    800085c4:	100027f3          	csrr	a5,sstatus
    800085c8:	0027f793          	andi	a5,a5,2
    800085cc:	10079c63          	bnez	a5,800086e4 <kerneltrap+0x138>
    800085d0:	142027f3          	csrr	a5,scause
    800085d4:	0207ce63          	bltz	a5,80008610 <kerneltrap+0x64>
    800085d8:	00003517          	auipc	a0,0x3
    800085dc:	45850513          	addi	a0,a0,1112 # 8000ba30 <CONSOLE_STATUS+0xa20>
    800085e0:	00001097          	auipc	ra,0x1
    800085e4:	888080e7          	jalr	-1912(ra) # 80008e68 <__printf>
    800085e8:	141025f3          	csrr	a1,sepc
    800085ec:	14302673          	csrr	a2,stval
    800085f0:	00003517          	auipc	a0,0x3
    800085f4:	45050513          	addi	a0,a0,1104 # 8000ba40 <CONSOLE_STATUS+0xa30>
    800085f8:	00001097          	auipc	ra,0x1
    800085fc:	870080e7          	jalr	-1936(ra) # 80008e68 <__printf>
    80008600:	00003517          	auipc	a0,0x3
    80008604:	45850513          	addi	a0,a0,1112 # 8000ba58 <CONSOLE_STATUS+0xa48>
    80008608:	00001097          	auipc	ra,0x1
    8000860c:	804080e7          	jalr	-2044(ra) # 80008e0c <panic>
    80008610:	0ff7f713          	andi	a4,a5,255
    80008614:	00900693          	li	a3,9
    80008618:	04d70063          	beq	a4,a3,80008658 <kerneltrap+0xac>
    8000861c:	fff00713          	li	a4,-1
    80008620:	03f71713          	slli	a4,a4,0x3f
    80008624:	00170713          	addi	a4,a4,1
    80008628:	fae798e3          	bne	a5,a4,800085d8 <kerneltrap+0x2c>
    8000862c:	00000097          	auipc	ra,0x0
    80008630:	e00080e7          	jalr	-512(ra) # 8000842c <cpuid>
    80008634:	06050663          	beqz	a0,800086a0 <kerneltrap+0xf4>
    80008638:	144027f3          	csrr	a5,sip
    8000863c:	ffd7f793          	andi	a5,a5,-3
    80008640:	14479073          	csrw	sip,a5
    80008644:	01813083          	ld	ra,24(sp)
    80008648:	01013403          	ld	s0,16(sp)
    8000864c:	00813483          	ld	s1,8(sp)
    80008650:	02010113          	addi	sp,sp,32
    80008654:	00008067          	ret
    80008658:	00000097          	auipc	ra,0x0
    8000865c:	3cc080e7          	jalr	972(ra) # 80008a24 <plic_claim>
    80008660:	00a00793          	li	a5,10
    80008664:	00050493          	mv	s1,a0
    80008668:	06f50863          	beq	a0,a5,800086d8 <kerneltrap+0x12c>
    8000866c:	fc050ce3          	beqz	a0,80008644 <kerneltrap+0x98>
    80008670:	00050593          	mv	a1,a0
    80008674:	00003517          	auipc	a0,0x3
    80008678:	39c50513          	addi	a0,a0,924 # 8000ba10 <CONSOLE_STATUS+0xa00>
    8000867c:	00000097          	auipc	ra,0x0
    80008680:	7ec080e7          	jalr	2028(ra) # 80008e68 <__printf>
    80008684:	01013403          	ld	s0,16(sp)
    80008688:	01813083          	ld	ra,24(sp)
    8000868c:	00048513          	mv	a0,s1
    80008690:	00813483          	ld	s1,8(sp)
    80008694:	02010113          	addi	sp,sp,32
    80008698:	00000317          	auipc	t1,0x0
    8000869c:	3c430067          	jr	964(t1) # 80008a5c <plic_complete>
    800086a0:	00007517          	auipc	a0,0x7
    800086a4:	a1050513          	addi	a0,a0,-1520 # 8000f0b0 <tickslock>
    800086a8:	00001097          	auipc	ra,0x1
    800086ac:	494080e7          	jalr	1172(ra) # 80009b3c <acquire>
    800086b0:	00006717          	auipc	a4,0x6
    800086b4:	89470713          	addi	a4,a4,-1900 # 8000df44 <ticks>
    800086b8:	00072783          	lw	a5,0(a4)
    800086bc:	00007517          	auipc	a0,0x7
    800086c0:	9f450513          	addi	a0,a0,-1548 # 8000f0b0 <tickslock>
    800086c4:	0017879b          	addiw	a5,a5,1
    800086c8:	00f72023          	sw	a5,0(a4)
    800086cc:	00001097          	auipc	ra,0x1
    800086d0:	53c080e7          	jalr	1340(ra) # 80009c08 <release>
    800086d4:	f65ff06f          	j	80008638 <kerneltrap+0x8c>
    800086d8:	00001097          	auipc	ra,0x1
    800086dc:	098080e7          	jalr	152(ra) # 80009770 <uartintr>
    800086e0:	fa5ff06f          	j	80008684 <kerneltrap+0xd8>
    800086e4:	00003517          	auipc	a0,0x3
    800086e8:	30c50513          	addi	a0,a0,780 # 8000b9f0 <CONSOLE_STATUS+0x9e0>
    800086ec:	00000097          	auipc	ra,0x0
    800086f0:	720080e7          	jalr	1824(ra) # 80008e0c <panic>

00000000800086f4 <clockintr>:
    800086f4:	fe010113          	addi	sp,sp,-32
    800086f8:	00813823          	sd	s0,16(sp)
    800086fc:	00913423          	sd	s1,8(sp)
    80008700:	00113c23          	sd	ra,24(sp)
    80008704:	02010413          	addi	s0,sp,32
    80008708:	00007497          	auipc	s1,0x7
    8000870c:	9a848493          	addi	s1,s1,-1624 # 8000f0b0 <tickslock>
    80008710:	00048513          	mv	a0,s1
    80008714:	00001097          	auipc	ra,0x1
    80008718:	428080e7          	jalr	1064(ra) # 80009b3c <acquire>
    8000871c:	00006717          	auipc	a4,0x6
    80008720:	82870713          	addi	a4,a4,-2008 # 8000df44 <ticks>
    80008724:	00072783          	lw	a5,0(a4)
    80008728:	01013403          	ld	s0,16(sp)
    8000872c:	01813083          	ld	ra,24(sp)
    80008730:	00048513          	mv	a0,s1
    80008734:	0017879b          	addiw	a5,a5,1
    80008738:	00813483          	ld	s1,8(sp)
    8000873c:	00f72023          	sw	a5,0(a4)
    80008740:	02010113          	addi	sp,sp,32
    80008744:	00001317          	auipc	t1,0x1
    80008748:	4c430067          	jr	1220(t1) # 80009c08 <release>

000000008000874c <devintr>:
    8000874c:	142027f3          	csrr	a5,scause
    80008750:	00000513          	li	a0,0
    80008754:	0007c463          	bltz	a5,8000875c <devintr+0x10>
    80008758:	00008067          	ret
    8000875c:	fe010113          	addi	sp,sp,-32
    80008760:	00813823          	sd	s0,16(sp)
    80008764:	00113c23          	sd	ra,24(sp)
    80008768:	00913423          	sd	s1,8(sp)
    8000876c:	02010413          	addi	s0,sp,32
    80008770:	0ff7f713          	andi	a4,a5,255
    80008774:	00900693          	li	a3,9
    80008778:	04d70c63          	beq	a4,a3,800087d0 <devintr+0x84>
    8000877c:	fff00713          	li	a4,-1
    80008780:	03f71713          	slli	a4,a4,0x3f
    80008784:	00170713          	addi	a4,a4,1
    80008788:	00e78c63          	beq	a5,a4,800087a0 <devintr+0x54>
    8000878c:	01813083          	ld	ra,24(sp)
    80008790:	01013403          	ld	s0,16(sp)
    80008794:	00813483          	ld	s1,8(sp)
    80008798:	02010113          	addi	sp,sp,32
    8000879c:	00008067          	ret
    800087a0:	00000097          	auipc	ra,0x0
    800087a4:	c8c080e7          	jalr	-884(ra) # 8000842c <cpuid>
    800087a8:	06050663          	beqz	a0,80008814 <devintr+0xc8>
    800087ac:	144027f3          	csrr	a5,sip
    800087b0:	ffd7f793          	andi	a5,a5,-3
    800087b4:	14479073          	csrw	sip,a5
    800087b8:	01813083          	ld	ra,24(sp)
    800087bc:	01013403          	ld	s0,16(sp)
    800087c0:	00813483          	ld	s1,8(sp)
    800087c4:	00200513          	li	a0,2
    800087c8:	02010113          	addi	sp,sp,32
    800087cc:	00008067          	ret
    800087d0:	00000097          	auipc	ra,0x0
    800087d4:	254080e7          	jalr	596(ra) # 80008a24 <plic_claim>
    800087d8:	00a00793          	li	a5,10
    800087dc:	00050493          	mv	s1,a0
    800087e0:	06f50663          	beq	a0,a5,8000884c <devintr+0x100>
    800087e4:	00100513          	li	a0,1
    800087e8:	fa0482e3          	beqz	s1,8000878c <devintr+0x40>
    800087ec:	00048593          	mv	a1,s1
    800087f0:	00003517          	auipc	a0,0x3
    800087f4:	22050513          	addi	a0,a0,544 # 8000ba10 <CONSOLE_STATUS+0xa00>
    800087f8:	00000097          	auipc	ra,0x0
    800087fc:	670080e7          	jalr	1648(ra) # 80008e68 <__printf>
    80008800:	00048513          	mv	a0,s1
    80008804:	00000097          	auipc	ra,0x0
    80008808:	258080e7          	jalr	600(ra) # 80008a5c <plic_complete>
    8000880c:	00100513          	li	a0,1
    80008810:	f7dff06f          	j	8000878c <devintr+0x40>
    80008814:	00007517          	auipc	a0,0x7
    80008818:	89c50513          	addi	a0,a0,-1892 # 8000f0b0 <tickslock>
    8000881c:	00001097          	auipc	ra,0x1
    80008820:	320080e7          	jalr	800(ra) # 80009b3c <acquire>
    80008824:	00005717          	auipc	a4,0x5
    80008828:	72070713          	addi	a4,a4,1824 # 8000df44 <ticks>
    8000882c:	00072783          	lw	a5,0(a4)
    80008830:	00007517          	auipc	a0,0x7
    80008834:	88050513          	addi	a0,a0,-1920 # 8000f0b0 <tickslock>
    80008838:	0017879b          	addiw	a5,a5,1
    8000883c:	00f72023          	sw	a5,0(a4)
    80008840:	00001097          	auipc	ra,0x1
    80008844:	3c8080e7          	jalr	968(ra) # 80009c08 <release>
    80008848:	f65ff06f          	j	800087ac <devintr+0x60>
    8000884c:	00001097          	auipc	ra,0x1
    80008850:	f24080e7          	jalr	-220(ra) # 80009770 <uartintr>
    80008854:	fadff06f          	j	80008800 <devintr+0xb4>
	...

0000000080008860 <kernelvec>:
    80008860:	f0010113          	addi	sp,sp,-256
    80008864:	00113023          	sd	ra,0(sp)
    80008868:	00213423          	sd	sp,8(sp)
    8000886c:	00313823          	sd	gp,16(sp)
    80008870:	00413c23          	sd	tp,24(sp)
    80008874:	02513023          	sd	t0,32(sp)
    80008878:	02613423          	sd	t1,40(sp)
    8000887c:	02713823          	sd	t2,48(sp)
    80008880:	02813c23          	sd	s0,56(sp)
    80008884:	04913023          	sd	s1,64(sp)
    80008888:	04a13423          	sd	a0,72(sp)
    8000888c:	04b13823          	sd	a1,80(sp)
    80008890:	04c13c23          	sd	a2,88(sp)
    80008894:	06d13023          	sd	a3,96(sp)
    80008898:	06e13423          	sd	a4,104(sp)
    8000889c:	06f13823          	sd	a5,112(sp)
    800088a0:	07013c23          	sd	a6,120(sp)
    800088a4:	09113023          	sd	a7,128(sp)
    800088a8:	09213423          	sd	s2,136(sp)
    800088ac:	09313823          	sd	s3,144(sp)
    800088b0:	09413c23          	sd	s4,152(sp)
    800088b4:	0b513023          	sd	s5,160(sp)
    800088b8:	0b613423          	sd	s6,168(sp)
    800088bc:	0b713823          	sd	s7,176(sp)
    800088c0:	0b813c23          	sd	s8,184(sp)
    800088c4:	0d913023          	sd	s9,192(sp)
    800088c8:	0da13423          	sd	s10,200(sp)
    800088cc:	0db13823          	sd	s11,208(sp)
    800088d0:	0dc13c23          	sd	t3,216(sp)
    800088d4:	0fd13023          	sd	t4,224(sp)
    800088d8:	0fe13423          	sd	t5,232(sp)
    800088dc:	0ff13823          	sd	t6,240(sp)
    800088e0:	ccdff0ef          	jal	ra,800085ac <kerneltrap>
    800088e4:	00013083          	ld	ra,0(sp)
    800088e8:	00813103          	ld	sp,8(sp)
    800088ec:	01013183          	ld	gp,16(sp)
    800088f0:	02013283          	ld	t0,32(sp)
    800088f4:	02813303          	ld	t1,40(sp)
    800088f8:	03013383          	ld	t2,48(sp)
    800088fc:	03813403          	ld	s0,56(sp)
    80008900:	04013483          	ld	s1,64(sp)
    80008904:	04813503          	ld	a0,72(sp)
    80008908:	05013583          	ld	a1,80(sp)
    8000890c:	05813603          	ld	a2,88(sp)
    80008910:	06013683          	ld	a3,96(sp)
    80008914:	06813703          	ld	a4,104(sp)
    80008918:	07013783          	ld	a5,112(sp)
    8000891c:	07813803          	ld	a6,120(sp)
    80008920:	08013883          	ld	a7,128(sp)
    80008924:	08813903          	ld	s2,136(sp)
    80008928:	09013983          	ld	s3,144(sp)
    8000892c:	09813a03          	ld	s4,152(sp)
    80008930:	0a013a83          	ld	s5,160(sp)
    80008934:	0a813b03          	ld	s6,168(sp)
    80008938:	0b013b83          	ld	s7,176(sp)
    8000893c:	0b813c03          	ld	s8,184(sp)
    80008940:	0c013c83          	ld	s9,192(sp)
    80008944:	0c813d03          	ld	s10,200(sp)
    80008948:	0d013d83          	ld	s11,208(sp)
    8000894c:	0d813e03          	ld	t3,216(sp)
    80008950:	0e013e83          	ld	t4,224(sp)
    80008954:	0e813f03          	ld	t5,232(sp)
    80008958:	0f013f83          	ld	t6,240(sp)
    8000895c:	10010113          	addi	sp,sp,256
    80008960:	10200073          	sret
    80008964:	00000013          	nop
    80008968:	00000013          	nop
    8000896c:	00000013          	nop

0000000080008970 <timervec>:
    80008970:	34051573          	csrrw	a0,mscratch,a0
    80008974:	00b53023          	sd	a1,0(a0)
    80008978:	00c53423          	sd	a2,8(a0)
    8000897c:	00d53823          	sd	a3,16(a0)
    80008980:	01853583          	ld	a1,24(a0)
    80008984:	02053603          	ld	a2,32(a0)
    80008988:	0005b683          	ld	a3,0(a1)
    8000898c:	00c686b3          	add	a3,a3,a2
    80008990:	00d5b023          	sd	a3,0(a1)
    80008994:	00200593          	li	a1,2
    80008998:	14459073          	csrw	sip,a1
    8000899c:	01053683          	ld	a3,16(a0)
    800089a0:	00853603          	ld	a2,8(a0)
    800089a4:	00053583          	ld	a1,0(a0)
    800089a8:	34051573          	csrrw	a0,mscratch,a0
    800089ac:	30200073          	mret

00000000800089b0 <plicinit>:
    800089b0:	ff010113          	addi	sp,sp,-16
    800089b4:	00813423          	sd	s0,8(sp)
    800089b8:	01010413          	addi	s0,sp,16
    800089bc:	00813403          	ld	s0,8(sp)
    800089c0:	0c0007b7          	lui	a5,0xc000
    800089c4:	00100713          	li	a4,1
    800089c8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800089cc:	00e7a223          	sw	a4,4(a5)
    800089d0:	01010113          	addi	sp,sp,16
    800089d4:	00008067          	ret

00000000800089d8 <plicinithart>:
    800089d8:	ff010113          	addi	sp,sp,-16
    800089dc:	00813023          	sd	s0,0(sp)
    800089e0:	00113423          	sd	ra,8(sp)
    800089e4:	01010413          	addi	s0,sp,16
    800089e8:	00000097          	auipc	ra,0x0
    800089ec:	a44080e7          	jalr	-1468(ra) # 8000842c <cpuid>
    800089f0:	0085171b          	slliw	a4,a0,0x8
    800089f4:	0c0027b7          	lui	a5,0xc002
    800089f8:	00e787b3          	add	a5,a5,a4
    800089fc:	40200713          	li	a4,1026
    80008a00:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80008a04:	00813083          	ld	ra,8(sp)
    80008a08:	00013403          	ld	s0,0(sp)
    80008a0c:	00d5151b          	slliw	a0,a0,0xd
    80008a10:	0c2017b7          	lui	a5,0xc201
    80008a14:	00a78533          	add	a0,a5,a0
    80008a18:	00052023          	sw	zero,0(a0)
    80008a1c:	01010113          	addi	sp,sp,16
    80008a20:	00008067          	ret

0000000080008a24 <plic_claim>:
    80008a24:	ff010113          	addi	sp,sp,-16
    80008a28:	00813023          	sd	s0,0(sp)
    80008a2c:	00113423          	sd	ra,8(sp)
    80008a30:	01010413          	addi	s0,sp,16
    80008a34:	00000097          	auipc	ra,0x0
    80008a38:	9f8080e7          	jalr	-1544(ra) # 8000842c <cpuid>
    80008a3c:	00813083          	ld	ra,8(sp)
    80008a40:	00013403          	ld	s0,0(sp)
    80008a44:	00d5151b          	slliw	a0,a0,0xd
    80008a48:	0c2017b7          	lui	a5,0xc201
    80008a4c:	00a78533          	add	a0,a5,a0
    80008a50:	00452503          	lw	a0,4(a0)
    80008a54:	01010113          	addi	sp,sp,16
    80008a58:	00008067          	ret

0000000080008a5c <plic_complete>:
    80008a5c:	fe010113          	addi	sp,sp,-32
    80008a60:	00813823          	sd	s0,16(sp)
    80008a64:	00913423          	sd	s1,8(sp)
    80008a68:	00113c23          	sd	ra,24(sp)
    80008a6c:	02010413          	addi	s0,sp,32
    80008a70:	00050493          	mv	s1,a0
    80008a74:	00000097          	auipc	ra,0x0
    80008a78:	9b8080e7          	jalr	-1608(ra) # 8000842c <cpuid>
    80008a7c:	01813083          	ld	ra,24(sp)
    80008a80:	01013403          	ld	s0,16(sp)
    80008a84:	00d5179b          	slliw	a5,a0,0xd
    80008a88:	0c201737          	lui	a4,0xc201
    80008a8c:	00f707b3          	add	a5,a4,a5
    80008a90:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80008a94:	00813483          	ld	s1,8(sp)
    80008a98:	02010113          	addi	sp,sp,32
    80008a9c:	00008067          	ret

0000000080008aa0 <consolewrite>:
    80008aa0:	fb010113          	addi	sp,sp,-80
    80008aa4:	04813023          	sd	s0,64(sp)
    80008aa8:	04113423          	sd	ra,72(sp)
    80008aac:	02913c23          	sd	s1,56(sp)
    80008ab0:	03213823          	sd	s2,48(sp)
    80008ab4:	03313423          	sd	s3,40(sp)
    80008ab8:	03413023          	sd	s4,32(sp)
    80008abc:	01513c23          	sd	s5,24(sp)
    80008ac0:	05010413          	addi	s0,sp,80
    80008ac4:	06c05c63          	blez	a2,80008b3c <consolewrite+0x9c>
    80008ac8:	00060993          	mv	s3,a2
    80008acc:	00050a13          	mv	s4,a0
    80008ad0:	00058493          	mv	s1,a1
    80008ad4:	00000913          	li	s2,0
    80008ad8:	fff00a93          	li	s5,-1
    80008adc:	01c0006f          	j	80008af8 <consolewrite+0x58>
    80008ae0:	fbf44503          	lbu	a0,-65(s0)
    80008ae4:	0019091b          	addiw	s2,s2,1
    80008ae8:	00148493          	addi	s1,s1,1
    80008aec:	00001097          	auipc	ra,0x1
    80008af0:	a9c080e7          	jalr	-1380(ra) # 80009588 <uartputc>
    80008af4:	03298063          	beq	s3,s2,80008b14 <consolewrite+0x74>
    80008af8:	00048613          	mv	a2,s1
    80008afc:	00100693          	li	a3,1
    80008b00:	000a0593          	mv	a1,s4
    80008b04:	fbf40513          	addi	a0,s0,-65
    80008b08:	00000097          	auipc	ra,0x0
    80008b0c:	9dc080e7          	jalr	-1572(ra) # 800084e4 <either_copyin>
    80008b10:	fd5518e3          	bne	a0,s5,80008ae0 <consolewrite+0x40>
    80008b14:	04813083          	ld	ra,72(sp)
    80008b18:	04013403          	ld	s0,64(sp)
    80008b1c:	03813483          	ld	s1,56(sp)
    80008b20:	02813983          	ld	s3,40(sp)
    80008b24:	02013a03          	ld	s4,32(sp)
    80008b28:	01813a83          	ld	s5,24(sp)
    80008b2c:	00090513          	mv	a0,s2
    80008b30:	03013903          	ld	s2,48(sp)
    80008b34:	05010113          	addi	sp,sp,80
    80008b38:	00008067          	ret
    80008b3c:	00000913          	li	s2,0
    80008b40:	fd5ff06f          	j	80008b14 <consolewrite+0x74>

0000000080008b44 <consoleread>:
    80008b44:	f9010113          	addi	sp,sp,-112
    80008b48:	06813023          	sd	s0,96(sp)
    80008b4c:	04913c23          	sd	s1,88(sp)
    80008b50:	05213823          	sd	s2,80(sp)
    80008b54:	05313423          	sd	s3,72(sp)
    80008b58:	05413023          	sd	s4,64(sp)
    80008b5c:	03513c23          	sd	s5,56(sp)
    80008b60:	03613823          	sd	s6,48(sp)
    80008b64:	03713423          	sd	s7,40(sp)
    80008b68:	03813023          	sd	s8,32(sp)
    80008b6c:	06113423          	sd	ra,104(sp)
    80008b70:	01913c23          	sd	s9,24(sp)
    80008b74:	07010413          	addi	s0,sp,112
    80008b78:	00060b93          	mv	s7,a2
    80008b7c:	00050913          	mv	s2,a0
    80008b80:	00058c13          	mv	s8,a1
    80008b84:	00060b1b          	sext.w	s6,a2
    80008b88:	00006497          	auipc	s1,0x6
    80008b8c:	55048493          	addi	s1,s1,1360 # 8000f0d8 <cons>
    80008b90:	00400993          	li	s3,4
    80008b94:	fff00a13          	li	s4,-1
    80008b98:	00a00a93          	li	s5,10
    80008b9c:	05705e63          	blez	s7,80008bf8 <consoleread+0xb4>
    80008ba0:	09c4a703          	lw	a4,156(s1)
    80008ba4:	0984a783          	lw	a5,152(s1)
    80008ba8:	0007071b          	sext.w	a4,a4
    80008bac:	08e78463          	beq	a5,a4,80008c34 <consoleread+0xf0>
    80008bb0:	07f7f713          	andi	a4,a5,127
    80008bb4:	00e48733          	add	a4,s1,a4
    80008bb8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80008bbc:	0017869b          	addiw	a3,a5,1
    80008bc0:	08d4ac23          	sw	a3,152(s1)
    80008bc4:	00070c9b          	sext.w	s9,a4
    80008bc8:	0b370663          	beq	a4,s3,80008c74 <consoleread+0x130>
    80008bcc:	00100693          	li	a3,1
    80008bd0:	f9f40613          	addi	a2,s0,-97
    80008bd4:	000c0593          	mv	a1,s8
    80008bd8:	00090513          	mv	a0,s2
    80008bdc:	f8e40fa3          	sb	a4,-97(s0)
    80008be0:	00000097          	auipc	ra,0x0
    80008be4:	8b8080e7          	jalr	-1864(ra) # 80008498 <either_copyout>
    80008be8:	01450863          	beq	a0,s4,80008bf8 <consoleread+0xb4>
    80008bec:	001c0c13          	addi	s8,s8,1
    80008bf0:	fffb8b9b          	addiw	s7,s7,-1
    80008bf4:	fb5c94e3          	bne	s9,s5,80008b9c <consoleread+0x58>
    80008bf8:	000b851b          	sext.w	a0,s7
    80008bfc:	06813083          	ld	ra,104(sp)
    80008c00:	06013403          	ld	s0,96(sp)
    80008c04:	05813483          	ld	s1,88(sp)
    80008c08:	05013903          	ld	s2,80(sp)
    80008c0c:	04813983          	ld	s3,72(sp)
    80008c10:	04013a03          	ld	s4,64(sp)
    80008c14:	03813a83          	ld	s5,56(sp)
    80008c18:	02813b83          	ld	s7,40(sp)
    80008c1c:	02013c03          	ld	s8,32(sp)
    80008c20:	01813c83          	ld	s9,24(sp)
    80008c24:	40ab053b          	subw	a0,s6,a0
    80008c28:	03013b03          	ld	s6,48(sp)
    80008c2c:	07010113          	addi	sp,sp,112
    80008c30:	00008067          	ret
    80008c34:	00001097          	auipc	ra,0x1
    80008c38:	1d8080e7          	jalr	472(ra) # 80009e0c <push_on>
    80008c3c:	0984a703          	lw	a4,152(s1)
    80008c40:	09c4a783          	lw	a5,156(s1)
    80008c44:	0007879b          	sext.w	a5,a5
    80008c48:	fef70ce3          	beq	a4,a5,80008c40 <consoleread+0xfc>
    80008c4c:	00001097          	auipc	ra,0x1
    80008c50:	234080e7          	jalr	564(ra) # 80009e80 <pop_on>
    80008c54:	0984a783          	lw	a5,152(s1)
    80008c58:	07f7f713          	andi	a4,a5,127
    80008c5c:	00e48733          	add	a4,s1,a4
    80008c60:	01874703          	lbu	a4,24(a4)
    80008c64:	0017869b          	addiw	a3,a5,1
    80008c68:	08d4ac23          	sw	a3,152(s1)
    80008c6c:	00070c9b          	sext.w	s9,a4
    80008c70:	f5371ee3          	bne	a4,s3,80008bcc <consoleread+0x88>
    80008c74:	000b851b          	sext.w	a0,s7
    80008c78:	f96bf2e3          	bgeu	s7,s6,80008bfc <consoleread+0xb8>
    80008c7c:	08f4ac23          	sw	a5,152(s1)
    80008c80:	f7dff06f          	j	80008bfc <consoleread+0xb8>

0000000080008c84 <consputc>:
    80008c84:	10000793          	li	a5,256
    80008c88:	00f50663          	beq	a0,a5,80008c94 <consputc+0x10>
    80008c8c:	00001317          	auipc	t1,0x1
    80008c90:	9f430067          	jr	-1548(t1) # 80009680 <uartputc_sync>
    80008c94:	ff010113          	addi	sp,sp,-16
    80008c98:	00113423          	sd	ra,8(sp)
    80008c9c:	00813023          	sd	s0,0(sp)
    80008ca0:	01010413          	addi	s0,sp,16
    80008ca4:	00800513          	li	a0,8
    80008ca8:	00001097          	auipc	ra,0x1
    80008cac:	9d8080e7          	jalr	-1576(ra) # 80009680 <uartputc_sync>
    80008cb0:	02000513          	li	a0,32
    80008cb4:	00001097          	auipc	ra,0x1
    80008cb8:	9cc080e7          	jalr	-1588(ra) # 80009680 <uartputc_sync>
    80008cbc:	00013403          	ld	s0,0(sp)
    80008cc0:	00813083          	ld	ra,8(sp)
    80008cc4:	00800513          	li	a0,8
    80008cc8:	01010113          	addi	sp,sp,16
    80008ccc:	00001317          	auipc	t1,0x1
    80008cd0:	9b430067          	jr	-1612(t1) # 80009680 <uartputc_sync>

0000000080008cd4 <consoleintr>:
    80008cd4:	fe010113          	addi	sp,sp,-32
    80008cd8:	00813823          	sd	s0,16(sp)
    80008cdc:	00913423          	sd	s1,8(sp)
    80008ce0:	01213023          	sd	s2,0(sp)
    80008ce4:	00113c23          	sd	ra,24(sp)
    80008ce8:	02010413          	addi	s0,sp,32
    80008cec:	00006917          	auipc	s2,0x6
    80008cf0:	3ec90913          	addi	s2,s2,1004 # 8000f0d8 <cons>
    80008cf4:	00050493          	mv	s1,a0
    80008cf8:	00090513          	mv	a0,s2
    80008cfc:	00001097          	auipc	ra,0x1
    80008d00:	e40080e7          	jalr	-448(ra) # 80009b3c <acquire>
    80008d04:	02048c63          	beqz	s1,80008d3c <consoleintr+0x68>
    80008d08:	0a092783          	lw	a5,160(s2)
    80008d0c:	09892703          	lw	a4,152(s2)
    80008d10:	07f00693          	li	a3,127
    80008d14:	40e7873b          	subw	a4,a5,a4
    80008d18:	02e6e263          	bltu	a3,a4,80008d3c <consoleintr+0x68>
    80008d1c:	00d00713          	li	a4,13
    80008d20:	04e48063          	beq	s1,a4,80008d60 <consoleintr+0x8c>
    80008d24:	07f7f713          	andi	a4,a5,127
    80008d28:	00e90733          	add	a4,s2,a4
    80008d2c:	0017879b          	addiw	a5,a5,1
    80008d30:	0af92023          	sw	a5,160(s2)
    80008d34:	00970c23          	sb	s1,24(a4)
    80008d38:	08f92e23          	sw	a5,156(s2)
    80008d3c:	01013403          	ld	s0,16(sp)
    80008d40:	01813083          	ld	ra,24(sp)
    80008d44:	00813483          	ld	s1,8(sp)
    80008d48:	00013903          	ld	s2,0(sp)
    80008d4c:	00006517          	auipc	a0,0x6
    80008d50:	38c50513          	addi	a0,a0,908 # 8000f0d8 <cons>
    80008d54:	02010113          	addi	sp,sp,32
    80008d58:	00001317          	auipc	t1,0x1
    80008d5c:	eb030067          	jr	-336(t1) # 80009c08 <release>
    80008d60:	00a00493          	li	s1,10
    80008d64:	fc1ff06f          	j	80008d24 <consoleintr+0x50>

0000000080008d68 <consoleinit>:
    80008d68:	fe010113          	addi	sp,sp,-32
    80008d6c:	00113c23          	sd	ra,24(sp)
    80008d70:	00813823          	sd	s0,16(sp)
    80008d74:	00913423          	sd	s1,8(sp)
    80008d78:	02010413          	addi	s0,sp,32
    80008d7c:	00006497          	auipc	s1,0x6
    80008d80:	35c48493          	addi	s1,s1,860 # 8000f0d8 <cons>
    80008d84:	00048513          	mv	a0,s1
    80008d88:	00003597          	auipc	a1,0x3
    80008d8c:	ce058593          	addi	a1,a1,-800 # 8000ba68 <CONSOLE_STATUS+0xa58>
    80008d90:	00001097          	auipc	ra,0x1
    80008d94:	d88080e7          	jalr	-632(ra) # 80009b18 <initlock>
    80008d98:	00000097          	auipc	ra,0x0
    80008d9c:	7ac080e7          	jalr	1964(ra) # 80009544 <uartinit>
    80008da0:	01813083          	ld	ra,24(sp)
    80008da4:	01013403          	ld	s0,16(sp)
    80008da8:	00000797          	auipc	a5,0x0
    80008dac:	d9c78793          	addi	a5,a5,-612 # 80008b44 <consoleread>
    80008db0:	0af4bc23          	sd	a5,184(s1)
    80008db4:	00000797          	auipc	a5,0x0
    80008db8:	cec78793          	addi	a5,a5,-788 # 80008aa0 <consolewrite>
    80008dbc:	0cf4b023          	sd	a5,192(s1)
    80008dc0:	00813483          	ld	s1,8(sp)
    80008dc4:	02010113          	addi	sp,sp,32
    80008dc8:	00008067          	ret

0000000080008dcc <console_read>:
    80008dcc:	ff010113          	addi	sp,sp,-16
    80008dd0:	00813423          	sd	s0,8(sp)
    80008dd4:	01010413          	addi	s0,sp,16
    80008dd8:	00813403          	ld	s0,8(sp)
    80008ddc:	00006317          	auipc	t1,0x6
    80008de0:	3b433303          	ld	t1,948(t1) # 8000f190 <devsw+0x10>
    80008de4:	01010113          	addi	sp,sp,16
    80008de8:	00030067          	jr	t1

0000000080008dec <console_write>:
    80008dec:	ff010113          	addi	sp,sp,-16
    80008df0:	00813423          	sd	s0,8(sp)
    80008df4:	01010413          	addi	s0,sp,16
    80008df8:	00813403          	ld	s0,8(sp)
    80008dfc:	00006317          	auipc	t1,0x6
    80008e00:	39c33303          	ld	t1,924(t1) # 8000f198 <devsw+0x18>
    80008e04:	01010113          	addi	sp,sp,16
    80008e08:	00030067          	jr	t1

0000000080008e0c <panic>:
    80008e0c:	fe010113          	addi	sp,sp,-32
    80008e10:	00113c23          	sd	ra,24(sp)
    80008e14:	00813823          	sd	s0,16(sp)
    80008e18:	00913423          	sd	s1,8(sp)
    80008e1c:	02010413          	addi	s0,sp,32
    80008e20:	00050493          	mv	s1,a0
    80008e24:	00003517          	auipc	a0,0x3
    80008e28:	c4c50513          	addi	a0,a0,-948 # 8000ba70 <CONSOLE_STATUS+0xa60>
    80008e2c:	00006797          	auipc	a5,0x6
    80008e30:	4007a623          	sw	zero,1036(a5) # 8000f238 <pr+0x18>
    80008e34:	00000097          	auipc	ra,0x0
    80008e38:	034080e7          	jalr	52(ra) # 80008e68 <__printf>
    80008e3c:	00048513          	mv	a0,s1
    80008e40:	00000097          	auipc	ra,0x0
    80008e44:	028080e7          	jalr	40(ra) # 80008e68 <__printf>
    80008e48:	00003517          	auipc	a0,0x3
    80008e4c:	9a850513          	addi	a0,a0,-1624 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80008e50:	00000097          	auipc	ra,0x0
    80008e54:	018080e7          	jalr	24(ra) # 80008e68 <__printf>
    80008e58:	00100793          	li	a5,1
    80008e5c:	00005717          	auipc	a4,0x5
    80008e60:	0ef72623          	sw	a5,236(a4) # 8000df48 <panicked>
    80008e64:	0000006f          	j	80008e64 <panic+0x58>

0000000080008e68 <__printf>:
    80008e68:	f3010113          	addi	sp,sp,-208
    80008e6c:	08813023          	sd	s0,128(sp)
    80008e70:	07313423          	sd	s3,104(sp)
    80008e74:	09010413          	addi	s0,sp,144
    80008e78:	05813023          	sd	s8,64(sp)
    80008e7c:	08113423          	sd	ra,136(sp)
    80008e80:	06913c23          	sd	s1,120(sp)
    80008e84:	07213823          	sd	s2,112(sp)
    80008e88:	07413023          	sd	s4,96(sp)
    80008e8c:	05513c23          	sd	s5,88(sp)
    80008e90:	05613823          	sd	s6,80(sp)
    80008e94:	05713423          	sd	s7,72(sp)
    80008e98:	03913c23          	sd	s9,56(sp)
    80008e9c:	03a13823          	sd	s10,48(sp)
    80008ea0:	03b13423          	sd	s11,40(sp)
    80008ea4:	00006317          	auipc	t1,0x6
    80008ea8:	37c30313          	addi	t1,t1,892 # 8000f220 <pr>
    80008eac:	01832c03          	lw	s8,24(t1)
    80008eb0:	00b43423          	sd	a1,8(s0)
    80008eb4:	00c43823          	sd	a2,16(s0)
    80008eb8:	00d43c23          	sd	a3,24(s0)
    80008ebc:	02e43023          	sd	a4,32(s0)
    80008ec0:	02f43423          	sd	a5,40(s0)
    80008ec4:	03043823          	sd	a6,48(s0)
    80008ec8:	03143c23          	sd	a7,56(s0)
    80008ecc:	00050993          	mv	s3,a0
    80008ed0:	4a0c1663          	bnez	s8,8000937c <__printf+0x514>
    80008ed4:	60098c63          	beqz	s3,800094ec <__printf+0x684>
    80008ed8:	0009c503          	lbu	a0,0(s3)
    80008edc:	00840793          	addi	a5,s0,8
    80008ee0:	f6f43c23          	sd	a5,-136(s0)
    80008ee4:	00000493          	li	s1,0
    80008ee8:	22050063          	beqz	a0,80009108 <__printf+0x2a0>
    80008eec:	00002a37          	lui	s4,0x2
    80008ef0:	00018ab7          	lui	s5,0x18
    80008ef4:	000f4b37          	lui	s6,0xf4
    80008ef8:	00989bb7          	lui	s7,0x989
    80008efc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80008f00:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80008f04:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80008f08:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80008f0c:	00148c9b          	addiw	s9,s1,1
    80008f10:	02500793          	li	a5,37
    80008f14:	01998933          	add	s2,s3,s9
    80008f18:	38f51263          	bne	a0,a5,8000929c <__printf+0x434>
    80008f1c:	00094783          	lbu	a5,0(s2)
    80008f20:	00078c9b          	sext.w	s9,a5
    80008f24:	1e078263          	beqz	a5,80009108 <__printf+0x2a0>
    80008f28:	0024849b          	addiw	s1,s1,2
    80008f2c:	07000713          	li	a4,112
    80008f30:	00998933          	add	s2,s3,s1
    80008f34:	38e78a63          	beq	a5,a4,800092c8 <__printf+0x460>
    80008f38:	20f76863          	bltu	a4,a5,80009148 <__printf+0x2e0>
    80008f3c:	42a78863          	beq	a5,a0,8000936c <__printf+0x504>
    80008f40:	06400713          	li	a4,100
    80008f44:	40e79663          	bne	a5,a4,80009350 <__printf+0x4e8>
    80008f48:	f7843783          	ld	a5,-136(s0)
    80008f4c:	0007a603          	lw	a2,0(a5)
    80008f50:	00878793          	addi	a5,a5,8
    80008f54:	f6f43c23          	sd	a5,-136(s0)
    80008f58:	42064a63          	bltz	a2,8000938c <__printf+0x524>
    80008f5c:	00a00713          	li	a4,10
    80008f60:	02e677bb          	remuw	a5,a2,a4
    80008f64:	00003d97          	auipc	s11,0x3
    80008f68:	b34d8d93          	addi	s11,s11,-1228 # 8000ba98 <digits>
    80008f6c:	00900593          	li	a1,9
    80008f70:	0006051b          	sext.w	a0,a2
    80008f74:	00000c93          	li	s9,0
    80008f78:	02079793          	slli	a5,a5,0x20
    80008f7c:	0207d793          	srli	a5,a5,0x20
    80008f80:	00fd87b3          	add	a5,s11,a5
    80008f84:	0007c783          	lbu	a5,0(a5)
    80008f88:	02e656bb          	divuw	a3,a2,a4
    80008f8c:	f8f40023          	sb	a5,-128(s0)
    80008f90:	14c5d863          	bge	a1,a2,800090e0 <__printf+0x278>
    80008f94:	06300593          	li	a1,99
    80008f98:	00100c93          	li	s9,1
    80008f9c:	02e6f7bb          	remuw	a5,a3,a4
    80008fa0:	02079793          	slli	a5,a5,0x20
    80008fa4:	0207d793          	srli	a5,a5,0x20
    80008fa8:	00fd87b3          	add	a5,s11,a5
    80008fac:	0007c783          	lbu	a5,0(a5)
    80008fb0:	02e6d73b          	divuw	a4,a3,a4
    80008fb4:	f8f400a3          	sb	a5,-127(s0)
    80008fb8:	12a5f463          	bgeu	a1,a0,800090e0 <__printf+0x278>
    80008fbc:	00a00693          	li	a3,10
    80008fc0:	00900593          	li	a1,9
    80008fc4:	02d777bb          	remuw	a5,a4,a3
    80008fc8:	02079793          	slli	a5,a5,0x20
    80008fcc:	0207d793          	srli	a5,a5,0x20
    80008fd0:	00fd87b3          	add	a5,s11,a5
    80008fd4:	0007c503          	lbu	a0,0(a5)
    80008fd8:	02d757bb          	divuw	a5,a4,a3
    80008fdc:	f8a40123          	sb	a0,-126(s0)
    80008fe0:	48e5f263          	bgeu	a1,a4,80009464 <__printf+0x5fc>
    80008fe4:	06300513          	li	a0,99
    80008fe8:	02d7f5bb          	remuw	a1,a5,a3
    80008fec:	02059593          	slli	a1,a1,0x20
    80008ff0:	0205d593          	srli	a1,a1,0x20
    80008ff4:	00bd85b3          	add	a1,s11,a1
    80008ff8:	0005c583          	lbu	a1,0(a1)
    80008ffc:	02d7d7bb          	divuw	a5,a5,a3
    80009000:	f8b401a3          	sb	a1,-125(s0)
    80009004:	48e57263          	bgeu	a0,a4,80009488 <__printf+0x620>
    80009008:	3e700513          	li	a0,999
    8000900c:	02d7f5bb          	remuw	a1,a5,a3
    80009010:	02059593          	slli	a1,a1,0x20
    80009014:	0205d593          	srli	a1,a1,0x20
    80009018:	00bd85b3          	add	a1,s11,a1
    8000901c:	0005c583          	lbu	a1,0(a1)
    80009020:	02d7d7bb          	divuw	a5,a5,a3
    80009024:	f8b40223          	sb	a1,-124(s0)
    80009028:	46e57663          	bgeu	a0,a4,80009494 <__printf+0x62c>
    8000902c:	02d7f5bb          	remuw	a1,a5,a3
    80009030:	02059593          	slli	a1,a1,0x20
    80009034:	0205d593          	srli	a1,a1,0x20
    80009038:	00bd85b3          	add	a1,s11,a1
    8000903c:	0005c583          	lbu	a1,0(a1)
    80009040:	02d7d7bb          	divuw	a5,a5,a3
    80009044:	f8b402a3          	sb	a1,-123(s0)
    80009048:	46ea7863          	bgeu	s4,a4,800094b8 <__printf+0x650>
    8000904c:	02d7f5bb          	remuw	a1,a5,a3
    80009050:	02059593          	slli	a1,a1,0x20
    80009054:	0205d593          	srli	a1,a1,0x20
    80009058:	00bd85b3          	add	a1,s11,a1
    8000905c:	0005c583          	lbu	a1,0(a1)
    80009060:	02d7d7bb          	divuw	a5,a5,a3
    80009064:	f8b40323          	sb	a1,-122(s0)
    80009068:	3eeaf863          	bgeu	s5,a4,80009458 <__printf+0x5f0>
    8000906c:	02d7f5bb          	remuw	a1,a5,a3
    80009070:	02059593          	slli	a1,a1,0x20
    80009074:	0205d593          	srli	a1,a1,0x20
    80009078:	00bd85b3          	add	a1,s11,a1
    8000907c:	0005c583          	lbu	a1,0(a1)
    80009080:	02d7d7bb          	divuw	a5,a5,a3
    80009084:	f8b403a3          	sb	a1,-121(s0)
    80009088:	42eb7e63          	bgeu	s6,a4,800094c4 <__printf+0x65c>
    8000908c:	02d7f5bb          	remuw	a1,a5,a3
    80009090:	02059593          	slli	a1,a1,0x20
    80009094:	0205d593          	srli	a1,a1,0x20
    80009098:	00bd85b3          	add	a1,s11,a1
    8000909c:	0005c583          	lbu	a1,0(a1)
    800090a0:	02d7d7bb          	divuw	a5,a5,a3
    800090a4:	f8b40423          	sb	a1,-120(s0)
    800090a8:	42ebfc63          	bgeu	s7,a4,800094e0 <__printf+0x678>
    800090ac:	02079793          	slli	a5,a5,0x20
    800090b0:	0207d793          	srli	a5,a5,0x20
    800090b4:	00fd8db3          	add	s11,s11,a5
    800090b8:	000dc703          	lbu	a4,0(s11)
    800090bc:	00a00793          	li	a5,10
    800090c0:	00900c93          	li	s9,9
    800090c4:	f8e404a3          	sb	a4,-119(s0)
    800090c8:	00065c63          	bgez	a2,800090e0 <__printf+0x278>
    800090cc:	f9040713          	addi	a4,s0,-112
    800090d0:	00f70733          	add	a4,a4,a5
    800090d4:	02d00693          	li	a3,45
    800090d8:	fed70823          	sb	a3,-16(a4)
    800090dc:	00078c93          	mv	s9,a5
    800090e0:	f8040793          	addi	a5,s0,-128
    800090e4:	01978cb3          	add	s9,a5,s9
    800090e8:	f7f40d13          	addi	s10,s0,-129
    800090ec:	000cc503          	lbu	a0,0(s9)
    800090f0:	fffc8c93          	addi	s9,s9,-1
    800090f4:	00000097          	auipc	ra,0x0
    800090f8:	b90080e7          	jalr	-1136(ra) # 80008c84 <consputc>
    800090fc:	ffac98e3          	bne	s9,s10,800090ec <__printf+0x284>
    80009100:	00094503          	lbu	a0,0(s2)
    80009104:	e00514e3          	bnez	a0,80008f0c <__printf+0xa4>
    80009108:	1a0c1663          	bnez	s8,800092b4 <__printf+0x44c>
    8000910c:	08813083          	ld	ra,136(sp)
    80009110:	08013403          	ld	s0,128(sp)
    80009114:	07813483          	ld	s1,120(sp)
    80009118:	07013903          	ld	s2,112(sp)
    8000911c:	06813983          	ld	s3,104(sp)
    80009120:	06013a03          	ld	s4,96(sp)
    80009124:	05813a83          	ld	s5,88(sp)
    80009128:	05013b03          	ld	s6,80(sp)
    8000912c:	04813b83          	ld	s7,72(sp)
    80009130:	04013c03          	ld	s8,64(sp)
    80009134:	03813c83          	ld	s9,56(sp)
    80009138:	03013d03          	ld	s10,48(sp)
    8000913c:	02813d83          	ld	s11,40(sp)
    80009140:	0d010113          	addi	sp,sp,208
    80009144:	00008067          	ret
    80009148:	07300713          	li	a4,115
    8000914c:	1ce78a63          	beq	a5,a4,80009320 <__printf+0x4b8>
    80009150:	07800713          	li	a4,120
    80009154:	1ee79e63          	bne	a5,a4,80009350 <__printf+0x4e8>
    80009158:	f7843783          	ld	a5,-136(s0)
    8000915c:	0007a703          	lw	a4,0(a5)
    80009160:	00878793          	addi	a5,a5,8
    80009164:	f6f43c23          	sd	a5,-136(s0)
    80009168:	28074263          	bltz	a4,800093ec <__printf+0x584>
    8000916c:	00003d97          	auipc	s11,0x3
    80009170:	92cd8d93          	addi	s11,s11,-1748 # 8000ba98 <digits>
    80009174:	00f77793          	andi	a5,a4,15
    80009178:	00fd87b3          	add	a5,s11,a5
    8000917c:	0007c683          	lbu	a3,0(a5)
    80009180:	00f00613          	li	a2,15
    80009184:	0007079b          	sext.w	a5,a4
    80009188:	f8d40023          	sb	a3,-128(s0)
    8000918c:	0047559b          	srliw	a1,a4,0x4
    80009190:	0047569b          	srliw	a3,a4,0x4
    80009194:	00000c93          	li	s9,0
    80009198:	0ee65063          	bge	a2,a4,80009278 <__printf+0x410>
    8000919c:	00f6f693          	andi	a3,a3,15
    800091a0:	00dd86b3          	add	a3,s11,a3
    800091a4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800091a8:	0087d79b          	srliw	a5,a5,0x8
    800091ac:	00100c93          	li	s9,1
    800091b0:	f8d400a3          	sb	a3,-127(s0)
    800091b4:	0cb67263          	bgeu	a2,a1,80009278 <__printf+0x410>
    800091b8:	00f7f693          	andi	a3,a5,15
    800091bc:	00dd86b3          	add	a3,s11,a3
    800091c0:	0006c583          	lbu	a1,0(a3)
    800091c4:	00f00613          	li	a2,15
    800091c8:	0047d69b          	srliw	a3,a5,0x4
    800091cc:	f8b40123          	sb	a1,-126(s0)
    800091d0:	0047d593          	srli	a1,a5,0x4
    800091d4:	28f67e63          	bgeu	a2,a5,80009470 <__printf+0x608>
    800091d8:	00f6f693          	andi	a3,a3,15
    800091dc:	00dd86b3          	add	a3,s11,a3
    800091e0:	0006c503          	lbu	a0,0(a3)
    800091e4:	0087d813          	srli	a6,a5,0x8
    800091e8:	0087d69b          	srliw	a3,a5,0x8
    800091ec:	f8a401a3          	sb	a0,-125(s0)
    800091f0:	28b67663          	bgeu	a2,a1,8000947c <__printf+0x614>
    800091f4:	00f6f693          	andi	a3,a3,15
    800091f8:	00dd86b3          	add	a3,s11,a3
    800091fc:	0006c583          	lbu	a1,0(a3)
    80009200:	00c7d513          	srli	a0,a5,0xc
    80009204:	00c7d69b          	srliw	a3,a5,0xc
    80009208:	f8b40223          	sb	a1,-124(s0)
    8000920c:	29067a63          	bgeu	a2,a6,800094a0 <__printf+0x638>
    80009210:	00f6f693          	andi	a3,a3,15
    80009214:	00dd86b3          	add	a3,s11,a3
    80009218:	0006c583          	lbu	a1,0(a3)
    8000921c:	0107d813          	srli	a6,a5,0x10
    80009220:	0107d69b          	srliw	a3,a5,0x10
    80009224:	f8b402a3          	sb	a1,-123(s0)
    80009228:	28a67263          	bgeu	a2,a0,800094ac <__printf+0x644>
    8000922c:	00f6f693          	andi	a3,a3,15
    80009230:	00dd86b3          	add	a3,s11,a3
    80009234:	0006c683          	lbu	a3,0(a3)
    80009238:	0147d79b          	srliw	a5,a5,0x14
    8000923c:	f8d40323          	sb	a3,-122(s0)
    80009240:	21067663          	bgeu	a2,a6,8000944c <__printf+0x5e4>
    80009244:	02079793          	slli	a5,a5,0x20
    80009248:	0207d793          	srli	a5,a5,0x20
    8000924c:	00fd8db3          	add	s11,s11,a5
    80009250:	000dc683          	lbu	a3,0(s11)
    80009254:	00800793          	li	a5,8
    80009258:	00700c93          	li	s9,7
    8000925c:	f8d403a3          	sb	a3,-121(s0)
    80009260:	00075c63          	bgez	a4,80009278 <__printf+0x410>
    80009264:	f9040713          	addi	a4,s0,-112
    80009268:	00f70733          	add	a4,a4,a5
    8000926c:	02d00693          	li	a3,45
    80009270:	fed70823          	sb	a3,-16(a4)
    80009274:	00078c93          	mv	s9,a5
    80009278:	f8040793          	addi	a5,s0,-128
    8000927c:	01978cb3          	add	s9,a5,s9
    80009280:	f7f40d13          	addi	s10,s0,-129
    80009284:	000cc503          	lbu	a0,0(s9)
    80009288:	fffc8c93          	addi	s9,s9,-1
    8000928c:	00000097          	auipc	ra,0x0
    80009290:	9f8080e7          	jalr	-1544(ra) # 80008c84 <consputc>
    80009294:	ff9d18e3          	bne	s10,s9,80009284 <__printf+0x41c>
    80009298:	0100006f          	j	800092a8 <__printf+0x440>
    8000929c:	00000097          	auipc	ra,0x0
    800092a0:	9e8080e7          	jalr	-1560(ra) # 80008c84 <consputc>
    800092a4:	000c8493          	mv	s1,s9
    800092a8:	00094503          	lbu	a0,0(s2)
    800092ac:	c60510e3          	bnez	a0,80008f0c <__printf+0xa4>
    800092b0:	e40c0ee3          	beqz	s8,8000910c <__printf+0x2a4>
    800092b4:	00006517          	auipc	a0,0x6
    800092b8:	f6c50513          	addi	a0,a0,-148 # 8000f220 <pr>
    800092bc:	00001097          	auipc	ra,0x1
    800092c0:	94c080e7          	jalr	-1716(ra) # 80009c08 <release>
    800092c4:	e49ff06f          	j	8000910c <__printf+0x2a4>
    800092c8:	f7843783          	ld	a5,-136(s0)
    800092cc:	03000513          	li	a0,48
    800092d0:	01000d13          	li	s10,16
    800092d4:	00878713          	addi	a4,a5,8
    800092d8:	0007bc83          	ld	s9,0(a5)
    800092dc:	f6e43c23          	sd	a4,-136(s0)
    800092e0:	00000097          	auipc	ra,0x0
    800092e4:	9a4080e7          	jalr	-1628(ra) # 80008c84 <consputc>
    800092e8:	07800513          	li	a0,120
    800092ec:	00000097          	auipc	ra,0x0
    800092f0:	998080e7          	jalr	-1640(ra) # 80008c84 <consputc>
    800092f4:	00002d97          	auipc	s11,0x2
    800092f8:	7a4d8d93          	addi	s11,s11,1956 # 8000ba98 <digits>
    800092fc:	03ccd793          	srli	a5,s9,0x3c
    80009300:	00fd87b3          	add	a5,s11,a5
    80009304:	0007c503          	lbu	a0,0(a5)
    80009308:	fffd0d1b          	addiw	s10,s10,-1
    8000930c:	004c9c93          	slli	s9,s9,0x4
    80009310:	00000097          	auipc	ra,0x0
    80009314:	974080e7          	jalr	-1676(ra) # 80008c84 <consputc>
    80009318:	fe0d12e3          	bnez	s10,800092fc <__printf+0x494>
    8000931c:	f8dff06f          	j	800092a8 <__printf+0x440>
    80009320:	f7843783          	ld	a5,-136(s0)
    80009324:	0007bc83          	ld	s9,0(a5)
    80009328:	00878793          	addi	a5,a5,8
    8000932c:	f6f43c23          	sd	a5,-136(s0)
    80009330:	000c9a63          	bnez	s9,80009344 <__printf+0x4dc>
    80009334:	1080006f          	j	8000943c <__printf+0x5d4>
    80009338:	001c8c93          	addi	s9,s9,1
    8000933c:	00000097          	auipc	ra,0x0
    80009340:	948080e7          	jalr	-1720(ra) # 80008c84 <consputc>
    80009344:	000cc503          	lbu	a0,0(s9)
    80009348:	fe0518e3          	bnez	a0,80009338 <__printf+0x4d0>
    8000934c:	f5dff06f          	j	800092a8 <__printf+0x440>
    80009350:	02500513          	li	a0,37
    80009354:	00000097          	auipc	ra,0x0
    80009358:	930080e7          	jalr	-1744(ra) # 80008c84 <consputc>
    8000935c:	000c8513          	mv	a0,s9
    80009360:	00000097          	auipc	ra,0x0
    80009364:	924080e7          	jalr	-1756(ra) # 80008c84 <consputc>
    80009368:	f41ff06f          	j	800092a8 <__printf+0x440>
    8000936c:	02500513          	li	a0,37
    80009370:	00000097          	auipc	ra,0x0
    80009374:	914080e7          	jalr	-1772(ra) # 80008c84 <consputc>
    80009378:	f31ff06f          	j	800092a8 <__printf+0x440>
    8000937c:	00030513          	mv	a0,t1
    80009380:	00000097          	auipc	ra,0x0
    80009384:	7bc080e7          	jalr	1980(ra) # 80009b3c <acquire>
    80009388:	b4dff06f          	j	80008ed4 <__printf+0x6c>
    8000938c:	40c0053b          	negw	a0,a2
    80009390:	00a00713          	li	a4,10
    80009394:	02e576bb          	remuw	a3,a0,a4
    80009398:	00002d97          	auipc	s11,0x2
    8000939c:	700d8d93          	addi	s11,s11,1792 # 8000ba98 <digits>
    800093a0:	ff700593          	li	a1,-9
    800093a4:	02069693          	slli	a3,a3,0x20
    800093a8:	0206d693          	srli	a3,a3,0x20
    800093ac:	00dd86b3          	add	a3,s11,a3
    800093b0:	0006c683          	lbu	a3,0(a3)
    800093b4:	02e557bb          	divuw	a5,a0,a4
    800093b8:	f8d40023          	sb	a3,-128(s0)
    800093bc:	10b65e63          	bge	a2,a1,800094d8 <__printf+0x670>
    800093c0:	06300593          	li	a1,99
    800093c4:	02e7f6bb          	remuw	a3,a5,a4
    800093c8:	02069693          	slli	a3,a3,0x20
    800093cc:	0206d693          	srli	a3,a3,0x20
    800093d0:	00dd86b3          	add	a3,s11,a3
    800093d4:	0006c683          	lbu	a3,0(a3)
    800093d8:	02e7d73b          	divuw	a4,a5,a4
    800093dc:	00200793          	li	a5,2
    800093e0:	f8d400a3          	sb	a3,-127(s0)
    800093e4:	bca5ece3          	bltu	a1,a0,80008fbc <__printf+0x154>
    800093e8:	ce5ff06f          	j	800090cc <__printf+0x264>
    800093ec:	40e007bb          	negw	a5,a4
    800093f0:	00002d97          	auipc	s11,0x2
    800093f4:	6a8d8d93          	addi	s11,s11,1704 # 8000ba98 <digits>
    800093f8:	00f7f693          	andi	a3,a5,15
    800093fc:	00dd86b3          	add	a3,s11,a3
    80009400:	0006c583          	lbu	a1,0(a3)
    80009404:	ff100613          	li	a2,-15
    80009408:	0047d69b          	srliw	a3,a5,0x4
    8000940c:	f8b40023          	sb	a1,-128(s0)
    80009410:	0047d59b          	srliw	a1,a5,0x4
    80009414:	0ac75e63          	bge	a4,a2,800094d0 <__printf+0x668>
    80009418:	00f6f693          	andi	a3,a3,15
    8000941c:	00dd86b3          	add	a3,s11,a3
    80009420:	0006c603          	lbu	a2,0(a3)
    80009424:	00f00693          	li	a3,15
    80009428:	0087d79b          	srliw	a5,a5,0x8
    8000942c:	f8c400a3          	sb	a2,-127(s0)
    80009430:	d8b6e4e3          	bltu	a3,a1,800091b8 <__printf+0x350>
    80009434:	00200793          	li	a5,2
    80009438:	e2dff06f          	j	80009264 <__printf+0x3fc>
    8000943c:	00002c97          	auipc	s9,0x2
    80009440:	63cc8c93          	addi	s9,s9,1596 # 8000ba78 <CONSOLE_STATUS+0xa68>
    80009444:	02800513          	li	a0,40
    80009448:	ef1ff06f          	j	80009338 <__printf+0x4d0>
    8000944c:	00700793          	li	a5,7
    80009450:	00600c93          	li	s9,6
    80009454:	e0dff06f          	j	80009260 <__printf+0x3f8>
    80009458:	00700793          	li	a5,7
    8000945c:	00600c93          	li	s9,6
    80009460:	c69ff06f          	j	800090c8 <__printf+0x260>
    80009464:	00300793          	li	a5,3
    80009468:	00200c93          	li	s9,2
    8000946c:	c5dff06f          	j	800090c8 <__printf+0x260>
    80009470:	00300793          	li	a5,3
    80009474:	00200c93          	li	s9,2
    80009478:	de9ff06f          	j	80009260 <__printf+0x3f8>
    8000947c:	00400793          	li	a5,4
    80009480:	00300c93          	li	s9,3
    80009484:	dddff06f          	j	80009260 <__printf+0x3f8>
    80009488:	00400793          	li	a5,4
    8000948c:	00300c93          	li	s9,3
    80009490:	c39ff06f          	j	800090c8 <__printf+0x260>
    80009494:	00500793          	li	a5,5
    80009498:	00400c93          	li	s9,4
    8000949c:	c2dff06f          	j	800090c8 <__printf+0x260>
    800094a0:	00500793          	li	a5,5
    800094a4:	00400c93          	li	s9,4
    800094a8:	db9ff06f          	j	80009260 <__printf+0x3f8>
    800094ac:	00600793          	li	a5,6
    800094b0:	00500c93          	li	s9,5
    800094b4:	dadff06f          	j	80009260 <__printf+0x3f8>
    800094b8:	00600793          	li	a5,6
    800094bc:	00500c93          	li	s9,5
    800094c0:	c09ff06f          	j	800090c8 <__printf+0x260>
    800094c4:	00800793          	li	a5,8
    800094c8:	00700c93          	li	s9,7
    800094cc:	bfdff06f          	j	800090c8 <__printf+0x260>
    800094d0:	00100793          	li	a5,1
    800094d4:	d91ff06f          	j	80009264 <__printf+0x3fc>
    800094d8:	00100793          	li	a5,1
    800094dc:	bf1ff06f          	j	800090cc <__printf+0x264>
    800094e0:	00900793          	li	a5,9
    800094e4:	00800c93          	li	s9,8
    800094e8:	be1ff06f          	j	800090c8 <__printf+0x260>
    800094ec:	00002517          	auipc	a0,0x2
    800094f0:	59450513          	addi	a0,a0,1428 # 8000ba80 <CONSOLE_STATUS+0xa70>
    800094f4:	00000097          	auipc	ra,0x0
    800094f8:	918080e7          	jalr	-1768(ra) # 80008e0c <panic>

00000000800094fc <printfinit>:
    800094fc:	fe010113          	addi	sp,sp,-32
    80009500:	00813823          	sd	s0,16(sp)
    80009504:	00913423          	sd	s1,8(sp)
    80009508:	00113c23          	sd	ra,24(sp)
    8000950c:	02010413          	addi	s0,sp,32
    80009510:	00006497          	auipc	s1,0x6
    80009514:	d1048493          	addi	s1,s1,-752 # 8000f220 <pr>
    80009518:	00048513          	mv	a0,s1
    8000951c:	00002597          	auipc	a1,0x2
    80009520:	57458593          	addi	a1,a1,1396 # 8000ba90 <CONSOLE_STATUS+0xa80>
    80009524:	00000097          	auipc	ra,0x0
    80009528:	5f4080e7          	jalr	1524(ra) # 80009b18 <initlock>
    8000952c:	01813083          	ld	ra,24(sp)
    80009530:	01013403          	ld	s0,16(sp)
    80009534:	0004ac23          	sw	zero,24(s1)
    80009538:	00813483          	ld	s1,8(sp)
    8000953c:	02010113          	addi	sp,sp,32
    80009540:	00008067          	ret

0000000080009544 <uartinit>:
    80009544:	ff010113          	addi	sp,sp,-16
    80009548:	00813423          	sd	s0,8(sp)
    8000954c:	01010413          	addi	s0,sp,16
    80009550:	100007b7          	lui	a5,0x10000
    80009554:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80009558:	f8000713          	li	a4,-128
    8000955c:	00e781a3          	sb	a4,3(a5)
    80009560:	00300713          	li	a4,3
    80009564:	00e78023          	sb	a4,0(a5)
    80009568:	000780a3          	sb	zero,1(a5)
    8000956c:	00e781a3          	sb	a4,3(a5)
    80009570:	00700693          	li	a3,7
    80009574:	00d78123          	sb	a3,2(a5)
    80009578:	00e780a3          	sb	a4,1(a5)
    8000957c:	00813403          	ld	s0,8(sp)
    80009580:	01010113          	addi	sp,sp,16
    80009584:	00008067          	ret

0000000080009588 <uartputc>:
    80009588:	00005797          	auipc	a5,0x5
    8000958c:	9c07a783          	lw	a5,-1600(a5) # 8000df48 <panicked>
    80009590:	00078463          	beqz	a5,80009598 <uartputc+0x10>
    80009594:	0000006f          	j	80009594 <uartputc+0xc>
    80009598:	fd010113          	addi	sp,sp,-48
    8000959c:	02813023          	sd	s0,32(sp)
    800095a0:	00913c23          	sd	s1,24(sp)
    800095a4:	01213823          	sd	s2,16(sp)
    800095a8:	01313423          	sd	s3,8(sp)
    800095ac:	02113423          	sd	ra,40(sp)
    800095b0:	03010413          	addi	s0,sp,48
    800095b4:	00005917          	auipc	s2,0x5
    800095b8:	99c90913          	addi	s2,s2,-1636 # 8000df50 <uart_tx_r>
    800095bc:	00093783          	ld	a5,0(s2)
    800095c0:	00005497          	auipc	s1,0x5
    800095c4:	99848493          	addi	s1,s1,-1640 # 8000df58 <uart_tx_w>
    800095c8:	0004b703          	ld	a4,0(s1)
    800095cc:	02078693          	addi	a3,a5,32
    800095d0:	00050993          	mv	s3,a0
    800095d4:	02e69c63          	bne	a3,a4,8000960c <uartputc+0x84>
    800095d8:	00001097          	auipc	ra,0x1
    800095dc:	834080e7          	jalr	-1996(ra) # 80009e0c <push_on>
    800095e0:	00093783          	ld	a5,0(s2)
    800095e4:	0004b703          	ld	a4,0(s1)
    800095e8:	02078793          	addi	a5,a5,32
    800095ec:	00e79463          	bne	a5,a4,800095f4 <uartputc+0x6c>
    800095f0:	0000006f          	j	800095f0 <uartputc+0x68>
    800095f4:	00001097          	auipc	ra,0x1
    800095f8:	88c080e7          	jalr	-1908(ra) # 80009e80 <pop_on>
    800095fc:	00093783          	ld	a5,0(s2)
    80009600:	0004b703          	ld	a4,0(s1)
    80009604:	02078693          	addi	a3,a5,32
    80009608:	fce688e3          	beq	a3,a4,800095d8 <uartputc+0x50>
    8000960c:	01f77693          	andi	a3,a4,31
    80009610:	00006597          	auipc	a1,0x6
    80009614:	c3058593          	addi	a1,a1,-976 # 8000f240 <uart_tx_buf>
    80009618:	00d586b3          	add	a3,a1,a3
    8000961c:	00170713          	addi	a4,a4,1
    80009620:	01368023          	sb	s3,0(a3)
    80009624:	00e4b023          	sd	a4,0(s1)
    80009628:	10000637          	lui	a2,0x10000
    8000962c:	02f71063          	bne	a4,a5,8000964c <uartputc+0xc4>
    80009630:	0340006f          	j	80009664 <uartputc+0xdc>
    80009634:	00074703          	lbu	a4,0(a4)
    80009638:	00f93023          	sd	a5,0(s2)
    8000963c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80009640:	00093783          	ld	a5,0(s2)
    80009644:	0004b703          	ld	a4,0(s1)
    80009648:	00f70e63          	beq	a4,a5,80009664 <uartputc+0xdc>
    8000964c:	00564683          	lbu	a3,5(a2)
    80009650:	01f7f713          	andi	a4,a5,31
    80009654:	00e58733          	add	a4,a1,a4
    80009658:	0206f693          	andi	a3,a3,32
    8000965c:	00178793          	addi	a5,a5,1
    80009660:	fc069ae3          	bnez	a3,80009634 <uartputc+0xac>
    80009664:	02813083          	ld	ra,40(sp)
    80009668:	02013403          	ld	s0,32(sp)
    8000966c:	01813483          	ld	s1,24(sp)
    80009670:	01013903          	ld	s2,16(sp)
    80009674:	00813983          	ld	s3,8(sp)
    80009678:	03010113          	addi	sp,sp,48
    8000967c:	00008067          	ret

0000000080009680 <uartputc_sync>:
    80009680:	ff010113          	addi	sp,sp,-16
    80009684:	00813423          	sd	s0,8(sp)
    80009688:	01010413          	addi	s0,sp,16
    8000968c:	00005717          	auipc	a4,0x5
    80009690:	8bc72703          	lw	a4,-1860(a4) # 8000df48 <panicked>
    80009694:	02071663          	bnez	a4,800096c0 <uartputc_sync+0x40>
    80009698:	00050793          	mv	a5,a0
    8000969c:	100006b7          	lui	a3,0x10000
    800096a0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800096a4:	02077713          	andi	a4,a4,32
    800096a8:	fe070ce3          	beqz	a4,800096a0 <uartputc_sync+0x20>
    800096ac:	0ff7f793          	andi	a5,a5,255
    800096b0:	00f68023          	sb	a5,0(a3)
    800096b4:	00813403          	ld	s0,8(sp)
    800096b8:	01010113          	addi	sp,sp,16
    800096bc:	00008067          	ret
    800096c0:	0000006f          	j	800096c0 <uartputc_sync+0x40>

00000000800096c4 <uartstart>:
    800096c4:	ff010113          	addi	sp,sp,-16
    800096c8:	00813423          	sd	s0,8(sp)
    800096cc:	01010413          	addi	s0,sp,16
    800096d0:	00005617          	auipc	a2,0x5
    800096d4:	88060613          	addi	a2,a2,-1920 # 8000df50 <uart_tx_r>
    800096d8:	00005517          	auipc	a0,0x5
    800096dc:	88050513          	addi	a0,a0,-1920 # 8000df58 <uart_tx_w>
    800096e0:	00063783          	ld	a5,0(a2)
    800096e4:	00053703          	ld	a4,0(a0)
    800096e8:	04f70263          	beq	a4,a5,8000972c <uartstart+0x68>
    800096ec:	100005b7          	lui	a1,0x10000
    800096f0:	00006817          	auipc	a6,0x6
    800096f4:	b5080813          	addi	a6,a6,-1200 # 8000f240 <uart_tx_buf>
    800096f8:	01c0006f          	j	80009714 <uartstart+0x50>
    800096fc:	0006c703          	lbu	a4,0(a3)
    80009700:	00f63023          	sd	a5,0(a2)
    80009704:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009708:	00063783          	ld	a5,0(a2)
    8000970c:	00053703          	ld	a4,0(a0)
    80009710:	00f70e63          	beq	a4,a5,8000972c <uartstart+0x68>
    80009714:	01f7f713          	andi	a4,a5,31
    80009718:	00e806b3          	add	a3,a6,a4
    8000971c:	0055c703          	lbu	a4,5(a1)
    80009720:	00178793          	addi	a5,a5,1
    80009724:	02077713          	andi	a4,a4,32
    80009728:	fc071ae3          	bnez	a4,800096fc <uartstart+0x38>
    8000972c:	00813403          	ld	s0,8(sp)
    80009730:	01010113          	addi	sp,sp,16
    80009734:	00008067          	ret

0000000080009738 <uartgetc>:
    80009738:	ff010113          	addi	sp,sp,-16
    8000973c:	00813423          	sd	s0,8(sp)
    80009740:	01010413          	addi	s0,sp,16
    80009744:	10000737          	lui	a4,0x10000
    80009748:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000974c:	0017f793          	andi	a5,a5,1
    80009750:	00078c63          	beqz	a5,80009768 <uartgetc+0x30>
    80009754:	00074503          	lbu	a0,0(a4)
    80009758:	0ff57513          	andi	a0,a0,255
    8000975c:	00813403          	ld	s0,8(sp)
    80009760:	01010113          	addi	sp,sp,16
    80009764:	00008067          	ret
    80009768:	fff00513          	li	a0,-1
    8000976c:	ff1ff06f          	j	8000975c <uartgetc+0x24>

0000000080009770 <uartintr>:
    80009770:	100007b7          	lui	a5,0x10000
    80009774:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80009778:	0017f793          	andi	a5,a5,1
    8000977c:	0a078463          	beqz	a5,80009824 <uartintr+0xb4>
    80009780:	fe010113          	addi	sp,sp,-32
    80009784:	00813823          	sd	s0,16(sp)
    80009788:	00913423          	sd	s1,8(sp)
    8000978c:	00113c23          	sd	ra,24(sp)
    80009790:	02010413          	addi	s0,sp,32
    80009794:	100004b7          	lui	s1,0x10000
    80009798:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000979c:	0ff57513          	andi	a0,a0,255
    800097a0:	fffff097          	auipc	ra,0xfffff
    800097a4:	534080e7          	jalr	1332(ra) # 80008cd4 <consoleintr>
    800097a8:	0054c783          	lbu	a5,5(s1)
    800097ac:	0017f793          	andi	a5,a5,1
    800097b0:	fe0794e3          	bnez	a5,80009798 <uartintr+0x28>
    800097b4:	00004617          	auipc	a2,0x4
    800097b8:	79c60613          	addi	a2,a2,1948 # 8000df50 <uart_tx_r>
    800097bc:	00004517          	auipc	a0,0x4
    800097c0:	79c50513          	addi	a0,a0,1948 # 8000df58 <uart_tx_w>
    800097c4:	00063783          	ld	a5,0(a2)
    800097c8:	00053703          	ld	a4,0(a0)
    800097cc:	04f70263          	beq	a4,a5,80009810 <uartintr+0xa0>
    800097d0:	100005b7          	lui	a1,0x10000
    800097d4:	00006817          	auipc	a6,0x6
    800097d8:	a6c80813          	addi	a6,a6,-1428 # 8000f240 <uart_tx_buf>
    800097dc:	01c0006f          	j	800097f8 <uartintr+0x88>
    800097e0:	0006c703          	lbu	a4,0(a3)
    800097e4:	00f63023          	sd	a5,0(a2)
    800097e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800097ec:	00063783          	ld	a5,0(a2)
    800097f0:	00053703          	ld	a4,0(a0)
    800097f4:	00f70e63          	beq	a4,a5,80009810 <uartintr+0xa0>
    800097f8:	01f7f713          	andi	a4,a5,31
    800097fc:	00e806b3          	add	a3,a6,a4
    80009800:	0055c703          	lbu	a4,5(a1)
    80009804:	00178793          	addi	a5,a5,1
    80009808:	02077713          	andi	a4,a4,32
    8000980c:	fc071ae3          	bnez	a4,800097e0 <uartintr+0x70>
    80009810:	01813083          	ld	ra,24(sp)
    80009814:	01013403          	ld	s0,16(sp)
    80009818:	00813483          	ld	s1,8(sp)
    8000981c:	02010113          	addi	sp,sp,32
    80009820:	00008067          	ret
    80009824:	00004617          	auipc	a2,0x4
    80009828:	72c60613          	addi	a2,a2,1836 # 8000df50 <uart_tx_r>
    8000982c:	00004517          	auipc	a0,0x4
    80009830:	72c50513          	addi	a0,a0,1836 # 8000df58 <uart_tx_w>
    80009834:	00063783          	ld	a5,0(a2)
    80009838:	00053703          	ld	a4,0(a0)
    8000983c:	04f70263          	beq	a4,a5,80009880 <uartintr+0x110>
    80009840:	100005b7          	lui	a1,0x10000
    80009844:	00006817          	auipc	a6,0x6
    80009848:	9fc80813          	addi	a6,a6,-1540 # 8000f240 <uart_tx_buf>
    8000984c:	01c0006f          	j	80009868 <uartintr+0xf8>
    80009850:	0006c703          	lbu	a4,0(a3)
    80009854:	00f63023          	sd	a5,0(a2)
    80009858:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000985c:	00063783          	ld	a5,0(a2)
    80009860:	00053703          	ld	a4,0(a0)
    80009864:	02f70063          	beq	a4,a5,80009884 <uartintr+0x114>
    80009868:	01f7f713          	andi	a4,a5,31
    8000986c:	00e806b3          	add	a3,a6,a4
    80009870:	0055c703          	lbu	a4,5(a1)
    80009874:	00178793          	addi	a5,a5,1
    80009878:	02077713          	andi	a4,a4,32
    8000987c:	fc071ae3          	bnez	a4,80009850 <uartintr+0xe0>
    80009880:	00008067          	ret
    80009884:	00008067          	ret

0000000080009888 <kinit>:
    80009888:	fc010113          	addi	sp,sp,-64
    8000988c:	02913423          	sd	s1,40(sp)
    80009890:	fffff7b7          	lui	a5,0xfffff
    80009894:	00007497          	auipc	s1,0x7
    80009898:	9cb48493          	addi	s1,s1,-1589 # 8001025f <end+0xfff>
    8000989c:	02813823          	sd	s0,48(sp)
    800098a0:	01313c23          	sd	s3,24(sp)
    800098a4:	00f4f4b3          	and	s1,s1,a5
    800098a8:	02113c23          	sd	ra,56(sp)
    800098ac:	03213023          	sd	s2,32(sp)
    800098b0:	01413823          	sd	s4,16(sp)
    800098b4:	01513423          	sd	s5,8(sp)
    800098b8:	04010413          	addi	s0,sp,64
    800098bc:	000017b7          	lui	a5,0x1
    800098c0:	01100993          	li	s3,17
    800098c4:	00f487b3          	add	a5,s1,a5
    800098c8:	01b99993          	slli	s3,s3,0x1b
    800098cc:	06f9e063          	bltu	s3,a5,8000992c <kinit+0xa4>
    800098d0:	00006a97          	auipc	s5,0x6
    800098d4:	990a8a93          	addi	s5,s5,-1648 # 8000f260 <end>
    800098d8:	0754ec63          	bltu	s1,s5,80009950 <kinit+0xc8>
    800098dc:	0734fa63          	bgeu	s1,s3,80009950 <kinit+0xc8>
    800098e0:	00088a37          	lui	s4,0x88
    800098e4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800098e8:	00004917          	auipc	s2,0x4
    800098ec:	67890913          	addi	s2,s2,1656 # 8000df60 <kmem>
    800098f0:	00ca1a13          	slli	s4,s4,0xc
    800098f4:	0140006f          	j	80009908 <kinit+0x80>
    800098f8:	000017b7          	lui	a5,0x1
    800098fc:	00f484b3          	add	s1,s1,a5
    80009900:	0554e863          	bltu	s1,s5,80009950 <kinit+0xc8>
    80009904:	0534f663          	bgeu	s1,s3,80009950 <kinit+0xc8>
    80009908:	00001637          	lui	a2,0x1
    8000990c:	00100593          	li	a1,1
    80009910:	00048513          	mv	a0,s1
    80009914:	00000097          	auipc	ra,0x0
    80009918:	5e4080e7          	jalr	1508(ra) # 80009ef8 <__memset>
    8000991c:	00093783          	ld	a5,0(s2)
    80009920:	00f4b023          	sd	a5,0(s1)
    80009924:	00993023          	sd	s1,0(s2)
    80009928:	fd4498e3          	bne	s1,s4,800098f8 <kinit+0x70>
    8000992c:	03813083          	ld	ra,56(sp)
    80009930:	03013403          	ld	s0,48(sp)
    80009934:	02813483          	ld	s1,40(sp)
    80009938:	02013903          	ld	s2,32(sp)
    8000993c:	01813983          	ld	s3,24(sp)
    80009940:	01013a03          	ld	s4,16(sp)
    80009944:	00813a83          	ld	s5,8(sp)
    80009948:	04010113          	addi	sp,sp,64
    8000994c:	00008067          	ret
    80009950:	00002517          	auipc	a0,0x2
    80009954:	16050513          	addi	a0,a0,352 # 8000bab0 <digits+0x18>
    80009958:	fffff097          	auipc	ra,0xfffff
    8000995c:	4b4080e7          	jalr	1204(ra) # 80008e0c <panic>

0000000080009960 <freerange>:
    80009960:	fc010113          	addi	sp,sp,-64
    80009964:	000017b7          	lui	a5,0x1
    80009968:	02913423          	sd	s1,40(sp)
    8000996c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80009970:	009504b3          	add	s1,a0,s1
    80009974:	fffff537          	lui	a0,0xfffff
    80009978:	02813823          	sd	s0,48(sp)
    8000997c:	02113c23          	sd	ra,56(sp)
    80009980:	03213023          	sd	s2,32(sp)
    80009984:	01313c23          	sd	s3,24(sp)
    80009988:	01413823          	sd	s4,16(sp)
    8000998c:	01513423          	sd	s5,8(sp)
    80009990:	01613023          	sd	s6,0(sp)
    80009994:	04010413          	addi	s0,sp,64
    80009998:	00a4f4b3          	and	s1,s1,a0
    8000999c:	00f487b3          	add	a5,s1,a5
    800099a0:	06f5e463          	bltu	a1,a5,80009a08 <freerange+0xa8>
    800099a4:	00006a97          	auipc	s5,0x6
    800099a8:	8bca8a93          	addi	s5,s5,-1860 # 8000f260 <end>
    800099ac:	0954e263          	bltu	s1,s5,80009a30 <freerange+0xd0>
    800099b0:	01100993          	li	s3,17
    800099b4:	01b99993          	slli	s3,s3,0x1b
    800099b8:	0734fc63          	bgeu	s1,s3,80009a30 <freerange+0xd0>
    800099bc:	00058a13          	mv	s4,a1
    800099c0:	00004917          	auipc	s2,0x4
    800099c4:	5a090913          	addi	s2,s2,1440 # 8000df60 <kmem>
    800099c8:	00002b37          	lui	s6,0x2
    800099cc:	0140006f          	j	800099e0 <freerange+0x80>
    800099d0:	000017b7          	lui	a5,0x1
    800099d4:	00f484b3          	add	s1,s1,a5
    800099d8:	0554ec63          	bltu	s1,s5,80009a30 <freerange+0xd0>
    800099dc:	0534fa63          	bgeu	s1,s3,80009a30 <freerange+0xd0>
    800099e0:	00001637          	lui	a2,0x1
    800099e4:	00100593          	li	a1,1
    800099e8:	00048513          	mv	a0,s1
    800099ec:	00000097          	auipc	ra,0x0
    800099f0:	50c080e7          	jalr	1292(ra) # 80009ef8 <__memset>
    800099f4:	00093703          	ld	a4,0(s2)
    800099f8:	016487b3          	add	a5,s1,s6
    800099fc:	00e4b023          	sd	a4,0(s1)
    80009a00:	00993023          	sd	s1,0(s2)
    80009a04:	fcfa76e3          	bgeu	s4,a5,800099d0 <freerange+0x70>
    80009a08:	03813083          	ld	ra,56(sp)
    80009a0c:	03013403          	ld	s0,48(sp)
    80009a10:	02813483          	ld	s1,40(sp)
    80009a14:	02013903          	ld	s2,32(sp)
    80009a18:	01813983          	ld	s3,24(sp)
    80009a1c:	01013a03          	ld	s4,16(sp)
    80009a20:	00813a83          	ld	s5,8(sp)
    80009a24:	00013b03          	ld	s6,0(sp)
    80009a28:	04010113          	addi	sp,sp,64
    80009a2c:	00008067          	ret
    80009a30:	00002517          	auipc	a0,0x2
    80009a34:	08050513          	addi	a0,a0,128 # 8000bab0 <digits+0x18>
    80009a38:	fffff097          	auipc	ra,0xfffff
    80009a3c:	3d4080e7          	jalr	980(ra) # 80008e0c <panic>

0000000080009a40 <kfree>:
    80009a40:	fe010113          	addi	sp,sp,-32
    80009a44:	00813823          	sd	s0,16(sp)
    80009a48:	00113c23          	sd	ra,24(sp)
    80009a4c:	00913423          	sd	s1,8(sp)
    80009a50:	02010413          	addi	s0,sp,32
    80009a54:	03451793          	slli	a5,a0,0x34
    80009a58:	04079c63          	bnez	a5,80009ab0 <kfree+0x70>
    80009a5c:	00006797          	auipc	a5,0x6
    80009a60:	80478793          	addi	a5,a5,-2044 # 8000f260 <end>
    80009a64:	00050493          	mv	s1,a0
    80009a68:	04f56463          	bltu	a0,a5,80009ab0 <kfree+0x70>
    80009a6c:	01100793          	li	a5,17
    80009a70:	01b79793          	slli	a5,a5,0x1b
    80009a74:	02f57e63          	bgeu	a0,a5,80009ab0 <kfree+0x70>
    80009a78:	00001637          	lui	a2,0x1
    80009a7c:	00100593          	li	a1,1
    80009a80:	00000097          	auipc	ra,0x0
    80009a84:	478080e7          	jalr	1144(ra) # 80009ef8 <__memset>
    80009a88:	00004797          	auipc	a5,0x4
    80009a8c:	4d878793          	addi	a5,a5,1240 # 8000df60 <kmem>
    80009a90:	0007b703          	ld	a4,0(a5)
    80009a94:	01813083          	ld	ra,24(sp)
    80009a98:	01013403          	ld	s0,16(sp)
    80009a9c:	00e4b023          	sd	a4,0(s1)
    80009aa0:	0097b023          	sd	s1,0(a5)
    80009aa4:	00813483          	ld	s1,8(sp)
    80009aa8:	02010113          	addi	sp,sp,32
    80009aac:	00008067          	ret
    80009ab0:	00002517          	auipc	a0,0x2
    80009ab4:	00050513          	mv	a0,a0
    80009ab8:	fffff097          	auipc	ra,0xfffff
    80009abc:	354080e7          	jalr	852(ra) # 80008e0c <panic>

0000000080009ac0 <kalloc>:
    80009ac0:	fe010113          	addi	sp,sp,-32
    80009ac4:	00813823          	sd	s0,16(sp)
    80009ac8:	00913423          	sd	s1,8(sp)
    80009acc:	00113c23          	sd	ra,24(sp)
    80009ad0:	02010413          	addi	s0,sp,32
    80009ad4:	00004797          	auipc	a5,0x4
    80009ad8:	48c78793          	addi	a5,a5,1164 # 8000df60 <kmem>
    80009adc:	0007b483          	ld	s1,0(a5)
    80009ae0:	02048063          	beqz	s1,80009b00 <kalloc+0x40>
    80009ae4:	0004b703          	ld	a4,0(s1)
    80009ae8:	00001637          	lui	a2,0x1
    80009aec:	00500593          	li	a1,5
    80009af0:	00048513          	mv	a0,s1
    80009af4:	00e7b023          	sd	a4,0(a5)
    80009af8:	00000097          	auipc	ra,0x0
    80009afc:	400080e7          	jalr	1024(ra) # 80009ef8 <__memset>
    80009b00:	01813083          	ld	ra,24(sp)
    80009b04:	01013403          	ld	s0,16(sp)
    80009b08:	00048513          	mv	a0,s1
    80009b0c:	00813483          	ld	s1,8(sp)
    80009b10:	02010113          	addi	sp,sp,32
    80009b14:	00008067          	ret

0000000080009b18 <initlock>:
    80009b18:	ff010113          	addi	sp,sp,-16
    80009b1c:	00813423          	sd	s0,8(sp)
    80009b20:	01010413          	addi	s0,sp,16
    80009b24:	00813403          	ld	s0,8(sp)
    80009b28:	00b53423          	sd	a1,8(a0) # 8000bab8 <digits+0x20>
    80009b2c:	00052023          	sw	zero,0(a0)
    80009b30:	00053823          	sd	zero,16(a0)
    80009b34:	01010113          	addi	sp,sp,16
    80009b38:	00008067          	ret

0000000080009b3c <acquire>:
    80009b3c:	fe010113          	addi	sp,sp,-32
    80009b40:	00813823          	sd	s0,16(sp)
    80009b44:	00913423          	sd	s1,8(sp)
    80009b48:	00113c23          	sd	ra,24(sp)
    80009b4c:	01213023          	sd	s2,0(sp)
    80009b50:	02010413          	addi	s0,sp,32
    80009b54:	00050493          	mv	s1,a0
    80009b58:	10002973          	csrr	s2,sstatus
    80009b5c:	100027f3          	csrr	a5,sstatus
    80009b60:	ffd7f793          	andi	a5,a5,-3
    80009b64:	10079073          	csrw	sstatus,a5
    80009b68:	fffff097          	auipc	ra,0xfffff
    80009b6c:	8e4080e7          	jalr	-1820(ra) # 8000844c <mycpu>
    80009b70:	07852783          	lw	a5,120(a0)
    80009b74:	06078e63          	beqz	a5,80009bf0 <acquire+0xb4>
    80009b78:	fffff097          	auipc	ra,0xfffff
    80009b7c:	8d4080e7          	jalr	-1836(ra) # 8000844c <mycpu>
    80009b80:	07852783          	lw	a5,120(a0)
    80009b84:	0004a703          	lw	a4,0(s1)
    80009b88:	0017879b          	addiw	a5,a5,1
    80009b8c:	06f52c23          	sw	a5,120(a0)
    80009b90:	04071063          	bnez	a4,80009bd0 <acquire+0x94>
    80009b94:	00100713          	li	a4,1
    80009b98:	00070793          	mv	a5,a4
    80009b9c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80009ba0:	0007879b          	sext.w	a5,a5
    80009ba4:	fe079ae3          	bnez	a5,80009b98 <acquire+0x5c>
    80009ba8:	0ff0000f          	fence
    80009bac:	fffff097          	auipc	ra,0xfffff
    80009bb0:	8a0080e7          	jalr	-1888(ra) # 8000844c <mycpu>
    80009bb4:	01813083          	ld	ra,24(sp)
    80009bb8:	01013403          	ld	s0,16(sp)
    80009bbc:	00a4b823          	sd	a0,16(s1)
    80009bc0:	00013903          	ld	s2,0(sp)
    80009bc4:	00813483          	ld	s1,8(sp)
    80009bc8:	02010113          	addi	sp,sp,32
    80009bcc:	00008067          	ret
    80009bd0:	0104b903          	ld	s2,16(s1)
    80009bd4:	fffff097          	auipc	ra,0xfffff
    80009bd8:	878080e7          	jalr	-1928(ra) # 8000844c <mycpu>
    80009bdc:	faa91ce3          	bne	s2,a0,80009b94 <acquire+0x58>
    80009be0:	00002517          	auipc	a0,0x2
    80009be4:	ed850513          	addi	a0,a0,-296 # 8000bab8 <digits+0x20>
    80009be8:	fffff097          	auipc	ra,0xfffff
    80009bec:	224080e7          	jalr	548(ra) # 80008e0c <panic>
    80009bf0:	00195913          	srli	s2,s2,0x1
    80009bf4:	fffff097          	auipc	ra,0xfffff
    80009bf8:	858080e7          	jalr	-1960(ra) # 8000844c <mycpu>
    80009bfc:	00197913          	andi	s2,s2,1
    80009c00:	07252e23          	sw	s2,124(a0)
    80009c04:	f75ff06f          	j	80009b78 <acquire+0x3c>

0000000080009c08 <release>:
    80009c08:	fe010113          	addi	sp,sp,-32
    80009c0c:	00813823          	sd	s0,16(sp)
    80009c10:	00113c23          	sd	ra,24(sp)
    80009c14:	00913423          	sd	s1,8(sp)
    80009c18:	01213023          	sd	s2,0(sp)
    80009c1c:	02010413          	addi	s0,sp,32
    80009c20:	00052783          	lw	a5,0(a0)
    80009c24:	00079a63          	bnez	a5,80009c38 <release+0x30>
    80009c28:	00002517          	auipc	a0,0x2
    80009c2c:	e9850513          	addi	a0,a0,-360 # 8000bac0 <digits+0x28>
    80009c30:	fffff097          	auipc	ra,0xfffff
    80009c34:	1dc080e7          	jalr	476(ra) # 80008e0c <panic>
    80009c38:	01053903          	ld	s2,16(a0)
    80009c3c:	00050493          	mv	s1,a0
    80009c40:	fffff097          	auipc	ra,0xfffff
    80009c44:	80c080e7          	jalr	-2036(ra) # 8000844c <mycpu>
    80009c48:	fea910e3          	bne	s2,a0,80009c28 <release+0x20>
    80009c4c:	0004b823          	sd	zero,16(s1)
    80009c50:	0ff0000f          	fence
    80009c54:	0f50000f          	fence	iorw,ow
    80009c58:	0804a02f          	amoswap.w	zero,zero,(s1)
    80009c5c:	ffffe097          	auipc	ra,0xffffe
    80009c60:	7f0080e7          	jalr	2032(ra) # 8000844c <mycpu>
    80009c64:	100027f3          	csrr	a5,sstatus
    80009c68:	0027f793          	andi	a5,a5,2
    80009c6c:	04079a63          	bnez	a5,80009cc0 <release+0xb8>
    80009c70:	07852783          	lw	a5,120(a0)
    80009c74:	02f05e63          	blez	a5,80009cb0 <release+0xa8>
    80009c78:	fff7871b          	addiw	a4,a5,-1
    80009c7c:	06e52c23          	sw	a4,120(a0)
    80009c80:	00071c63          	bnez	a4,80009c98 <release+0x90>
    80009c84:	07c52783          	lw	a5,124(a0)
    80009c88:	00078863          	beqz	a5,80009c98 <release+0x90>
    80009c8c:	100027f3          	csrr	a5,sstatus
    80009c90:	0027e793          	ori	a5,a5,2
    80009c94:	10079073          	csrw	sstatus,a5
    80009c98:	01813083          	ld	ra,24(sp)
    80009c9c:	01013403          	ld	s0,16(sp)
    80009ca0:	00813483          	ld	s1,8(sp)
    80009ca4:	00013903          	ld	s2,0(sp)
    80009ca8:	02010113          	addi	sp,sp,32
    80009cac:	00008067          	ret
    80009cb0:	00002517          	auipc	a0,0x2
    80009cb4:	e3050513          	addi	a0,a0,-464 # 8000bae0 <digits+0x48>
    80009cb8:	fffff097          	auipc	ra,0xfffff
    80009cbc:	154080e7          	jalr	340(ra) # 80008e0c <panic>
    80009cc0:	00002517          	auipc	a0,0x2
    80009cc4:	e0850513          	addi	a0,a0,-504 # 8000bac8 <digits+0x30>
    80009cc8:	fffff097          	auipc	ra,0xfffff
    80009ccc:	144080e7          	jalr	324(ra) # 80008e0c <panic>

0000000080009cd0 <holding>:
    80009cd0:	00052783          	lw	a5,0(a0)
    80009cd4:	00079663          	bnez	a5,80009ce0 <holding+0x10>
    80009cd8:	00000513          	li	a0,0
    80009cdc:	00008067          	ret
    80009ce0:	fe010113          	addi	sp,sp,-32
    80009ce4:	00813823          	sd	s0,16(sp)
    80009ce8:	00913423          	sd	s1,8(sp)
    80009cec:	00113c23          	sd	ra,24(sp)
    80009cf0:	02010413          	addi	s0,sp,32
    80009cf4:	01053483          	ld	s1,16(a0)
    80009cf8:	ffffe097          	auipc	ra,0xffffe
    80009cfc:	754080e7          	jalr	1876(ra) # 8000844c <mycpu>
    80009d00:	01813083          	ld	ra,24(sp)
    80009d04:	01013403          	ld	s0,16(sp)
    80009d08:	40a48533          	sub	a0,s1,a0
    80009d0c:	00153513          	seqz	a0,a0
    80009d10:	00813483          	ld	s1,8(sp)
    80009d14:	02010113          	addi	sp,sp,32
    80009d18:	00008067          	ret

0000000080009d1c <push_off>:
    80009d1c:	fe010113          	addi	sp,sp,-32
    80009d20:	00813823          	sd	s0,16(sp)
    80009d24:	00113c23          	sd	ra,24(sp)
    80009d28:	00913423          	sd	s1,8(sp)
    80009d2c:	02010413          	addi	s0,sp,32
    80009d30:	100024f3          	csrr	s1,sstatus
    80009d34:	100027f3          	csrr	a5,sstatus
    80009d38:	ffd7f793          	andi	a5,a5,-3
    80009d3c:	10079073          	csrw	sstatus,a5
    80009d40:	ffffe097          	auipc	ra,0xffffe
    80009d44:	70c080e7          	jalr	1804(ra) # 8000844c <mycpu>
    80009d48:	07852783          	lw	a5,120(a0)
    80009d4c:	02078663          	beqz	a5,80009d78 <push_off+0x5c>
    80009d50:	ffffe097          	auipc	ra,0xffffe
    80009d54:	6fc080e7          	jalr	1788(ra) # 8000844c <mycpu>
    80009d58:	07852783          	lw	a5,120(a0)
    80009d5c:	01813083          	ld	ra,24(sp)
    80009d60:	01013403          	ld	s0,16(sp)
    80009d64:	0017879b          	addiw	a5,a5,1
    80009d68:	06f52c23          	sw	a5,120(a0)
    80009d6c:	00813483          	ld	s1,8(sp)
    80009d70:	02010113          	addi	sp,sp,32
    80009d74:	00008067          	ret
    80009d78:	0014d493          	srli	s1,s1,0x1
    80009d7c:	ffffe097          	auipc	ra,0xffffe
    80009d80:	6d0080e7          	jalr	1744(ra) # 8000844c <mycpu>
    80009d84:	0014f493          	andi	s1,s1,1
    80009d88:	06952e23          	sw	s1,124(a0)
    80009d8c:	fc5ff06f          	j	80009d50 <push_off+0x34>

0000000080009d90 <pop_off>:
    80009d90:	ff010113          	addi	sp,sp,-16
    80009d94:	00813023          	sd	s0,0(sp)
    80009d98:	00113423          	sd	ra,8(sp)
    80009d9c:	01010413          	addi	s0,sp,16
    80009da0:	ffffe097          	auipc	ra,0xffffe
    80009da4:	6ac080e7          	jalr	1708(ra) # 8000844c <mycpu>
    80009da8:	100027f3          	csrr	a5,sstatus
    80009dac:	0027f793          	andi	a5,a5,2
    80009db0:	04079663          	bnez	a5,80009dfc <pop_off+0x6c>
    80009db4:	07852783          	lw	a5,120(a0)
    80009db8:	02f05a63          	blez	a5,80009dec <pop_off+0x5c>
    80009dbc:	fff7871b          	addiw	a4,a5,-1
    80009dc0:	06e52c23          	sw	a4,120(a0)
    80009dc4:	00071c63          	bnez	a4,80009ddc <pop_off+0x4c>
    80009dc8:	07c52783          	lw	a5,124(a0)
    80009dcc:	00078863          	beqz	a5,80009ddc <pop_off+0x4c>
    80009dd0:	100027f3          	csrr	a5,sstatus
    80009dd4:	0027e793          	ori	a5,a5,2
    80009dd8:	10079073          	csrw	sstatus,a5
    80009ddc:	00813083          	ld	ra,8(sp)
    80009de0:	00013403          	ld	s0,0(sp)
    80009de4:	01010113          	addi	sp,sp,16
    80009de8:	00008067          	ret
    80009dec:	00002517          	auipc	a0,0x2
    80009df0:	cf450513          	addi	a0,a0,-780 # 8000bae0 <digits+0x48>
    80009df4:	fffff097          	auipc	ra,0xfffff
    80009df8:	018080e7          	jalr	24(ra) # 80008e0c <panic>
    80009dfc:	00002517          	auipc	a0,0x2
    80009e00:	ccc50513          	addi	a0,a0,-820 # 8000bac8 <digits+0x30>
    80009e04:	fffff097          	auipc	ra,0xfffff
    80009e08:	008080e7          	jalr	8(ra) # 80008e0c <panic>

0000000080009e0c <push_on>:
    80009e0c:	fe010113          	addi	sp,sp,-32
    80009e10:	00813823          	sd	s0,16(sp)
    80009e14:	00113c23          	sd	ra,24(sp)
    80009e18:	00913423          	sd	s1,8(sp)
    80009e1c:	02010413          	addi	s0,sp,32
    80009e20:	100024f3          	csrr	s1,sstatus
    80009e24:	100027f3          	csrr	a5,sstatus
    80009e28:	0027e793          	ori	a5,a5,2
    80009e2c:	10079073          	csrw	sstatus,a5
    80009e30:	ffffe097          	auipc	ra,0xffffe
    80009e34:	61c080e7          	jalr	1564(ra) # 8000844c <mycpu>
    80009e38:	07852783          	lw	a5,120(a0)
    80009e3c:	02078663          	beqz	a5,80009e68 <push_on+0x5c>
    80009e40:	ffffe097          	auipc	ra,0xffffe
    80009e44:	60c080e7          	jalr	1548(ra) # 8000844c <mycpu>
    80009e48:	07852783          	lw	a5,120(a0)
    80009e4c:	01813083          	ld	ra,24(sp)
    80009e50:	01013403          	ld	s0,16(sp)
    80009e54:	0017879b          	addiw	a5,a5,1
    80009e58:	06f52c23          	sw	a5,120(a0)
    80009e5c:	00813483          	ld	s1,8(sp)
    80009e60:	02010113          	addi	sp,sp,32
    80009e64:	00008067          	ret
    80009e68:	0014d493          	srli	s1,s1,0x1
    80009e6c:	ffffe097          	auipc	ra,0xffffe
    80009e70:	5e0080e7          	jalr	1504(ra) # 8000844c <mycpu>
    80009e74:	0014f493          	andi	s1,s1,1
    80009e78:	06952e23          	sw	s1,124(a0)
    80009e7c:	fc5ff06f          	j	80009e40 <push_on+0x34>

0000000080009e80 <pop_on>:
    80009e80:	ff010113          	addi	sp,sp,-16
    80009e84:	00813023          	sd	s0,0(sp)
    80009e88:	00113423          	sd	ra,8(sp)
    80009e8c:	01010413          	addi	s0,sp,16
    80009e90:	ffffe097          	auipc	ra,0xffffe
    80009e94:	5bc080e7          	jalr	1468(ra) # 8000844c <mycpu>
    80009e98:	100027f3          	csrr	a5,sstatus
    80009e9c:	0027f793          	andi	a5,a5,2
    80009ea0:	04078463          	beqz	a5,80009ee8 <pop_on+0x68>
    80009ea4:	07852783          	lw	a5,120(a0)
    80009ea8:	02f05863          	blez	a5,80009ed8 <pop_on+0x58>
    80009eac:	fff7879b          	addiw	a5,a5,-1
    80009eb0:	06f52c23          	sw	a5,120(a0)
    80009eb4:	07853783          	ld	a5,120(a0)
    80009eb8:	00079863          	bnez	a5,80009ec8 <pop_on+0x48>
    80009ebc:	100027f3          	csrr	a5,sstatus
    80009ec0:	ffd7f793          	andi	a5,a5,-3
    80009ec4:	10079073          	csrw	sstatus,a5
    80009ec8:	00813083          	ld	ra,8(sp)
    80009ecc:	00013403          	ld	s0,0(sp)
    80009ed0:	01010113          	addi	sp,sp,16
    80009ed4:	00008067          	ret
    80009ed8:	00002517          	auipc	a0,0x2
    80009edc:	c3050513          	addi	a0,a0,-976 # 8000bb08 <digits+0x70>
    80009ee0:	fffff097          	auipc	ra,0xfffff
    80009ee4:	f2c080e7          	jalr	-212(ra) # 80008e0c <panic>
    80009ee8:	00002517          	auipc	a0,0x2
    80009eec:	c0050513          	addi	a0,a0,-1024 # 8000bae8 <digits+0x50>
    80009ef0:	fffff097          	auipc	ra,0xfffff
    80009ef4:	f1c080e7          	jalr	-228(ra) # 80008e0c <panic>

0000000080009ef8 <__memset>:
    80009ef8:	ff010113          	addi	sp,sp,-16
    80009efc:	00813423          	sd	s0,8(sp)
    80009f00:	01010413          	addi	s0,sp,16
    80009f04:	1a060e63          	beqz	a2,8000a0c0 <__memset+0x1c8>
    80009f08:	40a007b3          	neg	a5,a0
    80009f0c:	0077f793          	andi	a5,a5,7
    80009f10:	00778693          	addi	a3,a5,7
    80009f14:	00b00813          	li	a6,11
    80009f18:	0ff5f593          	andi	a1,a1,255
    80009f1c:	fff6071b          	addiw	a4,a2,-1
    80009f20:	1b06e663          	bltu	a3,a6,8000a0cc <__memset+0x1d4>
    80009f24:	1cd76463          	bltu	a4,a3,8000a0ec <__memset+0x1f4>
    80009f28:	1a078e63          	beqz	a5,8000a0e4 <__memset+0x1ec>
    80009f2c:	00b50023          	sb	a1,0(a0)
    80009f30:	00100713          	li	a4,1
    80009f34:	1ae78463          	beq	a5,a4,8000a0dc <__memset+0x1e4>
    80009f38:	00b500a3          	sb	a1,1(a0)
    80009f3c:	00200713          	li	a4,2
    80009f40:	1ae78a63          	beq	a5,a4,8000a0f4 <__memset+0x1fc>
    80009f44:	00b50123          	sb	a1,2(a0)
    80009f48:	00300713          	li	a4,3
    80009f4c:	18e78463          	beq	a5,a4,8000a0d4 <__memset+0x1dc>
    80009f50:	00b501a3          	sb	a1,3(a0)
    80009f54:	00400713          	li	a4,4
    80009f58:	1ae78263          	beq	a5,a4,8000a0fc <__memset+0x204>
    80009f5c:	00b50223          	sb	a1,4(a0)
    80009f60:	00500713          	li	a4,5
    80009f64:	1ae78063          	beq	a5,a4,8000a104 <__memset+0x20c>
    80009f68:	00b502a3          	sb	a1,5(a0)
    80009f6c:	00700713          	li	a4,7
    80009f70:	18e79e63          	bne	a5,a4,8000a10c <__memset+0x214>
    80009f74:	00b50323          	sb	a1,6(a0)
    80009f78:	00700e93          	li	t4,7
    80009f7c:	00859713          	slli	a4,a1,0x8
    80009f80:	00e5e733          	or	a4,a1,a4
    80009f84:	01059e13          	slli	t3,a1,0x10
    80009f88:	01c76e33          	or	t3,a4,t3
    80009f8c:	01859313          	slli	t1,a1,0x18
    80009f90:	006e6333          	or	t1,t3,t1
    80009f94:	02059893          	slli	a7,a1,0x20
    80009f98:	40f60e3b          	subw	t3,a2,a5
    80009f9c:	011368b3          	or	a7,t1,a7
    80009fa0:	02859813          	slli	a6,a1,0x28
    80009fa4:	0108e833          	or	a6,a7,a6
    80009fa8:	03059693          	slli	a3,a1,0x30
    80009fac:	003e589b          	srliw	a7,t3,0x3
    80009fb0:	00d866b3          	or	a3,a6,a3
    80009fb4:	03859713          	slli	a4,a1,0x38
    80009fb8:	00389813          	slli	a6,a7,0x3
    80009fbc:	00f507b3          	add	a5,a0,a5
    80009fc0:	00e6e733          	or	a4,a3,a4
    80009fc4:	000e089b          	sext.w	a7,t3
    80009fc8:	00f806b3          	add	a3,a6,a5
    80009fcc:	00e7b023          	sd	a4,0(a5)
    80009fd0:	00878793          	addi	a5,a5,8
    80009fd4:	fed79ce3          	bne	a5,a3,80009fcc <__memset+0xd4>
    80009fd8:	ff8e7793          	andi	a5,t3,-8
    80009fdc:	0007871b          	sext.w	a4,a5
    80009fe0:	01d787bb          	addw	a5,a5,t4
    80009fe4:	0ce88e63          	beq	a7,a4,8000a0c0 <__memset+0x1c8>
    80009fe8:	00f50733          	add	a4,a0,a5
    80009fec:	00b70023          	sb	a1,0(a4)
    80009ff0:	0017871b          	addiw	a4,a5,1
    80009ff4:	0cc77663          	bgeu	a4,a2,8000a0c0 <__memset+0x1c8>
    80009ff8:	00e50733          	add	a4,a0,a4
    80009ffc:	00b70023          	sb	a1,0(a4)
    8000a000:	0027871b          	addiw	a4,a5,2
    8000a004:	0ac77e63          	bgeu	a4,a2,8000a0c0 <__memset+0x1c8>
    8000a008:	00e50733          	add	a4,a0,a4
    8000a00c:	00b70023          	sb	a1,0(a4)
    8000a010:	0037871b          	addiw	a4,a5,3
    8000a014:	0ac77663          	bgeu	a4,a2,8000a0c0 <__memset+0x1c8>
    8000a018:	00e50733          	add	a4,a0,a4
    8000a01c:	00b70023          	sb	a1,0(a4)
    8000a020:	0047871b          	addiw	a4,a5,4
    8000a024:	08c77e63          	bgeu	a4,a2,8000a0c0 <__memset+0x1c8>
    8000a028:	00e50733          	add	a4,a0,a4
    8000a02c:	00b70023          	sb	a1,0(a4)
    8000a030:	0057871b          	addiw	a4,a5,5
    8000a034:	08c77663          	bgeu	a4,a2,8000a0c0 <__memset+0x1c8>
    8000a038:	00e50733          	add	a4,a0,a4
    8000a03c:	00b70023          	sb	a1,0(a4)
    8000a040:	0067871b          	addiw	a4,a5,6
    8000a044:	06c77e63          	bgeu	a4,a2,8000a0c0 <__memset+0x1c8>
    8000a048:	00e50733          	add	a4,a0,a4
    8000a04c:	00b70023          	sb	a1,0(a4)
    8000a050:	0077871b          	addiw	a4,a5,7
    8000a054:	06c77663          	bgeu	a4,a2,8000a0c0 <__memset+0x1c8>
    8000a058:	00e50733          	add	a4,a0,a4
    8000a05c:	00b70023          	sb	a1,0(a4)
    8000a060:	0087871b          	addiw	a4,a5,8
    8000a064:	04c77e63          	bgeu	a4,a2,8000a0c0 <__memset+0x1c8>
    8000a068:	00e50733          	add	a4,a0,a4
    8000a06c:	00b70023          	sb	a1,0(a4)
    8000a070:	0097871b          	addiw	a4,a5,9
    8000a074:	04c77663          	bgeu	a4,a2,8000a0c0 <__memset+0x1c8>
    8000a078:	00e50733          	add	a4,a0,a4
    8000a07c:	00b70023          	sb	a1,0(a4)
    8000a080:	00a7871b          	addiw	a4,a5,10
    8000a084:	02c77e63          	bgeu	a4,a2,8000a0c0 <__memset+0x1c8>
    8000a088:	00e50733          	add	a4,a0,a4
    8000a08c:	00b70023          	sb	a1,0(a4)
    8000a090:	00b7871b          	addiw	a4,a5,11
    8000a094:	02c77663          	bgeu	a4,a2,8000a0c0 <__memset+0x1c8>
    8000a098:	00e50733          	add	a4,a0,a4
    8000a09c:	00b70023          	sb	a1,0(a4)
    8000a0a0:	00c7871b          	addiw	a4,a5,12
    8000a0a4:	00c77e63          	bgeu	a4,a2,8000a0c0 <__memset+0x1c8>
    8000a0a8:	00e50733          	add	a4,a0,a4
    8000a0ac:	00b70023          	sb	a1,0(a4)
    8000a0b0:	00d7879b          	addiw	a5,a5,13
    8000a0b4:	00c7f663          	bgeu	a5,a2,8000a0c0 <__memset+0x1c8>
    8000a0b8:	00f507b3          	add	a5,a0,a5
    8000a0bc:	00b78023          	sb	a1,0(a5)
    8000a0c0:	00813403          	ld	s0,8(sp)
    8000a0c4:	01010113          	addi	sp,sp,16
    8000a0c8:	00008067          	ret
    8000a0cc:	00b00693          	li	a3,11
    8000a0d0:	e55ff06f          	j	80009f24 <__memset+0x2c>
    8000a0d4:	00300e93          	li	t4,3
    8000a0d8:	ea5ff06f          	j	80009f7c <__memset+0x84>
    8000a0dc:	00100e93          	li	t4,1
    8000a0e0:	e9dff06f          	j	80009f7c <__memset+0x84>
    8000a0e4:	00000e93          	li	t4,0
    8000a0e8:	e95ff06f          	j	80009f7c <__memset+0x84>
    8000a0ec:	00000793          	li	a5,0
    8000a0f0:	ef9ff06f          	j	80009fe8 <__memset+0xf0>
    8000a0f4:	00200e93          	li	t4,2
    8000a0f8:	e85ff06f          	j	80009f7c <__memset+0x84>
    8000a0fc:	00400e93          	li	t4,4
    8000a100:	e7dff06f          	j	80009f7c <__memset+0x84>
    8000a104:	00500e93          	li	t4,5
    8000a108:	e75ff06f          	j	80009f7c <__memset+0x84>
    8000a10c:	00600e93          	li	t4,6
    8000a110:	e6dff06f          	j	80009f7c <__memset+0x84>

000000008000a114 <__memmove>:
    8000a114:	ff010113          	addi	sp,sp,-16
    8000a118:	00813423          	sd	s0,8(sp)
    8000a11c:	01010413          	addi	s0,sp,16
    8000a120:	0e060863          	beqz	a2,8000a210 <__memmove+0xfc>
    8000a124:	fff6069b          	addiw	a3,a2,-1
    8000a128:	0006881b          	sext.w	a6,a3
    8000a12c:	0ea5e863          	bltu	a1,a0,8000a21c <__memmove+0x108>
    8000a130:	00758713          	addi	a4,a1,7
    8000a134:	00a5e7b3          	or	a5,a1,a0
    8000a138:	40a70733          	sub	a4,a4,a0
    8000a13c:	0077f793          	andi	a5,a5,7
    8000a140:	00f73713          	sltiu	a4,a4,15
    8000a144:	00174713          	xori	a4,a4,1
    8000a148:	0017b793          	seqz	a5,a5
    8000a14c:	00e7f7b3          	and	a5,a5,a4
    8000a150:	10078863          	beqz	a5,8000a260 <__memmove+0x14c>
    8000a154:	00900793          	li	a5,9
    8000a158:	1107f463          	bgeu	a5,a6,8000a260 <__memmove+0x14c>
    8000a15c:	0036581b          	srliw	a6,a2,0x3
    8000a160:	fff8081b          	addiw	a6,a6,-1
    8000a164:	02081813          	slli	a6,a6,0x20
    8000a168:	01d85893          	srli	a7,a6,0x1d
    8000a16c:	00858813          	addi	a6,a1,8
    8000a170:	00058793          	mv	a5,a1
    8000a174:	00050713          	mv	a4,a0
    8000a178:	01088833          	add	a6,a7,a6
    8000a17c:	0007b883          	ld	a7,0(a5)
    8000a180:	00878793          	addi	a5,a5,8
    8000a184:	00870713          	addi	a4,a4,8
    8000a188:	ff173c23          	sd	a7,-8(a4)
    8000a18c:	ff0798e3          	bne	a5,a6,8000a17c <__memmove+0x68>
    8000a190:	ff867713          	andi	a4,a2,-8
    8000a194:	02071793          	slli	a5,a4,0x20
    8000a198:	0207d793          	srli	a5,a5,0x20
    8000a19c:	00f585b3          	add	a1,a1,a5
    8000a1a0:	40e686bb          	subw	a3,a3,a4
    8000a1a4:	00f507b3          	add	a5,a0,a5
    8000a1a8:	06e60463          	beq	a2,a4,8000a210 <__memmove+0xfc>
    8000a1ac:	0005c703          	lbu	a4,0(a1)
    8000a1b0:	00e78023          	sb	a4,0(a5)
    8000a1b4:	04068e63          	beqz	a3,8000a210 <__memmove+0xfc>
    8000a1b8:	0015c603          	lbu	a2,1(a1)
    8000a1bc:	00100713          	li	a4,1
    8000a1c0:	00c780a3          	sb	a2,1(a5)
    8000a1c4:	04e68663          	beq	a3,a4,8000a210 <__memmove+0xfc>
    8000a1c8:	0025c603          	lbu	a2,2(a1)
    8000a1cc:	00200713          	li	a4,2
    8000a1d0:	00c78123          	sb	a2,2(a5)
    8000a1d4:	02e68e63          	beq	a3,a4,8000a210 <__memmove+0xfc>
    8000a1d8:	0035c603          	lbu	a2,3(a1)
    8000a1dc:	00300713          	li	a4,3
    8000a1e0:	00c781a3          	sb	a2,3(a5)
    8000a1e4:	02e68663          	beq	a3,a4,8000a210 <__memmove+0xfc>
    8000a1e8:	0045c603          	lbu	a2,4(a1)
    8000a1ec:	00400713          	li	a4,4
    8000a1f0:	00c78223          	sb	a2,4(a5)
    8000a1f4:	00e68e63          	beq	a3,a4,8000a210 <__memmove+0xfc>
    8000a1f8:	0055c603          	lbu	a2,5(a1)
    8000a1fc:	00500713          	li	a4,5
    8000a200:	00c782a3          	sb	a2,5(a5)
    8000a204:	00e68663          	beq	a3,a4,8000a210 <__memmove+0xfc>
    8000a208:	0065c703          	lbu	a4,6(a1)
    8000a20c:	00e78323          	sb	a4,6(a5)
    8000a210:	00813403          	ld	s0,8(sp)
    8000a214:	01010113          	addi	sp,sp,16
    8000a218:	00008067          	ret
    8000a21c:	02061713          	slli	a4,a2,0x20
    8000a220:	02075713          	srli	a4,a4,0x20
    8000a224:	00e587b3          	add	a5,a1,a4
    8000a228:	f0f574e3          	bgeu	a0,a5,8000a130 <__memmove+0x1c>
    8000a22c:	02069613          	slli	a2,a3,0x20
    8000a230:	02065613          	srli	a2,a2,0x20
    8000a234:	fff64613          	not	a2,a2
    8000a238:	00e50733          	add	a4,a0,a4
    8000a23c:	00c78633          	add	a2,a5,a2
    8000a240:	fff7c683          	lbu	a3,-1(a5)
    8000a244:	fff78793          	addi	a5,a5,-1
    8000a248:	fff70713          	addi	a4,a4,-1
    8000a24c:	00d70023          	sb	a3,0(a4)
    8000a250:	fec798e3          	bne	a5,a2,8000a240 <__memmove+0x12c>
    8000a254:	00813403          	ld	s0,8(sp)
    8000a258:	01010113          	addi	sp,sp,16
    8000a25c:	00008067          	ret
    8000a260:	02069713          	slli	a4,a3,0x20
    8000a264:	02075713          	srli	a4,a4,0x20
    8000a268:	00170713          	addi	a4,a4,1
    8000a26c:	00e50733          	add	a4,a0,a4
    8000a270:	00050793          	mv	a5,a0
    8000a274:	0005c683          	lbu	a3,0(a1)
    8000a278:	00178793          	addi	a5,a5,1
    8000a27c:	00158593          	addi	a1,a1,1
    8000a280:	fed78fa3          	sb	a3,-1(a5)
    8000a284:	fee798e3          	bne	a5,a4,8000a274 <__memmove+0x160>
    8000a288:	f89ff06f          	j	8000a210 <__memmove+0xfc>
	...
