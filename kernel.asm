
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000f117          	auipc	sp,0xf
    80000004:	2f813103          	ld	sp,760(sp) # 8000f2f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	400090ef          	jal	ra,8000941c <start>

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
    8000107c:	6dc030ef          	jal	ra,80004758 <exceptionHandler>


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

00000000800011a4 <_ZN6Thread3runEv>:
    
    body = threadRun;
    arg = reinterpret_cast<void*>(this);
}

void Thread::run (){
    800011a4:	ff010113          	addi	sp,sp,-16
    800011a8:	00113423          	sd	ra,8(sp)
    800011ac:	00813023          	sd	s0,0(sp)
    800011b0:	01010413          	addi	s0,sp,16
    body(arg);
    800011b4:	01053783          	ld	a5,16(a0)
    800011b8:	01853503          	ld	a0,24(a0)
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
    800011e4:	ed078793          	addi	a5,a5,-304 # 8000f0b0 <_ZTV6Thread+0x10>
    800011e8:	00f53023          	sd	a5,0(a0)
    mem_free(myHandle);
    800011ec:	00853503          	ld	a0,8(a0)
    800011f0:	00001097          	auipc	ra,0x1
    800011f4:	fc0080e7          	jalr	-64(ra) # 800021b0 <_Z8mem_freePv>
}
    800011f8:	00813083          	ld	ra,8(sp)
    800011fc:	00013403          	ld	s0,0(sp)
    80001200:	01010113          	addi	sp,sp,16
    80001204:	00008067          	ret

0000000080001208 <_Z9threadRunPv>:
void threadRun(void* arg){
    80001208:	fe010113          	addi	sp,sp,-32
    8000120c:	00113c23          	sd	ra,24(sp)
    80001210:	00813823          	sd	s0,16(sp)
    80001214:	00913423          	sd	s1,8(sp)
    80001218:	02010413          	addi	s0,sp,32
    8000121c:	00050493          	mv	s1,a0
    putc('1');
    80001220:	03100513          	li	a0,49
    80001224:	00001097          	auipc	ra,0x1
    80001228:	204080e7          	jalr	516(ra) # 80002428 <_Z4putcc>
    putc('2');
    8000122c:	03200513          	li	a0,50
    80001230:	00001097          	auipc	ra,0x1
    80001234:	1f8080e7          	jalr	504(ra) # 80002428 <_Z4putcc>
    thread->run();
    80001238:	0004b783          	ld	a5,0(s1)
    8000123c:	0107b783          	ld	a5,16(a5)
    80001240:	00048513          	mv	a0,s1
    80001244:	000780e7          	jalr	a5
    putc('3');
    80001248:	03300513          	li	a0,51
    8000124c:	00001097          	auipc	ra,0x1
    80001250:	1dc080e7          	jalr	476(ra) # 80002428 <_Z4putcc>
}
    80001254:	01813083          	ld	ra,24(sp)
    80001258:	01013403          	ld	s0,16(sp)
    8000125c:	00813483          	ld	s1,8(sp)
    80001260:	02010113          	addi	sp,sp,32
    80001264:	00008067          	ret

0000000080001268 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore (unsigned init){
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore (){
    80001268:	ff010113          	addi	sp,sp,-16
    8000126c:	00113423          	sd	ra,8(sp)
    80001270:	00813023          	sd	s0,0(sp)
    80001274:	01010413          	addi	s0,sp,16
    80001278:	0000e797          	auipc	a5,0xe
    8000127c:	e6078793          	addi	a5,a5,-416 # 8000f0d8 <_ZTV9Semaphore+0x10>
    80001280:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001284:	00853503          	ld	a0,8(a0)
    80001288:	00001097          	auipc	ra,0x1
    8000128c:	098080e7          	jalr	152(ra) # 80002320 <_Z9sem_closeP4_sem>
}
    80001290:	00813083          	ld	ra,8(sp)
    80001294:	00013403          	ld	s0,0(sp)
    80001298:	01010113          	addi	sp,sp,16
    8000129c:	00008067          	ret

00000000800012a0 <_Znwm>:
void* operator new (size_t nSize){
    800012a0:	ff010113          	addi	sp,sp,-16
    800012a4:	00113423          	sd	ra,8(sp)
    800012a8:	00813023          	sd	s0,0(sp)
    800012ac:	01010413          	addi	s0,sp,16
    return mem_alloc(nSize);
    800012b0:	00001097          	auipc	ra,0x1
    800012b4:	ed0080e7          	jalr	-304(ra) # 80002180 <_Z9mem_allocm>
}
    800012b8:	00813083          	ld	ra,8(sp)
    800012bc:	00013403          	ld	s0,0(sp)
    800012c0:	01010113          	addi	sp,sp,16
    800012c4:	00008067          	ret

00000000800012c8 <_ZdlPv>:
void  operator delete (void* pAddress){
    800012c8:	ff010113          	addi	sp,sp,-16
    800012cc:	00113423          	sd	ra,8(sp)
    800012d0:	00813023          	sd	s0,0(sp)
    800012d4:	01010413          	addi	s0,sp,16
    mem_free(pAddress);
    800012d8:	00001097          	auipc	ra,0x1
    800012dc:	ed8080e7          	jalr	-296(ra) # 800021b0 <_Z8mem_freePv>
}
    800012e0:	00813083          	ld	ra,8(sp)
    800012e4:	00013403          	ld	s0,0(sp)
    800012e8:	01010113          	addi	sp,sp,16
    800012ec:	00008067          	ret

00000000800012f0 <_ZN6ThreadD0Ev>:
Thread::~Thread (){
    800012f0:	fe010113          	addi	sp,sp,-32
    800012f4:	00113c23          	sd	ra,24(sp)
    800012f8:	00813823          	sd	s0,16(sp)
    800012fc:	00913423          	sd	s1,8(sp)
    80001300:	02010413          	addi	s0,sp,32
    80001304:	00050493          	mv	s1,a0
}
    80001308:	00000097          	auipc	ra,0x0
    8000130c:	ec8080e7          	jalr	-312(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80001310:	00048513          	mv	a0,s1
    80001314:	00000097          	auipc	ra,0x0
    80001318:	fb4080e7          	jalr	-76(ra) # 800012c8 <_ZdlPv>
    8000131c:	01813083          	ld	ra,24(sp)
    80001320:	01013403          	ld	s0,16(sp)
    80001324:	00813483          	ld	s1,8(sp)
    80001328:	02010113          	addi	sp,sp,32
    8000132c:	00008067          	ret

0000000080001330 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore (){
    80001330:	fe010113          	addi	sp,sp,-32
    80001334:	00113c23          	sd	ra,24(sp)
    80001338:	00813823          	sd	s0,16(sp)
    8000133c:	00913423          	sd	s1,8(sp)
    80001340:	02010413          	addi	s0,sp,32
    80001344:	00050493          	mv	s1,a0
}
    80001348:	00000097          	auipc	ra,0x0
    8000134c:	f20080e7          	jalr	-224(ra) # 80001268 <_ZN9SemaphoreD1Ev>
    80001350:	00048513          	mv	a0,s1
    80001354:	00000097          	auipc	ra,0x0
    80001358:	f74080e7          	jalr	-140(ra) # 800012c8 <_ZdlPv>
    8000135c:	01813083          	ld	ra,24(sp)
    80001360:	01013403          	ld	s0,16(sp)
    80001364:	00813483          	ld	s1,8(sp)
    80001368:	02010113          	addi	sp,sp,32
    8000136c:	00008067          	ret

0000000080001370 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread (void (*body)(void*), void* arg): body(body), arg(arg){
    80001370:	ff010113          	addi	sp,sp,-16
    80001374:	00813423          	sd	s0,8(sp)
    80001378:	01010413          	addi	s0,sp,16
    8000137c:	0000e797          	auipc	a5,0xe
    80001380:	d3478793          	addi	a5,a5,-716 # 8000f0b0 <_ZTV6Thread+0x10>
    80001384:	00f53023          	sd	a5,0(a0)
    80001388:	00b53823          	sd	a1,16(a0)
    8000138c:	00c53c23          	sd	a2,24(a0)
}
    80001390:	00813403          	ld	s0,8(sp)
    80001394:	01010113          	addi	sp,sp,16
    80001398:	00008067          	ret

000000008000139c <_ZN6Thread5startEv>:
int Thread::start (){
    8000139c:	ff010113          	addi	sp,sp,-16
    800013a0:	00113423          	sd	ra,8(sp)
    800013a4:	00813023          	sd	s0,0(sp)
    800013a8:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, body, arg);
    800013ac:	01853603          	ld	a2,24(a0)
    800013b0:	01053583          	ld	a1,16(a0)
    800013b4:	00850513          	addi	a0,a0,8
    800013b8:	00001097          	auipc	ra,0x1
    800013bc:	e24080e7          	jalr	-476(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
}
    800013c0:	00813083          	ld	ra,8(sp)
    800013c4:	00013403          	ld	s0,0(sp)
    800013c8:	01010113          	addi	sp,sp,16
    800013cc:	00008067          	ret

00000000800013d0 <_ZN6Thread4joinEv>:
void Thread::join(){
    800013d0:	ff010113          	addi	sp,sp,-16
    800013d4:	00113423          	sd	ra,8(sp)
    800013d8:	00813023          	sd	s0,0(sp)
    800013dc:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    800013e0:	00853503          	ld	a0,8(a0)
    800013e4:	00001097          	auipc	ra,0x1
    800013e8:	eb4080e7          	jalr	-332(ra) # 80002298 <_Z11thread_joinP7_thread>
}
    800013ec:	00813083          	ld	ra,8(sp)
    800013f0:	00013403          	ld	s0,0(sp)
    800013f4:	01010113          	addi	sp,sp,16
    800013f8:	00008067          	ret

00000000800013fc <_ZN6Thread8dispatchEv>:
void Thread::dispatch (){
    800013fc:	ff010113          	addi	sp,sp,-16
    80001400:	00113423          	sd	ra,8(sp)
    80001404:	00813023          	sd	s0,0(sp)
    80001408:	01010413          	addi	s0,sp,16
    thread_dispatch();
    8000140c:	00001097          	auipc	ra,0x1
    80001410:	e6c080e7          	jalr	-404(ra) # 80002278 <_Z15thread_dispatchv>
}
    80001414:	00813083          	ld	ra,8(sp)
    80001418:	00013403          	ld	s0,0(sp)
    8000141c:	01010113          	addi	sp,sp,16
    80001420:	00008067          	ret

0000000080001424 <_ZN6Thread5sleepEm>:
int Thread::sleep (time_t time){
    80001424:	ff010113          	addi	sp,sp,-16
    80001428:	00113423          	sd	ra,8(sp)
    8000142c:	00813023          	sd	s0,0(sp)
    80001430:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    80001434:	00001097          	auipc	ra,0x1
    80001438:	e88080e7          	jalr	-376(ra) # 800022bc <_Z10time_sleepm>
}
    8000143c:	00813083          	ld	ra,8(sp)
    80001440:	00013403          	ld	s0,0(sp)
    80001444:	01010113          	addi	sp,sp,16
    80001448:	00008067          	ret

000000008000144c <_ZN14PeriodicThread3runEv>:
PeriodicThread::PeriodicThread (time_t period): period(period){
    this->period = period;
    active = true;
}

void PeriodicThread::run (){
    8000144c:	fe010113          	addi	sp,sp,-32
    80001450:	00113c23          	sd	ra,24(sp)
    80001454:	00813823          	sd	s0,16(sp)
    80001458:	00913423          	sd	s1,8(sp)
    8000145c:	02010413          	addi	s0,sp,32
    80001460:	00050493          	mv	s1,a0
    while(1){
        periodicActivation();
    80001464:	0004b783          	ld	a5,0(s1)
    80001468:	0187b783          	ld	a5,24(a5)
    8000146c:	00048513          	mv	a0,s1
    80001470:	000780e7          	jalr	a5
        sleep(period);
    80001474:	0204b503          	ld	a0,32(s1)
    80001478:	00000097          	auipc	ra,0x0
    8000147c:	fac080e7          	jalr	-84(ra) # 80001424 <_ZN6Thread5sleepEm>
    while(1){
    80001480:	fe5ff06f          	j	80001464 <_ZN14PeriodicThread3runEv+0x18>

0000000080001484 <_ZN6ThreadC1Ev>:
Thread::Thread (){
    80001484:	ff010113          	addi	sp,sp,-16
    80001488:	00813423          	sd	s0,8(sp)
    8000148c:	01010413          	addi	s0,sp,16
    80001490:	0000e797          	auipc	a5,0xe
    80001494:	c2078793          	addi	a5,a5,-992 # 8000f0b0 <_ZTV6Thread+0x10>
    80001498:	00f53023          	sd	a5,0(a0)
    body = threadRun;
    8000149c:	00000797          	auipc	a5,0x0
    800014a0:	d6c78793          	addi	a5,a5,-660 # 80001208 <_Z9threadRunPv>
    800014a4:	00f53823          	sd	a5,16(a0)
    arg = reinterpret_cast<void*>(this);
    800014a8:	00a53c23          	sd	a0,24(a0)
}
    800014ac:	00813403          	ld	s0,8(sp)
    800014b0:	01010113          	addi	sp,sp,16
    800014b4:	00008067          	ret

00000000800014b8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore (unsigned init){
    800014b8:	ff010113          	addi	sp,sp,-16
    800014bc:	00113423          	sd	ra,8(sp)
    800014c0:	00813023          	sd	s0,0(sp)
    800014c4:	01010413          	addi	s0,sp,16
    800014c8:	0000e797          	auipc	a5,0xe
    800014cc:	c1078793          	addi	a5,a5,-1008 # 8000f0d8 <_ZTV9Semaphore+0x10>
    800014d0:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800014d4:	00850513          	addi	a0,a0,8
    800014d8:	00001097          	auipc	ra,0x1
    800014dc:	e10080e7          	jalr	-496(ra) # 800022e8 <_Z8sem_openPP4_semj>
}
    800014e0:	00813083          	ld	ra,8(sp)
    800014e4:	00013403          	ld	s0,0(sp)
    800014e8:	01010113          	addi	sp,sp,16
    800014ec:	00008067          	ret

00000000800014f0 <_ZN9Semaphore4waitEv>:
int Semaphore::wait (){
    800014f0:	ff010113          	addi	sp,sp,-16
    800014f4:	00113423          	sd	ra,8(sp)
    800014f8:	00813023          	sd	s0,0(sp)
    800014fc:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80001500:	00853503          	ld	a0,8(a0)
    80001504:	00001097          	auipc	ra,0x1
    80001508:	e48080e7          	jalr	-440(ra) # 8000234c <_Z8sem_waitP4_sem>
}
    8000150c:	00813083          	ld	ra,8(sp)
    80001510:	00013403          	ld	s0,0(sp)
    80001514:	01010113          	addi	sp,sp,16
    80001518:	00008067          	ret

000000008000151c <_ZN9Semaphore6signalEv>:
int Semaphore::signal (){
    8000151c:	ff010113          	addi	sp,sp,-16
    80001520:	00113423          	sd	ra,8(sp)
    80001524:	00813023          	sd	s0,0(sp)
    80001528:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    8000152c:	00853503          	ld	a0,8(a0)
    80001530:	00001097          	auipc	ra,0x1
    80001534:	e48080e7          	jalr	-440(ra) # 80002378 <_Z10sem_signalP4_sem>
}
    80001538:	00813083          	ld	ra,8(sp)
    8000153c:	00013403          	ld	s0,0(sp)
    80001540:	01010113          	addi	sp,sp,16
    80001544:	00008067          	ret

0000000080001548 <_ZN9Semaphore7trywaitEv>:
int Semaphore::trywait (){
    80001548:	ff010113          	addi	sp,sp,-16
    8000154c:	00113423          	sd	ra,8(sp)
    80001550:	00813023          	sd	s0,0(sp)
    80001554:	01010413          	addi	s0,sp,16
    return sem_trywait(myHandle);
    80001558:	00853503          	ld	a0,8(a0)
    8000155c:	00001097          	auipc	ra,0x1
    80001560:	e48080e7          	jalr	-440(ra) # 800023a4 <_Z11sem_trywaitP4_sem>
}
    80001564:	00813083          	ld	ra,8(sp)
    80001568:	00013403          	ld	s0,0(sp)
    8000156c:	01010113          	addi	sp,sp,16
    80001570:	00008067          	ret

0000000080001574 <_ZN9Semaphore9timedwaitEm>:
int Semaphore::timedwait (time_t time){
    80001574:	ff010113          	addi	sp,sp,-16
    80001578:	00113423          	sd	ra,8(sp)
    8000157c:	00813023          	sd	s0,0(sp)
    80001580:	01010413          	addi	s0,sp,16
    return sem_timedwait(myHandle, time);
    80001584:	00853503          	ld	a0,8(a0)
    80001588:	00001097          	auipc	ra,0x1
    8000158c:	e48080e7          	jalr	-440(ra) # 800023d0 <_Z13sem_timedwaitP4_semm>
}
    80001590:	00813083          	ld	ra,8(sp)
    80001594:	00013403          	ld	s0,0(sp)
    80001598:	01010113          	addi	sp,sp,16
    8000159c:	00008067          	ret

00000000800015a0 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate (){
    800015a0:	ff010113          	addi	sp,sp,-16
    800015a4:	00113423          	sd	ra,8(sp)
    800015a8:	00813023          	sd	s0,0(sp)
    800015ac:	01010413          	addi	s0,sp,16
    myHandle->setClosed(true);
    800015b0:	00100593          	li	a1,1
    800015b4:	00853503          	ld	a0,8(a0)
    800015b8:	00001097          	auipc	ra,0x1
    800015bc:	288080e7          	jalr	648(ra) # 80002840 <_ZN7_thread9setClosedEb>
}
    800015c0:	00813083          	ld	ra,8(sp)
    800015c4:	00013403          	ld	s0,0(sp)
    800015c8:	01010113          	addi	sp,sp,16
    800015cc:	00008067          	ret

00000000800015d0 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread (time_t period): period(period){
    800015d0:	fe010113          	addi	sp,sp,-32
    800015d4:	00113c23          	sd	ra,24(sp)
    800015d8:	00813823          	sd	s0,16(sp)
    800015dc:	00913423          	sd	s1,8(sp)
    800015e0:	01213023          	sd	s2,0(sp)
    800015e4:	02010413          	addi	s0,sp,32
    800015e8:	00050493          	mv	s1,a0
    800015ec:	00058913          	mv	s2,a1
    800015f0:	00000097          	auipc	ra,0x0
    800015f4:	e94080e7          	jalr	-364(ra) # 80001484 <_ZN6ThreadC1Ev>
    800015f8:	0000e797          	auipc	a5,0xe
    800015fc:	b0078793          	addi	a5,a5,-1280 # 8000f0f8 <_ZTV14PeriodicThread+0x10>
    80001600:	00f4b023          	sd	a5,0(s1)
    80001604:	0324b023          	sd	s2,32(s1)
    active = true;
    80001608:	00100793          	li	a5,1
    8000160c:	02f48423          	sb	a5,40(s1)
}
    80001610:	01813083          	ld	ra,24(sp)
    80001614:	01013403          	ld	s0,16(sp)
    80001618:	00813483          	ld	s1,8(sp)
    8000161c:	00013903          	ld	s2,0(sp)
    80001620:	02010113          	addi	sp,sp,32
    80001624:	00008067          	ret

0000000080001628 <_ZN7Console4putcEc>:
    }
}



void Console::putc (char c){
    80001628:	ff010113          	addi	sp,sp,-16
    8000162c:	00113423          	sd	ra,8(sp)
    80001630:	00813023          	sd	s0,0(sp)
    80001634:	01010413          	addi	s0,sp,16
    putc(c);
    80001638:	00000097          	auipc	ra,0x0
    8000163c:	ff0080e7          	jalr	-16(ra) # 80001628 <_ZN7Console4putcEc>
}
    80001640:	00813083          	ld	ra,8(sp)
    80001644:	00013403          	ld	s0,0(sp)
    80001648:	01010113          	addi	sp,sp,16
    8000164c:	00008067          	ret

0000000080001650 <_ZN7Console4getcEv>:

char Console::getc (){
    80001650:	ff010113          	addi	sp,sp,-16
    80001654:	00113423          	sd	ra,8(sp)
    80001658:	00813023          	sd	s0,0(sp)
    8000165c:	01010413          	addi	s0,sp,16
    return getc();
    80001660:	00000097          	auipc	ra,0x0
    80001664:	ff0080e7          	jalr	-16(ra) # 80001650 <_ZN7Console4getcEv>
    80001668:	00813083          	ld	ra,8(sp)
    8000166c:	00013403          	ld	s0,0(sp)
    80001670:	01010113          	addi	sp,sp,16
    80001674:	00008067          	ret

0000000080001678 <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate ();
protected:
    void run () override;
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    80001678:	ff010113          	addi	sp,sp,-16
    8000167c:	00813423          	sd	s0,8(sp)
    80001680:	01010413          	addi	s0,sp,16
    80001684:	00813403          	ld	s0,8(sp)
    80001688:	01010113          	addi	sp,sp,16
    8000168c:	00008067          	ret

0000000080001690 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80001690:	ff010113          	addi	sp,sp,-16
    80001694:	00113423          	sd	ra,8(sp)
    80001698:	00813023          	sd	s0,0(sp)
    8000169c:	01010413          	addi	s0,sp,16
    800016a0:	0000e797          	auipc	a5,0xe
    800016a4:	a5878793          	addi	a5,a5,-1448 # 8000f0f8 <_ZTV14PeriodicThread+0x10>
    800016a8:	00f53023          	sd	a5,0(a0)
    800016ac:	00000097          	auipc	ra,0x0
    800016b0:	b24080e7          	jalr	-1244(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800016b4:	00813083          	ld	ra,8(sp)
    800016b8:	00013403          	ld	s0,0(sp)
    800016bc:	01010113          	addi	sp,sp,16
    800016c0:	00008067          	ret

00000000800016c4 <_ZN14PeriodicThreadD0Ev>:
    800016c4:	fe010113          	addi	sp,sp,-32
    800016c8:	00113c23          	sd	ra,24(sp)
    800016cc:	00813823          	sd	s0,16(sp)
    800016d0:	00913423          	sd	s1,8(sp)
    800016d4:	02010413          	addi	s0,sp,32
    800016d8:	00050493          	mv	s1,a0
    800016dc:	0000e797          	auipc	a5,0xe
    800016e0:	a1c78793          	addi	a5,a5,-1508 # 8000f0f8 <_ZTV14PeriodicThread+0x10>
    800016e4:	00f53023          	sd	a5,0(a0)
    800016e8:	00000097          	auipc	ra,0x0
    800016ec:	ae8080e7          	jalr	-1304(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800016f0:	00048513          	mv	a0,s1
    800016f4:	00000097          	auipc	ra,0x0
    800016f8:	bd4080e7          	jalr	-1068(ra) # 800012c8 <_ZdlPv>
    800016fc:	01813083          	ld	ra,24(sp)
    80001700:	01013403          	ld	s0,16(sp)
    80001704:	00813483          	ld	s1,8(sp)
    80001708:	02010113          	addi	sp,sp,32
    8000170c:	00008067          	ret

0000000080001710 <_Z16thread_test_1cppPv>:

Semaphore *sem1cpp, *sem2cpp;

char ccpp;

void thread_test_1cpp(void* args){
    80001710:	ff010113          	addi	sp,sp,-16
    80001714:	00113423          	sd	ra,8(sp)
    80001718:	00813023          	sd	s0,0(sp)
    8000171c:	01010413          	addi	s0,sp,16
    putc('1');
    80001720:	03100513          	li	a0,49
    80001724:	00001097          	auipc	ra,0x1
    80001728:	d04080e7          	jalr	-764(ra) # 80002428 <_Z4putcc>
    putc('s');
    8000172c:	07300513          	li	a0,115
    80001730:	00001097          	auipc	ra,0x1
    80001734:	cf8080e7          	jalr	-776(ra) # 80002428 <_Z4putcc>
    if(ccpp == 't')Thread::sleep(100);
    80001738:	0000e717          	auipc	a4,0xe
    8000173c:	c2874703          	lbu	a4,-984(a4) # 8000f360 <ccpp>
    80001740:	07400793          	li	a5,116
    80001744:	02f70e63          	beq	a4,a5,80001780 <_Z16thread_test_1cppPv+0x70>
    putc('1');
    80001748:	03100513          	li	a0,49
    8000174c:	00001097          	auipc	ra,0x1
    80001750:	cdc080e7          	jalr	-804(ra) # 80002428 <_Z4putcc>
    if(ccpp == 's')sem1cpp->signal();
    80001754:	0000e717          	auipc	a4,0xe
    80001758:	c0c74703          	lbu	a4,-1012(a4) # 8000f360 <ccpp>
    8000175c:	07300793          	li	a5,115
    80001760:	02f70863          	beq	a4,a5,80001790 <_Z16thread_test_1cppPv+0x80>
    putc('S');
    80001764:	05300513          	li	a0,83
    80001768:	00001097          	auipc	ra,0x1
    8000176c:	cc0080e7          	jalr	-832(ra) # 80002428 <_Z4putcc>
}
    80001770:	00813083          	ld	ra,8(sp)
    80001774:	00013403          	ld	s0,0(sp)
    80001778:	01010113          	addi	sp,sp,16
    8000177c:	00008067          	ret
    if(ccpp == 't')Thread::sleep(100);
    80001780:	06400513          	li	a0,100
    80001784:	00000097          	auipc	ra,0x0
    80001788:	ca0080e7          	jalr	-864(ra) # 80001424 <_ZN6Thread5sleepEm>
    8000178c:	fbdff06f          	j	80001748 <_Z16thread_test_1cppPv+0x38>
    if(ccpp == 's')sem1cpp->signal();
    80001790:	0000e517          	auipc	a0,0xe
    80001794:	bd853503          	ld	a0,-1064(a0) # 8000f368 <sem1cpp>
    80001798:	00000097          	auipc	ra,0x0
    8000179c:	d84080e7          	jalr	-636(ra) # 8000151c <_ZN9Semaphore6signalEv>
    800017a0:	fc5ff06f          	j	80001764 <_Z16thread_test_1cppPv+0x54>

00000000800017a4 <_Z16thread_test_2cppPv>:

void thread_test_2cpp(void* args){
    800017a4:	ff010113          	addi	sp,sp,-16
    800017a8:	00113423          	sd	ra,8(sp)
    800017ac:	00813023          	sd	s0,0(sp)
    800017b0:	01010413          	addi	s0,sp,16
    putc('2');
    800017b4:	03200513          	li	a0,50
    800017b8:	00001097          	auipc	ra,0x1
    800017bc:	c70080e7          	jalr	-912(ra) # 80002428 <_Z4putcc>
    putc('s');
    800017c0:	07300513          	li	a0,115
    800017c4:	00001097          	auipc	ra,0x1
    800017c8:	c64080e7          	jalr	-924(ra) # 80002428 <_Z4putcc>
    if(ccpp == 't')Thread::sleep(50);
    800017cc:	0000e717          	auipc	a4,0xe
    800017d0:	b9474703          	lbu	a4,-1132(a4) # 8000f360 <ccpp>
    800017d4:	07400793          	li	a5,116
    800017d8:	02f70e63          	beq	a4,a5,80001814 <_Z16thread_test_2cppPv+0x70>
    putc('2');
    800017dc:	03200513          	li	a0,50
    800017e0:	00001097          	auipc	ra,0x1
    800017e4:	c48080e7          	jalr	-952(ra) # 80002428 <_Z4putcc>
    if(ccpp == 's')sem2cpp->signal();
    800017e8:	0000e717          	auipc	a4,0xe
    800017ec:	b7874703          	lbu	a4,-1160(a4) # 8000f360 <ccpp>
    800017f0:	07300793          	li	a5,115
    800017f4:	02f70863          	beq	a4,a5,80001824 <_Z16thread_test_2cppPv+0x80>
    putc('S');
    800017f8:	05300513          	li	a0,83
    800017fc:	00001097          	auipc	ra,0x1
    80001800:	c2c080e7          	jalr	-980(ra) # 80002428 <_Z4putcc>
}
    80001804:	00813083          	ld	ra,8(sp)
    80001808:	00013403          	ld	s0,0(sp)
    8000180c:	01010113          	addi	sp,sp,16
    80001810:	00008067          	ret
    if(ccpp == 't')Thread::sleep(50);
    80001814:	03200513          	li	a0,50
    80001818:	00000097          	auipc	ra,0x0
    8000181c:	c0c080e7          	jalr	-1012(ra) # 80001424 <_ZN6Thread5sleepEm>
    80001820:	fbdff06f          	j	800017dc <_Z16thread_test_2cppPv+0x38>
    if(ccpp == 's')sem2cpp->signal();
    80001824:	0000e517          	auipc	a0,0xe
    80001828:	b4c53503          	ld	a0,-1204(a0) # 8000f370 <sem2cpp>
    8000182c:	00000097          	auipc	ra,0x0
    80001830:	cf0080e7          	jalr	-784(ra) # 8000151c <_ZN9Semaphore6signalEv>
    80001834:	fc5ff06f          	j	800017f8 <_Z16thread_test_2cppPv+0x54>

0000000080001838 <_Z11usermainCPPPv>:


void usermainCPP(void* arg){
    80001838:	fd010113          	addi	sp,sp,-48
    8000183c:	02113423          	sd	ra,40(sp)
    80001840:	02813023          	sd	s0,32(sp)
    80001844:	00913c23          	sd	s1,24(sp)
    80001848:	01213823          	sd	s2,16(sp)
    8000184c:	01313423          	sd	s3,8(sp)
    80001850:	03010413          	addi	s0,sp,48
    ccpp = 't';
    80001854:	07400793          	li	a5,116
    80001858:	0000e717          	auipc	a4,0xe
    8000185c:	b0f70423          	sb	a5,-1272(a4) # 8000f360 <ccpp>
    putc('0');
    80001860:	03000513          	li	a0,48
    80001864:	00001097          	auipc	ra,0x1
    80001868:	bc4080e7          	jalr	-1084(ra) # 80002428 <_Z4putcc>
    Thread *t1, *t2;
    t1 = new Thread(thread_test_1cpp, 0);
    8000186c:	02000513          	li	a0,32
    80001870:	00000097          	auipc	ra,0x0
    80001874:	a30080e7          	jalr	-1488(ra) # 800012a0 <_Znwm>
    80001878:	00050913          	mv	s2,a0
    8000187c:	00000613          	li	a2,0
    80001880:	00000597          	auipc	a1,0x0
    80001884:	e9058593          	addi	a1,a1,-368 # 80001710 <_Z16thread_test_1cppPv>
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	ae8080e7          	jalr	-1304(ra) # 80001370 <_ZN6ThreadC1EPFvPvES0_>
    t2 = new Thread(thread_test_2cpp, 0);
    80001890:	02000513          	li	a0,32
    80001894:	00000097          	auipc	ra,0x0
    80001898:	a0c080e7          	jalr	-1524(ra) # 800012a0 <_Znwm>
    8000189c:	00050493          	mv	s1,a0
    800018a0:	00000613          	li	a2,0
    800018a4:	00000597          	auipc	a1,0x0
    800018a8:	f0058593          	addi	a1,a1,-256 # 800017a4 <_Z16thread_test_2cppPv>
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	ac4080e7          	jalr	-1340(ra) # 80001370 <_ZN6ThreadC1EPFvPvES0_>
    if(ccpp == 's'){
    800018b4:	0000e717          	auipc	a4,0xe
    800018b8:	aac74703          	lbu	a4,-1364(a4) # 8000f360 <ccpp>
    800018bc:	07300793          	li	a5,115
    800018c0:	0af70e63          	beq	a4,a5,8000197c <_Z11usermainCPPPv+0x144>
        sem1cpp = new Semaphore(0);
        sem2cpp = new Semaphore(0);
    }
    t1->start();
    800018c4:	00090513          	mv	a0,s2
    800018c8:	00000097          	auipc	ra,0x0
    800018cc:	ad4080e7          	jalr	-1324(ra) # 8000139c <_ZN6Thread5startEv>
    t2->start();
    800018d0:	00048513          	mv	a0,s1
    800018d4:	00000097          	auipc	ra,0x0
    800018d8:	ac8080e7          	jalr	-1336(ra) # 8000139c <_ZN6Thread5startEv>
    if(ccpp == 's')sem1cpp->wait();
    800018dc:	0000e717          	auipc	a4,0xe
    800018e0:	a8474703          	lbu	a4,-1404(a4) # 8000f360 <ccpp>
    800018e4:	07300793          	li	a5,115
    800018e8:	0ef70063          	beq	a4,a5,800019c8 <_Z11usermainCPPPv+0x190>
    putc('3');
    800018ec:	03300513          	li	a0,51
    800018f0:	00001097          	auipc	ra,0x1
    800018f4:	b38080e7          	jalr	-1224(ra) # 80002428 <_Z4putcc>
    if(ccpp == 't')t2->join();
    800018f8:	0000e717          	auipc	a4,0xe
    800018fc:	a6874703          	lbu	a4,-1432(a4) # 8000f360 <ccpp>
    80001900:	07400793          	li	a5,116
    80001904:	0cf70c63          	beq	a4,a5,800019dc <_Z11usermainCPPPv+0x1a4>
    putc('4');
    80001908:	03400513          	li	a0,52
    8000190c:	00001097          	auipc	ra,0x1
    80001910:	b1c080e7          	jalr	-1252(ra) # 80002428 <_Z4putcc>
    if(ccpp == 't')t1->join();
    80001914:	0000e717          	auipc	a4,0xe
    80001918:	a4c74703          	lbu	a4,-1460(a4) # 8000f360 <ccpp>
    8000191c:	07400793          	li	a5,116
    80001920:	0cf70663          	beq	a4,a5,800019ec <_Z11usermainCPPPv+0x1b4>
    if(ccpp == 's')sem2cpp->wait();
    80001924:	0000e717          	auipc	a4,0xe
    80001928:	a3c74703          	lbu	a4,-1476(a4) # 8000f360 <ccpp>
    8000192c:	07300793          	li	a5,115
    80001930:	0cf70663          	beq	a4,a5,800019fc <_Z11usermainCPPPv+0x1c4>
    putc('5');
    80001934:	03500513          	li	a0,53
    80001938:	00001097          	auipc	ra,0x1
    8000193c:	af0080e7          	jalr	-1296(ra) # 80002428 <_Z4putcc>
    if(ccpp == 's')t2->join();
    80001940:	0000e717          	auipc	a4,0xe
    80001944:	a2074703          	lbu	a4,-1504(a4) # 8000f360 <ccpp>
    80001948:	07300793          	li	a5,115
    8000194c:	0cf70263          	beq	a4,a5,80001a10 <_Z11usermainCPPPv+0x1d8>
    if(ccpp == 's')t1->join();
    80001950:	0000e717          	auipc	a4,0xe
    80001954:	a1074703          	lbu	a4,-1520(a4) # 8000f360 <ccpp>
    80001958:	07300793          	li	a5,115
    8000195c:	0cf70263          	beq	a4,a5,80001a20 <_Z11usermainCPPPv+0x1e8>
    80001960:	02813083          	ld	ra,40(sp)
    80001964:	02013403          	ld	s0,32(sp)
    80001968:	01813483          	ld	s1,24(sp)
    8000196c:	01013903          	ld	s2,16(sp)
    80001970:	00813983          	ld	s3,8(sp)
    80001974:	03010113          	addi	sp,sp,48
    80001978:	00008067          	ret
        sem1cpp = new Semaphore(0);
    8000197c:	01000513          	li	a0,16
    80001980:	00000097          	auipc	ra,0x0
    80001984:	920080e7          	jalr	-1760(ra) # 800012a0 <_Znwm>
    80001988:	00050993          	mv	s3,a0
    8000198c:	00000593          	li	a1,0
    80001990:	00000097          	auipc	ra,0x0
    80001994:	b28080e7          	jalr	-1240(ra) # 800014b8 <_ZN9SemaphoreC1Ej>
    80001998:	0000e797          	auipc	a5,0xe
    8000199c:	9d37b823          	sd	s3,-1584(a5) # 8000f368 <sem1cpp>
        sem2cpp = new Semaphore(0);
    800019a0:	01000513          	li	a0,16
    800019a4:	00000097          	auipc	ra,0x0
    800019a8:	8fc080e7          	jalr	-1796(ra) # 800012a0 <_Znwm>
    800019ac:	00050993          	mv	s3,a0
    800019b0:	00000593          	li	a1,0
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	b04080e7          	jalr	-1276(ra) # 800014b8 <_ZN9SemaphoreC1Ej>
    800019bc:	0000e797          	auipc	a5,0xe
    800019c0:	9b37ba23          	sd	s3,-1612(a5) # 8000f370 <sem2cpp>
    800019c4:	f01ff06f          	j	800018c4 <_Z11usermainCPPPv+0x8c>
    if(ccpp == 's')sem1cpp->wait();
    800019c8:	0000e517          	auipc	a0,0xe
    800019cc:	9a053503          	ld	a0,-1632(a0) # 8000f368 <sem1cpp>
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	b20080e7          	jalr	-1248(ra) # 800014f0 <_ZN9Semaphore4waitEv>
    800019d8:	f15ff06f          	j	800018ec <_Z11usermainCPPPv+0xb4>
    if(ccpp == 't')t2->join();
    800019dc:	00048513          	mv	a0,s1
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	9f0080e7          	jalr	-1552(ra) # 800013d0 <_ZN6Thread4joinEv>
    800019e8:	f21ff06f          	j	80001908 <_Z11usermainCPPPv+0xd0>
    if(ccpp == 't')t1->join();
    800019ec:	00090513          	mv	a0,s2
    800019f0:	00000097          	auipc	ra,0x0
    800019f4:	9e0080e7          	jalr	-1568(ra) # 800013d0 <_ZN6Thread4joinEv>
    800019f8:	f2dff06f          	j	80001924 <_Z11usermainCPPPv+0xec>
    if(ccpp == 's')sem2cpp->wait();
    800019fc:	0000e517          	auipc	a0,0xe
    80001a00:	97453503          	ld	a0,-1676(a0) # 8000f370 <sem2cpp>
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	aec080e7          	jalr	-1300(ra) # 800014f0 <_ZN9Semaphore4waitEv>
    80001a0c:	f29ff06f          	j	80001934 <_Z11usermainCPPPv+0xfc>
    if(ccpp == 's')t2->join();
    80001a10:	00048513          	mv	a0,s1
    80001a14:	00000097          	auipc	ra,0x0
    80001a18:	9bc080e7          	jalr	-1604(ra) # 800013d0 <_ZN6Thread4joinEv>
    80001a1c:	f35ff06f          	j	80001950 <_Z11usermainCPPPv+0x118>
    if(ccpp == 's')t1->join();
    80001a20:	00090513          	mv	a0,s2
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	9ac080e7          	jalr	-1620(ra) # 800013d0 <_ZN6Thread4joinEv>
    80001a2c:	f35ff06f          	j	80001960 <_Z11usermainCPPPv+0x128>
    80001a30:	00050493          	mv	s1,a0
    t1 = new Thread(thread_test_1cpp, 0);
    80001a34:	00090513          	mv	a0,s2
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	890080e7          	jalr	-1904(ra) # 800012c8 <_ZdlPv>
    80001a40:	00048513          	mv	a0,s1
    80001a44:	0000f097          	auipc	ra,0xf
    80001a48:	aa4080e7          	jalr	-1372(ra) # 800104e8 <_Unwind_Resume>
    80001a4c:	00050913          	mv	s2,a0
    t2 = new Thread(thread_test_2cpp, 0);
    80001a50:	00048513          	mv	a0,s1
    80001a54:	00000097          	auipc	ra,0x0
    80001a58:	874080e7          	jalr	-1932(ra) # 800012c8 <_ZdlPv>
    80001a5c:	00090513          	mv	a0,s2
    80001a60:	0000f097          	auipc	ra,0xf
    80001a64:	a88080e7          	jalr	-1400(ra) # 800104e8 <_Unwind_Resume>
    80001a68:	00050493          	mv	s1,a0
        sem1cpp = new Semaphore(0);
    80001a6c:	00098513          	mv	a0,s3
    80001a70:	00000097          	auipc	ra,0x0
    80001a74:	858080e7          	jalr	-1960(ra) # 800012c8 <_ZdlPv>
    80001a78:	00048513          	mv	a0,s1
    80001a7c:	0000f097          	auipc	ra,0xf
    80001a80:	a6c080e7          	jalr	-1428(ra) # 800104e8 <_Unwind_Resume>
    80001a84:	00050493          	mv	s1,a0
        sem2cpp = new Semaphore(0);
    80001a88:	00098513          	mv	a0,s3
    80001a8c:	00000097          	auipc	ra,0x0
    80001a90:	83c080e7          	jalr	-1988(ra) # 800012c8 <_ZdlPv>
    80001a94:	00048513          	mv	a0,s1
    80001a98:	0000f097          	auipc	ra,0xf
    80001a9c:	a50080e7          	jalr	-1456(ra) # 800104e8 <_Unwind_Resume>

0000000080001aa0 <_Z13thread_test_1Pv>:

sem_t sem1, sem2;

char c;

void thread_test_1(void* args){
    80001aa0:	ff010113          	addi	sp,sp,-16
    80001aa4:	00113423          	sd	ra,8(sp)
    80001aa8:	00813023          	sd	s0,0(sp)
    80001aac:	01010413          	addi	s0,sp,16
    putc('1');
    80001ab0:	03100513          	li	a0,49
    80001ab4:	00001097          	auipc	ra,0x1
    80001ab8:	974080e7          	jalr	-1676(ra) # 80002428 <_Z4putcc>
    putc('s');
    80001abc:	07300513          	li	a0,115
    80001ac0:	00001097          	auipc	ra,0x1
    80001ac4:	968080e7          	jalr	-1688(ra) # 80002428 <_Z4putcc>
    if(c == 't')time_sleep(60);
    80001ac8:	0000e717          	auipc	a4,0xe
    80001acc:	8b074703          	lbu	a4,-1872(a4) # 8000f378 <c>
    80001ad0:	07400793          	li	a5,116
    80001ad4:	02f70e63          	beq	a4,a5,80001b10 <_Z13thread_test_1Pv+0x70>
    putc('1');
    80001ad8:	03100513          	li	a0,49
    80001adc:	00001097          	auipc	ra,0x1
    80001ae0:	94c080e7          	jalr	-1716(ra) # 80002428 <_Z4putcc>
    if(c == 's')sem_signal(sem1);
    80001ae4:	0000e717          	auipc	a4,0xe
    80001ae8:	89474703          	lbu	a4,-1900(a4) # 8000f378 <c>
    80001aec:	07300793          	li	a5,115
    80001af0:	02f70863          	beq	a4,a5,80001b20 <_Z13thread_test_1Pv+0x80>
    putc('S');
    80001af4:	05300513          	li	a0,83
    80001af8:	00001097          	auipc	ra,0x1
    80001afc:	930080e7          	jalr	-1744(ra) # 80002428 <_Z4putcc>
}
    80001b00:	00813083          	ld	ra,8(sp)
    80001b04:	00013403          	ld	s0,0(sp)
    80001b08:	01010113          	addi	sp,sp,16
    80001b0c:	00008067          	ret
    if(c == 't')time_sleep(60);
    80001b10:	03c00513          	li	a0,60
    80001b14:	00000097          	auipc	ra,0x0
    80001b18:	7a8080e7          	jalr	1960(ra) # 800022bc <_Z10time_sleepm>
    80001b1c:	fbdff06f          	j	80001ad8 <_Z13thread_test_1Pv+0x38>
    if(c == 's')sem_signal(sem1);
    80001b20:	0000e517          	auipc	a0,0xe
    80001b24:	86053503          	ld	a0,-1952(a0) # 8000f380 <sem1>
    80001b28:	00001097          	auipc	ra,0x1
    80001b2c:	850080e7          	jalr	-1968(ra) # 80002378 <_Z10sem_signalP4_sem>
    80001b30:	fc5ff06f          	j	80001af4 <_Z13thread_test_1Pv+0x54>

0000000080001b34 <_Z13thread_test_2Pv>:

void thread_test_2(void* args){
    80001b34:	ff010113          	addi	sp,sp,-16
    80001b38:	00113423          	sd	ra,8(sp)
    80001b3c:	00813023          	sd	s0,0(sp)
    80001b40:	01010413          	addi	s0,sp,16
    putc('2');
    80001b44:	03200513          	li	a0,50
    80001b48:	00001097          	auipc	ra,0x1
    80001b4c:	8e0080e7          	jalr	-1824(ra) # 80002428 <_Z4putcc>
    putc('s');
    80001b50:	07300513          	li	a0,115
    80001b54:	00001097          	auipc	ra,0x1
    80001b58:	8d4080e7          	jalr	-1836(ra) # 80002428 <_Z4putcc>
    if(c == 't')time_sleep(30);
    80001b5c:	0000e717          	auipc	a4,0xe
    80001b60:	81c74703          	lbu	a4,-2020(a4) # 8000f378 <c>
    80001b64:	07400793          	li	a5,116
    80001b68:	02f70e63          	beq	a4,a5,80001ba4 <_Z13thread_test_2Pv+0x70>
    putc('2');
    80001b6c:	03200513          	li	a0,50
    80001b70:	00001097          	auipc	ra,0x1
    80001b74:	8b8080e7          	jalr	-1864(ra) # 80002428 <_Z4putcc>
    if(c == 's')sem_signal(sem2);
    80001b78:	0000e717          	auipc	a4,0xe
    80001b7c:	80074703          	lbu	a4,-2048(a4) # 8000f378 <c>
    80001b80:	07300793          	li	a5,115
    80001b84:	02f70863          	beq	a4,a5,80001bb4 <_Z13thread_test_2Pv+0x80>
    putc('S');
    80001b88:	05300513          	li	a0,83
    80001b8c:	00001097          	auipc	ra,0x1
    80001b90:	89c080e7          	jalr	-1892(ra) # 80002428 <_Z4putcc>
}
    80001b94:	00813083          	ld	ra,8(sp)
    80001b98:	00013403          	ld	s0,0(sp)
    80001b9c:	01010113          	addi	sp,sp,16
    80001ba0:	00008067          	ret
    if(c == 't')time_sleep(30);
    80001ba4:	01e00513          	li	a0,30
    80001ba8:	00000097          	auipc	ra,0x0
    80001bac:	714080e7          	jalr	1812(ra) # 800022bc <_Z10time_sleepm>
    80001bb0:	fbdff06f          	j	80001b6c <_Z13thread_test_2Pv+0x38>
    if(c == 's')sem_signal(sem2);
    80001bb4:	0000d517          	auipc	a0,0xd
    80001bb8:	7d453503          	ld	a0,2004(a0) # 8000f388 <sem2>
    80001bbc:	00000097          	auipc	ra,0x0
    80001bc0:	7bc080e7          	jalr	1980(ra) # 80002378 <_Z10sem_signalP4_sem>
    80001bc4:	fc5ff06f          	j	80001b88 <_Z13thread_test_2Pv+0x54>

0000000080001bc8 <_Z7memTestv>:
void memTest(){
    80001bc8:	fd010113          	addi	sp,sp,-48
    80001bcc:	02113423          	sd	ra,40(sp)
    80001bd0:	02813023          	sd	s0,32(sp)
    80001bd4:	00913c23          	sd	s1,24(sp)
    80001bd8:	01213823          	sd	s2,16(sp)
    80001bdc:	01313423          	sd	s3,8(sp)
    80001be0:	01413023          	sd	s4,0(sp)
    80001be4:	03010413          	addi	s0,sp,48
    uint64 freeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80001be8:	0000d797          	auipc	a5,0xd
    80001bec:	7087b783          	ld	a5,1800(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001bf0:	0007b503          	ld	a0,0(a5)
    80001bf4:	00002097          	auipc	ra,0x2
    80001bf8:	994080e7          	jalr	-1644(ra) # 80003588 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80001bfc:	00050993          	mv	s3,a0
    putc('F');
    80001c00:	04600513          	li	a0,70
    80001c04:	00001097          	auipc	ra,0x1
    80001c08:	824080e7          	jalr	-2012(ra) # 80002428 <_Z4putcc>
    putc('r');
    80001c0c:	07200513          	li	a0,114
    80001c10:	00001097          	auipc	ra,0x1
    80001c14:	818080e7          	jalr	-2024(ra) # 80002428 <_Z4putcc>
    putc('e');
    80001c18:	06500513          	li	a0,101
    80001c1c:	00001097          	auipc	ra,0x1
    80001c20:	80c080e7          	jalr	-2036(ra) # 80002428 <_Z4putcc>
    putc('e');
    80001c24:	06500513          	li	a0,101
    80001c28:	00001097          	auipc	ra,0x1
    80001c2c:	800080e7          	jalr	-2048(ra) # 80002428 <_Z4putcc>
    putc(' ');
    80001c30:	02000513          	li	a0,32
    80001c34:	00000097          	auipc	ra,0x0
    80001c38:	7f4080e7          	jalr	2036(ra) # 80002428 <_Z4putcc>
    putc('m');
    80001c3c:	06d00513          	li	a0,109
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	7e8080e7          	jalr	2024(ra) # 80002428 <_Z4putcc>
    putc('e');
    80001c48:	06500513          	li	a0,101
    80001c4c:	00000097          	auipc	ra,0x0
    80001c50:	7dc080e7          	jalr	2012(ra) # 80002428 <_Z4putcc>
    putc('m');
    80001c54:	06d00513          	li	a0,109
    80001c58:	00000097          	auipc	ra,0x0
    80001c5c:	7d0080e7          	jalr	2000(ra) # 80002428 <_Z4putcc>
    putc('o');
    80001c60:	06f00513          	li	a0,111
    80001c64:	00000097          	auipc	ra,0x0
    80001c68:	7c4080e7          	jalr	1988(ra) # 80002428 <_Z4putcc>
    putc('r');
    80001c6c:	07200513          	li	a0,114
    80001c70:	00000097          	auipc	ra,0x0
    80001c74:	7b8080e7          	jalr	1976(ra) # 80002428 <_Z4putcc>
    putc('y');
    80001c78:	07900513          	li	a0,121
    80001c7c:	00000097          	auipc	ra,0x0
    80001c80:	7ac080e7          	jalr	1964(ra) # 80002428 <_Z4putcc>
    putc(':');
    80001c84:	03a00513          	li	a0,58
    80001c88:	00000097          	auipc	ra,0x0
    80001c8c:	7a0080e7          	jalr	1952(ra) # 80002428 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001c90:	00f00493          	li	s1,15
    80001c94:	0140006f          	j	80001ca8 <_Z7memTestv+0xe0>
            putc('a' + digit - 10);
    80001c98:	05750513          	addi	a0,a0,87
    80001c9c:	00000097          	auipc	ra,0x0
    80001ca0:	78c080e7          	jalr	1932(ra) # 80002428 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001ca4:	fff4849b          	addiw	s1,s1,-1
    80001ca8:	0204c463          	bltz	s1,80001cd0 <_Z7memTestv+0x108>
        int digit = (freeMemory >> (i * 4)) & 0xf;
    80001cac:	0024951b          	slliw	a0,s1,0x2
    80001cb0:	00a9d533          	srl	a0,s3,a0
    80001cb4:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80001cb8:	00900793          	li	a5,9
    80001cbc:	fca7cee3          	blt	a5,a0,80001c98 <_Z7memTestv+0xd0>
            putc('0' + digit);
    80001cc0:	03050513          	addi	a0,a0,48
    80001cc4:	00000097          	auipc	ra,0x0
    80001cc8:	764080e7          	jalr	1892(ra) # 80002428 <_Z4putcc>
    80001ccc:	fd9ff06f          	j	80001ca4 <_Z7memTestv+0xdc>
    putc('\n');
    80001cd0:	00a00513          	li	a0,10
    80001cd4:	00000097          	auipc	ra,0x0
    80001cd8:	754080e7          	jalr	1876(ra) # 80002428 <_Z4putcc>
    int** matrix = (int**)mem_alloc(sizeof(int*) * n);
    80001cdc:	32000513          	li	a0,800
    80001ce0:	00000097          	auipc	ra,0x0
    80001ce4:	4a0080e7          	jalr	1184(ra) # 80002180 <_Z9mem_allocm>
    80001ce8:	00050913          	mv	s2,a0
    for(int i = 0; i < n; i++){
    80001cec:	00000493          	li	s1,0
    80001cf0:	0080006f          	j	80001cf8 <_Z7memTestv+0x130>
    80001cf4:	0014849b          	addiw	s1,s1,1
    80001cf8:	06300793          	li	a5,99
    80001cfc:	0497c663          	blt	a5,s1,80001d48 <_Z7memTestv+0x180>
        matrix[i] = (int*)mem_alloc(sizeof(int) * k);
    80001d00:	00349a13          	slli	s4,s1,0x3
    80001d04:	01490a33          	add	s4,s2,s4
    80001d08:	19000513          	li	a0,400
    80001d0c:	00000097          	auipc	ra,0x0
    80001d10:	474080e7          	jalr	1140(ra) # 80002180 <_Z9mem_allocm>
    80001d14:	00aa3023          	sd	a0,0(s4)
        for(int j = 0; j < k; j++){
    80001d18:	00000713          	li	a4,0
    80001d1c:	06300793          	li	a5,99
    80001d20:	fce7cae3          	blt	a5,a4,80001cf4 <_Z7memTestv+0x12c>
            matrix[i][j] = i * k + j;
    80001d24:	06400793          	li	a5,100
    80001d28:	029787bb          	mulw	a5,a5,s1
    80001d2c:	000a3683          	ld	a3,0(s4)
    80001d30:	00271613          	slli	a2,a4,0x2
    80001d34:	00c686b3          	add	a3,a3,a2
    80001d38:	00e787bb          	addw	a5,a5,a4
    80001d3c:	00f6a023          	sw	a5,0(a3)
        for(int j = 0; j < k; j++){
    80001d40:	0017071b          	addiw	a4,a4,1
    80001d44:	fd9ff06f          	j	80001d1c <_Z7memTestv+0x154>
    for(int i = 0; i < n; i++){
    80001d48:	00000a13          	li	s4,0
    80001d4c:	0780006f          	j	80001dc4 <_Z7memTestv+0x1fc>
        for(int j = 0; j < k; j++){
    80001d50:	0014849b          	addiw	s1,s1,1
    80001d54:	06300793          	li	a5,99
    80001d58:	0497ca63          	blt	a5,s1,80001dac <_Z7memTestv+0x1e4>
            assert(matrix[i][j] == i * k + j);
    80001d5c:	003a1793          	slli	a5,s4,0x3
    80001d60:	00f907b3          	add	a5,s2,a5
    80001d64:	0007b783          	ld	a5,0(a5)
    80001d68:	00249713          	slli	a4,s1,0x2
    80001d6c:	00e787b3          	add	a5,a5,a4
    80001d70:	0007a703          	lw	a4,0(a5)
    80001d74:	06400793          	li	a5,100
    80001d78:	034787bb          	mulw	a5,a5,s4
    80001d7c:	009787bb          	addw	a5,a5,s1
    80001d80:	fcf708e3          	beq	a4,a5,80001d50 <_Z7memTestv+0x188>
    80001d84:	0000a697          	auipc	a3,0xa
    80001d88:	29c68693          	addi	a3,a3,668 # 8000c020 <CONSOLE_STATUS+0x10>
    80001d8c:	02d00613          	li	a2,45
    80001d90:	0000a597          	auipc	a1,0xa
    80001d94:	2a058593          	addi	a1,a1,672 # 8000c030 <CONSOLE_STATUS+0x20>
    80001d98:	0000a517          	auipc	a0,0xa
    80001d9c:	2b050513          	addi	a0,a0,688 # 8000c048 <CONSOLE_STATUS+0x38>
    80001da0:	00004097          	auipc	ra,0x4
    80001da4:	97c080e7          	jalr	-1668(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    80001da8:	fa9ff06f          	j	80001d50 <_Z7memTestv+0x188>
        mem_free(matrix[i]);
    80001dac:	003a1793          	slli	a5,s4,0x3
    80001db0:	00f907b3          	add	a5,s2,a5
    80001db4:	0007b503          	ld	a0,0(a5)
    80001db8:	00000097          	auipc	ra,0x0
    80001dbc:	3f8080e7          	jalr	1016(ra) # 800021b0 <_Z8mem_freePv>
    for(int i = 0; i < n; i++){
    80001dc0:	001a0a1b          	addiw	s4,s4,1
    80001dc4:	06300793          	li	a5,99
    80001dc8:	0147c663          	blt	a5,s4,80001dd4 <_Z7memTestv+0x20c>
        for(int j = 0; j < k; j++){
    80001dcc:	00000493          	li	s1,0
    80001dd0:	f85ff06f          	j	80001d54 <_Z7memTestv+0x18c>
    mem_free(matrix);
    80001dd4:	00090513          	mv	a0,s2
    80001dd8:	00000097          	auipc	ra,0x0
    80001ddc:	3d8080e7          	jalr	984(ra) # 800021b0 <_Z8mem_freePv>
    uint64 newFreeMemory = HeapManager::getInstance().getHeapFreeMemory();
    80001de0:	0000d797          	auipc	a5,0xd
    80001de4:	5107b783          	ld	a5,1296(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001de8:	0007b503          	ld	a0,0(a5)
    80001dec:	00001097          	auipc	ra,0x1
    80001df0:	79c080e7          	jalr	1948(ra) # 80003588 <_ZN11HeapManager17getHeapFreeMemoryEv>
    80001df4:	00050493          	mv	s1,a0
    putc('F');
    80001df8:	04600513          	li	a0,70
    80001dfc:	00000097          	auipc	ra,0x0
    80001e00:	62c080e7          	jalr	1580(ra) # 80002428 <_Z4putcc>
    putc('r');
    80001e04:	07200513          	li	a0,114
    80001e08:	00000097          	auipc	ra,0x0
    80001e0c:	620080e7          	jalr	1568(ra) # 80002428 <_Z4putcc>
    putc('e');
    80001e10:	06500513          	li	a0,101
    80001e14:	00000097          	auipc	ra,0x0
    80001e18:	614080e7          	jalr	1556(ra) # 80002428 <_Z4putcc>
    putc('e');
    80001e1c:	06500513          	li	a0,101
    80001e20:	00000097          	auipc	ra,0x0
    80001e24:	608080e7          	jalr	1544(ra) # 80002428 <_Z4putcc>
    putc(' ');
    80001e28:	02000513          	li	a0,32
    80001e2c:	00000097          	auipc	ra,0x0
    80001e30:	5fc080e7          	jalr	1532(ra) # 80002428 <_Z4putcc>
    putc('m');
    80001e34:	06d00513          	li	a0,109
    80001e38:	00000097          	auipc	ra,0x0
    80001e3c:	5f0080e7          	jalr	1520(ra) # 80002428 <_Z4putcc>
    putc('e');
    80001e40:	06500513          	li	a0,101
    80001e44:	00000097          	auipc	ra,0x0
    80001e48:	5e4080e7          	jalr	1508(ra) # 80002428 <_Z4putcc>
    putc('m');
    80001e4c:	06d00513          	li	a0,109
    80001e50:	00000097          	auipc	ra,0x0
    80001e54:	5d8080e7          	jalr	1496(ra) # 80002428 <_Z4putcc>
    putc('o');
    80001e58:	06f00513          	li	a0,111
    80001e5c:	00000097          	auipc	ra,0x0
    80001e60:	5cc080e7          	jalr	1484(ra) # 80002428 <_Z4putcc>
    putc('r');
    80001e64:	07200513          	li	a0,114
    80001e68:	00000097          	auipc	ra,0x0
    80001e6c:	5c0080e7          	jalr	1472(ra) # 80002428 <_Z4putcc>
    putc('y');
    80001e70:	07900513          	li	a0,121
    80001e74:	00000097          	auipc	ra,0x0
    80001e78:	5b4080e7          	jalr	1460(ra) # 80002428 <_Z4putcc>
    putc(':');
    80001e7c:	03a00513          	li	a0,58
    80001e80:	00000097          	auipc	ra,0x0
    80001e84:	5a8080e7          	jalr	1448(ra) # 80002428 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001e88:	00f00913          	li	s2,15
    80001e8c:	0140006f          	j	80001ea0 <_Z7memTestv+0x2d8>
            putc('a' + digit - 10);
    80001e90:	05750513          	addi	a0,a0,87
    80001e94:	00000097          	auipc	ra,0x0
    80001e98:	594080e7          	jalr	1428(ra) # 80002428 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001e9c:	fff9091b          	addiw	s2,s2,-1
    80001ea0:	02094463          	bltz	s2,80001ec8 <_Z7memTestv+0x300>
        int digit = (newFreeMemory >> (i * 4)) & 0xf;
    80001ea4:	0029151b          	slliw	a0,s2,0x2
    80001ea8:	00a4d533          	srl	a0,s1,a0
    80001eac:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80001eb0:	00900793          	li	a5,9
    80001eb4:	fca7cee3          	blt	a5,a0,80001e90 <_Z7memTestv+0x2c8>
            putc('0' + digit);
    80001eb8:	03050513          	addi	a0,a0,48
    80001ebc:	00000097          	auipc	ra,0x0
    80001ec0:	56c080e7          	jalr	1388(ra) # 80002428 <_Z4putcc>
    80001ec4:	fd9ff06f          	j	80001e9c <_Z7memTestv+0x2d4>
    putc('\n');
    80001ec8:	00a00513          	li	a0,10
    80001ecc:	00000097          	auipc	ra,0x0
    80001ed0:	55c080e7          	jalr	1372(ra) # 80002428 <_Z4putcc>
    uint64 difference = freeMemory - newFreeMemory;
    80001ed4:	409989b3          	sub	s3,s3,s1
    putc('D');
    80001ed8:	04400513          	li	a0,68
    80001edc:	00000097          	auipc	ra,0x0
    80001ee0:	54c080e7          	jalr	1356(ra) # 80002428 <_Z4putcc>
    putc('i');
    80001ee4:	06900513          	li	a0,105
    80001ee8:	00000097          	auipc	ra,0x0
    80001eec:	540080e7          	jalr	1344(ra) # 80002428 <_Z4putcc>
    putc('f');
    80001ef0:	06600513          	li	a0,102
    80001ef4:	00000097          	auipc	ra,0x0
    80001ef8:	534080e7          	jalr	1332(ra) # 80002428 <_Z4putcc>
    putc('f');
    80001efc:	06600513          	li	a0,102
    80001f00:	00000097          	auipc	ra,0x0
    80001f04:	528080e7          	jalr	1320(ra) # 80002428 <_Z4putcc>
    putc('e');
    80001f08:	06500513          	li	a0,101
    80001f0c:	00000097          	auipc	ra,0x0
    80001f10:	51c080e7          	jalr	1308(ra) # 80002428 <_Z4putcc>
    putc('r');
    80001f14:	07200513          	li	a0,114
    80001f18:	00000097          	auipc	ra,0x0
    80001f1c:	510080e7          	jalr	1296(ra) # 80002428 <_Z4putcc>
    putc('e');
    80001f20:	06500513          	li	a0,101
    80001f24:	00000097          	auipc	ra,0x0
    80001f28:	504080e7          	jalr	1284(ra) # 80002428 <_Z4putcc>
    putc('n');
    80001f2c:	06e00513          	li	a0,110
    80001f30:	00000097          	auipc	ra,0x0
    80001f34:	4f8080e7          	jalr	1272(ra) # 80002428 <_Z4putcc>
    putc('c');
    80001f38:	06300513          	li	a0,99
    80001f3c:	00000097          	auipc	ra,0x0
    80001f40:	4ec080e7          	jalr	1260(ra) # 80002428 <_Z4putcc>
    putc('e');
    80001f44:	06500513          	li	a0,101
    80001f48:	00000097          	auipc	ra,0x0
    80001f4c:	4e0080e7          	jalr	1248(ra) # 80002428 <_Z4putcc>
    putc(':');
    80001f50:	03a00513          	li	a0,58
    80001f54:	00000097          	auipc	ra,0x0
    80001f58:	4d4080e7          	jalr	1236(ra) # 80002428 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001f5c:	00f00493          	li	s1,15
    80001f60:	0140006f          	j	80001f74 <_Z7memTestv+0x3ac>
            putc('a' + digit - 10);
    80001f64:	05750513          	addi	a0,a0,87
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	4c0080e7          	jalr	1216(ra) # 80002428 <_Z4putcc>
    for(int i=15; i >= 0;i--){
    80001f70:	fff4849b          	addiw	s1,s1,-1
    80001f74:	0204c463          	bltz	s1,80001f9c <_Z7memTestv+0x3d4>
        int digit = (difference >> (i * 4)) & 0xf;
    80001f78:	0024951b          	slliw	a0,s1,0x2
    80001f7c:	00a9d533          	srl	a0,s3,a0
    80001f80:	00f57513          	andi	a0,a0,15
        if(digit < 10){
    80001f84:	00900793          	li	a5,9
    80001f88:	fca7cee3          	blt	a5,a0,80001f64 <_Z7memTestv+0x39c>
            putc('0' + digit);
    80001f8c:	03050513          	addi	a0,a0,48
    80001f90:	00000097          	auipc	ra,0x0
    80001f94:	498080e7          	jalr	1176(ra) # 80002428 <_Z4putcc>
    80001f98:	fd9ff06f          	j	80001f70 <_Z7memTestv+0x3a8>
    putc('\n');
    80001f9c:	00a00513          	li	a0,10
    80001fa0:	00000097          	auipc	ra,0x0
    80001fa4:	488080e7          	jalr	1160(ra) # 80002428 <_Z4putcc>
    putc('\n');
    80001fa8:	00a00513          	li	a0,10
    80001fac:	00000097          	auipc	ra,0x0
    80001fb0:	47c080e7          	jalr	1148(ra) # 80002428 <_Z4putcc>
    putc('\n');
    80001fb4:	00a00513          	li	a0,10
    80001fb8:	00000097          	auipc	ra,0x0
    80001fbc:	470080e7          	jalr	1136(ra) # 80002428 <_Z4putcc>
}
    80001fc0:	02813083          	ld	ra,40(sp)
    80001fc4:	02013403          	ld	s0,32(sp)
    80001fc8:	01813483          	ld	s1,24(sp)
    80001fcc:	01013903          	ld	s2,16(sp)
    80001fd0:	00813983          	ld	s3,8(sp)
    80001fd4:	00013a03          	ld	s4,0(sp)
    80001fd8:	03010113          	addi	sp,sp,48
    80001fdc:	00008067          	ret

0000000080001fe0 <_Z8usermainPv>:


void usermain(void* arg){
    80001fe0:	fd010113          	addi	sp,sp,-48
    80001fe4:	02113423          	sd	ra,40(sp)
    80001fe8:	02813023          	sd	s0,32(sp)
    80001fec:	00913c23          	sd	s1,24(sp)
    80001ff0:	03010413          	addi	s0,sp,48
    c = 't';
    80001ff4:	0000d497          	auipc	s1,0xd
    80001ff8:	38448493          	addi	s1,s1,900 # 8000f378 <c>
    80001ffc:	07400793          	li	a5,116
    80002000:	00f48023          	sb	a5,0(s1)
    if(c == 'm'){
        memTest();
        return;
    }
    putc('0');
    80002004:	03000513          	li	a0,48
    80002008:	00000097          	auipc	ra,0x0
    8000200c:	420080e7          	jalr	1056(ra) # 80002428 <_Z4putcc>
    thread_t t1, t2;
    if(c == 's'){
    80002010:	0004c703          	lbu	a4,0(s1)
    80002014:	07300793          	li	a5,115
    80002018:	0cf70663          	beq	a4,a5,800020e4 <_Z8usermainPv+0x104>
        sem_open(&sem1, 0);
        sem_open(&sem2, 0);
    }
    thread_create(&t1, thread_test_1, 0);
    8000201c:	00000613          	li	a2,0
    80002020:	00000597          	auipc	a1,0x0
    80002024:	a8058593          	addi	a1,a1,-1408 # 80001aa0 <_Z13thread_test_1Pv>
    80002028:	fd840513          	addi	a0,s0,-40
    8000202c:	00000097          	auipc	ra,0x0
    80002030:	1b0080e7          	jalr	432(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, thread_test_2, 0);
    80002034:	00000613          	li	a2,0
    80002038:	00000597          	auipc	a1,0x0
    8000203c:	afc58593          	addi	a1,a1,-1284 # 80001b34 <_Z13thread_test_2Pv>
    80002040:	fd040513          	addi	a0,s0,-48
    80002044:	00000097          	auipc	ra,0x0
    80002048:	198080e7          	jalr	408(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    if(c == 's')sem_wait(sem1);
    8000204c:	0000d717          	auipc	a4,0xd
    80002050:	32c74703          	lbu	a4,812(a4) # 8000f378 <c>
    80002054:	07300793          	li	a5,115
    80002058:	0af70c63          	beq	a4,a5,80002110 <_Z8usermainPv+0x130>
    putc('3');
    8000205c:	03300513          	li	a0,51
    80002060:	00000097          	auipc	ra,0x0
    80002064:	3c8080e7          	jalr	968(ra) # 80002428 <_Z4putcc>
    if(c == 't')thread_join(t2);
    80002068:	0000d717          	auipc	a4,0xd
    8000206c:	31074703          	lbu	a4,784(a4) # 8000f378 <c>
    80002070:	07400793          	li	a5,116
    80002074:	0af70863          	beq	a4,a5,80002124 <_Z8usermainPv+0x144>
    putc('4');
    80002078:	03400513          	li	a0,52
    8000207c:	00000097          	auipc	ra,0x0
    80002080:	3ac080e7          	jalr	940(ra) # 80002428 <_Z4putcc>
    if(c == 't')thread_join(t1);
    80002084:	0000d717          	auipc	a4,0xd
    80002088:	2f474703          	lbu	a4,756(a4) # 8000f378 <c>
    8000208c:	07400793          	li	a5,116
    80002090:	0af70263          	beq	a4,a5,80002134 <_Z8usermainPv+0x154>
    if(c == 's')sem_wait(sem2);
    80002094:	0000d717          	auipc	a4,0xd
    80002098:	2e474703          	lbu	a4,740(a4) # 8000f378 <c>
    8000209c:	07300793          	li	a5,115
    800020a0:	0af70263          	beq	a4,a5,80002144 <_Z8usermainPv+0x164>
    putc('5');
    800020a4:	03500513          	li	a0,53
    800020a8:	00000097          	auipc	ra,0x0
    800020ac:	380080e7          	jalr	896(ra) # 80002428 <_Z4putcc>
    if(c == 's')sem_close(sem1);
    800020b0:	0000d717          	auipc	a4,0xd
    800020b4:	2c874703          	lbu	a4,712(a4) # 8000f378 <c>
    800020b8:	07300793          	li	a5,115
    800020bc:	08f70e63          	beq	a4,a5,80002158 <_Z8usermainPv+0x178>
    if(c == 's')sem_close(sem2);
    800020c0:	0000d717          	auipc	a4,0xd
    800020c4:	2b874703          	lbu	a4,696(a4) # 8000f378 <c>
    800020c8:	07300793          	li	a5,115
    800020cc:	0af70063          	beq	a4,a5,8000216c <_Z8usermainPv+0x18c>
    800020d0:	02813083          	ld	ra,40(sp)
    800020d4:	02013403          	ld	s0,32(sp)
    800020d8:	01813483          	ld	s1,24(sp)
    800020dc:	03010113          	addi	sp,sp,48
    800020e0:	00008067          	ret
        sem_open(&sem1, 0);
    800020e4:	00000593          	li	a1,0
    800020e8:	0000d517          	auipc	a0,0xd
    800020ec:	29850513          	addi	a0,a0,664 # 8000f380 <sem1>
    800020f0:	00000097          	auipc	ra,0x0
    800020f4:	1f8080e7          	jalr	504(ra) # 800022e8 <_Z8sem_openPP4_semj>
        sem_open(&sem2, 0);
    800020f8:	00000593          	li	a1,0
    800020fc:	0000d517          	auipc	a0,0xd
    80002100:	28c50513          	addi	a0,a0,652 # 8000f388 <sem2>
    80002104:	00000097          	auipc	ra,0x0
    80002108:	1e4080e7          	jalr	484(ra) # 800022e8 <_Z8sem_openPP4_semj>
    8000210c:	f11ff06f          	j	8000201c <_Z8usermainPv+0x3c>
    if(c == 's')sem_wait(sem1);
    80002110:	0000d517          	auipc	a0,0xd
    80002114:	27053503          	ld	a0,624(a0) # 8000f380 <sem1>
    80002118:	00000097          	auipc	ra,0x0
    8000211c:	234080e7          	jalr	564(ra) # 8000234c <_Z8sem_waitP4_sem>
    80002120:	f3dff06f          	j	8000205c <_Z8usermainPv+0x7c>
    if(c == 't')thread_join(t2);
    80002124:	fd043503          	ld	a0,-48(s0)
    80002128:	00000097          	auipc	ra,0x0
    8000212c:	170080e7          	jalr	368(ra) # 80002298 <_Z11thread_joinP7_thread>
    80002130:	f49ff06f          	j	80002078 <_Z8usermainPv+0x98>
    if(c == 't')thread_join(t1);
    80002134:	fd843503          	ld	a0,-40(s0)
    80002138:	00000097          	auipc	ra,0x0
    8000213c:	160080e7          	jalr	352(ra) # 80002298 <_Z11thread_joinP7_thread>
    80002140:	f55ff06f          	j	80002094 <_Z8usermainPv+0xb4>
    if(c == 's')sem_wait(sem2);
    80002144:	0000d517          	auipc	a0,0xd
    80002148:	24453503          	ld	a0,580(a0) # 8000f388 <sem2>
    8000214c:	00000097          	auipc	ra,0x0
    80002150:	200080e7          	jalr	512(ra) # 8000234c <_Z8sem_waitP4_sem>
    80002154:	f51ff06f          	j	800020a4 <_Z8usermainPv+0xc4>
    if(c == 's')sem_close(sem1);
    80002158:	0000d517          	auipc	a0,0xd
    8000215c:	22853503          	ld	a0,552(a0) # 8000f380 <sem1>
    80002160:	00000097          	auipc	ra,0x0
    80002164:	1c0080e7          	jalr	448(ra) # 80002320 <_Z9sem_closeP4_sem>
    80002168:	f59ff06f          	j	800020c0 <_Z8usermainPv+0xe0>
    if(c == 's')sem_close(sem2);
    8000216c:	0000d517          	auipc	a0,0xd
    80002170:	21c53503          	ld	a0,540(a0) # 8000f388 <sem2>
    80002174:	00000097          	auipc	ra,0x0
    80002178:	1ac080e7          	jalr	428(ra) # 80002320 <_Z9sem_closeP4_sem>
    8000217c:	f55ff06f          	j	800020d0 <_Z8usermainPv+0xf0>

0000000080002180 <_Z9mem_allocm>:
 * 
 */

#include "syscall_c.h"
#include "consoleManager.h"
void* mem_alloc ( size_t nSize ){
    80002180:	ff010113          	addi	sp,sp,-16
    80002184:	00813423          	sd	s0,8(sp)
    80002188:	01010413          	addi	s0,sp,16
    /// round nSize to the next multiple of MEM_BLOCK_SIZE and then divide by MEM_BLOCK_SIZE
    nSize = (nSize + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    8000218c:	03f50513          	addi	a0,a0,63
    80002190:	00655513          	srli	a0,a0,0x6
    __asm__ volatile ("mv a1, %0" :: "r"(nSize));
    80002194:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x1");
    80002198:	00100513          	li	a0,1
    __asm__ volatile ("ecall");
    8000219c:	00000073          	ecall
    uint64 pAddress;
    __asm__ volatile ("mv %0, a0" : "=r"(pAddress));
    800021a0:	00050513          	mv	a0,a0
    return (void*)pAddress;
}
    800021a4:	00813403          	ld	s0,8(sp)
    800021a8:	01010113          	addi	sp,sp,16
    800021ac:	00008067          	ret

00000000800021b0 <_Z8mem_freePv>:

int mem_free ( void* pAddress ){
    800021b0:	ff010113          	addi	sp,sp,-16
    800021b4:	00813423          	sd	s0,8(sp)
    800021b8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" :: "r"(pAddress));
    800021bc:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x2");
    800021c0:	00200513          	li	a0,2
    __asm__ volatile ("ecall");
    800021c4:	00000073          	ecall
    int nResult;
    __asm__ volatile ("mv %0, a0" : "=r"(nResult));
    800021c8:	00050513          	mv	a0,a0
    return nResult;

}
    800021cc:	0005051b          	sext.w	a0,a0
    800021d0:	00813403          	ld	s0,8(sp)
    800021d4:	01010113          	addi	sp,sp,16
    800021d8:	00008067          	ret

00000000800021dc <_Z13thread_createPP7_threadPFvPvES2_>:


int thread_create ( thread_t* handle, void(*function)(void*), void* arg ) {
    800021dc:	fd010113          	addi	sp,sp,-48
    800021e0:	02113423          	sd	ra,40(sp)
    800021e4:	02813023          	sd	s0,32(sp)
    800021e8:	00913c23          	sd	s1,24(sp)
    800021ec:	01213823          	sd	s2,16(sp)
    800021f0:	01313423          	sd	s3,8(sp)
    800021f4:	03010413          	addi	s0,sp,48
    800021f8:	00050493          	mv	s1,a0
    800021fc:	00058913          	mv	s2,a1
    80002200:	00060993          	mv	s3,a2
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE * 16);
    80002204:	00010537          	lui	a0,0x10
    80002208:	00000097          	auipc	ra,0x0
    8000220c:	f78080e7          	jalr	-136(ra) # 80002180 <_Z9mem_allocm>
    /// now we move the pointer up, since SP points to the first free location, and grows down
    __asm__ volatile ("mv a4, %0" : : "r"((uint64)stack_space + DEFAULT_STACK_SIZE));
    80002210:	000017b7          	lui	a5,0x1
    80002214:	00f50533          	add	a0,a0,a5
    80002218:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0" : : "r" ((uint64)arg));
    8000221c:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2,%0" : : "r" ((uint64)function));
    80002220:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1,%0" : : "r" ((uint64)handle));
    80002224:	00048593          	mv	a1,s1
    __asm__ volatile("li a0,0x11");
    80002228:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    8000222c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80002230:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80002234:	0005051b          	sext.w	a0,a0
    80002238:	02813083          	ld	ra,40(sp)
    8000223c:	02013403          	ld	s0,32(sp)
    80002240:	01813483          	ld	s1,24(sp)
    80002244:	01013903          	ld	s2,16(sp)
    80002248:	00813983          	ld	s3,8(sp)
    8000224c:	03010113          	addi	sp,sp,48
    80002250:	00008067          	ret

0000000080002254 <_Z11thread_exitv>:

int thread_exit (){
    80002254:	ff010113          	addi	sp,sp,-16
    80002258:	00813423          	sd	s0,8(sp)
    8000225c:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x12");
    80002260:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80002264:	00000073          	ecall
    return 0;
}
    80002268:	00000513          	li	a0,0
    8000226c:	00813403          	ld	s0,8(sp)
    80002270:	01010113          	addi	sp,sp,16
    80002274:	00008067          	ret

0000000080002278 <_Z15thread_dispatchv>:

void thread_dispatch () {
    80002278:	ff010113          	addi	sp,sp,-16
    8000227c:	00813423          	sd	s0,8(sp)
    80002280:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0x13");
    80002284:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    80002288:	00000073          	ecall
}
    8000228c:	00813403          	ld	s0,8(sp)
    80002290:	01010113          	addi	sp,sp,16
    80002294:	00008067          	ret

0000000080002298 <_Z11thread_joinP7_thread>:

void thread_join ( thread_t handle ) {
    80002298:	ff010113          	addi	sp,sp,-16
    8000229c:	00813423          	sd	s0,8(sp)
    800022a0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"((uint64)handle));
    800022a4:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    800022a8:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    800022ac:	00000073          	ecall
}
    800022b0:	00813403          	ld	s0,8(sp)
    800022b4:	01010113          	addi	sp,sp,16
    800022b8:	00008067          	ret

00000000800022bc <_Z10time_sleepm>:

int time_sleep( time_t duration ) {
    800022bc:	ff010113          	addi	sp,sp,-16
    800022c0:	00813423          	sd	s0,8(sp)
    800022c4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(duration));
    800022c8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    800022cc:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    800022d0:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    800022d4:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800022d8:	0005051b          	sext.w	a0,a0
    800022dc:	00813403          	ld	s0,8(sp)
    800022e0:	01010113          	addi	sp,sp,16
    800022e4:	00008067          	ret

00000000800022e8 <_Z8sem_openPP4_semj>:

int sem_open ( sem_t* handle, unsigned init ) {
    800022e8:	ff010113          	addi	sp,sp,-16
    800022ec:	00813423          	sd	s0,8(sp)
    800022f0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0"::"r"((uint64)init));
    800022f4:	02059593          	slli	a1,a1,0x20
    800022f8:	0205d593          	srli	a1,a1,0x20
    800022fc:	00058613          	mv	a2,a1

    __asm__ volatile("mv a1,%0":: "r"((uint64)handle));
    80002300:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x21");
    80002304:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    80002308:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    8000230c:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80002310:	0005051b          	sext.w	a0,a0
    80002314:	00813403          	ld	s0,8(sp)
    80002318:	01010113          	addi	sp,sp,16
    8000231c:	00008067          	ret

0000000080002320 <_Z9sem_closeP4_sem>:

int sem_close ( sem_t handle ) {
    80002320:	ff010113          	addi	sp,sp,-16
    80002324:	00813423          	sd	s0,8(sp)
    80002328:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    8000232c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x22");
    80002330:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    80002334:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80002338:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    8000233c:	0005051b          	sext.w	a0,a0
    80002340:	00813403          	ld	s0,8(sp)
    80002344:	01010113          	addi	sp,sp,16
    80002348:	00008067          	ret

000000008000234c <_Z8sem_waitP4_sem>:

int sem_wait ( sem_t handle ) {
    8000234c:	ff010113          	addi	sp,sp,-16
    80002350:	00813423          	sd	s0,8(sp)
    80002354:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80002358:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x23");
    8000235c:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80002360:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80002364:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80002368:	0005051b          	sext.w	a0,a0
    8000236c:	00813403          	ld	s0,8(sp)
    80002370:	01010113          	addi	sp,sp,16
    80002374:	00008067          	ret

0000000080002378 <_Z10sem_signalP4_sem>:

int sem_signal ( sem_t handle ) {
    80002378:	ff010113          	addi	sp,sp,-16
    8000237c:	00813423          	sd	s0,8(sp)
    80002380:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    80002384:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x24");
    80002388:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    8000238c:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    80002390:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    80002394:	0005051b          	sext.w	a0,a0
    80002398:	00813403          	ld	s0,8(sp)
    8000239c:	01010113          	addi	sp,sp,16
    800023a0:	00008067          	ret

00000000800023a4 <_Z11sem_trywaitP4_sem>:

int sem_trywait ( sem_t handle ) {
    800023a4:	ff010113          	addi	sp,sp,-16
    800023a8:	00813423          	sd	s0,8(sp)
    800023ac:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800023b0:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x26");
    800023b4:	02600513          	li	a0,38
    __asm__ volatile("ecall");
    800023b8:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800023bc:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800023c0:	0005051b          	sext.w	a0,a0
    800023c4:	00813403          	ld	s0,8(sp)
    800023c8:	01010113          	addi	sp,sp,16
    800023cc:	00008067          	ret

00000000800023d0 <_Z13sem_timedwaitP4_semm>:

int sem_timedwait ( sem_t handle, time_t duration ) {
    800023d0:	ff010113          	addi	sp,sp,-16
    800023d4:	00813423          	sd	s0,8(sp)
    800023d8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"((uint64)handle));
    800023dc:	00050593          	mv	a1,a0
    __asm__ volatile("mv a2,%0"::"r"((uint64)duration));
    800023e0:	00058613          	mv	a2,a1
    __asm__ volatile("li a0,0x25");
    800023e4:	02500513          	li	a0,37
    __asm__ volatile("ecall");
    800023e8:	00000073          	ecall
    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r" (returnValue));
    800023ec:	00050513          	mv	a0,a0
    return (int)returnValue;
}
    800023f0:	0005051b          	sext.w	a0,a0
    800023f4:	00813403          	ld	s0,8(sp)
    800023f8:	01010113          	addi	sp,sp,16
    800023fc:	00008067          	ret

0000000080002400 <_Z4getcv>:

char getc() {
    80002400:	ff010113          	addi	sp,sp,-16
    80002404:	00813423          	sd	s0,8(sp)
    80002408:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    8000240c:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    80002410:	00000073          	ecall
    char chr;
    __asm__ volatile ("mv %0, a0" : "=r"(chr));
    80002414:	00050513          	mv	a0,a0
    return chr;
}
    80002418:	0ff57513          	andi	a0,a0,255
    8000241c:	00813403          	ld	s0,8(sp)
    80002420:	01010113          	addi	sp,sp,16
    80002424:	00008067          	ret

0000000080002428 <_Z4putcc>:

#include "consoleManager.h"

void putc(char chr ) {
    80002428:	ff010113          	addi	sp,sp,-16
    8000242c:	00813423          	sd	s0,8(sp)
    80002430:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1,%0"::"r"(chr));
    80002434:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    80002438:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    8000243c:	00000073          	ecall
    80002440:	00813403          	ld	s0,8(sp)
    80002444:	01010113          	addi	sp,sp,16
    80002448:	00008067          	ret

000000008000244c <_ZN7_threadC1EPFvPvES0_>:

#include "console.h"

thread_t _thread::currentThread = 0;
uint32 _thread::nextID = 0;
_thread::_thread(func function, void* arg){
    8000244c:	ff010113          	addi	sp,sp,-16
    80002450:	00813423          	sd	s0,8(sp)
    80002454:	01010413          	addi	s0,sp,16

    static void wrapper();

    void unJoin();

    struct contextWrapper{
    80002458:	00053823          	sd	zero,16(a0) # 10010 <_entry-0x7ffefff0>
    function = function;
    arg = arg;
    ID = nextID++;
    8000245c:	0000d717          	auipc	a4,0xd
    80002460:	f3470713          	addi	a4,a4,-204 # 8000f390 <_ZN7_thread6nextIDE>
    80002464:	00072783          	lw	a5,0(a4)
    80002468:	0017869b          	addiw	a3,a5,1
    8000246c:	00d72023          	sw	a3,0(a4)
    80002470:	00f52023          	sw	a5,0(a0)
    closed = 0;
    80002474:	0a053783          	ld	a5,160(a0)
    blocked = 0;
    sleeping = 0;
    finished = 0;
    kernel = (function == 0);
    80002478:	0015b593          	seqz	a1,a1
    8000247c:	00459593          	slli	a1,a1,0x4
    80002480:	fe07f793          	andi	a5,a5,-32
    80002484:	00b7e7b3          	or	a5,a5,a1
    reserved = 0;
    80002488:	0000a717          	auipc	a4,0xa
    8000248c:	be073703          	ld	a4,-1056(a4) # 8000c068 <CONSOLE_STATUS+0x58>
    80002490:	00e7f7b3          	and	a5,a5,a4
    80002494:	0af53023          	sd	a5,160(a0)
    joinHead = 0;
    80002498:	08053023          	sd	zero,128(a0)
    timeLeft = DEFAULT_TIME_SLICE;
    8000249c:	00200793          	li	a5,2
    800024a0:	08f53823          	sd	a5,144(a0)
    stackStart = 0;
    800024a4:	08053c23          	sd	zero,152(a0)
    
    context.s0 = 0;
    800024a8:	00053c23          	sd	zero,24(a0)
    context.s1 = 0;
    800024ac:	02053023          	sd	zero,32(a0)
    context.s2 = 0;
    800024b0:	02053423          	sd	zero,40(a0)
    context.s3 = 0;
    800024b4:	02053823          	sd	zero,48(a0)
    context.s4 = 0;
    800024b8:	02053c23          	sd	zero,56(a0)
    context.s5 = 0;
    800024bc:	04053023          	sd	zero,64(a0)
    context.s6 = 0;
    800024c0:	04053423          	sd	zero,72(a0)
    context.s7 = 0;
    800024c4:	04053823          	sd	zero,80(a0)
    context.s8 = 0;
    800024c8:	04053c23          	sd	zero,88(a0)
    context.s9 = 0;
    800024cc:	06053023          	sd	zero,96(a0)
    context.s10 = 0;
    800024d0:	06053423          	sd	zero,104(a0)
    context.s11 = 0;
    800024d4:	06053823          	sd	zero,112(a0)

    context.sstatus = 0;
    800024d8:	06053c23          	sd	zero,120(a0)
    /// register x2 is the stack pointer
    context.sp = (uint64)stackStart;
    /// register x1 is the return address
    context.pc = (uint64)wrapper;
    800024dc:	00000797          	auipc	a5,0x0
    800024e0:	66878793          	addi	a5,a5,1640 # 80002b44 <_ZN7_thread7wrapperEv>
    800024e4:	00f53423          	sd	a5,8(a0)
}
    800024e8:	00813403          	ld	s0,8(sp)
    800024ec:	01010113          	addi	sp,sp,16
    800024f0:	00008067          	ret

00000000800024f4 <_Z10popSppSpiev>:

void popSppSpie(){
    800024f4:	ff010113          	addi	sp,sp,-16
    800024f8:	00813423          	sd	s0,8(sp)
    800024fc:	01010413          	addi	s0,sp,16
    /// TODO: threads are all in supervisor mode now, THIS IS A BUG
    __asm__ volatile ("csrw sepc, ra");
    80002500:	14109073          	csrw	sepc,ra
    // __asm__ volatile ("csrc sstatus, %0" :: "r" (1 << 8));
    __asm__ volatile ("sret");
    80002504:	10200073          	sret
}
    80002508:	00813403          	ld	s0,8(sp)
    8000250c:	01010113          	addi	sp,sp,16
    80002510:	00008067          	ret

0000000080002514 <_ZN7_thread6unJoinEv>:
    currentThread->function(currentThread->arg);
    currentThread->unJoin();
    exit();
}

void _thread::unJoin(){
    80002514:	fe010113          	addi	sp,sp,-32
    80002518:	00113c23          	sd	ra,24(sp)
    8000251c:	00813823          	sd	s0,16(sp)
    80002520:	00913423          	sd	s1,8(sp)
    80002524:	01213023          	sd	s2,0(sp)
    80002528:	02010413          	addi	s0,sp,32
    ThreadJoinList* current = joinHead;
    8000252c:	08053483          	ld	s1,128(a0)
    while(current != 0){
    80002530:	0e048463          	beqz	s1,80002618 <_ZN7_thread6unJoinEv+0x104>
        thread_t thread = current->thread;
    80002534:	0004c503          	lbu	a0,0(s1)
    80002538:	0014c783          	lbu	a5,1(s1)
    8000253c:	00879793          	slli	a5,a5,0x8
    80002540:	00a7e7b3          	or	a5,a5,a0
    80002544:	0024c503          	lbu	a0,2(s1)
    80002548:	01051513          	slli	a0,a0,0x10
    8000254c:	00f567b3          	or	a5,a0,a5
    80002550:	0034c503          	lbu	a0,3(s1)
    80002554:	01851513          	slli	a0,a0,0x18
    80002558:	00f56533          	or	a0,a0,a5
    8000255c:	0044c783          	lbu	a5,4(s1)
    80002560:	02079793          	slli	a5,a5,0x20
    80002564:	00a7e533          	or	a0,a5,a0
    80002568:	0054c783          	lbu	a5,5(s1)
    8000256c:	02879793          	slli	a5,a5,0x28
    80002570:	00a7e7b3          	or	a5,a5,a0
    80002574:	0064c503          	lbu	a0,6(s1)
    80002578:	03051513          	slli	a0,a0,0x30
    8000257c:	00f567b3          	or	a5,a0,a5
    80002580:	0074c503          	lbu	a0,7(s1)
    80002584:	03851513          	slli	a0,a0,0x38
    80002588:	00f56533          	or	a0,a0,a5
        thread->blocked = false;
    8000258c:	0a053783          	ld	a5,160(a0)
    80002590:	ffd7f793          	andi	a5,a5,-3
    80002594:	0af53023          	sd	a5,160(a0)
        Scheduler::put(thread);
    80002598:	00003097          	auipc	ra,0x3
    8000259c:	dd0080e7          	jalr	-560(ra) # 80005368 <_ZN9Scheduler3putEP7_thread>
        ThreadJoinList* next = current->next;
    800025a0:	0084c903          	lbu	s2,8(s1)
    800025a4:	0094c783          	lbu	a5,9(s1)
    800025a8:	00879793          	slli	a5,a5,0x8
    800025ac:	0127e7b3          	or	a5,a5,s2
    800025b0:	00a4c903          	lbu	s2,10(s1)
    800025b4:	01091913          	slli	s2,s2,0x10
    800025b8:	00f967b3          	or	a5,s2,a5
    800025bc:	00b4c903          	lbu	s2,11(s1)
    800025c0:	01891913          	slli	s2,s2,0x18
    800025c4:	00f96933          	or	s2,s2,a5
    800025c8:	00c4c783          	lbu	a5,12(s1)
    800025cc:	02079793          	slli	a5,a5,0x20
    800025d0:	0127e933          	or	s2,a5,s2
    800025d4:	00d4c783          	lbu	a5,13(s1)
    800025d8:	02879793          	slli	a5,a5,0x28
    800025dc:	0127e7b3          	or	a5,a5,s2
    800025e0:	00e4c903          	lbu	s2,14(s1)
    800025e4:	03091913          	slli	s2,s2,0x30
    800025e8:	00f967b3          	or	a5,s2,a5
    800025ec:	00f4c903          	lbu	s2,15(s1)
    800025f0:	03891913          	slli	s2,s2,0x38
    800025f4:	00f96933          	or	s2,s2,a5
        HeapManager::getInstance().heapFree(current);
    800025f8:	00048593          	mv	a1,s1
    800025fc:	0000d797          	auipc	a5,0xd
    80002600:	cf47b783          	ld	a5,-780(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002604:	0007b503          	ld	a0,0(a5)
    80002608:	00001097          	auipc	ra,0x1
    8000260c:	7d4080e7          	jalr	2004(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
        current = next;
    80002610:	00090493          	mv	s1,s2
    while(current != 0){
    80002614:	f1dff06f          	j	80002530 <_ZN7_thread6unJoinEv+0x1c>
    }
}
    80002618:	01813083          	ld	ra,24(sp)
    8000261c:	01013403          	ld	s0,16(sp)
    80002620:	00813483          	ld	s1,8(sp)
    80002624:	00013903          	ld	s2,0(sp)
    80002628:	02010113          	addi	sp,sp,32
    8000262c:	00008067          	ret

0000000080002630 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>:

int _thread::create(thread_t* thread, func function, void* arg, void* stack, bool start){
    80002630:	fc010113          	addi	sp,sp,-64
    80002634:	02113c23          	sd	ra,56(sp)
    80002638:	02813823          	sd	s0,48(sp)
    8000263c:	02913423          	sd	s1,40(sp)
    80002640:	03213023          	sd	s2,32(sp)
    80002644:	01313c23          	sd	s3,24(sp)
    80002648:	01413823          	sd	s4,16(sp)
    8000264c:	01513423          	sd	s5,8(sp)
    80002650:	04010413          	addi	s0,sp,64
    80002654:	00050493          	mv	s1,a0
    80002658:	00058913          	mv	s2,a1
    8000265c:	00060a93          	mv	s5,a2
    80002660:	00068993          	mv	s3,a3
    80002664:	00070a13          	mv	s4,a4

    *thread = (_thread*)HeapManager::getInstance().heapAllocate((sizeof(_thread) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80002668:	00300593          	li	a1,3
    8000266c:	0000d797          	auipc	a5,0xd
    80002670:	c847b783          	ld	a5,-892(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002674:	0007b503          	ld	a0,0(a5)
    80002678:	00001097          	auipc	ra,0x1
    8000267c:	068080e7          	jalr	104(ra) # 800036e0 <_ZN11HeapManager12heapAllocateEm>
    80002680:	00a4b023          	sd	a0,0(s1)
    if(*thread == 0){
    80002684:	18050263          	beqz	a0,80002808 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1d8>
        return -1;
    }
    (*thread)->function = function;
    80002688:	0b253423          	sd	s2,168(a0)
    (*thread)->arg = arg;
    8000268c:	0004b783          	ld	a5,0(s1)
    80002690:	0b57b823          	sd	s5,176(a5)
    (*thread)->ID = nextID++;
    80002694:	0000d717          	auipc	a4,0xd
    80002698:	cfc70713          	addi	a4,a4,-772 # 8000f390 <_ZN7_thread6nextIDE>
    8000269c:	00072783          	lw	a5,0(a4)
    800026a0:	0017869b          	addiw	a3,a5,1
    800026a4:	00d72023          	sw	a3,0(a4)
    800026a8:	0004b703          	ld	a4,0(s1)
    800026ac:	00f72023          	sw	a5,0(a4)
    (*thread)->closed = false;
    800026b0:	0004b703          	ld	a4,0(s1)
    800026b4:	0a073783          	ld	a5,160(a4)
    800026b8:	ffe7f793          	andi	a5,a5,-2
    800026bc:	0af73023          	sd	a5,160(a4)
    (*thread)->blocked = false;
    800026c0:	0004b703          	ld	a4,0(s1)
    800026c4:	0a073783          	ld	a5,160(a4)
    800026c8:	ffd7f793          	andi	a5,a5,-3
    800026cc:	0af73023          	sd	a5,160(a4)
    (*thread)->sleeping = false;
    800026d0:	0004b703          	ld	a4,0(s1)
    800026d4:	0a073783          	ld	a5,160(a4)
    800026d8:	ffb7f793          	andi	a5,a5,-5
    800026dc:	0af73023          	sd	a5,160(a4)
    (*thread)->finished = false;
    800026e0:	0004b703          	ld	a4,0(s1)
    800026e4:	0a073783          	ld	a5,160(a4)
    800026e8:	ff77f793          	andi	a5,a5,-9
    800026ec:	0af73023          	sd	a5,160(a4)
    (*thread)->kernel = (function == 0);
    800026f0:	0004b703          	ld	a4,0(s1)
    800026f4:	00193913          	seqz	s2,s2
    800026f8:	00491913          	slli	s2,s2,0x4
    800026fc:	0a073783          	ld	a5,160(a4)
    80002700:	fef7f793          	andi	a5,a5,-17
    80002704:	0127e933          	or	s2,a5,s2
    80002708:	0b273023          	sd	s2,160(a4)
    (*thread)->reserved = 0;
    8000270c:	0004b703          	ld	a4,0(s1)
    80002710:	0a073783          	ld	a5,160(a4)
    80002714:	0000a697          	auipc	a3,0xa
    80002718:	9546b683          	ld	a3,-1708(a3) # 8000c068 <CONSOLE_STATUS+0x58>
    8000271c:	00d7f7b3          	and	a5,a5,a3
    80002720:	0af73023          	sd	a5,160(a4)
    (*thread)->joinHead = 0;
    80002724:	0004b783          	ld	a5,0(s1)
    80002728:	0807b023          	sd	zero,128(a5)
    (*thread)->joinTail = 0;
    8000272c:	0004b783          	ld	a5,0(s1)
    80002730:	0807b423          	sd	zero,136(a5)
    (*thread)->timeLeft = DEFAULT_TIME_SLICE;
    80002734:	0004b783          	ld	a5,0(s1)
    80002738:	00200713          	li	a4,2
    8000273c:	08e7b823          	sd	a4,144(a5)
    (*thread)->stackStart = 0;
    80002740:	0004b783          	ld	a5,0(s1)
    80002744:	0807bc23          	sd	zero,152(a5)

    (*thread)->context.s0 = 0;
    80002748:	0004b783          	ld	a5,0(s1)
    8000274c:	0007bc23          	sd	zero,24(a5)
    (*thread)->context.s1 = 0;
    80002750:	0004b783          	ld	a5,0(s1)
    80002754:	0207b023          	sd	zero,32(a5)
    (*thread)->context.s2 = 0;
    80002758:	0004b783          	ld	a5,0(s1)
    8000275c:	0207b423          	sd	zero,40(a5)
    (*thread)->context.s3 = 0;
    80002760:	0004b783          	ld	a5,0(s1)
    80002764:	0207b823          	sd	zero,48(a5)
    (*thread)->context.s4 = 0;
    80002768:	0004b783          	ld	a5,0(s1)
    8000276c:	0207bc23          	sd	zero,56(a5)
    (*thread)->context.s5 = 0;
    80002770:	0004b783          	ld	a5,0(s1)
    80002774:	0407b023          	sd	zero,64(a5)
    (*thread)->context.s6 = 0;
    80002778:	0004b783          	ld	a5,0(s1)
    8000277c:	0407b423          	sd	zero,72(a5)
    (*thread)->context.s7 = 0;
    80002780:	0004b783          	ld	a5,0(s1)
    80002784:	0407b823          	sd	zero,80(a5)
    (*thread)->context.s8 = 0;
    80002788:	0004b783          	ld	a5,0(s1)
    8000278c:	0407bc23          	sd	zero,88(a5)
    (*thread)->context.s9 = 0;
    80002790:	0004b783          	ld	a5,0(s1)
    80002794:	0607b023          	sd	zero,96(a5)
    (*thread)->context.s10 = 0;
    80002798:	0004b783          	ld	a5,0(s1)
    8000279c:	0607b423          	sd	zero,104(a5)
    (*thread)->context.s11 = 0;
    800027a0:	0004b783          	ld	a5,0(s1)
    800027a4:	0607b823          	sd	zero,112(a5)
    /// register x2 is the stack pointer
    (*thread)->context.sp = (uint64)stack;
    800027a8:	0004b783          	ld	a5,0(s1)
    800027ac:	0137b823          	sd	s3,16(a5)
    /// register x1 is the return address
    (*thread)->context.pc = (uint64)wrapper;
    800027b0:	0004b783          	ld	a5,0(s1)
    800027b4:	00000717          	auipc	a4,0x0
    800027b8:	39070713          	addi	a4,a4,912 # 80002b44 <_ZN7_thread7wrapperEv>
    800027bc:	00e7b423          	sd	a4,8(a5)

    (*thread)->stackStart = stack;
    800027c0:	0004b783          	ld	a5,0(s1)
    800027c4:	0937bc23          	sd	s3,152(a5)
    if(start){
    800027c8:	020a1663          	bnez	s4,800027f4 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1c4>
        Scheduler::put(*thread);
    }
    return 0;
    800027cc:	00000513          	li	a0,0
}
    800027d0:	03813083          	ld	ra,56(sp)
    800027d4:	03013403          	ld	s0,48(sp)
    800027d8:	02813483          	ld	s1,40(sp)
    800027dc:	02013903          	ld	s2,32(sp)
    800027e0:	01813983          	ld	s3,24(sp)
    800027e4:	01013a03          	ld	s4,16(sp)
    800027e8:	00813a83          	ld	s5,8(sp)
    800027ec:	04010113          	addi	sp,sp,64
    800027f0:	00008067          	ret
        Scheduler::put(*thread);
    800027f4:	0004b503          	ld	a0,0(s1)
    800027f8:	00003097          	auipc	ra,0x3
    800027fc:	b70080e7          	jalr	-1168(ra) # 80005368 <_ZN9Scheduler3putEP7_thread>
    return 0;
    80002800:	00000513          	li	a0,0
    80002804:	fcdff06f          	j	800027d0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1a0>
        return -1;
    80002808:	fff00513          	li	a0,-1
    8000280c:	fc5ff06f          	j	800027d0 <_ZN7_thread6createEPPS_PFvPvES2_S2_b+0x1a0>

0000000080002810 <_ZN7_thread10setBlockedEb>:
    currentThread->finished = 1;
    dispatch();
    return 0;
}

void _thread::setBlocked(bool blocked){
    80002810:	ff010113          	addi	sp,sp,-16
    80002814:	00813423          	sd	s0,8(sp)
    80002818:	01010413          	addi	s0,sp,16
    this->blocked = blocked;
    8000281c:	0015f593          	andi	a1,a1,1
    80002820:	00159793          	slli	a5,a1,0x1
    80002824:	0a053583          	ld	a1,160(a0)
    80002828:	ffd5f593          	andi	a1,a1,-3
    8000282c:	00f5e5b3          	or	a1,a1,a5
    80002830:	0ab53023          	sd	a1,160(a0)
}
    80002834:	00813403          	ld	s0,8(sp)
    80002838:	01010113          	addi	sp,sp,16
    8000283c:	00008067          	ret

0000000080002840 <_ZN7_thread9setClosedEb>:

void _thread::setClosed(bool closed){
    80002840:	ff010113          	addi	sp,sp,-16
    80002844:	00813423          	sd	s0,8(sp)
    80002848:	01010413          	addi	s0,sp,16
    this->closed = closed;
    8000284c:	0015f793          	andi	a5,a1,1
    80002850:	0a053583          	ld	a1,160(a0)
    80002854:	ffe5f593          	andi	a1,a1,-2
    80002858:	00f5e5b3          	or	a1,a1,a5
    8000285c:	0ab53023          	sd	a1,160(a0)
}
    80002860:	00813403          	ld	s0,8(sp)
    80002864:	01010113          	addi	sp,sp,16
    80002868:	00008067          	ret

000000008000286c <_ZN7_thread11setSleepingEb>:

void _thread::setSleeping(bool sleeping){
    8000286c:	ff010113          	addi	sp,sp,-16
    80002870:	00813423          	sd	s0,8(sp)
    80002874:	01010413          	addi	s0,sp,16
    this->sleeping = sleeping;
    80002878:	0015f593          	andi	a1,a1,1
    8000287c:	00259793          	slli	a5,a1,0x2
    80002880:	0a053583          	ld	a1,160(a0)
    80002884:	ffb5f593          	andi	a1,a1,-5
    80002888:	00f5e5b3          	or	a1,a1,a5
    8000288c:	0ab53023          	sd	a1,160(a0)
}
    80002890:	00813403          	ld	s0,8(sp)
    80002894:	01010113          	addi	sp,sp,16
    80002898:	00008067          	ret

000000008000289c <_ZN7_thread8dispatchEv>:

void _thread::dispatch(){
    8000289c:	fe010113          	addi	sp,sp,-32
    800028a0:	00113c23          	sd	ra,24(sp)
    800028a4:	00813823          	sd	s0,16(sp)
    800028a8:	00913423          	sd	s1,8(sp)
    800028ac:	02010413          	addi	s0,sp,32
    thread_t oldThread = currentThread;
    800028b0:	0000d497          	auipc	s1,0xd
    800028b4:	ae84b483          	ld	s1,-1304(s1) # 8000f398 <_ZN7_thread13currentThreadE>
    oldThread->timeLeft = DEFAULT_TIME_SLICE;
    800028b8:	00200793          	li	a5,2
    800028bc:	08f4b823          	sd	a5,144(s1)
    if(oldThread != 0 && !oldThread->closed && !oldThread->blocked && !oldThread->sleeping && !oldThread->finished){
    800028c0:	00048863          	beqz	s1,800028d0 <_ZN7_thread8dispatchEv+0x34>
    800028c4:	0a04b783          	ld	a5,160(s1)
    800028c8:	00f7f793          	andi	a5,a5,15
    800028cc:	02078e63          	beqz	a5,80002908 <_ZN7_thread8dispatchEv+0x6c>
        Scheduler::put(oldThread);
    }
    currentThread =  Scheduler::get();
    800028d0:	00003097          	auipc	ra,0x3
    800028d4:	c9c080e7          	jalr	-868(ra) # 8000556c <_ZN9Scheduler3getEv>
    800028d8:	0000d797          	auipc	a5,0xd
    800028dc:	aca7b023          	sd	a0,-1344(a5) # 8000f398 <_ZN7_thread13currentThreadE>
    if(currentThread == oldThread)return;
    800028e0:	00a48a63          	beq	s1,a0,800028f4 <_ZN7_thread8dispatchEv+0x58>
    contextSwitch(&(oldThread->context), &(currentThread->context));
    800028e4:	00850593          	addi	a1,a0,8
    800028e8:	00848513          	addi	a0,s1,8
    800028ec:	fffff097          	auipc	ra,0xfffff
    800028f0:	814080e7          	jalr	-2028(ra) # 80001100 <_ZN7_thread13contextSwitchEPNS_14contextWrapperES1_>
}
    800028f4:	01813083          	ld	ra,24(sp)
    800028f8:	01013403          	ld	s0,16(sp)
    800028fc:	00813483          	ld	s1,8(sp)
    80002900:	02010113          	addi	sp,sp,32
    80002904:	00008067          	ret
        Scheduler::put(oldThread);
    80002908:	00048513          	mv	a0,s1
    8000290c:	00003097          	auipc	ra,0x3
    80002910:	a5c080e7          	jalr	-1444(ra) # 80005368 <_ZN9Scheduler3putEP7_thread>
    80002914:	fbdff06f          	j	800028d0 <_ZN7_thread8dispatchEv+0x34>

0000000080002918 <_ZN7_thread4joinEPS_>:
    if(thread->finished || thread->closed){
    80002918:	0a05b783          	ld	a5,160(a1)
    8000291c:	0097f793          	andi	a5,a5,9
    80002920:	00078463          	beqz	a5,80002928 <_ZN7_thread4joinEPS_+0x10>
    80002924:	00008067          	ret
void _thread::join(thread_t thread){
    80002928:	fe010113          	addi	sp,sp,-32
    8000292c:	00113c23          	sd	ra,24(sp)
    80002930:	00813823          	sd	s0,16(sp)
    80002934:	00913423          	sd	s1,8(sp)
    80002938:	01213023          	sd	s2,0(sp)
    8000293c:	02010413          	addi	s0,sp,32
    80002940:	00050493          	mv	s1,a0
    80002944:	00058913          	mv	s2,a1
    ThreadJoinList* newJoin = (ThreadJoinList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadJoinList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80002948:	00100593          	li	a1,1
    8000294c:	0000d797          	auipc	a5,0xd
    80002950:	9a47b783          	ld	a5,-1628(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002954:	0007b503          	ld	a0,0(a5)
    80002958:	00001097          	auipc	ra,0x1
    8000295c:	d88080e7          	jalr	-632(ra) # 800036e0 <_ZN11HeapManager12heapAllocateEm>
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
    800029cc:	06070463          	beqz	a4,80002a34 <_ZN7_thread4joinEPS_+0x11c>
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
    80002a18:	e88080e7          	jalr	-376(ra) # 8000289c <_ZN7_thread8dispatchEv>
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
    80002a3c:	fd9ff06f          	j	80002a14 <_ZN7_thread4joinEPS_+0xfc>

0000000080002a40 <_ZN7_thread4tickEv>:
    if(currentThread->blocked){
    80002a40:	0000d797          	auipc	a5,0xd
    80002a44:	9587b783          	ld	a5,-1704(a5) # 8000f398 <_ZN7_thread13currentThreadE>
    80002a48:	0a07b783          	ld	a5,160(a5)
    80002a4c:	0027f713          	andi	a4,a5,2
    80002a50:	06071063          	bnez	a4,80002ab0 <_ZN7_thread4tickEv+0x70>
    if(currentThread->closed){
    80002a54:	0017f713          	andi	a4,a5,1
    80002a58:	06071063          	bnez	a4,80002ab8 <_ZN7_thread4tickEv+0x78>
    if(currentThread->sleeping){
    80002a5c:	0047f713          	andi	a4,a5,4
    80002a60:	06071063          	bnez	a4,80002ac0 <_ZN7_thread4tickEv+0x80>
    if(currentThread->finished){
    80002a64:	0087f793          	andi	a5,a5,8
    80002a68:	06079063          	bnez	a5,80002ac8 <_ZN7_thread4tickEv+0x88>
    timeLeft --;
    80002a6c:	09053783          	ld	a5,144(a0)
    80002a70:	fff78793          	addi	a5,a5,-1
    80002a74:	08f53823          	sd	a5,144(a0)
    if(timeLeft == 0){
    80002a78:	00078663          	beqz	a5,80002a84 <_ZN7_thread4tickEv+0x44>
    return 0;
    80002a7c:	00000513          	li	a0,0
}
    80002a80:	00008067          	ret
int _thread::tick(){
    80002a84:	ff010113          	addi	sp,sp,-16
    80002a88:	00113423          	sd	ra,8(sp)
    80002a8c:	00813023          	sd	s0,0(sp)
    80002a90:	01010413          	addi	s0,sp,16
        dispatch();
    80002a94:	00000097          	auipc	ra,0x0
    80002a98:	e08080e7          	jalr	-504(ra) # 8000289c <_ZN7_thread8dispatchEv>
    return 0;
    80002a9c:	00000513          	li	a0,0
}
    80002aa0:	00813083          	ld	ra,8(sp)
    80002aa4:	00013403          	ld	s0,0(sp)
    80002aa8:	01010113          	addi	sp,sp,16
    80002aac:	00008067          	ret
        return -1;
    80002ab0:	fff00513          	li	a0,-1
    80002ab4:	00008067          	ret
        return -2;
    80002ab8:	ffe00513          	li	a0,-2
    80002abc:	00008067          	ret
        return -3;
    80002ac0:	ffd00513          	li	a0,-3
    80002ac4:	00008067          	ret
        return -4;
    80002ac8:	ffc00513          	li	a0,-4
    80002acc:	00008067          	ret

0000000080002ad0 <_ZN7_thread4exitEv>:
    if(currentThread->closed){
    80002ad0:	0000d717          	auipc	a4,0xd
    80002ad4:	8c873703          	ld	a4,-1848(a4) # 8000f398 <_ZN7_thread13currentThreadE>
    80002ad8:	0a073783          	ld	a5,160(a4)
    80002adc:	0017f693          	andi	a3,a5,1
    80002ae0:	04069663          	bnez	a3,80002b2c <_ZN7_thread4exitEv+0x5c>
    if(currentThread->blocked){
    80002ae4:	0027f693          	andi	a3,a5,2
    80002ae8:	04069663          	bnez	a3,80002b34 <_ZN7_thread4exitEv+0x64>
    if(currentThread->sleeping){
    80002aec:	0047f793          	andi	a5,a5,4
    80002af0:	04079663          	bnez	a5,80002b3c <_ZN7_thread4exitEv+0x6c>
int _thread::exit(){
    80002af4:	ff010113          	addi	sp,sp,-16
    80002af8:	00113423          	sd	ra,8(sp)
    80002afc:	00813023          	sd	s0,0(sp)
    80002b00:	01010413          	addi	s0,sp,16
    currentThread->finished = 1;
    80002b04:	0a073783          	ld	a5,160(a4)
    80002b08:	0087e793          	ori	a5,a5,8
    80002b0c:	0af73023          	sd	a5,160(a4)
    dispatch();
    80002b10:	00000097          	auipc	ra,0x0
    80002b14:	d8c080e7          	jalr	-628(ra) # 8000289c <_ZN7_thread8dispatchEv>
    return 0;
    80002b18:	00000513          	li	a0,0
}
    80002b1c:	00813083          	ld	ra,8(sp)
    80002b20:	00013403          	ld	s0,0(sp)
    80002b24:	01010113          	addi	sp,sp,16
    80002b28:	00008067          	ret
        return -1;
    80002b2c:	fff00513          	li	a0,-1
    80002b30:	00008067          	ret
        return -2;
    80002b34:	ffe00513          	li	a0,-2
    80002b38:	00008067          	ret
        return -3;
    80002b3c:	ffd00513          	li	a0,-3
}
    80002b40:	00008067          	ret

0000000080002b44 <_ZN7_thread7wrapperEv>:
void _thread::wrapper(){
    80002b44:	fe010113          	addi	sp,sp,-32
    80002b48:	00113c23          	sd	ra,24(sp)
    80002b4c:	00813823          	sd	s0,16(sp)
    80002b50:	00913423          	sd	s1,8(sp)
    80002b54:	02010413          	addi	s0,sp,32
    popSppSpie();
    80002b58:	00000097          	auipc	ra,0x0
    80002b5c:	99c080e7          	jalr	-1636(ra) # 800024f4 <_Z10popSppSpiev>
    currentThread->function(currentThread->arg);
    80002b60:	0000d497          	auipc	s1,0xd
    80002b64:	83048493          	addi	s1,s1,-2000 # 8000f390 <_ZN7_thread6nextIDE>
    80002b68:	0084b783          	ld	a5,8(s1)
    80002b6c:	0a87b703          	ld	a4,168(a5)
    80002b70:	0b07b503          	ld	a0,176(a5)
    80002b74:	000700e7          	jalr	a4
    currentThread->unJoin();
    80002b78:	0084b503          	ld	a0,8(s1)
    80002b7c:	00000097          	auipc	ra,0x0
    80002b80:	998080e7          	jalr	-1640(ra) # 80002514 <_ZN7_thread6unJoinEv>
    exit();
    80002b84:	00000097          	auipc	ra,0x0
    80002b88:	f4c080e7          	jalr	-180(ra) # 80002ad0 <_ZN7_thread4exitEv>
}
    80002b8c:	01813083          	ld	ra,24(sp)
    80002b90:	01013403          	ld	s0,16(sp)
    80002b94:	00813483          	ld	s1,8(sp)
    80002b98:	02010113          	addi	sp,sp,32
    80002b9c:	00008067          	ret

0000000080002ba0 <main>:
#include "assert.h"
#include "syscall_c.h"
#include "consoleManager.h"

/// @brief first function to be called
void main(){
    80002ba0:	b7010113          	addi	sp,sp,-1168
    80002ba4:	48113423          	sd	ra,1160(sp)
    80002ba8:	48813023          	sd	s0,1152(sp)
    80002bac:	46913c23          	sd	s1,1144(sp)
    80002bb0:	49010413          	addi	s0,sp,1168
    Kernel kernel = Kernel();
    80002bb4:	b7040493          	addi	s1,s0,-1168
    80002bb8:	00048513          	mv	a0,s1
    80002bbc:	00003097          	auipc	ra,0x3
    80002bc0:	edc080e7          	jalr	-292(ra) # 80005a98 <_ZN6KernelC1Ev>
    kernel.initialise();
    80002bc4:	00048513          	mv	a0,s1
    80002bc8:	00003097          	auipc	ra,0x3
    80002bcc:	f74080e7          	jalr	-140(ra) # 80005b3c <_ZN6Kernel10initialiseEv>
    Kernel::EXIT_CODE exitCode = kernel.run();
    80002bd0:	00048513          	mv	a0,s1
    80002bd4:	00003097          	auipc	ra,0x3
    80002bd8:	fc4080e7          	jalr	-60(ra) # 80005b98 <_ZN6Kernel3runEv>
    80002bdc:	00050493          	mv	s1,a0
    putc('\n');
    80002be0:	00a00513          	li	a0,10
    80002be4:	00000097          	auipc	ra,0x0
    80002be8:	844080e7          	jalr	-1980(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002bec:	02d00513          	li	a0,45
    80002bf0:	00000097          	auipc	ra,0x0
    80002bf4:	838080e7          	jalr	-1992(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002bf8:	02d00513          	li	a0,45
    80002bfc:	00000097          	auipc	ra,0x0
    80002c00:	82c080e7          	jalr	-2004(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c04:	02d00513          	li	a0,45
    80002c08:	00000097          	auipc	ra,0x0
    80002c0c:	820080e7          	jalr	-2016(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c10:	02d00513          	li	a0,45
    80002c14:	00000097          	auipc	ra,0x0
    80002c18:	814080e7          	jalr	-2028(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c1c:	02d00513          	li	a0,45
    80002c20:	00000097          	auipc	ra,0x0
    80002c24:	808080e7          	jalr	-2040(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c28:	02d00513          	li	a0,45
    80002c2c:	fffff097          	auipc	ra,0xfffff
    80002c30:	7fc080e7          	jalr	2044(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c34:	02d00513          	li	a0,45
    80002c38:	fffff097          	auipc	ra,0xfffff
    80002c3c:	7f0080e7          	jalr	2032(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c40:	02d00513          	li	a0,45
    80002c44:	fffff097          	auipc	ra,0xfffff
    80002c48:	7e4080e7          	jalr	2020(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c4c:	02d00513          	li	a0,45
    80002c50:	fffff097          	auipc	ra,0xfffff
    80002c54:	7d8080e7          	jalr	2008(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c58:	02d00513          	li	a0,45
    80002c5c:	fffff097          	auipc	ra,0xfffff
    80002c60:	7cc080e7          	jalr	1996(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c64:	02d00513          	li	a0,45
    80002c68:	fffff097          	auipc	ra,0xfffff
    80002c6c:	7c0080e7          	jalr	1984(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c70:	02d00513          	li	a0,45
    80002c74:	fffff097          	auipc	ra,0xfffff
    80002c78:	7b4080e7          	jalr	1972(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c7c:	02d00513          	li	a0,45
    80002c80:	fffff097          	auipc	ra,0xfffff
    80002c84:	7a8080e7          	jalr	1960(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c88:	02d00513          	li	a0,45
    80002c8c:	fffff097          	auipc	ra,0xfffff
    80002c90:	79c080e7          	jalr	1948(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002c94:	02d00513          	li	a0,45
    80002c98:	fffff097          	auipc	ra,0xfffff
    80002c9c:	790080e7          	jalr	1936(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002ca0:	02d00513          	li	a0,45
    80002ca4:	fffff097          	auipc	ra,0xfffff
    80002ca8:	784080e7          	jalr	1924(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002cac:	02d00513          	li	a0,45
    80002cb0:	fffff097          	auipc	ra,0xfffff
    80002cb4:	778080e7          	jalr	1912(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002cb8:	02d00513          	li	a0,45
    80002cbc:	fffff097          	auipc	ra,0xfffff
    80002cc0:	76c080e7          	jalr	1900(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002cc4:	02d00513          	li	a0,45
    80002cc8:	fffff097          	auipc	ra,0xfffff
    80002ccc:	760080e7          	jalr	1888(ra) # 80002428 <_Z4putcc>
    putc('-');
    80002cd0:	02d00513          	li	a0,45
    80002cd4:	fffff097          	auipc	ra,0xfffff
    80002cd8:	754080e7          	jalr	1876(ra) # 80002428 <_Z4putcc>
    putc('\n');
    80002cdc:	00a00513          	li	a0,10
    80002ce0:	fffff097          	auipc	ra,0xfffff
    80002ce4:	748080e7          	jalr	1864(ra) # 80002428 <_Z4putcc>
    putc('\n');
    80002ce8:	00a00513          	li	a0,10
    80002cec:	fffff097          	auipc	ra,0xfffff
    80002cf0:	73c080e7          	jalr	1852(ra) # 80002428 <_Z4putcc>
    putc('K');
    80002cf4:	04b00513          	li	a0,75
    80002cf8:	fffff097          	auipc	ra,0xfffff
    80002cfc:	730080e7          	jalr	1840(ra) # 80002428 <_Z4putcc>
    putc('e');
    80002d00:	06500513          	li	a0,101
    80002d04:	fffff097          	auipc	ra,0xfffff
    80002d08:	724080e7          	jalr	1828(ra) # 80002428 <_Z4putcc>
    putc('r');
    80002d0c:	07200513          	li	a0,114
    80002d10:	fffff097          	auipc	ra,0xfffff
    80002d14:	718080e7          	jalr	1816(ra) # 80002428 <_Z4putcc>
    putc('n');
    80002d18:	06e00513          	li	a0,110
    80002d1c:	fffff097          	auipc	ra,0xfffff
    80002d20:	70c080e7          	jalr	1804(ra) # 80002428 <_Z4putcc>
    putc('e');
    80002d24:	06500513          	li	a0,101
    80002d28:	fffff097          	auipc	ra,0xfffff
    80002d2c:	700080e7          	jalr	1792(ra) # 80002428 <_Z4putcc>
    putc('l');
    80002d30:	06c00513          	li	a0,108
    80002d34:	fffff097          	auipc	ra,0xfffff
    80002d38:	6f4080e7          	jalr	1780(ra) # 80002428 <_Z4putcc>
    putc(' ');
    80002d3c:	02000513          	li	a0,32
    80002d40:	fffff097          	auipc	ra,0xfffff
    80002d44:	6e8080e7          	jalr	1768(ra) # 80002428 <_Z4putcc>
    putc('e');
    80002d48:	06500513          	li	a0,101
    80002d4c:	fffff097          	auipc	ra,0xfffff
    80002d50:	6dc080e7          	jalr	1756(ra) # 80002428 <_Z4putcc>
    putc('x');
    80002d54:	07800513          	li	a0,120
    80002d58:	fffff097          	auipc	ra,0xfffff
    80002d5c:	6d0080e7          	jalr	1744(ra) # 80002428 <_Z4putcc>
    putc('i');
    80002d60:	06900513          	li	a0,105
    80002d64:	fffff097          	auipc	ra,0xfffff
    80002d68:	6c4080e7          	jalr	1732(ra) # 80002428 <_Z4putcc>
    putc('t');
    80002d6c:	07400513          	li	a0,116
    80002d70:	fffff097          	auipc	ra,0xfffff
    80002d74:	6b8080e7          	jalr	1720(ra) # 80002428 <_Z4putcc>
    putc('e');
    80002d78:	06500513          	li	a0,101
    80002d7c:	fffff097          	auipc	ra,0xfffff
    80002d80:	6ac080e7          	jalr	1708(ra) # 80002428 <_Z4putcc>
    putc('d');
    80002d84:	06400513          	li	a0,100
    80002d88:	fffff097          	auipc	ra,0xfffff
    80002d8c:	6a0080e7          	jalr	1696(ra) # 80002428 <_Z4putcc>
    putc(' ');
    80002d90:	02000513          	li	a0,32
    80002d94:	fffff097          	auipc	ra,0xfffff
    80002d98:	694080e7          	jalr	1684(ra) # 80002428 <_Z4putcc>
    putc('w');
    80002d9c:	07700513          	li	a0,119
    80002da0:	fffff097          	auipc	ra,0xfffff
    80002da4:	688080e7          	jalr	1672(ra) # 80002428 <_Z4putcc>
    putc('i');
    80002da8:	06900513          	li	a0,105
    80002dac:	fffff097          	auipc	ra,0xfffff
    80002db0:	67c080e7          	jalr	1660(ra) # 80002428 <_Z4putcc>
    putc('t');
    80002db4:	07400513          	li	a0,116
    80002db8:	fffff097          	auipc	ra,0xfffff
    80002dbc:	670080e7          	jalr	1648(ra) # 80002428 <_Z4putcc>
    putc('h');
    80002dc0:	06800513          	li	a0,104
    80002dc4:	fffff097          	auipc	ra,0xfffff
    80002dc8:	664080e7          	jalr	1636(ra) # 80002428 <_Z4putcc>
    putc(' ');
    80002dcc:	02000513          	li	a0,32
    80002dd0:	fffff097          	auipc	ra,0xfffff
    80002dd4:	658080e7          	jalr	1624(ra) # 80002428 <_Z4putcc>
    putc('c');
    80002dd8:	06300513          	li	a0,99
    80002ddc:	fffff097          	auipc	ra,0xfffff
    80002de0:	64c080e7          	jalr	1612(ra) # 80002428 <_Z4putcc>
    putc('o');
    80002de4:	06f00513          	li	a0,111
    80002de8:	fffff097          	auipc	ra,0xfffff
    80002dec:	640080e7          	jalr	1600(ra) # 80002428 <_Z4putcc>
    putc('d');
    80002df0:	06400513          	li	a0,100
    80002df4:	fffff097          	auipc	ra,0xfffff
    80002df8:	634080e7          	jalr	1588(ra) # 80002428 <_Z4putcc>
    putc('e');
    80002dfc:	06500513          	li	a0,101
    80002e00:	fffff097          	auipc	ra,0xfffff
    80002e04:	628080e7          	jalr	1576(ra) # 80002428 <_Z4putcc>
    putc(':');
    80002e08:	03a00513          	li	a0,58
    80002e0c:	fffff097          	auipc	ra,0xfffff
    80002e10:	61c080e7          	jalr	1564(ra) # 80002428 <_Z4putcc>
    switch(exitCode){
    80002e14:	00048e63          	beqz	s1,80002e30 <main+0x290>
    80002e18:	00100793          	li	a5,1
    80002e1c:	02f48263          	beq	s1,a5,80002e40 <main+0x2a0>
            break;
        case Kernel::EXIT_FAILURE:
            putc('1');
            break;
        default:
            putc('2');
    80002e20:	03200513          	li	a0,50
    80002e24:	fffff097          	auipc	ra,0xfffff
    80002e28:	604080e7          	jalr	1540(ra) # 80002428 <_Z4putcc>
    80002e2c:	0200006f          	j	80002e4c <main+0x2ac>
            putc('0');
    80002e30:	03000513          	li	a0,48
    80002e34:	fffff097          	auipc	ra,0xfffff
    80002e38:	5f4080e7          	jalr	1524(ra) # 80002428 <_Z4putcc>
    80002e3c:	0100006f          	j	80002e4c <main+0x2ac>
            putc('1');
    80002e40:	03100513          	li	a0,49
    80002e44:	fffff097          	auipc	ra,0xfffff
    80002e48:	5e4080e7          	jalr	1508(ra) # 80002428 <_Z4putcc>
            break;
    }
    putc('\n');
    80002e4c:	00a00513          	li	a0,10
    80002e50:	fffff097          	auipc	ra,0xfffff
    80002e54:	5d8080e7          	jalr	1496(ra) # 80002428 <_Z4putcc>
    ConsoleManager::outputHandler();
    80002e58:	00000097          	auipc	ra,0x0
    80002e5c:	494080e7          	jalr	1172(ra) # 800032ec <_ZN14ConsoleManager13outputHandlerEv>
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80002e60:	02049263          	bnez	s1,80002e84 <main+0x2e4>
    Kernel kernel = Kernel();
    80002e64:	b7040513          	addi	a0,s0,-1168
    80002e68:	00000097          	auipc	ra,0x0
    80002e6c:	060080e7          	jalr	96(ra) # 80002ec8 <_ZN6KernelD1Ev>
    80002e70:	48813083          	ld	ra,1160(sp)
    80002e74:	48013403          	ld	s0,1152(sp)
    80002e78:	47813483          	ld	s1,1144(sp)
    80002e7c:	49010113          	addi	sp,sp,1168
    80002e80:	00008067          	ret
    assert(exitCode == Kernel::EXIT_SUCCESS);
    80002e84:	00009697          	auipc	a3,0x9
    80002e88:	1ec68693          	addi	a3,a3,492 # 8000c070 <CONSOLE_STATUS+0x60>
    80002e8c:	05200613          	li	a2,82
    80002e90:	00009597          	auipc	a1,0x9
    80002e94:	1f058593          	addi	a1,a1,496 # 8000c080 <CONSOLE_STATUS+0x70>
    80002e98:	00009517          	auipc	a0,0x9
    80002e9c:	1f850513          	addi	a0,a0,504 # 8000c090 <CONSOLE_STATUS+0x80>
    80002ea0:	00003097          	auipc	ra,0x3
    80002ea4:	87c080e7          	jalr	-1924(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    80002ea8:	fbdff06f          	j	80002e64 <main+0x2c4>
    80002eac:	00050493          	mv	s1,a0
    Kernel kernel = Kernel();
    80002eb0:	b7040513          	addi	a0,s0,-1168
    80002eb4:	00000097          	auipc	ra,0x0
    80002eb8:	014080e7          	jalr	20(ra) # 80002ec8 <_ZN6KernelD1Ev>
    80002ebc:	00048513          	mv	a0,s1
    80002ec0:	0000d097          	auipc	ra,0xd
    80002ec4:	628080e7          	jalr	1576(ra) # 800104e8 <_Unwind_Resume>

0000000080002ec8 <_ZN6KernelD1Ev>:
class Kernel{
    public:
        /// @brief constructor
        Kernel(); /// empty constructor
        /// @brief destructor
        ~Kernel(){};
    80002ec8:	fe010113          	addi	sp,sp,-32
    80002ecc:	00113c23          	sd	ra,24(sp)
    80002ed0:	00813823          	sd	s0,16(sp)
    80002ed4:	00913423          	sd	s1,8(sp)
    80002ed8:	02010413          	addi	s0,sp,32
    80002edc:	00050493          	mv	s1,a0
    80002ee0:	02850513          	addi	a0,a0,40
    80002ee4:	00000097          	auipc	ra,0x0
    80002ee8:	180080e7          	jalr	384(ra) # 80003064 <_ZN14ConsoleManagerD1Ev>
    80002eec:	01848513          	addi	a0,s1,24
    80002ef0:	00002097          	auipc	ra,0x2
    80002ef4:	f3c080e7          	jalr	-196(ra) # 80004e2c <_ZN5TimerD1Ev>
    80002ef8:	00048513          	mv	a0,s1
    80002efc:	00000097          	auipc	ra,0x0
    80002f00:	54c080e7          	jalr	1356(ra) # 80003448 <_ZN11HeapManagerD1Ev>
    80002f04:	01813083          	ld	ra,24(sp)
    80002f08:	01013403          	ld	s0,16(sp)
    80002f0c:	00813483          	ld	s1,8(sp)
    80002f10:	02010113          	addi	sp,sp,32
    80002f14:	00008067          	ret

0000000080002f18 <_ZN14ConsoleManager11getInstanceEv>:
    outBuffer.init();
    waitingThreads = 0;
}

ConsoleManager& ConsoleManager::getInstance(){
    assert(instance != 0);
    80002f18:	0000c797          	auipc	a5,0xc
    80002f1c:	4887b783          	ld	a5,1160(a5) # 8000f3a0 <_ZN14ConsoleManager8instanceE>
    80002f20:	00078863          	beqz	a5,80002f30 <_ZN14ConsoleManager11getInstanceEv+0x18>
    return *instance;
}
    80002f24:	0000c517          	auipc	a0,0xc
    80002f28:	47c53503          	ld	a0,1148(a0) # 8000f3a0 <_ZN14ConsoleManager8instanceE>
    80002f2c:	00008067          	ret
ConsoleManager& ConsoleManager::getInstance(){
    80002f30:	ff010113          	addi	sp,sp,-16
    80002f34:	00113423          	sd	ra,8(sp)
    80002f38:	00813023          	sd	s0,0(sp)
    80002f3c:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80002f40:	00009697          	auipc	a3,0x9
    80002f44:	17868693          	addi	a3,a3,376 # 8000c0b8 <CONSOLE_STATUS+0xa8>
    80002f48:	02200613          	li	a2,34
    80002f4c:	00009597          	auipc	a1,0x9
    80002f50:	1a458593          	addi	a1,a1,420 # 8000c0f0 <CONSOLE_STATUS+0xe0>
    80002f54:	00009517          	auipc	a0,0x9
    80002f58:	1b450513          	addi	a0,a0,436 # 8000c108 <CONSOLE_STATUS+0xf8>
    80002f5c:	00002097          	auipc	ra,0x2
    80002f60:	7c0080e7          	jalr	1984(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
}
    80002f64:	0000c517          	auipc	a0,0xc
    80002f68:	43c53503          	ld	a0,1084(a0) # 8000f3a0 <_ZN14ConsoleManager8instanceE>
    80002f6c:	00813083          	ld	ra,8(sp)
    80002f70:	00013403          	ld	s0,0(sp)
    80002f74:	01010113          	addi	sp,sp,16
    80002f78:	00008067          	ret

0000000080002f7c <_ZN14ConsoleManager13consoleBufferD1Ev>:

ConsoleManager::consoleBuffer::~consoleBuffer(){
    80002f7c:	ff010113          	addi	sp,sp,-16
    80002f80:	00113423          	sd	ra,8(sp)
    80002f84:	00813023          	sd	s0,0(sp)
    80002f88:	01010413          	addi	s0,sp,16
    sem_close(sem);
    80002f8c:	00053503          	ld	a0,0(a0)
    80002f90:	fffff097          	auipc	ra,0xfffff
    80002f94:	390080e7          	jalr	912(ra) # 80002320 <_Z9sem_closeP4_sem>
}
    80002f98:	00813083          	ld	ra,8(sp)
    80002f9c:	00013403          	ld	s0,0(sp)
    80002fa0:	01010113          	addi	sp,sp,16
    80002fa4:	00008067          	ret

0000000080002fa8 <_ZN14ConsoleManagerC1Ev>:
ConsoleManager::ConsoleManager(){
    80002fa8:	fd010113          	addi	sp,sp,-48
    80002fac:	02113423          	sd	ra,40(sp)
    80002fb0:	02813023          	sd	s0,32(sp)
    80002fb4:	00913c23          	sd	s1,24(sp)
    80002fb8:	01213823          	sd	s2,16(sp)
    80002fbc:	01313423          	sd	s3,8(sp)
    80002fc0:	03010413          	addi	s0,sp,48
    80002fc4:	00050493          	mv	s1,a0

    static ConsoleManager* instance;
    
    struct consoleBuffer{
    public:
        consoleBuffer(): head(0), tail(0), size(0){}
    80002fc8:	20053423          	sd	zero,520(a0)
    80002fcc:	20053823          	sd	zero,528(a0)
    80002fd0:	20053c23          	sd	zero,536(a0)
    80002fd4:	42053423          	sd	zero,1064(a0)
    80002fd8:	42053823          	sd	zero,1072(a0)
    80002fdc:	42053c23          	sd	zero,1080(a0)
    assert(instance == 0);
    80002fe0:	0000c797          	auipc	a5,0xc
    80002fe4:	3c07b783          	ld	a5,960(a5) # 8000f3a0 <_ZN14ConsoleManager8instanceE>
    80002fe8:	02079463          	bnez	a5,80003010 <_ZN14ConsoleManagerC1Ev+0x68>
    instance = this;
    80002fec:	0000c797          	auipc	a5,0xc
    80002ff0:	3a97ba23          	sd	s1,948(a5) # 8000f3a0 <_ZN14ConsoleManager8instanceE>
}
    80002ff4:	02813083          	ld	ra,40(sp)
    80002ff8:	02013403          	ld	s0,32(sp)
    80002ffc:	01813483          	ld	s1,24(sp)
    80003000:	01013903          	ld	s2,16(sp)
    80003004:	00813983          	ld	s3,8(sp)
    80003008:	03010113          	addi	sp,sp,48
    8000300c:	00008067          	ret
    80003010:	22050913          	addi	s2,a0,544
    assert(instance == 0);
    80003014:	00009697          	auipc	a3,0x9
    80003018:	10468693          	addi	a3,a3,260 # 8000c118 <CONSOLE_STATUS+0x108>
    8000301c:	01400613          	li	a2,20
    80003020:	00009597          	auipc	a1,0x9
    80003024:	0d058593          	addi	a1,a1,208 # 8000c0f0 <CONSOLE_STATUS+0xe0>
    80003028:	00009517          	auipc	a0,0x9
    8000302c:	11850513          	addi	a0,a0,280 # 8000c140 <CONSOLE_STATUS+0x130>
    80003030:	00002097          	auipc	ra,0x2
    80003034:	6ec080e7          	jalr	1772(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    80003038:	fb5ff06f          	j	80002fec <_ZN14ConsoleManagerC1Ev+0x44>
    8000303c:	00050993          	mv	s3,a0
ConsoleManager::ConsoleManager(){
    80003040:	00090513          	mv	a0,s2
    80003044:	00000097          	auipc	ra,0x0
    80003048:	f38080e7          	jalr	-200(ra) # 80002f7c <_ZN14ConsoleManager13consoleBufferD1Ev>
    8000304c:	00048513          	mv	a0,s1
    80003050:	00000097          	auipc	ra,0x0
    80003054:	f2c080e7          	jalr	-212(ra) # 80002f7c <_ZN14ConsoleManager13consoleBufferD1Ev>
    80003058:	00098513          	mv	a0,s3
    8000305c:	0000d097          	auipc	ra,0xd
    80003060:	48c080e7          	jalr	1164(ra) # 800104e8 <_Unwind_Resume>

0000000080003064 <_ZN14ConsoleManagerD1Ev>:
ConsoleManager::~ConsoleManager(){
    80003064:	fe010113          	addi	sp,sp,-32
    80003068:	00113c23          	sd	ra,24(sp)
    8000306c:	00813823          	sd	s0,16(sp)
    80003070:	00913423          	sd	s1,8(sp)
    80003074:	02010413          	addi	s0,sp,32
    80003078:	00050493          	mv	s1,a0
    8000307c:	22050513          	addi	a0,a0,544
    80003080:	00000097          	auipc	ra,0x0
    80003084:	efc080e7          	jalr	-260(ra) # 80002f7c <_ZN14ConsoleManager13consoleBufferD1Ev>
    80003088:	00048513          	mv	a0,s1
    8000308c:	00000097          	auipc	ra,0x0
    80003090:	ef0080e7          	jalr	-272(ra) # 80002f7c <_ZN14ConsoleManager13consoleBufferD1Ev>
}
    80003094:	01813083          	ld	ra,24(sp)
    80003098:	01013403          	ld	s0,16(sp)
    8000309c:	00813483          	ld	s1,8(sp)
    800030a0:	02010113          	addi	sp,sp,32
    800030a4:	00008067          	ret

00000000800030a8 <_ZN14ConsoleManager13consoleBuffer4initEv>:

void ConsoleManager::consoleBuffer::init(){
    800030a8:	ff010113          	addi	sp,sp,-16
    800030ac:	00113423          	sd	ra,8(sp)
    800030b0:	00813023          	sd	s0,0(sp)
    800030b4:	01010413          	addi	s0,sp,16
    _sem::open(&sem, 0);
    800030b8:	00000593          	li	a1,0
    800030bc:	00002097          	auipc	ra,0x2
    800030c0:	fd0080e7          	jalr	-48(ra) # 8000508c <_ZN4_sem4openEPPS_j>
}
    800030c4:	00813083          	ld	ra,8(sp)
    800030c8:	00013403          	ld	s0,0(sp)
    800030cc:	01010113          	addi	sp,sp,16
    800030d0:	00008067          	ret

00000000800030d4 <_ZN14ConsoleManager4initEv>:
void ConsoleManager::init(){
    800030d4:	fe010113          	addi	sp,sp,-32
    800030d8:	00113c23          	sd	ra,24(sp)
    800030dc:	00813823          	sd	s0,16(sp)
    800030e0:	00913423          	sd	s1,8(sp)
    800030e4:	02010413          	addi	s0,sp,32
    800030e8:	00050493          	mv	s1,a0
    inBuffer.init();
    800030ec:	00000097          	auipc	ra,0x0
    800030f0:	fbc080e7          	jalr	-68(ra) # 800030a8 <_ZN14ConsoleManager13consoleBuffer4initEv>
    outBuffer.init();
    800030f4:	22048513          	addi	a0,s1,544
    800030f8:	00000097          	auipc	ra,0x0
    800030fc:	fb0080e7          	jalr	-80(ra) # 800030a8 <_ZN14ConsoleManager13consoleBuffer4initEv>
    waitingThreads = 0;
    80003100:	4404a023          	sw	zero,1088(s1)
}
    80003104:	01813083          	ld	ra,24(sp)
    80003108:	01013403          	ld	s0,16(sp)
    8000310c:	00813483          	ld	s1,8(sp)
    80003110:	02010113          	addi	sp,sp,32
    80003114:	00008067          	ret

0000000080003118 <_ZN14ConsoleManager13consoleBuffer3putEc>:

void ConsoleManager::consoleBuffer::put(char c){
    80003118:	ff010113          	addi	sp,sp,-16
    8000311c:	00113423          	sd	ra,8(sp)
    80003120:	00813023          	sd	s0,0(sp)
    80003124:	01010413          	addi	s0,sp,16
    buffer[tail] = c;
    80003128:	21053783          	ld	a5,528(a0)
    8000312c:	00f50733          	add	a4,a0,a5
    80003130:	00b70423          	sb	a1,8(a4)
    tail = (tail + 1) % BUFFER_SIZE;
    80003134:	00178793          	addi	a5,a5,1
    80003138:	1ff7f793          	andi	a5,a5,511
    8000313c:	20f53823          	sd	a5,528(a0)
    size++;
    80003140:	21853783          	ld	a5,536(a0)
    80003144:	00178793          	addi	a5,a5,1
    80003148:	20f53c23          	sd	a5,536(a0)
    sem_signal(sem);
    8000314c:	00053503          	ld	a0,0(a0)
    80003150:	fffff097          	auipc	ra,0xfffff
    80003154:	228080e7          	jalr	552(ra) # 80002378 <_Z10sem_signalP4_sem>
}
    80003158:	00813083          	ld	ra,8(sp)
    8000315c:	00013403          	ld	s0,0(sp)
    80003160:	01010113          	addi	sp,sp,16
    80003164:	00008067          	ret

0000000080003168 <_ZN14ConsoleManager13consoleBuffer3getEv>:

char ConsoleManager::consoleBuffer::get(){
    80003168:	fe010113          	addi	sp,sp,-32
    8000316c:	00113c23          	sd	ra,24(sp)
    80003170:	00813823          	sd	s0,16(sp)
    80003174:	00913423          	sd	s1,8(sp)
    80003178:	02010413          	addi	s0,sp,32
    8000317c:	00050493          	mv	s1,a0
    sem_wait(sem);
    80003180:	00053503          	ld	a0,0(a0)
    80003184:	fffff097          	auipc	ra,0xfffff
    80003188:	1c8080e7          	jalr	456(ra) # 8000234c <_Z8sem_waitP4_sem>
    char c = buffer[head];
    8000318c:	2084b783          	ld	a5,520(s1)
    80003190:	00f48733          	add	a4,s1,a5
    80003194:	00874503          	lbu	a0,8(a4)
    head = (head + 1) % BUFFER_SIZE;
    80003198:	00178793          	addi	a5,a5,1
    8000319c:	1ff7f793          	andi	a5,a5,511
    800031a0:	20f4b423          	sd	a5,520(s1)
    size--;
    800031a4:	2184b783          	ld	a5,536(s1)
    800031a8:	fff78793          	addi	a5,a5,-1
    800031ac:	20f4bc23          	sd	a5,536(s1)
    return c;
}
    800031b0:	01813083          	ld	ra,24(sp)
    800031b4:	01013403          	ld	s0,16(sp)
    800031b8:	00813483          	ld	s1,8(sp)
    800031bc:	02010113          	addi	sp,sp,32
    800031c0:	00008067          	ret

00000000800031c4 <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>:

bool ConsoleManager::consoleBuffer::isEmpty(){
    800031c4:	ff010113          	addi	sp,sp,-16
    800031c8:	00813423          	sd	s0,8(sp)
    800031cc:	01010413          	addi	s0,sp,16
    return size == 0;
    800031d0:	21853503          	ld	a0,536(a0)
}
    800031d4:	00153513          	seqz	a0,a0
    800031d8:	00813403          	ld	s0,8(sp)
    800031dc:	01010113          	addi	sp,sp,16
    800031e0:	00008067          	ret

00000000800031e4 <_ZN14ConsoleManager13consoleBuffer6isFullEv>:

bool ConsoleManager::consoleBuffer::isFull(){
    800031e4:	ff010113          	addi	sp,sp,-16
    800031e8:	00813423          	sd	s0,8(sp)
    800031ec:	01010413          	addi	s0,sp,16
    return size == BUFFER_SIZE;
    800031f0:	21853503          	ld	a0,536(a0)
    800031f4:	e0050513          	addi	a0,a0,-512
}
    800031f8:	00153513          	seqz	a0,a0
    800031fc:	00813403          	ld	s0,8(sp)
    80003200:	01010113          	addi	sp,sp,16
    80003204:	00008067          	ret

0000000080003208 <_ZN14ConsoleManager4putcEc>:

void ConsoleManager::putc(char c){
    80003208:	ff010113          	addi	sp,sp,-16
    8000320c:	00113423          	sd	ra,8(sp)
    80003210:	00813023          	sd	s0,0(sp)
    80003214:	01010413          	addi	s0,sp,16
    80003218:	00050593          	mv	a1,a0
    instance->outBuffer.put(c);
    8000321c:	0000c517          	auipc	a0,0xc
    80003220:	18453503          	ld	a0,388(a0) # 8000f3a0 <_ZN14ConsoleManager8instanceE>
    80003224:	22050513          	addi	a0,a0,544
    80003228:	00000097          	auipc	ra,0x0
    8000322c:	ef0080e7          	jalr	-272(ra) # 80003118 <_ZN14ConsoleManager13consoleBuffer3putEc>
}
    80003230:	00813083          	ld	ra,8(sp)
    80003234:	00013403          	ld	s0,0(sp)
    80003238:	01010113          	addi	sp,sp,16
    8000323c:	00008067          	ret

0000000080003240 <_ZN14ConsoleManager4getcEv>:

char ConsoleManager::getc(){
    80003240:	fe010113          	addi	sp,sp,-32
    80003244:	00113c23          	sd	ra,24(sp)
    80003248:	00813823          	sd	s0,16(sp)
    8000324c:	00913423          	sd	s1,8(sp)
    80003250:	02010413          	addi	s0,sp,32
    instance->waitingThreads++;
    80003254:	0000c497          	auipc	s1,0xc
    80003258:	14c48493          	addi	s1,s1,332 # 8000f3a0 <_ZN14ConsoleManager8instanceE>
    8000325c:	0004b503          	ld	a0,0(s1)
    80003260:	44052783          	lw	a5,1088(a0)
    80003264:	0017879b          	addiw	a5,a5,1
    80003268:	44f52023          	sw	a5,1088(a0)
    char c = instance->inBuffer.get();
    8000326c:	00000097          	auipc	ra,0x0
    80003270:	efc080e7          	jalr	-260(ra) # 80003168 <_ZN14ConsoleManager13consoleBuffer3getEv>
    instance->waitingThreads--;
    80003274:	0004b703          	ld	a4,0(s1)
    80003278:	44072783          	lw	a5,1088(a4)
    8000327c:	fff7879b          	addiw	a5,a5,-1
    80003280:	44f72023          	sw	a5,1088(a4)
    return c;
}
    80003284:	01813083          	ld	ra,24(sp)
    80003288:	01013403          	ld	s0,16(sp)
    8000328c:	00813483          	ld	s1,8(sp)
    80003290:	02010113          	addi	sp,sp,32
    80003294:	00008067          	ret

0000000080003298 <_ZN14ConsoleManager8finishedEv>:

bool ConsoleManager::finished(){
    80003298:	fe010113          	addi	sp,sp,-32
    8000329c:	00113c23          	sd	ra,24(sp)
    800032a0:	00813823          	sd	s0,16(sp)
    800032a4:	00913423          	sd	s1,8(sp)
    800032a8:	02010413          	addi	s0,sp,32
    return instance->outBuffer.isEmpty() && instance->waitingThreads == 0;
    800032ac:	0000c497          	auipc	s1,0xc
    800032b0:	0f44b483          	ld	s1,244(s1) # 8000f3a0 <_ZN14ConsoleManager8instanceE>
    800032b4:	22048513          	addi	a0,s1,544
    800032b8:	00000097          	auipc	ra,0x0
    800032bc:	f0c080e7          	jalr	-244(ra) # 800031c4 <_ZN14ConsoleManager13consoleBuffer7isEmptyEv>
    800032c0:	00050a63          	beqz	a0,800032d4 <_ZN14ConsoleManager8finishedEv+0x3c>
    800032c4:	4404a783          	lw	a5,1088(s1)
    800032c8:	00078863          	beqz	a5,800032d8 <_ZN14ConsoleManager8finishedEv+0x40>
    800032cc:	00000513          	li	a0,0
    800032d0:	0080006f          	j	800032d8 <_ZN14ConsoleManager8finishedEv+0x40>
    800032d4:	00000513          	li	a0,0
}
    800032d8:	01813083          	ld	ra,24(sp)
    800032dc:	01013403          	ld	s0,16(sp)
    800032e0:	00813483          	ld	s1,8(sp)
    800032e4:	02010113          	addi	sp,sp,32
    800032e8:	00008067          	ret

00000000800032ec <_ZN14ConsoleManager13outputHandlerEv>:

void ConsoleManager::outputHandler(){
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
    800032ec:	0000c797          	auipc	a5,0xc
    800032f0:	fec7b783          	ld	a5,-20(a5) # 8000f2d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800032f4:	0007b783          	ld	a5,0(a5)
    800032f8:	0007c783          	lbu	a5,0(a5)
    800032fc:	0207f793          	andi	a5,a5,32
    80003300:	06078463          	beqz	a5,80003368 <_ZN14ConsoleManager13outputHandlerEv+0x7c>
void ConsoleManager::outputHandler(){
    80003304:	fe010113          	addi	sp,sp,-32
    80003308:	00113c23          	sd	ra,24(sp)
    8000330c:	00813823          	sd	s0,16(sp)
    80003310:	00913423          	sd	s1,8(sp)
    80003314:	02010413          	addi	s0,sp,32
        (*(char*)CONSOLE_TX_DATA) = instance->outBuffer.get();
    80003318:	0000c797          	auipc	a5,0xc
    8000331c:	fd07b783          	ld	a5,-48(a5) # 8000f2e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80003320:	0007b483          	ld	s1,0(a5)
    80003324:	0000c517          	auipc	a0,0xc
    80003328:	07c53503          	ld	a0,124(a0) # 8000f3a0 <_ZN14ConsoleManager8instanceE>
    8000332c:	22050513          	addi	a0,a0,544
    80003330:	00000097          	auipc	ra,0x0
    80003334:	e38080e7          	jalr	-456(ra) # 80003168 <_ZN14ConsoleManager13consoleBuffer3getEv>
    80003338:	00a48023          	sb	a0,0(s1)
    while(*((char*)(CONSOLE_STATUS)) & CONSOLE_TX_STATUS_BIT){
    8000333c:	0000c797          	auipc	a5,0xc
    80003340:	f9c7b783          	ld	a5,-100(a5) # 8000f2d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003344:	0007b783          	ld	a5,0(a5)
    80003348:	0007c783          	lbu	a5,0(a5)
    8000334c:	0207f793          	andi	a5,a5,32
    80003350:	fc0794e3          	bnez	a5,80003318 <_ZN14ConsoleManager13outputHandlerEv+0x2c>
    }
}
    80003354:	01813083          	ld	ra,24(sp)
    80003358:	01013403          	ld	s0,16(sp)
    8000335c:	00813483          	ld	s1,8(sp)
    80003360:	02010113          	addi	sp,sp,32
    80003364:	00008067          	ret
    80003368:	00008067          	ret

000000008000336c <_ZN14ConsoleManager12inputHandlerEv>:

void ConsoleManager::inputHandler(){
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    8000336c:	0000c797          	auipc	a5,0xc
    80003370:	f6c7b783          	ld	a5,-148(a5) # 8000f2d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003374:	0007b783          	ld	a5,0(a5)
    80003378:	0007c783          	lbu	a5,0(a5)
    8000337c:	0017f793          	andi	a5,a5,1
    80003380:	04078e63          	beqz	a5,800033dc <_ZN14ConsoleManager12inputHandlerEv+0x70>
void ConsoleManager::inputHandler(){
    80003384:	ff010113          	addi	sp,sp,-16
    80003388:	00113423          	sd	ra,8(sp)
    8000338c:	00813023          	sd	s0,0(sp)
    80003390:	01010413          	addi	s0,sp,16
        char ch =(*(char*)CONSOLE_RX_DATA);
    80003394:	0000c797          	auipc	a5,0xc
    80003398:	f3c7b783          	ld	a5,-196(a5) # 8000f2d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000339c:	0007b783          	ld	a5,0(a5)
        instance->inBuffer.put(ch);
    800033a0:	0007c583          	lbu	a1,0(a5)
    800033a4:	0000c517          	auipc	a0,0xc
    800033a8:	ffc53503          	ld	a0,-4(a0) # 8000f3a0 <_ZN14ConsoleManager8instanceE>
    800033ac:	00000097          	auipc	ra,0x0
    800033b0:	d6c080e7          	jalr	-660(ra) # 80003118 <_ZN14ConsoleManager13consoleBuffer3putEc>
    while((*((char*)(CONSOLE_STATUS)) & CONSOLE_RX_STATUS_BIT )){
    800033b4:	0000c797          	auipc	a5,0xc
    800033b8:	f247b783          	ld	a5,-220(a5) # 8000f2d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800033bc:	0007b783          	ld	a5,0(a5)
    800033c0:	0007c783          	lbu	a5,0(a5)
    800033c4:	0017f793          	andi	a5,a5,1
    800033c8:	fc0796e3          	bnez	a5,80003394 <_ZN14ConsoleManager12inputHandlerEv+0x28>
    }
    800033cc:	00813083          	ld	ra,8(sp)
    800033d0:	00013403          	ld	s0,0(sp)
    800033d4:	01010113          	addi	sp,sp,16
    800033d8:	00008067          	ret
    800033dc:	00008067          	ret

00000000800033e0 <_ZN11HeapManagerC1Ev>:
#include "heapManager.h"
#include "consoleManager.h"

HeapManager* HeapManager::instance = 0;

HeapManager::HeapManager(){
    800033e0:	fe010113          	addi	sp,sp,-32
    800033e4:	00113c23          	sd	ra,24(sp)
    800033e8:	00813823          	sd	s0,16(sp)
    800033ec:	00913423          	sd	s1,8(sp)
    800033f0:	02010413          	addi	s0,sp,32
    800033f4:	00050493          	mv	s1,a0
    assert(instance == 0);
    800033f8:	0000c797          	auipc	a5,0xc
    800033fc:	fb07b783          	ld	a5,-80(a5) # 8000f3a8 <_ZN11HeapManager8instanceE>
    80003400:	02079063          	bnez	a5,80003420 <_ZN11HeapManagerC1Ev+0x40>
    instance = this;
    80003404:	0000c797          	auipc	a5,0xc
    80003408:	fa97b223          	sd	s1,-92(a5) # 8000f3a8 <_ZN11HeapManager8instanceE>
}
    8000340c:	01813083          	ld	ra,24(sp)
    80003410:	01013403          	ld	s0,16(sp)
    80003414:	00813483          	ld	s1,8(sp)
    80003418:	02010113          	addi	sp,sp,32
    8000341c:	00008067          	ret
    assert(instance == 0);
    80003420:	00009697          	auipc	a3,0x9
    80003424:	d3068693          	addi	a3,a3,-720 # 8000c150 <CONSOLE_STATUS+0x140>
    80003428:	01200613          	li	a2,18
    8000342c:	00009597          	auipc	a1,0x9
    80003430:	d4458593          	addi	a1,a1,-700 # 8000c170 <CONSOLE_STATUS+0x160>
    80003434:	00009517          	auipc	a0,0x9
    80003438:	d0c50513          	addi	a0,a0,-756 # 8000c140 <CONSOLE_STATUS+0x130>
    8000343c:	00002097          	auipc	ra,0x2
    80003440:	2e0080e7          	jalr	736(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    80003444:	fc1ff06f          	j	80003404 <_ZN11HeapManagerC1Ev+0x24>

0000000080003448 <_ZN11HeapManagerD1Ev>:

HeapManager::~HeapManager(){
    80003448:	ff010113          	addi	sp,sp,-16
    8000344c:	00813423          	sd	s0,8(sp)
    80003450:	01010413          	addi	s0,sp,16
    
}
    80003454:	00813403          	ld	s0,8(sp)
    80003458:	01010113          	addi	sp,sp,16
    8000345c:	00008067          	ret

0000000080003460 <_ZN11HeapManager4initEmm>:

void HeapManager::init(uint64 nStart, size_t nEnd){
    80003460:	fd010113          	addi	sp,sp,-48
    80003464:	02113423          	sd	ra,40(sp)
    80003468:	02813023          	sd	s0,32(sp)
    8000346c:	00913c23          	sd	s1,24(sp)
    80003470:	01213823          	sd	s2,16(sp)
    80003474:	01313423          	sd	s3,8(sp)
    80003478:	03010413          	addi	s0,sp,48
    8000347c:	00050993          	mv	s3,a0
    80003480:	00058913          	mv	s2,a1
    /// Align the start address
    #ifdef CHECK_CONDITIONS
        assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003484:	40b604b3          	sub	s1,a2,a1
    80003488:	0414b793          	sltiu	a5,s1,65
    8000348c:	0c079a63          	bnez	a5,80003560 <_ZN11HeapManager4initEmm+0x100>
    #endif
    m_pHead = reinterpret_cast<HeapFreeSectionHeader*>(nStart);
    80003490:	0129b023          	sd	s2,0(s3)
    m_pHead->u32Magic = HEAP_BLOCK_MAGIC;
    80003494:	fe100793          	li	a5,-31
    80003498:	00f90c23          	sb	a5,24(s2)
    8000349c:	ffe00793          	li	a5,-2
    800034a0:	00f90ca3          	sb	a5,25(s2)
    800034a4:	00f00793          	li	a5,15
    800034a8:	00f90d23          	sb	a5,26(s2)
    800034ac:	01c00793          	li	a5,28
    800034b0:	00f90da3          	sb	a5,27(s2)
    /// -1 because we need to store the header while keeping alignment
    m_pHead->nSize = (nEnd - nStart) / MEM_BLOCK_SIZE - 1;
    800034b4:	0064d613          	srli	a2,s1,0x6
    800034b8:	0009b783          	ld	a5,0(s3)
    800034bc:	fff60613          	addi	a2,a2,-1
    800034c0:	00c78823          	sb	a2,16(a5)
    800034c4:	00865713          	srli	a4,a2,0x8
    800034c8:	00e788a3          	sb	a4,17(a5)
    800034cc:	01065713          	srli	a4,a2,0x10
    800034d0:	00e78923          	sb	a4,18(a5)
    800034d4:	0186571b          	srliw	a4,a2,0x18
    800034d8:	00e789a3          	sb	a4,19(a5)
    800034dc:	02065713          	srli	a4,a2,0x20
    800034e0:	00e78a23          	sb	a4,20(a5)
    800034e4:	02865713          	srli	a4,a2,0x28
    800034e8:	00e78aa3          	sb	a4,21(a5)
    800034ec:	03065713          	srli	a4,a2,0x30
    800034f0:	00e78b23          	sb	a4,22(a5)
    800034f4:	03865613          	srli	a2,a2,0x38
    800034f8:	00c78ba3          	sb	a2,23(a5)
    m_pHead->pNext = 0;
    800034fc:	0009b783          	ld	a5,0(s3)
    80003500:	00078023          	sb	zero,0(a5)
    80003504:	000780a3          	sb	zero,1(a5)
    80003508:	00078123          	sb	zero,2(a5)
    8000350c:	000781a3          	sb	zero,3(a5)
    80003510:	00078223          	sb	zero,4(a5)
    80003514:	000782a3          	sb	zero,5(a5)
    80003518:	00078323          	sb	zero,6(a5)
    8000351c:	000783a3          	sb	zero,7(a5)
    m_pHead->pPrev = 0;
    80003520:	0009b783          	ld	a5,0(s3)
    80003524:	00078423          	sb	zero,8(a5)
    80003528:	000784a3          	sb	zero,9(a5)
    8000352c:	00078523          	sb	zero,10(a5)
    80003530:	000785a3          	sb	zero,11(a5)
    80003534:	00078623          	sb	zero,12(a5)
    80003538:	000786a3          	sb	zero,13(a5)
    8000353c:	00078723          	sb	zero,14(a5)
    80003540:	000787a3          	sb	zero,15(a5)
}
    80003544:	02813083          	ld	ra,40(sp)
    80003548:	02013403          	ld	s0,32(sp)
    8000354c:	01813483          	ld	s1,24(sp)
    80003550:	01013903          	ld	s2,16(sp)
    80003554:	00813983          	ld	s3,8(sp)
    80003558:	03010113          	addi	sp,sp,48
    8000355c:	00008067          	ret
        assert(nEnd - nStart > MEM_BLOCK_SIZE);
    80003560:	00009697          	auipc	a3,0x9
    80003564:	c2868693          	addi	a3,a3,-984 # 8000c188 <CONSOLE_STATUS+0x178>
    80003568:	01d00613          	li	a2,29
    8000356c:	00009597          	auipc	a1,0x9
    80003570:	c0458593          	addi	a1,a1,-1020 # 8000c170 <CONSOLE_STATUS+0x160>
    80003574:	00009517          	auipc	a0,0x9
    80003578:	c3c50513          	addi	a0,a0,-964 # 8000c1b0 <CONSOLE_STATUS+0x1a0>
    8000357c:	00002097          	auipc	ra,0x2
    80003580:	1a0080e7          	jalr	416(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    80003584:	f0dff06f          	j	80003490 <_ZN11HeapManager4initEmm+0x30>

0000000080003588 <_ZN11HeapManager17getHeapFreeMemoryEv>:

size_t HeapManager::getHeapFreeMemory(){
    80003588:	fe010113          	addi	sp,sp,-32
    8000358c:	00113c23          	sd	ra,24(sp)
    80003590:	00813823          	sd	s0,16(sp)
    80003594:	00913423          	sd	s1,8(sp)
    80003598:	01213023          	sd	s2,0(sp)
    8000359c:	02010413          	addi	s0,sp,32
    size_t nFreeMemory = 0;
    HeapFreeSectionHeader* pCurrent = m_pHead;
    800035a0:	00053483          	ld	s1,0(a0)
    size_t nFreeMemory = 0;
    800035a4:	00000913          	li	s2,0
    800035a8:	0b80006f          	j	80003660 <_ZN11HeapManager17getHeapFreeMemoryEv+0xd8>
    while(pCurrent != 0){
        #ifdef CHECK_CONDITIONS
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        #endif
        nFreeMemory += pCurrent->nSize;
    800035ac:	0104c783          	lbu	a5,16(s1)
    800035b0:	0114c703          	lbu	a4,17(s1)
    800035b4:	00871713          	slli	a4,a4,0x8
    800035b8:	00f76733          	or	a4,a4,a5
    800035bc:	0124c783          	lbu	a5,18(s1)
    800035c0:	01079793          	slli	a5,a5,0x10
    800035c4:	00e7e733          	or	a4,a5,a4
    800035c8:	0134c783          	lbu	a5,19(s1)
    800035cc:	01879793          	slli	a5,a5,0x18
    800035d0:	00e7e7b3          	or	a5,a5,a4
    800035d4:	0144c703          	lbu	a4,20(s1)
    800035d8:	02071713          	slli	a4,a4,0x20
    800035dc:	00f767b3          	or	a5,a4,a5
    800035e0:	0154c703          	lbu	a4,21(s1)
    800035e4:	02871713          	slli	a4,a4,0x28
    800035e8:	00f76733          	or	a4,a4,a5
    800035ec:	0164c783          	lbu	a5,22(s1)
    800035f0:	03079793          	slli	a5,a5,0x30
    800035f4:	00e7e733          	or	a4,a5,a4
    800035f8:	0174c783          	lbu	a5,23(s1)
    800035fc:	03879793          	slli	a5,a5,0x38
    80003600:	00e7e7b3          	or	a5,a5,a4
    80003604:	00f90933          	add	s2,s2,a5
        pCurrent = pCurrent->pNext;
    80003608:	0004c703          	lbu	a4,0(s1)
    8000360c:	0014c783          	lbu	a5,1(s1)
    80003610:	00879793          	slli	a5,a5,0x8
    80003614:	00e7e733          	or	a4,a5,a4
    80003618:	0024c783          	lbu	a5,2(s1)
    8000361c:	01079793          	slli	a5,a5,0x10
    80003620:	00e7e7b3          	or	a5,a5,a4
    80003624:	0034c703          	lbu	a4,3(s1)
    80003628:	01871713          	slli	a4,a4,0x18
    8000362c:	00f767b3          	or	a5,a4,a5
    80003630:	0044c703          	lbu	a4,4(s1)
    80003634:	02071713          	slli	a4,a4,0x20
    80003638:	00f76733          	or	a4,a4,a5
    8000363c:	0054c783          	lbu	a5,5(s1)
    80003640:	02879793          	slli	a5,a5,0x28
    80003644:	00e7e733          	or	a4,a5,a4
    80003648:	0064c783          	lbu	a5,6(s1)
    8000364c:	03079793          	slli	a5,a5,0x30
    80003650:	00e7e7b3          	or	a5,a5,a4
    80003654:	0074c483          	lbu	s1,7(s1)
    80003658:	03849493          	slli	s1,s1,0x38
    8000365c:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    80003660:	06048263          	beqz	s1,800036c4 <_ZN11HeapManager17getHeapFreeMemoryEv+0x13c>
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    80003664:	0184c783          	lbu	a5,24(s1)
    80003668:	0194c703          	lbu	a4,25(s1)
    8000366c:	00871713          	slli	a4,a4,0x8
    80003670:	00f76733          	or	a4,a4,a5
    80003674:	01a4c783          	lbu	a5,26(s1)
    80003678:	01079793          	slli	a5,a5,0x10
    8000367c:	00e7e733          	or	a4,a5,a4
    80003680:	01b4c783          	lbu	a5,27(s1)
    80003684:	01879793          	slli	a5,a5,0x18
    80003688:	00e7e7b3          	or	a5,a5,a4
    8000368c:	0007879b          	sext.w	a5,a5
    80003690:	1c100737          	lui	a4,0x1c100
    80003694:	ee170713          	addi	a4,a4,-287 # 1c0ffee1 <_entry-0x63f0011f>
    80003698:	f0e78ae3          	beq	a5,a4,800035ac <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    8000369c:	00009697          	auipc	a3,0x9
    800036a0:	b3468693          	addi	a3,a3,-1228 # 8000c1d0 <CONSOLE_STATUS+0x1c0>
    800036a4:	02c00613          	li	a2,44
    800036a8:	00009597          	auipc	a1,0x9
    800036ac:	ac858593          	addi	a1,a1,-1336 # 8000c170 <CONSOLE_STATUS+0x160>
    800036b0:	00009517          	auipc	a0,0x9
    800036b4:	b4850513          	addi	a0,a0,-1208 # 8000c1f8 <CONSOLE_STATUS+0x1e8>
    800036b8:	00002097          	auipc	ra,0x2
    800036bc:	064080e7          	jalr	100(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    800036c0:	eedff06f          	j	800035ac <_ZN11HeapManager17getHeapFreeMemoryEv+0x24>
    }
    return nFreeMemory;
}
    800036c4:	00090513          	mv	a0,s2
    800036c8:	01813083          	ld	ra,24(sp)
    800036cc:	01013403          	ld	s0,16(sp)
    800036d0:	00813483          	ld	s1,8(sp)
    800036d4:	00013903          	ld	s2,0(sp)
    800036d8:	02010113          	addi	sp,sp,32
    800036dc:	00008067          	ret

00000000800036e0 <_ZN11HeapManager12heapAllocateEm>:

void* HeapManager::heapAllocate(size_t nSize){
    800036e0:	fd010113          	addi	sp,sp,-48
    800036e4:	02113423          	sd	ra,40(sp)
    800036e8:	02813023          	sd	s0,32(sp)
    800036ec:	00913c23          	sd	s1,24(sp)
    800036f0:	01213823          	sd	s2,16(sp)
    800036f4:	01313423          	sd	s3,8(sp)
    800036f8:	03010413          	addi	s0,sp,48
    800036fc:	00050993          	mv	s3,a0
    80003700:	00058913          	mv	s2,a1
    HeapFreeSectionHeader* pCurrent = m_pHead;
    80003704:	00053483          	ld	s1,0(a0)
    80003708:	0c00006f          	j	800037c8 <_ZN11HeapManager12heapAllocateEm+0xe8>
    while(pCurrent != 0){
        #ifdef CHECK_CONDITIONS
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
        #endif
        if(pCurrent->nSize > nSize + 1){
    8000370c:	0104c783          	lbu	a5,16(s1)
    80003710:	0114c703          	lbu	a4,17(s1)
    80003714:	00871713          	slli	a4,a4,0x8
    80003718:	00f76733          	or	a4,a4,a5
    8000371c:	0124c783          	lbu	a5,18(s1)
    80003720:	01079793          	slli	a5,a5,0x10
    80003724:	00e7e733          	or	a4,a5,a4
    80003728:	0134c783          	lbu	a5,19(s1)
    8000372c:	01879793          	slli	a5,a5,0x18
    80003730:	00e7e7b3          	or	a5,a5,a4
    80003734:	0144c703          	lbu	a4,20(s1)
    80003738:	02071713          	slli	a4,a4,0x20
    8000373c:	00f767b3          	or	a5,a4,a5
    80003740:	0154c703          	lbu	a4,21(s1)
    80003744:	02871713          	slli	a4,a4,0x28
    80003748:	00f76733          	or	a4,a4,a5
    8000374c:	0164c783          	lbu	a5,22(s1)
    80003750:	03079793          	slli	a5,a5,0x30
    80003754:	00e7e733          	or	a4,a5,a4
    80003758:	0174c783          	lbu	a5,23(s1)
    8000375c:	03879793          	slli	a5,a5,0x38
    80003760:	00e7e7b3          	or	a5,a5,a4
    80003764:	00190713          	addi	a4,s2,1
    80003768:	0cf76263          	bltu	a4,a5,8000382c <_ZN11HeapManager12heapAllocateEm+0x14c>
            if(pCurrent == m_pHead){
                m_pHead = pNew;
            }
            pCurrent->nSize = nSize;
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }else if(pCurrent->nSize >= nSize){
    8000376c:	3d27fe63          	bgeu	a5,s2,80003b48 <_ZN11HeapManager12heapAllocateEm+0x468>
            if(pCurrent == m_pHead){
                m_pHead = pCurrent->pNext;
            }
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
        }
        pCurrent = pCurrent->pNext;
    80003770:	0004c703          	lbu	a4,0(s1)
    80003774:	0014c783          	lbu	a5,1(s1)
    80003778:	00879793          	slli	a5,a5,0x8
    8000377c:	00e7e733          	or	a4,a5,a4
    80003780:	0024c783          	lbu	a5,2(s1)
    80003784:	01079793          	slli	a5,a5,0x10
    80003788:	00e7e7b3          	or	a5,a5,a4
    8000378c:	0034c703          	lbu	a4,3(s1)
    80003790:	01871713          	slli	a4,a4,0x18
    80003794:	00f767b3          	or	a5,a4,a5
    80003798:	0044c703          	lbu	a4,4(s1)
    8000379c:	02071713          	slli	a4,a4,0x20
    800037a0:	00f76733          	or	a4,a4,a5
    800037a4:	0054c783          	lbu	a5,5(s1)
    800037a8:	02879793          	slli	a5,a5,0x28
    800037ac:	00e7e733          	or	a4,a5,a4
    800037b0:	0064c783          	lbu	a5,6(s1)
    800037b4:	03079793          	slli	a5,a5,0x30
    800037b8:	00e7e7b3          	or	a5,a5,a4
    800037bc:	0074c483          	lbu	s1,7(s1)
    800037c0:	03849493          	slli	s1,s1,0x38
    800037c4:	00f4e4b3          	or	s1,s1,a5
    while(pCurrent != 0){
    800037c8:	5c048863          	beqz	s1,80003d98 <_ZN11HeapManager12heapAllocateEm+0x6b8>
            assert(pCurrent->u32Magic == HEAP_BLOCK_MAGIC);
    800037cc:	0184c783          	lbu	a5,24(s1)
    800037d0:	0194c703          	lbu	a4,25(s1)
    800037d4:	00871713          	slli	a4,a4,0x8
    800037d8:	00f76733          	or	a4,a4,a5
    800037dc:	01a4c783          	lbu	a5,26(s1)
    800037e0:	01079793          	slli	a5,a5,0x10
    800037e4:	00e7e733          	or	a4,a5,a4
    800037e8:	01b4c783          	lbu	a5,27(s1)
    800037ec:	01879793          	slli	a5,a5,0x18
    800037f0:	00e7e7b3          	or	a5,a5,a4
    800037f4:	0007879b          	sext.w	a5,a5
    800037f8:	1c100737          	lui	a4,0x1c100
    800037fc:	ee170713          	addi	a4,a4,-287 # 1c0ffee1 <_entry-0x63f0011f>
    80003800:	f0e786e3          	beq	a5,a4,8000370c <_ZN11HeapManager12heapAllocateEm+0x2c>
    80003804:	00009697          	auipc	a3,0x9
    80003808:	a1c68693          	addi	a3,a3,-1508 # 8000c220 <CONSOLE_STATUS+0x210>
    8000380c:	03800613          	li	a2,56
    80003810:	00009597          	auipc	a1,0x9
    80003814:	96058593          	addi	a1,a1,-1696 # 8000c170 <CONSOLE_STATUS+0x160>
    80003818:	00009517          	auipc	a0,0x9
    8000381c:	9e050513          	addi	a0,a0,-1568 # 8000c1f8 <CONSOLE_STATUS+0x1e8>
    80003820:	00002097          	auipc	ra,0x2
    80003824:	efc080e7          	jalr	-260(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    80003828:	ee5ff06f          	j	8000370c <_ZN11HeapManager12heapAllocateEm+0x2c>
            HeapFreeSectionHeader* pNew = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pCurrent) + (nSize + 1) * MEM_BLOCK_SIZE);
    8000382c:	00671713          	slli	a4,a4,0x6
    80003830:	00048613          	mv	a2,s1
    80003834:	00970733          	add	a4,a4,s1
            pNew->nSize = pCurrent->nSize - nSize - 1;
    80003838:	412787b3          	sub	a5,a5,s2
    8000383c:	fff78793          	addi	a5,a5,-1
    80003840:	00f70823          	sb	a5,16(a4)
    80003844:	0087d693          	srli	a3,a5,0x8
    80003848:	00d708a3          	sb	a3,17(a4)
    8000384c:	0107d693          	srli	a3,a5,0x10
    80003850:	00d70923          	sb	a3,18(a4)
    80003854:	0187d69b          	srliw	a3,a5,0x18
    80003858:	00d709a3          	sb	a3,19(a4)
    8000385c:	0207d693          	srli	a3,a5,0x20
    80003860:	00d70a23          	sb	a3,20(a4)
    80003864:	0287d693          	srli	a3,a5,0x28
    80003868:	00d70aa3          	sb	a3,21(a4)
    8000386c:	0307d693          	srli	a3,a5,0x30
    80003870:	00d70b23          	sb	a3,22(a4)
    80003874:	0387d793          	srli	a5,a5,0x38
    80003878:	00f70ba3          	sb	a5,23(a4)
            pNew->pNext = pCurrent->pNext;
    8000387c:	0004c783          	lbu	a5,0(s1)
    80003880:	0014c683          	lbu	a3,1(s1)
    80003884:	00869693          	slli	a3,a3,0x8
    80003888:	00f6e7b3          	or	a5,a3,a5
    8000388c:	0024c683          	lbu	a3,2(s1)
    80003890:	01069693          	slli	a3,a3,0x10
    80003894:	00f6e6b3          	or	a3,a3,a5
    80003898:	0034c783          	lbu	a5,3(s1)
    8000389c:	01879793          	slli	a5,a5,0x18
    800038a0:	00d7e6b3          	or	a3,a5,a3
    800038a4:	0044c783          	lbu	a5,4(s1)
    800038a8:	02079793          	slli	a5,a5,0x20
    800038ac:	00d7e7b3          	or	a5,a5,a3
    800038b0:	0054c683          	lbu	a3,5(s1)
    800038b4:	02869693          	slli	a3,a3,0x28
    800038b8:	00f6e7b3          	or	a5,a3,a5
    800038bc:	0064c683          	lbu	a3,6(s1)
    800038c0:	03069693          	slli	a3,a3,0x30
    800038c4:	00f6e6b3          	or	a3,a3,a5
    800038c8:	0074c783          	lbu	a5,7(s1)
    800038cc:	03879793          	slli	a5,a5,0x38
    800038d0:	00d7e7b3          	or	a5,a5,a3
    800038d4:	00d70023          	sb	a3,0(a4)
    800038d8:	0087d693          	srli	a3,a5,0x8
    800038dc:	00d700a3          	sb	a3,1(a4)
    800038e0:	0107d693          	srli	a3,a5,0x10
    800038e4:	00d70123          	sb	a3,2(a4)
    800038e8:	0187d69b          	srliw	a3,a5,0x18
    800038ec:	00d701a3          	sb	a3,3(a4)
    800038f0:	0207d693          	srli	a3,a5,0x20
    800038f4:	00d70223          	sb	a3,4(a4)
    800038f8:	0287d693          	srli	a3,a5,0x28
    800038fc:	00d702a3          	sb	a3,5(a4)
    80003900:	0307d693          	srli	a3,a5,0x30
    80003904:	00d70323          	sb	a3,6(a4)
    80003908:	0387d793          	srli	a5,a5,0x38
    8000390c:	00f703a3          	sb	a5,7(a4)
            pNew->pPrev = pCurrent->pPrev;
    80003910:	0084c783          	lbu	a5,8(s1)
    80003914:	0094c683          	lbu	a3,9(s1)
    80003918:	00869693          	slli	a3,a3,0x8
    8000391c:	00f6e7b3          	or	a5,a3,a5
    80003920:	00a4c683          	lbu	a3,10(s1)
    80003924:	01069693          	slli	a3,a3,0x10
    80003928:	00f6e6b3          	or	a3,a3,a5
    8000392c:	00b4c783          	lbu	a5,11(s1)
    80003930:	01879793          	slli	a5,a5,0x18
    80003934:	00d7e6b3          	or	a3,a5,a3
    80003938:	00c4c783          	lbu	a5,12(s1)
    8000393c:	02079793          	slli	a5,a5,0x20
    80003940:	00d7e7b3          	or	a5,a5,a3
    80003944:	00d4c683          	lbu	a3,13(s1)
    80003948:	02869693          	slli	a3,a3,0x28
    8000394c:	00f6e7b3          	or	a5,a3,a5
    80003950:	00e4c683          	lbu	a3,14(s1)
    80003954:	03069693          	slli	a3,a3,0x30
    80003958:	00f6e6b3          	or	a3,a3,a5
    8000395c:	00f4c783          	lbu	a5,15(s1)
    80003960:	03879793          	slli	a5,a5,0x38
    80003964:	00d7e7b3          	or	a5,a5,a3
    80003968:	00d70423          	sb	a3,8(a4)
    8000396c:	0087d693          	srli	a3,a5,0x8
    80003970:	00d704a3          	sb	a3,9(a4)
    80003974:	0107d693          	srli	a3,a5,0x10
    80003978:	00d70523          	sb	a3,10(a4)
    8000397c:	0187d69b          	srliw	a3,a5,0x18
    80003980:	00d705a3          	sb	a3,11(a4)
    80003984:	0207d693          	srli	a3,a5,0x20
    80003988:	00d70623          	sb	a3,12(a4)
    8000398c:	0287d693          	srli	a3,a5,0x28
    80003990:	00d706a3          	sb	a3,13(a4)
    80003994:	0307d693          	srli	a3,a5,0x30
    80003998:	00d70723          	sb	a3,14(a4)
    8000399c:	0387d793          	srli	a5,a5,0x38
    800039a0:	00f707a3          	sb	a5,15(a4)
            pNew->u32Magic = HEAP_BLOCK_MAGIC;
    800039a4:	fe100793          	li	a5,-31
    800039a8:	00f70c23          	sb	a5,24(a4)
    800039ac:	ffe00793          	li	a5,-2
    800039b0:	00f70ca3          	sb	a5,25(a4)
    800039b4:	00f00793          	li	a5,15
    800039b8:	00f70d23          	sb	a5,26(a4)
    800039bc:	01c00793          	li	a5,28
    800039c0:	00f70da3          	sb	a5,27(a4)
            if(pCurrent->pNext != 0){
    800039c4:	0004c783          	lbu	a5,0(s1)
    800039c8:	0014c683          	lbu	a3,1(s1)
    800039cc:	00869693          	slli	a3,a3,0x8
    800039d0:	00f6e6b3          	or	a3,a3,a5
    800039d4:	0024c783          	lbu	a5,2(s1)
    800039d8:	01079793          	slli	a5,a5,0x10
    800039dc:	00d7e6b3          	or	a3,a5,a3
    800039e0:	0034c783          	lbu	a5,3(s1)
    800039e4:	01879793          	slli	a5,a5,0x18
    800039e8:	00d7e7b3          	or	a5,a5,a3
    800039ec:	0044c683          	lbu	a3,4(s1)
    800039f0:	02069693          	slli	a3,a3,0x20
    800039f4:	00f6e7b3          	or	a5,a3,a5
    800039f8:	0054c683          	lbu	a3,5(s1)
    800039fc:	02869693          	slli	a3,a3,0x28
    80003a00:	00f6e6b3          	or	a3,a3,a5
    80003a04:	0064c783          	lbu	a5,6(s1)
    80003a08:	03079793          	slli	a5,a5,0x30
    80003a0c:	00d7e6b3          	or	a3,a5,a3
    80003a10:	0074c783          	lbu	a5,7(s1)
    80003a14:	03879793          	slli	a5,a5,0x38
    80003a18:	00d7e7b3          	or	a5,a5,a3
    80003a1c:	04078063          	beqz	a5,80003a5c <_ZN11HeapManager12heapAllocateEm+0x37c>
                pCurrent->pNext->pPrev = pNew;
    80003a20:	00e78423          	sb	a4,8(a5)
    80003a24:	00875693          	srli	a3,a4,0x8
    80003a28:	00d784a3          	sb	a3,9(a5)
    80003a2c:	01075693          	srli	a3,a4,0x10
    80003a30:	00d78523          	sb	a3,10(a5)
    80003a34:	0187569b          	srliw	a3,a4,0x18
    80003a38:	00d785a3          	sb	a3,11(a5)
    80003a3c:	02075693          	srli	a3,a4,0x20
    80003a40:	00d78623          	sb	a3,12(a5)
    80003a44:	02875693          	srli	a3,a4,0x28
    80003a48:	00d786a3          	sb	a3,13(a5)
    80003a4c:	03075693          	srli	a3,a4,0x30
    80003a50:	00d78723          	sb	a3,14(a5)
    80003a54:	03875693          	srli	a3,a4,0x38
    80003a58:	00d787a3          	sb	a3,15(a5)
            if(pCurrent->pPrev != 0){
    80003a5c:	0084c783          	lbu	a5,8(s1)
    80003a60:	0094c683          	lbu	a3,9(s1)
    80003a64:	00869693          	slli	a3,a3,0x8
    80003a68:	00f6e6b3          	or	a3,a3,a5
    80003a6c:	00a4c783          	lbu	a5,10(s1)
    80003a70:	01079793          	slli	a5,a5,0x10
    80003a74:	00d7e6b3          	or	a3,a5,a3
    80003a78:	00b4c783          	lbu	a5,11(s1)
    80003a7c:	01879793          	slli	a5,a5,0x18
    80003a80:	00d7e7b3          	or	a5,a5,a3
    80003a84:	00c4c683          	lbu	a3,12(s1)
    80003a88:	02069693          	slli	a3,a3,0x20
    80003a8c:	00f6e7b3          	or	a5,a3,a5
    80003a90:	00d4c683          	lbu	a3,13(s1)
    80003a94:	02869693          	slli	a3,a3,0x28
    80003a98:	00f6e6b3          	or	a3,a3,a5
    80003a9c:	00e4c783          	lbu	a5,14(s1)
    80003aa0:	03079793          	slli	a5,a5,0x30
    80003aa4:	00d7e6b3          	or	a3,a5,a3
    80003aa8:	00f4c783          	lbu	a5,15(s1)
    80003aac:	03879793          	slli	a5,a5,0x38
    80003ab0:	00d7e7b3          	or	a5,a5,a3
    80003ab4:	04078063          	beqz	a5,80003af4 <_ZN11HeapManager12heapAllocateEm+0x414>
                pCurrent->pPrev->pNext = pNew;
    80003ab8:	00e78023          	sb	a4,0(a5)
    80003abc:	00875693          	srli	a3,a4,0x8
    80003ac0:	00d780a3          	sb	a3,1(a5)
    80003ac4:	01075693          	srli	a3,a4,0x10
    80003ac8:	00d78123          	sb	a3,2(a5)
    80003acc:	0187569b          	srliw	a3,a4,0x18
    80003ad0:	00d781a3          	sb	a3,3(a5)
    80003ad4:	02075693          	srli	a3,a4,0x20
    80003ad8:	00d78223          	sb	a3,4(a5)
    80003adc:	02875693          	srli	a3,a4,0x28
    80003ae0:	00d782a3          	sb	a3,5(a5)
    80003ae4:	03075693          	srli	a3,a4,0x30
    80003ae8:	00d78323          	sb	a3,6(a5)
    80003aec:	03875693          	srli	a3,a4,0x38
    80003af0:	00d783a3          	sb	a3,7(a5)
            if(pCurrent == m_pHead){
    80003af4:	0009b783          	ld	a5,0(s3)
    80003af8:	04978463          	beq	a5,s1,80003b40 <_ZN11HeapManager12heapAllocateEm+0x460>
            pCurrent->nSize = nSize;
    80003afc:	01248823          	sb	s2,16(s1)
    80003b00:	00895793          	srli	a5,s2,0x8
    80003b04:	00f488a3          	sb	a5,17(s1)
    80003b08:	01095793          	srli	a5,s2,0x10
    80003b0c:	00f48923          	sb	a5,18(s1)
    80003b10:	0189579b          	srliw	a5,s2,0x18
    80003b14:	00f489a3          	sb	a5,19(s1)
    80003b18:	02095793          	srli	a5,s2,0x20
    80003b1c:	00f48a23          	sb	a5,20(s1)
    80003b20:	02895793          	srli	a5,s2,0x28
    80003b24:	00f48aa3          	sb	a5,21(s1)
    80003b28:	03095793          	srli	a5,s2,0x30
    80003b2c:	00f48b23          	sb	a5,22(s1)
    80003b30:	03895913          	srli	s2,s2,0x38
    80003b34:	01248ba3          	sb	s2,23(s1)
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    80003b38:	04060493          	addi	s1,a2,64
    80003b3c:	2800006f          	j	80003dbc <_ZN11HeapManager12heapAllocateEm+0x6dc>
                m_pHead = pNew;
    80003b40:	00e9b023          	sd	a4,0(s3)
    80003b44:	fb9ff06f          	j	80003afc <_ZN11HeapManager12heapAllocateEm+0x41c>
            if(pCurrent->pPrev != 0){
    80003b48:	0084c783          	lbu	a5,8(s1)
    80003b4c:	0094c703          	lbu	a4,9(s1)
    80003b50:	00871713          	slli	a4,a4,0x8
    80003b54:	00f76733          	or	a4,a4,a5
    80003b58:	00a4c783          	lbu	a5,10(s1)
    80003b5c:	01079793          	slli	a5,a5,0x10
    80003b60:	00e7e733          	or	a4,a5,a4
    80003b64:	00b4c783          	lbu	a5,11(s1)
    80003b68:	01879793          	slli	a5,a5,0x18
    80003b6c:	00e7e7b3          	or	a5,a5,a4
    80003b70:	00c4c703          	lbu	a4,12(s1)
    80003b74:	02071713          	slli	a4,a4,0x20
    80003b78:	00f767b3          	or	a5,a4,a5
    80003b7c:	00d4c703          	lbu	a4,13(s1)
    80003b80:	02871713          	slli	a4,a4,0x28
    80003b84:	00f76733          	or	a4,a4,a5
    80003b88:	00e4c783          	lbu	a5,14(s1)
    80003b8c:	03079793          	slli	a5,a5,0x30
    80003b90:	00e7e733          	or	a4,a5,a4
    80003b94:	00f4c783          	lbu	a5,15(s1)
    80003b98:	03879793          	slli	a5,a5,0x38
    80003b9c:	00e7e7b3          	or	a5,a5,a4
    80003ba0:	08078c63          	beqz	a5,80003c38 <_ZN11HeapManager12heapAllocateEm+0x558>
                pCurrent->pPrev->pNext = pCurrent->pNext;
    80003ba4:	0004c703          	lbu	a4,0(s1)
    80003ba8:	0014c683          	lbu	a3,1(s1)
    80003bac:	00869693          	slli	a3,a3,0x8
    80003bb0:	00e6e733          	or	a4,a3,a4
    80003bb4:	0024c683          	lbu	a3,2(s1)
    80003bb8:	01069693          	slli	a3,a3,0x10
    80003bbc:	00e6e6b3          	or	a3,a3,a4
    80003bc0:	0034c703          	lbu	a4,3(s1)
    80003bc4:	01871713          	slli	a4,a4,0x18
    80003bc8:	00d766b3          	or	a3,a4,a3
    80003bcc:	0044c703          	lbu	a4,4(s1)
    80003bd0:	02071713          	slli	a4,a4,0x20
    80003bd4:	00d76733          	or	a4,a4,a3
    80003bd8:	0054c683          	lbu	a3,5(s1)
    80003bdc:	02869693          	slli	a3,a3,0x28
    80003be0:	00e6e733          	or	a4,a3,a4
    80003be4:	0064c683          	lbu	a3,6(s1)
    80003be8:	03069693          	slli	a3,a3,0x30
    80003bec:	00e6e6b3          	or	a3,a3,a4
    80003bf0:	0074c703          	lbu	a4,7(s1)
    80003bf4:	03871713          	slli	a4,a4,0x38
    80003bf8:	00d76733          	or	a4,a4,a3
    80003bfc:	00d78023          	sb	a3,0(a5)
    80003c00:	00875693          	srli	a3,a4,0x8
    80003c04:	00d780a3          	sb	a3,1(a5)
    80003c08:	01075693          	srli	a3,a4,0x10
    80003c0c:	00d78123          	sb	a3,2(a5)
    80003c10:	0187569b          	srliw	a3,a4,0x18
    80003c14:	00d781a3          	sb	a3,3(a5)
    80003c18:	02075693          	srli	a3,a4,0x20
    80003c1c:	00d78223          	sb	a3,4(a5)
    80003c20:	02875693          	srli	a3,a4,0x28
    80003c24:	00d782a3          	sb	a3,5(a5)
    80003c28:	03075693          	srli	a3,a4,0x30
    80003c2c:	00d78323          	sb	a3,6(a5)
    80003c30:	03875713          	srli	a4,a4,0x38
    80003c34:	00e783a3          	sb	a4,7(a5)
            if(pCurrent->pNext != 0){
    80003c38:	0004c783          	lbu	a5,0(s1)
    80003c3c:	0014c703          	lbu	a4,1(s1)
    80003c40:	00871713          	slli	a4,a4,0x8
    80003c44:	00f76733          	or	a4,a4,a5
    80003c48:	0024c783          	lbu	a5,2(s1)
    80003c4c:	01079793          	slli	a5,a5,0x10
    80003c50:	00e7e733          	or	a4,a5,a4
    80003c54:	0034c783          	lbu	a5,3(s1)
    80003c58:	01879793          	slli	a5,a5,0x18
    80003c5c:	00e7e7b3          	or	a5,a5,a4
    80003c60:	0044c703          	lbu	a4,4(s1)
    80003c64:	02071713          	slli	a4,a4,0x20
    80003c68:	00f767b3          	or	a5,a4,a5
    80003c6c:	0054c703          	lbu	a4,5(s1)
    80003c70:	02871713          	slli	a4,a4,0x28
    80003c74:	00f76733          	or	a4,a4,a5
    80003c78:	0064c783          	lbu	a5,6(s1)
    80003c7c:	03079793          	slli	a5,a5,0x30
    80003c80:	00e7e733          	or	a4,a5,a4
    80003c84:	0074c783          	lbu	a5,7(s1)
    80003c88:	03879793          	slli	a5,a5,0x38
    80003c8c:	00e7e7b3          	or	a5,a5,a4
    80003c90:	08078c63          	beqz	a5,80003d28 <_ZN11HeapManager12heapAllocateEm+0x648>
                pCurrent->pNext->pPrev = pCurrent->pPrev;
    80003c94:	0084c703          	lbu	a4,8(s1)
    80003c98:	0094c683          	lbu	a3,9(s1)
    80003c9c:	00869693          	slli	a3,a3,0x8
    80003ca0:	00e6e733          	or	a4,a3,a4
    80003ca4:	00a4c683          	lbu	a3,10(s1)
    80003ca8:	01069693          	slli	a3,a3,0x10
    80003cac:	00e6e6b3          	or	a3,a3,a4
    80003cb0:	00b4c703          	lbu	a4,11(s1)
    80003cb4:	01871713          	slli	a4,a4,0x18
    80003cb8:	00d766b3          	or	a3,a4,a3
    80003cbc:	00c4c703          	lbu	a4,12(s1)
    80003cc0:	02071713          	slli	a4,a4,0x20
    80003cc4:	00d76733          	or	a4,a4,a3
    80003cc8:	00d4c683          	lbu	a3,13(s1)
    80003ccc:	02869693          	slli	a3,a3,0x28
    80003cd0:	00e6e733          	or	a4,a3,a4
    80003cd4:	00e4c683          	lbu	a3,14(s1)
    80003cd8:	03069693          	slli	a3,a3,0x30
    80003cdc:	00e6e6b3          	or	a3,a3,a4
    80003ce0:	00f4c703          	lbu	a4,15(s1)
    80003ce4:	03871713          	slli	a4,a4,0x38
    80003ce8:	00d76733          	or	a4,a4,a3
    80003cec:	00d78423          	sb	a3,8(a5)
    80003cf0:	00875693          	srli	a3,a4,0x8
    80003cf4:	00d784a3          	sb	a3,9(a5)
    80003cf8:	01075693          	srli	a3,a4,0x10
    80003cfc:	00d78523          	sb	a3,10(a5)
    80003d00:	0187569b          	srliw	a3,a4,0x18
    80003d04:	00d785a3          	sb	a3,11(a5)
    80003d08:	02075693          	srli	a3,a4,0x20
    80003d0c:	00d78623          	sb	a3,12(a5)
    80003d10:	02875693          	srli	a3,a4,0x28
    80003d14:	00d786a3          	sb	a3,13(a5)
    80003d18:	03075693          	srli	a3,a4,0x30
    80003d1c:	00d78723          	sb	a3,14(a5)
    80003d20:	03875713          	srli	a4,a4,0x38
    80003d24:	00e787a3          	sb	a4,15(a5)
            if(pCurrent == m_pHead){
    80003d28:	0009b783          	ld	a5,0(s3)
    80003d2c:	00978663          	beq	a5,s1,80003d38 <_ZN11HeapManager12heapAllocateEm+0x658>
            return reinterpret_cast<void*>(reinterpret_cast<uint64>(pCurrent) + MEM_BLOCK_SIZE);
    80003d30:	04048493          	addi	s1,s1,64
    80003d34:	0880006f          	j	80003dbc <_ZN11HeapManager12heapAllocateEm+0x6dc>
                m_pHead = pCurrent->pNext;
    80003d38:	0004c703          	lbu	a4,0(s1)
    80003d3c:	0014c783          	lbu	a5,1(s1)
    80003d40:	00879793          	slli	a5,a5,0x8
    80003d44:	00e7e7b3          	or	a5,a5,a4
    80003d48:	0024c703          	lbu	a4,2(s1)
    80003d4c:	01071713          	slli	a4,a4,0x10
    80003d50:	00f76733          	or	a4,a4,a5
    80003d54:	0034c783          	lbu	a5,3(s1)
    80003d58:	01879793          	slli	a5,a5,0x18
    80003d5c:	00e7e733          	or	a4,a5,a4
    80003d60:	0044c783          	lbu	a5,4(s1)
    80003d64:	02079793          	slli	a5,a5,0x20
    80003d68:	00e7e7b3          	or	a5,a5,a4
    80003d6c:	0054c703          	lbu	a4,5(s1)
    80003d70:	02871713          	slli	a4,a4,0x28
    80003d74:	00f76733          	or	a4,a4,a5
    80003d78:	0064c783          	lbu	a5,6(s1)
    80003d7c:	03079793          	slli	a5,a5,0x30
    80003d80:	00e7e733          	or	a4,a5,a4
    80003d84:	0074c783          	lbu	a5,7(s1)
    80003d88:	03879793          	slli	a5,a5,0x38
    80003d8c:	00e7e7b3          	or	a5,a5,a4
    80003d90:	00f9b023          	sd	a5,0(s3)
    80003d94:	f9dff06f          	j	80003d30 <_ZN11HeapManager12heapAllocateEm+0x650>
    }
    assert(0);
    80003d98:	00008697          	auipc	a3,0x8
    80003d9c:	48868693          	addi	a3,a3,1160 # 8000c220 <CONSOLE_STATUS+0x210>
    80003da0:	05900613          	li	a2,89
    80003da4:	00008597          	auipc	a1,0x8
    80003da8:	3cc58593          	addi	a1,a1,972 # 8000c170 <CONSOLE_STATUS+0x160>
    80003dac:	00008517          	auipc	a0,0x8
    80003db0:	49c50513          	addi	a0,a0,1180 # 8000c248 <CONSOLE_STATUS+0x238>
    80003db4:	00002097          	auipc	ra,0x2
    80003db8:	968080e7          	jalr	-1688(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    return 0;
}
    80003dbc:	00048513          	mv	a0,s1
    80003dc0:	02813083          	ld	ra,40(sp)
    80003dc4:	02013403          	ld	s0,32(sp)
    80003dc8:	01813483          	ld	s1,24(sp)
    80003dcc:	01013903          	ld	s2,16(sp)
    80003dd0:	00813983          	ld	s3,8(sp)
    80003dd4:	03010113          	addi	sp,sp,48
    80003dd8:	00008067          	ret

0000000080003ddc <_ZN11HeapManager8heapFreeEPv>:

int HeapManager::heapFree(void* pAddress){
    80003ddc:	fc010113          	addi	sp,sp,-64
    80003de0:	02113c23          	sd	ra,56(sp)
    80003de4:	02813823          	sd	s0,48(sp)
    80003de8:	02913423          	sd	s1,40(sp)
    80003dec:	03213023          	sd	s2,32(sp)
    80003df0:	01313c23          	sd	s3,24(sp)
    80003df4:	01413823          	sd	s4,16(sp)
    80003df8:	01513423          	sd	s5,8(sp)
    80003dfc:	04010413          	addi	s0,sp,64
    80003e00:	00050a93          	mv	s5,a0
    80003e04:	00058a13          	mv	s4,a1
    HeapFreeSectionHeader* pFree = reinterpret_cast<HeapFreeSectionHeader*>(reinterpret_cast<uint64>(pAddress) - MEM_BLOCK_SIZE);
    80003e08:	fc058913          	addi	s2,a1,-64
    80003e0c:	00090993          	mv	s3,s2
    
    #ifdef CHECK_CONDITIONS
        assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80003e10:	01894783          	lbu	a5,24(s2)
    80003e14:	01994703          	lbu	a4,25(s2)
    80003e18:	00871713          	slli	a4,a4,0x8
    80003e1c:	00f76733          	or	a4,a4,a5
    80003e20:	01a94783          	lbu	a5,26(s2)
    80003e24:	01079793          	slli	a5,a5,0x10
    80003e28:	00e7e733          	or	a4,a5,a4
    80003e2c:	01b94783          	lbu	a5,27(s2)
    80003e30:	01879793          	slli	a5,a5,0x18
    80003e34:	00e7e7b3          	or	a5,a5,a4
    80003e38:	0007879b          	sext.w	a5,a5
    80003e3c:	1c100737          	lui	a4,0x1c100
    80003e40:	ee170713          	addi	a4,a4,-287 # 1c0ffee1 <_entry-0x63f0011f>
    80003e44:	22e79e63          	bne	a5,a4,80004080 <_ZN11HeapManager8heapFreeEPv+0x2a4>
    #endif
    HeapFreeSectionHeader* pInsert = m_pHead;
    80003e48:	000ab483          	ld	s1,0(s5)

    if(pInsert == 0 || pInsert >= pAddress){
    80003e4c:	00048463          	beqz	s1,80003e54 <_ZN11HeapManager8heapFreeEPv+0x78>
    80003e50:	2b44e863          	bltu	s1,s4,80004100 <_ZN11HeapManager8heapFreeEPv+0x324>
        pFree->pNext = pInsert;
    80003e54:	fc9a0023          	sb	s1,-64(s4)
    80003e58:	0084d793          	srli	a5,s1,0x8
    80003e5c:	00f900a3          	sb	a5,1(s2)
    80003e60:	0104d793          	srli	a5,s1,0x10
    80003e64:	00f90123          	sb	a5,2(s2)
    80003e68:	0184d79b          	srliw	a5,s1,0x18
    80003e6c:	00f901a3          	sb	a5,3(s2)
    80003e70:	0204d793          	srli	a5,s1,0x20
    80003e74:	00f90223          	sb	a5,4(s2)
    80003e78:	0284d793          	srli	a5,s1,0x28
    80003e7c:	00f902a3          	sb	a5,5(s2)
    80003e80:	0304d793          	srli	a5,s1,0x30
    80003e84:	00f90323          	sb	a5,6(s2)
    80003e88:	0384d793          	srli	a5,s1,0x38
    80003e8c:	00f903a3          	sb	a5,7(s2)
        pInsert->pPrev = pFree;
    80003e90:	01248423          	sb	s2,8(s1)
    80003e94:	00895793          	srli	a5,s2,0x8
    80003e98:	00f484a3          	sb	a5,9(s1)
    80003e9c:	01095793          	srli	a5,s2,0x10
    80003ea0:	00f48523          	sb	a5,10(s1)
    80003ea4:	0189579b          	srliw	a5,s2,0x18
    80003ea8:	00f485a3          	sb	a5,11(s1)
    80003eac:	02095793          	srli	a5,s2,0x20
    80003eb0:	00f48623          	sb	a5,12(s1)
    80003eb4:	02895793          	srli	a5,s2,0x28
    80003eb8:	00f486a3          	sb	a5,13(s1)
    80003ebc:	03095793          	srli	a5,s2,0x30
    80003ec0:	00f48723          	sb	a5,14(s1)
    80003ec4:	03895793          	srli	a5,s2,0x38
    80003ec8:	00f487a3          	sb	a5,15(s1)
        m_pHead = pFree;
    80003ecc:	012ab023          	sd	s2,0(s5)
        }
        pInsert->pNext = pFree;
    }

    /// merge with previous block if possible
    if(pFree->pPrev != 0 && reinterpret_cast<uint64>(pFree->pPrev) + (pFree->pPrev->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uint64>(pFree)){
    80003ed0:	00894783          	lbu	a5,8(s2)
    80003ed4:	00994703          	lbu	a4,9(s2)
    80003ed8:	00871713          	slli	a4,a4,0x8
    80003edc:	00f76733          	or	a4,a4,a5
    80003ee0:	00a94783          	lbu	a5,10(s2)
    80003ee4:	01079793          	slli	a5,a5,0x10
    80003ee8:	00e7e733          	or	a4,a5,a4
    80003eec:	00b94783          	lbu	a5,11(s2)
    80003ef0:	01879793          	slli	a5,a5,0x18
    80003ef4:	00e7e7b3          	or	a5,a5,a4
    80003ef8:	00c94703          	lbu	a4,12(s2)
    80003efc:	02071713          	slli	a4,a4,0x20
    80003f00:	00f767b3          	or	a5,a4,a5
    80003f04:	00d94703          	lbu	a4,13(s2)
    80003f08:	02871713          	slli	a4,a4,0x28
    80003f0c:	00f76733          	or	a4,a4,a5
    80003f10:	00e94783          	lbu	a5,14(s2)
    80003f14:	03079793          	slli	a5,a5,0x30
    80003f18:	00e7e733          	or	a4,a5,a4
    80003f1c:	00f94783          	lbu	a5,15(s2)
    80003f20:	03879793          	slli	a5,a5,0x38
    80003f24:	00e7e7b3          	or	a5,a5,a4
    80003f28:	06078663          	beqz	a5,80003f94 <_ZN11HeapManager8heapFreeEPv+0x1b8>
    80003f2c:	0107c703          	lbu	a4,16(a5)
    80003f30:	0117c683          	lbu	a3,17(a5)
    80003f34:	00869693          	slli	a3,a3,0x8
    80003f38:	00e6e6b3          	or	a3,a3,a4
    80003f3c:	0127c703          	lbu	a4,18(a5)
    80003f40:	01071713          	slli	a4,a4,0x10
    80003f44:	00d766b3          	or	a3,a4,a3
    80003f48:	0137c703          	lbu	a4,19(a5)
    80003f4c:	01871713          	slli	a4,a4,0x18
    80003f50:	00d76733          	or	a4,a4,a3
    80003f54:	0147c683          	lbu	a3,20(a5)
    80003f58:	02069693          	slli	a3,a3,0x20
    80003f5c:	00e6e733          	or	a4,a3,a4
    80003f60:	0157c683          	lbu	a3,21(a5)
    80003f64:	02869693          	slli	a3,a3,0x28
    80003f68:	00e6e6b3          	or	a3,a3,a4
    80003f6c:	0167c703          	lbu	a4,22(a5)
    80003f70:	03071713          	slli	a4,a4,0x30
    80003f74:	00d766b3          	or	a3,a4,a3
    80003f78:	0177c703          	lbu	a4,23(a5)
    80003f7c:	03871713          	slli	a4,a4,0x38
    80003f80:	00d76733          	or	a4,a4,a3
    80003f84:	00170693          	addi	a3,a4,1
    80003f88:	00669693          	slli	a3,a3,0x6
    80003f8c:	00d786b3          	add	a3,a5,a3
    80003f90:	38d90063          	beq	s2,a3,80004310 <_ZN11HeapManager8heapFreeEPv+0x534>
            pFree->pNext->pPrev = pFree->pPrev;
        }
        pFree = pFree->pPrev;
    }
    /// merge with next block if possible
    if(pFree->pNext != 0 && reinterpret_cast<uint64>(pFree) + (pFree->nSize + 1) * MEM_BLOCK_SIZE == reinterpret_cast<uint64>(pFree->pNext)){
    80003f94:	0009c783          	lbu	a5,0(s3)
    80003f98:	0019c703          	lbu	a4,1(s3)
    80003f9c:	00871713          	slli	a4,a4,0x8
    80003fa0:	00f76733          	or	a4,a4,a5
    80003fa4:	0029c783          	lbu	a5,2(s3)
    80003fa8:	01079793          	slli	a5,a5,0x10
    80003fac:	00e7e733          	or	a4,a5,a4
    80003fb0:	0039c783          	lbu	a5,3(s3)
    80003fb4:	01879793          	slli	a5,a5,0x18
    80003fb8:	00e7e7b3          	or	a5,a5,a4
    80003fbc:	0049c703          	lbu	a4,4(s3)
    80003fc0:	02071713          	slli	a4,a4,0x20
    80003fc4:	00f767b3          	or	a5,a4,a5
    80003fc8:	0059c703          	lbu	a4,5(s3)
    80003fcc:	02871713          	slli	a4,a4,0x28
    80003fd0:	00f76733          	or	a4,a4,a5
    80003fd4:	0069c783          	lbu	a5,6(s3)
    80003fd8:	03079793          	slli	a5,a5,0x30
    80003fdc:	00e7e733          	or	a4,a5,a4
    80003fe0:	0079c783          	lbu	a5,7(s3)
    80003fe4:	03879793          	slli	a5,a5,0x38
    80003fe8:	00e7e7b3          	or	a5,a5,a4
    80003fec:	06078663          	beqz	a5,80004058 <_ZN11HeapManager8heapFreeEPv+0x27c>
    80003ff0:	0109c703          	lbu	a4,16(s3)
    80003ff4:	0119c683          	lbu	a3,17(s3)
    80003ff8:	00869693          	slli	a3,a3,0x8
    80003ffc:	00e6e6b3          	or	a3,a3,a4
    80004000:	0129c703          	lbu	a4,18(s3)
    80004004:	01071713          	slli	a4,a4,0x10
    80004008:	00d766b3          	or	a3,a4,a3
    8000400c:	0139c703          	lbu	a4,19(s3)
    80004010:	01871713          	slli	a4,a4,0x18
    80004014:	00d76733          	or	a4,a4,a3
    80004018:	0149c683          	lbu	a3,20(s3)
    8000401c:	02069693          	slli	a3,a3,0x20
    80004020:	00e6e733          	or	a4,a3,a4
    80004024:	0159c683          	lbu	a3,21(s3)
    80004028:	02869693          	slli	a3,a3,0x28
    8000402c:	00e6e6b3          	or	a3,a3,a4
    80004030:	0169c703          	lbu	a4,22(s3)
    80004034:	03071713          	slli	a4,a4,0x30
    80004038:	00d766b3          	or	a3,a4,a3
    8000403c:	0179c703          	lbu	a4,23(s3)
    80004040:	03871713          	slli	a4,a4,0x38
    80004044:	00d76733          	or	a4,a4,a3
    80004048:	00170693          	addi	a3,a4,1
    8000404c:	00669693          	slli	a3,a3,0x6
    80004050:	00d986b3          	add	a3,s3,a3
    80004054:	58f68863          	beq	a3,a5,800045e4 <_ZN11HeapManager8heapFreeEPv+0x808>
        if(pFree->pNext != 0){
            pFree->pNext->pPrev = pFree;
        }
    }
    return 0;
}
    80004058:	00000513          	li	a0,0
    8000405c:	03813083          	ld	ra,56(sp)
    80004060:	03013403          	ld	s0,48(sp)
    80004064:	02813483          	ld	s1,40(sp)
    80004068:	02013903          	ld	s2,32(sp)
    8000406c:	01813983          	ld	s3,24(sp)
    80004070:	01013a03          	ld	s4,16(sp)
    80004074:	00813a83          	ld	s5,8(sp)
    80004078:	04010113          	addi	sp,sp,64
    8000407c:	00008067          	ret
        assert(pFree->u32Magic == HEAP_BLOCK_MAGIC);
    80004080:	00008697          	auipc	a3,0x8
    80004084:	1d068693          	addi	a3,a3,464 # 8000c250 <CONSOLE_STATUS+0x240>
    80004088:	06100613          	li	a2,97
    8000408c:	00008597          	auipc	a1,0x8
    80004090:	0e458593          	addi	a1,a1,228 # 8000c170 <CONSOLE_STATUS+0x160>
    80004094:	00008517          	auipc	a0,0x8
    80004098:	1e450513          	addi	a0,a0,484 # 8000c278 <CONSOLE_STATUS+0x268>
    8000409c:	00001097          	auipc	ra,0x1
    800040a0:	680080e7          	jalr	1664(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    800040a4:	da5ff06f          	j	80003e48 <_ZN11HeapManager8heapFreeEPv+0x6c>
            pInsert = pInsert->pNext;
    800040a8:	0004c703          	lbu	a4,0(s1)
    800040ac:	0014c783          	lbu	a5,1(s1)
    800040b0:	00879793          	slli	a5,a5,0x8
    800040b4:	00e7e733          	or	a4,a5,a4
    800040b8:	0024c783          	lbu	a5,2(s1)
    800040bc:	01079793          	slli	a5,a5,0x10
    800040c0:	00e7e7b3          	or	a5,a5,a4
    800040c4:	0034c703          	lbu	a4,3(s1)
    800040c8:	01871713          	slli	a4,a4,0x18
    800040cc:	00f767b3          	or	a5,a4,a5
    800040d0:	0044c703          	lbu	a4,4(s1)
    800040d4:	02071713          	slli	a4,a4,0x20
    800040d8:	00f76733          	or	a4,a4,a5
    800040dc:	0054c783          	lbu	a5,5(s1)
    800040e0:	02879793          	slli	a5,a5,0x28
    800040e4:	00e7e733          	or	a4,a5,a4
    800040e8:	0064c783          	lbu	a5,6(s1)
    800040ec:	03079793          	slli	a5,a5,0x30
    800040f0:	00e7e7b3          	or	a5,a5,a4
    800040f4:	0074c483          	lbu	s1,7(s1)
    800040f8:	03849493          	slli	s1,s1,0x38
    800040fc:	00f4e4b3          	or	s1,s1,a5
        while(pInsert->pNext != 0 && pInsert->pNext < pAddress){
    80004100:	0004c783          	lbu	a5,0(s1)
    80004104:	0014c703          	lbu	a4,1(s1)
    80004108:	00871713          	slli	a4,a4,0x8
    8000410c:	00f76733          	or	a4,a4,a5
    80004110:	0024c783          	lbu	a5,2(s1)
    80004114:	01079793          	slli	a5,a5,0x10
    80004118:	00e7e733          	or	a4,a5,a4
    8000411c:	0034c783          	lbu	a5,3(s1)
    80004120:	01879793          	slli	a5,a5,0x18
    80004124:	00e7e7b3          	or	a5,a5,a4
    80004128:	0044c703          	lbu	a4,4(s1)
    8000412c:	02071713          	slli	a4,a4,0x20
    80004130:	00f767b3          	or	a5,a4,a5
    80004134:	0054c703          	lbu	a4,5(s1)
    80004138:	02871713          	slli	a4,a4,0x28
    8000413c:	00f76733          	or	a4,a4,a5
    80004140:	0064c783          	lbu	a5,6(s1)
    80004144:	03079793          	slli	a5,a5,0x30
    80004148:	00e7e733          	or	a4,a5,a4
    8000414c:	0074c783          	lbu	a5,7(s1)
    80004150:	03879793          	slli	a5,a5,0x38
    80004154:	00e7e7b3          	or	a5,a5,a4
    80004158:	06078463          	beqz	a5,800041c0 <_ZN11HeapManager8heapFreeEPv+0x3e4>
    8000415c:	0747f263          	bgeu	a5,s4,800041c0 <_ZN11HeapManager8heapFreeEPv+0x3e4>
                assert(pInsert->u32Magic == HEAP_BLOCK_MAGIC);
    80004160:	0184c783          	lbu	a5,24(s1)
    80004164:	0194c703          	lbu	a4,25(s1)
    80004168:	00871713          	slli	a4,a4,0x8
    8000416c:	00f76733          	or	a4,a4,a5
    80004170:	01a4c783          	lbu	a5,26(s1)
    80004174:	01079793          	slli	a5,a5,0x10
    80004178:	00e7e733          	or	a4,a5,a4
    8000417c:	01b4c783          	lbu	a5,27(s1)
    80004180:	01879793          	slli	a5,a5,0x18
    80004184:	00e7e7b3          	or	a5,a5,a4
    80004188:	0007879b          	sext.w	a5,a5
    8000418c:	1c100737          	lui	a4,0x1c100
    80004190:	ee170713          	addi	a4,a4,-287 # 1c0ffee1 <_entry-0x63f0011f>
    80004194:	f0e78ae3          	beq	a5,a4,800040a8 <_ZN11HeapManager8heapFreeEPv+0x2cc>
    80004198:	00008697          	auipc	a3,0x8
    8000419c:	0b868693          	addi	a3,a3,184 # 8000c250 <CONSOLE_STATUS+0x240>
    800041a0:	06c00613          	li	a2,108
    800041a4:	00008597          	auipc	a1,0x8
    800041a8:	fcc58593          	addi	a1,a1,-52 # 8000c170 <CONSOLE_STATUS+0x160>
    800041ac:	00008517          	auipc	a0,0x8
    800041b0:	0f450513          	addi	a0,a0,244 # 8000c2a0 <CONSOLE_STATUS+0x290>
    800041b4:	00001097          	auipc	ra,0x1
    800041b8:	568080e7          	jalr	1384(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    800041bc:	eedff06f          	j	800040a8 <_ZN11HeapManager8heapFreeEPv+0x2cc>
        pFree->pNext = pInsert->pNext;
    800041c0:	fcfa0023          	sb	a5,-64(s4)
    800041c4:	0087d713          	srli	a4,a5,0x8
    800041c8:	00e900a3          	sb	a4,1(s2)
    800041cc:	0107d713          	srli	a4,a5,0x10
    800041d0:	00e90123          	sb	a4,2(s2)
    800041d4:	0187d71b          	srliw	a4,a5,0x18
    800041d8:	00e901a3          	sb	a4,3(s2)
    800041dc:	0207d713          	srli	a4,a5,0x20
    800041e0:	00e90223          	sb	a4,4(s2)
    800041e4:	0287d713          	srli	a4,a5,0x28
    800041e8:	00e902a3          	sb	a4,5(s2)
    800041ec:	0307d713          	srli	a4,a5,0x30
    800041f0:	00e90323          	sb	a4,6(s2)
    800041f4:	0387d793          	srli	a5,a5,0x38
    800041f8:	00f903a3          	sb	a5,7(s2)
        pFree->pPrev = pInsert;
    800041fc:	00990423          	sb	s1,8(s2)
    80004200:	0084d793          	srli	a5,s1,0x8
    80004204:	00f904a3          	sb	a5,9(s2)
    80004208:	0104d793          	srli	a5,s1,0x10
    8000420c:	00f90523          	sb	a5,10(s2)
    80004210:	0184d79b          	srliw	a5,s1,0x18
    80004214:	00f905a3          	sb	a5,11(s2)
    80004218:	0204d793          	srli	a5,s1,0x20
    8000421c:	00f90623          	sb	a5,12(s2)
    80004220:	0284d793          	srli	a5,s1,0x28
    80004224:	00f906a3          	sb	a5,13(s2)
    80004228:	0304d793          	srli	a5,s1,0x30
    8000422c:	00f90723          	sb	a5,14(s2)
    80004230:	0384d793          	srli	a5,s1,0x38
    80004234:	00f907a3          	sb	a5,15(s2)
        if(pInsert->pNext != 0){
    80004238:	0004c783          	lbu	a5,0(s1)
    8000423c:	0014c703          	lbu	a4,1(s1)
    80004240:	00871713          	slli	a4,a4,0x8
    80004244:	00f76733          	or	a4,a4,a5
    80004248:	0024c783          	lbu	a5,2(s1)
    8000424c:	01079793          	slli	a5,a5,0x10
    80004250:	00e7e733          	or	a4,a5,a4
    80004254:	0034c783          	lbu	a5,3(s1)
    80004258:	01879793          	slli	a5,a5,0x18
    8000425c:	00e7e7b3          	or	a5,a5,a4
    80004260:	0044c703          	lbu	a4,4(s1)
    80004264:	02071713          	slli	a4,a4,0x20
    80004268:	00f767b3          	or	a5,a4,a5
    8000426c:	0054c703          	lbu	a4,5(s1)
    80004270:	02871713          	slli	a4,a4,0x28
    80004274:	00f76733          	or	a4,a4,a5
    80004278:	0064c783          	lbu	a5,6(s1)
    8000427c:	03079793          	slli	a5,a5,0x30
    80004280:	00e7e733          	or	a4,a5,a4
    80004284:	0074c783          	lbu	a5,7(s1)
    80004288:	03879793          	slli	a5,a5,0x38
    8000428c:	00e7e7b3          	or	a5,a5,a4
    80004290:	04078063          	beqz	a5,800042d0 <_ZN11HeapManager8heapFreeEPv+0x4f4>
            pInsert->pNext->pPrev = pFree;
    80004294:	01278423          	sb	s2,8(a5)
    80004298:	00895713          	srli	a4,s2,0x8
    8000429c:	00e784a3          	sb	a4,9(a5)
    800042a0:	01095713          	srli	a4,s2,0x10
    800042a4:	00e78523          	sb	a4,10(a5)
    800042a8:	0189571b          	srliw	a4,s2,0x18
    800042ac:	00e785a3          	sb	a4,11(a5)
    800042b0:	02095713          	srli	a4,s2,0x20
    800042b4:	00e78623          	sb	a4,12(a5)
    800042b8:	02895713          	srli	a4,s2,0x28
    800042bc:	00e786a3          	sb	a4,13(a5)
    800042c0:	03095713          	srli	a4,s2,0x30
    800042c4:	00e78723          	sb	a4,14(a5)
    800042c8:	03895713          	srli	a4,s2,0x38
    800042cc:	00e787a3          	sb	a4,15(a5)
        pInsert->pNext = pFree;
    800042d0:	01248023          	sb	s2,0(s1)
    800042d4:	00895793          	srli	a5,s2,0x8
    800042d8:	00f480a3          	sb	a5,1(s1)
    800042dc:	01095793          	srli	a5,s2,0x10
    800042e0:	00f48123          	sb	a5,2(s1)
    800042e4:	0189579b          	srliw	a5,s2,0x18
    800042e8:	00f481a3          	sb	a5,3(s1)
    800042ec:	02095793          	srli	a5,s2,0x20
    800042f0:	00f48223          	sb	a5,4(s1)
    800042f4:	02895793          	srli	a5,s2,0x28
    800042f8:	00f482a3          	sb	a5,5(s1)
    800042fc:	03095793          	srli	a5,s2,0x30
    80004300:	00f48323          	sb	a5,6(s1)
    80004304:	03895793          	srli	a5,s2,0x38
    80004308:	00f483a3          	sb	a5,7(s1)
    8000430c:	bc5ff06f          	j	80003ed0 <_ZN11HeapManager8heapFreeEPv+0xf4>
        pFree->pPrev->nSize += pFree->nSize + 1;
    80004310:	01094683          	lbu	a3,16(s2)
    80004314:	01194603          	lbu	a2,17(s2)
    80004318:	00861613          	slli	a2,a2,0x8
    8000431c:	00d66633          	or	a2,a2,a3
    80004320:	01294683          	lbu	a3,18(s2)
    80004324:	01069693          	slli	a3,a3,0x10
    80004328:	00c6e633          	or	a2,a3,a2
    8000432c:	01394683          	lbu	a3,19(s2)
    80004330:	01869693          	slli	a3,a3,0x18
    80004334:	00c6e6b3          	or	a3,a3,a2
    80004338:	01494603          	lbu	a2,20(s2)
    8000433c:	02061613          	slli	a2,a2,0x20
    80004340:	00d666b3          	or	a3,a2,a3
    80004344:	01594603          	lbu	a2,21(s2)
    80004348:	02861613          	slli	a2,a2,0x28
    8000434c:	00d66633          	or	a2,a2,a3
    80004350:	01694683          	lbu	a3,22(s2)
    80004354:	03069693          	slli	a3,a3,0x30
    80004358:	00c6e633          	or	a2,a3,a2
    8000435c:	01794683          	lbu	a3,23(s2)
    80004360:	03869693          	slli	a3,a3,0x38
    80004364:	00c6e6b3          	or	a3,a3,a2
    80004368:	00d70733          	add	a4,a4,a3
    8000436c:	00170713          	addi	a4,a4,1
    80004370:	00e78823          	sb	a4,16(a5)
    80004374:	00875693          	srli	a3,a4,0x8
    80004378:	00d788a3          	sb	a3,17(a5)
    8000437c:	01075693          	srli	a3,a4,0x10
    80004380:	00d78923          	sb	a3,18(a5)
    80004384:	0187569b          	srliw	a3,a4,0x18
    80004388:	00d789a3          	sb	a3,19(a5)
    8000438c:	02075693          	srli	a3,a4,0x20
    80004390:	00d78a23          	sb	a3,20(a5)
    80004394:	02875693          	srli	a3,a4,0x28
    80004398:	00d78aa3          	sb	a3,21(a5)
    8000439c:	03075693          	srli	a3,a4,0x30
    800043a0:	00d78b23          	sb	a3,22(a5)
    800043a4:	03875713          	srli	a4,a4,0x38
    800043a8:	00e78ba3          	sb	a4,23(a5)
        pFree->pPrev->pNext = pFree->pNext;
    800043ac:	00894703          	lbu	a4,8(s2)
    800043b0:	00994783          	lbu	a5,9(s2)
    800043b4:	00879793          	slli	a5,a5,0x8
    800043b8:	00e7e7b3          	or	a5,a5,a4
    800043bc:	00a94703          	lbu	a4,10(s2)
    800043c0:	01071713          	slli	a4,a4,0x10
    800043c4:	00f767b3          	or	a5,a4,a5
    800043c8:	00b94703          	lbu	a4,11(s2)
    800043cc:	01871713          	slli	a4,a4,0x18
    800043d0:	00f76733          	or	a4,a4,a5
    800043d4:	00c94783          	lbu	a5,12(s2)
    800043d8:	02079793          	slli	a5,a5,0x20
    800043dc:	00e7e733          	or	a4,a5,a4
    800043e0:	00d94783          	lbu	a5,13(s2)
    800043e4:	02879793          	slli	a5,a5,0x28
    800043e8:	00e7e7b3          	or	a5,a5,a4
    800043ec:	00e94703          	lbu	a4,14(s2)
    800043f0:	03071713          	slli	a4,a4,0x30
    800043f4:	00f767b3          	or	a5,a4,a5
    800043f8:	00f94703          	lbu	a4,15(s2)
    800043fc:	03871713          	slli	a4,a4,0x38
    80004400:	00f76733          	or	a4,a4,a5
    80004404:	fc0a4783          	lbu	a5,-64(s4)
    80004408:	00194683          	lbu	a3,1(s2)
    8000440c:	00869693          	slli	a3,a3,0x8
    80004410:	00f6e7b3          	or	a5,a3,a5
    80004414:	00294683          	lbu	a3,2(s2)
    80004418:	01069693          	slli	a3,a3,0x10
    8000441c:	00f6e6b3          	or	a3,a3,a5
    80004420:	00394783          	lbu	a5,3(s2)
    80004424:	01879793          	slli	a5,a5,0x18
    80004428:	00d7e6b3          	or	a3,a5,a3
    8000442c:	00494783          	lbu	a5,4(s2)
    80004430:	02079793          	slli	a5,a5,0x20
    80004434:	00d7e7b3          	or	a5,a5,a3
    80004438:	00594683          	lbu	a3,5(s2)
    8000443c:	02869693          	slli	a3,a3,0x28
    80004440:	00f6e7b3          	or	a5,a3,a5
    80004444:	00694683          	lbu	a3,6(s2)
    80004448:	03069693          	slli	a3,a3,0x30
    8000444c:	00f6e6b3          	or	a3,a3,a5
    80004450:	00794783          	lbu	a5,7(s2)
    80004454:	03879793          	slli	a5,a5,0x38
    80004458:	00d7e7b3          	or	a5,a5,a3
    8000445c:	00d70023          	sb	a3,0(a4)
    80004460:	0087d693          	srli	a3,a5,0x8
    80004464:	00d700a3          	sb	a3,1(a4)
    80004468:	0107d693          	srli	a3,a5,0x10
    8000446c:	00d70123          	sb	a3,2(a4)
    80004470:	0187d69b          	srliw	a3,a5,0x18
    80004474:	00d701a3          	sb	a3,3(a4)
    80004478:	0207d693          	srli	a3,a5,0x20
    8000447c:	00d70223          	sb	a3,4(a4)
    80004480:	0287d693          	srli	a3,a5,0x28
    80004484:	00d702a3          	sb	a3,5(a4)
    80004488:	0307d693          	srli	a3,a5,0x30
    8000448c:	00d70323          	sb	a3,6(a4)
    80004490:	0387d793          	srli	a5,a5,0x38
    80004494:	00f703a3          	sb	a5,7(a4)
        if(pFree->pNext != 0){
    80004498:	fc0a4783          	lbu	a5,-64(s4)
    8000449c:	00194703          	lbu	a4,1(s2)
    800044a0:	00871713          	slli	a4,a4,0x8
    800044a4:	00f76733          	or	a4,a4,a5
    800044a8:	00294783          	lbu	a5,2(s2)
    800044ac:	01079793          	slli	a5,a5,0x10
    800044b0:	00e7e733          	or	a4,a5,a4
    800044b4:	00394783          	lbu	a5,3(s2)
    800044b8:	01879793          	slli	a5,a5,0x18
    800044bc:	00e7e7b3          	or	a5,a5,a4
    800044c0:	00494703          	lbu	a4,4(s2)
    800044c4:	02071713          	slli	a4,a4,0x20
    800044c8:	00f767b3          	or	a5,a4,a5
    800044cc:	00594703          	lbu	a4,5(s2)
    800044d0:	02871713          	slli	a4,a4,0x28
    800044d4:	00f76733          	or	a4,a4,a5
    800044d8:	00694783          	lbu	a5,6(s2)
    800044dc:	03079793          	slli	a5,a5,0x30
    800044e0:	00e7e733          	or	a4,a5,a4
    800044e4:	00794783          	lbu	a5,7(s2)
    800044e8:	03879793          	slli	a5,a5,0x38
    800044ec:	00e7e7b3          	or	a5,a5,a4
    800044f0:	08078c63          	beqz	a5,80004588 <_ZN11HeapManager8heapFreeEPv+0x7ac>
            pFree->pNext->pPrev = pFree->pPrev;
    800044f4:	00894703          	lbu	a4,8(s2)
    800044f8:	00994683          	lbu	a3,9(s2)
    800044fc:	00869693          	slli	a3,a3,0x8
    80004500:	00e6e733          	or	a4,a3,a4
    80004504:	00a94683          	lbu	a3,10(s2)
    80004508:	01069693          	slli	a3,a3,0x10
    8000450c:	00e6e6b3          	or	a3,a3,a4
    80004510:	00b94703          	lbu	a4,11(s2)
    80004514:	01871713          	slli	a4,a4,0x18
    80004518:	00d766b3          	or	a3,a4,a3
    8000451c:	00c94703          	lbu	a4,12(s2)
    80004520:	02071713          	slli	a4,a4,0x20
    80004524:	00d76733          	or	a4,a4,a3
    80004528:	00d94683          	lbu	a3,13(s2)
    8000452c:	02869693          	slli	a3,a3,0x28
    80004530:	00e6e733          	or	a4,a3,a4
    80004534:	00e94683          	lbu	a3,14(s2)
    80004538:	03069693          	slli	a3,a3,0x30
    8000453c:	00e6e6b3          	or	a3,a3,a4
    80004540:	00f94703          	lbu	a4,15(s2)
    80004544:	03871713          	slli	a4,a4,0x38
    80004548:	00d76733          	or	a4,a4,a3
    8000454c:	00d78423          	sb	a3,8(a5)
    80004550:	00875693          	srli	a3,a4,0x8
    80004554:	00d784a3          	sb	a3,9(a5)
    80004558:	01075693          	srli	a3,a4,0x10
    8000455c:	00d78523          	sb	a3,10(a5)
    80004560:	0187569b          	srliw	a3,a4,0x18
    80004564:	00d785a3          	sb	a3,11(a5)
    80004568:	02075693          	srli	a3,a4,0x20
    8000456c:	00d78623          	sb	a3,12(a5)
    80004570:	02875693          	srli	a3,a4,0x28
    80004574:	00d786a3          	sb	a3,13(a5)
    80004578:	03075693          	srli	a3,a4,0x30
    8000457c:	00d78723          	sb	a3,14(a5)
    80004580:	03875713          	srli	a4,a4,0x38
    80004584:	00e787a3          	sb	a4,15(a5)
        pFree = pFree->pPrev;
    80004588:	00894983          	lbu	s3,8(s2)
    8000458c:	00994783          	lbu	a5,9(s2)
    80004590:	00879793          	slli	a5,a5,0x8
    80004594:	0137e7b3          	or	a5,a5,s3
    80004598:	00a94983          	lbu	s3,10(s2)
    8000459c:	01099993          	slli	s3,s3,0x10
    800045a0:	00f9e7b3          	or	a5,s3,a5
    800045a4:	00b94983          	lbu	s3,11(s2)
    800045a8:	01899993          	slli	s3,s3,0x18
    800045ac:	00f9e9b3          	or	s3,s3,a5
    800045b0:	00c94783          	lbu	a5,12(s2)
    800045b4:	02079793          	slli	a5,a5,0x20
    800045b8:	0137e9b3          	or	s3,a5,s3
    800045bc:	00d94783          	lbu	a5,13(s2)
    800045c0:	02879793          	slli	a5,a5,0x28
    800045c4:	0137e7b3          	or	a5,a5,s3
    800045c8:	00e94983          	lbu	s3,14(s2)
    800045cc:	03099993          	slli	s3,s3,0x30
    800045d0:	00f9e7b3          	or	a5,s3,a5
    800045d4:	00f94983          	lbu	s3,15(s2)
    800045d8:	03899993          	slli	s3,s3,0x38
    800045dc:	00f9e9b3          	or	s3,s3,a5
    800045e0:	9b5ff06f          	j	80003f94 <_ZN11HeapManager8heapFreeEPv+0x1b8>
        pFree->nSize += pFree->pNext->nSize + 1;
    800045e4:	0107c683          	lbu	a3,16(a5)
    800045e8:	0117c603          	lbu	a2,17(a5)
    800045ec:	00861613          	slli	a2,a2,0x8
    800045f0:	00d66633          	or	a2,a2,a3
    800045f4:	0127c683          	lbu	a3,18(a5)
    800045f8:	01069693          	slli	a3,a3,0x10
    800045fc:	00c6e633          	or	a2,a3,a2
    80004600:	0137c683          	lbu	a3,19(a5)
    80004604:	01869693          	slli	a3,a3,0x18
    80004608:	00c6e6b3          	or	a3,a3,a2
    8000460c:	0147c603          	lbu	a2,20(a5)
    80004610:	02061613          	slli	a2,a2,0x20
    80004614:	00d666b3          	or	a3,a2,a3
    80004618:	0157c603          	lbu	a2,21(a5)
    8000461c:	02861613          	slli	a2,a2,0x28
    80004620:	00d66633          	or	a2,a2,a3
    80004624:	0167c683          	lbu	a3,22(a5)
    80004628:	03069693          	slli	a3,a3,0x30
    8000462c:	00c6e633          	or	a2,a3,a2
    80004630:	0177c683          	lbu	a3,23(a5)
    80004634:	03869693          	slli	a3,a3,0x38
    80004638:	00c6e6b3          	or	a3,a3,a2
    8000463c:	00d70733          	add	a4,a4,a3
    80004640:	00170713          	addi	a4,a4,1
    80004644:	00e98823          	sb	a4,16(s3)
    80004648:	00875693          	srli	a3,a4,0x8
    8000464c:	00d988a3          	sb	a3,17(s3)
    80004650:	01075693          	srli	a3,a4,0x10
    80004654:	00d98923          	sb	a3,18(s3)
    80004658:	0187569b          	srliw	a3,a4,0x18
    8000465c:	00d989a3          	sb	a3,19(s3)
    80004660:	02075693          	srli	a3,a4,0x20
    80004664:	00d98a23          	sb	a3,20(s3)
    80004668:	02875693          	srli	a3,a4,0x28
    8000466c:	00d98aa3          	sb	a3,21(s3)
    80004670:	03075693          	srli	a3,a4,0x30
    80004674:	00d98b23          	sb	a3,22(s3)
    80004678:	03875713          	srli	a4,a4,0x38
    8000467c:	00e98ba3          	sb	a4,23(s3)
        pFree->pNext = pFree->pNext->pNext;
    80004680:	0007c683          	lbu	a3,0(a5)
    80004684:	0017c703          	lbu	a4,1(a5)
    80004688:	00871713          	slli	a4,a4,0x8
    8000468c:	00d766b3          	or	a3,a4,a3
    80004690:	0027c703          	lbu	a4,2(a5)
    80004694:	01071713          	slli	a4,a4,0x10
    80004698:	00d76733          	or	a4,a4,a3
    8000469c:	0037c683          	lbu	a3,3(a5)
    800046a0:	01869693          	slli	a3,a3,0x18
    800046a4:	00e6e733          	or	a4,a3,a4
    800046a8:	0047c683          	lbu	a3,4(a5)
    800046ac:	02069693          	slli	a3,a3,0x20
    800046b0:	00e6e6b3          	or	a3,a3,a4
    800046b4:	0057c703          	lbu	a4,5(a5)
    800046b8:	02871713          	slli	a4,a4,0x28
    800046bc:	00d766b3          	or	a3,a4,a3
    800046c0:	0067c703          	lbu	a4,6(a5)
    800046c4:	03071713          	slli	a4,a4,0x30
    800046c8:	00d76733          	or	a4,a4,a3
    800046cc:	0077c783          	lbu	a5,7(a5)
    800046d0:	03879793          	slli	a5,a5,0x38
    800046d4:	00e7e7b3          	or	a5,a5,a4
    800046d8:	00e98023          	sb	a4,0(s3)
    800046dc:	0087d713          	srli	a4,a5,0x8
    800046e0:	00e980a3          	sb	a4,1(s3)
    800046e4:	0107d713          	srli	a4,a5,0x10
    800046e8:	00e98123          	sb	a4,2(s3)
    800046ec:	0187d71b          	srliw	a4,a5,0x18
    800046f0:	00e981a3          	sb	a4,3(s3)
    800046f4:	0207d713          	srli	a4,a5,0x20
    800046f8:	00e98223          	sb	a4,4(s3)
    800046fc:	0287d713          	srli	a4,a5,0x28
    80004700:	00e982a3          	sb	a4,5(s3)
    80004704:	0307d713          	srli	a4,a5,0x30
    80004708:	00e98323          	sb	a4,6(s3)
    8000470c:	0387d713          	srli	a4,a5,0x38
    80004710:	00e983a3          	sb	a4,7(s3)
        if(pFree->pNext != 0){
    80004714:	940782e3          	beqz	a5,80004058 <_ZN11HeapManager8heapFreeEPv+0x27c>
            pFree->pNext->pPrev = pFree;
    80004718:	01378423          	sb	s3,8(a5)
    8000471c:	0089d713          	srli	a4,s3,0x8
    80004720:	00e784a3          	sb	a4,9(a5)
    80004724:	0109d713          	srli	a4,s3,0x10
    80004728:	00e78523          	sb	a4,10(a5)
    8000472c:	0189d71b          	srliw	a4,s3,0x18
    80004730:	00e785a3          	sb	a4,11(a5)
    80004734:	0209d713          	srli	a4,s3,0x20
    80004738:	00e78623          	sb	a4,12(a5)
    8000473c:	0289d713          	srli	a4,s3,0x28
    80004740:	00e786a3          	sb	a4,13(a5)
    80004744:	0309d713          	srli	a4,s3,0x30
    80004748:	00e78723          	sb	a4,14(a5)
    8000474c:	0389d993          	srli	s3,s3,0x38
    80004750:	013787a3          	sb	s3,15(a5)
    80004754:	905ff06f          	j	80004058 <_ZN11HeapManager8heapFreeEPv+0x27c>

0000000080004758 <exceptionHandler>:
#include "sem.h"
#include "timer.h"
#include "assert.h"


extern "C" void exceptionHandler(){
    80004758:	fb010113          	addi	sp,sp,-80
    8000475c:	04113423          	sd	ra,72(sp)
    80004760:	04813023          	sd	s0,64(sp)
    80004764:	02913c23          	sd	s1,56(sp)
    80004768:	03213823          	sd	s2,48(sp)
    8000476c:	03313423          	sd	s3,40(sp)
    80004770:	03413023          	sd	s4,32(sp)
    80004774:	01513c23          	sd	s5,24(sp)
    80004778:	01613823          	sd	s6,16(sp)
    8000477c:	01713423          	sd	s7,8(sp)
    80004780:	05010413          	addi	s0,sp,80
    uint64 a0, a1, a2, a3, a4;
    __asm__ volatile("mv %0, a4" : "=r"(a4));
    80004784:	00070b93          	mv	s7,a4
    __asm__ volatile("mv %0, a3" : "=r"(a3));
    80004788:	00068b13          	mv	s6,a3
    __asm__ volatile("mv %0, a2" : "=r"(a2));
    8000478c:	00060a93          	mv	s5,a2
    __asm__ volatile("mv %0, a1" : "=r"(a1));
    80004790:	00058a13          	mv	s4,a1
    __asm__ volatile("mv %0, a0" : "=r"(a0));
    80004794:	00050793          	mv	a5,a0

    uint64 scause;
    __asm__ volatile("csrr %0, scause" : "=r"(scause));
    80004798:	14202973          	csrr	s2,scause

    uint64 sstatus;
    __asm__ volatile("csrr %0, sstatus" : "=r"(sstatus));
    8000479c:	100029f3          	csrr	s3,sstatus

    uint64 sepc;
    __asm__ volatile("csrr %0, sepc" : "=r"(sepc));
    800047a0:	141024f3          	csrr	s1,sepc


    uint64 returnVal = 0;
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    800047a4:	ff890693          	addi	a3,s2,-8
    800047a8:	00100713          	li	a4,1
    800047ac:	06d77463          	bgeu	a4,a3,80004814 <exceptionHandler+0xbc>
        __asm__ volatile("csrw scause, %0" :: "r"(scause));
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    }
    else if (scause == 0x0000000000000005UL){   // illegal read operation
    800047b0:	00500793          	li	a5,5
    800047b4:	20f90263          	beq	s2,a5,800049b8 <exceptionHandler+0x260>
            }
        }
        ConsoleManager::putc('\n');
        assert(false);
    }
    else if (scause == 0x0000000000000007UL){   // illegal write operation
    800047b8:	00700793          	li	a5,7
    800047bc:	3cf90063          	beq	s2,a5,80004b7c <exceptionHandler+0x424>
            }
        }
        ConsoleManager::putc('\n');
        assert(false);
    }
    else if(scause == 0x8000000000000001UL){    /// timer
    800047c0:	fff00793          	li	a5,-1
    800047c4:	03f79793          	slli	a5,a5,0x3f
    800047c8:	00178793          	addi	a5,a5,1
    800047cc:	58f90063          	beq	s2,a5,80004d4c <exceptionHandler+0x5f4>
        Timer::getInstance().tick();
        assert(_thread::currentThread->tick() == 0);
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    }else if (scause== 0x8000000000000009UL)
    800047d0:	fff00793          	li	a5,-1
    800047d4:	03f79793          	slli	a5,a5,0x3f
    800047d8:	00978793          	addi	a5,a5,9
    800047dc:	08f91463          	bne	s2,a5,80004864 <exceptionHandler+0x10c>
    {   
        int irq = plic_claim();
    800047e0:	00005097          	auipc	ra,0x5
    800047e4:	494080e7          	jalr	1172(ra) # 80009c74 <plic_claim>
    800047e8:	00050913          	mv	s2,a0
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    800047ec:	00a00793          	li	a5,10
    800047f0:	5cf50063          	beq	a0,a5,80004db0 <exceptionHandler+0x658>
        // console_handler();
        plic_complete(irq);
    800047f4:	00090513          	mv	a0,s2
    800047f8:	00005097          	auipc	ra,0x5
    800047fc:	4b4080e7          	jalr	1204(ra) # 80009cac <plic_complete>
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80004800:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004804:	10099073          	csrw	sstatus,s3
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 9));
    80004808:	20000793          	li	a5,512
    8000480c:	1447b073          	csrc	sip,a5
    }
    80004810:	0540006f          	j	80004864 <exceptionHandler+0x10c>
        switch(a0){
    80004814:	04200713          	li	a4,66
    80004818:	18f76c63          	bltu	a4,a5,800049b0 <exceptionHandler+0x258>
    8000481c:	00279793          	slli	a5,a5,0x2
    80004820:	00008717          	auipc	a4,0x8
    80004824:	b0c70713          	addi	a4,a4,-1268 # 8000c32c <CONSOLE_STATUS+0x31c>
    80004828:	00e787b3          	add	a5,a5,a4
    8000482c:	0007a783          	lw	a5,0(a5)
    80004830:	00e787b3          	add	a5,a5,a4
    80004834:	00078067          	jr	a5
                returnVal = uint64(HeapManager::getInstance().heapAllocate(a1));
    80004838:	000a0593          	mv	a1,s4
    8000483c:	0000b797          	auipc	a5,0xb
    80004840:	ab47b783          	ld	a5,-1356(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004844:	0007b503          	ld	a0,0(a5)
    80004848:	fffff097          	auipc	ra,0xfffff
    8000484c:	e98080e7          	jalr	-360(ra) # 800036e0 <_ZN11HeapManager12heapAllocateEm>
        __asm__ volatile("csrw scause, %0" :: "r"(scause));
    80004850:	14291073          	csrw	scause,s2
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc+4));
    80004854:	00448493          	addi	s1,s1,4
    80004858:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    8000485c:	10099073          	csrw	sstatus,s3
        __asm__ volatile("mv a0, %0" : : "r"(returnVal));
    80004860:	00050513          	mv	a0,a0
    80004864:	04813083          	ld	ra,72(sp)
    80004868:	04013403          	ld	s0,64(sp)
    8000486c:	03813483          	ld	s1,56(sp)
    80004870:	03013903          	ld	s2,48(sp)
    80004874:	02813983          	ld	s3,40(sp)
    80004878:	02013a03          	ld	s4,32(sp)
    8000487c:	01813a83          	ld	s5,24(sp)
    80004880:	01013b03          	ld	s6,16(sp)
    80004884:	00813b83          	ld	s7,8(sp)
    80004888:	05010113          	addi	sp,sp,80
    8000488c:	00008067          	ret
                returnVal = HeapManager::getInstance().heapFree((void*)a1);
    80004890:	000a0593          	mv	a1,s4
    80004894:	0000b797          	auipc	a5,0xb
    80004898:	a5c7b783          	ld	a5,-1444(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000489c:	0007b503          	ld	a0,0(a5)
    800048a0:	fffff097          	auipc	ra,0xfffff
    800048a4:	53c080e7          	jalr	1340(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
                break;
    800048a8:	fa9ff06f          	j	80004850 <exceptionHandler+0xf8>
                ConsoleManager::putc('\0'); /// removing this line causes everything to break
    800048ac:	00000513          	li	a0,0
    800048b0:	fffff097          	auipc	ra,0xfffff
    800048b4:	958080e7          	jalr	-1704(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
                returnVal = _thread::create((thread_t*)a1, (void(*)(void*))a2, (void*)a3, (void*)a4);
    800048b8:	00100713          	li	a4,1
    800048bc:	000b8693          	mv	a3,s7
    800048c0:	000b0613          	mv	a2,s6
    800048c4:	000a8593          	mv	a1,s5
    800048c8:	000a0513          	mv	a0,s4
    800048cc:	ffffe097          	auipc	ra,0xffffe
    800048d0:	d64080e7          	jalr	-668(ra) # 80002630 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
                break;
    800048d4:	f7dff06f          	j	80004850 <exceptionHandler+0xf8>
                returnVal = _thread::currentThread->exit();
    800048d8:	ffffe097          	auipc	ra,0xffffe
    800048dc:	1f8080e7          	jalr	504(ra) # 80002ad0 <_ZN7_thread4exitEv>
                break;
    800048e0:	f71ff06f          	j	80004850 <exceptionHandler+0xf8>
                _thread::dispatch();
    800048e4:	ffffe097          	auipc	ra,0xffffe
    800048e8:	fb8080e7          	jalr	-72(ra) # 8000289c <_ZN7_thread8dispatchEv>
    uint64 returnVal = 0;
    800048ec:	00000513          	li	a0,0
                break;
    800048f0:	f61ff06f          	j	80004850 <exceptionHandler+0xf8>
                _thread::currentThread->join((thread_t)a1);
    800048f4:	000a0593          	mv	a1,s4
    800048f8:	0000b797          	auipc	a5,0xb
    800048fc:	a187b783          	ld	a5,-1512(a5) # 8000f310 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004900:	0007b503          	ld	a0,0(a5)
    80004904:	ffffe097          	auipc	ra,0xffffe
    80004908:	014080e7          	jalr	20(ra) # 80002918 <_ZN7_thread4joinEPS_>
    uint64 returnVal = 0;
    8000490c:	00000513          	li	a0,0
                break;
    80004910:	f41ff06f          	j	80004850 <exceptionHandler+0xf8>
                _sem::open((sem_t*)a1, unsigned(a2));
    80004914:	000a859b          	sext.w	a1,s5
    80004918:	000a0513          	mv	a0,s4
    8000491c:	00000097          	auipc	ra,0x0
    80004920:	770080e7          	jalr	1904(ra) # 8000508c <_ZN4_sem4openEPPS_j>
    uint64 returnVal = 0;
    80004924:	00000513          	li	a0,0
                break;
    80004928:	f29ff06f          	j	80004850 <exceptionHandler+0xf8>
                _sem::close((sem_t)a1);
    8000492c:	000a0513          	mv	a0,s4
    80004930:	00000097          	auipc	ra,0x0
    80004934:	7c4080e7          	jalr	1988(ra) # 800050f4 <_ZN4_sem5closeEPS_>
    uint64 returnVal = 0;
    80004938:	00000513          	li	a0,0
                break;
    8000493c:	f15ff06f          	j	80004850 <exceptionHandler+0xf8>
                _sem::wait((sem_t)a1);
    80004940:	000a0513          	mv	a0,s4
    80004944:	00001097          	auipc	ra,0x1
    80004948:	81c080e7          	jalr	-2020(ra) # 80005160 <_ZN4_sem4waitEPS_>
    uint64 returnVal = 0;
    8000494c:	00000513          	li	a0,0
                break;
    80004950:	f01ff06f          	j	80004850 <exceptionHandler+0xf8>
                _sem::signal((sem_t)a1);
    80004954:	000a0513          	mv	a0,s4
    80004958:	00001097          	auipc	ra,0x1
    8000495c:	8b8080e7          	jalr	-1864(ra) # 80005210 <_ZN4_sem6signalEPS_>
    uint64 returnVal = 0;
    80004960:	00000513          	li	a0,0
                break;
    80004964:	eedff06f          	j	80004850 <exceptionHandler+0xf8>
                returnVal = _sem::trywait((sem_t)a1);
    80004968:	000a0513          	mv	a0,s4
    8000496c:	00001097          	auipc	ra,0x1
    80004970:	930080e7          	jalr	-1744(ra) # 8000529c <_ZN4_sem7trywaitEPS_>
                break;
    80004974:	eddff06f          	j	80004850 <exceptionHandler+0xf8>
                returnVal = Timer::getInstance().sleep(a1);
    80004978:	00000097          	auipc	ra,0x0
    8000497c:	508080e7          	jalr	1288(ra) # 80004e80 <_ZN5Timer11getInstanceEv>
    80004980:	000a0593          	mv	a1,s4
    80004984:	00000097          	auipc	ra,0x0
    80004988:	5f8080e7          	jalr	1528(ra) # 80004f7c <_ZN5Timer5sleepEm>
                break;
    8000498c:	ec5ff06f          	j	80004850 <exceptionHandler+0xf8>
                returnVal = ConsoleManager::getc();
    80004990:	fffff097          	auipc	ra,0xfffff
    80004994:	8b0080e7          	jalr	-1872(ra) # 80003240 <_ZN14ConsoleManager4getcEv>
                break;
    80004998:	eb9ff06f          	j	80004850 <exceptionHandler+0xf8>
                ConsoleManager::putc(a1);
    8000499c:	0ffa7513          	andi	a0,s4,255
    800049a0:	fffff097          	auipc	ra,0xfffff
    800049a4:	868080e7          	jalr	-1944(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
    uint64 returnVal = 0;
    800049a8:	00000513          	li	a0,0
                break;
    800049ac:	ea5ff06f          	j	80004850 <exceptionHandler+0xf8>
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){   /// check if the exception was a syscall
    800049b0:	00000513          	li	a0,0
    800049b4:	e9dff06f          	j	80004850 <exceptionHandler+0xf8>
        ConsoleManager::putc('\n');
    800049b8:	00a00513          	li	a0,10
    800049bc:	fffff097          	auipc	ra,0xfffff
    800049c0:	84c080e7          	jalr	-1972(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('E');
    800049c4:	04500513          	li	a0,69
    800049c8:	fffff097          	auipc	ra,0xfffff
    800049cc:	840080e7          	jalr	-1984(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800049d0:	07200513          	li	a0,114
    800049d4:	fffff097          	auipc	ra,0xfffff
    800049d8:	834080e7          	jalr	-1996(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800049dc:	07200513          	li	a0,114
    800049e0:	fffff097          	auipc	ra,0xfffff
    800049e4:	828080e7          	jalr	-2008(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('o');
    800049e8:	06f00513          	li	a0,111
    800049ec:	fffff097          	auipc	ra,0xfffff
    800049f0:	81c080e7          	jalr	-2020(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    800049f4:	07200513          	li	a0,114
    800049f8:	fffff097          	auipc	ra,0xfffff
    800049fc:	810080e7          	jalr	-2032(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004a00:	03a00513          	li	a0,58
    80004a04:	fffff097          	auipc	ra,0xfffff
    80004a08:	804080e7          	jalr	-2044(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004a0c:	02000513          	li	a0,32
    80004a10:	ffffe097          	auipc	ra,0xffffe
    80004a14:	7f8080e7          	jalr	2040(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80004a18:	06900513          	li	a0,105
    80004a1c:	ffffe097          	auipc	ra,0xffffe
    80004a20:	7ec080e7          	jalr	2028(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004a24:	06c00513          	li	a0,108
    80004a28:	ffffe097          	auipc	ra,0xffffe
    80004a2c:	7e0080e7          	jalr	2016(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004a30:	06c00513          	li	a0,108
    80004a34:	ffffe097          	auipc	ra,0xffffe
    80004a38:	7d4080e7          	jalr	2004(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004a3c:	06500513          	li	a0,101
    80004a40:	ffffe097          	auipc	ra,0xffffe
    80004a44:	7c8080e7          	jalr	1992(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('g');
    80004a48:	06700513          	li	a0,103
    80004a4c:	ffffe097          	auipc	ra,0xffffe
    80004a50:	7bc080e7          	jalr	1980(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    80004a54:	06100513          	li	a0,97
    80004a58:	ffffe097          	auipc	ra,0xffffe
    80004a5c:	7b0080e7          	jalr	1968(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004a60:	06c00513          	li	a0,108
    80004a64:	ffffe097          	auipc	ra,0xffffe
    80004a68:	7a4080e7          	jalr	1956(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004a6c:	02000513          	li	a0,32
    80004a70:	ffffe097          	auipc	ra,0xffffe
    80004a74:	798080e7          	jalr	1944(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004a78:	07200513          	li	a0,114
    80004a7c:	ffffe097          	auipc	ra,0xffffe
    80004a80:	78c080e7          	jalr	1932(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004a84:	06500513          	li	a0,101
    80004a88:	ffffe097          	auipc	ra,0xffffe
    80004a8c:	780080e7          	jalr	1920(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    80004a90:	06100513          	li	a0,97
    80004a94:	ffffe097          	auipc	ra,0xffffe
    80004a98:	774080e7          	jalr	1908(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('d');
    80004a9c:	06400513          	li	a0,100
    80004aa0:	ffffe097          	auipc	ra,0xffffe
    80004aa4:	768080e7          	jalr	1896(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('!');
    80004aa8:	02100513          	li	a0,33
    80004aac:	ffffe097          	auipc	ra,0xffffe
    80004ab0:	75c080e7          	jalr	1884(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('\n');
    80004ab4:	00a00513          	li	a0,10
    80004ab8:	ffffe097          	auipc	ra,0xffffe
    80004abc:	750080e7          	jalr	1872(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('P');
    80004ac0:	05000513          	li	a0,80
    80004ac4:	ffffe097          	auipc	ra,0xffffe
    80004ac8:	744080e7          	jalr	1860(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('C');
    80004acc:	04300513          	li	a0,67
    80004ad0:	ffffe097          	auipc	ra,0xffffe
    80004ad4:	738080e7          	jalr	1848(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004ad8:	03a00513          	li	a0,58
    80004adc:	ffffe097          	auipc	ra,0xffffe
    80004ae0:	72c080e7          	jalr	1836(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004ae4:	02000513          	li	a0,32
    80004ae8:	ffffe097          	auipc	ra,0xffffe
    80004aec:	720080e7          	jalr	1824(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('0');
    80004af0:	03000513          	li	a0,48
    80004af4:	ffffe097          	auipc	ra,0xffffe
    80004af8:	714080e7          	jalr	1812(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('x');
    80004afc:	07800513          	li	a0,120
    80004b00:	ffffe097          	auipc	ra,0xffffe
    80004b04:	708080e7          	jalr	1800(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004b08:	00f00913          	li	s2,15
    80004b0c:	0140006f          	j	80004b20 <exceptionHandler+0x3c8>
                ConsoleManager::putc('A' + tmp - 10);
    80004b10:	03750513          	addi	a0,a0,55
    80004b14:	ffffe097          	auipc	ra,0xffffe
    80004b18:	6f4080e7          	jalr	1780(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004b1c:	fff9091b          	addiw	s2,s2,-1
    80004b20:	02094463          	bltz	s2,80004b48 <exceptionHandler+0x3f0>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80004b24:	0029151b          	slliw	a0,s2,0x2
    80004b28:	00a4d533          	srl	a0,s1,a0
    80004b2c:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004b30:	00900793          	li	a5,9
    80004b34:	fca7eee3          	bltu	a5,a0,80004b10 <exceptionHandler+0x3b8>
                ConsoleManager::putc('0' + tmp);
    80004b38:	03050513          	addi	a0,a0,48
    80004b3c:	ffffe097          	auipc	ra,0xffffe
    80004b40:	6cc080e7          	jalr	1740(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
    80004b44:	fd9ff06f          	j	80004b1c <exceptionHandler+0x3c4>
        ConsoleManager::putc('\n');
    80004b48:	00a00513          	li	a0,10
    80004b4c:	ffffe097          	auipc	ra,0xffffe
    80004b50:	6bc080e7          	jalr	1724(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        assert(false);
    80004b54:	00007697          	auipc	a3,0x7
    80004b58:	77468693          	addi	a3,a3,1908 # 8000c2c8 <CONSOLE_STATUS+0x2b8>
    80004b5c:	08700613          	li	a2,135
    80004b60:	00007597          	auipc	a1,0x7
    80004b64:	78058593          	addi	a1,a1,1920 # 8000c2e0 <CONSOLE_STATUS+0x2d0>
    80004b68:	00007517          	auipc	a0,0x7
    80004b6c:	79850513          	addi	a0,a0,1944 # 8000c300 <CONSOLE_STATUS+0x2f0>
    80004b70:	00001097          	auipc	ra,0x1
    80004b74:	bac080e7          	jalr	-1108(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    80004b78:	cedff06f          	j	80004864 <exceptionHandler+0x10c>
        ConsoleManager::putc('\n');
    80004b7c:	00a00513          	li	a0,10
    80004b80:	ffffe097          	auipc	ra,0xffffe
    80004b84:	688080e7          	jalr	1672(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('E');
    80004b88:	04500513          	li	a0,69
    80004b8c:	ffffe097          	auipc	ra,0xffffe
    80004b90:	67c080e7          	jalr	1660(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004b94:	07200513          	li	a0,114
    80004b98:	ffffe097          	auipc	ra,0xffffe
    80004b9c:	670080e7          	jalr	1648(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004ba0:	07200513          	li	a0,114
    80004ba4:	ffffe097          	auipc	ra,0xffffe
    80004ba8:	664080e7          	jalr	1636(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('o');
    80004bac:	06f00513          	li	a0,111
    80004bb0:	ffffe097          	auipc	ra,0xffffe
    80004bb4:	658080e7          	jalr	1624(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004bb8:	07200513          	li	a0,114
    80004bbc:	ffffe097          	auipc	ra,0xffffe
    80004bc0:	64c080e7          	jalr	1612(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004bc4:	03a00513          	li	a0,58
    80004bc8:	ffffe097          	auipc	ra,0xffffe
    80004bcc:	640080e7          	jalr	1600(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004bd0:	02000513          	li	a0,32
    80004bd4:	ffffe097          	auipc	ra,0xffffe
    80004bd8:	634080e7          	jalr	1588(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80004bdc:	06900513          	li	a0,105
    80004be0:	ffffe097          	auipc	ra,0xffffe
    80004be4:	628080e7          	jalr	1576(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004be8:	06c00513          	li	a0,108
    80004bec:	ffffe097          	auipc	ra,0xffffe
    80004bf0:	61c080e7          	jalr	1564(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004bf4:	06c00513          	li	a0,108
    80004bf8:	ffffe097          	auipc	ra,0xffffe
    80004bfc:	610080e7          	jalr	1552(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004c00:	06500513          	li	a0,101
    80004c04:	ffffe097          	auipc	ra,0xffffe
    80004c08:	604080e7          	jalr	1540(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('g');
    80004c0c:	06700513          	li	a0,103
    80004c10:	ffffe097          	auipc	ra,0xffffe
    80004c14:	5f8080e7          	jalr	1528(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('a');
    80004c18:	06100513          	li	a0,97
    80004c1c:	ffffe097          	auipc	ra,0xffffe
    80004c20:	5ec080e7          	jalr	1516(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('l');
    80004c24:	06c00513          	li	a0,108
    80004c28:	ffffe097          	auipc	ra,0xffffe
    80004c2c:	5e0080e7          	jalr	1504(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004c30:	02000513          	li	a0,32
    80004c34:	ffffe097          	auipc	ra,0xffffe
    80004c38:	5d4080e7          	jalr	1492(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('w');
    80004c3c:	07700513          	li	a0,119
    80004c40:	ffffe097          	auipc	ra,0xffffe
    80004c44:	5c8080e7          	jalr	1480(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('r');
    80004c48:	07200513          	li	a0,114
    80004c4c:	ffffe097          	auipc	ra,0xffffe
    80004c50:	5bc080e7          	jalr	1468(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('i');
    80004c54:	06900513          	li	a0,105
    80004c58:	ffffe097          	auipc	ra,0xffffe
    80004c5c:	5b0080e7          	jalr	1456(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('t');
    80004c60:	07400513          	li	a0,116
    80004c64:	ffffe097          	auipc	ra,0xffffe
    80004c68:	5a4080e7          	jalr	1444(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('e');
    80004c6c:	06500513          	li	a0,101
    80004c70:	ffffe097          	auipc	ra,0xffffe
    80004c74:	598080e7          	jalr	1432(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('!');
    80004c78:	02100513          	li	a0,33
    80004c7c:	ffffe097          	auipc	ra,0xffffe
    80004c80:	58c080e7          	jalr	1420(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('\n');
    80004c84:	00a00513          	li	a0,10
    80004c88:	ffffe097          	auipc	ra,0xffffe
    80004c8c:	580080e7          	jalr	1408(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('P');
    80004c90:	05000513          	li	a0,80
    80004c94:	ffffe097          	auipc	ra,0xffffe
    80004c98:	574080e7          	jalr	1396(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('C');
    80004c9c:	04300513          	li	a0,67
    80004ca0:	ffffe097          	auipc	ra,0xffffe
    80004ca4:	568080e7          	jalr	1384(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(':');
    80004ca8:	03a00513          	li	a0,58
    80004cac:	ffffe097          	auipc	ra,0xffffe
    80004cb0:	55c080e7          	jalr	1372(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc(' ');
    80004cb4:	02000513          	li	a0,32
    80004cb8:	ffffe097          	auipc	ra,0xffffe
    80004cbc:	550080e7          	jalr	1360(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('0');
    80004cc0:	03000513          	li	a0,48
    80004cc4:	ffffe097          	auipc	ra,0xffffe
    80004cc8:	544080e7          	jalr	1348(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        ConsoleManager::putc('x');
    80004ccc:	07800513          	li	a0,120
    80004cd0:	ffffe097          	auipc	ra,0xffffe
    80004cd4:	538080e7          	jalr	1336(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004cd8:	00f00913          	li	s2,15
    80004cdc:	0140006f          	j	80004cf0 <exceptionHandler+0x598>
                ConsoleManager::putc('A' + tmp - 10);
    80004ce0:	03750513          	addi	a0,a0,55
    80004ce4:	ffffe097          	auipc	ra,0xffffe
    80004ce8:	524080e7          	jalr	1316(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        for(int i = 15; i >= 0; i--){
    80004cec:	fff9091b          	addiw	s2,s2,-1
    80004cf0:	02094463          	bltz	s2,80004d18 <exceptionHandler+0x5c0>
            uint64 tmp = (sepc >> (i * 4)) & 0xF;
    80004cf4:	0029151b          	slliw	a0,s2,0x2
    80004cf8:	00a4d533          	srl	a0,s1,a0
    80004cfc:	00f57513          	andi	a0,a0,15
            if(tmp < 10){
    80004d00:	00900793          	li	a5,9
    80004d04:	fca7eee3          	bltu	a5,a0,80004ce0 <exceptionHandler+0x588>
                ConsoleManager::putc('0' + tmp);
    80004d08:	03050513          	addi	a0,a0,48
    80004d0c:	ffffe097          	auipc	ra,0xffffe
    80004d10:	4fc080e7          	jalr	1276(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
    80004d14:	fd9ff06f          	j	80004cec <exceptionHandler+0x594>
        ConsoleManager::putc('\n');
    80004d18:	00a00513          	li	a0,10
    80004d1c:	ffffe097          	auipc	ra,0xffffe
    80004d20:	4ec080e7          	jalr	1260(ra) # 80003208 <_ZN14ConsoleManager4putcEc>
        assert(false);
    80004d24:	00007697          	auipc	a3,0x7
    80004d28:	5a468693          	addi	a3,a3,1444 # 8000c2c8 <CONSOLE_STATUS+0x2b8>
    80004d2c:	0b000613          	li	a2,176
    80004d30:	00007597          	auipc	a1,0x7
    80004d34:	5b058593          	addi	a1,a1,1456 # 8000c2e0 <CONSOLE_STATUS+0x2d0>
    80004d38:	00007517          	auipc	a0,0x7
    80004d3c:	5c850513          	addi	a0,a0,1480 # 8000c300 <CONSOLE_STATUS+0x2f0>
    80004d40:	00001097          	auipc	ra,0x1
    80004d44:	9dc080e7          	jalr	-1572(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    80004d48:	b1dff06f          	j	80004864 <exceptionHandler+0x10c>
        Timer::getInstance().tick();
    80004d4c:	00000097          	auipc	ra,0x0
    80004d50:	134080e7          	jalr	308(ra) # 80004e80 <_ZN5Timer11getInstanceEv>
    80004d54:	00000097          	auipc	ra,0x0
    80004d58:	190080e7          	jalr	400(ra) # 80004ee4 <_ZN5Timer4tickEv>
        assert(_thread::currentThread->tick() == 0);
    80004d5c:	0000a797          	auipc	a5,0xa
    80004d60:	5b47b783          	ld	a5,1460(a5) # 8000f310 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004d64:	0007b503          	ld	a0,0(a5)
    80004d68:	ffffe097          	auipc	ra,0xffffe
    80004d6c:	cd8080e7          	jalr	-808(ra) # 80002a40 <_ZN7_thread4tickEv>
    80004d70:	00051c63          	bnez	a0,80004d88 <exceptionHandler+0x630>
        __asm__ volatile("csrw sepc, %0" :: "r"(sepc));
    80004d74:	14149073          	csrw	sepc,s1
        __asm__ volatile("csrw sstatus, %0" :: "r"(sstatus));
    80004d78:	10099073          	csrw	sstatus,s3
        __asm__ volatile("csrc sip, %0" :: "r"(1 << 1));
    80004d7c:	00200793          	li	a5,2
    80004d80:	1447b073          	csrc	sip,a5
    80004d84:	ae1ff06f          	j	80004864 <exceptionHandler+0x10c>
        assert(_thread::currentThread->tick() == 0);
    80004d88:	00007697          	auipc	a3,0x7
    80004d8c:	54068693          	addi	a3,a3,1344 # 8000c2c8 <CONSOLE_STATUS+0x2b8>
    80004d90:	0b400613          	li	a2,180
    80004d94:	00007597          	auipc	a1,0x7
    80004d98:	54c58593          	addi	a1,a1,1356 # 8000c2e0 <CONSOLE_STATUS+0x2d0>
    80004d9c:	00007517          	auipc	a0,0x7
    80004da0:	56c50513          	addi	a0,a0,1388 # 8000c308 <CONSOLE_STATUS+0x2f8>
    80004da4:	00001097          	auipc	ra,0x1
    80004da8:	978080e7          	jalr	-1672(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    80004dac:	fc9ff06f          	j	80004d74 <exceptionHandler+0x61c>
        if(irq == CONSOLE_IRQ)ConsoleManager::inputHandler();
    80004db0:	ffffe097          	auipc	ra,0xffffe
    80004db4:	5bc080e7          	jalr	1468(ra) # 8000336c <_ZN14ConsoleManager12inputHandlerEv>
    80004db8:	a3dff06f          	j	800047f4 <exceptionHandler+0x9c>

0000000080004dbc <_ZN5TimerC1Ev>:
#include "thread.h"


Timer* Timer::instance = 0;

Timer::Timer(){
    80004dbc:	fe010113          	addi	sp,sp,-32
    80004dc0:	00113c23          	sd	ra,24(sp)
    80004dc4:	00813823          	sd	s0,16(sp)
    80004dc8:	00913423          	sd	s1,8(sp)
    80004dcc:	02010413          	addi	s0,sp,32
    80004dd0:	00050493          	mv	s1,a0
    assert(instance == 0);
    80004dd4:	0000a797          	auipc	a5,0xa
    80004dd8:	5dc7b783          	ld	a5,1500(a5) # 8000f3b0 <_ZN5Timer8instanceE>
    80004ddc:	02079463          	bnez	a5,80004e04 <_ZN5TimerC1Ev+0x48>
    instance = this;
    80004de0:	0000a797          	auipc	a5,0xa
    80004de4:	5c97b823          	sd	s1,1488(a5) # 8000f3b0 <_ZN5Timer8instanceE>
    sleepingHead = 0;
    80004de8:	0004b023          	sd	zero,0(s1)
    time = 0;
    80004dec:	0004b423          	sd	zero,8(s1)
}
    80004df0:	01813083          	ld	ra,24(sp)
    80004df4:	01013403          	ld	s0,16(sp)
    80004df8:	00813483          	ld	s1,8(sp)
    80004dfc:	02010113          	addi	sp,sp,32
    80004e00:	00008067          	ret
    assert(instance == 0);
    80004e04:	00007697          	auipc	a3,0x7
    80004e08:	63468693          	addi	a3,a3,1588 # 8000c438 <CONSOLE_STATUS+0x428>
    80004e0c:	01600613          	li	a2,22
    80004e10:	00007597          	auipc	a1,0x7
    80004e14:	63858593          	addi	a1,a1,1592 # 8000c448 <CONSOLE_STATUS+0x438>
    80004e18:	00007517          	auipc	a0,0x7
    80004e1c:	32850513          	addi	a0,a0,808 # 8000c140 <CONSOLE_STATUS+0x130>
    80004e20:	00001097          	auipc	ra,0x1
    80004e24:	8fc080e7          	jalr	-1796(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    80004e28:	fb9ff06f          	j	80004de0 <_ZN5TimerC1Ev+0x24>

0000000080004e2c <_ZN5TimerD1Ev>:

Timer::~Timer(){
    threadSleepWrapper* current = sleepingHead;
    80004e2c:	00053583          	ld	a1,0(a0)
    while(current != 0){
    80004e30:	04058663          	beqz	a1,80004e7c <_ZN5TimerD1Ev+0x50>
Timer::~Timer(){
    80004e34:	fe010113          	addi	sp,sp,-32
    80004e38:	00113c23          	sd	ra,24(sp)
    80004e3c:	00813823          	sd	s0,16(sp)
    80004e40:	00913423          	sd	s1,8(sp)
    80004e44:	02010413          	addi	s0,sp,32
        threadSleepWrapper* next = current->next;
    80004e48:	0105b483          	ld	s1,16(a1)
        HeapManager::getInstance().heapFree(current);
    80004e4c:	0000a797          	auipc	a5,0xa
    80004e50:	4a47b783          	ld	a5,1188(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004e54:	0007b503          	ld	a0,0(a5)
    80004e58:	fffff097          	auipc	ra,0xfffff
    80004e5c:	f84080e7          	jalr	-124(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
        current = next;
    80004e60:	00048593          	mv	a1,s1
    while(current != 0){
    80004e64:	fe0492e3          	bnez	s1,80004e48 <_ZN5TimerD1Ev+0x1c>
    }
}
    80004e68:	01813083          	ld	ra,24(sp)
    80004e6c:	01013403          	ld	s0,16(sp)
    80004e70:	00813483          	ld	s1,8(sp)
    80004e74:	02010113          	addi	sp,sp,32
    80004e78:	00008067          	ret
    80004e7c:	00008067          	ret

0000000080004e80 <_ZN5Timer11getInstanceEv>:

Timer& Timer::getInstance(){
    assert(instance != 0);
    80004e80:	0000a797          	auipc	a5,0xa
    80004e84:	5307b783          	ld	a5,1328(a5) # 8000f3b0 <_ZN5Timer8instanceE>
    80004e88:	00078863          	beqz	a5,80004e98 <_ZN5Timer11getInstanceEv+0x18>
    return *instance;
}
    80004e8c:	0000a517          	auipc	a0,0xa
    80004e90:	52453503          	ld	a0,1316(a0) # 8000f3b0 <_ZN5Timer8instanceE>
    80004e94:	00008067          	ret
Timer& Timer::getInstance(){
    80004e98:	ff010113          	addi	sp,sp,-16
    80004e9c:	00113423          	sd	ra,8(sp)
    80004ea0:	00813023          	sd	s0,0(sp)
    80004ea4:	01010413          	addi	s0,sp,16
    assert(instance != 0);
    80004ea8:	00007697          	auipc	a3,0x7
    80004eac:	5b068693          	addi	a3,a3,1456 # 8000c458 <CONSOLE_STATUS+0x448>
    80004eb0:	02600613          	li	a2,38
    80004eb4:	00007597          	auipc	a1,0x7
    80004eb8:	59458593          	addi	a1,a1,1428 # 8000c448 <CONSOLE_STATUS+0x438>
    80004ebc:	00007517          	auipc	a0,0x7
    80004ec0:	24c50513          	addi	a0,a0,588 # 8000c108 <CONSOLE_STATUS+0xf8>
    80004ec4:	00001097          	auipc	ra,0x1
    80004ec8:	858080e7          	jalr	-1960(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
}
    80004ecc:	0000a517          	auipc	a0,0xa
    80004ed0:	4e453503          	ld	a0,1252(a0) # 8000f3b0 <_ZN5Timer8instanceE>
    80004ed4:	00813083          	ld	ra,8(sp)
    80004ed8:	00013403          	ld	s0,0(sp)
    80004edc:	01010113          	addi	sp,sp,16
    80004ee0:	00008067          	ret

0000000080004ee4 <_ZN5Timer4tickEv>:

void Timer::tick(){
    80004ee4:	fe010113          	addi	sp,sp,-32
    80004ee8:	00113c23          	sd	ra,24(sp)
    80004eec:	00813823          	sd	s0,16(sp)
    80004ef0:	00913423          	sd	s1,8(sp)
    80004ef4:	01213023          	sd	s2,0(sp)
    80004ef8:	02010413          	addi	s0,sp,32
    80004efc:	00050493          	mv	s1,a0
    time += 1;
    80004f00:	00853783          	ld	a5,8(a0)
    80004f04:	00178793          	addi	a5,a5,1
    80004f08:	00f53423          	sd	a5,8(a0)
    while(sleepingHead != 0 && sleepingHead->wakeUpTime <= time){
    80004f0c:	0004b783          	ld	a5,0(s1)
    80004f10:	04078a63          	beqz	a5,80004f64 <_ZN5Timer4tickEv+0x80>
    80004f14:	0087b683          	ld	a3,8(a5)
    80004f18:	0084b703          	ld	a4,8(s1)
    80004f1c:	04d76463          	bltu	a4,a3,80004f64 <_ZN5Timer4tickEv+0x80>
        sleepingHead->thread->setSleeping(false);
    80004f20:	00000593          	li	a1,0
    80004f24:	0007b503          	ld	a0,0(a5)
    80004f28:	ffffe097          	auipc	ra,0xffffe
    80004f2c:	944080e7          	jalr	-1724(ra) # 8000286c <_ZN7_thread11setSleepingEb>
        Scheduler::put(sleepingHead->thread);
    80004f30:	0004b783          	ld	a5,0(s1)
    80004f34:	0007b503          	ld	a0,0(a5)
    80004f38:	00000097          	auipc	ra,0x0
    80004f3c:	430080e7          	jalr	1072(ra) # 80005368 <_ZN9Scheduler3putEP7_thread>
        threadSleepWrapper* next = sleepingHead->next;
    80004f40:	0004b583          	ld	a1,0(s1)
    80004f44:	0105b903          	ld	s2,16(a1)
        HeapManager::getInstance().heapFree(sleepingHead);
    80004f48:	0000a797          	auipc	a5,0xa
    80004f4c:	3a87b783          	ld	a5,936(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004f50:	0007b503          	ld	a0,0(a5)
    80004f54:	fffff097          	auipc	ra,0xfffff
    80004f58:	e88080e7          	jalr	-376(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
        sleepingHead = next;
    80004f5c:	0124b023          	sd	s2,0(s1)
    while(sleepingHead != 0 && sleepingHead->wakeUpTime <= time){
    80004f60:	fadff06f          	j	80004f0c <_ZN5Timer4tickEv+0x28>
    }
}
    80004f64:	01813083          	ld	ra,24(sp)
    80004f68:	01013403          	ld	s0,16(sp)
    80004f6c:	00813483          	ld	s1,8(sp)
    80004f70:	00013903          	ld	s2,0(sp)
    80004f74:	02010113          	addi	sp,sp,32
    80004f78:	00008067          	ret

0000000080004f7c <_ZN5Timer5sleepEm>:

int Timer::sleep(time_t timeToSleep){
    80004f7c:	fd010113          	addi	sp,sp,-48
    80004f80:	02113423          	sd	ra,40(sp)
    80004f84:	02813023          	sd	s0,32(sp)
    80004f88:	00913c23          	sd	s1,24(sp)
    80004f8c:	01213823          	sd	s2,16(sp)
    80004f90:	01313423          	sd	s3,8(sp)
    80004f94:	03010413          	addi	s0,sp,48
    80004f98:	00050493          	mv	s1,a0
    80004f9c:	00058913          	mv	s2,a1

    thread_t thread = _thread::currentThread;
    80004fa0:	0000a797          	auipc	a5,0xa
    80004fa4:	3707b783          	ld	a5,880(a5) # 8000f310 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004fa8:	0007b983          	ld	s3,0(a5)
    threadSleepWrapper* newSleepingThread = (threadSleepWrapper*)HeapManager::getInstance().heapAllocate(sizeof(threadSleepWrapper));
    80004fac:	01800593          	li	a1,24
    80004fb0:	0000a797          	auipc	a5,0xa
    80004fb4:	3407b783          	ld	a5,832(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004fb8:	0007b503          	ld	a0,0(a5)
    80004fbc:	ffffe097          	auipc	ra,0xffffe
    80004fc0:	724080e7          	jalr	1828(ra) # 800036e0 <_ZN11HeapManager12heapAllocateEm>
    newSleepingThread->thread = thread;
    80004fc4:	01353023          	sd	s3,0(a0)
    newSleepingThread->wakeUpTime = time + timeToSleep;
    80004fc8:	0084b783          	ld	a5,8(s1)
    80004fcc:	012785b3          	add	a1,a5,s2
    80004fd0:	00b53423          	sd	a1,8(a0)
    newSleepingThread->next = 0;
    80004fd4:	00053823          	sd	zero,16(a0)
    if(sleepingHead == 0){
    80004fd8:	0004b783          	ld	a5,0(s1)
    80004fdc:	06078063          	beqz	a5,8000503c <_ZN5Timer5sleepEm+0xc0>
        sleepingHead = newSleepingThread;
    }else{
        threadSleepWrapper* current = sleepingHead;
        while(current->next != 0 && current->next->wakeUpTime < newSleepingThread->wakeUpTime){
    80004fe0:	00078693          	mv	a3,a5
    80004fe4:	0107b783          	ld	a5,16(a5)
    80004fe8:	00078663          	beqz	a5,80004ff4 <_ZN5Timer5sleepEm+0x78>
    80004fec:	0087b703          	ld	a4,8(a5)
    80004ff0:	feb768e3          	bltu	a4,a1,80004fe0 <_ZN5Timer5sleepEm+0x64>
            current = current->next;
        }
        if(current->wakeUpTime > newSleepingThread->wakeUpTime){
    80004ff4:	0086b703          	ld	a4,8(a3)
    80004ff8:	04e5f663          	bgeu	a1,a4,80005044 <_ZN5Timer5sleepEm+0xc8>
            sleepingHead = newSleepingThread;
    80004ffc:	00a4b023          	sd	a0,0(s1)
            newSleepingThread->next = current;
    80005000:	00d53823          	sd	a3,16(a0)
        }else{
            newSleepingThread->next = current->next;
            current->next = newSleepingThread;
        }
    }
    thread->setSleeping(true);
    80005004:	00100593          	li	a1,1
    80005008:	00098513          	mv	a0,s3
    8000500c:	ffffe097          	auipc	ra,0xffffe
    80005010:	860080e7          	jalr	-1952(ra) # 8000286c <_ZN7_thread11setSleepingEb>
    _thread::dispatch();
    80005014:	ffffe097          	auipc	ra,0xffffe
    80005018:	888080e7          	jalr	-1912(ra) # 8000289c <_ZN7_thread8dispatchEv>
    return 0;
}
    8000501c:	00000513          	li	a0,0
    80005020:	02813083          	ld	ra,40(sp)
    80005024:	02013403          	ld	s0,32(sp)
    80005028:	01813483          	ld	s1,24(sp)
    8000502c:	01013903          	ld	s2,16(sp)
    80005030:	00813983          	ld	s3,8(sp)
    80005034:	03010113          	addi	sp,sp,48
    80005038:	00008067          	ret
        sleepingHead = newSleepingThread;
    8000503c:	00a4b023          	sd	a0,0(s1)
    80005040:	fc5ff06f          	j	80005004 <_ZN5Timer5sleepEm+0x88>
            newSleepingThread->next = current->next;
    80005044:	00f53823          	sd	a5,16(a0)
            current->next = newSleepingThread;
    80005048:	00a6b823          	sd	a0,16(a3)
    8000504c:	fb9ff06f          	j	80005004 <_ZN5Timer5sleepEm+0x88>

0000000080005050 <_ZN5Timer17noSleepingThreadsEv>:

bool Timer::noSleepingThreads(){
    80005050:	ff010113          	addi	sp,sp,-16
    80005054:	00813423          	sd	s0,8(sp)
    80005058:	01010413          	addi	s0,sp,16
    return sleepingHead == 0;
    8000505c:	00053503          	ld	a0,0(a0)
}
    80005060:	00153513          	seqz	a0,a0
    80005064:	00813403          	ld	s0,8(sp)
    80005068:	01010113          	addi	sp,sp,16
    8000506c:	00008067          	ret

0000000080005070 <_ZN5Timer7getTimeEv>:

time_t Timer::getTime(){
    80005070:	ff010113          	addi	sp,sp,-16
    80005074:	00813423          	sd	s0,8(sp)
    80005078:	01010413          	addi	s0,sp,16
    return time;
    8000507c:	00853503          	ld	a0,8(a0)
    80005080:	00813403          	ld	s0,8(sp)
    80005084:	01010113          	addi	sp,sp,16
    80005088:	00008067          	ret

000000008000508c <_ZN4_sem4openEPPS_j>:
#include "sched.h"
#include "heapManager.h"
#include "thread.h"


void _sem::open(_sem** handle, unsigned init){
    8000508c:	fe010113          	addi	sp,sp,-32
    80005090:	00113c23          	sd	ra,24(sp)
    80005094:	00813823          	sd	s0,16(sp)
    80005098:	00913423          	sd	s1,8(sp)
    8000509c:	01213023          	sd	s2,0(sp)
    800050a0:	02010413          	addi	s0,sp,32
    800050a4:	00050493          	mv	s1,a0
    800050a8:	00058913          	mv	s2,a1
    (*handle) = (sem_t)HeapManager::getInstance().heapAllocate((sizeof(_sem) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    800050ac:	00100593          	li	a1,1
    800050b0:	0000a797          	auipc	a5,0xa
    800050b4:	2407b783          	ld	a5,576(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800050b8:	0007b503          	ld	a0,0(a5)
    800050bc:	ffffe097          	auipc	ra,0xffffe
    800050c0:	624080e7          	jalr	1572(ra) # 800036e0 <_ZN11HeapManager12heapAllocateEm>
    800050c4:	00a4b023          	sd	a0,0(s1)
    (*handle)->blockHead = 0;
    800050c8:	00053023          	sd	zero,0(a0)
    (*handle)->blockTail = 0;
    800050cc:	0004b783          	ld	a5,0(s1)
    800050d0:	0007b423          	sd	zero,8(a5)
    (*handle)->value = init;
    800050d4:	0004b783          	ld	a5,0(s1)
    800050d8:	0127a823          	sw	s2,16(a5)
}
    800050dc:	01813083          	ld	ra,24(sp)
    800050e0:	01013403          	ld	s0,16(sp)
    800050e4:	00813483          	ld	s1,8(sp)
    800050e8:	00013903          	ld	s2,0(sp)
    800050ec:	02010113          	addi	sp,sp,32
    800050f0:	00008067          	ret

00000000800050f4 <_ZN4_sem5closeEPS_>:

void _sem::close(sem_t id){
    800050f4:	fe010113          	addi	sp,sp,-32
    800050f8:	00113c23          	sd	ra,24(sp)
    800050fc:	00813823          	sd	s0,16(sp)
    80005100:	00913423          	sd	s1,8(sp)
    80005104:	02010413          	addi	s0,sp,32
    80005108:	00050493          	mv	s1,a0
    while(id->blockHead != 0){
    8000510c:	0004b783          	ld	a5,0(s1)
    80005110:	02078e63          	beqz	a5,8000514c <_ZN4_sem5closeEPS_+0x58>
        id->blockHead->pThread->setClosed(true);
    80005114:	00100593          	li	a1,1
    80005118:	0007b503          	ld	a0,0(a5)
    8000511c:	ffffd097          	auipc	ra,0xffffd
    80005120:	724080e7          	jalr	1828(ra) # 80002840 <_ZN7_thread9setClosedEb>
        HeapManager::getInstance().heapFree(id->blockHead);
    80005124:	0004b583          	ld	a1,0(s1)
    80005128:	0000a797          	auipc	a5,0xa
    8000512c:	1c87b783          	ld	a5,456(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80005130:	0007b503          	ld	a0,0(a5)
    80005134:	fffff097          	auipc	ra,0xfffff
    80005138:	ca8080e7          	jalr	-856(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
        id->blockHead = id->blockHead->pNext;
    8000513c:	0004b783          	ld	a5,0(s1)
    80005140:	0087b783          	ld	a5,8(a5)
    80005144:	00f4b023          	sd	a5,0(s1)
    while(id->blockHead != 0){
    80005148:	fc5ff06f          	j	8000510c <_ZN4_sem5closeEPS_+0x18>
    }
}
    8000514c:	01813083          	ld	ra,24(sp)
    80005150:	01013403          	ld	s0,16(sp)
    80005154:	00813483          	ld	s1,8(sp)
    80005158:	02010113          	addi	sp,sp,32
    8000515c:	00008067          	ret

0000000080005160 <_ZN4_sem4waitEPS_>:

void _sem::wait(sem_t id){
    if(--id->value < 0){
    80005160:	01052783          	lw	a5,16(a0)
    80005164:	fff7879b          	addiw	a5,a5,-1
    80005168:	00f52823          	sw	a5,16(a0)
    8000516c:	02079713          	slli	a4,a5,0x20
    80005170:	00074463          	bltz	a4,80005178 <_ZN4_sem4waitEPS_+0x18>
    80005174:	00008067          	ret
void _sem::wait(sem_t id){
    80005178:	fe010113          	addi	sp,sp,-32
    8000517c:	00113c23          	sd	ra,24(sp)
    80005180:	00813823          	sd	s0,16(sp)
    80005184:	00913423          	sd	s1,8(sp)
    80005188:	02010413          	addi	s0,sp,32
    8000518c:	00050493          	mv	s1,a0
        blockedThreadList* pNewBlock = (blockedThreadList*)HeapManager::getInstance().heapAllocate((sizeof(blockedThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80005190:	00100593          	li	a1,1
    80005194:	0000a797          	auipc	a5,0xa
    80005198:	15c7b783          	ld	a5,348(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000519c:	0007b503          	ld	a0,0(a5)
    800051a0:	ffffe097          	auipc	ra,0xffffe
    800051a4:	540080e7          	jalr	1344(ra) # 800036e0 <_ZN11HeapManager12heapAllocateEm>
        pNewBlock->pThread = _thread::currentThread;
    800051a8:	0000a797          	auipc	a5,0xa
    800051ac:	1687b783          	ld	a5,360(a5) # 8000f310 <_GLOBAL_OFFSET_TABLE_+0x48>
    800051b0:	0007b783          	ld	a5,0(a5)
    800051b4:	00f53023          	sd	a5,0(a0)
        pNewBlock->pNext = 0;
    800051b8:	00053423          	sd	zero,8(a0)
        if(id->blockHead == 0){
    800051bc:	0004b783          	ld	a5,0(s1)
    800051c0:	04078263          	beqz	a5,80005204 <_ZN4_sem4waitEPS_+0xa4>
            id->blockHead = pNewBlock;
            id->blockTail = pNewBlock;
        }else{
            id->blockTail->pNext = pNewBlock;
    800051c4:	0084b783          	ld	a5,8(s1)
    800051c8:	00a7b423          	sd	a0,8(a5)
            id->blockTail = pNewBlock;
    800051cc:	00a4b423          	sd	a0,8(s1)
        }
        _thread::currentThread->setBlocked(true);
    800051d0:	00100593          	li	a1,1
    800051d4:	0000a797          	auipc	a5,0xa
    800051d8:	13c7b783          	ld	a5,316(a5) # 8000f310 <_GLOBAL_OFFSET_TABLE_+0x48>
    800051dc:	0007b503          	ld	a0,0(a5)
    800051e0:	ffffd097          	auipc	ra,0xffffd
    800051e4:	630080e7          	jalr	1584(ra) # 80002810 <_ZN7_thread10setBlockedEb>
        _thread::dispatch();
    800051e8:	ffffd097          	auipc	ra,0xffffd
    800051ec:	6b4080e7          	jalr	1716(ra) # 8000289c <_ZN7_thread8dispatchEv>
    }

}
    800051f0:	01813083          	ld	ra,24(sp)
    800051f4:	01013403          	ld	s0,16(sp)
    800051f8:	00813483          	ld	s1,8(sp)
    800051fc:	02010113          	addi	sp,sp,32
    80005200:	00008067          	ret
            id->blockHead = pNewBlock;
    80005204:	00a4b023          	sd	a0,0(s1)
            id->blockTail = pNewBlock;
    80005208:	00a4b423          	sd	a0,8(s1)
    8000520c:	fc5ff06f          	j	800051d0 <_ZN4_sem4waitEPS_+0x70>

0000000080005210 <_ZN4_sem6signalEPS_>:

void _sem::signal(sem_t id){
    if(++id->value <= 0){
    80005210:	01052783          	lw	a5,16(a0)
    80005214:	0017879b          	addiw	a5,a5,1
    80005218:	0007871b          	sext.w	a4,a5
    8000521c:	00f52823          	sw	a5,16(a0)
    80005220:	00e05463          	blez	a4,80005228 <_ZN4_sem6signalEPS_+0x18>
    80005224:	00008067          	ret
void _sem::signal(sem_t id){
    80005228:	fe010113          	addi	sp,sp,-32
    8000522c:	00113c23          	sd	ra,24(sp)
    80005230:	00813823          	sd	s0,16(sp)
    80005234:	00913423          	sd	s1,8(sp)
    80005238:	02010413          	addi	s0,sp,32
        blockedThreadList* pUnblock = id->blockHead;
    8000523c:	00053483          	ld	s1,0(a0)
        id->blockHead = id->blockHead->pNext;
    80005240:	0084b783          	ld	a5,8(s1)
    80005244:	00f53023          	sd	a5,0(a0)
        if(id->blockHead == 0){
    80005248:	04078663          	beqz	a5,80005294 <_ZN4_sem6signalEPS_+0x84>
            id->blockTail = 0;
        }
        pUnblock->pThread->setBlocked(false);
    8000524c:	00000593          	li	a1,0
    80005250:	0004b503          	ld	a0,0(s1)
    80005254:	ffffd097          	auipc	ra,0xffffd
    80005258:	5bc080e7          	jalr	1468(ra) # 80002810 <_ZN7_thread10setBlockedEb>
        HeapManager::getInstance().heapFree(pUnblock);
    8000525c:	00048593          	mv	a1,s1
    80005260:	0000a797          	auipc	a5,0xa
    80005264:	0907b783          	ld	a5,144(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80005268:	0007b503          	ld	a0,0(a5)
    8000526c:	fffff097          	auipc	ra,0xfffff
    80005270:	b70080e7          	jalr	-1168(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
        thread_t t = pUnblock->pThread;
        Scheduler::put(t);
    80005274:	0004b503          	ld	a0,0(s1)
    80005278:	00000097          	auipc	ra,0x0
    8000527c:	0f0080e7          	jalr	240(ra) # 80005368 <_ZN9Scheduler3putEP7_thread>
    }
}
    80005280:	01813083          	ld	ra,24(sp)
    80005284:	01013403          	ld	s0,16(sp)
    80005288:	00813483          	ld	s1,8(sp)
    8000528c:	02010113          	addi	sp,sp,32
    80005290:	00008067          	ret
            id->blockTail = 0;
    80005294:	00053423          	sd	zero,8(a0)
    80005298:	fb5ff06f          	j	8000524c <_ZN4_sem6signalEPS_+0x3c>

000000008000529c <_ZN4_sem7trywaitEPS_>:

int _sem::trywait(sem_t id){
    8000529c:	ff010113          	addi	sp,sp,-16
    800052a0:	00813423          	sd	s0,8(sp)
    800052a4:	01010413          	addi	s0,sp,16
    if(id->value <= 0){
    800052a8:	01052783          	lw	a5,16(a0)
    800052ac:	00f05e63          	blez	a5,800052c8 <_ZN4_sem7trywaitEPS_+0x2c>
        return 0;
    }else{
        id->value--;
    800052b0:	fff7879b          	addiw	a5,a5,-1
    800052b4:	00f52823          	sw	a5,16(a0)
        return 1;
    800052b8:	00100513          	li	a0,1
    }
    800052bc:	00813403          	ld	s0,8(sp)
    800052c0:	01010113          	addi	sp,sp,16
    800052c4:	00008067          	ret
        return 0;
    800052c8:	00000513          	li	a0,0
    800052cc:	ff1ff06f          	j	800052bc <_ZN4_sem7trywaitEPS_+0x20>

00000000800052d0 <_ZN9SchedulerC1Ev>:
Scheduler* Scheduler::singleton = 0;




Scheduler::Scheduler(){
    800052d0:	fe010113          	addi	sp,sp,-32
    800052d4:	00113c23          	sd	ra,24(sp)
    800052d8:	00813823          	sd	s0,16(sp)
    800052dc:	00913423          	sd	s1,8(sp)
    800052e0:	02010413          	addi	s0,sp,32
    800052e4:	00050493          	mv	s1,a0
    assert(singleton == 0);
    800052e8:	0000a797          	auipc	a5,0xa
    800052ec:	0d07b783          	ld	a5,208(a5) # 8000f3b8 <_ZN9Scheduler9singletonE>
    800052f0:	02079463          	bnez	a5,80005318 <_ZN9SchedulerC1Ev+0x48>
    singleton = this;
    800052f4:	0000a797          	auipc	a5,0xa
    800052f8:	0c97b223          	sd	s1,196(a5) # 8000f3b8 <_ZN9Scheduler9singletonE>
    head = 0;
    800052fc:	0004b023          	sd	zero,0(s1)
    tail = 0;
    80005300:	0004b423          	sd	zero,8(s1)
}
    80005304:	01813083          	ld	ra,24(sp)
    80005308:	01013403          	ld	s0,16(sp)
    8000530c:	00813483          	ld	s1,8(sp)
    80005310:	02010113          	addi	sp,sp,32
    80005314:	00008067          	ret
    assert(singleton == 0);
    80005318:	00007697          	auipc	a3,0x7
    8000531c:	16868693          	addi	a3,a3,360 # 8000c480 <CONSOLE_STATUS+0x470>
    80005320:	01800613          	li	a2,24
    80005324:	00007597          	auipc	a1,0x7
    80005328:	17458593          	addi	a1,a1,372 # 8000c498 <CONSOLE_STATUS+0x488>
    8000532c:	00007517          	auipc	a0,0x7
    80005330:	17c50513          	addi	a0,a0,380 # 8000c4a8 <CONSOLE_STATUS+0x498>
    80005334:	00000097          	auipc	ra,0x0
    80005338:	3e8080e7          	jalr	1000(ra) # 8000571c <_Z13assert_failedPKcS0_jS0_>
    8000533c:	fb9ff06f          	j	800052f4 <_ZN9SchedulerC1Ev+0x24>

0000000080005340 <_ZN9Scheduler7isEmptyEv>:

bool Scheduler::isEmpty(){
    80005340:	ff010113          	addi	sp,sp,-16
    80005344:	00813423          	sd	s0,8(sp)
    80005348:	01010413          	addi	s0,sp,16
    return singleton->head == 0;
    8000534c:	0000a797          	auipc	a5,0xa
    80005350:	06c7b783          	ld	a5,108(a5) # 8000f3b8 <_ZN9Scheduler9singletonE>
    80005354:	0007b503          	ld	a0,0(a5)
}
    80005358:	00153513          	seqz	a0,a0
    8000535c:	00813403          	ld	s0,8(sp)
    80005360:	01010113          	addi	sp,sp,16
    80005364:	00008067          	ret

0000000080005368 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(thread_t thread){
    80005368:	fe010113          	addi	sp,sp,-32
    8000536c:	00113c23          	sd	ra,24(sp)
    80005370:	00813823          	sd	s0,16(sp)
    80005374:	00913423          	sd	s1,8(sp)
    80005378:	01213023          	sd	s2,0(sp)
    8000537c:	02010413          	addi	s0,sp,32
    80005380:	00050493          	mv	s1,a0
    if(singleton->head == 0){
    80005384:	0000a917          	auipc	s2,0xa
    80005388:	03493903          	ld	s2,52(s2) # 8000f3b8 <_ZN9Scheduler9singletonE>
    8000538c:	00093783          	ld	a5,0(s2)
    80005390:	14078263          	beqz	a5,800054d4 <_ZN9Scheduler3putEP7_thread+0x16c>
        singleton->head = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
        singleton->tail = singleton->head;
        singleton->head->thread = thread;
        singleton->head->next = 0;
    }else{
        singleton->tail->next = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80005394:	00893903          	ld	s2,8(s2)
    80005398:	00100593          	li	a1,1
    8000539c:	0000a797          	auipc	a5,0xa
    800053a0:	f547b783          	ld	a5,-172(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800053a4:	0007b503          	ld	a0,0(a5)
    800053a8:	ffffe097          	auipc	ra,0xffffe
    800053ac:	338080e7          	jalr	824(ra) # 800036e0 <_ZN11HeapManager12heapAllocateEm>
    800053b0:	00a90423          	sb	a0,8(s2)
    800053b4:	00855793          	srli	a5,a0,0x8
    800053b8:	00f904a3          	sb	a5,9(s2)
    800053bc:	01055793          	srli	a5,a0,0x10
    800053c0:	00f90523          	sb	a5,10(s2)
    800053c4:	0185579b          	srliw	a5,a0,0x18
    800053c8:	00f905a3          	sb	a5,11(s2)
    800053cc:	02055793          	srli	a5,a0,0x20
    800053d0:	00f90623          	sb	a5,12(s2)
    800053d4:	02855793          	srli	a5,a0,0x28
    800053d8:	00f906a3          	sb	a5,13(s2)
    800053dc:	03055793          	srli	a5,a0,0x30
    800053e0:	00f90723          	sb	a5,14(s2)
    800053e4:	03855513          	srli	a0,a0,0x38
    800053e8:	00a907a3          	sb	a0,15(s2)
        singleton->tail = singleton->tail->next;
    800053ec:	0000a617          	auipc	a2,0xa
    800053f0:	fcc60613          	addi	a2,a2,-52 # 8000f3b8 <_ZN9Scheduler9singletonE>
    800053f4:	00063583          	ld	a1,0(a2)
    800053f8:	0085b703          	ld	a4,8(a1)
    800053fc:	00874783          	lbu	a5,8(a4)
    80005400:	00974683          	lbu	a3,9(a4)
    80005404:	00869693          	slli	a3,a3,0x8
    80005408:	00f6e6b3          	or	a3,a3,a5
    8000540c:	00a74783          	lbu	a5,10(a4)
    80005410:	01079793          	slli	a5,a5,0x10
    80005414:	00d7e6b3          	or	a3,a5,a3
    80005418:	00b74783          	lbu	a5,11(a4)
    8000541c:	01879793          	slli	a5,a5,0x18
    80005420:	00d7e7b3          	or	a5,a5,a3
    80005424:	00c74683          	lbu	a3,12(a4)
    80005428:	02069693          	slli	a3,a3,0x20
    8000542c:	00f6e7b3          	or	a5,a3,a5
    80005430:	00d74683          	lbu	a3,13(a4)
    80005434:	02869693          	slli	a3,a3,0x28
    80005438:	00f6e6b3          	or	a3,a3,a5
    8000543c:	00e74783          	lbu	a5,14(a4)
    80005440:	03079793          	slli	a5,a5,0x30
    80005444:	00d7e6b3          	or	a3,a5,a3
    80005448:	00f74783          	lbu	a5,15(a4)
    8000544c:	03879793          	slli	a5,a5,0x38
    80005450:	00d7e7b3          	or	a5,a5,a3
    80005454:	00f5b423          	sd	a5,8(a1)
        singleton->tail->thread = thread;
    80005458:	00978023          	sb	s1,0(a5)
    8000545c:	0084d713          	srli	a4,s1,0x8
    80005460:	00e780a3          	sb	a4,1(a5)
    80005464:	0104d713          	srli	a4,s1,0x10
    80005468:	00e78123          	sb	a4,2(a5)
    8000546c:	0184d71b          	srliw	a4,s1,0x18
    80005470:	00e781a3          	sb	a4,3(a5)
    80005474:	0204d713          	srli	a4,s1,0x20
    80005478:	00e78223          	sb	a4,4(a5)
    8000547c:	0284d713          	srli	a4,s1,0x28
    80005480:	00e782a3          	sb	a4,5(a5)
    80005484:	0304d713          	srli	a4,s1,0x30
    80005488:	00e78323          	sb	a4,6(a5)
    8000548c:	0384d493          	srli	s1,s1,0x38
    80005490:	009783a3          	sb	s1,7(a5)
        singleton->tail->next = 0;
    80005494:	00063783          	ld	a5,0(a2)
    80005498:	0087b783          	ld	a5,8(a5)
    8000549c:	00078423          	sb	zero,8(a5)
    800054a0:	000784a3          	sb	zero,9(a5)
    800054a4:	00078523          	sb	zero,10(a5)
    800054a8:	000785a3          	sb	zero,11(a5)
    800054ac:	00078623          	sb	zero,12(a5)
    800054b0:	000786a3          	sb	zero,13(a5)
    800054b4:	00078723          	sb	zero,14(a5)
    800054b8:	000787a3          	sb	zero,15(a5)
    }
}
    800054bc:	01813083          	ld	ra,24(sp)
    800054c0:	01013403          	ld	s0,16(sp)
    800054c4:	00813483          	ld	s1,8(sp)
    800054c8:	00013903          	ld	s2,0(sp)
    800054cc:	02010113          	addi	sp,sp,32
    800054d0:	00008067          	ret
        singleton->head = (ThreadList*)HeapManager::getInstance().heapAllocate((sizeof(ThreadList) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    800054d4:	00100593          	li	a1,1
    800054d8:	0000a797          	auipc	a5,0xa
    800054dc:	e187b783          	ld	a5,-488(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800054e0:	0007b503          	ld	a0,0(a5)
    800054e4:	ffffe097          	auipc	ra,0xffffe
    800054e8:	1fc080e7          	jalr	508(ra) # 800036e0 <_ZN11HeapManager12heapAllocateEm>
    800054ec:	00a93023          	sd	a0,0(s2)
        singleton->tail = singleton->head;
    800054f0:	0000a717          	auipc	a4,0xa
    800054f4:	ec870713          	addi	a4,a4,-312 # 8000f3b8 <_ZN9Scheduler9singletonE>
    800054f8:	00073683          	ld	a3,0(a4)
    800054fc:	0006b783          	ld	a5,0(a3)
    80005500:	00f6b423          	sd	a5,8(a3)
        singleton->head->thread = thread;
    80005504:	00978023          	sb	s1,0(a5)
    80005508:	0084d693          	srli	a3,s1,0x8
    8000550c:	00d780a3          	sb	a3,1(a5)
    80005510:	0104d693          	srli	a3,s1,0x10
    80005514:	00d78123          	sb	a3,2(a5)
    80005518:	0184d69b          	srliw	a3,s1,0x18
    8000551c:	00d781a3          	sb	a3,3(a5)
    80005520:	0204d693          	srli	a3,s1,0x20
    80005524:	00d78223          	sb	a3,4(a5)
    80005528:	0284d693          	srli	a3,s1,0x28
    8000552c:	00d782a3          	sb	a3,5(a5)
    80005530:	0304d693          	srli	a3,s1,0x30
    80005534:	00d78323          	sb	a3,6(a5)
    80005538:	0384d493          	srli	s1,s1,0x38
    8000553c:	009783a3          	sb	s1,7(a5)
        singleton->head->next = 0;
    80005540:	00073783          	ld	a5,0(a4)
    80005544:	0007b783          	ld	a5,0(a5)
    80005548:	00078423          	sb	zero,8(a5)
    8000554c:	000784a3          	sb	zero,9(a5)
    80005550:	00078523          	sb	zero,10(a5)
    80005554:	000785a3          	sb	zero,11(a5)
    80005558:	00078623          	sb	zero,12(a5)
    8000555c:	000786a3          	sb	zero,13(a5)
    80005560:	00078723          	sb	zero,14(a5)
    80005564:	000787a3          	sb	zero,15(a5)
    80005568:	f55ff06f          	j	800054bc <_ZN9Scheduler3putEP7_thread+0x154>

000000008000556c <_ZN9Scheduler3getEv>:

thread_t Scheduler::get(){    
    8000556c:	fe010113          	addi	sp,sp,-32
    80005570:	00113c23          	sd	ra,24(sp)
    80005574:	00813823          	sd	s0,16(sp)
    80005578:	00913423          	sd	s1,8(sp)
    8000557c:	02010413          	addi	s0,sp,32
    if(singleton->head == 0){
    80005580:	0000a697          	auipc	a3,0xa
    80005584:	e386b683          	ld	a3,-456(a3) # 8000f3b8 <_ZN9Scheduler9singletonE>
    80005588:	0006b583          	ld	a1,0(a3)
    8000558c:	0e058e63          	beqz	a1,80005688 <_ZN9Scheduler3getEv+0x11c>
        return 0;
    }
    ThreadList* tmp = singleton->head;
    singleton->head = singleton->head->next;
    80005590:	0085c783          	lbu	a5,8(a1)
    80005594:	0095c703          	lbu	a4,9(a1)
    80005598:	00871713          	slli	a4,a4,0x8
    8000559c:	00f76733          	or	a4,a4,a5
    800055a0:	00a5c783          	lbu	a5,10(a1)
    800055a4:	01079793          	slli	a5,a5,0x10
    800055a8:	00e7e733          	or	a4,a5,a4
    800055ac:	00b5c783          	lbu	a5,11(a1)
    800055b0:	01879793          	slli	a5,a5,0x18
    800055b4:	00e7e7b3          	or	a5,a5,a4
    800055b8:	00c5c703          	lbu	a4,12(a1)
    800055bc:	02071713          	slli	a4,a4,0x20
    800055c0:	00f767b3          	or	a5,a4,a5
    800055c4:	00d5c703          	lbu	a4,13(a1)
    800055c8:	02871713          	slli	a4,a4,0x28
    800055cc:	00f76733          	or	a4,a4,a5
    800055d0:	00e5c783          	lbu	a5,14(a1)
    800055d4:	03079793          	slli	a5,a5,0x30
    800055d8:	00e7e733          	or	a4,a5,a4
    800055dc:	00f5c783          	lbu	a5,15(a1)
    800055e0:	03879793          	slli	a5,a5,0x38
    800055e4:	00e7e7b3          	or	a5,a5,a4
    800055e8:	00f6b023          	sd	a5,0(a3)
    if(singleton->head == 0){
    800055ec:	0000a797          	auipc	a5,0xa
    800055f0:	dcc7b783          	ld	a5,-564(a5) # 8000f3b8 <_ZN9Scheduler9singletonE>
    800055f4:	0007b703          	ld	a4,0(a5)
    800055f8:	08070463          	beqz	a4,80005680 <_ZN9Scheduler3getEv+0x114>
        singleton->tail = 0;
    }
    thread_t thread = tmp->thread;
    800055fc:	0005c483          	lbu	s1,0(a1)
    80005600:	0015c783          	lbu	a5,1(a1)
    80005604:	00879793          	slli	a5,a5,0x8
    80005608:	0097e7b3          	or	a5,a5,s1
    8000560c:	0025c483          	lbu	s1,2(a1)
    80005610:	01049493          	slli	s1,s1,0x10
    80005614:	00f4e7b3          	or	a5,s1,a5
    80005618:	0035c483          	lbu	s1,3(a1)
    8000561c:	01849493          	slli	s1,s1,0x18
    80005620:	00f4e4b3          	or	s1,s1,a5
    80005624:	0045c783          	lbu	a5,4(a1)
    80005628:	02079793          	slli	a5,a5,0x20
    8000562c:	0097e4b3          	or	s1,a5,s1
    80005630:	0055c783          	lbu	a5,5(a1)
    80005634:	02879793          	slli	a5,a5,0x28
    80005638:	0097e7b3          	or	a5,a5,s1
    8000563c:	0065c483          	lbu	s1,6(a1)
    80005640:	03049493          	slli	s1,s1,0x30
    80005644:	00f4e7b3          	or	a5,s1,a5
    80005648:	0075c483          	lbu	s1,7(a1)
    8000564c:	03849493          	slli	s1,s1,0x38
    80005650:	00f4e4b3          	or	s1,s1,a5
    HeapManager::getInstance().heapFree(tmp);
    80005654:	0000a797          	auipc	a5,0xa
    80005658:	c9c7b783          	ld	a5,-868(a5) # 8000f2f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000565c:	0007b503          	ld	a0,0(a5)
    80005660:	ffffe097          	auipc	ra,0xffffe
    80005664:	77c080e7          	jalr	1916(ra) # 80003ddc <_ZN11HeapManager8heapFreeEPv>
    return thread;
}
    80005668:	00048513          	mv	a0,s1
    8000566c:	01813083          	ld	ra,24(sp)
    80005670:	01013403          	ld	s0,16(sp)
    80005674:	00813483          	ld	s1,8(sp)
    80005678:	02010113          	addi	sp,sp,32
    8000567c:	00008067          	ret
        singleton->tail = 0;
    80005680:	0007b423          	sd	zero,8(a5)
    80005684:	f79ff06f          	j	800055fc <_ZN9Scheduler3getEv+0x90>
        return 0;
    80005688:	00058493          	mv	s1,a1
    8000568c:	fddff06f          	j	80005668 <_ZN9Scheduler3getEv+0xfc>

0000000080005690 <_ZN9Scheduler8getCountEv>:

int Scheduler::getCount(){
    80005690:	ff010113          	addi	sp,sp,-16
    80005694:	00813423          	sd	s0,8(sp)
    80005698:	01010413          	addi	s0,sp,16
    int count = 0;
    ThreadList* tmp = singleton->head;
    8000569c:	0000a797          	auipc	a5,0xa
    800056a0:	d1c7b783          	ld	a5,-740(a5) # 8000f3b8 <_ZN9Scheduler9singletonE>
    800056a4:	0007b783          	ld	a5,0(a5)
    int count = 0;
    800056a8:	00000513          	li	a0,0
    while(tmp != 0){
    800056ac:	06078263          	beqz	a5,80005710 <_ZN9Scheduler8getCountEv+0x80>
        count++;
    800056b0:	0015051b          	addiw	a0,a0,1
        tmp = tmp->next;
    800056b4:	0087c683          	lbu	a3,8(a5)
    800056b8:	0097c703          	lbu	a4,9(a5)
    800056bc:	00871713          	slli	a4,a4,0x8
    800056c0:	00d766b3          	or	a3,a4,a3
    800056c4:	00a7c703          	lbu	a4,10(a5)
    800056c8:	01071713          	slli	a4,a4,0x10
    800056cc:	00d76733          	or	a4,a4,a3
    800056d0:	00b7c683          	lbu	a3,11(a5)
    800056d4:	01869693          	slli	a3,a3,0x18
    800056d8:	00e6e733          	or	a4,a3,a4
    800056dc:	00c7c683          	lbu	a3,12(a5)
    800056e0:	02069693          	slli	a3,a3,0x20
    800056e4:	00e6e6b3          	or	a3,a3,a4
    800056e8:	00d7c703          	lbu	a4,13(a5)
    800056ec:	02871713          	slli	a4,a4,0x28
    800056f0:	00d766b3          	or	a3,a4,a3
    800056f4:	00e7c703          	lbu	a4,14(a5)
    800056f8:	03071713          	slli	a4,a4,0x30
    800056fc:	00d76733          	or	a4,a4,a3
    80005700:	00f7c783          	lbu	a5,15(a5)
    80005704:	03879793          	slli	a5,a5,0x38
    80005708:	00e7e7b3          	or	a5,a5,a4
    while(tmp != 0){
    8000570c:	fa1ff06f          	j	800056ac <_ZN9Scheduler8getCountEv+0x1c>
    }
    return count;
    80005710:	00813403          	ld	s0,8(sp)
    80005714:	01010113          	addi	sp,sp,16
    80005718:	00008067          	ret

000000008000571c <_Z13assert_failedPKcS0_jS0_>:
 */
#include "assert.h"
#include "syscall_c.h"
#include "consoleManager.h"

void assert_failed( const char * __assertion, const char * __file, unsigned int __line, const char * __function ){
    8000571c:	fb010113          	addi	sp,sp,-80
    80005720:	04113423          	sd	ra,72(sp)
    80005724:	04813023          	sd	s0,64(sp)
    80005728:	02913c23          	sd	s1,56(sp)
    8000572c:	03213823          	sd	s2,48(sp)
    80005730:	03313423          	sd	s3,40(sp)
    80005734:	03413023          	sd	s4,32(sp)
    80005738:	05010413          	addi	s0,sp,80
    8000573c:	00050993          	mv	s3,a0
    80005740:	00058493          	mv	s1,a1
    80005744:	00060913          	mv	s2,a2
    80005748:	00068a13          	mv	s4,a3
    putc('\n');
    8000574c:	00a00513          	li	a0,10
    80005750:	ffffd097          	auipc	ra,0xffffd
    80005754:	cd8080e7          	jalr	-808(ra) # 80002428 <_Z4putcc>
    putc('A');
    80005758:	04100513          	li	a0,65
    8000575c:	ffffd097          	auipc	ra,0xffffd
    80005760:	ccc080e7          	jalr	-820(ra) # 80002428 <_Z4putcc>
    putc('s');
    80005764:	07300513          	li	a0,115
    80005768:	ffffd097          	auipc	ra,0xffffd
    8000576c:	cc0080e7          	jalr	-832(ra) # 80002428 <_Z4putcc>
    putc('s');
    80005770:	07300513          	li	a0,115
    80005774:	ffffd097          	auipc	ra,0xffffd
    80005778:	cb4080e7          	jalr	-844(ra) # 80002428 <_Z4putcc>
    putc('e');
    8000577c:	06500513          	li	a0,101
    80005780:	ffffd097          	auipc	ra,0xffffd
    80005784:	ca8080e7          	jalr	-856(ra) # 80002428 <_Z4putcc>
    putc('r');
    80005788:	07200513          	li	a0,114
    8000578c:	ffffd097          	auipc	ra,0xffffd
    80005790:	c9c080e7          	jalr	-868(ra) # 80002428 <_Z4putcc>
    putc('t');
    80005794:	07400513          	li	a0,116
    80005798:	ffffd097          	auipc	ra,0xffffd
    8000579c:	c90080e7          	jalr	-880(ra) # 80002428 <_Z4putcc>
    putc('i');
    800057a0:	06900513          	li	a0,105
    800057a4:	ffffd097          	auipc	ra,0xffffd
    800057a8:	c84080e7          	jalr	-892(ra) # 80002428 <_Z4putcc>
    putc('o');
    800057ac:	06f00513          	li	a0,111
    800057b0:	ffffd097          	auipc	ra,0xffffd
    800057b4:	c78080e7          	jalr	-904(ra) # 80002428 <_Z4putcc>
    putc('n');
    800057b8:	06e00513          	li	a0,110
    800057bc:	ffffd097          	auipc	ra,0xffffd
    800057c0:	c6c080e7          	jalr	-916(ra) # 80002428 <_Z4putcc>
    putc(' ');
    800057c4:	02000513          	li	a0,32
    800057c8:	ffffd097          	auipc	ra,0xffffd
    800057cc:	c60080e7          	jalr	-928(ra) # 80002428 <_Z4putcc>
    putc('\'');
    800057d0:	02700513          	li	a0,39
    800057d4:	ffffd097          	auipc	ra,0xffffd
    800057d8:	c54080e7          	jalr	-940(ra) # 80002428 <_Z4putcc>
    while(*__assertion != 0){
    800057dc:	0009c503          	lbu	a0,0(s3)
    800057e0:	00050a63          	beqz	a0,800057f4 <_Z13assert_failedPKcS0_jS0_+0xd8>
        putc(*__assertion);
    800057e4:	ffffd097          	auipc	ra,0xffffd
    800057e8:	c44080e7          	jalr	-956(ra) # 80002428 <_Z4putcc>
        __assertion++;
    800057ec:	00198993          	addi	s3,s3,1
    while(*__assertion != 0){
    800057f0:	fedff06f          	j	800057dc <_Z13assert_failedPKcS0_jS0_+0xc0>
    }
    putc('\'');
    800057f4:	02700513          	li	a0,39
    800057f8:	ffffd097          	auipc	ra,0xffffd
    800057fc:	c30080e7          	jalr	-976(ra) # 80002428 <_Z4putcc>
    putc(' ');
    80005800:	02000513          	li	a0,32
    80005804:	ffffd097          	auipc	ra,0xffffd
    80005808:	c24080e7          	jalr	-988(ra) # 80002428 <_Z4putcc>
    putc('f');
    8000580c:	06600513          	li	a0,102
    80005810:	ffffd097          	auipc	ra,0xffffd
    80005814:	c18080e7          	jalr	-1000(ra) # 80002428 <_Z4putcc>
    putc('a');
    80005818:	06100513          	li	a0,97
    8000581c:	ffffd097          	auipc	ra,0xffffd
    80005820:	c0c080e7          	jalr	-1012(ra) # 80002428 <_Z4putcc>
    putc('i');
    80005824:	06900513          	li	a0,105
    80005828:	ffffd097          	auipc	ra,0xffffd
    8000582c:	c00080e7          	jalr	-1024(ra) # 80002428 <_Z4putcc>
    putc('l');
    80005830:	06c00513          	li	a0,108
    80005834:	ffffd097          	auipc	ra,0xffffd
    80005838:	bf4080e7          	jalr	-1036(ra) # 80002428 <_Z4putcc>
    putc('e');
    8000583c:	06500513          	li	a0,101
    80005840:	ffffd097          	auipc	ra,0xffffd
    80005844:	be8080e7          	jalr	-1048(ra) # 80002428 <_Z4putcc>
    putc('d');
    80005848:	06400513          	li	a0,100
    8000584c:	ffffd097          	auipc	ra,0xffffd
    80005850:	bdc080e7          	jalr	-1060(ra) # 80002428 <_Z4putcc>
    putc(' ');
    80005854:	02000513          	li	a0,32
    80005858:	ffffd097          	auipc	ra,0xffffd
    8000585c:	bd0080e7          	jalr	-1072(ra) # 80002428 <_Z4putcc>
    putc('i');
    80005860:	06900513          	li	a0,105
    80005864:	ffffd097          	auipc	ra,0xffffd
    80005868:	bc4080e7          	jalr	-1084(ra) # 80002428 <_Z4putcc>
    putc('n');
    8000586c:	06e00513          	li	a0,110
    80005870:	ffffd097          	auipc	ra,0xffffd
    80005874:	bb8080e7          	jalr	-1096(ra) # 80002428 <_Z4putcc>
    putc(' ');
    80005878:	02000513          	li	a0,32
    8000587c:	ffffd097          	auipc	ra,0xffffd
    80005880:	bac080e7          	jalr	-1108(ra) # 80002428 <_Z4putcc>
    putc('f');
    80005884:	06600513          	li	a0,102
    80005888:	ffffd097          	auipc	ra,0xffffd
    8000588c:	ba0080e7          	jalr	-1120(ra) # 80002428 <_Z4putcc>
    putc('i');
    80005890:	06900513          	li	a0,105
    80005894:	ffffd097          	auipc	ra,0xffffd
    80005898:	b94080e7          	jalr	-1132(ra) # 80002428 <_Z4putcc>
    putc('l');
    8000589c:	06c00513          	li	a0,108
    800058a0:	ffffd097          	auipc	ra,0xffffd
    800058a4:	b88080e7          	jalr	-1144(ra) # 80002428 <_Z4putcc>
    putc('e');
    800058a8:	06500513          	li	a0,101
    800058ac:	ffffd097          	auipc	ra,0xffffd
    800058b0:	b7c080e7          	jalr	-1156(ra) # 80002428 <_Z4putcc>
    putc(':');
    800058b4:	03a00513          	li	a0,58
    800058b8:	ffffd097          	auipc	ra,0xffffd
    800058bc:	b70080e7          	jalr	-1168(ra) # 80002428 <_Z4putcc>
    putc(' ');
    800058c0:	02000513          	li	a0,32
    800058c4:	ffffd097          	auipc	ra,0xffffd
    800058c8:	b64080e7          	jalr	-1180(ra) # 80002428 <_Z4putcc>
    while(*__file != 0){
    800058cc:	0004c503          	lbu	a0,0(s1)
    800058d0:	00050a63          	beqz	a0,800058e4 <_Z13assert_failedPKcS0_jS0_+0x1c8>
        putc(*__file);
    800058d4:	ffffd097          	auipc	ra,0xffffd
    800058d8:	b54080e7          	jalr	-1196(ra) # 80002428 <_Z4putcc>
        __file++;
    800058dc:	00148493          	addi	s1,s1,1
    while(*__file != 0){
    800058e0:	fedff06f          	j	800058cc <_Z13assert_failedPKcS0_jS0_+0x1b0>
    }
    putc('\n');
    800058e4:	00a00513          	li	a0,10
    800058e8:	ffffd097          	auipc	ra,0xffffd
    800058ec:	b40080e7          	jalr	-1216(ra) # 80002428 <_Z4putcc>
    putc('l');
    800058f0:	06c00513          	li	a0,108
    800058f4:	ffffd097          	auipc	ra,0xffffd
    800058f8:	b34080e7          	jalr	-1228(ra) # 80002428 <_Z4putcc>
    putc('i');
    800058fc:	06900513          	li	a0,105
    80005900:	ffffd097          	auipc	ra,0xffffd
    80005904:	b28080e7          	jalr	-1240(ra) # 80002428 <_Z4putcc>
    putc('n');
    80005908:	06e00513          	li	a0,110
    8000590c:	ffffd097          	auipc	ra,0xffffd
    80005910:	b1c080e7          	jalr	-1252(ra) # 80002428 <_Z4putcc>
    putc('e');
    80005914:	06500513          	li	a0,101
    80005918:	ffffd097          	auipc	ra,0xffffd
    8000591c:	b10080e7          	jalr	-1264(ra) # 80002428 <_Z4putcc>
    putc(':');
    80005920:	03a00513          	li	a0,58
    80005924:	ffffd097          	auipc	ra,0xffffd
    80005928:	b04080e7          	jalr	-1276(ra) # 80002428 <_Z4putcc>
    putc(' ');
    8000592c:	02000513          	li	a0,32
    80005930:	ffffd097          	auipc	ra,0xffffd
    80005934:	af8080e7          	jalr	-1288(ra) # 80002428 <_Z4putcc>
    char buffer[20];
    int i = 0;
    80005938:	00000493          	li	s1,0
    while(__line != 0){
    8000593c:	02090463          	beqz	s2,80005964 <_Z13assert_failedPKcS0_jS0_+0x248>
        buffer[i] = __line % 10 + '0';
    80005940:	00a00713          	li	a4,10
    80005944:	02e977bb          	remuw	a5,s2,a4
    80005948:	0307879b          	addiw	a5,a5,48
    8000594c:	fd040693          	addi	a3,s0,-48
    80005950:	009686b3          	add	a3,a3,s1
    80005954:	fef68423          	sb	a5,-24(a3)
        __line /= 10;
    80005958:	02e9593b          	divuw	s2,s2,a4
        i++;
    8000595c:	0014849b          	addiw	s1,s1,1
    while(__line != 0){
    80005960:	fddff06f          	j	8000593c <_Z13assert_failedPKcS0_jS0_+0x220>
    }
    while(i != 0){
    80005964:	02048063          	beqz	s1,80005984 <_Z13assert_failedPKcS0_jS0_+0x268>
        i--;
    80005968:	fff4849b          	addiw	s1,s1,-1
        putc(buffer[i]);
    8000596c:	fd040793          	addi	a5,s0,-48
    80005970:	009787b3          	add	a5,a5,s1
    80005974:	fe87c503          	lbu	a0,-24(a5)
    80005978:	ffffd097          	auipc	ra,0xffffd
    8000597c:	ab0080e7          	jalr	-1360(ra) # 80002428 <_Z4putcc>
    80005980:	fe5ff06f          	j	80005964 <_Z13assert_failedPKcS0_jS0_+0x248>
    }
    putc('\n');
    80005984:	00a00513          	li	a0,10
    80005988:	ffffd097          	auipc	ra,0xffffd
    8000598c:	aa0080e7          	jalr	-1376(ra) # 80002428 <_Z4putcc>
    putc('f');
    80005990:	06600513          	li	a0,102
    80005994:	ffffd097          	auipc	ra,0xffffd
    80005998:	a94080e7          	jalr	-1388(ra) # 80002428 <_Z4putcc>
    putc('u');
    8000599c:	07500513          	li	a0,117
    800059a0:	ffffd097          	auipc	ra,0xffffd
    800059a4:	a88080e7          	jalr	-1400(ra) # 80002428 <_Z4putcc>
    putc('n');
    800059a8:	06e00513          	li	a0,110
    800059ac:	ffffd097          	auipc	ra,0xffffd
    800059b0:	a7c080e7          	jalr	-1412(ra) # 80002428 <_Z4putcc>
    putc('c');
    800059b4:	06300513          	li	a0,99
    800059b8:	ffffd097          	auipc	ra,0xffffd
    800059bc:	a70080e7          	jalr	-1424(ra) # 80002428 <_Z4putcc>
    putc('t');
    800059c0:	07400513          	li	a0,116
    800059c4:	ffffd097          	auipc	ra,0xffffd
    800059c8:	a64080e7          	jalr	-1436(ra) # 80002428 <_Z4putcc>
    putc('i');
    800059cc:	06900513          	li	a0,105
    800059d0:	ffffd097          	auipc	ra,0xffffd
    800059d4:	a58080e7          	jalr	-1448(ra) # 80002428 <_Z4putcc>
    putc('o');
    800059d8:	06f00513          	li	a0,111
    800059dc:	ffffd097          	auipc	ra,0xffffd
    800059e0:	a4c080e7          	jalr	-1460(ra) # 80002428 <_Z4putcc>
    putc('n');
    800059e4:	06e00513          	li	a0,110
    800059e8:	ffffd097          	auipc	ra,0xffffd
    800059ec:	a40080e7          	jalr	-1472(ra) # 80002428 <_Z4putcc>
    putc(':');
    800059f0:	03a00513          	li	a0,58
    800059f4:	ffffd097          	auipc	ra,0xffffd
    800059f8:	a34080e7          	jalr	-1484(ra) # 80002428 <_Z4putcc>
    putc(' ');
    800059fc:	02000513          	li	a0,32
    80005a00:	ffffd097          	auipc	ra,0xffffd
    80005a04:	a28080e7          	jalr	-1496(ra) # 80002428 <_Z4putcc>
    putc('\'');
    80005a08:	02700513          	li	a0,39
    80005a0c:	ffffd097          	auipc	ra,0xffffd
    80005a10:	a1c080e7          	jalr	-1508(ra) # 80002428 <_Z4putcc>
    while(*__function != 0){
    80005a14:	000a4503          	lbu	a0,0(s4)
    80005a18:	00050a63          	beqz	a0,80005a2c <_Z13assert_failedPKcS0_jS0_+0x310>
        putc(*__function);
    80005a1c:	ffffd097          	auipc	ra,0xffffd
    80005a20:	a0c080e7          	jalr	-1524(ra) # 80002428 <_Z4putcc>
        __function ++;
    80005a24:	001a0a13          	addi	s4,s4,1
    while(*__function != 0){
    80005a28:	fedff06f          	j	80005a14 <_Z13assert_failedPKcS0_jS0_+0x2f8>
    }
    putc('\'');
    80005a2c:	02700513          	li	a0,39
    80005a30:	ffffd097          	auipc	ra,0xffffd
    80005a34:	9f8080e7          	jalr	-1544(ra) # 80002428 <_Z4putcc>
    putc('\n');
    80005a38:	00a00513          	li	a0,10
    80005a3c:	ffffd097          	auipc	ra,0xffffd
    80005a40:	9ec080e7          	jalr	-1556(ra) # 80002428 <_Z4putcc>
    while(1);
    80005a44:	0000006f          	j	80005a44 <_Z13assert_failedPKcS0_jS0_+0x328>

0000000080005a48 <_Z4testPv>:
    /// initialise the console
    console.getInstance().init();
    return;
}

void test(void* arg){
    80005a48:	ff010113          	addi	sp,sp,-16
    80005a4c:	00113423          	sd	ra,8(sp)
    80005a50:	00813023          	sd	s0,0(sp)
    80005a54:	01010413          	addi	s0,sp,16
    // usermain(arg);
    usermainCPP(arg);
    80005a58:	ffffc097          	auipc	ra,0xffffc
    80005a5c:	de0080e7          	jalr	-544(ra) # 80001838 <_Z11usermainCPPPv>
    // userMain();
}
    80005a60:	00813083          	ld	ra,8(sp)
    80005a64:	00013403          	ld	s0,0(sp)
    80005a68:	01010113          	addi	sp,sp,16
    80005a6c:	00008067          	ret

0000000080005a70 <_Z15consoleConsumerPv>:


void consoleConsumer(void* arg){
    80005a70:	ff010113          	addi	sp,sp,-16
    80005a74:	00113423          	sd	ra,8(sp)
    80005a78:	00813023          	sd	s0,0(sp)
    80005a7c:	01010413          	addi	s0,sp,16
    ConsoleManager::outputHandler();
    80005a80:	ffffe097          	auipc	ra,0xffffe
    80005a84:	86c080e7          	jalr	-1940(ra) # 800032ec <_ZN14ConsoleManager13outputHandlerEv>
}
    80005a88:	00813083          	ld	ra,8(sp)
    80005a8c:	00013403          	ld	s0,0(sp)
    80005a90:	01010113          	addi	sp,sp,16
    80005a94:	00008067          	ret

0000000080005a98 <_ZN6KernelC1Ev>:
Kernel::Kernel(): heapManager(), scheduler(), timer(){}
    80005a98:	fd010113          	addi	sp,sp,-48
    80005a9c:	02113423          	sd	ra,40(sp)
    80005aa0:	02813023          	sd	s0,32(sp)
    80005aa4:	00913c23          	sd	s1,24(sp)
    80005aa8:	01213823          	sd	s2,16(sp)
    80005aac:	01313423          	sd	s3,8(sp)
    80005ab0:	03010413          	addi	s0,sp,48
    80005ab4:	00050493          	mv	s1,a0
    80005ab8:	ffffe097          	auipc	ra,0xffffe
    80005abc:	928080e7          	jalr	-1752(ra) # 800033e0 <_ZN11HeapManagerC1Ev>
    80005ac0:	00848513          	addi	a0,s1,8
    80005ac4:	00000097          	auipc	ra,0x0
    80005ac8:	80c080e7          	jalr	-2036(ra) # 800052d0 <_ZN9SchedulerC1Ev>
    80005acc:	01848913          	addi	s2,s1,24
    80005ad0:	00090513          	mv	a0,s2
    80005ad4:	fffff097          	auipc	ra,0xfffff
    80005ad8:	2e8080e7          	jalr	744(ra) # 80004dbc <_ZN5TimerC1Ev>
    80005adc:	02848513          	addi	a0,s1,40
    80005ae0:	ffffd097          	auipc	ra,0xffffd
    80005ae4:	4c8080e7          	jalr	1224(ra) # 80002fa8 <_ZN14ConsoleManagerC1Ev>
    80005ae8:	0380006f          	j	80005b20 <_ZN6KernelC1Ev+0x88>
    80005aec:	00050993          	mv	s3,a0
    80005af0:	00090513          	mv	a0,s2
    80005af4:	fffff097          	auipc	ra,0xfffff
    80005af8:	338080e7          	jalr	824(ra) # 80004e2c <_ZN5TimerD1Ev>
    80005afc:	00098913          	mv	s2,s3
    80005b00:	00048513          	mv	a0,s1
    80005b04:	ffffe097          	auipc	ra,0xffffe
    80005b08:	944080e7          	jalr	-1724(ra) # 80003448 <_ZN11HeapManagerD1Ev>
    80005b0c:	00090513          	mv	a0,s2
    80005b10:	0000b097          	auipc	ra,0xb
    80005b14:	9d8080e7          	jalr	-1576(ra) # 800104e8 <_Unwind_Resume>
    80005b18:	00050913          	mv	s2,a0
    80005b1c:	fe5ff06f          	j	80005b00 <_ZN6KernelC1Ev+0x68>
    80005b20:	02813083          	ld	ra,40(sp)
    80005b24:	02013403          	ld	s0,32(sp)
    80005b28:	01813483          	ld	s1,24(sp)
    80005b2c:	01013903          	ld	s2,16(sp)
    80005b30:	00813983          	ld	s3,8(sp)
    80005b34:	03010113          	addi	sp,sp,48
    80005b38:	00008067          	ret

0000000080005b3c <_ZN6Kernel10initialiseEv>:
void Kernel::initialise(){
    80005b3c:	ff010113          	addi	sp,sp,-16
    80005b40:	00113423          	sd	ra,8(sp)
    80005b44:	00813023          	sd	s0,0(sp)
    80005b48:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw stvec, %0" :: "r"(trap));
    80005b4c:	00009797          	auipc	a5,0x9
    80005b50:	7b47b783          	ld	a5,1972(a5) # 8000f300 <_GLOBAL_OFFSET_TABLE_+0x38>
    80005b54:	10579073          	csrw	stvec,a5
    heapManager.init((uint64)HEAP_START_ADDR, (uint64)HEAP_END_ADDR );
    80005b58:	00009797          	auipc	a5,0x9
    80005b5c:	7b07b783          	ld	a5,1968(a5) # 8000f308 <_GLOBAL_OFFSET_TABLE_+0x40>
    80005b60:	0007b603          	ld	a2,0(a5)
    80005b64:	00009797          	auipc	a5,0x9
    80005b68:	77c7b783          	ld	a5,1916(a5) # 8000f2e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80005b6c:	0007b583          	ld	a1,0(a5)
    80005b70:	ffffe097          	auipc	ra,0xffffe
    80005b74:	8f0080e7          	jalr	-1808(ra) # 80003460 <_ZN11HeapManager4initEmm>
    console.getInstance().init();
    80005b78:	ffffd097          	auipc	ra,0xffffd
    80005b7c:	3a0080e7          	jalr	928(ra) # 80002f18 <_ZN14ConsoleManager11getInstanceEv>
    80005b80:	ffffd097          	auipc	ra,0xffffd
    80005b84:	554080e7          	jalr	1364(ra) # 800030d4 <_ZN14ConsoleManager4initEv>
}
    80005b88:	00813083          	ld	ra,8(sp)
    80005b8c:	00013403          	ld	s0,0(sp)
    80005b90:	01010113          	addi	sp,sp,16
    80005b94:	00008067          	ret

0000000080005b98 <_ZN6Kernel3runEv>:


Kernel::EXIT_CODE Kernel::run(){
    80005b98:	fd010113          	addi	sp,sp,-48
    80005b9c:	02113423          	sd	ra,40(sp)
    80005ba0:	02813023          	sd	s0,32(sp)
    80005ba4:	03010413          	addi	s0,sp,48

    thread_t kernelThread;
    
    void* stack = reinterpret_cast<void*>(reinterpret_cast<uint64>(mem_alloc(DEFAULT_STACK_SIZE)) + DEFAULT_STACK_SIZE - 1);
    80005ba8:	00001537          	lui	a0,0x1
    80005bac:	ffffc097          	auipc	ra,0xffffc
    80005bb0:	5d4080e7          	jalr	1492(ra) # 80002180 <_Z9mem_allocm>
    _thread::create(&kernelThread, 0, 0, stack, false);
    80005bb4:	00000713          	li	a4,0
    80005bb8:	000017b7          	lui	a5,0x1
    80005bbc:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    80005bc0:	00f506b3          	add	a3,a0,a5
    80005bc4:	00000613          	li	a2,0
    80005bc8:	00000593          	li	a1,0
    80005bcc:	fe840513          	addi	a0,s0,-24
    80005bd0:	ffffd097          	auipc	ra,0xffffd
    80005bd4:	a60080e7          	jalr	-1440(ra) # 80002630 <_ZN7_thread6createEPPS_PFvPvES2_S2_b>
    _thread::currentThread = kernelThread;
    80005bd8:	00009797          	auipc	a5,0x9
    80005bdc:	7387b783          	ld	a5,1848(a5) # 8000f310 <_GLOBAL_OFFSET_TABLE_+0x48>
    80005be0:	fe843703          	ld	a4,-24(s0)
    80005be4:	00e7b023          	sd	a4,0(a5)


    thread_t consoleThread;
    thread_create(&consoleThread, consoleConsumer, 0);
    80005be8:	00000613          	li	a2,0
    80005bec:	00000597          	auipc	a1,0x0
    80005bf0:	e8458593          	addi	a1,a1,-380 # 80005a70 <_Z15consoleConsumerPv>
    80005bf4:	fe040513          	addi	a0,s0,-32
    80005bf8:	ffffc097          	auipc	ra,0xffffc
    80005bfc:	5e4080e7          	jalr	1508(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>

    /// enable external hardware interrupts
    __asm__ volatile ("csrs sie, %0" :: "r"(1<<9));
    80005c00:	20000793          	li	a5,512
    80005c04:	1047a073          	csrs	sie,a5

    /// enable software interrupts
    __asm__ volatile ("csrs sstatus, %0" :: "r"(1<<1));
    80005c08:	00200793          	li	a5,2
    80005c0c:	1007a073          	csrs	sstatus,a5


    thread_t userThread;
    thread_create(&userThread, test, 0);
    80005c10:	00000613          	li	a2,0
    80005c14:	00000597          	auipc	a1,0x0
    80005c18:	e3458593          	addi	a1,a1,-460 # 80005a48 <_Z4testPv>
    80005c1c:	fd840513          	addi	a0,s0,-40
    80005c20:	ffffc097          	auipc	ra,0xffffc
    80005c24:	5bc080e7          	jalr	1468(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    while(!userThread->finished){
    80005c28:	fd843783          	ld	a5,-40(s0)
    80005c2c:	0a07b783          	ld	a5,160(a5)
    80005c30:	0087f793          	andi	a5,a5,8
    80005c34:	00079863          	bnez	a5,80005c44 <_ZN6Kernel3runEv+0xac>
        thread_dispatch();
    80005c38:	ffffc097          	auipc	ra,0xffffc
    80005c3c:	640080e7          	jalr	1600(ra) # 80002278 <_Z15thread_dispatchv>
    80005c40:	fe9ff06f          	j	80005c28 <_ZN6Kernel3runEv+0x90>
    }


    return EXIT_SUCCESS;
}
    80005c44:	00000513          	li	a0,0
    80005c48:	02813083          	ld	ra,40(sp)
    80005c4c:	02013403          	ld	s0,32(sp)
    80005c50:	03010113          	addi	sp,sp,48
    80005c54:	00008067          	ret

0000000080005c58 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005c58:	fe010113          	addi	sp,sp,-32
    80005c5c:	00113c23          	sd	ra,24(sp)
    80005c60:	00813823          	sd	s0,16(sp)
    80005c64:	00913423          	sd	s1,8(sp)
    80005c68:	01213023          	sd	s2,0(sp)
    80005c6c:	02010413          	addi	s0,sp,32
    80005c70:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005c74:	00100793          	li	a5,1
    80005c78:	02a7f863          	bgeu	a5,a0,80005ca8 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005c7c:	00a00793          	li	a5,10
    80005c80:	02f577b3          	remu	a5,a0,a5
    80005c84:	02078e63          	beqz	a5,80005cc0 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005c88:	fff48513          	addi	a0,s1,-1
    80005c8c:	00000097          	auipc	ra,0x0
    80005c90:	fcc080e7          	jalr	-52(ra) # 80005c58 <_ZL9fibonaccim>
    80005c94:	00050913          	mv	s2,a0
    80005c98:	ffe48513          	addi	a0,s1,-2
    80005c9c:	00000097          	auipc	ra,0x0
    80005ca0:	fbc080e7          	jalr	-68(ra) # 80005c58 <_ZL9fibonaccim>
    80005ca4:	00a90533          	add	a0,s2,a0
}
    80005ca8:	01813083          	ld	ra,24(sp)
    80005cac:	01013403          	ld	s0,16(sp)
    80005cb0:	00813483          	ld	s1,8(sp)
    80005cb4:	00013903          	ld	s2,0(sp)
    80005cb8:	02010113          	addi	sp,sp,32
    80005cbc:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005cc0:	ffffc097          	auipc	ra,0xffffc
    80005cc4:	5b8080e7          	jalr	1464(ra) # 80002278 <_Z15thread_dispatchv>
    80005cc8:	fc1ff06f          	j	80005c88 <_ZL9fibonaccim+0x30>

0000000080005ccc <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005ccc:	fe010113          	addi	sp,sp,-32
    80005cd0:	00113c23          	sd	ra,24(sp)
    80005cd4:	00813823          	sd	s0,16(sp)
    80005cd8:	00913423          	sd	s1,8(sp)
    80005cdc:	01213023          	sd	s2,0(sp)
    80005ce0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005ce4:	00a00493          	li	s1,10
    80005ce8:	0400006f          	j	80005d28 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005cec:	00006517          	auipc	a0,0x6
    80005cf0:	7cc50513          	addi	a0,a0,1996 # 8000c4b8 <CONSOLE_STATUS+0x4a8>
    80005cf4:	00001097          	auipc	ra,0x1
    80005cf8:	728080e7          	jalr	1832(ra) # 8000741c <_Z11printStringPKc>
    80005cfc:	00000613          	li	a2,0
    80005d00:	00a00593          	li	a1,10
    80005d04:	00048513          	mv	a0,s1
    80005d08:	00002097          	auipc	ra,0x2
    80005d0c:	8c4080e7          	jalr	-1852(ra) # 800075cc <_Z8printIntiii>
    80005d10:	00007517          	auipc	a0,0x7
    80005d14:	b5850513          	addi	a0,a0,-1192 # 8000c868 <CONSOLE_STATUS+0x858>
    80005d18:	00001097          	auipc	ra,0x1
    80005d1c:	704080e7          	jalr	1796(ra) # 8000741c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005d20:	0014849b          	addiw	s1,s1,1
    80005d24:	0ff4f493          	andi	s1,s1,255
    80005d28:	00c00793          	li	a5,12
    80005d2c:	fc97f0e3          	bgeu	a5,s1,80005cec <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005d30:	00006517          	auipc	a0,0x6
    80005d34:	79050513          	addi	a0,a0,1936 # 8000c4c0 <CONSOLE_STATUS+0x4b0>
    80005d38:	00001097          	auipc	ra,0x1
    80005d3c:	6e4080e7          	jalr	1764(ra) # 8000741c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005d40:	00500313          	li	t1,5
    thread_dispatch();
    80005d44:	ffffc097          	auipc	ra,0xffffc
    80005d48:	534080e7          	jalr	1332(ra) # 80002278 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005d4c:	01000513          	li	a0,16
    80005d50:	00000097          	auipc	ra,0x0
    80005d54:	f08080e7          	jalr	-248(ra) # 80005c58 <_ZL9fibonaccim>
    80005d58:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005d5c:	00006517          	auipc	a0,0x6
    80005d60:	77450513          	addi	a0,a0,1908 # 8000c4d0 <CONSOLE_STATUS+0x4c0>
    80005d64:	00001097          	auipc	ra,0x1
    80005d68:	6b8080e7          	jalr	1720(ra) # 8000741c <_Z11printStringPKc>
    80005d6c:	00000613          	li	a2,0
    80005d70:	00a00593          	li	a1,10
    80005d74:	0009051b          	sext.w	a0,s2
    80005d78:	00002097          	auipc	ra,0x2
    80005d7c:	854080e7          	jalr	-1964(ra) # 800075cc <_Z8printIntiii>
    80005d80:	00007517          	auipc	a0,0x7
    80005d84:	ae850513          	addi	a0,a0,-1304 # 8000c868 <CONSOLE_STATUS+0x858>
    80005d88:	00001097          	auipc	ra,0x1
    80005d8c:	694080e7          	jalr	1684(ra) # 8000741c <_Z11printStringPKc>
    80005d90:	0400006f          	j	80005dd0 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005d94:	00006517          	auipc	a0,0x6
    80005d98:	72450513          	addi	a0,a0,1828 # 8000c4b8 <CONSOLE_STATUS+0x4a8>
    80005d9c:	00001097          	auipc	ra,0x1
    80005da0:	680080e7          	jalr	1664(ra) # 8000741c <_Z11printStringPKc>
    80005da4:	00000613          	li	a2,0
    80005da8:	00a00593          	li	a1,10
    80005dac:	00048513          	mv	a0,s1
    80005db0:	00002097          	auipc	ra,0x2
    80005db4:	81c080e7          	jalr	-2020(ra) # 800075cc <_Z8printIntiii>
    80005db8:	00007517          	auipc	a0,0x7
    80005dbc:	ab050513          	addi	a0,a0,-1360 # 8000c868 <CONSOLE_STATUS+0x858>
    80005dc0:	00001097          	auipc	ra,0x1
    80005dc4:	65c080e7          	jalr	1628(ra) # 8000741c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005dc8:	0014849b          	addiw	s1,s1,1
    80005dcc:	0ff4f493          	andi	s1,s1,255
    80005dd0:	00f00793          	li	a5,15
    80005dd4:	fc97f0e3          	bgeu	a5,s1,80005d94 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005dd8:	00006517          	auipc	a0,0x6
    80005ddc:	70850513          	addi	a0,a0,1800 # 8000c4e0 <CONSOLE_STATUS+0x4d0>
    80005de0:	00001097          	auipc	ra,0x1
    80005de4:	63c080e7          	jalr	1596(ra) # 8000741c <_Z11printStringPKc>
    finishedD = true;
    80005de8:	00100793          	li	a5,1
    80005dec:	00009717          	auipc	a4,0x9
    80005df0:	5cf70a23          	sb	a5,1492(a4) # 8000f3c0 <_ZL9finishedD>
    thread_dispatch();
    80005df4:	ffffc097          	auipc	ra,0xffffc
    80005df8:	484080e7          	jalr	1156(ra) # 80002278 <_Z15thread_dispatchv>
}
    80005dfc:	01813083          	ld	ra,24(sp)
    80005e00:	01013403          	ld	s0,16(sp)
    80005e04:	00813483          	ld	s1,8(sp)
    80005e08:	00013903          	ld	s2,0(sp)
    80005e0c:	02010113          	addi	sp,sp,32
    80005e10:	00008067          	ret

0000000080005e14 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005e14:	fe010113          	addi	sp,sp,-32
    80005e18:	00113c23          	sd	ra,24(sp)
    80005e1c:	00813823          	sd	s0,16(sp)
    80005e20:	00913423          	sd	s1,8(sp)
    80005e24:	01213023          	sd	s2,0(sp)
    80005e28:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005e2c:	00000493          	li	s1,0
    80005e30:	0400006f          	j	80005e70 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005e34:	00006517          	auipc	a0,0x6
    80005e38:	6bc50513          	addi	a0,a0,1724 # 8000c4f0 <CONSOLE_STATUS+0x4e0>
    80005e3c:	00001097          	auipc	ra,0x1
    80005e40:	5e0080e7          	jalr	1504(ra) # 8000741c <_Z11printStringPKc>
    80005e44:	00000613          	li	a2,0
    80005e48:	00a00593          	li	a1,10
    80005e4c:	00048513          	mv	a0,s1
    80005e50:	00001097          	auipc	ra,0x1
    80005e54:	77c080e7          	jalr	1916(ra) # 800075cc <_Z8printIntiii>
    80005e58:	00007517          	auipc	a0,0x7
    80005e5c:	a1050513          	addi	a0,a0,-1520 # 8000c868 <CONSOLE_STATUS+0x858>
    80005e60:	00001097          	auipc	ra,0x1
    80005e64:	5bc080e7          	jalr	1468(ra) # 8000741c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005e68:	0014849b          	addiw	s1,s1,1
    80005e6c:	0ff4f493          	andi	s1,s1,255
    80005e70:	00200793          	li	a5,2
    80005e74:	fc97f0e3          	bgeu	a5,s1,80005e34 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005e78:	00006517          	auipc	a0,0x6
    80005e7c:	68050513          	addi	a0,a0,1664 # 8000c4f8 <CONSOLE_STATUS+0x4e8>
    80005e80:	00001097          	auipc	ra,0x1
    80005e84:	59c080e7          	jalr	1436(ra) # 8000741c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005e88:	00700313          	li	t1,7
    thread_dispatch();
    80005e8c:	ffffc097          	auipc	ra,0xffffc
    80005e90:	3ec080e7          	jalr	1004(ra) # 80002278 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005e94:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005e98:	00006517          	auipc	a0,0x6
    80005e9c:	67050513          	addi	a0,a0,1648 # 8000c508 <CONSOLE_STATUS+0x4f8>
    80005ea0:	00001097          	auipc	ra,0x1
    80005ea4:	57c080e7          	jalr	1404(ra) # 8000741c <_Z11printStringPKc>
    80005ea8:	00000613          	li	a2,0
    80005eac:	00a00593          	li	a1,10
    80005eb0:	0009051b          	sext.w	a0,s2
    80005eb4:	00001097          	auipc	ra,0x1
    80005eb8:	718080e7          	jalr	1816(ra) # 800075cc <_Z8printIntiii>
    80005ebc:	00007517          	auipc	a0,0x7
    80005ec0:	9ac50513          	addi	a0,a0,-1620 # 8000c868 <CONSOLE_STATUS+0x858>
    80005ec4:	00001097          	auipc	ra,0x1
    80005ec8:	558080e7          	jalr	1368(ra) # 8000741c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005ecc:	00c00513          	li	a0,12
    80005ed0:	00000097          	auipc	ra,0x0
    80005ed4:	d88080e7          	jalr	-632(ra) # 80005c58 <_ZL9fibonaccim>
    80005ed8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005edc:	00006517          	auipc	a0,0x6
    80005ee0:	63450513          	addi	a0,a0,1588 # 8000c510 <CONSOLE_STATUS+0x500>
    80005ee4:	00001097          	auipc	ra,0x1
    80005ee8:	538080e7          	jalr	1336(ra) # 8000741c <_Z11printStringPKc>
    80005eec:	00000613          	li	a2,0
    80005ef0:	00a00593          	li	a1,10
    80005ef4:	0009051b          	sext.w	a0,s2
    80005ef8:	00001097          	auipc	ra,0x1
    80005efc:	6d4080e7          	jalr	1748(ra) # 800075cc <_Z8printIntiii>
    80005f00:	00007517          	auipc	a0,0x7
    80005f04:	96850513          	addi	a0,a0,-1688 # 8000c868 <CONSOLE_STATUS+0x858>
    80005f08:	00001097          	auipc	ra,0x1
    80005f0c:	514080e7          	jalr	1300(ra) # 8000741c <_Z11printStringPKc>
    80005f10:	0400006f          	j	80005f50 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005f14:	00006517          	auipc	a0,0x6
    80005f18:	5dc50513          	addi	a0,a0,1500 # 8000c4f0 <CONSOLE_STATUS+0x4e0>
    80005f1c:	00001097          	auipc	ra,0x1
    80005f20:	500080e7          	jalr	1280(ra) # 8000741c <_Z11printStringPKc>
    80005f24:	00000613          	li	a2,0
    80005f28:	00a00593          	li	a1,10
    80005f2c:	00048513          	mv	a0,s1
    80005f30:	00001097          	auipc	ra,0x1
    80005f34:	69c080e7          	jalr	1692(ra) # 800075cc <_Z8printIntiii>
    80005f38:	00007517          	auipc	a0,0x7
    80005f3c:	93050513          	addi	a0,a0,-1744 # 8000c868 <CONSOLE_STATUS+0x858>
    80005f40:	00001097          	auipc	ra,0x1
    80005f44:	4dc080e7          	jalr	1244(ra) # 8000741c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005f48:	0014849b          	addiw	s1,s1,1
    80005f4c:	0ff4f493          	andi	s1,s1,255
    80005f50:	00500793          	li	a5,5
    80005f54:	fc97f0e3          	bgeu	a5,s1,80005f14 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80005f58:	00006517          	auipc	a0,0x6
    80005f5c:	5c850513          	addi	a0,a0,1480 # 8000c520 <CONSOLE_STATUS+0x510>
    80005f60:	00001097          	auipc	ra,0x1
    80005f64:	4bc080e7          	jalr	1212(ra) # 8000741c <_Z11printStringPKc>
    finishedC = true;
    80005f68:	00100793          	li	a5,1
    80005f6c:	00009717          	auipc	a4,0x9
    80005f70:	44f70aa3          	sb	a5,1109(a4) # 8000f3c1 <_ZL9finishedC>
    thread_dispatch();
    80005f74:	ffffc097          	auipc	ra,0xffffc
    80005f78:	304080e7          	jalr	772(ra) # 80002278 <_Z15thread_dispatchv>
}
    80005f7c:	01813083          	ld	ra,24(sp)
    80005f80:	01013403          	ld	s0,16(sp)
    80005f84:	00813483          	ld	s1,8(sp)
    80005f88:	00013903          	ld	s2,0(sp)
    80005f8c:	02010113          	addi	sp,sp,32
    80005f90:	00008067          	ret

0000000080005f94 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005f94:	fe010113          	addi	sp,sp,-32
    80005f98:	00113c23          	sd	ra,24(sp)
    80005f9c:	00813823          	sd	s0,16(sp)
    80005fa0:	00913423          	sd	s1,8(sp)
    80005fa4:	01213023          	sd	s2,0(sp)
    80005fa8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005fac:	00000913          	li	s2,0
    80005fb0:	03c0006f          	j	80005fec <_ZL11workerBodyBPv+0x58>
            thread_dispatch();
    80005fb4:	ffffc097          	auipc	ra,0xffffc
    80005fb8:	2c4080e7          	jalr	708(ra) # 80002278 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 100; j++) {
    80005fbc:	00148493          	addi	s1,s1,1
    80005fc0:	06300793          	li	a5,99
    80005fc4:	0097ee63          	bltu	a5,s1,80005fe0 <_ZL11workerBodyBPv+0x4c>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005fc8:	00000713          	li	a4,0
    80005fcc:	000077b7          	lui	a5,0x7
    80005fd0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005fd4:	fee7e0e3          	bltu	a5,a4,80005fb4 <_ZL11workerBodyBPv+0x20>
    80005fd8:	00170713          	addi	a4,a4,1
    80005fdc:	ff1ff06f          	j	80005fcc <_ZL11workerBodyBPv+0x38>
        if (i == 10) {
    80005fe0:	00a00793          	li	a5,10
    80005fe4:	04f90663          	beq	s2,a5,80006030 <_ZL11workerBodyBPv+0x9c>
    for (uint64 i = 0; i < 16; i++) {
    80005fe8:	00190913          	addi	s2,s2,1
    80005fec:	00f00793          	li	a5,15
    80005ff0:	0527e463          	bltu	a5,s2,80006038 <_ZL11workerBodyBPv+0xa4>
        printString("B: i="); printInt(i); printString("\n");
    80005ff4:	00006517          	auipc	a0,0x6
    80005ff8:	53c50513          	addi	a0,a0,1340 # 8000c530 <CONSOLE_STATUS+0x520>
    80005ffc:	00001097          	auipc	ra,0x1
    80006000:	420080e7          	jalr	1056(ra) # 8000741c <_Z11printStringPKc>
    80006004:	00000613          	li	a2,0
    80006008:	00a00593          	li	a1,10
    8000600c:	0009051b          	sext.w	a0,s2
    80006010:	00001097          	auipc	ra,0x1
    80006014:	5bc080e7          	jalr	1468(ra) # 800075cc <_Z8printIntiii>
    80006018:	00007517          	auipc	a0,0x7
    8000601c:	85050513          	addi	a0,a0,-1968 # 8000c868 <CONSOLE_STATUS+0x858>
    80006020:	00001097          	auipc	ra,0x1
    80006024:	3fc080e7          	jalr	1020(ra) # 8000741c <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80006028:	00000493          	li	s1,0
    8000602c:	f95ff06f          	j	80005fc0 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006030:	14102ff3          	csrr	t6,sepc
    80006034:	fb5ff06f          	j	80005fe8 <_ZL11workerBodyBPv+0x54>
    printString("B finished!\n");
    80006038:	00006517          	auipc	a0,0x6
    8000603c:	50050513          	addi	a0,a0,1280 # 8000c538 <CONSOLE_STATUS+0x528>
    80006040:	00001097          	auipc	ra,0x1
    80006044:	3dc080e7          	jalr	988(ra) # 8000741c <_Z11printStringPKc>
    finishedB = true;
    80006048:	00100793          	li	a5,1
    8000604c:	00009717          	auipc	a4,0x9
    80006050:	36f70b23          	sb	a5,886(a4) # 8000f3c2 <_ZL9finishedB>
    thread_dispatch();
    80006054:	ffffc097          	auipc	ra,0xffffc
    80006058:	224080e7          	jalr	548(ra) # 80002278 <_Z15thread_dispatchv>
}
    8000605c:	01813083          	ld	ra,24(sp)
    80006060:	01013403          	ld	s0,16(sp)
    80006064:	00813483          	ld	s1,8(sp)
    80006068:	00013903          	ld	s2,0(sp)
    8000606c:	02010113          	addi	sp,sp,32
    80006070:	00008067          	ret

0000000080006074 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006074:	fe010113          	addi	sp,sp,-32
    80006078:	00113c23          	sd	ra,24(sp)
    8000607c:	00813823          	sd	s0,16(sp)
    80006080:	00913423          	sd	s1,8(sp)
    80006084:	01213023          	sd	s2,0(sp)
    80006088:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000608c:	00000913          	li	s2,0
    80006090:	0340006f          	j	800060c4 <_ZL11workerBodyAPv+0x50>
            thread_dispatch();
    80006094:	ffffc097          	auipc	ra,0xffffc
    80006098:	1e4080e7          	jalr	484(ra) # 80002278 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 100; j++) {
    8000609c:	00148493          	addi	s1,s1,1
    800060a0:	06300793          	li	a5,99
    800060a4:	0097ee63          	bltu	a5,s1,800060c0 <_ZL11workerBodyAPv+0x4c>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800060a8:	00000713          	li	a4,0
    800060ac:	000077b7          	lui	a5,0x7
    800060b0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800060b4:	fee7e0e3          	bltu	a5,a4,80006094 <_ZL11workerBodyAPv+0x20>
    800060b8:	00170713          	addi	a4,a4,1
    800060bc:	ff1ff06f          	j	800060ac <_ZL11workerBodyAPv+0x38>
    for (uint64 i = 0; i < 10; i++) {
    800060c0:	00190913          	addi	s2,s2,1
    800060c4:	00900793          	li	a5,9
    800060c8:	0527e063          	bltu	a5,s2,80006108 <_ZL11workerBodyAPv+0x94>
        printString("A: i="); printInt(i); printString("\n");
    800060cc:	00006517          	auipc	a0,0x6
    800060d0:	47c50513          	addi	a0,a0,1148 # 8000c548 <CONSOLE_STATUS+0x538>
    800060d4:	00001097          	auipc	ra,0x1
    800060d8:	348080e7          	jalr	840(ra) # 8000741c <_Z11printStringPKc>
    800060dc:	00000613          	li	a2,0
    800060e0:	00a00593          	li	a1,10
    800060e4:	0009051b          	sext.w	a0,s2
    800060e8:	00001097          	auipc	ra,0x1
    800060ec:	4e4080e7          	jalr	1252(ra) # 800075cc <_Z8printIntiii>
    800060f0:	00006517          	auipc	a0,0x6
    800060f4:	77850513          	addi	a0,a0,1912 # 8000c868 <CONSOLE_STATUS+0x858>
    800060f8:	00001097          	auipc	ra,0x1
    800060fc:	324080e7          	jalr	804(ra) # 8000741c <_Z11printStringPKc>
        for (uint64 j = 0; j < 100; j++) {
    80006100:	00000493          	li	s1,0
    80006104:	f9dff06f          	j	800060a0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006108:	00006517          	auipc	a0,0x6
    8000610c:	44850513          	addi	a0,a0,1096 # 8000c550 <CONSOLE_STATUS+0x540>
    80006110:	00001097          	auipc	ra,0x1
    80006114:	30c080e7          	jalr	780(ra) # 8000741c <_Z11printStringPKc>
    finishedA = true;
    80006118:	00100793          	li	a5,1
    8000611c:	00009717          	auipc	a4,0x9
    80006120:	2af703a3          	sb	a5,679(a4) # 8000f3c3 <_ZL9finishedA>
}
    80006124:	01813083          	ld	ra,24(sp)
    80006128:	01013403          	ld	s0,16(sp)
    8000612c:	00813483          	ld	s1,8(sp)
    80006130:	00013903          	ld	s2,0(sp)
    80006134:	02010113          	addi	sp,sp,32
    80006138:	00008067          	ret

000000008000613c <_Z16System_Mode_testv>:


void System_Mode_test() {
    8000613c:	fd010113          	addi	sp,sp,-48
    80006140:	02113423          	sd	ra,40(sp)
    80006144:	02813023          	sd	s0,32(sp)
    80006148:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000614c:	00000613          	li	a2,0
    80006150:	00000597          	auipc	a1,0x0
    80006154:	f2458593          	addi	a1,a1,-220 # 80006074 <_ZL11workerBodyAPv>
    80006158:	fd040513          	addi	a0,s0,-48
    8000615c:	ffffc097          	auipc	ra,0xffffc
    80006160:	080080e7          	jalr	128(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80006164:	00006517          	auipc	a0,0x6
    80006168:	3fc50513          	addi	a0,a0,1020 # 8000c560 <CONSOLE_STATUS+0x550>
    8000616c:	00001097          	auipc	ra,0x1
    80006170:	2b0080e7          	jalr	688(ra) # 8000741c <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[1], workerBodyB, nullptr);
    80006174:	00000613          	li	a2,0
    80006178:	00000597          	auipc	a1,0x0
    8000617c:	e1c58593          	addi	a1,a1,-484 # 80005f94 <_ZL11workerBodyBPv>
    80006180:	fd840513          	addi	a0,s0,-40
    80006184:	ffffc097          	auipc	ra,0xffffc
    80006188:	058080e7          	jalr	88(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    8000618c:	00006517          	auipc	a0,0x6
    80006190:	3ec50513          	addi	a0,a0,1004 # 8000c578 <CONSOLE_STATUS+0x568>
    80006194:	00001097          	auipc	ra,0x1
    80006198:	288080e7          	jalr	648(ra) # 8000741c <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[2], workerBodyC, nullptr);
    8000619c:	00000613          	li	a2,0
    800061a0:	00000597          	auipc	a1,0x0
    800061a4:	c7458593          	addi	a1,a1,-908 # 80005e14 <_ZL11workerBodyCPv>
    800061a8:	fe040513          	addi	a0,s0,-32
    800061ac:	ffffc097          	auipc	ra,0xffffc
    800061b0:	030080e7          	jalr	48(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    800061b4:	00006517          	auipc	a0,0x6
    800061b8:	3dc50513          	addi	a0,a0,988 # 8000c590 <CONSOLE_STATUS+0x580>
    800061bc:	00001097          	auipc	ra,0x1
    800061c0:	260080e7          	jalr	608(ra) # 8000741c <_Z11printStringPKc>
    // testUser();

    thread_create(&threads[3], workerBodyD, nullptr);
    800061c4:	00000613          	li	a2,0
    800061c8:	00000597          	auipc	a1,0x0
    800061cc:	b0458593          	addi	a1,a1,-1276 # 80005ccc <_ZL11workerBodyDPv>
    800061d0:	fe840513          	addi	a0,s0,-24
    800061d4:	ffffc097          	auipc	ra,0xffffc
    800061d8:	008080e7          	jalr	8(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    800061dc:	00006517          	auipc	a0,0x6
    800061e0:	3cc50513          	addi	a0,a0,972 # 8000c5a8 <CONSOLE_STATUS+0x598>
    800061e4:	00001097          	auipc	ra,0x1
    800061e8:	238080e7          	jalr	568(ra) # 8000741c <_Z11printStringPKc>
    800061ec:	00c0006f          	j	800061f8 <_Z16System_Mode_testv+0xbc>
    // testUser();

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800061f0:	ffffc097          	auipc	ra,0xffffc
    800061f4:	088080e7          	jalr	136(ra) # 80002278 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800061f8:	00009797          	auipc	a5,0x9
    800061fc:	1cb7c783          	lbu	a5,459(a5) # 8000f3c3 <_ZL9finishedA>
    80006200:	fe0788e3          	beqz	a5,800061f0 <_Z16System_Mode_testv+0xb4>
    80006204:	00009797          	auipc	a5,0x9
    80006208:	1be7c783          	lbu	a5,446(a5) # 8000f3c2 <_ZL9finishedB>
    8000620c:	fe0782e3          	beqz	a5,800061f0 <_Z16System_Mode_testv+0xb4>
    80006210:	00009797          	auipc	a5,0x9
    80006214:	1b17c783          	lbu	a5,433(a5) # 8000f3c1 <_ZL9finishedC>
    80006218:	fc078ce3          	beqz	a5,800061f0 <_Z16System_Mode_testv+0xb4>
    8000621c:	00009797          	auipc	a5,0x9
    80006220:	1a47c783          	lbu	a5,420(a5) # 8000f3c0 <_ZL9finishedD>
    80006224:	fc0786e3          	beqz	a5,800061f0 <_Z16System_Mode_testv+0xb4>
    }

}
    80006228:	02813083          	ld	ra,40(sp)
    8000622c:	02013403          	ld	s0,32(sp)
    80006230:	03010113          	addi	sp,sp,48
    80006234:	00008067          	ret

0000000080006238 <_ZL9sleepyRunPv>:

#include "../test_h/printing.h"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006238:	fe010113          	addi	sp,sp,-32
    8000623c:	00113c23          	sd	ra,24(sp)
    80006240:	00813823          	sd	s0,16(sp)
    80006244:	00913423          	sd	s1,8(sp)
    80006248:	01213023          	sd	s2,0(sp)
    8000624c:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006250:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006254:	00600493          	li	s1,6
    while (--i > 0) {
    80006258:	fff4849b          	addiw	s1,s1,-1
    8000625c:	04905a63          	blez	s1,800062b0 <_ZL9sleepyRunPv+0x78>

        printString("Hello ");
    80006260:	00006517          	auipc	a0,0x6
    80006264:	36050513          	addi	a0,a0,864 # 8000c5c0 <CONSOLE_STATUS+0x5b0>
    80006268:	00001097          	auipc	ra,0x1
    8000626c:	1b4080e7          	jalr	436(ra) # 8000741c <_Z11printStringPKc>
        printInt(sleep_time);
    80006270:	00000613          	li	a2,0
    80006274:	00a00593          	li	a1,10
    80006278:	0009051b          	sext.w	a0,s2
    8000627c:	00001097          	auipc	ra,0x1
    80006280:	350080e7          	jalr	848(ra) # 800075cc <_Z8printIntiii>
        printString(" !\n");
    80006284:	00006517          	auipc	a0,0x6
    80006288:	34450513          	addi	a0,a0,836 # 8000c5c8 <CONSOLE_STATUS+0x5b8>
    8000628c:	00001097          	auipc	ra,0x1
    80006290:	190080e7          	jalr	400(ra) # 8000741c <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006294:	00090513          	mv	a0,s2
    80006298:	ffffc097          	auipc	ra,0xffffc
    8000629c:	024080e7          	jalr	36(ra) # 800022bc <_Z10time_sleepm>
        putc('.');
    800062a0:	02e00513          	li	a0,46
    800062a4:	ffffc097          	auipc	ra,0xffffc
    800062a8:	184080e7          	jalr	388(ra) # 80002428 <_Z4putcc>
    while (--i > 0) {
    800062ac:	fadff06f          	j	80006258 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/200-1] = true;
    800062b0:	0c800793          	li	a5,200
    800062b4:	02f95933          	divu	s2,s2,a5
    800062b8:	fff90913          	addi	s2,s2,-1
    800062bc:	00009797          	auipc	a5,0x9
    800062c0:	10c78793          	addi	a5,a5,268 # 8000f3c8 <_ZL8finished>
    800062c4:	01278933          	add	s2,a5,s2
    800062c8:	00100793          	li	a5,1
    800062cc:	00f90023          	sb	a5,0(s2)
}
    800062d0:	01813083          	ld	ra,24(sp)
    800062d4:	01013403          	ld	s0,16(sp)
    800062d8:	00813483          	ld	s1,8(sp)
    800062dc:	00013903          	ld	s2,0(sp)
    800062e0:	02010113          	addi	sp,sp,32
    800062e4:	00008067          	ret

00000000800062e8 <_Z12testSleepingv>:

void testSleeping() {
    800062e8:	fc010113          	addi	sp,sp,-64
    800062ec:	02113c23          	sd	ra,56(sp)
    800062f0:	02813823          	sd	s0,48(sp)
    800062f4:	02913423          	sd	s1,40(sp)
    800062f8:	04010413          	addi	s0,sp,64
    printString("Starting...\n");
    800062fc:	00006517          	auipc	a0,0x6
    80006300:	2d450513          	addi	a0,a0,724 # 8000c5d0 <CONSOLE_STATUS+0x5c0>
    80006304:	00001097          	auipc	ra,0x1
    80006308:	118080e7          	jalr	280(ra) # 8000741c <_Z11printStringPKc>
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {200, 400};
    8000630c:	0c800793          	li	a5,200
    80006310:	fcf43823          	sd	a5,-48(s0)
    80006314:	19000793          	li	a5,400
    80006318:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    printString("Creating threads: ");
    8000631c:	00006517          	auipc	a0,0x6
    80006320:	2c450513          	addi	a0,a0,708 # 8000c5e0 <CONSOLE_STATUS+0x5d0>
    80006324:	00001097          	auipc	ra,0x1
    80006328:	0f8080e7          	jalr	248(ra) # 8000741c <_Z11printStringPKc>
    for (int i = 0; i < sleepy_thread_count; i++) {
    8000632c:	00000493          	li	s1,0
    80006330:	0500006f          	j	80006380 <_Z12testSleepingv+0x98>
        printInt(i);
    80006334:	00000613          	li	a2,0
    80006338:	00a00593          	li	a1,10
    8000633c:	00048513          	mv	a0,s1
    80006340:	00001097          	auipc	ra,0x1
    80006344:	28c080e7          	jalr	652(ra) # 800075cc <_Z8printIntiii>
        printString(" ");
    80006348:	00006517          	auipc	a0,0x6
    8000634c:	2b050513          	addi	a0,a0,688 # 8000c5f8 <CONSOLE_STATUS+0x5e8>
    80006350:	00001097          	auipc	ra,0x1
    80006354:	0cc080e7          	jalr	204(ra) # 8000741c <_Z11printStringPKc>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006358:	00349793          	slli	a5,s1,0x3
    8000635c:	fd040613          	addi	a2,s0,-48
    80006360:	00f60633          	add	a2,a2,a5
    80006364:	00000597          	auipc	a1,0x0
    80006368:	ed458593          	addi	a1,a1,-300 # 80006238 <_ZL9sleepyRunPv>
    8000636c:	fc040513          	addi	a0,s0,-64
    80006370:	00f50533          	add	a0,a0,a5
    80006374:	ffffc097          	auipc	ra,0xffffc
    80006378:	e68080e7          	jalr	-408(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    8000637c:	0014849b          	addiw	s1,s1,1
    80006380:	00100793          	li	a5,1
    80006384:	fa97d8e3          	bge	a5,s1,80006334 <_Z12testSleepingv+0x4c>
    }
    printString("\nSuccesfully created all threads, now waiting for them to end\n");
    80006388:	00006517          	auipc	a0,0x6
    8000638c:	27850513          	addi	a0,a0,632 # 8000c600 <CONSOLE_STATUS+0x5f0>
    80006390:	00001097          	auipc	ra,0x1
    80006394:	08c080e7          	jalr	140(ra) # 8000741c <_Z11printStringPKc>
    80006398:	00c0006f          	j	800063a4 <_Z12testSleepingv+0xbc>
    while (!(finished[0] && finished[1])) {thread_dispatch();}
    8000639c:	ffffc097          	auipc	ra,0xffffc
    800063a0:	edc080e7          	jalr	-292(ra) # 80002278 <_Z15thread_dispatchv>
    800063a4:	00009797          	auipc	a5,0x9
    800063a8:	0247c783          	lbu	a5,36(a5) # 8000f3c8 <_ZL8finished>
    800063ac:	fe0788e3          	beqz	a5,8000639c <_Z12testSleepingv+0xb4>
    800063b0:	00009797          	auipc	a5,0x9
    800063b4:	0197c783          	lbu	a5,25(a5) # 8000f3c9 <_ZL8finished+0x1>
    800063b8:	fe0782e3          	beqz	a5,8000639c <_Z12testSleepingv+0xb4>
}
    800063bc:	03813083          	ld	ra,56(sp)
    800063c0:	03013403          	ld	s0,48(sp)
    800063c4:	02813483          	ld	s1,40(sp)
    800063c8:	04010113          	addi	sp,sp,64
    800063cc:	00008067          	ret

00000000800063d0 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800063d0:	fe010113          	addi	sp,sp,-32
    800063d4:	00113c23          	sd	ra,24(sp)
    800063d8:	00813823          	sd	s0,16(sp)
    800063dc:	00913423          	sd	s1,8(sp)
    800063e0:	01213023          	sd	s2,0(sp)
    800063e4:	02010413          	addi	s0,sp,32
    800063e8:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800063ec:	00000913          	li	s2,0
    800063f0:	00c0006f          	j	800063fc <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800063f4:	ffffc097          	auipc	ra,0xffffc
    800063f8:	e84080e7          	jalr	-380(ra) # 80002278 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    800063fc:	ffffc097          	auipc	ra,0xffffc
    80006400:	004080e7          	jalr	4(ra) # 80002400 <_Z4getcv>
    80006404:	0005059b          	sext.w	a1,a0
    80006408:	01b00793          	li	a5,27
    8000640c:	02f58a63          	beq	a1,a5,80006440 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80006410:	0084b503          	ld	a0,8(s1)
    80006414:	00001097          	auipc	ra,0x1
    80006418:	374080e7          	jalr	884(ra) # 80007788 <_ZN6Buffer3putEi>
        i++;
    8000641c:	0019071b          	addiw	a4,s2,1
    80006420:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80006424:	0004a683          	lw	a3,0(s1)
    80006428:	0026979b          	slliw	a5,a3,0x2
    8000642c:	00d787bb          	addw	a5,a5,a3
    80006430:	0017979b          	slliw	a5,a5,0x1
    80006434:	02f767bb          	remw	a5,a4,a5
    80006438:	fc0792e3          	bnez	a5,800063fc <_ZL16producerKeyboardPv+0x2c>
    8000643c:	fb9ff06f          	j	800063f4 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80006440:	00100793          	li	a5,1
    80006444:	00009717          	auipc	a4,0x9
    80006448:	f8f72623          	sw	a5,-116(a4) # 8000f3d0 <_ZL9threadEnd>
    data->buffer->put('!');
    8000644c:	02100593          	li	a1,33
    80006450:	0084b503          	ld	a0,8(s1)
    80006454:	00001097          	auipc	ra,0x1
    80006458:	334080e7          	jalr	820(ra) # 80007788 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    8000645c:	0104b503          	ld	a0,16(s1)
    80006460:	ffffc097          	auipc	ra,0xffffc
    80006464:	f18080e7          	jalr	-232(ra) # 80002378 <_Z10sem_signalP4_sem>
}
    80006468:	01813083          	ld	ra,24(sp)
    8000646c:	01013403          	ld	s0,16(sp)
    80006470:	00813483          	ld	s1,8(sp)
    80006474:	00013903          	ld	s2,0(sp)
    80006478:	02010113          	addi	sp,sp,32
    8000647c:	00008067          	ret

0000000080006480 <_ZL8producerPv>:

static void producer(void *arg) {
    80006480:	fe010113          	addi	sp,sp,-32
    80006484:	00113c23          	sd	ra,24(sp)
    80006488:	00813823          	sd	s0,16(sp)
    8000648c:	00913423          	sd	s1,8(sp)
    80006490:	01213023          	sd	s2,0(sp)
    80006494:	02010413          	addi	s0,sp,32
    80006498:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000649c:	00000913          	li	s2,0
    800064a0:	00c0006f          	j	800064ac <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800064a4:	ffffc097          	auipc	ra,0xffffc
    800064a8:	dd4080e7          	jalr	-556(ra) # 80002278 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800064ac:	00009797          	auipc	a5,0x9
    800064b0:	f247a783          	lw	a5,-220(a5) # 8000f3d0 <_ZL9threadEnd>
    800064b4:	02079e63          	bnez	a5,800064f0 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800064b8:	0004a583          	lw	a1,0(s1)
    800064bc:	0305859b          	addiw	a1,a1,48
    800064c0:	0084b503          	ld	a0,8(s1)
    800064c4:	00001097          	auipc	ra,0x1
    800064c8:	2c4080e7          	jalr	708(ra) # 80007788 <_ZN6Buffer3putEi>
        i++;
    800064cc:	0019071b          	addiw	a4,s2,1
    800064d0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800064d4:	0004a683          	lw	a3,0(s1)
    800064d8:	0026979b          	slliw	a5,a3,0x2
    800064dc:	00d787bb          	addw	a5,a5,a3
    800064e0:	0017979b          	slliw	a5,a5,0x1
    800064e4:	02f767bb          	remw	a5,a4,a5
    800064e8:	fc0792e3          	bnez	a5,800064ac <_ZL8producerPv+0x2c>
    800064ec:	fb9ff06f          	j	800064a4 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    800064f0:	0104b503          	ld	a0,16(s1)
    800064f4:	ffffc097          	auipc	ra,0xffffc
    800064f8:	e84080e7          	jalr	-380(ra) # 80002378 <_Z10sem_signalP4_sem>
}
    800064fc:	01813083          	ld	ra,24(sp)
    80006500:	01013403          	ld	s0,16(sp)
    80006504:	00813483          	ld	s1,8(sp)
    80006508:	00013903          	ld	s2,0(sp)
    8000650c:	02010113          	addi	sp,sp,32
    80006510:	00008067          	ret

0000000080006514 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80006514:	fd010113          	addi	sp,sp,-48
    80006518:	02113423          	sd	ra,40(sp)
    8000651c:	02813023          	sd	s0,32(sp)
    80006520:	00913c23          	sd	s1,24(sp)
    80006524:	01213823          	sd	s2,16(sp)
    80006528:	01313423          	sd	s3,8(sp)
    8000652c:	03010413          	addi	s0,sp,48
    80006530:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80006534:	00000993          	li	s3,0
    80006538:	01c0006f          	j	80006554 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    8000653c:	ffffc097          	auipc	ra,0xffffc
    80006540:	d3c080e7          	jalr	-708(ra) # 80002278 <_Z15thread_dispatchv>
    80006544:	0500006f          	j	80006594 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80006548:	00a00513          	li	a0,10
    8000654c:	ffffc097          	auipc	ra,0xffffc
    80006550:	edc080e7          	jalr	-292(ra) # 80002428 <_Z4putcc>
    while (!threadEnd) {
    80006554:	00009797          	auipc	a5,0x9
    80006558:	e7c7a783          	lw	a5,-388(a5) # 8000f3d0 <_ZL9threadEnd>
    8000655c:	06079063          	bnez	a5,800065bc <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80006560:	00893503          	ld	a0,8(s2)
    80006564:	00001097          	auipc	ra,0x1
    80006568:	2b4080e7          	jalr	692(ra) # 80007818 <_ZN6Buffer3getEv>
        i++;
    8000656c:	0019849b          	addiw	s1,s3,1
    80006570:	0004899b          	sext.w	s3,s1
        putc(key);
    80006574:	0ff57513          	andi	a0,a0,255
    80006578:	ffffc097          	auipc	ra,0xffffc
    8000657c:	eb0080e7          	jalr	-336(ra) # 80002428 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80006580:	00092703          	lw	a4,0(s2)
    80006584:	0027179b          	slliw	a5,a4,0x2
    80006588:	00e787bb          	addw	a5,a5,a4
    8000658c:	02f4e7bb          	remw	a5,s1,a5
    80006590:	fa0786e3          	beqz	a5,8000653c <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80006594:	05000793          	li	a5,80
    80006598:	02f4e4bb          	remw	s1,s1,a5
    8000659c:	fa049ce3          	bnez	s1,80006554 <_ZL8consumerPv+0x40>
    800065a0:	fa9ff06f          	j	80006548 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800065a4:	00893503          	ld	a0,8(s2)
    800065a8:	00001097          	auipc	ra,0x1
    800065ac:	270080e7          	jalr	624(ra) # 80007818 <_ZN6Buffer3getEv>
        putc(key);
    800065b0:	0ff57513          	andi	a0,a0,255
    800065b4:	ffffc097          	auipc	ra,0xffffc
    800065b8:	e74080e7          	jalr	-396(ra) # 80002428 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    800065bc:	00893503          	ld	a0,8(s2)
    800065c0:	00001097          	auipc	ra,0x1
    800065c4:	2e4080e7          	jalr	740(ra) # 800078a4 <_ZN6Buffer6getCntEv>
    800065c8:	fca04ee3          	bgtz	a0,800065a4 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    800065cc:	01093503          	ld	a0,16(s2)
    800065d0:	ffffc097          	auipc	ra,0xffffc
    800065d4:	da8080e7          	jalr	-600(ra) # 80002378 <_Z10sem_signalP4_sem>
}
    800065d8:	02813083          	ld	ra,40(sp)
    800065dc:	02013403          	ld	s0,32(sp)
    800065e0:	01813483          	ld	s1,24(sp)
    800065e4:	01013903          	ld	s2,16(sp)
    800065e8:	00813983          	ld	s3,8(sp)
    800065ec:	03010113          	addi	sp,sp,48
    800065f0:	00008067          	ret

00000000800065f4 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800065f4:	f9010113          	addi	sp,sp,-112
    800065f8:	06113423          	sd	ra,104(sp)
    800065fc:	06813023          	sd	s0,96(sp)
    80006600:	04913c23          	sd	s1,88(sp)
    80006604:	05213823          	sd	s2,80(sp)
    80006608:	05313423          	sd	s3,72(sp)
    8000660c:	05413023          	sd	s4,64(sp)
    80006610:	03513c23          	sd	s5,56(sp)
    80006614:	03613823          	sd	s6,48(sp)
    80006618:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    8000661c:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80006620:	00006517          	auipc	a0,0x6
    80006624:	02050513          	addi	a0,a0,32 # 8000c640 <CONSOLE_STATUS+0x630>
    80006628:	00001097          	auipc	ra,0x1
    8000662c:	df4080e7          	jalr	-524(ra) # 8000741c <_Z11printStringPKc>
    getString(input, 30);
    80006630:	01e00593          	li	a1,30
    80006634:	fa040493          	addi	s1,s0,-96
    80006638:	00048513          	mv	a0,s1
    8000663c:	00001097          	auipc	ra,0x1
    80006640:	e68080e7          	jalr	-408(ra) # 800074a4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80006644:	00048513          	mv	a0,s1
    80006648:	00001097          	auipc	ra,0x1
    8000664c:	f34080e7          	jalr	-204(ra) # 8000757c <_Z11stringToIntPKc>
    80006650:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80006654:	00006517          	auipc	a0,0x6
    80006658:	00c50513          	addi	a0,a0,12 # 8000c660 <CONSOLE_STATUS+0x650>
    8000665c:	00001097          	auipc	ra,0x1
    80006660:	dc0080e7          	jalr	-576(ra) # 8000741c <_Z11printStringPKc>
    getString(input, 30);
    80006664:	01e00593          	li	a1,30
    80006668:	00048513          	mv	a0,s1
    8000666c:	00001097          	auipc	ra,0x1
    80006670:	e38080e7          	jalr	-456(ra) # 800074a4 <_Z9getStringPci>
    n = stringToInt(input);
    80006674:	00048513          	mv	a0,s1
    80006678:	00001097          	auipc	ra,0x1
    8000667c:	f04080e7          	jalr	-252(ra) # 8000757c <_Z11stringToIntPKc>
    80006680:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80006684:	00006517          	auipc	a0,0x6
    80006688:	ffc50513          	addi	a0,a0,-4 # 8000c680 <CONSOLE_STATUS+0x670>
    8000668c:	00001097          	auipc	ra,0x1
    80006690:	d90080e7          	jalr	-624(ra) # 8000741c <_Z11printStringPKc>
    80006694:	00000613          	li	a2,0
    80006698:	00a00593          	li	a1,10
    8000669c:	00090513          	mv	a0,s2
    800066a0:	00001097          	auipc	ra,0x1
    800066a4:	f2c080e7          	jalr	-212(ra) # 800075cc <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800066a8:	00006517          	auipc	a0,0x6
    800066ac:	ff050513          	addi	a0,a0,-16 # 8000c698 <CONSOLE_STATUS+0x688>
    800066b0:	00001097          	auipc	ra,0x1
    800066b4:	d6c080e7          	jalr	-660(ra) # 8000741c <_Z11printStringPKc>
    800066b8:	00000613          	li	a2,0
    800066bc:	00a00593          	li	a1,10
    800066c0:	00048513          	mv	a0,s1
    800066c4:	00001097          	auipc	ra,0x1
    800066c8:	f08080e7          	jalr	-248(ra) # 800075cc <_Z8printIntiii>
    printString(".\n");
    800066cc:	00006517          	auipc	a0,0x6
    800066d0:	fe450513          	addi	a0,a0,-28 # 8000c6b0 <CONSOLE_STATUS+0x6a0>
    800066d4:	00001097          	auipc	ra,0x1
    800066d8:	d48080e7          	jalr	-696(ra) # 8000741c <_Z11printStringPKc>
    if(threadNum > n) {
    800066dc:	0324c463          	blt	s1,s2,80006704 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    800066e0:	03205c63          	blez	s2,80006718 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    800066e4:	03800513          	li	a0,56
    800066e8:	ffffb097          	auipc	ra,0xffffb
    800066ec:	bb8080e7          	jalr	-1096(ra) # 800012a0 <_Znwm>
    800066f0:	00050a13          	mv	s4,a0
    800066f4:	00048593          	mv	a1,s1
    800066f8:	00001097          	auipc	ra,0x1
    800066fc:	ff4080e7          	jalr	-12(ra) # 800076ec <_ZN6BufferC1Ei>
    80006700:	0300006f          	j	80006730 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80006704:	00006517          	auipc	a0,0x6
    80006708:	fb450513          	addi	a0,a0,-76 # 8000c6b8 <CONSOLE_STATUS+0x6a8>
    8000670c:	00001097          	auipc	ra,0x1
    80006710:	d10080e7          	jalr	-752(ra) # 8000741c <_Z11printStringPKc>
        return;
    80006714:	0140006f          	j	80006728 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80006718:	00006517          	auipc	a0,0x6
    8000671c:	fe050513          	addi	a0,a0,-32 # 8000c6f8 <CONSOLE_STATUS+0x6e8>
    80006720:	00001097          	auipc	ra,0x1
    80006724:	cfc080e7          	jalr	-772(ra) # 8000741c <_Z11printStringPKc>
        return;
    80006728:	000b0113          	mv	sp,s6
    8000672c:	1500006f          	j	8000687c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80006730:	00000593          	li	a1,0
    80006734:	00009517          	auipc	a0,0x9
    80006738:	ca450513          	addi	a0,a0,-860 # 8000f3d8 <_ZL10waitForAll>
    8000673c:	ffffc097          	auipc	ra,0xffffc
    80006740:	bac080e7          	jalr	-1108(ra) # 800022e8 <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    80006744:	00391793          	slli	a5,s2,0x3
    80006748:	00f78793          	addi	a5,a5,15
    8000674c:	ff07f793          	andi	a5,a5,-16
    80006750:	40f10133          	sub	sp,sp,a5
    80006754:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80006758:	0019071b          	addiw	a4,s2,1
    8000675c:	00171793          	slli	a5,a4,0x1
    80006760:	00e787b3          	add	a5,a5,a4
    80006764:	00379793          	slli	a5,a5,0x3
    80006768:	00f78793          	addi	a5,a5,15
    8000676c:	ff07f793          	andi	a5,a5,-16
    80006770:	40f10133          	sub	sp,sp,a5
    80006774:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80006778:	00191613          	slli	a2,s2,0x1
    8000677c:	012607b3          	add	a5,a2,s2
    80006780:	00379793          	slli	a5,a5,0x3
    80006784:	00f987b3          	add	a5,s3,a5
    80006788:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    8000678c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80006790:	00009717          	auipc	a4,0x9
    80006794:	c4873703          	ld	a4,-952(a4) # 8000f3d8 <_ZL10waitForAll>
    80006798:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    8000679c:	00078613          	mv	a2,a5
    800067a0:	00000597          	auipc	a1,0x0
    800067a4:	d7458593          	addi	a1,a1,-652 # 80006514 <_ZL8consumerPv>
    800067a8:	f9840513          	addi	a0,s0,-104
    800067ac:	ffffc097          	auipc	ra,0xffffc
    800067b0:	a30080e7          	jalr	-1488(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800067b4:	00000493          	li	s1,0
    800067b8:	0280006f          	j	800067e0 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800067bc:	00000597          	auipc	a1,0x0
    800067c0:	c1458593          	addi	a1,a1,-1004 # 800063d0 <_ZL16producerKeyboardPv>
                      data + i);
    800067c4:	00179613          	slli	a2,a5,0x1
    800067c8:	00f60633          	add	a2,a2,a5
    800067cc:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800067d0:	00c98633          	add	a2,s3,a2
    800067d4:	ffffc097          	auipc	ra,0xffffc
    800067d8:	a08080e7          	jalr	-1528(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800067dc:	0014849b          	addiw	s1,s1,1
    800067e0:	0524d263          	bge	s1,s2,80006824 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800067e4:	00149793          	slli	a5,s1,0x1
    800067e8:	009787b3          	add	a5,a5,s1
    800067ec:	00379793          	slli	a5,a5,0x3
    800067f0:	00f987b3          	add	a5,s3,a5
    800067f4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800067f8:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    800067fc:	00009717          	auipc	a4,0x9
    80006800:	bdc73703          	ld	a4,-1060(a4) # 8000f3d8 <_ZL10waitForAll>
    80006804:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80006808:	00048793          	mv	a5,s1
    8000680c:	00349513          	slli	a0,s1,0x3
    80006810:	00aa8533          	add	a0,s5,a0
    80006814:	fa9054e3          	blez	s1,800067bc <_Z22producerConsumer_C_APIv+0x1c8>
    80006818:	00000597          	auipc	a1,0x0
    8000681c:	c6858593          	addi	a1,a1,-920 # 80006480 <_ZL8producerPv>
    80006820:	fa5ff06f          	j	800067c4 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80006824:	ffffc097          	auipc	ra,0xffffc
    80006828:	a54080e7          	jalr	-1452(ra) # 80002278 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    8000682c:	00000493          	li	s1,0
    80006830:	00994e63          	blt	s2,s1,8000684c <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80006834:	00009517          	auipc	a0,0x9
    80006838:	ba453503          	ld	a0,-1116(a0) # 8000f3d8 <_ZL10waitForAll>
    8000683c:	ffffc097          	auipc	ra,0xffffc
    80006840:	b10080e7          	jalr	-1264(ra) # 8000234c <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80006844:	0014849b          	addiw	s1,s1,1
    80006848:	fe9ff06f          	j	80006830 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    8000684c:	00009517          	auipc	a0,0x9
    80006850:	b8c53503          	ld	a0,-1140(a0) # 8000f3d8 <_ZL10waitForAll>
    80006854:	ffffc097          	auipc	ra,0xffffc
    80006858:	acc080e7          	jalr	-1332(ra) # 80002320 <_Z9sem_closeP4_sem>
    delete buffer;
    8000685c:	000a0e63          	beqz	s4,80006878 <_Z22producerConsumer_C_APIv+0x284>
    80006860:	000a0513          	mv	a0,s4
    80006864:	00001097          	auipc	ra,0x1
    80006868:	0c8080e7          	jalr	200(ra) # 8000792c <_ZN6BufferD1Ev>
    8000686c:	000a0513          	mv	a0,s4
    80006870:	ffffb097          	auipc	ra,0xffffb
    80006874:	a58080e7          	jalr	-1448(ra) # 800012c8 <_ZdlPv>
    80006878:	000b0113          	mv	sp,s6
}
    8000687c:	f9040113          	addi	sp,s0,-112
    80006880:	06813083          	ld	ra,104(sp)
    80006884:	06013403          	ld	s0,96(sp)
    80006888:	05813483          	ld	s1,88(sp)
    8000688c:	05013903          	ld	s2,80(sp)
    80006890:	04813983          	ld	s3,72(sp)
    80006894:	04013a03          	ld	s4,64(sp)
    80006898:	03813a83          	ld	s5,56(sp)
    8000689c:	03013b03          	ld	s6,48(sp)
    800068a0:	07010113          	addi	sp,sp,112
    800068a4:	00008067          	ret
    800068a8:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800068ac:	000a0513          	mv	a0,s4
    800068b0:	ffffb097          	auipc	ra,0xffffb
    800068b4:	a18080e7          	jalr	-1512(ra) # 800012c8 <_ZdlPv>
    800068b8:	00048513          	mv	a0,s1
    800068bc:	0000a097          	auipc	ra,0xa
    800068c0:	c2c080e7          	jalr	-980(ra) # 800104e8 <_Unwind_Resume>

00000000800068c4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800068c4:	fe010113          	addi	sp,sp,-32
    800068c8:	00113c23          	sd	ra,24(sp)
    800068cc:	00813823          	sd	s0,16(sp)
    800068d0:	00913423          	sd	s1,8(sp)
    800068d4:	01213023          	sd	s2,0(sp)
    800068d8:	02010413          	addi	s0,sp,32
    800068dc:	00050493          	mv	s1,a0
    // putc('F');
    // putc('-');
    // putc('0' + n / 10);
    // putc('0' + n % 10);
    // putc('\n');
    if (n == 0 || n == 1) { return n; }
    800068e0:	00100793          	li	a5,1
    800068e4:	02a7f863          	bgeu	a5,a0,80006914 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800068e8:	00a00793          	li	a5,10
    800068ec:	02f577b3          	remu	a5,a0,a5
    800068f0:	02078e63          	beqz	a5,8000692c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800068f4:	fff48513          	addi	a0,s1,-1
    800068f8:	00000097          	auipc	ra,0x0
    800068fc:	fcc080e7          	jalr	-52(ra) # 800068c4 <_ZL9fibonaccim>
    80006900:	00050913          	mv	s2,a0
    80006904:	ffe48513          	addi	a0,s1,-2
    80006908:	00000097          	auipc	ra,0x0
    8000690c:	fbc080e7          	jalr	-68(ra) # 800068c4 <_ZL9fibonaccim>
    80006910:	00a90533          	add	a0,s2,a0
}
    80006914:	01813083          	ld	ra,24(sp)
    80006918:	01013403          	ld	s0,16(sp)
    8000691c:	00813483          	ld	s1,8(sp)
    80006920:	00013903          	ld	s2,0(sp)
    80006924:	02010113          	addi	sp,sp,32
    80006928:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000692c:	ffffc097          	auipc	ra,0xffffc
    80006930:	94c080e7          	jalr	-1716(ra) # 80002278 <_Z15thread_dispatchv>
    80006934:	fc1ff06f          	j	800068f4 <_ZL9fibonaccim+0x30>

0000000080006938 <_ZL11workerBodyDPv>:
    printString("C finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006938:	fe010113          	addi	sp,sp,-32
    8000693c:	00113c23          	sd	ra,24(sp)
    80006940:	00813823          	sd	s0,16(sp)
    80006944:	00913423          	sd	s1,8(sp)
    80006948:	01213023          	sd	s2,0(sp)
    8000694c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006950:	00a00493          	li	s1,10
    80006954:	0400006f          	j	80006994 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006958:	00006517          	auipc	a0,0x6
    8000695c:	b6050513          	addi	a0,a0,-1184 # 8000c4b8 <CONSOLE_STATUS+0x4a8>
    80006960:	00001097          	auipc	ra,0x1
    80006964:	abc080e7          	jalr	-1348(ra) # 8000741c <_Z11printStringPKc>
    80006968:	00000613          	li	a2,0
    8000696c:	00a00593          	li	a1,10
    80006970:	00048513          	mv	a0,s1
    80006974:	00001097          	auipc	ra,0x1
    80006978:	c58080e7          	jalr	-936(ra) # 800075cc <_Z8printIntiii>
    8000697c:	00006517          	auipc	a0,0x6
    80006980:	eec50513          	addi	a0,a0,-276 # 8000c868 <CONSOLE_STATUS+0x858>
    80006984:	00001097          	auipc	ra,0x1
    80006988:	a98080e7          	jalr	-1384(ra) # 8000741c <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000698c:	0014849b          	addiw	s1,s1,1
    80006990:	0ff4f493          	andi	s1,s1,255
    80006994:	00c00793          	li	a5,12
    80006998:	fc97f0e3          	bgeu	a5,s1,80006958 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000699c:	00006517          	auipc	a0,0x6
    800069a0:	b2450513          	addi	a0,a0,-1244 # 8000c4c0 <CONSOLE_STATUS+0x4b0>
    800069a4:	00001097          	auipc	ra,0x1
    800069a8:	a78080e7          	jalr	-1416(ra) # 8000741c <_Z11printStringPKc>
    __asm__ volatile("li t1, 5");
    800069ac:	00500313          	li	t1,5
    thread_dispatch();
    800069b0:	ffffc097          	auipc	ra,0xffffc
    800069b4:	8c8080e7          	jalr	-1848(ra) # 80002278 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800069b8:	01000513          	li	a0,16
    800069bc:	00000097          	auipc	ra,0x0
    800069c0:	f08080e7          	jalr	-248(ra) # 800068c4 <_ZL9fibonaccim>
    800069c4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800069c8:	00006517          	auipc	a0,0x6
    800069cc:	b0850513          	addi	a0,a0,-1272 # 8000c4d0 <CONSOLE_STATUS+0x4c0>
    800069d0:	00001097          	auipc	ra,0x1
    800069d4:	a4c080e7          	jalr	-1460(ra) # 8000741c <_Z11printStringPKc>
    800069d8:	00000613          	li	a2,0
    800069dc:	00a00593          	li	a1,10
    800069e0:	0009051b          	sext.w	a0,s2
    800069e4:	00001097          	auipc	ra,0x1
    800069e8:	be8080e7          	jalr	-1048(ra) # 800075cc <_Z8printIntiii>
    800069ec:	00006517          	auipc	a0,0x6
    800069f0:	e7c50513          	addi	a0,a0,-388 # 8000c868 <CONSOLE_STATUS+0x858>
    800069f4:	00001097          	auipc	ra,0x1
    800069f8:	a28080e7          	jalr	-1496(ra) # 8000741c <_Z11printStringPKc>
    800069fc:	0400006f          	j	80006a3c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006a00:	00006517          	auipc	a0,0x6
    80006a04:	ab850513          	addi	a0,a0,-1352 # 8000c4b8 <CONSOLE_STATUS+0x4a8>
    80006a08:	00001097          	auipc	ra,0x1
    80006a0c:	a14080e7          	jalr	-1516(ra) # 8000741c <_Z11printStringPKc>
    80006a10:	00000613          	li	a2,0
    80006a14:	00a00593          	li	a1,10
    80006a18:	00048513          	mv	a0,s1
    80006a1c:	00001097          	auipc	ra,0x1
    80006a20:	bb0080e7          	jalr	-1104(ra) # 800075cc <_Z8printIntiii>
    80006a24:	00006517          	auipc	a0,0x6
    80006a28:	e4450513          	addi	a0,a0,-444 # 8000c868 <CONSOLE_STATUS+0x858>
    80006a2c:	00001097          	auipc	ra,0x1
    80006a30:	9f0080e7          	jalr	-1552(ra) # 8000741c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006a34:	0014849b          	addiw	s1,s1,1
    80006a38:	0ff4f493          	andi	s1,s1,255
    80006a3c:	00f00793          	li	a5,15
    80006a40:	fc97f0e3          	bgeu	a5,s1,80006a00 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006a44:	00006517          	auipc	a0,0x6
    80006a48:	a9c50513          	addi	a0,a0,-1380 # 8000c4e0 <CONSOLE_STATUS+0x4d0>
    80006a4c:	00001097          	auipc	ra,0x1
    80006a50:	9d0080e7          	jalr	-1584(ra) # 8000741c <_Z11printStringPKc>
    finishedD = true;
    80006a54:	00100793          	li	a5,1
    80006a58:	00009717          	auipc	a4,0x9
    80006a5c:	98f70423          	sb	a5,-1656(a4) # 8000f3e0 <_ZL9finishedD>
    thread_dispatch();
    80006a60:	ffffc097          	auipc	ra,0xffffc
    80006a64:	818080e7          	jalr	-2024(ra) # 80002278 <_Z15thread_dispatchv>
}
    80006a68:	01813083          	ld	ra,24(sp)
    80006a6c:	01013403          	ld	s0,16(sp)
    80006a70:	00813483          	ld	s1,8(sp)
    80006a74:	00013903          	ld	s2,0(sp)
    80006a78:	02010113          	addi	sp,sp,32
    80006a7c:	00008067          	ret

0000000080006a80 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006a80:	fe010113          	addi	sp,sp,-32
    80006a84:	00113c23          	sd	ra,24(sp)
    80006a88:	00813823          	sd	s0,16(sp)
    80006a8c:	00913423          	sd	s1,8(sp)
    80006a90:	01213023          	sd	s2,0(sp)
    80006a94:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006a98:	00000493          	li	s1,0
    80006a9c:	0400006f          	j	80006adc <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006aa0:	00006517          	auipc	a0,0x6
    80006aa4:	a5050513          	addi	a0,a0,-1456 # 8000c4f0 <CONSOLE_STATUS+0x4e0>
    80006aa8:	00001097          	auipc	ra,0x1
    80006aac:	974080e7          	jalr	-1676(ra) # 8000741c <_Z11printStringPKc>
    80006ab0:	00000613          	li	a2,0
    80006ab4:	00a00593          	li	a1,10
    80006ab8:	00048513          	mv	a0,s1
    80006abc:	00001097          	auipc	ra,0x1
    80006ac0:	b10080e7          	jalr	-1264(ra) # 800075cc <_Z8printIntiii>
    80006ac4:	00006517          	auipc	a0,0x6
    80006ac8:	da450513          	addi	a0,a0,-604 # 8000c868 <CONSOLE_STATUS+0x858>
    80006acc:	00001097          	auipc	ra,0x1
    80006ad0:	950080e7          	jalr	-1712(ra) # 8000741c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006ad4:	0014849b          	addiw	s1,s1,1
    80006ad8:	0ff4f493          	andi	s1,s1,255
    80006adc:	00200793          	li	a5,2
    80006ae0:	fc97f0e3          	bgeu	a5,s1,80006aa0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006ae4:	00006517          	auipc	a0,0x6
    80006ae8:	a1450513          	addi	a0,a0,-1516 # 8000c4f8 <CONSOLE_STATUS+0x4e8>
    80006aec:	00001097          	auipc	ra,0x1
    80006af0:	930080e7          	jalr	-1744(ra) # 8000741c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006af4:	00700313          	li	t1,7
    thread_dispatch();
    80006af8:	ffffb097          	auipc	ra,0xffffb
    80006afc:	780080e7          	jalr	1920(ra) # 80002278 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006b00:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006b04:	00006517          	auipc	a0,0x6
    80006b08:	a0450513          	addi	a0,a0,-1532 # 8000c508 <CONSOLE_STATUS+0x4f8>
    80006b0c:	00001097          	auipc	ra,0x1
    80006b10:	910080e7          	jalr	-1776(ra) # 8000741c <_Z11printStringPKc>
    80006b14:	00000613          	li	a2,0
    80006b18:	00a00593          	li	a1,10
    80006b1c:	0009051b          	sext.w	a0,s2
    80006b20:	00001097          	auipc	ra,0x1
    80006b24:	aac080e7          	jalr	-1364(ra) # 800075cc <_Z8printIntiii>
    80006b28:	00006517          	auipc	a0,0x6
    80006b2c:	d4050513          	addi	a0,a0,-704 # 8000c868 <CONSOLE_STATUS+0x858>
    80006b30:	00001097          	auipc	ra,0x1
    80006b34:	8ec080e7          	jalr	-1812(ra) # 8000741c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006b38:	00c00513          	li	a0,12
    80006b3c:	00000097          	auipc	ra,0x0
    80006b40:	d88080e7          	jalr	-632(ra) # 800068c4 <_ZL9fibonaccim>
    80006b44:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006b48:	00006517          	auipc	a0,0x6
    80006b4c:	9c850513          	addi	a0,a0,-1592 # 8000c510 <CONSOLE_STATUS+0x500>
    80006b50:	00001097          	auipc	ra,0x1
    80006b54:	8cc080e7          	jalr	-1844(ra) # 8000741c <_Z11printStringPKc>
    80006b58:	00000613          	li	a2,0
    80006b5c:	00a00593          	li	a1,10
    80006b60:	0009051b          	sext.w	a0,s2
    80006b64:	00001097          	auipc	ra,0x1
    80006b68:	a68080e7          	jalr	-1432(ra) # 800075cc <_Z8printIntiii>
    80006b6c:	00006517          	auipc	a0,0x6
    80006b70:	cfc50513          	addi	a0,a0,-772 # 8000c868 <CONSOLE_STATUS+0x858>
    80006b74:	00001097          	auipc	ra,0x1
    80006b78:	8a8080e7          	jalr	-1880(ra) # 8000741c <_Z11printStringPKc>
    80006b7c:	0400006f          	j	80006bbc <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006b80:	00006517          	auipc	a0,0x6
    80006b84:	97050513          	addi	a0,a0,-1680 # 8000c4f0 <CONSOLE_STATUS+0x4e0>
    80006b88:	00001097          	auipc	ra,0x1
    80006b8c:	894080e7          	jalr	-1900(ra) # 8000741c <_Z11printStringPKc>
    80006b90:	00000613          	li	a2,0
    80006b94:	00a00593          	li	a1,10
    80006b98:	00048513          	mv	a0,s1
    80006b9c:	00001097          	auipc	ra,0x1
    80006ba0:	a30080e7          	jalr	-1488(ra) # 800075cc <_Z8printIntiii>
    80006ba4:	00006517          	auipc	a0,0x6
    80006ba8:	cc450513          	addi	a0,a0,-828 # 8000c868 <CONSOLE_STATUS+0x858>
    80006bac:	00001097          	auipc	ra,0x1
    80006bb0:	870080e7          	jalr	-1936(ra) # 8000741c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006bb4:	0014849b          	addiw	s1,s1,1
    80006bb8:	0ff4f493          	andi	s1,s1,255
    80006bbc:	00500793          	li	a5,5
    80006bc0:	fc97f0e3          	bgeu	a5,s1,80006b80 <_ZL11workerBodyCPv+0x100>
    printString("C finished!\n");
    80006bc4:	00006517          	auipc	a0,0x6
    80006bc8:	95c50513          	addi	a0,a0,-1700 # 8000c520 <CONSOLE_STATUS+0x510>
    80006bcc:	00001097          	auipc	ra,0x1
    80006bd0:	850080e7          	jalr	-1968(ra) # 8000741c <_Z11printStringPKc>
    finishedC = true;
    80006bd4:	00100793          	li	a5,1
    80006bd8:	00009717          	auipc	a4,0x9
    80006bdc:	80f704a3          	sb	a5,-2039(a4) # 8000f3e1 <_ZL9finishedC>
    thread_dispatch();
    80006be0:	ffffb097          	auipc	ra,0xffffb
    80006be4:	698080e7          	jalr	1688(ra) # 80002278 <_Z15thread_dispatchv>
}
    80006be8:	01813083          	ld	ra,24(sp)
    80006bec:	01013403          	ld	s0,16(sp)
    80006bf0:	00813483          	ld	s1,8(sp)
    80006bf4:	00013903          	ld	s2,0(sp)
    80006bf8:	02010113          	addi	sp,sp,32
    80006bfc:	00008067          	ret

0000000080006c00 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006c00:	fe010113          	addi	sp,sp,-32
    80006c04:	00113c23          	sd	ra,24(sp)
    80006c08:	00813823          	sd	s0,16(sp)
    80006c0c:	00913423          	sd	s1,8(sp)
    80006c10:	01213023          	sd	s2,0(sp)
    80006c14:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006c18:	00000913          	li	s2,0
    80006c1c:	0380006f          	j	80006c54 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80006c20:	ffffb097          	auipc	ra,0xffffb
    80006c24:	658080e7          	jalr	1624(ra) # 80002278 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006c28:	00148493          	addi	s1,s1,1
    80006c2c:	000027b7          	lui	a5,0x2
    80006c30:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006c34:	0097ee63          	bltu	a5,s1,80006c50 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006c38:	00000713          	li	a4,0
    80006c3c:	000077b7          	lui	a5,0x7
    80006c40:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006c44:	fce7eee3          	bltu	a5,a4,80006c20 <_ZL11workerBodyBPv+0x20>
    80006c48:	00170713          	addi	a4,a4,1
    80006c4c:	ff1ff06f          	j	80006c3c <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80006c50:	00190913          	addi	s2,s2,1
    80006c54:	00f00793          	li	a5,15
    80006c58:	0527e063          	bltu	a5,s2,80006c98 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80006c5c:	00006517          	auipc	a0,0x6
    80006c60:	8d450513          	addi	a0,a0,-1836 # 8000c530 <CONSOLE_STATUS+0x520>
    80006c64:	00000097          	auipc	ra,0x0
    80006c68:	7b8080e7          	jalr	1976(ra) # 8000741c <_Z11printStringPKc>
    80006c6c:	00000613          	li	a2,0
    80006c70:	00a00593          	li	a1,10
    80006c74:	0009051b          	sext.w	a0,s2
    80006c78:	00001097          	auipc	ra,0x1
    80006c7c:	954080e7          	jalr	-1708(ra) # 800075cc <_Z8printIntiii>
    80006c80:	00006517          	auipc	a0,0x6
    80006c84:	be850513          	addi	a0,a0,-1048 # 8000c868 <CONSOLE_STATUS+0x858>
    80006c88:	00000097          	auipc	ra,0x0
    80006c8c:	794080e7          	jalr	1940(ra) # 8000741c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006c90:	00000493          	li	s1,0
    80006c94:	f99ff06f          	j	80006c2c <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80006c98:	00006517          	auipc	a0,0x6
    80006c9c:	8a050513          	addi	a0,a0,-1888 # 8000c538 <CONSOLE_STATUS+0x528>
    80006ca0:	00000097          	auipc	ra,0x0
    80006ca4:	77c080e7          	jalr	1916(ra) # 8000741c <_Z11printStringPKc>
    finishedB = true;
    80006ca8:	00100793          	li	a5,1
    80006cac:	00008717          	auipc	a4,0x8
    80006cb0:	72f70b23          	sb	a5,1846(a4) # 8000f3e2 <_ZL9finishedB>
    thread_dispatch();
    80006cb4:	ffffb097          	auipc	ra,0xffffb
    80006cb8:	5c4080e7          	jalr	1476(ra) # 80002278 <_Z15thread_dispatchv>
}
    80006cbc:	01813083          	ld	ra,24(sp)
    80006cc0:	01013403          	ld	s0,16(sp)
    80006cc4:	00813483          	ld	s1,8(sp)
    80006cc8:	00013903          	ld	s2,0(sp)
    80006ccc:	02010113          	addi	sp,sp,32
    80006cd0:	00008067          	ret

0000000080006cd4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006cd4:	fe010113          	addi	sp,sp,-32
    80006cd8:	00113c23          	sd	ra,24(sp)
    80006cdc:	00813823          	sd	s0,16(sp)
    80006ce0:	00913423          	sd	s1,8(sp)
    80006ce4:	01213023          	sd	s2,0(sp)
    80006ce8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006cec:	00000913          	li	s2,0
    80006cf0:	0380006f          	j	80006d28 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006cf4:	ffffb097          	auipc	ra,0xffffb
    80006cf8:	584080e7          	jalr	1412(ra) # 80002278 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006cfc:	00148493          	addi	s1,s1,1
    80006d00:	000027b7          	lui	a5,0x2
    80006d04:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006d08:	0097ee63          	bltu	a5,s1,80006d24 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006d0c:	00000713          	li	a4,0
    80006d10:	000077b7          	lui	a5,0x7
    80006d14:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006d18:	fce7eee3          	bltu	a5,a4,80006cf4 <_ZL11workerBodyAPv+0x20>
    80006d1c:	00170713          	addi	a4,a4,1
    80006d20:	ff1ff06f          	j	80006d10 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006d24:	00190913          	addi	s2,s2,1
    80006d28:	00900793          	li	a5,9
    80006d2c:	0527e063          	bltu	a5,s2,80006d6c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006d30:	00006517          	auipc	a0,0x6
    80006d34:	81850513          	addi	a0,a0,-2024 # 8000c548 <CONSOLE_STATUS+0x538>
    80006d38:	00000097          	auipc	ra,0x0
    80006d3c:	6e4080e7          	jalr	1764(ra) # 8000741c <_Z11printStringPKc>
    80006d40:	00000613          	li	a2,0
    80006d44:	00a00593          	li	a1,10
    80006d48:	0009051b          	sext.w	a0,s2
    80006d4c:	00001097          	auipc	ra,0x1
    80006d50:	880080e7          	jalr	-1920(ra) # 800075cc <_Z8printIntiii>
    80006d54:	00006517          	auipc	a0,0x6
    80006d58:	b1450513          	addi	a0,a0,-1260 # 8000c868 <CONSOLE_STATUS+0x858>
    80006d5c:	00000097          	auipc	ra,0x0
    80006d60:	6c0080e7          	jalr	1728(ra) # 8000741c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006d64:	00000493          	li	s1,0
    80006d68:	f99ff06f          	j	80006d00 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006d6c:	00005517          	auipc	a0,0x5
    80006d70:	7e450513          	addi	a0,a0,2020 # 8000c550 <CONSOLE_STATUS+0x540>
    80006d74:	00000097          	auipc	ra,0x0
    80006d78:	6a8080e7          	jalr	1704(ra) # 8000741c <_Z11printStringPKc>
    finishedA = true;
    80006d7c:	00100793          	li	a5,1
    80006d80:	00008717          	auipc	a4,0x8
    80006d84:	66f701a3          	sb	a5,1635(a4) # 8000f3e3 <_ZL9finishedA>
}
    80006d88:	01813083          	ld	ra,24(sp)
    80006d8c:	01013403          	ld	s0,16(sp)
    80006d90:	00813483          	ld	s1,8(sp)
    80006d94:	00013903          	ld	s2,0(sp)
    80006d98:	02010113          	addi	sp,sp,32
    80006d9c:	00008067          	ret

0000000080006da0 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80006da0:	fd010113          	addi	sp,sp,-48
    80006da4:	02113423          	sd	ra,40(sp)
    80006da8:	02813023          	sd	s0,32(sp)
    80006dac:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006db0:	00000613          	li	a2,0
    80006db4:	00000597          	auipc	a1,0x0
    80006db8:	f2058593          	addi	a1,a1,-224 # 80006cd4 <_ZL11workerBodyAPv>
    80006dbc:	fd040513          	addi	a0,s0,-48
    80006dc0:	ffffb097          	auipc	ra,0xffffb
    80006dc4:	41c080e7          	jalr	1052(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80006dc8:	00005517          	auipc	a0,0x5
    80006dcc:	79850513          	addi	a0,a0,1944 # 8000c560 <CONSOLE_STATUS+0x550>
    80006dd0:	00000097          	auipc	ra,0x0
    80006dd4:	64c080e7          	jalr	1612(ra) # 8000741c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006dd8:	00000613          	li	a2,0
    80006ddc:	00000597          	auipc	a1,0x0
    80006de0:	e2458593          	addi	a1,a1,-476 # 80006c00 <_ZL11workerBodyBPv>
    80006de4:	fd840513          	addi	a0,s0,-40
    80006de8:	ffffb097          	auipc	ra,0xffffb
    80006dec:	3f4080e7          	jalr	1012(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80006df0:	00005517          	auipc	a0,0x5
    80006df4:	78850513          	addi	a0,a0,1928 # 8000c578 <CONSOLE_STATUS+0x568>
    80006df8:	00000097          	auipc	ra,0x0
    80006dfc:	624080e7          	jalr	1572(ra) # 8000741c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006e00:	00000613          	li	a2,0
    80006e04:	00000597          	auipc	a1,0x0
    80006e08:	c7c58593          	addi	a1,a1,-900 # 80006a80 <_ZL11workerBodyCPv>
    80006e0c:	fe040513          	addi	a0,s0,-32
    80006e10:	ffffb097          	auipc	ra,0xffffb
    80006e14:	3cc080e7          	jalr	972(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80006e18:	00005517          	auipc	a0,0x5
    80006e1c:	77850513          	addi	a0,a0,1912 # 8000c590 <CONSOLE_STATUS+0x580>
    80006e20:	00000097          	auipc	ra,0x0
    80006e24:	5fc080e7          	jalr	1532(ra) # 8000741c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006e28:	00000613          	li	a2,0
    80006e2c:	00000597          	auipc	a1,0x0
    80006e30:	b0c58593          	addi	a1,a1,-1268 # 80006938 <_ZL11workerBodyDPv>
    80006e34:	fe840513          	addi	a0,s0,-24
    80006e38:	ffffb097          	auipc	ra,0xffffb
    80006e3c:	3a4080e7          	jalr	932(ra) # 800021dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80006e40:	00005517          	auipc	a0,0x5
    80006e44:	76850513          	addi	a0,a0,1896 # 8000c5a8 <CONSOLE_STATUS+0x598>
    80006e48:	00000097          	auipc	ra,0x0
    80006e4c:	5d4080e7          	jalr	1492(ra) # 8000741c <_Z11printStringPKc>
    80006e50:	00c0006f          	j	80006e5c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006e54:	ffffb097          	auipc	ra,0xffffb
    80006e58:	424080e7          	jalr	1060(ra) # 80002278 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006e5c:	00008797          	auipc	a5,0x8
    80006e60:	5877c783          	lbu	a5,1415(a5) # 8000f3e3 <_ZL9finishedA>
    80006e64:	fe0788e3          	beqz	a5,80006e54 <_Z18Threads_C_API_testv+0xb4>
    80006e68:	00008797          	auipc	a5,0x8
    80006e6c:	57a7c783          	lbu	a5,1402(a5) # 8000f3e2 <_ZL9finishedB>
    80006e70:	fe0782e3          	beqz	a5,80006e54 <_Z18Threads_C_API_testv+0xb4>
    80006e74:	00008797          	auipc	a5,0x8
    80006e78:	56d7c783          	lbu	a5,1389(a5) # 8000f3e1 <_ZL9finishedC>
    80006e7c:	fc078ce3          	beqz	a5,80006e54 <_Z18Threads_C_API_testv+0xb4>
    80006e80:	00008797          	auipc	a5,0x8
    80006e84:	5607c783          	lbu	a5,1376(a5) # 8000f3e0 <_ZL9finishedD>
    80006e88:	fc0786e3          	beqz	a5,80006e54 <_Z18Threads_C_API_testv+0xb4>
    }
}
    80006e8c:	02813083          	ld	ra,40(sp)
    80006e90:	02013403          	ld	s0,32(sp)
    80006e94:	03010113          	addi	sp,sp,48
    80006e98:	00008067          	ret

0000000080006e9c <_Z8userMainv>:
#include "../test_h/ConsumerProducer_CPP_API_test.h"
#include "../test_h/System_Mode_test.h"

#endif

void userMain() {
    80006e9c:	fe010113          	addi	sp,sp,-32
    80006ea0:	00113c23          	sd	ra,24(sp)
    80006ea4:	00813823          	sd	s0,16(sp)
    80006ea8:	00913423          	sd	s1,8(sp)
    80006eac:	01213023          	sd	s2,0(sp)
    80006eb0:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80006eb4:	00006517          	auipc	a0,0x6
    80006eb8:	87450513          	addi	a0,a0,-1932 # 8000c728 <CONSOLE_STATUS+0x718>
    80006ebc:	00000097          	auipc	ra,0x0
    80006ec0:	560080e7          	jalr	1376(ra) # 8000741c <_Z11printStringPKc>
    int test = getc() - '0';
    80006ec4:	ffffb097          	auipc	ra,0xffffb
    80006ec8:	53c080e7          	jalr	1340(ra) # 80002400 <_Z4getcv>
    80006ecc:	00050913          	mv	s2,a0
    80006ed0:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80006ed4:	ffffb097          	auipc	ra,0xffffb
    80006ed8:	52c080e7          	jalr	1324(ra) # 80002400 <_Z4getcv>
    // int test = 3;
    putc('0' + test);
    80006edc:	00090513          	mv	a0,s2
    80006ee0:	ffffb097          	auipc	ra,0xffffb
    80006ee4:	548080e7          	jalr	1352(ra) # 80002428 <_Z4putcc>
    putc('\n');
    80006ee8:	00a00513          	li	a0,10
    80006eec:	ffffb097          	auipc	ra,0xffffb
    80006ef0:	53c080e7          	jalr	1340(ra) # 80002428 <_Z4putcc>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80006ef4:	00700793          	li	a5,7
    80006ef8:	1097ec63          	bltu	a5,s1,80007010 <_Z8userMainv+0x174>
    80006efc:	00249493          	slli	s1,s1,0x2
    80006f00:	00006717          	auipc	a4,0x6
    80006f04:	a9470713          	addi	a4,a4,-1388 # 8000c994 <CONSOLE_STATUS+0x984>
    80006f08:	00e484b3          	add	s1,s1,a4
    80006f0c:	0004a783          	lw	a5,0(s1)
    80006f10:	00e787b3          	add	a5,a5,a4
    80006f14:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80006f18:	00000097          	auipc	ra,0x0
    80006f1c:	e88080e7          	jalr	-376(ra) # 80006da0 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006f20:	00006517          	auipc	a0,0x6
    80006f24:	82850513          	addi	a0,a0,-2008 # 8000c748 <CONSOLE_STATUS+0x738>
    80006f28:	00000097          	auipc	ra,0x0
    80006f2c:	4f4080e7          	jalr	1268(ra) # 8000741c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    printString("Kraj izvrsavanja");
    80006f30:	00006517          	auipc	a0,0x6
    80006f34:	a5050513          	addi	a0,a0,-1456 # 8000c980 <CONSOLE_STATUS+0x970>
    80006f38:	00000097          	auipc	ra,0x0
    80006f3c:	4e4080e7          	jalr	1252(ra) # 8000741c <_Z11printStringPKc>
    80006f40:	01813083          	ld	ra,24(sp)
    80006f44:	01013403          	ld	s0,16(sp)
    80006f48:	00813483          	ld	s1,8(sp)
    80006f4c:	00013903          	ld	s2,0(sp)
    80006f50:	02010113          	addi	sp,sp,32
    80006f54:	00008067          	ret
            Threads_CPP_API_test();
    80006f58:	00002097          	auipc	ra,0x2
    80006f5c:	850080e7          	jalr	-1968(ra) # 800087a8 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006f60:	00006517          	auipc	a0,0x6
    80006f64:	82850513          	addi	a0,a0,-2008 # 8000c788 <CONSOLE_STATUS+0x778>
    80006f68:	00000097          	auipc	ra,0x0
    80006f6c:	4b4080e7          	jalr	1204(ra) # 8000741c <_Z11printStringPKc>
            break;
    80006f70:	fc1ff06f          	j	80006f30 <_Z8userMainv+0x94>
            producerConsumer_C_API();
    80006f74:	fffff097          	auipc	ra,0xfffff
    80006f78:	680080e7          	jalr	1664(ra) # 800065f4 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80006f7c:	00006517          	auipc	a0,0x6
    80006f80:	84c50513          	addi	a0,a0,-1972 # 8000c7c8 <CONSOLE_STATUS+0x7b8>
    80006f84:	00000097          	auipc	ra,0x0
    80006f88:	498080e7          	jalr	1176(ra) # 8000741c <_Z11printStringPKc>
            break;
    80006f8c:	fa5ff06f          	j	80006f30 <_Z8userMainv+0x94>
            producerConsumer_CPP_Sync_API();
    80006f90:	00001097          	auipc	ra,0x1
    80006f94:	cf8080e7          	jalr	-776(ra) # 80007c88 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006f98:	00006517          	auipc	a0,0x6
    80006f9c:	88050513          	addi	a0,a0,-1920 # 8000c818 <CONSOLE_STATUS+0x808>
    80006fa0:	00000097          	auipc	ra,0x0
    80006fa4:	47c080e7          	jalr	1148(ra) # 8000741c <_Z11printStringPKc>
            break;
    80006fa8:	f89ff06f          	j	80006f30 <_Z8userMainv+0x94>
            testSleeping();
    80006fac:	fffff097          	auipc	ra,0xfffff
    80006fb0:	33c080e7          	jalr	828(ra) # 800062e8 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., time_sleep test C API)\n");
    80006fb4:	00006517          	auipc	a0,0x6
    80006fb8:	8bc50513          	addi	a0,a0,-1860 # 8000c870 <CONSOLE_STATUS+0x860>
    80006fbc:	00000097          	auipc	ra,0x0
    80006fc0:	460080e7          	jalr	1120(ra) # 8000741c <_Z11printStringPKc>
            break;
    80006fc4:	f6dff06f          	j	80006f30 <_Z8userMainv+0x94>
            testConsumerProducer();
    80006fc8:	00002097          	auipc	ra,0x2
    80006fcc:	ca0080e7          	jalr	-864(ra) # 80008c68 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80006fd0:	00006517          	auipc	a0,0x6
    80006fd4:	8d050513          	addi	a0,a0,-1840 # 8000c8a0 <CONSOLE_STATUS+0x890>
    80006fd8:	00000097          	auipc	ra,0x0
    80006fdc:	444080e7          	jalr	1092(ra) # 8000741c <_Z11printStringPKc>
            break;
    80006fe0:	f51ff06f          	j	80006f30 <_Z8userMainv+0x94>
            System_Mode_test();
    80006fe4:	fffff097          	auipc	ra,0xfffff
    80006fe8:	158080e7          	jalr	344(ra) # 8000613c <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80006fec:	00006517          	auipc	a0,0x6
    80006ff0:	8f450513          	addi	a0,a0,-1804 # 8000c8e0 <CONSOLE_STATUS+0x8d0>
    80006ff4:	00000097          	auipc	ra,0x0
    80006ff8:	428080e7          	jalr	1064(ra) # 8000741c <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80006ffc:	00006517          	auipc	a0,0x6
    80007000:	90450513          	addi	a0,a0,-1788 # 8000c900 <CONSOLE_STATUS+0x8f0>
    80007004:	00000097          	auipc	ra,0x0
    80007008:	418080e7          	jalr	1048(ra) # 8000741c <_Z11printStringPKc>
            break;
    8000700c:	f25ff06f          	j	80006f30 <_Z8userMainv+0x94>
            printString("Niste uneli odgovarajuci broj za test\n");
    80007010:	00006517          	auipc	a0,0x6
    80007014:	94850513          	addi	a0,a0,-1720 # 8000c958 <CONSOLE_STATUS+0x948>
    80007018:	00000097          	auipc	ra,0x0
    8000701c:	404080e7          	jalr	1028(ra) # 8000741c <_Z11printStringPKc>
    80007020:	f11ff06f          	j	80006f30 <_Z8userMainv+0x94>

0000000080007024 <_ZN9BufferCPPC1Ei>:
#include "../test_h/buffer_CPP_API.h"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80007024:	fd010113          	addi	sp,sp,-48
    80007028:	02113423          	sd	ra,40(sp)
    8000702c:	02813023          	sd	s0,32(sp)
    80007030:	00913c23          	sd	s1,24(sp)
    80007034:	01213823          	sd	s2,16(sp)
    80007038:	01313423          	sd	s3,8(sp)
    8000703c:	03010413          	addi	s0,sp,48
    80007040:	00050493          	mv	s1,a0
    80007044:	00058913          	mv	s2,a1
    80007048:	0015879b          	addiw	a5,a1,1
    8000704c:	0007851b          	sext.w	a0,a5
    80007050:	00f4a023          	sw	a5,0(s1)
    80007054:	0004a823          	sw	zero,16(s1)
    80007058:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000705c:	00251513          	slli	a0,a0,0x2
    80007060:	ffffb097          	auipc	ra,0xffffb
    80007064:	120080e7          	jalr	288(ra) # 80002180 <_Z9mem_allocm>
    80007068:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    8000706c:	01000513          	li	a0,16
    80007070:	ffffa097          	auipc	ra,0xffffa
    80007074:	230080e7          	jalr	560(ra) # 800012a0 <_Znwm>
    80007078:	00050993          	mv	s3,a0
    8000707c:	00000593          	li	a1,0
    80007080:	ffffa097          	auipc	ra,0xffffa
    80007084:	438080e7          	jalr	1080(ra) # 800014b8 <_ZN9SemaphoreC1Ej>
    80007088:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    8000708c:	01000513          	li	a0,16
    80007090:	ffffa097          	auipc	ra,0xffffa
    80007094:	210080e7          	jalr	528(ra) # 800012a0 <_Znwm>
    80007098:	00050993          	mv	s3,a0
    8000709c:	00090593          	mv	a1,s2
    800070a0:	ffffa097          	auipc	ra,0xffffa
    800070a4:	418080e7          	jalr	1048(ra) # 800014b8 <_ZN9SemaphoreC1Ej>
    800070a8:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800070ac:	01000513          	li	a0,16
    800070b0:	ffffa097          	auipc	ra,0xffffa
    800070b4:	1f0080e7          	jalr	496(ra) # 800012a0 <_Znwm>
    800070b8:	00050913          	mv	s2,a0
    800070bc:	00100593          	li	a1,1
    800070c0:	ffffa097          	auipc	ra,0xffffa
    800070c4:	3f8080e7          	jalr	1016(ra) # 800014b8 <_ZN9SemaphoreC1Ej>
    800070c8:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800070cc:	01000513          	li	a0,16
    800070d0:	ffffa097          	auipc	ra,0xffffa
    800070d4:	1d0080e7          	jalr	464(ra) # 800012a0 <_Znwm>
    800070d8:	00050913          	mv	s2,a0
    800070dc:	00100593          	li	a1,1
    800070e0:	ffffa097          	auipc	ra,0xffffa
    800070e4:	3d8080e7          	jalr	984(ra) # 800014b8 <_ZN9SemaphoreC1Ej>
    800070e8:	0324b823          	sd	s2,48(s1)
}
    800070ec:	02813083          	ld	ra,40(sp)
    800070f0:	02013403          	ld	s0,32(sp)
    800070f4:	01813483          	ld	s1,24(sp)
    800070f8:	01013903          	ld	s2,16(sp)
    800070fc:	00813983          	ld	s3,8(sp)
    80007100:	03010113          	addi	sp,sp,48
    80007104:	00008067          	ret
    80007108:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    8000710c:	00098513          	mv	a0,s3
    80007110:	ffffa097          	auipc	ra,0xffffa
    80007114:	1b8080e7          	jalr	440(ra) # 800012c8 <_ZdlPv>
    80007118:	00048513          	mv	a0,s1
    8000711c:	00009097          	auipc	ra,0x9
    80007120:	3cc080e7          	jalr	972(ra) # 800104e8 <_Unwind_Resume>
    80007124:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80007128:	00098513          	mv	a0,s3
    8000712c:	ffffa097          	auipc	ra,0xffffa
    80007130:	19c080e7          	jalr	412(ra) # 800012c8 <_ZdlPv>
    80007134:	00048513          	mv	a0,s1
    80007138:	00009097          	auipc	ra,0x9
    8000713c:	3b0080e7          	jalr	944(ra) # 800104e8 <_Unwind_Resume>
    80007140:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80007144:	00090513          	mv	a0,s2
    80007148:	ffffa097          	auipc	ra,0xffffa
    8000714c:	180080e7          	jalr	384(ra) # 800012c8 <_ZdlPv>
    80007150:	00048513          	mv	a0,s1
    80007154:	00009097          	auipc	ra,0x9
    80007158:	394080e7          	jalr	916(ra) # 800104e8 <_Unwind_Resume>
    8000715c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80007160:	00090513          	mv	a0,s2
    80007164:	ffffa097          	auipc	ra,0xffffa
    80007168:	164080e7          	jalr	356(ra) # 800012c8 <_ZdlPv>
    8000716c:	00048513          	mv	a0,s1
    80007170:	00009097          	auipc	ra,0x9
    80007174:	378080e7          	jalr	888(ra) # 800104e8 <_Unwind_Resume>

0000000080007178 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80007178:	fe010113          	addi	sp,sp,-32
    8000717c:	00113c23          	sd	ra,24(sp)
    80007180:	00813823          	sd	s0,16(sp)
    80007184:	00913423          	sd	s1,8(sp)
    80007188:	01213023          	sd	s2,0(sp)
    8000718c:	02010413          	addi	s0,sp,32
    80007190:	00050493          	mv	s1,a0
    80007194:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80007198:	01853503          	ld	a0,24(a0)
    8000719c:	ffffa097          	auipc	ra,0xffffa
    800071a0:	354080e7          	jalr	852(ra) # 800014f0 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800071a4:	0304b503          	ld	a0,48(s1)
    800071a8:	ffffa097          	auipc	ra,0xffffa
    800071ac:	348080e7          	jalr	840(ra) # 800014f0 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800071b0:	0084b783          	ld	a5,8(s1)
    800071b4:	0144a703          	lw	a4,20(s1)
    800071b8:	00271713          	slli	a4,a4,0x2
    800071bc:	00e787b3          	add	a5,a5,a4
    800071c0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800071c4:	0144a783          	lw	a5,20(s1)
    800071c8:	0017879b          	addiw	a5,a5,1
    800071cc:	0004a703          	lw	a4,0(s1)
    800071d0:	02e7e7bb          	remw	a5,a5,a4
    800071d4:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800071d8:	0304b503          	ld	a0,48(s1)
    800071dc:	ffffa097          	auipc	ra,0xffffa
    800071e0:	340080e7          	jalr	832(ra) # 8000151c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    800071e4:	0204b503          	ld	a0,32(s1)
    800071e8:	ffffa097          	auipc	ra,0xffffa
    800071ec:	334080e7          	jalr	820(ra) # 8000151c <_ZN9Semaphore6signalEv>

}
    800071f0:	01813083          	ld	ra,24(sp)
    800071f4:	01013403          	ld	s0,16(sp)
    800071f8:	00813483          	ld	s1,8(sp)
    800071fc:	00013903          	ld	s2,0(sp)
    80007200:	02010113          	addi	sp,sp,32
    80007204:	00008067          	ret

0000000080007208 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80007208:	fe010113          	addi	sp,sp,-32
    8000720c:	00113c23          	sd	ra,24(sp)
    80007210:	00813823          	sd	s0,16(sp)
    80007214:	00913423          	sd	s1,8(sp)
    80007218:	01213023          	sd	s2,0(sp)
    8000721c:	02010413          	addi	s0,sp,32
    80007220:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80007224:	02053503          	ld	a0,32(a0)
    80007228:	ffffa097          	auipc	ra,0xffffa
    8000722c:	2c8080e7          	jalr	712(ra) # 800014f0 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80007230:	0284b503          	ld	a0,40(s1)
    80007234:	ffffa097          	auipc	ra,0xffffa
    80007238:	2bc080e7          	jalr	700(ra) # 800014f0 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    8000723c:	0084b703          	ld	a4,8(s1)
    80007240:	0104a783          	lw	a5,16(s1)
    80007244:	00279693          	slli	a3,a5,0x2
    80007248:	00d70733          	add	a4,a4,a3
    8000724c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80007250:	0017879b          	addiw	a5,a5,1
    80007254:	0004a703          	lw	a4,0(s1)
    80007258:	02e7e7bb          	remw	a5,a5,a4
    8000725c:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80007260:	0284b503          	ld	a0,40(s1)
    80007264:	ffffa097          	auipc	ra,0xffffa
    80007268:	2b8080e7          	jalr	696(ra) # 8000151c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    8000726c:	0184b503          	ld	a0,24(s1)
    80007270:	ffffa097          	auipc	ra,0xffffa
    80007274:	2ac080e7          	jalr	684(ra) # 8000151c <_ZN9Semaphore6signalEv>

    return ret;
}
    80007278:	00090513          	mv	a0,s2
    8000727c:	01813083          	ld	ra,24(sp)
    80007280:	01013403          	ld	s0,16(sp)
    80007284:	00813483          	ld	s1,8(sp)
    80007288:	00013903          	ld	s2,0(sp)
    8000728c:	02010113          	addi	sp,sp,32
    80007290:	00008067          	ret

0000000080007294 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80007294:	fe010113          	addi	sp,sp,-32
    80007298:	00113c23          	sd	ra,24(sp)
    8000729c:	00813823          	sd	s0,16(sp)
    800072a0:	00913423          	sd	s1,8(sp)
    800072a4:	01213023          	sd	s2,0(sp)
    800072a8:	02010413          	addi	s0,sp,32
    800072ac:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800072b0:	02853503          	ld	a0,40(a0)
    800072b4:	ffffa097          	auipc	ra,0xffffa
    800072b8:	23c080e7          	jalr	572(ra) # 800014f0 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800072bc:	0304b503          	ld	a0,48(s1)
    800072c0:	ffffa097          	auipc	ra,0xffffa
    800072c4:	230080e7          	jalr	560(ra) # 800014f0 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800072c8:	0144a783          	lw	a5,20(s1)
    800072cc:	0104a903          	lw	s2,16(s1)
    800072d0:	0327ce63          	blt	a5,s2,8000730c <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800072d4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800072d8:	0304b503          	ld	a0,48(s1)
    800072dc:	ffffa097          	auipc	ra,0xffffa
    800072e0:	240080e7          	jalr	576(ra) # 8000151c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    800072e4:	0284b503          	ld	a0,40(s1)
    800072e8:	ffffa097          	auipc	ra,0xffffa
    800072ec:	234080e7          	jalr	564(ra) # 8000151c <_ZN9Semaphore6signalEv>

    return ret;
}
    800072f0:	00090513          	mv	a0,s2
    800072f4:	01813083          	ld	ra,24(sp)
    800072f8:	01013403          	ld	s0,16(sp)
    800072fc:	00813483          	ld	s1,8(sp)
    80007300:	00013903          	ld	s2,0(sp)
    80007304:	02010113          	addi	sp,sp,32
    80007308:	00008067          	ret
        ret = cap - head + tail;
    8000730c:	0004a703          	lw	a4,0(s1)
    80007310:	4127093b          	subw	s2,a4,s2
    80007314:	00f9093b          	addw	s2,s2,a5
    80007318:	fc1ff06f          	j	800072d8 <_ZN9BufferCPP6getCntEv+0x44>

000000008000731c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    8000731c:	fe010113          	addi	sp,sp,-32
    80007320:	00113c23          	sd	ra,24(sp)
    80007324:	00813823          	sd	s0,16(sp)
    80007328:	00913423          	sd	s1,8(sp)
    8000732c:	02010413          	addi	s0,sp,32
    80007330:	00050493          	mv	s1,a0
    Console::putc('\n');
    80007334:	00a00513          	li	a0,10
    80007338:	ffffa097          	auipc	ra,0xffffa
    8000733c:	2f0080e7          	jalr	752(ra) # 80001628 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80007340:	00005517          	auipc	a0,0x5
    80007344:	67850513          	addi	a0,a0,1656 # 8000c9b8 <CONSOLE_STATUS+0x9a8>
    80007348:	00000097          	auipc	ra,0x0
    8000734c:	0d4080e7          	jalr	212(ra) # 8000741c <_Z11printStringPKc>
    while (getCnt()) {
    80007350:	00048513          	mv	a0,s1
    80007354:	00000097          	auipc	ra,0x0
    80007358:	f40080e7          	jalr	-192(ra) # 80007294 <_ZN9BufferCPP6getCntEv>
    8000735c:	02050c63          	beqz	a0,80007394 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80007360:	0084b783          	ld	a5,8(s1)
    80007364:	0104a703          	lw	a4,16(s1)
    80007368:	00271713          	slli	a4,a4,0x2
    8000736c:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80007370:	0007c503          	lbu	a0,0(a5)
    80007374:	ffffa097          	auipc	ra,0xffffa
    80007378:	2b4080e7          	jalr	692(ra) # 80001628 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    8000737c:	0104a783          	lw	a5,16(s1)
    80007380:	0017879b          	addiw	a5,a5,1
    80007384:	0004a703          	lw	a4,0(s1)
    80007388:	02e7e7bb          	remw	a5,a5,a4
    8000738c:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80007390:	fc1ff06f          	j	80007350 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80007394:	02100513          	li	a0,33
    80007398:	ffffa097          	auipc	ra,0xffffa
    8000739c:	290080e7          	jalr	656(ra) # 80001628 <_ZN7Console4putcEc>
    Console::putc('\n');
    800073a0:	00a00513          	li	a0,10
    800073a4:	ffffa097          	auipc	ra,0xffffa
    800073a8:	284080e7          	jalr	644(ra) # 80001628 <_ZN7Console4putcEc>
    mem_free(buffer);
    800073ac:	0084b503          	ld	a0,8(s1)
    800073b0:	ffffb097          	auipc	ra,0xffffb
    800073b4:	e00080e7          	jalr	-512(ra) # 800021b0 <_Z8mem_freePv>
    delete itemAvailable;
    800073b8:	0204b503          	ld	a0,32(s1)
    800073bc:	00050863          	beqz	a0,800073cc <_ZN9BufferCPPD1Ev+0xb0>
    800073c0:	00053783          	ld	a5,0(a0)
    800073c4:	0087b783          	ld	a5,8(a5)
    800073c8:	000780e7          	jalr	a5
    delete spaceAvailable;
    800073cc:	0184b503          	ld	a0,24(s1)
    800073d0:	00050863          	beqz	a0,800073e0 <_ZN9BufferCPPD1Ev+0xc4>
    800073d4:	00053783          	ld	a5,0(a0)
    800073d8:	0087b783          	ld	a5,8(a5)
    800073dc:	000780e7          	jalr	a5
    delete mutexTail;
    800073e0:	0304b503          	ld	a0,48(s1)
    800073e4:	00050863          	beqz	a0,800073f4 <_ZN9BufferCPPD1Ev+0xd8>
    800073e8:	00053783          	ld	a5,0(a0)
    800073ec:	0087b783          	ld	a5,8(a5)
    800073f0:	000780e7          	jalr	a5
    delete mutexHead;
    800073f4:	0284b503          	ld	a0,40(s1)
    800073f8:	00050863          	beqz	a0,80007408 <_ZN9BufferCPPD1Ev+0xec>
    800073fc:	00053783          	ld	a5,0(a0)
    80007400:	0087b783          	ld	a5,8(a5)
    80007404:	000780e7          	jalr	a5
}
    80007408:	01813083          	ld	ra,24(sp)
    8000740c:	01013403          	ld	s0,16(sp)
    80007410:	00813483          	ld	s1,8(sp)
    80007414:	02010113          	addi	sp,sp,32
    80007418:	00008067          	ret

000000008000741c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000741c:	fe010113          	addi	sp,sp,-32
    80007420:	00113c23          	sd	ra,24(sp)
    80007424:	00813823          	sd	s0,16(sp)
    80007428:	00913423          	sd	s1,8(sp)
    8000742c:	02010413          	addi	s0,sp,32
    80007430:	00050493          	mv	s1,a0
    LOCK();
    80007434:	00100613          	li	a2,1
    80007438:	00000593          	li	a1,0
    8000743c:	00008517          	auipc	a0,0x8
    80007440:	fac50513          	addi	a0,a0,-84 # 8000f3e8 <lockPrint>
    80007444:	ffffa097          	auipc	ra,0xffffa
    80007448:	d40080e7          	jalr	-704(ra) # 80001184 <copy_and_swap>
    8000744c:	00050863          	beqz	a0,8000745c <_Z11printStringPKc+0x40>
    80007450:	ffffb097          	auipc	ra,0xffffb
    80007454:	e28080e7          	jalr	-472(ra) # 80002278 <_Z15thread_dispatchv>
    80007458:	fddff06f          	j	80007434 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000745c:	0004c503          	lbu	a0,0(s1)
    80007460:	00050a63          	beqz	a0,80007474 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80007464:	ffffb097          	auipc	ra,0xffffb
    80007468:	fc4080e7          	jalr	-60(ra) # 80002428 <_Z4putcc>
        string++;
    8000746c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80007470:	fedff06f          	j	8000745c <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80007474:	00000613          	li	a2,0
    80007478:	00100593          	li	a1,1
    8000747c:	00008517          	auipc	a0,0x8
    80007480:	f6c50513          	addi	a0,a0,-148 # 8000f3e8 <lockPrint>
    80007484:	ffffa097          	auipc	ra,0xffffa
    80007488:	d00080e7          	jalr	-768(ra) # 80001184 <copy_and_swap>
    8000748c:	fe0514e3          	bnez	a0,80007474 <_Z11printStringPKc+0x58>
}
    80007490:	01813083          	ld	ra,24(sp)
    80007494:	01013403          	ld	s0,16(sp)
    80007498:	00813483          	ld	s1,8(sp)
    8000749c:	02010113          	addi	sp,sp,32
    800074a0:	00008067          	ret

00000000800074a4 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800074a4:	fd010113          	addi	sp,sp,-48
    800074a8:	02113423          	sd	ra,40(sp)
    800074ac:	02813023          	sd	s0,32(sp)
    800074b0:	00913c23          	sd	s1,24(sp)
    800074b4:	01213823          	sd	s2,16(sp)
    800074b8:	01313423          	sd	s3,8(sp)
    800074bc:	01413023          	sd	s4,0(sp)
    800074c0:	03010413          	addi	s0,sp,48
    800074c4:	00050993          	mv	s3,a0
    800074c8:	00058a13          	mv	s4,a1
    LOCK();
    800074cc:	00100613          	li	a2,1
    800074d0:	00000593          	li	a1,0
    800074d4:	00008517          	auipc	a0,0x8
    800074d8:	f1450513          	addi	a0,a0,-236 # 8000f3e8 <lockPrint>
    800074dc:	ffffa097          	auipc	ra,0xffffa
    800074e0:	ca8080e7          	jalr	-856(ra) # 80001184 <copy_and_swap>
    800074e4:	00050863          	beqz	a0,800074f4 <_Z9getStringPci+0x50>
    800074e8:	ffffb097          	auipc	ra,0xffffb
    800074ec:	d90080e7          	jalr	-624(ra) # 80002278 <_Z15thread_dispatchv>
    800074f0:	fddff06f          	j	800074cc <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800074f4:	00000913          	li	s2,0
    800074f8:	00090493          	mv	s1,s2
    800074fc:	0019091b          	addiw	s2,s2,1
    80007500:	03495a63          	bge	s2,s4,80007534 <_Z9getStringPci+0x90>
        cc = getc();
    80007504:	ffffb097          	auipc	ra,0xffffb
    80007508:	efc080e7          	jalr	-260(ra) # 80002400 <_Z4getcv>
        if(cc < 1)
    8000750c:	02050463          	beqz	a0,80007534 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80007510:	009984b3          	add	s1,s3,s1
    80007514:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80007518:	00a00793          	li	a5,10
    8000751c:	00f50a63          	beq	a0,a5,80007530 <_Z9getStringPci+0x8c>
    80007520:	00d00793          	li	a5,13
    80007524:	fcf51ae3          	bne	a0,a5,800074f8 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80007528:	00090493          	mv	s1,s2
    8000752c:	0080006f          	j	80007534 <_Z9getStringPci+0x90>
    80007530:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80007534:	009984b3          	add	s1,s3,s1
    80007538:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000753c:	00000613          	li	a2,0
    80007540:	00100593          	li	a1,1
    80007544:	00008517          	auipc	a0,0x8
    80007548:	ea450513          	addi	a0,a0,-348 # 8000f3e8 <lockPrint>
    8000754c:	ffffa097          	auipc	ra,0xffffa
    80007550:	c38080e7          	jalr	-968(ra) # 80001184 <copy_and_swap>
    80007554:	fe0514e3          	bnez	a0,8000753c <_Z9getStringPci+0x98>
    return buf;
}
    80007558:	00098513          	mv	a0,s3
    8000755c:	02813083          	ld	ra,40(sp)
    80007560:	02013403          	ld	s0,32(sp)
    80007564:	01813483          	ld	s1,24(sp)
    80007568:	01013903          	ld	s2,16(sp)
    8000756c:	00813983          	ld	s3,8(sp)
    80007570:	00013a03          	ld	s4,0(sp)
    80007574:	03010113          	addi	sp,sp,48
    80007578:	00008067          	ret

000000008000757c <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    8000757c:	ff010113          	addi	sp,sp,-16
    80007580:	00813423          	sd	s0,8(sp)
    80007584:	01010413          	addi	s0,sp,16
    80007588:	00050693          	mv	a3,a0
    int n;

    n = 0;
    8000758c:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80007590:	0006c603          	lbu	a2,0(a3)
    80007594:	fd06071b          	addiw	a4,a2,-48
    80007598:	0ff77713          	andi	a4,a4,255
    8000759c:	00900793          	li	a5,9
    800075a0:	02e7e063          	bltu	a5,a4,800075c0 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800075a4:	0025179b          	slliw	a5,a0,0x2
    800075a8:	00a787bb          	addw	a5,a5,a0
    800075ac:	0017979b          	slliw	a5,a5,0x1
    800075b0:	00168693          	addi	a3,a3,1
    800075b4:	00c787bb          	addw	a5,a5,a2
    800075b8:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800075bc:	fd5ff06f          	j	80007590 <_Z11stringToIntPKc+0x14>
    return n;
}
    800075c0:	00813403          	ld	s0,8(sp)
    800075c4:	01010113          	addi	sp,sp,16
    800075c8:	00008067          	ret

00000000800075cc <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800075cc:	fc010113          	addi	sp,sp,-64
    800075d0:	02113c23          	sd	ra,56(sp)
    800075d4:	02813823          	sd	s0,48(sp)
    800075d8:	02913423          	sd	s1,40(sp)
    800075dc:	03213023          	sd	s2,32(sp)
    800075e0:	01313c23          	sd	s3,24(sp)
    800075e4:	04010413          	addi	s0,sp,64
    800075e8:	00050493          	mv	s1,a0
    800075ec:	00058913          	mv	s2,a1
    800075f0:	00060993          	mv	s3,a2
    LOCK();
    800075f4:	00100613          	li	a2,1
    800075f8:	00000593          	li	a1,0
    800075fc:	00008517          	auipc	a0,0x8
    80007600:	dec50513          	addi	a0,a0,-532 # 8000f3e8 <lockPrint>
    80007604:	ffffa097          	auipc	ra,0xffffa
    80007608:	b80080e7          	jalr	-1152(ra) # 80001184 <copy_and_swap>
    8000760c:	00050863          	beqz	a0,8000761c <_Z8printIntiii+0x50>
    80007610:	ffffb097          	auipc	ra,0xffffb
    80007614:	c68080e7          	jalr	-920(ra) # 80002278 <_Z15thread_dispatchv>
    80007618:	fddff06f          	j	800075f4 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000761c:	00098463          	beqz	s3,80007624 <_Z8printIntiii+0x58>
    80007620:	0804c463          	bltz	s1,800076a8 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80007624:	0004851b          	sext.w	a0,s1
    neg = 0;
    80007628:	00000593          	li	a1,0
    }

    i = 0;
    8000762c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80007630:	0009079b          	sext.w	a5,s2
    80007634:	0325773b          	remuw	a4,a0,s2
    80007638:	00048613          	mv	a2,s1
    8000763c:	0014849b          	addiw	s1,s1,1
    80007640:	02071693          	slli	a3,a4,0x20
    80007644:	0206d693          	srli	a3,a3,0x20
    80007648:	00008717          	auipc	a4,0x8
    8000764c:	ad870713          	addi	a4,a4,-1320 # 8000f120 <digits>
    80007650:	00d70733          	add	a4,a4,a3
    80007654:	00074683          	lbu	a3,0(a4)
    80007658:	fd040713          	addi	a4,s0,-48
    8000765c:	00c70733          	add	a4,a4,a2
    80007660:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80007664:	0005071b          	sext.w	a4,a0
    80007668:	0325553b          	divuw	a0,a0,s2
    8000766c:	fcf772e3          	bgeu	a4,a5,80007630 <_Z8printIntiii+0x64>
    if(neg)
    80007670:	00058c63          	beqz	a1,80007688 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80007674:	fd040793          	addi	a5,s0,-48
    80007678:	009784b3          	add	s1,a5,s1
    8000767c:	02d00793          	li	a5,45
    80007680:	fef48823          	sb	a5,-16(s1)
    80007684:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80007688:	fff4849b          	addiw	s1,s1,-1
    8000768c:	0204c463          	bltz	s1,800076b4 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80007690:	fd040793          	addi	a5,s0,-48
    80007694:	009787b3          	add	a5,a5,s1
    80007698:	ff07c503          	lbu	a0,-16(a5)
    8000769c:	ffffb097          	auipc	ra,0xffffb
    800076a0:	d8c080e7          	jalr	-628(ra) # 80002428 <_Z4putcc>
    800076a4:	fe5ff06f          	j	80007688 <_Z8printIntiii+0xbc>
        x = -xx;
    800076a8:	4090053b          	negw	a0,s1
        neg = 1;
    800076ac:	00100593          	li	a1,1
        x = -xx;
    800076b0:	f7dff06f          	j	8000762c <_Z8printIntiii+0x60>

    UNLOCK();
    800076b4:	00000613          	li	a2,0
    800076b8:	00100593          	li	a1,1
    800076bc:	00008517          	auipc	a0,0x8
    800076c0:	d2c50513          	addi	a0,a0,-724 # 8000f3e8 <lockPrint>
    800076c4:	ffffa097          	auipc	ra,0xffffa
    800076c8:	ac0080e7          	jalr	-1344(ra) # 80001184 <copy_and_swap>
    800076cc:	fe0514e3          	bnez	a0,800076b4 <_Z8printIntiii+0xe8>
    800076d0:	03813083          	ld	ra,56(sp)
    800076d4:	03013403          	ld	s0,48(sp)
    800076d8:	02813483          	ld	s1,40(sp)
    800076dc:	02013903          	ld	s2,32(sp)
    800076e0:	01813983          	ld	s3,24(sp)
    800076e4:	04010113          	addi	sp,sp,64
    800076e8:	00008067          	ret

00000000800076ec <_ZN6BufferC1Ei>:
#include "../test_h/buffer.h"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800076ec:	fe010113          	addi	sp,sp,-32
    800076f0:	00113c23          	sd	ra,24(sp)
    800076f4:	00813823          	sd	s0,16(sp)
    800076f8:	00913423          	sd	s1,8(sp)
    800076fc:	01213023          	sd	s2,0(sp)
    80007700:	02010413          	addi	s0,sp,32
    80007704:	00050493          	mv	s1,a0
    80007708:	00058913          	mv	s2,a1
    8000770c:	0015879b          	addiw	a5,a1,1
    80007710:	0007851b          	sext.w	a0,a5
    80007714:	00f4a023          	sw	a5,0(s1)
    80007718:	0004a823          	sw	zero,16(s1)
    8000771c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80007720:	00251513          	slli	a0,a0,0x2
    80007724:	ffffb097          	auipc	ra,0xffffb
    80007728:	a5c080e7          	jalr	-1444(ra) # 80002180 <_Z9mem_allocm>
    8000772c:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80007730:	00000593          	li	a1,0
    80007734:	02048513          	addi	a0,s1,32
    80007738:	ffffb097          	auipc	ra,0xffffb
    8000773c:	bb0080e7          	jalr	-1104(ra) # 800022e8 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80007740:	00090593          	mv	a1,s2
    80007744:	01848513          	addi	a0,s1,24
    80007748:	ffffb097          	auipc	ra,0xffffb
    8000774c:	ba0080e7          	jalr	-1120(ra) # 800022e8 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80007750:	00100593          	li	a1,1
    80007754:	02848513          	addi	a0,s1,40
    80007758:	ffffb097          	auipc	ra,0xffffb
    8000775c:	b90080e7          	jalr	-1136(ra) # 800022e8 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80007760:	00100593          	li	a1,1
    80007764:	03048513          	addi	a0,s1,48
    80007768:	ffffb097          	auipc	ra,0xffffb
    8000776c:	b80080e7          	jalr	-1152(ra) # 800022e8 <_Z8sem_openPP4_semj>
}
    80007770:	01813083          	ld	ra,24(sp)
    80007774:	01013403          	ld	s0,16(sp)
    80007778:	00813483          	ld	s1,8(sp)
    8000777c:	00013903          	ld	s2,0(sp)
    80007780:	02010113          	addi	sp,sp,32
    80007784:	00008067          	ret

0000000080007788 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80007788:	fe010113          	addi	sp,sp,-32
    8000778c:	00113c23          	sd	ra,24(sp)
    80007790:	00813823          	sd	s0,16(sp)
    80007794:	00913423          	sd	s1,8(sp)
    80007798:	01213023          	sd	s2,0(sp)
    8000779c:	02010413          	addi	s0,sp,32
    800077a0:	00050493          	mv	s1,a0
    800077a4:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800077a8:	01853503          	ld	a0,24(a0)
    800077ac:	ffffb097          	auipc	ra,0xffffb
    800077b0:	ba0080e7          	jalr	-1120(ra) # 8000234c <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    800077b4:	0304b503          	ld	a0,48(s1)
    800077b8:	ffffb097          	auipc	ra,0xffffb
    800077bc:	b94080e7          	jalr	-1132(ra) # 8000234c <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    800077c0:	0084b783          	ld	a5,8(s1)
    800077c4:	0144a703          	lw	a4,20(s1)
    800077c8:	00271713          	slli	a4,a4,0x2
    800077cc:	00e787b3          	add	a5,a5,a4
    800077d0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800077d4:	0144a783          	lw	a5,20(s1)
    800077d8:	0017879b          	addiw	a5,a5,1
    800077dc:	0004a703          	lw	a4,0(s1)
    800077e0:	02e7e7bb          	remw	a5,a5,a4
    800077e4:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800077e8:	0304b503          	ld	a0,48(s1)
    800077ec:	ffffb097          	auipc	ra,0xffffb
    800077f0:	b8c080e7          	jalr	-1140(ra) # 80002378 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    800077f4:	0204b503          	ld	a0,32(s1)
    800077f8:	ffffb097          	auipc	ra,0xffffb
    800077fc:	b80080e7          	jalr	-1152(ra) # 80002378 <_Z10sem_signalP4_sem>

}
    80007800:	01813083          	ld	ra,24(sp)
    80007804:	01013403          	ld	s0,16(sp)
    80007808:	00813483          	ld	s1,8(sp)
    8000780c:	00013903          	ld	s2,0(sp)
    80007810:	02010113          	addi	sp,sp,32
    80007814:	00008067          	ret

0000000080007818 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80007818:	fe010113          	addi	sp,sp,-32
    8000781c:	00113c23          	sd	ra,24(sp)
    80007820:	00813823          	sd	s0,16(sp)
    80007824:	00913423          	sd	s1,8(sp)
    80007828:	01213023          	sd	s2,0(sp)
    8000782c:	02010413          	addi	s0,sp,32
    80007830:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80007834:	02053503          	ld	a0,32(a0)
    80007838:	ffffb097          	auipc	ra,0xffffb
    8000783c:	b14080e7          	jalr	-1260(ra) # 8000234c <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80007840:	0284b503          	ld	a0,40(s1)
    80007844:	ffffb097          	auipc	ra,0xffffb
    80007848:	b08080e7          	jalr	-1272(ra) # 8000234c <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    8000784c:	0084b703          	ld	a4,8(s1)
    80007850:	0104a783          	lw	a5,16(s1)
    80007854:	00279693          	slli	a3,a5,0x2
    80007858:	00d70733          	add	a4,a4,a3
    8000785c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80007860:	0017879b          	addiw	a5,a5,1
    80007864:	0004a703          	lw	a4,0(s1)
    80007868:	02e7e7bb          	remw	a5,a5,a4
    8000786c:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80007870:	0284b503          	ld	a0,40(s1)
    80007874:	ffffb097          	auipc	ra,0xffffb
    80007878:	b04080e7          	jalr	-1276(ra) # 80002378 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    8000787c:	0184b503          	ld	a0,24(s1)
    80007880:	ffffb097          	auipc	ra,0xffffb
    80007884:	af8080e7          	jalr	-1288(ra) # 80002378 <_Z10sem_signalP4_sem>

    return ret;
}
    80007888:	00090513          	mv	a0,s2
    8000788c:	01813083          	ld	ra,24(sp)
    80007890:	01013403          	ld	s0,16(sp)
    80007894:	00813483          	ld	s1,8(sp)
    80007898:	00013903          	ld	s2,0(sp)
    8000789c:	02010113          	addi	sp,sp,32
    800078a0:	00008067          	ret

00000000800078a4 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800078a4:	fe010113          	addi	sp,sp,-32
    800078a8:	00113c23          	sd	ra,24(sp)
    800078ac:	00813823          	sd	s0,16(sp)
    800078b0:	00913423          	sd	s1,8(sp)
    800078b4:	01213023          	sd	s2,0(sp)
    800078b8:	02010413          	addi	s0,sp,32
    800078bc:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800078c0:	02853503          	ld	a0,40(a0)
    800078c4:	ffffb097          	auipc	ra,0xffffb
    800078c8:	a88080e7          	jalr	-1400(ra) # 8000234c <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    800078cc:	0304b503          	ld	a0,48(s1)
    800078d0:	ffffb097          	auipc	ra,0xffffb
    800078d4:	a7c080e7          	jalr	-1412(ra) # 8000234c <_Z8sem_waitP4_sem>

    if (tail >= head) {
    800078d8:	0144a783          	lw	a5,20(s1)
    800078dc:	0104a903          	lw	s2,16(s1)
    800078e0:	0327ce63          	blt	a5,s2,8000791c <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800078e4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800078e8:	0304b503          	ld	a0,48(s1)
    800078ec:	ffffb097          	auipc	ra,0xffffb
    800078f0:	a8c080e7          	jalr	-1396(ra) # 80002378 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    800078f4:	0284b503          	ld	a0,40(s1)
    800078f8:	ffffb097          	auipc	ra,0xffffb
    800078fc:	a80080e7          	jalr	-1408(ra) # 80002378 <_Z10sem_signalP4_sem>

    return ret;
}
    80007900:	00090513          	mv	a0,s2
    80007904:	01813083          	ld	ra,24(sp)
    80007908:	01013403          	ld	s0,16(sp)
    8000790c:	00813483          	ld	s1,8(sp)
    80007910:	00013903          	ld	s2,0(sp)
    80007914:	02010113          	addi	sp,sp,32
    80007918:	00008067          	ret
        ret = cap - head + tail;
    8000791c:	0004a703          	lw	a4,0(s1)
    80007920:	4127093b          	subw	s2,a4,s2
    80007924:	00f9093b          	addw	s2,s2,a5
    80007928:	fc1ff06f          	j	800078e8 <_ZN6Buffer6getCntEv+0x44>

000000008000792c <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    8000792c:	fe010113          	addi	sp,sp,-32
    80007930:	00113c23          	sd	ra,24(sp)
    80007934:	00813823          	sd	s0,16(sp)
    80007938:	00913423          	sd	s1,8(sp)
    8000793c:	02010413          	addi	s0,sp,32
    80007940:	00050493          	mv	s1,a0
    putc('\n');
    80007944:	00a00513          	li	a0,10
    80007948:	ffffb097          	auipc	ra,0xffffb
    8000794c:	ae0080e7          	jalr	-1312(ra) # 80002428 <_Z4putcc>
    printString("Buffer deleted!\n");
    80007950:	00005517          	auipc	a0,0x5
    80007954:	06850513          	addi	a0,a0,104 # 8000c9b8 <CONSOLE_STATUS+0x9a8>
    80007958:	00000097          	auipc	ra,0x0
    8000795c:	ac4080e7          	jalr	-1340(ra) # 8000741c <_Z11printStringPKc>
    while (getCnt() > 0) {
    80007960:	00048513          	mv	a0,s1
    80007964:	00000097          	auipc	ra,0x0
    80007968:	f40080e7          	jalr	-192(ra) # 800078a4 <_ZN6Buffer6getCntEv>
    8000796c:	02a05c63          	blez	a0,800079a4 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80007970:	0084b783          	ld	a5,8(s1)
    80007974:	0104a703          	lw	a4,16(s1)
    80007978:	00271713          	slli	a4,a4,0x2
    8000797c:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80007980:	0007c503          	lbu	a0,0(a5)
    80007984:	ffffb097          	auipc	ra,0xffffb
    80007988:	aa4080e7          	jalr	-1372(ra) # 80002428 <_Z4putcc>
        head = (head + 1) % cap;
    8000798c:	0104a783          	lw	a5,16(s1)
    80007990:	0017879b          	addiw	a5,a5,1
    80007994:	0004a703          	lw	a4,0(s1)
    80007998:	02e7e7bb          	remw	a5,a5,a4
    8000799c:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800079a0:	fc1ff06f          	j	80007960 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800079a4:	02100513          	li	a0,33
    800079a8:	ffffb097          	auipc	ra,0xffffb
    800079ac:	a80080e7          	jalr	-1408(ra) # 80002428 <_Z4putcc>
    putc('\n');
    800079b0:	00a00513          	li	a0,10
    800079b4:	ffffb097          	auipc	ra,0xffffb
    800079b8:	a74080e7          	jalr	-1420(ra) # 80002428 <_Z4putcc>
    mem_free(buffer);
    800079bc:	0084b503          	ld	a0,8(s1)
    800079c0:	ffffa097          	auipc	ra,0xffffa
    800079c4:	7f0080e7          	jalr	2032(ra) # 800021b0 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800079c8:	0204b503          	ld	a0,32(s1)
    800079cc:	ffffb097          	auipc	ra,0xffffb
    800079d0:	954080e7          	jalr	-1708(ra) # 80002320 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    800079d4:	0184b503          	ld	a0,24(s1)
    800079d8:	ffffb097          	auipc	ra,0xffffb
    800079dc:	948080e7          	jalr	-1720(ra) # 80002320 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    800079e0:	0304b503          	ld	a0,48(s1)
    800079e4:	ffffb097          	auipc	ra,0xffffb
    800079e8:	93c080e7          	jalr	-1732(ra) # 80002320 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    800079ec:	0284b503          	ld	a0,40(s1)
    800079f0:	ffffb097          	auipc	ra,0xffffb
    800079f4:	930080e7          	jalr	-1744(ra) # 80002320 <_Z9sem_closeP4_sem>
}
    800079f8:	01813083          	ld	ra,24(sp)
    800079fc:	01013403          	ld	s0,16(sp)
    80007a00:	00813483          	ld	s1,8(sp)
    80007a04:	02010113          	addi	sp,sp,32
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
    80007a3c:	9c4080e7          	jalr	-1596(ra) # 800013fc <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80007a40:	ffffb097          	auipc	ra,0xffffb
    80007a44:	9c0080e7          	jalr	-1600(ra) # 80002400 <_Z4getcv>
    80007a48:	0005059b          	sext.w	a1,a0
    80007a4c:	01b00793          	li	a5,27
    80007a50:	02f58a63          	beq	a1,a5,80007a84 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80007a54:	0084b503          	ld	a0,8(s1)
    80007a58:	fffff097          	auipc	ra,0xfffff
    80007a5c:	720080e7          	jalr	1824(ra) # 80007178 <_ZN9BufferCPP3putEi>
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
    80007a88:	00008717          	auipc	a4,0x8
    80007a8c:	96f72423          	sw	a5,-1688(a4) # 8000f3f0 <_ZL9threadEnd>
    td->buffer->put('!');
    80007a90:	0209b783          	ld	a5,32(s3)
    80007a94:	02100593          	li	a1,33
    80007a98:	0087b503          	ld	a0,8(a5)
    80007a9c:	fffff097          	auipc	ra,0xfffff
    80007aa0:	6dc080e7          	jalr	1756(ra) # 80007178 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80007aa4:	0104b503          	ld	a0,16(s1)
    80007aa8:	ffffa097          	auipc	ra,0xffffa
    80007aac:	a74080e7          	jalr	-1420(ra) # 8000151c <_ZN9Semaphore6signalEv>
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
    80007af4:	90c080e7          	jalr	-1780(ra) # 800013fc <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80007af8:	00008797          	auipc	a5,0x8
    80007afc:	8f87a783          	lw	a5,-1800(a5) # 8000f3f0 <_ZL9threadEnd>
    80007b00:	02079e63          	bnez	a5,80007b3c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80007b04:	0004a583          	lw	a1,0(s1)
    80007b08:	0305859b          	addiw	a1,a1,48
    80007b0c:	0084b503          	ld	a0,8(s1)
    80007b10:	fffff097          	auipc	ra,0xfffff
    80007b14:	668080e7          	jalr	1640(ra) # 80007178 <_ZN9BufferCPP3putEi>
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
    80007b44:	9dc080e7          	jalr	-1572(ra) # 8000151c <_ZN9Semaphore6signalEv>
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
    80007b90:	ffffa097          	auipc	ra,0xffffa
    80007b94:	86c080e7          	jalr	-1940(ra) # 800013fc <_ZN6Thread8dispatchEv>
    80007b98:	0500006f          	j	80007be8 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80007b9c:	00a00513          	li	a0,10
    80007ba0:	ffffb097          	auipc	ra,0xffffb
    80007ba4:	888080e7          	jalr	-1912(ra) # 80002428 <_Z4putcc>
    while (!threadEnd) {
    80007ba8:	00008797          	auipc	a5,0x8
    80007bac:	8487a783          	lw	a5,-1976(a5) # 8000f3f0 <_ZL9threadEnd>
    80007bb0:	06079263          	bnez	a5,80007c14 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80007bb4:	00893503          	ld	a0,8(s2)
    80007bb8:	fffff097          	auipc	ra,0xfffff
    80007bbc:	650080e7          	jalr	1616(ra) # 80007208 <_ZN9BufferCPP3getEv>
        i++;
    80007bc0:	001a049b          	addiw	s1,s4,1
    80007bc4:	00048a1b          	sext.w	s4,s1
        putc(key);
    80007bc8:	0ff57513          	andi	a0,a0,255
    80007bcc:	ffffb097          	auipc	ra,0xffffb
    80007bd0:	85c080e7          	jalr	-1956(ra) # 80002428 <_Z4putcc>
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
    80007c04:	608080e7          	jalr	1544(ra) # 80007208 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80007c08:	0ff57513          	andi	a0,a0,255
    80007c0c:	ffffa097          	auipc	ra,0xffffa
    80007c10:	a1c080e7          	jalr	-1508(ra) # 80001628 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80007c14:	0209b783          	ld	a5,32(s3)
    80007c18:	0087b503          	ld	a0,8(a5)
    80007c1c:	fffff097          	auipc	ra,0xfffff
    80007c20:	678080e7          	jalr	1656(ra) # 80007294 <_ZN9BufferCPP6getCntEv>
    80007c24:	fca04ae3          	bgtz	a0,80007bf8 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80007c28:	01093503          	ld	a0,16(s2)
    80007c2c:	ffffa097          	auipc	ra,0xffffa
    80007c30:	8f0080e7          	jalr	-1808(ra) # 8000151c <_ZN9Semaphore6signalEv>
    printString("Thread "); printInt(data->id); printString(" end.\n");
    80007c34:	00005517          	auipc	a0,0x5
    80007c38:	d9c50513          	addi	a0,a0,-612 # 8000c9d0 <CONSOLE_STATUS+0x9c0>
    80007c3c:	fffff097          	auipc	ra,0xfffff
    80007c40:	7e0080e7          	jalr	2016(ra) # 8000741c <_Z11printStringPKc>
    80007c44:	00000613          	li	a2,0
    80007c48:	00a00593          	li	a1,10
    80007c4c:	00092503          	lw	a0,0(s2)
    80007c50:	00000097          	auipc	ra,0x0
    80007c54:	97c080e7          	jalr	-1668(ra) # 800075cc <_Z8printIntiii>
    80007c58:	00005517          	auipc	a0,0x5
    80007c5c:	d8050513          	addi	a0,a0,-640 # 8000c9d8 <CONSOLE_STATUS+0x9c8>
    80007c60:	fffff097          	auipc	ra,0xfffff
    80007c64:	7bc080e7          	jalr	1980(ra) # 8000741c <_Z11printStringPKc>
}
    80007c68:	02813083          	ld	ra,40(sp)
    80007c6c:	02013403          	ld	s0,32(sp)
    80007c70:	01813483          	ld	s1,24(sp)
    80007c74:	01013903          	ld	s2,16(sp)
    80007c78:	00813983          	ld	s3,8(sp)
    80007c7c:	00013a03          	ld	s4,0(sp)
    80007c80:	03010113          	addi	sp,sp,48
    80007c84:	00008067          	ret

0000000080007c88 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80007c88:	f8010113          	addi	sp,sp,-128
    80007c8c:	06113c23          	sd	ra,120(sp)
    80007c90:	06813823          	sd	s0,112(sp)
    80007c94:	06913423          	sd	s1,104(sp)
    80007c98:	07213023          	sd	s2,96(sp)
    80007c9c:	05313c23          	sd	s3,88(sp)
    80007ca0:	05413823          	sd	s4,80(sp)
    80007ca4:	05513423          	sd	s5,72(sp)
    80007ca8:	05613023          	sd	s6,64(sp)
    80007cac:	03713c23          	sd	s7,56(sp)
    80007cb0:	03813823          	sd	s8,48(sp)
    80007cb4:	03913423          	sd	s9,40(sp)
    80007cb8:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80007cbc:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80007cc0:	00005517          	auipc	a0,0x5
    80007cc4:	98050513          	addi	a0,a0,-1664 # 8000c640 <CONSOLE_STATUS+0x630>
    80007cc8:	fffff097          	auipc	ra,0xfffff
    80007ccc:	754080e7          	jalr	1876(ra) # 8000741c <_Z11printStringPKc>
    getString(input, 30);
    80007cd0:	01e00593          	li	a1,30
    80007cd4:	f8040493          	addi	s1,s0,-128
    80007cd8:	00048513          	mv	a0,s1
    80007cdc:	fffff097          	auipc	ra,0xfffff
    80007ce0:	7c8080e7          	jalr	1992(ra) # 800074a4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80007ce4:	00048513          	mv	a0,s1
    80007ce8:	00000097          	auipc	ra,0x0
    80007cec:	894080e7          	jalr	-1900(ra) # 8000757c <_Z11stringToIntPKc>
    80007cf0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80007cf4:	00005517          	auipc	a0,0x5
    80007cf8:	96c50513          	addi	a0,a0,-1684 # 8000c660 <CONSOLE_STATUS+0x650>
    80007cfc:	fffff097          	auipc	ra,0xfffff
    80007d00:	720080e7          	jalr	1824(ra) # 8000741c <_Z11printStringPKc>
    getString(input, 30);
    80007d04:	01e00593          	li	a1,30
    80007d08:	00048513          	mv	a0,s1
    80007d0c:	fffff097          	auipc	ra,0xfffff
    80007d10:	798080e7          	jalr	1944(ra) # 800074a4 <_Z9getStringPci>
    n = stringToInt(input);
    80007d14:	00048513          	mv	a0,s1
    80007d18:	00000097          	auipc	ra,0x0
    80007d1c:	864080e7          	jalr	-1948(ra) # 8000757c <_Z11stringToIntPKc>
    80007d20:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80007d24:	00005517          	auipc	a0,0x5
    80007d28:	95c50513          	addi	a0,a0,-1700 # 8000c680 <CONSOLE_STATUS+0x670>
    80007d2c:	fffff097          	auipc	ra,0xfffff
    80007d30:	6f0080e7          	jalr	1776(ra) # 8000741c <_Z11printStringPKc>
    80007d34:	00000613          	li	a2,0
    80007d38:	00a00593          	li	a1,10
    80007d3c:	00090513          	mv	a0,s2
    80007d40:	00000097          	auipc	ra,0x0
    80007d44:	88c080e7          	jalr	-1908(ra) # 800075cc <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80007d48:	00005517          	auipc	a0,0x5
    80007d4c:	95050513          	addi	a0,a0,-1712 # 8000c698 <CONSOLE_STATUS+0x688>
    80007d50:	fffff097          	auipc	ra,0xfffff
    80007d54:	6cc080e7          	jalr	1740(ra) # 8000741c <_Z11printStringPKc>
    80007d58:	00000613          	li	a2,0
    80007d5c:	00a00593          	li	a1,10
    80007d60:	00048513          	mv	a0,s1
    80007d64:	00000097          	auipc	ra,0x0
    80007d68:	868080e7          	jalr	-1944(ra) # 800075cc <_Z8printIntiii>
    printString(".\n");
    80007d6c:	00005517          	auipc	a0,0x5
    80007d70:	94450513          	addi	a0,a0,-1724 # 8000c6b0 <CONSOLE_STATUS+0x6a0>
    80007d74:	fffff097          	auipc	ra,0xfffff
    80007d78:	6a8080e7          	jalr	1704(ra) # 8000741c <_Z11printStringPKc>
    if(threadNum > n) {
    80007d7c:	0324c463          	blt	s1,s2,80007da4 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80007d80:	03205c63          	blez	s2,80007db8 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80007d84:	03800513          	li	a0,56
    80007d88:	ffff9097          	auipc	ra,0xffff9
    80007d8c:	518080e7          	jalr	1304(ra) # 800012a0 <_Znwm>
    80007d90:	00050a93          	mv	s5,a0
    80007d94:	00048593          	mv	a1,s1
    80007d98:	fffff097          	auipc	ra,0xfffff
    80007d9c:	28c080e7          	jalr	652(ra) # 80007024 <_ZN9BufferCPPC1Ei>
    80007da0:	0300006f          	j	80007dd0 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80007da4:	00005517          	auipc	a0,0x5
    80007da8:	91450513          	addi	a0,a0,-1772 # 8000c6b8 <CONSOLE_STATUS+0x6a8>
    80007dac:	fffff097          	auipc	ra,0xfffff
    80007db0:	670080e7          	jalr	1648(ra) # 8000741c <_Z11printStringPKc>
        return;
    80007db4:	0140006f          	j	80007dc8 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80007db8:	00005517          	auipc	a0,0x5
    80007dbc:	94050513          	addi	a0,a0,-1728 # 8000c6f8 <CONSOLE_STATUS+0x6e8>
    80007dc0:	fffff097          	auipc	ra,0xfffff
    80007dc4:	65c080e7          	jalr	1628(ra) # 8000741c <_Z11printStringPKc>
        return;
    80007dc8:	000b8113          	mv	sp,s7
    80007dcc:	2380006f          	j	80008004 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80007dd0:	01000513          	li	a0,16
    80007dd4:	ffff9097          	auipc	ra,0xffff9
    80007dd8:	4cc080e7          	jalr	1228(ra) # 800012a0 <_Znwm>
    80007ddc:	00050493          	mv	s1,a0
    80007de0:	00000593          	li	a1,0
    80007de4:	ffff9097          	auipc	ra,0xffff9
    80007de8:	6d4080e7          	jalr	1748(ra) # 800014b8 <_ZN9SemaphoreC1Ej>
    80007dec:	00007797          	auipc	a5,0x7
    80007df0:	6097b623          	sd	s1,1548(a5) # 8000f3f8 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80007df4:	00391793          	slli	a5,s2,0x3
    80007df8:	00f78793          	addi	a5,a5,15
    80007dfc:	ff07f793          	andi	a5,a5,-16
    80007e00:	40f10133          	sub	sp,sp,a5
    80007e04:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80007e08:	0019071b          	addiw	a4,s2,1
    80007e0c:	00171793          	slli	a5,a4,0x1
    80007e10:	00e787b3          	add	a5,a5,a4
    80007e14:	00379793          	slli	a5,a5,0x3
    80007e18:	00f78793          	addi	a5,a5,15
    80007e1c:	ff07f793          	andi	a5,a5,-16
    80007e20:	40f10133          	sub	sp,sp,a5
    80007e24:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80007e28:	00191c13          	slli	s8,s2,0x1
    80007e2c:	012c07b3          	add	a5,s8,s2
    80007e30:	00379793          	slli	a5,a5,0x3
    80007e34:	00fa07b3          	add	a5,s4,a5
    80007e38:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80007e3c:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80007e40:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80007e44:	02800513          	li	a0,40
    80007e48:	ffff9097          	auipc	ra,0xffff9
    80007e4c:	458080e7          	jalr	1112(ra) # 800012a0 <_Znwm>
    80007e50:	00050b13          	mv	s6,a0
    80007e54:	012c0c33          	add	s8,s8,s2
    80007e58:	003c1c13          	slli	s8,s8,0x3
    80007e5c:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80007e60:	ffff9097          	auipc	ra,0xffff9
    80007e64:	624080e7          	jalr	1572(ra) # 80001484 <_ZN6ThreadC1Ev>
    80007e68:	00007797          	auipc	a5,0x7
    80007e6c:	33078793          	addi	a5,a5,816 # 8000f198 <_ZTV12ConsumerSync+0x10>
    80007e70:	00fb3023          	sd	a5,0(s6)
    80007e74:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80007e78:	000b0513          	mv	a0,s6
    80007e7c:	ffff9097          	auipc	ra,0xffff9
    80007e80:	520080e7          	jalr	1312(ra) # 8000139c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80007e84:	00000493          	li	s1,0
    80007e88:	0380006f          	j	80007ec0 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80007e8c:	00007797          	auipc	a5,0x7
    80007e90:	2e478793          	addi	a5,a5,740 # 8000f170 <_ZTV12ProducerSync+0x10>
    80007e94:	00fcb023          	sd	a5,0(s9)
    80007e98:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80007e9c:	00349793          	slli	a5,s1,0x3
    80007ea0:	00f987b3          	add	a5,s3,a5
    80007ea4:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80007ea8:	00349793          	slli	a5,s1,0x3
    80007eac:	00f987b3          	add	a5,s3,a5
    80007eb0:	0007b503          	ld	a0,0(a5)
    80007eb4:	ffff9097          	auipc	ra,0xffff9
    80007eb8:	4e8080e7          	jalr	1256(ra) # 8000139c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80007ebc:	0014849b          	addiw	s1,s1,1
    80007ec0:	0b24d063          	bge	s1,s2,80007f60 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80007ec4:	00149793          	slli	a5,s1,0x1
    80007ec8:	009787b3          	add	a5,a5,s1
    80007ecc:	00379793          	slli	a5,a5,0x3
    80007ed0:	00fa07b3          	add	a5,s4,a5
    80007ed4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80007ed8:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80007edc:	00007717          	auipc	a4,0x7
    80007ee0:	51c73703          	ld	a4,1308(a4) # 8000f3f8 <_ZL10waitForAll>
    80007ee4:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80007ee8:	02905863          	blez	s1,80007f18 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80007eec:	02800513          	li	a0,40
    80007ef0:	ffff9097          	auipc	ra,0xffff9
    80007ef4:	3b0080e7          	jalr	944(ra) # 800012a0 <_Znwm>
    80007ef8:	00050c93          	mv	s9,a0
    80007efc:	00149c13          	slli	s8,s1,0x1
    80007f00:	009c0c33          	add	s8,s8,s1
    80007f04:	003c1c13          	slli	s8,s8,0x3
    80007f08:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80007f0c:	ffff9097          	auipc	ra,0xffff9
    80007f10:	578080e7          	jalr	1400(ra) # 80001484 <_ZN6ThreadC1Ev>
    80007f14:	f79ff06f          	j	80007e8c <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80007f18:	02800513          	li	a0,40
    80007f1c:	ffff9097          	auipc	ra,0xffff9
    80007f20:	384080e7          	jalr	900(ra) # 800012a0 <_Znwm>
    80007f24:	00050c93          	mv	s9,a0
    80007f28:	00149c13          	slli	s8,s1,0x1
    80007f2c:	009c0c33          	add	s8,s8,s1
    80007f30:	003c1c13          	slli	s8,s8,0x3
    80007f34:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80007f38:	ffff9097          	auipc	ra,0xffff9
    80007f3c:	54c080e7          	jalr	1356(ra) # 80001484 <_ZN6ThreadC1Ev>
    80007f40:	00007797          	auipc	a5,0x7
    80007f44:	20878793          	addi	a5,a5,520 # 8000f148 <_ZTV16ProducerKeyboard+0x10>
    80007f48:	00fcb023          	sd	a5,0(s9)
    80007f4c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80007f50:	00349793          	slli	a5,s1,0x3
    80007f54:	00f987b3          	add	a5,s3,a5
    80007f58:	0197b023          	sd	s9,0(a5)
    80007f5c:	f4dff06f          	j	80007ea8 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80007f60:	ffff9097          	auipc	ra,0xffff9
    80007f64:	49c080e7          	jalr	1180(ra) # 800013fc <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80007f68:	00000493          	li	s1,0
    80007f6c:	00994e63          	blt	s2,s1,80007f88 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80007f70:	00007517          	auipc	a0,0x7
    80007f74:	48853503          	ld	a0,1160(a0) # 8000f3f8 <_ZL10waitForAll>
    80007f78:	ffff9097          	auipc	ra,0xffff9
    80007f7c:	578080e7          	jalr	1400(ra) # 800014f0 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80007f80:	0014849b          	addiw	s1,s1,1
    80007f84:	fe9ff06f          	j	80007f6c <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80007f88:	00000493          	li	s1,0
    80007f8c:	0080006f          	j	80007f94 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80007f90:	0014849b          	addiw	s1,s1,1
    80007f94:	0324d263          	bge	s1,s2,80007fb8 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80007f98:	00349793          	slli	a5,s1,0x3
    80007f9c:	00f987b3          	add	a5,s3,a5
    80007fa0:	0007b503          	ld	a0,0(a5)
    80007fa4:	fe0506e3          	beqz	a0,80007f90 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80007fa8:	00053783          	ld	a5,0(a0)
    80007fac:	0087b783          	ld	a5,8(a5)
    80007fb0:	000780e7          	jalr	a5
    80007fb4:	fddff06f          	j	80007f90 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80007fb8:	000b0a63          	beqz	s6,80007fcc <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80007fbc:	000b3783          	ld	a5,0(s6)
    80007fc0:	0087b783          	ld	a5,8(a5)
    80007fc4:	000b0513          	mv	a0,s6
    80007fc8:	000780e7          	jalr	a5
    delete waitForAll;
    80007fcc:	00007517          	auipc	a0,0x7
    80007fd0:	42c53503          	ld	a0,1068(a0) # 8000f3f8 <_ZL10waitForAll>
    80007fd4:	00050863          	beqz	a0,80007fe4 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80007fd8:	00053783          	ld	a5,0(a0)
    80007fdc:	0087b783          	ld	a5,8(a5)
    80007fe0:	000780e7          	jalr	a5
    delete buffer;
    80007fe4:	000a8e63          	beqz	s5,80008000 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80007fe8:	000a8513          	mv	a0,s5
    80007fec:	fffff097          	auipc	ra,0xfffff
    80007ff0:	330080e7          	jalr	816(ra) # 8000731c <_ZN9BufferCPPD1Ev>
    80007ff4:	000a8513          	mv	a0,s5
    80007ff8:	ffff9097          	auipc	ra,0xffff9
    80007ffc:	2d0080e7          	jalr	720(ra) # 800012c8 <_ZdlPv>
    80008000:	000b8113          	mv	sp,s7

}
    80008004:	f8040113          	addi	sp,s0,-128
    80008008:	07813083          	ld	ra,120(sp)
    8000800c:	07013403          	ld	s0,112(sp)
    80008010:	06813483          	ld	s1,104(sp)
    80008014:	06013903          	ld	s2,96(sp)
    80008018:	05813983          	ld	s3,88(sp)
    8000801c:	05013a03          	ld	s4,80(sp)
    80008020:	04813a83          	ld	s5,72(sp)
    80008024:	04013b03          	ld	s6,64(sp)
    80008028:	03813b83          	ld	s7,56(sp)
    8000802c:	03013c03          	ld	s8,48(sp)
    80008030:	02813c83          	ld	s9,40(sp)
    80008034:	08010113          	addi	sp,sp,128
    80008038:	00008067          	ret
    8000803c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80008040:	000a8513          	mv	a0,s5
    80008044:	ffff9097          	auipc	ra,0xffff9
    80008048:	284080e7          	jalr	644(ra) # 800012c8 <_ZdlPv>
    8000804c:	00048513          	mv	a0,s1
    80008050:	00008097          	auipc	ra,0x8
    80008054:	498080e7          	jalr	1176(ra) # 800104e8 <_Unwind_Resume>
    80008058:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    8000805c:	00048513          	mv	a0,s1
    80008060:	ffff9097          	auipc	ra,0xffff9
    80008064:	268080e7          	jalr	616(ra) # 800012c8 <_ZdlPv>
    80008068:	00090513          	mv	a0,s2
    8000806c:	00008097          	auipc	ra,0x8
    80008070:	47c080e7          	jalr	1148(ra) # 800104e8 <_Unwind_Resume>
    80008074:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80008078:	000b0513          	mv	a0,s6
    8000807c:	ffff9097          	auipc	ra,0xffff9
    80008080:	24c080e7          	jalr	588(ra) # 800012c8 <_ZdlPv>
    80008084:	00048513          	mv	a0,s1
    80008088:	00008097          	auipc	ra,0x8
    8000808c:	460080e7          	jalr	1120(ra) # 800104e8 <_Unwind_Resume>
    80008090:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80008094:	000c8513          	mv	a0,s9
    80008098:	ffff9097          	auipc	ra,0xffff9
    8000809c:	230080e7          	jalr	560(ra) # 800012c8 <_ZdlPv>
    800080a0:	00048513          	mv	a0,s1
    800080a4:	00008097          	auipc	ra,0x8
    800080a8:	444080e7          	jalr	1092(ra) # 800104e8 <_Unwind_Resume>
    800080ac:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800080b0:	000c8513          	mv	a0,s9
    800080b4:	ffff9097          	auipc	ra,0xffff9
    800080b8:	214080e7          	jalr	532(ra) # 800012c8 <_ZdlPv>
    800080bc:	00048513          	mv	a0,s1
    800080c0:	00008097          	auipc	ra,0x8
    800080c4:	428080e7          	jalr	1064(ra) # 800104e8 <_Unwind_Resume>

00000000800080c8 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800080c8:	ff010113          	addi	sp,sp,-16
    800080cc:	00113423          	sd	ra,8(sp)
    800080d0:	00813023          	sd	s0,0(sp)
    800080d4:	01010413          	addi	s0,sp,16
    800080d8:	00007797          	auipc	a5,0x7
    800080dc:	0c078793          	addi	a5,a5,192 # 8000f198 <_ZTV12ConsumerSync+0x10>
    800080e0:	00f53023          	sd	a5,0(a0)
    800080e4:	ffff9097          	auipc	ra,0xffff9
    800080e8:	0ec080e7          	jalr	236(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800080ec:	00813083          	ld	ra,8(sp)
    800080f0:	00013403          	ld	s0,0(sp)
    800080f4:	01010113          	addi	sp,sp,16
    800080f8:	00008067          	ret

00000000800080fc <_ZN12ConsumerSyncD0Ev>:
    800080fc:	fe010113          	addi	sp,sp,-32
    80008100:	00113c23          	sd	ra,24(sp)
    80008104:	00813823          	sd	s0,16(sp)
    80008108:	00913423          	sd	s1,8(sp)
    8000810c:	02010413          	addi	s0,sp,32
    80008110:	00050493          	mv	s1,a0
    80008114:	00007797          	auipc	a5,0x7
    80008118:	08478793          	addi	a5,a5,132 # 8000f198 <_ZTV12ConsumerSync+0x10>
    8000811c:	00f53023          	sd	a5,0(a0)
    80008120:	ffff9097          	auipc	ra,0xffff9
    80008124:	0b0080e7          	jalr	176(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008128:	00048513          	mv	a0,s1
    8000812c:	ffff9097          	auipc	ra,0xffff9
    80008130:	19c080e7          	jalr	412(ra) # 800012c8 <_ZdlPv>
    80008134:	01813083          	ld	ra,24(sp)
    80008138:	01013403          	ld	s0,16(sp)
    8000813c:	00813483          	ld	s1,8(sp)
    80008140:	02010113          	addi	sp,sp,32
    80008144:	00008067          	ret

0000000080008148 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80008148:	ff010113          	addi	sp,sp,-16
    8000814c:	00113423          	sd	ra,8(sp)
    80008150:	00813023          	sd	s0,0(sp)
    80008154:	01010413          	addi	s0,sp,16
    80008158:	00007797          	auipc	a5,0x7
    8000815c:	01878793          	addi	a5,a5,24 # 8000f170 <_ZTV12ProducerSync+0x10>
    80008160:	00f53023          	sd	a5,0(a0)
    80008164:	ffff9097          	auipc	ra,0xffff9
    80008168:	06c080e7          	jalr	108(ra) # 800011d0 <_ZN6ThreadD1Ev>
    8000816c:	00813083          	ld	ra,8(sp)
    80008170:	00013403          	ld	s0,0(sp)
    80008174:	01010113          	addi	sp,sp,16
    80008178:	00008067          	ret

000000008000817c <_ZN12ProducerSyncD0Ev>:
    8000817c:	fe010113          	addi	sp,sp,-32
    80008180:	00113c23          	sd	ra,24(sp)
    80008184:	00813823          	sd	s0,16(sp)
    80008188:	00913423          	sd	s1,8(sp)
    8000818c:	02010413          	addi	s0,sp,32
    80008190:	00050493          	mv	s1,a0
    80008194:	00007797          	auipc	a5,0x7
    80008198:	fdc78793          	addi	a5,a5,-36 # 8000f170 <_ZTV12ProducerSync+0x10>
    8000819c:	00f53023          	sd	a5,0(a0)
    800081a0:	ffff9097          	auipc	ra,0xffff9
    800081a4:	030080e7          	jalr	48(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800081a8:	00048513          	mv	a0,s1
    800081ac:	ffff9097          	auipc	ra,0xffff9
    800081b0:	11c080e7          	jalr	284(ra) # 800012c8 <_ZdlPv>
    800081b4:	01813083          	ld	ra,24(sp)
    800081b8:	01013403          	ld	s0,16(sp)
    800081bc:	00813483          	ld	s1,8(sp)
    800081c0:	02010113          	addi	sp,sp,32
    800081c4:	00008067          	ret

00000000800081c8 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800081c8:	ff010113          	addi	sp,sp,-16
    800081cc:	00113423          	sd	ra,8(sp)
    800081d0:	00813023          	sd	s0,0(sp)
    800081d4:	01010413          	addi	s0,sp,16
    800081d8:	00007797          	auipc	a5,0x7
    800081dc:	f7078793          	addi	a5,a5,-144 # 8000f148 <_ZTV16ProducerKeyboard+0x10>
    800081e0:	00f53023          	sd	a5,0(a0)
    800081e4:	ffff9097          	auipc	ra,0xffff9
    800081e8:	fec080e7          	jalr	-20(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800081ec:	00813083          	ld	ra,8(sp)
    800081f0:	00013403          	ld	s0,0(sp)
    800081f4:	01010113          	addi	sp,sp,16
    800081f8:	00008067          	ret

00000000800081fc <_ZN16ProducerKeyboardD0Ev>:
    800081fc:	fe010113          	addi	sp,sp,-32
    80008200:	00113c23          	sd	ra,24(sp)
    80008204:	00813823          	sd	s0,16(sp)
    80008208:	00913423          	sd	s1,8(sp)
    8000820c:	02010413          	addi	s0,sp,32
    80008210:	00050493          	mv	s1,a0
    80008214:	00007797          	auipc	a5,0x7
    80008218:	f3478793          	addi	a5,a5,-204 # 8000f148 <_ZTV16ProducerKeyboard+0x10>
    8000821c:	00f53023          	sd	a5,0(a0)
    80008220:	ffff9097          	auipc	ra,0xffff9
    80008224:	fb0080e7          	jalr	-80(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008228:	00048513          	mv	a0,s1
    8000822c:	ffff9097          	auipc	ra,0xffff9
    80008230:	09c080e7          	jalr	156(ra) # 800012c8 <_ZdlPv>
    80008234:	01813083          	ld	ra,24(sp)
    80008238:	01013403          	ld	s0,16(sp)
    8000823c:	00813483          	ld	s1,8(sp)
    80008240:	02010113          	addi	sp,sp,32
    80008244:	00008067          	ret

0000000080008248 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80008248:	ff010113          	addi	sp,sp,-16
    8000824c:	00113423          	sd	ra,8(sp)
    80008250:	00813023          	sd	s0,0(sp)
    80008254:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80008258:	02053583          	ld	a1,32(a0)
    8000825c:	fffff097          	auipc	ra,0xfffff
    80008260:	7b0080e7          	jalr	1968(ra) # 80007a0c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80008264:	00813083          	ld	ra,8(sp)
    80008268:	00013403          	ld	s0,0(sp)
    8000826c:	01010113          	addi	sp,sp,16
    80008270:	00008067          	ret

0000000080008274 <_ZN12ProducerSync3runEv>:
    void run() override {
    80008274:	ff010113          	addi	sp,sp,-16
    80008278:	00113423          	sd	ra,8(sp)
    8000827c:	00813023          	sd	s0,0(sp)
    80008280:	01010413          	addi	s0,sp,16
        producer(td);
    80008284:	02053583          	ld	a1,32(a0)
    80008288:	00000097          	auipc	ra,0x0
    8000828c:	844080e7          	jalr	-1980(ra) # 80007acc <_ZN12ProducerSync8producerEPv>
    }
    80008290:	00813083          	ld	ra,8(sp)
    80008294:	00013403          	ld	s0,0(sp)
    80008298:	01010113          	addi	sp,sp,16
    8000829c:	00008067          	ret

00000000800082a0 <_ZN12ConsumerSync3runEv>:
    void run() override {
    800082a0:	ff010113          	addi	sp,sp,-16
    800082a4:	00113423          	sd	ra,8(sp)
    800082a8:	00813023          	sd	s0,0(sp)
    800082ac:	01010413          	addi	s0,sp,16
        consumer(td);
    800082b0:	02053583          	ld	a1,32(a0)
    800082b4:	00000097          	auipc	ra,0x0
    800082b8:	8ac080e7          	jalr	-1876(ra) # 80007b60 <_ZN12ConsumerSync8consumerEPv>
    }
    800082bc:	00813083          	ld	ra,8(sp)
    800082c0:	00013403          	ld	s0,0(sp)
    800082c4:	01010113          	addi	sp,sp,16
    800082c8:	00008067          	ret

00000000800082cc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800082cc:	fe010113          	addi	sp,sp,-32
    800082d0:	00113c23          	sd	ra,24(sp)
    800082d4:	00813823          	sd	s0,16(sp)
    800082d8:	00913423          	sd	s1,8(sp)
    800082dc:	01213023          	sd	s2,0(sp)
    800082e0:	02010413          	addi	s0,sp,32
    800082e4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800082e8:	00100793          	li	a5,1
    800082ec:	02a7f863          	bgeu	a5,a0,8000831c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800082f0:	00a00793          	li	a5,10
    800082f4:	02f577b3          	remu	a5,a0,a5
    800082f8:	02078e63          	beqz	a5,80008334 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800082fc:	fff48513          	addi	a0,s1,-1
    80008300:	00000097          	auipc	ra,0x0
    80008304:	fcc080e7          	jalr	-52(ra) # 800082cc <_ZL9fibonaccim>
    80008308:	00050913          	mv	s2,a0
    8000830c:	ffe48513          	addi	a0,s1,-2
    80008310:	00000097          	auipc	ra,0x0
    80008314:	fbc080e7          	jalr	-68(ra) # 800082cc <_ZL9fibonaccim>
    80008318:	00a90533          	add	a0,s2,a0
}
    8000831c:	01813083          	ld	ra,24(sp)
    80008320:	01013403          	ld	s0,16(sp)
    80008324:	00813483          	ld	s1,8(sp)
    80008328:	00013903          	ld	s2,0(sp)
    8000832c:	02010113          	addi	sp,sp,32
    80008330:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80008334:	ffffa097          	auipc	ra,0xffffa
    80008338:	f44080e7          	jalr	-188(ra) # 80002278 <_Z15thread_dispatchv>
    8000833c:	fc1ff06f          	j	800082fc <_ZL9fibonaccim+0x30>

0000000080008340 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80008340:	fe010113          	addi	sp,sp,-32
    80008344:	00113c23          	sd	ra,24(sp)
    80008348:	00813823          	sd	s0,16(sp)
    8000834c:	00913423          	sd	s1,8(sp)
    80008350:	01213023          	sd	s2,0(sp)
    80008354:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80008358:	00000913          	li	s2,0
    8000835c:	0380006f          	j	80008394 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80008360:	ffffa097          	auipc	ra,0xffffa
    80008364:	f18080e7          	jalr	-232(ra) # 80002278 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80008368:	00148493          	addi	s1,s1,1
    8000836c:	000027b7          	lui	a5,0x2
    80008370:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80008374:	0097ee63          	bltu	a5,s1,80008390 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80008378:	00000713          	li	a4,0
    8000837c:	000077b7          	lui	a5,0x7
    80008380:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80008384:	fce7eee3          	bltu	a5,a4,80008360 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80008388:	00170713          	addi	a4,a4,1
    8000838c:	ff1ff06f          	j	8000837c <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80008390:	00190913          	addi	s2,s2,1
    80008394:	00900793          	li	a5,9
    80008398:	0527e063          	bltu	a5,s2,800083d8 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000839c:	00004517          	auipc	a0,0x4
    800083a0:	1ac50513          	addi	a0,a0,428 # 8000c548 <CONSOLE_STATUS+0x538>
    800083a4:	fffff097          	auipc	ra,0xfffff
    800083a8:	078080e7          	jalr	120(ra) # 8000741c <_Z11printStringPKc>
    800083ac:	00000613          	li	a2,0
    800083b0:	00a00593          	li	a1,10
    800083b4:	0009051b          	sext.w	a0,s2
    800083b8:	fffff097          	auipc	ra,0xfffff
    800083bc:	214080e7          	jalr	532(ra) # 800075cc <_Z8printIntiii>
    800083c0:	00004517          	auipc	a0,0x4
    800083c4:	4a850513          	addi	a0,a0,1192 # 8000c868 <CONSOLE_STATUS+0x858>
    800083c8:	fffff097          	auipc	ra,0xfffff
    800083cc:	054080e7          	jalr	84(ra) # 8000741c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800083d0:	00000493          	li	s1,0
    800083d4:	f99ff06f          	j	8000836c <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    800083d8:	00004517          	auipc	a0,0x4
    800083dc:	17850513          	addi	a0,a0,376 # 8000c550 <CONSOLE_STATUS+0x540>
    800083e0:	fffff097          	auipc	ra,0xfffff
    800083e4:	03c080e7          	jalr	60(ra) # 8000741c <_Z11printStringPKc>
    finishedA = true;
    800083e8:	00100793          	li	a5,1
    800083ec:	00007717          	auipc	a4,0x7
    800083f0:	00f70a23          	sb	a5,20(a4) # 8000f400 <_ZL9finishedA>
}
    800083f4:	01813083          	ld	ra,24(sp)
    800083f8:	01013403          	ld	s0,16(sp)
    800083fc:	00813483          	ld	s1,8(sp)
    80008400:	00013903          	ld	s2,0(sp)
    80008404:	02010113          	addi	sp,sp,32
    80008408:	00008067          	ret

000000008000840c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    8000840c:	fe010113          	addi	sp,sp,-32
    80008410:	00113c23          	sd	ra,24(sp)
    80008414:	00813823          	sd	s0,16(sp)
    80008418:	00913423          	sd	s1,8(sp)
    8000841c:	01213023          	sd	s2,0(sp)
    80008420:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80008424:	00000913          	li	s2,0
    80008428:	0380006f          	j	80008460 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000842c:	ffffa097          	auipc	ra,0xffffa
    80008430:	e4c080e7          	jalr	-436(ra) # 80002278 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80008434:	00148493          	addi	s1,s1,1
    80008438:	000027b7          	lui	a5,0x2
    8000843c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80008440:	0097ee63          	bltu	a5,s1,8000845c <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80008444:	00000713          	li	a4,0
    80008448:	000077b7          	lui	a5,0x7
    8000844c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80008450:	fce7eee3          	bltu	a5,a4,8000842c <_ZN7WorkerB11workerBodyBEPv+0x20>
    80008454:	00170713          	addi	a4,a4,1
    80008458:	ff1ff06f          	j	80008448 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    8000845c:	00190913          	addi	s2,s2,1
    80008460:	00f00793          	li	a5,15
    80008464:	0527e063          	bltu	a5,s2,800084a4 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80008468:	00004517          	auipc	a0,0x4
    8000846c:	0c850513          	addi	a0,a0,200 # 8000c530 <CONSOLE_STATUS+0x520>
    80008470:	fffff097          	auipc	ra,0xfffff
    80008474:	fac080e7          	jalr	-84(ra) # 8000741c <_Z11printStringPKc>
    80008478:	00000613          	li	a2,0
    8000847c:	00a00593          	li	a1,10
    80008480:	0009051b          	sext.w	a0,s2
    80008484:	fffff097          	auipc	ra,0xfffff
    80008488:	148080e7          	jalr	328(ra) # 800075cc <_Z8printIntiii>
    8000848c:	00004517          	auipc	a0,0x4
    80008490:	3dc50513          	addi	a0,a0,988 # 8000c868 <CONSOLE_STATUS+0x858>
    80008494:	fffff097          	auipc	ra,0xfffff
    80008498:	f88080e7          	jalr	-120(ra) # 8000741c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000849c:	00000493          	li	s1,0
    800084a0:	f99ff06f          	j	80008438 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800084a4:	00004517          	auipc	a0,0x4
    800084a8:	09450513          	addi	a0,a0,148 # 8000c538 <CONSOLE_STATUS+0x528>
    800084ac:	fffff097          	auipc	ra,0xfffff
    800084b0:	f70080e7          	jalr	-144(ra) # 8000741c <_Z11printStringPKc>
    finishedB = true;
    800084b4:	00100793          	li	a5,1
    800084b8:	00007717          	auipc	a4,0x7
    800084bc:	f4f704a3          	sb	a5,-183(a4) # 8000f401 <_ZL9finishedB>
    thread_dispatch();
    800084c0:	ffffa097          	auipc	ra,0xffffa
    800084c4:	db8080e7          	jalr	-584(ra) # 80002278 <_Z15thread_dispatchv>
}
    800084c8:	01813083          	ld	ra,24(sp)
    800084cc:	01013403          	ld	s0,16(sp)
    800084d0:	00813483          	ld	s1,8(sp)
    800084d4:	00013903          	ld	s2,0(sp)
    800084d8:	02010113          	addi	sp,sp,32
    800084dc:	00008067          	ret

00000000800084e0 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    800084e0:	fe010113          	addi	sp,sp,-32
    800084e4:	00113c23          	sd	ra,24(sp)
    800084e8:	00813823          	sd	s0,16(sp)
    800084ec:	00913423          	sd	s1,8(sp)
    800084f0:	01213023          	sd	s2,0(sp)
    800084f4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800084f8:	00000493          	li	s1,0
    800084fc:	0400006f          	j	8000853c <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80008500:	00004517          	auipc	a0,0x4
    80008504:	ff050513          	addi	a0,a0,-16 # 8000c4f0 <CONSOLE_STATUS+0x4e0>
    80008508:	fffff097          	auipc	ra,0xfffff
    8000850c:	f14080e7          	jalr	-236(ra) # 8000741c <_Z11printStringPKc>
    80008510:	00000613          	li	a2,0
    80008514:	00a00593          	li	a1,10
    80008518:	00048513          	mv	a0,s1
    8000851c:	fffff097          	auipc	ra,0xfffff
    80008520:	0b0080e7          	jalr	176(ra) # 800075cc <_Z8printIntiii>
    80008524:	00004517          	auipc	a0,0x4
    80008528:	34450513          	addi	a0,a0,836 # 8000c868 <CONSOLE_STATUS+0x858>
    8000852c:	fffff097          	auipc	ra,0xfffff
    80008530:	ef0080e7          	jalr	-272(ra) # 8000741c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80008534:	0014849b          	addiw	s1,s1,1
    80008538:	0ff4f493          	andi	s1,s1,255
    8000853c:	00200793          	li	a5,2
    80008540:	fc97f0e3          	bgeu	a5,s1,80008500 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80008544:	00004517          	auipc	a0,0x4
    80008548:	fb450513          	addi	a0,a0,-76 # 8000c4f8 <CONSOLE_STATUS+0x4e8>
    8000854c:	fffff097          	auipc	ra,0xfffff
    80008550:	ed0080e7          	jalr	-304(ra) # 8000741c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80008554:	00700313          	li	t1,7
    thread_dispatch();
    80008558:	ffffa097          	auipc	ra,0xffffa
    8000855c:	d20080e7          	jalr	-736(ra) # 80002278 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80008560:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80008564:	00004517          	auipc	a0,0x4
    80008568:	fa450513          	addi	a0,a0,-92 # 8000c508 <CONSOLE_STATUS+0x4f8>
    8000856c:	fffff097          	auipc	ra,0xfffff
    80008570:	eb0080e7          	jalr	-336(ra) # 8000741c <_Z11printStringPKc>
    80008574:	00000613          	li	a2,0
    80008578:	00a00593          	li	a1,10
    8000857c:	0009051b          	sext.w	a0,s2
    80008580:	fffff097          	auipc	ra,0xfffff
    80008584:	04c080e7          	jalr	76(ra) # 800075cc <_Z8printIntiii>
    80008588:	00004517          	auipc	a0,0x4
    8000858c:	2e050513          	addi	a0,a0,736 # 8000c868 <CONSOLE_STATUS+0x858>
    80008590:	fffff097          	auipc	ra,0xfffff
    80008594:	e8c080e7          	jalr	-372(ra) # 8000741c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80008598:	00c00513          	li	a0,12
    8000859c:	00000097          	auipc	ra,0x0
    800085a0:	d30080e7          	jalr	-720(ra) # 800082cc <_ZL9fibonaccim>
    800085a4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800085a8:	00004517          	auipc	a0,0x4
    800085ac:	f6850513          	addi	a0,a0,-152 # 8000c510 <CONSOLE_STATUS+0x500>
    800085b0:	fffff097          	auipc	ra,0xfffff
    800085b4:	e6c080e7          	jalr	-404(ra) # 8000741c <_Z11printStringPKc>
    800085b8:	00000613          	li	a2,0
    800085bc:	00a00593          	li	a1,10
    800085c0:	0009051b          	sext.w	a0,s2
    800085c4:	fffff097          	auipc	ra,0xfffff
    800085c8:	008080e7          	jalr	8(ra) # 800075cc <_Z8printIntiii>
    800085cc:	00004517          	auipc	a0,0x4
    800085d0:	29c50513          	addi	a0,a0,668 # 8000c868 <CONSOLE_STATUS+0x858>
    800085d4:	fffff097          	auipc	ra,0xfffff
    800085d8:	e48080e7          	jalr	-440(ra) # 8000741c <_Z11printStringPKc>
    800085dc:	0400006f          	j	8000861c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800085e0:	00004517          	auipc	a0,0x4
    800085e4:	f1050513          	addi	a0,a0,-240 # 8000c4f0 <CONSOLE_STATUS+0x4e0>
    800085e8:	fffff097          	auipc	ra,0xfffff
    800085ec:	e34080e7          	jalr	-460(ra) # 8000741c <_Z11printStringPKc>
    800085f0:	00000613          	li	a2,0
    800085f4:	00a00593          	li	a1,10
    800085f8:	00048513          	mv	a0,s1
    800085fc:	fffff097          	auipc	ra,0xfffff
    80008600:	fd0080e7          	jalr	-48(ra) # 800075cc <_Z8printIntiii>
    80008604:	00004517          	auipc	a0,0x4
    80008608:	26450513          	addi	a0,a0,612 # 8000c868 <CONSOLE_STATUS+0x858>
    8000860c:	fffff097          	auipc	ra,0xfffff
    80008610:	e10080e7          	jalr	-496(ra) # 8000741c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80008614:	0014849b          	addiw	s1,s1,1
    80008618:	0ff4f493          	andi	s1,s1,255
    8000861c:	00500793          	li	a5,5
    80008620:	fc97f0e3          	bgeu	a5,s1,800085e0 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80008624:	00004517          	auipc	a0,0x4
    80008628:	f2c50513          	addi	a0,a0,-212 # 8000c550 <CONSOLE_STATUS+0x540>
    8000862c:	fffff097          	auipc	ra,0xfffff
    80008630:	df0080e7          	jalr	-528(ra) # 8000741c <_Z11printStringPKc>
    finishedC = true;
    80008634:	00100793          	li	a5,1
    80008638:	00007717          	auipc	a4,0x7
    8000863c:	dcf70523          	sb	a5,-566(a4) # 8000f402 <_ZL9finishedC>
    thread_dispatch();
    80008640:	ffffa097          	auipc	ra,0xffffa
    80008644:	c38080e7          	jalr	-968(ra) # 80002278 <_Z15thread_dispatchv>
}
    80008648:	01813083          	ld	ra,24(sp)
    8000864c:	01013403          	ld	s0,16(sp)
    80008650:	00813483          	ld	s1,8(sp)
    80008654:	00013903          	ld	s2,0(sp)
    80008658:	02010113          	addi	sp,sp,32
    8000865c:	00008067          	ret

0000000080008660 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80008660:	fe010113          	addi	sp,sp,-32
    80008664:	00113c23          	sd	ra,24(sp)
    80008668:	00813823          	sd	s0,16(sp)
    8000866c:	00913423          	sd	s1,8(sp)
    80008670:	01213023          	sd	s2,0(sp)
    80008674:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80008678:	00a00493          	li	s1,10
    8000867c:	0400006f          	j	800086bc <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80008680:	00004517          	auipc	a0,0x4
    80008684:	e3850513          	addi	a0,a0,-456 # 8000c4b8 <CONSOLE_STATUS+0x4a8>
    80008688:	fffff097          	auipc	ra,0xfffff
    8000868c:	d94080e7          	jalr	-620(ra) # 8000741c <_Z11printStringPKc>
    80008690:	00000613          	li	a2,0
    80008694:	00a00593          	li	a1,10
    80008698:	00048513          	mv	a0,s1
    8000869c:	fffff097          	auipc	ra,0xfffff
    800086a0:	f30080e7          	jalr	-208(ra) # 800075cc <_Z8printIntiii>
    800086a4:	00004517          	auipc	a0,0x4
    800086a8:	1c450513          	addi	a0,a0,452 # 8000c868 <CONSOLE_STATUS+0x858>
    800086ac:	fffff097          	auipc	ra,0xfffff
    800086b0:	d70080e7          	jalr	-656(ra) # 8000741c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800086b4:	0014849b          	addiw	s1,s1,1
    800086b8:	0ff4f493          	andi	s1,s1,255
    800086bc:	00c00793          	li	a5,12
    800086c0:	fc97f0e3          	bgeu	a5,s1,80008680 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800086c4:	00004517          	auipc	a0,0x4
    800086c8:	dfc50513          	addi	a0,a0,-516 # 8000c4c0 <CONSOLE_STATUS+0x4b0>
    800086cc:	fffff097          	auipc	ra,0xfffff
    800086d0:	d50080e7          	jalr	-688(ra) # 8000741c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800086d4:	00500313          	li	t1,5
    thread_dispatch();
    800086d8:	ffffa097          	auipc	ra,0xffffa
    800086dc:	ba0080e7          	jalr	-1120(ra) # 80002278 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800086e0:	01000513          	li	a0,16
    800086e4:	00000097          	auipc	ra,0x0
    800086e8:	be8080e7          	jalr	-1048(ra) # 800082cc <_ZL9fibonaccim>
    800086ec:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800086f0:	00004517          	auipc	a0,0x4
    800086f4:	de050513          	addi	a0,a0,-544 # 8000c4d0 <CONSOLE_STATUS+0x4c0>
    800086f8:	fffff097          	auipc	ra,0xfffff
    800086fc:	d24080e7          	jalr	-732(ra) # 8000741c <_Z11printStringPKc>
    80008700:	00000613          	li	a2,0
    80008704:	00a00593          	li	a1,10
    80008708:	0009051b          	sext.w	a0,s2
    8000870c:	fffff097          	auipc	ra,0xfffff
    80008710:	ec0080e7          	jalr	-320(ra) # 800075cc <_Z8printIntiii>
    80008714:	00004517          	auipc	a0,0x4
    80008718:	15450513          	addi	a0,a0,340 # 8000c868 <CONSOLE_STATUS+0x858>
    8000871c:	fffff097          	auipc	ra,0xfffff
    80008720:	d00080e7          	jalr	-768(ra) # 8000741c <_Z11printStringPKc>
    80008724:	0400006f          	j	80008764 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80008728:	00004517          	auipc	a0,0x4
    8000872c:	d9050513          	addi	a0,a0,-624 # 8000c4b8 <CONSOLE_STATUS+0x4a8>
    80008730:	fffff097          	auipc	ra,0xfffff
    80008734:	cec080e7          	jalr	-788(ra) # 8000741c <_Z11printStringPKc>
    80008738:	00000613          	li	a2,0
    8000873c:	00a00593          	li	a1,10
    80008740:	00048513          	mv	a0,s1
    80008744:	fffff097          	auipc	ra,0xfffff
    80008748:	e88080e7          	jalr	-376(ra) # 800075cc <_Z8printIntiii>
    8000874c:	00004517          	auipc	a0,0x4
    80008750:	11c50513          	addi	a0,a0,284 # 8000c868 <CONSOLE_STATUS+0x858>
    80008754:	fffff097          	auipc	ra,0xfffff
    80008758:	cc8080e7          	jalr	-824(ra) # 8000741c <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000875c:	0014849b          	addiw	s1,s1,1
    80008760:	0ff4f493          	andi	s1,s1,255
    80008764:	00f00793          	li	a5,15
    80008768:	fc97f0e3          	bgeu	a5,s1,80008728 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    8000876c:	00004517          	auipc	a0,0x4
    80008770:	d7450513          	addi	a0,a0,-652 # 8000c4e0 <CONSOLE_STATUS+0x4d0>
    80008774:	fffff097          	auipc	ra,0xfffff
    80008778:	ca8080e7          	jalr	-856(ra) # 8000741c <_Z11printStringPKc>
    finishedD = true;
    8000877c:	00100793          	li	a5,1
    80008780:	00007717          	auipc	a4,0x7
    80008784:	c8f701a3          	sb	a5,-893(a4) # 8000f403 <_ZL9finishedD>
    thread_dispatch();
    80008788:	ffffa097          	auipc	ra,0xffffa
    8000878c:	af0080e7          	jalr	-1296(ra) # 80002278 <_Z15thread_dispatchv>
}
    80008790:	01813083          	ld	ra,24(sp)
    80008794:	01013403          	ld	s0,16(sp)
    80008798:	00813483          	ld	s1,8(sp)
    8000879c:	00013903          	ld	s2,0(sp)
    800087a0:	02010113          	addi	sp,sp,32
    800087a4:	00008067          	ret

00000000800087a8 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800087a8:	fc010113          	addi	sp,sp,-64
    800087ac:	02113c23          	sd	ra,56(sp)
    800087b0:	02813823          	sd	s0,48(sp)
    800087b4:	02913423          	sd	s1,40(sp)
    800087b8:	03213023          	sd	s2,32(sp)
    800087bc:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800087c0:	02000513          	li	a0,32
    800087c4:	ffff9097          	auipc	ra,0xffff9
    800087c8:	adc080e7          	jalr	-1316(ra) # 800012a0 <_Znwm>
    800087cc:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800087d0:	ffff9097          	auipc	ra,0xffff9
    800087d4:	cb4080e7          	jalr	-844(ra) # 80001484 <_ZN6ThreadC1Ev>
    800087d8:	00007797          	auipc	a5,0x7
    800087dc:	9e878793          	addi	a5,a5,-1560 # 8000f1c0 <_ZTV7WorkerA+0x10>
    800087e0:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    800087e4:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    800087e8:	00004517          	auipc	a0,0x4
    800087ec:	d7850513          	addi	a0,a0,-648 # 8000c560 <CONSOLE_STATUS+0x550>
    800087f0:	fffff097          	auipc	ra,0xfffff
    800087f4:	c2c080e7          	jalr	-980(ra) # 8000741c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    800087f8:	02000513          	li	a0,32
    800087fc:	ffff9097          	auipc	ra,0xffff9
    80008800:	aa4080e7          	jalr	-1372(ra) # 800012a0 <_Znwm>
    80008804:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80008808:	ffff9097          	auipc	ra,0xffff9
    8000880c:	c7c080e7          	jalr	-900(ra) # 80001484 <_ZN6ThreadC1Ev>
    80008810:	00007797          	auipc	a5,0x7
    80008814:	9d878793          	addi	a5,a5,-1576 # 8000f1e8 <_ZTV7WorkerB+0x10>
    80008818:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    8000881c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80008820:	00004517          	auipc	a0,0x4
    80008824:	d5850513          	addi	a0,a0,-680 # 8000c578 <CONSOLE_STATUS+0x568>
    80008828:	fffff097          	auipc	ra,0xfffff
    8000882c:	bf4080e7          	jalr	-1036(ra) # 8000741c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80008830:	02000513          	li	a0,32
    80008834:	ffff9097          	auipc	ra,0xffff9
    80008838:	a6c080e7          	jalr	-1428(ra) # 800012a0 <_Znwm>
    8000883c:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80008840:	ffff9097          	auipc	ra,0xffff9
    80008844:	c44080e7          	jalr	-956(ra) # 80001484 <_ZN6ThreadC1Ev>
    80008848:	00007797          	auipc	a5,0x7
    8000884c:	9c878793          	addi	a5,a5,-1592 # 8000f210 <_ZTV7WorkerC+0x10>
    80008850:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80008854:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80008858:	00004517          	auipc	a0,0x4
    8000885c:	d3850513          	addi	a0,a0,-712 # 8000c590 <CONSOLE_STATUS+0x580>
    80008860:	fffff097          	auipc	ra,0xfffff
    80008864:	bbc080e7          	jalr	-1092(ra) # 8000741c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80008868:	02000513          	li	a0,32
    8000886c:	ffff9097          	auipc	ra,0xffff9
    80008870:	a34080e7          	jalr	-1484(ra) # 800012a0 <_Znwm>
    80008874:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80008878:	ffff9097          	auipc	ra,0xffff9
    8000887c:	c0c080e7          	jalr	-1012(ra) # 80001484 <_ZN6ThreadC1Ev>
    80008880:	00007797          	auipc	a5,0x7
    80008884:	9b878793          	addi	a5,a5,-1608 # 8000f238 <_ZTV7WorkerD+0x10>
    80008888:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    8000888c:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80008890:	00004517          	auipc	a0,0x4
    80008894:	d1850513          	addi	a0,a0,-744 # 8000c5a8 <CONSOLE_STATUS+0x598>
    80008898:	fffff097          	auipc	ra,0xfffff
    8000889c:	b84080e7          	jalr	-1148(ra) # 8000741c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800088a0:	00000493          	li	s1,0
    800088a4:	00300793          	li	a5,3
    800088a8:	0297c663          	blt	a5,s1,800088d4 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800088ac:	00349793          	slli	a5,s1,0x3
    800088b0:	fe040713          	addi	a4,s0,-32
    800088b4:	00f707b3          	add	a5,a4,a5
    800088b8:	fe07b503          	ld	a0,-32(a5)
    800088bc:	ffff9097          	auipc	ra,0xffff9
    800088c0:	ae0080e7          	jalr	-1312(ra) # 8000139c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800088c4:	0014849b          	addiw	s1,s1,1
    800088c8:	fddff06f          	j	800088a4 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800088cc:	ffff9097          	auipc	ra,0xffff9
    800088d0:	b30080e7          	jalr	-1232(ra) # 800013fc <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800088d4:	00007797          	auipc	a5,0x7
    800088d8:	b2c7c783          	lbu	a5,-1236(a5) # 8000f400 <_ZL9finishedA>
    800088dc:	fe0788e3          	beqz	a5,800088cc <_Z20Threads_CPP_API_testv+0x124>
    800088e0:	00007797          	auipc	a5,0x7
    800088e4:	b217c783          	lbu	a5,-1247(a5) # 8000f401 <_ZL9finishedB>
    800088e8:	fe0782e3          	beqz	a5,800088cc <_Z20Threads_CPP_API_testv+0x124>
    800088ec:	00007797          	auipc	a5,0x7
    800088f0:	b167c783          	lbu	a5,-1258(a5) # 8000f402 <_ZL9finishedC>
    800088f4:	fc078ce3          	beqz	a5,800088cc <_Z20Threads_CPP_API_testv+0x124>
    800088f8:	00007797          	auipc	a5,0x7
    800088fc:	b0b7c783          	lbu	a5,-1269(a5) # 8000f403 <_ZL9finishedD>
    80008900:	fc0786e3          	beqz	a5,800088cc <_Z20Threads_CPP_API_testv+0x124>
    80008904:	fc040493          	addi	s1,s0,-64
    80008908:	0080006f          	j	80008910 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    8000890c:	00848493          	addi	s1,s1,8
    80008910:	fe040793          	addi	a5,s0,-32
    80008914:	08f48663          	beq	s1,a5,800089a0 <_Z20Threads_CPP_API_testv+0x1f8>
    80008918:	0004b503          	ld	a0,0(s1)
    8000891c:	fe0508e3          	beqz	a0,8000890c <_Z20Threads_CPP_API_testv+0x164>
    80008920:	00053783          	ld	a5,0(a0)
    80008924:	0087b783          	ld	a5,8(a5)
    80008928:	000780e7          	jalr	a5
    8000892c:	fe1ff06f          	j	8000890c <_Z20Threads_CPP_API_testv+0x164>
    80008930:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80008934:	00048513          	mv	a0,s1
    80008938:	ffff9097          	auipc	ra,0xffff9
    8000893c:	990080e7          	jalr	-1648(ra) # 800012c8 <_ZdlPv>
    80008940:	00090513          	mv	a0,s2
    80008944:	00008097          	auipc	ra,0x8
    80008948:	ba4080e7          	jalr	-1116(ra) # 800104e8 <_Unwind_Resume>
    8000894c:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80008950:	00048513          	mv	a0,s1
    80008954:	ffff9097          	auipc	ra,0xffff9
    80008958:	974080e7          	jalr	-1676(ra) # 800012c8 <_ZdlPv>
    8000895c:	00090513          	mv	a0,s2
    80008960:	00008097          	auipc	ra,0x8
    80008964:	b88080e7          	jalr	-1144(ra) # 800104e8 <_Unwind_Resume>
    80008968:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    8000896c:	00048513          	mv	a0,s1
    80008970:	ffff9097          	auipc	ra,0xffff9
    80008974:	958080e7          	jalr	-1704(ra) # 800012c8 <_ZdlPv>
    80008978:	00090513          	mv	a0,s2
    8000897c:	00008097          	auipc	ra,0x8
    80008980:	b6c080e7          	jalr	-1172(ra) # 800104e8 <_Unwind_Resume>
    80008984:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80008988:	00048513          	mv	a0,s1
    8000898c:	ffff9097          	auipc	ra,0xffff9
    80008990:	93c080e7          	jalr	-1732(ra) # 800012c8 <_ZdlPv>
    80008994:	00090513          	mv	a0,s2
    80008998:	00008097          	auipc	ra,0x8
    8000899c:	b50080e7          	jalr	-1200(ra) # 800104e8 <_Unwind_Resume>
}
    800089a0:	03813083          	ld	ra,56(sp)
    800089a4:	03013403          	ld	s0,48(sp)
    800089a8:	02813483          	ld	s1,40(sp)
    800089ac:	02013903          	ld	s2,32(sp)
    800089b0:	04010113          	addi	sp,sp,64
    800089b4:	00008067          	ret

00000000800089b8 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800089b8:	ff010113          	addi	sp,sp,-16
    800089bc:	00113423          	sd	ra,8(sp)
    800089c0:	00813023          	sd	s0,0(sp)
    800089c4:	01010413          	addi	s0,sp,16
    800089c8:	00006797          	auipc	a5,0x6
    800089cc:	7f878793          	addi	a5,a5,2040 # 8000f1c0 <_ZTV7WorkerA+0x10>
    800089d0:	00f53023          	sd	a5,0(a0)
    800089d4:	ffff8097          	auipc	ra,0xffff8
    800089d8:	7fc080e7          	jalr	2044(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800089dc:	00813083          	ld	ra,8(sp)
    800089e0:	00013403          	ld	s0,0(sp)
    800089e4:	01010113          	addi	sp,sp,16
    800089e8:	00008067          	ret

00000000800089ec <_ZN7WorkerAD0Ev>:
    800089ec:	fe010113          	addi	sp,sp,-32
    800089f0:	00113c23          	sd	ra,24(sp)
    800089f4:	00813823          	sd	s0,16(sp)
    800089f8:	00913423          	sd	s1,8(sp)
    800089fc:	02010413          	addi	s0,sp,32
    80008a00:	00050493          	mv	s1,a0
    80008a04:	00006797          	auipc	a5,0x6
    80008a08:	7bc78793          	addi	a5,a5,1980 # 8000f1c0 <_ZTV7WorkerA+0x10>
    80008a0c:	00f53023          	sd	a5,0(a0)
    80008a10:	ffff8097          	auipc	ra,0xffff8
    80008a14:	7c0080e7          	jalr	1984(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008a18:	00048513          	mv	a0,s1
    80008a1c:	ffff9097          	auipc	ra,0xffff9
    80008a20:	8ac080e7          	jalr	-1876(ra) # 800012c8 <_ZdlPv>
    80008a24:	01813083          	ld	ra,24(sp)
    80008a28:	01013403          	ld	s0,16(sp)
    80008a2c:	00813483          	ld	s1,8(sp)
    80008a30:	02010113          	addi	sp,sp,32
    80008a34:	00008067          	ret

0000000080008a38 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80008a38:	ff010113          	addi	sp,sp,-16
    80008a3c:	00113423          	sd	ra,8(sp)
    80008a40:	00813023          	sd	s0,0(sp)
    80008a44:	01010413          	addi	s0,sp,16
    80008a48:	00006797          	auipc	a5,0x6
    80008a4c:	7a078793          	addi	a5,a5,1952 # 8000f1e8 <_ZTV7WorkerB+0x10>
    80008a50:	00f53023          	sd	a5,0(a0)
    80008a54:	ffff8097          	auipc	ra,0xffff8
    80008a58:	77c080e7          	jalr	1916(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008a5c:	00813083          	ld	ra,8(sp)
    80008a60:	00013403          	ld	s0,0(sp)
    80008a64:	01010113          	addi	sp,sp,16
    80008a68:	00008067          	ret

0000000080008a6c <_ZN7WorkerBD0Ev>:
    80008a6c:	fe010113          	addi	sp,sp,-32
    80008a70:	00113c23          	sd	ra,24(sp)
    80008a74:	00813823          	sd	s0,16(sp)
    80008a78:	00913423          	sd	s1,8(sp)
    80008a7c:	02010413          	addi	s0,sp,32
    80008a80:	00050493          	mv	s1,a0
    80008a84:	00006797          	auipc	a5,0x6
    80008a88:	76478793          	addi	a5,a5,1892 # 8000f1e8 <_ZTV7WorkerB+0x10>
    80008a8c:	00f53023          	sd	a5,0(a0)
    80008a90:	ffff8097          	auipc	ra,0xffff8
    80008a94:	740080e7          	jalr	1856(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008a98:	00048513          	mv	a0,s1
    80008a9c:	ffff9097          	auipc	ra,0xffff9
    80008aa0:	82c080e7          	jalr	-2004(ra) # 800012c8 <_ZdlPv>
    80008aa4:	01813083          	ld	ra,24(sp)
    80008aa8:	01013403          	ld	s0,16(sp)
    80008aac:	00813483          	ld	s1,8(sp)
    80008ab0:	02010113          	addi	sp,sp,32
    80008ab4:	00008067          	ret

0000000080008ab8 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80008ab8:	ff010113          	addi	sp,sp,-16
    80008abc:	00113423          	sd	ra,8(sp)
    80008ac0:	00813023          	sd	s0,0(sp)
    80008ac4:	01010413          	addi	s0,sp,16
    80008ac8:	00006797          	auipc	a5,0x6
    80008acc:	74878793          	addi	a5,a5,1864 # 8000f210 <_ZTV7WorkerC+0x10>
    80008ad0:	00f53023          	sd	a5,0(a0)
    80008ad4:	ffff8097          	auipc	ra,0xffff8
    80008ad8:	6fc080e7          	jalr	1788(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008adc:	00813083          	ld	ra,8(sp)
    80008ae0:	00013403          	ld	s0,0(sp)
    80008ae4:	01010113          	addi	sp,sp,16
    80008ae8:	00008067          	ret

0000000080008aec <_ZN7WorkerCD0Ev>:
    80008aec:	fe010113          	addi	sp,sp,-32
    80008af0:	00113c23          	sd	ra,24(sp)
    80008af4:	00813823          	sd	s0,16(sp)
    80008af8:	00913423          	sd	s1,8(sp)
    80008afc:	02010413          	addi	s0,sp,32
    80008b00:	00050493          	mv	s1,a0
    80008b04:	00006797          	auipc	a5,0x6
    80008b08:	70c78793          	addi	a5,a5,1804 # 8000f210 <_ZTV7WorkerC+0x10>
    80008b0c:	00f53023          	sd	a5,0(a0)
    80008b10:	ffff8097          	auipc	ra,0xffff8
    80008b14:	6c0080e7          	jalr	1728(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008b18:	00048513          	mv	a0,s1
    80008b1c:	ffff8097          	auipc	ra,0xffff8
    80008b20:	7ac080e7          	jalr	1964(ra) # 800012c8 <_ZdlPv>
    80008b24:	01813083          	ld	ra,24(sp)
    80008b28:	01013403          	ld	s0,16(sp)
    80008b2c:	00813483          	ld	s1,8(sp)
    80008b30:	02010113          	addi	sp,sp,32
    80008b34:	00008067          	ret

0000000080008b38 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80008b38:	ff010113          	addi	sp,sp,-16
    80008b3c:	00113423          	sd	ra,8(sp)
    80008b40:	00813023          	sd	s0,0(sp)
    80008b44:	01010413          	addi	s0,sp,16
    80008b48:	00006797          	auipc	a5,0x6
    80008b4c:	6f078793          	addi	a5,a5,1776 # 8000f238 <_ZTV7WorkerD+0x10>
    80008b50:	00f53023          	sd	a5,0(a0)
    80008b54:	ffff8097          	auipc	ra,0xffff8
    80008b58:	67c080e7          	jalr	1660(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008b5c:	00813083          	ld	ra,8(sp)
    80008b60:	00013403          	ld	s0,0(sp)
    80008b64:	01010113          	addi	sp,sp,16
    80008b68:	00008067          	ret

0000000080008b6c <_ZN7WorkerDD0Ev>:
    80008b6c:	fe010113          	addi	sp,sp,-32
    80008b70:	00113c23          	sd	ra,24(sp)
    80008b74:	00813823          	sd	s0,16(sp)
    80008b78:	00913423          	sd	s1,8(sp)
    80008b7c:	02010413          	addi	s0,sp,32
    80008b80:	00050493          	mv	s1,a0
    80008b84:	00006797          	auipc	a5,0x6
    80008b88:	6b478793          	addi	a5,a5,1716 # 8000f238 <_ZTV7WorkerD+0x10>
    80008b8c:	00f53023          	sd	a5,0(a0)
    80008b90:	ffff8097          	auipc	ra,0xffff8
    80008b94:	640080e7          	jalr	1600(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80008b98:	00048513          	mv	a0,s1
    80008b9c:	ffff8097          	auipc	ra,0xffff8
    80008ba0:	72c080e7          	jalr	1836(ra) # 800012c8 <_ZdlPv>
    80008ba4:	01813083          	ld	ra,24(sp)
    80008ba8:	01013403          	ld	s0,16(sp)
    80008bac:	00813483          	ld	s1,8(sp)
    80008bb0:	02010113          	addi	sp,sp,32
    80008bb4:	00008067          	ret

0000000080008bb8 <_ZN7WorkerA3runEv>:
    void run() override {
    80008bb8:	ff010113          	addi	sp,sp,-16
    80008bbc:	00113423          	sd	ra,8(sp)
    80008bc0:	00813023          	sd	s0,0(sp)
    80008bc4:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80008bc8:	00000593          	li	a1,0
    80008bcc:	fffff097          	auipc	ra,0xfffff
    80008bd0:	774080e7          	jalr	1908(ra) # 80008340 <_ZN7WorkerA11workerBodyAEPv>
    }
    80008bd4:	00813083          	ld	ra,8(sp)
    80008bd8:	00013403          	ld	s0,0(sp)
    80008bdc:	01010113          	addi	sp,sp,16
    80008be0:	00008067          	ret

0000000080008be4 <_ZN7WorkerB3runEv>:
    void run() override {
    80008be4:	ff010113          	addi	sp,sp,-16
    80008be8:	00113423          	sd	ra,8(sp)
    80008bec:	00813023          	sd	s0,0(sp)
    80008bf0:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80008bf4:	00000593          	li	a1,0
    80008bf8:	00000097          	auipc	ra,0x0
    80008bfc:	814080e7          	jalr	-2028(ra) # 8000840c <_ZN7WorkerB11workerBodyBEPv>
    }
    80008c00:	00813083          	ld	ra,8(sp)
    80008c04:	00013403          	ld	s0,0(sp)
    80008c08:	01010113          	addi	sp,sp,16
    80008c0c:	00008067          	ret

0000000080008c10 <_ZN7WorkerC3runEv>:
    void run() override {
    80008c10:	ff010113          	addi	sp,sp,-16
    80008c14:	00113423          	sd	ra,8(sp)
    80008c18:	00813023          	sd	s0,0(sp)
    80008c1c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80008c20:	00000593          	li	a1,0
    80008c24:	00000097          	auipc	ra,0x0
    80008c28:	8bc080e7          	jalr	-1860(ra) # 800084e0 <_ZN7WorkerC11workerBodyCEPv>
    }
    80008c2c:	00813083          	ld	ra,8(sp)
    80008c30:	00013403          	ld	s0,0(sp)
    80008c34:	01010113          	addi	sp,sp,16
    80008c38:	00008067          	ret

0000000080008c3c <_ZN7WorkerD3runEv>:
    void run() override {
    80008c3c:	ff010113          	addi	sp,sp,-16
    80008c40:	00113423          	sd	ra,8(sp)
    80008c44:	00813023          	sd	s0,0(sp)
    80008c48:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80008c4c:	00000593          	li	a1,0
    80008c50:	00000097          	auipc	ra,0x0
    80008c54:	a10080e7          	jalr	-1520(ra) # 80008660 <_ZN7WorkerD11workerBodyDEPv>
    }
    80008c58:	00813083          	ld	ra,8(sp)
    80008c5c:	00013403          	ld	s0,0(sp)
    80008c60:	01010113          	addi	sp,sp,16
    80008c64:	00008067          	ret

0000000080008c68 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80008c68:	f8010113          	addi	sp,sp,-128
    80008c6c:	06113c23          	sd	ra,120(sp)
    80008c70:	06813823          	sd	s0,112(sp)
    80008c74:	06913423          	sd	s1,104(sp)
    80008c78:	07213023          	sd	s2,96(sp)
    80008c7c:	05313c23          	sd	s3,88(sp)
    80008c80:	05413823          	sd	s4,80(sp)
    80008c84:	05513423          	sd	s5,72(sp)
    80008c88:	05613023          	sd	s6,64(sp)
    80008c8c:	03713c23          	sd	s7,56(sp)
    80008c90:	03813823          	sd	s8,48(sp)
    80008c94:	03913423          	sd	s9,40(sp)
    80008c98:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80008c9c:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80008ca0:	00004517          	auipc	a0,0x4
    80008ca4:	9a050513          	addi	a0,a0,-1632 # 8000c640 <CONSOLE_STATUS+0x630>
    80008ca8:	ffffe097          	auipc	ra,0xffffe
    80008cac:	774080e7          	jalr	1908(ra) # 8000741c <_Z11printStringPKc>
    getString(input, 30);
    80008cb0:	01e00593          	li	a1,30
    80008cb4:	f8040493          	addi	s1,s0,-128
    80008cb8:	00048513          	mv	a0,s1
    80008cbc:	ffffe097          	auipc	ra,0xffffe
    80008cc0:	7e8080e7          	jalr	2024(ra) # 800074a4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80008cc4:	00048513          	mv	a0,s1
    80008cc8:	fffff097          	auipc	ra,0xfffff
    80008ccc:	8b4080e7          	jalr	-1868(ra) # 8000757c <_Z11stringToIntPKc>
    80008cd0:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80008cd4:	00004517          	auipc	a0,0x4
    80008cd8:	98c50513          	addi	a0,a0,-1652 # 8000c660 <CONSOLE_STATUS+0x650>
    80008cdc:	ffffe097          	auipc	ra,0xffffe
    80008ce0:	740080e7          	jalr	1856(ra) # 8000741c <_Z11printStringPKc>
    getString(input, 30);
    80008ce4:	01e00593          	li	a1,30
    80008ce8:	00048513          	mv	a0,s1
    80008cec:	ffffe097          	auipc	ra,0xffffe
    80008cf0:	7b8080e7          	jalr	1976(ra) # 800074a4 <_Z9getStringPci>
    n = stringToInt(input);
    80008cf4:	00048513          	mv	a0,s1
    80008cf8:	fffff097          	auipc	ra,0xfffff
    80008cfc:	884080e7          	jalr	-1916(ra) # 8000757c <_Z11stringToIntPKc>
    80008d00:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80008d04:	00004517          	auipc	a0,0x4
    80008d08:	97c50513          	addi	a0,a0,-1668 # 8000c680 <CONSOLE_STATUS+0x670>
    80008d0c:	ffffe097          	auipc	ra,0xffffe
    80008d10:	710080e7          	jalr	1808(ra) # 8000741c <_Z11printStringPKc>
    printInt(threadNum);
    80008d14:	00000613          	li	a2,0
    80008d18:	00a00593          	li	a1,10
    80008d1c:	00098513          	mv	a0,s3
    80008d20:	fffff097          	auipc	ra,0xfffff
    80008d24:	8ac080e7          	jalr	-1876(ra) # 800075cc <_Z8printIntiii>
    printString(" i velicina bafera ");
    80008d28:	00004517          	auipc	a0,0x4
    80008d2c:	97050513          	addi	a0,a0,-1680 # 8000c698 <CONSOLE_STATUS+0x688>
    80008d30:	ffffe097          	auipc	ra,0xffffe
    80008d34:	6ec080e7          	jalr	1772(ra) # 8000741c <_Z11printStringPKc>
    printInt(n);
    80008d38:	00000613          	li	a2,0
    80008d3c:	00a00593          	li	a1,10
    80008d40:	00048513          	mv	a0,s1
    80008d44:	fffff097          	auipc	ra,0xfffff
    80008d48:	888080e7          	jalr	-1912(ra) # 800075cc <_Z8printIntiii>
    printString(".\n");
    80008d4c:	00004517          	auipc	a0,0x4
    80008d50:	96450513          	addi	a0,a0,-1692 # 8000c6b0 <CONSOLE_STATUS+0x6a0>
    80008d54:	ffffe097          	auipc	ra,0xffffe
    80008d58:	6c8080e7          	jalr	1736(ra) # 8000741c <_Z11printStringPKc>
    if (threadNum > n) {
    80008d5c:	0334c463          	blt	s1,s3,80008d84 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80008d60:	03305c63          	blez	s3,80008d98 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80008d64:	03800513          	li	a0,56
    80008d68:	ffff8097          	auipc	ra,0xffff8
    80008d6c:	538080e7          	jalr	1336(ra) # 800012a0 <_Znwm>
    80008d70:	00050a93          	mv	s5,a0
    80008d74:	00048593          	mv	a1,s1
    80008d78:	ffffe097          	auipc	ra,0xffffe
    80008d7c:	2ac080e7          	jalr	684(ra) # 80007024 <_ZN9BufferCPPC1Ei>
    80008d80:	0300006f          	j	80008db0 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80008d84:	00004517          	auipc	a0,0x4
    80008d88:	93450513          	addi	a0,a0,-1740 # 8000c6b8 <CONSOLE_STATUS+0x6a8>
    80008d8c:	ffffe097          	auipc	ra,0xffffe
    80008d90:	690080e7          	jalr	1680(ra) # 8000741c <_Z11printStringPKc>
        return;
    80008d94:	0140006f          	j	80008da8 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80008d98:	00004517          	auipc	a0,0x4
    80008d9c:	96050513          	addi	a0,a0,-1696 # 8000c6f8 <CONSOLE_STATUS+0x6e8>
    80008da0:	ffffe097          	auipc	ra,0xffffe
    80008da4:	67c080e7          	jalr	1660(ra) # 8000741c <_Z11printStringPKc>
        return;
    80008da8:	000c0113          	mv	sp,s8
    80008dac:	2440006f          	j	80008ff0 <_Z20testConsumerProducerv+0x388>
    waitForAll = new Semaphore(0);
    80008db0:	01000513          	li	a0,16
    80008db4:	ffff8097          	auipc	ra,0xffff8
    80008db8:	4ec080e7          	jalr	1260(ra) # 800012a0 <_Znwm>
    80008dbc:	00050913          	mv	s2,a0
    80008dc0:	00000593          	li	a1,0
    80008dc4:	ffff8097          	auipc	ra,0xffff8
    80008dc8:	6f4080e7          	jalr	1780(ra) # 800014b8 <_ZN9SemaphoreC1Ej>
    80008dcc:	00006797          	auipc	a5,0x6
    80008dd0:	6527b223          	sd	s2,1604(a5) # 8000f410 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80008dd4:	00399793          	slli	a5,s3,0x3
    80008dd8:	00f78793          	addi	a5,a5,15
    80008ddc:	ff07f793          	andi	a5,a5,-16
    80008de0:	40f10133          	sub	sp,sp,a5
    80008de4:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80008de8:	0019871b          	addiw	a4,s3,1
    80008dec:	00171793          	slli	a5,a4,0x1
    80008df0:	00e787b3          	add	a5,a5,a4
    80008df4:	00379793          	slli	a5,a5,0x3
    80008df8:	00f78793          	addi	a5,a5,15
    80008dfc:	ff07f793          	andi	a5,a5,-16
    80008e00:	40f10133          	sub	sp,sp,a5
    80008e04:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80008e08:	00199493          	slli	s1,s3,0x1
    80008e0c:	013484b3          	add	s1,s1,s3
    80008e10:	00349493          	slli	s1,s1,0x3
    80008e14:	009b04b3          	add	s1,s6,s1
    80008e18:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80008e1c:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80008e20:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80008e24:	02800513          	li	a0,40
    80008e28:	ffff8097          	auipc	ra,0xffff8
    80008e2c:	478080e7          	jalr	1144(ra) # 800012a0 <_Znwm>
    80008e30:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80008e34:	ffff8097          	auipc	ra,0xffff8
    80008e38:	650080e7          	jalr	1616(ra) # 80001484 <_ZN6ThreadC1Ev>
    80008e3c:	00006797          	auipc	a5,0x6
    80008e40:	47478793          	addi	a5,a5,1140 # 8000f2b0 <_ZTV8Consumer+0x10>
    80008e44:	00fbb023          	sd	a5,0(s7)
    80008e48:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80008e4c:	000b8513          	mv	a0,s7
    80008e50:	ffff8097          	auipc	ra,0xffff8
    80008e54:	54c080e7          	jalr	1356(ra) # 8000139c <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80008e58:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80008e5c:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80008e60:	00006797          	auipc	a5,0x6
    80008e64:	5b07b783          	ld	a5,1456(a5) # 8000f410 <_ZL10waitForAll>
    80008e68:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80008e6c:	02800513          	li	a0,40
    80008e70:	ffff8097          	auipc	ra,0xffff8
    80008e74:	430080e7          	jalr	1072(ra) # 800012a0 <_Znwm>
    80008e78:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80008e7c:	ffff8097          	auipc	ra,0xffff8
    80008e80:	608080e7          	jalr	1544(ra) # 80001484 <_ZN6ThreadC1Ev>
    80008e84:	00006797          	auipc	a5,0x6
    80008e88:	3dc78793          	addi	a5,a5,988 # 8000f260 <_ZTV16ProducerKeyborad+0x10>
    80008e8c:	00f4b023          	sd	a5,0(s1)
    80008e90:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80008e94:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80008e98:	00048513          	mv	a0,s1
    80008e9c:	ffff8097          	auipc	ra,0xffff8
    80008ea0:	500080e7          	jalr	1280(ra) # 8000139c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80008ea4:	00100913          	li	s2,1
    80008ea8:	0300006f          	j	80008ed8 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80008eac:	00006797          	auipc	a5,0x6
    80008eb0:	3dc78793          	addi	a5,a5,988 # 8000f288 <_ZTV8Producer+0x10>
    80008eb4:	00fcb023          	sd	a5,0(s9)
    80008eb8:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80008ebc:	00391793          	slli	a5,s2,0x3
    80008ec0:	00fa07b3          	add	a5,s4,a5
    80008ec4:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80008ec8:	000c8513          	mv	a0,s9
    80008ecc:	ffff8097          	auipc	ra,0xffff8
    80008ed0:	4d0080e7          	jalr	1232(ra) # 8000139c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80008ed4:	0019091b          	addiw	s2,s2,1
    80008ed8:	05395263          	bge	s2,s3,80008f1c <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80008edc:	00191493          	slli	s1,s2,0x1
    80008ee0:	012484b3          	add	s1,s1,s2
    80008ee4:	00349493          	slli	s1,s1,0x3
    80008ee8:	009b04b3          	add	s1,s6,s1
    80008eec:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80008ef0:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80008ef4:	00006797          	auipc	a5,0x6
    80008ef8:	51c7b783          	ld	a5,1308(a5) # 8000f410 <_ZL10waitForAll>
    80008efc:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80008f00:	02800513          	li	a0,40
    80008f04:	ffff8097          	auipc	ra,0xffff8
    80008f08:	39c080e7          	jalr	924(ra) # 800012a0 <_Znwm>
    80008f0c:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80008f10:	ffff8097          	auipc	ra,0xffff8
    80008f14:	574080e7          	jalr	1396(ra) # 80001484 <_ZN6ThreadC1Ev>
    80008f18:	f95ff06f          	j	80008eac <_Z20testConsumerProducerv+0x244>
    putc('.');
    80008f1c:	02e00513          	li	a0,46
    80008f20:	ffff9097          	auipc	ra,0xffff9
    80008f24:	508080e7          	jalr	1288(ra) # 80002428 <_Z4putcc>
    Thread::dispatch();
    80008f28:	ffff8097          	auipc	ra,0xffff8
    80008f2c:	4d4080e7          	jalr	1236(ra) # 800013fc <_ZN6Thread8dispatchEv>
    putc('.');
    80008f30:	02e00513          	li	a0,46
    80008f34:	ffff9097          	auipc	ra,0xffff9
    80008f38:	4f4080e7          	jalr	1268(ra) # 80002428 <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    80008f3c:	00000493          	li	s1,0
    80008f40:	0299c463          	blt	s3,s1,80008f68 <_Z20testConsumerProducerv+0x300>
        waitForAll->wait();
    80008f44:	00006517          	auipc	a0,0x6
    80008f48:	4cc53503          	ld	a0,1228(a0) # 8000f410 <_ZL10waitForAll>
    80008f4c:	ffff8097          	auipc	ra,0xffff8
    80008f50:	5a4080e7          	jalr	1444(ra) # 800014f0 <_ZN9Semaphore4waitEv>
        putc('x');
    80008f54:	07800513          	li	a0,120
    80008f58:	ffff9097          	auipc	ra,0xffff9
    80008f5c:	4d0080e7          	jalr	1232(ra) # 80002428 <_Z4putcc>
    for (int i = 0; i <= threadNum; i++) {
    80008f60:	0014849b          	addiw	s1,s1,1
    80008f64:	fddff06f          	j	80008f40 <_Z20testConsumerProducerv+0x2d8>
    putc('.');
    80008f68:	02e00513          	li	a0,46
    80008f6c:	ffff9097          	auipc	ra,0xffff9
    80008f70:	4bc080e7          	jalr	1212(ra) # 80002428 <_Z4putcc>
    delete waitForAll;
    80008f74:	00006517          	auipc	a0,0x6
    80008f78:	49c53503          	ld	a0,1180(a0) # 8000f410 <_ZL10waitForAll>
    80008f7c:	00050863          	beqz	a0,80008f8c <_Z20testConsumerProducerv+0x324>
    80008f80:	00053783          	ld	a5,0(a0)
    80008f84:	0087b783          	ld	a5,8(a5)
    80008f88:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80008f8c:	00000493          	li	s1,0
    80008f90:	0080006f          	j	80008f98 <_Z20testConsumerProducerv+0x330>
    for (int i = 0; i < threadNum; i++) {
    80008f94:	0014849b          	addiw	s1,s1,1
    80008f98:	0334d263          	bge	s1,s3,80008fbc <_Z20testConsumerProducerv+0x354>
        delete producers[i];
    80008f9c:	00349793          	slli	a5,s1,0x3
    80008fa0:	00fa07b3          	add	a5,s4,a5
    80008fa4:	0007b503          	ld	a0,0(a5)
    80008fa8:	fe0506e3          	beqz	a0,80008f94 <_Z20testConsumerProducerv+0x32c>
    80008fac:	00053783          	ld	a5,0(a0)
    80008fb0:	0087b783          	ld	a5,8(a5)
    80008fb4:	000780e7          	jalr	a5
    80008fb8:	fddff06f          	j	80008f94 <_Z20testConsumerProducerv+0x32c>
    delete consumer;
    80008fbc:	000b8a63          	beqz	s7,80008fd0 <_Z20testConsumerProducerv+0x368>
    80008fc0:	000bb783          	ld	a5,0(s7)
    80008fc4:	0087b783          	ld	a5,8(a5)
    80008fc8:	000b8513          	mv	a0,s7
    80008fcc:	000780e7          	jalr	a5
    delete buffer;
    80008fd0:	000a8e63          	beqz	s5,80008fec <_Z20testConsumerProducerv+0x384>
    80008fd4:	000a8513          	mv	a0,s5
    80008fd8:	ffffe097          	auipc	ra,0xffffe
    80008fdc:	344080e7          	jalr	836(ra) # 8000731c <_ZN9BufferCPPD1Ev>
    80008fe0:	000a8513          	mv	a0,s5
    80008fe4:	ffff8097          	auipc	ra,0xffff8
    80008fe8:	2e4080e7          	jalr	740(ra) # 800012c8 <_ZdlPv>
    80008fec:	000c0113          	mv	sp,s8
}
    80008ff0:	f8040113          	addi	sp,s0,-128
    80008ff4:	07813083          	ld	ra,120(sp)
    80008ff8:	07013403          	ld	s0,112(sp)
    80008ffc:	06813483          	ld	s1,104(sp)
    80009000:	06013903          	ld	s2,96(sp)
    80009004:	05813983          	ld	s3,88(sp)
    80009008:	05013a03          	ld	s4,80(sp)
    8000900c:	04813a83          	ld	s5,72(sp)
    80009010:	04013b03          	ld	s6,64(sp)
    80009014:	03813b83          	ld	s7,56(sp)
    80009018:	03013c03          	ld	s8,48(sp)
    8000901c:	02813c83          	ld	s9,40(sp)
    80009020:	08010113          	addi	sp,sp,128
    80009024:	00008067          	ret
    80009028:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000902c:	000a8513          	mv	a0,s5
    80009030:	ffff8097          	auipc	ra,0xffff8
    80009034:	298080e7          	jalr	664(ra) # 800012c8 <_ZdlPv>
    80009038:	00048513          	mv	a0,s1
    8000903c:	00007097          	auipc	ra,0x7
    80009040:	4ac080e7          	jalr	1196(ra) # 800104e8 <_Unwind_Resume>
    80009044:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80009048:	00090513          	mv	a0,s2
    8000904c:	ffff8097          	auipc	ra,0xffff8
    80009050:	27c080e7          	jalr	636(ra) # 800012c8 <_ZdlPv>
    80009054:	00048513          	mv	a0,s1
    80009058:	00007097          	auipc	ra,0x7
    8000905c:	490080e7          	jalr	1168(ra) # 800104e8 <_Unwind_Resume>
    80009060:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80009064:	000b8513          	mv	a0,s7
    80009068:	ffff8097          	auipc	ra,0xffff8
    8000906c:	260080e7          	jalr	608(ra) # 800012c8 <_ZdlPv>
    80009070:	00048513          	mv	a0,s1
    80009074:	00007097          	auipc	ra,0x7
    80009078:	474080e7          	jalr	1140(ra) # 800104e8 <_Unwind_Resume>
    8000907c:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80009080:	00048513          	mv	a0,s1
    80009084:	ffff8097          	auipc	ra,0xffff8
    80009088:	244080e7          	jalr	580(ra) # 800012c8 <_ZdlPv>
    8000908c:	00090513          	mv	a0,s2
    80009090:	00007097          	auipc	ra,0x7
    80009094:	458080e7          	jalr	1112(ra) # 800104e8 <_Unwind_Resume>
    80009098:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    8000909c:	000c8513          	mv	a0,s9
    800090a0:	ffff8097          	auipc	ra,0xffff8
    800090a4:	228080e7          	jalr	552(ra) # 800012c8 <_ZdlPv>
    800090a8:	00048513          	mv	a0,s1
    800090ac:	00007097          	auipc	ra,0x7
    800090b0:	43c080e7          	jalr	1084(ra) # 800104e8 <_Unwind_Resume>

00000000800090b4 <_ZN8Consumer3runEv>:
    void run() override {
    800090b4:	fd010113          	addi	sp,sp,-48
    800090b8:	02113423          	sd	ra,40(sp)
    800090bc:	02813023          	sd	s0,32(sp)
    800090c0:	00913c23          	sd	s1,24(sp)
    800090c4:	01213823          	sd	s2,16(sp)
    800090c8:	01313423          	sd	s3,8(sp)
    800090cc:	03010413          	addi	s0,sp,48
    800090d0:	00050913          	mv	s2,a0
        int i = 0;
    800090d4:	00000993          	li	s3,0
    800090d8:	0100006f          	j	800090e8 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800090dc:	00a00513          	li	a0,10
    800090e0:	ffff8097          	auipc	ra,0xffff8
    800090e4:	548080e7          	jalr	1352(ra) # 80001628 <_ZN7Console4putcEc>
        while (!threadEnd) {
    800090e8:	00006797          	auipc	a5,0x6
    800090ec:	3207a783          	lw	a5,800(a5) # 8000f408 <_ZL9threadEnd>
    800090f0:	04079a63          	bnez	a5,80009144 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800090f4:	02093783          	ld	a5,32(s2)
    800090f8:	0087b503          	ld	a0,8(a5)
    800090fc:	ffffe097          	auipc	ra,0xffffe
    80009100:	10c080e7          	jalr	268(ra) # 80007208 <_ZN9BufferCPP3getEv>
            i++;
    80009104:	0019849b          	addiw	s1,s3,1
    80009108:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    8000910c:	0ff57513          	andi	a0,a0,255
    80009110:	ffff8097          	auipc	ra,0xffff8
    80009114:	518080e7          	jalr	1304(ra) # 80001628 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80009118:	05000793          	li	a5,80
    8000911c:	02f4e4bb          	remw	s1,s1,a5
    80009120:	fc0494e3          	bnez	s1,800090e8 <_ZN8Consumer3runEv+0x34>
    80009124:	fb9ff06f          	j	800090dc <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80009128:	02093783          	ld	a5,32(s2)
    8000912c:	0087b503          	ld	a0,8(a5)
    80009130:	ffffe097          	auipc	ra,0xffffe
    80009134:	0d8080e7          	jalr	216(ra) # 80007208 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80009138:	0ff57513          	andi	a0,a0,255
    8000913c:	ffff8097          	auipc	ra,0xffff8
    80009140:	4ec080e7          	jalr	1260(ra) # 80001628 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80009144:	02093783          	ld	a5,32(s2)
    80009148:	0087b503          	ld	a0,8(a5)
    8000914c:	ffffe097          	auipc	ra,0xffffe
    80009150:	148080e7          	jalr	328(ra) # 80007294 <_ZN9BufferCPP6getCntEv>
    80009154:	fca04ae3          	bgtz	a0,80009128 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80009158:	02093783          	ld	a5,32(s2)
    8000915c:	0107b503          	ld	a0,16(a5)
    80009160:	ffff8097          	auipc	ra,0xffff8
    80009164:	3bc080e7          	jalr	956(ra) # 8000151c <_ZN9Semaphore6signalEv>
    }
    80009168:	02813083          	ld	ra,40(sp)
    8000916c:	02013403          	ld	s0,32(sp)
    80009170:	01813483          	ld	s1,24(sp)
    80009174:	01013903          	ld	s2,16(sp)
    80009178:	00813983          	ld	s3,8(sp)
    8000917c:	03010113          	addi	sp,sp,48
    80009180:	00008067          	ret

0000000080009184 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80009184:	ff010113          	addi	sp,sp,-16
    80009188:	00113423          	sd	ra,8(sp)
    8000918c:	00813023          	sd	s0,0(sp)
    80009190:	01010413          	addi	s0,sp,16
    80009194:	00006797          	auipc	a5,0x6
    80009198:	11c78793          	addi	a5,a5,284 # 8000f2b0 <_ZTV8Consumer+0x10>
    8000919c:	00f53023          	sd	a5,0(a0)
    800091a0:	ffff8097          	auipc	ra,0xffff8
    800091a4:	030080e7          	jalr	48(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800091a8:	00813083          	ld	ra,8(sp)
    800091ac:	00013403          	ld	s0,0(sp)
    800091b0:	01010113          	addi	sp,sp,16
    800091b4:	00008067          	ret

00000000800091b8 <_ZN8ConsumerD0Ev>:
    800091b8:	fe010113          	addi	sp,sp,-32
    800091bc:	00113c23          	sd	ra,24(sp)
    800091c0:	00813823          	sd	s0,16(sp)
    800091c4:	00913423          	sd	s1,8(sp)
    800091c8:	02010413          	addi	s0,sp,32
    800091cc:	00050493          	mv	s1,a0
    800091d0:	00006797          	auipc	a5,0x6
    800091d4:	0e078793          	addi	a5,a5,224 # 8000f2b0 <_ZTV8Consumer+0x10>
    800091d8:	00f53023          	sd	a5,0(a0)
    800091dc:	ffff8097          	auipc	ra,0xffff8
    800091e0:	ff4080e7          	jalr	-12(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800091e4:	00048513          	mv	a0,s1
    800091e8:	ffff8097          	auipc	ra,0xffff8
    800091ec:	0e0080e7          	jalr	224(ra) # 800012c8 <_ZdlPv>
    800091f0:	01813083          	ld	ra,24(sp)
    800091f4:	01013403          	ld	s0,16(sp)
    800091f8:	00813483          	ld	s1,8(sp)
    800091fc:	02010113          	addi	sp,sp,32
    80009200:	00008067          	ret

0000000080009204 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80009204:	ff010113          	addi	sp,sp,-16
    80009208:	00113423          	sd	ra,8(sp)
    8000920c:	00813023          	sd	s0,0(sp)
    80009210:	01010413          	addi	s0,sp,16
    80009214:	00006797          	auipc	a5,0x6
    80009218:	04c78793          	addi	a5,a5,76 # 8000f260 <_ZTV16ProducerKeyborad+0x10>
    8000921c:	00f53023          	sd	a5,0(a0)
    80009220:	ffff8097          	auipc	ra,0xffff8
    80009224:	fb0080e7          	jalr	-80(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80009228:	00813083          	ld	ra,8(sp)
    8000922c:	00013403          	ld	s0,0(sp)
    80009230:	01010113          	addi	sp,sp,16
    80009234:	00008067          	ret

0000000080009238 <_ZN16ProducerKeyboradD0Ev>:
    80009238:	fe010113          	addi	sp,sp,-32
    8000923c:	00113c23          	sd	ra,24(sp)
    80009240:	00813823          	sd	s0,16(sp)
    80009244:	00913423          	sd	s1,8(sp)
    80009248:	02010413          	addi	s0,sp,32
    8000924c:	00050493          	mv	s1,a0
    80009250:	00006797          	auipc	a5,0x6
    80009254:	01078793          	addi	a5,a5,16 # 8000f260 <_ZTV16ProducerKeyborad+0x10>
    80009258:	00f53023          	sd	a5,0(a0)
    8000925c:	ffff8097          	auipc	ra,0xffff8
    80009260:	f74080e7          	jalr	-140(ra) # 800011d0 <_ZN6ThreadD1Ev>
    80009264:	00048513          	mv	a0,s1
    80009268:	ffff8097          	auipc	ra,0xffff8
    8000926c:	060080e7          	jalr	96(ra) # 800012c8 <_ZdlPv>
    80009270:	01813083          	ld	ra,24(sp)
    80009274:	01013403          	ld	s0,16(sp)
    80009278:	00813483          	ld	s1,8(sp)
    8000927c:	02010113          	addi	sp,sp,32
    80009280:	00008067          	ret

0000000080009284 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80009284:	ff010113          	addi	sp,sp,-16
    80009288:	00113423          	sd	ra,8(sp)
    8000928c:	00813023          	sd	s0,0(sp)
    80009290:	01010413          	addi	s0,sp,16
    80009294:	00006797          	auipc	a5,0x6
    80009298:	ff478793          	addi	a5,a5,-12 # 8000f288 <_ZTV8Producer+0x10>
    8000929c:	00f53023          	sd	a5,0(a0)
    800092a0:	ffff8097          	auipc	ra,0xffff8
    800092a4:	f30080e7          	jalr	-208(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800092a8:	00813083          	ld	ra,8(sp)
    800092ac:	00013403          	ld	s0,0(sp)
    800092b0:	01010113          	addi	sp,sp,16
    800092b4:	00008067          	ret

00000000800092b8 <_ZN8ProducerD0Ev>:
    800092b8:	fe010113          	addi	sp,sp,-32
    800092bc:	00113c23          	sd	ra,24(sp)
    800092c0:	00813823          	sd	s0,16(sp)
    800092c4:	00913423          	sd	s1,8(sp)
    800092c8:	02010413          	addi	s0,sp,32
    800092cc:	00050493          	mv	s1,a0
    800092d0:	00006797          	auipc	a5,0x6
    800092d4:	fb878793          	addi	a5,a5,-72 # 8000f288 <_ZTV8Producer+0x10>
    800092d8:	00f53023          	sd	a5,0(a0)
    800092dc:	ffff8097          	auipc	ra,0xffff8
    800092e0:	ef4080e7          	jalr	-268(ra) # 800011d0 <_ZN6ThreadD1Ev>
    800092e4:	00048513          	mv	a0,s1
    800092e8:	ffff8097          	auipc	ra,0xffff8
    800092ec:	fe0080e7          	jalr	-32(ra) # 800012c8 <_ZdlPv>
    800092f0:	01813083          	ld	ra,24(sp)
    800092f4:	01013403          	ld	s0,16(sp)
    800092f8:	00813483          	ld	s1,8(sp)
    800092fc:	02010113          	addi	sp,sp,32
    80009300:	00008067          	ret

0000000080009304 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80009304:	fe010113          	addi	sp,sp,-32
    80009308:	00113c23          	sd	ra,24(sp)
    8000930c:	00813823          	sd	s0,16(sp)
    80009310:	00913423          	sd	s1,8(sp)
    80009314:	02010413          	addi	s0,sp,32
    80009318:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    8000931c:	ffff9097          	auipc	ra,0xffff9
    80009320:	0e4080e7          	jalr	228(ra) # 80002400 <_Z4getcv>
    80009324:	0005059b          	sext.w	a1,a0
    80009328:	01b00793          	li	a5,27
    8000932c:	00f58c63          	beq	a1,a5,80009344 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80009330:	0204b783          	ld	a5,32(s1)
    80009334:	0087b503          	ld	a0,8(a5)
    80009338:	ffffe097          	auipc	ra,0xffffe
    8000933c:	e40080e7          	jalr	-448(ra) # 80007178 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80009340:	fddff06f          	j	8000931c <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80009344:	00100793          	li	a5,1
    80009348:	00006717          	auipc	a4,0x6
    8000934c:	0cf72023          	sw	a5,192(a4) # 8000f408 <_ZL9threadEnd>
        td->buffer->put('!');
    80009350:	0204b783          	ld	a5,32(s1)
    80009354:	02100593          	li	a1,33
    80009358:	0087b503          	ld	a0,8(a5)
    8000935c:	ffffe097          	auipc	ra,0xffffe
    80009360:	e1c080e7          	jalr	-484(ra) # 80007178 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80009364:	0204b783          	ld	a5,32(s1)
    80009368:	0107b503          	ld	a0,16(a5)
    8000936c:	ffff8097          	auipc	ra,0xffff8
    80009370:	1b0080e7          	jalr	432(ra) # 8000151c <_ZN9Semaphore6signalEv>
    }
    80009374:	01813083          	ld	ra,24(sp)
    80009378:	01013403          	ld	s0,16(sp)
    8000937c:	00813483          	ld	s1,8(sp)
    80009380:	02010113          	addi	sp,sp,32
    80009384:	00008067          	ret

0000000080009388 <_ZN8Producer3runEv>:
    void run() override {
    80009388:	fe010113          	addi	sp,sp,-32
    8000938c:	00113c23          	sd	ra,24(sp)
    80009390:	00813823          	sd	s0,16(sp)
    80009394:	00913423          	sd	s1,8(sp)
    80009398:	01213023          	sd	s2,0(sp)
    8000939c:	02010413          	addi	s0,sp,32
    800093a0:	00050493          	mv	s1,a0
        int i = 0;
    800093a4:	00000913          	li	s2,0
        while (!threadEnd) {
    800093a8:	00006797          	auipc	a5,0x6
    800093ac:	0607a783          	lw	a5,96(a5) # 8000f408 <_ZL9threadEnd>
    800093b0:	04079263          	bnez	a5,800093f4 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800093b4:	0204b783          	ld	a5,32(s1)
    800093b8:	0007a583          	lw	a1,0(a5)
    800093bc:	0305859b          	addiw	a1,a1,48
    800093c0:	0087b503          	ld	a0,8(a5)
    800093c4:	ffffe097          	auipc	ra,0xffffe
    800093c8:	db4080e7          	jalr	-588(ra) # 80007178 <_ZN9BufferCPP3putEi>
            i++;
    800093cc:	0019071b          	addiw	a4,s2,1
    800093d0:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800093d4:	0204b783          	ld	a5,32(s1)
    800093d8:	0007a783          	lw	a5,0(a5)
    800093dc:	00e787bb          	addw	a5,a5,a4
    800093e0:	00500513          	li	a0,5
    800093e4:	02a7e53b          	remw	a0,a5,a0
    800093e8:	ffff8097          	auipc	ra,0xffff8
    800093ec:	03c080e7          	jalr	60(ra) # 80001424 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    800093f0:	fb9ff06f          	j	800093a8 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    800093f4:	0204b783          	ld	a5,32(s1)
    800093f8:	0107b503          	ld	a0,16(a5)
    800093fc:	ffff8097          	auipc	ra,0xffff8
    80009400:	120080e7          	jalr	288(ra) # 8000151c <_ZN9Semaphore6signalEv>
    }
    80009404:	01813083          	ld	ra,24(sp)
    80009408:	01013403          	ld	s0,16(sp)
    8000940c:	00813483          	ld	s1,8(sp)
    80009410:	00013903          	ld	s2,0(sp)
    80009414:	02010113          	addi	sp,sp,32
    80009418:	00008067          	ret

000000008000941c <start>:
    8000941c:	ff010113          	addi	sp,sp,-16
    80009420:	00813423          	sd	s0,8(sp)
    80009424:	01010413          	addi	s0,sp,16
    80009428:	300027f3          	csrr	a5,mstatus
    8000942c:	ffffe737          	lui	a4,0xffffe
    80009430:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffee17f>
    80009434:	00e7f7b3          	and	a5,a5,a4
    80009438:	00001737          	lui	a4,0x1
    8000943c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80009440:	00e7e7b3          	or	a5,a5,a4
    80009444:	30079073          	csrw	mstatus,a5
    80009448:	00000797          	auipc	a5,0x0
    8000944c:	16078793          	addi	a5,a5,352 # 800095a8 <system_main>
    80009450:	34179073          	csrw	mepc,a5
    80009454:	00000793          	li	a5,0
    80009458:	18079073          	csrw	satp,a5
    8000945c:	000107b7          	lui	a5,0x10
    80009460:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80009464:	30279073          	csrw	medeleg,a5
    80009468:	30379073          	csrw	mideleg,a5
    8000946c:	104027f3          	csrr	a5,sie
    80009470:	2227e793          	ori	a5,a5,546
    80009474:	10479073          	csrw	sie,a5
    80009478:	fff00793          	li	a5,-1
    8000947c:	00a7d793          	srli	a5,a5,0xa
    80009480:	3b079073          	csrw	pmpaddr0,a5
    80009484:	00f00793          	li	a5,15
    80009488:	3a079073          	csrw	pmpcfg0,a5
    8000948c:	f14027f3          	csrr	a5,mhartid
    80009490:	0200c737          	lui	a4,0x200c
    80009494:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80009498:	0007869b          	sext.w	a3,a5
    8000949c:	00269713          	slli	a4,a3,0x2
    800094a0:	000f4637          	lui	a2,0xf4
    800094a4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800094a8:	00d70733          	add	a4,a4,a3
    800094ac:	0037979b          	slliw	a5,a5,0x3
    800094b0:	020046b7          	lui	a3,0x2004
    800094b4:	00d787b3          	add	a5,a5,a3
    800094b8:	00c585b3          	add	a1,a1,a2
    800094bc:	00371693          	slli	a3,a4,0x3
    800094c0:	00006717          	auipc	a4,0x6
    800094c4:	f6070713          	addi	a4,a4,-160 # 8000f420 <timer_scratch>
    800094c8:	00b7b023          	sd	a1,0(a5)
    800094cc:	00d70733          	add	a4,a4,a3
    800094d0:	00f73c23          	sd	a5,24(a4)
    800094d4:	02c73023          	sd	a2,32(a4)
    800094d8:	34071073          	csrw	mscratch,a4
    800094dc:	00000797          	auipc	a5,0x0
    800094e0:	6e478793          	addi	a5,a5,1764 # 80009bc0 <timervec>
    800094e4:	30579073          	csrw	mtvec,a5
    800094e8:	300027f3          	csrr	a5,mstatus
    800094ec:	0087e793          	ori	a5,a5,8
    800094f0:	30079073          	csrw	mstatus,a5
    800094f4:	304027f3          	csrr	a5,mie
    800094f8:	0807e793          	ori	a5,a5,128
    800094fc:	30479073          	csrw	mie,a5
    80009500:	f14027f3          	csrr	a5,mhartid
    80009504:	0007879b          	sext.w	a5,a5
    80009508:	00078213          	mv	tp,a5
    8000950c:	30200073          	mret
    80009510:	00813403          	ld	s0,8(sp)
    80009514:	01010113          	addi	sp,sp,16
    80009518:	00008067          	ret

000000008000951c <timerinit>:
    8000951c:	ff010113          	addi	sp,sp,-16
    80009520:	00813423          	sd	s0,8(sp)
    80009524:	01010413          	addi	s0,sp,16
    80009528:	f14027f3          	csrr	a5,mhartid
    8000952c:	0200c737          	lui	a4,0x200c
    80009530:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80009534:	0007869b          	sext.w	a3,a5
    80009538:	00269713          	slli	a4,a3,0x2
    8000953c:	000f4637          	lui	a2,0xf4
    80009540:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80009544:	00d70733          	add	a4,a4,a3
    80009548:	0037979b          	slliw	a5,a5,0x3
    8000954c:	020046b7          	lui	a3,0x2004
    80009550:	00d787b3          	add	a5,a5,a3
    80009554:	00c585b3          	add	a1,a1,a2
    80009558:	00371693          	slli	a3,a4,0x3
    8000955c:	00006717          	auipc	a4,0x6
    80009560:	ec470713          	addi	a4,a4,-316 # 8000f420 <timer_scratch>
    80009564:	00b7b023          	sd	a1,0(a5)
    80009568:	00d70733          	add	a4,a4,a3
    8000956c:	00f73c23          	sd	a5,24(a4)
    80009570:	02c73023          	sd	a2,32(a4)
    80009574:	34071073          	csrw	mscratch,a4
    80009578:	00000797          	auipc	a5,0x0
    8000957c:	64878793          	addi	a5,a5,1608 # 80009bc0 <timervec>
    80009580:	30579073          	csrw	mtvec,a5
    80009584:	300027f3          	csrr	a5,mstatus
    80009588:	0087e793          	ori	a5,a5,8
    8000958c:	30079073          	csrw	mstatus,a5
    80009590:	304027f3          	csrr	a5,mie
    80009594:	0807e793          	ori	a5,a5,128
    80009598:	30479073          	csrw	mie,a5
    8000959c:	00813403          	ld	s0,8(sp)
    800095a0:	01010113          	addi	sp,sp,16
    800095a4:	00008067          	ret

00000000800095a8 <system_main>:
    800095a8:	fe010113          	addi	sp,sp,-32
    800095ac:	00813823          	sd	s0,16(sp)
    800095b0:	00913423          	sd	s1,8(sp)
    800095b4:	00113c23          	sd	ra,24(sp)
    800095b8:	02010413          	addi	s0,sp,32
    800095bc:	00000097          	auipc	ra,0x0
    800095c0:	0c4080e7          	jalr	196(ra) # 80009680 <cpuid>
    800095c4:	00006497          	auipc	s1,0x6
    800095c8:	d6c48493          	addi	s1,s1,-660 # 8000f330 <started>
    800095cc:	02050263          	beqz	a0,800095f0 <system_main+0x48>
    800095d0:	0004a783          	lw	a5,0(s1)
    800095d4:	0007879b          	sext.w	a5,a5
    800095d8:	fe078ce3          	beqz	a5,800095d0 <system_main+0x28>
    800095dc:	0ff0000f          	fence
    800095e0:	00003517          	auipc	a0,0x3
    800095e4:	43050513          	addi	a0,a0,1072 # 8000ca10 <CONSOLE_STATUS+0xa00>
    800095e8:	00001097          	auipc	ra,0x1
    800095ec:	a74080e7          	jalr	-1420(ra) # 8000a05c <panic>
    800095f0:	00001097          	auipc	ra,0x1
    800095f4:	9c8080e7          	jalr	-1592(ra) # 80009fb8 <consoleinit>
    800095f8:	00001097          	auipc	ra,0x1
    800095fc:	154080e7          	jalr	340(ra) # 8000a74c <printfinit>
    80009600:	00003517          	auipc	a0,0x3
    80009604:	26850513          	addi	a0,a0,616 # 8000c868 <CONSOLE_STATUS+0x858>
    80009608:	00001097          	auipc	ra,0x1
    8000960c:	ab0080e7          	jalr	-1360(ra) # 8000a0b8 <__printf>
    80009610:	00003517          	auipc	a0,0x3
    80009614:	3d050513          	addi	a0,a0,976 # 8000c9e0 <CONSOLE_STATUS+0x9d0>
    80009618:	00001097          	auipc	ra,0x1
    8000961c:	aa0080e7          	jalr	-1376(ra) # 8000a0b8 <__printf>
    80009620:	00003517          	auipc	a0,0x3
    80009624:	24850513          	addi	a0,a0,584 # 8000c868 <CONSOLE_STATUS+0x858>
    80009628:	00001097          	auipc	ra,0x1
    8000962c:	a90080e7          	jalr	-1392(ra) # 8000a0b8 <__printf>
    80009630:	00001097          	auipc	ra,0x1
    80009634:	4a8080e7          	jalr	1192(ra) # 8000aad8 <kinit>
    80009638:	00000097          	auipc	ra,0x0
    8000963c:	148080e7          	jalr	328(ra) # 80009780 <trapinit>
    80009640:	00000097          	auipc	ra,0x0
    80009644:	16c080e7          	jalr	364(ra) # 800097ac <trapinithart>
    80009648:	00000097          	auipc	ra,0x0
    8000964c:	5b8080e7          	jalr	1464(ra) # 80009c00 <plicinit>
    80009650:	00000097          	auipc	ra,0x0
    80009654:	5d8080e7          	jalr	1496(ra) # 80009c28 <plicinithart>
    80009658:	00000097          	auipc	ra,0x0
    8000965c:	078080e7          	jalr	120(ra) # 800096d0 <userinit>
    80009660:	0ff0000f          	fence
    80009664:	00100793          	li	a5,1
    80009668:	00003517          	auipc	a0,0x3
    8000966c:	39050513          	addi	a0,a0,912 # 8000c9f8 <CONSOLE_STATUS+0x9e8>
    80009670:	00f4a023          	sw	a5,0(s1)
    80009674:	00001097          	auipc	ra,0x1
    80009678:	a44080e7          	jalr	-1468(ra) # 8000a0b8 <__printf>
    8000967c:	0000006f          	j	8000967c <system_main+0xd4>

0000000080009680 <cpuid>:
    80009680:	ff010113          	addi	sp,sp,-16
    80009684:	00813423          	sd	s0,8(sp)
    80009688:	01010413          	addi	s0,sp,16
    8000968c:	00020513          	mv	a0,tp
    80009690:	00813403          	ld	s0,8(sp)
    80009694:	0005051b          	sext.w	a0,a0
    80009698:	01010113          	addi	sp,sp,16
    8000969c:	00008067          	ret

00000000800096a0 <mycpu>:
    800096a0:	ff010113          	addi	sp,sp,-16
    800096a4:	00813423          	sd	s0,8(sp)
    800096a8:	01010413          	addi	s0,sp,16
    800096ac:	00020793          	mv	a5,tp
    800096b0:	00813403          	ld	s0,8(sp)
    800096b4:	0007879b          	sext.w	a5,a5
    800096b8:	00779793          	slli	a5,a5,0x7
    800096bc:	00007517          	auipc	a0,0x7
    800096c0:	d9450513          	addi	a0,a0,-620 # 80010450 <cpus>
    800096c4:	00f50533          	add	a0,a0,a5
    800096c8:	01010113          	addi	sp,sp,16
    800096cc:	00008067          	ret

00000000800096d0 <userinit>:
    800096d0:	ff010113          	addi	sp,sp,-16
    800096d4:	00813423          	sd	s0,8(sp)
    800096d8:	01010413          	addi	s0,sp,16
    800096dc:	00813403          	ld	s0,8(sp)
    800096e0:	01010113          	addi	sp,sp,16
    800096e4:	ffff9317          	auipc	t1,0xffff9
    800096e8:	4bc30067          	jr	1212(t1) # 80002ba0 <main>

00000000800096ec <either_copyout>:
    800096ec:	ff010113          	addi	sp,sp,-16
    800096f0:	00813023          	sd	s0,0(sp)
    800096f4:	00113423          	sd	ra,8(sp)
    800096f8:	01010413          	addi	s0,sp,16
    800096fc:	02051663          	bnez	a0,80009728 <either_copyout+0x3c>
    80009700:	00058513          	mv	a0,a1
    80009704:	00060593          	mv	a1,a2
    80009708:	0006861b          	sext.w	a2,a3
    8000970c:	00002097          	auipc	ra,0x2
    80009710:	c58080e7          	jalr	-936(ra) # 8000b364 <__memmove>
    80009714:	00813083          	ld	ra,8(sp)
    80009718:	00013403          	ld	s0,0(sp)
    8000971c:	00000513          	li	a0,0
    80009720:	01010113          	addi	sp,sp,16
    80009724:	00008067          	ret
    80009728:	00003517          	auipc	a0,0x3
    8000972c:	31050513          	addi	a0,a0,784 # 8000ca38 <CONSOLE_STATUS+0xa28>
    80009730:	00001097          	auipc	ra,0x1
    80009734:	92c080e7          	jalr	-1748(ra) # 8000a05c <panic>

0000000080009738 <either_copyin>:
    80009738:	ff010113          	addi	sp,sp,-16
    8000973c:	00813023          	sd	s0,0(sp)
    80009740:	00113423          	sd	ra,8(sp)
    80009744:	01010413          	addi	s0,sp,16
    80009748:	02059463          	bnez	a1,80009770 <either_copyin+0x38>
    8000974c:	00060593          	mv	a1,a2
    80009750:	0006861b          	sext.w	a2,a3
    80009754:	00002097          	auipc	ra,0x2
    80009758:	c10080e7          	jalr	-1008(ra) # 8000b364 <__memmove>
    8000975c:	00813083          	ld	ra,8(sp)
    80009760:	00013403          	ld	s0,0(sp)
    80009764:	00000513          	li	a0,0
    80009768:	01010113          	addi	sp,sp,16
    8000976c:	00008067          	ret
    80009770:	00003517          	auipc	a0,0x3
    80009774:	2f050513          	addi	a0,a0,752 # 8000ca60 <CONSOLE_STATUS+0xa50>
    80009778:	00001097          	auipc	ra,0x1
    8000977c:	8e4080e7          	jalr	-1820(ra) # 8000a05c <panic>

0000000080009780 <trapinit>:
    80009780:	ff010113          	addi	sp,sp,-16
    80009784:	00813423          	sd	s0,8(sp)
    80009788:	01010413          	addi	s0,sp,16
    8000978c:	00813403          	ld	s0,8(sp)
    80009790:	00003597          	auipc	a1,0x3
    80009794:	2f858593          	addi	a1,a1,760 # 8000ca88 <CONSOLE_STATUS+0xa78>
    80009798:	00007517          	auipc	a0,0x7
    8000979c:	d3850513          	addi	a0,a0,-712 # 800104d0 <tickslock>
    800097a0:	01010113          	addi	sp,sp,16
    800097a4:	00001317          	auipc	t1,0x1
    800097a8:	5c430067          	jr	1476(t1) # 8000ad68 <initlock>

00000000800097ac <trapinithart>:
    800097ac:	ff010113          	addi	sp,sp,-16
    800097b0:	00813423          	sd	s0,8(sp)
    800097b4:	01010413          	addi	s0,sp,16
    800097b8:	00000797          	auipc	a5,0x0
    800097bc:	2f878793          	addi	a5,a5,760 # 80009ab0 <kernelvec>
    800097c0:	10579073          	csrw	stvec,a5
    800097c4:	00813403          	ld	s0,8(sp)
    800097c8:	01010113          	addi	sp,sp,16
    800097cc:	00008067          	ret

00000000800097d0 <usertrap>:
    800097d0:	ff010113          	addi	sp,sp,-16
    800097d4:	00813423          	sd	s0,8(sp)
    800097d8:	01010413          	addi	s0,sp,16
    800097dc:	00813403          	ld	s0,8(sp)
    800097e0:	01010113          	addi	sp,sp,16
    800097e4:	00008067          	ret

00000000800097e8 <usertrapret>:
    800097e8:	ff010113          	addi	sp,sp,-16
    800097ec:	00813423          	sd	s0,8(sp)
    800097f0:	01010413          	addi	s0,sp,16
    800097f4:	00813403          	ld	s0,8(sp)
    800097f8:	01010113          	addi	sp,sp,16
    800097fc:	00008067          	ret

0000000080009800 <kerneltrap>:
    80009800:	fe010113          	addi	sp,sp,-32
    80009804:	00813823          	sd	s0,16(sp)
    80009808:	00113c23          	sd	ra,24(sp)
    8000980c:	00913423          	sd	s1,8(sp)
    80009810:	02010413          	addi	s0,sp,32
    80009814:	142025f3          	csrr	a1,scause
    80009818:	100027f3          	csrr	a5,sstatus
    8000981c:	0027f793          	andi	a5,a5,2
    80009820:	10079c63          	bnez	a5,80009938 <kerneltrap+0x138>
    80009824:	142027f3          	csrr	a5,scause
    80009828:	0207ce63          	bltz	a5,80009864 <kerneltrap+0x64>
    8000982c:	00003517          	auipc	a0,0x3
    80009830:	2a450513          	addi	a0,a0,676 # 8000cad0 <CONSOLE_STATUS+0xac0>
    80009834:	00001097          	auipc	ra,0x1
    80009838:	884080e7          	jalr	-1916(ra) # 8000a0b8 <__printf>
    8000983c:	141025f3          	csrr	a1,sepc
    80009840:	14302673          	csrr	a2,stval
    80009844:	00003517          	auipc	a0,0x3
    80009848:	29c50513          	addi	a0,a0,668 # 8000cae0 <CONSOLE_STATUS+0xad0>
    8000984c:	00001097          	auipc	ra,0x1
    80009850:	86c080e7          	jalr	-1940(ra) # 8000a0b8 <__printf>
    80009854:	00003517          	auipc	a0,0x3
    80009858:	2a450513          	addi	a0,a0,676 # 8000caf8 <CONSOLE_STATUS+0xae8>
    8000985c:	00001097          	auipc	ra,0x1
    80009860:	800080e7          	jalr	-2048(ra) # 8000a05c <panic>
    80009864:	0ff7f713          	andi	a4,a5,255
    80009868:	00900693          	li	a3,9
    8000986c:	04d70063          	beq	a4,a3,800098ac <kerneltrap+0xac>
    80009870:	fff00713          	li	a4,-1
    80009874:	03f71713          	slli	a4,a4,0x3f
    80009878:	00170713          	addi	a4,a4,1
    8000987c:	fae798e3          	bne	a5,a4,8000982c <kerneltrap+0x2c>
    80009880:	00000097          	auipc	ra,0x0
    80009884:	e00080e7          	jalr	-512(ra) # 80009680 <cpuid>
    80009888:	06050663          	beqz	a0,800098f4 <kerneltrap+0xf4>
    8000988c:	144027f3          	csrr	a5,sip
    80009890:	ffd7f793          	andi	a5,a5,-3
    80009894:	14479073          	csrw	sip,a5
    80009898:	01813083          	ld	ra,24(sp)
    8000989c:	01013403          	ld	s0,16(sp)
    800098a0:	00813483          	ld	s1,8(sp)
    800098a4:	02010113          	addi	sp,sp,32
    800098a8:	00008067          	ret
    800098ac:	00000097          	auipc	ra,0x0
    800098b0:	3c8080e7          	jalr	968(ra) # 80009c74 <plic_claim>
    800098b4:	00a00793          	li	a5,10
    800098b8:	00050493          	mv	s1,a0
    800098bc:	06f50863          	beq	a0,a5,8000992c <kerneltrap+0x12c>
    800098c0:	fc050ce3          	beqz	a0,80009898 <kerneltrap+0x98>
    800098c4:	00050593          	mv	a1,a0
    800098c8:	00003517          	auipc	a0,0x3
    800098cc:	1e850513          	addi	a0,a0,488 # 8000cab0 <CONSOLE_STATUS+0xaa0>
    800098d0:	00000097          	auipc	ra,0x0
    800098d4:	7e8080e7          	jalr	2024(ra) # 8000a0b8 <__printf>
    800098d8:	01013403          	ld	s0,16(sp)
    800098dc:	01813083          	ld	ra,24(sp)
    800098e0:	00048513          	mv	a0,s1
    800098e4:	00813483          	ld	s1,8(sp)
    800098e8:	02010113          	addi	sp,sp,32
    800098ec:	00000317          	auipc	t1,0x0
    800098f0:	3c030067          	jr	960(t1) # 80009cac <plic_complete>
    800098f4:	00007517          	auipc	a0,0x7
    800098f8:	bdc50513          	addi	a0,a0,-1060 # 800104d0 <tickslock>
    800098fc:	00001097          	auipc	ra,0x1
    80009900:	490080e7          	jalr	1168(ra) # 8000ad8c <acquire>
    80009904:	00006717          	auipc	a4,0x6
    80009908:	a3070713          	addi	a4,a4,-1488 # 8000f334 <ticks>
    8000990c:	00072783          	lw	a5,0(a4)
    80009910:	00007517          	auipc	a0,0x7
    80009914:	bc050513          	addi	a0,a0,-1088 # 800104d0 <tickslock>
    80009918:	0017879b          	addiw	a5,a5,1
    8000991c:	00f72023          	sw	a5,0(a4)
    80009920:	00001097          	auipc	ra,0x1
    80009924:	538080e7          	jalr	1336(ra) # 8000ae58 <release>
    80009928:	f65ff06f          	j	8000988c <kerneltrap+0x8c>
    8000992c:	00001097          	auipc	ra,0x1
    80009930:	094080e7          	jalr	148(ra) # 8000a9c0 <uartintr>
    80009934:	fa5ff06f          	j	800098d8 <kerneltrap+0xd8>
    80009938:	00003517          	auipc	a0,0x3
    8000993c:	15850513          	addi	a0,a0,344 # 8000ca90 <CONSOLE_STATUS+0xa80>
    80009940:	00000097          	auipc	ra,0x0
    80009944:	71c080e7          	jalr	1820(ra) # 8000a05c <panic>

0000000080009948 <clockintr>:
    80009948:	fe010113          	addi	sp,sp,-32
    8000994c:	00813823          	sd	s0,16(sp)
    80009950:	00913423          	sd	s1,8(sp)
    80009954:	00113c23          	sd	ra,24(sp)
    80009958:	02010413          	addi	s0,sp,32
    8000995c:	00007497          	auipc	s1,0x7
    80009960:	b7448493          	addi	s1,s1,-1164 # 800104d0 <tickslock>
    80009964:	00048513          	mv	a0,s1
    80009968:	00001097          	auipc	ra,0x1
    8000996c:	424080e7          	jalr	1060(ra) # 8000ad8c <acquire>
    80009970:	00006717          	auipc	a4,0x6
    80009974:	9c470713          	addi	a4,a4,-1596 # 8000f334 <ticks>
    80009978:	00072783          	lw	a5,0(a4)
    8000997c:	01013403          	ld	s0,16(sp)
    80009980:	01813083          	ld	ra,24(sp)
    80009984:	00048513          	mv	a0,s1
    80009988:	0017879b          	addiw	a5,a5,1
    8000998c:	00813483          	ld	s1,8(sp)
    80009990:	00f72023          	sw	a5,0(a4)
    80009994:	02010113          	addi	sp,sp,32
    80009998:	00001317          	auipc	t1,0x1
    8000999c:	4c030067          	jr	1216(t1) # 8000ae58 <release>

00000000800099a0 <devintr>:
    800099a0:	142027f3          	csrr	a5,scause
    800099a4:	00000513          	li	a0,0
    800099a8:	0007c463          	bltz	a5,800099b0 <devintr+0x10>
    800099ac:	00008067          	ret
    800099b0:	fe010113          	addi	sp,sp,-32
    800099b4:	00813823          	sd	s0,16(sp)
    800099b8:	00113c23          	sd	ra,24(sp)
    800099bc:	00913423          	sd	s1,8(sp)
    800099c0:	02010413          	addi	s0,sp,32
    800099c4:	0ff7f713          	andi	a4,a5,255
    800099c8:	00900693          	li	a3,9
    800099cc:	04d70c63          	beq	a4,a3,80009a24 <devintr+0x84>
    800099d0:	fff00713          	li	a4,-1
    800099d4:	03f71713          	slli	a4,a4,0x3f
    800099d8:	00170713          	addi	a4,a4,1
    800099dc:	00e78c63          	beq	a5,a4,800099f4 <devintr+0x54>
    800099e0:	01813083          	ld	ra,24(sp)
    800099e4:	01013403          	ld	s0,16(sp)
    800099e8:	00813483          	ld	s1,8(sp)
    800099ec:	02010113          	addi	sp,sp,32
    800099f0:	00008067          	ret
    800099f4:	00000097          	auipc	ra,0x0
    800099f8:	c8c080e7          	jalr	-884(ra) # 80009680 <cpuid>
    800099fc:	06050663          	beqz	a0,80009a68 <devintr+0xc8>
    80009a00:	144027f3          	csrr	a5,sip
    80009a04:	ffd7f793          	andi	a5,a5,-3
    80009a08:	14479073          	csrw	sip,a5
    80009a0c:	01813083          	ld	ra,24(sp)
    80009a10:	01013403          	ld	s0,16(sp)
    80009a14:	00813483          	ld	s1,8(sp)
    80009a18:	00200513          	li	a0,2
    80009a1c:	02010113          	addi	sp,sp,32
    80009a20:	00008067          	ret
    80009a24:	00000097          	auipc	ra,0x0
    80009a28:	250080e7          	jalr	592(ra) # 80009c74 <plic_claim>
    80009a2c:	00a00793          	li	a5,10
    80009a30:	00050493          	mv	s1,a0
    80009a34:	06f50663          	beq	a0,a5,80009aa0 <devintr+0x100>
    80009a38:	00100513          	li	a0,1
    80009a3c:	fa0482e3          	beqz	s1,800099e0 <devintr+0x40>
    80009a40:	00048593          	mv	a1,s1
    80009a44:	00003517          	auipc	a0,0x3
    80009a48:	06c50513          	addi	a0,a0,108 # 8000cab0 <CONSOLE_STATUS+0xaa0>
    80009a4c:	00000097          	auipc	ra,0x0
    80009a50:	66c080e7          	jalr	1644(ra) # 8000a0b8 <__printf>
    80009a54:	00048513          	mv	a0,s1
    80009a58:	00000097          	auipc	ra,0x0
    80009a5c:	254080e7          	jalr	596(ra) # 80009cac <plic_complete>
    80009a60:	00100513          	li	a0,1
    80009a64:	f7dff06f          	j	800099e0 <devintr+0x40>
    80009a68:	00007517          	auipc	a0,0x7
    80009a6c:	a6850513          	addi	a0,a0,-1432 # 800104d0 <tickslock>
    80009a70:	00001097          	auipc	ra,0x1
    80009a74:	31c080e7          	jalr	796(ra) # 8000ad8c <acquire>
    80009a78:	00006717          	auipc	a4,0x6
    80009a7c:	8bc70713          	addi	a4,a4,-1860 # 8000f334 <ticks>
    80009a80:	00072783          	lw	a5,0(a4)
    80009a84:	00007517          	auipc	a0,0x7
    80009a88:	a4c50513          	addi	a0,a0,-1460 # 800104d0 <tickslock>
    80009a8c:	0017879b          	addiw	a5,a5,1
    80009a90:	00f72023          	sw	a5,0(a4)
    80009a94:	00001097          	auipc	ra,0x1
    80009a98:	3c4080e7          	jalr	964(ra) # 8000ae58 <release>
    80009a9c:	f65ff06f          	j	80009a00 <devintr+0x60>
    80009aa0:	00001097          	auipc	ra,0x1
    80009aa4:	f20080e7          	jalr	-224(ra) # 8000a9c0 <uartintr>
    80009aa8:	fadff06f          	j	80009a54 <devintr+0xb4>
    80009aac:	0000                	unimp
	...

0000000080009ab0 <kernelvec>:
    80009ab0:	f0010113          	addi	sp,sp,-256
    80009ab4:	00113023          	sd	ra,0(sp)
    80009ab8:	00213423          	sd	sp,8(sp)
    80009abc:	00313823          	sd	gp,16(sp)
    80009ac0:	00413c23          	sd	tp,24(sp)
    80009ac4:	02513023          	sd	t0,32(sp)
    80009ac8:	02613423          	sd	t1,40(sp)
    80009acc:	02713823          	sd	t2,48(sp)
    80009ad0:	02813c23          	sd	s0,56(sp)
    80009ad4:	04913023          	sd	s1,64(sp)
    80009ad8:	04a13423          	sd	a0,72(sp)
    80009adc:	04b13823          	sd	a1,80(sp)
    80009ae0:	04c13c23          	sd	a2,88(sp)
    80009ae4:	06d13023          	sd	a3,96(sp)
    80009ae8:	06e13423          	sd	a4,104(sp)
    80009aec:	06f13823          	sd	a5,112(sp)
    80009af0:	07013c23          	sd	a6,120(sp)
    80009af4:	09113023          	sd	a7,128(sp)
    80009af8:	09213423          	sd	s2,136(sp)
    80009afc:	09313823          	sd	s3,144(sp)
    80009b00:	09413c23          	sd	s4,152(sp)
    80009b04:	0b513023          	sd	s5,160(sp)
    80009b08:	0b613423          	sd	s6,168(sp)
    80009b0c:	0b713823          	sd	s7,176(sp)
    80009b10:	0b813c23          	sd	s8,184(sp)
    80009b14:	0d913023          	sd	s9,192(sp)
    80009b18:	0da13423          	sd	s10,200(sp)
    80009b1c:	0db13823          	sd	s11,208(sp)
    80009b20:	0dc13c23          	sd	t3,216(sp)
    80009b24:	0fd13023          	sd	t4,224(sp)
    80009b28:	0fe13423          	sd	t5,232(sp)
    80009b2c:	0ff13823          	sd	t6,240(sp)
    80009b30:	cd1ff0ef          	jal	ra,80009800 <kerneltrap>
    80009b34:	00013083          	ld	ra,0(sp)
    80009b38:	00813103          	ld	sp,8(sp)
    80009b3c:	01013183          	ld	gp,16(sp)
    80009b40:	02013283          	ld	t0,32(sp)
    80009b44:	02813303          	ld	t1,40(sp)
    80009b48:	03013383          	ld	t2,48(sp)
    80009b4c:	03813403          	ld	s0,56(sp)
    80009b50:	04013483          	ld	s1,64(sp)
    80009b54:	04813503          	ld	a0,72(sp)
    80009b58:	05013583          	ld	a1,80(sp)
    80009b5c:	05813603          	ld	a2,88(sp)
    80009b60:	06013683          	ld	a3,96(sp)
    80009b64:	06813703          	ld	a4,104(sp)
    80009b68:	07013783          	ld	a5,112(sp)
    80009b6c:	07813803          	ld	a6,120(sp)
    80009b70:	08013883          	ld	a7,128(sp)
    80009b74:	08813903          	ld	s2,136(sp)
    80009b78:	09013983          	ld	s3,144(sp)
    80009b7c:	09813a03          	ld	s4,152(sp)
    80009b80:	0a013a83          	ld	s5,160(sp)
    80009b84:	0a813b03          	ld	s6,168(sp)
    80009b88:	0b013b83          	ld	s7,176(sp)
    80009b8c:	0b813c03          	ld	s8,184(sp)
    80009b90:	0c013c83          	ld	s9,192(sp)
    80009b94:	0c813d03          	ld	s10,200(sp)
    80009b98:	0d013d83          	ld	s11,208(sp)
    80009b9c:	0d813e03          	ld	t3,216(sp)
    80009ba0:	0e013e83          	ld	t4,224(sp)
    80009ba4:	0e813f03          	ld	t5,232(sp)
    80009ba8:	0f013f83          	ld	t6,240(sp)
    80009bac:	10010113          	addi	sp,sp,256
    80009bb0:	10200073          	sret
    80009bb4:	00000013          	nop
    80009bb8:	00000013          	nop
    80009bbc:	00000013          	nop

0000000080009bc0 <timervec>:
    80009bc0:	34051573          	csrrw	a0,mscratch,a0
    80009bc4:	00b53023          	sd	a1,0(a0)
    80009bc8:	00c53423          	sd	a2,8(a0)
    80009bcc:	00d53823          	sd	a3,16(a0)
    80009bd0:	01853583          	ld	a1,24(a0)
    80009bd4:	02053603          	ld	a2,32(a0)
    80009bd8:	0005b683          	ld	a3,0(a1)
    80009bdc:	00c686b3          	add	a3,a3,a2
    80009be0:	00d5b023          	sd	a3,0(a1)
    80009be4:	00200593          	li	a1,2
    80009be8:	14459073          	csrw	sip,a1
    80009bec:	01053683          	ld	a3,16(a0)
    80009bf0:	00853603          	ld	a2,8(a0)
    80009bf4:	00053583          	ld	a1,0(a0)
    80009bf8:	34051573          	csrrw	a0,mscratch,a0
    80009bfc:	30200073          	mret

0000000080009c00 <plicinit>:
    80009c00:	ff010113          	addi	sp,sp,-16
    80009c04:	00813423          	sd	s0,8(sp)
    80009c08:	01010413          	addi	s0,sp,16
    80009c0c:	00813403          	ld	s0,8(sp)
    80009c10:	0c0007b7          	lui	a5,0xc000
    80009c14:	00100713          	li	a4,1
    80009c18:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80009c1c:	00e7a223          	sw	a4,4(a5)
    80009c20:	01010113          	addi	sp,sp,16
    80009c24:	00008067          	ret

0000000080009c28 <plicinithart>:
    80009c28:	ff010113          	addi	sp,sp,-16
    80009c2c:	00813023          	sd	s0,0(sp)
    80009c30:	00113423          	sd	ra,8(sp)
    80009c34:	01010413          	addi	s0,sp,16
    80009c38:	00000097          	auipc	ra,0x0
    80009c3c:	a48080e7          	jalr	-1464(ra) # 80009680 <cpuid>
    80009c40:	0085171b          	slliw	a4,a0,0x8
    80009c44:	0c0027b7          	lui	a5,0xc002
    80009c48:	00e787b3          	add	a5,a5,a4
    80009c4c:	40200713          	li	a4,1026
    80009c50:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80009c54:	00813083          	ld	ra,8(sp)
    80009c58:	00013403          	ld	s0,0(sp)
    80009c5c:	00d5151b          	slliw	a0,a0,0xd
    80009c60:	0c2017b7          	lui	a5,0xc201
    80009c64:	00a78533          	add	a0,a5,a0
    80009c68:	00052023          	sw	zero,0(a0)
    80009c6c:	01010113          	addi	sp,sp,16
    80009c70:	00008067          	ret

0000000080009c74 <plic_claim>:
    80009c74:	ff010113          	addi	sp,sp,-16
    80009c78:	00813023          	sd	s0,0(sp)
    80009c7c:	00113423          	sd	ra,8(sp)
    80009c80:	01010413          	addi	s0,sp,16
    80009c84:	00000097          	auipc	ra,0x0
    80009c88:	9fc080e7          	jalr	-1540(ra) # 80009680 <cpuid>
    80009c8c:	00813083          	ld	ra,8(sp)
    80009c90:	00013403          	ld	s0,0(sp)
    80009c94:	00d5151b          	slliw	a0,a0,0xd
    80009c98:	0c2017b7          	lui	a5,0xc201
    80009c9c:	00a78533          	add	a0,a5,a0
    80009ca0:	00452503          	lw	a0,4(a0)
    80009ca4:	01010113          	addi	sp,sp,16
    80009ca8:	00008067          	ret

0000000080009cac <plic_complete>:
    80009cac:	fe010113          	addi	sp,sp,-32
    80009cb0:	00813823          	sd	s0,16(sp)
    80009cb4:	00913423          	sd	s1,8(sp)
    80009cb8:	00113c23          	sd	ra,24(sp)
    80009cbc:	02010413          	addi	s0,sp,32
    80009cc0:	00050493          	mv	s1,a0
    80009cc4:	00000097          	auipc	ra,0x0
    80009cc8:	9bc080e7          	jalr	-1604(ra) # 80009680 <cpuid>
    80009ccc:	01813083          	ld	ra,24(sp)
    80009cd0:	01013403          	ld	s0,16(sp)
    80009cd4:	00d5179b          	slliw	a5,a0,0xd
    80009cd8:	0c201737          	lui	a4,0xc201
    80009cdc:	00f707b3          	add	a5,a4,a5
    80009ce0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80009ce4:	00813483          	ld	s1,8(sp)
    80009ce8:	02010113          	addi	sp,sp,32
    80009cec:	00008067          	ret

0000000080009cf0 <consolewrite>:
    80009cf0:	fb010113          	addi	sp,sp,-80
    80009cf4:	04813023          	sd	s0,64(sp)
    80009cf8:	04113423          	sd	ra,72(sp)
    80009cfc:	02913c23          	sd	s1,56(sp)
    80009d00:	03213823          	sd	s2,48(sp)
    80009d04:	03313423          	sd	s3,40(sp)
    80009d08:	03413023          	sd	s4,32(sp)
    80009d0c:	01513c23          	sd	s5,24(sp)
    80009d10:	05010413          	addi	s0,sp,80
    80009d14:	06c05c63          	blez	a2,80009d8c <consolewrite+0x9c>
    80009d18:	00060993          	mv	s3,a2
    80009d1c:	00050a13          	mv	s4,a0
    80009d20:	00058493          	mv	s1,a1
    80009d24:	00000913          	li	s2,0
    80009d28:	fff00a93          	li	s5,-1
    80009d2c:	01c0006f          	j	80009d48 <consolewrite+0x58>
    80009d30:	fbf44503          	lbu	a0,-65(s0)
    80009d34:	0019091b          	addiw	s2,s2,1
    80009d38:	00148493          	addi	s1,s1,1
    80009d3c:	00001097          	auipc	ra,0x1
    80009d40:	a9c080e7          	jalr	-1380(ra) # 8000a7d8 <uartputc>
    80009d44:	03298063          	beq	s3,s2,80009d64 <consolewrite+0x74>
    80009d48:	00048613          	mv	a2,s1
    80009d4c:	00100693          	li	a3,1
    80009d50:	000a0593          	mv	a1,s4
    80009d54:	fbf40513          	addi	a0,s0,-65
    80009d58:	00000097          	auipc	ra,0x0
    80009d5c:	9e0080e7          	jalr	-1568(ra) # 80009738 <either_copyin>
    80009d60:	fd5518e3          	bne	a0,s5,80009d30 <consolewrite+0x40>
    80009d64:	04813083          	ld	ra,72(sp)
    80009d68:	04013403          	ld	s0,64(sp)
    80009d6c:	03813483          	ld	s1,56(sp)
    80009d70:	02813983          	ld	s3,40(sp)
    80009d74:	02013a03          	ld	s4,32(sp)
    80009d78:	01813a83          	ld	s5,24(sp)
    80009d7c:	00090513          	mv	a0,s2
    80009d80:	03013903          	ld	s2,48(sp)
    80009d84:	05010113          	addi	sp,sp,80
    80009d88:	00008067          	ret
    80009d8c:	00000913          	li	s2,0
    80009d90:	fd5ff06f          	j	80009d64 <consolewrite+0x74>

0000000080009d94 <consoleread>:
    80009d94:	f9010113          	addi	sp,sp,-112
    80009d98:	06813023          	sd	s0,96(sp)
    80009d9c:	04913c23          	sd	s1,88(sp)
    80009da0:	05213823          	sd	s2,80(sp)
    80009da4:	05313423          	sd	s3,72(sp)
    80009da8:	05413023          	sd	s4,64(sp)
    80009dac:	03513c23          	sd	s5,56(sp)
    80009db0:	03613823          	sd	s6,48(sp)
    80009db4:	03713423          	sd	s7,40(sp)
    80009db8:	03813023          	sd	s8,32(sp)
    80009dbc:	06113423          	sd	ra,104(sp)
    80009dc0:	01913c23          	sd	s9,24(sp)
    80009dc4:	07010413          	addi	s0,sp,112
    80009dc8:	00060b93          	mv	s7,a2
    80009dcc:	00050913          	mv	s2,a0
    80009dd0:	00058c13          	mv	s8,a1
    80009dd4:	00060b1b          	sext.w	s6,a2
    80009dd8:	00006497          	auipc	s1,0x6
    80009ddc:	72048493          	addi	s1,s1,1824 # 800104f8 <cons>
    80009de0:	00400993          	li	s3,4
    80009de4:	fff00a13          	li	s4,-1
    80009de8:	00a00a93          	li	s5,10
    80009dec:	05705e63          	blez	s7,80009e48 <consoleread+0xb4>
    80009df0:	09c4a703          	lw	a4,156(s1)
    80009df4:	0984a783          	lw	a5,152(s1)
    80009df8:	0007071b          	sext.w	a4,a4
    80009dfc:	08e78463          	beq	a5,a4,80009e84 <consoleread+0xf0>
    80009e00:	07f7f713          	andi	a4,a5,127
    80009e04:	00e48733          	add	a4,s1,a4
    80009e08:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80009e0c:	0017869b          	addiw	a3,a5,1
    80009e10:	08d4ac23          	sw	a3,152(s1)
    80009e14:	00070c9b          	sext.w	s9,a4
    80009e18:	0b370663          	beq	a4,s3,80009ec4 <consoleread+0x130>
    80009e1c:	00100693          	li	a3,1
    80009e20:	f9f40613          	addi	a2,s0,-97
    80009e24:	000c0593          	mv	a1,s8
    80009e28:	00090513          	mv	a0,s2
    80009e2c:	f8e40fa3          	sb	a4,-97(s0)
    80009e30:	00000097          	auipc	ra,0x0
    80009e34:	8bc080e7          	jalr	-1860(ra) # 800096ec <either_copyout>
    80009e38:	01450863          	beq	a0,s4,80009e48 <consoleread+0xb4>
    80009e3c:	001c0c13          	addi	s8,s8,1
    80009e40:	fffb8b9b          	addiw	s7,s7,-1
    80009e44:	fb5c94e3          	bne	s9,s5,80009dec <consoleread+0x58>
    80009e48:	000b851b          	sext.w	a0,s7
    80009e4c:	06813083          	ld	ra,104(sp)
    80009e50:	06013403          	ld	s0,96(sp)
    80009e54:	05813483          	ld	s1,88(sp)
    80009e58:	05013903          	ld	s2,80(sp)
    80009e5c:	04813983          	ld	s3,72(sp)
    80009e60:	04013a03          	ld	s4,64(sp)
    80009e64:	03813a83          	ld	s5,56(sp)
    80009e68:	02813b83          	ld	s7,40(sp)
    80009e6c:	02013c03          	ld	s8,32(sp)
    80009e70:	01813c83          	ld	s9,24(sp)
    80009e74:	40ab053b          	subw	a0,s6,a0
    80009e78:	03013b03          	ld	s6,48(sp)
    80009e7c:	07010113          	addi	sp,sp,112
    80009e80:	00008067          	ret
    80009e84:	00001097          	auipc	ra,0x1
    80009e88:	1d8080e7          	jalr	472(ra) # 8000b05c <push_on>
    80009e8c:	0984a703          	lw	a4,152(s1)
    80009e90:	09c4a783          	lw	a5,156(s1)
    80009e94:	0007879b          	sext.w	a5,a5
    80009e98:	fef70ce3          	beq	a4,a5,80009e90 <consoleread+0xfc>
    80009e9c:	00001097          	auipc	ra,0x1
    80009ea0:	234080e7          	jalr	564(ra) # 8000b0d0 <pop_on>
    80009ea4:	0984a783          	lw	a5,152(s1)
    80009ea8:	07f7f713          	andi	a4,a5,127
    80009eac:	00e48733          	add	a4,s1,a4
    80009eb0:	01874703          	lbu	a4,24(a4)
    80009eb4:	0017869b          	addiw	a3,a5,1
    80009eb8:	08d4ac23          	sw	a3,152(s1)
    80009ebc:	00070c9b          	sext.w	s9,a4
    80009ec0:	f5371ee3          	bne	a4,s3,80009e1c <consoleread+0x88>
    80009ec4:	000b851b          	sext.w	a0,s7
    80009ec8:	f96bf2e3          	bgeu	s7,s6,80009e4c <consoleread+0xb8>
    80009ecc:	08f4ac23          	sw	a5,152(s1)
    80009ed0:	f7dff06f          	j	80009e4c <consoleread+0xb8>

0000000080009ed4 <consputc>:
    80009ed4:	10000793          	li	a5,256
    80009ed8:	00f50663          	beq	a0,a5,80009ee4 <consputc+0x10>
    80009edc:	00001317          	auipc	t1,0x1
    80009ee0:	9f430067          	jr	-1548(t1) # 8000a8d0 <uartputc_sync>
    80009ee4:	ff010113          	addi	sp,sp,-16
    80009ee8:	00113423          	sd	ra,8(sp)
    80009eec:	00813023          	sd	s0,0(sp)
    80009ef0:	01010413          	addi	s0,sp,16
    80009ef4:	00800513          	li	a0,8
    80009ef8:	00001097          	auipc	ra,0x1
    80009efc:	9d8080e7          	jalr	-1576(ra) # 8000a8d0 <uartputc_sync>
    80009f00:	02000513          	li	a0,32
    80009f04:	00001097          	auipc	ra,0x1
    80009f08:	9cc080e7          	jalr	-1588(ra) # 8000a8d0 <uartputc_sync>
    80009f0c:	00013403          	ld	s0,0(sp)
    80009f10:	00813083          	ld	ra,8(sp)
    80009f14:	00800513          	li	a0,8
    80009f18:	01010113          	addi	sp,sp,16
    80009f1c:	00001317          	auipc	t1,0x1
    80009f20:	9b430067          	jr	-1612(t1) # 8000a8d0 <uartputc_sync>

0000000080009f24 <consoleintr>:
    80009f24:	fe010113          	addi	sp,sp,-32
    80009f28:	00813823          	sd	s0,16(sp)
    80009f2c:	00913423          	sd	s1,8(sp)
    80009f30:	01213023          	sd	s2,0(sp)
    80009f34:	00113c23          	sd	ra,24(sp)
    80009f38:	02010413          	addi	s0,sp,32
    80009f3c:	00006917          	auipc	s2,0x6
    80009f40:	5bc90913          	addi	s2,s2,1468 # 800104f8 <cons>
    80009f44:	00050493          	mv	s1,a0
    80009f48:	00090513          	mv	a0,s2
    80009f4c:	00001097          	auipc	ra,0x1
    80009f50:	e40080e7          	jalr	-448(ra) # 8000ad8c <acquire>
    80009f54:	02048c63          	beqz	s1,80009f8c <consoleintr+0x68>
    80009f58:	0a092783          	lw	a5,160(s2)
    80009f5c:	09892703          	lw	a4,152(s2)
    80009f60:	07f00693          	li	a3,127
    80009f64:	40e7873b          	subw	a4,a5,a4
    80009f68:	02e6e263          	bltu	a3,a4,80009f8c <consoleintr+0x68>
    80009f6c:	00d00713          	li	a4,13
    80009f70:	04e48063          	beq	s1,a4,80009fb0 <consoleintr+0x8c>
    80009f74:	07f7f713          	andi	a4,a5,127
    80009f78:	00e90733          	add	a4,s2,a4
    80009f7c:	0017879b          	addiw	a5,a5,1
    80009f80:	0af92023          	sw	a5,160(s2)
    80009f84:	00970c23          	sb	s1,24(a4)
    80009f88:	08f92e23          	sw	a5,156(s2)
    80009f8c:	01013403          	ld	s0,16(sp)
    80009f90:	01813083          	ld	ra,24(sp)
    80009f94:	00813483          	ld	s1,8(sp)
    80009f98:	00013903          	ld	s2,0(sp)
    80009f9c:	00006517          	auipc	a0,0x6
    80009fa0:	55c50513          	addi	a0,a0,1372 # 800104f8 <cons>
    80009fa4:	02010113          	addi	sp,sp,32
    80009fa8:	00001317          	auipc	t1,0x1
    80009fac:	eb030067          	jr	-336(t1) # 8000ae58 <release>
    80009fb0:	00a00493          	li	s1,10
    80009fb4:	fc1ff06f          	j	80009f74 <consoleintr+0x50>

0000000080009fb8 <consoleinit>:
    80009fb8:	fe010113          	addi	sp,sp,-32
    80009fbc:	00113c23          	sd	ra,24(sp)
    80009fc0:	00813823          	sd	s0,16(sp)
    80009fc4:	00913423          	sd	s1,8(sp)
    80009fc8:	02010413          	addi	s0,sp,32
    80009fcc:	00006497          	auipc	s1,0x6
    80009fd0:	52c48493          	addi	s1,s1,1324 # 800104f8 <cons>
    80009fd4:	00048513          	mv	a0,s1
    80009fd8:	00003597          	auipc	a1,0x3
    80009fdc:	b3058593          	addi	a1,a1,-1232 # 8000cb08 <CONSOLE_STATUS+0xaf8>
    80009fe0:	00001097          	auipc	ra,0x1
    80009fe4:	d88080e7          	jalr	-632(ra) # 8000ad68 <initlock>
    80009fe8:	00000097          	auipc	ra,0x0
    80009fec:	7ac080e7          	jalr	1964(ra) # 8000a794 <uartinit>
    80009ff0:	01813083          	ld	ra,24(sp)
    80009ff4:	01013403          	ld	s0,16(sp)
    80009ff8:	00000797          	auipc	a5,0x0
    80009ffc:	d9c78793          	addi	a5,a5,-612 # 80009d94 <consoleread>
    8000a000:	0af4bc23          	sd	a5,184(s1)
    8000a004:	00000797          	auipc	a5,0x0
    8000a008:	cec78793          	addi	a5,a5,-788 # 80009cf0 <consolewrite>
    8000a00c:	0cf4b023          	sd	a5,192(s1)
    8000a010:	00813483          	ld	s1,8(sp)
    8000a014:	02010113          	addi	sp,sp,32
    8000a018:	00008067          	ret

000000008000a01c <console_read>:
    8000a01c:	ff010113          	addi	sp,sp,-16
    8000a020:	00813423          	sd	s0,8(sp)
    8000a024:	01010413          	addi	s0,sp,16
    8000a028:	00813403          	ld	s0,8(sp)
    8000a02c:	00006317          	auipc	t1,0x6
    8000a030:	58433303          	ld	t1,1412(t1) # 800105b0 <devsw+0x10>
    8000a034:	01010113          	addi	sp,sp,16
    8000a038:	00030067          	jr	t1

000000008000a03c <console_write>:
    8000a03c:	ff010113          	addi	sp,sp,-16
    8000a040:	00813423          	sd	s0,8(sp)
    8000a044:	01010413          	addi	s0,sp,16
    8000a048:	00813403          	ld	s0,8(sp)
    8000a04c:	00006317          	auipc	t1,0x6
    8000a050:	56c33303          	ld	t1,1388(t1) # 800105b8 <devsw+0x18>
    8000a054:	01010113          	addi	sp,sp,16
    8000a058:	00030067          	jr	t1

000000008000a05c <panic>:
    8000a05c:	fe010113          	addi	sp,sp,-32
    8000a060:	00113c23          	sd	ra,24(sp)
    8000a064:	00813823          	sd	s0,16(sp)
    8000a068:	00913423          	sd	s1,8(sp)
    8000a06c:	02010413          	addi	s0,sp,32
    8000a070:	00050493          	mv	s1,a0
    8000a074:	00003517          	auipc	a0,0x3
    8000a078:	a9c50513          	addi	a0,a0,-1380 # 8000cb10 <CONSOLE_STATUS+0xb00>
    8000a07c:	00006797          	auipc	a5,0x6
    8000a080:	5c07ae23          	sw	zero,1500(a5) # 80010658 <pr+0x18>
    8000a084:	00000097          	auipc	ra,0x0
    8000a088:	034080e7          	jalr	52(ra) # 8000a0b8 <__printf>
    8000a08c:	00048513          	mv	a0,s1
    8000a090:	00000097          	auipc	ra,0x0
    8000a094:	028080e7          	jalr	40(ra) # 8000a0b8 <__printf>
    8000a098:	00002517          	auipc	a0,0x2
    8000a09c:	7d050513          	addi	a0,a0,2000 # 8000c868 <CONSOLE_STATUS+0x858>
    8000a0a0:	00000097          	auipc	ra,0x0
    8000a0a4:	018080e7          	jalr	24(ra) # 8000a0b8 <__printf>
    8000a0a8:	00100793          	li	a5,1
    8000a0ac:	00005717          	auipc	a4,0x5
    8000a0b0:	28f72623          	sw	a5,652(a4) # 8000f338 <panicked>
    8000a0b4:	0000006f          	j	8000a0b4 <panic+0x58>

000000008000a0b8 <__printf>:
    8000a0b8:	f3010113          	addi	sp,sp,-208
    8000a0bc:	08813023          	sd	s0,128(sp)
    8000a0c0:	07313423          	sd	s3,104(sp)
    8000a0c4:	09010413          	addi	s0,sp,144
    8000a0c8:	05813023          	sd	s8,64(sp)
    8000a0cc:	08113423          	sd	ra,136(sp)
    8000a0d0:	06913c23          	sd	s1,120(sp)
    8000a0d4:	07213823          	sd	s2,112(sp)
    8000a0d8:	07413023          	sd	s4,96(sp)
    8000a0dc:	05513c23          	sd	s5,88(sp)
    8000a0e0:	05613823          	sd	s6,80(sp)
    8000a0e4:	05713423          	sd	s7,72(sp)
    8000a0e8:	03913c23          	sd	s9,56(sp)
    8000a0ec:	03a13823          	sd	s10,48(sp)
    8000a0f0:	03b13423          	sd	s11,40(sp)
    8000a0f4:	00006317          	auipc	t1,0x6
    8000a0f8:	54c30313          	addi	t1,t1,1356 # 80010640 <pr>
    8000a0fc:	01832c03          	lw	s8,24(t1)
    8000a100:	00b43423          	sd	a1,8(s0)
    8000a104:	00c43823          	sd	a2,16(s0)
    8000a108:	00d43c23          	sd	a3,24(s0)
    8000a10c:	02e43023          	sd	a4,32(s0)
    8000a110:	02f43423          	sd	a5,40(s0)
    8000a114:	03043823          	sd	a6,48(s0)
    8000a118:	03143c23          	sd	a7,56(s0)
    8000a11c:	00050993          	mv	s3,a0
    8000a120:	4a0c1663          	bnez	s8,8000a5cc <__printf+0x514>
    8000a124:	60098c63          	beqz	s3,8000a73c <__printf+0x684>
    8000a128:	0009c503          	lbu	a0,0(s3)
    8000a12c:	00840793          	addi	a5,s0,8
    8000a130:	f6f43c23          	sd	a5,-136(s0)
    8000a134:	00000493          	li	s1,0
    8000a138:	22050063          	beqz	a0,8000a358 <__printf+0x2a0>
    8000a13c:	00002a37          	lui	s4,0x2
    8000a140:	00018ab7          	lui	s5,0x18
    8000a144:	000f4b37          	lui	s6,0xf4
    8000a148:	00989bb7          	lui	s7,0x989
    8000a14c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    8000a150:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    8000a154:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    8000a158:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000a15c:	00148c9b          	addiw	s9,s1,1
    8000a160:	02500793          	li	a5,37
    8000a164:	01998933          	add	s2,s3,s9
    8000a168:	38f51263          	bne	a0,a5,8000a4ec <__printf+0x434>
    8000a16c:	00094783          	lbu	a5,0(s2)
    8000a170:	00078c9b          	sext.w	s9,a5
    8000a174:	1e078263          	beqz	a5,8000a358 <__printf+0x2a0>
    8000a178:	0024849b          	addiw	s1,s1,2
    8000a17c:	07000713          	li	a4,112
    8000a180:	00998933          	add	s2,s3,s1
    8000a184:	38e78a63          	beq	a5,a4,8000a518 <__printf+0x460>
    8000a188:	20f76863          	bltu	a4,a5,8000a398 <__printf+0x2e0>
    8000a18c:	42a78863          	beq	a5,a0,8000a5bc <__printf+0x504>
    8000a190:	06400713          	li	a4,100
    8000a194:	40e79663          	bne	a5,a4,8000a5a0 <__printf+0x4e8>
    8000a198:	f7843783          	ld	a5,-136(s0)
    8000a19c:	0007a603          	lw	a2,0(a5)
    8000a1a0:	00878793          	addi	a5,a5,8
    8000a1a4:	f6f43c23          	sd	a5,-136(s0)
    8000a1a8:	42064a63          	bltz	a2,8000a5dc <__printf+0x524>
    8000a1ac:	00a00713          	li	a4,10
    8000a1b0:	02e677bb          	remuw	a5,a2,a4
    8000a1b4:	00003d97          	auipc	s11,0x3
    8000a1b8:	984d8d93          	addi	s11,s11,-1660 # 8000cb38 <digits>
    8000a1bc:	00900593          	li	a1,9
    8000a1c0:	0006051b          	sext.w	a0,a2
    8000a1c4:	00000c93          	li	s9,0
    8000a1c8:	02079793          	slli	a5,a5,0x20
    8000a1cc:	0207d793          	srli	a5,a5,0x20
    8000a1d0:	00fd87b3          	add	a5,s11,a5
    8000a1d4:	0007c783          	lbu	a5,0(a5)
    8000a1d8:	02e656bb          	divuw	a3,a2,a4
    8000a1dc:	f8f40023          	sb	a5,-128(s0)
    8000a1e0:	14c5d863          	bge	a1,a2,8000a330 <__printf+0x278>
    8000a1e4:	06300593          	li	a1,99
    8000a1e8:	00100c93          	li	s9,1
    8000a1ec:	02e6f7bb          	remuw	a5,a3,a4
    8000a1f0:	02079793          	slli	a5,a5,0x20
    8000a1f4:	0207d793          	srli	a5,a5,0x20
    8000a1f8:	00fd87b3          	add	a5,s11,a5
    8000a1fc:	0007c783          	lbu	a5,0(a5)
    8000a200:	02e6d73b          	divuw	a4,a3,a4
    8000a204:	f8f400a3          	sb	a5,-127(s0)
    8000a208:	12a5f463          	bgeu	a1,a0,8000a330 <__printf+0x278>
    8000a20c:	00a00693          	li	a3,10
    8000a210:	00900593          	li	a1,9
    8000a214:	02d777bb          	remuw	a5,a4,a3
    8000a218:	02079793          	slli	a5,a5,0x20
    8000a21c:	0207d793          	srli	a5,a5,0x20
    8000a220:	00fd87b3          	add	a5,s11,a5
    8000a224:	0007c503          	lbu	a0,0(a5)
    8000a228:	02d757bb          	divuw	a5,a4,a3
    8000a22c:	f8a40123          	sb	a0,-126(s0)
    8000a230:	48e5f263          	bgeu	a1,a4,8000a6b4 <__printf+0x5fc>
    8000a234:	06300513          	li	a0,99
    8000a238:	02d7f5bb          	remuw	a1,a5,a3
    8000a23c:	02059593          	slli	a1,a1,0x20
    8000a240:	0205d593          	srli	a1,a1,0x20
    8000a244:	00bd85b3          	add	a1,s11,a1
    8000a248:	0005c583          	lbu	a1,0(a1)
    8000a24c:	02d7d7bb          	divuw	a5,a5,a3
    8000a250:	f8b401a3          	sb	a1,-125(s0)
    8000a254:	48e57263          	bgeu	a0,a4,8000a6d8 <__printf+0x620>
    8000a258:	3e700513          	li	a0,999
    8000a25c:	02d7f5bb          	remuw	a1,a5,a3
    8000a260:	02059593          	slli	a1,a1,0x20
    8000a264:	0205d593          	srli	a1,a1,0x20
    8000a268:	00bd85b3          	add	a1,s11,a1
    8000a26c:	0005c583          	lbu	a1,0(a1)
    8000a270:	02d7d7bb          	divuw	a5,a5,a3
    8000a274:	f8b40223          	sb	a1,-124(s0)
    8000a278:	46e57663          	bgeu	a0,a4,8000a6e4 <__printf+0x62c>
    8000a27c:	02d7f5bb          	remuw	a1,a5,a3
    8000a280:	02059593          	slli	a1,a1,0x20
    8000a284:	0205d593          	srli	a1,a1,0x20
    8000a288:	00bd85b3          	add	a1,s11,a1
    8000a28c:	0005c583          	lbu	a1,0(a1)
    8000a290:	02d7d7bb          	divuw	a5,a5,a3
    8000a294:	f8b402a3          	sb	a1,-123(s0)
    8000a298:	46ea7863          	bgeu	s4,a4,8000a708 <__printf+0x650>
    8000a29c:	02d7f5bb          	remuw	a1,a5,a3
    8000a2a0:	02059593          	slli	a1,a1,0x20
    8000a2a4:	0205d593          	srli	a1,a1,0x20
    8000a2a8:	00bd85b3          	add	a1,s11,a1
    8000a2ac:	0005c583          	lbu	a1,0(a1)
    8000a2b0:	02d7d7bb          	divuw	a5,a5,a3
    8000a2b4:	f8b40323          	sb	a1,-122(s0)
    8000a2b8:	3eeaf863          	bgeu	s5,a4,8000a6a8 <__printf+0x5f0>
    8000a2bc:	02d7f5bb          	remuw	a1,a5,a3
    8000a2c0:	02059593          	slli	a1,a1,0x20
    8000a2c4:	0205d593          	srli	a1,a1,0x20
    8000a2c8:	00bd85b3          	add	a1,s11,a1
    8000a2cc:	0005c583          	lbu	a1,0(a1)
    8000a2d0:	02d7d7bb          	divuw	a5,a5,a3
    8000a2d4:	f8b403a3          	sb	a1,-121(s0)
    8000a2d8:	42eb7e63          	bgeu	s6,a4,8000a714 <__printf+0x65c>
    8000a2dc:	02d7f5bb          	remuw	a1,a5,a3
    8000a2e0:	02059593          	slli	a1,a1,0x20
    8000a2e4:	0205d593          	srli	a1,a1,0x20
    8000a2e8:	00bd85b3          	add	a1,s11,a1
    8000a2ec:	0005c583          	lbu	a1,0(a1)
    8000a2f0:	02d7d7bb          	divuw	a5,a5,a3
    8000a2f4:	f8b40423          	sb	a1,-120(s0)
    8000a2f8:	42ebfc63          	bgeu	s7,a4,8000a730 <__printf+0x678>
    8000a2fc:	02079793          	slli	a5,a5,0x20
    8000a300:	0207d793          	srli	a5,a5,0x20
    8000a304:	00fd8db3          	add	s11,s11,a5
    8000a308:	000dc703          	lbu	a4,0(s11)
    8000a30c:	00a00793          	li	a5,10
    8000a310:	00900c93          	li	s9,9
    8000a314:	f8e404a3          	sb	a4,-119(s0)
    8000a318:	00065c63          	bgez	a2,8000a330 <__printf+0x278>
    8000a31c:	f9040713          	addi	a4,s0,-112
    8000a320:	00f70733          	add	a4,a4,a5
    8000a324:	02d00693          	li	a3,45
    8000a328:	fed70823          	sb	a3,-16(a4)
    8000a32c:	00078c93          	mv	s9,a5
    8000a330:	f8040793          	addi	a5,s0,-128
    8000a334:	01978cb3          	add	s9,a5,s9
    8000a338:	f7f40d13          	addi	s10,s0,-129
    8000a33c:	000cc503          	lbu	a0,0(s9)
    8000a340:	fffc8c93          	addi	s9,s9,-1
    8000a344:	00000097          	auipc	ra,0x0
    8000a348:	b90080e7          	jalr	-1136(ra) # 80009ed4 <consputc>
    8000a34c:	ffac98e3          	bne	s9,s10,8000a33c <__printf+0x284>
    8000a350:	00094503          	lbu	a0,0(s2)
    8000a354:	e00514e3          	bnez	a0,8000a15c <__printf+0xa4>
    8000a358:	1a0c1663          	bnez	s8,8000a504 <__printf+0x44c>
    8000a35c:	08813083          	ld	ra,136(sp)
    8000a360:	08013403          	ld	s0,128(sp)
    8000a364:	07813483          	ld	s1,120(sp)
    8000a368:	07013903          	ld	s2,112(sp)
    8000a36c:	06813983          	ld	s3,104(sp)
    8000a370:	06013a03          	ld	s4,96(sp)
    8000a374:	05813a83          	ld	s5,88(sp)
    8000a378:	05013b03          	ld	s6,80(sp)
    8000a37c:	04813b83          	ld	s7,72(sp)
    8000a380:	04013c03          	ld	s8,64(sp)
    8000a384:	03813c83          	ld	s9,56(sp)
    8000a388:	03013d03          	ld	s10,48(sp)
    8000a38c:	02813d83          	ld	s11,40(sp)
    8000a390:	0d010113          	addi	sp,sp,208
    8000a394:	00008067          	ret
    8000a398:	07300713          	li	a4,115
    8000a39c:	1ce78a63          	beq	a5,a4,8000a570 <__printf+0x4b8>
    8000a3a0:	07800713          	li	a4,120
    8000a3a4:	1ee79e63          	bne	a5,a4,8000a5a0 <__printf+0x4e8>
    8000a3a8:	f7843783          	ld	a5,-136(s0)
    8000a3ac:	0007a703          	lw	a4,0(a5)
    8000a3b0:	00878793          	addi	a5,a5,8
    8000a3b4:	f6f43c23          	sd	a5,-136(s0)
    8000a3b8:	28074263          	bltz	a4,8000a63c <__printf+0x584>
    8000a3bc:	00002d97          	auipc	s11,0x2
    8000a3c0:	77cd8d93          	addi	s11,s11,1916 # 8000cb38 <digits>
    8000a3c4:	00f77793          	andi	a5,a4,15
    8000a3c8:	00fd87b3          	add	a5,s11,a5
    8000a3cc:	0007c683          	lbu	a3,0(a5)
    8000a3d0:	00f00613          	li	a2,15
    8000a3d4:	0007079b          	sext.w	a5,a4
    8000a3d8:	f8d40023          	sb	a3,-128(s0)
    8000a3dc:	0047559b          	srliw	a1,a4,0x4
    8000a3e0:	0047569b          	srliw	a3,a4,0x4
    8000a3e4:	00000c93          	li	s9,0
    8000a3e8:	0ee65063          	bge	a2,a4,8000a4c8 <__printf+0x410>
    8000a3ec:	00f6f693          	andi	a3,a3,15
    8000a3f0:	00dd86b3          	add	a3,s11,a3
    8000a3f4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    8000a3f8:	0087d79b          	srliw	a5,a5,0x8
    8000a3fc:	00100c93          	li	s9,1
    8000a400:	f8d400a3          	sb	a3,-127(s0)
    8000a404:	0cb67263          	bgeu	a2,a1,8000a4c8 <__printf+0x410>
    8000a408:	00f7f693          	andi	a3,a5,15
    8000a40c:	00dd86b3          	add	a3,s11,a3
    8000a410:	0006c583          	lbu	a1,0(a3)
    8000a414:	00f00613          	li	a2,15
    8000a418:	0047d69b          	srliw	a3,a5,0x4
    8000a41c:	f8b40123          	sb	a1,-126(s0)
    8000a420:	0047d593          	srli	a1,a5,0x4
    8000a424:	28f67e63          	bgeu	a2,a5,8000a6c0 <__printf+0x608>
    8000a428:	00f6f693          	andi	a3,a3,15
    8000a42c:	00dd86b3          	add	a3,s11,a3
    8000a430:	0006c503          	lbu	a0,0(a3)
    8000a434:	0087d813          	srli	a6,a5,0x8
    8000a438:	0087d69b          	srliw	a3,a5,0x8
    8000a43c:	f8a401a3          	sb	a0,-125(s0)
    8000a440:	28b67663          	bgeu	a2,a1,8000a6cc <__printf+0x614>
    8000a444:	00f6f693          	andi	a3,a3,15
    8000a448:	00dd86b3          	add	a3,s11,a3
    8000a44c:	0006c583          	lbu	a1,0(a3)
    8000a450:	00c7d513          	srli	a0,a5,0xc
    8000a454:	00c7d69b          	srliw	a3,a5,0xc
    8000a458:	f8b40223          	sb	a1,-124(s0)
    8000a45c:	29067a63          	bgeu	a2,a6,8000a6f0 <__printf+0x638>
    8000a460:	00f6f693          	andi	a3,a3,15
    8000a464:	00dd86b3          	add	a3,s11,a3
    8000a468:	0006c583          	lbu	a1,0(a3)
    8000a46c:	0107d813          	srli	a6,a5,0x10
    8000a470:	0107d69b          	srliw	a3,a5,0x10
    8000a474:	f8b402a3          	sb	a1,-123(s0)
    8000a478:	28a67263          	bgeu	a2,a0,8000a6fc <__printf+0x644>
    8000a47c:	00f6f693          	andi	a3,a3,15
    8000a480:	00dd86b3          	add	a3,s11,a3
    8000a484:	0006c683          	lbu	a3,0(a3)
    8000a488:	0147d79b          	srliw	a5,a5,0x14
    8000a48c:	f8d40323          	sb	a3,-122(s0)
    8000a490:	21067663          	bgeu	a2,a6,8000a69c <__printf+0x5e4>
    8000a494:	02079793          	slli	a5,a5,0x20
    8000a498:	0207d793          	srli	a5,a5,0x20
    8000a49c:	00fd8db3          	add	s11,s11,a5
    8000a4a0:	000dc683          	lbu	a3,0(s11)
    8000a4a4:	00800793          	li	a5,8
    8000a4a8:	00700c93          	li	s9,7
    8000a4ac:	f8d403a3          	sb	a3,-121(s0)
    8000a4b0:	00075c63          	bgez	a4,8000a4c8 <__printf+0x410>
    8000a4b4:	f9040713          	addi	a4,s0,-112
    8000a4b8:	00f70733          	add	a4,a4,a5
    8000a4bc:	02d00693          	li	a3,45
    8000a4c0:	fed70823          	sb	a3,-16(a4)
    8000a4c4:	00078c93          	mv	s9,a5
    8000a4c8:	f8040793          	addi	a5,s0,-128
    8000a4cc:	01978cb3          	add	s9,a5,s9
    8000a4d0:	f7f40d13          	addi	s10,s0,-129
    8000a4d4:	000cc503          	lbu	a0,0(s9)
    8000a4d8:	fffc8c93          	addi	s9,s9,-1
    8000a4dc:	00000097          	auipc	ra,0x0
    8000a4e0:	9f8080e7          	jalr	-1544(ra) # 80009ed4 <consputc>
    8000a4e4:	ff9d18e3          	bne	s10,s9,8000a4d4 <__printf+0x41c>
    8000a4e8:	0100006f          	j	8000a4f8 <__printf+0x440>
    8000a4ec:	00000097          	auipc	ra,0x0
    8000a4f0:	9e8080e7          	jalr	-1560(ra) # 80009ed4 <consputc>
    8000a4f4:	000c8493          	mv	s1,s9
    8000a4f8:	00094503          	lbu	a0,0(s2)
    8000a4fc:	c60510e3          	bnez	a0,8000a15c <__printf+0xa4>
    8000a500:	e40c0ee3          	beqz	s8,8000a35c <__printf+0x2a4>
    8000a504:	00006517          	auipc	a0,0x6
    8000a508:	13c50513          	addi	a0,a0,316 # 80010640 <pr>
    8000a50c:	00001097          	auipc	ra,0x1
    8000a510:	94c080e7          	jalr	-1716(ra) # 8000ae58 <release>
    8000a514:	e49ff06f          	j	8000a35c <__printf+0x2a4>
    8000a518:	f7843783          	ld	a5,-136(s0)
    8000a51c:	03000513          	li	a0,48
    8000a520:	01000d13          	li	s10,16
    8000a524:	00878713          	addi	a4,a5,8
    8000a528:	0007bc83          	ld	s9,0(a5)
    8000a52c:	f6e43c23          	sd	a4,-136(s0)
    8000a530:	00000097          	auipc	ra,0x0
    8000a534:	9a4080e7          	jalr	-1628(ra) # 80009ed4 <consputc>
    8000a538:	07800513          	li	a0,120
    8000a53c:	00000097          	auipc	ra,0x0
    8000a540:	998080e7          	jalr	-1640(ra) # 80009ed4 <consputc>
    8000a544:	00002d97          	auipc	s11,0x2
    8000a548:	5f4d8d93          	addi	s11,s11,1524 # 8000cb38 <digits>
    8000a54c:	03ccd793          	srli	a5,s9,0x3c
    8000a550:	00fd87b3          	add	a5,s11,a5
    8000a554:	0007c503          	lbu	a0,0(a5)
    8000a558:	fffd0d1b          	addiw	s10,s10,-1
    8000a55c:	004c9c93          	slli	s9,s9,0x4
    8000a560:	00000097          	auipc	ra,0x0
    8000a564:	974080e7          	jalr	-1676(ra) # 80009ed4 <consputc>
    8000a568:	fe0d12e3          	bnez	s10,8000a54c <__printf+0x494>
    8000a56c:	f8dff06f          	j	8000a4f8 <__printf+0x440>
    8000a570:	f7843783          	ld	a5,-136(s0)
    8000a574:	0007bc83          	ld	s9,0(a5)
    8000a578:	00878793          	addi	a5,a5,8
    8000a57c:	f6f43c23          	sd	a5,-136(s0)
    8000a580:	000c9a63          	bnez	s9,8000a594 <__printf+0x4dc>
    8000a584:	1080006f          	j	8000a68c <__printf+0x5d4>
    8000a588:	001c8c93          	addi	s9,s9,1
    8000a58c:	00000097          	auipc	ra,0x0
    8000a590:	948080e7          	jalr	-1720(ra) # 80009ed4 <consputc>
    8000a594:	000cc503          	lbu	a0,0(s9)
    8000a598:	fe0518e3          	bnez	a0,8000a588 <__printf+0x4d0>
    8000a59c:	f5dff06f          	j	8000a4f8 <__printf+0x440>
    8000a5a0:	02500513          	li	a0,37
    8000a5a4:	00000097          	auipc	ra,0x0
    8000a5a8:	930080e7          	jalr	-1744(ra) # 80009ed4 <consputc>
    8000a5ac:	000c8513          	mv	a0,s9
    8000a5b0:	00000097          	auipc	ra,0x0
    8000a5b4:	924080e7          	jalr	-1756(ra) # 80009ed4 <consputc>
    8000a5b8:	f41ff06f          	j	8000a4f8 <__printf+0x440>
    8000a5bc:	02500513          	li	a0,37
    8000a5c0:	00000097          	auipc	ra,0x0
    8000a5c4:	914080e7          	jalr	-1772(ra) # 80009ed4 <consputc>
    8000a5c8:	f31ff06f          	j	8000a4f8 <__printf+0x440>
    8000a5cc:	00030513          	mv	a0,t1
    8000a5d0:	00000097          	auipc	ra,0x0
    8000a5d4:	7bc080e7          	jalr	1980(ra) # 8000ad8c <acquire>
    8000a5d8:	b4dff06f          	j	8000a124 <__printf+0x6c>
    8000a5dc:	40c0053b          	negw	a0,a2
    8000a5e0:	00a00713          	li	a4,10
    8000a5e4:	02e576bb          	remuw	a3,a0,a4
    8000a5e8:	00002d97          	auipc	s11,0x2
    8000a5ec:	550d8d93          	addi	s11,s11,1360 # 8000cb38 <digits>
    8000a5f0:	ff700593          	li	a1,-9
    8000a5f4:	02069693          	slli	a3,a3,0x20
    8000a5f8:	0206d693          	srli	a3,a3,0x20
    8000a5fc:	00dd86b3          	add	a3,s11,a3
    8000a600:	0006c683          	lbu	a3,0(a3)
    8000a604:	02e557bb          	divuw	a5,a0,a4
    8000a608:	f8d40023          	sb	a3,-128(s0)
    8000a60c:	10b65e63          	bge	a2,a1,8000a728 <__printf+0x670>
    8000a610:	06300593          	li	a1,99
    8000a614:	02e7f6bb          	remuw	a3,a5,a4
    8000a618:	02069693          	slli	a3,a3,0x20
    8000a61c:	0206d693          	srli	a3,a3,0x20
    8000a620:	00dd86b3          	add	a3,s11,a3
    8000a624:	0006c683          	lbu	a3,0(a3)
    8000a628:	02e7d73b          	divuw	a4,a5,a4
    8000a62c:	00200793          	li	a5,2
    8000a630:	f8d400a3          	sb	a3,-127(s0)
    8000a634:	bca5ece3          	bltu	a1,a0,8000a20c <__printf+0x154>
    8000a638:	ce5ff06f          	j	8000a31c <__printf+0x264>
    8000a63c:	40e007bb          	negw	a5,a4
    8000a640:	00002d97          	auipc	s11,0x2
    8000a644:	4f8d8d93          	addi	s11,s11,1272 # 8000cb38 <digits>
    8000a648:	00f7f693          	andi	a3,a5,15
    8000a64c:	00dd86b3          	add	a3,s11,a3
    8000a650:	0006c583          	lbu	a1,0(a3)
    8000a654:	ff100613          	li	a2,-15
    8000a658:	0047d69b          	srliw	a3,a5,0x4
    8000a65c:	f8b40023          	sb	a1,-128(s0)
    8000a660:	0047d59b          	srliw	a1,a5,0x4
    8000a664:	0ac75e63          	bge	a4,a2,8000a720 <__printf+0x668>
    8000a668:	00f6f693          	andi	a3,a3,15
    8000a66c:	00dd86b3          	add	a3,s11,a3
    8000a670:	0006c603          	lbu	a2,0(a3)
    8000a674:	00f00693          	li	a3,15
    8000a678:	0087d79b          	srliw	a5,a5,0x8
    8000a67c:	f8c400a3          	sb	a2,-127(s0)
    8000a680:	d8b6e4e3          	bltu	a3,a1,8000a408 <__printf+0x350>
    8000a684:	00200793          	li	a5,2
    8000a688:	e2dff06f          	j	8000a4b4 <__printf+0x3fc>
    8000a68c:	00002c97          	auipc	s9,0x2
    8000a690:	48cc8c93          	addi	s9,s9,1164 # 8000cb18 <CONSOLE_STATUS+0xb08>
    8000a694:	02800513          	li	a0,40
    8000a698:	ef1ff06f          	j	8000a588 <__printf+0x4d0>
    8000a69c:	00700793          	li	a5,7
    8000a6a0:	00600c93          	li	s9,6
    8000a6a4:	e0dff06f          	j	8000a4b0 <__printf+0x3f8>
    8000a6a8:	00700793          	li	a5,7
    8000a6ac:	00600c93          	li	s9,6
    8000a6b0:	c69ff06f          	j	8000a318 <__printf+0x260>
    8000a6b4:	00300793          	li	a5,3
    8000a6b8:	00200c93          	li	s9,2
    8000a6bc:	c5dff06f          	j	8000a318 <__printf+0x260>
    8000a6c0:	00300793          	li	a5,3
    8000a6c4:	00200c93          	li	s9,2
    8000a6c8:	de9ff06f          	j	8000a4b0 <__printf+0x3f8>
    8000a6cc:	00400793          	li	a5,4
    8000a6d0:	00300c93          	li	s9,3
    8000a6d4:	dddff06f          	j	8000a4b0 <__printf+0x3f8>
    8000a6d8:	00400793          	li	a5,4
    8000a6dc:	00300c93          	li	s9,3
    8000a6e0:	c39ff06f          	j	8000a318 <__printf+0x260>
    8000a6e4:	00500793          	li	a5,5
    8000a6e8:	00400c93          	li	s9,4
    8000a6ec:	c2dff06f          	j	8000a318 <__printf+0x260>
    8000a6f0:	00500793          	li	a5,5
    8000a6f4:	00400c93          	li	s9,4
    8000a6f8:	db9ff06f          	j	8000a4b0 <__printf+0x3f8>
    8000a6fc:	00600793          	li	a5,6
    8000a700:	00500c93          	li	s9,5
    8000a704:	dadff06f          	j	8000a4b0 <__printf+0x3f8>
    8000a708:	00600793          	li	a5,6
    8000a70c:	00500c93          	li	s9,5
    8000a710:	c09ff06f          	j	8000a318 <__printf+0x260>
    8000a714:	00800793          	li	a5,8
    8000a718:	00700c93          	li	s9,7
    8000a71c:	bfdff06f          	j	8000a318 <__printf+0x260>
    8000a720:	00100793          	li	a5,1
    8000a724:	d91ff06f          	j	8000a4b4 <__printf+0x3fc>
    8000a728:	00100793          	li	a5,1
    8000a72c:	bf1ff06f          	j	8000a31c <__printf+0x264>
    8000a730:	00900793          	li	a5,9
    8000a734:	00800c93          	li	s9,8
    8000a738:	be1ff06f          	j	8000a318 <__printf+0x260>
    8000a73c:	00002517          	auipc	a0,0x2
    8000a740:	3e450513          	addi	a0,a0,996 # 8000cb20 <CONSOLE_STATUS+0xb10>
    8000a744:	00000097          	auipc	ra,0x0
    8000a748:	918080e7          	jalr	-1768(ra) # 8000a05c <panic>

000000008000a74c <printfinit>:
    8000a74c:	fe010113          	addi	sp,sp,-32
    8000a750:	00813823          	sd	s0,16(sp)
    8000a754:	00913423          	sd	s1,8(sp)
    8000a758:	00113c23          	sd	ra,24(sp)
    8000a75c:	02010413          	addi	s0,sp,32
    8000a760:	00006497          	auipc	s1,0x6
    8000a764:	ee048493          	addi	s1,s1,-288 # 80010640 <pr>
    8000a768:	00048513          	mv	a0,s1
    8000a76c:	00002597          	auipc	a1,0x2
    8000a770:	3c458593          	addi	a1,a1,964 # 8000cb30 <CONSOLE_STATUS+0xb20>
    8000a774:	00000097          	auipc	ra,0x0
    8000a778:	5f4080e7          	jalr	1524(ra) # 8000ad68 <initlock>
    8000a77c:	01813083          	ld	ra,24(sp)
    8000a780:	01013403          	ld	s0,16(sp)
    8000a784:	0004ac23          	sw	zero,24(s1)
    8000a788:	00813483          	ld	s1,8(sp)
    8000a78c:	02010113          	addi	sp,sp,32
    8000a790:	00008067          	ret

000000008000a794 <uartinit>:
    8000a794:	ff010113          	addi	sp,sp,-16
    8000a798:	00813423          	sd	s0,8(sp)
    8000a79c:	01010413          	addi	s0,sp,16
    8000a7a0:	100007b7          	lui	a5,0x10000
    8000a7a4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    8000a7a8:	f8000713          	li	a4,-128
    8000a7ac:	00e781a3          	sb	a4,3(a5)
    8000a7b0:	00300713          	li	a4,3
    8000a7b4:	00e78023          	sb	a4,0(a5)
    8000a7b8:	000780a3          	sb	zero,1(a5)
    8000a7bc:	00e781a3          	sb	a4,3(a5)
    8000a7c0:	00700693          	li	a3,7
    8000a7c4:	00d78123          	sb	a3,2(a5)
    8000a7c8:	00e780a3          	sb	a4,1(a5)
    8000a7cc:	00813403          	ld	s0,8(sp)
    8000a7d0:	01010113          	addi	sp,sp,16
    8000a7d4:	00008067          	ret

000000008000a7d8 <uartputc>:
    8000a7d8:	00005797          	auipc	a5,0x5
    8000a7dc:	b607a783          	lw	a5,-1184(a5) # 8000f338 <panicked>
    8000a7e0:	00078463          	beqz	a5,8000a7e8 <uartputc+0x10>
    8000a7e4:	0000006f          	j	8000a7e4 <uartputc+0xc>
    8000a7e8:	fd010113          	addi	sp,sp,-48
    8000a7ec:	02813023          	sd	s0,32(sp)
    8000a7f0:	00913c23          	sd	s1,24(sp)
    8000a7f4:	01213823          	sd	s2,16(sp)
    8000a7f8:	01313423          	sd	s3,8(sp)
    8000a7fc:	02113423          	sd	ra,40(sp)
    8000a800:	03010413          	addi	s0,sp,48
    8000a804:	00005917          	auipc	s2,0x5
    8000a808:	b3c90913          	addi	s2,s2,-1220 # 8000f340 <uart_tx_r>
    8000a80c:	00093783          	ld	a5,0(s2)
    8000a810:	00005497          	auipc	s1,0x5
    8000a814:	b3848493          	addi	s1,s1,-1224 # 8000f348 <uart_tx_w>
    8000a818:	0004b703          	ld	a4,0(s1)
    8000a81c:	02078693          	addi	a3,a5,32
    8000a820:	00050993          	mv	s3,a0
    8000a824:	02e69c63          	bne	a3,a4,8000a85c <uartputc+0x84>
    8000a828:	00001097          	auipc	ra,0x1
    8000a82c:	834080e7          	jalr	-1996(ra) # 8000b05c <push_on>
    8000a830:	00093783          	ld	a5,0(s2)
    8000a834:	0004b703          	ld	a4,0(s1)
    8000a838:	02078793          	addi	a5,a5,32
    8000a83c:	00e79463          	bne	a5,a4,8000a844 <uartputc+0x6c>
    8000a840:	0000006f          	j	8000a840 <uartputc+0x68>
    8000a844:	00001097          	auipc	ra,0x1
    8000a848:	88c080e7          	jalr	-1908(ra) # 8000b0d0 <pop_on>
    8000a84c:	00093783          	ld	a5,0(s2)
    8000a850:	0004b703          	ld	a4,0(s1)
    8000a854:	02078693          	addi	a3,a5,32
    8000a858:	fce688e3          	beq	a3,a4,8000a828 <uartputc+0x50>
    8000a85c:	01f77693          	andi	a3,a4,31
    8000a860:	00006597          	auipc	a1,0x6
    8000a864:	e0058593          	addi	a1,a1,-512 # 80010660 <uart_tx_buf>
    8000a868:	00d586b3          	add	a3,a1,a3
    8000a86c:	00170713          	addi	a4,a4,1
    8000a870:	01368023          	sb	s3,0(a3)
    8000a874:	00e4b023          	sd	a4,0(s1)
    8000a878:	10000637          	lui	a2,0x10000
    8000a87c:	02f71063          	bne	a4,a5,8000a89c <uartputc+0xc4>
    8000a880:	0340006f          	j	8000a8b4 <uartputc+0xdc>
    8000a884:	00074703          	lbu	a4,0(a4)
    8000a888:	00f93023          	sd	a5,0(s2)
    8000a88c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    8000a890:	00093783          	ld	a5,0(s2)
    8000a894:	0004b703          	ld	a4,0(s1)
    8000a898:	00f70e63          	beq	a4,a5,8000a8b4 <uartputc+0xdc>
    8000a89c:	00564683          	lbu	a3,5(a2)
    8000a8a0:	01f7f713          	andi	a4,a5,31
    8000a8a4:	00e58733          	add	a4,a1,a4
    8000a8a8:	0206f693          	andi	a3,a3,32
    8000a8ac:	00178793          	addi	a5,a5,1
    8000a8b0:	fc069ae3          	bnez	a3,8000a884 <uartputc+0xac>
    8000a8b4:	02813083          	ld	ra,40(sp)
    8000a8b8:	02013403          	ld	s0,32(sp)
    8000a8bc:	01813483          	ld	s1,24(sp)
    8000a8c0:	01013903          	ld	s2,16(sp)
    8000a8c4:	00813983          	ld	s3,8(sp)
    8000a8c8:	03010113          	addi	sp,sp,48
    8000a8cc:	00008067          	ret

000000008000a8d0 <uartputc_sync>:
    8000a8d0:	ff010113          	addi	sp,sp,-16
    8000a8d4:	00813423          	sd	s0,8(sp)
    8000a8d8:	01010413          	addi	s0,sp,16
    8000a8dc:	00005717          	auipc	a4,0x5
    8000a8e0:	a5c72703          	lw	a4,-1444(a4) # 8000f338 <panicked>
    8000a8e4:	02071663          	bnez	a4,8000a910 <uartputc_sync+0x40>
    8000a8e8:	00050793          	mv	a5,a0
    8000a8ec:	100006b7          	lui	a3,0x10000
    8000a8f0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    8000a8f4:	02077713          	andi	a4,a4,32
    8000a8f8:	fe070ce3          	beqz	a4,8000a8f0 <uartputc_sync+0x20>
    8000a8fc:	0ff7f793          	andi	a5,a5,255
    8000a900:	00f68023          	sb	a5,0(a3)
    8000a904:	00813403          	ld	s0,8(sp)
    8000a908:	01010113          	addi	sp,sp,16
    8000a90c:	00008067          	ret
    8000a910:	0000006f          	j	8000a910 <uartputc_sync+0x40>

000000008000a914 <uartstart>:
    8000a914:	ff010113          	addi	sp,sp,-16
    8000a918:	00813423          	sd	s0,8(sp)
    8000a91c:	01010413          	addi	s0,sp,16
    8000a920:	00005617          	auipc	a2,0x5
    8000a924:	a2060613          	addi	a2,a2,-1504 # 8000f340 <uart_tx_r>
    8000a928:	00005517          	auipc	a0,0x5
    8000a92c:	a2050513          	addi	a0,a0,-1504 # 8000f348 <uart_tx_w>
    8000a930:	00063783          	ld	a5,0(a2)
    8000a934:	00053703          	ld	a4,0(a0)
    8000a938:	04f70263          	beq	a4,a5,8000a97c <uartstart+0x68>
    8000a93c:	100005b7          	lui	a1,0x10000
    8000a940:	00006817          	auipc	a6,0x6
    8000a944:	d2080813          	addi	a6,a6,-736 # 80010660 <uart_tx_buf>
    8000a948:	01c0006f          	j	8000a964 <uartstart+0x50>
    8000a94c:	0006c703          	lbu	a4,0(a3)
    8000a950:	00f63023          	sd	a5,0(a2)
    8000a954:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000a958:	00063783          	ld	a5,0(a2)
    8000a95c:	00053703          	ld	a4,0(a0)
    8000a960:	00f70e63          	beq	a4,a5,8000a97c <uartstart+0x68>
    8000a964:	01f7f713          	andi	a4,a5,31
    8000a968:	00e806b3          	add	a3,a6,a4
    8000a96c:	0055c703          	lbu	a4,5(a1)
    8000a970:	00178793          	addi	a5,a5,1
    8000a974:	02077713          	andi	a4,a4,32
    8000a978:	fc071ae3          	bnez	a4,8000a94c <uartstart+0x38>
    8000a97c:	00813403          	ld	s0,8(sp)
    8000a980:	01010113          	addi	sp,sp,16
    8000a984:	00008067          	ret

000000008000a988 <uartgetc>:
    8000a988:	ff010113          	addi	sp,sp,-16
    8000a98c:	00813423          	sd	s0,8(sp)
    8000a990:	01010413          	addi	s0,sp,16
    8000a994:	10000737          	lui	a4,0x10000
    8000a998:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000a99c:	0017f793          	andi	a5,a5,1
    8000a9a0:	00078c63          	beqz	a5,8000a9b8 <uartgetc+0x30>
    8000a9a4:	00074503          	lbu	a0,0(a4)
    8000a9a8:	0ff57513          	andi	a0,a0,255
    8000a9ac:	00813403          	ld	s0,8(sp)
    8000a9b0:	01010113          	addi	sp,sp,16
    8000a9b4:	00008067          	ret
    8000a9b8:	fff00513          	li	a0,-1
    8000a9bc:	ff1ff06f          	j	8000a9ac <uartgetc+0x24>

000000008000a9c0 <uartintr>:
    8000a9c0:	100007b7          	lui	a5,0x10000
    8000a9c4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    8000a9c8:	0017f793          	andi	a5,a5,1
    8000a9cc:	0a078463          	beqz	a5,8000aa74 <uartintr+0xb4>
    8000a9d0:	fe010113          	addi	sp,sp,-32
    8000a9d4:	00813823          	sd	s0,16(sp)
    8000a9d8:	00913423          	sd	s1,8(sp)
    8000a9dc:	00113c23          	sd	ra,24(sp)
    8000a9e0:	02010413          	addi	s0,sp,32
    8000a9e4:	100004b7          	lui	s1,0x10000
    8000a9e8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000a9ec:	0ff57513          	andi	a0,a0,255
    8000a9f0:	fffff097          	auipc	ra,0xfffff
    8000a9f4:	534080e7          	jalr	1332(ra) # 80009f24 <consoleintr>
    8000a9f8:	0054c783          	lbu	a5,5(s1)
    8000a9fc:	0017f793          	andi	a5,a5,1
    8000aa00:	fe0794e3          	bnez	a5,8000a9e8 <uartintr+0x28>
    8000aa04:	00005617          	auipc	a2,0x5
    8000aa08:	93c60613          	addi	a2,a2,-1732 # 8000f340 <uart_tx_r>
    8000aa0c:	00005517          	auipc	a0,0x5
    8000aa10:	93c50513          	addi	a0,a0,-1732 # 8000f348 <uart_tx_w>
    8000aa14:	00063783          	ld	a5,0(a2)
    8000aa18:	00053703          	ld	a4,0(a0)
    8000aa1c:	04f70263          	beq	a4,a5,8000aa60 <uartintr+0xa0>
    8000aa20:	100005b7          	lui	a1,0x10000
    8000aa24:	00006817          	auipc	a6,0x6
    8000aa28:	c3c80813          	addi	a6,a6,-964 # 80010660 <uart_tx_buf>
    8000aa2c:	01c0006f          	j	8000aa48 <uartintr+0x88>
    8000aa30:	0006c703          	lbu	a4,0(a3)
    8000aa34:	00f63023          	sd	a5,0(a2)
    8000aa38:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000aa3c:	00063783          	ld	a5,0(a2)
    8000aa40:	00053703          	ld	a4,0(a0)
    8000aa44:	00f70e63          	beq	a4,a5,8000aa60 <uartintr+0xa0>
    8000aa48:	01f7f713          	andi	a4,a5,31
    8000aa4c:	00e806b3          	add	a3,a6,a4
    8000aa50:	0055c703          	lbu	a4,5(a1)
    8000aa54:	00178793          	addi	a5,a5,1
    8000aa58:	02077713          	andi	a4,a4,32
    8000aa5c:	fc071ae3          	bnez	a4,8000aa30 <uartintr+0x70>
    8000aa60:	01813083          	ld	ra,24(sp)
    8000aa64:	01013403          	ld	s0,16(sp)
    8000aa68:	00813483          	ld	s1,8(sp)
    8000aa6c:	02010113          	addi	sp,sp,32
    8000aa70:	00008067          	ret
    8000aa74:	00005617          	auipc	a2,0x5
    8000aa78:	8cc60613          	addi	a2,a2,-1844 # 8000f340 <uart_tx_r>
    8000aa7c:	00005517          	auipc	a0,0x5
    8000aa80:	8cc50513          	addi	a0,a0,-1844 # 8000f348 <uart_tx_w>
    8000aa84:	00063783          	ld	a5,0(a2)
    8000aa88:	00053703          	ld	a4,0(a0)
    8000aa8c:	04f70263          	beq	a4,a5,8000aad0 <uartintr+0x110>
    8000aa90:	100005b7          	lui	a1,0x10000
    8000aa94:	00006817          	auipc	a6,0x6
    8000aa98:	bcc80813          	addi	a6,a6,-1076 # 80010660 <uart_tx_buf>
    8000aa9c:	01c0006f          	j	8000aab8 <uartintr+0xf8>
    8000aaa0:	0006c703          	lbu	a4,0(a3)
    8000aaa4:	00f63023          	sd	a5,0(a2)
    8000aaa8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000aaac:	00063783          	ld	a5,0(a2)
    8000aab0:	00053703          	ld	a4,0(a0)
    8000aab4:	02f70063          	beq	a4,a5,8000aad4 <uartintr+0x114>
    8000aab8:	01f7f713          	andi	a4,a5,31
    8000aabc:	00e806b3          	add	a3,a6,a4
    8000aac0:	0055c703          	lbu	a4,5(a1)
    8000aac4:	00178793          	addi	a5,a5,1
    8000aac8:	02077713          	andi	a4,a4,32
    8000aacc:	fc071ae3          	bnez	a4,8000aaa0 <uartintr+0xe0>
    8000aad0:	00008067          	ret
    8000aad4:	00008067          	ret

000000008000aad8 <kinit>:
    8000aad8:	fc010113          	addi	sp,sp,-64
    8000aadc:	02913423          	sd	s1,40(sp)
    8000aae0:	fffff7b7          	lui	a5,0xfffff
    8000aae4:	00007497          	auipc	s1,0x7
    8000aae8:	b9b48493          	addi	s1,s1,-1125 # 8001167f <end+0xfff>
    8000aaec:	02813823          	sd	s0,48(sp)
    8000aaf0:	01313c23          	sd	s3,24(sp)
    8000aaf4:	00f4f4b3          	and	s1,s1,a5
    8000aaf8:	02113c23          	sd	ra,56(sp)
    8000aafc:	03213023          	sd	s2,32(sp)
    8000ab00:	01413823          	sd	s4,16(sp)
    8000ab04:	01513423          	sd	s5,8(sp)
    8000ab08:	04010413          	addi	s0,sp,64
    8000ab0c:	000017b7          	lui	a5,0x1
    8000ab10:	01100993          	li	s3,17
    8000ab14:	00f487b3          	add	a5,s1,a5
    8000ab18:	01b99993          	slli	s3,s3,0x1b
    8000ab1c:	06f9e063          	bltu	s3,a5,8000ab7c <kinit+0xa4>
    8000ab20:	00006a97          	auipc	s5,0x6
    8000ab24:	b60a8a93          	addi	s5,s5,-1184 # 80010680 <end>
    8000ab28:	0754ec63          	bltu	s1,s5,8000aba0 <kinit+0xc8>
    8000ab2c:	0734fa63          	bgeu	s1,s3,8000aba0 <kinit+0xc8>
    8000ab30:	00088a37          	lui	s4,0x88
    8000ab34:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    8000ab38:	00005917          	auipc	s2,0x5
    8000ab3c:	81890913          	addi	s2,s2,-2024 # 8000f350 <kmem>
    8000ab40:	00ca1a13          	slli	s4,s4,0xc
    8000ab44:	0140006f          	j	8000ab58 <kinit+0x80>
    8000ab48:	000017b7          	lui	a5,0x1
    8000ab4c:	00f484b3          	add	s1,s1,a5
    8000ab50:	0554e863          	bltu	s1,s5,8000aba0 <kinit+0xc8>
    8000ab54:	0534f663          	bgeu	s1,s3,8000aba0 <kinit+0xc8>
    8000ab58:	00001637          	lui	a2,0x1
    8000ab5c:	00100593          	li	a1,1
    8000ab60:	00048513          	mv	a0,s1
    8000ab64:	00000097          	auipc	ra,0x0
    8000ab68:	5e4080e7          	jalr	1508(ra) # 8000b148 <__memset>
    8000ab6c:	00093783          	ld	a5,0(s2)
    8000ab70:	00f4b023          	sd	a5,0(s1)
    8000ab74:	00993023          	sd	s1,0(s2)
    8000ab78:	fd4498e3          	bne	s1,s4,8000ab48 <kinit+0x70>
    8000ab7c:	03813083          	ld	ra,56(sp)
    8000ab80:	03013403          	ld	s0,48(sp)
    8000ab84:	02813483          	ld	s1,40(sp)
    8000ab88:	02013903          	ld	s2,32(sp)
    8000ab8c:	01813983          	ld	s3,24(sp)
    8000ab90:	01013a03          	ld	s4,16(sp)
    8000ab94:	00813a83          	ld	s5,8(sp)
    8000ab98:	04010113          	addi	sp,sp,64
    8000ab9c:	00008067          	ret
    8000aba0:	00002517          	auipc	a0,0x2
    8000aba4:	fb050513          	addi	a0,a0,-80 # 8000cb50 <digits+0x18>
    8000aba8:	fffff097          	auipc	ra,0xfffff
    8000abac:	4b4080e7          	jalr	1204(ra) # 8000a05c <panic>

000000008000abb0 <freerange>:
    8000abb0:	fc010113          	addi	sp,sp,-64
    8000abb4:	000017b7          	lui	a5,0x1
    8000abb8:	02913423          	sd	s1,40(sp)
    8000abbc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    8000abc0:	009504b3          	add	s1,a0,s1
    8000abc4:	fffff537          	lui	a0,0xfffff
    8000abc8:	02813823          	sd	s0,48(sp)
    8000abcc:	02113c23          	sd	ra,56(sp)
    8000abd0:	03213023          	sd	s2,32(sp)
    8000abd4:	01313c23          	sd	s3,24(sp)
    8000abd8:	01413823          	sd	s4,16(sp)
    8000abdc:	01513423          	sd	s5,8(sp)
    8000abe0:	01613023          	sd	s6,0(sp)
    8000abe4:	04010413          	addi	s0,sp,64
    8000abe8:	00a4f4b3          	and	s1,s1,a0
    8000abec:	00f487b3          	add	a5,s1,a5
    8000abf0:	06f5e463          	bltu	a1,a5,8000ac58 <freerange+0xa8>
    8000abf4:	00006a97          	auipc	s5,0x6
    8000abf8:	a8ca8a93          	addi	s5,s5,-1396 # 80010680 <end>
    8000abfc:	0954e263          	bltu	s1,s5,8000ac80 <freerange+0xd0>
    8000ac00:	01100993          	li	s3,17
    8000ac04:	01b99993          	slli	s3,s3,0x1b
    8000ac08:	0734fc63          	bgeu	s1,s3,8000ac80 <freerange+0xd0>
    8000ac0c:	00058a13          	mv	s4,a1
    8000ac10:	00004917          	auipc	s2,0x4
    8000ac14:	74090913          	addi	s2,s2,1856 # 8000f350 <kmem>
    8000ac18:	00002b37          	lui	s6,0x2
    8000ac1c:	0140006f          	j	8000ac30 <freerange+0x80>
    8000ac20:	000017b7          	lui	a5,0x1
    8000ac24:	00f484b3          	add	s1,s1,a5
    8000ac28:	0554ec63          	bltu	s1,s5,8000ac80 <freerange+0xd0>
    8000ac2c:	0534fa63          	bgeu	s1,s3,8000ac80 <freerange+0xd0>
    8000ac30:	00001637          	lui	a2,0x1
    8000ac34:	00100593          	li	a1,1
    8000ac38:	00048513          	mv	a0,s1
    8000ac3c:	00000097          	auipc	ra,0x0
    8000ac40:	50c080e7          	jalr	1292(ra) # 8000b148 <__memset>
    8000ac44:	00093703          	ld	a4,0(s2)
    8000ac48:	016487b3          	add	a5,s1,s6
    8000ac4c:	00e4b023          	sd	a4,0(s1)
    8000ac50:	00993023          	sd	s1,0(s2)
    8000ac54:	fcfa76e3          	bgeu	s4,a5,8000ac20 <freerange+0x70>
    8000ac58:	03813083          	ld	ra,56(sp)
    8000ac5c:	03013403          	ld	s0,48(sp)
    8000ac60:	02813483          	ld	s1,40(sp)
    8000ac64:	02013903          	ld	s2,32(sp)
    8000ac68:	01813983          	ld	s3,24(sp)
    8000ac6c:	01013a03          	ld	s4,16(sp)
    8000ac70:	00813a83          	ld	s5,8(sp)
    8000ac74:	00013b03          	ld	s6,0(sp)
    8000ac78:	04010113          	addi	sp,sp,64
    8000ac7c:	00008067          	ret
    8000ac80:	00002517          	auipc	a0,0x2
    8000ac84:	ed050513          	addi	a0,a0,-304 # 8000cb50 <digits+0x18>
    8000ac88:	fffff097          	auipc	ra,0xfffff
    8000ac8c:	3d4080e7          	jalr	980(ra) # 8000a05c <panic>

000000008000ac90 <kfree>:
    8000ac90:	fe010113          	addi	sp,sp,-32
    8000ac94:	00813823          	sd	s0,16(sp)
    8000ac98:	00113c23          	sd	ra,24(sp)
    8000ac9c:	00913423          	sd	s1,8(sp)
    8000aca0:	02010413          	addi	s0,sp,32
    8000aca4:	03451793          	slli	a5,a0,0x34
    8000aca8:	04079c63          	bnez	a5,8000ad00 <kfree+0x70>
    8000acac:	00006797          	auipc	a5,0x6
    8000acb0:	9d478793          	addi	a5,a5,-1580 # 80010680 <end>
    8000acb4:	00050493          	mv	s1,a0
    8000acb8:	04f56463          	bltu	a0,a5,8000ad00 <kfree+0x70>
    8000acbc:	01100793          	li	a5,17
    8000acc0:	01b79793          	slli	a5,a5,0x1b
    8000acc4:	02f57e63          	bgeu	a0,a5,8000ad00 <kfree+0x70>
    8000acc8:	00001637          	lui	a2,0x1
    8000accc:	00100593          	li	a1,1
    8000acd0:	00000097          	auipc	ra,0x0
    8000acd4:	478080e7          	jalr	1144(ra) # 8000b148 <__memset>
    8000acd8:	00004797          	auipc	a5,0x4
    8000acdc:	67878793          	addi	a5,a5,1656 # 8000f350 <kmem>
    8000ace0:	0007b703          	ld	a4,0(a5)
    8000ace4:	01813083          	ld	ra,24(sp)
    8000ace8:	01013403          	ld	s0,16(sp)
    8000acec:	00e4b023          	sd	a4,0(s1)
    8000acf0:	0097b023          	sd	s1,0(a5)
    8000acf4:	00813483          	ld	s1,8(sp)
    8000acf8:	02010113          	addi	sp,sp,32
    8000acfc:	00008067          	ret
    8000ad00:	00002517          	auipc	a0,0x2
    8000ad04:	e5050513          	addi	a0,a0,-432 # 8000cb50 <digits+0x18>
    8000ad08:	fffff097          	auipc	ra,0xfffff
    8000ad0c:	354080e7          	jalr	852(ra) # 8000a05c <panic>

000000008000ad10 <kalloc>:
    8000ad10:	fe010113          	addi	sp,sp,-32
    8000ad14:	00813823          	sd	s0,16(sp)
    8000ad18:	00913423          	sd	s1,8(sp)
    8000ad1c:	00113c23          	sd	ra,24(sp)
    8000ad20:	02010413          	addi	s0,sp,32
    8000ad24:	00004797          	auipc	a5,0x4
    8000ad28:	62c78793          	addi	a5,a5,1580 # 8000f350 <kmem>
    8000ad2c:	0007b483          	ld	s1,0(a5)
    8000ad30:	02048063          	beqz	s1,8000ad50 <kalloc+0x40>
    8000ad34:	0004b703          	ld	a4,0(s1)
    8000ad38:	00001637          	lui	a2,0x1
    8000ad3c:	00500593          	li	a1,5
    8000ad40:	00048513          	mv	a0,s1
    8000ad44:	00e7b023          	sd	a4,0(a5)
    8000ad48:	00000097          	auipc	ra,0x0
    8000ad4c:	400080e7          	jalr	1024(ra) # 8000b148 <__memset>
    8000ad50:	01813083          	ld	ra,24(sp)
    8000ad54:	01013403          	ld	s0,16(sp)
    8000ad58:	00048513          	mv	a0,s1
    8000ad5c:	00813483          	ld	s1,8(sp)
    8000ad60:	02010113          	addi	sp,sp,32
    8000ad64:	00008067          	ret

000000008000ad68 <initlock>:
    8000ad68:	ff010113          	addi	sp,sp,-16
    8000ad6c:	00813423          	sd	s0,8(sp)
    8000ad70:	01010413          	addi	s0,sp,16
    8000ad74:	00813403          	ld	s0,8(sp)
    8000ad78:	00b53423          	sd	a1,8(a0)
    8000ad7c:	00052023          	sw	zero,0(a0)
    8000ad80:	00053823          	sd	zero,16(a0)
    8000ad84:	01010113          	addi	sp,sp,16
    8000ad88:	00008067          	ret

000000008000ad8c <acquire>:
    8000ad8c:	fe010113          	addi	sp,sp,-32
    8000ad90:	00813823          	sd	s0,16(sp)
    8000ad94:	00913423          	sd	s1,8(sp)
    8000ad98:	00113c23          	sd	ra,24(sp)
    8000ad9c:	01213023          	sd	s2,0(sp)
    8000ada0:	02010413          	addi	s0,sp,32
    8000ada4:	00050493          	mv	s1,a0
    8000ada8:	10002973          	csrr	s2,sstatus
    8000adac:	100027f3          	csrr	a5,sstatus
    8000adb0:	ffd7f793          	andi	a5,a5,-3
    8000adb4:	10079073          	csrw	sstatus,a5
    8000adb8:	fffff097          	auipc	ra,0xfffff
    8000adbc:	8e8080e7          	jalr	-1816(ra) # 800096a0 <mycpu>
    8000adc0:	07852783          	lw	a5,120(a0)
    8000adc4:	06078e63          	beqz	a5,8000ae40 <acquire+0xb4>
    8000adc8:	fffff097          	auipc	ra,0xfffff
    8000adcc:	8d8080e7          	jalr	-1832(ra) # 800096a0 <mycpu>
    8000add0:	07852783          	lw	a5,120(a0)
    8000add4:	0004a703          	lw	a4,0(s1)
    8000add8:	0017879b          	addiw	a5,a5,1
    8000addc:	06f52c23          	sw	a5,120(a0)
    8000ade0:	04071063          	bnez	a4,8000ae20 <acquire+0x94>
    8000ade4:	00100713          	li	a4,1
    8000ade8:	00070793          	mv	a5,a4
    8000adec:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    8000adf0:	0007879b          	sext.w	a5,a5
    8000adf4:	fe079ae3          	bnez	a5,8000ade8 <acquire+0x5c>
    8000adf8:	0ff0000f          	fence
    8000adfc:	fffff097          	auipc	ra,0xfffff
    8000ae00:	8a4080e7          	jalr	-1884(ra) # 800096a0 <mycpu>
    8000ae04:	01813083          	ld	ra,24(sp)
    8000ae08:	01013403          	ld	s0,16(sp)
    8000ae0c:	00a4b823          	sd	a0,16(s1)
    8000ae10:	00013903          	ld	s2,0(sp)
    8000ae14:	00813483          	ld	s1,8(sp)
    8000ae18:	02010113          	addi	sp,sp,32
    8000ae1c:	00008067          	ret
    8000ae20:	0104b903          	ld	s2,16(s1)
    8000ae24:	fffff097          	auipc	ra,0xfffff
    8000ae28:	87c080e7          	jalr	-1924(ra) # 800096a0 <mycpu>
    8000ae2c:	faa91ce3          	bne	s2,a0,8000ade4 <acquire+0x58>
    8000ae30:	00002517          	auipc	a0,0x2
    8000ae34:	d2850513          	addi	a0,a0,-728 # 8000cb58 <digits+0x20>
    8000ae38:	fffff097          	auipc	ra,0xfffff
    8000ae3c:	224080e7          	jalr	548(ra) # 8000a05c <panic>
    8000ae40:	00195913          	srli	s2,s2,0x1
    8000ae44:	fffff097          	auipc	ra,0xfffff
    8000ae48:	85c080e7          	jalr	-1956(ra) # 800096a0 <mycpu>
    8000ae4c:	00197913          	andi	s2,s2,1
    8000ae50:	07252e23          	sw	s2,124(a0)
    8000ae54:	f75ff06f          	j	8000adc8 <acquire+0x3c>

000000008000ae58 <release>:
    8000ae58:	fe010113          	addi	sp,sp,-32
    8000ae5c:	00813823          	sd	s0,16(sp)
    8000ae60:	00113c23          	sd	ra,24(sp)
    8000ae64:	00913423          	sd	s1,8(sp)
    8000ae68:	01213023          	sd	s2,0(sp)
    8000ae6c:	02010413          	addi	s0,sp,32
    8000ae70:	00052783          	lw	a5,0(a0)
    8000ae74:	00079a63          	bnez	a5,8000ae88 <release+0x30>
    8000ae78:	00002517          	auipc	a0,0x2
    8000ae7c:	ce850513          	addi	a0,a0,-792 # 8000cb60 <digits+0x28>
    8000ae80:	fffff097          	auipc	ra,0xfffff
    8000ae84:	1dc080e7          	jalr	476(ra) # 8000a05c <panic>
    8000ae88:	01053903          	ld	s2,16(a0)
    8000ae8c:	00050493          	mv	s1,a0
    8000ae90:	fffff097          	auipc	ra,0xfffff
    8000ae94:	810080e7          	jalr	-2032(ra) # 800096a0 <mycpu>
    8000ae98:	fea910e3          	bne	s2,a0,8000ae78 <release+0x20>
    8000ae9c:	0004b823          	sd	zero,16(s1)
    8000aea0:	0ff0000f          	fence
    8000aea4:	0f50000f          	fence	iorw,ow
    8000aea8:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000aeac:	ffffe097          	auipc	ra,0xffffe
    8000aeb0:	7f4080e7          	jalr	2036(ra) # 800096a0 <mycpu>
    8000aeb4:	100027f3          	csrr	a5,sstatus
    8000aeb8:	0027f793          	andi	a5,a5,2
    8000aebc:	04079a63          	bnez	a5,8000af10 <release+0xb8>
    8000aec0:	07852783          	lw	a5,120(a0)
    8000aec4:	02f05e63          	blez	a5,8000af00 <release+0xa8>
    8000aec8:	fff7871b          	addiw	a4,a5,-1
    8000aecc:	06e52c23          	sw	a4,120(a0)
    8000aed0:	00071c63          	bnez	a4,8000aee8 <release+0x90>
    8000aed4:	07c52783          	lw	a5,124(a0)
    8000aed8:	00078863          	beqz	a5,8000aee8 <release+0x90>
    8000aedc:	100027f3          	csrr	a5,sstatus
    8000aee0:	0027e793          	ori	a5,a5,2
    8000aee4:	10079073          	csrw	sstatus,a5
    8000aee8:	01813083          	ld	ra,24(sp)
    8000aeec:	01013403          	ld	s0,16(sp)
    8000aef0:	00813483          	ld	s1,8(sp)
    8000aef4:	00013903          	ld	s2,0(sp)
    8000aef8:	02010113          	addi	sp,sp,32
    8000aefc:	00008067          	ret
    8000af00:	00002517          	auipc	a0,0x2
    8000af04:	c8050513          	addi	a0,a0,-896 # 8000cb80 <digits+0x48>
    8000af08:	fffff097          	auipc	ra,0xfffff
    8000af0c:	154080e7          	jalr	340(ra) # 8000a05c <panic>
    8000af10:	00002517          	auipc	a0,0x2
    8000af14:	c5850513          	addi	a0,a0,-936 # 8000cb68 <digits+0x30>
    8000af18:	fffff097          	auipc	ra,0xfffff
    8000af1c:	144080e7          	jalr	324(ra) # 8000a05c <panic>

000000008000af20 <holding>:
    8000af20:	00052783          	lw	a5,0(a0)
    8000af24:	00079663          	bnez	a5,8000af30 <holding+0x10>
    8000af28:	00000513          	li	a0,0
    8000af2c:	00008067          	ret
    8000af30:	fe010113          	addi	sp,sp,-32
    8000af34:	00813823          	sd	s0,16(sp)
    8000af38:	00913423          	sd	s1,8(sp)
    8000af3c:	00113c23          	sd	ra,24(sp)
    8000af40:	02010413          	addi	s0,sp,32
    8000af44:	01053483          	ld	s1,16(a0)
    8000af48:	ffffe097          	auipc	ra,0xffffe
    8000af4c:	758080e7          	jalr	1880(ra) # 800096a0 <mycpu>
    8000af50:	01813083          	ld	ra,24(sp)
    8000af54:	01013403          	ld	s0,16(sp)
    8000af58:	40a48533          	sub	a0,s1,a0
    8000af5c:	00153513          	seqz	a0,a0
    8000af60:	00813483          	ld	s1,8(sp)
    8000af64:	02010113          	addi	sp,sp,32
    8000af68:	00008067          	ret

000000008000af6c <push_off>:
    8000af6c:	fe010113          	addi	sp,sp,-32
    8000af70:	00813823          	sd	s0,16(sp)
    8000af74:	00113c23          	sd	ra,24(sp)
    8000af78:	00913423          	sd	s1,8(sp)
    8000af7c:	02010413          	addi	s0,sp,32
    8000af80:	100024f3          	csrr	s1,sstatus
    8000af84:	100027f3          	csrr	a5,sstatus
    8000af88:	ffd7f793          	andi	a5,a5,-3
    8000af8c:	10079073          	csrw	sstatus,a5
    8000af90:	ffffe097          	auipc	ra,0xffffe
    8000af94:	710080e7          	jalr	1808(ra) # 800096a0 <mycpu>
    8000af98:	07852783          	lw	a5,120(a0)
    8000af9c:	02078663          	beqz	a5,8000afc8 <push_off+0x5c>
    8000afa0:	ffffe097          	auipc	ra,0xffffe
    8000afa4:	700080e7          	jalr	1792(ra) # 800096a0 <mycpu>
    8000afa8:	07852783          	lw	a5,120(a0)
    8000afac:	01813083          	ld	ra,24(sp)
    8000afb0:	01013403          	ld	s0,16(sp)
    8000afb4:	0017879b          	addiw	a5,a5,1
    8000afb8:	06f52c23          	sw	a5,120(a0)
    8000afbc:	00813483          	ld	s1,8(sp)
    8000afc0:	02010113          	addi	sp,sp,32
    8000afc4:	00008067          	ret
    8000afc8:	0014d493          	srli	s1,s1,0x1
    8000afcc:	ffffe097          	auipc	ra,0xffffe
    8000afd0:	6d4080e7          	jalr	1748(ra) # 800096a0 <mycpu>
    8000afd4:	0014f493          	andi	s1,s1,1
    8000afd8:	06952e23          	sw	s1,124(a0)
    8000afdc:	fc5ff06f          	j	8000afa0 <push_off+0x34>

000000008000afe0 <pop_off>:
    8000afe0:	ff010113          	addi	sp,sp,-16
    8000afe4:	00813023          	sd	s0,0(sp)
    8000afe8:	00113423          	sd	ra,8(sp)
    8000afec:	01010413          	addi	s0,sp,16
    8000aff0:	ffffe097          	auipc	ra,0xffffe
    8000aff4:	6b0080e7          	jalr	1712(ra) # 800096a0 <mycpu>
    8000aff8:	100027f3          	csrr	a5,sstatus
    8000affc:	0027f793          	andi	a5,a5,2
    8000b000:	04079663          	bnez	a5,8000b04c <pop_off+0x6c>
    8000b004:	07852783          	lw	a5,120(a0)
    8000b008:	02f05a63          	blez	a5,8000b03c <pop_off+0x5c>
    8000b00c:	fff7871b          	addiw	a4,a5,-1
    8000b010:	06e52c23          	sw	a4,120(a0)
    8000b014:	00071c63          	bnez	a4,8000b02c <pop_off+0x4c>
    8000b018:	07c52783          	lw	a5,124(a0)
    8000b01c:	00078863          	beqz	a5,8000b02c <pop_off+0x4c>
    8000b020:	100027f3          	csrr	a5,sstatus
    8000b024:	0027e793          	ori	a5,a5,2
    8000b028:	10079073          	csrw	sstatus,a5
    8000b02c:	00813083          	ld	ra,8(sp)
    8000b030:	00013403          	ld	s0,0(sp)
    8000b034:	01010113          	addi	sp,sp,16
    8000b038:	00008067          	ret
    8000b03c:	00002517          	auipc	a0,0x2
    8000b040:	b4450513          	addi	a0,a0,-1212 # 8000cb80 <digits+0x48>
    8000b044:	fffff097          	auipc	ra,0xfffff
    8000b048:	018080e7          	jalr	24(ra) # 8000a05c <panic>
    8000b04c:	00002517          	auipc	a0,0x2
    8000b050:	b1c50513          	addi	a0,a0,-1252 # 8000cb68 <digits+0x30>
    8000b054:	fffff097          	auipc	ra,0xfffff
    8000b058:	008080e7          	jalr	8(ra) # 8000a05c <panic>

000000008000b05c <push_on>:
    8000b05c:	fe010113          	addi	sp,sp,-32
    8000b060:	00813823          	sd	s0,16(sp)
    8000b064:	00113c23          	sd	ra,24(sp)
    8000b068:	00913423          	sd	s1,8(sp)
    8000b06c:	02010413          	addi	s0,sp,32
    8000b070:	100024f3          	csrr	s1,sstatus
    8000b074:	100027f3          	csrr	a5,sstatus
    8000b078:	0027e793          	ori	a5,a5,2
    8000b07c:	10079073          	csrw	sstatus,a5
    8000b080:	ffffe097          	auipc	ra,0xffffe
    8000b084:	620080e7          	jalr	1568(ra) # 800096a0 <mycpu>
    8000b088:	07852783          	lw	a5,120(a0)
    8000b08c:	02078663          	beqz	a5,8000b0b8 <push_on+0x5c>
    8000b090:	ffffe097          	auipc	ra,0xffffe
    8000b094:	610080e7          	jalr	1552(ra) # 800096a0 <mycpu>
    8000b098:	07852783          	lw	a5,120(a0)
    8000b09c:	01813083          	ld	ra,24(sp)
    8000b0a0:	01013403          	ld	s0,16(sp)
    8000b0a4:	0017879b          	addiw	a5,a5,1
    8000b0a8:	06f52c23          	sw	a5,120(a0)
    8000b0ac:	00813483          	ld	s1,8(sp)
    8000b0b0:	02010113          	addi	sp,sp,32
    8000b0b4:	00008067          	ret
    8000b0b8:	0014d493          	srli	s1,s1,0x1
    8000b0bc:	ffffe097          	auipc	ra,0xffffe
    8000b0c0:	5e4080e7          	jalr	1508(ra) # 800096a0 <mycpu>
    8000b0c4:	0014f493          	andi	s1,s1,1
    8000b0c8:	06952e23          	sw	s1,124(a0)
    8000b0cc:	fc5ff06f          	j	8000b090 <push_on+0x34>

000000008000b0d0 <pop_on>:
    8000b0d0:	ff010113          	addi	sp,sp,-16
    8000b0d4:	00813023          	sd	s0,0(sp)
    8000b0d8:	00113423          	sd	ra,8(sp)
    8000b0dc:	01010413          	addi	s0,sp,16
    8000b0e0:	ffffe097          	auipc	ra,0xffffe
    8000b0e4:	5c0080e7          	jalr	1472(ra) # 800096a0 <mycpu>
    8000b0e8:	100027f3          	csrr	a5,sstatus
    8000b0ec:	0027f793          	andi	a5,a5,2
    8000b0f0:	04078463          	beqz	a5,8000b138 <pop_on+0x68>
    8000b0f4:	07852783          	lw	a5,120(a0)
    8000b0f8:	02f05863          	blez	a5,8000b128 <pop_on+0x58>
    8000b0fc:	fff7879b          	addiw	a5,a5,-1
    8000b100:	06f52c23          	sw	a5,120(a0)
    8000b104:	07853783          	ld	a5,120(a0)
    8000b108:	00079863          	bnez	a5,8000b118 <pop_on+0x48>
    8000b10c:	100027f3          	csrr	a5,sstatus
    8000b110:	ffd7f793          	andi	a5,a5,-3
    8000b114:	10079073          	csrw	sstatus,a5
    8000b118:	00813083          	ld	ra,8(sp)
    8000b11c:	00013403          	ld	s0,0(sp)
    8000b120:	01010113          	addi	sp,sp,16
    8000b124:	00008067          	ret
    8000b128:	00002517          	auipc	a0,0x2
    8000b12c:	a8050513          	addi	a0,a0,-1408 # 8000cba8 <digits+0x70>
    8000b130:	fffff097          	auipc	ra,0xfffff
    8000b134:	f2c080e7          	jalr	-212(ra) # 8000a05c <panic>
    8000b138:	00002517          	auipc	a0,0x2
    8000b13c:	a5050513          	addi	a0,a0,-1456 # 8000cb88 <digits+0x50>
    8000b140:	fffff097          	auipc	ra,0xfffff
    8000b144:	f1c080e7          	jalr	-228(ra) # 8000a05c <panic>

000000008000b148 <__memset>:
    8000b148:	ff010113          	addi	sp,sp,-16
    8000b14c:	00813423          	sd	s0,8(sp)
    8000b150:	01010413          	addi	s0,sp,16
    8000b154:	1a060e63          	beqz	a2,8000b310 <__memset+0x1c8>
    8000b158:	40a007b3          	neg	a5,a0
    8000b15c:	0077f793          	andi	a5,a5,7
    8000b160:	00778693          	addi	a3,a5,7
    8000b164:	00b00813          	li	a6,11
    8000b168:	0ff5f593          	andi	a1,a1,255
    8000b16c:	fff6071b          	addiw	a4,a2,-1
    8000b170:	1b06e663          	bltu	a3,a6,8000b31c <__memset+0x1d4>
    8000b174:	1cd76463          	bltu	a4,a3,8000b33c <__memset+0x1f4>
    8000b178:	1a078e63          	beqz	a5,8000b334 <__memset+0x1ec>
    8000b17c:	00b50023          	sb	a1,0(a0)
    8000b180:	00100713          	li	a4,1
    8000b184:	1ae78463          	beq	a5,a4,8000b32c <__memset+0x1e4>
    8000b188:	00b500a3          	sb	a1,1(a0)
    8000b18c:	00200713          	li	a4,2
    8000b190:	1ae78a63          	beq	a5,a4,8000b344 <__memset+0x1fc>
    8000b194:	00b50123          	sb	a1,2(a0)
    8000b198:	00300713          	li	a4,3
    8000b19c:	18e78463          	beq	a5,a4,8000b324 <__memset+0x1dc>
    8000b1a0:	00b501a3          	sb	a1,3(a0)
    8000b1a4:	00400713          	li	a4,4
    8000b1a8:	1ae78263          	beq	a5,a4,8000b34c <__memset+0x204>
    8000b1ac:	00b50223          	sb	a1,4(a0)
    8000b1b0:	00500713          	li	a4,5
    8000b1b4:	1ae78063          	beq	a5,a4,8000b354 <__memset+0x20c>
    8000b1b8:	00b502a3          	sb	a1,5(a0)
    8000b1bc:	00700713          	li	a4,7
    8000b1c0:	18e79e63          	bne	a5,a4,8000b35c <__memset+0x214>
    8000b1c4:	00b50323          	sb	a1,6(a0)
    8000b1c8:	00700e93          	li	t4,7
    8000b1cc:	00859713          	slli	a4,a1,0x8
    8000b1d0:	00e5e733          	or	a4,a1,a4
    8000b1d4:	01059e13          	slli	t3,a1,0x10
    8000b1d8:	01c76e33          	or	t3,a4,t3
    8000b1dc:	01859313          	slli	t1,a1,0x18
    8000b1e0:	006e6333          	or	t1,t3,t1
    8000b1e4:	02059893          	slli	a7,a1,0x20
    8000b1e8:	40f60e3b          	subw	t3,a2,a5
    8000b1ec:	011368b3          	or	a7,t1,a7
    8000b1f0:	02859813          	slli	a6,a1,0x28
    8000b1f4:	0108e833          	or	a6,a7,a6
    8000b1f8:	03059693          	slli	a3,a1,0x30
    8000b1fc:	003e589b          	srliw	a7,t3,0x3
    8000b200:	00d866b3          	or	a3,a6,a3
    8000b204:	03859713          	slli	a4,a1,0x38
    8000b208:	00389813          	slli	a6,a7,0x3
    8000b20c:	00f507b3          	add	a5,a0,a5
    8000b210:	00e6e733          	or	a4,a3,a4
    8000b214:	000e089b          	sext.w	a7,t3
    8000b218:	00f806b3          	add	a3,a6,a5
    8000b21c:	00e7b023          	sd	a4,0(a5)
    8000b220:	00878793          	addi	a5,a5,8
    8000b224:	fed79ce3          	bne	a5,a3,8000b21c <__memset+0xd4>
    8000b228:	ff8e7793          	andi	a5,t3,-8
    8000b22c:	0007871b          	sext.w	a4,a5
    8000b230:	01d787bb          	addw	a5,a5,t4
    8000b234:	0ce88e63          	beq	a7,a4,8000b310 <__memset+0x1c8>
    8000b238:	00f50733          	add	a4,a0,a5
    8000b23c:	00b70023          	sb	a1,0(a4)
    8000b240:	0017871b          	addiw	a4,a5,1
    8000b244:	0cc77663          	bgeu	a4,a2,8000b310 <__memset+0x1c8>
    8000b248:	00e50733          	add	a4,a0,a4
    8000b24c:	00b70023          	sb	a1,0(a4)
    8000b250:	0027871b          	addiw	a4,a5,2
    8000b254:	0ac77e63          	bgeu	a4,a2,8000b310 <__memset+0x1c8>
    8000b258:	00e50733          	add	a4,a0,a4
    8000b25c:	00b70023          	sb	a1,0(a4)
    8000b260:	0037871b          	addiw	a4,a5,3
    8000b264:	0ac77663          	bgeu	a4,a2,8000b310 <__memset+0x1c8>
    8000b268:	00e50733          	add	a4,a0,a4
    8000b26c:	00b70023          	sb	a1,0(a4)
    8000b270:	0047871b          	addiw	a4,a5,4
    8000b274:	08c77e63          	bgeu	a4,a2,8000b310 <__memset+0x1c8>
    8000b278:	00e50733          	add	a4,a0,a4
    8000b27c:	00b70023          	sb	a1,0(a4)
    8000b280:	0057871b          	addiw	a4,a5,5
    8000b284:	08c77663          	bgeu	a4,a2,8000b310 <__memset+0x1c8>
    8000b288:	00e50733          	add	a4,a0,a4
    8000b28c:	00b70023          	sb	a1,0(a4)
    8000b290:	0067871b          	addiw	a4,a5,6
    8000b294:	06c77e63          	bgeu	a4,a2,8000b310 <__memset+0x1c8>
    8000b298:	00e50733          	add	a4,a0,a4
    8000b29c:	00b70023          	sb	a1,0(a4)
    8000b2a0:	0077871b          	addiw	a4,a5,7
    8000b2a4:	06c77663          	bgeu	a4,a2,8000b310 <__memset+0x1c8>
    8000b2a8:	00e50733          	add	a4,a0,a4
    8000b2ac:	00b70023          	sb	a1,0(a4)
    8000b2b0:	0087871b          	addiw	a4,a5,8
    8000b2b4:	04c77e63          	bgeu	a4,a2,8000b310 <__memset+0x1c8>
    8000b2b8:	00e50733          	add	a4,a0,a4
    8000b2bc:	00b70023          	sb	a1,0(a4)
    8000b2c0:	0097871b          	addiw	a4,a5,9
    8000b2c4:	04c77663          	bgeu	a4,a2,8000b310 <__memset+0x1c8>
    8000b2c8:	00e50733          	add	a4,a0,a4
    8000b2cc:	00b70023          	sb	a1,0(a4)
    8000b2d0:	00a7871b          	addiw	a4,a5,10
    8000b2d4:	02c77e63          	bgeu	a4,a2,8000b310 <__memset+0x1c8>
    8000b2d8:	00e50733          	add	a4,a0,a4
    8000b2dc:	00b70023          	sb	a1,0(a4)
    8000b2e0:	00b7871b          	addiw	a4,a5,11
    8000b2e4:	02c77663          	bgeu	a4,a2,8000b310 <__memset+0x1c8>
    8000b2e8:	00e50733          	add	a4,a0,a4
    8000b2ec:	00b70023          	sb	a1,0(a4)
    8000b2f0:	00c7871b          	addiw	a4,a5,12
    8000b2f4:	00c77e63          	bgeu	a4,a2,8000b310 <__memset+0x1c8>
    8000b2f8:	00e50733          	add	a4,a0,a4
    8000b2fc:	00b70023          	sb	a1,0(a4)
    8000b300:	00d7879b          	addiw	a5,a5,13
    8000b304:	00c7f663          	bgeu	a5,a2,8000b310 <__memset+0x1c8>
    8000b308:	00f507b3          	add	a5,a0,a5
    8000b30c:	00b78023          	sb	a1,0(a5)
    8000b310:	00813403          	ld	s0,8(sp)
    8000b314:	01010113          	addi	sp,sp,16
    8000b318:	00008067          	ret
    8000b31c:	00b00693          	li	a3,11
    8000b320:	e55ff06f          	j	8000b174 <__memset+0x2c>
    8000b324:	00300e93          	li	t4,3
    8000b328:	ea5ff06f          	j	8000b1cc <__memset+0x84>
    8000b32c:	00100e93          	li	t4,1
    8000b330:	e9dff06f          	j	8000b1cc <__memset+0x84>
    8000b334:	00000e93          	li	t4,0
    8000b338:	e95ff06f          	j	8000b1cc <__memset+0x84>
    8000b33c:	00000793          	li	a5,0
    8000b340:	ef9ff06f          	j	8000b238 <__memset+0xf0>
    8000b344:	00200e93          	li	t4,2
    8000b348:	e85ff06f          	j	8000b1cc <__memset+0x84>
    8000b34c:	00400e93          	li	t4,4
    8000b350:	e7dff06f          	j	8000b1cc <__memset+0x84>
    8000b354:	00500e93          	li	t4,5
    8000b358:	e75ff06f          	j	8000b1cc <__memset+0x84>
    8000b35c:	00600e93          	li	t4,6
    8000b360:	e6dff06f          	j	8000b1cc <__memset+0x84>

000000008000b364 <__memmove>:
    8000b364:	ff010113          	addi	sp,sp,-16
    8000b368:	00813423          	sd	s0,8(sp)
    8000b36c:	01010413          	addi	s0,sp,16
    8000b370:	0e060863          	beqz	a2,8000b460 <__memmove+0xfc>
    8000b374:	fff6069b          	addiw	a3,a2,-1
    8000b378:	0006881b          	sext.w	a6,a3
    8000b37c:	0ea5e863          	bltu	a1,a0,8000b46c <__memmove+0x108>
    8000b380:	00758713          	addi	a4,a1,7
    8000b384:	00a5e7b3          	or	a5,a1,a0
    8000b388:	40a70733          	sub	a4,a4,a0
    8000b38c:	0077f793          	andi	a5,a5,7
    8000b390:	00f73713          	sltiu	a4,a4,15
    8000b394:	00174713          	xori	a4,a4,1
    8000b398:	0017b793          	seqz	a5,a5
    8000b39c:	00e7f7b3          	and	a5,a5,a4
    8000b3a0:	10078863          	beqz	a5,8000b4b0 <__memmove+0x14c>
    8000b3a4:	00900793          	li	a5,9
    8000b3a8:	1107f463          	bgeu	a5,a6,8000b4b0 <__memmove+0x14c>
    8000b3ac:	0036581b          	srliw	a6,a2,0x3
    8000b3b0:	fff8081b          	addiw	a6,a6,-1
    8000b3b4:	02081813          	slli	a6,a6,0x20
    8000b3b8:	01d85893          	srli	a7,a6,0x1d
    8000b3bc:	00858813          	addi	a6,a1,8
    8000b3c0:	00058793          	mv	a5,a1
    8000b3c4:	00050713          	mv	a4,a0
    8000b3c8:	01088833          	add	a6,a7,a6
    8000b3cc:	0007b883          	ld	a7,0(a5)
    8000b3d0:	00878793          	addi	a5,a5,8
    8000b3d4:	00870713          	addi	a4,a4,8
    8000b3d8:	ff173c23          	sd	a7,-8(a4)
    8000b3dc:	ff0798e3          	bne	a5,a6,8000b3cc <__memmove+0x68>
    8000b3e0:	ff867713          	andi	a4,a2,-8
    8000b3e4:	02071793          	slli	a5,a4,0x20
    8000b3e8:	0207d793          	srli	a5,a5,0x20
    8000b3ec:	00f585b3          	add	a1,a1,a5
    8000b3f0:	40e686bb          	subw	a3,a3,a4
    8000b3f4:	00f507b3          	add	a5,a0,a5
    8000b3f8:	06e60463          	beq	a2,a4,8000b460 <__memmove+0xfc>
    8000b3fc:	0005c703          	lbu	a4,0(a1)
    8000b400:	00e78023          	sb	a4,0(a5)
    8000b404:	04068e63          	beqz	a3,8000b460 <__memmove+0xfc>
    8000b408:	0015c603          	lbu	a2,1(a1)
    8000b40c:	00100713          	li	a4,1
    8000b410:	00c780a3          	sb	a2,1(a5)
    8000b414:	04e68663          	beq	a3,a4,8000b460 <__memmove+0xfc>
    8000b418:	0025c603          	lbu	a2,2(a1)
    8000b41c:	00200713          	li	a4,2
    8000b420:	00c78123          	sb	a2,2(a5)
    8000b424:	02e68e63          	beq	a3,a4,8000b460 <__memmove+0xfc>
    8000b428:	0035c603          	lbu	a2,3(a1)
    8000b42c:	00300713          	li	a4,3
    8000b430:	00c781a3          	sb	a2,3(a5)
    8000b434:	02e68663          	beq	a3,a4,8000b460 <__memmove+0xfc>
    8000b438:	0045c603          	lbu	a2,4(a1)
    8000b43c:	00400713          	li	a4,4
    8000b440:	00c78223          	sb	a2,4(a5)
    8000b444:	00e68e63          	beq	a3,a4,8000b460 <__memmove+0xfc>
    8000b448:	0055c603          	lbu	a2,5(a1)
    8000b44c:	00500713          	li	a4,5
    8000b450:	00c782a3          	sb	a2,5(a5)
    8000b454:	00e68663          	beq	a3,a4,8000b460 <__memmove+0xfc>
    8000b458:	0065c703          	lbu	a4,6(a1)
    8000b45c:	00e78323          	sb	a4,6(a5)
    8000b460:	00813403          	ld	s0,8(sp)
    8000b464:	01010113          	addi	sp,sp,16
    8000b468:	00008067          	ret
    8000b46c:	02061713          	slli	a4,a2,0x20
    8000b470:	02075713          	srli	a4,a4,0x20
    8000b474:	00e587b3          	add	a5,a1,a4
    8000b478:	f0f574e3          	bgeu	a0,a5,8000b380 <__memmove+0x1c>
    8000b47c:	02069613          	slli	a2,a3,0x20
    8000b480:	02065613          	srli	a2,a2,0x20
    8000b484:	fff64613          	not	a2,a2
    8000b488:	00e50733          	add	a4,a0,a4
    8000b48c:	00c78633          	add	a2,a5,a2
    8000b490:	fff7c683          	lbu	a3,-1(a5)
    8000b494:	fff78793          	addi	a5,a5,-1
    8000b498:	fff70713          	addi	a4,a4,-1
    8000b49c:	00d70023          	sb	a3,0(a4)
    8000b4a0:	fec798e3          	bne	a5,a2,8000b490 <__memmove+0x12c>
    8000b4a4:	00813403          	ld	s0,8(sp)
    8000b4a8:	01010113          	addi	sp,sp,16
    8000b4ac:	00008067          	ret
    8000b4b0:	02069713          	slli	a4,a3,0x20
    8000b4b4:	02075713          	srli	a4,a4,0x20
    8000b4b8:	00170713          	addi	a4,a4,1
    8000b4bc:	00e50733          	add	a4,a0,a4
    8000b4c0:	00050793          	mv	a5,a0
    8000b4c4:	0005c683          	lbu	a3,0(a1)
    8000b4c8:	00178793          	addi	a5,a5,1
    8000b4cc:	00158593          	addi	a1,a1,1
    8000b4d0:	fed78fa3          	sb	a3,-1(a5)
    8000b4d4:	fee798e3          	bne	a5,a4,8000b4c4 <__memmove+0x160>
    8000b4d8:	f89ff06f          	j	8000b460 <__memmove+0xfc>
	...
