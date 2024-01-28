
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000e117          	auipc	sp,0xe
    80000004:	fa813103          	ld	sp,-88(sp) # 8000dfa8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	480080ef          	jal	ra,8000849c <start>

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
    8000107c:	208030ef          	jal	ra,80004284 <exceptionHandler>


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
    80001160:	c0478793          	addi	a5,a5,-1020 # 8000dd60 <_ZTV6Thread+0x10>
    80001164:	00f53023          	sd	a5,0(a0)
    mem_free(myHandle);
    80001168:	00853503          	ld	a0,8(a0)
    8000116c:	00000097          	auipc	ra,0x0
    80001170:	744080e7          	jalr	1860(ra) # 800018b0 <_Z8mem_freePv>
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
    80001198:	bf478793          	addi	a5,a5,-1036 # 8000dd88 <_ZTV9Semaphore+0x10>
    8000119c:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800011a0:	00853503          	ld	a0,8(a0)
    800011a4:	00001097          	auipc	ra,0x1
    800011a8:	87c080e7          	jalr	-1924(ra) # 80001a20 <_Z9sem_closeP4_sem>
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
    800011d0:	6b4080e7          	jalr	1716(ra) # 80001880 <_Z9mem_allocm>
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
    800011f8:	6bc080e7          	jalr	1724(ra) # 800018b0 <_Z8mem_freePv>
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
    8000129c:	ac878793          	addi	a5,a5,-1336 # 8000dd60 <_ZTV6Thread+0x10>
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
    800012d8:	608080e7          	jalr	1544(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
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
    80001304:	698080e7          	jalr	1688(ra) # 80001998 <_Z11thread_joinP7_thread>
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
    8000132c:	650080e7          	jalr	1616(ra) # 80001978 <_Z15thread_dispatchv>
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
    80001354:	66c080e7          	jalr	1644(ra) # 800019bc <_Z10time_sleepm>
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
    800013b0:	9b478793          	addi	a5,a5,-1612 # 8000dd60 <_ZTV6Thread+0x10>
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
    800013e8:	9a478793          	addi	a5,a5,-1628 # 8000dd88 <_ZTV9Semaphore+0x10>
    800013ec:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800013f0:	00850513          	addi	a0,a0,8
    800013f4:	00000097          	auipc	ra,0x0
    800013f8:	5f4080e7          	jalr	1524(ra) # 800019e8 <_Z8sem_openPP4_semj>
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
    80001424:	62c080e7          	jalr	1580(ra) # 80001a4c <_Z8sem_waitP4_sem>
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
    80001450:	62c080e7          	jalr	1580(ra) # 80001a78 <_Z10sem_signalP4_sem>
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
    800014a8:	90478793          	addi	a5,a5,-1788 # 8000dda8 <_ZTV14PeriodicThread+0x10>
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
    80001568:	84478793          	addi	a5,a5,-1980 # 8000dda8 <_ZTV14PeriodicThread+0x10>
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
    800015a4:	80878793          	addi	a5,a5,-2040 # 8000dda8 <_ZTV14PeriodicThread+0x10>
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
#include "sched.h"
#include "assert.h"

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
    800015f0:	a247b783          	ld	a5,-1500(a5) # 8000e010 <_ZN5Timer8instanceE>
    800015f4:	02079463          	bnez	a5,8000161c <_ZN5TimerC1Ev+0x48>
    instance = this;
    800015f8:	0000d797          	auipc	a5,0xd
    800015fc:	a097bc23          	sd	s1,-1512(a5) # 8000e010 <_ZN5Timer8instanceE>
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
    80001624:	01400613          	li	a2,20
    80001628:	0000a597          	auipc	a1,0xa
    8000162c:	a0858593          	addi	a1,a1,-1528 # 8000b030 <CONSOLE_STATUS+0x20>
    80001630:	0000a517          	auipc	a0,0xa
    80001634:	a1050513          	addi	a0,a0,-1520 # 8000b040 <CONSOLE_STATUS+0x30>
    80001638:	00001097          	auipc	ra,0x1
    8000163c:	a3c080e7          	jalr	-1476(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
    80001640:	fb9ff06f          	j	800015f8 <_ZN5TimerC1Ev+0x24>

0000000080001644 <_ZN5TimerD1Ev>:

Timer::~Timer(){
    threadSleepWrapper* current = sleepingHead;
    80001644:	00053503          	ld	a0,0(a0)
    while(current != 0){
    80001648:	04050063          	beqz	a0,80001688 <_ZN5TimerD1Ev+0x44>
Timer::~Timer(){
    8000164c:	fe010113          	addi	sp,sp,-32
    80001650:	00113c23          	sd	ra,24(sp)
    80001654:	00813823          	sd	s0,16(sp)
    80001658:	00913423          	sd	s1,8(sp)
    8000165c:	02010413          	addi	s0,sp,32
        threadSleepWrapper* next = current->next;
    80001660:	01053483          	ld	s1,16(a0)
        mem_free(current);
    80001664:	00000097          	auipc	ra,0x0
    80001668:	24c080e7          	jalr	588(ra) # 800018b0 <_Z8mem_freePv>
        current = next;
    8000166c:	00048513          	mv	a0,s1
    while(current != 0){
    80001670:	fe0498e3          	bnez	s1,80001660 <_ZN5TimerD1Ev+0x1c>
    }
}
    80001674:	01813083          	ld	ra,24(sp)
    80001678:	01013403          	ld	s0,16(sp)
    8000167c:	00813483          	ld	s1,8(sp)
    80001680:	02010113          	addi	sp,sp,32
    80001684:	00008067          	ret
    80001688:	00008067          	ret

000000008000168c <_ZN5Timer11getInstanceEv>:

Timer& Timer::getInstance(){
    assert(instance != 0);
    8000168c:	0000d797          	auipc	a5,0xd
    80001690:	9847b783          	ld	a5,-1660(a5) # 8000e010 <_ZN5Timer8instanceE>
    80001694:	00078863          	beqz	a5,800016a4 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    80001698:	0000d517          	auipc	a0,0xd
    8000169c:	97853503          	ld	a0,-1672(a0) # 8000e010 <_ZN5Timer8instanceE>
    800016a0:	00008067          	ret
Timer& Timer::getInstance(){
    800016a4:	ff010113          	addi	sp,sp,-16
    800016a8:	00113423          	sd	ra,8(sp)
    800016ac:	00813023          	sd	s0,0(sp)
    800016b0:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    800016b4:	0000a697          	auipc	a3,0xa
    800016b8:	99c68693          	addi	a3,a3,-1636 # 8000b050 <CONSOLE_STATUS+0x40>
    800016bc:	02400613          	li	a2,36
    800016c0:	0000a597          	auipc	a1,0xa
    800016c4:	97058593          	addi	a1,a1,-1680 # 8000b030 <CONSOLE_STATUS+0x20>
    800016c8:	0000a517          	auipc	a0,0xa
    800016cc:	9b050513          	addi	a0,a0,-1616 # 8000b078 <CONSOLE_STATUS+0x68>
    800016d0:	00001097          	auipc	ra,0x1
    800016d4:	9a4080e7          	jalr	-1628(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
}
    800016d8:	0000d517          	auipc	a0,0xd
    800016dc:	93853503          	ld	a0,-1736(a0) # 8000e010 <_ZN5Timer8instanceE>
    800016e0:	00813083          	ld	ra,8(sp)
    800016e4:	00013403          	ld	s0,0(sp)
    800016e8:	01010113          	addi	sp,sp,16
    800016ec:	00008067          	ret

00000000800016f0 <_ZN5Timer4tickEv>:

void Timer::tick(){
    800016f0:	fd010113          	addi	sp,sp,-48
    800016f4:	02113423          	sd	ra,40(sp)
    800016f8:	02813023          	sd	s0,32(sp)
    800016fc:	00913c23          	sd	s1,24(sp)
    80001700:	01213823          	sd	s2,16(sp)
    80001704:	01313423          	sd	s3,8(sp)
    80001708:	03010413          	addi	s0,sp,48
    8000170c:	00050913          	mv	s2,a0
    time += 1;
    80001710:	00853783          	ld	a5,8(a0)
    80001714:	00178793          	addi	a5,a5,1
    80001718:	00f53423          	sd	a5,8(a0)
    // if(time % 5 == 0){
    //     putc('T');
    // }
    threadSleepWrapper* current = sleepingHead;
    8000171c:	00053483          	ld	s1,0(a0)
    80001720:	0180006f          	j	80001738 <_ZN5Timer4tickEv+0x48>
        if(current->wakeUpTime <= time){
            current->thread->setSleeping(false);
            Scheduler::put(current->thread);
            threadSleepWrapper* next = current->next;
            if(current == sleepingHead){
                sleepingHead = next;
    80001724:	01393023          	sd	s3,0(s2)
            }
            mem_free(current);
    80001728:	00048513          	mv	a0,s1
    8000172c:	00000097          	auipc	ra,0x0
    80001730:	184080e7          	jalr	388(ra) # 800018b0 <_Z8mem_freePv>
            current = next;
    80001734:	00098493          	mv	s1,s3
    while(current != 0){
    80001738:	02048e63          	beqz	s1,80001774 <_ZN5Timer4tickEv+0x84>
        if(current->wakeUpTime <= time){
    8000173c:	0084b703          	ld	a4,8(s1)
    80001740:	00893783          	ld	a5,8(s2)
    80001744:	02e7e863          	bltu	a5,a4,80001774 <_ZN5Timer4tickEv+0x84>
            current->thread->setSleeping(false);
    80001748:	00000593          	li	a1,0
    8000174c:	0004b503          	ld	a0,0(s1)
    80001750:	00002097          	auipc	ra,0x2
    80001754:	05c080e7          	jalr	92(ra) # 800037ac <_ZN7_thread11setSleepingEb>
            Scheduler::put(current->thread);
    80001758:	0004b503          	ld	a0,0(s1)
    8000175c:	00003097          	auipc	ra,0x3
    80001760:	250080e7          	jalr	592(ra) # 800049ac <_ZN9Scheduler3putEP7_thread>
            threadSleepWrapper* next = current->next;
    80001764:	0104b983          	ld	s3,16(s1)
            if(current == sleepingHead){
    80001768:	00093783          	ld	a5,0(s2)
    8000176c:	fa979ee3          	bne	a5,s1,80001728 <_ZN5Timer4tickEv+0x38>
    80001770:	fb5ff06f          	j	80001724 <_ZN5Timer4tickEv+0x34>
        }else{
            break;
        }
    }
}
    80001774:	02813083          	ld	ra,40(sp)
    80001778:	02013403          	ld	s0,32(sp)
    8000177c:	01813483          	ld	s1,24(sp)
    80001780:	01013903          	ld	s2,16(sp)
    80001784:	00813983          	ld	s3,8(sp)
    80001788:	03010113          	addi	sp,sp,48
    8000178c:	00008067          	ret

0000000080001790 <_ZN5Timer5sleepEm>:

int Timer::sleep(time_t timeToSleep){
    80001790:	fd010113          	addi	sp,sp,-48
    80001794:	02113423          	sd	ra,40(sp)
    80001798:	02813023          	sd	s0,32(sp)
    8000179c:	00913c23          	sd	s1,24(sp)
    800017a0:	01213823          	sd	s2,16(sp)
    800017a4:	01313423          	sd	s3,8(sp)
    800017a8:	03010413          	addi	s0,sp,48
    800017ac:	00050493          	mv	s1,a0
    800017b0:	00058913          	mv	s2,a1
    thread_t thread = _thread::currentThread;
    800017b4:	0000d797          	auipc	a5,0xd
    800017b8:	80c7b783          	ld	a5,-2036(a5) # 8000dfc0 <_GLOBAL_OFFSET_TABLE_+0x48>
    800017bc:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)mem_alloc(sizeof(threadSleepWrapper));
    800017c0:	01800513          	li	a0,24
    800017c4:	00000097          	auipc	ra,0x0
    800017c8:	0bc080e7          	jalr	188(ra) # 80001880 <_Z9mem_allocm>
    newSleepingThread->thread = thread;
    800017cc:	01353023          	sd	s3,0(a0)
    newSleepingThread->wakeUpTime = time + timeToSleep;
    800017d0:	0084b783          	ld	a5,8(s1)
    800017d4:	012785b3          	add	a1,a5,s2
    800017d8:	00b53423          	sd	a1,8(a0)
    newSleepingThread->next = 0;
    800017dc:	00053823          	sd	zero,16(a0)

    if(sleepingHead == 0){
    800017e0:	0004b783          	ld	a5,0(s1)
    800017e4:	04078c63          	beqz	a5,8000183c <_ZN5Timer5sleepEm+0xac>
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
    800017e8:	00078693          	mv	a3,a5
    800017ec:	0107b783          	ld	a5,16(a5)
    800017f0:	00078663          	beqz	a5,800017fc <_ZN5Timer5sleepEm+0x6c>
    800017f4:	0087b703          	ld	a4,8(a5)
    800017f8:	feb768e3          	bltu	a4,a1,800017e8 <_ZN5Timer5sleepEm+0x58>
            current = current->next;
        }
        newSleepingThread->next = current->next;
    800017fc:	00f53823          	sd	a5,16(a0)
        current->next = newSleepingThread;
    80001800:	00a6b823          	sd	a0,16(a3)
    }
    thread->setSleeping(true);
    80001804:	00100593          	li	a1,1
    80001808:	00098513          	mv	a0,s3
    8000180c:	00002097          	auipc	ra,0x2
    80001810:	fa0080e7          	jalr	-96(ra) # 800037ac <_ZN7_thread11setSleepingEb>
    thread_dispatch();
    80001814:	00000097          	auipc	ra,0x0
    80001818:	164080e7          	jalr	356(ra) # 80001978 <_Z15thread_dispatchv>
    return 0;
}
    8000181c:	00000513          	li	a0,0
    80001820:	02813083          	ld	ra,40(sp)
    80001824:	02013403          	ld	s0,32(sp)
    80001828:	01813483          	ld	s1,24(sp)
    8000182c:	01013903          	ld	s2,16(sp)
    80001830:	00813983          	ld	s3,8(sp)
    80001834:	03010113          	addi	sp,sp,48
    80001838:	00008067          	ret
        sleepingHead = newSleepingThread;
    8000183c:	00a4b023          	sd	a0,0(s1)
    80001840:	fc5ff06f          	j	80001804 <_ZN5Timer5sleepEm+0x74>

0000000080001844 <_ZN5Timer17noSleepingThreadsEv>:

bool Timer::noSleepingThreads(){
    80001844:	ff010113          	addi	sp,sp,-16
    80001848:	00813423          	sd	s0,8(sp)
    8000184c:	01010413          	addi	s0,sp,16
    return sleepingHead == 0;
    80001850:	00053503          	ld	a0,0(a0)
}
    80001854:	00153513          	seqz	a0,a0
    80001858:	00813403          	ld	s0,8(sp)
    8000185c:	01010113          	addi	sp,sp,16
    80001860:	00008067          	ret

0000000080001864 <_ZN5Timer7getTimeEv>:

time_t Timer::getTime(){
    80001864:	ff010113          	addi	sp,sp,-16
    80001868:	00813423          	sd	s0,8(sp)
    8000186c:	01010413          	addi	s0,sp,16
    return time;
    80001870:	00853503          	ld	a0,8(a0)
    80001874:	00813403          	ld	s0,8(sp)
    80001878:	01010113          	addi	sp,sp,16
    8000187c:	00008067          	ret

0000000080001880 <_Z9mem_allocm>:
 */

#include "syscall_c.h"
#include "consoleManager.h"

void* mem_alloc ( size_t nSize ){
    80001880:	ff010113          	addi	sp,sp,-16
    80001884:	00813423          	sd	s0,8(sp)
    80001888:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    8000188c:	03f50513          	addi	a0,a0,63
    80001890:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    80001894:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    80001898:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    8000189c:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    800018a0:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    800018a4:	00813403          	ld	s0,8(sp)
    800018a8:	01010113          	addi	sp,sp,16
    800018ac:	00008067          	ret

00000000800018b0 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    800018b0:	ff010113          	addi	sp,sp,-16
    800018b4:	00813423          	sd	s0,8(sp)
    800018b8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    800018bc:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    800018c0:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    800018c4:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    800018c8:	00050513          	mv	a0,a0
    return nResult;

}
    800018cc:	0005051b          	sext.w	a0,a0
    800018d0:	00813403          	ld	s0,8(sp)
    800018d4:	01010113          	addi	sp,sp,16
    800018d8:	00008067          	ret

00000000800018dc <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg ) {
    800018dc:	fd010113          	addi	sp,sp,-48
    800018e0:	02113423          	sd	ra,40(sp)
    800018e4:	02813023          	sd	s0,32(sp)
    800018e8:	00913c23          	sd	s1,24(sp)
    800018ec:	01213823          	sd	s2,16(sp)
    800018f0:	01313423          	sd	s3,8(sp)
    800018f4:	03010413          	addi	s0,sp,48
    800018f8:	00050493          	mv	s1,a0
    800018fc:	00058913          	mv	s2,a1
    80001900:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80001904:	00001537          	lui	a0,0x1
    80001908:	00000097          	auipc	ra,0x0
    8000190c:	f78080e7          	jalr	-136(ra) # 80001880 <_Z9mem_allocm>
    /// now we move the pointer up, since SP points to the first free location, and grows down
    __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space + DEFAULT_STACK_SIZE));
    80001910:	000017b7          	lui	a5,0x1
    80001914:	00f50533          	add	a0,a0,a5
    80001918:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    8000191c:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    80001920:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    80001924:	00048593          	mv	a1,s1
    __asm__ volatile("li a0,0x11");
    80001928:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    8000192c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001930:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001934:	0005051b          	sext.w	a0,a0
    80001938:	02813083          	ld	ra,40(sp)
    8000193c:	02013403          	ld	s0,32(sp)
    80001940:	01813483          	ld	s1,24(sp)
    80001944:	01013903          	ld	s2,16(sp)
    80001948:	00813983          	ld	s3,8(sp)
    8000194c:	03010113          	addi	sp,sp,48
    80001950:	00008067          	ret

0000000080001954 <_Z11thread_exitv>:

int thread_exit (){
    80001954:	ff010113          	addi	sp,sp,-16
    80001958:	00813423          	sd	s0,8(sp)
    8000195c:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    80001960:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80001964:	00000073          	ecall
    return 0;
}
    80001968:	00000513          	li	a0,0
    8000196c:	00813403          	ld	s0,8(sp)
    80001970:	01010113          	addi	sp,sp,16
    80001974:	00008067          	ret

0000000080001978 <_Z15thread_dispatchv>:

void thread_dispatch () {
    80001978:	ff010113          	addi	sp,sp,-16
    8000197c:	00813423          	sd	s0,8(sp)
    80001980:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    80001984:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    80001988:	00000073          	ecall
}
    8000198c:	00813403          	ld	s0,8(sp)
    80001990:	01010113          	addi	sp,sp,16
    80001994:	00008067          	ret

0000000080001998 <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    80001998:	ff010113          	addi	sp,sp,-16
    8000199c:	00813423          	sd	s0,8(sp)
    800019a0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    800019a4:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    800019a8:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    800019ac:	00000073          	ecall
}
    800019b0:	00813403          	ld	s0,8(sp)
    800019b4:	01010113          	addi	sp,sp,16
    800019b8:	00008067          	ret

00000000800019bc <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    800019bc:	ff010113          	addi	sp,sp,-16
    800019c0:	00813423          	sd	s0,8(sp)
    800019c4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    800019c8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    800019cc:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    800019d0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    800019d4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800019d8:	0005051b          	sext.w	a0,a0
    800019dc:	00813403          	ld	s0,8(sp)
    800019e0:	01010113          	addi	sp,sp,16
    800019e4:	00008067          	ret

00000000800019e8 <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    800019e8:	ff010113          	addi	sp,sp,-16
    800019ec:	00813423          	sd	s0,8(sp)
    800019f0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    800019f4:	02059593          	slli	a1,a1,0x20
    800019f8:	0205d593          	srli	a1,a1,0x20
    800019fc:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    80001a00:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    80001a04:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    80001a08:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001a0c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001a10:	0005051b          	sext.w	a0,a0
    80001a14:	00813403          	ld	s0,8(sp)
    80001a18:	01010113          	addi	sp,sp,16
    80001a1c:	00008067          	ret

0000000080001a20 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    80001a20:	ff010113          	addi	sp,sp,-16
    80001a24:	00813423          	sd	s0,8(sp)
    80001a28:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001a2c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    80001a30:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    80001a34:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001a38:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001a3c:	0005051b          	sext.w	a0,a0
    80001a40:	00813403          	ld	s0,8(sp)
    80001a44:	01010113          	addi	sp,sp,16
    80001a48:	00008067          	ret

0000000080001a4c <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    80001a4c:	ff010113          	addi	sp,sp,-16
    80001a50:	00813423          	sd	s0,8(sp)
    80001a54:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001a58:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    80001a5c:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001a60:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001a64:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001a68:	0005051b          	sext.w	a0,a0
    80001a6c:	00813403          	ld	s0,8(sp)
    80001a70:	01010113          	addi	sp,sp,16
    80001a74:	00008067          	ret

0000000080001a78 <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    80001a78:	ff010113          	addi	sp,sp,-16
    80001a7c:	00813423          	sd	s0,8(sp)
    80001a80:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001a84:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    80001a88:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    80001a8c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001a90:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001a94:	0005051b          	sext.w	a0,a0
    80001a98:	00813403          	ld	s0,8(sp)
    80001a9c:	01010113          	addi	sp,sp,16
    80001aa0:	00008067          	ret

0000000080001aa4 <_Z4getcv>:

char getc() {
    80001aa4:	ff010113          	addi	sp,sp,-16
    80001aa8:	00813423          	sd	s0,8(sp)
    80001aac:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    80001ab0:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    80001ab4:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    80001ab8:	00050513          	mv	a0,a0
    return chr;
}
    80001abc:	0ff57513          	andi	a0,a0,255
    80001ac0:	00813403          	ld	s0,8(sp)
    80001ac4:	01010113          	addi	sp,sp,16
    80001ac8:	00008067          	ret

0000000080001acc <_Z4putcc>:

#include "consoleManager.h"

void putc(char chr ) {
    80001acc:	ff010113          	addi	sp,sp,-16
    80001ad0:	00813423          	sd	s0,8(sp)
    80001ad4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    80001ad8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    80001adc:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80001ae0:	00000073          	ecall
    80001ae4:	00813403          	ld	s0,8(sp)
    80001ae8:	01010113          	addi	sp,sp,16
    80001aec:	00008067          	ret

0000000080001af0 <_ZN4_sem4openEPPS_j>:
#include "sem.h"
#include "syscall_c.h"
#include "assert.h"
#include "sched.h"

void _sem::open(_sem** handle, unsigned init){
    80001af0:	fe010113          	addi	sp,sp,-32
    80001af4:	00113c23          	sd	ra,24(sp)
    80001af8:	00813823          	sd	s0,16(sp)
    80001afc:	00913423          	sd	s1,8(sp)
    80001b00:	01213023          	sd	s2,0(sp)
    80001b04:	02010413          	addi	s0,sp,32
    80001b08:	00050493          	mv	s1,a0
    80001b0c:	00058913          	mv	s2,a1
    (*handle) = (sem_t)mem_alloc(sizeof(_sem));
    80001b10:	01800513          	li	a0,24
    80001b14:	00000097          	auipc	ra,0x0
    80001b18:	d6c080e7          	jalr	-660(ra) # 80001880 <_Z9mem_allocm>
    80001b1c:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    80001b20:	00053023          	sd	zero,0(a0) # 1000 <_entry-0x7ffff000>
    (*handle)->blockTail = 0;
    80001b24:	0004b783          	ld	a5,0(s1)
    80001b28:	0007b423          	sd	zero,8(a5) # 1008 <_entry-0x7fffeff8>
    (*handle)->value = init;
    80001b2c:	0004b783          	ld	a5,0(s1)
    80001b30:	0127a823          	sw	s2,16(a5)
}
    80001b34:	01813083          	ld	ra,24(sp)
    80001b38:	01013403          	ld	s0,16(sp)
    80001b3c:	00813483          	ld	s1,8(sp)
    80001b40:	00013903          	ld	s2,0(sp)
    80001b44:	02010113          	addi	sp,sp,32
    80001b48:	00008067          	ret

0000000080001b4c <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    80001b4c:	fe010113          	addi	sp,sp,-32
    80001b50:	00113c23          	sd	ra,24(sp)
    80001b54:	00813823          	sd	s0,16(sp)
    80001b58:	00913423          	sd	s1,8(sp)
    80001b5c:	02010413          	addi	s0,sp,32
    80001b60:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    80001b64:	0004b783          	ld	a5,0(s1)
    80001b68:	02078863          	beqz	a5,80001b98 <_ZN4_sem5closeEPS_+0x4c>
        id->blockHead->pThread->setClosed(true);
    80001b6c:	00100593          	li	a1,1
    80001b70:	0007b503          	ld	a0,0(a5)
    80001b74:	00002097          	auipc	ra,0x2
    80001b78:	c0c080e7          	jalr	-1012(ra) # 80003780 <_ZN7_thread9setClosedEb>
        mem_free(id->blockHead);
    80001b7c:	0004b503          	ld	a0,0(s1)
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	d30080e7          	jalr	-720(ra) # 800018b0 <_Z8mem_freePv>
        id->blockHead = id->blockHead->pNext;
    80001b88:	0004b783          	ld	a5,0(s1)
    80001b8c:	0087b783          	ld	a5,8(a5)
    80001b90:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    80001b94:	fd1ff06f          	j	80001b64 <_ZN4_sem5closeEPS_+0x18>
    }
}
    80001b98:	01813083          	ld	ra,24(sp)
    80001b9c:	01013403          	ld	s0,16(sp)
    80001ba0:	00813483          	ld	s1,8(sp)
    80001ba4:	02010113          	addi	sp,sp,32
    80001ba8:	00008067          	ret

0000000080001bac <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    id->value--;
    80001bac:	01052783          	lw	a5,16(a0)
    80001bb0:	fff7879b          	addiw	a5,a5,-1
    80001bb4:	00f52823          	sw	a5,16(a0)
    if(id->value < 0){
    80001bb8:	02079713          	slli	a4,a5,0x20
    80001bbc:	00074463          	bltz	a4,80001bc4 <_ZN4_sem4waitEPS_+0x18>
    80001bc0:	00008067          	ret
void _sem::wait(sem_t id){
    80001bc4:	fe010113          	addi	sp,sp,-32
    80001bc8:	00113c23          	sd	ra,24(sp)
    80001bcc:	00813823          	sd	s0,16(sp)
    80001bd0:	00913423          	sd	s1,8(sp)
    80001bd4:	02010413          	addi	s0,sp,32
    80001bd8:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)mem_alloc(sizeof(blockedThreadList));
    80001bdc:	01000513          	li	a0,16
    80001be0:	00000097          	auipc	ra,0x0
    80001be4:	ca0080e7          	jalr	-864(ra) # 80001880 <_Z9mem_allocm>
        pNewBlock->pThread = _thread::currentThread;
    80001be8:	0000c797          	auipc	a5,0xc
    80001bec:	3d87b783          	ld	a5,984(a5) # 8000dfc0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001bf0:	0007b783          	ld	a5,0(a5)
    80001bf4:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    80001bf8:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    80001bfc:	0004b783          	ld	a5,0(s1)
    80001c00:	04078263          	beqz	a5,80001c44 <_ZN4_sem4waitEPS_+0x98>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    80001c04:	0084b783          	ld	a5,8(s1)
    80001c08:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    80001c0c:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    80001c10:	00100593          	li	a1,1
    80001c14:	0000c797          	auipc	a5,0xc
    80001c18:	3ac7b783          	ld	a5,940(a5) # 8000dfc0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001c1c:	0007b503          	ld	a0,0(a5)
    80001c20:	00002097          	auipc	ra,0x2
    80001c24:	b30080e7          	jalr	-1232(ra) # 80003750 <_ZN7_thread10setBlockedEb>
        thread_dispatch();
    80001c28:	00000097          	auipc	ra,0x0
    80001c2c:	d50080e7          	jalr	-688(ra) # 80001978 <_Z15thread_dispatchv>
    }
}
    80001c30:	01813083          	ld	ra,24(sp)
    80001c34:	01013403          	ld	s0,16(sp)
    80001c38:	00813483          	ld	s1,8(sp)
    80001c3c:	02010113          	addi	sp,sp,32
    80001c40:	00008067          	ret
            id->blockHead = pNewBlock;
    80001c44:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    80001c48:	00a4b423          	sd	a0,8(s1)
    80001c4c:	fc5ff06f          	j	80001c10 <_ZN4_sem4waitEPS_+0x64>

0000000080001c50 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    id->value++;
    80001c50:	01052783          	lw	a5,16(a0)
    80001c54:	0017879b          	addiw	a5,a5,1
    80001c58:	0007871b          	sext.w	a4,a5
    80001c5c:	00f52823          	sw	a5,16(a0)
    if(id->value <= 0){
    80001c60:	00e05463          	blez	a4,80001c68 <_ZN4_sem6signalEPS_+0x18>
    80001c64:	00008067          	ret
void _sem::signal(sem_t id){
    80001c68:	fe010113          	addi	sp,sp,-32
    80001c6c:	00113c23          	sd	ra,24(sp)
    80001c70:	00813823          	sd	s0,16(sp)
    80001c74:	00913423          	sd	s1,8(sp)
    80001c78:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    80001c7c:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    80001c80:	0084b783          	ld	a5,8(s1)
    80001c84:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    80001c88:	04078063          	beqz	a5,80001cc8 <_ZN4_sem6signalEPS_+0x78>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    80001c8c:	00000593          	li	a1,0
    80001c90:	0004b503          	ld	a0,0(s1)
    80001c94:	00002097          	auipc	ra,0x2
    80001c98:	abc080e7          	jalr	-1348(ra) # 80003750 <_ZN7_thread10setBlockedEb>
        mem_free(pUnblock);
    80001c9c:	00048513          	mv	a0,s1
    80001ca0:	00000097          	auipc	ra,0x0
    80001ca4:	c10080e7          	jalr	-1008(ra) # 800018b0 <_Z8mem_freePv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    80001ca8:	0004b503          	ld	a0,0(s1)
    80001cac:	00003097          	auipc	ra,0x3
    80001cb0:	d00080e7          	jalr	-768(ra) # 800049ac <_ZN9Scheduler3putEP7_thread>
    }
    80001cb4:	01813083          	ld	ra,24(sp)
    80001cb8:	01013403          	ld	s0,16(sp)
    80001cbc:	00813483          	ld	s1,8(sp)
    80001cc0:	02010113          	addi	sp,sp,32
    80001cc4:	00008067          	ret
            id->blockTail = 0;
    80001cc8:	00053423          	sd	zero,8(a0)
    80001ccc:	fc1ff06f          	j	80001c8c <_ZN4_sem6signalEPS_+0x3c>

0000000080001cd0 <main>:
#include "assert.h"
#include "syscall_c.h"
#include "consoleManager.h"

/// @brief first function to be called
void main(){
    80001cd0:	81010113          	addi	sp,sp,-2032
    80001cd4:	7e113423          	sd	ra,2024(sp)
    80001cd8:	7e813023          	sd	s0,2016(sp)
    80001cdc:	7c913c23          	sd	s1,2008(sp)
    80001ce0:	7f010413          	addi	s0,sp,2032
    80001ce4:	f6010113          	addi	sp,sp,-160
    Kernel kernel = Kernel();
    80001ce8:	fffff4b7          	lui	s1,0xfffff
    80001cec:	79848493          	addi	s1,s1,1944 # fffffffffffff798 <end+0xffffffff7fff0498>
    80001cf0:	fe040793          	addi	a5,s0,-32
    80001cf4:	009784b3          	add	s1,a5,s1
    80001cf8:	00048513          	mv	a0,s1
    80001cfc:	00001097          	auipc	ra,0x1
    80001d00:	b28080e7          	jalr	-1240(ra) # 80002824 <_ZN6KernelC1Ev>
    kernel.initialise();
    80001d04:	00048513          	mv	a0,s1
    80001d08:	00001097          	auipc	ra,0x1
    80001d0c:	bc0080e7          	jalr	-1088(ra) # 800028c8 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    80001d10:	00048513          	mv	a0,s1
    80001d14:	00001097          	auipc	ra,0x1
    80001d18:	c10080e7          	jalr	-1008(ra) # 80002924 <_ZN6Kernel3runEv>
    80001d1c:	00050493          	mv	s1,a0
    putc('\n');
    80001d20:	00a00513          	li	a0,10
    80001d24:	00000097          	auipc	ra,0x0
    80001d28:	da8080e7          	jalr	-600(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001d2c:	02d00513          	li	a0,45
    80001d30:	00000097          	auipc	ra,0x0
    80001d34:	d9c080e7          	jalr	-612(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001d38:	02d00513          	li	a0,45
    80001d3c:	00000097          	auipc	ra,0x0
    80001d40:	d90080e7          	jalr	-624(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001d44:	02d00513          	li	a0,45
    80001d48:	00000097          	auipc	ra,0x0
    80001d4c:	d84080e7          	jalr	-636(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001d50:	02d00513          	li	a0,45
    80001d54:	00000097          	auipc	ra,0x0
    80001d58:	d78080e7          	jalr	-648(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001d5c:	02d00513          	li	a0,45
    80001d60:	00000097          	auipc	ra,0x0
    80001d64:	d6c080e7          	jalr	-660(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001d68:	02d00513          	li	a0,45
    80001d6c:	00000097          	auipc	ra,0x0
    80001d70:	d60080e7          	jalr	-672(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001d74:	02d00513          	li	a0,45
    80001d78:	00000097          	auipc	ra,0x0
    80001d7c:	d54080e7          	jalr	-684(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001d80:	02d00513          	li	a0,45
    80001d84:	00000097          	auipc	ra,0x0
    80001d88:	d48080e7          	jalr	-696(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001d8c:	02d00513          	li	a0,45
    80001d90:	00000097          	auipc	ra,0x0
    80001d94:	d3c080e7          	jalr	-708(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001d98:	02d00513          	li	a0,45
    80001d9c:	00000097          	auipc	ra,0x0
    80001da0:	d30080e7          	jalr	-720(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001da4:	02d00513          	li	a0,45
    80001da8:	00000097          	auipc	ra,0x0
    80001dac:	d24080e7          	jalr	-732(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001db0:	02d00513          	li	a0,45
    80001db4:	00000097          	auipc	ra,0x0
    80001db8:	d18080e7          	jalr	-744(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001dbc:	02d00513          	li	a0,45
    80001dc0:	00000097          	auipc	ra,0x0
    80001dc4:	d0c080e7          	jalr	-756(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001dc8:	02d00513          	li	a0,45
    80001dcc:	00000097          	auipc	ra,0x0
    80001dd0:	d00080e7          	jalr	-768(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001dd4:	02d00513          	li	a0,45
    80001dd8:	00000097          	auipc	ra,0x0
    80001ddc:	cf4080e7          	jalr	-780(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001de0:	02d00513          	li	a0,45
    80001de4:	00000097          	auipc	ra,0x0
    80001de8:	ce8080e7          	jalr	-792(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001dec:	02d00513          	li	a0,45
    80001df0:	00000097          	auipc	ra,0x0
    80001df4:	cdc080e7          	jalr	-804(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001df8:	02d00513          	li	a0,45
    80001dfc:	00000097          	auipc	ra,0x0
    80001e00:	cd0080e7          	jalr	-816(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001e04:	02d00513          	li	a0,45
    80001e08:	00000097          	auipc	ra,0x0
    80001e0c:	cc4080e7          	jalr	-828(ra) # 80001acc <_Z4putcc>
    putc('-');
    80001e10:	02d00513          	li	a0,45
    80001e14:	00000097          	auipc	ra,0x0
    80001e18:	cb8080e7          	jalr	-840(ra) # 80001acc <_Z4putcc>
    putc('\n');
    80001e1c:	00a00513          	li	a0,10
    80001e20:	00000097          	auipc	ra,0x0
    80001e24:	cac080e7          	jalr	-852(ra) # 80001acc <_Z4putcc>
    putc('\n');
    80001e28:	00a00513          	li	a0,10
    80001e2c:	00000097          	auipc	ra,0x0
    80001e30:	ca0080e7          	jalr	-864(ra) # 80001acc <_Z4putcc>
    putc('K');
    80001e34:	04b00513          	li	a0,75
    80001e38:	00000097          	auipc	ra,0x0
    80001e3c:	c94080e7          	jalr	-876(ra) # 80001acc <_Z4putcc>
    putc('e');
    80001e40:	06500513          	li	a0,101
    80001e44:	00000097          	auipc	ra,0x0
    80001e48:	c88080e7          	jalr	-888(ra) # 80001acc <_Z4putcc>
    putc('r');
    80001e4c:	07200513          	li	a0,114
    80001e50:	00000097          	auipc	ra,0x0
    80001e54:	c7c080e7          	jalr	-900(ra) # 80001acc <_Z4putcc>
    putc('n');
    80001e58:	06e00513          	li	a0,110
    80001e5c:	00000097          	auipc	ra,0x0
    80001e60:	c70080e7          	jalr	-912(ra) # 80001acc <_Z4putcc>
    putc('e');
    80001e64:	06500513          	li	a0,101
    80001e68:	00000097          	auipc	ra,0x0
    80001e6c:	c64080e7          	jalr	-924(ra) # 80001acc <_Z4putcc>
    putc('l');
    80001e70:	06c00513          	li	a0,108
    80001e74:	00000097          	auipc	ra,0x0
    80001e78:	c58080e7          	jalr	-936(ra) # 80001acc <_Z4putcc>
    putc(' ');
    80001e7c:	02000513          	li	a0,32
    80001e80:	00000097          	auipc	ra,0x0
    80001e84:	c4c080e7          	jalr	-948(ra) # 80001acc <_Z4putcc>
    putc('e');
    80001e88:	06500513          	li	a0,101
    80001e8c:	00000097          	auipc	ra,0x0
    80001e90:	c40080e7          	jalr	-960(ra) # 80001acc <_Z4putcc>
    putc('x');
    80001e94:	07800513          	li	a0,120
    80001e98:	00000097          	auipc	ra,0x0
    80001e9c:	c34080e7          	jalr	-972(ra) # 80001acc <_Z4putcc>
    putc('i');
    80001ea0:	06900513          	li	a0,105
    80001ea4:	00000097          	auipc	ra,0x0
    80001ea8:	c28080e7          	jalr	-984(ra) # 80001acc <_Z4putcc>
    putc('t');
    80001eac:	07400513          	li	a0,116
    80001eb0:	00000097          	auipc	ra,0x0
    80001eb4:	c1c080e7          	jalr	-996(ra) # 80001acc <_Z4putcc>
    putc('e');
    80001eb8:	06500513          	li	a0,101
    80001ebc:	00000097          	auipc	ra,0x0
    80001ec0:	c10080e7          	jalr	-1008(ra) # 80001acc <_Z4putcc>
    putc('d');
    80001ec4:	06400513          	li	a0,100
    80001ec8:	00000097          	auipc	ra,0x0
    80001ecc:	c04080e7          	jalr	-1020(ra) # 80001acc <_Z4putcc>
    putc(' ');
    80001ed0:	02000513          	li	a0,32
    80001ed4:	00000097          	auipc	ra,0x0
    80001ed8:	bf8080e7          	jalr	-1032(ra) # 80001acc <_Z4putcc>
    putc('w');
    80001edc:	07700513          	li	a0,119
    80001ee0:	00000097          	auipc	ra,0x0
    80001ee4:	bec080e7          	jalr	-1044(ra) # 80001acc <_Z4putcc>
    putc('i');
    80001ee8:	06900513          	li	a0,105
    80001eec:	00000097          	auipc	ra,0x0
    80001ef0:	be0080e7          	jalr	-1056(ra) # 80001acc <_Z4putcc>
    putc('t');
    80001ef4:	07400513          	li	a0,116
    80001ef8:	00000097          	auipc	ra,0x0
    80001efc:	bd4080e7          	jalr	-1068(ra) # 80001acc <_Z4putcc>
    putc('h');
    80001f00:	06800513          	li	a0,104
    80001f04:	00000097          	auipc	ra,0x0
    80001f08:	bc8080e7          	jalr	-1080(ra) # 80001acc <_Z4putcc>
    putc(' ');
    80001f0c:	02000513          	li	a0,32
    80001f10:	00000097          	auipc	ra,0x0
    80001f14:	bbc080e7          	jalr	-1092(ra) # 80001acc <_Z4putcc>
    putc('c');
    80001f18:	06300513          	li	a0,99
    80001f1c:	00000097          	auipc	ra,0x0
    80001f20:	bb0080e7          	jalr	-1104(ra) # 80001acc <_Z4putcc>
    putc('o');
    80001f24:	06f00513          	li	a0,111
    80001f28:	00000097          	auipc	ra,0x0
    80001f2c:	ba4080e7          	jalr	-1116(ra) # 80001acc <_Z4putcc>
    putc('d');
    80001f30:	06400513          	li	a0,100
    80001f34:	00000097          	auipc	ra,0x0
    80001f38:	b98080e7          	jalr	-1128(ra) # 80001acc <_Z4putcc>
    putc('e');
    80001f3c:	06500513          	li	a0,101
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	b8c080e7          	jalr	-1140(ra) # 80001acc <_Z4putcc>
    putc(':');
    80001f48:	03a00513          	li	a0,58
    80001f4c:	00000097          	auipc	ra,0x0
    80001f50:	b80080e7          	jalr	-1152(ra) # 80001acc <_Z4putcc>
    switch(exitCode){
    80001f54:	00048e63          	beqz	s1,80001f70 <main+0x2a0>
    80001f58:	00100793          	li	a5,1
    80001f5c:	02f48263          	beq	s1,a5,80001f80 <main+0x2b0>
            break;
        case Kernel::EXIT_FAILURE:
            putc('1');
            break;
        default:
            putc('2');
    80001f60:	03200513          	li	a0,50
    80001f64:	00000097          	auipc	ra,0x0
    80001f68:	b68080e7          	jalr	-1176(ra) # 80001acc <_Z4putcc>
    80001f6c:	0200006f          	j	80001f8c <main+0x2bc>
            putc('0');
    80001f70:	03000513          	li	a0,48
    80001f74:	00000097          	auipc	ra,0x0
    80001f78:	b58080e7          	jalr	-1192(ra) # 80001acc <_Z4putcc>
    80001f7c:	0100006f          	j	80001f8c <main+0x2bc>
            putc('1');
    80001f80:	03100513          	li	a0,49
    80001f84:	00000097          	auipc	ra,0x0
    80001f88:	b48080e7          	jalr	-1208(ra) # 80001acc <_Z4putcc>
            break;
    }
    putc('\n');
    80001f8c:	00a00513          	li	a0,10
    80001f90:	00000097          	auipc	ra,0x0
    80001f94:	b3c080e7          	jalr	-1220(ra) # 80001acc <_Z4putcc>
    ConsoleManager::outputHandler();
    80001f98:	00000097          	auipc	ra,0x0
    80001f9c:	734080e7          	jalr	1844(ra) # 800026cc <_ZN14ConsoleManager13outputHandlerEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001fa0:	02049a63          	bnez	s1,80001fd4 <main+0x304>
    Kernel kernel = Kernel();
    80001fa4:	fffff537          	lui	a0,0xfffff
    80001fa8:	79850513          	addi	a0,a0,1944 # fffffffffffff798 <end+0xffffffff7fff0498>
    80001fac:	fe040793          	addi	a5,s0,-32
    80001fb0:	00a78533          	add	a0,a5,a0
    80001fb4:	00000097          	auipc	ra,0x0
    80001fb8:	070080e7          	jalr	112(ra) # 80002024 <_ZN6KernelD1Ev>
    80001fbc:	0a010113          	addi	sp,sp,160
    80001fc0:	7e813083          	ld	ra,2024(sp)
    80001fc4:	7e013403          	ld	s0,2016(sp)
    80001fc8:	7d813483          	ld	s1,2008(sp)
    80001fcc:	7f010113          	addi	sp,sp,2032
    80001fd0:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80001fd4:	00009697          	auipc	a3,0x9
    80001fd8:	0b468693          	addi	a3,a3,180 # 8000b088 <CONSOLE_STATUS+0x78>
    80001fdc:	05200613          	li	a2,82
    80001fe0:	00009597          	auipc	a1,0x9
    80001fe4:	0b858593          	addi	a1,a1,184 # 8000b098 <CONSOLE_STATUS+0x88>
    80001fe8:	00009517          	auipc	a0,0x9
    80001fec:	0c050513          	addi	a0,a0,192 # 8000b0a8 <CONSOLE_STATUS+0x98>
    80001ff0:	00000097          	auipc	ra,0x0
    80001ff4:	084080e7          	jalr	132(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
    80001ff8:	fadff06f          	j	80001fa4 <main+0x2d4>
    80001ffc:	00050493          	mv	s1,a0
    Kernel kernel = Kernel();
    80002000:	fffff537          	lui	a0,0xfffff
    80002004:	79850513          	addi	a0,a0,1944 # fffffffffffff798 <end+0xffffffff7fff0498>
    80002008:	fe040793          	addi	a5,s0,-32
    8000200c:	00a78533          	add	a0,a5,a0
    80002010:	00000097          	auipc	ra,0x0
    80002014:	014080e7          	jalr	20(ra) # 80002024 <_ZN6KernelD1Ev>
    80002018:	00048513          	mv	a0,s1
    8000201c:	0000d097          	auipc	ra,0xd
    80002020:	14c080e7          	jalr	332(ra) # 8000f168 <_Unwind_Resume>

0000000080002024 <_ZN6KernelD1Ev>:
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    80002024:	fe010113          	addi	sp,sp,-32
    80002028:	00113c23          	sd	ra,24(sp)
    8000202c:	00813823          	sd	s0,16(sp)
    80002030:	00913423          	sd	s1,8(sp)
    80002034:	02010413          	addi	s0,sp,32
    80002038:	00050493          	mv	s1,a0
    8000203c:	02850513          	addi	a0,a0,40
    80002040:	00000097          	auipc	ra,0x0
    80002044:	3e8080e7          	jalr	1000(ra) # 80002428 <_ZN14ConsoleManagerD1Ev>
    80002048:	01848513          	addi	a0,s1,24
    8000204c:	fffff097          	auipc	ra,0xfffff
    80002050:	5f8080e7          	jalr	1528(ra) # 80001644 <_ZN5TimerD1Ev>
    80002054:	00048513          	mv	a0,s1
    80002058:	00002097          	auipc	ra,0x2
    8000205c:	924080e7          	jalr	-1756(ra) # 8000397c <_ZN11HeapManagerD1Ev>
    80002060:	01813083          	ld	ra,24(sp)
    80002064:	01013403          	ld	s0,16(sp)
    80002068:	00813483          	ld	s1,8(sp)
    8000206c:	02010113          	addi	sp,sp,32
    80002070:	00008067          	ret

0000000080002074 <_Z13assert_failedPKcS0_jS0_>:
 * 
 */
#include "assert.h"
#include "syscall_c.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    80002074:	fb010113          	addi	sp,sp,-80
    80002078:	04113423          	sd	ra,72(sp)
    8000207c:	04813023          	sd	s0,64(sp)
    80002080:	02913c23          	sd	s1,56(sp)
    80002084:	03213823          	sd	s2,48(sp)
    80002088:	03313423          	sd	s3,40(sp)
    8000208c:	03413023          	sd	s4,32(sp)
    80002090:	05010413          	addi	s0,sp,80
    80002094:	00050993          	mv	s3,a0
    80002098:	00058493          	mv	s1,a1
    8000209c:	00060913          	mv	s2,a2
    800020a0:	00068a13          	mv	s4,a3
    putc('\n');
    800020a4:	00a00513          	li	a0,10
    800020a8:	00000097          	auipc	ra,0x0
    800020ac:	a24080e7          	jalr	-1500(ra) # 80001acc <_Z4putcc>
    putc('A');
    800020b0:	04100513          	li	a0,65
    800020b4:	00000097          	auipc	ra,0x0
    800020b8:	a18080e7          	jalr	-1512(ra) # 80001acc <_Z4putcc>
    putc('s');
    800020bc:	07300513          	li	a0,115
    800020c0:	00000097          	auipc	ra,0x0
    800020c4:	a0c080e7          	jalr	-1524(ra) # 80001acc <_Z4putcc>
    putc('s');
    800020c8:	07300513          	li	a0,115
    800020cc:	00000097          	auipc	ra,0x0
    800020d0:	a00080e7          	jalr	-1536(ra) # 80001acc <_Z4putcc>
    putc('e');
    800020d4:	06500513          	li	a0,101
    800020d8:	00000097          	auipc	ra,0x0
    800020dc:	9f4080e7          	jalr	-1548(ra) # 80001acc <_Z4putcc>
    putc('r');
    800020e0:	07200513          	li	a0,114
    800020e4:	00000097          	auipc	ra,0x0
    800020e8:	9e8080e7          	jalr	-1560(ra) # 80001acc <_Z4putcc>
    putc('t');
    800020ec:	07400513          	li	a0,116
    800020f0:	00000097          	auipc	ra,0x0
    800020f4:	9dc080e7          	jalr	-1572(ra) # 80001acc <_Z4putcc>
    putc('i');
    800020f8:	06900513          	li	a0,105
    800020fc:	00000097          	auipc	ra,0x0
    80002100:	9d0080e7          	jalr	-1584(ra) # 80001acc <_Z4putcc>
    putc('o');
    80002104:	06f00513          	li	a0,111
    80002108:	00000097          	auipc	ra,0x0
    8000210c:	9c4080e7          	jalr	-1596(ra) # 80001acc <_Z4putcc>
    putc('n');
    80002110:	06e00513          	li	a0,110
    80002114:	00000097          	auipc	ra,0x0
    80002118:	9b8080e7          	jalr	-1608(ra) # 80001acc <_Z4putcc>
    putc(' ');
    8000211c:	02000513          	li	a0,32
    80002120:	00000097          	auipc	ra,0x0
    80002124:	9ac080e7          	jalr	-1620(ra) # 80001acc <_Z4putcc>
    putc('\'');
    80002128:	02700513          	li	a0,39
    8000212c:	00000097          	auipc	ra,0x0
    80002130:	9a0080e7          	jalr	-1632(ra) # 80001acc <_Z4putcc>
    while(*__assertion != 0){
    80002134:	0009c503          	lbu	a0,0(s3)
    80002138:	00050a63          	beqz	a0,8000214c <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    8000213c:	00000097          	auipc	ra,0x0
    80002140:	990080e7          	jalr	-1648(ra) # 80001acc <_Z4putcc>
        __assertion++;
    80002144:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    80002148:	fedff06f          	j	80002134 <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    8000214c:	02700513          	li	a0,39
    80002150:	00000097          	auipc	ra,0x0
    80002154:	97c080e7          	jalr	-1668(ra) # 80001acc <_Z4putcc>
    putc(' ');
    80002158:	02000513          	li	a0,32
    8000215c:	00000097          	auipc	ra,0x0
    80002160:	970080e7          	jalr	-1680(ra) # 80001acc <_Z4putcc>
    putc('f');
    80002164:	06600513          	li	a0,102
    80002168:	00000097          	auipc	ra,0x0
    8000216c:	964080e7          	jalr	-1692(ra) # 80001acc <_Z4putcc>
    putc('a');
    80002170:	06100513          	li	a0,97
    80002174:	00000097          	auipc	ra,0x0
    80002178:	958080e7          	jalr	-1704(ra) # 80001acc <_Z4putcc>
    putc('i');
    8000217c:	06900513          	li	a0,105
    80002180:	00000097          	auipc	ra,0x0
    80002184:	94c080e7          	jalr	-1716(ra) # 80001acc <_Z4putcc>
    putc('l');
    80002188:	06c00513          	li	a0,108
    8000218c:	00000097          	auipc	ra,0x0
    80002190:	940080e7          	jalr	-1728(ra) # 80001acc <_Z4putcc>
    putc('e');
    80002194:	06500513          	li	a0,101
    80002198:	00000097          	auipc	ra,0x0
    8000219c:	934080e7          	jalr	-1740(ra) # 80001acc <_Z4putcc>
    putc('d');
    800021a0:	06400513          	li	a0,100
    800021a4:	00000097          	auipc	ra,0x0
    800021a8:	928080e7          	jalr	-1752(ra) # 80001acc <_Z4putcc>
    putc(' ');
    800021ac:	02000513          	li	a0,32
    800021b0:	00000097          	auipc	ra,0x0
    800021b4:	91c080e7          	jalr	-1764(ra) # 80001acc <_Z4putcc>
    putc('i');
    800021b8:	06900513          	li	a0,105
    800021bc:	00000097          	auipc	ra,0x0
    800021c0:	910080e7          	jalr	-1776(ra) # 80001acc <_Z4putcc>
    putc('n');
    800021c4:	06e00513          	li	a0,110
    800021c8:	00000097          	auipc	ra,0x0
    800021cc:	904080e7          	jalr	-1788(ra) # 80001acc <_Z4putcc>
    putc(' ');
    800021d0:	02000513          	li	a0,32
    800021d4:	00000097          	auipc	ra,0x0
    800021d8:	8f8080e7          	jalr	-1800(ra) # 80001acc <_Z4putcc>
    putc('f');
    800021dc:	06600513          	li	a0,102
    800021e0:	00000097          	auipc	ra,0x0
    800021e4:	8ec080e7          	jalr	-1812(ra) # 80001acc <_Z4putcc>
    putc('i');
    800021e8:	06900513          	li	a0,105
    800021ec:	00000097          	auipc	ra,0x0
    800021f0:	8e0080e7          	jalr	-1824(ra) # 80001acc <_Z4putcc>
    putc('l');
    800021f4:	06c00513          	li	a0,108
    800021f8:	00000097          	auipc	ra,0x0
    800021fc:	8d4080e7          	jalr	-1836(ra) # 80001acc <_Z4putcc>
    putc('e');
    80002200:	06500513          	li	a0,101
    80002204:	00000097          	auipc	ra,0x0
    80002208:	8c8080e7          	jalr	-1848(ra) # 80001acc <_Z4putcc>
    putc(':');
    8000220c:	03a00513          	li	a0,58
    80002210:	00000097          	auipc	ra,0x0
    80002214:	8bc080e7          	jalr	-1860(ra) # 80001acc <_Z4putcc>
    putc(' ');
    80002218:	02000513          	li	a0,32
    8000221c:	00000097          	auipc	ra,0x0
    80002220:	8b0080e7          	jalr	-1872(ra) # 80001acc <_Z4putcc>
    while(*__file != 0){
    80002224:	0004c503          	lbu	a0,0(s1)
    80002228:	00050a63          	beqz	a0,8000223c <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    8000222c:	00000097          	auipc	ra,0x0
    80002230:	8a0080e7          	jalr	-1888(ra) # 80001acc <_Z4putcc>
        __file++;
    80002234:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80002238:	fedff06f          	j	80002224 <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    8000223c:	00a00513          	li	a0,10
    80002240:	00000097          	auipc	ra,0x0
    80002244:	88c080e7          	jalr	-1908(ra) # 80001acc <_Z4putcc>
    putc('l');
    80002248:	06c00513          	li	a0,108
    8000224c:	00000097          	auipc	ra,0x0
    80002250:	880080e7          	jalr	-1920(ra) # 80001acc <_Z4putcc>
    putc('i');
    80002254:	06900513          	li	a0,105
    80002258:	00000097          	auipc	ra,0x0
    8000225c:	874080e7          	jalr	-1932(ra) # 80001acc <_Z4putcc>
    putc('n');
    80002260:	06e00513          	li	a0,110
    80002264:	00000097          	auipc	ra,0x0
    80002268:	868080e7          	jalr	-1944(ra) # 80001acc <_Z4putcc>
    putc('e');
    8000226c:	06500513          	li	a0,101
    80002270:	00000097          	auipc	ra,0x0
    80002274:	85c080e7          	jalr	-1956(ra) # 80001acc <_Z4putcc>
    putc(':');
    80002278:	03a00513          	li	a0,58
    8000227c:	00000097          	auipc	ra,0x0
    80002280:	850080e7          	jalr	-1968(ra) # 80001acc <_Z4putcc>
    putc(' ');
    80002284:	02000513          	li	a0,32
    80002288:	00000097          	auipc	ra,0x0
    8000228c:	844080e7          	jalr	-1980(ra) # 80001acc <_Z4putcc>
    char buffer[20];
    int i = 0;
    80002290:	00000493          	li	s1,0
    while(__line != 0){
    80002294:	02090463          	beqz	s2,800022bc <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80002298:	00a00713          	li	a4,10
    8000229c:	02e977bb          	remuw	a5,s2,a4
    800022a0:	0307879b          	addiw	a5,a5,48
    800022a4:	fd040693          	addi	a3,s0,-48
    800022a8:	009686b3          	add	a3,a3,s1
    800022ac:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    800022b0:	02e9593b          	divuw	s2,s2,a4
        i++;
    800022b4:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    800022b8:	fddff06f          	j	80002294 <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    800022bc:	02048063          	beqz	s1,800022dc <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    800022c0:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    800022c4:	fd040793          	addi	a5,s0,-48
    800022c8:	009787b3          	add	a5,a5,s1
    800022cc:	fe87c503          	lbu	a0,-24(a5)
    800022d0:	fffff097          	auipc	ra,0xfffff
    800022d4:	7fc080e7          	jalr	2044(ra) # 80001acc <_Z4putcc>
    800022d8:	fe5ff06f          	j	800022bc <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    800022dc:	00a00513          	li	a0,10
    800022e0:	fffff097          	auipc	ra,0xfffff
    800022e4:	7ec080e7          	jalr	2028(ra) # 80001acc <_Z4putcc>
    putc('f');
    800022e8:	06600513          	li	a0,102
    800022ec:	fffff097          	auipc	ra,0xfffff
    800022f0:	7e0080e7          	jalr	2016(ra) # 80001acc <_Z4putcc>
    putc('u');
    800022f4:	07500513          	li	a0,117
    800022f8:	fffff097          	auipc	ra,0xfffff
    800022fc:	7d4080e7          	jalr	2004(ra) # 80001acc <_Z4putcc>
    putc('n');
    80002300:	06e00513          	li	a0,110
    80002304:	fffff097          	auipc	ra,0xfffff
    80002308:	7c8080e7          	jalr	1992(ra) # 80001acc <_Z4putcc>
    putc('c');
    8000230c:	06300513          	li	a0,99
    80002310:	fffff097          	auipc	ra,0xfffff
    80002314:	7bc080e7          	jalr	1980(ra) # 80001acc <_Z4putcc>
    putc('t');
    80002318:	07400513          	li	a0,116
    8000231c:	fffff097          	auipc	ra,0xfffff
    80002320:	7b0080e7          	jalr	1968(ra) # 80001acc <_Z4putcc>
    putc('i');
    80002324:	06900513          	li	a0,105
    80002328:	fffff097          	auipc	ra,0xfffff
    8000232c:	7a4080e7          	jalr	1956(ra) # 80001acc <_Z4putcc>
    putc('o');
    80002330:	06f00513          	li	a0,111
    80002334:	fffff097          	auipc	ra,0xfffff
    80002338:	798080e7          	jalr	1944(ra) # 80001acc <_Z4putcc>
    putc('n');
    8000233c:	06e00513          	li	a0,110
    80002340:	fffff097          	auipc	ra,0xfffff
    80002344:	78c080e7          	jalr	1932(ra) # 80001acc <_Z4putcc>
    putc(':');
    80002348:	03a00513          	li	a0,58
    8000234c:	fffff097          	auipc	ra,0xfffff
    80002350:	780080e7          	jalr	1920(ra) # 80001acc <_Z4putcc>
    putc(' ');
    80002354:	02000513          	li	a0,32
    80002358:	fffff097          	auipc	ra,0xfffff
    8000235c:	774080e7          	jalr	1908(ra) # 80001acc <_Z4putcc>
    putc('\'');
    80002360:	02700513          	li	a0,39
    80002364:	fffff097          	auipc	ra,0xfffff
    80002368:	768080e7          	jalr	1896(ra) # 80001acc <_Z4putcc>
    while(*__function != 0){
    8000236c:	000a4503          	lbu	a0,0(s4)
    80002370:	00050a63          	beqz	a0,80002384 <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    80002374:	fffff097          	auipc	ra,0xfffff
    80002378:	758080e7          	jalr	1880(ra) # 80001acc <_Z4putcc>
        __function ++;
    8000237c:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80002380:	fedff06f          	j	8000236c <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    80002384:	02700513          	li	a0,39
    80002388:	fffff097          	auipc	ra,0xfffff
    8000238c:	744080e7          	jalr	1860(ra) # 80001acc <_Z4putcc>
    putc('\n');
    80002390:	00a00513          	li	a0,10
    80002394:	fffff097          	auipc	ra,0xfffff
    80002398:	738080e7          	jalr	1848(ra) # 80001acc <_Z4putcc>
    while(1);
    8000239c:	0000006f          	j	8000239c <_Z13assert_failedPKcS0_jS0_+0x328>

00000000800023a0 <_ZN14ConsoleManagerC1Ev>:
#include "syscall_c.h"
#include "assert.h"

ConsoleManager* ConsoleManager::instance = 0;

ConsoleManager::ConsoleManager(){
    800023a0:	fe010113          	addi	sp,sp,-32
    800023a4:	00113c23          	sd	ra,24(sp)
    800023a8:	00813823          	sd	s0,16(sp)
    800023ac:	00913423          	sd	s1,8(sp)
    800023b0:	02010413          	addi	s0,sp,32
    800023b4:	00050493          	mv	s1,a0
    
    sem_t inSem;

    struct consoleBuffer{
    public:
        consoleBuffer(): head(0), tail(0), size(0){}
    800023b8:	40053423          	sd	zero,1032(a0)
    800023bc:	40053823          	sd	zero,1040(a0)
    800023c0:	40053c23          	sd	zero,1048(a0)
    800023c4:	000017b7          	lui	a5,0x1
    800023c8:	00f507b3          	add	a5,a0,a5
    800023cc:	8207b023          	sd	zero,-2016(a5) # 820 <_entry-0x7ffff7e0>
    800023d0:	8207b423          	sd	zero,-2008(a5)
    800023d4:	8207b823          	sd	zero,-2000(a5)
    assert(instance == 0);
    800023d8:	0000c797          	auipc	a5,0xc
    800023dc:	c407b783          	ld	a5,-960(a5) # 8000e018 <_ZN14ConsoleManager8instanceE>
    800023e0:	02079063          	bnez	a5,80002400 <_ZN14ConsoleManagerC1Ev+0x60>
    instance = this;
    800023e4:	0000c797          	auipc	a5,0xc
    800023e8:	c297ba23          	sd	s1,-972(a5) # 8000e018 <_ZN14ConsoleManager8instanceE>
}
    800023ec:	01813083          	ld	ra,24(sp)
    800023f0:	01013403          	ld	s0,16(sp)
    800023f4:	00813483          	ld	s1,8(sp)
    800023f8:	02010113          	addi	sp,sp,32
    800023fc:	00008067          	ret
    assert(instance == 0);
    80002400:	00009697          	auipc	a3,0x9
    80002404:	cd068693          	addi	a3,a3,-816 # 8000b0d0 <CONSOLE_STATUS+0xc0>
    80002408:	01300613          	li	a2,19
    8000240c:	00009597          	auipc	a1,0x9
    80002410:	cec58593          	addi	a1,a1,-788 # 8000b0f8 <CONSOLE_STATUS+0xe8>
    80002414:	00009517          	auipc	a0,0x9
    80002418:	c2c50513          	addi	a0,a0,-980 # 8000b040 <CONSOLE_STATUS+0x30>
    8000241c:	00000097          	auipc	ra,0x0
    80002420:	c58080e7          	jalr	-936(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
    80002424:	fc1ff06f          	j	800023e4 <_ZN14ConsoleManagerC1Ev+0x44>

0000000080002428 <_ZN14ConsoleManagerD1Ev>:

ConsoleManager::~ConsoleManager(){
    80002428:	ff010113          	addi	sp,sp,-16
    8000242c:	00113423          	sd	ra,8(sp)
    80002430:	00813023          	sd	s0,0(sp)
    80002434:	01010413          	addi	s0,sp,16
    sem_close(inSem);
    80002438:	00053503          	ld	a0,0(a0)
    8000243c:	fffff097          	auipc	ra,0xfffff
    80002440:	5e4080e7          	jalr	1508(ra) # 80001a20 <_Z9sem_closeP4_sem>
}
    80002444:	00813083          	ld	ra,8(sp)
    80002448:	00013403          	ld	s0,0(sp)
    8000244c:	01010113          	addi	sp,sp,16
    80002450:	00008067          	ret

0000000080002454 <_ZN14ConsoleManager4initEv>:

void ConsoleManager::init(){
    80002454:	fe010113          	addi	sp,sp,-32
    80002458:	00113c23          	sd	ra,24(sp)
    8000245c:	00813823          	sd	s0,16(sp)
    80002460:	00913423          	sd	s1,8(sp)
    80002464:	02010413          	addi	s0,sp,32
    80002468:	00050493          	mv	s1,a0
    sem_open(&inSem, 0);
    8000246c:	00000593          	li	a1,0
    80002470:	fffff097          	auipc	ra,0xfffff
    80002474:	578080e7          	jalr	1400(ra) # 800019e8 <_Z8sem_openPP4_semj>
    waitingThreads = 0;
    80002478:	00001537          	lui	a0,0x1
    8000247c:	00a484b3          	add	s1,s1,a0
    80002480:	8204ac23          	sw	zero,-1992(s1)
}
    80002484:	01813083          	ld	ra,24(sp)
    80002488:	01013403          	ld	s0,16(sp)
    8000248c:	00813483          	ld	s1,8(sp)
    80002490:	02010113          	addi	sp,sp,32
    80002494:	00008067          	ret

0000000080002498 <_ZN14ConsoleManager11getInstanceEv>:

ConsoleManager& ConsoleManager::getInstance(){
    assert(instance != 0);
    80002498:	0000c797          	auipc	a5,0xc
    8000249c:	b807b783          	ld	a5,-1152(a5) # 8000e018 <_ZN14ConsoleManager8instanceE>
    800024a0:	00078863          	beqz	a5,800024b0 <_ZN14ConsoleManager11getInstanceEv+0x18>
    return *instance;
}
    800024a4:	0000c517          	auipc	a0,0xc
    800024a8:	b7453503          	ld	a0,-1164(a0) # 8000e018 <_ZN14ConsoleManager8instanceE>
    800024ac:	00008067          	ret
ConsoleManager& ConsoleManager::getInstance(){
    800024b0:	ff010113          	addi	sp,sp,-16
    800024b4:	00113423          	sd	ra,8(sp)
    800024b8:	00813023          	sd	s0,0(sp)
    800024bc:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    800024c0:	00009697          	auipc	a3,0x9
    800024c4:	c4868693          	addi	a3,a3,-952 # 8000b108 <CONSOLE_STATUS+0xf8>
    800024c8:	02100613          	li	a2,33
    800024cc:	00009597          	auipc	a1,0x9
    800024d0:	c2c58593          	addi	a1,a1,-980 # 8000b0f8 <CONSOLE_STATUS+0xe8>
    800024d4:	00009517          	auipc	a0,0x9
    800024d8:	ba450513          	addi	a0,a0,-1116 # 8000b078 <CONSOLE_STATUS+0x68>
    800024dc:	00000097          	auipc	ra,0x0
    800024e0:	b98080e7          	jalr	-1128(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
}
    800024e4:	0000c517          	auipc	a0,0xc
    800024e8:	b3453503          	ld	a0,-1228(a0) # 8000e018 <_ZN14ConsoleManager8instanceE>
    800024ec:	00813083          	ld	ra,8(sp)
    800024f0:	00013403          	ld	s0,0(sp)
    800024f4:	01010113          	addi	sp,sp,16
    800024f8:	00008067          	ret

00000000800024fc <_ZN14ConsoleManager13consoleBuffer3putEc>:

void ConsoleManager::consoleBuffer::put(char c){
    800024fc:	ff010113          	addi	sp,sp,-16
    80002500:	00813423          	sd	s0,8(sp)
    80002504:	01010413          	addi	s0,sp,16
    buffer[tail] = c;
    80002508:	40853783          	ld	a5,1032(a0)
    8000250c:	00f50733          	add	a4,a0,a5
    80002510:	00b70023          	sb	a1,0(a4)
    tail = (tail + 1) % BUFFER_SIZE;
    80002514:	00178793          	addi	a5,a5,1
    80002518:	3ff7f793          	andi	a5,a5,1023
    8000251c:	40f53423          	sd	a5,1032(a0)
    size++;
    80002520:	41053783          	ld	a5,1040(a0)
    80002524:	00178793          	addi	a5,a5,1
    80002528:	40f53823          	sd	a5,1040(a0)
}
    8000252c:	00813403          	ld	s0,8(sp)
    80002530:	01010113          	addi	sp,sp,16
    80002534:	00008067          	ret

0000000080002538 <_ZN14ConsoleManager13consoleBuffer3getEv>:

char ConsoleManager::consoleBuffer::get(){
    80002538:	ff010113          	addi	sp,sp,-16
    8000253c:	00813423          	sd	s0,8(sp)
    80002540:	01010413          	addi	s0,sp,16
    80002544:	00050793          	mv	a5,a0
    char c = buffer[head];
    80002548:	40053703          	ld	a4,1024(a0)
    8000254c:	00e506b3          	add	a3,a0,a4
    80002550:	0006c503          	lbu	a0,0(a3)
    head = (head + 1) % BUFFER_SIZE;
    80002554:	00170713          	addi	a4,a4,1
    80002558:	3ff77713          	andi	a4,a4,1023
    8000255c:	40e7b023          	sd	a4,1024(a5)
    size--;
    80002560:	4107b703          	ld	a4,1040(a5)
    80002564:	fff70713          	addi	a4,a4,-1
    80002568:	40e7b823          	sd	a4,1040(a5)
    return c;
}
    8000256c:	00813403          	ld	s0,8(sp)
    80002570:	01010113          	addi	sp,sp,16
    80002574:	00008067          	ret

0000000080002578 <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>:

bool ConsoleManager::consoleBuffer::isEmpty(){
    80002578:	ff010113          	addi	sp,sp,-16
    8000257c:	00813423          	sd	s0,8(sp)
    80002580:	01010413          	addi	s0,sp,16
    return size == 0;
    80002584:	41053503          	ld	a0,1040(a0)
}
    80002588:	00153513          	seqz	a0,a0
    8000258c:	00813403          	ld	s0,8(sp)
    80002590:	01010113          	addi	sp,sp,16
    80002594:	00008067          	ret

0000000080002598 <_ZN14ConsoleManager13consoleBuffer6isFullEv>:

bool ConsoleManager::consoleBuffer::isFull(){
    80002598:	ff010113          	addi	sp,sp,-16
    8000259c:	00813423          	sd	s0,8(sp)
    800025a0:	01010413          	addi	s0,sp,16
    return size == BUFFER_SIZE;
    800025a4:	41053503          	ld	a0,1040(a0)
    800025a8:	c0050513          	addi	a0,a0,-1024
}
    800025ac:	00153513          	seqz	a0,a0
    800025b0:	00813403          	ld	s0,8(sp)
    800025b4:	01010113          	addi	sp,sp,16
    800025b8:	00008067          	ret

00000000800025bc <_ZN14ConsoleManager4putcEc>:

void ConsoleManager::putc(char c){
    800025bc:	ff010113          	addi	sp,sp,-16
    800025c0:	00113423          	sd	ra,8(sp)
    800025c4:	00813023          	sd	s0,0(sp)
    800025c8:	01010413          	addi	s0,sp,16
    800025cc:	00050593          	mv	a1,a0
    instance->outBuffer.put(c);
    800025d0:	0000c517          	auipc	a0,0xc
    800025d4:	a4853503          	ld	a0,-1464(a0) # 8000e018 <_ZN14ConsoleManager8instanceE>
    800025d8:	42050513          	addi	a0,a0,1056
    800025dc:	00000097          	auipc	ra,0x0
    800025e0:	f20080e7          	jalr	-224(ra) # 800024fc <_ZN14ConsoleManager13consoleBuffer3putEc>
}
    800025e4:	00813083          	ld	ra,8(sp)
    800025e8:	00013403          	ld	s0,0(sp)
    800025ec:	01010113          	addi	sp,sp,16
    800025f0:	00008067          	ret

00000000800025f4 <_ZN14ConsoleManager4getcEv>:

char ConsoleManager::getc(){
    800025f4:	fe010113          	addi	sp,sp,-32
    800025f8:	00113c23          	sd	ra,24(sp)
    800025fc:	00813823          	sd	s0,16(sp)
    80002600:	00913423          	sd	s1,8(sp)
    80002604:	01213023          	sd	s2,0(sp)
    80002608:	02010413          	addi	s0,sp,32
    instance->waitingThreads++;
    8000260c:	0000c917          	auipc	s2,0xc
    80002610:	a0c90913          	addi	s2,s2,-1524 # 8000e018 <_ZN14ConsoleManager8instanceE>
    80002614:	00093703          	ld	a4,0(s2)
    80002618:	000014b7          	lui	s1,0x1
    8000261c:	009706b3          	add	a3,a4,s1
    80002620:	8386a783          	lw	a5,-1992(a3)
    80002624:	0017879b          	addiw	a5,a5,1
    80002628:	82f6ac23          	sw	a5,-1992(a3)
    sem_wait(instance->inSem);
    8000262c:	00073503          	ld	a0,0(a4)
    80002630:	fffff097          	auipc	ra,0xfffff
    80002634:	41c080e7          	jalr	1052(ra) # 80001a4c <_Z8sem_waitP4_sem>
    instance->waitingThreads--;
    80002638:	00093503          	ld	a0,0(s2)
    8000263c:	009504b3          	add	s1,a0,s1
    80002640:	8384a783          	lw	a5,-1992(s1) # 838 <_entry-0x7ffff7c8>
    80002644:	fff7879b          	addiw	a5,a5,-1
    80002648:	82f4ac23          	sw	a5,-1992(s1)
    return instance->inBuffer.get();
    8000264c:	00850513          	addi	a0,a0,8
    80002650:	00000097          	auipc	ra,0x0
    80002654:	ee8080e7          	jalr	-280(ra) # 80002538 <_ZN14ConsoleManager13consoleBuffer3getEv>
}
    80002658:	01813083          	ld	ra,24(sp)
    8000265c:	01013403          	ld	s0,16(sp)
    80002660:	00813483          	ld	s1,8(sp)
    80002664:	00013903          	ld	s2,0(sp)
    80002668:	02010113          	addi	sp,sp,32
    8000266c:	00008067          	ret

0000000080002670 <_ZN14ConsoleManager8finishedEv>:

bool ConsoleManager::finished(){
    80002670:	fe010113          	addi	sp,sp,-32
    80002674:	00113c23          	sd	ra,24(sp)
    80002678:	00813823          	sd	s0,16(sp)
    8000267c:	00913423          	sd	s1,8(sp)
    80002680:	02010413          	addi	s0,sp,32
    return instance->outBuffer.isEmpty() && instance->waitingThreads == 0;
    80002684:	0000c497          	auipc	s1,0xc
    80002688:	9944b483          	ld	s1,-1644(s1) # 8000e018 <_ZN14ConsoleManager8instanceE>
    8000268c:	42048513          	addi	a0,s1,1056
    80002690:	00000097          	auipc	ra,0x0
    80002694:	ee8080e7          	jalr	-280(ra) # 80002578 <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>
    80002698:	00050e63          	beqz	a0,800026b4 <_ZN14ConsoleManager8finishedEv+0x44>
    8000269c:	000017b7          	lui	a5,0x1
    800026a0:	00f484b3          	add	s1,s1,a5
    800026a4:	8384a783          	lw	a5,-1992(s1)
    800026a8:	00078863          	beqz	a5,800026b8 <_ZN14ConsoleManager8finishedEv+0x48>
    800026ac:	00000513          	li	a0,0
    800026b0:	0080006f          	j	800026b8 <_ZN14ConsoleManager8finishedEv+0x48>
    800026b4:	00000513          	li	a0,0
}
    800026b8:	01813083          	ld	ra,24(sp)
    800026bc:	01013403          	ld	s0,16(sp)
    800026c0:	00813483          	ld	s1,8(sp)
    800026c4:	02010113          	addi	sp,sp,32
    800026c8:	00008067          	ret

00000000800026cc <_ZN14ConsoleManager13outputHandlerEv>:

void ConsoleManager::outputHandler(){
    // while(!instance->outBuffer.isEmpty()){
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
    800026cc:	0000c797          	auipc	a5,0xc
    800026d0:	8bc7b783          	ld	a5,-1860(a5) # 8000df88 <_GLOBAL_OFFSET_TABLE_+0x10>
    800026d4:	0007b783          	ld	a5,0(a5)
    800026d8:	0007c783          	lbu	a5,0(a5)
    800026dc:	0207f793          	andi	a5,a5,32
    800026e0:	08078263          	beqz	a5,80002764 <_ZN14ConsoleManager13outputHandlerEv+0x98>
void ConsoleManager::outputHandler(){
    800026e4:	fe010113          	addi	sp,sp,-32
    800026e8:	00113c23          	sd	ra,24(sp)
    800026ec:	00813823          	sd	s0,16(sp)
    800026f0:	00913423          	sd	s1,8(sp)
    800026f4:	01213023          	sd	s2,0(sp)
    800026f8:	02010413          	addi	s0,sp,32
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
    800026fc:	0000c497          	auipc	s1,0xc
    80002700:	91c4b483          	ld	s1,-1764(s1) # 8000e018 <_ZN14ConsoleManager8instanceE>
    80002704:	42048493          	addi	s1,s1,1056
    80002708:	00048513          	mv	a0,s1
    8000270c:	00000097          	auipc	ra,0x0
    80002710:	e6c080e7          	jalr	-404(ra) # 80002578 <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>
    80002714:	02051c63          	bnez	a0,8000274c <_ZN14ConsoleManager13outputHandlerEv+0x80>
            (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
    80002718:	0000c797          	auipc	a5,0xc
    8000271c:	8807b783          	ld	a5,-1920(a5) # 8000df98 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002720:	0007b903          	ld	s2,0(a5)
    80002724:	00048513          	mv	a0,s1
    80002728:	00000097          	auipc	ra,0x0
    8000272c:	e10080e7          	jalr	-496(ra) # 80002538 <_ZN14ConsoleManager13consoleBuffer3getEv>
    80002730:	00a90023          	sb	a0,0(s2)
        while((*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT) && !instance->outBuffer.isEmpty()){
    80002734:	0000c797          	auipc	a5,0xc
    80002738:	8547b783          	ld	a5,-1964(a5) # 8000df88 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000273c:	0007b783          	ld	a5,0(a5)
    80002740:	0007c783          	lbu	a5,0(a5)
    80002744:	0207f793          	andi	a5,a5,32
    80002748:	fa079ae3          	bnez	a5,800026fc <_ZN14ConsoleManager13outputHandlerEv+0x30>
        }
    // }
}
    8000274c:	01813083          	ld	ra,24(sp)
    80002750:	01013403          	ld	s0,16(sp)
    80002754:	00813483          	ld	s1,8(sp)
    80002758:	00013903          	ld	s2,0(sp)
    8000275c:	02010113          	addi	sp,sp,32
    80002760:	00008067          	ret
    80002764:	00008067          	ret

0000000080002768 <_ZN14ConsoleManager12inputHandlerEv>:

void ConsoleManager::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80002768:	0000c797          	auipc	a5,0xc
    8000276c:	8207b783          	ld	a5,-2016(a5) # 8000df88 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002770:	0007b783          	ld	a5,0(a5)
    80002774:	0007c783          	lbu	a5,0(a5)
    80002778:	0017f793          	andi	a5,a5,1
    8000277c:	06078e63          	beqz	a5,800027f8 <_ZN14ConsoleManager12inputHandlerEv+0x90>
void ConsoleManager::inputHandler(){
    80002780:	fe010113          	addi	sp,sp,-32
    80002784:	00113c23          	sd	ra,24(sp)
    80002788:	00813823          	sd	s0,16(sp)
    8000278c:	00913423          	sd	s1,8(sp)
    80002790:	02010413          	addi	s0,sp,32
        char ch =(*(char*)CONSOLE_RX_DATA);
    80002794:	0000b797          	auipc	a5,0xb
    80002798:	7ec7b783          	ld	a5,2028(a5) # 8000df80 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000279c:	0007b783          	ld	a5,0(a5)
        instance->inBuffer.put(ch);
    800027a0:	0000c497          	auipc	s1,0xc
    800027a4:	87848493          	addi	s1,s1,-1928 # 8000e018 <_ZN14ConsoleManager8instanceE>
    800027a8:	0004b503          	ld	a0,0(s1)
    800027ac:	0007c583          	lbu	a1,0(a5)
    800027b0:	00850513          	addi	a0,a0,8
    800027b4:	00000097          	auipc	ra,0x0
    800027b8:	d48080e7          	jalr	-696(ra) # 800024fc <_ZN14ConsoleManager13consoleBuffer3putEc>
        sem_signal(instance->inSem);
    800027bc:	0004b783          	ld	a5,0(s1)
    800027c0:	0007b503          	ld	a0,0(a5)
    800027c4:	fffff097          	auipc	ra,0xfffff
    800027c8:	2b4080e7          	jalr	692(ra) # 80001a78 <_Z10sem_signalP4_sem>
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    800027cc:	0000b797          	auipc	a5,0xb
    800027d0:	7bc7b783          	ld	a5,1980(a5) # 8000df88 <_GLOBAL_OFFSET_TABLE_+0x10>
    800027d4:	0007b783          	ld	a5,0(a5)
    800027d8:	0007c783          	lbu	a5,0(a5)
    800027dc:	0017f793          	andi	a5,a5,1
    800027e0:	fa079ae3          	bnez	a5,80002794 <_ZN14ConsoleManager12inputHandlerEv+0x2c>
    }
    800027e4:	01813083          	ld	ra,24(sp)
    800027e8:	01013403          	ld	s0,16(sp)
    800027ec:	00813483          	ld	s1,8(sp)
    800027f0:	02010113          	addi	sp,sp,32
    800027f4:	00008067          	ret
    800027f8:	00008067          	ret

00000000800027fc <_Z4testPv>:
    /// initialise the console
    console.getInstance().init();
    return;
}

void test(void* arg){
    800027fc:	ff010113          	addi	sp,sp,-16
    80002800:	00113423          	sd	ra,8(sp)
    80002804:	00813023          	sd	s0,0(sp)
    80002808:	01010413          	addi	s0,sp,16
    userMain();
    8000280c:	00005097          	auipc	ra,0x5
    80002810:	fb4080e7          	jalr	-76(ra) # 800077c0 <_Z8userMainv>
}
    80002814:	00813083          	ld	ra,8(sp)
    80002818:	00013403          	ld	s0,0(sp)
    8000281c:	01010113          	addi	sp,sp,16
    80002820:	00008067          	ret

0000000080002824 <_ZN6KernelC1Ev>:
Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80002824:	fd010113          	addi	sp,sp,-48
    80002828:	02113423          	sd	ra,40(sp)
    8000282c:	02813023          	sd	s0,32(sp)
    80002830:	00913c23          	sd	s1,24(sp)
    80002834:	01213823          	sd	s2,16(sp)
    80002838:	01313423          	sd	s3,8(sp)
    8000283c:	03010413          	addi	s0,sp,48
    80002840:	00050493          	mv	s1,a0
    80002844:	00001097          	auipc	ra,0x1
    80002848:	0d0080e7          	jalr	208(ra) # 80003914 <_ZN11HeapManagerC1Ev>
    8000284c:	00848513          	addi	a0,s1,8
    80002850:	00002097          	auipc	ra,0x2
    80002854:	0c4080e7          	jalr	196(ra) # 80004914 <_ZN9SchedulerC1Ev>
    80002858:	01848913          	addi	s2,s1,24
    8000285c:	00090513          	mv	a0,s2
    80002860:	fffff097          	auipc	ra,0xfffff
    80002864:	d74080e7          	jalr	-652(ra) # 800015d4 <_ZN5TimerC1Ev>
    80002868:	02848513          	addi	a0,s1,40
    8000286c:	00000097          	auipc	ra,0x0
    80002870:	b34080e7          	jalr	-1228(ra) # 800023a0 <_ZN14ConsoleManagerC1Ev>
    80002874:	0380006f          	j	800028ac <_ZN6KernelC1Ev+0x88>
    80002878:	00050993          	mv	s3,a0
    8000287c:	00090513          	mv	a0,s2
    80002880:	fffff097          	auipc	ra,0xfffff
    80002884:	dc4080e7          	jalr	-572(ra) # 80001644 <_ZN5TimerD1Ev>
    80002888:	00098913          	mv	s2,s3
    8000288c:	00048513          	mv	a0,s1
    80002890:	00001097          	auipc	ra,0x1
    80002894:	0ec080e7          	jalr	236(ra) # 8000397c <_ZN11HeapManagerD1Ev>
    80002898:	00090513          	mv	a0,s2
    8000289c:	0000d097          	auipc	ra,0xd
    800028a0:	8cc080e7          	jalr	-1844(ra) # 8000f168 <_Unwind_Resume>
    800028a4:	00050913          	mv	s2,a0
    800028a8:	fe5ff06f          	j	8000288c <_ZN6KernelC1Ev+0x68>
    800028ac:	02813083          	ld	ra,40(sp)
    800028b0:	02013403          	ld	s0,32(sp)
    800028b4:	01813483          	ld	s1,24(sp)
    800028b8:	01013903          	ld	s2,16(sp)
    800028bc:	00813983          	ld	s3,8(sp)
    800028c0:	03010113          	addi	sp,sp,48
    800028c4:	00008067          	ret

00000000800028c8 <_ZN6Kernel10initialiseEv>:
void Kernel::initialise(){
    800028c8:	ff010113          	addi	sp,sp,-16
    800028cc:	00113423          	sd	ra,8(sp)
    800028d0:	00813023          	sd	s0,0(sp)
    800028d4:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    800028d8:	0000b797          	auipc	a5,0xb
    800028dc:	6d87b783          	ld	a5,1752(a5) # 8000dfb0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800028e0:	10579073          	csrw	stvec,a5
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );
    800028e4:	0000b797          	auipc	a5,0xb
    800028e8:	6d47b783          	ld	a5,1748(a5) # 8000dfb8 <_GLOBAL_OFFSET_TABLE_+0x40>
    800028ec:	0007b603          	ld	a2,0(a5)
    800028f0:	0000b797          	auipc	a5,0xb
    800028f4:	6a07b783          	ld	a5,1696(a5) # 8000df90 <_GLOBAL_OFFSET_TABLE_+0x18>
    800028f8:	0007b583          	ld	a1,0(a5)
    800028fc:	00001097          	auipc	ra,0x1
    80002900:	098080e7          	jalr	152(ra) # 80003994 <_ZN11HeapManager4initEmm>
    console.getInstance().init();
    80002904:	00000097          	auipc	ra,0x0
    80002908:	b94080e7          	jalr	-1132(ra) # 80002498 <_ZN14ConsoleManager11getInstanceEv>
    8000290c:	00000097          	auipc	ra,0x0
    80002910:	b48080e7          	jalr	-1208(ra) # 80002454 <_ZN14ConsoleManager4initEv>
}
    80002914:	00813083          	ld	ra,8(sp)
    80002918:	00013403          	ld	s0,0(sp)
    8000291c:	01010113          	addi	sp,sp,16
    80002920:	00008067          	ret

0000000080002924 <_ZN6Kernel3runEv>:

Kernel::EXIT_CODE Kernel::run(){
    80002924:	fe010113          	addi	sp,sp,-32
    80002928:	00113c23          	sd	ra,24(sp)
    8000292c:	00813823          	sd	s0,16(sp)
    80002930:	02010413          	addi	s0,sp,32

    thread_t kernelThread;
    
    thread_create(&kernelThread, 0, 0);
    80002934:	00000613          	li	a2,0
    80002938:	00000593          	li	a1,0
    8000293c:	fe840513          	addi	a0,s0,-24
    80002940:	fffff097          	auipc	ra,0xfffff
    80002944:	f9c080e7          	jalr	-100(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::currentThread = Scheduler::get();
    80002948:	00002097          	auipc	ra,0x2
    8000294c:	254080e7          	jalr	596(ra) # 80004b9c <_ZN9Scheduler3getEv>
    80002950:	0000b797          	auipc	a5,0xb
    80002954:	6707b783          	ld	a5,1648(a5) # 8000dfc0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002958:	00a7b023          	sd	a0,0(a5)

    /// enable software interrupts    
    __asm__ volatile ("csrs sie, %0" :: "r"(1<<1));
    8000295c:	00200793          	li	a5,2
    80002960:	1047a073          	csrs	sie,a5
    /// enable external hardware interrupts
    80002964:	20000713          	li	a4,512
    80002968:	10472073          	csrs	sie,a4
    __asm__ volatile ("csrs sie, %0" :: "r"(1<<9));

    /// enable software interrupts
    8000296c:	1007a073          	csrs	sstatus,a5
    __asm__ volatile ("csrs sstatus, %0" :: "r"(1<<1));


    thread_t userThread;
    80002970:	00000613          	li	a2,0
    80002974:	00000597          	auipc	a1,0x0
    80002978:	e8858593          	addi	a1,a1,-376 # 800027fc <_Z4testPv>
    8000297c:	fe040513          	addi	a0,s0,-32
    80002980:	fffff097          	auipc	ra,0xfffff
    80002984:	f5c080e7          	jalr	-164(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&userThread, test, 0);
    // thread_create(&userThread, usermain, 0);
    do{
    80002988:	00000097          	auipc	ra,0x0
    8000298c:	d44080e7          	jalr	-700(ra) # 800026cc <_ZN14ConsoleManager13outputHandlerEv>
        ConsoleManager::outputHandler();
        // thread_dispatch();
    80002990:	00002097          	auipc	ra,0x2
    80002994:	ff4080e7          	jalr	-12(ra) # 80004984 <_ZN9Scheduler7isEmptyEv>
    80002998:	fe0508e3          	beqz	a0,80002988 <_ZN6Kernel3runEv+0x64>
    8000299c:	fffff097          	auipc	ra,0xfffff
    800029a0:	cf0080e7          	jalr	-784(ra) # 8000168c <_ZN5Timer11getInstanceEv>
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	ea0080e7          	jalr	-352(ra) # 80001844 <_ZN5Timer17noSleepingThreadsEv>
    800029ac:	fc050ee3          	beqz	a0,80002988 <_ZN6Kernel3runEv+0x64>
    800029b0:	00000097          	auipc	ra,0x0
    800029b4:	cc0080e7          	jalr	-832(ra) # 80002670 <_ZN14ConsoleManager8finishedEv>
    800029b8:	fc0508e3          	beqz	a0,80002988 <_ZN6Kernel3runEv+0x64>
    }while(!(Scheduler::isEmpty() && Timer::getInstance().noSleepingThreads() && ConsoleManager::finished()));
    // }while(true);

    return EXIT_SUCCESS;
    800029bc:	00000513          	li	a0,0
    800029c0:	01813083          	ld	ra,24(sp)
    800029c4:	01013403          	ld	s0,16(sp)
    800029c8:	02010113          	addi	sp,sp,32
    800029cc:	00008067          	ret

00000000800029d0 <_Z13thread_test_1Pv>:

sem_t sem1, sem2;

char c;

void thread_test_1(void* args){
    800029d0:	ff010113          	addi	sp,sp,-16
    800029d4:	00113423          	sd	ra,8(sp)
    800029d8:	00813023          	sd	s0,0(sp)
    800029dc:	01010413          	addi	s0,sp,16
    putc('1');
    800029e0:	03100513          	li	a0,49
    800029e4:	fffff097          	auipc	ra,0xfffff
    800029e8:	0e8080e7          	jalr	232(ra) # 80001acc <_Z4putcc>
    putc('s');
    800029ec:	07300513          	li	a0,115
    800029f0:	fffff097          	auipc	ra,0xfffff
    800029f4:	0dc080e7          	jalr	220(ra) # 80001acc <_Z4putcc>
    if(c != 's')time_sleep(30);
    800029f8:	0000b717          	auipc	a4,0xb
    800029fc:	62874703          	lbu	a4,1576(a4) # 8000e020 <c>
    80002a00:	07300793          	li	a5,115
    80002a04:	02f71e63          	bne	a4,a5,80002a40 <_Z13thread_test_1Pv+0x70>
    putc('1');
    80002a08:	03100513          	li	a0,49
    80002a0c:	fffff097          	auipc	ra,0xfffff
    80002a10:	0c0080e7          	jalr	192(ra) # 80001acc <_Z4putcc>
    if(c == 's')sem_signal(sem1);
    80002a14:	0000b717          	auipc	a4,0xb
    80002a18:	60c74703          	lbu	a4,1548(a4) # 8000e020 <c>
    80002a1c:	07300793          	li	a5,115
    80002a20:	02f70863          	beq	a4,a5,80002a50 <_Z13thread_test_1Pv+0x80>
    putc('S');
    80002a24:	05300513          	li	a0,83
    80002a28:	fffff097          	auipc	ra,0xfffff
    80002a2c:	0a4080e7          	jalr	164(ra) # 80001acc <_Z4putcc>
}
    80002a30:	00813083          	ld	ra,8(sp)
    80002a34:	00013403          	ld	s0,0(sp)
    80002a38:	01010113          	addi	sp,sp,16
    80002a3c:	00008067          	ret
    if(c != 's')time_sleep(30);
    80002a40:	01e00513          	li	a0,30
    80002a44:	fffff097          	auipc	ra,0xfffff
    80002a48:	f78080e7          	jalr	-136(ra) # 800019bc <_Z10time_sleepm>
    80002a4c:	fbdff06f          	j	80002a08 <_Z13thread_test_1Pv+0x38>
    if(c == 's')sem_signal(sem1);
    80002a50:	0000b517          	auipc	a0,0xb
    80002a54:	5d853503          	ld	a0,1496(a0) # 8000e028 <sem1>
    80002a58:	fffff097          	auipc	ra,0xfffff
    80002a5c:	020080e7          	jalr	32(ra) # 80001a78 <_Z10sem_signalP4_sem>
    80002a60:	fc5ff06f          	j	80002a24 <_Z13thread_test_1Pv+0x54>

0000000080002a64 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80002a64:	ff010113          	addi	sp,sp,-16
    80002a68:	00113423          	sd	ra,8(sp)
    80002a6c:	00813023          	sd	s0,0(sp)
    80002a70:	01010413          	addi	s0,sp,16
    putc('2');
    80002a74:	03200513          	li	a0,50
    80002a78:	fffff097          	auipc	ra,0xfffff
    80002a7c:	054080e7          	jalr	84(ra) # 80001acc <_Z4putcc>
    putc('s');
    80002a80:	07300513          	li	a0,115
    80002a84:	fffff097          	auipc	ra,0xfffff
    80002a88:	048080e7          	jalr	72(ra) # 80001acc <_Z4putcc>
    if(c != 's')time_sleep(60);
    80002a8c:	0000b717          	auipc	a4,0xb
    80002a90:	59474703          	lbu	a4,1428(a4) # 8000e020 <c>
    80002a94:	07300793          	li	a5,115
    80002a98:	02f71e63          	bne	a4,a5,80002ad4 <_Z13thread_test_2Pv+0x70>
    putc('2');
    80002a9c:	03200513          	li	a0,50
    80002aa0:	fffff097          	auipc	ra,0xfffff
    80002aa4:	02c080e7          	jalr	44(ra) # 80001acc <_Z4putcc>
    putc('S');
    80002aa8:	05300513          	li	a0,83
    80002aac:	fffff097          	auipc	ra,0xfffff
    80002ab0:	020080e7          	jalr	32(ra) # 80001acc <_Z4putcc>
    if(c == 's')sem_signal(sem2);
    80002ab4:	0000b717          	auipc	a4,0xb
    80002ab8:	56c74703          	lbu	a4,1388(a4) # 8000e020 <c>
    80002abc:	07300793          	li	a5,115
    80002ac0:	02f70263          	beq	a4,a5,80002ae4 <_Z13thread_test_2Pv+0x80>
}
    80002ac4:	00813083          	ld	ra,8(sp)
    80002ac8:	00013403          	ld	s0,0(sp)
    80002acc:	01010113          	addi	sp,sp,16
    80002ad0:	00008067          	ret
    if(c != 's')time_sleep(60);
    80002ad4:	03c00513          	li	a0,60
    80002ad8:	fffff097          	auipc	ra,0xfffff
    80002adc:	ee4080e7          	jalr	-284(ra) # 800019bc <_Z10time_sleepm>
    80002ae0:	fbdff06f          	j	80002a9c <_Z13thread_test_2Pv+0x38>
    if(c == 's')sem_signal(sem2);
    80002ae4:	0000b517          	auipc	a0,0xb
    80002ae8:	54c53503          	ld	a0,1356(a0) # 8000e030 <sem2>
    80002aec:	fffff097          	auipc	ra,0xfffff
    80002af0:	f8c080e7          	jalr	-116(ra) # 80001a78 <_Z10sem_signalP4_sem>
}
    80002af4:	fd1ff06f          	j	80002ac4 <_Z13thread_test_2Pv+0x60>

0000000080002af8 <_Z7memTestv>:

void memTest(){
    80002af8:	fd010113          	addi	sp,sp,-48
    80002afc:	02113423          	sd	ra,40(sp)
    80002b00:	02813023          	sd	s0,32(sp)
    80002b04:	00913c23          	sd	s1,24(sp)
    80002b08:	01213823          	sd	s2,16(sp)
    80002b0c:	01313423          	sd	s3,8(sp)
    80002b10:	01413023          	sd	s4,0(sp)
    80002b14:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002b18:	0000b797          	auipc	a5,0xb
    80002b1c:	4887b783          	ld	a5,1160(a5) # 8000dfa0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002b20:	0007b503          	ld	a0,0(a5)
    80002b24:	00001097          	auipc	ra,0x1
    80002b28:	f94080e7          	jalr	-108(ra) # 80003ab8 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002b2c:	00050993          	mv	s3,a0
    putc('F');
    80002b30:	04600513          	li	a0,70
    80002b34:	fffff097          	auipc	ra,0xfffff
    80002b38:	f98080e7          	jalr	-104(ra) # 80001acc <_Z4putcc>
    putc('r');
    80002b3c:	07200513          	li	a0,114
    80002b40:	fffff097          	auipc	ra,0xfffff
    80002b44:	f8c080e7          	jalr	-116(ra) # 80001acc <_Z4putcc>
    putc('e');
    80002b48:	06500513          	li	a0,101
    80002b4c:	fffff097          	auipc	ra,0xfffff
    80002b50:	f80080e7          	jalr	-128(ra) # 80001acc <_Z4putcc>
    putc('e');
    80002b54:	06500513          	li	a0,101
    80002b58:	fffff097          	auipc	ra,0xfffff
    80002b5c:	f74080e7          	jalr	-140(ra) # 80001acc <_Z4putcc>
    putc(' ');
    80002b60:	02000513          	li	a0,32
    80002b64:	fffff097          	auipc	ra,0xfffff
    80002b68:	f68080e7          	jalr	-152(ra) # 80001acc <_Z4putcc>
    putc('m');
    80002b6c:	06d00513          	li	a0,109
    80002b70:	fffff097          	auipc	ra,0xfffff
    80002b74:	f5c080e7          	jalr	-164(ra) # 80001acc <_Z4putcc>
    putc('e');
    80002b78:	06500513          	li	a0,101
    80002b7c:	fffff097          	auipc	ra,0xfffff
    80002b80:	f50080e7          	jalr	-176(ra) # 80001acc <_Z4putcc>
    putc('m');
    80002b84:	06d00513          	li	a0,109
    80002b88:	fffff097          	auipc	ra,0xfffff
    80002b8c:	f44080e7          	jalr	-188(ra) # 80001acc <_Z4putcc>
    putc('o');
    80002b90:	06f00513          	li	a0,111
    80002b94:	fffff097          	auipc	ra,0xfffff
    80002b98:	f38080e7          	jalr	-200(ra) # 80001acc <_Z4putcc>
    putc('r');
    80002b9c:	07200513          	li	a0,114
    80002ba0:	fffff097          	auipc	ra,0xfffff
    80002ba4:	f2c080e7          	jalr	-212(ra) # 80001acc <_Z4putcc>
    putc('y');
    80002ba8:	07900513          	li	a0,121
    80002bac:	fffff097          	auipc	ra,0xfffff
    80002bb0:	f20080e7          	jalr	-224(ra) # 80001acc <_Z4putcc>
    putc(':');
    80002bb4:	03a00513          	li	a0,58
    80002bb8:	fffff097          	auipc	ra,0xfffff
    80002bbc:	f14080e7          	jalr	-236(ra) # 80001acc <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002bc0:	00f00493          	li	s1,15
    80002bc4:	0140006f          	j	80002bd8 <_Z7memTestv+0xe0>
        int digit = (freeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002bc8:	05750513          	addi	a0,a0,87
    80002bcc:	fffff097          	auipc	ra,0xfffff
    80002bd0:	f00080e7          	jalr	-256(ra) # 80001acc <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002bd4:	fff4849b          	addiw	s1,s1,-1
    80002bd8:	0204c463          	bltz	s1,80002c00 <_Z7memTestv+0x108>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    80002bdc:	0024951b          	slliw	a0,s1,0x2
    80002be0:	00a9d533          	srl	a0,s3,a0
    80002be4:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002be8:	00900793          	li	a5,9
    80002bec:	fca7cee3          	blt	a5,a0,80002bc8 <_Z7memTestv+0xd0>
            putc('0' + digit);
    80002bf0:	03050513          	addi	a0,a0,48
    80002bf4:	fffff097          	auipc	ra,0xfffff
    80002bf8:	ed8080e7          	jalr	-296(ra) # 80001acc <_Z4putcc>
    80002bfc:	fd9ff06f          	j	80002bd4 <_Z7memTestv+0xdc>
        }
    }

    putc('\n');
    80002c00:	00a00513          	li	a0,10
    80002c04:	fffff097          	auipc	ra,0xfffff
    80002c08:	ec8080e7          	jalr	-312(ra) # 80001acc <_Z4putcc>
    int n = 100;
    int k = 100;
    int** matrix = (int**)mem_alloc(sizeof(int*) * n);
    80002c0c:	32000513          	li	a0,800
    80002c10:	fffff097          	auipc	ra,0xfffff
    80002c14:	c70080e7          	jalr	-912(ra) # 80001880 <_Z9mem_allocm>
    80002c18:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    80002c1c:	00000493          	li	s1,0
    80002c20:	0080006f          	j	80002c28 <_Z7memTestv+0x130>
    80002c24:	0014849b          	addiw	s1,s1,1
    80002c28:	06300793          	li	a5,99
    80002c2c:	0497c663          	blt	a5,s1,80002c78 <_Z7memTestv+0x180>
        matrix[i] = (int*)mem_alloc(sizeof(int) * k);
    80002c30:	00349a13          	slli	s4,s1,0x3
    80002c34:	01490a33          	add	s4,s2,s4
    80002c38:	19000513          	li	a0,400
    80002c3c:	fffff097          	auipc	ra,0xfffff
    80002c40:	c44080e7          	jalr	-956(ra) # 80001880 <_Z9mem_allocm>
    80002c44:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    80002c48:	00000713          	li	a4,0
    80002c4c:	06300793          	li	a5,99
    80002c50:	fce7cae3          	blt	a5,a4,80002c24 <_Z7memTestv+0x12c>
            matrix[i][j] = i * k + j;
    80002c54:	06400793          	li	a5,100
    80002c58:	029787bb          	mulw	a5,a5,s1
    80002c5c:	000a3683          	ld	a3,0(s4)
    80002c60:	00271613          	slli	a2,a4,0x2
    80002c64:	00c686b3          	add	a3,a3,a2
    80002c68:	00e787bb          	addw	a5,a5,a4
    80002c6c:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80002c70:	0017071b          	addiw	a4,a4,1
    80002c74:	fd9ff06f          	j	80002c4c <_Z7memTestv+0x154>
        }
    }
    for(int i = 0; i < n; i++){
    80002c78:	00000a13          	li	s4,0
    80002c7c:	0780006f          	j	80002cf4 <_Z7memTestv+0x1fc>
        for(int j = 0; j < k; j++){
    80002c80:	0014849b          	addiw	s1,s1,1
    80002c84:	06300793          	li	a5,99
    80002c88:	0497ca63          	blt	a5,s1,80002cdc <_Z7memTestv+0x1e4>
            assert(matrix[i][j] == i * k + j);
    80002c8c:	003a1793          	slli	a5,s4,0x3
    80002c90:	00f907b3          	add	a5,s2,a5
    80002c94:	0007b783          	ld	a5,0(a5)
    80002c98:	00249713          	slli	a4,s1,0x2
    80002c9c:	00e787b3          	add	a5,a5,a4
    80002ca0:	0007a703          	lw	a4,0(a5)
    80002ca4:	06400793          	li	a5,100
    80002ca8:	034787bb          	mulw	a5,a5,s4
    80002cac:	009787bb          	addw	a5,a5,s1
    80002cb0:	fcf708e3          	beq	a4,a5,80002c80 <_Z7memTestv+0x188>
    80002cb4:	00008697          	auipc	a3,0x8
    80002cb8:	48c68693          	addi	a3,a3,1164 # 8000b140 <CONSOLE_STATUS+0x130>
    80002cbc:	04200613          	li	a2,66
    80002cc0:	00008597          	auipc	a1,0x8
    80002cc4:	49058593          	addi	a1,a1,1168 # 8000b150 <CONSOLE_STATUS+0x140>
    80002cc8:	00008517          	auipc	a0,0x8
    80002ccc:	4a050513          	addi	a0,a0,1184 # 8000b168 <CONSOLE_STATUS+0x158>
    80002cd0:	fffff097          	auipc	ra,0xfffff
    80002cd4:	3a4080e7          	jalr	932(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
    80002cd8:	fa9ff06f          	j	80002c80 <_Z7memTestv+0x188>
        }
        mem_free(matrix[i]);
    80002cdc:	003a1793          	slli	a5,s4,0x3
    80002ce0:	00f907b3          	add	a5,s2,a5
    80002ce4:	0007b503          	ld	a0,0(a5)
    80002ce8:	fffff097          	auipc	ra,0xfffff
    80002cec:	bc8080e7          	jalr	-1080(ra) # 800018b0 <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    80002cf0:	001a0a1b          	addiw	s4,s4,1
    80002cf4:	06300793          	li	a5,99
    80002cf8:	0147c663          	blt	a5,s4,80002d04 <_Z7memTestv+0x20c>
        for(int j = 0; j < k; j++){
    80002cfc:	00000493          	li	s1,0
    80002d00:	f85ff06f          	j	80002c84 <_Z7memTestv+0x18c>
    }
    mem_free(matrix);
    80002d04:	00090513          	mv	a0,s2
    80002d08:	fffff097          	auipc	ra,0xfffff
    80002d0c:	ba8080e7          	jalr	-1112(ra) # 800018b0 <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80002d10:	0000b797          	auipc	a5,0xb
    80002d14:	2907b783          	ld	a5,656(a5) # 8000dfa0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002d18:	0007b503          	ld	a0,0(a5)
    80002d1c:	00001097          	auipc	ra,0x1
    80002d20:	d9c080e7          	jalr	-612(ra) # 80003ab8 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80002d24:	00050493          	mv	s1,a0
    putc('F');
    80002d28:	04600513          	li	a0,70
    80002d2c:	fffff097          	auipc	ra,0xfffff
    80002d30:	da0080e7          	jalr	-608(ra) # 80001acc <_Z4putcc>
    putc('r');
    80002d34:	07200513          	li	a0,114
    80002d38:	fffff097          	auipc	ra,0xfffff
    80002d3c:	d94080e7          	jalr	-620(ra) # 80001acc <_Z4putcc>
    putc('e');
    80002d40:	06500513          	li	a0,101
    80002d44:	fffff097          	auipc	ra,0xfffff
    80002d48:	d88080e7          	jalr	-632(ra) # 80001acc <_Z4putcc>
    putc('e');
    80002d4c:	06500513          	li	a0,101
    80002d50:	fffff097          	auipc	ra,0xfffff
    80002d54:	d7c080e7          	jalr	-644(ra) # 80001acc <_Z4putcc>
    putc(' ');
    80002d58:	02000513          	li	a0,32
    80002d5c:	fffff097          	auipc	ra,0xfffff
    80002d60:	d70080e7          	jalr	-656(ra) # 80001acc <_Z4putcc>
    putc('m');
    80002d64:	06d00513          	li	a0,109
    80002d68:	fffff097          	auipc	ra,0xfffff
    80002d6c:	d64080e7          	jalr	-668(ra) # 80001acc <_Z4putcc>
    putc('e');
    80002d70:	06500513          	li	a0,101
    80002d74:	fffff097          	auipc	ra,0xfffff
    80002d78:	d58080e7          	jalr	-680(ra) # 80001acc <_Z4putcc>
    putc('m');
    80002d7c:	06d00513          	li	a0,109
    80002d80:	fffff097          	auipc	ra,0xfffff
    80002d84:	d4c080e7          	jalr	-692(ra) # 80001acc <_Z4putcc>
    putc('o');
    80002d88:	06f00513          	li	a0,111
    80002d8c:	fffff097          	auipc	ra,0xfffff
    80002d90:	d40080e7          	jalr	-704(ra) # 80001acc <_Z4putcc>
    putc('r');
    80002d94:	07200513          	li	a0,114
    80002d98:	fffff097          	auipc	ra,0xfffff
    80002d9c:	d34080e7          	jalr	-716(ra) # 80001acc <_Z4putcc>
    putc('y');
    80002da0:	07900513          	li	a0,121
    80002da4:	fffff097          	auipc	ra,0xfffff
    80002da8:	d28080e7          	jalr	-728(ra) # 80001acc <_Z4putcc>
    putc(':');
    80002dac:	03a00513          	li	a0,58
    80002db0:	fffff097          	auipc	ra,0xfffff
    80002db4:	d1c080e7          	jalr	-740(ra) # 80001acc <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002db8:	00f00913          	li	s2,15
    80002dbc:	0140006f          	j	80002dd0 <_Z7memTestv+0x2d8>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002dc0:	05750513          	addi	a0,a0,87
    80002dc4:	fffff097          	auipc	ra,0xfffff
    80002dc8:	d08080e7          	jalr	-760(ra) # 80001acc <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002dcc:	fff9091b          	addiw	s2,s2,-1
    80002dd0:	02094463          	bltz	s2,80002df8 <_Z7memTestv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    80002dd4:	0029151b          	slliw	a0,s2,0x2
    80002dd8:	00a4d533          	srl	a0,s1,a0
    80002ddc:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002de0:	00900793          	li	a5,9
    80002de4:	fca7cee3          	blt	a5,a0,80002dc0 <_Z7memTestv+0x2c8>
            putc('0' + digit);
    80002de8:	03050513          	addi	a0,a0,48
    80002dec:	fffff097          	auipc	ra,0xfffff
    80002df0:	ce0080e7          	jalr	-800(ra) # 80001acc <_Z4putcc>
    80002df4:	fd9ff06f          	j	80002dcc <_Z7memTestv+0x2d4>
        }
    }
    putc('\n');
    80002df8:	00a00513          	li	a0,10
    80002dfc:	fffff097          	auipc	ra,0xfffff
    80002e00:	cd0080e7          	jalr	-816(ra) # 80001acc <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    80002e04:	409989b3          	sub	s3,s3,s1
    putc('D');
    80002e08:	04400513          	li	a0,68
    80002e0c:	fffff097          	auipc	ra,0xfffff
    80002e10:	cc0080e7          	jalr	-832(ra) # 80001acc <_Z4putcc>
    putc('i');
    80002e14:	06900513          	li	a0,105
    80002e18:	fffff097          	auipc	ra,0xfffff
    80002e1c:	cb4080e7          	jalr	-844(ra) # 80001acc <_Z4putcc>
    putc('f');
    80002e20:	06600513          	li	a0,102
    80002e24:	fffff097          	auipc	ra,0xfffff
    80002e28:	ca8080e7          	jalr	-856(ra) # 80001acc <_Z4putcc>
    putc('f');
    80002e2c:	06600513          	li	a0,102
    80002e30:	fffff097          	auipc	ra,0xfffff
    80002e34:	c9c080e7          	jalr	-868(ra) # 80001acc <_Z4putcc>
    putc('e');
    80002e38:	06500513          	li	a0,101
    80002e3c:	fffff097          	auipc	ra,0xfffff
    80002e40:	c90080e7          	jalr	-880(ra) # 80001acc <_Z4putcc>
    putc('r');
    80002e44:	07200513          	li	a0,114
    80002e48:	fffff097          	auipc	ra,0xfffff
    80002e4c:	c84080e7          	jalr	-892(ra) # 80001acc <_Z4putcc>
    putc('e');
    80002e50:	06500513          	li	a0,101
    80002e54:	fffff097          	auipc	ra,0xfffff
    80002e58:	c78080e7          	jalr	-904(ra) # 80001acc <_Z4putcc>
    putc('n');
    80002e5c:	06e00513          	li	a0,110
    80002e60:	fffff097          	auipc	ra,0xfffff
    80002e64:	c6c080e7          	jalr	-916(ra) # 80001acc <_Z4putcc>
    putc('c');
    80002e68:	06300513          	li	a0,99
    80002e6c:	fffff097          	auipc	ra,0xfffff
    80002e70:	c60080e7          	jalr	-928(ra) # 80001acc <_Z4putcc>
    putc('e');
    80002e74:	06500513          	li	a0,101
    80002e78:	fffff097          	auipc	ra,0xfffff
    80002e7c:	c54080e7          	jalr	-940(ra) # 80001acc <_Z4putcc>
    putc(':');
    80002e80:	03a00513          	li	a0,58
    80002e84:	fffff097          	auipc	ra,0xfffff
    80002e88:	c48080e7          	jalr	-952(ra) # 80001acc <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002e8c:	00f00493          	li	s1,15
    80002e90:	0140006f          	j	80002ea4 <_Z7memTestv+0x3ac>
        int digit = (difference >> (i * 4)) & 0xf;
        if(digit < 10){
            putc('0' + digit);
        }else{
            putc('a' + digit - 10);
    80002e94:	05750513          	addi	a0,a0,87
    80002e98:	fffff097          	auipc	ra,0xfffff
    80002e9c:	c34080e7          	jalr	-972(ra) # 80001acc <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80002ea0:	fff4849b          	addiw	s1,s1,-1
    80002ea4:	0204c463          	bltz	s1,80002ecc <_Z7memTestv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    80002ea8:	0024951b          	slliw	a0,s1,0x2
    80002eac:	00a9d533          	srl	a0,s3,a0
    80002eb0:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80002eb4:	00900793          	li	a5,9
    80002eb8:	fca7cee3          	blt	a5,a0,80002e94 <_Z7memTestv+0x39c>
            putc('0' + digit);
    80002ebc:	03050513          	addi	a0,a0,48
    80002ec0:	fffff097          	auipc	ra,0xfffff
    80002ec4:	c0c080e7          	jalr	-1012(ra) # 80001acc <_Z4putcc>
    80002ec8:	fd9ff06f          	j	80002ea0 <_Z7memTestv+0x3a8>
        }
    }
    putc('\n');
    80002ecc:	00a00513          	li	a0,10
    80002ed0:	fffff097          	auipc	ra,0xfffff
    80002ed4:	bfc080e7          	jalr	-1028(ra) # 80001acc <_Z4putcc>
    putc('\n');
    80002ed8:	00a00513          	li	a0,10
    80002edc:	fffff097          	auipc	ra,0xfffff
    80002ee0:	bf0080e7          	jalr	-1040(ra) # 80001acc <_Z4putcc>
    putc('\n');
    80002ee4:	00a00513          	li	a0,10
    80002ee8:	fffff097          	auipc	ra,0xfffff
    80002eec:	be4080e7          	jalr	-1052(ra) # 80001acc <_Z4putcc>
}
    80002ef0:	02813083          	ld	ra,40(sp)
    80002ef4:	02013403          	ld	s0,32(sp)
    80002ef8:	01813483          	ld	s1,24(sp)
    80002efc:	01013903          	ld	s2,16(sp)
    80002f00:	00813983          	ld	s3,8(sp)
    80002f04:	00013a03          	ld	s4,0(sp)
    80002f08:	03010113          	addi	sp,sp,48
    80002f0c:	00008067          	ret

0000000080002f10 <_Z8usermainPv>:

void usermain(void* arg){
    80002f10:	f6010113          	addi	sp,sp,-160
    80002f14:	08113c23          	sd	ra,152(sp)
    80002f18:	08813823          	sd	s0,144(sp)
    80002f1c:	08913423          	sd	s1,136(sp)
    80002f20:	0a010413          	addi	s0,sp,160
    memTest();    
    80002f24:	00000097          	auipc	ra,0x0
    80002f28:	bd4080e7          	jalr	-1068(ra) # 80002af8 <_Z7memTestv>
    char line[100];
    int i = 0;
    80002f2c:	00000493          	li	s1,0
    while(c = getc(), c != '\n'){
    80002f30:	fffff097          	auipc	ra,0xfffff
    80002f34:	b74080e7          	jalr	-1164(ra) # 80001aa4 <_Z4getcv>
    80002f38:	0000b797          	auipc	a5,0xb
    80002f3c:	0ea78423          	sb	a0,232(a5) # 8000e020 <c>
    80002f40:	00a00793          	li	a5,10
    80002f44:	00f50c63          	beq	a0,a5,80002f5c <_Z8usermainPv+0x4c>
        line[i++] = c;
    80002f48:	fe040793          	addi	a5,s0,-32
    80002f4c:	009787b3          	add	a5,a5,s1
    80002f50:	f8a78c23          	sb	a0,-104(a5)
    80002f54:	0014849b          	addiw	s1,s1,1
    while(c = getc(), c != '\n'){
    80002f58:	fd9ff06f          	j	80002f30 <_Z8usermainPv+0x20>
    }
    line[i] = '\0';
    80002f5c:	fe040793          	addi	a5,s0,-32
    80002f60:	009784b3          	add	s1,a5,s1
    80002f64:	f8048c23          	sb	zero,-104(s1)

    i = 0;
    80002f68:	00000493          	li	s1,0
    while(line[i] != '\0'){
    80002f6c:	fe040793          	addi	a5,s0,-32
    80002f70:	009787b3          	add	a5,a5,s1
    80002f74:	f987c503          	lbu	a0,-104(a5)
    80002f78:	00050a63          	beqz	a0,80002f8c <_Z8usermainPv+0x7c>
        putc(line[i++]);
    80002f7c:	0014849b          	addiw	s1,s1,1
    80002f80:	fffff097          	auipc	ra,0xfffff
    80002f84:	b4c080e7          	jalr	-1204(ra) # 80001acc <_Z4putcc>
    80002f88:	fe5ff06f          	j	80002f6c <_Z8usermainPv+0x5c>
    }
    c = getc();
    80002f8c:	fffff097          	auipc	ra,0xfffff
    80002f90:	b18080e7          	jalr	-1256(ra) # 80001aa4 <_Z4getcv>
    80002f94:	0000b797          	auipc	a5,0xb
    80002f98:	08a78623          	sb	a0,140(a5) # 8000e020 <c>
    thread_t t1, t2;
    if(c == 's'){
    80002f9c:	07300793          	li	a5,115
    80002fa0:	0cf50c63          	beq	a0,a5,80003078 <_Z8usermainPv+0x168>
        sem_open(&sem1, 0);
        sem_open(&sem2, 0);
    }
    thread_create(&t1, thread_test_1, 0);
    80002fa4:	00000613          	li	a2,0
    80002fa8:	00000597          	auipc	a1,0x0
    80002fac:	a2858593          	addi	a1,a1,-1496 # 800029d0 <_Z13thread_test_1Pv>
    80002fb0:	f7040513          	addi	a0,s0,-144
    80002fb4:	fffff097          	auipc	ra,0xfffff
    80002fb8:	928080e7          	jalr	-1752(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002fbc:	00000613          	li	a2,0
    80002fc0:	00000597          	auipc	a1,0x0
    80002fc4:	aa458593          	addi	a1,a1,-1372 # 80002a64 <_Z13thread_test_2Pv>
    80002fc8:	f6840513          	addi	a0,s0,-152
    80002fcc:	fffff097          	auipc	ra,0xfffff
    80002fd0:	910080e7          	jalr	-1776(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    if(c == 's')sem_wait(sem1);
    80002fd4:	0000b717          	auipc	a4,0xb
    80002fd8:	04c74703          	lbu	a4,76(a4) # 8000e020 <c>
    80002fdc:	07300793          	li	a5,115
    80002fe0:	0cf70263          	beq	a4,a5,800030a4 <_Z8usermainPv+0x194>
    putc('3');
    80002fe4:	03300513          	li	a0,51
    80002fe8:	fffff097          	auipc	ra,0xfffff
    80002fec:	ae4080e7          	jalr	-1308(ra) # 80001acc <_Z4putcc>
    if(c != 's')thread_join(t2);
    80002ff0:	0000b717          	auipc	a4,0xb
    80002ff4:	03074703          	lbu	a4,48(a4) # 8000e020 <c>
    80002ff8:	07300793          	li	a5,115
    80002ffc:	0af71e63          	bne	a4,a5,800030b8 <_Z8usermainPv+0x1a8>
    putc('4');
    80003000:	03400513          	li	a0,52
    80003004:	fffff097          	auipc	ra,0xfffff
    80003008:	ac8080e7          	jalr	-1336(ra) # 80001acc <_Z4putcc>
    if(c != 's')thread_join(t1);
    8000300c:	0000b717          	auipc	a4,0xb
    80003010:	01474703          	lbu	a4,20(a4) # 8000e020 <c>
    80003014:	07300793          	li	a5,115
    80003018:	0af71863          	bne	a4,a5,800030c8 <_Z8usermainPv+0x1b8>
    if(c == 's')sem_wait(sem2);
    8000301c:	0000b717          	auipc	a4,0xb
    80003020:	00474703          	lbu	a4,4(a4) # 8000e020 <c>
    80003024:	07300793          	li	a5,115
    80003028:	0af70863          	beq	a4,a5,800030d8 <_Z8usermainPv+0x1c8>
    putc('5');
    8000302c:	03500513          	li	a0,53
    80003030:	fffff097          	auipc	ra,0xfffff
    80003034:	a9c080e7          	jalr	-1380(ra) # 80001acc <_Z4putcc>
    if(c == 's')sem_close(sem1);
    80003038:	0000b717          	auipc	a4,0xb
    8000303c:	fe874703          	lbu	a4,-24(a4) # 8000e020 <c>
    80003040:	07300793          	li	a5,115
    80003044:	0af70463          	beq	a4,a5,800030ec <_Z8usermainPv+0x1dc>
    if(c == 's')sem_close(sem2);
    80003048:	0000b717          	auipc	a4,0xb
    8000304c:	fd874703          	lbu	a4,-40(a4) # 8000e020 <c>
    80003050:	07300793          	li	a5,115
    80003054:	0af70663          	beq	a4,a5,80003100 <_Z8usermainPv+0x1f0>

    putc('\n');
    80003058:	00a00513          	li	a0,10
    8000305c:	fffff097          	auipc	ra,0xfffff
    80003060:	a70080e7          	jalr	-1424(ra) # 80001acc <_Z4putcc>
    80003064:	09813083          	ld	ra,152(sp)
    80003068:	09013403          	ld	s0,144(sp)
    8000306c:	08813483          	ld	s1,136(sp)
    80003070:	0a010113          	addi	sp,sp,160
    80003074:	00008067          	ret
        sem_open(&sem1, 0);
    80003078:	00000593          	li	a1,0
    8000307c:	0000b517          	auipc	a0,0xb
    80003080:	fac50513          	addi	a0,a0,-84 # 8000e028 <sem1>
    80003084:	fffff097          	auipc	ra,0xfffff
    80003088:	964080e7          	jalr	-1692(ra) # 800019e8 <_Z8sem_openPP4_semj>
        sem_open(&sem2, 0);
    8000308c:	00000593          	li	a1,0
    80003090:	0000b517          	auipc	a0,0xb
    80003094:	fa050513          	addi	a0,a0,-96 # 8000e030 <sem2>
    80003098:	fffff097          	auipc	ra,0xfffff
    8000309c:	950080e7          	jalr	-1712(ra) # 800019e8 <_Z8sem_openPP4_semj>
    800030a0:	f05ff06f          	j	80002fa4 <_Z8usermainPv+0x94>
    if(c == 's')sem_wait(sem1);
    800030a4:	0000b517          	auipc	a0,0xb
    800030a8:	f8453503          	ld	a0,-124(a0) # 8000e028 <sem1>
    800030ac:	fffff097          	auipc	ra,0xfffff
    800030b0:	9a0080e7          	jalr	-1632(ra) # 80001a4c <_Z8sem_waitP4_sem>
    800030b4:	f31ff06f          	j	80002fe4 <_Z8usermainPv+0xd4>
    if(c != 's')thread_join(t2);
    800030b8:	f6843503          	ld	a0,-152(s0)
    800030bc:	fffff097          	auipc	ra,0xfffff
    800030c0:	8dc080e7          	jalr	-1828(ra) # 80001998 <_Z11thread_joinP7_thread>
    800030c4:	f3dff06f          	j	80003000 <_Z8usermainPv+0xf0>
    if(c != 's')thread_join(t1);
    800030c8:	f7043503          	ld	a0,-144(s0)
    800030cc:	fffff097          	auipc	ra,0xfffff
    800030d0:	8cc080e7          	jalr	-1844(ra) # 80001998 <_Z11thread_joinP7_thread>
    800030d4:	f49ff06f          	j	8000301c <_Z8usermainPv+0x10c>
    if(c == 's')sem_wait(sem2);
    800030d8:	0000b517          	auipc	a0,0xb
    800030dc:	f5853503          	ld	a0,-168(a0) # 8000e030 <sem2>
    800030e0:	fffff097          	auipc	ra,0xfffff
    800030e4:	96c080e7          	jalr	-1684(ra) # 80001a4c <_Z8sem_waitP4_sem>
    800030e8:	f45ff06f          	j	8000302c <_Z8usermainPv+0x11c>
    if(c == 's')sem_close(sem1);
    800030ec:	0000b517          	auipc	a0,0xb
    800030f0:	f3c53503          	ld	a0,-196(a0) # 8000e028 <sem1>
    800030f4:	fffff097          	auipc	ra,0xfffff
    800030f8:	92c080e7          	jalr	-1748(ra) # 80001a20 <_Z9sem_closeP4_sem>
    800030fc:	f4dff06f          	j	80003048 <_Z8usermainPv+0x138>
    if(c == 's')sem_close(sem2);
    80003100:	0000b517          	auipc	a0,0xb
    80003104:	f3053503          	ld	a0,-208(a0) # 8000e030 <sem2>
    80003108:	fffff097          	auipc	ra,0xfffff
    8000310c:	918080e7          	jalr	-1768(ra) # 80001a20 <_Z9sem_closeP4_sem>
    80003110:	f49ff06f          	j	80003058 <_Z8usermainPv+0x148>

0000000080003114 <_ZN7_threadC1EPFvPvES0_>:
#include "sched.h"
#include "syscall_c.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    80003114:	ff010113          	addi	sp,sp,-16
    80003118:	00813423          	sd	s0,8(sp)
    8000311c:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80003120:	00053023          	sd	zero,0(a0)
    80003124:	00053423          	sd	zero,8(a0)
    function = function;
    arg = arg;
    ID = nextID++;
    80003128:	0000b717          	auipc	a4,0xb
    8000312c:	f1070713          	addi	a4,a4,-240 # 8000e038 <_ZN7_thread6nextIDE>
    80003130:	00072783          	lw	a5,0(a4)
    80003134:	0017869b          	addiw	a3,a5,1
    80003138:	00d72023          	sw	a3,0(a4)
    8000313c:	08f52c23          	sw	a5,152(a0)
    closed = 0;
    80003140:	09c52783          	lw	a5,156(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80003144:	0015b593          	seqz	a1,a1
    80003148:	0045959b          	slliw	a1,a1,0x4
    8000314c:	fe07f793          	andi	a5,a5,-32
    80003150:	00b7e7b3          	or	a5,a5,a1
    80003154:	08f52e23          	sw	a5,156(a0)
    reserved = 0;
    80003158:	0a052783          	lw	a5,160(a0)
    8000315c:	f0000737          	lui	a4,0xf0000
    80003160:	00e7f7b3          	and	a5,a5,a4
    80003164:	0af52023          	sw	a5,160(a0)
    joinHead = 0;
    80003168:	06053c23          	sd	zero,120(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    8000316c:	00200793          	li	a5,2
    80003170:	08f53423          	sd	a5,136(a0)
    stackStart = 0;
    80003174:	08053823          	sd	zero,144(a0)
    
    context.s0 = 0;
    80003178:	00053823          	sd	zero,16(a0)
    context.s1 = 0;
    8000317c:	00053c23          	sd	zero,24(a0)
    context.s2 = 0;
    80003180:	02053023          	sd	zero,32(a0)
    context.s3 = 0;
    80003184:	02053423          	sd	zero,40(a0)
    context.s4 = 0;
    80003188:	02053823          	sd	zero,48(a0)
    context.s5 = 0;
    8000318c:	02053c23          	sd	zero,56(a0)
    context.s6 = 0;
    80003190:	04053023          	sd	zero,64(a0)
    context.s7 = 0;
    80003194:	04053423          	sd	zero,72(a0)
    context.s8 = 0;
    80003198:	04053823          	sd	zero,80(a0)
    context.s9 = 0;
    8000319c:	04053c23          	sd	zero,88(a0)
    context.s10 = 0;
    800031a0:	06053023          	sd	zero,96(a0)
    context.s11 = 0;
    800031a4:	06053423          	sd	zero,104(a0)

    context.sstatus = 0;
    800031a8:	06053823          	sd	zero,112(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    800031ac:	00000797          	auipc	a5,0x0
    800031b0:	54878793          	addi	a5,a5,1352 # 800036f4 <_ZN7_thread7wrapperEv>
    800031b4:	00f53023          	sd	a5,0(a0)
}
    800031b8:	00813403          	ld	s0,8(sp)
    800031bc:	01010113          	addi	sp,sp,16
    800031c0:	00008067          	ret

00000000800031c4 <_Z10popSppSpiev>:

void popSppSpie(){
    800031c4:	ff010113          	addi	sp,sp,-16
    800031c8:	00813423          	sd	s0,8(sp)
    800031cc:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    800031d0:	14109073          	csrw	sepc,ra
    __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    800031d4:	10000793          	li	a5,256
    800031d8:	1007b073          	csrc	sstatus,a5
    __asm__ volatile ("sret");
    800031dc:	10200073          	sret
}
    800031e0:	00813403          	ld	s0,8(sp)
    800031e4:	01010113          	addi	sp,sp,16
    800031e8:	00008067          	ret

00000000800031ec <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    800031ec:	fe010113          	addi	sp,sp,-32
    800031f0:	00113c23          	sd	ra,24(sp)
    800031f4:	00813823          	sd	s0,16(sp)
    800031f8:	00913423          	sd	s1,8(sp)
    800031fc:	01213023          	sd	s2,0(sp)
    80003200:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80003204:	07853483          	ld	s1,120(a0)
    while(current != 0){
    80003208:	0c048e63          	beqz	s1,800032e4 <_ZN7_thread6unJoinEv+0xf8>
        thread_t thread = current->thread;
    8000320c:	0004c503          	lbu	a0,0(s1)
    80003210:	0014c783          	lbu	a5,1(s1)
    80003214:	00879793          	slli	a5,a5,0x8
    80003218:	00a7e7b3          	or	a5,a5,a0
    8000321c:	0024c503          	lbu	a0,2(s1)
    80003220:	01051513          	slli	a0,a0,0x10
    80003224:	00f567b3          	or	a5,a0,a5
    80003228:	0034c503          	lbu	a0,3(s1)
    8000322c:	01851513          	slli	a0,a0,0x18
    80003230:	00f56533          	or	a0,a0,a5
    80003234:	0044c783          	lbu	a5,4(s1)
    80003238:	02079793          	slli	a5,a5,0x20
    8000323c:	00a7e533          	or	a0,a5,a0
    80003240:	0054c783          	lbu	a5,5(s1)
    80003244:	02879793          	slli	a5,a5,0x28
    80003248:	00a7e7b3          	or	a5,a5,a0
    8000324c:	0064c503          	lbu	a0,6(s1)
    80003250:	03051513          	slli	a0,a0,0x30
    80003254:	00f567b3          	or	a5,a0,a5
    80003258:	0074c503          	lbu	a0,7(s1)
    8000325c:	03851513          	slli	a0,a0,0x38
    80003260:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    80003264:	09c52783          	lw	a5,156(a0)
    80003268:	ffd7f793          	andi	a5,a5,-3
    8000326c:	08f52e23          	sw	a5,156(a0)
        Scheduler::put(thread);
    80003270:	00001097          	auipc	ra,0x1
    80003274:	73c080e7          	jalr	1852(ra) # 800049ac <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    80003278:	0084c903          	lbu	s2,8(s1)
    8000327c:	0094c783          	lbu	a5,9(s1)
    80003280:	00879793          	slli	a5,a5,0x8
    80003284:	0127e7b3          	or	a5,a5,s2
    80003288:	00a4c903          	lbu	s2,10(s1)
    8000328c:	01091913          	slli	s2,s2,0x10
    80003290:	00f967b3          	or	a5,s2,a5
    80003294:	00b4c903          	lbu	s2,11(s1)
    80003298:	01891913          	slli	s2,s2,0x18
    8000329c:	00f96933          	or	s2,s2,a5
    800032a0:	00c4c783          	lbu	a5,12(s1)
    800032a4:	02079793          	slli	a5,a5,0x20
    800032a8:	0127e933          	or	s2,a5,s2
    800032ac:	00d4c783          	lbu	a5,13(s1)
    800032b0:	02879793          	slli	a5,a5,0x28
    800032b4:	0127e7b3          	or	a5,a5,s2
    800032b8:	00e4c903          	lbu	s2,14(s1)
    800032bc:	03091913          	slli	s2,s2,0x30
    800032c0:	00f967b3          	or	a5,s2,a5
    800032c4:	00f4c903          	lbu	s2,15(s1)
    800032c8:	03891913          	slli	s2,s2,0x38
    800032cc:	00f96933          	or	s2,s2,a5
        mem_free(current);
    800032d0:	00048513          	mv	a0,s1
    800032d4:	ffffe097          	auipc	ra,0xffffe
    800032d8:	5dc080e7          	jalr	1500(ra) # 800018b0 <_Z8mem_freePv>
        current = next;
    800032dc:	00090493          	mv	s1,s2
    while(current != 0){
    800032e0:	f29ff06f          	j	80003208 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    800032e4:	01813083          	ld	ra,24(sp)
    800032e8:	01013403          	ld	s0,16(sp)
    800032ec:	00813483          	ld	s1,8(sp)
    800032f0:	00013903          	ld	s2,0(sp)
    800032f4:	02010113          	addi	sp,sp,32
    800032f8:	00008067          	ret

00000000800032fc <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    800032fc:	fc010113          	addi	sp,sp,-64
    80003300:	02113c23          	sd	ra,56(sp)
    80003304:	02813823          	sd	s0,48(sp)
    80003308:	02913423          	sd	s1,40(sp)
    8000330c:	03213023          	sd	s2,32(sp)
    80003310:	01313c23          	sd	s3,24(sp)
    80003314:	01413823          	sd	s4,16(sp)
    80003318:	01513423          	sd	s5,8(sp)
    8000331c:	04010413          	addi	s0,sp,64
    80003320:	00050493          	mv	s1,a0
    80003324:	00058913          	mv	s2,a1
    80003328:	00060a93          	mv	s5,a2
    8000332c:	00068993          	mv	s3,a3
    80003330:	00070a13          	mv	s4,a4

    *thread = (_thread*)mem_alloc(sizeof(_thread));
    80003334:	0b800513          	li	a0,184
    80003338:	ffffe097          	auipc	ra,0xffffe
    8000333c:	548080e7          	jalr	1352(ra) # 80001880 <_Z9mem_allocm>
    80003340:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80003344:	18050063          	beqz	a0,800034c4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c8>
        return -1;
    }
    (*thread)->function = function;
    80003348:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    8000334c:	0004b783          	ld	a5,0(s1)
    80003350:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80003354:	0000b717          	auipc	a4,0xb
    80003358:	ce470713          	addi	a4,a4,-796 # 8000e038 <_ZN7_thread6nextIDE>
    8000335c:	00072783          	lw	a5,0(a4)
    80003360:	0017869b          	addiw	a3,a5,1
    80003364:	00d72023          	sw	a3,0(a4)
    80003368:	0004b703          	ld	a4,0(s1)
    8000336c:	08f72c23          	sw	a5,152(a4)
    (*thread)->closed = false;
    80003370:	0004b703          	ld	a4,0(s1)
    80003374:	09c72783          	lw	a5,156(a4)
    80003378:	ffe7f793          	andi	a5,a5,-2
    8000337c:	08f72e23          	sw	a5,156(a4)
    (*thread)->blocked = false;
    80003380:	0004b703          	ld	a4,0(s1)
    80003384:	09c72783          	lw	a5,156(a4)
    80003388:	ffd7f793          	andi	a5,a5,-3
    8000338c:	08f72e23          	sw	a5,156(a4)
    (*thread)->sleeping = false;
    80003390:	0004b703          	ld	a4,0(s1)
    80003394:	09c72783          	lw	a5,156(a4)
    80003398:	ffb7f793          	andi	a5,a5,-5
    8000339c:	08f72e23          	sw	a5,156(a4)
    (*thread)->finished = false;
    800033a0:	0004b703          	ld	a4,0(s1)
    800033a4:	09c72783          	lw	a5,156(a4)
    800033a8:	ff77f793          	andi	a5,a5,-9
    800033ac:	08f72e23          	sw	a5,156(a4)
    (*thread)->kernel = (function == 0);
    800033b0:	0004b703          	ld	a4,0(s1)
    800033b4:	00193913          	seqz	s2,s2
    800033b8:	0049191b          	slliw	s2,s2,0x4
    800033bc:	09c72783          	lw	a5,156(a4)
    800033c0:	fef7f793          	andi	a5,a5,-17
    800033c4:	0127e933          	or	s2,a5,s2
    800033c8:	09272e23          	sw	s2,156(a4)
    (*thread)->reserved = 0;
    800033cc:	0004b703          	ld	a4,0(s1)
    800033d0:	0a072783          	lw	a5,160(a4)
    800033d4:	f00006b7          	lui	a3,0xf0000
    800033d8:	00d7f7b3          	and	a5,a5,a3
    800033dc:	0af72023          	sw	a5,160(a4)
    (*thread)->joinHead = 0;
    800033e0:	0004b783          	ld	a5,0(s1)
    800033e4:	0607bc23          	sd	zero,120(a5)
    (*thread)->joinTail = 0;
    800033e8:	0004b783          	ld	a5,0(s1)
    800033ec:	0807b023          	sd	zero,128(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    800033f0:	0004b783          	ld	a5,0(s1)
    800033f4:	00200713          	li	a4,2
    800033f8:	08e7b423          	sd	a4,136(a5)
    (*thread)->stackStart = 0;
    800033fc:	0004b783          	ld	a5,0(s1)
    80003400:	0807b823          	sd	zero,144(a5)

    (*thread)->context.s0 = 0;
    80003404:	0004b783          	ld	a5,0(s1)
    80003408:	0007b823          	sd	zero,16(a5)
    (*thread)->context.s1 = 0;
    8000340c:	0004b783          	ld	a5,0(s1)
    80003410:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s2 = 0;
    80003414:	0004b783          	ld	a5,0(s1)
    80003418:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s3 = 0;
    8000341c:	0004b783          	ld	a5,0(s1)
    80003420:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s4 = 0;
    80003424:	0004b783          	ld	a5,0(s1)
    80003428:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s5 = 0;
    8000342c:	0004b783          	ld	a5,0(s1)
    80003430:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s6 = 0;
    80003434:	0004b783          	ld	a5,0(s1)
    80003438:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s7 = 0;
    8000343c:	0004b783          	ld	a5,0(s1)
    80003440:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s8 = 0;
    80003444:	0004b783          	ld	a5,0(s1)
    80003448:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s9 = 0;
    8000344c:	0004b783          	ld	a5,0(s1)
    80003450:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s10 = 0;
    80003454:	0004b783          	ld	a5,0(s1)
    80003458:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s11 = 0;
    8000345c:	0004b783          	ld	a5,0(s1)
    80003460:	0607b423          	sd	zero,104(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    80003464:	0004b783          	ld	a5,0(s1)
    80003468:	0137b423          	sd	s3,8(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    8000346c:	0004b783          	ld	a5,0(s1)
    80003470:	00000717          	auipc	a4,0x0
    80003474:	28470713          	addi	a4,a4,644 # 800036f4 <_ZN7_thread7wrapperEv>
    80003478:	00e7b023          	sd	a4,0(a5)

    (*thread)->stackStart = stack;
    8000347c:	0004b783          	ld	a5,0(s1)
    80003480:	0937b823          	sd	s3,144(a5)
    if(start){
    80003484:	020a1663          	bnez	s4,800034b0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1b4>
        Scheduler::put(*thread);
    }
    return 0;
    80003488:	00000513          	li	a0,0
}
    8000348c:	03813083          	ld	ra,56(sp)
    80003490:	03013403          	ld	s0,48(sp)
    80003494:	02813483          	ld	s1,40(sp)
    80003498:	02013903          	ld	s2,32(sp)
    8000349c:	01813983          	ld	s3,24(sp)
    800034a0:	01013a03          	ld	s4,16(sp)
    800034a4:	00813a83          	ld	s5,8(sp)
    800034a8:	04010113          	addi	sp,sp,64
    800034ac:	00008067          	ret
        Scheduler::put(*thread);
    800034b0:	0004b503          	ld	a0,0(s1)
    800034b4:	00001097          	auipc	ra,0x1
    800034b8:	4f8080e7          	jalr	1272(ra) # 800049ac <_ZN9Scheduler3putEP7_thread>
    return 0;
    800034bc:	00000513          	li	a0,0
    800034c0:	fcdff06f          	j	8000348c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>
        return -1;
    800034c4:	fff00513          	li	a0,-1
    800034c8:	fc5ff06f          	j	8000348c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x190>

00000000800034cc <_ZN7_thread4joinEPS_>:

void _thread::join(thread_t thread){
    /// cannot join to a finished or closed thread
    if(thread->finished || thread->closed){
    800034cc:	0985b783          	ld	a5,152(a1)
    800034d0:	00900713          	li	a4,9
    800034d4:	02071713          	slli	a4,a4,0x20
    800034d8:	00e7f7b3          	and	a5,a5,a4
    800034dc:	00078463          	beqz	a5,800034e4 <_ZN7_thread4joinEPS_+0x18>
    800034e0:	00008067          	ret
void _thread::join(thread_t thread){
    800034e4:	fe010113          	addi	sp,sp,-32
    800034e8:	00113c23          	sd	ra,24(sp)
    800034ec:	00813823          	sd	s0,16(sp)
    800034f0:	00913423          	sd	s1,8(sp)
    800034f4:	01213023          	sd	s2,0(sp)
    800034f8:	02010413          	addi	s0,sp,32
    800034fc:	00050493          	mv	s1,a0
    80003500:	00058913          	mv	s2,a1
        return;
    }
    ThreadJoinList* newJoin = (ThreadJoinList*)mem_alloc(sizeof(ThreadJoinList));
    80003504:	01000513          	li	a0,16
    80003508:	ffffe097          	auipc	ra,0xffffe
    8000350c:	378080e7          	jalr	888(ra) # 80001880 <_Z9mem_allocm>
    this->blocked = true;
    80003510:	09c4a703          	lw	a4,156(s1)
    80003514:	00276713          	ori	a4,a4,2
    80003518:	08e4ae23          	sw	a4,156(s1)
    newJoin->thread = this;
    8000351c:	00950023          	sb	s1,0(a0)
    80003520:	0084d713          	srli	a4,s1,0x8
    80003524:	00e500a3          	sb	a4,1(a0)
    80003528:	0104d713          	srli	a4,s1,0x10
    8000352c:	00e50123          	sb	a4,2(a0)
    80003530:	0184d71b          	srliw	a4,s1,0x18
    80003534:	00e501a3          	sb	a4,3(a0)
    80003538:	0204d713          	srli	a4,s1,0x20
    8000353c:	00e50223          	sb	a4,4(a0)
    80003540:	0284d713          	srli	a4,s1,0x28
    80003544:	00e502a3          	sb	a4,5(a0)
    80003548:	0304d713          	srli	a4,s1,0x30
    8000354c:	00e50323          	sb	a4,6(a0)
    80003550:	0384d493          	srli	s1,s1,0x38
    80003554:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    80003558:	00050423          	sb	zero,8(a0)
    8000355c:	000504a3          	sb	zero,9(a0)
    80003560:	00050523          	sb	zero,10(a0)
    80003564:	000505a3          	sb	zero,11(a0)
    80003568:	00050623          	sb	zero,12(a0)
    8000356c:	000506a3          	sb	zero,13(a0)
    80003570:	00050723          	sb	zero,14(a0)
    80003574:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    80003578:	07893703          	ld	a4,120(s2)
    8000357c:	06070463          	beqz	a4,800035e4 <_ZN7_thread4joinEPS_+0x118>
        thread->joinHead = newJoin;
        thread->joinTail = newJoin;
    }else{
        thread->joinTail->next = newJoin;
    80003580:	08093703          	ld	a4,128(s2)
    80003584:	00a70423          	sb	a0,8(a4)
    80003588:	00855693          	srli	a3,a0,0x8
    8000358c:	00d704a3          	sb	a3,9(a4)
    80003590:	01055693          	srli	a3,a0,0x10
    80003594:	00d70523          	sb	a3,10(a4)
    80003598:	0185569b          	srliw	a3,a0,0x18
    8000359c:	00d705a3          	sb	a3,11(a4)
    800035a0:	02055693          	srli	a3,a0,0x20
    800035a4:	00d70623          	sb	a3,12(a4)
    800035a8:	02855693          	srli	a3,a0,0x28
    800035ac:	00d706a3          	sb	a3,13(a4)
    800035b0:	03055693          	srli	a3,a0,0x30
    800035b4:	00d70723          	sb	a3,14(a4)
    800035b8:	03855693          	srli	a3,a0,0x38
    800035bc:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    800035c0:	08a93023          	sd	a0,128(s2)
    }
    thread_dispatch();
    800035c4:	ffffe097          	auipc	ra,0xffffe
    800035c8:	3b4080e7          	jalr	948(ra) # 80001978 <_Z15thread_dispatchv>
}
    800035cc:	01813083          	ld	ra,24(sp)
    800035d0:	01013403          	ld	s0,16(sp)
    800035d4:	00813483          	ld	s1,8(sp)
    800035d8:	00013903          	ld	s2,0(sp)
    800035dc:	02010113          	addi	sp,sp,32
    800035e0:	00008067          	ret
        thread->joinHead = newJoin;
    800035e4:	06a93c23          	sd	a0,120(s2)
        thread->joinTail = newJoin;
    800035e8:	08a93023          	sd	a0,128(s2)
    800035ec:	fd9ff06f          	j	800035c4 <_ZN7_thread4joinEPS_+0xf8>

00000000800035f0 <_ZN7_thread4tickEv>:

int _thread::tick(){
    // putc('T');
    if(currentThread->blocked){
    800035f0:	0000b797          	auipc	a5,0xb
    800035f4:	a507b783          	ld	a5,-1456(a5) # 8000e040 <_ZN7_thread13currentThreadE>
    800035f8:	09c7a783          	lw	a5,156(a5)
    800035fc:	0027f713          	andi	a4,a5,2
    80003600:	06071063          	bnez	a4,80003660 <_ZN7_thread4tickEv+0x70>
        return -1;
    }
    if(currentThread->closed){
    80003604:	0017f713          	andi	a4,a5,1
    80003608:	06071063          	bnez	a4,80003668 <_ZN7_thread4tickEv+0x78>
        return -2;
    }
    if(currentThread->sleeping){
    8000360c:	0047f713          	andi	a4,a5,4
    80003610:	06071063          	bnez	a4,80003670 <_ZN7_thread4tickEv+0x80>
        return -3;
    }
    if(currentThread->finished){
    80003614:	0087f793          	andi	a5,a5,8
    80003618:	06079063          	bnez	a5,80003678 <_ZN7_thread4tickEv+0x88>
        return -4;
    }
    timeLeft --;
    8000361c:	08853783          	ld	a5,136(a0)
    80003620:	fff78793          	addi	a5,a5,-1
    80003624:	08f53423          	sd	a5,136(a0)
    if(timeLeft == 0){
    80003628:	00078663          	beqz	a5,80003634 <_ZN7_thread4tickEv+0x44>
        // putc('D');
        thread_dispatch();
    }
    return 0;
    8000362c:	00000513          	li	a0,0
}
    80003630:	00008067          	ret
int _thread::tick(){
    80003634:	ff010113          	addi	sp,sp,-16
    80003638:	00113423          	sd	ra,8(sp)
    8000363c:	00813023          	sd	s0,0(sp)
    80003640:	01010413          	addi	s0,sp,16
        thread_dispatch();
    80003644:	ffffe097          	auipc	ra,0xffffe
    80003648:	334080e7          	jalr	820(ra) # 80001978 <_Z15thread_dispatchv>
    return 0;
    8000364c:	00000513          	li	a0,0
}
    80003650:	00813083          	ld	ra,8(sp)
    80003654:	00013403          	ld	s0,0(sp)
    80003658:	01010113          	addi	sp,sp,16
    8000365c:	00008067          	ret
        return -1;
    80003660:	fff00513          	li	a0,-1
    80003664:	00008067          	ret
        return -2;
    80003668:	ffe00513          	li	a0,-2
    8000366c:	00008067          	ret
        return -3;
    80003670:	ffd00513          	li	a0,-3
    80003674:	00008067          	ret
        return -4;
    80003678:	ffc00513          	li	a0,-4
    8000367c:	00008067          	ret

0000000080003680 <_ZN7_thread4exitEv>:

int _thread::exit(){
    if(currentThread->closed){
    80003680:	0000b717          	auipc	a4,0xb
    80003684:	9c073703          	ld	a4,-1600(a4) # 8000e040 <_ZN7_thread13currentThreadE>
    80003688:	09c72783          	lw	a5,156(a4)
    8000368c:	0017f693          	andi	a3,a5,1
    80003690:	04069663          	bnez	a3,800036dc <_ZN7_thread4exitEv+0x5c>
        return -1;
    }
    if(currentThread->blocked){
    80003694:	0027f693          	andi	a3,a5,2
    80003698:	04069663          	bnez	a3,800036e4 <_ZN7_thread4exitEv+0x64>
        return -2;
    }
    if(currentThread->sleeping){
    8000369c:	0047f793          	andi	a5,a5,4
    800036a0:	04079663          	bnez	a5,800036ec <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    800036a4:	ff010113          	addi	sp,sp,-16
    800036a8:	00113423          	sd	ra,8(sp)
    800036ac:	00813023          	sd	s0,0(sp)
    800036b0:	01010413          	addi	s0,sp,16
        return -3;
    }
    currentThread->finished = 1;
    800036b4:	09c72783          	lw	a5,156(a4)
    800036b8:	0087e793          	ori	a5,a5,8
    800036bc:	08f72e23          	sw	a5,156(a4)
    thread_dispatch();
    800036c0:	ffffe097          	auipc	ra,0xffffe
    800036c4:	2b8080e7          	jalr	696(ra) # 80001978 <_Z15thread_dispatchv>
    return 0;
    800036c8:	00000513          	li	a0,0
}
    800036cc:	00813083          	ld	ra,8(sp)
    800036d0:	00013403          	ld	s0,0(sp)
    800036d4:	01010113          	addi	sp,sp,16
    800036d8:	00008067          	ret
        return -1;
    800036dc:	fff00513          	li	a0,-1
    800036e0:	00008067          	ret
        return -2;
    800036e4:	ffe00513          	li	a0,-2
    800036e8:	00008067          	ret
        return -3;
    800036ec:	ffd00513          	li	a0,-3
}
    800036f0:	00008067          	ret

00000000800036f4 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    800036f4:	fe010113          	addi	sp,sp,-32
    800036f8:	00113c23          	sd	ra,24(sp)
    800036fc:	00813823          	sd	s0,16(sp)
    80003700:	00913423          	sd	s1,8(sp)
    80003704:	02010413          	addi	s0,sp,32
    popSppSpie();
    80003708:	00000097          	auipc	ra,0x0
    8000370c:	abc080e7          	jalr	-1348(ra) # 800031c4 <_Z10popSppSpiev>
    currentThread->function(currentThread->arg);
    80003710:	0000b497          	auipc	s1,0xb
    80003714:	92848493          	addi	s1,s1,-1752 # 8000e038 <_ZN7_thread6nextIDE>
    80003718:	0084b783          	ld	a5,8(s1)
    8000371c:	0a87b703          	ld	a4,168(a5)
    80003720:	0b07b503          	ld	a0,176(a5)
    80003724:	000700e7          	jalr	a4
    currentThread->unJoin();
    80003728:	0084b503          	ld	a0,8(s1)
    8000372c:	00000097          	auipc	ra,0x0
    80003730:	ac0080e7          	jalr	-1344(ra) # 800031ec <_ZN7_thread6unJoinEv>
    exit();
    80003734:	00000097          	auipc	ra,0x0
    80003738:	f4c080e7          	jalr	-180(ra) # 80003680 <_ZN7_thread4exitEv>
}
    8000373c:	01813083          	ld	ra,24(sp)
    80003740:	01013403          	ld	s0,16(sp)
    80003744:	00813483          	ld	s1,8(sp)
    80003748:	02010113          	addi	sp,sp,32
    8000374c:	00008067          	ret

0000000080003750 <_ZN7_thread10setBlockedEb>:

void _thread::setBlocked(bool blocked){
    80003750:	ff010113          	addi	sp,sp,-16
    80003754:	00813423          	sd	s0,8(sp)
    80003758:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    8000375c:	0015f593          	andi	a1,a1,1
    80003760:	0015979b          	slliw	a5,a1,0x1
    80003764:	09c52583          	lw	a1,156(a0)
    80003768:	ffd5f593          	andi	a1,a1,-3
    8000376c:	00f5e5b3          	or	a1,a1,a5
    80003770:	08b52e23          	sw	a1,156(a0)
}
    80003774:	00813403          	ld	s0,8(sp)
    80003778:	01010113          	addi	sp,sp,16
    8000377c:	00008067          	ret

0000000080003780 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80003780:	ff010113          	addi	sp,sp,-16
    80003784:	00813423          	sd	s0,8(sp)
    80003788:	01010413          	addi	s0,sp,16
    this->closed = closed;
    8000378c:	0015f793          	andi	a5,a1,1
    80003790:	09c52583          	lw	a1,156(a0)
    80003794:	ffe5f593          	andi	a1,a1,-2
    80003798:	00f5e5b3          	or	a1,a1,a5
    8000379c:	08b52e23          	sw	a1,156(a0)
}
    800037a0:	00813403          	ld	s0,8(sp)
    800037a4:	01010113          	addi	sp,sp,16
    800037a8:	00008067          	ret

00000000800037ac <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    800037ac:	ff010113          	addi	sp,sp,-16
    800037b0:	00813423          	sd	s0,8(sp)
    800037b4:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    800037b8:	0015f593          	andi	a1,a1,1
    800037bc:	0025979b          	slliw	a5,a1,0x2
    800037c0:	09c52583          	lw	a1,156(a0)
    800037c4:	ffb5f593          	andi	a1,a1,-5
    800037c8:	00f5e5b3          	or	a1,a1,a5
    800037cc:	08b52e23          	sw	a1,156(a0)
}
    800037d0:	00813403          	ld	s0,8(sp)
    800037d4:	01010113          	addi	sp,sp,16
    800037d8:	00008067          	ret

00000000800037dc <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
        Scheduler::put(oldThread);
    }
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
}

void _thread::contextSwitch(contextWrapper *oldContext, contextWrapper *newContext){
    800037dc:	ff010113          	addi	sp,sp,-16
    800037e0:	00813423          	sd	s0,8(sp)
    800037e4:	01010413          	addi	s0,sp,16


    if(oldContext != 0){
    800037e8:	04050263          	beqz	a0,8000382c <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_+0x50>
        // oldContext->pc = pc;
        __asm__ volatile ("sd ra, 0 * 8(a0)");
    800037ec:	00153023          	sd	ra,0(a0)
        __asm__ volatile ("sd sp, 1 * 8(a0)");
    800037f0:	00253423          	sd	sp,8(a0)

        __asm__ volatile ("sd s0, 2 * 8(a0)");
    800037f4:	00853823          	sd	s0,16(a0)
        __asm__ volatile ("sd s1, 3 * 8(a0)");
    800037f8:	00953c23          	sd	s1,24(a0)
        __asm__ volatile ("sd s2, 4 * 8(a0)");
    800037fc:	03253023          	sd	s2,32(a0)
        __asm__ volatile ("sd s3, 5 * 8(a0)");
    80003800:	03353423          	sd	s3,40(a0)
        __asm__ volatile ("sd s4, 6 * 8(a0)");
    80003804:	03453823          	sd	s4,48(a0)
        __asm__ volatile ("sd s5, 7 * 8(a0)");
    80003808:	03553c23          	sd	s5,56(a0)
        __asm__ volatile ("sd s6, 8 * 8(a0)");
    8000380c:	05653023          	sd	s6,64(a0)
        __asm__ volatile ("sd s7, 9 * 8(a0)");
    80003810:	05753423          	sd	s7,72(a0)
        __asm__ volatile ("sd s8, 10 * 8(a0)");
    80003814:	05853823          	sd	s8,80(a0)
        __asm__ volatile ("sd s9, 11 * 8(a0)");
    80003818:	05953c23          	sd	s9,88(a0)
        __asm__ volatile ("sd s10, 12 * 8(a0)");
    8000381c:	07a53023          	sd	s10,96(a0)
        __asm__ volatile ("sd s11, 13 * 8(a0)");
    80003820:	07b53423          	sd	s11,104(a0)
        
        __asm__ volatile("csrr s0, sstatus");
    80003824:	10002473          	csrr	s0,sstatus
        __asm__ volatile ("sd s0, 14 * 8(a0)");
    80003828:	06853823          	sd	s0,112(a0)
    }
    
    
    __asm__ volatile ("ld sp, 8(a1)");
    8000382c:	0085b103          	ld	sp,8(a1)
    __asm__ volatile ("ld ra, 0(a1)");
    80003830:	0005b083          	ld	ra,0(a1)

    __asm__ volatile ("ld s0, 14 * 8(a0)");
    80003834:	07053403          	ld	s0,112(a0)
    __asm__ volatile("csrw sstatus, s0");
    80003838:	10041073          	csrw	sstatus,s0

    __asm__ volatile ("ld s0, 2 * 8(a1)");
    8000383c:	0105b403          	ld	s0,16(a1)
    __asm__ volatile ("ld s1, 3 * 8(a1)");
    80003840:	0185b483          	ld	s1,24(a1)
    __asm__ volatile ("ld s2, 4 * 8(a1)");
    80003844:	0205b903          	ld	s2,32(a1)
    __asm__ volatile ("ld s3, 5 * 8(a1)");
    80003848:	0285b983          	ld	s3,40(a1)
    __asm__ volatile ("ld s4, 6 * 8(a1)");
    8000384c:	0305ba03          	ld	s4,48(a1)
    __asm__ volatile ("ld s5, 7 * 8(a1)");
    80003850:	0385ba83          	ld	s5,56(a1)
    __asm__ volatile ("ld s6, 8 * 8(a1)");
    80003854:	0405bb03          	ld	s6,64(a1)
    __asm__ volatile ("ld s7, 9 * 8(a1)");
    80003858:	0485bb83          	ld	s7,72(a1)
    __asm__ volatile ("ld s8, 10 * 8(a1)");
    8000385c:	0505bc03          	ld	s8,80(a1)
    __asm__ volatile ("ld s9, 11 * 8(a1)");
    80003860:	0585bc83          	ld	s9,88(a1)
    __asm__ volatile ("ld s10, 12 * 8(a1)");
    80003864:	0605bd03          	ld	s10,96(a1)
    __asm__ volatile ("ld s11, 13 * 8(a1)");
    80003868:	0685bd83          	ld	s11,104(a1)

    return;

}
    8000386c:	00813403          	ld	s0,8(sp)
    80003870:	01010113          	addi	sp,sp,16
    80003874:	00008067          	ret

0000000080003878 <_ZN7_thread8dispatchEv>:
void _thread::dispatch(){
    80003878:	fe010113          	addi	sp,sp,-32
    8000387c:	00113c23          	sd	ra,24(sp)
    80003880:	00813823          	sd	s0,16(sp)
    80003884:	00913423          	sd	s1,8(sp)
    80003888:	01213023          	sd	s2,0(sp)
    8000388c:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    80003890:	0000a917          	auipc	s2,0xa
    80003894:	7a890913          	addi	s2,s2,1960 # 8000e038 <_ZN7_thread6nextIDE>
    80003898:	00893483          	ld	s1,8(s2)
    currentThread =  Scheduler::get();
    8000389c:	00001097          	auipc	ra,0x1
    800038a0:	300080e7          	jalr	768(ra) # 80004b9c <_ZN9Scheduler3getEv>
    800038a4:	00a93423          	sd	a0,8(s2)
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    800038a8:	00200793          	li	a5,2
    800038ac:	08f4b423          	sd	a5,136(s1)
    if(currentThread == 0){
    800038b0:	04050463          	beqz	a0,800038f8 <_ZN7_thread8dispatchEv+0x80>
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    800038b4:	00048c63          	beqz	s1,800038cc <_ZN7_thread8dispatchEv+0x54>
    800038b8:	0984b783          	ld	a5,152(s1)
    800038bc:	00f00713          	li	a4,15
    800038c0:	02071713          	slli	a4,a4,0x20
    800038c4:	00e7f7b3          	and	a5,a5,a4
    800038c8:	02078e63          	beqz	a5,80003904 <_ZN7_thread8dispatchEv+0x8c>
    contextSwitch(oldThread == 0?0:&(oldThread->context), &(currentThread->context));
    800038cc:	0000a597          	auipc	a1,0xa
    800038d0:	7745b583          	ld	a1,1908(a1) # 8000e040 <_ZN7_thread13currentThreadE>
    800038d4:	00048513          	mv	a0,s1
    800038d8:	00000097          	auipc	ra,0x0
    800038dc:	f04080e7          	jalr	-252(ra) # 800037dc <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    800038e0:	01813083          	ld	ra,24(sp)
    800038e4:	01013403          	ld	s0,16(sp)
    800038e8:	00813483          	ld	s1,8(sp)
    800038ec:	00013903          	ld	s2,0(sp)
    800038f0:	02010113          	addi	sp,sp,32
    800038f4:	00008067          	ret
        currentThread = oldThread;
    800038f8:	0000a797          	auipc	a5,0xa
    800038fc:	7497b423          	sd	s1,1864(a5) # 8000e040 <_ZN7_thread13currentThreadE>
        return;
    80003900:	fe1ff06f          	j	800038e0 <_ZN7_thread8dispatchEv+0x68>
        Scheduler::put(oldThread);
    80003904:	00048513          	mv	a0,s1
    80003908:	00001097          	auipc	ra,0x1
    8000390c:	0a4080e7          	jalr	164(ra) # 800049ac <_ZN9Scheduler3putEP7_thread>
    80003910:	fbdff06f          	j	800038cc <_ZN7_thread8dispatchEv+0x54>

0000000080003914 <_ZN11HeapManagerC1Ev>:
#include "assert.h"
#include "heapManager.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80003914:	fe010113          	addi	sp,sp,-32
    80003918:	00113c23          	sd	ra,24(sp)
    8000391c:	00813823          	sd	s0,16(sp)
    80003920:	00913423          	sd	s1,8(sp)
    80003924:	02010413          	addi	s0,sp,32
    80003928:	00050493          	mv	s1,a0
    assert(instance == 0);
    8000392c:	0000a797          	auipc	a5,0xa
    80003930:	71c7b783          	ld	a5,1820(a5) # 8000e048 <_ZN11HeapManager8instanceE>
    80003934:	02079063          	bnez	a5,80003954 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80003938:	0000a797          	auipc	a5,0xa
    8000393c:	7097b823          	sd	s1,1808(a5) # 8000e048 <_ZN11HeapManager8instanceE>
}
    80003940:	01813083          	ld	ra,24(sp)
    80003944:	01013403          	ld	s0,16(sp)
    80003948:	00813483          	ld	s1,8(sp)
    8000394c:	02010113          	addi	sp,sp,32
    80003950:	00008067          	ret
    assert(instance == 0);
    80003954:	00008697          	auipc	a3,0x8
    80003958:	83468693          	addi	a3,a3,-1996 # 8000b188 <CONSOLE_STATUS+0x178>
    8000395c:	01100613          	li	a2,17
    80003960:	00008597          	auipc	a1,0x8
    80003964:	84858593          	addi	a1,a1,-1976 # 8000b1a8 <CONSOLE_STATUS+0x198>
    80003968:	00007517          	auipc	a0,0x7
    8000396c:	6d850513          	addi	a0,a0,1752 # 8000b040 <CONSOLE_STATUS+0x30>
    80003970:	ffffe097          	auipc	ra,0xffffe
    80003974:	704080e7          	jalr	1796(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
    80003978:	fc1ff06f          	j	80003938 <_ZN11HeapManagerC1Ev+0x24>

000000008000397c <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    8000397c:	ff010113          	addi	sp,sp,-16
    80003980:	00813423          	sd	s0,8(sp)
    80003984:	01010413          	addi	s0,sp,16
    
}
    80003988:	00813403          	ld	s0,8(sp)
    8000398c:	01010113          	addi	sp,sp,16
    80003990:	00008067          	ret

0000000080003994 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uint64 nStart, size_t nEnd){
    80003994:	fd010113          	addi	sp,sp,-48
    80003998:	02113423          	sd	ra,40(sp)
    8000399c:	02813023          	sd	s0,32(sp)
    800039a0:	00913c23          	sd	s1,24(sp)
    800039a4:	01213823          	sd	s2,16(sp)
    800039a8:	01313423          	sd	s3,8(sp)
    800039ac:	03010413          	addi	s0,sp,48
    800039b0:	00050993          	mv	s3,a0
    800039b4:	00058913          	mv	s2,a1
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    800039b8:	40b604b3          	sub	s1,a2,a1
    800039bc:	0414b793          	sltiu	a5,s1,65
    800039c0:	0c079863          	bnez	a5,80003a90 <_ZN11HeapManager4initEmm+0xfc>
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    800039c4:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    800039c8:	fde00793          	li	a5,-34
    800039cc:	00f90c23          	sb	a5,24(s2)
    800039d0:	fc000713          	li	a4,-64
    800039d4:	00e90ca3          	sb	a4,25(s2)
    800039d8:	fad00713          	li	a4,-83
    800039dc:	00e90d23          	sb	a4,26(s2)
    800039e0:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    800039e4:	0064d613          	srli	a2,s1,0x6
    800039e8:	0009b783          	ld	a5,0(s3)
    800039ec:	fff60613          	addi	a2,a2,-1
    800039f0:	00c78823          	sb	a2,16(a5)
    800039f4:	00865713          	srli	a4,a2,0x8
    800039f8:	00e788a3          	sb	a4,17(a5)
    800039fc:	01065713          	srli	a4,a2,0x10
    80003a00:	00e78923          	sb	a4,18(a5)
    80003a04:	0186571b          	srliw	a4,a2,0x18
    80003a08:	00e789a3          	sb	a4,19(a5)
    80003a0c:	02065713          	srli	a4,a2,0x20
    80003a10:	00e78a23          	sb	a4,20(a5)
    80003a14:	02865713          	srli	a4,a2,0x28
    80003a18:	00e78aa3          	sb	a4,21(a5)
    80003a1c:	03065713          	srli	a4,a2,0x30
    80003a20:	00e78b23          	sb	a4,22(a5)
    80003a24:	03865613          	srli	a2,a2,0x38
    80003a28:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80003a2c:	0009b783          	ld	a5,0(s3)
    80003a30:	00078023          	sb	zero,0(a5)
    80003a34:	000780a3          	sb	zero,1(a5)
    80003a38:	00078123          	sb	zero,2(a5)
    80003a3c:	000781a3          	sb	zero,3(a5)
    80003a40:	00078223          	sb	zero,4(a5)
    80003a44:	000782a3          	sb	zero,5(a5)
    80003a48:	00078323          	sb	zero,6(a5)
    80003a4c:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80003a50:	0009b783          	ld	a5,0(s3)
    80003a54:	00078423          	sb	zero,8(a5)
    80003a58:	000784a3          	sb	zero,9(a5)
    80003a5c:	00078523          	sb	zero,10(a5)
    80003a60:	000785a3          	sb	zero,11(a5)
    80003a64:	00078623          	sb	zero,12(a5)
    80003a68:	000786a3          	sb	zero,13(a5)
    80003a6c:	00078723          	sb	zero,14(a5)
    80003a70:	000787a3          	sb	zero,15(a5)
}
    80003a74:	02813083          	ld	ra,40(sp)
    80003a78:	02013403          	ld	s0,32(sp)
    80003a7c:	01813483          	ld	s1,24(sp)
    80003a80:	01013903          	ld	s2,16(sp)
    80003a84:	00813983          	ld	s3,8(sp)
    80003a88:	03010113          	addi	sp,sp,48
    80003a8c:	00008067          	ret
    assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003a90:	00007697          	auipc	a3,0x7
    80003a94:	73068693          	addi	a3,a3,1840 # 8000b1c0 <CONSOLE_STATUS+0x1b0>
    80003a98:	01a00613          	li	a2,26
    80003a9c:	00007597          	auipc	a1,0x7
    80003aa0:	70c58593          	addi	a1,a1,1804 # 8000b1a8 <CONSOLE_STATUS+0x198>
    80003aa4:	00007517          	auipc	a0,0x7
    80003aa8:	74450513          	addi	a0,a0,1860 # 8000b1e8 <CONSOLE_STATUS+0x1d8>
    80003aac:	ffffe097          	auipc	ra,0xffffe
    80003ab0:	5c8080e7          	jalr	1480(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
    80003ab4:	f11ff06f          	j	800039c4 <_ZN11HeapManager4initEmm+0x30>

0000000080003ab8 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80003ab8:	fe010113          	addi	sp,sp,-32
    80003abc:	00113c23          	sd	ra,24(sp)
    80003ac0:	00813823          	sd	s0,16(sp)
    80003ac4:	00913423          	sd	s1,8(sp)
    80003ac8:	01213023          	sd	s2,0(sp)
    80003acc:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003ad0:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    80003ad4:	00000913          	li	s2,0
    80003ad8:	0b80006f          	j	80003b90 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        nFreeMemory += pCurrent->nSize;
    80003adc:	0104c783          	lbu	a5,16(s1)
    80003ae0:	0114c703          	lbu	a4,17(s1)
    80003ae4:	00871713          	slli	a4,a4,0x8
    80003ae8:	00f76733          	or	a4,a4,a5
    80003aec:	0124c783          	lbu	a5,18(s1)
    80003af0:	01079793          	slli	a5,a5,0x10
    80003af4:	00e7e733          	or	a4,a5,a4
    80003af8:	0134c783          	lbu	a5,19(s1)
    80003afc:	01879793          	slli	a5,a5,0x18
    80003b00:	00e7e7b3          	or	a5,a5,a4
    80003b04:	0144c703          	lbu	a4,20(s1)
    80003b08:	02071713          	slli	a4,a4,0x20
    80003b0c:	00f767b3          	or	a5,a4,a5
    80003b10:	0154c703          	lbu	a4,21(s1)
    80003b14:	02871713          	slli	a4,a4,0x28
    80003b18:	00f76733          	or	a4,a4,a5
    80003b1c:	0164c783          	lbu	a5,22(s1)
    80003b20:	03079793          	slli	a5,a5,0x30
    80003b24:	00e7e733          	or	a4,a5,a4
    80003b28:	0174c783          	lbu	a5,23(s1)
    80003b2c:	03879793          	slli	a5,a5,0x38
    80003b30:	00e7e7b3          	or	a5,a5,a4
    80003b34:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80003b38:	0004c703          	lbu	a4,0(s1)
    80003b3c:	0014c783          	lbu	a5,1(s1)
    80003b40:	00879793          	slli	a5,a5,0x8
    80003b44:	00e7e733          	or	a4,a5,a4
    80003b48:	0024c783          	lbu	a5,2(s1)
    80003b4c:	01079793          	slli	a5,a5,0x10
    80003b50:	00e7e7b3          	or	a5,a5,a4
    80003b54:	0034c703          	lbu	a4,3(s1)
    80003b58:	01871713          	slli	a4,a4,0x18
    80003b5c:	00f767b3          	or	a5,a4,a5
    80003b60:	0044c703          	lbu	a4,4(s1)
    80003b64:	02071713          	slli	a4,a4,0x20
    80003b68:	00f76733          	or	a4,a4,a5
    80003b6c:	0054c783          	lbu	a5,5(s1)
    80003b70:	02879793          	slli	a5,a5,0x28
    80003b74:	00e7e733          	or	a4,a5,a4
    80003b78:	0064c783          	lbu	a5,6(s1)
    80003b7c:	03079793          	slli	a5,a5,0x30
    80003b80:	00e7e7b3          	or	a5,a5,a4
    80003b84:	0074c483          	lbu	s1,7(s1)
    80003b88:	03849493          	slli	s1,s1,0x38
    80003b8c:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003b90:	06048263          	beqz	s1,80003bf4 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003b94:	0184c783          	lbu	a5,24(s1)
    80003b98:	0194c703          	lbu	a4,25(s1)
    80003b9c:	00871713          	slli	a4,a4,0x8
    80003ba0:	00f76733          	or	a4,a4,a5
    80003ba4:	01a4c783          	lbu	a5,26(s1)
    80003ba8:	01079793          	slli	a5,a5,0x10
    80003bac:	00e7e733          	or	a4,a5,a4
    80003bb0:	01b4c783          	lbu	a5,27(s1)
    80003bb4:	01879793          	slli	a5,a5,0x18
    80003bb8:	00e7e7b3          	or	a5,a5,a4
    80003bbc:	0007879b          	sext.w	a5,a5
    80003bc0:	deadc737          	lui	a4,0xdeadc
    80003bc4:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eaccdde>
    80003bc8:	f0e78ae3          	beq	a5,a4,80003adc <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    80003bcc:	00007697          	auipc	a3,0x7
    80003bd0:	63c68693          	addi	a3,a3,1596 # 8000b208 <CONSOLE_STATUS+0x1f8>
    80003bd4:	02700613          	li	a2,39
    80003bd8:	00007597          	auipc	a1,0x7
    80003bdc:	5d058593          	addi	a1,a1,1488 # 8000b1a8 <CONSOLE_STATUS+0x198>
    80003be0:	00007517          	auipc	a0,0x7
    80003be4:	65050513          	addi	a0,a0,1616 # 8000b230 <CONSOLE_STATUS+0x220>
    80003be8:	ffffe097          	auipc	ra,0xffffe
    80003bec:	48c080e7          	jalr	1164(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
    80003bf0:	eedff06f          	j	80003adc <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    80003bf4:	00090513          	mv	a0,s2
    80003bf8:	01813083          	ld	ra,24(sp)
    80003bfc:	01013403          	ld	s0,16(sp)
    80003c00:	00813483          	ld	s1,8(sp)
    80003c04:	00013903          	ld	s2,0(sp)
    80003c08:	02010113          	addi	sp,sp,32
    80003c0c:	00008067          	ret

0000000080003c10 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80003c10:	fd010113          	addi	sp,sp,-48
    80003c14:	02113423          	sd	ra,40(sp)
    80003c18:	02813023          	sd	s0,32(sp)
    80003c1c:	00913c23          	sd	s1,24(sp)
    80003c20:	01213823          	sd	s2,16(sp)
    80003c24:	01313423          	sd	s3,8(sp)
    80003c28:	03010413          	addi	s0,sp,48
    80003c2c:	00050993          	mv	s3,a0
    80003c30:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003c34:	00053483          	ld	s1,0(a0)
    80003c38:	0b80006f          	j	80003cf0 <_ZN11HeapManager12heapAllocateEm+0xe0>
    while(pCurrent != 0){
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        if(pCurrent->nSize >= nSize){
    80003c3c:	0104c783          	lbu	a5,16(s1)
    80003c40:	0114c703          	lbu	a4,17(s1)
    80003c44:	00871713          	slli	a4,a4,0x8
    80003c48:	00f76733          	or	a4,a4,a5
    80003c4c:	0124c783          	lbu	a5,18(s1)
    80003c50:	01079793          	slli	a5,a5,0x10
    80003c54:	00e7e733          	or	a4,a5,a4
    80003c58:	0134c783          	lbu	a5,19(s1)
    80003c5c:	01879793          	slli	a5,a5,0x18
    80003c60:	00e7e7b3          	or	a5,a5,a4
    80003c64:	0144c703          	lbu	a4,20(s1)
    80003c68:	02071713          	slli	a4,a4,0x20
    80003c6c:	00f767b3          	or	a5,a4,a5
    80003c70:	0154c703          	lbu	a4,21(s1)
    80003c74:	02871713          	slli	a4,a4,0x28
    80003c78:	00f76733          	or	a4,a4,a5
    80003c7c:	0164c783          	lbu	a5,22(s1)
    80003c80:	03079793          	slli	a5,a5,0x30
    80003c84:	00e7e733          	or	a4,a5,a4
    80003c88:	0174c783          	lbu	a5,23(s1)
    80003c8c:	03879793          	slli	a5,a5,0x38
    80003c90:	00e7e7b3          	or	a5,a5,a4
    80003c94:	0d27f063          	bgeu	a5,s2,80003d54 <_ZN11HeapManager12heapAllocateEm+0x144>
            if(pCurrent->pNext != 0){
                pCurrent->pNext->pPrev = pCurrent->pPrev;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80003c98:	0004c703          	lbu	a4,0(s1)
    80003c9c:	0014c783          	lbu	a5,1(s1)
    80003ca0:	00879793          	slli	a5,a5,0x8
    80003ca4:	00e7e733          	or	a4,a5,a4
    80003ca8:	0024c783          	lbu	a5,2(s1)
    80003cac:	01079793          	slli	a5,a5,0x10
    80003cb0:	00e7e7b3          	or	a5,a5,a4
    80003cb4:	0034c703          	lbu	a4,3(s1)
    80003cb8:	01871713          	slli	a4,a4,0x18
    80003cbc:	00f767b3          	or	a5,a4,a5
    80003cc0:	0044c703          	lbu	a4,4(s1)
    80003cc4:	02071713          	slli	a4,a4,0x20
    80003cc8:	00f76733          	or	a4,a4,a5
    80003ccc:	0054c783          	lbu	a5,5(s1)
    80003cd0:	02879793          	slli	a5,a5,0x28
    80003cd4:	00e7e733          	or	a4,a5,a4
    80003cd8:	0064c783          	lbu	a5,6(s1)
    80003cdc:	03079793          	slli	a5,a5,0x30
    80003ce0:	00e7e7b3          	or	a5,a5,a4
    80003ce4:	0074c483          	lbu	s1,7(s1)
    80003ce8:	03849493          	slli	s1,s1,0x38
    80003cec:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003cf0:	4e048c63          	beqz	s1,800041e8 <_ZN11HeapManager12heapAllocateEm+0x5d8>
        assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003cf4:	0184c783          	lbu	a5,24(s1)
    80003cf8:	0194c703          	lbu	a4,25(s1)
    80003cfc:	00871713          	slli	a4,a4,0x8
    80003d00:	00f76733          	or	a4,a4,a5
    80003d04:	01a4c783          	lbu	a5,26(s1)
    80003d08:	01079793          	slli	a5,a5,0x10
    80003d0c:	00e7e733          	or	a4,a5,a4
    80003d10:	01b4c783          	lbu	a5,27(s1)
    80003d14:	01879793          	slli	a5,a5,0x18
    80003d18:	00e7e7b3          	or	a5,a5,a4
    80003d1c:	0007879b          	sext.w	a5,a5
    80003d20:	deadc737          	lui	a4,0xdeadc
    80003d24:	0de70713          	addi	a4,a4,222 # ffffffffdeadc0de <end+0xffffffff5eaccdde>
    80003d28:	f0e78ae3          	beq	a5,a4,80003c3c <_ZN11HeapManager12heapAllocateEm+0x2c>
    80003d2c:	00007697          	auipc	a3,0x7
    80003d30:	52c68693          	addi	a3,a3,1324 # 8000b258 <CONSOLE_STATUS+0x248>
    80003d34:	03100613          	li	a2,49
    80003d38:	00007597          	auipc	a1,0x7
    80003d3c:	47058593          	addi	a1,a1,1136 # 8000b1a8 <CONSOLE_STATUS+0x198>
    80003d40:	00007517          	auipc	a0,0x7
    80003d44:	4f050513          	addi	a0,a0,1264 # 8000b230 <CONSOLE_STATUS+0x220>
    80003d48:	ffffe097          	auipc	ra,0xffffe
    80003d4c:	32c080e7          	jalr	812(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
    80003d50:	eedff06f          	j	80003c3c <_ZN11HeapManager12heapAllocateEm+0x2c>
            if(pCurrent->nSize > nSize + 1){
    80003d54:	00190713          	addi	a4,s2,1
    80003d58:	2af77263          	bgeu	a4,a5,80003ffc <_ZN11HeapManager12heapAllocateEm+0x3ec>
                HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80003d5c:	00671793          	slli	a5,a4,0x6
    80003d60:	00f487b3          	add	a5,s1,a5
                pNew->u32Magic = HEAP_BLOCK_MAGIC;
    80003d64:	fde00713          	li	a4,-34
    80003d68:	00e78c23          	sb	a4,24(a5)
    80003d6c:	fc000693          	li	a3,-64
    80003d70:	00d78ca3          	sb	a3,25(a5)
    80003d74:	fad00693          	li	a3,-83
    80003d78:	00d78d23          	sb	a3,26(a5)
    80003d7c:	00e78da3          	sb	a4,27(a5)
                pNew->nSize = pCurrent->nSize - nSize - 1;
    80003d80:	0104c703          	lbu	a4,16(s1)
    80003d84:	0114c683          	lbu	a3,17(s1)
    80003d88:	00869693          	slli	a3,a3,0x8
    80003d8c:	00e6e6b3          	or	a3,a3,a4
    80003d90:	0124c703          	lbu	a4,18(s1)
    80003d94:	01071713          	slli	a4,a4,0x10
    80003d98:	00d766b3          	or	a3,a4,a3
    80003d9c:	0134c703          	lbu	a4,19(s1)
    80003da0:	01871713          	slli	a4,a4,0x18
    80003da4:	00d76733          	or	a4,a4,a3
    80003da8:	0144c683          	lbu	a3,20(s1)
    80003dac:	02069693          	slli	a3,a3,0x20
    80003db0:	00e6e733          	or	a4,a3,a4
    80003db4:	0154c683          	lbu	a3,21(s1)
    80003db8:	02869693          	slli	a3,a3,0x28
    80003dbc:	00e6e6b3          	or	a3,a3,a4
    80003dc0:	0164c703          	lbu	a4,22(s1)
    80003dc4:	03071713          	slli	a4,a4,0x30
    80003dc8:	00d766b3          	or	a3,a4,a3
    80003dcc:	0174c703          	lbu	a4,23(s1)
    80003dd0:	03871713          	slli	a4,a4,0x38
    80003dd4:	00d76733          	or	a4,a4,a3
    80003dd8:	41270733          	sub	a4,a4,s2
    80003ddc:	fff70713          	addi	a4,a4,-1
    80003de0:	00e78823          	sb	a4,16(a5)
    80003de4:	00875693          	srli	a3,a4,0x8
    80003de8:	00d788a3          	sb	a3,17(a5)
    80003dec:	01075693          	srli	a3,a4,0x10
    80003df0:	00d78923          	sb	a3,18(a5)
    80003df4:	0187569b          	srliw	a3,a4,0x18
    80003df8:	00d789a3          	sb	a3,19(a5)
    80003dfc:	02075693          	srli	a3,a4,0x20
    80003e00:	00d78a23          	sb	a3,20(a5)
    80003e04:	02875693          	srli	a3,a4,0x28
    80003e08:	00d78aa3          	sb	a3,21(a5)
    80003e0c:	03075693          	srli	a3,a4,0x30
    80003e10:	00d78b23          	sb	a3,22(a5)
    80003e14:	03875713          	srli	a4,a4,0x38
    80003e18:	00e78ba3          	sb	a4,23(a5)
                pNew->pNext = pCurrent->pNext;
    80003e1c:	0004c703          	lbu	a4,0(s1)
    80003e20:	0014c683          	lbu	a3,1(s1)
    80003e24:	00869693          	slli	a3,a3,0x8
    80003e28:	00e6e733          	or	a4,a3,a4
    80003e2c:	0024c683          	lbu	a3,2(s1)
    80003e30:	01069693          	slli	a3,a3,0x10
    80003e34:	00e6e6b3          	or	a3,a3,a4
    80003e38:	0034c703          	lbu	a4,3(s1)
    80003e3c:	01871713          	slli	a4,a4,0x18
    80003e40:	00d766b3          	or	a3,a4,a3
    80003e44:	0044c703          	lbu	a4,4(s1)
    80003e48:	02071713          	slli	a4,a4,0x20
    80003e4c:	00d76733          	or	a4,a4,a3
    80003e50:	0054c683          	lbu	a3,5(s1)
    80003e54:	02869693          	slli	a3,a3,0x28
    80003e58:	00e6e733          	or	a4,a3,a4
    80003e5c:	0064c683          	lbu	a3,6(s1)
    80003e60:	03069693          	slli	a3,a3,0x30
    80003e64:	00e6e6b3          	or	a3,a3,a4
    80003e68:	0074c703          	lbu	a4,7(s1)
    80003e6c:	03871713          	slli	a4,a4,0x38
    80003e70:	00d76733          	or	a4,a4,a3
    80003e74:	00d78023          	sb	a3,0(a5)
    80003e78:	00875693          	srli	a3,a4,0x8
    80003e7c:	00d780a3          	sb	a3,1(a5)
    80003e80:	01075693          	srli	a3,a4,0x10
    80003e84:	00d78123          	sb	a3,2(a5)
    80003e88:	0187569b          	srliw	a3,a4,0x18
    80003e8c:	00d781a3          	sb	a3,3(a5)
    80003e90:	02075693          	srli	a3,a4,0x20
    80003e94:	00d78223          	sb	a3,4(a5)
    80003e98:	02875693          	srli	a3,a4,0x28
    80003e9c:	00d782a3          	sb	a3,5(a5)
    80003ea0:	03075693          	srli	a3,a4,0x30
    80003ea4:	00d78323          	sb	a3,6(a5)
    80003ea8:	03875713          	srli	a4,a4,0x38
    80003eac:	00e783a3          	sb	a4,7(a5)
                pNew->pPrev = pCurrent;
    80003eb0:	00978423          	sb	s1,8(a5)
    80003eb4:	0084d713          	srli	a4,s1,0x8
    80003eb8:	00e784a3          	sb	a4,9(a5)
    80003ebc:	0104d713          	srli	a4,s1,0x10
    80003ec0:	00e78523          	sb	a4,10(a5)
    80003ec4:	0184d71b          	srliw	a4,s1,0x18
    80003ec8:	00e785a3          	sb	a4,11(a5)
    80003ecc:	0204d713          	srli	a4,s1,0x20
    80003ed0:	00e78623          	sb	a4,12(a5)
    80003ed4:	0284d713          	srli	a4,s1,0x28
    80003ed8:	00e786a3          	sb	a4,13(a5)
    80003edc:	0304d713          	srli	a4,s1,0x30
    80003ee0:	00e78723          	sb	a4,14(a5)
    80003ee4:	0384d713          	srli	a4,s1,0x38
    80003ee8:	00e787a3          	sb	a4,15(a5)
                if(pCurrent->pNext != 0){
    80003eec:	0004c703          	lbu	a4,0(s1)
    80003ef0:	0014c683          	lbu	a3,1(s1)
    80003ef4:	00869693          	slli	a3,a3,0x8
    80003ef8:	00e6e6b3          	or	a3,a3,a4
    80003efc:	0024c703          	lbu	a4,2(s1)
    80003f00:	01071713          	slli	a4,a4,0x10
    80003f04:	00d766b3          	or	a3,a4,a3
    80003f08:	0034c703          	lbu	a4,3(s1)
    80003f0c:	01871713          	slli	a4,a4,0x18
    80003f10:	00d76733          	or	a4,a4,a3
    80003f14:	0044c683          	lbu	a3,4(s1)
    80003f18:	02069693          	slli	a3,a3,0x20
    80003f1c:	00e6e733          	or	a4,a3,a4
    80003f20:	0054c683          	lbu	a3,5(s1)
    80003f24:	02869693          	slli	a3,a3,0x28
    80003f28:	00e6e6b3          	or	a3,a3,a4
    80003f2c:	0064c703          	lbu	a4,6(s1)
    80003f30:	03071713          	slli	a4,a4,0x30
    80003f34:	00d766b3          	or	a3,a4,a3
    80003f38:	0074c703          	lbu	a4,7(s1)
    80003f3c:	03871713          	slli	a4,a4,0x38
    80003f40:	00d76733          	or	a4,a4,a3
    80003f44:	04070063          	beqz	a4,80003f84 <_ZN11HeapManager12heapAllocateEm+0x374>
                    pCurrent->pNext->pPrev = pNew;
    80003f48:	00f70423          	sb	a5,8(a4)
    80003f4c:	0087d693          	srli	a3,a5,0x8
    80003f50:	00d704a3          	sb	a3,9(a4)
    80003f54:	0107d693          	srli	a3,a5,0x10
    80003f58:	00d70523          	sb	a3,10(a4)
    80003f5c:	0187d69b          	srliw	a3,a5,0x18
    80003f60:	00d705a3          	sb	a3,11(a4)
    80003f64:	0207d693          	srli	a3,a5,0x20
    80003f68:	00d70623          	sb	a3,12(a4)
    80003f6c:	0287d693          	srli	a3,a5,0x28
    80003f70:	00d706a3          	sb	a3,13(a4)
    80003f74:	0307d693          	srli	a3,a5,0x30
    80003f78:	00d70723          	sb	a3,14(a4)
    80003f7c:	0387d693          	srli	a3,a5,0x38
    80003f80:	00d707a3          	sb	a3,15(a4)
                pCurrent->pNext = pNew;
    80003f84:	00f48023          	sb	a5,0(s1)
    80003f88:	0087d713          	srli	a4,a5,0x8
    80003f8c:	00e480a3          	sb	a4,1(s1)
    80003f90:	0107d713          	srli	a4,a5,0x10
    80003f94:	00e48123          	sb	a4,2(s1)
    80003f98:	0187d71b          	srliw	a4,a5,0x18
    80003f9c:	00e481a3          	sb	a4,3(s1)
    80003fa0:	0207d713          	srli	a4,a5,0x20
    80003fa4:	00e48223          	sb	a4,4(s1)
    80003fa8:	0287d713          	srli	a4,a5,0x28
    80003fac:	00e482a3          	sb	a4,5(s1)
    80003fb0:	0307d713          	srli	a4,a5,0x30
    80003fb4:	00e48323          	sb	a4,6(s1)
    80003fb8:	0387d793          	srli	a5,a5,0x38
    80003fbc:	00f483a3          	sb	a5,7(s1)
                pCurrent->nSize = nSize;
    80003fc0:	01248823          	sb	s2,16(s1)
    80003fc4:	00895793          	srli	a5,s2,0x8
    80003fc8:	00f488a3          	sb	a5,17(s1)
    80003fcc:	01095793          	srli	a5,s2,0x10
    80003fd0:	00f48923          	sb	a5,18(s1)
    80003fd4:	0189579b          	srliw	a5,s2,0x18
    80003fd8:	00f489a3          	sb	a5,19(s1)
    80003fdc:	02095793          	srli	a5,s2,0x20
    80003fe0:	00f48a23          	sb	a5,20(s1)
    80003fe4:	02895793          	srli	a5,s2,0x28
    80003fe8:	00f48aa3          	sb	a5,21(s1)
    80003fec:	03095793          	srli	a5,s2,0x30
    80003ff0:	00f48b23          	sb	a5,22(s1)
    80003ff4:	03895913          	srli	s2,s2,0x38
    80003ff8:	01248ba3          	sb	s2,23(s1)
            if(pCurrent == m_pHead){
    80003ffc:	0009b783          	ld	a5,0(s3)
    80004000:	20978463          	beq	a5,s1,80004208 <_ZN11HeapManager12heapAllocateEm+0x5f8>
            if(pCurrent->pPrev != 0){
    80004004:	0084c783          	lbu	a5,8(s1)
    80004008:	0094c703          	lbu	a4,9(s1)
    8000400c:	00871713          	slli	a4,a4,0x8
    80004010:	00f76733          	or	a4,a4,a5
    80004014:	00a4c783          	lbu	a5,10(s1)
    80004018:	01079793          	slli	a5,a5,0x10
    8000401c:	00e7e733          	or	a4,a5,a4
    80004020:	00b4c783          	lbu	a5,11(s1)
    80004024:	01879793          	slli	a5,a5,0x18
    80004028:	00e7e7b3          	or	a5,a5,a4
    8000402c:	00c4c703          	lbu	a4,12(s1)
    80004030:	02071713          	slli	a4,a4,0x20
    80004034:	00f767b3          	or	a5,a4,a5
    80004038:	00d4c703          	lbu	a4,13(s1)
    8000403c:	02871713          	slli	a4,a4,0x28
    80004040:	00f76733          	or	a4,a4,a5
    80004044:	00e4c783          	lbu	a5,14(s1)
    80004048:	03079793          	slli	a5,a5,0x30
    8000404c:	00e7e733          	or	a4,a5,a4
    80004050:	00f4c783          	lbu	a5,15(s1)
    80004054:	03879793          	slli	a5,a5,0x38
    80004058:	00e7e7b3          	or	a5,a5,a4
    8000405c:	08078c63          	beqz	a5,800040f4 <_ZN11HeapManager12heapAllocateEm+0x4e4>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80004060:	0004c703          	lbu	a4,0(s1)
    80004064:	0014c683          	lbu	a3,1(s1)
    80004068:	00869693          	slli	a3,a3,0x8
    8000406c:	00e6e733          	or	a4,a3,a4
    80004070:	0024c683          	lbu	a3,2(s1)
    80004074:	01069693          	slli	a3,a3,0x10
    80004078:	00e6e6b3          	or	a3,a3,a4
    8000407c:	0034c703          	lbu	a4,3(s1)
    80004080:	01871713          	slli	a4,a4,0x18
    80004084:	00d766b3          	or	a3,a4,a3
    80004088:	0044c703          	lbu	a4,4(s1)
    8000408c:	02071713          	slli	a4,a4,0x20
    80004090:	00d76733          	or	a4,a4,a3
    80004094:	0054c683          	lbu	a3,5(s1)
    80004098:	02869693          	slli	a3,a3,0x28
    8000409c:	00e6e733          	or	a4,a3,a4
    800040a0:	0064c683          	lbu	a3,6(s1)
    800040a4:	03069693          	slli	a3,a3,0x30
    800040a8:	00e6e6b3          	or	a3,a3,a4
    800040ac:	0074c703          	lbu	a4,7(s1)
    800040b0:	03871713          	slli	a4,a4,0x38
    800040b4:	00d76733          	or	a4,a4,a3
    800040b8:	00d78023          	sb	a3,0(a5)
    800040bc:	00875693          	srli	a3,a4,0x8
    800040c0:	00d780a3          	sb	a3,1(a5)
    800040c4:	01075693          	srli	a3,a4,0x10
    800040c8:	00d78123          	sb	a3,2(a5)
    800040cc:	0187569b          	srliw	a3,a4,0x18
    800040d0:	00d781a3          	sb	a3,3(a5)
    800040d4:	02075693          	srli	a3,a4,0x20
    800040d8:	00d78223          	sb	a3,4(a5)
    800040dc:	02875693          	srli	a3,a4,0x28
    800040e0:	00d782a3          	sb	a3,5(a5)
    800040e4:	03075693          	srli	a3,a4,0x30
    800040e8:	00d78323          	sb	a3,6(a5)
    800040ec:	03875713          	srli	a4,a4,0x38
    800040f0:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    800040f4:	0004c783          	lbu	a5,0(s1)
    800040f8:	0014c703          	lbu	a4,1(s1)
    800040fc:	00871713          	slli	a4,a4,0x8
    80004100:	00f76733          	or	a4,a4,a5
    80004104:	0024c783          	lbu	a5,2(s1)
    80004108:	01079793          	slli	a5,a5,0x10
    8000410c:	00e7e733          	or	a4,a5,a4
    80004110:	0034c783          	lbu	a5,3(s1)
    80004114:	01879793          	slli	a5,a5,0x18
    80004118:	00e7e7b3          	or	a5,a5,a4
    8000411c:	0044c703          	lbu	a4,4(s1)
    80004120:	02071713          	slli	a4,a4,0x20
    80004124:	00f767b3          	or	a5,a4,a5
    80004128:	0054c703          	lbu	a4,5(s1)
    8000412c:	02871713          	slli	a4,a4,0x28
    80004130:	00f76733          	or	a4,a4,a5
    80004134:	0064c783          	lbu	a5,6(s1)
    80004138:	03079793          	slli	a5,a5,0x30
    8000413c:	00e7e733          	or	a4,a5,a4
    80004140:	0074c783          	lbu	a5,7(s1)
    80004144:	03879793          	slli	a5,a5,0x38
    80004148:	00e7e7b3          	or	a5,a5,a4
    8000414c:	08078c63          	beqz	a5,800041e4 <_ZN11HeapManager12heapAllocateEm+0x5d4>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80004150:	0084c703          	lbu	a4,8(s1)
    80004154:	0094c683          	lbu	a3,9(s1)
    80004158:	00869693          	slli	a3,a3,0x8
    8000415c:	00e6e733          	or	a4,a3,a4
    80004160:	00a4c683          	lbu	a3,10(s1)
    80004164:	01069693          	slli	a3,a3,0x10
    80004168:	00e6e6b3          	or	a3,a3,a4
    8000416c:	00b4c703          	lbu	a4,11(s1)
    80004170:	01871713          	slli	a4,a4,0x18
    80004174:	00d766b3          	or	a3,a4,a3
    80004178:	00c4c703          	lbu	a4,12(s1)
    8000417c:	02071713          	slli	a4,a4,0x20
    80004180:	00d76733          	or	a4,a4,a3
    80004184:	00d4c683          	lbu	a3,13(s1)
    80004188:	02869693          	slli	a3,a3,0x28
    8000418c:	00e6e733          	or	a4,a3,a4
    80004190:	00e4c683          	lbu	a3,14(s1)
    80004194:	03069693          	slli	a3,a3,0x30
    80004198:	00e6e6b3          	or	a3,a3,a4
    8000419c:	00f4c703          	lbu	a4,15(s1)
    800041a0:	03871713          	slli	a4,a4,0x38
    800041a4:	00d76733          	or	a4,a4,a3
    800041a8:	00d78423          	sb	a3,8(a5)
    800041ac:	00875693          	srli	a3,a4,0x8
    800041b0:	00d784a3          	sb	a3,9(a5)
    800041b4:	01075693          	srli	a3,a4,0x10
    800041b8:	00d78523          	sb	a3,10(a5)
    800041bc:	0187569b          	srliw	a3,a4,0x18
    800041c0:	00d785a3          	sb	a3,11(a5)
    800041c4:	02075693          	srli	a3,a4,0x20
    800041c8:	00d78623          	sb	a3,12(a5)
    800041cc:	02875693          	srli	a3,a4,0x28
    800041d0:	00d786a3          	sb	a3,13(a5)
    800041d4:	03075693          	srli	a3,a4,0x30
    800041d8:	00d78723          	sb	a3,14(a5)
    800041dc:	03875713          	srli	a4,a4,0x38
    800041e0:	00e787a3          	sb	a4,15(a5)
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    800041e4:	04048493          	addi	s1,s1,64
    }
    return 0;
}
    800041e8:	00048513          	mv	a0,s1
    800041ec:	02813083          	ld	ra,40(sp)
    800041f0:	02013403          	ld	s0,32(sp)
    800041f4:	01813483          	ld	s1,24(sp)
    800041f8:	01013903          	ld	s2,16(sp)
    800041fc:	00813983          	ld	s3,8(sp)
    80004200:	03010113          	addi	sp,sp,48
    80004204:	00008067          	ret
                m_pHead = pCurrent->pNext;
    80004208:	0004c703          	lbu	a4,0(s1)
    8000420c:	0014c783          	lbu	a5,1(s1)
    80004210:	00879793          	slli	a5,a5,0x8
    80004214:	00e7e7b3          	or	a5,a5,a4
    80004218:	0024c703          	lbu	a4,2(s1)
    8000421c:	01071713          	slli	a4,a4,0x10
    80004220:	00f76733          	or	a4,a4,a5
    80004224:	0034c783          	lbu	a5,3(s1)
    80004228:	01879793          	slli	a5,a5,0x18
    8000422c:	00e7e733          	or	a4,a5,a4
    80004230:	0044c783          	lbu	a5,4(s1)
    80004234:	02079793          	slli	a5,a5,0x20
    80004238:	00e7e7b3          	or	a5,a5,a4
    8000423c:	0054c703          	lbu	a4,5(s1)
    80004240:	02871713          	slli	a4,a4,0x28
    80004244:	00f76733          	or	a4,a4,a5
    80004248:	0064c783          	lbu	a5,6(s1)
    8000424c:	03079793          	slli	a5,a5,0x30
    80004250:	00e7e733          	or	a4,a5,a4
    80004254:	0074c783          	lbu	a5,7(s1)
    80004258:	03879793          	slli	a5,a5,0x38
    8000425c:	00e7e7b3          	or	a5,a5,a4
    80004260:	00f9b023          	sd	a5,0(s3)
    80004264:	da1ff06f          	j	80004004 <_ZN11HeapManager12heapAllocateEm+0x3f4>

0000000080004268 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80004268:	ff010113          	addi	sp,sp,-16
    8000426c:	00813423          	sd	s0,8(sp)
    80004270:	01010413          	addi	s0,sp,16
    //     if(pFree->pNext != 0){
    //         pFree->pNext->pPrev = pFree;
    //     }
    // }
    return 0;
}
    80004274:	00000513          	li	a0,0
    80004278:	00813403          	ld	s0,8(sp)
    8000427c:	01010113          	addi	sp,sp,16
    80004280:	00008067          	ret

0000000080004284 <exceptionHandler>:
#include "thread.h"
#include "sem.h"
#include "timer.h"
#include "assert.h"

extern "C" void exceptionHandler(){
    80004284:	fc010113          	addi	sp,sp,-64
    80004288:	02113c23          	sd	ra,56(sp)
    8000428c:	02813823          	sd	s0,48(sp)
    80004290:	02913423          	sd	s1,40(sp)
    80004294:	03213023          	sd	s2,32(sp)
    80004298:	01313c23          	sd	s3,24(sp)
    8000429c:	01413823          	sd	s4,16(sp)
    800042a0:	01513423          	sd	s5,8(sp)
    800042a4:	01613023          	sd	s6,0(sp)
    800042a8:	04010413          	addi	s0,sp,64
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    800042ac:	00070b13          	mv	s6,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    800042b0:	00068a93          	mv	s5,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    800042b4:	00060a13          	mv	s4,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    800042b8:	00058993          	mv	s3,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    800042bc:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    800042c0:	14202773          	csrr	a4,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    800042c4:	10002973          	csrr	s2,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    800042c8:	141024f3          	csrr	s1,sepc


    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    800042cc:	ff870613          	addi	a2,a4,-8
    800042d0:	00100693          	li	a3,1
    800042d4:	04c6fc63          	bgeu	a3,a2,8000432c <exceptionHandler+0xa8>
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    800042d8:	00500793          	li	a5,5
    800042dc:	24f70663          	beq	a4,a5,80004528 <exceptionHandler+0x2a4>
                putc('A' + tmp - 10);
            }
        }
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    800042e0:	00700793          	li	a5,7
    800042e4:	3ef70e63          	beq	a4,a5,800046e0 <exceptionHandler+0x45c>
                putc('A' + tmp - 10);
            }
        }        
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    800042e8:	fff00793          	li	a5,-1
    800042ec:	03f79793          	slli	a5,a5,0x3f
    800042f0:	00178793          	addi	a5,a5,1
    800042f4:	5af70863          	beq	a4,a5,800048a4 <exceptionHandler+0x620>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    800042f8:	fff00793          	li	a5,-1
    800042fc:	03f79793          	slli	a5,a5,0x3f
    80004300:	00978793          	addi	a5,a5,9
    80004304:	0af71063          	bne	a4,a5,800043a4 <exceptionHandler+0x120>
    {   
        int irq = plic_claim();
    80004308:	00005097          	auipc	ra,0x5
    8000430c:	9ec080e7          	jalr	-1556(ra) # 80008cf4 <plic_claim>
    80004310:	00050493          	mv	s1,a0
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    80004314:	00a00793          	li	a5,10
    80004318:	5ef50863          	beq	a0,a5,80004908 <exceptionHandler+0x684>
        plic_complete(irq);
    8000431c:	00048513          	mv	a0,s1
    80004320:	00005097          	auipc	ra,0x5
    80004324:	a0c080e7          	jalr	-1524(ra) # 80008d2c <plic_complete>
    80004328:	07c0006f          	j	800043a4 <exceptionHandler+0x120>
        switch(a0){
    8000432c:	04200713          	li	a4,66
    80004330:	02f76463          	bltu	a4,a5,80004358 <exceptionHandler+0xd4>
    80004334:	1e078263          	beqz	a5,80004518 <exceptionHandler+0x294>
    80004338:	1ef76463          	bltu	a4,a5,80004520 <exceptionHandler+0x29c>
    8000433c:	00279793          	slli	a5,a5,0x2
    80004340:	00007717          	auipc	a4,0x7
    80004344:	fa470713          	addi	a4,a4,-92 # 8000b2e4 <CONSOLE_STATUS+0x2d4>
    80004348:	00e787b3          	add	a5,a5,a4
    8000434c:	0007a783          	lw	a5,0(a5)
    80004350:	00e787b3          	add	a5,a5,a4
    80004354:	00078067          	jr	a5
    80004358:	0ff00713          	li	a4,255
    8000435c:	02e79663          	bne	a5,a4,80004388 <exceptionHandler+0x104>
                __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80004360:	00000793          	li	a5,0
    80004364:	00078513          	mv	a0,a5
                __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80004368:	00448493          	addi	s1,s1,4
    8000436c:	14149073          	csrw	sepc,s1
                __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004370:	10091073          	csrw	sstatus,s2
                __asm__ volatile("csrc sstatus, %0" :: "r"(1 << 8));
    80004374:	10000793          	li	a5,256
    80004378:	1007b073          	csrc	sstatus,a5
                __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    8000437c:	00200793          	li	a5,2
    80004380:	1447b073          	csrc	sip,a5
                return;
    80004384:	0200006f          	j	800043a4 <exceptionHandler+0x120>
        switch(a0){
    80004388:	00000993          	li	s3,0
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    8000438c:	00098513          	mv	a0,s3
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80004390:	00448493          	addi	s1,s1,4
    80004394:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004398:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    8000439c:	00200793          	li	a5,2
    800043a0:	1447b073          	csrc	sip,a5
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
    }
    800043a4:	03813083          	ld	ra,56(sp)
    800043a8:	03013403          	ld	s0,48(sp)
    800043ac:	02813483          	ld	s1,40(sp)
    800043b0:	02013903          	ld	s2,32(sp)
    800043b4:	01813983          	ld	s3,24(sp)
    800043b8:	01013a03          	ld	s4,16(sp)
    800043bc:	00813a83          	ld	s5,8(sp)
    800043c0:	00013b03          	ld	s6,0(sp)
    800043c4:	04010113          	addi	sp,sp,64
    800043c8:	00008067          	ret
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    800043cc:	00098593          	mv	a1,s3
    800043d0:	0000a797          	auipc	a5,0xa
    800043d4:	bd07b783          	ld	a5,-1072(a5) # 8000dfa0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800043d8:	0007b503          	ld	a0,0(a5)
    800043dc:	00000097          	auipc	ra,0x0
    800043e0:	834080e7          	jalr	-1996(ra) # 80003c10 <_ZN11HeapManager12heapAllocateEm>
    800043e4:	00050993          	mv	s3,a0
                break;
    800043e8:	fa5ff06f          	j	8000438c <exceptionHandler+0x108>
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    800043ec:	00098593          	mv	a1,s3
    800043f0:	0000a797          	auipc	a5,0xa
    800043f4:	bb07b783          	ld	a5,-1104(a5) # 8000dfa0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800043f8:	0007b503          	ld	a0,0(a5)
    800043fc:	00000097          	auipc	ra,0x0
    80004400:	e6c080e7          	jalr	-404(ra) # 80004268 <_ZN11HeapManager8heapFreeEPv>
    80004404:	00050993          	mv	s3,a0
                break;
    80004408:	f85ff06f          	j	8000438c <exceptionHandler+0x108>
                putc('\0'); /// removing this line causes everything to break
    8000440c:	00000513          	li	a0,0
    80004410:	ffffd097          	auipc	ra,0xffffd
    80004414:	6bc080e7          	jalr	1724(ra) # 80001acc <_Z4putcc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    80004418:	00100713          	li	a4,1
    8000441c:	000b0693          	mv	a3,s6
    80004420:	000a8613          	mv	a2,s5
    80004424:	000a0593          	mv	a1,s4
    80004428:	00098513          	mv	a0,s3
    8000442c:	fffff097          	auipc	ra,0xfffff
    80004430:	ed0080e7          	jalr	-304(ra) # 800032fc <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
    80004434:	00050993          	mv	s3,a0
                break;
    80004438:	f55ff06f          	j	8000438c <exceptionHandler+0x108>
                returnVal = _thread::currentThread->exit();
    8000443c:	fffff097          	auipc	ra,0xfffff
    80004440:	244080e7          	jalr	580(ra) # 80003680 <_ZN7_thread4exitEv>
    80004444:	00050993          	mv	s3,a0
                break;
    80004448:	f45ff06f          	j	8000438c <exceptionHandler+0x108>
                _thread::dispatch();
    8000444c:	fffff097          	auipc	ra,0xfffff
    80004450:	42c080e7          	jalr	1068(ra) # 80003878 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80004454:	00000993          	li	s3,0
                break;
    80004458:	f35ff06f          	j	8000438c <exceptionHandler+0x108>
                _thread::currentThread->join((thread_t)a1);
    8000445c:	00098593          	mv	a1,s3
    80004460:	0000a797          	auipc	a5,0xa
    80004464:	b607b783          	ld	a5,-1184(a5) # 8000dfc0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004468:	0007b503          	ld	a0,0(a5)
    8000446c:	fffff097          	auipc	ra,0xfffff
    80004470:	060080e7          	jalr	96(ra) # 800034cc <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80004474:	00000993          	li	s3,0
                break;
    80004478:	f15ff06f          	j	8000438c <exceptionHandler+0x108>
                _sem::open((sem_t*)a1, unsigned(a2));
    8000447c:	000a059b          	sext.w	a1,s4
    80004480:	00098513          	mv	a0,s3
    80004484:	ffffd097          	auipc	ra,0xffffd
    80004488:	66c080e7          	jalr	1644(ra) # 80001af0 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    8000448c:	00000993          	li	s3,0
                break;
    80004490:	efdff06f          	j	8000438c <exceptionHandler+0x108>
                _sem::close((sem_t)a1);
    80004494:	00098513          	mv	a0,s3
    80004498:	ffffd097          	auipc	ra,0xffffd
    8000449c:	6b4080e7          	jalr	1716(ra) # 80001b4c <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    800044a0:	00000993          	li	s3,0
                break;
    800044a4:	ee9ff06f          	j	8000438c <exceptionHandler+0x108>
                _sem::wait((sem_t)a1);
    800044a8:	00098513          	mv	a0,s3
    800044ac:	ffffd097          	auipc	ra,0xffffd
    800044b0:	700080e7          	jalr	1792(ra) # 80001bac <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    800044b4:	00000993          	li	s3,0
                break;
    800044b8:	ed5ff06f          	j	8000438c <exceptionHandler+0x108>
                _sem::signal((sem_t)a1);
    800044bc:	00098513          	mv	a0,s3
    800044c0:	ffffd097          	auipc	ra,0xffffd
    800044c4:	790080e7          	jalr	1936(ra) # 80001c50 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    800044c8:	00000993          	li	s3,0
                break;
    800044cc:	ec1ff06f          	j	8000438c <exceptionHandler+0x108>
                returnVal = Timer::getInstance().sleep(a1);
    800044d0:	ffffd097          	auipc	ra,0xffffd
    800044d4:	1bc080e7          	jalr	444(ra) # 8000168c <_ZN5Timer11getInstanceEv>
    800044d8:	00098593          	mv	a1,s3
    800044dc:	ffffd097          	auipc	ra,0xffffd
    800044e0:	2b4080e7          	jalr	692(ra) # 80001790 <_ZN5Timer5sleepEm>
    800044e4:	00050993          	mv	s3,a0
                break;
    800044e8:	ea5ff06f          	j	8000438c <exceptionHandler+0x108>
                returnVal = ConsoleManager::getc();
    800044ec:	ffffe097          	auipc	ra,0xffffe
    800044f0:	108080e7          	jalr	264(ra) # 800025f4 <_ZN14ConsoleManager4getcEv>
    800044f4:	00050993          	mv	s3,a0
                ConsoleManager::putc(returnVal);
    800044f8:	ffffe097          	auipc	ra,0xffffe
    800044fc:	0c4080e7          	jalr	196(ra) # 800025bc <_ZN14ConsoleManager4putcEc>
                break;
    80004500:	e8dff06f          	j	8000438c <exceptionHandler+0x108>
                ConsoleManager::putc(a1);
    80004504:	0ff9f513          	andi	a0,s3,255
    80004508:	ffffe097          	auipc	ra,0xffffe
    8000450c:	0b4080e7          	jalr	180(ra) # 800025bc <_ZN14ConsoleManager4putcEc>
    uint64 returnVal = 0;
    80004510:	00000993          	li	s3,0
                break;
    80004514:	e79ff06f          	j	8000438c <exceptionHandler+0x108>
        switch(a0){
    80004518:	00000993          	li	s3,0
    8000451c:	e71ff06f          	j	8000438c <exceptionHandler+0x108>
    80004520:	00000993          	li	s3,0
    80004524:	e69ff06f          	j	8000438c <exceptionHandler+0x108>
        putc('\n');
    80004528:	00a00513          	li	a0,10
    8000452c:	ffffd097          	auipc	ra,0xffffd
    80004530:	5a0080e7          	jalr	1440(ra) # 80001acc <_Z4putcc>
        putc('E');
    80004534:	04500513          	li	a0,69
    80004538:	ffffd097          	auipc	ra,0xffffd
    8000453c:	594080e7          	jalr	1428(ra) # 80001acc <_Z4putcc>
        putc('r');
    80004540:	07200513          	li	a0,114
    80004544:	ffffd097          	auipc	ra,0xffffd
    80004548:	588080e7          	jalr	1416(ra) # 80001acc <_Z4putcc>
        putc('r');
    8000454c:	07200513          	li	a0,114
    80004550:	ffffd097          	auipc	ra,0xffffd
    80004554:	57c080e7          	jalr	1404(ra) # 80001acc <_Z4putcc>
        putc('o');
    80004558:	06f00513          	li	a0,111
    8000455c:	ffffd097          	auipc	ra,0xffffd
    80004560:	570080e7          	jalr	1392(ra) # 80001acc <_Z4putcc>
        putc('r');
    80004564:	07200513          	li	a0,114
    80004568:	ffffd097          	auipc	ra,0xffffd
    8000456c:	564080e7          	jalr	1380(ra) # 80001acc <_Z4putcc>
        putc(':');
    80004570:	03a00513          	li	a0,58
    80004574:	ffffd097          	auipc	ra,0xffffd
    80004578:	558080e7          	jalr	1368(ra) # 80001acc <_Z4putcc>
        putc(' ');
    8000457c:	02000513          	li	a0,32
    80004580:	ffffd097          	auipc	ra,0xffffd
    80004584:	54c080e7          	jalr	1356(ra) # 80001acc <_Z4putcc>
        putc('i');
    80004588:	06900513          	li	a0,105
    8000458c:	ffffd097          	auipc	ra,0xffffd
    80004590:	540080e7          	jalr	1344(ra) # 80001acc <_Z4putcc>
        putc('l');
    80004594:	06c00513          	li	a0,108
    80004598:	ffffd097          	auipc	ra,0xffffd
    8000459c:	534080e7          	jalr	1332(ra) # 80001acc <_Z4putcc>
        putc('l');
    800045a0:	06c00513          	li	a0,108
    800045a4:	ffffd097          	auipc	ra,0xffffd
    800045a8:	528080e7          	jalr	1320(ra) # 80001acc <_Z4putcc>
        putc('e');
    800045ac:	06500513          	li	a0,101
    800045b0:	ffffd097          	auipc	ra,0xffffd
    800045b4:	51c080e7          	jalr	1308(ra) # 80001acc <_Z4putcc>
        putc('g');
    800045b8:	06700513          	li	a0,103
    800045bc:	ffffd097          	auipc	ra,0xffffd
    800045c0:	510080e7          	jalr	1296(ra) # 80001acc <_Z4putcc>
        putc('a');
    800045c4:	06100513          	li	a0,97
    800045c8:	ffffd097          	auipc	ra,0xffffd
    800045cc:	504080e7          	jalr	1284(ra) # 80001acc <_Z4putcc>
        putc('l');
    800045d0:	06c00513          	li	a0,108
    800045d4:	ffffd097          	auipc	ra,0xffffd
    800045d8:	4f8080e7          	jalr	1272(ra) # 80001acc <_Z4putcc>
        putc(' ');
    800045dc:	02000513          	li	a0,32
    800045e0:	ffffd097          	auipc	ra,0xffffd
    800045e4:	4ec080e7          	jalr	1260(ra) # 80001acc <_Z4putcc>
        putc('r');
    800045e8:	07200513          	li	a0,114
    800045ec:	ffffd097          	auipc	ra,0xffffd
    800045f0:	4e0080e7          	jalr	1248(ra) # 80001acc <_Z4putcc>
        putc('e');
    800045f4:	06500513          	li	a0,101
    800045f8:	ffffd097          	auipc	ra,0xffffd
    800045fc:	4d4080e7          	jalr	1236(ra) # 80001acc <_Z4putcc>
        putc('a');
    80004600:	06100513          	li	a0,97
    80004604:	ffffd097          	auipc	ra,0xffffd
    80004608:	4c8080e7          	jalr	1224(ra) # 80001acc <_Z4putcc>
        putc('d');
    8000460c:	06400513          	li	a0,100
    80004610:	ffffd097          	auipc	ra,0xffffd
    80004614:	4bc080e7          	jalr	1212(ra) # 80001acc <_Z4putcc>
        putc('!');
    80004618:	02100513          	li	a0,33
    8000461c:	ffffd097          	auipc	ra,0xffffd
    80004620:	4b0080e7          	jalr	1200(ra) # 80001acc <_Z4putcc>
        putc('\n');
    80004624:	00a00513          	li	a0,10
    80004628:	ffffd097          	auipc	ra,0xffffd
    8000462c:	4a4080e7          	jalr	1188(ra) # 80001acc <_Z4putcc>
        putc('P');
    80004630:	05000513          	li	a0,80
    80004634:	ffffd097          	auipc	ra,0xffffd
    80004638:	498080e7          	jalr	1176(ra) # 80001acc <_Z4putcc>
        putc('C');
    8000463c:	04300513          	li	a0,67
    80004640:	ffffd097          	auipc	ra,0xffffd
    80004644:	48c080e7          	jalr	1164(ra) # 80001acc <_Z4putcc>
        putc(':');
    80004648:	03a00513          	li	a0,58
    8000464c:	ffffd097          	auipc	ra,0xffffd
    80004650:	480080e7          	jalr	1152(ra) # 80001acc <_Z4putcc>
        putc(' ');
    80004654:	02000513          	li	a0,32
    80004658:	ffffd097          	auipc	ra,0xffffd
    8000465c:	474080e7          	jalr	1140(ra) # 80001acc <_Z4putcc>
        putc('0');
    80004660:	03000513          	li	a0,48
    80004664:	ffffd097          	auipc	ra,0xffffd
    80004668:	468080e7          	jalr	1128(ra) # 80001acc <_Z4putcc>
        putc('x');
    8000466c:	07800513          	li	a0,120
    80004670:	ffffd097          	auipc	ra,0xffffd
    80004674:	45c080e7          	jalr	1116(ra) # 80001acc <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004678:	00f00913          	li	s2,15
    8000467c:	0140006f          	j	80004690 <exceptionHandler+0x40c>
                putc('A' + tmp - 10);
    80004680:	03750513          	addi	a0,a0,55
    80004684:	ffffd097          	auipc	ra,0xffffd
    80004688:	448080e7          	jalr	1096(ra) # 80001acc <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    8000468c:	fff9091b          	addiw	s2,s2,-1
    80004690:	02094463          	bltz	s2,800046b8 <exceptionHandler+0x434>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80004694:	0029151b          	slliw	a0,s2,0x2
    80004698:	00a4d533          	srl	a0,s1,a0
    8000469c:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    800046a0:	00900793          	li	a5,9
    800046a4:	fca7eee3          	bltu	a5,a0,80004680 <exceptionHandler+0x3fc>
                putc('0' + tmp);
    800046a8:	03050513          	addi	a0,a0,48
    800046ac:	ffffd097          	auipc	ra,0xffffd
    800046b0:	420080e7          	jalr	1056(ra) # 80001acc <_Z4putcc>
    800046b4:	fd9ff06f          	j	8000468c <exceptionHandler+0x408>
        assert(false);
    800046b8:	00007697          	auipc	a3,0x7
    800046bc:	bc868693          	addi	a3,a3,-1080 # 8000b280 <CONSOLE_STATUS+0x270>
    800046c0:	08400613          	li	a2,132
    800046c4:	00007597          	auipc	a1,0x7
    800046c8:	bd458593          	addi	a1,a1,-1068 # 8000b298 <CONSOLE_STATUS+0x288>
    800046cc:	00007517          	auipc	a0,0x7
    800046d0:	bec50513          	addi	a0,a0,-1044 # 8000b2b8 <CONSOLE_STATUS+0x2a8>
    800046d4:	ffffe097          	auipc	ra,0xffffe
    800046d8:	9a0080e7          	jalr	-1632(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
    800046dc:	cc9ff06f          	j	800043a4 <exceptionHandler+0x120>
        putc('\n');
    800046e0:	00a00513          	li	a0,10
    800046e4:	ffffd097          	auipc	ra,0xffffd
    800046e8:	3e8080e7          	jalr	1000(ra) # 80001acc <_Z4putcc>
        putc('E');
    800046ec:	04500513          	li	a0,69
    800046f0:	ffffd097          	auipc	ra,0xffffd
    800046f4:	3dc080e7          	jalr	988(ra) # 80001acc <_Z4putcc>
        putc('r');
    800046f8:	07200513          	li	a0,114
    800046fc:	ffffd097          	auipc	ra,0xffffd
    80004700:	3d0080e7          	jalr	976(ra) # 80001acc <_Z4putcc>
        putc('r');
    80004704:	07200513          	li	a0,114
    80004708:	ffffd097          	auipc	ra,0xffffd
    8000470c:	3c4080e7          	jalr	964(ra) # 80001acc <_Z4putcc>
        putc('o');
    80004710:	06f00513          	li	a0,111
    80004714:	ffffd097          	auipc	ra,0xffffd
    80004718:	3b8080e7          	jalr	952(ra) # 80001acc <_Z4putcc>
        putc('r');
    8000471c:	07200513          	li	a0,114
    80004720:	ffffd097          	auipc	ra,0xffffd
    80004724:	3ac080e7          	jalr	940(ra) # 80001acc <_Z4putcc>
        putc(':');
    80004728:	03a00513          	li	a0,58
    8000472c:	ffffd097          	auipc	ra,0xffffd
    80004730:	3a0080e7          	jalr	928(ra) # 80001acc <_Z4putcc>
        putc(' ');
    80004734:	02000513          	li	a0,32
    80004738:	ffffd097          	auipc	ra,0xffffd
    8000473c:	394080e7          	jalr	916(ra) # 80001acc <_Z4putcc>
        putc('i');
    80004740:	06900513          	li	a0,105
    80004744:	ffffd097          	auipc	ra,0xffffd
    80004748:	388080e7          	jalr	904(ra) # 80001acc <_Z4putcc>
        putc('l');
    8000474c:	06c00513          	li	a0,108
    80004750:	ffffd097          	auipc	ra,0xffffd
    80004754:	37c080e7          	jalr	892(ra) # 80001acc <_Z4putcc>
        putc('l');
    80004758:	06c00513          	li	a0,108
    8000475c:	ffffd097          	auipc	ra,0xffffd
    80004760:	370080e7          	jalr	880(ra) # 80001acc <_Z4putcc>
        putc('e');
    80004764:	06500513          	li	a0,101
    80004768:	ffffd097          	auipc	ra,0xffffd
    8000476c:	364080e7          	jalr	868(ra) # 80001acc <_Z4putcc>
        putc('g');
    80004770:	06700513          	li	a0,103
    80004774:	ffffd097          	auipc	ra,0xffffd
    80004778:	358080e7          	jalr	856(ra) # 80001acc <_Z4putcc>
        putc('a');
    8000477c:	06100513          	li	a0,97
    80004780:	ffffd097          	auipc	ra,0xffffd
    80004784:	34c080e7          	jalr	844(ra) # 80001acc <_Z4putcc>
        putc('l');
    80004788:	06c00513          	li	a0,108
    8000478c:	ffffd097          	auipc	ra,0xffffd
    80004790:	340080e7          	jalr	832(ra) # 80001acc <_Z4putcc>
        putc(' ');
    80004794:	02000513          	li	a0,32
    80004798:	ffffd097          	auipc	ra,0xffffd
    8000479c:	334080e7          	jalr	820(ra) # 80001acc <_Z4putcc>
        putc('w');
    800047a0:	07700513          	li	a0,119
    800047a4:	ffffd097          	auipc	ra,0xffffd
    800047a8:	328080e7          	jalr	808(ra) # 80001acc <_Z4putcc>
        putc('r');
    800047ac:	07200513          	li	a0,114
    800047b0:	ffffd097          	auipc	ra,0xffffd
    800047b4:	31c080e7          	jalr	796(ra) # 80001acc <_Z4putcc>
        putc('i');
    800047b8:	06900513          	li	a0,105
    800047bc:	ffffd097          	auipc	ra,0xffffd
    800047c0:	310080e7          	jalr	784(ra) # 80001acc <_Z4putcc>
        putc('t');
    800047c4:	07400513          	li	a0,116
    800047c8:	ffffd097          	auipc	ra,0xffffd
    800047cc:	304080e7          	jalr	772(ra) # 80001acc <_Z4putcc>
        putc('e');
    800047d0:	06500513          	li	a0,101
    800047d4:	ffffd097          	auipc	ra,0xffffd
    800047d8:	2f8080e7          	jalr	760(ra) # 80001acc <_Z4putcc>
        putc('!');
    800047dc:	02100513          	li	a0,33
    800047e0:	ffffd097          	auipc	ra,0xffffd
    800047e4:	2ec080e7          	jalr	748(ra) # 80001acc <_Z4putcc>
        putc('\n');
    800047e8:	00a00513          	li	a0,10
    800047ec:	ffffd097          	auipc	ra,0xffffd
    800047f0:	2e0080e7          	jalr	736(ra) # 80001acc <_Z4putcc>
        putc('P');
    800047f4:	05000513          	li	a0,80
    800047f8:	ffffd097          	auipc	ra,0xffffd
    800047fc:	2d4080e7          	jalr	724(ra) # 80001acc <_Z4putcc>
        putc('C');
    80004800:	04300513          	li	a0,67
    80004804:	ffffd097          	auipc	ra,0xffffd
    80004808:	2c8080e7          	jalr	712(ra) # 80001acc <_Z4putcc>
        putc(':');
    8000480c:	03a00513          	li	a0,58
    80004810:	ffffd097          	auipc	ra,0xffffd
    80004814:	2bc080e7          	jalr	700(ra) # 80001acc <_Z4putcc>
        putc(' ');
    80004818:	02000513          	li	a0,32
    8000481c:	ffffd097          	auipc	ra,0xffffd
    80004820:	2b0080e7          	jalr	688(ra) # 80001acc <_Z4putcc>
        putc('0');
    80004824:	03000513          	li	a0,48
    80004828:	ffffd097          	auipc	ra,0xffffd
    8000482c:	2a4080e7          	jalr	676(ra) # 80001acc <_Z4putcc>
        putc('x');
    80004830:	07800513          	li	a0,120
    80004834:	ffffd097          	auipc	ra,0xffffd
    80004838:	298080e7          	jalr	664(ra) # 80001acc <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    8000483c:	00f00913          	li	s2,15
    80004840:	0140006f          	j	80004854 <exceptionHandler+0x5d0>
                putc('A' + tmp - 10);
    80004844:	03750513          	addi	a0,a0,55
    80004848:	ffffd097          	auipc	ra,0xffffd
    8000484c:	284080e7          	jalr	644(ra) # 80001acc <_Z4putcc>
        for(int i = 15; i >= 0; i--){
    80004850:	fff9091b          	addiw	s2,s2,-1
    80004854:	02094463          	bltz	s2,8000487c <exceptionHandler+0x5f8>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80004858:	0029151b          	slliw	a0,s2,0x2
    8000485c:	00a4d533          	srl	a0,s1,a0
    80004860:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004864:	00900793          	li	a5,9
    80004868:	fca7eee3          	bltu	a5,a0,80004844 <exceptionHandler+0x5c0>
                putc('0' + tmp);
    8000486c:	03050513          	addi	a0,a0,48
    80004870:	ffffd097          	auipc	ra,0xffffd
    80004874:	25c080e7          	jalr	604(ra) # 80001acc <_Z4putcc>
    80004878:	fd9ff06f          	j	80004850 <exceptionHandler+0x5cc>
        assert(false);
    8000487c:	00007697          	auipc	a3,0x7
    80004880:	a0468693          	addi	a3,a3,-1532 # 8000b280 <CONSOLE_STATUS+0x270>
    80004884:	0ac00613          	li	a2,172
    80004888:	00007597          	auipc	a1,0x7
    8000488c:	a1058593          	addi	a1,a1,-1520 # 8000b298 <CONSOLE_STATUS+0x288>
    80004890:	00007517          	auipc	a0,0x7
    80004894:	a2850513          	addi	a0,a0,-1496 # 8000b2b8 <CONSOLE_STATUS+0x2a8>
    80004898:	ffffd097          	auipc	ra,0xffffd
    8000489c:	7dc080e7          	jalr	2012(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
    800048a0:	b05ff06f          	j	800043a4 <exceptionHandler+0x120>
        Timer::getInstance().tick();
    800048a4:	ffffd097          	auipc	ra,0xffffd
    800048a8:	de8080e7          	jalr	-536(ra) # 8000168c <_ZN5Timer11getInstanceEv>
    800048ac:	ffffd097          	auipc	ra,0xffffd
    800048b0:	e44080e7          	jalr	-444(ra) # 800016f0 <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    800048b4:	00009797          	auipc	a5,0x9
    800048b8:	70c7b783          	ld	a5,1804(a5) # 8000dfc0 <_GLOBAL_OFFSET_TABLE_+0x48>
    800048bc:	0007b503          	ld	a0,0(a5)
    800048c0:	fffff097          	auipc	ra,0xfffff
    800048c4:	d30080e7          	jalr	-720(ra) # 800035f0 <_ZN7_thread4tickEv>
    800048c8:	00051c63          	bnez	a0,800048e0 <exceptionHandler+0x65c>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    800048cc:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800048d0:	10091073          	csrw	sstatus,s2
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800048d4:	00200793          	li	a5,2
    800048d8:	1447b073          	csrc	sip,a5
    800048dc:	ac9ff06f          	j	800043a4 <exceptionHandler+0x120>
        assert(_thread::currentThread->tick() == 0);
    800048e0:	00007697          	auipc	a3,0x7
    800048e4:	9a068693          	addi	a3,a3,-1632 # 8000b280 <CONSOLE_STATUS+0x270>
    800048e8:	0b000613          	li	a2,176
    800048ec:	00007597          	auipc	a1,0x7
    800048f0:	9ac58593          	addi	a1,a1,-1620 # 8000b298 <CONSOLE_STATUS+0x288>
    800048f4:	00007517          	auipc	a0,0x7
    800048f8:	9cc50513          	addi	a0,a0,-1588 # 8000b2c0 <CONSOLE_STATUS+0x2b0>
    800048fc:	ffffd097          	auipc	ra,0xffffd
    80004900:	778080e7          	jalr	1912(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
    80004904:	fc9ff06f          	j	800048cc <exceptionHandler+0x648>
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    80004908:	ffffe097          	auipc	ra,0xffffe
    8000490c:	e60080e7          	jalr	-416(ra) # 80002768 <_ZN14ConsoleManager12inputHandlerEv>
    80004910:	a0dff06f          	j	8000431c <exceptionHandler+0x98>

0000000080004914 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80004914:	fe010113          	addi	sp,sp,-32
    80004918:	00113c23          	sd	ra,24(sp)
    8000491c:	00813823          	sd	s0,16(sp)
    80004920:	00913423          	sd	s1,8(sp)
    80004924:	02010413          	addi	s0,sp,32
    80004928:	00050493          	mv	s1,a0
    assert(singleton == 0);
    8000492c:	00009797          	auipc	a5,0x9
    80004930:	7247b783          	ld	a5,1828(a5) # 8000e050 <_ZN9Scheduler9singletonE>
    80004934:	02079463          	bnez	a5,8000495c <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80004938:	00009797          	auipc	a5,0x9
    8000493c:	7097bc23          	sd	s1,1816(a5) # 8000e050 <_ZN9Scheduler9singletonE>
    head = 0;
    80004940:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80004944:	0004b423          	sd	zero,8(s1)
}
    80004948:	01813083          	ld	ra,24(sp)
    8000494c:	01013403          	ld	s0,16(sp)
    80004950:	00813483          	ld	s1,8(sp)
    80004954:	02010113          	addi	sp,sp,32
    80004958:	00008067          	ret
    assert(singleton == 0);
    8000495c:	00007697          	auipc	a3,0x7
    80004960:	a9468693          	addi	a3,a3,-1388 # 8000b3f0 <CONSOLE_STATUS+0x3e0>
    80004964:	01700613          	li	a2,23
    80004968:	00007597          	auipc	a1,0x7
    8000496c:	aa058593          	addi	a1,a1,-1376 # 8000b408 <CONSOLE_STATUS+0x3f8>
    80004970:	00007517          	auipc	a0,0x7
    80004974:	aa850513          	addi	a0,a0,-1368 # 8000b418 <CONSOLE_STATUS+0x408>
    80004978:	ffffd097          	auipc	ra,0xffffd
    8000497c:	6fc080e7          	jalr	1788(ra) # 80002074 <_Z13assert_failedPKcS0_jS0_>
    80004980:	fb9ff06f          	j	80004938 <_ZN9SchedulerC1Ev+0x24>

0000000080004984 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80004984:	ff010113          	addi	sp,sp,-16
    80004988:	00813423          	sd	s0,8(sp)
    8000498c:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80004990:	00009797          	auipc	a5,0x9
    80004994:	6c07b783          	ld	a5,1728(a5) # 8000e050 <_ZN9Scheduler9singletonE>
    80004998:	0007b503          	ld	a0,0(a5)
}
    8000499c:	00153513          	seqz	a0,a0
    800049a0:	00813403          	ld	s0,8(sp)
    800049a4:	01010113          	addi	sp,sp,16
    800049a8:	00008067          	ret

00000000800049ac <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    800049ac:	fe010113          	addi	sp,sp,-32
    800049b0:	00113c23          	sd	ra,24(sp)
    800049b4:	00813823          	sd	s0,16(sp)
    800049b8:	00913423          	sd	s1,8(sp)
    800049bc:	01213023          	sd	s2,0(sp)
    800049c0:	02010413          	addi	s0,sp,32
    800049c4:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    800049c8:	00009917          	auipc	s2,0x9
    800049cc:	68893903          	ld	s2,1672(s2) # 8000e050 <_ZN9Scheduler9singletonE>
    800049d0:	00093783          	ld	a5,0(s2)
    800049d4:	12078c63          	beqz	a5,80004b0c <_ZN9Scheduler3putEP7_thread+0x160>
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)mem_alloc(sizeof(ThreadList));
    800049d8:	00893903          	ld	s2,8(s2)
    800049dc:	01000513          	li	a0,16
    800049e0:	ffffd097          	auipc	ra,0xffffd
    800049e4:	ea0080e7          	jalr	-352(ra) # 80001880 <_Z9mem_allocm>
    800049e8:	00a90423          	sb	a0,8(s2)
    800049ec:	00855793          	srli	a5,a0,0x8
    800049f0:	00f904a3          	sb	a5,9(s2)
    800049f4:	01055793          	srli	a5,a0,0x10
    800049f8:	00f90523          	sb	a5,10(s2)
    800049fc:	0185579b          	srliw	a5,a0,0x18
    80004a00:	00f905a3          	sb	a5,11(s2)
    80004a04:	02055793          	srli	a5,a0,0x20
    80004a08:	00f90623          	sb	a5,12(s2)
    80004a0c:	02855793          	srli	a5,a0,0x28
    80004a10:	00f906a3          	sb	a5,13(s2)
    80004a14:	03055793          	srli	a5,a0,0x30
    80004a18:	00f90723          	sb	a5,14(s2)
    80004a1c:	03855513          	srli	a0,a0,0x38
    80004a20:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80004a24:	00009617          	auipc	a2,0x9
    80004a28:	62c60613          	addi	a2,a2,1580 # 8000e050 <_ZN9Scheduler9singletonE>
    80004a2c:	00063583          	ld	a1,0(a2)
    80004a30:	0085b703          	ld	a4,8(a1)
    80004a34:	00874783          	lbu	a5,8(a4)
    80004a38:	00974683          	lbu	a3,9(a4)
    80004a3c:	00869693          	slli	a3,a3,0x8
    80004a40:	00f6e6b3          	or	a3,a3,a5
    80004a44:	00a74783          	lbu	a5,10(a4)
    80004a48:	01079793          	slli	a5,a5,0x10
    80004a4c:	00d7e6b3          	or	a3,a5,a3
    80004a50:	00b74783          	lbu	a5,11(a4)
    80004a54:	01879793          	slli	a5,a5,0x18
    80004a58:	00d7e7b3          	or	a5,a5,a3
    80004a5c:	00c74683          	lbu	a3,12(a4)
    80004a60:	02069693          	slli	a3,a3,0x20
    80004a64:	00f6e7b3          	or	a5,a3,a5
    80004a68:	00d74683          	lbu	a3,13(a4)
    80004a6c:	02869693          	slli	a3,a3,0x28
    80004a70:	00f6e6b3          	or	a3,a3,a5
    80004a74:	00e74783          	lbu	a5,14(a4)
    80004a78:	03079793          	slli	a5,a5,0x30
    80004a7c:	00d7e6b3          	or	a3,a5,a3
    80004a80:	00f74783          	lbu	a5,15(a4)
    80004a84:	03879793          	slli	a5,a5,0x38
    80004a88:	00d7e7b3          	or	a5,a5,a3
    80004a8c:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80004a90:	00978023          	sb	s1,0(a5)
    80004a94:	0084d713          	srli	a4,s1,0x8
    80004a98:	00e780a3          	sb	a4,1(a5)
    80004a9c:	0104d713          	srli	a4,s1,0x10
    80004aa0:	00e78123          	sb	a4,2(a5)
    80004aa4:	0184d71b          	srliw	a4,s1,0x18
    80004aa8:	00e781a3          	sb	a4,3(a5)
    80004aac:	0204d713          	srli	a4,s1,0x20
    80004ab0:	00e78223          	sb	a4,4(a5)
    80004ab4:	0284d713          	srli	a4,s1,0x28
    80004ab8:	00e782a3          	sb	a4,5(a5)
    80004abc:	0304d713          	srli	a4,s1,0x30
    80004ac0:	00e78323          	sb	a4,6(a5)
    80004ac4:	0384d493          	srli	s1,s1,0x38
    80004ac8:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80004acc:	00063783          	ld	a5,0(a2)
    80004ad0:	0087b783          	ld	a5,8(a5)
    80004ad4:	00078423          	sb	zero,8(a5)
    80004ad8:	000784a3          	sb	zero,9(a5)
    80004adc:	00078523          	sb	zero,10(a5)
    80004ae0:	000785a3          	sb	zero,11(a5)
    80004ae4:	00078623          	sb	zero,12(a5)
    80004ae8:	000786a3          	sb	zero,13(a5)
    80004aec:	00078723          	sb	zero,14(a5)
    80004af0:	000787a3          	sb	zero,15(a5)
    }
}
    80004af4:	01813083          	ld	ra,24(sp)
    80004af8:	01013403          	ld	s0,16(sp)
    80004afc:	00813483          	ld	s1,8(sp)
    80004b00:	00013903          	ld	s2,0(sp)
    80004b04:	02010113          	addi	sp,sp,32
    80004b08:	00008067          	ret
        singleton->head = singleton->tail = (ThreadList*)mem_alloc(sizeof(ThreadList));
    80004b0c:	01000513          	li	a0,16
    80004b10:	ffffd097          	auipc	ra,0xffffd
    80004b14:	d70080e7          	jalr	-656(ra) # 80001880 <_Z9mem_allocm>
    80004b18:	00a93423          	sd	a0,8(s2)
    80004b1c:	00009717          	auipc	a4,0x9
    80004b20:	53470713          	addi	a4,a4,1332 # 8000e050 <_ZN9Scheduler9singletonE>
    80004b24:	00073783          	ld	a5,0(a4)
    80004b28:	00a7b023          	sd	a0,0(a5)
        singleton->head->thread = thread;
    80004b2c:	00073783          	ld	a5,0(a4)
    80004b30:	0007b783          	ld	a5,0(a5)
    80004b34:	00978023          	sb	s1,0(a5)
    80004b38:	0084d693          	srli	a3,s1,0x8
    80004b3c:	00d780a3          	sb	a3,1(a5)
    80004b40:	0104d693          	srli	a3,s1,0x10
    80004b44:	00d78123          	sb	a3,2(a5)
    80004b48:	0184d69b          	srliw	a3,s1,0x18
    80004b4c:	00d781a3          	sb	a3,3(a5)
    80004b50:	0204d693          	srli	a3,s1,0x20
    80004b54:	00d78223          	sb	a3,4(a5)
    80004b58:	0284d693          	srli	a3,s1,0x28
    80004b5c:	00d782a3          	sb	a3,5(a5)
    80004b60:	0304d693          	srli	a3,s1,0x30
    80004b64:	00d78323          	sb	a3,6(a5)
    80004b68:	0384d493          	srli	s1,s1,0x38
    80004b6c:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80004b70:	00073783          	ld	a5,0(a4)
    80004b74:	0007b783          	ld	a5,0(a5)
    80004b78:	00078423          	sb	zero,8(a5)
    80004b7c:	000784a3          	sb	zero,9(a5)
    80004b80:	00078523          	sb	zero,10(a5)
    80004b84:	000785a3          	sb	zero,11(a5)
    80004b88:	00078623          	sb	zero,12(a5)
    80004b8c:	000786a3          	sb	zero,13(a5)
    80004b90:	00078723          	sb	zero,14(a5)
    80004b94:	000787a3          	sb	zero,15(a5)
    80004b98:	f5dff06f          	j	80004af4 <_ZN9Scheduler3putEP7_thread+0x148>

0000000080004b9c <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80004b9c:	fe010113          	addi	sp,sp,-32
    80004ba0:	00113c23          	sd	ra,24(sp)
    80004ba4:	00813823          	sd	s0,16(sp)
    80004ba8:	00913423          	sd	s1,8(sp)
    80004bac:	02010413          	addi	s0,sp,32
    ThreadList* tmp = singleton->head;
    80004bb0:	00009697          	auipc	a3,0x9
    80004bb4:	4a06b683          	ld	a3,1184(a3) # 8000e050 <_ZN9Scheduler9singletonE>
    80004bb8:	0006b503          	ld	a0,0(a3)
    if(tmp == 0){
    80004bbc:	0e050863          	beqz	a0,80004cac <_ZN9Scheduler3getEv+0x110>
        return 0;
    }
    thread_t thread = tmp->thread;
    80004bc0:	00054483          	lbu	s1,0(a0)
    80004bc4:	00154783          	lbu	a5,1(a0)
    80004bc8:	00879793          	slli	a5,a5,0x8
    80004bcc:	0097e7b3          	or	a5,a5,s1
    80004bd0:	00254483          	lbu	s1,2(a0)
    80004bd4:	01049493          	slli	s1,s1,0x10
    80004bd8:	00f4e7b3          	or	a5,s1,a5
    80004bdc:	00354483          	lbu	s1,3(a0)
    80004be0:	01849493          	slli	s1,s1,0x18
    80004be4:	00f4e4b3          	or	s1,s1,a5
    80004be8:	00454783          	lbu	a5,4(a0)
    80004bec:	02079793          	slli	a5,a5,0x20
    80004bf0:	0097e4b3          	or	s1,a5,s1
    80004bf4:	00554783          	lbu	a5,5(a0)
    80004bf8:	02879793          	slli	a5,a5,0x28
    80004bfc:	0097e7b3          	or	a5,a5,s1
    80004c00:	00654483          	lbu	s1,6(a0)
    80004c04:	03049493          	slli	s1,s1,0x30
    80004c08:	00f4e7b3          	or	a5,s1,a5
    80004c0c:	00754483          	lbu	s1,7(a0)
    80004c10:	03849493          	slli	s1,s1,0x38
    80004c14:	00f4e4b3          	or	s1,s1,a5
    singleton->head = tmp->next;
    80004c18:	00854783          	lbu	a5,8(a0)
    80004c1c:	00954703          	lbu	a4,9(a0)
    80004c20:	00871713          	slli	a4,a4,0x8
    80004c24:	00f76733          	or	a4,a4,a5
    80004c28:	00a54783          	lbu	a5,10(a0)
    80004c2c:	01079793          	slli	a5,a5,0x10
    80004c30:	00e7e733          	or	a4,a5,a4
    80004c34:	00b54783          	lbu	a5,11(a0)
    80004c38:	01879793          	slli	a5,a5,0x18
    80004c3c:	00e7e7b3          	or	a5,a5,a4
    80004c40:	00c54703          	lbu	a4,12(a0)
    80004c44:	02071713          	slli	a4,a4,0x20
    80004c48:	00f767b3          	or	a5,a4,a5
    80004c4c:	00d54703          	lbu	a4,13(a0)
    80004c50:	02871713          	slli	a4,a4,0x28
    80004c54:	00f76733          	or	a4,a4,a5
    80004c58:	00e54783          	lbu	a5,14(a0)
    80004c5c:	03079793          	slli	a5,a5,0x30
    80004c60:	00e7e733          	or	a4,a5,a4
    80004c64:	00f54783          	lbu	a5,15(a0)
    80004c68:	03879793          	slli	a5,a5,0x38
    80004c6c:	00e7e7b3          	or	a5,a5,a4
    80004c70:	00f6b023          	sd	a5,0(a3)
    if(singleton->head == 0){
    80004c74:	00009797          	auipc	a5,0x9
    80004c78:	3dc7b783          	ld	a5,988(a5) # 8000e050 <_ZN9Scheduler9singletonE>
    80004c7c:	0007b703          	ld	a4,0(a5)
    80004c80:	02070263          	beqz	a4,80004ca4 <_ZN9Scheduler3getEv+0x108>
        singleton->tail = 0;
    }
    mem_free(tmp);
    80004c84:	ffffd097          	auipc	ra,0xffffd
    80004c88:	c2c080e7          	jalr	-980(ra) # 800018b0 <_Z8mem_freePv>
    return thread;
}
    80004c8c:	00048513          	mv	a0,s1
    80004c90:	01813083          	ld	ra,24(sp)
    80004c94:	01013403          	ld	s0,16(sp)
    80004c98:	00813483          	ld	s1,8(sp)
    80004c9c:	02010113          	addi	sp,sp,32
    80004ca0:	00008067          	ret
        singleton->tail = 0;
    80004ca4:	0007b423          	sd	zero,8(a5)
    80004ca8:	fddff06f          	j	80004c84 <_ZN9Scheduler3getEv+0xe8>
        return 0;
    80004cac:	00050493          	mv	s1,a0
    80004cb0:	fddff06f          	j	80004c8c <_ZN9Scheduler3getEv+0xf0>

0000000080004cb4 <_ZN9Scheduler8getCountEv>:


int Scheduler::getCount(){
    80004cb4:	ff010113          	addi	sp,sp,-16
    80004cb8:	00813423          	sd	s0,8(sp)
    80004cbc:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    80004cc0:	00009797          	auipc	a5,0x9
    80004cc4:	3907b783          	ld	a5,912(a5) # 8000e050 <_ZN9Scheduler9singletonE>
    80004cc8:	0007b783          	ld	a5,0(a5)
    int count = 0;
    80004ccc:	00000513          	li	a0,0
    while(tmp != 0){
    80004cd0:	06078263          	beqz	a5,80004d34 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    80004cd4:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    80004cd8:	0087c683          	lbu	a3,8(a5)
    80004cdc:	0097c703          	lbu	a4,9(a5)
    80004ce0:	00871713          	slli	a4,a4,0x8
    80004ce4:	00d766b3          	or	a3,a4,a3
    80004ce8:	00a7c703          	lbu	a4,10(a5)
    80004cec:	01071713          	slli	a4,a4,0x10
    80004cf0:	00d76733          	or	a4,a4,a3
    80004cf4:	00b7c683          	lbu	a3,11(a5)
    80004cf8:	01869693          	slli	a3,a3,0x18
    80004cfc:	00e6e733          	or	a4,a3,a4
    80004d00:	00c7c683          	lbu	a3,12(a5)
    80004d04:	02069693          	slli	a3,a3,0x20
    80004d08:	00e6e6b3          	or	a3,a3,a4
    80004d0c:	00d7c703          	lbu	a4,13(a5)
    80004d10:	02871713          	slli	a4,a4,0x28
    80004d14:	00d766b3          	or	a3,a4,a3
    80004d18:	00e7c703          	lbu	a4,14(a5)
    80004d1c:	03071713          	slli	a4,a4,0x30
    80004d20:	00d76733          	or	a4,a4,a3
    80004d24:	00f7c783          	lbu	a5,15(a5)
    80004d28:	03879793          	slli	a5,a5,0x38
    80004d2c:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80004d30:	fa1ff06f          	j	80004cd0 <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80004d34:	00813403          	ld	s0,8(sp)
    80004d38:	01010113          	addi	sp,sp,16
    80004d3c:	00008067          	ret

0000000080004d40 <_ZN6BufferC1Ei>:
#include "../test_h/buffer.h"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004d40:	fe010113          	addi	sp,sp,-32
    80004d44:	00113c23          	sd	ra,24(sp)
    80004d48:	00813823          	sd	s0,16(sp)
    80004d4c:	00913423          	sd	s1,8(sp)
    80004d50:	01213023          	sd	s2,0(sp)
    80004d54:	02010413          	addi	s0,sp,32
    80004d58:	00050493          	mv	s1,a0
    80004d5c:	00058913          	mv	s2,a1
    80004d60:	0015879b          	addiw	a5,a1,1
    80004d64:	0007851b          	sext.w	a0,a5
    80004d68:	00f4a023          	sw	a5,0(s1)
    80004d6c:	0004a823          	sw	zero,16(s1)
    80004d70:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004d74:	00251513          	slli	a0,a0,0x2
    80004d78:	ffffd097          	auipc	ra,0xffffd
    80004d7c:	b08080e7          	jalr	-1272(ra) # 80001880 <_Z9mem_allocm>
    80004d80:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80004d84:	00000593          	li	a1,0
    80004d88:	02048513          	addi	a0,s1,32
    80004d8c:	ffffd097          	auipc	ra,0xffffd
    80004d90:	c5c080e7          	jalr	-932(ra) # 800019e8 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80004d94:	00090593          	mv	a1,s2
    80004d98:	01848513          	addi	a0,s1,24
    80004d9c:	ffffd097          	auipc	ra,0xffffd
    80004da0:	c4c080e7          	jalr	-948(ra) # 800019e8 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80004da4:	00100593          	li	a1,1
    80004da8:	02848513          	addi	a0,s1,40
    80004dac:	ffffd097          	auipc	ra,0xffffd
    80004db0:	c3c080e7          	jalr	-964(ra) # 800019e8 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80004db4:	00100593          	li	a1,1
    80004db8:	03048513          	addi	a0,s1,48
    80004dbc:	ffffd097          	auipc	ra,0xffffd
    80004dc0:	c2c080e7          	jalr	-980(ra) # 800019e8 <_Z8sem_openPP4_semj>
}
    80004dc4:	01813083          	ld	ra,24(sp)
    80004dc8:	01013403          	ld	s0,16(sp)
    80004dcc:	00813483          	ld	s1,8(sp)
    80004dd0:	00013903          	ld	s2,0(sp)
    80004dd4:	02010113          	addi	sp,sp,32
    80004dd8:	00008067          	ret

0000000080004ddc <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80004ddc:	fe010113          	addi	sp,sp,-32
    80004de0:	00113c23          	sd	ra,24(sp)
    80004de4:	00813823          	sd	s0,16(sp)
    80004de8:	00913423          	sd	s1,8(sp)
    80004dec:	01213023          	sd	s2,0(sp)
    80004df0:	02010413          	addi	s0,sp,32
    80004df4:	00050493          	mv	s1,a0
    80004df8:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80004dfc:	01853503          	ld	a0,24(a0)
    80004e00:	ffffd097          	auipc	ra,0xffffd
    80004e04:	c4c080e7          	jalr	-948(ra) # 80001a4c <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80004e08:	0304b503          	ld	a0,48(s1)
    80004e0c:	ffffd097          	auipc	ra,0xffffd
    80004e10:	c40080e7          	jalr	-960(ra) # 80001a4c <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80004e14:	0084b783          	ld	a5,8(s1)
    80004e18:	0144a703          	lw	a4,20(s1)
    80004e1c:	00271713          	slli	a4,a4,0x2
    80004e20:	00e787b3          	add	a5,a5,a4
    80004e24:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004e28:	0144a783          	lw	a5,20(s1)
    80004e2c:	0017879b          	addiw	a5,a5,1
    80004e30:	0004a703          	lw	a4,0(s1)
    80004e34:	02e7e7bb          	remw	a5,a5,a4
    80004e38:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80004e3c:	0304b503          	ld	a0,48(s1)
    80004e40:	ffffd097          	auipc	ra,0xffffd
    80004e44:	c38080e7          	jalr	-968(ra) # 80001a78 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80004e48:	0204b503          	ld	a0,32(s1)
    80004e4c:	ffffd097          	auipc	ra,0xffffd
    80004e50:	c2c080e7          	jalr	-980(ra) # 80001a78 <_Z10sem_signalP4_sem>

}
    80004e54:	01813083          	ld	ra,24(sp)
    80004e58:	01013403          	ld	s0,16(sp)
    80004e5c:	00813483          	ld	s1,8(sp)
    80004e60:	00013903          	ld	s2,0(sp)
    80004e64:	02010113          	addi	sp,sp,32
    80004e68:	00008067          	ret

0000000080004e6c <_ZN6Buffer3getEv>:

int Buffer::get() {
    80004e6c:	fe010113          	addi	sp,sp,-32
    80004e70:	00113c23          	sd	ra,24(sp)
    80004e74:	00813823          	sd	s0,16(sp)
    80004e78:	00913423          	sd	s1,8(sp)
    80004e7c:	01213023          	sd	s2,0(sp)
    80004e80:	02010413          	addi	s0,sp,32
    80004e84:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80004e88:	02053503          	ld	a0,32(a0)
    80004e8c:	ffffd097          	auipc	ra,0xffffd
    80004e90:	bc0080e7          	jalr	-1088(ra) # 80001a4c <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80004e94:	0284b503          	ld	a0,40(s1)
    80004e98:	ffffd097          	auipc	ra,0xffffd
    80004e9c:	bb4080e7          	jalr	-1100(ra) # 80001a4c <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80004ea0:	0084b703          	ld	a4,8(s1)
    80004ea4:	0104a783          	lw	a5,16(s1)
    80004ea8:	00279693          	slli	a3,a5,0x2
    80004eac:	00d70733          	add	a4,a4,a3
    80004eb0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004eb4:	0017879b          	addiw	a5,a5,1
    80004eb8:	0004a703          	lw	a4,0(s1)
    80004ebc:	02e7e7bb          	remw	a5,a5,a4
    80004ec0:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80004ec4:	0284b503          	ld	a0,40(s1)
    80004ec8:	ffffd097          	auipc	ra,0xffffd
    80004ecc:	bb0080e7          	jalr	-1104(ra) # 80001a78 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80004ed0:	0184b503          	ld	a0,24(s1)
    80004ed4:	ffffd097          	auipc	ra,0xffffd
    80004ed8:	ba4080e7          	jalr	-1116(ra) # 80001a78 <_Z10sem_signalP4_sem>

    return ret;
}
    80004edc:	00090513          	mv	a0,s2
    80004ee0:	01813083          	ld	ra,24(sp)
    80004ee4:	01013403          	ld	s0,16(sp)
    80004ee8:	00813483          	ld	s1,8(sp)
    80004eec:	00013903          	ld	s2,0(sp)
    80004ef0:	02010113          	addi	sp,sp,32
    80004ef4:	00008067          	ret

0000000080004ef8 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80004ef8:	fe010113          	addi	sp,sp,-32
    80004efc:	00113c23          	sd	ra,24(sp)
    80004f00:	00813823          	sd	s0,16(sp)
    80004f04:	00913423          	sd	s1,8(sp)
    80004f08:	01213023          	sd	s2,0(sp)
    80004f0c:	02010413          	addi	s0,sp,32
    80004f10:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80004f14:	02853503          	ld	a0,40(a0)
    80004f18:	ffffd097          	auipc	ra,0xffffd
    80004f1c:	b34080e7          	jalr	-1228(ra) # 80001a4c <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80004f20:	0304b503          	ld	a0,48(s1)
    80004f24:	ffffd097          	auipc	ra,0xffffd
    80004f28:	b28080e7          	jalr	-1240(ra) # 80001a4c <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80004f2c:	0144a783          	lw	a5,20(s1)
    80004f30:	0104a903          	lw	s2,16(s1)
    80004f34:	0327ce63          	blt	a5,s2,80004f70 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80004f38:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80004f3c:	0304b503          	ld	a0,48(s1)
    80004f40:	ffffd097          	auipc	ra,0xffffd
    80004f44:	b38080e7          	jalr	-1224(ra) # 80001a78 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80004f48:	0284b503          	ld	a0,40(s1)
    80004f4c:	ffffd097          	auipc	ra,0xffffd
    80004f50:	b2c080e7          	jalr	-1236(ra) # 80001a78 <_Z10sem_signalP4_sem>

    return ret;
}
    80004f54:	00090513          	mv	a0,s2
    80004f58:	01813083          	ld	ra,24(sp)
    80004f5c:	01013403          	ld	s0,16(sp)
    80004f60:	00813483          	ld	s1,8(sp)
    80004f64:	00013903          	ld	s2,0(sp)
    80004f68:	02010113          	addi	sp,sp,32
    80004f6c:	00008067          	ret
        ret = cap - head + tail;
    80004f70:	0004a703          	lw	a4,0(s1)
    80004f74:	4127093b          	subw	s2,a4,s2
    80004f78:	00f9093b          	addw	s2,s2,a5
    80004f7c:	fc1ff06f          	j	80004f3c <_ZN6Buffer6getCntEv+0x44>

0000000080004f80 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80004f80:	fe010113          	addi	sp,sp,-32
    80004f84:	00113c23          	sd	ra,24(sp)
    80004f88:	00813823          	sd	s0,16(sp)
    80004f8c:	00913423          	sd	s1,8(sp)
    80004f90:	02010413          	addi	s0,sp,32
    80004f94:	00050493          	mv	s1,a0
    putc('\n');
    80004f98:	00a00513          	li	a0,10
    80004f9c:	ffffd097          	auipc	ra,0xffffd
    80004fa0:	b30080e7          	jalr	-1232(ra) # 80001acc <_Z4putcc>
    printString("Buffer deleted!\n");
    80004fa4:	00006517          	auipc	a0,0x6
    80004fa8:	48450513          	addi	a0,a0,1156 # 8000b428 <CONSOLE_STATUS+0x418>
    80004fac:	00003097          	auipc	ra,0x3
    80004fb0:	994080e7          	jalr	-1644(ra) # 80007940 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80004fb4:	00048513          	mv	a0,s1
    80004fb8:	00000097          	auipc	ra,0x0
    80004fbc:	f40080e7          	jalr	-192(ra) # 80004ef8 <_ZN6Buffer6getCntEv>
    80004fc0:	02a05c63          	blez	a0,80004ff8 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80004fc4:	0084b783          	ld	a5,8(s1)
    80004fc8:	0104a703          	lw	a4,16(s1)
    80004fcc:	00271713          	slli	a4,a4,0x2
    80004fd0:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80004fd4:	0007c503          	lbu	a0,0(a5)
    80004fd8:	ffffd097          	auipc	ra,0xffffd
    80004fdc:	af4080e7          	jalr	-1292(ra) # 80001acc <_Z4putcc>
        head = (head + 1) % cap;
    80004fe0:	0104a783          	lw	a5,16(s1)
    80004fe4:	0017879b          	addiw	a5,a5,1
    80004fe8:	0004a703          	lw	a4,0(s1)
    80004fec:	02e7e7bb          	remw	a5,a5,a4
    80004ff0:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80004ff4:	fc1ff06f          	j	80004fb4 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80004ff8:	02100513          	li	a0,33
    80004ffc:	ffffd097          	auipc	ra,0xffffd
    80005000:	ad0080e7          	jalr	-1328(ra) # 80001acc <_Z4putcc>
    putc('\n');
    80005004:	00a00513          	li	a0,10
    80005008:	ffffd097          	auipc	ra,0xffffd
    8000500c:	ac4080e7          	jalr	-1340(ra) # 80001acc <_Z4putcc>
    mem_free(buffer);
    80005010:	0084b503          	ld	a0,8(s1)
    80005014:	ffffd097          	auipc	ra,0xffffd
    80005018:	89c080e7          	jalr	-1892(ra) # 800018b0 <_Z8mem_freePv>
    sem_close(itemAvailable);
    8000501c:	0204b503          	ld	a0,32(s1)
    80005020:	ffffd097          	auipc	ra,0xffffd
    80005024:	a00080e7          	jalr	-1536(ra) # 80001a20 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80005028:	0184b503          	ld	a0,24(s1)
    8000502c:	ffffd097          	auipc	ra,0xffffd
    80005030:	9f4080e7          	jalr	-1548(ra) # 80001a20 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80005034:	0304b503          	ld	a0,48(s1)
    80005038:	ffffd097          	auipc	ra,0xffffd
    8000503c:	9e8080e7          	jalr	-1560(ra) # 80001a20 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80005040:	0284b503          	ld	a0,40(s1)
    80005044:	ffffd097          	auipc	ra,0xffffd
    80005048:	9dc080e7          	jalr	-1572(ra) # 80001a20 <_Z9sem_closeP4_sem>
}
    8000504c:	01813083          	ld	ra,24(sp)
    80005050:	01013403          	ld	s0,16(sp)
    80005054:	00813483          	ld	s1,8(sp)
    80005058:	02010113          	addi	sp,sp,32
    8000505c:	00008067          	ret

0000000080005060 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80005060:	fe010113          	addi	sp,sp,-32
    80005064:	00113c23          	sd	ra,24(sp)
    80005068:	00813823          	sd	s0,16(sp)
    8000506c:	00913423          	sd	s1,8(sp)
    80005070:	01213023          	sd	s2,0(sp)
    80005074:	02010413          	addi	s0,sp,32
    80005078:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000507c:	00000913          	li	s2,0
    80005080:	00c0006f          	j	8000508c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80005084:	ffffd097          	auipc	ra,0xffffd
    80005088:	8f4080e7          	jalr	-1804(ra) # 80001978 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    8000508c:	ffffd097          	auipc	ra,0xffffd
    80005090:	a18080e7          	jalr	-1512(ra) # 80001aa4 <_Z4getcv>
    80005094:	0005059b          	sext.w	a1,a0
    80005098:	01b00793          	li	a5,27
    8000509c:	02f58a63          	beq	a1,a5,800050d0 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800050a0:	0084b503          	ld	a0,8(s1)
    800050a4:	00000097          	auipc	ra,0x0
    800050a8:	d38080e7          	jalr	-712(ra) # 80004ddc <_ZN6Buffer3putEi>
        i++;
    800050ac:	0019071b          	addiw	a4,s2,1
    800050b0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800050b4:	0004a683          	lw	a3,0(s1)
    800050b8:	0026979b          	slliw	a5,a3,0x2
    800050bc:	00d787bb          	addw	a5,a5,a3
    800050c0:	0017979b          	slliw	a5,a5,0x1
    800050c4:	02f767bb          	remw	a5,a4,a5
    800050c8:	fc0792e3          	bnez	a5,8000508c <_ZL16producerKeyboardPv+0x2c>
    800050cc:	fb9ff06f          	j	80005084 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800050d0:	00100793          	li	a5,1
    800050d4:	00009717          	auipc	a4,0x9
    800050d8:	f8f72223          	sw	a5,-124(a4) # 8000e058 <_ZL9threadEnd>
    data->buffer->put('!');
    800050dc:	02100593          	li	a1,33
    800050e0:	0084b503          	ld	a0,8(s1)
    800050e4:	00000097          	auipc	ra,0x0
    800050e8:	cf8080e7          	jalr	-776(ra) # 80004ddc <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800050ec:	0104b503          	ld	a0,16(s1)
    800050f0:	ffffd097          	auipc	ra,0xffffd
    800050f4:	988080e7          	jalr	-1656(ra) # 80001a78 <_Z10sem_signalP4_sem>
}
    800050f8:	01813083          	ld	ra,24(sp)
    800050fc:	01013403          	ld	s0,16(sp)
    80005100:	00813483          	ld	s1,8(sp)
    80005104:	00013903          	ld	s2,0(sp)
    80005108:	02010113          	addi	sp,sp,32
    8000510c:	00008067          	ret

0000000080005110 <_ZL8producerPv>:

static void producer(void *arg) {
    80005110:	fe010113          	addi	sp,sp,-32
    80005114:	00113c23          	sd	ra,24(sp)
    80005118:	00813823          	sd	s0,16(sp)
    8000511c:	00913423          	sd	s1,8(sp)
    80005120:	01213023          	sd	s2,0(sp)
    80005124:	02010413          	addi	s0,sp,32
    80005128:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000512c:	00000913          	li	s2,0
    80005130:	00c0006f          	j	8000513c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80005134:	ffffd097          	auipc	ra,0xffffd
    80005138:	844080e7          	jalr	-1980(ra) # 80001978 <_Z15thread_dispatchv>
    while (!threadEnd) {
    8000513c:	00009797          	auipc	a5,0x9
    80005140:	f1c7a783          	lw	a5,-228(a5) # 8000e058 <_ZL9threadEnd>
    80005144:	02079e63          	bnez	a5,80005180 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80005148:	0004a583          	lw	a1,0(s1)
    8000514c:	0305859b          	addiw	a1,a1,48
    80005150:	0084b503          	ld	a0,8(s1)
    80005154:	00000097          	auipc	ra,0x0
    80005158:	c88080e7          	jalr	-888(ra) # 80004ddc <_ZN6Buffer3putEi>
        i++;
    8000515c:	0019071b          	addiw	a4,s2,1
    80005160:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005164:	0004a683          	lw	a3,0(s1)
    80005168:	0026979b          	slliw	a5,a3,0x2
    8000516c:	00d787bb          	addw	a5,a5,a3
    80005170:	0017979b          	slliw	a5,a5,0x1
    80005174:	02f767bb          	remw	a5,a4,a5
    80005178:	fc0792e3          	bnez	a5,8000513c <_ZL8producerPv+0x2c>
    8000517c:	fb9ff06f          	j	80005134 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80005180:	0104b503          	ld	a0,16(s1)
    80005184:	ffffd097          	auipc	ra,0xffffd
    80005188:	8f4080e7          	jalr	-1804(ra) # 80001a78 <_Z10sem_signalP4_sem>
}
    8000518c:	01813083          	ld	ra,24(sp)
    80005190:	01013403          	ld	s0,16(sp)
    80005194:	00813483          	ld	s1,8(sp)
    80005198:	00013903          	ld	s2,0(sp)
    8000519c:	02010113          	addi	sp,sp,32
    800051a0:	00008067          	ret

00000000800051a4 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800051a4:	fd010113          	addi	sp,sp,-48
    800051a8:	02113423          	sd	ra,40(sp)
    800051ac:	02813023          	sd	s0,32(sp)
    800051b0:	00913c23          	sd	s1,24(sp)
    800051b4:	01213823          	sd	s2,16(sp)
    800051b8:	01313423          	sd	s3,8(sp)
    800051bc:	03010413          	addi	s0,sp,48
    800051c0:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800051c4:	00000993          	li	s3,0
    800051c8:	01c0006f          	j	800051e4 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800051cc:	ffffc097          	auipc	ra,0xffffc
    800051d0:	7ac080e7          	jalr	1964(ra) # 80001978 <_Z15thread_dispatchv>
    800051d4:	0500006f          	j	80005224 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800051d8:	00a00513          	li	a0,10
    800051dc:	ffffd097          	auipc	ra,0xffffd
    800051e0:	8f0080e7          	jalr	-1808(ra) # 80001acc <_Z4putcc>
    while (!threadEnd) {
    800051e4:	00009797          	auipc	a5,0x9
    800051e8:	e747a783          	lw	a5,-396(a5) # 8000e058 <_ZL9threadEnd>
    800051ec:	06079063          	bnez	a5,8000524c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800051f0:	00893503          	ld	a0,8(s2)
    800051f4:	00000097          	auipc	ra,0x0
    800051f8:	c78080e7          	jalr	-904(ra) # 80004e6c <_ZN6Buffer3getEv>
        i++;
    800051fc:	0019849b          	addiw	s1,s3,1
    80005200:	0004899b          	sext.w	s3,s1
        putc(key);
    80005204:	0ff57513          	andi	a0,a0,255
    80005208:	ffffd097          	auipc	ra,0xffffd
    8000520c:	8c4080e7          	jalr	-1852(ra) # 80001acc <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005210:	00092703          	lw	a4,0(s2)
    80005214:	0027179b          	slliw	a5,a4,0x2
    80005218:	00e787bb          	addw	a5,a5,a4
    8000521c:	02f4e7bb          	remw	a5,s1,a5
    80005220:	fa0786e3          	beqz	a5,800051cc <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80005224:	05000793          	li	a5,80
    80005228:	02f4e4bb          	remw	s1,s1,a5
    8000522c:	fa049ce3          	bnez	s1,800051e4 <_ZL8consumerPv+0x40>
    80005230:	fa9ff06f          	j	800051d8 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80005234:	00893503          	ld	a0,8(s2)
    80005238:	00000097          	auipc	ra,0x0
    8000523c:	c34080e7          	jalr	-972(ra) # 80004e6c <_ZN6Buffer3getEv>
        putc(key);
    80005240:	0ff57513          	andi	a0,a0,255
    80005244:	ffffd097          	auipc	ra,0xffffd
    80005248:	888080e7          	jalr	-1912(ra) # 80001acc <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    8000524c:	00893503          	ld	a0,8(s2)
    80005250:	00000097          	auipc	ra,0x0
    80005254:	ca8080e7          	jalr	-856(ra) # 80004ef8 <_ZN6Buffer6getCntEv>
    80005258:	fca04ee3          	bgtz	a0,80005234 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    8000525c:	01093503          	ld	a0,16(s2)
    80005260:	ffffd097          	auipc	ra,0xffffd
    80005264:	818080e7          	jalr	-2024(ra) # 80001a78 <_Z10sem_signalP4_sem>
}
    80005268:	02813083          	ld	ra,40(sp)
    8000526c:	02013403          	ld	s0,32(sp)
    80005270:	01813483          	ld	s1,24(sp)
    80005274:	01013903          	ld	s2,16(sp)
    80005278:	00813983          	ld	s3,8(sp)
    8000527c:	03010113          	addi	sp,sp,48
    80005280:	00008067          	ret

0000000080005284 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80005284:	f9010113          	addi	sp,sp,-112
    80005288:	06113423          	sd	ra,104(sp)
    8000528c:	06813023          	sd	s0,96(sp)
    80005290:	04913c23          	sd	s1,88(sp)
    80005294:	05213823          	sd	s2,80(sp)
    80005298:	05313423          	sd	s3,72(sp)
    8000529c:	05413023          	sd	s4,64(sp)
    800052a0:	03513c23          	sd	s5,56(sp)
    800052a4:	03613823          	sd	s6,48(sp)
    800052a8:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800052ac:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800052b0:	00006517          	auipc	a0,0x6
    800052b4:	19050513          	addi	a0,a0,400 # 8000b440 <CONSOLE_STATUS+0x430>
    800052b8:	00002097          	auipc	ra,0x2
    800052bc:	688080e7          	jalr	1672(ra) # 80007940 <_Z11printStringPKc>
    getString(input, 30);
    800052c0:	01e00593          	li	a1,30
    800052c4:	fa040493          	addi	s1,s0,-96
    800052c8:	00048513          	mv	a0,s1
    800052cc:	00002097          	auipc	ra,0x2
    800052d0:	6fc080e7          	jalr	1788(ra) # 800079c8 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800052d4:	00048513          	mv	a0,s1
    800052d8:	00002097          	auipc	ra,0x2
    800052dc:	7c8080e7          	jalr	1992(ra) # 80007aa0 <_Z11stringToIntPKc>
    800052e0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800052e4:	00006517          	auipc	a0,0x6
    800052e8:	17c50513          	addi	a0,a0,380 # 8000b460 <CONSOLE_STATUS+0x450>
    800052ec:	00002097          	auipc	ra,0x2
    800052f0:	654080e7          	jalr	1620(ra) # 80007940 <_Z11printStringPKc>
    getString(input, 30);
    800052f4:	01e00593          	li	a1,30
    800052f8:	00048513          	mv	a0,s1
    800052fc:	00002097          	auipc	ra,0x2
    80005300:	6cc080e7          	jalr	1740(ra) # 800079c8 <_Z9getStringPci>
    n = stringToInt(input);
    80005304:	00048513          	mv	a0,s1
    80005308:	00002097          	auipc	ra,0x2
    8000530c:	798080e7          	jalr	1944(ra) # 80007aa0 <_Z11stringToIntPKc>
    80005310:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005314:	00006517          	auipc	a0,0x6
    80005318:	16c50513          	addi	a0,a0,364 # 8000b480 <CONSOLE_STATUS+0x470>
    8000531c:	00002097          	auipc	ra,0x2
    80005320:	624080e7          	jalr	1572(ra) # 80007940 <_Z11printStringPKc>
    80005324:	00000613          	li	a2,0
    80005328:	00a00593          	li	a1,10
    8000532c:	00090513          	mv	a0,s2
    80005330:	00002097          	auipc	ra,0x2
    80005334:	7c0080e7          	jalr	1984(ra) # 80007af0 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005338:	00006517          	auipc	a0,0x6
    8000533c:	16050513          	addi	a0,a0,352 # 8000b498 <CONSOLE_STATUS+0x488>
    80005340:	00002097          	auipc	ra,0x2
    80005344:	600080e7          	jalr	1536(ra) # 80007940 <_Z11printStringPKc>
    80005348:	00000613          	li	a2,0
    8000534c:	00a00593          	li	a1,10
    80005350:	00048513          	mv	a0,s1
    80005354:	00002097          	auipc	ra,0x2
    80005358:	79c080e7          	jalr	1948(ra) # 80007af0 <_Z8printIntiii>
    printString(".\n");
    8000535c:	00006517          	auipc	a0,0x6
    80005360:	15450513          	addi	a0,a0,340 # 8000b4b0 <CONSOLE_STATUS+0x4a0>
    80005364:	00002097          	auipc	ra,0x2
    80005368:	5dc080e7          	jalr	1500(ra) # 80007940 <_Z11printStringPKc>
    if(threadNum > n) {
    8000536c:	0324c463          	blt	s1,s2,80005394 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80005370:	03205c63          	blez	s2,800053a8 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80005374:	03800513          	li	a0,56
    80005378:	ffffc097          	auipc	ra,0xffffc
    8000537c:	e44080e7          	jalr	-444(ra) # 800011bc <_Znwm>
    80005380:	00050a13          	mv	s4,a0
    80005384:	00048593          	mv	a1,s1
    80005388:	00000097          	auipc	ra,0x0
    8000538c:	9b8080e7          	jalr	-1608(ra) # 80004d40 <_ZN6BufferC1Ei>
    80005390:	0300006f          	j	800053c0 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005394:	00006517          	auipc	a0,0x6
    80005398:	12450513          	addi	a0,a0,292 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    8000539c:	00002097          	auipc	ra,0x2
    800053a0:	5a4080e7          	jalr	1444(ra) # 80007940 <_Z11printStringPKc>
        return;
    800053a4:	0140006f          	j	800053b8 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800053a8:	00006517          	auipc	a0,0x6
    800053ac:	15050513          	addi	a0,a0,336 # 8000b4f8 <CONSOLE_STATUS+0x4e8>
    800053b0:	00002097          	auipc	ra,0x2
    800053b4:	590080e7          	jalr	1424(ra) # 80007940 <_Z11printStringPKc>
        return;
    800053b8:	000b0113          	mv	sp,s6
    800053bc:	1500006f          	j	8000550c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800053c0:	00000593          	li	a1,0
    800053c4:	00009517          	auipc	a0,0x9
    800053c8:	c9c50513          	addi	a0,a0,-868 # 8000e060 <_ZL10waitForAll>
    800053cc:	ffffc097          	auipc	ra,0xffffc
    800053d0:	61c080e7          	jalr	1564(ra) # 800019e8 <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    800053d4:	00391793          	slli	a5,s2,0x3
    800053d8:	00f78793          	addi	a5,a5,15
    800053dc:	ff07f793          	andi	a5,a5,-16
    800053e0:	40f10133          	sub	sp,sp,a5
    800053e4:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800053e8:	0019071b          	addiw	a4,s2,1
    800053ec:	00171793          	slli	a5,a4,0x1
    800053f0:	00e787b3          	add	a5,a5,a4
    800053f4:	00379793          	slli	a5,a5,0x3
    800053f8:	00f78793          	addi	a5,a5,15
    800053fc:	ff07f793          	andi	a5,a5,-16
    80005400:	40f10133          	sub	sp,sp,a5
    80005404:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80005408:	00191613          	slli	a2,s2,0x1
    8000540c:	012607b3          	add	a5,a2,s2
    80005410:	00379793          	slli	a5,a5,0x3
    80005414:	00f987b3          	add	a5,s3,a5
    80005418:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    8000541c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80005420:	00009717          	auipc	a4,0x9
    80005424:	c4073703          	ld	a4,-960(a4) # 8000e060 <_ZL10waitForAll>
    80005428:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    8000542c:	00078613          	mv	a2,a5
    80005430:	00000597          	auipc	a1,0x0
    80005434:	d7458593          	addi	a1,a1,-652 # 800051a4 <_ZL8consumerPv>
    80005438:	f9840513          	addi	a0,s0,-104
    8000543c:	ffffc097          	auipc	ra,0xffffc
    80005440:	4a0080e7          	jalr	1184(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80005444:	00000493          	li	s1,0
    80005448:	0280006f          	j	80005470 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    8000544c:	00000597          	auipc	a1,0x0
    80005450:	c1458593          	addi	a1,a1,-1004 # 80005060 <_ZL16producerKeyboardPv>
                      data + i);
    80005454:	00179613          	slli	a2,a5,0x1
    80005458:	00f60633          	add	a2,a2,a5
    8000545c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80005460:	00c98633          	add	a2,s3,a2
    80005464:	ffffc097          	auipc	ra,0xffffc
    80005468:	478080e7          	jalr	1144(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000546c:	0014849b          	addiw	s1,s1,1
    80005470:	0524d263          	bge	s1,s2,800054b4 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80005474:	00149793          	slli	a5,s1,0x1
    80005478:	009787b3          	add	a5,a5,s1
    8000547c:	00379793          	slli	a5,a5,0x3
    80005480:	00f987b3          	add	a5,s3,a5
    80005484:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005488:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    8000548c:	00009717          	auipc	a4,0x9
    80005490:	bd473703          	ld	a4,-1068(a4) # 8000e060 <_ZL10waitForAll>
    80005494:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80005498:	00048793          	mv	a5,s1
    8000549c:	00349513          	slli	a0,s1,0x3
    800054a0:	00aa8533          	add	a0,s5,a0
    800054a4:	fa9054e3          	blez	s1,8000544c <_Z22producerConsumer_C_APIv+0x1c8>
    800054a8:	00000597          	auipc	a1,0x0
    800054ac:	c6858593          	addi	a1,a1,-920 # 80005110 <_ZL8producerPv>
    800054b0:	fa5ff06f          	j	80005454 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800054b4:	ffffc097          	auipc	ra,0xffffc
    800054b8:	4c4080e7          	jalr	1220(ra) # 80001978 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800054bc:	00000493          	li	s1,0
    800054c0:	00994e63          	blt	s2,s1,800054dc <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800054c4:	00009517          	auipc	a0,0x9
    800054c8:	b9c53503          	ld	a0,-1124(a0) # 8000e060 <_ZL10waitForAll>
    800054cc:	ffffc097          	auipc	ra,0xffffc
    800054d0:	580080e7          	jalr	1408(ra) # 80001a4c <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    800054d4:	0014849b          	addiw	s1,s1,1
    800054d8:	fe9ff06f          	j	800054c0 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800054dc:	00009517          	auipc	a0,0x9
    800054e0:	b8453503          	ld	a0,-1148(a0) # 8000e060 <_ZL10waitForAll>
    800054e4:	ffffc097          	auipc	ra,0xffffc
    800054e8:	53c080e7          	jalr	1340(ra) # 80001a20 <_Z9sem_closeP4_sem>
    delete buffer;
    800054ec:	000a0e63          	beqz	s4,80005508 <_Z22producerConsumer_C_APIv+0x284>
    800054f0:	000a0513          	mv	a0,s4
    800054f4:	00000097          	auipc	ra,0x0
    800054f8:	a8c080e7          	jalr	-1396(ra) # 80004f80 <_ZN6BufferD1Ev>
    800054fc:	000a0513          	mv	a0,s4
    80005500:	ffffc097          	auipc	ra,0xffffc
    80005504:	ce4080e7          	jalr	-796(ra) # 800011e4 <_ZdlPv>
    80005508:	000b0113          	mv	sp,s6
}
    8000550c:	f9040113          	addi	sp,s0,-112
    80005510:	06813083          	ld	ra,104(sp)
    80005514:	06013403          	ld	s0,96(sp)
    80005518:	05813483          	ld	s1,88(sp)
    8000551c:	05013903          	ld	s2,80(sp)
    80005520:	04813983          	ld	s3,72(sp)
    80005524:	04013a03          	ld	s4,64(sp)
    80005528:	03813a83          	ld	s5,56(sp)
    8000552c:	03013b03          	ld	s6,48(sp)
    80005530:	07010113          	addi	sp,sp,112
    80005534:	00008067          	ret
    80005538:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    8000553c:	000a0513          	mv	a0,s4
    80005540:	ffffc097          	auipc	ra,0xffffc
    80005544:	ca4080e7          	jalr	-860(ra) # 800011e4 <_ZdlPv>
    80005548:	00048513          	mv	a0,s1
    8000554c:	0000a097          	auipc	ra,0xa
    80005550:	c1c080e7          	jalr	-996(ra) # 8000f168 <_Unwind_Resume>

0000000080005554 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80005554:	f8010113          	addi	sp,sp,-128
    80005558:	06113c23          	sd	ra,120(sp)
    8000555c:	06813823          	sd	s0,112(sp)
    80005560:	06913423          	sd	s1,104(sp)
    80005564:	07213023          	sd	s2,96(sp)
    80005568:	05313c23          	sd	s3,88(sp)
    8000556c:	05413823          	sd	s4,80(sp)
    80005570:	05513423          	sd	s5,72(sp)
    80005574:	05613023          	sd	s6,64(sp)
    80005578:	03713c23          	sd	s7,56(sp)
    8000557c:	03813823          	sd	s8,48(sp)
    80005580:	03913423          	sd	s9,40(sp)
    80005584:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80005588:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    8000558c:	00006517          	auipc	a0,0x6
    80005590:	eb450513          	addi	a0,a0,-332 # 8000b440 <CONSOLE_STATUS+0x430>
    80005594:	00002097          	auipc	ra,0x2
    80005598:	3ac080e7          	jalr	940(ra) # 80007940 <_Z11printStringPKc>
    getString(input, 30);
    8000559c:	01e00593          	li	a1,30
    800055a0:	f8040493          	addi	s1,s0,-128
    800055a4:	00048513          	mv	a0,s1
    800055a8:	00002097          	auipc	ra,0x2
    800055ac:	420080e7          	jalr	1056(ra) # 800079c8 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800055b0:	00048513          	mv	a0,s1
    800055b4:	00002097          	auipc	ra,0x2
    800055b8:	4ec080e7          	jalr	1260(ra) # 80007aa0 <_Z11stringToIntPKc>
    800055bc:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    800055c0:	00006517          	auipc	a0,0x6
    800055c4:	ea050513          	addi	a0,a0,-352 # 8000b460 <CONSOLE_STATUS+0x450>
    800055c8:	00002097          	auipc	ra,0x2
    800055cc:	378080e7          	jalr	888(ra) # 80007940 <_Z11printStringPKc>
    getString(input, 30);
    800055d0:	01e00593          	li	a1,30
    800055d4:	00048513          	mv	a0,s1
    800055d8:	00002097          	auipc	ra,0x2
    800055dc:	3f0080e7          	jalr	1008(ra) # 800079c8 <_Z9getStringPci>
    n = stringToInt(input);
    800055e0:	00048513          	mv	a0,s1
    800055e4:	00002097          	auipc	ra,0x2
    800055e8:	4bc080e7          	jalr	1212(ra) # 80007aa0 <_Z11stringToIntPKc>
    800055ec:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800055f0:	00006517          	auipc	a0,0x6
    800055f4:	e9050513          	addi	a0,a0,-368 # 8000b480 <CONSOLE_STATUS+0x470>
    800055f8:	00002097          	auipc	ra,0x2
    800055fc:	348080e7          	jalr	840(ra) # 80007940 <_Z11printStringPKc>
    printInt(threadNum);
    80005600:	00000613          	li	a2,0
    80005604:	00a00593          	li	a1,10
    80005608:	00098513          	mv	a0,s3
    8000560c:	00002097          	auipc	ra,0x2
    80005610:	4e4080e7          	jalr	1252(ra) # 80007af0 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80005614:	00006517          	auipc	a0,0x6
    80005618:	e8450513          	addi	a0,a0,-380 # 8000b498 <CONSOLE_STATUS+0x488>
    8000561c:	00002097          	auipc	ra,0x2
    80005620:	324080e7          	jalr	804(ra) # 80007940 <_Z11printStringPKc>
    printInt(n);
    80005624:	00000613          	li	a2,0
    80005628:	00a00593          	li	a1,10
    8000562c:	00048513          	mv	a0,s1
    80005630:	00002097          	auipc	ra,0x2
    80005634:	4c0080e7          	jalr	1216(ra) # 80007af0 <_Z8printIntiii>
    printString(".\n");
    80005638:	00006517          	auipc	a0,0x6
    8000563c:	e7850513          	addi	a0,a0,-392 # 8000b4b0 <CONSOLE_STATUS+0x4a0>
    80005640:	00002097          	auipc	ra,0x2
    80005644:	300080e7          	jalr	768(ra) # 80007940 <_Z11printStringPKc>
    if (threadNum > n) {
    80005648:	0334c463          	blt	s1,s3,80005670 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    8000564c:	03305c63          	blez	s3,80005684 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005650:	03800513          	li	a0,56
    80005654:	ffffc097          	auipc	ra,0xffffc
    80005658:	b68080e7          	jalr	-1176(ra) # 800011bc <_Znwm>
    8000565c:	00050a93          	mv	s5,a0
    80005660:	00048593          	mv	a1,s1
    80005664:	00001097          	auipc	ra,0x1
    80005668:	3c8080e7          	jalr	968(ra) # 80006a2c <_ZN9BufferCPPC1Ei>
    8000566c:	0300006f          	j	8000569c <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005670:	00006517          	auipc	a0,0x6
    80005674:	e4850513          	addi	a0,a0,-440 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    80005678:	00002097          	auipc	ra,0x2
    8000567c:	2c8080e7          	jalr	712(ra) # 80007940 <_Z11printStringPKc>
        return;
    80005680:	0140006f          	j	80005694 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005684:	00006517          	auipc	a0,0x6
    80005688:	e7450513          	addi	a0,a0,-396 # 8000b4f8 <CONSOLE_STATUS+0x4e8>
    8000568c:	00002097          	auipc	ra,0x2
    80005690:	2b4080e7          	jalr	692(ra) # 80007940 <_Z11printStringPKc>
        return;
    80005694:	000c0113          	mv	sp,s8
    80005698:	2380006f          	j	800058d0 <_Z20testConsumerProducerv+0x37c>
    waitForAll = new Semaphore(0);
    8000569c:	01000513          	li	a0,16
    800056a0:	ffffc097          	auipc	ra,0xffffc
    800056a4:	b1c080e7          	jalr	-1252(ra) # 800011bc <_Znwm>
    800056a8:	00050913          	mv	s2,a0
    800056ac:	00000593          	li	a1,0
    800056b0:	ffffc097          	auipc	ra,0xffffc
    800056b4:	d24080e7          	jalr	-732(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    800056b8:	00009797          	auipc	a5,0x9
    800056bc:	9b27bc23          	sd	s2,-1608(a5) # 8000e070 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800056c0:	00399793          	slli	a5,s3,0x3
    800056c4:	00f78793          	addi	a5,a5,15
    800056c8:	ff07f793          	andi	a5,a5,-16
    800056cc:	40f10133          	sub	sp,sp,a5
    800056d0:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    800056d4:	0019871b          	addiw	a4,s3,1
    800056d8:	00171793          	slli	a5,a4,0x1
    800056dc:	00e787b3          	add	a5,a5,a4
    800056e0:	00379793          	slli	a5,a5,0x3
    800056e4:	00f78793          	addi	a5,a5,15
    800056e8:	ff07f793          	andi	a5,a5,-16
    800056ec:	40f10133          	sub	sp,sp,a5
    800056f0:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    800056f4:	00199493          	slli	s1,s3,0x1
    800056f8:	013484b3          	add	s1,s1,s3
    800056fc:	00349493          	slli	s1,s1,0x3
    80005700:	009b04b3          	add	s1,s6,s1
    80005704:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80005708:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    8000570c:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005710:	02800513          	li	a0,40
    80005714:	ffffc097          	auipc	ra,0xffffc
    80005718:	aa8080e7          	jalr	-1368(ra) # 800011bc <_Znwm>
    8000571c:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80005720:	ffffc097          	auipc	ra,0xffffc
    80005724:	c80080e7          	jalr	-896(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80005728:	00008797          	auipc	a5,0x8
    8000572c:	70878793          	addi	a5,a5,1800 # 8000de30 <_ZTV8Consumer+0x10>
    80005730:	00fbb023          	sd	a5,0(s7)
    80005734:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80005738:	000b8513          	mv	a0,s7
    8000573c:	ffffc097          	auipc	ra,0xffffc
    80005740:	b7c080e7          	jalr	-1156(ra) # 800012b8 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80005744:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80005748:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    8000574c:	00009797          	auipc	a5,0x9
    80005750:	9247b783          	ld	a5,-1756(a5) # 8000e070 <_ZL10waitForAll>
    80005754:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005758:	02800513          	li	a0,40
    8000575c:	ffffc097          	auipc	ra,0xffffc
    80005760:	a60080e7          	jalr	-1440(ra) # 800011bc <_Znwm>
    80005764:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80005768:	ffffc097          	auipc	ra,0xffffc
    8000576c:	c38080e7          	jalr	-968(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80005770:	00008797          	auipc	a5,0x8
    80005774:	67078793          	addi	a5,a5,1648 # 8000dde0 <_ZTV16ProducerKeyborad+0x10>
    80005778:	00f4b023          	sd	a5,0(s1)
    8000577c:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005780:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80005784:	00048513          	mv	a0,s1
    80005788:	ffffc097          	auipc	ra,0xffffc
    8000578c:	b30080e7          	jalr	-1232(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80005790:	00100913          	li	s2,1
    80005794:	0300006f          	j	800057c4 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80005798:	00008797          	auipc	a5,0x8
    8000579c:	67078793          	addi	a5,a5,1648 # 8000de08 <_ZTV8Producer+0x10>
    800057a0:	00fcb023          	sd	a5,0(s9)
    800057a4:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800057a8:	00391793          	slli	a5,s2,0x3
    800057ac:	00fa07b3          	add	a5,s4,a5
    800057b0:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    800057b4:	000c8513          	mv	a0,s9
    800057b8:	ffffc097          	auipc	ra,0xffffc
    800057bc:	b00080e7          	jalr	-1280(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800057c0:	0019091b          	addiw	s2,s2,1
    800057c4:	05395263          	bge	s2,s3,80005808 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    800057c8:	00191493          	slli	s1,s2,0x1
    800057cc:	012484b3          	add	s1,s1,s2
    800057d0:	00349493          	slli	s1,s1,0x3
    800057d4:	009b04b3          	add	s1,s6,s1
    800057d8:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    800057dc:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    800057e0:	00009797          	auipc	a5,0x9
    800057e4:	8907b783          	ld	a5,-1904(a5) # 8000e070 <_ZL10waitForAll>
    800057e8:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    800057ec:	02800513          	li	a0,40
    800057f0:	ffffc097          	auipc	ra,0xffffc
    800057f4:	9cc080e7          	jalr	-1588(ra) # 800011bc <_Znwm>
    800057f8:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800057fc:	ffffc097          	auipc	ra,0xffffc
    80005800:	ba4080e7          	jalr	-1116(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80005804:	f95ff06f          	j	80005798 <_Z20testConsumerProducerv+0x244>
    putc('.');
    80005808:	02e00513          	li	a0,46
    8000580c:	ffffc097          	auipc	ra,0xffffc
    80005810:	2c0080e7          	jalr	704(ra) # 80001acc <_Z4putcc>
    Thread::dispatch();
    80005814:	ffffc097          	auipc	ra,0xffffc
    80005818:	b04080e7          	jalr	-1276(ra) # 80001318 <_ZN6Thread8dispatchEv>
    putc('.');
    8000581c:	02e00513          	li	a0,46
    80005820:	ffffc097          	auipc	ra,0xffffc
    80005824:	2ac080e7          	jalr	684(ra) # 80001acc <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    80005828:	00000493          	li	s1,0
    8000582c:	0099ce63          	blt	s3,s1,80005848 <_Z20testConsumerProducerv+0x2f4>
        waitForAll->wait();
    80005830:	00009517          	auipc	a0,0x9
    80005834:	84053503          	ld	a0,-1984(a0) # 8000e070 <_ZL10waitForAll>
    80005838:	ffffc097          	auipc	ra,0xffffc
    8000583c:	bd4080e7          	jalr	-1068(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005840:	0014849b          	addiw	s1,s1,1
    80005844:	fe9ff06f          	j	8000582c <_Z20testConsumerProducerv+0x2d8>
    putc('.');
    80005848:	02e00513          	li	a0,46
    8000584c:	ffffc097          	auipc	ra,0xffffc
    80005850:	280080e7          	jalr	640(ra) # 80001acc <_Z4putcc>
    delete waitForAll;
    80005854:	00009517          	auipc	a0,0x9
    80005858:	81c53503          	ld	a0,-2020(a0) # 8000e070 <_ZL10waitForAll>
    8000585c:	00050863          	beqz	a0,8000586c <_Z20testConsumerProducerv+0x318>
    80005860:	00053783          	ld	a5,0(a0)
    80005864:	0087b783          	ld	a5,8(a5)
    80005868:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    8000586c:	00000493          	li	s1,0
    80005870:	0080006f          	j	80005878 <_Z20testConsumerProducerv+0x324>
    for (int i = 0; i < threadNum; i++) {
    80005874:	0014849b          	addiw	s1,s1,1
    80005878:	0334d263          	bge	s1,s3,8000589c <_Z20testConsumerProducerv+0x348>
        delete producers[i];
    8000587c:	00349793          	slli	a5,s1,0x3
    80005880:	00fa07b3          	add	a5,s4,a5
    80005884:	0007b503          	ld	a0,0(a5)
    80005888:	fe0506e3          	beqz	a0,80005874 <_Z20testConsumerProducerv+0x320>
    8000588c:	00053783          	ld	a5,0(a0)
    80005890:	0087b783          	ld	a5,8(a5)
    80005894:	000780e7          	jalr	a5
    80005898:	fddff06f          	j	80005874 <_Z20testConsumerProducerv+0x320>
    delete consumer;
    8000589c:	000b8a63          	beqz	s7,800058b0 <_Z20testConsumerProducerv+0x35c>
    800058a0:	000bb783          	ld	a5,0(s7)
    800058a4:	0087b783          	ld	a5,8(a5)
    800058a8:	000b8513          	mv	a0,s7
    800058ac:	000780e7          	jalr	a5
    delete buffer;
    800058b0:	000a8e63          	beqz	s5,800058cc <_Z20testConsumerProducerv+0x378>
    800058b4:	000a8513          	mv	a0,s5
    800058b8:	00001097          	auipc	ra,0x1
    800058bc:	46c080e7          	jalr	1132(ra) # 80006d24 <_ZN9BufferCPPD1Ev>
    800058c0:	000a8513          	mv	a0,s5
    800058c4:	ffffc097          	auipc	ra,0xffffc
    800058c8:	920080e7          	jalr	-1760(ra) # 800011e4 <_ZdlPv>
    800058cc:	000c0113          	mv	sp,s8
}
    800058d0:	f8040113          	addi	sp,s0,-128
    800058d4:	07813083          	ld	ra,120(sp)
    800058d8:	07013403          	ld	s0,112(sp)
    800058dc:	06813483          	ld	s1,104(sp)
    800058e0:	06013903          	ld	s2,96(sp)
    800058e4:	05813983          	ld	s3,88(sp)
    800058e8:	05013a03          	ld	s4,80(sp)
    800058ec:	04813a83          	ld	s5,72(sp)
    800058f0:	04013b03          	ld	s6,64(sp)
    800058f4:	03813b83          	ld	s7,56(sp)
    800058f8:	03013c03          	ld	s8,48(sp)
    800058fc:	02813c83          	ld	s9,40(sp)
    80005900:	08010113          	addi	sp,sp,128
    80005904:	00008067          	ret
    80005908:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000590c:	000a8513          	mv	a0,s5
    80005910:	ffffc097          	auipc	ra,0xffffc
    80005914:	8d4080e7          	jalr	-1836(ra) # 800011e4 <_ZdlPv>
    80005918:	00048513          	mv	a0,s1
    8000591c:	0000a097          	auipc	ra,0xa
    80005920:	84c080e7          	jalr	-1972(ra) # 8000f168 <_Unwind_Resume>
    80005924:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80005928:	00090513          	mv	a0,s2
    8000592c:	ffffc097          	auipc	ra,0xffffc
    80005930:	8b8080e7          	jalr	-1864(ra) # 800011e4 <_ZdlPv>
    80005934:	00048513          	mv	a0,s1
    80005938:	0000a097          	auipc	ra,0xa
    8000593c:	830080e7          	jalr	-2000(ra) # 8000f168 <_Unwind_Resume>
    80005940:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005944:	000b8513          	mv	a0,s7
    80005948:	ffffc097          	auipc	ra,0xffffc
    8000594c:	89c080e7          	jalr	-1892(ra) # 800011e4 <_ZdlPv>
    80005950:	00048513          	mv	a0,s1
    80005954:	0000a097          	auipc	ra,0xa
    80005958:	814080e7          	jalr	-2028(ra) # 8000f168 <_Unwind_Resume>
    8000595c:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80005960:	00048513          	mv	a0,s1
    80005964:	ffffc097          	auipc	ra,0xffffc
    80005968:	880080e7          	jalr	-1920(ra) # 800011e4 <_ZdlPv>
    8000596c:	00090513          	mv	a0,s2
    80005970:	00009097          	auipc	ra,0x9
    80005974:	7f8080e7          	jalr	2040(ra) # 8000f168 <_Unwind_Resume>
    80005978:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    8000597c:	000c8513          	mv	a0,s9
    80005980:	ffffc097          	auipc	ra,0xffffc
    80005984:	864080e7          	jalr	-1948(ra) # 800011e4 <_ZdlPv>
    80005988:	00048513          	mv	a0,s1
    8000598c:	00009097          	auipc	ra,0x9
    80005990:	7dc080e7          	jalr	2012(ra) # 8000f168 <_Unwind_Resume>

0000000080005994 <_ZN8Consumer3runEv>:
    void run() override {
    80005994:	fd010113          	addi	sp,sp,-48
    80005998:	02113423          	sd	ra,40(sp)
    8000599c:	02813023          	sd	s0,32(sp)
    800059a0:	00913c23          	sd	s1,24(sp)
    800059a4:	01213823          	sd	s2,16(sp)
    800059a8:	01313423          	sd	s3,8(sp)
    800059ac:	03010413          	addi	s0,sp,48
    800059b0:	00050913          	mv	s2,a0
        int i = 0;
    800059b4:	00000993          	li	s3,0
    800059b8:	0100006f          	j	800059c8 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800059bc:	00a00513          	li	a0,10
    800059c0:	ffffc097          	auipc	ra,0xffffc
    800059c4:	b14080e7          	jalr	-1260(ra) # 800014d4 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800059c8:	00008797          	auipc	a5,0x8
    800059cc:	6a07a783          	lw	a5,1696(a5) # 8000e068 <_ZL9threadEnd>
    800059d0:	04079a63          	bnez	a5,80005a24 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800059d4:	02093783          	ld	a5,32(s2)
    800059d8:	0087b503          	ld	a0,8(a5)
    800059dc:	00001097          	auipc	ra,0x1
    800059e0:	234080e7          	jalr	564(ra) # 80006c10 <_ZN9BufferCPP3getEv>
            i++;
    800059e4:	0019849b          	addiw	s1,s3,1
    800059e8:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    800059ec:	0ff57513          	andi	a0,a0,255
    800059f0:	ffffc097          	auipc	ra,0xffffc
    800059f4:	ae4080e7          	jalr	-1308(ra) # 800014d4 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    800059f8:	05000793          	li	a5,80
    800059fc:	02f4e4bb          	remw	s1,s1,a5
    80005a00:	fc0494e3          	bnez	s1,800059c8 <_ZN8Consumer3runEv+0x34>
    80005a04:	fb9ff06f          	j	800059bc <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80005a08:	02093783          	ld	a5,32(s2)
    80005a0c:	0087b503          	ld	a0,8(a5)
    80005a10:	00001097          	auipc	ra,0x1
    80005a14:	200080e7          	jalr	512(ra) # 80006c10 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80005a18:	0ff57513          	andi	a0,a0,255
    80005a1c:	ffffc097          	auipc	ra,0xffffc
    80005a20:	ab8080e7          	jalr	-1352(ra) # 800014d4 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005a24:	02093783          	ld	a5,32(s2)
    80005a28:	0087b503          	ld	a0,8(a5)
    80005a2c:	00001097          	auipc	ra,0x1
    80005a30:	270080e7          	jalr	624(ra) # 80006c9c <_ZN9BufferCPP6getCntEv>
    80005a34:	fca04ae3          	bgtz	a0,80005a08 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80005a38:	02093783          	ld	a5,32(s2)
    80005a3c:	0107b503          	ld	a0,16(a5)
    80005a40:	ffffc097          	auipc	ra,0xffffc
    80005a44:	9f8080e7          	jalr	-1544(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005a48:	02813083          	ld	ra,40(sp)
    80005a4c:	02013403          	ld	s0,32(sp)
    80005a50:	01813483          	ld	s1,24(sp)
    80005a54:	01013903          	ld	s2,16(sp)
    80005a58:	00813983          	ld	s3,8(sp)
    80005a5c:	03010113          	addi	sp,sp,48
    80005a60:	00008067          	ret

0000000080005a64 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80005a64:	ff010113          	addi	sp,sp,-16
    80005a68:	00113423          	sd	ra,8(sp)
    80005a6c:	00813023          	sd	s0,0(sp)
    80005a70:	01010413          	addi	s0,sp,16
    80005a74:	00008797          	auipc	a5,0x8
    80005a78:	3bc78793          	addi	a5,a5,956 # 8000de30 <_ZTV8Consumer+0x10>
    80005a7c:	00f53023          	sd	a5,0(a0)
    80005a80:	ffffb097          	auipc	ra,0xffffb
    80005a84:	6cc080e7          	jalr	1740(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005a88:	00813083          	ld	ra,8(sp)
    80005a8c:	00013403          	ld	s0,0(sp)
    80005a90:	01010113          	addi	sp,sp,16
    80005a94:	00008067          	ret

0000000080005a98 <_ZN8ConsumerD0Ev>:
    80005a98:	fe010113          	addi	sp,sp,-32
    80005a9c:	00113c23          	sd	ra,24(sp)
    80005aa0:	00813823          	sd	s0,16(sp)
    80005aa4:	00913423          	sd	s1,8(sp)
    80005aa8:	02010413          	addi	s0,sp,32
    80005aac:	00050493          	mv	s1,a0
    80005ab0:	00008797          	auipc	a5,0x8
    80005ab4:	38078793          	addi	a5,a5,896 # 8000de30 <_ZTV8Consumer+0x10>
    80005ab8:	00f53023          	sd	a5,0(a0)
    80005abc:	ffffb097          	auipc	ra,0xffffb
    80005ac0:	690080e7          	jalr	1680(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005ac4:	00048513          	mv	a0,s1
    80005ac8:	ffffb097          	auipc	ra,0xffffb
    80005acc:	71c080e7          	jalr	1820(ra) # 800011e4 <_ZdlPv>
    80005ad0:	01813083          	ld	ra,24(sp)
    80005ad4:	01013403          	ld	s0,16(sp)
    80005ad8:	00813483          	ld	s1,8(sp)
    80005adc:	02010113          	addi	sp,sp,32
    80005ae0:	00008067          	ret

0000000080005ae4 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80005ae4:	ff010113          	addi	sp,sp,-16
    80005ae8:	00113423          	sd	ra,8(sp)
    80005aec:	00813023          	sd	s0,0(sp)
    80005af0:	01010413          	addi	s0,sp,16
    80005af4:	00008797          	auipc	a5,0x8
    80005af8:	2ec78793          	addi	a5,a5,748 # 8000dde0 <_ZTV16ProducerKeyborad+0x10>
    80005afc:	00f53023          	sd	a5,0(a0)
    80005b00:	ffffb097          	auipc	ra,0xffffb
    80005b04:	64c080e7          	jalr	1612(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005b08:	00813083          	ld	ra,8(sp)
    80005b0c:	00013403          	ld	s0,0(sp)
    80005b10:	01010113          	addi	sp,sp,16
    80005b14:	00008067          	ret

0000000080005b18 <_ZN16ProducerKeyboradD0Ev>:
    80005b18:	fe010113          	addi	sp,sp,-32
    80005b1c:	00113c23          	sd	ra,24(sp)
    80005b20:	00813823          	sd	s0,16(sp)
    80005b24:	00913423          	sd	s1,8(sp)
    80005b28:	02010413          	addi	s0,sp,32
    80005b2c:	00050493          	mv	s1,a0
    80005b30:	00008797          	auipc	a5,0x8
    80005b34:	2b078793          	addi	a5,a5,688 # 8000dde0 <_ZTV16ProducerKeyborad+0x10>
    80005b38:	00f53023          	sd	a5,0(a0)
    80005b3c:	ffffb097          	auipc	ra,0xffffb
    80005b40:	610080e7          	jalr	1552(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005b44:	00048513          	mv	a0,s1
    80005b48:	ffffb097          	auipc	ra,0xffffb
    80005b4c:	69c080e7          	jalr	1692(ra) # 800011e4 <_ZdlPv>
    80005b50:	01813083          	ld	ra,24(sp)
    80005b54:	01013403          	ld	s0,16(sp)
    80005b58:	00813483          	ld	s1,8(sp)
    80005b5c:	02010113          	addi	sp,sp,32
    80005b60:	00008067          	ret

0000000080005b64 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005b64:	ff010113          	addi	sp,sp,-16
    80005b68:	00113423          	sd	ra,8(sp)
    80005b6c:	00813023          	sd	s0,0(sp)
    80005b70:	01010413          	addi	s0,sp,16
    80005b74:	00008797          	auipc	a5,0x8
    80005b78:	29478793          	addi	a5,a5,660 # 8000de08 <_ZTV8Producer+0x10>
    80005b7c:	00f53023          	sd	a5,0(a0)
    80005b80:	ffffb097          	auipc	ra,0xffffb
    80005b84:	5cc080e7          	jalr	1484(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005b88:	00813083          	ld	ra,8(sp)
    80005b8c:	00013403          	ld	s0,0(sp)
    80005b90:	01010113          	addi	sp,sp,16
    80005b94:	00008067          	ret

0000000080005b98 <_ZN8ProducerD0Ev>:
    80005b98:	fe010113          	addi	sp,sp,-32
    80005b9c:	00113c23          	sd	ra,24(sp)
    80005ba0:	00813823          	sd	s0,16(sp)
    80005ba4:	00913423          	sd	s1,8(sp)
    80005ba8:	02010413          	addi	s0,sp,32
    80005bac:	00050493          	mv	s1,a0
    80005bb0:	00008797          	auipc	a5,0x8
    80005bb4:	25878793          	addi	a5,a5,600 # 8000de08 <_ZTV8Producer+0x10>
    80005bb8:	00f53023          	sd	a5,0(a0)
    80005bbc:	ffffb097          	auipc	ra,0xffffb
    80005bc0:	590080e7          	jalr	1424(ra) # 8000114c <_ZN6ThreadD1Ev>
    80005bc4:	00048513          	mv	a0,s1
    80005bc8:	ffffb097          	auipc	ra,0xffffb
    80005bcc:	61c080e7          	jalr	1564(ra) # 800011e4 <_ZdlPv>
    80005bd0:	01813083          	ld	ra,24(sp)
    80005bd4:	01013403          	ld	s0,16(sp)
    80005bd8:	00813483          	ld	s1,8(sp)
    80005bdc:	02010113          	addi	sp,sp,32
    80005be0:	00008067          	ret

0000000080005be4 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80005be4:	fe010113          	addi	sp,sp,-32
    80005be8:	00113c23          	sd	ra,24(sp)
    80005bec:	00813823          	sd	s0,16(sp)
    80005bf0:	00913423          	sd	s1,8(sp)
    80005bf4:	02010413          	addi	s0,sp,32
    80005bf8:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80005bfc:	ffffc097          	auipc	ra,0xffffc
    80005c00:	ea8080e7          	jalr	-344(ra) # 80001aa4 <_Z4getcv>
    80005c04:	0005059b          	sext.w	a1,a0
    80005c08:	01b00793          	li	a5,27
    80005c0c:	00f58c63          	beq	a1,a5,80005c24 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80005c10:	0204b783          	ld	a5,32(s1)
    80005c14:	0087b503          	ld	a0,8(a5)
    80005c18:	00001097          	auipc	ra,0x1
    80005c1c:	f68080e7          	jalr	-152(ra) # 80006b80 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80005c20:	fddff06f          	j	80005bfc <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005c24:	00100793          	li	a5,1
    80005c28:	00008717          	auipc	a4,0x8
    80005c2c:	44f72023          	sw	a5,1088(a4) # 8000e068 <_ZL9threadEnd>
        td->buffer->put('!');
    80005c30:	0204b783          	ld	a5,32(s1)
    80005c34:	02100593          	li	a1,33
    80005c38:	0087b503          	ld	a0,8(a5)
    80005c3c:	00001097          	auipc	ra,0x1
    80005c40:	f44080e7          	jalr	-188(ra) # 80006b80 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80005c44:	0204b783          	ld	a5,32(s1)
    80005c48:	0107b503          	ld	a0,16(a5)
    80005c4c:	ffffb097          	auipc	ra,0xffffb
    80005c50:	7ec080e7          	jalr	2028(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005c54:	01813083          	ld	ra,24(sp)
    80005c58:	01013403          	ld	s0,16(sp)
    80005c5c:	00813483          	ld	s1,8(sp)
    80005c60:	02010113          	addi	sp,sp,32
    80005c64:	00008067          	ret

0000000080005c68 <_ZN8Producer3runEv>:
    void run() override {
    80005c68:	fe010113          	addi	sp,sp,-32
    80005c6c:	00113c23          	sd	ra,24(sp)
    80005c70:	00813823          	sd	s0,16(sp)
    80005c74:	00913423          	sd	s1,8(sp)
    80005c78:	01213023          	sd	s2,0(sp)
    80005c7c:	02010413          	addi	s0,sp,32
    80005c80:	00050493          	mv	s1,a0
        int i = 0;
    80005c84:	00000913          	li	s2,0
        while (!threadEnd) {
    80005c88:	00008797          	auipc	a5,0x8
    80005c8c:	3e07a783          	lw	a5,992(a5) # 8000e068 <_ZL9threadEnd>
    80005c90:	04079263          	bnez	a5,80005cd4 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80005c94:	0204b783          	ld	a5,32(s1)
    80005c98:	0007a583          	lw	a1,0(a5)
    80005c9c:	0305859b          	addiw	a1,a1,48
    80005ca0:	0087b503          	ld	a0,8(a5)
    80005ca4:	00001097          	auipc	ra,0x1
    80005ca8:	edc080e7          	jalr	-292(ra) # 80006b80 <_ZN9BufferCPP3putEi>
            i++;
    80005cac:	0019071b          	addiw	a4,s2,1
    80005cb0:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80005cb4:	0204b783          	ld	a5,32(s1)
    80005cb8:	0007a783          	lw	a5,0(a5)
    80005cbc:	00e787bb          	addw	a5,a5,a4
    80005cc0:	00500513          	li	a0,5
    80005cc4:	02a7e53b          	remw	a0,a5,a0
    80005cc8:	ffffb097          	auipc	ra,0xffffb
    80005ccc:	678080e7          	jalr	1656(ra) # 80001340 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80005cd0:	fb9ff06f          	j	80005c88 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80005cd4:	0204b783          	ld	a5,32(s1)
    80005cd8:	0107b503          	ld	a0,16(a5)
    80005cdc:	ffffb097          	auipc	ra,0xffffb
    80005ce0:	75c080e7          	jalr	1884(ra) # 80001438 <_ZN9Semaphore6signalEv>
    }
    80005ce4:	01813083          	ld	ra,24(sp)
    80005ce8:	01013403          	ld	s0,16(sp)
    80005cec:	00813483          	ld	s1,8(sp)
    80005cf0:	00013903          	ld	s2,0(sp)
    80005cf4:	02010113          	addi	sp,sp,32
    80005cf8:	00008067          	ret

0000000080005cfc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005cfc:	fe010113          	addi	sp,sp,-32
    80005d00:	00113c23          	sd	ra,24(sp)
    80005d04:	00813823          	sd	s0,16(sp)
    80005d08:	00913423          	sd	s1,8(sp)
    80005d0c:	01213023          	sd	s2,0(sp)
    80005d10:	02010413          	addi	s0,sp,32
    80005d14:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005d18:	00100793          	li	a5,1
    80005d1c:	02a7f863          	bgeu	a5,a0,80005d4c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005d20:	00a00793          	li	a5,10
    80005d24:	02f577b3          	remu	a5,a0,a5
    80005d28:	02078e63          	beqz	a5,80005d64 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005d2c:	fff48513          	addi	a0,s1,-1
    80005d30:	00000097          	auipc	ra,0x0
    80005d34:	fcc080e7          	jalr	-52(ra) # 80005cfc <_ZL9fibonaccim>
    80005d38:	00050913          	mv	s2,a0
    80005d3c:	ffe48513          	addi	a0,s1,-2
    80005d40:	00000097          	auipc	ra,0x0
    80005d44:	fbc080e7          	jalr	-68(ra) # 80005cfc <_ZL9fibonaccim>
    80005d48:	00a90533          	add	a0,s2,a0
}
    80005d4c:	01813083          	ld	ra,24(sp)
    80005d50:	01013403          	ld	s0,16(sp)
    80005d54:	00813483          	ld	s1,8(sp)
    80005d58:	00013903          	ld	s2,0(sp)
    80005d5c:	02010113          	addi	sp,sp,32
    80005d60:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005d64:	ffffc097          	auipc	ra,0xffffc
    80005d68:	c14080e7          	jalr	-1004(ra) # 80001978 <_Z15thread_dispatchv>
    80005d6c:	fc1ff06f          	j	80005d2c <_ZL9fibonaccim+0x30>

0000000080005d70 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005d70:	fe010113          	addi	sp,sp,-32
    80005d74:	00113c23          	sd	ra,24(sp)
    80005d78:	00813823          	sd	s0,16(sp)
    80005d7c:	00913423          	sd	s1,8(sp)
    80005d80:	01213023          	sd	s2,0(sp)
    80005d84:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005d88:	00a00493          	li	s1,10
    80005d8c:	0400006f          	j	80005dcc <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005d90:	00005517          	auipc	a0,0x5
    80005d94:	79850513          	addi	a0,a0,1944 # 8000b528 <CONSOLE_STATUS+0x518>
    80005d98:	00002097          	auipc	ra,0x2
    80005d9c:	ba8080e7          	jalr	-1112(ra) # 80007940 <_Z11printStringPKc>
    80005da0:	00000613          	li	a2,0
    80005da4:	00a00593          	li	a1,10
    80005da8:	00048513          	mv	a0,s1
    80005dac:	00002097          	auipc	ra,0x2
    80005db0:	d44080e7          	jalr	-700(ra) # 80007af0 <_Z8printIntiii>
    80005db4:	00006517          	auipc	a0,0x6
    80005db8:	a3c50513          	addi	a0,a0,-1476 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005dbc:	00002097          	auipc	ra,0x2
    80005dc0:	b84080e7          	jalr	-1148(ra) # 80007940 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005dc4:	0014849b          	addiw	s1,s1,1
    80005dc8:	0ff4f493          	andi	s1,s1,255
    80005dcc:	00c00793          	li	a5,12
    80005dd0:	fc97f0e3          	bgeu	a5,s1,80005d90 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005dd4:	00005517          	auipc	a0,0x5
    80005dd8:	75c50513          	addi	a0,a0,1884 # 8000b530 <CONSOLE_STATUS+0x520>
    80005ddc:	00002097          	auipc	ra,0x2
    80005de0:	b64080e7          	jalr	-1180(ra) # 80007940 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005de4:	00500313          	li	t1,5
    thread_dispatch();
    80005de8:	ffffc097          	auipc	ra,0xffffc
    80005dec:	b90080e7          	jalr	-1136(ra) # 80001978 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005df0:	01000513          	li	a0,16
    80005df4:	00000097          	auipc	ra,0x0
    80005df8:	f08080e7          	jalr	-248(ra) # 80005cfc <_ZL9fibonaccim>
    80005dfc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005e00:	00005517          	auipc	a0,0x5
    80005e04:	74050513          	addi	a0,a0,1856 # 8000b540 <CONSOLE_STATUS+0x530>
    80005e08:	00002097          	auipc	ra,0x2
    80005e0c:	b38080e7          	jalr	-1224(ra) # 80007940 <_Z11printStringPKc>
    80005e10:	00000613          	li	a2,0
    80005e14:	00a00593          	li	a1,10
    80005e18:	0009051b          	sext.w	a0,s2
    80005e1c:	00002097          	auipc	ra,0x2
    80005e20:	cd4080e7          	jalr	-812(ra) # 80007af0 <_Z8printIntiii>
    80005e24:	00006517          	auipc	a0,0x6
    80005e28:	9cc50513          	addi	a0,a0,-1588 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005e2c:	00002097          	auipc	ra,0x2
    80005e30:	b14080e7          	jalr	-1260(ra) # 80007940 <_Z11printStringPKc>
    80005e34:	0400006f          	j	80005e74 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005e38:	00005517          	auipc	a0,0x5
    80005e3c:	6f050513          	addi	a0,a0,1776 # 8000b528 <CONSOLE_STATUS+0x518>
    80005e40:	00002097          	auipc	ra,0x2
    80005e44:	b00080e7          	jalr	-1280(ra) # 80007940 <_Z11printStringPKc>
    80005e48:	00000613          	li	a2,0
    80005e4c:	00a00593          	li	a1,10
    80005e50:	00048513          	mv	a0,s1
    80005e54:	00002097          	auipc	ra,0x2
    80005e58:	c9c080e7          	jalr	-868(ra) # 80007af0 <_Z8printIntiii>
    80005e5c:	00006517          	auipc	a0,0x6
    80005e60:	99450513          	addi	a0,a0,-1644 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005e64:	00002097          	auipc	ra,0x2
    80005e68:	adc080e7          	jalr	-1316(ra) # 80007940 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005e6c:	0014849b          	addiw	s1,s1,1
    80005e70:	0ff4f493          	andi	s1,s1,255
    80005e74:	00f00793          	li	a5,15
    80005e78:	fc97f0e3          	bgeu	a5,s1,80005e38 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005e7c:	00005517          	auipc	a0,0x5
    80005e80:	6d450513          	addi	a0,a0,1748 # 8000b550 <CONSOLE_STATUS+0x540>
    80005e84:	00002097          	auipc	ra,0x2
    80005e88:	abc080e7          	jalr	-1348(ra) # 80007940 <_Z11printStringPKc>
    finishedD = true;
    80005e8c:	00100793          	li	a5,1
    80005e90:	00008717          	auipc	a4,0x8
    80005e94:	1ef70423          	sb	a5,488(a4) # 8000e078 <_ZL9finishedD>
    thread_dispatch();
    80005e98:	ffffc097          	auipc	ra,0xffffc
    80005e9c:	ae0080e7          	jalr	-1312(ra) # 80001978 <_Z15thread_dispatchv>
}
    80005ea0:	01813083          	ld	ra,24(sp)
    80005ea4:	01013403          	ld	s0,16(sp)
    80005ea8:	00813483          	ld	s1,8(sp)
    80005eac:	00013903          	ld	s2,0(sp)
    80005eb0:	02010113          	addi	sp,sp,32
    80005eb4:	00008067          	ret

0000000080005eb8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005eb8:	fe010113          	addi	sp,sp,-32
    80005ebc:	00113c23          	sd	ra,24(sp)
    80005ec0:	00813823          	sd	s0,16(sp)
    80005ec4:	00913423          	sd	s1,8(sp)
    80005ec8:	01213023          	sd	s2,0(sp)
    80005ecc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005ed0:	00000493          	li	s1,0
    80005ed4:	0400006f          	j	80005f14 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005ed8:	00005517          	auipc	a0,0x5
    80005edc:	68850513          	addi	a0,a0,1672 # 8000b560 <CONSOLE_STATUS+0x550>
    80005ee0:	00002097          	auipc	ra,0x2
    80005ee4:	a60080e7          	jalr	-1440(ra) # 80007940 <_Z11printStringPKc>
    80005ee8:	00000613          	li	a2,0
    80005eec:	00a00593          	li	a1,10
    80005ef0:	00048513          	mv	a0,s1
    80005ef4:	00002097          	auipc	ra,0x2
    80005ef8:	bfc080e7          	jalr	-1028(ra) # 80007af0 <_Z8printIntiii>
    80005efc:	00006517          	auipc	a0,0x6
    80005f00:	8f450513          	addi	a0,a0,-1804 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005f04:	00002097          	auipc	ra,0x2
    80005f08:	a3c080e7          	jalr	-1476(ra) # 80007940 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005f0c:	0014849b          	addiw	s1,s1,1
    80005f10:	0ff4f493          	andi	s1,s1,255
    80005f14:	00200793          	li	a5,2
    80005f18:	fc97f0e3          	bgeu	a5,s1,80005ed8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005f1c:	00005517          	auipc	a0,0x5
    80005f20:	64c50513          	addi	a0,a0,1612 # 8000b568 <CONSOLE_STATUS+0x558>
    80005f24:	00002097          	auipc	ra,0x2
    80005f28:	a1c080e7          	jalr	-1508(ra) # 80007940 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005f2c:	00700313          	li	t1,7
    thread_dispatch();
    80005f30:	ffffc097          	auipc	ra,0xffffc
    80005f34:	a48080e7          	jalr	-1464(ra) # 80001978 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005f38:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005f3c:	00005517          	auipc	a0,0x5
    80005f40:	63c50513          	addi	a0,a0,1596 # 8000b578 <CONSOLE_STATUS+0x568>
    80005f44:	00002097          	auipc	ra,0x2
    80005f48:	9fc080e7          	jalr	-1540(ra) # 80007940 <_Z11printStringPKc>
    80005f4c:	00000613          	li	a2,0
    80005f50:	00a00593          	li	a1,10
    80005f54:	0009051b          	sext.w	a0,s2
    80005f58:	00002097          	auipc	ra,0x2
    80005f5c:	b98080e7          	jalr	-1128(ra) # 80007af0 <_Z8printIntiii>
    80005f60:	00006517          	auipc	a0,0x6
    80005f64:	89050513          	addi	a0,a0,-1904 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005f68:	00002097          	auipc	ra,0x2
    80005f6c:	9d8080e7          	jalr	-1576(ra) # 80007940 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005f70:	00c00513          	li	a0,12
    80005f74:	00000097          	auipc	ra,0x0
    80005f78:	d88080e7          	jalr	-632(ra) # 80005cfc <_ZL9fibonaccim>
    80005f7c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005f80:	00005517          	auipc	a0,0x5
    80005f84:	60050513          	addi	a0,a0,1536 # 8000b580 <CONSOLE_STATUS+0x570>
    80005f88:	00002097          	auipc	ra,0x2
    80005f8c:	9b8080e7          	jalr	-1608(ra) # 80007940 <_Z11printStringPKc>
    80005f90:	00000613          	li	a2,0
    80005f94:	00a00593          	li	a1,10
    80005f98:	0009051b          	sext.w	a0,s2
    80005f9c:	00002097          	auipc	ra,0x2
    80005fa0:	b54080e7          	jalr	-1196(ra) # 80007af0 <_Z8printIntiii>
    80005fa4:	00006517          	auipc	a0,0x6
    80005fa8:	84c50513          	addi	a0,a0,-1972 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005fac:	00002097          	auipc	ra,0x2
    80005fb0:	994080e7          	jalr	-1644(ra) # 80007940 <_Z11printStringPKc>
    80005fb4:	0400006f          	j	80005ff4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005fb8:	00005517          	auipc	a0,0x5
    80005fbc:	5a850513          	addi	a0,a0,1448 # 8000b560 <CONSOLE_STATUS+0x550>
    80005fc0:	00002097          	auipc	ra,0x2
    80005fc4:	980080e7          	jalr	-1664(ra) # 80007940 <_Z11printStringPKc>
    80005fc8:	00000613          	li	a2,0
    80005fcc:	00a00593          	li	a1,10
    80005fd0:	00048513          	mv	a0,s1
    80005fd4:	00002097          	auipc	ra,0x2
    80005fd8:	b1c080e7          	jalr	-1252(ra) # 80007af0 <_Z8printIntiii>
    80005fdc:	00006517          	auipc	a0,0x6
    80005fe0:	81450513          	addi	a0,a0,-2028 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80005fe4:	00002097          	auipc	ra,0x2
    80005fe8:	95c080e7          	jalr	-1700(ra) # 80007940 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005fec:	0014849b          	addiw	s1,s1,1
    80005ff0:	0ff4f493          	andi	s1,s1,255
    80005ff4:	00500793          	li	a5,5
    80005ff8:	fc97f0e3          	bgeu	a5,s1,80005fb8 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005ffc:	00005517          	auipc	a0,0x5
    80006000:	59450513          	addi	a0,a0,1428 # 8000b590 <CONSOLE_STATUS+0x580>
    80006004:	00002097          	auipc	ra,0x2
    80006008:	93c080e7          	jalr	-1732(ra) # 80007940 <_Z11printStringPKc>
    finishedC = true;
    8000600c:	00100793          	li	a5,1
    80006010:	00008717          	auipc	a4,0x8
    80006014:	06f704a3          	sb	a5,105(a4) # 8000e079 <_ZL9finishedC>
    thread_dispatch();
    80006018:	ffffc097          	auipc	ra,0xffffc
    8000601c:	960080e7          	jalr	-1696(ra) # 80001978 <_Z15thread_dispatchv>
}
    80006020:	01813083          	ld	ra,24(sp)
    80006024:	01013403          	ld	s0,16(sp)
    80006028:	00813483          	ld	s1,8(sp)
    8000602c:	00013903          	ld	s2,0(sp)
    80006030:	02010113          	addi	sp,sp,32
    80006034:	00008067          	ret

0000000080006038 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006038:	fe010113          	addi	sp,sp,-32
    8000603c:	00113c23          	sd	ra,24(sp)
    80006040:	00813823          	sd	s0,16(sp)
    80006044:	00913423          	sd	s1,8(sp)
    80006048:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000604c:	00000493          	li	s1,0
    80006050:	0340006f          	j	80006084 <_ZL11workerBodyBPv+0x4c>
        for (uint64 j = 0; j < 100; j++) {
    80006054:	00168693          	addi	a3,a3,1
    80006058:	06300793          	li	a5,99
    8000605c:	00d7ee63          	bltu	a5,a3,80006078 <_ZL11workerBodyBPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006060:	00000713          	li	a4,0
    80006064:	000077b7          	lui	a5,0x7
    80006068:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000606c:	fee7e4e3          	bltu	a5,a4,80006054 <_ZL11workerBodyBPv+0x1c>
    80006070:	00170713          	addi	a4,a4,1
    80006074:	ff1ff06f          	j	80006064 <_ZL11workerBodyBPv+0x2c>
        if (i == 10) {
    80006078:	00a00793          	li	a5,10
    8000607c:	04f48663          	beq	s1,a5,800060c8 <_ZL11workerBodyBPv+0x90>
    for (uint64 i = 0; i < 16; i++) {
    80006080:	00148493          	addi	s1,s1,1
    80006084:	00f00793          	li	a5,15
    80006088:	0497e463          	bltu	a5,s1,800060d0 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    8000608c:	00005517          	auipc	a0,0x5
    80006090:	51450513          	addi	a0,a0,1300 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80006094:	00002097          	auipc	ra,0x2
    80006098:	8ac080e7          	jalr	-1876(ra) # 80007940 <_Z11printStringPKc>
    8000609c:	00000613          	li	a2,0
    800060a0:	00a00593          	li	a1,10
    800060a4:	0004851b          	sext.w	a0,s1
    800060a8:	00002097          	auipc	ra,0x2
    800060ac:	a48080e7          	jalr	-1464(ra) # 80007af0 <_Z8printIntiii>
    800060b0:	00005517          	auipc	a0,0x5
    800060b4:	74050513          	addi	a0,a0,1856 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    800060b8:	00002097          	auipc	ra,0x2
    800060bc:	888080e7          	jalr	-1912(ra) # 80007940 <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    800060c0:	00000693          	li	a3,0
    800060c4:	f95ff06f          	j	80006058 <_ZL11workerBodyBPv+0x20>
            asm volatile("csrr t6, sepc");
    800060c8:	14102ff3          	csrr	t6,sepc
    800060cc:	fb5ff06f          	j	80006080 <_ZL11workerBodyBPv+0x48>
    printString("B finished!\n");
    800060d0:	00005517          	auipc	a0,0x5
    800060d4:	4d850513          	addi	a0,a0,1240 # 8000b5a8 <CONSOLE_STATUS+0x598>
    800060d8:	00002097          	auipc	ra,0x2
    800060dc:	868080e7          	jalr	-1944(ra) # 80007940 <_Z11printStringPKc>
    finishedB = true;
    800060e0:	00100793          	li	a5,1
    800060e4:	00008717          	auipc	a4,0x8
    800060e8:	f8f70b23          	sb	a5,-106(a4) # 8000e07a <_ZL9finishedB>
    thread_dispatch();
    800060ec:	ffffc097          	auipc	ra,0xffffc
    800060f0:	88c080e7          	jalr	-1908(ra) # 80001978 <_Z15thread_dispatchv>
}
    800060f4:	01813083          	ld	ra,24(sp)
    800060f8:	01013403          	ld	s0,16(sp)
    800060fc:	00813483          	ld	s1,8(sp)
    80006100:	02010113          	addi	sp,sp,32
    80006104:	00008067          	ret

0000000080006108 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006108:	fe010113          	addi	sp,sp,-32
    8000610c:	00113c23          	sd	ra,24(sp)
    80006110:	00813823          	sd	s0,16(sp)
    80006114:	00913423          	sd	s1,8(sp)
    80006118:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000611c:	00000493          	li	s1,0
    80006120:	02c0006f          	j	8000614c <_ZL11workerBodyAPv+0x44>
        for (uint64 j = 0; j < 100; j++) {
    80006124:	00168693          	addi	a3,a3,1
    80006128:	06300793          	li	a5,99
    8000612c:	00d7ee63          	bltu	a5,a3,80006148 <_ZL11workerBodyAPv+0x40>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006130:	00000713          	li	a4,0
    80006134:	000077b7          	lui	a5,0x7
    80006138:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000613c:	fee7e4e3          	bltu	a5,a4,80006124 <_ZL11workerBodyAPv+0x1c>
    80006140:	00170713          	addi	a4,a4,1
    80006144:	ff1ff06f          	j	80006134 <_ZL11workerBodyAPv+0x2c>
    for (uint64 i = 0; i < 10; i++) {
    80006148:	00148493          	addi	s1,s1,1
    8000614c:	00900793          	li	a5,9
    80006150:	0497e063          	bltu	a5,s1,80006190 <_ZL11workerBodyAPv+0x88>
        printString("A: i="); printInt(i); printString("\n");
    80006154:	00005517          	auipc	a0,0x5
    80006158:	46450513          	addi	a0,a0,1124 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    8000615c:	00001097          	auipc	ra,0x1
    80006160:	7e4080e7          	jalr	2020(ra) # 80007940 <_Z11printStringPKc>
    80006164:	00000613          	li	a2,0
    80006168:	00a00593          	li	a1,10
    8000616c:	0004851b          	sext.w	a0,s1
    80006170:	00002097          	auipc	ra,0x2
    80006174:	980080e7          	jalr	-1664(ra) # 80007af0 <_Z8printIntiii>
    80006178:	00005517          	auipc	a0,0x5
    8000617c:	67850513          	addi	a0,a0,1656 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006180:	00001097          	auipc	ra,0x1
    80006184:	7c0080e7          	jalr	1984(ra) # 80007940 <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80006188:	00000693          	li	a3,0
    8000618c:	f9dff06f          	j	80006128 <_ZL11workerBodyAPv+0x20>
    printString("A finished!\n");
    80006190:	00005517          	auipc	a0,0x5
    80006194:	43050513          	addi	a0,a0,1072 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80006198:	00001097          	auipc	ra,0x1
    8000619c:	7a8080e7          	jalr	1960(ra) # 80007940 <_Z11printStringPKc>
    finishedA = true;
    800061a0:	00100793          	li	a5,1
    800061a4:	00008717          	auipc	a4,0x8
    800061a8:	ecf70ba3          	sb	a5,-297(a4) # 8000e07b <_ZL9finishedA>
}
    800061ac:	01813083          	ld	ra,24(sp)
    800061b0:	01013403          	ld	s0,16(sp)
    800061b4:	00813483          	ld	s1,8(sp)
    800061b8:	02010113          	addi	sp,sp,32
    800061bc:	00008067          	ret

00000000800061c0 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800061c0:	fd010113          	addi	sp,sp,-48
    800061c4:	02113423          	sd	ra,40(sp)
    800061c8:	02813023          	sd	s0,32(sp)
    800061cc:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800061d0:	00000613          	li	a2,0
    800061d4:	00000597          	auipc	a1,0x0
    800061d8:	f3458593          	addi	a1,a1,-204 # 80006108 <_ZL11workerBodyAPv>
    800061dc:	fd040513          	addi	a0,s0,-48
    800061e0:	ffffb097          	auipc	ra,0xffffb
    800061e4:	6fc080e7          	jalr	1788(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800061e8:	00005517          	auipc	a0,0x5
    800061ec:	3e850513          	addi	a0,a0,1000 # 8000b5d0 <CONSOLE_STATUS+0x5c0>
    800061f0:	00001097          	auipc	ra,0x1
    800061f4:	750080e7          	jalr	1872(ra) # 80007940 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[1], workerBodyB, nullptr);
    800061f8:	00000613          	li	a2,0
    800061fc:	00000597          	auipc	a1,0x0
    80006200:	e3c58593          	addi	a1,a1,-452 # 80006038 <_ZL11workerBodyBPv>
    80006204:	fd840513          	addi	a0,s0,-40
    80006208:	ffffb097          	auipc	ra,0xffffb
    8000620c:	6d4080e7          	jalr	1748(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80006210:	00005517          	auipc	a0,0x5
    80006214:	3d850513          	addi	a0,a0,984 # 8000b5e8 <CONSOLE_STATUS+0x5d8>
    80006218:	00001097          	auipc	ra,0x1
    8000621c:	728080e7          	jalr	1832(ra) # 80007940 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[2], workerBodyC, nullptr);
    80006220:	00000613          	li	a2,0
    80006224:	00000597          	auipc	a1,0x0
    80006228:	c9458593          	addi	a1,a1,-876 # 80005eb8 <_ZL11workerBodyCPv>
    8000622c:	fe040513          	addi	a0,s0,-32
    80006230:	ffffb097          	auipc	ra,0xffffb
    80006234:	6ac080e7          	jalr	1708(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80006238:	00005517          	auipc	a0,0x5
    8000623c:	3c850513          	addi	a0,a0,968 # 8000b600 <CONSOLE_STATUS+0x5f0>
    80006240:	00001097          	auipc	ra,0x1
    80006244:	700080e7          	jalr	1792(ra) # 80007940 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[3], workerBodyD, nullptr);
    80006248:	00000613          	li	a2,0
    8000624c:	00000597          	auipc	a1,0x0
    80006250:	b2458593          	addi	a1,a1,-1244 # 80005d70 <_ZL11workerBodyDPv>
    80006254:	fe840513          	addi	a0,s0,-24
    80006258:	ffffb097          	auipc	ra,0xffffb
    8000625c:	684080e7          	jalr	1668(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006260:	00005517          	auipc	a0,0x5
    80006264:	3b850513          	addi	a0,a0,952 # 8000b618 <CONSOLE_STATUS+0x608>
    80006268:	00001097          	auipc	ra,0x1
    8000626c:	6d8080e7          	jalr	1752(ra) # 80007940 <_Z11printStringPKc>
    80006270:	00c0006f          	j	8000627c <_Z16System_Mode_testv+0xbc>
    // testUser();

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006274:	ffffb097          	auipc	ra,0xffffb
    80006278:	704080e7          	jalr	1796(ra) # 80001978 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000627c:	00008797          	auipc	a5,0x8
    80006280:	dff7c783          	lbu	a5,-513(a5) # 8000e07b <_ZL9finishedA>
    80006284:	fe0788e3          	beqz	a5,80006274 <_Z16System_Mode_testv+0xb4>
    80006288:	00008797          	auipc	a5,0x8
    8000628c:	df27c783          	lbu	a5,-526(a5) # 8000e07a <_ZL9finishedB>
    80006290:	fe0782e3          	beqz	a5,80006274 <_Z16System_Mode_testv+0xb4>
    80006294:	00008797          	auipc	a5,0x8
    80006298:	de57c783          	lbu	a5,-539(a5) # 8000e079 <_ZL9finishedC>
    8000629c:	fc078ce3          	beqz	a5,80006274 <_Z16System_Mode_testv+0xb4>
    800062a0:	00008797          	auipc	a5,0x8
    800062a4:	dd87c783          	lbu	a5,-552(a5) # 8000e078 <_ZL9finishedD>
    800062a8:	fc0786e3          	beqz	a5,80006274 <_Z16System_Mode_testv+0xb4>
    }

}
    800062ac:	02813083          	ld	ra,40(sp)
    800062b0:	02013403          	ld	s0,32(sp)
    800062b4:	03010113          	addi	sp,sp,48
    800062b8:	00008067          	ret

00000000800062bc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800062bc:	fe010113          	addi	sp,sp,-32
    800062c0:	00113c23          	sd	ra,24(sp)
    800062c4:	00813823          	sd	s0,16(sp)
    800062c8:	00913423          	sd	s1,8(sp)
    800062cc:	01213023          	sd	s2,0(sp)
    800062d0:	02010413          	addi	s0,sp,32
    800062d4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800062d8:	00100793          	li	a5,1
    800062dc:	02a7f863          	bgeu	a5,a0,8000630c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800062e0:	00a00793          	li	a5,10
    800062e4:	02f577b3          	remu	a5,a0,a5
    800062e8:	02078e63          	beqz	a5,80006324 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800062ec:	fff48513          	addi	a0,s1,-1
    800062f0:	00000097          	auipc	ra,0x0
    800062f4:	fcc080e7          	jalr	-52(ra) # 800062bc <_ZL9fibonaccim>
    800062f8:	00050913          	mv	s2,a0
    800062fc:	ffe48513          	addi	a0,s1,-2
    80006300:	00000097          	auipc	ra,0x0
    80006304:	fbc080e7          	jalr	-68(ra) # 800062bc <_ZL9fibonaccim>
    80006308:	00a90533          	add	a0,s2,a0
}
    8000630c:	01813083          	ld	ra,24(sp)
    80006310:	01013403          	ld	s0,16(sp)
    80006314:	00813483          	ld	s1,8(sp)
    80006318:	00013903          	ld	s2,0(sp)
    8000631c:	02010113          	addi	sp,sp,32
    80006320:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006324:	ffffb097          	auipc	ra,0xffffb
    80006328:	654080e7          	jalr	1620(ra) # 80001978 <_Z15thread_dispatchv>
    8000632c:	fc1ff06f          	j	800062ec <_ZL9fibonaccim+0x30>

0000000080006330 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006330:	fe010113          	addi	sp,sp,-32
    80006334:	00113c23          	sd	ra,24(sp)
    80006338:	00813823          	sd	s0,16(sp)
    8000633c:	00913423          	sd	s1,8(sp)
    80006340:	01213023          	sd	s2,0(sp)
    80006344:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006348:	00a00493          	li	s1,10
    8000634c:	0400006f          	j	8000638c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006350:	00005517          	auipc	a0,0x5
    80006354:	1d850513          	addi	a0,a0,472 # 8000b528 <CONSOLE_STATUS+0x518>
    80006358:	00001097          	auipc	ra,0x1
    8000635c:	5e8080e7          	jalr	1512(ra) # 80007940 <_Z11printStringPKc>
    80006360:	00000613          	li	a2,0
    80006364:	00a00593          	li	a1,10
    80006368:	00048513          	mv	a0,s1
    8000636c:	00001097          	auipc	ra,0x1
    80006370:	784080e7          	jalr	1924(ra) # 80007af0 <_Z8printIntiii>
    80006374:	00005517          	auipc	a0,0x5
    80006378:	47c50513          	addi	a0,a0,1148 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    8000637c:	00001097          	auipc	ra,0x1
    80006380:	5c4080e7          	jalr	1476(ra) # 80007940 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006384:	0014849b          	addiw	s1,s1,1
    80006388:	0ff4f493          	andi	s1,s1,255
    8000638c:	00c00793          	li	a5,12
    80006390:	fc97f0e3          	bgeu	a5,s1,80006350 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006394:	00005517          	auipc	a0,0x5
    80006398:	19c50513          	addi	a0,a0,412 # 8000b530 <CONSOLE_STATUS+0x520>
    8000639c:	00001097          	auipc	ra,0x1
    800063a0:	5a4080e7          	jalr	1444(ra) # 80007940 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800063a4:	00500313          	li	t1,5
    thread_dispatch();
    800063a8:	ffffb097          	auipc	ra,0xffffb
    800063ac:	5d0080e7          	jalr	1488(ra) # 80001978 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800063b0:	01000513          	li	a0,16
    800063b4:	00000097          	auipc	ra,0x0
    800063b8:	f08080e7          	jalr	-248(ra) # 800062bc <_ZL9fibonaccim>
    800063bc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800063c0:	00005517          	auipc	a0,0x5
    800063c4:	18050513          	addi	a0,a0,384 # 8000b540 <CONSOLE_STATUS+0x530>
    800063c8:	00001097          	auipc	ra,0x1
    800063cc:	578080e7          	jalr	1400(ra) # 80007940 <_Z11printStringPKc>
    800063d0:	00000613          	li	a2,0
    800063d4:	00a00593          	li	a1,10
    800063d8:	0009051b          	sext.w	a0,s2
    800063dc:	00001097          	auipc	ra,0x1
    800063e0:	714080e7          	jalr	1812(ra) # 80007af0 <_Z8printIntiii>
    800063e4:	00005517          	auipc	a0,0x5
    800063e8:	40c50513          	addi	a0,a0,1036 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    800063ec:	00001097          	auipc	ra,0x1
    800063f0:	554080e7          	jalr	1364(ra) # 80007940 <_Z11printStringPKc>
    800063f4:	0400006f          	j	80006434 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800063f8:	00005517          	auipc	a0,0x5
    800063fc:	13050513          	addi	a0,a0,304 # 8000b528 <CONSOLE_STATUS+0x518>
    80006400:	00001097          	auipc	ra,0x1
    80006404:	540080e7          	jalr	1344(ra) # 80007940 <_Z11printStringPKc>
    80006408:	00000613          	li	a2,0
    8000640c:	00a00593          	li	a1,10
    80006410:	00048513          	mv	a0,s1
    80006414:	00001097          	auipc	ra,0x1
    80006418:	6dc080e7          	jalr	1756(ra) # 80007af0 <_Z8printIntiii>
    8000641c:	00005517          	auipc	a0,0x5
    80006420:	3d450513          	addi	a0,a0,980 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006424:	00001097          	auipc	ra,0x1
    80006428:	51c080e7          	jalr	1308(ra) # 80007940 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000642c:	0014849b          	addiw	s1,s1,1
    80006430:	0ff4f493          	andi	s1,s1,255
    80006434:	00f00793          	li	a5,15
    80006438:	fc97f0e3          	bgeu	a5,s1,800063f8 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000643c:	00005517          	auipc	a0,0x5
    80006440:	11450513          	addi	a0,a0,276 # 8000b550 <CONSOLE_STATUS+0x540>
    80006444:	00001097          	auipc	ra,0x1
    80006448:	4fc080e7          	jalr	1276(ra) # 80007940 <_Z11printStringPKc>
    finishedD = true;
    8000644c:	00100793          	li	a5,1
    80006450:	00008717          	auipc	a4,0x8
    80006454:	c2f70623          	sb	a5,-980(a4) # 8000e07c <_ZL9finishedD>
    thread_dispatch();
    80006458:	ffffb097          	auipc	ra,0xffffb
    8000645c:	520080e7          	jalr	1312(ra) # 80001978 <_Z15thread_dispatchv>
}
    80006460:	01813083          	ld	ra,24(sp)
    80006464:	01013403          	ld	s0,16(sp)
    80006468:	00813483          	ld	s1,8(sp)
    8000646c:	00013903          	ld	s2,0(sp)
    80006470:	02010113          	addi	sp,sp,32
    80006474:	00008067          	ret

0000000080006478 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006478:	fe010113          	addi	sp,sp,-32
    8000647c:	00113c23          	sd	ra,24(sp)
    80006480:	00813823          	sd	s0,16(sp)
    80006484:	00913423          	sd	s1,8(sp)
    80006488:	01213023          	sd	s2,0(sp)
    8000648c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006490:	00000493          	li	s1,0
    80006494:	0400006f          	j	800064d4 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006498:	00005517          	auipc	a0,0x5
    8000649c:	0c850513          	addi	a0,a0,200 # 8000b560 <CONSOLE_STATUS+0x550>
    800064a0:	00001097          	auipc	ra,0x1
    800064a4:	4a0080e7          	jalr	1184(ra) # 80007940 <_Z11printStringPKc>
    800064a8:	00000613          	li	a2,0
    800064ac:	00a00593          	li	a1,10
    800064b0:	00048513          	mv	a0,s1
    800064b4:	00001097          	auipc	ra,0x1
    800064b8:	63c080e7          	jalr	1596(ra) # 80007af0 <_Z8printIntiii>
    800064bc:	00005517          	auipc	a0,0x5
    800064c0:	33450513          	addi	a0,a0,820 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    800064c4:	00001097          	auipc	ra,0x1
    800064c8:	47c080e7          	jalr	1148(ra) # 80007940 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800064cc:	0014849b          	addiw	s1,s1,1
    800064d0:	0ff4f493          	andi	s1,s1,255
    800064d4:	00200793          	li	a5,2
    800064d8:	fc97f0e3          	bgeu	a5,s1,80006498 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800064dc:	00005517          	auipc	a0,0x5
    800064e0:	08c50513          	addi	a0,a0,140 # 8000b568 <CONSOLE_STATUS+0x558>
    800064e4:	00001097          	auipc	ra,0x1
    800064e8:	45c080e7          	jalr	1116(ra) # 80007940 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800064ec:	00700313          	li	t1,7
    thread_dispatch();
    800064f0:	ffffb097          	auipc	ra,0xffffb
    800064f4:	488080e7          	jalr	1160(ra) # 80001978 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800064f8:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800064fc:	00005517          	auipc	a0,0x5
    80006500:	07c50513          	addi	a0,a0,124 # 8000b578 <CONSOLE_STATUS+0x568>
    80006504:	00001097          	auipc	ra,0x1
    80006508:	43c080e7          	jalr	1084(ra) # 80007940 <_Z11printStringPKc>
    8000650c:	00000613          	li	a2,0
    80006510:	00a00593          	li	a1,10
    80006514:	0009051b          	sext.w	a0,s2
    80006518:	00001097          	auipc	ra,0x1
    8000651c:	5d8080e7          	jalr	1496(ra) # 80007af0 <_Z8printIntiii>
    80006520:	00005517          	auipc	a0,0x5
    80006524:	2d050513          	addi	a0,a0,720 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006528:	00001097          	auipc	ra,0x1
    8000652c:	418080e7          	jalr	1048(ra) # 80007940 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006530:	00c00513          	li	a0,12
    80006534:	00000097          	auipc	ra,0x0
    80006538:	d88080e7          	jalr	-632(ra) # 800062bc <_ZL9fibonaccim>
    8000653c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006540:	00005517          	auipc	a0,0x5
    80006544:	04050513          	addi	a0,a0,64 # 8000b580 <CONSOLE_STATUS+0x570>
    80006548:	00001097          	auipc	ra,0x1
    8000654c:	3f8080e7          	jalr	1016(ra) # 80007940 <_Z11printStringPKc>
    80006550:	00000613          	li	a2,0
    80006554:	00a00593          	li	a1,10
    80006558:	0009051b          	sext.w	a0,s2
    8000655c:	00001097          	auipc	ra,0x1
    80006560:	594080e7          	jalr	1428(ra) # 80007af0 <_Z8printIntiii>
    80006564:	00005517          	auipc	a0,0x5
    80006568:	28c50513          	addi	a0,a0,652 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    8000656c:	00001097          	auipc	ra,0x1
    80006570:	3d4080e7          	jalr	980(ra) # 80007940 <_Z11printStringPKc>
    80006574:	0400006f          	j	800065b4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006578:	00005517          	auipc	a0,0x5
    8000657c:	fe850513          	addi	a0,a0,-24 # 8000b560 <CONSOLE_STATUS+0x550>
    80006580:	00001097          	auipc	ra,0x1
    80006584:	3c0080e7          	jalr	960(ra) # 80007940 <_Z11printStringPKc>
    80006588:	00000613          	li	a2,0
    8000658c:	00a00593          	li	a1,10
    80006590:	00048513          	mv	a0,s1
    80006594:	00001097          	auipc	ra,0x1
    80006598:	55c080e7          	jalr	1372(ra) # 80007af0 <_Z8printIntiii>
    8000659c:	00005517          	auipc	a0,0x5
    800065a0:	25450513          	addi	a0,a0,596 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    800065a4:	00001097          	auipc	ra,0x1
    800065a8:	39c080e7          	jalr	924(ra) # 80007940 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800065ac:	0014849b          	addiw	s1,s1,1
    800065b0:	0ff4f493          	andi	s1,s1,255
    800065b4:	00500793          	li	a5,5
    800065b8:	fc97f0e3          	bgeu	a5,s1,80006578 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    800065bc:	00005517          	auipc	a0,0x5
    800065c0:	fd450513          	addi	a0,a0,-44 # 8000b590 <CONSOLE_STATUS+0x580>
    800065c4:	00001097          	auipc	ra,0x1
    800065c8:	37c080e7          	jalr	892(ra) # 80007940 <_Z11printStringPKc>
    finishedC = true;
    800065cc:	00100793          	li	a5,1
    800065d0:	00008717          	auipc	a4,0x8
    800065d4:	aaf706a3          	sb	a5,-1363(a4) # 8000e07d <_ZL9finishedC>
    thread_dispatch();
    800065d8:	ffffb097          	auipc	ra,0xffffb
    800065dc:	3a0080e7          	jalr	928(ra) # 80001978 <_Z15thread_dispatchv>
}
    800065e0:	01813083          	ld	ra,24(sp)
    800065e4:	01013403          	ld	s0,16(sp)
    800065e8:	00813483          	ld	s1,8(sp)
    800065ec:	00013903          	ld	s2,0(sp)
    800065f0:	02010113          	addi	sp,sp,32
    800065f4:	00008067          	ret

00000000800065f8 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800065f8:	fe010113          	addi	sp,sp,-32
    800065fc:	00113c23          	sd	ra,24(sp)
    80006600:	00813823          	sd	s0,16(sp)
    80006604:	00913423          	sd	s1,8(sp)
    80006608:	01213023          	sd	s2,0(sp)
    8000660c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006610:	00000913          	li	s2,0
    80006614:	0380006f          	j	8000664c <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80006618:	ffffb097          	auipc	ra,0xffffb
    8000661c:	360080e7          	jalr	864(ra) # 80001978 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006620:	00148493          	addi	s1,s1,1
    80006624:	000027b7          	lui	a5,0x2
    80006628:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000662c:	0097ee63          	bltu	a5,s1,80006648 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006630:	00000713          	li	a4,0
    80006634:	000077b7          	lui	a5,0x7
    80006638:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000663c:	fce7eee3          	bltu	a5,a4,80006618 <_ZL11workerBodyBPv+0x20>
    80006640:	00170713          	addi	a4,a4,1
    80006644:	ff1ff06f          	j	80006634 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80006648:	00190913          	addi	s2,s2,1
    8000664c:	00f00793          	li	a5,15
    80006650:	0527e063          	bltu	a5,s2,80006690 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80006654:	00005517          	auipc	a0,0x5
    80006658:	f4c50513          	addi	a0,a0,-180 # 8000b5a0 <CONSOLE_STATUS+0x590>
    8000665c:	00001097          	auipc	ra,0x1
    80006660:	2e4080e7          	jalr	740(ra) # 80007940 <_Z11printStringPKc>
    80006664:	00000613          	li	a2,0
    80006668:	00a00593          	li	a1,10
    8000666c:	0009051b          	sext.w	a0,s2
    80006670:	00001097          	auipc	ra,0x1
    80006674:	480080e7          	jalr	1152(ra) # 80007af0 <_Z8printIntiii>
    80006678:	00005517          	auipc	a0,0x5
    8000667c:	17850513          	addi	a0,a0,376 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006680:	00001097          	auipc	ra,0x1
    80006684:	2c0080e7          	jalr	704(ra) # 80007940 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006688:	00000493          	li	s1,0
    8000668c:	f99ff06f          	j	80006624 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80006690:	00005517          	auipc	a0,0x5
    80006694:	f1850513          	addi	a0,a0,-232 # 8000b5a8 <CONSOLE_STATUS+0x598>
    80006698:	00001097          	auipc	ra,0x1
    8000669c:	2a8080e7          	jalr	680(ra) # 80007940 <_Z11printStringPKc>
    finishedB = true;
    800066a0:	00100793          	li	a5,1
    800066a4:	00008717          	auipc	a4,0x8
    800066a8:	9cf70d23          	sb	a5,-1574(a4) # 8000e07e <_ZL9finishedB>
    thread_dispatch();
    800066ac:	ffffb097          	auipc	ra,0xffffb
    800066b0:	2cc080e7          	jalr	716(ra) # 80001978 <_Z15thread_dispatchv>
}
    800066b4:	01813083          	ld	ra,24(sp)
    800066b8:	01013403          	ld	s0,16(sp)
    800066bc:	00813483          	ld	s1,8(sp)
    800066c0:	00013903          	ld	s2,0(sp)
    800066c4:	02010113          	addi	sp,sp,32
    800066c8:	00008067          	ret

00000000800066cc <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800066cc:	fe010113          	addi	sp,sp,-32
    800066d0:	00113c23          	sd	ra,24(sp)
    800066d4:	00813823          	sd	s0,16(sp)
    800066d8:	00913423          	sd	s1,8(sp)
    800066dc:	01213023          	sd	s2,0(sp)
    800066e0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800066e4:	00000913          	li	s2,0
    800066e8:	0380006f          	j	80006720 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800066ec:	ffffb097          	auipc	ra,0xffffb
    800066f0:	28c080e7          	jalr	652(ra) # 80001978 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800066f4:	00148493          	addi	s1,s1,1
    800066f8:	000027b7          	lui	a5,0x2
    800066fc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006700:	0097ee63          	bltu	a5,s1,8000671c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006704:	00000713          	li	a4,0
    80006708:	000077b7          	lui	a5,0x7
    8000670c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006710:	fce7eee3          	bltu	a5,a4,800066ec <_ZL11workerBodyAPv+0x20>
    80006714:	00170713          	addi	a4,a4,1
    80006718:	ff1ff06f          	j	80006708 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000671c:	00190913          	addi	s2,s2,1
    80006720:	00900793          	li	a5,9
    80006724:	0527e063          	bltu	a5,s2,80006764 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006728:	00005517          	auipc	a0,0x5
    8000672c:	e9050513          	addi	a0,a0,-368 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80006730:	00001097          	auipc	ra,0x1
    80006734:	210080e7          	jalr	528(ra) # 80007940 <_Z11printStringPKc>
    80006738:	00000613          	li	a2,0
    8000673c:	00a00593          	li	a1,10
    80006740:	0009051b          	sext.w	a0,s2
    80006744:	00001097          	auipc	ra,0x1
    80006748:	3ac080e7          	jalr	940(ra) # 80007af0 <_Z8printIntiii>
    8000674c:	00005517          	auipc	a0,0x5
    80006750:	0a450513          	addi	a0,a0,164 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006754:	00001097          	auipc	ra,0x1
    80006758:	1ec080e7          	jalr	492(ra) # 80007940 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000675c:	00000493          	li	s1,0
    80006760:	f99ff06f          	j	800066f8 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006764:	00005517          	auipc	a0,0x5
    80006768:	e5c50513          	addi	a0,a0,-420 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    8000676c:	00001097          	auipc	ra,0x1
    80006770:	1d4080e7          	jalr	468(ra) # 80007940 <_Z11printStringPKc>
    finishedA = true;
    80006774:	00100793          	li	a5,1
    80006778:	00008717          	auipc	a4,0x8
    8000677c:	90f703a3          	sb	a5,-1785(a4) # 8000e07f <_ZL9finishedA>
}
    80006780:	01813083          	ld	ra,24(sp)
    80006784:	01013403          	ld	s0,16(sp)
    80006788:	00813483          	ld	s1,8(sp)
    8000678c:	00013903          	ld	s2,0(sp)
    80006790:	02010113          	addi	sp,sp,32
    80006794:	00008067          	ret

0000000080006798 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80006798:	fd010113          	addi	sp,sp,-48
    8000679c:	02113423          	sd	ra,40(sp)
    800067a0:	02813023          	sd	s0,32(sp)
    800067a4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800067a8:	00000613          	li	a2,0
    800067ac:	00000597          	auipc	a1,0x0
    800067b0:	f2058593          	addi	a1,a1,-224 # 800066cc <_ZL11workerBodyAPv>
    800067b4:	fd040513          	addi	a0,s0,-48
    800067b8:	ffffb097          	auipc	ra,0xffffb
    800067bc:	124080e7          	jalr	292(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800067c0:	00005517          	auipc	a0,0x5
    800067c4:	e1050513          	addi	a0,a0,-496 # 8000b5d0 <CONSOLE_STATUS+0x5c0>
    800067c8:	00001097          	auipc	ra,0x1
    800067cc:	178080e7          	jalr	376(ra) # 80007940 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800067d0:	00000613          	li	a2,0
    800067d4:	00000597          	auipc	a1,0x0
    800067d8:	e2458593          	addi	a1,a1,-476 # 800065f8 <_ZL11workerBodyBPv>
    800067dc:	fd840513          	addi	a0,s0,-40
    800067e0:	ffffb097          	auipc	ra,0xffffb
    800067e4:	0fc080e7          	jalr	252(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    800067e8:	00005517          	auipc	a0,0x5
    800067ec:	e0050513          	addi	a0,a0,-512 # 8000b5e8 <CONSOLE_STATUS+0x5d8>
    800067f0:	00001097          	auipc	ra,0x1
    800067f4:	150080e7          	jalr	336(ra) # 80007940 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800067f8:	00000613          	li	a2,0
    800067fc:	00000597          	auipc	a1,0x0
    80006800:	c7c58593          	addi	a1,a1,-900 # 80006478 <_ZL11workerBodyCPv>
    80006804:	fe040513          	addi	a0,s0,-32
    80006808:	ffffb097          	auipc	ra,0xffffb
    8000680c:	0d4080e7          	jalr	212(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80006810:	00005517          	auipc	a0,0x5
    80006814:	df050513          	addi	a0,a0,-528 # 8000b600 <CONSOLE_STATUS+0x5f0>
    80006818:	00001097          	auipc	ra,0x1
    8000681c:	128080e7          	jalr	296(ra) # 80007940 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006820:	00000613          	li	a2,0
    80006824:	00000597          	auipc	a1,0x0
    80006828:	b0c58593          	addi	a1,a1,-1268 # 80006330 <_ZL11workerBodyDPv>
    8000682c:	fe840513          	addi	a0,s0,-24
    80006830:	ffffb097          	auipc	ra,0xffffb
    80006834:	0ac080e7          	jalr	172(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006838:	00005517          	auipc	a0,0x5
    8000683c:	de050513          	addi	a0,a0,-544 # 8000b618 <CONSOLE_STATUS+0x608>
    80006840:	00001097          	auipc	ra,0x1
    80006844:	100080e7          	jalr	256(ra) # 80007940 <_Z11printStringPKc>
    80006848:	00c0006f          	j	80006854 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    8000684c:	ffffb097          	auipc	ra,0xffffb
    80006850:	12c080e7          	jalr	300(ra) # 80001978 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006854:	00008797          	auipc	a5,0x8
    80006858:	82b7c783          	lbu	a5,-2005(a5) # 8000e07f <_ZL9finishedA>
    8000685c:	fe0788e3          	beqz	a5,8000684c <_Z18Threads_C_API_testv+0xb4>
    80006860:	00008797          	auipc	a5,0x8
    80006864:	81e7c783          	lbu	a5,-2018(a5) # 8000e07e <_ZL9finishedB>
    80006868:	fe0782e3          	beqz	a5,8000684c <_Z18Threads_C_API_testv+0xb4>
    8000686c:	00008797          	auipc	a5,0x8
    80006870:	8117c783          	lbu	a5,-2031(a5) # 8000e07d <_ZL9finishedC>
    80006874:	fc078ce3          	beqz	a5,8000684c <_Z18Threads_C_API_testv+0xb4>
    80006878:	00008797          	auipc	a5,0x8
    8000687c:	8047c783          	lbu	a5,-2044(a5) # 8000e07c <_ZL9finishedD>
    80006880:	fc0786e3          	beqz	a5,8000684c <_Z18Threads_C_API_testv+0xb4>
    }

}
    80006884:	02813083          	ld	ra,40(sp)
    80006888:	02013403          	ld	s0,32(sp)
    8000688c:	03010113          	addi	sp,sp,48
    80006890:	00008067          	ret

0000000080006894 <_ZL9sleepyRunPv>:

#include "../test_h/printing.h"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006894:	fe010113          	addi	sp,sp,-32
    80006898:	00113c23          	sd	ra,24(sp)
    8000689c:	00813823          	sd	s0,16(sp)
    800068a0:	00913423          	sd	s1,8(sp)
    800068a4:	01213023          	sd	s2,0(sp)
    800068a8:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800068ac:	00053903          	ld	s2,0(a0)
    int i = 6;
    800068b0:	00600493          	li	s1,6
    while (--i > 0) {
    800068b4:	fff4849b          	addiw	s1,s1,-1
    800068b8:	04905a63          	blez	s1,8000690c <_ZL9sleepyRunPv+0x78>

        printString("Hello ");
    800068bc:	00005517          	auipc	a0,0x5
    800068c0:	d7450513          	addi	a0,a0,-652 # 8000b630 <CONSOLE_STATUS+0x620>
    800068c4:	00001097          	auipc	ra,0x1
    800068c8:	07c080e7          	jalr	124(ra) # 80007940 <_Z11printStringPKc>
        printInt(sleep_time);
    800068cc:	00000613          	li	a2,0
    800068d0:	00a00593          	li	a1,10
    800068d4:	0009051b          	sext.w	a0,s2
    800068d8:	00001097          	auipc	ra,0x1
    800068dc:	218080e7          	jalr	536(ra) # 80007af0 <_Z8printIntiii>
        printString(" !\n");
    800068e0:	00005517          	auipc	a0,0x5
    800068e4:	d5850513          	addi	a0,a0,-680 # 8000b638 <CONSOLE_STATUS+0x628>
    800068e8:	00001097          	auipc	ra,0x1
    800068ec:	058080e7          	jalr	88(ra) # 80007940 <_Z11printStringPKc>
        time_sleep(sleep_time);
    800068f0:	00090513          	mv	a0,s2
    800068f4:	ffffb097          	auipc	ra,0xffffb
    800068f8:	0c8080e7          	jalr	200(ra) # 800019bc <_Z10time_sleepm>
        putc('.');
    800068fc:	02e00513          	li	a0,46
    80006900:	ffffb097          	auipc	ra,0xffffb
    80006904:	1cc080e7          	jalr	460(ra) # 80001acc <_Z4putcc>
    while (--i > 0) {
    80006908:	fadff06f          	j	800068b4 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/20-1] = true;
    8000690c:	01400793          	li	a5,20
    80006910:	02f95933          	divu	s2,s2,a5
    80006914:	fff90913          	addi	s2,s2,-1
    80006918:	00007797          	auipc	a5,0x7
    8000691c:	76878793          	addi	a5,a5,1896 # 8000e080 <_ZL8finished>
    80006920:	01278933          	add	s2,a5,s2
    80006924:	00100793          	li	a5,1
    80006928:	00f90023          	sb	a5,0(s2)
}
    8000692c:	01813083          	ld	ra,24(sp)
    80006930:	01013403          	ld	s0,16(sp)
    80006934:	00813483          	ld	s1,8(sp)
    80006938:	00013903          	ld	s2,0(sp)
    8000693c:	02010113          	addi	sp,sp,32
    80006940:	00008067          	ret

0000000080006944 <_Z12testSleepingv>:

void testSleeping() {
    80006944:	fc010113          	addi	sp,sp,-64
    80006948:	02113c23          	sd	ra,56(sp)
    8000694c:	02813823          	sd	s0,48(sp)
    80006950:	02913423          	sd	s1,40(sp)
    80006954:	04010413          	addi	s0,sp,64
    printString("Starting...\n");
    80006958:	00005517          	auipc	a0,0x5
    8000695c:	ce850513          	addi	a0,a0,-792 # 8000b640 <CONSOLE_STATUS+0x630>
    80006960:	00001097          	auipc	ra,0x1
    80006964:	fe0080e7          	jalr	-32(ra) # 80007940 <_Z11printStringPKc>
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {20, 40};
    80006968:	01400793          	li	a5,20
    8000696c:	fcf43823          	sd	a5,-48(s0)
    80006970:	02800793          	li	a5,40
    80006974:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    printString("Creating threads: ");
    80006978:	00005517          	auipc	a0,0x5
    8000697c:	cd850513          	addi	a0,a0,-808 # 8000b650 <CONSOLE_STATUS+0x640>
    80006980:	00001097          	auipc	ra,0x1
    80006984:	fc0080e7          	jalr	-64(ra) # 80007940 <_Z11printStringPKc>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006988:	00000493          	li	s1,0
    8000698c:	0500006f          	j	800069dc <_Z12testSleepingv+0x98>
        printInt(i);
    80006990:	00000613          	li	a2,0
    80006994:	00a00593          	li	a1,10
    80006998:	00048513          	mv	a0,s1
    8000699c:	00001097          	auipc	ra,0x1
    800069a0:	154080e7          	jalr	340(ra) # 80007af0 <_Z8printIntiii>
        printString(" ");
    800069a4:	00005517          	auipc	a0,0x5
    800069a8:	cc450513          	addi	a0,a0,-828 # 8000b668 <CONSOLE_STATUS+0x658>
    800069ac:	00001097          	auipc	ra,0x1
    800069b0:	f94080e7          	jalr	-108(ra) # 80007940 <_Z11printStringPKc>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800069b4:	00349793          	slli	a5,s1,0x3
    800069b8:	fd040613          	addi	a2,s0,-48
    800069bc:	00f60633          	add	a2,a2,a5
    800069c0:	00000597          	auipc	a1,0x0
    800069c4:	ed458593          	addi	a1,a1,-300 # 80006894 <_ZL9sleepyRunPv>
    800069c8:	fc040513          	addi	a0,s0,-64
    800069cc:	00f50533          	add	a0,a0,a5
    800069d0:	ffffb097          	auipc	ra,0xffffb
    800069d4:	f0c080e7          	jalr	-244(ra) # 800018dc <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800069d8:	0014849b          	addiw	s1,s1,1
    800069dc:	00100793          	li	a5,1
    800069e0:	fa97d8e3          	bge	a5,s1,80006990 <_Z12testSleepingv+0x4c>
    }
    printString("\nSuccesfully created all threads, now waiting for them to end\n");
    800069e4:	00005517          	auipc	a0,0x5
    800069e8:	c8c50513          	addi	a0,a0,-884 # 8000b670 <CONSOLE_STATUS+0x660>
    800069ec:	00001097          	auipc	ra,0x1
    800069f0:	f54080e7          	jalr	-172(ra) # 80007940 <_Z11printStringPKc>
    800069f4:	00c0006f          	j	80006a00 <_Z12testSleepingv+0xbc>
    while (!(finished[0] && finished[1])) {thread_dispatch();}
    800069f8:	ffffb097          	auipc	ra,0xffffb
    800069fc:	f80080e7          	jalr	-128(ra) # 80001978 <_Z15thread_dispatchv>
    80006a00:	00007797          	auipc	a5,0x7
    80006a04:	6807c783          	lbu	a5,1664(a5) # 8000e080 <_ZL8finished>
    80006a08:	fe0788e3          	beqz	a5,800069f8 <_Z12testSleepingv+0xb4>
    80006a0c:	00007797          	auipc	a5,0x7
    80006a10:	6757c783          	lbu	a5,1653(a5) # 8000e081 <_ZL8finished+0x1>
    80006a14:	fe0782e3          	beqz	a5,800069f8 <_Z12testSleepingv+0xb4>
}
    80006a18:	03813083          	ld	ra,56(sp)
    80006a1c:	03013403          	ld	s0,48(sp)
    80006a20:	02813483          	ld	s1,40(sp)
    80006a24:	04010113          	addi	sp,sp,64
    80006a28:	00008067          	ret

0000000080006a2c <_ZN9BufferCPPC1Ei>:
#include "../test_h/buffer_CPP_API.h"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006a2c:	fd010113          	addi	sp,sp,-48
    80006a30:	02113423          	sd	ra,40(sp)
    80006a34:	02813023          	sd	s0,32(sp)
    80006a38:	00913c23          	sd	s1,24(sp)
    80006a3c:	01213823          	sd	s2,16(sp)
    80006a40:	01313423          	sd	s3,8(sp)
    80006a44:	03010413          	addi	s0,sp,48
    80006a48:	00050493          	mv	s1,a0
    80006a4c:	00058913          	mv	s2,a1
    80006a50:	0015879b          	addiw	a5,a1,1
    80006a54:	0007851b          	sext.w	a0,a5
    80006a58:	00f4a023          	sw	a5,0(s1)
    80006a5c:	0004a823          	sw	zero,16(s1)
    80006a60:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006a64:	00251513          	slli	a0,a0,0x2
    80006a68:	ffffb097          	auipc	ra,0xffffb
    80006a6c:	e18080e7          	jalr	-488(ra) # 80001880 <_Z9mem_allocm>
    80006a70:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006a74:	01000513          	li	a0,16
    80006a78:	ffffa097          	auipc	ra,0xffffa
    80006a7c:	744080e7          	jalr	1860(ra) # 800011bc <_Znwm>
    80006a80:	00050993          	mv	s3,a0
    80006a84:	00000593          	li	a1,0
    80006a88:	ffffb097          	auipc	ra,0xffffb
    80006a8c:	94c080e7          	jalr	-1716(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006a90:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006a94:	01000513          	li	a0,16
    80006a98:	ffffa097          	auipc	ra,0xffffa
    80006a9c:	724080e7          	jalr	1828(ra) # 800011bc <_Znwm>
    80006aa0:	00050993          	mv	s3,a0
    80006aa4:	00090593          	mv	a1,s2
    80006aa8:	ffffb097          	auipc	ra,0xffffb
    80006aac:	92c080e7          	jalr	-1748(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006ab0:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006ab4:	01000513          	li	a0,16
    80006ab8:	ffffa097          	auipc	ra,0xffffa
    80006abc:	704080e7          	jalr	1796(ra) # 800011bc <_Znwm>
    80006ac0:	00050913          	mv	s2,a0
    80006ac4:	00100593          	li	a1,1
    80006ac8:	ffffb097          	auipc	ra,0xffffb
    80006acc:	90c080e7          	jalr	-1780(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006ad0:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006ad4:	01000513          	li	a0,16
    80006ad8:	ffffa097          	auipc	ra,0xffffa
    80006adc:	6e4080e7          	jalr	1764(ra) # 800011bc <_Znwm>
    80006ae0:	00050913          	mv	s2,a0
    80006ae4:	00100593          	li	a1,1
    80006ae8:	ffffb097          	auipc	ra,0xffffb
    80006aec:	8ec080e7          	jalr	-1812(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80006af0:	0324b823          	sd	s2,48(s1)
}
    80006af4:	02813083          	ld	ra,40(sp)
    80006af8:	02013403          	ld	s0,32(sp)
    80006afc:	01813483          	ld	s1,24(sp)
    80006b00:	01013903          	ld	s2,16(sp)
    80006b04:	00813983          	ld	s3,8(sp)
    80006b08:	03010113          	addi	sp,sp,48
    80006b0c:	00008067          	ret
    80006b10:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006b14:	00098513          	mv	a0,s3
    80006b18:	ffffa097          	auipc	ra,0xffffa
    80006b1c:	6cc080e7          	jalr	1740(ra) # 800011e4 <_ZdlPv>
    80006b20:	00048513          	mv	a0,s1
    80006b24:	00008097          	auipc	ra,0x8
    80006b28:	644080e7          	jalr	1604(ra) # 8000f168 <_Unwind_Resume>
    80006b2c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006b30:	00098513          	mv	a0,s3
    80006b34:	ffffa097          	auipc	ra,0xffffa
    80006b38:	6b0080e7          	jalr	1712(ra) # 800011e4 <_ZdlPv>
    80006b3c:	00048513          	mv	a0,s1
    80006b40:	00008097          	auipc	ra,0x8
    80006b44:	628080e7          	jalr	1576(ra) # 8000f168 <_Unwind_Resume>
    80006b48:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006b4c:	00090513          	mv	a0,s2
    80006b50:	ffffa097          	auipc	ra,0xffffa
    80006b54:	694080e7          	jalr	1684(ra) # 800011e4 <_ZdlPv>
    80006b58:	00048513          	mv	a0,s1
    80006b5c:	00008097          	auipc	ra,0x8
    80006b60:	60c080e7          	jalr	1548(ra) # 8000f168 <_Unwind_Resume>
    80006b64:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006b68:	00090513          	mv	a0,s2
    80006b6c:	ffffa097          	auipc	ra,0xffffa
    80006b70:	678080e7          	jalr	1656(ra) # 800011e4 <_ZdlPv>
    80006b74:	00048513          	mv	a0,s1
    80006b78:	00008097          	auipc	ra,0x8
    80006b7c:	5f0080e7          	jalr	1520(ra) # 8000f168 <_Unwind_Resume>

0000000080006b80 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006b80:	fe010113          	addi	sp,sp,-32
    80006b84:	00113c23          	sd	ra,24(sp)
    80006b88:	00813823          	sd	s0,16(sp)
    80006b8c:	00913423          	sd	s1,8(sp)
    80006b90:	01213023          	sd	s2,0(sp)
    80006b94:	02010413          	addi	s0,sp,32
    80006b98:	00050493          	mv	s1,a0
    80006b9c:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80006ba0:	01853503          	ld	a0,24(a0)
    80006ba4:	ffffb097          	auipc	ra,0xffffb
    80006ba8:	868080e7          	jalr	-1944(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006bac:	0304b503          	ld	a0,48(s1)
    80006bb0:	ffffb097          	auipc	ra,0xffffb
    80006bb4:	85c080e7          	jalr	-1956(ra) # 8000140c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80006bb8:	0084b783          	ld	a5,8(s1)
    80006bbc:	0144a703          	lw	a4,20(s1)
    80006bc0:	00271713          	slli	a4,a4,0x2
    80006bc4:	00e787b3          	add	a5,a5,a4
    80006bc8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006bcc:	0144a783          	lw	a5,20(s1)
    80006bd0:	0017879b          	addiw	a5,a5,1
    80006bd4:	0004a703          	lw	a4,0(s1)
    80006bd8:	02e7e7bb          	remw	a5,a5,a4
    80006bdc:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006be0:	0304b503          	ld	a0,48(s1)
    80006be4:	ffffb097          	auipc	ra,0xffffb
    80006be8:	854080e7          	jalr	-1964(ra) # 80001438 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006bec:	0204b503          	ld	a0,32(s1)
    80006bf0:	ffffb097          	auipc	ra,0xffffb
    80006bf4:	848080e7          	jalr	-1976(ra) # 80001438 <_ZN9Semaphore6signalEv>

}
    80006bf8:	01813083          	ld	ra,24(sp)
    80006bfc:	01013403          	ld	s0,16(sp)
    80006c00:	00813483          	ld	s1,8(sp)
    80006c04:	00013903          	ld	s2,0(sp)
    80006c08:	02010113          	addi	sp,sp,32
    80006c0c:	00008067          	ret

0000000080006c10 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006c10:	fe010113          	addi	sp,sp,-32
    80006c14:	00113c23          	sd	ra,24(sp)
    80006c18:	00813823          	sd	s0,16(sp)
    80006c1c:	00913423          	sd	s1,8(sp)
    80006c20:	01213023          	sd	s2,0(sp)
    80006c24:	02010413          	addi	s0,sp,32
    80006c28:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006c2c:	02053503          	ld	a0,32(a0)
    80006c30:	ffffa097          	auipc	ra,0xffffa
    80006c34:	7dc080e7          	jalr	2012(ra) # 8000140c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006c38:	0284b503          	ld	a0,40(s1)
    80006c3c:	ffffa097          	auipc	ra,0xffffa
    80006c40:	7d0080e7          	jalr	2000(ra) # 8000140c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006c44:	0084b703          	ld	a4,8(s1)
    80006c48:	0104a783          	lw	a5,16(s1)
    80006c4c:	00279693          	slli	a3,a5,0x2
    80006c50:	00d70733          	add	a4,a4,a3
    80006c54:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006c58:	0017879b          	addiw	a5,a5,1
    80006c5c:	0004a703          	lw	a4,0(s1)
    80006c60:	02e7e7bb          	remw	a5,a5,a4
    80006c64:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006c68:	0284b503          	ld	a0,40(s1)
    80006c6c:	ffffa097          	auipc	ra,0xffffa
    80006c70:	7cc080e7          	jalr	1996(ra) # 80001438 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006c74:	0184b503          	ld	a0,24(s1)
    80006c78:	ffffa097          	auipc	ra,0xffffa
    80006c7c:	7c0080e7          	jalr	1984(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006c80:	00090513          	mv	a0,s2
    80006c84:	01813083          	ld	ra,24(sp)
    80006c88:	01013403          	ld	s0,16(sp)
    80006c8c:	00813483          	ld	s1,8(sp)
    80006c90:	00013903          	ld	s2,0(sp)
    80006c94:	02010113          	addi	sp,sp,32
    80006c98:	00008067          	ret

0000000080006c9c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006c9c:	fe010113          	addi	sp,sp,-32
    80006ca0:	00113c23          	sd	ra,24(sp)
    80006ca4:	00813823          	sd	s0,16(sp)
    80006ca8:	00913423          	sd	s1,8(sp)
    80006cac:	01213023          	sd	s2,0(sp)
    80006cb0:	02010413          	addi	s0,sp,32
    80006cb4:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006cb8:	02853503          	ld	a0,40(a0)
    80006cbc:	ffffa097          	auipc	ra,0xffffa
    80006cc0:	750080e7          	jalr	1872(ra) # 8000140c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006cc4:	0304b503          	ld	a0,48(s1)
    80006cc8:	ffffa097          	auipc	ra,0xffffa
    80006ccc:	744080e7          	jalr	1860(ra) # 8000140c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006cd0:	0144a783          	lw	a5,20(s1)
    80006cd4:	0104a903          	lw	s2,16(s1)
    80006cd8:	0327ce63          	blt	a5,s2,80006d14 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006cdc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006ce0:	0304b503          	ld	a0,48(s1)
    80006ce4:	ffffa097          	auipc	ra,0xffffa
    80006ce8:	754080e7          	jalr	1876(ra) # 80001438 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006cec:	0284b503          	ld	a0,40(s1)
    80006cf0:	ffffa097          	auipc	ra,0xffffa
    80006cf4:	748080e7          	jalr	1864(ra) # 80001438 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006cf8:	00090513          	mv	a0,s2
    80006cfc:	01813083          	ld	ra,24(sp)
    80006d00:	01013403          	ld	s0,16(sp)
    80006d04:	00813483          	ld	s1,8(sp)
    80006d08:	00013903          	ld	s2,0(sp)
    80006d0c:	02010113          	addi	sp,sp,32
    80006d10:	00008067          	ret
        ret = cap - head + tail;
    80006d14:	0004a703          	lw	a4,0(s1)
    80006d18:	4127093b          	subw	s2,a4,s2
    80006d1c:	00f9093b          	addw	s2,s2,a5
    80006d20:	fc1ff06f          	j	80006ce0 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006d24 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006d24:	fe010113          	addi	sp,sp,-32
    80006d28:	00113c23          	sd	ra,24(sp)
    80006d2c:	00813823          	sd	s0,16(sp)
    80006d30:	00913423          	sd	s1,8(sp)
    80006d34:	02010413          	addi	s0,sp,32
    80006d38:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006d3c:	00a00513          	li	a0,10
    80006d40:	ffffa097          	auipc	ra,0xffffa
    80006d44:	794080e7          	jalr	1940(ra) # 800014d4 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006d48:	00004517          	auipc	a0,0x4
    80006d4c:	6e050513          	addi	a0,a0,1760 # 8000b428 <CONSOLE_STATUS+0x418>
    80006d50:	00001097          	auipc	ra,0x1
    80006d54:	bf0080e7          	jalr	-1040(ra) # 80007940 <_Z11printStringPKc>
    while (getCnt()) {
    80006d58:	00048513          	mv	a0,s1
    80006d5c:	00000097          	auipc	ra,0x0
    80006d60:	f40080e7          	jalr	-192(ra) # 80006c9c <_ZN9BufferCPP6getCntEv>
    80006d64:	02050c63          	beqz	a0,80006d9c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006d68:	0084b783          	ld	a5,8(s1)
    80006d6c:	0104a703          	lw	a4,16(s1)
    80006d70:	00271713          	slli	a4,a4,0x2
    80006d74:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006d78:	0007c503          	lbu	a0,0(a5)
    80006d7c:	ffffa097          	auipc	ra,0xffffa
    80006d80:	758080e7          	jalr	1880(ra) # 800014d4 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006d84:	0104a783          	lw	a5,16(s1)
    80006d88:	0017879b          	addiw	a5,a5,1
    80006d8c:	0004a703          	lw	a4,0(s1)
    80006d90:	02e7e7bb          	remw	a5,a5,a4
    80006d94:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006d98:	fc1ff06f          	j	80006d58 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006d9c:	02100513          	li	a0,33
    80006da0:	ffffa097          	auipc	ra,0xffffa
    80006da4:	734080e7          	jalr	1844(ra) # 800014d4 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006da8:	00a00513          	li	a0,10
    80006dac:	ffffa097          	auipc	ra,0xffffa
    80006db0:	728080e7          	jalr	1832(ra) # 800014d4 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006db4:	0084b503          	ld	a0,8(s1)
    80006db8:	ffffb097          	auipc	ra,0xffffb
    80006dbc:	af8080e7          	jalr	-1288(ra) # 800018b0 <_Z8mem_freePv>
    delete itemAvailable;
    80006dc0:	0204b503          	ld	a0,32(s1)
    80006dc4:	00050863          	beqz	a0,80006dd4 <_ZN9BufferCPPD1Ev+0xb0>
    80006dc8:	00053783          	ld	a5,0(a0)
    80006dcc:	0087b783          	ld	a5,8(a5)
    80006dd0:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006dd4:	0184b503          	ld	a0,24(s1)
    80006dd8:	00050863          	beqz	a0,80006de8 <_ZN9BufferCPPD1Ev+0xc4>
    80006ddc:	00053783          	ld	a5,0(a0)
    80006de0:	0087b783          	ld	a5,8(a5)
    80006de4:	000780e7          	jalr	a5
    delete mutexTail;
    80006de8:	0304b503          	ld	a0,48(s1)
    80006dec:	00050863          	beqz	a0,80006dfc <_ZN9BufferCPPD1Ev+0xd8>
    80006df0:	00053783          	ld	a5,0(a0)
    80006df4:	0087b783          	ld	a5,8(a5)
    80006df8:	000780e7          	jalr	a5
    delete mutexHead;
    80006dfc:	0284b503          	ld	a0,40(s1)
    80006e00:	00050863          	beqz	a0,80006e10 <_ZN9BufferCPPD1Ev+0xec>
    80006e04:	00053783          	ld	a5,0(a0)
    80006e08:	0087b783          	ld	a5,8(a5)
    80006e0c:	000780e7          	jalr	a5
}
    80006e10:	01813083          	ld	ra,24(sp)
    80006e14:	01013403          	ld	s0,16(sp)
    80006e18:	00813483          	ld	s1,8(sp)
    80006e1c:	02010113          	addi	sp,sp,32
    80006e20:	00008067          	ret

0000000080006e24 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006e24:	fe010113          	addi	sp,sp,-32
    80006e28:	00113c23          	sd	ra,24(sp)
    80006e2c:	00813823          	sd	s0,16(sp)
    80006e30:	00913423          	sd	s1,8(sp)
    80006e34:	01213023          	sd	s2,0(sp)
    80006e38:	02010413          	addi	s0,sp,32
    80006e3c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006e40:	00100793          	li	a5,1
    80006e44:	02a7f863          	bgeu	a5,a0,80006e74 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006e48:	00a00793          	li	a5,10
    80006e4c:	02f577b3          	remu	a5,a0,a5
    80006e50:	02078e63          	beqz	a5,80006e8c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006e54:	fff48513          	addi	a0,s1,-1
    80006e58:	00000097          	auipc	ra,0x0
    80006e5c:	fcc080e7          	jalr	-52(ra) # 80006e24 <_ZL9fibonaccim>
    80006e60:	00050913          	mv	s2,a0
    80006e64:	ffe48513          	addi	a0,s1,-2
    80006e68:	00000097          	auipc	ra,0x0
    80006e6c:	fbc080e7          	jalr	-68(ra) # 80006e24 <_ZL9fibonaccim>
    80006e70:	00a90533          	add	a0,s2,a0
}
    80006e74:	01813083          	ld	ra,24(sp)
    80006e78:	01013403          	ld	s0,16(sp)
    80006e7c:	00813483          	ld	s1,8(sp)
    80006e80:	00013903          	ld	s2,0(sp)
    80006e84:	02010113          	addi	sp,sp,32
    80006e88:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006e8c:	ffffb097          	auipc	ra,0xffffb
    80006e90:	aec080e7          	jalr	-1300(ra) # 80001978 <_Z15thread_dispatchv>
    80006e94:	fc1ff06f          	j	80006e54 <_ZL9fibonaccim+0x30>

0000000080006e98 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80006e98:	fe010113          	addi	sp,sp,-32
    80006e9c:	00113c23          	sd	ra,24(sp)
    80006ea0:	00813823          	sd	s0,16(sp)
    80006ea4:	00913423          	sd	s1,8(sp)
    80006ea8:	01213023          	sd	s2,0(sp)
    80006eac:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006eb0:	00000913          	li	s2,0
    80006eb4:	0380006f          	j	80006eec <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80006eb8:	ffffb097          	auipc	ra,0xffffb
    80006ebc:	ac0080e7          	jalr	-1344(ra) # 80001978 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006ec0:	00148493          	addi	s1,s1,1
    80006ec4:	000027b7          	lui	a5,0x2
    80006ec8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006ecc:	0097ee63          	bltu	a5,s1,80006ee8 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006ed0:	00000713          	li	a4,0
    80006ed4:	000077b7          	lui	a5,0x7
    80006ed8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006edc:	fce7eee3          	bltu	a5,a4,80006eb8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80006ee0:	00170713          	addi	a4,a4,1
    80006ee4:	ff1ff06f          	j	80006ed4 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006ee8:	00190913          	addi	s2,s2,1
    80006eec:	00900793          	li	a5,9
    80006ef0:	0527e063          	bltu	a5,s2,80006f30 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006ef4:	00004517          	auipc	a0,0x4
    80006ef8:	6c450513          	addi	a0,a0,1732 # 8000b5b8 <CONSOLE_STATUS+0x5a8>
    80006efc:	00001097          	auipc	ra,0x1
    80006f00:	a44080e7          	jalr	-1468(ra) # 80007940 <_Z11printStringPKc>
    80006f04:	00000613          	li	a2,0
    80006f08:	00a00593          	li	a1,10
    80006f0c:	0009051b          	sext.w	a0,s2
    80006f10:	00001097          	auipc	ra,0x1
    80006f14:	be0080e7          	jalr	-1056(ra) # 80007af0 <_Z8printIntiii>
    80006f18:	00005517          	auipc	a0,0x5
    80006f1c:	8d850513          	addi	a0,a0,-1832 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006f20:	00001097          	auipc	ra,0x1
    80006f24:	a20080e7          	jalr	-1504(ra) # 80007940 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006f28:	00000493          	li	s1,0
    80006f2c:	f99ff06f          	j	80006ec4 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80006f30:	00004517          	auipc	a0,0x4
    80006f34:	69050513          	addi	a0,a0,1680 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80006f38:	00001097          	auipc	ra,0x1
    80006f3c:	a08080e7          	jalr	-1528(ra) # 80007940 <_Z11printStringPKc>
    finishedA = true;
    80006f40:	00100793          	li	a5,1
    80006f44:	00007717          	auipc	a4,0x7
    80006f48:	12f70f23          	sb	a5,318(a4) # 8000e082 <_ZL9finishedA>
}
    80006f4c:	01813083          	ld	ra,24(sp)
    80006f50:	01013403          	ld	s0,16(sp)
    80006f54:	00813483          	ld	s1,8(sp)
    80006f58:	00013903          	ld	s2,0(sp)
    80006f5c:	02010113          	addi	sp,sp,32
    80006f60:	00008067          	ret

0000000080006f64 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80006f64:	fe010113          	addi	sp,sp,-32
    80006f68:	00113c23          	sd	ra,24(sp)
    80006f6c:	00813823          	sd	s0,16(sp)
    80006f70:	00913423          	sd	s1,8(sp)
    80006f74:	01213023          	sd	s2,0(sp)
    80006f78:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006f7c:	00000913          	li	s2,0
    80006f80:	0380006f          	j	80006fb8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80006f84:	ffffb097          	auipc	ra,0xffffb
    80006f88:	9f4080e7          	jalr	-1548(ra) # 80001978 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006f8c:	00148493          	addi	s1,s1,1
    80006f90:	000027b7          	lui	a5,0x2
    80006f94:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006f98:	0097ee63          	bltu	a5,s1,80006fb4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006f9c:	00000713          	li	a4,0
    80006fa0:	000077b7          	lui	a5,0x7
    80006fa4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006fa8:	fce7eee3          	bltu	a5,a4,80006f84 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80006fac:	00170713          	addi	a4,a4,1
    80006fb0:	ff1ff06f          	j	80006fa0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80006fb4:	00190913          	addi	s2,s2,1
    80006fb8:	00f00793          	li	a5,15
    80006fbc:	0527e063          	bltu	a5,s2,80006ffc <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80006fc0:	00004517          	auipc	a0,0x4
    80006fc4:	5e050513          	addi	a0,a0,1504 # 8000b5a0 <CONSOLE_STATUS+0x590>
    80006fc8:	00001097          	auipc	ra,0x1
    80006fcc:	978080e7          	jalr	-1672(ra) # 80007940 <_Z11printStringPKc>
    80006fd0:	00000613          	li	a2,0
    80006fd4:	00a00593          	li	a1,10
    80006fd8:	0009051b          	sext.w	a0,s2
    80006fdc:	00001097          	auipc	ra,0x1
    80006fe0:	b14080e7          	jalr	-1260(ra) # 80007af0 <_Z8printIntiii>
    80006fe4:	00005517          	auipc	a0,0x5
    80006fe8:	80c50513          	addi	a0,a0,-2036 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80006fec:	00001097          	auipc	ra,0x1
    80006ff0:	954080e7          	jalr	-1708(ra) # 80007940 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006ff4:	00000493          	li	s1,0
    80006ff8:	f99ff06f          	j	80006f90 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80006ffc:	00004517          	auipc	a0,0x4
    80007000:	5ac50513          	addi	a0,a0,1452 # 8000b5a8 <CONSOLE_STATUS+0x598>
    80007004:	00001097          	auipc	ra,0x1
    80007008:	93c080e7          	jalr	-1732(ra) # 80007940 <_Z11printStringPKc>
    finishedB = true;
    8000700c:	00100793          	li	a5,1
    80007010:	00007717          	auipc	a4,0x7
    80007014:	06f709a3          	sb	a5,115(a4) # 8000e083 <_ZL9finishedB>
    thread_dispatch();
    80007018:	ffffb097          	auipc	ra,0xffffb
    8000701c:	960080e7          	jalr	-1696(ra) # 80001978 <_Z15thread_dispatchv>
}
    80007020:	01813083          	ld	ra,24(sp)
    80007024:	01013403          	ld	s0,16(sp)
    80007028:	00813483          	ld	s1,8(sp)
    8000702c:	00013903          	ld	s2,0(sp)
    80007030:	02010113          	addi	sp,sp,32
    80007034:	00008067          	ret

0000000080007038 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80007038:	fe010113          	addi	sp,sp,-32
    8000703c:	00113c23          	sd	ra,24(sp)
    80007040:	00813823          	sd	s0,16(sp)
    80007044:	00913423          	sd	s1,8(sp)
    80007048:	01213023          	sd	s2,0(sp)
    8000704c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80007050:	00000493          	li	s1,0
    80007054:	0400006f          	j	80007094 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80007058:	00004517          	auipc	a0,0x4
    8000705c:	50850513          	addi	a0,a0,1288 # 8000b560 <CONSOLE_STATUS+0x550>
    80007060:	00001097          	auipc	ra,0x1
    80007064:	8e0080e7          	jalr	-1824(ra) # 80007940 <_Z11printStringPKc>
    80007068:	00000613          	li	a2,0
    8000706c:	00a00593          	li	a1,10
    80007070:	00048513          	mv	a0,s1
    80007074:	00001097          	auipc	ra,0x1
    80007078:	a7c080e7          	jalr	-1412(ra) # 80007af0 <_Z8printIntiii>
    8000707c:	00004517          	auipc	a0,0x4
    80007080:	77450513          	addi	a0,a0,1908 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80007084:	00001097          	auipc	ra,0x1
    80007088:	8bc080e7          	jalr	-1860(ra) # 80007940 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000708c:	0014849b          	addiw	s1,s1,1
    80007090:	0ff4f493          	andi	s1,s1,255
    80007094:	00200793          	li	a5,2
    80007098:	fc97f0e3          	bgeu	a5,s1,80007058 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    8000709c:	00004517          	auipc	a0,0x4
    800070a0:	4cc50513          	addi	a0,a0,1228 # 8000b568 <CONSOLE_STATUS+0x558>
    800070a4:	00001097          	auipc	ra,0x1
    800070a8:	89c080e7          	jalr	-1892(ra) # 80007940 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800070ac:	00700313          	li	t1,7
    thread_dispatch();
    800070b0:	ffffb097          	auipc	ra,0xffffb
    800070b4:	8c8080e7          	jalr	-1848(ra) # 80001978 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800070b8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800070bc:	00004517          	auipc	a0,0x4
    800070c0:	4bc50513          	addi	a0,a0,1212 # 8000b578 <CONSOLE_STATUS+0x568>
    800070c4:	00001097          	auipc	ra,0x1
    800070c8:	87c080e7          	jalr	-1924(ra) # 80007940 <_Z11printStringPKc>
    800070cc:	00000613          	li	a2,0
    800070d0:	00a00593          	li	a1,10
    800070d4:	0009051b          	sext.w	a0,s2
    800070d8:	00001097          	auipc	ra,0x1
    800070dc:	a18080e7          	jalr	-1512(ra) # 80007af0 <_Z8printIntiii>
    800070e0:	00004517          	auipc	a0,0x4
    800070e4:	71050513          	addi	a0,a0,1808 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    800070e8:	00001097          	auipc	ra,0x1
    800070ec:	858080e7          	jalr	-1960(ra) # 80007940 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800070f0:	00c00513          	li	a0,12
    800070f4:	00000097          	auipc	ra,0x0
    800070f8:	d30080e7          	jalr	-720(ra) # 80006e24 <_ZL9fibonaccim>
    800070fc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80007100:	00004517          	auipc	a0,0x4
    80007104:	48050513          	addi	a0,a0,1152 # 8000b580 <CONSOLE_STATUS+0x570>
    80007108:	00001097          	auipc	ra,0x1
    8000710c:	838080e7          	jalr	-1992(ra) # 80007940 <_Z11printStringPKc>
    80007110:	00000613          	li	a2,0
    80007114:	00a00593          	li	a1,10
    80007118:	0009051b          	sext.w	a0,s2
    8000711c:	00001097          	auipc	ra,0x1
    80007120:	9d4080e7          	jalr	-1580(ra) # 80007af0 <_Z8printIntiii>
    80007124:	00004517          	auipc	a0,0x4
    80007128:	6cc50513          	addi	a0,a0,1740 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    8000712c:	00001097          	auipc	ra,0x1
    80007130:	814080e7          	jalr	-2028(ra) # 80007940 <_Z11printStringPKc>
    80007134:	0400006f          	j	80007174 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80007138:	00004517          	auipc	a0,0x4
    8000713c:	42850513          	addi	a0,a0,1064 # 8000b560 <CONSOLE_STATUS+0x550>
    80007140:	00001097          	auipc	ra,0x1
    80007144:	800080e7          	jalr	-2048(ra) # 80007940 <_Z11printStringPKc>
    80007148:	00000613          	li	a2,0
    8000714c:	00a00593          	li	a1,10
    80007150:	00048513          	mv	a0,s1
    80007154:	00001097          	auipc	ra,0x1
    80007158:	99c080e7          	jalr	-1636(ra) # 80007af0 <_Z8printIntiii>
    8000715c:	00004517          	auipc	a0,0x4
    80007160:	69450513          	addi	a0,a0,1684 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80007164:	00000097          	auipc	ra,0x0
    80007168:	7dc080e7          	jalr	2012(ra) # 80007940 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000716c:	0014849b          	addiw	s1,s1,1
    80007170:	0ff4f493          	andi	s1,s1,255
    80007174:	00500793          	li	a5,5
    80007178:	fc97f0e3          	bgeu	a5,s1,80007138 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    8000717c:	00004517          	auipc	a0,0x4
    80007180:	44450513          	addi	a0,a0,1092 # 8000b5c0 <CONSOLE_STATUS+0x5b0>
    80007184:	00000097          	auipc	ra,0x0
    80007188:	7bc080e7          	jalr	1980(ra) # 80007940 <_Z11printStringPKc>
    finishedC = true;
    8000718c:	00100793          	li	a5,1
    80007190:	00007717          	auipc	a4,0x7
    80007194:	eef70a23          	sb	a5,-268(a4) # 8000e084 <_ZL9finishedC>
    thread_dispatch();
    80007198:	ffffa097          	auipc	ra,0xffffa
    8000719c:	7e0080e7          	jalr	2016(ra) # 80001978 <_Z15thread_dispatchv>
}
    800071a0:	01813083          	ld	ra,24(sp)
    800071a4:	01013403          	ld	s0,16(sp)
    800071a8:	00813483          	ld	s1,8(sp)
    800071ac:	00013903          	ld	s2,0(sp)
    800071b0:	02010113          	addi	sp,sp,32
    800071b4:	00008067          	ret

00000000800071b8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800071b8:	fe010113          	addi	sp,sp,-32
    800071bc:	00113c23          	sd	ra,24(sp)
    800071c0:	00813823          	sd	s0,16(sp)
    800071c4:	00913423          	sd	s1,8(sp)
    800071c8:	01213023          	sd	s2,0(sp)
    800071cc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800071d0:	00a00493          	li	s1,10
    800071d4:	0400006f          	j	80007214 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800071d8:	00004517          	auipc	a0,0x4
    800071dc:	35050513          	addi	a0,a0,848 # 8000b528 <CONSOLE_STATUS+0x518>
    800071e0:	00000097          	auipc	ra,0x0
    800071e4:	760080e7          	jalr	1888(ra) # 80007940 <_Z11printStringPKc>
    800071e8:	00000613          	li	a2,0
    800071ec:	00a00593          	li	a1,10
    800071f0:	00048513          	mv	a0,s1
    800071f4:	00001097          	auipc	ra,0x1
    800071f8:	8fc080e7          	jalr	-1796(ra) # 80007af0 <_Z8printIntiii>
    800071fc:	00004517          	auipc	a0,0x4
    80007200:	5f450513          	addi	a0,a0,1524 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80007204:	00000097          	auipc	ra,0x0
    80007208:	73c080e7          	jalr	1852(ra) # 80007940 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000720c:	0014849b          	addiw	s1,s1,1
    80007210:	0ff4f493          	andi	s1,s1,255
    80007214:	00c00793          	li	a5,12
    80007218:	fc97f0e3          	bgeu	a5,s1,800071d8 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    8000721c:	00004517          	auipc	a0,0x4
    80007220:	31450513          	addi	a0,a0,788 # 8000b530 <CONSOLE_STATUS+0x520>
    80007224:	00000097          	auipc	ra,0x0
    80007228:	71c080e7          	jalr	1820(ra) # 80007940 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000722c:	00500313          	li	t1,5
    thread_dispatch();
    80007230:	ffffa097          	auipc	ra,0xffffa
    80007234:	748080e7          	jalr	1864(ra) # 80001978 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80007238:	01000513          	li	a0,16
    8000723c:	00000097          	auipc	ra,0x0
    80007240:	be8080e7          	jalr	-1048(ra) # 80006e24 <_ZL9fibonaccim>
    80007244:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80007248:	00004517          	auipc	a0,0x4
    8000724c:	2f850513          	addi	a0,a0,760 # 8000b540 <CONSOLE_STATUS+0x530>
    80007250:	00000097          	auipc	ra,0x0
    80007254:	6f0080e7          	jalr	1776(ra) # 80007940 <_Z11printStringPKc>
    80007258:	00000613          	li	a2,0
    8000725c:	00a00593          	li	a1,10
    80007260:	0009051b          	sext.w	a0,s2
    80007264:	00001097          	auipc	ra,0x1
    80007268:	88c080e7          	jalr	-1908(ra) # 80007af0 <_Z8printIntiii>
    8000726c:	00004517          	auipc	a0,0x4
    80007270:	58450513          	addi	a0,a0,1412 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80007274:	00000097          	auipc	ra,0x0
    80007278:	6cc080e7          	jalr	1740(ra) # 80007940 <_Z11printStringPKc>
    8000727c:	0400006f          	j	800072bc <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80007280:	00004517          	auipc	a0,0x4
    80007284:	2a850513          	addi	a0,a0,680 # 8000b528 <CONSOLE_STATUS+0x518>
    80007288:	00000097          	auipc	ra,0x0
    8000728c:	6b8080e7          	jalr	1720(ra) # 80007940 <_Z11printStringPKc>
    80007290:	00000613          	li	a2,0
    80007294:	00a00593          	li	a1,10
    80007298:	00048513          	mv	a0,s1
    8000729c:	00001097          	auipc	ra,0x1
    800072a0:	854080e7          	jalr	-1964(ra) # 80007af0 <_Z8printIntiii>
    800072a4:	00004517          	auipc	a0,0x4
    800072a8:	54c50513          	addi	a0,a0,1356 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    800072ac:	00000097          	auipc	ra,0x0
    800072b0:	694080e7          	jalr	1684(ra) # 80007940 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800072b4:	0014849b          	addiw	s1,s1,1
    800072b8:	0ff4f493          	andi	s1,s1,255
    800072bc:	00f00793          	li	a5,15
    800072c0:	fc97f0e3          	bgeu	a5,s1,80007280 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800072c4:	00004517          	auipc	a0,0x4
    800072c8:	28c50513          	addi	a0,a0,652 # 8000b550 <CONSOLE_STATUS+0x540>
    800072cc:	00000097          	auipc	ra,0x0
    800072d0:	674080e7          	jalr	1652(ra) # 80007940 <_Z11printStringPKc>
    finishedD = true;
    800072d4:	00100793          	li	a5,1
    800072d8:	00007717          	auipc	a4,0x7
    800072dc:	daf706a3          	sb	a5,-595(a4) # 8000e085 <_ZL9finishedD>
    thread_dispatch();
    800072e0:	ffffa097          	auipc	ra,0xffffa
    800072e4:	698080e7          	jalr	1688(ra) # 80001978 <_Z15thread_dispatchv>
}
    800072e8:	01813083          	ld	ra,24(sp)
    800072ec:	01013403          	ld	s0,16(sp)
    800072f0:	00813483          	ld	s1,8(sp)
    800072f4:	00013903          	ld	s2,0(sp)
    800072f8:	02010113          	addi	sp,sp,32
    800072fc:	00008067          	ret

0000000080007300 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80007300:	fc010113          	addi	sp,sp,-64
    80007304:	02113c23          	sd	ra,56(sp)
    80007308:	02813823          	sd	s0,48(sp)
    8000730c:	02913423          	sd	s1,40(sp)
    80007310:	03213023          	sd	s2,32(sp)
    80007314:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80007318:	02000513          	li	a0,32
    8000731c:	ffffa097          	auipc	ra,0xffffa
    80007320:	ea0080e7          	jalr	-352(ra) # 800011bc <_Znwm>
    80007324:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80007328:	ffffa097          	auipc	ra,0xffffa
    8000732c:	078080e7          	jalr	120(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007330:	00007797          	auipc	a5,0x7
    80007334:	b2878793          	addi	a5,a5,-1240 # 8000de58 <_ZTV7WorkerA+0x10>
    80007338:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000733c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80007340:	00004517          	auipc	a0,0x4
    80007344:	29050513          	addi	a0,a0,656 # 8000b5d0 <CONSOLE_STATUS+0x5c0>
    80007348:	00000097          	auipc	ra,0x0
    8000734c:	5f8080e7          	jalr	1528(ra) # 80007940 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80007350:	02000513          	li	a0,32
    80007354:	ffffa097          	auipc	ra,0xffffa
    80007358:	e68080e7          	jalr	-408(ra) # 800011bc <_Znwm>
    8000735c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80007360:	ffffa097          	auipc	ra,0xffffa
    80007364:	040080e7          	jalr	64(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80007368:	00007797          	auipc	a5,0x7
    8000736c:	b1878793          	addi	a5,a5,-1256 # 8000de80 <_ZTV7WorkerB+0x10>
    80007370:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80007374:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80007378:	00004517          	auipc	a0,0x4
    8000737c:	27050513          	addi	a0,a0,624 # 8000b5e8 <CONSOLE_STATUS+0x5d8>
    80007380:	00000097          	auipc	ra,0x0
    80007384:	5c0080e7          	jalr	1472(ra) # 80007940 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80007388:	02000513          	li	a0,32
    8000738c:	ffffa097          	auipc	ra,0xffffa
    80007390:	e30080e7          	jalr	-464(ra) # 800011bc <_Znwm>
    80007394:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80007398:	ffffa097          	auipc	ra,0xffffa
    8000739c:	008080e7          	jalr	8(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800073a0:	00007797          	auipc	a5,0x7
    800073a4:	b0878793          	addi	a5,a5,-1272 # 8000dea8 <_ZTV7WorkerC+0x10>
    800073a8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800073ac:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800073b0:	00004517          	auipc	a0,0x4
    800073b4:	25050513          	addi	a0,a0,592 # 8000b600 <CONSOLE_STATUS+0x5f0>
    800073b8:	00000097          	auipc	ra,0x0
    800073bc:	588080e7          	jalr	1416(ra) # 80007940 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800073c0:	02000513          	li	a0,32
    800073c4:	ffffa097          	auipc	ra,0xffffa
    800073c8:	df8080e7          	jalr	-520(ra) # 800011bc <_Znwm>
    800073cc:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800073d0:	ffffa097          	auipc	ra,0xffffa
    800073d4:	fd0080e7          	jalr	-48(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800073d8:	00007797          	auipc	a5,0x7
    800073dc:	af878793          	addi	a5,a5,-1288 # 8000ded0 <_ZTV7WorkerD+0x10>
    800073e0:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800073e4:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800073e8:	00004517          	auipc	a0,0x4
    800073ec:	23050513          	addi	a0,a0,560 # 8000b618 <CONSOLE_STATUS+0x608>
    800073f0:	00000097          	auipc	ra,0x0
    800073f4:	550080e7          	jalr	1360(ra) # 80007940 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800073f8:	00000493          	li	s1,0
    800073fc:	00300793          	li	a5,3
    80007400:	0297c663          	blt	a5,s1,8000742c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80007404:	00349793          	slli	a5,s1,0x3
    80007408:	fe040713          	addi	a4,s0,-32
    8000740c:	00f707b3          	add	a5,a4,a5
    80007410:	fe07b503          	ld	a0,-32(a5)
    80007414:	ffffa097          	auipc	ra,0xffffa
    80007418:	ea4080e7          	jalr	-348(ra) # 800012b8 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000741c:	0014849b          	addiw	s1,s1,1
    80007420:	fddff06f          	j	800073fc <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80007424:	ffffa097          	auipc	ra,0xffffa
    80007428:	ef4080e7          	jalr	-268(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000742c:	00007797          	auipc	a5,0x7
    80007430:	c567c783          	lbu	a5,-938(a5) # 8000e082 <_ZL9finishedA>
    80007434:	fe0788e3          	beqz	a5,80007424 <_Z20Threads_CPP_API_testv+0x124>
    80007438:	00007797          	auipc	a5,0x7
    8000743c:	c4b7c783          	lbu	a5,-949(a5) # 8000e083 <_ZL9finishedB>
    80007440:	fe0782e3          	beqz	a5,80007424 <_Z20Threads_CPP_API_testv+0x124>
    80007444:	00007797          	auipc	a5,0x7
    80007448:	c407c783          	lbu	a5,-960(a5) # 8000e084 <_ZL9finishedC>
    8000744c:	fc078ce3          	beqz	a5,80007424 <_Z20Threads_CPP_API_testv+0x124>
    80007450:	00007797          	auipc	a5,0x7
    80007454:	c357c783          	lbu	a5,-971(a5) # 8000e085 <_ZL9finishedD>
    80007458:	fc0786e3          	beqz	a5,80007424 <_Z20Threads_CPP_API_testv+0x124>
    8000745c:	fc040493          	addi	s1,s0,-64
    80007460:	0080006f          	j	80007468 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80007464:	00848493          	addi	s1,s1,8
    80007468:	fe040793          	addi	a5,s0,-32
    8000746c:	08f48663          	beq	s1,a5,800074f8 <_Z20Threads_CPP_API_testv+0x1f8>
    80007470:	0004b503          	ld	a0,0(s1)
    80007474:	fe0508e3          	beqz	a0,80007464 <_Z20Threads_CPP_API_testv+0x164>
    80007478:	00053783          	ld	a5,0(a0)
    8000747c:	0087b783          	ld	a5,8(a5)
    80007480:	000780e7          	jalr	a5
    80007484:	fe1ff06f          	j	80007464 <_Z20Threads_CPP_API_testv+0x164>
    80007488:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    8000748c:	00048513          	mv	a0,s1
    80007490:	ffffa097          	auipc	ra,0xffffa
    80007494:	d54080e7          	jalr	-684(ra) # 800011e4 <_ZdlPv>
    80007498:	00090513          	mv	a0,s2
    8000749c:	00008097          	auipc	ra,0x8
    800074a0:	ccc080e7          	jalr	-820(ra) # 8000f168 <_Unwind_Resume>
    800074a4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800074a8:	00048513          	mv	a0,s1
    800074ac:	ffffa097          	auipc	ra,0xffffa
    800074b0:	d38080e7          	jalr	-712(ra) # 800011e4 <_ZdlPv>
    800074b4:	00090513          	mv	a0,s2
    800074b8:	00008097          	auipc	ra,0x8
    800074bc:	cb0080e7          	jalr	-848(ra) # 8000f168 <_Unwind_Resume>
    800074c0:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800074c4:	00048513          	mv	a0,s1
    800074c8:	ffffa097          	auipc	ra,0xffffa
    800074cc:	d1c080e7          	jalr	-740(ra) # 800011e4 <_ZdlPv>
    800074d0:	00090513          	mv	a0,s2
    800074d4:	00008097          	auipc	ra,0x8
    800074d8:	c94080e7          	jalr	-876(ra) # 8000f168 <_Unwind_Resume>
    800074dc:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800074e0:	00048513          	mv	a0,s1
    800074e4:	ffffa097          	auipc	ra,0xffffa
    800074e8:	d00080e7          	jalr	-768(ra) # 800011e4 <_ZdlPv>
    800074ec:	00090513          	mv	a0,s2
    800074f0:	00008097          	auipc	ra,0x8
    800074f4:	c78080e7          	jalr	-904(ra) # 8000f168 <_Unwind_Resume>
}
    800074f8:	03813083          	ld	ra,56(sp)
    800074fc:	03013403          	ld	s0,48(sp)
    80007500:	02813483          	ld	s1,40(sp)
    80007504:	02013903          	ld	s2,32(sp)
    80007508:	04010113          	addi	sp,sp,64
    8000750c:	00008067          	ret

0000000080007510 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80007510:	ff010113          	addi	sp,sp,-16
    80007514:	00113423          	sd	ra,8(sp)
    80007518:	00813023          	sd	s0,0(sp)
    8000751c:	01010413          	addi	s0,sp,16
    80007520:	00007797          	auipc	a5,0x7
    80007524:	93878793          	addi	a5,a5,-1736 # 8000de58 <_ZTV7WorkerA+0x10>
    80007528:	00f53023          	sd	a5,0(a0)
    8000752c:	ffffa097          	auipc	ra,0xffffa
    80007530:	c20080e7          	jalr	-992(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007534:	00813083          	ld	ra,8(sp)
    80007538:	00013403          	ld	s0,0(sp)
    8000753c:	01010113          	addi	sp,sp,16
    80007540:	00008067          	ret

0000000080007544 <_ZN7WorkerAD0Ev>:
    80007544:	fe010113          	addi	sp,sp,-32
    80007548:	00113c23          	sd	ra,24(sp)
    8000754c:	00813823          	sd	s0,16(sp)
    80007550:	00913423          	sd	s1,8(sp)
    80007554:	02010413          	addi	s0,sp,32
    80007558:	00050493          	mv	s1,a0
    8000755c:	00007797          	auipc	a5,0x7
    80007560:	8fc78793          	addi	a5,a5,-1796 # 8000de58 <_ZTV7WorkerA+0x10>
    80007564:	00f53023          	sd	a5,0(a0)
    80007568:	ffffa097          	auipc	ra,0xffffa
    8000756c:	be4080e7          	jalr	-1052(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007570:	00048513          	mv	a0,s1
    80007574:	ffffa097          	auipc	ra,0xffffa
    80007578:	c70080e7          	jalr	-912(ra) # 800011e4 <_ZdlPv>
    8000757c:	01813083          	ld	ra,24(sp)
    80007580:	01013403          	ld	s0,16(sp)
    80007584:	00813483          	ld	s1,8(sp)
    80007588:	02010113          	addi	sp,sp,32
    8000758c:	00008067          	ret

0000000080007590 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80007590:	ff010113          	addi	sp,sp,-16
    80007594:	00113423          	sd	ra,8(sp)
    80007598:	00813023          	sd	s0,0(sp)
    8000759c:	01010413          	addi	s0,sp,16
    800075a0:	00007797          	auipc	a5,0x7
    800075a4:	8e078793          	addi	a5,a5,-1824 # 8000de80 <_ZTV7WorkerB+0x10>
    800075a8:	00f53023          	sd	a5,0(a0)
    800075ac:	ffffa097          	auipc	ra,0xffffa
    800075b0:	ba0080e7          	jalr	-1120(ra) # 8000114c <_ZN6ThreadD1Ev>
    800075b4:	00813083          	ld	ra,8(sp)
    800075b8:	00013403          	ld	s0,0(sp)
    800075bc:	01010113          	addi	sp,sp,16
    800075c0:	00008067          	ret

00000000800075c4 <_ZN7WorkerBD0Ev>:
    800075c4:	fe010113          	addi	sp,sp,-32
    800075c8:	00113c23          	sd	ra,24(sp)
    800075cc:	00813823          	sd	s0,16(sp)
    800075d0:	00913423          	sd	s1,8(sp)
    800075d4:	02010413          	addi	s0,sp,32
    800075d8:	00050493          	mv	s1,a0
    800075dc:	00007797          	auipc	a5,0x7
    800075e0:	8a478793          	addi	a5,a5,-1884 # 8000de80 <_ZTV7WorkerB+0x10>
    800075e4:	00f53023          	sd	a5,0(a0)
    800075e8:	ffffa097          	auipc	ra,0xffffa
    800075ec:	b64080e7          	jalr	-1180(ra) # 8000114c <_ZN6ThreadD1Ev>
    800075f0:	00048513          	mv	a0,s1
    800075f4:	ffffa097          	auipc	ra,0xffffa
    800075f8:	bf0080e7          	jalr	-1040(ra) # 800011e4 <_ZdlPv>
    800075fc:	01813083          	ld	ra,24(sp)
    80007600:	01013403          	ld	s0,16(sp)
    80007604:	00813483          	ld	s1,8(sp)
    80007608:	02010113          	addi	sp,sp,32
    8000760c:	00008067          	ret

0000000080007610 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80007610:	ff010113          	addi	sp,sp,-16
    80007614:	00113423          	sd	ra,8(sp)
    80007618:	00813023          	sd	s0,0(sp)
    8000761c:	01010413          	addi	s0,sp,16
    80007620:	00007797          	auipc	a5,0x7
    80007624:	88878793          	addi	a5,a5,-1912 # 8000dea8 <_ZTV7WorkerC+0x10>
    80007628:	00f53023          	sd	a5,0(a0)
    8000762c:	ffffa097          	auipc	ra,0xffffa
    80007630:	b20080e7          	jalr	-1248(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007634:	00813083          	ld	ra,8(sp)
    80007638:	00013403          	ld	s0,0(sp)
    8000763c:	01010113          	addi	sp,sp,16
    80007640:	00008067          	ret

0000000080007644 <_ZN7WorkerCD0Ev>:
    80007644:	fe010113          	addi	sp,sp,-32
    80007648:	00113c23          	sd	ra,24(sp)
    8000764c:	00813823          	sd	s0,16(sp)
    80007650:	00913423          	sd	s1,8(sp)
    80007654:	02010413          	addi	s0,sp,32
    80007658:	00050493          	mv	s1,a0
    8000765c:	00007797          	auipc	a5,0x7
    80007660:	84c78793          	addi	a5,a5,-1972 # 8000dea8 <_ZTV7WorkerC+0x10>
    80007664:	00f53023          	sd	a5,0(a0)
    80007668:	ffffa097          	auipc	ra,0xffffa
    8000766c:	ae4080e7          	jalr	-1308(ra) # 8000114c <_ZN6ThreadD1Ev>
    80007670:	00048513          	mv	a0,s1
    80007674:	ffffa097          	auipc	ra,0xffffa
    80007678:	b70080e7          	jalr	-1168(ra) # 800011e4 <_ZdlPv>
    8000767c:	01813083          	ld	ra,24(sp)
    80007680:	01013403          	ld	s0,16(sp)
    80007684:	00813483          	ld	s1,8(sp)
    80007688:	02010113          	addi	sp,sp,32
    8000768c:	00008067          	ret

0000000080007690 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80007690:	ff010113          	addi	sp,sp,-16
    80007694:	00113423          	sd	ra,8(sp)
    80007698:	00813023          	sd	s0,0(sp)
    8000769c:	01010413          	addi	s0,sp,16
    800076a0:	00007797          	auipc	a5,0x7
    800076a4:	83078793          	addi	a5,a5,-2000 # 8000ded0 <_ZTV7WorkerD+0x10>
    800076a8:	00f53023          	sd	a5,0(a0)
    800076ac:	ffffa097          	auipc	ra,0xffffa
    800076b0:	aa0080e7          	jalr	-1376(ra) # 8000114c <_ZN6ThreadD1Ev>
    800076b4:	00813083          	ld	ra,8(sp)
    800076b8:	00013403          	ld	s0,0(sp)
    800076bc:	01010113          	addi	sp,sp,16
    800076c0:	00008067          	ret

00000000800076c4 <_ZN7WorkerDD0Ev>:
    800076c4:	fe010113          	addi	sp,sp,-32
    800076c8:	00113c23          	sd	ra,24(sp)
    800076cc:	00813823          	sd	s0,16(sp)
    800076d0:	00913423          	sd	s1,8(sp)
    800076d4:	02010413          	addi	s0,sp,32
    800076d8:	00050493          	mv	s1,a0
    800076dc:	00006797          	auipc	a5,0x6
    800076e0:	7f478793          	addi	a5,a5,2036 # 8000ded0 <_ZTV7WorkerD+0x10>
    800076e4:	00f53023          	sd	a5,0(a0)
    800076e8:	ffffa097          	auipc	ra,0xffffa
    800076ec:	a64080e7          	jalr	-1436(ra) # 8000114c <_ZN6ThreadD1Ev>
    800076f0:	00048513          	mv	a0,s1
    800076f4:	ffffa097          	auipc	ra,0xffffa
    800076f8:	af0080e7          	jalr	-1296(ra) # 800011e4 <_ZdlPv>
    800076fc:	01813083          	ld	ra,24(sp)
    80007700:	01013403          	ld	s0,16(sp)
    80007704:	00813483          	ld	s1,8(sp)
    80007708:	02010113          	addi	sp,sp,32
    8000770c:	00008067          	ret

0000000080007710 <_ZN7WorkerA3runEv>:
    void run() override {
    80007710:	ff010113          	addi	sp,sp,-16
    80007714:	00113423          	sd	ra,8(sp)
    80007718:	00813023          	sd	s0,0(sp)
    8000771c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80007720:	00000593          	li	a1,0
    80007724:	fffff097          	auipc	ra,0xfffff
    80007728:	774080e7          	jalr	1908(ra) # 80006e98 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000772c:	00813083          	ld	ra,8(sp)
    80007730:	00013403          	ld	s0,0(sp)
    80007734:	01010113          	addi	sp,sp,16
    80007738:	00008067          	ret

000000008000773c <_ZN7WorkerB3runEv>:
    void run() override {
    8000773c:	ff010113          	addi	sp,sp,-16
    80007740:	00113423          	sd	ra,8(sp)
    80007744:	00813023          	sd	s0,0(sp)
    80007748:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000774c:	00000593          	li	a1,0
    80007750:	00000097          	auipc	ra,0x0
    80007754:	814080e7          	jalr	-2028(ra) # 80006f64 <_ZN7WorkerB11workerBodyBEPv>
    }
    80007758:	00813083          	ld	ra,8(sp)
    8000775c:	00013403          	ld	s0,0(sp)
    80007760:	01010113          	addi	sp,sp,16
    80007764:	00008067          	ret

0000000080007768 <_ZN7WorkerC3runEv>:
    void run() override {
    80007768:	ff010113          	addi	sp,sp,-16
    8000776c:	00113423          	sd	ra,8(sp)
    80007770:	00813023          	sd	s0,0(sp)
    80007774:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80007778:	00000593          	li	a1,0
    8000777c:	00000097          	auipc	ra,0x0
    80007780:	8bc080e7          	jalr	-1860(ra) # 80007038 <_ZN7WorkerC11workerBodyCEPv>
    }
    80007784:	00813083          	ld	ra,8(sp)
    80007788:	00013403          	ld	s0,0(sp)
    8000778c:	01010113          	addi	sp,sp,16
    80007790:	00008067          	ret

0000000080007794 <_ZN7WorkerD3runEv>:
    void run() override {
    80007794:	ff010113          	addi	sp,sp,-16
    80007798:	00113423          	sd	ra,8(sp)
    8000779c:	00813023          	sd	s0,0(sp)
    800077a0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800077a4:	00000593          	li	a1,0
    800077a8:	00000097          	auipc	ra,0x0
    800077ac:	a10080e7          	jalr	-1520(ra) # 800071b8 <_ZN7WorkerD11workerBodyDEPv>
    }
    800077b0:	00813083          	ld	ra,8(sp)
    800077b4:	00013403          	ld	s0,0(sp)
    800077b8:	01010113          	addi	sp,sp,16
    800077bc:	00008067          	ret

00000000800077c0 <_Z8userMainv>:
#include "../test_h/ConsumerProducer_CPP_API_test.h"
#include "../test_h/System_Mode_test.h"

#endif

void userMain() {
    800077c0:	fe010113          	addi	sp,sp,-32
    800077c4:	00113c23          	sd	ra,24(sp)
    800077c8:	00813823          	sd	s0,16(sp)
    800077cc:	00913423          	sd	s1,8(sp)
    800077d0:	01213023          	sd	s2,0(sp)
    800077d4:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800077d8:	00004517          	auipc	a0,0x4
    800077dc:	ed850513          	addi	a0,a0,-296 # 8000b6b0 <CONSOLE_STATUS+0x6a0>
    800077e0:	00000097          	auipc	ra,0x0
    800077e4:	160080e7          	jalr	352(ra) # 80007940 <_Z11printStringPKc>
    int test = getc() - '0';
    800077e8:	ffffa097          	auipc	ra,0xffffa
    800077ec:	2bc080e7          	jalr	700(ra) # 80001aa4 <_Z4getcv>
    800077f0:	00050913          	mv	s2,a0
    800077f4:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800077f8:	ffffa097          	auipc	ra,0xffffa
    800077fc:	2ac080e7          	jalr	684(ra) # 80001aa4 <_Z4getcv>
    // int test = 3;
    putc(test);
    80007800:	fd09051b          	addiw	a0,s2,-48
    80007804:	0ff57513          	andi	a0,a0,255
    80007808:	ffffa097          	auipc	ra,0xffffa
    8000780c:	2c4080e7          	jalr	708(ra) # 80001acc <_Z4putcc>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80007810:	00700793          	li	a5,7
    80007814:	1097ec63          	bltu	a5,s1,8000792c <_Z8userMainv+0x16c>
    80007818:	00249493          	slli	s1,s1,0x2
    8000781c:	00004717          	auipc	a4,0x4
    80007820:	10070713          	addi	a4,a4,256 # 8000b91c <CONSOLE_STATUS+0x90c>
    80007824:	00e484b3          	add	s1,s1,a4
    80007828:	0004a783          	lw	a5,0(s1)
    8000782c:	00e787b3          	add	a5,a5,a4
    80007830:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80007834:	fffff097          	auipc	ra,0xfffff
    80007838:	f64080e7          	jalr	-156(ra) # 80006798 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    8000783c:	00004517          	auipc	a0,0x4
    80007840:	e9450513          	addi	a0,a0,-364 # 8000b6d0 <CONSOLE_STATUS+0x6c0>
    80007844:	00000097          	auipc	ra,0x0
    80007848:	0fc080e7          	jalr	252(ra) # 80007940 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    printString("Kraj izvrsavanja");
    8000784c:	00004517          	auipc	a0,0x4
    80007850:	0bc50513          	addi	a0,a0,188 # 8000b908 <CONSOLE_STATUS+0x8f8>
    80007854:	00000097          	auipc	ra,0x0
    80007858:	0ec080e7          	jalr	236(ra) # 80007940 <_Z11printStringPKc>
    8000785c:	01813083          	ld	ra,24(sp)
    80007860:	01013403          	ld	s0,16(sp)
    80007864:	00813483          	ld	s1,8(sp)
    80007868:	00013903          	ld	s2,0(sp)
    8000786c:	02010113          	addi	sp,sp,32
    80007870:	00008067          	ret
            Threads_CPP_API_test();
    80007874:	00000097          	auipc	ra,0x0
    80007878:	a8c080e7          	jalr	-1396(ra) # 80007300 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    8000787c:	00004517          	auipc	a0,0x4
    80007880:	e9450513          	addi	a0,a0,-364 # 8000b710 <CONSOLE_STATUS+0x700>
    80007884:	00000097          	auipc	ra,0x0
    80007888:	0bc080e7          	jalr	188(ra) # 80007940 <_Z11printStringPKc>
            break;
    8000788c:	fc1ff06f          	j	8000784c <_Z8userMainv+0x8c>
            producerConsumer_C_API();
    80007890:	ffffe097          	auipc	ra,0xffffe
    80007894:	9f4080e7          	jalr	-1548(ra) # 80005284 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80007898:	00004517          	auipc	a0,0x4
    8000789c:	eb850513          	addi	a0,a0,-328 # 8000b750 <CONSOLE_STATUS+0x740>
    800078a0:	00000097          	auipc	ra,0x0
    800078a4:	0a0080e7          	jalr	160(ra) # 80007940 <_Z11printStringPKc>
            break;
    800078a8:	fa5ff06f          	j	8000784c <_Z8userMainv+0x8c>
            producerConsumer_CPP_Sync_API();
    800078ac:	00000097          	auipc	ra,0x0
    800078b0:	5ac080e7          	jalr	1452(ra) # 80007e58 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    800078b4:	00004517          	auipc	a0,0x4
    800078b8:	eec50513          	addi	a0,a0,-276 # 8000b7a0 <CONSOLE_STATUS+0x790>
    800078bc:	00000097          	auipc	ra,0x0
    800078c0:	084080e7          	jalr	132(ra) # 80007940 <_Z11printStringPKc>
            break;
    800078c4:	f89ff06f          	j	8000784c <_Z8userMainv+0x8c>
            testSleeping();
    800078c8:	fffff097          	auipc	ra,0xfffff
    800078cc:	07c080e7          	jalr	124(ra) # 80006944 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., time_sleep test C API)\n");
    800078d0:	00004517          	auipc	a0,0x4
    800078d4:	f2850513          	addi	a0,a0,-216 # 8000b7f8 <CONSOLE_STATUS+0x7e8>
    800078d8:	00000097          	auipc	ra,0x0
    800078dc:	068080e7          	jalr	104(ra) # 80007940 <_Z11printStringPKc>
            break;
    800078e0:	f6dff06f          	j	8000784c <_Z8userMainv+0x8c>
            testConsumerProducer();
    800078e4:	ffffe097          	auipc	ra,0xffffe
    800078e8:	c70080e7          	jalr	-912(ra) # 80005554 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800078ec:	00004517          	auipc	a0,0x4
    800078f0:	f3c50513          	addi	a0,a0,-196 # 8000b828 <CONSOLE_STATUS+0x818>
    800078f4:	00000097          	auipc	ra,0x0
    800078f8:	04c080e7          	jalr	76(ra) # 80007940 <_Z11printStringPKc>
            break;
    800078fc:	f51ff06f          	j	8000784c <_Z8userMainv+0x8c>
            System_Mode_test();
    80007900:	fffff097          	auipc	ra,0xfffff
    80007904:	8c0080e7          	jalr	-1856(ra) # 800061c0 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80007908:	00004517          	auipc	a0,0x4
    8000790c:	f6050513          	addi	a0,a0,-160 # 8000b868 <CONSOLE_STATUS+0x858>
    80007910:	00000097          	auipc	ra,0x0
    80007914:	030080e7          	jalr	48(ra) # 80007940 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80007918:	00004517          	auipc	a0,0x4
    8000791c:	f7050513          	addi	a0,a0,-144 # 8000b888 <CONSOLE_STATUS+0x878>
    80007920:	00000097          	auipc	ra,0x0
    80007924:	020080e7          	jalr	32(ra) # 80007940 <_Z11printStringPKc>
            break;
    80007928:	f25ff06f          	j	8000784c <_Z8userMainv+0x8c>
            printString("Niste uneli odgovarajuci broj za test\n");
    8000792c:	00004517          	auipc	a0,0x4
    80007930:	fb450513          	addi	a0,a0,-76 # 8000b8e0 <CONSOLE_STATUS+0x8d0>
    80007934:	00000097          	auipc	ra,0x0
    80007938:	00c080e7          	jalr	12(ra) # 80007940 <_Z11printStringPKc>
    8000793c:	f11ff06f          	j	8000784c <_Z8userMainv+0x8c>

0000000080007940 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80007940:	fe010113          	addi	sp,sp,-32
    80007944:	00113c23          	sd	ra,24(sp)
    80007948:	00813823          	sd	s0,16(sp)
    8000794c:	00913423          	sd	s1,8(sp)
    80007950:	02010413          	addi	s0,sp,32
    80007954:	00050493          	mv	s1,a0
    LOCK();
    80007958:	00100613          	li	a2,1
    8000795c:	00000593          	li	a1,0
    80007960:	00006517          	auipc	a0,0x6
    80007964:	72850513          	addi	a0,a0,1832 # 8000e088 <lockPrint>
    80007968:	ffff9097          	auipc	ra,0xffff9
    8000796c:	798080e7          	jalr	1944(ra) # 80001100 <copy_and_swap>
    80007970:	00050863          	beqz	a0,80007980 <_Z11printStringPKc+0x40>
    80007974:	ffffa097          	auipc	ra,0xffffa
    80007978:	004080e7          	jalr	4(ra) # 80001978 <_Z15thread_dispatchv>
    8000797c:	fddff06f          	j	80007958 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80007980:	0004c503          	lbu	a0,0(s1)
    80007984:	00050a63          	beqz	a0,80007998 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80007988:	ffffa097          	auipc	ra,0xffffa
    8000798c:	144080e7          	jalr	324(ra) # 80001acc <_Z4putcc>
        string++;
    80007990:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80007994:	fedff06f          	j	80007980 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80007998:	00000613          	li	a2,0
    8000799c:	00100593          	li	a1,1
    800079a0:	00006517          	auipc	a0,0x6
    800079a4:	6e850513          	addi	a0,a0,1768 # 8000e088 <lockPrint>
    800079a8:	ffff9097          	auipc	ra,0xffff9
    800079ac:	758080e7          	jalr	1880(ra) # 80001100 <copy_and_swap>
    800079b0:	fe0514e3          	bnez	a0,80007998 <_Z11printStringPKc+0x58>
}
    800079b4:	01813083          	ld	ra,24(sp)
    800079b8:	01013403          	ld	s0,16(sp)
    800079bc:	00813483          	ld	s1,8(sp)
    800079c0:	02010113          	addi	sp,sp,32
    800079c4:	00008067          	ret

00000000800079c8 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800079c8:	fd010113          	addi	sp,sp,-48
    800079cc:	02113423          	sd	ra,40(sp)
    800079d0:	02813023          	sd	s0,32(sp)
    800079d4:	00913c23          	sd	s1,24(sp)
    800079d8:	01213823          	sd	s2,16(sp)
    800079dc:	01313423          	sd	s3,8(sp)
    800079e0:	01413023          	sd	s4,0(sp)
    800079e4:	03010413          	addi	s0,sp,48
    800079e8:	00050993          	mv	s3,a0
    800079ec:	00058a13          	mv	s4,a1
    LOCK();
    800079f0:	00100613          	li	a2,1
    800079f4:	00000593          	li	a1,0
    800079f8:	00006517          	auipc	a0,0x6
    800079fc:	69050513          	addi	a0,a0,1680 # 8000e088 <lockPrint>
    80007a00:	ffff9097          	auipc	ra,0xffff9
    80007a04:	700080e7          	jalr	1792(ra) # 80001100 <copy_and_swap>
    80007a08:	00050863          	beqz	a0,80007a18 <_Z9getStringPci+0x50>
    80007a0c:	ffffa097          	auipc	ra,0xffffa
    80007a10:	f6c080e7          	jalr	-148(ra) # 80001978 <_Z15thread_dispatchv>
    80007a14:	fddff06f          	j	800079f0 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80007a18:	00000913          	li	s2,0
    80007a1c:	00090493          	mv	s1,s2
    80007a20:	0019091b          	addiw	s2,s2,1
    80007a24:	03495a63          	bge	s2,s4,80007a58 <_Z9getStringPci+0x90>
        cc = getc();
    80007a28:	ffffa097          	auipc	ra,0xffffa
    80007a2c:	07c080e7          	jalr	124(ra) # 80001aa4 <_Z4getcv>
        if(cc < 1)
    80007a30:	02050463          	beqz	a0,80007a58 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80007a34:	009984b3          	add	s1,s3,s1
    80007a38:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80007a3c:	00a00793          	li	a5,10
    80007a40:	00f50a63          	beq	a0,a5,80007a54 <_Z9getStringPci+0x8c>
    80007a44:	00d00793          	li	a5,13
    80007a48:	fcf51ae3          	bne	a0,a5,80007a1c <_Z9getStringPci+0x54>
        buf[i++] = c;
    80007a4c:	00090493          	mv	s1,s2
    80007a50:	0080006f          	j	80007a58 <_Z9getStringPci+0x90>
    80007a54:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80007a58:	009984b3          	add	s1,s3,s1
    80007a5c:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80007a60:	00000613          	li	a2,0
    80007a64:	00100593          	li	a1,1
    80007a68:	00006517          	auipc	a0,0x6
    80007a6c:	62050513          	addi	a0,a0,1568 # 8000e088 <lockPrint>
    80007a70:	ffff9097          	auipc	ra,0xffff9
    80007a74:	690080e7          	jalr	1680(ra) # 80001100 <copy_and_swap>
    80007a78:	fe0514e3          	bnez	a0,80007a60 <_Z9getStringPci+0x98>
    return buf;
}
    80007a7c:	00098513          	mv	a0,s3
    80007a80:	02813083          	ld	ra,40(sp)
    80007a84:	02013403          	ld	s0,32(sp)
    80007a88:	01813483          	ld	s1,24(sp)
    80007a8c:	01013903          	ld	s2,16(sp)
    80007a90:	00813983          	ld	s3,8(sp)
    80007a94:	00013a03          	ld	s4,0(sp)
    80007a98:	03010113          	addi	sp,sp,48
    80007a9c:	00008067          	ret

0000000080007aa0 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80007aa0:	ff010113          	addi	sp,sp,-16
    80007aa4:	00813423          	sd	s0,8(sp)
    80007aa8:	01010413          	addi	s0,sp,16
    80007aac:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80007ab0:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80007ab4:	0006c603          	lbu	a2,0(a3)
    80007ab8:	fd06071b          	addiw	a4,a2,-48
    80007abc:	0ff77713          	andi	a4,a4,255
    80007ac0:	00900793          	li	a5,9
    80007ac4:	02e7e063          	bltu	a5,a4,80007ae4 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80007ac8:	0025179b          	slliw	a5,a0,0x2
    80007acc:	00a787bb          	addw	a5,a5,a0
    80007ad0:	0017979b          	slliw	a5,a5,0x1
    80007ad4:	00168693          	addi	a3,a3,1
    80007ad8:	00c787bb          	addw	a5,a5,a2
    80007adc:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80007ae0:	fd5ff06f          	j	80007ab4 <_Z11stringToIntPKc+0x14>
    return n;
}
    80007ae4:	00813403          	ld	s0,8(sp)
    80007ae8:	01010113          	addi	sp,sp,16
    80007aec:	00008067          	ret

0000000080007af0 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80007af0:	fc010113          	addi	sp,sp,-64
    80007af4:	02113c23          	sd	ra,56(sp)
    80007af8:	02813823          	sd	s0,48(sp)
    80007afc:	02913423          	sd	s1,40(sp)
    80007b00:	03213023          	sd	s2,32(sp)
    80007b04:	01313c23          	sd	s3,24(sp)
    80007b08:	04010413          	addi	s0,sp,64
    80007b0c:	00050493          	mv	s1,a0
    80007b10:	00058913          	mv	s2,a1
    80007b14:	00060993          	mv	s3,a2
    LOCK();
    80007b18:	00100613          	li	a2,1
    80007b1c:	00000593          	li	a1,0
    80007b20:	00006517          	auipc	a0,0x6
    80007b24:	56850513          	addi	a0,a0,1384 # 8000e088 <lockPrint>
    80007b28:	ffff9097          	auipc	ra,0xffff9
    80007b2c:	5d8080e7          	jalr	1496(ra) # 80001100 <copy_and_swap>
    80007b30:	00050863          	beqz	a0,80007b40 <_Z8printIntiii+0x50>
    80007b34:	ffffa097          	auipc	ra,0xffffa
    80007b38:	e44080e7          	jalr	-444(ra) # 80001978 <_Z15thread_dispatchv>
    80007b3c:	fddff06f          	j	80007b18 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80007b40:	00098463          	beqz	s3,80007b48 <_Z8printIntiii+0x58>
    80007b44:	0804c463          	bltz	s1,80007bcc <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80007b48:	0004851b          	sext.w	a0,s1
    neg = 0;
    80007b4c:	00000593          	li	a1,0
    }

    i = 0;
    80007b50:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80007b54:	0009079b          	sext.w	a5,s2
    80007b58:	0325773b          	remuw	a4,a0,s2
    80007b5c:	00048613          	mv	a2,s1
    80007b60:	0014849b          	addiw	s1,s1,1
    80007b64:	02071693          	slli	a3,a4,0x20
    80007b68:	0206d693          	srli	a3,a3,0x20
    80007b6c:	00006717          	auipc	a4,0x6
    80007b70:	37c70713          	addi	a4,a4,892 # 8000dee8 <digits>
    80007b74:	00d70733          	add	a4,a4,a3
    80007b78:	00074683          	lbu	a3,0(a4)
    80007b7c:	fd040713          	addi	a4,s0,-48
    80007b80:	00c70733          	add	a4,a4,a2
    80007b84:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80007b88:	0005071b          	sext.w	a4,a0
    80007b8c:	0325553b          	divuw	a0,a0,s2
    80007b90:	fcf772e3          	bgeu	a4,a5,80007b54 <_Z8printIntiii+0x64>
    if(neg)
    80007b94:	00058c63          	beqz	a1,80007bac <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80007b98:	fd040793          	addi	a5,s0,-48
    80007b9c:	009784b3          	add	s1,a5,s1
    80007ba0:	02d00793          	li	a5,45
    80007ba4:	fef48823          	sb	a5,-16(s1)
    80007ba8:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80007bac:	fff4849b          	addiw	s1,s1,-1
    80007bb0:	0204c463          	bltz	s1,80007bd8 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80007bb4:	fd040793          	addi	a5,s0,-48
    80007bb8:	009787b3          	add	a5,a5,s1
    80007bbc:	ff07c503          	lbu	a0,-16(a5)
    80007bc0:	ffffa097          	auipc	ra,0xffffa
    80007bc4:	f0c080e7          	jalr	-244(ra) # 80001acc <_Z4putcc>
    80007bc8:	fe5ff06f          	j	80007bac <_Z8printIntiii+0xbc>
        x = -xx;
    80007bcc:	4090053b          	negw	a0,s1
        neg = 1;
    80007bd0:	00100593          	li	a1,1
        x = -xx;
    80007bd4:	f7dff06f          	j	80007b50 <_Z8printIntiii+0x60>

    UNLOCK();
    80007bd8:	00000613          	li	a2,0
    80007bdc:	00100593          	li	a1,1
    80007be0:	00006517          	auipc	a0,0x6
    80007be4:	4a850513          	addi	a0,a0,1192 # 8000e088 <lockPrint>
    80007be8:	ffff9097          	auipc	ra,0xffff9
    80007bec:	518080e7          	jalr	1304(ra) # 80001100 <copy_and_swap>
    80007bf0:	fe0514e3          	bnez	a0,80007bd8 <_Z8printIntiii+0xe8>
    80007bf4:	03813083          	ld	ra,56(sp)
    80007bf8:	03013403          	ld	s0,48(sp)
    80007bfc:	02813483          	ld	s1,40(sp)
    80007c00:	02013903          	ld	s2,32(sp)
    80007c04:	01813983          	ld	s3,24(sp)
    80007c08:	04010113          	addi	sp,sp,64
    80007c0c:	00008067          	ret

0000000080007c10 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80007c10:	fd010113          	addi	sp,sp,-48
    80007c14:	02113423          	sd	ra,40(sp)
    80007c18:	02813023          	sd	s0,32(sp)
    80007c1c:	00913c23          	sd	s1,24(sp)
    80007c20:	01213823          	sd	s2,16(sp)
    80007c24:	01313423          	sd	s3,8(sp)
    80007c28:	03010413          	addi	s0,sp,48
    80007c2c:	00050993          	mv	s3,a0
    80007c30:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80007c34:	00000913          	li	s2,0
    80007c38:	00c0006f          	j	80007c44 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007c3c:	ffff9097          	auipc	ra,0xffff9
    80007c40:	6dc080e7          	jalr	1756(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80007c44:	ffffa097          	auipc	ra,0xffffa
    80007c48:	e60080e7          	jalr	-416(ra) # 80001aa4 <_Z4getcv>
    80007c4c:	0005059b          	sext.w	a1,a0
    80007c50:	01b00793          	li	a5,27
    80007c54:	02f58a63          	beq	a1,a5,80007c88 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80007c58:	0084b503          	ld	a0,8(s1)
    80007c5c:	fffff097          	auipc	ra,0xfffff
    80007c60:	f24080e7          	jalr	-220(ra) # 80006b80 <_ZN9BufferCPP3putEi>
        i++;
    80007c64:	0019071b          	addiw	a4,s2,1
    80007c68:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007c6c:	0004a683          	lw	a3,0(s1)
    80007c70:	0026979b          	slliw	a5,a3,0x2
    80007c74:	00d787bb          	addw	a5,a5,a3
    80007c78:	0017979b          	slliw	a5,a5,0x1
    80007c7c:	02f767bb          	remw	a5,a4,a5
    80007c80:	fc0792e3          	bnez	a5,80007c44 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80007c84:	fb9ff06f          	j	80007c3c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80007c88:	00100793          	li	a5,1
    80007c8c:	00006717          	auipc	a4,0x6
    80007c90:	40f72223          	sw	a5,1028(a4) # 8000e090 <_ZL9threadEnd>
    td->buffer->put('!');
    80007c94:	0209b783          	ld	a5,32(s3)
    80007c98:	02100593          	li	a1,33
    80007c9c:	0087b503          	ld	a0,8(a5)
    80007ca0:	fffff097          	auipc	ra,0xfffff
    80007ca4:	ee0080e7          	jalr	-288(ra) # 80006b80 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80007ca8:	0104b503          	ld	a0,16(s1)
    80007cac:	ffff9097          	auipc	ra,0xffff9
    80007cb0:	78c080e7          	jalr	1932(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007cb4:	02813083          	ld	ra,40(sp)
    80007cb8:	02013403          	ld	s0,32(sp)
    80007cbc:	01813483          	ld	s1,24(sp)
    80007cc0:	01013903          	ld	s2,16(sp)
    80007cc4:	00813983          	ld	s3,8(sp)
    80007cc8:	03010113          	addi	sp,sp,48
    80007ccc:	00008067          	ret

0000000080007cd0 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80007cd0:	fe010113          	addi	sp,sp,-32
    80007cd4:	00113c23          	sd	ra,24(sp)
    80007cd8:	00813823          	sd	s0,16(sp)
    80007cdc:	00913423          	sd	s1,8(sp)
    80007ce0:	01213023          	sd	s2,0(sp)
    80007ce4:	02010413          	addi	s0,sp,32
    80007ce8:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007cec:	00000913          	li	s2,0
    80007cf0:	00c0006f          	j	80007cfc <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007cf4:	ffff9097          	auipc	ra,0xffff9
    80007cf8:	624080e7          	jalr	1572(ra) # 80001318 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80007cfc:	00006797          	auipc	a5,0x6
    80007d00:	3947a783          	lw	a5,916(a5) # 8000e090 <_ZL9threadEnd>
    80007d04:	02079e63          	bnez	a5,80007d40 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80007d08:	0004a583          	lw	a1,0(s1)
    80007d0c:	0305859b          	addiw	a1,a1,48
    80007d10:	0084b503          	ld	a0,8(s1)
    80007d14:	fffff097          	auipc	ra,0xfffff
    80007d18:	e6c080e7          	jalr	-404(ra) # 80006b80 <_ZN9BufferCPP3putEi>
        i++;
    80007d1c:	0019071b          	addiw	a4,s2,1
    80007d20:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007d24:	0004a683          	lw	a3,0(s1)
    80007d28:	0026979b          	slliw	a5,a3,0x2
    80007d2c:	00d787bb          	addw	a5,a5,a3
    80007d30:	0017979b          	slliw	a5,a5,0x1
    80007d34:	02f767bb          	remw	a5,a4,a5
    80007d38:	fc0792e3          	bnez	a5,80007cfc <_ZN12ProducerSync8producerEPv+0x2c>
    80007d3c:	fb9ff06f          	j	80007cf4 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80007d40:	0104b503          	ld	a0,16(s1)
    80007d44:	ffff9097          	auipc	ra,0xffff9
    80007d48:	6f4080e7          	jalr	1780(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007d4c:	01813083          	ld	ra,24(sp)
    80007d50:	01013403          	ld	s0,16(sp)
    80007d54:	00813483          	ld	s1,8(sp)
    80007d58:	00013903          	ld	s2,0(sp)
    80007d5c:	02010113          	addi	sp,sp,32
    80007d60:	00008067          	ret

0000000080007d64 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80007d64:	fd010113          	addi	sp,sp,-48
    80007d68:	02113423          	sd	ra,40(sp)
    80007d6c:	02813023          	sd	s0,32(sp)
    80007d70:	00913c23          	sd	s1,24(sp)
    80007d74:	01213823          	sd	s2,16(sp)
    80007d78:	01313423          	sd	s3,8(sp)
    80007d7c:	01413023          	sd	s4,0(sp)
    80007d80:	03010413          	addi	s0,sp,48
    80007d84:	00050993          	mv	s3,a0
    80007d88:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007d8c:	00000a13          	li	s4,0
    80007d90:	01c0006f          	j	80007dac <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80007d94:	ffff9097          	auipc	ra,0xffff9
    80007d98:	584080e7          	jalr	1412(ra) # 80001318 <_ZN6Thread8dispatchEv>
    80007d9c:	0500006f          	j	80007dec <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80007da0:	00a00513          	li	a0,10
    80007da4:	ffffa097          	auipc	ra,0xffffa
    80007da8:	d28080e7          	jalr	-728(ra) # 80001acc <_Z4putcc>
    while (!threadEnd) {
    80007dac:	00006797          	auipc	a5,0x6
    80007db0:	2e47a783          	lw	a5,740(a5) # 8000e090 <_ZL9threadEnd>
    80007db4:	06079263          	bnez	a5,80007e18 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80007db8:	00893503          	ld	a0,8(s2)
    80007dbc:	fffff097          	auipc	ra,0xfffff
    80007dc0:	e54080e7          	jalr	-428(ra) # 80006c10 <_ZN9BufferCPP3getEv>
        i++;
    80007dc4:	001a049b          	addiw	s1,s4,1
    80007dc8:	00048a1b          	sext.w	s4,s1
        putc(key);
    80007dcc:	0ff57513          	andi	a0,a0,255
    80007dd0:	ffffa097          	auipc	ra,0xffffa
    80007dd4:	cfc080e7          	jalr	-772(ra) # 80001acc <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80007dd8:	00092703          	lw	a4,0(s2)
    80007ddc:	0027179b          	slliw	a5,a4,0x2
    80007de0:	00e787bb          	addw	a5,a5,a4
    80007de4:	02f4e7bb          	remw	a5,s1,a5
    80007de8:	fa0786e3          	beqz	a5,80007d94 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80007dec:	05000793          	li	a5,80
    80007df0:	02f4e4bb          	remw	s1,s1,a5
    80007df4:	fa049ce3          	bnez	s1,80007dac <_ZN12ConsumerSync8consumerEPv+0x48>
    80007df8:	fa9ff06f          	j	80007da0 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80007dfc:	0209b783          	ld	a5,32(s3)
    80007e00:	0087b503          	ld	a0,8(a5)
    80007e04:	fffff097          	auipc	ra,0xfffff
    80007e08:	e0c080e7          	jalr	-500(ra) # 80006c10 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80007e0c:	0ff57513          	andi	a0,a0,255
    80007e10:	ffff9097          	auipc	ra,0xffff9
    80007e14:	6c4080e7          	jalr	1732(ra) # 800014d4 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80007e18:	0209b783          	ld	a5,32(s3)
    80007e1c:	0087b503          	ld	a0,8(a5)
    80007e20:	fffff097          	auipc	ra,0xfffff
    80007e24:	e7c080e7          	jalr	-388(ra) # 80006c9c <_ZN9BufferCPP6getCntEv>
    80007e28:	fca04ae3          	bgtz	a0,80007dfc <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80007e2c:	01093503          	ld	a0,16(s2)
    80007e30:	ffff9097          	auipc	ra,0xffff9
    80007e34:	608080e7          	jalr	1544(ra) # 80001438 <_ZN9Semaphore6signalEv>
}
    80007e38:	02813083          	ld	ra,40(sp)
    80007e3c:	02013403          	ld	s0,32(sp)
    80007e40:	01813483          	ld	s1,24(sp)
    80007e44:	01013903          	ld	s2,16(sp)
    80007e48:	00813983          	ld	s3,8(sp)
    80007e4c:	00013a03          	ld	s4,0(sp)
    80007e50:	03010113          	addi	sp,sp,48
    80007e54:	00008067          	ret

0000000080007e58 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80007e58:	f8010113          	addi	sp,sp,-128
    80007e5c:	06113c23          	sd	ra,120(sp)
    80007e60:	06813823          	sd	s0,112(sp)
    80007e64:	06913423          	sd	s1,104(sp)
    80007e68:	07213023          	sd	s2,96(sp)
    80007e6c:	05313c23          	sd	s3,88(sp)
    80007e70:	05413823          	sd	s4,80(sp)
    80007e74:	05513423          	sd	s5,72(sp)
    80007e78:	05613023          	sd	s6,64(sp)
    80007e7c:	03713c23          	sd	s7,56(sp)
    80007e80:	03813823          	sd	s8,48(sp)
    80007e84:	03913423          	sd	s9,40(sp)
    80007e88:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80007e8c:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80007e90:	00003517          	auipc	a0,0x3
    80007e94:	5b050513          	addi	a0,a0,1456 # 8000b440 <CONSOLE_STATUS+0x430>
    80007e98:	00000097          	auipc	ra,0x0
    80007e9c:	aa8080e7          	jalr	-1368(ra) # 80007940 <_Z11printStringPKc>
    getString(input, 30);
    80007ea0:	01e00593          	li	a1,30
    80007ea4:	f8040493          	addi	s1,s0,-128
    80007ea8:	00048513          	mv	a0,s1
    80007eac:	00000097          	auipc	ra,0x0
    80007eb0:	b1c080e7          	jalr	-1252(ra) # 800079c8 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80007eb4:	00048513          	mv	a0,s1
    80007eb8:	00000097          	auipc	ra,0x0
    80007ebc:	be8080e7          	jalr	-1048(ra) # 80007aa0 <_Z11stringToIntPKc>
    80007ec0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80007ec4:	00003517          	auipc	a0,0x3
    80007ec8:	59c50513          	addi	a0,a0,1436 # 8000b460 <CONSOLE_STATUS+0x450>
    80007ecc:	00000097          	auipc	ra,0x0
    80007ed0:	a74080e7          	jalr	-1420(ra) # 80007940 <_Z11printStringPKc>
    getString(input, 30);
    80007ed4:	01e00593          	li	a1,30
    80007ed8:	00048513          	mv	a0,s1
    80007edc:	00000097          	auipc	ra,0x0
    80007ee0:	aec080e7          	jalr	-1300(ra) # 800079c8 <_Z9getStringPci>
    n = stringToInt(input);
    80007ee4:	00048513          	mv	a0,s1
    80007ee8:	00000097          	auipc	ra,0x0
    80007eec:	bb8080e7          	jalr	-1096(ra) # 80007aa0 <_Z11stringToIntPKc>
    80007ef0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80007ef4:	00003517          	auipc	a0,0x3
    80007ef8:	58c50513          	addi	a0,a0,1420 # 8000b480 <CONSOLE_STATUS+0x470>
    80007efc:	00000097          	auipc	ra,0x0
    80007f00:	a44080e7          	jalr	-1468(ra) # 80007940 <_Z11printStringPKc>
    80007f04:	00000613          	li	a2,0
    80007f08:	00a00593          	li	a1,10
    80007f0c:	00090513          	mv	a0,s2
    80007f10:	00000097          	auipc	ra,0x0
    80007f14:	be0080e7          	jalr	-1056(ra) # 80007af0 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80007f18:	00003517          	auipc	a0,0x3
    80007f1c:	58050513          	addi	a0,a0,1408 # 8000b498 <CONSOLE_STATUS+0x488>
    80007f20:	00000097          	auipc	ra,0x0
    80007f24:	a20080e7          	jalr	-1504(ra) # 80007940 <_Z11printStringPKc>
    80007f28:	00000613          	li	a2,0
    80007f2c:	00a00593          	li	a1,10
    80007f30:	00048513          	mv	a0,s1
    80007f34:	00000097          	auipc	ra,0x0
    80007f38:	bbc080e7          	jalr	-1092(ra) # 80007af0 <_Z8printIntiii>
    printString(".\n");
    80007f3c:	00003517          	auipc	a0,0x3
    80007f40:	57450513          	addi	a0,a0,1396 # 8000b4b0 <CONSOLE_STATUS+0x4a0>
    80007f44:	00000097          	auipc	ra,0x0
    80007f48:	9fc080e7          	jalr	-1540(ra) # 80007940 <_Z11printStringPKc>
    if(threadNum > n) {
    80007f4c:	0324c463          	blt	s1,s2,80007f74 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80007f50:	03205c63          	blez	s2,80007f88 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80007f54:	03800513          	li	a0,56
    80007f58:	ffff9097          	auipc	ra,0xffff9
    80007f5c:	264080e7          	jalr	612(ra) # 800011bc <_Znwm>
    80007f60:	00050a93          	mv	s5,a0
    80007f64:	00048593          	mv	a1,s1
    80007f68:	fffff097          	auipc	ra,0xfffff
    80007f6c:	ac4080e7          	jalr	-1340(ra) # 80006a2c <_ZN9BufferCPPC1Ei>
    80007f70:	0300006f          	j	80007fa0 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80007f74:	00003517          	auipc	a0,0x3
    80007f78:	54450513          	addi	a0,a0,1348 # 8000b4b8 <CONSOLE_STATUS+0x4a8>
    80007f7c:	00000097          	auipc	ra,0x0
    80007f80:	9c4080e7          	jalr	-1596(ra) # 80007940 <_Z11printStringPKc>
        return;
    80007f84:	0140006f          	j	80007f98 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80007f88:	00003517          	auipc	a0,0x3
    80007f8c:	57050513          	addi	a0,a0,1392 # 8000b4f8 <CONSOLE_STATUS+0x4e8>
    80007f90:	00000097          	auipc	ra,0x0
    80007f94:	9b0080e7          	jalr	-1616(ra) # 80007940 <_Z11printStringPKc>
        return;
    80007f98:	000b8113          	mv	sp,s7
    80007f9c:	2380006f          	j	800081d4 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80007fa0:	01000513          	li	a0,16
    80007fa4:	ffff9097          	auipc	ra,0xffff9
    80007fa8:	218080e7          	jalr	536(ra) # 800011bc <_Znwm>
    80007fac:	00050493          	mv	s1,a0
    80007fb0:	00000593          	li	a1,0
    80007fb4:	ffff9097          	auipc	ra,0xffff9
    80007fb8:	420080e7          	jalr	1056(ra) # 800013d4 <_ZN9SemaphoreC1Ej>
    80007fbc:	00006797          	auipc	a5,0x6
    80007fc0:	0c97be23          	sd	s1,220(a5) # 8000e098 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80007fc4:	00391793          	slli	a5,s2,0x3
    80007fc8:	00f78793          	addi	a5,a5,15
    80007fcc:	ff07f793          	andi	a5,a5,-16
    80007fd0:	40f10133          	sub	sp,sp,a5
    80007fd4:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80007fd8:	0019071b          	addiw	a4,s2,1
    80007fdc:	00171793          	slli	a5,a4,0x1
    80007fe0:	00e787b3          	add	a5,a5,a4
    80007fe4:	00379793          	slli	a5,a5,0x3
    80007fe8:	00f78793          	addi	a5,a5,15
    80007fec:	ff07f793          	andi	a5,a5,-16
    80007ff0:	40f10133          	sub	sp,sp,a5
    80007ff4:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80007ff8:	00191c13          	slli	s8,s2,0x1
    80007ffc:	012c07b3          	add	a5,s8,s2
    80008000:	00379793          	slli	a5,a5,0x3
    80008004:	00fa07b3          	add	a5,s4,a5
    80008008:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    8000800c:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80008010:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80008014:	02800513          	li	a0,40
    80008018:	ffff9097          	auipc	ra,0xffff9
    8000801c:	1a4080e7          	jalr	420(ra) # 800011bc <_Znwm>
    80008020:	00050b13          	mv	s6,a0
    80008024:	012c0c33          	add	s8,s8,s2
    80008028:	003c1c13          	slli	s8,s8,0x3
    8000802c:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80008030:	ffff9097          	auipc	ra,0xffff9
    80008034:	370080e7          	jalr	880(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80008038:	00006797          	auipc	a5,0x6
    8000803c:	f2878793          	addi	a5,a5,-216 # 8000df60 <_ZTV12ConsumerSync+0x10>
    80008040:	00fb3023          	sd	a5,0(s6)
    80008044:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80008048:	000b0513          	mv	a0,s6
    8000804c:	ffff9097          	auipc	ra,0xffff9
    80008050:	26c080e7          	jalr	620(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80008054:	00000493          	li	s1,0
    80008058:	0380006f          	j	80008090 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    8000805c:	00006797          	auipc	a5,0x6
    80008060:	edc78793          	addi	a5,a5,-292 # 8000df38 <_ZTV12ProducerSync+0x10>
    80008064:	00fcb023          	sd	a5,0(s9)
    80008068:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    8000806c:	00349793          	slli	a5,s1,0x3
    80008070:	00f987b3          	add	a5,s3,a5
    80008074:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80008078:	00349793          	slli	a5,s1,0x3
    8000807c:	00f987b3          	add	a5,s3,a5
    80008080:	0007b503          	ld	a0,0(a5)
    80008084:	ffff9097          	auipc	ra,0xffff9
    80008088:	234080e7          	jalr	564(ra) # 800012b8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000808c:	0014849b          	addiw	s1,s1,1
    80008090:	0b24d063          	bge	s1,s2,80008130 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80008094:	00149793          	slli	a5,s1,0x1
    80008098:	009787b3          	add	a5,a5,s1
    8000809c:	00379793          	slli	a5,a5,0x3
    800080a0:	00fa07b3          	add	a5,s4,a5
    800080a4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800080a8:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800080ac:	00006717          	auipc	a4,0x6
    800080b0:	fec73703          	ld	a4,-20(a4) # 8000e098 <_ZL10waitForAll>
    800080b4:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800080b8:	02905863          	blez	s1,800080e8 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800080bc:	02800513          	li	a0,40
    800080c0:	ffff9097          	auipc	ra,0xffff9
    800080c4:	0fc080e7          	jalr	252(ra) # 800011bc <_Znwm>
    800080c8:	00050c93          	mv	s9,a0
    800080cc:	00149c13          	slli	s8,s1,0x1
    800080d0:	009c0c33          	add	s8,s8,s1
    800080d4:	003c1c13          	slli	s8,s8,0x3
    800080d8:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800080dc:	ffff9097          	auipc	ra,0xffff9
    800080e0:	2c4080e7          	jalr	708(ra) # 800013a0 <_ZN6ThreadC1Ev>
    800080e4:	f79ff06f          	j	8000805c <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800080e8:	02800513          	li	a0,40
    800080ec:	ffff9097          	auipc	ra,0xffff9
    800080f0:	0d0080e7          	jalr	208(ra) # 800011bc <_Znwm>
    800080f4:	00050c93          	mv	s9,a0
    800080f8:	00149c13          	slli	s8,s1,0x1
    800080fc:	009c0c33          	add	s8,s8,s1
    80008100:	003c1c13          	slli	s8,s8,0x3
    80008104:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80008108:	ffff9097          	auipc	ra,0xffff9
    8000810c:	298080e7          	jalr	664(ra) # 800013a0 <_ZN6ThreadC1Ev>
    80008110:	00006797          	auipc	a5,0x6
    80008114:	e0078793          	addi	a5,a5,-512 # 8000df10 <_ZTV16ProducerKeyboard+0x10>
    80008118:	00fcb023          	sd	a5,0(s9)
    8000811c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80008120:	00349793          	slli	a5,s1,0x3
    80008124:	00f987b3          	add	a5,s3,a5
    80008128:	0197b023          	sd	s9,0(a5)
    8000812c:	f4dff06f          	j	80008078 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80008130:	ffff9097          	auipc	ra,0xffff9
    80008134:	1e8080e7          	jalr	488(ra) # 80001318 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80008138:	00000493          	li	s1,0
    8000813c:	00994e63          	blt	s2,s1,80008158 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80008140:	00006517          	auipc	a0,0x6
    80008144:	f5853503          	ld	a0,-168(a0) # 8000e098 <_ZL10waitForAll>
    80008148:	ffff9097          	auipc	ra,0xffff9
    8000814c:	2c4080e7          	jalr	708(ra) # 8000140c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80008150:	0014849b          	addiw	s1,s1,1
    80008154:	fe9ff06f          	j	8000813c <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80008158:	00000493          	li	s1,0
    8000815c:	0080006f          	j	80008164 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80008160:	0014849b          	addiw	s1,s1,1
    80008164:	0324d263          	bge	s1,s2,80008188 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80008168:	00349793          	slli	a5,s1,0x3
    8000816c:	00f987b3          	add	a5,s3,a5
    80008170:	0007b503          	ld	a0,0(a5)
    80008174:	fe0506e3          	beqz	a0,80008160 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80008178:	00053783          	ld	a5,0(a0)
    8000817c:	0087b783          	ld	a5,8(a5)
    80008180:	000780e7          	jalr	a5
    80008184:	fddff06f          	j	80008160 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80008188:	000b0a63          	beqz	s6,8000819c <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    8000818c:	000b3783          	ld	a5,0(s6)
    80008190:	0087b783          	ld	a5,8(a5)
    80008194:	000b0513          	mv	a0,s6
    80008198:	000780e7          	jalr	a5
    delete waitForAll;
    8000819c:	00006517          	auipc	a0,0x6
    800081a0:	efc53503          	ld	a0,-260(a0) # 8000e098 <_ZL10waitForAll>
    800081a4:	00050863          	beqz	a0,800081b4 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800081a8:	00053783          	ld	a5,0(a0)
    800081ac:	0087b783          	ld	a5,8(a5)
    800081b0:	000780e7          	jalr	a5
    delete buffer;
    800081b4:	000a8e63          	beqz	s5,800081d0 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800081b8:	000a8513          	mv	a0,s5
    800081bc:	fffff097          	auipc	ra,0xfffff
    800081c0:	b68080e7          	jalr	-1176(ra) # 80006d24 <_ZN9BufferCPPD1Ev>
    800081c4:	000a8513          	mv	a0,s5
    800081c8:	ffff9097          	auipc	ra,0xffff9
    800081cc:	01c080e7          	jalr	28(ra) # 800011e4 <_ZdlPv>
    800081d0:	000b8113          	mv	sp,s7

}
    800081d4:	f8040113          	addi	sp,s0,-128
    800081d8:	07813083          	ld	ra,120(sp)
    800081dc:	07013403          	ld	s0,112(sp)
    800081e0:	06813483          	ld	s1,104(sp)
    800081e4:	06013903          	ld	s2,96(sp)
    800081e8:	05813983          	ld	s3,88(sp)
    800081ec:	05013a03          	ld	s4,80(sp)
    800081f0:	04813a83          	ld	s5,72(sp)
    800081f4:	04013b03          	ld	s6,64(sp)
    800081f8:	03813b83          	ld	s7,56(sp)
    800081fc:	03013c03          	ld	s8,48(sp)
    80008200:	02813c83          	ld	s9,40(sp)
    80008204:	08010113          	addi	sp,sp,128
    80008208:	00008067          	ret
    8000820c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80008210:	000a8513          	mv	a0,s5
    80008214:	ffff9097          	auipc	ra,0xffff9
    80008218:	fd0080e7          	jalr	-48(ra) # 800011e4 <_ZdlPv>
    8000821c:	00048513          	mv	a0,s1
    80008220:	00007097          	auipc	ra,0x7
    80008224:	f48080e7          	jalr	-184(ra) # 8000f168 <_Unwind_Resume>
    80008228:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    8000822c:	00048513          	mv	a0,s1
    80008230:	ffff9097          	auipc	ra,0xffff9
    80008234:	fb4080e7          	jalr	-76(ra) # 800011e4 <_ZdlPv>
    80008238:	00090513          	mv	a0,s2
    8000823c:	00007097          	auipc	ra,0x7
    80008240:	f2c080e7          	jalr	-212(ra) # 8000f168 <_Unwind_Resume>
    80008244:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80008248:	000b0513          	mv	a0,s6
    8000824c:	ffff9097          	auipc	ra,0xffff9
    80008250:	f98080e7          	jalr	-104(ra) # 800011e4 <_ZdlPv>
    80008254:	00048513          	mv	a0,s1
    80008258:	00007097          	auipc	ra,0x7
    8000825c:	f10080e7          	jalr	-240(ra) # 8000f168 <_Unwind_Resume>
    80008260:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80008264:	000c8513          	mv	a0,s9
    80008268:	ffff9097          	auipc	ra,0xffff9
    8000826c:	f7c080e7          	jalr	-132(ra) # 800011e4 <_ZdlPv>
    80008270:	00048513          	mv	a0,s1
    80008274:	00007097          	auipc	ra,0x7
    80008278:	ef4080e7          	jalr	-268(ra) # 8000f168 <_Unwind_Resume>
    8000827c:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80008280:	000c8513          	mv	a0,s9
    80008284:	ffff9097          	auipc	ra,0xffff9
    80008288:	f60080e7          	jalr	-160(ra) # 800011e4 <_ZdlPv>
    8000828c:	00048513          	mv	a0,s1
    80008290:	00007097          	auipc	ra,0x7
    80008294:	ed8080e7          	jalr	-296(ra) # 8000f168 <_Unwind_Resume>

0000000080008298 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80008298:	ff010113          	addi	sp,sp,-16
    8000829c:	00113423          	sd	ra,8(sp)
    800082a0:	00813023          	sd	s0,0(sp)
    800082a4:	01010413          	addi	s0,sp,16
    800082a8:	00006797          	auipc	a5,0x6
    800082ac:	cb878793          	addi	a5,a5,-840 # 8000df60 <_ZTV12ConsumerSync+0x10>
    800082b0:	00f53023          	sd	a5,0(a0)
    800082b4:	ffff9097          	auipc	ra,0xffff9
    800082b8:	e98080e7          	jalr	-360(ra) # 8000114c <_ZN6ThreadD1Ev>
    800082bc:	00813083          	ld	ra,8(sp)
    800082c0:	00013403          	ld	s0,0(sp)
    800082c4:	01010113          	addi	sp,sp,16
    800082c8:	00008067          	ret

00000000800082cc <_ZN12ConsumerSyncD0Ev>:
    800082cc:	fe010113          	addi	sp,sp,-32
    800082d0:	00113c23          	sd	ra,24(sp)
    800082d4:	00813823          	sd	s0,16(sp)
    800082d8:	00913423          	sd	s1,8(sp)
    800082dc:	02010413          	addi	s0,sp,32
    800082e0:	00050493          	mv	s1,a0
    800082e4:	00006797          	auipc	a5,0x6
    800082e8:	c7c78793          	addi	a5,a5,-900 # 8000df60 <_ZTV12ConsumerSync+0x10>
    800082ec:	00f53023          	sd	a5,0(a0)
    800082f0:	ffff9097          	auipc	ra,0xffff9
    800082f4:	e5c080e7          	jalr	-420(ra) # 8000114c <_ZN6ThreadD1Ev>
    800082f8:	00048513          	mv	a0,s1
    800082fc:	ffff9097          	auipc	ra,0xffff9
    80008300:	ee8080e7          	jalr	-280(ra) # 800011e4 <_ZdlPv>
    80008304:	01813083          	ld	ra,24(sp)
    80008308:	01013403          	ld	s0,16(sp)
    8000830c:	00813483          	ld	s1,8(sp)
    80008310:	02010113          	addi	sp,sp,32
    80008314:	00008067          	ret

0000000080008318 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80008318:	ff010113          	addi	sp,sp,-16
    8000831c:	00113423          	sd	ra,8(sp)
    80008320:	00813023          	sd	s0,0(sp)
    80008324:	01010413          	addi	s0,sp,16
    80008328:	00006797          	auipc	a5,0x6
    8000832c:	c1078793          	addi	a5,a5,-1008 # 8000df38 <_ZTV12ProducerSync+0x10>
    80008330:	00f53023          	sd	a5,0(a0)
    80008334:	ffff9097          	auipc	ra,0xffff9
    80008338:	e18080e7          	jalr	-488(ra) # 8000114c <_ZN6ThreadD1Ev>
    8000833c:	00813083          	ld	ra,8(sp)
    80008340:	00013403          	ld	s0,0(sp)
    80008344:	01010113          	addi	sp,sp,16
    80008348:	00008067          	ret

000000008000834c <_ZN12ProducerSyncD0Ev>:
    8000834c:	fe010113          	addi	sp,sp,-32
    80008350:	00113c23          	sd	ra,24(sp)
    80008354:	00813823          	sd	s0,16(sp)
    80008358:	00913423          	sd	s1,8(sp)
    8000835c:	02010413          	addi	s0,sp,32
    80008360:	00050493          	mv	s1,a0
    80008364:	00006797          	auipc	a5,0x6
    80008368:	bd478793          	addi	a5,a5,-1068 # 8000df38 <_ZTV12ProducerSync+0x10>
    8000836c:	00f53023          	sd	a5,0(a0)
    80008370:	ffff9097          	auipc	ra,0xffff9
    80008374:	ddc080e7          	jalr	-548(ra) # 8000114c <_ZN6ThreadD1Ev>
    80008378:	00048513          	mv	a0,s1
    8000837c:	ffff9097          	auipc	ra,0xffff9
    80008380:	e68080e7          	jalr	-408(ra) # 800011e4 <_ZdlPv>
    80008384:	01813083          	ld	ra,24(sp)
    80008388:	01013403          	ld	s0,16(sp)
    8000838c:	00813483          	ld	s1,8(sp)
    80008390:	02010113          	addi	sp,sp,32
    80008394:	00008067          	ret

0000000080008398 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80008398:	ff010113          	addi	sp,sp,-16
    8000839c:	00113423          	sd	ra,8(sp)
    800083a0:	00813023          	sd	s0,0(sp)
    800083a4:	01010413          	addi	s0,sp,16
    800083a8:	00006797          	auipc	a5,0x6
    800083ac:	b6878793          	addi	a5,a5,-1176 # 8000df10 <_ZTV16ProducerKeyboard+0x10>
    800083b0:	00f53023          	sd	a5,0(a0)
    800083b4:	ffff9097          	auipc	ra,0xffff9
    800083b8:	d98080e7          	jalr	-616(ra) # 8000114c <_ZN6ThreadD1Ev>
    800083bc:	00813083          	ld	ra,8(sp)
    800083c0:	00013403          	ld	s0,0(sp)
    800083c4:	01010113          	addi	sp,sp,16
    800083c8:	00008067          	ret

00000000800083cc <_ZN16ProducerKeyboardD0Ev>:
    800083cc:	fe010113          	addi	sp,sp,-32
    800083d0:	00113c23          	sd	ra,24(sp)
    800083d4:	00813823          	sd	s0,16(sp)
    800083d8:	00913423          	sd	s1,8(sp)
    800083dc:	02010413          	addi	s0,sp,32
    800083e0:	00050493          	mv	s1,a0
    800083e4:	00006797          	auipc	a5,0x6
    800083e8:	b2c78793          	addi	a5,a5,-1236 # 8000df10 <_ZTV16ProducerKeyboard+0x10>
    800083ec:	00f53023          	sd	a5,0(a0)
    800083f0:	ffff9097          	auipc	ra,0xffff9
    800083f4:	d5c080e7          	jalr	-676(ra) # 8000114c <_ZN6ThreadD1Ev>
    800083f8:	00048513          	mv	a0,s1
    800083fc:	ffff9097          	auipc	ra,0xffff9
    80008400:	de8080e7          	jalr	-536(ra) # 800011e4 <_ZdlPv>
    80008404:	01813083          	ld	ra,24(sp)
    80008408:	01013403          	ld	s0,16(sp)
    8000840c:	00813483          	ld	s1,8(sp)
    80008410:	02010113          	addi	sp,sp,32
    80008414:	00008067          	ret

0000000080008418 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80008418:	ff010113          	addi	sp,sp,-16
    8000841c:	00113423          	sd	ra,8(sp)
    80008420:	00813023          	sd	s0,0(sp)
    80008424:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80008428:	02053583          	ld	a1,32(a0)
    8000842c:	fffff097          	auipc	ra,0xfffff
    80008430:	7e4080e7          	jalr	2020(ra) # 80007c10 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80008434:	00813083          	ld	ra,8(sp)
    80008438:	00013403          	ld	s0,0(sp)
    8000843c:	01010113          	addi	sp,sp,16
    80008440:	00008067          	ret

0000000080008444 <_ZN12ProducerSync3runEv>:
    void run() override {
    80008444:	ff010113          	addi	sp,sp,-16
    80008448:	00113423          	sd	ra,8(sp)
    8000844c:	00813023          	sd	s0,0(sp)
    80008450:	01010413          	addi	s0,sp,16
        producer(td);
    80008454:	02053583          	ld	a1,32(a0)
    80008458:	00000097          	auipc	ra,0x0
    8000845c:	878080e7          	jalr	-1928(ra) # 80007cd0 <_ZN12ProducerSync8producerEPv>
    }
    80008460:	00813083          	ld	ra,8(sp)
    80008464:	00013403          	ld	s0,0(sp)
    80008468:	01010113          	addi	sp,sp,16
    8000846c:	00008067          	ret

0000000080008470 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80008470:	ff010113          	addi	sp,sp,-16
    80008474:	00113423          	sd	ra,8(sp)
    80008478:	00813023          	sd	s0,0(sp)
    8000847c:	01010413          	addi	s0,sp,16
        consumer(td);
    80008480:	02053583          	ld	a1,32(a0)
    80008484:	00000097          	auipc	ra,0x0
    80008488:	8e0080e7          	jalr	-1824(ra) # 80007d64 <_ZN12ConsumerSync8consumerEPv>
    }
    8000848c:	00813083          	ld	ra,8(sp)
    80008490:	00013403          	ld	s0,0(sp)
    80008494:	01010113          	addi	sp,sp,16
    80008498:	00008067          	ret

000000008000849c <start>:
    8000849c:	ff010113          	addi	sp,sp,-16
    800084a0:	00813423          	sd	s0,8(sp)
    800084a4:	01010413          	addi	s0,sp,16
    800084a8:	300027f3          	csrr	a5,mstatus
    800084ac:	ffffe737          	lui	a4,0xffffe
    800084b0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffef4ff>
    800084b4:	00e7f7b3          	and	a5,a5,a4
    800084b8:	00001737          	lui	a4,0x1
    800084bc:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800084c0:	00e7e7b3          	or	a5,a5,a4
    800084c4:	30079073          	csrw	mstatus,a5
    800084c8:	00000797          	auipc	a5,0x0
    800084cc:	16078793          	addi	a5,a5,352 # 80008628 <system_main>
    800084d0:	34179073          	csrw	mepc,a5
    800084d4:	00000793          	li	a5,0
    800084d8:	18079073          	csrw	satp,a5
    800084dc:	000107b7          	lui	a5,0x10
    800084e0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800084e4:	30279073          	csrw	medeleg,a5
    800084e8:	30379073          	csrw	mideleg,a5
    800084ec:	104027f3          	csrr	a5,sie
    800084f0:	2227e793          	ori	a5,a5,546
    800084f4:	10479073          	csrw	sie,a5
    800084f8:	fff00793          	li	a5,-1
    800084fc:	00a7d793          	srli	a5,a5,0xa
    80008500:	3b079073          	csrw	pmpaddr0,a5
    80008504:	00f00793          	li	a5,15
    80008508:	3a079073          	csrw	pmpcfg0,a5
    8000850c:	f14027f3          	csrr	a5,mhartid
    80008510:	0200c737          	lui	a4,0x200c
    80008514:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80008518:	0007869b          	sext.w	a3,a5
    8000851c:	00269713          	slli	a4,a3,0x2
    80008520:	000f4637          	lui	a2,0xf4
    80008524:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80008528:	00d70733          	add	a4,a4,a3
    8000852c:	0037979b          	slliw	a5,a5,0x3
    80008530:	020046b7          	lui	a3,0x2004
    80008534:	00d787b3          	add	a5,a5,a3
    80008538:	00c585b3          	add	a1,a1,a2
    8000853c:	00371693          	slli	a3,a4,0x3
    80008540:	00006717          	auipc	a4,0x6
    80008544:	b6070713          	addi	a4,a4,-1184 # 8000e0a0 <timer_scratch>
    80008548:	00b7b023          	sd	a1,0(a5)
    8000854c:	00d70733          	add	a4,a4,a3
    80008550:	00f73c23          	sd	a5,24(a4)
    80008554:	02c73023          	sd	a2,32(a4)
    80008558:	34071073          	csrw	mscratch,a4
    8000855c:	00000797          	auipc	a5,0x0
    80008560:	6e478793          	addi	a5,a5,1764 # 80008c40 <timervec>
    80008564:	30579073          	csrw	mtvec,a5
    80008568:	300027f3          	csrr	a5,mstatus
    8000856c:	0087e793          	ori	a5,a5,8
    80008570:	30079073          	csrw	mstatus,a5
    80008574:	304027f3          	csrr	a5,mie
    80008578:	0807e793          	ori	a5,a5,128
    8000857c:	30479073          	csrw	mie,a5
    80008580:	f14027f3          	csrr	a5,mhartid
    80008584:	0007879b          	sext.w	a5,a5
    80008588:	00078213          	mv	tp,a5
    8000858c:	30200073          	mret
    80008590:	00813403          	ld	s0,8(sp)
    80008594:	01010113          	addi	sp,sp,16
    80008598:	00008067          	ret

000000008000859c <timerinit>:
    8000859c:	ff010113          	addi	sp,sp,-16
    800085a0:	00813423          	sd	s0,8(sp)
    800085a4:	01010413          	addi	s0,sp,16
    800085a8:	f14027f3          	csrr	a5,mhartid
    800085ac:	0200c737          	lui	a4,0x200c
    800085b0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800085b4:	0007869b          	sext.w	a3,a5
    800085b8:	00269713          	slli	a4,a3,0x2
    800085bc:	000f4637          	lui	a2,0xf4
    800085c0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800085c4:	00d70733          	add	a4,a4,a3
    800085c8:	0037979b          	slliw	a5,a5,0x3
    800085cc:	020046b7          	lui	a3,0x2004
    800085d0:	00d787b3          	add	a5,a5,a3
    800085d4:	00c585b3          	add	a1,a1,a2
    800085d8:	00371693          	slli	a3,a4,0x3
    800085dc:	00006717          	auipc	a4,0x6
    800085e0:	ac470713          	addi	a4,a4,-1340 # 8000e0a0 <timer_scratch>
    800085e4:	00b7b023          	sd	a1,0(a5)
    800085e8:	00d70733          	add	a4,a4,a3
    800085ec:	00f73c23          	sd	a5,24(a4)
    800085f0:	02c73023          	sd	a2,32(a4)
    800085f4:	34071073          	csrw	mscratch,a4
    800085f8:	00000797          	auipc	a5,0x0
    800085fc:	64878793          	addi	a5,a5,1608 # 80008c40 <timervec>
    80008600:	30579073          	csrw	mtvec,a5
    80008604:	300027f3          	csrr	a5,mstatus
    80008608:	0087e793          	ori	a5,a5,8
    8000860c:	30079073          	csrw	mstatus,a5
    80008610:	304027f3          	csrr	a5,mie
    80008614:	0807e793          	ori	a5,a5,128
    80008618:	30479073          	csrw	mie,a5
    8000861c:	00813403          	ld	s0,8(sp)
    80008620:	01010113          	addi	sp,sp,16
    80008624:	00008067          	ret

0000000080008628 <system_main>:
    80008628:	fe010113          	addi	sp,sp,-32
    8000862c:	00813823          	sd	s0,16(sp)
    80008630:	00913423          	sd	s1,8(sp)
    80008634:	00113c23          	sd	ra,24(sp)
    80008638:	02010413          	addi	s0,sp,32
    8000863c:	00000097          	auipc	ra,0x0
    80008640:	0c4080e7          	jalr	196(ra) # 80008700 <cpuid>
    80008644:	00006497          	auipc	s1,0x6
    80008648:	99c48493          	addi	s1,s1,-1636 # 8000dfe0 <started>
    8000864c:	02050263          	beqz	a0,80008670 <system_main+0x48>
    80008650:	0004a783          	lw	a5,0(s1)
    80008654:	0007879b          	sext.w	a5,a5
    80008658:	fe078ce3          	beqz	a5,80008650 <system_main+0x28>
    8000865c:	0ff0000f          	fence
    80008660:	00003517          	auipc	a0,0x3
    80008664:	31050513          	addi	a0,a0,784 # 8000b970 <CONSOLE_STATUS+0x960>
    80008668:	00001097          	auipc	ra,0x1
    8000866c:	a74080e7          	jalr	-1420(ra) # 800090dc <panic>
    80008670:	00001097          	auipc	ra,0x1
    80008674:	9c8080e7          	jalr	-1592(ra) # 80009038 <consoleinit>
    80008678:	00001097          	auipc	ra,0x1
    8000867c:	154080e7          	jalr	340(ra) # 800097cc <printfinit>
    80008680:	00003517          	auipc	a0,0x3
    80008684:	17050513          	addi	a0,a0,368 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80008688:	00001097          	auipc	ra,0x1
    8000868c:	ab0080e7          	jalr	-1360(ra) # 80009138 <__printf>
    80008690:	00003517          	auipc	a0,0x3
    80008694:	2b050513          	addi	a0,a0,688 # 8000b940 <CONSOLE_STATUS+0x930>
    80008698:	00001097          	auipc	ra,0x1
    8000869c:	aa0080e7          	jalr	-1376(ra) # 80009138 <__printf>
    800086a0:	00003517          	auipc	a0,0x3
    800086a4:	15050513          	addi	a0,a0,336 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    800086a8:	00001097          	auipc	ra,0x1
    800086ac:	a90080e7          	jalr	-1392(ra) # 80009138 <__printf>
    800086b0:	00001097          	auipc	ra,0x1
    800086b4:	4a8080e7          	jalr	1192(ra) # 80009b58 <kinit>
    800086b8:	00000097          	auipc	ra,0x0
    800086bc:	148080e7          	jalr	328(ra) # 80008800 <trapinit>
    800086c0:	00000097          	auipc	ra,0x0
    800086c4:	16c080e7          	jalr	364(ra) # 8000882c <trapinithart>
    800086c8:	00000097          	auipc	ra,0x0
    800086cc:	5b8080e7          	jalr	1464(ra) # 80008c80 <plicinit>
    800086d0:	00000097          	auipc	ra,0x0
    800086d4:	5d8080e7          	jalr	1496(ra) # 80008ca8 <plicinithart>
    800086d8:	00000097          	auipc	ra,0x0
    800086dc:	078080e7          	jalr	120(ra) # 80008750 <userinit>
    800086e0:	0ff0000f          	fence
    800086e4:	00100793          	li	a5,1
    800086e8:	00003517          	auipc	a0,0x3
    800086ec:	27050513          	addi	a0,a0,624 # 8000b958 <CONSOLE_STATUS+0x948>
    800086f0:	00f4a023          	sw	a5,0(s1)
    800086f4:	00001097          	auipc	ra,0x1
    800086f8:	a44080e7          	jalr	-1468(ra) # 80009138 <__printf>
    800086fc:	0000006f          	j	800086fc <system_main+0xd4>

0000000080008700 <cpuid>:
    80008700:	ff010113          	addi	sp,sp,-16
    80008704:	00813423          	sd	s0,8(sp)
    80008708:	01010413          	addi	s0,sp,16
    8000870c:	00020513          	mv	a0,tp
    80008710:	00813403          	ld	s0,8(sp)
    80008714:	0005051b          	sext.w	a0,a0
    80008718:	01010113          	addi	sp,sp,16
    8000871c:	00008067          	ret

0000000080008720 <mycpu>:
    80008720:	ff010113          	addi	sp,sp,-16
    80008724:	00813423          	sd	s0,8(sp)
    80008728:	01010413          	addi	s0,sp,16
    8000872c:	00020793          	mv	a5,tp
    80008730:	00813403          	ld	s0,8(sp)
    80008734:	0007879b          	sext.w	a5,a5
    80008738:	00779793          	slli	a5,a5,0x7
    8000873c:	00007517          	auipc	a0,0x7
    80008740:	99450513          	addi	a0,a0,-1644 # 8000f0d0 <cpus>
    80008744:	00f50533          	add	a0,a0,a5
    80008748:	01010113          	addi	sp,sp,16
    8000874c:	00008067          	ret

0000000080008750 <userinit>:
    80008750:	ff010113          	addi	sp,sp,-16
    80008754:	00813423          	sd	s0,8(sp)
    80008758:	01010413          	addi	s0,sp,16
    8000875c:	00813403          	ld	s0,8(sp)
    80008760:	01010113          	addi	sp,sp,16
    80008764:	ffff9317          	auipc	t1,0xffff9
    80008768:	56c30067          	jr	1388(t1) # 80001cd0 <main>

000000008000876c <either_copyout>:
    8000876c:	ff010113          	addi	sp,sp,-16
    80008770:	00813023          	sd	s0,0(sp)
    80008774:	00113423          	sd	ra,8(sp)
    80008778:	01010413          	addi	s0,sp,16
    8000877c:	02051663          	bnez	a0,800087a8 <either_copyout+0x3c>
    80008780:	00058513          	mv	a0,a1
    80008784:	00060593          	mv	a1,a2
    80008788:	0006861b          	sext.w	a2,a3
    8000878c:	00002097          	auipc	ra,0x2
    80008790:	c58080e7          	jalr	-936(ra) # 8000a3e4 <__memmove>
    80008794:	00813083          	ld	ra,8(sp)
    80008798:	00013403          	ld	s0,0(sp)
    8000879c:	00000513          	li	a0,0
    800087a0:	01010113          	addi	sp,sp,16
    800087a4:	00008067          	ret
    800087a8:	00003517          	auipc	a0,0x3
    800087ac:	1f050513          	addi	a0,a0,496 # 8000b998 <CONSOLE_STATUS+0x988>
    800087b0:	00001097          	auipc	ra,0x1
    800087b4:	92c080e7          	jalr	-1748(ra) # 800090dc <panic>

00000000800087b8 <either_copyin>:
    800087b8:	ff010113          	addi	sp,sp,-16
    800087bc:	00813023          	sd	s0,0(sp)
    800087c0:	00113423          	sd	ra,8(sp)
    800087c4:	01010413          	addi	s0,sp,16
    800087c8:	02059463          	bnez	a1,800087f0 <either_copyin+0x38>
    800087cc:	00060593          	mv	a1,a2
    800087d0:	0006861b          	sext.w	a2,a3
    800087d4:	00002097          	auipc	ra,0x2
    800087d8:	c10080e7          	jalr	-1008(ra) # 8000a3e4 <__memmove>
    800087dc:	00813083          	ld	ra,8(sp)
    800087e0:	00013403          	ld	s0,0(sp)
    800087e4:	00000513          	li	a0,0
    800087e8:	01010113          	addi	sp,sp,16
    800087ec:	00008067          	ret
    800087f0:	00003517          	auipc	a0,0x3
    800087f4:	1d050513          	addi	a0,a0,464 # 8000b9c0 <CONSOLE_STATUS+0x9b0>
    800087f8:	00001097          	auipc	ra,0x1
    800087fc:	8e4080e7          	jalr	-1820(ra) # 800090dc <panic>

0000000080008800 <trapinit>:
    80008800:	ff010113          	addi	sp,sp,-16
    80008804:	00813423          	sd	s0,8(sp)
    80008808:	01010413          	addi	s0,sp,16
    8000880c:	00813403          	ld	s0,8(sp)
    80008810:	00003597          	auipc	a1,0x3
    80008814:	1d858593          	addi	a1,a1,472 # 8000b9e8 <CONSOLE_STATUS+0x9d8>
    80008818:	00007517          	auipc	a0,0x7
    8000881c:	93850513          	addi	a0,a0,-1736 # 8000f150 <tickslock>
    80008820:	01010113          	addi	sp,sp,16
    80008824:	00001317          	auipc	t1,0x1
    80008828:	5c430067          	jr	1476(t1) # 80009de8 <initlock>

000000008000882c <trapinithart>:
    8000882c:	ff010113          	addi	sp,sp,-16
    80008830:	00813423          	sd	s0,8(sp)
    80008834:	01010413          	addi	s0,sp,16
    80008838:	00000797          	auipc	a5,0x0
    8000883c:	2f878793          	addi	a5,a5,760 # 80008b30 <kernelvec>
    80008840:	10579073          	csrw	stvec,a5
    80008844:	00813403          	ld	s0,8(sp)
    80008848:	01010113          	addi	sp,sp,16
    8000884c:	00008067          	ret

0000000080008850 <usertrap>:
    80008850:	ff010113          	addi	sp,sp,-16
    80008854:	00813423          	sd	s0,8(sp)
    80008858:	01010413          	addi	s0,sp,16
    8000885c:	00813403          	ld	s0,8(sp)
    80008860:	01010113          	addi	sp,sp,16
    80008864:	00008067          	ret

0000000080008868 <usertrapret>:
    80008868:	ff010113          	addi	sp,sp,-16
    8000886c:	00813423          	sd	s0,8(sp)
    80008870:	01010413          	addi	s0,sp,16
    80008874:	00813403          	ld	s0,8(sp)
    80008878:	01010113          	addi	sp,sp,16
    8000887c:	00008067          	ret

0000000080008880 <kerneltrap>:
    80008880:	fe010113          	addi	sp,sp,-32
    80008884:	00813823          	sd	s0,16(sp)
    80008888:	00113c23          	sd	ra,24(sp)
    8000888c:	00913423          	sd	s1,8(sp)
    80008890:	02010413          	addi	s0,sp,32
    80008894:	142025f3          	csrr	a1,scause
    80008898:	100027f3          	csrr	a5,sstatus
    8000889c:	0027f793          	andi	a5,a5,2
    800088a0:	10079c63          	bnez	a5,800089b8 <kerneltrap+0x138>
    800088a4:	142027f3          	csrr	a5,scause
    800088a8:	0207ce63          	bltz	a5,800088e4 <kerneltrap+0x64>
    800088ac:	00003517          	auipc	a0,0x3
    800088b0:	18450513          	addi	a0,a0,388 # 8000ba30 <CONSOLE_STATUS+0xa20>
    800088b4:	00001097          	auipc	ra,0x1
    800088b8:	884080e7          	jalr	-1916(ra) # 80009138 <__printf>
    800088bc:	141025f3          	csrr	a1,sepc
    800088c0:	14302673          	csrr	a2,stval
    800088c4:	00003517          	auipc	a0,0x3
    800088c8:	17c50513          	addi	a0,a0,380 # 8000ba40 <CONSOLE_STATUS+0xa30>
    800088cc:	00001097          	auipc	ra,0x1
    800088d0:	86c080e7          	jalr	-1940(ra) # 80009138 <__printf>
    800088d4:	00003517          	auipc	a0,0x3
    800088d8:	18450513          	addi	a0,a0,388 # 8000ba58 <CONSOLE_STATUS+0xa48>
    800088dc:	00001097          	auipc	ra,0x1
    800088e0:	800080e7          	jalr	-2048(ra) # 800090dc <panic>
    800088e4:	0ff7f713          	andi	a4,a5,255
    800088e8:	00900693          	li	a3,9
    800088ec:	04d70063          	beq	a4,a3,8000892c <kerneltrap+0xac>
    800088f0:	fff00713          	li	a4,-1
    800088f4:	03f71713          	slli	a4,a4,0x3f
    800088f8:	00170713          	addi	a4,a4,1
    800088fc:	fae798e3          	bne	a5,a4,800088ac <kerneltrap+0x2c>
    80008900:	00000097          	auipc	ra,0x0
    80008904:	e00080e7          	jalr	-512(ra) # 80008700 <cpuid>
    80008908:	06050663          	beqz	a0,80008974 <kerneltrap+0xf4>
    8000890c:	144027f3          	csrr	a5,sip
    80008910:	ffd7f793          	andi	a5,a5,-3
    80008914:	14479073          	csrw	sip,a5
    80008918:	01813083          	ld	ra,24(sp)
    8000891c:	01013403          	ld	s0,16(sp)
    80008920:	00813483          	ld	s1,8(sp)
    80008924:	02010113          	addi	sp,sp,32
    80008928:	00008067          	ret
    8000892c:	00000097          	auipc	ra,0x0
    80008930:	3c8080e7          	jalr	968(ra) # 80008cf4 <plic_claim>
    80008934:	00a00793          	li	a5,10
    80008938:	00050493          	mv	s1,a0
    8000893c:	06f50863          	beq	a0,a5,800089ac <kerneltrap+0x12c>
    80008940:	fc050ce3          	beqz	a0,80008918 <kerneltrap+0x98>
    80008944:	00050593          	mv	a1,a0
    80008948:	00003517          	auipc	a0,0x3
    8000894c:	0c850513          	addi	a0,a0,200 # 8000ba10 <CONSOLE_STATUS+0xa00>
    80008950:	00000097          	auipc	ra,0x0
    80008954:	7e8080e7          	jalr	2024(ra) # 80009138 <__printf>
    80008958:	01013403          	ld	s0,16(sp)
    8000895c:	01813083          	ld	ra,24(sp)
    80008960:	00048513          	mv	a0,s1
    80008964:	00813483          	ld	s1,8(sp)
    80008968:	02010113          	addi	sp,sp,32
    8000896c:	00000317          	auipc	t1,0x0
    80008970:	3c030067          	jr	960(t1) # 80008d2c <plic_complete>
    80008974:	00006517          	auipc	a0,0x6
    80008978:	7dc50513          	addi	a0,a0,2012 # 8000f150 <tickslock>
    8000897c:	00001097          	auipc	ra,0x1
    80008980:	490080e7          	jalr	1168(ra) # 80009e0c <acquire>
    80008984:	00005717          	auipc	a4,0x5
    80008988:	66070713          	addi	a4,a4,1632 # 8000dfe4 <ticks>
    8000898c:	00072783          	lw	a5,0(a4)
    80008990:	00006517          	auipc	a0,0x6
    80008994:	7c050513          	addi	a0,a0,1984 # 8000f150 <tickslock>
    80008998:	0017879b          	addiw	a5,a5,1
    8000899c:	00f72023          	sw	a5,0(a4)
    800089a0:	00001097          	auipc	ra,0x1
    800089a4:	538080e7          	jalr	1336(ra) # 80009ed8 <release>
    800089a8:	f65ff06f          	j	8000890c <kerneltrap+0x8c>
    800089ac:	00001097          	auipc	ra,0x1
    800089b0:	094080e7          	jalr	148(ra) # 80009a40 <uartintr>
    800089b4:	fa5ff06f          	j	80008958 <kerneltrap+0xd8>
    800089b8:	00003517          	auipc	a0,0x3
    800089bc:	03850513          	addi	a0,a0,56 # 8000b9f0 <CONSOLE_STATUS+0x9e0>
    800089c0:	00000097          	auipc	ra,0x0
    800089c4:	71c080e7          	jalr	1820(ra) # 800090dc <panic>

00000000800089c8 <clockintr>:
    800089c8:	fe010113          	addi	sp,sp,-32
    800089cc:	00813823          	sd	s0,16(sp)
    800089d0:	00913423          	sd	s1,8(sp)
    800089d4:	00113c23          	sd	ra,24(sp)
    800089d8:	02010413          	addi	s0,sp,32
    800089dc:	00006497          	auipc	s1,0x6
    800089e0:	77448493          	addi	s1,s1,1908 # 8000f150 <tickslock>
    800089e4:	00048513          	mv	a0,s1
    800089e8:	00001097          	auipc	ra,0x1
    800089ec:	424080e7          	jalr	1060(ra) # 80009e0c <acquire>
    800089f0:	00005717          	auipc	a4,0x5
    800089f4:	5f470713          	addi	a4,a4,1524 # 8000dfe4 <ticks>
    800089f8:	00072783          	lw	a5,0(a4)
    800089fc:	01013403          	ld	s0,16(sp)
    80008a00:	01813083          	ld	ra,24(sp)
    80008a04:	00048513          	mv	a0,s1
    80008a08:	0017879b          	addiw	a5,a5,1
    80008a0c:	00813483          	ld	s1,8(sp)
    80008a10:	00f72023          	sw	a5,0(a4)
    80008a14:	02010113          	addi	sp,sp,32
    80008a18:	00001317          	auipc	t1,0x1
    80008a1c:	4c030067          	jr	1216(t1) # 80009ed8 <release>

0000000080008a20 <devintr>:
    80008a20:	142027f3          	csrr	a5,scause
    80008a24:	00000513          	li	a0,0
    80008a28:	0007c463          	bltz	a5,80008a30 <devintr+0x10>
    80008a2c:	00008067          	ret
    80008a30:	fe010113          	addi	sp,sp,-32
    80008a34:	00813823          	sd	s0,16(sp)
    80008a38:	00113c23          	sd	ra,24(sp)
    80008a3c:	00913423          	sd	s1,8(sp)
    80008a40:	02010413          	addi	s0,sp,32
    80008a44:	0ff7f713          	andi	a4,a5,255
    80008a48:	00900693          	li	a3,9
    80008a4c:	04d70c63          	beq	a4,a3,80008aa4 <devintr+0x84>
    80008a50:	fff00713          	li	a4,-1
    80008a54:	03f71713          	slli	a4,a4,0x3f
    80008a58:	00170713          	addi	a4,a4,1
    80008a5c:	00e78c63          	beq	a5,a4,80008a74 <devintr+0x54>
    80008a60:	01813083          	ld	ra,24(sp)
    80008a64:	01013403          	ld	s0,16(sp)
    80008a68:	00813483          	ld	s1,8(sp)
    80008a6c:	02010113          	addi	sp,sp,32
    80008a70:	00008067          	ret
    80008a74:	00000097          	auipc	ra,0x0
    80008a78:	c8c080e7          	jalr	-884(ra) # 80008700 <cpuid>
    80008a7c:	06050663          	beqz	a0,80008ae8 <devintr+0xc8>
    80008a80:	144027f3          	csrr	a5,sip
    80008a84:	ffd7f793          	andi	a5,a5,-3
    80008a88:	14479073          	csrw	sip,a5
    80008a8c:	01813083          	ld	ra,24(sp)
    80008a90:	01013403          	ld	s0,16(sp)
    80008a94:	00813483          	ld	s1,8(sp)
    80008a98:	00200513          	li	a0,2
    80008a9c:	02010113          	addi	sp,sp,32
    80008aa0:	00008067          	ret
    80008aa4:	00000097          	auipc	ra,0x0
    80008aa8:	250080e7          	jalr	592(ra) # 80008cf4 <plic_claim>
    80008aac:	00a00793          	li	a5,10
    80008ab0:	00050493          	mv	s1,a0
    80008ab4:	06f50663          	beq	a0,a5,80008b20 <devintr+0x100>
    80008ab8:	00100513          	li	a0,1
    80008abc:	fa0482e3          	beqz	s1,80008a60 <devintr+0x40>
    80008ac0:	00048593          	mv	a1,s1
    80008ac4:	00003517          	auipc	a0,0x3
    80008ac8:	f4c50513          	addi	a0,a0,-180 # 8000ba10 <CONSOLE_STATUS+0xa00>
    80008acc:	00000097          	auipc	ra,0x0
    80008ad0:	66c080e7          	jalr	1644(ra) # 80009138 <__printf>
    80008ad4:	00048513          	mv	a0,s1
    80008ad8:	00000097          	auipc	ra,0x0
    80008adc:	254080e7          	jalr	596(ra) # 80008d2c <plic_complete>
    80008ae0:	00100513          	li	a0,1
    80008ae4:	f7dff06f          	j	80008a60 <devintr+0x40>
    80008ae8:	00006517          	auipc	a0,0x6
    80008aec:	66850513          	addi	a0,a0,1640 # 8000f150 <tickslock>
    80008af0:	00001097          	auipc	ra,0x1
    80008af4:	31c080e7          	jalr	796(ra) # 80009e0c <acquire>
    80008af8:	00005717          	auipc	a4,0x5
    80008afc:	4ec70713          	addi	a4,a4,1260 # 8000dfe4 <ticks>
    80008b00:	00072783          	lw	a5,0(a4)
    80008b04:	00006517          	auipc	a0,0x6
    80008b08:	64c50513          	addi	a0,a0,1612 # 8000f150 <tickslock>
    80008b0c:	0017879b          	addiw	a5,a5,1
    80008b10:	00f72023          	sw	a5,0(a4)
    80008b14:	00001097          	auipc	ra,0x1
    80008b18:	3c4080e7          	jalr	964(ra) # 80009ed8 <release>
    80008b1c:	f65ff06f          	j	80008a80 <devintr+0x60>
    80008b20:	00001097          	auipc	ra,0x1
    80008b24:	f20080e7          	jalr	-224(ra) # 80009a40 <uartintr>
    80008b28:	fadff06f          	j	80008ad4 <devintr+0xb4>
    80008b2c:	0000                	unimp
	...

0000000080008b30 <kernelvec>:
    80008b30:	f0010113          	addi	sp,sp,-256
    80008b34:	00113023          	sd	ra,0(sp)
    80008b38:	00213423          	sd	sp,8(sp)
    80008b3c:	00313823          	sd	gp,16(sp)
    80008b40:	00413c23          	sd	tp,24(sp)
    80008b44:	02513023          	sd	t0,32(sp)
    80008b48:	02613423          	sd	t1,40(sp)
    80008b4c:	02713823          	sd	t2,48(sp)
    80008b50:	02813c23          	sd	s0,56(sp)
    80008b54:	04913023          	sd	s1,64(sp)
    80008b58:	04a13423          	sd	a0,72(sp)
    80008b5c:	04b13823          	sd	a1,80(sp)
    80008b60:	04c13c23          	sd	a2,88(sp)
    80008b64:	06d13023          	sd	a3,96(sp)
    80008b68:	06e13423          	sd	a4,104(sp)
    80008b6c:	06f13823          	sd	a5,112(sp)
    80008b70:	07013c23          	sd	a6,120(sp)
    80008b74:	09113023          	sd	a7,128(sp)
    80008b78:	09213423          	sd	s2,136(sp)
    80008b7c:	09313823          	sd	s3,144(sp)
    80008b80:	09413c23          	sd	s4,152(sp)
    80008b84:	0b513023          	sd	s5,160(sp)
    80008b88:	0b613423          	sd	s6,168(sp)
    80008b8c:	0b713823          	sd	s7,176(sp)
    80008b90:	0b813c23          	sd	s8,184(sp)
    80008b94:	0d913023          	sd	s9,192(sp)
    80008b98:	0da13423          	sd	s10,200(sp)
    80008b9c:	0db13823          	sd	s11,208(sp)
    80008ba0:	0dc13c23          	sd	t3,216(sp)
    80008ba4:	0fd13023          	sd	t4,224(sp)
    80008ba8:	0fe13423          	sd	t5,232(sp)
    80008bac:	0ff13823          	sd	t6,240(sp)
    80008bb0:	cd1ff0ef          	jal	ra,80008880 <kerneltrap>
    80008bb4:	00013083          	ld	ra,0(sp)
    80008bb8:	00813103          	ld	sp,8(sp)
    80008bbc:	01013183          	ld	gp,16(sp)
    80008bc0:	02013283          	ld	t0,32(sp)
    80008bc4:	02813303          	ld	t1,40(sp)
    80008bc8:	03013383          	ld	t2,48(sp)
    80008bcc:	03813403          	ld	s0,56(sp)
    80008bd0:	04013483          	ld	s1,64(sp)
    80008bd4:	04813503          	ld	a0,72(sp)
    80008bd8:	05013583          	ld	a1,80(sp)
    80008bdc:	05813603          	ld	a2,88(sp)
    80008be0:	06013683          	ld	a3,96(sp)
    80008be4:	06813703          	ld	a4,104(sp)
    80008be8:	07013783          	ld	a5,112(sp)
    80008bec:	07813803          	ld	a6,120(sp)
    80008bf0:	08013883          	ld	a7,128(sp)
    80008bf4:	08813903          	ld	s2,136(sp)
    80008bf8:	09013983          	ld	s3,144(sp)
    80008bfc:	09813a03          	ld	s4,152(sp)
    80008c00:	0a013a83          	ld	s5,160(sp)
    80008c04:	0a813b03          	ld	s6,168(sp)
    80008c08:	0b013b83          	ld	s7,176(sp)
    80008c0c:	0b813c03          	ld	s8,184(sp)
    80008c10:	0c013c83          	ld	s9,192(sp)
    80008c14:	0c813d03          	ld	s10,200(sp)
    80008c18:	0d013d83          	ld	s11,208(sp)
    80008c1c:	0d813e03          	ld	t3,216(sp)
    80008c20:	0e013e83          	ld	t4,224(sp)
    80008c24:	0e813f03          	ld	t5,232(sp)
    80008c28:	0f013f83          	ld	t6,240(sp)
    80008c2c:	10010113          	addi	sp,sp,256
    80008c30:	10200073          	sret
    80008c34:	00000013          	nop
    80008c38:	00000013          	nop
    80008c3c:	00000013          	nop

0000000080008c40 <timervec>:
    80008c40:	34051573          	csrrw	a0,mscratch,a0
    80008c44:	00b53023          	sd	a1,0(a0)
    80008c48:	00c53423          	sd	a2,8(a0)
    80008c4c:	00d53823          	sd	a3,16(a0)
    80008c50:	01853583          	ld	a1,24(a0)
    80008c54:	02053603          	ld	a2,32(a0)
    80008c58:	0005b683          	ld	a3,0(a1)
    80008c5c:	00c686b3          	add	a3,a3,a2
    80008c60:	00d5b023          	sd	a3,0(a1)
    80008c64:	00200593          	li	a1,2
    80008c68:	14459073          	csrw	sip,a1
    80008c6c:	01053683          	ld	a3,16(a0)
    80008c70:	00853603          	ld	a2,8(a0)
    80008c74:	00053583          	ld	a1,0(a0)
    80008c78:	34051573          	csrrw	a0,mscratch,a0
    80008c7c:	30200073          	mret

0000000080008c80 <plicinit>:
    80008c80:	ff010113          	addi	sp,sp,-16
    80008c84:	00813423          	sd	s0,8(sp)
    80008c88:	01010413          	addi	s0,sp,16
    80008c8c:	00813403          	ld	s0,8(sp)
    80008c90:	0c0007b7          	lui	a5,0xc000
    80008c94:	00100713          	li	a4,1
    80008c98:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80008c9c:	00e7a223          	sw	a4,4(a5)
    80008ca0:	01010113          	addi	sp,sp,16
    80008ca4:	00008067          	ret

0000000080008ca8 <plicinithart>:
    80008ca8:	ff010113          	addi	sp,sp,-16
    80008cac:	00813023          	sd	s0,0(sp)
    80008cb0:	00113423          	sd	ra,8(sp)
    80008cb4:	01010413          	addi	s0,sp,16
    80008cb8:	00000097          	auipc	ra,0x0
    80008cbc:	a48080e7          	jalr	-1464(ra) # 80008700 <cpuid>
    80008cc0:	0085171b          	slliw	a4,a0,0x8
    80008cc4:	0c0027b7          	lui	a5,0xc002
    80008cc8:	00e787b3          	add	a5,a5,a4
    80008ccc:	40200713          	li	a4,1026
    80008cd0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80008cd4:	00813083          	ld	ra,8(sp)
    80008cd8:	00013403          	ld	s0,0(sp)
    80008cdc:	00d5151b          	slliw	a0,a0,0xd
    80008ce0:	0c2017b7          	lui	a5,0xc201
    80008ce4:	00a78533          	add	a0,a5,a0
    80008ce8:	00052023          	sw	zero,0(a0)
    80008cec:	01010113          	addi	sp,sp,16
    80008cf0:	00008067          	ret

0000000080008cf4 <plic_claim>:
    80008cf4:	ff010113          	addi	sp,sp,-16
    80008cf8:	00813023          	sd	s0,0(sp)
    80008cfc:	00113423          	sd	ra,8(sp)
    80008d00:	01010413          	addi	s0,sp,16
    80008d04:	00000097          	auipc	ra,0x0
    80008d08:	9fc080e7          	jalr	-1540(ra) # 80008700 <cpuid>
    80008d0c:	00813083          	ld	ra,8(sp)
    80008d10:	00013403          	ld	s0,0(sp)
    80008d14:	00d5151b          	slliw	a0,a0,0xd
    80008d18:	0c2017b7          	lui	a5,0xc201
    80008d1c:	00a78533          	add	a0,a5,a0
    80008d20:	00452503          	lw	a0,4(a0)
    80008d24:	01010113          	addi	sp,sp,16
    80008d28:	00008067          	ret

0000000080008d2c <plic_complete>:
    80008d2c:	fe010113          	addi	sp,sp,-32
    80008d30:	00813823          	sd	s0,16(sp)
    80008d34:	00913423          	sd	s1,8(sp)
    80008d38:	00113c23          	sd	ra,24(sp)
    80008d3c:	02010413          	addi	s0,sp,32
    80008d40:	00050493          	mv	s1,a0
    80008d44:	00000097          	auipc	ra,0x0
    80008d48:	9bc080e7          	jalr	-1604(ra) # 80008700 <cpuid>
    80008d4c:	01813083          	ld	ra,24(sp)
    80008d50:	01013403          	ld	s0,16(sp)
    80008d54:	00d5179b          	slliw	a5,a0,0xd
    80008d58:	0c201737          	lui	a4,0xc201
    80008d5c:	00f707b3          	add	a5,a4,a5
    80008d60:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80008d64:	00813483          	ld	s1,8(sp)
    80008d68:	02010113          	addi	sp,sp,32
    80008d6c:	00008067          	ret

0000000080008d70 <consolewrite>:
    80008d70:	fb010113          	addi	sp,sp,-80
    80008d74:	04813023          	sd	s0,64(sp)
    80008d78:	04113423          	sd	ra,72(sp)
    80008d7c:	02913c23          	sd	s1,56(sp)
    80008d80:	03213823          	sd	s2,48(sp)
    80008d84:	03313423          	sd	s3,40(sp)
    80008d88:	03413023          	sd	s4,32(sp)
    80008d8c:	01513c23          	sd	s5,24(sp)
    80008d90:	05010413          	addi	s0,sp,80
    80008d94:	06c05c63          	blez	a2,80008e0c <consolewrite+0x9c>
    80008d98:	00060993          	mv	s3,a2
    80008d9c:	00050a13          	mv	s4,a0
    80008da0:	00058493          	mv	s1,a1
    80008da4:	00000913          	li	s2,0
    80008da8:	fff00a93          	li	s5,-1
    80008dac:	01c0006f          	j	80008dc8 <consolewrite+0x58>
    80008db0:	fbf44503          	lbu	a0,-65(s0)
    80008db4:	0019091b          	addiw	s2,s2,1
    80008db8:	00148493          	addi	s1,s1,1
    80008dbc:	00001097          	auipc	ra,0x1
    80008dc0:	a9c080e7          	jalr	-1380(ra) # 80009858 <uartputc>
    80008dc4:	03298063          	beq	s3,s2,80008de4 <consolewrite+0x74>
    80008dc8:	00048613          	mv	a2,s1
    80008dcc:	00100693          	li	a3,1
    80008dd0:	000a0593          	mv	a1,s4
    80008dd4:	fbf40513          	addi	a0,s0,-65
    80008dd8:	00000097          	auipc	ra,0x0
    80008ddc:	9e0080e7          	jalr	-1568(ra) # 800087b8 <either_copyin>
    80008de0:	fd5518e3          	bne	a0,s5,80008db0 <consolewrite+0x40>
    80008de4:	04813083          	ld	ra,72(sp)
    80008de8:	04013403          	ld	s0,64(sp)
    80008dec:	03813483          	ld	s1,56(sp)
    80008df0:	02813983          	ld	s3,40(sp)
    80008df4:	02013a03          	ld	s4,32(sp)
    80008df8:	01813a83          	ld	s5,24(sp)
    80008dfc:	00090513          	mv	a0,s2
    80008e00:	03013903          	ld	s2,48(sp)
    80008e04:	05010113          	addi	sp,sp,80
    80008e08:	00008067          	ret
    80008e0c:	00000913          	li	s2,0
    80008e10:	fd5ff06f          	j	80008de4 <consolewrite+0x74>

0000000080008e14 <consoleread>:
    80008e14:	f9010113          	addi	sp,sp,-112
    80008e18:	06813023          	sd	s0,96(sp)
    80008e1c:	04913c23          	sd	s1,88(sp)
    80008e20:	05213823          	sd	s2,80(sp)
    80008e24:	05313423          	sd	s3,72(sp)
    80008e28:	05413023          	sd	s4,64(sp)
    80008e2c:	03513c23          	sd	s5,56(sp)
    80008e30:	03613823          	sd	s6,48(sp)
    80008e34:	03713423          	sd	s7,40(sp)
    80008e38:	03813023          	sd	s8,32(sp)
    80008e3c:	06113423          	sd	ra,104(sp)
    80008e40:	01913c23          	sd	s9,24(sp)
    80008e44:	07010413          	addi	s0,sp,112
    80008e48:	00060b93          	mv	s7,a2
    80008e4c:	00050913          	mv	s2,a0
    80008e50:	00058c13          	mv	s8,a1
    80008e54:	00060b1b          	sext.w	s6,a2
    80008e58:	00006497          	auipc	s1,0x6
    80008e5c:	32048493          	addi	s1,s1,800 # 8000f178 <cons>
    80008e60:	00400993          	li	s3,4
    80008e64:	fff00a13          	li	s4,-1
    80008e68:	00a00a93          	li	s5,10
    80008e6c:	05705e63          	blez	s7,80008ec8 <consoleread+0xb4>
    80008e70:	09c4a703          	lw	a4,156(s1)
    80008e74:	0984a783          	lw	a5,152(s1)
    80008e78:	0007071b          	sext.w	a4,a4
    80008e7c:	08e78463          	beq	a5,a4,80008f04 <consoleread+0xf0>
    80008e80:	07f7f713          	andi	a4,a5,127
    80008e84:	00e48733          	add	a4,s1,a4
    80008e88:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80008e8c:	0017869b          	addiw	a3,a5,1
    80008e90:	08d4ac23          	sw	a3,152(s1)
    80008e94:	00070c9b          	sext.w	s9,a4
    80008e98:	0b370663          	beq	a4,s3,80008f44 <consoleread+0x130>
    80008e9c:	00100693          	li	a3,1
    80008ea0:	f9f40613          	addi	a2,s0,-97
    80008ea4:	000c0593          	mv	a1,s8
    80008ea8:	00090513          	mv	a0,s2
    80008eac:	f8e40fa3          	sb	a4,-97(s0)
    80008eb0:	00000097          	auipc	ra,0x0
    80008eb4:	8bc080e7          	jalr	-1860(ra) # 8000876c <either_copyout>
    80008eb8:	01450863          	beq	a0,s4,80008ec8 <consoleread+0xb4>
    80008ebc:	001c0c13          	addi	s8,s8,1
    80008ec0:	fffb8b9b          	addiw	s7,s7,-1
    80008ec4:	fb5c94e3          	bne	s9,s5,80008e6c <consoleread+0x58>
    80008ec8:	000b851b          	sext.w	a0,s7
    80008ecc:	06813083          	ld	ra,104(sp)
    80008ed0:	06013403          	ld	s0,96(sp)
    80008ed4:	05813483          	ld	s1,88(sp)
    80008ed8:	05013903          	ld	s2,80(sp)
    80008edc:	04813983          	ld	s3,72(sp)
    80008ee0:	04013a03          	ld	s4,64(sp)
    80008ee4:	03813a83          	ld	s5,56(sp)
    80008ee8:	02813b83          	ld	s7,40(sp)
    80008eec:	02013c03          	ld	s8,32(sp)
    80008ef0:	01813c83          	ld	s9,24(sp)
    80008ef4:	40ab053b          	subw	a0,s6,a0
    80008ef8:	03013b03          	ld	s6,48(sp)
    80008efc:	07010113          	addi	sp,sp,112
    80008f00:	00008067          	ret
    80008f04:	00001097          	auipc	ra,0x1
    80008f08:	1d8080e7          	jalr	472(ra) # 8000a0dc <push_on>
    80008f0c:	0984a703          	lw	a4,152(s1)
    80008f10:	09c4a783          	lw	a5,156(s1)
    80008f14:	0007879b          	sext.w	a5,a5
    80008f18:	fef70ce3          	beq	a4,a5,80008f10 <consoleread+0xfc>
    80008f1c:	00001097          	auipc	ra,0x1
    80008f20:	234080e7          	jalr	564(ra) # 8000a150 <pop_on>
    80008f24:	0984a783          	lw	a5,152(s1)
    80008f28:	07f7f713          	andi	a4,a5,127
    80008f2c:	00e48733          	add	a4,s1,a4
    80008f30:	01874703          	lbu	a4,24(a4)
    80008f34:	0017869b          	addiw	a3,a5,1
    80008f38:	08d4ac23          	sw	a3,152(s1)
    80008f3c:	00070c9b          	sext.w	s9,a4
    80008f40:	f5371ee3          	bne	a4,s3,80008e9c <consoleread+0x88>
    80008f44:	000b851b          	sext.w	a0,s7
    80008f48:	f96bf2e3          	bgeu	s7,s6,80008ecc <consoleread+0xb8>
    80008f4c:	08f4ac23          	sw	a5,152(s1)
    80008f50:	f7dff06f          	j	80008ecc <consoleread+0xb8>

0000000080008f54 <consputc>:
    80008f54:	10000793          	li	a5,256
    80008f58:	00f50663          	beq	a0,a5,80008f64 <consputc+0x10>
    80008f5c:	00001317          	auipc	t1,0x1
    80008f60:	9f430067          	jr	-1548(t1) # 80009950 <uartputc_sync>
    80008f64:	ff010113          	addi	sp,sp,-16
    80008f68:	00113423          	sd	ra,8(sp)
    80008f6c:	00813023          	sd	s0,0(sp)
    80008f70:	01010413          	addi	s0,sp,16
    80008f74:	00800513          	li	a0,8
    80008f78:	00001097          	auipc	ra,0x1
    80008f7c:	9d8080e7          	jalr	-1576(ra) # 80009950 <uartputc_sync>
    80008f80:	02000513          	li	a0,32
    80008f84:	00001097          	auipc	ra,0x1
    80008f88:	9cc080e7          	jalr	-1588(ra) # 80009950 <uartputc_sync>
    80008f8c:	00013403          	ld	s0,0(sp)
    80008f90:	00813083          	ld	ra,8(sp)
    80008f94:	00800513          	li	a0,8
    80008f98:	01010113          	addi	sp,sp,16
    80008f9c:	00001317          	auipc	t1,0x1
    80008fa0:	9b430067          	jr	-1612(t1) # 80009950 <uartputc_sync>

0000000080008fa4 <consoleintr>:
    80008fa4:	fe010113          	addi	sp,sp,-32
    80008fa8:	00813823          	sd	s0,16(sp)
    80008fac:	00913423          	sd	s1,8(sp)
    80008fb0:	01213023          	sd	s2,0(sp)
    80008fb4:	00113c23          	sd	ra,24(sp)
    80008fb8:	02010413          	addi	s0,sp,32
    80008fbc:	00006917          	auipc	s2,0x6
    80008fc0:	1bc90913          	addi	s2,s2,444 # 8000f178 <cons>
    80008fc4:	00050493          	mv	s1,a0
    80008fc8:	00090513          	mv	a0,s2
    80008fcc:	00001097          	auipc	ra,0x1
    80008fd0:	e40080e7          	jalr	-448(ra) # 80009e0c <acquire>
    80008fd4:	02048c63          	beqz	s1,8000900c <consoleintr+0x68>
    80008fd8:	0a092783          	lw	a5,160(s2)
    80008fdc:	09892703          	lw	a4,152(s2)
    80008fe0:	07f00693          	li	a3,127
    80008fe4:	40e7873b          	subw	a4,a5,a4
    80008fe8:	02e6e263          	bltu	a3,a4,8000900c <consoleintr+0x68>
    80008fec:	00d00713          	li	a4,13
    80008ff0:	04e48063          	beq	s1,a4,80009030 <consoleintr+0x8c>
    80008ff4:	07f7f713          	andi	a4,a5,127
    80008ff8:	00e90733          	add	a4,s2,a4
    80008ffc:	0017879b          	addiw	a5,a5,1
    80009000:	0af92023          	sw	a5,160(s2)
    80009004:	00970c23          	sb	s1,24(a4)
    80009008:	08f92e23          	sw	a5,156(s2)
    8000900c:	01013403          	ld	s0,16(sp)
    80009010:	01813083          	ld	ra,24(sp)
    80009014:	00813483          	ld	s1,8(sp)
    80009018:	00013903          	ld	s2,0(sp)
    8000901c:	00006517          	auipc	a0,0x6
    80009020:	15c50513          	addi	a0,a0,348 # 8000f178 <cons>
    80009024:	02010113          	addi	sp,sp,32
    80009028:	00001317          	auipc	t1,0x1
    8000902c:	eb030067          	jr	-336(t1) # 80009ed8 <release>
    80009030:	00a00493          	li	s1,10
    80009034:	fc1ff06f          	j	80008ff4 <consoleintr+0x50>

0000000080009038 <consoleinit>:
    80009038:	fe010113          	addi	sp,sp,-32
    8000903c:	00113c23          	sd	ra,24(sp)
    80009040:	00813823          	sd	s0,16(sp)
    80009044:	00913423          	sd	s1,8(sp)
    80009048:	02010413          	addi	s0,sp,32
    8000904c:	00006497          	auipc	s1,0x6
    80009050:	12c48493          	addi	s1,s1,300 # 8000f178 <cons>
    80009054:	00048513          	mv	a0,s1
    80009058:	00003597          	auipc	a1,0x3
    8000905c:	a1058593          	addi	a1,a1,-1520 # 8000ba68 <CONSOLE_STATUS+0xa58>
    80009060:	00001097          	auipc	ra,0x1
    80009064:	d88080e7          	jalr	-632(ra) # 80009de8 <initlock>
    80009068:	00000097          	auipc	ra,0x0
    8000906c:	7ac080e7          	jalr	1964(ra) # 80009814 <uartinit>
    80009070:	01813083          	ld	ra,24(sp)
    80009074:	01013403          	ld	s0,16(sp)
    80009078:	00000797          	auipc	a5,0x0
    8000907c:	d9c78793          	addi	a5,a5,-612 # 80008e14 <consoleread>
    80009080:	0af4bc23          	sd	a5,184(s1)
    80009084:	00000797          	auipc	a5,0x0
    80009088:	cec78793          	addi	a5,a5,-788 # 80008d70 <consolewrite>
    8000908c:	0cf4b023          	sd	a5,192(s1)
    80009090:	00813483          	ld	s1,8(sp)
    80009094:	02010113          	addi	sp,sp,32
    80009098:	00008067          	ret

000000008000909c <console_read>:
    8000909c:	ff010113          	addi	sp,sp,-16
    800090a0:	00813423          	sd	s0,8(sp)
    800090a4:	01010413          	addi	s0,sp,16
    800090a8:	00813403          	ld	s0,8(sp)
    800090ac:	00006317          	auipc	t1,0x6
    800090b0:	18433303          	ld	t1,388(t1) # 8000f230 <devsw+0x10>
    800090b4:	01010113          	addi	sp,sp,16
    800090b8:	00030067          	jr	t1

00000000800090bc <console_write>:
    800090bc:	ff010113          	addi	sp,sp,-16
    800090c0:	00813423          	sd	s0,8(sp)
    800090c4:	01010413          	addi	s0,sp,16
    800090c8:	00813403          	ld	s0,8(sp)
    800090cc:	00006317          	auipc	t1,0x6
    800090d0:	16c33303          	ld	t1,364(t1) # 8000f238 <devsw+0x18>
    800090d4:	01010113          	addi	sp,sp,16
    800090d8:	00030067          	jr	t1

00000000800090dc <panic>:
    800090dc:	fe010113          	addi	sp,sp,-32
    800090e0:	00113c23          	sd	ra,24(sp)
    800090e4:	00813823          	sd	s0,16(sp)
    800090e8:	00913423          	sd	s1,8(sp)
    800090ec:	02010413          	addi	s0,sp,32
    800090f0:	00050493          	mv	s1,a0
    800090f4:	00003517          	auipc	a0,0x3
    800090f8:	97c50513          	addi	a0,a0,-1668 # 8000ba70 <CONSOLE_STATUS+0xa60>
    800090fc:	00006797          	auipc	a5,0x6
    80009100:	1c07ae23          	sw	zero,476(a5) # 8000f2d8 <pr+0x18>
    80009104:	00000097          	auipc	ra,0x0
    80009108:	034080e7          	jalr	52(ra) # 80009138 <__printf>
    8000910c:	00048513          	mv	a0,s1
    80009110:	00000097          	auipc	ra,0x0
    80009114:	028080e7          	jalr	40(ra) # 80009138 <__printf>
    80009118:	00002517          	auipc	a0,0x2
    8000911c:	6d850513          	addi	a0,a0,1752 # 8000b7f0 <CONSOLE_STATUS+0x7e0>
    80009120:	00000097          	auipc	ra,0x0
    80009124:	018080e7          	jalr	24(ra) # 80009138 <__printf>
    80009128:	00100793          	li	a5,1
    8000912c:	00005717          	auipc	a4,0x5
    80009130:	eaf72e23          	sw	a5,-324(a4) # 8000dfe8 <panicked>
    80009134:	0000006f          	j	80009134 <panic+0x58>

0000000080009138 <__printf>:
    80009138:	f3010113          	addi	sp,sp,-208
    8000913c:	08813023          	sd	s0,128(sp)
    80009140:	07313423          	sd	s3,104(sp)
    80009144:	09010413          	addi	s0,sp,144
    80009148:	05813023          	sd	s8,64(sp)
    8000914c:	08113423          	sd	ra,136(sp)
    80009150:	06913c23          	sd	s1,120(sp)
    80009154:	07213823          	sd	s2,112(sp)
    80009158:	07413023          	sd	s4,96(sp)
    8000915c:	05513c23          	sd	s5,88(sp)
    80009160:	05613823          	sd	s6,80(sp)
    80009164:	05713423          	sd	s7,72(sp)
    80009168:	03913c23          	sd	s9,56(sp)
    8000916c:	03a13823          	sd	s10,48(sp)
    80009170:	03b13423          	sd	s11,40(sp)
    80009174:	00006317          	auipc	t1,0x6
    80009178:	14c30313          	addi	t1,t1,332 # 8000f2c0 <pr>
    8000917c:	01832c03          	lw	s8,24(t1)
    80009180:	00b43423          	sd	a1,8(s0)
    80009184:	00c43823          	sd	a2,16(s0)
    80009188:	00d43c23          	sd	a3,24(s0)
    8000918c:	02e43023          	sd	a4,32(s0)
    80009190:	02f43423          	sd	a5,40(s0)
    80009194:	03043823          	sd	a6,48(s0)
    80009198:	03143c23          	sd	a7,56(s0)
    8000919c:	00050993          	mv	s3,a0
    800091a0:	4a0c1663          	bnez	s8,8000964c <__printf+0x514>
    800091a4:	60098c63          	beqz	s3,800097bc <__printf+0x684>
    800091a8:	0009c503          	lbu	a0,0(s3)
    800091ac:	00840793          	addi	a5,s0,8
    800091b0:	f6f43c23          	sd	a5,-136(s0)
    800091b4:	00000493          	li	s1,0
    800091b8:	22050063          	beqz	a0,800093d8 <__printf+0x2a0>
    800091bc:	00002a37          	lui	s4,0x2
    800091c0:	00018ab7          	lui	s5,0x18
    800091c4:	000f4b37          	lui	s6,0xf4
    800091c8:	00989bb7          	lui	s7,0x989
    800091cc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800091d0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800091d4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800091d8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800091dc:	00148c9b          	addiw	s9,s1,1
    800091e0:	02500793          	li	a5,37
    800091e4:	01998933          	add	s2,s3,s9
    800091e8:	38f51263          	bne	a0,a5,8000956c <__printf+0x434>
    800091ec:	00094783          	lbu	a5,0(s2)
    800091f0:	00078c9b          	sext.w	s9,a5
    800091f4:	1e078263          	beqz	a5,800093d8 <__printf+0x2a0>
    800091f8:	0024849b          	addiw	s1,s1,2
    800091fc:	07000713          	li	a4,112
    80009200:	00998933          	add	s2,s3,s1
    80009204:	38e78a63          	beq	a5,a4,80009598 <__printf+0x460>
    80009208:	20f76863          	bltu	a4,a5,80009418 <__printf+0x2e0>
    8000920c:	42a78863          	beq	a5,a0,8000963c <__printf+0x504>
    80009210:	06400713          	li	a4,100
    80009214:	40e79663          	bne	a5,a4,80009620 <__printf+0x4e8>
    80009218:	f7843783          	ld	a5,-136(s0)
    8000921c:	0007a603          	lw	a2,0(a5)
    80009220:	00878793          	addi	a5,a5,8
    80009224:	f6f43c23          	sd	a5,-136(s0)
    80009228:	42064a63          	bltz	a2,8000965c <__printf+0x524>
    8000922c:	00a00713          	li	a4,10
    80009230:	02e677bb          	remuw	a5,a2,a4
    80009234:	00003d97          	auipc	s11,0x3
    80009238:	864d8d93          	addi	s11,s11,-1948 # 8000ba98 <digits>
    8000923c:	00900593          	li	a1,9
    80009240:	0006051b          	sext.w	a0,a2
    80009244:	00000c93          	li	s9,0
    80009248:	02079793          	slli	a5,a5,0x20
    8000924c:	0207d793          	srli	a5,a5,0x20
    80009250:	00fd87b3          	add	a5,s11,a5
    80009254:	0007c783          	lbu	a5,0(a5)
    80009258:	02e656bb          	divuw	a3,a2,a4
    8000925c:	f8f40023          	sb	a5,-128(s0)
    80009260:	14c5d863          	bge	a1,a2,800093b0 <__printf+0x278>
    80009264:	06300593          	li	a1,99
    80009268:	00100c93          	li	s9,1
    8000926c:	02e6f7bb          	remuw	a5,a3,a4
    80009270:	02079793          	slli	a5,a5,0x20
    80009274:	0207d793          	srli	a5,a5,0x20
    80009278:	00fd87b3          	add	a5,s11,a5
    8000927c:	0007c783          	lbu	a5,0(a5)
    80009280:	02e6d73b          	divuw	a4,a3,a4
    80009284:	f8f400a3          	sb	a5,-127(s0)
    80009288:	12a5f463          	bgeu	a1,a0,800093b0 <__printf+0x278>
    8000928c:	00a00693          	li	a3,10
    80009290:	00900593          	li	a1,9
    80009294:	02d777bb          	remuw	a5,a4,a3
    80009298:	02079793          	slli	a5,a5,0x20
    8000929c:	0207d793          	srli	a5,a5,0x20
    800092a0:	00fd87b3          	add	a5,s11,a5
    800092a4:	0007c503          	lbu	a0,0(a5)
    800092a8:	02d757bb          	divuw	a5,a4,a3
    800092ac:	f8a40123          	sb	a0,-126(s0)
    800092b0:	48e5f263          	bgeu	a1,a4,80009734 <__printf+0x5fc>
    800092b4:	06300513          	li	a0,99
    800092b8:	02d7f5bb          	remuw	a1,a5,a3
    800092bc:	02059593          	slli	a1,a1,0x20
    800092c0:	0205d593          	srli	a1,a1,0x20
    800092c4:	00bd85b3          	add	a1,s11,a1
    800092c8:	0005c583          	lbu	a1,0(a1)
    800092cc:	02d7d7bb          	divuw	a5,a5,a3
    800092d0:	f8b401a3          	sb	a1,-125(s0)
    800092d4:	48e57263          	bgeu	a0,a4,80009758 <__printf+0x620>
    800092d8:	3e700513          	li	a0,999
    800092dc:	02d7f5bb          	remuw	a1,a5,a3
    800092e0:	02059593          	slli	a1,a1,0x20
    800092e4:	0205d593          	srli	a1,a1,0x20
    800092e8:	00bd85b3          	add	a1,s11,a1
    800092ec:	0005c583          	lbu	a1,0(a1)
    800092f0:	02d7d7bb          	divuw	a5,a5,a3
    800092f4:	f8b40223          	sb	a1,-124(s0)
    800092f8:	46e57663          	bgeu	a0,a4,80009764 <__printf+0x62c>
    800092fc:	02d7f5bb          	remuw	a1,a5,a3
    80009300:	02059593          	slli	a1,a1,0x20
    80009304:	0205d593          	srli	a1,a1,0x20
    80009308:	00bd85b3          	add	a1,s11,a1
    8000930c:	0005c583          	lbu	a1,0(a1)
    80009310:	02d7d7bb          	divuw	a5,a5,a3
    80009314:	f8b402a3          	sb	a1,-123(s0)
    80009318:	46ea7863          	bgeu	s4,a4,80009788 <__printf+0x650>
    8000931c:	02d7f5bb          	remuw	a1,a5,a3
    80009320:	02059593          	slli	a1,a1,0x20
    80009324:	0205d593          	srli	a1,a1,0x20
    80009328:	00bd85b3          	add	a1,s11,a1
    8000932c:	0005c583          	lbu	a1,0(a1)
    80009330:	02d7d7bb          	divuw	a5,a5,a3
    80009334:	f8b40323          	sb	a1,-122(s0)
    80009338:	3eeaf863          	bgeu	s5,a4,80009728 <__printf+0x5f0>
    8000933c:	02d7f5bb          	remuw	a1,a5,a3
    80009340:	02059593          	slli	a1,a1,0x20
    80009344:	0205d593          	srli	a1,a1,0x20
    80009348:	00bd85b3          	add	a1,s11,a1
    8000934c:	0005c583          	lbu	a1,0(a1)
    80009350:	02d7d7bb          	divuw	a5,a5,a3
    80009354:	f8b403a3          	sb	a1,-121(s0)
    80009358:	42eb7e63          	bgeu	s6,a4,80009794 <__printf+0x65c>
    8000935c:	02d7f5bb          	remuw	a1,a5,a3
    80009360:	02059593          	slli	a1,a1,0x20
    80009364:	0205d593          	srli	a1,a1,0x20
    80009368:	00bd85b3          	add	a1,s11,a1
    8000936c:	0005c583          	lbu	a1,0(a1)
    80009370:	02d7d7bb          	divuw	a5,a5,a3
    80009374:	f8b40423          	sb	a1,-120(s0)
    80009378:	42ebfc63          	bgeu	s7,a4,800097b0 <__printf+0x678>
    8000937c:	02079793          	slli	a5,a5,0x20
    80009380:	0207d793          	srli	a5,a5,0x20
    80009384:	00fd8db3          	add	s11,s11,a5
    80009388:	000dc703          	lbu	a4,0(s11)
    8000938c:	00a00793          	li	a5,10
    80009390:	00900c93          	li	s9,9
    80009394:	f8e404a3          	sb	a4,-119(s0)
    80009398:	00065c63          	bgez	a2,800093b0 <__printf+0x278>
    8000939c:	f9040713          	addi	a4,s0,-112
    800093a0:	00f70733          	add	a4,a4,a5
    800093a4:	02d00693          	li	a3,45
    800093a8:	fed70823          	sb	a3,-16(a4)
    800093ac:	00078c93          	mv	s9,a5
    800093b0:	f8040793          	addi	a5,s0,-128
    800093b4:	01978cb3          	add	s9,a5,s9
    800093b8:	f7f40d13          	addi	s10,s0,-129
    800093bc:	000cc503          	lbu	a0,0(s9)
    800093c0:	fffc8c93          	addi	s9,s9,-1
    800093c4:	00000097          	auipc	ra,0x0
    800093c8:	b90080e7          	jalr	-1136(ra) # 80008f54 <consputc>
    800093cc:	ffac98e3          	bne	s9,s10,800093bc <__printf+0x284>
    800093d0:	00094503          	lbu	a0,0(s2)
    800093d4:	e00514e3          	bnez	a0,800091dc <__printf+0xa4>
    800093d8:	1a0c1663          	bnez	s8,80009584 <__printf+0x44c>
    800093dc:	08813083          	ld	ra,136(sp)
    800093e0:	08013403          	ld	s0,128(sp)
    800093e4:	07813483          	ld	s1,120(sp)
    800093e8:	07013903          	ld	s2,112(sp)
    800093ec:	06813983          	ld	s3,104(sp)
    800093f0:	06013a03          	ld	s4,96(sp)
    800093f4:	05813a83          	ld	s5,88(sp)
    800093f8:	05013b03          	ld	s6,80(sp)
    800093fc:	04813b83          	ld	s7,72(sp)
    80009400:	04013c03          	ld	s8,64(sp)
    80009404:	03813c83          	ld	s9,56(sp)
    80009408:	03013d03          	ld	s10,48(sp)
    8000940c:	02813d83          	ld	s11,40(sp)
    80009410:	0d010113          	addi	sp,sp,208
    80009414:	00008067          	ret
    80009418:	07300713          	li	a4,115
    8000941c:	1ce78a63          	beq	a5,a4,800095f0 <__printf+0x4b8>
    80009420:	07800713          	li	a4,120
    80009424:	1ee79e63          	bne	a5,a4,80009620 <__printf+0x4e8>
    80009428:	f7843783          	ld	a5,-136(s0)
    8000942c:	0007a703          	lw	a4,0(a5)
    80009430:	00878793          	addi	a5,a5,8
    80009434:	f6f43c23          	sd	a5,-136(s0)
    80009438:	28074263          	bltz	a4,800096bc <__printf+0x584>
    8000943c:	00002d97          	auipc	s11,0x2
    80009440:	65cd8d93          	addi	s11,s11,1628 # 8000ba98 <digits>
    80009444:	00f77793          	andi	a5,a4,15
    80009448:	00fd87b3          	add	a5,s11,a5
    8000944c:	0007c683          	lbu	a3,0(a5)
    80009450:	00f00613          	li	a2,15
    80009454:	0007079b          	sext.w	a5,a4
    80009458:	f8d40023          	sb	a3,-128(s0)
    8000945c:	0047559b          	srliw	a1,a4,0x4
    80009460:	0047569b          	srliw	a3,a4,0x4
    80009464:	00000c93          	li	s9,0
    80009468:	0ee65063          	bge	a2,a4,80009548 <__printf+0x410>
    8000946c:	00f6f693          	andi	a3,a3,15
    80009470:	00dd86b3          	add	a3,s11,a3
    80009474:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80009478:	0087d79b          	srliw	a5,a5,0x8
    8000947c:	00100c93          	li	s9,1
    80009480:	f8d400a3          	sb	a3,-127(s0)
    80009484:	0cb67263          	bgeu	a2,a1,80009548 <__printf+0x410>
    80009488:	00f7f693          	andi	a3,a5,15
    8000948c:	00dd86b3          	add	a3,s11,a3
    80009490:	0006c583          	lbu	a1,0(a3)
    80009494:	00f00613          	li	a2,15
    80009498:	0047d69b          	srliw	a3,a5,0x4
    8000949c:	f8b40123          	sb	a1,-126(s0)
    800094a0:	0047d593          	srli	a1,a5,0x4
    800094a4:	28f67e63          	bgeu	a2,a5,80009740 <__printf+0x608>
    800094a8:	00f6f693          	andi	a3,a3,15
    800094ac:	00dd86b3          	add	a3,s11,a3
    800094b0:	0006c503          	lbu	a0,0(a3)
    800094b4:	0087d813          	srli	a6,a5,0x8
    800094b8:	0087d69b          	srliw	a3,a5,0x8
    800094bc:	f8a401a3          	sb	a0,-125(s0)
    800094c0:	28b67663          	bgeu	a2,a1,8000974c <__printf+0x614>
    800094c4:	00f6f693          	andi	a3,a3,15
    800094c8:	00dd86b3          	add	a3,s11,a3
    800094cc:	0006c583          	lbu	a1,0(a3)
    800094d0:	00c7d513          	srli	a0,a5,0xc
    800094d4:	00c7d69b          	srliw	a3,a5,0xc
    800094d8:	f8b40223          	sb	a1,-124(s0)
    800094dc:	29067a63          	bgeu	a2,a6,80009770 <__printf+0x638>
    800094e0:	00f6f693          	andi	a3,a3,15
    800094e4:	00dd86b3          	add	a3,s11,a3
    800094e8:	0006c583          	lbu	a1,0(a3)
    800094ec:	0107d813          	srli	a6,a5,0x10
    800094f0:	0107d69b          	srliw	a3,a5,0x10
    800094f4:	f8b402a3          	sb	a1,-123(s0)
    800094f8:	28a67263          	bgeu	a2,a0,8000977c <__printf+0x644>
    800094fc:	00f6f693          	andi	a3,a3,15
    80009500:	00dd86b3          	add	a3,s11,a3
    80009504:	0006c683          	lbu	a3,0(a3)
    80009508:	0147d79b          	srliw	a5,a5,0x14
    8000950c:	f8d40323          	sb	a3,-122(s0)
    80009510:	21067663          	bgeu	a2,a6,8000971c <__printf+0x5e4>
    80009514:	02079793          	slli	a5,a5,0x20
    80009518:	0207d793          	srli	a5,a5,0x20
    8000951c:	00fd8db3          	add	s11,s11,a5
    80009520:	000dc683          	lbu	a3,0(s11)
    80009524:	00800793          	li	a5,8
    80009528:	00700c93          	li	s9,7
    8000952c:	f8d403a3          	sb	a3,-121(s0)
    80009530:	00075c63          	bgez	a4,80009548 <__printf+0x410>
    80009534:	f9040713          	addi	a4,s0,-112
    80009538:	00f70733          	add	a4,a4,a5
    8000953c:	02d00693          	li	a3,45
    80009540:	fed70823          	sb	a3,-16(a4)
    80009544:	00078c93          	mv	s9,a5
    80009548:	f8040793          	addi	a5,s0,-128
    8000954c:	01978cb3          	add	s9,a5,s9
    80009550:	f7f40d13          	addi	s10,s0,-129
    80009554:	000cc503          	lbu	a0,0(s9)
    80009558:	fffc8c93          	addi	s9,s9,-1
    8000955c:	00000097          	auipc	ra,0x0
    80009560:	9f8080e7          	jalr	-1544(ra) # 80008f54 <consputc>
    80009564:	ff9d18e3          	bne	s10,s9,80009554 <__printf+0x41c>
    80009568:	0100006f          	j	80009578 <__printf+0x440>
    8000956c:	00000097          	auipc	ra,0x0
    80009570:	9e8080e7          	jalr	-1560(ra) # 80008f54 <consputc>
    80009574:	000c8493          	mv	s1,s9
    80009578:	00094503          	lbu	a0,0(s2)
    8000957c:	c60510e3          	bnez	a0,800091dc <__printf+0xa4>
    80009580:	e40c0ee3          	beqz	s8,800093dc <__printf+0x2a4>
    80009584:	00006517          	auipc	a0,0x6
    80009588:	d3c50513          	addi	a0,a0,-708 # 8000f2c0 <pr>
    8000958c:	00001097          	auipc	ra,0x1
    80009590:	94c080e7          	jalr	-1716(ra) # 80009ed8 <release>
    80009594:	e49ff06f          	j	800093dc <__printf+0x2a4>
    80009598:	f7843783          	ld	a5,-136(s0)
    8000959c:	03000513          	li	a0,48
    800095a0:	01000d13          	li	s10,16
    800095a4:	00878713          	addi	a4,a5,8
    800095a8:	0007bc83          	ld	s9,0(a5)
    800095ac:	f6e43c23          	sd	a4,-136(s0)
    800095b0:	00000097          	auipc	ra,0x0
    800095b4:	9a4080e7          	jalr	-1628(ra) # 80008f54 <consputc>
    800095b8:	07800513          	li	a0,120
    800095bc:	00000097          	auipc	ra,0x0
    800095c0:	998080e7          	jalr	-1640(ra) # 80008f54 <consputc>
    800095c4:	00002d97          	auipc	s11,0x2
    800095c8:	4d4d8d93          	addi	s11,s11,1236 # 8000ba98 <digits>
    800095cc:	03ccd793          	srli	a5,s9,0x3c
    800095d0:	00fd87b3          	add	a5,s11,a5
    800095d4:	0007c503          	lbu	a0,0(a5)
    800095d8:	fffd0d1b          	addiw	s10,s10,-1
    800095dc:	004c9c93          	slli	s9,s9,0x4
    800095e0:	00000097          	auipc	ra,0x0
    800095e4:	974080e7          	jalr	-1676(ra) # 80008f54 <consputc>
    800095e8:	fe0d12e3          	bnez	s10,800095cc <__printf+0x494>
    800095ec:	f8dff06f          	j	80009578 <__printf+0x440>
    800095f0:	f7843783          	ld	a5,-136(s0)
    800095f4:	0007bc83          	ld	s9,0(a5)
    800095f8:	00878793          	addi	a5,a5,8
    800095fc:	f6f43c23          	sd	a5,-136(s0)
    80009600:	000c9a63          	bnez	s9,80009614 <__printf+0x4dc>
    80009604:	1080006f          	j	8000970c <__printf+0x5d4>
    80009608:	001c8c93          	addi	s9,s9,1
    8000960c:	00000097          	auipc	ra,0x0
    80009610:	948080e7          	jalr	-1720(ra) # 80008f54 <consputc>
    80009614:	000cc503          	lbu	a0,0(s9)
    80009618:	fe0518e3          	bnez	a0,80009608 <__printf+0x4d0>
    8000961c:	f5dff06f          	j	80009578 <__printf+0x440>
    80009620:	02500513          	li	a0,37
    80009624:	00000097          	auipc	ra,0x0
    80009628:	930080e7          	jalr	-1744(ra) # 80008f54 <consputc>
    8000962c:	000c8513          	mv	a0,s9
    80009630:	00000097          	auipc	ra,0x0
    80009634:	924080e7          	jalr	-1756(ra) # 80008f54 <consputc>
    80009638:	f41ff06f          	j	80009578 <__printf+0x440>
    8000963c:	02500513          	li	a0,37
    80009640:	00000097          	auipc	ra,0x0
    80009644:	914080e7          	jalr	-1772(ra) # 80008f54 <consputc>
    80009648:	f31ff06f          	j	80009578 <__printf+0x440>
    8000964c:	00030513          	mv	a0,t1
    80009650:	00000097          	auipc	ra,0x0
    80009654:	7bc080e7          	jalr	1980(ra) # 80009e0c <acquire>
    80009658:	b4dff06f          	j	800091a4 <__printf+0x6c>
    8000965c:	40c0053b          	negw	a0,a2
    80009660:	00a00713          	li	a4,10
    80009664:	02e576bb          	remuw	a3,a0,a4
    80009668:	00002d97          	auipc	s11,0x2
    8000966c:	430d8d93          	addi	s11,s11,1072 # 8000ba98 <digits>
    80009670:	ff700593          	li	a1,-9
    80009674:	02069693          	slli	a3,a3,0x20
    80009678:	0206d693          	srli	a3,a3,0x20
    8000967c:	00dd86b3          	add	a3,s11,a3
    80009680:	0006c683          	lbu	a3,0(a3)
    80009684:	02e557bb          	divuw	a5,a0,a4
    80009688:	f8d40023          	sb	a3,-128(s0)
    8000968c:	10b65e63          	bge	a2,a1,800097a8 <__printf+0x670>
    80009690:	06300593          	li	a1,99
    80009694:	02e7f6bb          	remuw	a3,a5,a4
    80009698:	02069693          	slli	a3,a3,0x20
    8000969c:	0206d693          	srli	a3,a3,0x20
    800096a0:	00dd86b3          	add	a3,s11,a3
    800096a4:	0006c683          	lbu	a3,0(a3)
    800096a8:	02e7d73b          	divuw	a4,a5,a4
    800096ac:	00200793          	li	a5,2
    800096b0:	f8d400a3          	sb	a3,-127(s0)
    800096b4:	bca5ece3          	bltu	a1,a0,8000928c <__printf+0x154>
    800096b8:	ce5ff06f          	j	8000939c <__printf+0x264>
    800096bc:	40e007bb          	negw	a5,a4
    800096c0:	00002d97          	auipc	s11,0x2
    800096c4:	3d8d8d93          	addi	s11,s11,984 # 8000ba98 <digits>
    800096c8:	00f7f693          	andi	a3,a5,15
    800096cc:	00dd86b3          	add	a3,s11,a3
    800096d0:	0006c583          	lbu	a1,0(a3)
    800096d4:	ff100613          	li	a2,-15
    800096d8:	0047d69b          	srliw	a3,a5,0x4
    800096dc:	f8b40023          	sb	a1,-128(s0)
    800096e0:	0047d59b          	srliw	a1,a5,0x4
    800096e4:	0ac75e63          	bge	a4,a2,800097a0 <__printf+0x668>
    800096e8:	00f6f693          	andi	a3,a3,15
    800096ec:	00dd86b3          	add	a3,s11,a3
    800096f0:	0006c603          	lbu	a2,0(a3)
    800096f4:	00f00693          	li	a3,15
    800096f8:	0087d79b          	srliw	a5,a5,0x8
    800096fc:	f8c400a3          	sb	a2,-127(s0)
    80009700:	d8b6e4e3          	bltu	a3,a1,80009488 <__printf+0x350>
    80009704:	00200793          	li	a5,2
    80009708:	e2dff06f          	j	80009534 <__printf+0x3fc>
    8000970c:	00002c97          	auipc	s9,0x2
    80009710:	36cc8c93          	addi	s9,s9,876 # 8000ba78 <CONSOLE_STATUS+0xa68>
    80009714:	02800513          	li	a0,40
    80009718:	ef1ff06f          	j	80009608 <__printf+0x4d0>
    8000971c:	00700793          	li	a5,7
    80009720:	00600c93          	li	s9,6
    80009724:	e0dff06f          	j	80009530 <__printf+0x3f8>
    80009728:	00700793          	li	a5,7
    8000972c:	00600c93          	li	s9,6
    80009730:	c69ff06f          	j	80009398 <__printf+0x260>
    80009734:	00300793          	li	a5,3
    80009738:	00200c93          	li	s9,2
    8000973c:	c5dff06f          	j	80009398 <__printf+0x260>
    80009740:	00300793          	li	a5,3
    80009744:	00200c93          	li	s9,2
    80009748:	de9ff06f          	j	80009530 <__printf+0x3f8>
    8000974c:	00400793          	li	a5,4
    80009750:	00300c93          	li	s9,3
    80009754:	dddff06f          	j	80009530 <__printf+0x3f8>
    80009758:	00400793          	li	a5,4
    8000975c:	00300c93          	li	s9,3
    80009760:	c39ff06f          	j	80009398 <__printf+0x260>
    80009764:	00500793          	li	a5,5
    80009768:	00400c93          	li	s9,4
    8000976c:	c2dff06f          	j	80009398 <__printf+0x260>
    80009770:	00500793          	li	a5,5
    80009774:	00400c93          	li	s9,4
    80009778:	db9ff06f          	j	80009530 <__printf+0x3f8>
    8000977c:	00600793          	li	a5,6
    80009780:	00500c93          	li	s9,5
    80009784:	dadff06f          	j	80009530 <__printf+0x3f8>
    80009788:	00600793          	li	a5,6
    8000978c:	00500c93          	li	s9,5
    80009790:	c09ff06f          	j	80009398 <__printf+0x260>
    80009794:	00800793          	li	a5,8
    80009798:	00700c93          	li	s9,7
    8000979c:	bfdff06f          	j	80009398 <__printf+0x260>
    800097a0:	00100793          	li	a5,1
    800097a4:	d91ff06f          	j	80009534 <__printf+0x3fc>
    800097a8:	00100793          	li	a5,1
    800097ac:	bf1ff06f          	j	8000939c <__printf+0x264>
    800097b0:	00900793          	li	a5,9
    800097b4:	00800c93          	li	s9,8
    800097b8:	be1ff06f          	j	80009398 <__printf+0x260>
    800097bc:	00002517          	auipc	a0,0x2
    800097c0:	2c450513          	addi	a0,a0,708 # 8000ba80 <CONSOLE_STATUS+0xa70>
    800097c4:	00000097          	auipc	ra,0x0
    800097c8:	918080e7          	jalr	-1768(ra) # 800090dc <panic>

00000000800097cc <printfinit>:
    800097cc:	fe010113          	addi	sp,sp,-32
    800097d0:	00813823          	sd	s0,16(sp)
    800097d4:	00913423          	sd	s1,8(sp)
    800097d8:	00113c23          	sd	ra,24(sp)
    800097dc:	02010413          	addi	s0,sp,32
    800097e0:	00006497          	auipc	s1,0x6
    800097e4:	ae048493          	addi	s1,s1,-1312 # 8000f2c0 <pr>
    800097e8:	00048513          	mv	a0,s1
    800097ec:	00002597          	auipc	a1,0x2
    800097f0:	2a458593          	addi	a1,a1,676 # 8000ba90 <CONSOLE_STATUS+0xa80>
    800097f4:	00000097          	auipc	ra,0x0
    800097f8:	5f4080e7          	jalr	1524(ra) # 80009de8 <initlock>
    800097fc:	01813083          	ld	ra,24(sp)
    80009800:	01013403          	ld	s0,16(sp)
    80009804:	0004ac23          	sw	zero,24(s1)
    80009808:	00813483          	ld	s1,8(sp)
    8000980c:	02010113          	addi	sp,sp,32
    80009810:	00008067          	ret

0000000080009814 <uartinit>:
    80009814:	ff010113          	addi	sp,sp,-16
    80009818:	00813423          	sd	s0,8(sp)
    8000981c:	01010413          	addi	s0,sp,16
    80009820:	100007b7          	lui	a5,0x10000
    80009824:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80009828:	f8000713          	li	a4,-128
    8000982c:	00e781a3          	sb	a4,3(a5)
    80009830:	00300713          	li	a4,3
    80009834:	00e78023          	sb	a4,0(a5)
    80009838:	000780a3          	sb	zero,1(a5)
    8000983c:	00e781a3          	sb	a4,3(a5)
    80009840:	00700693          	li	a3,7
    80009844:	00d78123          	sb	a3,2(a5)
    80009848:	00e780a3          	sb	a4,1(a5)
    8000984c:	00813403          	ld	s0,8(sp)
    80009850:	01010113          	addi	sp,sp,16
    80009854:	00008067          	ret

0000000080009858 <uartputc>:
    80009858:	00004797          	auipc	a5,0x4
    8000985c:	7907a783          	lw	a5,1936(a5) # 8000dfe8 <panicked>
    80009860:	00078463          	beqz	a5,80009868 <uartputc+0x10>
    80009864:	0000006f          	j	80009864 <uartputc+0xc>
    80009868:	fd010113          	addi	sp,sp,-48
    8000986c:	02813023          	sd	s0,32(sp)
    80009870:	00913c23          	sd	s1,24(sp)
    80009874:	01213823          	sd	s2,16(sp)
    80009878:	01313423          	sd	s3,8(sp)
    8000987c:	02113423          	sd	ra,40(sp)
    80009880:	03010413          	addi	s0,sp,48
    80009884:	00004917          	auipc	s2,0x4
    80009888:	76c90913          	addi	s2,s2,1900 # 8000dff0 <uart_tx_r>
    8000988c:	00093783          	ld	a5,0(s2)
    80009890:	00004497          	auipc	s1,0x4
    80009894:	76848493          	addi	s1,s1,1896 # 8000dff8 <uart_tx_w>
    80009898:	0004b703          	ld	a4,0(s1)
    8000989c:	02078693          	addi	a3,a5,32
    800098a0:	00050993          	mv	s3,a0
    800098a4:	02e69c63          	bne	a3,a4,800098dc <uartputc+0x84>
    800098a8:	00001097          	auipc	ra,0x1
    800098ac:	834080e7          	jalr	-1996(ra) # 8000a0dc <push_on>
    800098b0:	00093783          	ld	a5,0(s2)
    800098b4:	0004b703          	ld	a4,0(s1)
    800098b8:	02078793          	addi	a5,a5,32
    800098bc:	00e79463          	bne	a5,a4,800098c4 <uartputc+0x6c>
    800098c0:	0000006f          	j	800098c0 <uartputc+0x68>
    800098c4:	00001097          	auipc	ra,0x1
    800098c8:	88c080e7          	jalr	-1908(ra) # 8000a150 <pop_on>
    800098cc:	00093783          	ld	a5,0(s2)
    800098d0:	0004b703          	ld	a4,0(s1)
    800098d4:	02078693          	addi	a3,a5,32
    800098d8:	fce688e3          	beq	a3,a4,800098a8 <uartputc+0x50>
    800098dc:	01f77693          	andi	a3,a4,31
    800098e0:	00006597          	auipc	a1,0x6
    800098e4:	a0058593          	addi	a1,a1,-1536 # 8000f2e0 <uart_tx_buf>
    800098e8:	00d586b3          	add	a3,a1,a3
    800098ec:	00170713          	addi	a4,a4,1
    800098f0:	01368023          	sb	s3,0(a3)
    800098f4:	00e4b023          	sd	a4,0(s1)
    800098f8:	10000637          	lui	a2,0x10000
    800098fc:	02f71063          	bne	a4,a5,8000991c <uartputc+0xc4>
    80009900:	0340006f          	j	80009934 <uartputc+0xdc>
    80009904:	00074703          	lbu	a4,0(a4)
    80009908:	00f93023          	sd	a5,0(s2)
    8000990c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80009910:	00093783          	ld	a5,0(s2)
    80009914:	0004b703          	ld	a4,0(s1)
    80009918:	00f70e63          	beq	a4,a5,80009934 <uartputc+0xdc>
    8000991c:	00564683          	lbu	a3,5(a2)
    80009920:	01f7f713          	andi	a4,a5,31
    80009924:	00e58733          	add	a4,a1,a4
    80009928:	0206f693          	andi	a3,a3,32
    8000992c:	00178793          	addi	a5,a5,1
    80009930:	fc069ae3          	bnez	a3,80009904 <uartputc+0xac>
    80009934:	02813083          	ld	ra,40(sp)
    80009938:	02013403          	ld	s0,32(sp)
    8000993c:	01813483          	ld	s1,24(sp)
    80009940:	01013903          	ld	s2,16(sp)
    80009944:	00813983          	ld	s3,8(sp)
    80009948:	03010113          	addi	sp,sp,48
    8000994c:	00008067          	ret

0000000080009950 <uartputc_sync>:
    80009950:	ff010113          	addi	sp,sp,-16
    80009954:	00813423          	sd	s0,8(sp)
    80009958:	01010413          	addi	s0,sp,16
    8000995c:	00004717          	auipc	a4,0x4
    80009960:	68c72703          	lw	a4,1676(a4) # 8000dfe8 <panicked>
    80009964:	02071663          	bnez	a4,80009990 <uartputc_sync+0x40>
    80009968:	00050793          	mv	a5,a0
    8000996c:	100006b7          	lui	a3,0x10000
    80009970:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80009974:	02077713          	andi	a4,a4,32
    80009978:	fe070ce3          	beqz	a4,80009970 <uartputc_sync+0x20>
    8000997c:	0ff7f793          	andi	a5,a5,255
    80009980:	00f68023          	sb	a5,0(a3)
    80009984:	00813403          	ld	s0,8(sp)
    80009988:	01010113          	addi	sp,sp,16
    8000998c:	00008067          	ret
    80009990:	0000006f          	j	80009990 <uartputc_sync+0x40>

0000000080009994 <uartstart>:
    80009994:	ff010113          	addi	sp,sp,-16
    80009998:	00813423          	sd	s0,8(sp)
    8000999c:	01010413          	addi	s0,sp,16
    800099a0:	00004617          	auipc	a2,0x4
    800099a4:	65060613          	addi	a2,a2,1616 # 8000dff0 <uart_tx_r>
    800099a8:	00004517          	auipc	a0,0x4
    800099ac:	65050513          	addi	a0,a0,1616 # 8000dff8 <uart_tx_w>
    800099b0:	00063783          	ld	a5,0(a2)
    800099b4:	00053703          	ld	a4,0(a0)
    800099b8:	04f70263          	beq	a4,a5,800099fc <uartstart+0x68>
    800099bc:	100005b7          	lui	a1,0x10000
    800099c0:	00006817          	auipc	a6,0x6
    800099c4:	92080813          	addi	a6,a6,-1760 # 8000f2e0 <uart_tx_buf>
    800099c8:	01c0006f          	j	800099e4 <uartstart+0x50>
    800099cc:	0006c703          	lbu	a4,0(a3)
    800099d0:	00f63023          	sd	a5,0(a2)
    800099d4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800099d8:	00063783          	ld	a5,0(a2)
    800099dc:	00053703          	ld	a4,0(a0)
    800099e0:	00f70e63          	beq	a4,a5,800099fc <uartstart+0x68>
    800099e4:	01f7f713          	andi	a4,a5,31
    800099e8:	00e806b3          	add	a3,a6,a4
    800099ec:	0055c703          	lbu	a4,5(a1)
    800099f0:	00178793          	addi	a5,a5,1
    800099f4:	02077713          	andi	a4,a4,32
    800099f8:	fc071ae3          	bnez	a4,800099cc <uartstart+0x38>
    800099fc:	00813403          	ld	s0,8(sp)
    80009a00:	01010113          	addi	sp,sp,16
    80009a04:	00008067          	ret

0000000080009a08 <uartgetc>:
    80009a08:	ff010113          	addi	sp,sp,-16
    80009a0c:	00813423          	sd	s0,8(sp)
    80009a10:	01010413          	addi	s0,sp,16
    80009a14:	10000737          	lui	a4,0x10000
    80009a18:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80009a1c:	0017f793          	andi	a5,a5,1
    80009a20:	00078c63          	beqz	a5,80009a38 <uartgetc+0x30>
    80009a24:	00074503          	lbu	a0,0(a4)
    80009a28:	0ff57513          	andi	a0,a0,255
    80009a2c:	00813403          	ld	s0,8(sp)
    80009a30:	01010113          	addi	sp,sp,16
    80009a34:	00008067          	ret
    80009a38:	fff00513          	li	a0,-1
    80009a3c:	ff1ff06f          	j	80009a2c <uartgetc+0x24>

0000000080009a40 <uartintr>:
    80009a40:	100007b7          	lui	a5,0x10000
    80009a44:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80009a48:	0017f793          	andi	a5,a5,1
    80009a4c:	0a078463          	beqz	a5,80009af4 <uartintr+0xb4>
    80009a50:	fe010113          	addi	sp,sp,-32
    80009a54:	00813823          	sd	s0,16(sp)
    80009a58:	00913423          	sd	s1,8(sp)
    80009a5c:	00113c23          	sd	ra,24(sp)
    80009a60:	02010413          	addi	s0,sp,32
    80009a64:	100004b7          	lui	s1,0x10000
    80009a68:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80009a6c:	0ff57513          	andi	a0,a0,255
    80009a70:	fffff097          	auipc	ra,0xfffff
    80009a74:	534080e7          	jalr	1332(ra) # 80008fa4 <consoleintr>
    80009a78:	0054c783          	lbu	a5,5(s1)
    80009a7c:	0017f793          	andi	a5,a5,1
    80009a80:	fe0794e3          	bnez	a5,80009a68 <uartintr+0x28>
    80009a84:	00004617          	auipc	a2,0x4
    80009a88:	56c60613          	addi	a2,a2,1388 # 8000dff0 <uart_tx_r>
    80009a8c:	00004517          	auipc	a0,0x4
    80009a90:	56c50513          	addi	a0,a0,1388 # 8000dff8 <uart_tx_w>
    80009a94:	00063783          	ld	a5,0(a2)
    80009a98:	00053703          	ld	a4,0(a0)
    80009a9c:	04f70263          	beq	a4,a5,80009ae0 <uartintr+0xa0>
    80009aa0:	100005b7          	lui	a1,0x10000
    80009aa4:	00006817          	auipc	a6,0x6
    80009aa8:	83c80813          	addi	a6,a6,-1988 # 8000f2e0 <uart_tx_buf>
    80009aac:	01c0006f          	j	80009ac8 <uartintr+0x88>
    80009ab0:	0006c703          	lbu	a4,0(a3)
    80009ab4:	00f63023          	sd	a5,0(a2)
    80009ab8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009abc:	00063783          	ld	a5,0(a2)
    80009ac0:	00053703          	ld	a4,0(a0)
    80009ac4:	00f70e63          	beq	a4,a5,80009ae0 <uartintr+0xa0>
    80009ac8:	01f7f713          	andi	a4,a5,31
    80009acc:	00e806b3          	add	a3,a6,a4
    80009ad0:	0055c703          	lbu	a4,5(a1)
    80009ad4:	00178793          	addi	a5,a5,1
    80009ad8:	02077713          	andi	a4,a4,32
    80009adc:	fc071ae3          	bnez	a4,80009ab0 <uartintr+0x70>
    80009ae0:	01813083          	ld	ra,24(sp)
    80009ae4:	01013403          	ld	s0,16(sp)
    80009ae8:	00813483          	ld	s1,8(sp)
    80009aec:	02010113          	addi	sp,sp,32
    80009af0:	00008067          	ret
    80009af4:	00004617          	auipc	a2,0x4
    80009af8:	4fc60613          	addi	a2,a2,1276 # 8000dff0 <uart_tx_r>
    80009afc:	00004517          	auipc	a0,0x4
    80009b00:	4fc50513          	addi	a0,a0,1276 # 8000dff8 <uart_tx_w>
    80009b04:	00063783          	ld	a5,0(a2)
    80009b08:	00053703          	ld	a4,0(a0)
    80009b0c:	04f70263          	beq	a4,a5,80009b50 <uartintr+0x110>
    80009b10:	100005b7          	lui	a1,0x10000
    80009b14:	00005817          	auipc	a6,0x5
    80009b18:	7cc80813          	addi	a6,a6,1996 # 8000f2e0 <uart_tx_buf>
    80009b1c:	01c0006f          	j	80009b38 <uartintr+0xf8>
    80009b20:	0006c703          	lbu	a4,0(a3)
    80009b24:	00f63023          	sd	a5,0(a2)
    80009b28:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80009b2c:	00063783          	ld	a5,0(a2)
    80009b30:	00053703          	ld	a4,0(a0)
    80009b34:	02f70063          	beq	a4,a5,80009b54 <uartintr+0x114>
    80009b38:	01f7f713          	andi	a4,a5,31
    80009b3c:	00e806b3          	add	a3,a6,a4
    80009b40:	0055c703          	lbu	a4,5(a1)
    80009b44:	00178793          	addi	a5,a5,1
    80009b48:	02077713          	andi	a4,a4,32
    80009b4c:	fc071ae3          	bnez	a4,80009b20 <uartintr+0xe0>
    80009b50:	00008067          	ret
    80009b54:	00008067          	ret

0000000080009b58 <kinit>:
    80009b58:	fc010113          	addi	sp,sp,-64
    80009b5c:	02913423          	sd	s1,40(sp)
    80009b60:	fffff7b7          	lui	a5,0xfffff
    80009b64:	00006497          	auipc	s1,0x6
    80009b68:	79b48493          	addi	s1,s1,1947 # 800102ff <end+0xfff>
    80009b6c:	02813823          	sd	s0,48(sp)
    80009b70:	01313c23          	sd	s3,24(sp)
    80009b74:	00f4f4b3          	and	s1,s1,a5
    80009b78:	02113c23          	sd	ra,56(sp)
    80009b7c:	03213023          	sd	s2,32(sp)
    80009b80:	01413823          	sd	s4,16(sp)
    80009b84:	01513423          	sd	s5,8(sp)
    80009b88:	04010413          	addi	s0,sp,64
    80009b8c:	000017b7          	lui	a5,0x1
    80009b90:	01100993          	li	s3,17
    80009b94:	00f487b3          	add	a5,s1,a5
    80009b98:	01b99993          	slli	s3,s3,0x1b
    80009b9c:	06f9e063          	bltu	s3,a5,80009bfc <kinit+0xa4>
    80009ba0:	00005a97          	auipc	s5,0x5
    80009ba4:	760a8a93          	addi	s5,s5,1888 # 8000f300 <end>
    80009ba8:	0754ec63          	bltu	s1,s5,80009c20 <kinit+0xc8>
    80009bac:	0734fa63          	bgeu	s1,s3,80009c20 <kinit+0xc8>
    80009bb0:	00088a37          	lui	s4,0x88
    80009bb4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80009bb8:	00004917          	auipc	s2,0x4
    80009bbc:	44890913          	addi	s2,s2,1096 # 8000e000 <kmem>
    80009bc0:	00ca1a13          	slli	s4,s4,0xc
    80009bc4:	0140006f          	j	80009bd8 <kinit+0x80>
    80009bc8:	000017b7          	lui	a5,0x1
    80009bcc:	00f484b3          	add	s1,s1,a5
    80009bd0:	0554e863          	bltu	s1,s5,80009c20 <kinit+0xc8>
    80009bd4:	0534f663          	bgeu	s1,s3,80009c20 <kinit+0xc8>
    80009bd8:	00001637          	lui	a2,0x1
    80009bdc:	00100593          	li	a1,1
    80009be0:	00048513          	mv	a0,s1
    80009be4:	00000097          	auipc	ra,0x0
    80009be8:	5e4080e7          	jalr	1508(ra) # 8000a1c8 <__memset>
    80009bec:	00093783          	ld	a5,0(s2)
    80009bf0:	00f4b023          	sd	a5,0(s1)
    80009bf4:	00993023          	sd	s1,0(s2)
    80009bf8:	fd4498e3          	bne	s1,s4,80009bc8 <kinit+0x70>
    80009bfc:	03813083          	ld	ra,56(sp)
    80009c00:	03013403          	ld	s0,48(sp)
    80009c04:	02813483          	ld	s1,40(sp)
    80009c08:	02013903          	ld	s2,32(sp)
    80009c0c:	01813983          	ld	s3,24(sp)
    80009c10:	01013a03          	ld	s4,16(sp)
    80009c14:	00813a83          	ld	s5,8(sp)
    80009c18:	04010113          	addi	sp,sp,64
    80009c1c:	00008067          	ret
    80009c20:	00002517          	auipc	a0,0x2
    80009c24:	e9050513          	addi	a0,a0,-368 # 8000bab0 <digits+0x18>
    80009c28:	fffff097          	auipc	ra,0xfffff
    80009c2c:	4b4080e7          	jalr	1204(ra) # 800090dc <panic>

0000000080009c30 <freerange>:
    80009c30:	fc010113          	addi	sp,sp,-64
    80009c34:	000017b7          	lui	a5,0x1
    80009c38:	02913423          	sd	s1,40(sp)
    80009c3c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80009c40:	009504b3          	add	s1,a0,s1
    80009c44:	fffff537          	lui	a0,0xfffff
    80009c48:	02813823          	sd	s0,48(sp)
    80009c4c:	02113c23          	sd	ra,56(sp)
    80009c50:	03213023          	sd	s2,32(sp)
    80009c54:	01313c23          	sd	s3,24(sp)
    80009c58:	01413823          	sd	s4,16(sp)
    80009c5c:	01513423          	sd	s5,8(sp)
    80009c60:	01613023          	sd	s6,0(sp)
    80009c64:	04010413          	addi	s0,sp,64
    80009c68:	00a4f4b3          	and	s1,s1,a0
    80009c6c:	00f487b3          	add	a5,s1,a5
    80009c70:	06f5e463          	bltu	a1,a5,80009cd8 <freerange+0xa8>
    80009c74:	00005a97          	auipc	s5,0x5
    80009c78:	68ca8a93          	addi	s5,s5,1676 # 8000f300 <end>
    80009c7c:	0954e263          	bltu	s1,s5,80009d00 <freerange+0xd0>
    80009c80:	01100993          	li	s3,17
    80009c84:	01b99993          	slli	s3,s3,0x1b
    80009c88:	0734fc63          	bgeu	s1,s3,80009d00 <freerange+0xd0>
    80009c8c:	00058a13          	mv	s4,a1
    80009c90:	00004917          	auipc	s2,0x4
    80009c94:	37090913          	addi	s2,s2,880 # 8000e000 <kmem>
    80009c98:	00002b37          	lui	s6,0x2
    80009c9c:	0140006f          	j	80009cb0 <freerange+0x80>
    80009ca0:	000017b7          	lui	a5,0x1
    80009ca4:	00f484b3          	add	s1,s1,a5
    80009ca8:	0554ec63          	bltu	s1,s5,80009d00 <freerange+0xd0>
    80009cac:	0534fa63          	bgeu	s1,s3,80009d00 <freerange+0xd0>
    80009cb0:	00001637          	lui	a2,0x1
    80009cb4:	00100593          	li	a1,1
    80009cb8:	00048513          	mv	a0,s1
    80009cbc:	00000097          	auipc	ra,0x0
    80009cc0:	50c080e7          	jalr	1292(ra) # 8000a1c8 <__memset>
    80009cc4:	00093703          	ld	a4,0(s2)
    80009cc8:	016487b3          	add	a5,s1,s6
    80009ccc:	00e4b023          	sd	a4,0(s1)
    80009cd0:	00993023          	sd	s1,0(s2)
    80009cd4:	fcfa76e3          	bgeu	s4,a5,80009ca0 <freerange+0x70>
    80009cd8:	03813083          	ld	ra,56(sp)
    80009cdc:	03013403          	ld	s0,48(sp)
    80009ce0:	02813483          	ld	s1,40(sp)
    80009ce4:	02013903          	ld	s2,32(sp)
    80009ce8:	01813983          	ld	s3,24(sp)
    80009cec:	01013a03          	ld	s4,16(sp)
    80009cf0:	00813a83          	ld	s5,8(sp)
    80009cf4:	00013b03          	ld	s6,0(sp)
    80009cf8:	04010113          	addi	sp,sp,64
    80009cfc:	00008067          	ret
    80009d00:	00002517          	auipc	a0,0x2
    80009d04:	db050513          	addi	a0,a0,-592 # 8000bab0 <digits+0x18>
    80009d08:	fffff097          	auipc	ra,0xfffff
    80009d0c:	3d4080e7          	jalr	980(ra) # 800090dc <panic>

0000000080009d10 <kfree>:
    80009d10:	fe010113          	addi	sp,sp,-32
    80009d14:	00813823          	sd	s0,16(sp)
    80009d18:	00113c23          	sd	ra,24(sp)
    80009d1c:	00913423          	sd	s1,8(sp)
    80009d20:	02010413          	addi	s0,sp,32
    80009d24:	03451793          	slli	a5,a0,0x34
    80009d28:	04079c63          	bnez	a5,80009d80 <kfree+0x70>
    80009d2c:	00005797          	auipc	a5,0x5
    80009d30:	5d478793          	addi	a5,a5,1492 # 8000f300 <end>
    80009d34:	00050493          	mv	s1,a0
    80009d38:	04f56463          	bltu	a0,a5,80009d80 <kfree+0x70>
    80009d3c:	01100793          	li	a5,17
    80009d40:	01b79793          	slli	a5,a5,0x1b
    80009d44:	02f57e63          	bgeu	a0,a5,80009d80 <kfree+0x70>
    80009d48:	00001637          	lui	a2,0x1
    80009d4c:	00100593          	li	a1,1
    80009d50:	00000097          	auipc	ra,0x0
    80009d54:	478080e7          	jalr	1144(ra) # 8000a1c8 <__memset>
    80009d58:	00004797          	auipc	a5,0x4
    80009d5c:	2a878793          	addi	a5,a5,680 # 8000e000 <kmem>
    80009d60:	0007b703          	ld	a4,0(a5)
    80009d64:	01813083          	ld	ra,24(sp)
    80009d68:	01013403          	ld	s0,16(sp)
    80009d6c:	00e4b023          	sd	a4,0(s1)
    80009d70:	0097b023          	sd	s1,0(a5)
    80009d74:	00813483          	ld	s1,8(sp)
    80009d78:	02010113          	addi	sp,sp,32
    80009d7c:	00008067          	ret
    80009d80:	00002517          	auipc	a0,0x2
    80009d84:	d3050513          	addi	a0,a0,-720 # 8000bab0 <digits+0x18>
    80009d88:	fffff097          	auipc	ra,0xfffff
    80009d8c:	354080e7          	jalr	852(ra) # 800090dc <panic>

0000000080009d90 <kalloc>:
    80009d90:	fe010113          	addi	sp,sp,-32
    80009d94:	00813823          	sd	s0,16(sp)
    80009d98:	00913423          	sd	s1,8(sp)
    80009d9c:	00113c23          	sd	ra,24(sp)
    80009da0:	02010413          	addi	s0,sp,32
    80009da4:	00004797          	auipc	a5,0x4
    80009da8:	25c78793          	addi	a5,a5,604 # 8000e000 <kmem>
    80009dac:	0007b483          	ld	s1,0(a5)
    80009db0:	02048063          	beqz	s1,80009dd0 <kalloc+0x40>
    80009db4:	0004b703          	ld	a4,0(s1)
    80009db8:	00001637          	lui	a2,0x1
    80009dbc:	00500593          	li	a1,5
    80009dc0:	00048513          	mv	a0,s1
    80009dc4:	00e7b023          	sd	a4,0(a5)
    80009dc8:	00000097          	auipc	ra,0x0
    80009dcc:	400080e7          	jalr	1024(ra) # 8000a1c8 <__memset>
    80009dd0:	01813083          	ld	ra,24(sp)
    80009dd4:	01013403          	ld	s0,16(sp)
    80009dd8:	00048513          	mv	a0,s1
    80009ddc:	00813483          	ld	s1,8(sp)
    80009de0:	02010113          	addi	sp,sp,32
    80009de4:	00008067          	ret

0000000080009de8 <initlock>:
    80009de8:	ff010113          	addi	sp,sp,-16
    80009dec:	00813423          	sd	s0,8(sp)
    80009df0:	01010413          	addi	s0,sp,16
    80009df4:	00813403          	ld	s0,8(sp)
    80009df8:	00b53423          	sd	a1,8(a0)
    80009dfc:	00052023          	sw	zero,0(a0)
    80009e00:	00053823          	sd	zero,16(a0)
    80009e04:	01010113          	addi	sp,sp,16
    80009e08:	00008067          	ret

0000000080009e0c <acquire>:
    80009e0c:	fe010113          	addi	sp,sp,-32
    80009e10:	00813823          	sd	s0,16(sp)
    80009e14:	00913423          	sd	s1,8(sp)
    80009e18:	00113c23          	sd	ra,24(sp)
    80009e1c:	01213023          	sd	s2,0(sp)
    80009e20:	02010413          	addi	s0,sp,32
    80009e24:	00050493          	mv	s1,a0
    80009e28:	10002973          	csrr	s2,sstatus
    80009e2c:	100027f3          	csrr	a5,sstatus
    80009e30:	ffd7f793          	andi	a5,a5,-3
    80009e34:	10079073          	csrw	sstatus,a5
    80009e38:	fffff097          	auipc	ra,0xfffff
    80009e3c:	8e8080e7          	jalr	-1816(ra) # 80008720 <mycpu>
    80009e40:	07852783          	lw	a5,120(a0)
    80009e44:	06078e63          	beqz	a5,80009ec0 <acquire+0xb4>
    80009e48:	fffff097          	auipc	ra,0xfffff
    80009e4c:	8d8080e7          	jalr	-1832(ra) # 80008720 <mycpu>
    80009e50:	07852783          	lw	a5,120(a0)
    80009e54:	0004a703          	lw	a4,0(s1)
    80009e58:	0017879b          	addiw	a5,a5,1
    80009e5c:	06f52c23          	sw	a5,120(a0)
    80009e60:	04071063          	bnez	a4,80009ea0 <acquire+0x94>
    80009e64:	00100713          	li	a4,1
    80009e68:	00070793          	mv	a5,a4
    80009e6c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80009e70:	0007879b          	sext.w	a5,a5
    80009e74:	fe079ae3          	bnez	a5,80009e68 <acquire+0x5c>
    80009e78:	0ff0000f          	fence
    80009e7c:	fffff097          	auipc	ra,0xfffff
    80009e80:	8a4080e7          	jalr	-1884(ra) # 80008720 <mycpu>
    80009e84:	01813083          	ld	ra,24(sp)
    80009e88:	01013403          	ld	s0,16(sp)
    80009e8c:	00a4b823          	sd	a0,16(s1)
    80009e90:	00013903          	ld	s2,0(sp)
    80009e94:	00813483          	ld	s1,8(sp)
    80009e98:	02010113          	addi	sp,sp,32
    80009e9c:	00008067          	ret
    80009ea0:	0104b903          	ld	s2,16(s1)
    80009ea4:	fffff097          	auipc	ra,0xfffff
    80009ea8:	87c080e7          	jalr	-1924(ra) # 80008720 <mycpu>
    80009eac:	faa91ce3          	bne	s2,a0,80009e64 <acquire+0x58>
    80009eb0:	00002517          	auipc	a0,0x2
    80009eb4:	c0850513          	addi	a0,a0,-1016 # 8000bab8 <digits+0x20>
    80009eb8:	fffff097          	auipc	ra,0xfffff
    80009ebc:	224080e7          	jalr	548(ra) # 800090dc <panic>
    80009ec0:	00195913          	srli	s2,s2,0x1
    80009ec4:	fffff097          	auipc	ra,0xfffff
    80009ec8:	85c080e7          	jalr	-1956(ra) # 80008720 <mycpu>
    80009ecc:	00197913          	andi	s2,s2,1
    80009ed0:	07252e23          	sw	s2,124(a0)
    80009ed4:	f75ff06f          	j	80009e48 <acquire+0x3c>

0000000080009ed8 <release>:
    80009ed8:	fe010113          	addi	sp,sp,-32
    80009edc:	00813823          	sd	s0,16(sp)
    80009ee0:	00113c23          	sd	ra,24(sp)
    80009ee4:	00913423          	sd	s1,8(sp)
    80009ee8:	01213023          	sd	s2,0(sp)
    80009eec:	02010413          	addi	s0,sp,32
    80009ef0:	00052783          	lw	a5,0(a0)
    80009ef4:	00079a63          	bnez	a5,80009f08 <release+0x30>
    80009ef8:	00002517          	auipc	a0,0x2
    80009efc:	bc850513          	addi	a0,a0,-1080 # 8000bac0 <digits+0x28>
    80009f00:	fffff097          	auipc	ra,0xfffff
    80009f04:	1dc080e7          	jalr	476(ra) # 800090dc <panic>
    80009f08:	01053903          	ld	s2,16(a0)
    80009f0c:	00050493          	mv	s1,a0
    80009f10:	fffff097          	auipc	ra,0xfffff
    80009f14:	810080e7          	jalr	-2032(ra) # 80008720 <mycpu>
    80009f18:	fea910e3          	bne	s2,a0,80009ef8 <release+0x20>
    80009f1c:	0004b823          	sd	zero,16(s1)
    80009f20:	0ff0000f          	fence
    80009f24:	0f50000f          	fence	iorw,ow
    80009f28:	0804a02f          	amoswap.w	zero,zero,(s1)
    80009f2c:	ffffe097          	auipc	ra,0xffffe
    80009f30:	7f4080e7          	jalr	2036(ra) # 80008720 <mycpu>
    80009f34:	100027f3          	csrr	a5,sstatus
    80009f38:	0027f793          	andi	a5,a5,2
    80009f3c:	04079a63          	bnez	a5,80009f90 <release+0xb8>
    80009f40:	07852783          	lw	a5,120(a0)
    80009f44:	02f05e63          	blez	a5,80009f80 <release+0xa8>
    80009f48:	fff7871b          	addiw	a4,a5,-1
    80009f4c:	06e52c23          	sw	a4,120(a0)
    80009f50:	00071c63          	bnez	a4,80009f68 <release+0x90>
    80009f54:	07c52783          	lw	a5,124(a0)
    80009f58:	00078863          	beqz	a5,80009f68 <release+0x90>
    80009f5c:	100027f3          	csrr	a5,sstatus
    80009f60:	0027e793          	ori	a5,a5,2
    80009f64:	10079073          	csrw	sstatus,a5
    80009f68:	01813083          	ld	ra,24(sp)
    80009f6c:	01013403          	ld	s0,16(sp)
    80009f70:	00813483          	ld	s1,8(sp)
    80009f74:	00013903          	ld	s2,0(sp)
    80009f78:	02010113          	addi	sp,sp,32
    80009f7c:	00008067          	ret
    80009f80:	00002517          	auipc	a0,0x2
    80009f84:	b6050513          	addi	a0,a0,-1184 # 8000bae0 <digits+0x48>
    80009f88:	fffff097          	auipc	ra,0xfffff
    80009f8c:	154080e7          	jalr	340(ra) # 800090dc <panic>
    80009f90:	00002517          	auipc	a0,0x2
    80009f94:	b3850513          	addi	a0,a0,-1224 # 8000bac8 <digits+0x30>
    80009f98:	fffff097          	auipc	ra,0xfffff
    80009f9c:	144080e7          	jalr	324(ra) # 800090dc <panic>

0000000080009fa0 <holding>:
    80009fa0:	00052783          	lw	a5,0(a0)
    80009fa4:	00079663          	bnez	a5,80009fb0 <holding+0x10>
    80009fa8:	00000513          	li	a0,0
    80009fac:	00008067          	ret
    80009fb0:	fe010113          	addi	sp,sp,-32
    80009fb4:	00813823          	sd	s0,16(sp)
    80009fb8:	00913423          	sd	s1,8(sp)
    80009fbc:	00113c23          	sd	ra,24(sp)
    80009fc0:	02010413          	addi	s0,sp,32
    80009fc4:	01053483          	ld	s1,16(a0)
    80009fc8:	ffffe097          	auipc	ra,0xffffe
    80009fcc:	758080e7          	jalr	1880(ra) # 80008720 <mycpu>
    80009fd0:	01813083          	ld	ra,24(sp)
    80009fd4:	01013403          	ld	s0,16(sp)
    80009fd8:	40a48533          	sub	a0,s1,a0
    80009fdc:	00153513          	seqz	a0,a0
    80009fe0:	00813483          	ld	s1,8(sp)
    80009fe4:	02010113          	addi	sp,sp,32
    80009fe8:	00008067          	ret

0000000080009fec <push_off>:
    80009fec:	fe010113          	addi	sp,sp,-32
    80009ff0:	00813823          	sd	s0,16(sp)
    80009ff4:	00113c23          	sd	ra,24(sp)
    80009ff8:	00913423          	sd	s1,8(sp)
    80009ffc:	02010413          	addi	s0,sp,32
    8000a000:	100024f3          	csrr	s1,sstatus
    8000a004:	100027f3          	csrr	a5,sstatus
    8000a008:	ffd7f793          	andi	a5,a5,-3
    8000a00c:	10079073          	csrw	sstatus,a5
    8000a010:	ffffe097          	auipc	ra,0xffffe
    8000a014:	710080e7          	jalr	1808(ra) # 80008720 <mycpu>
    8000a018:	07852783          	lw	a5,120(a0)
    8000a01c:	02078663          	beqz	a5,8000a048 <push_off+0x5c>
    8000a020:	ffffe097          	auipc	ra,0xffffe
    8000a024:	700080e7          	jalr	1792(ra) # 80008720 <mycpu>
    8000a028:	07852783          	lw	a5,120(a0)
    8000a02c:	01813083          	ld	ra,24(sp)
    8000a030:	01013403          	ld	s0,16(sp)
    8000a034:	0017879b          	addiw	a5,a5,1
    8000a038:	06f52c23          	sw	a5,120(a0)
    8000a03c:	00813483          	ld	s1,8(sp)
    8000a040:	02010113          	addi	sp,sp,32
    8000a044:	00008067          	ret
    8000a048:	0014d493          	srli	s1,s1,0x1
    8000a04c:	ffffe097          	auipc	ra,0xffffe
    8000a050:	6d4080e7          	jalr	1748(ra) # 80008720 <mycpu>
    8000a054:	0014f493          	andi	s1,s1,1
    8000a058:	06952e23          	sw	s1,124(a0)
    8000a05c:	fc5ff06f          	j	8000a020 <push_off+0x34>

000000008000a060 <pop_off>:
    8000a060:	ff010113          	addi	sp,sp,-16
    8000a064:	00813023          	sd	s0,0(sp)
    8000a068:	00113423          	sd	ra,8(sp)
    8000a06c:	01010413          	addi	s0,sp,16
    8000a070:	ffffe097          	auipc	ra,0xffffe
    8000a074:	6b0080e7          	jalr	1712(ra) # 80008720 <mycpu>
    8000a078:	100027f3          	csrr	a5,sstatus
    8000a07c:	0027f793          	andi	a5,a5,2
    8000a080:	04079663          	bnez	a5,8000a0cc <pop_off+0x6c>
    8000a084:	07852783          	lw	a5,120(a0)
    8000a088:	02f05a63          	blez	a5,8000a0bc <pop_off+0x5c>
    8000a08c:	fff7871b          	addiw	a4,a5,-1
    8000a090:	06e52c23          	sw	a4,120(a0)
    8000a094:	00071c63          	bnez	a4,8000a0ac <pop_off+0x4c>
    8000a098:	07c52783          	lw	a5,124(a0)
    8000a09c:	00078863          	beqz	a5,8000a0ac <pop_off+0x4c>
    8000a0a0:	100027f3          	csrr	a5,sstatus
    8000a0a4:	0027e793          	ori	a5,a5,2
    8000a0a8:	10079073          	csrw	sstatus,a5
    8000a0ac:	00813083          	ld	ra,8(sp)
    8000a0b0:	00013403          	ld	s0,0(sp)
    8000a0b4:	01010113          	addi	sp,sp,16
    8000a0b8:	00008067          	ret
    8000a0bc:	00002517          	auipc	a0,0x2
    8000a0c0:	a2450513          	addi	a0,a0,-1500 # 8000bae0 <digits+0x48>
    8000a0c4:	fffff097          	auipc	ra,0xfffff
    8000a0c8:	018080e7          	jalr	24(ra) # 800090dc <panic>
    8000a0cc:	00002517          	auipc	a0,0x2
    8000a0d0:	9fc50513          	addi	a0,a0,-1540 # 8000bac8 <digits+0x30>
    8000a0d4:	fffff097          	auipc	ra,0xfffff
    8000a0d8:	008080e7          	jalr	8(ra) # 800090dc <panic>

000000008000a0dc <push_on>:
    8000a0dc:	fe010113          	addi	sp,sp,-32
    8000a0e0:	00813823          	sd	s0,16(sp)
    8000a0e4:	00113c23          	sd	ra,24(sp)
    8000a0e8:	00913423          	sd	s1,8(sp)
    8000a0ec:	02010413          	addi	s0,sp,32
    8000a0f0:	100024f3          	csrr	s1,sstatus
    8000a0f4:	100027f3          	csrr	a5,sstatus
    8000a0f8:	0027e793          	ori	a5,a5,2
    8000a0fc:	10079073          	csrw	sstatus,a5
    8000a100:	ffffe097          	auipc	ra,0xffffe
    8000a104:	620080e7          	jalr	1568(ra) # 80008720 <mycpu>
    8000a108:	07852783          	lw	a5,120(a0)
    8000a10c:	02078663          	beqz	a5,8000a138 <push_on+0x5c>
    8000a110:	ffffe097          	auipc	ra,0xffffe
    8000a114:	610080e7          	jalr	1552(ra) # 80008720 <mycpu>
    8000a118:	07852783          	lw	a5,120(a0)
    8000a11c:	01813083          	ld	ra,24(sp)
    8000a120:	01013403          	ld	s0,16(sp)
    8000a124:	0017879b          	addiw	a5,a5,1
    8000a128:	06f52c23          	sw	a5,120(a0)
    8000a12c:	00813483          	ld	s1,8(sp)
    8000a130:	02010113          	addi	sp,sp,32
    8000a134:	00008067          	ret
    8000a138:	0014d493          	srli	s1,s1,0x1
    8000a13c:	ffffe097          	auipc	ra,0xffffe
    8000a140:	5e4080e7          	jalr	1508(ra) # 80008720 <mycpu>
    8000a144:	0014f493          	andi	s1,s1,1
    8000a148:	06952e23          	sw	s1,124(a0)
    8000a14c:	fc5ff06f          	j	8000a110 <push_on+0x34>

000000008000a150 <pop_on>:
    8000a150:	ff010113          	addi	sp,sp,-16
    8000a154:	00813023          	sd	s0,0(sp)
    8000a158:	00113423          	sd	ra,8(sp)
    8000a15c:	01010413          	addi	s0,sp,16
    8000a160:	ffffe097          	auipc	ra,0xffffe
    8000a164:	5c0080e7          	jalr	1472(ra) # 80008720 <mycpu>
    8000a168:	100027f3          	csrr	a5,sstatus
    8000a16c:	0027f793          	andi	a5,a5,2
    8000a170:	04078463          	beqz	a5,8000a1b8 <pop_on+0x68>
    8000a174:	07852783          	lw	a5,120(a0)
    8000a178:	02f05863          	blez	a5,8000a1a8 <pop_on+0x58>
    8000a17c:	fff7879b          	addiw	a5,a5,-1
    8000a180:	06f52c23          	sw	a5,120(a0)
    8000a184:	07853783          	ld	a5,120(a0)
    8000a188:	00079863          	bnez	a5,8000a198 <pop_on+0x48>
    8000a18c:	100027f3          	csrr	a5,sstatus
    8000a190:	ffd7f793          	andi	a5,a5,-3
    8000a194:	10079073          	csrw	sstatus,a5
    8000a198:	00813083          	ld	ra,8(sp)
    8000a19c:	00013403          	ld	s0,0(sp)
    8000a1a0:	01010113          	addi	sp,sp,16
    8000a1a4:	00008067          	ret
    8000a1a8:	00002517          	auipc	a0,0x2
    8000a1ac:	96050513          	addi	a0,a0,-1696 # 8000bb08 <digits+0x70>
    8000a1b0:	fffff097          	auipc	ra,0xfffff
    8000a1b4:	f2c080e7          	jalr	-212(ra) # 800090dc <panic>
    8000a1b8:	00002517          	auipc	a0,0x2
    8000a1bc:	93050513          	addi	a0,a0,-1744 # 8000bae8 <digits+0x50>
    8000a1c0:	fffff097          	auipc	ra,0xfffff
    8000a1c4:	f1c080e7          	jalr	-228(ra) # 800090dc <panic>

000000008000a1c8 <__memset>:
    8000a1c8:	ff010113          	addi	sp,sp,-16
    8000a1cc:	00813423          	sd	s0,8(sp)
    8000a1d0:	01010413          	addi	s0,sp,16
    8000a1d4:	1a060e63          	beqz	a2,8000a390 <__memset+0x1c8>
    8000a1d8:	40a007b3          	neg	a5,a0
    8000a1dc:	0077f793          	andi	a5,a5,7
    8000a1e0:	00778693          	addi	a3,a5,7
    8000a1e4:	00b00813          	li	a6,11
    8000a1e8:	0ff5f593          	andi	a1,a1,255
    8000a1ec:	fff6071b          	addiw	a4,a2,-1
    8000a1f0:	1b06e663          	bltu	a3,a6,8000a39c <__memset+0x1d4>
    8000a1f4:	1cd76463          	bltu	a4,a3,8000a3bc <__memset+0x1f4>
    8000a1f8:	1a078e63          	beqz	a5,8000a3b4 <__memset+0x1ec>
    8000a1fc:	00b50023          	sb	a1,0(a0)
    8000a200:	00100713          	li	a4,1
    8000a204:	1ae78463          	beq	a5,a4,8000a3ac <__memset+0x1e4>
    8000a208:	00b500a3          	sb	a1,1(a0)
    8000a20c:	00200713          	li	a4,2
    8000a210:	1ae78a63          	beq	a5,a4,8000a3c4 <__memset+0x1fc>
    8000a214:	00b50123          	sb	a1,2(a0)
    8000a218:	00300713          	li	a4,3
    8000a21c:	18e78463          	beq	a5,a4,8000a3a4 <__memset+0x1dc>
    8000a220:	00b501a3          	sb	a1,3(a0)
    8000a224:	00400713          	li	a4,4
    8000a228:	1ae78263          	beq	a5,a4,8000a3cc <__memset+0x204>
    8000a22c:	00b50223          	sb	a1,4(a0)
    8000a230:	00500713          	li	a4,5
    8000a234:	1ae78063          	beq	a5,a4,8000a3d4 <__memset+0x20c>
    8000a238:	00b502a3          	sb	a1,5(a0)
    8000a23c:	00700713          	li	a4,7
    8000a240:	18e79e63          	bne	a5,a4,8000a3dc <__memset+0x214>
    8000a244:	00b50323          	sb	a1,6(a0)
    8000a248:	00700e93          	li	t4,7
    8000a24c:	00859713          	slli	a4,a1,0x8
    8000a250:	00e5e733          	or	a4,a1,a4
    8000a254:	01059e13          	slli	t3,a1,0x10
    8000a258:	01c76e33          	or	t3,a4,t3
    8000a25c:	01859313          	slli	t1,a1,0x18
    8000a260:	006e6333          	or	t1,t3,t1
    8000a264:	02059893          	slli	a7,a1,0x20
    8000a268:	40f60e3b          	subw	t3,a2,a5
    8000a26c:	011368b3          	or	a7,t1,a7
    8000a270:	02859813          	slli	a6,a1,0x28
    8000a274:	0108e833          	or	a6,a7,a6
    8000a278:	03059693          	slli	a3,a1,0x30
    8000a27c:	003e589b          	srliw	a7,t3,0x3
    8000a280:	00d866b3          	or	a3,a6,a3
    8000a284:	03859713          	slli	a4,a1,0x38
    8000a288:	00389813          	slli	a6,a7,0x3
    8000a28c:	00f507b3          	add	a5,a0,a5
    8000a290:	00e6e733          	or	a4,a3,a4
    8000a294:	000e089b          	sext.w	a7,t3
    8000a298:	00f806b3          	add	a3,a6,a5
    8000a29c:	00e7b023          	sd	a4,0(a5)
    8000a2a0:	00878793          	addi	a5,a5,8
    8000a2a4:	fed79ce3          	bne	a5,a3,8000a29c <__memset+0xd4>
    8000a2a8:	ff8e7793          	andi	a5,t3,-8
    8000a2ac:	0007871b          	sext.w	a4,a5
    8000a2b0:	01d787bb          	addw	a5,a5,t4
    8000a2b4:	0ce88e63          	beq	a7,a4,8000a390 <__memset+0x1c8>
    8000a2b8:	00f50733          	add	a4,a0,a5
    8000a2bc:	00b70023          	sb	a1,0(a4)
    8000a2c0:	0017871b          	addiw	a4,a5,1
    8000a2c4:	0cc77663          	bgeu	a4,a2,8000a390 <__memset+0x1c8>
    8000a2c8:	00e50733          	add	a4,a0,a4
    8000a2cc:	00b70023          	sb	a1,0(a4)
    8000a2d0:	0027871b          	addiw	a4,a5,2
    8000a2d4:	0ac77e63          	bgeu	a4,a2,8000a390 <__memset+0x1c8>
    8000a2d8:	00e50733          	add	a4,a0,a4
    8000a2dc:	00b70023          	sb	a1,0(a4)
    8000a2e0:	0037871b          	addiw	a4,a5,3
    8000a2e4:	0ac77663          	bgeu	a4,a2,8000a390 <__memset+0x1c8>
    8000a2e8:	00e50733          	add	a4,a0,a4
    8000a2ec:	00b70023          	sb	a1,0(a4)
    8000a2f0:	0047871b          	addiw	a4,a5,4
    8000a2f4:	08c77e63          	bgeu	a4,a2,8000a390 <__memset+0x1c8>
    8000a2f8:	00e50733          	add	a4,a0,a4
    8000a2fc:	00b70023          	sb	a1,0(a4)
    8000a300:	0057871b          	addiw	a4,a5,5
    8000a304:	08c77663          	bgeu	a4,a2,8000a390 <__memset+0x1c8>
    8000a308:	00e50733          	add	a4,a0,a4
    8000a30c:	00b70023          	sb	a1,0(a4)
    8000a310:	0067871b          	addiw	a4,a5,6
    8000a314:	06c77e63          	bgeu	a4,a2,8000a390 <__memset+0x1c8>
    8000a318:	00e50733          	add	a4,a0,a4
    8000a31c:	00b70023          	sb	a1,0(a4)
    8000a320:	0077871b          	addiw	a4,a5,7
    8000a324:	06c77663          	bgeu	a4,a2,8000a390 <__memset+0x1c8>
    8000a328:	00e50733          	add	a4,a0,a4
    8000a32c:	00b70023          	sb	a1,0(a4)
    8000a330:	0087871b          	addiw	a4,a5,8
    8000a334:	04c77e63          	bgeu	a4,a2,8000a390 <__memset+0x1c8>
    8000a338:	00e50733          	add	a4,a0,a4
    8000a33c:	00b70023          	sb	a1,0(a4)
    8000a340:	0097871b          	addiw	a4,a5,9
    8000a344:	04c77663          	bgeu	a4,a2,8000a390 <__memset+0x1c8>
    8000a348:	00e50733          	add	a4,a0,a4
    8000a34c:	00b70023          	sb	a1,0(a4)
    8000a350:	00a7871b          	addiw	a4,a5,10
    8000a354:	02c77e63          	bgeu	a4,a2,8000a390 <__memset+0x1c8>
    8000a358:	00e50733          	add	a4,a0,a4
    8000a35c:	00b70023          	sb	a1,0(a4)
    8000a360:	00b7871b          	addiw	a4,a5,11
    8000a364:	02c77663          	bgeu	a4,a2,8000a390 <__memset+0x1c8>
    8000a368:	00e50733          	add	a4,a0,a4
    8000a36c:	00b70023          	sb	a1,0(a4)
    8000a370:	00c7871b          	addiw	a4,a5,12
    8000a374:	00c77e63          	bgeu	a4,a2,8000a390 <__memset+0x1c8>
    8000a378:	00e50733          	add	a4,a0,a4
    8000a37c:	00b70023          	sb	a1,0(a4)
    8000a380:	00d7879b          	addiw	a5,a5,13
    8000a384:	00c7f663          	bgeu	a5,a2,8000a390 <__memset+0x1c8>
    8000a388:	00f507b3          	add	a5,a0,a5
    8000a38c:	00b78023          	sb	a1,0(a5)
    8000a390:	00813403          	ld	s0,8(sp)
    8000a394:	01010113          	addi	sp,sp,16
    8000a398:	00008067          	ret
    8000a39c:	00b00693          	li	a3,11
    8000a3a0:	e55ff06f          	j	8000a1f4 <__memset+0x2c>
    8000a3a4:	00300e93          	li	t4,3
    8000a3a8:	ea5ff06f          	j	8000a24c <__memset+0x84>
    8000a3ac:	00100e93          	li	t4,1
    8000a3b0:	e9dff06f          	j	8000a24c <__memset+0x84>
    8000a3b4:	00000e93          	li	t4,0
    8000a3b8:	e95ff06f          	j	8000a24c <__memset+0x84>
    8000a3bc:	00000793          	li	a5,0
    8000a3c0:	ef9ff06f          	j	8000a2b8 <__memset+0xf0>
    8000a3c4:	00200e93          	li	t4,2
    8000a3c8:	e85ff06f          	j	8000a24c <__memset+0x84>
    8000a3cc:	00400e93          	li	t4,4
    8000a3d0:	e7dff06f          	j	8000a24c <__memset+0x84>
    8000a3d4:	00500e93          	li	t4,5
    8000a3d8:	e75ff06f          	j	8000a24c <__memset+0x84>
    8000a3dc:	00600e93          	li	t4,6
    8000a3e0:	e6dff06f          	j	8000a24c <__memset+0x84>

000000008000a3e4 <__memmove>:
    8000a3e4:	ff010113          	addi	sp,sp,-16
    8000a3e8:	00813423          	sd	s0,8(sp)
    8000a3ec:	01010413          	addi	s0,sp,16
    8000a3f0:	0e060863          	beqz	a2,8000a4e0 <__memmove+0xfc>
    8000a3f4:	fff6069b          	addiw	a3,a2,-1
    8000a3f8:	0006881b          	sext.w	a6,a3
    8000a3fc:	0ea5e863          	bltu	a1,a0,8000a4ec <__memmove+0x108>
    8000a400:	00758713          	addi	a4,a1,7
    8000a404:	00a5e7b3          	or	a5,a1,a0
    8000a408:	40a70733          	sub	a4,a4,a0
    8000a40c:	0077f793          	andi	a5,a5,7
    8000a410:	00f73713          	sltiu	a4,a4,15
    8000a414:	00174713          	xori	a4,a4,1
    8000a418:	0017b793          	seqz	a5,a5
    8000a41c:	00e7f7b3          	and	a5,a5,a4
    8000a420:	10078863          	beqz	a5,8000a530 <__memmove+0x14c>
    8000a424:	00900793          	li	a5,9
    8000a428:	1107f463          	bgeu	a5,a6,8000a530 <__memmove+0x14c>
    8000a42c:	0036581b          	srliw	a6,a2,0x3
    8000a430:	fff8081b          	addiw	a6,a6,-1
    8000a434:	02081813          	slli	a6,a6,0x20
    8000a438:	01d85893          	srli	a7,a6,0x1d
    8000a43c:	00858813          	addi	a6,a1,8
    8000a440:	00058793          	mv	a5,a1
    8000a444:	00050713          	mv	a4,a0
    8000a448:	01088833          	add	a6,a7,a6
    8000a44c:	0007b883          	ld	a7,0(a5)
    8000a450:	00878793          	addi	a5,a5,8
    8000a454:	00870713          	addi	a4,a4,8
    8000a458:	ff173c23          	sd	a7,-8(a4)
    8000a45c:	ff0798e3          	bne	a5,a6,8000a44c <__memmove+0x68>
    8000a460:	ff867713          	andi	a4,a2,-8
    8000a464:	02071793          	slli	a5,a4,0x20
    8000a468:	0207d793          	srli	a5,a5,0x20
    8000a46c:	00f585b3          	add	a1,a1,a5
    8000a470:	40e686bb          	subw	a3,a3,a4
    8000a474:	00f507b3          	add	a5,a0,a5
    8000a478:	06e60463          	beq	a2,a4,8000a4e0 <__memmove+0xfc>
    8000a47c:	0005c703          	lbu	a4,0(a1)
    8000a480:	00e78023          	sb	a4,0(a5)
    8000a484:	04068e63          	beqz	a3,8000a4e0 <__memmove+0xfc>
    8000a488:	0015c603          	lbu	a2,1(a1)
    8000a48c:	00100713          	li	a4,1
    8000a490:	00c780a3          	sb	a2,1(a5)
    8000a494:	04e68663          	beq	a3,a4,8000a4e0 <__memmove+0xfc>
    8000a498:	0025c603          	lbu	a2,2(a1)
    8000a49c:	00200713          	li	a4,2
    8000a4a0:	00c78123          	sb	a2,2(a5)
    8000a4a4:	02e68e63          	beq	a3,a4,8000a4e0 <__memmove+0xfc>
    8000a4a8:	0035c603          	lbu	a2,3(a1)
    8000a4ac:	00300713          	li	a4,3
    8000a4b0:	00c781a3          	sb	a2,3(a5)
    8000a4b4:	02e68663          	beq	a3,a4,8000a4e0 <__memmove+0xfc>
    8000a4b8:	0045c603          	lbu	a2,4(a1)
    8000a4bc:	00400713          	li	a4,4
    8000a4c0:	00c78223          	sb	a2,4(a5)
    8000a4c4:	00e68e63          	beq	a3,a4,8000a4e0 <__memmove+0xfc>
    8000a4c8:	0055c603          	lbu	a2,5(a1)
    8000a4cc:	00500713          	li	a4,5
    8000a4d0:	00c782a3          	sb	a2,5(a5)
    8000a4d4:	00e68663          	beq	a3,a4,8000a4e0 <__memmove+0xfc>
    8000a4d8:	0065c703          	lbu	a4,6(a1)
    8000a4dc:	00e78323          	sb	a4,6(a5)
    8000a4e0:	00813403          	ld	s0,8(sp)
    8000a4e4:	01010113          	addi	sp,sp,16
    8000a4e8:	00008067          	ret
    8000a4ec:	02061713          	slli	a4,a2,0x20
    8000a4f0:	02075713          	srli	a4,a4,0x20
    8000a4f4:	00e587b3          	add	a5,a1,a4
    8000a4f8:	f0f574e3          	bgeu	a0,a5,8000a400 <__memmove+0x1c>
    8000a4fc:	02069613          	slli	a2,a3,0x20
    8000a500:	02065613          	srli	a2,a2,0x20
    8000a504:	fff64613          	not	a2,a2
    8000a508:	00e50733          	add	a4,a0,a4
    8000a50c:	00c78633          	add	a2,a5,a2
    8000a510:	fff7c683          	lbu	a3,-1(a5)
    8000a514:	fff78793          	addi	a5,a5,-1
    8000a518:	fff70713          	addi	a4,a4,-1
    8000a51c:	00d70023          	sb	a3,0(a4)
    8000a520:	fec798e3          	bne	a5,a2,8000a510 <__memmove+0x12c>
    8000a524:	00813403          	ld	s0,8(sp)
    8000a528:	01010113          	addi	sp,sp,16
    8000a52c:	00008067          	ret
    8000a530:	02069713          	slli	a4,a3,0x20
    8000a534:	02075713          	srli	a4,a4,0x20
    8000a538:	00170713          	addi	a4,a4,1
    8000a53c:	00e50733          	add	a4,a0,a4
    8000a540:	00050793          	mv	a5,a0
    8000a544:	0005c683          	lbu	a3,0(a1)
    8000a548:	00178793          	addi	a5,a5,1
    8000a54c:	00158593          	addi	a1,a1,1
    8000a550:	fed78fa3          	sb	a3,-1(a5)
    8000a554:	fee798e3          	bne	a5,a4,8000a544 <__memmove+0x160>
    8000a558:	f89ff06f          	j	8000a4e0 <__memmove+0xfc>
	...
