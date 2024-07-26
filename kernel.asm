
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000f117          	auipc	sp,0xf
    80000004:	1a813103          	ld	sp,424(sp) # 8000f1a8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	028090ef          	jal	ra,80009044 <start>

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
    8000107c:	304030ef          	jal	ra,80004380 <exceptionHandler>


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

0000000080001100 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>:
.global _ZN7_thread13contextSwitchEPNS_14contextWrapperES1_

_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_:
    sd ra, 0(a0)
    80001100:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 8(a0)
    80001104:	00253423          	sd	sp,8(a0)
    sd s0, 16(a0)
    80001108:	00853823          	sd	s0,16(a0)
    sd s1, 24(a0)
    8000110c:	00953c23          	sd	s1,24(a0)
    sd s2, 32(a0)
    80001110:	03253023          	sd	s2,32(a0)
    sd s3, 40(a0)
    80001114:	03353423          	sd	s3,40(a0)
    sd s4, 48(a0)
    80001118:	03453823          	sd	s4,48(a0)
    sd s5, 56(a0)
    8000111c:	03553c23          	sd	s5,56(a0)
    sd s6, 64(a0)
    80001120:	05653023          	sd	s6,64(a0)
    sd s7, 72(a0)
    80001124:	05753423          	sd	s7,72(a0)
    sd s8, 80(a0)
    80001128:	05853823          	sd	s8,80(a0)
    sd s9, 88(a0)
    8000112c:	05953c23          	sd	s9,88(a0)
    sd s10, 96(a0)
    80001130:	07a53023          	sd	s10,96(a0)
    sd s11, 104(a0)
    80001134:	07b53423          	sd	s11,104(a0)
    csrr s0, sstatus
    80001138:	10002473          	csrr	s0,sstatus
    sd s0, 112(a0)
    8000113c:	06853823          	sd	s0,112(a0)

    ld ra, 0(a1)
    80001140:	0005b083          	ld	ra,0(a1)
    ld sp, 8(a1)
    80001144:	0085b103          	ld	sp,8(a1)
    ld s1, 24(a1)
    80001148:	0185b483          	ld	s1,24(a1)
    ld s2, 32(a1)
    8000114c:	0205b903          	ld	s2,32(a1)
    ld s3, 40(a1)
    80001150:	0285b983          	ld	s3,40(a1)
    ld s4, 48(a1)
    80001154:	0305ba03          	ld	s4,48(a1)
    ld s5, 56(a1)
    80001158:	0385ba83          	ld	s5,56(a1)
    ld s6, 64(a1)
    8000115c:	0405bb03          	ld	s6,64(a1)
    ld s7, 72(a1)
    80001160:	0485bb83          	ld	s7,72(a1)
    ld s8, 80(a1)
    80001164:	0505bc03          	ld	s8,80(a1)
    ld s9, 88(a1)
    80001168:	0585bc83          	ld	s9,88(a1)
    ld s10, 96(a1)
    8000116c:	0605bd03          	ld	s10,96(a1)
    ld s11, 104(a1)
    80001170:	0685bd83          	ld	s11,104(a1)
    ld s0, 112(a1)
    80001174:	0705b403          	ld	s0,112(a1)
    csrw sstatus, s0
    80001178:	10041073          	csrw	sstatus,s0
    ld s0, 16(a1)
    8000117c:	0105b403          	ld	s0,16(a1)
    
    80001180:	00008067          	ret

0000000080001184 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001184:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001188:	00b29a63          	bne	t0,a1,8000119c <fail>
    sc.w t0, a2, (a0)      # Try to update.
    8000118c:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001190:	fe029ae3          	bnez	t0,80001184 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001194:	00000513          	li	a0,0
    jr ra                  # Return.
    80001198:	00008067          	ret

000000008000119c <fail>:
    fail:
    li a0, 1               # Set return to failure.
    8000119c:	00100513          	li	a0,1
    800011a0:	00008067          	ret

00000000800011a4 <_Z9threadRunPv>:

int Thread::sleep (time_t time){
    return time_sleep(time);
}

void threadRun(void* arg){
    800011a4:	ff010113          	addi	sp,sp,-16
    800011a8:	00113423          	sd	ra,8(sp)
    800011ac:	00813023          	sd	s0,0(sp)
    800011b0:	01010413          	addi	s0,sp,16
    Thread* thread = (Thread*)arg;
    thread->run();
    800011b4:	00053783          	ld	a5,0(a0)
    800011b8:	0107b783          	ld	a5,16(a5)
    800011bc:	000780e7          	jalr	a5
}
    800011c0:	00813083          	ld	ra,8(sp)
    800011c4:	00013403          	ld	s0,0(sp)
    800011c8:	01010113          	addi	sp,sp,16
    800011cc:	00008067          	ret

00000000800011d0 <_ZN6ThreadD1Ev>:
Thread::~Thread (){
    800011d0:	ff010113          	addi	sp,sp,-16
    800011d4:	00113423          	sd	ra,8(sp)
    800011d8:	00813023          	sd	s0,0(sp)
    800011dc:	01010413          	addi	s0,sp,16
    800011e0:	0000e797          	auipc	a5,0xe
    800011e4:	d8078793          	addi	a5,a5,-640 # 8000ef60 <_ZTV6Thread+0x10>
    800011e8:	00f53023          	sd	a5,0(a0)
    mem_free(myHandle);
    800011ec:	00853503          	ld	a0,8(a0)
    800011f0:	00001097          	auipc	ra,0x1
    800011f4:	be8080e7          	jalr	-1048(ra) # 80001dd8 <_Z8mem_freePv>
}
    800011f8:	00813083          	ld	ra,8(sp)
    800011fc:	00013403          	ld	s0,0(sp)
    80001200:	01010113          	addi	sp,sp,16
    80001204:	00008067          	ret

0000000080001208 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore (unsigned init){
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore (){
    80001208:	ff010113          	addi	sp,sp,-16
    8000120c:	00113423          	sd	ra,8(sp)
    80001210:	00813023          	sd	s0,0(sp)
    80001214:	01010413          	addi	s0,sp,16
    80001218:	0000e797          	auipc	a5,0xe
    8000121c:	d7078793          	addi	a5,a5,-656 # 8000ef88 <_ZTV9Semaphore+0x10>
    80001220:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001224:	00853503          	ld	a0,8(a0)
    80001228:	00001097          	auipc	ra,0x1
    8000122c:	d20080e7          	jalr	-736(ra) # 80001f48 <_Z9sem_closeP4_sem>
}
    80001230:	00813083          	ld	ra,8(sp)
    80001234:	00013403          	ld	s0,0(sp)
    80001238:	01010113          	addi	sp,sp,16
    8000123c:	00008067          	ret

0000000080001240 <_Znwm>:
void* operator new (size_t nSize){
    80001240:	ff010113          	addi	sp,sp,-16
    80001244:	00113423          	sd	ra,8(sp)
    80001248:	00813023          	sd	s0,0(sp)
    8000124c:	01010413          	addi	s0,sp,16
    return mem_alloc(nSize);
    80001250:	00001097          	auipc	ra,0x1
    80001254:	b58080e7          	jalr	-1192(ra) # 80001da8 <_Z9mem_allocm>
}
    80001258:	00813083          	ld	ra,8(sp)
    8000125c:	00013403          	ld	s0,0(sp)
    80001260:	01010113          	addi	sp,sp,16
    80001264:	00008067          	ret

0000000080001268 <_ZdlPv>:
void  operator delete (void* pAddress){
    80001268:	ff010113          	addi	sp,sp,-16
    8000126c:	00113423          	sd	ra,8(sp)
    80001270:	00813023          	sd	s0,0(sp)
    80001274:	01010413          	addi	s0,sp,16
    mem_free(pAddress);
    80001278:	00001097          	auipc	ra,0x1
    8000127c:	b60080e7          	jalr	-1184(ra) # 80001dd8 <_Z8mem_freePv>
}
    80001280:	00813083          	ld	ra,8(sp)
    80001284:	00013403          	ld	s0,0(sp)
    80001288:	01010113          	addi	sp,sp,16
    8000128c:	00008067          	ret

0000000080001290 <_ZN6ThreadD0Ev>:
Thread::~Thread (){
    80001290:	fe010113          	addi	sp,sp,-32
    80001294:	00113c23          	sd	ra,24(sp)
    80001298:	00813823          	sd	s0,16(sp)
    8000129c:	00913423          	sd	s1,8(sp)
    800012a0:	02010413          	addi	s0,sp,32
    800012a4:	00050493          	mv	s1,a0
}
    800012a8:	00000097          	auipc	ra,0x0
    800012ac:	f28080e7          	jalr	-216(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800012b0:	00048513          	mv	a0,s1
    800012b4:	00000097          	auipc	ra,0x0
    800012b8:	fb4080e7          	jalr	-76(ra) # 80001268 <_ZdlPv>
    800012bc:	01813083          	ld	ra,24(sp)
    800012c0:	01013403          	ld	s0,16(sp)
    800012c4:	00813483          	ld	s1,8(sp)
    800012c8:	02010113          	addi	sp,sp,32
    800012cc:	00008067          	ret

00000000800012d0 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore (){
    800012d0:	fe010113          	addi	sp,sp,-32
    800012d4:	00113c23          	sd	ra,24(sp)
    800012d8:	00813823          	sd	s0,16(sp)
    800012dc:	00913423          	sd	s1,8(sp)
    800012e0:	02010413          	addi	s0,sp,32
    800012e4:	00050493          	mv	s1,a0
}
    800012e8:	00000097          	auipc	ra,0x0
    800012ec:	f20080e7          	jalr	-224(ra) # 80001208 <_ZN9SemaphoreD1Ev>
    800012f0:	00048513          	mv	a0,s1
    800012f4:	00000097          	auipc	ra,0x0
    800012f8:	f74080e7          	jalr	-140(ra) # 80001268 <_ZdlPv>
    800012fc:	01813083          	ld	ra,24(sp)
    80001300:	01013403          	ld	s0,16(sp)
    80001304:	00813483          	ld	s1,8(sp)
    80001308:	02010113          	addi	sp,sp,32
    8000130c:	00008067          	ret

0000000080001310 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread (void (*body)(void*), void* arg): body(body), arg(arg){
    80001310:	ff010113          	addi	sp,sp,-16
    80001314:	00813423          	sd	s0,8(sp)
    80001318:	01010413          	addi	s0,sp,16
    8000131c:	0000e797          	auipc	a5,0xe
    80001320:	c4478793          	addi	a5,a5,-956 # 8000ef60 <_ZTV6Thread+0x10>
    80001324:	00f53023          	sd	a5,0(a0)
    80001328:	00b53823          	sd	a1,16(a0)
    8000132c:	00c53c23          	sd	a2,24(a0)
}
    80001330:	00813403          	ld	s0,8(sp)
    80001334:	01010113          	addi	sp,sp,16
    80001338:	00008067          	ret

000000008000133c <_ZN6Thread5startEv>:
int Thread::start (){
    8000133c:	ff010113          	addi	sp,sp,-16
    80001340:	00113423          	sd	ra,8(sp)
    80001344:	00813023          	sd	s0,0(sp)
    80001348:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, body, arg);
    8000134c:	01853603          	ld	a2,24(a0)
    80001350:	01053583          	ld	a1,16(a0)
    80001354:	00850513          	addi	a0,a0,8
    80001358:	00001097          	auipc	ra,0x1
    8000135c:	aac080e7          	jalr	-1364(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
}
    80001360:	00813083          	ld	ra,8(sp)
    80001364:	00013403          	ld	s0,0(sp)
    80001368:	01010113          	addi	sp,sp,16
    8000136c:	00008067          	ret

0000000080001370 <_ZN6Thread4joinEv>:
void Thread::join(){
    80001370:	ff010113          	addi	sp,sp,-16
    80001374:	00113423          	sd	ra,8(sp)
    80001378:	00813023          	sd	s0,0(sp)
    8000137c:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80001380:	00853503          	ld	a0,8(a0)
    80001384:	00001097          	auipc	ra,0x1
    80001388:	b3c080e7          	jalr	-1220(ra) # 80001ec0 <_Z11thread_joinP7_thread>
}
    8000138c:	00813083          	ld	ra,8(sp)
    80001390:	00013403          	ld	s0,0(sp)
    80001394:	01010113          	addi	sp,sp,16
    80001398:	00008067          	ret

000000008000139c <_ZN6Thread8dispatchEv>:
void Thread::dispatch (){
    8000139c:	ff010113          	addi	sp,sp,-16
    800013a0:	00113423          	sd	ra,8(sp)
    800013a4:	00813023          	sd	s0,0(sp)
    800013a8:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800013ac:	00001097          	auipc	ra,0x1
    800013b0:	af4080e7          	jalr	-1292(ra) # 80001ea0 <_Z15thread_dispatchv>
}
    800013b4:	00813083          	ld	ra,8(sp)
    800013b8:	00013403          	ld	s0,0(sp)
    800013bc:	01010113          	addi	sp,sp,16
    800013c0:	00008067          	ret

00000000800013c4 <_ZN6Thread5sleepEm>:
int Thread::sleep (time_t time){
    800013c4:	ff010113          	addi	sp,sp,-16
    800013c8:	00113423          	sd	ra,8(sp)
    800013cc:	00813023          	sd	s0,0(sp)
    800013d0:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    800013d4:	00001097          	auipc	ra,0x1
    800013d8:	b10080e7          	jalr	-1264(ra) # 80001ee4 <_Z10time_sleepm>
}
    800013dc:	00813083          	ld	ra,8(sp)
    800013e0:	00013403          	ld	s0,0(sp)
    800013e4:	01010113          	addi	sp,sp,16
    800013e8:	00008067          	ret

00000000800013ec <_ZN14PeriodicThread3runEv>:
PeriodicThread::PeriodicThread (time_t period): period(period){
    this->period = period;
    active = true;
}

void PeriodicThread::run (){
    800013ec:	fe010113          	addi	sp,sp,-32
    800013f0:	00113c23          	sd	ra,24(sp)
    800013f4:	00813823          	sd	s0,16(sp)
    800013f8:	00913423          	sd	s1,8(sp)
    800013fc:	02010413          	addi	s0,sp,32
    80001400:	00050493          	mv	s1,a0
    while(1){
        periodicActivation();
    80001404:	0004b783          	ld	a5,0(s1)
    80001408:	0187b783          	ld	a5,24(a5)
    8000140c:	00048513          	mv	a0,s1
    80001410:	000780e7          	jalr	a5
        sleep(period);
    80001414:	0204b503          	ld	a0,32(s1)
    80001418:	00000097          	auipc	ra,0x0
    8000141c:	fac080e7          	jalr	-84(ra) # 800013c4 <_ZN6Thread5sleepEm>
    while(1){
    80001420:	fe5ff06f          	j	80001404 <_ZN14PeriodicThread3runEv+0x18>

0000000080001424 <_ZN6ThreadC1Ev>:
Thread::Thread (){
    80001424:	ff010113          	addi	sp,sp,-16
    80001428:	00813423          	sd	s0,8(sp)
    8000142c:	01010413          	addi	s0,sp,16
    80001430:	0000e797          	auipc	a5,0xe
    80001434:	b3078793          	addi	a5,a5,-1232 # 8000ef60 <_ZTV6Thread+0x10>
    80001438:	00f53023          	sd	a5,0(a0)
    body = &threadRun;
    8000143c:	00000797          	auipc	a5,0x0
    80001440:	d6878793          	addi	a5,a5,-664 # 800011a4 <_Z9threadRunPv>
    80001444:	00f53823          	sd	a5,16(a0)
    arg = this;
    80001448:	00a53c23          	sd	a0,24(a0)
}
    8000144c:	00813403          	ld	s0,8(sp)
    80001450:	01010113          	addi	sp,sp,16
    80001454:	00008067          	ret

0000000080001458 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore (unsigned init){
    80001458:	ff010113          	addi	sp,sp,-16
    8000145c:	00113423          	sd	ra,8(sp)
    80001460:	00813023          	sd	s0,0(sp)
    80001464:	01010413          	addi	s0,sp,16
    80001468:	0000e797          	auipc	a5,0xe
    8000146c:	b2078793          	addi	a5,a5,-1248 # 8000ef88 <_ZTV9Semaphore+0x10>
    80001470:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80001474:	00850513          	addi	a0,a0,8
    80001478:	00001097          	auipc	ra,0x1
    8000147c:	a98080e7          	jalr	-1384(ra) # 80001f10 <_Z8sem_openPP4_semj>
}
    80001480:	00813083          	ld	ra,8(sp)
    80001484:	00013403          	ld	s0,0(sp)
    80001488:	01010113          	addi	sp,sp,16
    8000148c:	00008067          	ret

0000000080001490 <_ZN9Semaphore4waitEv>:
int Semaphore::wait (){
    80001490:	ff010113          	addi	sp,sp,-16
    80001494:	00113423          	sd	ra,8(sp)
    80001498:	00813023          	sd	s0,0(sp)
    8000149c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800014a0:	00853503          	ld	a0,8(a0)
    800014a4:	00001097          	auipc	ra,0x1
    800014a8:	ad0080e7          	jalr	-1328(ra) # 80001f74 <_Z8sem_waitP4_sem>
}
    800014ac:	00813083          	ld	ra,8(sp)
    800014b0:	00013403          	ld	s0,0(sp)
    800014b4:	01010113          	addi	sp,sp,16
    800014b8:	00008067          	ret

00000000800014bc <_ZN9Semaphore6signalEv>:
int Semaphore::signal (){
    800014bc:	ff010113          	addi	sp,sp,-16
    800014c0:	00113423          	sd	ra,8(sp)
    800014c4:	00813023          	sd	s0,0(sp)
    800014c8:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    800014cc:	00853503          	ld	a0,8(a0)
    800014d0:	00001097          	auipc	ra,0x1
    800014d4:	ad0080e7          	jalr	-1328(ra) # 80001fa0 <_Z10sem_signalP4_sem>
}
    800014d8:	00813083          	ld	ra,8(sp)
    800014dc:	00013403          	ld	s0,0(sp)
    800014e0:	01010113          	addi	sp,sp,16
    800014e4:	00008067          	ret

00000000800014e8 <_ZN9Semaphore7trywaitEv>:
int Semaphore::trywait (){
    800014e8:	ff010113          	addi	sp,sp,-16
    800014ec:	00113423          	sd	ra,8(sp)
    800014f0:	00813023          	sd	s0,0(sp)
    800014f4:	01010413          	addi	s0,sp,16
    return sem_trywait(myHandle);
    800014f8:	00853503          	ld	a0,8(a0)
    800014fc:	00001097          	auipc	ra,0x1
    80001500:	ad0080e7          	jalr	-1328(ra) # 80001fcc <_Z11sem_trywaitP4_sem>
}
    80001504:	00813083          	ld	ra,8(sp)
    80001508:	00013403          	ld	s0,0(sp)
    8000150c:	01010113          	addi	sp,sp,16
    80001510:	00008067          	ret

0000000080001514 <_ZN9Semaphore9timedwaitEm>:
int Semaphore::timedwait (time_t time){
    80001514:	ff010113          	addi	sp,sp,-16
    80001518:	00113423          	sd	ra,8(sp)
    8000151c:	00813023          	sd	s0,0(sp)
    80001520:	01010413          	addi	s0,sp,16
    return sem_timedwait(myHandle, time);
    80001524:	00853503          	ld	a0,8(a0)
    80001528:	00001097          	auipc	ra,0x1
    8000152c:	ad0080e7          	jalr	-1328(ra) # 80001ff8 <_Z13sem_timedwaitP4_semm>
}
    80001530:	00813083          	ld	ra,8(sp)
    80001534:	00013403          	ld	s0,0(sp)
    80001538:	01010113          	addi	sp,sp,16
    8000153c:	00008067          	ret

0000000080001540 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate (){
    80001540:	ff010113          	addi	sp,sp,-16
    80001544:	00113423          	sd	ra,8(sp)
    80001548:	00813023          	sd	s0,0(sp)
    8000154c:	01010413          	addi	s0,sp,16
    myHandle->setClosed(true);
    80001550:	00100593          	li	a1,1
    80001554:	00853503          	ld	a0,8(a0)
    80001558:	00001097          	auipc	ra,0x1
    8000155c:	f10080e7          	jalr	-240(ra) # 80002468 <_ZN7_thread9setClosedEb>
}
    80001560:	00813083          	ld	ra,8(sp)
    80001564:	00013403          	ld	s0,0(sp)
    80001568:	01010113          	addi	sp,sp,16
    8000156c:	00008067          	ret

0000000080001570 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread (time_t period): period(period){
    80001570:	fe010113          	addi	sp,sp,-32
    80001574:	00113c23          	sd	ra,24(sp)
    80001578:	00813823          	sd	s0,16(sp)
    8000157c:	00913423          	sd	s1,8(sp)
    80001580:	01213023          	sd	s2,0(sp)
    80001584:	02010413          	addi	s0,sp,32
    80001588:	00050493          	mv	s1,a0
    8000158c:	00058913          	mv	s2,a1
    80001590:	00000097          	auipc	ra,0x0
    80001594:	e94080e7          	jalr	-364(ra) # 80001424 <_ZN6ThreadC1Ev>
    80001598:	0000e797          	auipc	a5,0xe
    8000159c:	a1078793          	addi	a5,a5,-1520 # 8000efa8 <_ZTV14PeriodicThread+0x10>
    800015a0:	00f4b023          	sd	a5,0(s1)
    800015a4:	0324b023          	sd	s2,32(s1)
    active = true;
    800015a8:	00100793          	li	a5,1
    800015ac:	02f48423          	sb	a5,40(s1)
}
    800015b0:	01813083          	ld	ra,24(sp)
    800015b4:	01013403          	ld	s0,16(sp)
    800015b8:	00813483          	ld	s1,8(sp)
    800015bc:	00013903          	ld	s2,0(sp)
    800015c0:	02010113          	addi	sp,sp,32
    800015c4:	00008067          	ret

00000000800015c8 <_ZN7Console4putcEc>:
    }
}



void Console::putc (char c){
    800015c8:	ff010113          	addi	sp,sp,-16
    800015cc:	00113423          	sd	ra,8(sp)
    800015d0:	00813023          	sd	s0,0(sp)
    800015d4:	01010413          	addi	s0,sp,16
    putc(c);
    800015d8:	00000097          	auipc	ra,0x0
    800015dc:	ff0080e7          	jalr	-16(ra) # 800015c8 <_ZN7Console4putcEc>
}
    800015e0:	00813083          	ld	ra,8(sp)
    800015e4:	00013403          	ld	s0,0(sp)
    800015e8:	01010113          	addi	sp,sp,16
    800015ec:	00008067          	ret

00000000800015f0 <_ZN7Console4getcEv>:

char Console::getc (){
    800015f0:	ff010113          	addi	sp,sp,-16
    800015f4:	00113423          	sd	ra,8(sp)
    800015f8:	00813023          	sd	s0,0(sp)
    800015fc:	01010413          	addi	s0,sp,16
    return getc();
    80001600:	00000097          	auipc	ra,0x0
    80001604:	ff0080e7          	jalr	-16(ra) # 800015f0 <_ZN7Console4getcEv>
    80001608:	00813083          	ld	ra,8(sp)
    8000160c:	00013403          	ld	s0,0(sp)
    80001610:	01010113          	addi	sp,sp,16
    80001614:	00008067          	ret

0000000080001618 <_ZN6Thread3runEv>:
    void join();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
    80001618:	ff010113          	addi	sp,sp,-16
    8000161c:	00813423          	sd	s0,8(sp)
    80001620:	01010413          	addi	s0,sp,16
    80001624:	00813403          	ld	s0,8(sp)
    80001628:	01010113          	addi	sp,sp,16
    8000162c:	00008067          	ret

0000000080001630 <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate ();
protected:
    void run () override;
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    80001630:	ff010113          	addi	sp,sp,-16
    80001634:	00813423          	sd	s0,8(sp)
    80001638:	01010413          	addi	s0,sp,16
    8000163c:	00813403          	ld	s0,8(sp)
    80001640:	01010113          	addi	sp,sp,16
    80001644:	00008067          	ret

0000000080001648 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80001648:	ff010113          	addi	sp,sp,-16
    8000164c:	00113423          	sd	ra,8(sp)
    80001650:	00813023          	sd	s0,0(sp)
    80001654:	01010413          	addi	s0,sp,16
    80001658:	0000e797          	auipc	a5,0xe
    8000165c:	95078793          	addi	a5,a5,-1712 # 8000efa8 <_ZTV14PeriodicThread+0x10>
    80001660:	00f53023          	sd	a5,0(a0)
    80001664:	00000097          	auipc	ra,0x0
    80001668:	b6c080e7          	jalr	-1172(ra) # 800011d0 <_ZN6ThreadD1Ev>
    8000166c:	00813083          	ld	ra,8(sp)
    80001670:	00013403          	ld	s0,0(sp)
    80001674:	01010113          	addi	sp,sp,16
    80001678:	00008067          	ret

000000008000167c <_ZN14PeriodicThreadD0Ev>:
    8000167c:	fe010113          	addi	sp,sp,-32
    80001680:	00113c23          	sd	ra,24(sp)
    80001684:	00813823          	sd	s0,16(sp)
    80001688:	00913423          	sd	s1,8(sp)
    8000168c:	02010413          	addi	s0,sp,32
    80001690:	00050493          	mv	s1,a0
    80001694:	0000e797          	auipc	a5,0xe
    80001698:	91478793          	addi	a5,a5,-1772 # 8000efa8 <_ZTV14PeriodicThread+0x10>
    8000169c:	00f53023          	sd	a5,0(a0)
    800016a0:	00000097          	auipc	ra,0x0
    800016a4:	b30080e7          	jalr	-1232(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800016a8:	00048513          	mv	a0,s1
    800016ac:	00000097          	auipc	ra,0x0
    800016b0:	bbc080e7          	jalr	-1092(ra) # 80001268 <_ZdlPv>
    800016b4:	01813083          	ld	ra,24(sp)
    800016b8:	01013403          	ld	s0,16(sp)
    800016bc:	00813483          	ld	s1,8(sp)
    800016c0:	02010113          	addi	sp,sp,32
    800016c4:	00008067          	ret

00000000800016c8 <_Z13thread_test_1Pv>:

sem_t sem1, sem2;

char c;

void thread_test_1(void* args){
    800016c8:	ff010113          	addi	sp,sp,-16
    800016cc:	00113423          	sd	ra,8(sp)
    800016d0:	00813023          	sd	s0,0(sp)
    800016d4:	01010413          	addi	s0,sp,16
    putc('1');
    800016d8:	03100513          	li	a0,49
    800016dc:	00001097          	auipc	ra,0x1
    800016e0:	974080e7          	jalr	-1676(ra) # 80002050 <_Z4putcc>
    putc('s');
    800016e4:	07300513          	li	a0,115
    800016e8:	00001097          	auipc	ra,0x1
    800016ec:	968080e7          	jalr	-1688(ra) # 80002050 <_Z4putcc>
    if(c == 't')time_sleep(60);
    800016f0:	0000e717          	auipc	a4,0xe
    800016f4:	b2074703          	lbu	a4,-1248(a4) # 8000f210 <c>
    800016f8:	07400793          	li	a5,116
    800016fc:	02f70e63          	beq	a4,a5,80001738 <_Z13thread_test_1Pv+0x70>
    putc('1');
    80001700:	03100513          	li	a0,49
    80001704:	00001097          	auipc	ra,0x1
    80001708:	94c080e7          	jalr	-1716(ra) # 80002050 <_Z4putcc>
    if(c == 's')sem_signal(sem1);
    8000170c:	0000e717          	auipc	a4,0xe
    80001710:	b0474703          	lbu	a4,-1276(a4) # 8000f210 <c>
    80001714:	07300793          	li	a5,115
    80001718:	02f70863          	beq	a4,a5,80001748 <_Z13thread_test_1Pv+0x80>
    putc('S');
    8000171c:	05300513          	li	a0,83
    80001720:	00001097          	auipc	ra,0x1
    80001724:	930080e7          	jalr	-1744(ra) # 80002050 <_Z4putcc>
}
    80001728:	00813083          	ld	ra,8(sp)
    8000172c:	00013403          	ld	s0,0(sp)
    80001730:	01010113          	addi	sp,sp,16
    80001734:	00008067          	ret
    if(c == 't')time_sleep(60);
    80001738:	03c00513          	li	a0,60
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	7a8080e7          	jalr	1960(ra) # 80001ee4 <_Z10time_sleepm>
    80001744:	fbdff06f          	j	80001700 <_Z13thread_test_1Pv+0x38>
    if(c == 's')sem_signal(sem1);
    80001748:	0000e517          	auipc	a0,0xe
    8000174c:	ad053503          	ld	a0,-1328(a0) # 8000f218 <sem1>
    80001750:	00001097          	auipc	ra,0x1
    80001754:	850080e7          	jalr	-1968(ra) # 80001fa0 <_Z10sem_signalP4_sem>
    80001758:	fc5ff06f          	j	8000171c <_Z13thread_test_1Pv+0x54>

000000008000175c <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    8000175c:	ff010113          	addi	sp,sp,-16
    80001760:	00113423          	sd	ra,8(sp)
    80001764:	00813023          	sd	s0,0(sp)
    80001768:	01010413          	addi	s0,sp,16
    putc('2');
    8000176c:	03200513          	li	a0,50
    80001770:	00001097          	auipc	ra,0x1
    80001774:	8e0080e7          	jalr	-1824(ra) # 80002050 <_Z4putcc>
    putc('s');
    80001778:	07300513          	li	a0,115
    8000177c:	00001097          	auipc	ra,0x1
    80001780:	8d4080e7          	jalr	-1836(ra) # 80002050 <_Z4putcc>
    if(c == 't')time_sleep(30);
    80001784:	0000e717          	auipc	a4,0xe
    80001788:	a8c74703          	lbu	a4,-1396(a4) # 8000f210 <c>
    8000178c:	07400793          	li	a5,116
    80001790:	02f70e63          	beq	a4,a5,800017cc <_Z13thread_test_2Pv+0x70>
    putc('2');
    80001794:	03200513          	li	a0,50
    80001798:	00001097          	auipc	ra,0x1
    8000179c:	8b8080e7          	jalr	-1864(ra) # 80002050 <_Z4putcc>
    if(c == 's')sem_signal(sem2);
    800017a0:	0000e717          	auipc	a4,0xe
    800017a4:	a7074703          	lbu	a4,-1424(a4) # 8000f210 <c>
    800017a8:	07300793          	li	a5,115
    800017ac:	02f70863          	beq	a4,a5,800017dc <_Z13thread_test_2Pv+0x80>
    putc('S');
    800017b0:	05300513          	li	a0,83
    800017b4:	00001097          	auipc	ra,0x1
    800017b8:	89c080e7          	jalr	-1892(ra) # 80002050 <_Z4putcc>
}
    800017bc:	00813083          	ld	ra,8(sp)
    800017c0:	00013403          	ld	s0,0(sp)
    800017c4:	01010113          	addi	sp,sp,16
    800017c8:	00008067          	ret
    if(c == 't')time_sleep(30);
    800017cc:	01e00513          	li	a0,30
    800017d0:	00000097          	auipc	ra,0x0
    800017d4:	714080e7          	jalr	1812(ra) # 80001ee4 <_Z10time_sleepm>
    800017d8:	fbdff06f          	j	80001794 <_Z13thread_test_2Pv+0x38>
    if(c == 's')sem_signal(sem2);
    800017dc:	0000e517          	auipc	a0,0xe
    800017e0:	a4453503          	ld	a0,-1468(a0) # 8000f220 <sem2>
    800017e4:	00000097          	auipc	ra,0x0
    800017e8:	7bc080e7          	jalr	1980(ra) # 80001fa0 <_Z10sem_signalP4_sem>
    800017ec:	fc5ff06f          	j	800017b0 <_Z13thread_test_2Pv+0x54>

00000000800017f0 <_Z7memTestv>:
void memTest(){
    800017f0:	fd010113          	addi	sp,sp,-48
    800017f4:	02113423          	sd	ra,40(sp)
    800017f8:	02813023          	sd	s0,32(sp)
    800017fc:	00913c23          	sd	s1,24(sp)
    80001800:	01213823          	sd	s2,16(sp)
    80001804:	01313423          	sd	s3,8(sp)
    80001808:	01413023          	sd	s4,0(sp)
    8000180c:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80001810:	0000e797          	auipc	a5,0xe
    80001814:	9907b783          	ld	a5,-1648(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001818:	0007b503          	ld	a0,0(a5)
    8000181c:	00002097          	auipc	ra,0x2
    80001820:	994080e7          	jalr	-1644(ra) # 800031b0 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80001824:	00050993          	mv	s3,a0
    putc('F');
    80001828:	04600513          	li	a0,70
    8000182c:	00001097          	auipc	ra,0x1
    80001830:	824080e7          	jalr	-2012(ra) # 80002050 <_Z4putcc>
    putc('r');
    80001834:	07200513          	li	a0,114
    80001838:	00001097          	auipc	ra,0x1
    8000183c:	818080e7          	jalr	-2024(ra) # 80002050 <_Z4putcc>
    putc('e');
    80001840:	06500513          	li	a0,101
    80001844:	00001097          	auipc	ra,0x1
    80001848:	80c080e7          	jalr	-2036(ra) # 80002050 <_Z4putcc>
    putc('e');
    8000184c:	06500513          	li	a0,101
    80001850:	00001097          	auipc	ra,0x1
    80001854:	800080e7          	jalr	-2048(ra) # 80002050 <_Z4putcc>
    putc(' ');
    80001858:	02000513          	li	a0,32
    8000185c:	00000097          	auipc	ra,0x0
    80001860:	7f4080e7          	jalr	2036(ra) # 80002050 <_Z4putcc>
    putc('m');
    80001864:	06d00513          	li	a0,109
    80001868:	00000097          	auipc	ra,0x0
    8000186c:	7e8080e7          	jalr	2024(ra) # 80002050 <_Z4putcc>
    putc('e');
    80001870:	06500513          	li	a0,101
    80001874:	00000097          	auipc	ra,0x0
    80001878:	7dc080e7          	jalr	2012(ra) # 80002050 <_Z4putcc>
    putc('m');
    8000187c:	06d00513          	li	a0,109
    80001880:	00000097          	auipc	ra,0x0
    80001884:	7d0080e7          	jalr	2000(ra) # 80002050 <_Z4putcc>
    putc('o');
    80001888:	06f00513          	li	a0,111
    8000188c:	00000097          	auipc	ra,0x0
    80001890:	7c4080e7          	jalr	1988(ra) # 80002050 <_Z4putcc>
    putc('r');
    80001894:	07200513          	li	a0,114
    80001898:	00000097          	auipc	ra,0x0
    8000189c:	7b8080e7          	jalr	1976(ra) # 80002050 <_Z4putcc>
    putc('y');
    800018a0:	07900513          	li	a0,121
    800018a4:	00000097          	auipc	ra,0x0
    800018a8:	7ac080e7          	jalr	1964(ra) # 80002050 <_Z4putcc>
    putc(':');
    800018ac:	03a00513          	li	a0,58
    800018b0:	00000097          	auipc	ra,0x0
    800018b4:	7a0080e7          	jalr	1952(ra) # 80002050 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800018b8:	00f00493          	li	s1,15
    800018bc:	0140006f          	j	800018d0 <_Z7memTestv+0xe0>
            putc('a' + digit - 10);
    800018c0:	05750513          	addi	a0,a0,87
    800018c4:	00000097          	auipc	ra,0x0
    800018c8:	78c080e7          	jalr	1932(ra) # 80002050 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    800018cc:	fff4849b          	addiw	s1,s1,-1
    800018d0:	0204c463          	bltz	s1,800018f8 <_Z7memTestv+0x108>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    800018d4:	0024951b          	slliw	a0,s1,0x2
    800018d8:	00a9d533          	srl	a0,s3,a0
    800018dc:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    800018e0:	00900793          	li	a5,9
    800018e4:	fca7cee3          	blt	a5,a0,800018c0 <_Z7memTestv+0xd0>
            putc('0' + digit);
    800018e8:	03050513          	addi	a0,a0,48
    800018ec:	00000097          	auipc	ra,0x0
    800018f0:	764080e7          	jalr	1892(ra) # 80002050 <_Z4putcc>
    800018f4:	fd9ff06f          	j	800018cc <_Z7memTestv+0xdc>
    putc('\n');
    800018f8:	00a00513          	li	a0,10
    800018fc:	00000097          	auipc	ra,0x0
    80001900:	754080e7          	jalr	1876(ra) # 80002050 <_Z4putcc>
    int** matrix = (int**)mem_alloc(sizeof(int*) * n);
    80001904:	32000513          	li	a0,800
    80001908:	00000097          	auipc	ra,0x0
    8000190c:	4a0080e7          	jalr	1184(ra) # 80001da8 <_Z9mem_allocm>
    80001910:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    80001914:	00000493          	li	s1,0
    80001918:	0080006f          	j	80001920 <_Z7memTestv+0x130>
    8000191c:	0014849b          	addiw	s1,s1,1
    80001920:	06300793          	li	a5,99
    80001924:	0497c663          	blt	a5,s1,80001970 <_Z7memTestv+0x180>
        matrix[i] = (int*)mem_alloc(sizeof(int) * k);
    80001928:	00349a13          	slli	s4,s1,0x3
    8000192c:	01490a33          	add	s4,s2,s4
    80001930:	19000513          	li	a0,400
    80001934:	00000097          	auipc	ra,0x0
    80001938:	474080e7          	jalr	1140(ra) # 80001da8 <_Z9mem_allocm>
    8000193c:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    80001940:	00000713          	li	a4,0
    80001944:	06300793          	li	a5,99
    80001948:	fce7cae3          	blt	a5,a4,8000191c <_Z7memTestv+0x12c>
            matrix[i][j] = i * k + j;
    8000194c:	06400793          	li	a5,100
    80001950:	029787bb          	mulw	a5,a5,s1
    80001954:	000a3683          	ld	a3,0(s4)
    80001958:	00271613          	slli	a2,a4,0x2
    8000195c:	00c686b3          	add	a3,a3,a2
    80001960:	00e787bb          	addw	a5,a5,a4
    80001964:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80001968:	0017071b          	addiw	a4,a4,1
    8000196c:	fd9ff06f          	j	80001944 <_Z7memTestv+0x154>
    for(int i = 0; i < n; i++){
    80001970:	00000a13          	li	s4,0
    80001974:	0780006f          	j	800019ec <_Z7memTestv+0x1fc>
        for(int j = 0; j < k; j++){
    80001978:	0014849b          	addiw	s1,s1,1
    8000197c:	06300793          	li	a5,99
    80001980:	0497ca63          	blt	a5,s1,800019d4 <_Z7memTestv+0x1e4>
            assert(matrix[i][j] == i * k + j);
    80001984:	003a1793          	slli	a5,s4,0x3
    80001988:	00f907b3          	add	a5,s2,a5
    8000198c:	0007b783          	ld	a5,0(a5)
    80001990:	00249713          	slli	a4,s1,0x2
    80001994:	00e787b3          	add	a5,a5,a4
    80001998:	0007a703          	lw	a4,0(a5)
    8000199c:	06400793          	li	a5,100
    800019a0:	034787bb          	mulw	a5,a5,s4
    800019a4:	009787bb          	addw	a5,a5,s1
    800019a8:	fcf708e3          	beq	a4,a5,80001978 <_Z7memTestv+0x188>
    800019ac:	0000a697          	auipc	a3,0xa
    800019b0:	67468693          	addi	a3,a3,1652 # 8000c020 <CONSOLE_STATUS+0x10>
    800019b4:	02d00613          	li	a2,45
    800019b8:	0000a597          	auipc	a1,0xa
    800019bc:	67858593          	addi	a1,a1,1656 # 8000c030 <CONSOLE_STATUS+0x20>
    800019c0:	0000a517          	auipc	a0,0xa
    800019c4:	68850513          	addi	a0,a0,1672 # 8000c048 <CONSOLE_STATUS+0x38>
    800019c8:	00004097          	auipc	ra,0x4
    800019cc:	97c080e7          	jalr	-1668(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    800019d0:	fa9ff06f          	j	80001978 <_Z7memTestv+0x188>
        mem_free(matrix[i]);
    800019d4:	003a1793          	slli	a5,s4,0x3
    800019d8:	00f907b3          	add	a5,s2,a5
    800019dc:	0007b503          	ld	a0,0(a5)
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	3f8080e7          	jalr	1016(ra) # 80001dd8 <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    800019e8:	001a0a1b          	addiw	s4,s4,1
    800019ec:	06300793          	li	a5,99
    800019f0:	0147c663          	blt	a5,s4,800019fc <_Z7memTestv+0x20c>
        for(int j = 0; j < k; j++){
    800019f4:	00000493          	li	s1,0
    800019f8:	f85ff06f          	j	8000197c <_Z7memTestv+0x18c>
    mem_free(matrix);
    800019fc:	00090513          	mv	a0,s2
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	3d8080e7          	jalr	984(ra) # 80001dd8 <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80001a08:	0000d797          	auipc	a5,0xd
    80001a0c:	7987b783          	ld	a5,1944(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001a10:	0007b503          	ld	a0,0(a5)
    80001a14:	00001097          	auipc	ra,0x1
    80001a18:	79c080e7          	jalr	1948(ra) # 800031b0 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80001a1c:	00050493          	mv	s1,a0
    putc('F');
    80001a20:	04600513          	li	a0,70
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	62c080e7          	jalr	1580(ra) # 80002050 <_Z4putcc>
    putc('r');
    80001a2c:	07200513          	li	a0,114
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	620080e7          	jalr	1568(ra) # 80002050 <_Z4putcc>
    putc('e');
    80001a38:	06500513          	li	a0,101
    80001a3c:	00000097          	auipc	ra,0x0
    80001a40:	614080e7          	jalr	1556(ra) # 80002050 <_Z4putcc>
    putc('e');
    80001a44:	06500513          	li	a0,101
    80001a48:	00000097          	auipc	ra,0x0
    80001a4c:	608080e7          	jalr	1544(ra) # 80002050 <_Z4putcc>
    putc(' ');
    80001a50:	02000513          	li	a0,32
    80001a54:	00000097          	auipc	ra,0x0
    80001a58:	5fc080e7          	jalr	1532(ra) # 80002050 <_Z4putcc>
    putc('m');
    80001a5c:	06d00513          	li	a0,109
    80001a60:	00000097          	auipc	ra,0x0
    80001a64:	5f0080e7          	jalr	1520(ra) # 80002050 <_Z4putcc>
    putc('e');
    80001a68:	06500513          	li	a0,101
    80001a6c:	00000097          	auipc	ra,0x0
    80001a70:	5e4080e7          	jalr	1508(ra) # 80002050 <_Z4putcc>
    putc('m');
    80001a74:	06d00513          	li	a0,109
    80001a78:	00000097          	auipc	ra,0x0
    80001a7c:	5d8080e7          	jalr	1496(ra) # 80002050 <_Z4putcc>
    putc('o');
    80001a80:	06f00513          	li	a0,111
    80001a84:	00000097          	auipc	ra,0x0
    80001a88:	5cc080e7          	jalr	1484(ra) # 80002050 <_Z4putcc>
    putc('r');
    80001a8c:	07200513          	li	a0,114
    80001a90:	00000097          	auipc	ra,0x0
    80001a94:	5c0080e7          	jalr	1472(ra) # 80002050 <_Z4putcc>
    putc('y');
    80001a98:	07900513          	li	a0,121
    80001a9c:	00000097          	auipc	ra,0x0
    80001aa0:	5b4080e7          	jalr	1460(ra) # 80002050 <_Z4putcc>
    putc(':');
    80001aa4:	03a00513          	li	a0,58
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	5a8080e7          	jalr	1448(ra) # 80002050 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001ab0:	00f00913          	li	s2,15
    80001ab4:	0140006f          	j	80001ac8 <_Z7memTestv+0x2d8>
            putc('a' + digit - 10);
    80001ab8:	05750513          	addi	a0,a0,87
    80001abc:	00000097          	auipc	ra,0x0
    80001ac0:	594080e7          	jalr	1428(ra) # 80002050 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001ac4:	fff9091b          	addiw	s2,s2,-1
    80001ac8:	02094463          	bltz	s2,80001af0 <_Z7memTestv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    80001acc:	0029151b          	slliw	a0,s2,0x2
    80001ad0:	00a4d533          	srl	a0,s1,a0
    80001ad4:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80001ad8:	00900793          	li	a5,9
    80001adc:	fca7cee3          	blt	a5,a0,80001ab8 <_Z7memTestv+0x2c8>
            putc('0' + digit);
    80001ae0:	03050513          	addi	a0,a0,48
    80001ae4:	00000097          	auipc	ra,0x0
    80001ae8:	56c080e7          	jalr	1388(ra) # 80002050 <_Z4putcc>
    80001aec:	fd9ff06f          	j	80001ac4 <_Z7memTestv+0x2d4>
    putc('\n');
    80001af0:	00a00513          	li	a0,10
    80001af4:	00000097          	auipc	ra,0x0
    80001af8:	55c080e7          	jalr	1372(ra) # 80002050 <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    80001afc:	409989b3          	sub	s3,s3,s1
    putc('D');
    80001b00:	04400513          	li	a0,68
    80001b04:	00000097          	auipc	ra,0x0
    80001b08:	54c080e7          	jalr	1356(ra) # 80002050 <_Z4putcc>
    putc('i');
    80001b0c:	06900513          	li	a0,105
    80001b10:	00000097          	auipc	ra,0x0
    80001b14:	540080e7          	jalr	1344(ra) # 80002050 <_Z4putcc>
    putc('f');
    80001b18:	06600513          	li	a0,102
    80001b1c:	00000097          	auipc	ra,0x0
    80001b20:	534080e7          	jalr	1332(ra) # 80002050 <_Z4putcc>
    putc('f');
    80001b24:	06600513          	li	a0,102
    80001b28:	00000097          	auipc	ra,0x0
    80001b2c:	528080e7          	jalr	1320(ra) # 80002050 <_Z4putcc>
    putc('e');
    80001b30:	06500513          	li	a0,101
    80001b34:	00000097          	auipc	ra,0x0
    80001b38:	51c080e7          	jalr	1308(ra) # 80002050 <_Z4putcc>
    putc('r');
    80001b3c:	07200513          	li	a0,114
    80001b40:	00000097          	auipc	ra,0x0
    80001b44:	510080e7          	jalr	1296(ra) # 80002050 <_Z4putcc>
    putc('e');
    80001b48:	06500513          	li	a0,101
    80001b4c:	00000097          	auipc	ra,0x0
    80001b50:	504080e7          	jalr	1284(ra) # 80002050 <_Z4putcc>
    putc('n');
    80001b54:	06e00513          	li	a0,110
    80001b58:	00000097          	auipc	ra,0x0
    80001b5c:	4f8080e7          	jalr	1272(ra) # 80002050 <_Z4putcc>
    putc('c');
    80001b60:	06300513          	li	a0,99
    80001b64:	00000097          	auipc	ra,0x0
    80001b68:	4ec080e7          	jalr	1260(ra) # 80002050 <_Z4putcc>
    putc('e');
    80001b6c:	06500513          	li	a0,101
    80001b70:	00000097          	auipc	ra,0x0
    80001b74:	4e0080e7          	jalr	1248(ra) # 80002050 <_Z4putcc>
    putc(':');
    80001b78:	03a00513          	li	a0,58
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	4d4080e7          	jalr	1236(ra) # 80002050 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001b84:	00f00493          	li	s1,15
    80001b88:	0140006f          	j	80001b9c <_Z7memTestv+0x3ac>
            putc('a' + digit - 10);
    80001b8c:	05750513          	addi	a0,a0,87
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	4c0080e7          	jalr	1216(ra) # 80002050 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001b98:	fff4849b          	addiw	s1,s1,-1
    80001b9c:	0204c463          	bltz	s1,80001bc4 <_Z7memTestv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    80001ba0:	0024951b          	slliw	a0,s1,0x2
    80001ba4:	00a9d533          	srl	a0,s3,a0
    80001ba8:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80001bac:	00900793          	li	a5,9
    80001bb0:	fca7cee3          	blt	a5,a0,80001b8c <_Z7memTestv+0x39c>
            putc('0' + digit);
    80001bb4:	03050513          	addi	a0,a0,48
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	498080e7          	jalr	1176(ra) # 80002050 <_Z4putcc>
    80001bc0:	fd9ff06f          	j	80001b98 <_Z7memTestv+0x3a8>
    putc('\n');
    80001bc4:	00a00513          	li	a0,10
    80001bc8:	00000097          	auipc	ra,0x0
    80001bcc:	488080e7          	jalr	1160(ra) # 80002050 <_Z4putcc>
    putc('\n');
    80001bd0:	00a00513          	li	a0,10
    80001bd4:	00000097          	auipc	ra,0x0
    80001bd8:	47c080e7          	jalr	1148(ra) # 80002050 <_Z4putcc>
    putc('\n');
    80001bdc:	00a00513          	li	a0,10
    80001be0:	00000097          	auipc	ra,0x0
    80001be4:	470080e7          	jalr	1136(ra) # 80002050 <_Z4putcc>
}
    80001be8:	02813083          	ld	ra,40(sp)
    80001bec:	02013403          	ld	s0,32(sp)
    80001bf0:	01813483          	ld	s1,24(sp)
    80001bf4:	01013903          	ld	s2,16(sp)
    80001bf8:	00813983          	ld	s3,8(sp)
    80001bfc:	00013a03          	ld	s4,0(sp)
    80001c00:	03010113          	addi	sp,sp,48
    80001c04:	00008067          	ret

0000000080001c08 <_Z8usermainPv>:


void usermain(void* arg){
    80001c08:	fd010113          	addi	sp,sp,-48
    80001c0c:	02113423          	sd	ra,40(sp)
    80001c10:	02813023          	sd	s0,32(sp)
    80001c14:	00913c23          	sd	s1,24(sp)
    80001c18:	03010413          	addi	s0,sp,48
    c = 't';
    80001c1c:	0000d497          	auipc	s1,0xd
    80001c20:	5f448493          	addi	s1,s1,1524 # 8000f210 <c>
    80001c24:	07400793          	li	a5,116
    80001c28:	00f48023          	sb	a5,0(s1)
    if(c == 'm'){
        memTest();
        return;
    }
    putc('0');
    80001c2c:	03000513          	li	a0,48
    80001c30:	00000097          	auipc	ra,0x0
    80001c34:	420080e7          	jalr	1056(ra) # 80002050 <_Z4putcc>
    thread_t t1, t2;
    if(c == 's'){
    80001c38:	0004c703          	lbu	a4,0(s1)
    80001c3c:	07300793          	li	a5,115
    80001c40:	0cf70663          	beq	a4,a5,80001d0c <_Z8usermainPv+0x104>
        sem_open(&sem1, 0);
        sem_open(&sem2, 0);
    }
    thread_create(&t1, thread_test_1, 0);
    80001c44:	00000613          	li	a2,0
    80001c48:	00000597          	auipc	a1,0x0
    80001c4c:	a8058593          	addi	a1,a1,-1408 # 800016c8 <_Z13thread_test_1Pv>
    80001c50:	fd840513          	addi	a0,s0,-40
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	1b0080e7          	jalr	432(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80001c5c:	00000613          	li	a2,0
    80001c60:	00000597          	auipc	a1,0x0
    80001c64:	afc58593          	addi	a1,a1,-1284 # 8000175c <_Z13thread_test_2Pv>
    80001c68:	fd040513          	addi	a0,s0,-48
    80001c6c:	00000097          	auipc	ra,0x0
    80001c70:	198080e7          	jalr	408(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    if(c == 's')sem_wait(sem1);
    80001c74:	0000d717          	auipc	a4,0xd
    80001c78:	59c74703          	lbu	a4,1436(a4) # 8000f210 <c>
    80001c7c:	07300793          	li	a5,115
    80001c80:	0af70c63          	beq	a4,a5,80001d38 <_Z8usermainPv+0x130>
    putc('3');
    80001c84:	03300513          	li	a0,51
    80001c88:	00000097          	auipc	ra,0x0
    80001c8c:	3c8080e7          	jalr	968(ra) # 80002050 <_Z4putcc>
    if(c == 't')thread_join(t2);
    80001c90:	0000d717          	auipc	a4,0xd
    80001c94:	58074703          	lbu	a4,1408(a4) # 8000f210 <c>
    80001c98:	07400793          	li	a5,116
    80001c9c:	0af70863          	beq	a4,a5,80001d4c <_Z8usermainPv+0x144>
    putc('4');
    80001ca0:	03400513          	li	a0,52
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	3ac080e7          	jalr	940(ra) # 80002050 <_Z4putcc>
    if(c == 't')thread_join(t1);
    80001cac:	0000d717          	auipc	a4,0xd
    80001cb0:	56474703          	lbu	a4,1380(a4) # 8000f210 <c>
    80001cb4:	07400793          	li	a5,116
    80001cb8:	0af70263          	beq	a4,a5,80001d5c <_Z8usermainPv+0x154>
    if(c == 's')sem_wait(sem2);
    80001cbc:	0000d717          	auipc	a4,0xd
    80001cc0:	55474703          	lbu	a4,1364(a4) # 8000f210 <c>
    80001cc4:	07300793          	li	a5,115
    80001cc8:	0af70263          	beq	a4,a5,80001d6c <_Z8usermainPv+0x164>
    putc('5');
    80001ccc:	03500513          	li	a0,53
    80001cd0:	00000097          	auipc	ra,0x0
    80001cd4:	380080e7          	jalr	896(ra) # 80002050 <_Z4putcc>
    if(c == 's')sem_close(sem1);
    80001cd8:	0000d717          	auipc	a4,0xd
    80001cdc:	53874703          	lbu	a4,1336(a4) # 8000f210 <c>
    80001ce0:	07300793          	li	a5,115
    80001ce4:	08f70e63          	beq	a4,a5,80001d80 <_Z8usermainPv+0x178>
    if(c == 's')sem_close(sem2);
    80001ce8:	0000d717          	auipc	a4,0xd
    80001cec:	52874703          	lbu	a4,1320(a4) # 8000f210 <c>
    80001cf0:	07300793          	li	a5,115
    80001cf4:	0af70063          	beq	a4,a5,80001d94 <_Z8usermainPv+0x18c>
    80001cf8:	02813083          	ld	ra,40(sp)
    80001cfc:	02013403          	ld	s0,32(sp)
    80001d00:	01813483          	ld	s1,24(sp)
    80001d04:	03010113          	addi	sp,sp,48
    80001d08:	00008067          	ret
        sem_open(&sem1, 0);
    80001d0c:	00000593          	li	a1,0
    80001d10:	0000d517          	auipc	a0,0xd
    80001d14:	50850513          	addi	a0,a0,1288 # 8000f218 <sem1>
    80001d18:	00000097          	auipc	ra,0x0
    80001d1c:	1f8080e7          	jalr	504(ra) # 80001f10 <_Z8sem_openPP4_semj>
        sem_open(&sem2, 0);
    80001d20:	00000593          	li	a1,0
    80001d24:	0000d517          	auipc	a0,0xd
    80001d28:	4fc50513          	addi	a0,a0,1276 # 8000f220 <sem2>
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	1e4080e7          	jalr	484(ra) # 80001f10 <_Z8sem_openPP4_semj>
    80001d34:	f11ff06f          	j	80001c44 <_Z8usermainPv+0x3c>
    if(c == 's')sem_wait(sem1);
    80001d38:	0000d517          	auipc	a0,0xd
    80001d3c:	4e053503          	ld	a0,1248(a0) # 8000f218 <sem1>
    80001d40:	00000097          	auipc	ra,0x0
    80001d44:	234080e7          	jalr	564(ra) # 80001f74 <_Z8sem_waitP4_sem>
    80001d48:	f3dff06f          	j	80001c84 <_Z8usermainPv+0x7c>
    if(c == 't')thread_join(t2);
    80001d4c:	fd043503          	ld	a0,-48(s0)
    80001d50:	00000097          	auipc	ra,0x0
    80001d54:	170080e7          	jalr	368(ra) # 80001ec0 <_Z11thread_joinP7_thread>
    80001d58:	f49ff06f          	j	80001ca0 <_Z8usermainPv+0x98>
    if(c == 't')thread_join(t1);
    80001d5c:	fd843503          	ld	a0,-40(s0)
    80001d60:	00000097          	auipc	ra,0x0
    80001d64:	160080e7          	jalr	352(ra) # 80001ec0 <_Z11thread_joinP7_thread>
    80001d68:	f55ff06f          	j	80001cbc <_Z8usermainPv+0xb4>
    if(c == 's')sem_wait(sem2);
    80001d6c:	0000d517          	auipc	a0,0xd
    80001d70:	4b453503          	ld	a0,1204(a0) # 8000f220 <sem2>
    80001d74:	00000097          	auipc	ra,0x0
    80001d78:	200080e7          	jalr	512(ra) # 80001f74 <_Z8sem_waitP4_sem>
    80001d7c:	f51ff06f          	j	80001ccc <_Z8usermainPv+0xc4>
    if(c == 's')sem_close(sem1);
    80001d80:	0000d517          	auipc	a0,0xd
    80001d84:	49853503          	ld	a0,1176(a0) # 8000f218 <sem1>
    80001d88:	00000097          	auipc	ra,0x0
    80001d8c:	1c0080e7          	jalr	448(ra) # 80001f48 <_Z9sem_closeP4_sem>
    80001d90:	f59ff06f          	j	80001ce8 <_Z8usermainPv+0xe0>
    if(c == 's')sem_close(sem2);
    80001d94:	0000d517          	auipc	a0,0xd
    80001d98:	48c53503          	ld	a0,1164(a0) # 8000f220 <sem2>
    80001d9c:	00000097          	auipc	ra,0x0
    80001da0:	1ac080e7          	jalr	428(ra) # 80001f48 <_Z9sem_closeP4_sem>
    80001da4:	f55ff06f          	j	80001cf8 <_Z8usermainPv+0xf0>

0000000080001da8 <_Z9mem_allocm>:
 * 
 */

#include "syscall_c.h"
#include "consoleManager.h"
void* mem_alloc ( size_t nSize ){
    80001da8:	ff010113          	addi	sp,sp,-16
    80001dac:	00813423          	sd	s0,8(sp)
    80001db0:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001db4:	03f50513          	addi	a0,a0,63
    80001db8:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    80001dbc:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    80001dc0:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    80001dc4:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    80001dc8:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    80001dcc:	00813403          	ld	s0,8(sp)
    80001dd0:	01010113          	addi	sp,sp,16
    80001dd4:	00008067          	ret

0000000080001dd8 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    80001dd8:	ff010113          	addi	sp,sp,-16
    80001ddc:	00813423          	sd	s0,8(sp)
    80001de0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    80001de4:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    80001de8:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    80001dec:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    80001df0:	00050513          	mv	a0,a0
    return nResult;

}
    80001df4:	0005051b          	sext.w	a0,a0
    80001df8:	00813403          	ld	s0,8(sp)
    80001dfc:	01010113          	addi	sp,sp,16
    80001e00:	00008067          	ret

0000000080001e04 <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg ) {
    80001e04:	fd010113          	addi	sp,sp,-48
    80001e08:	02113423          	sd	ra,40(sp)
    80001e0c:	02813023          	sd	s0,32(sp)
    80001e10:	00913c23          	sd	s1,24(sp)
    80001e14:	01213823          	sd	s2,16(sp)
    80001e18:	01313423          	sd	s3,8(sp)
    80001e1c:	03010413          	addi	s0,sp,48
    80001e20:	00050493          	mv	s1,a0
    80001e24:	00058913          	mv	s2,a1
    80001e28:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE * 16);
    80001e2c:	00010537          	lui	a0,0x10
    80001e30:	00000097          	auipc	ra,0x0
    80001e34:	f78080e7          	jalr	-136(ra) # 80001da8 <_Z9mem_allocm>
    /// now we move the pointer up, since SP points to the first free location, and grows down
    __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space + DEFAULT_STACK_SIZE));
    80001e38:	000017b7          	lui	a5,0x1
    80001e3c:	00f50533          	add	a0,a0,a5
    80001e40:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    80001e44:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    80001e48:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    80001e4c:	00048593          	mv	a1,s1
    __asm__ volatile("li a0,0x11");
    80001e50:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    80001e54:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001e58:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001e5c:	0005051b          	sext.w	a0,a0
    80001e60:	02813083          	ld	ra,40(sp)
    80001e64:	02013403          	ld	s0,32(sp)
    80001e68:	01813483          	ld	s1,24(sp)
    80001e6c:	01013903          	ld	s2,16(sp)
    80001e70:	00813983          	ld	s3,8(sp)
    80001e74:	03010113          	addi	sp,sp,48
    80001e78:	00008067          	ret

0000000080001e7c <_Z11thread_exitv>:

int thread_exit (){
    80001e7c:	ff010113          	addi	sp,sp,-16
    80001e80:	00813423          	sd	s0,8(sp)
    80001e84:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    80001e88:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80001e8c:	00000073          	ecall
    return 0;
}
    80001e90:	00000513          	li	a0,0
    80001e94:	00813403          	ld	s0,8(sp)
    80001e98:	01010113          	addi	sp,sp,16
    80001e9c:	00008067          	ret

0000000080001ea0 <_Z15thread_dispatchv>:

void thread_dispatch () {
    80001ea0:	ff010113          	addi	sp,sp,-16
    80001ea4:	00813423          	sd	s0,8(sp)
    80001ea8:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    80001eac:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    80001eb0:	00000073          	ecall
}
    80001eb4:	00813403          	ld	s0,8(sp)
    80001eb8:	01010113          	addi	sp,sp,16
    80001ebc:	00008067          	ret

0000000080001ec0 <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    80001ec0:	ff010113          	addi	sp,sp,-16
    80001ec4:	00813423          	sd	s0,8(sp)
    80001ec8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    80001ecc:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    80001ed0:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    80001ed4:	00000073          	ecall
}
    80001ed8:	00813403          	ld	s0,8(sp)
    80001edc:	01010113          	addi	sp,sp,16
    80001ee0:	00008067          	ret

0000000080001ee4 <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    80001ee4:	ff010113          	addi	sp,sp,-16
    80001ee8:	00813423          	sd	s0,8(sp)
    80001eec:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    80001ef0:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    80001ef4:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001ef8:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001efc:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001f00:	0005051b          	sext.w	a0,a0
    80001f04:	00813403          	ld	s0,8(sp)
    80001f08:	01010113          	addi	sp,sp,16
    80001f0c:	00008067          	ret

0000000080001f10 <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    80001f10:	ff010113          	addi	sp,sp,-16
    80001f14:	00813423          	sd	s0,8(sp)
    80001f18:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    80001f1c:	02059593          	slli	a1,a1,0x20
    80001f20:	0205d593          	srli	a1,a1,0x20
    80001f24:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    80001f28:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    80001f2c:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    80001f30:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001f34:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001f38:	0005051b          	sext.w	a0,a0
    80001f3c:	00813403          	ld	s0,8(sp)
    80001f40:	01010113          	addi	sp,sp,16
    80001f44:	00008067          	ret

0000000080001f48 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    80001f48:	ff010113          	addi	sp,sp,-16
    80001f4c:	00813423          	sd	s0,8(sp)
    80001f50:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001f54:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    80001f58:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    80001f5c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001f60:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001f64:	0005051b          	sext.w	a0,a0
    80001f68:	00813403          	ld	s0,8(sp)
    80001f6c:	01010113          	addi	sp,sp,16
    80001f70:	00008067          	ret

0000000080001f74 <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    80001f74:	ff010113          	addi	sp,sp,-16
    80001f78:	00813423          	sd	s0,8(sp)
    80001f7c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001f80:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    80001f84:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001f88:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001f8c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001f90:	0005051b          	sext.w	a0,a0
    80001f94:	00813403          	ld	s0,8(sp)
    80001f98:	01010113          	addi	sp,sp,16
    80001f9c:	00008067          	ret

0000000080001fa0 <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    80001fa0:	ff010113          	addi	sp,sp,-16
    80001fa4:	00813423          	sd	s0,8(sp)
    80001fa8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001fac:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    80001fb0:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    80001fb4:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001fb8:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001fbc:	0005051b          	sext.w	a0,a0
    80001fc0:	00813403          	ld	s0,8(sp)
    80001fc4:	01010113          	addi	sp,sp,16
    80001fc8:	00008067          	ret

0000000080001fcc <_Z11sem_trywaitP4_sem>:

int sem_trywait ( sem_t handle ) {
    80001fcc:	ff010113          	addi	sp,sp,-16
    80001fd0:	00813423          	sd	s0,8(sp)
    80001fd4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80001fd8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x26");
    80001fdc:	02600513          	li	a0,38
    __asm__ volatile("ecall");
    80001fe0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80001fe4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80001fe8:	0005051b          	sext.w	a0,a0
    80001fec:	00813403          	ld	s0,8(sp)
    80001ff0:	01010113          	addi	sp,sp,16
    80001ff4:	00008067          	ret

0000000080001ff8 <_Z13sem_timedwaitP4_semm>:

int sem_timedwait ( sem_t handle, time_t duration ) {
    80001ff8:	ff010113          	addi	sp,sp,-16
    80001ffc:	00813423          	sd	s0,8(sp)
    80002000:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80002004:	00050593          	mv	a1,a0
    __asm__ volatile("mv a2,%0"::"r"((uint64)duration));
    80002008:	00058613          	mv	a2,a1
    __asm__ volatile("li a0,0x25");
    8000200c:	02500513          	li	a0,37
    __asm__ volatile("ecall");
    80002010:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80002014:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80002018:	0005051b          	sext.w	a0,a0
    8000201c:	00813403          	ld	s0,8(sp)
    80002020:	01010113          	addi	sp,sp,16
    80002024:	00008067          	ret

0000000080002028 <_Z4getcv>:

char getc() {
    80002028:	ff010113          	addi	sp,sp,-16
    8000202c:	00813423          	sd	s0,8(sp)
    80002030:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    80002034:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    80002038:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    8000203c:	00050513          	mv	a0,a0
    return chr;
}
    80002040:	0ff57513          	andi	a0,a0,255
    80002044:	00813403          	ld	s0,8(sp)
    80002048:	01010113          	addi	sp,sp,16
    8000204c:	00008067          	ret

0000000080002050 <_Z4putcc>:

#include "consoleManager.h"

void putc(char chr ) {
    80002050:	ff010113          	addi	sp,sp,-16
    80002054:	00813423          	sd	s0,8(sp)
    80002058:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    8000205c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    80002060:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80002064:	00000073          	ecall
    80002068:	00813403          	ld	s0,8(sp)
    8000206c:	01010113          	addi	sp,sp,16
    80002070:	00008067          	ret

0000000080002074 <_ZN7_threadC1EPFvPvES0_>:

#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    80002074:	ff010113          	addi	sp,sp,-16
    80002078:	00813423          	sd	s0,8(sp)
    8000207c:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80002080:	00053823          	sd	zero,16(a0) # 10010 <_entry-0x7ffefff0>
    function = function;
    arg = arg;
    ID = nextID++;
    80002084:	0000d717          	auipc	a4,0xd
    80002088:	1a470713          	addi	a4,a4,420 # 8000f228 <_ZN7_thread6nextIDE>
    8000208c:	00072783          	lw	a5,0(a4)
    80002090:	0017869b          	addiw	a3,a5,1
    80002094:	00d72023          	sw	a3,0(a4)
    80002098:	00f52023          	sw	a5,0(a0)
    closed = 0;
    8000209c:	0a053783          	ld	a5,160(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    800020a0:	0015b593          	seqz	a1,a1
    800020a4:	00459593          	slli	a1,a1,0x4
    800020a8:	fe07f793          	andi	a5,a5,-32
    800020ac:	00b7e7b3          	or	a5,a5,a1
    reserved = 0;
    800020b0:	0000a717          	auipc	a4,0xa
    800020b4:	fb873703          	ld	a4,-72(a4) # 8000c068 <CONSOLE_STATUS+0x58>
    800020b8:	00e7f7b3          	and	a5,a5,a4
    800020bc:	0af53023          	sd	a5,160(a0)
    joinHead = 0;
    800020c0:	08053023          	sd	zero,128(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    800020c4:	00200793          	li	a5,2
    800020c8:	08f53823          	sd	a5,144(a0)
    stackStart = 0;
    800020cc:	08053c23          	sd	zero,152(a0)
    
    context.s0 = 0;
    800020d0:	00053c23          	sd	zero,24(a0)
    context.s1 = 0;
    800020d4:	02053023          	sd	zero,32(a0)
    context.s2 = 0;
    800020d8:	02053423          	sd	zero,40(a0)
    context.s3 = 0;
    800020dc:	02053823          	sd	zero,48(a0)
    context.s4 = 0;
    800020e0:	02053c23          	sd	zero,56(a0)
    context.s5 = 0;
    800020e4:	04053023          	sd	zero,64(a0)
    context.s6 = 0;
    800020e8:	04053423          	sd	zero,72(a0)
    context.s7 = 0;
    800020ec:	04053823          	sd	zero,80(a0)
    context.s8 = 0;
    800020f0:	04053c23          	sd	zero,88(a0)
    context.s9 = 0;
    800020f4:	06053023          	sd	zero,96(a0)
    context.s10 = 0;
    800020f8:	06053423          	sd	zero,104(a0)
    context.s11 = 0;
    800020fc:	06053823          	sd	zero,112(a0)

    context.sstatus = 0;
    80002100:	06053c23          	sd	zero,120(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    80002104:	00000797          	auipc	a5,0x0
    80002108:	66878793          	addi	a5,a5,1640 # 8000276c <_ZN7_thread7wrapperEv>
    8000210c:	00f53423          	sd	a5,8(a0)
}
    80002110:	00813403          	ld	s0,8(sp)
    80002114:	01010113          	addi	sp,sp,16
    80002118:	00008067          	ret

000000008000211c <_Z10popSppSpiev>:

void popSppSpie(){
    8000211c:	ff010113          	addi	sp,sp,-16
    80002120:	00813423          	sd	s0,8(sp)
    80002124:	01010413          	addi	s0,sp,16
    /// TODO: threads are all in supervisor mode now, THIS IS A BUG
    __asm__ volatile ("csrw sepc, ra");
    80002128:	14109073          	csrw	sepc,ra
    // __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    __asm__ volatile ("sret");
    8000212c:	10200073          	sret
}
    80002130:	00813403          	ld	s0,8(sp)
    80002134:	01010113          	addi	sp,sp,16
    80002138:	00008067          	ret

000000008000213c <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    8000213c:	fe010113          	addi	sp,sp,-32
    80002140:	00113c23          	sd	ra,24(sp)
    80002144:	00813823          	sd	s0,16(sp)
    80002148:	00913423          	sd	s1,8(sp)
    8000214c:	01213023          	sd	s2,0(sp)
    80002150:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    80002154:	08053483          	ld	s1,128(a0)
    while(current != 0){
    80002158:	0e048463          	beqz	s1,80002240 <_ZN7_thread6unJoinEv+0x104>
        thread_t thread = current->thread;
    8000215c:	0004c503          	lbu	a0,0(s1)
    80002160:	0014c783          	lbu	a5,1(s1)
    80002164:	00879793          	slli	a5,a5,0x8
    80002168:	00a7e7b3          	or	a5,a5,a0
    8000216c:	0024c503          	lbu	a0,2(s1)
    80002170:	01051513          	slli	a0,a0,0x10
    80002174:	00f567b3          	or	a5,a0,a5
    80002178:	0034c503          	lbu	a0,3(s1)
    8000217c:	01851513          	slli	a0,a0,0x18
    80002180:	00f56533          	or	a0,a0,a5
    80002184:	0044c783          	lbu	a5,4(s1)
    80002188:	02079793          	slli	a5,a5,0x20
    8000218c:	00a7e533          	or	a0,a5,a0
    80002190:	0054c783          	lbu	a5,5(s1)
    80002194:	02879793          	slli	a5,a5,0x28
    80002198:	00a7e7b3          	or	a5,a5,a0
    8000219c:	0064c503          	lbu	a0,6(s1)
    800021a0:	03051513          	slli	a0,a0,0x30
    800021a4:	00f567b3          	or	a5,a0,a5
    800021a8:	0074c503          	lbu	a0,7(s1)
    800021ac:	03851513          	slli	a0,a0,0x38
    800021b0:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    800021b4:	0a053783          	ld	a5,160(a0)
    800021b8:	ffd7f793          	andi	a5,a5,-3
    800021bc:	0af53023          	sd	a5,160(a0)
        Scheduler::put(thread);
    800021c0:	00003097          	auipc	ra,0x3
    800021c4:	dd0080e7          	jalr	-560(ra) # 80004f90 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    800021c8:	0084c903          	lbu	s2,8(s1)
    800021cc:	0094c783          	lbu	a5,9(s1)
    800021d0:	00879793          	slli	a5,a5,0x8
    800021d4:	0127e7b3          	or	a5,a5,s2
    800021d8:	00a4c903          	lbu	s2,10(s1)
    800021dc:	01091913          	slli	s2,s2,0x10
    800021e0:	00f967b3          	or	a5,s2,a5
    800021e4:	00b4c903          	lbu	s2,11(s1)
    800021e8:	01891913          	slli	s2,s2,0x18
    800021ec:	00f96933          	or	s2,s2,a5
    800021f0:	00c4c783          	lbu	a5,12(s1)
    800021f4:	02079793          	slli	a5,a5,0x20
    800021f8:	0127e933          	or	s2,a5,s2
    800021fc:	00d4c783          	lbu	a5,13(s1)
    80002200:	02879793          	slli	a5,a5,0x28
    80002204:	0127e7b3          	or	a5,a5,s2
    80002208:	00e4c903          	lbu	s2,14(s1)
    8000220c:	03091913          	slli	s2,s2,0x30
    80002210:	00f967b3          	or	a5,s2,a5
    80002214:	00f4c903          	lbu	s2,15(s1)
    80002218:	03891913          	slli	s2,s2,0x38
    8000221c:	00f96933          	or	s2,s2,a5
        HeapManager::getInstance().heapFree(current);
    80002220:	00048593          	mv	a1,s1
    80002224:	0000d797          	auipc	a5,0xd
    80002228:	f7c7b783          	ld	a5,-132(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000222c:	0007b503          	ld	a0,0(a5)
    80002230:	00001097          	auipc	ra,0x1
    80002234:	7d4080e7          	jalr	2004(ra) # 80003a04 <_ZN11HeapManager8heapFreeEPv>
        current = next;
    80002238:	00090493          	mv	s1,s2
    while(current != 0){
    8000223c:	f1dff06f          	j	80002158 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80002240:	01813083          	ld	ra,24(sp)
    80002244:	01013403          	ld	s0,16(sp)
    80002248:	00813483          	ld	s1,8(sp)
    8000224c:	00013903          	ld	s2,0(sp)
    80002250:	02010113          	addi	sp,sp,32
    80002254:	00008067          	ret

0000000080002258 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80002258:	fc010113          	addi	sp,sp,-64
    8000225c:	02113c23          	sd	ra,56(sp)
    80002260:	02813823          	sd	s0,48(sp)
    80002264:	02913423          	sd	s1,40(sp)
    80002268:	03213023          	sd	s2,32(sp)
    8000226c:	01313c23          	sd	s3,24(sp)
    80002270:	01413823          	sd	s4,16(sp)
    80002274:	01513423          	sd	s5,8(sp)
    80002278:	04010413          	addi	s0,sp,64
    8000227c:	00050493          	mv	s1,a0
    80002280:	00058913          	mv	s2,a1
    80002284:	00060a93          	mv	s5,a2
    80002288:	00068993          	mv	s3,a3
    8000228c:	00070a13          	mv	s4,a4

    *thread = (_thread*)HeapManager::getInstance().heapAllocate((sizeof(_thread) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80002290:	00300593          	li	a1,3
    80002294:	0000d797          	auipc	a5,0xd
    80002298:	f0c7b783          	ld	a5,-244(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000229c:	0007b503          	ld	a0,0(a5)
    800022a0:	00001097          	auipc	ra,0x1
    800022a4:	068080e7          	jalr	104(ra) # 80003308 <_ZN11HeapManager12heapAllocateEm>
    800022a8:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    800022ac:	18050263          	beqz	a0,80002430 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1d8>
        return -1;
    }
    (*thread)->function = function;
    800022b0:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    800022b4:	0004b783          	ld	a5,0(s1)
    800022b8:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    800022bc:	0000d717          	auipc	a4,0xd
    800022c0:	f6c70713          	addi	a4,a4,-148 # 8000f228 <_ZN7_thread6nextIDE>
    800022c4:	00072783          	lw	a5,0(a4)
    800022c8:	0017869b          	addiw	a3,a5,1
    800022cc:	00d72023          	sw	a3,0(a4)
    800022d0:	0004b703          	ld	a4,0(s1)
    800022d4:	00f72023          	sw	a5,0(a4)
    (*thread)->closed = false;
    800022d8:	0004b703          	ld	a4,0(s1)
    800022dc:	0a073783          	ld	a5,160(a4)
    800022e0:	ffe7f793          	andi	a5,a5,-2
    800022e4:	0af73023          	sd	a5,160(a4)
    (*thread)->blocked = false;
    800022e8:	0004b703          	ld	a4,0(s1)
    800022ec:	0a073783          	ld	a5,160(a4)
    800022f0:	ffd7f793          	andi	a5,a5,-3
    800022f4:	0af73023          	sd	a5,160(a4)
    (*thread)->sleeping = false;
    800022f8:	0004b703          	ld	a4,0(s1)
    800022fc:	0a073783          	ld	a5,160(a4)
    80002300:	ffb7f793          	andi	a5,a5,-5
    80002304:	0af73023          	sd	a5,160(a4)
    (*thread)->finished = false;
    80002308:	0004b703          	ld	a4,0(s1)
    8000230c:	0a073783          	ld	a5,160(a4)
    80002310:	ff77f793          	andi	a5,a5,-9
    80002314:	0af73023          	sd	a5,160(a4)
    (*thread)->kernel = (function == 0);
    80002318:	0004b703          	ld	a4,0(s1)
    8000231c:	00193913          	seqz	s2,s2
    80002320:	00491913          	slli	s2,s2,0x4
    80002324:	0a073783          	ld	a5,160(a4)
    80002328:	fef7f793          	andi	a5,a5,-17
    8000232c:	0127e933          	or	s2,a5,s2
    80002330:	0b273023          	sd	s2,160(a4)
    (*thread)->reserved = 0;
    80002334:	0004b703          	ld	a4,0(s1)
    80002338:	0a073783          	ld	a5,160(a4)
    8000233c:	0000a697          	auipc	a3,0xa
    80002340:	d2c6b683          	ld	a3,-724(a3) # 8000c068 <CONSOLE_STATUS+0x58>
    80002344:	00d7f7b3          	and	a5,a5,a3
    80002348:	0af73023          	sd	a5,160(a4)
    (*thread)->joinHead = 0;
    8000234c:	0004b783          	ld	a5,0(s1)
    80002350:	0807b023          	sd	zero,128(a5)
    (*thread)->joinTail = 0;
    80002354:	0004b783          	ld	a5,0(s1)
    80002358:	0807b423          	sd	zero,136(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    8000235c:	0004b783          	ld	a5,0(s1)
    80002360:	00200713          	li	a4,2
    80002364:	08e7b823          	sd	a4,144(a5)
    (*thread)->stackStart = 0;
    80002368:	0004b783          	ld	a5,0(s1)
    8000236c:	0807bc23          	sd	zero,152(a5)

    (*thread)->context.s0 = 0;
    80002370:	0004b783          	ld	a5,0(s1)
    80002374:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s1 = 0;
    80002378:	0004b783          	ld	a5,0(s1)
    8000237c:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s2 = 0;
    80002380:	0004b783          	ld	a5,0(s1)
    80002384:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s3 = 0;
    80002388:	0004b783          	ld	a5,0(s1)
    8000238c:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s4 = 0;
    80002390:	0004b783          	ld	a5,0(s1)
    80002394:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s5 = 0;
    80002398:	0004b783          	ld	a5,0(s1)
    8000239c:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s6 = 0;
    800023a0:	0004b783          	ld	a5,0(s1)
    800023a4:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s7 = 0;
    800023a8:	0004b783          	ld	a5,0(s1)
    800023ac:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s8 = 0;
    800023b0:	0004b783          	ld	a5,0(s1)
    800023b4:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s9 = 0;
    800023b8:	0004b783          	ld	a5,0(s1)
    800023bc:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s10 = 0;
    800023c0:	0004b783          	ld	a5,0(s1)
    800023c4:	0607b423          	sd	zero,104(a5)
    (*thread)->context.s11 = 0;
    800023c8:	0004b783          	ld	a5,0(s1)
    800023cc:	0607b823          	sd	zero,112(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    800023d0:	0004b783          	ld	a5,0(s1)
    800023d4:	0137b823          	sd	s3,16(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    800023d8:	0004b783          	ld	a5,0(s1)
    800023dc:	00000717          	auipc	a4,0x0
    800023e0:	39070713          	addi	a4,a4,912 # 8000276c <_ZN7_thread7wrapperEv>
    800023e4:	00e7b423          	sd	a4,8(a5)

    (*thread)->stackStart = stack;
    800023e8:	0004b783          	ld	a5,0(s1)
    800023ec:	0937bc23          	sd	s3,152(a5)
    if(start){
    800023f0:	020a1663          	bnez	s4,8000241c <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c4>
        Scheduler::put(*thread);
    }
    return 0;
    800023f4:	00000513          	li	a0,0
}
    800023f8:	03813083          	ld	ra,56(sp)
    800023fc:	03013403          	ld	s0,48(sp)
    80002400:	02813483          	ld	s1,40(sp)
    80002404:	02013903          	ld	s2,32(sp)
    80002408:	01813983          	ld	s3,24(sp)
    8000240c:	01013a03          	ld	s4,16(sp)
    80002410:	00813a83          	ld	s5,8(sp)
    80002414:	04010113          	addi	sp,sp,64
    80002418:	00008067          	ret
        Scheduler::put(*thread);
    8000241c:	0004b503          	ld	a0,0(s1)
    80002420:	00003097          	auipc	ra,0x3
    80002424:	b70080e7          	jalr	-1168(ra) # 80004f90 <_ZN9Scheduler3putEP7_thread>
    return 0;
    80002428:	00000513          	li	a0,0
    8000242c:	fcdff06f          	j	800023f8 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1a0>
        return -1;
    80002430:	fff00513          	li	a0,-1
    80002434:	fc5ff06f          	j	800023f8 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1a0>

0000000080002438 <_ZN7_thread10setBlockedEb>:
    currentThread->finished = 1;
    dispatch();
    return 0;
}

void _thread::setBlocked(bool blocked){
    80002438:	ff010113          	addi	sp,sp,-16
    8000243c:	00813423          	sd	s0,8(sp)
    80002440:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    80002444:	0015f593          	andi	a1,a1,1
    80002448:	00159793          	slli	a5,a1,0x1
    8000244c:	0a053583          	ld	a1,160(a0)
    80002450:	ffd5f593          	andi	a1,a1,-3
    80002454:	00f5e5b3          	or	a1,a1,a5
    80002458:	0ab53023          	sd	a1,160(a0)
}
    8000245c:	00813403          	ld	s0,8(sp)
    80002460:	01010113          	addi	sp,sp,16
    80002464:	00008067          	ret

0000000080002468 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80002468:	ff010113          	addi	sp,sp,-16
    8000246c:	00813423          	sd	s0,8(sp)
    80002470:	01010413          	addi	s0,sp,16
    this->closed = closed;
    80002474:	0015f793          	andi	a5,a1,1
    80002478:	0a053583          	ld	a1,160(a0)
    8000247c:	ffe5f593          	andi	a1,a1,-2
    80002480:	00f5e5b3          	or	a1,a1,a5
    80002484:	0ab53023          	sd	a1,160(a0)
}
    80002488:	00813403          	ld	s0,8(sp)
    8000248c:	01010113          	addi	sp,sp,16
    80002490:	00008067          	ret

0000000080002494 <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    80002494:	ff010113          	addi	sp,sp,-16
    80002498:	00813423          	sd	s0,8(sp)
    8000249c:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    800024a0:	0015f593          	andi	a1,a1,1
    800024a4:	00259793          	slli	a5,a1,0x2
    800024a8:	0a053583          	ld	a1,160(a0)
    800024ac:	ffb5f593          	andi	a1,a1,-5
    800024b0:	00f5e5b3          	or	a1,a1,a5
    800024b4:	0ab53023          	sd	a1,160(a0)
}
    800024b8:	00813403          	ld	s0,8(sp)
    800024bc:	01010113          	addi	sp,sp,16
    800024c0:	00008067          	ret

00000000800024c4 <_ZN7_thread8dispatchEv>:

void _thread::dispatch(){
    800024c4:	fe010113          	addi	sp,sp,-32
    800024c8:	00113c23          	sd	ra,24(sp)
    800024cc:	00813823          	sd	s0,16(sp)
    800024d0:	00913423          	sd	s1,8(sp)
    800024d4:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    800024d8:	0000d497          	auipc	s1,0xd
    800024dc:	d584b483          	ld	s1,-680(s1) # 8000f230 <_ZN7_thread13currentThreadE>
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    800024e0:	00200793          	li	a5,2
    800024e4:	08f4b823          	sd	a5,144(s1)
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    800024e8:	00048863          	beqz	s1,800024f8 <_ZN7_thread8dispatchEv+0x34>
    800024ec:	0a04b783          	ld	a5,160(s1)
    800024f0:	00f7f793          	andi	a5,a5,15
    800024f4:	02078e63          	beqz	a5,80002530 <_ZN7_thread8dispatchEv+0x6c>
        Scheduler::put(oldThread);
    }
    currentThread =  Scheduler::get();
    800024f8:	00003097          	auipc	ra,0x3
    800024fc:	c9c080e7          	jalr	-868(ra) # 80005194 <_ZN9Scheduler3getEv>
    80002500:	0000d797          	auipc	a5,0xd
    80002504:	d2a7b823          	sd	a0,-720(a5) # 8000f230 <_ZN7_thread13currentThreadE>
    if(currentThread == oldThread)return;
    80002508:	00a48a63          	beq	s1,a0,8000251c <_ZN7_thread8dispatchEv+0x58>
    contextSwitch(&(oldThread->context), &(currentThread->context));
    8000250c:	00850593          	addi	a1,a0,8
    80002510:	00848513          	addi	a0,s1,8
    80002514:	fffff097          	auipc	ra,0xfffff
    80002518:	bec080e7          	jalr	-1044(ra) # 80001100 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    8000251c:	01813083          	ld	ra,24(sp)
    80002520:	01013403          	ld	s0,16(sp)
    80002524:	00813483          	ld	s1,8(sp)
    80002528:	02010113          	addi	sp,sp,32
    8000252c:	00008067          	ret
        Scheduler::put(oldThread);
    80002530:	00048513          	mv	a0,s1
    80002534:	00003097          	auipc	ra,0x3
    80002538:	a5c080e7          	jalr	-1444(ra) # 80004f90 <_ZN9Scheduler3putEP7_thread>
    8000253c:	fbdff06f          	j	800024f8 <_ZN7_thread8dispatchEv+0x34>

0000000080002540 <_ZN7_thread4joinEPS_>:
    if(thread->finished || thread->closed){
    80002540:	0a05b783          	ld	a5,160(a1)
    80002544:	0097f793          	andi	a5,a5,9
    80002548:	00078463          	beqz	a5,80002550 <_ZN7_thread4joinEPS_+0x10>
    8000254c:	00008067          	ret
void _thread::join(thread_t thread){
    80002550:	fe010113          	addi	sp,sp,-32
    80002554:	00113c23          	sd	ra,24(sp)
    80002558:	00813823          	sd	s0,16(sp)
    8000255c:	00913423          	sd	s1,8(sp)
    80002560:	01213023          	sd	s2,0(sp)
    80002564:	02010413          	addi	s0,sp,32
    80002568:	00050493          	mv	s1,a0
    8000256c:	00058913          	mv	s2,a1
    ThreadJoinList* newJoin = (ThreadJoinList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadJoinList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80002570:	00100593          	li	a1,1
    80002574:	0000d797          	auipc	a5,0xd
    80002578:	c2c7b783          	ld	a5,-980(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000257c:	0007b503          	ld	a0,0(a5)
    80002580:	00001097          	auipc	ra,0x1
    80002584:	d88080e7          	jalr	-632(ra) # 80003308 <_ZN11HeapManager12heapAllocateEm>
    this->blocked = true;
    80002588:	0a04b703          	ld	a4,160(s1)
    8000258c:	00276713          	ori	a4,a4,2
    80002590:	0ae4b023          	sd	a4,160(s1)
    newJoin->thread = this;
    80002594:	00950023          	sb	s1,0(a0)
    80002598:	0084d713          	srli	a4,s1,0x8
    8000259c:	00e500a3          	sb	a4,1(a0)
    800025a0:	0104d713          	srli	a4,s1,0x10
    800025a4:	00e50123          	sb	a4,2(a0)
    800025a8:	0184d71b          	srliw	a4,s1,0x18
    800025ac:	00e501a3          	sb	a4,3(a0)
    800025b0:	0204d713          	srli	a4,s1,0x20
    800025b4:	00e50223          	sb	a4,4(a0)
    800025b8:	0284d713          	srli	a4,s1,0x28
    800025bc:	00e502a3          	sb	a4,5(a0)
    800025c0:	0304d713          	srli	a4,s1,0x30
    800025c4:	00e50323          	sb	a4,6(a0)
    800025c8:	0384d493          	srli	s1,s1,0x38
    800025cc:	009503a3          	sb	s1,7(a0)
    newJoin->next = 0;
    800025d0:	00050423          	sb	zero,8(a0)
    800025d4:	000504a3          	sb	zero,9(a0)
    800025d8:	00050523          	sb	zero,10(a0)
    800025dc:	000505a3          	sb	zero,11(a0)
    800025e0:	00050623          	sb	zero,12(a0)
    800025e4:	000506a3          	sb	zero,13(a0)
    800025e8:	00050723          	sb	zero,14(a0)
    800025ec:	000507a3          	sb	zero,15(a0)
    if(thread->joinHead == 0){
    800025f0:	08093703          	ld	a4,128(s2)
    800025f4:	06070463          	beqz	a4,8000265c <_ZN7_thread4joinEPS_+0x11c>
        thread->joinTail->next = newJoin;
    800025f8:	08893703          	ld	a4,136(s2)
    800025fc:	00a70423          	sb	a0,8(a4)
    80002600:	00855693          	srli	a3,a0,0x8
    80002604:	00d704a3          	sb	a3,9(a4)
    80002608:	01055693          	srli	a3,a0,0x10
    8000260c:	00d70523          	sb	a3,10(a4)
    80002610:	0185569b          	srliw	a3,a0,0x18
    80002614:	00d705a3          	sb	a3,11(a4)
    80002618:	02055693          	srli	a3,a0,0x20
    8000261c:	00d70623          	sb	a3,12(a4)
    80002620:	02855693          	srli	a3,a0,0x28
    80002624:	00d706a3          	sb	a3,13(a4)
    80002628:	03055693          	srli	a3,a0,0x30
    8000262c:	00d70723          	sb	a3,14(a4)
    80002630:	03855693          	srli	a3,a0,0x38
    80002634:	00d707a3          	sb	a3,15(a4)
        thread->joinTail = newJoin;
    80002638:	08a93423          	sd	a0,136(s2)
    dispatch();
    8000263c:	00000097          	auipc	ra,0x0
    80002640:	e88080e7          	jalr	-376(ra) # 800024c4 <_ZN7_thread8dispatchEv>
}
    80002644:	01813083          	ld	ra,24(sp)
    80002648:	01013403          	ld	s0,16(sp)
    8000264c:	00813483          	ld	s1,8(sp)
    80002650:	00013903          	ld	s2,0(sp)
    80002654:	02010113          	addi	sp,sp,32
    80002658:	00008067          	ret
        thread->joinHead = newJoin;
    8000265c:	08a93023          	sd	a0,128(s2)
        thread->joinTail = newJoin;
    80002660:	08a93423          	sd	a0,136(s2)
    80002664:	fd9ff06f          	j	8000263c <_ZN7_thread4joinEPS_+0xfc>

0000000080002668 <_ZN7_thread4tickEv>:
    if(currentThread->blocked){
    80002668:	0000d797          	auipc	a5,0xd
    8000266c:	bc87b783          	ld	a5,-1080(a5) # 8000f230 <_ZN7_thread13currentThreadE>
    80002670:	0a07b783          	ld	a5,160(a5)
    80002674:	0027f713          	andi	a4,a5,2
    80002678:	06071063          	bnez	a4,800026d8 <_ZN7_thread4tickEv+0x70>
    if(currentThread->closed){
    8000267c:	0017f713          	andi	a4,a5,1
    80002680:	06071063          	bnez	a4,800026e0 <_ZN7_thread4tickEv+0x78>
    if(currentThread->sleeping){
    80002684:	0047f713          	andi	a4,a5,4
    80002688:	06071063          	bnez	a4,800026e8 <_ZN7_thread4tickEv+0x80>
    if(currentThread->finished){
    8000268c:	0087f793          	andi	a5,a5,8
    80002690:	06079063          	bnez	a5,800026f0 <_ZN7_thread4tickEv+0x88>
    timeLeft --;
    80002694:	09053783          	ld	a5,144(a0)
    80002698:	fff78793          	addi	a5,a5,-1
    8000269c:	08f53823          	sd	a5,144(a0)
    if(timeLeft == 0){
    800026a0:	00078663          	beqz	a5,800026ac <_ZN7_thread4tickEv+0x44>
    return 0;
    800026a4:	00000513          	li	a0,0
}
    800026a8:	00008067          	ret
int _thread::tick(){
    800026ac:	ff010113          	addi	sp,sp,-16
    800026b0:	00113423          	sd	ra,8(sp)
    800026b4:	00813023          	sd	s0,0(sp)
    800026b8:	01010413          	addi	s0,sp,16
        dispatch();
    800026bc:	00000097          	auipc	ra,0x0
    800026c0:	e08080e7          	jalr	-504(ra) # 800024c4 <_ZN7_thread8dispatchEv>
    return 0;
    800026c4:	00000513          	li	a0,0
}
    800026c8:	00813083          	ld	ra,8(sp)
    800026cc:	00013403          	ld	s0,0(sp)
    800026d0:	01010113          	addi	sp,sp,16
    800026d4:	00008067          	ret
        return -1;
    800026d8:	fff00513          	li	a0,-1
    800026dc:	00008067          	ret
        return -2;
    800026e0:	ffe00513          	li	a0,-2
    800026e4:	00008067          	ret
        return -3;
    800026e8:	ffd00513          	li	a0,-3
    800026ec:	00008067          	ret
        return -4;
    800026f0:	ffc00513          	li	a0,-4
    800026f4:	00008067          	ret

00000000800026f8 <_ZN7_thread4exitEv>:
    if(currentThread->closed){
    800026f8:	0000d717          	auipc	a4,0xd
    800026fc:	b3873703          	ld	a4,-1224(a4) # 8000f230 <_ZN7_thread13currentThreadE>
    80002700:	0a073783          	ld	a5,160(a4)
    80002704:	0017f693          	andi	a3,a5,1
    80002708:	04069663          	bnez	a3,80002754 <_ZN7_thread4exitEv+0x5c>
    if(currentThread->blocked){
    8000270c:	0027f693          	andi	a3,a5,2
    80002710:	04069663          	bnez	a3,8000275c <_ZN7_thread4exitEv+0x64>
    if(currentThread->sleeping){
    80002714:	0047f793          	andi	a5,a5,4
    80002718:	04079663          	bnez	a5,80002764 <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    8000271c:	ff010113          	addi	sp,sp,-16
    80002720:	00113423          	sd	ra,8(sp)
    80002724:	00813023          	sd	s0,0(sp)
    80002728:	01010413          	addi	s0,sp,16
    currentThread->finished = 1;
    8000272c:	0a073783          	ld	a5,160(a4)
    80002730:	0087e793          	ori	a5,a5,8
    80002734:	0af73023          	sd	a5,160(a4)
    dispatch();
    80002738:	00000097          	auipc	ra,0x0
    8000273c:	d8c080e7          	jalr	-628(ra) # 800024c4 <_ZN7_thread8dispatchEv>
    return 0;
    80002740:	00000513          	li	a0,0
}
    80002744:	00813083          	ld	ra,8(sp)
    80002748:	00013403          	ld	s0,0(sp)
    8000274c:	01010113          	addi	sp,sp,16
    80002750:	00008067          	ret
        return -1;
    80002754:	fff00513          	li	a0,-1
    80002758:	00008067          	ret
        return -2;
    8000275c:	ffe00513          	li	a0,-2
    80002760:	00008067          	ret
        return -3;
    80002764:	ffd00513          	li	a0,-3
}
    80002768:	00008067          	ret

000000008000276c <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    8000276c:	fe010113          	addi	sp,sp,-32
    80002770:	00113c23          	sd	ra,24(sp)
    80002774:	00813823          	sd	s0,16(sp)
    80002778:	00913423          	sd	s1,8(sp)
    8000277c:	02010413          	addi	s0,sp,32
    popSppSpie();
    80002780:	00000097          	auipc	ra,0x0
    80002784:	99c080e7          	jalr	-1636(ra) # 8000211c <_Z10popSppSpiev>
    currentThread->function(currentThread->arg);
    80002788:	0000d497          	auipc	s1,0xd
    8000278c:	aa048493          	addi	s1,s1,-1376 # 8000f228 <_ZN7_thread6nextIDE>
    80002790:	0084b783          	ld	a5,8(s1)
    80002794:	0a87b703          	ld	a4,168(a5)
    80002798:	0b07b503          	ld	a0,176(a5)
    8000279c:	000700e7          	jalr	a4
    currentThread->unJoin();
    800027a0:	0084b503          	ld	a0,8(s1)
    800027a4:	00000097          	auipc	ra,0x0
    800027a8:	998080e7          	jalr	-1640(ra) # 8000213c <_ZN7_thread6unJoinEv>
    exit();
    800027ac:	00000097          	auipc	ra,0x0
    800027b0:	f4c080e7          	jalr	-180(ra) # 800026f8 <_ZN7_thread4exitEv>
}
    800027b4:	01813083          	ld	ra,24(sp)
    800027b8:	01013403          	ld	s0,16(sp)
    800027bc:	00813483          	ld	s1,8(sp)
    800027c0:	02010113          	addi	sp,sp,32
    800027c4:	00008067          	ret

00000000800027c8 <main>:
#include "assert.h"
#include "syscall_c.h"
#include "consoleManager.h"

/// @brief first function to be called
void main(){
    800027c8:	b7010113          	addi	sp,sp,-1168
    800027cc:	48113423          	sd	ra,1160(sp)
    800027d0:	48813023          	sd	s0,1152(sp)
    800027d4:	46913c23          	sd	s1,1144(sp)
    800027d8:	49010413          	addi	s0,sp,1168
    Kernel kernel = Kernel();
    800027dc:	b7040493          	addi	s1,s0,-1168
    800027e0:	00048513          	mv	a0,s1
    800027e4:	00003097          	auipc	ra,0x3
    800027e8:	edc080e7          	jalr	-292(ra) # 800056c0 <_ZN6KernelC1Ev>
    kernel.initialise();
    800027ec:	00048513          	mv	a0,s1
    800027f0:	00003097          	auipc	ra,0x3
    800027f4:	f74080e7          	jalr	-140(ra) # 80005764 <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    800027f8:	00048513          	mv	a0,s1
    800027fc:	00003097          	auipc	ra,0x3
    80002800:	fc4080e7          	jalr	-60(ra) # 800057c0 <_ZN6Kernel3runEv>
    80002804:	00050493          	mv	s1,a0
    putc('\n');
    80002808:	00a00513          	li	a0,10
    8000280c:	00000097          	auipc	ra,0x0
    80002810:	844080e7          	jalr	-1980(ra) # 80002050 <_Z4putcc>
    putc('-');
    80002814:	02d00513          	li	a0,45
    80002818:	00000097          	auipc	ra,0x0
    8000281c:	838080e7          	jalr	-1992(ra) # 80002050 <_Z4putcc>
    putc('-');
    80002820:	02d00513          	li	a0,45
    80002824:	00000097          	auipc	ra,0x0
    80002828:	82c080e7          	jalr	-2004(ra) # 80002050 <_Z4putcc>
    putc('-');
    8000282c:	02d00513          	li	a0,45
    80002830:	00000097          	auipc	ra,0x0
    80002834:	820080e7          	jalr	-2016(ra) # 80002050 <_Z4putcc>
    putc('-');
    80002838:	02d00513          	li	a0,45
    8000283c:	00000097          	auipc	ra,0x0
    80002840:	814080e7          	jalr	-2028(ra) # 80002050 <_Z4putcc>
    putc('-');
    80002844:	02d00513          	li	a0,45
    80002848:	00000097          	auipc	ra,0x0
    8000284c:	808080e7          	jalr	-2040(ra) # 80002050 <_Z4putcc>
    putc('-');
    80002850:	02d00513          	li	a0,45
    80002854:	fffff097          	auipc	ra,0xfffff
    80002858:	7fc080e7          	jalr	2044(ra) # 80002050 <_Z4putcc>
    putc('-');
    8000285c:	02d00513          	li	a0,45
    80002860:	fffff097          	auipc	ra,0xfffff
    80002864:	7f0080e7          	jalr	2032(ra) # 80002050 <_Z4putcc>
    putc('-');
    80002868:	02d00513          	li	a0,45
    8000286c:	fffff097          	auipc	ra,0xfffff
    80002870:	7e4080e7          	jalr	2020(ra) # 80002050 <_Z4putcc>
    putc('-');
    80002874:	02d00513          	li	a0,45
    80002878:	fffff097          	auipc	ra,0xfffff
    8000287c:	7d8080e7          	jalr	2008(ra) # 80002050 <_Z4putcc>
    putc('-');
    80002880:	02d00513          	li	a0,45
    80002884:	fffff097          	auipc	ra,0xfffff
    80002888:	7cc080e7          	jalr	1996(ra) # 80002050 <_Z4putcc>
    putc('-');
    8000288c:	02d00513          	li	a0,45
    80002890:	fffff097          	auipc	ra,0xfffff
    80002894:	7c0080e7          	jalr	1984(ra) # 80002050 <_Z4putcc>
    putc('-');
    80002898:	02d00513          	li	a0,45
    8000289c:	fffff097          	auipc	ra,0xfffff
    800028a0:	7b4080e7          	jalr	1972(ra) # 80002050 <_Z4putcc>
    putc('-');
    800028a4:	02d00513          	li	a0,45
    800028a8:	fffff097          	auipc	ra,0xfffff
    800028ac:	7a8080e7          	jalr	1960(ra) # 80002050 <_Z4putcc>
    putc('-');
    800028b0:	02d00513          	li	a0,45
    800028b4:	fffff097          	auipc	ra,0xfffff
    800028b8:	79c080e7          	jalr	1948(ra) # 80002050 <_Z4putcc>
    putc('-');
    800028bc:	02d00513          	li	a0,45
    800028c0:	fffff097          	auipc	ra,0xfffff
    800028c4:	790080e7          	jalr	1936(ra) # 80002050 <_Z4putcc>
    putc('-');
    800028c8:	02d00513          	li	a0,45
    800028cc:	fffff097          	auipc	ra,0xfffff
    800028d0:	784080e7          	jalr	1924(ra) # 80002050 <_Z4putcc>
    putc('-');
    800028d4:	02d00513          	li	a0,45
    800028d8:	fffff097          	auipc	ra,0xfffff
    800028dc:	778080e7          	jalr	1912(ra) # 80002050 <_Z4putcc>
    putc('-');
    800028e0:	02d00513          	li	a0,45
    800028e4:	fffff097          	auipc	ra,0xfffff
    800028e8:	76c080e7          	jalr	1900(ra) # 80002050 <_Z4putcc>
    putc('-');
    800028ec:	02d00513          	li	a0,45
    800028f0:	fffff097          	auipc	ra,0xfffff
    800028f4:	760080e7          	jalr	1888(ra) # 80002050 <_Z4putcc>
    putc('-');
    800028f8:	02d00513          	li	a0,45
    800028fc:	fffff097          	auipc	ra,0xfffff
    80002900:	754080e7          	jalr	1876(ra) # 80002050 <_Z4putcc>
    putc('\n');
    80002904:	00a00513          	li	a0,10
    80002908:	fffff097          	auipc	ra,0xfffff
    8000290c:	748080e7          	jalr	1864(ra) # 80002050 <_Z4putcc>
    putc('\n');
    80002910:	00a00513          	li	a0,10
    80002914:	fffff097          	auipc	ra,0xfffff
    80002918:	73c080e7          	jalr	1852(ra) # 80002050 <_Z4putcc>
    putc('K');
    8000291c:	04b00513          	li	a0,75
    80002920:	fffff097          	auipc	ra,0xfffff
    80002924:	730080e7          	jalr	1840(ra) # 80002050 <_Z4putcc>
    putc('e');
    80002928:	06500513          	li	a0,101
    8000292c:	fffff097          	auipc	ra,0xfffff
    80002930:	724080e7          	jalr	1828(ra) # 80002050 <_Z4putcc>
    putc('r');
    80002934:	07200513          	li	a0,114
    80002938:	fffff097          	auipc	ra,0xfffff
    8000293c:	718080e7          	jalr	1816(ra) # 80002050 <_Z4putcc>
    putc('n');
    80002940:	06e00513          	li	a0,110
    80002944:	fffff097          	auipc	ra,0xfffff
    80002948:	70c080e7          	jalr	1804(ra) # 80002050 <_Z4putcc>
    putc('e');
    8000294c:	06500513          	li	a0,101
    80002950:	fffff097          	auipc	ra,0xfffff
    80002954:	700080e7          	jalr	1792(ra) # 80002050 <_Z4putcc>
    putc('l');
    80002958:	06c00513          	li	a0,108
    8000295c:	fffff097          	auipc	ra,0xfffff
    80002960:	6f4080e7          	jalr	1780(ra) # 80002050 <_Z4putcc>
    putc(' ');
    80002964:	02000513          	li	a0,32
    80002968:	fffff097          	auipc	ra,0xfffff
    8000296c:	6e8080e7          	jalr	1768(ra) # 80002050 <_Z4putcc>
    putc('e');
    80002970:	06500513          	li	a0,101
    80002974:	fffff097          	auipc	ra,0xfffff
    80002978:	6dc080e7          	jalr	1756(ra) # 80002050 <_Z4putcc>
    putc('x');
    8000297c:	07800513          	li	a0,120
    80002980:	fffff097          	auipc	ra,0xfffff
    80002984:	6d0080e7          	jalr	1744(ra) # 80002050 <_Z4putcc>
    putc('i');
    80002988:	06900513          	li	a0,105
    8000298c:	fffff097          	auipc	ra,0xfffff
    80002990:	6c4080e7          	jalr	1732(ra) # 80002050 <_Z4putcc>
    putc('t');
    80002994:	07400513          	li	a0,116
    80002998:	fffff097          	auipc	ra,0xfffff
    8000299c:	6b8080e7          	jalr	1720(ra) # 80002050 <_Z4putcc>
    putc('e');
    800029a0:	06500513          	li	a0,101
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	6ac080e7          	jalr	1708(ra) # 80002050 <_Z4putcc>
    putc('d');
    800029ac:	06400513          	li	a0,100
    800029b0:	fffff097          	auipc	ra,0xfffff
    800029b4:	6a0080e7          	jalr	1696(ra) # 80002050 <_Z4putcc>
    putc(' ');
    800029b8:	02000513          	li	a0,32
    800029bc:	fffff097          	auipc	ra,0xfffff
    800029c0:	694080e7          	jalr	1684(ra) # 80002050 <_Z4putcc>
    putc('w');
    800029c4:	07700513          	li	a0,119
    800029c8:	fffff097          	auipc	ra,0xfffff
    800029cc:	688080e7          	jalr	1672(ra) # 80002050 <_Z4putcc>
    putc('i');
    800029d0:	06900513          	li	a0,105
    800029d4:	fffff097          	auipc	ra,0xfffff
    800029d8:	67c080e7          	jalr	1660(ra) # 80002050 <_Z4putcc>
    putc('t');
    800029dc:	07400513          	li	a0,116
    800029e0:	fffff097          	auipc	ra,0xfffff
    800029e4:	670080e7          	jalr	1648(ra) # 80002050 <_Z4putcc>
    putc('h');
    800029e8:	06800513          	li	a0,104
    800029ec:	fffff097          	auipc	ra,0xfffff
    800029f0:	664080e7          	jalr	1636(ra) # 80002050 <_Z4putcc>
    putc(' ');
    800029f4:	02000513          	li	a0,32
    800029f8:	fffff097          	auipc	ra,0xfffff
    800029fc:	658080e7          	jalr	1624(ra) # 80002050 <_Z4putcc>
    putc('c');
    80002a00:	06300513          	li	a0,99
    80002a04:	fffff097          	auipc	ra,0xfffff
    80002a08:	64c080e7          	jalr	1612(ra) # 80002050 <_Z4putcc>
    putc('o');
    80002a0c:	06f00513          	li	a0,111
    80002a10:	fffff097          	auipc	ra,0xfffff
    80002a14:	640080e7          	jalr	1600(ra) # 80002050 <_Z4putcc>
    putc('d');
    80002a18:	06400513          	li	a0,100
    80002a1c:	fffff097          	auipc	ra,0xfffff
    80002a20:	634080e7          	jalr	1588(ra) # 80002050 <_Z4putcc>
    putc('e');
    80002a24:	06500513          	li	a0,101
    80002a28:	fffff097          	auipc	ra,0xfffff
    80002a2c:	628080e7          	jalr	1576(ra) # 80002050 <_Z4putcc>
    putc(':');
    80002a30:	03a00513          	li	a0,58
    80002a34:	fffff097          	auipc	ra,0xfffff
    80002a38:	61c080e7          	jalr	1564(ra) # 80002050 <_Z4putcc>
    switch(exitCode){
    80002a3c:	00048e63          	beqz	s1,80002a58 <main+0x290>
    80002a40:	00100793          	li	a5,1
    80002a44:	02f48263          	beq	s1,a5,80002a68 <main+0x2a0>
            break;
        case Kernel::EXIT_FAILURE:
            putc('1');
            break;
        default:
            putc('2');
    80002a48:	03200513          	li	a0,50
    80002a4c:	fffff097          	auipc	ra,0xfffff
    80002a50:	604080e7          	jalr	1540(ra) # 80002050 <_Z4putcc>
    80002a54:	0200006f          	j	80002a74 <main+0x2ac>
            putc('0');
    80002a58:	03000513          	li	a0,48
    80002a5c:	fffff097          	auipc	ra,0xfffff
    80002a60:	5f4080e7          	jalr	1524(ra) # 80002050 <_Z4putcc>
    80002a64:	0100006f          	j	80002a74 <main+0x2ac>
            putc('1');
    80002a68:	03100513          	li	a0,49
    80002a6c:	fffff097          	auipc	ra,0xfffff
    80002a70:	5e4080e7          	jalr	1508(ra) # 80002050 <_Z4putcc>
            break;
    }
    putc('\n');
    80002a74:	00a00513          	li	a0,10
    80002a78:	fffff097          	auipc	ra,0xfffff
    80002a7c:	5d8080e7          	jalr	1496(ra) # 80002050 <_Z4putcc>
    ConsoleManager::outputHandler();
    80002a80:	00000097          	auipc	ra,0x0
    80002a84:	494080e7          	jalr	1172(ra) # 80002f14 <_ZN14ConsoleManager13outputHandlerEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80002a88:	02049263          	bnez	s1,80002aac <main+0x2e4>
    Kernel kernel = Kernel();
    80002a8c:	b7040513          	addi	a0,s0,-1168
    80002a90:	00000097          	auipc	ra,0x0
    80002a94:	060080e7          	jalr	96(ra) # 80002af0 <_ZN6KernelD1Ev>
    80002a98:	48813083          	ld	ra,1160(sp)
    80002a9c:	48013403          	ld	s0,1152(sp)
    80002aa0:	47813483          	ld	s1,1144(sp)
    80002aa4:	49010113          	addi	sp,sp,1168
    80002aa8:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80002aac:	00009697          	auipc	a3,0x9
    80002ab0:	5c468693          	addi	a3,a3,1476 # 8000c070 <CONSOLE_STATUS+0x60>
    80002ab4:	05200613          	li	a2,82
    80002ab8:	00009597          	auipc	a1,0x9
    80002abc:	5c858593          	addi	a1,a1,1480 # 8000c080 <CONSOLE_STATUS+0x70>
    80002ac0:	00009517          	auipc	a0,0x9
    80002ac4:	5d050513          	addi	a0,a0,1488 # 8000c090 <CONSOLE_STATUS+0x80>
    80002ac8:	00003097          	auipc	ra,0x3
    80002acc:	87c080e7          	jalr	-1924(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    80002ad0:	fbdff06f          	j	80002a8c <main+0x2c4>
    80002ad4:	00050493          	mv	s1,a0
    Kernel kernel = Kernel();
    80002ad8:	b7040513          	addi	a0,s0,-1168
    80002adc:	00000097          	auipc	ra,0x0
    80002ae0:	014080e7          	jalr	20(ra) # 80002af0 <_ZN6KernelD1Ev>
    80002ae4:	00048513          	mv	a0,s1
    80002ae8:	0000e097          	auipc	ra,0xe
    80002aec:	890080e7          	jalr	-1904(ra) # 80010378 <_Unwind_Resume>

0000000080002af0 <_ZN6KernelD1Ev>:
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    80002af0:	fe010113          	addi	sp,sp,-32
    80002af4:	00113c23          	sd	ra,24(sp)
    80002af8:	00813823          	sd	s0,16(sp)
    80002afc:	00913423          	sd	s1,8(sp)
    80002b00:	02010413          	addi	s0,sp,32
    80002b04:	00050493          	mv	s1,a0
    80002b08:	02850513          	addi	a0,a0,40
    80002b0c:	00000097          	auipc	ra,0x0
    80002b10:	180080e7          	jalr	384(ra) # 80002c8c <_ZN14ConsoleManagerD1Ev>
    80002b14:	01848513          	addi	a0,s1,24
    80002b18:	00002097          	auipc	ra,0x2
    80002b1c:	f3c080e7          	jalr	-196(ra) # 80004a54 <_ZN5TimerD1Ev>
    80002b20:	00048513          	mv	a0,s1
    80002b24:	00000097          	auipc	ra,0x0
    80002b28:	54c080e7          	jalr	1356(ra) # 80003070 <_ZN11HeapManagerD1Ev>
    80002b2c:	01813083          	ld	ra,24(sp)
    80002b30:	01013403          	ld	s0,16(sp)
    80002b34:	00813483          	ld	s1,8(sp)
    80002b38:	02010113          	addi	sp,sp,32
    80002b3c:	00008067          	ret

0000000080002b40 <_ZN14ConsoleManager11getInstanceEv>:
    outBuffer.init();
    waitingThreads = 0;
}

ConsoleManager& ConsoleManager::getInstance(){
    assert(instance != 0);
    80002b40:	0000c797          	auipc	a5,0xc
    80002b44:	6f87b783          	ld	a5,1784(a5) # 8000f238 <_ZN14ConsoleManager8instanceE>
    80002b48:	00078863          	beqz	a5,80002b58 <_ZN14ConsoleManager11getInstanceEv+0x18>
    return *instance;
}
    80002b4c:	0000c517          	auipc	a0,0xc
    80002b50:	6ec53503          	ld	a0,1772(a0) # 8000f238 <_ZN14ConsoleManager8instanceE>
    80002b54:	00008067          	ret
ConsoleManager& ConsoleManager::getInstance(){
    80002b58:	ff010113          	addi	sp,sp,-16
    80002b5c:	00113423          	sd	ra,8(sp)
    80002b60:	00813023          	sd	s0,0(sp)
    80002b64:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80002b68:	00009697          	auipc	a3,0x9
    80002b6c:	55068693          	addi	a3,a3,1360 # 8000c0b8 <CONSOLE_STATUS+0xa8>
    80002b70:	02200613          	li	a2,34
    80002b74:	00009597          	auipc	a1,0x9
    80002b78:	57c58593          	addi	a1,a1,1404 # 8000c0f0 <CONSOLE_STATUS+0xe0>
    80002b7c:	00009517          	auipc	a0,0x9
    80002b80:	58c50513          	addi	a0,a0,1420 # 8000c108 <CONSOLE_STATUS+0xf8>
    80002b84:	00002097          	auipc	ra,0x2
    80002b88:	7c0080e7          	jalr	1984(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
}
    80002b8c:	0000c517          	auipc	a0,0xc
    80002b90:	6ac53503          	ld	a0,1708(a0) # 8000f238 <_ZN14ConsoleManager8instanceE>
    80002b94:	00813083          	ld	ra,8(sp)
    80002b98:	00013403          	ld	s0,0(sp)
    80002b9c:	01010113          	addi	sp,sp,16
    80002ba0:	00008067          	ret

0000000080002ba4 <_ZN14ConsoleManager13consoleBufferD1Ev>:

ConsoleManager::consoleBuffer::~consoleBuffer(){
    80002ba4:	ff010113          	addi	sp,sp,-16
    80002ba8:	00113423          	sd	ra,8(sp)
    80002bac:	00813023          	sd	s0,0(sp)
    80002bb0:	01010413          	addi	s0,sp,16
    sem_close(sem);
    80002bb4:	00053503          	ld	a0,0(a0)
    80002bb8:	fffff097          	auipc	ra,0xfffff
    80002bbc:	390080e7          	jalr	912(ra) # 80001f48 <_Z9sem_closeP4_sem>
}
    80002bc0:	00813083          	ld	ra,8(sp)
    80002bc4:	00013403          	ld	s0,0(sp)
    80002bc8:	01010113          	addi	sp,sp,16
    80002bcc:	00008067          	ret

0000000080002bd0 <_ZN14ConsoleManagerC1Ev>:
ConsoleManager::ConsoleManager(){
    80002bd0:	fd010113          	addi	sp,sp,-48
    80002bd4:	02113423          	sd	ra,40(sp)
    80002bd8:	02813023          	sd	s0,32(sp)
    80002bdc:	00913c23          	sd	s1,24(sp)
    80002be0:	01213823          	sd	s2,16(sp)
    80002be4:	01313423          	sd	s3,8(sp)
    80002be8:	03010413          	addi	s0,sp,48
    80002bec:	00050493          	mv	s1,a0

    static ConsoleManager* instance;
    
    struct consoleBuffer{
    public:
        consoleBuffer(): head(0), tail(0), size(0){}
    80002bf0:	20053423          	sd	zero,520(a0)
    80002bf4:	20053823          	sd	zero,528(a0)
    80002bf8:	20053c23          	sd	zero,536(a0)
    80002bfc:	42053423          	sd	zero,1064(a0)
    80002c00:	42053823          	sd	zero,1072(a0)
    80002c04:	42053c23          	sd	zero,1080(a0)
    assert(instance == 0);
    80002c08:	0000c797          	auipc	a5,0xc
    80002c0c:	6307b783          	ld	a5,1584(a5) # 8000f238 <_ZN14ConsoleManager8instanceE>
    80002c10:	02079463          	bnez	a5,80002c38 <_ZN14ConsoleManagerC1Ev+0x68>
    instance = this;
    80002c14:	0000c797          	auipc	a5,0xc
    80002c18:	6297b223          	sd	s1,1572(a5) # 8000f238 <_ZN14ConsoleManager8instanceE>
}
    80002c1c:	02813083          	ld	ra,40(sp)
    80002c20:	02013403          	ld	s0,32(sp)
    80002c24:	01813483          	ld	s1,24(sp)
    80002c28:	01013903          	ld	s2,16(sp)
    80002c2c:	00813983          	ld	s3,8(sp)
    80002c30:	03010113          	addi	sp,sp,48
    80002c34:	00008067          	ret
    80002c38:	22050913          	addi	s2,a0,544
    assert(instance == 0);
    80002c3c:	00009697          	auipc	a3,0x9
    80002c40:	4dc68693          	addi	a3,a3,1244 # 8000c118 <CONSOLE_STATUS+0x108>
    80002c44:	01400613          	li	a2,20
    80002c48:	00009597          	auipc	a1,0x9
    80002c4c:	4a858593          	addi	a1,a1,1192 # 8000c0f0 <CONSOLE_STATUS+0xe0>
    80002c50:	00009517          	auipc	a0,0x9
    80002c54:	4f050513          	addi	a0,a0,1264 # 8000c140 <CONSOLE_STATUS+0x130>
    80002c58:	00002097          	auipc	ra,0x2
    80002c5c:	6ec080e7          	jalr	1772(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    80002c60:	fb5ff06f          	j	80002c14 <_ZN14ConsoleManagerC1Ev+0x44>
    80002c64:	00050993          	mv	s3,a0
ConsoleManager::ConsoleManager(){
    80002c68:	00090513          	mv	a0,s2
    80002c6c:	00000097          	auipc	ra,0x0
    80002c70:	f38080e7          	jalr	-200(ra) # 80002ba4 <_ZN14ConsoleManager13consoleBufferD1Ev>
    80002c74:	00048513          	mv	a0,s1
    80002c78:	00000097          	auipc	ra,0x0
    80002c7c:	f2c080e7          	jalr	-212(ra) # 80002ba4 <_ZN14ConsoleManager13consoleBufferD1Ev>
    80002c80:	00098513          	mv	a0,s3
    80002c84:	0000d097          	auipc	ra,0xd
    80002c88:	6f4080e7          	jalr	1780(ra) # 80010378 <_Unwind_Resume>

0000000080002c8c <_ZN14ConsoleManagerD1Ev>:
ConsoleManager::~ConsoleManager(){
    80002c8c:	fe010113          	addi	sp,sp,-32
    80002c90:	00113c23          	sd	ra,24(sp)
    80002c94:	00813823          	sd	s0,16(sp)
    80002c98:	00913423          	sd	s1,8(sp)
    80002c9c:	02010413          	addi	s0,sp,32
    80002ca0:	00050493          	mv	s1,a0
    80002ca4:	22050513          	addi	a0,a0,544
    80002ca8:	00000097          	auipc	ra,0x0
    80002cac:	efc080e7          	jalr	-260(ra) # 80002ba4 <_ZN14ConsoleManager13consoleBufferD1Ev>
    80002cb0:	00048513          	mv	a0,s1
    80002cb4:	00000097          	auipc	ra,0x0
    80002cb8:	ef0080e7          	jalr	-272(ra) # 80002ba4 <_ZN14ConsoleManager13consoleBufferD1Ev>
}
    80002cbc:	01813083          	ld	ra,24(sp)
    80002cc0:	01013403          	ld	s0,16(sp)
    80002cc4:	00813483          	ld	s1,8(sp)
    80002cc8:	02010113          	addi	sp,sp,32
    80002ccc:	00008067          	ret

0000000080002cd0 <_ZN14ConsoleManager13consoleBuffer4initEv>:

void ConsoleManager::consoleBuffer::init(){
    80002cd0:	ff010113          	addi	sp,sp,-16
    80002cd4:	00113423          	sd	ra,8(sp)
    80002cd8:	00813023          	sd	s0,0(sp)
    80002cdc:	01010413          	addi	s0,sp,16
    _sem::open(&sem, 0);
    80002ce0:	00000593          	li	a1,0
    80002ce4:	00002097          	auipc	ra,0x2
    80002ce8:	fd0080e7          	jalr	-48(ra) # 80004cb4 <_ZN4_sem4openEPPS_j>
}
    80002cec:	00813083          	ld	ra,8(sp)
    80002cf0:	00013403          	ld	s0,0(sp)
    80002cf4:	01010113          	addi	sp,sp,16
    80002cf8:	00008067          	ret

0000000080002cfc <_ZN14ConsoleManager4initEv>:
void ConsoleManager::init(){
    80002cfc:	fe010113          	addi	sp,sp,-32
    80002d00:	00113c23          	sd	ra,24(sp)
    80002d04:	00813823          	sd	s0,16(sp)
    80002d08:	00913423          	sd	s1,8(sp)
    80002d0c:	02010413          	addi	s0,sp,32
    80002d10:	00050493          	mv	s1,a0
    inBuffer.init();
    80002d14:	00000097          	auipc	ra,0x0
    80002d18:	fbc080e7          	jalr	-68(ra) # 80002cd0 <_ZN14ConsoleManager13consoleBuffer4initEv>
    outBuffer.init();
    80002d1c:	22048513          	addi	a0,s1,544
    80002d20:	00000097          	auipc	ra,0x0
    80002d24:	fb0080e7          	jalr	-80(ra) # 80002cd0 <_ZN14ConsoleManager13consoleBuffer4initEv>
    waitingThreads = 0;
    80002d28:	4404a023          	sw	zero,1088(s1)
}
    80002d2c:	01813083          	ld	ra,24(sp)
    80002d30:	01013403          	ld	s0,16(sp)
    80002d34:	00813483          	ld	s1,8(sp)
    80002d38:	02010113          	addi	sp,sp,32
    80002d3c:	00008067          	ret

0000000080002d40 <_ZN14ConsoleManager13consoleBuffer3putEc>:

void ConsoleManager::consoleBuffer::put(char c){
    80002d40:	ff010113          	addi	sp,sp,-16
    80002d44:	00113423          	sd	ra,8(sp)
    80002d48:	00813023          	sd	s0,0(sp)
    80002d4c:	01010413          	addi	s0,sp,16
    buffer[tail] = c;
    80002d50:	21053783          	ld	a5,528(a0)
    80002d54:	00f50733          	add	a4,a0,a5
    80002d58:	00b70423          	sb	a1,8(a4)
    tail = (tail + 1) % BUFFER_SIZE;
    80002d5c:	00178793          	addi	a5,a5,1
    80002d60:	1ff7f793          	andi	a5,a5,511
    80002d64:	20f53823          	sd	a5,528(a0)
    size++;
    80002d68:	21853783          	ld	a5,536(a0)
    80002d6c:	00178793          	addi	a5,a5,1
    80002d70:	20f53c23          	sd	a5,536(a0)
    sem_signal(sem);
    80002d74:	00053503          	ld	a0,0(a0)
    80002d78:	fffff097          	auipc	ra,0xfffff
    80002d7c:	228080e7          	jalr	552(ra) # 80001fa0 <_Z10sem_signalP4_sem>
}
    80002d80:	00813083          	ld	ra,8(sp)
    80002d84:	00013403          	ld	s0,0(sp)
    80002d88:	01010113          	addi	sp,sp,16
    80002d8c:	00008067          	ret

0000000080002d90 <_ZN14ConsoleManager13consoleBuffer3getEv>:

char ConsoleManager::consoleBuffer::get(){
    80002d90:	fe010113          	addi	sp,sp,-32
    80002d94:	00113c23          	sd	ra,24(sp)
    80002d98:	00813823          	sd	s0,16(sp)
    80002d9c:	00913423          	sd	s1,8(sp)
    80002da0:	02010413          	addi	s0,sp,32
    80002da4:	00050493          	mv	s1,a0
    sem_wait(sem);
    80002da8:	00053503          	ld	a0,0(a0)
    80002dac:	fffff097          	auipc	ra,0xfffff
    80002db0:	1c8080e7          	jalr	456(ra) # 80001f74 <_Z8sem_waitP4_sem>
    char c = buffer[head];
    80002db4:	2084b783          	ld	a5,520(s1)
    80002db8:	00f48733          	add	a4,s1,a5
    80002dbc:	00874503          	lbu	a0,8(a4)
    head = (head + 1) % BUFFER_SIZE;
    80002dc0:	00178793          	addi	a5,a5,1
    80002dc4:	1ff7f793          	andi	a5,a5,511
    80002dc8:	20f4b423          	sd	a5,520(s1)
    size--;
    80002dcc:	2184b783          	ld	a5,536(s1)
    80002dd0:	fff78793          	addi	a5,a5,-1
    80002dd4:	20f4bc23          	sd	a5,536(s1)
    return c;
}
    80002dd8:	01813083          	ld	ra,24(sp)
    80002ddc:	01013403          	ld	s0,16(sp)
    80002de0:	00813483          	ld	s1,8(sp)
    80002de4:	02010113          	addi	sp,sp,32
    80002de8:	00008067          	ret

0000000080002dec <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>:

bool ConsoleManager::consoleBuffer::isEmpty(){
    80002dec:	ff010113          	addi	sp,sp,-16
    80002df0:	00813423          	sd	s0,8(sp)
    80002df4:	01010413          	addi	s0,sp,16
    return size == 0;
    80002df8:	21853503          	ld	a0,536(a0)
}
    80002dfc:	00153513          	seqz	a0,a0
    80002e00:	00813403          	ld	s0,8(sp)
    80002e04:	01010113          	addi	sp,sp,16
    80002e08:	00008067          	ret

0000000080002e0c <_ZN14ConsoleManager13consoleBuffer6isFullEv>:

bool ConsoleManager::consoleBuffer::isFull(){
    80002e0c:	ff010113          	addi	sp,sp,-16
    80002e10:	00813423          	sd	s0,8(sp)
    80002e14:	01010413          	addi	s0,sp,16
    return size == BUFFER_SIZE;
    80002e18:	21853503          	ld	a0,536(a0)
    80002e1c:	e0050513          	addi	a0,a0,-512
}
    80002e20:	00153513          	seqz	a0,a0
    80002e24:	00813403          	ld	s0,8(sp)
    80002e28:	01010113          	addi	sp,sp,16
    80002e2c:	00008067          	ret

0000000080002e30 <_ZN14ConsoleManager4putcEc>:

void ConsoleManager::putc(char c){
    80002e30:	ff010113          	addi	sp,sp,-16
    80002e34:	00113423          	sd	ra,8(sp)
    80002e38:	00813023          	sd	s0,0(sp)
    80002e3c:	01010413          	addi	s0,sp,16
    80002e40:	00050593          	mv	a1,a0
    instance->outBuffer.put(c);
    80002e44:	0000c517          	auipc	a0,0xc
    80002e48:	3f453503          	ld	a0,1012(a0) # 8000f238 <_ZN14ConsoleManager8instanceE>
    80002e4c:	22050513          	addi	a0,a0,544
    80002e50:	00000097          	auipc	ra,0x0
    80002e54:	ef0080e7          	jalr	-272(ra) # 80002d40 <_ZN14ConsoleManager13consoleBuffer3putEc>
}
    80002e58:	00813083          	ld	ra,8(sp)
    80002e5c:	00013403          	ld	s0,0(sp)
    80002e60:	01010113          	addi	sp,sp,16
    80002e64:	00008067          	ret

0000000080002e68 <_ZN14ConsoleManager4getcEv>:

char ConsoleManager::getc(){
    80002e68:	fe010113          	addi	sp,sp,-32
    80002e6c:	00113c23          	sd	ra,24(sp)
    80002e70:	00813823          	sd	s0,16(sp)
    80002e74:	00913423          	sd	s1,8(sp)
    80002e78:	02010413          	addi	s0,sp,32
    instance->waitingThreads++;
    80002e7c:	0000c497          	auipc	s1,0xc
    80002e80:	3bc48493          	addi	s1,s1,956 # 8000f238 <_ZN14ConsoleManager8instanceE>
    80002e84:	0004b503          	ld	a0,0(s1)
    80002e88:	44052783          	lw	a5,1088(a0)
    80002e8c:	0017879b          	addiw	a5,a5,1
    80002e90:	44f52023          	sw	a5,1088(a0)
    char c = instance->inBuffer.get();
    80002e94:	00000097          	auipc	ra,0x0
    80002e98:	efc080e7          	jalr	-260(ra) # 80002d90 <_ZN14ConsoleManager13consoleBuffer3getEv>
    instance->waitingThreads--;
    80002e9c:	0004b703          	ld	a4,0(s1)
    80002ea0:	44072783          	lw	a5,1088(a4)
    80002ea4:	fff7879b          	addiw	a5,a5,-1
    80002ea8:	44f72023          	sw	a5,1088(a4)
    return c;
}
    80002eac:	01813083          	ld	ra,24(sp)
    80002eb0:	01013403          	ld	s0,16(sp)
    80002eb4:	00813483          	ld	s1,8(sp)
    80002eb8:	02010113          	addi	sp,sp,32
    80002ebc:	00008067          	ret

0000000080002ec0 <_ZN14ConsoleManager8finishedEv>:

bool ConsoleManager::finished(){
    80002ec0:	fe010113          	addi	sp,sp,-32
    80002ec4:	00113c23          	sd	ra,24(sp)
    80002ec8:	00813823          	sd	s0,16(sp)
    80002ecc:	00913423          	sd	s1,8(sp)
    80002ed0:	02010413          	addi	s0,sp,32
    return instance->outBuffer.isEmpty() && instance->waitingThreads == 0;
    80002ed4:	0000c497          	auipc	s1,0xc
    80002ed8:	3644b483          	ld	s1,868(s1) # 8000f238 <_ZN14ConsoleManager8instanceE>
    80002edc:	22048513          	addi	a0,s1,544
    80002ee0:	00000097          	auipc	ra,0x0
    80002ee4:	f0c080e7          	jalr	-244(ra) # 80002dec <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>
    80002ee8:	00050a63          	beqz	a0,80002efc <_ZN14ConsoleManager8finishedEv+0x3c>
    80002eec:	4404a783          	lw	a5,1088(s1)
    80002ef0:	00078863          	beqz	a5,80002f00 <_ZN14ConsoleManager8finishedEv+0x40>
    80002ef4:	00000513          	li	a0,0
    80002ef8:	0080006f          	j	80002f00 <_ZN14ConsoleManager8finishedEv+0x40>
    80002efc:	00000513          	li	a0,0
}
    80002f00:	01813083          	ld	ra,24(sp)
    80002f04:	01013403          	ld	s0,16(sp)
    80002f08:	00813483          	ld	s1,8(sp)
    80002f0c:	02010113          	addi	sp,sp,32
    80002f10:	00008067          	ret

0000000080002f14 <_ZN14ConsoleManager13outputHandlerEv>:

void ConsoleManager::outputHandler(){
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
    80002f14:	0000c797          	auipc	a5,0xc
    80002f18:	2747b783          	ld	a5,628(a5) # 8000f188 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002f1c:	0007b783          	ld	a5,0(a5)
    80002f20:	0007c783          	lbu	a5,0(a5)
    80002f24:	0207f793          	andi	a5,a5,32
    80002f28:	06078463          	beqz	a5,80002f90 <_ZN14ConsoleManager13outputHandlerEv+0x7c>
void ConsoleManager::outputHandler(){
    80002f2c:	fe010113          	addi	sp,sp,-32
    80002f30:	00113c23          	sd	ra,24(sp)
    80002f34:	00813823          	sd	s0,16(sp)
    80002f38:	00913423          	sd	s1,8(sp)
    80002f3c:	02010413          	addi	s0,sp,32
        (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
    80002f40:	0000c797          	auipc	a5,0xc
    80002f44:	2587b783          	ld	a5,600(a5) # 8000f198 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002f48:	0007b483          	ld	s1,0(a5)
    80002f4c:	0000c517          	auipc	a0,0xc
    80002f50:	2ec53503          	ld	a0,748(a0) # 8000f238 <_ZN14ConsoleManager8instanceE>
    80002f54:	22050513          	addi	a0,a0,544
    80002f58:	00000097          	auipc	ra,0x0
    80002f5c:	e38080e7          	jalr	-456(ra) # 80002d90 <_ZN14ConsoleManager13consoleBuffer3getEv>
    80002f60:	00a48023          	sb	a0,0(s1)
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
    80002f64:	0000c797          	auipc	a5,0xc
    80002f68:	2247b783          	ld	a5,548(a5) # 8000f188 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002f6c:	0007b783          	ld	a5,0(a5)
    80002f70:	0007c783          	lbu	a5,0(a5)
    80002f74:	0207f793          	andi	a5,a5,32
    80002f78:	fc0794e3          	bnez	a5,80002f40 <_ZN14ConsoleManager13outputHandlerEv+0x2c>
    }
}
    80002f7c:	01813083          	ld	ra,24(sp)
    80002f80:	01013403          	ld	s0,16(sp)
    80002f84:	00813483          	ld	s1,8(sp)
    80002f88:	02010113          	addi	sp,sp,32
    80002f8c:	00008067          	ret
    80002f90:	00008067          	ret

0000000080002f94 <_ZN14ConsoleManager12inputHandlerEv>:

void ConsoleManager::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80002f94:	0000c797          	auipc	a5,0xc
    80002f98:	1f47b783          	ld	a5,500(a5) # 8000f188 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002f9c:	0007b783          	ld	a5,0(a5)
    80002fa0:	0007c783          	lbu	a5,0(a5)
    80002fa4:	0017f793          	andi	a5,a5,1
    80002fa8:	04078e63          	beqz	a5,80003004 <_ZN14ConsoleManager12inputHandlerEv+0x70>
void ConsoleManager::inputHandler(){
    80002fac:	ff010113          	addi	sp,sp,-16
    80002fb0:	00113423          	sd	ra,8(sp)
    80002fb4:	00813023          	sd	s0,0(sp)
    80002fb8:	01010413          	addi	s0,sp,16
        char ch =(*(char*)CONSOLE_RX_DATA);
    80002fbc:	0000c797          	auipc	a5,0xc
    80002fc0:	1c47b783          	ld	a5,452(a5) # 8000f180 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002fc4:	0007b783          	ld	a5,0(a5)
        instance->inBuffer.put(ch);
    80002fc8:	0007c583          	lbu	a1,0(a5)
    80002fcc:	0000c517          	auipc	a0,0xc
    80002fd0:	26c53503          	ld	a0,620(a0) # 8000f238 <_ZN14ConsoleManager8instanceE>
    80002fd4:	00000097          	auipc	ra,0x0
    80002fd8:	d6c080e7          	jalr	-660(ra) # 80002d40 <_ZN14ConsoleManager13consoleBuffer3putEc>
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    80002fdc:	0000c797          	auipc	a5,0xc
    80002fe0:	1ac7b783          	ld	a5,428(a5) # 8000f188 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002fe4:	0007b783          	ld	a5,0(a5)
    80002fe8:	0007c783          	lbu	a5,0(a5)
    80002fec:	0017f793          	andi	a5,a5,1
    80002ff0:	fc0796e3          	bnez	a5,80002fbc <_ZN14ConsoleManager12inputHandlerEv+0x28>
    }
    80002ff4:	00813083          	ld	ra,8(sp)
    80002ff8:	00013403          	ld	s0,0(sp)
    80002ffc:	01010113          	addi	sp,sp,16
    80003000:	00008067          	ret
    80003004:	00008067          	ret

0000000080003008 <_ZN11HeapManagerC1Ev>:
#include "heapManager.h"
#include "consoleManager.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    80003008:	fe010113          	addi	sp,sp,-32
    8000300c:	00113c23          	sd	ra,24(sp)
    80003010:	00813823          	sd	s0,16(sp)
    80003014:	00913423          	sd	s1,8(sp)
    80003018:	02010413          	addi	s0,sp,32
    8000301c:	00050493          	mv	s1,a0
    assert(instance == 0);
    80003020:	0000c797          	auipc	a5,0xc
    80003024:	2207b783          	ld	a5,544(a5) # 8000f240 <_ZN11HeapManager8instanceE>
    80003028:	02079063          	bnez	a5,80003048 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    8000302c:	0000c797          	auipc	a5,0xc
    80003030:	2097ba23          	sd	s1,532(a5) # 8000f240 <_ZN11HeapManager8instanceE>
}
    80003034:	01813083          	ld	ra,24(sp)
    80003038:	01013403          	ld	s0,16(sp)
    8000303c:	00813483          	ld	s1,8(sp)
    80003040:	02010113          	addi	sp,sp,32
    80003044:	00008067          	ret
    assert(instance == 0);
    80003048:	00009697          	auipc	a3,0x9
    8000304c:	10868693          	addi	a3,a3,264 # 8000c150 <CONSOLE_STATUS+0x140>
    80003050:	01200613          	li	a2,18
    80003054:	00009597          	auipc	a1,0x9
    80003058:	11c58593          	addi	a1,a1,284 # 8000c170 <CONSOLE_STATUS+0x160>
    8000305c:	00009517          	auipc	a0,0x9
    80003060:	0e450513          	addi	a0,a0,228 # 8000c140 <CONSOLE_STATUS+0x130>
    80003064:	00002097          	auipc	ra,0x2
    80003068:	2e0080e7          	jalr	736(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    8000306c:	fc1ff06f          	j	8000302c <_ZN11HeapManagerC1Ev+0x24>

0000000080003070 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80003070:	ff010113          	addi	sp,sp,-16
    80003074:	00813423          	sd	s0,8(sp)
    80003078:	01010413          	addi	s0,sp,16
    
}
    8000307c:	00813403          	ld	s0,8(sp)
    80003080:	01010113          	addi	sp,sp,16
    80003084:	00008067          	ret

0000000080003088 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uint64 nStart, size_t nEnd){
    80003088:	fd010113          	addi	sp,sp,-48
    8000308c:	02113423          	sd	ra,40(sp)
    80003090:	02813023          	sd	s0,32(sp)
    80003094:	00913c23          	sd	s1,24(sp)
    80003098:	01213823          	sd	s2,16(sp)
    8000309c:	01313423          	sd	s3,8(sp)
    800030a0:	03010413          	addi	s0,sp,48
    800030a4:	00050993          	mv	s3,a0
    800030a8:	00058913          	mv	s2,a1
    /// Align the start address
    #ifdef CHECK_CONDITIONS
        assert(nEnd - nStart > MEM_BLOCK_SIZE);
    800030ac:	40b604b3          	sub	s1,a2,a1
    800030b0:	0414b793          	sltiu	a5,s1,65
    800030b4:	0c079a63          	bnez	a5,80003188 <_ZN11HeapManager4initEmm+0x100>
    #endif
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    800030b8:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    800030bc:	fe100793          	li	a5,-31
    800030c0:	00f90c23          	sb	a5,24(s2)
    800030c4:	ffe00793          	li	a5,-2
    800030c8:	00f90ca3          	sb	a5,25(s2)
    800030cc:	00f00793          	li	a5,15
    800030d0:	00f90d23          	sb	a5,26(s2)
    800030d4:	01c00793          	li	a5,28
    800030d8:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    800030dc:	0064d613          	srli	a2,s1,0x6
    800030e0:	0009b783          	ld	a5,0(s3)
    800030e4:	fff60613          	addi	a2,a2,-1
    800030e8:	00c78823          	sb	a2,16(a5)
    800030ec:	00865713          	srli	a4,a2,0x8
    800030f0:	00e788a3          	sb	a4,17(a5)
    800030f4:	01065713          	srli	a4,a2,0x10
    800030f8:	00e78923          	sb	a4,18(a5)
    800030fc:	0186571b          	srliw	a4,a2,0x18
    80003100:	00e789a3          	sb	a4,19(a5)
    80003104:	02065713          	srli	a4,a2,0x20
    80003108:	00e78a23          	sb	a4,20(a5)
    8000310c:	02865713          	srli	a4,a2,0x28
    80003110:	00e78aa3          	sb	a4,21(a5)
    80003114:	03065713          	srli	a4,a2,0x30
    80003118:	00e78b23          	sb	a4,22(a5)
    8000311c:	03865613          	srli	a2,a2,0x38
    80003120:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    80003124:	0009b783          	ld	a5,0(s3)
    80003128:	00078023          	sb	zero,0(a5)
    8000312c:	000780a3          	sb	zero,1(a5)
    80003130:	00078123          	sb	zero,2(a5)
    80003134:	000781a3          	sb	zero,3(a5)
    80003138:	00078223          	sb	zero,4(a5)
    8000313c:	000782a3          	sb	zero,5(a5)
    80003140:	00078323          	sb	zero,6(a5)
    80003144:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80003148:	0009b783          	ld	a5,0(s3)
    8000314c:	00078423          	sb	zero,8(a5)
    80003150:	000784a3          	sb	zero,9(a5)
    80003154:	00078523          	sb	zero,10(a5)
    80003158:	000785a3          	sb	zero,11(a5)
    8000315c:	00078623          	sb	zero,12(a5)
    80003160:	000786a3          	sb	zero,13(a5)
    80003164:	00078723          	sb	zero,14(a5)
    80003168:	000787a3          	sb	zero,15(a5)
}
    8000316c:	02813083          	ld	ra,40(sp)
    80003170:	02013403          	ld	s0,32(sp)
    80003174:	01813483          	ld	s1,24(sp)
    80003178:	01013903          	ld	s2,16(sp)
    8000317c:	00813983          	ld	s3,8(sp)
    80003180:	03010113          	addi	sp,sp,48
    80003184:	00008067          	ret
        assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003188:	00009697          	auipc	a3,0x9
    8000318c:	00068693          	mv	a3,a3
    80003190:	01d00613          	li	a2,29
    80003194:	00009597          	auipc	a1,0x9
    80003198:	fdc58593          	addi	a1,a1,-36 # 8000c170 <CONSOLE_STATUS+0x160>
    8000319c:	00009517          	auipc	a0,0x9
    800031a0:	01450513          	addi	a0,a0,20 # 8000c1b0 <CONSOLE_STATUS+0x1a0>
    800031a4:	00002097          	auipc	ra,0x2
    800031a8:	1a0080e7          	jalr	416(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    800031ac:	f0dff06f          	j	800030b8 <_ZN11HeapManager4initEmm+0x30>

00000000800031b0 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    800031b0:	fe010113          	addi	sp,sp,-32
    800031b4:	00113c23          	sd	ra,24(sp)
    800031b8:	00813823          	sd	s0,16(sp)
    800031bc:	00913423          	sd	s1,8(sp)
    800031c0:	01213023          	sd	s2,0(sp)
    800031c4:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    800031c8:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    800031cc:	00000913          	li	s2,0
    800031d0:	0b80006f          	j	80003288 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        #ifdef CHECK_CONDITIONS
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        #endif
        nFreeMemory += pCurrent->nSize;
    800031d4:	0104c783          	lbu	a5,16(s1)
    800031d8:	0114c703          	lbu	a4,17(s1)
    800031dc:	00871713          	slli	a4,a4,0x8
    800031e0:	00f76733          	or	a4,a4,a5
    800031e4:	0124c783          	lbu	a5,18(s1)
    800031e8:	01079793          	slli	a5,a5,0x10
    800031ec:	00e7e733          	or	a4,a5,a4
    800031f0:	0134c783          	lbu	a5,19(s1)
    800031f4:	01879793          	slli	a5,a5,0x18
    800031f8:	00e7e7b3          	or	a5,a5,a4
    800031fc:	0144c703          	lbu	a4,20(s1)
    80003200:	02071713          	slli	a4,a4,0x20
    80003204:	00f767b3          	or	a5,a4,a5
    80003208:	0154c703          	lbu	a4,21(s1)
    8000320c:	02871713          	slli	a4,a4,0x28
    80003210:	00f76733          	or	a4,a4,a5
    80003214:	0164c783          	lbu	a5,22(s1)
    80003218:	03079793          	slli	a5,a5,0x30
    8000321c:	00e7e733          	or	a4,a5,a4
    80003220:	0174c783          	lbu	a5,23(s1)
    80003224:	03879793          	slli	a5,a5,0x38
    80003228:	00e7e7b3          	or	a5,a5,a4
    8000322c:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80003230:	0004c703          	lbu	a4,0(s1)
    80003234:	0014c783          	lbu	a5,1(s1)
    80003238:	00879793          	slli	a5,a5,0x8
    8000323c:	00e7e733          	or	a4,a5,a4
    80003240:	0024c783          	lbu	a5,2(s1)
    80003244:	01079793          	slli	a5,a5,0x10
    80003248:	00e7e7b3          	or	a5,a5,a4
    8000324c:	0034c703          	lbu	a4,3(s1)
    80003250:	01871713          	slli	a4,a4,0x18
    80003254:	00f767b3          	or	a5,a4,a5
    80003258:	0044c703          	lbu	a4,4(s1)
    8000325c:	02071713          	slli	a4,a4,0x20
    80003260:	00f76733          	or	a4,a4,a5
    80003264:	0054c783          	lbu	a5,5(s1)
    80003268:	02879793          	slli	a5,a5,0x28
    8000326c:	00e7e733          	or	a4,a5,a4
    80003270:	0064c783          	lbu	a5,6(s1)
    80003274:	03079793          	slli	a5,a5,0x30
    80003278:	00e7e7b3          	or	a5,a5,a4
    8000327c:	0074c483          	lbu	s1,7(s1)
    80003280:	03849493          	slli	s1,s1,0x38
    80003284:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003288:	06048263          	beqz	s1,800032ec <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    8000328c:	0184c783          	lbu	a5,24(s1)
    80003290:	0194c703          	lbu	a4,25(s1)
    80003294:	00871713          	slli	a4,a4,0x8
    80003298:	00f76733          	or	a4,a4,a5
    8000329c:	01a4c783          	lbu	a5,26(s1)
    800032a0:	01079793          	slli	a5,a5,0x10
    800032a4:	00e7e733          	or	a4,a5,a4
    800032a8:	01b4c783          	lbu	a5,27(s1)
    800032ac:	01879793          	slli	a5,a5,0x18
    800032b0:	00e7e7b3          	or	a5,a5,a4
    800032b4:	0007879b          	sext.w	a5,a5
    800032b8:	1c100737          	lui	a4,0x1c100
    800032bc:	ee170713          	addi	a4,a4,-287 # 1c0ffee1 <_entry-0x63f0011f>
    800032c0:	f0e78ae3          	beq	a5,a4,800031d4 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    800032c4:	00009697          	auipc	a3,0x9
    800032c8:	f0c68693          	addi	a3,a3,-244 # 8000c1d0 <CONSOLE_STATUS+0x1c0>
    800032cc:	02c00613          	li	a2,44
    800032d0:	00009597          	auipc	a1,0x9
    800032d4:	ea058593          	addi	a1,a1,-352 # 8000c170 <CONSOLE_STATUS+0x160>
    800032d8:	00009517          	auipc	a0,0x9
    800032dc:	f2050513          	addi	a0,a0,-224 # 8000c1f8 <CONSOLE_STATUS+0x1e8>
    800032e0:	00002097          	auipc	ra,0x2
    800032e4:	064080e7          	jalr	100(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    800032e8:	eedff06f          	j	800031d4 <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    800032ec:	00090513          	mv	a0,s2
    800032f0:	01813083          	ld	ra,24(sp)
    800032f4:	01013403          	ld	s0,16(sp)
    800032f8:	00813483          	ld	s1,8(sp)
    800032fc:	00013903          	ld	s2,0(sp)
    80003300:	02010113          	addi	sp,sp,32
    80003304:	00008067          	ret

0000000080003308 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    80003308:	fd010113          	addi	sp,sp,-48
    8000330c:	02113423          	sd	ra,40(sp)
    80003310:	02813023          	sd	s0,32(sp)
    80003314:	00913c23          	sd	s1,24(sp)
    80003318:	01213823          	sd	s2,16(sp)
    8000331c:	01313423          	sd	s3,8(sp)
    80003320:	03010413          	addi	s0,sp,48
    80003324:	00050993          	mv	s3,a0
    80003328:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    8000332c:	00053483          	ld	s1,0(a0)
    80003330:	0c00006f          	j	800033f0 <_ZN11HeapManager12heapAllocateEm+0xe8>
    while(pCurrent != 0){
        #ifdef CHECK_CONDITIONS
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        #endif
        if(pCurrent->nSize > nSize + 1){
    80003334:	0104c783          	lbu	a5,16(s1)
    80003338:	0114c703          	lbu	a4,17(s1)
    8000333c:	00871713          	slli	a4,a4,0x8
    80003340:	00f76733          	or	a4,a4,a5
    80003344:	0124c783          	lbu	a5,18(s1)
    80003348:	01079793          	slli	a5,a5,0x10
    8000334c:	00e7e733          	or	a4,a5,a4
    80003350:	0134c783          	lbu	a5,19(s1)
    80003354:	01879793          	slli	a5,a5,0x18
    80003358:	00e7e7b3          	or	a5,a5,a4
    8000335c:	0144c703          	lbu	a4,20(s1)
    80003360:	02071713          	slli	a4,a4,0x20
    80003364:	00f767b3          	or	a5,a4,a5
    80003368:	0154c703          	lbu	a4,21(s1)
    8000336c:	02871713          	slli	a4,a4,0x28
    80003370:	00f76733          	or	a4,a4,a5
    80003374:	0164c783          	lbu	a5,22(s1)
    80003378:	03079793          	slli	a5,a5,0x30
    8000337c:	00e7e733          	or	a4,a5,a4
    80003380:	0174c783          	lbu	a5,23(s1)
    80003384:	03879793          	slli	a5,a5,0x38
    80003388:	00e7e7b3          	or	a5,a5,a4
    8000338c:	00190713          	addi	a4,s2,1
    80003390:	0cf76263          	bltu	a4,a5,80003454 <_ZN11HeapManager12heapAllocateEm+0x14c>
            if(pCurrent == m_pHead){
                m_pHead = pNew;
            }
            pCurrent->nSize = nSize;
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }else if(pCurrent->nSize >= nSize){
    80003394:	3d27fe63          	bgeu	a5,s2,80003770 <_ZN11HeapManager12heapAllocateEm+0x468>
            if(pCurrent == m_pHead){
                m_pHead = pCurrent->pNext;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80003398:	0004c703          	lbu	a4,0(s1)
    8000339c:	0014c783          	lbu	a5,1(s1)
    800033a0:	00879793          	slli	a5,a5,0x8
    800033a4:	00e7e733          	or	a4,a5,a4
    800033a8:	0024c783          	lbu	a5,2(s1)
    800033ac:	01079793          	slli	a5,a5,0x10
    800033b0:	00e7e7b3          	or	a5,a5,a4
    800033b4:	0034c703          	lbu	a4,3(s1)
    800033b8:	01871713          	slli	a4,a4,0x18
    800033bc:	00f767b3          	or	a5,a4,a5
    800033c0:	0044c703          	lbu	a4,4(s1)
    800033c4:	02071713          	slli	a4,a4,0x20
    800033c8:	00f76733          	or	a4,a4,a5
    800033cc:	0054c783          	lbu	a5,5(s1)
    800033d0:	02879793          	slli	a5,a5,0x28
    800033d4:	00e7e733          	or	a4,a5,a4
    800033d8:	0064c783          	lbu	a5,6(s1)
    800033dc:	03079793          	slli	a5,a5,0x30
    800033e0:	00e7e7b3          	or	a5,a5,a4
    800033e4:	0074c483          	lbu	s1,7(s1)
    800033e8:	03849493          	slli	s1,s1,0x38
    800033ec:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    800033f0:	5c048863          	beqz	s1,800039c0 <_ZN11HeapManager12heapAllocateEm+0x6b8>
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    800033f4:	0184c783          	lbu	a5,24(s1)
    800033f8:	0194c703          	lbu	a4,25(s1)
    800033fc:	00871713          	slli	a4,a4,0x8
    80003400:	00f76733          	or	a4,a4,a5
    80003404:	01a4c783          	lbu	a5,26(s1)
    80003408:	01079793          	slli	a5,a5,0x10
    8000340c:	00e7e733          	or	a4,a5,a4
    80003410:	01b4c783          	lbu	a5,27(s1)
    80003414:	01879793          	slli	a5,a5,0x18
    80003418:	00e7e7b3          	or	a5,a5,a4
    8000341c:	0007879b          	sext.w	a5,a5
    80003420:	1c100737          	lui	a4,0x1c100
    80003424:	ee170713          	addi	a4,a4,-287 # 1c0ffee1 <_entry-0x63f0011f>
    80003428:	f0e786e3          	beq	a5,a4,80003334 <_ZN11HeapManager12heapAllocateEm+0x2c>
    8000342c:	00009697          	auipc	a3,0x9
    80003430:	df468693          	addi	a3,a3,-524 # 8000c220 <CONSOLE_STATUS+0x210>
    80003434:	03800613          	li	a2,56
    80003438:	00009597          	auipc	a1,0x9
    8000343c:	d3858593          	addi	a1,a1,-712 # 8000c170 <CONSOLE_STATUS+0x160>
    80003440:	00009517          	auipc	a0,0x9
    80003444:	db850513          	addi	a0,a0,-584 # 8000c1f8 <CONSOLE_STATUS+0x1e8>
    80003448:	00002097          	auipc	ra,0x2
    8000344c:	efc080e7          	jalr	-260(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    80003450:	ee5ff06f          	j	80003334 <_ZN11HeapManager12heapAllocateEm+0x2c>
            HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    80003454:	00671713          	slli	a4,a4,0x6
    80003458:	00048613          	mv	a2,s1
    8000345c:	00970733          	add	a4,a4,s1
            pNew->nSize = pCurrent->nSize - nSize - 1;
    80003460:	412787b3          	sub	a5,a5,s2
    80003464:	fff78793          	addi	a5,a5,-1
    80003468:	00f70823          	sb	a5,16(a4)
    8000346c:	0087d693          	srli	a3,a5,0x8
    80003470:	00d708a3          	sb	a3,17(a4)
    80003474:	0107d693          	srli	a3,a5,0x10
    80003478:	00d70923          	sb	a3,18(a4)
    8000347c:	0187d69b          	srliw	a3,a5,0x18
    80003480:	00d709a3          	sb	a3,19(a4)
    80003484:	0207d693          	srli	a3,a5,0x20
    80003488:	00d70a23          	sb	a3,20(a4)
    8000348c:	0287d693          	srli	a3,a5,0x28
    80003490:	00d70aa3          	sb	a3,21(a4)
    80003494:	0307d693          	srli	a3,a5,0x30
    80003498:	00d70b23          	sb	a3,22(a4)
    8000349c:	0387d793          	srli	a5,a5,0x38
    800034a0:	00f70ba3          	sb	a5,23(a4)
            pNew->pNext = pCurrent->pNext;
    800034a4:	0004c783          	lbu	a5,0(s1)
    800034a8:	0014c683          	lbu	a3,1(s1)
    800034ac:	00869693          	slli	a3,a3,0x8
    800034b0:	00f6e7b3          	or	a5,a3,a5
    800034b4:	0024c683          	lbu	a3,2(s1)
    800034b8:	01069693          	slli	a3,a3,0x10
    800034bc:	00f6e6b3          	or	a3,a3,a5
    800034c0:	0034c783          	lbu	a5,3(s1)
    800034c4:	01879793          	slli	a5,a5,0x18
    800034c8:	00d7e6b3          	or	a3,a5,a3
    800034cc:	0044c783          	lbu	a5,4(s1)
    800034d0:	02079793          	slli	a5,a5,0x20
    800034d4:	00d7e7b3          	or	a5,a5,a3
    800034d8:	0054c683          	lbu	a3,5(s1)
    800034dc:	02869693          	slli	a3,a3,0x28
    800034e0:	00f6e7b3          	or	a5,a3,a5
    800034e4:	0064c683          	lbu	a3,6(s1)
    800034e8:	03069693          	slli	a3,a3,0x30
    800034ec:	00f6e6b3          	or	a3,a3,a5
    800034f0:	0074c783          	lbu	a5,7(s1)
    800034f4:	03879793          	slli	a5,a5,0x38
    800034f8:	00d7e7b3          	or	a5,a5,a3
    800034fc:	00d70023          	sb	a3,0(a4)
    80003500:	0087d693          	srli	a3,a5,0x8
    80003504:	00d700a3          	sb	a3,1(a4)
    80003508:	0107d693          	srli	a3,a5,0x10
    8000350c:	00d70123          	sb	a3,2(a4)
    80003510:	0187d69b          	srliw	a3,a5,0x18
    80003514:	00d701a3          	sb	a3,3(a4)
    80003518:	0207d693          	srli	a3,a5,0x20
    8000351c:	00d70223          	sb	a3,4(a4)
    80003520:	0287d693          	srli	a3,a5,0x28
    80003524:	00d702a3          	sb	a3,5(a4)
    80003528:	0307d693          	srli	a3,a5,0x30
    8000352c:	00d70323          	sb	a3,6(a4)
    80003530:	0387d793          	srli	a5,a5,0x38
    80003534:	00f703a3          	sb	a5,7(a4)
            pNew->pPrev = pCurrent->pPrev;
    80003538:	0084c783          	lbu	a5,8(s1)
    8000353c:	0094c683          	lbu	a3,9(s1)
    80003540:	00869693          	slli	a3,a3,0x8
    80003544:	00f6e7b3          	or	a5,a3,a5
    80003548:	00a4c683          	lbu	a3,10(s1)
    8000354c:	01069693          	slli	a3,a3,0x10
    80003550:	00f6e6b3          	or	a3,a3,a5
    80003554:	00b4c783          	lbu	a5,11(s1)
    80003558:	01879793          	slli	a5,a5,0x18
    8000355c:	00d7e6b3          	or	a3,a5,a3
    80003560:	00c4c783          	lbu	a5,12(s1)
    80003564:	02079793          	slli	a5,a5,0x20
    80003568:	00d7e7b3          	or	a5,a5,a3
    8000356c:	00d4c683          	lbu	a3,13(s1)
    80003570:	02869693          	slli	a3,a3,0x28
    80003574:	00f6e7b3          	or	a5,a3,a5
    80003578:	00e4c683          	lbu	a3,14(s1)
    8000357c:	03069693          	slli	a3,a3,0x30
    80003580:	00f6e6b3          	or	a3,a3,a5
    80003584:	00f4c783          	lbu	a5,15(s1)
    80003588:	03879793          	slli	a5,a5,0x38
    8000358c:	00d7e7b3          	or	a5,a5,a3
    80003590:	00d70423          	sb	a3,8(a4)
    80003594:	0087d693          	srli	a3,a5,0x8
    80003598:	00d704a3          	sb	a3,9(a4)
    8000359c:	0107d693          	srli	a3,a5,0x10
    800035a0:	00d70523          	sb	a3,10(a4)
    800035a4:	0187d69b          	srliw	a3,a5,0x18
    800035a8:	00d705a3          	sb	a3,11(a4)
    800035ac:	0207d693          	srli	a3,a5,0x20
    800035b0:	00d70623          	sb	a3,12(a4)
    800035b4:	0287d693          	srli	a3,a5,0x28
    800035b8:	00d706a3          	sb	a3,13(a4)
    800035bc:	0307d693          	srli	a3,a5,0x30
    800035c0:	00d70723          	sb	a3,14(a4)
    800035c4:	0387d793          	srli	a5,a5,0x38
    800035c8:	00f707a3          	sb	a5,15(a4)
            pNew->u32Magic = HEAP_BLOCK_MAGIC;
    800035cc:	fe100793          	li	a5,-31
    800035d0:	00f70c23          	sb	a5,24(a4)
    800035d4:	ffe00793          	li	a5,-2
    800035d8:	00f70ca3          	sb	a5,25(a4)
    800035dc:	00f00793          	li	a5,15
    800035e0:	00f70d23          	sb	a5,26(a4)
    800035e4:	01c00793          	li	a5,28
    800035e8:	00f70da3          	sb	a5,27(a4)
            if(pCurrent->pNext != 0){
    800035ec:	0004c783          	lbu	a5,0(s1)
    800035f0:	0014c683          	lbu	a3,1(s1)
    800035f4:	00869693          	slli	a3,a3,0x8
    800035f8:	00f6e6b3          	or	a3,a3,a5
    800035fc:	0024c783          	lbu	a5,2(s1)
    80003600:	01079793          	slli	a5,a5,0x10
    80003604:	00d7e6b3          	or	a3,a5,a3
    80003608:	0034c783          	lbu	a5,3(s1)
    8000360c:	01879793          	slli	a5,a5,0x18
    80003610:	00d7e7b3          	or	a5,a5,a3
    80003614:	0044c683          	lbu	a3,4(s1)
    80003618:	02069693          	slli	a3,a3,0x20
    8000361c:	00f6e7b3          	or	a5,a3,a5
    80003620:	0054c683          	lbu	a3,5(s1)
    80003624:	02869693          	slli	a3,a3,0x28
    80003628:	00f6e6b3          	or	a3,a3,a5
    8000362c:	0064c783          	lbu	a5,6(s1)
    80003630:	03079793          	slli	a5,a5,0x30
    80003634:	00d7e6b3          	or	a3,a5,a3
    80003638:	0074c783          	lbu	a5,7(s1)
    8000363c:	03879793          	slli	a5,a5,0x38
    80003640:	00d7e7b3          	or	a5,a5,a3
    80003644:	04078063          	beqz	a5,80003684 <_ZN11HeapManager12heapAllocateEm+0x37c>
                pCurrent->pNext->pPrev = pNew;
    80003648:	00e78423          	sb	a4,8(a5)
    8000364c:	00875693          	srli	a3,a4,0x8
    80003650:	00d784a3          	sb	a3,9(a5)
    80003654:	01075693          	srli	a3,a4,0x10
    80003658:	00d78523          	sb	a3,10(a5)
    8000365c:	0187569b          	srliw	a3,a4,0x18
    80003660:	00d785a3          	sb	a3,11(a5)
    80003664:	02075693          	srli	a3,a4,0x20
    80003668:	00d78623          	sb	a3,12(a5)
    8000366c:	02875693          	srli	a3,a4,0x28
    80003670:	00d786a3          	sb	a3,13(a5)
    80003674:	03075693          	srli	a3,a4,0x30
    80003678:	00d78723          	sb	a3,14(a5)
    8000367c:	03875693          	srli	a3,a4,0x38
    80003680:	00d787a3          	sb	a3,15(a5)
            if(pCurrent->pPrev != 0){
    80003684:	0084c783          	lbu	a5,8(s1)
    80003688:	0094c683          	lbu	a3,9(s1)
    8000368c:	00869693          	slli	a3,a3,0x8
    80003690:	00f6e6b3          	or	a3,a3,a5
    80003694:	00a4c783          	lbu	a5,10(s1)
    80003698:	01079793          	slli	a5,a5,0x10
    8000369c:	00d7e6b3          	or	a3,a5,a3
    800036a0:	00b4c783          	lbu	a5,11(s1)
    800036a4:	01879793          	slli	a5,a5,0x18
    800036a8:	00d7e7b3          	or	a5,a5,a3
    800036ac:	00c4c683          	lbu	a3,12(s1)
    800036b0:	02069693          	slli	a3,a3,0x20
    800036b4:	00f6e7b3          	or	a5,a3,a5
    800036b8:	00d4c683          	lbu	a3,13(s1)
    800036bc:	02869693          	slli	a3,a3,0x28
    800036c0:	00f6e6b3          	or	a3,a3,a5
    800036c4:	00e4c783          	lbu	a5,14(s1)
    800036c8:	03079793          	slli	a5,a5,0x30
    800036cc:	00d7e6b3          	or	a3,a5,a3
    800036d0:	00f4c783          	lbu	a5,15(s1)
    800036d4:	03879793          	slli	a5,a5,0x38
    800036d8:	00d7e7b3          	or	a5,a5,a3
    800036dc:	04078063          	beqz	a5,8000371c <_ZN11HeapManager12heapAllocateEm+0x414>
                pCurrent->pPrev->pNext = pNew;
    800036e0:	00e78023          	sb	a4,0(a5)
    800036e4:	00875693          	srli	a3,a4,0x8
    800036e8:	00d780a3          	sb	a3,1(a5)
    800036ec:	01075693          	srli	a3,a4,0x10
    800036f0:	00d78123          	sb	a3,2(a5)
    800036f4:	0187569b          	srliw	a3,a4,0x18
    800036f8:	00d781a3          	sb	a3,3(a5)
    800036fc:	02075693          	srli	a3,a4,0x20
    80003700:	00d78223          	sb	a3,4(a5)
    80003704:	02875693          	srli	a3,a4,0x28
    80003708:	00d782a3          	sb	a3,5(a5)
    8000370c:	03075693          	srli	a3,a4,0x30
    80003710:	00d78323          	sb	a3,6(a5)
    80003714:	03875693          	srli	a3,a4,0x38
    80003718:	00d783a3          	sb	a3,7(a5)
            if(pCurrent == m_pHead){
    8000371c:	0009b783          	ld	a5,0(s3)
    80003720:	04978463          	beq	a5,s1,80003768 <_ZN11HeapManager12heapAllocateEm+0x460>
            pCurrent->nSize = nSize;
    80003724:	01248823          	sb	s2,16(s1)
    80003728:	00895793          	srli	a5,s2,0x8
    8000372c:	00f488a3          	sb	a5,17(s1)
    80003730:	01095793          	srli	a5,s2,0x10
    80003734:	00f48923          	sb	a5,18(s1)
    80003738:	0189579b          	srliw	a5,s2,0x18
    8000373c:	00f489a3          	sb	a5,19(s1)
    80003740:	02095793          	srli	a5,s2,0x20
    80003744:	00f48a23          	sb	a5,20(s1)
    80003748:	02895793          	srli	a5,s2,0x28
    8000374c:	00f48aa3          	sb	a5,21(s1)
    80003750:	03095793          	srli	a5,s2,0x30
    80003754:	00f48b23          	sb	a5,22(s1)
    80003758:	03895913          	srli	s2,s2,0x38
    8000375c:	01248ba3          	sb	s2,23(s1)
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    80003760:	04060493          	addi	s1,a2,64
    80003764:	2800006f          	j	800039e4 <_ZN11HeapManager12heapAllocateEm+0x6dc>
                m_pHead = pNew;
    80003768:	00e9b023          	sd	a4,0(s3)
    8000376c:	fb9ff06f          	j	80003724 <_ZN11HeapManager12heapAllocateEm+0x41c>
            if(pCurrent->pPrev != 0){
    80003770:	0084c783          	lbu	a5,8(s1)
    80003774:	0094c703          	lbu	a4,9(s1)
    80003778:	00871713          	slli	a4,a4,0x8
    8000377c:	00f76733          	or	a4,a4,a5
    80003780:	00a4c783          	lbu	a5,10(s1)
    80003784:	01079793          	slli	a5,a5,0x10
    80003788:	00e7e733          	or	a4,a5,a4
    8000378c:	00b4c783          	lbu	a5,11(s1)
    80003790:	01879793          	slli	a5,a5,0x18
    80003794:	00e7e7b3          	or	a5,a5,a4
    80003798:	00c4c703          	lbu	a4,12(s1)
    8000379c:	02071713          	slli	a4,a4,0x20
    800037a0:	00f767b3          	or	a5,a4,a5
    800037a4:	00d4c703          	lbu	a4,13(s1)
    800037a8:	02871713          	slli	a4,a4,0x28
    800037ac:	00f76733          	or	a4,a4,a5
    800037b0:	00e4c783          	lbu	a5,14(s1)
    800037b4:	03079793          	slli	a5,a5,0x30
    800037b8:	00e7e733          	or	a4,a5,a4
    800037bc:	00f4c783          	lbu	a5,15(s1)
    800037c0:	03879793          	slli	a5,a5,0x38
    800037c4:	00e7e7b3          	or	a5,a5,a4
    800037c8:	08078c63          	beqz	a5,80003860 <_ZN11HeapManager12heapAllocateEm+0x558>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    800037cc:	0004c703          	lbu	a4,0(s1)
    800037d0:	0014c683          	lbu	a3,1(s1)
    800037d4:	00869693          	slli	a3,a3,0x8
    800037d8:	00e6e733          	or	a4,a3,a4
    800037dc:	0024c683          	lbu	a3,2(s1)
    800037e0:	01069693          	slli	a3,a3,0x10
    800037e4:	00e6e6b3          	or	a3,a3,a4
    800037e8:	0034c703          	lbu	a4,3(s1)
    800037ec:	01871713          	slli	a4,a4,0x18
    800037f0:	00d766b3          	or	a3,a4,a3
    800037f4:	0044c703          	lbu	a4,4(s1)
    800037f8:	02071713          	slli	a4,a4,0x20
    800037fc:	00d76733          	or	a4,a4,a3
    80003800:	0054c683          	lbu	a3,5(s1)
    80003804:	02869693          	slli	a3,a3,0x28
    80003808:	00e6e733          	or	a4,a3,a4
    8000380c:	0064c683          	lbu	a3,6(s1)
    80003810:	03069693          	slli	a3,a3,0x30
    80003814:	00e6e6b3          	or	a3,a3,a4
    80003818:	0074c703          	lbu	a4,7(s1)
    8000381c:	03871713          	slli	a4,a4,0x38
    80003820:	00d76733          	or	a4,a4,a3
    80003824:	00d78023          	sb	a3,0(a5)
    80003828:	00875693          	srli	a3,a4,0x8
    8000382c:	00d780a3          	sb	a3,1(a5)
    80003830:	01075693          	srli	a3,a4,0x10
    80003834:	00d78123          	sb	a3,2(a5)
    80003838:	0187569b          	srliw	a3,a4,0x18
    8000383c:	00d781a3          	sb	a3,3(a5)
    80003840:	02075693          	srli	a3,a4,0x20
    80003844:	00d78223          	sb	a3,4(a5)
    80003848:	02875693          	srli	a3,a4,0x28
    8000384c:	00d782a3          	sb	a3,5(a5)
    80003850:	03075693          	srli	a3,a4,0x30
    80003854:	00d78323          	sb	a3,6(a5)
    80003858:	03875713          	srli	a4,a4,0x38
    8000385c:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003860:	0004c783          	lbu	a5,0(s1)
    80003864:	0014c703          	lbu	a4,1(s1)
    80003868:	00871713          	slli	a4,a4,0x8
    8000386c:	00f76733          	or	a4,a4,a5
    80003870:	0024c783          	lbu	a5,2(s1)
    80003874:	01079793          	slli	a5,a5,0x10
    80003878:	00e7e733          	or	a4,a5,a4
    8000387c:	0034c783          	lbu	a5,3(s1)
    80003880:	01879793          	slli	a5,a5,0x18
    80003884:	00e7e7b3          	or	a5,a5,a4
    80003888:	0044c703          	lbu	a4,4(s1)
    8000388c:	02071713          	slli	a4,a4,0x20
    80003890:	00f767b3          	or	a5,a4,a5
    80003894:	0054c703          	lbu	a4,5(s1)
    80003898:	02871713          	slli	a4,a4,0x28
    8000389c:	00f76733          	or	a4,a4,a5
    800038a0:	0064c783          	lbu	a5,6(s1)
    800038a4:	03079793          	slli	a5,a5,0x30
    800038a8:	00e7e733          	or	a4,a5,a4
    800038ac:	0074c783          	lbu	a5,7(s1)
    800038b0:	03879793          	slli	a5,a5,0x38
    800038b4:	00e7e7b3          	or	a5,a5,a4
    800038b8:	08078c63          	beqz	a5,80003950 <_ZN11HeapManager12heapAllocateEm+0x648>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    800038bc:	0084c703          	lbu	a4,8(s1)
    800038c0:	0094c683          	lbu	a3,9(s1)
    800038c4:	00869693          	slli	a3,a3,0x8
    800038c8:	00e6e733          	or	a4,a3,a4
    800038cc:	00a4c683          	lbu	a3,10(s1)
    800038d0:	01069693          	slli	a3,a3,0x10
    800038d4:	00e6e6b3          	or	a3,a3,a4
    800038d8:	00b4c703          	lbu	a4,11(s1)
    800038dc:	01871713          	slli	a4,a4,0x18
    800038e0:	00d766b3          	or	a3,a4,a3
    800038e4:	00c4c703          	lbu	a4,12(s1)
    800038e8:	02071713          	slli	a4,a4,0x20
    800038ec:	00d76733          	or	a4,a4,a3
    800038f0:	00d4c683          	lbu	a3,13(s1)
    800038f4:	02869693          	slli	a3,a3,0x28
    800038f8:	00e6e733          	or	a4,a3,a4
    800038fc:	00e4c683          	lbu	a3,14(s1)
    80003900:	03069693          	slli	a3,a3,0x30
    80003904:	00e6e6b3          	or	a3,a3,a4
    80003908:	00f4c703          	lbu	a4,15(s1)
    8000390c:	03871713          	slli	a4,a4,0x38
    80003910:	00d76733          	or	a4,a4,a3
    80003914:	00d78423          	sb	a3,8(a5)
    80003918:	00875693          	srli	a3,a4,0x8
    8000391c:	00d784a3          	sb	a3,9(a5)
    80003920:	01075693          	srli	a3,a4,0x10
    80003924:	00d78523          	sb	a3,10(a5)
    80003928:	0187569b          	srliw	a3,a4,0x18
    8000392c:	00d785a3          	sb	a3,11(a5)
    80003930:	02075693          	srli	a3,a4,0x20
    80003934:	00d78623          	sb	a3,12(a5)
    80003938:	02875693          	srli	a3,a4,0x28
    8000393c:	00d786a3          	sb	a3,13(a5)
    80003940:	03075693          	srli	a3,a4,0x30
    80003944:	00d78723          	sb	a3,14(a5)
    80003948:	03875713          	srli	a4,a4,0x38
    8000394c:	00e787a3          	sb	a4,15(a5)
            if(pCurrent == m_pHead){
    80003950:	0009b783          	ld	a5,0(s3)
    80003954:	00978663          	beq	a5,s1,80003960 <_ZN11HeapManager12heapAllocateEm+0x658>
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    80003958:	04048493          	addi	s1,s1,64
    8000395c:	0880006f          	j	800039e4 <_ZN11HeapManager12heapAllocateEm+0x6dc>
                m_pHead = pCurrent->pNext;
    80003960:	0004c703          	lbu	a4,0(s1)
    80003964:	0014c783          	lbu	a5,1(s1)
    80003968:	00879793          	slli	a5,a5,0x8
    8000396c:	00e7e7b3          	or	a5,a5,a4
    80003970:	0024c703          	lbu	a4,2(s1)
    80003974:	01071713          	slli	a4,a4,0x10
    80003978:	00f76733          	or	a4,a4,a5
    8000397c:	0034c783          	lbu	a5,3(s1)
    80003980:	01879793          	slli	a5,a5,0x18
    80003984:	00e7e733          	or	a4,a5,a4
    80003988:	0044c783          	lbu	a5,4(s1)
    8000398c:	02079793          	slli	a5,a5,0x20
    80003990:	00e7e7b3          	or	a5,a5,a4
    80003994:	0054c703          	lbu	a4,5(s1)
    80003998:	02871713          	slli	a4,a4,0x28
    8000399c:	00f76733          	or	a4,a4,a5
    800039a0:	0064c783          	lbu	a5,6(s1)
    800039a4:	03079793          	slli	a5,a5,0x30
    800039a8:	00e7e733          	or	a4,a5,a4
    800039ac:	0074c783          	lbu	a5,7(s1)
    800039b0:	03879793          	slli	a5,a5,0x38
    800039b4:	00e7e7b3          	or	a5,a5,a4
    800039b8:	00f9b023          	sd	a5,0(s3)
    800039bc:	f9dff06f          	j	80003958 <_ZN11HeapManager12heapAllocateEm+0x650>
    }
    assert(0);
    800039c0:	00009697          	auipc	a3,0x9
    800039c4:	86068693          	addi	a3,a3,-1952 # 8000c220 <CONSOLE_STATUS+0x210>
    800039c8:	05900613          	li	a2,89
    800039cc:	00008597          	auipc	a1,0x8
    800039d0:	7a458593          	addi	a1,a1,1956 # 8000c170 <CONSOLE_STATUS+0x160>
    800039d4:	00009517          	auipc	a0,0x9
    800039d8:	87450513          	addi	a0,a0,-1932 # 8000c248 <CONSOLE_STATUS+0x238>
    800039dc:	00002097          	auipc	ra,0x2
    800039e0:	968080e7          	jalr	-1688(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    return 0;
}
    800039e4:	00048513          	mv	a0,s1
    800039e8:	02813083          	ld	ra,40(sp)
    800039ec:	02013403          	ld	s0,32(sp)
    800039f0:	01813483          	ld	s1,24(sp)
    800039f4:	01013903          	ld	s2,16(sp)
    800039f8:	00813983          	ld	s3,8(sp)
    800039fc:	03010113          	addi	sp,sp,48
    80003a00:	00008067          	ret

0000000080003a04 <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003a04:	fc010113          	addi	sp,sp,-64
    80003a08:	02113c23          	sd	ra,56(sp)
    80003a0c:	02813823          	sd	s0,48(sp)
    80003a10:	02913423          	sd	s1,40(sp)
    80003a14:	03213023          	sd	s2,32(sp)
    80003a18:	01313c23          	sd	s3,24(sp)
    80003a1c:	01413823          	sd	s4,16(sp)
    80003a20:	01513423          	sd	s5,8(sp)
    80003a24:	04010413          	addi	s0,sp,64
    80003a28:	00050a93          	mv	s5,a0
    80003a2c:	00058a13          	mv	s4,a1
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pAddress) - MEM_BLOCK_SIZE);
    80003a30:	fc058913          	addi	s2,a1,-64
    80003a34:	00090993          	mv	s3,s2
    
    #ifdef CHECK_CONDITIONS
        assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003a38:	01894783          	lbu	a5,24(s2)
    80003a3c:	01994703          	lbu	a4,25(s2)
    80003a40:	00871713          	slli	a4,a4,0x8
    80003a44:	00f76733          	or	a4,a4,a5
    80003a48:	01a94783          	lbu	a5,26(s2)
    80003a4c:	01079793          	slli	a5,a5,0x10
    80003a50:	00e7e733          	or	a4,a5,a4
    80003a54:	01b94783          	lbu	a5,27(s2)
    80003a58:	01879793          	slli	a5,a5,0x18
    80003a5c:	00e7e7b3          	or	a5,a5,a4
    80003a60:	0007879b          	sext.w	a5,a5
    80003a64:	1c100737          	lui	a4,0x1c100
    80003a68:	ee170713          	addi	a4,a4,-287 # 1c0ffee1 <_entry-0x63f0011f>
    80003a6c:	22e79e63          	bne	a5,a4,80003ca8 <_ZN11HeapManager8heapFreeEPv+0x2a4>
    #endif
    HeapFreeSectionHeader* pInsert = m_pHead;
    80003a70:	000ab483          	ld	s1,0(s5)

    if(pInsert == 0 || pInsert >= pAddress){
    80003a74:	00048463          	beqz	s1,80003a7c <_ZN11HeapManager8heapFreeEPv+0x78>
    80003a78:	2b44e863          	bltu	s1,s4,80003d28 <_ZN11HeapManager8heapFreeEPv+0x324>
        pFree->pNext = pInsert;
    80003a7c:	fc9a0023          	sb	s1,-64(s4)
    80003a80:	0084d793          	srli	a5,s1,0x8
    80003a84:	00f900a3          	sb	a5,1(s2)
    80003a88:	0104d793          	srli	a5,s1,0x10
    80003a8c:	00f90123          	sb	a5,2(s2)
    80003a90:	0184d79b          	srliw	a5,s1,0x18
    80003a94:	00f901a3          	sb	a5,3(s2)
    80003a98:	0204d793          	srli	a5,s1,0x20
    80003a9c:	00f90223          	sb	a5,4(s2)
    80003aa0:	0284d793          	srli	a5,s1,0x28
    80003aa4:	00f902a3          	sb	a5,5(s2)
    80003aa8:	0304d793          	srli	a5,s1,0x30
    80003aac:	00f90323          	sb	a5,6(s2)
    80003ab0:	0384d793          	srli	a5,s1,0x38
    80003ab4:	00f903a3          	sb	a5,7(s2)
        pInsert->pPrev = pFree;
    80003ab8:	01248423          	sb	s2,8(s1)
    80003abc:	00895793          	srli	a5,s2,0x8
    80003ac0:	00f484a3          	sb	a5,9(s1)
    80003ac4:	01095793          	srli	a5,s2,0x10
    80003ac8:	00f48523          	sb	a5,10(s1)
    80003acc:	0189579b          	srliw	a5,s2,0x18
    80003ad0:	00f485a3          	sb	a5,11(s1)
    80003ad4:	02095793          	srli	a5,s2,0x20
    80003ad8:	00f48623          	sb	a5,12(s1)
    80003adc:	02895793          	srli	a5,s2,0x28
    80003ae0:	00f486a3          	sb	a5,13(s1)
    80003ae4:	03095793          	srli	a5,s2,0x30
    80003ae8:	00f48723          	sb	a5,14(s1)
    80003aec:	03895793          	srli	a5,s2,0x38
    80003af0:	00f487a3          	sb	a5,15(s1)
        m_pHead = pFree;
    80003af4:	012ab023          	sd	s2,0(s5)
        }
        pInsert->pNext = pFree;
    }

    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uint64>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uint64>(pFree)){
    80003af8:	00894783          	lbu	a5,8(s2)
    80003afc:	00994703          	lbu	a4,9(s2)
    80003b00:	00871713          	slli	a4,a4,0x8
    80003b04:	00f76733          	or	a4,a4,a5
    80003b08:	00a94783          	lbu	a5,10(s2)
    80003b0c:	01079793          	slli	a5,a5,0x10
    80003b10:	00e7e733          	or	a4,a5,a4
    80003b14:	00b94783          	lbu	a5,11(s2)
    80003b18:	01879793          	slli	a5,a5,0x18
    80003b1c:	00e7e7b3          	or	a5,a5,a4
    80003b20:	00c94703          	lbu	a4,12(s2)
    80003b24:	02071713          	slli	a4,a4,0x20
    80003b28:	00f767b3          	or	a5,a4,a5
    80003b2c:	00d94703          	lbu	a4,13(s2)
    80003b30:	02871713          	slli	a4,a4,0x28
    80003b34:	00f76733          	or	a4,a4,a5
    80003b38:	00e94783          	lbu	a5,14(s2)
    80003b3c:	03079793          	slli	a5,a5,0x30
    80003b40:	00e7e733          	or	a4,a5,a4
    80003b44:	00f94783          	lbu	a5,15(s2)
    80003b48:	03879793          	slli	a5,a5,0x38
    80003b4c:	00e7e7b3          	or	a5,a5,a4
    80003b50:	06078663          	beqz	a5,80003bbc <_ZN11HeapManager8heapFreeEPv+0x1b8>
    80003b54:	0107c703          	lbu	a4,16(a5)
    80003b58:	0117c683          	lbu	a3,17(a5)
    80003b5c:	00869693          	slli	a3,a3,0x8
    80003b60:	00e6e6b3          	or	a3,a3,a4
    80003b64:	0127c703          	lbu	a4,18(a5)
    80003b68:	01071713          	slli	a4,a4,0x10
    80003b6c:	00d766b3          	or	a3,a4,a3
    80003b70:	0137c703          	lbu	a4,19(a5)
    80003b74:	01871713          	slli	a4,a4,0x18
    80003b78:	00d76733          	or	a4,a4,a3
    80003b7c:	0147c683          	lbu	a3,20(a5)
    80003b80:	02069693          	slli	a3,a3,0x20
    80003b84:	00e6e733          	or	a4,a3,a4
    80003b88:	0157c683          	lbu	a3,21(a5)
    80003b8c:	02869693          	slli	a3,a3,0x28
    80003b90:	00e6e6b3          	or	a3,a3,a4
    80003b94:	0167c703          	lbu	a4,22(a5)
    80003b98:	03071713          	slli	a4,a4,0x30
    80003b9c:	00d766b3          	or	a3,a4,a3
    80003ba0:	0177c703          	lbu	a4,23(a5)
    80003ba4:	03871713          	slli	a4,a4,0x38
    80003ba8:	00d76733          	or	a4,a4,a3
    80003bac:	00170693          	addi	a3,a4,1
    80003bb0:	00669693          	slli	a3,a3,0x6
    80003bb4:	00d786b3          	add	a3,a5,a3
    80003bb8:	38d90063          	beq	s2,a3,80003f38 <_ZN11HeapManager8heapFreeEPv+0x534>
            pFree->pNext->pPrev = pFree->pPrev;
        }
        pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uint64>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uint64>(pFree->pNext)){
    80003bbc:	0009c783          	lbu	a5,0(s3)
    80003bc0:	0019c703          	lbu	a4,1(s3)
    80003bc4:	00871713          	slli	a4,a4,0x8
    80003bc8:	00f76733          	or	a4,a4,a5
    80003bcc:	0029c783          	lbu	a5,2(s3)
    80003bd0:	01079793          	slli	a5,a5,0x10
    80003bd4:	00e7e733          	or	a4,a5,a4
    80003bd8:	0039c783          	lbu	a5,3(s3)
    80003bdc:	01879793          	slli	a5,a5,0x18
    80003be0:	00e7e7b3          	or	a5,a5,a4
    80003be4:	0049c703          	lbu	a4,4(s3)
    80003be8:	02071713          	slli	a4,a4,0x20
    80003bec:	00f767b3          	or	a5,a4,a5
    80003bf0:	0059c703          	lbu	a4,5(s3)
    80003bf4:	02871713          	slli	a4,a4,0x28
    80003bf8:	00f76733          	or	a4,a4,a5
    80003bfc:	0069c783          	lbu	a5,6(s3)
    80003c00:	03079793          	slli	a5,a5,0x30
    80003c04:	00e7e733          	or	a4,a5,a4
    80003c08:	0079c783          	lbu	a5,7(s3)
    80003c0c:	03879793          	slli	a5,a5,0x38
    80003c10:	00e7e7b3          	or	a5,a5,a4
    80003c14:	06078663          	beqz	a5,80003c80 <_ZN11HeapManager8heapFreeEPv+0x27c>
    80003c18:	0109c703          	lbu	a4,16(s3)
    80003c1c:	0119c683          	lbu	a3,17(s3)
    80003c20:	00869693          	slli	a3,a3,0x8
    80003c24:	00e6e6b3          	or	a3,a3,a4
    80003c28:	0129c703          	lbu	a4,18(s3)
    80003c2c:	01071713          	slli	a4,a4,0x10
    80003c30:	00d766b3          	or	a3,a4,a3
    80003c34:	0139c703          	lbu	a4,19(s3)
    80003c38:	01871713          	slli	a4,a4,0x18
    80003c3c:	00d76733          	or	a4,a4,a3
    80003c40:	0149c683          	lbu	a3,20(s3)
    80003c44:	02069693          	slli	a3,a3,0x20
    80003c48:	00e6e733          	or	a4,a3,a4
    80003c4c:	0159c683          	lbu	a3,21(s3)
    80003c50:	02869693          	slli	a3,a3,0x28
    80003c54:	00e6e6b3          	or	a3,a3,a4
    80003c58:	0169c703          	lbu	a4,22(s3)
    80003c5c:	03071713          	slli	a4,a4,0x30
    80003c60:	00d766b3          	or	a3,a4,a3
    80003c64:	0179c703          	lbu	a4,23(s3)
    80003c68:	03871713          	slli	a4,a4,0x38
    80003c6c:	00d76733          	or	a4,a4,a3
    80003c70:	00170693          	addi	a3,a4,1
    80003c74:	00669693          	slli	a3,a3,0x6
    80003c78:	00d986b3          	add	a3,s3,a3
    80003c7c:	58f68863          	beq	a3,a5,8000420c <_ZN11HeapManager8heapFreeEPv+0x808>
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree;
        }
    }
    return 0;
}
    80003c80:	00000513          	li	a0,0
    80003c84:	03813083          	ld	ra,56(sp)
    80003c88:	03013403          	ld	s0,48(sp)
    80003c8c:	02813483          	ld	s1,40(sp)
    80003c90:	02013903          	ld	s2,32(sp)
    80003c94:	01813983          	ld	s3,24(sp)
    80003c98:	01013a03          	ld	s4,16(sp)
    80003c9c:	00813a83          	ld	s5,8(sp)
    80003ca0:	04010113          	addi	sp,sp,64
    80003ca4:	00008067          	ret
        assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003ca8:	00008697          	auipc	a3,0x8
    80003cac:	5a868693          	addi	a3,a3,1448 # 8000c250 <CONSOLE_STATUS+0x240>
    80003cb0:	06100613          	li	a2,97
    80003cb4:	00008597          	auipc	a1,0x8
    80003cb8:	4bc58593          	addi	a1,a1,1212 # 8000c170 <CONSOLE_STATUS+0x160>
    80003cbc:	00008517          	auipc	a0,0x8
    80003cc0:	5bc50513          	addi	a0,a0,1468 # 8000c278 <CONSOLE_STATUS+0x268>
    80003cc4:	00001097          	auipc	ra,0x1
    80003cc8:	680080e7          	jalr	1664(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    80003ccc:	da5ff06f          	j	80003a70 <_ZN11HeapManager8heapFreeEPv+0x6c>
            pInsert = pInsert->pNext;
    80003cd0:	0004c703          	lbu	a4,0(s1)
    80003cd4:	0014c783          	lbu	a5,1(s1)
    80003cd8:	00879793          	slli	a5,a5,0x8
    80003cdc:	00e7e733          	or	a4,a5,a4
    80003ce0:	0024c783          	lbu	a5,2(s1)
    80003ce4:	01079793          	slli	a5,a5,0x10
    80003ce8:	00e7e7b3          	or	a5,a5,a4
    80003cec:	0034c703          	lbu	a4,3(s1)
    80003cf0:	01871713          	slli	a4,a4,0x18
    80003cf4:	00f767b3          	or	a5,a4,a5
    80003cf8:	0044c703          	lbu	a4,4(s1)
    80003cfc:	02071713          	slli	a4,a4,0x20
    80003d00:	00f76733          	or	a4,a4,a5
    80003d04:	0054c783          	lbu	a5,5(s1)
    80003d08:	02879793          	slli	a5,a5,0x28
    80003d0c:	00e7e733          	or	a4,a5,a4
    80003d10:	0064c783          	lbu	a5,6(s1)
    80003d14:	03079793          	slli	a5,a5,0x30
    80003d18:	00e7e7b3          	or	a5,a5,a4
    80003d1c:	0074c483          	lbu	s1,7(s1)
    80003d20:	03849493          	slli	s1,s1,0x38
    80003d24:	00f4e4b3          	or	s1,s1,a5
        while(pInsert->pNext != 0 && pInsert->pNext < pAddress){
    80003d28:	0004c783          	lbu	a5,0(s1)
    80003d2c:	0014c703          	lbu	a4,1(s1)
    80003d30:	00871713          	slli	a4,a4,0x8
    80003d34:	00f76733          	or	a4,a4,a5
    80003d38:	0024c783          	lbu	a5,2(s1)
    80003d3c:	01079793          	slli	a5,a5,0x10
    80003d40:	00e7e733          	or	a4,a5,a4
    80003d44:	0034c783          	lbu	a5,3(s1)
    80003d48:	01879793          	slli	a5,a5,0x18
    80003d4c:	00e7e7b3          	or	a5,a5,a4
    80003d50:	0044c703          	lbu	a4,4(s1)
    80003d54:	02071713          	slli	a4,a4,0x20
    80003d58:	00f767b3          	or	a5,a4,a5
    80003d5c:	0054c703          	lbu	a4,5(s1)
    80003d60:	02871713          	slli	a4,a4,0x28
    80003d64:	00f76733          	or	a4,a4,a5
    80003d68:	0064c783          	lbu	a5,6(s1)
    80003d6c:	03079793          	slli	a5,a5,0x30
    80003d70:	00e7e733          	or	a4,a5,a4
    80003d74:	0074c783          	lbu	a5,7(s1)
    80003d78:	03879793          	slli	a5,a5,0x38
    80003d7c:	00e7e7b3          	or	a5,a5,a4
    80003d80:	06078463          	beqz	a5,80003de8 <_ZN11HeapManager8heapFreeEPv+0x3e4>
    80003d84:	0747f263          	bgeu	a5,s4,80003de8 <_ZN11HeapManager8heapFreeEPv+0x3e4>
                assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    80003d88:	0184c783          	lbu	a5,24(s1)
    80003d8c:	0194c703          	lbu	a4,25(s1)
    80003d90:	00871713          	slli	a4,a4,0x8
    80003d94:	00f76733          	or	a4,a4,a5
    80003d98:	01a4c783          	lbu	a5,26(s1)
    80003d9c:	01079793          	slli	a5,a5,0x10
    80003da0:	00e7e733          	or	a4,a5,a4
    80003da4:	01b4c783          	lbu	a5,27(s1)
    80003da8:	01879793          	slli	a5,a5,0x18
    80003dac:	00e7e7b3          	or	a5,a5,a4
    80003db0:	0007879b          	sext.w	a5,a5
    80003db4:	1c100737          	lui	a4,0x1c100
    80003db8:	ee170713          	addi	a4,a4,-287 # 1c0ffee1 <_entry-0x63f0011f>
    80003dbc:	f0e78ae3          	beq	a5,a4,80003cd0 <_ZN11HeapManager8heapFreeEPv+0x2cc>
    80003dc0:	00008697          	auipc	a3,0x8
    80003dc4:	49068693          	addi	a3,a3,1168 # 8000c250 <CONSOLE_STATUS+0x240>
    80003dc8:	06c00613          	li	a2,108
    80003dcc:	00008597          	auipc	a1,0x8
    80003dd0:	3a458593          	addi	a1,a1,932 # 8000c170 <CONSOLE_STATUS+0x160>
    80003dd4:	00008517          	auipc	a0,0x8
    80003dd8:	4cc50513          	addi	a0,a0,1228 # 8000c2a0 <CONSOLE_STATUS+0x290>
    80003ddc:	00001097          	auipc	ra,0x1
    80003de0:	568080e7          	jalr	1384(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    80003de4:	eedff06f          	j	80003cd0 <_ZN11HeapManager8heapFreeEPv+0x2cc>
        pFree->pNext = pInsert->pNext;
    80003de8:	fcfa0023          	sb	a5,-64(s4)
    80003dec:	0087d713          	srli	a4,a5,0x8
    80003df0:	00e900a3          	sb	a4,1(s2)
    80003df4:	0107d713          	srli	a4,a5,0x10
    80003df8:	00e90123          	sb	a4,2(s2)
    80003dfc:	0187d71b          	srliw	a4,a5,0x18
    80003e00:	00e901a3          	sb	a4,3(s2)
    80003e04:	0207d713          	srli	a4,a5,0x20
    80003e08:	00e90223          	sb	a4,4(s2)
    80003e0c:	0287d713          	srli	a4,a5,0x28
    80003e10:	00e902a3          	sb	a4,5(s2)
    80003e14:	0307d713          	srli	a4,a5,0x30
    80003e18:	00e90323          	sb	a4,6(s2)
    80003e1c:	0387d793          	srli	a5,a5,0x38
    80003e20:	00f903a3          	sb	a5,7(s2)
        pFree->pPrev = pInsert;
    80003e24:	00990423          	sb	s1,8(s2)
    80003e28:	0084d793          	srli	a5,s1,0x8
    80003e2c:	00f904a3          	sb	a5,9(s2)
    80003e30:	0104d793          	srli	a5,s1,0x10
    80003e34:	00f90523          	sb	a5,10(s2)
    80003e38:	0184d79b          	srliw	a5,s1,0x18
    80003e3c:	00f905a3          	sb	a5,11(s2)
    80003e40:	0204d793          	srli	a5,s1,0x20
    80003e44:	00f90623          	sb	a5,12(s2)
    80003e48:	0284d793          	srli	a5,s1,0x28
    80003e4c:	00f906a3          	sb	a5,13(s2)
    80003e50:	0304d793          	srli	a5,s1,0x30
    80003e54:	00f90723          	sb	a5,14(s2)
    80003e58:	0384d793          	srli	a5,s1,0x38
    80003e5c:	00f907a3          	sb	a5,15(s2)
        if(pInsert->pNext != 0){
    80003e60:	0004c783          	lbu	a5,0(s1)
    80003e64:	0014c703          	lbu	a4,1(s1)
    80003e68:	00871713          	slli	a4,a4,0x8
    80003e6c:	00f76733          	or	a4,a4,a5
    80003e70:	0024c783          	lbu	a5,2(s1)
    80003e74:	01079793          	slli	a5,a5,0x10
    80003e78:	00e7e733          	or	a4,a5,a4
    80003e7c:	0034c783          	lbu	a5,3(s1)
    80003e80:	01879793          	slli	a5,a5,0x18
    80003e84:	00e7e7b3          	or	a5,a5,a4
    80003e88:	0044c703          	lbu	a4,4(s1)
    80003e8c:	02071713          	slli	a4,a4,0x20
    80003e90:	00f767b3          	or	a5,a4,a5
    80003e94:	0054c703          	lbu	a4,5(s1)
    80003e98:	02871713          	slli	a4,a4,0x28
    80003e9c:	00f76733          	or	a4,a4,a5
    80003ea0:	0064c783          	lbu	a5,6(s1)
    80003ea4:	03079793          	slli	a5,a5,0x30
    80003ea8:	00e7e733          	or	a4,a5,a4
    80003eac:	0074c783          	lbu	a5,7(s1)
    80003eb0:	03879793          	slli	a5,a5,0x38
    80003eb4:	00e7e7b3          	or	a5,a5,a4
    80003eb8:	04078063          	beqz	a5,80003ef8 <_ZN11HeapManager8heapFreeEPv+0x4f4>
            pInsert->pNext->pPrev = pFree;
    80003ebc:	01278423          	sb	s2,8(a5)
    80003ec0:	00895713          	srli	a4,s2,0x8
    80003ec4:	00e784a3          	sb	a4,9(a5)
    80003ec8:	01095713          	srli	a4,s2,0x10
    80003ecc:	00e78523          	sb	a4,10(a5)
    80003ed0:	0189571b          	srliw	a4,s2,0x18
    80003ed4:	00e785a3          	sb	a4,11(a5)
    80003ed8:	02095713          	srli	a4,s2,0x20
    80003edc:	00e78623          	sb	a4,12(a5)
    80003ee0:	02895713          	srli	a4,s2,0x28
    80003ee4:	00e786a3          	sb	a4,13(a5)
    80003ee8:	03095713          	srli	a4,s2,0x30
    80003eec:	00e78723          	sb	a4,14(a5)
    80003ef0:	03895713          	srli	a4,s2,0x38
    80003ef4:	00e787a3          	sb	a4,15(a5)
        pInsert->pNext = pFree;
    80003ef8:	01248023          	sb	s2,0(s1)
    80003efc:	00895793          	srli	a5,s2,0x8
    80003f00:	00f480a3          	sb	a5,1(s1)
    80003f04:	01095793          	srli	a5,s2,0x10
    80003f08:	00f48123          	sb	a5,2(s1)
    80003f0c:	0189579b          	srliw	a5,s2,0x18
    80003f10:	00f481a3          	sb	a5,3(s1)
    80003f14:	02095793          	srli	a5,s2,0x20
    80003f18:	00f48223          	sb	a5,4(s1)
    80003f1c:	02895793          	srli	a5,s2,0x28
    80003f20:	00f482a3          	sb	a5,5(s1)
    80003f24:	03095793          	srli	a5,s2,0x30
    80003f28:	00f48323          	sb	a5,6(s1)
    80003f2c:	03895793          	srli	a5,s2,0x38
    80003f30:	00f483a3          	sb	a5,7(s1)
    80003f34:	bc5ff06f          	j	80003af8 <_ZN11HeapManager8heapFreeEPv+0xf4>
        pFree->pPrev->nSize += pFree->nSize + 1;
    80003f38:	01094683          	lbu	a3,16(s2)
    80003f3c:	01194603          	lbu	a2,17(s2)
    80003f40:	00861613          	slli	a2,a2,0x8
    80003f44:	00d66633          	or	a2,a2,a3
    80003f48:	01294683          	lbu	a3,18(s2)
    80003f4c:	01069693          	slli	a3,a3,0x10
    80003f50:	00c6e633          	or	a2,a3,a2
    80003f54:	01394683          	lbu	a3,19(s2)
    80003f58:	01869693          	slli	a3,a3,0x18
    80003f5c:	00c6e6b3          	or	a3,a3,a2
    80003f60:	01494603          	lbu	a2,20(s2)
    80003f64:	02061613          	slli	a2,a2,0x20
    80003f68:	00d666b3          	or	a3,a2,a3
    80003f6c:	01594603          	lbu	a2,21(s2)
    80003f70:	02861613          	slli	a2,a2,0x28
    80003f74:	00d66633          	or	a2,a2,a3
    80003f78:	01694683          	lbu	a3,22(s2)
    80003f7c:	03069693          	slli	a3,a3,0x30
    80003f80:	00c6e633          	or	a2,a3,a2
    80003f84:	01794683          	lbu	a3,23(s2)
    80003f88:	03869693          	slli	a3,a3,0x38
    80003f8c:	00c6e6b3          	or	a3,a3,a2
    80003f90:	00d70733          	add	a4,a4,a3
    80003f94:	00170713          	addi	a4,a4,1
    80003f98:	00e78823          	sb	a4,16(a5)
    80003f9c:	00875693          	srli	a3,a4,0x8
    80003fa0:	00d788a3          	sb	a3,17(a5)
    80003fa4:	01075693          	srli	a3,a4,0x10
    80003fa8:	00d78923          	sb	a3,18(a5)
    80003fac:	0187569b          	srliw	a3,a4,0x18
    80003fb0:	00d789a3          	sb	a3,19(a5)
    80003fb4:	02075693          	srli	a3,a4,0x20
    80003fb8:	00d78a23          	sb	a3,20(a5)
    80003fbc:	02875693          	srli	a3,a4,0x28
    80003fc0:	00d78aa3          	sb	a3,21(a5)
    80003fc4:	03075693          	srli	a3,a4,0x30
    80003fc8:	00d78b23          	sb	a3,22(a5)
    80003fcc:	03875713          	srli	a4,a4,0x38
    80003fd0:	00e78ba3          	sb	a4,23(a5)
        pFree->pPrev->pNext = pFree->pNext;
    80003fd4:	00894703          	lbu	a4,8(s2)
    80003fd8:	00994783          	lbu	a5,9(s2)
    80003fdc:	00879793          	slli	a5,a5,0x8
    80003fe0:	00e7e7b3          	or	a5,a5,a4
    80003fe4:	00a94703          	lbu	a4,10(s2)
    80003fe8:	01071713          	slli	a4,a4,0x10
    80003fec:	00f767b3          	or	a5,a4,a5
    80003ff0:	00b94703          	lbu	a4,11(s2)
    80003ff4:	01871713          	slli	a4,a4,0x18
    80003ff8:	00f76733          	or	a4,a4,a5
    80003ffc:	00c94783          	lbu	a5,12(s2)
    80004000:	02079793          	slli	a5,a5,0x20
    80004004:	00e7e733          	or	a4,a5,a4
    80004008:	00d94783          	lbu	a5,13(s2)
    8000400c:	02879793          	slli	a5,a5,0x28
    80004010:	00e7e7b3          	or	a5,a5,a4
    80004014:	00e94703          	lbu	a4,14(s2)
    80004018:	03071713          	slli	a4,a4,0x30
    8000401c:	00f767b3          	or	a5,a4,a5
    80004020:	00f94703          	lbu	a4,15(s2)
    80004024:	03871713          	slli	a4,a4,0x38
    80004028:	00f76733          	or	a4,a4,a5
    8000402c:	fc0a4783          	lbu	a5,-64(s4)
    80004030:	00194683          	lbu	a3,1(s2)
    80004034:	00869693          	slli	a3,a3,0x8
    80004038:	00f6e7b3          	or	a5,a3,a5
    8000403c:	00294683          	lbu	a3,2(s2)
    80004040:	01069693          	slli	a3,a3,0x10
    80004044:	00f6e6b3          	or	a3,a3,a5
    80004048:	00394783          	lbu	a5,3(s2)
    8000404c:	01879793          	slli	a5,a5,0x18
    80004050:	00d7e6b3          	or	a3,a5,a3
    80004054:	00494783          	lbu	a5,4(s2)
    80004058:	02079793          	slli	a5,a5,0x20
    8000405c:	00d7e7b3          	or	a5,a5,a3
    80004060:	00594683          	lbu	a3,5(s2)
    80004064:	02869693          	slli	a3,a3,0x28
    80004068:	00f6e7b3          	or	a5,a3,a5
    8000406c:	00694683          	lbu	a3,6(s2)
    80004070:	03069693          	slli	a3,a3,0x30
    80004074:	00f6e6b3          	or	a3,a3,a5
    80004078:	00794783          	lbu	a5,7(s2)
    8000407c:	03879793          	slli	a5,a5,0x38
    80004080:	00d7e7b3          	or	a5,a5,a3
    80004084:	00d70023          	sb	a3,0(a4)
    80004088:	0087d693          	srli	a3,a5,0x8
    8000408c:	00d700a3          	sb	a3,1(a4)
    80004090:	0107d693          	srli	a3,a5,0x10
    80004094:	00d70123          	sb	a3,2(a4)
    80004098:	0187d69b          	srliw	a3,a5,0x18
    8000409c:	00d701a3          	sb	a3,3(a4)
    800040a0:	0207d693          	srli	a3,a5,0x20
    800040a4:	00d70223          	sb	a3,4(a4)
    800040a8:	0287d693          	srli	a3,a5,0x28
    800040ac:	00d702a3          	sb	a3,5(a4)
    800040b0:	0307d693          	srli	a3,a5,0x30
    800040b4:	00d70323          	sb	a3,6(a4)
    800040b8:	0387d793          	srli	a5,a5,0x38
    800040bc:	00f703a3          	sb	a5,7(a4)
        if(pFree->pNext != 0){
    800040c0:	fc0a4783          	lbu	a5,-64(s4)
    800040c4:	00194703          	lbu	a4,1(s2)
    800040c8:	00871713          	slli	a4,a4,0x8
    800040cc:	00f76733          	or	a4,a4,a5
    800040d0:	00294783          	lbu	a5,2(s2)
    800040d4:	01079793          	slli	a5,a5,0x10
    800040d8:	00e7e733          	or	a4,a5,a4
    800040dc:	00394783          	lbu	a5,3(s2)
    800040e0:	01879793          	slli	a5,a5,0x18
    800040e4:	00e7e7b3          	or	a5,a5,a4
    800040e8:	00494703          	lbu	a4,4(s2)
    800040ec:	02071713          	slli	a4,a4,0x20
    800040f0:	00f767b3          	or	a5,a4,a5
    800040f4:	00594703          	lbu	a4,5(s2)
    800040f8:	02871713          	slli	a4,a4,0x28
    800040fc:	00f76733          	or	a4,a4,a5
    80004100:	00694783          	lbu	a5,6(s2)
    80004104:	03079793          	slli	a5,a5,0x30
    80004108:	00e7e733          	or	a4,a5,a4
    8000410c:	00794783          	lbu	a5,7(s2)
    80004110:	03879793          	slli	a5,a5,0x38
    80004114:	00e7e7b3          	or	a5,a5,a4
    80004118:	08078c63          	beqz	a5,800041b0 <_ZN11HeapManager8heapFreeEPv+0x7ac>
            pFree->pNext->pPrev = pFree->pPrev;
    8000411c:	00894703          	lbu	a4,8(s2)
    80004120:	00994683          	lbu	a3,9(s2)
    80004124:	00869693          	slli	a3,a3,0x8
    80004128:	00e6e733          	or	a4,a3,a4
    8000412c:	00a94683          	lbu	a3,10(s2)
    80004130:	01069693          	slli	a3,a3,0x10
    80004134:	00e6e6b3          	or	a3,a3,a4
    80004138:	00b94703          	lbu	a4,11(s2)
    8000413c:	01871713          	slli	a4,a4,0x18
    80004140:	00d766b3          	or	a3,a4,a3
    80004144:	00c94703          	lbu	a4,12(s2)
    80004148:	02071713          	slli	a4,a4,0x20
    8000414c:	00d76733          	or	a4,a4,a3
    80004150:	00d94683          	lbu	a3,13(s2)
    80004154:	02869693          	slli	a3,a3,0x28
    80004158:	00e6e733          	or	a4,a3,a4
    8000415c:	00e94683          	lbu	a3,14(s2)
    80004160:	03069693          	slli	a3,a3,0x30
    80004164:	00e6e6b3          	or	a3,a3,a4
    80004168:	00f94703          	lbu	a4,15(s2)
    8000416c:	03871713          	slli	a4,a4,0x38
    80004170:	00d76733          	or	a4,a4,a3
    80004174:	00d78423          	sb	a3,8(a5)
    80004178:	00875693          	srli	a3,a4,0x8
    8000417c:	00d784a3          	sb	a3,9(a5)
    80004180:	01075693          	srli	a3,a4,0x10
    80004184:	00d78523          	sb	a3,10(a5)
    80004188:	0187569b          	srliw	a3,a4,0x18
    8000418c:	00d785a3          	sb	a3,11(a5)
    80004190:	02075693          	srli	a3,a4,0x20
    80004194:	00d78623          	sb	a3,12(a5)
    80004198:	02875693          	srli	a3,a4,0x28
    8000419c:	00d786a3          	sb	a3,13(a5)
    800041a0:	03075693          	srli	a3,a4,0x30
    800041a4:	00d78723          	sb	a3,14(a5)
    800041a8:	03875713          	srli	a4,a4,0x38
    800041ac:	00e787a3          	sb	a4,15(a5)
        pFree = pFree->pPrev;
    800041b0:	00894983          	lbu	s3,8(s2)
    800041b4:	00994783          	lbu	a5,9(s2)
    800041b8:	00879793          	slli	a5,a5,0x8
    800041bc:	0137e7b3          	or	a5,a5,s3
    800041c0:	00a94983          	lbu	s3,10(s2)
    800041c4:	01099993          	slli	s3,s3,0x10
    800041c8:	00f9e7b3          	or	a5,s3,a5
    800041cc:	00b94983          	lbu	s3,11(s2)
    800041d0:	01899993          	slli	s3,s3,0x18
    800041d4:	00f9e9b3          	or	s3,s3,a5
    800041d8:	00c94783          	lbu	a5,12(s2)
    800041dc:	02079793          	slli	a5,a5,0x20
    800041e0:	0137e9b3          	or	s3,a5,s3
    800041e4:	00d94783          	lbu	a5,13(s2)
    800041e8:	02879793          	slli	a5,a5,0x28
    800041ec:	0137e7b3          	or	a5,a5,s3
    800041f0:	00e94983          	lbu	s3,14(s2)
    800041f4:	03099993          	slli	s3,s3,0x30
    800041f8:	00f9e7b3          	or	a5,s3,a5
    800041fc:	00f94983          	lbu	s3,15(s2)
    80004200:	03899993          	slli	s3,s3,0x38
    80004204:	00f9e9b3          	or	s3,s3,a5
    80004208:	9b5ff06f          	j	80003bbc <_ZN11HeapManager8heapFreeEPv+0x1b8>
        pFree->nSize += pFree->pNext->nSize + 1;
    8000420c:	0107c683          	lbu	a3,16(a5)
    80004210:	0117c603          	lbu	a2,17(a5)
    80004214:	00861613          	slli	a2,a2,0x8
    80004218:	00d66633          	or	a2,a2,a3
    8000421c:	0127c683          	lbu	a3,18(a5)
    80004220:	01069693          	slli	a3,a3,0x10
    80004224:	00c6e633          	or	a2,a3,a2
    80004228:	0137c683          	lbu	a3,19(a5)
    8000422c:	01869693          	slli	a3,a3,0x18
    80004230:	00c6e6b3          	or	a3,a3,a2
    80004234:	0147c603          	lbu	a2,20(a5)
    80004238:	02061613          	slli	a2,a2,0x20
    8000423c:	00d666b3          	or	a3,a2,a3
    80004240:	0157c603          	lbu	a2,21(a5)
    80004244:	02861613          	slli	a2,a2,0x28
    80004248:	00d66633          	or	a2,a2,a3
    8000424c:	0167c683          	lbu	a3,22(a5)
    80004250:	03069693          	slli	a3,a3,0x30
    80004254:	00c6e633          	or	a2,a3,a2
    80004258:	0177c683          	lbu	a3,23(a5)
    8000425c:	03869693          	slli	a3,a3,0x38
    80004260:	00c6e6b3          	or	a3,a3,a2
    80004264:	00d70733          	add	a4,a4,a3
    80004268:	00170713          	addi	a4,a4,1
    8000426c:	00e98823          	sb	a4,16(s3)
    80004270:	00875693          	srli	a3,a4,0x8
    80004274:	00d988a3          	sb	a3,17(s3)
    80004278:	01075693          	srli	a3,a4,0x10
    8000427c:	00d98923          	sb	a3,18(s3)
    80004280:	0187569b          	srliw	a3,a4,0x18
    80004284:	00d989a3          	sb	a3,19(s3)
    80004288:	02075693          	srli	a3,a4,0x20
    8000428c:	00d98a23          	sb	a3,20(s3)
    80004290:	02875693          	srli	a3,a4,0x28
    80004294:	00d98aa3          	sb	a3,21(s3)
    80004298:	03075693          	srli	a3,a4,0x30
    8000429c:	00d98b23          	sb	a3,22(s3)
    800042a0:	03875713          	srli	a4,a4,0x38
    800042a4:	00e98ba3          	sb	a4,23(s3)
        pFree->pNext = pFree->pNext->pNext;
    800042a8:	0007c683          	lbu	a3,0(a5)
    800042ac:	0017c703          	lbu	a4,1(a5)
    800042b0:	00871713          	slli	a4,a4,0x8
    800042b4:	00d766b3          	or	a3,a4,a3
    800042b8:	0027c703          	lbu	a4,2(a5)
    800042bc:	01071713          	slli	a4,a4,0x10
    800042c0:	00d76733          	or	a4,a4,a3
    800042c4:	0037c683          	lbu	a3,3(a5)
    800042c8:	01869693          	slli	a3,a3,0x18
    800042cc:	00e6e733          	or	a4,a3,a4
    800042d0:	0047c683          	lbu	a3,4(a5)
    800042d4:	02069693          	slli	a3,a3,0x20
    800042d8:	00e6e6b3          	or	a3,a3,a4
    800042dc:	0057c703          	lbu	a4,5(a5)
    800042e0:	02871713          	slli	a4,a4,0x28
    800042e4:	00d766b3          	or	a3,a4,a3
    800042e8:	0067c703          	lbu	a4,6(a5)
    800042ec:	03071713          	slli	a4,a4,0x30
    800042f0:	00d76733          	or	a4,a4,a3
    800042f4:	0077c783          	lbu	a5,7(a5)
    800042f8:	03879793          	slli	a5,a5,0x38
    800042fc:	00e7e7b3          	or	a5,a5,a4
    80004300:	00e98023          	sb	a4,0(s3)
    80004304:	0087d713          	srli	a4,a5,0x8
    80004308:	00e980a3          	sb	a4,1(s3)
    8000430c:	0107d713          	srli	a4,a5,0x10
    80004310:	00e98123          	sb	a4,2(s3)
    80004314:	0187d71b          	srliw	a4,a5,0x18
    80004318:	00e981a3          	sb	a4,3(s3)
    8000431c:	0207d713          	srli	a4,a5,0x20
    80004320:	00e98223          	sb	a4,4(s3)
    80004324:	0287d713          	srli	a4,a5,0x28
    80004328:	00e982a3          	sb	a4,5(s3)
    8000432c:	0307d713          	srli	a4,a5,0x30
    80004330:	00e98323          	sb	a4,6(s3)
    80004334:	0387d713          	srli	a4,a5,0x38
    80004338:	00e983a3          	sb	a4,7(s3)
        if(pFree->pNext != 0){
    8000433c:	940782e3          	beqz	a5,80003c80 <_ZN11HeapManager8heapFreeEPv+0x27c>
            pFree->pNext->pPrev = pFree;
    80004340:	01378423          	sb	s3,8(a5)
    80004344:	0089d713          	srli	a4,s3,0x8
    80004348:	00e784a3          	sb	a4,9(a5)
    8000434c:	0109d713          	srli	a4,s3,0x10
    80004350:	00e78523          	sb	a4,10(a5)
    80004354:	0189d71b          	srliw	a4,s3,0x18
    80004358:	00e785a3          	sb	a4,11(a5)
    8000435c:	0209d713          	srli	a4,s3,0x20
    80004360:	00e78623          	sb	a4,12(a5)
    80004364:	0289d713          	srli	a4,s3,0x28
    80004368:	00e786a3          	sb	a4,13(a5)
    8000436c:	0309d713          	srli	a4,s3,0x30
    80004370:	00e78723          	sb	a4,14(a5)
    80004374:	0389d993          	srli	s3,s3,0x38
    80004378:	013787a3          	sb	s3,15(a5)
    8000437c:	905ff06f          	j	80003c80 <_ZN11HeapManager8heapFreeEPv+0x27c>

0000000080004380 <exceptionHandler>:
#include "sem.h"
#include "timer.h"
#include "assert.h"


extern "C" void exceptionHandler(){
    80004380:	fb010113          	addi	sp,sp,-80
    80004384:	04113423          	sd	ra,72(sp)
    80004388:	04813023          	sd	s0,64(sp)
    8000438c:	02913c23          	sd	s1,56(sp)
    80004390:	03213823          	sd	s2,48(sp)
    80004394:	03313423          	sd	s3,40(sp)
    80004398:	03413023          	sd	s4,32(sp)
    8000439c:	01513c23          	sd	s5,24(sp)
    800043a0:	01613823          	sd	s6,16(sp)
    800043a4:	01713423          	sd	s7,8(sp)
    800043a8:	05010413          	addi	s0,sp,80
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    800043ac:	00070b93          	mv	s7,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    800043b0:	00068b13          	mv	s6,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    800043b4:	00060a93          	mv	s5,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    800043b8:	00058a13          	mv	s4,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    800043bc:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    800043c0:	14202973          	csrr	s2,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    800043c4:	100029f3          	csrr	s3,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    800043c8:	141024f3          	csrr	s1,sepc


    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    800043cc:	ff890693          	addi	a3,s2,-8
    800043d0:	00100713          	li	a4,1
    800043d4:	06d77463          	bgeu	a4,a3,8000443c <exceptionHandler+0xbc>
        __asm__ volatile("csrw scause, %0" :: "r"(scause));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    800043d8:	00500793          	li	a5,5
    800043dc:	20f90263          	beq	s2,a5,800045e0 <exceptionHandler+0x260>
            }
        }
        ConsoleManager::putc('\n');
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    800043e0:	00700793          	li	a5,7
    800043e4:	3cf90063          	beq	s2,a5,800047a4 <exceptionHandler+0x424>
            }
        }
        ConsoleManager::putc('\n');
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    800043e8:	fff00793          	li	a5,-1
    800043ec:	03f79793          	slli	a5,a5,0x3f
    800043f0:	00178793          	addi	a5,a5,1
    800043f4:	58f90063          	beq	s2,a5,80004974 <exceptionHandler+0x5f4>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    800043f8:	fff00793          	li	a5,-1
    800043fc:	03f79793          	slli	a5,a5,0x3f
    80004400:	00978793          	addi	a5,a5,9
    80004404:	08f91463          	bne	s2,a5,8000448c <exceptionHandler+0x10c>
    {   
        int irq = plic_claim();
    80004408:	00005097          	auipc	ra,0x5
    8000440c:	49c080e7          	jalr	1180(ra) # 800098a4 <plic_claim>
    80004410:	00050913          	mv	s2,a0
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    80004414:	00a00793          	li	a5,10
    80004418:	5cf50063          	beq	a0,a5,800049d8 <exceptionHandler+0x658>
        // console_handler();
        plic_complete(irq);
    8000441c:	00090513          	mv	a0,s2
    80004420:	00005097          	auipc	ra,0x5
    80004424:	4bc080e7          	jalr	1212(ra) # 800098dc <plic_complete>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80004428:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    8000442c:	10099073          	csrw	sstatus,s3
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 9));
    80004430:	20000793          	li	a5,512
    80004434:	1447b073          	csrc	sip,a5
    }
    80004438:	0540006f          	j	8000448c <exceptionHandler+0x10c>
        switch(a0){
    8000443c:	04200713          	li	a4,66
    80004440:	18f76c63          	bltu	a4,a5,800045d8 <exceptionHandler+0x258>
    80004444:	00279793          	slli	a5,a5,0x2
    80004448:	00008717          	auipc	a4,0x8
    8000444c:	ee470713          	addi	a4,a4,-284 # 8000c32c <CONSOLE_STATUS+0x31c>
    80004450:	00e787b3          	add	a5,a5,a4
    80004454:	0007a783          	lw	a5,0(a5)
    80004458:	00e787b3          	add	a5,a5,a4
    8000445c:	00078067          	jr	a5
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80004460:	000a0593          	mv	a1,s4
    80004464:	0000b797          	auipc	a5,0xb
    80004468:	d3c7b783          	ld	a5,-708(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000446c:	0007b503          	ld	a0,0(a5)
    80004470:	fffff097          	auipc	ra,0xfffff
    80004474:	e98080e7          	jalr	-360(ra) # 80003308 <_ZN11HeapManager12heapAllocateEm>
        __asm__ volatile("csrw scause, %0" :: "r"(scause));
    80004478:	14291073          	csrw	scause,s2
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    8000447c:	00448493          	addi	s1,s1,4
    80004480:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004484:	10099073          	csrw	sstatus,s3
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80004488:	00050513          	mv	a0,a0
    8000448c:	04813083          	ld	ra,72(sp)
    80004490:	04013403          	ld	s0,64(sp)
    80004494:	03813483          	ld	s1,56(sp)
    80004498:	03013903          	ld	s2,48(sp)
    8000449c:	02813983          	ld	s3,40(sp)
    800044a0:	02013a03          	ld	s4,32(sp)
    800044a4:	01813a83          	ld	s5,24(sp)
    800044a8:	01013b03          	ld	s6,16(sp)
    800044ac:	00813b83          	ld	s7,8(sp)
    800044b0:	05010113          	addi	sp,sp,80
    800044b4:	00008067          	ret
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    800044b8:	000a0593          	mv	a1,s4
    800044bc:	0000b797          	auipc	a5,0xb
    800044c0:	ce47b783          	ld	a5,-796(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800044c4:	0007b503          	ld	a0,0(a5)
    800044c8:	fffff097          	auipc	ra,0xfffff
    800044cc:	53c080e7          	jalr	1340(ra) # 80003a04 <_ZN11HeapManager8heapFreeEPv>
                break;
    800044d0:	fa9ff06f          	j	80004478 <exceptionHandler+0xf8>
                ConsoleManager::putc('\0'); /// removing this line causes everything to break
    800044d4:	00000513          	li	a0,0
    800044d8:	fffff097          	auipc	ra,0xfffff
    800044dc:	958080e7          	jalr	-1704(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    800044e0:	00100713          	li	a4,1
    800044e4:	000b8693          	mv	a3,s7
    800044e8:	000b0613          	mv	a2,s6
    800044ec:	000a8593          	mv	a1,s5
    800044f0:	000a0513          	mv	a0,s4
    800044f4:	ffffe097          	auipc	ra,0xffffe
    800044f8:	d64080e7          	jalr	-668(ra) # 80002258 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    800044fc:	f7dff06f          	j	80004478 <exceptionHandler+0xf8>
                returnVal = _thread::currentThread->exit();
    80004500:	ffffe097          	auipc	ra,0xffffe
    80004504:	1f8080e7          	jalr	504(ra) # 800026f8 <_ZN7_thread4exitEv>
                break;
    80004508:	f71ff06f          	j	80004478 <exceptionHandler+0xf8>
                _thread::dispatch();
    8000450c:	ffffe097          	auipc	ra,0xffffe
    80004510:	fb8080e7          	jalr	-72(ra) # 800024c4 <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    80004514:	00000513          	li	a0,0
                break;
    80004518:	f61ff06f          	j	80004478 <exceptionHandler+0xf8>
                _thread::currentThread->join((thread_t)a1);
    8000451c:	000a0593          	mv	a1,s4
    80004520:	0000b797          	auipc	a5,0xb
    80004524:	ca07b783          	ld	a5,-864(a5) # 8000f1c0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004528:	0007b503          	ld	a0,0(a5)
    8000452c:	ffffe097          	auipc	ra,0xffffe
    80004530:	014080e7          	jalr	20(ra) # 80002540 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    80004534:	00000513          	li	a0,0
                break;
    80004538:	f41ff06f          	j	80004478 <exceptionHandler+0xf8>
                _sem::open((sem_t*)a1, unsigned(a2));
    8000453c:	000a859b          	sext.w	a1,s5
    80004540:	000a0513          	mv	a0,s4
    80004544:	00000097          	auipc	ra,0x0
    80004548:	770080e7          	jalr	1904(ra) # 80004cb4 <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    8000454c:	00000513          	li	a0,0
                break;
    80004550:	f29ff06f          	j	80004478 <exceptionHandler+0xf8>
                _sem::close((sem_t)a1);
    80004554:	000a0513          	mv	a0,s4
    80004558:	00000097          	auipc	ra,0x0
    8000455c:	7c4080e7          	jalr	1988(ra) # 80004d1c <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80004560:	00000513          	li	a0,0
                break;
    80004564:	f15ff06f          	j	80004478 <exceptionHandler+0xf8>
                _sem::wait((sem_t)a1);
    80004568:	000a0513          	mv	a0,s4
    8000456c:	00001097          	auipc	ra,0x1
    80004570:	81c080e7          	jalr	-2020(ra) # 80004d88 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    80004574:	00000513          	li	a0,0
                break;
    80004578:	f01ff06f          	j	80004478 <exceptionHandler+0xf8>
                _sem::signal((sem_t)a1);
    8000457c:	000a0513          	mv	a0,s4
    80004580:	00001097          	auipc	ra,0x1
    80004584:	8b8080e7          	jalr	-1864(ra) # 80004e38 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80004588:	00000513          	li	a0,0
                break;
    8000458c:	eedff06f          	j	80004478 <exceptionHandler+0xf8>
                returnVal = _sem::trywait((sem_t)a1);
    80004590:	000a0513          	mv	a0,s4
    80004594:	00001097          	auipc	ra,0x1
    80004598:	930080e7          	jalr	-1744(ra) # 80004ec4 <_ZN4_sem7trywaitEPS_>
                break;
    8000459c:	eddff06f          	j	80004478 <exceptionHandler+0xf8>
                returnVal = Timer::getInstance().sleep(a1);
    800045a0:	00000097          	auipc	ra,0x0
    800045a4:	508080e7          	jalr	1288(ra) # 80004aa8 <_ZN5Timer11getInstanceEv>
    800045a8:	000a0593          	mv	a1,s4
    800045ac:	00000097          	auipc	ra,0x0
    800045b0:	5f8080e7          	jalr	1528(ra) # 80004ba4 <_ZN5Timer5sleepEm>
                break;
    800045b4:	ec5ff06f          	j	80004478 <exceptionHandler+0xf8>
                returnVal = ConsoleManager::getc();
    800045b8:	fffff097          	auipc	ra,0xfffff
    800045bc:	8b0080e7          	jalr	-1872(ra) # 80002e68 <_ZN14ConsoleManager4getcEv>
                break;
    800045c0:	eb9ff06f          	j	80004478 <exceptionHandler+0xf8>
                ConsoleManager::putc(a1);
    800045c4:	0ffa7513          	andi	a0,s4,255
    800045c8:	fffff097          	auipc	ra,0xfffff
    800045cc:	868080e7          	jalr	-1944(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
    uint64 returnVal = 0;
    800045d0:	00000513          	li	a0,0
                break;
    800045d4:	ea5ff06f          	j	80004478 <exceptionHandler+0xf8>
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    800045d8:	00000513          	li	a0,0
    800045dc:	e9dff06f          	j	80004478 <exceptionHandler+0xf8>
        ConsoleManager::putc('\n');
    800045e0:	00a00513          	li	a0,10
    800045e4:	fffff097          	auipc	ra,0xfffff
    800045e8:	84c080e7          	jalr	-1972(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('E');
    800045ec:	04500513          	li	a0,69
    800045f0:	fffff097          	auipc	ra,0xfffff
    800045f4:	840080e7          	jalr	-1984(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800045f8:	07200513          	li	a0,114
    800045fc:	fffff097          	auipc	ra,0xfffff
    80004600:	834080e7          	jalr	-1996(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004604:	07200513          	li	a0,114
    80004608:	fffff097          	auipc	ra,0xfffff
    8000460c:	828080e7          	jalr	-2008(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('o');
    80004610:	06f00513          	li	a0,111
    80004614:	fffff097          	auipc	ra,0xfffff
    80004618:	81c080e7          	jalr	-2020(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    8000461c:	07200513          	li	a0,114
    80004620:	fffff097          	auipc	ra,0xfffff
    80004624:	810080e7          	jalr	-2032(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004628:	03a00513          	li	a0,58
    8000462c:	fffff097          	auipc	ra,0xfffff
    80004630:	804080e7          	jalr	-2044(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004634:	02000513          	li	a0,32
    80004638:	ffffe097          	auipc	ra,0xffffe
    8000463c:	7f8080e7          	jalr	2040(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80004640:	06900513          	li	a0,105
    80004644:	ffffe097          	auipc	ra,0xffffe
    80004648:	7ec080e7          	jalr	2028(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    8000464c:	06c00513          	li	a0,108
    80004650:	ffffe097          	auipc	ra,0xffffe
    80004654:	7e0080e7          	jalr	2016(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004658:	06c00513          	li	a0,108
    8000465c:	ffffe097          	auipc	ra,0xffffe
    80004660:	7d4080e7          	jalr	2004(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004664:	06500513          	li	a0,101
    80004668:	ffffe097          	auipc	ra,0xffffe
    8000466c:	7c8080e7          	jalr	1992(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('g');
    80004670:	06700513          	li	a0,103
    80004674:	ffffe097          	auipc	ra,0xffffe
    80004678:	7bc080e7          	jalr	1980(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    8000467c:	06100513          	li	a0,97
    80004680:	ffffe097          	auipc	ra,0xffffe
    80004684:	7b0080e7          	jalr	1968(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004688:	06c00513          	li	a0,108
    8000468c:	ffffe097          	auipc	ra,0xffffe
    80004690:	7a4080e7          	jalr	1956(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004694:	02000513          	li	a0,32
    80004698:	ffffe097          	auipc	ra,0xffffe
    8000469c:	798080e7          	jalr	1944(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800046a0:	07200513          	li	a0,114
    800046a4:	ffffe097          	auipc	ra,0xffffe
    800046a8:	78c080e7          	jalr	1932(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    800046ac:	06500513          	li	a0,101
    800046b0:	ffffe097          	auipc	ra,0xffffe
    800046b4:	780080e7          	jalr	1920(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    800046b8:	06100513          	li	a0,97
    800046bc:	ffffe097          	auipc	ra,0xffffe
    800046c0:	774080e7          	jalr	1908(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('d');
    800046c4:	06400513          	li	a0,100
    800046c8:	ffffe097          	auipc	ra,0xffffe
    800046cc:	768080e7          	jalr	1896(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('!');
    800046d0:	02100513          	li	a0,33
    800046d4:	ffffe097          	auipc	ra,0xffffe
    800046d8:	75c080e7          	jalr	1884(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('\n');
    800046dc:	00a00513          	li	a0,10
    800046e0:	ffffe097          	auipc	ra,0xffffe
    800046e4:	750080e7          	jalr	1872(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('P');
    800046e8:	05000513          	li	a0,80
    800046ec:	ffffe097          	auipc	ra,0xffffe
    800046f0:	744080e7          	jalr	1860(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('C');
    800046f4:	04300513          	li	a0,67
    800046f8:	ffffe097          	auipc	ra,0xffffe
    800046fc:	738080e7          	jalr	1848(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004700:	03a00513          	li	a0,58
    80004704:	ffffe097          	auipc	ra,0xffffe
    80004708:	72c080e7          	jalr	1836(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    8000470c:	02000513          	li	a0,32
    80004710:	ffffe097          	auipc	ra,0xffffe
    80004714:	720080e7          	jalr	1824(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('0');
    80004718:	03000513          	li	a0,48
    8000471c:	ffffe097          	auipc	ra,0xffffe
    80004720:	714080e7          	jalr	1812(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('x');
    80004724:	07800513          	li	a0,120
    80004728:	ffffe097          	auipc	ra,0xffffe
    8000472c:	708080e7          	jalr	1800(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004730:	00f00913          	li	s2,15
    80004734:	0140006f          	j	80004748 <exceptionHandler+0x3c8>
                ConsoleManager::putc('A' + tmp - 10);
    80004738:	03750513          	addi	a0,a0,55
    8000473c:	ffffe097          	auipc	ra,0xffffe
    80004740:	6f4080e7          	jalr	1780(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004744:	fff9091b          	addiw	s2,s2,-1
    80004748:	02094463          	bltz	s2,80004770 <exceptionHandler+0x3f0>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    8000474c:	0029151b          	slliw	a0,s2,0x2
    80004750:	00a4d533          	srl	a0,s1,a0
    80004754:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004758:	00900793          	li	a5,9
    8000475c:	fca7eee3          	bltu	a5,a0,80004738 <exceptionHandler+0x3b8>
                ConsoleManager::putc('0' + tmp);
    80004760:	03050513          	addi	a0,a0,48
    80004764:	ffffe097          	auipc	ra,0xffffe
    80004768:	6cc080e7          	jalr	1740(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
    8000476c:	fd9ff06f          	j	80004744 <exceptionHandler+0x3c4>
        ConsoleManager::putc('\n');
    80004770:	00a00513          	li	a0,10
    80004774:	ffffe097          	auipc	ra,0xffffe
    80004778:	6bc080e7          	jalr	1724(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        assert(false);
    8000477c:	00008697          	auipc	a3,0x8
    80004780:	b4c68693          	addi	a3,a3,-1204 # 8000c2c8 <CONSOLE_STATUS+0x2b8>
    80004784:	08700613          	li	a2,135
    80004788:	00008597          	auipc	a1,0x8
    8000478c:	b5858593          	addi	a1,a1,-1192 # 8000c2e0 <CONSOLE_STATUS+0x2d0>
    80004790:	00008517          	auipc	a0,0x8
    80004794:	b7050513          	addi	a0,a0,-1168 # 8000c300 <CONSOLE_STATUS+0x2f0>
    80004798:	00001097          	auipc	ra,0x1
    8000479c:	bac080e7          	jalr	-1108(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    800047a0:	cedff06f          	j	8000448c <exceptionHandler+0x10c>
        ConsoleManager::putc('\n');
    800047a4:	00a00513          	li	a0,10
    800047a8:	ffffe097          	auipc	ra,0xffffe
    800047ac:	688080e7          	jalr	1672(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('E');
    800047b0:	04500513          	li	a0,69
    800047b4:	ffffe097          	auipc	ra,0xffffe
    800047b8:	67c080e7          	jalr	1660(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800047bc:	07200513          	li	a0,114
    800047c0:	ffffe097          	auipc	ra,0xffffe
    800047c4:	670080e7          	jalr	1648(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800047c8:	07200513          	li	a0,114
    800047cc:	ffffe097          	auipc	ra,0xffffe
    800047d0:	664080e7          	jalr	1636(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('o');
    800047d4:	06f00513          	li	a0,111
    800047d8:	ffffe097          	auipc	ra,0xffffe
    800047dc:	658080e7          	jalr	1624(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800047e0:	07200513          	li	a0,114
    800047e4:	ffffe097          	auipc	ra,0xffffe
    800047e8:	64c080e7          	jalr	1612(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    800047ec:	03a00513          	li	a0,58
    800047f0:	ffffe097          	auipc	ra,0xffffe
    800047f4:	640080e7          	jalr	1600(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    800047f8:	02000513          	li	a0,32
    800047fc:	ffffe097          	auipc	ra,0xffffe
    80004800:	634080e7          	jalr	1588(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80004804:	06900513          	li	a0,105
    80004808:	ffffe097          	auipc	ra,0xffffe
    8000480c:	628080e7          	jalr	1576(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004810:	06c00513          	li	a0,108
    80004814:	ffffe097          	auipc	ra,0xffffe
    80004818:	61c080e7          	jalr	1564(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    8000481c:	06c00513          	li	a0,108
    80004820:	ffffe097          	auipc	ra,0xffffe
    80004824:	610080e7          	jalr	1552(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004828:	06500513          	li	a0,101
    8000482c:	ffffe097          	auipc	ra,0xffffe
    80004830:	604080e7          	jalr	1540(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('g');
    80004834:	06700513          	li	a0,103
    80004838:	ffffe097          	auipc	ra,0xffffe
    8000483c:	5f8080e7          	jalr	1528(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    80004840:	06100513          	li	a0,97
    80004844:	ffffe097          	auipc	ra,0xffffe
    80004848:	5ec080e7          	jalr	1516(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    8000484c:	06c00513          	li	a0,108
    80004850:	ffffe097          	auipc	ra,0xffffe
    80004854:	5e0080e7          	jalr	1504(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004858:	02000513          	li	a0,32
    8000485c:	ffffe097          	auipc	ra,0xffffe
    80004860:	5d4080e7          	jalr	1492(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('w');
    80004864:	07700513          	li	a0,119
    80004868:	ffffe097          	auipc	ra,0xffffe
    8000486c:	5c8080e7          	jalr	1480(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004870:	07200513          	li	a0,114
    80004874:	ffffe097          	auipc	ra,0xffffe
    80004878:	5bc080e7          	jalr	1468(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    8000487c:	06900513          	li	a0,105
    80004880:	ffffe097          	auipc	ra,0xffffe
    80004884:	5b0080e7          	jalr	1456(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('t');
    80004888:	07400513          	li	a0,116
    8000488c:	ffffe097          	auipc	ra,0xffffe
    80004890:	5a4080e7          	jalr	1444(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004894:	06500513          	li	a0,101
    80004898:	ffffe097          	auipc	ra,0xffffe
    8000489c:	598080e7          	jalr	1432(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('!');
    800048a0:	02100513          	li	a0,33
    800048a4:	ffffe097          	auipc	ra,0xffffe
    800048a8:	58c080e7          	jalr	1420(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('\n');
    800048ac:	00a00513          	li	a0,10
    800048b0:	ffffe097          	auipc	ra,0xffffe
    800048b4:	580080e7          	jalr	1408(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('P');
    800048b8:	05000513          	li	a0,80
    800048bc:	ffffe097          	auipc	ra,0xffffe
    800048c0:	574080e7          	jalr	1396(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('C');
    800048c4:	04300513          	li	a0,67
    800048c8:	ffffe097          	auipc	ra,0xffffe
    800048cc:	568080e7          	jalr	1384(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    800048d0:	03a00513          	li	a0,58
    800048d4:	ffffe097          	auipc	ra,0xffffe
    800048d8:	55c080e7          	jalr	1372(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    800048dc:	02000513          	li	a0,32
    800048e0:	ffffe097          	auipc	ra,0xffffe
    800048e4:	550080e7          	jalr	1360(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('0');
    800048e8:	03000513          	li	a0,48
    800048ec:	ffffe097          	auipc	ra,0xffffe
    800048f0:	544080e7          	jalr	1348(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('x');
    800048f4:	07800513          	li	a0,120
    800048f8:	ffffe097          	auipc	ra,0xffffe
    800048fc:	538080e7          	jalr	1336(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004900:	00f00913          	li	s2,15
    80004904:	0140006f          	j	80004918 <exceptionHandler+0x598>
                ConsoleManager::putc('A' + tmp - 10);
    80004908:	03750513          	addi	a0,a0,55
    8000490c:	ffffe097          	auipc	ra,0xffffe
    80004910:	524080e7          	jalr	1316(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004914:	fff9091b          	addiw	s2,s2,-1
    80004918:	02094463          	bltz	s2,80004940 <exceptionHandler+0x5c0>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    8000491c:	0029151b          	slliw	a0,s2,0x2
    80004920:	00a4d533          	srl	a0,s1,a0
    80004924:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004928:	00900793          	li	a5,9
    8000492c:	fca7eee3          	bltu	a5,a0,80004908 <exceptionHandler+0x588>
                ConsoleManager::putc('0' + tmp);
    80004930:	03050513          	addi	a0,a0,48
    80004934:	ffffe097          	auipc	ra,0xffffe
    80004938:	4fc080e7          	jalr	1276(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
    8000493c:	fd9ff06f          	j	80004914 <exceptionHandler+0x594>
        ConsoleManager::putc('\n');
    80004940:	00a00513          	li	a0,10
    80004944:	ffffe097          	auipc	ra,0xffffe
    80004948:	4ec080e7          	jalr	1260(ra) # 80002e30 <_ZN14ConsoleManager4putcEc>
        assert(false);
    8000494c:	00008697          	auipc	a3,0x8
    80004950:	97c68693          	addi	a3,a3,-1668 # 8000c2c8 <CONSOLE_STATUS+0x2b8>
    80004954:	0b000613          	li	a2,176
    80004958:	00008597          	auipc	a1,0x8
    8000495c:	98858593          	addi	a1,a1,-1656 # 8000c2e0 <CONSOLE_STATUS+0x2d0>
    80004960:	00008517          	auipc	a0,0x8
    80004964:	9a050513          	addi	a0,a0,-1632 # 8000c300 <CONSOLE_STATUS+0x2f0>
    80004968:	00001097          	auipc	ra,0x1
    8000496c:	9dc080e7          	jalr	-1572(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    80004970:	b1dff06f          	j	8000448c <exceptionHandler+0x10c>
        Timer::getInstance().tick();
    80004974:	00000097          	auipc	ra,0x0
    80004978:	134080e7          	jalr	308(ra) # 80004aa8 <_ZN5Timer11getInstanceEv>
    8000497c:	00000097          	auipc	ra,0x0
    80004980:	190080e7          	jalr	400(ra) # 80004b0c <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    80004984:	0000b797          	auipc	a5,0xb
    80004988:	83c7b783          	ld	a5,-1988(a5) # 8000f1c0 <_GLOBAL_OFFSET_TABLE_+0x48>
    8000498c:	0007b503          	ld	a0,0(a5)
    80004990:	ffffe097          	auipc	ra,0xffffe
    80004994:	cd8080e7          	jalr	-808(ra) # 80002668 <_ZN7_thread4tickEv>
    80004998:	00051c63          	bnez	a0,800049b0 <exceptionHandler+0x630>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    8000499c:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    800049a0:	10099073          	csrw	sstatus,s3
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    800049a4:	00200793          	li	a5,2
    800049a8:	1447b073          	csrc	sip,a5
    800049ac:	ae1ff06f          	j	8000448c <exceptionHandler+0x10c>
        assert(_thread::currentThread->tick() == 0);
    800049b0:	00008697          	auipc	a3,0x8
    800049b4:	91868693          	addi	a3,a3,-1768 # 8000c2c8 <CONSOLE_STATUS+0x2b8>
    800049b8:	0b400613          	li	a2,180
    800049bc:	00008597          	auipc	a1,0x8
    800049c0:	92458593          	addi	a1,a1,-1756 # 8000c2e0 <CONSOLE_STATUS+0x2d0>
    800049c4:	00008517          	auipc	a0,0x8
    800049c8:	94450513          	addi	a0,a0,-1724 # 8000c308 <CONSOLE_STATUS+0x2f8>
    800049cc:	00001097          	auipc	ra,0x1
    800049d0:	978080e7          	jalr	-1672(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    800049d4:	fc9ff06f          	j	8000499c <exceptionHandler+0x61c>
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    800049d8:	ffffe097          	auipc	ra,0xffffe
    800049dc:	5bc080e7          	jalr	1468(ra) # 80002f94 <_ZN14ConsoleManager12inputHandlerEv>
    800049e0:	a3dff06f          	j	8000441c <exceptionHandler+0x9c>

00000000800049e4 <_ZN5TimerC1Ev>:
#include "thread.h"


Timer* Timer::instance = 0;

Timer::Timer(){
    800049e4:	fe010113          	addi	sp,sp,-32
    800049e8:	00113c23          	sd	ra,24(sp)
    800049ec:	00813823          	sd	s0,16(sp)
    800049f0:	00913423          	sd	s1,8(sp)
    800049f4:	02010413          	addi	s0,sp,32
    800049f8:	00050493          	mv	s1,a0
    assert(instance == 0);
    800049fc:	0000b797          	auipc	a5,0xb
    80004a00:	84c7b783          	ld	a5,-1972(a5) # 8000f248 <_ZN5Timer8instanceE>
    80004a04:	02079463          	bnez	a5,80004a2c <_ZN5TimerC1Ev+0x48>
    instance = this;
    80004a08:	0000b797          	auipc	a5,0xb
    80004a0c:	8497b023          	sd	s1,-1984(a5) # 8000f248 <_ZN5Timer8instanceE>
    sleepingHead = 0;
    80004a10:	0004b023          	sd	zero,0(s1)
    time = 0;
    80004a14:	0004b423          	sd	zero,8(s1)
}
    80004a18:	01813083          	ld	ra,24(sp)
    80004a1c:	01013403          	ld	s0,16(sp)
    80004a20:	00813483          	ld	s1,8(sp)
    80004a24:	02010113          	addi	sp,sp,32
    80004a28:	00008067          	ret
    assert(instance == 0);
    80004a2c:	00008697          	auipc	a3,0x8
    80004a30:	a0c68693          	addi	a3,a3,-1524 # 8000c438 <CONSOLE_STATUS+0x428>
    80004a34:	01600613          	li	a2,22
    80004a38:	00008597          	auipc	a1,0x8
    80004a3c:	a1058593          	addi	a1,a1,-1520 # 8000c448 <CONSOLE_STATUS+0x438>
    80004a40:	00007517          	auipc	a0,0x7
    80004a44:	70050513          	addi	a0,a0,1792 # 8000c140 <CONSOLE_STATUS+0x130>
    80004a48:	00001097          	auipc	ra,0x1
    80004a4c:	8fc080e7          	jalr	-1796(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    80004a50:	fb9ff06f          	j	80004a08 <_ZN5TimerC1Ev+0x24>

0000000080004a54 <_ZN5TimerD1Ev>:

Timer::~Timer(){
    threadSleepWrapper* current = sleepingHead;
    80004a54:	00053583          	ld	a1,0(a0)
    while(current != 0){
    80004a58:	04058663          	beqz	a1,80004aa4 <_ZN5TimerD1Ev+0x50>
Timer::~Timer(){
    80004a5c:	fe010113          	addi	sp,sp,-32
    80004a60:	00113c23          	sd	ra,24(sp)
    80004a64:	00813823          	sd	s0,16(sp)
    80004a68:	00913423          	sd	s1,8(sp)
    80004a6c:	02010413          	addi	s0,sp,32
        threadSleepWrapper* next = current->next;
    80004a70:	0105b483          	ld	s1,16(a1)
        HeapManager::getInstance().heapFree(current);
    80004a74:	0000a797          	auipc	a5,0xa
    80004a78:	72c7b783          	ld	a5,1836(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004a7c:	0007b503          	ld	a0,0(a5)
    80004a80:	fffff097          	auipc	ra,0xfffff
    80004a84:	f84080e7          	jalr	-124(ra) # 80003a04 <_ZN11HeapManager8heapFreeEPv>
        current = next;
    80004a88:	00048593          	mv	a1,s1
    while(current != 0){
    80004a8c:	fe0492e3          	bnez	s1,80004a70 <_ZN5TimerD1Ev+0x1c>
    }
}
    80004a90:	01813083          	ld	ra,24(sp)
    80004a94:	01013403          	ld	s0,16(sp)
    80004a98:	00813483          	ld	s1,8(sp)
    80004a9c:	02010113          	addi	sp,sp,32
    80004aa0:	00008067          	ret
    80004aa4:	00008067          	ret

0000000080004aa8 <_ZN5Timer11getInstanceEv>:

Timer& Timer::getInstance(){
    assert(instance != 0);
    80004aa8:	0000a797          	auipc	a5,0xa
    80004aac:	7a07b783          	ld	a5,1952(a5) # 8000f248 <_ZN5Timer8instanceE>
    80004ab0:	00078863          	beqz	a5,80004ac0 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    80004ab4:	0000a517          	auipc	a0,0xa
    80004ab8:	79453503          	ld	a0,1940(a0) # 8000f248 <_ZN5Timer8instanceE>
    80004abc:	00008067          	ret
Timer& Timer::getInstance(){
    80004ac0:	ff010113          	addi	sp,sp,-16
    80004ac4:	00113423          	sd	ra,8(sp)
    80004ac8:	00813023          	sd	s0,0(sp)
    80004acc:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80004ad0:	00008697          	auipc	a3,0x8
    80004ad4:	98868693          	addi	a3,a3,-1656 # 8000c458 <CONSOLE_STATUS+0x448>
    80004ad8:	02600613          	li	a2,38
    80004adc:	00008597          	auipc	a1,0x8
    80004ae0:	96c58593          	addi	a1,a1,-1684 # 8000c448 <CONSOLE_STATUS+0x438>
    80004ae4:	00007517          	auipc	a0,0x7
    80004ae8:	62450513          	addi	a0,a0,1572 # 8000c108 <CONSOLE_STATUS+0xf8>
    80004aec:	00001097          	auipc	ra,0x1
    80004af0:	858080e7          	jalr	-1960(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
}
    80004af4:	0000a517          	auipc	a0,0xa
    80004af8:	75453503          	ld	a0,1876(a0) # 8000f248 <_ZN5Timer8instanceE>
    80004afc:	00813083          	ld	ra,8(sp)
    80004b00:	00013403          	ld	s0,0(sp)
    80004b04:	01010113          	addi	sp,sp,16
    80004b08:	00008067          	ret

0000000080004b0c <_ZN5Timer4tickEv>:

void Timer::tick(){
    80004b0c:	fe010113          	addi	sp,sp,-32
    80004b10:	00113c23          	sd	ra,24(sp)
    80004b14:	00813823          	sd	s0,16(sp)
    80004b18:	00913423          	sd	s1,8(sp)
    80004b1c:	01213023          	sd	s2,0(sp)
    80004b20:	02010413          	addi	s0,sp,32
    80004b24:	00050493          	mv	s1,a0
    time += 1;
    80004b28:	00853783          	ld	a5,8(a0)
    80004b2c:	00178793          	addi	a5,a5,1
    80004b30:	00f53423          	sd	a5,8(a0)
    while(sleepingHead != 0 && sleepingHead->wakeUpTime <= time){
    80004b34:	0004b783          	ld	a5,0(s1)
    80004b38:	04078a63          	beqz	a5,80004b8c <_ZN5Timer4tickEv+0x80>
    80004b3c:	0087b683          	ld	a3,8(a5)
    80004b40:	0084b703          	ld	a4,8(s1)
    80004b44:	04d76463          	bltu	a4,a3,80004b8c <_ZN5Timer4tickEv+0x80>
        sleepingHead->thread->setSleeping(false);
    80004b48:	00000593          	li	a1,0
    80004b4c:	0007b503          	ld	a0,0(a5)
    80004b50:	ffffe097          	auipc	ra,0xffffe
    80004b54:	944080e7          	jalr	-1724(ra) # 80002494 <_ZN7_thread11setSleepingEb>
        Scheduler::put(sleepingHead->thread);
    80004b58:	0004b783          	ld	a5,0(s1)
    80004b5c:	0007b503          	ld	a0,0(a5)
    80004b60:	00000097          	auipc	ra,0x0
    80004b64:	430080e7          	jalr	1072(ra) # 80004f90 <_ZN9Scheduler3putEP7_thread>
        threadSleepWrapper* next = sleepingHead->next;
    80004b68:	0004b583          	ld	a1,0(s1)
    80004b6c:	0105b903          	ld	s2,16(a1)
        HeapManager::getInstance().heapFree(sleepingHead);
    80004b70:	0000a797          	auipc	a5,0xa
    80004b74:	6307b783          	ld	a5,1584(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004b78:	0007b503          	ld	a0,0(a5)
    80004b7c:	fffff097          	auipc	ra,0xfffff
    80004b80:	e88080e7          	jalr	-376(ra) # 80003a04 <_ZN11HeapManager8heapFreeEPv>
        sleepingHead = next;
    80004b84:	0124b023          	sd	s2,0(s1)
    while(sleepingHead != 0 && sleepingHead->wakeUpTime <= time){
    80004b88:	fadff06f          	j	80004b34 <_ZN5Timer4tickEv+0x28>
    }
}
    80004b8c:	01813083          	ld	ra,24(sp)
    80004b90:	01013403          	ld	s0,16(sp)
    80004b94:	00813483          	ld	s1,8(sp)
    80004b98:	00013903          	ld	s2,0(sp)
    80004b9c:	02010113          	addi	sp,sp,32
    80004ba0:	00008067          	ret

0000000080004ba4 <_ZN5Timer5sleepEm>:

int Timer::sleep(time_t timeToSleep){
    80004ba4:	fd010113          	addi	sp,sp,-48
    80004ba8:	02113423          	sd	ra,40(sp)
    80004bac:	02813023          	sd	s0,32(sp)
    80004bb0:	00913c23          	sd	s1,24(sp)
    80004bb4:	01213823          	sd	s2,16(sp)
    80004bb8:	01313423          	sd	s3,8(sp)
    80004bbc:	03010413          	addi	s0,sp,48
    80004bc0:	00050493          	mv	s1,a0
    80004bc4:	00058913          	mv	s2,a1

    thread_t thread = _thread::currentThread;
    80004bc8:	0000a797          	auipc	a5,0xa
    80004bcc:	5f87b783          	ld	a5,1528(a5) # 8000f1c0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004bd0:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)HeapManager::getInstance().heapAllocate(sizeof(threadSleepWrapper));
    80004bd4:	01800593          	li	a1,24
    80004bd8:	0000a797          	auipc	a5,0xa
    80004bdc:	5c87b783          	ld	a5,1480(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004be0:	0007b503          	ld	a0,0(a5)
    80004be4:	ffffe097          	auipc	ra,0xffffe
    80004be8:	724080e7          	jalr	1828(ra) # 80003308 <_ZN11HeapManager12heapAllocateEm>
    newSleepingThread->thread = thread;
    80004bec:	01353023          	sd	s3,0(a0)
    newSleepingThread->wakeUpTime = time + timeToSleep;
    80004bf0:	0084b783          	ld	a5,8(s1)
    80004bf4:	012785b3          	add	a1,a5,s2
    80004bf8:	00b53423          	sd	a1,8(a0)
    newSleepingThread->next = 0;
    80004bfc:	00053823          	sd	zero,16(a0)
    if(sleepingHead == 0){
    80004c00:	0004b783          	ld	a5,0(s1)
    80004c04:	06078063          	beqz	a5,80004c64 <_ZN5Timer5sleepEm+0xc0>
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
    80004c08:	00078693          	mv	a3,a5
    80004c0c:	0107b783          	ld	a5,16(a5)
    80004c10:	00078663          	beqz	a5,80004c1c <_ZN5Timer5sleepEm+0x78>
    80004c14:	0087b703          	ld	a4,8(a5)
    80004c18:	feb768e3          	bltu	a4,a1,80004c08 <_ZN5Timer5sleepEm+0x64>
            current = current->next;
        }
        if(current->wakeUpTime > newSleepingThread->wakeUpTime){
    80004c1c:	0086b703          	ld	a4,8(a3)
    80004c20:	04e5f663          	bgeu	a1,a4,80004c6c <_ZN5Timer5sleepEm+0xc8>
            sleepingHead = newSleepingThread;
    80004c24:	00a4b023          	sd	a0,0(s1)
            newSleepingThread->next = current;
    80004c28:	00d53823          	sd	a3,16(a0)
        }else{
            newSleepingThread->next = current->next;
            current->next = newSleepingThread;
        }
    }
    thread->setSleeping(true);
    80004c2c:	00100593          	li	a1,1
    80004c30:	00098513          	mv	a0,s3
    80004c34:	ffffe097          	auipc	ra,0xffffe
    80004c38:	860080e7          	jalr	-1952(ra) # 80002494 <_ZN7_thread11setSleepingEb>
    _thread::dispatch();
    80004c3c:	ffffe097          	auipc	ra,0xffffe
    80004c40:	888080e7          	jalr	-1912(ra) # 800024c4 <_ZN7_thread8dispatchEv>
    return 0;
}
    80004c44:	00000513          	li	a0,0
    80004c48:	02813083          	ld	ra,40(sp)
    80004c4c:	02013403          	ld	s0,32(sp)
    80004c50:	01813483          	ld	s1,24(sp)
    80004c54:	01013903          	ld	s2,16(sp)
    80004c58:	00813983          	ld	s3,8(sp)
    80004c5c:	03010113          	addi	sp,sp,48
    80004c60:	00008067          	ret
        sleepingHead = newSleepingThread;
    80004c64:	00a4b023          	sd	a0,0(s1)
    80004c68:	fc5ff06f          	j	80004c2c <_ZN5Timer5sleepEm+0x88>
            newSleepingThread->next = current->next;
    80004c6c:	00f53823          	sd	a5,16(a0)
            current->next = newSleepingThread;
    80004c70:	00a6b823          	sd	a0,16(a3)
    80004c74:	fb9ff06f          	j	80004c2c <_ZN5Timer5sleepEm+0x88>

0000000080004c78 <_ZN5Timer17noSleepingThreadsEv>:

bool Timer::noSleepingThreads(){
    80004c78:	ff010113          	addi	sp,sp,-16
    80004c7c:	00813423          	sd	s0,8(sp)
    80004c80:	01010413          	addi	s0,sp,16
    return sleepingHead == 0;
    80004c84:	00053503          	ld	a0,0(a0)
}
    80004c88:	00153513          	seqz	a0,a0
    80004c8c:	00813403          	ld	s0,8(sp)
    80004c90:	01010113          	addi	sp,sp,16
    80004c94:	00008067          	ret

0000000080004c98 <_ZN5Timer7getTimeEv>:

time_t Timer::getTime(){
    80004c98:	ff010113          	addi	sp,sp,-16
    80004c9c:	00813423          	sd	s0,8(sp)
    80004ca0:	01010413          	addi	s0,sp,16
    return time;
    80004ca4:	00853503          	ld	a0,8(a0)
    80004ca8:	00813403          	ld	s0,8(sp)
    80004cac:	01010113          	addi	sp,sp,16
    80004cb0:	00008067          	ret

0000000080004cb4 <_ZN4_sem4openEPPS_j>:
#include "sched.h"
#include "heapManager.h"
#include "thread.h"


void _sem::open(_sem** handle, unsigned init){
    80004cb4:	fe010113          	addi	sp,sp,-32
    80004cb8:	00113c23          	sd	ra,24(sp)
    80004cbc:	00813823          	sd	s0,16(sp)
    80004cc0:	00913423          	sd	s1,8(sp)
    80004cc4:	01213023          	sd	s2,0(sp)
    80004cc8:	02010413          	addi	s0,sp,32
    80004ccc:	00050493          	mv	s1,a0
    80004cd0:	00058913          	mv	s2,a1
    (*handle) = (sem_t)HeapManager::getInstance().heapAllocate((sizeof(_sem) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80004cd4:	00100593          	li	a1,1
    80004cd8:	0000a797          	auipc	a5,0xa
    80004cdc:	4c87b783          	ld	a5,1224(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004ce0:	0007b503          	ld	a0,0(a5)
    80004ce4:	ffffe097          	auipc	ra,0xffffe
    80004ce8:	624080e7          	jalr	1572(ra) # 80003308 <_ZN11HeapManager12heapAllocateEm>
    80004cec:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    80004cf0:	00053023          	sd	zero,0(a0)
    (*handle)->blockTail = 0;
    80004cf4:	0004b783          	ld	a5,0(s1)
    80004cf8:	0007b423          	sd	zero,8(a5)
    (*handle)->value = init;
    80004cfc:	0004b783          	ld	a5,0(s1)
    80004d00:	0127a823          	sw	s2,16(a5)
}
    80004d04:	01813083          	ld	ra,24(sp)
    80004d08:	01013403          	ld	s0,16(sp)
    80004d0c:	00813483          	ld	s1,8(sp)
    80004d10:	00013903          	ld	s2,0(sp)
    80004d14:	02010113          	addi	sp,sp,32
    80004d18:	00008067          	ret

0000000080004d1c <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    80004d1c:	fe010113          	addi	sp,sp,-32
    80004d20:	00113c23          	sd	ra,24(sp)
    80004d24:	00813823          	sd	s0,16(sp)
    80004d28:	00913423          	sd	s1,8(sp)
    80004d2c:	02010413          	addi	s0,sp,32
    80004d30:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    80004d34:	0004b783          	ld	a5,0(s1)
    80004d38:	02078e63          	beqz	a5,80004d74 <_ZN4_sem5closeEPS_+0x58>
        id->blockHead->pThread->setClosed(true);
    80004d3c:	00100593          	li	a1,1
    80004d40:	0007b503          	ld	a0,0(a5)
    80004d44:	ffffd097          	auipc	ra,0xffffd
    80004d48:	724080e7          	jalr	1828(ra) # 80002468 <_ZN7_thread9setClosedEb>
        HeapManager::getInstance().heapFree(id->blockHead);
    80004d4c:	0004b583          	ld	a1,0(s1)
    80004d50:	0000a797          	auipc	a5,0xa
    80004d54:	4507b783          	ld	a5,1104(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004d58:	0007b503          	ld	a0,0(a5)
    80004d5c:	fffff097          	auipc	ra,0xfffff
    80004d60:	ca8080e7          	jalr	-856(ra) # 80003a04 <_ZN11HeapManager8heapFreeEPv>
        id->blockHead = id->blockHead->pNext;
    80004d64:	0004b783          	ld	a5,0(s1)
    80004d68:	0087b783          	ld	a5,8(a5)
    80004d6c:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    80004d70:	fc5ff06f          	j	80004d34 <_ZN4_sem5closeEPS_+0x18>
    }
}
    80004d74:	01813083          	ld	ra,24(sp)
    80004d78:	01013403          	ld	s0,16(sp)
    80004d7c:	00813483          	ld	s1,8(sp)
    80004d80:	02010113          	addi	sp,sp,32
    80004d84:	00008067          	ret

0000000080004d88 <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    if(--id->value < 0){
    80004d88:	01052783          	lw	a5,16(a0)
    80004d8c:	fff7879b          	addiw	a5,a5,-1
    80004d90:	00f52823          	sw	a5,16(a0)
    80004d94:	02079713          	slli	a4,a5,0x20
    80004d98:	00074463          	bltz	a4,80004da0 <_ZN4_sem4waitEPS_+0x18>
    80004d9c:	00008067          	ret
void _sem::wait(sem_t id){
    80004da0:	fe010113          	addi	sp,sp,-32
    80004da4:	00113c23          	sd	ra,24(sp)
    80004da8:	00813823          	sd	s0,16(sp)
    80004dac:	00913423          	sd	s1,8(sp)
    80004db0:	02010413          	addi	s0,sp,32
    80004db4:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)HeapManager::getInstance().heapAllocate((sizeof(blockedThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80004db8:	00100593          	li	a1,1
    80004dbc:	0000a797          	auipc	a5,0xa
    80004dc0:	3e47b783          	ld	a5,996(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004dc4:	0007b503          	ld	a0,0(a5)
    80004dc8:	ffffe097          	auipc	ra,0xffffe
    80004dcc:	540080e7          	jalr	1344(ra) # 80003308 <_ZN11HeapManager12heapAllocateEm>
        pNewBlock->pThread = _thread::currentThread;
    80004dd0:	0000a797          	auipc	a5,0xa
    80004dd4:	3f07b783          	ld	a5,1008(a5) # 8000f1c0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004dd8:	0007b783          	ld	a5,0(a5)
    80004ddc:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    80004de0:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    80004de4:	0004b783          	ld	a5,0(s1)
    80004de8:	04078263          	beqz	a5,80004e2c <_ZN4_sem4waitEPS_+0xa4>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    80004dec:	0084b783          	ld	a5,8(s1)
    80004df0:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    80004df4:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    80004df8:	00100593          	li	a1,1
    80004dfc:	0000a797          	auipc	a5,0xa
    80004e00:	3c47b783          	ld	a5,964(a5) # 8000f1c0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004e04:	0007b503          	ld	a0,0(a5)
    80004e08:	ffffd097          	auipc	ra,0xffffd
    80004e0c:	630080e7          	jalr	1584(ra) # 80002438 <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    80004e10:	ffffd097          	auipc	ra,0xffffd
    80004e14:	6b4080e7          	jalr	1716(ra) # 800024c4 <_ZN7_thread8dispatchEv>
    }

}
    80004e18:	01813083          	ld	ra,24(sp)
    80004e1c:	01013403          	ld	s0,16(sp)
    80004e20:	00813483          	ld	s1,8(sp)
    80004e24:	02010113          	addi	sp,sp,32
    80004e28:	00008067          	ret
            id->blockHead = pNewBlock;
    80004e2c:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    80004e30:	00a4b423          	sd	a0,8(s1)
    80004e34:	fc5ff06f          	j	80004df8 <_ZN4_sem4waitEPS_+0x70>

0000000080004e38 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    if(++id->value <= 0){
    80004e38:	01052783          	lw	a5,16(a0)
    80004e3c:	0017879b          	addiw	a5,a5,1
    80004e40:	0007871b          	sext.w	a4,a5
    80004e44:	00f52823          	sw	a5,16(a0)
    80004e48:	00e05463          	blez	a4,80004e50 <_ZN4_sem6signalEPS_+0x18>
    80004e4c:	00008067          	ret
void _sem::signal(sem_t id){
    80004e50:	fe010113          	addi	sp,sp,-32
    80004e54:	00113c23          	sd	ra,24(sp)
    80004e58:	00813823          	sd	s0,16(sp)
    80004e5c:	00913423          	sd	s1,8(sp)
    80004e60:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    80004e64:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    80004e68:	0084b783          	ld	a5,8(s1)
    80004e6c:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    80004e70:	04078663          	beqz	a5,80004ebc <_ZN4_sem6signalEPS_+0x84>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    80004e74:	00000593          	li	a1,0
    80004e78:	0004b503          	ld	a0,0(s1)
    80004e7c:	ffffd097          	auipc	ra,0xffffd
    80004e80:	5bc080e7          	jalr	1468(ra) # 80002438 <_ZN7_thread10setBlockedEb>
        HeapManager::getInstance().heapFree(pUnblock);
    80004e84:	00048593          	mv	a1,s1
    80004e88:	0000a797          	auipc	a5,0xa
    80004e8c:	3187b783          	ld	a5,792(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004e90:	0007b503          	ld	a0,0(a5)
    80004e94:	fffff097          	auipc	ra,0xfffff
    80004e98:	b70080e7          	jalr	-1168(ra) # 80003a04 <_ZN11HeapManager8heapFreeEPv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    80004e9c:	0004b503          	ld	a0,0(s1)
    80004ea0:	00000097          	auipc	ra,0x0
    80004ea4:	0f0080e7          	jalr	240(ra) # 80004f90 <_ZN9Scheduler3putEP7_thread>
    }
}
    80004ea8:	01813083          	ld	ra,24(sp)
    80004eac:	01013403          	ld	s0,16(sp)
    80004eb0:	00813483          	ld	s1,8(sp)
    80004eb4:	02010113          	addi	sp,sp,32
    80004eb8:	00008067          	ret
            id->blockTail = 0;
    80004ebc:	00053423          	sd	zero,8(a0)
    80004ec0:	fb5ff06f          	j	80004e74 <_ZN4_sem6signalEPS_+0x3c>

0000000080004ec4 <_ZN4_sem7trywaitEPS_>:

int _sem::trywait(sem_t id){
    80004ec4:	ff010113          	addi	sp,sp,-16
    80004ec8:	00813423          	sd	s0,8(sp)
    80004ecc:	01010413          	addi	s0,sp,16
    if(id->value <= 0){
    80004ed0:	01052783          	lw	a5,16(a0)
    80004ed4:	00f05e63          	blez	a5,80004ef0 <_ZN4_sem7trywaitEPS_+0x2c>
        return 0;
    }else{
        id->value--;
    80004ed8:	fff7879b          	addiw	a5,a5,-1
    80004edc:	00f52823          	sw	a5,16(a0)
        return 1;
    80004ee0:	00100513          	li	a0,1
    }
    80004ee4:	00813403          	ld	s0,8(sp)
    80004ee8:	01010113          	addi	sp,sp,16
    80004eec:	00008067          	ret
        return 0;
    80004ef0:	00000513          	li	a0,0
    80004ef4:	ff1ff06f          	j	80004ee4 <_ZN4_sem7trywaitEPS_+0x20>

0000000080004ef8 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    80004ef8:	fe010113          	addi	sp,sp,-32
    80004efc:	00113c23          	sd	ra,24(sp)
    80004f00:	00813823          	sd	s0,16(sp)
    80004f04:	00913423          	sd	s1,8(sp)
    80004f08:	02010413          	addi	s0,sp,32
    80004f0c:	00050493          	mv	s1,a0
    assert(singleton == 0);
    80004f10:	0000a797          	auipc	a5,0xa
    80004f14:	3407b783          	ld	a5,832(a5) # 8000f250 <_ZN9Scheduler9singletonE>
    80004f18:	02079463          	bnez	a5,80004f40 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    80004f1c:	0000a797          	auipc	a5,0xa
    80004f20:	3297ba23          	sd	s1,820(a5) # 8000f250 <_ZN9Scheduler9singletonE>
    head = 0;
    80004f24:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80004f28:	0004b423          	sd	zero,8(s1)
}
    80004f2c:	01813083          	ld	ra,24(sp)
    80004f30:	01013403          	ld	s0,16(sp)
    80004f34:	00813483          	ld	s1,8(sp)
    80004f38:	02010113          	addi	sp,sp,32
    80004f3c:	00008067          	ret
    assert(singleton == 0);
    80004f40:	00007697          	auipc	a3,0x7
    80004f44:	54068693          	addi	a3,a3,1344 # 8000c480 <CONSOLE_STATUS+0x470>
    80004f48:	01800613          	li	a2,24
    80004f4c:	00007597          	auipc	a1,0x7
    80004f50:	54c58593          	addi	a1,a1,1356 # 8000c498 <CONSOLE_STATUS+0x488>
    80004f54:	00007517          	auipc	a0,0x7
    80004f58:	55450513          	addi	a0,a0,1364 # 8000c4a8 <CONSOLE_STATUS+0x498>
    80004f5c:	00000097          	auipc	ra,0x0
    80004f60:	3e8080e7          	jalr	1000(ra) # 80005344 <_Z13assert_failedPKcS0_jS0_>
    80004f64:	fb9ff06f          	j	80004f1c <_ZN9SchedulerC1Ev+0x24>

0000000080004f68 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80004f68:	ff010113          	addi	sp,sp,-16
    80004f6c:	00813423          	sd	s0,8(sp)
    80004f70:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    80004f74:	0000a797          	auipc	a5,0xa
    80004f78:	2dc7b783          	ld	a5,732(a5) # 8000f250 <_ZN9Scheduler9singletonE>
    80004f7c:	0007b503          	ld	a0,0(a5)
}
    80004f80:	00153513          	seqz	a0,a0
    80004f84:	00813403          	ld	s0,8(sp)
    80004f88:	01010113          	addi	sp,sp,16
    80004f8c:	00008067          	ret

0000000080004f90 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80004f90:	fe010113          	addi	sp,sp,-32
    80004f94:	00113c23          	sd	ra,24(sp)
    80004f98:	00813823          	sd	s0,16(sp)
    80004f9c:	00913423          	sd	s1,8(sp)
    80004fa0:	01213023          	sd	s2,0(sp)
    80004fa4:	02010413          	addi	s0,sp,32
    80004fa8:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80004fac:	0000a917          	auipc	s2,0xa
    80004fb0:	2a493903          	ld	s2,676(s2) # 8000f250 <_ZN9Scheduler9singletonE>
    80004fb4:	00093783          	ld	a5,0(s2)
    80004fb8:	14078263          	beqz	a5,800050fc <_ZN9Scheduler3putEP7_thread+0x16c>
        singleton->head = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
        singleton->tail = singleton->head;
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80004fbc:	00893903          	ld	s2,8(s2)
    80004fc0:	00100593          	li	a1,1
    80004fc4:	0000a797          	auipc	a5,0xa
    80004fc8:	1dc7b783          	ld	a5,476(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004fcc:	0007b503          	ld	a0,0(a5)
    80004fd0:	ffffe097          	auipc	ra,0xffffe
    80004fd4:	338080e7          	jalr	824(ra) # 80003308 <_ZN11HeapManager12heapAllocateEm>
    80004fd8:	00a90423          	sb	a0,8(s2)
    80004fdc:	00855793          	srli	a5,a0,0x8
    80004fe0:	00f904a3          	sb	a5,9(s2)
    80004fe4:	01055793          	srli	a5,a0,0x10
    80004fe8:	00f90523          	sb	a5,10(s2)
    80004fec:	0185579b          	srliw	a5,a0,0x18
    80004ff0:	00f905a3          	sb	a5,11(s2)
    80004ff4:	02055793          	srli	a5,a0,0x20
    80004ff8:	00f90623          	sb	a5,12(s2)
    80004ffc:	02855793          	srli	a5,a0,0x28
    80005000:	00f906a3          	sb	a5,13(s2)
    80005004:	03055793          	srli	a5,a0,0x30
    80005008:	00f90723          	sb	a5,14(s2)
    8000500c:	03855513          	srli	a0,a0,0x38
    80005010:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    80005014:	0000a617          	auipc	a2,0xa
    80005018:	23c60613          	addi	a2,a2,572 # 8000f250 <_ZN9Scheduler9singletonE>
    8000501c:	00063583          	ld	a1,0(a2)
    80005020:	0085b703          	ld	a4,8(a1)
    80005024:	00874783          	lbu	a5,8(a4)
    80005028:	00974683          	lbu	a3,9(a4)
    8000502c:	00869693          	slli	a3,a3,0x8
    80005030:	00f6e6b3          	or	a3,a3,a5
    80005034:	00a74783          	lbu	a5,10(a4)
    80005038:	01079793          	slli	a5,a5,0x10
    8000503c:	00d7e6b3          	or	a3,a5,a3
    80005040:	00b74783          	lbu	a5,11(a4)
    80005044:	01879793          	slli	a5,a5,0x18
    80005048:	00d7e7b3          	or	a5,a5,a3
    8000504c:	00c74683          	lbu	a3,12(a4)
    80005050:	02069693          	slli	a3,a3,0x20
    80005054:	00f6e7b3          	or	a5,a3,a5
    80005058:	00d74683          	lbu	a3,13(a4)
    8000505c:	02869693          	slli	a3,a3,0x28
    80005060:	00f6e6b3          	or	a3,a3,a5
    80005064:	00e74783          	lbu	a5,14(a4)
    80005068:	03079793          	slli	a5,a5,0x30
    8000506c:	00d7e6b3          	or	a3,a5,a3
    80005070:	00f74783          	lbu	a5,15(a4)
    80005074:	03879793          	slli	a5,a5,0x38
    80005078:	00d7e7b3          	or	a5,a5,a3
    8000507c:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80005080:	00978023          	sb	s1,0(a5)
    80005084:	0084d713          	srli	a4,s1,0x8
    80005088:	00e780a3          	sb	a4,1(a5)
    8000508c:	0104d713          	srli	a4,s1,0x10
    80005090:	00e78123          	sb	a4,2(a5)
    80005094:	0184d71b          	srliw	a4,s1,0x18
    80005098:	00e781a3          	sb	a4,3(a5)
    8000509c:	0204d713          	srli	a4,s1,0x20
    800050a0:	00e78223          	sb	a4,4(a5)
    800050a4:	0284d713          	srli	a4,s1,0x28
    800050a8:	00e782a3          	sb	a4,5(a5)
    800050ac:	0304d713          	srli	a4,s1,0x30
    800050b0:	00e78323          	sb	a4,6(a5)
    800050b4:	0384d493          	srli	s1,s1,0x38
    800050b8:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    800050bc:	00063783          	ld	a5,0(a2)
    800050c0:	0087b783          	ld	a5,8(a5)
    800050c4:	00078423          	sb	zero,8(a5)
    800050c8:	000784a3          	sb	zero,9(a5)
    800050cc:	00078523          	sb	zero,10(a5)
    800050d0:	000785a3          	sb	zero,11(a5)
    800050d4:	00078623          	sb	zero,12(a5)
    800050d8:	000786a3          	sb	zero,13(a5)
    800050dc:	00078723          	sb	zero,14(a5)
    800050e0:	000787a3          	sb	zero,15(a5)
    }
}
    800050e4:	01813083          	ld	ra,24(sp)
    800050e8:	01013403          	ld	s0,16(sp)
    800050ec:	00813483          	ld	s1,8(sp)
    800050f0:	00013903          	ld	s2,0(sp)
    800050f4:	02010113          	addi	sp,sp,32
    800050f8:	00008067          	ret
        singleton->head = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    800050fc:	00100593          	li	a1,1
    80005100:	0000a797          	auipc	a5,0xa
    80005104:	0a07b783          	ld	a5,160(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80005108:	0007b503          	ld	a0,0(a5)
    8000510c:	ffffe097          	auipc	ra,0xffffe
    80005110:	1fc080e7          	jalr	508(ra) # 80003308 <_ZN11HeapManager12heapAllocateEm>
    80005114:	00a93023          	sd	a0,0(s2)
        singleton->tail = singleton->head;
    80005118:	0000a717          	auipc	a4,0xa
    8000511c:	13870713          	addi	a4,a4,312 # 8000f250 <_ZN9Scheduler9singletonE>
    80005120:	00073683          	ld	a3,0(a4)
    80005124:	0006b783          	ld	a5,0(a3)
    80005128:	00f6b423          	sd	a5,8(a3)
        singleton->head->thread = thread;
    8000512c:	00978023          	sb	s1,0(a5)
    80005130:	0084d693          	srli	a3,s1,0x8
    80005134:	00d780a3          	sb	a3,1(a5)
    80005138:	0104d693          	srli	a3,s1,0x10
    8000513c:	00d78123          	sb	a3,2(a5)
    80005140:	0184d69b          	srliw	a3,s1,0x18
    80005144:	00d781a3          	sb	a3,3(a5)
    80005148:	0204d693          	srli	a3,s1,0x20
    8000514c:	00d78223          	sb	a3,4(a5)
    80005150:	0284d693          	srli	a3,s1,0x28
    80005154:	00d782a3          	sb	a3,5(a5)
    80005158:	0304d693          	srli	a3,s1,0x30
    8000515c:	00d78323          	sb	a3,6(a5)
    80005160:	0384d493          	srli	s1,s1,0x38
    80005164:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80005168:	00073783          	ld	a5,0(a4)
    8000516c:	0007b783          	ld	a5,0(a5)
    80005170:	00078423          	sb	zero,8(a5)
    80005174:	000784a3          	sb	zero,9(a5)
    80005178:	00078523          	sb	zero,10(a5)
    8000517c:	000785a3          	sb	zero,11(a5)
    80005180:	00078623          	sb	zero,12(a5)
    80005184:	000786a3          	sb	zero,13(a5)
    80005188:	00078723          	sb	zero,14(a5)
    8000518c:	000787a3          	sb	zero,15(a5)
    80005190:	f55ff06f          	j	800050e4 <_ZN9Scheduler3putEP7_thread+0x154>

0000000080005194 <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    80005194:	fe010113          	addi	sp,sp,-32
    80005198:	00113c23          	sd	ra,24(sp)
    8000519c:	00813823          	sd	s0,16(sp)
    800051a0:	00913423          	sd	s1,8(sp)
    800051a4:	02010413          	addi	s0,sp,32
    if(singleton->head == 0){
    800051a8:	0000a697          	auipc	a3,0xa
    800051ac:	0a86b683          	ld	a3,168(a3) # 8000f250 <_ZN9Scheduler9singletonE>
    800051b0:	0006b583          	ld	a1,0(a3)
    800051b4:	0e058e63          	beqz	a1,800052b0 <_ZN9Scheduler3getEv+0x11c>
        return 0;
    }
    ThreadList* tmp = singleton->head;
    singleton->head = singleton->head->next;
    800051b8:	0085c783          	lbu	a5,8(a1)
    800051bc:	0095c703          	lbu	a4,9(a1)
    800051c0:	00871713          	slli	a4,a4,0x8
    800051c4:	00f76733          	or	a4,a4,a5
    800051c8:	00a5c783          	lbu	a5,10(a1)
    800051cc:	01079793          	slli	a5,a5,0x10
    800051d0:	00e7e733          	or	a4,a5,a4
    800051d4:	00b5c783          	lbu	a5,11(a1)
    800051d8:	01879793          	slli	a5,a5,0x18
    800051dc:	00e7e7b3          	or	a5,a5,a4
    800051e0:	00c5c703          	lbu	a4,12(a1)
    800051e4:	02071713          	slli	a4,a4,0x20
    800051e8:	00f767b3          	or	a5,a4,a5
    800051ec:	00d5c703          	lbu	a4,13(a1)
    800051f0:	02871713          	slli	a4,a4,0x28
    800051f4:	00f76733          	or	a4,a4,a5
    800051f8:	00e5c783          	lbu	a5,14(a1)
    800051fc:	03079793          	slli	a5,a5,0x30
    80005200:	00e7e733          	or	a4,a5,a4
    80005204:	00f5c783          	lbu	a5,15(a1)
    80005208:	03879793          	slli	a5,a5,0x38
    8000520c:	00e7e7b3          	or	a5,a5,a4
    80005210:	00f6b023          	sd	a5,0(a3)
    if(singleton->head == 0){
    80005214:	0000a797          	auipc	a5,0xa
    80005218:	03c7b783          	ld	a5,60(a5) # 8000f250 <_ZN9Scheduler9singletonE>
    8000521c:	0007b703          	ld	a4,0(a5)
    80005220:	08070463          	beqz	a4,800052a8 <_ZN9Scheduler3getEv+0x114>
        singleton->tail = 0;
    }
    thread_t thread = tmp->thread;
    80005224:	0005c483          	lbu	s1,0(a1)
    80005228:	0015c783          	lbu	a5,1(a1)
    8000522c:	00879793          	slli	a5,a5,0x8
    80005230:	0097e7b3          	or	a5,a5,s1
    80005234:	0025c483          	lbu	s1,2(a1)
    80005238:	01049493          	slli	s1,s1,0x10
    8000523c:	00f4e7b3          	or	a5,s1,a5
    80005240:	0035c483          	lbu	s1,3(a1)
    80005244:	01849493          	slli	s1,s1,0x18
    80005248:	00f4e4b3          	or	s1,s1,a5
    8000524c:	0045c783          	lbu	a5,4(a1)
    80005250:	02079793          	slli	a5,a5,0x20
    80005254:	0097e4b3          	or	s1,a5,s1
    80005258:	0055c783          	lbu	a5,5(a1)
    8000525c:	02879793          	slli	a5,a5,0x28
    80005260:	0097e7b3          	or	a5,a5,s1
    80005264:	0065c483          	lbu	s1,6(a1)
    80005268:	03049493          	slli	s1,s1,0x30
    8000526c:	00f4e7b3          	or	a5,s1,a5
    80005270:	0075c483          	lbu	s1,7(a1)
    80005274:	03849493          	slli	s1,s1,0x38
    80005278:	00f4e4b3          	or	s1,s1,a5
    HeapManager::getInstance().heapFree(tmp);
    8000527c:	0000a797          	auipc	a5,0xa
    80005280:	f247b783          	ld	a5,-220(a5) # 8000f1a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80005284:	0007b503          	ld	a0,0(a5)
    80005288:	ffffe097          	auipc	ra,0xffffe
    8000528c:	77c080e7          	jalr	1916(ra) # 80003a04 <_ZN11HeapManager8heapFreeEPv>
    return thread;
}
    80005290:	00048513          	mv	a0,s1
    80005294:	01813083          	ld	ra,24(sp)
    80005298:	01013403          	ld	s0,16(sp)
    8000529c:	00813483          	ld	s1,8(sp)
    800052a0:	02010113          	addi	sp,sp,32
    800052a4:	00008067          	ret
        singleton->tail = 0;
    800052a8:	0007b423          	sd	zero,8(a5)
    800052ac:	f79ff06f          	j	80005224 <_ZN9Scheduler3getEv+0x90>
        return 0;
    800052b0:	00058493          	mv	s1,a1
    800052b4:	fddff06f          	j	80005290 <_ZN9Scheduler3getEv+0xfc>

00000000800052b8 <_ZN9Scheduler8getCountEv>:

int Scheduler::getCount(){
    800052b8:	ff010113          	addi	sp,sp,-16
    800052bc:	00813423          	sd	s0,8(sp)
    800052c0:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    800052c4:	0000a797          	auipc	a5,0xa
    800052c8:	f8c7b783          	ld	a5,-116(a5) # 8000f250 <_ZN9Scheduler9singletonE>
    800052cc:	0007b783          	ld	a5,0(a5)
    int count = 0;
    800052d0:	00000513          	li	a0,0
    while(tmp != 0){
    800052d4:	06078263          	beqz	a5,80005338 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    800052d8:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    800052dc:	0087c683          	lbu	a3,8(a5)
    800052e0:	0097c703          	lbu	a4,9(a5)
    800052e4:	00871713          	slli	a4,a4,0x8
    800052e8:	00d766b3          	or	a3,a4,a3
    800052ec:	00a7c703          	lbu	a4,10(a5)
    800052f0:	01071713          	slli	a4,a4,0x10
    800052f4:	00d76733          	or	a4,a4,a3
    800052f8:	00b7c683          	lbu	a3,11(a5)
    800052fc:	01869693          	slli	a3,a3,0x18
    80005300:	00e6e733          	or	a4,a3,a4
    80005304:	00c7c683          	lbu	a3,12(a5)
    80005308:	02069693          	slli	a3,a3,0x20
    8000530c:	00e6e6b3          	or	a3,a3,a4
    80005310:	00d7c703          	lbu	a4,13(a5)
    80005314:	02871713          	slli	a4,a4,0x28
    80005318:	00d766b3          	or	a3,a4,a3
    8000531c:	00e7c703          	lbu	a4,14(a5)
    80005320:	03071713          	slli	a4,a4,0x30
    80005324:	00d76733          	or	a4,a4,a3
    80005328:	00f7c783          	lbu	a5,15(a5)
    8000532c:	03879793          	slli	a5,a5,0x38
    80005330:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    80005334:	fa1ff06f          	j	800052d4 <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80005338:	00813403          	ld	s0,8(sp)
    8000533c:	01010113          	addi	sp,sp,16
    80005340:	00008067          	ret

0000000080005344 <_Z13assert_failedPKcS0_jS0_>:
 */
#include "assert.h"
#include "syscall_c.h"
#include "consoleManager.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    80005344:	fb010113          	addi	sp,sp,-80
    80005348:	04113423          	sd	ra,72(sp)
    8000534c:	04813023          	sd	s0,64(sp)
    80005350:	02913c23          	sd	s1,56(sp)
    80005354:	03213823          	sd	s2,48(sp)
    80005358:	03313423          	sd	s3,40(sp)
    8000535c:	03413023          	sd	s4,32(sp)
    80005360:	05010413          	addi	s0,sp,80
    80005364:	00050993          	mv	s3,a0
    80005368:	00058493          	mv	s1,a1
    8000536c:	00060913          	mv	s2,a2
    80005370:	00068a13          	mv	s4,a3
    putc('\n');
    80005374:	00a00513          	li	a0,10
    80005378:	ffffd097          	auipc	ra,0xffffd
    8000537c:	cd8080e7          	jalr	-808(ra) # 80002050 <_Z4putcc>
    putc('A');
    80005380:	04100513          	li	a0,65
    80005384:	ffffd097          	auipc	ra,0xffffd
    80005388:	ccc080e7          	jalr	-820(ra) # 80002050 <_Z4putcc>
    putc('s');
    8000538c:	07300513          	li	a0,115
    80005390:	ffffd097          	auipc	ra,0xffffd
    80005394:	cc0080e7          	jalr	-832(ra) # 80002050 <_Z4putcc>
    putc('s');
    80005398:	07300513          	li	a0,115
    8000539c:	ffffd097          	auipc	ra,0xffffd
    800053a0:	cb4080e7          	jalr	-844(ra) # 80002050 <_Z4putcc>
    putc('e');
    800053a4:	06500513          	li	a0,101
    800053a8:	ffffd097          	auipc	ra,0xffffd
    800053ac:	ca8080e7          	jalr	-856(ra) # 80002050 <_Z4putcc>
    putc('r');
    800053b0:	07200513          	li	a0,114
    800053b4:	ffffd097          	auipc	ra,0xffffd
    800053b8:	c9c080e7          	jalr	-868(ra) # 80002050 <_Z4putcc>
    putc('t');
    800053bc:	07400513          	li	a0,116
    800053c0:	ffffd097          	auipc	ra,0xffffd
    800053c4:	c90080e7          	jalr	-880(ra) # 80002050 <_Z4putcc>
    putc('i');
    800053c8:	06900513          	li	a0,105
    800053cc:	ffffd097          	auipc	ra,0xffffd
    800053d0:	c84080e7          	jalr	-892(ra) # 80002050 <_Z4putcc>
    putc('o');
    800053d4:	06f00513          	li	a0,111
    800053d8:	ffffd097          	auipc	ra,0xffffd
    800053dc:	c78080e7          	jalr	-904(ra) # 80002050 <_Z4putcc>
    putc('n');
    800053e0:	06e00513          	li	a0,110
    800053e4:	ffffd097          	auipc	ra,0xffffd
    800053e8:	c6c080e7          	jalr	-916(ra) # 80002050 <_Z4putcc>
    putc(' ');
    800053ec:	02000513          	li	a0,32
    800053f0:	ffffd097          	auipc	ra,0xffffd
    800053f4:	c60080e7          	jalr	-928(ra) # 80002050 <_Z4putcc>
    putc('\'');
    800053f8:	02700513          	li	a0,39
    800053fc:	ffffd097          	auipc	ra,0xffffd
    80005400:	c54080e7          	jalr	-940(ra) # 80002050 <_Z4putcc>
    while(*__assertion != 0){
    80005404:	0009c503          	lbu	a0,0(s3)
    80005408:	00050a63          	beqz	a0,8000541c <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    8000540c:	ffffd097          	auipc	ra,0xffffd
    80005410:	c44080e7          	jalr	-956(ra) # 80002050 <_Z4putcc>
        __assertion++;
    80005414:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    80005418:	fedff06f          	j	80005404 <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    8000541c:	02700513          	li	a0,39
    80005420:	ffffd097          	auipc	ra,0xffffd
    80005424:	c30080e7          	jalr	-976(ra) # 80002050 <_Z4putcc>
    putc(' ');
    80005428:	02000513          	li	a0,32
    8000542c:	ffffd097          	auipc	ra,0xffffd
    80005430:	c24080e7          	jalr	-988(ra) # 80002050 <_Z4putcc>
    putc('f');
    80005434:	06600513          	li	a0,102
    80005438:	ffffd097          	auipc	ra,0xffffd
    8000543c:	c18080e7          	jalr	-1000(ra) # 80002050 <_Z4putcc>
    putc('a');
    80005440:	06100513          	li	a0,97
    80005444:	ffffd097          	auipc	ra,0xffffd
    80005448:	c0c080e7          	jalr	-1012(ra) # 80002050 <_Z4putcc>
    putc('i');
    8000544c:	06900513          	li	a0,105
    80005450:	ffffd097          	auipc	ra,0xffffd
    80005454:	c00080e7          	jalr	-1024(ra) # 80002050 <_Z4putcc>
    putc('l');
    80005458:	06c00513          	li	a0,108
    8000545c:	ffffd097          	auipc	ra,0xffffd
    80005460:	bf4080e7          	jalr	-1036(ra) # 80002050 <_Z4putcc>
    putc('e');
    80005464:	06500513          	li	a0,101
    80005468:	ffffd097          	auipc	ra,0xffffd
    8000546c:	be8080e7          	jalr	-1048(ra) # 80002050 <_Z4putcc>
    putc('d');
    80005470:	06400513          	li	a0,100
    80005474:	ffffd097          	auipc	ra,0xffffd
    80005478:	bdc080e7          	jalr	-1060(ra) # 80002050 <_Z4putcc>
    putc(' ');
    8000547c:	02000513          	li	a0,32
    80005480:	ffffd097          	auipc	ra,0xffffd
    80005484:	bd0080e7          	jalr	-1072(ra) # 80002050 <_Z4putcc>
    putc('i');
    80005488:	06900513          	li	a0,105
    8000548c:	ffffd097          	auipc	ra,0xffffd
    80005490:	bc4080e7          	jalr	-1084(ra) # 80002050 <_Z4putcc>
    putc('n');
    80005494:	06e00513          	li	a0,110
    80005498:	ffffd097          	auipc	ra,0xffffd
    8000549c:	bb8080e7          	jalr	-1096(ra) # 80002050 <_Z4putcc>
    putc(' ');
    800054a0:	02000513          	li	a0,32
    800054a4:	ffffd097          	auipc	ra,0xffffd
    800054a8:	bac080e7          	jalr	-1108(ra) # 80002050 <_Z4putcc>
    putc('f');
    800054ac:	06600513          	li	a0,102
    800054b0:	ffffd097          	auipc	ra,0xffffd
    800054b4:	ba0080e7          	jalr	-1120(ra) # 80002050 <_Z4putcc>
    putc('i');
    800054b8:	06900513          	li	a0,105
    800054bc:	ffffd097          	auipc	ra,0xffffd
    800054c0:	b94080e7          	jalr	-1132(ra) # 80002050 <_Z4putcc>
    putc('l');
    800054c4:	06c00513          	li	a0,108
    800054c8:	ffffd097          	auipc	ra,0xffffd
    800054cc:	b88080e7          	jalr	-1144(ra) # 80002050 <_Z4putcc>
    putc('e');
    800054d0:	06500513          	li	a0,101
    800054d4:	ffffd097          	auipc	ra,0xffffd
    800054d8:	b7c080e7          	jalr	-1156(ra) # 80002050 <_Z4putcc>
    putc(':');
    800054dc:	03a00513          	li	a0,58
    800054e0:	ffffd097          	auipc	ra,0xffffd
    800054e4:	b70080e7          	jalr	-1168(ra) # 80002050 <_Z4putcc>
    putc(' ');
    800054e8:	02000513          	li	a0,32
    800054ec:	ffffd097          	auipc	ra,0xffffd
    800054f0:	b64080e7          	jalr	-1180(ra) # 80002050 <_Z4putcc>
    while(*__file != 0){
    800054f4:	0004c503          	lbu	a0,0(s1)
    800054f8:	00050a63          	beqz	a0,8000550c <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    800054fc:	ffffd097          	auipc	ra,0xffffd
    80005500:	b54080e7          	jalr	-1196(ra) # 80002050 <_Z4putcc>
        __file++;
    80005504:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    80005508:	fedff06f          	j	800054f4 <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    8000550c:	00a00513          	li	a0,10
    80005510:	ffffd097          	auipc	ra,0xffffd
    80005514:	b40080e7          	jalr	-1216(ra) # 80002050 <_Z4putcc>
    putc('l');
    80005518:	06c00513          	li	a0,108
    8000551c:	ffffd097          	auipc	ra,0xffffd
    80005520:	b34080e7          	jalr	-1228(ra) # 80002050 <_Z4putcc>
    putc('i');
    80005524:	06900513          	li	a0,105
    80005528:	ffffd097          	auipc	ra,0xffffd
    8000552c:	b28080e7          	jalr	-1240(ra) # 80002050 <_Z4putcc>
    putc('n');
    80005530:	06e00513          	li	a0,110
    80005534:	ffffd097          	auipc	ra,0xffffd
    80005538:	b1c080e7          	jalr	-1252(ra) # 80002050 <_Z4putcc>
    putc('e');
    8000553c:	06500513          	li	a0,101
    80005540:	ffffd097          	auipc	ra,0xffffd
    80005544:	b10080e7          	jalr	-1264(ra) # 80002050 <_Z4putcc>
    putc(':');
    80005548:	03a00513          	li	a0,58
    8000554c:	ffffd097          	auipc	ra,0xffffd
    80005550:	b04080e7          	jalr	-1276(ra) # 80002050 <_Z4putcc>
    putc(' ');
    80005554:	02000513          	li	a0,32
    80005558:	ffffd097          	auipc	ra,0xffffd
    8000555c:	af8080e7          	jalr	-1288(ra) # 80002050 <_Z4putcc>
    char buffer[20];
    int i = 0;
    80005560:	00000493          	li	s1,0
    while(__line != 0){
    80005564:	02090463          	beqz	s2,8000558c <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80005568:	00a00713          	li	a4,10
    8000556c:	02e977bb          	remuw	a5,s2,a4
    80005570:	0307879b          	addiw	a5,a5,48
    80005574:	fd040693          	addi	a3,s0,-48
    80005578:	009686b3          	add	a3,a3,s1
    8000557c:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    80005580:	02e9593b          	divuw	s2,s2,a4
        i++;
    80005584:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    80005588:	fddff06f          	j	80005564 <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    8000558c:	02048063          	beqz	s1,800055ac <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    80005590:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    80005594:	fd040793          	addi	a5,s0,-48
    80005598:	009787b3          	add	a5,a5,s1
    8000559c:	fe87c503          	lbu	a0,-24(a5)
    800055a0:	ffffd097          	auipc	ra,0xffffd
    800055a4:	ab0080e7          	jalr	-1360(ra) # 80002050 <_Z4putcc>
    800055a8:	fe5ff06f          	j	8000558c <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    800055ac:	00a00513          	li	a0,10
    800055b0:	ffffd097          	auipc	ra,0xffffd
    800055b4:	aa0080e7          	jalr	-1376(ra) # 80002050 <_Z4putcc>
    putc('f');
    800055b8:	06600513          	li	a0,102
    800055bc:	ffffd097          	auipc	ra,0xffffd
    800055c0:	a94080e7          	jalr	-1388(ra) # 80002050 <_Z4putcc>
    putc('u');
    800055c4:	07500513          	li	a0,117
    800055c8:	ffffd097          	auipc	ra,0xffffd
    800055cc:	a88080e7          	jalr	-1400(ra) # 80002050 <_Z4putcc>
    putc('n');
    800055d0:	06e00513          	li	a0,110
    800055d4:	ffffd097          	auipc	ra,0xffffd
    800055d8:	a7c080e7          	jalr	-1412(ra) # 80002050 <_Z4putcc>
    putc('c');
    800055dc:	06300513          	li	a0,99
    800055e0:	ffffd097          	auipc	ra,0xffffd
    800055e4:	a70080e7          	jalr	-1424(ra) # 80002050 <_Z4putcc>
    putc('t');
    800055e8:	07400513          	li	a0,116
    800055ec:	ffffd097          	auipc	ra,0xffffd
    800055f0:	a64080e7          	jalr	-1436(ra) # 80002050 <_Z4putcc>
    putc('i');
    800055f4:	06900513          	li	a0,105
    800055f8:	ffffd097          	auipc	ra,0xffffd
    800055fc:	a58080e7          	jalr	-1448(ra) # 80002050 <_Z4putcc>
    putc('o');
    80005600:	06f00513          	li	a0,111
    80005604:	ffffd097          	auipc	ra,0xffffd
    80005608:	a4c080e7          	jalr	-1460(ra) # 80002050 <_Z4putcc>
    putc('n');
    8000560c:	06e00513          	li	a0,110
    80005610:	ffffd097          	auipc	ra,0xffffd
    80005614:	a40080e7          	jalr	-1472(ra) # 80002050 <_Z4putcc>
    putc(':');
    80005618:	03a00513          	li	a0,58
    8000561c:	ffffd097          	auipc	ra,0xffffd
    80005620:	a34080e7          	jalr	-1484(ra) # 80002050 <_Z4putcc>
    putc(' ');
    80005624:	02000513          	li	a0,32
    80005628:	ffffd097          	auipc	ra,0xffffd
    8000562c:	a28080e7          	jalr	-1496(ra) # 80002050 <_Z4putcc>
    putc('\'');
    80005630:	02700513          	li	a0,39
    80005634:	ffffd097          	auipc	ra,0xffffd
    80005638:	a1c080e7          	jalr	-1508(ra) # 80002050 <_Z4putcc>
    while(*__function != 0){
    8000563c:	000a4503          	lbu	a0,0(s4)
    80005640:	00050a63          	beqz	a0,80005654 <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    80005644:	ffffd097          	auipc	ra,0xffffd
    80005648:	a0c080e7          	jalr	-1524(ra) # 80002050 <_Z4putcc>
        __function ++;
    8000564c:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80005650:	fedff06f          	j	8000563c <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    80005654:	02700513          	li	a0,39
    80005658:	ffffd097          	auipc	ra,0xffffd
    8000565c:	9f8080e7          	jalr	-1544(ra) # 80002050 <_Z4putcc>
    putc('\n');
    80005660:	00a00513          	li	a0,10
    80005664:	ffffd097          	auipc	ra,0xffffd
    80005668:	9ec080e7          	jalr	-1556(ra) # 80002050 <_Z4putcc>
    while(1);
    8000566c:	0000006f          	j	8000566c <_Z13assert_failedPKcS0_jS0_+0x328>

0000000080005670 <_Z4testPv>:
    /// initialise the console
    console.getInstance().init();
    return;
}

void test(void* arg){
    80005670:	ff010113          	addi	sp,sp,-16
    80005674:	00113423          	sd	ra,8(sp)
    80005678:	00813023          	sd	s0,0(sp)
    8000567c:	01010413          	addi	s0,sp,16
    // usermain(arg);
    userMain();
    80005680:	00001097          	auipc	ra,0x1
    80005684:	444080e7          	jalr	1092(ra) # 80006ac4 <_Z8userMainv>
}
    80005688:	00813083          	ld	ra,8(sp)
    8000568c:	00013403          	ld	s0,0(sp)
    80005690:	01010113          	addi	sp,sp,16
    80005694:	00008067          	ret

0000000080005698 <_Z15consoleConsumerPv>:


void consoleConsumer(void* arg){
    80005698:	ff010113          	addi	sp,sp,-16
    8000569c:	00113423          	sd	ra,8(sp)
    800056a0:	00813023          	sd	s0,0(sp)
    800056a4:	01010413          	addi	s0,sp,16
    ConsoleManager::outputHandler();
    800056a8:	ffffe097          	auipc	ra,0xffffe
    800056ac:	86c080e7          	jalr	-1940(ra) # 80002f14 <_ZN14ConsoleManager13outputHandlerEv>
}
    800056b0:	00813083          	ld	ra,8(sp)
    800056b4:	00013403          	ld	s0,0(sp)
    800056b8:	01010113          	addi	sp,sp,16
    800056bc:	00008067          	ret

00000000800056c0 <_ZN6KernelC1Ev>:
Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    800056c0:	fd010113          	addi	sp,sp,-48
    800056c4:	02113423          	sd	ra,40(sp)
    800056c8:	02813023          	sd	s0,32(sp)
    800056cc:	00913c23          	sd	s1,24(sp)
    800056d0:	01213823          	sd	s2,16(sp)
    800056d4:	01313423          	sd	s3,8(sp)
    800056d8:	03010413          	addi	s0,sp,48
    800056dc:	00050493          	mv	s1,a0
    800056e0:	ffffe097          	auipc	ra,0xffffe
    800056e4:	928080e7          	jalr	-1752(ra) # 80003008 <_ZN11HeapManagerC1Ev>
    800056e8:	00848513          	addi	a0,s1,8
    800056ec:	00000097          	auipc	ra,0x0
    800056f0:	80c080e7          	jalr	-2036(ra) # 80004ef8 <_ZN9SchedulerC1Ev>
    800056f4:	01848913          	addi	s2,s1,24
    800056f8:	00090513          	mv	a0,s2
    800056fc:	fffff097          	auipc	ra,0xfffff
    80005700:	2e8080e7          	jalr	744(ra) # 800049e4 <_ZN5TimerC1Ev>
    80005704:	02848513          	addi	a0,s1,40
    80005708:	ffffd097          	auipc	ra,0xffffd
    8000570c:	4c8080e7          	jalr	1224(ra) # 80002bd0 <_ZN14ConsoleManagerC1Ev>
    80005710:	0380006f          	j	80005748 <_ZN6KernelC1Ev+0x88>
    80005714:	00050993          	mv	s3,a0
    80005718:	00090513          	mv	a0,s2
    8000571c:	fffff097          	auipc	ra,0xfffff
    80005720:	338080e7          	jalr	824(ra) # 80004a54 <_ZN5TimerD1Ev>
    80005724:	00098913          	mv	s2,s3
    80005728:	00048513          	mv	a0,s1
    8000572c:	ffffe097          	auipc	ra,0xffffe
    80005730:	944080e7          	jalr	-1724(ra) # 80003070 <_ZN11HeapManagerD1Ev>
    80005734:	00090513          	mv	a0,s2
    80005738:	0000b097          	auipc	ra,0xb
    8000573c:	c40080e7          	jalr	-960(ra) # 80010378 <_Unwind_Resume>
    80005740:	00050913          	mv	s2,a0
    80005744:	fe5ff06f          	j	80005728 <_ZN6KernelC1Ev+0x68>
    80005748:	02813083          	ld	ra,40(sp)
    8000574c:	02013403          	ld	s0,32(sp)
    80005750:	01813483          	ld	s1,24(sp)
    80005754:	01013903          	ld	s2,16(sp)
    80005758:	00813983          	ld	s3,8(sp)
    8000575c:	03010113          	addi	sp,sp,48
    80005760:	00008067          	ret

0000000080005764 <_ZN6Kernel10initialiseEv>:
void Kernel::initialise(){
    80005764:	ff010113          	addi	sp,sp,-16
    80005768:	00113423          	sd	ra,8(sp)
    8000576c:	00813023          	sd	s0,0(sp)
    80005770:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80005774:	0000a797          	auipc	a5,0xa
    80005778:	a3c7b783          	ld	a5,-1476(a5) # 8000f1b0 <_GLOBAL_OFFSET_TABLE_+0x38>
    8000577c:	10579073          	csrw	stvec,a5
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );
    80005780:	0000a797          	auipc	a5,0xa
    80005784:	a387b783          	ld	a5,-1480(a5) # 8000f1b8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80005788:	0007b603          	ld	a2,0(a5)
    8000578c:	0000a797          	auipc	a5,0xa
    80005790:	a047b783          	ld	a5,-1532(a5) # 8000f190 <_GLOBAL_OFFSET_TABLE_+0x18>
    80005794:	0007b583          	ld	a1,0(a5)
    80005798:	ffffe097          	auipc	ra,0xffffe
    8000579c:	8f0080e7          	jalr	-1808(ra) # 80003088 <_ZN11HeapManager4initEmm>
    console.getInstance().init();
    800057a0:	ffffd097          	auipc	ra,0xffffd
    800057a4:	3a0080e7          	jalr	928(ra) # 80002b40 <_ZN14ConsoleManager11getInstanceEv>
    800057a8:	ffffd097          	auipc	ra,0xffffd
    800057ac:	554080e7          	jalr	1364(ra) # 80002cfc <_ZN14ConsoleManager4initEv>
}
    800057b0:	00813083          	ld	ra,8(sp)
    800057b4:	00013403          	ld	s0,0(sp)
    800057b8:	01010113          	addi	sp,sp,16
    800057bc:	00008067          	ret

00000000800057c0 <_ZN6Kernel3runEv>:


Kernel::EXIT_CODE Kernel::run(){
    800057c0:	fd010113          	addi	sp,sp,-48
    800057c4:	02113423          	sd	ra,40(sp)
    800057c8:	02813023          	sd	s0,32(sp)
    800057cc:	03010413          	addi	s0,sp,48

    thread_t kernelThread;
    
    void* stack = reinterpret_cast<void*>(reinterpret_cast<uint64>(mem_alloc(DEFAULT_STACK_SIZE)) + DEFAULT_STACK_SIZE - 1);
    800057d0:	00001537          	lui	a0,0x1
    800057d4:	ffffc097          	auipc	ra,0xffffc
    800057d8:	5d4080e7          	jalr	1492(ra) # 80001da8 <_Z9mem_allocm>
    _thread::create(&kernelThread, 0, 0, stack, false);
    800057dc:	00000713          	li	a4,0
    800057e0:	000017b7          	lui	a5,0x1
    800057e4:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800057e8:	00f506b3          	add	a3,a0,a5
    800057ec:	00000613          	li	a2,0
    800057f0:	00000593          	li	a1,0
    800057f4:	fe840513          	addi	a0,s0,-24
    800057f8:	ffffd097          	auipc	ra,0xffffd
    800057fc:	a60080e7          	jalr	-1440(ra) # 80002258 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
    _thread::currentThread = kernelThread;
    80005800:	0000a797          	auipc	a5,0xa
    80005804:	9c07b783          	ld	a5,-1600(a5) # 8000f1c0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80005808:	fe843703          	ld	a4,-24(s0)
    8000580c:	00e7b023          	sd	a4,0(a5)


    thread_t consoleThread;
    thread_create(&consoleThread, consoleConsumer, 0);
    80005810:	00000613          	li	a2,0
    80005814:	00000597          	auipc	a1,0x0
    80005818:	e8458593          	addi	a1,a1,-380 # 80005698 <_Z15consoleConsumerPv>
    8000581c:	fe040513          	addi	a0,s0,-32
    80005820:	ffffc097          	auipc	ra,0xffffc
    80005824:	5e4080e7          	jalr	1508(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>

    /// enable external hardware interrupts
    __asm__ volatile ("csrs sie, %0" :: "r"(1<<9));
    80005828:	20000793          	li	a5,512
    8000582c:	1047a073          	csrs	sie,a5

    /// enable software interrupts
    __asm__ volatile ("csrs sstatus, %0" :: "r"(1<<1));
    80005830:	00200793          	li	a5,2
    80005834:	1007a073          	csrs	sstatus,a5


    thread_t userThread;
    thread_create(&userThread, test, 0);
    80005838:	00000613          	li	a2,0
    8000583c:	00000597          	auipc	a1,0x0
    80005840:	e3458593          	addi	a1,a1,-460 # 80005670 <_Z4testPv>
    80005844:	fd840513          	addi	a0,s0,-40
    80005848:	ffffc097          	auipc	ra,0xffffc
    8000584c:	5bc080e7          	jalr	1468(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    while(!userThread->finished){
    80005850:	fd843783          	ld	a5,-40(s0)
    80005854:	0a07b783          	ld	a5,160(a5)
    80005858:	0087f793          	andi	a5,a5,8
    8000585c:	00079863          	bnez	a5,8000586c <_ZN6Kernel3runEv+0xac>
        thread_dispatch();
    80005860:	ffffc097          	auipc	ra,0xffffc
    80005864:	640080e7          	jalr	1600(ra) # 80001ea0 <_Z15thread_dispatchv>
    80005868:	fe9ff06f          	j	80005850 <_ZN6Kernel3runEv+0x90>
    }


    return EXIT_SUCCESS;
}
    8000586c:	00000513          	li	a0,0
    80005870:	02813083          	ld	ra,40(sp)
    80005874:	02013403          	ld	s0,32(sp)
    80005878:	03010113          	addi	sp,sp,48
    8000587c:	00008067          	ret

0000000080005880 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005880:	fe010113          	addi	sp,sp,-32
    80005884:	00113c23          	sd	ra,24(sp)
    80005888:	00813823          	sd	s0,16(sp)
    8000588c:	00913423          	sd	s1,8(sp)
    80005890:	01213023          	sd	s2,0(sp)
    80005894:	02010413          	addi	s0,sp,32
    80005898:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000589c:	00100793          	li	a5,1
    800058a0:	02a7f863          	bgeu	a5,a0,800058d0 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800058a4:	00a00793          	li	a5,10
    800058a8:	02f577b3          	remu	a5,a0,a5
    800058ac:	02078e63          	beqz	a5,800058e8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800058b0:	fff48513          	addi	a0,s1,-1
    800058b4:	00000097          	auipc	ra,0x0
    800058b8:	fcc080e7          	jalr	-52(ra) # 80005880 <_ZL9fibonaccim>
    800058bc:	00050913          	mv	s2,a0
    800058c0:	ffe48513          	addi	a0,s1,-2
    800058c4:	00000097          	auipc	ra,0x0
    800058c8:	fbc080e7          	jalr	-68(ra) # 80005880 <_ZL9fibonaccim>
    800058cc:	00a90533          	add	a0,s2,a0
}
    800058d0:	01813083          	ld	ra,24(sp)
    800058d4:	01013403          	ld	s0,16(sp)
    800058d8:	00813483          	ld	s1,8(sp)
    800058dc:	00013903          	ld	s2,0(sp)
    800058e0:	02010113          	addi	sp,sp,32
    800058e4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800058e8:	ffffc097          	auipc	ra,0xffffc
    800058ec:	5b8080e7          	jalr	1464(ra) # 80001ea0 <_Z15thread_dispatchv>
    800058f0:	fc1ff06f          	j	800058b0 <_ZL9fibonaccim+0x30>

00000000800058f4 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800058f4:	fe010113          	addi	sp,sp,-32
    800058f8:	00113c23          	sd	ra,24(sp)
    800058fc:	00813823          	sd	s0,16(sp)
    80005900:	00913423          	sd	s1,8(sp)
    80005904:	01213023          	sd	s2,0(sp)
    80005908:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000590c:	00a00493          	li	s1,10
    80005910:	0400006f          	j	80005950 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005914:	00007517          	auipc	a0,0x7
    80005918:	ba450513          	addi	a0,a0,-1116 # 8000c4b8 <CONSOLE_STATUS+0x4a8>
    8000591c:	00001097          	auipc	ra,0x1
    80005920:	728080e7          	jalr	1832(ra) # 80007044 <_Z11printStringPKc>
    80005924:	00000613          	li	a2,0
    80005928:	00a00593          	li	a1,10
    8000592c:	00048513          	mv	a0,s1
    80005930:	00002097          	auipc	ra,0x2
    80005934:	8c4080e7          	jalr	-1852(ra) # 800071f4 <_Z8printIntiii>
    80005938:	00007517          	auipc	a0,0x7
    8000593c:	f3050513          	addi	a0,a0,-208 # 8000c868 <CONSOLE_STATUS+0x858>
    80005940:	00001097          	auipc	ra,0x1
    80005944:	704080e7          	jalr	1796(ra) # 80007044 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005948:	0014849b          	addiw	s1,s1,1
    8000594c:	0ff4f493          	andi	s1,s1,255
    80005950:	00c00793          	li	a5,12
    80005954:	fc97f0e3          	bgeu	a5,s1,80005914 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005958:	00007517          	auipc	a0,0x7
    8000595c:	b6850513          	addi	a0,a0,-1176 # 8000c4c0 <CONSOLE_STATUS+0x4b0>
    80005960:	00001097          	auipc	ra,0x1
    80005964:	6e4080e7          	jalr	1764(ra) # 80007044 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005968:	00500313          	li	t1,5
    thread_dispatch();
    8000596c:	ffffc097          	auipc	ra,0xffffc
    80005970:	534080e7          	jalr	1332(ra) # 80001ea0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005974:	01000513          	li	a0,16
    80005978:	00000097          	auipc	ra,0x0
    8000597c:	f08080e7          	jalr	-248(ra) # 80005880 <_ZL9fibonaccim>
    80005980:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005984:	00007517          	auipc	a0,0x7
    80005988:	b4c50513          	addi	a0,a0,-1204 # 8000c4d0 <CONSOLE_STATUS+0x4c0>
    8000598c:	00001097          	auipc	ra,0x1
    80005990:	6b8080e7          	jalr	1720(ra) # 80007044 <_Z11printStringPKc>
    80005994:	00000613          	li	a2,0
    80005998:	00a00593          	li	a1,10
    8000599c:	0009051b          	sext.w	a0,s2
    800059a0:	00002097          	auipc	ra,0x2
    800059a4:	854080e7          	jalr	-1964(ra) # 800071f4 <_Z8printIntiii>
    800059a8:	00007517          	auipc	a0,0x7
    800059ac:	ec050513          	addi	a0,a0,-320 # 8000c868 <CONSOLE_STATUS+0x858>
    800059b0:	00001097          	auipc	ra,0x1
    800059b4:	694080e7          	jalr	1684(ra) # 80007044 <_Z11printStringPKc>
    800059b8:	0400006f          	j	800059f8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800059bc:	00007517          	auipc	a0,0x7
    800059c0:	afc50513          	addi	a0,a0,-1284 # 8000c4b8 <CONSOLE_STATUS+0x4a8>
    800059c4:	00001097          	auipc	ra,0x1
    800059c8:	680080e7          	jalr	1664(ra) # 80007044 <_Z11printStringPKc>
    800059cc:	00000613          	li	a2,0
    800059d0:	00a00593          	li	a1,10
    800059d4:	00048513          	mv	a0,s1
    800059d8:	00002097          	auipc	ra,0x2
    800059dc:	81c080e7          	jalr	-2020(ra) # 800071f4 <_Z8printIntiii>
    800059e0:	00007517          	auipc	a0,0x7
    800059e4:	e8850513          	addi	a0,a0,-376 # 8000c868 <CONSOLE_STATUS+0x858>
    800059e8:	00001097          	auipc	ra,0x1
    800059ec:	65c080e7          	jalr	1628(ra) # 80007044 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800059f0:	0014849b          	addiw	s1,s1,1
    800059f4:	0ff4f493          	andi	s1,s1,255
    800059f8:	00f00793          	li	a5,15
    800059fc:	fc97f0e3          	bgeu	a5,s1,800059bc <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005a00:	00007517          	auipc	a0,0x7
    80005a04:	ae050513          	addi	a0,a0,-1312 # 8000c4e0 <CONSOLE_STATUS+0x4d0>
    80005a08:	00001097          	auipc	ra,0x1
    80005a0c:	63c080e7          	jalr	1596(ra) # 80007044 <_Z11printStringPKc>
    finishedD = true;
    80005a10:	00100793          	li	a5,1
    80005a14:	0000a717          	auipc	a4,0xa
    80005a18:	84f70223          	sb	a5,-1980(a4) # 8000f258 <_ZL9finishedD>
    thread_dispatch();
    80005a1c:	ffffc097          	auipc	ra,0xffffc
    80005a20:	484080e7          	jalr	1156(ra) # 80001ea0 <_Z15thread_dispatchv>
}
    80005a24:	01813083          	ld	ra,24(sp)
    80005a28:	01013403          	ld	s0,16(sp)
    80005a2c:	00813483          	ld	s1,8(sp)
    80005a30:	00013903          	ld	s2,0(sp)
    80005a34:	02010113          	addi	sp,sp,32
    80005a38:	00008067          	ret

0000000080005a3c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005a3c:	fe010113          	addi	sp,sp,-32
    80005a40:	00113c23          	sd	ra,24(sp)
    80005a44:	00813823          	sd	s0,16(sp)
    80005a48:	00913423          	sd	s1,8(sp)
    80005a4c:	01213023          	sd	s2,0(sp)
    80005a50:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005a54:	00000493          	li	s1,0
    80005a58:	0400006f          	j	80005a98 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005a5c:	00007517          	auipc	a0,0x7
    80005a60:	a9450513          	addi	a0,a0,-1388 # 8000c4f0 <CONSOLE_STATUS+0x4e0>
    80005a64:	00001097          	auipc	ra,0x1
    80005a68:	5e0080e7          	jalr	1504(ra) # 80007044 <_Z11printStringPKc>
    80005a6c:	00000613          	li	a2,0
    80005a70:	00a00593          	li	a1,10
    80005a74:	00048513          	mv	a0,s1
    80005a78:	00001097          	auipc	ra,0x1
    80005a7c:	77c080e7          	jalr	1916(ra) # 800071f4 <_Z8printIntiii>
    80005a80:	00007517          	auipc	a0,0x7
    80005a84:	de850513          	addi	a0,a0,-536 # 8000c868 <CONSOLE_STATUS+0x858>
    80005a88:	00001097          	auipc	ra,0x1
    80005a8c:	5bc080e7          	jalr	1468(ra) # 80007044 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005a90:	0014849b          	addiw	s1,s1,1
    80005a94:	0ff4f493          	andi	s1,s1,255
    80005a98:	00200793          	li	a5,2
    80005a9c:	fc97f0e3          	bgeu	a5,s1,80005a5c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005aa0:	00007517          	auipc	a0,0x7
    80005aa4:	a5850513          	addi	a0,a0,-1448 # 8000c4f8 <CONSOLE_STATUS+0x4e8>
    80005aa8:	00001097          	auipc	ra,0x1
    80005aac:	59c080e7          	jalr	1436(ra) # 80007044 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005ab0:	00700313          	li	t1,7
    thread_dispatch();
    80005ab4:	ffffc097          	auipc	ra,0xffffc
    80005ab8:	3ec080e7          	jalr	1004(ra) # 80001ea0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005abc:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005ac0:	00007517          	auipc	a0,0x7
    80005ac4:	a4850513          	addi	a0,a0,-1464 # 8000c508 <CONSOLE_STATUS+0x4f8>
    80005ac8:	00001097          	auipc	ra,0x1
    80005acc:	57c080e7          	jalr	1404(ra) # 80007044 <_Z11printStringPKc>
    80005ad0:	00000613          	li	a2,0
    80005ad4:	00a00593          	li	a1,10
    80005ad8:	0009051b          	sext.w	a0,s2
    80005adc:	00001097          	auipc	ra,0x1
    80005ae0:	718080e7          	jalr	1816(ra) # 800071f4 <_Z8printIntiii>
    80005ae4:	00007517          	auipc	a0,0x7
    80005ae8:	d8450513          	addi	a0,a0,-636 # 8000c868 <CONSOLE_STATUS+0x858>
    80005aec:	00001097          	auipc	ra,0x1
    80005af0:	558080e7          	jalr	1368(ra) # 80007044 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005af4:	00c00513          	li	a0,12
    80005af8:	00000097          	auipc	ra,0x0
    80005afc:	d88080e7          	jalr	-632(ra) # 80005880 <_ZL9fibonaccim>
    80005b00:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005b04:	00007517          	auipc	a0,0x7
    80005b08:	a0c50513          	addi	a0,a0,-1524 # 8000c510 <CONSOLE_STATUS+0x500>
    80005b0c:	00001097          	auipc	ra,0x1
    80005b10:	538080e7          	jalr	1336(ra) # 80007044 <_Z11printStringPKc>
    80005b14:	00000613          	li	a2,0
    80005b18:	00a00593          	li	a1,10
    80005b1c:	0009051b          	sext.w	a0,s2
    80005b20:	00001097          	auipc	ra,0x1
    80005b24:	6d4080e7          	jalr	1748(ra) # 800071f4 <_Z8printIntiii>
    80005b28:	00007517          	auipc	a0,0x7
    80005b2c:	d4050513          	addi	a0,a0,-704 # 8000c868 <CONSOLE_STATUS+0x858>
    80005b30:	00001097          	auipc	ra,0x1
    80005b34:	514080e7          	jalr	1300(ra) # 80007044 <_Z11printStringPKc>
    80005b38:	0400006f          	j	80005b78 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005b3c:	00007517          	auipc	a0,0x7
    80005b40:	9b450513          	addi	a0,a0,-1612 # 8000c4f0 <CONSOLE_STATUS+0x4e0>
    80005b44:	00001097          	auipc	ra,0x1
    80005b48:	500080e7          	jalr	1280(ra) # 80007044 <_Z11printStringPKc>
    80005b4c:	00000613          	li	a2,0
    80005b50:	00a00593          	li	a1,10
    80005b54:	00048513          	mv	a0,s1
    80005b58:	00001097          	auipc	ra,0x1
    80005b5c:	69c080e7          	jalr	1692(ra) # 800071f4 <_Z8printIntiii>
    80005b60:	00007517          	auipc	a0,0x7
    80005b64:	d0850513          	addi	a0,a0,-760 # 8000c868 <CONSOLE_STATUS+0x858>
    80005b68:	00001097          	auipc	ra,0x1
    80005b6c:	4dc080e7          	jalr	1244(ra) # 80007044 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005b70:	0014849b          	addiw	s1,s1,1
    80005b74:	0ff4f493          	andi	s1,s1,255
    80005b78:	00500793          	li	a5,5
    80005b7c:	fc97f0e3          	bgeu	a5,s1,80005b3c <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005b80:	00007517          	auipc	a0,0x7
    80005b84:	9a050513          	addi	a0,a0,-1632 # 8000c520 <CONSOLE_STATUS+0x510>
    80005b88:	00001097          	auipc	ra,0x1
    80005b8c:	4bc080e7          	jalr	1212(ra) # 80007044 <_Z11printStringPKc>
    finishedC = true;
    80005b90:	00100793          	li	a5,1
    80005b94:	00009717          	auipc	a4,0x9
    80005b98:	6cf702a3          	sb	a5,1733(a4) # 8000f259 <_ZL9finishedC>
    thread_dispatch();
    80005b9c:	ffffc097          	auipc	ra,0xffffc
    80005ba0:	304080e7          	jalr	772(ra) # 80001ea0 <_Z15thread_dispatchv>
}
    80005ba4:	01813083          	ld	ra,24(sp)
    80005ba8:	01013403          	ld	s0,16(sp)
    80005bac:	00813483          	ld	s1,8(sp)
    80005bb0:	00013903          	ld	s2,0(sp)
    80005bb4:	02010113          	addi	sp,sp,32
    80005bb8:	00008067          	ret

0000000080005bbc <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005bbc:	fe010113          	addi	sp,sp,-32
    80005bc0:	00113c23          	sd	ra,24(sp)
    80005bc4:	00813823          	sd	s0,16(sp)
    80005bc8:	00913423          	sd	s1,8(sp)
    80005bcc:	01213023          	sd	s2,0(sp)
    80005bd0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005bd4:	00000913          	li	s2,0
    80005bd8:	03c0006f          	j	80005c14 <_ZL11workerBodyBPv+0x58>
            thread_dispatch();
    80005bdc:	ffffc097          	auipc	ra,0xffffc
    80005be0:	2c4080e7          	jalr	708(ra) # 80001ea0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 100; j++) {
    80005be4:	00148493          	addi	s1,s1,1
    80005be8:	06300793          	li	a5,99
    80005bec:	0097ee63          	bltu	a5,s1,80005c08 <_ZL11workerBodyBPv+0x4c>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005bf0:	00000713          	li	a4,0
    80005bf4:	000077b7          	lui	a5,0x7
    80005bf8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005bfc:	fee7e0e3          	bltu	a5,a4,80005bdc <_ZL11workerBodyBPv+0x20>
    80005c00:	00170713          	addi	a4,a4,1
    80005c04:	ff1ff06f          	j	80005bf4 <_ZL11workerBodyBPv+0x38>
        if (i == 10) {
    80005c08:	00a00793          	li	a5,10
    80005c0c:	04f90663          	beq	s2,a5,80005c58 <_ZL11workerBodyBPv+0x9c>
    for (uint64 i = 0; i < 16; i++) {
    80005c10:	00190913          	addi	s2,s2,1
    80005c14:	00f00793          	li	a5,15
    80005c18:	0527e463          	bltu	a5,s2,80005c60 <_ZL11workerBodyBPv+0xa4>
        printString("B: i="); printInt(i); printString("\n");
    80005c1c:	00007517          	auipc	a0,0x7
    80005c20:	91450513          	addi	a0,a0,-1772 # 8000c530 <CONSOLE_STATUS+0x520>
    80005c24:	00001097          	auipc	ra,0x1
    80005c28:	420080e7          	jalr	1056(ra) # 80007044 <_Z11printStringPKc>
    80005c2c:	00000613          	li	a2,0
    80005c30:	00a00593          	li	a1,10
    80005c34:	0009051b          	sext.w	a0,s2
    80005c38:	00001097          	auipc	ra,0x1
    80005c3c:	5bc080e7          	jalr	1468(ra) # 800071f4 <_Z8printIntiii>
    80005c40:	00007517          	auipc	a0,0x7
    80005c44:	c2850513          	addi	a0,a0,-984 # 8000c868 <CONSOLE_STATUS+0x858>
    80005c48:	00001097          	auipc	ra,0x1
    80005c4c:	3fc080e7          	jalr	1020(ra) # 80007044 <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80005c50:	00000493          	li	s1,0
    80005c54:	f95ff06f          	j	80005be8 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80005c58:	14102ff3          	csrr	t6,sepc
    80005c5c:	fb5ff06f          	j	80005c10 <_ZL11workerBodyBPv+0x54>
    printString("B finished!\n");
    80005c60:	00007517          	auipc	a0,0x7
    80005c64:	8d850513          	addi	a0,a0,-1832 # 8000c538 <CONSOLE_STATUS+0x528>
    80005c68:	00001097          	auipc	ra,0x1
    80005c6c:	3dc080e7          	jalr	988(ra) # 80007044 <_Z11printStringPKc>
    finishedB = true;
    80005c70:	00100793          	li	a5,1
    80005c74:	00009717          	auipc	a4,0x9
    80005c78:	5ef70323          	sb	a5,1510(a4) # 8000f25a <_ZL9finishedB>
    thread_dispatch();
    80005c7c:	ffffc097          	auipc	ra,0xffffc
    80005c80:	224080e7          	jalr	548(ra) # 80001ea0 <_Z15thread_dispatchv>
}
    80005c84:	01813083          	ld	ra,24(sp)
    80005c88:	01013403          	ld	s0,16(sp)
    80005c8c:	00813483          	ld	s1,8(sp)
    80005c90:	00013903          	ld	s2,0(sp)
    80005c94:	02010113          	addi	sp,sp,32
    80005c98:	00008067          	ret

0000000080005c9c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005c9c:	fe010113          	addi	sp,sp,-32
    80005ca0:	00113c23          	sd	ra,24(sp)
    80005ca4:	00813823          	sd	s0,16(sp)
    80005ca8:	00913423          	sd	s1,8(sp)
    80005cac:	01213023          	sd	s2,0(sp)
    80005cb0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005cb4:	00000913          	li	s2,0
    80005cb8:	0340006f          	j	80005cec <_ZL11workerBodyAPv+0x50>
            thread_dispatch();
    80005cbc:	ffffc097          	auipc	ra,0xffffc
    80005cc0:	1e4080e7          	jalr	484(ra) # 80001ea0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 100; j++) {
    80005cc4:	00148493          	addi	s1,s1,1
    80005cc8:	06300793          	li	a5,99
    80005ccc:	0097ee63          	bltu	a5,s1,80005ce8 <_ZL11workerBodyAPv+0x4c>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005cd0:	00000713          	li	a4,0
    80005cd4:	000077b7          	lui	a5,0x7
    80005cd8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005cdc:	fee7e0e3          	bltu	a5,a4,80005cbc <_ZL11workerBodyAPv+0x20>
    80005ce0:	00170713          	addi	a4,a4,1
    80005ce4:	ff1ff06f          	j	80005cd4 <_ZL11workerBodyAPv+0x38>
    for (uint64 i = 0; i < 10; i++) {
    80005ce8:	00190913          	addi	s2,s2,1
    80005cec:	00900793          	li	a5,9
    80005cf0:	0527e063          	bltu	a5,s2,80005d30 <_ZL11workerBodyAPv+0x94>
        printString("A: i="); printInt(i); printString("\n");
    80005cf4:	00007517          	auipc	a0,0x7
    80005cf8:	85450513          	addi	a0,a0,-1964 # 8000c548 <CONSOLE_STATUS+0x538>
    80005cfc:	00001097          	auipc	ra,0x1
    80005d00:	348080e7          	jalr	840(ra) # 80007044 <_Z11printStringPKc>
    80005d04:	00000613          	li	a2,0
    80005d08:	00a00593          	li	a1,10
    80005d0c:	0009051b          	sext.w	a0,s2
    80005d10:	00001097          	auipc	ra,0x1
    80005d14:	4e4080e7          	jalr	1252(ra) # 800071f4 <_Z8printIntiii>
    80005d18:	00007517          	auipc	a0,0x7
    80005d1c:	b5050513          	addi	a0,a0,-1200 # 8000c868 <CONSOLE_STATUS+0x858>
    80005d20:	00001097          	auipc	ra,0x1
    80005d24:	324080e7          	jalr	804(ra) # 80007044 <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80005d28:	00000493          	li	s1,0
    80005d2c:	f9dff06f          	j	80005cc8 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005d30:	00007517          	auipc	a0,0x7
    80005d34:	82050513          	addi	a0,a0,-2016 # 8000c550 <CONSOLE_STATUS+0x540>
    80005d38:	00001097          	auipc	ra,0x1
    80005d3c:	30c080e7          	jalr	780(ra) # 80007044 <_Z11printStringPKc>
    finishedA = true;
    80005d40:	00100793          	li	a5,1
    80005d44:	00009717          	auipc	a4,0x9
    80005d48:	50f70ba3          	sb	a5,1303(a4) # 8000f25b <_ZL9finishedA>
}
    80005d4c:	01813083          	ld	ra,24(sp)
    80005d50:	01013403          	ld	s0,16(sp)
    80005d54:	00813483          	ld	s1,8(sp)
    80005d58:	00013903          	ld	s2,0(sp)
    80005d5c:	02010113          	addi	sp,sp,32
    80005d60:	00008067          	ret

0000000080005d64 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80005d64:	fd010113          	addi	sp,sp,-48
    80005d68:	02113423          	sd	ra,40(sp)
    80005d6c:	02813023          	sd	s0,32(sp)
    80005d70:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005d74:	00000613          	li	a2,0
    80005d78:	00000597          	auipc	a1,0x0
    80005d7c:	f2458593          	addi	a1,a1,-220 # 80005c9c <_ZL11workerBodyAPv>
    80005d80:	fd040513          	addi	a0,s0,-48
    80005d84:	ffffc097          	auipc	ra,0xffffc
    80005d88:	080080e7          	jalr	128(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80005d8c:	00006517          	auipc	a0,0x6
    80005d90:	7d450513          	addi	a0,a0,2004 # 8000c560 <CONSOLE_STATUS+0x550>
    80005d94:	00001097          	auipc	ra,0x1
    80005d98:	2b0080e7          	jalr	688(ra) # 80007044 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[1], workerBodyB, nullptr);
    80005d9c:	00000613          	li	a2,0
    80005da0:	00000597          	auipc	a1,0x0
    80005da4:	e1c58593          	addi	a1,a1,-484 # 80005bbc <_ZL11workerBodyBPv>
    80005da8:	fd840513          	addi	a0,s0,-40
    80005dac:	ffffc097          	auipc	ra,0xffffc
    80005db0:	058080e7          	jalr	88(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80005db4:	00006517          	auipc	a0,0x6
    80005db8:	7c450513          	addi	a0,a0,1988 # 8000c578 <CONSOLE_STATUS+0x568>
    80005dbc:	00001097          	auipc	ra,0x1
    80005dc0:	288080e7          	jalr	648(ra) # 80007044 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[2], workerBodyC, nullptr);
    80005dc4:	00000613          	li	a2,0
    80005dc8:	00000597          	auipc	a1,0x0
    80005dcc:	c7458593          	addi	a1,a1,-908 # 80005a3c <_ZL11workerBodyCPv>
    80005dd0:	fe040513          	addi	a0,s0,-32
    80005dd4:	ffffc097          	auipc	ra,0xffffc
    80005dd8:	030080e7          	jalr	48(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80005ddc:	00006517          	auipc	a0,0x6
    80005de0:	7b450513          	addi	a0,a0,1972 # 8000c590 <CONSOLE_STATUS+0x580>
    80005de4:	00001097          	auipc	ra,0x1
    80005de8:	260080e7          	jalr	608(ra) # 80007044 <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[3], workerBodyD, nullptr);
    80005dec:	00000613          	li	a2,0
    80005df0:	00000597          	auipc	a1,0x0
    80005df4:	b0458593          	addi	a1,a1,-1276 # 800058f4 <_ZL11workerBodyDPv>
    80005df8:	fe840513          	addi	a0,s0,-24
    80005dfc:	ffffc097          	auipc	ra,0xffffc
    80005e00:	008080e7          	jalr	8(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80005e04:	00006517          	auipc	a0,0x6
    80005e08:	7a450513          	addi	a0,a0,1956 # 8000c5a8 <CONSOLE_STATUS+0x598>
    80005e0c:	00001097          	auipc	ra,0x1
    80005e10:	238080e7          	jalr	568(ra) # 80007044 <_Z11printStringPKc>
    80005e14:	00c0006f          	j	80005e20 <_Z16System_Mode_testv+0xbc>
    // testUser();

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005e18:	ffffc097          	auipc	ra,0xffffc
    80005e1c:	088080e7          	jalr	136(ra) # 80001ea0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005e20:	00009797          	auipc	a5,0x9
    80005e24:	43b7c783          	lbu	a5,1083(a5) # 8000f25b <_ZL9finishedA>
    80005e28:	fe0788e3          	beqz	a5,80005e18 <_Z16System_Mode_testv+0xb4>
    80005e2c:	00009797          	auipc	a5,0x9
    80005e30:	42e7c783          	lbu	a5,1070(a5) # 8000f25a <_ZL9finishedB>
    80005e34:	fe0782e3          	beqz	a5,80005e18 <_Z16System_Mode_testv+0xb4>
    80005e38:	00009797          	auipc	a5,0x9
    80005e3c:	4217c783          	lbu	a5,1057(a5) # 8000f259 <_ZL9finishedC>
    80005e40:	fc078ce3          	beqz	a5,80005e18 <_Z16System_Mode_testv+0xb4>
    80005e44:	00009797          	auipc	a5,0x9
    80005e48:	4147c783          	lbu	a5,1044(a5) # 8000f258 <_ZL9finishedD>
    80005e4c:	fc0786e3          	beqz	a5,80005e18 <_Z16System_Mode_testv+0xb4>
    }

}
    80005e50:	02813083          	ld	ra,40(sp)
    80005e54:	02013403          	ld	s0,32(sp)
    80005e58:	03010113          	addi	sp,sp,48
    80005e5c:	00008067          	ret

0000000080005e60 <_ZL9sleepyRunPv>:

#include "../test_h/printing.h"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80005e60:	fe010113          	addi	sp,sp,-32
    80005e64:	00113c23          	sd	ra,24(sp)
    80005e68:	00813823          	sd	s0,16(sp)
    80005e6c:	00913423          	sd	s1,8(sp)
    80005e70:	01213023          	sd	s2,0(sp)
    80005e74:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80005e78:	00053903          	ld	s2,0(a0)
    int i = 6;
    80005e7c:	00600493          	li	s1,6
    while (--i > 0) {
    80005e80:	fff4849b          	addiw	s1,s1,-1
    80005e84:	04905a63          	blez	s1,80005ed8 <_ZL9sleepyRunPv+0x78>

        printString("Hello ");
    80005e88:	00006517          	auipc	a0,0x6
    80005e8c:	73850513          	addi	a0,a0,1848 # 8000c5c0 <CONSOLE_STATUS+0x5b0>
    80005e90:	00001097          	auipc	ra,0x1
    80005e94:	1b4080e7          	jalr	436(ra) # 80007044 <_Z11printStringPKc>
        printInt(sleep_time);
    80005e98:	00000613          	li	a2,0
    80005e9c:	00a00593          	li	a1,10
    80005ea0:	0009051b          	sext.w	a0,s2
    80005ea4:	00001097          	auipc	ra,0x1
    80005ea8:	350080e7          	jalr	848(ra) # 800071f4 <_Z8printIntiii>
        printString(" !\n");
    80005eac:	00006517          	auipc	a0,0x6
    80005eb0:	71c50513          	addi	a0,a0,1820 # 8000c5c8 <CONSOLE_STATUS+0x5b8>
    80005eb4:	00001097          	auipc	ra,0x1
    80005eb8:	190080e7          	jalr	400(ra) # 80007044 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80005ebc:	00090513          	mv	a0,s2
    80005ec0:	ffffc097          	auipc	ra,0xffffc
    80005ec4:	024080e7          	jalr	36(ra) # 80001ee4 <_Z10time_sleepm>
        putc('.');
    80005ec8:	02e00513          	li	a0,46
    80005ecc:	ffffc097          	auipc	ra,0xffffc
    80005ed0:	184080e7          	jalr	388(ra) # 80002050 <_Z4putcc>
    while (--i > 0) {
    80005ed4:	fadff06f          	j	80005e80 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/200-1] = true;
    80005ed8:	0c800793          	li	a5,200
    80005edc:	02f95933          	divu	s2,s2,a5
    80005ee0:	fff90913          	addi	s2,s2,-1
    80005ee4:	00009797          	auipc	a5,0x9
    80005ee8:	37c78793          	addi	a5,a5,892 # 8000f260 <_ZL8finished>
    80005eec:	01278933          	add	s2,a5,s2
    80005ef0:	00100793          	li	a5,1
    80005ef4:	00f90023          	sb	a5,0(s2)
}
    80005ef8:	01813083          	ld	ra,24(sp)
    80005efc:	01013403          	ld	s0,16(sp)
    80005f00:	00813483          	ld	s1,8(sp)
    80005f04:	00013903          	ld	s2,0(sp)
    80005f08:	02010113          	addi	sp,sp,32
    80005f0c:	00008067          	ret

0000000080005f10 <_Z12testSleepingv>:

void testSleeping() {
    80005f10:	fc010113          	addi	sp,sp,-64
    80005f14:	02113c23          	sd	ra,56(sp)
    80005f18:	02813823          	sd	s0,48(sp)
    80005f1c:	02913423          	sd	s1,40(sp)
    80005f20:	04010413          	addi	s0,sp,64
    printString("Starting...\n");
    80005f24:	00006517          	auipc	a0,0x6
    80005f28:	6ac50513          	addi	a0,a0,1708 # 8000c5d0 <CONSOLE_STATUS+0x5c0>
    80005f2c:	00001097          	auipc	ra,0x1
    80005f30:	118080e7          	jalr	280(ra) # 80007044 <_Z11printStringPKc>
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {200, 400};
    80005f34:	0c800793          	li	a5,200
    80005f38:	fcf43823          	sd	a5,-48(s0)
    80005f3c:	19000793          	li	a5,400
    80005f40:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    printString("Creating threads: ");
    80005f44:	00006517          	auipc	a0,0x6
    80005f48:	69c50513          	addi	a0,a0,1692 # 8000c5e0 <CONSOLE_STATUS+0x5d0>
    80005f4c:	00001097          	auipc	ra,0x1
    80005f50:	0f8080e7          	jalr	248(ra) # 80007044 <_Z11printStringPKc>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80005f54:	00000493          	li	s1,0
    80005f58:	0500006f          	j	80005fa8 <_Z12testSleepingv+0x98>
        printInt(i);
    80005f5c:	00000613          	li	a2,0
    80005f60:	00a00593          	li	a1,10
    80005f64:	00048513          	mv	a0,s1
    80005f68:	00001097          	auipc	ra,0x1
    80005f6c:	28c080e7          	jalr	652(ra) # 800071f4 <_Z8printIntiii>
        printString(" ");
    80005f70:	00006517          	auipc	a0,0x6
    80005f74:	68850513          	addi	a0,a0,1672 # 8000c5f8 <CONSOLE_STATUS+0x5e8>
    80005f78:	00001097          	auipc	ra,0x1
    80005f7c:	0cc080e7          	jalr	204(ra) # 80007044 <_Z11printStringPKc>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80005f80:	00349793          	slli	a5,s1,0x3
    80005f84:	fd040613          	addi	a2,s0,-48
    80005f88:	00f60633          	add	a2,a2,a5
    80005f8c:	00000597          	auipc	a1,0x0
    80005f90:	ed458593          	addi	a1,a1,-300 # 80005e60 <_ZL9sleepyRunPv>
    80005f94:	fc040513          	addi	a0,s0,-64
    80005f98:	00f50533          	add	a0,a0,a5
    80005f9c:	ffffc097          	auipc	ra,0xffffc
    80005fa0:	e68080e7          	jalr	-408(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80005fa4:	0014849b          	addiw	s1,s1,1
    80005fa8:	00100793          	li	a5,1
    80005fac:	fa97d8e3          	bge	a5,s1,80005f5c <_Z12testSleepingv+0x4c>
    }
    printString("\nSuccesfully created all threads, now waiting for them to end\n");
    80005fb0:	00006517          	auipc	a0,0x6
    80005fb4:	65050513          	addi	a0,a0,1616 # 8000c600 <CONSOLE_STATUS+0x5f0>
    80005fb8:	00001097          	auipc	ra,0x1
    80005fbc:	08c080e7          	jalr	140(ra) # 80007044 <_Z11printStringPKc>
    80005fc0:	00c0006f          	j	80005fcc <_Z12testSleepingv+0xbc>
    while (!(finished[0] && finished[1])) {thread_dispatch();}
    80005fc4:	ffffc097          	auipc	ra,0xffffc
    80005fc8:	edc080e7          	jalr	-292(ra) # 80001ea0 <_Z15thread_dispatchv>
    80005fcc:	00009797          	auipc	a5,0x9
    80005fd0:	2947c783          	lbu	a5,660(a5) # 8000f260 <_ZL8finished>
    80005fd4:	fe0788e3          	beqz	a5,80005fc4 <_Z12testSleepingv+0xb4>
    80005fd8:	00009797          	auipc	a5,0x9
    80005fdc:	2897c783          	lbu	a5,649(a5) # 8000f261 <_ZL8finished+0x1>
    80005fe0:	fe0782e3          	beqz	a5,80005fc4 <_Z12testSleepingv+0xb4>
}
    80005fe4:	03813083          	ld	ra,56(sp)
    80005fe8:	03013403          	ld	s0,48(sp)
    80005fec:	02813483          	ld	s1,40(sp)
    80005ff0:	04010113          	addi	sp,sp,64
    80005ff4:	00008067          	ret

0000000080005ff8 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80005ff8:	fe010113          	addi	sp,sp,-32
    80005ffc:	00113c23          	sd	ra,24(sp)
    80006000:	00813823          	sd	s0,16(sp)
    80006004:	00913423          	sd	s1,8(sp)
    80006008:	01213023          	sd	s2,0(sp)
    8000600c:	02010413          	addi	s0,sp,32
    80006010:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80006014:	00000913          	li	s2,0
    80006018:	00c0006f          	j	80006024 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000601c:	ffffc097          	auipc	ra,0xffffc
    80006020:	e84080e7          	jalr	-380(ra) # 80001ea0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80006024:	ffffc097          	auipc	ra,0xffffc
    80006028:	004080e7          	jalr	4(ra) # 80002028 <_Z4getcv>
    8000602c:	0005059b          	sext.w	a1,a0
    80006030:	01b00793          	li	a5,27
    80006034:	02f58a63          	beq	a1,a5,80006068 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80006038:	0084b503          	ld	a0,8(s1)
    8000603c:	00001097          	auipc	ra,0x1
    80006040:	374080e7          	jalr	884(ra) # 800073b0 <_ZN6Buffer3putEi>
        i++;
    80006044:	0019071b          	addiw	a4,s2,1
    80006048:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000604c:	0004a683          	lw	a3,0(s1)
    80006050:	0026979b          	slliw	a5,a3,0x2
    80006054:	00d787bb          	addw	a5,a5,a3
    80006058:	0017979b          	slliw	a5,a5,0x1
    8000605c:	02f767bb          	remw	a5,a4,a5
    80006060:	fc0792e3          	bnez	a5,80006024 <_ZL16producerKeyboardPv+0x2c>
    80006064:	fb9ff06f          	j	8000601c <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80006068:	00100793          	li	a5,1
    8000606c:	00009717          	auipc	a4,0x9
    80006070:	1ef72e23          	sw	a5,508(a4) # 8000f268 <_ZL9threadEnd>
    data->buffer->put('!');
    80006074:	02100593          	li	a1,33
    80006078:	0084b503          	ld	a0,8(s1)
    8000607c:	00001097          	auipc	ra,0x1
    80006080:	334080e7          	jalr	820(ra) # 800073b0 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80006084:	0104b503          	ld	a0,16(s1)
    80006088:	ffffc097          	auipc	ra,0xffffc
    8000608c:	f18080e7          	jalr	-232(ra) # 80001fa0 <_Z10sem_signalP4_sem>
}
    80006090:	01813083          	ld	ra,24(sp)
    80006094:	01013403          	ld	s0,16(sp)
    80006098:	00813483          	ld	s1,8(sp)
    8000609c:	00013903          	ld	s2,0(sp)
    800060a0:	02010113          	addi	sp,sp,32
    800060a4:	00008067          	ret

00000000800060a8 <_ZL8producerPv>:

static void producer(void *arg) {
    800060a8:	fe010113          	addi	sp,sp,-32
    800060ac:	00113c23          	sd	ra,24(sp)
    800060b0:	00813823          	sd	s0,16(sp)
    800060b4:	00913423          	sd	s1,8(sp)
    800060b8:	01213023          	sd	s2,0(sp)
    800060bc:	02010413          	addi	s0,sp,32
    800060c0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800060c4:	00000913          	li	s2,0
    800060c8:	00c0006f          	j	800060d4 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800060cc:	ffffc097          	auipc	ra,0xffffc
    800060d0:	dd4080e7          	jalr	-556(ra) # 80001ea0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800060d4:	00009797          	auipc	a5,0x9
    800060d8:	1947a783          	lw	a5,404(a5) # 8000f268 <_ZL9threadEnd>
    800060dc:	02079e63          	bnez	a5,80006118 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800060e0:	0004a583          	lw	a1,0(s1)
    800060e4:	0305859b          	addiw	a1,a1,48
    800060e8:	0084b503          	ld	a0,8(s1)
    800060ec:	00001097          	auipc	ra,0x1
    800060f0:	2c4080e7          	jalr	708(ra) # 800073b0 <_ZN6Buffer3putEi>
        i++;
    800060f4:	0019071b          	addiw	a4,s2,1
    800060f8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800060fc:	0004a683          	lw	a3,0(s1)
    80006100:	0026979b          	slliw	a5,a3,0x2
    80006104:	00d787bb          	addw	a5,a5,a3
    80006108:	0017979b          	slliw	a5,a5,0x1
    8000610c:	02f767bb          	remw	a5,a4,a5
    80006110:	fc0792e3          	bnez	a5,800060d4 <_ZL8producerPv+0x2c>
    80006114:	fb9ff06f          	j	800060cc <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80006118:	0104b503          	ld	a0,16(s1)
    8000611c:	ffffc097          	auipc	ra,0xffffc
    80006120:	e84080e7          	jalr	-380(ra) # 80001fa0 <_Z10sem_signalP4_sem>
}
    80006124:	01813083          	ld	ra,24(sp)
    80006128:	01013403          	ld	s0,16(sp)
    8000612c:	00813483          	ld	s1,8(sp)
    80006130:	00013903          	ld	s2,0(sp)
    80006134:	02010113          	addi	sp,sp,32
    80006138:	00008067          	ret

000000008000613c <_ZL8consumerPv>:

static void consumer(void *arg) {
    8000613c:	fd010113          	addi	sp,sp,-48
    80006140:	02113423          	sd	ra,40(sp)
    80006144:	02813023          	sd	s0,32(sp)
    80006148:	00913c23          	sd	s1,24(sp)
    8000614c:	01213823          	sd	s2,16(sp)
    80006150:	01313423          	sd	s3,8(sp)
    80006154:	03010413          	addi	s0,sp,48
    80006158:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000615c:	00000993          	li	s3,0
    80006160:	01c0006f          	j	8000617c <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80006164:	ffffc097          	auipc	ra,0xffffc
    80006168:	d3c080e7          	jalr	-708(ra) # 80001ea0 <_Z15thread_dispatchv>
    8000616c:	0500006f          	j	800061bc <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80006170:	00a00513          	li	a0,10
    80006174:	ffffc097          	auipc	ra,0xffffc
    80006178:	edc080e7          	jalr	-292(ra) # 80002050 <_Z4putcc>
    while (!threadEnd) {
    8000617c:	00009797          	auipc	a5,0x9
    80006180:	0ec7a783          	lw	a5,236(a5) # 8000f268 <_ZL9threadEnd>
    80006184:	06079063          	bnez	a5,800061e4 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80006188:	00893503          	ld	a0,8(s2)
    8000618c:	00001097          	auipc	ra,0x1
    80006190:	2b4080e7          	jalr	692(ra) # 80007440 <_ZN6Buffer3getEv>
        i++;
    80006194:	0019849b          	addiw	s1,s3,1
    80006198:	0004899b          	sext.w	s3,s1
        putc(key);
    8000619c:	0ff57513          	andi	a0,a0,255
    800061a0:	ffffc097          	auipc	ra,0xffffc
    800061a4:	eb0080e7          	jalr	-336(ra) # 80002050 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800061a8:	00092703          	lw	a4,0(s2)
    800061ac:	0027179b          	slliw	a5,a4,0x2
    800061b0:	00e787bb          	addw	a5,a5,a4
    800061b4:	02f4e7bb          	remw	a5,s1,a5
    800061b8:	fa0786e3          	beqz	a5,80006164 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800061bc:	05000793          	li	a5,80
    800061c0:	02f4e4bb          	remw	s1,s1,a5
    800061c4:	fa049ce3          	bnez	s1,8000617c <_ZL8consumerPv+0x40>
    800061c8:	fa9ff06f          	j	80006170 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800061cc:	00893503          	ld	a0,8(s2)
    800061d0:	00001097          	auipc	ra,0x1
    800061d4:	270080e7          	jalr	624(ra) # 80007440 <_ZN6Buffer3getEv>
        putc(key);
    800061d8:	0ff57513          	andi	a0,a0,255
    800061dc:	ffffc097          	auipc	ra,0xffffc
    800061e0:	e74080e7          	jalr	-396(ra) # 80002050 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    800061e4:	00893503          	ld	a0,8(s2)
    800061e8:	00001097          	auipc	ra,0x1
    800061ec:	2e4080e7          	jalr	740(ra) # 800074cc <_ZN6Buffer6getCntEv>
    800061f0:	fca04ee3          	bgtz	a0,800061cc <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    800061f4:	01093503          	ld	a0,16(s2)
    800061f8:	ffffc097          	auipc	ra,0xffffc
    800061fc:	da8080e7          	jalr	-600(ra) # 80001fa0 <_Z10sem_signalP4_sem>
}
    80006200:	02813083          	ld	ra,40(sp)
    80006204:	02013403          	ld	s0,32(sp)
    80006208:	01813483          	ld	s1,24(sp)
    8000620c:	01013903          	ld	s2,16(sp)
    80006210:	00813983          	ld	s3,8(sp)
    80006214:	03010113          	addi	sp,sp,48
    80006218:	00008067          	ret

000000008000621c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    8000621c:	f9010113          	addi	sp,sp,-112
    80006220:	06113423          	sd	ra,104(sp)
    80006224:	06813023          	sd	s0,96(sp)
    80006228:	04913c23          	sd	s1,88(sp)
    8000622c:	05213823          	sd	s2,80(sp)
    80006230:	05313423          	sd	s3,72(sp)
    80006234:	05413023          	sd	s4,64(sp)
    80006238:	03513c23          	sd	s5,56(sp)
    8000623c:	03613823          	sd	s6,48(sp)
    80006240:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80006244:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80006248:	00006517          	auipc	a0,0x6
    8000624c:	3f850513          	addi	a0,a0,1016 # 8000c640 <CONSOLE_STATUS+0x630>
    80006250:	00001097          	auipc	ra,0x1
    80006254:	df4080e7          	jalr	-524(ra) # 80007044 <_Z11printStringPKc>
    getString(input, 30);
    80006258:	01e00593          	li	a1,30
    8000625c:	fa040493          	addi	s1,s0,-96
    80006260:	00048513          	mv	a0,s1
    80006264:	00001097          	auipc	ra,0x1
    80006268:	e68080e7          	jalr	-408(ra) # 800070cc <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000626c:	00048513          	mv	a0,s1
    80006270:	00001097          	auipc	ra,0x1
    80006274:	f34080e7          	jalr	-204(ra) # 800071a4 <_Z11stringToIntPKc>
    80006278:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000627c:	00006517          	auipc	a0,0x6
    80006280:	3e450513          	addi	a0,a0,996 # 8000c660 <CONSOLE_STATUS+0x650>
    80006284:	00001097          	auipc	ra,0x1
    80006288:	dc0080e7          	jalr	-576(ra) # 80007044 <_Z11printStringPKc>
    getString(input, 30);
    8000628c:	01e00593          	li	a1,30
    80006290:	00048513          	mv	a0,s1
    80006294:	00001097          	auipc	ra,0x1
    80006298:	e38080e7          	jalr	-456(ra) # 800070cc <_Z9getStringPci>
    n = stringToInt(input);
    8000629c:	00048513          	mv	a0,s1
    800062a0:	00001097          	auipc	ra,0x1
    800062a4:	f04080e7          	jalr	-252(ra) # 800071a4 <_Z11stringToIntPKc>
    800062a8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800062ac:	00006517          	auipc	a0,0x6
    800062b0:	3d450513          	addi	a0,a0,980 # 8000c680 <CONSOLE_STATUS+0x670>
    800062b4:	00001097          	auipc	ra,0x1
    800062b8:	d90080e7          	jalr	-624(ra) # 80007044 <_Z11printStringPKc>
    800062bc:	00000613          	li	a2,0
    800062c0:	00a00593          	li	a1,10
    800062c4:	00090513          	mv	a0,s2
    800062c8:	00001097          	auipc	ra,0x1
    800062cc:	f2c080e7          	jalr	-212(ra) # 800071f4 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800062d0:	00006517          	auipc	a0,0x6
    800062d4:	3c850513          	addi	a0,a0,968 # 8000c698 <CONSOLE_STATUS+0x688>
    800062d8:	00001097          	auipc	ra,0x1
    800062dc:	d6c080e7          	jalr	-660(ra) # 80007044 <_Z11printStringPKc>
    800062e0:	00000613          	li	a2,0
    800062e4:	00a00593          	li	a1,10
    800062e8:	00048513          	mv	a0,s1
    800062ec:	00001097          	auipc	ra,0x1
    800062f0:	f08080e7          	jalr	-248(ra) # 800071f4 <_Z8printIntiii>
    printString(".\n");
    800062f4:	00006517          	auipc	a0,0x6
    800062f8:	3bc50513          	addi	a0,a0,956 # 8000c6b0 <CONSOLE_STATUS+0x6a0>
    800062fc:	00001097          	auipc	ra,0x1
    80006300:	d48080e7          	jalr	-696(ra) # 80007044 <_Z11printStringPKc>
    if(threadNum > n) {
    80006304:	0324c463          	blt	s1,s2,8000632c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80006308:	03205c63          	blez	s2,80006340 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    8000630c:	03800513          	li	a0,56
    80006310:	ffffb097          	auipc	ra,0xffffb
    80006314:	f30080e7          	jalr	-208(ra) # 80001240 <_Znwm>
    80006318:	00050a13          	mv	s4,a0
    8000631c:	00048593          	mv	a1,s1
    80006320:	00001097          	auipc	ra,0x1
    80006324:	ff4080e7          	jalr	-12(ra) # 80007314 <_ZN6BufferC1Ei>
    80006328:	0300006f          	j	80006358 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000632c:	00006517          	auipc	a0,0x6
    80006330:	38c50513          	addi	a0,a0,908 # 8000c6b8 <CONSOLE_STATUS+0x6a8>
    80006334:	00001097          	auipc	ra,0x1
    80006338:	d10080e7          	jalr	-752(ra) # 80007044 <_Z11printStringPKc>
        return;
    8000633c:	0140006f          	j	80006350 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80006340:	00006517          	auipc	a0,0x6
    80006344:	3b850513          	addi	a0,a0,952 # 8000c6f8 <CONSOLE_STATUS+0x6e8>
    80006348:	00001097          	auipc	ra,0x1
    8000634c:	cfc080e7          	jalr	-772(ra) # 80007044 <_Z11printStringPKc>
        return;
    80006350:	000b0113          	mv	sp,s6
    80006354:	1500006f          	j	800064a4 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80006358:	00000593          	li	a1,0
    8000635c:	00009517          	auipc	a0,0x9
    80006360:	f1450513          	addi	a0,a0,-236 # 8000f270 <_ZL10waitForAll>
    80006364:	ffffc097          	auipc	ra,0xffffc
    80006368:	bac080e7          	jalr	-1108(ra) # 80001f10 <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    8000636c:	00391793          	slli	a5,s2,0x3
    80006370:	00f78793          	addi	a5,a5,15
    80006374:	ff07f793          	andi	a5,a5,-16
    80006378:	40f10133          	sub	sp,sp,a5
    8000637c:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80006380:	0019071b          	addiw	a4,s2,1
    80006384:	00171793          	slli	a5,a4,0x1
    80006388:	00e787b3          	add	a5,a5,a4
    8000638c:	00379793          	slli	a5,a5,0x3
    80006390:	00f78793          	addi	a5,a5,15
    80006394:	ff07f793          	andi	a5,a5,-16
    80006398:	40f10133          	sub	sp,sp,a5
    8000639c:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800063a0:	00191613          	slli	a2,s2,0x1
    800063a4:	012607b3          	add	a5,a2,s2
    800063a8:	00379793          	slli	a5,a5,0x3
    800063ac:	00f987b3          	add	a5,s3,a5
    800063b0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800063b4:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800063b8:	00009717          	auipc	a4,0x9
    800063bc:	eb873703          	ld	a4,-328(a4) # 8000f270 <_ZL10waitForAll>
    800063c0:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800063c4:	00078613          	mv	a2,a5
    800063c8:	00000597          	auipc	a1,0x0
    800063cc:	d7458593          	addi	a1,a1,-652 # 8000613c <_ZL8consumerPv>
    800063d0:	f9840513          	addi	a0,s0,-104
    800063d4:	ffffc097          	auipc	ra,0xffffc
    800063d8:	a30080e7          	jalr	-1488(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800063dc:	00000493          	li	s1,0
    800063e0:	0280006f          	j	80006408 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800063e4:	00000597          	auipc	a1,0x0
    800063e8:	c1458593          	addi	a1,a1,-1004 # 80005ff8 <_ZL16producerKeyboardPv>
                      data + i);
    800063ec:	00179613          	slli	a2,a5,0x1
    800063f0:	00f60633          	add	a2,a2,a5
    800063f4:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800063f8:	00c98633          	add	a2,s3,a2
    800063fc:	ffffc097          	auipc	ra,0xffffc
    80006400:	a08080e7          	jalr	-1528(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80006404:	0014849b          	addiw	s1,s1,1
    80006408:	0524d263          	bge	s1,s2,8000644c <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    8000640c:	00149793          	slli	a5,s1,0x1
    80006410:	009787b3          	add	a5,a5,s1
    80006414:	00379793          	slli	a5,a5,0x3
    80006418:	00f987b3          	add	a5,s3,a5
    8000641c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80006420:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80006424:	00009717          	auipc	a4,0x9
    80006428:	e4c73703          	ld	a4,-436(a4) # 8000f270 <_ZL10waitForAll>
    8000642c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80006430:	00048793          	mv	a5,s1
    80006434:	00349513          	slli	a0,s1,0x3
    80006438:	00aa8533          	add	a0,s5,a0
    8000643c:	fa9054e3          	blez	s1,800063e4 <_Z22producerConsumer_C_APIv+0x1c8>
    80006440:	00000597          	auipc	a1,0x0
    80006444:	c6858593          	addi	a1,a1,-920 # 800060a8 <_ZL8producerPv>
    80006448:	fa5ff06f          	j	800063ec <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    8000644c:	ffffc097          	auipc	ra,0xffffc
    80006450:	a54080e7          	jalr	-1452(ra) # 80001ea0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80006454:	00000493          	li	s1,0
    80006458:	00994e63          	blt	s2,s1,80006474 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    8000645c:	00009517          	auipc	a0,0x9
    80006460:	e1453503          	ld	a0,-492(a0) # 8000f270 <_ZL10waitForAll>
    80006464:	ffffc097          	auipc	ra,0xffffc
    80006468:	b10080e7          	jalr	-1264(ra) # 80001f74 <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    8000646c:	0014849b          	addiw	s1,s1,1
    80006470:	fe9ff06f          	j	80006458 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80006474:	00009517          	auipc	a0,0x9
    80006478:	dfc53503          	ld	a0,-516(a0) # 8000f270 <_ZL10waitForAll>
    8000647c:	ffffc097          	auipc	ra,0xffffc
    80006480:	acc080e7          	jalr	-1332(ra) # 80001f48 <_Z9sem_closeP4_sem>
    delete buffer;
    80006484:	000a0e63          	beqz	s4,800064a0 <_Z22producerConsumer_C_APIv+0x284>
    80006488:	000a0513          	mv	a0,s4
    8000648c:	00001097          	auipc	ra,0x1
    80006490:	0c8080e7          	jalr	200(ra) # 80007554 <_ZN6BufferD1Ev>
    80006494:	000a0513          	mv	a0,s4
    80006498:	ffffb097          	auipc	ra,0xffffb
    8000649c:	dd0080e7          	jalr	-560(ra) # 80001268 <_ZdlPv>
    800064a0:	000b0113          	mv	sp,s6
}
    800064a4:	f9040113          	addi	sp,s0,-112
    800064a8:	06813083          	ld	ra,104(sp)
    800064ac:	06013403          	ld	s0,96(sp)
    800064b0:	05813483          	ld	s1,88(sp)
    800064b4:	05013903          	ld	s2,80(sp)
    800064b8:	04813983          	ld	s3,72(sp)
    800064bc:	04013a03          	ld	s4,64(sp)
    800064c0:	03813a83          	ld	s5,56(sp)
    800064c4:	03013b03          	ld	s6,48(sp)
    800064c8:	07010113          	addi	sp,sp,112
    800064cc:	00008067          	ret
    800064d0:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800064d4:	000a0513          	mv	a0,s4
    800064d8:	ffffb097          	auipc	ra,0xffffb
    800064dc:	d90080e7          	jalr	-624(ra) # 80001268 <_ZdlPv>
    800064e0:	00048513          	mv	a0,s1
    800064e4:	0000a097          	auipc	ra,0xa
    800064e8:	e94080e7          	jalr	-364(ra) # 80010378 <_Unwind_Resume>

00000000800064ec <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800064ec:	fe010113          	addi	sp,sp,-32
    800064f0:	00113c23          	sd	ra,24(sp)
    800064f4:	00813823          	sd	s0,16(sp)
    800064f8:	00913423          	sd	s1,8(sp)
    800064fc:	01213023          	sd	s2,0(sp)
    80006500:	02010413          	addi	s0,sp,32
    80006504:	00050493          	mv	s1,a0
    // putc('F');
    // putc('-');
    // putc('0' + n / 10);
    // putc('0' + n % 10);
    // putc('\n');
    if (n == 0 || n == 1) { return n; }
    80006508:	00100793          	li	a5,1
    8000650c:	02a7f863          	bgeu	a5,a0,8000653c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006510:	00a00793          	li	a5,10
    80006514:	02f577b3          	remu	a5,a0,a5
    80006518:	02078e63          	beqz	a5,80006554 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000651c:	fff48513          	addi	a0,s1,-1
    80006520:	00000097          	auipc	ra,0x0
    80006524:	fcc080e7          	jalr	-52(ra) # 800064ec <_ZL9fibonaccim>
    80006528:	00050913          	mv	s2,a0
    8000652c:	ffe48513          	addi	a0,s1,-2
    80006530:	00000097          	auipc	ra,0x0
    80006534:	fbc080e7          	jalr	-68(ra) # 800064ec <_ZL9fibonaccim>
    80006538:	00a90533          	add	a0,s2,a0
}
    8000653c:	01813083          	ld	ra,24(sp)
    80006540:	01013403          	ld	s0,16(sp)
    80006544:	00813483          	ld	s1,8(sp)
    80006548:	00013903          	ld	s2,0(sp)
    8000654c:	02010113          	addi	sp,sp,32
    80006550:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006554:	ffffc097          	auipc	ra,0xffffc
    80006558:	94c080e7          	jalr	-1716(ra) # 80001ea0 <_Z15thread_dispatchv>
    8000655c:	fc1ff06f          	j	8000651c <_ZL9fibonaccim+0x30>

0000000080006560 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006560:	fe010113          	addi	sp,sp,-32
    80006564:	00113c23          	sd	ra,24(sp)
    80006568:	00813823          	sd	s0,16(sp)
    8000656c:	00913423          	sd	s1,8(sp)
    80006570:	01213023          	sd	s2,0(sp)
    80006574:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006578:	00a00493          	li	s1,10
    8000657c:	0400006f          	j	800065bc <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006580:	00006517          	auipc	a0,0x6
    80006584:	f3850513          	addi	a0,a0,-200 # 8000c4b8 <CONSOLE_STATUS+0x4a8>
    80006588:	00001097          	auipc	ra,0x1
    8000658c:	abc080e7          	jalr	-1348(ra) # 80007044 <_Z11printStringPKc>
    80006590:	00000613          	li	a2,0
    80006594:	00a00593          	li	a1,10
    80006598:	00048513          	mv	a0,s1
    8000659c:	00001097          	auipc	ra,0x1
    800065a0:	c58080e7          	jalr	-936(ra) # 800071f4 <_Z8printIntiii>
    800065a4:	00006517          	auipc	a0,0x6
    800065a8:	2c450513          	addi	a0,a0,708 # 8000c868 <CONSOLE_STATUS+0x858>
    800065ac:	00001097          	auipc	ra,0x1
    800065b0:	a98080e7          	jalr	-1384(ra) # 80007044 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800065b4:	0014849b          	addiw	s1,s1,1
    800065b8:	0ff4f493          	andi	s1,s1,255
    800065bc:	00c00793          	li	a5,12
    800065c0:	fc97f0e3          	bgeu	a5,s1,80006580 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800065c4:	00006517          	auipc	a0,0x6
    800065c8:	efc50513          	addi	a0,a0,-260 # 8000c4c0 <CONSOLE_STATUS+0x4b0>
    800065cc:	00001097          	auipc	ra,0x1
    800065d0:	a78080e7          	jalr	-1416(ra) # 80007044 <_Z11printStringPKc>
    __asm__ volatile("li t1, 5");
    800065d4:	00500313          	li	t1,5
    thread_dispatch();
    800065d8:	ffffc097          	auipc	ra,0xffffc
    800065dc:	8c8080e7          	jalr	-1848(ra) # 80001ea0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800065e0:	01000513          	li	a0,16
    800065e4:	00000097          	auipc	ra,0x0
    800065e8:	f08080e7          	jalr	-248(ra) # 800064ec <_ZL9fibonaccim>
    800065ec:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800065f0:	00006517          	auipc	a0,0x6
    800065f4:	ee050513          	addi	a0,a0,-288 # 8000c4d0 <CONSOLE_STATUS+0x4c0>
    800065f8:	00001097          	auipc	ra,0x1
    800065fc:	a4c080e7          	jalr	-1460(ra) # 80007044 <_Z11printStringPKc>
    80006600:	00000613          	li	a2,0
    80006604:	00a00593          	li	a1,10
    80006608:	0009051b          	sext.w	a0,s2
    8000660c:	00001097          	auipc	ra,0x1
    80006610:	be8080e7          	jalr	-1048(ra) # 800071f4 <_Z8printIntiii>
    80006614:	00006517          	auipc	a0,0x6
    80006618:	25450513          	addi	a0,a0,596 # 8000c868 <CONSOLE_STATUS+0x858>
    8000661c:	00001097          	auipc	ra,0x1
    80006620:	a28080e7          	jalr	-1496(ra) # 80007044 <_Z11printStringPKc>
    80006624:	0400006f          	j	80006664 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006628:	00006517          	auipc	a0,0x6
    8000662c:	e9050513          	addi	a0,a0,-368 # 8000c4b8 <CONSOLE_STATUS+0x4a8>
    80006630:	00001097          	auipc	ra,0x1
    80006634:	a14080e7          	jalr	-1516(ra) # 80007044 <_Z11printStringPKc>
    80006638:	00000613          	li	a2,0
    8000663c:	00a00593          	li	a1,10
    80006640:	00048513          	mv	a0,s1
    80006644:	00001097          	auipc	ra,0x1
    80006648:	bb0080e7          	jalr	-1104(ra) # 800071f4 <_Z8printIntiii>
    8000664c:	00006517          	auipc	a0,0x6
    80006650:	21c50513          	addi	a0,a0,540 # 8000c868 <CONSOLE_STATUS+0x858>
    80006654:	00001097          	auipc	ra,0x1
    80006658:	9f0080e7          	jalr	-1552(ra) # 80007044 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000665c:	0014849b          	addiw	s1,s1,1
    80006660:	0ff4f493          	andi	s1,s1,255
    80006664:	00f00793          	li	a5,15
    80006668:	fc97f0e3          	bgeu	a5,s1,80006628 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000666c:	00006517          	auipc	a0,0x6
    80006670:	e7450513          	addi	a0,a0,-396 # 8000c4e0 <CONSOLE_STATUS+0x4d0>
    80006674:	00001097          	auipc	ra,0x1
    80006678:	9d0080e7          	jalr	-1584(ra) # 80007044 <_Z11printStringPKc>
    finishedD = true;
    8000667c:	00100793          	li	a5,1
    80006680:	00009717          	auipc	a4,0x9
    80006684:	bef70c23          	sb	a5,-1032(a4) # 8000f278 <_ZL9finishedD>
    thread_dispatch();
    80006688:	ffffc097          	auipc	ra,0xffffc
    8000668c:	818080e7          	jalr	-2024(ra) # 80001ea0 <_Z15thread_dispatchv>
}
    80006690:	01813083          	ld	ra,24(sp)
    80006694:	01013403          	ld	s0,16(sp)
    80006698:	00813483          	ld	s1,8(sp)
    8000669c:	00013903          	ld	s2,0(sp)
    800066a0:	02010113          	addi	sp,sp,32
    800066a4:	00008067          	ret

00000000800066a8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800066a8:	fe010113          	addi	sp,sp,-32
    800066ac:	00113c23          	sd	ra,24(sp)
    800066b0:	00813823          	sd	s0,16(sp)
    800066b4:	00913423          	sd	s1,8(sp)
    800066b8:	01213023          	sd	s2,0(sp)
    800066bc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800066c0:	00000493          	li	s1,0
    800066c4:	0400006f          	j	80006704 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800066c8:	00006517          	auipc	a0,0x6
    800066cc:	e2850513          	addi	a0,a0,-472 # 8000c4f0 <CONSOLE_STATUS+0x4e0>
    800066d0:	00001097          	auipc	ra,0x1
    800066d4:	974080e7          	jalr	-1676(ra) # 80007044 <_Z11printStringPKc>
    800066d8:	00000613          	li	a2,0
    800066dc:	00a00593          	li	a1,10
    800066e0:	00048513          	mv	a0,s1
    800066e4:	00001097          	auipc	ra,0x1
    800066e8:	b10080e7          	jalr	-1264(ra) # 800071f4 <_Z8printIntiii>
    800066ec:	00006517          	auipc	a0,0x6
    800066f0:	17c50513          	addi	a0,a0,380 # 8000c868 <CONSOLE_STATUS+0x858>
    800066f4:	00001097          	auipc	ra,0x1
    800066f8:	950080e7          	jalr	-1712(ra) # 80007044 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800066fc:	0014849b          	addiw	s1,s1,1
    80006700:	0ff4f493          	andi	s1,s1,255
    80006704:	00200793          	li	a5,2
    80006708:	fc97f0e3          	bgeu	a5,s1,800066c8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    8000670c:	00006517          	auipc	a0,0x6
    80006710:	dec50513          	addi	a0,a0,-532 # 8000c4f8 <CONSOLE_STATUS+0x4e8>
    80006714:	00001097          	auipc	ra,0x1
    80006718:	930080e7          	jalr	-1744(ra) # 80007044 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000671c:	00700313          	li	t1,7
    thread_dispatch();
    80006720:	ffffb097          	auipc	ra,0xffffb
    80006724:	780080e7          	jalr	1920(ra) # 80001ea0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006728:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000672c:	00006517          	auipc	a0,0x6
    80006730:	ddc50513          	addi	a0,a0,-548 # 8000c508 <CONSOLE_STATUS+0x4f8>
    80006734:	00001097          	auipc	ra,0x1
    80006738:	910080e7          	jalr	-1776(ra) # 80007044 <_Z11printStringPKc>
    8000673c:	00000613          	li	a2,0
    80006740:	00a00593          	li	a1,10
    80006744:	0009051b          	sext.w	a0,s2
    80006748:	00001097          	auipc	ra,0x1
    8000674c:	aac080e7          	jalr	-1364(ra) # 800071f4 <_Z8printIntiii>
    80006750:	00006517          	auipc	a0,0x6
    80006754:	11850513          	addi	a0,a0,280 # 8000c868 <CONSOLE_STATUS+0x858>
    80006758:	00001097          	auipc	ra,0x1
    8000675c:	8ec080e7          	jalr	-1812(ra) # 80007044 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006760:	00c00513          	li	a0,12
    80006764:	00000097          	auipc	ra,0x0
    80006768:	d88080e7          	jalr	-632(ra) # 800064ec <_ZL9fibonaccim>
    8000676c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006770:	00006517          	auipc	a0,0x6
    80006774:	da050513          	addi	a0,a0,-608 # 8000c510 <CONSOLE_STATUS+0x500>
    80006778:	00001097          	auipc	ra,0x1
    8000677c:	8cc080e7          	jalr	-1844(ra) # 80007044 <_Z11printStringPKc>
    80006780:	00000613          	li	a2,0
    80006784:	00a00593          	li	a1,10
    80006788:	0009051b          	sext.w	a0,s2
    8000678c:	00001097          	auipc	ra,0x1
    80006790:	a68080e7          	jalr	-1432(ra) # 800071f4 <_Z8printIntiii>
    80006794:	00006517          	auipc	a0,0x6
    80006798:	0d450513          	addi	a0,a0,212 # 8000c868 <CONSOLE_STATUS+0x858>
    8000679c:	00001097          	auipc	ra,0x1
    800067a0:	8a8080e7          	jalr	-1880(ra) # 80007044 <_Z11printStringPKc>
    800067a4:	0400006f          	j	800067e4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800067a8:	00006517          	auipc	a0,0x6
    800067ac:	d4850513          	addi	a0,a0,-696 # 8000c4f0 <CONSOLE_STATUS+0x4e0>
    800067b0:	00001097          	auipc	ra,0x1
    800067b4:	894080e7          	jalr	-1900(ra) # 80007044 <_Z11printStringPKc>
    800067b8:	00000613          	li	a2,0
    800067bc:	00a00593          	li	a1,10
    800067c0:	00048513          	mv	a0,s1
    800067c4:	00001097          	auipc	ra,0x1
    800067c8:	a30080e7          	jalr	-1488(ra) # 800071f4 <_Z8printIntiii>
    800067cc:	00006517          	auipc	a0,0x6
    800067d0:	09c50513          	addi	a0,a0,156 # 8000c868 <CONSOLE_STATUS+0x858>
    800067d4:	00001097          	auipc	ra,0x1
    800067d8:	870080e7          	jalr	-1936(ra) # 80007044 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800067dc:	0014849b          	addiw	s1,s1,1
    800067e0:	0ff4f493          	andi	s1,s1,255
    800067e4:	00500793          	li	a5,5
    800067e8:	fc97f0e3          	bgeu	a5,s1,800067a8 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    800067ec:	00006517          	auipc	a0,0x6
    800067f0:	d3450513          	addi	a0,a0,-716 # 8000c520 <CONSOLE_STATUS+0x510>
    800067f4:	00001097          	auipc	ra,0x1
    800067f8:	850080e7          	jalr	-1968(ra) # 80007044 <_Z11printStringPKc>
    finishedC = true;
    800067fc:	00100793          	li	a5,1
    80006800:	00009717          	auipc	a4,0x9
    80006804:	a6f70ca3          	sb	a5,-1415(a4) # 8000f279 <_ZL9finishedC>
    thread_dispatch();
    80006808:	ffffb097          	auipc	ra,0xffffb
    8000680c:	698080e7          	jalr	1688(ra) # 80001ea0 <_Z15thread_dispatchv>
}
    80006810:	01813083          	ld	ra,24(sp)
    80006814:	01013403          	ld	s0,16(sp)
    80006818:	00813483          	ld	s1,8(sp)
    8000681c:	00013903          	ld	s2,0(sp)
    80006820:	02010113          	addi	sp,sp,32
    80006824:	00008067          	ret

0000000080006828 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006828:	fe010113          	addi	sp,sp,-32
    8000682c:	00113c23          	sd	ra,24(sp)
    80006830:	00813823          	sd	s0,16(sp)
    80006834:	00913423          	sd	s1,8(sp)
    80006838:	01213023          	sd	s2,0(sp)
    8000683c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006840:	00000913          	li	s2,0
    80006844:	0380006f          	j	8000687c <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80006848:	ffffb097          	auipc	ra,0xffffb
    8000684c:	658080e7          	jalr	1624(ra) # 80001ea0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006850:	00148493          	addi	s1,s1,1
    80006854:	000027b7          	lui	a5,0x2
    80006858:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000685c:	0097ee63          	bltu	a5,s1,80006878 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006860:	00000713          	li	a4,0
    80006864:	000077b7          	lui	a5,0x7
    80006868:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000686c:	fce7eee3          	bltu	a5,a4,80006848 <_ZL11workerBodyBPv+0x20>
    80006870:	00170713          	addi	a4,a4,1
    80006874:	ff1ff06f          	j	80006864 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80006878:	00190913          	addi	s2,s2,1
    8000687c:	00f00793          	li	a5,15
    80006880:	0527e063          	bltu	a5,s2,800068c0 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80006884:	00006517          	auipc	a0,0x6
    80006888:	cac50513          	addi	a0,a0,-852 # 8000c530 <CONSOLE_STATUS+0x520>
    8000688c:	00000097          	auipc	ra,0x0
    80006890:	7b8080e7          	jalr	1976(ra) # 80007044 <_Z11printStringPKc>
    80006894:	00000613          	li	a2,0
    80006898:	00a00593          	li	a1,10
    8000689c:	0009051b          	sext.w	a0,s2
    800068a0:	00001097          	auipc	ra,0x1
    800068a4:	954080e7          	jalr	-1708(ra) # 800071f4 <_Z8printIntiii>
    800068a8:	00006517          	auipc	a0,0x6
    800068ac:	fc050513          	addi	a0,a0,-64 # 8000c868 <CONSOLE_STATUS+0x858>
    800068b0:	00000097          	auipc	ra,0x0
    800068b4:	794080e7          	jalr	1940(ra) # 80007044 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800068b8:	00000493          	li	s1,0
    800068bc:	f99ff06f          	j	80006854 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800068c0:	00006517          	auipc	a0,0x6
    800068c4:	c7850513          	addi	a0,a0,-904 # 8000c538 <CONSOLE_STATUS+0x528>
    800068c8:	00000097          	auipc	ra,0x0
    800068cc:	77c080e7          	jalr	1916(ra) # 80007044 <_Z11printStringPKc>
    finishedB = true;
    800068d0:	00100793          	li	a5,1
    800068d4:	00009717          	auipc	a4,0x9
    800068d8:	9af70323          	sb	a5,-1626(a4) # 8000f27a <_ZL9finishedB>
    thread_dispatch();
    800068dc:	ffffb097          	auipc	ra,0xffffb
    800068e0:	5c4080e7          	jalr	1476(ra) # 80001ea0 <_Z15thread_dispatchv>
}
    800068e4:	01813083          	ld	ra,24(sp)
    800068e8:	01013403          	ld	s0,16(sp)
    800068ec:	00813483          	ld	s1,8(sp)
    800068f0:	00013903          	ld	s2,0(sp)
    800068f4:	02010113          	addi	sp,sp,32
    800068f8:	00008067          	ret

00000000800068fc <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800068fc:	fe010113          	addi	sp,sp,-32
    80006900:	00113c23          	sd	ra,24(sp)
    80006904:	00813823          	sd	s0,16(sp)
    80006908:	00913423          	sd	s1,8(sp)
    8000690c:	01213023          	sd	s2,0(sp)
    80006910:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006914:	00000913          	li	s2,0
    80006918:	0380006f          	j	80006950 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000691c:	ffffb097          	auipc	ra,0xffffb
    80006920:	584080e7          	jalr	1412(ra) # 80001ea0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006924:	00148493          	addi	s1,s1,1
    80006928:	000027b7          	lui	a5,0x2
    8000692c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006930:	0097ee63          	bltu	a5,s1,8000694c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006934:	00000713          	li	a4,0
    80006938:	000077b7          	lui	a5,0x7
    8000693c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006940:	fce7eee3          	bltu	a5,a4,8000691c <_ZL11workerBodyAPv+0x20>
    80006944:	00170713          	addi	a4,a4,1
    80006948:	ff1ff06f          	j	80006938 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000694c:	00190913          	addi	s2,s2,1
    80006950:	00900793          	li	a5,9
    80006954:	0527e063          	bltu	a5,s2,80006994 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006958:	00006517          	auipc	a0,0x6
    8000695c:	bf050513          	addi	a0,a0,-1040 # 8000c548 <CONSOLE_STATUS+0x538>
    80006960:	00000097          	auipc	ra,0x0
    80006964:	6e4080e7          	jalr	1764(ra) # 80007044 <_Z11printStringPKc>
    80006968:	00000613          	li	a2,0
    8000696c:	00a00593          	li	a1,10
    80006970:	0009051b          	sext.w	a0,s2
    80006974:	00001097          	auipc	ra,0x1
    80006978:	880080e7          	jalr	-1920(ra) # 800071f4 <_Z8printIntiii>
    8000697c:	00006517          	auipc	a0,0x6
    80006980:	eec50513          	addi	a0,a0,-276 # 8000c868 <CONSOLE_STATUS+0x858>
    80006984:	00000097          	auipc	ra,0x0
    80006988:	6c0080e7          	jalr	1728(ra) # 80007044 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000698c:	00000493          	li	s1,0
    80006990:	f99ff06f          	j	80006928 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006994:	00006517          	auipc	a0,0x6
    80006998:	bbc50513          	addi	a0,a0,-1092 # 8000c550 <CONSOLE_STATUS+0x540>
    8000699c:	00000097          	auipc	ra,0x0
    800069a0:	6a8080e7          	jalr	1704(ra) # 80007044 <_Z11printStringPKc>
    finishedA = true;
    800069a4:	00100793          	li	a5,1
    800069a8:	00009717          	auipc	a4,0x9
    800069ac:	8cf709a3          	sb	a5,-1837(a4) # 8000f27b <_ZL9finishedA>
}
    800069b0:	01813083          	ld	ra,24(sp)
    800069b4:	01013403          	ld	s0,16(sp)
    800069b8:	00813483          	ld	s1,8(sp)
    800069bc:	00013903          	ld	s2,0(sp)
    800069c0:	02010113          	addi	sp,sp,32
    800069c4:	00008067          	ret

00000000800069c8 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800069c8:	fd010113          	addi	sp,sp,-48
    800069cc:	02113423          	sd	ra,40(sp)
    800069d0:	02813023          	sd	s0,32(sp)
    800069d4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800069d8:	00000613          	li	a2,0
    800069dc:	00000597          	auipc	a1,0x0
    800069e0:	f2058593          	addi	a1,a1,-224 # 800068fc <_ZL11workerBodyAPv>
    800069e4:	fd040513          	addi	a0,s0,-48
    800069e8:	ffffb097          	auipc	ra,0xffffb
    800069ec:	41c080e7          	jalr	1052(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800069f0:	00006517          	auipc	a0,0x6
    800069f4:	b7050513          	addi	a0,a0,-1168 # 8000c560 <CONSOLE_STATUS+0x550>
    800069f8:	00000097          	auipc	ra,0x0
    800069fc:	64c080e7          	jalr	1612(ra) # 80007044 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006a00:	00000613          	li	a2,0
    80006a04:	00000597          	auipc	a1,0x0
    80006a08:	e2458593          	addi	a1,a1,-476 # 80006828 <_ZL11workerBodyBPv>
    80006a0c:	fd840513          	addi	a0,s0,-40
    80006a10:	ffffb097          	auipc	ra,0xffffb
    80006a14:	3f4080e7          	jalr	1012(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80006a18:	00006517          	auipc	a0,0x6
    80006a1c:	b6050513          	addi	a0,a0,-1184 # 8000c578 <CONSOLE_STATUS+0x568>
    80006a20:	00000097          	auipc	ra,0x0
    80006a24:	624080e7          	jalr	1572(ra) # 80007044 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006a28:	00000613          	li	a2,0
    80006a2c:	00000597          	auipc	a1,0x0
    80006a30:	c7c58593          	addi	a1,a1,-900 # 800066a8 <_ZL11workerBodyCPv>
    80006a34:	fe040513          	addi	a0,s0,-32
    80006a38:	ffffb097          	auipc	ra,0xffffb
    80006a3c:	3cc080e7          	jalr	972(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80006a40:	00006517          	auipc	a0,0x6
    80006a44:	b5050513          	addi	a0,a0,-1200 # 8000c590 <CONSOLE_STATUS+0x580>
    80006a48:	00000097          	auipc	ra,0x0
    80006a4c:	5fc080e7          	jalr	1532(ra) # 80007044 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006a50:	00000613          	li	a2,0
    80006a54:	00000597          	auipc	a1,0x0
    80006a58:	b0c58593          	addi	a1,a1,-1268 # 80006560 <_ZL11workerBodyDPv>
    80006a5c:	fe840513          	addi	a0,s0,-24
    80006a60:	ffffb097          	auipc	ra,0xffffb
    80006a64:	3a4080e7          	jalr	932(ra) # 80001e04 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006a68:	00006517          	auipc	a0,0x6
    80006a6c:	b4050513          	addi	a0,a0,-1216 # 8000c5a8 <CONSOLE_STATUS+0x598>
    80006a70:	00000097          	auipc	ra,0x0
    80006a74:	5d4080e7          	jalr	1492(ra) # 80007044 <_Z11printStringPKc>
    80006a78:	00c0006f          	j	80006a84 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006a7c:	ffffb097          	auipc	ra,0xffffb
    80006a80:	424080e7          	jalr	1060(ra) # 80001ea0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006a84:	00008797          	auipc	a5,0x8
    80006a88:	7f77c783          	lbu	a5,2039(a5) # 8000f27b <_ZL9finishedA>
    80006a8c:	fe0788e3          	beqz	a5,80006a7c <_Z18Threads_C_API_testv+0xb4>
    80006a90:	00008797          	auipc	a5,0x8
    80006a94:	7ea7c783          	lbu	a5,2026(a5) # 8000f27a <_ZL9finishedB>
    80006a98:	fe0782e3          	beqz	a5,80006a7c <_Z18Threads_C_API_testv+0xb4>
    80006a9c:	00008797          	auipc	a5,0x8
    80006aa0:	7dd7c783          	lbu	a5,2013(a5) # 8000f279 <_ZL9finishedC>
    80006aa4:	fc078ce3          	beqz	a5,80006a7c <_Z18Threads_C_API_testv+0xb4>
    80006aa8:	00008797          	auipc	a5,0x8
    80006aac:	7d07c783          	lbu	a5,2000(a5) # 8000f278 <_ZL9finishedD>
    80006ab0:	fc0786e3          	beqz	a5,80006a7c <_Z18Threads_C_API_testv+0xb4>
    }
}
    80006ab4:	02813083          	ld	ra,40(sp)
    80006ab8:	02013403          	ld	s0,32(sp)
    80006abc:	03010113          	addi	sp,sp,48
    80006ac0:	00008067          	ret

0000000080006ac4 <_Z8userMainv>:
#include "../test_h/ConsumerProducer_CPP_API_test.h"
#include "../test_h/System_Mode_test.h"

#endif

void userMain() {
    80006ac4:	fe010113          	addi	sp,sp,-32
    80006ac8:	00113c23          	sd	ra,24(sp)
    80006acc:	00813823          	sd	s0,16(sp)
    80006ad0:	00913423          	sd	s1,8(sp)
    80006ad4:	01213023          	sd	s2,0(sp)
    80006ad8:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006adc:	00006517          	auipc	a0,0x6
    80006ae0:	c4c50513          	addi	a0,a0,-948 # 8000c728 <CONSOLE_STATUS+0x718>
    80006ae4:	00000097          	auipc	ra,0x0
    80006ae8:	560080e7          	jalr	1376(ra) # 80007044 <_Z11printStringPKc>
    int test = getc() - '0';
    80006aec:	ffffb097          	auipc	ra,0xffffb
    80006af0:	53c080e7          	jalr	1340(ra) # 80002028 <_Z4getcv>
    80006af4:	00050913          	mv	s2,a0
    80006af8:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006afc:	ffffb097          	auipc	ra,0xffffb
    80006b00:	52c080e7          	jalr	1324(ra) # 80002028 <_Z4getcv>
    // int test = 3;
    putc('0' + test);
    80006b04:	00090513          	mv	a0,s2
    80006b08:	ffffb097          	auipc	ra,0xffffb
    80006b0c:	548080e7          	jalr	1352(ra) # 80002050 <_Z4putcc>
    putc('\n');
    80006b10:	00a00513          	li	a0,10
    80006b14:	ffffb097          	auipc	ra,0xffffb
    80006b18:	53c080e7          	jalr	1340(ra) # 80002050 <_Z4putcc>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006b1c:	00700793          	li	a5,7
    80006b20:	1097ec63          	bltu	a5,s1,80006c38 <_Z8userMainv+0x174>
    80006b24:	00249493          	slli	s1,s1,0x2
    80006b28:	00006717          	auipc	a4,0x6
    80006b2c:	e6c70713          	addi	a4,a4,-404 # 8000c994 <CONSOLE_STATUS+0x984>
    80006b30:	00e484b3          	add	s1,s1,a4
    80006b34:	0004a783          	lw	a5,0(s1)
    80006b38:	00e787b3          	add	a5,a5,a4
    80006b3c:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006b40:	00000097          	auipc	ra,0x0
    80006b44:	e88080e7          	jalr	-376(ra) # 800069c8 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006b48:	00006517          	auipc	a0,0x6
    80006b4c:	c0050513          	addi	a0,a0,-1024 # 8000c748 <CONSOLE_STATUS+0x738>
    80006b50:	00000097          	auipc	ra,0x0
    80006b54:	4f4080e7          	jalr	1268(ra) # 80007044 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    printString("Kraj izvrsavanja");
    80006b58:	00006517          	auipc	a0,0x6
    80006b5c:	e2850513          	addi	a0,a0,-472 # 8000c980 <CONSOLE_STATUS+0x970>
    80006b60:	00000097          	auipc	ra,0x0
    80006b64:	4e4080e7          	jalr	1252(ra) # 80007044 <_Z11printStringPKc>
    80006b68:	01813083          	ld	ra,24(sp)
    80006b6c:	01013403          	ld	s0,16(sp)
    80006b70:	00813483          	ld	s1,8(sp)
    80006b74:	00013903          	ld	s2,0(sp)
    80006b78:	02010113          	addi	sp,sp,32
    80006b7c:	00008067          	ret
            Threads_CPP_API_test();
    80006b80:	00002097          	auipc	ra,0x2
    80006b84:	850080e7          	jalr	-1968(ra) # 800083d0 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006b88:	00006517          	auipc	a0,0x6
    80006b8c:	c0050513          	addi	a0,a0,-1024 # 8000c788 <CONSOLE_STATUS+0x778>
    80006b90:	00000097          	auipc	ra,0x0
    80006b94:	4b4080e7          	jalr	1204(ra) # 80007044 <_Z11printStringPKc>
            break;
    80006b98:	fc1ff06f          	j	80006b58 <_Z8userMainv+0x94>
            producerConsumer_C_API();
    80006b9c:	fffff097          	auipc	ra,0xfffff
    80006ba0:	680080e7          	jalr	1664(ra) # 8000621c <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006ba4:	00006517          	auipc	a0,0x6
    80006ba8:	c2450513          	addi	a0,a0,-988 # 8000c7c8 <CONSOLE_STATUS+0x7b8>
    80006bac:	00000097          	auipc	ra,0x0
    80006bb0:	498080e7          	jalr	1176(ra) # 80007044 <_Z11printStringPKc>
            break;
    80006bb4:	fa5ff06f          	j	80006b58 <_Z8userMainv+0x94>
            producerConsumer_CPP_Sync_API();
    80006bb8:	00001097          	auipc	ra,0x1
    80006bbc:	cf8080e7          	jalr	-776(ra) # 800078b0 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006bc0:	00006517          	auipc	a0,0x6
    80006bc4:	c5850513          	addi	a0,a0,-936 # 8000c818 <CONSOLE_STATUS+0x808>
    80006bc8:	00000097          	auipc	ra,0x0
    80006bcc:	47c080e7          	jalr	1148(ra) # 80007044 <_Z11printStringPKc>
            break;
    80006bd0:	f89ff06f          	j	80006b58 <_Z8userMainv+0x94>
            testSleeping();
    80006bd4:	fffff097          	auipc	ra,0xfffff
    80006bd8:	33c080e7          	jalr	828(ra) # 80005f10 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., time_sleep test C API)\n");
    80006bdc:	00006517          	auipc	a0,0x6
    80006be0:	c9450513          	addi	a0,a0,-876 # 8000c870 <CONSOLE_STATUS+0x860>
    80006be4:	00000097          	auipc	ra,0x0
    80006be8:	460080e7          	jalr	1120(ra) # 80007044 <_Z11printStringPKc>
            break;
    80006bec:	f6dff06f          	j	80006b58 <_Z8userMainv+0x94>
            testConsumerProducer();
    80006bf0:	00002097          	auipc	ra,0x2
    80006bf4:	ca0080e7          	jalr	-864(ra) # 80008890 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006bf8:	00006517          	auipc	a0,0x6
    80006bfc:	ca850513          	addi	a0,a0,-856 # 8000c8a0 <CONSOLE_STATUS+0x890>
    80006c00:	00000097          	auipc	ra,0x0
    80006c04:	444080e7          	jalr	1092(ra) # 80007044 <_Z11printStringPKc>
            break;
    80006c08:	f51ff06f          	j	80006b58 <_Z8userMainv+0x94>
            System_Mode_test();
    80006c0c:	fffff097          	auipc	ra,0xfffff
    80006c10:	158080e7          	jalr	344(ra) # 80005d64 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006c14:	00006517          	auipc	a0,0x6
    80006c18:	ccc50513          	addi	a0,a0,-820 # 8000c8e0 <CONSOLE_STATUS+0x8d0>
    80006c1c:	00000097          	auipc	ra,0x0
    80006c20:	428080e7          	jalr	1064(ra) # 80007044 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006c24:	00006517          	auipc	a0,0x6
    80006c28:	cdc50513          	addi	a0,a0,-804 # 8000c900 <CONSOLE_STATUS+0x8f0>
    80006c2c:	00000097          	auipc	ra,0x0
    80006c30:	418080e7          	jalr	1048(ra) # 80007044 <_Z11printStringPKc>
            break;
    80006c34:	f25ff06f          	j	80006b58 <_Z8userMainv+0x94>
            printString("Niste uneli odgovarajuci broj za test\n");
    80006c38:	00006517          	auipc	a0,0x6
    80006c3c:	d2050513          	addi	a0,a0,-736 # 8000c958 <CONSOLE_STATUS+0x948>
    80006c40:	00000097          	auipc	ra,0x0
    80006c44:	404080e7          	jalr	1028(ra) # 80007044 <_Z11printStringPKc>
    80006c48:	f11ff06f          	j	80006b58 <_Z8userMainv+0x94>

0000000080006c4c <_ZN9BufferCPPC1Ei>:
#include "../test_h/buffer_CPP_API.h"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006c4c:	fd010113          	addi	sp,sp,-48
    80006c50:	02113423          	sd	ra,40(sp)
    80006c54:	02813023          	sd	s0,32(sp)
    80006c58:	00913c23          	sd	s1,24(sp)
    80006c5c:	01213823          	sd	s2,16(sp)
    80006c60:	01313423          	sd	s3,8(sp)
    80006c64:	03010413          	addi	s0,sp,48
    80006c68:	00050493          	mv	s1,a0
    80006c6c:	00058913          	mv	s2,a1
    80006c70:	0015879b          	addiw	a5,a1,1
    80006c74:	0007851b          	sext.w	a0,a5
    80006c78:	00f4a023          	sw	a5,0(s1)
    80006c7c:	0004a823          	sw	zero,16(s1)
    80006c80:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006c84:	00251513          	slli	a0,a0,0x2
    80006c88:	ffffb097          	auipc	ra,0xffffb
    80006c8c:	120080e7          	jalr	288(ra) # 80001da8 <_Z9mem_allocm>
    80006c90:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006c94:	01000513          	li	a0,16
    80006c98:	ffffa097          	auipc	ra,0xffffa
    80006c9c:	5a8080e7          	jalr	1448(ra) # 80001240 <_Znwm>
    80006ca0:	00050993          	mv	s3,a0
    80006ca4:	00000593          	li	a1,0
    80006ca8:	ffffa097          	auipc	ra,0xffffa
    80006cac:	7b0080e7          	jalr	1968(ra) # 80001458 <_ZN9SemaphoreC1Ej>
    80006cb0:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006cb4:	01000513          	li	a0,16
    80006cb8:	ffffa097          	auipc	ra,0xffffa
    80006cbc:	588080e7          	jalr	1416(ra) # 80001240 <_Znwm>
    80006cc0:	00050993          	mv	s3,a0
    80006cc4:	00090593          	mv	a1,s2
    80006cc8:	ffffa097          	auipc	ra,0xffffa
    80006ccc:	790080e7          	jalr	1936(ra) # 80001458 <_ZN9SemaphoreC1Ej>
    80006cd0:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006cd4:	01000513          	li	a0,16
    80006cd8:	ffffa097          	auipc	ra,0xffffa
    80006cdc:	568080e7          	jalr	1384(ra) # 80001240 <_Znwm>
    80006ce0:	00050913          	mv	s2,a0
    80006ce4:	00100593          	li	a1,1
    80006ce8:	ffffa097          	auipc	ra,0xffffa
    80006cec:	770080e7          	jalr	1904(ra) # 80001458 <_ZN9SemaphoreC1Ej>
    80006cf0:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006cf4:	01000513          	li	a0,16
    80006cf8:	ffffa097          	auipc	ra,0xffffa
    80006cfc:	548080e7          	jalr	1352(ra) # 80001240 <_Znwm>
    80006d00:	00050913          	mv	s2,a0
    80006d04:	00100593          	li	a1,1
    80006d08:	ffffa097          	auipc	ra,0xffffa
    80006d0c:	750080e7          	jalr	1872(ra) # 80001458 <_ZN9SemaphoreC1Ej>
    80006d10:	0324b823          	sd	s2,48(s1)
}
    80006d14:	02813083          	ld	ra,40(sp)
    80006d18:	02013403          	ld	s0,32(sp)
    80006d1c:	01813483          	ld	s1,24(sp)
    80006d20:	01013903          	ld	s2,16(sp)
    80006d24:	00813983          	ld	s3,8(sp)
    80006d28:	03010113          	addi	sp,sp,48
    80006d2c:	00008067          	ret
    80006d30:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006d34:	00098513          	mv	a0,s3
    80006d38:	ffffa097          	auipc	ra,0xffffa
    80006d3c:	530080e7          	jalr	1328(ra) # 80001268 <_ZdlPv>
    80006d40:	00048513          	mv	a0,s1
    80006d44:	00009097          	auipc	ra,0x9
    80006d48:	634080e7          	jalr	1588(ra) # 80010378 <_Unwind_Resume>
    80006d4c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006d50:	00098513          	mv	a0,s3
    80006d54:	ffffa097          	auipc	ra,0xffffa
    80006d58:	514080e7          	jalr	1300(ra) # 80001268 <_ZdlPv>
    80006d5c:	00048513          	mv	a0,s1
    80006d60:	00009097          	auipc	ra,0x9
    80006d64:	618080e7          	jalr	1560(ra) # 80010378 <_Unwind_Resume>
    80006d68:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006d6c:	00090513          	mv	a0,s2
    80006d70:	ffffa097          	auipc	ra,0xffffa
    80006d74:	4f8080e7          	jalr	1272(ra) # 80001268 <_ZdlPv>
    80006d78:	00048513          	mv	a0,s1
    80006d7c:	00009097          	auipc	ra,0x9
    80006d80:	5fc080e7          	jalr	1532(ra) # 80010378 <_Unwind_Resume>
    80006d84:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006d88:	00090513          	mv	a0,s2
    80006d8c:	ffffa097          	auipc	ra,0xffffa
    80006d90:	4dc080e7          	jalr	1244(ra) # 80001268 <_ZdlPv>
    80006d94:	00048513          	mv	a0,s1
    80006d98:	00009097          	auipc	ra,0x9
    80006d9c:	5e0080e7          	jalr	1504(ra) # 80010378 <_Unwind_Resume>

0000000080006da0 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006da0:	fe010113          	addi	sp,sp,-32
    80006da4:	00113c23          	sd	ra,24(sp)
    80006da8:	00813823          	sd	s0,16(sp)
    80006dac:	00913423          	sd	s1,8(sp)
    80006db0:	01213023          	sd	s2,0(sp)
    80006db4:	02010413          	addi	s0,sp,32
    80006db8:	00050493          	mv	s1,a0
    80006dbc:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80006dc0:	01853503          	ld	a0,24(a0)
    80006dc4:	ffffa097          	auipc	ra,0xffffa
    80006dc8:	6cc080e7          	jalr	1740(ra) # 80001490 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006dcc:	0304b503          	ld	a0,48(s1)
    80006dd0:	ffffa097          	auipc	ra,0xffffa
    80006dd4:	6c0080e7          	jalr	1728(ra) # 80001490 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80006dd8:	0084b783          	ld	a5,8(s1)
    80006ddc:	0144a703          	lw	a4,20(s1)
    80006de0:	00271713          	slli	a4,a4,0x2
    80006de4:	00e787b3          	add	a5,a5,a4
    80006de8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006dec:	0144a783          	lw	a5,20(s1)
    80006df0:	0017879b          	addiw	a5,a5,1
    80006df4:	0004a703          	lw	a4,0(s1)
    80006df8:	02e7e7bb          	remw	a5,a5,a4
    80006dfc:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006e00:	0304b503          	ld	a0,48(s1)
    80006e04:	ffffa097          	auipc	ra,0xffffa
    80006e08:	6b8080e7          	jalr	1720(ra) # 800014bc <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006e0c:	0204b503          	ld	a0,32(s1)
    80006e10:	ffffa097          	auipc	ra,0xffffa
    80006e14:	6ac080e7          	jalr	1708(ra) # 800014bc <_ZN9Semaphore6signalEv>

}
    80006e18:	01813083          	ld	ra,24(sp)
    80006e1c:	01013403          	ld	s0,16(sp)
    80006e20:	00813483          	ld	s1,8(sp)
    80006e24:	00013903          	ld	s2,0(sp)
    80006e28:	02010113          	addi	sp,sp,32
    80006e2c:	00008067          	ret

0000000080006e30 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006e30:	fe010113          	addi	sp,sp,-32
    80006e34:	00113c23          	sd	ra,24(sp)
    80006e38:	00813823          	sd	s0,16(sp)
    80006e3c:	00913423          	sd	s1,8(sp)
    80006e40:	01213023          	sd	s2,0(sp)
    80006e44:	02010413          	addi	s0,sp,32
    80006e48:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006e4c:	02053503          	ld	a0,32(a0)
    80006e50:	ffffa097          	auipc	ra,0xffffa
    80006e54:	640080e7          	jalr	1600(ra) # 80001490 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006e58:	0284b503          	ld	a0,40(s1)
    80006e5c:	ffffa097          	auipc	ra,0xffffa
    80006e60:	634080e7          	jalr	1588(ra) # 80001490 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006e64:	0084b703          	ld	a4,8(s1)
    80006e68:	0104a783          	lw	a5,16(s1)
    80006e6c:	00279693          	slli	a3,a5,0x2
    80006e70:	00d70733          	add	a4,a4,a3
    80006e74:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006e78:	0017879b          	addiw	a5,a5,1
    80006e7c:	0004a703          	lw	a4,0(s1)
    80006e80:	02e7e7bb          	remw	a5,a5,a4
    80006e84:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006e88:	0284b503          	ld	a0,40(s1)
    80006e8c:	ffffa097          	auipc	ra,0xffffa
    80006e90:	630080e7          	jalr	1584(ra) # 800014bc <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006e94:	0184b503          	ld	a0,24(s1)
    80006e98:	ffffa097          	auipc	ra,0xffffa
    80006e9c:	624080e7          	jalr	1572(ra) # 800014bc <_ZN9Semaphore6signalEv>

    return ret;
}
    80006ea0:	00090513          	mv	a0,s2
    80006ea4:	01813083          	ld	ra,24(sp)
    80006ea8:	01013403          	ld	s0,16(sp)
    80006eac:	00813483          	ld	s1,8(sp)
    80006eb0:	00013903          	ld	s2,0(sp)
    80006eb4:	02010113          	addi	sp,sp,32
    80006eb8:	00008067          	ret

0000000080006ebc <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006ebc:	fe010113          	addi	sp,sp,-32
    80006ec0:	00113c23          	sd	ra,24(sp)
    80006ec4:	00813823          	sd	s0,16(sp)
    80006ec8:	00913423          	sd	s1,8(sp)
    80006ecc:	01213023          	sd	s2,0(sp)
    80006ed0:	02010413          	addi	s0,sp,32
    80006ed4:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006ed8:	02853503          	ld	a0,40(a0)
    80006edc:	ffffa097          	auipc	ra,0xffffa
    80006ee0:	5b4080e7          	jalr	1460(ra) # 80001490 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006ee4:	0304b503          	ld	a0,48(s1)
    80006ee8:	ffffa097          	auipc	ra,0xffffa
    80006eec:	5a8080e7          	jalr	1448(ra) # 80001490 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006ef0:	0144a783          	lw	a5,20(s1)
    80006ef4:	0104a903          	lw	s2,16(s1)
    80006ef8:	0327ce63          	blt	a5,s2,80006f34 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006efc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006f00:	0304b503          	ld	a0,48(s1)
    80006f04:	ffffa097          	auipc	ra,0xffffa
    80006f08:	5b8080e7          	jalr	1464(ra) # 800014bc <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006f0c:	0284b503          	ld	a0,40(s1)
    80006f10:	ffffa097          	auipc	ra,0xffffa
    80006f14:	5ac080e7          	jalr	1452(ra) # 800014bc <_ZN9Semaphore6signalEv>

    return ret;
}
    80006f18:	00090513          	mv	a0,s2
    80006f1c:	01813083          	ld	ra,24(sp)
    80006f20:	01013403          	ld	s0,16(sp)
    80006f24:	00813483          	ld	s1,8(sp)
    80006f28:	00013903          	ld	s2,0(sp)
    80006f2c:	02010113          	addi	sp,sp,32
    80006f30:	00008067          	ret
        ret = cap - head + tail;
    80006f34:	0004a703          	lw	a4,0(s1)
    80006f38:	4127093b          	subw	s2,a4,s2
    80006f3c:	00f9093b          	addw	s2,s2,a5
    80006f40:	fc1ff06f          	j	80006f00 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006f44 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006f44:	fe010113          	addi	sp,sp,-32
    80006f48:	00113c23          	sd	ra,24(sp)
    80006f4c:	00813823          	sd	s0,16(sp)
    80006f50:	00913423          	sd	s1,8(sp)
    80006f54:	02010413          	addi	s0,sp,32
    80006f58:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006f5c:	00a00513          	li	a0,10
    80006f60:	ffffa097          	auipc	ra,0xffffa
    80006f64:	668080e7          	jalr	1640(ra) # 800015c8 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006f68:	00006517          	auipc	a0,0x6
    80006f6c:	a5050513          	addi	a0,a0,-1456 # 8000c9b8 <CONSOLE_STATUS+0x9a8>
    80006f70:	00000097          	auipc	ra,0x0
    80006f74:	0d4080e7          	jalr	212(ra) # 80007044 <_Z11printStringPKc>
    while (getCnt()) {
    80006f78:	00048513          	mv	a0,s1
    80006f7c:	00000097          	auipc	ra,0x0
    80006f80:	f40080e7          	jalr	-192(ra) # 80006ebc <_ZN9BufferCPP6getCntEv>
    80006f84:	02050c63          	beqz	a0,80006fbc <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006f88:	0084b783          	ld	a5,8(s1)
    80006f8c:	0104a703          	lw	a4,16(s1)
    80006f90:	00271713          	slli	a4,a4,0x2
    80006f94:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006f98:	0007c503          	lbu	a0,0(a5)
    80006f9c:	ffffa097          	auipc	ra,0xffffa
    80006fa0:	62c080e7          	jalr	1580(ra) # 800015c8 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006fa4:	0104a783          	lw	a5,16(s1)
    80006fa8:	0017879b          	addiw	a5,a5,1
    80006fac:	0004a703          	lw	a4,0(s1)
    80006fb0:	02e7e7bb          	remw	a5,a5,a4
    80006fb4:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006fb8:	fc1ff06f          	j	80006f78 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006fbc:	02100513          	li	a0,33
    80006fc0:	ffffa097          	auipc	ra,0xffffa
    80006fc4:	608080e7          	jalr	1544(ra) # 800015c8 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006fc8:	00a00513          	li	a0,10
    80006fcc:	ffffa097          	auipc	ra,0xffffa
    80006fd0:	5fc080e7          	jalr	1532(ra) # 800015c8 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006fd4:	0084b503          	ld	a0,8(s1)
    80006fd8:	ffffb097          	auipc	ra,0xffffb
    80006fdc:	e00080e7          	jalr	-512(ra) # 80001dd8 <_Z8mem_freePv>
    delete itemAvailable;
    80006fe0:	0204b503          	ld	a0,32(s1)
    80006fe4:	00050863          	beqz	a0,80006ff4 <_ZN9BufferCPPD1Ev+0xb0>
    80006fe8:	00053783          	ld	a5,0(a0)
    80006fec:	0087b783          	ld	a5,8(a5)
    80006ff0:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006ff4:	0184b503          	ld	a0,24(s1)
    80006ff8:	00050863          	beqz	a0,80007008 <_ZN9BufferCPPD1Ev+0xc4>
    80006ffc:	00053783          	ld	a5,0(a0)
    80007000:	0087b783          	ld	a5,8(a5)
    80007004:	000780e7          	jalr	a5
    delete mutexTail;
    80007008:	0304b503          	ld	a0,48(s1)
    8000700c:	00050863          	beqz	a0,8000701c <_ZN9BufferCPPD1Ev+0xd8>
    80007010:	00053783          	ld	a5,0(a0)
    80007014:	0087b783          	ld	a5,8(a5)
    80007018:	000780e7          	jalr	a5
    delete mutexHead;
    8000701c:	0284b503          	ld	a0,40(s1)
    80007020:	00050863          	beqz	a0,80007030 <_ZN9BufferCPPD1Ev+0xec>
    80007024:	00053783          	ld	a5,0(a0)
    80007028:	0087b783          	ld	a5,8(a5)
    8000702c:	000780e7          	jalr	a5
}
    80007030:	01813083          	ld	ra,24(sp)
    80007034:	01013403          	ld	s0,16(sp)
    80007038:	00813483          	ld	s1,8(sp)
    8000703c:	02010113          	addi	sp,sp,32
    80007040:	00008067          	ret

0000000080007044 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80007044:	fe010113          	addi	sp,sp,-32
    80007048:	00113c23          	sd	ra,24(sp)
    8000704c:	00813823          	sd	s0,16(sp)
    80007050:	00913423          	sd	s1,8(sp)
    80007054:	02010413          	addi	s0,sp,32
    80007058:	00050493          	mv	s1,a0
    LOCK();
    8000705c:	00100613          	li	a2,1
    80007060:	00000593          	li	a1,0
    80007064:	00008517          	auipc	a0,0x8
    80007068:	21c50513          	addi	a0,a0,540 # 8000f280 <lockPrint>
    8000706c:	ffffa097          	auipc	ra,0xffffa
    80007070:	118080e7          	jalr	280(ra) # 80001184 <copy_and_swap>
    80007074:	00050863          	beqz	a0,80007084 <_Z11printStringPKc+0x40>
    80007078:	ffffb097          	auipc	ra,0xffffb
    8000707c:	e28080e7          	jalr	-472(ra) # 80001ea0 <_Z15thread_dispatchv>
    80007080:	fddff06f          	j	8000705c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80007084:	0004c503          	lbu	a0,0(s1)
    80007088:	00050a63          	beqz	a0,8000709c <_Z11printStringPKc+0x58>
    {
        putc(*string);
    8000708c:	ffffb097          	auipc	ra,0xffffb
    80007090:	fc4080e7          	jalr	-60(ra) # 80002050 <_Z4putcc>
        string++;
    80007094:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80007098:	fedff06f          	j	80007084 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    8000709c:	00000613          	li	a2,0
    800070a0:	00100593          	li	a1,1
    800070a4:	00008517          	auipc	a0,0x8
    800070a8:	1dc50513          	addi	a0,a0,476 # 8000f280 <lockPrint>
    800070ac:	ffffa097          	auipc	ra,0xffffa
    800070b0:	0d8080e7          	jalr	216(ra) # 80001184 <copy_and_swap>
    800070b4:	fe0514e3          	bnez	a0,8000709c <_Z11printStringPKc+0x58>
}
    800070b8:	01813083          	ld	ra,24(sp)
    800070bc:	01013403          	ld	s0,16(sp)
    800070c0:	00813483          	ld	s1,8(sp)
    800070c4:	02010113          	addi	sp,sp,32
    800070c8:	00008067          	ret

00000000800070cc <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800070cc:	fd010113          	addi	sp,sp,-48
    800070d0:	02113423          	sd	ra,40(sp)
    800070d4:	02813023          	sd	s0,32(sp)
    800070d8:	00913c23          	sd	s1,24(sp)
    800070dc:	01213823          	sd	s2,16(sp)
    800070e0:	01313423          	sd	s3,8(sp)
    800070e4:	01413023          	sd	s4,0(sp)
    800070e8:	03010413          	addi	s0,sp,48
    800070ec:	00050993          	mv	s3,a0
    800070f0:	00058a13          	mv	s4,a1
    LOCK();
    800070f4:	00100613          	li	a2,1
    800070f8:	00000593          	li	a1,0
    800070fc:	00008517          	auipc	a0,0x8
    80007100:	18450513          	addi	a0,a0,388 # 8000f280 <lockPrint>
    80007104:	ffffa097          	auipc	ra,0xffffa
    80007108:	080080e7          	jalr	128(ra) # 80001184 <copy_and_swap>
    8000710c:	00050863          	beqz	a0,8000711c <_Z9getStringPci+0x50>
    80007110:	ffffb097          	auipc	ra,0xffffb
    80007114:	d90080e7          	jalr	-624(ra) # 80001ea0 <_Z15thread_dispatchv>
    80007118:	fddff06f          	j	800070f4 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    8000711c:	00000913          	li	s2,0
    80007120:	00090493          	mv	s1,s2
    80007124:	0019091b          	addiw	s2,s2,1
    80007128:	03495a63          	bge	s2,s4,8000715c <_Z9getStringPci+0x90>
        cc = getc();
    8000712c:	ffffb097          	auipc	ra,0xffffb
    80007130:	efc080e7          	jalr	-260(ra) # 80002028 <_Z4getcv>
        if(cc < 1)
    80007134:	02050463          	beqz	a0,8000715c <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80007138:	009984b3          	add	s1,s3,s1
    8000713c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80007140:	00a00793          	li	a5,10
    80007144:	00f50a63          	beq	a0,a5,80007158 <_Z9getStringPci+0x8c>
    80007148:	00d00793          	li	a5,13
    8000714c:	fcf51ae3          	bne	a0,a5,80007120 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80007150:	00090493          	mv	s1,s2
    80007154:	0080006f          	j	8000715c <_Z9getStringPci+0x90>
    80007158:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    8000715c:	009984b3          	add	s1,s3,s1
    80007160:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80007164:	00000613          	li	a2,0
    80007168:	00100593          	li	a1,1
    8000716c:	00008517          	auipc	a0,0x8
    80007170:	11450513          	addi	a0,a0,276 # 8000f280 <lockPrint>
    80007174:	ffffa097          	auipc	ra,0xffffa
    80007178:	010080e7          	jalr	16(ra) # 80001184 <copy_and_swap>
    8000717c:	fe0514e3          	bnez	a0,80007164 <_Z9getStringPci+0x98>
    return buf;
}
    80007180:	00098513          	mv	a0,s3
    80007184:	02813083          	ld	ra,40(sp)
    80007188:	02013403          	ld	s0,32(sp)
    8000718c:	01813483          	ld	s1,24(sp)
    80007190:	01013903          	ld	s2,16(sp)
    80007194:	00813983          	ld	s3,8(sp)
    80007198:	00013a03          	ld	s4,0(sp)
    8000719c:	03010113          	addi	sp,sp,48
    800071a0:	00008067          	ret

00000000800071a4 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800071a4:	ff010113          	addi	sp,sp,-16
    800071a8:	00813423          	sd	s0,8(sp)
    800071ac:	01010413          	addi	s0,sp,16
    800071b0:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800071b4:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800071b8:	0006c603          	lbu	a2,0(a3)
    800071bc:	fd06071b          	addiw	a4,a2,-48
    800071c0:	0ff77713          	andi	a4,a4,255
    800071c4:	00900793          	li	a5,9
    800071c8:	02e7e063          	bltu	a5,a4,800071e8 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800071cc:	0025179b          	slliw	a5,a0,0x2
    800071d0:	00a787bb          	addw	a5,a5,a0
    800071d4:	0017979b          	slliw	a5,a5,0x1
    800071d8:	00168693          	addi	a3,a3,1
    800071dc:	00c787bb          	addw	a5,a5,a2
    800071e0:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800071e4:	fd5ff06f          	j	800071b8 <_Z11stringToIntPKc+0x14>
    return n;
}
    800071e8:	00813403          	ld	s0,8(sp)
    800071ec:	01010113          	addi	sp,sp,16
    800071f0:	00008067          	ret

00000000800071f4 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800071f4:	fc010113          	addi	sp,sp,-64
    800071f8:	02113c23          	sd	ra,56(sp)
    800071fc:	02813823          	sd	s0,48(sp)
    80007200:	02913423          	sd	s1,40(sp)
    80007204:	03213023          	sd	s2,32(sp)
    80007208:	01313c23          	sd	s3,24(sp)
    8000720c:	04010413          	addi	s0,sp,64
    80007210:	00050493          	mv	s1,a0
    80007214:	00058913          	mv	s2,a1
    80007218:	00060993          	mv	s3,a2
    LOCK();
    8000721c:	00100613          	li	a2,1
    80007220:	00000593          	li	a1,0
    80007224:	00008517          	auipc	a0,0x8
    80007228:	05c50513          	addi	a0,a0,92 # 8000f280 <lockPrint>
    8000722c:	ffffa097          	auipc	ra,0xffffa
    80007230:	f58080e7          	jalr	-168(ra) # 80001184 <copy_and_swap>
    80007234:	00050863          	beqz	a0,80007244 <_Z8printIntiii+0x50>
    80007238:	ffffb097          	auipc	ra,0xffffb
    8000723c:	c68080e7          	jalr	-920(ra) # 80001ea0 <_Z15thread_dispatchv>
    80007240:	fddff06f          	j	8000721c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80007244:	00098463          	beqz	s3,8000724c <_Z8printIntiii+0x58>
    80007248:	0804c463          	bltz	s1,800072d0 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    8000724c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80007250:	00000593          	li	a1,0
    }

    i = 0;
    80007254:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80007258:	0009079b          	sext.w	a5,s2
    8000725c:	0325773b          	remuw	a4,a0,s2
    80007260:	00048613          	mv	a2,s1
    80007264:	0014849b          	addiw	s1,s1,1
    80007268:	02071693          	slli	a3,a4,0x20
    8000726c:	0206d693          	srli	a3,a3,0x20
    80007270:	00008717          	auipc	a4,0x8
    80007274:	d6070713          	addi	a4,a4,-672 # 8000efd0 <digits>
    80007278:	00d70733          	add	a4,a4,a3
    8000727c:	00074683          	lbu	a3,0(a4)
    80007280:	fd040713          	addi	a4,s0,-48
    80007284:	00c70733          	add	a4,a4,a2
    80007288:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    8000728c:	0005071b          	sext.w	a4,a0
    80007290:	0325553b          	divuw	a0,a0,s2
    80007294:	fcf772e3          	bgeu	a4,a5,80007258 <_Z8printIntiii+0x64>
    if(neg)
    80007298:	00058c63          	beqz	a1,800072b0 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    8000729c:	fd040793          	addi	a5,s0,-48
    800072a0:	009784b3          	add	s1,a5,s1
    800072a4:	02d00793          	li	a5,45
    800072a8:	fef48823          	sb	a5,-16(s1)
    800072ac:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800072b0:	fff4849b          	addiw	s1,s1,-1
    800072b4:	0204c463          	bltz	s1,800072dc <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800072b8:	fd040793          	addi	a5,s0,-48
    800072bc:	009787b3          	add	a5,a5,s1
    800072c0:	ff07c503          	lbu	a0,-16(a5)
    800072c4:	ffffb097          	auipc	ra,0xffffb
    800072c8:	d8c080e7          	jalr	-628(ra) # 80002050 <_Z4putcc>
    800072cc:	fe5ff06f          	j	800072b0 <_Z8printIntiii+0xbc>
        x = -xx;
    800072d0:	4090053b          	negw	a0,s1
        neg = 1;
    800072d4:	00100593          	li	a1,1
        x = -xx;
    800072d8:	f7dff06f          	j	80007254 <_Z8printIntiii+0x60>

    UNLOCK();
    800072dc:	00000613          	li	a2,0
    800072e0:	00100593          	li	a1,1
    800072e4:	00008517          	auipc	a0,0x8
    800072e8:	f9c50513          	addi	a0,a0,-100 # 8000f280 <lockPrint>
    800072ec:	ffffa097          	auipc	ra,0xffffa
    800072f0:	e98080e7          	jalr	-360(ra) # 80001184 <copy_and_swap>
    800072f4:	fe0514e3          	bnez	a0,800072dc <_Z8printIntiii+0xe8>
    800072f8:	03813083          	ld	ra,56(sp)
    800072fc:	03013403          	ld	s0,48(sp)
    80007300:	02813483          	ld	s1,40(sp)
    80007304:	02013903          	ld	s2,32(sp)
    80007308:	01813983          	ld	s3,24(sp)
    8000730c:	04010113          	addi	sp,sp,64
    80007310:	00008067          	ret

0000000080007314 <_ZN6BufferC1Ei>:
#include "../test_h/buffer.h"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80007314:	fe010113          	addi	sp,sp,-32
    80007318:	00113c23          	sd	ra,24(sp)
    8000731c:	00813823          	sd	s0,16(sp)
    80007320:	00913423          	sd	s1,8(sp)
    80007324:	01213023          	sd	s2,0(sp)
    80007328:	02010413          	addi	s0,sp,32
    8000732c:	00050493          	mv	s1,a0
    80007330:	00058913          	mv	s2,a1
    80007334:	0015879b          	addiw	a5,a1,1
    80007338:	0007851b          	sext.w	a0,a5
    8000733c:	00f4a023          	sw	a5,0(s1)
    80007340:	0004a823          	sw	zero,16(s1)
    80007344:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80007348:	00251513          	slli	a0,a0,0x2
    8000734c:	ffffb097          	auipc	ra,0xffffb
    80007350:	a5c080e7          	jalr	-1444(ra) # 80001da8 <_Z9mem_allocm>
    80007354:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80007358:	00000593          	li	a1,0
    8000735c:	02048513          	addi	a0,s1,32
    80007360:	ffffb097          	auipc	ra,0xffffb
    80007364:	bb0080e7          	jalr	-1104(ra) # 80001f10 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80007368:	00090593          	mv	a1,s2
    8000736c:	01848513          	addi	a0,s1,24
    80007370:	ffffb097          	auipc	ra,0xffffb
    80007374:	ba0080e7          	jalr	-1120(ra) # 80001f10 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80007378:	00100593          	li	a1,1
    8000737c:	02848513          	addi	a0,s1,40
    80007380:	ffffb097          	auipc	ra,0xffffb
    80007384:	b90080e7          	jalr	-1136(ra) # 80001f10 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80007388:	00100593          	li	a1,1
    8000738c:	03048513          	addi	a0,s1,48
    80007390:	ffffb097          	auipc	ra,0xffffb
    80007394:	b80080e7          	jalr	-1152(ra) # 80001f10 <_Z8sem_openPP4_semj>
}
    80007398:	01813083          	ld	ra,24(sp)
    8000739c:	01013403          	ld	s0,16(sp)
    800073a0:	00813483          	ld	s1,8(sp)
    800073a4:	00013903          	ld	s2,0(sp)
    800073a8:	02010113          	addi	sp,sp,32
    800073ac:	00008067          	ret

00000000800073b0 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800073b0:	fe010113          	addi	sp,sp,-32
    800073b4:	00113c23          	sd	ra,24(sp)
    800073b8:	00813823          	sd	s0,16(sp)
    800073bc:	00913423          	sd	s1,8(sp)
    800073c0:	01213023          	sd	s2,0(sp)
    800073c4:	02010413          	addi	s0,sp,32
    800073c8:	00050493          	mv	s1,a0
    800073cc:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800073d0:	01853503          	ld	a0,24(a0)
    800073d4:	ffffb097          	auipc	ra,0xffffb
    800073d8:	ba0080e7          	jalr	-1120(ra) # 80001f74 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    800073dc:	0304b503          	ld	a0,48(s1)
    800073e0:	ffffb097          	auipc	ra,0xffffb
    800073e4:	b94080e7          	jalr	-1132(ra) # 80001f74 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    800073e8:	0084b783          	ld	a5,8(s1)
    800073ec:	0144a703          	lw	a4,20(s1)
    800073f0:	00271713          	slli	a4,a4,0x2
    800073f4:	00e787b3          	add	a5,a5,a4
    800073f8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800073fc:	0144a783          	lw	a5,20(s1)
    80007400:	0017879b          	addiw	a5,a5,1
    80007404:	0004a703          	lw	a4,0(s1)
    80007408:	02e7e7bb          	remw	a5,a5,a4
    8000740c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80007410:	0304b503          	ld	a0,48(s1)
    80007414:	ffffb097          	auipc	ra,0xffffb
    80007418:	b8c080e7          	jalr	-1140(ra) # 80001fa0 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    8000741c:	0204b503          	ld	a0,32(s1)
    80007420:	ffffb097          	auipc	ra,0xffffb
    80007424:	b80080e7          	jalr	-1152(ra) # 80001fa0 <_Z10sem_signalP4_sem>

}
    80007428:	01813083          	ld	ra,24(sp)
    8000742c:	01013403          	ld	s0,16(sp)
    80007430:	00813483          	ld	s1,8(sp)
    80007434:	00013903          	ld	s2,0(sp)
    80007438:	02010113          	addi	sp,sp,32
    8000743c:	00008067          	ret

0000000080007440 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80007440:	fe010113          	addi	sp,sp,-32
    80007444:	00113c23          	sd	ra,24(sp)
    80007448:	00813823          	sd	s0,16(sp)
    8000744c:	00913423          	sd	s1,8(sp)
    80007450:	01213023          	sd	s2,0(sp)
    80007454:	02010413          	addi	s0,sp,32
    80007458:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    8000745c:	02053503          	ld	a0,32(a0)
    80007460:	ffffb097          	auipc	ra,0xffffb
    80007464:	b14080e7          	jalr	-1260(ra) # 80001f74 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80007468:	0284b503          	ld	a0,40(s1)
    8000746c:	ffffb097          	auipc	ra,0xffffb
    80007470:	b08080e7          	jalr	-1272(ra) # 80001f74 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80007474:	0084b703          	ld	a4,8(s1)
    80007478:	0104a783          	lw	a5,16(s1)
    8000747c:	00279693          	slli	a3,a5,0x2
    80007480:	00d70733          	add	a4,a4,a3
    80007484:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80007488:	0017879b          	addiw	a5,a5,1
    8000748c:	0004a703          	lw	a4,0(s1)
    80007490:	02e7e7bb          	remw	a5,a5,a4
    80007494:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80007498:	0284b503          	ld	a0,40(s1)
    8000749c:	ffffb097          	auipc	ra,0xffffb
    800074a0:	b04080e7          	jalr	-1276(ra) # 80001fa0 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    800074a4:	0184b503          	ld	a0,24(s1)
    800074a8:	ffffb097          	auipc	ra,0xffffb
    800074ac:	af8080e7          	jalr	-1288(ra) # 80001fa0 <_Z10sem_signalP4_sem>

    return ret;
}
    800074b0:	00090513          	mv	a0,s2
    800074b4:	01813083          	ld	ra,24(sp)
    800074b8:	01013403          	ld	s0,16(sp)
    800074bc:	00813483          	ld	s1,8(sp)
    800074c0:	00013903          	ld	s2,0(sp)
    800074c4:	02010113          	addi	sp,sp,32
    800074c8:	00008067          	ret

00000000800074cc <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800074cc:	fe010113          	addi	sp,sp,-32
    800074d0:	00113c23          	sd	ra,24(sp)
    800074d4:	00813823          	sd	s0,16(sp)
    800074d8:	00913423          	sd	s1,8(sp)
    800074dc:	01213023          	sd	s2,0(sp)
    800074e0:	02010413          	addi	s0,sp,32
    800074e4:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800074e8:	02853503          	ld	a0,40(a0)
    800074ec:	ffffb097          	auipc	ra,0xffffb
    800074f0:	a88080e7          	jalr	-1400(ra) # 80001f74 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    800074f4:	0304b503          	ld	a0,48(s1)
    800074f8:	ffffb097          	auipc	ra,0xffffb
    800074fc:	a7c080e7          	jalr	-1412(ra) # 80001f74 <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80007500:	0144a783          	lw	a5,20(s1)
    80007504:	0104a903          	lw	s2,16(s1)
    80007508:	0327ce63          	blt	a5,s2,80007544 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    8000750c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80007510:	0304b503          	ld	a0,48(s1)
    80007514:	ffffb097          	auipc	ra,0xffffb
    80007518:	a8c080e7          	jalr	-1396(ra) # 80001fa0 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    8000751c:	0284b503          	ld	a0,40(s1)
    80007520:	ffffb097          	auipc	ra,0xffffb
    80007524:	a80080e7          	jalr	-1408(ra) # 80001fa0 <_Z10sem_signalP4_sem>

    return ret;
}
    80007528:	00090513          	mv	a0,s2
    8000752c:	01813083          	ld	ra,24(sp)
    80007530:	01013403          	ld	s0,16(sp)
    80007534:	00813483          	ld	s1,8(sp)
    80007538:	00013903          	ld	s2,0(sp)
    8000753c:	02010113          	addi	sp,sp,32
    80007540:	00008067          	ret
        ret = cap - head + tail;
    80007544:	0004a703          	lw	a4,0(s1)
    80007548:	4127093b          	subw	s2,a4,s2
    8000754c:	00f9093b          	addw	s2,s2,a5
    80007550:	fc1ff06f          	j	80007510 <_ZN6Buffer6getCntEv+0x44>

0000000080007554 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80007554:	fe010113          	addi	sp,sp,-32
    80007558:	00113c23          	sd	ra,24(sp)
    8000755c:	00813823          	sd	s0,16(sp)
    80007560:	00913423          	sd	s1,8(sp)
    80007564:	02010413          	addi	s0,sp,32
    80007568:	00050493          	mv	s1,a0
    putc('\n');
    8000756c:	00a00513          	li	a0,10
    80007570:	ffffb097          	auipc	ra,0xffffb
    80007574:	ae0080e7          	jalr	-1312(ra) # 80002050 <_Z4putcc>
    printString("Buffer deleted!\n");
    80007578:	00005517          	auipc	a0,0x5
    8000757c:	44050513          	addi	a0,a0,1088 # 8000c9b8 <CONSOLE_STATUS+0x9a8>
    80007580:	00000097          	auipc	ra,0x0
    80007584:	ac4080e7          	jalr	-1340(ra) # 80007044 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80007588:	00048513          	mv	a0,s1
    8000758c:	00000097          	auipc	ra,0x0
    80007590:	f40080e7          	jalr	-192(ra) # 800074cc <_ZN6Buffer6getCntEv>
    80007594:	02a05c63          	blez	a0,800075cc <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80007598:	0084b783          	ld	a5,8(s1)
    8000759c:	0104a703          	lw	a4,16(s1)
    800075a0:	00271713          	slli	a4,a4,0x2
    800075a4:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800075a8:	0007c503          	lbu	a0,0(a5)
    800075ac:	ffffb097          	auipc	ra,0xffffb
    800075b0:	aa4080e7          	jalr	-1372(ra) # 80002050 <_Z4putcc>
        head = (head + 1) % cap;
    800075b4:	0104a783          	lw	a5,16(s1)
    800075b8:	0017879b          	addiw	a5,a5,1
    800075bc:	0004a703          	lw	a4,0(s1)
    800075c0:	02e7e7bb          	remw	a5,a5,a4
    800075c4:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800075c8:	fc1ff06f          	j	80007588 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800075cc:	02100513          	li	a0,33
    800075d0:	ffffb097          	auipc	ra,0xffffb
    800075d4:	a80080e7          	jalr	-1408(ra) # 80002050 <_Z4putcc>
    putc('\n');
    800075d8:	00a00513          	li	a0,10
    800075dc:	ffffb097          	auipc	ra,0xffffb
    800075e0:	a74080e7          	jalr	-1420(ra) # 80002050 <_Z4putcc>
    mem_free(buffer);
    800075e4:	0084b503          	ld	a0,8(s1)
    800075e8:	ffffa097          	auipc	ra,0xffffa
    800075ec:	7f0080e7          	jalr	2032(ra) # 80001dd8 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800075f0:	0204b503          	ld	a0,32(s1)
    800075f4:	ffffb097          	auipc	ra,0xffffb
    800075f8:	954080e7          	jalr	-1708(ra) # 80001f48 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    800075fc:	0184b503          	ld	a0,24(s1)
    80007600:	ffffb097          	auipc	ra,0xffffb
    80007604:	948080e7          	jalr	-1720(ra) # 80001f48 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80007608:	0304b503          	ld	a0,48(s1)
    8000760c:	ffffb097          	auipc	ra,0xffffb
    80007610:	93c080e7          	jalr	-1732(ra) # 80001f48 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80007614:	0284b503          	ld	a0,40(s1)
    80007618:	ffffb097          	auipc	ra,0xffffb
    8000761c:	930080e7          	jalr	-1744(ra) # 80001f48 <_Z9sem_closeP4_sem>
}
    80007620:	01813083          	ld	ra,24(sp)
    80007624:	01013403          	ld	s0,16(sp)
    80007628:	00813483          	ld	s1,8(sp)
    8000762c:	02010113          	addi	sp,sp,32
    80007630:	00008067          	ret

0000000080007634 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80007634:	fd010113          	addi	sp,sp,-48
    80007638:	02113423          	sd	ra,40(sp)
    8000763c:	02813023          	sd	s0,32(sp)
    80007640:	00913c23          	sd	s1,24(sp)
    80007644:	01213823          	sd	s2,16(sp)
    80007648:	01313423          	sd	s3,8(sp)
    8000764c:	03010413          	addi	s0,sp,48
    80007650:	00050993          	mv	s3,a0
    80007654:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80007658:	00000913          	li	s2,0
    8000765c:	00c0006f          	j	80007668 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007660:	ffffa097          	auipc	ra,0xffffa
    80007664:	d3c080e7          	jalr	-708(ra) # 8000139c <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80007668:	ffffb097          	auipc	ra,0xffffb
    8000766c:	9c0080e7          	jalr	-1600(ra) # 80002028 <_Z4getcv>
    80007670:	0005059b          	sext.w	a1,a0
    80007674:	01b00793          	li	a5,27
    80007678:	02f58a63          	beq	a1,a5,800076ac <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    8000767c:	0084b503          	ld	a0,8(s1)
    80007680:	fffff097          	auipc	ra,0xfffff
    80007684:	720080e7          	jalr	1824(ra) # 80006da0 <_ZN9BufferCPP3putEi>
        i++;
    80007688:	0019071b          	addiw	a4,s2,1
    8000768c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007690:	0004a683          	lw	a3,0(s1)
    80007694:	0026979b          	slliw	a5,a3,0x2
    80007698:	00d787bb          	addw	a5,a5,a3
    8000769c:	0017979b          	slliw	a5,a5,0x1
    800076a0:	02f767bb          	remw	a5,a4,a5
    800076a4:	fc0792e3          	bnez	a5,80007668 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800076a8:	fb9ff06f          	j	80007660 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800076ac:	00100793          	li	a5,1
    800076b0:	00008717          	auipc	a4,0x8
    800076b4:	bcf72c23          	sw	a5,-1064(a4) # 8000f288 <_ZL9threadEnd>
    td->buffer->put('!');
    800076b8:	0209b783          	ld	a5,32(s3)
    800076bc:	02100593          	li	a1,33
    800076c0:	0087b503          	ld	a0,8(a5)
    800076c4:	fffff097          	auipc	ra,0xfffff
    800076c8:	6dc080e7          	jalr	1756(ra) # 80006da0 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800076cc:	0104b503          	ld	a0,16(s1)
    800076d0:	ffffa097          	auipc	ra,0xffffa
    800076d4:	dec080e7          	jalr	-532(ra) # 800014bc <_ZN9Semaphore6signalEv>
}
    800076d8:	02813083          	ld	ra,40(sp)
    800076dc:	02013403          	ld	s0,32(sp)
    800076e0:	01813483          	ld	s1,24(sp)
    800076e4:	01013903          	ld	s2,16(sp)
    800076e8:	00813983          	ld	s3,8(sp)
    800076ec:	03010113          	addi	sp,sp,48
    800076f0:	00008067          	ret

00000000800076f4 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800076f4:	fe010113          	addi	sp,sp,-32
    800076f8:	00113c23          	sd	ra,24(sp)
    800076fc:	00813823          	sd	s0,16(sp)
    80007700:	00913423          	sd	s1,8(sp)
    80007704:	01213023          	sd	s2,0(sp)
    80007708:	02010413          	addi	s0,sp,32
    8000770c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80007710:	00000913          	li	s2,0
    80007714:	00c0006f          	j	80007720 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80007718:	ffffa097          	auipc	ra,0xffffa
    8000771c:	c84080e7          	jalr	-892(ra) # 8000139c <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80007720:	00008797          	auipc	a5,0x8
    80007724:	b687a783          	lw	a5,-1176(a5) # 8000f288 <_ZL9threadEnd>
    80007728:	02079e63          	bnez	a5,80007764 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    8000772c:	0004a583          	lw	a1,0(s1)
    80007730:	0305859b          	addiw	a1,a1,48
    80007734:	0084b503          	ld	a0,8(s1)
    80007738:	fffff097          	auipc	ra,0xfffff
    8000773c:	668080e7          	jalr	1640(ra) # 80006da0 <_ZN9BufferCPP3putEi>
        i++;
    80007740:	0019071b          	addiw	a4,s2,1
    80007744:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80007748:	0004a683          	lw	a3,0(s1)
    8000774c:	0026979b          	slliw	a5,a3,0x2
    80007750:	00d787bb          	addw	a5,a5,a3
    80007754:	0017979b          	slliw	a5,a5,0x1
    80007758:	02f767bb          	remw	a5,a4,a5
    8000775c:	fc0792e3          	bnez	a5,80007720 <_ZN12ProducerSync8producerEPv+0x2c>
    80007760:	fb9ff06f          	j	80007718 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80007764:	0104b503          	ld	a0,16(s1)
    80007768:	ffffa097          	auipc	ra,0xffffa
    8000776c:	d54080e7          	jalr	-684(ra) # 800014bc <_ZN9Semaphore6signalEv>
}
    80007770:	01813083          	ld	ra,24(sp)
    80007774:	01013403          	ld	s0,16(sp)
    80007778:	00813483          	ld	s1,8(sp)
    8000777c:	00013903          	ld	s2,0(sp)
    80007780:	02010113          	addi	sp,sp,32
    80007784:	00008067          	ret

0000000080007788 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80007788:	fd010113          	addi	sp,sp,-48
    8000778c:	02113423          	sd	ra,40(sp)
    80007790:	02813023          	sd	s0,32(sp)
    80007794:	00913c23          	sd	s1,24(sp)
    80007798:	01213823          	sd	s2,16(sp)
    8000779c:	01313423          	sd	s3,8(sp)
    800077a0:	01413023          	sd	s4,0(sp)
    800077a4:	03010413          	addi	s0,sp,48
    800077a8:	00050993          	mv	s3,a0
    800077ac:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800077b0:	00000a13          	li	s4,0
    800077b4:	01c0006f          	j	800077d0 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800077b8:	ffffa097          	auipc	ra,0xffffa
    800077bc:	be4080e7          	jalr	-1052(ra) # 8000139c <_ZN6Thread8dispatchEv>
    800077c0:	0500006f          	j	80007810 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800077c4:	00a00513          	li	a0,10
    800077c8:	ffffb097          	auipc	ra,0xffffb
    800077cc:	888080e7          	jalr	-1912(ra) # 80002050 <_Z4putcc>
    while (!threadEnd) {
    800077d0:	00008797          	auipc	a5,0x8
    800077d4:	ab87a783          	lw	a5,-1352(a5) # 8000f288 <_ZL9threadEnd>
    800077d8:	06079263          	bnez	a5,8000783c <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800077dc:	00893503          	ld	a0,8(s2)
    800077e0:	fffff097          	auipc	ra,0xfffff
    800077e4:	650080e7          	jalr	1616(ra) # 80006e30 <_ZN9BufferCPP3getEv>
        i++;
    800077e8:	001a049b          	addiw	s1,s4,1
    800077ec:	00048a1b          	sext.w	s4,s1
        putc(key);
    800077f0:	0ff57513          	andi	a0,a0,255
    800077f4:	ffffb097          	auipc	ra,0xffffb
    800077f8:	85c080e7          	jalr	-1956(ra) # 80002050 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800077fc:	00092703          	lw	a4,0(s2)
    80007800:	0027179b          	slliw	a5,a4,0x2
    80007804:	00e787bb          	addw	a5,a5,a4
    80007808:	02f4e7bb          	remw	a5,s1,a5
    8000780c:	fa0786e3          	beqz	a5,800077b8 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80007810:	05000793          	li	a5,80
    80007814:	02f4e4bb          	remw	s1,s1,a5
    80007818:	fa049ce3          	bnez	s1,800077d0 <_ZN12ConsumerSync8consumerEPv+0x48>
    8000781c:	fa9ff06f          	j	800077c4 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80007820:	0209b783          	ld	a5,32(s3)
    80007824:	0087b503          	ld	a0,8(a5)
    80007828:	fffff097          	auipc	ra,0xfffff
    8000782c:	608080e7          	jalr	1544(ra) # 80006e30 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80007830:	0ff57513          	andi	a0,a0,255
    80007834:	ffffa097          	auipc	ra,0xffffa
    80007838:	d94080e7          	jalr	-620(ra) # 800015c8 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    8000783c:	0209b783          	ld	a5,32(s3)
    80007840:	0087b503          	ld	a0,8(a5)
    80007844:	fffff097          	auipc	ra,0xfffff
    80007848:	678080e7          	jalr	1656(ra) # 80006ebc <_ZN9BufferCPP6getCntEv>
    8000784c:	fca04ae3          	bgtz	a0,80007820 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80007850:	01093503          	ld	a0,16(s2)
    80007854:	ffffa097          	auipc	ra,0xffffa
    80007858:	c68080e7          	jalr	-920(ra) # 800014bc <_ZN9Semaphore6signalEv>
    printString("Thread "); printInt(data->id); printString(" end.\n");
    8000785c:	00005517          	auipc	a0,0x5
    80007860:	17450513          	addi	a0,a0,372 # 8000c9d0 <CONSOLE_STATUS+0x9c0>
    80007864:	fffff097          	auipc	ra,0xfffff
    80007868:	7e0080e7          	jalr	2016(ra) # 80007044 <_Z11printStringPKc>
    8000786c:	00000613          	li	a2,0
    80007870:	00a00593          	li	a1,10
    80007874:	00092503          	lw	a0,0(s2)
    80007878:	00000097          	auipc	ra,0x0
    8000787c:	97c080e7          	jalr	-1668(ra) # 800071f4 <_Z8printIntiii>
    80007880:	00005517          	auipc	a0,0x5
    80007884:	15850513          	addi	a0,a0,344 # 8000c9d8 <CONSOLE_STATUS+0x9c8>
    80007888:	fffff097          	auipc	ra,0xfffff
    8000788c:	7bc080e7          	jalr	1980(ra) # 80007044 <_Z11printStringPKc>
}
    80007890:	02813083          	ld	ra,40(sp)
    80007894:	02013403          	ld	s0,32(sp)
    80007898:	01813483          	ld	s1,24(sp)
    8000789c:	01013903          	ld	s2,16(sp)
    800078a0:	00813983          	ld	s3,8(sp)
    800078a4:	00013a03          	ld	s4,0(sp)
    800078a8:	03010113          	addi	sp,sp,48
    800078ac:	00008067          	ret

00000000800078b0 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    800078b0:	f8010113          	addi	sp,sp,-128
    800078b4:	06113c23          	sd	ra,120(sp)
    800078b8:	06813823          	sd	s0,112(sp)
    800078bc:	06913423          	sd	s1,104(sp)
    800078c0:	07213023          	sd	s2,96(sp)
    800078c4:	05313c23          	sd	s3,88(sp)
    800078c8:	05413823          	sd	s4,80(sp)
    800078cc:	05513423          	sd	s5,72(sp)
    800078d0:	05613023          	sd	s6,64(sp)
    800078d4:	03713c23          	sd	s7,56(sp)
    800078d8:	03813823          	sd	s8,48(sp)
    800078dc:	03913423          	sd	s9,40(sp)
    800078e0:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800078e4:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800078e8:	00005517          	auipc	a0,0x5
    800078ec:	d5850513          	addi	a0,a0,-680 # 8000c640 <CONSOLE_STATUS+0x630>
    800078f0:	fffff097          	auipc	ra,0xfffff
    800078f4:	754080e7          	jalr	1876(ra) # 80007044 <_Z11printStringPKc>
    getString(input, 30);
    800078f8:	01e00593          	li	a1,30
    800078fc:	f8040493          	addi	s1,s0,-128
    80007900:	00048513          	mv	a0,s1
    80007904:	fffff097          	auipc	ra,0xfffff
    80007908:	7c8080e7          	jalr	1992(ra) # 800070cc <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000790c:	00048513          	mv	a0,s1
    80007910:	00000097          	auipc	ra,0x0
    80007914:	894080e7          	jalr	-1900(ra) # 800071a4 <_Z11stringToIntPKc>
    80007918:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000791c:	00005517          	auipc	a0,0x5
    80007920:	d4450513          	addi	a0,a0,-700 # 8000c660 <CONSOLE_STATUS+0x650>
    80007924:	fffff097          	auipc	ra,0xfffff
    80007928:	720080e7          	jalr	1824(ra) # 80007044 <_Z11printStringPKc>
    getString(input, 30);
    8000792c:	01e00593          	li	a1,30
    80007930:	00048513          	mv	a0,s1
    80007934:	fffff097          	auipc	ra,0xfffff
    80007938:	798080e7          	jalr	1944(ra) # 800070cc <_Z9getStringPci>
    n = stringToInt(input);
    8000793c:	00048513          	mv	a0,s1
    80007940:	00000097          	auipc	ra,0x0
    80007944:	864080e7          	jalr	-1948(ra) # 800071a4 <_Z11stringToIntPKc>
    80007948:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    8000794c:	00005517          	auipc	a0,0x5
    80007950:	d3450513          	addi	a0,a0,-716 # 8000c680 <CONSOLE_STATUS+0x670>
    80007954:	fffff097          	auipc	ra,0xfffff
    80007958:	6f0080e7          	jalr	1776(ra) # 80007044 <_Z11printStringPKc>
    8000795c:	00000613          	li	a2,0
    80007960:	00a00593          	li	a1,10
    80007964:	00090513          	mv	a0,s2
    80007968:	00000097          	auipc	ra,0x0
    8000796c:	88c080e7          	jalr	-1908(ra) # 800071f4 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80007970:	00005517          	auipc	a0,0x5
    80007974:	d2850513          	addi	a0,a0,-728 # 8000c698 <CONSOLE_STATUS+0x688>
    80007978:	fffff097          	auipc	ra,0xfffff
    8000797c:	6cc080e7          	jalr	1740(ra) # 80007044 <_Z11printStringPKc>
    80007980:	00000613          	li	a2,0
    80007984:	00a00593          	li	a1,10
    80007988:	00048513          	mv	a0,s1
    8000798c:	00000097          	auipc	ra,0x0
    80007990:	868080e7          	jalr	-1944(ra) # 800071f4 <_Z8printIntiii>
    printString(".\n");
    80007994:	00005517          	auipc	a0,0x5
    80007998:	d1c50513          	addi	a0,a0,-740 # 8000c6b0 <CONSOLE_STATUS+0x6a0>
    8000799c:	fffff097          	auipc	ra,0xfffff
    800079a0:	6a8080e7          	jalr	1704(ra) # 80007044 <_Z11printStringPKc>
    if(threadNum > n) {
    800079a4:	0324c463          	blt	s1,s2,800079cc <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    800079a8:	03205c63          	blez	s2,800079e0 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800079ac:	03800513          	li	a0,56
    800079b0:	ffffa097          	auipc	ra,0xffffa
    800079b4:	890080e7          	jalr	-1904(ra) # 80001240 <_Znwm>
    800079b8:	00050a93          	mv	s5,a0
    800079bc:	00048593          	mv	a1,s1
    800079c0:	fffff097          	auipc	ra,0xfffff
    800079c4:	28c080e7          	jalr	652(ra) # 80006c4c <_ZN9BufferCPPC1Ei>
    800079c8:	0300006f          	j	800079f8 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800079cc:	00005517          	auipc	a0,0x5
    800079d0:	cec50513          	addi	a0,a0,-788 # 8000c6b8 <CONSOLE_STATUS+0x6a8>
    800079d4:	fffff097          	auipc	ra,0xfffff
    800079d8:	670080e7          	jalr	1648(ra) # 80007044 <_Z11printStringPKc>
        return;
    800079dc:	0140006f          	j	800079f0 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800079e0:	00005517          	auipc	a0,0x5
    800079e4:	d1850513          	addi	a0,a0,-744 # 8000c6f8 <CONSOLE_STATUS+0x6e8>
    800079e8:	fffff097          	auipc	ra,0xfffff
    800079ec:	65c080e7          	jalr	1628(ra) # 80007044 <_Z11printStringPKc>
        return;
    800079f0:	000b8113          	mv	sp,s7
    800079f4:	2380006f          	j	80007c2c <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800079f8:	01000513          	li	a0,16
    800079fc:	ffffa097          	auipc	ra,0xffffa
    80007a00:	844080e7          	jalr	-1980(ra) # 80001240 <_Znwm>
    80007a04:	00050493          	mv	s1,a0
    80007a08:	00000593          	li	a1,0
    80007a0c:	ffffa097          	auipc	ra,0xffffa
    80007a10:	a4c080e7          	jalr	-1460(ra) # 80001458 <_ZN9SemaphoreC1Ej>
    80007a14:	00008797          	auipc	a5,0x8
    80007a18:	8697be23          	sd	s1,-1924(a5) # 8000f290 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80007a1c:	00391793          	slli	a5,s2,0x3
    80007a20:	00f78793          	addi	a5,a5,15
    80007a24:	ff07f793          	andi	a5,a5,-16
    80007a28:	40f10133          	sub	sp,sp,a5
    80007a2c:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80007a30:	0019071b          	addiw	a4,s2,1
    80007a34:	00171793          	slli	a5,a4,0x1
    80007a38:	00e787b3          	add	a5,a5,a4
    80007a3c:	00379793          	slli	a5,a5,0x3
    80007a40:	00f78793          	addi	a5,a5,15
    80007a44:	ff07f793          	andi	a5,a5,-16
    80007a48:	40f10133          	sub	sp,sp,a5
    80007a4c:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80007a50:	00191c13          	slli	s8,s2,0x1
    80007a54:	012c07b3          	add	a5,s8,s2
    80007a58:	00379793          	slli	a5,a5,0x3
    80007a5c:	00fa07b3          	add	a5,s4,a5
    80007a60:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80007a64:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80007a68:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80007a6c:	02800513          	li	a0,40
    80007a70:	ffff9097          	auipc	ra,0xffff9
    80007a74:	7d0080e7          	jalr	2000(ra) # 80001240 <_Znwm>
    80007a78:	00050b13          	mv	s6,a0
    80007a7c:	012c0c33          	add	s8,s8,s2
    80007a80:	003c1c13          	slli	s8,s8,0x3
    80007a84:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80007a88:	ffffa097          	auipc	ra,0xffffa
    80007a8c:	99c080e7          	jalr	-1636(ra) # 80001424 <_ZN6ThreadC1Ev>
    80007a90:	00007797          	auipc	a5,0x7
    80007a94:	5b878793          	addi	a5,a5,1464 # 8000f048 <_ZTV12ConsumerSync+0x10>
    80007a98:	00fb3023          	sd	a5,0(s6)
    80007a9c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80007aa0:	000b0513          	mv	a0,s6
    80007aa4:	ffffa097          	auipc	ra,0xffffa
    80007aa8:	898080e7          	jalr	-1896(ra) # 8000133c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80007aac:	00000493          	li	s1,0
    80007ab0:	0380006f          	j	80007ae8 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80007ab4:	00007797          	auipc	a5,0x7
    80007ab8:	56c78793          	addi	a5,a5,1388 # 8000f020 <_ZTV12ProducerSync+0x10>
    80007abc:	00fcb023          	sd	a5,0(s9)
    80007ac0:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80007ac4:	00349793          	slli	a5,s1,0x3
    80007ac8:	00f987b3          	add	a5,s3,a5
    80007acc:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80007ad0:	00349793          	slli	a5,s1,0x3
    80007ad4:	00f987b3          	add	a5,s3,a5
    80007ad8:	0007b503          	ld	a0,0(a5)
    80007adc:	ffffa097          	auipc	ra,0xffffa
    80007ae0:	860080e7          	jalr	-1952(ra) # 8000133c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80007ae4:	0014849b          	addiw	s1,s1,1
    80007ae8:	0b24d063          	bge	s1,s2,80007b88 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80007aec:	00149793          	slli	a5,s1,0x1
    80007af0:	009787b3          	add	a5,a5,s1
    80007af4:	00379793          	slli	a5,a5,0x3
    80007af8:	00fa07b3          	add	a5,s4,a5
    80007afc:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80007b00:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80007b04:	00007717          	auipc	a4,0x7
    80007b08:	78c73703          	ld	a4,1932(a4) # 8000f290 <_ZL10waitForAll>
    80007b0c:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80007b10:	02905863          	blez	s1,80007b40 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80007b14:	02800513          	li	a0,40
    80007b18:	ffff9097          	auipc	ra,0xffff9
    80007b1c:	728080e7          	jalr	1832(ra) # 80001240 <_Znwm>
    80007b20:	00050c93          	mv	s9,a0
    80007b24:	00149c13          	slli	s8,s1,0x1
    80007b28:	009c0c33          	add	s8,s8,s1
    80007b2c:	003c1c13          	slli	s8,s8,0x3
    80007b30:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80007b34:	ffffa097          	auipc	ra,0xffffa
    80007b38:	8f0080e7          	jalr	-1808(ra) # 80001424 <_ZN6ThreadC1Ev>
    80007b3c:	f79ff06f          	j	80007ab4 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80007b40:	02800513          	li	a0,40
    80007b44:	ffff9097          	auipc	ra,0xffff9
    80007b48:	6fc080e7          	jalr	1788(ra) # 80001240 <_Znwm>
    80007b4c:	00050c93          	mv	s9,a0
    80007b50:	00149c13          	slli	s8,s1,0x1
    80007b54:	009c0c33          	add	s8,s8,s1
    80007b58:	003c1c13          	slli	s8,s8,0x3
    80007b5c:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80007b60:	ffffa097          	auipc	ra,0xffffa
    80007b64:	8c4080e7          	jalr	-1852(ra) # 80001424 <_ZN6ThreadC1Ev>
    80007b68:	00007797          	auipc	a5,0x7
    80007b6c:	49078793          	addi	a5,a5,1168 # 8000eff8 <_ZTV16ProducerKeyboard+0x10>
    80007b70:	00fcb023          	sd	a5,0(s9)
    80007b74:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80007b78:	00349793          	slli	a5,s1,0x3
    80007b7c:	00f987b3          	add	a5,s3,a5
    80007b80:	0197b023          	sd	s9,0(a5)
    80007b84:	f4dff06f          	j	80007ad0 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80007b88:	ffffa097          	auipc	ra,0xffffa
    80007b8c:	814080e7          	jalr	-2028(ra) # 8000139c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80007b90:	00000493          	li	s1,0
    80007b94:	00994e63          	blt	s2,s1,80007bb0 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80007b98:	00007517          	auipc	a0,0x7
    80007b9c:	6f853503          	ld	a0,1784(a0) # 8000f290 <_ZL10waitForAll>
    80007ba0:	ffffa097          	auipc	ra,0xffffa
    80007ba4:	8f0080e7          	jalr	-1808(ra) # 80001490 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80007ba8:	0014849b          	addiw	s1,s1,1
    80007bac:	fe9ff06f          	j	80007b94 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80007bb0:	00000493          	li	s1,0
    80007bb4:	0080006f          	j	80007bbc <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80007bb8:	0014849b          	addiw	s1,s1,1
    80007bbc:	0324d263          	bge	s1,s2,80007be0 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80007bc0:	00349793          	slli	a5,s1,0x3
    80007bc4:	00f987b3          	add	a5,s3,a5
    80007bc8:	0007b503          	ld	a0,0(a5)
    80007bcc:	fe0506e3          	beqz	a0,80007bb8 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80007bd0:	00053783          	ld	a5,0(a0)
    80007bd4:	0087b783          	ld	a5,8(a5)
    80007bd8:	000780e7          	jalr	a5
    80007bdc:	fddff06f          	j	80007bb8 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80007be0:	000b0a63          	beqz	s6,80007bf4 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80007be4:	000b3783          	ld	a5,0(s6)
    80007be8:	0087b783          	ld	a5,8(a5)
    80007bec:	000b0513          	mv	a0,s6
    80007bf0:	000780e7          	jalr	a5
    delete waitForAll;
    80007bf4:	00007517          	auipc	a0,0x7
    80007bf8:	69c53503          	ld	a0,1692(a0) # 8000f290 <_ZL10waitForAll>
    80007bfc:	00050863          	beqz	a0,80007c0c <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80007c00:	00053783          	ld	a5,0(a0)
    80007c04:	0087b783          	ld	a5,8(a5)
    80007c08:	000780e7          	jalr	a5
    delete buffer;
    80007c0c:	000a8e63          	beqz	s5,80007c28 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80007c10:	000a8513          	mv	a0,s5
    80007c14:	fffff097          	auipc	ra,0xfffff
    80007c18:	330080e7          	jalr	816(ra) # 80006f44 <_ZN9BufferCPPD1Ev>
    80007c1c:	000a8513          	mv	a0,s5
    80007c20:	ffff9097          	auipc	ra,0xffff9
    80007c24:	648080e7          	jalr	1608(ra) # 80001268 <_ZdlPv>
    80007c28:	000b8113          	mv	sp,s7

}
    80007c2c:	f8040113          	addi	sp,s0,-128
    80007c30:	07813083          	ld	ra,120(sp)
    80007c34:	07013403          	ld	s0,112(sp)
    80007c38:	06813483          	ld	s1,104(sp)
    80007c3c:	06013903          	ld	s2,96(sp)
    80007c40:	05813983          	ld	s3,88(sp)
    80007c44:	05013a03          	ld	s4,80(sp)
    80007c48:	04813a83          	ld	s5,72(sp)
    80007c4c:	04013b03          	ld	s6,64(sp)
    80007c50:	03813b83          	ld	s7,56(sp)
    80007c54:	03013c03          	ld	s8,48(sp)
    80007c58:	02813c83          	ld	s9,40(sp)
    80007c5c:	08010113          	addi	sp,sp,128
    80007c60:	00008067          	ret
    80007c64:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80007c68:	000a8513          	mv	a0,s5
    80007c6c:	ffff9097          	auipc	ra,0xffff9
    80007c70:	5fc080e7          	jalr	1532(ra) # 80001268 <_ZdlPv>
    80007c74:	00048513          	mv	a0,s1
    80007c78:	00008097          	auipc	ra,0x8
    80007c7c:	700080e7          	jalr	1792(ra) # 80010378 <_Unwind_Resume>
    80007c80:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80007c84:	00048513          	mv	a0,s1
    80007c88:	ffff9097          	auipc	ra,0xffff9
    80007c8c:	5e0080e7          	jalr	1504(ra) # 80001268 <_ZdlPv>
    80007c90:	00090513          	mv	a0,s2
    80007c94:	00008097          	auipc	ra,0x8
    80007c98:	6e4080e7          	jalr	1764(ra) # 80010378 <_Unwind_Resume>
    80007c9c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80007ca0:	000b0513          	mv	a0,s6
    80007ca4:	ffff9097          	auipc	ra,0xffff9
    80007ca8:	5c4080e7          	jalr	1476(ra) # 80001268 <_ZdlPv>
    80007cac:	00048513          	mv	a0,s1
    80007cb0:	00008097          	auipc	ra,0x8
    80007cb4:	6c8080e7          	jalr	1736(ra) # 80010378 <_Unwind_Resume>
    80007cb8:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80007cbc:	000c8513          	mv	a0,s9
    80007cc0:	ffff9097          	auipc	ra,0xffff9
    80007cc4:	5a8080e7          	jalr	1448(ra) # 80001268 <_ZdlPv>
    80007cc8:	00048513          	mv	a0,s1
    80007ccc:	00008097          	auipc	ra,0x8
    80007cd0:	6ac080e7          	jalr	1708(ra) # 80010378 <_Unwind_Resume>
    80007cd4:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80007cd8:	000c8513          	mv	a0,s9
    80007cdc:	ffff9097          	auipc	ra,0xffff9
    80007ce0:	58c080e7          	jalr	1420(ra) # 80001268 <_ZdlPv>
    80007ce4:	00048513          	mv	a0,s1
    80007ce8:	00008097          	auipc	ra,0x8
    80007cec:	690080e7          	jalr	1680(ra) # 80010378 <_Unwind_Resume>

0000000080007cf0 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80007cf0:	ff010113          	addi	sp,sp,-16
    80007cf4:	00113423          	sd	ra,8(sp)
    80007cf8:	00813023          	sd	s0,0(sp)
    80007cfc:	01010413          	addi	s0,sp,16
    80007d00:	00007797          	auipc	a5,0x7
    80007d04:	34878793          	addi	a5,a5,840 # 8000f048 <_ZTV12ConsumerSync+0x10>
    80007d08:	00f53023          	sd	a5,0(a0)
    80007d0c:	ffff9097          	auipc	ra,0xffff9
    80007d10:	4c4080e7          	jalr	1220(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80007d14:	00813083          	ld	ra,8(sp)
    80007d18:	00013403          	ld	s0,0(sp)
    80007d1c:	01010113          	addi	sp,sp,16
    80007d20:	00008067          	ret

0000000080007d24 <_ZN12ConsumerSyncD0Ev>:
    80007d24:	fe010113          	addi	sp,sp,-32
    80007d28:	00113c23          	sd	ra,24(sp)
    80007d2c:	00813823          	sd	s0,16(sp)
    80007d30:	00913423          	sd	s1,8(sp)
    80007d34:	02010413          	addi	s0,sp,32
    80007d38:	00050493          	mv	s1,a0
    80007d3c:	00007797          	auipc	a5,0x7
    80007d40:	30c78793          	addi	a5,a5,780 # 8000f048 <_ZTV12ConsumerSync+0x10>
    80007d44:	00f53023          	sd	a5,0(a0)
    80007d48:	ffff9097          	auipc	ra,0xffff9
    80007d4c:	488080e7          	jalr	1160(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80007d50:	00048513          	mv	a0,s1
    80007d54:	ffff9097          	auipc	ra,0xffff9
    80007d58:	514080e7          	jalr	1300(ra) # 80001268 <_ZdlPv>
    80007d5c:	01813083          	ld	ra,24(sp)
    80007d60:	01013403          	ld	s0,16(sp)
    80007d64:	00813483          	ld	s1,8(sp)
    80007d68:	02010113          	addi	sp,sp,32
    80007d6c:	00008067          	ret

0000000080007d70 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80007d70:	ff010113          	addi	sp,sp,-16
    80007d74:	00113423          	sd	ra,8(sp)
    80007d78:	00813023          	sd	s0,0(sp)
    80007d7c:	01010413          	addi	s0,sp,16
    80007d80:	00007797          	auipc	a5,0x7
    80007d84:	2a078793          	addi	a5,a5,672 # 8000f020 <_ZTV12ProducerSync+0x10>
    80007d88:	00f53023          	sd	a5,0(a0)
    80007d8c:	ffff9097          	auipc	ra,0xffff9
    80007d90:	444080e7          	jalr	1092(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80007d94:	00813083          	ld	ra,8(sp)
    80007d98:	00013403          	ld	s0,0(sp)
    80007d9c:	01010113          	addi	sp,sp,16
    80007da0:	00008067          	ret

0000000080007da4 <_ZN12ProducerSyncD0Ev>:
    80007da4:	fe010113          	addi	sp,sp,-32
    80007da8:	00113c23          	sd	ra,24(sp)
    80007dac:	00813823          	sd	s0,16(sp)
    80007db0:	00913423          	sd	s1,8(sp)
    80007db4:	02010413          	addi	s0,sp,32
    80007db8:	00050493          	mv	s1,a0
    80007dbc:	00007797          	auipc	a5,0x7
    80007dc0:	26478793          	addi	a5,a5,612 # 8000f020 <_ZTV12ProducerSync+0x10>
    80007dc4:	00f53023          	sd	a5,0(a0)
    80007dc8:	ffff9097          	auipc	ra,0xffff9
    80007dcc:	408080e7          	jalr	1032(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80007dd0:	00048513          	mv	a0,s1
    80007dd4:	ffff9097          	auipc	ra,0xffff9
    80007dd8:	494080e7          	jalr	1172(ra) # 80001268 <_ZdlPv>
    80007ddc:	01813083          	ld	ra,24(sp)
    80007de0:	01013403          	ld	s0,16(sp)
    80007de4:	00813483          	ld	s1,8(sp)
    80007de8:	02010113          	addi	sp,sp,32
    80007dec:	00008067          	ret

0000000080007df0 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80007df0:	ff010113          	addi	sp,sp,-16
    80007df4:	00113423          	sd	ra,8(sp)
    80007df8:	00813023          	sd	s0,0(sp)
    80007dfc:	01010413          	addi	s0,sp,16
    80007e00:	00007797          	auipc	a5,0x7
    80007e04:	1f878793          	addi	a5,a5,504 # 8000eff8 <_ZTV16ProducerKeyboard+0x10>
    80007e08:	00f53023          	sd	a5,0(a0)
    80007e0c:	ffff9097          	auipc	ra,0xffff9
    80007e10:	3c4080e7          	jalr	964(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80007e14:	00813083          	ld	ra,8(sp)
    80007e18:	00013403          	ld	s0,0(sp)
    80007e1c:	01010113          	addi	sp,sp,16
    80007e20:	00008067          	ret

0000000080007e24 <_ZN16ProducerKeyboardD0Ev>:
    80007e24:	fe010113          	addi	sp,sp,-32
    80007e28:	00113c23          	sd	ra,24(sp)
    80007e2c:	00813823          	sd	s0,16(sp)
    80007e30:	00913423          	sd	s1,8(sp)
    80007e34:	02010413          	addi	s0,sp,32
    80007e38:	00050493          	mv	s1,a0
    80007e3c:	00007797          	auipc	a5,0x7
    80007e40:	1bc78793          	addi	a5,a5,444 # 8000eff8 <_ZTV16ProducerKeyboard+0x10>
    80007e44:	00f53023          	sd	a5,0(a0)
    80007e48:	ffff9097          	auipc	ra,0xffff9
    80007e4c:	388080e7          	jalr	904(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80007e50:	00048513          	mv	a0,s1
    80007e54:	ffff9097          	auipc	ra,0xffff9
    80007e58:	414080e7          	jalr	1044(ra) # 80001268 <_ZdlPv>
    80007e5c:	01813083          	ld	ra,24(sp)
    80007e60:	01013403          	ld	s0,16(sp)
    80007e64:	00813483          	ld	s1,8(sp)
    80007e68:	02010113          	addi	sp,sp,32
    80007e6c:	00008067          	ret

0000000080007e70 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80007e70:	ff010113          	addi	sp,sp,-16
    80007e74:	00113423          	sd	ra,8(sp)
    80007e78:	00813023          	sd	s0,0(sp)
    80007e7c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80007e80:	02053583          	ld	a1,32(a0)
    80007e84:	fffff097          	auipc	ra,0xfffff
    80007e88:	7b0080e7          	jalr	1968(ra) # 80007634 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80007e8c:	00813083          	ld	ra,8(sp)
    80007e90:	00013403          	ld	s0,0(sp)
    80007e94:	01010113          	addi	sp,sp,16
    80007e98:	00008067          	ret

0000000080007e9c <_ZN12ProducerSync3runEv>:
    void run() override {
    80007e9c:	ff010113          	addi	sp,sp,-16
    80007ea0:	00113423          	sd	ra,8(sp)
    80007ea4:	00813023          	sd	s0,0(sp)
    80007ea8:	01010413          	addi	s0,sp,16
        producer(td);
    80007eac:	02053583          	ld	a1,32(a0)
    80007eb0:	00000097          	auipc	ra,0x0
    80007eb4:	844080e7          	jalr	-1980(ra) # 800076f4 <_ZN12ProducerSync8producerEPv>
    }
    80007eb8:	00813083          	ld	ra,8(sp)
    80007ebc:	00013403          	ld	s0,0(sp)
    80007ec0:	01010113          	addi	sp,sp,16
    80007ec4:	00008067          	ret

0000000080007ec8 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80007ec8:	ff010113          	addi	sp,sp,-16
    80007ecc:	00113423          	sd	ra,8(sp)
    80007ed0:	00813023          	sd	s0,0(sp)
    80007ed4:	01010413          	addi	s0,sp,16
        consumer(td);
    80007ed8:	02053583          	ld	a1,32(a0)
    80007edc:	00000097          	auipc	ra,0x0
    80007ee0:	8ac080e7          	jalr	-1876(ra) # 80007788 <_ZN12ConsumerSync8consumerEPv>
    }
    80007ee4:	00813083          	ld	ra,8(sp)
    80007ee8:	00013403          	ld	s0,0(sp)
    80007eec:	01010113          	addi	sp,sp,16
    80007ef0:	00008067          	ret

0000000080007ef4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80007ef4:	fe010113          	addi	sp,sp,-32
    80007ef8:	00113c23          	sd	ra,24(sp)
    80007efc:	00813823          	sd	s0,16(sp)
    80007f00:	00913423          	sd	s1,8(sp)
    80007f04:	01213023          	sd	s2,0(sp)
    80007f08:	02010413          	addi	s0,sp,32
    80007f0c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80007f10:	00100793          	li	a5,1
    80007f14:	02a7f863          	bgeu	a5,a0,80007f44 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80007f18:	00a00793          	li	a5,10
    80007f1c:	02f577b3          	remu	a5,a0,a5
    80007f20:	02078e63          	beqz	a5,80007f5c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80007f24:	fff48513          	addi	a0,s1,-1
    80007f28:	00000097          	auipc	ra,0x0
    80007f2c:	fcc080e7          	jalr	-52(ra) # 80007ef4 <_ZL9fibonaccim>
    80007f30:	00050913          	mv	s2,a0
    80007f34:	ffe48513          	addi	a0,s1,-2
    80007f38:	00000097          	auipc	ra,0x0
    80007f3c:	fbc080e7          	jalr	-68(ra) # 80007ef4 <_ZL9fibonaccim>
    80007f40:	00a90533          	add	a0,s2,a0
}
    80007f44:	01813083          	ld	ra,24(sp)
    80007f48:	01013403          	ld	s0,16(sp)
    80007f4c:	00813483          	ld	s1,8(sp)
    80007f50:	00013903          	ld	s2,0(sp)
    80007f54:	02010113          	addi	sp,sp,32
    80007f58:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80007f5c:	ffffa097          	auipc	ra,0xffffa
    80007f60:	f44080e7          	jalr	-188(ra) # 80001ea0 <_Z15thread_dispatchv>
    80007f64:	fc1ff06f          	j	80007f24 <_ZL9fibonaccim+0x30>

0000000080007f68 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80007f68:	fe010113          	addi	sp,sp,-32
    80007f6c:	00113c23          	sd	ra,24(sp)
    80007f70:	00813823          	sd	s0,16(sp)
    80007f74:	00913423          	sd	s1,8(sp)
    80007f78:	01213023          	sd	s2,0(sp)
    80007f7c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80007f80:	00000913          	li	s2,0
    80007f84:	0380006f          	j	80007fbc <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80007f88:	ffffa097          	auipc	ra,0xffffa
    80007f8c:	f18080e7          	jalr	-232(ra) # 80001ea0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80007f90:	00148493          	addi	s1,s1,1
    80007f94:	000027b7          	lui	a5,0x2
    80007f98:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80007f9c:	0097ee63          	bltu	a5,s1,80007fb8 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80007fa0:	00000713          	li	a4,0
    80007fa4:	000077b7          	lui	a5,0x7
    80007fa8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80007fac:	fce7eee3          	bltu	a5,a4,80007f88 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80007fb0:	00170713          	addi	a4,a4,1
    80007fb4:	ff1ff06f          	j	80007fa4 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80007fb8:	00190913          	addi	s2,s2,1
    80007fbc:	00900793          	li	a5,9
    80007fc0:	0527e063          	bltu	a5,s2,80008000 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80007fc4:	00004517          	auipc	a0,0x4
    80007fc8:	58450513          	addi	a0,a0,1412 # 8000c548 <CONSOLE_STATUS+0x538>
    80007fcc:	fffff097          	auipc	ra,0xfffff
    80007fd0:	078080e7          	jalr	120(ra) # 80007044 <_Z11printStringPKc>
    80007fd4:	00000613          	li	a2,0
    80007fd8:	00a00593          	li	a1,10
    80007fdc:	0009051b          	sext.w	a0,s2
    80007fe0:	fffff097          	auipc	ra,0xfffff
    80007fe4:	214080e7          	jalr	532(ra) # 800071f4 <_Z8printIntiii>
    80007fe8:	00005517          	auipc	a0,0x5
    80007fec:	88050513          	addi	a0,a0,-1920 # 8000c868 <CONSOLE_STATUS+0x858>
    80007ff0:	fffff097          	auipc	ra,0xfffff
    80007ff4:	054080e7          	jalr	84(ra) # 80007044 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80007ff8:	00000493          	li	s1,0
    80007ffc:	f99ff06f          	j	80007f94 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80008000:	00004517          	auipc	a0,0x4
    80008004:	55050513          	addi	a0,a0,1360 # 8000c550 <CONSOLE_STATUS+0x540>
    80008008:	fffff097          	auipc	ra,0xfffff
    8000800c:	03c080e7          	jalr	60(ra) # 80007044 <_Z11printStringPKc>
    finishedA = true;
    80008010:	00100793          	li	a5,1
    80008014:	00007717          	auipc	a4,0x7
    80008018:	28f70223          	sb	a5,644(a4) # 8000f298 <_ZL9finishedA>
}
    8000801c:	01813083          	ld	ra,24(sp)
    80008020:	01013403          	ld	s0,16(sp)
    80008024:	00813483          	ld	s1,8(sp)
    80008028:	00013903          	ld	s2,0(sp)
    8000802c:	02010113          	addi	sp,sp,32
    80008030:	00008067          	ret

0000000080008034 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80008034:	fe010113          	addi	sp,sp,-32
    80008038:	00113c23          	sd	ra,24(sp)
    8000803c:	00813823          	sd	s0,16(sp)
    80008040:	00913423          	sd	s1,8(sp)
    80008044:	01213023          	sd	s2,0(sp)
    80008048:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000804c:	00000913          	li	s2,0
    80008050:	0380006f          	j	80008088 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80008054:	ffffa097          	auipc	ra,0xffffa
    80008058:	e4c080e7          	jalr	-436(ra) # 80001ea0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000805c:	00148493          	addi	s1,s1,1
    80008060:	000027b7          	lui	a5,0x2
    80008064:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80008068:	0097ee63          	bltu	a5,s1,80008084 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000806c:	00000713          	li	a4,0
    80008070:	000077b7          	lui	a5,0x7
    80008074:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80008078:	fce7eee3          	bltu	a5,a4,80008054 <_ZN7WorkerB11workerBodyBEPv+0x20>
    8000807c:	00170713          	addi	a4,a4,1
    80008080:	ff1ff06f          	j	80008070 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80008084:	00190913          	addi	s2,s2,1
    80008088:	00f00793          	li	a5,15
    8000808c:	0527e063          	bltu	a5,s2,800080cc <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80008090:	00004517          	auipc	a0,0x4
    80008094:	4a050513          	addi	a0,a0,1184 # 8000c530 <CONSOLE_STATUS+0x520>
    80008098:	fffff097          	auipc	ra,0xfffff
    8000809c:	fac080e7          	jalr	-84(ra) # 80007044 <_Z11printStringPKc>
    800080a0:	00000613          	li	a2,0
    800080a4:	00a00593          	li	a1,10
    800080a8:	0009051b          	sext.w	a0,s2
    800080ac:	fffff097          	auipc	ra,0xfffff
    800080b0:	148080e7          	jalr	328(ra) # 800071f4 <_Z8printIntiii>
    800080b4:	00004517          	auipc	a0,0x4
    800080b8:	7b450513          	addi	a0,a0,1972 # 8000c868 <CONSOLE_STATUS+0x858>
    800080bc:	fffff097          	auipc	ra,0xfffff
    800080c0:	f88080e7          	jalr	-120(ra) # 80007044 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800080c4:	00000493          	li	s1,0
    800080c8:	f99ff06f          	j	80008060 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800080cc:	00004517          	auipc	a0,0x4
    800080d0:	46c50513          	addi	a0,a0,1132 # 8000c538 <CONSOLE_STATUS+0x528>
    800080d4:	fffff097          	auipc	ra,0xfffff
    800080d8:	f70080e7          	jalr	-144(ra) # 80007044 <_Z11printStringPKc>
    finishedB = true;
    800080dc:	00100793          	li	a5,1
    800080e0:	00007717          	auipc	a4,0x7
    800080e4:	1af70ca3          	sb	a5,441(a4) # 8000f299 <_ZL9finishedB>
    thread_dispatch();
    800080e8:	ffffa097          	auipc	ra,0xffffa
    800080ec:	db8080e7          	jalr	-584(ra) # 80001ea0 <_Z15thread_dispatchv>
}
    800080f0:	01813083          	ld	ra,24(sp)
    800080f4:	01013403          	ld	s0,16(sp)
    800080f8:	00813483          	ld	s1,8(sp)
    800080fc:	00013903          	ld	s2,0(sp)
    80008100:	02010113          	addi	sp,sp,32
    80008104:	00008067          	ret

0000000080008108 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80008108:	fe010113          	addi	sp,sp,-32
    8000810c:	00113c23          	sd	ra,24(sp)
    80008110:	00813823          	sd	s0,16(sp)
    80008114:	00913423          	sd	s1,8(sp)
    80008118:	01213023          	sd	s2,0(sp)
    8000811c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80008120:	00000493          	li	s1,0
    80008124:	0400006f          	j	80008164 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80008128:	00004517          	auipc	a0,0x4
    8000812c:	3c850513          	addi	a0,a0,968 # 8000c4f0 <CONSOLE_STATUS+0x4e0>
    80008130:	fffff097          	auipc	ra,0xfffff
    80008134:	f14080e7          	jalr	-236(ra) # 80007044 <_Z11printStringPKc>
    80008138:	00000613          	li	a2,0
    8000813c:	00a00593          	li	a1,10
    80008140:	00048513          	mv	a0,s1
    80008144:	fffff097          	auipc	ra,0xfffff
    80008148:	0b0080e7          	jalr	176(ra) # 800071f4 <_Z8printIntiii>
    8000814c:	00004517          	auipc	a0,0x4
    80008150:	71c50513          	addi	a0,a0,1820 # 8000c868 <CONSOLE_STATUS+0x858>
    80008154:	fffff097          	auipc	ra,0xfffff
    80008158:	ef0080e7          	jalr	-272(ra) # 80007044 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000815c:	0014849b          	addiw	s1,s1,1
    80008160:	0ff4f493          	andi	s1,s1,255
    80008164:	00200793          	li	a5,2
    80008168:	fc97f0e3          	bgeu	a5,s1,80008128 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    8000816c:	00004517          	auipc	a0,0x4
    80008170:	38c50513          	addi	a0,a0,908 # 8000c4f8 <CONSOLE_STATUS+0x4e8>
    80008174:	fffff097          	auipc	ra,0xfffff
    80008178:	ed0080e7          	jalr	-304(ra) # 80007044 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000817c:	00700313          	li	t1,7
    thread_dispatch();
    80008180:	ffffa097          	auipc	ra,0xffffa
    80008184:	d20080e7          	jalr	-736(ra) # 80001ea0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80008188:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    8000818c:	00004517          	auipc	a0,0x4
    80008190:	37c50513          	addi	a0,a0,892 # 8000c508 <CONSOLE_STATUS+0x4f8>
    80008194:	fffff097          	auipc	ra,0xfffff
    80008198:	eb0080e7          	jalr	-336(ra) # 80007044 <_Z11printStringPKc>
    8000819c:	00000613          	li	a2,0
    800081a0:	00a00593          	li	a1,10
    800081a4:	0009051b          	sext.w	a0,s2
    800081a8:	fffff097          	auipc	ra,0xfffff
    800081ac:	04c080e7          	jalr	76(ra) # 800071f4 <_Z8printIntiii>
    800081b0:	00004517          	auipc	a0,0x4
    800081b4:	6b850513          	addi	a0,a0,1720 # 8000c868 <CONSOLE_STATUS+0x858>
    800081b8:	fffff097          	auipc	ra,0xfffff
    800081bc:	e8c080e7          	jalr	-372(ra) # 80007044 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800081c0:	00c00513          	li	a0,12
    800081c4:	00000097          	auipc	ra,0x0
    800081c8:	d30080e7          	jalr	-720(ra) # 80007ef4 <_ZL9fibonaccim>
    800081cc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800081d0:	00004517          	auipc	a0,0x4
    800081d4:	34050513          	addi	a0,a0,832 # 8000c510 <CONSOLE_STATUS+0x500>
    800081d8:	fffff097          	auipc	ra,0xfffff
    800081dc:	e6c080e7          	jalr	-404(ra) # 80007044 <_Z11printStringPKc>
    800081e0:	00000613          	li	a2,0
    800081e4:	00a00593          	li	a1,10
    800081e8:	0009051b          	sext.w	a0,s2
    800081ec:	fffff097          	auipc	ra,0xfffff
    800081f0:	008080e7          	jalr	8(ra) # 800071f4 <_Z8printIntiii>
    800081f4:	00004517          	auipc	a0,0x4
    800081f8:	67450513          	addi	a0,a0,1652 # 8000c868 <CONSOLE_STATUS+0x858>
    800081fc:	fffff097          	auipc	ra,0xfffff
    80008200:	e48080e7          	jalr	-440(ra) # 80007044 <_Z11printStringPKc>
    80008204:	0400006f          	j	80008244 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80008208:	00004517          	auipc	a0,0x4
    8000820c:	2e850513          	addi	a0,a0,744 # 8000c4f0 <CONSOLE_STATUS+0x4e0>
    80008210:	fffff097          	auipc	ra,0xfffff
    80008214:	e34080e7          	jalr	-460(ra) # 80007044 <_Z11printStringPKc>
    80008218:	00000613          	li	a2,0
    8000821c:	00a00593          	li	a1,10
    80008220:	00048513          	mv	a0,s1
    80008224:	fffff097          	auipc	ra,0xfffff
    80008228:	fd0080e7          	jalr	-48(ra) # 800071f4 <_Z8printIntiii>
    8000822c:	00004517          	auipc	a0,0x4
    80008230:	63c50513          	addi	a0,a0,1596 # 8000c868 <CONSOLE_STATUS+0x858>
    80008234:	fffff097          	auipc	ra,0xfffff
    80008238:	e10080e7          	jalr	-496(ra) # 80007044 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000823c:	0014849b          	addiw	s1,s1,1
    80008240:	0ff4f493          	andi	s1,s1,255
    80008244:	00500793          	li	a5,5
    80008248:	fc97f0e3          	bgeu	a5,s1,80008208 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    8000824c:	00004517          	auipc	a0,0x4
    80008250:	30450513          	addi	a0,a0,772 # 8000c550 <CONSOLE_STATUS+0x540>
    80008254:	fffff097          	auipc	ra,0xfffff
    80008258:	df0080e7          	jalr	-528(ra) # 80007044 <_Z11printStringPKc>
    finishedC = true;
    8000825c:	00100793          	li	a5,1
    80008260:	00007717          	auipc	a4,0x7
    80008264:	02f70d23          	sb	a5,58(a4) # 8000f29a <_ZL9finishedC>
    thread_dispatch();
    80008268:	ffffa097          	auipc	ra,0xffffa
    8000826c:	c38080e7          	jalr	-968(ra) # 80001ea0 <_Z15thread_dispatchv>
}
    80008270:	01813083          	ld	ra,24(sp)
    80008274:	01013403          	ld	s0,16(sp)
    80008278:	00813483          	ld	s1,8(sp)
    8000827c:	00013903          	ld	s2,0(sp)
    80008280:	02010113          	addi	sp,sp,32
    80008284:	00008067          	ret

0000000080008288 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80008288:	fe010113          	addi	sp,sp,-32
    8000828c:	00113c23          	sd	ra,24(sp)
    80008290:	00813823          	sd	s0,16(sp)
    80008294:	00913423          	sd	s1,8(sp)
    80008298:	01213023          	sd	s2,0(sp)
    8000829c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800082a0:	00a00493          	li	s1,10
    800082a4:	0400006f          	j	800082e4 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800082a8:	00004517          	auipc	a0,0x4
    800082ac:	21050513          	addi	a0,a0,528 # 8000c4b8 <CONSOLE_STATUS+0x4a8>
    800082b0:	fffff097          	auipc	ra,0xfffff
    800082b4:	d94080e7          	jalr	-620(ra) # 80007044 <_Z11printStringPKc>
    800082b8:	00000613          	li	a2,0
    800082bc:	00a00593          	li	a1,10
    800082c0:	00048513          	mv	a0,s1
    800082c4:	fffff097          	auipc	ra,0xfffff
    800082c8:	f30080e7          	jalr	-208(ra) # 800071f4 <_Z8printIntiii>
    800082cc:	00004517          	auipc	a0,0x4
    800082d0:	59c50513          	addi	a0,a0,1436 # 8000c868 <CONSOLE_STATUS+0x858>
    800082d4:	fffff097          	auipc	ra,0xfffff
    800082d8:	d70080e7          	jalr	-656(ra) # 80007044 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800082dc:	0014849b          	addiw	s1,s1,1
    800082e0:	0ff4f493          	andi	s1,s1,255
    800082e4:	00c00793          	li	a5,12
    800082e8:	fc97f0e3          	bgeu	a5,s1,800082a8 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800082ec:	00004517          	auipc	a0,0x4
    800082f0:	1d450513          	addi	a0,a0,468 # 8000c4c0 <CONSOLE_STATUS+0x4b0>
    800082f4:	fffff097          	auipc	ra,0xfffff
    800082f8:	d50080e7          	jalr	-688(ra) # 80007044 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800082fc:	00500313          	li	t1,5
    thread_dispatch();
    80008300:	ffffa097          	auipc	ra,0xffffa
    80008304:	ba0080e7          	jalr	-1120(ra) # 80001ea0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80008308:	01000513          	li	a0,16
    8000830c:	00000097          	auipc	ra,0x0
    80008310:	be8080e7          	jalr	-1048(ra) # 80007ef4 <_ZL9fibonaccim>
    80008314:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80008318:	00004517          	auipc	a0,0x4
    8000831c:	1b850513          	addi	a0,a0,440 # 8000c4d0 <CONSOLE_STATUS+0x4c0>
    80008320:	fffff097          	auipc	ra,0xfffff
    80008324:	d24080e7          	jalr	-732(ra) # 80007044 <_Z11printStringPKc>
    80008328:	00000613          	li	a2,0
    8000832c:	00a00593          	li	a1,10
    80008330:	0009051b          	sext.w	a0,s2
    80008334:	fffff097          	auipc	ra,0xfffff
    80008338:	ec0080e7          	jalr	-320(ra) # 800071f4 <_Z8printIntiii>
    8000833c:	00004517          	auipc	a0,0x4
    80008340:	52c50513          	addi	a0,a0,1324 # 8000c868 <CONSOLE_STATUS+0x858>
    80008344:	fffff097          	auipc	ra,0xfffff
    80008348:	d00080e7          	jalr	-768(ra) # 80007044 <_Z11printStringPKc>
    8000834c:	0400006f          	j	8000838c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80008350:	00004517          	auipc	a0,0x4
    80008354:	16850513          	addi	a0,a0,360 # 8000c4b8 <CONSOLE_STATUS+0x4a8>
    80008358:	fffff097          	auipc	ra,0xfffff
    8000835c:	cec080e7          	jalr	-788(ra) # 80007044 <_Z11printStringPKc>
    80008360:	00000613          	li	a2,0
    80008364:	00a00593          	li	a1,10
    80008368:	00048513          	mv	a0,s1
    8000836c:	fffff097          	auipc	ra,0xfffff
    80008370:	e88080e7          	jalr	-376(ra) # 800071f4 <_Z8printIntiii>
    80008374:	00004517          	auipc	a0,0x4
    80008378:	4f450513          	addi	a0,a0,1268 # 8000c868 <CONSOLE_STATUS+0x858>
    8000837c:	fffff097          	auipc	ra,0xfffff
    80008380:	cc8080e7          	jalr	-824(ra) # 80007044 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80008384:	0014849b          	addiw	s1,s1,1
    80008388:	0ff4f493          	andi	s1,s1,255
    8000838c:	00f00793          	li	a5,15
    80008390:	fc97f0e3          	bgeu	a5,s1,80008350 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80008394:	00004517          	auipc	a0,0x4
    80008398:	14c50513          	addi	a0,a0,332 # 8000c4e0 <CONSOLE_STATUS+0x4d0>
    8000839c:	fffff097          	auipc	ra,0xfffff
    800083a0:	ca8080e7          	jalr	-856(ra) # 80007044 <_Z11printStringPKc>
    finishedD = true;
    800083a4:	00100793          	li	a5,1
    800083a8:	00007717          	auipc	a4,0x7
    800083ac:	eef709a3          	sb	a5,-269(a4) # 8000f29b <_ZL9finishedD>
    thread_dispatch();
    800083b0:	ffffa097          	auipc	ra,0xffffa
    800083b4:	af0080e7          	jalr	-1296(ra) # 80001ea0 <_Z15thread_dispatchv>
}
    800083b8:	01813083          	ld	ra,24(sp)
    800083bc:	01013403          	ld	s0,16(sp)
    800083c0:	00813483          	ld	s1,8(sp)
    800083c4:	00013903          	ld	s2,0(sp)
    800083c8:	02010113          	addi	sp,sp,32
    800083cc:	00008067          	ret

00000000800083d0 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800083d0:	fc010113          	addi	sp,sp,-64
    800083d4:	02113c23          	sd	ra,56(sp)
    800083d8:	02813823          	sd	s0,48(sp)
    800083dc:	02913423          	sd	s1,40(sp)
    800083e0:	03213023          	sd	s2,32(sp)
    800083e4:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800083e8:	02000513          	li	a0,32
    800083ec:	ffff9097          	auipc	ra,0xffff9
    800083f0:	e54080e7          	jalr	-428(ra) # 80001240 <_Znwm>
    800083f4:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800083f8:	ffff9097          	auipc	ra,0xffff9
    800083fc:	02c080e7          	jalr	44(ra) # 80001424 <_ZN6ThreadC1Ev>
    80008400:	00007797          	auipc	a5,0x7
    80008404:	c7078793          	addi	a5,a5,-912 # 8000f070 <_ZTV7WorkerA+0x10>
    80008408:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000840c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80008410:	00004517          	auipc	a0,0x4
    80008414:	15050513          	addi	a0,a0,336 # 8000c560 <CONSOLE_STATUS+0x550>
    80008418:	fffff097          	auipc	ra,0xfffff
    8000841c:	c2c080e7          	jalr	-980(ra) # 80007044 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80008420:	02000513          	li	a0,32
    80008424:	ffff9097          	auipc	ra,0xffff9
    80008428:	e1c080e7          	jalr	-484(ra) # 80001240 <_Znwm>
    8000842c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80008430:	ffff9097          	auipc	ra,0xffff9
    80008434:	ff4080e7          	jalr	-12(ra) # 80001424 <_ZN6ThreadC1Ev>
    80008438:	00007797          	auipc	a5,0x7
    8000843c:	c6078793          	addi	a5,a5,-928 # 8000f098 <_ZTV7WorkerB+0x10>
    80008440:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80008444:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80008448:	00004517          	auipc	a0,0x4
    8000844c:	13050513          	addi	a0,a0,304 # 8000c578 <CONSOLE_STATUS+0x568>
    80008450:	fffff097          	auipc	ra,0xfffff
    80008454:	bf4080e7          	jalr	-1036(ra) # 80007044 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80008458:	02000513          	li	a0,32
    8000845c:	ffff9097          	auipc	ra,0xffff9
    80008460:	de4080e7          	jalr	-540(ra) # 80001240 <_Znwm>
    80008464:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80008468:	ffff9097          	auipc	ra,0xffff9
    8000846c:	fbc080e7          	jalr	-68(ra) # 80001424 <_ZN6ThreadC1Ev>
    80008470:	00007797          	auipc	a5,0x7
    80008474:	c5078793          	addi	a5,a5,-944 # 8000f0c0 <_ZTV7WorkerC+0x10>
    80008478:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    8000847c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80008480:	00004517          	auipc	a0,0x4
    80008484:	11050513          	addi	a0,a0,272 # 8000c590 <CONSOLE_STATUS+0x580>
    80008488:	fffff097          	auipc	ra,0xfffff
    8000848c:	bbc080e7          	jalr	-1092(ra) # 80007044 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80008490:	02000513          	li	a0,32
    80008494:	ffff9097          	auipc	ra,0xffff9
    80008498:	dac080e7          	jalr	-596(ra) # 80001240 <_Znwm>
    8000849c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800084a0:	ffff9097          	auipc	ra,0xffff9
    800084a4:	f84080e7          	jalr	-124(ra) # 80001424 <_ZN6ThreadC1Ev>
    800084a8:	00007797          	auipc	a5,0x7
    800084ac:	c4078793          	addi	a5,a5,-960 # 8000f0e8 <_ZTV7WorkerD+0x10>
    800084b0:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800084b4:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800084b8:	00004517          	auipc	a0,0x4
    800084bc:	0f050513          	addi	a0,a0,240 # 8000c5a8 <CONSOLE_STATUS+0x598>
    800084c0:	fffff097          	auipc	ra,0xfffff
    800084c4:	b84080e7          	jalr	-1148(ra) # 80007044 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800084c8:	00000493          	li	s1,0
    800084cc:	00300793          	li	a5,3
    800084d0:	0297c663          	blt	a5,s1,800084fc <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800084d4:	00349793          	slli	a5,s1,0x3
    800084d8:	fe040713          	addi	a4,s0,-32
    800084dc:	00f707b3          	add	a5,a4,a5
    800084e0:	fe07b503          	ld	a0,-32(a5)
    800084e4:	ffff9097          	auipc	ra,0xffff9
    800084e8:	e58080e7          	jalr	-424(ra) # 8000133c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800084ec:	0014849b          	addiw	s1,s1,1
    800084f0:	fddff06f          	j	800084cc <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800084f4:	ffff9097          	auipc	ra,0xffff9
    800084f8:	ea8080e7          	jalr	-344(ra) # 8000139c <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800084fc:	00007797          	auipc	a5,0x7
    80008500:	d9c7c783          	lbu	a5,-612(a5) # 8000f298 <_ZL9finishedA>
    80008504:	fe0788e3          	beqz	a5,800084f4 <_Z20Threads_CPP_API_testv+0x124>
    80008508:	00007797          	auipc	a5,0x7
    8000850c:	d917c783          	lbu	a5,-623(a5) # 8000f299 <_ZL9finishedB>
    80008510:	fe0782e3          	beqz	a5,800084f4 <_Z20Threads_CPP_API_testv+0x124>
    80008514:	00007797          	auipc	a5,0x7
    80008518:	d867c783          	lbu	a5,-634(a5) # 8000f29a <_ZL9finishedC>
    8000851c:	fc078ce3          	beqz	a5,800084f4 <_Z20Threads_CPP_API_testv+0x124>
    80008520:	00007797          	auipc	a5,0x7
    80008524:	d7b7c783          	lbu	a5,-645(a5) # 8000f29b <_ZL9finishedD>
    80008528:	fc0786e3          	beqz	a5,800084f4 <_Z20Threads_CPP_API_testv+0x124>
    8000852c:	fc040493          	addi	s1,s0,-64
    80008530:	0080006f          	j	80008538 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80008534:	00848493          	addi	s1,s1,8
    80008538:	fe040793          	addi	a5,s0,-32
    8000853c:	08f48663          	beq	s1,a5,800085c8 <_Z20Threads_CPP_API_testv+0x1f8>
    80008540:	0004b503          	ld	a0,0(s1)
    80008544:	fe0508e3          	beqz	a0,80008534 <_Z20Threads_CPP_API_testv+0x164>
    80008548:	00053783          	ld	a5,0(a0)
    8000854c:	0087b783          	ld	a5,8(a5)
    80008550:	000780e7          	jalr	a5
    80008554:	fe1ff06f          	j	80008534 <_Z20Threads_CPP_API_testv+0x164>
    80008558:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    8000855c:	00048513          	mv	a0,s1
    80008560:	ffff9097          	auipc	ra,0xffff9
    80008564:	d08080e7          	jalr	-760(ra) # 80001268 <_ZdlPv>
    80008568:	00090513          	mv	a0,s2
    8000856c:	00008097          	auipc	ra,0x8
    80008570:	e0c080e7          	jalr	-500(ra) # 80010378 <_Unwind_Resume>
    80008574:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80008578:	00048513          	mv	a0,s1
    8000857c:	ffff9097          	auipc	ra,0xffff9
    80008580:	cec080e7          	jalr	-788(ra) # 80001268 <_ZdlPv>
    80008584:	00090513          	mv	a0,s2
    80008588:	00008097          	auipc	ra,0x8
    8000858c:	df0080e7          	jalr	-528(ra) # 80010378 <_Unwind_Resume>
    80008590:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80008594:	00048513          	mv	a0,s1
    80008598:	ffff9097          	auipc	ra,0xffff9
    8000859c:	cd0080e7          	jalr	-816(ra) # 80001268 <_ZdlPv>
    800085a0:	00090513          	mv	a0,s2
    800085a4:	00008097          	auipc	ra,0x8
    800085a8:	dd4080e7          	jalr	-556(ra) # 80010378 <_Unwind_Resume>
    800085ac:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800085b0:	00048513          	mv	a0,s1
    800085b4:	ffff9097          	auipc	ra,0xffff9
    800085b8:	cb4080e7          	jalr	-844(ra) # 80001268 <_ZdlPv>
    800085bc:	00090513          	mv	a0,s2
    800085c0:	00008097          	auipc	ra,0x8
    800085c4:	db8080e7          	jalr	-584(ra) # 80010378 <_Unwind_Resume>
}
    800085c8:	03813083          	ld	ra,56(sp)
    800085cc:	03013403          	ld	s0,48(sp)
    800085d0:	02813483          	ld	s1,40(sp)
    800085d4:	02013903          	ld	s2,32(sp)
    800085d8:	04010113          	addi	sp,sp,64
    800085dc:	00008067          	ret

00000000800085e0 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800085e0:	ff010113          	addi	sp,sp,-16
    800085e4:	00113423          	sd	ra,8(sp)
    800085e8:	00813023          	sd	s0,0(sp)
    800085ec:	01010413          	addi	s0,sp,16
    800085f0:	00007797          	auipc	a5,0x7
    800085f4:	a8078793          	addi	a5,a5,-1408 # 8000f070 <_ZTV7WorkerA+0x10>
    800085f8:	00f53023          	sd	a5,0(a0)
    800085fc:	ffff9097          	auipc	ra,0xffff9
    80008600:	bd4080e7          	jalr	-1068(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008604:	00813083          	ld	ra,8(sp)
    80008608:	00013403          	ld	s0,0(sp)
    8000860c:	01010113          	addi	sp,sp,16
    80008610:	00008067          	ret

0000000080008614 <_ZN7WorkerAD0Ev>:
    80008614:	fe010113          	addi	sp,sp,-32
    80008618:	00113c23          	sd	ra,24(sp)
    8000861c:	00813823          	sd	s0,16(sp)
    80008620:	00913423          	sd	s1,8(sp)
    80008624:	02010413          	addi	s0,sp,32
    80008628:	00050493          	mv	s1,a0
    8000862c:	00007797          	auipc	a5,0x7
    80008630:	a4478793          	addi	a5,a5,-1468 # 8000f070 <_ZTV7WorkerA+0x10>
    80008634:	00f53023          	sd	a5,0(a0)
    80008638:	ffff9097          	auipc	ra,0xffff9
    8000863c:	b98080e7          	jalr	-1128(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008640:	00048513          	mv	a0,s1
    80008644:	ffff9097          	auipc	ra,0xffff9
    80008648:	c24080e7          	jalr	-988(ra) # 80001268 <_ZdlPv>
    8000864c:	01813083          	ld	ra,24(sp)
    80008650:	01013403          	ld	s0,16(sp)
    80008654:	00813483          	ld	s1,8(sp)
    80008658:	02010113          	addi	sp,sp,32
    8000865c:	00008067          	ret

0000000080008660 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80008660:	ff010113          	addi	sp,sp,-16
    80008664:	00113423          	sd	ra,8(sp)
    80008668:	00813023          	sd	s0,0(sp)
    8000866c:	01010413          	addi	s0,sp,16
    80008670:	00007797          	auipc	a5,0x7
    80008674:	a2878793          	addi	a5,a5,-1496 # 8000f098 <_ZTV7WorkerB+0x10>
    80008678:	00f53023          	sd	a5,0(a0)
    8000867c:	ffff9097          	auipc	ra,0xffff9
    80008680:	b54080e7          	jalr	-1196(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008684:	00813083          	ld	ra,8(sp)
    80008688:	00013403          	ld	s0,0(sp)
    8000868c:	01010113          	addi	sp,sp,16
    80008690:	00008067          	ret

0000000080008694 <_ZN7WorkerBD0Ev>:
    80008694:	fe010113          	addi	sp,sp,-32
    80008698:	00113c23          	sd	ra,24(sp)
    8000869c:	00813823          	sd	s0,16(sp)
    800086a0:	00913423          	sd	s1,8(sp)
    800086a4:	02010413          	addi	s0,sp,32
    800086a8:	00050493          	mv	s1,a0
    800086ac:	00007797          	auipc	a5,0x7
    800086b0:	9ec78793          	addi	a5,a5,-1556 # 8000f098 <_ZTV7WorkerB+0x10>
    800086b4:	00f53023          	sd	a5,0(a0)
    800086b8:	ffff9097          	auipc	ra,0xffff9
    800086bc:	b18080e7          	jalr	-1256(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800086c0:	00048513          	mv	a0,s1
    800086c4:	ffff9097          	auipc	ra,0xffff9
    800086c8:	ba4080e7          	jalr	-1116(ra) # 80001268 <_ZdlPv>
    800086cc:	01813083          	ld	ra,24(sp)
    800086d0:	01013403          	ld	s0,16(sp)
    800086d4:	00813483          	ld	s1,8(sp)
    800086d8:	02010113          	addi	sp,sp,32
    800086dc:	00008067          	ret

00000000800086e0 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800086e0:	ff010113          	addi	sp,sp,-16
    800086e4:	00113423          	sd	ra,8(sp)
    800086e8:	00813023          	sd	s0,0(sp)
    800086ec:	01010413          	addi	s0,sp,16
    800086f0:	00007797          	auipc	a5,0x7
    800086f4:	9d078793          	addi	a5,a5,-1584 # 8000f0c0 <_ZTV7WorkerC+0x10>
    800086f8:	00f53023          	sd	a5,0(a0)
    800086fc:	ffff9097          	auipc	ra,0xffff9
    80008700:	ad4080e7          	jalr	-1324(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008704:	00813083          	ld	ra,8(sp)
    80008708:	00013403          	ld	s0,0(sp)
    8000870c:	01010113          	addi	sp,sp,16
    80008710:	00008067          	ret

0000000080008714 <_ZN7WorkerCD0Ev>:
    80008714:	fe010113          	addi	sp,sp,-32
    80008718:	00113c23          	sd	ra,24(sp)
    8000871c:	00813823          	sd	s0,16(sp)
    80008720:	00913423          	sd	s1,8(sp)
    80008724:	02010413          	addi	s0,sp,32
    80008728:	00050493          	mv	s1,a0
    8000872c:	00007797          	auipc	a5,0x7
    80008730:	99478793          	addi	a5,a5,-1644 # 8000f0c0 <_ZTV7WorkerC+0x10>
    80008734:	00f53023          	sd	a5,0(a0)
    80008738:	ffff9097          	auipc	ra,0xffff9
    8000873c:	a98080e7          	jalr	-1384(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008740:	00048513          	mv	a0,s1
    80008744:	ffff9097          	auipc	ra,0xffff9
    80008748:	b24080e7          	jalr	-1244(ra) # 80001268 <_ZdlPv>
    8000874c:	01813083          	ld	ra,24(sp)
    80008750:	01013403          	ld	s0,16(sp)
    80008754:	00813483          	ld	s1,8(sp)
    80008758:	02010113          	addi	sp,sp,32
    8000875c:	00008067          	ret

0000000080008760 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80008760:	ff010113          	addi	sp,sp,-16
    80008764:	00113423          	sd	ra,8(sp)
    80008768:	00813023          	sd	s0,0(sp)
    8000876c:	01010413          	addi	s0,sp,16
    80008770:	00007797          	auipc	a5,0x7
    80008774:	97878793          	addi	a5,a5,-1672 # 8000f0e8 <_ZTV7WorkerD+0x10>
    80008778:	00f53023          	sd	a5,0(a0)
    8000877c:	ffff9097          	auipc	ra,0xffff9
    80008780:	a54080e7          	jalr	-1452(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008784:	00813083          	ld	ra,8(sp)
    80008788:	00013403          	ld	s0,0(sp)
    8000878c:	01010113          	addi	sp,sp,16
    80008790:	00008067          	ret

0000000080008794 <_ZN7WorkerDD0Ev>:
    80008794:	fe010113          	addi	sp,sp,-32
    80008798:	00113c23          	sd	ra,24(sp)
    8000879c:	00813823          	sd	s0,16(sp)
    800087a0:	00913423          	sd	s1,8(sp)
    800087a4:	02010413          	addi	s0,sp,32
    800087a8:	00050493          	mv	s1,a0
    800087ac:	00007797          	auipc	a5,0x7
    800087b0:	93c78793          	addi	a5,a5,-1732 # 8000f0e8 <_ZTV7WorkerD+0x10>
    800087b4:	00f53023          	sd	a5,0(a0)
    800087b8:	ffff9097          	auipc	ra,0xffff9
    800087bc:	a18080e7          	jalr	-1512(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800087c0:	00048513          	mv	a0,s1
    800087c4:	ffff9097          	auipc	ra,0xffff9
    800087c8:	aa4080e7          	jalr	-1372(ra) # 80001268 <_ZdlPv>
    800087cc:	01813083          	ld	ra,24(sp)
    800087d0:	01013403          	ld	s0,16(sp)
    800087d4:	00813483          	ld	s1,8(sp)
    800087d8:	02010113          	addi	sp,sp,32
    800087dc:	00008067          	ret

00000000800087e0 <_ZN7WorkerA3runEv>:
    void run() override {
    800087e0:	ff010113          	addi	sp,sp,-16
    800087e4:	00113423          	sd	ra,8(sp)
    800087e8:	00813023          	sd	s0,0(sp)
    800087ec:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800087f0:	00000593          	li	a1,0
    800087f4:	fffff097          	auipc	ra,0xfffff
    800087f8:	774080e7          	jalr	1908(ra) # 80007f68 <_ZN7WorkerA11workerBodyAEPv>
    }
    800087fc:	00813083          	ld	ra,8(sp)
    80008800:	00013403          	ld	s0,0(sp)
    80008804:	01010113          	addi	sp,sp,16
    80008808:	00008067          	ret

000000008000880c <_ZN7WorkerB3runEv>:
    void run() override {
    8000880c:	ff010113          	addi	sp,sp,-16
    80008810:	00113423          	sd	ra,8(sp)
    80008814:	00813023          	sd	s0,0(sp)
    80008818:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000881c:	00000593          	li	a1,0
    80008820:	00000097          	auipc	ra,0x0
    80008824:	814080e7          	jalr	-2028(ra) # 80008034 <_ZN7WorkerB11workerBodyBEPv>
    }
    80008828:	00813083          	ld	ra,8(sp)
    8000882c:	00013403          	ld	s0,0(sp)
    80008830:	01010113          	addi	sp,sp,16
    80008834:	00008067          	ret

0000000080008838 <_ZN7WorkerC3runEv>:
    void run() override {
    80008838:	ff010113          	addi	sp,sp,-16
    8000883c:	00113423          	sd	ra,8(sp)
    80008840:	00813023          	sd	s0,0(sp)
    80008844:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80008848:	00000593          	li	a1,0
    8000884c:	00000097          	auipc	ra,0x0
    80008850:	8bc080e7          	jalr	-1860(ra) # 80008108 <_ZN7WorkerC11workerBodyCEPv>
    }
    80008854:	00813083          	ld	ra,8(sp)
    80008858:	00013403          	ld	s0,0(sp)
    8000885c:	01010113          	addi	sp,sp,16
    80008860:	00008067          	ret

0000000080008864 <_ZN7WorkerD3runEv>:
    void run() override {
    80008864:	ff010113          	addi	sp,sp,-16
    80008868:	00113423          	sd	ra,8(sp)
    8000886c:	00813023          	sd	s0,0(sp)
    80008870:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80008874:	00000593          	li	a1,0
    80008878:	00000097          	auipc	ra,0x0
    8000887c:	a10080e7          	jalr	-1520(ra) # 80008288 <_ZN7WorkerD11workerBodyDEPv>
    }
    80008880:	00813083          	ld	ra,8(sp)
    80008884:	00013403          	ld	s0,0(sp)
    80008888:	01010113          	addi	sp,sp,16
    8000888c:	00008067          	ret

0000000080008890 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80008890:	f8010113          	addi	sp,sp,-128
    80008894:	06113c23          	sd	ra,120(sp)
    80008898:	06813823          	sd	s0,112(sp)
    8000889c:	06913423          	sd	s1,104(sp)
    800088a0:	07213023          	sd	s2,96(sp)
    800088a4:	05313c23          	sd	s3,88(sp)
    800088a8:	05413823          	sd	s4,80(sp)
    800088ac:	05513423          	sd	s5,72(sp)
    800088b0:	05613023          	sd	s6,64(sp)
    800088b4:	03713c23          	sd	s7,56(sp)
    800088b8:	03813823          	sd	s8,48(sp)
    800088bc:	03913423          	sd	s9,40(sp)
    800088c0:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800088c4:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800088c8:	00004517          	auipc	a0,0x4
    800088cc:	d7850513          	addi	a0,a0,-648 # 8000c640 <CONSOLE_STATUS+0x630>
    800088d0:	ffffe097          	auipc	ra,0xffffe
    800088d4:	774080e7          	jalr	1908(ra) # 80007044 <_Z11printStringPKc>
    getString(input, 30);
    800088d8:	01e00593          	li	a1,30
    800088dc:	f8040493          	addi	s1,s0,-128
    800088e0:	00048513          	mv	a0,s1
    800088e4:	ffffe097          	auipc	ra,0xffffe
    800088e8:	7e8080e7          	jalr	2024(ra) # 800070cc <_Z9getStringPci>
    threadNum = stringToInt(input);
    800088ec:	00048513          	mv	a0,s1
    800088f0:	fffff097          	auipc	ra,0xfffff
    800088f4:	8b4080e7          	jalr	-1868(ra) # 800071a4 <_Z11stringToIntPKc>
    800088f8:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    800088fc:	00004517          	auipc	a0,0x4
    80008900:	d6450513          	addi	a0,a0,-668 # 8000c660 <CONSOLE_STATUS+0x650>
    80008904:	ffffe097          	auipc	ra,0xffffe
    80008908:	740080e7          	jalr	1856(ra) # 80007044 <_Z11printStringPKc>
    getString(input, 30);
    8000890c:	01e00593          	li	a1,30
    80008910:	00048513          	mv	a0,s1
    80008914:	ffffe097          	auipc	ra,0xffffe
    80008918:	7b8080e7          	jalr	1976(ra) # 800070cc <_Z9getStringPci>
    n = stringToInt(input);
    8000891c:	00048513          	mv	a0,s1
    80008920:	fffff097          	auipc	ra,0xfffff
    80008924:	884080e7          	jalr	-1916(ra) # 800071a4 <_Z11stringToIntPKc>
    80008928:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    8000892c:	00004517          	auipc	a0,0x4
    80008930:	d5450513          	addi	a0,a0,-684 # 8000c680 <CONSOLE_STATUS+0x670>
    80008934:	ffffe097          	auipc	ra,0xffffe
    80008938:	710080e7          	jalr	1808(ra) # 80007044 <_Z11printStringPKc>
    printInt(threadNum);
    8000893c:	00000613          	li	a2,0
    80008940:	00a00593          	li	a1,10
    80008944:	00098513          	mv	a0,s3
    80008948:	fffff097          	auipc	ra,0xfffff
    8000894c:	8ac080e7          	jalr	-1876(ra) # 800071f4 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80008950:	00004517          	auipc	a0,0x4
    80008954:	d4850513          	addi	a0,a0,-696 # 8000c698 <CONSOLE_STATUS+0x688>
    80008958:	ffffe097          	auipc	ra,0xffffe
    8000895c:	6ec080e7          	jalr	1772(ra) # 80007044 <_Z11printStringPKc>
    printInt(n);
    80008960:	00000613          	li	a2,0
    80008964:	00a00593          	li	a1,10
    80008968:	00048513          	mv	a0,s1
    8000896c:	fffff097          	auipc	ra,0xfffff
    80008970:	888080e7          	jalr	-1912(ra) # 800071f4 <_Z8printIntiii>
    printString(".\n");
    80008974:	00004517          	auipc	a0,0x4
    80008978:	d3c50513          	addi	a0,a0,-708 # 8000c6b0 <CONSOLE_STATUS+0x6a0>
    8000897c:	ffffe097          	auipc	ra,0xffffe
    80008980:	6c8080e7          	jalr	1736(ra) # 80007044 <_Z11printStringPKc>
    if (threadNum > n) {
    80008984:	0334c463          	blt	s1,s3,800089ac <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80008988:	03305c63          	blez	s3,800089c0 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000898c:	03800513          	li	a0,56
    80008990:	ffff9097          	auipc	ra,0xffff9
    80008994:	8b0080e7          	jalr	-1872(ra) # 80001240 <_Znwm>
    80008998:	00050a93          	mv	s5,a0
    8000899c:	00048593          	mv	a1,s1
    800089a0:	ffffe097          	auipc	ra,0xffffe
    800089a4:	2ac080e7          	jalr	684(ra) # 80006c4c <_ZN9BufferCPPC1Ei>
    800089a8:	0300006f          	j	800089d8 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800089ac:	00004517          	auipc	a0,0x4
    800089b0:	d0c50513          	addi	a0,a0,-756 # 8000c6b8 <CONSOLE_STATUS+0x6a8>
    800089b4:	ffffe097          	auipc	ra,0xffffe
    800089b8:	690080e7          	jalr	1680(ra) # 80007044 <_Z11printStringPKc>
        return;
    800089bc:	0140006f          	j	800089d0 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800089c0:	00004517          	auipc	a0,0x4
    800089c4:	d3850513          	addi	a0,a0,-712 # 8000c6f8 <CONSOLE_STATUS+0x6e8>
    800089c8:	ffffe097          	auipc	ra,0xffffe
    800089cc:	67c080e7          	jalr	1660(ra) # 80007044 <_Z11printStringPKc>
        return;
    800089d0:	000c0113          	mv	sp,s8
    800089d4:	2440006f          	j	80008c18 <_Z20testConsumerProducerv+0x388>
    waitForAll = new Semaphore(0);
    800089d8:	01000513          	li	a0,16
    800089dc:	ffff9097          	auipc	ra,0xffff9
    800089e0:	864080e7          	jalr	-1948(ra) # 80001240 <_Znwm>
    800089e4:	00050913          	mv	s2,a0
    800089e8:	00000593          	li	a1,0
    800089ec:	ffff9097          	auipc	ra,0xffff9
    800089f0:	a6c080e7          	jalr	-1428(ra) # 80001458 <_ZN9SemaphoreC1Ej>
    800089f4:	00007797          	auipc	a5,0x7
    800089f8:	8b27ba23          	sd	s2,-1868(a5) # 8000f2a8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800089fc:	00399793          	slli	a5,s3,0x3
    80008a00:	00f78793          	addi	a5,a5,15
    80008a04:	ff07f793          	andi	a5,a5,-16
    80008a08:	40f10133          	sub	sp,sp,a5
    80008a0c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80008a10:	0019871b          	addiw	a4,s3,1
    80008a14:	00171793          	slli	a5,a4,0x1
    80008a18:	00e787b3          	add	a5,a5,a4
    80008a1c:	00379793          	slli	a5,a5,0x3
    80008a20:	00f78793          	addi	a5,a5,15
    80008a24:	ff07f793          	andi	a5,a5,-16
    80008a28:	40f10133          	sub	sp,sp,a5
    80008a2c:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80008a30:	00199493          	slli	s1,s3,0x1
    80008a34:	013484b3          	add	s1,s1,s3
    80008a38:	00349493          	slli	s1,s1,0x3
    80008a3c:	009b04b3          	add	s1,s6,s1
    80008a40:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80008a44:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80008a48:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80008a4c:	02800513          	li	a0,40
    80008a50:	ffff8097          	auipc	ra,0xffff8
    80008a54:	7f0080e7          	jalr	2032(ra) # 80001240 <_Znwm>
    80008a58:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80008a5c:	ffff9097          	auipc	ra,0xffff9
    80008a60:	9c8080e7          	jalr	-1592(ra) # 80001424 <_ZN6ThreadC1Ev>
    80008a64:	00006797          	auipc	a5,0x6
    80008a68:	6fc78793          	addi	a5,a5,1788 # 8000f160 <_ZTV8Consumer+0x10>
    80008a6c:	00fbb023          	sd	a5,0(s7)
    80008a70:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80008a74:	000b8513          	mv	a0,s7
    80008a78:	ffff9097          	auipc	ra,0xffff9
    80008a7c:	8c4080e7          	jalr	-1852(ra) # 8000133c <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80008a80:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80008a84:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80008a88:	00007797          	auipc	a5,0x7
    80008a8c:	8207b783          	ld	a5,-2016(a5) # 8000f2a8 <_ZL10waitForAll>
    80008a90:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80008a94:	02800513          	li	a0,40
    80008a98:	ffff8097          	auipc	ra,0xffff8
    80008a9c:	7a8080e7          	jalr	1960(ra) # 80001240 <_Znwm>
    80008aa0:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80008aa4:	ffff9097          	auipc	ra,0xffff9
    80008aa8:	980080e7          	jalr	-1664(ra) # 80001424 <_ZN6ThreadC1Ev>
    80008aac:	00006797          	auipc	a5,0x6
    80008ab0:	66478793          	addi	a5,a5,1636 # 8000f110 <_ZTV16ProducerKeyborad+0x10>
    80008ab4:	00f4b023          	sd	a5,0(s1)
    80008ab8:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80008abc:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80008ac0:	00048513          	mv	a0,s1
    80008ac4:	ffff9097          	auipc	ra,0xffff9
    80008ac8:	878080e7          	jalr	-1928(ra) # 8000133c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80008acc:	00100913          	li	s2,1
    80008ad0:	0300006f          	j	80008b00 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80008ad4:	00006797          	auipc	a5,0x6
    80008ad8:	66478793          	addi	a5,a5,1636 # 8000f138 <_ZTV8Producer+0x10>
    80008adc:	00fcb023          	sd	a5,0(s9)
    80008ae0:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80008ae4:	00391793          	slli	a5,s2,0x3
    80008ae8:	00fa07b3          	add	a5,s4,a5
    80008aec:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80008af0:	000c8513          	mv	a0,s9
    80008af4:	ffff9097          	auipc	ra,0xffff9
    80008af8:	848080e7          	jalr	-1976(ra) # 8000133c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80008afc:	0019091b          	addiw	s2,s2,1
    80008b00:	05395263          	bge	s2,s3,80008b44 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80008b04:	00191493          	slli	s1,s2,0x1
    80008b08:	012484b3          	add	s1,s1,s2
    80008b0c:	00349493          	slli	s1,s1,0x3
    80008b10:	009b04b3          	add	s1,s6,s1
    80008b14:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80008b18:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80008b1c:	00006797          	auipc	a5,0x6
    80008b20:	78c7b783          	ld	a5,1932(a5) # 8000f2a8 <_ZL10waitForAll>
    80008b24:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80008b28:	02800513          	li	a0,40
    80008b2c:	ffff8097          	auipc	ra,0xffff8
    80008b30:	714080e7          	jalr	1812(ra) # 80001240 <_Znwm>
    80008b34:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80008b38:	ffff9097          	auipc	ra,0xffff9
    80008b3c:	8ec080e7          	jalr	-1812(ra) # 80001424 <_ZN6ThreadC1Ev>
    80008b40:	f95ff06f          	j	80008ad4 <_Z20testConsumerProducerv+0x244>
    putc('.');
    80008b44:	02e00513          	li	a0,46
    80008b48:	ffff9097          	auipc	ra,0xffff9
    80008b4c:	508080e7          	jalr	1288(ra) # 80002050 <_Z4putcc>
    Thread::dispatch();
    80008b50:	ffff9097          	auipc	ra,0xffff9
    80008b54:	84c080e7          	jalr	-1972(ra) # 8000139c <_ZN6Thread8dispatchEv>
    putc('.');
    80008b58:	02e00513          	li	a0,46
    80008b5c:	ffff9097          	auipc	ra,0xffff9
    80008b60:	4f4080e7          	jalr	1268(ra) # 80002050 <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    80008b64:	00000493          	li	s1,0
    80008b68:	0299c463          	blt	s3,s1,80008b90 <_Z20testConsumerProducerv+0x300>
        waitForAll->wait();
    80008b6c:	00006517          	auipc	a0,0x6
    80008b70:	73c53503          	ld	a0,1852(a0) # 8000f2a8 <_ZL10waitForAll>
    80008b74:	ffff9097          	auipc	ra,0xffff9
    80008b78:	91c080e7          	jalr	-1764(ra) # 80001490 <_ZN9Semaphore4waitEv>
        putc('x');
    80008b7c:	07800513          	li	a0,120
    80008b80:	ffff9097          	auipc	ra,0xffff9
    80008b84:	4d0080e7          	jalr	1232(ra) # 80002050 <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    80008b88:	0014849b          	addiw	s1,s1,1
    80008b8c:	fddff06f          	j	80008b68 <_Z20testConsumerProducerv+0x2d8>
    putc('.');
    80008b90:	02e00513          	li	a0,46
    80008b94:	ffff9097          	auipc	ra,0xffff9
    80008b98:	4bc080e7          	jalr	1212(ra) # 80002050 <_Z4putcc>
    delete waitForAll;
    80008b9c:	00006517          	auipc	a0,0x6
    80008ba0:	70c53503          	ld	a0,1804(a0) # 8000f2a8 <_ZL10waitForAll>
    80008ba4:	00050863          	beqz	a0,80008bb4 <_Z20testConsumerProducerv+0x324>
    80008ba8:	00053783          	ld	a5,0(a0)
    80008bac:	0087b783          	ld	a5,8(a5)
    80008bb0:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80008bb4:	00000493          	li	s1,0
    80008bb8:	0080006f          	j	80008bc0 <_Z20testConsumerProducerv+0x330>
    for (int i = 0; i < threadNum; i++) {
    80008bbc:	0014849b          	addiw	s1,s1,1
    80008bc0:	0334d263          	bge	s1,s3,80008be4 <_Z20testConsumerProducerv+0x354>
        delete producers[i];
    80008bc4:	00349793          	slli	a5,s1,0x3
    80008bc8:	00fa07b3          	add	a5,s4,a5
    80008bcc:	0007b503          	ld	a0,0(a5)
    80008bd0:	fe0506e3          	beqz	a0,80008bbc <_Z20testConsumerProducerv+0x32c>
    80008bd4:	00053783          	ld	a5,0(a0)
    80008bd8:	0087b783          	ld	a5,8(a5)
    80008bdc:	000780e7          	jalr	a5
    80008be0:	fddff06f          	j	80008bbc <_Z20testConsumerProducerv+0x32c>
    delete consumer;
    80008be4:	000b8a63          	beqz	s7,80008bf8 <_Z20testConsumerProducerv+0x368>
    80008be8:	000bb783          	ld	a5,0(s7)
    80008bec:	0087b783          	ld	a5,8(a5)
    80008bf0:	000b8513          	mv	a0,s7
    80008bf4:	000780e7          	jalr	a5
    delete buffer;
    80008bf8:	000a8e63          	beqz	s5,80008c14 <_Z20testConsumerProducerv+0x384>
    80008bfc:	000a8513          	mv	a0,s5
    80008c00:	ffffe097          	auipc	ra,0xffffe
    80008c04:	344080e7          	jalr	836(ra) # 80006f44 <_ZN9BufferCPPD1Ev>
    80008c08:	000a8513          	mv	a0,s5
    80008c0c:	ffff8097          	auipc	ra,0xffff8
    80008c10:	65c080e7          	jalr	1628(ra) # 80001268 <_ZdlPv>
    80008c14:	000c0113          	mv	sp,s8
}
    80008c18:	f8040113          	addi	sp,s0,-128
    80008c1c:	07813083          	ld	ra,120(sp)
    80008c20:	07013403          	ld	s0,112(sp)
    80008c24:	06813483          	ld	s1,104(sp)
    80008c28:	06013903          	ld	s2,96(sp)
    80008c2c:	05813983          	ld	s3,88(sp)
    80008c30:	05013a03          	ld	s4,80(sp)
    80008c34:	04813a83          	ld	s5,72(sp)
    80008c38:	04013b03          	ld	s6,64(sp)
    80008c3c:	03813b83          	ld	s7,56(sp)
    80008c40:	03013c03          	ld	s8,48(sp)
    80008c44:	02813c83          	ld	s9,40(sp)
    80008c48:	08010113          	addi	sp,sp,128
    80008c4c:	00008067          	ret
    80008c50:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80008c54:	000a8513          	mv	a0,s5
    80008c58:	ffff8097          	auipc	ra,0xffff8
    80008c5c:	610080e7          	jalr	1552(ra) # 80001268 <_ZdlPv>
    80008c60:	00048513          	mv	a0,s1
    80008c64:	00007097          	auipc	ra,0x7
    80008c68:	714080e7          	jalr	1812(ra) # 80010378 <_Unwind_Resume>
    80008c6c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80008c70:	00090513          	mv	a0,s2
    80008c74:	ffff8097          	auipc	ra,0xffff8
    80008c78:	5f4080e7          	jalr	1524(ra) # 80001268 <_ZdlPv>
    80008c7c:	00048513          	mv	a0,s1
    80008c80:	00007097          	auipc	ra,0x7
    80008c84:	6f8080e7          	jalr	1784(ra) # 80010378 <_Unwind_Resume>
    80008c88:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80008c8c:	000b8513          	mv	a0,s7
    80008c90:	ffff8097          	auipc	ra,0xffff8
    80008c94:	5d8080e7          	jalr	1496(ra) # 80001268 <_ZdlPv>
    80008c98:	00048513          	mv	a0,s1
    80008c9c:	00007097          	auipc	ra,0x7
    80008ca0:	6dc080e7          	jalr	1756(ra) # 80010378 <_Unwind_Resume>
    80008ca4:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80008ca8:	00048513          	mv	a0,s1
    80008cac:	ffff8097          	auipc	ra,0xffff8
    80008cb0:	5bc080e7          	jalr	1468(ra) # 80001268 <_ZdlPv>
    80008cb4:	00090513          	mv	a0,s2
    80008cb8:	00007097          	auipc	ra,0x7
    80008cbc:	6c0080e7          	jalr	1728(ra) # 80010378 <_Unwind_Resume>
    80008cc0:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80008cc4:	000c8513          	mv	a0,s9
    80008cc8:	ffff8097          	auipc	ra,0xffff8
    80008ccc:	5a0080e7          	jalr	1440(ra) # 80001268 <_ZdlPv>
    80008cd0:	00048513          	mv	a0,s1
    80008cd4:	00007097          	auipc	ra,0x7
    80008cd8:	6a4080e7          	jalr	1700(ra) # 80010378 <_Unwind_Resume>

0000000080008cdc <_ZN8Consumer3runEv>:
    void run() override {
    80008cdc:	fd010113          	addi	sp,sp,-48
    80008ce0:	02113423          	sd	ra,40(sp)
    80008ce4:	02813023          	sd	s0,32(sp)
    80008ce8:	00913c23          	sd	s1,24(sp)
    80008cec:	01213823          	sd	s2,16(sp)
    80008cf0:	01313423          	sd	s3,8(sp)
    80008cf4:	03010413          	addi	s0,sp,48
    80008cf8:	00050913          	mv	s2,a0
        int i = 0;
    80008cfc:	00000993          	li	s3,0
    80008d00:	0100006f          	j	80008d10 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80008d04:	00a00513          	li	a0,10
    80008d08:	ffff9097          	auipc	ra,0xffff9
    80008d0c:	8c0080e7          	jalr	-1856(ra) # 800015c8 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80008d10:	00006797          	auipc	a5,0x6
    80008d14:	5907a783          	lw	a5,1424(a5) # 8000f2a0 <_ZL9threadEnd>
    80008d18:	04079a63          	bnez	a5,80008d6c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80008d1c:	02093783          	ld	a5,32(s2)
    80008d20:	0087b503          	ld	a0,8(a5)
    80008d24:	ffffe097          	auipc	ra,0xffffe
    80008d28:	10c080e7          	jalr	268(ra) # 80006e30 <_ZN9BufferCPP3getEv>
            i++;
    80008d2c:	0019849b          	addiw	s1,s3,1
    80008d30:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80008d34:	0ff57513          	andi	a0,a0,255
    80008d38:	ffff9097          	auipc	ra,0xffff9
    80008d3c:	890080e7          	jalr	-1904(ra) # 800015c8 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80008d40:	05000793          	li	a5,80
    80008d44:	02f4e4bb          	remw	s1,s1,a5
    80008d48:	fc0494e3          	bnez	s1,80008d10 <_ZN8Consumer3runEv+0x34>
    80008d4c:	fb9ff06f          	j	80008d04 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80008d50:	02093783          	ld	a5,32(s2)
    80008d54:	0087b503          	ld	a0,8(a5)
    80008d58:	ffffe097          	auipc	ra,0xffffe
    80008d5c:	0d8080e7          	jalr	216(ra) # 80006e30 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80008d60:	0ff57513          	andi	a0,a0,255
    80008d64:	ffff9097          	auipc	ra,0xffff9
    80008d68:	864080e7          	jalr	-1948(ra) # 800015c8 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80008d6c:	02093783          	ld	a5,32(s2)
    80008d70:	0087b503          	ld	a0,8(a5)
    80008d74:	ffffe097          	auipc	ra,0xffffe
    80008d78:	148080e7          	jalr	328(ra) # 80006ebc <_ZN9BufferCPP6getCntEv>
    80008d7c:	fca04ae3          	bgtz	a0,80008d50 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80008d80:	02093783          	ld	a5,32(s2)
    80008d84:	0107b503          	ld	a0,16(a5)
    80008d88:	ffff8097          	auipc	ra,0xffff8
    80008d8c:	734080e7          	jalr	1844(ra) # 800014bc <_ZN9Semaphore6signalEv>
    }
    80008d90:	02813083          	ld	ra,40(sp)
    80008d94:	02013403          	ld	s0,32(sp)
    80008d98:	01813483          	ld	s1,24(sp)
    80008d9c:	01013903          	ld	s2,16(sp)
    80008da0:	00813983          	ld	s3,8(sp)
    80008da4:	03010113          	addi	sp,sp,48
    80008da8:	00008067          	ret

0000000080008dac <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80008dac:	ff010113          	addi	sp,sp,-16
    80008db0:	00113423          	sd	ra,8(sp)
    80008db4:	00813023          	sd	s0,0(sp)
    80008db8:	01010413          	addi	s0,sp,16
    80008dbc:	00006797          	auipc	a5,0x6
    80008dc0:	3a478793          	addi	a5,a5,932 # 8000f160 <_ZTV8Consumer+0x10>
    80008dc4:	00f53023          	sd	a5,0(a0)
    80008dc8:	ffff8097          	auipc	ra,0xffff8
    80008dcc:	408080e7          	jalr	1032(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008dd0:	00813083          	ld	ra,8(sp)
    80008dd4:	00013403          	ld	s0,0(sp)
    80008dd8:	01010113          	addi	sp,sp,16
    80008ddc:	00008067          	ret

0000000080008de0 <_ZN8ConsumerD0Ev>:
    80008de0:	fe010113          	addi	sp,sp,-32
    80008de4:	00113c23          	sd	ra,24(sp)
    80008de8:	00813823          	sd	s0,16(sp)
    80008dec:	00913423          	sd	s1,8(sp)
    80008df0:	02010413          	addi	s0,sp,32
    80008df4:	00050493          	mv	s1,a0
    80008df8:	00006797          	auipc	a5,0x6
    80008dfc:	36878793          	addi	a5,a5,872 # 8000f160 <_ZTV8Consumer+0x10>
    80008e00:	00f53023          	sd	a5,0(a0)
    80008e04:	ffff8097          	auipc	ra,0xffff8
    80008e08:	3cc080e7          	jalr	972(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008e0c:	00048513          	mv	a0,s1
    80008e10:	ffff8097          	auipc	ra,0xffff8
    80008e14:	458080e7          	jalr	1112(ra) # 80001268 <_ZdlPv>
    80008e18:	01813083          	ld	ra,24(sp)
    80008e1c:	01013403          	ld	s0,16(sp)
    80008e20:	00813483          	ld	s1,8(sp)
    80008e24:	02010113          	addi	sp,sp,32
    80008e28:	00008067          	ret

0000000080008e2c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80008e2c:	ff010113          	addi	sp,sp,-16
    80008e30:	00113423          	sd	ra,8(sp)
    80008e34:	00813023          	sd	s0,0(sp)
    80008e38:	01010413          	addi	s0,sp,16
    80008e3c:	00006797          	auipc	a5,0x6
    80008e40:	2d478793          	addi	a5,a5,724 # 8000f110 <_ZTV16ProducerKeyborad+0x10>
    80008e44:	00f53023          	sd	a5,0(a0)
    80008e48:	ffff8097          	auipc	ra,0xffff8
    80008e4c:	388080e7          	jalr	904(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008e50:	00813083          	ld	ra,8(sp)
    80008e54:	00013403          	ld	s0,0(sp)
    80008e58:	01010113          	addi	sp,sp,16
    80008e5c:	00008067          	ret

0000000080008e60 <_ZN16ProducerKeyboradD0Ev>:
    80008e60:	fe010113          	addi	sp,sp,-32
    80008e64:	00113c23          	sd	ra,24(sp)
    80008e68:	00813823          	sd	s0,16(sp)
    80008e6c:	00913423          	sd	s1,8(sp)
    80008e70:	02010413          	addi	s0,sp,32
    80008e74:	00050493          	mv	s1,a0
    80008e78:	00006797          	auipc	a5,0x6
    80008e7c:	29878793          	addi	a5,a5,664 # 8000f110 <_ZTV16ProducerKeyborad+0x10>
    80008e80:	00f53023          	sd	a5,0(a0)
    80008e84:	ffff8097          	auipc	ra,0xffff8
    80008e88:	34c080e7          	jalr	844(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008e8c:	00048513          	mv	a0,s1
    80008e90:	ffff8097          	auipc	ra,0xffff8
    80008e94:	3d8080e7          	jalr	984(ra) # 80001268 <_ZdlPv>
    80008e98:	01813083          	ld	ra,24(sp)
    80008e9c:	01013403          	ld	s0,16(sp)
    80008ea0:	00813483          	ld	s1,8(sp)
    80008ea4:	02010113          	addi	sp,sp,32
    80008ea8:	00008067          	ret

0000000080008eac <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80008eac:	ff010113          	addi	sp,sp,-16
    80008eb0:	00113423          	sd	ra,8(sp)
    80008eb4:	00813023          	sd	s0,0(sp)
    80008eb8:	01010413          	addi	s0,sp,16
    80008ebc:	00006797          	auipc	a5,0x6
    80008ec0:	27c78793          	addi	a5,a5,636 # 8000f138 <_ZTV8Producer+0x10>
    80008ec4:	00f53023          	sd	a5,0(a0)
    80008ec8:	ffff8097          	auipc	ra,0xffff8
    80008ecc:	308080e7          	jalr	776(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008ed0:	00813083          	ld	ra,8(sp)
    80008ed4:	00013403          	ld	s0,0(sp)
    80008ed8:	01010113          	addi	sp,sp,16
    80008edc:	00008067          	ret

0000000080008ee0 <_ZN8ProducerD0Ev>:
    80008ee0:	fe010113          	addi	sp,sp,-32
    80008ee4:	00113c23          	sd	ra,24(sp)
    80008ee8:	00813823          	sd	s0,16(sp)
    80008eec:	00913423          	sd	s1,8(sp)
    80008ef0:	02010413          	addi	s0,sp,32
    80008ef4:	00050493          	mv	s1,a0
    80008ef8:	00006797          	auipc	a5,0x6
    80008efc:	24078793          	addi	a5,a5,576 # 8000f138 <_ZTV8Producer+0x10>
    80008f00:	00f53023          	sd	a5,0(a0)
    80008f04:	ffff8097          	auipc	ra,0xffff8
    80008f08:	2cc080e7          	jalr	716(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008f0c:	00048513          	mv	a0,s1
    80008f10:	ffff8097          	auipc	ra,0xffff8
    80008f14:	358080e7          	jalr	856(ra) # 80001268 <_ZdlPv>
    80008f18:	01813083          	ld	ra,24(sp)
    80008f1c:	01013403          	ld	s0,16(sp)
    80008f20:	00813483          	ld	s1,8(sp)
    80008f24:	02010113          	addi	sp,sp,32
    80008f28:	00008067          	ret

0000000080008f2c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80008f2c:	fe010113          	addi	sp,sp,-32
    80008f30:	00113c23          	sd	ra,24(sp)
    80008f34:	00813823          	sd	s0,16(sp)
    80008f38:	00913423          	sd	s1,8(sp)
    80008f3c:	02010413          	addi	s0,sp,32
    80008f40:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80008f44:	ffff9097          	auipc	ra,0xffff9
    80008f48:	0e4080e7          	jalr	228(ra) # 80002028 <_Z4getcv>
    80008f4c:	0005059b          	sext.w	a1,a0
    80008f50:	01b00793          	li	a5,27
    80008f54:	00f58c63          	beq	a1,a5,80008f6c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80008f58:	0204b783          	ld	a5,32(s1)
    80008f5c:	0087b503          	ld	a0,8(a5)
    80008f60:	ffffe097          	auipc	ra,0xffffe
    80008f64:	e40080e7          	jalr	-448(ra) # 80006da0 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80008f68:	fddff06f          	j	80008f44 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80008f6c:	00100793          	li	a5,1
    80008f70:	00006717          	auipc	a4,0x6
    80008f74:	32f72823          	sw	a5,816(a4) # 8000f2a0 <_ZL9threadEnd>
        td->buffer->put('!');
    80008f78:	0204b783          	ld	a5,32(s1)
    80008f7c:	02100593          	li	a1,33
    80008f80:	0087b503          	ld	a0,8(a5)
    80008f84:	ffffe097          	auipc	ra,0xffffe
    80008f88:	e1c080e7          	jalr	-484(ra) # 80006da0 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80008f8c:	0204b783          	ld	a5,32(s1)
    80008f90:	0107b503          	ld	a0,16(a5)
    80008f94:	ffff8097          	auipc	ra,0xffff8
    80008f98:	528080e7          	jalr	1320(ra) # 800014bc <_ZN9Semaphore6signalEv>
    }
    80008f9c:	01813083          	ld	ra,24(sp)
    80008fa0:	01013403          	ld	s0,16(sp)
    80008fa4:	00813483          	ld	s1,8(sp)
    80008fa8:	02010113          	addi	sp,sp,32
    80008fac:	00008067          	ret

0000000080008fb0 <_ZN8Producer3runEv>:
    void run() override {
    80008fb0:	fe010113          	addi	sp,sp,-32
    80008fb4:	00113c23          	sd	ra,24(sp)
    80008fb8:	00813823          	sd	s0,16(sp)
    80008fbc:	00913423          	sd	s1,8(sp)
    80008fc0:	01213023          	sd	s2,0(sp)
    80008fc4:	02010413          	addi	s0,sp,32
    80008fc8:	00050493          	mv	s1,a0
        int i = 0;
    80008fcc:	00000913          	li	s2,0
        while (!threadEnd) {
    80008fd0:	00006797          	auipc	a5,0x6
    80008fd4:	2d07a783          	lw	a5,720(a5) # 8000f2a0 <_ZL9threadEnd>
    80008fd8:	04079263          	bnez	a5,8000901c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80008fdc:	0204b783          	ld	a5,32(s1)
    80008fe0:	0007a583          	lw	a1,0(a5)
    80008fe4:	0305859b          	addiw	a1,a1,48
    80008fe8:	0087b503          	ld	a0,8(a5)
    80008fec:	ffffe097          	auipc	ra,0xffffe
    80008ff0:	db4080e7          	jalr	-588(ra) # 80006da0 <_ZN9BufferCPP3putEi>
            i++;
    80008ff4:	0019071b          	addiw	a4,s2,1
    80008ff8:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80008ffc:	0204b783          	ld	a5,32(s1)
    80009000:	0007a783          	lw	a5,0(a5)
    80009004:	00e787bb          	addw	a5,a5,a4
    80009008:	00500513          	li	a0,5
    8000900c:	02a7e53b          	remw	a0,a5,a0
    80009010:	ffff8097          	auipc	ra,0xffff8
    80009014:	3b4080e7          	jalr	948(ra) # 800013c4 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80009018:	fb9ff06f          	j	80008fd0 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    8000901c:	0204b783          	ld	a5,32(s1)
    80009020:	0107b503          	ld	a0,16(a5)
    80009024:	ffff8097          	auipc	ra,0xffff8
    80009028:	498080e7          	jalr	1176(ra) # 800014bc <_ZN9Semaphore6signalEv>
    }
    8000902c:	01813083          	ld	ra,24(sp)
    80009030:	01013403          	ld	s0,16(sp)
    80009034:	00813483          	ld	s1,8(sp)
    80009038:	00013903          	ld	s2,0(sp)
    8000903c:	02010113          	addi	sp,sp,32
    80009040:	00008067          	ret

0000000080009044 <start>:
    80009044:	ff010113          	addi	sp,sp,-16
    80009048:	00813423          	sd	s0,8(sp)
    8000904c:	01010413          	addi	s0,sp,16
    80009050:	300027f3          	csrr	a5,mstatus
    80009054:	ffffe737          	lui	a4,0xffffe
    80009058:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffee2ef>
    8000905c:	00e7f7b3          	and	a5,a5,a4
    80009060:	00001737          	lui	a4,0x1
    80009064:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80009068:	00e7e7b3          	or	a5,a5,a4
    8000906c:	30079073          	csrw	mstatus,a5
    80009070:	00000797          	auipc	a5,0x0
    80009074:	16078793          	addi	a5,a5,352 # 800091d0 <system_main>
    80009078:	34179073          	csrw	mepc,a5
    8000907c:	00000793          	li	a5,0
    80009080:	18079073          	csrw	satp,a5
    80009084:	000107b7          	lui	a5,0x10
    80009088:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000908c:	30279073          	csrw	medeleg,a5
    80009090:	30379073          	csrw	mideleg,a5
    80009094:	104027f3          	csrr	a5,sie
    80009098:	2227e793          	ori	a5,a5,546
    8000909c:	10479073          	csrw	sie,a5
    800090a0:	fff00793          	li	a5,-1
    800090a4:	00a7d793          	srli	a5,a5,0xa
    800090a8:	3b079073          	csrw	pmpaddr0,a5
    800090ac:	00f00793          	li	a5,15
    800090b0:	3a079073          	csrw	pmpcfg0,a5
    800090b4:	f14027f3          	csrr	a5,mhartid
    800090b8:	0200c737          	lui	a4,0x200c
    800090bc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800090c0:	0007869b          	sext.w	a3,a5
    800090c4:	00269713          	slli	a4,a3,0x2
    800090c8:	000f4637          	lui	a2,0xf4
    800090cc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800090d0:	00d70733          	add	a4,a4,a3
    800090d4:	0037979b          	slliw	a5,a5,0x3
    800090d8:	020046b7          	lui	a3,0x2004
    800090dc:	00d787b3          	add	a5,a5,a3
    800090e0:	00c585b3          	add	a1,a1,a2
    800090e4:	00371693          	slli	a3,a4,0x3
    800090e8:	00006717          	auipc	a4,0x6
    800090ec:	1c870713          	addi	a4,a4,456 # 8000f2b0 <timer_scratch>
    800090f0:	00b7b023          	sd	a1,0(a5)
    800090f4:	00d70733          	add	a4,a4,a3
    800090f8:	00f73c23          	sd	a5,24(a4)
    800090fc:	02c73023          	sd	a2,32(a4)
    80009100:	34071073          	csrw	mscratch,a4
    80009104:	00000797          	auipc	a5,0x0
    80009108:	6ec78793          	addi	a5,a5,1772 # 800097f0 <timervec>
    8000910c:	30579073          	csrw	mtvec,a5
    80009110:	300027f3          	csrr	a5,mstatus
    80009114:	0087e793          	ori	a5,a5,8
    80009118:	30079073          	csrw	mstatus,a5
    8000911c:	304027f3          	csrr	a5,mie
    80009120:	0807e793          	ori	a5,a5,128
    80009124:	30479073          	csrw	mie,a5
    80009128:	f14027f3          	csrr	a5,mhartid
    8000912c:	0007879b          	sext.w	a5,a5
    80009130:	00078213          	mv	tp,a5
    80009134:	30200073          	mret
    80009138:	00813403          	ld	s0,8(sp)
    8000913c:	01010113          	addi	sp,sp,16
    80009140:	00008067          	ret

0000000080009144 <timerinit>:
    80009144:	ff010113          	addi	sp,sp,-16
    80009148:	00813423          	sd	s0,8(sp)
    8000914c:	01010413          	addi	s0,sp,16
    80009150:	f14027f3          	csrr	a5,mhartid
    80009154:	0200c737          	lui	a4,0x200c
    80009158:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000915c:	0007869b          	sext.w	a3,a5
    80009160:	00269713          	slli	a4,a3,0x2
    80009164:	000f4637          	lui	a2,0xf4
    80009168:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000916c:	00d70733          	add	a4,a4,a3
    80009170:	0037979b          	slliw	a5,a5,0x3
    80009174:	020046b7          	lui	a3,0x2004
    80009178:	00d787b3          	add	a5,a5,a3
    8000917c:	00c585b3          	add	a1,a1,a2
    80009180:	00371693          	slli	a3,a4,0x3
    80009184:	00006717          	auipc	a4,0x6
    80009188:	12c70713          	addi	a4,a4,300 # 8000f2b0 <timer_scratch>
    8000918c:	00b7b023          	sd	a1,0(a5)
    80009190:	00d70733          	add	a4,a4,a3
    80009194:	00f73c23          	sd	a5,24(a4)
    80009198:	02c73023          	sd	a2,32(a4)
    8000919c:	34071073          	csrw	mscratch,a4
    800091a0:	00000797          	auipc	a5,0x0
    800091a4:	65078793          	addi	a5,a5,1616 # 800097f0 <timervec>
    800091a8:	30579073          	csrw	mtvec,a5
    800091ac:	300027f3          	csrr	a5,mstatus
    800091b0:	0087e793          	ori	a5,a5,8
    800091b4:	30079073          	csrw	mstatus,a5
    800091b8:	304027f3          	csrr	a5,mie
    800091bc:	0807e793          	ori	a5,a5,128
    800091c0:	30479073          	csrw	mie,a5
    800091c4:	00813403          	ld	s0,8(sp)
    800091c8:	01010113          	addi	sp,sp,16
    800091cc:	00008067          	ret

00000000800091d0 <system_main>:
    800091d0:	fe010113          	addi	sp,sp,-32
    800091d4:	00813823          	sd	s0,16(sp)
    800091d8:	00913423          	sd	s1,8(sp)
    800091dc:	00113c23          	sd	ra,24(sp)
    800091e0:	02010413          	addi	s0,sp,32
    800091e4:	00000097          	auipc	ra,0x0
    800091e8:	0c4080e7          	jalr	196(ra) # 800092a8 <cpuid>
    800091ec:	00006497          	auipc	s1,0x6
    800091f0:	ff448493          	addi	s1,s1,-12 # 8000f1e0 <started>
    800091f4:	02050263          	beqz	a0,80009218 <system_main+0x48>
    800091f8:	0004a783          	lw	a5,0(s1)
    800091fc:	0007879b          	sext.w	a5,a5
    80009200:	fe078ce3          	beqz	a5,800091f8 <system_main+0x28>
    80009204:	0ff0000f          	fence
    80009208:	00004517          	auipc	a0,0x4
    8000920c:	80850513          	addi	a0,a0,-2040 # 8000ca10 <CONSOLE_STATUS+0xa00>
    80009210:	00001097          	auipc	ra,0x1
    80009214:	a7c080e7          	jalr	-1412(ra) # 80009c8c <panic>
    80009218:	00001097          	auipc	ra,0x1
    8000921c:	9d0080e7          	jalr	-1584(ra) # 80009be8 <consoleinit>
    80009220:	00001097          	auipc	ra,0x1
    80009224:	15c080e7          	jalr	348(ra) # 8000a37c <printfinit>
    80009228:	00003517          	auipc	a0,0x3
    8000922c:	64050513          	addi	a0,a0,1600 # 8000c868 <CONSOLE_STATUS+0x858>
    80009230:	00001097          	auipc	ra,0x1
    80009234:	ab8080e7          	jalr	-1352(ra) # 80009ce8 <__printf>
    80009238:	00003517          	auipc	a0,0x3
    8000923c:	7a850513          	addi	a0,a0,1960 # 8000c9e0 <CONSOLE_STATUS+0x9d0>
    80009240:	00001097          	auipc	ra,0x1
    80009244:	aa8080e7          	jalr	-1368(ra) # 80009ce8 <__printf>
    80009248:	00003517          	auipc	a0,0x3
    8000924c:	62050513          	addi	a0,a0,1568 # 8000c868 <CONSOLE_STATUS+0x858>
    80009250:	00001097          	auipc	ra,0x1
    80009254:	a98080e7          	jalr	-1384(ra) # 80009ce8 <__printf>
    80009258:	00001097          	auipc	ra,0x1
    8000925c:	4b0080e7          	jalr	1200(ra) # 8000a708 <kinit>
    80009260:	00000097          	auipc	ra,0x0
    80009264:	148080e7          	jalr	328(ra) # 800093a8 <trapinit>
    80009268:	00000097          	auipc	ra,0x0
    8000926c:	16c080e7          	jalr	364(ra) # 800093d4 <trapinithart>
    80009270:	00000097          	auipc	ra,0x0
    80009274:	5c0080e7          	jalr	1472(ra) # 80009830 <plicinit>
    80009278:	00000097          	auipc	ra,0x0
    8000927c:	5e0080e7          	jalr	1504(ra) # 80009858 <plicinithart>
    80009280:	00000097          	auipc	ra,0x0
    80009284:	078080e7          	jalr	120(ra) # 800092f8 <userinit>
    80009288:	0ff0000f          	fence
    8000928c:	00100793          	li	a5,1
    80009290:	00003517          	auipc	a0,0x3
    80009294:	76850513          	addi	a0,a0,1896 # 8000c9f8 <CONSOLE_STATUS+0x9e8>
    80009298:	00f4a023          	sw	a5,0(s1)
    8000929c:	00001097          	auipc	ra,0x1
    800092a0:	a4c080e7          	jalr	-1460(ra) # 80009ce8 <__printf>
    800092a4:	0000006f          	j	800092a4 <system_main+0xd4>

00000000800092a8 <cpuid>:
    800092a8:	ff010113          	addi	sp,sp,-16
    800092ac:	00813423          	sd	s0,8(sp)
    800092b0:	01010413          	addi	s0,sp,16
    800092b4:	00020513          	mv	a0,tp
    800092b8:	00813403          	ld	s0,8(sp)
    800092bc:	0005051b          	sext.w	a0,a0
    800092c0:	01010113          	addi	sp,sp,16
    800092c4:	00008067          	ret

00000000800092c8 <mycpu>:
    800092c8:	ff010113          	addi	sp,sp,-16
    800092cc:	00813423          	sd	s0,8(sp)
    800092d0:	01010413          	addi	s0,sp,16
    800092d4:	00020793          	mv	a5,tp
    800092d8:	00813403          	ld	s0,8(sp)
    800092dc:	0007879b          	sext.w	a5,a5
    800092e0:	00779793          	slli	a5,a5,0x7
    800092e4:	00007517          	auipc	a0,0x7
    800092e8:	ffc50513          	addi	a0,a0,-4 # 800102e0 <cpus>
    800092ec:	00f50533          	add	a0,a0,a5
    800092f0:	01010113          	addi	sp,sp,16
    800092f4:	00008067          	ret

00000000800092f8 <userinit>:
    800092f8:	ff010113          	addi	sp,sp,-16
    800092fc:	00813423          	sd	s0,8(sp)
    80009300:	01010413          	addi	s0,sp,16
    80009304:	00813403          	ld	s0,8(sp)
    80009308:	01010113          	addi	sp,sp,16
    8000930c:	ffff9317          	auipc	t1,0xffff9
    80009310:	4bc30067          	jr	1212(t1) # 800027c8 <main>

0000000080009314 <either_copyout>:
    80009314:	ff010113          	addi	sp,sp,-16
    80009318:	00813023          	sd	s0,0(sp)
    8000931c:	00113423          	sd	ra,8(sp)
    80009320:	01010413          	addi	s0,sp,16
    80009324:	02051663          	bnez	a0,80009350 <either_copyout+0x3c>
    80009328:	00058513          	mv	a0,a1
    8000932c:	00060593          	mv	a1,a2
    80009330:	0006861b          	sext.w	a2,a3
    80009334:	00002097          	auipc	ra,0x2
    80009338:	c60080e7          	jalr	-928(ra) # 8000af94 <__memmove>
    8000933c:	00813083          	ld	ra,8(sp)
    80009340:	00013403          	ld	s0,0(sp)
    80009344:	00000513          	li	a0,0
    80009348:	01010113          	addi	sp,sp,16
    8000934c:	00008067          	ret
    80009350:	00003517          	auipc	a0,0x3
    80009354:	6e850513          	addi	a0,a0,1768 # 8000ca38 <CONSOLE_STATUS+0xa28>
    80009358:	00001097          	auipc	ra,0x1
    8000935c:	934080e7          	jalr	-1740(ra) # 80009c8c <panic>

0000000080009360 <either_copyin>:
    80009360:	ff010113          	addi	sp,sp,-16
    80009364:	00813023          	sd	s0,0(sp)
    80009368:	00113423          	sd	ra,8(sp)
    8000936c:	01010413          	addi	s0,sp,16
    80009370:	02059463          	bnez	a1,80009398 <either_copyin+0x38>
    80009374:	00060593          	mv	a1,a2
    80009378:	0006861b          	sext.w	a2,a3
    8000937c:	00002097          	auipc	ra,0x2
    80009380:	c18080e7          	jalr	-1000(ra) # 8000af94 <__memmove>
    80009384:	00813083          	ld	ra,8(sp)
    80009388:	00013403          	ld	s0,0(sp)
    8000938c:	00000513          	li	a0,0
    80009390:	01010113          	addi	sp,sp,16
    80009394:	00008067          	ret
    80009398:	00003517          	auipc	a0,0x3
    8000939c:	6c850513          	addi	a0,a0,1736 # 8000ca60 <CONSOLE_STATUS+0xa50>
    800093a0:	00001097          	auipc	ra,0x1
    800093a4:	8ec080e7          	jalr	-1812(ra) # 80009c8c <panic>

00000000800093a8 <trapinit>:
    800093a8:	ff010113          	addi	sp,sp,-16
    800093ac:	00813423          	sd	s0,8(sp)
    800093b0:	01010413          	addi	s0,sp,16
    800093b4:	00813403          	ld	s0,8(sp)
    800093b8:	00003597          	auipc	a1,0x3
    800093bc:	6d058593          	addi	a1,a1,1744 # 8000ca88 <CONSOLE_STATUS+0xa78>
    800093c0:	00007517          	auipc	a0,0x7
    800093c4:	fa050513          	addi	a0,a0,-96 # 80010360 <tickslock>
    800093c8:	01010113          	addi	sp,sp,16
    800093cc:	00001317          	auipc	t1,0x1
    800093d0:	5cc30067          	jr	1484(t1) # 8000a998 <initlock>

00000000800093d4 <trapinithart>:
    800093d4:	ff010113          	addi	sp,sp,-16
    800093d8:	00813423          	sd	s0,8(sp)
    800093dc:	01010413          	addi	s0,sp,16
    800093e0:	00000797          	auipc	a5,0x0
    800093e4:	30078793          	addi	a5,a5,768 # 800096e0 <kernelvec>
    800093e8:	10579073          	csrw	stvec,a5
    800093ec:	00813403          	ld	s0,8(sp)
    800093f0:	01010113          	addi	sp,sp,16
    800093f4:	00008067          	ret

00000000800093f8 <usertrap>:
    800093f8:	ff010113          	addi	sp,sp,-16
    800093fc:	00813423          	sd	s0,8(sp)
    80009400:	01010413          	addi	s0,sp,16
    80009404:	00813403          	ld	s0,8(sp)
    80009408:	01010113          	addi	sp,sp,16
    8000940c:	00008067          	ret

0000000080009410 <usertrapret>:
    80009410:	ff010113          	addi	sp,sp,-16
    80009414:	00813423          	sd	s0,8(sp)
    80009418:	01010413          	addi	s0,sp,16
    8000941c:	00813403          	ld	s0,8(sp)
    80009420:	01010113          	addi	sp,sp,16
    80009424:	00008067          	ret

0000000080009428 <kerneltrap>:
    80009428:	fe010113          	addi	sp,sp,-32
    8000942c:	00813823          	sd	s0,16(sp)
    80009430:	00113c23          	sd	ra,24(sp)
    80009434:	00913423          	sd	s1,8(sp)
    80009438:	02010413          	addi	s0,sp,32
    8000943c:	142025f3          	csrr	a1,scause
    80009440:	100027f3          	csrr	a5,sstatus
    80009444:	0027f793          	andi	a5,a5,2
    80009448:	10079c63          	bnez	a5,80009560 <kerneltrap+0x138>
    8000944c:	142027f3          	csrr	a5,scause
    80009450:	0207ce63          	bltz	a5,8000948c <kerneltrap+0x64>
    80009454:	00003517          	auipc	a0,0x3
    80009458:	67c50513          	addi	a0,a0,1660 # 8000cad0 <CONSOLE_STATUS+0xac0>
    8000945c:	00001097          	auipc	ra,0x1
    80009460:	88c080e7          	jalr	-1908(ra) # 80009ce8 <__printf>
    80009464:	141025f3          	csrr	a1,sepc
    80009468:	14302673          	csrr	a2,stval
    8000946c:	00003517          	auipc	a0,0x3
    80009470:	67450513          	addi	a0,a0,1652 # 8000cae0 <CONSOLE_STATUS+0xad0>
    80009474:	00001097          	auipc	ra,0x1
    80009478:	874080e7          	jalr	-1932(ra) # 80009ce8 <__printf>
    8000947c:	00003517          	auipc	a0,0x3
    80009480:	67c50513          	addi	a0,a0,1660 # 8000caf8 <CONSOLE_STATUS+0xae8>
    80009484:	00001097          	auipc	ra,0x1
    80009488:	808080e7          	jalr	-2040(ra) # 80009c8c <panic>
    8000948c:	0ff7f713          	andi	a4,a5,255
    80009490:	00900693          	li	a3,9
    80009494:	04d70063          	beq	a4,a3,800094d4 <kerneltrap+0xac>
    80009498:	fff00713          	li	a4,-1
    8000949c:	03f71713          	slli	a4,a4,0x3f
    800094a0:	00170713          	addi	a4,a4,1
    800094a4:	fae798e3          	bne	a5,a4,80009454 <kerneltrap+0x2c>
    800094a8:	00000097          	auipc	ra,0x0
    800094ac:	e00080e7          	jalr	-512(ra) # 800092a8 <cpuid>
    800094b0:	06050663          	beqz	a0,8000951c <kerneltrap+0xf4>
    800094b4:	144027f3          	csrr	a5,sip
    800094b8:	ffd7f793          	andi	a5,a5,-3
    800094bc:	14479073          	csrw	sip,a5
    800094c0:	01813083          	ld	ra,24(sp)
    800094c4:	01013403          	ld	s0,16(sp)
    800094c8:	00813483          	ld	s1,8(sp)
    800094cc:	02010113          	addi	sp,sp,32
    800094d0:	00008067          	ret
    800094d4:	00000097          	auipc	ra,0x0
    800094d8:	3d0080e7          	jalr	976(ra) # 800098a4 <plic_claim>
    800094dc:	00a00793          	li	a5,10
    800094e0:	00050493          	mv	s1,a0
    800094e4:	06f50863          	beq	a0,a5,80009554 <kerneltrap+0x12c>
    800094e8:	fc050ce3          	beqz	a0,800094c0 <kerneltrap+0x98>
    800094ec:	00050593          	mv	a1,a0
    800094f0:	00003517          	auipc	a0,0x3
    800094f4:	5c050513          	addi	a0,a0,1472 # 8000cab0 <CONSOLE_STATUS+0xaa0>
    800094f8:	00000097          	auipc	ra,0x0
    800094fc:	7f0080e7          	jalr	2032(ra) # 80009ce8 <__printf>
    80009500:	01013403          	ld	s0,16(sp)
    80009504:	01813083          	ld	ra,24(sp)
    80009508:	00048513          	mv	a0,s1
    8000950c:	00813483          	ld	s1,8(sp)
    80009510:	02010113          	addi	sp,sp,32
    80009514:	00000317          	auipc	t1,0x0
    80009518:	3c830067          	jr	968(t1) # 800098dc <plic_complete>
    8000951c:	00007517          	auipc	a0,0x7
    80009520:	e4450513          	addi	a0,a0,-444 # 80010360 <tickslock>
    80009524:	00001097          	auipc	ra,0x1
    80009528:	498080e7          	jalr	1176(ra) # 8000a9bc <acquire>
    8000952c:	00006717          	auipc	a4,0x6
    80009530:	cb870713          	addi	a4,a4,-840 # 8000f1e4 <ticks>
    80009534:	00072783          	lw	a5,0(a4)
    80009538:	00007517          	auipc	a0,0x7
    8000953c:	e2850513          	addi	a0,a0,-472 # 80010360 <tickslock>
    80009540:	0017879b          	addiw	a5,a5,1
    80009544:	00f72023          	sw	a5,0(a4)
    80009548:	00001097          	auipc	ra,0x1
    8000954c:	540080e7          	jalr	1344(ra) # 8000aa88 <release>
    80009550:	f65ff06f          	j	800094b4 <kerneltrap+0x8c>
    80009554:	00001097          	auipc	ra,0x1
    80009558:	09c080e7          	jalr	156(ra) # 8000a5f0 <uartintr>
    8000955c:	fa5ff06f          	j	80009500 <kerneltrap+0xd8>
    80009560:	00003517          	auipc	a0,0x3
    80009564:	53050513          	addi	a0,a0,1328 # 8000ca90 <CONSOLE_STATUS+0xa80>
    80009568:	00000097          	auipc	ra,0x0
    8000956c:	724080e7          	jalr	1828(ra) # 80009c8c <panic>

0000000080009570 <clockintr>:
    80009570:	fe010113          	addi	sp,sp,-32
    80009574:	00813823          	sd	s0,16(sp)
    80009578:	00913423          	sd	s1,8(sp)
    8000957c:	00113c23          	sd	ra,24(sp)
    80009580:	02010413          	addi	s0,sp,32
    80009584:	00007497          	auipc	s1,0x7
    80009588:	ddc48493          	addi	s1,s1,-548 # 80010360 <tickslock>
    8000958c:	00048513          	mv	a0,s1
    80009590:	00001097          	auipc	ra,0x1
    80009594:	42c080e7          	jalr	1068(ra) # 8000a9bc <acquire>
    80009598:	00006717          	auipc	a4,0x6
    8000959c:	c4c70713          	addi	a4,a4,-948 # 8000f1e4 <ticks>
    800095a0:	00072783          	lw	a5,0(a4)
    800095a4:	01013403          	ld	s0,16(sp)
    800095a8:	01813083          	ld	ra,24(sp)
    800095ac:	00048513          	mv	a0,s1
    800095b0:	0017879b          	addiw	a5,a5,1
    800095b4:	00813483          	ld	s1,8(sp)
    800095b8:	00f72023          	sw	a5,0(a4)
    800095bc:	02010113          	addi	sp,sp,32
    800095c0:	00001317          	auipc	t1,0x1
    800095c4:	4c830067          	jr	1224(t1) # 8000aa88 <release>

00000000800095c8 <devintr>:
    800095c8:	142027f3          	csrr	a5,scause
    800095cc:	00000513          	li	a0,0
    800095d0:	0007c463          	bltz	a5,800095d8 <devintr+0x10>
    800095d4:	00008067          	ret
    800095d8:	fe010113          	addi	sp,sp,-32
    800095dc:	00813823          	sd	s0,16(sp)
    800095e0:	00113c23          	sd	ra,24(sp)
    800095e4:	00913423          	sd	s1,8(sp)
    800095e8:	02010413          	addi	s0,sp,32
    800095ec:	0ff7f713          	andi	a4,a5,255
    800095f0:	00900693          	li	a3,9
    800095f4:	04d70c63          	beq	a4,a3,8000964c <devintr+0x84>
    800095f8:	fff00713          	li	a4,-1
    800095fc:	03f71713          	slli	a4,a4,0x3f
    80009600:	00170713          	addi	a4,a4,1
    80009604:	00e78c63          	beq	a5,a4,8000961c <devintr+0x54>
    80009608:	01813083          	ld	ra,24(sp)
    8000960c:	01013403          	ld	s0,16(sp)
    80009610:	00813483          	ld	s1,8(sp)
    80009614:	02010113          	addi	sp,sp,32
    80009618:	00008067          	ret
    8000961c:	00000097          	auipc	ra,0x0
    80009620:	c8c080e7          	jalr	-884(ra) # 800092a8 <cpuid>
    80009624:	06050663          	beqz	a0,80009690 <devintr+0xc8>
    80009628:	144027f3          	csrr	a5,sip
    8000962c:	ffd7f793          	andi	a5,a5,-3
    80009630:	14479073          	csrw	sip,a5
    80009634:	01813083          	ld	ra,24(sp)
    80009638:	01013403          	ld	s0,16(sp)
    8000963c:	00813483          	ld	s1,8(sp)
    80009640:	00200513          	li	a0,2
    80009644:	02010113          	addi	sp,sp,32
    80009648:	00008067          	ret
    8000964c:	00000097          	auipc	ra,0x0
    80009650:	258080e7          	jalr	600(ra) # 800098a4 <plic_claim>
    80009654:	00a00793          	li	a5,10
    80009658:	00050493          	mv	s1,a0
    8000965c:	06f50663          	beq	a0,a5,800096c8 <devintr+0x100>
    80009660:	00100513          	li	a0,1
    80009664:	fa0482e3          	beqz	s1,80009608 <devintr+0x40>
    80009668:	00048593          	mv	a1,s1
    8000966c:	00003517          	auipc	a0,0x3
    80009670:	44450513          	addi	a0,a0,1092 # 8000cab0 <CONSOLE_STATUS+0xaa0>
    80009674:	00000097          	auipc	ra,0x0
    80009678:	674080e7          	jalr	1652(ra) # 80009ce8 <__printf>
    8000967c:	00048513          	mv	a0,s1
    80009680:	00000097          	auipc	ra,0x0
    80009684:	25c080e7          	jalr	604(ra) # 800098dc <plic_complete>
    80009688:	00100513          	li	a0,1
    8000968c:	f7dff06f          	j	80009608 <devintr+0x40>
    80009690:	00007517          	auipc	a0,0x7
    80009694:	cd050513          	addi	a0,a0,-816 # 80010360 <tickslock>
    80009698:	00001097          	auipc	ra,0x1
    8000969c:	324080e7          	jalr	804(ra) # 8000a9bc <acquire>
    800096a0:	00006717          	auipc	a4,0x6
    800096a4:	b4470713          	addi	a4,a4,-1212 # 8000f1e4 <ticks>
    800096a8:	00072783          	lw	a5,0(a4)
    800096ac:	00007517          	auipc	a0,0x7
    800096b0:	cb450513          	addi	a0,a0,-844 # 80010360 <tickslock>
    800096b4:	0017879b          	addiw	a5,a5,1
    800096b8:	00f72023          	sw	a5,0(a4)
    800096bc:	00001097          	auipc	ra,0x1
    800096c0:	3cc080e7          	jalr	972(ra) # 8000aa88 <release>
    800096c4:	f65ff06f          	j	80009628 <devintr+0x60>
    800096c8:	00001097          	auipc	ra,0x1
    800096cc:	f28080e7          	jalr	-216(ra) # 8000a5f0 <uartintr>
    800096d0:	fadff06f          	j	8000967c <devintr+0xb4>
	...

00000000800096e0 <kernelvec>:
    800096e0:	f0010113          	addi	sp,sp,-256
    800096e4:	00113023          	sd	ra,0(sp)
    800096e8:	00213423          	sd	sp,8(sp)
    800096ec:	00313823          	sd	gp,16(sp)
    800096f0:	00413c23          	sd	tp,24(sp)
    800096f4:	02513023          	sd	t0,32(sp)
    800096f8:	02613423          	sd	t1,40(sp)
    800096fc:	02713823          	sd	t2,48(sp)
    80009700:	02813c23          	sd	s0,56(sp)
    80009704:	04913023          	sd	s1,64(sp)
    80009708:	04a13423          	sd	a0,72(sp)
    8000970c:	04b13823          	sd	a1,80(sp)
    80009710:	04c13c23          	sd	a2,88(sp)
    80009714:	06d13023          	sd	a3,96(sp)
    80009718:	06e13423          	sd	a4,104(sp)
    8000971c:	06f13823          	sd	a5,112(sp)
    80009720:	07013c23          	sd	a6,120(sp)
    80009724:	09113023          	sd	a7,128(sp)
    80009728:	09213423          	sd	s2,136(sp)
    8000972c:	09313823          	sd	s3,144(sp)
    80009730:	09413c23          	sd	s4,152(sp)
    80009734:	0b513023          	sd	s5,160(sp)
    80009738:	0b613423          	sd	s6,168(sp)
    8000973c:	0b713823          	sd	s7,176(sp)
    80009740:	0b813c23          	sd	s8,184(sp)
    80009744:	0d913023          	sd	s9,192(sp)
    80009748:	0da13423          	sd	s10,200(sp)
    8000974c:	0db13823          	sd	s11,208(sp)
    80009750:	0dc13c23          	sd	t3,216(sp)
    80009754:	0fd13023          	sd	t4,224(sp)
    80009758:	0fe13423          	sd	t5,232(sp)
    8000975c:	0ff13823          	sd	t6,240(sp)
    80009760:	cc9ff0ef          	jal	ra,80009428 <kerneltrap>
    80009764:	00013083          	ld	ra,0(sp)
    80009768:	00813103          	ld	sp,8(sp)
    8000976c:	01013183          	ld	gp,16(sp)
    80009770:	02013283          	ld	t0,32(sp)
    80009774:	02813303          	ld	t1,40(sp)
    80009778:	03013383          	ld	t2,48(sp)
    8000977c:	03813403          	ld	s0,56(sp)
    80009780:	04013483          	ld	s1,64(sp)
    80009784:	04813503          	ld	a0,72(sp)
    80009788:	05013583          	ld	a1,80(sp)
    8000978c:	05813603          	ld	a2,88(sp)
    80009790:	06013683          	ld	a3,96(sp)
    80009794:	06813703          	ld	a4,104(sp)
    80009798:	07013783          	ld	a5,112(sp)
    8000979c:	07813803          	ld	a6,120(sp)
    800097a0:	08013883          	ld	a7,128(sp)
    800097a4:	08813903          	ld	s2,136(sp)
    800097a8:	09013983          	ld	s3,144(sp)
    800097ac:	09813a03          	ld	s4,152(sp)
    800097b0:	0a013a83          	ld	s5,160(sp)
    800097b4:	0a813b03          	ld	s6,168(sp)
    800097b8:	0b013b83          	ld	s7,176(sp)
    800097bc:	0b813c03          	ld	s8,184(sp)
    800097c0:	0c013c83          	ld	s9,192(sp)
    800097c4:	0c813d03          	ld	s10,200(sp)
    800097c8:	0d013d83          	ld	s11,208(sp)
    800097cc:	0d813e03          	ld	t3,216(sp)
    800097d0:	0e013e83          	ld	t4,224(sp)
    800097d4:	0e813f03          	ld	t5,232(sp)
    800097d8:	0f013f83          	ld	t6,240(sp)
    800097dc:	10010113          	addi	sp,sp,256
    800097e0:	10200073          	sret
    800097e4:	00000013          	nop
    800097e8:	00000013          	nop
    800097ec:	00000013          	nop

00000000800097f0 <timervec>:
    800097f0:	34051573          	csrrw	a0,mscratch,a0
    800097f4:	00b53023          	sd	a1,0(a0)
    800097f8:	00c53423          	sd	a2,8(a0)
    800097fc:	00d53823          	sd	a3,16(a0)
    80009800:	01853583          	ld	a1,24(a0)
    80009804:	02053603          	ld	a2,32(a0)
    80009808:	0005b683          	ld	a3,0(a1)
    8000980c:	00c686b3          	add	a3,a3,a2
    80009810:	00d5b023          	sd	a3,0(a1)
    80009814:	00200593          	li	a1,2
    80009818:	14459073          	csrw	sip,a1
    8000981c:	01053683          	ld	a3,16(a0)
    80009820:	00853603          	ld	a2,8(a0)
    80009824:	00053583          	ld	a1,0(a0)
    80009828:	34051573          	csrrw	a0,mscratch,a0
    8000982c:	30200073          	mret

0000000080009830 <plicinit>:
    80009830:	ff010113          	addi	sp,sp,-16
    80009834:	00813423          	sd	s0,8(sp)
    80009838:	01010413          	addi	s0,sp,16
    8000983c:	00813403          	ld	s0,8(sp)
    80009840:	0c0007b7          	lui	a5,0xc000
    80009844:	00100713          	li	a4,1
    80009848:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000984c:	00e7a223          	sw	a4,4(a5)
    80009850:	01010113          	addi	sp,sp,16
    80009854:	00008067          	ret

0000000080009858 <plicinithart>:
    80009858:	ff010113          	addi	sp,sp,-16
    8000985c:	00813023          	sd	s0,0(sp)
    80009860:	00113423          	sd	ra,8(sp)
    80009864:	01010413          	addi	s0,sp,16
    80009868:	00000097          	auipc	ra,0x0
    8000986c:	a40080e7          	jalr	-1472(ra) # 800092a8 <cpuid>
    80009870:	0085171b          	slliw	a4,a0,0x8
    80009874:	0c0027b7          	lui	a5,0xc002
    80009878:	00e787b3          	add	a5,a5,a4
    8000987c:	40200713          	li	a4,1026
    80009880:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80009884:	00813083          	ld	ra,8(sp)
    80009888:	00013403          	ld	s0,0(sp)
    8000988c:	00d5151b          	slliw	a0,a0,0xd
    80009890:	0c2017b7          	lui	a5,0xc201
    80009894:	00a78533          	add	a0,a5,a0
    80009898:	00052023          	sw	zero,0(a0)
    8000989c:	01010113          	addi	sp,sp,16
    800098a0:	00008067          	ret

00000000800098a4 <plic_claim>:
    800098a4:	ff010113          	addi	sp,sp,-16
    800098a8:	00813023          	sd	s0,0(sp)
    800098ac:	00113423          	sd	ra,8(sp)
    800098b0:	01010413          	addi	s0,sp,16
    800098b4:	00000097          	auipc	ra,0x0
    800098b8:	9f4080e7          	jalr	-1548(ra) # 800092a8 <cpuid>
    800098bc:	00813083          	ld	ra,8(sp)
    800098c0:	00013403          	ld	s0,0(sp)
    800098c4:	00d5151b          	slliw	a0,a0,0xd
    800098c8:	0c2017b7          	lui	a5,0xc201
    800098cc:	00a78533          	add	a0,a5,a0
    800098d0:	00452503          	lw	a0,4(a0)
    800098d4:	01010113          	addi	sp,sp,16
    800098d8:	00008067          	ret

00000000800098dc <plic_complete>:
    800098dc:	fe010113          	addi	sp,sp,-32
    800098e0:	00813823          	sd	s0,16(sp)
    800098e4:	00913423          	sd	s1,8(sp)
    800098e8:	00113c23          	sd	ra,24(sp)
    800098ec:	02010413          	addi	s0,sp,32
    800098f0:	00050493          	mv	s1,a0
    800098f4:	00000097          	auipc	ra,0x0
    800098f8:	9b4080e7          	jalr	-1612(ra) # 800092a8 <cpuid>
    800098fc:	01813083          	ld	ra,24(sp)
    80009900:	01013403          	ld	s0,16(sp)
    80009904:	00d5179b          	slliw	a5,a0,0xd
    80009908:	0c201737          	lui	a4,0xc201
    8000990c:	00f707b3          	add	a5,a4,a5
    80009910:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80009914:	00813483          	ld	s1,8(sp)
    80009918:	02010113          	addi	sp,sp,32
    8000991c:	00008067          	ret

0000000080009920 <consolewrite>:
    80009920:	fb010113          	addi	sp,sp,-80
    80009924:	04813023          	sd	s0,64(sp)
    80009928:	04113423          	sd	ra,72(sp)
    8000992c:	02913c23          	sd	s1,56(sp)
    80009930:	03213823          	sd	s2,48(sp)
    80009934:	03313423          	sd	s3,40(sp)
    80009938:	03413023          	sd	s4,32(sp)
    8000993c:	01513c23          	sd	s5,24(sp)
    80009940:	05010413          	addi	s0,sp,80
    80009944:	06c05c63          	blez	a2,800099bc <consolewrite+0x9c>
    80009948:	00060993          	mv	s3,a2
    8000994c:	00050a13          	mv	s4,a0
    80009950:	00058493          	mv	s1,a1
    80009954:	00000913          	li	s2,0
    80009958:	fff00a93          	li	s5,-1
    8000995c:	01c0006f          	j	80009978 <consolewrite+0x58>
    80009960:	fbf44503          	lbu	a0,-65(s0)
    80009964:	0019091b          	addiw	s2,s2,1
    80009968:	00148493          	addi	s1,s1,1
    8000996c:	00001097          	auipc	ra,0x1
    80009970:	a9c080e7          	jalr	-1380(ra) # 8000a408 <uartputc>
    80009974:	03298063          	beq	s3,s2,80009994 <consolewrite+0x74>
    80009978:	00048613          	mv	a2,s1
    8000997c:	00100693          	li	a3,1
    80009980:	000a0593          	mv	a1,s4
    80009984:	fbf40513          	addi	a0,s0,-65
    80009988:	00000097          	auipc	ra,0x0
    8000998c:	9d8080e7          	jalr	-1576(ra) # 80009360 <either_copyin>
    80009990:	fd5518e3          	bne	a0,s5,80009960 <consolewrite+0x40>
    80009994:	04813083          	ld	ra,72(sp)
    80009998:	04013403          	ld	s0,64(sp)
    8000999c:	03813483          	ld	s1,56(sp)
    800099a0:	02813983          	ld	s3,40(sp)
    800099a4:	02013a03          	ld	s4,32(sp)
    800099a8:	01813a83          	ld	s5,24(sp)
    800099ac:	00090513          	mv	a0,s2
    800099b0:	03013903          	ld	s2,48(sp)
    800099b4:	05010113          	addi	sp,sp,80
    800099b8:	00008067          	ret
    800099bc:	00000913          	li	s2,0
    800099c0:	fd5ff06f          	j	80009994 <consolewrite+0x74>

00000000800099c4 <consoleread>:
    800099c4:	f9010113          	addi	sp,sp,-112
    800099c8:	06813023          	sd	s0,96(sp)
    800099cc:	04913c23          	sd	s1,88(sp)
    800099d0:	05213823          	sd	s2,80(sp)
    800099d4:	05313423          	sd	s3,72(sp)
    800099d8:	05413023          	sd	s4,64(sp)
    800099dc:	03513c23          	sd	s5,56(sp)
    800099e0:	03613823          	sd	s6,48(sp)
    800099e4:	03713423          	sd	s7,40(sp)
    800099e8:	03813023          	sd	s8,32(sp)
    800099ec:	06113423          	sd	ra,104(sp)
    800099f0:	01913c23          	sd	s9,24(sp)
    800099f4:	07010413          	addi	s0,sp,112
    800099f8:	00060b93          	mv	s7,a2
    800099fc:	00050913          	mv	s2,a0
    80009a00:	00058c13          	mv	s8,a1
    80009a04:	00060b1b          	sext.w	s6,a2
    80009a08:	00007497          	auipc	s1,0x7
    80009a0c:	98048493          	addi	s1,s1,-1664 # 80010388 <cons>
    80009a10:	00400993          	li	s3,4
    80009a14:	fff00a13          	li	s4,-1
    80009a18:	00a00a93          	li	s5,10
    80009a1c:	05705e63          	blez	s7,80009a78 <consoleread+0xb4>
    80009a20:	09c4a703          	lw	a4,156(s1)
    80009a24:	0984a783          	lw	a5,152(s1)
    80009a28:	0007071b          	sext.w	a4,a4
    80009a2c:	08e78463          	beq	a5,a4,80009ab4 <consoleread+0xf0>
    80009a30:	07f7f713          	andi	a4,a5,127
    80009a34:	00e48733          	add	a4,s1,a4
    80009a38:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80009a3c:	0017869b          	addiw	a3,a5,1
    80009a40:	08d4ac23          	sw	a3,152(s1)
    80009a44:	00070c9b          	sext.w	s9,a4
    80009a48:	0b370663          	beq	a4,s3,80009af4 <consoleread+0x130>
    80009a4c:	00100693          	li	a3,1
    80009a50:	f9f40613          	addi	a2,s0,-97
    80009a54:	000c0593          	mv	a1,s8
    80009a58:	00090513          	mv	a0,s2
    80009a5c:	f8e40fa3          	sb	a4,-97(s0)
    80009a60:	00000097          	auipc	ra,0x0
    80009a64:	8b4080e7          	jalr	-1868(ra) # 80009314 <either_copyout>
    80009a68:	01450863          	beq	a0,s4,80009a78 <consoleread+0xb4>
    80009a6c:	001c0c13          	addi	s8,s8,1
    80009a70:	fffb8b9b          	addiw	s7,s7,-1
    80009a74:	fb5c94e3          	bne	s9,s5,80009a1c <consoleread+0x58>
    80009a78:	000b851b          	sext.w	a0,s7
    80009a7c:	06813083          	ld	ra,104(sp)
    80009a80:	06013403          	ld	s0,96(sp)
    80009a84:	05813483          	ld	s1,88(sp)
    80009a88:	05013903          	ld	s2,80(sp)
    80009a8c:	04813983          	ld	s3,72(sp)
    80009a90:	04013a03          	ld	s4,64(sp)
    80009a94:	03813a83          	ld	s5,56(sp)
    80009a98:	02813b83          	ld	s7,40(sp)
    80009a9c:	02013c03          	ld	s8,32(sp)
    80009aa0:	01813c83          	ld	s9,24(sp)
    80009aa4:	40ab053b          	subw	a0,s6,a0
    80009aa8:	03013b03          	ld	s6,48(sp)
    80009aac:	07010113          	addi	sp,sp,112
    80009ab0:	00008067          	ret
    80009ab4:	00001097          	auipc	ra,0x1
    80009ab8:	1d8080e7          	jalr	472(ra) # 8000ac8c <push_on>
    80009abc:	0984a703          	lw	a4,152(s1)
    80009ac0:	09c4a783          	lw	a5,156(s1)
    80009ac4:	0007879b          	sext.w	a5,a5
    80009ac8:	fef70ce3          	beq	a4,a5,80009ac0 <consoleread+0xfc>
    80009acc:	00001097          	auipc	ra,0x1
    80009ad0:	234080e7          	jalr	564(ra) # 8000ad00 <pop_on>
    80009ad4:	0984a783          	lw	a5,152(s1)
    80009ad8:	07f7f713          	andi	a4,a5,127
    80009adc:	00e48733          	add	a4,s1,a4
    80009ae0:	01874703          	lbu	a4,24(a4)
    80009ae4:	0017869b          	addiw	a3,a5,1
    80009ae8:	08d4ac23          	sw	a3,152(s1)
    80009aec:	00070c9b          	sext.w	s9,a4
    80009af0:	f5371ee3          	bne	a4,s3,80009a4c <consoleread+0x88>
    80009af4:	000b851b          	sext.w	a0,s7
    80009af8:	f96bf2e3          	bgeu	s7,s6,80009a7c <consoleread+0xb8>
    80009afc:	08f4ac23          	sw	a5,152(s1)
    80009b00:	f7dff06f          	j	80009a7c <consoleread+0xb8>

0000000080009b04 <consputc>:
    80009b04:	10000793          	li	a5,256
    80009b08:	00f50663          	beq	a0,a5,80009b14 <consputc+0x10>
    80009b0c:	00001317          	auipc	t1,0x1
    80009b10:	9f430067          	jr	-1548(t1) # 8000a500 <uartputc_sync>
    80009b14:	ff010113          	addi	sp,sp,-16
    80009b18:	00113423          	sd	ra,8(sp)
    80009b1c:	00813023          	sd	s0,0(sp)
    80009b20:	01010413          	addi	s0,sp,16
    80009b24:	00800513          	li	a0,8
    80009b28:	00001097          	auipc	ra,0x1
    80009b2c:	9d8080e7          	jalr	-1576(ra) # 8000a500 <uartputc_sync>
    80009b30:	02000513          	li	a0,32
    80009b34:	00001097          	auipc	ra,0x1
    80009b38:	9cc080e7          	jalr	-1588(ra) # 8000a500 <uartputc_sync>
    80009b3c:	00013403          	ld	s0,0(sp)
    80009b40:	00813083          	ld	ra,8(sp)
    80009b44:	00800513          	li	a0,8
    80009b48:	01010113          	addi	sp,sp,16
    80009b4c:	00001317          	auipc	t1,0x1
    80009b50:	9b430067          	jr	-1612(t1) # 8000a500 <uartputc_sync>

0000000080009b54 <consoleintr>:
    80009b54:	fe010113          	addi	sp,sp,-32
    80009b58:	00813823          	sd	s0,16(sp)
    80009b5c:	00913423          	sd	s1,8(sp)
    80009b60:	01213023          	sd	s2,0(sp)
    80009b64:	00113c23          	sd	ra,24(sp)
    80009b68:	02010413          	addi	s0,sp,32
    80009b6c:	00007917          	auipc	s2,0x7
    80009b70:	81c90913          	addi	s2,s2,-2020 # 80010388 <cons>
    80009b74:	00050493          	mv	s1,a0
    80009b78:	00090513          	mv	a0,s2
    80009b7c:	00001097          	auipc	ra,0x1
    80009b80:	e40080e7          	jalr	-448(ra) # 8000a9bc <acquire>
    80009b84:	02048c63          	beqz	s1,80009bbc <consoleintr+0x68>
    80009b88:	0a092783          	lw	a5,160(s2)
    80009b8c:	09892703          	lw	a4,152(s2)
    80009b90:	07f00693          	li	a3,127
    80009b94:	40e7873b          	subw	a4,a5,a4
    80009b98:	02e6e263          	bltu	a3,a4,80009bbc <consoleintr+0x68>
    80009b9c:	00d00713          	li	a4,13
    80009ba0:	04e48063          	beq	s1,a4,80009be0 <consoleintr+0x8c>
    80009ba4:	07f7f713          	andi	a4,a5,127
    80009ba8:	00e90733          	add	a4,s2,a4
    80009bac:	0017879b          	addiw	a5,a5,1
    80009bb0:	0af92023          	sw	a5,160(s2)
    80009bb4:	00970c23          	sb	s1,24(a4)
    80009bb8:	08f92e23          	sw	a5,156(s2)
    80009bbc:	01013403          	ld	s0,16(sp)
    80009bc0:	01813083          	ld	ra,24(sp)
    80009bc4:	00813483          	ld	s1,8(sp)
    80009bc8:	00013903          	ld	s2,0(sp)
    80009bcc:	00006517          	auipc	a0,0x6
    80009bd0:	7bc50513          	addi	a0,a0,1980 # 80010388 <cons>
    80009bd4:	02010113          	addi	sp,sp,32
    80009bd8:	00001317          	auipc	t1,0x1
    80009bdc:	eb030067          	jr	-336(t1) # 8000aa88 <release>
    80009be0:	00a00493          	li	s1,10
    80009be4:	fc1ff06f          	j	80009ba4 <consoleintr+0x50>

0000000080009be8 <consoleinit>:
    80009be8:	fe010113          	addi	sp,sp,-32
    80009bec:	00113c23          	sd	ra,24(sp)
    80009bf0:	00813823          	sd	s0,16(sp)
    80009bf4:	00913423          	sd	s1,8(sp)
    80009bf8:	02010413          	addi	s0,sp,32
    80009bfc:	00006497          	auipc	s1,0x6
    80009c00:	78c48493          	addi	s1,s1,1932 # 80010388 <cons>
    80009c04:	00048513          	mv	a0,s1
    80009c08:	00003597          	auipc	a1,0x3
    80009c0c:	f0058593          	addi	a1,a1,-256 # 8000cb08 <CONSOLE_STATUS+0xaf8>
    80009c10:	00001097          	auipc	ra,0x1
    80009c14:	d88080e7          	jalr	-632(ra) # 8000a998 <initlock>
    80009c18:	00000097          	auipc	ra,0x0
    80009c1c:	7ac080e7          	jalr	1964(ra) # 8000a3c4 <uartinit>
    80009c20:	01813083          	ld	ra,24(sp)
    80009c24:	01013403          	ld	s0,16(sp)
    80009c28:	00000797          	auipc	a5,0x0
    80009c2c:	d9c78793          	addi	a5,a5,-612 # 800099c4 <consoleread>
    80009c30:	0af4bc23          	sd	a5,184(s1)
    80009c34:	00000797          	auipc	a5,0x0
    80009c38:	cec78793          	addi	a5,a5,-788 # 80009920 <consolewrite>
    80009c3c:	0cf4b023          	sd	a5,192(s1)
    80009c40:	00813483          	ld	s1,8(sp)
    80009c44:	02010113          	addi	sp,sp,32
    80009c48:	00008067          	ret

0000000080009c4c <console_read>:
    80009c4c:	ff010113          	addi	sp,sp,-16
    80009c50:	00813423          	sd	s0,8(sp)
    80009c54:	01010413          	addi	s0,sp,16
    80009c58:	00813403          	ld	s0,8(sp)
    80009c5c:	00006317          	auipc	t1,0x6
    80009c60:	7e433303          	ld	t1,2020(t1) # 80010440 <devsw+0x10>
    80009c64:	01010113          	addi	sp,sp,16
    80009c68:	00030067          	jr	t1

0000000080009c6c <console_write>:
    80009c6c:	ff010113          	addi	sp,sp,-16
    80009c70:	00813423          	sd	s0,8(sp)
    80009c74:	01010413          	addi	s0,sp,16
    80009c78:	00813403          	ld	s0,8(sp)
    80009c7c:	00006317          	auipc	t1,0x6
    80009c80:	7cc33303          	ld	t1,1996(t1) # 80010448 <devsw+0x18>
    80009c84:	01010113          	addi	sp,sp,16
    80009c88:	00030067          	jr	t1

0000000080009c8c <panic>:
    80009c8c:	fe010113          	addi	sp,sp,-32
    80009c90:	00113c23          	sd	ra,24(sp)
    80009c94:	00813823          	sd	s0,16(sp)
    80009c98:	00913423          	sd	s1,8(sp)
    80009c9c:	02010413          	addi	s0,sp,32
    80009ca0:	00050493          	mv	s1,a0
    80009ca4:	00003517          	auipc	a0,0x3
    80009ca8:	e6c50513          	addi	a0,a0,-404 # 8000cb10 <CONSOLE_STATUS+0xb00>
    80009cac:	00007797          	auipc	a5,0x7
    80009cb0:	8207ae23          	sw	zero,-1988(a5) # 800104e8 <pr+0x18>
    80009cb4:	00000097          	auipc	ra,0x0
    80009cb8:	034080e7          	jalr	52(ra) # 80009ce8 <__printf>
    80009cbc:	00048513          	mv	a0,s1
    80009cc0:	00000097          	auipc	ra,0x0
    80009cc4:	028080e7          	jalr	40(ra) # 80009ce8 <__printf>
    80009cc8:	00003517          	auipc	a0,0x3
    80009ccc:	ba050513          	addi	a0,a0,-1120 # 8000c868 <CONSOLE_STATUS+0x858>
    80009cd0:	00000097          	auipc	ra,0x0
    80009cd4:	018080e7          	jalr	24(ra) # 80009ce8 <__printf>
    80009cd8:	00100793          	li	a5,1
    80009cdc:	00005717          	auipc	a4,0x5
    80009ce0:	50f72623          	sw	a5,1292(a4) # 8000f1e8 <panicked>
    80009ce4:	0000006f          	j	80009ce4 <panic+0x58>

0000000080009ce8 <__printf>:
    80009ce8:	f3010113          	addi	sp,sp,-208
    80009cec:	08813023          	sd	s0,128(sp)
    80009cf0:	07313423          	sd	s3,104(sp)
    80009cf4:	09010413          	addi	s0,sp,144
    80009cf8:	05813023          	sd	s8,64(sp)
    80009cfc:	08113423          	sd	ra,136(sp)
    80009d00:	06913c23          	sd	s1,120(sp)
    80009d04:	07213823          	sd	s2,112(sp)
    80009d08:	07413023          	sd	s4,96(sp)
    80009d0c:	05513c23          	sd	s5,88(sp)
    80009d10:	05613823          	sd	s6,80(sp)
    80009d14:	05713423          	sd	s7,72(sp)
    80009d18:	03913c23          	sd	s9,56(sp)
    80009d1c:	03a13823          	sd	s10,48(sp)
    80009d20:	03b13423          	sd	s11,40(sp)
    80009d24:	00006317          	auipc	t1,0x6
    80009d28:	7ac30313          	addi	t1,t1,1964 # 800104d0 <pr>
    80009d2c:	01832c03          	lw	s8,24(t1)
    80009d30:	00b43423          	sd	a1,8(s0)
    80009d34:	00c43823          	sd	a2,16(s0)
    80009d38:	00d43c23          	sd	a3,24(s0)
    80009d3c:	02e43023          	sd	a4,32(s0)
    80009d40:	02f43423          	sd	a5,40(s0)
    80009d44:	03043823          	sd	a6,48(s0)
    80009d48:	03143c23          	sd	a7,56(s0)
    80009d4c:	00050993          	mv	s3,a0
    80009d50:	4a0c1663          	bnez	s8,8000a1fc <__printf+0x514>
    80009d54:	60098c63          	beqz	s3,8000a36c <__printf+0x684>
    80009d58:	0009c503          	lbu	a0,0(s3)
    80009d5c:	00840793          	addi	a5,s0,8
    80009d60:	f6f43c23          	sd	a5,-136(s0)
    80009d64:	00000493          	li	s1,0
    80009d68:	22050063          	beqz	a0,80009f88 <__printf+0x2a0>
    80009d6c:	00002a37          	lui	s4,0x2
    80009d70:	00018ab7          	lui	s5,0x18
    80009d74:	000f4b37          	lui	s6,0xf4
    80009d78:	00989bb7          	lui	s7,0x989
    80009d7c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80009d80:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80009d84:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80009d88:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80009d8c:	00148c9b          	addiw	s9,s1,1
    80009d90:	02500793          	li	a5,37
    80009d94:	01998933          	add	s2,s3,s9
    80009d98:	38f51263          	bne	a0,a5,8000a11c <__printf+0x434>
    80009d9c:	00094783          	lbu	a5,0(s2)
    80009da0:	00078c9b          	sext.w	s9,a5
    80009da4:	1e078263          	beqz	a5,80009f88 <__printf+0x2a0>
    80009da8:	0024849b          	addiw	s1,s1,2
    80009dac:	07000713          	li	a4,112
    80009db0:	00998933          	add	s2,s3,s1
    80009db4:	38e78a63          	beq	a5,a4,8000a148 <__printf+0x460>
    80009db8:	20f76863          	bltu	a4,a5,80009fc8 <__printf+0x2e0>
    80009dbc:	42a78863          	beq	a5,a0,8000a1ec <__printf+0x504>
    80009dc0:	06400713          	li	a4,100
    80009dc4:	40e79663          	bne	a5,a4,8000a1d0 <__printf+0x4e8>
    80009dc8:	f7843783          	ld	a5,-136(s0)
    80009dcc:	0007a603          	lw	a2,0(a5)
    80009dd0:	00878793          	addi	a5,a5,8
    80009dd4:	f6f43c23          	sd	a5,-136(s0)
    80009dd8:	42064a63          	bltz	a2,8000a20c <__printf+0x524>
    80009ddc:	00a00713          	li	a4,10
    80009de0:	02e677bb          	remuw	a5,a2,a4
    80009de4:	00003d97          	auipc	s11,0x3
    80009de8:	d54d8d93          	addi	s11,s11,-684 # 8000cb38 <digits>
    80009dec:	00900593          	li	a1,9
    80009df0:	0006051b          	sext.w	a0,a2
    80009df4:	00000c93          	li	s9,0
    80009df8:	02079793          	slli	a5,a5,0x20
    80009dfc:	0207d793          	srli	a5,a5,0x20
    80009e00:	00fd87b3          	add	a5,s11,a5
    80009e04:	0007c783          	lbu	a5,0(a5)
    80009e08:	02e656bb          	divuw	a3,a2,a4
    80009e0c:	f8f40023          	sb	a5,-128(s0)
    80009e10:	14c5d863          	bge	a1,a2,80009f60 <__printf+0x278>
    80009e14:	06300593          	li	a1,99
    80009e18:	00100c93          	li	s9,1
    80009e1c:	02e6f7bb          	remuw	a5,a3,a4
    80009e20:	02079793          	slli	a5,a5,0x20
    80009e24:	0207d793          	srli	a5,a5,0x20
    80009e28:	00fd87b3          	add	a5,s11,a5
    80009e2c:	0007c783          	lbu	a5,0(a5)
    80009e30:	02e6d73b          	divuw	a4,a3,a4
    80009e34:	f8f400a3          	sb	a5,-127(s0)
    80009e38:	12a5f463          	bgeu	a1,a0,80009f60 <__printf+0x278>
    80009e3c:	00a00693          	li	a3,10
    80009e40:	00900593          	li	a1,9
    80009e44:	02d777bb          	remuw	a5,a4,a3
    80009e48:	02079793          	slli	a5,a5,0x20
    80009e4c:	0207d793          	srli	a5,a5,0x20
    80009e50:	00fd87b3          	add	a5,s11,a5
    80009e54:	0007c503          	lbu	a0,0(a5)
    80009e58:	02d757bb          	divuw	a5,a4,a3
    80009e5c:	f8a40123          	sb	a0,-126(s0)
    80009e60:	48e5f263          	bgeu	a1,a4,8000a2e4 <__printf+0x5fc>
    80009e64:	06300513          	li	a0,99
    80009e68:	02d7f5bb          	remuw	a1,a5,a3
    80009e6c:	02059593          	slli	a1,a1,0x20
    80009e70:	0205d593          	srli	a1,a1,0x20
    80009e74:	00bd85b3          	add	a1,s11,a1
    80009e78:	0005c583          	lbu	a1,0(a1)
    80009e7c:	02d7d7bb          	divuw	a5,a5,a3
    80009e80:	f8b401a3          	sb	a1,-125(s0)
    80009e84:	48e57263          	bgeu	a0,a4,8000a308 <__printf+0x620>
    80009e88:	3e700513          	li	a0,999
    80009e8c:	02d7f5bb          	remuw	a1,a5,a3
    80009e90:	02059593          	slli	a1,a1,0x20
    80009e94:	0205d593          	srli	a1,a1,0x20
    80009e98:	00bd85b3          	add	a1,s11,a1
    80009e9c:	0005c583          	lbu	a1,0(a1)
    80009ea0:	02d7d7bb          	divuw	a5,a5,a3
    80009ea4:	f8b40223          	sb	a1,-124(s0)
    80009ea8:	46e57663          	bgeu	a0,a4,8000a314 <__printf+0x62c>
    80009eac:	02d7f5bb          	remuw	a1,a5,a3
    80009eb0:	02059593          	slli	a1,a1,0x20
    80009eb4:	0205d593          	srli	a1,a1,0x20
    80009eb8:	00bd85b3          	add	a1,s11,a1
    80009ebc:	0005c583          	lbu	a1,0(a1)
    80009ec0:	02d7d7bb          	divuw	a5,a5,a3
    80009ec4:	f8b402a3          	sb	a1,-123(s0)
    80009ec8:	46ea7863          	bgeu	s4,a4,8000a338 <__printf+0x650>
    80009ecc:	02d7f5bb          	remuw	a1,a5,a3
    80009ed0:	02059593          	slli	a1,a1,0x20
    80009ed4:	0205d593          	srli	a1,a1,0x20
    80009ed8:	00bd85b3          	add	a1,s11,a1
    80009edc:	0005c583          	lbu	a1,0(a1)
    80009ee0:	02d7d7bb          	divuw	a5,a5,a3
    80009ee4:	f8b40323          	sb	a1,-122(s0)
    80009ee8:	3eeaf863          	bgeu	s5,a4,8000a2d8 <__printf+0x5f0>
    80009eec:	02d7f5bb          	remuw	a1,a5,a3
    80009ef0:	02059593          	slli	a1,a1,0x20
    80009ef4:	0205d593          	srli	a1,a1,0x20
    80009ef8:	00bd85b3          	add	a1,s11,a1
    80009efc:	0005c583          	lbu	a1,0(a1)
    80009f00:	02d7d7bb          	divuw	a5,a5,a3
    80009f04:	f8b403a3          	sb	a1,-121(s0)
    80009f08:	42eb7e63          	bgeu	s6,a4,8000a344 <__printf+0x65c>
    80009f0c:	02d7f5bb          	remuw	a1,a5,a3
    80009f10:	02059593          	slli	a1,a1,0x20
    80009f14:	0205d593          	srli	a1,a1,0x20
    80009f18:	00bd85b3          	add	a1,s11,a1
    80009f1c:	0005c583          	lbu	a1,0(a1)
    80009f20:	02d7d7bb          	divuw	a5,a5,a3
    80009f24:	f8b40423          	sb	a1,-120(s0)
    80009f28:	42ebfc63          	bgeu	s7,a4,8000a360 <__printf+0x678>
    80009f2c:	02079793          	slli	a5,a5,0x20
    80009f30:	0207d793          	srli	a5,a5,0x20
    80009f34:	00fd8db3          	add	s11,s11,a5
    80009f38:	000dc703          	lbu	a4,0(s11)
    80009f3c:	00a00793          	li	a5,10
    80009f40:	00900c93          	li	s9,9
    80009f44:	f8e404a3          	sb	a4,-119(s0)
    80009f48:	00065c63          	bgez	a2,80009f60 <__printf+0x278>
    80009f4c:	f9040713          	addi	a4,s0,-112
    80009f50:	00f70733          	add	a4,a4,a5
    80009f54:	02d00693          	li	a3,45
    80009f58:	fed70823          	sb	a3,-16(a4)
    80009f5c:	00078c93          	mv	s9,a5
    80009f60:	f8040793          	addi	a5,s0,-128
    80009f64:	01978cb3          	add	s9,a5,s9
    80009f68:	f7f40d13          	addi	s10,s0,-129
    80009f6c:	000cc503          	lbu	a0,0(s9)
    80009f70:	fffc8c93          	addi	s9,s9,-1
    80009f74:	00000097          	auipc	ra,0x0
    80009f78:	b90080e7          	jalr	-1136(ra) # 80009b04 <consputc>
    80009f7c:	ffac98e3          	bne	s9,s10,80009f6c <__printf+0x284>
    80009f80:	00094503          	lbu	a0,0(s2)
    80009f84:	e00514e3          	bnez	a0,80009d8c <__printf+0xa4>
    80009f88:	1a0c1663          	bnez	s8,8000a134 <__printf+0x44c>
    80009f8c:	08813083          	ld	ra,136(sp)
    80009f90:	08013403          	ld	s0,128(sp)
    80009f94:	07813483          	ld	s1,120(sp)
    80009f98:	07013903          	ld	s2,112(sp)
    80009f9c:	06813983          	ld	s3,104(sp)
    80009fa0:	06013a03          	ld	s4,96(sp)
    80009fa4:	05813a83          	ld	s5,88(sp)
    80009fa8:	05013b03          	ld	s6,80(sp)
    80009fac:	04813b83          	ld	s7,72(sp)
    80009fb0:	04013c03          	ld	s8,64(sp)
    80009fb4:	03813c83          	ld	s9,56(sp)
    80009fb8:	03013d03          	ld	s10,48(sp)
    80009fbc:	02813d83          	ld	s11,40(sp)
    80009fc0:	0d010113          	addi	sp,sp,208
    80009fc4:	00008067          	ret
    80009fc8:	07300713          	li	a4,115
    80009fcc:	1ce78a63          	beq	a5,a4,8000a1a0 <__printf+0x4b8>
    80009fd0:	07800713          	li	a4,120
    80009fd4:	1ee79e63          	bne	a5,a4,8000a1d0 <__printf+0x4e8>
    80009fd8:	f7843783          	ld	a5,-136(s0)
    80009fdc:	0007a703          	lw	a4,0(a5)
    80009fe0:	00878793          	addi	a5,a5,8
    80009fe4:	f6f43c23          	sd	a5,-136(s0)
    80009fe8:	28074263          	bltz	a4,8000a26c <__printf+0x584>
    80009fec:	00003d97          	auipc	s11,0x3
    80009ff0:	b4cd8d93          	addi	s11,s11,-1204 # 8000cb38 <digits>
    80009ff4:	00f77793          	andi	a5,a4,15
    80009ff8:	00fd87b3          	add	a5,s11,a5
    80009ffc:	0007c683          	lbu	a3,0(a5)
    8000a000:	00f00613          	li	a2,15
    8000a004:	0007079b          	sext.w	a5,a4
    8000a008:	f8d40023          	sb	a3,-128(s0)
    8000a00c:	0047559b          	srliw	a1,a4,0x4
    8000a010:	0047569b          	srliw	a3,a4,0x4
    8000a014:	00000c93          	li	s9,0
    8000a018:	0ee65063          	bge	a2,a4,8000a0f8 <__printf+0x410>
    8000a01c:	00f6f693          	andi	a3,a3,15
    8000a020:	00dd86b3          	add	a3,s11,a3
    8000a024:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    8000a028:	0087d79b          	srliw	a5,a5,0x8
    8000a02c:	00100c93          	li	s9,1
    8000a030:	f8d400a3          	sb	a3,-127(s0)
    8000a034:	0cb67263          	bgeu	a2,a1,8000a0f8 <__printf+0x410>
    8000a038:	00f7f693          	andi	a3,a5,15
    8000a03c:	00dd86b3          	add	a3,s11,a3
    8000a040:	0006c583          	lbu	a1,0(a3)
    8000a044:	00f00613          	li	a2,15
    8000a048:	0047d69b          	srliw	a3,a5,0x4
    8000a04c:	f8b40123          	sb	a1,-126(s0)
    8000a050:	0047d593          	srli	a1,a5,0x4
    8000a054:	28f67e63          	bgeu	a2,a5,8000a2f0 <__printf+0x608>
    8000a058:	00f6f693          	andi	a3,a3,15
    8000a05c:	00dd86b3          	add	a3,s11,a3
    8000a060:	0006c503          	lbu	a0,0(a3)
    8000a064:	0087d813          	srli	a6,a5,0x8
    8000a068:	0087d69b          	srliw	a3,a5,0x8
    8000a06c:	f8a401a3          	sb	a0,-125(s0)
    8000a070:	28b67663          	bgeu	a2,a1,8000a2fc <__printf+0x614>
    8000a074:	00f6f693          	andi	a3,a3,15
    8000a078:	00dd86b3          	add	a3,s11,a3
    8000a07c:	0006c583          	lbu	a1,0(a3)
    8000a080:	00c7d513          	srli	a0,a5,0xc
    8000a084:	00c7d69b          	srliw	a3,a5,0xc
    8000a088:	f8b40223          	sb	a1,-124(s0)
    8000a08c:	29067a63          	bgeu	a2,a6,8000a320 <__printf+0x638>
    8000a090:	00f6f693          	andi	a3,a3,15
    8000a094:	00dd86b3          	add	a3,s11,a3
    8000a098:	0006c583          	lbu	a1,0(a3)
    8000a09c:	0107d813          	srli	a6,a5,0x10
    8000a0a0:	0107d69b          	srliw	a3,a5,0x10
    8000a0a4:	f8b402a3          	sb	a1,-123(s0)
    8000a0a8:	28a67263          	bgeu	a2,a0,8000a32c <__printf+0x644>
    8000a0ac:	00f6f693          	andi	a3,a3,15
    8000a0b0:	00dd86b3          	add	a3,s11,a3
    8000a0b4:	0006c683          	lbu	a3,0(a3)
    8000a0b8:	0147d79b          	srliw	a5,a5,0x14
    8000a0bc:	f8d40323          	sb	a3,-122(s0)
    8000a0c0:	21067663          	bgeu	a2,a6,8000a2cc <__printf+0x5e4>
    8000a0c4:	02079793          	slli	a5,a5,0x20
    8000a0c8:	0207d793          	srli	a5,a5,0x20
    8000a0cc:	00fd8db3          	add	s11,s11,a5
    8000a0d0:	000dc683          	lbu	a3,0(s11)
    8000a0d4:	00800793          	li	a5,8
    8000a0d8:	00700c93          	li	s9,7
    8000a0dc:	f8d403a3          	sb	a3,-121(s0)
    8000a0e0:	00075c63          	bgez	a4,8000a0f8 <__printf+0x410>
    8000a0e4:	f9040713          	addi	a4,s0,-112
    8000a0e8:	00f70733          	add	a4,a4,a5
    8000a0ec:	02d00693          	li	a3,45
    8000a0f0:	fed70823          	sb	a3,-16(a4)
    8000a0f4:	00078c93          	mv	s9,a5
    8000a0f8:	f8040793          	addi	a5,s0,-128
    8000a0fc:	01978cb3          	add	s9,a5,s9
    8000a100:	f7f40d13          	addi	s10,s0,-129
    8000a104:	000cc503          	lbu	a0,0(s9)
    8000a108:	fffc8c93          	addi	s9,s9,-1
    8000a10c:	00000097          	auipc	ra,0x0
    8000a110:	9f8080e7          	jalr	-1544(ra) # 80009b04 <consputc>
    8000a114:	ff9d18e3          	bne	s10,s9,8000a104 <__printf+0x41c>
    8000a118:	0100006f          	j	8000a128 <__printf+0x440>
    8000a11c:	00000097          	auipc	ra,0x0
    8000a120:	9e8080e7          	jalr	-1560(ra) # 80009b04 <consputc>
    8000a124:	000c8493          	mv	s1,s9
    8000a128:	00094503          	lbu	a0,0(s2)
    8000a12c:	c60510e3          	bnez	a0,80009d8c <__printf+0xa4>
    8000a130:	e40c0ee3          	beqz	s8,80009f8c <__printf+0x2a4>
    8000a134:	00006517          	auipc	a0,0x6
    8000a138:	39c50513          	addi	a0,a0,924 # 800104d0 <pr>
    8000a13c:	00001097          	auipc	ra,0x1
    8000a140:	94c080e7          	jalr	-1716(ra) # 8000aa88 <release>
    8000a144:	e49ff06f          	j	80009f8c <__printf+0x2a4>
    8000a148:	f7843783          	ld	a5,-136(s0)
    8000a14c:	03000513          	li	a0,48
    8000a150:	01000d13          	li	s10,16
    8000a154:	00878713          	addi	a4,a5,8
    8000a158:	0007bc83          	ld	s9,0(a5)
    8000a15c:	f6e43c23          	sd	a4,-136(s0)
    8000a160:	00000097          	auipc	ra,0x0
    8000a164:	9a4080e7          	jalr	-1628(ra) # 80009b04 <consputc>
    8000a168:	07800513          	li	a0,120
    8000a16c:	00000097          	auipc	ra,0x0
    8000a170:	998080e7          	jalr	-1640(ra) # 80009b04 <consputc>
    8000a174:	00003d97          	auipc	s11,0x3
    8000a178:	9c4d8d93          	addi	s11,s11,-1596 # 8000cb38 <digits>
    8000a17c:	03ccd793          	srli	a5,s9,0x3c
    8000a180:	00fd87b3          	add	a5,s11,a5
    8000a184:	0007c503          	lbu	a0,0(a5)
    8000a188:	fffd0d1b          	addiw	s10,s10,-1
    8000a18c:	004c9c93          	slli	s9,s9,0x4
    8000a190:	00000097          	auipc	ra,0x0
    8000a194:	974080e7          	jalr	-1676(ra) # 80009b04 <consputc>
    8000a198:	fe0d12e3          	bnez	s10,8000a17c <__printf+0x494>
    8000a19c:	f8dff06f          	j	8000a128 <__printf+0x440>
    8000a1a0:	f7843783          	ld	a5,-136(s0)
    8000a1a4:	0007bc83          	ld	s9,0(a5)
    8000a1a8:	00878793          	addi	a5,a5,8
    8000a1ac:	f6f43c23          	sd	a5,-136(s0)
    8000a1b0:	000c9a63          	bnez	s9,8000a1c4 <__printf+0x4dc>
    8000a1b4:	1080006f          	j	8000a2bc <__printf+0x5d4>
    8000a1b8:	001c8c93          	addi	s9,s9,1
    8000a1bc:	00000097          	auipc	ra,0x0
    8000a1c0:	948080e7          	jalr	-1720(ra) # 80009b04 <consputc>
    8000a1c4:	000cc503          	lbu	a0,0(s9)
    8000a1c8:	fe0518e3          	bnez	a0,8000a1b8 <__printf+0x4d0>
    8000a1cc:	f5dff06f          	j	8000a128 <__printf+0x440>
    8000a1d0:	02500513          	li	a0,37
    8000a1d4:	00000097          	auipc	ra,0x0
    8000a1d8:	930080e7          	jalr	-1744(ra) # 80009b04 <consputc>
    8000a1dc:	000c8513          	mv	a0,s9
    8000a1e0:	00000097          	auipc	ra,0x0
    8000a1e4:	924080e7          	jalr	-1756(ra) # 80009b04 <consputc>
    8000a1e8:	f41ff06f          	j	8000a128 <__printf+0x440>
    8000a1ec:	02500513          	li	a0,37
    8000a1f0:	00000097          	auipc	ra,0x0
    8000a1f4:	914080e7          	jalr	-1772(ra) # 80009b04 <consputc>
    8000a1f8:	f31ff06f          	j	8000a128 <__printf+0x440>
    8000a1fc:	00030513          	mv	a0,t1
    8000a200:	00000097          	auipc	ra,0x0
    8000a204:	7bc080e7          	jalr	1980(ra) # 8000a9bc <acquire>
    8000a208:	b4dff06f          	j	80009d54 <__printf+0x6c>
    8000a20c:	40c0053b          	negw	a0,a2
    8000a210:	00a00713          	li	a4,10
    8000a214:	02e576bb          	remuw	a3,a0,a4
    8000a218:	00003d97          	auipc	s11,0x3
    8000a21c:	920d8d93          	addi	s11,s11,-1760 # 8000cb38 <digits>
    8000a220:	ff700593          	li	a1,-9
    8000a224:	02069693          	slli	a3,a3,0x20
    8000a228:	0206d693          	srli	a3,a3,0x20
    8000a22c:	00dd86b3          	add	a3,s11,a3
    8000a230:	0006c683          	lbu	a3,0(a3)
    8000a234:	02e557bb          	divuw	a5,a0,a4
    8000a238:	f8d40023          	sb	a3,-128(s0)
    8000a23c:	10b65e63          	bge	a2,a1,8000a358 <__printf+0x670>
    8000a240:	06300593          	li	a1,99
    8000a244:	02e7f6bb          	remuw	a3,a5,a4
    8000a248:	02069693          	slli	a3,a3,0x20
    8000a24c:	0206d693          	srli	a3,a3,0x20
    8000a250:	00dd86b3          	add	a3,s11,a3
    8000a254:	0006c683          	lbu	a3,0(a3)
    8000a258:	02e7d73b          	divuw	a4,a5,a4
    8000a25c:	00200793          	li	a5,2
    8000a260:	f8d400a3          	sb	a3,-127(s0)
    8000a264:	bca5ece3          	bltu	a1,a0,80009e3c <__printf+0x154>
    8000a268:	ce5ff06f          	j	80009f4c <__printf+0x264>
    8000a26c:	40e007bb          	negw	a5,a4
    8000a270:	00003d97          	auipc	s11,0x3
    8000a274:	8c8d8d93          	addi	s11,s11,-1848 # 8000cb38 <digits>
    8000a278:	00f7f693          	andi	a3,a5,15
    8000a27c:	00dd86b3          	add	a3,s11,a3
    8000a280:	0006c583          	lbu	a1,0(a3)
    8000a284:	ff100613          	li	a2,-15
    8000a288:	0047d69b          	srliw	a3,a5,0x4
    8000a28c:	f8b40023          	sb	a1,-128(s0)
    8000a290:	0047d59b          	srliw	a1,a5,0x4
    8000a294:	0ac75e63          	bge	a4,a2,8000a350 <__printf+0x668>
    8000a298:	00f6f693          	andi	a3,a3,15
    8000a29c:	00dd86b3          	add	a3,s11,a3
    8000a2a0:	0006c603          	lbu	a2,0(a3)
    8000a2a4:	00f00693          	li	a3,15
    8000a2a8:	0087d79b          	srliw	a5,a5,0x8
    8000a2ac:	f8c400a3          	sb	a2,-127(s0)
    8000a2b0:	d8b6e4e3          	bltu	a3,a1,8000a038 <__printf+0x350>
    8000a2b4:	00200793          	li	a5,2
    8000a2b8:	e2dff06f          	j	8000a0e4 <__printf+0x3fc>
    8000a2bc:	00003c97          	auipc	s9,0x3
    8000a2c0:	85cc8c93          	addi	s9,s9,-1956 # 8000cb18 <CONSOLE_STATUS+0xb08>
    8000a2c4:	02800513          	li	a0,40
    8000a2c8:	ef1ff06f          	j	8000a1b8 <__printf+0x4d0>
    8000a2cc:	00700793          	li	a5,7
    8000a2d0:	00600c93          	li	s9,6
    8000a2d4:	e0dff06f          	j	8000a0e0 <__printf+0x3f8>
    8000a2d8:	00700793          	li	a5,7
    8000a2dc:	00600c93          	li	s9,6
    8000a2e0:	c69ff06f          	j	80009f48 <__printf+0x260>
    8000a2e4:	00300793          	li	a5,3
    8000a2e8:	00200c93          	li	s9,2
    8000a2ec:	c5dff06f          	j	80009f48 <__printf+0x260>
    8000a2f0:	00300793          	li	a5,3
    8000a2f4:	00200c93          	li	s9,2
    8000a2f8:	de9ff06f          	j	8000a0e0 <__printf+0x3f8>
    8000a2fc:	00400793          	li	a5,4
    8000a300:	00300c93          	li	s9,3
    8000a304:	dddff06f          	j	8000a0e0 <__printf+0x3f8>
    8000a308:	00400793          	li	a5,4
    8000a30c:	00300c93          	li	s9,3
    8000a310:	c39ff06f          	j	80009f48 <__printf+0x260>
    8000a314:	00500793          	li	a5,5
    8000a318:	00400c93          	li	s9,4
    8000a31c:	c2dff06f          	j	80009f48 <__printf+0x260>
    8000a320:	00500793          	li	a5,5
    8000a324:	00400c93          	li	s9,4
    8000a328:	db9ff06f          	j	8000a0e0 <__printf+0x3f8>
    8000a32c:	00600793          	li	a5,6
    8000a330:	00500c93          	li	s9,5
    8000a334:	dadff06f          	j	8000a0e0 <__printf+0x3f8>
    8000a338:	00600793          	li	a5,6
    8000a33c:	00500c93          	li	s9,5
    8000a340:	c09ff06f          	j	80009f48 <__printf+0x260>
    8000a344:	00800793          	li	a5,8
    8000a348:	00700c93          	li	s9,7
    8000a34c:	bfdff06f          	j	80009f48 <__printf+0x260>
    8000a350:	00100793          	li	a5,1
    8000a354:	d91ff06f          	j	8000a0e4 <__printf+0x3fc>
    8000a358:	00100793          	li	a5,1
    8000a35c:	bf1ff06f          	j	80009f4c <__printf+0x264>
    8000a360:	00900793          	li	a5,9
    8000a364:	00800c93          	li	s9,8
    8000a368:	be1ff06f          	j	80009f48 <__printf+0x260>
    8000a36c:	00002517          	auipc	a0,0x2
    8000a370:	7b450513          	addi	a0,a0,1972 # 8000cb20 <CONSOLE_STATUS+0xb10>
    8000a374:	00000097          	auipc	ra,0x0
    8000a378:	918080e7          	jalr	-1768(ra) # 80009c8c <panic>

000000008000a37c <printfinit>:
    8000a37c:	fe010113          	addi	sp,sp,-32
    8000a380:	00813823          	sd	s0,16(sp)
    8000a384:	00913423          	sd	s1,8(sp)
    8000a388:	00113c23          	sd	ra,24(sp)
    8000a38c:	02010413          	addi	s0,sp,32
    8000a390:	00006497          	auipc	s1,0x6
    8000a394:	14048493          	addi	s1,s1,320 # 800104d0 <pr>
    8000a398:	00048513          	mv	a0,s1
    8000a39c:	00002597          	auipc	a1,0x2
    8000a3a0:	79458593          	addi	a1,a1,1940 # 8000cb30 <CONSOLE_STATUS+0xb20>
    8000a3a4:	00000097          	auipc	ra,0x0
    8000a3a8:	5f4080e7          	jalr	1524(ra) # 8000a998 <initlock>
    8000a3ac:	01813083          	ld	ra,24(sp)
    8000a3b0:	01013403          	ld	s0,16(sp)
    8000a3b4:	0004ac23          	sw	zero,24(s1)
    8000a3b8:	00813483          	ld	s1,8(sp)
    8000a3bc:	02010113          	addi	sp,sp,32
    8000a3c0:	00008067          	ret

000000008000a3c4 <uartinit>:
    8000a3c4:	ff010113          	addi	sp,sp,-16
    8000a3c8:	00813423          	sd	s0,8(sp)
    8000a3cc:	01010413          	addi	s0,sp,16
    8000a3d0:	100007b7          	lui	a5,0x10000
    8000a3d4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    8000a3d8:	f8000713          	li	a4,-128
    8000a3dc:	00e781a3          	sb	a4,3(a5)
    8000a3e0:	00300713          	li	a4,3
    8000a3e4:	00e78023          	sb	a4,0(a5)
    8000a3e8:	000780a3          	sb	zero,1(a5)
    8000a3ec:	00e781a3          	sb	a4,3(a5)
    8000a3f0:	00700693          	li	a3,7
    8000a3f4:	00d78123          	sb	a3,2(a5)
    8000a3f8:	00e780a3          	sb	a4,1(a5)
    8000a3fc:	00813403          	ld	s0,8(sp)
    8000a400:	01010113          	addi	sp,sp,16
    8000a404:	00008067          	ret

000000008000a408 <uartputc>:
    8000a408:	00005797          	auipc	a5,0x5
    8000a40c:	de07a783          	lw	a5,-544(a5) # 8000f1e8 <panicked>
    8000a410:	00078463          	beqz	a5,8000a418 <uartputc+0x10>
    8000a414:	0000006f          	j	8000a414 <uartputc+0xc>
    8000a418:	fd010113          	addi	sp,sp,-48
    8000a41c:	02813023          	sd	s0,32(sp)
    8000a420:	00913c23          	sd	s1,24(sp)
    8000a424:	01213823          	sd	s2,16(sp)
    8000a428:	01313423          	sd	s3,8(sp)
    8000a42c:	02113423          	sd	ra,40(sp)
    8000a430:	03010413          	addi	s0,sp,48
    8000a434:	00005917          	auipc	s2,0x5
    8000a438:	dbc90913          	addi	s2,s2,-580 # 8000f1f0 <uart_tx_r>
    8000a43c:	00093783          	ld	a5,0(s2)
    8000a440:	00005497          	auipc	s1,0x5
    8000a444:	db848493          	addi	s1,s1,-584 # 8000f1f8 <uart_tx_w>
    8000a448:	0004b703          	ld	a4,0(s1)
    8000a44c:	02078693          	addi	a3,a5,32
    8000a450:	00050993          	mv	s3,a0
    8000a454:	02e69c63          	bne	a3,a4,8000a48c <uartputc+0x84>
    8000a458:	00001097          	auipc	ra,0x1
    8000a45c:	834080e7          	jalr	-1996(ra) # 8000ac8c <push_on>
    8000a460:	00093783          	ld	a5,0(s2)
    8000a464:	0004b703          	ld	a4,0(s1)
    8000a468:	02078793          	addi	a5,a5,32
    8000a46c:	00e79463          	bne	a5,a4,8000a474 <uartputc+0x6c>
    8000a470:	0000006f          	j	8000a470 <uartputc+0x68>
    8000a474:	00001097          	auipc	ra,0x1
    8000a478:	88c080e7          	jalr	-1908(ra) # 8000ad00 <pop_on>
    8000a47c:	00093783          	ld	a5,0(s2)
    8000a480:	0004b703          	ld	a4,0(s1)
    8000a484:	02078693          	addi	a3,a5,32
    8000a488:	fce688e3          	beq	a3,a4,8000a458 <uartputc+0x50>
    8000a48c:	01f77693          	andi	a3,a4,31
    8000a490:	00006597          	auipc	a1,0x6
    8000a494:	06058593          	addi	a1,a1,96 # 800104f0 <uart_tx_buf>
    8000a498:	00d586b3          	add	a3,a1,a3
    8000a49c:	00170713          	addi	a4,a4,1
    8000a4a0:	01368023          	sb	s3,0(a3)
    8000a4a4:	00e4b023          	sd	a4,0(s1)
    8000a4a8:	10000637          	lui	a2,0x10000
    8000a4ac:	02f71063          	bne	a4,a5,8000a4cc <uartputc+0xc4>
    8000a4b0:	0340006f          	j	8000a4e4 <uartputc+0xdc>
    8000a4b4:	00074703          	lbu	a4,0(a4)
    8000a4b8:	00f93023          	sd	a5,0(s2)
    8000a4bc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    8000a4c0:	00093783          	ld	a5,0(s2)
    8000a4c4:	0004b703          	ld	a4,0(s1)
    8000a4c8:	00f70e63          	beq	a4,a5,8000a4e4 <uartputc+0xdc>
    8000a4cc:	00564683          	lbu	a3,5(a2)
    8000a4d0:	01f7f713          	andi	a4,a5,31
    8000a4d4:	00e58733          	add	a4,a1,a4
    8000a4d8:	0206f693          	andi	a3,a3,32
    8000a4dc:	00178793          	addi	a5,a5,1
    8000a4e0:	fc069ae3          	bnez	a3,8000a4b4 <uartputc+0xac>
    8000a4e4:	02813083          	ld	ra,40(sp)
    8000a4e8:	02013403          	ld	s0,32(sp)
    8000a4ec:	01813483          	ld	s1,24(sp)
    8000a4f0:	01013903          	ld	s2,16(sp)
    8000a4f4:	00813983          	ld	s3,8(sp)
    8000a4f8:	03010113          	addi	sp,sp,48
    8000a4fc:	00008067          	ret

000000008000a500 <uartputc_sync>:
    8000a500:	ff010113          	addi	sp,sp,-16
    8000a504:	00813423          	sd	s0,8(sp)
    8000a508:	01010413          	addi	s0,sp,16
    8000a50c:	00005717          	auipc	a4,0x5
    8000a510:	cdc72703          	lw	a4,-804(a4) # 8000f1e8 <panicked>
    8000a514:	02071663          	bnez	a4,8000a540 <uartputc_sync+0x40>
    8000a518:	00050793          	mv	a5,a0
    8000a51c:	100006b7          	lui	a3,0x10000
    8000a520:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    8000a524:	02077713          	andi	a4,a4,32
    8000a528:	fe070ce3          	beqz	a4,8000a520 <uartputc_sync+0x20>
    8000a52c:	0ff7f793          	andi	a5,a5,255
    8000a530:	00f68023          	sb	a5,0(a3)
    8000a534:	00813403          	ld	s0,8(sp)
    8000a538:	01010113          	addi	sp,sp,16
    8000a53c:	00008067          	ret
    8000a540:	0000006f          	j	8000a540 <uartputc_sync+0x40>

000000008000a544 <uartstart>:
    8000a544:	ff010113          	addi	sp,sp,-16
    8000a548:	00813423          	sd	s0,8(sp)
    8000a54c:	01010413          	addi	s0,sp,16
    8000a550:	00005617          	auipc	a2,0x5
    8000a554:	ca060613          	addi	a2,a2,-864 # 8000f1f0 <uart_tx_r>
    8000a558:	00005517          	auipc	a0,0x5
    8000a55c:	ca050513          	addi	a0,a0,-864 # 8000f1f8 <uart_tx_w>
    8000a560:	00063783          	ld	a5,0(a2)
    8000a564:	00053703          	ld	a4,0(a0)
    8000a568:	04f70263          	beq	a4,a5,8000a5ac <uartstart+0x68>
    8000a56c:	100005b7          	lui	a1,0x10000
    8000a570:	00006817          	auipc	a6,0x6
    8000a574:	f8080813          	addi	a6,a6,-128 # 800104f0 <uart_tx_buf>
    8000a578:	01c0006f          	j	8000a594 <uartstart+0x50>
    8000a57c:	0006c703          	lbu	a4,0(a3)
    8000a580:	00f63023          	sd	a5,0(a2)
    8000a584:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000a588:	00063783          	ld	a5,0(a2)
    8000a58c:	00053703          	ld	a4,0(a0)
    8000a590:	00f70e63          	beq	a4,a5,8000a5ac <uartstart+0x68>
    8000a594:	01f7f713          	andi	a4,a5,31
    8000a598:	00e806b3          	add	a3,a6,a4
    8000a59c:	0055c703          	lbu	a4,5(a1)
    8000a5a0:	00178793          	addi	a5,a5,1
    8000a5a4:	02077713          	andi	a4,a4,32
    8000a5a8:	fc071ae3          	bnez	a4,8000a57c <uartstart+0x38>
    8000a5ac:	00813403          	ld	s0,8(sp)
    8000a5b0:	01010113          	addi	sp,sp,16
    8000a5b4:	00008067          	ret

000000008000a5b8 <uartgetc>:
    8000a5b8:	ff010113          	addi	sp,sp,-16
    8000a5bc:	00813423          	sd	s0,8(sp)
    8000a5c0:	01010413          	addi	s0,sp,16
    8000a5c4:	10000737          	lui	a4,0x10000
    8000a5c8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000a5cc:	0017f793          	andi	a5,a5,1
    8000a5d0:	00078c63          	beqz	a5,8000a5e8 <uartgetc+0x30>
    8000a5d4:	00074503          	lbu	a0,0(a4)
    8000a5d8:	0ff57513          	andi	a0,a0,255
    8000a5dc:	00813403          	ld	s0,8(sp)
    8000a5e0:	01010113          	addi	sp,sp,16
    8000a5e4:	00008067          	ret
    8000a5e8:	fff00513          	li	a0,-1
    8000a5ec:	ff1ff06f          	j	8000a5dc <uartgetc+0x24>

000000008000a5f0 <uartintr>:
    8000a5f0:	100007b7          	lui	a5,0x10000
    8000a5f4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    8000a5f8:	0017f793          	andi	a5,a5,1
    8000a5fc:	0a078463          	beqz	a5,8000a6a4 <uartintr+0xb4>
    8000a600:	fe010113          	addi	sp,sp,-32
    8000a604:	00813823          	sd	s0,16(sp)
    8000a608:	00913423          	sd	s1,8(sp)
    8000a60c:	00113c23          	sd	ra,24(sp)
    8000a610:	02010413          	addi	s0,sp,32
    8000a614:	100004b7          	lui	s1,0x10000
    8000a618:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000a61c:	0ff57513          	andi	a0,a0,255
    8000a620:	fffff097          	auipc	ra,0xfffff
    8000a624:	534080e7          	jalr	1332(ra) # 80009b54 <consoleintr>
    8000a628:	0054c783          	lbu	a5,5(s1)
    8000a62c:	0017f793          	andi	a5,a5,1
    8000a630:	fe0794e3          	bnez	a5,8000a618 <uartintr+0x28>
    8000a634:	00005617          	auipc	a2,0x5
    8000a638:	bbc60613          	addi	a2,a2,-1092 # 8000f1f0 <uart_tx_r>
    8000a63c:	00005517          	auipc	a0,0x5
    8000a640:	bbc50513          	addi	a0,a0,-1092 # 8000f1f8 <uart_tx_w>
    8000a644:	00063783          	ld	a5,0(a2)
    8000a648:	00053703          	ld	a4,0(a0)
    8000a64c:	04f70263          	beq	a4,a5,8000a690 <uartintr+0xa0>
    8000a650:	100005b7          	lui	a1,0x10000
    8000a654:	00006817          	auipc	a6,0x6
    8000a658:	e9c80813          	addi	a6,a6,-356 # 800104f0 <uart_tx_buf>
    8000a65c:	01c0006f          	j	8000a678 <uartintr+0x88>
    8000a660:	0006c703          	lbu	a4,0(a3)
    8000a664:	00f63023          	sd	a5,0(a2)
    8000a668:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000a66c:	00063783          	ld	a5,0(a2)
    8000a670:	00053703          	ld	a4,0(a0)
    8000a674:	00f70e63          	beq	a4,a5,8000a690 <uartintr+0xa0>
    8000a678:	01f7f713          	andi	a4,a5,31
    8000a67c:	00e806b3          	add	a3,a6,a4
    8000a680:	0055c703          	lbu	a4,5(a1)
    8000a684:	00178793          	addi	a5,a5,1
    8000a688:	02077713          	andi	a4,a4,32
    8000a68c:	fc071ae3          	bnez	a4,8000a660 <uartintr+0x70>
    8000a690:	01813083          	ld	ra,24(sp)
    8000a694:	01013403          	ld	s0,16(sp)
    8000a698:	00813483          	ld	s1,8(sp)
    8000a69c:	02010113          	addi	sp,sp,32
    8000a6a0:	00008067          	ret
    8000a6a4:	00005617          	auipc	a2,0x5
    8000a6a8:	b4c60613          	addi	a2,a2,-1204 # 8000f1f0 <uart_tx_r>
    8000a6ac:	00005517          	auipc	a0,0x5
    8000a6b0:	b4c50513          	addi	a0,a0,-1204 # 8000f1f8 <uart_tx_w>
    8000a6b4:	00063783          	ld	a5,0(a2)
    8000a6b8:	00053703          	ld	a4,0(a0)
    8000a6bc:	04f70263          	beq	a4,a5,8000a700 <uartintr+0x110>
    8000a6c0:	100005b7          	lui	a1,0x10000
    8000a6c4:	00006817          	auipc	a6,0x6
    8000a6c8:	e2c80813          	addi	a6,a6,-468 # 800104f0 <uart_tx_buf>
    8000a6cc:	01c0006f          	j	8000a6e8 <uartintr+0xf8>
    8000a6d0:	0006c703          	lbu	a4,0(a3)
    8000a6d4:	00f63023          	sd	a5,0(a2)
    8000a6d8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000a6dc:	00063783          	ld	a5,0(a2)
    8000a6e0:	00053703          	ld	a4,0(a0)
    8000a6e4:	02f70063          	beq	a4,a5,8000a704 <uartintr+0x114>
    8000a6e8:	01f7f713          	andi	a4,a5,31
    8000a6ec:	00e806b3          	add	a3,a6,a4
    8000a6f0:	0055c703          	lbu	a4,5(a1)
    8000a6f4:	00178793          	addi	a5,a5,1
    8000a6f8:	02077713          	andi	a4,a4,32
    8000a6fc:	fc071ae3          	bnez	a4,8000a6d0 <uartintr+0xe0>
    8000a700:	00008067          	ret
    8000a704:	00008067          	ret

000000008000a708 <kinit>:
    8000a708:	fc010113          	addi	sp,sp,-64
    8000a70c:	02913423          	sd	s1,40(sp)
    8000a710:	fffff7b7          	lui	a5,0xfffff
    8000a714:	00007497          	auipc	s1,0x7
    8000a718:	dfb48493          	addi	s1,s1,-517 # 8001150f <end+0xfff>
    8000a71c:	02813823          	sd	s0,48(sp)
    8000a720:	01313c23          	sd	s3,24(sp)
    8000a724:	00f4f4b3          	and	s1,s1,a5
    8000a728:	02113c23          	sd	ra,56(sp)
    8000a72c:	03213023          	sd	s2,32(sp)
    8000a730:	01413823          	sd	s4,16(sp)
    8000a734:	01513423          	sd	s5,8(sp)
    8000a738:	04010413          	addi	s0,sp,64
    8000a73c:	000017b7          	lui	a5,0x1
    8000a740:	01100993          	li	s3,17
    8000a744:	00f487b3          	add	a5,s1,a5
    8000a748:	01b99993          	slli	s3,s3,0x1b
    8000a74c:	06f9e063          	bltu	s3,a5,8000a7ac <kinit+0xa4>
    8000a750:	00006a97          	auipc	s5,0x6
    8000a754:	dc0a8a93          	addi	s5,s5,-576 # 80010510 <end>
    8000a758:	0754ec63          	bltu	s1,s5,8000a7d0 <kinit+0xc8>
    8000a75c:	0734fa63          	bgeu	s1,s3,8000a7d0 <kinit+0xc8>
    8000a760:	00088a37          	lui	s4,0x88
    8000a764:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    8000a768:	00005917          	auipc	s2,0x5
    8000a76c:	a9890913          	addi	s2,s2,-1384 # 8000f200 <kmem>
    8000a770:	00ca1a13          	slli	s4,s4,0xc
    8000a774:	0140006f          	j	8000a788 <kinit+0x80>
    8000a778:	000017b7          	lui	a5,0x1
    8000a77c:	00f484b3          	add	s1,s1,a5
    8000a780:	0554e863          	bltu	s1,s5,8000a7d0 <kinit+0xc8>
    8000a784:	0534f663          	bgeu	s1,s3,8000a7d0 <kinit+0xc8>
    8000a788:	00001637          	lui	a2,0x1
    8000a78c:	00100593          	li	a1,1
    8000a790:	00048513          	mv	a0,s1
    8000a794:	00000097          	auipc	ra,0x0
    8000a798:	5e4080e7          	jalr	1508(ra) # 8000ad78 <__memset>
    8000a79c:	00093783          	ld	a5,0(s2)
    8000a7a0:	00f4b023          	sd	a5,0(s1)
    8000a7a4:	00993023          	sd	s1,0(s2)
    8000a7a8:	fd4498e3          	bne	s1,s4,8000a778 <kinit+0x70>
    8000a7ac:	03813083          	ld	ra,56(sp)
    8000a7b0:	03013403          	ld	s0,48(sp)
    8000a7b4:	02813483          	ld	s1,40(sp)
    8000a7b8:	02013903          	ld	s2,32(sp)
    8000a7bc:	01813983          	ld	s3,24(sp)
    8000a7c0:	01013a03          	ld	s4,16(sp)
    8000a7c4:	00813a83          	ld	s5,8(sp)
    8000a7c8:	04010113          	addi	sp,sp,64
    8000a7cc:	00008067          	ret
    8000a7d0:	00002517          	auipc	a0,0x2
    8000a7d4:	38050513          	addi	a0,a0,896 # 8000cb50 <digits+0x18>
    8000a7d8:	fffff097          	auipc	ra,0xfffff
    8000a7dc:	4b4080e7          	jalr	1204(ra) # 80009c8c <panic>

000000008000a7e0 <freerange>:
    8000a7e0:	fc010113          	addi	sp,sp,-64
    8000a7e4:	000017b7          	lui	a5,0x1
    8000a7e8:	02913423          	sd	s1,40(sp)
    8000a7ec:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    8000a7f0:	009504b3          	add	s1,a0,s1
    8000a7f4:	fffff537          	lui	a0,0xfffff
    8000a7f8:	02813823          	sd	s0,48(sp)
    8000a7fc:	02113c23          	sd	ra,56(sp)
    8000a800:	03213023          	sd	s2,32(sp)
    8000a804:	01313c23          	sd	s3,24(sp)
    8000a808:	01413823          	sd	s4,16(sp)
    8000a80c:	01513423          	sd	s5,8(sp)
    8000a810:	01613023          	sd	s6,0(sp)
    8000a814:	04010413          	addi	s0,sp,64
    8000a818:	00a4f4b3          	and	s1,s1,a0
    8000a81c:	00f487b3          	add	a5,s1,a5
    8000a820:	06f5e463          	bltu	a1,a5,8000a888 <freerange+0xa8>
    8000a824:	00006a97          	auipc	s5,0x6
    8000a828:	ceca8a93          	addi	s5,s5,-788 # 80010510 <end>
    8000a82c:	0954e263          	bltu	s1,s5,8000a8b0 <freerange+0xd0>
    8000a830:	01100993          	li	s3,17
    8000a834:	01b99993          	slli	s3,s3,0x1b
    8000a838:	0734fc63          	bgeu	s1,s3,8000a8b0 <freerange+0xd0>
    8000a83c:	00058a13          	mv	s4,a1
    8000a840:	00005917          	auipc	s2,0x5
    8000a844:	9c090913          	addi	s2,s2,-1600 # 8000f200 <kmem>
    8000a848:	00002b37          	lui	s6,0x2
    8000a84c:	0140006f          	j	8000a860 <freerange+0x80>
    8000a850:	000017b7          	lui	a5,0x1
    8000a854:	00f484b3          	add	s1,s1,a5
    8000a858:	0554ec63          	bltu	s1,s5,8000a8b0 <freerange+0xd0>
    8000a85c:	0534fa63          	bgeu	s1,s3,8000a8b0 <freerange+0xd0>
    8000a860:	00001637          	lui	a2,0x1
    8000a864:	00100593          	li	a1,1
    8000a868:	00048513          	mv	a0,s1
    8000a86c:	00000097          	auipc	ra,0x0
    8000a870:	50c080e7          	jalr	1292(ra) # 8000ad78 <__memset>
    8000a874:	00093703          	ld	a4,0(s2)
    8000a878:	016487b3          	add	a5,s1,s6
    8000a87c:	00e4b023          	sd	a4,0(s1)
    8000a880:	00993023          	sd	s1,0(s2)
    8000a884:	fcfa76e3          	bgeu	s4,a5,8000a850 <freerange+0x70>
    8000a888:	03813083          	ld	ra,56(sp)
    8000a88c:	03013403          	ld	s0,48(sp)
    8000a890:	02813483          	ld	s1,40(sp)
    8000a894:	02013903          	ld	s2,32(sp)
    8000a898:	01813983          	ld	s3,24(sp)
    8000a89c:	01013a03          	ld	s4,16(sp)
    8000a8a0:	00813a83          	ld	s5,8(sp)
    8000a8a4:	00013b03          	ld	s6,0(sp)
    8000a8a8:	04010113          	addi	sp,sp,64
    8000a8ac:	00008067          	ret
    8000a8b0:	00002517          	auipc	a0,0x2
    8000a8b4:	2a050513          	addi	a0,a0,672 # 8000cb50 <digits+0x18>
    8000a8b8:	fffff097          	auipc	ra,0xfffff
    8000a8bc:	3d4080e7          	jalr	980(ra) # 80009c8c <panic>

000000008000a8c0 <kfree>:
    8000a8c0:	fe010113          	addi	sp,sp,-32
    8000a8c4:	00813823          	sd	s0,16(sp)
    8000a8c8:	00113c23          	sd	ra,24(sp)
    8000a8cc:	00913423          	sd	s1,8(sp)
    8000a8d0:	02010413          	addi	s0,sp,32
    8000a8d4:	03451793          	slli	a5,a0,0x34
    8000a8d8:	04079c63          	bnez	a5,8000a930 <kfree+0x70>
    8000a8dc:	00006797          	auipc	a5,0x6
    8000a8e0:	c3478793          	addi	a5,a5,-972 # 80010510 <end>
    8000a8e4:	00050493          	mv	s1,a0
    8000a8e8:	04f56463          	bltu	a0,a5,8000a930 <kfree+0x70>
    8000a8ec:	01100793          	li	a5,17
    8000a8f0:	01b79793          	slli	a5,a5,0x1b
    8000a8f4:	02f57e63          	bgeu	a0,a5,8000a930 <kfree+0x70>
    8000a8f8:	00001637          	lui	a2,0x1
    8000a8fc:	00100593          	li	a1,1
    8000a900:	00000097          	auipc	ra,0x0
    8000a904:	478080e7          	jalr	1144(ra) # 8000ad78 <__memset>
    8000a908:	00005797          	auipc	a5,0x5
    8000a90c:	8f878793          	addi	a5,a5,-1800 # 8000f200 <kmem>
    8000a910:	0007b703          	ld	a4,0(a5)
    8000a914:	01813083          	ld	ra,24(sp)
    8000a918:	01013403          	ld	s0,16(sp)
    8000a91c:	00e4b023          	sd	a4,0(s1)
    8000a920:	0097b023          	sd	s1,0(a5)
    8000a924:	00813483          	ld	s1,8(sp)
    8000a928:	02010113          	addi	sp,sp,32
    8000a92c:	00008067          	ret
    8000a930:	00002517          	auipc	a0,0x2
    8000a934:	22050513          	addi	a0,a0,544 # 8000cb50 <digits+0x18>
    8000a938:	fffff097          	auipc	ra,0xfffff
    8000a93c:	354080e7          	jalr	852(ra) # 80009c8c <panic>

000000008000a940 <kalloc>:
    8000a940:	fe010113          	addi	sp,sp,-32
    8000a944:	00813823          	sd	s0,16(sp)
    8000a948:	00913423          	sd	s1,8(sp)
    8000a94c:	00113c23          	sd	ra,24(sp)
    8000a950:	02010413          	addi	s0,sp,32
    8000a954:	00005797          	auipc	a5,0x5
    8000a958:	8ac78793          	addi	a5,a5,-1876 # 8000f200 <kmem>
    8000a95c:	0007b483          	ld	s1,0(a5)
    8000a960:	02048063          	beqz	s1,8000a980 <kalloc+0x40>
    8000a964:	0004b703          	ld	a4,0(s1)
    8000a968:	00001637          	lui	a2,0x1
    8000a96c:	00500593          	li	a1,5
    8000a970:	00048513          	mv	a0,s1
    8000a974:	00e7b023          	sd	a4,0(a5)
    8000a978:	00000097          	auipc	ra,0x0
    8000a97c:	400080e7          	jalr	1024(ra) # 8000ad78 <__memset>
    8000a980:	01813083          	ld	ra,24(sp)
    8000a984:	01013403          	ld	s0,16(sp)
    8000a988:	00048513          	mv	a0,s1
    8000a98c:	00813483          	ld	s1,8(sp)
    8000a990:	02010113          	addi	sp,sp,32
    8000a994:	00008067          	ret

000000008000a998 <initlock>:
    8000a998:	ff010113          	addi	sp,sp,-16
    8000a99c:	00813423          	sd	s0,8(sp)
    8000a9a0:	01010413          	addi	s0,sp,16
    8000a9a4:	00813403          	ld	s0,8(sp)
    8000a9a8:	00b53423          	sd	a1,8(a0)
    8000a9ac:	00052023          	sw	zero,0(a0)
    8000a9b0:	00053823          	sd	zero,16(a0)
    8000a9b4:	01010113          	addi	sp,sp,16
    8000a9b8:	00008067          	ret

000000008000a9bc <acquire>:
    8000a9bc:	fe010113          	addi	sp,sp,-32
    8000a9c0:	00813823          	sd	s0,16(sp)
    8000a9c4:	00913423          	sd	s1,8(sp)
    8000a9c8:	00113c23          	sd	ra,24(sp)
    8000a9cc:	01213023          	sd	s2,0(sp)
    8000a9d0:	02010413          	addi	s0,sp,32
    8000a9d4:	00050493          	mv	s1,a0
    8000a9d8:	10002973          	csrr	s2,sstatus
    8000a9dc:	100027f3          	csrr	a5,sstatus
    8000a9e0:	ffd7f793          	andi	a5,a5,-3
    8000a9e4:	10079073          	csrw	sstatus,a5
    8000a9e8:	fffff097          	auipc	ra,0xfffff
    8000a9ec:	8e0080e7          	jalr	-1824(ra) # 800092c8 <mycpu>
    8000a9f0:	07852783          	lw	a5,120(a0)
    8000a9f4:	06078e63          	beqz	a5,8000aa70 <acquire+0xb4>
    8000a9f8:	fffff097          	auipc	ra,0xfffff
    8000a9fc:	8d0080e7          	jalr	-1840(ra) # 800092c8 <mycpu>
    8000aa00:	07852783          	lw	a5,120(a0)
    8000aa04:	0004a703          	lw	a4,0(s1)
    8000aa08:	0017879b          	addiw	a5,a5,1
    8000aa0c:	06f52c23          	sw	a5,120(a0)
    8000aa10:	04071063          	bnez	a4,8000aa50 <acquire+0x94>
    8000aa14:	00100713          	li	a4,1
    8000aa18:	00070793          	mv	a5,a4
    8000aa1c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    8000aa20:	0007879b          	sext.w	a5,a5
    8000aa24:	fe079ae3          	bnez	a5,8000aa18 <acquire+0x5c>
    8000aa28:	0ff0000f          	fence
    8000aa2c:	fffff097          	auipc	ra,0xfffff
    8000aa30:	89c080e7          	jalr	-1892(ra) # 800092c8 <mycpu>
    8000aa34:	01813083          	ld	ra,24(sp)
    8000aa38:	01013403          	ld	s0,16(sp)
    8000aa3c:	00a4b823          	sd	a0,16(s1)
    8000aa40:	00013903          	ld	s2,0(sp)
    8000aa44:	00813483          	ld	s1,8(sp)
    8000aa48:	02010113          	addi	sp,sp,32
    8000aa4c:	00008067          	ret
    8000aa50:	0104b903          	ld	s2,16(s1)
    8000aa54:	fffff097          	auipc	ra,0xfffff
    8000aa58:	874080e7          	jalr	-1932(ra) # 800092c8 <mycpu>
    8000aa5c:	faa91ce3          	bne	s2,a0,8000aa14 <acquire+0x58>
    8000aa60:	00002517          	auipc	a0,0x2
    8000aa64:	0f850513          	addi	a0,a0,248 # 8000cb58 <digits+0x20>
    8000aa68:	fffff097          	auipc	ra,0xfffff
    8000aa6c:	224080e7          	jalr	548(ra) # 80009c8c <panic>
    8000aa70:	00195913          	srli	s2,s2,0x1
    8000aa74:	fffff097          	auipc	ra,0xfffff
    8000aa78:	854080e7          	jalr	-1964(ra) # 800092c8 <mycpu>
    8000aa7c:	00197913          	andi	s2,s2,1
    8000aa80:	07252e23          	sw	s2,124(a0)
    8000aa84:	f75ff06f          	j	8000a9f8 <acquire+0x3c>

000000008000aa88 <release>:
    8000aa88:	fe010113          	addi	sp,sp,-32
    8000aa8c:	00813823          	sd	s0,16(sp)
    8000aa90:	00113c23          	sd	ra,24(sp)
    8000aa94:	00913423          	sd	s1,8(sp)
    8000aa98:	01213023          	sd	s2,0(sp)
    8000aa9c:	02010413          	addi	s0,sp,32
    8000aaa0:	00052783          	lw	a5,0(a0)
    8000aaa4:	00079a63          	bnez	a5,8000aab8 <release+0x30>
    8000aaa8:	00002517          	auipc	a0,0x2
    8000aaac:	0b850513          	addi	a0,a0,184 # 8000cb60 <digits+0x28>
    8000aab0:	fffff097          	auipc	ra,0xfffff
    8000aab4:	1dc080e7          	jalr	476(ra) # 80009c8c <panic>
    8000aab8:	01053903          	ld	s2,16(a0)
    8000aabc:	00050493          	mv	s1,a0
    8000aac0:	fffff097          	auipc	ra,0xfffff
    8000aac4:	808080e7          	jalr	-2040(ra) # 800092c8 <mycpu>
    8000aac8:	fea910e3          	bne	s2,a0,8000aaa8 <release+0x20>
    8000aacc:	0004b823          	sd	zero,16(s1)
    8000aad0:	0ff0000f          	fence
    8000aad4:	0f50000f          	fence	iorw,ow
    8000aad8:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000aadc:	ffffe097          	auipc	ra,0xffffe
    8000aae0:	7ec080e7          	jalr	2028(ra) # 800092c8 <mycpu>
    8000aae4:	100027f3          	csrr	a5,sstatus
    8000aae8:	0027f793          	andi	a5,a5,2
    8000aaec:	04079a63          	bnez	a5,8000ab40 <release+0xb8>
    8000aaf0:	07852783          	lw	a5,120(a0)
    8000aaf4:	02f05e63          	blez	a5,8000ab30 <release+0xa8>
    8000aaf8:	fff7871b          	addiw	a4,a5,-1
    8000aafc:	06e52c23          	sw	a4,120(a0)
    8000ab00:	00071c63          	bnez	a4,8000ab18 <release+0x90>
    8000ab04:	07c52783          	lw	a5,124(a0)
    8000ab08:	00078863          	beqz	a5,8000ab18 <release+0x90>
    8000ab0c:	100027f3          	csrr	a5,sstatus
    8000ab10:	0027e793          	ori	a5,a5,2
    8000ab14:	10079073          	csrw	sstatus,a5
    8000ab18:	01813083          	ld	ra,24(sp)
    8000ab1c:	01013403          	ld	s0,16(sp)
    8000ab20:	00813483          	ld	s1,8(sp)
    8000ab24:	00013903          	ld	s2,0(sp)
    8000ab28:	02010113          	addi	sp,sp,32
    8000ab2c:	00008067          	ret
    8000ab30:	00002517          	auipc	a0,0x2
    8000ab34:	05050513          	addi	a0,a0,80 # 8000cb80 <digits+0x48>
    8000ab38:	fffff097          	auipc	ra,0xfffff
    8000ab3c:	154080e7          	jalr	340(ra) # 80009c8c <panic>
    8000ab40:	00002517          	auipc	a0,0x2
    8000ab44:	02850513          	addi	a0,a0,40 # 8000cb68 <digits+0x30>
    8000ab48:	fffff097          	auipc	ra,0xfffff
    8000ab4c:	144080e7          	jalr	324(ra) # 80009c8c <panic>

000000008000ab50 <holding>:
    8000ab50:	00052783          	lw	a5,0(a0)
    8000ab54:	00079663          	bnez	a5,8000ab60 <holding+0x10>
    8000ab58:	00000513          	li	a0,0
    8000ab5c:	00008067          	ret
    8000ab60:	fe010113          	addi	sp,sp,-32
    8000ab64:	00813823          	sd	s0,16(sp)
    8000ab68:	00913423          	sd	s1,8(sp)
    8000ab6c:	00113c23          	sd	ra,24(sp)
    8000ab70:	02010413          	addi	s0,sp,32
    8000ab74:	01053483          	ld	s1,16(a0)
    8000ab78:	ffffe097          	auipc	ra,0xffffe
    8000ab7c:	750080e7          	jalr	1872(ra) # 800092c8 <mycpu>
    8000ab80:	01813083          	ld	ra,24(sp)
    8000ab84:	01013403          	ld	s0,16(sp)
    8000ab88:	40a48533          	sub	a0,s1,a0
    8000ab8c:	00153513          	seqz	a0,a0
    8000ab90:	00813483          	ld	s1,8(sp)
    8000ab94:	02010113          	addi	sp,sp,32
    8000ab98:	00008067          	ret

000000008000ab9c <push_off>:
    8000ab9c:	fe010113          	addi	sp,sp,-32
    8000aba0:	00813823          	sd	s0,16(sp)
    8000aba4:	00113c23          	sd	ra,24(sp)
    8000aba8:	00913423          	sd	s1,8(sp)
    8000abac:	02010413          	addi	s0,sp,32
    8000abb0:	100024f3          	csrr	s1,sstatus
    8000abb4:	100027f3          	csrr	a5,sstatus
    8000abb8:	ffd7f793          	andi	a5,a5,-3
    8000abbc:	10079073          	csrw	sstatus,a5
    8000abc0:	ffffe097          	auipc	ra,0xffffe
    8000abc4:	708080e7          	jalr	1800(ra) # 800092c8 <mycpu>
    8000abc8:	07852783          	lw	a5,120(a0)
    8000abcc:	02078663          	beqz	a5,8000abf8 <push_off+0x5c>
    8000abd0:	ffffe097          	auipc	ra,0xffffe
    8000abd4:	6f8080e7          	jalr	1784(ra) # 800092c8 <mycpu>
    8000abd8:	07852783          	lw	a5,120(a0)
    8000abdc:	01813083          	ld	ra,24(sp)
    8000abe0:	01013403          	ld	s0,16(sp)
    8000abe4:	0017879b          	addiw	a5,a5,1
    8000abe8:	06f52c23          	sw	a5,120(a0)
    8000abec:	00813483          	ld	s1,8(sp)
    8000abf0:	02010113          	addi	sp,sp,32
    8000abf4:	00008067          	ret
    8000abf8:	0014d493          	srli	s1,s1,0x1
    8000abfc:	ffffe097          	auipc	ra,0xffffe
    8000ac00:	6cc080e7          	jalr	1740(ra) # 800092c8 <mycpu>
    8000ac04:	0014f493          	andi	s1,s1,1
    8000ac08:	06952e23          	sw	s1,124(a0)
    8000ac0c:	fc5ff06f          	j	8000abd0 <push_off+0x34>

000000008000ac10 <pop_off>:
    8000ac10:	ff010113          	addi	sp,sp,-16
    8000ac14:	00813023          	sd	s0,0(sp)
    8000ac18:	00113423          	sd	ra,8(sp)
    8000ac1c:	01010413          	addi	s0,sp,16
    8000ac20:	ffffe097          	auipc	ra,0xffffe
    8000ac24:	6a8080e7          	jalr	1704(ra) # 800092c8 <mycpu>
    8000ac28:	100027f3          	csrr	a5,sstatus
    8000ac2c:	0027f793          	andi	a5,a5,2
    8000ac30:	04079663          	bnez	a5,8000ac7c <pop_off+0x6c>
    8000ac34:	07852783          	lw	a5,120(a0)
    8000ac38:	02f05a63          	blez	a5,8000ac6c <pop_off+0x5c>
    8000ac3c:	fff7871b          	addiw	a4,a5,-1
    8000ac40:	06e52c23          	sw	a4,120(a0)
    8000ac44:	00071c63          	bnez	a4,8000ac5c <pop_off+0x4c>
    8000ac48:	07c52783          	lw	a5,124(a0)
    8000ac4c:	00078863          	beqz	a5,8000ac5c <pop_off+0x4c>
    8000ac50:	100027f3          	csrr	a5,sstatus
    8000ac54:	0027e793          	ori	a5,a5,2
    8000ac58:	10079073          	csrw	sstatus,a5
    8000ac5c:	00813083          	ld	ra,8(sp)
    8000ac60:	00013403          	ld	s0,0(sp)
    8000ac64:	01010113          	addi	sp,sp,16
    8000ac68:	00008067          	ret
    8000ac6c:	00002517          	auipc	a0,0x2
    8000ac70:	f1450513          	addi	a0,a0,-236 # 8000cb80 <digits+0x48>
    8000ac74:	fffff097          	auipc	ra,0xfffff
    8000ac78:	018080e7          	jalr	24(ra) # 80009c8c <panic>
    8000ac7c:	00002517          	auipc	a0,0x2
    8000ac80:	eec50513          	addi	a0,a0,-276 # 8000cb68 <digits+0x30>
    8000ac84:	fffff097          	auipc	ra,0xfffff
    8000ac88:	008080e7          	jalr	8(ra) # 80009c8c <panic>

000000008000ac8c <push_on>:
    8000ac8c:	fe010113          	addi	sp,sp,-32
    8000ac90:	00813823          	sd	s0,16(sp)
    8000ac94:	00113c23          	sd	ra,24(sp)
    8000ac98:	00913423          	sd	s1,8(sp)
    8000ac9c:	02010413          	addi	s0,sp,32
    8000aca0:	100024f3          	csrr	s1,sstatus
    8000aca4:	100027f3          	csrr	a5,sstatus
    8000aca8:	0027e793          	ori	a5,a5,2
    8000acac:	10079073          	csrw	sstatus,a5
    8000acb0:	ffffe097          	auipc	ra,0xffffe
    8000acb4:	618080e7          	jalr	1560(ra) # 800092c8 <mycpu>
    8000acb8:	07852783          	lw	a5,120(a0)
    8000acbc:	02078663          	beqz	a5,8000ace8 <push_on+0x5c>
    8000acc0:	ffffe097          	auipc	ra,0xffffe
    8000acc4:	608080e7          	jalr	1544(ra) # 800092c8 <mycpu>
    8000acc8:	07852783          	lw	a5,120(a0)
    8000accc:	01813083          	ld	ra,24(sp)
    8000acd0:	01013403          	ld	s0,16(sp)
    8000acd4:	0017879b          	addiw	a5,a5,1
    8000acd8:	06f52c23          	sw	a5,120(a0)
    8000acdc:	00813483          	ld	s1,8(sp)
    8000ace0:	02010113          	addi	sp,sp,32
    8000ace4:	00008067          	ret
    8000ace8:	0014d493          	srli	s1,s1,0x1
    8000acec:	ffffe097          	auipc	ra,0xffffe
    8000acf0:	5dc080e7          	jalr	1500(ra) # 800092c8 <mycpu>
    8000acf4:	0014f493          	andi	s1,s1,1
    8000acf8:	06952e23          	sw	s1,124(a0)
    8000acfc:	fc5ff06f          	j	8000acc0 <push_on+0x34>

000000008000ad00 <pop_on>:
    8000ad00:	ff010113          	addi	sp,sp,-16
    8000ad04:	00813023          	sd	s0,0(sp)
    8000ad08:	00113423          	sd	ra,8(sp)
    8000ad0c:	01010413          	addi	s0,sp,16
    8000ad10:	ffffe097          	auipc	ra,0xffffe
    8000ad14:	5b8080e7          	jalr	1464(ra) # 800092c8 <mycpu>
    8000ad18:	100027f3          	csrr	a5,sstatus
    8000ad1c:	0027f793          	andi	a5,a5,2
    8000ad20:	04078463          	beqz	a5,8000ad68 <pop_on+0x68>
    8000ad24:	07852783          	lw	a5,120(a0)
    8000ad28:	02f05863          	blez	a5,8000ad58 <pop_on+0x58>
    8000ad2c:	fff7879b          	addiw	a5,a5,-1
    8000ad30:	06f52c23          	sw	a5,120(a0)
    8000ad34:	07853783          	ld	a5,120(a0)
    8000ad38:	00079863          	bnez	a5,8000ad48 <pop_on+0x48>
    8000ad3c:	100027f3          	csrr	a5,sstatus
    8000ad40:	ffd7f793          	andi	a5,a5,-3
    8000ad44:	10079073          	csrw	sstatus,a5
    8000ad48:	00813083          	ld	ra,8(sp)
    8000ad4c:	00013403          	ld	s0,0(sp)
    8000ad50:	01010113          	addi	sp,sp,16
    8000ad54:	00008067          	ret
    8000ad58:	00002517          	auipc	a0,0x2
    8000ad5c:	e5050513          	addi	a0,a0,-432 # 8000cba8 <digits+0x70>
    8000ad60:	fffff097          	auipc	ra,0xfffff
    8000ad64:	f2c080e7          	jalr	-212(ra) # 80009c8c <panic>
    8000ad68:	00002517          	auipc	a0,0x2
    8000ad6c:	e2050513          	addi	a0,a0,-480 # 8000cb88 <digits+0x50>
    8000ad70:	fffff097          	auipc	ra,0xfffff
    8000ad74:	f1c080e7          	jalr	-228(ra) # 80009c8c <panic>

000000008000ad78 <__memset>:
    8000ad78:	ff010113          	addi	sp,sp,-16
    8000ad7c:	00813423          	sd	s0,8(sp)
    8000ad80:	01010413          	addi	s0,sp,16
    8000ad84:	1a060e63          	beqz	a2,8000af40 <__memset+0x1c8>
    8000ad88:	40a007b3          	neg	a5,a0
    8000ad8c:	0077f793          	andi	a5,a5,7
    8000ad90:	00778693          	addi	a3,a5,7
    8000ad94:	00b00813          	li	a6,11
    8000ad98:	0ff5f593          	andi	a1,a1,255
    8000ad9c:	fff6071b          	addiw	a4,a2,-1
    8000ada0:	1b06e663          	bltu	a3,a6,8000af4c <__memset+0x1d4>
    8000ada4:	1cd76463          	bltu	a4,a3,8000af6c <__memset+0x1f4>
    8000ada8:	1a078e63          	beqz	a5,8000af64 <__memset+0x1ec>
    8000adac:	00b50023          	sb	a1,0(a0)
    8000adb0:	00100713          	li	a4,1
    8000adb4:	1ae78463          	beq	a5,a4,8000af5c <__memset+0x1e4>
    8000adb8:	00b500a3          	sb	a1,1(a0)
    8000adbc:	00200713          	li	a4,2
    8000adc0:	1ae78a63          	beq	a5,a4,8000af74 <__memset+0x1fc>
    8000adc4:	00b50123          	sb	a1,2(a0)
    8000adc8:	00300713          	li	a4,3
    8000adcc:	18e78463          	beq	a5,a4,8000af54 <__memset+0x1dc>
    8000add0:	00b501a3          	sb	a1,3(a0)
    8000add4:	00400713          	li	a4,4
    8000add8:	1ae78263          	beq	a5,a4,8000af7c <__memset+0x204>
    8000addc:	00b50223          	sb	a1,4(a0)
    8000ade0:	00500713          	li	a4,5
    8000ade4:	1ae78063          	beq	a5,a4,8000af84 <__memset+0x20c>
    8000ade8:	00b502a3          	sb	a1,5(a0)
    8000adec:	00700713          	li	a4,7
    8000adf0:	18e79e63          	bne	a5,a4,8000af8c <__memset+0x214>
    8000adf4:	00b50323          	sb	a1,6(a0)
    8000adf8:	00700e93          	li	t4,7
    8000adfc:	00859713          	slli	a4,a1,0x8
    8000ae00:	00e5e733          	or	a4,a1,a4
    8000ae04:	01059e13          	slli	t3,a1,0x10
    8000ae08:	01c76e33          	or	t3,a4,t3
    8000ae0c:	01859313          	slli	t1,a1,0x18
    8000ae10:	006e6333          	or	t1,t3,t1
    8000ae14:	02059893          	slli	a7,a1,0x20
    8000ae18:	40f60e3b          	subw	t3,a2,a5
    8000ae1c:	011368b3          	or	a7,t1,a7
    8000ae20:	02859813          	slli	a6,a1,0x28
    8000ae24:	0108e833          	or	a6,a7,a6
    8000ae28:	03059693          	slli	a3,a1,0x30
    8000ae2c:	003e589b          	srliw	a7,t3,0x3
    8000ae30:	00d866b3          	or	a3,a6,a3
    8000ae34:	03859713          	slli	a4,a1,0x38
    8000ae38:	00389813          	slli	a6,a7,0x3
    8000ae3c:	00f507b3          	add	a5,a0,a5
    8000ae40:	00e6e733          	or	a4,a3,a4
    8000ae44:	000e089b          	sext.w	a7,t3
    8000ae48:	00f806b3          	add	a3,a6,a5
    8000ae4c:	00e7b023          	sd	a4,0(a5)
    8000ae50:	00878793          	addi	a5,a5,8
    8000ae54:	fed79ce3          	bne	a5,a3,8000ae4c <__memset+0xd4>
    8000ae58:	ff8e7793          	andi	a5,t3,-8
    8000ae5c:	0007871b          	sext.w	a4,a5
    8000ae60:	01d787bb          	addw	a5,a5,t4
    8000ae64:	0ce88e63          	beq	a7,a4,8000af40 <__memset+0x1c8>
    8000ae68:	00f50733          	add	a4,a0,a5
    8000ae6c:	00b70023          	sb	a1,0(a4)
    8000ae70:	0017871b          	addiw	a4,a5,1
    8000ae74:	0cc77663          	bgeu	a4,a2,8000af40 <__memset+0x1c8>
    8000ae78:	00e50733          	add	a4,a0,a4
    8000ae7c:	00b70023          	sb	a1,0(a4)
    8000ae80:	0027871b          	addiw	a4,a5,2
    8000ae84:	0ac77e63          	bgeu	a4,a2,8000af40 <__memset+0x1c8>
    8000ae88:	00e50733          	add	a4,a0,a4
    8000ae8c:	00b70023          	sb	a1,0(a4)
    8000ae90:	0037871b          	addiw	a4,a5,3
    8000ae94:	0ac77663          	bgeu	a4,a2,8000af40 <__memset+0x1c8>
    8000ae98:	00e50733          	add	a4,a0,a4
    8000ae9c:	00b70023          	sb	a1,0(a4)
    8000aea0:	0047871b          	addiw	a4,a5,4
    8000aea4:	08c77e63          	bgeu	a4,a2,8000af40 <__memset+0x1c8>
    8000aea8:	00e50733          	add	a4,a0,a4
    8000aeac:	00b70023          	sb	a1,0(a4)
    8000aeb0:	0057871b          	addiw	a4,a5,5
    8000aeb4:	08c77663          	bgeu	a4,a2,8000af40 <__memset+0x1c8>
    8000aeb8:	00e50733          	add	a4,a0,a4
    8000aebc:	00b70023          	sb	a1,0(a4)
    8000aec0:	0067871b          	addiw	a4,a5,6
    8000aec4:	06c77e63          	bgeu	a4,a2,8000af40 <__memset+0x1c8>
    8000aec8:	00e50733          	add	a4,a0,a4
    8000aecc:	00b70023          	sb	a1,0(a4)
    8000aed0:	0077871b          	addiw	a4,a5,7
    8000aed4:	06c77663          	bgeu	a4,a2,8000af40 <__memset+0x1c8>
    8000aed8:	00e50733          	add	a4,a0,a4
    8000aedc:	00b70023          	sb	a1,0(a4)
    8000aee0:	0087871b          	addiw	a4,a5,8
    8000aee4:	04c77e63          	bgeu	a4,a2,8000af40 <__memset+0x1c8>
    8000aee8:	00e50733          	add	a4,a0,a4
    8000aeec:	00b70023          	sb	a1,0(a4)
    8000aef0:	0097871b          	addiw	a4,a5,9
    8000aef4:	04c77663          	bgeu	a4,a2,8000af40 <__memset+0x1c8>
    8000aef8:	00e50733          	add	a4,a0,a4
    8000aefc:	00b70023          	sb	a1,0(a4)
    8000af00:	00a7871b          	addiw	a4,a5,10
    8000af04:	02c77e63          	bgeu	a4,a2,8000af40 <__memset+0x1c8>
    8000af08:	00e50733          	add	a4,a0,a4
    8000af0c:	00b70023          	sb	a1,0(a4)
    8000af10:	00b7871b          	addiw	a4,a5,11
    8000af14:	02c77663          	bgeu	a4,a2,8000af40 <__memset+0x1c8>
    8000af18:	00e50733          	add	a4,a0,a4
    8000af1c:	00b70023          	sb	a1,0(a4)
    8000af20:	00c7871b          	addiw	a4,a5,12
    8000af24:	00c77e63          	bgeu	a4,a2,8000af40 <__memset+0x1c8>
    8000af28:	00e50733          	add	a4,a0,a4
    8000af2c:	00b70023          	sb	a1,0(a4)
    8000af30:	00d7879b          	addiw	a5,a5,13
    8000af34:	00c7f663          	bgeu	a5,a2,8000af40 <__memset+0x1c8>
    8000af38:	00f507b3          	add	a5,a0,a5
    8000af3c:	00b78023          	sb	a1,0(a5)
    8000af40:	00813403          	ld	s0,8(sp)
    8000af44:	01010113          	addi	sp,sp,16
    8000af48:	00008067          	ret
    8000af4c:	00b00693          	li	a3,11
    8000af50:	e55ff06f          	j	8000ada4 <__memset+0x2c>
    8000af54:	00300e93          	li	t4,3
    8000af58:	ea5ff06f          	j	8000adfc <__memset+0x84>
    8000af5c:	00100e93          	li	t4,1
    8000af60:	e9dff06f          	j	8000adfc <__memset+0x84>
    8000af64:	00000e93          	li	t4,0
    8000af68:	e95ff06f          	j	8000adfc <__memset+0x84>
    8000af6c:	00000793          	li	a5,0
    8000af70:	ef9ff06f          	j	8000ae68 <__memset+0xf0>
    8000af74:	00200e93          	li	t4,2
    8000af78:	e85ff06f          	j	8000adfc <__memset+0x84>
    8000af7c:	00400e93          	li	t4,4
    8000af80:	e7dff06f          	j	8000adfc <__memset+0x84>
    8000af84:	00500e93          	li	t4,5
    8000af88:	e75ff06f          	j	8000adfc <__memset+0x84>
    8000af8c:	00600e93          	li	t4,6
    8000af90:	e6dff06f          	j	8000adfc <__memset+0x84>

000000008000af94 <__memmove>:
    8000af94:	ff010113          	addi	sp,sp,-16
    8000af98:	00813423          	sd	s0,8(sp)
    8000af9c:	01010413          	addi	s0,sp,16
    8000afa0:	0e060863          	beqz	a2,8000b090 <__memmove+0xfc>
    8000afa4:	fff6069b          	addiw	a3,a2,-1
    8000afa8:	0006881b          	sext.w	a6,a3
    8000afac:	0ea5e863          	bltu	a1,a0,8000b09c <__memmove+0x108>
    8000afb0:	00758713          	addi	a4,a1,7
    8000afb4:	00a5e7b3          	or	a5,a1,a0
    8000afb8:	40a70733          	sub	a4,a4,a0
    8000afbc:	0077f793          	andi	a5,a5,7
    8000afc0:	00f73713          	sltiu	a4,a4,15
    8000afc4:	00174713          	xori	a4,a4,1
    8000afc8:	0017b793          	seqz	a5,a5
    8000afcc:	00e7f7b3          	and	a5,a5,a4
    8000afd0:	10078863          	beqz	a5,8000b0e0 <__memmove+0x14c>
    8000afd4:	00900793          	li	a5,9
    8000afd8:	1107f463          	bgeu	a5,a6,8000b0e0 <__memmove+0x14c>
    8000afdc:	0036581b          	srliw	a6,a2,0x3
    8000afe0:	fff8081b          	addiw	a6,a6,-1
    8000afe4:	02081813          	slli	a6,a6,0x20
    8000afe8:	01d85893          	srli	a7,a6,0x1d
    8000afec:	00858813          	addi	a6,a1,8
    8000aff0:	00058793          	mv	a5,a1
    8000aff4:	00050713          	mv	a4,a0
    8000aff8:	01088833          	add	a6,a7,a6
    8000affc:	0007b883          	ld	a7,0(a5)
    8000b000:	00878793          	addi	a5,a5,8
    8000b004:	00870713          	addi	a4,a4,8
    8000b008:	ff173c23          	sd	a7,-8(a4)
    8000b00c:	ff0798e3          	bne	a5,a6,8000affc <__memmove+0x68>
    8000b010:	ff867713          	andi	a4,a2,-8
    8000b014:	02071793          	slli	a5,a4,0x20
    8000b018:	0207d793          	srli	a5,a5,0x20
    8000b01c:	00f585b3          	add	a1,a1,a5
    8000b020:	40e686bb          	subw	a3,a3,a4
    8000b024:	00f507b3          	add	a5,a0,a5
    8000b028:	06e60463          	beq	a2,a4,8000b090 <__memmove+0xfc>
    8000b02c:	0005c703          	lbu	a4,0(a1)
    8000b030:	00e78023          	sb	a4,0(a5)
    8000b034:	04068e63          	beqz	a3,8000b090 <__memmove+0xfc>
    8000b038:	0015c603          	lbu	a2,1(a1)
    8000b03c:	00100713          	li	a4,1
    8000b040:	00c780a3          	sb	a2,1(a5)
    8000b044:	04e68663          	beq	a3,a4,8000b090 <__memmove+0xfc>
    8000b048:	0025c603          	lbu	a2,2(a1)
    8000b04c:	00200713          	li	a4,2
    8000b050:	00c78123          	sb	a2,2(a5)
    8000b054:	02e68e63          	beq	a3,a4,8000b090 <__memmove+0xfc>
    8000b058:	0035c603          	lbu	a2,3(a1)
    8000b05c:	00300713          	li	a4,3
    8000b060:	00c781a3          	sb	a2,3(a5)
    8000b064:	02e68663          	beq	a3,a4,8000b090 <__memmove+0xfc>
    8000b068:	0045c603          	lbu	a2,4(a1)
    8000b06c:	00400713          	li	a4,4
    8000b070:	00c78223          	sb	a2,4(a5)
    8000b074:	00e68e63          	beq	a3,a4,8000b090 <__memmove+0xfc>
    8000b078:	0055c603          	lbu	a2,5(a1)
    8000b07c:	00500713          	li	a4,5
    8000b080:	00c782a3          	sb	a2,5(a5)
    8000b084:	00e68663          	beq	a3,a4,8000b090 <__memmove+0xfc>
    8000b088:	0065c703          	lbu	a4,6(a1)
    8000b08c:	00e78323          	sb	a4,6(a5)
    8000b090:	00813403          	ld	s0,8(sp)
    8000b094:	01010113          	addi	sp,sp,16
    8000b098:	00008067          	ret
    8000b09c:	02061713          	slli	a4,a2,0x20
    8000b0a0:	02075713          	srli	a4,a4,0x20
    8000b0a4:	00e587b3          	add	a5,a1,a4
    8000b0a8:	f0f574e3          	bgeu	a0,a5,8000afb0 <__memmove+0x1c>
    8000b0ac:	02069613          	slli	a2,a3,0x20
    8000b0b0:	02065613          	srli	a2,a2,0x20
    8000b0b4:	fff64613          	not	a2,a2
    8000b0b8:	00e50733          	add	a4,a0,a4
    8000b0bc:	00c78633          	add	a2,a5,a2
    8000b0c0:	fff7c683          	lbu	a3,-1(a5)
    8000b0c4:	fff78793          	addi	a5,a5,-1
    8000b0c8:	fff70713          	addi	a4,a4,-1
    8000b0cc:	00d70023          	sb	a3,0(a4)
    8000b0d0:	fec798e3          	bne	a5,a2,8000b0c0 <__memmove+0x12c>
    8000b0d4:	00813403          	ld	s0,8(sp)
    8000b0d8:	01010113          	addi	sp,sp,16
    8000b0dc:	00008067          	ret
    8000b0e0:	02069713          	slli	a4,a3,0x20
    8000b0e4:	02075713          	srli	a4,a4,0x20
    8000b0e8:	00170713          	addi	a4,a4,1
    8000b0ec:	00e50733          	add	a4,a0,a4
    8000b0f0:	00050793          	mv	a5,a0
    8000b0f4:	0005c683          	lbu	a3,0(a1)
    8000b0f8:	00178793          	addi	a5,a5,1
    8000b0fc:	00158593          	addi	a1,a1,1
    8000b100:	fed78fa3          	sb	a3,-1(a5)
    8000b104:	fee798e3          	bne	a5,a4,8000b0f4 <__memmove+0x160>
    8000b108:	f89ff06f          	j	8000b090 <__memmove+0xfc>
	...
