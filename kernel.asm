
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
    8000001c:	244080ef          	jal	ra,80008260 <start>

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
    8000107c:	010030ef          	jal	ra,8000408c <exceptionHandler>


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
    80001704:	eac080e7          	jalr	-340(ra) # 800035ac <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    80001708:	0004b503          	ld	a0,0(s1)
    8000170c:	00003097          	auipc	ra,0x3
    80001710:	09c080e7          	jalr	156(ra) # 800047a8 <_ZN9Scheduler3putEP7_thread>
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
    800017c0:	df0080e7          	jalr	-528(ra) # 800035ac <_ZN7_thread11setSleepingEb>
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
    80001b28:	a5c080e7          	jalr	-1444(ra) # 80003580 <_ZN7_thread9setClosedEb>
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
    80001bd4:	980080e7          	jalr	-1664(ra) # 80003550 <_ZN7_thread10setBlockedEb>
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
    80001c48:	90c080e7          	jalr	-1780(ra) # 80003550 <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    80001c4c:	00048513          	mv	a0,s1
    80001c50:	00000097          	auipc	ra,0x0
    80001c54:	c10080e7          	jalr	-1008(ra) # 80001860 <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    80001c58:	0004b503          	ld	a0,0(s1)
    80001c5c:	00003097          	auipc	ra,0x3
    80001c60:	b4c080e7          	jalr	-1204(ra) # 800047a8 <_ZN9Scheduler3putEP7_thread>
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
    80002014:	774080e7          	jalr	1908(ra) # 80003784 <_ZN11HeapManagerD1Ev>
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
    80002778:	fa8080e7          	jalr	-88(ra) # 8000371c <_ZN11HeapManagerC1Ev>
    8000277c:	00848513          	addi	a0,s1,8
    80002780:	00002097          	auipc	ra,0x2
    80002784:	f90080e7          	jalr	-112(ra) # 80004710 <_ZN9SchedulerC1Ev>
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
    800027c4:	fc4080e7          	jalr	-60(ra) # 80003784 <_ZN11HeapManagerD1Ev>
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
    80002830:	f70080e7          	jalr	-144(ra) # 8000379c <_ZN11HeapManager4initEmm>
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
    80002868:	d20080e7          	jalr	-736(ra) # 80007584 <_Z8userMainv>
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
    800028a4:	0f8080e7          	jalr	248(ra) # 80004998 <_ZN9Scheduler3getEv>
    800028a8:	0000b797          	auipc	a5,0xb
    800028ac:	6807b783          	ld	a5,1664(a5) # 8000df28 <_GLOBAL_OFFSET_TABLE_+0x50>
    800028b0:	00a7b023          	sd	a0,0(a5)
    
    /// change to user mode
    __asm__ volatile ("li a0, 0xff");
    800028b4:	0ff00513          	li	a0,255
    __asm__ volatile ("ecall");
    800028b8:	00000073          	ecall
    /// NOW WE ARE IN USER MODE


    thread_t userThread;
    // thread_create(&userThread, test, 0);
    thread_create(&userThread, usermain, 0);
    800028bc:	00000613          	li	a2,0
    800028c0:	0000b597          	auipc	a1,0xb
    800028c4:	6385b583          	ld	a1,1592(a1) # 8000def8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800028c8:	fe040513          	addi	a0,s0,-32
    800028cc:	fffff097          	auipc	ra,0xfffff
    800028d0:	fc0080e7          	jalr	-64(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    //     Console::outputHandler();
    // }
    do{
        // putc('K');
        // putc('K');
        Console::outputHandler();
    800028d4:	00000097          	auipc	ra,0x0
    800028d8:	d40080e7          	jalr	-704(ra) # 80002614 <_ZN7Console13outputHandlerEv>
        thread_dispatch();
    800028dc:	fffff097          	auipc	ra,0xfffff
    800028e0:	04c080e7          	jalr	76(ra) # 80001928 <_Z15thread_dispatchv>
        // putc('K');
    }while(!(Scheduler::isEmpty() && Timer::getInstance().noSleepingThreads()));
    800028e4:	00002097          	auipc	ra,0x2
    800028e8:	e9c080e7          	jalr	-356(ra) # 80004780 <_ZN9Scheduler7isEmptyEv>
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
    // time_sleep(30);
    putc('1');
    80002940:	03100513          	li	a0,49
    80002944:	fffff097          	auipc	ra,0xfffff
    80002948:	138080e7          	jalr	312(ra) # 80001a7c <_Z4putcc>
    sem_signal(sem1);
    8000294c:	0000b517          	auipc	a0,0xb
    80002950:	63453503          	ld	a0,1588(a0) # 8000df80 <sem1>
    80002954:	fffff097          	auipc	ra,0xfffff
    80002958:	0d4080e7          	jalr	212(ra) # 80001a28 <_Z10sem_signalP4_sem>
    putc('S');
    8000295c:	05300513          	li	a0,83
    80002960:	fffff097          	auipc	ra,0xfffff
    80002964:	11c080e7          	jalr	284(ra) # 80001a7c <_Z4putcc>
}
    80002968:	00813083          	ld	ra,8(sp)
    8000296c:	00013403          	ld	s0,0(sp)
    80002970:	01010113          	addi	sp,sp,16
    80002974:	00008067          	ret

0000000080002978 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80002978:	ff010113          	addi	sp,sp,-16
    8000297c:	00113423          	sd	ra,8(sp)
    80002980:	00813023          	sd	s0,0(sp)
    80002984:	01010413          	addi	s0,sp,16
    putc('2');
    80002988:	03200513          	li	a0,50
    8000298c:	fffff097          	auipc	ra,0xfffff
    80002990:	0f0080e7          	jalr	240(ra) # 80001a7c <_Z4putcc>
    putc('s');
    80002994:	07300513          	li	a0,115
    80002998:	fffff097          	auipc	ra,0xfffff
    8000299c:	0e4080e7          	jalr	228(ra) # 80001a7c <_Z4putcc>
    // time_sleep(60);
    putc('2');
    800029a0:	03200513          	li	a0,50
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	0d8080e7          	jalr	216(ra) # 80001a7c <_Z4putcc>
    putc('S');
    800029ac:	05300513          	li	a0,83
    800029b0:	fffff097          	auipc	ra,0xfffff
    800029b4:	0cc080e7          	jalr	204(ra) # 80001a7c <_Z4putcc>
    sem_signal(sem2);
    800029b8:	0000b517          	auipc	a0,0xb
    800029bc:	5d053503          	ld	a0,1488(a0) # 8000df88 <sem2>
    800029c0:	fffff097          	auipc	ra,0xfffff
    800029c4:	068080e7          	jalr	104(ra) # 80001a28 <_Z10sem_signalP4_sem>
}
    800029c8:	00813083          	ld	ra,8(sp)
    800029cc:	00013403          	ld	s0,0(sp)
    800029d0:	01010113          	addi	sp,sp,16
    800029d4:	00008067          	ret

00000000800029d8 <_Z7memTestv>:

void memTest(){
    800029d8:	fd010113          	addi	sp,sp,-48
    800029dc:	02113423          	sd	ra,40(sp)
    800029e0:	02813023          	sd	s0,32(sp)
    800029e4:	00913c23          	sd	s1,24(sp)
    800029e8:	01213823          	sd	s2,16(sp)
    800029ec:	01313423          	sd	s3,8(sp)
    800029f0:	01413023          	sd	s4,0(sp)
    800029f4:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    800029f8:	0000b797          	auipc	a5,0xb
    800029fc:	5107b783          	ld	a5,1296(a5) # 8000df08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002a00:	0007b503          	ld	a0,0(a5)
    80002a04:	00001097          	auipc	ra,0x1
    80002a08:	ebc080e7          	jalr	-324(ra) # 800038c0 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002a0c:	00050993          	mv	s3,a0
    putc('F');
    80002a10:	04600513          	li	a0,70
    80002a14:	fffff097          	auipc	ra,0xfffff
    80002a18:	068080e7          	jalr	104(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002a1c:	07200513          	li	a0,114
    80002a20:	fffff097          	auipc	ra,0xfffff
    80002a24:	05c080e7          	jalr	92(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002a28:	06500513          	li	a0,101
    80002a2c:	fffff097          	auipc	ra,0xfffff
    80002a30:	050080e7          	jalr	80(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002a34:	06500513          	li	a0,101
    80002a38:	fffff097          	auipc	ra,0xfffff
    80002a3c:	044080e7          	jalr	68(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    80002a40:	02000513          	li	a0,32
    80002a44:	fffff097          	auipc	ra,0xfffff
    80002a48:	038080e7          	jalr	56(ra) # 80001a7c <_Z4putcc>
    putc('m');
    80002a4c:	06d00513          	li	a0,109
    80002a50:	fffff097          	auipc	ra,0xfffff
    80002a54:	02c080e7          	jalr	44(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002a58:	06500513          	li	a0,101
    80002a5c:	fffff097          	auipc	ra,0xfffff
    80002a60:	020080e7          	jalr	32(ra) # 80001a7c <_Z4putcc>
    putc('m');
    80002a64:	06d00513          	li	a0,109
    80002a68:	fffff097          	auipc	ra,0xfffff
    80002a6c:	014080e7          	jalr	20(ra) # 80001a7c <_Z4putcc>
    putc('o');
    80002a70:	06f00513          	li	a0,111
    80002a74:	fffff097          	auipc	ra,0xfffff
    80002a78:	008080e7          	jalr	8(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002a7c:	07200513          	li	a0,114
    80002a80:	fffff097          	auipc	ra,0xfffff
    80002a84:	ffc080e7          	jalr	-4(ra) # 80001a7c <_Z4putcc>
    putc('y');
    80002a88:	07900513          	li	a0,121
    80002a8c:	fffff097          	auipc	ra,0xfffff
    80002a90:	ff0080e7          	jalr	-16(ra) # 80001a7c <_Z4putcc>
    putc(':');
    80002a94:	03a00513          	li	a0,58
    80002a98:	fffff097          	auipc	ra,0xfffff
    80002a9c:	fe4080e7          	jalr	-28(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002aa0:	00f00493          	li	s1,15
    80002aa4:	0140006f          	j	80002ab8 <_Z7memTestv+0xe0>
        int digit = (freeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002aa8:	05750513          	addi	a0,a0,87
    80002aac:	fffff097          	auipc	ra,0xfffff
    80002ab0:	fd0080e7          	jalr	-48(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002ab4:	fff4849b          	addiw	s1,s1,-1
    80002ab8:	0204c463          	bltz	s1,80002ae0 <_Z7memTestv+0x108>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    80002abc:	0024951b          	slliw	a0,s1,0x2
    80002ac0:	00a9d533          	srl	a0,s3,a0
    80002ac4:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002ac8:	00900793          	li	a5,9
    80002acc:	fca7cee3          	blt	a5,a0,80002aa8 <_Z7memTestv+0xd0>
            putc('0' + digit);
    80002ad0:	03050513          	addi	a0,a0,48
    80002ad4:	fffff097          	auipc	ra,0xfffff
    80002ad8:	fa8080e7          	jalr	-88(ra) # 80001a7c <_Z4putcc>
    80002adc:	fd9ff06f          	j	80002ab4 <_Z7memTestv+0xdc>
        }
    }
    putc('\n');
    80002ae0:	00a00513          	li	a0,10
    80002ae4:	fffff097          	auipc	ra,0xfffff
    80002ae8:	f98080e7          	jalr	-104(ra) # 80001a7c <_Z4putcc>
    int n = 100;
    int k = 100;
    int** matrix = (int**)mem_alloc(sizeof(int*) * n);
    80002aec:	32000513          	li	a0,800
    80002af0:	fffff097          	auipc	ra,0xfffff
    80002af4:	d40080e7          	jalr	-704(ra) # 80001830 <_Z9mem_allocm>
    80002af8:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    80002afc:	00000493          	li	s1,0
    80002b00:	0080006f          	j	80002b08 <_Z7memTestv+0x130>
    80002b04:	0014849b          	addiw	s1,s1,1
    80002b08:	06300793          	li	a5,99
    80002b0c:	0497c663          	blt	a5,s1,80002b58 <_Z7memTestv+0x180>
        matrix[i] = (int*)mem_alloc(sizeof(int) * k);
    80002b10:	00349a13          	slli	s4,s1,0x3
    80002b14:	01490a33          	add	s4,s2,s4
    80002b18:	19000513          	li	a0,400
    80002b1c:	fffff097          	auipc	ra,0xfffff
    80002b20:	d14080e7          	jalr	-748(ra) # 80001830 <_Z9mem_allocm>
    80002b24:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    80002b28:	00000713          	li	a4,0
    80002b2c:	06300793          	li	a5,99
    80002b30:	fce7cae3          	blt	a5,a4,80002b04 <_Z7memTestv+0x12c>
            matrix[i][j] = i * k + j;
    80002b34:	06400793          	li	a5,100
    80002b38:	029787bb          	mulw	a5,a5,s1
    80002b3c:	000a3683          	ld	a3,0(s4)
    80002b40:	00271613          	slli	a2,a4,0x2
    80002b44:	00c686b3          	add	a3,a3,a2
    80002b48:	00e787bb          	addw	a5,a5,a4
    80002b4c:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80002b50:	0017071b          	addiw	a4,a4,1
    80002b54:	fd9ff06f          	j	80002b2c <_Z7memTestv+0x154>
        }
    }
    for(int i = 0; i < n; i++){
    80002b58:	00000a13          	li	s4,0
    80002b5c:	0780006f          	j	80002bd4 <_Z7memTestv+0x1fc>
        for(int j = 0; j < k; j++){
    80002b60:	0014849b          	addiw	s1,s1,1
    80002b64:	06300793          	li	a5,99
    80002b68:	0497ca63          	blt	a5,s1,80002bbc <_Z7memTestv+0x1e4>
            assert(matrix[i][j] == i * k + j);
    80002b6c:	003a1793          	slli	a5,s4,0x3
    80002b70:	00f907b3          	add	a5,s2,a5
    80002b74:	0007b783          	ld	a5,0(a5)
    80002b78:	00249713          	slli	a4,s1,0x2
    80002b7c:	00e787b3          	add	a5,a5,a4
    80002b80:	0007a703          	lw	a4,0(a5)
    80002b84:	06400793          	li	a5,100
    80002b88:	034787bb          	mulw	a5,a5,s4
    80002b8c:	009787bb          	addw	a5,a5,s1
    80002b90:	fcf708e3          	beq	a4,a5,80002b60 <_Z7memTestv+0x188>
    80002b94:	00008697          	auipc	a3,0x8
    80002b98:	58c68693          	addi	a3,a3,1420 # 8000b120 <CONSOLE_STATUS+0x110>
    80002b9c:	04100613          	li	a2,65
    80002ba0:	00008597          	auipc	a1,0x8
    80002ba4:	59058593          	addi	a1,a1,1424 # 8000b130 <CONSOLE_STATUS+0x120>
    80002ba8:	00008517          	auipc	a0,0x8
    80002bac:	5a050513          	addi	a0,a0,1440 # 8000b148 <CONSOLE_STATUS+0x138>
    80002bb0:	fffff097          	auipc	ra,0xfffff
    80002bb4:	47c080e7          	jalr	1148(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80002bb8:	fa9ff06f          	j	80002b60 <_Z7memTestv+0x188>
        }
        mem_free(matrix[i]);
    80002bbc:	003a1793          	slli	a5,s4,0x3
    80002bc0:	00f907b3          	add	a5,s2,a5
    80002bc4:	0007b503          	ld	a0,0(a5)
    80002bc8:	fffff097          	auipc	ra,0xfffff
    80002bcc:	c98080e7          	jalr	-872(ra) # 80001860 <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    80002bd0:	001a0a1b          	addiw	s4,s4,1
    80002bd4:	06300793          	li	a5,99
    80002bd8:	0147c663          	blt	a5,s4,80002be4 <_Z7memTestv+0x20c>
        for(int j = 0; j < k; j++){
    80002bdc:	00000493          	li	s1,0
    80002be0:	f85ff06f          	j	80002b64 <_Z7memTestv+0x18c>
    }
    mem_free(matrix);
    80002be4:	00090513          	mv	a0,s2
    80002be8:	fffff097          	auipc	ra,0xfffff
    80002bec:	c78080e7          	jalr	-904(ra) # 80001860 <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002bf0:	0000b797          	auipc	a5,0xb
    80002bf4:	3187b783          	ld	a5,792(a5) # 8000df08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002bf8:	0007b503          	ld	a0,0(a5)
    80002bfc:	00001097          	auipc	ra,0x1
    80002c00:	cc4080e7          	jalr	-828(ra) # 800038c0 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002c04:	00050493          	mv	s1,a0
    putc('F');
    80002c08:	04600513          	li	a0,70
    80002c0c:	fffff097          	auipc	ra,0xfffff
    80002c10:	e70080e7          	jalr	-400(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002c14:	07200513          	li	a0,114
    80002c18:	fffff097          	auipc	ra,0xfffff
    80002c1c:	e64080e7          	jalr	-412(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002c20:	06500513          	li	a0,101
    80002c24:	fffff097          	auipc	ra,0xfffff
    80002c28:	e58080e7          	jalr	-424(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002c2c:	06500513          	li	a0,101
    80002c30:	fffff097          	auipc	ra,0xfffff
    80002c34:	e4c080e7          	jalr	-436(ra) # 80001a7c <_Z4putcc>
    putc(' ');
    80002c38:	02000513          	li	a0,32
    80002c3c:	fffff097          	auipc	ra,0xfffff
    80002c40:	e40080e7          	jalr	-448(ra) # 80001a7c <_Z4putcc>
    putc('m');
    80002c44:	06d00513          	li	a0,109
    80002c48:	fffff097          	auipc	ra,0xfffff
    80002c4c:	e34080e7          	jalr	-460(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002c50:	06500513          	li	a0,101
    80002c54:	fffff097          	auipc	ra,0xfffff
    80002c58:	e28080e7          	jalr	-472(ra) # 80001a7c <_Z4putcc>
    putc('m');
    80002c5c:	06d00513          	li	a0,109
    80002c60:	fffff097          	auipc	ra,0xfffff
    80002c64:	e1c080e7          	jalr	-484(ra) # 80001a7c <_Z4putcc>
    putc('o');
    80002c68:	06f00513          	li	a0,111
    80002c6c:	fffff097          	auipc	ra,0xfffff
    80002c70:	e10080e7          	jalr	-496(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002c74:	07200513          	li	a0,114
    80002c78:	fffff097          	auipc	ra,0xfffff
    80002c7c:	e04080e7          	jalr	-508(ra) # 80001a7c <_Z4putcc>
    putc('y');
    80002c80:	07900513          	li	a0,121
    80002c84:	fffff097          	auipc	ra,0xfffff
    80002c88:	df8080e7          	jalr	-520(ra) # 80001a7c <_Z4putcc>
    putc(':');
    80002c8c:	03a00513          	li	a0,58
    80002c90:	fffff097          	auipc	ra,0xfffff
    80002c94:	dec080e7          	jalr	-532(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002c98:	00f00913          	li	s2,15
    80002c9c:	0140006f          	j	80002cb0 <_Z7memTestv+0x2d8>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002ca0:	05750513          	addi	a0,a0,87
    80002ca4:	fffff097          	auipc	ra,0xfffff
    80002ca8:	dd8080e7          	jalr	-552(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002cac:	fff9091b          	addiw	s2,s2,-1
    80002cb0:	02094463          	bltz	s2,80002cd8 <_Z7memTestv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    80002cb4:	0029151b          	slliw	a0,s2,0x2
    80002cb8:	00a4d533          	srl	a0,s1,a0
    80002cbc:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002cc0:	00900793          	li	a5,9
    80002cc4:	fca7cee3          	blt	a5,a0,80002ca0 <_Z7memTestv+0x2c8>
            putc('0' + digit);
    80002cc8:	03050513          	addi	a0,a0,48
    80002ccc:	fffff097          	auipc	ra,0xfffff
    80002cd0:	db0080e7          	jalr	-592(ra) # 80001a7c <_Z4putcc>
    80002cd4:	fd9ff06f          	j	80002cac <_Z7memTestv+0x2d4>
        }
    }
    putc('\n');
    80002cd8:	00a00513          	li	a0,10
    80002cdc:	fffff097          	auipc	ra,0xfffff
    80002ce0:	da0080e7          	jalr	-608(ra) # 80001a7c <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    80002ce4:	409989b3          	sub	s3,s3,s1
    putc('D');
    80002ce8:	04400513          	li	a0,68
    80002cec:	fffff097          	auipc	ra,0xfffff
    80002cf0:	d90080e7          	jalr	-624(ra) # 80001a7c <_Z4putcc>
    putc('i');
    80002cf4:	06900513          	li	a0,105
    80002cf8:	fffff097          	auipc	ra,0xfffff
    80002cfc:	d84080e7          	jalr	-636(ra) # 80001a7c <_Z4putcc>
    putc('f');
    80002d00:	06600513          	li	a0,102
    80002d04:	fffff097          	auipc	ra,0xfffff
    80002d08:	d78080e7          	jalr	-648(ra) # 80001a7c <_Z4putcc>
    putc('f');
    80002d0c:	06600513          	li	a0,102
    80002d10:	fffff097          	auipc	ra,0xfffff
    80002d14:	d6c080e7          	jalr	-660(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002d18:	06500513          	li	a0,101
    80002d1c:	fffff097          	auipc	ra,0xfffff
    80002d20:	d60080e7          	jalr	-672(ra) # 80001a7c <_Z4putcc>
    putc('r');
    80002d24:	07200513          	li	a0,114
    80002d28:	fffff097          	auipc	ra,0xfffff
    80002d2c:	d54080e7          	jalr	-684(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002d30:	06500513          	li	a0,101
    80002d34:	fffff097          	auipc	ra,0xfffff
    80002d38:	d48080e7          	jalr	-696(ra) # 80001a7c <_Z4putcc>
    putc('n');
    80002d3c:	06e00513          	li	a0,110
    80002d40:	fffff097          	auipc	ra,0xfffff
    80002d44:	d3c080e7          	jalr	-708(ra) # 80001a7c <_Z4putcc>
    putc('c');
    80002d48:	06300513          	li	a0,99
    80002d4c:	fffff097          	auipc	ra,0xfffff
    80002d50:	d30080e7          	jalr	-720(ra) # 80001a7c <_Z4putcc>
    putc('e');
    80002d54:	06500513          	li	a0,101
    80002d58:	fffff097          	auipc	ra,0xfffff
    80002d5c:	d24080e7          	jalr	-732(ra) # 80001a7c <_Z4putcc>
    putc(':');
    80002d60:	03a00513          	li	a0,58
    80002d64:	fffff097          	auipc	ra,0xfffff
    80002d68:	d18080e7          	jalr	-744(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002d6c:	00f00493          	li	s1,15
    80002d70:	0140006f          	j	80002d84 <_Z7memTestv+0x3ac>
        int digit = (difference >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002d74:	05750513          	addi	a0,a0,87
    80002d78:	fffff097          	auipc	ra,0xfffff
    80002d7c:	d04080e7          	jalr	-764(ra) # 80001a7c <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002d80:	fff4849b          	addiw	s1,s1,-1
    80002d84:	0204c463          	bltz	s1,80002dac <_Z7memTestv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    80002d88:	0024951b          	slliw	a0,s1,0x2
    80002d8c:	00a9d533          	srl	a0,s3,a0
    80002d90:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002d94:	00900793          	li	a5,9
    80002d98:	fca7cee3          	blt	a5,a0,80002d74 <_Z7memTestv+0x39c>
            putc('0' + digit);
    80002d9c:	03050513          	addi	a0,a0,48
    80002da0:	fffff097          	auipc	ra,0xfffff
    80002da4:	cdc080e7          	jalr	-804(ra) # 80001a7c <_Z4putcc>
    80002da8:	fd9ff06f          	j	80002d80 <_Z7memTestv+0x3a8>
        }
    }
    putc('\n');
    80002dac:	00a00513          	li	a0,10
    80002db0:	fffff097          	auipc	ra,0xfffff
    80002db4:	ccc080e7          	jalr	-820(ra) # 80001a7c <_Z4putcc>
    putc('\n');
    80002db8:	00a00513          	li	a0,10
    80002dbc:	fffff097          	auipc	ra,0xfffff
    80002dc0:	cc0080e7          	jalr	-832(ra) # 80001a7c <_Z4putcc>
    putc('\n');
    80002dc4:	00a00513          	li	a0,10
    80002dc8:	fffff097          	auipc	ra,0xfffff
    80002dcc:	cb4080e7          	jalr	-844(ra) # 80001a7c <_Z4putcc>
}
    80002dd0:	02813083          	ld	ra,40(sp)
    80002dd4:	02013403          	ld	s0,32(sp)
    80002dd8:	01813483          	ld	s1,24(sp)
    80002ddc:	01013903          	ld	s2,16(sp)
    80002de0:	00813983          	ld	s3,8(sp)
    80002de4:	00013a03          	ld	s4,0(sp)
    80002de8:	03010113          	addi	sp,sp,48
    80002dec:	00008067          	ret

0000000080002df0 <_Z8usermainPv>:

void usermain(void* arg){
    80002df0:	fd010113          	addi	sp,sp,-48
    80002df4:	02113423          	sd	ra,40(sp)
    80002df8:	02813023          	sd	s0,32(sp)
    80002dfc:	00913c23          	sd	s1,24(sp)
    80002e00:	03010413          	addi	s0,sp,48
    memTest();    
    80002e04:	00000097          	auipc	ra,0x0
    80002e08:	bd4080e7          	jalr	-1068(ra) # 800029d8 <_Z7memTestv>
    putc('0');
    80002e0c:	03000513          	li	a0,48
    80002e10:	fffff097          	auipc	ra,0xfffff
    80002e14:	c6c080e7          	jalr	-916(ra) # 80001a7c <_Z4putcc>
    thread_t t1, t2;
    sem_open(&sem1, 0);
    80002e18:	0000b497          	auipc	s1,0xb
    80002e1c:	16848493          	addi	s1,s1,360 # 8000df80 <sem1>
    80002e20:	00000593          	li	a1,0
    80002e24:	00048513          	mv	a0,s1
    80002e28:	fffff097          	auipc	ra,0xfffff
    80002e2c:	b70080e7          	jalr	-1168(ra) # 80001998 <_Z8sem_openPP4_semj>
    sem_open(&sem2, 0);
    80002e30:	00000593          	li	a1,0
    80002e34:	0000b517          	auipc	a0,0xb
    80002e38:	15450513          	addi	a0,a0,340 # 8000df88 <sem2>
    80002e3c:	fffff097          	auipc	ra,0xfffff
    80002e40:	b5c080e7          	jalr	-1188(ra) # 80001998 <_Z8sem_openPP4_semj>
    thread_create(&t1, thread_test_1, 0);
    80002e44:	00000613          	li	a2,0
    80002e48:	00000597          	auipc	a1,0x0
    80002e4c:	ad058593          	addi	a1,a1,-1328 # 80002918 <_Z13thread_test_1Pv>
    80002e50:	fd840513          	addi	a0,s0,-40
    80002e54:	fffff097          	auipc	ra,0xfffff
    80002e58:	a38080e7          	jalr	-1480(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002e5c:	00000613          	li	a2,0
    80002e60:	00000597          	auipc	a1,0x0
    80002e64:	b1858593          	addi	a1,a1,-1256 # 80002978 <_Z13thread_test_2Pv>
    80002e68:	fd040513          	addi	a0,s0,-48
    80002e6c:	fffff097          	auipc	ra,0xfffff
    80002e70:	a20080e7          	jalr	-1504(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    sem_wait(sem1);
    80002e74:	0004b503          	ld	a0,0(s1)
    80002e78:	fffff097          	auipc	ra,0xfffff
    80002e7c:	b84080e7          	jalr	-1148(ra) # 800019fc <_Z8sem_waitP4_sem>
    putc('3');
    80002e80:	03300513          	li	a0,51
    80002e84:	fffff097          	auipc	ra,0xfffff
    80002e88:	bf8080e7          	jalr	-1032(ra) # 80001a7c <_Z4putcc>
    // thread_join(t2);
    // if(getc() == 'a')putc('x');
    putc('4');
    80002e8c:	03400513          	li	a0,52
    80002e90:	fffff097          	auipc	ra,0xfffff
    80002e94:	bec080e7          	jalr	-1044(ra) # 80001a7c <_Z4putcc>
    // thread_join(t1);
    sem_wait(sem2);
    80002e98:	0084b503          	ld	a0,8(s1)
    80002e9c:	fffff097          	auipc	ra,0xfffff
    80002ea0:	b60080e7          	jalr	-1184(ra) # 800019fc <_Z8sem_waitP4_sem>
    putc('5');
    80002ea4:	03500513          	li	a0,53
    80002ea8:	fffff097          	auipc	ra,0xfffff
    80002eac:	bd4080e7          	jalr	-1068(ra) # 80001a7c <_Z4putcc>
    // sem_close(sem1);
    // sem_close(sem2);


    putc('\n');
    80002eb0:	00a00513          	li	a0,10
    80002eb4:	fffff097          	auipc	ra,0xfffff
    80002eb8:	bc8080e7          	jalr	-1080(ra) # 80001a7c <_Z4putcc>
    80002ebc:	02813083          	ld	ra,40(sp)
    80002ec0:	02013403          	ld	s0,32(sp)
    80002ec4:	01813483          	ld	s1,24(sp)
    80002ec8:	03010113          	addi	sp,sp,48
    80002ecc:	00008067          	ret

0000000080002ed0 <_ZN7_threadC1EPFvPvES0_>:
#include "syscall_c.h"
#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    80002ed0:	ff010113          	addi	sp,sp,-16
    80002ed4:	00813423          	sd	s0,8(sp)
    80002ed8:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80002edc:	00053023          	sd	zero,0(a0)
    80002ee0:	00053423          	sd	zero,8(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80002ee4:	0000b717          	auipc	a4,0xb
    80002ee8:	0ac70713          	addi	a4,a4,172 # 8000df90 <_ZN7_thread6nextIDE>
    80002eec:	00072783          	lw	a5,0(a4)
    80002ef0:	0017869b          	addiw	a3,a5,1
    80002ef4:	00d72023          	sw	a3,0(a4)
    80002ef8:	08f52c23          	sw	a5,152(a0)
    closed = 0;
    80002efc:	09c52783          	lw	a5,156(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002f00:	0015b593          	seqz	a1,a1
    80002f04:	0045959b          	slliw	a1,a1,0x4
    80002f08:	fe07f793          	andi	a5,a5,-32
    80002f0c:	00b7e7b3          	or	a5,a5,a1
    80002f10:	08f52e23          	sw	a5,156(a0)
    reserved = 0;
    80002f14:	0a052783          	lw	a5,160(a0)
    80002f18:	f0000737          	lui	a4,0xf0000
    80002f1c:	00e7f7b3          	and	a5,a5,a4
    80002f20:	0af52023          	sw	a5,160(a0)
    joinHead = 0;
    80002f24:	06053c23          	sd	zero,120(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    80002f28:	00200793          	li	a5,2
    80002f2c:	08f53423          	sd	a5,136(a0)
    stackStart = 0;
    80002f30:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    80002f34:	00053823          	sd	zero,16(a0)
    context.s1 = 0;
    80002f38:	00053c23          	sd	zero,24(a0)
    context.s2 = 0;
    80002f3c:	02053023          	sd	zero,32(a0)
    context.s3 = 0;
    80002f40:	02053423          	sd	zero,40(a0)
    context.s4 = 0;
    80002f44:	02053823          	sd	zero,48(a0)
    context.s5 = 0;
    80002f48:	02053c23          	sd	zero,56(a0)
    context.s6 = 0;
    80002f4c:	04053023          	sd	zero,64(a0)
    context.s7 = 0;
    80002f50:	04053423          	sd	zero,72(a0)
    context.s8 = 0;
    80002f54:	04053823          	sd	zero,80(a0)
    context.s9 = 0;
    80002f58:	04053c23          	sd	zero,88(a0)
    context.s10 = 0;
    80002f5c:	06053023          	sd	zero,96(a0)
    context.s11 = 0;
    80002f60:	06053423          	sd	zero,104(a0)

    context.sstatus = 0;
    80002f64:	06053823          	sd	zero,112(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002f68:	00000797          	auipc	a5,0x0
    80002f6c:	57c78793          	addi	a5,a5,1404 # 800034e4 <_ZN7_thread7wrapperEv>
    80002f70:	00f53023          	sd	a5,0(a0)
}
    80002f74:	00813403          	ld	s0,8(sp)
    80002f78:	01010113          	addi	sp,sp,16
    80002f7c:	00008067          	ret

0000000080002f80 <_Z10popSppSpieb>:

void popSppSpie(bool kernel = false){
    80002f80:	ff010113          	addi	sp,sp,-16
    80002f84:	00813423          	sd	s0,8(sp)
    80002f88:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002f8c:	14109073          	csrw	sepc,ra
    if(kernel){
    80002f90:	00050e63          	beqz	a0,80002fac <_Z10popSppSpieb+0x2c>
        __asm__ volatile ("csrs sstatus, %0" :: "r" (1 << 8));
    80002f94:	10000793          	li	a5,256
    80002f98:	1007a073          	csrs	sstatus,a5
    }else{
    __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    }
    __asm__ volatile ("sret");
    80002f9c:	10200073          	sret
}
    80002fa0:	00813403          	ld	s0,8(sp)
    80002fa4:	01010113          	addi	sp,sp,16
    80002fa8:	00008067          	ret
    __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    80002fac:	10000793          	li	a5,256
    80002fb0:	1007b073          	csrc	sstatus,a5
    80002fb4:	fe9ff06f          	j	80002f9c <_Z10popSppSpieb+0x1c>

0000000080002fb8 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002fb8:	fe010113          	addi	sp,sp,-32
    80002fbc:	00113c23          	sd	ra,24(sp)
    80002fc0:	00813823          	sd	s0,16(sp)
    80002fc4:	00913423          	sd	s1,8(sp)
    80002fc8:	01213023          	sd	s2,0(sp)
    80002fcc:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80002fd0:	07853483          	ld	s1,120(a0)
    while(current != 0){
    80002fd4:	0c048e63          	beqz	s1,800030b0 <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    80002fd8:	0004c503          	lbu	a0,0(s1)
    80002fdc:	0014c783          	lbu	a5,1(s1)
    80002fe0:	00879793          	slli	a5,a5,0x8
    80002fe4:	00a7e7b3          	or	a5,a5,a0
    80002fe8:	0024c503          	lbu	a0,2(s1)
    80002fec:	01051513          	slli	a0,a0,0x10
    80002ff0:	00f567b3          	or	a5,a0,a5
    80002ff4:	0034c503          	lbu	a0,3(s1)
    80002ff8:	01851513          	slli	a0,a0,0x18
    80002ffc:	00f56533          	or	a0,a0,a5
    80003000:	0044c783          	lbu	a5,4(s1)
    80003004:	02079793          	slli	a5,a5,0x20
    80003008:	00a7e533          	or	a0,a5,a0
    8000300c:	0054c783          	lbu	a5,5(s1)
    80003010:	02879793          	slli	a5,a5,0x28
    80003014:	00a7e7b3          	or	a5,a5,a0
    80003018:	0064c503          	lbu	a0,6(s1)
    8000301c:	03051513          	slli	a0,a0,0x30
    80003020:	00f567b3          	or	a5,a0,a5
    80003024:	0074c503          	lbu	a0,7(s1)
    80003028:	03851513          	slli	a0,a0,0x38
    8000302c:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80003030:	09c52783          	lw	a5,156(a0)
    80003034:	ffd7f793          	andi	a5,a5,-3
    80003038:	08f52e23          	sw	a5,156(a0)
        Scheduler::put(thread);
    8000303c:	00001097          	auipc	ra,0x1
    80003040:	76c080e7          	jalr	1900(ra) # 800047a8 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80003044:	0084c903          	lbu	s2,8(s1)
    80003048:	0094c783          	lbu	a5,9(s1)
    8000304c:	00879793          	slli	a5,a5,0x8
    80003050:	0127e7b3          	or	a5,a5,s2
    80003054:	00a4c903          	lbu	s2,10(s1)
    80003058:	01091913          	slli	s2,s2,0x10
    8000305c:	00f967b3          	or	a5,s2,a5
    80003060:	00b4c903          	lbu	s2,11(s1)
    80003064:	01891913          	slli	s2,s2,0x18
    80003068:	00f96933          	or	s2,s2,a5
    8000306c:	00c4c783          	lbu	a5,12(s1)
    80003070:	02079793          	slli	a5,a5,0x20
    80003074:	0127e933          	or	s2,a5,s2
    80003078:	00d4c783          	lbu	a5,13(s1)
    8000307c:	02879793          	slli	a5,a5,0x28
    80003080:	0127e7b3          	or	a5,a5,s2
    80003084:	00e4c903          	lbu	s2,14(s1)
    80003088:	03091913          	slli	s2,s2,0x30
    8000308c:	00f967b3          	or	a5,s2,a5
    80003090:	00f4c903          	lbu	s2,15(s1)
    80003094:	03891913          	slli	s2,s2,0x38
    80003098:	00f96933          	or	s2,s2,a5
        mem_free(current);
    8000309c:	00048513          	mv	a0,s1
    800030a0:	ffffe097          	auipc	ra,0xffffe
    800030a4:	7c0080e7          	jalr	1984(ra) # 80001860 <_Z8mem_freePv>
        current = next;
    800030a8:	00090493          	mv	s1,s2
    while(current != 0){
    800030ac:	f29ff06f          	j	80002fd4 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    800030b0:	01813083          	ld	ra,24(sp)
    800030b4:	01013403          	ld	s0,16(sp)
    800030b8:	00813483          	ld	s1,8(sp)
    800030bc:	00013903          	ld	s2,0(sp)
    800030c0:	02010113          	addi	sp,sp,32
    800030c4:	00008067          	ret

00000000800030c8 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    800030c8:	fc010113          	addi	sp,sp,-64
    800030cc:	02113c23          	sd	ra,56(sp)
    800030d0:	02813823          	sd	s0,48(sp)
    800030d4:	02913423          	sd	s1,40(sp)
    800030d8:	03213023          	sd	s2,32(sp)
    800030dc:	01313c23          	sd	s3,24(sp)
    800030e0:	01413823          	sd	s4,16(sp)
    800030e4:	01513423          	sd	s5,8(sp)
    800030e8:	04010413          	addi	s0,sp,64
    800030ec:	00050493          	mv	s1,a0
    800030f0:	00058913          	mv	s2,a1
    800030f4:	00060a93          	mv	s5,a2
    800030f8:	00068993          	mv	s3,a3
    800030fc:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    80003100:	0b800513          	li	a0,184
    80003104:	ffffe097          	auipc	ra,0xffffe
    80003108:	72c080e7          	jalr	1836(ra) # 80001830 <_Z9mem_allocm>
    8000310c:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80003110:	18050063          	beqz	a0,80003290 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    80003114:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    80003118:	0004b783          	ld	a5,0(s1)
    8000311c:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80003120:	0000b717          	auipc	a4,0xb
    80003124:	e7070713          	addi	a4,a4,-400 # 8000df90 <_ZN7_thread6nextIDE>
    80003128:	00072783          	lw	a5,0(a4)
    8000312c:	0017869b          	addiw	a3,a5,1
    80003130:	00d72023          	sw	a3,0(a4)
    80003134:	0004b703          	ld	a4,0(s1)
    80003138:	08f72c23          	sw	a5,152(a4)
    (*thread)->closed = false;
    8000313c:	0004b703          	ld	a4,0(s1)
    80003140:	09c72783          	lw	a5,156(a4)
    80003144:	ffe7f793          	andi	a5,a5,-2
    80003148:	08f72e23          	sw	a5,156(a4)
    (*thread)->blocked = false;
    8000314c:	0004b703          	ld	a4,0(s1)
    80003150:	09c72783          	lw	a5,156(a4)
    80003154:	ffd7f793          	andi	a5,a5,-3
    80003158:	08f72e23          	sw	a5,156(a4)
    (*thread)->sleeping = false;
    8000315c:	0004b703          	ld	a4,0(s1)
    80003160:	09c72783          	lw	a5,156(a4)
    80003164:	ffb7f793          	andi	a5,a5,-5
    80003168:	08f72e23          	sw	a5,156(a4)
    (*thread)->finished = false;
    8000316c:	0004b703          	ld	a4,0(s1)
    80003170:	09c72783          	lw	a5,156(a4)
    80003174:	ff77f793          	andi	a5,a5,-9
    80003178:	08f72e23          	sw	a5,156(a4)
    (*thread)->kernel = (function == 0);
    8000317c:	0004b703          	ld	a4,0(s1)
    80003180:	00193913          	seqz	s2,s2
    80003184:	0049191b          	slliw	s2,s2,0x4
    80003188:	09c72783          	lw	a5,156(a4)
    8000318c:	fef7f793          	andi	a5,a5,-17
    80003190:	0127e933          	or	s2,a5,s2
    80003194:	09272e23          	sw	s2,156(a4)
    (*thread)->reserved = 0;
    80003198:	0004b703          	ld	a4,0(s1)
    8000319c:	0a072783          	lw	a5,160(a4)
    800031a0:	f00006b7          	lui	a3,0xf0000
    800031a4:	00d7f7b3          	and	a5,a5,a3
    800031a8:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = 0;
    800031ac:	0004b783          	ld	a5,0(s1)
    800031b0:	0607bc23          	sd	zero,120(a5)
    (*thread)->joinTail = 0;
    800031b4:	0004b783          	ld	a5,0(s1)
    800031b8:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    800031bc:	0004b783          	ld	a5,0(s1)
    800031c0:	00200713          	li	a4,2
    800031c4:	08e7b423          	sd	a4,136(a5)
    (*thread)->stackStart = 0;
    800031c8:	0004b783          	ld	a5,0(s1)
    800031cc:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    800031d0:	0004b783          	ld	a5,0(s1)
    800031d4:	0007b823          	sd	zero,16(a5)
    (*thread)->context.s1 = 0;
    800031d8:	0004b783          	ld	a5,0(s1)
    800031dc:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s2 = 0;
    800031e0:	0004b783          	ld	a5,0(s1)
    800031e4:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s3 = 0;
    800031e8:	0004b783          	ld	a5,0(s1)
    800031ec:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s4 = 0;
    800031f0:	0004b783          	ld	a5,0(s1)
    800031f4:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s5 = 0;
    800031f8:	0004b783          	ld	a5,0(s1)
    800031fc:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s6 = 0;
    80003200:	0004b783          	ld	a5,0(s1)
    80003204:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s7 = 0;
    80003208:	0004b783          	ld	a5,0(s1)
    8000320c:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s8 = 0;
    80003210:	0004b783          	ld	a5,0(s1)
    80003214:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s9 = 0;
    80003218:	0004b783          	ld	a5,0(s1)
    8000321c:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s10 = 0;
    80003220:	0004b783          	ld	a5,0(s1)
    80003224:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s11 = 0;
    80003228:	0004b783          	ld	a5,0(s1)
    8000322c:	0607b423          	sd	zero,104(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80003230:	0004b783          	ld	a5,0(s1)
    80003234:	0137b423          	sd	s3,8(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    80003238:	0004b783          	ld	a5,0(s1)
    8000323c:	00000717          	auipc	a4,0x0
    80003240:	2a870713          	addi	a4,a4,680 # 800034e4 <_ZN7_thread7wrapperEv>
    80003244:	00e7b023          	sd	a4,0(a5)

    (*thread)->stackStart = stack;
    80003248:	0004b783          	ld	a5,0(s1)
    8000324c:	0937b823          	sd	s3,144(a5)
    if(start){
    80003250:	020a1663          	bnez	s4,8000327c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    80003254:	00000513          	li	a0,0
}
    80003258:	03813083          	ld	ra,56(sp)
    8000325c:	03013403          	ld	s0,48(sp)
    80003260:	02813483          	ld	s1,40(sp)
    80003264:	02013903          	ld	s2,32(sp)
    80003268:	01813983          	ld	s3,24(sp)
    8000326c:	01013a03          	ld	s4,16(sp)
    80003270:	00813a83          	ld	s5,8(sp)
    80003274:	04010113          	addi	sp,sp,64
    80003278:	00008067          	ret
        Scheduler::put(*thread);
    8000327c:	0004b503          	ld	a0,0(s1)
    80003280:	00001097          	auipc	ra,0x1
    80003284:	528080e7          	jalr	1320(ra) # 800047a8 <_ZN9Scheduler3putEP7_thread>
    return 0;
    80003288:	00000513          	li	a0,0
    8000328c:	fcdff06f          	j	80003258 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    80003290:	fff00513          	li	a0,-1
    80003294:	fc5ff06f          	j	80003258 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

0000000080003298 <_ZN7_thread4joinEPS_>:

void _thread::join(thread_t thread){
    /// cannot join to a finished or closed thread
    if(thread->finished || thread->closed){
    80003298:	0985b783          	ld	a5,152(a1)
    8000329c:	00900713          	li	a4,9
    800032a0:	02071713          	slli	a4,a4,0x20
    800032a4:	00e7f7b3          	and	a5,a5,a4
    800032a8:	00078463          	beqz	a5,800032b0 <_ZN7_thread4joinEPS_+0x18>
    800032ac:	00008067          	ret
void _thread::join(thread_t thread){
    800032b0:	fe010113          	addi	sp,sp,-32
    800032b4:	00113c23          	sd	ra,24(sp)
    800032b8:	00813823          	sd	s0,16(sp)
    800032bc:	00913423          	sd	s1,8(sp)
    800032c0:	01213023          	sd	s2,0(sp)
    800032c4:	02010413          	addi	s0,sp,32
    800032c8:	00050493          	mv	s1,a0
    800032cc:	00058913          	mv	s2,a1
        return;
    }
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    800032d0:	01000513          	li	a0,16
    800032d4:	ffffe097          	auipc	ra,0xffffe
    800032d8:	55c080e7          	jalr	1372(ra) # 80001830 <_Z9mem_allocm>
    this->blocked = true;
    800032dc:	09c4a703          	lw	a4,156(s1)
    800032e0:	00276713          	ori	a4,a4,2
    800032e4:	08e4ae23          	sw	a4,156(s1)
    newJoin->thread = this;
    800032e8:	00950023          	sb	s1,0(a0)
    800032ec:	0084d713          	srli	a4,s1,0x8
    800032f0:	00e500a3          	sb	a4,1(a0)
    800032f4:	0104d713          	srli	a4,s1,0x10
    800032f8:	00e50123          	sb	a4,2(a0)
    800032fc:	0184d71b          	srliw	a4,s1,0x18
    80003300:	00e501a3          	sb	a4,3(a0)
    80003304:	0204d713          	srli	a4,s1,0x20
    80003308:	00e50223          	sb	a4,4(a0)
    8000330c:	0284d713          	srli	a4,s1,0x28
    80003310:	00e502a3          	sb	a4,5(a0)
    80003314:	0304d713          	srli	a4,s1,0x30
    80003318:	00e50323          	sb	a4,6(a0)
    8000331c:	0384d493          	srli	s1,s1,0x38
    80003320:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80003324:	00050423          	sb	zero,8(a0)
    80003328:	000504a3          	sb	zero,9(a0)
    8000332c:	00050523          	sb	zero,10(a0)
    80003330:	000505a3          	sb	zero,11(a0)
    80003334:	00050623          	sb	zero,12(a0)
    80003338:	000506a3          	sb	zero,13(a0)
    8000333c:	00050723          	sb	zero,14(a0)
    80003340:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    80003344:	07893703          	ld	a4,120(s2)
    80003348:	06070463          	beqz	a4,800033b0 <_ZN7_thread4joinEPS_+0x118>
        thread->joinHead = newJoin;
        thread->joinTail = newJoin;
    }else{
        thread->joinTail->next = newJoin;
    8000334c:	08093703          	ld	a4,128(s2)
    80003350:	00a70423          	sb	a0,8(a4)
    80003354:	00855693          	srli	a3,a0,0x8
    80003358:	00d704a3          	sb	a3,9(a4)
    8000335c:	01055693          	srli	a3,a0,0x10
    80003360:	00d70523          	sb	a3,10(a4)
    80003364:	0185569b          	srliw	a3,a0,0x18
    80003368:	00d705a3          	sb	a3,11(a4)
    8000336c:	02055693          	srli	a3,a0,0x20
    80003370:	00d70623          	sb	a3,12(a4)
    80003374:	02855693          	srli	a3,a0,0x28
    80003378:	00d706a3          	sb	a3,13(a4)
    8000337c:	03055693          	srli	a3,a0,0x30
    80003380:	00d70723          	sb	a3,14(a4)
    80003384:	03855693          	srli	a3,a0,0x38
    80003388:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    8000338c:	08a93023          	sd	a0,128(s2)
    }
    thread_dispatch();
    80003390:	ffffe097          	auipc	ra,0xffffe
    80003394:	598080e7          	jalr	1432(ra) # 80001928 <_Z15thread_dispatchv>
}
    80003398:	01813083          	ld	ra,24(sp)
    8000339c:	01013403          	ld	s0,16(sp)
    800033a0:	00813483          	ld	s1,8(sp)
    800033a4:	00013903          	ld	s2,0(sp)
    800033a8:	02010113          	addi	sp,sp,32
    800033ac:	00008067          	ret
        thread->joinHead = newJoin;
    800033b0:	06a93c23          	sd	a0,120(s2)
        thread->joinTail = newJoin;
    800033b4:	08a93023          	sd	a0,128(s2)
    800033b8:	fd9ff06f          	j	80003390 <_ZN7_thread4joinEPS_+0xf8>

00000000800033bc <_ZN7_thread4tickEv>:

int _thread::tick(){
    800033bc:	fe010113          	addi	sp,sp,-32
    800033c0:	00113c23          	sd	ra,24(sp)
    800033c4:	00813823          	sd	s0,16(sp)
    800033c8:	00913423          	sd	s1,8(sp)
    800033cc:	02010413          	addi	s0,sp,32
    800033d0:	00050493          	mv	s1,a0
    putc('T');
    800033d4:	05400513          	li	a0,84
    800033d8:	ffffe097          	auipc	ra,0xffffe
    800033dc:	6a4080e7          	jalr	1700(ra) # 80001a7c <_Z4putcc>
    if(currentThread->blocked){
    800033e0:	0000b797          	auipc	a5,0xb
    800033e4:	bb87b783          	ld	a5,-1096(a5) # 8000df98 <_ZN7_thread13currentThreadE>
    800033e8:	09c7a783          	lw	a5,156(a5)
    800033ec:	0027f713          	andi	a4,a5,2
    800033f0:	06071063          	bnez	a4,80003450 <_ZN7_thread4tickEv+0x94>
        return -1;
    }
    if(currentThread->closed){
    800033f4:	0017f713          	andi	a4,a5,1
    800033f8:	06071063          	bnez	a4,80003458 <_ZN7_thread4tickEv+0x9c>
        return -2;
    }
    if(currentThread->sleeping){
    800033fc:	0047f713          	andi	a4,a5,4
    80003400:	06071063          	bnez	a4,80003460 <_ZN7_thread4tickEv+0xa4>
        return -3;
    }
    if(currentThread->finished){
    80003404:	0087f793          	andi	a5,a5,8
    80003408:	06079063          	bnez	a5,80003468 <_ZN7_thread4tickEv+0xac>
        return -4;
    }
    timeLeft --;
    8000340c:	0884b783          	ld	a5,136(s1)
    80003410:	fff78793          	addi	a5,a5,-1
    80003414:	08f4b423          	sd	a5,136(s1)
    if(timeLeft == 0){
    80003418:	00078e63          	beqz	a5,80003434 <_ZN7_thread4tickEv+0x78>
        putc('D');
        thread_dispatch();
    }
    return 0;
    8000341c:	00000513          	li	a0,0
}
    80003420:	01813083          	ld	ra,24(sp)
    80003424:	01013403          	ld	s0,16(sp)
    80003428:	00813483          	ld	s1,8(sp)
    8000342c:	02010113          	addi	sp,sp,32
    80003430:	00008067          	ret
        putc('D');
    80003434:	04400513          	li	a0,68
    80003438:	ffffe097          	auipc	ra,0xffffe
    8000343c:	644080e7          	jalr	1604(ra) # 80001a7c <_Z4putcc>
        thread_dispatch();
    80003440:	ffffe097          	auipc	ra,0xffffe
    80003444:	4e8080e7          	jalr	1256(ra) # 80001928 <_Z15thread_dispatchv>
    return 0;
    80003448:	00000513          	li	a0,0
    8000344c:	fd5ff06f          	j	80003420 <_ZN7_thread4tickEv+0x64>
        return -1;
    80003450:	fff00513          	li	a0,-1
    80003454:	fcdff06f          	j	80003420 <_ZN7_thread4tickEv+0x64>
        return -2;
    80003458:	ffe00513          	li	a0,-2
    8000345c:	fc5ff06f          	j	80003420 <_ZN7_thread4tickEv+0x64>
        return -3;
    80003460:	ffd00513          	li	a0,-3
    80003464:	fbdff06f          	j	80003420 <_ZN7_thread4tickEv+0x64>
        return -4;
    80003468:	ffc00513          	li	a0,-4
    8000346c:	fb5ff06f          	j	80003420 <_ZN7_thread4tickEv+0x64>

0000000080003470 <_ZN7_thread4exitEv>:

int _thread::exit(){
    if(currentThread->closed){
    80003470:	0000b717          	auipc	a4,0xb
    80003474:	b2873703          	ld	a4,-1240(a4) # 8000df98 <_ZN7_thread13currentThreadE>
    80003478:	09c72783          	lw	a5,156(a4)
    8000347c:	0017f693          	andi	a3,a5,1
    80003480:	04069663          	bnez	a3,800034cc <_ZN7_thread4exitEv+0x5c>
        return -1;
    }
    if(currentThread->blocked){
    80003484:	0027f693          	andi	a3,a5,2
    80003488:	04069663          	bnez	a3,800034d4 <_ZN7_thread4exitEv+0x64>
        return -2;
    }
    if(currentThread->sleeping){
    8000348c:	0047f793          	andi	a5,a5,4
    80003490:	04079663          	bnez	a5,800034dc <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    80003494:	ff010113          	addi	sp,sp,-16
    80003498:	00113423          	sd	ra,8(sp)
    8000349c:	00813023          	sd	s0,0(sp)
    800034a0:	01010413          	addi	s0,sp,16
        return -3;
    }
    currentThread->finished = 1;
    800034a4:	09c72783          	lw	a5,156(a4)
    800034a8:	0087e793          	ori	a5,a5,8
    800034ac:	08f72e23          	sw	a5,156(a4)
    thread_dispatch();
    800034b0:	ffffe097          	auipc	ra,0xffffe
    800034b4:	478080e7          	jalr	1144(ra) # 80001928 <_Z15thread_dispatchv>
    return 0;
    800034b8:	00000513          	li	a0,0
}
    800034bc:	00813083          	ld	ra,8(sp)
    800034c0:	00013403          	ld	s0,0(sp)
    800034c4:	01010113          	addi	sp,sp,16
    800034c8:	00008067          	ret
        return -1;
    800034cc:	fff00513          	li	a0,-1
    800034d0:	00008067          	ret
        return -2;
    800034d4:	ffe00513          	li	a0,-2
    800034d8:	00008067          	ret
        return -3;
    800034dc:	ffd00513          	li	a0,-3
}
    800034e0:	00008067          	ret

00000000800034e4 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    800034e4:	fe010113          	addi	sp,sp,-32
    800034e8:	00113c23          	sd	ra,24(sp)
    800034ec:	00813823          	sd	s0,16(sp)
    800034f0:	00913423          	sd	s1,8(sp)
    800034f4:	02010413          	addi	s0,sp,32
    popSppSpie(currentThread->kernel);
    800034f8:	0000b497          	auipc	s1,0xb
    800034fc:	a9848493          	addi	s1,s1,-1384 # 8000df90 <_ZN7_thread6nextIDE>
    80003500:	0084b783          	ld	a5,8(s1)
    80003504:	09c7a503          	lw	a0,156(a5)
    80003508:	4045551b          	sraiw	a0,a0,0x4
    8000350c:	00157513          	andi	a0,a0,1
    80003510:	00000097          	auipc	ra,0x0
    80003514:	a70080e7          	jalr	-1424(ra) # 80002f80 <_Z10popSppSpieb>
    currentThread->function(currentThread->arg);
    80003518:	0084b783          	ld	a5,8(s1)
    8000351c:	0a87b703          	ld	a4,168(a5)
    80003520:	0b07b503          	ld	a0,176(a5)
    80003524:	000700e7          	jalr	a4
    currentThread->unJoin();
    80003528:	0084b503          	ld	a0,8(s1)
    8000352c:	00000097          	auipc	ra,0x0
    80003530:	a8c080e7          	jalr	-1396(ra) # 80002fb8 <_ZN7_thread6unJoinEv>
    exit();
    80003534:	00000097          	auipc	ra,0x0
    80003538:	f3c080e7          	jalr	-196(ra) # 80003470 <_ZN7_thread4exitEv>
}
    8000353c:	01813083          	ld	ra,24(sp)
    80003540:	01013403          	ld	s0,16(sp)
    80003544:	00813483          	ld	s1,8(sp)
    80003548:	02010113          	addi	sp,sp,32
    8000354c:	00008067          	ret

0000000080003550 <_ZN7_thread10setBlockedEb>:

void _thread::setBlocked(bool blocked){
    80003550:	ff010113          	addi	sp,sp,-16
    80003554:	00813423          	sd	s0,8(sp)
    80003558:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    8000355c:	0015f593          	andi	a1,a1,1
    80003560:	0015979b          	slliw	a5,a1,0x1
    80003564:	09c52583          	lw	a1,156(a0)
    80003568:	ffd5f593          	andi	a1,a1,-3
    8000356c:	00f5e5b3          	or	a1,a1,a5
    80003570:	08b52e23          	sw	a1,156(a0)
}
    80003574:	00813403          	ld	s0,8(sp)
    80003578:	01010113          	addi	sp,sp,16
    8000357c:	00008067          	ret

0000000080003580 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80003580:	ff010113          	addi	sp,sp,-16
    80003584:	00813423          	sd	s0,8(sp)
    80003588:	01010413          	addi	s0,sp,16
    this->closed = closed;
    8000358c:	0015f793          	andi	a5,a1,1
    80003590:	09c52583          	lw	a1,156(a0)
    80003594:	ffe5f593          	andi	a1,a1,-2
    80003598:	00f5e5b3          	or	a1,a1,a5
    8000359c:	08b52e23          	sw	a1,156(a0)
}
    800035a0:	00813403          	ld	s0,8(sp)
    800035a4:	01010113          	addi	sp,sp,16
    800035a8:	00008067          	ret

00000000800035ac <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    800035ac:	ff010113          	addi	sp,sp,-16
    800035b0:	00813423          	sd	s0,8(sp)
    800035b4:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    800035b8:	0015f593          	andi	a1,a1,1
    800035bc:	0025979b          	slliw	a5,a1,0x2
    800035c0:	09c52583          	lw	a1,156(a0)
    800035c4:	ffb5f593          	andi	a1,a1,-5
    800035c8:	00f5e5b3          	or	a1,a1,a5
    800035cc:	08b52e23          	sw	a1,156(a0)
}
    800035d0:	00813403          	ld	s0,8(sp)
    800035d4:	01010113          	addi	sp,sp,16
    800035d8:	00008067          	ret

00000000800035dc <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
        Scheduler::put(oldThread);
    }
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    800035dc:	ff010113          	addi	sp,sp,-16
    800035e0:	00813423          	sd	s0,8(sp)
    800035e4:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    800035e8:	04050263          	beqz	a0,8000362c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    800035ec:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    800035f0:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    800035f4:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    800035f8:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    800035fc:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    80003600:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    80003604:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    80003608:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    8000360c:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    80003610:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    80003614:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    80003618:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    8000361c:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    80003620:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80003624:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    80003628:	06853823          	sd	s0,112(a0)
    }
    
    
    if(newContext->sp != 0){
    8000362c:	0085b783          	ld	a5,8(a1)
    80003630:	00078463          	beqz	a5,80003638 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x5c>
        __asm__ volatile ("ld sp, 8(a1)");
    80003634:	0085b103          	ld	sp,8(a1)
    }
    __asm__ volatile ("ld ra, 0(a1)");
    80003638:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    8000363c:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    80003640:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    80003644:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    80003648:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    8000364c:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80003650:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    80003654:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80003658:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    8000365c:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80003660:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    80003664:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    80003668:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    8000366c:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    80003670:	0685bd83          	ld	s11,104(a1)

    return;

}
    80003674:	00813403          	ld	s0,8(sp)
    80003678:	01010113          	addi	sp,sp,16
    8000367c:	00008067          	ret

0000000080003680 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80003680:	fe010113          	addi	sp,sp,-32
    80003684:	00113c23          	sd	ra,24(sp)
    80003688:	00813823          	sd	s0,16(sp)
    8000368c:	00913423          	sd	s1,8(sp)
    80003690:	01213023          	sd	s2,0(sp)
    80003694:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    80003698:	0000b917          	auipc	s2,0xb
    8000369c:	8f890913          	addi	s2,s2,-1800 # 8000df90 <_ZN7_thread6nextIDE>
    800036a0:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    800036a4:	00001097          	auipc	ra,0x1
    800036a8:	2f4080e7          	jalr	756(ra) # 80004998 <_ZN9Scheduler3getEv>
    800036ac:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    800036b0:	00200793          	li	a5,2
    800036b4:	08f4b423          	sd	a5,136(s1)
    if(currentThread == 0){
    800036b8:	04050463          	beqz	a0,80003700 <_ZN7_thread8dispatchEv+0x80>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    800036bc:	00048c63          	beqz	s1,800036d4 <_ZN7_thread8dispatchEv+0x54>
    800036c0:	0984b783          	ld	a5,152(s1)
    800036c4:	00f00713          	li	a4,15
    800036c8:	02071713          	slli	a4,a4,0x20
    800036cc:	00e7f7b3          	and	a5,a5,a4
    800036d0:	02078e63          	beqz	a5,8000370c <_ZN7_thread8dispatchEv+0x8c>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    800036d4:	0000b597          	auipc	a1,0xb
    800036d8:	8c45b583          	ld	a1,-1852(a1) # 8000df98 <_ZN7_thread13currentThreadE>
    800036dc:	00048513          	mv	a0,s1
    800036e0:	00000097          	auipc	ra,0x0
    800036e4:	efc080e7          	jalr	-260(ra) # 800035dc <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    800036e8:	01813083          	ld	ra,24(sp)
    800036ec:	01013403          	ld	s0,16(sp)
    800036f0:	00813483          	ld	s1,8(sp)
    800036f4:	00013903          	ld	s2,0(sp)
    800036f8:	02010113          	addi	sp,sp,32
    800036fc:	00008067          	ret
        currentThread = oldThread;
    80003700:	0000b797          	auipc	a5,0xb
    80003704:	8897bc23          	sd	s1,-1896(a5) # 8000df98 <_ZN7_thread13currentThreadE>
        return;
    80003708:	fe1ff06f          	j	800036e8 <_ZN7_thread8dispatchEv+0x68>
        Scheduler::put(oldThread);
    8000370c:	00048513          	mv	a0,s1
    80003710:	00001097          	auipc	ra,0x1
    80003714:	098080e7          	jalr	152(ra) # 800047a8 <_ZN9Scheduler3putEP7_thread>
    80003718:	fbdff06f          	j	800036d4 <_ZN7_thread8dispatchEv+0x54>

000000008000371c <_ZN11HeapManagerC1Ev>:
#include "heapManager.h"
#include "console.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    8000371c:	fe010113          	addi	sp,sp,-32
    80003720:	00113c23          	sd	ra,24(sp)
    80003724:	00813823          	sd	s0,16(sp)
    80003728:	00913423          	sd	s1,8(sp)
    8000372c:	02010413          	addi	s0,sp,32
    80003730:	00050493          	mv	s1,a0
    assert(instance == 0);
    80003734:	0000b797          	auipc	a5,0xb
    80003738:	86c7b783          	ld	a5,-1940(a5) # 8000dfa0 <_ZN11HeapManager8instanceE>
    8000373c:	02079063          	bnez	a5,8000375c <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80003740:	0000b797          	auipc	a5,0xb
    80003744:	8697b023          	sd	s1,-1952(a5) # 8000dfa0 <_ZN11HeapManager8instanceE>
}
    80003748:	01813083          	ld	ra,24(sp)
    8000374c:	01013403          	ld	s0,16(sp)
    80003750:	00813483          	ld	s1,8(sp)
    80003754:	02010113          	addi	sp,sp,32
    80003758:	00008067          	ret
    assert(instance == 0);
    8000375c:	00008697          	auipc	a3,0x8
    80003760:	a0c68693          	addi	a3,a3,-1524 # 8000b168 <CONSOLE_STATUS+0x158>
    80003764:	01200613          	li	a2,18
    80003768:	00008597          	auipc	a1,0x8
    8000376c:	a2058593          	addi	a1,a1,-1504 # 8000b188 <CONSOLE_STATUS+0x178>
    80003770:	00008517          	auipc	a0,0x8
    80003774:	8d050513          	addi	a0,a0,-1840 # 8000b040 <CONSOLE_STATUS+0x30>
    80003778:	fffff097          	auipc	ra,0xfffff
    8000377c:	8b4080e7          	jalr	-1868(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80003780:	fc1ff06f          	j	80003740 <_ZN11HeapManagerC1Ev+0x24>

0000000080003784 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80003784:	ff010113          	addi	sp,sp,-16
    80003788:	00813423          	sd	s0,8(sp)
    8000378c:	01010413          	addi	s0,sp,16
    
}
    80003790:	00813403          	ld	s0,8(sp)
    80003794:	01010113          	addi	sp,sp,16
    80003798:	00008067          	ret

000000008000379c <_ZN11HeapManager4initEmm>:

void HeapManager::init(uint64 nStart, size_t nEnd){
    8000379c:	fd010113          	addi	sp,sp,-48
    800037a0:	02113423          	sd	ra,40(sp)
    800037a4:	02813023          	sd	s0,32(sp)
    800037a8:	00913c23          	sd	s1,24(sp)
    800037ac:	01213823          	sd	s2,16(sp)
    800037b0:	01313423          	sd	s3,8(sp)
    800037b4:	03010413          	addi	s0,sp,48
    800037b8:	00050993          	mv	s3,a0
    800037bc:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    800037c0:	40b604b3          	sub	s1,a2,a1
    800037c4:	0414b793          	sltiu	a5,s1,65
    800037c8:	0c079863          	bnez	a5,80003898 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    800037cc:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    800037d0:	fde00793          	li	a5,-34
    800037d4:	00f90c23          	sb	a5,24(s2)
    800037d8:	fc000713          	li	a4,-64
    800037dc:	00e90ca3          	sb	a4,25(s2)
    800037e0:	fad00713          	li	a4,-83
    800037e4:	00e90d23          	sb	a4,26(s2)
    800037e8:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    800037ec:	0064d613          	srli	a2,s1,0x6
    800037f0:	0009b783          	ld	a5,0(s3)
    800037f4:	fff60613          	addi	a2,a2,-1
    800037f8:	00c78823          	sb	a2,16(a5)
    800037fc:	00865713          	srli	a4,a2,0x8
    80003800:	00e788a3          	sb	a4,17(a5)
    80003804:	01065713          	srli	a4,a2,0x10
    80003808:	00e78923          	sb	a4,18(a5)
    8000380c:	0186571b          	srliw	a4,a2,0x18
    80003810:	00e789a3          	sb	a4,19(a5)
    80003814:	02065713          	srli	a4,a2,0x20
    80003818:	00e78a23          	sb	a4,20(a5)
    8000381c:	02865713          	srli	a4,a2,0x28
    80003820:	00e78aa3          	sb	a4,21(a5)
    80003824:	03065713          	srli	a4,a2,0x30
    80003828:	00e78b23          	sb	a4,22(a5)
    8000382c:	03865613          	srli	a2,a2,0x38
    80003830:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80003834:	0009b783          	ld	a5,0(s3)
    80003838:	00078023          	sb	zero,0(a5)
    8000383c:	000780a3          	sb	zero,1(a5)
    80003840:	00078123          	sb	zero,2(a5)
    80003844:	000781a3          	sb	zero,3(a5)
    80003848:	00078223          	sb	zero,4(a5)
    8000384c:	000782a3          	sb	zero,5(a5)
    80003850:	00078323          	sb	zero,6(a5)
    80003854:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80003858:	0009b783          	ld	a5,0(s3)
    8000385c:	00078423          	sb	zero,8(a5)
    80003860:	000784a3          	sb	zero,9(a5)
    80003864:	00078523          	sb	zero,10(a5)
    80003868:	000785a3          	sb	zero,11(a5)
    8000386c:	00078623          	sb	zero,12(a5)
    80003870:	000786a3          	sb	zero,13(a5)
    80003874:	00078723          	sb	zero,14(a5)
    80003878:	000787a3          	sb	zero,15(a5)
}
    8000387c:	02813083          	ld	ra,40(sp)
    80003880:	02013403          	ld	s0,32(sp)
    80003884:	01813483          	ld	s1,24(sp)
    80003888:	01013903          	ld	s2,16(sp)
    8000388c:	00813983          	ld	s3,8(sp)
    80003890:	03010113          	addi	sp,sp,48
    80003894:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003898:	00008697          	auipc	a3,0x8
    8000389c:	90868693          	addi	a3,a3,-1784 # 8000b1a0 <CONSOLE_STATUS+0x190>
    800038a0:	01b00613          	li	a2,27
    800038a4:	00008597          	auipc	a1,0x8
    800038a8:	8e458593          	addi	a1,a1,-1820 # 8000b188 <CONSOLE_STATUS+0x178>
    800038ac:	00008517          	auipc	a0,0x8
    800038b0:	91c50513          	addi	a0,a0,-1764 # 8000b1c8 <CONSOLE_STATUS+0x1b8>
    800038b4:	ffffe097          	auipc	ra,0xffffe
    800038b8:	778080e7          	jalr	1912(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800038bc:	f11ff06f          	j	800037cc <_ZN11HeapManager4initEmm+0x30>

00000000800038c0 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    800038c0:	fe010113          	addi	sp,sp,-32
    800038c4:	00113c23          	sd	ra,24(sp)
    800038c8:	00813823          	sd	s0,16(sp)
    800038cc:	00913423          	sd	s1,8(sp)
    800038d0:	01213023          	sd	s2,0(sp)
    800038d4:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    800038d8:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    800038dc:	00000913          	li	s2,0
    800038e0:	0b80006f          	j	80003998 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    800038e4:	0104c783          	lbu	a5,16(s1)
    800038e8:	0114c703          	lbu	a4,17(s1)
    800038ec:	00871713          	slli	a4,a4,0x8
    800038f0:	00f76733          	or	a4,a4,a5
    800038f4:	0124c783          	lbu	a5,18(s1)
    800038f8:	01079793          	slli	a5,a5,0x10
    800038fc:	00e7e733          	or	a4,a5,a4
    80003900:	0134c783          	lbu	a5,19(s1)
    80003904:	01879793          	slli	a5,a5,0x18
    80003908:	00e7e7b3          	or	a5,a5,a4
    8000390c:	0144c703          	lbu	a4,20(s1)
    80003910:	02071713          	slli	a4,a4,0x20
    80003914:	00f767b3          	or	a5,a4,a5
    80003918:	0154c703          	lbu	a4,21(s1)
    8000391c:	02871713          	slli	a4,a4,0x28
    80003920:	00f76733          	or	a4,a4,a5
    80003924:	0164c783          	lbu	a5,22(s1)
    80003928:	03079793          	slli	a5,a5,0x30
    8000392c:	00e7e733          	or	a4,a5,a4
    80003930:	0174c783          	lbu	a5,23(s1)
    80003934:	03879793          	slli	a5,a5,0x38
    80003938:	00e7e7b3          	or	a5,a5,a4
    8000393c:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80003940:	0004c703          	lbu	a4,0(s1)
    80003944:	0014c783          	lbu	a5,1(s1)
    80003948:	00879793          	slli	a5,a5,0x8
    8000394c:	00e7e733          	or	a4,a5,a4
    80003950:	0024c783          	lbu	a5,2(s1)
    80003954:	01079793          	slli	a5,a5,0x10
    80003958:	00e7e7b3          	or	a5,a5,a4
    8000395c:	0034c703          	lbu	a4,3(s1)
    80003960:	01871713          	slli	a4,a4,0x18
    80003964:	00f767b3          	or	a5,a4,a5
    80003968:	0044c703          	lbu	a4,4(s1)
    8000396c:	02071713          	slli	a4,a4,0x20
    80003970:	00f76733          	or	a4,a4,a5
    80003974:	0054c783          	lbu	a5,5(s1)
    80003978:	02879793          	slli	a5,a5,0x28
    8000397c:	00e7e733          	or	a4,a5,a4
    80003980:	0064c783          	lbu	a5,6(s1)
    80003984:	03079793          	slli	a5,a5,0x30
    80003988:	00e7e7b3          	or	a5,a5,a4
    8000398c:	0074c483          	lbu	s1,7(s1)
    80003990:	03849493          	slli	s1,s1,0x38
    80003994:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003998:	06048263          	beqz	s1,800039fc <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    8000399c:	0184c783          	lbu	a5,24(s1)
    800039a0:	0194c703          	lbu	a4,25(s1)
    800039a4:	00871713          	slli	a4,a4,0x8
    800039a8:	00f76733          	or	a4,a4,a5
    800039ac:	01a4c783          	lbu	a5,26(s1)
    800039b0:	01079793          	slli	a5,a5,0x10
    800039b4:	00e7e733          	or	a4,a5,a4
    800039b8:	01b4c783          	lbu	a5,27(s1)
    800039bc:	01879793          	slli	a5,a5,0x18
    800039c0:	00e7e7b3          	or	a5,a5,a4
    800039c4:	0007879b          	sext.w	a5,a5
    800039c8:	deadc737          	lui	a4,0xdeadc
    800039cc:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eacce7e>
    800039d0:	f0e78ae3          	beq	a5,a4,800038e4 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    800039d4:	00008697          	auipc	a3,0x8
    800039d8:	81468693          	addi	a3,a3,-2028 # 8000b1e8 <CONSOLE_STATUS+0x1d8>
    800039dc:	02800613          	li	a2,40
    800039e0:	00007597          	auipc	a1,0x7
    800039e4:	7a858593          	addi	a1,a1,1960 # 8000b188 <CONSOLE_STATUS+0x178>
    800039e8:	00008517          	auipc	a0,0x8
    800039ec:	82850513          	addi	a0,a0,-2008 # 8000b210 <CONSOLE_STATUS+0x200>
    800039f0:	ffffe097          	auipc	ra,0xffffe
    800039f4:	63c080e7          	jalr	1596(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800039f8:	eedff06f          	j	800038e4 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    800039fc:	00090513          	mv	a0,s2
    80003a00:	01813083          	ld	ra,24(sp)
    80003a04:	01013403          	ld	s0,16(sp)
    80003a08:	00813483          	ld	s1,8(sp)
    80003a0c:	00013903          	ld	s2,0(sp)
    80003a10:	02010113          	addi	sp,sp,32
    80003a14:	00008067          	ret

0000000080003a18 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80003a18:	fd010113          	addi	sp,sp,-48
    80003a1c:	02113423          	sd	ra,40(sp)
    80003a20:	02813023          	sd	s0,32(sp)
    80003a24:	00913c23          	sd	s1,24(sp)
    80003a28:	01213823          	sd	s2,16(sp)
    80003a2c:	01313423          	sd	s3,8(sp)
    80003a30:	03010413          	addi	s0,sp,48
    80003a34:	00050993          	mv	s3,a0
    80003a38:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003a3c:	00053483          	ld	s1,0(a0)
    80003a40:	0b80006f          	j	80003af8 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80003a44:	0104c783          	lbu	a5,16(s1)
    80003a48:	0114c703          	lbu	a4,17(s1)
    80003a4c:	00871713          	slli	a4,a4,0x8
    80003a50:	00f76733          	or	a4,a4,a5
    80003a54:	0124c783          	lbu	a5,18(s1)
    80003a58:	01079793          	slli	a5,a5,0x10
    80003a5c:	00e7e733          	or	a4,a5,a4
    80003a60:	0134c783          	lbu	a5,19(s1)
    80003a64:	01879793          	slli	a5,a5,0x18
    80003a68:	00e7e7b3          	or	a5,a5,a4
    80003a6c:	0144c703          	lbu	a4,20(s1)
    80003a70:	02071713          	slli	a4,a4,0x20
    80003a74:	00f767b3          	or	a5,a4,a5
    80003a78:	0154c703          	lbu	a4,21(s1)
    80003a7c:	02871713          	slli	a4,a4,0x28
    80003a80:	00f76733          	or	a4,a4,a5
    80003a84:	0164c783          	lbu	a5,22(s1)
    80003a88:	03079793          	slli	a5,a5,0x30
    80003a8c:	00e7e733          	or	a4,a5,a4
    80003a90:	0174c783          	lbu	a5,23(s1)
    80003a94:	03879793          	slli	a5,a5,0x38
    80003a98:	00e7e7b3          	or	a5,a5,a4
    80003a9c:	0d27f063          	bgeu	a5,s2,80003b5c <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80003aa0:	0004c703          	lbu	a4,0(s1)
    80003aa4:	0014c783          	lbu	a5,1(s1)
    80003aa8:	00879793          	slli	a5,a5,0x8
    80003aac:	00e7e733          	or	a4,a5,a4
    80003ab0:	0024c783          	lbu	a5,2(s1)
    80003ab4:	01079793          	slli	a5,a5,0x10
    80003ab8:	00e7e7b3          	or	a5,a5,a4
    80003abc:	0034c703          	lbu	a4,3(s1)
    80003ac0:	01871713          	slli	a4,a4,0x18
    80003ac4:	00f767b3          	or	a5,a4,a5
    80003ac8:	0044c703          	lbu	a4,4(s1)
    80003acc:	02071713          	slli	a4,a4,0x20
    80003ad0:	00f76733          	or	a4,a4,a5
    80003ad4:	0054c783          	lbu	a5,5(s1)
    80003ad8:	02879793          	slli	a5,a5,0x28
    80003adc:	00e7e733          	or	a4,a5,a4
    80003ae0:	0064c783          	lbu	a5,6(s1)
    80003ae4:	03079793          	slli	a5,a5,0x30
    80003ae8:	00e7e7b3          	or	a5,a5,a4
    80003aec:	0074c483          	lbu	s1,7(s1)
    80003af0:	03849493          	slli	s1,s1,0x38
    80003af4:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003af8:	4e048c63          	beqz	s1,80003ff0 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003afc:	0184c783          	lbu	a5,24(s1)
    80003b00:	0194c703          	lbu	a4,25(s1)
    80003b04:	00871713          	slli	a4,a4,0x8
    80003b08:	00f76733          	or	a4,a4,a5
    80003b0c:	01a4c783          	lbu	a5,26(s1)
    80003b10:	01079793          	slli	a5,a5,0x10
    80003b14:	00e7e733          	or	a4,a5,a4
    80003b18:	01b4c783          	lbu	a5,27(s1)
    80003b1c:	01879793          	slli	a5,a5,0x18
    80003b20:	00e7e7b3          	or	a5,a5,a4
    80003b24:	0007879b          	sext.w	a5,a5
    80003b28:	deadc737          	lui	a4,0xdeadc
    80003b2c:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eacce7e>
    80003b30:	f0e78ae3          	beq	a5,a4,80003a44 <_ZN11HeapManager12heapAllocateEm+0x2c>
    80003b34:	00007697          	auipc	a3,0x7
    80003b38:	70468693          	addi	a3,a3,1796 # 8000b238 <CONSOLE_STATUS+0x228>
    80003b3c:	03200613          	li	a2,50
    80003b40:	00007597          	auipc	a1,0x7
    80003b44:	64858593          	addi	a1,a1,1608 # 8000b188 <CONSOLE_STATUS+0x178>
    80003b48:	00007517          	auipc	a0,0x7
    80003b4c:	6c850513          	addi	a0,a0,1736 # 8000b210 <CONSOLE_STATUS+0x200>
    80003b50:	ffffe097          	auipc	ra,0xffffe
    80003b54:	4dc080e7          	jalr	1244(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80003b58:	eedff06f          	j	80003a44 <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80003b5c:	00190713          	addi	a4,s2,1
    80003b60:	2af77263          	bgeu	a4,a5,80003e04 <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80003b64:	00671793          	slli	a5,a4,0x6
    80003b68:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80003b6c:	fde00713          	li	a4,-34
    80003b70:	00e78c23          	sb	a4,24(a5)
    80003b74:	fc000693          	li	a3,-64
    80003b78:	00d78ca3          	sb	a3,25(a5)
    80003b7c:	fad00693          	li	a3,-83
    80003b80:	00d78d23          	sb	a3,26(a5)
    80003b84:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80003b88:	0104c703          	lbu	a4,16(s1)
    80003b8c:	0114c683          	lbu	a3,17(s1)
    80003b90:	00869693          	slli	a3,a3,0x8
    80003b94:	00e6e6b3          	or	a3,a3,a4
    80003b98:	0124c703          	lbu	a4,18(s1)
    80003b9c:	01071713          	slli	a4,a4,0x10
    80003ba0:	00d766b3          	or	a3,a4,a3
    80003ba4:	0134c703          	lbu	a4,19(s1)
    80003ba8:	01871713          	slli	a4,a4,0x18
    80003bac:	00d76733          	or	a4,a4,a3
    80003bb0:	0144c683          	lbu	a3,20(s1)
    80003bb4:	02069693          	slli	a3,a3,0x20
    80003bb8:	00e6e733          	or	a4,a3,a4
    80003bbc:	0154c683          	lbu	a3,21(s1)
    80003bc0:	02869693          	slli	a3,a3,0x28
    80003bc4:	00e6e6b3          	or	a3,a3,a4
    80003bc8:	0164c703          	lbu	a4,22(s1)
    80003bcc:	03071713          	slli	a4,a4,0x30
    80003bd0:	00d766b3          	or	a3,a4,a3
    80003bd4:	0174c703          	lbu	a4,23(s1)
    80003bd8:	03871713          	slli	a4,a4,0x38
    80003bdc:	00d76733          	or	a4,a4,a3
    80003be0:	41270733          	sub	a4,a4,s2
    80003be4:	fff70713          	addi	a4,a4,-1
    80003be8:	00e78823          	sb	a4,16(a5)
    80003bec:	00875693          	srli	a3,a4,0x8
    80003bf0:	00d788a3          	sb	a3,17(a5)
    80003bf4:	01075693          	srli	a3,a4,0x10
    80003bf8:	00d78923          	sb	a3,18(a5)
    80003bfc:	0187569b          	srliw	a3,a4,0x18
    80003c00:	00d789a3          	sb	a3,19(a5)
    80003c04:	02075693          	srli	a3,a4,0x20
    80003c08:	00d78a23          	sb	a3,20(a5)
    80003c0c:	02875693          	srli	a3,a4,0x28
    80003c10:	00d78aa3          	sb	a3,21(a5)
    80003c14:	03075693          	srli	a3,a4,0x30
    80003c18:	00d78b23          	sb	a3,22(a5)
    80003c1c:	03875713          	srli	a4,a4,0x38
    80003c20:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80003c24:	0004c703          	lbu	a4,0(s1)
    80003c28:	0014c683          	lbu	a3,1(s1)
    80003c2c:	00869693          	slli	a3,a3,0x8
    80003c30:	00e6e733          	or	a4,a3,a4
    80003c34:	0024c683          	lbu	a3,2(s1)
    80003c38:	01069693          	slli	a3,a3,0x10
    80003c3c:	00e6e6b3          	or	a3,a3,a4
    80003c40:	0034c703          	lbu	a4,3(s1)
    80003c44:	01871713          	slli	a4,a4,0x18
    80003c48:	00d766b3          	or	a3,a4,a3
    80003c4c:	0044c703          	lbu	a4,4(s1)
    80003c50:	02071713          	slli	a4,a4,0x20
    80003c54:	00d76733          	or	a4,a4,a3
    80003c58:	0054c683          	lbu	a3,5(s1)
    80003c5c:	02869693          	slli	a3,a3,0x28
    80003c60:	00e6e733          	or	a4,a3,a4
    80003c64:	0064c683          	lbu	a3,6(s1)
    80003c68:	03069693          	slli	a3,a3,0x30
    80003c6c:	00e6e6b3          	or	a3,a3,a4
    80003c70:	0074c703          	lbu	a4,7(s1)
    80003c74:	03871713          	slli	a4,a4,0x38
    80003c78:	00d76733          	or	a4,a4,a3
    80003c7c:	00d78023          	sb	a3,0(a5)
    80003c80:	00875693          	srli	a3,a4,0x8
    80003c84:	00d780a3          	sb	a3,1(a5)
    80003c88:	01075693          	srli	a3,a4,0x10
    80003c8c:	00d78123          	sb	a3,2(a5)
    80003c90:	0187569b          	srliw	a3,a4,0x18
    80003c94:	00d781a3          	sb	a3,3(a5)
    80003c98:	02075693          	srli	a3,a4,0x20
    80003c9c:	00d78223          	sb	a3,4(a5)
    80003ca0:	02875693          	srli	a3,a4,0x28
    80003ca4:	00d782a3          	sb	a3,5(a5)
    80003ca8:	03075693          	srli	a3,a4,0x30
    80003cac:	00d78323          	sb	a3,6(a5)
    80003cb0:	03875713          	srli	a4,a4,0x38
    80003cb4:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80003cb8:	00978423          	sb	s1,8(a5)
    80003cbc:	0084d713          	srli	a4,s1,0x8
    80003cc0:	00e784a3          	sb	a4,9(a5)
    80003cc4:	0104d713          	srli	a4,s1,0x10
    80003cc8:	00e78523          	sb	a4,10(a5)
    80003ccc:	0184d71b          	srliw	a4,s1,0x18
    80003cd0:	00e785a3          	sb	a4,11(a5)
    80003cd4:	0204d713          	srli	a4,s1,0x20
    80003cd8:	00e78623          	sb	a4,12(a5)
    80003cdc:	0284d713          	srli	a4,s1,0x28
    80003ce0:	00e786a3          	sb	a4,13(a5)
    80003ce4:	0304d713          	srli	a4,s1,0x30
    80003ce8:	00e78723          	sb	a4,14(a5)
    80003cec:	0384d713          	srli	a4,s1,0x38
    80003cf0:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    80003cf4:	0004c703          	lbu	a4,0(s1)
    80003cf8:	0014c683          	lbu	a3,1(s1)
    80003cfc:	00869693          	slli	a3,a3,0x8
    80003d00:	00e6e6b3          	or	a3,a3,a4
    80003d04:	0024c703          	lbu	a4,2(s1)
    80003d08:	01071713          	slli	a4,a4,0x10
    80003d0c:	00d766b3          	or	a3,a4,a3
    80003d10:	0034c703          	lbu	a4,3(s1)
    80003d14:	01871713          	slli	a4,a4,0x18
    80003d18:	00d76733          	or	a4,a4,a3
    80003d1c:	0044c683          	lbu	a3,4(s1)
    80003d20:	02069693          	slli	a3,a3,0x20
    80003d24:	00e6e733          	or	a4,a3,a4
    80003d28:	0054c683          	lbu	a3,5(s1)
    80003d2c:	02869693          	slli	a3,a3,0x28
    80003d30:	00e6e6b3          	or	a3,a3,a4
    80003d34:	0064c703          	lbu	a4,6(s1)
    80003d38:	03071713          	slli	a4,a4,0x30
    80003d3c:	00d766b3          	or	a3,a4,a3
    80003d40:	0074c703          	lbu	a4,7(s1)
    80003d44:	03871713          	slli	a4,a4,0x38
    80003d48:	00d76733          	or	a4,a4,a3
    80003d4c:	04070063          	beqz	a4,80003d8c <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003d50:	00f70423          	sb	a5,8(a4)
    80003d54:	0087d693          	srli	a3,a5,0x8
    80003d58:	00d704a3          	sb	a3,9(a4)
    80003d5c:	0107d693          	srli	a3,a5,0x10
    80003d60:	00d70523          	sb	a3,10(a4)
    80003d64:	0187d69b          	srliw	a3,a5,0x18
    80003d68:	00d705a3          	sb	a3,11(a4)
    80003d6c:	0207d693          	srli	a3,a5,0x20
    80003d70:	00d70623          	sb	a3,12(a4)
    80003d74:	0287d693          	srli	a3,a5,0x28
    80003d78:	00d706a3          	sb	a3,13(a4)
    80003d7c:	0307d693          	srli	a3,a5,0x30
    80003d80:	00d70723          	sb	a3,14(a4)
    80003d84:	0387d693          	srli	a3,a5,0x38
    80003d88:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80003d8c:	00f48023          	sb	a5,0(s1)
    80003d90:	0087d713          	srli	a4,a5,0x8
    80003d94:	00e480a3          	sb	a4,1(s1)
    80003d98:	0107d713          	srli	a4,a5,0x10
    80003d9c:	00e48123          	sb	a4,2(s1)
    80003da0:	0187d71b          	srliw	a4,a5,0x18
    80003da4:	00e481a3          	sb	a4,3(s1)
    80003da8:	0207d713          	srli	a4,a5,0x20
    80003dac:	00e48223          	sb	a4,4(s1)
    80003db0:	0287d713          	srli	a4,a5,0x28
    80003db4:	00e482a3          	sb	a4,5(s1)
    80003db8:	0307d713          	srli	a4,a5,0x30
    80003dbc:	00e48323          	sb	a4,6(s1)
    80003dc0:	0387d793          	srli	a5,a5,0x38
    80003dc4:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80003dc8:	01248823          	sb	s2,16(s1)
    80003dcc:	00895793          	srli	a5,s2,0x8
    80003dd0:	00f488a3          	sb	a5,17(s1)
    80003dd4:	01095793          	srli	a5,s2,0x10
    80003dd8:	00f48923          	sb	a5,18(s1)
    80003ddc:	0189579b          	srliw	a5,s2,0x18
    80003de0:	00f489a3          	sb	a5,19(s1)
    80003de4:	02095793          	srli	a5,s2,0x20
    80003de8:	00f48a23          	sb	a5,20(s1)
    80003dec:	02895793          	srli	a5,s2,0x28
    80003df0:	00f48aa3          	sb	a5,21(s1)
    80003df4:	03095793          	srli	a5,s2,0x30
    80003df8:	00f48b23          	sb	a5,22(s1)
    80003dfc:	03895913          	srli	s2,s2,0x38
    80003e00:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80003e04:	0009b783          	ld	a5,0(s3)
    80003e08:	20978463          	beq	a5,s1,80004010 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80003e0c:	0084c783          	lbu	a5,8(s1)
    80003e10:	0094c703          	lbu	a4,9(s1)
    80003e14:	00871713          	slli	a4,a4,0x8
    80003e18:	00f76733          	or	a4,a4,a5
    80003e1c:	00a4c783          	lbu	a5,10(s1)
    80003e20:	01079793          	slli	a5,a5,0x10
    80003e24:	00e7e733          	or	a4,a5,a4
    80003e28:	00b4c783          	lbu	a5,11(s1)
    80003e2c:	01879793          	slli	a5,a5,0x18
    80003e30:	00e7e7b3          	or	a5,a5,a4
    80003e34:	00c4c703          	lbu	a4,12(s1)
    80003e38:	02071713          	slli	a4,a4,0x20
    80003e3c:	00f767b3          	or	a5,a4,a5
    80003e40:	00d4c703          	lbu	a4,13(s1)
    80003e44:	02871713          	slli	a4,a4,0x28
    80003e48:	00f76733          	or	a4,a4,a5
    80003e4c:	00e4c783          	lbu	a5,14(s1)
    80003e50:	03079793          	slli	a5,a5,0x30
    80003e54:	00e7e733          	or	a4,a5,a4
    80003e58:	00f4c783          	lbu	a5,15(s1)
    80003e5c:	03879793          	slli	a5,a5,0x38
    80003e60:	00e7e7b3          	or	a5,a5,a4
    80003e64:	08078c63          	beqz	a5,80003efc <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80003e68:	0004c703          	lbu	a4,0(s1)
    80003e6c:	0014c683          	lbu	a3,1(s1)
    80003e70:	00869693          	slli	a3,a3,0x8
    80003e74:	00e6e733          	or	a4,a3,a4
    80003e78:	0024c683          	lbu	a3,2(s1)
    80003e7c:	01069693          	slli	a3,a3,0x10
    80003e80:	00e6e6b3          	or	a3,a3,a4
    80003e84:	0034c703          	lbu	a4,3(s1)
    80003e88:	01871713          	slli	a4,a4,0x18
    80003e8c:	00d766b3          	or	a3,a4,a3
    80003e90:	0044c703          	lbu	a4,4(s1)
    80003e94:	02071713          	slli	a4,a4,0x20
    80003e98:	00d76733          	or	a4,a4,a3
    80003e9c:	0054c683          	lbu	a3,5(s1)
    80003ea0:	02869693          	slli	a3,a3,0x28
    80003ea4:	00e6e733          	or	a4,a3,a4
    80003ea8:	0064c683          	lbu	a3,6(s1)
    80003eac:	03069693          	slli	a3,a3,0x30
    80003eb0:	00e6e6b3          	or	a3,a3,a4
    80003eb4:	0074c703          	lbu	a4,7(s1)
    80003eb8:	03871713          	slli	a4,a4,0x38
    80003ebc:	00d76733          	or	a4,a4,a3
    80003ec0:	00d78023          	sb	a3,0(a5)
    80003ec4:	00875693          	srli	a3,a4,0x8
    80003ec8:	00d780a3          	sb	a3,1(a5)
    80003ecc:	01075693          	srli	a3,a4,0x10
    80003ed0:	00d78123          	sb	a3,2(a5)
    80003ed4:	0187569b          	srliw	a3,a4,0x18
    80003ed8:	00d781a3          	sb	a3,3(a5)
    80003edc:	02075693          	srli	a3,a4,0x20
    80003ee0:	00d78223          	sb	a3,4(a5)
    80003ee4:	02875693          	srli	a3,a4,0x28
    80003ee8:	00d782a3          	sb	a3,5(a5)
    80003eec:	03075693          	srli	a3,a4,0x30
    80003ef0:	00d78323          	sb	a3,6(a5)
    80003ef4:	03875713          	srli	a4,a4,0x38
    80003ef8:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003efc:	0004c783          	lbu	a5,0(s1)
    80003f00:	0014c703          	lbu	a4,1(s1)
    80003f04:	00871713          	slli	a4,a4,0x8
    80003f08:	00f76733          	or	a4,a4,a5
    80003f0c:	0024c783          	lbu	a5,2(s1)
    80003f10:	01079793          	slli	a5,a5,0x10
    80003f14:	00e7e733          	or	a4,a5,a4
    80003f18:	0034c783          	lbu	a5,3(s1)
    80003f1c:	01879793          	slli	a5,a5,0x18
    80003f20:	00e7e7b3          	or	a5,a5,a4
    80003f24:	0044c703          	lbu	a4,4(s1)
    80003f28:	02071713          	slli	a4,a4,0x20
    80003f2c:	00f767b3          	or	a5,a4,a5
    80003f30:	0054c703          	lbu	a4,5(s1)
    80003f34:	02871713          	slli	a4,a4,0x28
    80003f38:	00f76733          	or	a4,a4,a5
    80003f3c:	0064c783          	lbu	a5,6(s1)
    80003f40:	03079793          	slli	a5,a5,0x30
    80003f44:	00e7e733          	or	a4,a5,a4
    80003f48:	0074c783          	lbu	a5,7(s1)
    80003f4c:	03879793          	slli	a5,a5,0x38
    80003f50:	00e7e7b3          	or	a5,a5,a4
    80003f54:	08078c63          	beqz	a5,80003fec <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003f58:	0084c703          	lbu	a4,8(s1)
    80003f5c:	0094c683          	lbu	a3,9(s1)
    80003f60:	00869693          	slli	a3,a3,0x8
    80003f64:	00e6e733          	or	a4,a3,a4
    80003f68:	00a4c683          	lbu	a3,10(s1)
    80003f6c:	01069693          	slli	a3,a3,0x10
    80003f70:	00e6e6b3          	or	a3,a3,a4
    80003f74:	00b4c703          	lbu	a4,11(s1)
    80003f78:	01871713          	slli	a4,a4,0x18
    80003f7c:	00d766b3          	or	a3,a4,a3
    80003f80:	00c4c703          	lbu	a4,12(s1)
    80003f84:	02071713          	slli	a4,a4,0x20
    80003f88:	00d76733          	or	a4,a4,a3
    80003f8c:	00d4c683          	lbu	a3,13(s1)
    80003f90:	02869693          	slli	a3,a3,0x28
    80003f94:	00e6e733          	or	a4,a3,a4
    80003f98:	00e4c683          	lbu	a3,14(s1)
    80003f9c:	03069693          	slli	a3,a3,0x30
    80003fa0:	00e6e6b3          	or	a3,a3,a4
    80003fa4:	00f4c703          	lbu	a4,15(s1)
    80003fa8:	03871713          	slli	a4,a4,0x38
    80003fac:	00d76733          	or	a4,a4,a3
    80003fb0:	00d78423          	sb	a3,8(a5)
    80003fb4:	00875693          	srli	a3,a4,0x8
    80003fb8:	00d784a3          	sb	a3,9(a5)
    80003fbc:	01075693          	srli	a3,a4,0x10
    80003fc0:	00d78523          	sb	a3,10(a5)
    80003fc4:	0187569b          	srliw	a3,a4,0x18
    80003fc8:	00d785a3          	sb	a3,11(a5)
    80003fcc:	02075693          	srli	a3,a4,0x20
    80003fd0:	00d78623          	sb	a3,12(a5)
    80003fd4:	02875693          	srli	a3,a4,0x28
    80003fd8:	00d786a3          	sb	a3,13(a5)
    80003fdc:	03075693          	srli	a3,a4,0x30
    80003fe0:	00d78723          	sb	a3,14(a5)
    80003fe4:	03875713          	srli	a4,a4,0x38
    80003fe8:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    80003fec:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    80003ff0:	00048513          	mv	a0,s1
    80003ff4:	02813083          	ld	ra,40(sp)
    80003ff8:	02013403          	ld	s0,32(sp)
    80003ffc:	01813483          	ld	s1,24(sp)
    80004000:	01013903          	ld	s2,16(sp)
    80004004:	00813983          	ld	s3,8(sp)
    80004008:	03010113          	addi	sp,sp,48
    8000400c:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80004010:	0004c703          	lbu	a4,0(s1)
    80004014:	0014c783          	lbu	a5,1(s1)
    80004018:	00879793          	slli	a5,a5,0x8
    8000401c:	00e7e7b3          	or	a5,a5,a4
    80004020:	0024c703          	lbu	a4,2(s1)
    80004024:	01071713          	slli	a4,a4,0x10
    80004028:	00f76733          	or	a4,a4,a5
    8000402c:	0034c783          	lbu	a5,3(s1)
    80004030:	01879793          	slli	a5,a5,0x18
    80004034:	00e7e733          	or	a4,a5,a4
    80004038:	0044c783          	lbu	a5,4(s1)
    8000403c:	02079793          	slli	a5,a5,0x20
    80004040:	00e7e7b3          	or	a5,a5,a4
    80004044:	0054c703          	lbu	a4,5(s1)
    80004048:	02871713          	slli	a4,a4,0x28
    8000404c:	00f76733          	or	a4,a4,a5
    80004050:	0064c783          	lbu	a5,6(s1)
    80004054:	03079793          	slli	a5,a5,0x30
    80004058:	00e7e733          	or	a4,a5,a4
    8000405c:	0074c783          	lbu	a5,7(s1)
    80004060:	03879793          	slli	a5,a5,0x38
    80004064:	00e7e7b3          	or	a5,a5,a4
    80004068:	00f9b023          	sd	a5,0(s3)
    8000406c:	da1ff06f          	j	80003e0c <_ZN11HeapManager12heapAllocateEm+0x3f4>

0000000080004070 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80004070:	ff010113          	addi	sp,sp,-16
    80004074:	00813423          	sd	s0,8(sp)
    80004078:	01010413          	addi	s0,sp,16
    //     if(pFree->pNext != 0){
    //         pFree->pNext->pPrev = pFree;
    //     }
    // }
    return 0;
}
    8000407c:	00000513          	li	a0,0
    80004080:	00813403          	ld	s0,8(sp)
    80004084:	01010113          	addi	sp,sp,16
    80004088:	00008067          	ret

000000008000408c <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"
#include "assert.h"

extern "C" void exceptionHandler(){
    8000408c:	fc010113          	addi	sp,sp,-64
    80004090:	02113c23          	sd	ra,56(sp)
    80004094:	02813823          	sd	s0,48(sp)
    80004098:	02913423          	sd	s1,40(sp)
    8000409c:	03213023          	sd	s2,32(sp)
    800040a0:	01313c23          	sd	s3,24(sp)
    800040a4:	01413823          	sd	s4,16(sp)
    800040a8:	01513423          	sd	s5,8(sp)
    800040ac:	01613023          	sd	s6,0(sp)
    800040b0:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    800040b4:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    800040b8:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    800040bc:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    800040c0:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    800040c4:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    800040c8:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    800040cc:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    800040d0:	141024f3          	csrr	s1,sepc



    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    800040d4:	ff870613          	addi	a2,a4,-8
    800040d8:	00100693          	li	a3,1
    800040dc:	04c6fc63          	bgeu	a3,a2,80004134 <exceptionHandler+0xa8>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    800040e0:	00500793          	li	a5,5
    800040e4:	22f70663          	beq	a4,a5,80004310 <exceptionHandler+0x284>
                putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    800040e8:	00700793          	li	a5,7
    800040ec:	3cf70e63          	beq	a4,a5,800044c8 <exceptionHandler+0x43c>
                putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    800040f0:	fff00793          	li	a5,-1
    800040f4:	03f79793          	slli	a5,a5,0x3f
    800040f8:	00178793          	addi	a5,a5,1
    800040fc:	58f70863          	beq	a4,a5,8000468c <exceptionHandler+0x600>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    80004100:	fff00793          	li	a5,-1
    80004104:	03f79793          	slli	a5,a5,0x3f
    80004108:	00978793          	addi	a5,a5,9
    8000410c:	0af71063          	bne	a4,a5,800041ac <exceptionHandler+0x120>
    {   
        int irq = plic_claim();
    80004110:	00005097          	auipc	ra,0x5
    80004114:	9a4080e7          	jalr	-1628(ra) # 80008ab4 <plic_claim>
    80004118:	00050493          	mv	s1,a0
        if(irq == CONSOLE_IRQ)Console::inputHandler();
    8000411c:	00a00793          	li	a5,10
    80004120:	5ef50263          	beq	a0,a5,80004704 <exceptionHandler+0x678>
        plic_complete(irq);
    80004124:	00048513          	mv	a0,s1
    80004128:	00005097          	auipc	ra,0x5
    8000412c:	9c4080e7          	jalr	-1596(ra) # 80008aec <plic_complete>
    80004130:	07c0006f          	j	800041ac <exceptionHandler+0x120>
        switch(a0){
    80004134:	04200713          	li	a4,66
    80004138:	02f76463          	bltu	a4,a5,80004160 <exceptionHandler+0xd4>
    8000413c:	1c078263          	beqz	a5,80004300 <exceptionHandler+0x274>
    80004140:	1cf76463          	bltu	a4,a5,80004308 <exceptionHandler+0x27c>
    80004144:	00279793          	slli	a5,a5,0x2
    80004148:	00007717          	auipc	a4,0x7
    8000414c:	17c70713          	addi	a4,a4,380 # 8000b2c4 <CONSOLE_STATUS+0x2b4>
    80004150:	00e787b3          	add	a5,a5,a4
    80004154:	0007a783          	lw	a5,0(a5)
    80004158:	00e787b3          	add	a5,a5,a4
    8000415c:	00078067          	jr	a5
    80004160:	0ff00713          	li	a4,255
    80004164:	02e79663          	bne	a5,a4,80004190 <exceptionHandler+0x104>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80004168:	00000793          	li	a5,0
    8000416c:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80004170:	00448493          	addi	s1,s1,4
    80004174:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004178:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    8000417c:	10000793          	li	a5,256
    80004180:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80004184:	00200793          	li	a5,2
    80004188:	1447b073          	csrc	sip,a5
                return;
    8000418c:	0200006f          	j	800041ac <exceptionHandler+0x120>
        switch(a0){
    80004190:	00000513          	li	a0,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80004194:	00050513          	mv	a0,a0
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80004198:	00448493          	addi	s1,s1,4
    8000419c:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800041a0:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800041a4:	00200793          	li	a5,2
    800041a8:	1447b073          	csrc	sip,a5
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    800041ac:	03813083          	ld	ra,56(sp)
    800041b0:	03013403          	ld	s0,48(sp)
    800041b4:	02813483          	ld	s1,40(sp)
    800041b8:	02013903          	ld	s2,32(sp)
    800041bc:	01813983          	ld	s3,24(sp)
    800041c0:	01013a03          	ld	s4,16(sp)
    800041c4:	00813a83          	ld	s5,8(sp)
    800041c8:	00013b03          	ld	s6,0(sp)
    800041cc:	04010113          	addi	sp,sp,64
    800041d0:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    800041d4:	00098593          	mv	a1,s3
    800041d8:	0000a797          	auipc	a5,0xa
    800041dc:	d307b783          	ld	a5,-720(a5) # 8000df08 <_GLOBAL_OFFSET_TABLE_+0x30>
    800041e0:	0007b503          	ld	a0,0(a5)
    800041e4:	00000097          	auipc	ra,0x0
    800041e8:	834080e7          	jalr	-1996(ra) # 80003a18 <_ZN11HeapManager12heapAllocateEm>
                break;
    800041ec:	fa9ff06f          	j	80004194 <exceptionHandler+0x108>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    800041f0:	00098593          	mv	a1,s3
    800041f4:	0000a797          	auipc	a5,0xa
    800041f8:	d147b783          	ld	a5,-748(a5) # 8000df08 <_GLOBAL_OFFSET_TABLE_+0x30>
    800041fc:	0007b503          	ld	a0,0(a5)
    80004200:	00000097          	auipc	ra,0x0
    80004204:	e70080e7          	jalr	-400(ra) # 80004070 <_ZN11HeapManager8heapFreeEPv>
                break;
    80004208:	f8dff06f          	j	80004194 <exceptionHandler+0x108>
                putc('\0'); /// removing this line causes everything to break
    8000420c:	00000513          	li	a0,0
    80004210:	ffffe097          	auipc	ra,0xffffe
    80004214:	86c080e7          	jalr	-1940(ra) # 80001a7c <_Z4putcc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    80004218:	00100713          	li	a4,1
    8000421c:	000b0693          	mv	a3,s6
    80004220:	000a8613          	mv	a2,s5
    80004224:	000a0593          	mv	a1,s4
    80004228:	00098513          	mv	a0,s3
    8000422c:	fffff097          	auipc	ra,0xfffff
    80004230:	e9c080e7          	jalr	-356(ra) # 800030c8 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    80004234:	f61ff06f          	j	80004194 <exceptionHandler+0x108>
                returnVal = _thread::currentThread->exit();
    80004238:	fffff097          	auipc	ra,0xfffff
    8000423c:	238080e7          	jalr	568(ra) # 80003470 <_ZN7_thread4exitEv>
                break;
    80004240:	f55ff06f          	j	80004194 <exceptionHandler+0x108>
                _thread::dispatch();
    80004244:	fffff097          	auipc	ra,0xfffff
    80004248:	43c080e7          	jalr	1084(ra) # 80003680 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    8000424c:	00000513          	li	a0,0
                break;
    80004250:	f45ff06f          	j	80004194 <exceptionHandler+0x108>
                _thread::currentThread->join((thread_t)a1);
    80004254:	00098593          	mv	a1,s3
    80004258:	0000a797          	auipc	a5,0xa
    8000425c:	cd07b783          	ld	a5,-816(a5) # 8000df28 <_GLOBAL_OFFSET_TABLE_+0x50>
    80004260:	0007b503          	ld	a0,0(a5)
    80004264:	fffff097          	auipc	ra,0xfffff
    80004268:	034080e7          	jalr	52(ra) # 80003298 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    8000426c:	00000513          	li	a0,0
                break;
    80004270:	f25ff06f          	j	80004194 <exceptionHandler+0x108>
                _sem::open((sem_t*)a1, unsigned(a2));
    80004274:	000a059b          	sext.w	a1,s4
    80004278:	00098513          	mv	a0,s3
    8000427c:	ffffe097          	auipc	ra,0xffffe
    80004280:	824080e7          	jalr	-2012(ra) # 80001aa0 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80004284:	00000513          	li	a0,0
                break;
    80004288:	f0dff06f          	j	80004194 <exceptionHandler+0x108>
                _sem::close((sem_t)a1);
    8000428c:	00098513          	mv	a0,s3
    80004290:	ffffe097          	auipc	ra,0xffffe
    80004294:	86c080e7          	jalr	-1940(ra) # 80001afc <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80004298:	00000513          	li	a0,0
                break;
    8000429c:	ef9ff06f          	j	80004194 <exceptionHandler+0x108>
                _sem::wait((sem_t)a1);
    800042a0:	00098513          	mv	a0,s3
    800042a4:	ffffe097          	auipc	ra,0xffffe
    800042a8:	8b8080e7          	jalr	-1864(ra) # 80001b5c <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    800042ac:	00000513          	li	a0,0
                break;
    800042b0:	ee5ff06f          	j	80004194 <exceptionHandler+0x108>
                _sem::signal((sem_t)a1);
    800042b4:	00098513          	mv	a0,s3
    800042b8:	ffffe097          	auipc	ra,0xffffe
    800042bc:	948080e7          	jalr	-1720(ra) # 80001c00 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    800042c0:	00000513          	li	a0,0
                break;
    800042c4:	ed1ff06f          	j	80004194 <exceptionHandler+0x108>
                returnVal = Timer::getInstance().sleep(a1);
    800042c8:	ffffd097          	auipc	ra,0xffffd
    800042cc:	374080e7          	jalr	884(ra) # 8000163c <_ZN5Timer11getInstanceEv>
    800042d0:	00098593          	mv	a1,s3
    800042d4:	ffffd097          	auipc	ra,0xffffd
    800042d8:	46c080e7          	jalr	1132(ra) # 80001740 <_ZN5Timer5sleepEm>
                break;
    800042dc:	eb9ff06f          	j	80004194 <exceptionHandler+0x108>
                returnVal = Console::getc();
    800042e0:	ffffe097          	auipc	ra,0xffffe
    800042e4:	2e4080e7          	jalr	740(ra) # 800025c4 <_ZN7Console4getcEv>
                break;
    800042e8:	eadff06f          	j	80004194 <exceptionHandler+0x108>
                Console::putc(a1);
    800042ec:	0ff9f513          	andi	a0,s3,255
    800042f0:	ffffe097          	auipc	ra,0xffffe
    800042f4:	294080e7          	jalr	660(ra) # 80002584 <_ZN7Console4putcEc>
    uint64 returnVal = 0;
    800042f8:	00000513          	li	a0,0
                break;
    800042fc:	e99ff06f          	j	80004194 <exceptionHandler+0x108>
        switch(a0){
    80004300:	00000513          	li	a0,0
    80004304:	e91ff06f          	j	80004194 <exceptionHandler+0x108>
    80004308:	00000513          	li	a0,0
    8000430c:	e89ff06f          	j	80004194 <exceptionHandler+0x108>
        putc('\n');
    80004310:	00a00513          	li	a0,10
    80004314:	ffffd097          	auipc	ra,0xffffd
    80004318:	768080e7          	jalr	1896(ra) # 80001a7c <_Z4putcc>
        putc('E');
    8000431c:	04500513          	li	a0,69
    80004320:	ffffd097          	auipc	ra,0xffffd
    80004324:	75c080e7          	jalr	1884(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004328:	07200513          	li	a0,114
    8000432c:	ffffd097          	auipc	ra,0xffffd
    80004330:	750080e7          	jalr	1872(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004334:	07200513          	li	a0,114
    80004338:	ffffd097          	auipc	ra,0xffffd
    8000433c:	744080e7          	jalr	1860(ra) # 80001a7c <_Z4putcc>
        putc('o');
    80004340:	06f00513          	li	a0,111
    80004344:	ffffd097          	auipc	ra,0xffffd
    80004348:	738080e7          	jalr	1848(ra) # 80001a7c <_Z4putcc>
        putc('r');
    8000434c:	07200513          	li	a0,114
    80004350:	ffffd097          	auipc	ra,0xffffd
    80004354:	72c080e7          	jalr	1836(ra) # 80001a7c <_Z4putcc>
        putc(':');
    80004358:	03a00513          	li	a0,58
    8000435c:	ffffd097          	auipc	ra,0xffffd
    80004360:	720080e7          	jalr	1824(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    80004364:	02000513          	li	a0,32
    80004368:	ffffd097          	auipc	ra,0xffffd
    8000436c:	714080e7          	jalr	1812(ra) # 80001a7c <_Z4putcc>
        putc('i');
    80004370:	06900513          	li	a0,105
    80004374:	ffffd097          	auipc	ra,0xffffd
    80004378:	708080e7          	jalr	1800(ra) # 80001a7c <_Z4putcc>
        putc('l');
    8000437c:	06c00513          	li	a0,108
    80004380:	ffffd097          	auipc	ra,0xffffd
    80004384:	6fc080e7          	jalr	1788(ra) # 80001a7c <_Z4putcc>
        putc('l');
    80004388:	06c00513          	li	a0,108
    8000438c:	ffffd097          	auipc	ra,0xffffd
    80004390:	6f0080e7          	jalr	1776(ra) # 80001a7c <_Z4putcc>
        putc('e');
    80004394:	06500513          	li	a0,101
    80004398:	ffffd097          	auipc	ra,0xffffd
    8000439c:	6e4080e7          	jalr	1764(ra) # 80001a7c <_Z4putcc>
        putc('g');
    800043a0:	06700513          	li	a0,103
    800043a4:	ffffd097          	auipc	ra,0xffffd
    800043a8:	6d8080e7          	jalr	1752(ra) # 80001a7c <_Z4putcc>
        putc('a');
    800043ac:	06100513          	li	a0,97
    800043b0:	ffffd097          	auipc	ra,0xffffd
    800043b4:	6cc080e7          	jalr	1740(ra) # 80001a7c <_Z4putcc>
        putc('l');
    800043b8:	06c00513          	li	a0,108
    800043bc:	ffffd097          	auipc	ra,0xffffd
    800043c0:	6c0080e7          	jalr	1728(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    800043c4:	02000513          	li	a0,32
    800043c8:	ffffd097          	auipc	ra,0xffffd
    800043cc:	6b4080e7          	jalr	1716(ra) # 80001a7c <_Z4putcc>
        putc('r');
    800043d0:	07200513          	li	a0,114
    800043d4:	ffffd097          	auipc	ra,0xffffd
    800043d8:	6a8080e7          	jalr	1704(ra) # 80001a7c <_Z4putcc>
        putc('e');
    800043dc:	06500513          	li	a0,101
    800043e0:	ffffd097          	auipc	ra,0xffffd
    800043e4:	69c080e7          	jalr	1692(ra) # 80001a7c <_Z4putcc>
        putc('a');
    800043e8:	06100513          	li	a0,97
    800043ec:	ffffd097          	auipc	ra,0xffffd
    800043f0:	690080e7          	jalr	1680(ra) # 80001a7c <_Z4putcc>
        putc('d');
    800043f4:	06400513          	li	a0,100
    800043f8:	ffffd097          	auipc	ra,0xffffd
    800043fc:	684080e7          	jalr	1668(ra) # 80001a7c <_Z4putcc>
        putc('!');
    80004400:	02100513          	li	a0,33
    80004404:	ffffd097          	auipc	ra,0xffffd
    80004408:	678080e7          	jalr	1656(ra) # 80001a7c <_Z4putcc>
        putc('\n');
    8000440c:	00a00513          	li	a0,10
    80004410:	ffffd097          	auipc	ra,0xffffd
    80004414:	66c080e7          	jalr	1644(ra) # 80001a7c <_Z4putcc>
        putc('P');
    80004418:	05000513          	li	a0,80
    8000441c:	ffffd097          	auipc	ra,0xffffd
    80004420:	660080e7          	jalr	1632(ra) # 80001a7c <_Z4putcc>
        putc('C');
    80004424:	04300513          	li	a0,67
    80004428:	ffffd097          	auipc	ra,0xffffd
    8000442c:	654080e7          	jalr	1620(ra) # 80001a7c <_Z4putcc>
        putc(':');
    80004430:	03a00513          	li	a0,58
    80004434:	ffffd097          	auipc	ra,0xffffd
    80004438:	648080e7          	jalr	1608(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    8000443c:	02000513          	li	a0,32
    80004440:	ffffd097          	auipc	ra,0xffffd
    80004444:	63c080e7          	jalr	1596(ra) # 80001a7c <_Z4putcc>
        putc('0');
    80004448:	03000513          	li	a0,48
    8000444c:	ffffd097          	auipc	ra,0xffffd
    80004450:	630080e7          	jalr	1584(ra) # 80001a7c <_Z4putcc>
        putc('x');
    80004454:	07800513          	li	a0,120
    80004458:	ffffd097          	auipc	ra,0xffffd
    8000445c:	624080e7          	jalr	1572(ra) # 80001a7c <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004460:	00f00913          	li	s2,15
    80004464:	0140006f          	j	80004478 <exceptionHandler+0x3ec>
                putc('A' + tmp - 10);
    80004468:	03750513          	addi	a0,a0,55
    8000446c:	ffffd097          	auipc	ra,0xffffd
    80004470:	610080e7          	jalr	1552(ra) # 80001a7c <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004474:	fff9091b          	addiw	s2,s2,-1
    80004478:	02094463          	bltz	s2,800044a0 <exceptionHandler+0x414>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    8000447c:	0029151b          	slliw	a0,s2,0x2
    80004480:	00a4d533          	srl	a0,s1,a0
    80004484:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004488:	00900793          	li	a5,9
    8000448c:	fca7eee3          	bltu	a5,a0,80004468 <exceptionHandler+0x3dc>
                putc('0' + tmp);
    80004490:	03050513          	addi	a0,a0,48
    80004494:	ffffd097          	auipc	ra,0xffffd
    80004498:	5e8080e7          	jalr	1512(ra) # 80001a7c <_Z4putcc>
    8000449c:	fd9ff06f          	j	80004474 <exceptionHandler+0x3e8>
        assert(false);
    800044a0:	00007697          	auipc	a3,0x7
    800044a4:	dc068693          	addi	a3,a3,-576 # 8000b260 <CONSOLE_STATUS+0x250>
    800044a8:	08600613          	li	a2,134
    800044ac:	00007597          	auipc	a1,0x7
    800044b0:	dcc58593          	addi	a1,a1,-564 # 8000b278 <CONSOLE_STATUS+0x268>
    800044b4:	00007517          	auipc	a0,0x7
    800044b8:	de450513          	addi	a0,a0,-540 # 8000b298 <CONSOLE_STATUS+0x288>
    800044bc:	ffffe097          	auipc	ra,0xffffe
    800044c0:	b70080e7          	jalr	-1168(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    800044c4:	ce9ff06f          	j	800041ac <exceptionHandler+0x120>
        putc('\n');
    800044c8:	00a00513          	li	a0,10
    800044cc:	ffffd097          	auipc	ra,0xffffd
    800044d0:	5b0080e7          	jalr	1456(ra) # 80001a7c <_Z4putcc>
        putc('E');
    800044d4:	04500513          	li	a0,69
    800044d8:	ffffd097          	auipc	ra,0xffffd
    800044dc:	5a4080e7          	jalr	1444(ra) # 80001a7c <_Z4putcc>
        putc('r');
    800044e0:	07200513          	li	a0,114
    800044e4:	ffffd097          	auipc	ra,0xffffd
    800044e8:	598080e7          	jalr	1432(ra) # 80001a7c <_Z4putcc>
        putc('r');
    800044ec:	07200513          	li	a0,114
    800044f0:	ffffd097          	auipc	ra,0xffffd
    800044f4:	58c080e7          	jalr	1420(ra) # 80001a7c <_Z4putcc>
        putc('o');
    800044f8:	06f00513          	li	a0,111
    800044fc:	ffffd097          	auipc	ra,0xffffd
    80004500:	580080e7          	jalr	1408(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004504:	07200513          	li	a0,114
    80004508:	ffffd097          	auipc	ra,0xffffd
    8000450c:	574080e7          	jalr	1396(ra) # 80001a7c <_Z4putcc>
        putc(':');
    80004510:	03a00513          	li	a0,58
    80004514:	ffffd097          	auipc	ra,0xffffd
    80004518:	568080e7          	jalr	1384(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    8000451c:	02000513          	li	a0,32
    80004520:	ffffd097          	auipc	ra,0xffffd
    80004524:	55c080e7          	jalr	1372(ra) # 80001a7c <_Z4putcc>
        putc('i');
    80004528:	06900513          	li	a0,105
    8000452c:	ffffd097          	auipc	ra,0xffffd
    80004530:	550080e7          	jalr	1360(ra) # 80001a7c <_Z4putcc>
        putc('l');
    80004534:	06c00513          	li	a0,108
    80004538:	ffffd097          	auipc	ra,0xffffd
    8000453c:	544080e7          	jalr	1348(ra) # 80001a7c <_Z4putcc>
        putc('l');
    80004540:	06c00513          	li	a0,108
    80004544:	ffffd097          	auipc	ra,0xffffd
    80004548:	538080e7          	jalr	1336(ra) # 80001a7c <_Z4putcc>
        putc('e');
    8000454c:	06500513          	li	a0,101
    80004550:	ffffd097          	auipc	ra,0xffffd
    80004554:	52c080e7          	jalr	1324(ra) # 80001a7c <_Z4putcc>
        putc('g');
    80004558:	06700513          	li	a0,103
    8000455c:	ffffd097          	auipc	ra,0xffffd
    80004560:	520080e7          	jalr	1312(ra) # 80001a7c <_Z4putcc>
        putc('a');
    80004564:	06100513          	li	a0,97
    80004568:	ffffd097          	auipc	ra,0xffffd
    8000456c:	514080e7          	jalr	1300(ra) # 80001a7c <_Z4putcc>
        putc('l');
    80004570:	06c00513          	li	a0,108
    80004574:	ffffd097          	auipc	ra,0xffffd
    80004578:	508080e7          	jalr	1288(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    8000457c:	02000513          	li	a0,32
    80004580:	ffffd097          	auipc	ra,0xffffd
    80004584:	4fc080e7          	jalr	1276(ra) # 80001a7c <_Z4putcc>
        putc('w');
    80004588:	07700513          	li	a0,119
    8000458c:	ffffd097          	auipc	ra,0xffffd
    80004590:	4f0080e7          	jalr	1264(ra) # 80001a7c <_Z4putcc>
        putc('r');
    80004594:	07200513          	li	a0,114
    80004598:	ffffd097          	auipc	ra,0xffffd
    8000459c:	4e4080e7          	jalr	1252(ra) # 80001a7c <_Z4putcc>
        putc('i');
    800045a0:	06900513          	li	a0,105
    800045a4:	ffffd097          	auipc	ra,0xffffd
    800045a8:	4d8080e7          	jalr	1240(ra) # 80001a7c <_Z4putcc>
        putc('t');
    800045ac:	07400513          	li	a0,116
    800045b0:	ffffd097          	auipc	ra,0xffffd
    800045b4:	4cc080e7          	jalr	1228(ra) # 80001a7c <_Z4putcc>
        putc('e');
    800045b8:	06500513          	li	a0,101
    800045bc:	ffffd097          	auipc	ra,0xffffd
    800045c0:	4c0080e7          	jalr	1216(ra) # 80001a7c <_Z4putcc>
        putc('!');
    800045c4:	02100513          	li	a0,33
    800045c8:	ffffd097          	auipc	ra,0xffffd
    800045cc:	4b4080e7          	jalr	1204(ra) # 80001a7c <_Z4putcc>
        putc('\n');
    800045d0:	00a00513          	li	a0,10
    800045d4:	ffffd097          	auipc	ra,0xffffd
    800045d8:	4a8080e7          	jalr	1192(ra) # 80001a7c <_Z4putcc>
        putc('P');
    800045dc:	05000513          	li	a0,80
    800045e0:	ffffd097          	auipc	ra,0xffffd
    800045e4:	49c080e7          	jalr	1180(ra) # 80001a7c <_Z4putcc>
        putc('C');
    800045e8:	04300513          	li	a0,67
    800045ec:	ffffd097          	auipc	ra,0xffffd
    800045f0:	490080e7          	jalr	1168(ra) # 80001a7c <_Z4putcc>
        putc(':');
    800045f4:	03a00513          	li	a0,58
    800045f8:	ffffd097          	auipc	ra,0xffffd
    800045fc:	484080e7          	jalr	1156(ra) # 80001a7c <_Z4putcc>
        putc(' ');
    80004600:	02000513          	li	a0,32
    80004604:	ffffd097          	auipc	ra,0xffffd
    80004608:	478080e7          	jalr	1144(ra) # 80001a7c <_Z4putcc>
        putc('0');
    8000460c:	03000513          	li	a0,48
    80004610:	ffffd097          	auipc	ra,0xffffd
    80004614:	46c080e7          	jalr	1132(ra) # 80001a7c <_Z4putcc>
        putc('x');
    80004618:	07800513          	li	a0,120
    8000461c:	ffffd097          	auipc	ra,0xffffd
    80004620:	460080e7          	jalr	1120(ra) # 80001a7c <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004624:	00f00913          	li	s2,15
    80004628:	0140006f          	j	8000463c <exceptionHandler+0x5b0>
                putc('A' + tmp - 10);
    8000462c:	03750513          	addi	a0,a0,55
    80004630:	ffffd097          	auipc	ra,0xffffd
    80004634:	44c080e7          	jalr	1100(ra) # 80001a7c <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004638:	fff9091b          	addiw	s2,s2,-1
    8000463c:	02094463          	bltz	s2,80004664 <exceptionHandler+0x5d8>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80004640:	0029151b          	slliw	a0,s2,0x2
    80004644:	00a4d533          	srl	a0,s1,a0
    80004648:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    8000464c:	00900793          	li	a5,9
    80004650:	fca7eee3          	bltu	a5,a0,8000462c <exceptionHandler+0x5a0>
                putc('0' + tmp);
    80004654:	03050513          	addi	a0,a0,48
    80004658:	ffffd097          	auipc	ra,0xffffd
    8000465c:	424080e7          	jalr	1060(ra) # 80001a7c <_Z4putcc>
    80004660:	fd9ff06f          	j	80004638 <exceptionHandler+0x5ac>
        assert(false);
    80004664:	00007697          	auipc	a3,0x7
    80004668:	bfc68693          	addi	a3,a3,-1028 # 8000b260 <CONSOLE_STATUS+0x250>
    8000466c:	0ae00613          	li	a2,174
    80004670:	00007597          	auipc	a1,0x7
    80004674:	c0858593          	addi	a1,a1,-1016 # 8000b278 <CONSOLE_STATUS+0x268>
    80004678:	00007517          	auipc	a0,0x7
    8000467c:	c2050513          	addi	a0,a0,-992 # 8000b298 <CONSOLE_STATUS+0x288>
    80004680:	ffffe097          	auipc	ra,0xffffe
    80004684:	9ac080e7          	jalr	-1620(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80004688:	b25ff06f          	j	800041ac <exceptionHandler+0x120>
        putc('t');
    8000468c:	07400513          	li	a0,116
    80004690:	ffffd097          	auipc	ra,0xffffd
    80004694:	3ec080e7          	jalr	1004(ra) # 80001a7c <_Z4putcc>
        Console::outputHandler();
    80004698:	ffffe097          	auipc	ra,0xffffe
    8000469c:	f7c080e7          	jalr	-132(ra) # 80002614 <_ZN7Console13outputHandlerEv>
        Timer::getInstance().tick();
    800046a0:	ffffd097          	auipc	ra,0xffffd
    800046a4:	f9c080e7          	jalr	-100(ra) # 8000163c <_ZN5Timer11getInstanceEv>
    800046a8:	ffffd097          	auipc	ra,0xffffd
    800046ac:	ff8080e7          	jalr	-8(ra) # 800016a0 <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    800046b0:	0000a797          	auipc	a5,0xa
    800046b4:	8787b783          	ld	a5,-1928(a5) # 8000df28 <_GLOBAL_OFFSET_TABLE_+0x50>
    800046b8:	0007b503          	ld	a0,0(a5)
    800046bc:	fffff097          	auipc	ra,0xfffff
    800046c0:	d00080e7          	jalr	-768(ra) # 800033bc <_ZN7_thread4tickEv>
    800046c4:	00051c63          	bnez	a0,800046dc <exceptionHandler+0x650>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    800046c8:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800046cc:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800046d0:	00200793          	li	a5,2
    800046d4:	1447b073          	csrc	sip,a5
    800046d8:	ad5ff06f          	j	800041ac <exceptionHandler+0x120>
        assert(_thread::currentThread->tick() == 0);
    800046dc:	00007697          	auipc	a3,0x7
    800046e0:	b8468693          	addi	a3,a3,-1148 # 8000b260 <CONSOLE_STATUS+0x250>
    800046e4:	0b400613          	li	a2,180
    800046e8:	00007597          	auipc	a1,0x7
    800046ec:	b9058593          	addi	a1,a1,-1136 # 8000b278 <CONSOLE_STATUS+0x268>
    800046f0:	00007517          	auipc	a0,0x7
    800046f4:	bb050513          	addi	a0,a0,-1104 # 8000b2a0 <CONSOLE_STATUS+0x290>
    800046f8:	ffffe097          	auipc	ra,0xffffe
    800046fc:	934080e7          	jalr	-1740(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    80004700:	fc9ff06f          	j	800046c8 <exceptionHandler+0x63c>
        if(irq == CONSOLE_IRQ)Console::inputHandler();
    80004704:	ffffe097          	auipc	ra,0xffffe
    80004708:	fbc080e7          	jalr	-68(ra) # 800026c0 <_ZN7Console12inputHandlerEv>
    8000470c:	a19ff06f          	j	80004124 <exceptionHandler+0x98>

0000000080004710 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80004710:	fe010113          	addi	sp,sp,-32
    80004714:	00113c23          	sd	ra,24(sp)
    80004718:	00813823          	sd	s0,16(sp)
    8000471c:	00913423          	sd	s1,8(sp)
    80004720:	02010413          	addi	s0,sp,32
    80004724:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80004728:	0000a797          	auipc	a5,0xa
    8000472c:	8807b783          	ld	a5,-1920(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004730:	02079463          	bnez	a5,80004758 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80004734:	0000a797          	auipc	a5,0xa
    80004738:	8697ba23          	sd	s1,-1932(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    head = 0;
    8000473c:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80004740:	0004b423          	sd	zero,8(s1)
}
    80004744:	01813083          	ld	ra,24(sp)
    80004748:	01013403          	ld	s0,16(sp)
    8000474c:	00813483          	ld	s1,8(sp)
    80004750:	02010113          	addi	sp,sp,32
    80004754:	00008067          	ret
    assert(singleton == 0);
    80004758:	00007697          	auipc	a3,0x7
    8000475c:	c7868693          	addi	a3,a3,-904 # 8000b3d0 <CONSOLE_STATUS+0x3c0>
    80004760:	01800613          	li	a2,24
    80004764:	00007597          	auipc	a1,0x7
    80004768:	c8458593          	addi	a1,a1,-892 # 8000b3e8 <CONSOLE_STATUS+0x3d8>
    8000476c:	00007517          	auipc	a0,0x7
    80004770:	c8c50513          	addi	a0,a0,-884 # 8000b3f8 <CONSOLE_STATUS+0x3e8>
    80004774:	ffffe097          	auipc	ra,0xffffe
    80004778:	8b8080e7          	jalr	-1864(ra) # 8000202c <_Z13assert_failedPKcS0_jS0_>
    8000477c:	fb9ff06f          	j	80004734 <_ZN9SchedulerC1Ev+0x24>

0000000080004780 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80004780:	ff010113          	addi	sp,sp,-16
    80004784:	00813423          	sd	s0,8(sp)
    80004788:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    8000478c:	0000a797          	auipc	a5,0xa
    80004790:	81c7b783          	ld	a5,-2020(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004794:	0007b503          	ld	a0,0(a5)
}
    80004798:	00153513          	seqz	a0,a0
    8000479c:	00813403          	ld	s0,8(sp)
    800047a0:	01010113          	addi	sp,sp,16
    800047a4:	00008067          	ret

00000000800047a8 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    800047a8:	fe010113          	addi	sp,sp,-32
    800047ac:	00113c23          	sd	ra,24(sp)
    800047b0:	00813823          	sd	s0,16(sp)
    800047b4:	00913423          	sd	s1,8(sp)
    800047b8:	01213023          	sd	s2,0(sp)
    800047bc:	02010413          	addi	s0,sp,32
    800047c0:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    800047c4:	00009917          	auipc	s2,0x9
    800047c8:	7e493903          	ld	s2,2020(s2) # 8000dfa8 <_ZN9Scheduler9singletonE>
    800047cc:	00093783          	ld	a5,0(s2)
    800047d0:	12078c63          	beqz	a5,80004908 <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    800047d4:	00893903          	ld	s2,8(s2)
    800047d8:	01000513          	li	a0,16
    800047dc:	ffffd097          	auipc	ra,0xffffd
    800047e0:	054080e7          	jalr	84(ra) # 80001830 <_Z9mem_allocm>
    800047e4:	00a90423          	sb	a0,8(s2)
    800047e8:	00855793          	srli	a5,a0,0x8
    800047ec:	00f904a3          	sb	a5,9(s2)
    800047f0:	01055793          	srli	a5,a0,0x10
    800047f4:	00f90523          	sb	a5,10(s2)
    800047f8:	0185579b          	srliw	a5,a0,0x18
    800047fc:	00f905a3          	sb	a5,11(s2)
    80004800:	02055793          	srli	a5,a0,0x20
    80004804:	00f90623          	sb	a5,12(s2)
    80004808:	02855793          	srli	a5,a0,0x28
    8000480c:	00f906a3          	sb	a5,13(s2)
    80004810:	03055793          	srli	a5,a0,0x30
    80004814:	00f90723          	sb	a5,14(s2)
    80004818:	03855513          	srli	a0,a0,0x38
    8000481c:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80004820:	00009617          	auipc	a2,0x9
    80004824:	78860613          	addi	a2,a2,1928 # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004828:	00063583          	ld	a1,0(a2)
    8000482c:	0085b703          	ld	a4,8(a1)
    80004830:	00874783          	lbu	a5,8(a4)
    80004834:	00974683          	lbu	a3,9(a4)
    80004838:	00869693          	slli	a3,a3,0x8
    8000483c:	00f6e6b3          	or	a3,a3,a5
    80004840:	00a74783          	lbu	a5,10(a4)
    80004844:	01079793          	slli	a5,a5,0x10
    80004848:	00d7e6b3          	or	a3,a5,a3
    8000484c:	00b74783          	lbu	a5,11(a4)
    80004850:	01879793          	slli	a5,a5,0x18
    80004854:	00d7e7b3          	or	a5,a5,a3
    80004858:	00c74683          	lbu	a3,12(a4)
    8000485c:	02069693          	slli	a3,a3,0x20
    80004860:	00f6e7b3          	or	a5,a3,a5
    80004864:	00d74683          	lbu	a3,13(a4)
    80004868:	02869693          	slli	a3,a3,0x28
    8000486c:	00f6e6b3          	or	a3,a3,a5
    80004870:	00e74783          	lbu	a5,14(a4)
    80004874:	03079793          	slli	a5,a5,0x30
    80004878:	00d7e6b3          	or	a3,a5,a3
    8000487c:	00f74783          	lbu	a5,15(a4)
    80004880:	03879793          	slli	a5,a5,0x38
    80004884:	00d7e7b3          	or	a5,a5,a3
    80004888:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    8000488c:	00978023          	sb	s1,0(a5)
    80004890:	0084d713          	srli	a4,s1,0x8
    80004894:	00e780a3          	sb	a4,1(a5)
    80004898:	0104d713          	srli	a4,s1,0x10
    8000489c:	00e78123          	sb	a4,2(a5)
    800048a0:	0184d71b          	srliw	a4,s1,0x18
    800048a4:	00e781a3          	sb	a4,3(a5)
    800048a8:	0204d713          	srli	a4,s1,0x20
    800048ac:	00e78223          	sb	a4,4(a5)
    800048b0:	0284d713          	srli	a4,s1,0x28
    800048b4:	00e782a3          	sb	a4,5(a5)
    800048b8:	0304d713          	srli	a4,s1,0x30
    800048bc:	00e78323          	sb	a4,6(a5)
    800048c0:	0384d493          	srli	s1,s1,0x38
    800048c4:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    800048c8:	00063783          	ld	a5,0(a2)
    800048cc:	0087b783          	ld	a5,8(a5)
    800048d0:	00078423          	sb	zero,8(a5)
    800048d4:	000784a3          	sb	zero,9(a5)
    800048d8:	00078523          	sb	zero,10(a5)
    800048dc:	000785a3          	sb	zero,11(a5)
    800048e0:	00078623          	sb	zero,12(a5)
    800048e4:	000786a3          	sb	zero,13(a5)
    800048e8:	00078723          	sb	zero,14(a5)
    800048ec:	000787a3          	sb	zero,15(a5)
    }
}
    800048f0:	01813083          	ld	ra,24(sp)
    800048f4:	01013403          	ld	s0,16(sp)
    800048f8:	00813483          	ld	s1,8(sp)
    800048fc:	00013903          	ld	s2,0(sp)
    80004900:	02010113          	addi	sp,sp,32
    80004904:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80004908:	01000513          	li	a0,16
    8000490c:	ffffd097          	auipc	ra,0xffffd
    80004910:	f24080e7          	jalr	-220(ra) # 80001830 <_Z9mem_allocm>
    80004914:	00a93423          	sd	a0,8(s2)
    80004918:	00009717          	auipc	a4,0x9
    8000491c:	69070713          	addi	a4,a4,1680 # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004920:	00073783          	ld	a5,0(a4)
    80004924:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80004928:	00073783          	ld	a5,0(a4)
    8000492c:	0007b783          	ld	a5,0(a5)
    80004930:	00978023          	sb	s1,0(a5)
    80004934:	0084d693          	srli	a3,s1,0x8
    80004938:	00d780a3          	sb	a3,1(a5)
    8000493c:	0104d693          	srli	a3,s1,0x10
    80004940:	00d78123          	sb	a3,2(a5)
    80004944:	0184d69b          	srliw	a3,s1,0x18
    80004948:	00d781a3          	sb	a3,3(a5)
    8000494c:	0204d693          	srli	a3,s1,0x20
    80004950:	00d78223          	sb	a3,4(a5)
    80004954:	0284d693          	srli	a3,s1,0x28
    80004958:	00d782a3          	sb	a3,5(a5)
    8000495c:	0304d693          	srli	a3,s1,0x30
    80004960:	00d78323          	sb	a3,6(a5)
    80004964:	0384d493          	srli	s1,s1,0x38
    80004968:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    8000496c:	00073783          	ld	a5,0(a4)
    80004970:	0007b783          	ld	a5,0(a5)
    80004974:	00078423          	sb	zero,8(a5)
    80004978:	000784a3          	sb	zero,9(a5)
    8000497c:	00078523          	sb	zero,10(a5)
    80004980:	000785a3          	sb	zero,11(a5)
    80004984:	00078623          	sb	zero,12(a5)
    80004988:	000786a3          	sb	zero,13(a5)
    8000498c:	00078723          	sb	zero,14(a5)
    80004990:	000787a3          	sb	zero,15(a5)
    80004994:	f5dff06f          	j	800048f0 <_ZN9Scheduler3putEP7_thread+0x148>

0000000080004998 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80004998:	fe010113          	addi	sp,sp,-32
    8000499c:	00113c23          	sd	ra,24(sp)
    800049a0:	00813823          	sd	s0,16(sp)
    800049a4:	00913423          	sd	s1,8(sp)
    800049a8:	02010413          	addi	s0,sp,32
    ThreadList* tmp = singleton->head;
    800049ac:	00009697          	auipc	a3,0x9
    800049b0:	5fc6b683          	ld	a3,1532(a3) # 8000dfa8 <_ZN9Scheduler9singletonE>
    800049b4:	0006b503          	ld	a0,0(a3)
    if(tmp == 0){
    800049b8:	0e050863          	beqz	a0,80004aa8 <_ZN9Scheduler3getEv+0x110>
        return 0;
    }
    thread_t thread = tmp->thread;
    800049bc:	00054483          	lbu	s1,0(a0)
    800049c0:	00154783          	lbu	a5,1(a0)
    800049c4:	00879793          	slli	a5,a5,0x8
    800049c8:	0097e7b3          	or	a5,a5,s1
    800049cc:	00254483          	lbu	s1,2(a0)
    800049d0:	01049493          	slli	s1,s1,0x10
    800049d4:	00f4e7b3          	or	a5,s1,a5
    800049d8:	00354483          	lbu	s1,3(a0)
    800049dc:	01849493          	slli	s1,s1,0x18
    800049e0:	00f4e4b3          	or	s1,s1,a5
    800049e4:	00454783          	lbu	a5,4(a0)
    800049e8:	02079793          	slli	a5,a5,0x20
    800049ec:	0097e4b3          	or	s1,a5,s1
    800049f0:	00554783          	lbu	a5,5(a0)
    800049f4:	02879793          	slli	a5,a5,0x28
    800049f8:	0097e7b3          	or	a5,a5,s1
    800049fc:	00654483          	lbu	s1,6(a0)
    80004a00:	03049493          	slli	s1,s1,0x30
    80004a04:	00f4e7b3          	or	a5,s1,a5
    80004a08:	00754483          	lbu	s1,7(a0)
    80004a0c:	03849493          	slli	s1,s1,0x38
    80004a10:	00f4e4b3          	or	s1,s1,a5
    singleton->head = tmp->next;
    80004a14:	00854783          	lbu	a5,8(a0)
    80004a18:	00954703          	lbu	a4,9(a0)
    80004a1c:	00871713          	slli	a4,a4,0x8
    80004a20:	00f76733          	or	a4,a4,a5
    80004a24:	00a54783          	lbu	a5,10(a0)
    80004a28:	01079793          	slli	a5,a5,0x10
    80004a2c:	00e7e733          	or	a4,a5,a4
    80004a30:	00b54783          	lbu	a5,11(a0)
    80004a34:	01879793          	slli	a5,a5,0x18
    80004a38:	00e7e7b3          	or	a5,a5,a4
    80004a3c:	00c54703          	lbu	a4,12(a0)
    80004a40:	02071713          	slli	a4,a4,0x20
    80004a44:	00f767b3          	or	a5,a4,a5
    80004a48:	00d54703          	lbu	a4,13(a0)
    80004a4c:	02871713          	slli	a4,a4,0x28
    80004a50:	00f76733          	or	a4,a4,a5
    80004a54:	00e54783          	lbu	a5,14(a0)
    80004a58:	03079793          	slli	a5,a5,0x30
    80004a5c:	00e7e733          	or	a4,a5,a4
    80004a60:	00f54783          	lbu	a5,15(a0)
    80004a64:	03879793          	slli	a5,a5,0x38
    80004a68:	00e7e7b3          	or	a5,a5,a4
    80004a6c:	00f6b023          	sd	a5,0(a3)
    if(singleton->head == 0){
    80004a70:	00009797          	auipc	a5,0x9
    80004a74:	5387b783          	ld	a5,1336(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004a78:	0007b703          	ld	a4,0(a5)
    80004a7c:	02070263          	beqz	a4,80004aa0 <_ZN9Scheduler3getEv+0x108>
        singleton->tail = 0;
    }
    mem_free(tmp);
    80004a80:	ffffd097          	auipc	ra,0xffffd
    80004a84:	de0080e7          	jalr	-544(ra) # 80001860 <_Z8mem_freePv>
    return thread;
}
    80004a88:	00048513          	mv	a0,s1
    80004a8c:	01813083          	ld	ra,24(sp)
    80004a90:	01013403          	ld	s0,16(sp)
    80004a94:	00813483          	ld	s1,8(sp)
    80004a98:	02010113          	addi	sp,sp,32
    80004a9c:	00008067          	ret
        singleton->tail = 0;
    80004aa0:	0007b423          	sd	zero,8(a5)
    80004aa4:	fddff06f          	j	80004a80 <_ZN9Scheduler3getEv+0xe8>
        return 0;
    80004aa8:	00050493          	mv	s1,a0
    80004aac:	fddff06f          	j	80004a88 <_ZN9Scheduler3getEv+0xf0>

0000000080004ab0 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80004ab0:	ff010113          	addi	sp,sp,-16
    80004ab4:	00813423          	sd	s0,8(sp)
    80004ab8:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80004abc:	00009797          	auipc	a5,0x9
    80004ac0:	4ec7b783          	ld	a5,1260(a5) # 8000dfa8 <_ZN9Scheduler9singletonE>
    80004ac4:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80004ac8:	00000513          	li	a0,0
    while(tmp != 0){
    80004acc:	06078263          	beqz	a5,80004b30 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80004ad0:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80004ad4:	0087c683          	lbu	a3,8(a5)
    80004ad8:	0097c703          	lbu	a4,9(a5)
    80004adc:	00871713          	slli	a4,a4,0x8
    80004ae0:	00d766b3          	or	a3,a4,a3
    80004ae4:	00a7c703          	lbu	a4,10(a5)
    80004ae8:	01071713          	slli	a4,a4,0x10
    80004aec:	00d76733          	or	a4,a4,a3
    80004af0:	00b7c683          	lbu	a3,11(a5)
    80004af4:	01869693          	slli	a3,a3,0x18
    80004af8:	00e6e733          	or	a4,a3,a4
    80004afc:	00c7c683          	lbu	a3,12(a5)
    80004b00:	02069693          	slli	a3,a3,0x20
    80004b04:	00e6e6b3          	or	a3,a3,a4
    80004b08:	00d7c703          	lbu	a4,13(a5)
    80004b0c:	02871713          	slli	a4,a4,0x28
    80004b10:	00d766b3          	or	a3,a4,a3
    80004b14:	00e7c703          	lbu	a4,14(a5)
    80004b18:	03071713          	slli	a4,a4,0x30
    80004b1c:	00d76733          	or	a4,a4,a3
    80004b20:	00f7c783          	lbu	a5,15(a5)
    80004b24:	03879793          	slli	a5,a5,0x38
    80004b28:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80004b2c:	fa1ff06f          	j	80004acc <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80004b30:	00813403          	ld	s0,8(sp)
    80004b34:	01010113          	addi	sp,sp,16
    80004b38:	00008067          	ret

0000000080004b3c <_ZN6BufferC1Ei>:
#include "../test_h/buffer.h"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004b3c:	fe010113          	addi	sp,sp,-32
    80004b40:	00113c23          	sd	ra,24(sp)
    80004b44:	00813823          	sd	s0,16(sp)
    80004b48:	00913423          	sd	s1,8(sp)
    80004b4c:	01213023          	sd	s2,0(sp)
    80004b50:	02010413          	addi	s0,sp,32
    80004b54:	00050493          	mv	s1,a0
    80004b58:	00058913          	mv	s2,a1
    80004b5c:	0015879b          	addiw	a5,a1,1
    80004b60:	0007851b          	sext.w	a0,a5
    80004b64:	00f4a023          	sw	a5,0(s1)
    80004b68:	0004a823          	sw	zero,16(s1)
    80004b6c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004b70:	00251513          	slli	a0,a0,0x2
    80004b74:	ffffd097          	auipc	ra,0xffffd
    80004b78:	cbc080e7          	jalr	-836(ra) # 80001830 <_Z9mem_allocm>
    80004b7c:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80004b80:	00000593          	li	a1,0
    80004b84:	02048513          	addi	a0,s1,32
    80004b88:	ffffd097          	auipc	ra,0xffffd
    80004b8c:	e10080e7          	jalr	-496(ra) # 80001998 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80004b90:	00090593          	mv	a1,s2
    80004b94:	01848513          	addi	a0,s1,24
    80004b98:	ffffd097          	auipc	ra,0xffffd
    80004b9c:	e00080e7          	jalr	-512(ra) # 80001998 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80004ba0:	00100593          	li	a1,1
    80004ba4:	02848513          	addi	a0,s1,40
    80004ba8:	ffffd097          	auipc	ra,0xffffd
    80004bac:	df0080e7          	jalr	-528(ra) # 80001998 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80004bb0:	00100593          	li	a1,1
    80004bb4:	03048513          	addi	a0,s1,48
    80004bb8:	ffffd097          	auipc	ra,0xffffd
    80004bbc:	de0080e7          	jalr	-544(ra) # 80001998 <_Z8sem_openPP4_semj>
}
    80004bc0:	01813083          	ld	ra,24(sp)
    80004bc4:	01013403          	ld	s0,16(sp)
    80004bc8:	00813483          	ld	s1,8(sp)
    80004bcc:	00013903          	ld	s2,0(sp)
    80004bd0:	02010113          	addi	sp,sp,32
    80004bd4:	00008067          	ret

0000000080004bd8 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80004bd8:	fe010113          	addi	sp,sp,-32
    80004bdc:	00113c23          	sd	ra,24(sp)
    80004be0:	00813823          	sd	s0,16(sp)
    80004be4:	00913423          	sd	s1,8(sp)
    80004be8:	01213023          	sd	s2,0(sp)
    80004bec:	02010413          	addi	s0,sp,32
    80004bf0:	00050493          	mv	s1,a0
    80004bf4:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80004bf8:	01853503          	ld	a0,24(a0)
    80004bfc:	ffffd097          	auipc	ra,0xffffd
    80004c00:	e00080e7          	jalr	-512(ra) # 800019fc <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80004c04:	0304b503          	ld	a0,48(s1)
    80004c08:	ffffd097          	auipc	ra,0xffffd
    80004c0c:	df4080e7          	jalr	-524(ra) # 800019fc <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80004c10:	0084b783          	ld	a5,8(s1)
    80004c14:	0144a703          	lw	a4,20(s1)
    80004c18:	00271713          	slli	a4,a4,0x2
    80004c1c:	00e787b3          	add	a5,a5,a4
    80004c20:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004c24:	0144a783          	lw	a5,20(s1)
    80004c28:	0017879b          	addiw	a5,a5,1
    80004c2c:	0004a703          	lw	a4,0(s1)
    80004c30:	02e7e7bb          	remw	a5,a5,a4
    80004c34:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80004c38:	0304b503          	ld	a0,48(s1)
    80004c3c:	ffffd097          	auipc	ra,0xffffd
    80004c40:	dec080e7          	jalr	-532(ra) # 80001a28 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80004c44:	0204b503          	ld	a0,32(s1)
    80004c48:	ffffd097          	auipc	ra,0xffffd
    80004c4c:	de0080e7          	jalr	-544(ra) # 80001a28 <_Z10sem_signalP4_sem>

}
    80004c50:	01813083          	ld	ra,24(sp)
    80004c54:	01013403          	ld	s0,16(sp)
    80004c58:	00813483          	ld	s1,8(sp)
    80004c5c:	00013903          	ld	s2,0(sp)
    80004c60:	02010113          	addi	sp,sp,32
    80004c64:	00008067          	ret

0000000080004c68 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80004c68:	fe010113          	addi	sp,sp,-32
    80004c6c:	00113c23          	sd	ra,24(sp)
    80004c70:	00813823          	sd	s0,16(sp)
    80004c74:	00913423          	sd	s1,8(sp)
    80004c78:	01213023          	sd	s2,0(sp)
    80004c7c:	02010413          	addi	s0,sp,32
    80004c80:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80004c84:	02053503          	ld	a0,32(a0)
    80004c88:	ffffd097          	auipc	ra,0xffffd
    80004c8c:	d74080e7          	jalr	-652(ra) # 800019fc <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80004c90:	0284b503          	ld	a0,40(s1)
    80004c94:	ffffd097          	auipc	ra,0xffffd
    80004c98:	d68080e7          	jalr	-664(ra) # 800019fc <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80004c9c:	0084b703          	ld	a4,8(s1)
    80004ca0:	0104a783          	lw	a5,16(s1)
    80004ca4:	00279693          	slli	a3,a5,0x2
    80004ca8:	00d70733          	add	a4,a4,a3
    80004cac:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004cb0:	0017879b          	addiw	a5,a5,1
    80004cb4:	0004a703          	lw	a4,0(s1)
    80004cb8:	02e7e7bb          	remw	a5,a5,a4
    80004cbc:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80004cc0:	0284b503          	ld	a0,40(s1)
    80004cc4:	ffffd097          	auipc	ra,0xffffd
    80004cc8:	d64080e7          	jalr	-668(ra) # 80001a28 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80004ccc:	0184b503          	ld	a0,24(s1)
    80004cd0:	ffffd097          	auipc	ra,0xffffd
    80004cd4:	d58080e7          	jalr	-680(ra) # 80001a28 <_Z10sem_signalP4_sem>

    return ret;
}
    80004cd8:	00090513          	mv	a0,s2
    80004cdc:	01813083          	ld	ra,24(sp)
    80004ce0:	01013403          	ld	s0,16(sp)
    80004ce4:	00813483          	ld	s1,8(sp)
    80004ce8:	00013903          	ld	s2,0(sp)
    80004cec:	02010113          	addi	sp,sp,32
    80004cf0:	00008067          	ret

0000000080004cf4 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80004cf4:	fe010113          	addi	sp,sp,-32
    80004cf8:	00113c23          	sd	ra,24(sp)
    80004cfc:	00813823          	sd	s0,16(sp)
    80004d00:	00913423          	sd	s1,8(sp)
    80004d04:	01213023          	sd	s2,0(sp)
    80004d08:	02010413          	addi	s0,sp,32
    80004d0c:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80004d10:	02853503          	ld	a0,40(a0)
    80004d14:	ffffd097          	auipc	ra,0xffffd
    80004d18:	ce8080e7          	jalr	-792(ra) # 800019fc <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80004d1c:	0304b503          	ld	a0,48(s1)
    80004d20:	ffffd097          	auipc	ra,0xffffd
    80004d24:	cdc080e7          	jalr	-804(ra) # 800019fc <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80004d28:	0144a783          	lw	a5,20(s1)
    80004d2c:	0104a903          	lw	s2,16(s1)
    80004d30:	0327ce63          	blt	a5,s2,80004d6c <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80004d34:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80004d38:	0304b503          	ld	a0,48(s1)
    80004d3c:	ffffd097          	auipc	ra,0xffffd
    80004d40:	cec080e7          	jalr	-788(ra) # 80001a28 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80004d44:	0284b503          	ld	a0,40(s1)
    80004d48:	ffffd097          	auipc	ra,0xffffd
    80004d4c:	ce0080e7          	jalr	-800(ra) # 80001a28 <_Z10sem_signalP4_sem>

    return ret;
}
    80004d50:	00090513          	mv	a0,s2
    80004d54:	01813083          	ld	ra,24(sp)
    80004d58:	01013403          	ld	s0,16(sp)
    80004d5c:	00813483          	ld	s1,8(sp)
    80004d60:	00013903          	ld	s2,0(sp)
    80004d64:	02010113          	addi	sp,sp,32
    80004d68:	00008067          	ret
        ret = cap - head + tail;
    80004d6c:	0004a703          	lw	a4,0(s1)
    80004d70:	4127093b          	subw	s2,a4,s2
    80004d74:	00f9093b          	addw	s2,s2,a5
    80004d78:	fc1ff06f          	j	80004d38 <_ZN6Buffer6getCntEv+0x44>

0000000080004d7c <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80004d7c:	fe010113          	addi	sp,sp,-32
    80004d80:	00113c23          	sd	ra,24(sp)
    80004d84:	00813823          	sd	s0,16(sp)
    80004d88:	00913423          	sd	s1,8(sp)
    80004d8c:	02010413          	addi	s0,sp,32
    80004d90:	00050493          	mv	s1,a0
    putc('\n');
    80004d94:	00a00513          	li	a0,10
    80004d98:	ffffd097          	auipc	ra,0xffffd
    80004d9c:	ce4080e7          	jalr	-796(ra) # 80001a7c <_Z4putcc>
    printString("Buffer deleted!\n");
    80004da0:	00006517          	auipc	a0,0x6
    80004da4:	66850513          	addi	a0,a0,1640 # 8000b408 <CONSOLE_STATUS+0x3f8>
    80004da8:	00003097          	auipc	ra,0x3
    80004dac:	95c080e7          	jalr	-1700(ra) # 80007704 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80004db0:	00048513          	mv	a0,s1
    80004db4:	00000097          	auipc	ra,0x0
    80004db8:	f40080e7          	jalr	-192(ra) # 80004cf4 <_ZN6Buffer6getCntEv>
    80004dbc:	02a05c63          	blez	a0,80004df4 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80004dc0:	0084b783          	ld	a5,8(s1)
    80004dc4:	0104a703          	lw	a4,16(s1)
    80004dc8:	00271713          	slli	a4,a4,0x2
    80004dcc:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80004dd0:	0007c503          	lbu	a0,0(a5)
    80004dd4:	ffffd097          	auipc	ra,0xffffd
    80004dd8:	ca8080e7          	jalr	-856(ra) # 80001a7c <_Z4putcc>
        head = (head + 1) % cap;
    80004ddc:	0104a783          	lw	a5,16(s1)
    80004de0:	0017879b          	addiw	a5,a5,1
    80004de4:	0004a703          	lw	a4,0(s1)
    80004de8:	02e7e7bb          	remw	a5,a5,a4
    80004dec:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80004df0:	fc1ff06f          	j	80004db0 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80004df4:	02100513          	li	a0,33
    80004df8:	ffffd097          	auipc	ra,0xffffd
    80004dfc:	c84080e7          	jalr	-892(ra) # 80001a7c <_Z4putcc>
    putc('\n');
    80004e00:	00a00513          	li	a0,10
    80004e04:	ffffd097          	auipc	ra,0xffffd
    80004e08:	c78080e7          	jalr	-904(ra) # 80001a7c <_Z4putcc>
    mem_free(buffer);
    80004e0c:	0084b503          	ld	a0,8(s1)
    80004e10:	ffffd097          	auipc	ra,0xffffd
    80004e14:	a50080e7          	jalr	-1456(ra) # 80001860 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80004e18:	0204b503          	ld	a0,32(s1)
    80004e1c:	ffffd097          	auipc	ra,0xffffd
    80004e20:	bb4080e7          	jalr	-1100(ra) # 800019d0 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80004e24:	0184b503          	ld	a0,24(s1)
    80004e28:	ffffd097          	auipc	ra,0xffffd
    80004e2c:	ba8080e7          	jalr	-1112(ra) # 800019d0 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80004e30:	0304b503          	ld	a0,48(s1)
    80004e34:	ffffd097          	auipc	ra,0xffffd
    80004e38:	b9c080e7          	jalr	-1124(ra) # 800019d0 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80004e3c:	0284b503          	ld	a0,40(s1)
    80004e40:	ffffd097          	auipc	ra,0xffffd
    80004e44:	b90080e7          	jalr	-1136(ra) # 800019d0 <_Z9sem_closeP4_sem>
}
    80004e48:	01813083          	ld	ra,24(sp)
    80004e4c:	01013403          	ld	s0,16(sp)
    80004e50:	00813483          	ld	s1,8(sp)
    80004e54:	02010113          	addi	sp,sp,32
    80004e58:	00008067          	ret

0000000080004e5c <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80004e5c:	fe010113          	addi	sp,sp,-32
    80004e60:	00113c23          	sd	ra,24(sp)
    80004e64:	00813823          	sd	s0,16(sp)
    80004e68:	00913423          	sd	s1,8(sp)
    80004e6c:	01213023          	sd	s2,0(sp)
    80004e70:	02010413          	addi	s0,sp,32
    80004e74:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004e78:	00000913          	li	s2,0
    80004e7c:	00c0006f          	j	80004e88 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80004e80:	ffffd097          	auipc	ra,0xffffd
    80004e84:	aa8080e7          	jalr	-1368(ra) # 80001928 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80004e88:	ffffd097          	auipc	ra,0xffffd
    80004e8c:	bcc080e7          	jalr	-1076(ra) # 80001a54 <_Z4getcv>
    80004e90:	0005059b          	sext.w	a1,a0
    80004e94:	01b00793          	li	a5,27
    80004e98:	02f58a63          	beq	a1,a5,80004ecc <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80004e9c:	0084b503          	ld	a0,8(s1)
    80004ea0:	00000097          	auipc	ra,0x0
    80004ea4:	d38080e7          	jalr	-712(ra) # 80004bd8 <_ZN6Buffer3putEi>
        i++;
    80004ea8:	0019071b          	addiw	a4,s2,1
    80004eac:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004eb0:	0004a683          	lw	a3,0(s1)
    80004eb4:	0026979b          	slliw	a5,a3,0x2
    80004eb8:	00d787bb          	addw	a5,a5,a3
    80004ebc:	0017979b          	slliw	a5,a5,0x1
    80004ec0:	02f767bb          	remw	a5,a4,a5
    80004ec4:	fc0792e3          	bnez	a5,80004e88 <_ZL16producerKeyboardPv+0x2c>
    80004ec8:	fb9ff06f          	j	80004e80 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80004ecc:	00100793          	li	a5,1
    80004ed0:	00009717          	auipc	a4,0x9
    80004ed4:	0ef72023          	sw	a5,224(a4) # 8000dfb0 <_ZL9threadEnd>
    data->buffer->put('!');
    80004ed8:	02100593          	li	a1,33
    80004edc:	0084b503          	ld	a0,8(s1)
    80004ee0:	00000097          	auipc	ra,0x0
    80004ee4:	cf8080e7          	jalr	-776(ra) # 80004bd8 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80004ee8:	0104b503          	ld	a0,16(s1)
    80004eec:	ffffd097          	auipc	ra,0xffffd
    80004ef0:	b3c080e7          	jalr	-1220(ra) # 80001a28 <_Z10sem_signalP4_sem>
}
    80004ef4:	01813083          	ld	ra,24(sp)
    80004ef8:	01013403          	ld	s0,16(sp)
    80004efc:	00813483          	ld	s1,8(sp)
    80004f00:	00013903          	ld	s2,0(sp)
    80004f04:	02010113          	addi	sp,sp,32
    80004f08:	00008067          	ret

0000000080004f0c <_ZL8producerPv>:

static void producer(void *arg) {
    80004f0c:	fe010113          	addi	sp,sp,-32
    80004f10:	00113c23          	sd	ra,24(sp)
    80004f14:	00813823          	sd	s0,16(sp)
    80004f18:	00913423          	sd	s1,8(sp)
    80004f1c:	01213023          	sd	s2,0(sp)
    80004f20:	02010413          	addi	s0,sp,32
    80004f24:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004f28:	00000913          	li	s2,0
    80004f2c:	00c0006f          	j	80004f38 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80004f30:	ffffd097          	auipc	ra,0xffffd
    80004f34:	9f8080e7          	jalr	-1544(ra) # 80001928 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80004f38:	00009797          	auipc	a5,0x9
    80004f3c:	0787a783          	lw	a5,120(a5) # 8000dfb0 <_ZL9threadEnd>
    80004f40:	02079e63          	bnez	a5,80004f7c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80004f44:	0004a583          	lw	a1,0(s1)
    80004f48:	0305859b          	addiw	a1,a1,48
    80004f4c:	0084b503          	ld	a0,8(s1)
    80004f50:	00000097          	auipc	ra,0x0
    80004f54:	c88080e7          	jalr	-888(ra) # 80004bd8 <_ZN6Buffer3putEi>
        i++;
    80004f58:	0019071b          	addiw	a4,s2,1
    80004f5c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004f60:	0004a683          	lw	a3,0(s1)
    80004f64:	0026979b          	slliw	a5,a3,0x2
    80004f68:	00d787bb          	addw	a5,a5,a3
    80004f6c:	0017979b          	slliw	a5,a5,0x1
    80004f70:	02f767bb          	remw	a5,a4,a5
    80004f74:	fc0792e3          	bnez	a5,80004f38 <_ZL8producerPv+0x2c>
    80004f78:	fb9ff06f          	j	80004f30 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80004f7c:	0104b503          	ld	a0,16(s1)
    80004f80:	ffffd097          	auipc	ra,0xffffd
    80004f84:	aa8080e7          	jalr	-1368(ra) # 80001a28 <_Z10sem_signalP4_sem>
}
    80004f88:	01813083          	ld	ra,24(sp)
    80004f8c:	01013403          	ld	s0,16(sp)
    80004f90:	00813483          	ld	s1,8(sp)
    80004f94:	00013903          	ld	s2,0(sp)
    80004f98:	02010113          	addi	sp,sp,32
    80004f9c:	00008067          	ret

0000000080004fa0 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80004fa0:	fd010113          	addi	sp,sp,-48
    80004fa4:	02113423          	sd	ra,40(sp)
    80004fa8:	02813023          	sd	s0,32(sp)
    80004fac:	00913c23          	sd	s1,24(sp)
    80004fb0:	01213823          	sd	s2,16(sp)
    80004fb4:	01313423          	sd	s3,8(sp)
    80004fb8:	03010413          	addi	s0,sp,48
    80004fbc:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004fc0:	00000993          	li	s3,0
    80004fc4:	01c0006f          	j	80004fe0 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80004fc8:	ffffd097          	auipc	ra,0xffffd
    80004fcc:	960080e7          	jalr	-1696(ra) # 80001928 <_Z15thread_dispatchv>
    80004fd0:	0500006f          	j	80005020 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80004fd4:	00a00513          	li	a0,10
    80004fd8:	ffffd097          	auipc	ra,0xffffd
    80004fdc:	aa4080e7          	jalr	-1372(ra) # 80001a7c <_Z4putcc>
    while (!threadEnd) {
    80004fe0:	00009797          	auipc	a5,0x9
    80004fe4:	fd07a783          	lw	a5,-48(a5) # 8000dfb0 <_ZL9threadEnd>
    80004fe8:	06079063          	bnez	a5,80005048 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80004fec:	00893503          	ld	a0,8(s2)
    80004ff0:	00000097          	auipc	ra,0x0
    80004ff4:	c78080e7          	jalr	-904(ra) # 80004c68 <_ZN6Buffer3getEv>
        i++;
    80004ff8:	0019849b          	addiw	s1,s3,1
    80004ffc:	0004899b          	sext.w	s3,s1
        putc(key);
    80005000:	0ff57513          	andi	a0,a0,255
    80005004:	ffffd097          	auipc	ra,0xffffd
    80005008:	a78080e7          	jalr	-1416(ra) # 80001a7c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    8000500c:	00092703          	lw	a4,0(s2)
    80005010:	0027179b          	slliw	a5,a4,0x2
    80005014:	00e787bb          	addw	a5,a5,a4
    80005018:	02f4e7bb          	remw	a5,s1,a5
    8000501c:	fa0786e3          	beqz	a5,80004fc8 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80005020:	05000793          	li	a5,80
    80005024:	02f4e4bb          	remw	s1,s1,a5
    80005028:	fa049ce3          	bnez	s1,80004fe0 <_ZL8consumerPv+0x40>
    8000502c:	fa9ff06f          	j	80004fd4 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80005030:	00893503          	ld	a0,8(s2)
    80005034:	00000097          	auipc	ra,0x0
    80005038:	c34080e7          	jalr	-972(ra) # 80004c68 <_ZN6Buffer3getEv>
        putc(key);
    8000503c:	0ff57513          	andi	a0,a0,255
    80005040:	ffffd097          	auipc	ra,0xffffd
    80005044:	a3c080e7          	jalr	-1476(ra) # 80001a7c <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80005048:	00893503          	ld	a0,8(s2)
    8000504c:	00000097          	auipc	ra,0x0
    80005050:	ca8080e7          	jalr	-856(ra) # 80004cf4 <_ZN6Buffer6getCntEv>
    80005054:	fca04ee3          	bgtz	a0,80005030 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80005058:	01093503          	ld	a0,16(s2)
    8000505c:	ffffd097          	auipc	ra,0xffffd
    80005060:	9cc080e7          	jalr	-1588(ra) # 80001a28 <_Z10sem_signalP4_sem>
}
    80005064:	02813083          	ld	ra,40(sp)
    80005068:	02013403          	ld	s0,32(sp)
    8000506c:	01813483          	ld	s1,24(sp)
    80005070:	01013903          	ld	s2,16(sp)
    80005074:	00813983          	ld	s3,8(sp)
    80005078:	03010113          	addi	sp,sp,48
    8000507c:	00008067          	ret

0000000080005080 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80005080:	f9010113          	addi	sp,sp,-112
    80005084:	06113423          	sd	ra,104(sp)
    80005088:	06813023          	sd	s0,96(sp)
    8000508c:	04913c23          	sd	s1,88(sp)
    80005090:	05213823          	sd	s2,80(sp)
    80005094:	05313423          	sd	s3,72(sp)
    80005098:	05413023          	sd	s4,64(sp)
    8000509c:	03513c23          	sd	s5,56(sp)
    800050a0:	03613823          	sd	s6,48(sp)
    800050a4:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800050a8:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800050ac:	00006517          	auipc	a0,0x6
    800050b0:	37450513          	addi	a0,a0,884 # 8000b420 <CONSOLE_STATUS+0x410>
    800050b4:	00002097          	auipc	ra,0x2
    800050b8:	650080e7          	jalr	1616(ra) # 80007704 <_Z11printStringPKc>
    getString(input, 30);
    800050bc:	01e00593          	li	a1,30
    800050c0:	fa040493          	addi	s1,s0,-96
    800050c4:	00048513          	mv	a0,s1
    800050c8:	00002097          	auipc	ra,0x2
    800050cc:	6c4080e7          	jalr	1732(ra) # 8000778c <_Z9getStringPci>
    threadNum = stringToInt(input);
    800050d0:	00048513          	mv	a0,s1
    800050d4:	00002097          	auipc	ra,0x2
    800050d8:	790080e7          	jalr	1936(ra) # 80007864 <_Z11stringToIntPKc>
    800050dc:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800050e0:	00006517          	auipc	a0,0x6
    800050e4:	36050513          	addi	a0,a0,864 # 8000b440 <CONSOLE_STATUS+0x430>
    800050e8:	00002097          	auipc	ra,0x2
    800050ec:	61c080e7          	jalr	1564(ra) # 80007704 <_Z11printStringPKc>
    getString(input, 30);
    800050f0:	01e00593          	li	a1,30
    800050f4:	00048513          	mv	a0,s1
    800050f8:	00002097          	auipc	ra,0x2
    800050fc:	694080e7          	jalr	1684(ra) # 8000778c <_Z9getStringPci>
    n = stringToInt(input);
    80005100:	00048513          	mv	a0,s1
    80005104:	00002097          	auipc	ra,0x2
    80005108:	760080e7          	jalr	1888(ra) # 80007864 <_Z11stringToIntPKc>
    8000510c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005110:	00006517          	auipc	a0,0x6
    80005114:	35050513          	addi	a0,a0,848 # 8000b460 <CONSOLE_STATUS+0x450>
    80005118:	00002097          	auipc	ra,0x2
    8000511c:	5ec080e7          	jalr	1516(ra) # 80007704 <_Z11printStringPKc>
    80005120:	00000613          	li	a2,0
    80005124:	00a00593          	li	a1,10
    80005128:	00090513          	mv	a0,s2
    8000512c:	00002097          	auipc	ra,0x2
    80005130:	788080e7          	jalr	1928(ra) # 800078b4 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005134:	00006517          	auipc	a0,0x6
    80005138:	34450513          	addi	a0,a0,836 # 8000b478 <CONSOLE_STATUS+0x468>
    8000513c:	00002097          	auipc	ra,0x2
    80005140:	5c8080e7          	jalr	1480(ra) # 80007704 <_Z11printStringPKc>
    80005144:	00000613          	li	a2,0
    80005148:	00a00593          	li	a1,10
    8000514c:	00048513          	mv	a0,s1
    80005150:	00002097          	auipc	ra,0x2
    80005154:	764080e7          	jalr	1892(ra) # 800078b4 <_Z8printIntiii>
    printString(".\n");
    80005158:	00006517          	auipc	a0,0x6
    8000515c:	33850513          	addi	a0,a0,824 # 8000b490 <CONSOLE_STATUS+0x480>
    80005160:	00002097          	auipc	ra,0x2
    80005164:	5a4080e7          	jalr	1444(ra) # 80007704 <_Z11printStringPKc>
    if(threadNum > n) {
    80005168:	0324c463          	blt	s1,s2,80005190 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    8000516c:	03205c63          	blez	s2,800051a4 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80005170:	03800513          	li	a0,56
    80005174:	ffffc097          	auipc	ra,0xffffc
    80005178:	048080e7          	jalr	72(ra) # 800011bc <_Znwm>
    8000517c:	00050a13          	mv	s4,a0
    80005180:	00048593          	mv	a1,s1
    80005184:	00000097          	auipc	ra,0x0
    80005188:	9b8080e7          	jalr	-1608(ra) # 80004b3c <_ZN6BufferC1Ei>
    8000518c:	0300006f          	j	800051bc <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005190:	00006517          	auipc	a0,0x6
    80005194:	30850513          	addi	a0,a0,776 # 8000b498 <CONSOLE_STATUS+0x488>
    80005198:	00002097          	auipc	ra,0x2
    8000519c:	56c080e7          	jalr	1388(ra) # 80007704 <_Z11printStringPKc>
        return;
    800051a0:	0140006f          	j	800051b4 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800051a4:	00006517          	auipc	a0,0x6
    800051a8:	33450513          	addi	a0,a0,820 # 8000b4d8 <CONSOLE_STATUS+0x4c8>
    800051ac:	00002097          	auipc	ra,0x2
    800051b0:	558080e7          	jalr	1368(ra) # 80007704 <_Z11printStringPKc>
        return;
    800051b4:	000b0113          	mv	sp,s6
    800051b8:	1500006f          	j	80005308 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800051bc:	00000593          	li	a1,0
    800051c0:	00009517          	auipc	a0,0x9
    800051c4:	df850513          	addi	a0,a0,-520 # 8000dfb8 <_ZL10waitForAll>
    800051c8:	ffffc097          	auipc	ra,0xffffc
    800051cc:	7d0080e7          	jalr	2000(ra) # 80001998 <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    800051d0:	00391793          	slli	a5,s2,0x3
    800051d4:	00f78793          	addi	a5,a5,15
    800051d8:	ff07f793          	andi	a5,a5,-16
    800051dc:	40f10133          	sub	sp,sp,a5
    800051e0:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800051e4:	0019071b          	addiw	a4,s2,1
    800051e8:	00171793          	slli	a5,a4,0x1
    800051ec:	00e787b3          	add	a5,a5,a4
    800051f0:	00379793          	slli	a5,a5,0x3
    800051f4:	00f78793          	addi	a5,a5,15
    800051f8:	ff07f793          	andi	a5,a5,-16
    800051fc:	40f10133          	sub	sp,sp,a5
    80005200:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80005204:	00191613          	slli	a2,s2,0x1
    80005208:	012607b3          	add	a5,a2,s2
    8000520c:	00379793          	slli	a5,a5,0x3
    80005210:	00f987b3          	add	a5,s3,a5
    80005214:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005218:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    8000521c:	00009717          	auipc	a4,0x9
    80005220:	d9c73703          	ld	a4,-612(a4) # 8000dfb8 <_ZL10waitForAll>
    80005224:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80005228:	00078613          	mv	a2,a5
    8000522c:	00000597          	auipc	a1,0x0
    80005230:	d7458593          	addi	a1,a1,-652 # 80004fa0 <_ZL8consumerPv>
    80005234:	f9840513          	addi	a0,s0,-104
    80005238:	ffffc097          	auipc	ra,0xffffc
    8000523c:	654080e7          	jalr	1620(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80005240:	00000493          	li	s1,0
    80005244:	0280006f          	j	8000526c <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80005248:	00000597          	auipc	a1,0x0
    8000524c:	c1458593          	addi	a1,a1,-1004 # 80004e5c <_ZL16producerKeyboardPv>
                      data + i);
    80005250:	00179613          	slli	a2,a5,0x1
    80005254:	00f60633          	add	a2,a2,a5
    80005258:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    8000525c:	00c98633          	add	a2,s3,a2
    80005260:	ffffc097          	auipc	ra,0xffffc
    80005264:	62c080e7          	jalr	1580(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80005268:	0014849b          	addiw	s1,s1,1
    8000526c:	0524d263          	bge	s1,s2,800052b0 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80005270:	00149793          	slli	a5,s1,0x1
    80005274:	009787b3          	add	a5,a5,s1
    80005278:	00379793          	slli	a5,a5,0x3
    8000527c:	00f987b3          	add	a5,s3,a5
    80005280:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005284:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80005288:	00009717          	auipc	a4,0x9
    8000528c:	d3073703          	ld	a4,-720(a4) # 8000dfb8 <_ZL10waitForAll>
    80005290:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80005294:	00048793          	mv	a5,s1
    80005298:	00349513          	slli	a0,s1,0x3
    8000529c:	00aa8533          	add	a0,s5,a0
    800052a0:	fa9054e3          	blez	s1,80005248 <_Z22producerConsumer_C_APIv+0x1c8>
    800052a4:	00000597          	auipc	a1,0x0
    800052a8:	c6858593          	addi	a1,a1,-920 # 80004f0c <_ZL8producerPv>
    800052ac:	fa5ff06f          	j	80005250 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800052b0:	ffffc097          	auipc	ra,0xffffc
    800052b4:	678080e7          	jalr	1656(ra) # 80001928 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800052b8:	00000493          	li	s1,0
    800052bc:	00994e63          	blt	s2,s1,800052d8 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800052c0:	00009517          	auipc	a0,0x9
    800052c4:	cf853503          	ld	a0,-776(a0) # 8000dfb8 <_ZL10waitForAll>
    800052c8:	ffffc097          	auipc	ra,0xffffc
    800052cc:	734080e7          	jalr	1844(ra) # 800019fc <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    800052d0:	0014849b          	addiw	s1,s1,1
    800052d4:	fe9ff06f          	j	800052bc <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800052d8:	00009517          	auipc	a0,0x9
    800052dc:	ce053503          	ld	a0,-800(a0) # 8000dfb8 <_ZL10waitForAll>
    800052e0:	ffffc097          	auipc	ra,0xffffc
    800052e4:	6f0080e7          	jalr	1776(ra) # 800019d0 <_Z9sem_closeP4_sem>
    delete buffer;
    800052e8:	000a0e63          	beqz	s4,80005304 <_Z22producerConsumer_C_APIv+0x284>
    800052ec:	000a0513          	mv	a0,s4
    800052f0:	00000097          	auipc	ra,0x0
    800052f4:	a8c080e7          	jalr	-1396(ra) # 80004d7c <_ZN6BufferD1Ev>
    800052f8:	000a0513          	mv	a0,s4
    800052fc:	ffffc097          	auipc	ra,0xffffc
    80005300:	ee8080e7          	jalr	-280(ra) # 800011e4 <_ZdlPv>
    80005304:	000b0113          	mv	sp,s6
}
    80005308:	f9040113          	addi	sp,s0,-112
    8000530c:	06813083          	ld	ra,104(sp)
    80005310:	06013403          	ld	s0,96(sp)
    80005314:	05813483          	ld	s1,88(sp)
    80005318:	05013903          	ld	s2,80(sp)
    8000531c:	04813983          	ld	s3,72(sp)
    80005320:	04013a03          	ld	s4,64(sp)
    80005324:	03813a83          	ld	s5,56(sp)
    80005328:	03013b03          	ld	s6,48(sp)
    8000532c:	07010113          	addi	sp,sp,112
    80005330:	00008067          	ret
    80005334:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80005338:	000a0513          	mv	a0,s4
    8000533c:	ffffc097          	auipc	ra,0xffffc
    80005340:	ea8080e7          	jalr	-344(ra) # 800011e4 <_ZdlPv>
    80005344:	00048513          	mv	a0,s1
    80005348:	0000a097          	auipc	ra,0xa
    8000534c:	d80080e7          	jalr	-640(ra) # 8000f0c8 <_Unwind_Resume>

0000000080005350 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80005350:	f8010113          	addi	sp,sp,-128
    80005354:	06113c23          	sd	ra,120(sp)
    80005358:	06813823          	sd	s0,112(sp)
    8000535c:	06913423          	sd	s1,104(sp)
    80005360:	07213023          	sd	s2,96(sp)
    80005364:	05313c23          	sd	s3,88(sp)
    80005368:	05413823          	sd	s4,80(sp)
    8000536c:	05513423          	sd	s5,72(sp)
    80005370:	05613023          	sd	s6,64(sp)
    80005374:	03713c23          	sd	s7,56(sp)
    80005378:	03813823          	sd	s8,48(sp)
    8000537c:	03913423          	sd	s9,40(sp)
    80005380:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80005384:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80005388:	00006517          	auipc	a0,0x6
    8000538c:	09850513          	addi	a0,a0,152 # 8000b420 <CONSOLE_STATUS+0x410>
    80005390:	00002097          	auipc	ra,0x2
    80005394:	374080e7          	jalr	884(ra) # 80007704 <_Z11printStringPKc>
    getString(input, 30);
    80005398:	01e00593          	li	a1,30
    8000539c:	f8040493          	addi	s1,s0,-128
    800053a0:	00048513          	mv	a0,s1
    800053a4:	00002097          	auipc	ra,0x2
    800053a8:	3e8080e7          	jalr	1000(ra) # 8000778c <_Z9getStringPci>
    threadNum = stringToInt(input);
    800053ac:	00048513          	mv	a0,s1
    800053b0:	00002097          	auipc	ra,0x2
    800053b4:	4b4080e7          	jalr	1204(ra) # 80007864 <_Z11stringToIntPKc>
    800053b8:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    800053bc:	00006517          	auipc	a0,0x6
    800053c0:	08450513          	addi	a0,a0,132 # 8000b440 <CONSOLE_STATUS+0x430>
    800053c4:	00002097          	auipc	ra,0x2
    800053c8:	340080e7          	jalr	832(ra) # 80007704 <_Z11printStringPKc>
    getString(input, 30);
    800053cc:	01e00593          	li	a1,30
    800053d0:	00048513          	mv	a0,s1
    800053d4:	00002097          	auipc	ra,0x2
    800053d8:	3b8080e7          	jalr	952(ra) # 8000778c <_Z9getStringPci>
    n = stringToInt(input);
    800053dc:	00048513          	mv	a0,s1
    800053e0:	00002097          	auipc	ra,0x2
    800053e4:	484080e7          	jalr	1156(ra) # 80007864 <_Z11stringToIntPKc>
    800053e8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800053ec:	00006517          	auipc	a0,0x6
    800053f0:	07450513          	addi	a0,a0,116 # 8000b460 <CONSOLE_STATUS+0x450>
    800053f4:	00002097          	auipc	ra,0x2
    800053f8:	310080e7          	jalr	784(ra) # 80007704 <_Z11printStringPKc>
    printInt(threadNum);
    800053fc:	00000613          	li	a2,0
    80005400:	00a00593          	li	a1,10
    80005404:	00098513          	mv	a0,s3
    80005408:	00002097          	auipc	ra,0x2
    8000540c:	4ac080e7          	jalr	1196(ra) # 800078b4 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80005410:	00006517          	auipc	a0,0x6
    80005414:	06850513          	addi	a0,a0,104 # 8000b478 <CONSOLE_STATUS+0x468>
    80005418:	00002097          	auipc	ra,0x2
    8000541c:	2ec080e7          	jalr	748(ra) # 80007704 <_Z11printStringPKc>
    printInt(n);
    80005420:	00000613          	li	a2,0
    80005424:	00a00593          	li	a1,10
    80005428:	00048513          	mv	a0,s1
    8000542c:	00002097          	auipc	ra,0x2
    80005430:	488080e7          	jalr	1160(ra) # 800078b4 <_Z8printIntiii>
    printString(".\n");
    80005434:	00006517          	auipc	a0,0x6
    80005438:	05c50513          	addi	a0,a0,92 # 8000b490 <CONSOLE_STATUS+0x480>
    8000543c:	00002097          	auipc	ra,0x2
    80005440:	2c8080e7          	jalr	712(ra) # 80007704 <_Z11printStringPKc>
    if (threadNum > n) {
    80005444:	0334c463          	blt	s1,s3,8000546c <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80005448:	03305c63          	blez	s3,80005480 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000544c:	03800513          	li	a0,56
    80005450:	ffffc097          	auipc	ra,0xffffc
    80005454:	d6c080e7          	jalr	-660(ra) # 800011bc <_Znwm>
    80005458:	00050a93          	mv	s5,a0
    8000545c:	00048593          	mv	a1,s1
    80005460:	00001097          	auipc	ra,0x1
    80005464:	390080e7          	jalr	912(ra) # 800067f0 <_ZN9BufferCPPC1Ei>
    80005468:	0300006f          	j	80005498 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000546c:	00006517          	auipc	a0,0x6
    80005470:	02c50513          	addi	a0,a0,44 # 8000b498 <CONSOLE_STATUS+0x488>
    80005474:	00002097          	auipc	ra,0x2
    80005478:	290080e7          	jalr	656(ra) # 80007704 <_Z11printStringPKc>
        return;
    8000547c:	0140006f          	j	80005490 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005480:	00006517          	auipc	a0,0x6
    80005484:	05850513          	addi	a0,a0,88 # 8000b4d8 <CONSOLE_STATUS+0x4c8>
    80005488:	00002097          	auipc	ra,0x2
    8000548c:	27c080e7          	jalr	636(ra) # 80007704 <_Z11printStringPKc>
        return;
    80005490:	000c0113          	mv	sp,s8
    80005494:	2380006f          	j	800056cc <_Z20testConsumerProducerv+0x37c>
    waitForAll = new Semaphore(0);
    80005498:	01000513          	li	a0,16
    8000549c:	ffffc097          	auipc	ra,0xffffc
    800054a0:	d20080e7          	jalr	-736(ra) # 800011bc <_Znwm>
    800054a4:	00050913          	mv	s2,a0
    800054a8:	00000593          	li	a1,0
    800054ac:	ffffc097          	auipc	ra,0xffffc
    800054b0:	f28080e7          	jalr	-216(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800054b4:	00009797          	auipc	a5,0x9
    800054b8:	b127ba23          	sd	s2,-1260(a5) # 8000dfc8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800054bc:	00399793          	slli	a5,s3,0x3
    800054c0:	00f78793          	addi	a5,a5,15
    800054c4:	ff07f793          	andi	a5,a5,-16
    800054c8:	40f10133          	sub	sp,sp,a5
    800054cc:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    800054d0:	0019871b          	addiw	a4,s3,1
    800054d4:	00171793          	slli	a5,a4,0x1
    800054d8:	00e787b3          	add	a5,a5,a4
    800054dc:	00379793          	slli	a5,a5,0x3
    800054e0:	00f78793          	addi	a5,a5,15
    800054e4:	ff07f793          	andi	a5,a5,-16
    800054e8:	40f10133          	sub	sp,sp,a5
    800054ec:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    800054f0:	00199493          	slli	s1,s3,0x1
    800054f4:	013484b3          	add	s1,s1,s3
    800054f8:	00349493          	slli	s1,s1,0x3
    800054fc:	009b04b3          	add	s1,s6,s1
    80005500:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80005504:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80005508:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    8000550c:	02800513          	li	a0,40
    80005510:	ffffc097          	auipc	ra,0xffffc
    80005514:	cac080e7          	jalr	-852(ra) # 800011bc <_Znwm>
    80005518:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    8000551c:	ffffc097          	auipc	ra,0xffffc
    80005520:	e84080e7          	jalr	-380(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80005524:	00009797          	auipc	a5,0x9
    80005528:	86c78793          	addi	a5,a5,-1940 # 8000dd90 <_ZTV8Consumer+0x10>
    8000552c:	00fbb023          	sd	a5,0(s7)
    80005530:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80005534:	000b8513          	mv	a0,s7
    80005538:	ffffc097          	auipc	ra,0xffffc
    8000553c:	d80080e7          	jalr	-640(ra) # 800012b8 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80005540:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80005544:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80005548:	00009797          	auipc	a5,0x9
    8000554c:	a807b783          	ld	a5,-1408(a5) # 8000dfc8 <_ZL10waitForAll>
    80005550:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005554:	02800513          	li	a0,40
    80005558:	ffffc097          	auipc	ra,0xffffc
    8000555c:	c64080e7          	jalr	-924(ra) # 800011bc <_Znwm>
    80005560:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80005564:	ffffc097          	auipc	ra,0xffffc
    80005568:	e3c080e7          	jalr	-452(ra) # 800013a0 <_ZN6ThreadC1Ev>
    8000556c:	00008797          	auipc	a5,0x8
    80005570:	7d478793          	addi	a5,a5,2004 # 8000dd40 <_ZTV16ProducerKeyborad+0x10>
    80005574:	00f4b023          	sd	a5,0(s1)
    80005578:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000557c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80005580:	00048513          	mv	a0,s1
    80005584:	ffffc097          	auipc	ra,0xffffc
    80005588:	d34080e7          	jalr	-716(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000558c:	00100913          	li	s2,1
    80005590:	0300006f          	j	800055c0 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80005594:	00008797          	auipc	a5,0x8
    80005598:	7d478793          	addi	a5,a5,2004 # 8000dd68 <_ZTV8Producer+0x10>
    8000559c:	00fcb023          	sd	a5,0(s9)
    800055a0:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800055a4:	00391793          	slli	a5,s2,0x3
    800055a8:	00fa07b3          	add	a5,s4,a5
    800055ac:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    800055b0:	000c8513          	mv	a0,s9
    800055b4:	ffffc097          	auipc	ra,0xffffc
    800055b8:	d04080e7          	jalr	-764(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800055bc:	0019091b          	addiw	s2,s2,1
    800055c0:	05395263          	bge	s2,s3,80005604 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    800055c4:	00191493          	slli	s1,s2,0x1
    800055c8:	012484b3          	add	s1,s1,s2
    800055cc:	00349493          	slli	s1,s1,0x3
    800055d0:	009b04b3          	add	s1,s6,s1
    800055d4:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    800055d8:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    800055dc:	00009797          	auipc	a5,0x9
    800055e0:	9ec7b783          	ld	a5,-1556(a5) # 8000dfc8 <_ZL10waitForAll>
    800055e4:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    800055e8:	02800513          	li	a0,40
    800055ec:	ffffc097          	auipc	ra,0xffffc
    800055f0:	bd0080e7          	jalr	-1072(ra) # 800011bc <_Znwm>
    800055f4:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800055f8:	ffffc097          	auipc	ra,0xffffc
    800055fc:	da8080e7          	jalr	-600(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80005600:	f95ff06f          	j	80005594 <_Z20testConsumerProducerv+0x244>
    putc('.');
    80005604:	02e00513          	li	a0,46
    80005608:	ffffc097          	auipc	ra,0xffffc
    8000560c:	474080e7          	jalr	1140(ra) # 80001a7c <_Z4putcc>
    Thread::dispatch();
    80005610:	ffffc097          	auipc	ra,0xffffc
    80005614:	d08080e7          	jalr	-760(ra) # 80001318 <_ZN6Thread8dispatchEv>
    putc('.');
    80005618:	02e00513          	li	a0,46
    8000561c:	ffffc097          	auipc	ra,0xffffc
    80005620:	460080e7          	jalr	1120(ra) # 80001a7c <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    80005624:	00000493          	li	s1,0
    80005628:	0099ce63          	blt	s3,s1,80005644 <_Z20testConsumerProducerv+0x2f4>
        waitForAll->wait();
    8000562c:	00009517          	auipc	a0,0x9
    80005630:	99c53503          	ld	a0,-1636(a0) # 8000dfc8 <_ZL10waitForAll>
    80005634:	ffffc097          	auipc	ra,0xffffc
    80005638:	dd8080e7          	jalr	-552(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000563c:	0014849b          	addiw	s1,s1,1
    80005640:	fe9ff06f          	j	80005628 <_Z20testConsumerProducerv+0x2d8>
    putc('.');
    80005644:	02e00513          	li	a0,46
    80005648:	ffffc097          	auipc	ra,0xffffc
    8000564c:	434080e7          	jalr	1076(ra) # 80001a7c <_Z4putcc>
    delete waitForAll;
    80005650:	00009517          	auipc	a0,0x9
    80005654:	97853503          	ld	a0,-1672(a0) # 8000dfc8 <_ZL10waitForAll>
    80005658:	00050863          	beqz	a0,80005668 <_Z20testConsumerProducerv+0x318>
    8000565c:	00053783          	ld	a5,0(a0)
    80005660:	0087b783          	ld	a5,8(a5)
    80005664:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80005668:	00000493          	li	s1,0
    8000566c:	0080006f          	j	80005674 <_Z20testConsumerProducerv+0x324>
    for (int i = 0; i < threadNum; i++) {
    80005670:	0014849b          	addiw	s1,s1,1
    80005674:	0334d263          	bge	s1,s3,80005698 <_Z20testConsumerProducerv+0x348>
        delete producers[i];
    80005678:	00349793          	slli	a5,s1,0x3
    8000567c:	00fa07b3          	add	a5,s4,a5
    80005680:	0007b503          	ld	a0,0(a5)
    80005684:	fe0506e3          	beqz	a0,80005670 <_Z20testConsumerProducerv+0x320>
    80005688:	00053783          	ld	a5,0(a0)
    8000568c:	0087b783          	ld	a5,8(a5)
    80005690:	000780e7          	jalr	a5
    80005694:	fddff06f          	j	80005670 <_Z20testConsumerProducerv+0x320>
    delete consumer;
    80005698:	000b8a63          	beqz	s7,800056ac <_Z20testConsumerProducerv+0x35c>
    8000569c:	000bb783          	ld	a5,0(s7)
    800056a0:	0087b783          	ld	a5,8(a5)
    800056a4:	000b8513          	mv	a0,s7
    800056a8:	000780e7          	jalr	a5
    delete buffer;
    800056ac:	000a8e63          	beqz	s5,800056c8 <_Z20testConsumerProducerv+0x378>
    800056b0:	000a8513          	mv	a0,s5
    800056b4:	00001097          	auipc	ra,0x1
    800056b8:	434080e7          	jalr	1076(ra) # 80006ae8 <_ZN9BufferCPPD1Ev>
    800056bc:	000a8513          	mv	a0,s5
    800056c0:	ffffc097          	auipc	ra,0xffffc
    800056c4:	b24080e7          	jalr	-1244(ra) # 800011e4 <_ZdlPv>
    800056c8:	000c0113          	mv	sp,s8
}
    800056cc:	f8040113          	addi	sp,s0,-128
    800056d0:	07813083          	ld	ra,120(sp)
    800056d4:	07013403          	ld	s0,112(sp)
    800056d8:	06813483          	ld	s1,104(sp)
    800056dc:	06013903          	ld	s2,96(sp)
    800056e0:	05813983          	ld	s3,88(sp)
    800056e4:	05013a03          	ld	s4,80(sp)
    800056e8:	04813a83          	ld	s5,72(sp)
    800056ec:	04013b03          	ld	s6,64(sp)
    800056f0:	03813b83          	ld	s7,56(sp)
    800056f4:	03013c03          	ld	s8,48(sp)
    800056f8:	02813c83          	ld	s9,40(sp)
    800056fc:	08010113          	addi	sp,sp,128
    80005700:	00008067          	ret
    80005704:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005708:	000a8513          	mv	a0,s5
    8000570c:	ffffc097          	auipc	ra,0xffffc
    80005710:	ad8080e7          	jalr	-1320(ra) # 800011e4 <_ZdlPv>
    80005714:	00048513          	mv	a0,s1
    80005718:	0000a097          	auipc	ra,0xa
    8000571c:	9b0080e7          	jalr	-1616(ra) # 8000f0c8 <_Unwind_Resume>
    80005720:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80005724:	00090513          	mv	a0,s2
    80005728:	ffffc097          	auipc	ra,0xffffc
    8000572c:	abc080e7          	jalr	-1348(ra) # 800011e4 <_ZdlPv>
    80005730:	00048513          	mv	a0,s1
    80005734:	0000a097          	auipc	ra,0xa
    80005738:	994080e7          	jalr	-1644(ra) # 8000f0c8 <_Unwind_Resume>
    8000573c:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005740:	000b8513          	mv	a0,s7
    80005744:	ffffc097          	auipc	ra,0xffffc
    80005748:	aa0080e7          	jalr	-1376(ra) # 800011e4 <_ZdlPv>
    8000574c:	00048513          	mv	a0,s1
    80005750:	0000a097          	auipc	ra,0xa
    80005754:	978080e7          	jalr	-1672(ra) # 8000f0c8 <_Unwind_Resume>
    80005758:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000575c:	00048513          	mv	a0,s1
    80005760:	ffffc097          	auipc	ra,0xffffc
    80005764:	a84080e7          	jalr	-1404(ra) # 800011e4 <_ZdlPv>
    80005768:	00090513          	mv	a0,s2
    8000576c:	0000a097          	auipc	ra,0xa
    80005770:	95c080e7          	jalr	-1700(ra) # 8000f0c8 <_Unwind_Resume>
    80005774:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80005778:	000c8513          	mv	a0,s9
    8000577c:	ffffc097          	auipc	ra,0xffffc
    80005780:	a68080e7          	jalr	-1432(ra) # 800011e4 <_ZdlPv>
    80005784:	00048513          	mv	a0,s1
    80005788:	0000a097          	auipc	ra,0xa
    8000578c:	940080e7          	jalr	-1728(ra) # 8000f0c8 <_Unwind_Resume>

0000000080005790 <_ZN8Consumer3runEv>:
    void run() override {
    80005790:	fd010113          	addi	sp,sp,-48
    80005794:	02113423          	sd	ra,40(sp)
    80005798:	02813023          	sd	s0,32(sp)
    8000579c:	00913c23          	sd	s1,24(sp)
    800057a0:	01213823          	sd	s2,16(sp)
    800057a4:	01313423          	sd	s3,8(sp)
    800057a8:	03010413          	addi	s0,sp,48
    800057ac:	00050913          	mv	s2,a0
        int i = 0;
    800057b0:	00000993          	li	s3,0
    800057b4:	0100006f          	j	800057c4 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800057b8:	00a00513          	li	a0,10
    800057bc:	ffffd097          	auipc	ra,0xffffd
    800057c0:	dc8080e7          	jalr	-568(ra) # 80002584 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800057c4:	00008797          	auipc	a5,0x8
    800057c8:	7fc7a783          	lw	a5,2044(a5) # 8000dfc0 <_ZL9threadEnd>
    800057cc:	04079a63          	bnez	a5,80005820 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800057d0:	02093783          	ld	a5,32(s2)
    800057d4:	0087b503          	ld	a0,8(a5)
    800057d8:	00001097          	auipc	ra,0x1
    800057dc:	1fc080e7          	jalr	508(ra) # 800069d4 <_ZN9BufferCPP3getEv>
            i++;
    800057e0:	0019849b          	addiw	s1,s3,1
    800057e4:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    800057e8:	0ff57513          	andi	a0,a0,255
    800057ec:	ffffd097          	auipc	ra,0xffffd
    800057f0:	d98080e7          	jalr	-616(ra) # 80002584 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    800057f4:	05000793          	li	a5,80
    800057f8:	02f4e4bb          	remw	s1,s1,a5
    800057fc:	fc0494e3          	bnez	s1,800057c4 <_ZN8Consumer3runEv+0x34>
    80005800:	fb9ff06f          	j	800057b8 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80005804:	02093783          	ld	a5,32(s2)
    80005808:	0087b503          	ld	a0,8(a5)
    8000580c:	00001097          	auipc	ra,0x1
    80005810:	1c8080e7          	jalr	456(ra) # 800069d4 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80005814:	0ff57513          	andi	a0,a0,255
    80005818:	ffffd097          	auipc	ra,0xffffd
    8000581c:	d6c080e7          	jalr	-660(ra) # 80002584 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005820:	02093783          	ld	a5,32(s2)
    80005824:	0087b503          	ld	a0,8(a5)
    80005828:	00001097          	auipc	ra,0x1
    8000582c:	238080e7          	jalr	568(ra) # 80006a60 <_ZN9BufferCPP6getCntEv>
    80005830:	fca04ae3          	bgtz	a0,80005804 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80005834:	02093783          	ld	a5,32(s2)
    80005838:	0107b503          	ld	a0,16(a5)
    8000583c:	ffffc097          	auipc	ra,0xffffc
    80005840:	bfc080e7          	jalr	-1028(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005844:	02813083          	ld	ra,40(sp)
    80005848:	02013403          	ld	s0,32(sp)
    8000584c:	01813483          	ld	s1,24(sp)
    80005850:	01013903          	ld	s2,16(sp)
    80005854:	00813983          	ld	s3,8(sp)
    80005858:	03010113          	addi	sp,sp,48
    8000585c:	00008067          	ret

0000000080005860 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80005860:	ff010113          	addi	sp,sp,-16
    80005864:	00113423          	sd	ra,8(sp)
    80005868:	00813023          	sd	s0,0(sp)
    8000586c:	01010413          	addi	s0,sp,16
    80005870:	00008797          	auipc	a5,0x8
    80005874:	52078793          	addi	a5,a5,1312 # 8000dd90 <_ZTV8Consumer+0x10>
    80005878:	00f53023          	sd	a5,0(a0)
    8000587c:	ffffc097          	auipc	ra,0xffffc
    80005880:	8d0080e7          	jalr	-1840(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005884:	00813083          	ld	ra,8(sp)
    80005888:	00013403          	ld	s0,0(sp)
    8000588c:	01010113          	addi	sp,sp,16
    80005890:	00008067          	ret

0000000080005894 <_ZN8ConsumerD0Ev>:
    80005894:	fe010113          	addi	sp,sp,-32
    80005898:	00113c23          	sd	ra,24(sp)
    8000589c:	00813823          	sd	s0,16(sp)
    800058a0:	00913423          	sd	s1,8(sp)
    800058a4:	02010413          	addi	s0,sp,32
    800058a8:	00050493          	mv	s1,a0
    800058ac:	00008797          	auipc	a5,0x8
    800058b0:	4e478793          	addi	a5,a5,1252 # 8000dd90 <_ZTV8Consumer+0x10>
    800058b4:	00f53023          	sd	a5,0(a0)
    800058b8:	ffffc097          	auipc	ra,0xffffc
    800058bc:	894080e7          	jalr	-1900(ra) # 8000114c <_ZN6ThreadD1Ev>
    800058c0:	00048513          	mv	a0,s1
    800058c4:	ffffc097          	auipc	ra,0xffffc
    800058c8:	920080e7          	jalr	-1760(ra) # 800011e4 <_ZdlPv>
    800058cc:	01813083          	ld	ra,24(sp)
    800058d0:	01013403          	ld	s0,16(sp)
    800058d4:	00813483          	ld	s1,8(sp)
    800058d8:	02010113          	addi	sp,sp,32
    800058dc:	00008067          	ret

00000000800058e0 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    800058e0:	ff010113          	addi	sp,sp,-16
    800058e4:	00113423          	sd	ra,8(sp)
    800058e8:	00813023          	sd	s0,0(sp)
    800058ec:	01010413          	addi	s0,sp,16
    800058f0:	00008797          	auipc	a5,0x8
    800058f4:	45078793          	addi	a5,a5,1104 # 8000dd40 <_ZTV16ProducerKeyborad+0x10>
    800058f8:	00f53023          	sd	a5,0(a0)
    800058fc:	ffffc097          	auipc	ra,0xffffc
    80005900:	850080e7          	jalr	-1968(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005904:	00813083          	ld	ra,8(sp)
    80005908:	00013403          	ld	s0,0(sp)
    8000590c:	01010113          	addi	sp,sp,16
    80005910:	00008067          	ret

0000000080005914 <_ZN16ProducerKeyboradD0Ev>:
    80005914:	fe010113          	addi	sp,sp,-32
    80005918:	00113c23          	sd	ra,24(sp)
    8000591c:	00813823          	sd	s0,16(sp)
    80005920:	00913423          	sd	s1,8(sp)
    80005924:	02010413          	addi	s0,sp,32
    80005928:	00050493          	mv	s1,a0
    8000592c:	00008797          	auipc	a5,0x8
    80005930:	41478793          	addi	a5,a5,1044 # 8000dd40 <_ZTV16ProducerKeyborad+0x10>
    80005934:	00f53023          	sd	a5,0(a0)
    80005938:	ffffc097          	auipc	ra,0xffffc
    8000593c:	814080e7          	jalr	-2028(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005940:	00048513          	mv	a0,s1
    80005944:	ffffc097          	auipc	ra,0xffffc
    80005948:	8a0080e7          	jalr	-1888(ra) # 800011e4 <_ZdlPv>
    8000594c:	01813083          	ld	ra,24(sp)
    80005950:	01013403          	ld	s0,16(sp)
    80005954:	00813483          	ld	s1,8(sp)
    80005958:	02010113          	addi	sp,sp,32
    8000595c:	00008067          	ret

0000000080005960 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005960:	ff010113          	addi	sp,sp,-16
    80005964:	00113423          	sd	ra,8(sp)
    80005968:	00813023          	sd	s0,0(sp)
    8000596c:	01010413          	addi	s0,sp,16
    80005970:	00008797          	auipc	a5,0x8
    80005974:	3f878793          	addi	a5,a5,1016 # 8000dd68 <_ZTV8Producer+0x10>
    80005978:	00f53023          	sd	a5,0(a0)
    8000597c:	ffffb097          	auipc	ra,0xffffb
    80005980:	7d0080e7          	jalr	2000(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005984:	00813083          	ld	ra,8(sp)
    80005988:	00013403          	ld	s0,0(sp)
    8000598c:	01010113          	addi	sp,sp,16
    80005990:	00008067          	ret

0000000080005994 <_ZN8ProducerD0Ev>:
    80005994:	fe010113          	addi	sp,sp,-32
    80005998:	00113c23          	sd	ra,24(sp)
    8000599c:	00813823          	sd	s0,16(sp)
    800059a0:	00913423          	sd	s1,8(sp)
    800059a4:	02010413          	addi	s0,sp,32
    800059a8:	00050493          	mv	s1,a0
    800059ac:	00008797          	auipc	a5,0x8
    800059b0:	3bc78793          	addi	a5,a5,956 # 8000dd68 <_ZTV8Producer+0x10>
    800059b4:	00f53023          	sd	a5,0(a0)
    800059b8:	ffffb097          	auipc	ra,0xffffb
    800059bc:	794080e7          	jalr	1940(ra) # 8000114c <_ZN6ThreadD1Ev>
    800059c0:	00048513          	mv	a0,s1
    800059c4:	ffffc097          	auipc	ra,0xffffc
    800059c8:	820080e7          	jalr	-2016(ra) # 800011e4 <_ZdlPv>
    800059cc:	01813083          	ld	ra,24(sp)
    800059d0:	01013403          	ld	s0,16(sp)
    800059d4:	00813483          	ld	s1,8(sp)
    800059d8:	02010113          	addi	sp,sp,32
    800059dc:	00008067          	ret

00000000800059e0 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    800059e0:	fe010113          	addi	sp,sp,-32
    800059e4:	00113c23          	sd	ra,24(sp)
    800059e8:	00813823          	sd	s0,16(sp)
    800059ec:	00913423          	sd	s1,8(sp)
    800059f0:	02010413          	addi	s0,sp,32
    800059f4:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    800059f8:	ffffc097          	auipc	ra,0xffffc
    800059fc:	05c080e7          	jalr	92(ra) # 80001a54 <_Z4getcv>
    80005a00:	0005059b          	sext.w	a1,a0
    80005a04:	01b00793          	li	a5,27
    80005a08:	00f58c63          	beq	a1,a5,80005a20 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80005a0c:	0204b783          	ld	a5,32(s1)
    80005a10:	0087b503          	ld	a0,8(a5)
    80005a14:	00001097          	auipc	ra,0x1
    80005a18:	f30080e7          	jalr	-208(ra) # 80006944 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80005a1c:	fddff06f          	j	800059f8 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005a20:	00100793          	li	a5,1
    80005a24:	00008717          	auipc	a4,0x8
    80005a28:	58f72e23          	sw	a5,1436(a4) # 8000dfc0 <_ZL9threadEnd>
        td->buffer->put('!');
    80005a2c:	0204b783          	ld	a5,32(s1)
    80005a30:	02100593          	li	a1,33
    80005a34:	0087b503          	ld	a0,8(a5)
    80005a38:	00001097          	auipc	ra,0x1
    80005a3c:	f0c080e7          	jalr	-244(ra) # 80006944 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80005a40:	0204b783          	ld	a5,32(s1)
    80005a44:	0107b503          	ld	a0,16(a5)
    80005a48:	ffffc097          	auipc	ra,0xffffc
    80005a4c:	9f0080e7          	jalr	-1552(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005a50:	01813083          	ld	ra,24(sp)
    80005a54:	01013403          	ld	s0,16(sp)
    80005a58:	00813483          	ld	s1,8(sp)
    80005a5c:	02010113          	addi	sp,sp,32
    80005a60:	00008067          	ret

0000000080005a64 <_ZN8Producer3runEv>:
    void run() override {
    80005a64:	fe010113          	addi	sp,sp,-32
    80005a68:	00113c23          	sd	ra,24(sp)
    80005a6c:	00813823          	sd	s0,16(sp)
    80005a70:	00913423          	sd	s1,8(sp)
    80005a74:	01213023          	sd	s2,0(sp)
    80005a78:	02010413          	addi	s0,sp,32
    80005a7c:	00050493          	mv	s1,a0
        int i = 0;
    80005a80:	00000913          	li	s2,0
        while (!threadEnd) {
    80005a84:	00008797          	auipc	a5,0x8
    80005a88:	53c7a783          	lw	a5,1340(a5) # 8000dfc0 <_ZL9threadEnd>
    80005a8c:	04079263          	bnez	a5,80005ad0 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80005a90:	0204b783          	ld	a5,32(s1)
    80005a94:	0007a583          	lw	a1,0(a5)
    80005a98:	0305859b          	addiw	a1,a1,48
    80005a9c:	0087b503          	ld	a0,8(a5)
    80005aa0:	00001097          	auipc	ra,0x1
    80005aa4:	ea4080e7          	jalr	-348(ra) # 80006944 <_ZN9BufferCPP3putEi>
            i++;
    80005aa8:	0019071b          	addiw	a4,s2,1
    80005aac:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80005ab0:	0204b783          	ld	a5,32(s1)
    80005ab4:	0007a783          	lw	a5,0(a5)
    80005ab8:	00e787bb          	addw	a5,a5,a4
    80005abc:	00500513          	li	a0,5
    80005ac0:	02a7e53b          	remw	a0,a5,a0
    80005ac4:	ffffc097          	auipc	ra,0xffffc
    80005ac8:	87c080e7          	jalr	-1924(ra) # 80001340 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80005acc:	fb9ff06f          	j	80005a84 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80005ad0:	0204b783          	ld	a5,32(s1)
    80005ad4:	0107b503          	ld	a0,16(a5)
    80005ad8:	ffffc097          	auipc	ra,0xffffc
    80005adc:	960080e7          	jalr	-1696(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005ae0:	01813083          	ld	ra,24(sp)
    80005ae4:	01013403          	ld	s0,16(sp)
    80005ae8:	00813483          	ld	s1,8(sp)
    80005aec:	00013903          	ld	s2,0(sp)
    80005af0:	02010113          	addi	sp,sp,32
    80005af4:	00008067          	ret

0000000080005af8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005af8:	fe010113          	addi	sp,sp,-32
    80005afc:	00113c23          	sd	ra,24(sp)
    80005b00:	00813823          	sd	s0,16(sp)
    80005b04:	00913423          	sd	s1,8(sp)
    80005b08:	01213023          	sd	s2,0(sp)
    80005b0c:	02010413          	addi	s0,sp,32
    80005b10:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005b14:	00100793          	li	a5,1
    80005b18:	02a7f863          	bgeu	a5,a0,80005b48 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005b1c:	00a00793          	li	a5,10
    80005b20:	02f577b3          	remu	a5,a0,a5
    80005b24:	02078e63          	beqz	a5,80005b60 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005b28:	fff48513          	addi	a0,s1,-1
    80005b2c:	00000097          	auipc	ra,0x0
    80005b30:	fcc080e7          	jalr	-52(ra) # 80005af8 <_ZL9fibonaccim>
    80005b34:	00050913          	mv	s2,a0
    80005b38:	ffe48513          	addi	a0,s1,-2
    80005b3c:	00000097          	auipc	ra,0x0
    80005b40:	fbc080e7          	jalr	-68(ra) # 80005af8 <_ZL9fibonaccim>
    80005b44:	00a90533          	add	a0,s2,a0
}
    80005b48:	01813083          	ld	ra,24(sp)
    80005b4c:	01013403          	ld	s0,16(sp)
    80005b50:	00813483          	ld	s1,8(sp)
    80005b54:	00013903          	ld	s2,0(sp)
    80005b58:	02010113          	addi	sp,sp,32
    80005b5c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005b60:	ffffc097          	auipc	ra,0xffffc
    80005b64:	dc8080e7          	jalr	-568(ra) # 80001928 <_Z15thread_dispatchv>
    80005b68:	fc1ff06f          	j	80005b28 <_ZL9fibonaccim+0x30>

0000000080005b6c <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005b6c:	fe010113          	addi	sp,sp,-32
    80005b70:	00113c23          	sd	ra,24(sp)
    80005b74:	00813823          	sd	s0,16(sp)
    80005b78:	00913423          	sd	s1,8(sp)
    80005b7c:	01213023          	sd	s2,0(sp)
    80005b80:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005b84:	00a00493          	li	s1,10
    80005b88:	0400006f          	j	80005bc8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005b8c:	00006517          	auipc	a0,0x6
    80005b90:	97c50513          	addi	a0,a0,-1668 # 8000b508 <CONSOLE_STATUS+0x4f8>
    80005b94:	00002097          	auipc	ra,0x2
    80005b98:	b70080e7          	jalr	-1168(ra) # 80007704 <_Z11printStringPKc>
    80005b9c:	00000613          	li	a2,0
    80005ba0:	00a00593          	li	a1,10
    80005ba4:	00048513          	mv	a0,s1
    80005ba8:	00002097          	auipc	ra,0x2
    80005bac:	d0c080e7          	jalr	-756(ra) # 800078b4 <_Z8printIntiii>
    80005bb0:	00006517          	auipc	a0,0x6
    80005bb4:	c2050513          	addi	a0,a0,-992 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005bb8:	00002097          	auipc	ra,0x2
    80005bbc:	b4c080e7          	jalr	-1204(ra) # 80007704 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005bc0:	0014849b          	addiw	s1,s1,1
    80005bc4:	0ff4f493          	andi	s1,s1,255
    80005bc8:	00c00793          	li	a5,12
    80005bcc:	fc97f0e3          	bgeu	a5,s1,80005b8c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005bd0:	00006517          	auipc	a0,0x6
    80005bd4:	94050513          	addi	a0,a0,-1728 # 8000b510 <CONSOLE_STATUS+0x500>
    80005bd8:	00002097          	auipc	ra,0x2
    80005bdc:	b2c080e7          	jalr	-1236(ra) # 80007704 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005be0:	00500313          	li	t1,5
    thread_dispatch();
    80005be4:	ffffc097          	auipc	ra,0xffffc
    80005be8:	d44080e7          	jalr	-700(ra) # 80001928 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005bec:	01000513          	li	a0,16
    80005bf0:	00000097          	auipc	ra,0x0
    80005bf4:	f08080e7          	jalr	-248(ra) # 80005af8 <_ZL9fibonaccim>
    80005bf8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005bfc:	00006517          	auipc	a0,0x6
    80005c00:	92450513          	addi	a0,a0,-1756 # 8000b520 <CONSOLE_STATUS+0x510>
    80005c04:	00002097          	auipc	ra,0x2
    80005c08:	b00080e7          	jalr	-1280(ra) # 80007704 <_Z11printStringPKc>
    80005c0c:	00000613          	li	a2,0
    80005c10:	00a00593          	li	a1,10
    80005c14:	0009051b          	sext.w	a0,s2
    80005c18:	00002097          	auipc	ra,0x2
    80005c1c:	c9c080e7          	jalr	-868(ra) # 800078b4 <_Z8printIntiii>
    80005c20:	00006517          	auipc	a0,0x6
    80005c24:	bb050513          	addi	a0,a0,-1104 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005c28:	00002097          	auipc	ra,0x2
    80005c2c:	adc080e7          	jalr	-1316(ra) # 80007704 <_Z11printStringPKc>
    80005c30:	0400006f          	j	80005c70 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005c34:	00006517          	auipc	a0,0x6
    80005c38:	8d450513          	addi	a0,a0,-1836 # 8000b508 <CONSOLE_STATUS+0x4f8>
    80005c3c:	00002097          	auipc	ra,0x2
    80005c40:	ac8080e7          	jalr	-1336(ra) # 80007704 <_Z11printStringPKc>
    80005c44:	00000613          	li	a2,0
    80005c48:	00a00593          	li	a1,10
    80005c4c:	00048513          	mv	a0,s1
    80005c50:	00002097          	auipc	ra,0x2
    80005c54:	c64080e7          	jalr	-924(ra) # 800078b4 <_Z8printIntiii>
    80005c58:	00006517          	auipc	a0,0x6
    80005c5c:	b7850513          	addi	a0,a0,-1160 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005c60:	00002097          	auipc	ra,0x2
    80005c64:	aa4080e7          	jalr	-1372(ra) # 80007704 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005c68:	0014849b          	addiw	s1,s1,1
    80005c6c:	0ff4f493          	andi	s1,s1,255
    80005c70:	00f00793          	li	a5,15
    80005c74:	fc97f0e3          	bgeu	a5,s1,80005c34 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005c78:	00006517          	auipc	a0,0x6
    80005c7c:	8b850513          	addi	a0,a0,-1864 # 8000b530 <CONSOLE_STATUS+0x520>
    80005c80:	00002097          	auipc	ra,0x2
    80005c84:	a84080e7          	jalr	-1404(ra) # 80007704 <_Z11printStringPKc>
    finishedD = true;
    80005c88:	00100793          	li	a5,1
    80005c8c:	00008717          	auipc	a4,0x8
    80005c90:	34f70223          	sb	a5,836(a4) # 8000dfd0 <_ZL9finishedD>
    thread_dispatch();
    80005c94:	ffffc097          	auipc	ra,0xffffc
    80005c98:	c94080e7          	jalr	-876(ra) # 80001928 <_Z15thread_dispatchv>
}
    80005c9c:	01813083          	ld	ra,24(sp)
    80005ca0:	01013403          	ld	s0,16(sp)
    80005ca4:	00813483          	ld	s1,8(sp)
    80005ca8:	00013903          	ld	s2,0(sp)
    80005cac:	02010113          	addi	sp,sp,32
    80005cb0:	00008067          	ret

0000000080005cb4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005cb4:	fe010113          	addi	sp,sp,-32
    80005cb8:	00113c23          	sd	ra,24(sp)
    80005cbc:	00813823          	sd	s0,16(sp)
    80005cc0:	00913423          	sd	s1,8(sp)
    80005cc4:	01213023          	sd	s2,0(sp)
    80005cc8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005ccc:	00000493          	li	s1,0
    80005cd0:	0400006f          	j	80005d10 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005cd4:	00006517          	auipc	a0,0x6
    80005cd8:	86c50513          	addi	a0,a0,-1940 # 8000b540 <CONSOLE_STATUS+0x530>
    80005cdc:	00002097          	auipc	ra,0x2
    80005ce0:	a28080e7          	jalr	-1496(ra) # 80007704 <_Z11printStringPKc>
    80005ce4:	00000613          	li	a2,0
    80005ce8:	00a00593          	li	a1,10
    80005cec:	00048513          	mv	a0,s1
    80005cf0:	00002097          	auipc	ra,0x2
    80005cf4:	bc4080e7          	jalr	-1084(ra) # 800078b4 <_Z8printIntiii>
    80005cf8:	00006517          	auipc	a0,0x6
    80005cfc:	ad850513          	addi	a0,a0,-1320 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005d00:	00002097          	auipc	ra,0x2
    80005d04:	a04080e7          	jalr	-1532(ra) # 80007704 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005d08:	0014849b          	addiw	s1,s1,1
    80005d0c:	0ff4f493          	andi	s1,s1,255
    80005d10:	00200793          	li	a5,2
    80005d14:	fc97f0e3          	bgeu	a5,s1,80005cd4 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005d18:	00006517          	auipc	a0,0x6
    80005d1c:	83050513          	addi	a0,a0,-2000 # 8000b548 <CONSOLE_STATUS+0x538>
    80005d20:	00002097          	auipc	ra,0x2
    80005d24:	9e4080e7          	jalr	-1564(ra) # 80007704 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005d28:	00700313          	li	t1,7
    thread_dispatch();
    80005d2c:	ffffc097          	auipc	ra,0xffffc
    80005d30:	bfc080e7          	jalr	-1028(ra) # 80001928 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005d34:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005d38:	00006517          	auipc	a0,0x6
    80005d3c:	82050513          	addi	a0,a0,-2016 # 8000b558 <CONSOLE_STATUS+0x548>
    80005d40:	00002097          	auipc	ra,0x2
    80005d44:	9c4080e7          	jalr	-1596(ra) # 80007704 <_Z11printStringPKc>
    80005d48:	00000613          	li	a2,0
    80005d4c:	00a00593          	li	a1,10
    80005d50:	0009051b          	sext.w	a0,s2
    80005d54:	00002097          	auipc	ra,0x2
    80005d58:	b60080e7          	jalr	-1184(ra) # 800078b4 <_Z8printIntiii>
    80005d5c:	00006517          	auipc	a0,0x6
    80005d60:	a7450513          	addi	a0,a0,-1420 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005d64:	00002097          	auipc	ra,0x2
    80005d68:	9a0080e7          	jalr	-1632(ra) # 80007704 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005d6c:	00c00513          	li	a0,12
    80005d70:	00000097          	auipc	ra,0x0
    80005d74:	d88080e7          	jalr	-632(ra) # 80005af8 <_ZL9fibonaccim>
    80005d78:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005d7c:	00005517          	auipc	a0,0x5
    80005d80:	7e450513          	addi	a0,a0,2020 # 8000b560 <CONSOLE_STATUS+0x550>
    80005d84:	00002097          	auipc	ra,0x2
    80005d88:	980080e7          	jalr	-1664(ra) # 80007704 <_Z11printStringPKc>
    80005d8c:	00000613          	li	a2,0
    80005d90:	00a00593          	li	a1,10
    80005d94:	0009051b          	sext.w	a0,s2
    80005d98:	00002097          	auipc	ra,0x2
    80005d9c:	b1c080e7          	jalr	-1252(ra) # 800078b4 <_Z8printIntiii>
    80005da0:	00006517          	auipc	a0,0x6
    80005da4:	a3050513          	addi	a0,a0,-1488 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005da8:	00002097          	auipc	ra,0x2
    80005dac:	95c080e7          	jalr	-1700(ra) # 80007704 <_Z11printStringPKc>
    80005db0:	0400006f          	j	80005df0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005db4:	00005517          	auipc	a0,0x5
    80005db8:	78c50513          	addi	a0,a0,1932 # 8000b540 <CONSOLE_STATUS+0x530>
    80005dbc:	00002097          	auipc	ra,0x2
    80005dc0:	948080e7          	jalr	-1720(ra) # 80007704 <_Z11printStringPKc>
    80005dc4:	00000613          	li	a2,0
    80005dc8:	00a00593          	li	a1,10
    80005dcc:	00048513          	mv	a0,s1
    80005dd0:	00002097          	auipc	ra,0x2
    80005dd4:	ae4080e7          	jalr	-1308(ra) # 800078b4 <_Z8printIntiii>
    80005dd8:	00006517          	auipc	a0,0x6
    80005ddc:	9f850513          	addi	a0,a0,-1544 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005de0:	00002097          	auipc	ra,0x2
    80005de4:	924080e7          	jalr	-1756(ra) # 80007704 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005de8:	0014849b          	addiw	s1,s1,1
    80005dec:	0ff4f493          	andi	s1,s1,255
    80005df0:	00500793          	li	a5,5
    80005df4:	fc97f0e3          	bgeu	a5,s1,80005db4 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005df8:	00005517          	auipc	a0,0x5
    80005dfc:	77850513          	addi	a0,a0,1912 # 8000b570 <CONSOLE_STATUS+0x560>
    80005e00:	00002097          	auipc	ra,0x2
    80005e04:	904080e7          	jalr	-1788(ra) # 80007704 <_Z11printStringPKc>
    finishedC = true;
    80005e08:	00100793          	li	a5,1
    80005e0c:	00008717          	auipc	a4,0x8
    80005e10:	1cf702a3          	sb	a5,453(a4) # 8000dfd1 <_ZL9finishedC>
    thread_dispatch();
    80005e14:	ffffc097          	auipc	ra,0xffffc
    80005e18:	b14080e7          	jalr	-1260(ra) # 80001928 <_Z15thread_dispatchv>
}
    80005e1c:	01813083          	ld	ra,24(sp)
    80005e20:	01013403          	ld	s0,16(sp)
    80005e24:	00813483          	ld	s1,8(sp)
    80005e28:	00013903          	ld	s2,0(sp)
    80005e2c:	02010113          	addi	sp,sp,32
    80005e30:	00008067          	ret

0000000080005e34 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005e34:	fe010113          	addi	sp,sp,-32
    80005e38:	00113c23          	sd	ra,24(sp)
    80005e3c:	00813823          	sd	s0,16(sp)
    80005e40:	00913423          	sd	s1,8(sp)
    80005e44:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005e48:	00000493          	li	s1,0
    80005e4c:	0340006f          	j	80005e80 <_ZL11workerBodyBPv+0x4c>
        for (uint64 j = 0; j < 100; j++) {
    80005e50:	00168693          	addi	a3,a3,1
    80005e54:	06300793          	li	a5,99
    80005e58:	00d7ee63          	bltu	a5,a3,80005e74 <_ZL11workerBodyBPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005e5c:	00000713          	li	a4,0
    80005e60:	000077b7          	lui	a5,0x7
    80005e64:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005e68:	fee7e4e3          	bltu	a5,a4,80005e50 <_ZL11workerBodyBPv+0x1c>
    80005e6c:	00170713          	addi	a4,a4,1
    80005e70:	ff1ff06f          	j	80005e60 <_ZL11workerBodyBPv+0x2c>
        if (i == 10) {
    80005e74:	00a00793          	li	a5,10
    80005e78:	04f48663          	beq	s1,a5,80005ec4 <_ZL11workerBodyBPv+0x90>
    for (uint64 i = 0; i < 16; i++) {
    80005e7c:	00148493          	addi	s1,s1,1
    80005e80:	00f00793          	li	a5,15
    80005e84:	0497e463          	bltu	a5,s1,80005ecc <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005e88:	00005517          	auipc	a0,0x5
    80005e8c:	6f850513          	addi	a0,a0,1784 # 8000b580 <CONSOLE_STATUS+0x570>
    80005e90:	00002097          	auipc	ra,0x2
    80005e94:	874080e7          	jalr	-1932(ra) # 80007704 <_Z11printStringPKc>
    80005e98:	00000613          	li	a2,0
    80005e9c:	00a00593          	li	a1,10
    80005ea0:	0004851b          	sext.w	a0,s1
    80005ea4:	00002097          	auipc	ra,0x2
    80005ea8:	a10080e7          	jalr	-1520(ra) # 800078b4 <_Z8printIntiii>
    80005eac:	00006517          	auipc	a0,0x6
    80005eb0:	92450513          	addi	a0,a0,-1756 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005eb4:	00002097          	auipc	ra,0x2
    80005eb8:	850080e7          	jalr	-1968(ra) # 80007704 <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80005ebc:	00000693          	li	a3,0
    80005ec0:	f95ff06f          	j	80005e54 <_ZL11workerBodyBPv+0x20>
            asm volatile("csrr t6, sepc");
    80005ec4:	14102ff3          	csrr	t6,sepc
    80005ec8:	fb5ff06f          	j	80005e7c <_ZL11workerBodyBPv+0x48>
    printString("B finished!\n");
    80005ecc:	00005517          	auipc	a0,0x5
    80005ed0:	6bc50513          	addi	a0,a0,1724 # 8000b588 <CONSOLE_STATUS+0x578>
    80005ed4:	00002097          	auipc	ra,0x2
    80005ed8:	830080e7          	jalr	-2000(ra) # 80007704 <_Z11printStringPKc>
    finishedB = true;
    80005edc:	00100793          	li	a5,1
    80005ee0:	00008717          	auipc	a4,0x8
    80005ee4:	0ef70923          	sb	a5,242(a4) # 8000dfd2 <_ZL9finishedB>
    thread_dispatch();
    80005ee8:	ffffc097          	auipc	ra,0xffffc
    80005eec:	a40080e7          	jalr	-1472(ra) # 80001928 <_Z15thread_dispatchv>
}
    80005ef0:	01813083          	ld	ra,24(sp)
    80005ef4:	01013403          	ld	s0,16(sp)
    80005ef8:	00813483          	ld	s1,8(sp)
    80005efc:	02010113          	addi	sp,sp,32
    80005f00:	00008067          	ret

0000000080005f04 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005f04:	fe010113          	addi	sp,sp,-32
    80005f08:	00113c23          	sd	ra,24(sp)
    80005f0c:	00813823          	sd	s0,16(sp)
    80005f10:	00913423          	sd	s1,8(sp)
    80005f14:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005f18:	00000493          	li	s1,0
    80005f1c:	02c0006f          	j	80005f48 <_ZL11workerBodyAPv+0x44>
        for (uint64 j = 0; j < 100; j++) {
    80005f20:	00168693          	addi	a3,a3,1
    80005f24:	06300793          	li	a5,99
    80005f28:	00d7ee63          	bltu	a5,a3,80005f44 <_ZL11workerBodyAPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005f2c:	00000713          	li	a4,0
    80005f30:	000077b7          	lui	a5,0x7
    80005f34:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005f38:	fee7e4e3          	bltu	a5,a4,80005f20 <_ZL11workerBodyAPv+0x1c>
    80005f3c:	00170713          	addi	a4,a4,1
    80005f40:	ff1ff06f          	j	80005f30 <_ZL11workerBodyAPv+0x2c>
    for (uint64 i = 0; i < 10; i++) {
    80005f44:	00148493          	addi	s1,s1,1
    80005f48:	00900793          	li	a5,9
    80005f4c:	0497e063          	bltu	a5,s1,80005f8c <_ZL11workerBodyAPv+0x88>
        printString("A: i="); printInt(i); printString("\n");
    80005f50:	00005517          	auipc	a0,0x5
    80005f54:	64850513          	addi	a0,a0,1608 # 8000b598 <CONSOLE_STATUS+0x588>
    80005f58:	00001097          	auipc	ra,0x1
    80005f5c:	7ac080e7          	jalr	1964(ra) # 80007704 <_Z11printStringPKc>
    80005f60:	00000613          	li	a2,0
    80005f64:	00a00593          	li	a1,10
    80005f68:	0004851b          	sext.w	a0,s1
    80005f6c:	00002097          	auipc	ra,0x2
    80005f70:	948080e7          	jalr	-1720(ra) # 800078b4 <_Z8printIntiii>
    80005f74:	00006517          	auipc	a0,0x6
    80005f78:	85c50513          	addi	a0,a0,-1956 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80005f7c:	00001097          	auipc	ra,0x1
    80005f80:	788080e7          	jalr	1928(ra) # 80007704 <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80005f84:	00000693          	li	a3,0
    80005f88:	f9dff06f          	j	80005f24 <_ZL11workerBodyAPv+0x20>
    printString("A finished!\n");
    80005f8c:	00005517          	auipc	a0,0x5
    80005f90:	61450513          	addi	a0,a0,1556 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80005f94:	00001097          	auipc	ra,0x1
    80005f98:	770080e7          	jalr	1904(ra) # 80007704 <_Z11printStringPKc>
    finishedA = true;
    80005f9c:	00100793          	li	a5,1
    80005fa0:	00008717          	auipc	a4,0x8
    80005fa4:	02f709a3          	sb	a5,51(a4) # 8000dfd3 <_ZL9finishedA>
}
    80005fa8:	01813083          	ld	ra,24(sp)
    80005fac:	01013403          	ld	s0,16(sp)
    80005fb0:	00813483          	ld	s1,8(sp)
    80005fb4:	02010113          	addi	sp,sp,32
    80005fb8:	00008067          	ret

0000000080005fbc <_Z16System_Mode_testv>:


void System_Mode_test() {
    80005fbc:	fd010113          	addi	sp,sp,-48
    80005fc0:	02113423          	sd	ra,40(sp)
    80005fc4:	02813023          	sd	s0,32(sp)
    80005fc8:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005fcc:	00000613          	li	a2,0
    80005fd0:	00000597          	auipc	a1,0x0
    80005fd4:	f3458593          	addi	a1,a1,-204 # 80005f04 <_ZL11workerBodyAPv>
    80005fd8:	fd040513          	addi	a0,s0,-48
    80005fdc:	ffffc097          	auipc	ra,0xffffc
    80005fe0:	8b0080e7          	jalr	-1872(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80005fe4:	00005517          	auipc	a0,0x5
    80005fe8:	5cc50513          	addi	a0,a0,1484 # 8000b5b0 <CONSOLE_STATUS+0x5a0>
    80005fec:	00001097          	auipc	ra,0x1
    80005ff0:	718080e7          	jalr	1816(ra) # 80007704 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[1], workerBodyB, nullptr);
    80005ff4:	00000613          	li	a2,0
    80005ff8:	00000597          	auipc	a1,0x0
    80005ffc:	e3c58593          	addi	a1,a1,-452 # 80005e34 <_ZL11workerBodyBPv>
    80006000:	fd840513          	addi	a0,s0,-40
    80006004:	ffffc097          	auipc	ra,0xffffc
    80006008:	888080e7          	jalr	-1912(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    8000600c:	00005517          	auipc	a0,0x5
    80006010:	5bc50513          	addi	a0,a0,1468 # 8000b5c8 <CONSOLE_STATUS+0x5b8>
    80006014:	00001097          	auipc	ra,0x1
    80006018:	6f0080e7          	jalr	1776(ra) # 80007704 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[2], workerBodyC, nullptr);
    8000601c:	00000613          	li	a2,0
    80006020:	00000597          	auipc	a1,0x0
    80006024:	c9458593          	addi	a1,a1,-876 # 80005cb4 <_ZL11workerBodyCPv>
    80006028:	fe040513          	addi	a0,s0,-32
    8000602c:	ffffc097          	auipc	ra,0xffffc
    80006030:	860080e7          	jalr	-1952(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80006034:	00005517          	auipc	a0,0x5
    80006038:	5ac50513          	addi	a0,a0,1452 # 8000b5e0 <CONSOLE_STATUS+0x5d0>
    8000603c:	00001097          	auipc	ra,0x1
    80006040:	6c8080e7          	jalr	1736(ra) # 80007704 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[3], workerBodyD, nullptr);
    80006044:	00000613          	li	a2,0
    80006048:	00000597          	auipc	a1,0x0
    8000604c:	b2458593          	addi	a1,a1,-1244 # 80005b6c <_ZL11workerBodyDPv>
    80006050:	fe840513          	addi	a0,s0,-24
    80006054:	ffffc097          	auipc	ra,0xffffc
    80006058:	838080e7          	jalr	-1992(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    8000605c:	00005517          	auipc	a0,0x5
    80006060:	59c50513          	addi	a0,a0,1436 # 8000b5f8 <CONSOLE_STATUS+0x5e8>
    80006064:	00001097          	auipc	ra,0x1
    80006068:	6a0080e7          	jalr	1696(ra) # 80007704 <_Z11printStringPKc>
    8000606c:	00c0006f          	j	80006078 <_Z16System_Mode_testv+0xbc>
    // testUser();

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006070:	ffffc097          	auipc	ra,0xffffc
    80006074:	8b8080e7          	jalr	-1864(ra) # 80001928 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006078:	00008797          	auipc	a5,0x8
    8000607c:	f5b7c783          	lbu	a5,-165(a5) # 8000dfd3 <_ZL9finishedA>
    80006080:	fe0788e3          	beqz	a5,80006070 <_Z16System_Mode_testv+0xb4>
    80006084:	00008797          	auipc	a5,0x8
    80006088:	f4e7c783          	lbu	a5,-178(a5) # 8000dfd2 <_ZL9finishedB>
    8000608c:	fe0782e3          	beqz	a5,80006070 <_Z16System_Mode_testv+0xb4>
    80006090:	00008797          	auipc	a5,0x8
    80006094:	f417c783          	lbu	a5,-191(a5) # 8000dfd1 <_ZL9finishedC>
    80006098:	fc078ce3          	beqz	a5,80006070 <_Z16System_Mode_testv+0xb4>
    8000609c:	00008797          	auipc	a5,0x8
    800060a0:	f347c783          	lbu	a5,-204(a5) # 8000dfd0 <_ZL9finishedD>
    800060a4:	fc0786e3          	beqz	a5,80006070 <_Z16System_Mode_testv+0xb4>
    }

}
    800060a8:	02813083          	ld	ra,40(sp)
    800060ac:	02013403          	ld	s0,32(sp)
    800060b0:	03010113          	addi	sp,sp,48
    800060b4:	00008067          	ret

00000000800060b8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800060b8:	fe010113          	addi	sp,sp,-32
    800060bc:	00113c23          	sd	ra,24(sp)
    800060c0:	00813823          	sd	s0,16(sp)
    800060c4:	00913423          	sd	s1,8(sp)
    800060c8:	01213023          	sd	s2,0(sp)
    800060cc:	02010413          	addi	s0,sp,32
    800060d0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800060d4:	00100793          	li	a5,1
    800060d8:	02a7f863          	bgeu	a5,a0,80006108 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800060dc:	00a00793          	li	a5,10
    800060e0:	02f577b3          	remu	a5,a0,a5
    800060e4:	02078e63          	beqz	a5,80006120 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800060e8:	fff48513          	addi	a0,s1,-1
    800060ec:	00000097          	auipc	ra,0x0
    800060f0:	fcc080e7          	jalr	-52(ra) # 800060b8 <_ZL9fibonaccim>
    800060f4:	00050913          	mv	s2,a0
    800060f8:	ffe48513          	addi	a0,s1,-2
    800060fc:	00000097          	auipc	ra,0x0
    80006100:	fbc080e7          	jalr	-68(ra) # 800060b8 <_ZL9fibonaccim>
    80006104:	00a90533          	add	a0,s2,a0
}
    80006108:	01813083          	ld	ra,24(sp)
    8000610c:	01013403          	ld	s0,16(sp)
    80006110:	00813483          	ld	s1,8(sp)
    80006114:	00013903          	ld	s2,0(sp)
    80006118:	02010113          	addi	sp,sp,32
    8000611c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006120:	ffffc097          	auipc	ra,0xffffc
    80006124:	808080e7          	jalr	-2040(ra) # 80001928 <_Z15thread_dispatchv>
    80006128:	fc1ff06f          	j	800060e8 <_ZL9fibonaccim+0x30>

000000008000612c <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000612c:	fe010113          	addi	sp,sp,-32
    80006130:	00113c23          	sd	ra,24(sp)
    80006134:	00813823          	sd	s0,16(sp)
    80006138:	00913423          	sd	s1,8(sp)
    8000613c:	01213023          	sd	s2,0(sp)
    80006140:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006144:	00a00493          	li	s1,10
    80006148:	0400006f          	j	80006188 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000614c:	00005517          	auipc	a0,0x5
    80006150:	3bc50513          	addi	a0,a0,956 # 8000b508 <CONSOLE_STATUS+0x4f8>
    80006154:	00001097          	auipc	ra,0x1
    80006158:	5b0080e7          	jalr	1456(ra) # 80007704 <_Z11printStringPKc>
    8000615c:	00000613          	li	a2,0
    80006160:	00a00593          	li	a1,10
    80006164:	00048513          	mv	a0,s1
    80006168:	00001097          	auipc	ra,0x1
    8000616c:	74c080e7          	jalr	1868(ra) # 800078b4 <_Z8printIntiii>
    80006170:	00005517          	auipc	a0,0x5
    80006174:	66050513          	addi	a0,a0,1632 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006178:	00001097          	auipc	ra,0x1
    8000617c:	58c080e7          	jalr	1420(ra) # 80007704 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006180:	0014849b          	addiw	s1,s1,1
    80006184:	0ff4f493          	andi	s1,s1,255
    80006188:	00c00793          	li	a5,12
    8000618c:	fc97f0e3          	bgeu	a5,s1,8000614c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006190:	00005517          	auipc	a0,0x5
    80006194:	38050513          	addi	a0,a0,896 # 8000b510 <CONSOLE_STATUS+0x500>
    80006198:	00001097          	auipc	ra,0x1
    8000619c:	56c080e7          	jalr	1388(ra) # 80007704 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800061a0:	00500313          	li	t1,5
    thread_dispatch();
    800061a4:	ffffb097          	auipc	ra,0xffffb
    800061a8:	784080e7          	jalr	1924(ra) # 80001928 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800061ac:	01000513          	li	a0,16
    800061b0:	00000097          	auipc	ra,0x0
    800061b4:	f08080e7          	jalr	-248(ra) # 800060b8 <_ZL9fibonaccim>
    800061b8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800061bc:	00005517          	auipc	a0,0x5
    800061c0:	36450513          	addi	a0,a0,868 # 8000b520 <CONSOLE_STATUS+0x510>
    800061c4:	00001097          	auipc	ra,0x1
    800061c8:	540080e7          	jalr	1344(ra) # 80007704 <_Z11printStringPKc>
    800061cc:	00000613          	li	a2,0
    800061d0:	00a00593          	li	a1,10
    800061d4:	0009051b          	sext.w	a0,s2
    800061d8:	00001097          	auipc	ra,0x1
    800061dc:	6dc080e7          	jalr	1756(ra) # 800078b4 <_Z8printIntiii>
    800061e0:	00005517          	auipc	a0,0x5
    800061e4:	5f050513          	addi	a0,a0,1520 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    800061e8:	00001097          	auipc	ra,0x1
    800061ec:	51c080e7          	jalr	1308(ra) # 80007704 <_Z11printStringPKc>
    800061f0:	0400006f          	j	80006230 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800061f4:	00005517          	auipc	a0,0x5
    800061f8:	31450513          	addi	a0,a0,788 # 8000b508 <CONSOLE_STATUS+0x4f8>
    800061fc:	00001097          	auipc	ra,0x1
    80006200:	508080e7          	jalr	1288(ra) # 80007704 <_Z11printStringPKc>
    80006204:	00000613          	li	a2,0
    80006208:	00a00593          	li	a1,10
    8000620c:	00048513          	mv	a0,s1
    80006210:	00001097          	auipc	ra,0x1
    80006214:	6a4080e7          	jalr	1700(ra) # 800078b4 <_Z8printIntiii>
    80006218:	00005517          	auipc	a0,0x5
    8000621c:	5b850513          	addi	a0,a0,1464 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006220:	00001097          	auipc	ra,0x1
    80006224:	4e4080e7          	jalr	1252(ra) # 80007704 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006228:	0014849b          	addiw	s1,s1,1
    8000622c:	0ff4f493          	andi	s1,s1,255
    80006230:	00f00793          	li	a5,15
    80006234:	fc97f0e3          	bgeu	a5,s1,800061f4 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006238:	00005517          	auipc	a0,0x5
    8000623c:	2f850513          	addi	a0,a0,760 # 8000b530 <CONSOLE_STATUS+0x520>
    80006240:	00001097          	auipc	ra,0x1
    80006244:	4c4080e7          	jalr	1220(ra) # 80007704 <_Z11printStringPKc>
    finishedD = true;
    80006248:	00100793          	li	a5,1
    8000624c:	00008717          	auipc	a4,0x8
    80006250:	d8f70423          	sb	a5,-632(a4) # 8000dfd4 <_ZL9finishedD>
    thread_dispatch();
    80006254:	ffffb097          	auipc	ra,0xffffb
    80006258:	6d4080e7          	jalr	1748(ra) # 80001928 <_Z15thread_dispatchv>
}
    8000625c:	01813083          	ld	ra,24(sp)
    80006260:	01013403          	ld	s0,16(sp)
    80006264:	00813483          	ld	s1,8(sp)
    80006268:	00013903          	ld	s2,0(sp)
    8000626c:	02010113          	addi	sp,sp,32
    80006270:	00008067          	ret

0000000080006274 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006274:	fe010113          	addi	sp,sp,-32
    80006278:	00113c23          	sd	ra,24(sp)
    8000627c:	00813823          	sd	s0,16(sp)
    80006280:	00913423          	sd	s1,8(sp)
    80006284:	01213023          	sd	s2,0(sp)
    80006288:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000628c:	00000493          	li	s1,0
    80006290:	0400006f          	j	800062d0 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006294:	00005517          	auipc	a0,0x5
    80006298:	2ac50513          	addi	a0,a0,684 # 8000b540 <CONSOLE_STATUS+0x530>
    8000629c:	00001097          	auipc	ra,0x1
    800062a0:	468080e7          	jalr	1128(ra) # 80007704 <_Z11printStringPKc>
    800062a4:	00000613          	li	a2,0
    800062a8:	00a00593          	li	a1,10
    800062ac:	00048513          	mv	a0,s1
    800062b0:	00001097          	auipc	ra,0x1
    800062b4:	604080e7          	jalr	1540(ra) # 800078b4 <_Z8printIntiii>
    800062b8:	00005517          	auipc	a0,0x5
    800062bc:	51850513          	addi	a0,a0,1304 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    800062c0:	00001097          	auipc	ra,0x1
    800062c4:	444080e7          	jalr	1092(ra) # 80007704 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800062c8:	0014849b          	addiw	s1,s1,1
    800062cc:	0ff4f493          	andi	s1,s1,255
    800062d0:	00200793          	li	a5,2
    800062d4:	fc97f0e3          	bgeu	a5,s1,80006294 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800062d8:	00005517          	auipc	a0,0x5
    800062dc:	27050513          	addi	a0,a0,624 # 8000b548 <CONSOLE_STATUS+0x538>
    800062e0:	00001097          	auipc	ra,0x1
    800062e4:	424080e7          	jalr	1060(ra) # 80007704 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800062e8:	00700313          	li	t1,7
    thread_dispatch();
    800062ec:	ffffb097          	auipc	ra,0xffffb
    800062f0:	63c080e7          	jalr	1596(ra) # 80001928 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800062f4:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800062f8:	00005517          	auipc	a0,0x5
    800062fc:	26050513          	addi	a0,a0,608 # 8000b558 <CONSOLE_STATUS+0x548>
    80006300:	00001097          	auipc	ra,0x1
    80006304:	404080e7          	jalr	1028(ra) # 80007704 <_Z11printStringPKc>
    80006308:	00000613          	li	a2,0
    8000630c:	00a00593          	li	a1,10
    80006310:	0009051b          	sext.w	a0,s2
    80006314:	00001097          	auipc	ra,0x1
    80006318:	5a0080e7          	jalr	1440(ra) # 800078b4 <_Z8printIntiii>
    8000631c:	00005517          	auipc	a0,0x5
    80006320:	4b450513          	addi	a0,a0,1204 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006324:	00001097          	auipc	ra,0x1
    80006328:	3e0080e7          	jalr	992(ra) # 80007704 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000632c:	00c00513          	li	a0,12
    80006330:	00000097          	auipc	ra,0x0
    80006334:	d88080e7          	jalr	-632(ra) # 800060b8 <_ZL9fibonaccim>
    80006338:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000633c:	00005517          	auipc	a0,0x5
    80006340:	22450513          	addi	a0,a0,548 # 8000b560 <CONSOLE_STATUS+0x550>
    80006344:	00001097          	auipc	ra,0x1
    80006348:	3c0080e7          	jalr	960(ra) # 80007704 <_Z11printStringPKc>
    8000634c:	00000613          	li	a2,0
    80006350:	00a00593          	li	a1,10
    80006354:	0009051b          	sext.w	a0,s2
    80006358:	00001097          	auipc	ra,0x1
    8000635c:	55c080e7          	jalr	1372(ra) # 800078b4 <_Z8printIntiii>
    80006360:	00005517          	auipc	a0,0x5
    80006364:	47050513          	addi	a0,a0,1136 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006368:	00001097          	auipc	ra,0x1
    8000636c:	39c080e7          	jalr	924(ra) # 80007704 <_Z11printStringPKc>
    80006370:	0400006f          	j	800063b0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006374:	00005517          	auipc	a0,0x5
    80006378:	1cc50513          	addi	a0,a0,460 # 8000b540 <CONSOLE_STATUS+0x530>
    8000637c:	00001097          	auipc	ra,0x1
    80006380:	388080e7          	jalr	904(ra) # 80007704 <_Z11printStringPKc>
    80006384:	00000613          	li	a2,0
    80006388:	00a00593          	li	a1,10
    8000638c:	00048513          	mv	a0,s1
    80006390:	00001097          	auipc	ra,0x1
    80006394:	524080e7          	jalr	1316(ra) # 800078b4 <_Z8printIntiii>
    80006398:	00005517          	auipc	a0,0x5
    8000639c:	43850513          	addi	a0,a0,1080 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    800063a0:	00001097          	auipc	ra,0x1
    800063a4:	364080e7          	jalr	868(ra) # 80007704 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800063a8:	0014849b          	addiw	s1,s1,1
    800063ac:	0ff4f493          	andi	s1,s1,255
    800063b0:	00500793          	li	a5,5
    800063b4:	fc97f0e3          	bgeu	a5,s1,80006374 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    800063b8:	00005517          	auipc	a0,0x5
    800063bc:	1b850513          	addi	a0,a0,440 # 8000b570 <CONSOLE_STATUS+0x560>
    800063c0:	00001097          	auipc	ra,0x1
    800063c4:	344080e7          	jalr	836(ra) # 80007704 <_Z11printStringPKc>
    finishedC = true;
    800063c8:	00100793          	li	a5,1
    800063cc:	00008717          	auipc	a4,0x8
    800063d0:	c0f704a3          	sb	a5,-1015(a4) # 8000dfd5 <_ZL9finishedC>
    thread_dispatch();
    800063d4:	ffffb097          	auipc	ra,0xffffb
    800063d8:	554080e7          	jalr	1364(ra) # 80001928 <_Z15thread_dispatchv>
}
    800063dc:	01813083          	ld	ra,24(sp)
    800063e0:	01013403          	ld	s0,16(sp)
    800063e4:	00813483          	ld	s1,8(sp)
    800063e8:	00013903          	ld	s2,0(sp)
    800063ec:	02010113          	addi	sp,sp,32
    800063f0:	00008067          	ret

00000000800063f4 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800063f4:	fe010113          	addi	sp,sp,-32
    800063f8:	00113c23          	sd	ra,24(sp)
    800063fc:	00813823          	sd	s0,16(sp)
    80006400:	00913423          	sd	s1,8(sp)
    80006404:	01213023          	sd	s2,0(sp)
    80006408:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000640c:	00000913          	li	s2,0
    80006410:	0080006f          	j	80006418 <_ZL11workerBodyBPv+0x24>
    80006414:	00190913          	addi	s2,s2,1
    80006418:	00f00793          	li	a5,15
    8000641c:	0527ea63          	bltu	a5,s2,80006470 <_ZL11workerBodyBPv+0x7c>
        printString("B: i="); printInt(i); printString("\n");
    80006420:	00005517          	auipc	a0,0x5
    80006424:	16050513          	addi	a0,a0,352 # 8000b580 <CONSOLE_STATUS+0x570>
    80006428:	00001097          	auipc	ra,0x1
    8000642c:	2dc080e7          	jalr	732(ra) # 80007704 <_Z11printStringPKc>
    80006430:	00000613          	li	a2,0
    80006434:	00a00593          	li	a1,10
    80006438:	0009051b          	sext.w	a0,s2
    8000643c:	00001097          	auipc	ra,0x1
    80006440:	478080e7          	jalr	1144(ra) # 800078b4 <_Z8printIntiii>
    80006444:	00005517          	auipc	a0,0x5
    80006448:	38c50513          	addi	a0,a0,908 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    8000644c:	00001097          	auipc	ra,0x1
    80006450:	2b8080e7          	jalr	696(ra) # 80007704 <_Z11printStringPKc>
        for (uint64 j = 0; j < 1000; j++) {
    80006454:	00000493          	li	s1,0
    80006458:	3e700793          	li	a5,999
    8000645c:	fa97ece3          	bltu	a5,s1,80006414 <_ZL11workerBodyBPv+0x20>
            thread_dispatch();
    80006460:	ffffb097          	auipc	ra,0xffffb
    80006464:	4c8080e7          	jalr	1224(ra) # 80001928 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 1000; j++) {
    80006468:	00148493          	addi	s1,s1,1
    8000646c:	fedff06f          	j	80006458 <_ZL11workerBodyBPv+0x64>
    printString("B finished!\n");
    80006470:	00005517          	auipc	a0,0x5
    80006474:	11850513          	addi	a0,a0,280 # 8000b588 <CONSOLE_STATUS+0x578>
    80006478:	00001097          	auipc	ra,0x1
    8000647c:	28c080e7          	jalr	652(ra) # 80007704 <_Z11printStringPKc>
    finishedB = true;
    80006480:	00100793          	li	a5,1
    80006484:	00008717          	auipc	a4,0x8
    80006488:	b4f70923          	sb	a5,-1198(a4) # 8000dfd6 <_ZL9finishedB>
    thread_dispatch();
    8000648c:	ffffb097          	auipc	ra,0xffffb
    80006490:	49c080e7          	jalr	1180(ra) # 80001928 <_Z15thread_dispatchv>
}
    80006494:	01813083          	ld	ra,24(sp)
    80006498:	01013403          	ld	s0,16(sp)
    8000649c:	00813483          	ld	s1,8(sp)
    800064a0:	00013903          	ld	s2,0(sp)
    800064a4:	02010113          	addi	sp,sp,32
    800064a8:	00008067          	ret

00000000800064ac <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800064ac:	fe010113          	addi	sp,sp,-32
    800064b0:	00113c23          	sd	ra,24(sp)
    800064b4:	00813823          	sd	s0,16(sp)
    800064b8:	00913423          	sd	s1,8(sp)
    800064bc:	01213023          	sd	s2,0(sp)
    800064c0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800064c4:	00000913          	li	s2,0
    800064c8:	0080006f          	j	800064d0 <_ZL11workerBodyAPv+0x24>
    800064cc:	00190913          	addi	s2,s2,1
    800064d0:	00900793          	li	a5,9
    800064d4:	0527ea63          	bltu	a5,s2,80006528 <_ZL11workerBodyAPv+0x7c>
        printString("A: i="); printInt(i); printString("\n");
    800064d8:	00005517          	auipc	a0,0x5
    800064dc:	0c050513          	addi	a0,a0,192 # 8000b598 <CONSOLE_STATUS+0x588>
    800064e0:	00001097          	auipc	ra,0x1
    800064e4:	224080e7          	jalr	548(ra) # 80007704 <_Z11printStringPKc>
    800064e8:	00000613          	li	a2,0
    800064ec:	00a00593          	li	a1,10
    800064f0:	0009051b          	sext.w	a0,s2
    800064f4:	00001097          	auipc	ra,0x1
    800064f8:	3c0080e7          	jalr	960(ra) # 800078b4 <_Z8printIntiii>
    800064fc:	00005517          	auipc	a0,0x5
    80006500:	2d450513          	addi	a0,a0,724 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006504:	00001097          	auipc	ra,0x1
    80006508:	200080e7          	jalr	512(ra) # 80007704 <_Z11printStringPKc>
        for (uint64 j = 0; j < 1000; j++) {
    8000650c:	00000493          	li	s1,0
    80006510:	3e700793          	li	a5,999
    80006514:	fa97ece3          	bltu	a5,s1,800064cc <_ZL11workerBodyAPv+0x20>
            thread_dispatch();
    80006518:	ffffb097          	auipc	ra,0xffffb
    8000651c:	410080e7          	jalr	1040(ra) # 80001928 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 1000; j++) {
    80006520:	00148493          	addi	s1,s1,1
    80006524:	fedff06f          	j	80006510 <_ZL11workerBodyAPv+0x64>
    printString("A finished!\n");
    80006528:	00005517          	auipc	a0,0x5
    8000652c:	07850513          	addi	a0,a0,120 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80006530:	00001097          	auipc	ra,0x1
    80006534:	1d4080e7          	jalr	468(ra) # 80007704 <_Z11printStringPKc>
    finishedA = true;
    80006538:	00100793          	li	a5,1
    8000653c:	00008717          	auipc	a4,0x8
    80006540:	a8f70da3          	sb	a5,-1381(a4) # 8000dfd7 <_ZL9finishedA>
}
    80006544:	01813083          	ld	ra,24(sp)
    80006548:	01013403          	ld	s0,16(sp)
    8000654c:	00813483          	ld	s1,8(sp)
    80006550:	00013903          	ld	s2,0(sp)
    80006554:	02010113          	addi	sp,sp,32
    80006558:	00008067          	ret

000000008000655c <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    8000655c:	fd010113          	addi	sp,sp,-48
    80006560:	02113423          	sd	ra,40(sp)
    80006564:	02813023          	sd	s0,32(sp)
    80006568:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000656c:	00000613          	li	a2,0
    80006570:	00000597          	auipc	a1,0x0
    80006574:	f3c58593          	addi	a1,a1,-196 # 800064ac <_ZL11workerBodyAPv>
    80006578:	fd040513          	addi	a0,s0,-48
    8000657c:	ffffb097          	auipc	ra,0xffffb
    80006580:	310080e7          	jalr	784(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80006584:	00005517          	auipc	a0,0x5
    80006588:	02c50513          	addi	a0,a0,44 # 8000b5b0 <CONSOLE_STATUS+0x5a0>
    8000658c:	00001097          	auipc	ra,0x1
    80006590:	178080e7          	jalr	376(ra) # 80007704 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006594:	00000613          	li	a2,0
    80006598:	00000597          	auipc	a1,0x0
    8000659c:	e5c58593          	addi	a1,a1,-420 # 800063f4 <_ZL11workerBodyBPv>
    800065a0:	fd840513          	addi	a0,s0,-40
    800065a4:	ffffb097          	auipc	ra,0xffffb
    800065a8:	2e8080e7          	jalr	744(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    800065ac:	00005517          	auipc	a0,0x5
    800065b0:	01c50513          	addi	a0,a0,28 # 8000b5c8 <CONSOLE_STATUS+0x5b8>
    800065b4:	00001097          	auipc	ra,0x1
    800065b8:	150080e7          	jalr	336(ra) # 80007704 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800065bc:	00000613          	li	a2,0
    800065c0:	00000597          	auipc	a1,0x0
    800065c4:	cb458593          	addi	a1,a1,-844 # 80006274 <_ZL11workerBodyCPv>
    800065c8:	fe040513          	addi	a0,s0,-32
    800065cc:	ffffb097          	auipc	ra,0xffffb
    800065d0:	2c0080e7          	jalr	704(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    800065d4:	00005517          	auipc	a0,0x5
    800065d8:	00c50513          	addi	a0,a0,12 # 8000b5e0 <CONSOLE_STATUS+0x5d0>
    800065dc:	00001097          	auipc	ra,0x1
    800065e0:	128080e7          	jalr	296(ra) # 80007704 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800065e4:	00000613          	li	a2,0
    800065e8:	00000597          	auipc	a1,0x0
    800065ec:	b4458593          	addi	a1,a1,-1212 # 8000612c <_ZL11workerBodyDPv>
    800065f0:	fe840513          	addi	a0,s0,-24
    800065f4:	ffffb097          	auipc	ra,0xffffb
    800065f8:	298080e7          	jalr	664(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    800065fc:	00005517          	auipc	a0,0x5
    80006600:	ffc50513          	addi	a0,a0,-4 # 8000b5f8 <CONSOLE_STATUS+0x5e8>
    80006604:	00001097          	auipc	ra,0x1
    80006608:	100080e7          	jalr	256(ra) # 80007704 <_Z11printStringPKc>
    8000660c:	00c0006f          	j	80006618 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006610:	ffffb097          	auipc	ra,0xffffb
    80006614:	318080e7          	jalr	792(ra) # 80001928 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006618:	00008797          	auipc	a5,0x8
    8000661c:	9bf7c783          	lbu	a5,-1601(a5) # 8000dfd7 <_ZL9finishedA>
    80006620:	fe0788e3          	beqz	a5,80006610 <_Z18Threads_C_API_testv+0xb4>
    80006624:	00008797          	auipc	a5,0x8
    80006628:	9b27c783          	lbu	a5,-1614(a5) # 8000dfd6 <_ZL9finishedB>
    8000662c:	fe0782e3          	beqz	a5,80006610 <_Z18Threads_C_API_testv+0xb4>
    80006630:	00008797          	auipc	a5,0x8
    80006634:	9a57c783          	lbu	a5,-1627(a5) # 8000dfd5 <_ZL9finishedC>
    80006638:	fc078ce3          	beqz	a5,80006610 <_Z18Threads_C_API_testv+0xb4>
    8000663c:	00008797          	auipc	a5,0x8
    80006640:	9987c783          	lbu	a5,-1640(a5) # 8000dfd4 <_ZL9finishedD>
    80006644:	fc0786e3          	beqz	a5,80006610 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80006648:	02813083          	ld	ra,40(sp)
    8000664c:	02013403          	ld	s0,32(sp)
    80006650:	03010113          	addi	sp,sp,48
    80006654:	00008067          	ret

0000000080006658 <_ZL9sleepyRunPv>:

#include "../test_h/printing.h"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006658:	fe010113          	addi	sp,sp,-32
    8000665c:	00113c23          	sd	ra,24(sp)
    80006660:	00813823          	sd	s0,16(sp)
    80006664:	00913423          	sd	s1,8(sp)
    80006668:	01213023          	sd	s2,0(sp)
    8000666c:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006670:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006674:	00600493          	li	s1,6
    while (--i > 0) {
    80006678:	fff4849b          	addiw	s1,s1,-1
    8000667c:	04905a63          	blez	s1,800066d0 <_ZL9sleepyRunPv+0x78>

        printString("Hello ");
    80006680:	00005517          	auipc	a0,0x5
    80006684:	f9050513          	addi	a0,a0,-112 # 8000b610 <CONSOLE_STATUS+0x600>
    80006688:	00001097          	auipc	ra,0x1
    8000668c:	07c080e7          	jalr	124(ra) # 80007704 <_Z11printStringPKc>
        printInt(sleep_time);
    80006690:	00000613          	li	a2,0
    80006694:	00a00593          	li	a1,10
    80006698:	0009051b          	sext.w	a0,s2
    8000669c:	00001097          	auipc	ra,0x1
    800066a0:	218080e7          	jalr	536(ra) # 800078b4 <_Z8printIntiii>
        printString(" !\n");
    800066a4:	00005517          	auipc	a0,0x5
    800066a8:	f7450513          	addi	a0,a0,-140 # 8000b618 <CONSOLE_STATUS+0x608>
    800066ac:	00001097          	auipc	ra,0x1
    800066b0:	058080e7          	jalr	88(ra) # 80007704 <_Z11printStringPKc>
        time_sleep(sleep_time);
    800066b4:	00090513          	mv	a0,s2
    800066b8:	ffffb097          	auipc	ra,0xffffb
    800066bc:	2b4080e7          	jalr	692(ra) # 8000196c <_Z10time_sleepm>
        putc('.');
    800066c0:	02e00513          	li	a0,46
    800066c4:	ffffb097          	auipc	ra,0xffffb
    800066c8:	3b8080e7          	jalr	952(ra) # 80001a7c <_Z4putcc>
    while (--i > 0) {
    800066cc:	fadff06f          	j	80006678 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/100-1] = true;
    800066d0:	06400793          	li	a5,100
    800066d4:	02f95933          	divu	s2,s2,a5
    800066d8:	fff90913          	addi	s2,s2,-1
    800066dc:	00008797          	auipc	a5,0x8
    800066e0:	8fc78793          	addi	a5,a5,-1796 # 8000dfd8 <_ZL8finished>
    800066e4:	01278933          	add	s2,a5,s2
    800066e8:	00100793          	li	a5,1
    800066ec:	00f90023          	sb	a5,0(s2)
}
    800066f0:	01813083          	ld	ra,24(sp)
    800066f4:	01013403          	ld	s0,16(sp)
    800066f8:	00813483          	ld	s1,8(sp)
    800066fc:	00013903          	ld	s2,0(sp)
    80006700:	02010113          	addi	sp,sp,32
    80006704:	00008067          	ret

0000000080006708 <_Z12testSleepingv>:

void testSleeping() {
    80006708:	fc010113          	addi	sp,sp,-64
    8000670c:	02113c23          	sd	ra,56(sp)
    80006710:	02813823          	sd	s0,48(sp)
    80006714:	02913423          	sd	s1,40(sp)
    80006718:	04010413          	addi	s0,sp,64
    printString("Starting...\n");
    8000671c:	00005517          	auipc	a0,0x5
    80006720:	f0450513          	addi	a0,a0,-252 # 8000b620 <CONSOLE_STATUS+0x610>
    80006724:	00001097          	auipc	ra,0x1
    80006728:	fe0080e7          	jalr	-32(ra) # 80007704 <_Z11printStringPKc>
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {100, 200};
    8000672c:	06400793          	li	a5,100
    80006730:	fcf43823          	sd	a5,-48(s0)
    80006734:	0c800793          	li	a5,200
    80006738:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    printString("Creating threads: ");
    8000673c:	00005517          	auipc	a0,0x5
    80006740:	ef450513          	addi	a0,a0,-268 # 8000b630 <CONSOLE_STATUS+0x620>
    80006744:	00001097          	auipc	ra,0x1
    80006748:	fc0080e7          	jalr	-64(ra) # 80007704 <_Z11printStringPKc>
    for (int i = 0; i < sleepy_thread_count; i++) {
    8000674c:	00000493          	li	s1,0
    80006750:	0500006f          	j	800067a0 <_Z12testSleepingv+0x98>
        printInt(i);
    80006754:	00000613          	li	a2,0
    80006758:	00a00593          	li	a1,10
    8000675c:	00048513          	mv	a0,s1
    80006760:	00001097          	auipc	ra,0x1
    80006764:	154080e7          	jalr	340(ra) # 800078b4 <_Z8printIntiii>
        printString(" ");
    80006768:	00005517          	auipc	a0,0x5
    8000676c:	ee050513          	addi	a0,a0,-288 # 8000b648 <CONSOLE_STATUS+0x638>
    80006770:	00001097          	auipc	ra,0x1
    80006774:	f94080e7          	jalr	-108(ra) # 80007704 <_Z11printStringPKc>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006778:	00349793          	slli	a5,s1,0x3
    8000677c:	fd040613          	addi	a2,s0,-48
    80006780:	00f60633          	add	a2,a2,a5
    80006784:	00000597          	auipc	a1,0x0
    80006788:	ed458593          	addi	a1,a1,-300 # 80006658 <_ZL9sleepyRunPv>
    8000678c:	fc040513          	addi	a0,s0,-64
    80006790:	00f50533          	add	a0,a0,a5
    80006794:	ffffb097          	auipc	ra,0xffffb
    80006798:	0f8080e7          	jalr	248(ra) # 8000188c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    8000679c:	0014849b          	addiw	s1,s1,1
    800067a0:	00100793          	li	a5,1
    800067a4:	fa97d8e3          	bge	a5,s1,80006754 <_Z12testSleepingv+0x4c>
    }
    printString("\nSuccesfully created all threads, now waiting for them to end\n");
    800067a8:	00005517          	auipc	a0,0x5
    800067ac:	ea850513          	addi	a0,a0,-344 # 8000b650 <CONSOLE_STATUS+0x640>
    800067b0:	00001097          	auipc	ra,0x1
    800067b4:	f54080e7          	jalr	-172(ra) # 80007704 <_Z11printStringPKc>
    800067b8:	00c0006f          	j	800067c4 <_Z12testSleepingv+0xbc>
    while (!(finished[0] && finished[1])) {thread_dispatch();}
    800067bc:	ffffb097          	auipc	ra,0xffffb
    800067c0:	16c080e7          	jalr	364(ra) # 80001928 <_Z15thread_dispatchv>
    800067c4:	00008797          	auipc	a5,0x8
    800067c8:	8147c783          	lbu	a5,-2028(a5) # 8000dfd8 <_ZL8finished>
    800067cc:	fe0788e3          	beqz	a5,800067bc <_Z12testSleepingv+0xb4>
    800067d0:	00008797          	auipc	a5,0x8
    800067d4:	8097c783          	lbu	a5,-2039(a5) # 8000dfd9 <_ZL8finished+0x1>
    800067d8:	fe0782e3          	beqz	a5,800067bc <_Z12testSleepingv+0xb4>
}
    800067dc:	03813083          	ld	ra,56(sp)
    800067e0:	03013403          	ld	s0,48(sp)
    800067e4:	02813483          	ld	s1,40(sp)
    800067e8:	04010113          	addi	sp,sp,64
    800067ec:	00008067          	ret

00000000800067f0 <_ZN9BufferCPPC1Ei>:
#include "../test_h/buffer_CPP_API.h"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800067f0:	fd010113          	addi	sp,sp,-48
    800067f4:	02113423          	sd	ra,40(sp)
    800067f8:	02813023          	sd	s0,32(sp)
    800067fc:	00913c23          	sd	s1,24(sp)
    80006800:	01213823          	sd	s2,16(sp)
    80006804:	01313423          	sd	s3,8(sp)
    80006808:	03010413          	addi	s0,sp,48
    8000680c:	00050493          	mv	s1,a0
    80006810:	00058913          	mv	s2,a1
    80006814:	0015879b          	addiw	a5,a1,1
    80006818:	0007851b          	sext.w	a0,a5
    8000681c:	00f4a023          	sw	a5,0(s1)
    80006820:	0004a823          	sw	zero,16(s1)
    80006824:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006828:	00251513          	slli	a0,a0,0x2
    8000682c:	ffffb097          	auipc	ra,0xffffb
    80006830:	004080e7          	jalr	4(ra) # 80001830 <_Z9mem_allocm>
    80006834:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006838:	01000513          	li	a0,16
    8000683c:	ffffb097          	auipc	ra,0xffffb
    80006840:	980080e7          	jalr	-1664(ra) # 800011bc <_Znwm>
    80006844:	00050993          	mv	s3,a0
    80006848:	00000593          	li	a1,0
    8000684c:	ffffb097          	auipc	ra,0xffffb
    80006850:	b88080e7          	jalr	-1144(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006854:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006858:	01000513          	li	a0,16
    8000685c:	ffffb097          	auipc	ra,0xffffb
    80006860:	960080e7          	jalr	-1696(ra) # 800011bc <_Znwm>
    80006864:	00050993          	mv	s3,a0
    80006868:	00090593          	mv	a1,s2
    8000686c:	ffffb097          	auipc	ra,0xffffb
    80006870:	b68080e7          	jalr	-1176(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006874:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006878:	01000513          	li	a0,16
    8000687c:	ffffb097          	auipc	ra,0xffffb
    80006880:	940080e7          	jalr	-1728(ra) # 800011bc <_Znwm>
    80006884:	00050913          	mv	s2,a0
    80006888:	00100593          	li	a1,1
    8000688c:	ffffb097          	auipc	ra,0xffffb
    80006890:	b48080e7          	jalr	-1208(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006894:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006898:	01000513          	li	a0,16
    8000689c:	ffffb097          	auipc	ra,0xffffb
    800068a0:	920080e7          	jalr	-1760(ra) # 800011bc <_Znwm>
    800068a4:	00050913          	mv	s2,a0
    800068a8:	00100593          	li	a1,1
    800068ac:	ffffb097          	auipc	ra,0xffffb
    800068b0:	b28080e7          	jalr	-1240(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800068b4:	0324b823          	sd	s2,48(s1)
}
    800068b8:	02813083          	ld	ra,40(sp)
    800068bc:	02013403          	ld	s0,32(sp)
    800068c0:	01813483          	ld	s1,24(sp)
    800068c4:	01013903          	ld	s2,16(sp)
    800068c8:	00813983          	ld	s3,8(sp)
    800068cc:	03010113          	addi	sp,sp,48
    800068d0:	00008067          	ret
    800068d4:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800068d8:	00098513          	mv	a0,s3
    800068dc:	ffffb097          	auipc	ra,0xffffb
    800068e0:	908080e7          	jalr	-1784(ra) # 800011e4 <_ZdlPv>
    800068e4:	00048513          	mv	a0,s1
    800068e8:	00008097          	auipc	ra,0x8
    800068ec:	7e0080e7          	jalr	2016(ra) # 8000f0c8 <_Unwind_Resume>
    800068f0:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800068f4:	00098513          	mv	a0,s3
    800068f8:	ffffb097          	auipc	ra,0xffffb
    800068fc:	8ec080e7          	jalr	-1812(ra) # 800011e4 <_ZdlPv>
    80006900:	00048513          	mv	a0,s1
    80006904:	00008097          	auipc	ra,0x8
    80006908:	7c4080e7          	jalr	1988(ra) # 8000f0c8 <_Unwind_Resume>
    8000690c:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006910:	00090513          	mv	a0,s2
    80006914:	ffffb097          	auipc	ra,0xffffb
    80006918:	8d0080e7          	jalr	-1840(ra) # 800011e4 <_ZdlPv>
    8000691c:	00048513          	mv	a0,s1
    80006920:	00008097          	auipc	ra,0x8
    80006924:	7a8080e7          	jalr	1960(ra) # 8000f0c8 <_Unwind_Resume>
    80006928:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    8000692c:	00090513          	mv	a0,s2
    80006930:	ffffb097          	auipc	ra,0xffffb
    80006934:	8b4080e7          	jalr	-1868(ra) # 800011e4 <_ZdlPv>
    80006938:	00048513          	mv	a0,s1
    8000693c:	00008097          	auipc	ra,0x8
    80006940:	78c080e7          	jalr	1932(ra) # 8000f0c8 <_Unwind_Resume>

0000000080006944 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006944:	fe010113          	addi	sp,sp,-32
    80006948:	00113c23          	sd	ra,24(sp)
    8000694c:	00813823          	sd	s0,16(sp)
    80006950:	00913423          	sd	s1,8(sp)
    80006954:	01213023          	sd	s2,0(sp)
    80006958:	02010413          	addi	s0,sp,32
    8000695c:	00050493          	mv	s1,a0
    80006960:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80006964:	01853503          	ld	a0,24(a0)
    80006968:	ffffb097          	auipc	ra,0xffffb
    8000696c:	aa4080e7          	jalr	-1372(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006970:	0304b503          	ld	a0,48(s1)
    80006974:	ffffb097          	auipc	ra,0xffffb
    80006978:	a98080e7          	jalr	-1384(ra) # 8000140c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    8000697c:	0084b783          	ld	a5,8(s1)
    80006980:	0144a703          	lw	a4,20(s1)
    80006984:	00271713          	slli	a4,a4,0x2
    80006988:	00e787b3          	add	a5,a5,a4
    8000698c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006990:	0144a783          	lw	a5,20(s1)
    80006994:	0017879b          	addiw	a5,a5,1
    80006998:	0004a703          	lw	a4,0(s1)
    8000699c:	02e7e7bb          	remw	a5,a5,a4
    800069a0:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800069a4:	0304b503          	ld	a0,48(s1)
    800069a8:	ffffb097          	auipc	ra,0xffffb
    800069ac:	a90080e7          	jalr	-1392(ra) # 80001438 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    800069b0:	0204b503          	ld	a0,32(s1)
    800069b4:	ffffb097          	auipc	ra,0xffffb
    800069b8:	a84080e7          	jalr	-1404(ra) # 80001438 <_ZN9Semaphore6signalEv>

}
    800069bc:	01813083          	ld	ra,24(sp)
    800069c0:	01013403          	ld	s0,16(sp)
    800069c4:	00813483          	ld	s1,8(sp)
    800069c8:	00013903          	ld	s2,0(sp)
    800069cc:	02010113          	addi	sp,sp,32
    800069d0:	00008067          	ret

00000000800069d4 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800069d4:	fe010113          	addi	sp,sp,-32
    800069d8:	00113c23          	sd	ra,24(sp)
    800069dc:	00813823          	sd	s0,16(sp)
    800069e0:	00913423          	sd	s1,8(sp)
    800069e4:	01213023          	sd	s2,0(sp)
    800069e8:	02010413          	addi	s0,sp,32
    800069ec:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800069f0:	02053503          	ld	a0,32(a0)
    800069f4:	ffffb097          	auipc	ra,0xffffb
    800069f8:	a18080e7          	jalr	-1512(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800069fc:	0284b503          	ld	a0,40(s1)
    80006a00:	ffffb097          	auipc	ra,0xffffb
    80006a04:	a0c080e7          	jalr	-1524(ra) # 8000140c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006a08:	0084b703          	ld	a4,8(s1)
    80006a0c:	0104a783          	lw	a5,16(s1)
    80006a10:	00279693          	slli	a3,a5,0x2
    80006a14:	00d70733          	add	a4,a4,a3
    80006a18:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006a1c:	0017879b          	addiw	a5,a5,1
    80006a20:	0004a703          	lw	a4,0(s1)
    80006a24:	02e7e7bb          	remw	a5,a5,a4
    80006a28:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006a2c:	0284b503          	ld	a0,40(s1)
    80006a30:	ffffb097          	auipc	ra,0xffffb
    80006a34:	a08080e7          	jalr	-1528(ra) # 80001438 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006a38:	0184b503          	ld	a0,24(s1)
    80006a3c:	ffffb097          	auipc	ra,0xffffb
    80006a40:	9fc080e7          	jalr	-1540(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006a44:	00090513          	mv	a0,s2
    80006a48:	01813083          	ld	ra,24(sp)
    80006a4c:	01013403          	ld	s0,16(sp)
    80006a50:	00813483          	ld	s1,8(sp)
    80006a54:	00013903          	ld	s2,0(sp)
    80006a58:	02010113          	addi	sp,sp,32
    80006a5c:	00008067          	ret

0000000080006a60 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006a60:	fe010113          	addi	sp,sp,-32
    80006a64:	00113c23          	sd	ra,24(sp)
    80006a68:	00813823          	sd	s0,16(sp)
    80006a6c:	00913423          	sd	s1,8(sp)
    80006a70:	01213023          	sd	s2,0(sp)
    80006a74:	02010413          	addi	s0,sp,32
    80006a78:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006a7c:	02853503          	ld	a0,40(a0)
    80006a80:	ffffb097          	auipc	ra,0xffffb
    80006a84:	98c080e7          	jalr	-1652(ra) # 8000140c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006a88:	0304b503          	ld	a0,48(s1)
    80006a8c:	ffffb097          	auipc	ra,0xffffb
    80006a90:	980080e7          	jalr	-1664(ra) # 8000140c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006a94:	0144a783          	lw	a5,20(s1)
    80006a98:	0104a903          	lw	s2,16(s1)
    80006a9c:	0327ce63          	blt	a5,s2,80006ad8 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006aa0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006aa4:	0304b503          	ld	a0,48(s1)
    80006aa8:	ffffb097          	auipc	ra,0xffffb
    80006aac:	990080e7          	jalr	-1648(ra) # 80001438 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006ab0:	0284b503          	ld	a0,40(s1)
    80006ab4:	ffffb097          	auipc	ra,0xffffb
    80006ab8:	984080e7          	jalr	-1660(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006abc:	00090513          	mv	a0,s2
    80006ac0:	01813083          	ld	ra,24(sp)
    80006ac4:	01013403          	ld	s0,16(sp)
    80006ac8:	00813483          	ld	s1,8(sp)
    80006acc:	00013903          	ld	s2,0(sp)
    80006ad0:	02010113          	addi	sp,sp,32
    80006ad4:	00008067          	ret
        ret = cap - head + tail;
    80006ad8:	0004a703          	lw	a4,0(s1)
    80006adc:	4127093b          	subw	s2,a4,s2
    80006ae0:	00f9093b          	addw	s2,s2,a5
    80006ae4:	fc1ff06f          	j	80006aa4 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006ae8 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006ae8:	fe010113          	addi	sp,sp,-32
    80006aec:	00113c23          	sd	ra,24(sp)
    80006af0:	00813823          	sd	s0,16(sp)
    80006af4:	00913423          	sd	s1,8(sp)
    80006af8:	02010413          	addi	s0,sp,32
    80006afc:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006b00:	00a00513          	li	a0,10
    80006b04:	ffffc097          	auipc	ra,0xffffc
    80006b08:	a80080e7          	jalr	-1408(ra) # 80002584 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006b0c:	00005517          	auipc	a0,0x5
    80006b10:	8fc50513          	addi	a0,a0,-1796 # 8000b408 <CONSOLE_STATUS+0x3f8>
    80006b14:	00001097          	auipc	ra,0x1
    80006b18:	bf0080e7          	jalr	-1040(ra) # 80007704 <_Z11printStringPKc>
    while (getCnt()) {
    80006b1c:	00048513          	mv	a0,s1
    80006b20:	00000097          	auipc	ra,0x0
    80006b24:	f40080e7          	jalr	-192(ra) # 80006a60 <_ZN9BufferCPP6getCntEv>
    80006b28:	02050c63          	beqz	a0,80006b60 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006b2c:	0084b783          	ld	a5,8(s1)
    80006b30:	0104a703          	lw	a4,16(s1)
    80006b34:	00271713          	slli	a4,a4,0x2
    80006b38:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006b3c:	0007c503          	lbu	a0,0(a5)
    80006b40:	ffffc097          	auipc	ra,0xffffc
    80006b44:	a44080e7          	jalr	-1468(ra) # 80002584 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006b48:	0104a783          	lw	a5,16(s1)
    80006b4c:	0017879b          	addiw	a5,a5,1
    80006b50:	0004a703          	lw	a4,0(s1)
    80006b54:	02e7e7bb          	remw	a5,a5,a4
    80006b58:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006b5c:	fc1ff06f          	j	80006b1c <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006b60:	02100513          	li	a0,33
    80006b64:	ffffc097          	auipc	ra,0xffffc
    80006b68:	a20080e7          	jalr	-1504(ra) # 80002584 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006b6c:	00a00513          	li	a0,10
    80006b70:	ffffc097          	auipc	ra,0xffffc
    80006b74:	a14080e7          	jalr	-1516(ra) # 80002584 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006b78:	0084b503          	ld	a0,8(s1)
    80006b7c:	ffffb097          	auipc	ra,0xffffb
    80006b80:	ce4080e7          	jalr	-796(ra) # 80001860 <_Z8mem_freePv>
    delete itemAvailable;
    80006b84:	0204b503          	ld	a0,32(s1)
    80006b88:	00050863          	beqz	a0,80006b98 <_ZN9BufferCPPD1Ev+0xb0>
    80006b8c:	00053783          	ld	a5,0(a0)
    80006b90:	0087b783          	ld	a5,8(a5)
    80006b94:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006b98:	0184b503          	ld	a0,24(s1)
    80006b9c:	00050863          	beqz	a0,80006bac <_ZN9BufferCPPD1Ev+0xc4>
    80006ba0:	00053783          	ld	a5,0(a0)
    80006ba4:	0087b783          	ld	a5,8(a5)
    80006ba8:	000780e7          	jalr	a5
    delete mutexTail;
    80006bac:	0304b503          	ld	a0,48(s1)
    80006bb0:	00050863          	beqz	a0,80006bc0 <_ZN9BufferCPPD1Ev+0xd8>
    80006bb4:	00053783          	ld	a5,0(a0)
    80006bb8:	0087b783          	ld	a5,8(a5)
    80006bbc:	000780e7          	jalr	a5
    delete mutexHead;
    80006bc0:	0284b503          	ld	a0,40(s1)
    80006bc4:	00050863          	beqz	a0,80006bd4 <_ZN9BufferCPPD1Ev+0xec>
    80006bc8:	00053783          	ld	a5,0(a0)
    80006bcc:	0087b783          	ld	a5,8(a5)
    80006bd0:	000780e7          	jalr	a5
}
    80006bd4:	01813083          	ld	ra,24(sp)
    80006bd8:	01013403          	ld	s0,16(sp)
    80006bdc:	00813483          	ld	s1,8(sp)
    80006be0:	02010113          	addi	sp,sp,32
    80006be4:	00008067          	ret

0000000080006be8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006be8:	fe010113          	addi	sp,sp,-32
    80006bec:	00113c23          	sd	ra,24(sp)
    80006bf0:	00813823          	sd	s0,16(sp)
    80006bf4:	00913423          	sd	s1,8(sp)
    80006bf8:	01213023          	sd	s2,0(sp)
    80006bfc:	02010413          	addi	s0,sp,32
    80006c00:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006c04:	00100793          	li	a5,1
    80006c08:	02a7f863          	bgeu	a5,a0,80006c38 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006c0c:	00a00793          	li	a5,10
    80006c10:	02f577b3          	remu	a5,a0,a5
    80006c14:	02078e63          	beqz	a5,80006c50 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006c18:	fff48513          	addi	a0,s1,-1
    80006c1c:	00000097          	auipc	ra,0x0
    80006c20:	fcc080e7          	jalr	-52(ra) # 80006be8 <_ZL9fibonaccim>
    80006c24:	00050913          	mv	s2,a0
    80006c28:	ffe48513          	addi	a0,s1,-2
    80006c2c:	00000097          	auipc	ra,0x0
    80006c30:	fbc080e7          	jalr	-68(ra) # 80006be8 <_ZL9fibonaccim>
    80006c34:	00a90533          	add	a0,s2,a0
}
    80006c38:	01813083          	ld	ra,24(sp)
    80006c3c:	01013403          	ld	s0,16(sp)
    80006c40:	00813483          	ld	s1,8(sp)
    80006c44:	00013903          	ld	s2,0(sp)
    80006c48:	02010113          	addi	sp,sp,32
    80006c4c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006c50:	ffffb097          	auipc	ra,0xffffb
    80006c54:	cd8080e7          	jalr	-808(ra) # 80001928 <_Z15thread_dispatchv>
    80006c58:	fc1ff06f          	j	80006c18 <_ZL9fibonaccim+0x30>

0000000080006c5c <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80006c5c:	fe010113          	addi	sp,sp,-32
    80006c60:	00113c23          	sd	ra,24(sp)
    80006c64:	00813823          	sd	s0,16(sp)
    80006c68:	00913423          	sd	s1,8(sp)
    80006c6c:	01213023          	sd	s2,0(sp)
    80006c70:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006c74:	00000913          	li	s2,0
    80006c78:	0380006f          	j	80006cb0 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80006c7c:	ffffb097          	auipc	ra,0xffffb
    80006c80:	cac080e7          	jalr	-852(ra) # 80001928 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006c84:	00148493          	addi	s1,s1,1
    80006c88:	000027b7          	lui	a5,0x2
    80006c8c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006c90:	0097ee63          	bltu	a5,s1,80006cac <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006c94:	00000713          	li	a4,0
    80006c98:	000077b7          	lui	a5,0x7
    80006c9c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006ca0:	fce7eee3          	bltu	a5,a4,80006c7c <_ZN7WorkerA11workerBodyAEPv+0x20>
    80006ca4:	00170713          	addi	a4,a4,1
    80006ca8:	ff1ff06f          	j	80006c98 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006cac:	00190913          	addi	s2,s2,1
    80006cb0:	00900793          	li	a5,9
    80006cb4:	0527e063          	bltu	a5,s2,80006cf4 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006cb8:	00005517          	auipc	a0,0x5
    80006cbc:	8e050513          	addi	a0,a0,-1824 # 8000b598 <CONSOLE_STATUS+0x588>
    80006cc0:	00001097          	auipc	ra,0x1
    80006cc4:	a44080e7          	jalr	-1468(ra) # 80007704 <_Z11printStringPKc>
    80006cc8:	00000613          	li	a2,0
    80006ccc:	00a00593          	li	a1,10
    80006cd0:	0009051b          	sext.w	a0,s2
    80006cd4:	00001097          	auipc	ra,0x1
    80006cd8:	be0080e7          	jalr	-1056(ra) # 800078b4 <_Z8printIntiii>
    80006cdc:	00005517          	auipc	a0,0x5
    80006ce0:	af450513          	addi	a0,a0,-1292 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006ce4:	00001097          	auipc	ra,0x1
    80006ce8:	a20080e7          	jalr	-1504(ra) # 80007704 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006cec:	00000493          	li	s1,0
    80006cf0:	f99ff06f          	j	80006c88 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80006cf4:	00005517          	auipc	a0,0x5
    80006cf8:	8ac50513          	addi	a0,a0,-1876 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80006cfc:	00001097          	auipc	ra,0x1
    80006d00:	a08080e7          	jalr	-1528(ra) # 80007704 <_Z11printStringPKc>
    finishedA = true;
    80006d04:	00100793          	li	a5,1
    80006d08:	00007717          	auipc	a4,0x7
    80006d0c:	2cf70923          	sb	a5,722(a4) # 8000dfda <_ZL9finishedA>
}
    80006d10:	01813083          	ld	ra,24(sp)
    80006d14:	01013403          	ld	s0,16(sp)
    80006d18:	00813483          	ld	s1,8(sp)
    80006d1c:	00013903          	ld	s2,0(sp)
    80006d20:	02010113          	addi	sp,sp,32
    80006d24:	00008067          	ret

0000000080006d28 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80006d28:	fe010113          	addi	sp,sp,-32
    80006d2c:	00113c23          	sd	ra,24(sp)
    80006d30:	00813823          	sd	s0,16(sp)
    80006d34:	00913423          	sd	s1,8(sp)
    80006d38:	01213023          	sd	s2,0(sp)
    80006d3c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006d40:	00000913          	li	s2,0
    80006d44:	0380006f          	j	80006d7c <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80006d48:	ffffb097          	auipc	ra,0xffffb
    80006d4c:	be0080e7          	jalr	-1056(ra) # 80001928 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006d50:	00148493          	addi	s1,s1,1
    80006d54:	000027b7          	lui	a5,0x2
    80006d58:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006d5c:	0097ee63          	bltu	a5,s1,80006d78 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006d60:	00000713          	li	a4,0
    80006d64:	000077b7          	lui	a5,0x7
    80006d68:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006d6c:	fce7eee3          	bltu	a5,a4,80006d48 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80006d70:	00170713          	addi	a4,a4,1
    80006d74:	ff1ff06f          	j	80006d64 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80006d78:	00190913          	addi	s2,s2,1
    80006d7c:	00f00793          	li	a5,15
    80006d80:	0527e063          	bltu	a5,s2,80006dc0 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80006d84:	00004517          	auipc	a0,0x4
    80006d88:	7fc50513          	addi	a0,a0,2044 # 8000b580 <CONSOLE_STATUS+0x570>
    80006d8c:	00001097          	auipc	ra,0x1
    80006d90:	978080e7          	jalr	-1672(ra) # 80007704 <_Z11printStringPKc>
    80006d94:	00000613          	li	a2,0
    80006d98:	00a00593          	li	a1,10
    80006d9c:	0009051b          	sext.w	a0,s2
    80006da0:	00001097          	auipc	ra,0x1
    80006da4:	b14080e7          	jalr	-1260(ra) # 800078b4 <_Z8printIntiii>
    80006da8:	00005517          	auipc	a0,0x5
    80006dac:	a2850513          	addi	a0,a0,-1496 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006db0:	00001097          	auipc	ra,0x1
    80006db4:	954080e7          	jalr	-1708(ra) # 80007704 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006db8:	00000493          	li	s1,0
    80006dbc:	f99ff06f          	j	80006d54 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80006dc0:	00004517          	auipc	a0,0x4
    80006dc4:	7c850513          	addi	a0,a0,1992 # 8000b588 <CONSOLE_STATUS+0x578>
    80006dc8:	00001097          	auipc	ra,0x1
    80006dcc:	93c080e7          	jalr	-1732(ra) # 80007704 <_Z11printStringPKc>
    finishedB = true;
    80006dd0:	00100793          	li	a5,1
    80006dd4:	00007717          	auipc	a4,0x7
    80006dd8:	20f703a3          	sb	a5,519(a4) # 8000dfdb <_ZL9finishedB>
    thread_dispatch();
    80006ddc:	ffffb097          	auipc	ra,0xffffb
    80006de0:	b4c080e7          	jalr	-1204(ra) # 80001928 <_Z15thread_dispatchv>
}
    80006de4:	01813083          	ld	ra,24(sp)
    80006de8:	01013403          	ld	s0,16(sp)
    80006dec:	00813483          	ld	s1,8(sp)
    80006df0:	00013903          	ld	s2,0(sp)
    80006df4:	02010113          	addi	sp,sp,32
    80006df8:	00008067          	ret

0000000080006dfc <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80006dfc:	fe010113          	addi	sp,sp,-32
    80006e00:	00113c23          	sd	ra,24(sp)
    80006e04:	00813823          	sd	s0,16(sp)
    80006e08:	00913423          	sd	s1,8(sp)
    80006e0c:	01213023          	sd	s2,0(sp)
    80006e10:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006e14:	00000493          	li	s1,0
    80006e18:	0400006f          	j	80006e58 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80006e1c:	00004517          	auipc	a0,0x4
    80006e20:	72450513          	addi	a0,a0,1828 # 8000b540 <CONSOLE_STATUS+0x530>
    80006e24:	00001097          	auipc	ra,0x1
    80006e28:	8e0080e7          	jalr	-1824(ra) # 80007704 <_Z11printStringPKc>
    80006e2c:	00000613          	li	a2,0
    80006e30:	00a00593          	li	a1,10
    80006e34:	00048513          	mv	a0,s1
    80006e38:	00001097          	auipc	ra,0x1
    80006e3c:	a7c080e7          	jalr	-1412(ra) # 800078b4 <_Z8printIntiii>
    80006e40:	00005517          	auipc	a0,0x5
    80006e44:	99050513          	addi	a0,a0,-1648 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006e48:	00001097          	auipc	ra,0x1
    80006e4c:	8bc080e7          	jalr	-1860(ra) # 80007704 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006e50:	0014849b          	addiw	s1,s1,1
    80006e54:	0ff4f493          	andi	s1,s1,255
    80006e58:	00200793          	li	a5,2
    80006e5c:	fc97f0e3          	bgeu	a5,s1,80006e1c <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80006e60:	00004517          	auipc	a0,0x4
    80006e64:	6e850513          	addi	a0,a0,1768 # 8000b548 <CONSOLE_STATUS+0x538>
    80006e68:	00001097          	auipc	ra,0x1
    80006e6c:	89c080e7          	jalr	-1892(ra) # 80007704 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006e70:	00700313          	li	t1,7
    thread_dispatch();
    80006e74:	ffffb097          	auipc	ra,0xffffb
    80006e78:	ab4080e7          	jalr	-1356(ra) # 80001928 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006e7c:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80006e80:	00004517          	auipc	a0,0x4
    80006e84:	6d850513          	addi	a0,a0,1752 # 8000b558 <CONSOLE_STATUS+0x548>
    80006e88:	00001097          	auipc	ra,0x1
    80006e8c:	87c080e7          	jalr	-1924(ra) # 80007704 <_Z11printStringPKc>
    80006e90:	00000613          	li	a2,0
    80006e94:	00a00593          	li	a1,10
    80006e98:	0009051b          	sext.w	a0,s2
    80006e9c:	00001097          	auipc	ra,0x1
    80006ea0:	a18080e7          	jalr	-1512(ra) # 800078b4 <_Z8printIntiii>
    80006ea4:	00005517          	auipc	a0,0x5
    80006ea8:	92c50513          	addi	a0,a0,-1748 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006eac:	00001097          	auipc	ra,0x1
    80006eb0:	858080e7          	jalr	-1960(ra) # 80007704 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80006eb4:	00c00513          	li	a0,12
    80006eb8:	00000097          	auipc	ra,0x0
    80006ebc:	d30080e7          	jalr	-720(ra) # 80006be8 <_ZL9fibonaccim>
    80006ec0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006ec4:	00004517          	auipc	a0,0x4
    80006ec8:	69c50513          	addi	a0,a0,1692 # 8000b560 <CONSOLE_STATUS+0x550>
    80006ecc:	00001097          	auipc	ra,0x1
    80006ed0:	838080e7          	jalr	-1992(ra) # 80007704 <_Z11printStringPKc>
    80006ed4:	00000613          	li	a2,0
    80006ed8:	00a00593          	li	a1,10
    80006edc:	0009051b          	sext.w	a0,s2
    80006ee0:	00001097          	auipc	ra,0x1
    80006ee4:	9d4080e7          	jalr	-1580(ra) # 800078b4 <_Z8printIntiii>
    80006ee8:	00005517          	auipc	a0,0x5
    80006eec:	8e850513          	addi	a0,a0,-1816 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006ef0:	00001097          	auipc	ra,0x1
    80006ef4:	814080e7          	jalr	-2028(ra) # 80007704 <_Z11printStringPKc>
    80006ef8:	0400006f          	j	80006f38 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80006efc:	00004517          	auipc	a0,0x4
    80006f00:	64450513          	addi	a0,a0,1604 # 8000b540 <CONSOLE_STATUS+0x530>
    80006f04:	00001097          	auipc	ra,0x1
    80006f08:	800080e7          	jalr	-2048(ra) # 80007704 <_Z11printStringPKc>
    80006f0c:	00000613          	li	a2,0
    80006f10:	00a00593          	li	a1,10
    80006f14:	00048513          	mv	a0,s1
    80006f18:	00001097          	auipc	ra,0x1
    80006f1c:	99c080e7          	jalr	-1636(ra) # 800078b4 <_Z8printIntiii>
    80006f20:	00005517          	auipc	a0,0x5
    80006f24:	8b050513          	addi	a0,a0,-1872 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006f28:	00000097          	auipc	ra,0x0
    80006f2c:	7dc080e7          	jalr	2012(ra) # 80007704 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006f30:	0014849b          	addiw	s1,s1,1
    80006f34:	0ff4f493          	andi	s1,s1,255
    80006f38:	00500793          	li	a5,5
    80006f3c:	fc97f0e3          	bgeu	a5,s1,80006efc <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80006f40:	00004517          	auipc	a0,0x4
    80006f44:	66050513          	addi	a0,a0,1632 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80006f48:	00000097          	auipc	ra,0x0
    80006f4c:	7bc080e7          	jalr	1980(ra) # 80007704 <_Z11printStringPKc>
    finishedC = true;
    80006f50:	00100793          	li	a5,1
    80006f54:	00007717          	auipc	a4,0x7
    80006f58:	08f70423          	sb	a5,136(a4) # 8000dfdc <_ZL9finishedC>
    thread_dispatch();
    80006f5c:	ffffb097          	auipc	ra,0xffffb
    80006f60:	9cc080e7          	jalr	-1588(ra) # 80001928 <_Z15thread_dispatchv>
}
    80006f64:	01813083          	ld	ra,24(sp)
    80006f68:	01013403          	ld	s0,16(sp)
    80006f6c:	00813483          	ld	s1,8(sp)
    80006f70:	00013903          	ld	s2,0(sp)
    80006f74:	02010113          	addi	sp,sp,32
    80006f78:	00008067          	ret

0000000080006f7c <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80006f7c:	fe010113          	addi	sp,sp,-32
    80006f80:	00113c23          	sd	ra,24(sp)
    80006f84:	00813823          	sd	s0,16(sp)
    80006f88:	00913423          	sd	s1,8(sp)
    80006f8c:	01213023          	sd	s2,0(sp)
    80006f90:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006f94:	00a00493          	li	s1,10
    80006f98:	0400006f          	j	80006fd8 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006f9c:	00004517          	auipc	a0,0x4
    80006fa0:	56c50513          	addi	a0,a0,1388 # 8000b508 <CONSOLE_STATUS+0x4f8>
    80006fa4:	00000097          	auipc	ra,0x0
    80006fa8:	760080e7          	jalr	1888(ra) # 80007704 <_Z11printStringPKc>
    80006fac:	00000613          	li	a2,0
    80006fb0:	00a00593          	li	a1,10
    80006fb4:	00048513          	mv	a0,s1
    80006fb8:	00001097          	auipc	ra,0x1
    80006fbc:	8fc080e7          	jalr	-1796(ra) # 800078b4 <_Z8printIntiii>
    80006fc0:	00005517          	auipc	a0,0x5
    80006fc4:	81050513          	addi	a0,a0,-2032 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80006fc8:	00000097          	auipc	ra,0x0
    80006fcc:	73c080e7          	jalr	1852(ra) # 80007704 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006fd0:	0014849b          	addiw	s1,s1,1
    80006fd4:	0ff4f493          	andi	s1,s1,255
    80006fd8:	00c00793          	li	a5,12
    80006fdc:	fc97f0e3          	bgeu	a5,s1,80006f9c <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80006fe0:	00004517          	auipc	a0,0x4
    80006fe4:	53050513          	addi	a0,a0,1328 # 8000b510 <CONSOLE_STATUS+0x500>
    80006fe8:	00000097          	auipc	ra,0x0
    80006fec:	71c080e7          	jalr	1820(ra) # 80007704 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006ff0:	00500313          	li	t1,5
    thread_dispatch();
    80006ff4:	ffffb097          	auipc	ra,0xffffb
    80006ff8:	934080e7          	jalr	-1740(ra) # 80001928 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006ffc:	01000513          	li	a0,16
    80007000:	00000097          	auipc	ra,0x0
    80007004:	be8080e7          	jalr	-1048(ra) # 80006be8 <_ZL9fibonaccim>
    80007008:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000700c:	00004517          	auipc	a0,0x4
    80007010:	51450513          	addi	a0,a0,1300 # 8000b520 <CONSOLE_STATUS+0x510>
    80007014:	00000097          	auipc	ra,0x0
    80007018:	6f0080e7          	jalr	1776(ra) # 80007704 <_Z11printStringPKc>
    8000701c:	00000613          	li	a2,0
    80007020:	00a00593          	li	a1,10
    80007024:	0009051b          	sext.w	a0,s2
    80007028:	00001097          	auipc	ra,0x1
    8000702c:	88c080e7          	jalr	-1908(ra) # 800078b4 <_Z8printIntiii>
    80007030:	00004517          	auipc	a0,0x4
    80007034:	7a050513          	addi	a0,a0,1952 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80007038:	00000097          	auipc	ra,0x0
    8000703c:	6cc080e7          	jalr	1740(ra) # 80007704 <_Z11printStringPKc>
    80007040:	0400006f          	j	80007080 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80007044:	00004517          	auipc	a0,0x4
    80007048:	4c450513          	addi	a0,a0,1220 # 8000b508 <CONSOLE_STATUS+0x4f8>
    8000704c:	00000097          	auipc	ra,0x0
    80007050:	6b8080e7          	jalr	1720(ra) # 80007704 <_Z11printStringPKc>
    80007054:	00000613          	li	a2,0
    80007058:	00a00593          	li	a1,10
    8000705c:	00048513          	mv	a0,s1
    80007060:	00001097          	auipc	ra,0x1
    80007064:	854080e7          	jalr	-1964(ra) # 800078b4 <_Z8printIntiii>
    80007068:	00004517          	auipc	a0,0x4
    8000706c:	76850513          	addi	a0,a0,1896 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80007070:	00000097          	auipc	ra,0x0
    80007074:	694080e7          	jalr	1684(ra) # 80007704 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80007078:	0014849b          	addiw	s1,s1,1
    8000707c:	0ff4f493          	andi	s1,s1,255
    80007080:	00f00793          	li	a5,15
    80007084:	fc97f0e3          	bgeu	a5,s1,80007044 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80007088:	00004517          	auipc	a0,0x4
    8000708c:	4a850513          	addi	a0,a0,1192 # 8000b530 <CONSOLE_STATUS+0x520>
    80007090:	00000097          	auipc	ra,0x0
    80007094:	674080e7          	jalr	1652(ra) # 80007704 <_Z11printStringPKc>
    finishedD = true;
    80007098:	00100793          	li	a5,1
    8000709c:	00007717          	auipc	a4,0x7
    800070a0:	f4f700a3          	sb	a5,-191(a4) # 8000dfdd <_ZL9finishedD>
    thread_dispatch();
    800070a4:	ffffb097          	auipc	ra,0xffffb
    800070a8:	884080e7          	jalr	-1916(ra) # 80001928 <_Z15thread_dispatchv>
}
    800070ac:	01813083          	ld	ra,24(sp)
    800070b0:	01013403          	ld	s0,16(sp)
    800070b4:	00813483          	ld	s1,8(sp)
    800070b8:	00013903          	ld	s2,0(sp)
    800070bc:	02010113          	addi	sp,sp,32
    800070c0:	00008067          	ret

00000000800070c4 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800070c4:	fc010113          	addi	sp,sp,-64
    800070c8:	02113c23          	sd	ra,56(sp)
    800070cc:	02813823          	sd	s0,48(sp)
    800070d0:	02913423          	sd	s1,40(sp)
    800070d4:	03213023          	sd	s2,32(sp)
    800070d8:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800070dc:	02000513          	li	a0,32
    800070e0:	ffffa097          	auipc	ra,0xffffa
    800070e4:	0dc080e7          	jalr	220(ra) # 800011bc <_Znwm>
    800070e8:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800070ec:	ffffa097          	auipc	ra,0xffffa
    800070f0:	2b4080e7          	jalr	692(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800070f4:	00007797          	auipc	a5,0x7
    800070f8:	cc478793          	addi	a5,a5,-828 # 8000ddb8 <_ZTV7WorkerA+0x10>
    800070fc:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80007100:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80007104:	00004517          	auipc	a0,0x4
    80007108:	4ac50513          	addi	a0,a0,1196 # 8000b5b0 <CONSOLE_STATUS+0x5a0>
    8000710c:	00000097          	auipc	ra,0x0
    80007110:	5f8080e7          	jalr	1528(ra) # 80007704 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80007114:	02000513          	li	a0,32
    80007118:	ffffa097          	auipc	ra,0xffffa
    8000711c:	0a4080e7          	jalr	164(ra) # 800011bc <_Znwm>
    80007120:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80007124:	ffffa097          	auipc	ra,0xffffa
    80007128:	27c080e7          	jalr	636(ra) # 800013a0 <_ZN6ThreadC1Ev>
    8000712c:	00007797          	auipc	a5,0x7
    80007130:	cb478793          	addi	a5,a5,-844 # 8000dde0 <_ZTV7WorkerB+0x10>
    80007134:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80007138:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    8000713c:	00004517          	auipc	a0,0x4
    80007140:	48c50513          	addi	a0,a0,1164 # 8000b5c8 <CONSOLE_STATUS+0x5b8>
    80007144:	00000097          	auipc	ra,0x0
    80007148:	5c0080e7          	jalr	1472(ra) # 80007704 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    8000714c:	02000513          	li	a0,32
    80007150:	ffffa097          	auipc	ra,0xffffa
    80007154:	06c080e7          	jalr	108(ra) # 800011bc <_Znwm>
    80007158:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    8000715c:	ffffa097          	auipc	ra,0xffffa
    80007160:	244080e7          	jalr	580(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007164:	00007797          	auipc	a5,0x7
    80007168:	ca478793          	addi	a5,a5,-860 # 8000de08 <_ZTV7WorkerC+0x10>
    8000716c:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80007170:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80007174:	00004517          	auipc	a0,0x4
    80007178:	46c50513          	addi	a0,a0,1132 # 8000b5e0 <CONSOLE_STATUS+0x5d0>
    8000717c:	00000097          	auipc	ra,0x0
    80007180:	588080e7          	jalr	1416(ra) # 80007704 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80007184:	02000513          	li	a0,32
    80007188:	ffffa097          	auipc	ra,0xffffa
    8000718c:	034080e7          	jalr	52(ra) # 800011bc <_Znwm>
    80007190:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80007194:	ffffa097          	auipc	ra,0xffffa
    80007198:	20c080e7          	jalr	524(ra) # 800013a0 <_ZN6ThreadC1Ev>
    8000719c:	00007797          	auipc	a5,0x7
    800071a0:	c9478793          	addi	a5,a5,-876 # 8000de30 <_ZTV7WorkerD+0x10>
    800071a4:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800071a8:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800071ac:	00004517          	auipc	a0,0x4
    800071b0:	44c50513          	addi	a0,a0,1100 # 8000b5f8 <CONSOLE_STATUS+0x5e8>
    800071b4:	00000097          	auipc	ra,0x0
    800071b8:	550080e7          	jalr	1360(ra) # 80007704 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800071bc:	00000493          	li	s1,0
    800071c0:	00300793          	li	a5,3
    800071c4:	0297c663          	blt	a5,s1,800071f0 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800071c8:	00349793          	slli	a5,s1,0x3
    800071cc:	fe040713          	addi	a4,s0,-32
    800071d0:	00f707b3          	add	a5,a4,a5
    800071d4:	fe07b503          	ld	a0,-32(a5)
    800071d8:	ffffa097          	auipc	ra,0xffffa
    800071dc:	0e0080e7          	jalr	224(ra) # 800012b8 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800071e0:	0014849b          	addiw	s1,s1,1
    800071e4:	fddff06f          	j	800071c0 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800071e8:	ffffa097          	auipc	ra,0xffffa
    800071ec:	130080e7          	jalr	304(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800071f0:	00007797          	auipc	a5,0x7
    800071f4:	dea7c783          	lbu	a5,-534(a5) # 8000dfda <_ZL9finishedA>
    800071f8:	fe0788e3          	beqz	a5,800071e8 <_Z20Threads_CPP_API_testv+0x124>
    800071fc:	00007797          	auipc	a5,0x7
    80007200:	ddf7c783          	lbu	a5,-545(a5) # 8000dfdb <_ZL9finishedB>
    80007204:	fe0782e3          	beqz	a5,800071e8 <_Z20Threads_CPP_API_testv+0x124>
    80007208:	00007797          	auipc	a5,0x7
    8000720c:	dd47c783          	lbu	a5,-556(a5) # 8000dfdc <_ZL9finishedC>
    80007210:	fc078ce3          	beqz	a5,800071e8 <_Z20Threads_CPP_API_testv+0x124>
    80007214:	00007797          	auipc	a5,0x7
    80007218:	dc97c783          	lbu	a5,-567(a5) # 8000dfdd <_ZL9finishedD>
    8000721c:	fc0786e3          	beqz	a5,800071e8 <_Z20Threads_CPP_API_testv+0x124>
    80007220:	fc040493          	addi	s1,s0,-64
    80007224:	0080006f          	j	8000722c <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80007228:	00848493          	addi	s1,s1,8
    8000722c:	fe040793          	addi	a5,s0,-32
    80007230:	08f48663          	beq	s1,a5,800072bc <_Z20Threads_CPP_API_testv+0x1f8>
    80007234:	0004b503          	ld	a0,0(s1)
    80007238:	fe0508e3          	beqz	a0,80007228 <_Z20Threads_CPP_API_testv+0x164>
    8000723c:	00053783          	ld	a5,0(a0)
    80007240:	0087b783          	ld	a5,8(a5)
    80007244:	000780e7          	jalr	a5
    80007248:	fe1ff06f          	j	80007228 <_Z20Threads_CPP_API_testv+0x164>
    8000724c:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80007250:	00048513          	mv	a0,s1
    80007254:	ffffa097          	auipc	ra,0xffffa
    80007258:	f90080e7          	jalr	-112(ra) # 800011e4 <_ZdlPv>
    8000725c:	00090513          	mv	a0,s2
    80007260:	00008097          	auipc	ra,0x8
    80007264:	e68080e7          	jalr	-408(ra) # 8000f0c8 <_Unwind_Resume>
    80007268:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    8000726c:	00048513          	mv	a0,s1
    80007270:	ffffa097          	auipc	ra,0xffffa
    80007274:	f74080e7          	jalr	-140(ra) # 800011e4 <_ZdlPv>
    80007278:	00090513          	mv	a0,s2
    8000727c:	00008097          	auipc	ra,0x8
    80007280:	e4c080e7          	jalr	-436(ra) # 8000f0c8 <_Unwind_Resume>
    80007284:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80007288:	00048513          	mv	a0,s1
    8000728c:	ffffa097          	auipc	ra,0xffffa
    80007290:	f58080e7          	jalr	-168(ra) # 800011e4 <_ZdlPv>
    80007294:	00090513          	mv	a0,s2
    80007298:	00008097          	auipc	ra,0x8
    8000729c:	e30080e7          	jalr	-464(ra) # 8000f0c8 <_Unwind_Resume>
    800072a0:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800072a4:	00048513          	mv	a0,s1
    800072a8:	ffffa097          	auipc	ra,0xffffa
    800072ac:	f3c080e7          	jalr	-196(ra) # 800011e4 <_ZdlPv>
    800072b0:	00090513          	mv	a0,s2
    800072b4:	00008097          	auipc	ra,0x8
    800072b8:	e14080e7          	jalr	-492(ra) # 8000f0c8 <_Unwind_Resume>
}
    800072bc:	03813083          	ld	ra,56(sp)
    800072c0:	03013403          	ld	s0,48(sp)
    800072c4:	02813483          	ld	s1,40(sp)
    800072c8:	02013903          	ld	s2,32(sp)
    800072cc:	04010113          	addi	sp,sp,64
    800072d0:	00008067          	ret

00000000800072d4 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800072d4:	ff010113          	addi	sp,sp,-16
    800072d8:	00113423          	sd	ra,8(sp)
    800072dc:	00813023          	sd	s0,0(sp)
    800072e0:	01010413          	addi	s0,sp,16
    800072e4:	00007797          	auipc	a5,0x7
    800072e8:	ad478793          	addi	a5,a5,-1324 # 8000ddb8 <_ZTV7WorkerA+0x10>
    800072ec:	00f53023          	sd	a5,0(a0)
    800072f0:	ffffa097          	auipc	ra,0xffffa
    800072f4:	e5c080e7          	jalr	-420(ra) # 8000114c <_ZN6ThreadD1Ev>
    800072f8:	00813083          	ld	ra,8(sp)
    800072fc:	00013403          	ld	s0,0(sp)
    80007300:	01010113          	addi	sp,sp,16
    80007304:	00008067          	ret

0000000080007308 <_ZN7WorkerAD0Ev>:
    80007308:	fe010113          	addi	sp,sp,-32
    8000730c:	00113c23          	sd	ra,24(sp)
    80007310:	00813823          	sd	s0,16(sp)
    80007314:	00913423          	sd	s1,8(sp)
    80007318:	02010413          	addi	s0,sp,32
    8000731c:	00050493          	mv	s1,a0
    80007320:	00007797          	auipc	a5,0x7
    80007324:	a9878793          	addi	a5,a5,-1384 # 8000ddb8 <_ZTV7WorkerA+0x10>
    80007328:	00f53023          	sd	a5,0(a0)
    8000732c:	ffffa097          	auipc	ra,0xffffa
    80007330:	e20080e7          	jalr	-480(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007334:	00048513          	mv	a0,s1
    80007338:	ffffa097          	auipc	ra,0xffffa
    8000733c:	eac080e7          	jalr	-340(ra) # 800011e4 <_ZdlPv>
    80007340:	01813083          	ld	ra,24(sp)
    80007344:	01013403          	ld	s0,16(sp)
    80007348:	00813483          	ld	s1,8(sp)
    8000734c:	02010113          	addi	sp,sp,32
    80007350:	00008067          	ret

0000000080007354 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80007354:	ff010113          	addi	sp,sp,-16
    80007358:	00113423          	sd	ra,8(sp)
    8000735c:	00813023          	sd	s0,0(sp)
    80007360:	01010413          	addi	s0,sp,16
    80007364:	00007797          	auipc	a5,0x7
    80007368:	a7c78793          	addi	a5,a5,-1412 # 8000dde0 <_ZTV7WorkerB+0x10>
    8000736c:	00f53023          	sd	a5,0(a0)
    80007370:	ffffa097          	auipc	ra,0xffffa
    80007374:	ddc080e7          	jalr	-548(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007378:	00813083          	ld	ra,8(sp)
    8000737c:	00013403          	ld	s0,0(sp)
    80007380:	01010113          	addi	sp,sp,16
    80007384:	00008067          	ret

0000000080007388 <_ZN7WorkerBD0Ev>:
    80007388:	fe010113          	addi	sp,sp,-32
    8000738c:	00113c23          	sd	ra,24(sp)
    80007390:	00813823          	sd	s0,16(sp)
    80007394:	00913423          	sd	s1,8(sp)
    80007398:	02010413          	addi	s0,sp,32
    8000739c:	00050493          	mv	s1,a0
    800073a0:	00007797          	auipc	a5,0x7
    800073a4:	a4078793          	addi	a5,a5,-1472 # 8000dde0 <_ZTV7WorkerB+0x10>
    800073a8:	00f53023          	sd	a5,0(a0)
    800073ac:	ffffa097          	auipc	ra,0xffffa
    800073b0:	da0080e7          	jalr	-608(ra) # 8000114c <_ZN6ThreadD1Ev>
    800073b4:	00048513          	mv	a0,s1
    800073b8:	ffffa097          	auipc	ra,0xffffa
    800073bc:	e2c080e7          	jalr	-468(ra) # 800011e4 <_ZdlPv>
    800073c0:	01813083          	ld	ra,24(sp)
    800073c4:	01013403          	ld	s0,16(sp)
    800073c8:	00813483          	ld	s1,8(sp)
    800073cc:	02010113          	addi	sp,sp,32
    800073d0:	00008067          	ret

00000000800073d4 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800073d4:	ff010113          	addi	sp,sp,-16
    800073d8:	00113423          	sd	ra,8(sp)
    800073dc:	00813023          	sd	s0,0(sp)
    800073e0:	01010413          	addi	s0,sp,16
    800073e4:	00007797          	auipc	a5,0x7
    800073e8:	a2478793          	addi	a5,a5,-1500 # 8000de08 <_ZTV7WorkerC+0x10>
    800073ec:	00f53023          	sd	a5,0(a0)
    800073f0:	ffffa097          	auipc	ra,0xffffa
    800073f4:	d5c080e7          	jalr	-676(ra) # 8000114c <_ZN6ThreadD1Ev>
    800073f8:	00813083          	ld	ra,8(sp)
    800073fc:	00013403          	ld	s0,0(sp)
    80007400:	01010113          	addi	sp,sp,16
    80007404:	00008067          	ret

0000000080007408 <_ZN7WorkerCD0Ev>:
    80007408:	fe010113          	addi	sp,sp,-32
    8000740c:	00113c23          	sd	ra,24(sp)
    80007410:	00813823          	sd	s0,16(sp)
    80007414:	00913423          	sd	s1,8(sp)
    80007418:	02010413          	addi	s0,sp,32
    8000741c:	00050493          	mv	s1,a0
    80007420:	00007797          	auipc	a5,0x7
    80007424:	9e878793          	addi	a5,a5,-1560 # 8000de08 <_ZTV7WorkerC+0x10>
    80007428:	00f53023          	sd	a5,0(a0)
    8000742c:	ffffa097          	auipc	ra,0xffffa
    80007430:	d20080e7          	jalr	-736(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007434:	00048513          	mv	a0,s1
    80007438:	ffffa097          	auipc	ra,0xffffa
    8000743c:	dac080e7          	jalr	-596(ra) # 800011e4 <_ZdlPv>
    80007440:	01813083          	ld	ra,24(sp)
    80007444:	01013403          	ld	s0,16(sp)
    80007448:	00813483          	ld	s1,8(sp)
    8000744c:	02010113          	addi	sp,sp,32
    80007450:	00008067          	ret

0000000080007454 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80007454:	ff010113          	addi	sp,sp,-16
    80007458:	00113423          	sd	ra,8(sp)
    8000745c:	00813023          	sd	s0,0(sp)
    80007460:	01010413          	addi	s0,sp,16
    80007464:	00007797          	auipc	a5,0x7
    80007468:	9cc78793          	addi	a5,a5,-1588 # 8000de30 <_ZTV7WorkerD+0x10>
    8000746c:	00f53023          	sd	a5,0(a0)
    80007470:	ffffa097          	auipc	ra,0xffffa
    80007474:	cdc080e7          	jalr	-804(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007478:	00813083          	ld	ra,8(sp)
    8000747c:	00013403          	ld	s0,0(sp)
    80007480:	01010113          	addi	sp,sp,16
    80007484:	00008067          	ret

0000000080007488 <_ZN7WorkerDD0Ev>:
    80007488:	fe010113          	addi	sp,sp,-32
    8000748c:	00113c23          	sd	ra,24(sp)
    80007490:	00813823          	sd	s0,16(sp)
    80007494:	00913423          	sd	s1,8(sp)
    80007498:	02010413          	addi	s0,sp,32
    8000749c:	00050493          	mv	s1,a0
    800074a0:	00007797          	auipc	a5,0x7
    800074a4:	99078793          	addi	a5,a5,-1648 # 8000de30 <_ZTV7WorkerD+0x10>
    800074a8:	00f53023          	sd	a5,0(a0)
    800074ac:	ffffa097          	auipc	ra,0xffffa
    800074b0:	ca0080e7          	jalr	-864(ra) # 8000114c <_ZN6ThreadD1Ev>
    800074b4:	00048513          	mv	a0,s1
    800074b8:	ffffa097          	auipc	ra,0xffffa
    800074bc:	d2c080e7          	jalr	-724(ra) # 800011e4 <_ZdlPv>
    800074c0:	01813083          	ld	ra,24(sp)
    800074c4:	01013403          	ld	s0,16(sp)
    800074c8:	00813483          	ld	s1,8(sp)
    800074cc:	02010113          	addi	sp,sp,32
    800074d0:	00008067          	ret

00000000800074d4 <_ZN7WorkerA3runEv>:
    void run() override {
    800074d4:	ff010113          	addi	sp,sp,-16
    800074d8:	00113423          	sd	ra,8(sp)
    800074dc:	00813023          	sd	s0,0(sp)
    800074e0:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800074e4:	00000593          	li	a1,0
    800074e8:	fffff097          	auipc	ra,0xfffff
    800074ec:	774080e7          	jalr	1908(ra) # 80006c5c <_ZN7WorkerA11workerBodyAEPv>
    }
    800074f0:	00813083          	ld	ra,8(sp)
    800074f4:	00013403          	ld	s0,0(sp)
    800074f8:	01010113          	addi	sp,sp,16
    800074fc:	00008067          	ret

0000000080007500 <_ZN7WorkerB3runEv>:
    void run() override {
    80007500:	ff010113          	addi	sp,sp,-16
    80007504:	00113423          	sd	ra,8(sp)
    80007508:	00813023          	sd	s0,0(sp)
    8000750c:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80007510:	00000593          	li	a1,0
    80007514:	00000097          	auipc	ra,0x0
    80007518:	814080e7          	jalr	-2028(ra) # 80006d28 <_ZN7WorkerB11workerBodyBEPv>
    }
    8000751c:	00813083          	ld	ra,8(sp)
    80007520:	00013403          	ld	s0,0(sp)
    80007524:	01010113          	addi	sp,sp,16
    80007528:	00008067          	ret

000000008000752c <_ZN7WorkerC3runEv>:
    void run() override {
    8000752c:	ff010113          	addi	sp,sp,-16
    80007530:	00113423          	sd	ra,8(sp)
    80007534:	00813023          	sd	s0,0(sp)
    80007538:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    8000753c:	00000593          	li	a1,0
    80007540:	00000097          	auipc	ra,0x0
    80007544:	8bc080e7          	jalr	-1860(ra) # 80006dfc <_ZN7WorkerC11workerBodyCEPv>
    }
    80007548:	00813083          	ld	ra,8(sp)
    8000754c:	00013403          	ld	s0,0(sp)
    80007550:	01010113          	addi	sp,sp,16
    80007554:	00008067          	ret

0000000080007558 <_ZN7WorkerD3runEv>:
    void run() override {
    80007558:	ff010113          	addi	sp,sp,-16
    8000755c:	00113423          	sd	ra,8(sp)
    80007560:	00813023          	sd	s0,0(sp)
    80007564:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80007568:	00000593          	li	a1,0
    8000756c:	00000097          	auipc	ra,0x0
    80007570:	a10080e7          	jalr	-1520(ra) # 80006f7c <_ZN7WorkerD11workerBodyDEPv>
    }
    80007574:	00813083          	ld	ra,8(sp)
    80007578:	00013403          	ld	s0,0(sp)
    8000757c:	01010113          	addi	sp,sp,16
    80007580:	00008067          	ret

0000000080007584 <_Z8userMainv>:
#include "../test_h/ConsumerProducer_CPP_API_test.h"
#include "../test_h/System_Mode_test.h"

#endif

void userMain() {
    80007584:	fe010113          	addi	sp,sp,-32
    80007588:	00113c23          	sd	ra,24(sp)
    8000758c:	00813823          	sd	s0,16(sp)
    80007590:	00913423          	sd	s1,8(sp)
    80007594:	01213023          	sd	s2,0(sp)
    80007598:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    8000759c:	00004517          	auipc	a0,0x4
    800075a0:	0f450513          	addi	a0,a0,244 # 8000b690 <CONSOLE_STATUS+0x680>
    800075a4:	00000097          	auipc	ra,0x0
    800075a8:	160080e7          	jalr	352(ra) # 80007704 <_Z11printStringPKc>
    int test = getc() - '0';
    800075ac:	ffffa097          	auipc	ra,0xffffa
    800075b0:	4a8080e7          	jalr	1192(ra) # 80001a54 <_Z4getcv>
    800075b4:	00050913          	mv	s2,a0
    800075b8:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800075bc:	ffffa097          	auipc	ra,0xffffa
    800075c0:	498080e7          	jalr	1176(ra) # 80001a54 <_Z4getcv>
    putc(test);
    800075c4:	fd09051b          	addiw	a0,s2,-48
    800075c8:	0ff57513          	andi	a0,a0,255
    800075cc:	ffffa097          	auipc	ra,0xffffa
    800075d0:	4b0080e7          	jalr	1200(ra) # 80001a7c <_Z4putcc>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800075d4:	00700793          	li	a5,7
    800075d8:	1097ec63          	bltu	a5,s1,800076f0 <_Z8userMainv+0x16c>
    800075dc:	00249493          	slli	s1,s1,0x2
    800075e0:	00004717          	auipc	a4,0x4
    800075e4:	31c70713          	addi	a4,a4,796 # 8000b8fc <CONSOLE_STATUS+0x8ec>
    800075e8:	00e484b3          	add	s1,s1,a4
    800075ec:	0004a783          	lw	a5,0(s1)
    800075f0:	00e787b3          	add	a5,a5,a4
    800075f4:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    800075f8:	fffff097          	auipc	ra,0xfffff
    800075fc:	f64080e7          	jalr	-156(ra) # 8000655c <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80007600:	00004517          	auipc	a0,0x4
    80007604:	0b050513          	addi	a0,a0,176 # 8000b6b0 <CONSOLE_STATUS+0x6a0>
    80007608:	00000097          	auipc	ra,0x0
    8000760c:	0fc080e7          	jalr	252(ra) # 80007704 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    printString("Kraj izvrsavanja");
    80007610:	00004517          	auipc	a0,0x4
    80007614:	2d850513          	addi	a0,a0,728 # 8000b8e8 <CONSOLE_STATUS+0x8d8>
    80007618:	00000097          	auipc	ra,0x0
    8000761c:	0ec080e7          	jalr	236(ra) # 80007704 <_Z11printStringPKc>
    80007620:	01813083          	ld	ra,24(sp)
    80007624:	01013403          	ld	s0,16(sp)
    80007628:	00813483          	ld	s1,8(sp)
    8000762c:	00013903          	ld	s2,0(sp)
    80007630:	02010113          	addi	sp,sp,32
    80007634:	00008067          	ret
            Threads_CPP_API_test();
    80007638:	00000097          	auipc	ra,0x0
    8000763c:	a8c080e7          	jalr	-1396(ra) # 800070c4 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80007640:	00004517          	auipc	a0,0x4
    80007644:	0b050513          	addi	a0,a0,176 # 8000b6f0 <CONSOLE_STATUS+0x6e0>
    80007648:	00000097          	auipc	ra,0x0
    8000764c:	0bc080e7          	jalr	188(ra) # 80007704 <_Z11printStringPKc>
            break;
    80007650:	fc1ff06f          	j	80007610 <_Z8userMainv+0x8c>
            producerConsumer_C_API();
    80007654:	ffffe097          	auipc	ra,0xffffe
    80007658:	a2c080e7          	jalr	-1492(ra) # 80005080 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    8000765c:	00004517          	auipc	a0,0x4
    80007660:	0d450513          	addi	a0,a0,212 # 8000b730 <CONSOLE_STATUS+0x720>
    80007664:	00000097          	auipc	ra,0x0
    80007668:	0a0080e7          	jalr	160(ra) # 80007704 <_Z11printStringPKc>
            break;
    8000766c:	fa5ff06f          	j	80007610 <_Z8userMainv+0x8c>
            producerConsumer_CPP_Sync_API();
    80007670:	00000097          	auipc	ra,0x0
    80007674:	5ac080e7          	jalr	1452(ra) # 80007c1c <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80007678:	00004517          	auipc	a0,0x4
    8000767c:	10850513          	addi	a0,a0,264 # 8000b780 <CONSOLE_STATUS+0x770>
    80007680:	00000097          	auipc	ra,0x0
    80007684:	084080e7          	jalr	132(ra) # 80007704 <_Z11printStringPKc>
            break;
    80007688:	f89ff06f          	j	80007610 <_Z8userMainv+0x8c>
            testSleeping();
    8000768c:	fffff097          	auipc	ra,0xfffff
    80007690:	07c080e7          	jalr	124(ra) # 80006708 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., time_sleep test C API)\n");
    80007694:	00004517          	auipc	a0,0x4
    80007698:	14450513          	addi	a0,a0,324 # 8000b7d8 <CONSOLE_STATUS+0x7c8>
    8000769c:	00000097          	auipc	ra,0x0
    800076a0:	068080e7          	jalr	104(ra) # 80007704 <_Z11printStringPKc>
            break;
    800076a4:	f6dff06f          	j	80007610 <_Z8userMainv+0x8c>
            testConsumerProducer();
    800076a8:	ffffe097          	auipc	ra,0xffffe
    800076ac:	ca8080e7          	jalr	-856(ra) # 80005350 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800076b0:	00004517          	auipc	a0,0x4
    800076b4:	15850513          	addi	a0,a0,344 # 8000b808 <CONSOLE_STATUS+0x7f8>
    800076b8:	00000097          	auipc	ra,0x0
    800076bc:	04c080e7          	jalr	76(ra) # 80007704 <_Z11printStringPKc>
            break;
    800076c0:	f51ff06f          	j	80007610 <_Z8userMainv+0x8c>
            System_Mode_test();
    800076c4:	fffff097          	auipc	ra,0xfffff
    800076c8:	8f8080e7          	jalr	-1800(ra) # 80005fbc <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800076cc:	00004517          	auipc	a0,0x4
    800076d0:	17c50513          	addi	a0,a0,380 # 8000b848 <CONSOLE_STATUS+0x838>
    800076d4:	00000097          	auipc	ra,0x0
    800076d8:	030080e7          	jalr	48(ra) # 80007704 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800076dc:	00004517          	auipc	a0,0x4
    800076e0:	18c50513          	addi	a0,a0,396 # 8000b868 <CONSOLE_STATUS+0x858>
    800076e4:	00000097          	auipc	ra,0x0
    800076e8:	020080e7          	jalr	32(ra) # 80007704 <_Z11printStringPKc>
            break;
    800076ec:	f25ff06f          	j	80007610 <_Z8userMainv+0x8c>
            printString("Niste uneli odgovarajuci broj za test\n");
    800076f0:	00004517          	auipc	a0,0x4
    800076f4:	1d050513          	addi	a0,a0,464 # 8000b8c0 <CONSOLE_STATUS+0x8b0>
    800076f8:	00000097          	auipc	ra,0x0
    800076fc:	00c080e7          	jalr	12(ra) # 80007704 <_Z11printStringPKc>
    80007700:	f11ff06f          	j	80007610 <_Z8userMainv+0x8c>

0000000080007704 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80007704:	fe010113          	addi	sp,sp,-32
    80007708:	00113c23          	sd	ra,24(sp)
    8000770c:	00813823          	sd	s0,16(sp)
    80007710:	00913423          	sd	s1,8(sp)
    80007714:	02010413          	addi	s0,sp,32
    80007718:	00050493          	mv	s1,a0
    LOCK();
    8000771c:	00100613          	li	a2,1
    80007720:	00000593          	li	a1,0
    80007724:	00007517          	auipc	a0,0x7
    80007728:	8bc50513          	addi	a0,a0,-1860 # 8000dfe0 <lockPrint>
    8000772c:	ffffa097          	auipc	ra,0xffffa
    80007730:	9d4080e7          	jalr	-1580(ra) # 80001100 <copy_and_swap>
    80007734:	00050863          	beqz	a0,80007744 <_Z11printStringPKc+0x40>
    80007738:	ffffa097          	auipc	ra,0xffffa
    8000773c:	1f0080e7          	jalr	496(ra) # 80001928 <_Z15thread_dispatchv>
    80007740:	fddff06f          	j	8000771c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80007744:	0004c503          	lbu	a0,0(s1)
    80007748:	00050a63          	beqz	a0,8000775c <_Z11printStringPKc+0x58>
    {
        putc(*string);
    8000774c:	ffffa097          	auipc	ra,0xffffa
    80007750:	330080e7          	jalr	816(ra) # 80001a7c <_Z4putcc>
        string++;
    80007754:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80007758:	fedff06f          	j	80007744 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    8000775c:	00000613          	li	a2,0
    80007760:	00100593          	li	a1,1
    80007764:	00007517          	auipc	a0,0x7
    80007768:	87c50513          	addi	a0,a0,-1924 # 8000dfe0 <lockPrint>
    8000776c:	ffffa097          	auipc	ra,0xffffa
    80007770:	994080e7          	jalr	-1644(ra) # 80001100 <copy_and_swap>
    80007774:	fe0514e3          	bnez	a0,8000775c <_Z11printStringPKc+0x58>
}
    80007778:	01813083          	ld	ra,24(sp)
    8000777c:	01013403          	ld	s0,16(sp)
    80007780:	00813483          	ld	s1,8(sp)
    80007784:	02010113          	addi	sp,sp,32
    80007788:	00008067          	ret

000000008000778c <_Z9getStringPci>:

char* getString(char *buf, int max) {
    8000778c:	fd010113          	addi	sp,sp,-48
    80007790:	02113423          	sd	ra,40(sp)
    80007794:	02813023          	sd	s0,32(sp)
    80007798:	00913c23          	sd	s1,24(sp)
    8000779c:	01213823          	sd	s2,16(sp)
    800077a0:	01313423          	sd	s3,8(sp)
    800077a4:	01413023          	sd	s4,0(sp)
    800077a8:	03010413          	addi	s0,sp,48
    800077ac:	00050993          	mv	s3,a0
    800077b0:	00058a13          	mv	s4,a1
    LOCK();
    800077b4:	00100613          	li	a2,1
    800077b8:	00000593          	li	a1,0
    800077bc:	00007517          	auipc	a0,0x7
    800077c0:	82450513          	addi	a0,a0,-2012 # 8000dfe0 <lockPrint>
    800077c4:	ffffa097          	auipc	ra,0xffffa
    800077c8:	93c080e7          	jalr	-1732(ra) # 80001100 <copy_and_swap>
    800077cc:	00050863          	beqz	a0,800077dc <_Z9getStringPci+0x50>
    800077d0:	ffffa097          	auipc	ra,0xffffa
    800077d4:	158080e7          	jalr	344(ra) # 80001928 <_Z15thread_dispatchv>
    800077d8:	fddff06f          	j	800077b4 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800077dc:	00000913          	li	s2,0
    800077e0:	00090493          	mv	s1,s2
    800077e4:	0019091b          	addiw	s2,s2,1
    800077e8:	03495a63          	bge	s2,s4,8000781c <_Z9getStringPci+0x90>
        cc = getc();
    800077ec:	ffffa097          	auipc	ra,0xffffa
    800077f0:	268080e7          	jalr	616(ra) # 80001a54 <_Z4getcv>
        if(cc < 1)
    800077f4:	02050463          	beqz	a0,8000781c <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    800077f8:	009984b3          	add	s1,s3,s1
    800077fc:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80007800:	00a00793          	li	a5,10
    80007804:	00f50a63          	beq	a0,a5,80007818 <_Z9getStringPci+0x8c>
    80007808:	00d00793          	li	a5,13
    8000780c:	fcf51ae3          	bne	a0,a5,800077e0 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80007810:	00090493          	mv	s1,s2
    80007814:	0080006f          	j	8000781c <_Z9getStringPci+0x90>
    80007818:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    8000781c:	009984b3          	add	s1,s3,s1
    80007820:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80007824:	00000613          	li	a2,0
    80007828:	00100593          	li	a1,1
    8000782c:	00006517          	auipc	a0,0x6
    80007830:	7b450513          	addi	a0,a0,1972 # 8000dfe0 <lockPrint>
    80007834:	ffffa097          	auipc	ra,0xffffa
    80007838:	8cc080e7          	jalr	-1844(ra) # 80001100 <copy_and_swap>
    8000783c:	fe0514e3          	bnez	a0,80007824 <_Z9getStringPci+0x98>
    return buf;
}
    80007840:	00098513          	mv	a0,s3
    80007844:	02813083          	ld	ra,40(sp)
    80007848:	02013403          	ld	s0,32(sp)
    8000784c:	01813483          	ld	s1,24(sp)
    80007850:	01013903          	ld	s2,16(sp)
    80007854:	00813983          	ld	s3,8(sp)
    80007858:	00013a03          	ld	s4,0(sp)
    8000785c:	03010113          	addi	sp,sp,48
    80007860:	00008067          	ret

0000000080007864 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80007864:	ff010113          	addi	sp,sp,-16
    80007868:	00813423          	sd	s0,8(sp)
    8000786c:	01010413          	addi	s0,sp,16
    80007870:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80007874:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80007878:	0006c603          	lbu	a2,0(a3)
    8000787c:	fd06071b          	addiw	a4,a2,-48
    80007880:	0ff77713          	andi	a4,a4,255
    80007884:	00900793          	li	a5,9
    80007888:	02e7e063          	bltu	a5,a4,800078a8 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    8000788c:	0025179b          	slliw	a5,a0,0x2
    80007890:	00a787bb          	addw	a5,a5,a0
    80007894:	0017979b          	slliw	a5,a5,0x1
    80007898:	00168693          	addi	a3,a3,1
    8000789c:	00c787bb          	addw	a5,a5,a2
    800078a0:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800078a4:	fd5ff06f          	j	80007878 <_Z11stringToIntPKc+0x14>
    return n;
}
    800078a8:	00813403          	ld	s0,8(sp)
    800078ac:	01010113          	addi	sp,sp,16
    800078b0:	00008067          	ret

00000000800078b4 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800078b4:	fc010113          	addi	sp,sp,-64
    800078b8:	02113c23          	sd	ra,56(sp)
    800078bc:	02813823          	sd	s0,48(sp)
    800078c0:	02913423          	sd	s1,40(sp)
    800078c4:	03213023          	sd	s2,32(sp)
    800078c8:	01313c23          	sd	s3,24(sp)
    800078cc:	04010413          	addi	s0,sp,64
    800078d0:	00050493          	mv	s1,a0
    800078d4:	00058913          	mv	s2,a1
    800078d8:	00060993          	mv	s3,a2
    LOCK();
    800078dc:	00100613          	li	a2,1
    800078e0:	00000593          	li	a1,0
    800078e4:	00006517          	auipc	a0,0x6
    800078e8:	6fc50513          	addi	a0,a0,1788 # 8000dfe0 <lockPrint>
    800078ec:	ffffa097          	auipc	ra,0xffffa
    800078f0:	814080e7          	jalr	-2028(ra) # 80001100 <copy_and_swap>
    800078f4:	00050863          	beqz	a0,80007904 <_Z8printIntiii+0x50>
    800078f8:	ffffa097          	auipc	ra,0xffffa
    800078fc:	030080e7          	jalr	48(ra) # 80001928 <_Z15thread_dispatchv>
    80007900:	fddff06f          	j	800078dc <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80007904:	00098463          	beqz	s3,8000790c <_Z8printIntiii+0x58>
    80007908:	0804c463          	bltz	s1,80007990 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    8000790c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80007910:	00000593          	li	a1,0
    }

    i = 0;
    80007914:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80007918:	0009079b          	sext.w	a5,s2
    8000791c:	0325773b          	remuw	a4,a0,s2
    80007920:	00048613          	mv	a2,s1
    80007924:	0014849b          	addiw	s1,s1,1
    80007928:	02071693          	slli	a3,a4,0x20
    8000792c:	0206d693          	srli	a3,a3,0x20
    80007930:	00006717          	auipc	a4,0x6
    80007934:	51870713          	addi	a4,a4,1304 # 8000de48 <digits>
    80007938:	00d70733          	add	a4,a4,a3
    8000793c:	00074683          	lbu	a3,0(a4)
    80007940:	fd040713          	addi	a4,s0,-48
    80007944:	00c70733          	add	a4,a4,a2
    80007948:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    8000794c:	0005071b          	sext.w	a4,a0
    80007950:	0325553b          	divuw	a0,a0,s2
    80007954:	fcf772e3          	bgeu	a4,a5,80007918 <_Z8printIntiii+0x64>
    if(neg)
    80007958:	00058c63          	beqz	a1,80007970 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    8000795c:	fd040793          	addi	a5,s0,-48
    80007960:	009784b3          	add	s1,a5,s1
    80007964:	02d00793          	li	a5,45
    80007968:	fef48823          	sb	a5,-16(s1)
    8000796c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80007970:	fff4849b          	addiw	s1,s1,-1
    80007974:	0204c463          	bltz	s1,8000799c <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80007978:	fd040793          	addi	a5,s0,-48
    8000797c:	009787b3          	add	a5,a5,s1
    80007980:	ff07c503          	lbu	a0,-16(a5)
    80007984:	ffffa097          	auipc	ra,0xffffa
    80007988:	0f8080e7          	jalr	248(ra) # 80001a7c <_Z4putcc>
    8000798c:	fe5ff06f          	j	80007970 <_Z8printIntiii+0xbc>
        x = -xx;
    80007990:	4090053b          	negw	a0,s1
        neg = 1;
    80007994:	00100593          	li	a1,1
        x = -xx;
    80007998:	f7dff06f          	j	80007914 <_Z8printIntiii+0x60>

    UNLOCK();
    8000799c:	00000613          	li	a2,0
    800079a0:	00100593          	li	a1,1
    800079a4:	00006517          	auipc	a0,0x6
    800079a8:	63c50513          	addi	a0,a0,1596 # 8000dfe0 <lockPrint>
    800079ac:	ffff9097          	auipc	ra,0xffff9
    800079b0:	754080e7          	jalr	1876(ra) # 80001100 <copy_and_swap>
    800079b4:	fe0514e3          	bnez	a0,8000799c <_Z8printIntiii+0xe8>
    800079b8:	03813083          	ld	ra,56(sp)
    800079bc:	03013403          	ld	s0,48(sp)
    800079c0:	02813483          	ld	s1,40(sp)
    800079c4:	02013903          	ld	s2,32(sp)
    800079c8:	01813983          	ld	s3,24(sp)
    800079cc:	04010113          	addi	sp,sp,64
    800079d0:	00008067          	ret

00000000800079d4 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800079d4:	fd010113          	addi	sp,sp,-48
    800079d8:	02113423          	sd	ra,40(sp)
    800079dc:	02813023          	sd	s0,32(sp)
    800079e0:	00913c23          	sd	s1,24(sp)
    800079e4:	01213823          	sd	s2,16(sp)
    800079e8:	01313423          	sd	s3,8(sp)
    800079ec:	03010413          	addi	s0,sp,48
    800079f0:	00050993          	mv	s3,a0
    800079f4:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800079f8:	00000913          	li	s2,0
    800079fc:	00c0006f          	j	80007a08 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007a00:	ffffa097          	auipc	ra,0xffffa
    80007a04:	918080e7          	jalr	-1768(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80007a08:	ffffa097          	auipc	ra,0xffffa
    80007a0c:	04c080e7          	jalr	76(ra) # 80001a54 <_Z4getcv>
    80007a10:	0005059b          	sext.w	a1,a0
    80007a14:	01b00793          	li	a5,27
    80007a18:	02f58a63          	beq	a1,a5,80007a4c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80007a1c:	0084b503          	ld	a0,8(s1)
    80007a20:	fffff097          	auipc	ra,0xfffff
    80007a24:	f24080e7          	jalr	-220(ra) # 80006944 <_ZN9BufferCPP3putEi>
        i++;
    80007a28:	0019071b          	addiw	a4,s2,1
    80007a2c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007a30:	0004a683          	lw	a3,0(s1)
    80007a34:	0026979b          	slliw	a5,a3,0x2
    80007a38:	00d787bb          	addw	a5,a5,a3
    80007a3c:	0017979b          	slliw	a5,a5,0x1
    80007a40:	02f767bb          	remw	a5,a4,a5
    80007a44:	fc0792e3          	bnez	a5,80007a08 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80007a48:	fb9ff06f          	j	80007a00 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80007a4c:	00100793          	li	a5,1
    80007a50:	00006717          	auipc	a4,0x6
    80007a54:	58f72c23          	sw	a5,1432(a4) # 8000dfe8 <_ZL9threadEnd>
    td->buffer->put('!');
    80007a58:	0209b783          	ld	a5,32(s3)
    80007a5c:	02100593          	li	a1,33
    80007a60:	0087b503          	ld	a0,8(a5)
    80007a64:	fffff097          	auipc	ra,0xfffff
    80007a68:	ee0080e7          	jalr	-288(ra) # 80006944 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80007a6c:	0104b503          	ld	a0,16(s1)
    80007a70:	ffffa097          	auipc	ra,0xffffa
    80007a74:	9c8080e7          	jalr	-1592(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007a78:	02813083          	ld	ra,40(sp)
    80007a7c:	02013403          	ld	s0,32(sp)
    80007a80:	01813483          	ld	s1,24(sp)
    80007a84:	01013903          	ld	s2,16(sp)
    80007a88:	00813983          	ld	s3,8(sp)
    80007a8c:	03010113          	addi	sp,sp,48
    80007a90:	00008067          	ret

0000000080007a94 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80007a94:	fe010113          	addi	sp,sp,-32
    80007a98:	00113c23          	sd	ra,24(sp)
    80007a9c:	00813823          	sd	s0,16(sp)
    80007aa0:	00913423          	sd	s1,8(sp)
    80007aa4:	01213023          	sd	s2,0(sp)
    80007aa8:	02010413          	addi	s0,sp,32
    80007aac:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007ab0:	00000913          	li	s2,0
    80007ab4:	00c0006f          	j	80007ac0 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007ab8:	ffffa097          	auipc	ra,0xffffa
    80007abc:	860080e7          	jalr	-1952(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80007ac0:	00006797          	auipc	a5,0x6
    80007ac4:	5287a783          	lw	a5,1320(a5) # 8000dfe8 <_ZL9threadEnd>
    80007ac8:	02079e63          	bnez	a5,80007b04 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80007acc:	0004a583          	lw	a1,0(s1)
    80007ad0:	0305859b          	addiw	a1,a1,48
    80007ad4:	0084b503          	ld	a0,8(s1)
    80007ad8:	fffff097          	auipc	ra,0xfffff
    80007adc:	e6c080e7          	jalr	-404(ra) # 80006944 <_ZN9BufferCPP3putEi>
        i++;
    80007ae0:	0019071b          	addiw	a4,s2,1
    80007ae4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007ae8:	0004a683          	lw	a3,0(s1)
    80007aec:	0026979b          	slliw	a5,a3,0x2
    80007af0:	00d787bb          	addw	a5,a5,a3
    80007af4:	0017979b          	slliw	a5,a5,0x1
    80007af8:	02f767bb          	remw	a5,a4,a5
    80007afc:	fc0792e3          	bnez	a5,80007ac0 <_ZN12ProducerSync8producerEPv+0x2c>
    80007b00:	fb9ff06f          	j	80007ab8 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80007b04:	0104b503          	ld	a0,16(s1)
    80007b08:	ffffa097          	auipc	ra,0xffffa
    80007b0c:	930080e7          	jalr	-1744(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007b10:	01813083          	ld	ra,24(sp)
    80007b14:	01013403          	ld	s0,16(sp)
    80007b18:	00813483          	ld	s1,8(sp)
    80007b1c:	00013903          	ld	s2,0(sp)
    80007b20:	02010113          	addi	sp,sp,32
    80007b24:	00008067          	ret

0000000080007b28 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80007b28:	fd010113          	addi	sp,sp,-48
    80007b2c:	02113423          	sd	ra,40(sp)
    80007b30:	02813023          	sd	s0,32(sp)
    80007b34:	00913c23          	sd	s1,24(sp)
    80007b38:	01213823          	sd	s2,16(sp)
    80007b3c:	01313423          	sd	s3,8(sp)
    80007b40:	01413023          	sd	s4,0(sp)
    80007b44:	03010413          	addi	s0,sp,48
    80007b48:	00050993          	mv	s3,a0
    80007b4c:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007b50:	00000a13          	li	s4,0
    80007b54:	01c0006f          	j	80007b70 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80007b58:	ffff9097          	auipc	ra,0xffff9
    80007b5c:	7c0080e7          	jalr	1984(ra) # 80001318 <_ZN6Thread8dispatchEv>
    80007b60:	0500006f          	j	80007bb0 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80007b64:	00a00513          	li	a0,10
    80007b68:	ffffa097          	auipc	ra,0xffffa
    80007b6c:	f14080e7          	jalr	-236(ra) # 80001a7c <_Z4putcc>
    while (!threadEnd) {
    80007b70:	00006797          	auipc	a5,0x6
    80007b74:	4787a783          	lw	a5,1144(a5) # 8000dfe8 <_ZL9threadEnd>
    80007b78:	06079263          	bnez	a5,80007bdc <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80007b7c:	00893503          	ld	a0,8(s2)
    80007b80:	fffff097          	auipc	ra,0xfffff
    80007b84:	e54080e7          	jalr	-428(ra) # 800069d4 <_ZN9BufferCPP3getEv>
        i++;
    80007b88:	001a049b          	addiw	s1,s4,1
    80007b8c:	00048a1b          	sext.w	s4,s1
        putc(key);
    80007b90:	0ff57513          	andi	a0,a0,255
    80007b94:	ffffa097          	auipc	ra,0xffffa
    80007b98:	ee8080e7          	jalr	-280(ra) # 80001a7c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80007b9c:	00092703          	lw	a4,0(s2)
    80007ba0:	0027179b          	slliw	a5,a4,0x2
    80007ba4:	00e787bb          	addw	a5,a5,a4
    80007ba8:	02f4e7bb          	remw	a5,s1,a5
    80007bac:	fa0786e3          	beqz	a5,80007b58 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80007bb0:	05000793          	li	a5,80
    80007bb4:	02f4e4bb          	remw	s1,s1,a5
    80007bb8:	fa049ce3          	bnez	s1,80007b70 <_ZN12ConsumerSync8consumerEPv+0x48>
    80007bbc:	fa9ff06f          	j	80007b64 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80007bc0:	0209b783          	ld	a5,32(s3)
    80007bc4:	0087b503          	ld	a0,8(a5)
    80007bc8:	fffff097          	auipc	ra,0xfffff
    80007bcc:	e0c080e7          	jalr	-500(ra) # 800069d4 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80007bd0:	0ff57513          	andi	a0,a0,255
    80007bd4:	ffffb097          	auipc	ra,0xffffb
    80007bd8:	9b0080e7          	jalr	-1616(ra) # 80002584 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80007bdc:	0209b783          	ld	a5,32(s3)
    80007be0:	0087b503          	ld	a0,8(a5)
    80007be4:	fffff097          	auipc	ra,0xfffff
    80007be8:	e7c080e7          	jalr	-388(ra) # 80006a60 <_ZN9BufferCPP6getCntEv>
    80007bec:	fca04ae3          	bgtz	a0,80007bc0 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80007bf0:	01093503          	ld	a0,16(s2)
    80007bf4:	ffffa097          	auipc	ra,0xffffa
    80007bf8:	844080e7          	jalr	-1980(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007bfc:	02813083          	ld	ra,40(sp)
    80007c00:	02013403          	ld	s0,32(sp)
    80007c04:	01813483          	ld	s1,24(sp)
    80007c08:	01013903          	ld	s2,16(sp)
    80007c0c:	00813983          	ld	s3,8(sp)
    80007c10:	00013a03          	ld	s4,0(sp)
    80007c14:	03010113          	addi	sp,sp,48
    80007c18:	00008067          	ret

0000000080007c1c <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80007c1c:	f8010113          	addi	sp,sp,-128
    80007c20:	06113c23          	sd	ra,120(sp)
    80007c24:	06813823          	sd	s0,112(sp)
    80007c28:	06913423          	sd	s1,104(sp)
    80007c2c:	07213023          	sd	s2,96(sp)
    80007c30:	05313c23          	sd	s3,88(sp)
    80007c34:	05413823          	sd	s4,80(sp)
    80007c38:	05513423          	sd	s5,72(sp)
    80007c3c:	05613023          	sd	s6,64(sp)
    80007c40:	03713c23          	sd	s7,56(sp)
    80007c44:	03813823          	sd	s8,48(sp)
    80007c48:	03913423          	sd	s9,40(sp)
    80007c4c:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80007c50:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80007c54:	00003517          	auipc	a0,0x3
    80007c58:	7cc50513          	addi	a0,a0,1996 # 8000b420 <CONSOLE_STATUS+0x410>
    80007c5c:	00000097          	auipc	ra,0x0
    80007c60:	aa8080e7          	jalr	-1368(ra) # 80007704 <_Z11printStringPKc>
    getString(input, 30);
    80007c64:	01e00593          	li	a1,30
    80007c68:	f8040493          	addi	s1,s0,-128
    80007c6c:	00048513          	mv	a0,s1
    80007c70:	00000097          	auipc	ra,0x0
    80007c74:	b1c080e7          	jalr	-1252(ra) # 8000778c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80007c78:	00048513          	mv	a0,s1
    80007c7c:	00000097          	auipc	ra,0x0
    80007c80:	be8080e7          	jalr	-1048(ra) # 80007864 <_Z11stringToIntPKc>
    80007c84:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80007c88:	00003517          	auipc	a0,0x3
    80007c8c:	7b850513          	addi	a0,a0,1976 # 8000b440 <CONSOLE_STATUS+0x430>
    80007c90:	00000097          	auipc	ra,0x0
    80007c94:	a74080e7          	jalr	-1420(ra) # 80007704 <_Z11printStringPKc>
    getString(input, 30);
    80007c98:	01e00593          	li	a1,30
    80007c9c:	00048513          	mv	a0,s1
    80007ca0:	00000097          	auipc	ra,0x0
    80007ca4:	aec080e7          	jalr	-1300(ra) # 8000778c <_Z9getStringPci>
    n = stringToInt(input);
    80007ca8:	00048513          	mv	a0,s1
    80007cac:	00000097          	auipc	ra,0x0
    80007cb0:	bb8080e7          	jalr	-1096(ra) # 80007864 <_Z11stringToIntPKc>
    80007cb4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80007cb8:	00003517          	auipc	a0,0x3
    80007cbc:	7a850513          	addi	a0,a0,1960 # 8000b460 <CONSOLE_STATUS+0x450>
    80007cc0:	00000097          	auipc	ra,0x0
    80007cc4:	a44080e7          	jalr	-1468(ra) # 80007704 <_Z11printStringPKc>
    80007cc8:	00000613          	li	a2,0
    80007ccc:	00a00593          	li	a1,10
    80007cd0:	00090513          	mv	a0,s2
    80007cd4:	00000097          	auipc	ra,0x0
    80007cd8:	be0080e7          	jalr	-1056(ra) # 800078b4 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80007cdc:	00003517          	auipc	a0,0x3
    80007ce0:	79c50513          	addi	a0,a0,1948 # 8000b478 <CONSOLE_STATUS+0x468>
    80007ce4:	00000097          	auipc	ra,0x0
    80007ce8:	a20080e7          	jalr	-1504(ra) # 80007704 <_Z11printStringPKc>
    80007cec:	00000613          	li	a2,0
    80007cf0:	00a00593          	li	a1,10
    80007cf4:	00048513          	mv	a0,s1
    80007cf8:	00000097          	auipc	ra,0x0
    80007cfc:	bbc080e7          	jalr	-1092(ra) # 800078b4 <_Z8printIntiii>
    printString(".\n");
    80007d00:	00003517          	auipc	a0,0x3
    80007d04:	79050513          	addi	a0,a0,1936 # 8000b490 <CONSOLE_STATUS+0x480>
    80007d08:	00000097          	auipc	ra,0x0
    80007d0c:	9fc080e7          	jalr	-1540(ra) # 80007704 <_Z11printStringPKc>
    if(threadNum > n) {
    80007d10:	0324c463          	blt	s1,s2,80007d38 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80007d14:	03205c63          	blez	s2,80007d4c <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80007d18:	03800513          	li	a0,56
    80007d1c:	ffff9097          	auipc	ra,0xffff9
    80007d20:	4a0080e7          	jalr	1184(ra) # 800011bc <_Znwm>
    80007d24:	00050a93          	mv	s5,a0
    80007d28:	00048593          	mv	a1,s1
    80007d2c:	fffff097          	auipc	ra,0xfffff
    80007d30:	ac4080e7          	jalr	-1340(ra) # 800067f0 <_ZN9BufferCPPC1Ei>
    80007d34:	0300006f          	j	80007d64 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80007d38:	00003517          	auipc	a0,0x3
    80007d3c:	76050513          	addi	a0,a0,1888 # 8000b498 <CONSOLE_STATUS+0x488>
    80007d40:	00000097          	auipc	ra,0x0
    80007d44:	9c4080e7          	jalr	-1596(ra) # 80007704 <_Z11printStringPKc>
        return;
    80007d48:	0140006f          	j	80007d5c <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80007d4c:	00003517          	auipc	a0,0x3
    80007d50:	78c50513          	addi	a0,a0,1932 # 8000b4d8 <CONSOLE_STATUS+0x4c8>
    80007d54:	00000097          	auipc	ra,0x0
    80007d58:	9b0080e7          	jalr	-1616(ra) # 80007704 <_Z11printStringPKc>
        return;
    80007d5c:	000b8113          	mv	sp,s7
    80007d60:	2380006f          	j	80007f98 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80007d64:	01000513          	li	a0,16
    80007d68:	ffff9097          	auipc	ra,0xffff9
    80007d6c:	454080e7          	jalr	1108(ra) # 800011bc <_Znwm>
    80007d70:	00050493          	mv	s1,a0
    80007d74:	00000593          	li	a1,0
    80007d78:	ffff9097          	auipc	ra,0xffff9
    80007d7c:	65c080e7          	jalr	1628(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80007d80:	00006797          	auipc	a5,0x6
    80007d84:	2697b823          	sd	s1,624(a5) # 8000dff0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80007d88:	00391793          	slli	a5,s2,0x3
    80007d8c:	00f78793          	addi	a5,a5,15
    80007d90:	ff07f793          	andi	a5,a5,-16
    80007d94:	40f10133          	sub	sp,sp,a5
    80007d98:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80007d9c:	0019071b          	addiw	a4,s2,1
    80007da0:	00171793          	slli	a5,a4,0x1
    80007da4:	00e787b3          	add	a5,a5,a4
    80007da8:	00379793          	slli	a5,a5,0x3
    80007dac:	00f78793          	addi	a5,a5,15
    80007db0:	ff07f793          	andi	a5,a5,-16
    80007db4:	40f10133          	sub	sp,sp,a5
    80007db8:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80007dbc:	00191c13          	slli	s8,s2,0x1
    80007dc0:	012c07b3          	add	a5,s8,s2
    80007dc4:	00379793          	slli	a5,a5,0x3
    80007dc8:	00fa07b3          	add	a5,s4,a5
    80007dcc:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80007dd0:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80007dd4:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80007dd8:	02800513          	li	a0,40
    80007ddc:	ffff9097          	auipc	ra,0xffff9
    80007de0:	3e0080e7          	jalr	992(ra) # 800011bc <_Znwm>
    80007de4:	00050b13          	mv	s6,a0
    80007de8:	012c0c33          	add	s8,s8,s2
    80007dec:	003c1c13          	slli	s8,s8,0x3
    80007df0:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80007df4:	ffff9097          	auipc	ra,0xffff9
    80007df8:	5ac080e7          	jalr	1452(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007dfc:	00006797          	auipc	a5,0x6
    80007e00:	0c478793          	addi	a5,a5,196 # 8000dec0 <_ZTV12ConsumerSync+0x10>
    80007e04:	00fb3023          	sd	a5,0(s6)
    80007e08:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80007e0c:	000b0513          	mv	a0,s6
    80007e10:	ffff9097          	auipc	ra,0xffff9
    80007e14:	4a8080e7          	jalr	1192(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80007e18:	00000493          	li	s1,0
    80007e1c:	0380006f          	j	80007e54 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80007e20:	00006797          	auipc	a5,0x6
    80007e24:	07878793          	addi	a5,a5,120 # 8000de98 <_ZTV12ProducerSync+0x10>
    80007e28:	00fcb023          	sd	a5,0(s9)
    80007e2c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80007e30:	00349793          	slli	a5,s1,0x3
    80007e34:	00f987b3          	add	a5,s3,a5
    80007e38:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80007e3c:	00349793          	slli	a5,s1,0x3
    80007e40:	00f987b3          	add	a5,s3,a5
    80007e44:	0007b503          	ld	a0,0(a5)
    80007e48:	ffff9097          	auipc	ra,0xffff9
    80007e4c:	470080e7          	jalr	1136(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80007e50:	0014849b          	addiw	s1,s1,1
    80007e54:	0b24d063          	bge	s1,s2,80007ef4 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80007e58:	00149793          	slli	a5,s1,0x1
    80007e5c:	009787b3          	add	a5,a5,s1
    80007e60:	00379793          	slli	a5,a5,0x3
    80007e64:	00fa07b3          	add	a5,s4,a5
    80007e68:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80007e6c:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80007e70:	00006717          	auipc	a4,0x6
    80007e74:	18073703          	ld	a4,384(a4) # 8000dff0 <_ZL10waitForAll>
    80007e78:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80007e7c:	02905863          	blez	s1,80007eac <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80007e80:	02800513          	li	a0,40
    80007e84:	ffff9097          	auipc	ra,0xffff9
    80007e88:	338080e7          	jalr	824(ra) # 800011bc <_Znwm>
    80007e8c:	00050c93          	mv	s9,a0
    80007e90:	00149c13          	slli	s8,s1,0x1
    80007e94:	009c0c33          	add	s8,s8,s1
    80007e98:	003c1c13          	slli	s8,s8,0x3
    80007e9c:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80007ea0:	ffff9097          	auipc	ra,0xffff9
    80007ea4:	500080e7          	jalr	1280(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007ea8:	f79ff06f          	j	80007e20 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80007eac:	02800513          	li	a0,40
    80007eb0:	ffff9097          	auipc	ra,0xffff9
    80007eb4:	30c080e7          	jalr	780(ra) # 800011bc <_Znwm>
    80007eb8:	00050c93          	mv	s9,a0
    80007ebc:	00149c13          	slli	s8,s1,0x1
    80007ec0:	009c0c33          	add	s8,s8,s1
    80007ec4:	003c1c13          	slli	s8,s8,0x3
    80007ec8:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80007ecc:	ffff9097          	auipc	ra,0xffff9
    80007ed0:	4d4080e7          	jalr	1236(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007ed4:	00006797          	auipc	a5,0x6
    80007ed8:	f9c78793          	addi	a5,a5,-100 # 8000de70 <_ZTV16ProducerKeyboard+0x10>
    80007edc:	00fcb023          	sd	a5,0(s9)
    80007ee0:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80007ee4:	00349793          	slli	a5,s1,0x3
    80007ee8:	00f987b3          	add	a5,s3,a5
    80007eec:	0197b023          	sd	s9,0(a5)
    80007ef0:	f4dff06f          	j	80007e3c <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80007ef4:	ffff9097          	auipc	ra,0xffff9
    80007ef8:	424080e7          	jalr	1060(ra) # 80001318 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80007efc:	00000493          	li	s1,0
    80007f00:	00994e63          	blt	s2,s1,80007f1c <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80007f04:	00006517          	auipc	a0,0x6
    80007f08:	0ec53503          	ld	a0,236(a0) # 8000dff0 <_ZL10waitForAll>
    80007f0c:	ffff9097          	auipc	ra,0xffff9
    80007f10:	500080e7          	jalr	1280(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80007f14:	0014849b          	addiw	s1,s1,1
    80007f18:	fe9ff06f          	j	80007f00 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80007f1c:	00000493          	li	s1,0
    80007f20:	0080006f          	j	80007f28 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80007f24:	0014849b          	addiw	s1,s1,1
    80007f28:	0324d263          	bge	s1,s2,80007f4c <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80007f2c:	00349793          	slli	a5,s1,0x3
    80007f30:	00f987b3          	add	a5,s3,a5
    80007f34:	0007b503          	ld	a0,0(a5)
    80007f38:	fe0506e3          	beqz	a0,80007f24 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80007f3c:	00053783          	ld	a5,0(a0)
    80007f40:	0087b783          	ld	a5,8(a5)
    80007f44:	000780e7          	jalr	a5
    80007f48:	fddff06f          	j	80007f24 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80007f4c:	000b0a63          	beqz	s6,80007f60 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80007f50:	000b3783          	ld	a5,0(s6)
    80007f54:	0087b783          	ld	a5,8(a5)
    80007f58:	000b0513          	mv	a0,s6
    80007f5c:	000780e7          	jalr	a5
    delete waitForAll;
    80007f60:	00006517          	auipc	a0,0x6
    80007f64:	09053503          	ld	a0,144(a0) # 8000dff0 <_ZL10waitForAll>
    80007f68:	00050863          	beqz	a0,80007f78 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80007f6c:	00053783          	ld	a5,0(a0)
    80007f70:	0087b783          	ld	a5,8(a5)
    80007f74:	000780e7          	jalr	a5
    delete buffer;
    80007f78:	000a8e63          	beqz	s5,80007f94 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80007f7c:	000a8513          	mv	a0,s5
    80007f80:	fffff097          	auipc	ra,0xfffff
    80007f84:	b68080e7          	jalr	-1176(ra) # 80006ae8 <_ZN9BufferCPPD1Ev>
    80007f88:	000a8513          	mv	a0,s5
    80007f8c:	ffff9097          	auipc	ra,0xffff9
    80007f90:	258080e7          	jalr	600(ra) # 800011e4 <_ZdlPv>
    80007f94:	000b8113          	mv	sp,s7

}
    80007f98:	f8040113          	addi	sp,s0,-128
    80007f9c:	07813083          	ld	ra,120(sp)
    80007fa0:	07013403          	ld	s0,112(sp)
    80007fa4:	06813483          	ld	s1,104(sp)
    80007fa8:	06013903          	ld	s2,96(sp)
    80007fac:	05813983          	ld	s3,88(sp)
    80007fb0:	05013a03          	ld	s4,80(sp)
    80007fb4:	04813a83          	ld	s5,72(sp)
    80007fb8:	04013b03          	ld	s6,64(sp)
    80007fbc:	03813b83          	ld	s7,56(sp)
    80007fc0:	03013c03          	ld	s8,48(sp)
    80007fc4:	02813c83          	ld	s9,40(sp)
    80007fc8:	08010113          	addi	sp,sp,128
    80007fcc:	00008067          	ret
    80007fd0:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80007fd4:	000a8513          	mv	a0,s5
    80007fd8:	ffff9097          	auipc	ra,0xffff9
    80007fdc:	20c080e7          	jalr	524(ra) # 800011e4 <_ZdlPv>
    80007fe0:	00048513          	mv	a0,s1
    80007fe4:	00007097          	auipc	ra,0x7
    80007fe8:	0e4080e7          	jalr	228(ra) # 8000f0c8 <_Unwind_Resume>
    80007fec:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80007ff0:	00048513          	mv	a0,s1
    80007ff4:	ffff9097          	auipc	ra,0xffff9
    80007ff8:	1f0080e7          	jalr	496(ra) # 800011e4 <_ZdlPv>
    80007ffc:	00090513          	mv	a0,s2
    80008000:	00007097          	auipc	ra,0x7
    80008004:	0c8080e7          	jalr	200(ra) # 8000f0c8 <_Unwind_Resume>
    80008008:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    8000800c:	000b0513          	mv	a0,s6
    80008010:	ffff9097          	auipc	ra,0xffff9
    80008014:	1d4080e7          	jalr	468(ra) # 800011e4 <_ZdlPv>
    80008018:	00048513          	mv	a0,s1
    8000801c:	00007097          	auipc	ra,0x7
    80008020:	0ac080e7          	jalr	172(ra) # 8000f0c8 <_Unwind_Resume>
    80008024:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80008028:	000c8513          	mv	a0,s9
    8000802c:	ffff9097          	auipc	ra,0xffff9
    80008030:	1b8080e7          	jalr	440(ra) # 800011e4 <_ZdlPv>
    80008034:	00048513          	mv	a0,s1
    80008038:	00007097          	auipc	ra,0x7
    8000803c:	090080e7          	jalr	144(ra) # 8000f0c8 <_Unwind_Resume>
    80008040:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80008044:	000c8513          	mv	a0,s9
    80008048:	ffff9097          	auipc	ra,0xffff9
    8000804c:	19c080e7          	jalr	412(ra) # 800011e4 <_ZdlPv>
    80008050:	00048513          	mv	a0,s1
    80008054:	00007097          	auipc	ra,0x7
    80008058:	074080e7          	jalr	116(ra) # 8000f0c8 <_Unwind_Resume>

000000008000805c <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    8000805c:	ff010113          	addi	sp,sp,-16
    80008060:	00113423          	sd	ra,8(sp)
    80008064:	00813023          	sd	s0,0(sp)
    80008068:	01010413          	addi	s0,sp,16
    8000806c:	00006797          	auipc	a5,0x6
    80008070:	e5478793          	addi	a5,a5,-428 # 8000dec0 <_ZTV12ConsumerSync+0x10>
    80008074:	00f53023          	sd	a5,0(a0)
    80008078:	ffff9097          	auipc	ra,0xffff9
    8000807c:	0d4080e7          	jalr	212(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008080:	00813083          	ld	ra,8(sp)
    80008084:	00013403          	ld	s0,0(sp)
    80008088:	01010113          	addi	sp,sp,16
    8000808c:	00008067          	ret

0000000080008090 <_ZN12ConsumerSyncD0Ev>:
    80008090:	fe010113          	addi	sp,sp,-32
    80008094:	00113c23          	sd	ra,24(sp)
    80008098:	00813823          	sd	s0,16(sp)
    8000809c:	00913423          	sd	s1,8(sp)
    800080a0:	02010413          	addi	s0,sp,32
    800080a4:	00050493          	mv	s1,a0
    800080a8:	00006797          	auipc	a5,0x6
    800080ac:	e1878793          	addi	a5,a5,-488 # 8000dec0 <_ZTV12ConsumerSync+0x10>
    800080b0:	00f53023          	sd	a5,0(a0)
    800080b4:	ffff9097          	auipc	ra,0xffff9
    800080b8:	098080e7          	jalr	152(ra) # 8000114c <_ZN6ThreadD1Ev>
    800080bc:	00048513          	mv	a0,s1
    800080c0:	ffff9097          	auipc	ra,0xffff9
    800080c4:	124080e7          	jalr	292(ra) # 800011e4 <_ZdlPv>
    800080c8:	01813083          	ld	ra,24(sp)
    800080cc:	01013403          	ld	s0,16(sp)
    800080d0:	00813483          	ld	s1,8(sp)
    800080d4:	02010113          	addi	sp,sp,32
    800080d8:	00008067          	ret

00000000800080dc <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    800080dc:	ff010113          	addi	sp,sp,-16
    800080e0:	00113423          	sd	ra,8(sp)
    800080e4:	00813023          	sd	s0,0(sp)
    800080e8:	01010413          	addi	s0,sp,16
    800080ec:	00006797          	auipc	a5,0x6
    800080f0:	dac78793          	addi	a5,a5,-596 # 8000de98 <_ZTV12ProducerSync+0x10>
    800080f4:	00f53023          	sd	a5,0(a0)
    800080f8:	ffff9097          	auipc	ra,0xffff9
    800080fc:	054080e7          	jalr	84(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008100:	00813083          	ld	ra,8(sp)
    80008104:	00013403          	ld	s0,0(sp)
    80008108:	01010113          	addi	sp,sp,16
    8000810c:	00008067          	ret

0000000080008110 <_ZN12ProducerSyncD0Ev>:
    80008110:	fe010113          	addi	sp,sp,-32
    80008114:	00113c23          	sd	ra,24(sp)
    80008118:	00813823          	sd	s0,16(sp)
    8000811c:	00913423          	sd	s1,8(sp)
    80008120:	02010413          	addi	s0,sp,32
    80008124:	00050493          	mv	s1,a0
    80008128:	00006797          	auipc	a5,0x6
    8000812c:	d7078793          	addi	a5,a5,-656 # 8000de98 <_ZTV12ProducerSync+0x10>
    80008130:	00f53023          	sd	a5,0(a0)
    80008134:	ffff9097          	auipc	ra,0xffff9
    80008138:	018080e7          	jalr	24(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000813c:	00048513          	mv	a0,s1
    80008140:	ffff9097          	auipc	ra,0xffff9
    80008144:	0a4080e7          	jalr	164(ra) # 800011e4 <_ZdlPv>
    80008148:	01813083          	ld	ra,24(sp)
    8000814c:	01013403          	ld	s0,16(sp)
    80008150:	00813483          	ld	s1,8(sp)
    80008154:	02010113          	addi	sp,sp,32
    80008158:	00008067          	ret

000000008000815c <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    8000815c:	ff010113          	addi	sp,sp,-16
    80008160:	00113423          	sd	ra,8(sp)
    80008164:	00813023          	sd	s0,0(sp)
    80008168:	01010413          	addi	s0,sp,16
    8000816c:	00006797          	auipc	a5,0x6
    80008170:	d0478793          	addi	a5,a5,-764 # 8000de70 <_ZTV16ProducerKeyboard+0x10>
    80008174:	00f53023          	sd	a5,0(a0)
    80008178:	ffff9097          	auipc	ra,0xffff9
    8000817c:	fd4080e7          	jalr	-44(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008180:	00813083          	ld	ra,8(sp)
    80008184:	00013403          	ld	s0,0(sp)
    80008188:	01010113          	addi	sp,sp,16
    8000818c:	00008067          	ret

0000000080008190 <_ZN16ProducerKeyboardD0Ev>:
    80008190:	fe010113          	addi	sp,sp,-32
    80008194:	00113c23          	sd	ra,24(sp)
    80008198:	00813823          	sd	s0,16(sp)
    8000819c:	00913423          	sd	s1,8(sp)
    800081a0:	02010413          	addi	s0,sp,32
    800081a4:	00050493          	mv	s1,a0
    800081a8:	00006797          	auipc	a5,0x6
    800081ac:	cc878793          	addi	a5,a5,-824 # 8000de70 <_ZTV16ProducerKeyboard+0x10>
    800081b0:	00f53023          	sd	a5,0(a0)
    800081b4:	ffff9097          	auipc	ra,0xffff9
    800081b8:	f98080e7          	jalr	-104(ra) # 8000114c <_ZN6ThreadD1Ev>
    800081bc:	00048513          	mv	a0,s1
    800081c0:	ffff9097          	auipc	ra,0xffff9
    800081c4:	024080e7          	jalr	36(ra) # 800011e4 <_ZdlPv>
    800081c8:	01813083          	ld	ra,24(sp)
    800081cc:	01013403          	ld	s0,16(sp)
    800081d0:	00813483          	ld	s1,8(sp)
    800081d4:	02010113          	addi	sp,sp,32
    800081d8:	00008067          	ret

00000000800081dc <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    800081dc:	ff010113          	addi	sp,sp,-16
    800081e0:	00113423          	sd	ra,8(sp)
    800081e4:	00813023          	sd	s0,0(sp)
    800081e8:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    800081ec:	02053583          	ld	a1,32(a0)
    800081f0:	fffff097          	auipc	ra,0xfffff
    800081f4:	7e4080e7          	jalr	2020(ra) # 800079d4 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    800081f8:	00813083          	ld	ra,8(sp)
    800081fc:	00013403          	ld	s0,0(sp)
    80008200:	01010113          	addi	sp,sp,16
    80008204:	00008067          	ret

0000000080008208 <_ZN12ProducerSync3runEv>:
    void run() override {
    80008208:	ff010113          	addi	sp,sp,-16
    8000820c:	00113423          	sd	ra,8(sp)
    80008210:	00813023          	sd	s0,0(sp)
    80008214:	01010413          	addi	s0,sp,16
        producer(td);
    80008218:	02053583          	ld	a1,32(a0)
    8000821c:	00000097          	auipc	ra,0x0
    80008220:	878080e7          	jalr	-1928(ra) # 80007a94 <_ZN12ProducerSync8producerEPv>
    }
    80008224:	00813083          	ld	ra,8(sp)
    80008228:	00013403          	ld	s0,0(sp)
    8000822c:	01010113          	addi	sp,sp,16
    80008230:	00008067          	ret

0000000080008234 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80008234:	ff010113          	addi	sp,sp,-16
    80008238:	00113423          	sd	ra,8(sp)
    8000823c:	00813023          	sd	s0,0(sp)
    80008240:	01010413          	addi	s0,sp,16
        consumer(td);
    80008244:	02053583          	ld	a1,32(a0)
    80008248:	00000097          	auipc	ra,0x0
    8000824c:	8e0080e7          	jalr	-1824(ra) # 80007b28 <_ZN12ConsumerSync8consumerEPv>
    }
    80008250:	00813083          	ld	ra,8(sp)
    80008254:	00013403          	ld	s0,0(sp)
    80008258:	01010113          	addi	sp,sp,16
    8000825c:	00008067          	ret

0000000080008260 <start>:
    80008260:	ff010113          	addi	sp,sp,-16
    80008264:	00813423          	sd	s0,8(sp)
    80008268:	01010413          	addi	s0,sp,16
    8000826c:	300027f3          	csrr	a5,mstatus
    80008270:	ffffe737          	lui	a4,0xffffe
    80008274:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffef59f>
    80008278:	00e7f7b3          	and	a5,a5,a4
    8000827c:	00001737          	lui	a4,0x1
    80008280:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80008284:	00e7e7b3          	or	a5,a5,a4
    80008288:	30079073          	csrw	mstatus,a5
    8000828c:	00000797          	auipc	a5,0x0
    80008290:	16078793          	addi	a5,a5,352 # 800083ec <system_main>
    80008294:	34179073          	csrw	mepc,a5
    80008298:	00000793          	li	a5,0
    8000829c:	18079073          	csrw	satp,a5
    800082a0:	000107b7          	lui	a5,0x10
    800082a4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800082a8:	30279073          	csrw	medeleg,a5
    800082ac:	30379073          	csrw	mideleg,a5
    800082b0:	104027f3          	csrr	a5,sie
    800082b4:	2227e793          	ori	a5,a5,546
    800082b8:	10479073          	csrw	sie,a5
    800082bc:	fff00793          	li	a5,-1
    800082c0:	00a7d793          	srli	a5,a5,0xa
    800082c4:	3b079073          	csrw	pmpaddr0,a5
    800082c8:	00f00793          	li	a5,15
    800082cc:	3a079073          	csrw	pmpcfg0,a5
    800082d0:	f14027f3          	csrr	a5,mhartid
    800082d4:	0200c737          	lui	a4,0x200c
    800082d8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800082dc:	0007869b          	sext.w	a3,a5
    800082e0:	00269713          	slli	a4,a3,0x2
    800082e4:	000f4637          	lui	a2,0xf4
    800082e8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800082ec:	00d70733          	add	a4,a4,a3
    800082f0:	0037979b          	slliw	a5,a5,0x3
    800082f4:	020046b7          	lui	a3,0x2004
    800082f8:	00d787b3          	add	a5,a5,a3
    800082fc:	00c585b3          	add	a1,a1,a2
    80008300:	00371693          	slli	a3,a4,0x3
    80008304:	00006717          	auipc	a4,0x6
    80008308:	cfc70713          	addi	a4,a4,-772 # 8000e000 <timer_scratch>
    8000830c:	00b7b023          	sd	a1,0(a5)
    80008310:	00d70733          	add	a4,a4,a3
    80008314:	00f73c23          	sd	a5,24(a4)
    80008318:	02c73023          	sd	a2,32(a4)
    8000831c:	34071073          	csrw	mscratch,a4
    80008320:	00000797          	auipc	a5,0x0
    80008324:	6e078793          	addi	a5,a5,1760 # 80008a00 <timervec>
    80008328:	30579073          	csrw	mtvec,a5
    8000832c:	300027f3          	csrr	a5,mstatus
    80008330:	0087e793          	ori	a5,a5,8
    80008334:	30079073          	csrw	mstatus,a5
    80008338:	304027f3          	csrr	a5,mie
    8000833c:	0807e793          	ori	a5,a5,128
    80008340:	30479073          	csrw	mie,a5
    80008344:	f14027f3          	csrr	a5,mhartid
    80008348:	0007879b          	sext.w	a5,a5
    8000834c:	00078213          	mv	tp,a5
    80008350:	30200073          	mret
    80008354:	00813403          	ld	s0,8(sp)
    80008358:	01010113          	addi	sp,sp,16
    8000835c:	00008067          	ret

0000000080008360 <timerinit>:
    80008360:	ff010113          	addi	sp,sp,-16
    80008364:	00813423          	sd	s0,8(sp)
    80008368:	01010413          	addi	s0,sp,16
    8000836c:	f14027f3          	csrr	a5,mhartid
    80008370:	0200c737          	lui	a4,0x200c
    80008374:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80008378:	0007869b          	sext.w	a3,a5
    8000837c:	00269713          	slli	a4,a3,0x2
    80008380:	000f4637          	lui	a2,0xf4
    80008384:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80008388:	00d70733          	add	a4,a4,a3
    8000838c:	0037979b          	slliw	a5,a5,0x3
    80008390:	020046b7          	lui	a3,0x2004
    80008394:	00d787b3          	add	a5,a5,a3
    80008398:	00c585b3          	add	a1,a1,a2
    8000839c:	00371693          	slli	a3,a4,0x3
    800083a0:	00006717          	auipc	a4,0x6
    800083a4:	c6070713          	addi	a4,a4,-928 # 8000e000 <timer_scratch>
    800083a8:	00b7b023          	sd	a1,0(a5)
    800083ac:	00d70733          	add	a4,a4,a3
    800083b0:	00f73c23          	sd	a5,24(a4)
    800083b4:	02c73023          	sd	a2,32(a4)
    800083b8:	34071073          	csrw	mscratch,a4
    800083bc:	00000797          	auipc	a5,0x0
    800083c0:	64478793          	addi	a5,a5,1604 # 80008a00 <timervec>
    800083c4:	30579073          	csrw	mtvec,a5
    800083c8:	300027f3          	csrr	a5,mstatus
    800083cc:	0087e793          	ori	a5,a5,8
    800083d0:	30079073          	csrw	mstatus,a5
    800083d4:	304027f3          	csrr	a5,mie
    800083d8:	0807e793          	ori	a5,a5,128
    800083dc:	30479073          	csrw	mie,a5
    800083e0:	00813403          	ld	s0,8(sp)
    800083e4:	01010113          	addi	sp,sp,16
    800083e8:	00008067          	ret

00000000800083ec <system_main>:
    800083ec:	fe010113          	addi	sp,sp,-32
    800083f0:	00813823          	sd	s0,16(sp)
    800083f4:	00913423          	sd	s1,8(sp)
    800083f8:	00113c23          	sd	ra,24(sp)
    800083fc:	02010413          	addi	s0,sp,32
    80008400:	00000097          	auipc	ra,0x0
    80008404:	0c4080e7          	jalr	196(ra) # 800084c4 <cpuid>
    80008408:	00006497          	auipc	s1,0x6
    8000840c:	b3848493          	addi	s1,s1,-1224 # 8000df40 <started>
    80008410:	02050263          	beqz	a0,80008434 <system_main+0x48>
    80008414:	0004a783          	lw	a5,0(s1)
    80008418:	0007879b          	sext.w	a5,a5
    8000841c:	fe078ce3          	beqz	a5,80008414 <system_main+0x28>
    80008420:	0ff0000f          	fence
    80008424:	00003517          	auipc	a0,0x3
    80008428:	52c50513          	addi	a0,a0,1324 # 8000b950 <CONSOLE_STATUS+0x940>
    8000842c:	00001097          	auipc	ra,0x1
    80008430:	a70080e7          	jalr	-1424(ra) # 80008e9c <panic>
    80008434:	00001097          	auipc	ra,0x1
    80008438:	9c4080e7          	jalr	-1596(ra) # 80008df8 <consoleinit>
    8000843c:	00001097          	auipc	ra,0x1
    80008440:	150080e7          	jalr	336(ra) # 8000958c <printfinit>
    80008444:	00003517          	auipc	a0,0x3
    80008448:	38c50513          	addi	a0,a0,908 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    8000844c:	00001097          	auipc	ra,0x1
    80008450:	aac080e7          	jalr	-1364(ra) # 80008ef8 <__printf>
    80008454:	00003517          	auipc	a0,0x3
    80008458:	4cc50513          	addi	a0,a0,1228 # 8000b920 <CONSOLE_STATUS+0x910>
    8000845c:	00001097          	auipc	ra,0x1
    80008460:	a9c080e7          	jalr	-1380(ra) # 80008ef8 <__printf>
    80008464:	00003517          	auipc	a0,0x3
    80008468:	36c50513          	addi	a0,a0,876 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    8000846c:	00001097          	auipc	ra,0x1
    80008470:	a8c080e7          	jalr	-1396(ra) # 80008ef8 <__printf>
    80008474:	00001097          	auipc	ra,0x1
    80008478:	4a4080e7          	jalr	1188(ra) # 80009918 <kinit>
    8000847c:	00000097          	auipc	ra,0x0
    80008480:	148080e7          	jalr	328(ra) # 800085c4 <trapinit>
    80008484:	00000097          	auipc	ra,0x0
    80008488:	16c080e7          	jalr	364(ra) # 800085f0 <trapinithart>
    8000848c:	00000097          	auipc	ra,0x0
    80008490:	5b4080e7          	jalr	1460(ra) # 80008a40 <plicinit>
    80008494:	00000097          	auipc	ra,0x0
    80008498:	5d4080e7          	jalr	1492(ra) # 80008a68 <plicinithart>
    8000849c:	00000097          	auipc	ra,0x0
    800084a0:	078080e7          	jalr	120(ra) # 80008514 <userinit>
    800084a4:	0ff0000f          	fence
    800084a8:	00100793          	li	a5,1
    800084ac:	00003517          	auipc	a0,0x3
    800084b0:	48c50513          	addi	a0,a0,1164 # 8000b938 <CONSOLE_STATUS+0x928>
    800084b4:	00f4a023          	sw	a5,0(s1)
    800084b8:	00001097          	auipc	ra,0x1
    800084bc:	a40080e7          	jalr	-1472(ra) # 80008ef8 <__printf>
    800084c0:	0000006f          	j	800084c0 <system_main+0xd4>

00000000800084c4 <cpuid>:
    800084c4:	ff010113          	addi	sp,sp,-16
    800084c8:	00813423          	sd	s0,8(sp)
    800084cc:	01010413          	addi	s0,sp,16
    800084d0:	00020513          	mv	a0,tp
    800084d4:	00813403          	ld	s0,8(sp)
    800084d8:	0005051b          	sext.w	a0,a0
    800084dc:	01010113          	addi	sp,sp,16
    800084e0:	00008067          	ret

00000000800084e4 <mycpu>:
    800084e4:	ff010113          	addi	sp,sp,-16
    800084e8:	00813423          	sd	s0,8(sp)
    800084ec:	01010413          	addi	s0,sp,16
    800084f0:	00020793          	mv	a5,tp
    800084f4:	00813403          	ld	s0,8(sp)
    800084f8:	0007879b          	sext.w	a5,a5
    800084fc:	00779793          	slli	a5,a5,0x7
    80008500:	00007517          	auipc	a0,0x7
    80008504:	b3050513          	addi	a0,a0,-1232 # 8000f030 <cpus>
    80008508:	00f50533          	add	a0,a0,a5
    8000850c:	01010113          	addi	sp,sp,16
    80008510:	00008067          	ret

0000000080008514 <userinit>:
    80008514:	ff010113          	addi	sp,sp,-16
    80008518:	00813423          	sd	s0,8(sp)
    8000851c:	01010413          	addi	s0,sp,16
    80008520:	00813403          	ld	s0,8(sp)
    80008524:	01010113          	addi	sp,sp,16
    80008528:	ffff9317          	auipc	t1,0xffff9
    8000852c:	75830067          	jr	1880(t1) # 80001c80 <main>

0000000080008530 <either_copyout>:
    80008530:	ff010113          	addi	sp,sp,-16
    80008534:	00813023          	sd	s0,0(sp)
    80008538:	00113423          	sd	ra,8(sp)
    8000853c:	01010413          	addi	s0,sp,16
    80008540:	02051663          	bnez	a0,8000856c <either_copyout+0x3c>
    80008544:	00058513          	mv	a0,a1
    80008548:	00060593          	mv	a1,a2
    8000854c:	0006861b          	sext.w	a2,a3
    80008550:	00002097          	auipc	ra,0x2
    80008554:	c54080e7          	jalr	-940(ra) # 8000a1a4 <__memmove>
    80008558:	00813083          	ld	ra,8(sp)
    8000855c:	00013403          	ld	s0,0(sp)
    80008560:	00000513          	li	a0,0
    80008564:	01010113          	addi	sp,sp,16
    80008568:	00008067          	ret
    8000856c:	00003517          	auipc	a0,0x3
    80008570:	40c50513          	addi	a0,a0,1036 # 8000b978 <CONSOLE_STATUS+0x968>
    80008574:	00001097          	auipc	ra,0x1
    80008578:	928080e7          	jalr	-1752(ra) # 80008e9c <panic>

000000008000857c <either_copyin>:
    8000857c:	ff010113          	addi	sp,sp,-16
    80008580:	00813023          	sd	s0,0(sp)
    80008584:	00113423          	sd	ra,8(sp)
    80008588:	01010413          	addi	s0,sp,16
    8000858c:	02059463          	bnez	a1,800085b4 <either_copyin+0x38>
    80008590:	00060593          	mv	a1,a2
    80008594:	0006861b          	sext.w	a2,a3
    80008598:	00002097          	auipc	ra,0x2
    8000859c:	c0c080e7          	jalr	-1012(ra) # 8000a1a4 <__memmove>
    800085a0:	00813083          	ld	ra,8(sp)
    800085a4:	00013403          	ld	s0,0(sp)
    800085a8:	00000513          	li	a0,0
    800085ac:	01010113          	addi	sp,sp,16
    800085b0:	00008067          	ret
    800085b4:	00003517          	auipc	a0,0x3
    800085b8:	3ec50513          	addi	a0,a0,1004 # 8000b9a0 <CONSOLE_STATUS+0x990>
    800085bc:	00001097          	auipc	ra,0x1
    800085c0:	8e0080e7          	jalr	-1824(ra) # 80008e9c <panic>

00000000800085c4 <trapinit>:
    800085c4:	ff010113          	addi	sp,sp,-16
    800085c8:	00813423          	sd	s0,8(sp)
    800085cc:	01010413          	addi	s0,sp,16
    800085d0:	00813403          	ld	s0,8(sp)
    800085d4:	00003597          	auipc	a1,0x3
    800085d8:	3f458593          	addi	a1,a1,1012 # 8000b9c8 <CONSOLE_STATUS+0x9b8>
    800085dc:	00007517          	auipc	a0,0x7
    800085e0:	ad450513          	addi	a0,a0,-1324 # 8000f0b0 <tickslock>
    800085e4:	01010113          	addi	sp,sp,16
    800085e8:	00001317          	auipc	t1,0x1
    800085ec:	5c030067          	jr	1472(t1) # 80009ba8 <initlock>

00000000800085f0 <trapinithart>:
    800085f0:	ff010113          	addi	sp,sp,-16
    800085f4:	00813423          	sd	s0,8(sp)
    800085f8:	01010413          	addi	s0,sp,16
    800085fc:	00000797          	auipc	a5,0x0
    80008600:	2f478793          	addi	a5,a5,756 # 800088f0 <kernelvec>
    80008604:	10579073          	csrw	stvec,a5
    80008608:	00813403          	ld	s0,8(sp)
    8000860c:	01010113          	addi	sp,sp,16
    80008610:	00008067          	ret

0000000080008614 <usertrap>:
    80008614:	ff010113          	addi	sp,sp,-16
    80008618:	00813423          	sd	s0,8(sp)
    8000861c:	01010413          	addi	s0,sp,16
    80008620:	00813403          	ld	s0,8(sp)
    80008624:	01010113          	addi	sp,sp,16
    80008628:	00008067          	ret

000000008000862c <usertrapret>:
    8000862c:	ff010113          	addi	sp,sp,-16
    80008630:	00813423          	sd	s0,8(sp)
    80008634:	01010413          	addi	s0,sp,16
    80008638:	00813403          	ld	s0,8(sp)
    8000863c:	01010113          	addi	sp,sp,16
    80008640:	00008067          	ret

0000000080008644 <kerneltrap>:
    80008644:	fe010113          	addi	sp,sp,-32
    80008648:	00813823          	sd	s0,16(sp)
    8000864c:	00113c23          	sd	ra,24(sp)
    80008650:	00913423          	sd	s1,8(sp)
    80008654:	02010413          	addi	s0,sp,32
    80008658:	142025f3          	csrr	a1,scause
    8000865c:	100027f3          	csrr	a5,sstatus
    80008660:	0027f793          	andi	a5,a5,2
    80008664:	10079c63          	bnez	a5,8000877c <kerneltrap+0x138>
    80008668:	142027f3          	csrr	a5,scause
    8000866c:	0207ce63          	bltz	a5,800086a8 <kerneltrap+0x64>
    80008670:	00003517          	auipc	a0,0x3
    80008674:	3a050513          	addi	a0,a0,928 # 8000ba10 <CONSOLE_STATUS+0xa00>
    80008678:	00001097          	auipc	ra,0x1
    8000867c:	880080e7          	jalr	-1920(ra) # 80008ef8 <__printf>
    80008680:	141025f3          	csrr	a1,sepc
    80008684:	14302673          	csrr	a2,stval
    80008688:	00003517          	auipc	a0,0x3
    8000868c:	39850513          	addi	a0,a0,920 # 8000ba20 <CONSOLE_STATUS+0xa10>
    80008690:	00001097          	auipc	ra,0x1
    80008694:	868080e7          	jalr	-1944(ra) # 80008ef8 <__printf>
    80008698:	00003517          	auipc	a0,0x3
    8000869c:	3a050513          	addi	a0,a0,928 # 8000ba38 <CONSOLE_STATUS+0xa28>
    800086a0:	00000097          	auipc	ra,0x0
    800086a4:	7fc080e7          	jalr	2044(ra) # 80008e9c <panic>
    800086a8:	0ff7f713          	andi	a4,a5,255
    800086ac:	00900693          	li	a3,9
    800086b0:	04d70063          	beq	a4,a3,800086f0 <kerneltrap+0xac>
    800086b4:	fff00713          	li	a4,-1
    800086b8:	03f71713          	slli	a4,a4,0x3f
    800086bc:	00170713          	addi	a4,a4,1
    800086c0:	fae798e3          	bne	a5,a4,80008670 <kerneltrap+0x2c>
    800086c4:	00000097          	auipc	ra,0x0
    800086c8:	e00080e7          	jalr	-512(ra) # 800084c4 <cpuid>
    800086cc:	06050663          	beqz	a0,80008738 <kerneltrap+0xf4>
    800086d0:	144027f3          	csrr	a5,sip
    800086d4:	ffd7f793          	andi	a5,a5,-3
    800086d8:	14479073          	csrw	sip,a5
    800086dc:	01813083          	ld	ra,24(sp)
    800086e0:	01013403          	ld	s0,16(sp)
    800086e4:	00813483          	ld	s1,8(sp)
    800086e8:	02010113          	addi	sp,sp,32
    800086ec:	00008067          	ret
    800086f0:	00000097          	auipc	ra,0x0
    800086f4:	3c4080e7          	jalr	964(ra) # 80008ab4 <plic_claim>
    800086f8:	00a00793          	li	a5,10
    800086fc:	00050493          	mv	s1,a0
    80008700:	06f50863          	beq	a0,a5,80008770 <kerneltrap+0x12c>
    80008704:	fc050ce3          	beqz	a0,800086dc <kerneltrap+0x98>
    80008708:	00050593          	mv	a1,a0
    8000870c:	00003517          	auipc	a0,0x3
    80008710:	2e450513          	addi	a0,a0,740 # 8000b9f0 <CONSOLE_STATUS+0x9e0>
    80008714:	00000097          	auipc	ra,0x0
    80008718:	7e4080e7          	jalr	2020(ra) # 80008ef8 <__printf>
    8000871c:	01013403          	ld	s0,16(sp)
    80008720:	01813083          	ld	ra,24(sp)
    80008724:	00048513          	mv	a0,s1
    80008728:	00813483          	ld	s1,8(sp)
    8000872c:	02010113          	addi	sp,sp,32
    80008730:	00000317          	auipc	t1,0x0
    80008734:	3bc30067          	jr	956(t1) # 80008aec <plic_complete>
    80008738:	00007517          	auipc	a0,0x7
    8000873c:	97850513          	addi	a0,a0,-1672 # 8000f0b0 <tickslock>
    80008740:	00001097          	auipc	ra,0x1
    80008744:	48c080e7          	jalr	1164(ra) # 80009bcc <acquire>
    80008748:	00005717          	auipc	a4,0x5
    8000874c:	7fc70713          	addi	a4,a4,2044 # 8000df44 <ticks>
    80008750:	00072783          	lw	a5,0(a4)
    80008754:	00007517          	auipc	a0,0x7
    80008758:	95c50513          	addi	a0,a0,-1700 # 8000f0b0 <tickslock>
    8000875c:	0017879b          	addiw	a5,a5,1
    80008760:	00f72023          	sw	a5,0(a4)
    80008764:	00001097          	auipc	ra,0x1
    80008768:	534080e7          	jalr	1332(ra) # 80009c98 <release>
    8000876c:	f65ff06f          	j	800086d0 <kerneltrap+0x8c>
    80008770:	00001097          	auipc	ra,0x1
    80008774:	090080e7          	jalr	144(ra) # 80009800 <uartintr>
    80008778:	fa5ff06f          	j	8000871c <kerneltrap+0xd8>
    8000877c:	00003517          	auipc	a0,0x3
    80008780:	25450513          	addi	a0,a0,596 # 8000b9d0 <CONSOLE_STATUS+0x9c0>
    80008784:	00000097          	auipc	ra,0x0
    80008788:	718080e7          	jalr	1816(ra) # 80008e9c <panic>

000000008000878c <clockintr>:
    8000878c:	fe010113          	addi	sp,sp,-32
    80008790:	00813823          	sd	s0,16(sp)
    80008794:	00913423          	sd	s1,8(sp)
    80008798:	00113c23          	sd	ra,24(sp)
    8000879c:	02010413          	addi	s0,sp,32
    800087a0:	00007497          	auipc	s1,0x7
    800087a4:	91048493          	addi	s1,s1,-1776 # 8000f0b0 <tickslock>
    800087a8:	00048513          	mv	a0,s1
    800087ac:	00001097          	auipc	ra,0x1
    800087b0:	420080e7          	jalr	1056(ra) # 80009bcc <acquire>
    800087b4:	00005717          	auipc	a4,0x5
    800087b8:	79070713          	addi	a4,a4,1936 # 8000df44 <ticks>
    800087bc:	00072783          	lw	a5,0(a4)
    800087c0:	01013403          	ld	s0,16(sp)
    800087c4:	01813083          	ld	ra,24(sp)
    800087c8:	00048513          	mv	a0,s1
    800087cc:	0017879b          	addiw	a5,a5,1
    800087d0:	00813483          	ld	s1,8(sp)
    800087d4:	00f72023          	sw	a5,0(a4)
    800087d8:	02010113          	addi	sp,sp,32
    800087dc:	00001317          	auipc	t1,0x1
    800087e0:	4bc30067          	jr	1212(t1) # 80009c98 <release>

00000000800087e4 <devintr>:
    800087e4:	142027f3          	csrr	a5,scause
    800087e8:	00000513          	li	a0,0
    800087ec:	0007c463          	bltz	a5,800087f4 <devintr+0x10>
    800087f0:	00008067          	ret
    800087f4:	fe010113          	addi	sp,sp,-32
    800087f8:	00813823          	sd	s0,16(sp)
    800087fc:	00113c23          	sd	ra,24(sp)
    80008800:	00913423          	sd	s1,8(sp)
    80008804:	02010413          	addi	s0,sp,32
    80008808:	0ff7f713          	andi	a4,a5,255
    8000880c:	00900693          	li	a3,9
    80008810:	04d70c63          	beq	a4,a3,80008868 <devintr+0x84>
    80008814:	fff00713          	li	a4,-1
    80008818:	03f71713          	slli	a4,a4,0x3f
    8000881c:	00170713          	addi	a4,a4,1
    80008820:	00e78c63          	beq	a5,a4,80008838 <devintr+0x54>
    80008824:	01813083          	ld	ra,24(sp)
    80008828:	01013403          	ld	s0,16(sp)
    8000882c:	00813483          	ld	s1,8(sp)
    80008830:	02010113          	addi	sp,sp,32
    80008834:	00008067          	ret
    80008838:	00000097          	auipc	ra,0x0
    8000883c:	c8c080e7          	jalr	-884(ra) # 800084c4 <cpuid>
    80008840:	06050663          	beqz	a0,800088ac <devintr+0xc8>
    80008844:	144027f3          	csrr	a5,sip
    80008848:	ffd7f793          	andi	a5,a5,-3
    8000884c:	14479073          	csrw	sip,a5
    80008850:	01813083          	ld	ra,24(sp)
    80008854:	01013403          	ld	s0,16(sp)
    80008858:	00813483          	ld	s1,8(sp)
    8000885c:	00200513          	li	a0,2
    80008860:	02010113          	addi	sp,sp,32
    80008864:	00008067          	ret
    80008868:	00000097          	auipc	ra,0x0
    8000886c:	24c080e7          	jalr	588(ra) # 80008ab4 <plic_claim>
    80008870:	00a00793          	li	a5,10
    80008874:	00050493          	mv	s1,a0
    80008878:	06f50663          	beq	a0,a5,800088e4 <devintr+0x100>
    8000887c:	00100513          	li	a0,1
    80008880:	fa0482e3          	beqz	s1,80008824 <devintr+0x40>
    80008884:	00048593          	mv	a1,s1
    80008888:	00003517          	auipc	a0,0x3
    8000888c:	16850513          	addi	a0,a0,360 # 8000b9f0 <CONSOLE_STATUS+0x9e0>
    80008890:	00000097          	auipc	ra,0x0
    80008894:	668080e7          	jalr	1640(ra) # 80008ef8 <__printf>
    80008898:	00048513          	mv	a0,s1
    8000889c:	00000097          	auipc	ra,0x0
    800088a0:	250080e7          	jalr	592(ra) # 80008aec <plic_complete>
    800088a4:	00100513          	li	a0,1
    800088a8:	f7dff06f          	j	80008824 <devintr+0x40>
    800088ac:	00007517          	auipc	a0,0x7
    800088b0:	80450513          	addi	a0,a0,-2044 # 8000f0b0 <tickslock>
    800088b4:	00001097          	auipc	ra,0x1
    800088b8:	318080e7          	jalr	792(ra) # 80009bcc <acquire>
    800088bc:	00005717          	auipc	a4,0x5
    800088c0:	68870713          	addi	a4,a4,1672 # 8000df44 <ticks>
    800088c4:	00072783          	lw	a5,0(a4)
    800088c8:	00006517          	auipc	a0,0x6
    800088cc:	7e850513          	addi	a0,a0,2024 # 8000f0b0 <tickslock>
    800088d0:	0017879b          	addiw	a5,a5,1
    800088d4:	00f72023          	sw	a5,0(a4)
    800088d8:	00001097          	auipc	ra,0x1
    800088dc:	3c0080e7          	jalr	960(ra) # 80009c98 <release>
    800088e0:	f65ff06f          	j	80008844 <devintr+0x60>
    800088e4:	00001097          	auipc	ra,0x1
    800088e8:	f1c080e7          	jalr	-228(ra) # 80009800 <uartintr>
    800088ec:	fadff06f          	j	80008898 <devintr+0xb4>

00000000800088f0 <kernelvec>:
    800088f0:	f0010113          	addi	sp,sp,-256
    800088f4:	00113023          	sd	ra,0(sp)
    800088f8:	00213423          	sd	sp,8(sp)
    800088fc:	00313823          	sd	gp,16(sp)
    80008900:	00413c23          	sd	tp,24(sp)
    80008904:	02513023          	sd	t0,32(sp)
    80008908:	02613423          	sd	t1,40(sp)
    8000890c:	02713823          	sd	t2,48(sp)
    80008910:	02813c23          	sd	s0,56(sp)
    80008914:	04913023          	sd	s1,64(sp)
    80008918:	04a13423          	sd	a0,72(sp)
    8000891c:	04b13823          	sd	a1,80(sp)
    80008920:	04c13c23          	sd	a2,88(sp)
    80008924:	06d13023          	sd	a3,96(sp)
    80008928:	06e13423          	sd	a4,104(sp)
    8000892c:	06f13823          	sd	a5,112(sp)
    80008930:	07013c23          	sd	a6,120(sp)
    80008934:	09113023          	sd	a7,128(sp)
    80008938:	09213423          	sd	s2,136(sp)
    8000893c:	09313823          	sd	s3,144(sp)
    80008940:	09413c23          	sd	s4,152(sp)
    80008944:	0b513023          	sd	s5,160(sp)
    80008948:	0b613423          	sd	s6,168(sp)
    8000894c:	0b713823          	sd	s7,176(sp)
    80008950:	0b813c23          	sd	s8,184(sp)
    80008954:	0d913023          	sd	s9,192(sp)
    80008958:	0da13423          	sd	s10,200(sp)
    8000895c:	0db13823          	sd	s11,208(sp)
    80008960:	0dc13c23          	sd	t3,216(sp)
    80008964:	0fd13023          	sd	t4,224(sp)
    80008968:	0fe13423          	sd	t5,232(sp)
    8000896c:	0ff13823          	sd	t6,240(sp)
    80008970:	cd5ff0ef          	jal	ra,80008644 <kerneltrap>
    80008974:	00013083          	ld	ra,0(sp)
    80008978:	00813103          	ld	sp,8(sp)
    8000897c:	01013183          	ld	gp,16(sp)
    80008980:	02013283          	ld	t0,32(sp)
    80008984:	02813303          	ld	t1,40(sp)
    80008988:	03013383          	ld	t2,48(sp)
    8000898c:	03813403          	ld	s0,56(sp)
    80008990:	04013483          	ld	s1,64(sp)
    80008994:	04813503          	ld	a0,72(sp)
    80008998:	05013583          	ld	a1,80(sp)
    8000899c:	05813603          	ld	a2,88(sp)
    800089a0:	06013683          	ld	a3,96(sp)
    800089a4:	06813703          	ld	a4,104(sp)
    800089a8:	07013783          	ld	a5,112(sp)
    800089ac:	07813803          	ld	a6,120(sp)
    800089b0:	08013883          	ld	a7,128(sp)
    800089b4:	08813903          	ld	s2,136(sp)
    800089b8:	09013983          	ld	s3,144(sp)
    800089bc:	09813a03          	ld	s4,152(sp)
    800089c0:	0a013a83          	ld	s5,160(sp)
    800089c4:	0a813b03          	ld	s6,168(sp)
    800089c8:	0b013b83          	ld	s7,176(sp)
    800089cc:	0b813c03          	ld	s8,184(sp)
    800089d0:	0c013c83          	ld	s9,192(sp)
    800089d4:	0c813d03          	ld	s10,200(sp)
    800089d8:	0d013d83          	ld	s11,208(sp)
    800089dc:	0d813e03          	ld	t3,216(sp)
    800089e0:	0e013e83          	ld	t4,224(sp)
    800089e4:	0e813f03          	ld	t5,232(sp)
    800089e8:	0f013f83          	ld	t6,240(sp)
    800089ec:	10010113          	addi	sp,sp,256
    800089f0:	10200073          	sret
    800089f4:	00000013          	nop
    800089f8:	00000013          	nop
    800089fc:	00000013          	nop

0000000080008a00 <timervec>:
    80008a00:	34051573          	csrrw	a0,mscratch,a0
    80008a04:	00b53023          	sd	a1,0(a0)
    80008a08:	00c53423          	sd	a2,8(a0)
    80008a0c:	00d53823          	sd	a3,16(a0)
    80008a10:	01853583          	ld	a1,24(a0)
    80008a14:	02053603          	ld	a2,32(a0)
    80008a18:	0005b683          	ld	a3,0(a1)
    80008a1c:	00c686b3          	add	a3,a3,a2
    80008a20:	00d5b023          	sd	a3,0(a1)
    80008a24:	00200593          	li	a1,2
    80008a28:	14459073          	csrw	sip,a1
    80008a2c:	01053683          	ld	a3,16(a0)
    80008a30:	00853603          	ld	a2,8(a0)
    80008a34:	00053583          	ld	a1,0(a0)
    80008a38:	34051573          	csrrw	a0,mscratch,a0
    80008a3c:	30200073          	mret

0000000080008a40 <plicinit>:
    80008a40:	ff010113          	addi	sp,sp,-16
    80008a44:	00813423          	sd	s0,8(sp)
    80008a48:	01010413          	addi	s0,sp,16
    80008a4c:	00813403          	ld	s0,8(sp)
    80008a50:	0c0007b7          	lui	a5,0xc000
    80008a54:	00100713          	li	a4,1
    80008a58:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80008a5c:	00e7a223          	sw	a4,4(a5)
    80008a60:	01010113          	addi	sp,sp,16
    80008a64:	00008067          	ret

0000000080008a68 <plicinithart>:
    80008a68:	ff010113          	addi	sp,sp,-16
    80008a6c:	00813023          	sd	s0,0(sp)
    80008a70:	00113423          	sd	ra,8(sp)
    80008a74:	01010413          	addi	s0,sp,16
    80008a78:	00000097          	auipc	ra,0x0
    80008a7c:	a4c080e7          	jalr	-1460(ra) # 800084c4 <cpuid>
    80008a80:	0085171b          	slliw	a4,a0,0x8
    80008a84:	0c0027b7          	lui	a5,0xc002
    80008a88:	00e787b3          	add	a5,a5,a4
    80008a8c:	40200713          	li	a4,1026
    80008a90:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80008a94:	00813083          	ld	ra,8(sp)
    80008a98:	00013403          	ld	s0,0(sp)
    80008a9c:	00d5151b          	slliw	a0,a0,0xd
    80008aa0:	0c2017b7          	lui	a5,0xc201
    80008aa4:	00a78533          	add	a0,a5,a0
    80008aa8:	00052023          	sw	zero,0(a0)
    80008aac:	01010113          	addi	sp,sp,16
    80008ab0:	00008067          	ret

0000000080008ab4 <plic_claim>:
    80008ab4:	ff010113          	addi	sp,sp,-16
    80008ab8:	00813023          	sd	s0,0(sp)
    80008abc:	00113423          	sd	ra,8(sp)
    80008ac0:	01010413          	addi	s0,sp,16
    80008ac4:	00000097          	auipc	ra,0x0
    80008ac8:	a00080e7          	jalr	-1536(ra) # 800084c4 <cpuid>
    80008acc:	00813083          	ld	ra,8(sp)
    80008ad0:	00013403          	ld	s0,0(sp)
    80008ad4:	00d5151b          	slliw	a0,a0,0xd
    80008ad8:	0c2017b7          	lui	a5,0xc201
    80008adc:	00a78533          	add	a0,a5,a0
    80008ae0:	00452503          	lw	a0,4(a0)
    80008ae4:	01010113          	addi	sp,sp,16
    80008ae8:	00008067          	ret

0000000080008aec <plic_complete>:
    80008aec:	fe010113          	addi	sp,sp,-32
    80008af0:	00813823          	sd	s0,16(sp)
    80008af4:	00913423          	sd	s1,8(sp)
    80008af8:	00113c23          	sd	ra,24(sp)
    80008afc:	02010413          	addi	s0,sp,32
    80008b00:	00050493          	mv	s1,a0
    80008b04:	00000097          	auipc	ra,0x0
    80008b08:	9c0080e7          	jalr	-1600(ra) # 800084c4 <cpuid>
    80008b0c:	01813083          	ld	ra,24(sp)
    80008b10:	01013403          	ld	s0,16(sp)
    80008b14:	00d5179b          	slliw	a5,a0,0xd
    80008b18:	0c201737          	lui	a4,0xc201
    80008b1c:	00f707b3          	add	a5,a4,a5
    80008b20:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80008b24:	00813483          	ld	s1,8(sp)
    80008b28:	02010113          	addi	sp,sp,32
    80008b2c:	00008067          	ret

0000000080008b30 <consolewrite>:
    80008b30:	fb010113          	addi	sp,sp,-80
    80008b34:	04813023          	sd	s0,64(sp)
    80008b38:	04113423          	sd	ra,72(sp)
    80008b3c:	02913c23          	sd	s1,56(sp)
    80008b40:	03213823          	sd	s2,48(sp)
    80008b44:	03313423          	sd	s3,40(sp)
    80008b48:	03413023          	sd	s4,32(sp)
    80008b4c:	01513c23          	sd	s5,24(sp)
    80008b50:	05010413          	addi	s0,sp,80
    80008b54:	06c05c63          	blez	a2,80008bcc <consolewrite+0x9c>
    80008b58:	00060993          	mv	s3,a2
    80008b5c:	00050a13          	mv	s4,a0
    80008b60:	00058493          	mv	s1,a1
    80008b64:	00000913          	li	s2,0
    80008b68:	fff00a93          	li	s5,-1
    80008b6c:	01c0006f          	j	80008b88 <consolewrite+0x58>
    80008b70:	fbf44503          	lbu	a0,-65(s0)
    80008b74:	0019091b          	addiw	s2,s2,1
    80008b78:	00148493          	addi	s1,s1,1
    80008b7c:	00001097          	auipc	ra,0x1
    80008b80:	a9c080e7          	jalr	-1380(ra) # 80009618 <uartputc>
    80008b84:	03298063          	beq	s3,s2,80008ba4 <consolewrite+0x74>
    80008b88:	00048613          	mv	a2,s1
    80008b8c:	00100693          	li	a3,1
    80008b90:	000a0593          	mv	a1,s4
    80008b94:	fbf40513          	addi	a0,s0,-65
    80008b98:	00000097          	auipc	ra,0x0
    80008b9c:	9e4080e7          	jalr	-1564(ra) # 8000857c <either_copyin>
    80008ba0:	fd5518e3          	bne	a0,s5,80008b70 <consolewrite+0x40>
    80008ba4:	04813083          	ld	ra,72(sp)
    80008ba8:	04013403          	ld	s0,64(sp)
    80008bac:	03813483          	ld	s1,56(sp)
    80008bb0:	02813983          	ld	s3,40(sp)
    80008bb4:	02013a03          	ld	s4,32(sp)
    80008bb8:	01813a83          	ld	s5,24(sp)
    80008bbc:	00090513          	mv	a0,s2
    80008bc0:	03013903          	ld	s2,48(sp)
    80008bc4:	05010113          	addi	sp,sp,80
    80008bc8:	00008067          	ret
    80008bcc:	00000913          	li	s2,0
    80008bd0:	fd5ff06f          	j	80008ba4 <consolewrite+0x74>

0000000080008bd4 <consoleread>:
    80008bd4:	f9010113          	addi	sp,sp,-112
    80008bd8:	06813023          	sd	s0,96(sp)
    80008bdc:	04913c23          	sd	s1,88(sp)
    80008be0:	05213823          	sd	s2,80(sp)
    80008be4:	05313423          	sd	s3,72(sp)
    80008be8:	05413023          	sd	s4,64(sp)
    80008bec:	03513c23          	sd	s5,56(sp)
    80008bf0:	03613823          	sd	s6,48(sp)
    80008bf4:	03713423          	sd	s7,40(sp)
    80008bf8:	03813023          	sd	s8,32(sp)
    80008bfc:	06113423          	sd	ra,104(sp)
    80008c00:	01913c23          	sd	s9,24(sp)
    80008c04:	07010413          	addi	s0,sp,112
    80008c08:	00060b93          	mv	s7,a2
    80008c0c:	00050913          	mv	s2,a0
    80008c10:	00058c13          	mv	s8,a1
    80008c14:	00060b1b          	sext.w	s6,a2
    80008c18:	00006497          	auipc	s1,0x6
    80008c1c:	4c048493          	addi	s1,s1,1216 # 8000f0d8 <cons>
    80008c20:	00400993          	li	s3,4
    80008c24:	fff00a13          	li	s4,-1
    80008c28:	00a00a93          	li	s5,10
    80008c2c:	05705e63          	blez	s7,80008c88 <consoleread+0xb4>
    80008c30:	09c4a703          	lw	a4,156(s1)
    80008c34:	0984a783          	lw	a5,152(s1)
    80008c38:	0007071b          	sext.w	a4,a4
    80008c3c:	08e78463          	beq	a5,a4,80008cc4 <consoleread+0xf0>
    80008c40:	07f7f713          	andi	a4,a5,127
    80008c44:	00e48733          	add	a4,s1,a4
    80008c48:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80008c4c:	0017869b          	addiw	a3,a5,1
    80008c50:	08d4ac23          	sw	a3,152(s1)
    80008c54:	00070c9b          	sext.w	s9,a4
    80008c58:	0b370663          	beq	a4,s3,80008d04 <consoleread+0x130>
    80008c5c:	00100693          	li	a3,1
    80008c60:	f9f40613          	addi	a2,s0,-97
    80008c64:	000c0593          	mv	a1,s8
    80008c68:	00090513          	mv	a0,s2
    80008c6c:	f8e40fa3          	sb	a4,-97(s0)
    80008c70:	00000097          	auipc	ra,0x0
    80008c74:	8c0080e7          	jalr	-1856(ra) # 80008530 <either_copyout>
    80008c78:	01450863          	beq	a0,s4,80008c88 <consoleread+0xb4>
    80008c7c:	001c0c13          	addi	s8,s8,1
    80008c80:	fffb8b9b          	addiw	s7,s7,-1
    80008c84:	fb5c94e3          	bne	s9,s5,80008c2c <consoleread+0x58>
    80008c88:	000b851b          	sext.w	a0,s7
    80008c8c:	06813083          	ld	ra,104(sp)
    80008c90:	06013403          	ld	s0,96(sp)
    80008c94:	05813483          	ld	s1,88(sp)
    80008c98:	05013903          	ld	s2,80(sp)
    80008c9c:	04813983          	ld	s3,72(sp)
    80008ca0:	04013a03          	ld	s4,64(sp)
    80008ca4:	03813a83          	ld	s5,56(sp)
    80008ca8:	02813b83          	ld	s7,40(sp)
    80008cac:	02013c03          	ld	s8,32(sp)
    80008cb0:	01813c83          	ld	s9,24(sp)
    80008cb4:	40ab053b          	subw	a0,s6,a0
    80008cb8:	03013b03          	ld	s6,48(sp)
    80008cbc:	07010113          	addi	sp,sp,112
    80008cc0:	00008067          	ret
    80008cc4:	00001097          	auipc	ra,0x1
    80008cc8:	1d8080e7          	jalr	472(ra) # 80009e9c <push_on>
    80008ccc:	0984a703          	lw	a4,152(s1)
    80008cd0:	09c4a783          	lw	a5,156(s1)
    80008cd4:	0007879b          	sext.w	a5,a5
    80008cd8:	fef70ce3          	beq	a4,a5,80008cd0 <consoleread+0xfc>
    80008cdc:	00001097          	auipc	ra,0x1
    80008ce0:	234080e7          	jalr	564(ra) # 80009f10 <pop_on>
    80008ce4:	0984a783          	lw	a5,152(s1)
    80008ce8:	07f7f713          	andi	a4,a5,127
    80008cec:	00e48733          	add	a4,s1,a4
    80008cf0:	01874703          	lbu	a4,24(a4)
    80008cf4:	0017869b          	addiw	a3,a5,1
    80008cf8:	08d4ac23          	sw	a3,152(s1)
    80008cfc:	00070c9b          	sext.w	s9,a4
    80008d00:	f5371ee3          	bne	a4,s3,80008c5c <consoleread+0x88>
    80008d04:	000b851b          	sext.w	a0,s7
    80008d08:	f96bf2e3          	bgeu	s7,s6,80008c8c <consoleread+0xb8>
    80008d0c:	08f4ac23          	sw	a5,152(s1)
    80008d10:	f7dff06f          	j	80008c8c <consoleread+0xb8>

0000000080008d14 <consputc>:
    80008d14:	10000793          	li	a5,256
    80008d18:	00f50663          	beq	a0,a5,80008d24 <consputc+0x10>
    80008d1c:	00001317          	auipc	t1,0x1
    80008d20:	9f430067          	jr	-1548(t1) # 80009710 <uartputc_sync>
    80008d24:	ff010113          	addi	sp,sp,-16
    80008d28:	00113423          	sd	ra,8(sp)
    80008d2c:	00813023          	sd	s0,0(sp)
    80008d30:	01010413          	addi	s0,sp,16
    80008d34:	00800513          	li	a0,8
    80008d38:	00001097          	auipc	ra,0x1
    80008d3c:	9d8080e7          	jalr	-1576(ra) # 80009710 <uartputc_sync>
    80008d40:	02000513          	li	a0,32
    80008d44:	00001097          	auipc	ra,0x1
    80008d48:	9cc080e7          	jalr	-1588(ra) # 80009710 <uartputc_sync>
    80008d4c:	00013403          	ld	s0,0(sp)
    80008d50:	00813083          	ld	ra,8(sp)
    80008d54:	00800513          	li	a0,8
    80008d58:	01010113          	addi	sp,sp,16
    80008d5c:	00001317          	auipc	t1,0x1
    80008d60:	9b430067          	jr	-1612(t1) # 80009710 <uartputc_sync>

0000000080008d64 <consoleintr>:
    80008d64:	fe010113          	addi	sp,sp,-32
    80008d68:	00813823          	sd	s0,16(sp)
    80008d6c:	00913423          	sd	s1,8(sp)
    80008d70:	01213023          	sd	s2,0(sp)
    80008d74:	00113c23          	sd	ra,24(sp)
    80008d78:	02010413          	addi	s0,sp,32
    80008d7c:	00006917          	auipc	s2,0x6
    80008d80:	35c90913          	addi	s2,s2,860 # 8000f0d8 <cons>
    80008d84:	00050493          	mv	s1,a0
    80008d88:	00090513          	mv	a0,s2
    80008d8c:	00001097          	auipc	ra,0x1
    80008d90:	e40080e7          	jalr	-448(ra) # 80009bcc <acquire>
    80008d94:	02048c63          	beqz	s1,80008dcc <consoleintr+0x68>
    80008d98:	0a092783          	lw	a5,160(s2)
    80008d9c:	09892703          	lw	a4,152(s2)
    80008da0:	07f00693          	li	a3,127
    80008da4:	40e7873b          	subw	a4,a5,a4
    80008da8:	02e6e263          	bltu	a3,a4,80008dcc <consoleintr+0x68>
    80008dac:	00d00713          	li	a4,13
    80008db0:	04e48063          	beq	s1,a4,80008df0 <consoleintr+0x8c>
    80008db4:	07f7f713          	andi	a4,a5,127
    80008db8:	00e90733          	add	a4,s2,a4
    80008dbc:	0017879b          	addiw	a5,a5,1
    80008dc0:	0af92023          	sw	a5,160(s2)
    80008dc4:	00970c23          	sb	s1,24(a4)
    80008dc8:	08f92e23          	sw	a5,156(s2)
    80008dcc:	01013403          	ld	s0,16(sp)
    80008dd0:	01813083          	ld	ra,24(sp)
    80008dd4:	00813483          	ld	s1,8(sp)
    80008dd8:	00013903          	ld	s2,0(sp)
    80008ddc:	00006517          	auipc	a0,0x6
    80008de0:	2fc50513          	addi	a0,a0,764 # 8000f0d8 <cons>
    80008de4:	02010113          	addi	sp,sp,32
    80008de8:	00001317          	auipc	t1,0x1
    80008dec:	eb030067          	jr	-336(t1) # 80009c98 <release>
    80008df0:	00a00493          	li	s1,10
    80008df4:	fc1ff06f          	j	80008db4 <consoleintr+0x50>

0000000080008df8 <consoleinit>:
    80008df8:	fe010113          	addi	sp,sp,-32
    80008dfc:	00113c23          	sd	ra,24(sp)
    80008e00:	00813823          	sd	s0,16(sp)
    80008e04:	00913423          	sd	s1,8(sp)
    80008e08:	02010413          	addi	s0,sp,32
    80008e0c:	00006497          	auipc	s1,0x6
    80008e10:	2cc48493          	addi	s1,s1,716 # 8000f0d8 <cons>
    80008e14:	00048513          	mv	a0,s1
    80008e18:	00003597          	auipc	a1,0x3
    80008e1c:	c3058593          	addi	a1,a1,-976 # 8000ba48 <CONSOLE_STATUS+0xa38>
    80008e20:	00001097          	auipc	ra,0x1
    80008e24:	d88080e7          	jalr	-632(ra) # 80009ba8 <initlock>
    80008e28:	00000097          	auipc	ra,0x0
    80008e2c:	7ac080e7          	jalr	1964(ra) # 800095d4 <uartinit>
    80008e30:	01813083          	ld	ra,24(sp)
    80008e34:	01013403          	ld	s0,16(sp)
    80008e38:	00000797          	auipc	a5,0x0
    80008e3c:	d9c78793          	addi	a5,a5,-612 # 80008bd4 <consoleread>
    80008e40:	0af4bc23          	sd	a5,184(s1)
    80008e44:	00000797          	auipc	a5,0x0
    80008e48:	cec78793          	addi	a5,a5,-788 # 80008b30 <consolewrite>
    80008e4c:	0cf4b023          	sd	a5,192(s1)
    80008e50:	00813483          	ld	s1,8(sp)
    80008e54:	02010113          	addi	sp,sp,32
    80008e58:	00008067          	ret

0000000080008e5c <console_read>:
    80008e5c:	ff010113          	addi	sp,sp,-16
    80008e60:	00813423          	sd	s0,8(sp)
    80008e64:	01010413          	addi	s0,sp,16
    80008e68:	00813403          	ld	s0,8(sp)
    80008e6c:	00006317          	auipc	t1,0x6
    80008e70:	32433303          	ld	t1,804(t1) # 8000f190 <devsw+0x10>
    80008e74:	01010113          	addi	sp,sp,16
    80008e78:	00030067          	jr	t1

0000000080008e7c <console_write>:
    80008e7c:	ff010113          	addi	sp,sp,-16
    80008e80:	00813423          	sd	s0,8(sp)
    80008e84:	01010413          	addi	s0,sp,16
    80008e88:	00813403          	ld	s0,8(sp)
    80008e8c:	00006317          	auipc	t1,0x6
    80008e90:	30c33303          	ld	t1,780(t1) # 8000f198 <devsw+0x18>
    80008e94:	01010113          	addi	sp,sp,16
    80008e98:	00030067          	jr	t1

0000000080008e9c <panic>:
    80008e9c:	fe010113          	addi	sp,sp,-32
    80008ea0:	00113c23          	sd	ra,24(sp)
    80008ea4:	00813823          	sd	s0,16(sp)
    80008ea8:	00913423          	sd	s1,8(sp)
    80008eac:	02010413          	addi	s0,sp,32
    80008eb0:	00050493          	mv	s1,a0
    80008eb4:	00003517          	auipc	a0,0x3
    80008eb8:	b9c50513          	addi	a0,a0,-1124 # 8000ba50 <CONSOLE_STATUS+0xa40>
    80008ebc:	00006797          	auipc	a5,0x6
    80008ec0:	3607ae23          	sw	zero,892(a5) # 8000f238 <pr+0x18>
    80008ec4:	00000097          	auipc	ra,0x0
    80008ec8:	034080e7          	jalr	52(ra) # 80008ef8 <__printf>
    80008ecc:	00048513          	mv	a0,s1
    80008ed0:	00000097          	auipc	ra,0x0
    80008ed4:	028080e7          	jalr	40(ra) # 80008ef8 <__printf>
    80008ed8:	00003517          	auipc	a0,0x3
    80008edc:	8f850513          	addi	a0,a0,-1800 # 8000b7d0 <CONSOLE_STATUS+0x7c0>
    80008ee0:	00000097          	auipc	ra,0x0
    80008ee4:	018080e7          	jalr	24(ra) # 80008ef8 <__printf>
    80008ee8:	00100793          	li	a5,1
    80008eec:	00005717          	auipc	a4,0x5
    80008ef0:	04f72e23          	sw	a5,92(a4) # 8000df48 <panicked>
    80008ef4:	0000006f          	j	80008ef4 <panic+0x58>

0000000080008ef8 <__printf>:
    80008ef8:	f3010113          	addi	sp,sp,-208
    80008efc:	08813023          	sd	s0,128(sp)
    80008f00:	07313423          	sd	s3,104(sp)
    80008f04:	09010413          	addi	s0,sp,144
    80008f08:	05813023          	sd	s8,64(sp)
    80008f0c:	08113423          	sd	ra,136(sp)
    80008f10:	06913c23          	sd	s1,120(sp)
    80008f14:	07213823          	sd	s2,112(sp)
    80008f18:	07413023          	sd	s4,96(sp)
    80008f1c:	05513c23          	sd	s5,88(sp)
    80008f20:	05613823          	sd	s6,80(sp)
    80008f24:	05713423          	sd	s7,72(sp)
    80008f28:	03913c23          	sd	s9,56(sp)
    80008f2c:	03a13823          	sd	s10,48(sp)
    80008f30:	03b13423          	sd	s11,40(sp)
    80008f34:	00006317          	auipc	t1,0x6
    80008f38:	2ec30313          	addi	t1,t1,748 # 8000f220 <pr>
    80008f3c:	01832c03          	lw	s8,24(t1)
    80008f40:	00b43423          	sd	a1,8(s0)
    80008f44:	00c43823          	sd	a2,16(s0)
    80008f48:	00d43c23          	sd	a3,24(s0)
    80008f4c:	02e43023          	sd	a4,32(s0)
    80008f50:	02f43423          	sd	a5,40(s0)
    80008f54:	03043823          	sd	a6,48(s0)
    80008f58:	03143c23          	sd	a7,56(s0)
    80008f5c:	00050993          	mv	s3,a0
    80008f60:	4a0c1663          	bnez	s8,8000940c <__printf+0x514>
    80008f64:	60098c63          	beqz	s3,8000957c <__printf+0x684>
    80008f68:	0009c503          	lbu	a0,0(s3)
    80008f6c:	00840793          	addi	a5,s0,8
    80008f70:	f6f43c23          	sd	a5,-136(s0)
    80008f74:	00000493          	li	s1,0
    80008f78:	22050063          	beqz	a0,80009198 <__printf+0x2a0>
    80008f7c:	00002a37          	lui	s4,0x2
    80008f80:	00018ab7          	lui	s5,0x18
    80008f84:	000f4b37          	lui	s6,0xf4
    80008f88:	00989bb7          	lui	s7,0x989
    80008f8c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80008f90:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80008f94:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80008f98:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80008f9c:	00148c9b          	addiw	s9,s1,1
    80008fa0:	02500793          	li	a5,37
    80008fa4:	01998933          	add	s2,s3,s9
    80008fa8:	38f51263          	bne	a0,a5,8000932c <__printf+0x434>
    80008fac:	00094783          	lbu	a5,0(s2)
    80008fb0:	00078c9b          	sext.w	s9,a5
    80008fb4:	1e078263          	beqz	a5,80009198 <__printf+0x2a0>
    80008fb8:	0024849b          	addiw	s1,s1,2
    80008fbc:	07000713          	li	a4,112
    80008fc0:	00998933          	add	s2,s3,s1
    80008fc4:	38e78a63          	beq	a5,a4,80009358 <__printf+0x460>
    80008fc8:	20f76863          	bltu	a4,a5,800091d8 <__printf+0x2e0>
    80008fcc:	42a78863          	beq	a5,a0,800093fc <__printf+0x504>
    80008fd0:	06400713          	li	a4,100
    80008fd4:	40e79663          	bne	a5,a4,800093e0 <__printf+0x4e8>
    80008fd8:	f7843783          	ld	a5,-136(s0)
    80008fdc:	0007a603          	lw	a2,0(a5)
    80008fe0:	00878793          	addi	a5,a5,8
    80008fe4:	f6f43c23          	sd	a5,-136(s0)
    80008fe8:	42064a63          	bltz	a2,8000941c <__printf+0x524>
    80008fec:	00a00713          	li	a4,10
    80008ff0:	02e677bb          	remuw	a5,a2,a4
    80008ff4:	00003d97          	auipc	s11,0x3
    80008ff8:	a84d8d93          	addi	s11,s11,-1404 # 8000ba78 <digits>
    80008ffc:	00900593          	li	a1,9
    80009000:	0006051b          	sext.w	a0,a2
    80009004:	00000c93          	li	s9,0
    80009008:	02079793          	slli	a5,a5,0x20
    8000900c:	0207d793          	srli	a5,a5,0x20
    80009010:	00fd87b3          	add	a5,s11,a5
    80009014:	0007c783          	lbu	a5,0(a5)
    80009018:	02e656bb          	divuw	a3,a2,a4
    8000901c:	f8f40023          	sb	a5,-128(s0)
    80009020:	14c5d863          	bge	a1,a2,80009170 <__printf+0x278>
    80009024:	06300593          	li	a1,99
    80009028:	00100c93          	li	s9,1
    8000902c:	02e6f7bb          	remuw	a5,a3,a4
    80009030:	02079793          	slli	a5,a5,0x20
    80009034:	0207d793          	srli	a5,a5,0x20
    80009038:	00fd87b3          	add	a5,s11,a5
    8000903c:	0007c783          	lbu	a5,0(a5)
    80009040:	02e6d73b          	divuw	a4,a3,a4
    80009044:	f8f400a3          	sb	a5,-127(s0)
    80009048:	12a5f463          	bgeu	a1,a0,80009170 <__printf+0x278>
    8000904c:	00a00693          	li	a3,10
    80009050:	00900593          	li	a1,9
    80009054:	02d777bb          	remuw	a5,a4,a3
    80009058:	02079793          	slli	a5,a5,0x20
    8000905c:	0207d793          	srli	a5,a5,0x20
    80009060:	00fd87b3          	add	a5,s11,a5
    80009064:	0007c503          	lbu	a0,0(a5)
    80009068:	02d757bb          	divuw	a5,a4,a3
    8000906c:	f8a40123          	sb	a0,-126(s0)
    80009070:	48e5f263          	bgeu	a1,a4,800094f4 <__printf+0x5fc>
    80009074:	06300513          	li	a0,99
    80009078:	02d7f5bb          	remuw	a1,a5,a3
    8000907c:	02059593          	slli	a1,a1,0x20
    80009080:	0205d593          	srli	a1,a1,0x20
    80009084:	00bd85b3          	add	a1,s11,a1
    80009088:	0005c583          	lbu	a1,0(a1)
    8000908c:	02d7d7bb          	divuw	a5,a5,a3
    80009090:	f8b401a3          	sb	a1,-125(s0)
    80009094:	48e57263          	bgeu	a0,a4,80009518 <__printf+0x620>
    80009098:	3e700513          	li	a0,999
    8000909c:	02d7f5bb          	remuw	a1,a5,a3
    800090a0:	02059593          	slli	a1,a1,0x20
    800090a4:	0205d593          	srli	a1,a1,0x20
    800090a8:	00bd85b3          	add	a1,s11,a1
    800090ac:	0005c583          	lbu	a1,0(a1)
    800090b0:	02d7d7bb          	divuw	a5,a5,a3
    800090b4:	f8b40223          	sb	a1,-124(s0)
    800090b8:	46e57663          	bgeu	a0,a4,80009524 <__printf+0x62c>
    800090bc:	02d7f5bb          	remuw	a1,a5,a3
    800090c0:	02059593          	slli	a1,a1,0x20
    800090c4:	0205d593          	srli	a1,a1,0x20
    800090c8:	00bd85b3          	add	a1,s11,a1
    800090cc:	0005c583          	lbu	a1,0(a1)
    800090d0:	02d7d7bb          	divuw	a5,a5,a3
    800090d4:	f8b402a3          	sb	a1,-123(s0)
    800090d8:	46ea7863          	bgeu	s4,a4,80009548 <__printf+0x650>
    800090dc:	02d7f5bb          	remuw	a1,a5,a3
    800090e0:	02059593          	slli	a1,a1,0x20
    800090e4:	0205d593          	srli	a1,a1,0x20
    800090e8:	00bd85b3          	add	a1,s11,a1
    800090ec:	0005c583          	lbu	a1,0(a1)
    800090f0:	02d7d7bb          	divuw	a5,a5,a3
    800090f4:	f8b40323          	sb	a1,-122(s0)
    800090f8:	3eeaf863          	bgeu	s5,a4,800094e8 <__printf+0x5f0>
    800090fc:	02d7f5bb          	remuw	a1,a5,a3
    80009100:	02059593          	slli	a1,a1,0x20
    80009104:	0205d593          	srli	a1,a1,0x20
    80009108:	00bd85b3          	add	a1,s11,a1
    8000910c:	0005c583          	lbu	a1,0(a1)
    80009110:	02d7d7bb          	divuw	a5,a5,a3
    80009114:	f8b403a3          	sb	a1,-121(s0)
    80009118:	42eb7e63          	bgeu	s6,a4,80009554 <__printf+0x65c>
    8000911c:	02d7f5bb          	remuw	a1,a5,a3
    80009120:	02059593          	slli	a1,a1,0x20
    80009124:	0205d593          	srli	a1,a1,0x20
    80009128:	00bd85b3          	add	a1,s11,a1
    8000912c:	0005c583          	lbu	a1,0(a1)
    80009130:	02d7d7bb          	divuw	a5,a5,a3
    80009134:	f8b40423          	sb	a1,-120(s0)
    80009138:	42ebfc63          	bgeu	s7,a4,80009570 <__printf+0x678>
    8000913c:	02079793          	slli	a5,a5,0x20
    80009140:	0207d793          	srli	a5,a5,0x20
    80009144:	00fd8db3          	add	s11,s11,a5
    80009148:	000dc703          	lbu	a4,0(s11)
    8000914c:	00a00793          	li	a5,10
    80009150:	00900c93          	li	s9,9
    80009154:	f8e404a3          	sb	a4,-119(s0)
    80009158:	00065c63          	bgez	a2,80009170 <__printf+0x278>
    8000915c:	f9040713          	addi	a4,s0,-112
    80009160:	00f70733          	add	a4,a4,a5
    80009164:	02d00693          	li	a3,45
    80009168:	fed70823          	sb	a3,-16(a4)
    8000916c:	00078c93          	mv	s9,a5
    80009170:	f8040793          	addi	a5,s0,-128
    80009174:	01978cb3          	add	s9,a5,s9
    80009178:	f7f40d13          	addi	s10,s0,-129
    8000917c:	000cc503          	lbu	a0,0(s9)
    80009180:	fffc8c93          	addi	s9,s9,-1
    80009184:	00000097          	auipc	ra,0x0
    80009188:	b90080e7          	jalr	-1136(ra) # 80008d14 <consputc>
    8000918c:	ffac98e3          	bne	s9,s10,8000917c <__printf+0x284>
    80009190:	00094503          	lbu	a0,0(s2)
    80009194:	e00514e3          	bnez	a0,80008f9c <__printf+0xa4>
    80009198:	1a0c1663          	bnez	s8,80009344 <__printf+0x44c>
    8000919c:	08813083          	ld	ra,136(sp)
    800091a0:	08013403          	ld	s0,128(sp)
    800091a4:	07813483          	ld	s1,120(sp)
    800091a8:	07013903          	ld	s2,112(sp)
    800091ac:	06813983          	ld	s3,104(sp)
    800091b0:	06013a03          	ld	s4,96(sp)
    800091b4:	05813a83          	ld	s5,88(sp)
    800091b8:	05013b03          	ld	s6,80(sp)
    800091bc:	04813b83          	ld	s7,72(sp)
    800091c0:	04013c03          	ld	s8,64(sp)
    800091c4:	03813c83          	ld	s9,56(sp)
    800091c8:	03013d03          	ld	s10,48(sp)
    800091cc:	02813d83          	ld	s11,40(sp)
    800091d0:	0d010113          	addi	sp,sp,208
    800091d4:	00008067          	ret
    800091d8:	07300713          	li	a4,115
    800091dc:	1ce78a63          	beq	a5,a4,800093b0 <__printf+0x4b8>
    800091e0:	07800713          	li	a4,120
    800091e4:	1ee79e63          	bne	a5,a4,800093e0 <__printf+0x4e8>
    800091e8:	f7843783          	ld	a5,-136(s0)
    800091ec:	0007a703          	lw	a4,0(a5)
    800091f0:	00878793          	addi	a5,a5,8
    800091f4:	f6f43c23          	sd	a5,-136(s0)
    800091f8:	28074263          	bltz	a4,8000947c <__printf+0x584>
    800091fc:	00003d97          	auipc	s11,0x3
    80009200:	87cd8d93          	addi	s11,s11,-1924 # 8000ba78 <digits>
    80009204:	00f77793          	andi	a5,a4,15
    80009208:	00fd87b3          	add	a5,s11,a5
    8000920c:	0007c683          	lbu	a3,0(a5)
    80009210:	00f00613          	li	a2,15
    80009214:	0007079b          	sext.w	a5,a4
    80009218:	f8d40023          	sb	a3,-128(s0)
    8000921c:	0047559b          	srliw	a1,a4,0x4
    80009220:	0047569b          	srliw	a3,a4,0x4
    80009224:	00000c93          	li	s9,0
    80009228:	0ee65063          	bge	a2,a4,80009308 <__printf+0x410>
    8000922c:	00f6f693          	andi	a3,a3,15
    80009230:	00dd86b3          	add	a3,s11,a3
    80009234:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80009238:	0087d79b          	srliw	a5,a5,0x8
    8000923c:	00100c93          	li	s9,1
    80009240:	f8d400a3          	sb	a3,-127(s0)
    80009244:	0cb67263          	bgeu	a2,a1,80009308 <__printf+0x410>
    80009248:	00f7f693          	andi	a3,a5,15
    8000924c:	00dd86b3          	add	a3,s11,a3
    80009250:	0006c583          	lbu	a1,0(a3)
    80009254:	00f00613          	li	a2,15
    80009258:	0047d69b          	srliw	a3,a5,0x4
    8000925c:	f8b40123          	sb	a1,-126(s0)
    80009260:	0047d593          	srli	a1,a5,0x4
    80009264:	28f67e63          	bgeu	a2,a5,80009500 <__printf+0x608>
    80009268:	00f6f693          	andi	a3,a3,15
    8000926c:	00dd86b3          	add	a3,s11,a3
    80009270:	0006c503          	lbu	a0,0(a3)
    80009274:	0087d813          	srli	a6,a5,0x8
    80009278:	0087d69b          	srliw	a3,a5,0x8
    8000927c:	f8a401a3          	sb	a0,-125(s0)
    80009280:	28b67663          	bgeu	a2,a1,8000950c <__printf+0x614>
    80009284:	00f6f693          	andi	a3,a3,15
    80009288:	00dd86b3          	add	a3,s11,a3
    8000928c:	0006c583          	lbu	a1,0(a3)
    80009290:	00c7d513          	srli	a0,a5,0xc
    80009294:	00c7d69b          	srliw	a3,a5,0xc
    80009298:	f8b40223          	sb	a1,-124(s0)
    8000929c:	29067a63          	bgeu	a2,a6,80009530 <__printf+0x638>
    800092a0:	00f6f693          	andi	a3,a3,15
    800092a4:	00dd86b3          	add	a3,s11,a3
    800092a8:	0006c583          	lbu	a1,0(a3)
    800092ac:	0107d813          	srli	a6,a5,0x10
    800092b0:	0107d69b          	srliw	a3,a5,0x10
    800092b4:	f8b402a3          	sb	a1,-123(s0)
    800092b8:	28a67263          	bgeu	a2,a0,8000953c <__printf+0x644>
    800092bc:	00f6f693          	andi	a3,a3,15
    800092c0:	00dd86b3          	add	a3,s11,a3
    800092c4:	0006c683          	lbu	a3,0(a3)
    800092c8:	0147d79b          	srliw	a5,a5,0x14
    800092cc:	f8d40323          	sb	a3,-122(s0)
    800092d0:	21067663          	bgeu	a2,a6,800094dc <__printf+0x5e4>
    800092d4:	02079793          	slli	a5,a5,0x20
    800092d8:	0207d793          	srli	a5,a5,0x20
    800092dc:	00fd8db3          	add	s11,s11,a5
    800092e0:	000dc683          	lbu	a3,0(s11)
    800092e4:	00800793          	li	a5,8
    800092e8:	00700c93          	li	s9,7
    800092ec:	f8d403a3          	sb	a3,-121(s0)
    800092f0:	00075c63          	bgez	a4,80009308 <__printf+0x410>
    800092f4:	f9040713          	addi	a4,s0,-112
    800092f8:	00f70733          	add	a4,a4,a5
    800092fc:	02d00693          	li	a3,45
    80009300:	fed70823          	sb	a3,-16(a4)
    80009304:	00078c93          	mv	s9,a5
    80009308:	f8040793          	addi	a5,s0,-128
    8000930c:	01978cb3          	add	s9,a5,s9
    80009310:	f7f40d13          	addi	s10,s0,-129
    80009314:	000cc503          	lbu	a0,0(s9)
    80009318:	fffc8c93          	addi	s9,s9,-1
    8000931c:	00000097          	auipc	ra,0x0
    80009320:	9f8080e7          	jalr	-1544(ra) # 80008d14 <consputc>
    80009324:	ff9d18e3          	bne	s10,s9,80009314 <__printf+0x41c>
    80009328:	0100006f          	j	80009338 <__printf+0x440>
    8000932c:	00000097          	auipc	ra,0x0
    80009330:	9e8080e7          	jalr	-1560(ra) # 80008d14 <consputc>
    80009334:	000c8493          	mv	s1,s9
    80009338:	00094503          	lbu	a0,0(s2)
    8000933c:	c60510e3          	bnez	a0,80008f9c <__printf+0xa4>
    80009340:	e40c0ee3          	beqz	s8,8000919c <__printf+0x2a4>
    80009344:	00006517          	auipc	a0,0x6
    80009348:	edc50513          	addi	a0,a0,-292 # 8000f220 <pr>
    8000934c:	00001097          	auipc	ra,0x1
    80009350:	94c080e7          	jalr	-1716(ra) # 80009c98 <release>
    80009354:	e49ff06f          	j	8000919c <__printf+0x2a4>
    80009358:	f7843783          	ld	a5,-136(s0)
    8000935c:	03000513          	li	a0,48
    80009360:	01000d13          	li	s10,16
    80009364:	00878713          	addi	a4,a5,8
    80009368:	0007bc83          	ld	s9,0(a5)
    8000936c:	f6e43c23          	sd	a4,-136(s0)
    80009370:	00000097          	auipc	ra,0x0
    80009374:	9a4080e7          	jalr	-1628(ra) # 80008d14 <consputc>
    80009378:	07800513          	li	a0,120
    8000937c:	00000097          	auipc	ra,0x0
    80009380:	998080e7          	jalr	-1640(ra) # 80008d14 <consputc>
    80009384:	00002d97          	auipc	s11,0x2
    80009388:	6f4d8d93          	addi	s11,s11,1780 # 8000ba78 <digits>
    8000938c:	03ccd793          	srli	a5,s9,0x3c
    80009390:	00fd87b3          	add	a5,s11,a5
    80009394:	0007c503          	lbu	a0,0(a5)
    80009398:	fffd0d1b          	addiw	s10,s10,-1
    8000939c:	004c9c93          	slli	s9,s9,0x4
    800093a0:	00000097          	auipc	ra,0x0
    800093a4:	974080e7          	jalr	-1676(ra) # 80008d14 <consputc>
    800093a8:	fe0d12e3          	bnez	s10,8000938c <__printf+0x494>
    800093ac:	f8dff06f          	j	80009338 <__printf+0x440>
    800093b0:	f7843783          	ld	a5,-136(s0)
    800093b4:	0007bc83          	ld	s9,0(a5)
    800093b8:	00878793          	addi	a5,a5,8
    800093bc:	f6f43c23          	sd	a5,-136(s0)
    800093c0:	000c9a63          	bnez	s9,800093d4 <__printf+0x4dc>
    800093c4:	1080006f          	j	800094cc <__printf+0x5d4>
    800093c8:	001c8c93          	addi	s9,s9,1
    800093cc:	00000097          	auipc	ra,0x0
    800093d0:	948080e7          	jalr	-1720(ra) # 80008d14 <consputc>
    800093d4:	000cc503          	lbu	a0,0(s9)
    800093d8:	fe0518e3          	bnez	a0,800093c8 <__printf+0x4d0>
    800093dc:	f5dff06f          	j	80009338 <__printf+0x440>
    800093e0:	02500513          	li	a0,37
    800093e4:	00000097          	auipc	ra,0x0
    800093e8:	930080e7          	jalr	-1744(ra) # 80008d14 <consputc>
    800093ec:	000c8513          	mv	a0,s9
    800093f0:	00000097          	auipc	ra,0x0
    800093f4:	924080e7          	jalr	-1756(ra) # 80008d14 <consputc>
    800093f8:	f41ff06f          	j	80009338 <__printf+0x440>
    800093fc:	02500513          	li	a0,37
    80009400:	00000097          	auipc	ra,0x0
    80009404:	914080e7          	jalr	-1772(ra) # 80008d14 <consputc>
    80009408:	f31ff06f          	j	80009338 <__printf+0x440>
    8000940c:	00030513          	mv	a0,t1
    80009410:	00000097          	auipc	ra,0x0
    80009414:	7bc080e7          	jalr	1980(ra) # 80009bcc <acquire>
    80009418:	b4dff06f          	j	80008f64 <__printf+0x6c>
    8000941c:	40c0053b          	negw	a0,a2
    80009420:	00a00713          	li	a4,10
    80009424:	02e576bb          	remuw	a3,a0,a4
    80009428:	00002d97          	auipc	s11,0x2
    8000942c:	650d8d93          	addi	s11,s11,1616 # 8000ba78 <digits>
    80009430:	ff700593          	li	a1,-9
    80009434:	02069693          	slli	a3,a3,0x20
    80009438:	0206d693          	srli	a3,a3,0x20
    8000943c:	00dd86b3          	add	a3,s11,a3
    80009440:	0006c683          	lbu	a3,0(a3)
    80009444:	02e557bb          	divuw	a5,a0,a4
    80009448:	f8d40023          	sb	a3,-128(s0)
    8000944c:	10b65e63          	bge	a2,a1,80009568 <__printf+0x670>
    80009450:	06300593          	li	a1,99
    80009454:	02e7f6bb          	remuw	a3,a5,a4
    80009458:	02069693          	slli	a3,a3,0x20
    8000945c:	0206d693          	srli	a3,a3,0x20
    80009460:	00dd86b3          	add	a3,s11,a3
    80009464:	0006c683          	lbu	a3,0(a3)
    80009468:	02e7d73b          	divuw	a4,a5,a4
    8000946c:	00200793          	li	a5,2
    80009470:	f8d400a3          	sb	a3,-127(s0)
    80009474:	bca5ece3          	bltu	a1,a0,8000904c <__printf+0x154>
    80009478:	ce5ff06f          	j	8000915c <__printf+0x264>
    8000947c:	40e007bb          	negw	a5,a4
    80009480:	00002d97          	auipc	s11,0x2
    80009484:	5f8d8d93          	addi	s11,s11,1528 # 8000ba78 <digits>
    80009488:	00f7f693          	andi	a3,a5,15
    8000948c:	00dd86b3          	add	a3,s11,a3
    80009490:	0006c583          	lbu	a1,0(a3)
    80009494:	ff100613          	li	a2,-15
    80009498:	0047d69b          	srliw	a3,a5,0x4
    8000949c:	f8b40023          	sb	a1,-128(s0)
    800094a0:	0047d59b          	srliw	a1,a5,0x4
    800094a4:	0ac75e63          	bge	a4,a2,80009560 <__printf+0x668>
    800094a8:	00f6f693          	andi	a3,a3,15
    800094ac:	00dd86b3          	add	a3,s11,a3
    800094b0:	0006c603          	lbu	a2,0(a3)
    800094b4:	00f00693          	li	a3,15
    800094b8:	0087d79b          	srliw	a5,a5,0x8
    800094bc:	f8c400a3          	sb	a2,-127(s0)
    800094c0:	d8b6e4e3          	bltu	a3,a1,80009248 <__printf+0x350>
    800094c4:	00200793          	li	a5,2
    800094c8:	e2dff06f          	j	800092f4 <__printf+0x3fc>
    800094cc:	00002c97          	auipc	s9,0x2
    800094d0:	58cc8c93          	addi	s9,s9,1420 # 8000ba58 <CONSOLE_STATUS+0xa48>
    800094d4:	02800513          	li	a0,40
    800094d8:	ef1ff06f          	j	800093c8 <__printf+0x4d0>
    800094dc:	00700793          	li	a5,7
    800094e0:	00600c93          	li	s9,6
    800094e4:	e0dff06f          	j	800092f0 <__printf+0x3f8>
    800094e8:	00700793          	li	a5,7
    800094ec:	00600c93          	li	s9,6
    800094f0:	c69ff06f          	j	80009158 <__printf+0x260>
    800094f4:	00300793          	li	a5,3
    800094f8:	00200c93          	li	s9,2
    800094fc:	c5dff06f          	j	80009158 <__printf+0x260>
    80009500:	00300793          	li	a5,3
    80009504:	00200c93          	li	s9,2
    80009508:	de9ff06f          	j	800092f0 <__printf+0x3f8>
    8000950c:	00400793          	li	a5,4
    80009510:	00300c93          	li	s9,3
    80009514:	dddff06f          	j	800092f0 <__printf+0x3f8>
    80009518:	00400793          	li	a5,4
    8000951c:	00300c93          	li	s9,3
    80009520:	c39ff06f          	j	80009158 <__printf+0x260>
    80009524:	00500793          	li	a5,5
    80009528:	00400c93          	li	s9,4
    8000952c:	c2dff06f          	j	80009158 <__printf+0x260>
    80009530:	00500793          	li	a5,5
    80009534:	00400c93          	li	s9,4
    80009538:	db9ff06f          	j	800092f0 <__printf+0x3f8>
    8000953c:	00600793          	li	a5,6
    80009540:	00500c93          	li	s9,5
    80009544:	dadff06f          	j	800092f0 <__printf+0x3f8>
    80009548:	00600793          	li	a5,6
    8000954c:	00500c93          	li	s9,5
    80009550:	c09ff06f          	j	80009158 <__printf+0x260>
    80009554:	00800793          	li	a5,8
    80009558:	00700c93          	li	s9,7
    8000955c:	bfdff06f          	j	80009158 <__printf+0x260>
    80009560:	00100793          	li	a5,1
    80009564:	d91ff06f          	j	800092f4 <__printf+0x3fc>
    80009568:	00100793          	li	a5,1
    8000956c:	bf1ff06f          	j	8000915c <__printf+0x264>
    80009570:	00900793          	li	a5,9
    80009574:	00800c93          	li	s9,8
    80009578:	be1ff06f          	j	80009158 <__printf+0x260>
    8000957c:	00002517          	auipc	a0,0x2
    80009580:	4e450513          	addi	a0,a0,1252 # 8000ba60 <CONSOLE_STATUS+0xa50>
    80009584:	00000097          	auipc	ra,0x0
    80009588:	918080e7          	jalr	-1768(ra) # 80008e9c <panic>

000000008000958c <printfinit>:
    8000958c:	fe010113          	addi	sp,sp,-32
    80009590:	00813823          	sd	s0,16(sp)
    80009594:	00913423          	sd	s1,8(sp)
    80009598:	00113c23          	sd	ra,24(sp)
    8000959c:	02010413          	addi	s0,sp,32
    800095a0:	00006497          	auipc	s1,0x6
    800095a4:	c8048493          	addi	s1,s1,-896 # 8000f220 <pr>
    800095a8:	00048513          	mv	a0,s1
    800095ac:	00002597          	auipc	a1,0x2
    800095b0:	4c458593          	addi	a1,a1,1220 # 8000ba70 <CONSOLE_STATUS+0xa60>
    800095b4:	00000097          	auipc	ra,0x0
    800095b8:	5f4080e7          	jalr	1524(ra) # 80009ba8 <initlock>
    800095bc:	01813083          	ld	ra,24(sp)
    800095c0:	01013403          	ld	s0,16(sp)
    800095c4:	0004ac23          	sw	zero,24(s1)
    800095c8:	00813483          	ld	s1,8(sp)
    800095cc:	02010113          	addi	sp,sp,32
    800095d0:	00008067          	ret

00000000800095d4 <uartinit>:
    800095d4:	ff010113          	addi	sp,sp,-16
    800095d8:	00813423          	sd	s0,8(sp)
    800095dc:	01010413          	addi	s0,sp,16
    800095e0:	100007b7          	lui	a5,0x10000
    800095e4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800095e8:	f8000713          	li	a4,-128
    800095ec:	00e781a3          	sb	a4,3(a5)
    800095f0:	00300713          	li	a4,3
    800095f4:	00e78023          	sb	a4,0(a5)
    800095f8:	000780a3          	sb	zero,1(a5)
    800095fc:	00e781a3          	sb	a4,3(a5)
    80009600:	00700693          	li	a3,7
    80009604:	00d78123          	sb	a3,2(a5)
    80009608:	00e780a3          	sb	a4,1(a5)
    8000960c:	00813403          	ld	s0,8(sp)
    80009610:	01010113          	addi	sp,sp,16
    80009614:	00008067          	ret

0000000080009618 <uartputc>:
    80009618:	00005797          	auipc	a5,0x5
    8000961c:	9307a783          	lw	a5,-1744(a5) # 8000df48 <panicked>
    80009620:	00078463          	beqz	a5,80009628 <uartputc+0x10>
    80009624:	0000006f          	j	80009624 <uartputc+0xc>
    80009628:	fd010113          	addi	sp,sp,-48
    8000962c:	02813023          	sd	s0,32(sp)
    80009630:	00913c23          	sd	s1,24(sp)
    80009634:	01213823          	sd	s2,16(sp)
    80009638:	01313423          	sd	s3,8(sp)
    8000963c:	02113423          	sd	ra,40(sp)
    80009640:	03010413          	addi	s0,sp,48
    80009644:	00005917          	auipc	s2,0x5
    80009648:	90c90913          	addi	s2,s2,-1780 # 8000df50 <uart_tx_r>
    8000964c:	00093783          	ld	a5,0(s2)
    80009650:	00005497          	auipc	s1,0x5
    80009654:	90848493          	addi	s1,s1,-1784 # 8000df58 <uart_tx_w>
    80009658:	0004b703          	ld	a4,0(s1)
    8000965c:	02078693          	addi	a3,a5,32
    80009660:	00050993          	mv	s3,a0
    80009664:	02e69c63          	bne	a3,a4,8000969c <uartputc+0x84>
    80009668:	00001097          	auipc	ra,0x1
    8000966c:	834080e7          	jalr	-1996(ra) # 80009e9c <push_on>
    80009670:	00093783          	ld	a5,0(s2)
    80009674:	0004b703          	ld	a4,0(s1)
    80009678:	02078793          	addi	a5,a5,32
    8000967c:	00e79463          	bne	a5,a4,80009684 <uartputc+0x6c>
    80009680:	0000006f          	j	80009680 <uartputc+0x68>
    80009684:	00001097          	auipc	ra,0x1
    80009688:	88c080e7          	jalr	-1908(ra) # 80009f10 <pop_on>
    8000968c:	00093783          	ld	a5,0(s2)
    80009690:	0004b703          	ld	a4,0(s1)
    80009694:	02078693          	addi	a3,a5,32
    80009698:	fce688e3          	beq	a3,a4,80009668 <uartputc+0x50>
    8000969c:	01f77693          	andi	a3,a4,31
    800096a0:	00006597          	auipc	a1,0x6
    800096a4:	ba058593          	addi	a1,a1,-1120 # 8000f240 <uart_tx_buf>
    800096a8:	00d586b3          	add	a3,a1,a3
    800096ac:	00170713          	addi	a4,a4,1
    800096b0:	01368023          	sb	s3,0(a3)
    800096b4:	00e4b023          	sd	a4,0(s1)
    800096b8:	10000637          	lui	a2,0x10000
    800096bc:	02f71063          	bne	a4,a5,800096dc <uartputc+0xc4>
    800096c0:	0340006f          	j	800096f4 <uartputc+0xdc>
    800096c4:	00074703          	lbu	a4,0(a4)
    800096c8:	00f93023          	sd	a5,0(s2)
    800096cc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800096d0:	00093783          	ld	a5,0(s2)
    800096d4:	0004b703          	ld	a4,0(s1)
    800096d8:	00f70e63          	beq	a4,a5,800096f4 <uartputc+0xdc>
    800096dc:	00564683          	lbu	a3,5(a2)
    800096e0:	01f7f713          	andi	a4,a5,31
    800096e4:	00e58733          	add	a4,a1,a4
    800096e8:	0206f693          	andi	a3,a3,32
    800096ec:	00178793          	addi	a5,a5,1
    800096f0:	fc069ae3          	bnez	a3,800096c4 <uartputc+0xac>
    800096f4:	02813083          	ld	ra,40(sp)
    800096f8:	02013403          	ld	s0,32(sp)
    800096fc:	01813483          	ld	s1,24(sp)
    80009700:	01013903          	ld	s2,16(sp)
    80009704:	00813983          	ld	s3,8(sp)
    80009708:	03010113          	addi	sp,sp,48
    8000970c:	00008067          	ret

0000000080009710 <uartputc_sync>:
    80009710:	ff010113          	addi	sp,sp,-16
    80009714:	00813423          	sd	s0,8(sp)
    80009718:	01010413          	addi	s0,sp,16
    8000971c:	00005717          	auipc	a4,0x5
    80009720:	82c72703          	lw	a4,-2004(a4) # 8000df48 <panicked>
    80009724:	02071663          	bnez	a4,80009750 <uartputc_sync+0x40>
    80009728:	00050793          	mv	a5,a0
    8000972c:	100006b7          	lui	a3,0x10000
    80009730:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80009734:	02077713          	andi	a4,a4,32
    80009738:	fe070ce3          	beqz	a4,80009730 <uartputc_sync+0x20>
    8000973c:	0ff7f793          	andi	a5,a5,255
    80009740:	00f68023          	sb	a5,0(a3)
    80009744:	00813403          	ld	s0,8(sp)
    80009748:	01010113          	addi	sp,sp,16
    8000974c:	00008067          	ret
    80009750:	0000006f          	j	80009750 <uartputc_sync+0x40>

0000000080009754 <uartstart>:
    80009754:	ff010113          	addi	sp,sp,-16
    80009758:	00813423          	sd	s0,8(sp)
    8000975c:	01010413          	addi	s0,sp,16
    80009760:	00004617          	auipc	a2,0x4
    80009764:	7f060613          	addi	a2,a2,2032 # 8000df50 <uart_tx_r>
    80009768:	00004517          	auipc	a0,0x4
    8000976c:	7f050513          	addi	a0,a0,2032 # 8000df58 <uart_tx_w>
    80009770:	00063783          	ld	a5,0(a2)
    80009774:	00053703          	ld	a4,0(a0)
    80009778:	04f70263          	beq	a4,a5,800097bc <uartstart+0x68>
    8000977c:	100005b7          	lui	a1,0x10000
    80009780:	00006817          	auipc	a6,0x6
    80009784:	ac080813          	addi	a6,a6,-1344 # 8000f240 <uart_tx_buf>
    80009788:	01c0006f          	j	800097a4 <uartstart+0x50>
    8000978c:	0006c703          	lbu	a4,0(a3)
    80009790:	00f63023          	sd	a5,0(a2)
    80009794:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009798:	00063783          	ld	a5,0(a2)
    8000979c:	00053703          	ld	a4,0(a0)
    800097a0:	00f70e63          	beq	a4,a5,800097bc <uartstart+0x68>
    800097a4:	01f7f713          	andi	a4,a5,31
    800097a8:	00e806b3          	add	a3,a6,a4
    800097ac:	0055c703          	lbu	a4,5(a1)
    800097b0:	00178793          	addi	a5,a5,1
    800097b4:	02077713          	andi	a4,a4,32
    800097b8:	fc071ae3          	bnez	a4,8000978c <uartstart+0x38>
    800097bc:	00813403          	ld	s0,8(sp)
    800097c0:	01010113          	addi	sp,sp,16
    800097c4:	00008067          	ret

00000000800097c8 <uartgetc>:
    800097c8:	ff010113          	addi	sp,sp,-16
    800097cc:	00813423          	sd	s0,8(sp)
    800097d0:	01010413          	addi	s0,sp,16
    800097d4:	10000737          	lui	a4,0x10000
    800097d8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800097dc:	0017f793          	andi	a5,a5,1
    800097e0:	00078c63          	beqz	a5,800097f8 <uartgetc+0x30>
    800097e4:	00074503          	lbu	a0,0(a4)
    800097e8:	0ff57513          	andi	a0,a0,255
    800097ec:	00813403          	ld	s0,8(sp)
    800097f0:	01010113          	addi	sp,sp,16
    800097f4:	00008067          	ret
    800097f8:	fff00513          	li	a0,-1
    800097fc:	ff1ff06f          	j	800097ec <uartgetc+0x24>

0000000080009800 <uartintr>:
    80009800:	100007b7          	lui	a5,0x10000
    80009804:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80009808:	0017f793          	andi	a5,a5,1
    8000980c:	0a078463          	beqz	a5,800098b4 <uartintr+0xb4>
    80009810:	fe010113          	addi	sp,sp,-32
    80009814:	00813823          	sd	s0,16(sp)
    80009818:	00913423          	sd	s1,8(sp)
    8000981c:	00113c23          	sd	ra,24(sp)
    80009820:	02010413          	addi	s0,sp,32
    80009824:	100004b7          	lui	s1,0x10000
    80009828:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000982c:	0ff57513          	andi	a0,a0,255
    80009830:	fffff097          	auipc	ra,0xfffff
    80009834:	534080e7          	jalr	1332(ra) # 80008d64 <consoleintr>
    80009838:	0054c783          	lbu	a5,5(s1)
    8000983c:	0017f793          	andi	a5,a5,1
    80009840:	fe0794e3          	bnez	a5,80009828 <uartintr+0x28>
    80009844:	00004617          	auipc	a2,0x4
    80009848:	70c60613          	addi	a2,a2,1804 # 8000df50 <uart_tx_r>
    8000984c:	00004517          	auipc	a0,0x4
    80009850:	70c50513          	addi	a0,a0,1804 # 8000df58 <uart_tx_w>
    80009854:	00063783          	ld	a5,0(a2)
    80009858:	00053703          	ld	a4,0(a0)
    8000985c:	04f70263          	beq	a4,a5,800098a0 <uartintr+0xa0>
    80009860:	100005b7          	lui	a1,0x10000
    80009864:	00006817          	auipc	a6,0x6
    80009868:	9dc80813          	addi	a6,a6,-1572 # 8000f240 <uart_tx_buf>
    8000986c:	01c0006f          	j	80009888 <uartintr+0x88>
    80009870:	0006c703          	lbu	a4,0(a3)
    80009874:	00f63023          	sd	a5,0(a2)
    80009878:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000987c:	00063783          	ld	a5,0(a2)
    80009880:	00053703          	ld	a4,0(a0)
    80009884:	00f70e63          	beq	a4,a5,800098a0 <uartintr+0xa0>
    80009888:	01f7f713          	andi	a4,a5,31
    8000988c:	00e806b3          	add	a3,a6,a4
    80009890:	0055c703          	lbu	a4,5(a1)
    80009894:	00178793          	addi	a5,a5,1
    80009898:	02077713          	andi	a4,a4,32
    8000989c:	fc071ae3          	bnez	a4,80009870 <uartintr+0x70>
    800098a0:	01813083          	ld	ra,24(sp)
    800098a4:	01013403          	ld	s0,16(sp)
    800098a8:	00813483          	ld	s1,8(sp)
    800098ac:	02010113          	addi	sp,sp,32
    800098b0:	00008067          	ret
    800098b4:	00004617          	auipc	a2,0x4
    800098b8:	69c60613          	addi	a2,a2,1692 # 8000df50 <uart_tx_r>
    800098bc:	00004517          	auipc	a0,0x4
    800098c0:	69c50513          	addi	a0,a0,1692 # 8000df58 <uart_tx_w>
    800098c4:	00063783          	ld	a5,0(a2)
    800098c8:	00053703          	ld	a4,0(a0)
    800098cc:	04f70263          	beq	a4,a5,80009910 <uartintr+0x110>
    800098d0:	100005b7          	lui	a1,0x10000
    800098d4:	00006817          	auipc	a6,0x6
    800098d8:	96c80813          	addi	a6,a6,-1684 # 8000f240 <uart_tx_buf>
    800098dc:	01c0006f          	j	800098f8 <uartintr+0xf8>
    800098e0:	0006c703          	lbu	a4,0(a3)
    800098e4:	00f63023          	sd	a5,0(a2)
    800098e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800098ec:	00063783          	ld	a5,0(a2)
    800098f0:	00053703          	ld	a4,0(a0)
    800098f4:	02f70063          	beq	a4,a5,80009914 <uartintr+0x114>
    800098f8:	01f7f713          	andi	a4,a5,31
    800098fc:	00e806b3          	add	a3,a6,a4
    80009900:	0055c703          	lbu	a4,5(a1)
    80009904:	00178793          	addi	a5,a5,1
    80009908:	02077713          	andi	a4,a4,32
    8000990c:	fc071ae3          	bnez	a4,800098e0 <uartintr+0xe0>
    80009910:	00008067          	ret
    80009914:	00008067          	ret

0000000080009918 <kinit>:
    80009918:	fc010113          	addi	sp,sp,-64
    8000991c:	02913423          	sd	s1,40(sp)
    80009920:	fffff7b7          	lui	a5,0xfffff
    80009924:	00007497          	auipc	s1,0x7
    80009928:	93b48493          	addi	s1,s1,-1733 # 8001025f <end+0xfff>
    8000992c:	02813823          	sd	s0,48(sp)
    80009930:	01313c23          	sd	s3,24(sp)
    80009934:	00f4f4b3          	and	s1,s1,a5
    80009938:	02113c23          	sd	ra,56(sp)
    8000993c:	03213023          	sd	s2,32(sp)
    80009940:	01413823          	sd	s4,16(sp)
    80009944:	01513423          	sd	s5,8(sp)
    80009948:	04010413          	addi	s0,sp,64
    8000994c:	000017b7          	lui	a5,0x1
    80009950:	01100993          	li	s3,17
    80009954:	00f487b3          	add	a5,s1,a5
    80009958:	01b99993          	slli	s3,s3,0x1b
    8000995c:	06f9e063          	bltu	s3,a5,800099bc <kinit+0xa4>
    80009960:	00006a97          	auipc	s5,0x6
    80009964:	900a8a93          	addi	s5,s5,-1792 # 8000f260 <end>
    80009968:	0754ec63          	bltu	s1,s5,800099e0 <kinit+0xc8>
    8000996c:	0734fa63          	bgeu	s1,s3,800099e0 <kinit+0xc8>
    80009970:	00088a37          	lui	s4,0x88
    80009974:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80009978:	00004917          	auipc	s2,0x4
    8000997c:	5e890913          	addi	s2,s2,1512 # 8000df60 <kmem>
    80009980:	00ca1a13          	slli	s4,s4,0xc
    80009984:	0140006f          	j	80009998 <kinit+0x80>
    80009988:	000017b7          	lui	a5,0x1
    8000998c:	00f484b3          	add	s1,s1,a5
    80009990:	0554e863          	bltu	s1,s5,800099e0 <kinit+0xc8>
    80009994:	0534f663          	bgeu	s1,s3,800099e0 <kinit+0xc8>
    80009998:	00001637          	lui	a2,0x1
    8000999c:	00100593          	li	a1,1
    800099a0:	00048513          	mv	a0,s1
    800099a4:	00000097          	auipc	ra,0x0
    800099a8:	5e4080e7          	jalr	1508(ra) # 80009f88 <__memset>
    800099ac:	00093783          	ld	a5,0(s2)
    800099b0:	00f4b023          	sd	a5,0(s1)
    800099b4:	00993023          	sd	s1,0(s2)
    800099b8:	fd4498e3          	bne	s1,s4,80009988 <kinit+0x70>
    800099bc:	03813083          	ld	ra,56(sp)
    800099c0:	03013403          	ld	s0,48(sp)
    800099c4:	02813483          	ld	s1,40(sp)
    800099c8:	02013903          	ld	s2,32(sp)
    800099cc:	01813983          	ld	s3,24(sp)
    800099d0:	01013a03          	ld	s4,16(sp)
    800099d4:	00813a83          	ld	s5,8(sp)
    800099d8:	04010113          	addi	sp,sp,64
    800099dc:	00008067          	ret
    800099e0:	00002517          	auipc	a0,0x2
    800099e4:	0b050513          	addi	a0,a0,176 # 8000ba90 <digits+0x18>
    800099e8:	fffff097          	auipc	ra,0xfffff
    800099ec:	4b4080e7          	jalr	1204(ra) # 80008e9c <panic>

00000000800099f0 <freerange>:
    800099f0:	fc010113          	addi	sp,sp,-64
    800099f4:	000017b7          	lui	a5,0x1
    800099f8:	02913423          	sd	s1,40(sp)
    800099fc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80009a00:	009504b3          	add	s1,a0,s1
    80009a04:	fffff537          	lui	a0,0xfffff
    80009a08:	02813823          	sd	s0,48(sp)
    80009a0c:	02113c23          	sd	ra,56(sp)
    80009a10:	03213023          	sd	s2,32(sp)
    80009a14:	01313c23          	sd	s3,24(sp)
    80009a18:	01413823          	sd	s4,16(sp)
    80009a1c:	01513423          	sd	s5,8(sp)
    80009a20:	01613023          	sd	s6,0(sp)
    80009a24:	04010413          	addi	s0,sp,64
    80009a28:	00a4f4b3          	and	s1,s1,a0
    80009a2c:	00f487b3          	add	a5,s1,a5
    80009a30:	06f5e463          	bltu	a1,a5,80009a98 <freerange+0xa8>
    80009a34:	00006a97          	auipc	s5,0x6
    80009a38:	82ca8a93          	addi	s5,s5,-2004 # 8000f260 <end>
    80009a3c:	0954e263          	bltu	s1,s5,80009ac0 <freerange+0xd0>
    80009a40:	01100993          	li	s3,17
    80009a44:	01b99993          	slli	s3,s3,0x1b
    80009a48:	0734fc63          	bgeu	s1,s3,80009ac0 <freerange+0xd0>
    80009a4c:	00058a13          	mv	s4,a1
    80009a50:	00004917          	auipc	s2,0x4
    80009a54:	51090913          	addi	s2,s2,1296 # 8000df60 <kmem>
    80009a58:	00002b37          	lui	s6,0x2
    80009a5c:	0140006f          	j	80009a70 <freerange+0x80>
    80009a60:	000017b7          	lui	a5,0x1
    80009a64:	00f484b3          	add	s1,s1,a5
    80009a68:	0554ec63          	bltu	s1,s5,80009ac0 <freerange+0xd0>
    80009a6c:	0534fa63          	bgeu	s1,s3,80009ac0 <freerange+0xd0>
    80009a70:	00001637          	lui	a2,0x1
    80009a74:	00100593          	li	a1,1
    80009a78:	00048513          	mv	a0,s1
    80009a7c:	00000097          	auipc	ra,0x0
    80009a80:	50c080e7          	jalr	1292(ra) # 80009f88 <__memset>
    80009a84:	00093703          	ld	a4,0(s2)
    80009a88:	016487b3          	add	a5,s1,s6
    80009a8c:	00e4b023          	sd	a4,0(s1)
    80009a90:	00993023          	sd	s1,0(s2)
    80009a94:	fcfa76e3          	bgeu	s4,a5,80009a60 <freerange+0x70>
    80009a98:	03813083          	ld	ra,56(sp)
    80009a9c:	03013403          	ld	s0,48(sp)
    80009aa0:	02813483          	ld	s1,40(sp)
    80009aa4:	02013903          	ld	s2,32(sp)
    80009aa8:	01813983          	ld	s3,24(sp)
    80009aac:	01013a03          	ld	s4,16(sp)
    80009ab0:	00813a83          	ld	s5,8(sp)
    80009ab4:	00013b03          	ld	s6,0(sp)
    80009ab8:	04010113          	addi	sp,sp,64
    80009abc:	00008067          	ret
    80009ac0:	00002517          	auipc	a0,0x2
    80009ac4:	fd050513          	addi	a0,a0,-48 # 8000ba90 <digits+0x18>
    80009ac8:	fffff097          	auipc	ra,0xfffff
    80009acc:	3d4080e7          	jalr	980(ra) # 80008e9c <panic>

0000000080009ad0 <kfree>:
    80009ad0:	fe010113          	addi	sp,sp,-32
    80009ad4:	00813823          	sd	s0,16(sp)
    80009ad8:	00113c23          	sd	ra,24(sp)
    80009adc:	00913423          	sd	s1,8(sp)
    80009ae0:	02010413          	addi	s0,sp,32
    80009ae4:	03451793          	slli	a5,a0,0x34
    80009ae8:	04079c63          	bnez	a5,80009b40 <kfree+0x70>
    80009aec:	00005797          	auipc	a5,0x5
    80009af0:	77478793          	addi	a5,a5,1908 # 8000f260 <end>
    80009af4:	00050493          	mv	s1,a0
    80009af8:	04f56463          	bltu	a0,a5,80009b40 <kfree+0x70>
    80009afc:	01100793          	li	a5,17
    80009b00:	01b79793          	slli	a5,a5,0x1b
    80009b04:	02f57e63          	bgeu	a0,a5,80009b40 <kfree+0x70>
    80009b08:	00001637          	lui	a2,0x1
    80009b0c:	00100593          	li	a1,1
    80009b10:	00000097          	auipc	ra,0x0
    80009b14:	478080e7          	jalr	1144(ra) # 80009f88 <__memset>
    80009b18:	00004797          	auipc	a5,0x4
    80009b1c:	44878793          	addi	a5,a5,1096 # 8000df60 <kmem>
    80009b20:	0007b703          	ld	a4,0(a5)
    80009b24:	01813083          	ld	ra,24(sp)
    80009b28:	01013403          	ld	s0,16(sp)
    80009b2c:	00e4b023          	sd	a4,0(s1)
    80009b30:	0097b023          	sd	s1,0(a5)
    80009b34:	00813483          	ld	s1,8(sp)
    80009b38:	02010113          	addi	sp,sp,32
    80009b3c:	00008067          	ret
    80009b40:	00002517          	auipc	a0,0x2
    80009b44:	f5050513          	addi	a0,a0,-176 # 8000ba90 <digits+0x18>
    80009b48:	fffff097          	auipc	ra,0xfffff
    80009b4c:	354080e7          	jalr	852(ra) # 80008e9c <panic>

0000000080009b50 <kalloc>:
    80009b50:	fe010113          	addi	sp,sp,-32
    80009b54:	00813823          	sd	s0,16(sp)
    80009b58:	00913423          	sd	s1,8(sp)
    80009b5c:	00113c23          	sd	ra,24(sp)
    80009b60:	02010413          	addi	s0,sp,32
    80009b64:	00004797          	auipc	a5,0x4
    80009b68:	3fc78793          	addi	a5,a5,1020 # 8000df60 <kmem>
    80009b6c:	0007b483          	ld	s1,0(a5)
    80009b70:	02048063          	beqz	s1,80009b90 <kalloc+0x40>
    80009b74:	0004b703          	ld	a4,0(s1)
    80009b78:	00001637          	lui	a2,0x1
    80009b7c:	00500593          	li	a1,5
    80009b80:	00048513          	mv	a0,s1
    80009b84:	00e7b023          	sd	a4,0(a5)
    80009b88:	00000097          	auipc	ra,0x0
    80009b8c:	400080e7          	jalr	1024(ra) # 80009f88 <__memset>
    80009b90:	01813083          	ld	ra,24(sp)
    80009b94:	01013403          	ld	s0,16(sp)
    80009b98:	00048513          	mv	a0,s1
    80009b9c:	00813483          	ld	s1,8(sp)
    80009ba0:	02010113          	addi	sp,sp,32
    80009ba4:	00008067          	ret

0000000080009ba8 <initlock>:
    80009ba8:	ff010113          	addi	sp,sp,-16
    80009bac:	00813423          	sd	s0,8(sp)
    80009bb0:	01010413          	addi	s0,sp,16
    80009bb4:	00813403          	ld	s0,8(sp)
    80009bb8:	00b53423          	sd	a1,8(a0)
    80009bbc:	00052023          	sw	zero,0(a0)
    80009bc0:	00053823          	sd	zero,16(a0)
    80009bc4:	01010113          	addi	sp,sp,16
    80009bc8:	00008067          	ret

0000000080009bcc <acquire>:
    80009bcc:	fe010113          	addi	sp,sp,-32
    80009bd0:	00813823          	sd	s0,16(sp)
    80009bd4:	00913423          	sd	s1,8(sp)
    80009bd8:	00113c23          	sd	ra,24(sp)
    80009bdc:	01213023          	sd	s2,0(sp)
    80009be0:	02010413          	addi	s0,sp,32
    80009be4:	00050493          	mv	s1,a0
    80009be8:	10002973          	csrr	s2,sstatus
    80009bec:	100027f3          	csrr	a5,sstatus
    80009bf0:	ffd7f793          	andi	a5,a5,-3
    80009bf4:	10079073          	csrw	sstatus,a5
    80009bf8:	fffff097          	auipc	ra,0xfffff
    80009bfc:	8ec080e7          	jalr	-1812(ra) # 800084e4 <mycpu>
    80009c00:	07852783          	lw	a5,120(a0)
    80009c04:	06078e63          	beqz	a5,80009c80 <acquire+0xb4>
    80009c08:	fffff097          	auipc	ra,0xfffff
    80009c0c:	8dc080e7          	jalr	-1828(ra) # 800084e4 <mycpu>
    80009c10:	07852783          	lw	a5,120(a0)
    80009c14:	0004a703          	lw	a4,0(s1)
    80009c18:	0017879b          	addiw	a5,a5,1
    80009c1c:	06f52c23          	sw	a5,120(a0)
    80009c20:	04071063          	bnez	a4,80009c60 <acquire+0x94>
    80009c24:	00100713          	li	a4,1
    80009c28:	00070793          	mv	a5,a4
    80009c2c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80009c30:	0007879b          	sext.w	a5,a5
    80009c34:	fe079ae3          	bnez	a5,80009c28 <acquire+0x5c>
    80009c38:	0ff0000f          	fence
    80009c3c:	fffff097          	auipc	ra,0xfffff
    80009c40:	8a8080e7          	jalr	-1880(ra) # 800084e4 <mycpu>
    80009c44:	01813083          	ld	ra,24(sp)
    80009c48:	01013403          	ld	s0,16(sp)
    80009c4c:	00a4b823          	sd	a0,16(s1)
    80009c50:	00013903          	ld	s2,0(sp)
    80009c54:	00813483          	ld	s1,8(sp)
    80009c58:	02010113          	addi	sp,sp,32
    80009c5c:	00008067          	ret
    80009c60:	0104b903          	ld	s2,16(s1)
    80009c64:	fffff097          	auipc	ra,0xfffff
    80009c68:	880080e7          	jalr	-1920(ra) # 800084e4 <mycpu>
    80009c6c:	faa91ce3          	bne	s2,a0,80009c24 <acquire+0x58>
    80009c70:	00002517          	auipc	a0,0x2
    80009c74:	e2850513          	addi	a0,a0,-472 # 8000ba98 <digits+0x20>
    80009c78:	fffff097          	auipc	ra,0xfffff
    80009c7c:	224080e7          	jalr	548(ra) # 80008e9c <panic>
    80009c80:	00195913          	srli	s2,s2,0x1
    80009c84:	fffff097          	auipc	ra,0xfffff
    80009c88:	860080e7          	jalr	-1952(ra) # 800084e4 <mycpu>
    80009c8c:	00197913          	andi	s2,s2,1
    80009c90:	07252e23          	sw	s2,124(a0)
    80009c94:	f75ff06f          	j	80009c08 <acquire+0x3c>

0000000080009c98 <release>:
    80009c98:	fe010113          	addi	sp,sp,-32
    80009c9c:	00813823          	sd	s0,16(sp)
    80009ca0:	00113c23          	sd	ra,24(sp)
    80009ca4:	00913423          	sd	s1,8(sp)
    80009ca8:	01213023          	sd	s2,0(sp)
    80009cac:	02010413          	addi	s0,sp,32
    80009cb0:	00052783          	lw	a5,0(a0)
    80009cb4:	00079a63          	bnez	a5,80009cc8 <release+0x30>
    80009cb8:	00002517          	auipc	a0,0x2
    80009cbc:	de850513          	addi	a0,a0,-536 # 8000baa0 <digits+0x28>
    80009cc0:	fffff097          	auipc	ra,0xfffff
    80009cc4:	1dc080e7          	jalr	476(ra) # 80008e9c <panic>
    80009cc8:	01053903          	ld	s2,16(a0)
    80009ccc:	00050493          	mv	s1,a0
    80009cd0:	fffff097          	auipc	ra,0xfffff
    80009cd4:	814080e7          	jalr	-2028(ra) # 800084e4 <mycpu>
    80009cd8:	fea910e3          	bne	s2,a0,80009cb8 <release+0x20>
    80009cdc:	0004b823          	sd	zero,16(s1)
    80009ce0:	0ff0000f          	fence
    80009ce4:	0f50000f          	fence	iorw,ow
    80009ce8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80009cec:	ffffe097          	auipc	ra,0xffffe
    80009cf0:	7f8080e7          	jalr	2040(ra) # 800084e4 <mycpu>
    80009cf4:	100027f3          	csrr	a5,sstatus
    80009cf8:	0027f793          	andi	a5,a5,2
    80009cfc:	04079a63          	bnez	a5,80009d50 <release+0xb8>
    80009d00:	07852783          	lw	a5,120(a0)
    80009d04:	02f05e63          	blez	a5,80009d40 <release+0xa8>
    80009d08:	fff7871b          	addiw	a4,a5,-1
    80009d0c:	06e52c23          	sw	a4,120(a0)
    80009d10:	00071c63          	bnez	a4,80009d28 <release+0x90>
    80009d14:	07c52783          	lw	a5,124(a0)
    80009d18:	00078863          	beqz	a5,80009d28 <release+0x90>
    80009d1c:	100027f3          	csrr	a5,sstatus
    80009d20:	0027e793          	ori	a5,a5,2
    80009d24:	10079073          	csrw	sstatus,a5
    80009d28:	01813083          	ld	ra,24(sp)
    80009d2c:	01013403          	ld	s0,16(sp)
    80009d30:	00813483          	ld	s1,8(sp)
    80009d34:	00013903          	ld	s2,0(sp)
    80009d38:	02010113          	addi	sp,sp,32
    80009d3c:	00008067          	ret
    80009d40:	00002517          	auipc	a0,0x2
    80009d44:	d8050513          	addi	a0,a0,-640 # 8000bac0 <digits+0x48>
    80009d48:	fffff097          	auipc	ra,0xfffff
    80009d4c:	154080e7          	jalr	340(ra) # 80008e9c <panic>
    80009d50:	00002517          	auipc	a0,0x2
    80009d54:	d5850513          	addi	a0,a0,-680 # 8000baa8 <digits+0x30>
    80009d58:	fffff097          	auipc	ra,0xfffff
    80009d5c:	144080e7          	jalr	324(ra) # 80008e9c <panic>

0000000080009d60 <holding>:
    80009d60:	00052783          	lw	a5,0(a0)
    80009d64:	00079663          	bnez	a5,80009d70 <holding+0x10>
    80009d68:	00000513          	li	a0,0
    80009d6c:	00008067          	ret
    80009d70:	fe010113          	addi	sp,sp,-32
    80009d74:	00813823          	sd	s0,16(sp)
    80009d78:	00913423          	sd	s1,8(sp)
    80009d7c:	00113c23          	sd	ra,24(sp)
    80009d80:	02010413          	addi	s0,sp,32
    80009d84:	01053483          	ld	s1,16(a0)
    80009d88:	ffffe097          	auipc	ra,0xffffe
    80009d8c:	75c080e7          	jalr	1884(ra) # 800084e4 <mycpu>
    80009d90:	01813083          	ld	ra,24(sp)
    80009d94:	01013403          	ld	s0,16(sp)
    80009d98:	40a48533          	sub	a0,s1,a0
    80009d9c:	00153513          	seqz	a0,a0
    80009da0:	00813483          	ld	s1,8(sp)
    80009da4:	02010113          	addi	sp,sp,32
    80009da8:	00008067          	ret

0000000080009dac <push_off>:
    80009dac:	fe010113          	addi	sp,sp,-32
    80009db0:	00813823          	sd	s0,16(sp)
    80009db4:	00113c23          	sd	ra,24(sp)
    80009db8:	00913423          	sd	s1,8(sp)
    80009dbc:	02010413          	addi	s0,sp,32
    80009dc0:	100024f3          	csrr	s1,sstatus
    80009dc4:	100027f3          	csrr	a5,sstatus
    80009dc8:	ffd7f793          	andi	a5,a5,-3
    80009dcc:	10079073          	csrw	sstatus,a5
    80009dd0:	ffffe097          	auipc	ra,0xffffe
    80009dd4:	714080e7          	jalr	1812(ra) # 800084e4 <mycpu>
    80009dd8:	07852783          	lw	a5,120(a0)
    80009ddc:	02078663          	beqz	a5,80009e08 <push_off+0x5c>
    80009de0:	ffffe097          	auipc	ra,0xffffe
    80009de4:	704080e7          	jalr	1796(ra) # 800084e4 <mycpu>
    80009de8:	07852783          	lw	a5,120(a0)
    80009dec:	01813083          	ld	ra,24(sp)
    80009df0:	01013403          	ld	s0,16(sp)
    80009df4:	0017879b          	addiw	a5,a5,1
    80009df8:	06f52c23          	sw	a5,120(a0)
    80009dfc:	00813483          	ld	s1,8(sp)
    80009e00:	02010113          	addi	sp,sp,32
    80009e04:	00008067          	ret
    80009e08:	0014d493          	srli	s1,s1,0x1
    80009e0c:	ffffe097          	auipc	ra,0xffffe
    80009e10:	6d8080e7          	jalr	1752(ra) # 800084e4 <mycpu>
    80009e14:	0014f493          	andi	s1,s1,1
    80009e18:	06952e23          	sw	s1,124(a0)
    80009e1c:	fc5ff06f          	j	80009de0 <push_off+0x34>

0000000080009e20 <pop_off>:
    80009e20:	ff010113          	addi	sp,sp,-16
    80009e24:	00813023          	sd	s0,0(sp)
    80009e28:	00113423          	sd	ra,8(sp)
    80009e2c:	01010413          	addi	s0,sp,16
    80009e30:	ffffe097          	auipc	ra,0xffffe
    80009e34:	6b4080e7          	jalr	1716(ra) # 800084e4 <mycpu>
    80009e38:	100027f3          	csrr	a5,sstatus
    80009e3c:	0027f793          	andi	a5,a5,2
    80009e40:	04079663          	bnez	a5,80009e8c <pop_off+0x6c>
    80009e44:	07852783          	lw	a5,120(a0)
    80009e48:	02f05a63          	blez	a5,80009e7c <pop_off+0x5c>
    80009e4c:	fff7871b          	addiw	a4,a5,-1
    80009e50:	06e52c23          	sw	a4,120(a0)
    80009e54:	00071c63          	bnez	a4,80009e6c <pop_off+0x4c>
    80009e58:	07c52783          	lw	a5,124(a0)
    80009e5c:	00078863          	beqz	a5,80009e6c <pop_off+0x4c>
    80009e60:	100027f3          	csrr	a5,sstatus
    80009e64:	0027e793          	ori	a5,a5,2
    80009e68:	10079073          	csrw	sstatus,a5
    80009e6c:	00813083          	ld	ra,8(sp)
    80009e70:	00013403          	ld	s0,0(sp)
    80009e74:	01010113          	addi	sp,sp,16
    80009e78:	00008067          	ret
    80009e7c:	00002517          	auipc	a0,0x2
    80009e80:	c4450513          	addi	a0,a0,-956 # 8000bac0 <digits+0x48>
    80009e84:	fffff097          	auipc	ra,0xfffff
    80009e88:	018080e7          	jalr	24(ra) # 80008e9c <panic>
    80009e8c:	00002517          	auipc	a0,0x2
    80009e90:	c1c50513          	addi	a0,a0,-996 # 8000baa8 <digits+0x30>
    80009e94:	fffff097          	auipc	ra,0xfffff
    80009e98:	008080e7          	jalr	8(ra) # 80008e9c <panic>

0000000080009e9c <push_on>:
    80009e9c:	fe010113          	addi	sp,sp,-32
    80009ea0:	00813823          	sd	s0,16(sp)
    80009ea4:	00113c23          	sd	ra,24(sp)
    80009ea8:	00913423          	sd	s1,8(sp)
    80009eac:	02010413          	addi	s0,sp,32
    80009eb0:	100024f3          	csrr	s1,sstatus
    80009eb4:	100027f3          	csrr	a5,sstatus
    80009eb8:	0027e793          	ori	a5,a5,2
    80009ebc:	10079073          	csrw	sstatus,a5
    80009ec0:	ffffe097          	auipc	ra,0xffffe
    80009ec4:	624080e7          	jalr	1572(ra) # 800084e4 <mycpu>
    80009ec8:	07852783          	lw	a5,120(a0)
    80009ecc:	02078663          	beqz	a5,80009ef8 <push_on+0x5c>
    80009ed0:	ffffe097          	auipc	ra,0xffffe
    80009ed4:	614080e7          	jalr	1556(ra) # 800084e4 <mycpu>
    80009ed8:	07852783          	lw	a5,120(a0)
    80009edc:	01813083          	ld	ra,24(sp)
    80009ee0:	01013403          	ld	s0,16(sp)
    80009ee4:	0017879b          	addiw	a5,a5,1
    80009ee8:	06f52c23          	sw	a5,120(a0)
    80009eec:	00813483          	ld	s1,8(sp)
    80009ef0:	02010113          	addi	sp,sp,32
    80009ef4:	00008067          	ret
    80009ef8:	0014d493          	srli	s1,s1,0x1
    80009efc:	ffffe097          	auipc	ra,0xffffe
    80009f00:	5e8080e7          	jalr	1512(ra) # 800084e4 <mycpu>
    80009f04:	0014f493          	andi	s1,s1,1
    80009f08:	06952e23          	sw	s1,124(a0)
    80009f0c:	fc5ff06f          	j	80009ed0 <push_on+0x34>

0000000080009f10 <pop_on>:
    80009f10:	ff010113          	addi	sp,sp,-16
    80009f14:	00813023          	sd	s0,0(sp)
    80009f18:	00113423          	sd	ra,8(sp)
    80009f1c:	01010413          	addi	s0,sp,16
    80009f20:	ffffe097          	auipc	ra,0xffffe
    80009f24:	5c4080e7          	jalr	1476(ra) # 800084e4 <mycpu>
    80009f28:	100027f3          	csrr	a5,sstatus
    80009f2c:	0027f793          	andi	a5,a5,2
    80009f30:	04078463          	beqz	a5,80009f78 <pop_on+0x68>
    80009f34:	07852783          	lw	a5,120(a0)
    80009f38:	02f05863          	blez	a5,80009f68 <pop_on+0x58>
    80009f3c:	fff7879b          	addiw	a5,a5,-1
    80009f40:	06f52c23          	sw	a5,120(a0)
    80009f44:	07853783          	ld	a5,120(a0)
    80009f48:	00079863          	bnez	a5,80009f58 <pop_on+0x48>
    80009f4c:	100027f3          	csrr	a5,sstatus
    80009f50:	ffd7f793          	andi	a5,a5,-3
    80009f54:	10079073          	csrw	sstatus,a5
    80009f58:	00813083          	ld	ra,8(sp)
    80009f5c:	00013403          	ld	s0,0(sp)
    80009f60:	01010113          	addi	sp,sp,16
    80009f64:	00008067          	ret
    80009f68:	00002517          	auipc	a0,0x2
    80009f6c:	b8050513          	addi	a0,a0,-1152 # 8000bae8 <digits+0x70>
    80009f70:	fffff097          	auipc	ra,0xfffff
    80009f74:	f2c080e7          	jalr	-212(ra) # 80008e9c <panic>
    80009f78:	00002517          	auipc	a0,0x2
    80009f7c:	b5050513          	addi	a0,a0,-1200 # 8000bac8 <digits+0x50>
    80009f80:	fffff097          	auipc	ra,0xfffff
    80009f84:	f1c080e7          	jalr	-228(ra) # 80008e9c <panic>

0000000080009f88 <__memset>:
    80009f88:	ff010113          	addi	sp,sp,-16
    80009f8c:	00813423          	sd	s0,8(sp)
    80009f90:	01010413          	addi	s0,sp,16
    80009f94:	1a060e63          	beqz	a2,8000a150 <__memset+0x1c8>
    80009f98:	40a007b3          	neg	a5,a0
    80009f9c:	0077f793          	andi	a5,a5,7
    80009fa0:	00778693          	addi	a3,a5,7
    80009fa4:	00b00813          	li	a6,11
    80009fa8:	0ff5f593          	andi	a1,a1,255
    80009fac:	fff6071b          	addiw	a4,a2,-1
    80009fb0:	1b06e663          	bltu	a3,a6,8000a15c <__memset+0x1d4>
    80009fb4:	1cd76463          	bltu	a4,a3,8000a17c <__memset+0x1f4>
    80009fb8:	1a078e63          	beqz	a5,8000a174 <__memset+0x1ec>
    80009fbc:	00b50023          	sb	a1,0(a0)
    80009fc0:	00100713          	li	a4,1
    80009fc4:	1ae78463          	beq	a5,a4,8000a16c <__memset+0x1e4>
    80009fc8:	00b500a3          	sb	a1,1(a0)
    80009fcc:	00200713          	li	a4,2
    80009fd0:	1ae78a63          	beq	a5,a4,8000a184 <__memset+0x1fc>
    80009fd4:	00b50123          	sb	a1,2(a0)
    80009fd8:	00300713          	li	a4,3
    80009fdc:	18e78463          	beq	a5,a4,8000a164 <__memset+0x1dc>
    80009fe0:	00b501a3          	sb	a1,3(a0)
    80009fe4:	00400713          	li	a4,4
    80009fe8:	1ae78263          	beq	a5,a4,8000a18c <__memset+0x204>
    80009fec:	00b50223          	sb	a1,4(a0)
    80009ff0:	00500713          	li	a4,5
    80009ff4:	1ae78063          	beq	a5,a4,8000a194 <__memset+0x20c>
    80009ff8:	00b502a3          	sb	a1,5(a0)
    80009ffc:	00700713          	li	a4,7
    8000a000:	18e79e63          	bne	a5,a4,8000a19c <__memset+0x214>
    8000a004:	00b50323          	sb	a1,6(a0)
    8000a008:	00700e93          	li	t4,7
    8000a00c:	00859713          	slli	a4,a1,0x8
    8000a010:	00e5e733          	or	a4,a1,a4
    8000a014:	01059e13          	slli	t3,a1,0x10
    8000a018:	01c76e33          	or	t3,a4,t3
    8000a01c:	01859313          	slli	t1,a1,0x18
    8000a020:	006e6333          	or	t1,t3,t1
    8000a024:	02059893          	slli	a7,a1,0x20
    8000a028:	40f60e3b          	subw	t3,a2,a5
    8000a02c:	011368b3          	or	a7,t1,a7
    8000a030:	02859813          	slli	a6,a1,0x28
    8000a034:	0108e833          	or	a6,a7,a6
    8000a038:	03059693          	slli	a3,a1,0x30
    8000a03c:	003e589b          	srliw	a7,t3,0x3
    8000a040:	00d866b3          	or	a3,a6,a3
    8000a044:	03859713          	slli	a4,a1,0x38
    8000a048:	00389813          	slli	a6,a7,0x3
    8000a04c:	00f507b3          	add	a5,a0,a5
    8000a050:	00e6e733          	or	a4,a3,a4
    8000a054:	000e089b          	sext.w	a7,t3
    8000a058:	00f806b3          	add	a3,a6,a5
    8000a05c:	00e7b023          	sd	a4,0(a5)
    8000a060:	00878793          	addi	a5,a5,8
    8000a064:	fed79ce3          	bne	a5,a3,8000a05c <__memset+0xd4>
    8000a068:	ff8e7793          	andi	a5,t3,-8
    8000a06c:	0007871b          	sext.w	a4,a5
    8000a070:	01d787bb          	addw	a5,a5,t4
    8000a074:	0ce88e63          	beq	a7,a4,8000a150 <__memset+0x1c8>
    8000a078:	00f50733          	add	a4,a0,a5
    8000a07c:	00b70023          	sb	a1,0(a4)
    8000a080:	0017871b          	addiw	a4,a5,1
    8000a084:	0cc77663          	bgeu	a4,a2,8000a150 <__memset+0x1c8>
    8000a088:	00e50733          	add	a4,a0,a4
    8000a08c:	00b70023          	sb	a1,0(a4)
    8000a090:	0027871b          	addiw	a4,a5,2
    8000a094:	0ac77e63          	bgeu	a4,a2,8000a150 <__memset+0x1c8>
    8000a098:	00e50733          	add	a4,a0,a4
    8000a09c:	00b70023          	sb	a1,0(a4)
    8000a0a0:	0037871b          	addiw	a4,a5,3
    8000a0a4:	0ac77663          	bgeu	a4,a2,8000a150 <__memset+0x1c8>
    8000a0a8:	00e50733          	add	a4,a0,a4
    8000a0ac:	00b70023          	sb	a1,0(a4)
    8000a0b0:	0047871b          	addiw	a4,a5,4
    8000a0b4:	08c77e63          	bgeu	a4,a2,8000a150 <__memset+0x1c8>
    8000a0b8:	00e50733          	add	a4,a0,a4
    8000a0bc:	00b70023          	sb	a1,0(a4)
    8000a0c0:	0057871b          	addiw	a4,a5,5
    8000a0c4:	08c77663          	bgeu	a4,a2,8000a150 <__memset+0x1c8>
    8000a0c8:	00e50733          	add	a4,a0,a4
    8000a0cc:	00b70023          	sb	a1,0(a4)
    8000a0d0:	0067871b          	addiw	a4,a5,6
    8000a0d4:	06c77e63          	bgeu	a4,a2,8000a150 <__memset+0x1c8>
    8000a0d8:	00e50733          	add	a4,a0,a4
    8000a0dc:	00b70023          	sb	a1,0(a4)
    8000a0e0:	0077871b          	addiw	a4,a5,7
    8000a0e4:	06c77663          	bgeu	a4,a2,8000a150 <__memset+0x1c8>
    8000a0e8:	00e50733          	add	a4,a0,a4
    8000a0ec:	00b70023          	sb	a1,0(a4)
    8000a0f0:	0087871b          	addiw	a4,a5,8
    8000a0f4:	04c77e63          	bgeu	a4,a2,8000a150 <__memset+0x1c8>
    8000a0f8:	00e50733          	add	a4,a0,a4
    8000a0fc:	00b70023          	sb	a1,0(a4)
    8000a100:	0097871b          	addiw	a4,a5,9
    8000a104:	04c77663          	bgeu	a4,a2,8000a150 <__memset+0x1c8>
    8000a108:	00e50733          	add	a4,a0,a4
    8000a10c:	00b70023          	sb	a1,0(a4)
    8000a110:	00a7871b          	addiw	a4,a5,10
    8000a114:	02c77e63          	bgeu	a4,a2,8000a150 <__memset+0x1c8>
    8000a118:	00e50733          	add	a4,a0,a4
    8000a11c:	00b70023          	sb	a1,0(a4)
    8000a120:	00b7871b          	addiw	a4,a5,11
    8000a124:	02c77663          	bgeu	a4,a2,8000a150 <__memset+0x1c8>
    8000a128:	00e50733          	add	a4,a0,a4
    8000a12c:	00b70023          	sb	a1,0(a4)
    8000a130:	00c7871b          	addiw	a4,a5,12
    8000a134:	00c77e63          	bgeu	a4,a2,8000a150 <__memset+0x1c8>
    8000a138:	00e50733          	add	a4,a0,a4
    8000a13c:	00b70023          	sb	a1,0(a4)
    8000a140:	00d7879b          	addiw	a5,a5,13
    8000a144:	00c7f663          	bgeu	a5,a2,8000a150 <__memset+0x1c8>
    8000a148:	00f507b3          	add	a5,a0,a5
    8000a14c:	00b78023          	sb	a1,0(a5)
    8000a150:	00813403          	ld	s0,8(sp)
    8000a154:	01010113          	addi	sp,sp,16
    8000a158:	00008067          	ret
    8000a15c:	00b00693          	li	a3,11
    8000a160:	e55ff06f          	j	80009fb4 <__memset+0x2c>
    8000a164:	00300e93          	li	t4,3
    8000a168:	ea5ff06f          	j	8000a00c <__memset+0x84>
    8000a16c:	00100e93          	li	t4,1
    8000a170:	e9dff06f          	j	8000a00c <__memset+0x84>
    8000a174:	00000e93          	li	t4,0
    8000a178:	e95ff06f          	j	8000a00c <__memset+0x84>
    8000a17c:	00000793          	li	a5,0
    8000a180:	ef9ff06f          	j	8000a078 <__memset+0xf0>
    8000a184:	00200e93          	li	t4,2
    8000a188:	e85ff06f          	j	8000a00c <__memset+0x84>
    8000a18c:	00400e93          	li	t4,4
    8000a190:	e7dff06f          	j	8000a00c <__memset+0x84>
    8000a194:	00500e93          	li	t4,5
    8000a198:	e75ff06f          	j	8000a00c <__memset+0x84>
    8000a19c:	00600e93          	li	t4,6
    8000a1a0:	e6dff06f          	j	8000a00c <__memset+0x84>

000000008000a1a4 <__memmove>:
    8000a1a4:	ff010113          	addi	sp,sp,-16
    8000a1a8:	00813423          	sd	s0,8(sp)
    8000a1ac:	01010413          	addi	s0,sp,16
    8000a1b0:	0e060863          	beqz	a2,8000a2a0 <__memmove+0xfc>
    8000a1b4:	fff6069b          	addiw	a3,a2,-1
    8000a1b8:	0006881b          	sext.w	a6,a3
    8000a1bc:	0ea5e863          	bltu	a1,a0,8000a2ac <__memmove+0x108>
    8000a1c0:	00758713          	addi	a4,a1,7
    8000a1c4:	00a5e7b3          	or	a5,a1,a0
    8000a1c8:	40a70733          	sub	a4,a4,a0
    8000a1cc:	0077f793          	andi	a5,a5,7
    8000a1d0:	00f73713          	sltiu	a4,a4,15
    8000a1d4:	00174713          	xori	a4,a4,1
    8000a1d8:	0017b793          	seqz	a5,a5
    8000a1dc:	00e7f7b3          	and	a5,a5,a4
    8000a1e0:	10078863          	beqz	a5,8000a2f0 <__memmove+0x14c>
    8000a1e4:	00900793          	li	a5,9
    8000a1e8:	1107f463          	bgeu	a5,a6,8000a2f0 <__memmove+0x14c>
    8000a1ec:	0036581b          	srliw	a6,a2,0x3
    8000a1f0:	fff8081b          	addiw	a6,a6,-1
    8000a1f4:	02081813          	slli	a6,a6,0x20
    8000a1f8:	01d85893          	srli	a7,a6,0x1d
    8000a1fc:	00858813          	addi	a6,a1,8
    8000a200:	00058793          	mv	a5,a1
    8000a204:	00050713          	mv	a4,a0
    8000a208:	01088833          	add	a6,a7,a6
    8000a20c:	0007b883          	ld	a7,0(a5)
    8000a210:	00878793          	addi	a5,a5,8
    8000a214:	00870713          	addi	a4,a4,8
    8000a218:	ff173c23          	sd	a7,-8(a4)
    8000a21c:	ff0798e3          	bne	a5,a6,8000a20c <__memmove+0x68>
    8000a220:	ff867713          	andi	a4,a2,-8
    8000a224:	02071793          	slli	a5,a4,0x20
    8000a228:	0207d793          	srli	a5,a5,0x20
    8000a22c:	00f585b3          	add	a1,a1,a5
    8000a230:	40e686bb          	subw	a3,a3,a4
    8000a234:	00f507b3          	add	a5,a0,a5
    8000a238:	06e60463          	beq	a2,a4,8000a2a0 <__memmove+0xfc>
    8000a23c:	0005c703          	lbu	a4,0(a1)
    8000a240:	00e78023          	sb	a4,0(a5)
    8000a244:	04068e63          	beqz	a3,8000a2a0 <__memmove+0xfc>
    8000a248:	0015c603          	lbu	a2,1(a1)
    8000a24c:	00100713          	li	a4,1
    8000a250:	00c780a3          	sb	a2,1(a5)
    8000a254:	04e68663          	beq	a3,a4,8000a2a0 <__memmove+0xfc>
    8000a258:	0025c603          	lbu	a2,2(a1)
    8000a25c:	00200713          	li	a4,2
    8000a260:	00c78123          	sb	a2,2(a5)
    8000a264:	02e68e63          	beq	a3,a4,8000a2a0 <__memmove+0xfc>
    8000a268:	0035c603          	lbu	a2,3(a1)
    8000a26c:	00300713          	li	a4,3
    8000a270:	00c781a3          	sb	a2,3(a5)
    8000a274:	02e68663          	beq	a3,a4,8000a2a0 <__memmove+0xfc>
    8000a278:	0045c603          	lbu	a2,4(a1)
    8000a27c:	00400713          	li	a4,4
    8000a280:	00c78223          	sb	a2,4(a5)
    8000a284:	00e68e63          	beq	a3,a4,8000a2a0 <__memmove+0xfc>
    8000a288:	0055c603          	lbu	a2,5(a1)
    8000a28c:	00500713          	li	a4,5
    8000a290:	00c782a3          	sb	a2,5(a5)
    8000a294:	00e68663          	beq	a3,a4,8000a2a0 <__memmove+0xfc>
    8000a298:	0065c703          	lbu	a4,6(a1)
    8000a29c:	00e78323          	sb	a4,6(a5)
    8000a2a0:	00813403          	ld	s0,8(sp)
    8000a2a4:	01010113          	addi	sp,sp,16
    8000a2a8:	00008067          	ret
    8000a2ac:	02061713          	slli	a4,a2,0x20
    8000a2b0:	02075713          	srli	a4,a4,0x20
    8000a2b4:	00e587b3          	add	a5,a1,a4
    8000a2b8:	f0f574e3          	bgeu	a0,a5,8000a1c0 <__memmove+0x1c>
    8000a2bc:	02069613          	slli	a2,a3,0x20
    8000a2c0:	02065613          	srli	a2,a2,0x20
    8000a2c4:	fff64613          	not	a2,a2
    8000a2c8:	00e50733          	add	a4,a0,a4
    8000a2cc:	00c78633          	add	a2,a5,a2
    8000a2d0:	fff7c683          	lbu	a3,-1(a5)
    8000a2d4:	fff78793          	addi	a5,a5,-1
    8000a2d8:	fff70713          	addi	a4,a4,-1
    8000a2dc:	00d70023          	sb	a3,0(a4)
    8000a2e0:	fec798e3          	bne	a5,a2,8000a2d0 <__memmove+0x12c>
    8000a2e4:	00813403          	ld	s0,8(sp)
    8000a2e8:	01010113          	addi	sp,sp,16
    8000a2ec:	00008067          	ret
    8000a2f0:	02069713          	slli	a4,a3,0x20
    8000a2f4:	02075713          	srli	a4,a4,0x20
    8000a2f8:	00170713          	addi	a4,a4,1
    8000a2fc:	00e50733          	add	a4,a0,a4
    8000a300:	00050793          	mv	a5,a0
    8000a304:	0005c683          	lbu	a3,0(a1)
    8000a308:	00178793          	addi	a5,a5,1
    8000a30c:	00158593          	addi	a1,a1,1
    8000a310:	fed78fa3          	sb	a3,-1(a5)
    8000a314:	fee798e3          	bne	a5,a4,8000a304 <__memmove+0x160>
    8000a318:	f89ff06f          	j	8000a2a0 <__memmove+0xfc>
	...
